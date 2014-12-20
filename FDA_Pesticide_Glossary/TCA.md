---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.053524, 0.6827386, -1.610237, 1, 0, 0, 1,
-2.991931, 0.5023287, -0.4129567, 1, 0.007843138, 0, 1,
-2.963548, 1.557719, -1.363767, 1, 0.01176471, 0, 1,
-2.917049, 0.4144524, -0.4906082, 1, 0.01960784, 0, 1,
-2.7327, -0.1573177, -1.77671, 1, 0.02352941, 0, 1,
-2.730251, -0.1495999, -2.845071, 1, 0.03137255, 0, 1,
-2.55838, -0.678696, -0.7000486, 1, 0.03529412, 0, 1,
-2.52319, 0.3800361, -0.7807886, 1, 0.04313726, 0, 1,
-2.512486, -0.1824739, -2.755771, 1, 0.04705882, 0, 1,
-2.430524, -1.672978, -3.490146, 1, 0.05490196, 0, 1,
-2.407738, -0.04453534, -1.653001, 1, 0.05882353, 0, 1,
-2.406981, -0.3602544, -0.778049, 1, 0.06666667, 0, 1,
-2.354131, 1.576707, -1.964807, 1, 0.07058824, 0, 1,
-2.350002, -0.5989983, -1.630112, 1, 0.07843138, 0, 1,
-2.330871, -0.8116018, -1.114952, 1, 0.08235294, 0, 1,
-2.315646, -0.2482312, -2.739429, 1, 0.09019608, 0, 1,
-2.260016, 0.7490209, -1.613281, 1, 0.09411765, 0, 1,
-2.225402, -0.7891881, -2.887142, 1, 0.1019608, 0, 1,
-2.209987, -0.3358676, -0.432872, 1, 0.1098039, 0, 1,
-2.204243, -0.4966948, -1.033124, 1, 0.1137255, 0, 1,
-2.191503, -1.873387, -2.847557, 1, 0.1215686, 0, 1,
-2.18817, 1.703015, -1.55466, 1, 0.1254902, 0, 1,
-2.184521, -0.3076143, -1.078009, 1, 0.1333333, 0, 1,
-2.14358, -0.2162501, -2.548571, 1, 0.1372549, 0, 1,
-2.141443, 0.5026224, -0.176052, 1, 0.145098, 0, 1,
-2.125716, 1.024269, -0.8445686, 1, 0.1490196, 0, 1,
-2.089768, -0.3149594, -2.061009, 1, 0.1568628, 0, 1,
-1.985784, -1.005918, -1.88274, 1, 0.1607843, 0, 1,
-1.966393, 0.6389249, -0.9659261, 1, 0.1686275, 0, 1,
-1.954075, -2.497567, -1.82262, 1, 0.172549, 0, 1,
-1.947157, 0.1905963, -1.726761, 1, 0.1803922, 0, 1,
-1.914985, -0.7796361, -1.170406, 1, 0.1843137, 0, 1,
-1.906938, -0.5991891, -2.509127, 1, 0.1921569, 0, 1,
-1.895761, -0.03024769, -2.692036, 1, 0.1960784, 0, 1,
-1.8829, 0.9601429, -0.6055216, 1, 0.2039216, 0, 1,
-1.877532, 0.8665925, -1.243984, 1, 0.2117647, 0, 1,
-1.876378, -0.3639413, -2.327452, 1, 0.2156863, 0, 1,
-1.855518, 0.2780645, -0.3696758, 1, 0.2235294, 0, 1,
-1.848865, 0.02273744, -1.686939, 1, 0.227451, 0, 1,
-1.842054, -0.3320271, -1.707044, 1, 0.2352941, 0, 1,
-1.838768, -1.072351, -2.609496, 1, 0.2392157, 0, 1,
-1.833395, 0.5740876, -0.5455585, 1, 0.2470588, 0, 1,
-1.80317, 1.115872, -0.5964937, 1, 0.2509804, 0, 1,
-1.788377, 0.4226865, -0.7013853, 1, 0.2588235, 0, 1,
-1.788367, 0.2074301, -1.309139, 1, 0.2627451, 0, 1,
-1.784656, -0.3997988, -0.8528883, 1, 0.2705882, 0, 1,
-1.778683, 1.837929, -0.1321258, 1, 0.2745098, 0, 1,
-1.774677, -0.7231053, -0.3217207, 1, 0.282353, 0, 1,
-1.748272, 0.6442304, -2.218822, 1, 0.2862745, 0, 1,
-1.740074, 0.09407713, -3.052499, 1, 0.2941177, 0, 1,
-1.721873, -0.9611348, -0.6412607, 1, 0.3019608, 0, 1,
-1.708035, -1.10402, -2.94648, 1, 0.3058824, 0, 1,
-1.707521, 1.998698, 0.3022735, 1, 0.3137255, 0, 1,
-1.697107, -0.804689, -2.224525, 1, 0.3176471, 0, 1,
-1.693148, -0.07345614, -3.311764, 1, 0.3254902, 0, 1,
-1.686606, 0.9333934, -0.7776892, 1, 0.3294118, 0, 1,
-1.683444, -1.494585, -2.695568, 1, 0.3372549, 0, 1,
-1.671413, -0.7706944, -1.080244, 1, 0.3411765, 0, 1,
-1.653367, 0.03042753, 0.3028969, 1, 0.3490196, 0, 1,
-1.641757, -1.026486, -2.650659, 1, 0.3529412, 0, 1,
-1.63436, 1.105492, -0.5461341, 1, 0.3607843, 0, 1,
-1.627085, 0.6198609, 0.7291074, 1, 0.3647059, 0, 1,
-1.619753, 0.2868975, -2.52843, 1, 0.372549, 0, 1,
-1.614392, -0.4633001, -2.001014, 1, 0.3764706, 0, 1,
-1.612135, -0.03634169, -0.6296919, 1, 0.3843137, 0, 1,
-1.603553, 0.5876142, 0.1953219, 1, 0.3882353, 0, 1,
-1.59576, 0.4420714, -0.08324747, 1, 0.3960784, 0, 1,
-1.58846, -0.9958965, -0.667511, 1, 0.4039216, 0, 1,
-1.582354, -1.319911, -3.647855, 1, 0.4078431, 0, 1,
-1.582229, 0.6385587, -0.2224085, 1, 0.4156863, 0, 1,
-1.527172, -0.6780273, -0.9628501, 1, 0.4196078, 0, 1,
-1.508876, 0.3099256, -1.862753, 1, 0.427451, 0, 1,
-1.499053, -0.09802969, -1.724619, 1, 0.4313726, 0, 1,
-1.488766, 0.5258412, -2.158241, 1, 0.4392157, 0, 1,
-1.478129, 1.039569, -0.1791807, 1, 0.4431373, 0, 1,
-1.477438, -0.7688124, -2.022532, 1, 0.4509804, 0, 1,
-1.467066, -0.004640652, -1.903858, 1, 0.454902, 0, 1,
-1.457963, -1.683826, -1.500754, 1, 0.4627451, 0, 1,
-1.449322, 0.9910048, -0.01886645, 1, 0.4666667, 0, 1,
-1.449154, -1.840076, -2.369006, 1, 0.4745098, 0, 1,
-1.448854, 1.147816, -0.1461526, 1, 0.4784314, 0, 1,
-1.446182, -1.643997, -3.128798, 1, 0.4862745, 0, 1,
-1.440141, -0.1077617, -2.226753, 1, 0.4901961, 0, 1,
-1.427042, 0.4525055, -1.109244, 1, 0.4980392, 0, 1,
-1.422579, 1.937338, -0.9833819, 1, 0.5058824, 0, 1,
-1.410462, -1.214683, -1.354803, 1, 0.509804, 0, 1,
-1.407378, 0.2404731, -2.109117, 1, 0.5176471, 0, 1,
-1.402365, -0.9970251, -0.6464688, 1, 0.5215687, 0, 1,
-1.401265, 1.15504, -2.094126, 1, 0.5294118, 0, 1,
-1.396832, -0.06905867, -1.689147, 1, 0.5333334, 0, 1,
-1.395121, -0.3148437, 0.6124946, 1, 0.5411765, 0, 1,
-1.371411, -0.5276496, -2.785297, 1, 0.5450981, 0, 1,
-1.360995, 1.075401, -1.383724, 1, 0.5529412, 0, 1,
-1.348226, -0.5977102, -1.761258, 1, 0.5568628, 0, 1,
-1.336517, 1.757188, -0.550148, 1, 0.5647059, 0, 1,
-1.335818, -0.807563, -1.641021, 1, 0.5686275, 0, 1,
-1.335804, 0.3655942, -0.8732912, 1, 0.5764706, 0, 1,
-1.335583, -0.5318792, -1.86446, 1, 0.5803922, 0, 1,
-1.326804, 1.253448, -0.5056937, 1, 0.5882353, 0, 1,
-1.325739, -1.214069, -1.828452, 1, 0.5921569, 0, 1,
-1.325508, -0.08510701, -1.653201, 1, 0.6, 0, 1,
-1.313437, 0.07385547, -2.286201, 1, 0.6078432, 0, 1,
-1.300105, -0.8888718, -1.764964, 1, 0.6117647, 0, 1,
-1.296859, 0.5456594, -1.356973, 1, 0.6196079, 0, 1,
-1.296634, 0.1426423, 0.002530156, 1, 0.6235294, 0, 1,
-1.295451, 0.9295034, -0.7157762, 1, 0.6313726, 0, 1,
-1.288556, -0.3179196, -2.475356, 1, 0.6352941, 0, 1,
-1.285664, 2.538642, -0.3181487, 1, 0.6431373, 0, 1,
-1.282319, -0.8564721, -2.10114, 1, 0.6470588, 0, 1,
-1.278819, -0.2669765, -2.065764, 1, 0.654902, 0, 1,
-1.270894, -0.4131953, -0.9741696, 1, 0.6588235, 0, 1,
-1.269659, -1.581637, -2.32507, 1, 0.6666667, 0, 1,
-1.268639, -0.01096157, -1.260721, 1, 0.6705883, 0, 1,
-1.265424, -2.018964, -3.404008, 1, 0.6784314, 0, 1,
-1.259086, 0.4515893, -0.3303888, 1, 0.682353, 0, 1,
-1.255226, -0.6952962, -2.055609, 1, 0.6901961, 0, 1,
-1.242572, 0.8494251, -2.373137, 1, 0.6941177, 0, 1,
-1.23911, -0.4204775, -1.427643, 1, 0.7019608, 0, 1,
-1.236254, 2.907337, 0.9916005, 1, 0.7098039, 0, 1,
-1.23059, -0.8521701, -2.819918, 1, 0.7137255, 0, 1,
-1.227161, 0.7298141, -1.352145, 1, 0.7215686, 0, 1,
-1.223756, -0.7572865, -2.51847, 1, 0.7254902, 0, 1,
-1.222972, -0.8120837, -2.518298, 1, 0.7333333, 0, 1,
-1.220117, 0.4808817, -1.51508, 1, 0.7372549, 0, 1,
-1.219896, -0.3386492, -1.459302, 1, 0.7450981, 0, 1,
-1.213967, -0.7680927, -1.753542, 1, 0.7490196, 0, 1,
-1.210916, -0.8454379, -1.984393, 1, 0.7568628, 0, 1,
-1.209331, -0.2006802, -1.765141, 1, 0.7607843, 0, 1,
-1.203884, 1.994675, -0.1688949, 1, 0.7686275, 0, 1,
-1.201027, -1.306934, -2.114298, 1, 0.772549, 0, 1,
-1.197567, 1.529475, -1.229666, 1, 0.7803922, 0, 1,
-1.194101, -0.1712162, -2.652111, 1, 0.7843137, 0, 1,
-1.190724, 0.6886106, -1.079098, 1, 0.7921569, 0, 1,
-1.189621, -1.479509, -3.809129, 1, 0.7960784, 0, 1,
-1.186216, 0.7343338, -1.917026, 1, 0.8039216, 0, 1,
-1.184618, -0.7334121, -0.2069196, 1, 0.8117647, 0, 1,
-1.182348, 0.9346156, 0.07769281, 1, 0.8156863, 0, 1,
-1.181651, 1.847624, -1.267158, 1, 0.8235294, 0, 1,
-1.181397, 0.8024502, -0.9195015, 1, 0.827451, 0, 1,
-1.163261, 0.03206809, -0.2119201, 1, 0.8352941, 0, 1,
-1.157002, -1.251557, -0.5543147, 1, 0.8392157, 0, 1,
-1.153668, 0.2859156, -1.896749, 1, 0.8470588, 0, 1,
-1.150858, -0.9553313, -4.016257, 1, 0.8509804, 0, 1,
-1.145459, 0.3909505, -0.2325778, 1, 0.8588235, 0, 1,
-1.1427, -1.071584, -3.727216, 1, 0.8627451, 0, 1,
-1.136693, 0.3444811, -1.147404, 1, 0.8705882, 0, 1,
-1.132952, -1.053229, -1.458267, 1, 0.8745098, 0, 1,
-1.13098, -2.051453, -3.683038, 1, 0.8823529, 0, 1,
-1.126583, -0.1106711, -3.002475, 1, 0.8862745, 0, 1,
-1.119765, -0.82596, -3.136583, 1, 0.8941177, 0, 1,
-1.118779, -0.8966317, -1.234688, 1, 0.8980392, 0, 1,
-1.092176, -1.048436, -1.32877, 1, 0.9058824, 0, 1,
-1.090836, -1.560049, -2.529117, 1, 0.9137255, 0, 1,
-1.087291, -0.3460923, -1.525743, 1, 0.9176471, 0, 1,
-1.08644, 0.3714635, -0.8507073, 1, 0.9254902, 0, 1,
-1.084963, 0.3756913, -1.619411, 1, 0.9294118, 0, 1,
-1.082785, -0.8101423, -1.198416, 1, 0.9372549, 0, 1,
-1.079144, -1.307545, -2.118193, 1, 0.9411765, 0, 1,
-1.073294, -0.2644791, -0.5675207, 1, 0.9490196, 0, 1,
-1.073112, -0.3938533, -3.629862, 1, 0.9529412, 0, 1,
-1.071434, 1.39277, -0.5763922, 1, 0.9607843, 0, 1,
-1.069086, 0.6331577, -1.696834, 1, 0.9647059, 0, 1,
-1.063942, 0.04857454, -2.816381, 1, 0.972549, 0, 1,
-1.063557, -0.9983671, -3.145256, 1, 0.9764706, 0, 1,
-1.063306, 0.7831979, -1.154178, 1, 0.9843137, 0, 1,
-1.060618, -1.90189, -2.898148, 1, 0.9882353, 0, 1,
-1.057063, -0.6175644, -2.335364, 1, 0.9960784, 0, 1,
-1.055761, 0.6153039, -0.429129, 0.9960784, 1, 0, 1,
-1.055718, 1.699847, -1.53925, 0.9921569, 1, 0, 1,
-1.055572, -0.6056857, -3.071938, 0.9843137, 1, 0, 1,
-1.05505, 1.056876, -1.12317, 0.9803922, 1, 0, 1,
-1.04765, -0.04789247, -1.95159, 0.972549, 1, 0, 1,
-1.046141, -0.856571, -2.702079, 0.9686275, 1, 0, 1,
-1.045859, 0.971819, -2.545616, 0.9607843, 1, 0, 1,
-1.040767, -0.1160112, -1.400279, 0.9568627, 1, 0, 1,
-1.03659, 0.02717981, -2.512602, 0.9490196, 1, 0, 1,
-1.02604, -0.7148432, -2.311063, 0.945098, 1, 0, 1,
-1.02585, -1.469462, -3.045807, 0.9372549, 1, 0, 1,
-1.013723, 1.157797, -1.701706, 0.9333333, 1, 0, 1,
-1.00686, 0.1463172, -2.006029, 0.9254902, 1, 0, 1,
-1.005774, 0.9671533, 0.2060023, 0.9215686, 1, 0, 1,
-1.004026, 0.2662441, -1.414088, 0.9137255, 1, 0, 1,
-1.001579, 0.8417728, -0.7966598, 0.9098039, 1, 0, 1,
-0.9993424, -1.060743, -2.306239, 0.9019608, 1, 0, 1,
-0.9973953, 0.3852336, 0.371953, 0.8941177, 1, 0, 1,
-0.9936132, 0.4242068, -0.9031222, 0.8901961, 1, 0, 1,
-0.9926164, -0.3033799, -0.4713341, 0.8823529, 1, 0, 1,
-0.9915981, 0.3010056, -0.3318979, 0.8784314, 1, 0, 1,
-0.9902697, 0.04640034, 0.169812, 0.8705882, 1, 0, 1,
-0.9889288, 0.2660259, -0.9278669, 0.8666667, 1, 0, 1,
-0.9858552, 1.510054, -1.154635, 0.8588235, 1, 0, 1,
-0.9763781, 1.92678, -0.5471351, 0.854902, 1, 0, 1,
-0.971305, 0.6289011, -0.6589585, 0.8470588, 1, 0, 1,
-0.9649867, 1.125376, -2.501057, 0.8431373, 1, 0, 1,
-0.9635383, 0.1406892, -0.8413908, 0.8352941, 1, 0, 1,
-0.9475729, -0.09416817, -0.8709537, 0.8313726, 1, 0, 1,
-0.9465068, -0.9271513, -1.791555, 0.8235294, 1, 0, 1,
-0.9400001, -0.435004, -2.029043, 0.8196079, 1, 0, 1,
-0.9379172, -0.1456937, -2.293817, 0.8117647, 1, 0, 1,
-0.9350109, -1.544445, -1.611193, 0.8078431, 1, 0, 1,
-0.9336873, 0.6942419, 0.3321778, 0.8, 1, 0, 1,
-0.9328805, 1.619881, -0.4718143, 0.7921569, 1, 0, 1,
-0.9322001, 1.004705, -1.013708, 0.7882353, 1, 0, 1,
-0.9309757, 0.547968, -0.4080897, 0.7803922, 1, 0, 1,
-0.929125, -0.296253, -2.721767, 0.7764706, 1, 0, 1,
-0.9176926, -0.401233, -2.300177, 0.7686275, 1, 0, 1,
-0.9053054, -0.3456503, -2.791132, 0.7647059, 1, 0, 1,
-0.8992096, -0.343016, -2.315334, 0.7568628, 1, 0, 1,
-0.8942049, 0.5898681, -0.06378239, 0.7529412, 1, 0, 1,
-0.8916316, 0.9051532, 1.84052, 0.7450981, 1, 0, 1,
-0.8836132, 0.9935144, -0.7021252, 0.7411765, 1, 0, 1,
-0.8810234, 0.01325772, -2.042375, 0.7333333, 1, 0, 1,
-0.8783265, -0.02241111, -0.7394696, 0.7294118, 1, 0, 1,
-0.8755841, -0.2312963, -2.986644, 0.7215686, 1, 0, 1,
-0.8698846, -0.2113941, 0.9266911, 0.7176471, 1, 0, 1,
-0.8681172, -0.02833534, -0.5172206, 0.7098039, 1, 0, 1,
-0.8576335, -0.5039633, -1.731873, 0.7058824, 1, 0, 1,
-0.8328635, 0.6551433, 1.2657, 0.6980392, 1, 0, 1,
-0.8296421, -1.355841, -2.877422, 0.6901961, 1, 0, 1,
-0.8284304, 0.7453904, -0.3560577, 0.6862745, 1, 0, 1,
-0.8229453, 0.2582605, -3.906114, 0.6784314, 1, 0, 1,
-0.8207687, -0.7988693, -1.905202, 0.6745098, 1, 0, 1,
-0.8114024, -2.357213, -4.096781, 0.6666667, 1, 0, 1,
-0.8093144, -2.128437, -2.906734, 0.6627451, 1, 0, 1,
-0.8079484, 1.089691, -0.9643481, 0.654902, 1, 0, 1,
-0.8013418, -0.7741439, -2.748174, 0.6509804, 1, 0, 1,
-0.8002689, 0.2491209, -0.5793952, 0.6431373, 1, 0, 1,
-0.7926126, -0.0478109, -1.304485, 0.6392157, 1, 0, 1,
-0.7908224, 0.1102361, -1.412312, 0.6313726, 1, 0, 1,
-0.7757307, 0.2185695, -1.67446, 0.627451, 1, 0, 1,
-0.7753849, -1.359054, -4.136159, 0.6196079, 1, 0, 1,
-0.7702326, -0.227411, -3.09488, 0.6156863, 1, 0, 1,
-0.7684755, 0.5796216, -0.8255469, 0.6078432, 1, 0, 1,
-0.7628425, -0.7396894, -2.351421, 0.6039216, 1, 0, 1,
-0.7520009, -0.6496298, -3.23048, 0.5960785, 1, 0, 1,
-0.7448615, 1.094443, -0.4736286, 0.5882353, 1, 0, 1,
-0.7431065, 0.534783, 0.06901713, 0.5843138, 1, 0, 1,
-0.7417427, 0.4239752, -0.4382025, 0.5764706, 1, 0, 1,
-0.7356525, 0.8042994, -0.6763892, 0.572549, 1, 0, 1,
-0.7352685, 0.7987401, -2.46804, 0.5647059, 1, 0, 1,
-0.7318259, -0.4912031, -2.413209, 0.5607843, 1, 0, 1,
-0.7279004, 1.688659, 0.5809477, 0.5529412, 1, 0, 1,
-0.7263882, -0.9296063, -2.58724, 0.5490196, 1, 0, 1,
-0.7239916, 0.831381, -2.469776, 0.5411765, 1, 0, 1,
-0.7208701, -2.020722, -1.920817, 0.5372549, 1, 0, 1,
-0.7183647, 0.5872045, -1.529287, 0.5294118, 1, 0, 1,
-0.7179633, -1.413434, -2.291925, 0.5254902, 1, 0, 1,
-0.7167279, 0.9846826, 0.2609815, 0.5176471, 1, 0, 1,
-0.7136851, -0.7477769, -3.821146, 0.5137255, 1, 0, 1,
-0.7133076, 2.045377, 0.8993555, 0.5058824, 1, 0, 1,
-0.7130949, 0.1522894, -1.217894, 0.5019608, 1, 0, 1,
-0.7119789, -1.849685, -2.024143, 0.4941176, 1, 0, 1,
-0.7119077, -0.05542955, -1.564703, 0.4862745, 1, 0, 1,
-0.7060972, -0.1328978, 1.208966, 0.4823529, 1, 0, 1,
-0.702298, -0.8951467, -2.772535, 0.4745098, 1, 0, 1,
-0.6957788, -0.3532882, -3.304105, 0.4705882, 1, 0, 1,
-0.6932715, -0.8473158, -0.002721021, 0.4627451, 1, 0, 1,
-0.678196, -0.3284961, -1.825562, 0.4588235, 1, 0, 1,
-0.6777691, -0.7084296, -3.57552, 0.4509804, 1, 0, 1,
-0.6776628, 0.2670355, -1.539232, 0.4470588, 1, 0, 1,
-0.6745242, -0.3264183, -2.325979, 0.4392157, 1, 0, 1,
-0.6639306, 0.5468901, -0.02895934, 0.4352941, 1, 0, 1,
-0.6632083, 0.3727324, -1.684495, 0.427451, 1, 0, 1,
-0.6631581, -0.1372931, -1.357205, 0.4235294, 1, 0, 1,
-0.6583794, -0.287203, -1.618986, 0.4156863, 1, 0, 1,
-0.656507, -0.1386822, -0.8267871, 0.4117647, 1, 0, 1,
-0.653985, 2.052268, -1.499534, 0.4039216, 1, 0, 1,
-0.6537985, -1.368509, -3.03919, 0.3960784, 1, 0, 1,
-0.6514023, 0.3017508, -0.2466766, 0.3921569, 1, 0, 1,
-0.6508871, -0.2168299, -2.965727, 0.3843137, 1, 0, 1,
-0.6478174, -0.7035917, -2.447805, 0.3803922, 1, 0, 1,
-0.6469726, 0.6503133, -0.7096937, 0.372549, 1, 0, 1,
-0.6466395, 0.049797, -3.645183, 0.3686275, 1, 0, 1,
-0.6376188, -1.543166, -2.476094, 0.3607843, 1, 0, 1,
-0.6372756, -0.8348292, -2.953189, 0.3568628, 1, 0, 1,
-0.634204, -1.448696, -3.049973, 0.3490196, 1, 0, 1,
-0.6333543, 0.7350255, 0.3578188, 0.345098, 1, 0, 1,
-0.63055, 0.4982572, -1.264057, 0.3372549, 1, 0, 1,
-0.6277735, -0.6797939, -1.913596, 0.3333333, 1, 0, 1,
-0.6263468, 0.3890971, -1.056248, 0.3254902, 1, 0, 1,
-0.6262534, 1.280239, -0.01952748, 0.3215686, 1, 0, 1,
-0.6235806, -0.2195394, -1.074247, 0.3137255, 1, 0, 1,
-0.6181744, 0.994179, 0.7276343, 0.3098039, 1, 0, 1,
-0.6152134, -0.130232, -0.3670992, 0.3019608, 1, 0, 1,
-0.613345, -0.9192957, -4.175601, 0.2941177, 1, 0, 1,
-0.6107594, -1.688894, -0.9716299, 0.2901961, 1, 0, 1,
-0.6089967, -0.1941389, -1.722512, 0.282353, 1, 0, 1,
-0.608628, 0.8408145, 0.2858549, 0.2784314, 1, 0, 1,
-0.6050171, -1.378377, -3.200632, 0.2705882, 1, 0, 1,
-0.6044123, -0.6559178, -1.837614, 0.2666667, 1, 0, 1,
-0.6033328, -1.472507, -2.043894, 0.2588235, 1, 0, 1,
-0.6012627, 0.07374585, -0.5943731, 0.254902, 1, 0, 1,
-0.6003296, 0.5881043, -1.388649, 0.2470588, 1, 0, 1,
-0.5994544, -0.4036681, -1.026353, 0.2431373, 1, 0, 1,
-0.5909716, 0.1194542, -2.734767, 0.2352941, 1, 0, 1,
-0.5884184, 0.881533, -1.530227, 0.2313726, 1, 0, 1,
-0.5810444, -0.7195564, -3.262498, 0.2235294, 1, 0, 1,
-0.5809442, -0.07009549, -2.251731, 0.2196078, 1, 0, 1,
-0.5795971, 0.6581596, -1.112267, 0.2117647, 1, 0, 1,
-0.5794451, 0.9527735, 0.9995075, 0.2078431, 1, 0, 1,
-0.5778813, 0.3944623, -1.76507, 0.2, 1, 0, 1,
-0.5699081, -1.042376, -1.852515, 0.1921569, 1, 0, 1,
-0.5679813, -0.447302, -2.294324, 0.1882353, 1, 0, 1,
-0.5676871, -1.630121, -1.674839, 0.1803922, 1, 0, 1,
-0.5658066, 0.7986588, -1.255153, 0.1764706, 1, 0, 1,
-0.564756, 0.2651296, -0.5476118, 0.1686275, 1, 0, 1,
-0.5627018, -0.3955508, -0.5820346, 0.1647059, 1, 0, 1,
-0.5618504, 0.3651591, -0.2865407, 0.1568628, 1, 0, 1,
-0.5591543, -1.240554, -2.74827, 0.1529412, 1, 0, 1,
-0.558655, 0.4775207, -1.959082, 0.145098, 1, 0, 1,
-0.5564972, -0.2144226, -2.341798, 0.1411765, 1, 0, 1,
-0.5553047, 0.1691492, -1.862122, 0.1333333, 1, 0, 1,
-0.5548163, 0.4708639, -0.3320301, 0.1294118, 1, 0, 1,
-0.5508627, -0.8097488, -3.879601, 0.1215686, 1, 0, 1,
-0.5502518, -0.8900259, -2.010633, 0.1176471, 1, 0, 1,
-0.5499244, -0.4883558, -1.589989, 0.1098039, 1, 0, 1,
-0.5489902, -0.7800974, -0.2630396, 0.1058824, 1, 0, 1,
-0.5428067, -0.007758379, -0.2504297, 0.09803922, 1, 0, 1,
-0.5392731, -0.4949122, -3.64054, 0.09019608, 1, 0, 1,
-0.5332592, -0.4229311, -2.54566, 0.08627451, 1, 0, 1,
-0.5293342, 0.2915117, -0.9510329, 0.07843138, 1, 0, 1,
-0.5263905, -0.3869492, -1.904098, 0.07450981, 1, 0, 1,
-0.5262522, 0.4351463, -1.241346, 0.06666667, 1, 0, 1,
-0.5244032, -0.7745982, -2.39192, 0.0627451, 1, 0, 1,
-0.5183705, -1.261284, -2.104443, 0.05490196, 1, 0, 1,
-0.5157824, -1.117853, -2.795739, 0.05098039, 1, 0, 1,
-0.5128582, -0.1027541, -3.722733, 0.04313726, 1, 0, 1,
-0.5126503, 0.1198212, -3.54134, 0.03921569, 1, 0, 1,
-0.5089716, -1.290124, -2.480839, 0.03137255, 1, 0, 1,
-0.5081191, -0.7462386, -0.9206979, 0.02745098, 1, 0, 1,
-0.5051929, -0.9263809, -1.617603, 0.01960784, 1, 0, 1,
-0.5049801, -0.5182974, -4.715102, 0.01568628, 1, 0, 1,
-0.5031583, 2.446929, -0.8865064, 0.007843138, 1, 0, 1,
-0.5030844, -1.252926, -3.074387, 0.003921569, 1, 0, 1,
-0.5018476, -0.3593103, -1.128934, 0, 1, 0.003921569, 1,
-0.496642, 1.108429, 0.5684695, 0, 1, 0.01176471, 1,
-0.496628, -0.03865007, -2.023043, 0, 1, 0.01568628, 1,
-0.4945828, 1.304761, 0.0324438, 0, 1, 0.02352941, 1,
-0.4936163, -1.044671, -2.939016, 0, 1, 0.02745098, 1,
-0.4856392, -1.133974, -3.062428, 0, 1, 0.03529412, 1,
-0.4850973, -1.577777, -3.619111, 0, 1, 0.03921569, 1,
-0.4824151, -0.08213202, -2.860092, 0, 1, 0.04705882, 1,
-0.4822659, -0.7200553, -2.390081, 0, 1, 0.05098039, 1,
-0.4794283, -0.1771271, -0.5463536, 0, 1, 0.05882353, 1,
-0.477317, -0.5865114, -1.416851, 0, 1, 0.0627451, 1,
-0.4770945, -1.256445, -1.465759, 0, 1, 0.07058824, 1,
-0.4738801, 0.9667991, 0.676689, 0, 1, 0.07450981, 1,
-0.4737704, -0.1671211, -3.772684, 0, 1, 0.08235294, 1,
-0.4704529, -0.5761219, -1.621781, 0, 1, 0.08627451, 1,
-0.4670669, 0.4311172, -0.037945, 0, 1, 0.09411765, 1,
-0.4658302, 0.1513557, -0.5773891, 0, 1, 0.1019608, 1,
-0.4652694, -0.4966596, -2.855413, 0, 1, 0.1058824, 1,
-0.463209, 0.5489639, 0.3022493, 0, 1, 0.1137255, 1,
-0.4628228, -0.04792565, -0.05588322, 0, 1, 0.1176471, 1,
-0.4609121, -0.6229764, -2.313127, 0, 1, 0.1254902, 1,
-0.4596985, -0.9942619, -3.387627, 0, 1, 0.1294118, 1,
-0.4553015, 0.8146014, 1.192283, 0, 1, 0.1372549, 1,
-0.4533509, -0.1291137, -1.918915, 0, 1, 0.1411765, 1,
-0.4533279, 0.9584982, -0.7730974, 0, 1, 0.1490196, 1,
-0.4512863, -0.5702057, -1.450676, 0, 1, 0.1529412, 1,
-0.4508666, 1.310609, 0.2532361, 0, 1, 0.1607843, 1,
-0.4503024, 1.283064, -0.7364352, 0, 1, 0.1647059, 1,
-0.4463544, -1.348728, -1.137473, 0, 1, 0.172549, 1,
-0.4451034, -1.312077, -3.786867, 0, 1, 0.1764706, 1,
-0.4450724, 0.2991545, -0.7954934, 0, 1, 0.1843137, 1,
-0.4447878, -1.688357, -5.275706, 0, 1, 0.1882353, 1,
-0.4421785, 1.148507, -1.084221, 0, 1, 0.1960784, 1,
-0.4412843, -0.890351, -3.167036, 0, 1, 0.2039216, 1,
-0.439148, 0.726317, -0.3180842, 0, 1, 0.2078431, 1,
-0.4383919, 0.8884545, 0.3749779, 0, 1, 0.2156863, 1,
-0.4358566, 0.6337036, 0.1230792, 0, 1, 0.2196078, 1,
-0.4336791, 0.6969606, 0.9331411, 0, 1, 0.227451, 1,
-0.4249208, -1.766066, -4.022951, 0, 1, 0.2313726, 1,
-0.4198735, -1.591149, -2.393737, 0, 1, 0.2392157, 1,
-0.4128585, 0.5525813, -2.053134, 0, 1, 0.2431373, 1,
-0.4083139, 1.892298, 0.4103159, 0, 1, 0.2509804, 1,
-0.4078124, -0.3635713, -1.060301, 0, 1, 0.254902, 1,
-0.4049809, 0.4438523, -0.4935004, 0, 1, 0.2627451, 1,
-0.4048688, -0.06455383, -0.7324144, 0, 1, 0.2666667, 1,
-0.4018199, -0.7576321, -2.887275, 0, 1, 0.2745098, 1,
-0.3995236, -1.445943, -3.603369, 0, 1, 0.2784314, 1,
-0.3993011, -0.3714933, -2.836024, 0, 1, 0.2862745, 1,
-0.3976656, 0.3622606, -1.276672, 0, 1, 0.2901961, 1,
-0.3973562, -0.2389604, -2.558331, 0, 1, 0.2980392, 1,
-0.3968751, 0.5278984, 0.8171473, 0, 1, 0.3058824, 1,
-0.3923869, -0.3102649, -0.05363197, 0, 1, 0.3098039, 1,
-0.3866139, -0.2122314, -3.092067, 0, 1, 0.3176471, 1,
-0.3826126, 0.460565, -2.270692, 0, 1, 0.3215686, 1,
-0.3753682, -0.04721851, -2.418916, 0, 1, 0.3294118, 1,
-0.3695724, 0.6463459, -1.445691, 0, 1, 0.3333333, 1,
-0.3643404, -2.761018, -4.043092, 0, 1, 0.3411765, 1,
-0.3577568, -1.392444, -4.157787, 0, 1, 0.345098, 1,
-0.3505297, -1.14717, -2.974309, 0, 1, 0.3529412, 1,
-0.3494154, 0.3025044, 0.569683, 0, 1, 0.3568628, 1,
-0.347645, -0.7132136, -1.884192, 0, 1, 0.3647059, 1,
-0.3472233, 0.6326503, 0.2112388, 0, 1, 0.3686275, 1,
-0.3459942, -1.717913, -2.715684, 0, 1, 0.3764706, 1,
-0.3325768, 0.4347177, -0.1903589, 0, 1, 0.3803922, 1,
-0.3306852, 0.3611226, -0.8506122, 0, 1, 0.3882353, 1,
-0.3292289, 0.5417572, -1.007925, 0, 1, 0.3921569, 1,
-0.3276294, 1.043121, -2.559893, 0, 1, 0.4, 1,
-0.3253332, 0.6557559, 0.04869498, 0, 1, 0.4078431, 1,
-0.3230053, -0.2746919, -3.498292, 0, 1, 0.4117647, 1,
-0.3172089, 0.5060189, 0.4770057, 0, 1, 0.4196078, 1,
-0.315934, -0.1660992, -2.112959, 0, 1, 0.4235294, 1,
-0.3151237, -0.3971568, -0.6896124, 0, 1, 0.4313726, 1,
-0.3143022, 0.09434144, -0.2301989, 0, 1, 0.4352941, 1,
-0.3106855, -0.132637, -2.086543, 0, 1, 0.4431373, 1,
-0.3088109, -1.39112, -5.066271, 0, 1, 0.4470588, 1,
-0.3085827, 0.7791405, -1.934084, 0, 1, 0.454902, 1,
-0.3073588, -0.4100227, -1.562103, 0, 1, 0.4588235, 1,
-0.3051794, 0.1126169, -1.120636, 0, 1, 0.4666667, 1,
-0.3045351, 1.113894, -0.5995766, 0, 1, 0.4705882, 1,
-0.2980246, 2.220994, -0.72654, 0, 1, 0.4784314, 1,
-0.2941997, 2.255765, -0.09938163, 0, 1, 0.4823529, 1,
-0.2914614, -0.9287379, -2.878842, 0, 1, 0.4901961, 1,
-0.2901582, 0.5188794, -1.228605, 0, 1, 0.4941176, 1,
-0.2866737, -1.453046, -2.375183, 0, 1, 0.5019608, 1,
-0.2860238, 0.2560257, -2.915664, 0, 1, 0.509804, 1,
-0.2845455, 0.3236006, -0.1479905, 0, 1, 0.5137255, 1,
-0.2826747, -0.2878702, -1.075383, 0, 1, 0.5215687, 1,
-0.2764354, 0.6856679, -0.6658149, 0, 1, 0.5254902, 1,
-0.2731972, -1.057043, -2.124213, 0, 1, 0.5333334, 1,
-0.2719057, -3.021363, -2.259314, 0, 1, 0.5372549, 1,
-0.2699386, -1.000725, -2.747409, 0, 1, 0.5450981, 1,
-0.2684905, 0.2454513, 0.8136204, 0, 1, 0.5490196, 1,
-0.2668523, -0.8075373, -2.760207, 0, 1, 0.5568628, 1,
-0.2664683, 0.6353595, -2.559623, 0, 1, 0.5607843, 1,
-0.2662403, 0.2076448, -0.9834709, 0, 1, 0.5686275, 1,
-0.2622412, 0.6759834, -0.706615, 0, 1, 0.572549, 1,
-0.2610324, -0.487068, -2.905154, 0, 1, 0.5803922, 1,
-0.2587512, -2.00701, -4.378103, 0, 1, 0.5843138, 1,
-0.252956, -0.2074869, -3.175525, 0, 1, 0.5921569, 1,
-0.2454197, 1.260523, -0.3729696, 0, 1, 0.5960785, 1,
-0.2378512, -0.346088, -2.719395, 0, 1, 0.6039216, 1,
-0.2359099, -0.8581973, -1.06559, 0, 1, 0.6117647, 1,
-0.2325225, -0.871654, -3.256905, 0, 1, 0.6156863, 1,
-0.2311853, 0.1270612, -0.672567, 0, 1, 0.6235294, 1,
-0.2264312, -0.8259364, -3.831534, 0, 1, 0.627451, 1,
-0.2261361, 0.03255934, 0.6383249, 0, 1, 0.6352941, 1,
-0.2153165, 1.673557, 0.4968005, 0, 1, 0.6392157, 1,
-0.215249, -0.06464963, -1.448198, 0, 1, 0.6470588, 1,
-0.2134401, -0.3693457, -5.185176, 0, 1, 0.6509804, 1,
-0.2115801, -1.785267, -3.321194, 0, 1, 0.6588235, 1,
-0.2008834, 0.4145702, -1.610498, 0, 1, 0.6627451, 1,
-0.1979722, -0.4257326, -1.33923, 0, 1, 0.6705883, 1,
-0.192982, 1.969452, -0.190287, 0, 1, 0.6745098, 1,
-0.1921871, -0.5422255, -4.287165, 0, 1, 0.682353, 1,
-0.1869559, -0.9905698, -2.905836, 0, 1, 0.6862745, 1,
-0.1817862, -1.075288, -3.167463, 0, 1, 0.6941177, 1,
-0.1798585, -1.254648, -2.91547, 0, 1, 0.7019608, 1,
-0.1797298, 0.06672098, -1.60136, 0, 1, 0.7058824, 1,
-0.1745394, -0.8357534, -2.728447, 0, 1, 0.7137255, 1,
-0.1709948, -0.9432868, -2.053745, 0, 1, 0.7176471, 1,
-0.1668395, 0.8215446, -1.353273, 0, 1, 0.7254902, 1,
-0.1663868, -0.8671167, -3.658373, 0, 1, 0.7294118, 1,
-0.1659276, -0.7534192, -3.068331, 0, 1, 0.7372549, 1,
-0.1638956, -0.1335901, -2.47195, 0, 1, 0.7411765, 1,
-0.1596863, -0.1616109, -3.219102, 0, 1, 0.7490196, 1,
-0.1574492, 0.6444344, -1.422518, 0, 1, 0.7529412, 1,
-0.1551941, 0.01438863, -1.752874, 0, 1, 0.7607843, 1,
-0.1470469, -0.9618016, -3.158492, 0, 1, 0.7647059, 1,
-0.1334903, 0.2988291, 0.8433328, 0, 1, 0.772549, 1,
-0.1292415, -0.8456548, -3.484201, 0, 1, 0.7764706, 1,
-0.1269794, -1.566515, -1.871738, 0, 1, 0.7843137, 1,
-0.126273, -0.1443302, -2.868691, 0, 1, 0.7882353, 1,
-0.1253173, -1.026589, -2.516257, 0, 1, 0.7960784, 1,
-0.1240733, 1.618907, -0.7961251, 0, 1, 0.8039216, 1,
-0.123487, -0.5538178, -2.764752, 0, 1, 0.8078431, 1,
-0.1192075, -0.4614629, -2.794898, 0, 1, 0.8156863, 1,
-0.1159163, -1.78578, -3.398515, 0, 1, 0.8196079, 1,
-0.1141245, 0.01156509, -0.7910851, 0, 1, 0.827451, 1,
-0.1117809, 0.9673754, 0.282879, 0, 1, 0.8313726, 1,
-0.1113286, 0.9985142, -2.507787, 0, 1, 0.8392157, 1,
-0.1108589, -1.075026, -3.998438, 0, 1, 0.8431373, 1,
-0.1074762, -0.8448364, -2.772029, 0, 1, 0.8509804, 1,
-0.1033545, -1.001349, -3.007741, 0, 1, 0.854902, 1,
-0.1010724, -0.2775314, -2.51907, 0, 1, 0.8627451, 1,
-0.09570336, -0.9455726, -2.888361, 0, 1, 0.8666667, 1,
-0.09226535, 0.7422718, -0.3344672, 0, 1, 0.8745098, 1,
-0.09054806, -0.118879, -1.119382, 0, 1, 0.8784314, 1,
-0.0897433, 1.048825, -0.5766291, 0, 1, 0.8862745, 1,
-0.0861205, 0.5732093, 0.2270779, 0, 1, 0.8901961, 1,
-0.08540751, -1.242703, -4.627617, 0, 1, 0.8980392, 1,
-0.08325449, -1.681382, -4.304878, 0, 1, 0.9058824, 1,
-0.08221257, -0.6625625, -2.867735, 0, 1, 0.9098039, 1,
-0.08214767, 0.7861655, -0.3559098, 0, 1, 0.9176471, 1,
-0.07762069, -1.092145, -3.924526, 0, 1, 0.9215686, 1,
-0.07236124, -1.605181, -2.502246, 0, 1, 0.9294118, 1,
-0.06720456, 0.2793761, -0.1828329, 0, 1, 0.9333333, 1,
-0.06247307, -0.6209518, -2.000069, 0, 1, 0.9411765, 1,
-0.06186412, 1.501677, 1.201301, 0, 1, 0.945098, 1,
-0.06145327, 1.183085, -0.9333459, 0, 1, 0.9529412, 1,
-0.05860766, 0.9023409, 1.645808, 0, 1, 0.9568627, 1,
-0.05785079, 0.0464646, 0.1694413, 0, 1, 0.9647059, 1,
-0.05721569, -0.7799826, -4.816476, 0, 1, 0.9686275, 1,
-0.05638839, -1.272393, -0.7585863, 0, 1, 0.9764706, 1,
-0.05326974, 1.139351, 0.8436788, 0, 1, 0.9803922, 1,
-0.05307705, -0.4440829, -2.220515, 0, 1, 0.9882353, 1,
-0.05141418, 0.8270051, 0.2955562, 0, 1, 0.9921569, 1,
-0.04797711, 0.008820375, -1.438922, 0, 1, 1, 1,
-0.04243043, -0.02071949, -3.186512, 0, 0.9921569, 1, 1,
-0.04123722, 0.06895591, -0.2757184, 0, 0.9882353, 1, 1,
-0.03719761, 0.1481451, 0.6430757, 0, 0.9803922, 1, 1,
-0.03660413, 0.0442416, -1.015341, 0, 0.9764706, 1, 1,
-0.03163084, 0.5922699, -1.396849, 0, 0.9686275, 1, 1,
-0.03045961, 1.181174, 1.412667, 0, 0.9647059, 1, 1,
-0.03036648, 1.030205, -0.7773302, 0, 0.9568627, 1, 1,
-0.03005415, -0.7759316, -2.272719, 0, 0.9529412, 1, 1,
-0.02917172, 2.058166, 1.378042, 0, 0.945098, 1, 1,
-0.02563751, 0.374512, 1.644672, 0, 0.9411765, 1, 1,
-0.02373904, -1.395185, -4.112568, 0, 0.9333333, 1, 1,
-0.02360895, -0.4124768, -3.307811, 0, 0.9294118, 1, 1,
-0.0230481, 0.5471982, -1.047889, 0, 0.9215686, 1, 1,
-0.01984164, -0.286558, -2.36697, 0, 0.9176471, 1, 1,
-0.01540695, 0.8600416, 1.810168, 0, 0.9098039, 1, 1,
-0.007683453, 1.112256, -0.4099743, 0, 0.9058824, 1, 1,
-0.005180168, -0.4428232, -3.100945, 0, 0.8980392, 1, 1,
-0.003984935, 0.4348686, -0.2468204, 0, 0.8901961, 1, 1,
0.003230977, -0.06825478, 4.383765, 0, 0.8862745, 1, 1,
0.005420862, -1.899205, 2.891904, 0, 0.8784314, 1, 1,
0.005829675, -0.2493614, 3.151062, 0, 0.8745098, 1, 1,
0.005909412, -1.548675, 2.37554, 0, 0.8666667, 1, 1,
0.007332518, -0.4923726, 3.604403, 0, 0.8627451, 1, 1,
0.008915131, -0.5482392, 2.342231, 0, 0.854902, 1, 1,
0.0097854, -1.987828, 3.493618, 0, 0.8509804, 1, 1,
0.0138607, -0.285748, 5.440923, 0, 0.8431373, 1, 1,
0.01841432, 0.6109296, 1.451474, 0, 0.8392157, 1, 1,
0.02253046, -0.6262698, 4.707601, 0, 0.8313726, 1, 1,
0.02637458, 0.01013237, 0.6512987, 0, 0.827451, 1, 1,
0.02653875, -0.1301853, 1.408624, 0, 0.8196079, 1, 1,
0.02663785, 0.913308, 0.6722932, 0, 0.8156863, 1, 1,
0.02852734, -0.7729908, 4.883517, 0, 0.8078431, 1, 1,
0.03207795, 0.05028406, -0.5613441, 0, 0.8039216, 1, 1,
0.03220939, 0.809064, -2.698544, 0, 0.7960784, 1, 1,
0.03238171, 0.4345349, -0.01033045, 0, 0.7882353, 1, 1,
0.03483206, -2.18829, 3.457463, 0, 0.7843137, 1, 1,
0.03631851, -0.4467898, 4.917561, 0, 0.7764706, 1, 1,
0.03651853, 0.06553198, 1.981451, 0, 0.772549, 1, 1,
0.04286246, 0.1856342, -0.000939096, 0, 0.7647059, 1, 1,
0.04408889, 1.659546, -0.5212896, 0, 0.7607843, 1, 1,
0.05393485, -0.4415729, 4.395583, 0, 0.7529412, 1, 1,
0.05489608, -0.5635931, 2.317586, 0, 0.7490196, 1, 1,
0.0581575, -0.6260677, 1.139966, 0, 0.7411765, 1, 1,
0.05933021, -1.15411, 2.234129, 0, 0.7372549, 1, 1,
0.06090274, -1.094393, 4.659263, 0, 0.7294118, 1, 1,
0.06105128, 1.368882, 0.141111, 0, 0.7254902, 1, 1,
0.07358421, -0.1117728, 2.346861, 0, 0.7176471, 1, 1,
0.07468327, 0.9073751, -0.0907288, 0, 0.7137255, 1, 1,
0.07506761, -0.2995991, 1.867446, 0, 0.7058824, 1, 1,
0.07523973, -0.1880749, 4.154622, 0, 0.6980392, 1, 1,
0.07678733, 1.181835, 1.87851, 0, 0.6941177, 1, 1,
0.07792327, 0.8260694, -1.100336, 0, 0.6862745, 1, 1,
0.07909447, 1.391688, -1.406686, 0, 0.682353, 1, 1,
0.07998043, -0.1887486, 1.369435, 0, 0.6745098, 1, 1,
0.08099178, -0.0009049762, 1.358294, 0, 0.6705883, 1, 1,
0.08604095, 0.1025233, -1.099464, 0, 0.6627451, 1, 1,
0.08697392, 0.5074736, -1.312788, 0, 0.6588235, 1, 1,
0.08808262, 0.7006152, 2.179724, 0, 0.6509804, 1, 1,
0.09046388, 1.070538, -0.7108538, 0, 0.6470588, 1, 1,
0.09587736, -0.39755, 4.379208, 0, 0.6392157, 1, 1,
0.1032246, -1.190623, 3.579453, 0, 0.6352941, 1, 1,
0.1039459, 0.0140865, 2.204488, 0, 0.627451, 1, 1,
0.1039802, 0.1561468, 2.51464, 0, 0.6235294, 1, 1,
0.1045915, -0.2321203, 0.7732763, 0, 0.6156863, 1, 1,
0.111246, 0.7145882, 0.3490619, 0, 0.6117647, 1, 1,
0.1129567, -0.08702838, 2.462011, 0, 0.6039216, 1, 1,
0.1190108, -0.03088441, 1.656145, 0, 0.5960785, 1, 1,
0.1344976, 0.2971913, 0.1627153, 0, 0.5921569, 1, 1,
0.1346837, 1.559882, 2.105485, 0, 0.5843138, 1, 1,
0.1414634, 0.3403873, 0.3349803, 0, 0.5803922, 1, 1,
0.1424768, -0.1512398, 1.324303, 0, 0.572549, 1, 1,
0.1436153, -0.5026663, 1.715362, 0, 0.5686275, 1, 1,
0.1436572, -1.438969, 4.52292, 0, 0.5607843, 1, 1,
0.1481618, -0.3032182, 2.244199, 0, 0.5568628, 1, 1,
0.1500103, -0.2503213, 2.786605, 0, 0.5490196, 1, 1,
0.1575519, 1.401281, -0.04541884, 0, 0.5450981, 1, 1,
0.1581815, -0.8158336, 3.086477, 0, 0.5372549, 1, 1,
0.1591124, 1.477925, -0.6928802, 0, 0.5333334, 1, 1,
0.1591991, -1.185524, 3.754156, 0, 0.5254902, 1, 1,
0.1601867, 0.2619089, 0.472029, 0, 0.5215687, 1, 1,
0.1618896, 0.02340051, 1.298116, 0, 0.5137255, 1, 1,
0.1696035, 0.01975095, 0.1434039, 0, 0.509804, 1, 1,
0.1704894, -0.6303172, 1.644496, 0, 0.5019608, 1, 1,
0.1745005, 0.3689221, 0.2249327, 0, 0.4941176, 1, 1,
0.1771857, -0.4347769, 2.276331, 0, 0.4901961, 1, 1,
0.180232, -0.1075461, 2.193273, 0, 0.4823529, 1, 1,
0.1834424, 3.161891, -0.5732768, 0, 0.4784314, 1, 1,
0.1850865, 0.5256827, 2.181691, 0, 0.4705882, 1, 1,
0.1852428, 0.814088, -0.8927149, 0, 0.4666667, 1, 1,
0.1887974, -0.1183674, 4.27089, 0, 0.4588235, 1, 1,
0.1900585, 2.048059, -0.3970532, 0, 0.454902, 1, 1,
0.1902341, -0.7219588, 2.396819, 0, 0.4470588, 1, 1,
0.1936771, 1.034176, -0.05803498, 0, 0.4431373, 1, 1,
0.194877, 0.194985, -0.01135254, 0, 0.4352941, 1, 1,
0.1954414, 3.339648, 0.1167654, 0, 0.4313726, 1, 1,
0.1955349, -1.038108, 4.723972, 0, 0.4235294, 1, 1,
0.1974014, -0.6646193, 4.571389, 0, 0.4196078, 1, 1,
0.1983, -0.8157117, 1.213237, 0, 0.4117647, 1, 1,
0.1990415, 0.1403955, 0.8921084, 0, 0.4078431, 1, 1,
0.2031039, 1.650666, -0.2874708, 0, 0.4, 1, 1,
0.2048309, 0.1204399, 1.15057, 0, 0.3921569, 1, 1,
0.2062378, -0.6670961, 2.211856, 0, 0.3882353, 1, 1,
0.2150367, -0.415415, 2.097509, 0, 0.3803922, 1, 1,
0.2152331, 0.0696047, 2.097273, 0, 0.3764706, 1, 1,
0.2154373, 0.5912187, -0.5986312, 0, 0.3686275, 1, 1,
0.2170856, -1.534559, 1.582435, 0, 0.3647059, 1, 1,
0.2187417, 1.612905, 0.3413578, 0, 0.3568628, 1, 1,
0.2229037, 2.503542, -1.18807, 0, 0.3529412, 1, 1,
0.2234908, 0.8988498, 0.3311021, 0, 0.345098, 1, 1,
0.2287861, 0.2266056, -0.434958, 0, 0.3411765, 1, 1,
0.2289996, -1.356087, 1.621721, 0, 0.3333333, 1, 1,
0.235875, 0.4229986, 1.412544, 0, 0.3294118, 1, 1,
0.2359682, -0.4750819, 1.16902, 0, 0.3215686, 1, 1,
0.2374514, -0.08660751, 1.52326, 0, 0.3176471, 1, 1,
0.2391897, -0.2254755, 2.354344, 0, 0.3098039, 1, 1,
0.2430827, 1.117147, -1.104902, 0, 0.3058824, 1, 1,
0.2433061, 0.932377, -2.441119, 0, 0.2980392, 1, 1,
0.2462116, -1.371485, 4.343316, 0, 0.2901961, 1, 1,
0.2485988, -1.232112, 3.306299, 0, 0.2862745, 1, 1,
0.2489366, 0.7034851, 1.134184, 0, 0.2784314, 1, 1,
0.2504224, 1.173505, 0.749985, 0, 0.2745098, 1, 1,
0.2527497, 0.3922411, 1.33306, 0, 0.2666667, 1, 1,
0.2554164, 0.01131524, 2.114747, 0, 0.2627451, 1, 1,
0.2569829, -1.055444, 2.59193, 0, 0.254902, 1, 1,
0.2578713, -0.9626582, 3.694552, 0, 0.2509804, 1, 1,
0.2593267, -0.4717509, 2.186792, 0, 0.2431373, 1, 1,
0.2699775, -0.6865592, 3.454447, 0, 0.2392157, 1, 1,
0.273884, -0.4263766, 2.264485, 0, 0.2313726, 1, 1,
0.2794803, -0.0536374, 1.924332, 0, 0.227451, 1, 1,
0.2803729, 0.1870352, -0.1419941, 0, 0.2196078, 1, 1,
0.2818937, 0.01904482, 1.336143, 0, 0.2156863, 1, 1,
0.2827583, 1.135778, -2.273211, 0, 0.2078431, 1, 1,
0.2843289, 0.7333692, 1.534455, 0, 0.2039216, 1, 1,
0.2844867, -1.36054, 3.913372, 0, 0.1960784, 1, 1,
0.2868896, 2.383467, -0.1063697, 0, 0.1882353, 1, 1,
0.2898433, 1.874071, 0.3875861, 0, 0.1843137, 1, 1,
0.2908747, 0.6849857, -1.649144, 0, 0.1764706, 1, 1,
0.2943585, 0.4627855, 1.209382, 0, 0.172549, 1, 1,
0.2950686, -0.08878845, 0.9984998, 0, 0.1647059, 1, 1,
0.2972789, 0.05198507, 0.2991827, 0, 0.1607843, 1, 1,
0.2997133, 2.357586, 0.1104348, 0, 0.1529412, 1, 1,
0.30015, -0.766363, 2.959153, 0, 0.1490196, 1, 1,
0.3061489, -1.134079, 4.696713, 0, 0.1411765, 1, 1,
0.3068181, 1.457688, 0.05734052, 0, 0.1372549, 1, 1,
0.3125424, 1.346055, 1.84825, 0, 0.1294118, 1, 1,
0.3156424, 0.06125598, 0.7551539, 0, 0.1254902, 1, 1,
0.3172276, -1.475213, 2.882416, 0, 0.1176471, 1, 1,
0.3189075, 0.2814518, 2.525477, 0, 0.1137255, 1, 1,
0.3204635, 1.644646, -1.473106, 0, 0.1058824, 1, 1,
0.3218279, -0.2260679, 3.084925, 0, 0.09803922, 1, 1,
0.3228212, -0.7579757, 4.11282, 0, 0.09411765, 1, 1,
0.3234804, 0.9453321, -0.6828335, 0, 0.08627451, 1, 1,
0.3235261, 0.4273134, 0.2559485, 0, 0.08235294, 1, 1,
0.3255865, -1.133034, 3.17135, 0, 0.07450981, 1, 1,
0.3263446, -0.5410402, 2.280054, 0, 0.07058824, 1, 1,
0.3290215, -2.0818, 2.741775, 0, 0.0627451, 1, 1,
0.3345686, -1.691599, 2.842023, 0, 0.05882353, 1, 1,
0.3434266, 0.8638149, 0.5402673, 0, 0.05098039, 1, 1,
0.3459609, 1.000781, 1.318608, 0, 0.04705882, 1, 1,
0.3471898, -1.054767, 3.574856, 0, 0.03921569, 1, 1,
0.3480578, -1.079576, 3.408627, 0, 0.03529412, 1, 1,
0.3526092, -0.2596803, 2.658827, 0, 0.02745098, 1, 1,
0.3544331, -0.4115331, 2.943011, 0, 0.02352941, 1, 1,
0.3545241, 0.6447632, -0.9774708, 0, 0.01568628, 1, 1,
0.3553149, -0.7782365, 3.214772, 0, 0.01176471, 1, 1,
0.3588582, -1.30106, 2.642534, 0, 0.003921569, 1, 1,
0.3603456, 1.143602, 1.498694, 0.003921569, 0, 1, 1,
0.3604315, 2.562572, -0.5825981, 0.007843138, 0, 1, 1,
0.3656175, -1.076017, 3.808998, 0.01568628, 0, 1, 1,
0.3785146, -0.7835528, 5.258415, 0.01960784, 0, 1, 1,
0.3786222, -1.752013, 2.930293, 0.02745098, 0, 1, 1,
0.3795846, -1.228118, 3.435665, 0.03137255, 0, 1, 1,
0.3812121, 0.4993614, 1.246407, 0.03921569, 0, 1, 1,
0.3848469, 1.005833, 0.8292797, 0.04313726, 0, 1, 1,
0.3889149, -0.09459554, 0.7306548, 0.05098039, 0, 1, 1,
0.3924218, -1.432988, 2.948158, 0.05490196, 0, 1, 1,
0.394383, 0.04134124, 0.1749854, 0.0627451, 0, 1, 1,
0.3955004, -1.65815, 2.714609, 0.06666667, 0, 1, 1,
0.395843, -1.125239, 1.927573, 0.07450981, 0, 1, 1,
0.3966093, -3.121716, 1.457974, 0.07843138, 0, 1, 1,
0.4005933, 0.7293723, 0.8488085, 0.08627451, 0, 1, 1,
0.4012708, -0.7484617, 0.9383804, 0.09019608, 0, 1, 1,
0.4022377, 0.5687687, 0.1901975, 0.09803922, 0, 1, 1,
0.4055768, -0.5475162, 3.961176, 0.1058824, 0, 1, 1,
0.410263, -0.5461643, 1.479314, 0.1098039, 0, 1, 1,
0.415161, -1.375966, 1.163992, 0.1176471, 0, 1, 1,
0.4170205, 0.7826897, 0.1953339, 0.1215686, 0, 1, 1,
0.4191118, 0.330374, 1.484288, 0.1294118, 0, 1, 1,
0.4196465, -0.2727337, 2.735888, 0.1333333, 0, 1, 1,
0.427626, 0.1292659, 1.04587, 0.1411765, 0, 1, 1,
0.4279254, 0.4769239, 0.1228464, 0.145098, 0, 1, 1,
0.4322985, 1.340108, 0.3260796, 0.1529412, 0, 1, 1,
0.4340805, 0.7186435, 1.712533, 0.1568628, 0, 1, 1,
0.4362142, -0.8471683, 2.972286, 0.1647059, 0, 1, 1,
0.4370601, 2.213215, 1.216048, 0.1686275, 0, 1, 1,
0.4385916, 0.7294009, -1.293809, 0.1764706, 0, 1, 1,
0.4496402, -0.8082018, 3.073123, 0.1803922, 0, 1, 1,
0.4512074, 0.1857806, 2.294212, 0.1882353, 0, 1, 1,
0.4582674, -1.533344, 3.841994, 0.1921569, 0, 1, 1,
0.4592769, -0.1362741, 1.47577, 0.2, 0, 1, 1,
0.4607289, -0.1510119, 2.021737, 0.2078431, 0, 1, 1,
0.461232, 0.1080838, 2.160468, 0.2117647, 0, 1, 1,
0.4625419, 0.7431127, -0.6733983, 0.2196078, 0, 1, 1,
0.4632583, 1.560036, 1.972818, 0.2235294, 0, 1, 1,
0.4658047, -0.5384766, 2.215236, 0.2313726, 0, 1, 1,
0.4665838, 0.959498, 1.844932, 0.2352941, 0, 1, 1,
0.4669276, -1.870301, 3.071697, 0.2431373, 0, 1, 1,
0.4760314, 1.23333, -0.3338076, 0.2470588, 0, 1, 1,
0.4764386, -0.2934002, 3.073355, 0.254902, 0, 1, 1,
0.4775638, -0.7203478, 4.641508, 0.2588235, 0, 1, 1,
0.4789968, -0.7007374, 2.404875, 0.2666667, 0, 1, 1,
0.4795778, 0.1275665, 1.875836, 0.2705882, 0, 1, 1,
0.4802926, 0.03018021, 0.2688952, 0.2784314, 0, 1, 1,
0.4828051, 0.3499923, 1.271599, 0.282353, 0, 1, 1,
0.4831971, -0.5177873, 2.538334, 0.2901961, 0, 1, 1,
0.4897781, -2.475479, 1.601844, 0.2941177, 0, 1, 1,
0.4927328, -1.211565, 1.782287, 0.3019608, 0, 1, 1,
0.4943154, 0.7898395, 1.397994, 0.3098039, 0, 1, 1,
0.4951024, -0.4164919, 1.072114, 0.3137255, 0, 1, 1,
0.4966942, -0.1246296, 2.298749, 0.3215686, 0, 1, 1,
0.5024741, -0.2912811, 2.554797, 0.3254902, 0, 1, 1,
0.5031564, -1.650282, 2.276571, 0.3333333, 0, 1, 1,
0.5108486, -0.7602813, 2.259814, 0.3372549, 0, 1, 1,
0.5113835, 0.2270055, -0.941682, 0.345098, 0, 1, 1,
0.5167557, 0.007401963, 1.248659, 0.3490196, 0, 1, 1,
0.521944, 1.60482, 0.9053424, 0.3568628, 0, 1, 1,
0.5261973, -0.1615289, 1.633835, 0.3607843, 0, 1, 1,
0.5270839, -0.2955532, 2.815613, 0.3686275, 0, 1, 1,
0.5276119, 1.600986, -0.4047504, 0.372549, 0, 1, 1,
0.5278567, -0.9310402, 1.927912, 0.3803922, 0, 1, 1,
0.5312859, 0.5836396, 0.1510696, 0.3843137, 0, 1, 1,
0.5338333, -0.1989116, -0.1919378, 0.3921569, 0, 1, 1,
0.5398867, 1.758808, -1.537545, 0.3960784, 0, 1, 1,
0.5433464, 0.5621276, -0.5890498, 0.4039216, 0, 1, 1,
0.5436782, -2.205076, 2.64831, 0.4117647, 0, 1, 1,
0.5442225, -0.8990136, 0.5128299, 0.4156863, 0, 1, 1,
0.5500027, -0.677891, 2.794467, 0.4235294, 0, 1, 1,
0.5525509, -1.691627, 4.160448, 0.427451, 0, 1, 1,
0.5544599, -1.028475, 3.426714, 0.4352941, 0, 1, 1,
0.5570759, 1.651494, -0.4556991, 0.4392157, 0, 1, 1,
0.5579758, 1.080727, 1.446895, 0.4470588, 0, 1, 1,
0.5628939, -0.1942641, 1.447902, 0.4509804, 0, 1, 1,
0.5634308, 0.6984938, 0.6055609, 0.4588235, 0, 1, 1,
0.5649438, 0.5420207, 0.2557743, 0.4627451, 0, 1, 1,
0.5652, 0.6791288, -0.1997742, 0.4705882, 0, 1, 1,
0.5664548, -0.5463923, 0.8659112, 0.4745098, 0, 1, 1,
0.5745075, 0.2130403, 3.718452, 0.4823529, 0, 1, 1,
0.5762168, -0.7631018, 2.273519, 0.4862745, 0, 1, 1,
0.5780106, 0.3551499, 1.716038, 0.4941176, 0, 1, 1,
0.579579, -0.9847569, 2.357107, 0.5019608, 0, 1, 1,
0.58066, -0.4363159, 3.384897, 0.5058824, 0, 1, 1,
0.5847608, -0.0656122, 2.003664, 0.5137255, 0, 1, 1,
0.5871913, 0.809466, 1.855149, 0.5176471, 0, 1, 1,
0.5935197, 0.5981871, 1.002441, 0.5254902, 0, 1, 1,
0.5973478, -0.2910533, 3.149292, 0.5294118, 0, 1, 1,
0.5996391, 0.2618341, -0.7195032, 0.5372549, 0, 1, 1,
0.6012577, 0.4492281, -0.7377413, 0.5411765, 0, 1, 1,
0.6036403, -0.0799522, 2.21914, 0.5490196, 0, 1, 1,
0.621842, -0.02566593, 2.403504, 0.5529412, 0, 1, 1,
0.6249243, 1.324668, -0.6988977, 0.5607843, 0, 1, 1,
0.6270872, -0.5313108, 1.445344, 0.5647059, 0, 1, 1,
0.6366446, 2.98349, 1.304448, 0.572549, 0, 1, 1,
0.6372967, 0.3120949, 1.162664, 0.5764706, 0, 1, 1,
0.6378859, 1.183867, 1.194075, 0.5843138, 0, 1, 1,
0.6381637, 0.4048296, 1.954896, 0.5882353, 0, 1, 1,
0.6389511, -0.07599715, 3.226574, 0.5960785, 0, 1, 1,
0.6393305, -0.3359434, 2.196842, 0.6039216, 0, 1, 1,
0.6419473, -0.02003112, 3.245286, 0.6078432, 0, 1, 1,
0.6520948, 1.11409, 0.4536408, 0.6156863, 0, 1, 1,
0.6555128, 1.46949, 0.3389199, 0.6196079, 0, 1, 1,
0.6584504, -0.7281979, 1.901857, 0.627451, 0, 1, 1,
0.6638431, 0.09489801, 1.427415, 0.6313726, 0, 1, 1,
0.6642256, -1.336304, 3.746784, 0.6392157, 0, 1, 1,
0.669866, -0.3764272, 1.933258, 0.6431373, 0, 1, 1,
0.68817, -1.359556, 3.791527, 0.6509804, 0, 1, 1,
0.6884279, 0.03649831, 3.226809, 0.654902, 0, 1, 1,
0.6892696, 0.5590056, 1.248195, 0.6627451, 0, 1, 1,
0.6901471, -0.4263328, 2.671652, 0.6666667, 0, 1, 1,
0.6930444, 2.051776, -1.361223, 0.6745098, 0, 1, 1,
0.6930614, -1.214267, 4.087858, 0.6784314, 0, 1, 1,
0.694414, -0.9574082, 2.474147, 0.6862745, 0, 1, 1,
0.6968533, -1.239827, 3.126694, 0.6901961, 0, 1, 1,
0.7050487, 0.3403367, 0.3622162, 0.6980392, 0, 1, 1,
0.708463, -0.009364197, 0.6049105, 0.7058824, 0, 1, 1,
0.7137891, 1.66587, 2.233553, 0.7098039, 0, 1, 1,
0.7139953, 0.4982353, 1.7557, 0.7176471, 0, 1, 1,
0.7146127, 0.3895169, 0.0557628, 0.7215686, 0, 1, 1,
0.7181494, -0.230292, 2.146826, 0.7294118, 0, 1, 1,
0.7258155, 0.9442232, 0.5530052, 0.7333333, 0, 1, 1,
0.725948, 1.243021, 0.8306056, 0.7411765, 0, 1, 1,
0.7338678, 0.6793566, 0.4149466, 0.7450981, 0, 1, 1,
0.7361413, 0.1292699, 2.705936, 0.7529412, 0, 1, 1,
0.7406792, 0.6959437, 1.448426, 0.7568628, 0, 1, 1,
0.7423877, -0.06185943, 0.6889321, 0.7647059, 0, 1, 1,
0.7432351, -0.3671325, 3.622411, 0.7686275, 0, 1, 1,
0.7460155, -0.2322091, 2.699331, 0.7764706, 0, 1, 1,
0.7503632, -1.487194, 1.625558, 0.7803922, 0, 1, 1,
0.7541888, 0.0897579, 0.8392869, 0.7882353, 0, 1, 1,
0.7554829, 0.9010925, 0.8934006, 0.7921569, 0, 1, 1,
0.7568359, -0.004534941, 0.8775131, 0.8, 0, 1, 1,
0.7570324, -0.2931311, 1.625855, 0.8078431, 0, 1, 1,
0.7666148, -0.1742127, 0.299196, 0.8117647, 0, 1, 1,
0.7699583, 0.648955, 0.6615273, 0.8196079, 0, 1, 1,
0.7729392, -0.1550624, -0.419927, 0.8235294, 0, 1, 1,
0.7731466, 0.7764398, 1.554291, 0.8313726, 0, 1, 1,
0.7844737, -0.2530314, 2.06556, 0.8352941, 0, 1, 1,
0.785129, -0.1438261, 1.610018, 0.8431373, 0, 1, 1,
0.7880512, 0.7869012, 1.295664, 0.8470588, 0, 1, 1,
0.7906457, -0.06676384, 0.2735074, 0.854902, 0, 1, 1,
0.7942209, 0.8355826, -1.657042, 0.8588235, 0, 1, 1,
0.7968516, -0.3335335, 3.767537, 0.8666667, 0, 1, 1,
0.8037203, -1.335932, 2.822457, 0.8705882, 0, 1, 1,
0.8037634, -0.418298, 4.284746, 0.8784314, 0, 1, 1,
0.8131654, -2.414362, 2.357179, 0.8823529, 0, 1, 1,
0.8193873, 0.04176725, 0.7396005, 0.8901961, 0, 1, 1,
0.8217025, -0.5179215, 1.20958, 0.8941177, 0, 1, 1,
0.8225878, -0.2192731, 2.456448, 0.9019608, 0, 1, 1,
0.8256039, -0.9453444, 3.954755, 0.9098039, 0, 1, 1,
0.8292128, 0.2515847, 2.301265, 0.9137255, 0, 1, 1,
0.8308139, 0.5886196, 2.855508, 0.9215686, 0, 1, 1,
0.8412338, -1.478054, 4.207032, 0.9254902, 0, 1, 1,
0.8504521, -0.3123329, 1.412383, 0.9333333, 0, 1, 1,
0.8533461, 0.5180537, -0.6071267, 0.9372549, 0, 1, 1,
0.8565466, 0.1439424, 2.731009, 0.945098, 0, 1, 1,
0.8586574, 0.5729225, -0.2751366, 0.9490196, 0, 1, 1,
0.8626027, -0.3067439, 1.350273, 0.9568627, 0, 1, 1,
0.8647979, -0.05435883, 2.258647, 0.9607843, 0, 1, 1,
0.8667372, 0.9776743, 0.5962291, 0.9686275, 0, 1, 1,
0.8690663, 1.561858, 1.014264, 0.972549, 0, 1, 1,
0.8700113, 0.09783014, 1.561331, 0.9803922, 0, 1, 1,
0.8771938, -0.4826651, 1.831225, 0.9843137, 0, 1, 1,
0.8808826, 1.221227, -0.9391299, 0.9921569, 0, 1, 1,
0.8858717, 0.5842079, 1.276157, 0.9960784, 0, 1, 1,
0.8886505, -0.59988, 2.27259, 1, 0, 0.9960784, 1,
0.8898451, -0.6097927, 0.103689, 1, 0, 0.9882353, 1,
0.900079, -0.3506694, 0.4528882, 1, 0, 0.9843137, 1,
0.9003304, -0.1275368, 0.8652703, 1, 0, 0.9764706, 1,
0.9044746, -1.803393, 3.322128, 1, 0, 0.972549, 1,
0.9067295, -1.29269, 4.503115, 1, 0, 0.9647059, 1,
0.9082825, -0.009110661, 2.750745, 1, 0, 0.9607843, 1,
0.9093969, 0.7278059, 0.9990982, 1, 0, 0.9529412, 1,
0.9112557, -0.2859146, 1.732435, 1, 0, 0.9490196, 1,
0.9119732, -0.1825939, 2.204417, 1, 0, 0.9411765, 1,
0.918416, 0.004798858, 2.843776, 1, 0, 0.9372549, 1,
0.9199049, 0.01150407, 3.457078, 1, 0, 0.9294118, 1,
0.9280118, -0.6233346, -0.1519612, 1, 0, 0.9254902, 1,
0.9325733, 0.483613, -0.9372525, 1, 0, 0.9176471, 1,
0.933108, -0.9589903, 2.726277, 1, 0, 0.9137255, 1,
0.9341109, -0.7906698, 3.190524, 1, 0, 0.9058824, 1,
0.934949, -2.221488, 2.682729, 1, 0, 0.9019608, 1,
0.935788, 0.1307676, 2.520091, 1, 0, 0.8941177, 1,
0.9453346, 1.733742, 0.8888201, 1, 0, 0.8862745, 1,
0.9464289, -1.077065, 1.977759, 1, 0, 0.8823529, 1,
0.9563051, 2.104819, 1.782345, 1, 0, 0.8745098, 1,
0.960986, 0.6920388, -0.06052012, 1, 0, 0.8705882, 1,
0.9619173, 0.2914357, 1.407017, 1, 0, 0.8627451, 1,
0.963843, 0.1981513, 1.433631, 1, 0, 0.8588235, 1,
0.9659098, 0.5289038, 0.5946887, 1, 0, 0.8509804, 1,
0.9866872, -1.080464, 1.566438, 1, 0, 0.8470588, 1,
0.9907261, 0.5392737, 2.611717, 1, 0, 0.8392157, 1,
1.011961, -0.503956, 2.216268, 1, 0, 0.8352941, 1,
1.012406, -0.9937658, 3.192756, 1, 0, 0.827451, 1,
1.015519, -0.5294424, 1.365883, 1, 0, 0.8235294, 1,
1.021515, 2.16556, -0.9001543, 1, 0, 0.8156863, 1,
1.024845, 0.3930867, -0.5300307, 1, 0, 0.8117647, 1,
1.025309, -1.314221, 3.35584, 1, 0, 0.8039216, 1,
1.027749, -1.07083, 3.057345, 1, 0, 0.7960784, 1,
1.029913, 1.786321, 0.5431496, 1, 0, 0.7921569, 1,
1.032929, 1.809022, 0.9591955, 1, 0, 0.7843137, 1,
1.034825, 0.2330678, 0.2207288, 1, 0, 0.7803922, 1,
1.04723, 0.04141968, 0.4726166, 1, 0, 0.772549, 1,
1.051388, -1.19997, 4.506695, 1, 0, 0.7686275, 1,
1.058764, 0.7809694, 2.550153, 1, 0, 0.7607843, 1,
1.061717, 0.4497277, 0.2276522, 1, 0, 0.7568628, 1,
1.065387, 0.1057424, 2.405954, 1, 0, 0.7490196, 1,
1.066995, -0.3601467, 2.421295, 1, 0, 0.7450981, 1,
1.067019, -0.1368391, 2.959175, 1, 0, 0.7372549, 1,
1.067389, -0.7759339, 2.215939, 1, 0, 0.7333333, 1,
1.071905, 0.6306754, 0.9253749, 1, 0, 0.7254902, 1,
1.079911, 2.019367, -0.3002445, 1, 0, 0.7215686, 1,
1.098438, -1.670913, 1.833696, 1, 0, 0.7137255, 1,
1.104074, 0.4610669, -0.279994, 1, 0, 0.7098039, 1,
1.108346, 0.791305, 1.827565, 1, 0, 0.7019608, 1,
1.109432, -0.307426, 1.575882, 1, 0, 0.6941177, 1,
1.114661, -1.217724, 2.021903, 1, 0, 0.6901961, 1,
1.121792, 0.6629649, 0.5087754, 1, 0, 0.682353, 1,
1.137723, 1.160119, 2.436899, 1, 0, 0.6784314, 1,
1.141103, -0.7145129, 1.119654, 1, 0, 0.6705883, 1,
1.143234, -0.4645971, 1.603601, 1, 0, 0.6666667, 1,
1.149652, 0.5127197, 0.8740167, 1, 0, 0.6588235, 1,
1.154191, 1.104548, 0.1278543, 1, 0, 0.654902, 1,
1.164465, 0.9726856, 0.7703562, 1, 0, 0.6470588, 1,
1.181396, -2.714183, 2.655304, 1, 0, 0.6431373, 1,
1.189268, -1.040976, 3.066417, 1, 0, 0.6352941, 1,
1.195328, 1.250813, 1.856243, 1, 0, 0.6313726, 1,
1.198951, 0.2538851, 0.9788728, 1, 0, 0.6235294, 1,
1.207856, 0.3279392, -0.1435076, 1, 0, 0.6196079, 1,
1.20916, -0.3282969, 2.072376, 1, 0, 0.6117647, 1,
1.21141, -1.292768, 2.706589, 1, 0, 0.6078432, 1,
1.212226, 0.4868688, 1.815667, 1, 0, 0.6, 1,
1.218917, 2.243586, -0.7055766, 1, 0, 0.5921569, 1,
1.222449, -0.3269042, 2.986329, 1, 0, 0.5882353, 1,
1.224769, 1.298594, 1.439263, 1, 0, 0.5803922, 1,
1.227329, 0.1863061, 1.753816, 1, 0, 0.5764706, 1,
1.232103, -1.025765, 2.505609, 1, 0, 0.5686275, 1,
1.233645, -0.8524457, 2.349684, 1, 0, 0.5647059, 1,
1.248439, 1.083104, 0.5870127, 1, 0, 0.5568628, 1,
1.263365, 0.7619827, 0.4085114, 1, 0, 0.5529412, 1,
1.264142, -0.2915802, 2.849791, 1, 0, 0.5450981, 1,
1.280225, 0.9329806, 1.826721, 1, 0, 0.5411765, 1,
1.283606, -0.7386264, 2.592768, 1, 0, 0.5333334, 1,
1.293204, -0.3316352, 1.912797, 1, 0, 0.5294118, 1,
1.311918, -0.02640188, 1.932399, 1, 0, 0.5215687, 1,
1.316526, 0.7332287, 1.510392, 1, 0, 0.5176471, 1,
1.319833, 1.277722, 2.338618, 1, 0, 0.509804, 1,
1.340164, -0.9654241, 2.159477, 1, 0, 0.5058824, 1,
1.341054, -1.415107, 3.268027, 1, 0, 0.4980392, 1,
1.344926, -0.1793774, 2.318682, 1, 0, 0.4901961, 1,
1.351154, 0.7879244, 0.9467978, 1, 0, 0.4862745, 1,
1.365027, -0.6879413, 3.011576, 1, 0, 0.4784314, 1,
1.376519, -0.4028235, 0.5783012, 1, 0, 0.4745098, 1,
1.38756, 0.237141, 1.43597, 1, 0, 0.4666667, 1,
1.393999, 0.8805159, 0.1164423, 1, 0, 0.4627451, 1,
1.395311, -1.220863, 2.179418, 1, 0, 0.454902, 1,
1.399676, -0.8729984, 2.930804, 1, 0, 0.4509804, 1,
1.402656, 1.51427, 0.1311579, 1, 0, 0.4431373, 1,
1.436247, 0.2088857, 1.642118, 1, 0, 0.4392157, 1,
1.437844, 0.9229412, 0.5647703, 1, 0, 0.4313726, 1,
1.439236, 1.054806, -0.3066254, 1, 0, 0.427451, 1,
1.441438, 0.7173439, 0.715881, 1, 0, 0.4196078, 1,
1.453808, -0.4273621, 2.882761, 1, 0, 0.4156863, 1,
1.464591, -0.4502068, 2.118724, 1, 0, 0.4078431, 1,
1.467746, -0.8915471, 0.5393127, 1, 0, 0.4039216, 1,
1.472847, -0.6232593, 3.402169, 1, 0, 0.3960784, 1,
1.47673, -0.7452281, 2.834114, 1, 0, 0.3882353, 1,
1.481813, -1.212402, 2.484314, 1, 0, 0.3843137, 1,
1.495775, 1.258451, 0.7984812, 1, 0, 0.3764706, 1,
1.505765, 0.9543184, -1.876681, 1, 0, 0.372549, 1,
1.510348, 0.5810201, 1.001983, 1, 0, 0.3647059, 1,
1.522508, -0.4244433, 1.117826, 1, 0, 0.3607843, 1,
1.525564, 0.02739012, 1.15526, 1, 0, 0.3529412, 1,
1.532467, 0.5759561, 2.172133, 1, 0, 0.3490196, 1,
1.544478, -0.6538644, 0.3903603, 1, 0, 0.3411765, 1,
1.552195, -0.1169873, 0.5413064, 1, 0, 0.3372549, 1,
1.55385, 1.26776, 1.611125, 1, 0, 0.3294118, 1,
1.556923, 0.1341817, 1.460584, 1, 0, 0.3254902, 1,
1.567744, 0.04302896, 2.313416, 1, 0, 0.3176471, 1,
1.569102, 1.907864, 2.077013, 1, 0, 0.3137255, 1,
1.57112, 0.8236145, 0.4306642, 1, 0, 0.3058824, 1,
1.582227, 1.038448, 0.8537229, 1, 0, 0.2980392, 1,
1.591902, -0.3718807, 1.48684, 1, 0, 0.2941177, 1,
1.597122, 0.6863737, 1.288143, 1, 0, 0.2862745, 1,
1.609017, -0.5962518, 3.334269, 1, 0, 0.282353, 1,
1.625817, 1.322626, -0.3225043, 1, 0, 0.2745098, 1,
1.628869, 1.177611, -1.00616, 1, 0, 0.2705882, 1,
1.632199, -0.2703925, 2.111661, 1, 0, 0.2627451, 1,
1.646527, 0.9481987, 0.3482514, 1, 0, 0.2588235, 1,
1.667837, -0.5221322, 1.035408, 1, 0, 0.2509804, 1,
1.673895, 1.706355, 0.8641652, 1, 0, 0.2470588, 1,
1.698923, 0.677795, 1.057498, 1, 0, 0.2392157, 1,
1.708415, -1.863977, 1.015186, 1, 0, 0.2352941, 1,
1.727312, -1.190878, 2.428398, 1, 0, 0.227451, 1,
1.729139, 1.100074, 1.448031, 1, 0, 0.2235294, 1,
1.742321, -0.9294612, 0.9542314, 1, 0, 0.2156863, 1,
1.745806, 1.012801, 1.273985, 1, 0, 0.2117647, 1,
1.768741, 0.07221747, 3.377395, 1, 0, 0.2039216, 1,
1.78524, 0.813807, 1.215534, 1, 0, 0.1960784, 1,
1.798243, -0.01205579, 2.471148, 1, 0, 0.1921569, 1,
1.805755, 0.2130196, 1.442697, 1, 0, 0.1843137, 1,
1.809223, -0.4702254, 1.310443, 1, 0, 0.1803922, 1,
1.810446, 0.6677196, 1.048316, 1, 0, 0.172549, 1,
1.834049, 0.8943335, 1.225465, 1, 0, 0.1686275, 1,
1.836854, 0.1749346, 0.0853345, 1, 0, 0.1607843, 1,
1.848033, -0.135327, 0.3262753, 1, 0, 0.1568628, 1,
1.855386, -1.698043, 1.192519, 1, 0, 0.1490196, 1,
1.871592, -0.9716851, 1.455545, 1, 0, 0.145098, 1,
1.877444, 1.733803, 1.472548, 1, 0, 0.1372549, 1,
1.899998, 0.3959755, 3.06652, 1, 0, 0.1333333, 1,
1.900154, -0.4388094, 1.802911, 1, 0, 0.1254902, 1,
1.904555, 0.7178221, 0.7597045, 1, 0, 0.1215686, 1,
2.006572, -1.249887, 2.390215, 1, 0, 0.1137255, 1,
2.019085, 1.258886, 1.192362, 1, 0, 0.1098039, 1,
2.028174, -1.200557, 2.194241, 1, 0, 0.1019608, 1,
2.094681, 1.152931, 1.911955, 1, 0, 0.09411765, 1,
2.108609, 1.14176, 1.241356, 1, 0, 0.09019608, 1,
2.196766, 0.4008172, 1.291582, 1, 0, 0.08235294, 1,
2.234437, -1.690486, 2.164912, 1, 0, 0.07843138, 1,
2.287889, -1.814053, 1.804703, 1, 0, 0.07058824, 1,
2.319726, 0.01910872, 1.633419, 1, 0, 0.06666667, 1,
2.349286, 0.3717966, 1.654824, 1, 0, 0.05882353, 1,
2.358191, 1.3143, 1.820914, 1, 0, 0.05490196, 1,
2.413562, 0.4504308, -0.6965617, 1, 0, 0.04705882, 1,
2.449711, 1.405111, 0.9905344, 1, 0, 0.04313726, 1,
2.511019, -0.09630493, 1.414702, 1, 0, 0.03529412, 1,
2.62638, 0.4110583, 1.204989, 1, 0, 0.03137255, 1,
2.832453, 0.2182545, 0.0386123, 1, 0, 0.02352941, 1,
2.905932, 0.1845825, 0.8290396, 1, 0, 0.01960784, 1,
3.01305, 1.221235, 0.2046382, 1, 0, 0.01176471, 1,
3.705166, -0.1513827, 2.702997, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.325821, -4.216917, -7.092175, 0, -0.5, 0.5, 0.5,
0.325821, -4.216917, -7.092175, 1, -0.5, 0.5, 0.5,
0.325821, -4.216917, -7.092175, 1, 1.5, 0.5, 0.5,
0.325821, -4.216917, -7.092175, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.199122, 0.1089659, -7.092175, 0, -0.5, 0.5, 0.5,
-4.199122, 0.1089659, -7.092175, 1, -0.5, 0.5, 0.5,
-4.199122, 0.1089659, -7.092175, 1, 1.5, 0.5, 0.5,
-4.199122, 0.1089659, -7.092175, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.199122, -4.216917, 0.08260846, 0, -0.5, 0.5, 0.5,
-4.199122, -4.216917, 0.08260846, 1, -0.5, 0.5, 0.5,
-4.199122, -4.216917, 0.08260846, 1, 1.5, 0.5, 0.5,
-4.199122, -4.216917, 0.08260846, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.218636, -5.436456,
3, -3.218636, -5.436456,
-3, -3.218636, -5.436456,
-3, -3.385016, -5.712409,
-2, -3.218636, -5.436456,
-2, -3.385016, -5.712409,
-1, -3.218636, -5.436456,
-1, -3.385016, -5.712409,
0, -3.218636, -5.436456,
0, -3.385016, -5.712409,
1, -3.218636, -5.436456,
1, -3.385016, -5.712409,
2, -3.218636, -5.436456,
2, -3.385016, -5.712409,
3, -3.218636, -5.436456,
3, -3.385016, -5.712409
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.717777, -6.264315, 0, -0.5, 0.5, 0.5,
-3, -3.717777, -6.264315, 1, -0.5, 0.5, 0.5,
-3, -3.717777, -6.264315, 1, 1.5, 0.5, 0.5,
-3, -3.717777, -6.264315, 0, 1.5, 0.5, 0.5,
-2, -3.717777, -6.264315, 0, -0.5, 0.5, 0.5,
-2, -3.717777, -6.264315, 1, -0.5, 0.5, 0.5,
-2, -3.717777, -6.264315, 1, 1.5, 0.5, 0.5,
-2, -3.717777, -6.264315, 0, 1.5, 0.5, 0.5,
-1, -3.717777, -6.264315, 0, -0.5, 0.5, 0.5,
-1, -3.717777, -6.264315, 1, -0.5, 0.5, 0.5,
-1, -3.717777, -6.264315, 1, 1.5, 0.5, 0.5,
-1, -3.717777, -6.264315, 0, 1.5, 0.5, 0.5,
0, -3.717777, -6.264315, 0, -0.5, 0.5, 0.5,
0, -3.717777, -6.264315, 1, -0.5, 0.5, 0.5,
0, -3.717777, -6.264315, 1, 1.5, 0.5, 0.5,
0, -3.717777, -6.264315, 0, 1.5, 0.5, 0.5,
1, -3.717777, -6.264315, 0, -0.5, 0.5, 0.5,
1, -3.717777, -6.264315, 1, -0.5, 0.5, 0.5,
1, -3.717777, -6.264315, 1, 1.5, 0.5, 0.5,
1, -3.717777, -6.264315, 0, 1.5, 0.5, 0.5,
2, -3.717777, -6.264315, 0, -0.5, 0.5, 0.5,
2, -3.717777, -6.264315, 1, -0.5, 0.5, 0.5,
2, -3.717777, -6.264315, 1, 1.5, 0.5, 0.5,
2, -3.717777, -6.264315, 0, 1.5, 0.5, 0.5,
3, -3.717777, -6.264315, 0, -0.5, 0.5, 0.5,
3, -3.717777, -6.264315, 1, -0.5, 0.5, 0.5,
3, -3.717777, -6.264315, 1, 1.5, 0.5, 0.5,
3, -3.717777, -6.264315, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.154904, -3, -5.436456,
-3.154904, 3, -5.436456,
-3.154904, -3, -5.436456,
-3.328941, -3, -5.712409,
-3.154904, -2, -5.436456,
-3.328941, -2, -5.712409,
-3.154904, -1, -5.436456,
-3.328941, -1, -5.712409,
-3.154904, 0, -5.436456,
-3.328941, 0, -5.712409,
-3.154904, 1, -5.436456,
-3.328941, 1, -5.712409,
-3.154904, 2, -5.436456,
-3.328941, 2, -5.712409,
-3.154904, 3, -5.436456,
-3.328941, 3, -5.712409
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.677013, -3, -6.264315, 0, -0.5, 0.5, 0.5,
-3.677013, -3, -6.264315, 1, -0.5, 0.5, 0.5,
-3.677013, -3, -6.264315, 1, 1.5, 0.5, 0.5,
-3.677013, -3, -6.264315, 0, 1.5, 0.5, 0.5,
-3.677013, -2, -6.264315, 0, -0.5, 0.5, 0.5,
-3.677013, -2, -6.264315, 1, -0.5, 0.5, 0.5,
-3.677013, -2, -6.264315, 1, 1.5, 0.5, 0.5,
-3.677013, -2, -6.264315, 0, 1.5, 0.5, 0.5,
-3.677013, -1, -6.264315, 0, -0.5, 0.5, 0.5,
-3.677013, -1, -6.264315, 1, -0.5, 0.5, 0.5,
-3.677013, -1, -6.264315, 1, 1.5, 0.5, 0.5,
-3.677013, -1, -6.264315, 0, 1.5, 0.5, 0.5,
-3.677013, 0, -6.264315, 0, -0.5, 0.5, 0.5,
-3.677013, 0, -6.264315, 1, -0.5, 0.5, 0.5,
-3.677013, 0, -6.264315, 1, 1.5, 0.5, 0.5,
-3.677013, 0, -6.264315, 0, 1.5, 0.5, 0.5,
-3.677013, 1, -6.264315, 0, -0.5, 0.5, 0.5,
-3.677013, 1, -6.264315, 1, -0.5, 0.5, 0.5,
-3.677013, 1, -6.264315, 1, 1.5, 0.5, 0.5,
-3.677013, 1, -6.264315, 0, 1.5, 0.5, 0.5,
-3.677013, 2, -6.264315, 0, -0.5, 0.5, 0.5,
-3.677013, 2, -6.264315, 1, -0.5, 0.5, 0.5,
-3.677013, 2, -6.264315, 1, 1.5, 0.5, 0.5,
-3.677013, 2, -6.264315, 0, 1.5, 0.5, 0.5,
-3.677013, 3, -6.264315, 0, -0.5, 0.5, 0.5,
-3.677013, 3, -6.264315, 1, -0.5, 0.5, 0.5,
-3.677013, 3, -6.264315, 1, 1.5, 0.5, 0.5,
-3.677013, 3, -6.264315, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.154904, -3.218636, -4,
-3.154904, -3.218636, 4,
-3.154904, -3.218636, -4,
-3.328941, -3.385016, -4,
-3.154904, -3.218636, -2,
-3.328941, -3.385016, -2,
-3.154904, -3.218636, 0,
-3.328941, -3.385016, 0,
-3.154904, -3.218636, 2,
-3.328941, -3.385016, 2,
-3.154904, -3.218636, 4,
-3.328941, -3.385016, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.677013, -3.717777, -4, 0, -0.5, 0.5, 0.5,
-3.677013, -3.717777, -4, 1, -0.5, 0.5, 0.5,
-3.677013, -3.717777, -4, 1, 1.5, 0.5, 0.5,
-3.677013, -3.717777, -4, 0, 1.5, 0.5, 0.5,
-3.677013, -3.717777, -2, 0, -0.5, 0.5, 0.5,
-3.677013, -3.717777, -2, 1, -0.5, 0.5, 0.5,
-3.677013, -3.717777, -2, 1, 1.5, 0.5, 0.5,
-3.677013, -3.717777, -2, 0, 1.5, 0.5, 0.5,
-3.677013, -3.717777, 0, 0, -0.5, 0.5, 0.5,
-3.677013, -3.717777, 0, 1, -0.5, 0.5, 0.5,
-3.677013, -3.717777, 0, 1, 1.5, 0.5, 0.5,
-3.677013, -3.717777, 0, 0, 1.5, 0.5, 0.5,
-3.677013, -3.717777, 2, 0, -0.5, 0.5, 0.5,
-3.677013, -3.717777, 2, 1, -0.5, 0.5, 0.5,
-3.677013, -3.717777, 2, 1, 1.5, 0.5, 0.5,
-3.677013, -3.717777, 2, 0, 1.5, 0.5, 0.5,
-3.677013, -3.717777, 4, 0, -0.5, 0.5, 0.5,
-3.677013, -3.717777, 4, 1, -0.5, 0.5, 0.5,
-3.677013, -3.717777, 4, 1, 1.5, 0.5, 0.5,
-3.677013, -3.717777, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.154904, -3.218636, -5.436456,
-3.154904, 3.436568, -5.436456,
-3.154904, -3.218636, 5.601673,
-3.154904, 3.436568, 5.601673,
-3.154904, -3.218636, -5.436456,
-3.154904, -3.218636, 5.601673,
-3.154904, 3.436568, -5.436456,
-3.154904, 3.436568, 5.601673,
-3.154904, -3.218636, -5.436456,
3.806546, -3.218636, -5.436456,
-3.154904, -3.218636, 5.601673,
3.806546, -3.218636, 5.601673,
-3.154904, 3.436568, -5.436456,
3.806546, 3.436568, -5.436456,
-3.154904, 3.436568, 5.601673,
3.806546, 3.436568, 5.601673,
3.806546, -3.218636, -5.436456,
3.806546, 3.436568, -5.436456,
3.806546, -3.218636, 5.601673,
3.806546, 3.436568, 5.601673,
3.806546, -3.218636, -5.436456,
3.806546, -3.218636, 5.601673,
3.806546, 3.436568, -5.436456,
3.806546, 3.436568, 5.601673
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.822293;
var distance = 34.80226;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.325821, -0.1089659, -0.08260846 );
mvMatrix.scale( 1.214921, 1.270827, 0.7662183 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.80226);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
TCA<-read.table("TCA.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-TCA$V2
```

```
## Error in eval(expr, envir, enclos): object 'TCA' not found
```

```r
y<-TCA$V3
```

```
## Error in eval(expr, envir, enclos): object 'TCA' not found
```

```r
z<-TCA$V4
```

```
## Error in eval(expr, envir, enclos): object 'TCA' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.053524, 0.6827386, -1.610237, 0, 0, 1, 1, 1,
-2.991931, 0.5023287, -0.4129567, 1, 0, 0, 1, 1,
-2.963548, 1.557719, -1.363767, 1, 0, 0, 1, 1,
-2.917049, 0.4144524, -0.4906082, 1, 0, 0, 1, 1,
-2.7327, -0.1573177, -1.77671, 1, 0, 0, 1, 1,
-2.730251, -0.1495999, -2.845071, 1, 0, 0, 1, 1,
-2.55838, -0.678696, -0.7000486, 0, 0, 0, 1, 1,
-2.52319, 0.3800361, -0.7807886, 0, 0, 0, 1, 1,
-2.512486, -0.1824739, -2.755771, 0, 0, 0, 1, 1,
-2.430524, -1.672978, -3.490146, 0, 0, 0, 1, 1,
-2.407738, -0.04453534, -1.653001, 0, 0, 0, 1, 1,
-2.406981, -0.3602544, -0.778049, 0, 0, 0, 1, 1,
-2.354131, 1.576707, -1.964807, 0, 0, 0, 1, 1,
-2.350002, -0.5989983, -1.630112, 1, 1, 1, 1, 1,
-2.330871, -0.8116018, -1.114952, 1, 1, 1, 1, 1,
-2.315646, -0.2482312, -2.739429, 1, 1, 1, 1, 1,
-2.260016, 0.7490209, -1.613281, 1, 1, 1, 1, 1,
-2.225402, -0.7891881, -2.887142, 1, 1, 1, 1, 1,
-2.209987, -0.3358676, -0.432872, 1, 1, 1, 1, 1,
-2.204243, -0.4966948, -1.033124, 1, 1, 1, 1, 1,
-2.191503, -1.873387, -2.847557, 1, 1, 1, 1, 1,
-2.18817, 1.703015, -1.55466, 1, 1, 1, 1, 1,
-2.184521, -0.3076143, -1.078009, 1, 1, 1, 1, 1,
-2.14358, -0.2162501, -2.548571, 1, 1, 1, 1, 1,
-2.141443, 0.5026224, -0.176052, 1, 1, 1, 1, 1,
-2.125716, 1.024269, -0.8445686, 1, 1, 1, 1, 1,
-2.089768, -0.3149594, -2.061009, 1, 1, 1, 1, 1,
-1.985784, -1.005918, -1.88274, 1, 1, 1, 1, 1,
-1.966393, 0.6389249, -0.9659261, 0, 0, 1, 1, 1,
-1.954075, -2.497567, -1.82262, 1, 0, 0, 1, 1,
-1.947157, 0.1905963, -1.726761, 1, 0, 0, 1, 1,
-1.914985, -0.7796361, -1.170406, 1, 0, 0, 1, 1,
-1.906938, -0.5991891, -2.509127, 1, 0, 0, 1, 1,
-1.895761, -0.03024769, -2.692036, 1, 0, 0, 1, 1,
-1.8829, 0.9601429, -0.6055216, 0, 0, 0, 1, 1,
-1.877532, 0.8665925, -1.243984, 0, 0, 0, 1, 1,
-1.876378, -0.3639413, -2.327452, 0, 0, 0, 1, 1,
-1.855518, 0.2780645, -0.3696758, 0, 0, 0, 1, 1,
-1.848865, 0.02273744, -1.686939, 0, 0, 0, 1, 1,
-1.842054, -0.3320271, -1.707044, 0, 0, 0, 1, 1,
-1.838768, -1.072351, -2.609496, 0, 0, 0, 1, 1,
-1.833395, 0.5740876, -0.5455585, 1, 1, 1, 1, 1,
-1.80317, 1.115872, -0.5964937, 1, 1, 1, 1, 1,
-1.788377, 0.4226865, -0.7013853, 1, 1, 1, 1, 1,
-1.788367, 0.2074301, -1.309139, 1, 1, 1, 1, 1,
-1.784656, -0.3997988, -0.8528883, 1, 1, 1, 1, 1,
-1.778683, 1.837929, -0.1321258, 1, 1, 1, 1, 1,
-1.774677, -0.7231053, -0.3217207, 1, 1, 1, 1, 1,
-1.748272, 0.6442304, -2.218822, 1, 1, 1, 1, 1,
-1.740074, 0.09407713, -3.052499, 1, 1, 1, 1, 1,
-1.721873, -0.9611348, -0.6412607, 1, 1, 1, 1, 1,
-1.708035, -1.10402, -2.94648, 1, 1, 1, 1, 1,
-1.707521, 1.998698, 0.3022735, 1, 1, 1, 1, 1,
-1.697107, -0.804689, -2.224525, 1, 1, 1, 1, 1,
-1.693148, -0.07345614, -3.311764, 1, 1, 1, 1, 1,
-1.686606, 0.9333934, -0.7776892, 1, 1, 1, 1, 1,
-1.683444, -1.494585, -2.695568, 0, 0, 1, 1, 1,
-1.671413, -0.7706944, -1.080244, 1, 0, 0, 1, 1,
-1.653367, 0.03042753, 0.3028969, 1, 0, 0, 1, 1,
-1.641757, -1.026486, -2.650659, 1, 0, 0, 1, 1,
-1.63436, 1.105492, -0.5461341, 1, 0, 0, 1, 1,
-1.627085, 0.6198609, 0.7291074, 1, 0, 0, 1, 1,
-1.619753, 0.2868975, -2.52843, 0, 0, 0, 1, 1,
-1.614392, -0.4633001, -2.001014, 0, 0, 0, 1, 1,
-1.612135, -0.03634169, -0.6296919, 0, 0, 0, 1, 1,
-1.603553, 0.5876142, 0.1953219, 0, 0, 0, 1, 1,
-1.59576, 0.4420714, -0.08324747, 0, 0, 0, 1, 1,
-1.58846, -0.9958965, -0.667511, 0, 0, 0, 1, 1,
-1.582354, -1.319911, -3.647855, 0, 0, 0, 1, 1,
-1.582229, 0.6385587, -0.2224085, 1, 1, 1, 1, 1,
-1.527172, -0.6780273, -0.9628501, 1, 1, 1, 1, 1,
-1.508876, 0.3099256, -1.862753, 1, 1, 1, 1, 1,
-1.499053, -0.09802969, -1.724619, 1, 1, 1, 1, 1,
-1.488766, 0.5258412, -2.158241, 1, 1, 1, 1, 1,
-1.478129, 1.039569, -0.1791807, 1, 1, 1, 1, 1,
-1.477438, -0.7688124, -2.022532, 1, 1, 1, 1, 1,
-1.467066, -0.004640652, -1.903858, 1, 1, 1, 1, 1,
-1.457963, -1.683826, -1.500754, 1, 1, 1, 1, 1,
-1.449322, 0.9910048, -0.01886645, 1, 1, 1, 1, 1,
-1.449154, -1.840076, -2.369006, 1, 1, 1, 1, 1,
-1.448854, 1.147816, -0.1461526, 1, 1, 1, 1, 1,
-1.446182, -1.643997, -3.128798, 1, 1, 1, 1, 1,
-1.440141, -0.1077617, -2.226753, 1, 1, 1, 1, 1,
-1.427042, 0.4525055, -1.109244, 1, 1, 1, 1, 1,
-1.422579, 1.937338, -0.9833819, 0, 0, 1, 1, 1,
-1.410462, -1.214683, -1.354803, 1, 0, 0, 1, 1,
-1.407378, 0.2404731, -2.109117, 1, 0, 0, 1, 1,
-1.402365, -0.9970251, -0.6464688, 1, 0, 0, 1, 1,
-1.401265, 1.15504, -2.094126, 1, 0, 0, 1, 1,
-1.396832, -0.06905867, -1.689147, 1, 0, 0, 1, 1,
-1.395121, -0.3148437, 0.6124946, 0, 0, 0, 1, 1,
-1.371411, -0.5276496, -2.785297, 0, 0, 0, 1, 1,
-1.360995, 1.075401, -1.383724, 0, 0, 0, 1, 1,
-1.348226, -0.5977102, -1.761258, 0, 0, 0, 1, 1,
-1.336517, 1.757188, -0.550148, 0, 0, 0, 1, 1,
-1.335818, -0.807563, -1.641021, 0, 0, 0, 1, 1,
-1.335804, 0.3655942, -0.8732912, 0, 0, 0, 1, 1,
-1.335583, -0.5318792, -1.86446, 1, 1, 1, 1, 1,
-1.326804, 1.253448, -0.5056937, 1, 1, 1, 1, 1,
-1.325739, -1.214069, -1.828452, 1, 1, 1, 1, 1,
-1.325508, -0.08510701, -1.653201, 1, 1, 1, 1, 1,
-1.313437, 0.07385547, -2.286201, 1, 1, 1, 1, 1,
-1.300105, -0.8888718, -1.764964, 1, 1, 1, 1, 1,
-1.296859, 0.5456594, -1.356973, 1, 1, 1, 1, 1,
-1.296634, 0.1426423, 0.002530156, 1, 1, 1, 1, 1,
-1.295451, 0.9295034, -0.7157762, 1, 1, 1, 1, 1,
-1.288556, -0.3179196, -2.475356, 1, 1, 1, 1, 1,
-1.285664, 2.538642, -0.3181487, 1, 1, 1, 1, 1,
-1.282319, -0.8564721, -2.10114, 1, 1, 1, 1, 1,
-1.278819, -0.2669765, -2.065764, 1, 1, 1, 1, 1,
-1.270894, -0.4131953, -0.9741696, 1, 1, 1, 1, 1,
-1.269659, -1.581637, -2.32507, 1, 1, 1, 1, 1,
-1.268639, -0.01096157, -1.260721, 0, 0, 1, 1, 1,
-1.265424, -2.018964, -3.404008, 1, 0, 0, 1, 1,
-1.259086, 0.4515893, -0.3303888, 1, 0, 0, 1, 1,
-1.255226, -0.6952962, -2.055609, 1, 0, 0, 1, 1,
-1.242572, 0.8494251, -2.373137, 1, 0, 0, 1, 1,
-1.23911, -0.4204775, -1.427643, 1, 0, 0, 1, 1,
-1.236254, 2.907337, 0.9916005, 0, 0, 0, 1, 1,
-1.23059, -0.8521701, -2.819918, 0, 0, 0, 1, 1,
-1.227161, 0.7298141, -1.352145, 0, 0, 0, 1, 1,
-1.223756, -0.7572865, -2.51847, 0, 0, 0, 1, 1,
-1.222972, -0.8120837, -2.518298, 0, 0, 0, 1, 1,
-1.220117, 0.4808817, -1.51508, 0, 0, 0, 1, 1,
-1.219896, -0.3386492, -1.459302, 0, 0, 0, 1, 1,
-1.213967, -0.7680927, -1.753542, 1, 1, 1, 1, 1,
-1.210916, -0.8454379, -1.984393, 1, 1, 1, 1, 1,
-1.209331, -0.2006802, -1.765141, 1, 1, 1, 1, 1,
-1.203884, 1.994675, -0.1688949, 1, 1, 1, 1, 1,
-1.201027, -1.306934, -2.114298, 1, 1, 1, 1, 1,
-1.197567, 1.529475, -1.229666, 1, 1, 1, 1, 1,
-1.194101, -0.1712162, -2.652111, 1, 1, 1, 1, 1,
-1.190724, 0.6886106, -1.079098, 1, 1, 1, 1, 1,
-1.189621, -1.479509, -3.809129, 1, 1, 1, 1, 1,
-1.186216, 0.7343338, -1.917026, 1, 1, 1, 1, 1,
-1.184618, -0.7334121, -0.2069196, 1, 1, 1, 1, 1,
-1.182348, 0.9346156, 0.07769281, 1, 1, 1, 1, 1,
-1.181651, 1.847624, -1.267158, 1, 1, 1, 1, 1,
-1.181397, 0.8024502, -0.9195015, 1, 1, 1, 1, 1,
-1.163261, 0.03206809, -0.2119201, 1, 1, 1, 1, 1,
-1.157002, -1.251557, -0.5543147, 0, 0, 1, 1, 1,
-1.153668, 0.2859156, -1.896749, 1, 0, 0, 1, 1,
-1.150858, -0.9553313, -4.016257, 1, 0, 0, 1, 1,
-1.145459, 0.3909505, -0.2325778, 1, 0, 0, 1, 1,
-1.1427, -1.071584, -3.727216, 1, 0, 0, 1, 1,
-1.136693, 0.3444811, -1.147404, 1, 0, 0, 1, 1,
-1.132952, -1.053229, -1.458267, 0, 0, 0, 1, 1,
-1.13098, -2.051453, -3.683038, 0, 0, 0, 1, 1,
-1.126583, -0.1106711, -3.002475, 0, 0, 0, 1, 1,
-1.119765, -0.82596, -3.136583, 0, 0, 0, 1, 1,
-1.118779, -0.8966317, -1.234688, 0, 0, 0, 1, 1,
-1.092176, -1.048436, -1.32877, 0, 0, 0, 1, 1,
-1.090836, -1.560049, -2.529117, 0, 0, 0, 1, 1,
-1.087291, -0.3460923, -1.525743, 1, 1, 1, 1, 1,
-1.08644, 0.3714635, -0.8507073, 1, 1, 1, 1, 1,
-1.084963, 0.3756913, -1.619411, 1, 1, 1, 1, 1,
-1.082785, -0.8101423, -1.198416, 1, 1, 1, 1, 1,
-1.079144, -1.307545, -2.118193, 1, 1, 1, 1, 1,
-1.073294, -0.2644791, -0.5675207, 1, 1, 1, 1, 1,
-1.073112, -0.3938533, -3.629862, 1, 1, 1, 1, 1,
-1.071434, 1.39277, -0.5763922, 1, 1, 1, 1, 1,
-1.069086, 0.6331577, -1.696834, 1, 1, 1, 1, 1,
-1.063942, 0.04857454, -2.816381, 1, 1, 1, 1, 1,
-1.063557, -0.9983671, -3.145256, 1, 1, 1, 1, 1,
-1.063306, 0.7831979, -1.154178, 1, 1, 1, 1, 1,
-1.060618, -1.90189, -2.898148, 1, 1, 1, 1, 1,
-1.057063, -0.6175644, -2.335364, 1, 1, 1, 1, 1,
-1.055761, 0.6153039, -0.429129, 1, 1, 1, 1, 1,
-1.055718, 1.699847, -1.53925, 0, 0, 1, 1, 1,
-1.055572, -0.6056857, -3.071938, 1, 0, 0, 1, 1,
-1.05505, 1.056876, -1.12317, 1, 0, 0, 1, 1,
-1.04765, -0.04789247, -1.95159, 1, 0, 0, 1, 1,
-1.046141, -0.856571, -2.702079, 1, 0, 0, 1, 1,
-1.045859, 0.971819, -2.545616, 1, 0, 0, 1, 1,
-1.040767, -0.1160112, -1.400279, 0, 0, 0, 1, 1,
-1.03659, 0.02717981, -2.512602, 0, 0, 0, 1, 1,
-1.02604, -0.7148432, -2.311063, 0, 0, 0, 1, 1,
-1.02585, -1.469462, -3.045807, 0, 0, 0, 1, 1,
-1.013723, 1.157797, -1.701706, 0, 0, 0, 1, 1,
-1.00686, 0.1463172, -2.006029, 0, 0, 0, 1, 1,
-1.005774, 0.9671533, 0.2060023, 0, 0, 0, 1, 1,
-1.004026, 0.2662441, -1.414088, 1, 1, 1, 1, 1,
-1.001579, 0.8417728, -0.7966598, 1, 1, 1, 1, 1,
-0.9993424, -1.060743, -2.306239, 1, 1, 1, 1, 1,
-0.9973953, 0.3852336, 0.371953, 1, 1, 1, 1, 1,
-0.9936132, 0.4242068, -0.9031222, 1, 1, 1, 1, 1,
-0.9926164, -0.3033799, -0.4713341, 1, 1, 1, 1, 1,
-0.9915981, 0.3010056, -0.3318979, 1, 1, 1, 1, 1,
-0.9902697, 0.04640034, 0.169812, 1, 1, 1, 1, 1,
-0.9889288, 0.2660259, -0.9278669, 1, 1, 1, 1, 1,
-0.9858552, 1.510054, -1.154635, 1, 1, 1, 1, 1,
-0.9763781, 1.92678, -0.5471351, 1, 1, 1, 1, 1,
-0.971305, 0.6289011, -0.6589585, 1, 1, 1, 1, 1,
-0.9649867, 1.125376, -2.501057, 1, 1, 1, 1, 1,
-0.9635383, 0.1406892, -0.8413908, 1, 1, 1, 1, 1,
-0.9475729, -0.09416817, -0.8709537, 1, 1, 1, 1, 1,
-0.9465068, -0.9271513, -1.791555, 0, 0, 1, 1, 1,
-0.9400001, -0.435004, -2.029043, 1, 0, 0, 1, 1,
-0.9379172, -0.1456937, -2.293817, 1, 0, 0, 1, 1,
-0.9350109, -1.544445, -1.611193, 1, 0, 0, 1, 1,
-0.9336873, 0.6942419, 0.3321778, 1, 0, 0, 1, 1,
-0.9328805, 1.619881, -0.4718143, 1, 0, 0, 1, 1,
-0.9322001, 1.004705, -1.013708, 0, 0, 0, 1, 1,
-0.9309757, 0.547968, -0.4080897, 0, 0, 0, 1, 1,
-0.929125, -0.296253, -2.721767, 0, 0, 0, 1, 1,
-0.9176926, -0.401233, -2.300177, 0, 0, 0, 1, 1,
-0.9053054, -0.3456503, -2.791132, 0, 0, 0, 1, 1,
-0.8992096, -0.343016, -2.315334, 0, 0, 0, 1, 1,
-0.8942049, 0.5898681, -0.06378239, 0, 0, 0, 1, 1,
-0.8916316, 0.9051532, 1.84052, 1, 1, 1, 1, 1,
-0.8836132, 0.9935144, -0.7021252, 1, 1, 1, 1, 1,
-0.8810234, 0.01325772, -2.042375, 1, 1, 1, 1, 1,
-0.8783265, -0.02241111, -0.7394696, 1, 1, 1, 1, 1,
-0.8755841, -0.2312963, -2.986644, 1, 1, 1, 1, 1,
-0.8698846, -0.2113941, 0.9266911, 1, 1, 1, 1, 1,
-0.8681172, -0.02833534, -0.5172206, 1, 1, 1, 1, 1,
-0.8576335, -0.5039633, -1.731873, 1, 1, 1, 1, 1,
-0.8328635, 0.6551433, 1.2657, 1, 1, 1, 1, 1,
-0.8296421, -1.355841, -2.877422, 1, 1, 1, 1, 1,
-0.8284304, 0.7453904, -0.3560577, 1, 1, 1, 1, 1,
-0.8229453, 0.2582605, -3.906114, 1, 1, 1, 1, 1,
-0.8207687, -0.7988693, -1.905202, 1, 1, 1, 1, 1,
-0.8114024, -2.357213, -4.096781, 1, 1, 1, 1, 1,
-0.8093144, -2.128437, -2.906734, 1, 1, 1, 1, 1,
-0.8079484, 1.089691, -0.9643481, 0, 0, 1, 1, 1,
-0.8013418, -0.7741439, -2.748174, 1, 0, 0, 1, 1,
-0.8002689, 0.2491209, -0.5793952, 1, 0, 0, 1, 1,
-0.7926126, -0.0478109, -1.304485, 1, 0, 0, 1, 1,
-0.7908224, 0.1102361, -1.412312, 1, 0, 0, 1, 1,
-0.7757307, 0.2185695, -1.67446, 1, 0, 0, 1, 1,
-0.7753849, -1.359054, -4.136159, 0, 0, 0, 1, 1,
-0.7702326, -0.227411, -3.09488, 0, 0, 0, 1, 1,
-0.7684755, 0.5796216, -0.8255469, 0, 0, 0, 1, 1,
-0.7628425, -0.7396894, -2.351421, 0, 0, 0, 1, 1,
-0.7520009, -0.6496298, -3.23048, 0, 0, 0, 1, 1,
-0.7448615, 1.094443, -0.4736286, 0, 0, 0, 1, 1,
-0.7431065, 0.534783, 0.06901713, 0, 0, 0, 1, 1,
-0.7417427, 0.4239752, -0.4382025, 1, 1, 1, 1, 1,
-0.7356525, 0.8042994, -0.6763892, 1, 1, 1, 1, 1,
-0.7352685, 0.7987401, -2.46804, 1, 1, 1, 1, 1,
-0.7318259, -0.4912031, -2.413209, 1, 1, 1, 1, 1,
-0.7279004, 1.688659, 0.5809477, 1, 1, 1, 1, 1,
-0.7263882, -0.9296063, -2.58724, 1, 1, 1, 1, 1,
-0.7239916, 0.831381, -2.469776, 1, 1, 1, 1, 1,
-0.7208701, -2.020722, -1.920817, 1, 1, 1, 1, 1,
-0.7183647, 0.5872045, -1.529287, 1, 1, 1, 1, 1,
-0.7179633, -1.413434, -2.291925, 1, 1, 1, 1, 1,
-0.7167279, 0.9846826, 0.2609815, 1, 1, 1, 1, 1,
-0.7136851, -0.7477769, -3.821146, 1, 1, 1, 1, 1,
-0.7133076, 2.045377, 0.8993555, 1, 1, 1, 1, 1,
-0.7130949, 0.1522894, -1.217894, 1, 1, 1, 1, 1,
-0.7119789, -1.849685, -2.024143, 1, 1, 1, 1, 1,
-0.7119077, -0.05542955, -1.564703, 0, 0, 1, 1, 1,
-0.7060972, -0.1328978, 1.208966, 1, 0, 0, 1, 1,
-0.702298, -0.8951467, -2.772535, 1, 0, 0, 1, 1,
-0.6957788, -0.3532882, -3.304105, 1, 0, 0, 1, 1,
-0.6932715, -0.8473158, -0.002721021, 1, 0, 0, 1, 1,
-0.678196, -0.3284961, -1.825562, 1, 0, 0, 1, 1,
-0.6777691, -0.7084296, -3.57552, 0, 0, 0, 1, 1,
-0.6776628, 0.2670355, -1.539232, 0, 0, 0, 1, 1,
-0.6745242, -0.3264183, -2.325979, 0, 0, 0, 1, 1,
-0.6639306, 0.5468901, -0.02895934, 0, 0, 0, 1, 1,
-0.6632083, 0.3727324, -1.684495, 0, 0, 0, 1, 1,
-0.6631581, -0.1372931, -1.357205, 0, 0, 0, 1, 1,
-0.6583794, -0.287203, -1.618986, 0, 0, 0, 1, 1,
-0.656507, -0.1386822, -0.8267871, 1, 1, 1, 1, 1,
-0.653985, 2.052268, -1.499534, 1, 1, 1, 1, 1,
-0.6537985, -1.368509, -3.03919, 1, 1, 1, 1, 1,
-0.6514023, 0.3017508, -0.2466766, 1, 1, 1, 1, 1,
-0.6508871, -0.2168299, -2.965727, 1, 1, 1, 1, 1,
-0.6478174, -0.7035917, -2.447805, 1, 1, 1, 1, 1,
-0.6469726, 0.6503133, -0.7096937, 1, 1, 1, 1, 1,
-0.6466395, 0.049797, -3.645183, 1, 1, 1, 1, 1,
-0.6376188, -1.543166, -2.476094, 1, 1, 1, 1, 1,
-0.6372756, -0.8348292, -2.953189, 1, 1, 1, 1, 1,
-0.634204, -1.448696, -3.049973, 1, 1, 1, 1, 1,
-0.6333543, 0.7350255, 0.3578188, 1, 1, 1, 1, 1,
-0.63055, 0.4982572, -1.264057, 1, 1, 1, 1, 1,
-0.6277735, -0.6797939, -1.913596, 1, 1, 1, 1, 1,
-0.6263468, 0.3890971, -1.056248, 1, 1, 1, 1, 1,
-0.6262534, 1.280239, -0.01952748, 0, 0, 1, 1, 1,
-0.6235806, -0.2195394, -1.074247, 1, 0, 0, 1, 1,
-0.6181744, 0.994179, 0.7276343, 1, 0, 0, 1, 1,
-0.6152134, -0.130232, -0.3670992, 1, 0, 0, 1, 1,
-0.613345, -0.9192957, -4.175601, 1, 0, 0, 1, 1,
-0.6107594, -1.688894, -0.9716299, 1, 0, 0, 1, 1,
-0.6089967, -0.1941389, -1.722512, 0, 0, 0, 1, 1,
-0.608628, 0.8408145, 0.2858549, 0, 0, 0, 1, 1,
-0.6050171, -1.378377, -3.200632, 0, 0, 0, 1, 1,
-0.6044123, -0.6559178, -1.837614, 0, 0, 0, 1, 1,
-0.6033328, -1.472507, -2.043894, 0, 0, 0, 1, 1,
-0.6012627, 0.07374585, -0.5943731, 0, 0, 0, 1, 1,
-0.6003296, 0.5881043, -1.388649, 0, 0, 0, 1, 1,
-0.5994544, -0.4036681, -1.026353, 1, 1, 1, 1, 1,
-0.5909716, 0.1194542, -2.734767, 1, 1, 1, 1, 1,
-0.5884184, 0.881533, -1.530227, 1, 1, 1, 1, 1,
-0.5810444, -0.7195564, -3.262498, 1, 1, 1, 1, 1,
-0.5809442, -0.07009549, -2.251731, 1, 1, 1, 1, 1,
-0.5795971, 0.6581596, -1.112267, 1, 1, 1, 1, 1,
-0.5794451, 0.9527735, 0.9995075, 1, 1, 1, 1, 1,
-0.5778813, 0.3944623, -1.76507, 1, 1, 1, 1, 1,
-0.5699081, -1.042376, -1.852515, 1, 1, 1, 1, 1,
-0.5679813, -0.447302, -2.294324, 1, 1, 1, 1, 1,
-0.5676871, -1.630121, -1.674839, 1, 1, 1, 1, 1,
-0.5658066, 0.7986588, -1.255153, 1, 1, 1, 1, 1,
-0.564756, 0.2651296, -0.5476118, 1, 1, 1, 1, 1,
-0.5627018, -0.3955508, -0.5820346, 1, 1, 1, 1, 1,
-0.5618504, 0.3651591, -0.2865407, 1, 1, 1, 1, 1,
-0.5591543, -1.240554, -2.74827, 0, 0, 1, 1, 1,
-0.558655, 0.4775207, -1.959082, 1, 0, 0, 1, 1,
-0.5564972, -0.2144226, -2.341798, 1, 0, 0, 1, 1,
-0.5553047, 0.1691492, -1.862122, 1, 0, 0, 1, 1,
-0.5548163, 0.4708639, -0.3320301, 1, 0, 0, 1, 1,
-0.5508627, -0.8097488, -3.879601, 1, 0, 0, 1, 1,
-0.5502518, -0.8900259, -2.010633, 0, 0, 0, 1, 1,
-0.5499244, -0.4883558, -1.589989, 0, 0, 0, 1, 1,
-0.5489902, -0.7800974, -0.2630396, 0, 0, 0, 1, 1,
-0.5428067, -0.007758379, -0.2504297, 0, 0, 0, 1, 1,
-0.5392731, -0.4949122, -3.64054, 0, 0, 0, 1, 1,
-0.5332592, -0.4229311, -2.54566, 0, 0, 0, 1, 1,
-0.5293342, 0.2915117, -0.9510329, 0, 0, 0, 1, 1,
-0.5263905, -0.3869492, -1.904098, 1, 1, 1, 1, 1,
-0.5262522, 0.4351463, -1.241346, 1, 1, 1, 1, 1,
-0.5244032, -0.7745982, -2.39192, 1, 1, 1, 1, 1,
-0.5183705, -1.261284, -2.104443, 1, 1, 1, 1, 1,
-0.5157824, -1.117853, -2.795739, 1, 1, 1, 1, 1,
-0.5128582, -0.1027541, -3.722733, 1, 1, 1, 1, 1,
-0.5126503, 0.1198212, -3.54134, 1, 1, 1, 1, 1,
-0.5089716, -1.290124, -2.480839, 1, 1, 1, 1, 1,
-0.5081191, -0.7462386, -0.9206979, 1, 1, 1, 1, 1,
-0.5051929, -0.9263809, -1.617603, 1, 1, 1, 1, 1,
-0.5049801, -0.5182974, -4.715102, 1, 1, 1, 1, 1,
-0.5031583, 2.446929, -0.8865064, 1, 1, 1, 1, 1,
-0.5030844, -1.252926, -3.074387, 1, 1, 1, 1, 1,
-0.5018476, -0.3593103, -1.128934, 1, 1, 1, 1, 1,
-0.496642, 1.108429, 0.5684695, 1, 1, 1, 1, 1,
-0.496628, -0.03865007, -2.023043, 0, 0, 1, 1, 1,
-0.4945828, 1.304761, 0.0324438, 1, 0, 0, 1, 1,
-0.4936163, -1.044671, -2.939016, 1, 0, 0, 1, 1,
-0.4856392, -1.133974, -3.062428, 1, 0, 0, 1, 1,
-0.4850973, -1.577777, -3.619111, 1, 0, 0, 1, 1,
-0.4824151, -0.08213202, -2.860092, 1, 0, 0, 1, 1,
-0.4822659, -0.7200553, -2.390081, 0, 0, 0, 1, 1,
-0.4794283, -0.1771271, -0.5463536, 0, 0, 0, 1, 1,
-0.477317, -0.5865114, -1.416851, 0, 0, 0, 1, 1,
-0.4770945, -1.256445, -1.465759, 0, 0, 0, 1, 1,
-0.4738801, 0.9667991, 0.676689, 0, 0, 0, 1, 1,
-0.4737704, -0.1671211, -3.772684, 0, 0, 0, 1, 1,
-0.4704529, -0.5761219, -1.621781, 0, 0, 0, 1, 1,
-0.4670669, 0.4311172, -0.037945, 1, 1, 1, 1, 1,
-0.4658302, 0.1513557, -0.5773891, 1, 1, 1, 1, 1,
-0.4652694, -0.4966596, -2.855413, 1, 1, 1, 1, 1,
-0.463209, 0.5489639, 0.3022493, 1, 1, 1, 1, 1,
-0.4628228, -0.04792565, -0.05588322, 1, 1, 1, 1, 1,
-0.4609121, -0.6229764, -2.313127, 1, 1, 1, 1, 1,
-0.4596985, -0.9942619, -3.387627, 1, 1, 1, 1, 1,
-0.4553015, 0.8146014, 1.192283, 1, 1, 1, 1, 1,
-0.4533509, -0.1291137, -1.918915, 1, 1, 1, 1, 1,
-0.4533279, 0.9584982, -0.7730974, 1, 1, 1, 1, 1,
-0.4512863, -0.5702057, -1.450676, 1, 1, 1, 1, 1,
-0.4508666, 1.310609, 0.2532361, 1, 1, 1, 1, 1,
-0.4503024, 1.283064, -0.7364352, 1, 1, 1, 1, 1,
-0.4463544, -1.348728, -1.137473, 1, 1, 1, 1, 1,
-0.4451034, -1.312077, -3.786867, 1, 1, 1, 1, 1,
-0.4450724, 0.2991545, -0.7954934, 0, 0, 1, 1, 1,
-0.4447878, -1.688357, -5.275706, 1, 0, 0, 1, 1,
-0.4421785, 1.148507, -1.084221, 1, 0, 0, 1, 1,
-0.4412843, -0.890351, -3.167036, 1, 0, 0, 1, 1,
-0.439148, 0.726317, -0.3180842, 1, 0, 0, 1, 1,
-0.4383919, 0.8884545, 0.3749779, 1, 0, 0, 1, 1,
-0.4358566, 0.6337036, 0.1230792, 0, 0, 0, 1, 1,
-0.4336791, 0.6969606, 0.9331411, 0, 0, 0, 1, 1,
-0.4249208, -1.766066, -4.022951, 0, 0, 0, 1, 1,
-0.4198735, -1.591149, -2.393737, 0, 0, 0, 1, 1,
-0.4128585, 0.5525813, -2.053134, 0, 0, 0, 1, 1,
-0.4083139, 1.892298, 0.4103159, 0, 0, 0, 1, 1,
-0.4078124, -0.3635713, -1.060301, 0, 0, 0, 1, 1,
-0.4049809, 0.4438523, -0.4935004, 1, 1, 1, 1, 1,
-0.4048688, -0.06455383, -0.7324144, 1, 1, 1, 1, 1,
-0.4018199, -0.7576321, -2.887275, 1, 1, 1, 1, 1,
-0.3995236, -1.445943, -3.603369, 1, 1, 1, 1, 1,
-0.3993011, -0.3714933, -2.836024, 1, 1, 1, 1, 1,
-0.3976656, 0.3622606, -1.276672, 1, 1, 1, 1, 1,
-0.3973562, -0.2389604, -2.558331, 1, 1, 1, 1, 1,
-0.3968751, 0.5278984, 0.8171473, 1, 1, 1, 1, 1,
-0.3923869, -0.3102649, -0.05363197, 1, 1, 1, 1, 1,
-0.3866139, -0.2122314, -3.092067, 1, 1, 1, 1, 1,
-0.3826126, 0.460565, -2.270692, 1, 1, 1, 1, 1,
-0.3753682, -0.04721851, -2.418916, 1, 1, 1, 1, 1,
-0.3695724, 0.6463459, -1.445691, 1, 1, 1, 1, 1,
-0.3643404, -2.761018, -4.043092, 1, 1, 1, 1, 1,
-0.3577568, -1.392444, -4.157787, 1, 1, 1, 1, 1,
-0.3505297, -1.14717, -2.974309, 0, 0, 1, 1, 1,
-0.3494154, 0.3025044, 0.569683, 1, 0, 0, 1, 1,
-0.347645, -0.7132136, -1.884192, 1, 0, 0, 1, 1,
-0.3472233, 0.6326503, 0.2112388, 1, 0, 0, 1, 1,
-0.3459942, -1.717913, -2.715684, 1, 0, 0, 1, 1,
-0.3325768, 0.4347177, -0.1903589, 1, 0, 0, 1, 1,
-0.3306852, 0.3611226, -0.8506122, 0, 0, 0, 1, 1,
-0.3292289, 0.5417572, -1.007925, 0, 0, 0, 1, 1,
-0.3276294, 1.043121, -2.559893, 0, 0, 0, 1, 1,
-0.3253332, 0.6557559, 0.04869498, 0, 0, 0, 1, 1,
-0.3230053, -0.2746919, -3.498292, 0, 0, 0, 1, 1,
-0.3172089, 0.5060189, 0.4770057, 0, 0, 0, 1, 1,
-0.315934, -0.1660992, -2.112959, 0, 0, 0, 1, 1,
-0.3151237, -0.3971568, -0.6896124, 1, 1, 1, 1, 1,
-0.3143022, 0.09434144, -0.2301989, 1, 1, 1, 1, 1,
-0.3106855, -0.132637, -2.086543, 1, 1, 1, 1, 1,
-0.3088109, -1.39112, -5.066271, 1, 1, 1, 1, 1,
-0.3085827, 0.7791405, -1.934084, 1, 1, 1, 1, 1,
-0.3073588, -0.4100227, -1.562103, 1, 1, 1, 1, 1,
-0.3051794, 0.1126169, -1.120636, 1, 1, 1, 1, 1,
-0.3045351, 1.113894, -0.5995766, 1, 1, 1, 1, 1,
-0.2980246, 2.220994, -0.72654, 1, 1, 1, 1, 1,
-0.2941997, 2.255765, -0.09938163, 1, 1, 1, 1, 1,
-0.2914614, -0.9287379, -2.878842, 1, 1, 1, 1, 1,
-0.2901582, 0.5188794, -1.228605, 1, 1, 1, 1, 1,
-0.2866737, -1.453046, -2.375183, 1, 1, 1, 1, 1,
-0.2860238, 0.2560257, -2.915664, 1, 1, 1, 1, 1,
-0.2845455, 0.3236006, -0.1479905, 1, 1, 1, 1, 1,
-0.2826747, -0.2878702, -1.075383, 0, 0, 1, 1, 1,
-0.2764354, 0.6856679, -0.6658149, 1, 0, 0, 1, 1,
-0.2731972, -1.057043, -2.124213, 1, 0, 0, 1, 1,
-0.2719057, -3.021363, -2.259314, 1, 0, 0, 1, 1,
-0.2699386, -1.000725, -2.747409, 1, 0, 0, 1, 1,
-0.2684905, 0.2454513, 0.8136204, 1, 0, 0, 1, 1,
-0.2668523, -0.8075373, -2.760207, 0, 0, 0, 1, 1,
-0.2664683, 0.6353595, -2.559623, 0, 0, 0, 1, 1,
-0.2662403, 0.2076448, -0.9834709, 0, 0, 0, 1, 1,
-0.2622412, 0.6759834, -0.706615, 0, 0, 0, 1, 1,
-0.2610324, -0.487068, -2.905154, 0, 0, 0, 1, 1,
-0.2587512, -2.00701, -4.378103, 0, 0, 0, 1, 1,
-0.252956, -0.2074869, -3.175525, 0, 0, 0, 1, 1,
-0.2454197, 1.260523, -0.3729696, 1, 1, 1, 1, 1,
-0.2378512, -0.346088, -2.719395, 1, 1, 1, 1, 1,
-0.2359099, -0.8581973, -1.06559, 1, 1, 1, 1, 1,
-0.2325225, -0.871654, -3.256905, 1, 1, 1, 1, 1,
-0.2311853, 0.1270612, -0.672567, 1, 1, 1, 1, 1,
-0.2264312, -0.8259364, -3.831534, 1, 1, 1, 1, 1,
-0.2261361, 0.03255934, 0.6383249, 1, 1, 1, 1, 1,
-0.2153165, 1.673557, 0.4968005, 1, 1, 1, 1, 1,
-0.215249, -0.06464963, -1.448198, 1, 1, 1, 1, 1,
-0.2134401, -0.3693457, -5.185176, 1, 1, 1, 1, 1,
-0.2115801, -1.785267, -3.321194, 1, 1, 1, 1, 1,
-0.2008834, 0.4145702, -1.610498, 1, 1, 1, 1, 1,
-0.1979722, -0.4257326, -1.33923, 1, 1, 1, 1, 1,
-0.192982, 1.969452, -0.190287, 1, 1, 1, 1, 1,
-0.1921871, -0.5422255, -4.287165, 1, 1, 1, 1, 1,
-0.1869559, -0.9905698, -2.905836, 0, 0, 1, 1, 1,
-0.1817862, -1.075288, -3.167463, 1, 0, 0, 1, 1,
-0.1798585, -1.254648, -2.91547, 1, 0, 0, 1, 1,
-0.1797298, 0.06672098, -1.60136, 1, 0, 0, 1, 1,
-0.1745394, -0.8357534, -2.728447, 1, 0, 0, 1, 1,
-0.1709948, -0.9432868, -2.053745, 1, 0, 0, 1, 1,
-0.1668395, 0.8215446, -1.353273, 0, 0, 0, 1, 1,
-0.1663868, -0.8671167, -3.658373, 0, 0, 0, 1, 1,
-0.1659276, -0.7534192, -3.068331, 0, 0, 0, 1, 1,
-0.1638956, -0.1335901, -2.47195, 0, 0, 0, 1, 1,
-0.1596863, -0.1616109, -3.219102, 0, 0, 0, 1, 1,
-0.1574492, 0.6444344, -1.422518, 0, 0, 0, 1, 1,
-0.1551941, 0.01438863, -1.752874, 0, 0, 0, 1, 1,
-0.1470469, -0.9618016, -3.158492, 1, 1, 1, 1, 1,
-0.1334903, 0.2988291, 0.8433328, 1, 1, 1, 1, 1,
-0.1292415, -0.8456548, -3.484201, 1, 1, 1, 1, 1,
-0.1269794, -1.566515, -1.871738, 1, 1, 1, 1, 1,
-0.126273, -0.1443302, -2.868691, 1, 1, 1, 1, 1,
-0.1253173, -1.026589, -2.516257, 1, 1, 1, 1, 1,
-0.1240733, 1.618907, -0.7961251, 1, 1, 1, 1, 1,
-0.123487, -0.5538178, -2.764752, 1, 1, 1, 1, 1,
-0.1192075, -0.4614629, -2.794898, 1, 1, 1, 1, 1,
-0.1159163, -1.78578, -3.398515, 1, 1, 1, 1, 1,
-0.1141245, 0.01156509, -0.7910851, 1, 1, 1, 1, 1,
-0.1117809, 0.9673754, 0.282879, 1, 1, 1, 1, 1,
-0.1113286, 0.9985142, -2.507787, 1, 1, 1, 1, 1,
-0.1108589, -1.075026, -3.998438, 1, 1, 1, 1, 1,
-0.1074762, -0.8448364, -2.772029, 1, 1, 1, 1, 1,
-0.1033545, -1.001349, -3.007741, 0, 0, 1, 1, 1,
-0.1010724, -0.2775314, -2.51907, 1, 0, 0, 1, 1,
-0.09570336, -0.9455726, -2.888361, 1, 0, 0, 1, 1,
-0.09226535, 0.7422718, -0.3344672, 1, 0, 0, 1, 1,
-0.09054806, -0.118879, -1.119382, 1, 0, 0, 1, 1,
-0.0897433, 1.048825, -0.5766291, 1, 0, 0, 1, 1,
-0.0861205, 0.5732093, 0.2270779, 0, 0, 0, 1, 1,
-0.08540751, -1.242703, -4.627617, 0, 0, 0, 1, 1,
-0.08325449, -1.681382, -4.304878, 0, 0, 0, 1, 1,
-0.08221257, -0.6625625, -2.867735, 0, 0, 0, 1, 1,
-0.08214767, 0.7861655, -0.3559098, 0, 0, 0, 1, 1,
-0.07762069, -1.092145, -3.924526, 0, 0, 0, 1, 1,
-0.07236124, -1.605181, -2.502246, 0, 0, 0, 1, 1,
-0.06720456, 0.2793761, -0.1828329, 1, 1, 1, 1, 1,
-0.06247307, -0.6209518, -2.000069, 1, 1, 1, 1, 1,
-0.06186412, 1.501677, 1.201301, 1, 1, 1, 1, 1,
-0.06145327, 1.183085, -0.9333459, 1, 1, 1, 1, 1,
-0.05860766, 0.9023409, 1.645808, 1, 1, 1, 1, 1,
-0.05785079, 0.0464646, 0.1694413, 1, 1, 1, 1, 1,
-0.05721569, -0.7799826, -4.816476, 1, 1, 1, 1, 1,
-0.05638839, -1.272393, -0.7585863, 1, 1, 1, 1, 1,
-0.05326974, 1.139351, 0.8436788, 1, 1, 1, 1, 1,
-0.05307705, -0.4440829, -2.220515, 1, 1, 1, 1, 1,
-0.05141418, 0.8270051, 0.2955562, 1, 1, 1, 1, 1,
-0.04797711, 0.008820375, -1.438922, 1, 1, 1, 1, 1,
-0.04243043, -0.02071949, -3.186512, 1, 1, 1, 1, 1,
-0.04123722, 0.06895591, -0.2757184, 1, 1, 1, 1, 1,
-0.03719761, 0.1481451, 0.6430757, 1, 1, 1, 1, 1,
-0.03660413, 0.0442416, -1.015341, 0, 0, 1, 1, 1,
-0.03163084, 0.5922699, -1.396849, 1, 0, 0, 1, 1,
-0.03045961, 1.181174, 1.412667, 1, 0, 0, 1, 1,
-0.03036648, 1.030205, -0.7773302, 1, 0, 0, 1, 1,
-0.03005415, -0.7759316, -2.272719, 1, 0, 0, 1, 1,
-0.02917172, 2.058166, 1.378042, 1, 0, 0, 1, 1,
-0.02563751, 0.374512, 1.644672, 0, 0, 0, 1, 1,
-0.02373904, -1.395185, -4.112568, 0, 0, 0, 1, 1,
-0.02360895, -0.4124768, -3.307811, 0, 0, 0, 1, 1,
-0.0230481, 0.5471982, -1.047889, 0, 0, 0, 1, 1,
-0.01984164, -0.286558, -2.36697, 0, 0, 0, 1, 1,
-0.01540695, 0.8600416, 1.810168, 0, 0, 0, 1, 1,
-0.007683453, 1.112256, -0.4099743, 0, 0, 0, 1, 1,
-0.005180168, -0.4428232, -3.100945, 1, 1, 1, 1, 1,
-0.003984935, 0.4348686, -0.2468204, 1, 1, 1, 1, 1,
0.003230977, -0.06825478, 4.383765, 1, 1, 1, 1, 1,
0.005420862, -1.899205, 2.891904, 1, 1, 1, 1, 1,
0.005829675, -0.2493614, 3.151062, 1, 1, 1, 1, 1,
0.005909412, -1.548675, 2.37554, 1, 1, 1, 1, 1,
0.007332518, -0.4923726, 3.604403, 1, 1, 1, 1, 1,
0.008915131, -0.5482392, 2.342231, 1, 1, 1, 1, 1,
0.0097854, -1.987828, 3.493618, 1, 1, 1, 1, 1,
0.0138607, -0.285748, 5.440923, 1, 1, 1, 1, 1,
0.01841432, 0.6109296, 1.451474, 1, 1, 1, 1, 1,
0.02253046, -0.6262698, 4.707601, 1, 1, 1, 1, 1,
0.02637458, 0.01013237, 0.6512987, 1, 1, 1, 1, 1,
0.02653875, -0.1301853, 1.408624, 1, 1, 1, 1, 1,
0.02663785, 0.913308, 0.6722932, 1, 1, 1, 1, 1,
0.02852734, -0.7729908, 4.883517, 0, 0, 1, 1, 1,
0.03207795, 0.05028406, -0.5613441, 1, 0, 0, 1, 1,
0.03220939, 0.809064, -2.698544, 1, 0, 0, 1, 1,
0.03238171, 0.4345349, -0.01033045, 1, 0, 0, 1, 1,
0.03483206, -2.18829, 3.457463, 1, 0, 0, 1, 1,
0.03631851, -0.4467898, 4.917561, 1, 0, 0, 1, 1,
0.03651853, 0.06553198, 1.981451, 0, 0, 0, 1, 1,
0.04286246, 0.1856342, -0.000939096, 0, 0, 0, 1, 1,
0.04408889, 1.659546, -0.5212896, 0, 0, 0, 1, 1,
0.05393485, -0.4415729, 4.395583, 0, 0, 0, 1, 1,
0.05489608, -0.5635931, 2.317586, 0, 0, 0, 1, 1,
0.0581575, -0.6260677, 1.139966, 0, 0, 0, 1, 1,
0.05933021, -1.15411, 2.234129, 0, 0, 0, 1, 1,
0.06090274, -1.094393, 4.659263, 1, 1, 1, 1, 1,
0.06105128, 1.368882, 0.141111, 1, 1, 1, 1, 1,
0.07358421, -0.1117728, 2.346861, 1, 1, 1, 1, 1,
0.07468327, 0.9073751, -0.0907288, 1, 1, 1, 1, 1,
0.07506761, -0.2995991, 1.867446, 1, 1, 1, 1, 1,
0.07523973, -0.1880749, 4.154622, 1, 1, 1, 1, 1,
0.07678733, 1.181835, 1.87851, 1, 1, 1, 1, 1,
0.07792327, 0.8260694, -1.100336, 1, 1, 1, 1, 1,
0.07909447, 1.391688, -1.406686, 1, 1, 1, 1, 1,
0.07998043, -0.1887486, 1.369435, 1, 1, 1, 1, 1,
0.08099178, -0.0009049762, 1.358294, 1, 1, 1, 1, 1,
0.08604095, 0.1025233, -1.099464, 1, 1, 1, 1, 1,
0.08697392, 0.5074736, -1.312788, 1, 1, 1, 1, 1,
0.08808262, 0.7006152, 2.179724, 1, 1, 1, 1, 1,
0.09046388, 1.070538, -0.7108538, 1, 1, 1, 1, 1,
0.09587736, -0.39755, 4.379208, 0, 0, 1, 1, 1,
0.1032246, -1.190623, 3.579453, 1, 0, 0, 1, 1,
0.1039459, 0.0140865, 2.204488, 1, 0, 0, 1, 1,
0.1039802, 0.1561468, 2.51464, 1, 0, 0, 1, 1,
0.1045915, -0.2321203, 0.7732763, 1, 0, 0, 1, 1,
0.111246, 0.7145882, 0.3490619, 1, 0, 0, 1, 1,
0.1129567, -0.08702838, 2.462011, 0, 0, 0, 1, 1,
0.1190108, -0.03088441, 1.656145, 0, 0, 0, 1, 1,
0.1344976, 0.2971913, 0.1627153, 0, 0, 0, 1, 1,
0.1346837, 1.559882, 2.105485, 0, 0, 0, 1, 1,
0.1414634, 0.3403873, 0.3349803, 0, 0, 0, 1, 1,
0.1424768, -0.1512398, 1.324303, 0, 0, 0, 1, 1,
0.1436153, -0.5026663, 1.715362, 0, 0, 0, 1, 1,
0.1436572, -1.438969, 4.52292, 1, 1, 1, 1, 1,
0.1481618, -0.3032182, 2.244199, 1, 1, 1, 1, 1,
0.1500103, -0.2503213, 2.786605, 1, 1, 1, 1, 1,
0.1575519, 1.401281, -0.04541884, 1, 1, 1, 1, 1,
0.1581815, -0.8158336, 3.086477, 1, 1, 1, 1, 1,
0.1591124, 1.477925, -0.6928802, 1, 1, 1, 1, 1,
0.1591991, -1.185524, 3.754156, 1, 1, 1, 1, 1,
0.1601867, 0.2619089, 0.472029, 1, 1, 1, 1, 1,
0.1618896, 0.02340051, 1.298116, 1, 1, 1, 1, 1,
0.1696035, 0.01975095, 0.1434039, 1, 1, 1, 1, 1,
0.1704894, -0.6303172, 1.644496, 1, 1, 1, 1, 1,
0.1745005, 0.3689221, 0.2249327, 1, 1, 1, 1, 1,
0.1771857, -0.4347769, 2.276331, 1, 1, 1, 1, 1,
0.180232, -0.1075461, 2.193273, 1, 1, 1, 1, 1,
0.1834424, 3.161891, -0.5732768, 1, 1, 1, 1, 1,
0.1850865, 0.5256827, 2.181691, 0, 0, 1, 1, 1,
0.1852428, 0.814088, -0.8927149, 1, 0, 0, 1, 1,
0.1887974, -0.1183674, 4.27089, 1, 0, 0, 1, 1,
0.1900585, 2.048059, -0.3970532, 1, 0, 0, 1, 1,
0.1902341, -0.7219588, 2.396819, 1, 0, 0, 1, 1,
0.1936771, 1.034176, -0.05803498, 1, 0, 0, 1, 1,
0.194877, 0.194985, -0.01135254, 0, 0, 0, 1, 1,
0.1954414, 3.339648, 0.1167654, 0, 0, 0, 1, 1,
0.1955349, -1.038108, 4.723972, 0, 0, 0, 1, 1,
0.1974014, -0.6646193, 4.571389, 0, 0, 0, 1, 1,
0.1983, -0.8157117, 1.213237, 0, 0, 0, 1, 1,
0.1990415, 0.1403955, 0.8921084, 0, 0, 0, 1, 1,
0.2031039, 1.650666, -0.2874708, 0, 0, 0, 1, 1,
0.2048309, 0.1204399, 1.15057, 1, 1, 1, 1, 1,
0.2062378, -0.6670961, 2.211856, 1, 1, 1, 1, 1,
0.2150367, -0.415415, 2.097509, 1, 1, 1, 1, 1,
0.2152331, 0.0696047, 2.097273, 1, 1, 1, 1, 1,
0.2154373, 0.5912187, -0.5986312, 1, 1, 1, 1, 1,
0.2170856, -1.534559, 1.582435, 1, 1, 1, 1, 1,
0.2187417, 1.612905, 0.3413578, 1, 1, 1, 1, 1,
0.2229037, 2.503542, -1.18807, 1, 1, 1, 1, 1,
0.2234908, 0.8988498, 0.3311021, 1, 1, 1, 1, 1,
0.2287861, 0.2266056, -0.434958, 1, 1, 1, 1, 1,
0.2289996, -1.356087, 1.621721, 1, 1, 1, 1, 1,
0.235875, 0.4229986, 1.412544, 1, 1, 1, 1, 1,
0.2359682, -0.4750819, 1.16902, 1, 1, 1, 1, 1,
0.2374514, -0.08660751, 1.52326, 1, 1, 1, 1, 1,
0.2391897, -0.2254755, 2.354344, 1, 1, 1, 1, 1,
0.2430827, 1.117147, -1.104902, 0, 0, 1, 1, 1,
0.2433061, 0.932377, -2.441119, 1, 0, 0, 1, 1,
0.2462116, -1.371485, 4.343316, 1, 0, 0, 1, 1,
0.2485988, -1.232112, 3.306299, 1, 0, 0, 1, 1,
0.2489366, 0.7034851, 1.134184, 1, 0, 0, 1, 1,
0.2504224, 1.173505, 0.749985, 1, 0, 0, 1, 1,
0.2527497, 0.3922411, 1.33306, 0, 0, 0, 1, 1,
0.2554164, 0.01131524, 2.114747, 0, 0, 0, 1, 1,
0.2569829, -1.055444, 2.59193, 0, 0, 0, 1, 1,
0.2578713, -0.9626582, 3.694552, 0, 0, 0, 1, 1,
0.2593267, -0.4717509, 2.186792, 0, 0, 0, 1, 1,
0.2699775, -0.6865592, 3.454447, 0, 0, 0, 1, 1,
0.273884, -0.4263766, 2.264485, 0, 0, 0, 1, 1,
0.2794803, -0.0536374, 1.924332, 1, 1, 1, 1, 1,
0.2803729, 0.1870352, -0.1419941, 1, 1, 1, 1, 1,
0.2818937, 0.01904482, 1.336143, 1, 1, 1, 1, 1,
0.2827583, 1.135778, -2.273211, 1, 1, 1, 1, 1,
0.2843289, 0.7333692, 1.534455, 1, 1, 1, 1, 1,
0.2844867, -1.36054, 3.913372, 1, 1, 1, 1, 1,
0.2868896, 2.383467, -0.1063697, 1, 1, 1, 1, 1,
0.2898433, 1.874071, 0.3875861, 1, 1, 1, 1, 1,
0.2908747, 0.6849857, -1.649144, 1, 1, 1, 1, 1,
0.2943585, 0.4627855, 1.209382, 1, 1, 1, 1, 1,
0.2950686, -0.08878845, 0.9984998, 1, 1, 1, 1, 1,
0.2972789, 0.05198507, 0.2991827, 1, 1, 1, 1, 1,
0.2997133, 2.357586, 0.1104348, 1, 1, 1, 1, 1,
0.30015, -0.766363, 2.959153, 1, 1, 1, 1, 1,
0.3061489, -1.134079, 4.696713, 1, 1, 1, 1, 1,
0.3068181, 1.457688, 0.05734052, 0, 0, 1, 1, 1,
0.3125424, 1.346055, 1.84825, 1, 0, 0, 1, 1,
0.3156424, 0.06125598, 0.7551539, 1, 0, 0, 1, 1,
0.3172276, -1.475213, 2.882416, 1, 0, 0, 1, 1,
0.3189075, 0.2814518, 2.525477, 1, 0, 0, 1, 1,
0.3204635, 1.644646, -1.473106, 1, 0, 0, 1, 1,
0.3218279, -0.2260679, 3.084925, 0, 0, 0, 1, 1,
0.3228212, -0.7579757, 4.11282, 0, 0, 0, 1, 1,
0.3234804, 0.9453321, -0.6828335, 0, 0, 0, 1, 1,
0.3235261, 0.4273134, 0.2559485, 0, 0, 0, 1, 1,
0.3255865, -1.133034, 3.17135, 0, 0, 0, 1, 1,
0.3263446, -0.5410402, 2.280054, 0, 0, 0, 1, 1,
0.3290215, -2.0818, 2.741775, 0, 0, 0, 1, 1,
0.3345686, -1.691599, 2.842023, 1, 1, 1, 1, 1,
0.3434266, 0.8638149, 0.5402673, 1, 1, 1, 1, 1,
0.3459609, 1.000781, 1.318608, 1, 1, 1, 1, 1,
0.3471898, -1.054767, 3.574856, 1, 1, 1, 1, 1,
0.3480578, -1.079576, 3.408627, 1, 1, 1, 1, 1,
0.3526092, -0.2596803, 2.658827, 1, 1, 1, 1, 1,
0.3544331, -0.4115331, 2.943011, 1, 1, 1, 1, 1,
0.3545241, 0.6447632, -0.9774708, 1, 1, 1, 1, 1,
0.3553149, -0.7782365, 3.214772, 1, 1, 1, 1, 1,
0.3588582, -1.30106, 2.642534, 1, 1, 1, 1, 1,
0.3603456, 1.143602, 1.498694, 1, 1, 1, 1, 1,
0.3604315, 2.562572, -0.5825981, 1, 1, 1, 1, 1,
0.3656175, -1.076017, 3.808998, 1, 1, 1, 1, 1,
0.3785146, -0.7835528, 5.258415, 1, 1, 1, 1, 1,
0.3786222, -1.752013, 2.930293, 1, 1, 1, 1, 1,
0.3795846, -1.228118, 3.435665, 0, 0, 1, 1, 1,
0.3812121, 0.4993614, 1.246407, 1, 0, 0, 1, 1,
0.3848469, 1.005833, 0.8292797, 1, 0, 0, 1, 1,
0.3889149, -0.09459554, 0.7306548, 1, 0, 0, 1, 1,
0.3924218, -1.432988, 2.948158, 1, 0, 0, 1, 1,
0.394383, 0.04134124, 0.1749854, 1, 0, 0, 1, 1,
0.3955004, -1.65815, 2.714609, 0, 0, 0, 1, 1,
0.395843, -1.125239, 1.927573, 0, 0, 0, 1, 1,
0.3966093, -3.121716, 1.457974, 0, 0, 0, 1, 1,
0.4005933, 0.7293723, 0.8488085, 0, 0, 0, 1, 1,
0.4012708, -0.7484617, 0.9383804, 0, 0, 0, 1, 1,
0.4022377, 0.5687687, 0.1901975, 0, 0, 0, 1, 1,
0.4055768, -0.5475162, 3.961176, 0, 0, 0, 1, 1,
0.410263, -0.5461643, 1.479314, 1, 1, 1, 1, 1,
0.415161, -1.375966, 1.163992, 1, 1, 1, 1, 1,
0.4170205, 0.7826897, 0.1953339, 1, 1, 1, 1, 1,
0.4191118, 0.330374, 1.484288, 1, 1, 1, 1, 1,
0.4196465, -0.2727337, 2.735888, 1, 1, 1, 1, 1,
0.427626, 0.1292659, 1.04587, 1, 1, 1, 1, 1,
0.4279254, 0.4769239, 0.1228464, 1, 1, 1, 1, 1,
0.4322985, 1.340108, 0.3260796, 1, 1, 1, 1, 1,
0.4340805, 0.7186435, 1.712533, 1, 1, 1, 1, 1,
0.4362142, -0.8471683, 2.972286, 1, 1, 1, 1, 1,
0.4370601, 2.213215, 1.216048, 1, 1, 1, 1, 1,
0.4385916, 0.7294009, -1.293809, 1, 1, 1, 1, 1,
0.4496402, -0.8082018, 3.073123, 1, 1, 1, 1, 1,
0.4512074, 0.1857806, 2.294212, 1, 1, 1, 1, 1,
0.4582674, -1.533344, 3.841994, 1, 1, 1, 1, 1,
0.4592769, -0.1362741, 1.47577, 0, 0, 1, 1, 1,
0.4607289, -0.1510119, 2.021737, 1, 0, 0, 1, 1,
0.461232, 0.1080838, 2.160468, 1, 0, 0, 1, 1,
0.4625419, 0.7431127, -0.6733983, 1, 0, 0, 1, 1,
0.4632583, 1.560036, 1.972818, 1, 0, 0, 1, 1,
0.4658047, -0.5384766, 2.215236, 1, 0, 0, 1, 1,
0.4665838, 0.959498, 1.844932, 0, 0, 0, 1, 1,
0.4669276, -1.870301, 3.071697, 0, 0, 0, 1, 1,
0.4760314, 1.23333, -0.3338076, 0, 0, 0, 1, 1,
0.4764386, -0.2934002, 3.073355, 0, 0, 0, 1, 1,
0.4775638, -0.7203478, 4.641508, 0, 0, 0, 1, 1,
0.4789968, -0.7007374, 2.404875, 0, 0, 0, 1, 1,
0.4795778, 0.1275665, 1.875836, 0, 0, 0, 1, 1,
0.4802926, 0.03018021, 0.2688952, 1, 1, 1, 1, 1,
0.4828051, 0.3499923, 1.271599, 1, 1, 1, 1, 1,
0.4831971, -0.5177873, 2.538334, 1, 1, 1, 1, 1,
0.4897781, -2.475479, 1.601844, 1, 1, 1, 1, 1,
0.4927328, -1.211565, 1.782287, 1, 1, 1, 1, 1,
0.4943154, 0.7898395, 1.397994, 1, 1, 1, 1, 1,
0.4951024, -0.4164919, 1.072114, 1, 1, 1, 1, 1,
0.4966942, -0.1246296, 2.298749, 1, 1, 1, 1, 1,
0.5024741, -0.2912811, 2.554797, 1, 1, 1, 1, 1,
0.5031564, -1.650282, 2.276571, 1, 1, 1, 1, 1,
0.5108486, -0.7602813, 2.259814, 1, 1, 1, 1, 1,
0.5113835, 0.2270055, -0.941682, 1, 1, 1, 1, 1,
0.5167557, 0.007401963, 1.248659, 1, 1, 1, 1, 1,
0.521944, 1.60482, 0.9053424, 1, 1, 1, 1, 1,
0.5261973, -0.1615289, 1.633835, 1, 1, 1, 1, 1,
0.5270839, -0.2955532, 2.815613, 0, 0, 1, 1, 1,
0.5276119, 1.600986, -0.4047504, 1, 0, 0, 1, 1,
0.5278567, -0.9310402, 1.927912, 1, 0, 0, 1, 1,
0.5312859, 0.5836396, 0.1510696, 1, 0, 0, 1, 1,
0.5338333, -0.1989116, -0.1919378, 1, 0, 0, 1, 1,
0.5398867, 1.758808, -1.537545, 1, 0, 0, 1, 1,
0.5433464, 0.5621276, -0.5890498, 0, 0, 0, 1, 1,
0.5436782, -2.205076, 2.64831, 0, 0, 0, 1, 1,
0.5442225, -0.8990136, 0.5128299, 0, 0, 0, 1, 1,
0.5500027, -0.677891, 2.794467, 0, 0, 0, 1, 1,
0.5525509, -1.691627, 4.160448, 0, 0, 0, 1, 1,
0.5544599, -1.028475, 3.426714, 0, 0, 0, 1, 1,
0.5570759, 1.651494, -0.4556991, 0, 0, 0, 1, 1,
0.5579758, 1.080727, 1.446895, 1, 1, 1, 1, 1,
0.5628939, -0.1942641, 1.447902, 1, 1, 1, 1, 1,
0.5634308, 0.6984938, 0.6055609, 1, 1, 1, 1, 1,
0.5649438, 0.5420207, 0.2557743, 1, 1, 1, 1, 1,
0.5652, 0.6791288, -0.1997742, 1, 1, 1, 1, 1,
0.5664548, -0.5463923, 0.8659112, 1, 1, 1, 1, 1,
0.5745075, 0.2130403, 3.718452, 1, 1, 1, 1, 1,
0.5762168, -0.7631018, 2.273519, 1, 1, 1, 1, 1,
0.5780106, 0.3551499, 1.716038, 1, 1, 1, 1, 1,
0.579579, -0.9847569, 2.357107, 1, 1, 1, 1, 1,
0.58066, -0.4363159, 3.384897, 1, 1, 1, 1, 1,
0.5847608, -0.0656122, 2.003664, 1, 1, 1, 1, 1,
0.5871913, 0.809466, 1.855149, 1, 1, 1, 1, 1,
0.5935197, 0.5981871, 1.002441, 1, 1, 1, 1, 1,
0.5973478, -0.2910533, 3.149292, 1, 1, 1, 1, 1,
0.5996391, 0.2618341, -0.7195032, 0, 0, 1, 1, 1,
0.6012577, 0.4492281, -0.7377413, 1, 0, 0, 1, 1,
0.6036403, -0.0799522, 2.21914, 1, 0, 0, 1, 1,
0.621842, -0.02566593, 2.403504, 1, 0, 0, 1, 1,
0.6249243, 1.324668, -0.6988977, 1, 0, 0, 1, 1,
0.6270872, -0.5313108, 1.445344, 1, 0, 0, 1, 1,
0.6366446, 2.98349, 1.304448, 0, 0, 0, 1, 1,
0.6372967, 0.3120949, 1.162664, 0, 0, 0, 1, 1,
0.6378859, 1.183867, 1.194075, 0, 0, 0, 1, 1,
0.6381637, 0.4048296, 1.954896, 0, 0, 0, 1, 1,
0.6389511, -0.07599715, 3.226574, 0, 0, 0, 1, 1,
0.6393305, -0.3359434, 2.196842, 0, 0, 0, 1, 1,
0.6419473, -0.02003112, 3.245286, 0, 0, 0, 1, 1,
0.6520948, 1.11409, 0.4536408, 1, 1, 1, 1, 1,
0.6555128, 1.46949, 0.3389199, 1, 1, 1, 1, 1,
0.6584504, -0.7281979, 1.901857, 1, 1, 1, 1, 1,
0.6638431, 0.09489801, 1.427415, 1, 1, 1, 1, 1,
0.6642256, -1.336304, 3.746784, 1, 1, 1, 1, 1,
0.669866, -0.3764272, 1.933258, 1, 1, 1, 1, 1,
0.68817, -1.359556, 3.791527, 1, 1, 1, 1, 1,
0.6884279, 0.03649831, 3.226809, 1, 1, 1, 1, 1,
0.6892696, 0.5590056, 1.248195, 1, 1, 1, 1, 1,
0.6901471, -0.4263328, 2.671652, 1, 1, 1, 1, 1,
0.6930444, 2.051776, -1.361223, 1, 1, 1, 1, 1,
0.6930614, -1.214267, 4.087858, 1, 1, 1, 1, 1,
0.694414, -0.9574082, 2.474147, 1, 1, 1, 1, 1,
0.6968533, -1.239827, 3.126694, 1, 1, 1, 1, 1,
0.7050487, 0.3403367, 0.3622162, 1, 1, 1, 1, 1,
0.708463, -0.009364197, 0.6049105, 0, 0, 1, 1, 1,
0.7137891, 1.66587, 2.233553, 1, 0, 0, 1, 1,
0.7139953, 0.4982353, 1.7557, 1, 0, 0, 1, 1,
0.7146127, 0.3895169, 0.0557628, 1, 0, 0, 1, 1,
0.7181494, -0.230292, 2.146826, 1, 0, 0, 1, 1,
0.7258155, 0.9442232, 0.5530052, 1, 0, 0, 1, 1,
0.725948, 1.243021, 0.8306056, 0, 0, 0, 1, 1,
0.7338678, 0.6793566, 0.4149466, 0, 0, 0, 1, 1,
0.7361413, 0.1292699, 2.705936, 0, 0, 0, 1, 1,
0.7406792, 0.6959437, 1.448426, 0, 0, 0, 1, 1,
0.7423877, -0.06185943, 0.6889321, 0, 0, 0, 1, 1,
0.7432351, -0.3671325, 3.622411, 0, 0, 0, 1, 1,
0.7460155, -0.2322091, 2.699331, 0, 0, 0, 1, 1,
0.7503632, -1.487194, 1.625558, 1, 1, 1, 1, 1,
0.7541888, 0.0897579, 0.8392869, 1, 1, 1, 1, 1,
0.7554829, 0.9010925, 0.8934006, 1, 1, 1, 1, 1,
0.7568359, -0.004534941, 0.8775131, 1, 1, 1, 1, 1,
0.7570324, -0.2931311, 1.625855, 1, 1, 1, 1, 1,
0.7666148, -0.1742127, 0.299196, 1, 1, 1, 1, 1,
0.7699583, 0.648955, 0.6615273, 1, 1, 1, 1, 1,
0.7729392, -0.1550624, -0.419927, 1, 1, 1, 1, 1,
0.7731466, 0.7764398, 1.554291, 1, 1, 1, 1, 1,
0.7844737, -0.2530314, 2.06556, 1, 1, 1, 1, 1,
0.785129, -0.1438261, 1.610018, 1, 1, 1, 1, 1,
0.7880512, 0.7869012, 1.295664, 1, 1, 1, 1, 1,
0.7906457, -0.06676384, 0.2735074, 1, 1, 1, 1, 1,
0.7942209, 0.8355826, -1.657042, 1, 1, 1, 1, 1,
0.7968516, -0.3335335, 3.767537, 1, 1, 1, 1, 1,
0.8037203, -1.335932, 2.822457, 0, 0, 1, 1, 1,
0.8037634, -0.418298, 4.284746, 1, 0, 0, 1, 1,
0.8131654, -2.414362, 2.357179, 1, 0, 0, 1, 1,
0.8193873, 0.04176725, 0.7396005, 1, 0, 0, 1, 1,
0.8217025, -0.5179215, 1.20958, 1, 0, 0, 1, 1,
0.8225878, -0.2192731, 2.456448, 1, 0, 0, 1, 1,
0.8256039, -0.9453444, 3.954755, 0, 0, 0, 1, 1,
0.8292128, 0.2515847, 2.301265, 0, 0, 0, 1, 1,
0.8308139, 0.5886196, 2.855508, 0, 0, 0, 1, 1,
0.8412338, -1.478054, 4.207032, 0, 0, 0, 1, 1,
0.8504521, -0.3123329, 1.412383, 0, 0, 0, 1, 1,
0.8533461, 0.5180537, -0.6071267, 0, 0, 0, 1, 1,
0.8565466, 0.1439424, 2.731009, 0, 0, 0, 1, 1,
0.8586574, 0.5729225, -0.2751366, 1, 1, 1, 1, 1,
0.8626027, -0.3067439, 1.350273, 1, 1, 1, 1, 1,
0.8647979, -0.05435883, 2.258647, 1, 1, 1, 1, 1,
0.8667372, 0.9776743, 0.5962291, 1, 1, 1, 1, 1,
0.8690663, 1.561858, 1.014264, 1, 1, 1, 1, 1,
0.8700113, 0.09783014, 1.561331, 1, 1, 1, 1, 1,
0.8771938, -0.4826651, 1.831225, 1, 1, 1, 1, 1,
0.8808826, 1.221227, -0.9391299, 1, 1, 1, 1, 1,
0.8858717, 0.5842079, 1.276157, 1, 1, 1, 1, 1,
0.8886505, -0.59988, 2.27259, 1, 1, 1, 1, 1,
0.8898451, -0.6097927, 0.103689, 1, 1, 1, 1, 1,
0.900079, -0.3506694, 0.4528882, 1, 1, 1, 1, 1,
0.9003304, -0.1275368, 0.8652703, 1, 1, 1, 1, 1,
0.9044746, -1.803393, 3.322128, 1, 1, 1, 1, 1,
0.9067295, -1.29269, 4.503115, 1, 1, 1, 1, 1,
0.9082825, -0.009110661, 2.750745, 0, 0, 1, 1, 1,
0.9093969, 0.7278059, 0.9990982, 1, 0, 0, 1, 1,
0.9112557, -0.2859146, 1.732435, 1, 0, 0, 1, 1,
0.9119732, -0.1825939, 2.204417, 1, 0, 0, 1, 1,
0.918416, 0.004798858, 2.843776, 1, 0, 0, 1, 1,
0.9199049, 0.01150407, 3.457078, 1, 0, 0, 1, 1,
0.9280118, -0.6233346, -0.1519612, 0, 0, 0, 1, 1,
0.9325733, 0.483613, -0.9372525, 0, 0, 0, 1, 1,
0.933108, -0.9589903, 2.726277, 0, 0, 0, 1, 1,
0.9341109, -0.7906698, 3.190524, 0, 0, 0, 1, 1,
0.934949, -2.221488, 2.682729, 0, 0, 0, 1, 1,
0.935788, 0.1307676, 2.520091, 0, 0, 0, 1, 1,
0.9453346, 1.733742, 0.8888201, 0, 0, 0, 1, 1,
0.9464289, -1.077065, 1.977759, 1, 1, 1, 1, 1,
0.9563051, 2.104819, 1.782345, 1, 1, 1, 1, 1,
0.960986, 0.6920388, -0.06052012, 1, 1, 1, 1, 1,
0.9619173, 0.2914357, 1.407017, 1, 1, 1, 1, 1,
0.963843, 0.1981513, 1.433631, 1, 1, 1, 1, 1,
0.9659098, 0.5289038, 0.5946887, 1, 1, 1, 1, 1,
0.9866872, -1.080464, 1.566438, 1, 1, 1, 1, 1,
0.9907261, 0.5392737, 2.611717, 1, 1, 1, 1, 1,
1.011961, -0.503956, 2.216268, 1, 1, 1, 1, 1,
1.012406, -0.9937658, 3.192756, 1, 1, 1, 1, 1,
1.015519, -0.5294424, 1.365883, 1, 1, 1, 1, 1,
1.021515, 2.16556, -0.9001543, 1, 1, 1, 1, 1,
1.024845, 0.3930867, -0.5300307, 1, 1, 1, 1, 1,
1.025309, -1.314221, 3.35584, 1, 1, 1, 1, 1,
1.027749, -1.07083, 3.057345, 1, 1, 1, 1, 1,
1.029913, 1.786321, 0.5431496, 0, 0, 1, 1, 1,
1.032929, 1.809022, 0.9591955, 1, 0, 0, 1, 1,
1.034825, 0.2330678, 0.2207288, 1, 0, 0, 1, 1,
1.04723, 0.04141968, 0.4726166, 1, 0, 0, 1, 1,
1.051388, -1.19997, 4.506695, 1, 0, 0, 1, 1,
1.058764, 0.7809694, 2.550153, 1, 0, 0, 1, 1,
1.061717, 0.4497277, 0.2276522, 0, 0, 0, 1, 1,
1.065387, 0.1057424, 2.405954, 0, 0, 0, 1, 1,
1.066995, -0.3601467, 2.421295, 0, 0, 0, 1, 1,
1.067019, -0.1368391, 2.959175, 0, 0, 0, 1, 1,
1.067389, -0.7759339, 2.215939, 0, 0, 0, 1, 1,
1.071905, 0.6306754, 0.9253749, 0, 0, 0, 1, 1,
1.079911, 2.019367, -0.3002445, 0, 0, 0, 1, 1,
1.098438, -1.670913, 1.833696, 1, 1, 1, 1, 1,
1.104074, 0.4610669, -0.279994, 1, 1, 1, 1, 1,
1.108346, 0.791305, 1.827565, 1, 1, 1, 1, 1,
1.109432, -0.307426, 1.575882, 1, 1, 1, 1, 1,
1.114661, -1.217724, 2.021903, 1, 1, 1, 1, 1,
1.121792, 0.6629649, 0.5087754, 1, 1, 1, 1, 1,
1.137723, 1.160119, 2.436899, 1, 1, 1, 1, 1,
1.141103, -0.7145129, 1.119654, 1, 1, 1, 1, 1,
1.143234, -0.4645971, 1.603601, 1, 1, 1, 1, 1,
1.149652, 0.5127197, 0.8740167, 1, 1, 1, 1, 1,
1.154191, 1.104548, 0.1278543, 1, 1, 1, 1, 1,
1.164465, 0.9726856, 0.7703562, 1, 1, 1, 1, 1,
1.181396, -2.714183, 2.655304, 1, 1, 1, 1, 1,
1.189268, -1.040976, 3.066417, 1, 1, 1, 1, 1,
1.195328, 1.250813, 1.856243, 1, 1, 1, 1, 1,
1.198951, 0.2538851, 0.9788728, 0, 0, 1, 1, 1,
1.207856, 0.3279392, -0.1435076, 1, 0, 0, 1, 1,
1.20916, -0.3282969, 2.072376, 1, 0, 0, 1, 1,
1.21141, -1.292768, 2.706589, 1, 0, 0, 1, 1,
1.212226, 0.4868688, 1.815667, 1, 0, 0, 1, 1,
1.218917, 2.243586, -0.7055766, 1, 0, 0, 1, 1,
1.222449, -0.3269042, 2.986329, 0, 0, 0, 1, 1,
1.224769, 1.298594, 1.439263, 0, 0, 0, 1, 1,
1.227329, 0.1863061, 1.753816, 0, 0, 0, 1, 1,
1.232103, -1.025765, 2.505609, 0, 0, 0, 1, 1,
1.233645, -0.8524457, 2.349684, 0, 0, 0, 1, 1,
1.248439, 1.083104, 0.5870127, 0, 0, 0, 1, 1,
1.263365, 0.7619827, 0.4085114, 0, 0, 0, 1, 1,
1.264142, -0.2915802, 2.849791, 1, 1, 1, 1, 1,
1.280225, 0.9329806, 1.826721, 1, 1, 1, 1, 1,
1.283606, -0.7386264, 2.592768, 1, 1, 1, 1, 1,
1.293204, -0.3316352, 1.912797, 1, 1, 1, 1, 1,
1.311918, -0.02640188, 1.932399, 1, 1, 1, 1, 1,
1.316526, 0.7332287, 1.510392, 1, 1, 1, 1, 1,
1.319833, 1.277722, 2.338618, 1, 1, 1, 1, 1,
1.340164, -0.9654241, 2.159477, 1, 1, 1, 1, 1,
1.341054, -1.415107, 3.268027, 1, 1, 1, 1, 1,
1.344926, -0.1793774, 2.318682, 1, 1, 1, 1, 1,
1.351154, 0.7879244, 0.9467978, 1, 1, 1, 1, 1,
1.365027, -0.6879413, 3.011576, 1, 1, 1, 1, 1,
1.376519, -0.4028235, 0.5783012, 1, 1, 1, 1, 1,
1.38756, 0.237141, 1.43597, 1, 1, 1, 1, 1,
1.393999, 0.8805159, 0.1164423, 1, 1, 1, 1, 1,
1.395311, -1.220863, 2.179418, 0, 0, 1, 1, 1,
1.399676, -0.8729984, 2.930804, 1, 0, 0, 1, 1,
1.402656, 1.51427, 0.1311579, 1, 0, 0, 1, 1,
1.436247, 0.2088857, 1.642118, 1, 0, 0, 1, 1,
1.437844, 0.9229412, 0.5647703, 1, 0, 0, 1, 1,
1.439236, 1.054806, -0.3066254, 1, 0, 0, 1, 1,
1.441438, 0.7173439, 0.715881, 0, 0, 0, 1, 1,
1.453808, -0.4273621, 2.882761, 0, 0, 0, 1, 1,
1.464591, -0.4502068, 2.118724, 0, 0, 0, 1, 1,
1.467746, -0.8915471, 0.5393127, 0, 0, 0, 1, 1,
1.472847, -0.6232593, 3.402169, 0, 0, 0, 1, 1,
1.47673, -0.7452281, 2.834114, 0, 0, 0, 1, 1,
1.481813, -1.212402, 2.484314, 0, 0, 0, 1, 1,
1.495775, 1.258451, 0.7984812, 1, 1, 1, 1, 1,
1.505765, 0.9543184, -1.876681, 1, 1, 1, 1, 1,
1.510348, 0.5810201, 1.001983, 1, 1, 1, 1, 1,
1.522508, -0.4244433, 1.117826, 1, 1, 1, 1, 1,
1.525564, 0.02739012, 1.15526, 1, 1, 1, 1, 1,
1.532467, 0.5759561, 2.172133, 1, 1, 1, 1, 1,
1.544478, -0.6538644, 0.3903603, 1, 1, 1, 1, 1,
1.552195, -0.1169873, 0.5413064, 1, 1, 1, 1, 1,
1.55385, 1.26776, 1.611125, 1, 1, 1, 1, 1,
1.556923, 0.1341817, 1.460584, 1, 1, 1, 1, 1,
1.567744, 0.04302896, 2.313416, 1, 1, 1, 1, 1,
1.569102, 1.907864, 2.077013, 1, 1, 1, 1, 1,
1.57112, 0.8236145, 0.4306642, 1, 1, 1, 1, 1,
1.582227, 1.038448, 0.8537229, 1, 1, 1, 1, 1,
1.591902, -0.3718807, 1.48684, 1, 1, 1, 1, 1,
1.597122, 0.6863737, 1.288143, 0, 0, 1, 1, 1,
1.609017, -0.5962518, 3.334269, 1, 0, 0, 1, 1,
1.625817, 1.322626, -0.3225043, 1, 0, 0, 1, 1,
1.628869, 1.177611, -1.00616, 1, 0, 0, 1, 1,
1.632199, -0.2703925, 2.111661, 1, 0, 0, 1, 1,
1.646527, 0.9481987, 0.3482514, 1, 0, 0, 1, 1,
1.667837, -0.5221322, 1.035408, 0, 0, 0, 1, 1,
1.673895, 1.706355, 0.8641652, 0, 0, 0, 1, 1,
1.698923, 0.677795, 1.057498, 0, 0, 0, 1, 1,
1.708415, -1.863977, 1.015186, 0, 0, 0, 1, 1,
1.727312, -1.190878, 2.428398, 0, 0, 0, 1, 1,
1.729139, 1.100074, 1.448031, 0, 0, 0, 1, 1,
1.742321, -0.9294612, 0.9542314, 0, 0, 0, 1, 1,
1.745806, 1.012801, 1.273985, 1, 1, 1, 1, 1,
1.768741, 0.07221747, 3.377395, 1, 1, 1, 1, 1,
1.78524, 0.813807, 1.215534, 1, 1, 1, 1, 1,
1.798243, -0.01205579, 2.471148, 1, 1, 1, 1, 1,
1.805755, 0.2130196, 1.442697, 1, 1, 1, 1, 1,
1.809223, -0.4702254, 1.310443, 1, 1, 1, 1, 1,
1.810446, 0.6677196, 1.048316, 1, 1, 1, 1, 1,
1.834049, 0.8943335, 1.225465, 1, 1, 1, 1, 1,
1.836854, 0.1749346, 0.0853345, 1, 1, 1, 1, 1,
1.848033, -0.135327, 0.3262753, 1, 1, 1, 1, 1,
1.855386, -1.698043, 1.192519, 1, 1, 1, 1, 1,
1.871592, -0.9716851, 1.455545, 1, 1, 1, 1, 1,
1.877444, 1.733803, 1.472548, 1, 1, 1, 1, 1,
1.899998, 0.3959755, 3.06652, 1, 1, 1, 1, 1,
1.900154, -0.4388094, 1.802911, 1, 1, 1, 1, 1,
1.904555, 0.7178221, 0.7597045, 0, 0, 1, 1, 1,
2.006572, -1.249887, 2.390215, 1, 0, 0, 1, 1,
2.019085, 1.258886, 1.192362, 1, 0, 0, 1, 1,
2.028174, -1.200557, 2.194241, 1, 0, 0, 1, 1,
2.094681, 1.152931, 1.911955, 1, 0, 0, 1, 1,
2.108609, 1.14176, 1.241356, 1, 0, 0, 1, 1,
2.196766, 0.4008172, 1.291582, 0, 0, 0, 1, 1,
2.234437, -1.690486, 2.164912, 0, 0, 0, 1, 1,
2.287889, -1.814053, 1.804703, 0, 0, 0, 1, 1,
2.319726, 0.01910872, 1.633419, 0, 0, 0, 1, 1,
2.349286, 0.3717966, 1.654824, 0, 0, 0, 1, 1,
2.358191, 1.3143, 1.820914, 0, 0, 0, 1, 1,
2.413562, 0.4504308, -0.6965617, 0, 0, 0, 1, 1,
2.449711, 1.405111, 0.9905344, 1, 1, 1, 1, 1,
2.511019, -0.09630493, 1.414702, 1, 1, 1, 1, 1,
2.62638, 0.4110583, 1.204989, 1, 1, 1, 1, 1,
2.832453, 0.2182545, 0.0386123, 1, 1, 1, 1, 1,
2.905932, 0.1845825, 0.8290396, 1, 1, 1, 1, 1,
3.01305, 1.221235, 0.2046382, 1, 1, 1, 1, 1,
3.705166, -0.1513827, 2.702997, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.684093;
var distance = 34.01496;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.3258209, -0.1089659, -0.08260846 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.01496);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
