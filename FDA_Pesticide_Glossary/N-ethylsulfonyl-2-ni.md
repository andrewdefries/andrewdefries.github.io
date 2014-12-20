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
-3.574801, 1.723177, -0.6027055, 1, 0, 0, 1,
-3.160456, 0.7432179, -0.8726007, 1, 0.007843138, 0, 1,
-2.754183, -0.6619344, -0.06734882, 1, 0.01176471, 0, 1,
-2.471426, -0.7861514, -2.44269, 1, 0.01960784, 0, 1,
-2.467768, -0.8287078, -1.762024, 1, 0.02352941, 0, 1,
-2.415468, 1.538677, 0.3659251, 1, 0.03137255, 0, 1,
-2.401098, -0.1679503, 0.6083088, 1, 0.03529412, 0, 1,
-2.376228, -0.5623008, -0.7354455, 1, 0.04313726, 0, 1,
-2.345244, 0.2221801, -0.6105431, 1, 0.04705882, 0, 1,
-2.241149, -0.1362067, -1.438529, 1, 0.05490196, 0, 1,
-2.212536, -1.48268, -3.108672, 1, 0.05882353, 0, 1,
-2.202242, 0.6201857, -1.060092, 1, 0.06666667, 0, 1,
-2.199954, -1.006156, -0.1672598, 1, 0.07058824, 0, 1,
-2.131807, -0.3249806, -3.13327, 1, 0.07843138, 0, 1,
-2.088766, 1.187509, -1.244717, 1, 0.08235294, 0, 1,
-2.085875, -1.072518, -2.914233, 1, 0.09019608, 0, 1,
-2.079901, -0.760845, -3.076447, 1, 0.09411765, 0, 1,
-2.079235, -1.434851, -0.6134532, 1, 0.1019608, 0, 1,
-2.032091, -0.1864622, -1.372468, 1, 0.1098039, 0, 1,
-2.021402, 0.1385682, -0.6523268, 1, 0.1137255, 0, 1,
-1.941482, 0.4714216, -0.8076344, 1, 0.1215686, 0, 1,
-1.92925, 0.2905644, -1.861477, 1, 0.1254902, 0, 1,
-1.885681, -0.9959396, -3.666049, 1, 0.1333333, 0, 1,
-1.850891, -1.170223, -1.399464, 1, 0.1372549, 0, 1,
-1.850203, -1.909644, -1.430173, 1, 0.145098, 0, 1,
-1.839212, -0.6394662, -3.216625, 1, 0.1490196, 0, 1,
-1.806009, 0.1662054, -0.2952356, 1, 0.1568628, 0, 1,
-1.785169, 0.4095335, -1.94079, 1, 0.1607843, 0, 1,
-1.783572, 0.7751065, -0.2793378, 1, 0.1686275, 0, 1,
-1.779608, -1.079178, -2.593304, 1, 0.172549, 0, 1,
-1.771415, 0.2666686, -2.335438, 1, 0.1803922, 0, 1,
-1.769238, -0.2732706, -2.152546, 1, 0.1843137, 0, 1,
-1.758162, 0.665275, -0.3826186, 1, 0.1921569, 0, 1,
-1.753506, -2.325042, -2.980372, 1, 0.1960784, 0, 1,
-1.73515, 0.2523876, -0.8755158, 1, 0.2039216, 0, 1,
-1.712091, 0.2786163, -2.382078, 1, 0.2117647, 0, 1,
-1.697468, -0.3484704, -1.728236, 1, 0.2156863, 0, 1,
-1.692199, 0.5967226, -0.8137734, 1, 0.2235294, 0, 1,
-1.685252, -0.3345653, -2.859754, 1, 0.227451, 0, 1,
-1.674821, 1.072242, -1.166775, 1, 0.2352941, 0, 1,
-1.667736, -2.086747, -4.175661, 1, 0.2392157, 0, 1,
-1.654977, 0.9596913, 0.008132061, 1, 0.2470588, 0, 1,
-1.65403, 0.4518984, -2.650533, 1, 0.2509804, 0, 1,
-1.639996, -1.756072, -2.199242, 1, 0.2588235, 0, 1,
-1.63073, 0.8038621, -2.271696, 1, 0.2627451, 0, 1,
-1.626026, 0.7796023, -1.369439, 1, 0.2705882, 0, 1,
-1.616859, -1.693479, -1.767351, 1, 0.2745098, 0, 1,
-1.609132, 1.269171, -0.4141576, 1, 0.282353, 0, 1,
-1.607849, 0.9103538, -1.594539, 1, 0.2862745, 0, 1,
-1.602556, -1.029963, -0.6825456, 1, 0.2941177, 0, 1,
-1.598392, -0.3153298, -1.108048, 1, 0.3019608, 0, 1,
-1.590897, -0.3767142, -1.612822, 1, 0.3058824, 0, 1,
-1.587219, -0.7097216, -3.606304, 1, 0.3137255, 0, 1,
-1.585845, -0.1681646, -1.313304, 1, 0.3176471, 0, 1,
-1.577146, 2.08978, 0.1438346, 1, 0.3254902, 0, 1,
-1.576703, -1.050951, -2.347136, 1, 0.3294118, 0, 1,
-1.568036, 0.5270656, -0.1181784, 1, 0.3372549, 0, 1,
-1.563695, -0.02732483, -1.666134, 1, 0.3411765, 0, 1,
-1.55227, -1.222295, -0.5228383, 1, 0.3490196, 0, 1,
-1.551526, -0.2346025, -1.339442, 1, 0.3529412, 0, 1,
-1.546728, 2.47253, -1.345307, 1, 0.3607843, 0, 1,
-1.524427, -0.5808448, -1.743466, 1, 0.3647059, 0, 1,
-1.518038, -0.8612943, -2.552466, 1, 0.372549, 0, 1,
-1.515457, 0.177849, -2.304388, 1, 0.3764706, 0, 1,
-1.497713, -1.04405, -1.411275, 1, 0.3843137, 0, 1,
-1.488591, 0.9500964, -1.695657, 1, 0.3882353, 0, 1,
-1.45502, 0.3634972, -1.781416, 1, 0.3960784, 0, 1,
-1.453393, -2.630413, -4.68484, 1, 0.4039216, 0, 1,
-1.451468, 0.4198543, -2.045728, 1, 0.4078431, 0, 1,
-1.441972, 0.39639, 0.1649722, 1, 0.4156863, 0, 1,
-1.441901, 0.7700563, -2.204577, 1, 0.4196078, 0, 1,
-1.440775, -0.4409549, -1.777039, 1, 0.427451, 0, 1,
-1.436054, -0.05378119, -3.269333, 1, 0.4313726, 0, 1,
-1.435023, 2.181342, 0.5443646, 1, 0.4392157, 0, 1,
-1.433126, -0.1057481, 0.09943177, 1, 0.4431373, 0, 1,
-1.432793, 0.1351012, -1.998268, 1, 0.4509804, 0, 1,
-1.431633, 2.366499, -0.4669296, 1, 0.454902, 0, 1,
-1.429275, -0.3290938, -2.565842, 1, 0.4627451, 0, 1,
-1.426902, 0.008125545, -1.298304, 1, 0.4666667, 0, 1,
-1.426708, -0.04648172, -2.049778, 1, 0.4745098, 0, 1,
-1.424386, -0.4752712, -2.087666, 1, 0.4784314, 0, 1,
-1.421222, -0.09911291, -1.588376, 1, 0.4862745, 0, 1,
-1.403611, 1.156844, -0.6753404, 1, 0.4901961, 0, 1,
-1.39868, 0.8560936, -2.25809, 1, 0.4980392, 0, 1,
-1.396001, 0.04494874, -1.260824, 1, 0.5058824, 0, 1,
-1.395002, 1.029877, 0.004344461, 1, 0.509804, 0, 1,
-1.394611, -1.311766, -3.534236, 1, 0.5176471, 0, 1,
-1.393868, -0.259804, -0.690495, 1, 0.5215687, 0, 1,
-1.393084, 0.4679959, -1.931276, 1, 0.5294118, 0, 1,
-1.381297, -1.238136, -1.95805, 1, 0.5333334, 0, 1,
-1.380791, 0.2991343, -0.5291963, 1, 0.5411765, 0, 1,
-1.370703, 0.2807746, -1.807604, 1, 0.5450981, 0, 1,
-1.369548, 0.4240289, -0.7687328, 1, 0.5529412, 0, 1,
-1.368594, 0.2366137, -1.505099, 1, 0.5568628, 0, 1,
-1.362897, -0.6778003, -1.934292, 1, 0.5647059, 0, 1,
-1.354094, 0.2549295, -1.529459, 1, 0.5686275, 0, 1,
-1.341829, -1.479725, -0.2561169, 1, 0.5764706, 0, 1,
-1.340089, 0.1546513, -3.120498, 1, 0.5803922, 0, 1,
-1.330132, -1.213197, -1.253775, 1, 0.5882353, 0, 1,
-1.315367, -0.0003403633, -3.028881, 1, 0.5921569, 0, 1,
-1.309456, -2.164346, -2.632221, 1, 0.6, 0, 1,
-1.305564, 0.602754, -0.9221614, 1, 0.6078432, 0, 1,
-1.293228, 0.4921795, -1.119998, 1, 0.6117647, 0, 1,
-1.283302, -1.510086, -3.032374, 1, 0.6196079, 0, 1,
-1.251859, 0.1334408, -2.309242, 1, 0.6235294, 0, 1,
-1.247374, -1.419874, -1.387448, 1, 0.6313726, 0, 1,
-1.238211, 0.2995845, -1.003131, 1, 0.6352941, 0, 1,
-1.227018, 1.623669, -1.365656, 1, 0.6431373, 0, 1,
-1.224922, -1.009863, -2.894382, 1, 0.6470588, 0, 1,
-1.20558, 0.3510144, -0.9795235, 1, 0.654902, 0, 1,
-1.202476, 0.5226362, -0.9956677, 1, 0.6588235, 0, 1,
-1.201038, -0.08366162, -2.289326, 1, 0.6666667, 0, 1,
-1.20067, 0.7176349, 0.2752424, 1, 0.6705883, 0, 1,
-1.196774, 3.463214, 0.4455462, 1, 0.6784314, 0, 1,
-1.195519, -1.721739, -2.37054, 1, 0.682353, 0, 1,
-1.190047, 0.5369069, -2.706134, 1, 0.6901961, 0, 1,
-1.182771, 1.896162, -1.14994, 1, 0.6941177, 0, 1,
-1.169698, 0.3289713, -0.1042493, 1, 0.7019608, 0, 1,
-1.168544, -1.594018, -1.758165, 1, 0.7098039, 0, 1,
-1.167319, -0.7281067, -1.207221, 1, 0.7137255, 0, 1,
-1.16138, -0.4985226, -2.224725, 1, 0.7215686, 0, 1,
-1.154956, -0.2944428, -3.340381, 1, 0.7254902, 0, 1,
-1.151464, 1.086484, -1.901323, 1, 0.7333333, 0, 1,
-1.140548, -0.7422408, -1.936157, 1, 0.7372549, 0, 1,
-1.137948, -0.6736703, -1.113649, 1, 0.7450981, 0, 1,
-1.126585, -0.5346615, -2.027819, 1, 0.7490196, 0, 1,
-1.123207, 2.137626, 0.06642263, 1, 0.7568628, 0, 1,
-1.105211, -0.2875726, -1.747493, 1, 0.7607843, 0, 1,
-1.104157, -0.04715354, -2.172021, 1, 0.7686275, 0, 1,
-1.101379, -0.2710811, -3.157246, 1, 0.772549, 0, 1,
-1.098155, -0.06644658, -3.320963, 1, 0.7803922, 0, 1,
-1.094432, -0.08624677, -0.9807699, 1, 0.7843137, 0, 1,
-1.080713, -0.06998701, -2.14419, 1, 0.7921569, 0, 1,
-1.078246, 0.2286631, -0.7634445, 1, 0.7960784, 0, 1,
-1.075631, -0.598511, -1.224692, 1, 0.8039216, 0, 1,
-1.069177, -0.8862582, -2.579852, 1, 0.8117647, 0, 1,
-1.06267, 0.4130229, -1.158515, 1, 0.8156863, 0, 1,
-1.06218, -0.8209465, -0.8873848, 1, 0.8235294, 0, 1,
-1.058767, 0.2807537, -0.8743569, 1, 0.827451, 0, 1,
-1.055251, -0.1133683, -1.257257, 1, 0.8352941, 0, 1,
-1.051586, 2.805308, -0.07264721, 1, 0.8392157, 0, 1,
-1.051313, -1.149913, -2.440887, 1, 0.8470588, 0, 1,
-1.048805, -0.03778398, -0.8263549, 1, 0.8509804, 0, 1,
-1.043383, 1.727708, -0.7438364, 1, 0.8588235, 0, 1,
-1.040209, 1.116844, -1.387205, 1, 0.8627451, 0, 1,
-1.029732, -0.4647737, -1.131546, 1, 0.8705882, 0, 1,
-1.017481, -0.2448004, -1.948717, 1, 0.8745098, 0, 1,
-1.015411, -0.6529821, -2.974025, 1, 0.8823529, 0, 1,
-1.013932, 0.09413194, -1.704227, 1, 0.8862745, 0, 1,
-1.005159, -0.1567404, 0.03571142, 1, 0.8941177, 0, 1,
-1.004817, 1.146586, -1.758035, 1, 0.8980392, 0, 1,
-0.9988528, -0.6296863, -1.237835, 1, 0.9058824, 0, 1,
-0.9939039, -0.07265535, -1.333584, 1, 0.9137255, 0, 1,
-0.9917002, -2.395058, -3.169522, 1, 0.9176471, 0, 1,
-0.9870345, 1.67449, 0.07614636, 1, 0.9254902, 0, 1,
-0.9840693, 1.572845, -0.1908298, 1, 0.9294118, 0, 1,
-0.9799773, 0.857767, -2.134126, 1, 0.9372549, 0, 1,
-0.9706754, -0.3316475, -1.711243, 1, 0.9411765, 0, 1,
-0.9664519, 0.04080888, -1.971385, 1, 0.9490196, 0, 1,
-0.9596926, 0.6713327, -1.221087, 1, 0.9529412, 0, 1,
-0.9490482, 0.6763329, -0.683137, 1, 0.9607843, 0, 1,
-0.9456262, 1.125706, 0.3043674, 1, 0.9647059, 0, 1,
-0.9402069, -0.2472848, -4.489816, 1, 0.972549, 0, 1,
-0.9365513, -0.8339211, -0.5196396, 1, 0.9764706, 0, 1,
-0.9359728, -0.6077549, -0.9239448, 1, 0.9843137, 0, 1,
-0.9167916, -1.230485, -3.025258, 1, 0.9882353, 0, 1,
-0.9142313, 0.9233173, -2.979077, 1, 0.9960784, 0, 1,
-0.9130962, 0.2242616, 0.09261728, 0.9960784, 1, 0, 1,
-0.9119028, -1.341216, -1.982231, 0.9921569, 1, 0, 1,
-0.9101759, 0.9022735, 0.5940306, 0.9843137, 1, 0, 1,
-0.9035922, 0.6626201, -0.1584584, 0.9803922, 1, 0, 1,
-0.8985305, -1.006402, -4.051482, 0.972549, 1, 0, 1,
-0.8981062, -0.5114899, -3.080508, 0.9686275, 1, 0, 1,
-0.8968419, -0.773347, -1.448774, 0.9607843, 1, 0, 1,
-0.8965541, -0.7989851, -3.001784, 0.9568627, 1, 0, 1,
-0.896185, -1.955597, -1.617629, 0.9490196, 1, 0, 1,
-0.8902843, 0.05700883, -2.307627, 0.945098, 1, 0, 1,
-0.8872507, 0.7080206, -0.6350163, 0.9372549, 1, 0, 1,
-0.8824788, -0.5683051, -2.001416, 0.9333333, 1, 0, 1,
-0.8823715, 0.9915832, -0.6388395, 0.9254902, 1, 0, 1,
-0.8809171, 1.18377, -1.828693, 0.9215686, 1, 0, 1,
-0.8793074, -1.193471, -1.688927, 0.9137255, 1, 0, 1,
-0.8782442, 0.5841822, -1.943857, 0.9098039, 1, 0, 1,
-0.8763727, -0.04619147, 0.3049887, 0.9019608, 1, 0, 1,
-0.8753834, 0.08064394, -0.8547392, 0.8941177, 1, 0, 1,
-0.8655653, 1.895113, 0.2184709, 0.8901961, 1, 0, 1,
-0.8643287, 1.050058, -1.22042, 0.8823529, 1, 0, 1,
-0.8634698, 0.1781759, -1.804937, 0.8784314, 1, 0, 1,
-0.857903, 1.094107, -0.8677952, 0.8705882, 1, 0, 1,
-0.8553936, 0.7785788, -1.745744, 0.8666667, 1, 0, 1,
-0.8518121, -2.677892, -3.753974, 0.8588235, 1, 0, 1,
-0.8504237, 1.16586, -1.273737, 0.854902, 1, 0, 1,
-0.8468818, -2.089218, -2.744131, 0.8470588, 1, 0, 1,
-0.8452316, -0.6813697, -2.262532, 0.8431373, 1, 0, 1,
-0.8448909, 0.9752573, -1.636378, 0.8352941, 1, 0, 1,
-0.8428352, 0.3430037, -1.876501, 0.8313726, 1, 0, 1,
-0.8412164, -0.2312814, -1.33036, 0.8235294, 1, 0, 1,
-0.8411234, -1.385716, -3.228077, 0.8196079, 1, 0, 1,
-0.8385578, -1.195552, -2.592098, 0.8117647, 1, 0, 1,
-0.831259, 1.426128, -0.8120236, 0.8078431, 1, 0, 1,
-0.8283629, -0.4404277, -2.783084, 0.8, 1, 0, 1,
-0.8262215, -1.167599, -2.900671, 0.7921569, 1, 0, 1,
-0.8232997, 0.7030339, 0.03131887, 0.7882353, 1, 0, 1,
-0.8226403, -0.5420242, -1.027777, 0.7803922, 1, 0, 1,
-0.817426, 0.4866558, -1.302141, 0.7764706, 1, 0, 1,
-0.8141959, -0.1238173, -1.412011, 0.7686275, 1, 0, 1,
-0.812967, -0.1871074, -2.163522, 0.7647059, 1, 0, 1,
-0.8092269, 0.5478057, -1.729997, 0.7568628, 1, 0, 1,
-0.8084465, -1.450366, -3.512428, 0.7529412, 1, 0, 1,
-0.806559, 0.06002367, -0.7501488, 0.7450981, 1, 0, 1,
-0.8064733, 1.398184, -0.5539393, 0.7411765, 1, 0, 1,
-0.8062287, 0.744811, 0.3254442, 0.7333333, 1, 0, 1,
-0.7962659, 0.2664563, -0.4738521, 0.7294118, 1, 0, 1,
-0.7952155, 1.618141, -0.413973, 0.7215686, 1, 0, 1,
-0.7879816, -0.6779887, -1.404218, 0.7176471, 1, 0, 1,
-0.7845666, 0.01192749, -0.8406654, 0.7098039, 1, 0, 1,
-0.7767152, -0.3576511, -4.211397, 0.7058824, 1, 0, 1,
-0.7747602, 0.8284945, -0.5995382, 0.6980392, 1, 0, 1,
-0.7729948, 0.5212736, 1.588047, 0.6901961, 1, 0, 1,
-0.7675337, -1.283244, -4.465662, 0.6862745, 1, 0, 1,
-0.7632719, -1.229453, -3.640349, 0.6784314, 1, 0, 1,
-0.7604755, 2.815743, 1.126541, 0.6745098, 1, 0, 1,
-0.7596193, -0.2022041, -2.325101, 0.6666667, 1, 0, 1,
-0.7503008, 0.1177946, -1.328721, 0.6627451, 1, 0, 1,
-0.742405, -0.8568978, -1.393522, 0.654902, 1, 0, 1,
-0.741218, -0.2745338, -2.069622, 0.6509804, 1, 0, 1,
-0.7385341, 1.106027, -0.2147177, 0.6431373, 1, 0, 1,
-0.7379317, -0.1013257, 0.07603214, 0.6392157, 1, 0, 1,
-0.7361962, -1.665849, -2.233938, 0.6313726, 1, 0, 1,
-0.7330147, 0.2185242, -1.631729, 0.627451, 1, 0, 1,
-0.7329951, 0.0673907, -2.33423, 0.6196079, 1, 0, 1,
-0.7234351, -0.8245307, -0.2386132, 0.6156863, 1, 0, 1,
-0.7231252, 1.895779, 1.231983, 0.6078432, 1, 0, 1,
-0.7197278, 0.7042969, -0.219761, 0.6039216, 1, 0, 1,
-0.7169296, 0.6388518, -1.559899, 0.5960785, 1, 0, 1,
-0.7114514, 0.5458931, -0.6474396, 0.5882353, 1, 0, 1,
-0.706552, -0.6671771, -1.539, 0.5843138, 1, 0, 1,
-0.70496, -1.59045, -1.372593, 0.5764706, 1, 0, 1,
-0.691435, 0.6562439, -2.143552, 0.572549, 1, 0, 1,
-0.6868591, -0.5006623, -1.496304, 0.5647059, 1, 0, 1,
-0.6827765, -2.128051, -2.633812, 0.5607843, 1, 0, 1,
-0.6789628, 0.820245, 0.424477, 0.5529412, 1, 0, 1,
-0.6777157, 1.314421, -3.206042, 0.5490196, 1, 0, 1,
-0.677343, -0.1160758, -0.1155971, 0.5411765, 1, 0, 1,
-0.6751393, 0.640974, -1.104477, 0.5372549, 1, 0, 1,
-0.6731201, 1.54639, 2.125857, 0.5294118, 1, 0, 1,
-0.6608729, -0.8260772, -1.758667, 0.5254902, 1, 0, 1,
-0.659322, 1.010595, -2.351059, 0.5176471, 1, 0, 1,
-0.6579518, -0.4189217, -1.203522, 0.5137255, 1, 0, 1,
-0.654952, 0.1727723, -1.84934, 0.5058824, 1, 0, 1,
-0.6544397, -0.2618188, 0.09056719, 0.5019608, 1, 0, 1,
-0.653033, -0.1783868, -2.079653, 0.4941176, 1, 0, 1,
-0.6302409, 0.9022984, 0.09010489, 0.4862745, 1, 0, 1,
-0.6290671, 1.878295, -1.466121, 0.4823529, 1, 0, 1,
-0.6284785, 0.2286571, -1.856151, 0.4745098, 1, 0, 1,
-0.6280494, -0.5363424, -3.177354, 0.4705882, 1, 0, 1,
-0.6222602, 0.7904709, -1.653785, 0.4627451, 1, 0, 1,
-0.6217114, 0.2655187, -1.150319, 0.4588235, 1, 0, 1,
-0.618978, -0.2833109, -1.463697, 0.4509804, 1, 0, 1,
-0.6147076, -0.3716013, -0.2386192, 0.4470588, 1, 0, 1,
-0.6064015, 0.09315679, -0.9498054, 0.4392157, 1, 0, 1,
-0.6038973, 1.005772, -2.051053, 0.4352941, 1, 0, 1,
-0.6009287, 0.9002609, -0.3293156, 0.427451, 1, 0, 1,
-0.6008631, -0.3392454, -1.810691, 0.4235294, 1, 0, 1,
-0.5987952, -0.3045314, -1.396045, 0.4156863, 1, 0, 1,
-0.5974501, -1.468256, -2.899969, 0.4117647, 1, 0, 1,
-0.5954218, -0.2037481, -2.714681, 0.4039216, 1, 0, 1,
-0.5865818, -0.3894769, -2.388616, 0.3960784, 1, 0, 1,
-0.5856138, 1.816077, -1.710822, 0.3921569, 1, 0, 1,
-0.5854407, -0.005354349, 0.01051148, 0.3843137, 1, 0, 1,
-0.5851285, -1.061904, -4.004356, 0.3803922, 1, 0, 1,
-0.5815997, -0.003678212, -0.6099445, 0.372549, 1, 0, 1,
-0.5798317, 1.497543, 1.084616, 0.3686275, 1, 0, 1,
-0.5675315, 1.016583, 1.351489, 0.3607843, 1, 0, 1,
-0.5649921, 0.2855769, -0.08820018, 0.3568628, 1, 0, 1,
-0.564912, 1.890227, 1.108965, 0.3490196, 1, 0, 1,
-0.5631219, 0.4000632, 0.06995551, 0.345098, 1, 0, 1,
-0.5622751, 0.05366508, 0.2200147, 0.3372549, 1, 0, 1,
-0.5617201, -3.425113, -2.027384, 0.3333333, 1, 0, 1,
-0.5587509, 0.1621229, -1.967953, 0.3254902, 1, 0, 1,
-0.5574142, 0.2995948, -1.739171, 0.3215686, 1, 0, 1,
-0.5560189, -0.8915293, -3.078849, 0.3137255, 1, 0, 1,
-0.5474299, 0.1668891, 0.5731509, 0.3098039, 1, 0, 1,
-0.5413245, 0.2361103, -1.443796, 0.3019608, 1, 0, 1,
-0.5408959, -0.6985114, -1.487865, 0.2941177, 1, 0, 1,
-0.5342336, 1.833966, 0.03393011, 0.2901961, 1, 0, 1,
-0.5314807, 0.01110868, -0.4495988, 0.282353, 1, 0, 1,
-0.5314201, 1.229556, -0.6760565, 0.2784314, 1, 0, 1,
-0.5244479, 0.1890014, 0.2609083, 0.2705882, 1, 0, 1,
-0.521127, -1.056293, -3.276247, 0.2666667, 1, 0, 1,
-0.5210947, 0.07029074, -0.7694532, 0.2588235, 1, 0, 1,
-0.5187742, 2.22226, -2.391749, 0.254902, 1, 0, 1,
-0.5177199, 0.1191752, -2.320501, 0.2470588, 1, 0, 1,
-0.5158712, -0.6268513, -2.367323, 0.2431373, 1, 0, 1,
-0.5120425, 1.019616, -2.808016, 0.2352941, 1, 0, 1,
-0.5112001, 0.8323262, -0.8947237, 0.2313726, 1, 0, 1,
-0.5090973, 1.706745, -0.6424983, 0.2235294, 1, 0, 1,
-0.5087352, -0.3932234, -3.603351, 0.2196078, 1, 0, 1,
-0.5080281, -1.084855, -0.8814763, 0.2117647, 1, 0, 1,
-0.5024278, 0.6239191, -1.668775, 0.2078431, 1, 0, 1,
-0.4985971, -0.8550748, -0.8543901, 0.2, 1, 0, 1,
-0.4945962, 0.399185, -0.5582287, 0.1921569, 1, 0, 1,
-0.4915015, -0.05717359, -0.5585302, 0.1882353, 1, 0, 1,
-0.4914075, 0.04043569, -0.1790414, 0.1803922, 1, 0, 1,
-0.4896418, 0.126044, -1.824696, 0.1764706, 1, 0, 1,
-0.4859823, -1.350394, -3.608425, 0.1686275, 1, 0, 1,
-0.484267, 0.4096821, -0.4938, 0.1647059, 1, 0, 1,
-0.480518, 1.584208, -0.7328463, 0.1568628, 1, 0, 1,
-0.4744024, 0.6235226, -2.785493, 0.1529412, 1, 0, 1,
-0.4719756, -2.502701, -2.551114, 0.145098, 1, 0, 1,
-0.4715819, -0.9607024, -3.590789, 0.1411765, 1, 0, 1,
-0.4712293, -0.9547846, -3.371855, 0.1333333, 1, 0, 1,
-0.4690105, 0.8908398, -1.224049, 0.1294118, 1, 0, 1,
-0.4688626, 0.9192458, -1.956943, 0.1215686, 1, 0, 1,
-0.4671959, 0.1240626, -0.5131766, 0.1176471, 1, 0, 1,
-0.4658136, 1.523588, -1.04853, 0.1098039, 1, 0, 1,
-0.465038, 0.6403319, -1.591603, 0.1058824, 1, 0, 1,
-0.4637988, 0.8757794, 0.6810864, 0.09803922, 1, 0, 1,
-0.4586464, -0.005193526, -1.013824, 0.09019608, 1, 0, 1,
-0.4569435, 0.7043099, 0.8949364, 0.08627451, 1, 0, 1,
-0.4521419, 0.5179499, -1.023931, 0.07843138, 1, 0, 1,
-0.4492867, 0.8639855, -0.4832963, 0.07450981, 1, 0, 1,
-0.4458381, -1.368305, -2.871646, 0.06666667, 1, 0, 1,
-0.4448301, 0.6116659, -0.2977523, 0.0627451, 1, 0, 1,
-0.4400152, 0.7755847, -0.3694248, 0.05490196, 1, 0, 1,
-0.4387742, 1.83691, 0.09919052, 0.05098039, 1, 0, 1,
-0.438648, -1.241374, -4.181471, 0.04313726, 1, 0, 1,
-0.4381815, 1.684711, -1.518284, 0.03921569, 1, 0, 1,
-0.437846, -0.6657124, -3.448586, 0.03137255, 1, 0, 1,
-0.4367808, -0.2389556, -2.774769, 0.02745098, 1, 0, 1,
-0.436066, -2.013662, -3.782773, 0.01960784, 1, 0, 1,
-0.433632, -0.6257086, -2.013021, 0.01568628, 1, 0, 1,
-0.4325754, -2.180871, -1.024071, 0.007843138, 1, 0, 1,
-0.432177, -0.3009478, -1.770416, 0.003921569, 1, 0, 1,
-0.4319287, -0.09364324, -3.089577, 0, 1, 0.003921569, 1,
-0.4279392, 0.3848762, -1.068655, 0, 1, 0.01176471, 1,
-0.4264185, 0.002849882, 0.9322661, 0, 1, 0.01568628, 1,
-0.4233478, -0.7764812, -1.749438, 0, 1, 0.02352941, 1,
-0.4185249, 1.106368, -0.5187565, 0, 1, 0.02745098, 1,
-0.4163326, 0.2611839, 0.4711003, 0, 1, 0.03529412, 1,
-0.4056808, 0.04289162, -2.561302, 0, 1, 0.03921569, 1,
-0.4026156, 0.4336846, -2.589484, 0, 1, 0.04705882, 1,
-0.4016208, 1.458264, -2.279348, 0, 1, 0.05098039, 1,
-0.3995858, 0.9084581, -2.222778, 0, 1, 0.05882353, 1,
-0.3940178, -0.6210047, -2.490277, 0, 1, 0.0627451, 1,
-0.3887531, 0.4765422, -0.2798034, 0, 1, 0.07058824, 1,
-0.3876507, 1.057591, 0.6924319, 0, 1, 0.07450981, 1,
-0.3851402, -1.104134, -3.186526, 0, 1, 0.08235294, 1,
-0.3761885, -0.01697562, -2.67551, 0, 1, 0.08627451, 1,
-0.373345, -1.297484, -2.82781, 0, 1, 0.09411765, 1,
-0.3709935, 1.73032, 0.4767981, 0, 1, 0.1019608, 1,
-0.3670697, -0.3310895, -3.027886, 0, 1, 0.1058824, 1,
-0.3657784, 0.2091192, -0.3671219, 0, 1, 0.1137255, 1,
-0.3631022, 0.4673063, -1.163206, 0, 1, 0.1176471, 1,
-0.3630108, 0.555627, -1.045158, 0, 1, 0.1254902, 1,
-0.3625307, -1.061268, -1.647113, 0, 1, 0.1294118, 1,
-0.3623611, 0.3022257, -1.294303, 0, 1, 0.1372549, 1,
-0.3622411, 0.02495763, -1.604566, 0, 1, 0.1411765, 1,
-0.3589055, -0.4621181, -3.466188, 0, 1, 0.1490196, 1,
-0.3548678, -0.3665535, -2.834723, 0, 1, 0.1529412, 1,
-0.3526172, -1.383536, -3.667897, 0, 1, 0.1607843, 1,
-0.3519928, 0.7620768, -0.07377253, 0, 1, 0.1647059, 1,
-0.3506692, 1.961767, -0.3906335, 0, 1, 0.172549, 1,
-0.342288, 0.7219849, -1.421953, 0, 1, 0.1764706, 1,
-0.3422607, 0.05369725, -1.552332, 0, 1, 0.1843137, 1,
-0.3410637, 0.7672355, -1.44558, 0, 1, 0.1882353, 1,
-0.3376715, 0.8592786, 0.4839994, 0, 1, 0.1960784, 1,
-0.3363056, -1.093971, -3.037828, 0, 1, 0.2039216, 1,
-0.3343631, -0.72555, -3.389446, 0, 1, 0.2078431, 1,
-0.3256234, 0.2516335, -1.538016, 0, 1, 0.2156863, 1,
-0.3255825, -0.8004921, -2.381954, 0, 1, 0.2196078, 1,
-0.3237609, -0.6962835, -2.043749, 0, 1, 0.227451, 1,
-0.3222083, -0.1606322, -1.507433, 0, 1, 0.2313726, 1,
-0.3194395, 1.78097, 0.4956837, 0, 1, 0.2392157, 1,
-0.3153946, 0.5405712, -1.734122, 0, 1, 0.2431373, 1,
-0.3149714, 0.6720679, -3.119684, 0, 1, 0.2509804, 1,
-0.313733, -1.29936, -3.79439, 0, 1, 0.254902, 1,
-0.3113253, -1.003249, -3.091145, 0, 1, 0.2627451, 1,
-0.3103315, 0.4878553, -0.3456376, 0, 1, 0.2666667, 1,
-0.3100581, 0.4965158, 0.9665542, 0, 1, 0.2745098, 1,
-0.3085789, -0.3730927, -3.044523, 0, 1, 0.2784314, 1,
-0.3068321, -0.9448145, -3.767355, 0, 1, 0.2862745, 1,
-0.3066799, -0.1877674, -1.823465, 0, 1, 0.2901961, 1,
-0.3054209, 0.1960028, -0.1047451, 0, 1, 0.2980392, 1,
-0.3042912, 0.3762477, 0.3083235, 0, 1, 0.3058824, 1,
-0.3020418, 0.1913619, -2.436824, 0, 1, 0.3098039, 1,
-0.2976516, -0.3251202, -2.332125, 0, 1, 0.3176471, 1,
-0.2934912, -0.0401007, -2.634592, 0, 1, 0.3215686, 1,
-0.2916676, 1.840367, -0.5819975, 0, 1, 0.3294118, 1,
-0.2910515, 0.05104933, -1.868601, 0, 1, 0.3333333, 1,
-0.2898938, -0.7708492, -1.649297, 0, 1, 0.3411765, 1,
-0.2869225, 1.414598, -0.5604404, 0, 1, 0.345098, 1,
-0.283661, -0.9140182, -2.745858, 0, 1, 0.3529412, 1,
-0.2805963, -1.006729, -1.623516, 0, 1, 0.3568628, 1,
-0.2790292, -0.91888, -2.894236, 0, 1, 0.3647059, 1,
-0.2762851, 0.63265, 0.03563962, 0, 1, 0.3686275, 1,
-0.268232, -0.8697518, -2.81773, 0, 1, 0.3764706, 1,
-0.2678117, 0.03134855, -2.843544, 0, 1, 0.3803922, 1,
-0.2658608, -1.825547, -3.450627, 0, 1, 0.3882353, 1,
-0.2609549, 0.6089849, -0.3557884, 0, 1, 0.3921569, 1,
-0.2606322, 0.3675299, -0.4640912, 0, 1, 0.4, 1,
-0.2598806, -0.7818456, -4.703113, 0, 1, 0.4078431, 1,
-0.2532545, 1.592493, 0.2286311, 0, 1, 0.4117647, 1,
-0.253115, 0.1774209, 1.178375, 0, 1, 0.4196078, 1,
-0.2506276, -0.9300724, -3.096135, 0, 1, 0.4235294, 1,
-0.2484046, -0.06214733, -0.7075927, 0, 1, 0.4313726, 1,
-0.2473252, -1.456369, -3.496421, 0, 1, 0.4352941, 1,
-0.2468315, -1.415686, -1.580209, 0, 1, 0.4431373, 1,
-0.2438747, -1.083611, -3.994001, 0, 1, 0.4470588, 1,
-0.2416445, 1.614632, 0.4161919, 0, 1, 0.454902, 1,
-0.2393422, -0.8805676, -3.466569, 0, 1, 0.4588235, 1,
-0.2337685, 1.099265, 0.391825, 0, 1, 0.4666667, 1,
-0.2335459, -0.6882358, -3.846201, 0, 1, 0.4705882, 1,
-0.2316805, -0.3499238, -2.806633, 0, 1, 0.4784314, 1,
-0.2282554, -0.6194938, -2.493348, 0, 1, 0.4823529, 1,
-0.2256485, 0.5160202, -1.934293, 0, 1, 0.4901961, 1,
-0.2241079, 1.368578, 0.06262218, 0, 1, 0.4941176, 1,
-0.2119017, 0.5304558, -0.6133136, 0, 1, 0.5019608, 1,
-0.211473, 0.9067985, 1.32452, 0, 1, 0.509804, 1,
-0.2101155, -0.3779482, -1.08865, 0, 1, 0.5137255, 1,
-0.2099683, -1.39201, -3.025551, 0, 1, 0.5215687, 1,
-0.204806, -0.4896045, -1.397372, 0, 1, 0.5254902, 1,
-0.2021573, -1.452804, -3.858723, 0, 1, 0.5333334, 1,
-0.1986958, -0.4097095, -2.268113, 0, 1, 0.5372549, 1,
-0.1928666, -0.2994366, -1.847533, 0, 1, 0.5450981, 1,
-0.1896469, 0.3845739, -0.8478111, 0, 1, 0.5490196, 1,
-0.184188, 1.357421, 1.284798, 0, 1, 0.5568628, 1,
-0.1841381, 1.295803, 1.906845, 0, 1, 0.5607843, 1,
-0.1808096, 0.7494256, -0.5099427, 0, 1, 0.5686275, 1,
-0.1784005, -0.8009786, -0.7722028, 0, 1, 0.572549, 1,
-0.1763694, -0.8262047, -3.130634, 0, 1, 0.5803922, 1,
-0.1731504, 0.768353, -1.755562, 0, 1, 0.5843138, 1,
-0.1677728, -0.8501483, -2.539818, 0, 1, 0.5921569, 1,
-0.1670362, 0.6364924, -1.218753, 0, 1, 0.5960785, 1,
-0.1659727, -0.8298979, -3.203209, 0, 1, 0.6039216, 1,
-0.1638236, -1.888609, -2.748947, 0, 1, 0.6117647, 1,
-0.1628913, -0.5207287, -3.957712, 0, 1, 0.6156863, 1,
-0.1607109, 0.2780173, -0.5176597, 0, 1, 0.6235294, 1,
-0.158394, -0.583818, -4.231516, 0, 1, 0.627451, 1,
-0.1558615, 0.2867191, -0.9969173, 0, 1, 0.6352941, 1,
-0.1549037, -0.0004172768, -2.657579, 0, 1, 0.6392157, 1,
-0.1517657, 0.4301266, 0.5288278, 0, 1, 0.6470588, 1,
-0.1475443, -0.5935408, -1.255908, 0, 1, 0.6509804, 1,
-0.143996, 1.607462, -0.5229272, 0, 1, 0.6588235, 1,
-0.1393718, -1.072899, -2.284793, 0, 1, 0.6627451, 1,
-0.1378238, -0.1632766, -2.065684, 0, 1, 0.6705883, 1,
-0.1372332, 0.3101527, -2.010188, 0, 1, 0.6745098, 1,
-0.1369873, 0.8781745, -0.9591706, 0, 1, 0.682353, 1,
-0.1345853, 1.176534, 0.9801497, 0, 1, 0.6862745, 1,
-0.1312345, -1.203164, -3.135465, 0, 1, 0.6941177, 1,
-0.1278936, 0.6457686, -0.1498761, 0, 1, 0.7019608, 1,
-0.1276477, 0.6274468, -1.11693, 0, 1, 0.7058824, 1,
-0.1262114, 1.085206, 0.8153954, 0, 1, 0.7137255, 1,
-0.1242649, -1.839719, -2.864035, 0, 1, 0.7176471, 1,
-0.1217898, 1.649715, -0.3857953, 0, 1, 0.7254902, 1,
-0.1185465, -1.240675, -3.425779, 0, 1, 0.7294118, 1,
-0.11641, 0.09837873, -1.427136, 0, 1, 0.7372549, 1,
-0.1139628, 0.2404246, 0.3142231, 0, 1, 0.7411765, 1,
-0.1109394, 0.3037081, -0.5913648, 0, 1, 0.7490196, 1,
-0.1107841, -0.8166744, -3.573123, 0, 1, 0.7529412, 1,
-0.1065888, 0.9159477, -0.6990532, 0, 1, 0.7607843, 1,
-0.1017389, 0.2722487, -1.062777, 0, 1, 0.7647059, 1,
-0.1005451, -0.7610696, -4.367169, 0, 1, 0.772549, 1,
-0.09925567, 1.273358, -1.661836, 0, 1, 0.7764706, 1,
-0.09855308, 0.8595834, -1.609819, 0, 1, 0.7843137, 1,
-0.09786632, -1.681718, -2.426336, 0, 1, 0.7882353, 1,
-0.09503767, -0.1182926, -4.216989, 0, 1, 0.7960784, 1,
-0.09281977, -0.6217147, -2.168171, 0, 1, 0.8039216, 1,
-0.09169662, 1.51148, 0.3201172, 0, 1, 0.8078431, 1,
-0.09000373, -0.5539162, -4.125411, 0, 1, 0.8156863, 1,
-0.0867167, -0.3867544, -4.648034, 0, 1, 0.8196079, 1,
-0.08115233, 0.5760227, 0.2961223, 0, 1, 0.827451, 1,
-0.07816869, -2.42969, -2.780473, 0, 1, 0.8313726, 1,
-0.07770175, -1.172584, -2.479502, 0, 1, 0.8392157, 1,
-0.07752665, 0.2904013, -0.7401736, 0, 1, 0.8431373, 1,
-0.076855, -0.6107622, -2.610891, 0, 1, 0.8509804, 1,
-0.07538956, 0.2231464, 1.118606, 0, 1, 0.854902, 1,
-0.07141297, 0.9004149, 1.01499, 0, 1, 0.8627451, 1,
-0.07132726, 0.8813146, 1.674777, 0, 1, 0.8666667, 1,
-0.06919082, 1.142293, -1.356724, 0, 1, 0.8745098, 1,
-0.06697705, 1.94202, -1.256237, 0, 1, 0.8784314, 1,
-0.06593367, -2.829858, -3.962724, 0, 1, 0.8862745, 1,
-0.06322671, 0.2978343, 0.7727729, 0, 1, 0.8901961, 1,
-0.06086241, -1.525968, -2.313183, 0, 1, 0.8980392, 1,
-0.05985355, 0.5116516, -1.739044, 0, 1, 0.9058824, 1,
-0.05980813, 2.167938, -1.748275, 0, 1, 0.9098039, 1,
-0.05929037, 0.2523427, 0.7386782, 0, 1, 0.9176471, 1,
-0.05723083, -0.6112054, -3.347486, 0, 1, 0.9215686, 1,
-0.05585225, -1.002021, -1.331736, 0, 1, 0.9294118, 1,
-0.05540524, 0.1396145, -1.566025, 0, 1, 0.9333333, 1,
-0.0532532, 0.7971634, 1.81651, 0, 1, 0.9411765, 1,
-0.05197322, 1.002108, 0.05540544, 0, 1, 0.945098, 1,
-0.04633245, -0.4258668, -4.240287, 0, 1, 0.9529412, 1,
-0.04290601, -0.4293863, -3.382558, 0, 1, 0.9568627, 1,
-0.03807573, 1.427615, -1.003023, 0, 1, 0.9647059, 1,
-0.03600318, 0.7760609, -1.482995, 0, 1, 0.9686275, 1,
-0.03356735, 0.7685082, 1.374136, 0, 1, 0.9764706, 1,
-0.03291757, 0.1051895, -1.155505, 0, 1, 0.9803922, 1,
-0.02965382, -0.5064859, -1.728766, 0, 1, 0.9882353, 1,
-0.0292856, -1.49515, -1.946679, 0, 1, 0.9921569, 1,
-0.02915359, -0.8211052, -4.048199, 0, 1, 1, 1,
-0.02897981, -0.6499039, -3.686797, 0, 0.9921569, 1, 1,
-0.02762217, -0.9638488, -3.405962, 0, 0.9882353, 1, 1,
-0.02689462, 1.035804, -1.911108, 0, 0.9803922, 1, 1,
-0.02034408, 1.773727, -0.04667364, 0, 0.9764706, 1, 1,
-0.01480881, -0.6209342, -3.201981, 0, 0.9686275, 1, 1,
-0.01425022, 0.4439451, 0.5759677, 0, 0.9647059, 1, 1,
-0.008151051, 0.4131912, 0.450912, 0, 0.9568627, 1, 1,
-0.007226669, 0.05157877, -0.8314803, 0, 0.9529412, 1, 1,
-0.006177382, 1.853681, 0.7770337, 0, 0.945098, 1, 1,
-0.003398956, -1.56922, -1.558278, 0, 0.9411765, 1, 1,
-0.001368087, 0.1429338, 0.9664212, 0, 0.9333333, 1, 1,
2.886743e-05, -0.6385081, 3.502146, 0, 0.9294118, 1, 1,
0.0005724613, -0.5411506, 4.616224, 0, 0.9215686, 1, 1,
0.004951656, 0.4965664, -0.7908621, 0, 0.9176471, 1, 1,
0.01509528, 1.234159, -0.445481, 0, 0.9098039, 1, 1,
0.01887985, -0.2048317, 4.264208, 0, 0.9058824, 1, 1,
0.01960775, -0.432716, 2.764095, 0, 0.8980392, 1, 1,
0.02221551, 0.3117517, -0.3531637, 0, 0.8901961, 1, 1,
0.02559411, 1.634009, 0.03003564, 0, 0.8862745, 1, 1,
0.02563689, 1.198363, 0.2677827, 0, 0.8784314, 1, 1,
0.02659461, 0.8339134, -1.714182, 0, 0.8745098, 1, 1,
0.02822621, 2.033184, 0.3796531, 0, 0.8666667, 1, 1,
0.02824335, 0.3974822, -1.388449, 0, 0.8627451, 1, 1,
0.0284999, -0.8611814, 2.94818, 0, 0.854902, 1, 1,
0.03589499, 0.1264116, 0.6406317, 0, 0.8509804, 1, 1,
0.03676602, 0.7335145, 0.8979073, 0, 0.8431373, 1, 1,
0.04231608, 0.9289313, 0.7189533, 0, 0.8392157, 1, 1,
0.04365112, 1.699721, 1.009859, 0, 0.8313726, 1, 1,
0.04424305, -0.2613763, 2.813268, 0, 0.827451, 1, 1,
0.04772483, 1.639314, -1.458161, 0, 0.8196079, 1, 1,
0.04781987, -0.02340023, 2.095024, 0, 0.8156863, 1, 1,
0.04908106, 0.04886045, -0.3597507, 0, 0.8078431, 1, 1,
0.04981609, -0.5695914, 3.304513, 0, 0.8039216, 1, 1,
0.0523299, 0.9286101, 0.08605148, 0, 0.7960784, 1, 1,
0.05341612, -0.01140062, 2.483723, 0, 0.7882353, 1, 1,
0.05743239, 0.3592965, 0.7034058, 0, 0.7843137, 1, 1,
0.05873467, 0.6577946, 0.6992909, 0, 0.7764706, 1, 1,
0.06677829, 0.09237992, -0.1831757, 0, 0.772549, 1, 1,
0.06773957, -0.5255869, 2.365614, 0, 0.7647059, 1, 1,
0.07401833, -0.1771944, 3.738898, 0, 0.7607843, 1, 1,
0.07484352, 0.4360085, 0.354814, 0, 0.7529412, 1, 1,
0.07650461, -2.59954, 3.754361, 0, 0.7490196, 1, 1,
0.07784379, 1.633156, -0.595204, 0, 0.7411765, 1, 1,
0.08123632, -0.4255233, 1.495343, 0, 0.7372549, 1, 1,
0.0835687, 1.625165, 0.8870323, 0, 0.7294118, 1, 1,
0.09005412, 0.5992466, 0.03689752, 0, 0.7254902, 1, 1,
0.09234999, 0.493546, 1.806456, 0, 0.7176471, 1, 1,
0.09248729, 0.287399, 0.9903075, 0, 0.7137255, 1, 1,
0.09294638, 0.7862632, -1.250892, 0, 0.7058824, 1, 1,
0.09311582, 0.4756047, 0.5563074, 0, 0.6980392, 1, 1,
0.100735, -0.006855899, 0.5754899, 0, 0.6941177, 1, 1,
0.1008925, -0.2395075, 0.2042851, 0, 0.6862745, 1, 1,
0.1051233, 0.03117622, 1.934203, 0, 0.682353, 1, 1,
0.1058102, -0.6865733, 3.872682, 0, 0.6745098, 1, 1,
0.1090604, 0.8164359, -0.6673464, 0, 0.6705883, 1, 1,
0.1119593, -0.6566555, 4.996556, 0, 0.6627451, 1, 1,
0.1160094, 0.40906, 1.323703, 0, 0.6588235, 1, 1,
0.1164882, -2.032784, 2.950172, 0, 0.6509804, 1, 1,
0.1201873, 1.607745, -0.6935664, 0, 0.6470588, 1, 1,
0.1217363, -0.5528949, 2.698083, 0, 0.6392157, 1, 1,
0.1232631, 0.5793995, -0.637529, 0, 0.6352941, 1, 1,
0.1263981, 0.8386469, 0.06082942, 0, 0.627451, 1, 1,
0.130319, -2.607753, 1.576371, 0, 0.6235294, 1, 1,
0.1307026, -1.474239, 4.290881, 0, 0.6156863, 1, 1,
0.1336312, -0.7092315, 4.576131, 0, 0.6117647, 1, 1,
0.1354327, 1.126798, -0.2740395, 0, 0.6039216, 1, 1,
0.1363917, 0.2429223, 1.993614, 0, 0.5960785, 1, 1,
0.1438084, -0.6154039, 3.732457, 0, 0.5921569, 1, 1,
0.1530219, 1.530772, 1.463771, 0, 0.5843138, 1, 1,
0.1530234, 0.3723933, 1.26194, 0, 0.5803922, 1, 1,
0.1545881, 1.894928, 1.648815, 0, 0.572549, 1, 1,
0.1561904, 0.7192836, 0.9220478, 0, 0.5686275, 1, 1,
0.1611982, -1.455194, 2.243514, 0, 0.5607843, 1, 1,
0.1691133, 1.154338, 0.3249415, 0, 0.5568628, 1, 1,
0.177069, 0.4061729, -0.1023418, 0, 0.5490196, 1, 1,
0.1822555, 0.3737975, 0.7925695, 0, 0.5450981, 1, 1,
0.1835305, -0.4018891, 2.515355, 0, 0.5372549, 1, 1,
0.183626, -0.1395725, 2.219836, 0, 0.5333334, 1, 1,
0.1838162, -0.2116093, 3.37609, 0, 0.5254902, 1, 1,
0.1841467, -0.2545267, 1.969553, 0, 0.5215687, 1, 1,
0.1849728, 1.061744, 1.395712, 0, 0.5137255, 1, 1,
0.1852249, -1.001393, 1.732574, 0, 0.509804, 1, 1,
0.1858647, -0.7552091, 3.114332, 0, 0.5019608, 1, 1,
0.1866355, 0.3394494, -1.200137, 0, 0.4941176, 1, 1,
0.1903488, -2.149956, 4.256929, 0, 0.4901961, 1, 1,
0.1915333, 0.381078, -0.7557881, 0, 0.4823529, 1, 1,
0.1970464, -0.2727909, 3.545604, 0, 0.4784314, 1, 1,
0.2031336, -0.5099507, 4.355679, 0, 0.4705882, 1, 1,
0.2057423, -1.108983, 2.216702, 0, 0.4666667, 1, 1,
0.2059177, 1.286491, -1.221815, 0, 0.4588235, 1, 1,
0.2071546, 0.070664, 1.153008, 0, 0.454902, 1, 1,
0.2091523, -0.08332194, 1.531851, 0, 0.4470588, 1, 1,
0.2122778, 0.3012155, -2.735132, 0, 0.4431373, 1, 1,
0.2182219, 1.393697, 1.47856, 0, 0.4352941, 1, 1,
0.221945, 0.13641, 0.01154484, 0, 0.4313726, 1, 1,
0.2257177, 0.3621675, 1.722071, 0, 0.4235294, 1, 1,
0.2267245, 0.5429665, -0.01431408, 0, 0.4196078, 1, 1,
0.2269036, -0.2042624, 3.707906, 0, 0.4117647, 1, 1,
0.2315156, -0.1402692, 1.530627, 0, 0.4078431, 1, 1,
0.2315397, 1.10812, 0.09612314, 0, 0.4, 1, 1,
0.2329565, 2.280524, 0.5989401, 0, 0.3921569, 1, 1,
0.233134, -0.1444702, 3.004834, 0, 0.3882353, 1, 1,
0.2345418, -0.5954453, 3.607205, 0, 0.3803922, 1, 1,
0.2358414, -0.5715955, 3.457763, 0, 0.3764706, 1, 1,
0.2378483, 0.1560021, -0.6730522, 0, 0.3686275, 1, 1,
0.2407163, 1.361331, -0.9576101, 0, 0.3647059, 1, 1,
0.2459418, -0.8384155, 1.904185, 0, 0.3568628, 1, 1,
0.2468092, -0.4266399, 1.993149, 0, 0.3529412, 1, 1,
0.2475204, 0.03917607, 2.03648, 0, 0.345098, 1, 1,
0.2479286, 0.1395623, 1.676512, 0, 0.3411765, 1, 1,
0.2486996, -0.7244222, 3.982854, 0, 0.3333333, 1, 1,
0.2520054, 0.8376863, 0.9807847, 0, 0.3294118, 1, 1,
0.2549557, -0.3308401, 3.298652, 0, 0.3215686, 1, 1,
0.2593202, 0.4751609, 1.159127, 0, 0.3176471, 1, 1,
0.2637576, -0.3911375, 3.088923, 0, 0.3098039, 1, 1,
0.2680978, 1.60296, -0.5564787, 0, 0.3058824, 1, 1,
0.2693509, 0.6642317, 0.9157348, 0, 0.2980392, 1, 1,
0.2712867, 0.516676, 0.6763818, 0, 0.2901961, 1, 1,
0.2763251, -1.839234, 2.856291, 0, 0.2862745, 1, 1,
0.2788168, 1.396358, 1.443854, 0, 0.2784314, 1, 1,
0.2821439, 0.8703437, 0.5355614, 0, 0.2745098, 1, 1,
0.2905299, -1.784601, 2.123194, 0, 0.2666667, 1, 1,
0.2930004, -0.5139802, 2.415223, 0, 0.2627451, 1, 1,
0.3047731, 0.297426, 0.2663133, 0, 0.254902, 1, 1,
0.3050002, 0.4626648, 1.373488, 0, 0.2509804, 1, 1,
0.3088909, 1.273434, 1.759385, 0, 0.2431373, 1, 1,
0.3110485, 1.31268, 0.72934, 0, 0.2392157, 1, 1,
0.3189705, -0.522674, 4.71609, 0, 0.2313726, 1, 1,
0.3195606, 1.184201, 0.3192181, 0, 0.227451, 1, 1,
0.324794, 0.4818068, 0.8768707, 0, 0.2196078, 1, 1,
0.3292669, 0.7327145, -0.08968913, 0, 0.2156863, 1, 1,
0.3332816, -1.019585, 3.054389, 0, 0.2078431, 1, 1,
0.3362233, 0.3928233, -0.05371698, 0, 0.2039216, 1, 1,
0.3367854, 0.9530215, 2.155163, 0, 0.1960784, 1, 1,
0.3412807, 1.076417, -0.5496628, 0, 0.1882353, 1, 1,
0.3452796, 0.168656, 0.1023683, 0, 0.1843137, 1, 1,
0.3467655, 0.9300551, 0.2846296, 0, 0.1764706, 1, 1,
0.3475908, 0.09990514, 1.353968, 0, 0.172549, 1, 1,
0.3517638, 0.4154812, 0.4798496, 0, 0.1647059, 1, 1,
0.3629005, 0.2776235, 0.1351825, 0, 0.1607843, 1, 1,
0.3645382, 0.6756259, -0.8466352, 0, 0.1529412, 1, 1,
0.3686351, -0.2841802, 2.641417, 0, 0.1490196, 1, 1,
0.3691061, -1.414867, 3.791293, 0, 0.1411765, 1, 1,
0.3702007, -0.9296144, 1.092303, 0, 0.1372549, 1, 1,
0.3721421, 1.825747, 0.03681704, 0, 0.1294118, 1, 1,
0.3729809, 1.742815, -0.4944726, 0, 0.1254902, 1, 1,
0.3759905, 0.5775275, 1.560508, 0, 0.1176471, 1, 1,
0.3779567, -1.783588, 2.852779, 0, 0.1137255, 1, 1,
0.3781267, 0.03018983, 1.284811, 0, 0.1058824, 1, 1,
0.384546, -1.785135, 4.222213, 0, 0.09803922, 1, 1,
0.3873407, -0.0860014, 3.161152, 0, 0.09411765, 1, 1,
0.3892041, 0.2196819, 0.738037, 0, 0.08627451, 1, 1,
0.3907878, 1.136668, -1.490528, 0, 0.08235294, 1, 1,
0.392018, -0.1340206, 1.545602, 0, 0.07450981, 1, 1,
0.3934646, 0.6980019, 0.5559649, 0, 0.07058824, 1, 1,
0.3951958, -1.473453, 3.325469, 0, 0.0627451, 1, 1,
0.4026687, 1.063592, -0.9081639, 0, 0.05882353, 1, 1,
0.405004, -0.8162845, 2.085369, 0, 0.05098039, 1, 1,
0.4084335, -0.7128487, 1.214332, 0, 0.04705882, 1, 1,
0.408692, -0.1056686, 1.237633, 0, 0.03921569, 1, 1,
0.4115205, 0.7136484, 0.5055654, 0, 0.03529412, 1, 1,
0.415787, -1.869432, 2.830883, 0, 0.02745098, 1, 1,
0.4160384, 2.015878, 1.236166, 0, 0.02352941, 1, 1,
0.4175251, 0.5355667, 2.277005, 0, 0.01568628, 1, 1,
0.4191821, 0.6585908, 1.12682, 0, 0.01176471, 1, 1,
0.419851, -0.0121092, 1.53335, 0, 0.003921569, 1, 1,
0.422046, -0.381761, 2.273819, 0.003921569, 0, 1, 1,
0.4228925, -0.4583998, 1.775263, 0.007843138, 0, 1, 1,
0.4229187, 0.6051061, 1.408503, 0.01568628, 0, 1, 1,
0.4248969, 0.9202836, -0.2108233, 0.01960784, 0, 1, 1,
0.426337, 0.157127, 1.735447, 0.02745098, 0, 1, 1,
0.4278231, 0.8793533, -0.2645965, 0.03137255, 0, 1, 1,
0.4338741, 0.5028028, -0.06375475, 0.03921569, 0, 1, 1,
0.4353059, -1.954916, 2.55915, 0.04313726, 0, 1, 1,
0.4360578, -0.4582546, 2.395486, 0.05098039, 0, 1, 1,
0.441029, 0.2457689, 0.5421429, 0.05490196, 0, 1, 1,
0.455669, 0.6256016, 0.4935633, 0.0627451, 0, 1, 1,
0.4580837, -1.178405, 2.419829, 0.06666667, 0, 1, 1,
0.4609942, -1.176022, 3.357742, 0.07450981, 0, 1, 1,
0.4657598, -0.7795138, 2.155166, 0.07843138, 0, 1, 1,
0.4671901, 0.1605819, 2.451041, 0.08627451, 0, 1, 1,
0.470516, -0.4091023, 1.556415, 0.09019608, 0, 1, 1,
0.4717844, -0.6171775, 2.34834, 0.09803922, 0, 1, 1,
0.4756416, -0.5224262, 2.154997, 0.1058824, 0, 1, 1,
0.4822781, 0.9135255, 1.754354, 0.1098039, 0, 1, 1,
0.4838194, 0.5113078, 1.130864, 0.1176471, 0, 1, 1,
0.4925898, 1.581051, 0.4333155, 0.1215686, 0, 1, 1,
0.4945916, -0.1224239, 1.442713, 0.1294118, 0, 1, 1,
0.4949, -0.4446145, 2.318219, 0.1333333, 0, 1, 1,
0.4968329, 0.9492022, -0.3883364, 0.1411765, 0, 1, 1,
0.4971085, 1.456784, 0.6749529, 0.145098, 0, 1, 1,
0.5063878, 0.2451502, 3.749525, 0.1529412, 0, 1, 1,
0.5092388, -0.736649, 1.603719, 0.1568628, 0, 1, 1,
0.5119073, -2.341387, 3.034904, 0.1647059, 0, 1, 1,
0.5127047, -0.0689263, 2.539105, 0.1686275, 0, 1, 1,
0.5165037, 0.3431537, -0.8092694, 0.1764706, 0, 1, 1,
0.5165764, -0.4389676, 2.170939, 0.1803922, 0, 1, 1,
0.5208424, 0.1057561, 1.885, 0.1882353, 0, 1, 1,
0.5217481, 1.373579, -0.6375095, 0.1921569, 0, 1, 1,
0.5261845, -0.7409533, 3.683396, 0.2, 0, 1, 1,
0.5285755, -0.4316179, 1.827497, 0.2078431, 0, 1, 1,
0.532047, 0.216602, -0.03526728, 0.2117647, 0, 1, 1,
0.5362883, -0.7221965, 2.441693, 0.2196078, 0, 1, 1,
0.536976, 1.453611, 0.3580168, 0.2235294, 0, 1, 1,
0.5370414, 1.394981, 0.1084292, 0.2313726, 0, 1, 1,
0.5380562, -1.230224, 2.859044, 0.2352941, 0, 1, 1,
0.5395234, 2.332365, 1.001935, 0.2431373, 0, 1, 1,
0.545138, 0.6326922, 1.854814, 0.2470588, 0, 1, 1,
0.5466071, 0.8583123, -1.581783, 0.254902, 0, 1, 1,
0.5467055, 0.1402231, 2.415319, 0.2588235, 0, 1, 1,
0.5478463, -0.2295543, 2.268218, 0.2666667, 0, 1, 1,
0.5508709, 0.8788653, 1.499093, 0.2705882, 0, 1, 1,
0.554615, 2.146205, 0.2027852, 0.2784314, 0, 1, 1,
0.5554161, 0.6745776, 1.110623, 0.282353, 0, 1, 1,
0.5568829, -0.2653131, 2.421556, 0.2901961, 0, 1, 1,
0.5571483, -0.7928857, 3.141738, 0.2941177, 0, 1, 1,
0.5614341, 0.1469111, 2.557921, 0.3019608, 0, 1, 1,
0.5651268, 0.6364142, 1.549489, 0.3098039, 0, 1, 1,
0.5670984, -2.139966, 2.727342, 0.3137255, 0, 1, 1,
0.5735602, -1.771713, 3.332121, 0.3215686, 0, 1, 1,
0.5742297, -0.1435159, 1.123732, 0.3254902, 0, 1, 1,
0.576371, -0.3943122, 1.36804, 0.3333333, 0, 1, 1,
0.5766167, -1.253858, 2.704661, 0.3372549, 0, 1, 1,
0.5798421, -0.7385022, 3.619654, 0.345098, 0, 1, 1,
0.5821736, 2.749563, 2.107383, 0.3490196, 0, 1, 1,
0.5822548, 1.341686, 1.057894, 0.3568628, 0, 1, 1,
0.5887876, 0.1138775, 0.1440488, 0.3607843, 0, 1, 1,
0.5897101, -0.1332971, 1.879024, 0.3686275, 0, 1, 1,
0.5956823, 0.05998661, -0.7495126, 0.372549, 0, 1, 1,
0.596689, 1.780544, -0.744684, 0.3803922, 0, 1, 1,
0.60343, -0.07093158, 1.536581, 0.3843137, 0, 1, 1,
0.603447, 0.6578064, 0.731938, 0.3921569, 0, 1, 1,
0.6051859, -0.6226138, 3.545911, 0.3960784, 0, 1, 1,
0.6071773, 2.128836, -1.097507, 0.4039216, 0, 1, 1,
0.6073697, 0.2049785, -0.7314382, 0.4117647, 0, 1, 1,
0.6100424, 0.03095176, 1.917022, 0.4156863, 0, 1, 1,
0.6128703, -1.357292, 2.257556, 0.4235294, 0, 1, 1,
0.6276307, 0.323857, 0.5319847, 0.427451, 0, 1, 1,
0.6402208, -2.465129, 1.970617, 0.4352941, 0, 1, 1,
0.6449584, 0.997326, 0.9656591, 0.4392157, 0, 1, 1,
0.6459808, -1.221866, 3.30812, 0.4470588, 0, 1, 1,
0.6521821, 0.8313762, 1.412017, 0.4509804, 0, 1, 1,
0.6542255, 0.2034189, 2.277237, 0.4588235, 0, 1, 1,
0.6561618, -0.1289324, 2.382715, 0.4627451, 0, 1, 1,
0.6571662, -0.169948, 0.7168283, 0.4705882, 0, 1, 1,
0.6606161, 1.020882, -0.6188153, 0.4745098, 0, 1, 1,
0.6643141, -0.8790113, 1.869408, 0.4823529, 0, 1, 1,
0.6693224, -0.177278, 1.87716, 0.4862745, 0, 1, 1,
0.6710336, -0.02065436, 2.391975, 0.4941176, 0, 1, 1,
0.6765683, -3.010456, 2.798635, 0.5019608, 0, 1, 1,
0.677556, 0.4993654, 1.362693, 0.5058824, 0, 1, 1,
0.6806483, -1.08149, 4.71244, 0.5137255, 0, 1, 1,
0.6934165, -0.877234, 1.410767, 0.5176471, 0, 1, 1,
0.6978157, -1.502273, 2.240264, 0.5254902, 0, 1, 1,
0.700619, 0.505896, -0.04529882, 0.5294118, 0, 1, 1,
0.7055389, -0.2501854, 1.581253, 0.5372549, 0, 1, 1,
0.708378, -0.7737044, 1.644922, 0.5411765, 0, 1, 1,
0.7090137, -0.8496736, 2.996083, 0.5490196, 0, 1, 1,
0.7112547, -0.325151, 2.204637, 0.5529412, 0, 1, 1,
0.717079, -0.68454, 2.371365, 0.5607843, 0, 1, 1,
0.717116, -0.3824689, 2.48063, 0.5647059, 0, 1, 1,
0.722469, 0.3504247, -0.6966946, 0.572549, 0, 1, 1,
0.7228681, 1.445973, 0.8840635, 0.5764706, 0, 1, 1,
0.7237822, 0.08930926, 2.185429, 0.5843138, 0, 1, 1,
0.7268308, 1.5968, 0.7671246, 0.5882353, 0, 1, 1,
0.7307742, 1.107309, 0.3583658, 0.5960785, 0, 1, 1,
0.7309987, 0.03463865, 2.205269, 0.6039216, 0, 1, 1,
0.7372901, 0.7287368, -0.0407415, 0.6078432, 0, 1, 1,
0.738683, 0.4531249, 0.006065263, 0.6156863, 0, 1, 1,
0.7417722, 1.391114, -1.005256, 0.6196079, 0, 1, 1,
0.7449656, -1.586513, 2.649304, 0.627451, 0, 1, 1,
0.7466129, -2.016234, 2.949028, 0.6313726, 0, 1, 1,
0.7520724, 0.2939968, 1.007859, 0.6392157, 0, 1, 1,
0.7541704, -0.831639, 1.584628, 0.6431373, 0, 1, 1,
0.7548114, -0.6991482, 1.452293, 0.6509804, 0, 1, 1,
0.7580168, 0.9918566, 0.516699, 0.654902, 0, 1, 1,
0.7588782, -0.8110833, 1.232933, 0.6627451, 0, 1, 1,
0.7656015, -0.5663148, 1.424891, 0.6666667, 0, 1, 1,
0.7656683, -0.913509, 1.57178, 0.6745098, 0, 1, 1,
0.7722525, -1.220314, 2.775539, 0.6784314, 0, 1, 1,
0.7725349, -0.7226358, 1.542811, 0.6862745, 0, 1, 1,
0.7758427, -1.093028, 0.2419133, 0.6901961, 0, 1, 1,
0.778412, 0.8695023, 0.387699, 0.6980392, 0, 1, 1,
0.7823744, 0.2731033, 1.757313, 0.7058824, 0, 1, 1,
0.7849684, 1.181581, 0.3973569, 0.7098039, 0, 1, 1,
0.7852125, -0.7666869, 4.208787, 0.7176471, 0, 1, 1,
0.7886237, 0.08385461, 1.843768, 0.7215686, 0, 1, 1,
0.7960879, 0.5233362, 2.99954, 0.7294118, 0, 1, 1,
0.7998292, 0.8454406, 0.2698687, 0.7333333, 0, 1, 1,
0.804261, -0.4058772, -0.7079558, 0.7411765, 0, 1, 1,
0.8073146, 0.5998743, 0.3417246, 0.7450981, 0, 1, 1,
0.8154901, 0.4141782, 1.414876, 0.7529412, 0, 1, 1,
0.8200797, 0.6816282, 0.8163515, 0.7568628, 0, 1, 1,
0.8218912, 1.929486, 0.05837129, 0.7647059, 0, 1, 1,
0.8240783, 0.4790726, 1.191259, 0.7686275, 0, 1, 1,
0.8318406, 2.150985, 1.537708, 0.7764706, 0, 1, 1,
0.8322006, -1.916726, 2.839144, 0.7803922, 0, 1, 1,
0.8373145, 1.158187, 0.7622128, 0.7882353, 0, 1, 1,
0.8402876, -0.04988254, 2.952754, 0.7921569, 0, 1, 1,
0.8447785, 0.08647671, 0.4451666, 0.8, 0, 1, 1,
0.8534226, 0.0912495, 2.505576, 0.8078431, 0, 1, 1,
0.8584284, -1.087497, 3.043617, 0.8117647, 0, 1, 1,
0.8600896, 1.711458, 0.5103798, 0.8196079, 0, 1, 1,
0.8621151, -0.03060007, 2.081734, 0.8235294, 0, 1, 1,
0.865666, 0.4209527, 2.265057, 0.8313726, 0, 1, 1,
0.8705573, 0.4013257, 2.34066, 0.8352941, 0, 1, 1,
0.8721204, 0.8046191, -0.1066483, 0.8431373, 0, 1, 1,
0.8908555, -1.531427, 2.270436, 0.8470588, 0, 1, 1,
0.8911756, 0.5769818, -0.4883539, 0.854902, 0, 1, 1,
0.8925272, -0.344833, 2.554321, 0.8588235, 0, 1, 1,
0.892994, 0.04814683, 0.3916265, 0.8666667, 0, 1, 1,
0.8956958, 1.797928, -0.3252735, 0.8705882, 0, 1, 1,
0.8966329, 2.271319, 2.32751, 0.8784314, 0, 1, 1,
0.8982556, 0.7201529, 0.7372825, 0.8823529, 0, 1, 1,
0.9006701, -0.85291, 4.058362, 0.8901961, 0, 1, 1,
0.9021446, -0.2939391, 0.6658739, 0.8941177, 0, 1, 1,
0.9022778, -0.1121218, 0.9381769, 0.9019608, 0, 1, 1,
0.9029012, 0.05680815, 2.814021, 0.9098039, 0, 1, 1,
0.9074359, -0.7919363, 0.6609792, 0.9137255, 0, 1, 1,
0.9085917, -1.203209, 2.127333, 0.9215686, 0, 1, 1,
0.9107697, 0.1676536, 1.264325, 0.9254902, 0, 1, 1,
0.9124112, -0.04711724, 1.082161, 0.9333333, 0, 1, 1,
0.9173771, 0.5318477, 0.08907885, 0.9372549, 0, 1, 1,
0.920658, -0.1655375, 1.706706, 0.945098, 0, 1, 1,
0.9255399, -0.03764117, 1.559759, 0.9490196, 0, 1, 1,
0.9278453, -0.2843183, 0.8542988, 0.9568627, 0, 1, 1,
0.9305711, 1.877369, 1.14236, 0.9607843, 0, 1, 1,
0.9324707, 1.229429, 1.642928, 0.9686275, 0, 1, 1,
0.9392449, -1.392555, 2.920428, 0.972549, 0, 1, 1,
0.9422024, -0.1198876, 1.113528, 0.9803922, 0, 1, 1,
0.9429557, 0.6516671, 1.18191, 0.9843137, 0, 1, 1,
0.9445461, -0.4801839, 1.224584, 0.9921569, 0, 1, 1,
0.9471244, 0.4691528, 1.754227, 0.9960784, 0, 1, 1,
0.9603449, 0.5236434, 1.733768, 1, 0, 0.9960784, 1,
0.9607857, -2.268001, 1.621132, 1, 0, 0.9882353, 1,
0.9626353, -0.04081559, 1.702085, 1, 0, 0.9843137, 1,
0.9648196, -1.354419, 2.948357, 1, 0, 0.9764706, 1,
0.965097, 1.314173, 1.245203, 1, 0, 0.972549, 1,
0.9654673, -0.5866397, 2.326997, 1, 0, 0.9647059, 1,
0.9665968, -0.2900015, 0.7506235, 1, 0, 0.9607843, 1,
0.9734524, -1.156182, 3.418029, 1, 0, 0.9529412, 1,
0.9756901, 0.2058124, 3.59325, 1, 0, 0.9490196, 1,
0.9768908, 0.8506898, 0.7121441, 1, 0, 0.9411765, 1,
0.9784225, -0.4785452, 1.540181, 1, 0, 0.9372549, 1,
0.9787006, 0.1363686, 0.6806606, 1, 0, 0.9294118, 1,
0.9850736, 0.7131402, 2.855937, 1, 0, 0.9254902, 1,
0.9923116, -0.009803435, 1.41091, 1, 0, 0.9176471, 1,
0.9957398, 1.064898, -0.5775341, 1, 0, 0.9137255, 1,
1.000009, -1.263452, 0.441091, 1, 0, 0.9058824, 1,
1.005943, 1.765986, -0.1618027, 1, 0, 0.9019608, 1,
1.00663, -0.4683615, -0.1170906, 1, 0, 0.8941177, 1,
1.014983, 0.419192, -1.049608, 1, 0, 0.8862745, 1,
1.020682, -0.57222, 1.034353, 1, 0, 0.8823529, 1,
1.021448, 1.014383, 0.4506329, 1, 0, 0.8745098, 1,
1.024041, 0.5826386, 1.11512, 1, 0, 0.8705882, 1,
1.024405, 0.9617543, 0.1738141, 1, 0, 0.8627451, 1,
1.025293, -0.1479047, 3.21732, 1, 0, 0.8588235, 1,
1.030242, -1.35424, 2.940604, 1, 0, 0.8509804, 1,
1.031566, -1.023766, 2.018992, 1, 0, 0.8470588, 1,
1.032561, -2.286419, 1.994824, 1, 0, 0.8392157, 1,
1.041289, -0.3978818, 2.269372, 1, 0, 0.8352941, 1,
1.041428, -0.1670165, 1.03824, 1, 0, 0.827451, 1,
1.04358, -0.2290134, 2.169806, 1, 0, 0.8235294, 1,
1.043925, 0.3562943, 0.6733971, 1, 0, 0.8156863, 1,
1.05573, 0.5185427, 1.528353, 1, 0, 0.8117647, 1,
1.06338, 0.1217967, 2.352413, 1, 0, 0.8039216, 1,
1.065474, -0.8445933, 2.263915, 1, 0, 0.7960784, 1,
1.079606, -0.7927658, 1.997599, 1, 0, 0.7921569, 1,
1.089311, -1.43649, 1.114076, 1, 0, 0.7843137, 1,
1.093247, -0.5690154, 1.407996, 1, 0, 0.7803922, 1,
1.098609, -0.8902518, 1.673294, 1, 0, 0.772549, 1,
1.103257, 0.5665814, 0.286084, 1, 0, 0.7686275, 1,
1.105647, -0.2556842, 2.684432, 1, 0, 0.7607843, 1,
1.108969, -0.4858765, 2.344258, 1, 0, 0.7568628, 1,
1.116489, -1.345735, 3.207027, 1, 0, 0.7490196, 1,
1.116675, -0.4525763, 1.29604, 1, 0, 0.7450981, 1,
1.116865, -1.310954, 2.354429, 1, 0, 0.7372549, 1,
1.116943, 1.052483, 0.5500215, 1, 0, 0.7333333, 1,
1.118233, 0.6752542, 2.077289, 1, 0, 0.7254902, 1,
1.119336, 0.7762923, -0.2566113, 1, 0, 0.7215686, 1,
1.120234, -1.501798, 2.169027, 1, 0, 0.7137255, 1,
1.127078, -0.9167646, 2.684651, 1, 0, 0.7098039, 1,
1.127084, -0.4231393, 1.505925, 1, 0, 0.7019608, 1,
1.128031, 0.04937573, 2.489809, 1, 0, 0.6941177, 1,
1.152681, -0.8489584, 2.831939, 1, 0, 0.6901961, 1,
1.161496, 0.7221603, 1.254899, 1, 0, 0.682353, 1,
1.166556, 2.00136, -0.09700467, 1, 0, 0.6784314, 1,
1.171865, -0.1523149, 0.4577395, 1, 0, 0.6705883, 1,
1.179118, 1.495783, 0.02649106, 1, 0, 0.6666667, 1,
1.183683, -0.8260893, 2.158199, 1, 0, 0.6588235, 1,
1.188948, -0.734227, 0.5525484, 1, 0, 0.654902, 1,
1.190526, -1.241892, 3.044075, 1, 0, 0.6470588, 1,
1.193982, -2.681826, 1.663084, 1, 0, 0.6431373, 1,
1.201212, -1.467756, 0.8751137, 1, 0, 0.6352941, 1,
1.214064, 0.9410174, -0.2529515, 1, 0, 0.6313726, 1,
1.219052, -1.125845, -0.03541864, 1, 0, 0.6235294, 1,
1.226566, 1.299387, -0.09952544, 1, 0, 0.6196079, 1,
1.226578, 0.4037525, 3.255785, 1, 0, 0.6117647, 1,
1.239892, 0.46988, 0.4556499, 1, 0, 0.6078432, 1,
1.242832, -0.0831161, 2.152015, 1, 0, 0.6, 1,
1.247453, -0.4950786, 0.7982062, 1, 0, 0.5921569, 1,
1.248283, -2.279502, 2.957857, 1, 0, 0.5882353, 1,
1.261603, -1.081782, 0.6563058, 1, 0, 0.5803922, 1,
1.269339, 0.3058665, 2.069063, 1, 0, 0.5764706, 1,
1.290579, 0.4496697, 1.872483, 1, 0, 0.5686275, 1,
1.29518, 1.081909, 0.5313909, 1, 0, 0.5647059, 1,
1.295826, -1.917145, 1.179642, 1, 0, 0.5568628, 1,
1.296076, -0.4138525, 1.456993, 1, 0, 0.5529412, 1,
1.299602, 0.4145299, 2.778952, 1, 0, 0.5450981, 1,
1.305317, -0.08990531, -0.4625046, 1, 0, 0.5411765, 1,
1.315054, 0.04539531, 1.984454, 1, 0, 0.5333334, 1,
1.328072, 1.280564, 0.853345, 1, 0, 0.5294118, 1,
1.331968, -0.06292614, 0.5874785, 1, 0, 0.5215687, 1,
1.341208, -0.2705038, 1.115761, 1, 0, 0.5176471, 1,
1.341561, 2.810762, -0.6328306, 1, 0, 0.509804, 1,
1.343823, 1.151385, 2.035575, 1, 0, 0.5058824, 1,
1.34411, -0.4883851, 1.436542, 1, 0, 0.4980392, 1,
1.348754, -0.3534485, 2.98546, 1, 0, 0.4901961, 1,
1.355161, 2.57439, 0.627592, 1, 0, 0.4862745, 1,
1.364131, 0.08265042, 1.025363, 1, 0, 0.4784314, 1,
1.37228, -0.4695558, 2.139071, 1, 0, 0.4745098, 1,
1.38201, 0.008213495, -0.4362728, 1, 0, 0.4666667, 1,
1.385702, -0.1125969, 2.748039, 1, 0, 0.4627451, 1,
1.390434, -0.433719, 2.634104, 1, 0, 0.454902, 1,
1.395896, -0.2226358, 0.6151217, 1, 0, 0.4509804, 1,
1.40055, 0.5443557, 0.8285806, 1, 0, 0.4431373, 1,
1.406446, 0.409972, 1.891722, 1, 0, 0.4392157, 1,
1.411954, 0.06179705, 1.293324, 1, 0, 0.4313726, 1,
1.413808, 0.5056949, 2.89955, 1, 0, 0.427451, 1,
1.414521, 0.139901, 0.4991346, 1, 0, 0.4196078, 1,
1.426088, 0.2747976, 0.3863299, 1, 0, 0.4156863, 1,
1.436016, -1.221162, 3.524286, 1, 0, 0.4078431, 1,
1.437608, 0.3522205, 0.6109372, 1, 0, 0.4039216, 1,
1.438012, 1.031429, 1.070985, 1, 0, 0.3960784, 1,
1.440971, -0.000982758, 0.01520653, 1, 0, 0.3882353, 1,
1.444244, -0.2658902, 1.444731, 1, 0, 0.3843137, 1,
1.465294, -0.2859583, 0.8287035, 1, 0, 0.3764706, 1,
1.471969, 1.35877, 0.0432536, 1, 0, 0.372549, 1,
1.490885, -1.876351, 2.028458, 1, 0, 0.3647059, 1,
1.493414, -0.4550685, 1.216772, 1, 0, 0.3607843, 1,
1.493786, -0.05952385, 2.602291, 1, 0, 0.3529412, 1,
1.51154, -0.669107, 2.972829, 1, 0, 0.3490196, 1,
1.512565, -1.244543, 1.848636, 1, 0, 0.3411765, 1,
1.517607, -0.5298283, 1.04969, 1, 0, 0.3372549, 1,
1.518832, -0.5800452, 1.976931, 1, 0, 0.3294118, 1,
1.561163, -0.01315351, 1.519888, 1, 0, 0.3254902, 1,
1.566185, 0.4319531, 1.244595, 1, 0, 0.3176471, 1,
1.56672, -0.2678427, 2.086943, 1, 0, 0.3137255, 1,
1.569383, -0.7489585, 1.493279, 1, 0, 0.3058824, 1,
1.579963, 2.223132, 2.137605, 1, 0, 0.2980392, 1,
1.589671, 0.2564189, 0.7161792, 1, 0, 0.2941177, 1,
1.592152, -0.9698889, 2.250358, 1, 0, 0.2862745, 1,
1.593064, -0.8314961, 0.9084087, 1, 0, 0.282353, 1,
1.612164, 0.8263548, 0.3635406, 1, 0, 0.2745098, 1,
1.616078, 1.292854, 2.056325, 1, 0, 0.2705882, 1,
1.656872, -0.7923998, 1.65958, 1, 0, 0.2627451, 1,
1.661301, 0.4146414, 1.392485, 1, 0, 0.2588235, 1,
1.669424, 0.03363017, 1.713223, 1, 0, 0.2509804, 1,
1.673054, -0.1526046, 1.73612, 1, 0, 0.2470588, 1,
1.674896, -1.945708, 1.26769, 1, 0, 0.2392157, 1,
1.681167, -1.935361, 3.690407, 1, 0, 0.2352941, 1,
1.709772, -0.4059032, 1.667206, 1, 0, 0.227451, 1,
1.719046, -0.07159905, 0.1394413, 1, 0, 0.2235294, 1,
1.745655, -0.0001757253, 1.376285, 1, 0, 0.2156863, 1,
1.75498, -1.154626, 1.609016, 1, 0, 0.2117647, 1,
1.788991, -1.101272, 1.879716, 1, 0, 0.2039216, 1,
1.796088, -0.7113888, 1.796703, 1, 0, 0.1960784, 1,
1.803545, 0.729756, 0.8431456, 1, 0, 0.1921569, 1,
1.828571, -0.6887129, 1.483056, 1, 0, 0.1843137, 1,
1.847133, 1.342817, 3.198613, 1, 0, 0.1803922, 1,
1.861283, 0.5238392, 0.909718, 1, 0, 0.172549, 1,
1.865968, -0.4275166, 1.959131, 1, 0, 0.1686275, 1,
1.866289, -0.1836058, 2.06845, 1, 0, 0.1607843, 1,
1.873489, 0.8463826, 1.798966, 1, 0, 0.1568628, 1,
1.873619, -0.2669787, 1.428026, 1, 0, 0.1490196, 1,
1.880764, 1.450907, 1.598685, 1, 0, 0.145098, 1,
1.912502, 1.184709, 2.078932, 1, 0, 0.1372549, 1,
1.921467, 1.756667, 0.2669107, 1, 0, 0.1333333, 1,
1.936084, -0.1569563, 2.271021, 1, 0, 0.1254902, 1,
1.996985, -1.758379, 3.436175, 1, 0, 0.1215686, 1,
2.005497, -0.4784665, 2.213167, 1, 0, 0.1137255, 1,
2.011084, -1.825088, 0.3489807, 1, 0, 0.1098039, 1,
2.083123, -0.6927732, 2.213976, 1, 0, 0.1019608, 1,
2.085587, 0.2286039, 0.06357557, 1, 0, 0.09411765, 1,
2.120293, -0.5409893, 0.9835136, 1, 0, 0.09019608, 1,
2.127229, -0.3908046, 1.258875, 1, 0, 0.08235294, 1,
2.185287, 1.361092, 1.17554, 1, 0, 0.07843138, 1,
2.186615, 0.3485864, 1.722156, 1, 0, 0.07058824, 1,
2.197201, -0.430683, 0.6390096, 1, 0, 0.06666667, 1,
2.292065, 0.2441749, 1.777443, 1, 0, 0.05882353, 1,
2.311867, 0.4173259, 0.4204848, 1, 0, 0.05490196, 1,
2.344587, -2.246968, 2.5851, 1, 0, 0.04705882, 1,
2.36659, -1.761869, 3.947882, 1, 0, 0.04313726, 1,
2.413478, 1.033205, -0.4058382, 1, 0, 0.03529412, 1,
2.570922, -0.1134685, 1.458669, 1, 0, 0.03137255, 1,
2.590969, -0.09844135, -0.3251772, 1, 0, 0.02352941, 1,
2.602263, 0.136397, 2.530226, 1, 0, 0.01960784, 1,
2.665252, -0.561041, 2.003922, 1, 0, 0.01176471, 1,
2.836907, 0.6206191, 2.048528, 1, 0, 0.007843138, 1
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
-0.3689473, -4.592685, -6.347207, 0, -0.5, 0.5, 0.5,
-0.3689473, -4.592685, -6.347207, 1, -0.5, 0.5, 0.5,
-0.3689473, -4.592685, -6.347207, 1, 1.5, 0.5, 0.5,
-0.3689473, -4.592685, -6.347207, 0, 1.5, 0.5, 0.5
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
-4.661586, 0.01905036, -6.347207, 0, -0.5, 0.5, 0.5,
-4.661586, 0.01905036, -6.347207, 1, -0.5, 0.5, 0.5,
-4.661586, 0.01905036, -6.347207, 1, 1.5, 0.5, 0.5,
-4.661586, 0.01905036, -6.347207, 0, 1.5, 0.5, 0.5
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
-4.661586, -4.592685, 0.1467216, 0, -0.5, 0.5, 0.5,
-4.661586, -4.592685, 0.1467216, 1, -0.5, 0.5, 0.5,
-4.661586, -4.592685, 0.1467216, 1, 1.5, 0.5, 0.5,
-4.661586, -4.592685, 0.1467216, 0, 1.5, 0.5, 0.5
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
-3, -3.528438, -4.848608,
2, -3.528438, -4.848608,
-3, -3.528438, -4.848608,
-3, -3.705813, -5.098375,
-2, -3.528438, -4.848608,
-2, -3.705813, -5.098375,
-1, -3.528438, -4.848608,
-1, -3.705813, -5.098375,
0, -3.528438, -4.848608,
0, -3.705813, -5.098375,
1, -3.528438, -4.848608,
1, -3.705813, -5.098375,
2, -3.528438, -4.848608,
2, -3.705813, -5.098375
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
"2"
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
-3, -4.060562, -5.597908, 0, -0.5, 0.5, 0.5,
-3, -4.060562, -5.597908, 1, -0.5, 0.5, 0.5,
-3, -4.060562, -5.597908, 1, 1.5, 0.5, 0.5,
-3, -4.060562, -5.597908, 0, 1.5, 0.5, 0.5,
-2, -4.060562, -5.597908, 0, -0.5, 0.5, 0.5,
-2, -4.060562, -5.597908, 1, -0.5, 0.5, 0.5,
-2, -4.060562, -5.597908, 1, 1.5, 0.5, 0.5,
-2, -4.060562, -5.597908, 0, 1.5, 0.5, 0.5,
-1, -4.060562, -5.597908, 0, -0.5, 0.5, 0.5,
-1, -4.060562, -5.597908, 1, -0.5, 0.5, 0.5,
-1, -4.060562, -5.597908, 1, 1.5, 0.5, 0.5,
-1, -4.060562, -5.597908, 0, 1.5, 0.5, 0.5,
0, -4.060562, -5.597908, 0, -0.5, 0.5, 0.5,
0, -4.060562, -5.597908, 1, -0.5, 0.5, 0.5,
0, -4.060562, -5.597908, 1, 1.5, 0.5, 0.5,
0, -4.060562, -5.597908, 0, 1.5, 0.5, 0.5,
1, -4.060562, -5.597908, 0, -0.5, 0.5, 0.5,
1, -4.060562, -5.597908, 1, -0.5, 0.5, 0.5,
1, -4.060562, -5.597908, 1, 1.5, 0.5, 0.5,
1, -4.060562, -5.597908, 0, 1.5, 0.5, 0.5,
2, -4.060562, -5.597908, 0, -0.5, 0.5, 0.5,
2, -4.060562, -5.597908, 1, -0.5, 0.5, 0.5,
2, -4.060562, -5.597908, 1, 1.5, 0.5, 0.5,
2, -4.060562, -5.597908, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.670977, -3, -4.848608,
-3.670977, 3, -4.848608,
-3.670977, -3, -4.848608,
-3.836078, -3, -5.098375,
-3.670977, -2, -4.848608,
-3.836078, -2, -5.098375,
-3.670977, -1, -4.848608,
-3.836078, -1, -5.098375,
-3.670977, 0, -4.848608,
-3.836078, 0, -5.098375,
-3.670977, 1, -4.848608,
-3.836078, 1, -5.098375,
-3.670977, 2, -4.848608,
-3.836078, 2, -5.098375,
-3.670977, 3, -4.848608,
-3.836078, 3, -5.098375
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
-4.166281, -3, -5.597908, 0, -0.5, 0.5, 0.5,
-4.166281, -3, -5.597908, 1, -0.5, 0.5, 0.5,
-4.166281, -3, -5.597908, 1, 1.5, 0.5, 0.5,
-4.166281, -3, -5.597908, 0, 1.5, 0.5, 0.5,
-4.166281, -2, -5.597908, 0, -0.5, 0.5, 0.5,
-4.166281, -2, -5.597908, 1, -0.5, 0.5, 0.5,
-4.166281, -2, -5.597908, 1, 1.5, 0.5, 0.5,
-4.166281, -2, -5.597908, 0, 1.5, 0.5, 0.5,
-4.166281, -1, -5.597908, 0, -0.5, 0.5, 0.5,
-4.166281, -1, -5.597908, 1, -0.5, 0.5, 0.5,
-4.166281, -1, -5.597908, 1, 1.5, 0.5, 0.5,
-4.166281, -1, -5.597908, 0, 1.5, 0.5, 0.5,
-4.166281, 0, -5.597908, 0, -0.5, 0.5, 0.5,
-4.166281, 0, -5.597908, 1, -0.5, 0.5, 0.5,
-4.166281, 0, -5.597908, 1, 1.5, 0.5, 0.5,
-4.166281, 0, -5.597908, 0, 1.5, 0.5, 0.5,
-4.166281, 1, -5.597908, 0, -0.5, 0.5, 0.5,
-4.166281, 1, -5.597908, 1, -0.5, 0.5, 0.5,
-4.166281, 1, -5.597908, 1, 1.5, 0.5, 0.5,
-4.166281, 1, -5.597908, 0, 1.5, 0.5, 0.5,
-4.166281, 2, -5.597908, 0, -0.5, 0.5, 0.5,
-4.166281, 2, -5.597908, 1, -0.5, 0.5, 0.5,
-4.166281, 2, -5.597908, 1, 1.5, 0.5, 0.5,
-4.166281, 2, -5.597908, 0, 1.5, 0.5, 0.5,
-4.166281, 3, -5.597908, 0, -0.5, 0.5, 0.5,
-4.166281, 3, -5.597908, 1, -0.5, 0.5, 0.5,
-4.166281, 3, -5.597908, 1, 1.5, 0.5, 0.5,
-4.166281, 3, -5.597908, 0, 1.5, 0.5, 0.5
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
-3.670977, -3.528438, -4,
-3.670977, -3.528438, 4,
-3.670977, -3.528438, -4,
-3.836078, -3.705813, -4,
-3.670977, -3.528438, -2,
-3.836078, -3.705813, -2,
-3.670977, -3.528438, 0,
-3.836078, -3.705813, 0,
-3.670977, -3.528438, 2,
-3.836078, -3.705813, 2,
-3.670977, -3.528438, 4,
-3.836078, -3.705813, 4
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
-4.166281, -4.060562, -4, 0, -0.5, 0.5, 0.5,
-4.166281, -4.060562, -4, 1, -0.5, 0.5, 0.5,
-4.166281, -4.060562, -4, 1, 1.5, 0.5, 0.5,
-4.166281, -4.060562, -4, 0, 1.5, 0.5, 0.5,
-4.166281, -4.060562, -2, 0, -0.5, 0.5, 0.5,
-4.166281, -4.060562, -2, 1, -0.5, 0.5, 0.5,
-4.166281, -4.060562, -2, 1, 1.5, 0.5, 0.5,
-4.166281, -4.060562, -2, 0, 1.5, 0.5, 0.5,
-4.166281, -4.060562, 0, 0, -0.5, 0.5, 0.5,
-4.166281, -4.060562, 0, 1, -0.5, 0.5, 0.5,
-4.166281, -4.060562, 0, 1, 1.5, 0.5, 0.5,
-4.166281, -4.060562, 0, 0, 1.5, 0.5, 0.5,
-4.166281, -4.060562, 2, 0, -0.5, 0.5, 0.5,
-4.166281, -4.060562, 2, 1, -0.5, 0.5, 0.5,
-4.166281, -4.060562, 2, 1, 1.5, 0.5, 0.5,
-4.166281, -4.060562, 2, 0, 1.5, 0.5, 0.5,
-4.166281, -4.060562, 4, 0, -0.5, 0.5, 0.5,
-4.166281, -4.060562, 4, 1, -0.5, 0.5, 0.5,
-4.166281, -4.060562, 4, 1, 1.5, 0.5, 0.5,
-4.166281, -4.060562, 4, 0, 1.5, 0.5, 0.5
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
-3.670977, -3.528438, -4.848608,
-3.670977, 3.566539, -4.848608,
-3.670977, -3.528438, 5.142051,
-3.670977, 3.566539, 5.142051,
-3.670977, -3.528438, -4.848608,
-3.670977, -3.528438, 5.142051,
-3.670977, 3.566539, -4.848608,
-3.670977, 3.566539, 5.142051,
-3.670977, -3.528438, -4.848608,
2.933082, -3.528438, -4.848608,
-3.670977, -3.528438, 5.142051,
2.933082, -3.528438, 5.142051,
-3.670977, 3.566539, -4.848608,
2.933082, 3.566539, -4.848608,
-3.670977, 3.566539, 5.142051,
2.933082, 3.566539, 5.142051,
2.933082, -3.528438, -4.848608,
2.933082, 3.566539, -4.848608,
2.933082, -3.528438, 5.142051,
2.933082, 3.566539, 5.142051,
2.933082, -3.528438, -4.848608,
2.933082, -3.528438, 5.142051,
2.933082, 3.566539, -4.848608,
2.933082, 3.566539, 5.142051
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
var radius = 7.432994;
var distance = 33.07023;
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
mvMatrix.translate( 0.3689473, -0.01905036, -0.1467216 );
mvMatrix.scale( 1.216933, 1.132731, 0.8044212 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.07023);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
N-ethylsulfonyl-2-ni<-read.table("N-ethylsulfonyl-2-ni.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-N-ethylsulfonyl-2-ni$V2
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
y<-N-ethylsulfonyl-2-ni$V3
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
z<-N-ethylsulfonyl-2-ni$V4
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
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
-3.574801, 1.723177, -0.6027055, 0, 0, 1, 1, 1,
-3.160456, 0.7432179, -0.8726007, 1, 0, 0, 1, 1,
-2.754183, -0.6619344, -0.06734882, 1, 0, 0, 1, 1,
-2.471426, -0.7861514, -2.44269, 1, 0, 0, 1, 1,
-2.467768, -0.8287078, -1.762024, 1, 0, 0, 1, 1,
-2.415468, 1.538677, 0.3659251, 1, 0, 0, 1, 1,
-2.401098, -0.1679503, 0.6083088, 0, 0, 0, 1, 1,
-2.376228, -0.5623008, -0.7354455, 0, 0, 0, 1, 1,
-2.345244, 0.2221801, -0.6105431, 0, 0, 0, 1, 1,
-2.241149, -0.1362067, -1.438529, 0, 0, 0, 1, 1,
-2.212536, -1.48268, -3.108672, 0, 0, 0, 1, 1,
-2.202242, 0.6201857, -1.060092, 0, 0, 0, 1, 1,
-2.199954, -1.006156, -0.1672598, 0, 0, 0, 1, 1,
-2.131807, -0.3249806, -3.13327, 1, 1, 1, 1, 1,
-2.088766, 1.187509, -1.244717, 1, 1, 1, 1, 1,
-2.085875, -1.072518, -2.914233, 1, 1, 1, 1, 1,
-2.079901, -0.760845, -3.076447, 1, 1, 1, 1, 1,
-2.079235, -1.434851, -0.6134532, 1, 1, 1, 1, 1,
-2.032091, -0.1864622, -1.372468, 1, 1, 1, 1, 1,
-2.021402, 0.1385682, -0.6523268, 1, 1, 1, 1, 1,
-1.941482, 0.4714216, -0.8076344, 1, 1, 1, 1, 1,
-1.92925, 0.2905644, -1.861477, 1, 1, 1, 1, 1,
-1.885681, -0.9959396, -3.666049, 1, 1, 1, 1, 1,
-1.850891, -1.170223, -1.399464, 1, 1, 1, 1, 1,
-1.850203, -1.909644, -1.430173, 1, 1, 1, 1, 1,
-1.839212, -0.6394662, -3.216625, 1, 1, 1, 1, 1,
-1.806009, 0.1662054, -0.2952356, 1, 1, 1, 1, 1,
-1.785169, 0.4095335, -1.94079, 1, 1, 1, 1, 1,
-1.783572, 0.7751065, -0.2793378, 0, 0, 1, 1, 1,
-1.779608, -1.079178, -2.593304, 1, 0, 0, 1, 1,
-1.771415, 0.2666686, -2.335438, 1, 0, 0, 1, 1,
-1.769238, -0.2732706, -2.152546, 1, 0, 0, 1, 1,
-1.758162, 0.665275, -0.3826186, 1, 0, 0, 1, 1,
-1.753506, -2.325042, -2.980372, 1, 0, 0, 1, 1,
-1.73515, 0.2523876, -0.8755158, 0, 0, 0, 1, 1,
-1.712091, 0.2786163, -2.382078, 0, 0, 0, 1, 1,
-1.697468, -0.3484704, -1.728236, 0, 0, 0, 1, 1,
-1.692199, 0.5967226, -0.8137734, 0, 0, 0, 1, 1,
-1.685252, -0.3345653, -2.859754, 0, 0, 0, 1, 1,
-1.674821, 1.072242, -1.166775, 0, 0, 0, 1, 1,
-1.667736, -2.086747, -4.175661, 0, 0, 0, 1, 1,
-1.654977, 0.9596913, 0.008132061, 1, 1, 1, 1, 1,
-1.65403, 0.4518984, -2.650533, 1, 1, 1, 1, 1,
-1.639996, -1.756072, -2.199242, 1, 1, 1, 1, 1,
-1.63073, 0.8038621, -2.271696, 1, 1, 1, 1, 1,
-1.626026, 0.7796023, -1.369439, 1, 1, 1, 1, 1,
-1.616859, -1.693479, -1.767351, 1, 1, 1, 1, 1,
-1.609132, 1.269171, -0.4141576, 1, 1, 1, 1, 1,
-1.607849, 0.9103538, -1.594539, 1, 1, 1, 1, 1,
-1.602556, -1.029963, -0.6825456, 1, 1, 1, 1, 1,
-1.598392, -0.3153298, -1.108048, 1, 1, 1, 1, 1,
-1.590897, -0.3767142, -1.612822, 1, 1, 1, 1, 1,
-1.587219, -0.7097216, -3.606304, 1, 1, 1, 1, 1,
-1.585845, -0.1681646, -1.313304, 1, 1, 1, 1, 1,
-1.577146, 2.08978, 0.1438346, 1, 1, 1, 1, 1,
-1.576703, -1.050951, -2.347136, 1, 1, 1, 1, 1,
-1.568036, 0.5270656, -0.1181784, 0, 0, 1, 1, 1,
-1.563695, -0.02732483, -1.666134, 1, 0, 0, 1, 1,
-1.55227, -1.222295, -0.5228383, 1, 0, 0, 1, 1,
-1.551526, -0.2346025, -1.339442, 1, 0, 0, 1, 1,
-1.546728, 2.47253, -1.345307, 1, 0, 0, 1, 1,
-1.524427, -0.5808448, -1.743466, 1, 0, 0, 1, 1,
-1.518038, -0.8612943, -2.552466, 0, 0, 0, 1, 1,
-1.515457, 0.177849, -2.304388, 0, 0, 0, 1, 1,
-1.497713, -1.04405, -1.411275, 0, 0, 0, 1, 1,
-1.488591, 0.9500964, -1.695657, 0, 0, 0, 1, 1,
-1.45502, 0.3634972, -1.781416, 0, 0, 0, 1, 1,
-1.453393, -2.630413, -4.68484, 0, 0, 0, 1, 1,
-1.451468, 0.4198543, -2.045728, 0, 0, 0, 1, 1,
-1.441972, 0.39639, 0.1649722, 1, 1, 1, 1, 1,
-1.441901, 0.7700563, -2.204577, 1, 1, 1, 1, 1,
-1.440775, -0.4409549, -1.777039, 1, 1, 1, 1, 1,
-1.436054, -0.05378119, -3.269333, 1, 1, 1, 1, 1,
-1.435023, 2.181342, 0.5443646, 1, 1, 1, 1, 1,
-1.433126, -0.1057481, 0.09943177, 1, 1, 1, 1, 1,
-1.432793, 0.1351012, -1.998268, 1, 1, 1, 1, 1,
-1.431633, 2.366499, -0.4669296, 1, 1, 1, 1, 1,
-1.429275, -0.3290938, -2.565842, 1, 1, 1, 1, 1,
-1.426902, 0.008125545, -1.298304, 1, 1, 1, 1, 1,
-1.426708, -0.04648172, -2.049778, 1, 1, 1, 1, 1,
-1.424386, -0.4752712, -2.087666, 1, 1, 1, 1, 1,
-1.421222, -0.09911291, -1.588376, 1, 1, 1, 1, 1,
-1.403611, 1.156844, -0.6753404, 1, 1, 1, 1, 1,
-1.39868, 0.8560936, -2.25809, 1, 1, 1, 1, 1,
-1.396001, 0.04494874, -1.260824, 0, 0, 1, 1, 1,
-1.395002, 1.029877, 0.004344461, 1, 0, 0, 1, 1,
-1.394611, -1.311766, -3.534236, 1, 0, 0, 1, 1,
-1.393868, -0.259804, -0.690495, 1, 0, 0, 1, 1,
-1.393084, 0.4679959, -1.931276, 1, 0, 0, 1, 1,
-1.381297, -1.238136, -1.95805, 1, 0, 0, 1, 1,
-1.380791, 0.2991343, -0.5291963, 0, 0, 0, 1, 1,
-1.370703, 0.2807746, -1.807604, 0, 0, 0, 1, 1,
-1.369548, 0.4240289, -0.7687328, 0, 0, 0, 1, 1,
-1.368594, 0.2366137, -1.505099, 0, 0, 0, 1, 1,
-1.362897, -0.6778003, -1.934292, 0, 0, 0, 1, 1,
-1.354094, 0.2549295, -1.529459, 0, 0, 0, 1, 1,
-1.341829, -1.479725, -0.2561169, 0, 0, 0, 1, 1,
-1.340089, 0.1546513, -3.120498, 1, 1, 1, 1, 1,
-1.330132, -1.213197, -1.253775, 1, 1, 1, 1, 1,
-1.315367, -0.0003403633, -3.028881, 1, 1, 1, 1, 1,
-1.309456, -2.164346, -2.632221, 1, 1, 1, 1, 1,
-1.305564, 0.602754, -0.9221614, 1, 1, 1, 1, 1,
-1.293228, 0.4921795, -1.119998, 1, 1, 1, 1, 1,
-1.283302, -1.510086, -3.032374, 1, 1, 1, 1, 1,
-1.251859, 0.1334408, -2.309242, 1, 1, 1, 1, 1,
-1.247374, -1.419874, -1.387448, 1, 1, 1, 1, 1,
-1.238211, 0.2995845, -1.003131, 1, 1, 1, 1, 1,
-1.227018, 1.623669, -1.365656, 1, 1, 1, 1, 1,
-1.224922, -1.009863, -2.894382, 1, 1, 1, 1, 1,
-1.20558, 0.3510144, -0.9795235, 1, 1, 1, 1, 1,
-1.202476, 0.5226362, -0.9956677, 1, 1, 1, 1, 1,
-1.201038, -0.08366162, -2.289326, 1, 1, 1, 1, 1,
-1.20067, 0.7176349, 0.2752424, 0, 0, 1, 1, 1,
-1.196774, 3.463214, 0.4455462, 1, 0, 0, 1, 1,
-1.195519, -1.721739, -2.37054, 1, 0, 0, 1, 1,
-1.190047, 0.5369069, -2.706134, 1, 0, 0, 1, 1,
-1.182771, 1.896162, -1.14994, 1, 0, 0, 1, 1,
-1.169698, 0.3289713, -0.1042493, 1, 0, 0, 1, 1,
-1.168544, -1.594018, -1.758165, 0, 0, 0, 1, 1,
-1.167319, -0.7281067, -1.207221, 0, 0, 0, 1, 1,
-1.16138, -0.4985226, -2.224725, 0, 0, 0, 1, 1,
-1.154956, -0.2944428, -3.340381, 0, 0, 0, 1, 1,
-1.151464, 1.086484, -1.901323, 0, 0, 0, 1, 1,
-1.140548, -0.7422408, -1.936157, 0, 0, 0, 1, 1,
-1.137948, -0.6736703, -1.113649, 0, 0, 0, 1, 1,
-1.126585, -0.5346615, -2.027819, 1, 1, 1, 1, 1,
-1.123207, 2.137626, 0.06642263, 1, 1, 1, 1, 1,
-1.105211, -0.2875726, -1.747493, 1, 1, 1, 1, 1,
-1.104157, -0.04715354, -2.172021, 1, 1, 1, 1, 1,
-1.101379, -0.2710811, -3.157246, 1, 1, 1, 1, 1,
-1.098155, -0.06644658, -3.320963, 1, 1, 1, 1, 1,
-1.094432, -0.08624677, -0.9807699, 1, 1, 1, 1, 1,
-1.080713, -0.06998701, -2.14419, 1, 1, 1, 1, 1,
-1.078246, 0.2286631, -0.7634445, 1, 1, 1, 1, 1,
-1.075631, -0.598511, -1.224692, 1, 1, 1, 1, 1,
-1.069177, -0.8862582, -2.579852, 1, 1, 1, 1, 1,
-1.06267, 0.4130229, -1.158515, 1, 1, 1, 1, 1,
-1.06218, -0.8209465, -0.8873848, 1, 1, 1, 1, 1,
-1.058767, 0.2807537, -0.8743569, 1, 1, 1, 1, 1,
-1.055251, -0.1133683, -1.257257, 1, 1, 1, 1, 1,
-1.051586, 2.805308, -0.07264721, 0, 0, 1, 1, 1,
-1.051313, -1.149913, -2.440887, 1, 0, 0, 1, 1,
-1.048805, -0.03778398, -0.8263549, 1, 0, 0, 1, 1,
-1.043383, 1.727708, -0.7438364, 1, 0, 0, 1, 1,
-1.040209, 1.116844, -1.387205, 1, 0, 0, 1, 1,
-1.029732, -0.4647737, -1.131546, 1, 0, 0, 1, 1,
-1.017481, -0.2448004, -1.948717, 0, 0, 0, 1, 1,
-1.015411, -0.6529821, -2.974025, 0, 0, 0, 1, 1,
-1.013932, 0.09413194, -1.704227, 0, 0, 0, 1, 1,
-1.005159, -0.1567404, 0.03571142, 0, 0, 0, 1, 1,
-1.004817, 1.146586, -1.758035, 0, 0, 0, 1, 1,
-0.9988528, -0.6296863, -1.237835, 0, 0, 0, 1, 1,
-0.9939039, -0.07265535, -1.333584, 0, 0, 0, 1, 1,
-0.9917002, -2.395058, -3.169522, 1, 1, 1, 1, 1,
-0.9870345, 1.67449, 0.07614636, 1, 1, 1, 1, 1,
-0.9840693, 1.572845, -0.1908298, 1, 1, 1, 1, 1,
-0.9799773, 0.857767, -2.134126, 1, 1, 1, 1, 1,
-0.9706754, -0.3316475, -1.711243, 1, 1, 1, 1, 1,
-0.9664519, 0.04080888, -1.971385, 1, 1, 1, 1, 1,
-0.9596926, 0.6713327, -1.221087, 1, 1, 1, 1, 1,
-0.9490482, 0.6763329, -0.683137, 1, 1, 1, 1, 1,
-0.9456262, 1.125706, 0.3043674, 1, 1, 1, 1, 1,
-0.9402069, -0.2472848, -4.489816, 1, 1, 1, 1, 1,
-0.9365513, -0.8339211, -0.5196396, 1, 1, 1, 1, 1,
-0.9359728, -0.6077549, -0.9239448, 1, 1, 1, 1, 1,
-0.9167916, -1.230485, -3.025258, 1, 1, 1, 1, 1,
-0.9142313, 0.9233173, -2.979077, 1, 1, 1, 1, 1,
-0.9130962, 0.2242616, 0.09261728, 1, 1, 1, 1, 1,
-0.9119028, -1.341216, -1.982231, 0, 0, 1, 1, 1,
-0.9101759, 0.9022735, 0.5940306, 1, 0, 0, 1, 1,
-0.9035922, 0.6626201, -0.1584584, 1, 0, 0, 1, 1,
-0.8985305, -1.006402, -4.051482, 1, 0, 0, 1, 1,
-0.8981062, -0.5114899, -3.080508, 1, 0, 0, 1, 1,
-0.8968419, -0.773347, -1.448774, 1, 0, 0, 1, 1,
-0.8965541, -0.7989851, -3.001784, 0, 0, 0, 1, 1,
-0.896185, -1.955597, -1.617629, 0, 0, 0, 1, 1,
-0.8902843, 0.05700883, -2.307627, 0, 0, 0, 1, 1,
-0.8872507, 0.7080206, -0.6350163, 0, 0, 0, 1, 1,
-0.8824788, -0.5683051, -2.001416, 0, 0, 0, 1, 1,
-0.8823715, 0.9915832, -0.6388395, 0, 0, 0, 1, 1,
-0.8809171, 1.18377, -1.828693, 0, 0, 0, 1, 1,
-0.8793074, -1.193471, -1.688927, 1, 1, 1, 1, 1,
-0.8782442, 0.5841822, -1.943857, 1, 1, 1, 1, 1,
-0.8763727, -0.04619147, 0.3049887, 1, 1, 1, 1, 1,
-0.8753834, 0.08064394, -0.8547392, 1, 1, 1, 1, 1,
-0.8655653, 1.895113, 0.2184709, 1, 1, 1, 1, 1,
-0.8643287, 1.050058, -1.22042, 1, 1, 1, 1, 1,
-0.8634698, 0.1781759, -1.804937, 1, 1, 1, 1, 1,
-0.857903, 1.094107, -0.8677952, 1, 1, 1, 1, 1,
-0.8553936, 0.7785788, -1.745744, 1, 1, 1, 1, 1,
-0.8518121, -2.677892, -3.753974, 1, 1, 1, 1, 1,
-0.8504237, 1.16586, -1.273737, 1, 1, 1, 1, 1,
-0.8468818, -2.089218, -2.744131, 1, 1, 1, 1, 1,
-0.8452316, -0.6813697, -2.262532, 1, 1, 1, 1, 1,
-0.8448909, 0.9752573, -1.636378, 1, 1, 1, 1, 1,
-0.8428352, 0.3430037, -1.876501, 1, 1, 1, 1, 1,
-0.8412164, -0.2312814, -1.33036, 0, 0, 1, 1, 1,
-0.8411234, -1.385716, -3.228077, 1, 0, 0, 1, 1,
-0.8385578, -1.195552, -2.592098, 1, 0, 0, 1, 1,
-0.831259, 1.426128, -0.8120236, 1, 0, 0, 1, 1,
-0.8283629, -0.4404277, -2.783084, 1, 0, 0, 1, 1,
-0.8262215, -1.167599, -2.900671, 1, 0, 0, 1, 1,
-0.8232997, 0.7030339, 0.03131887, 0, 0, 0, 1, 1,
-0.8226403, -0.5420242, -1.027777, 0, 0, 0, 1, 1,
-0.817426, 0.4866558, -1.302141, 0, 0, 0, 1, 1,
-0.8141959, -0.1238173, -1.412011, 0, 0, 0, 1, 1,
-0.812967, -0.1871074, -2.163522, 0, 0, 0, 1, 1,
-0.8092269, 0.5478057, -1.729997, 0, 0, 0, 1, 1,
-0.8084465, -1.450366, -3.512428, 0, 0, 0, 1, 1,
-0.806559, 0.06002367, -0.7501488, 1, 1, 1, 1, 1,
-0.8064733, 1.398184, -0.5539393, 1, 1, 1, 1, 1,
-0.8062287, 0.744811, 0.3254442, 1, 1, 1, 1, 1,
-0.7962659, 0.2664563, -0.4738521, 1, 1, 1, 1, 1,
-0.7952155, 1.618141, -0.413973, 1, 1, 1, 1, 1,
-0.7879816, -0.6779887, -1.404218, 1, 1, 1, 1, 1,
-0.7845666, 0.01192749, -0.8406654, 1, 1, 1, 1, 1,
-0.7767152, -0.3576511, -4.211397, 1, 1, 1, 1, 1,
-0.7747602, 0.8284945, -0.5995382, 1, 1, 1, 1, 1,
-0.7729948, 0.5212736, 1.588047, 1, 1, 1, 1, 1,
-0.7675337, -1.283244, -4.465662, 1, 1, 1, 1, 1,
-0.7632719, -1.229453, -3.640349, 1, 1, 1, 1, 1,
-0.7604755, 2.815743, 1.126541, 1, 1, 1, 1, 1,
-0.7596193, -0.2022041, -2.325101, 1, 1, 1, 1, 1,
-0.7503008, 0.1177946, -1.328721, 1, 1, 1, 1, 1,
-0.742405, -0.8568978, -1.393522, 0, 0, 1, 1, 1,
-0.741218, -0.2745338, -2.069622, 1, 0, 0, 1, 1,
-0.7385341, 1.106027, -0.2147177, 1, 0, 0, 1, 1,
-0.7379317, -0.1013257, 0.07603214, 1, 0, 0, 1, 1,
-0.7361962, -1.665849, -2.233938, 1, 0, 0, 1, 1,
-0.7330147, 0.2185242, -1.631729, 1, 0, 0, 1, 1,
-0.7329951, 0.0673907, -2.33423, 0, 0, 0, 1, 1,
-0.7234351, -0.8245307, -0.2386132, 0, 0, 0, 1, 1,
-0.7231252, 1.895779, 1.231983, 0, 0, 0, 1, 1,
-0.7197278, 0.7042969, -0.219761, 0, 0, 0, 1, 1,
-0.7169296, 0.6388518, -1.559899, 0, 0, 0, 1, 1,
-0.7114514, 0.5458931, -0.6474396, 0, 0, 0, 1, 1,
-0.706552, -0.6671771, -1.539, 0, 0, 0, 1, 1,
-0.70496, -1.59045, -1.372593, 1, 1, 1, 1, 1,
-0.691435, 0.6562439, -2.143552, 1, 1, 1, 1, 1,
-0.6868591, -0.5006623, -1.496304, 1, 1, 1, 1, 1,
-0.6827765, -2.128051, -2.633812, 1, 1, 1, 1, 1,
-0.6789628, 0.820245, 0.424477, 1, 1, 1, 1, 1,
-0.6777157, 1.314421, -3.206042, 1, 1, 1, 1, 1,
-0.677343, -0.1160758, -0.1155971, 1, 1, 1, 1, 1,
-0.6751393, 0.640974, -1.104477, 1, 1, 1, 1, 1,
-0.6731201, 1.54639, 2.125857, 1, 1, 1, 1, 1,
-0.6608729, -0.8260772, -1.758667, 1, 1, 1, 1, 1,
-0.659322, 1.010595, -2.351059, 1, 1, 1, 1, 1,
-0.6579518, -0.4189217, -1.203522, 1, 1, 1, 1, 1,
-0.654952, 0.1727723, -1.84934, 1, 1, 1, 1, 1,
-0.6544397, -0.2618188, 0.09056719, 1, 1, 1, 1, 1,
-0.653033, -0.1783868, -2.079653, 1, 1, 1, 1, 1,
-0.6302409, 0.9022984, 0.09010489, 0, 0, 1, 1, 1,
-0.6290671, 1.878295, -1.466121, 1, 0, 0, 1, 1,
-0.6284785, 0.2286571, -1.856151, 1, 0, 0, 1, 1,
-0.6280494, -0.5363424, -3.177354, 1, 0, 0, 1, 1,
-0.6222602, 0.7904709, -1.653785, 1, 0, 0, 1, 1,
-0.6217114, 0.2655187, -1.150319, 1, 0, 0, 1, 1,
-0.618978, -0.2833109, -1.463697, 0, 0, 0, 1, 1,
-0.6147076, -0.3716013, -0.2386192, 0, 0, 0, 1, 1,
-0.6064015, 0.09315679, -0.9498054, 0, 0, 0, 1, 1,
-0.6038973, 1.005772, -2.051053, 0, 0, 0, 1, 1,
-0.6009287, 0.9002609, -0.3293156, 0, 0, 0, 1, 1,
-0.6008631, -0.3392454, -1.810691, 0, 0, 0, 1, 1,
-0.5987952, -0.3045314, -1.396045, 0, 0, 0, 1, 1,
-0.5974501, -1.468256, -2.899969, 1, 1, 1, 1, 1,
-0.5954218, -0.2037481, -2.714681, 1, 1, 1, 1, 1,
-0.5865818, -0.3894769, -2.388616, 1, 1, 1, 1, 1,
-0.5856138, 1.816077, -1.710822, 1, 1, 1, 1, 1,
-0.5854407, -0.005354349, 0.01051148, 1, 1, 1, 1, 1,
-0.5851285, -1.061904, -4.004356, 1, 1, 1, 1, 1,
-0.5815997, -0.003678212, -0.6099445, 1, 1, 1, 1, 1,
-0.5798317, 1.497543, 1.084616, 1, 1, 1, 1, 1,
-0.5675315, 1.016583, 1.351489, 1, 1, 1, 1, 1,
-0.5649921, 0.2855769, -0.08820018, 1, 1, 1, 1, 1,
-0.564912, 1.890227, 1.108965, 1, 1, 1, 1, 1,
-0.5631219, 0.4000632, 0.06995551, 1, 1, 1, 1, 1,
-0.5622751, 0.05366508, 0.2200147, 1, 1, 1, 1, 1,
-0.5617201, -3.425113, -2.027384, 1, 1, 1, 1, 1,
-0.5587509, 0.1621229, -1.967953, 1, 1, 1, 1, 1,
-0.5574142, 0.2995948, -1.739171, 0, 0, 1, 1, 1,
-0.5560189, -0.8915293, -3.078849, 1, 0, 0, 1, 1,
-0.5474299, 0.1668891, 0.5731509, 1, 0, 0, 1, 1,
-0.5413245, 0.2361103, -1.443796, 1, 0, 0, 1, 1,
-0.5408959, -0.6985114, -1.487865, 1, 0, 0, 1, 1,
-0.5342336, 1.833966, 0.03393011, 1, 0, 0, 1, 1,
-0.5314807, 0.01110868, -0.4495988, 0, 0, 0, 1, 1,
-0.5314201, 1.229556, -0.6760565, 0, 0, 0, 1, 1,
-0.5244479, 0.1890014, 0.2609083, 0, 0, 0, 1, 1,
-0.521127, -1.056293, -3.276247, 0, 0, 0, 1, 1,
-0.5210947, 0.07029074, -0.7694532, 0, 0, 0, 1, 1,
-0.5187742, 2.22226, -2.391749, 0, 0, 0, 1, 1,
-0.5177199, 0.1191752, -2.320501, 0, 0, 0, 1, 1,
-0.5158712, -0.6268513, -2.367323, 1, 1, 1, 1, 1,
-0.5120425, 1.019616, -2.808016, 1, 1, 1, 1, 1,
-0.5112001, 0.8323262, -0.8947237, 1, 1, 1, 1, 1,
-0.5090973, 1.706745, -0.6424983, 1, 1, 1, 1, 1,
-0.5087352, -0.3932234, -3.603351, 1, 1, 1, 1, 1,
-0.5080281, -1.084855, -0.8814763, 1, 1, 1, 1, 1,
-0.5024278, 0.6239191, -1.668775, 1, 1, 1, 1, 1,
-0.4985971, -0.8550748, -0.8543901, 1, 1, 1, 1, 1,
-0.4945962, 0.399185, -0.5582287, 1, 1, 1, 1, 1,
-0.4915015, -0.05717359, -0.5585302, 1, 1, 1, 1, 1,
-0.4914075, 0.04043569, -0.1790414, 1, 1, 1, 1, 1,
-0.4896418, 0.126044, -1.824696, 1, 1, 1, 1, 1,
-0.4859823, -1.350394, -3.608425, 1, 1, 1, 1, 1,
-0.484267, 0.4096821, -0.4938, 1, 1, 1, 1, 1,
-0.480518, 1.584208, -0.7328463, 1, 1, 1, 1, 1,
-0.4744024, 0.6235226, -2.785493, 0, 0, 1, 1, 1,
-0.4719756, -2.502701, -2.551114, 1, 0, 0, 1, 1,
-0.4715819, -0.9607024, -3.590789, 1, 0, 0, 1, 1,
-0.4712293, -0.9547846, -3.371855, 1, 0, 0, 1, 1,
-0.4690105, 0.8908398, -1.224049, 1, 0, 0, 1, 1,
-0.4688626, 0.9192458, -1.956943, 1, 0, 0, 1, 1,
-0.4671959, 0.1240626, -0.5131766, 0, 0, 0, 1, 1,
-0.4658136, 1.523588, -1.04853, 0, 0, 0, 1, 1,
-0.465038, 0.6403319, -1.591603, 0, 0, 0, 1, 1,
-0.4637988, 0.8757794, 0.6810864, 0, 0, 0, 1, 1,
-0.4586464, -0.005193526, -1.013824, 0, 0, 0, 1, 1,
-0.4569435, 0.7043099, 0.8949364, 0, 0, 0, 1, 1,
-0.4521419, 0.5179499, -1.023931, 0, 0, 0, 1, 1,
-0.4492867, 0.8639855, -0.4832963, 1, 1, 1, 1, 1,
-0.4458381, -1.368305, -2.871646, 1, 1, 1, 1, 1,
-0.4448301, 0.6116659, -0.2977523, 1, 1, 1, 1, 1,
-0.4400152, 0.7755847, -0.3694248, 1, 1, 1, 1, 1,
-0.4387742, 1.83691, 0.09919052, 1, 1, 1, 1, 1,
-0.438648, -1.241374, -4.181471, 1, 1, 1, 1, 1,
-0.4381815, 1.684711, -1.518284, 1, 1, 1, 1, 1,
-0.437846, -0.6657124, -3.448586, 1, 1, 1, 1, 1,
-0.4367808, -0.2389556, -2.774769, 1, 1, 1, 1, 1,
-0.436066, -2.013662, -3.782773, 1, 1, 1, 1, 1,
-0.433632, -0.6257086, -2.013021, 1, 1, 1, 1, 1,
-0.4325754, -2.180871, -1.024071, 1, 1, 1, 1, 1,
-0.432177, -0.3009478, -1.770416, 1, 1, 1, 1, 1,
-0.4319287, -0.09364324, -3.089577, 1, 1, 1, 1, 1,
-0.4279392, 0.3848762, -1.068655, 1, 1, 1, 1, 1,
-0.4264185, 0.002849882, 0.9322661, 0, 0, 1, 1, 1,
-0.4233478, -0.7764812, -1.749438, 1, 0, 0, 1, 1,
-0.4185249, 1.106368, -0.5187565, 1, 0, 0, 1, 1,
-0.4163326, 0.2611839, 0.4711003, 1, 0, 0, 1, 1,
-0.4056808, 0.04289162, -2.561302, 1, 0, 0, 1, 1,
-0.4026156, 0.4336846, -2.589484, 1, 0, 0, 1, 1,
-0.4016208, 1.458264, -2.279348, 0, 0, 0, 1, 1,
-0.3995858, 0.9084581, -2.222778, 0, 0, 0, 1, 1,
-0.3940178, -0.6210047, -2.490277, 0, 0, 0, 1, 1,
-0.3887531, 0.4765422, -0.2798034, 0, 0, 0, 1, 1,
-0.3876507, 1.057591, 0.6924319, 0, 0, 0, 1, 1,
-0.3851402, -1.104134, -3.186526, 0, 0, 0, 1, 1,
-0.3761885, -0.01697562, -2.67551, 0, 0, 0, 1, 1,
-0.373345, -1.297484, -2.82781, 1, 1, 1, 1, 1,
-0.3709935, 1.73032, 0.4767981, 1, 1, 1, 1, 1,
-0.3670697, -0.3310895, -3.027886, 1, 1, 1, 1, 1,
-0.3657784, 0.2091192, -0.3671219, 1, 1, 1, 1, 1,
-0.3631022, 0.4673063, -1.163206, 1, 1, 1, 1, 1,
-0.3630108, 0.555627, -1.045158, 1, 1, 1, 1, 1,
-0.3625307, -1.061268, -1.647113, 1, 1, 1, 1, 1,
-0.3623611, 0.3022257, -1.294303, 1, 1, 1, 1, 1,
-0.3622411, 0.02495763, -1.604566, 1, 1, 1, 1, 1,
-0.3589055, -0.4621181, -3.466188, 1, 1, 1, 1, 1,
-0.3548678, -0.3665535, -2.834723, 1, 1, 1, 1, 1,
-0.3526172, -1.383536, -3.667897, 1, 1, 1, 1, 1,
-0.3519928, 0.7620768, -0.07377253, 1, 1, 1, 1, 1,
-0.3506692, 1.961767, -0.3906335, 1, 1, 1, 1, 1,
-0.342288, 0.7219849, -1.421953, 1, 1, 1, 1, 1,
-0.3422607, 0.05369725, -1.552332, 0, 0, 1, 1, 1,
-0.3410637, 0.7672355, -1.44558, 1, 0, 0, 1, 1,
-0.3376715, 0.8592786, 0.4839994, 1, 0, 0, 1, 1,
-0.3363056, -1.093971, -3.037828, 1, 0, 0, 1, 1,
-0.3343631, -0.72555, -3.389446, 1, 0, 0, 1, 1,
-0.3256234, 0.2516335, -1.538016, 1, 0, 0, 1, 1,
-0.3255825, -0.8004921, -2.381954, 0, 0, 0, 1, 1,
-0.3237609, -0.6962835, -2.043749, 0, 0, 0, 1, 1,
-0.3222083, -0.1606322, -1.507433, 0, 0, 0, 1, 1,
-0.3194395, 1.78097, 0.4956837, 0, 0, 0, 1, 1,
-0.3153946, 0.5405712, -1.734122, 0, 0, 0, 1, 1,
-0.3149714, 0.6720679, -3.119684, 0, 0, 0, 1, 1,
-0.313733, -1.29936, -3.79439, 0, 0, 0, 1, 1,
-0.3113253, -1.003249, -3.091145, 1, 1, 1, 1, 1,
-0.3103315, 0.4878553, -0.3456376, 1, 1, 1, 1, 1,
-0.3100581, 0.4965158, 0.9665542, 1, 1, 1, 1, 1,
-0.3085789, -0.3730927, -3.044523, 1, 1, 1, 1, 1,
-0.3068321, -0.9448145, -3.767355, 1, 1, 1, 1, 1,
-0.3066799, -0.1877674, -1.823465, 1, 1, 1, 1, 1,
-0.3054209, 0.1960028, -0.1047451, 1, 1, 1, 1, 1,
-0.3042912, 0.3762477, 0.3083235, 1, 1, 1, 1, 1,
-0.3020418, 0.1913619, -2.436824, 1, 1, 1, 1, 1,
-0.2976516, -0.3251202, -2.332125, 1, 1, 1, 1, 1,
-0.2934912, -0.0401007, -2.634592, 1, 1, 1, 1, 1,
-0.2916676, 1.840367, -0.5819975, 1, 1, 1, 1, 1,
-0.2910515, 0.05104933, -1.868601, 1, 1, 1, 1, 1,
-0.2898938, -0.7708492, -1.649297, 1, 1, 1, 1, 1,
-0.2869225, 1.414598, -0.5604404, 1, 1, 1, 1, 1,
-0.283661, -0.9140182, -2.745858, 0, 0, 1, 1, 1,
-0.2805963, -1.006729, -1.623516, 1, 0, 0, 1, 1,
-0.2790292, -0.91888, -2.894236, 1, 0, 0, 1, 1,
-0.2762851, 0.63265, 0.03563962, 1, 0, 0, 1, 1,
-0.268232, -0.8697518, -2.81773, 1, 0, 0, 1, 1,
-0.2678117, 0.03134855, -2.843544, 1, 0, 0, 1, 1,
-0.2658608, -1.825547, -3.450627, 0, 0, 0, 1, 1,
-0.2609549, 0.6089849, -0.3557884, 0, 0, 0, 1, 1,
-0.2606322, 0.3675299, -0.4640912, 0, 0, 0, 1, 1,
-0.2598806, -0.7818456, -4.703113, 0, 0, 0, 1, 1,
-0.2532545, 1.592493, 0.2286311, 0, 0, 0, 1, 1,
-0.253115, 0.1774209, 1.178375, 0, 0, 0, 1, 1,
-0.2506276, -0.9300724, -3.096135, 0, 0, 0, 1, 1,
-0.2484046, -0.06214733, -0.7075927, 1, 1, 1, 1, 1,
-0.2473252, -1.456369, -3.496421, 1, 1, 1, 1, 1,
-0.2468315, -1.415686, -1.580209, 1, 1, 1, 1, 1,
-0.2438747, -1.083611, -3.994001, 1, 1, 1, 1, 1,
-0.2416445, 1.614632, 0.4161919, 1, 1, 1, 1, 1,
-0.2393422, -0.8805676, -3.466569, 1, 1, 1, 1, 1,
-0.2337685, 1.099265, 0.391825, 1, 1, 1, 1, 1,
-0.2335459, -0.6882358, -3.846201, 1, 1, 1, 1, 1,
-0.2316805, -0.3499238, -2.806633, 1, 1, 1, 1, 1,
-0.2282554, -0.6194938, -2.493348, 1, 1, 1, 1, 1,
-0.2256485, 0.5160202, -1.934293, 1, 1, 1, 1, 1,
-0.2241079, 1.368578, 0.06262218, 1, 1, 1, 1, 1,
-0.2119017, 0.5304558, -0.6133136, 1, 1, 1, 1, 1,
-0.211473, 0.9067985, 1.32452, 1, 1, 1, 1, 1,
-0.2101155, -0.3779482, -1.08865, 1, 1, 1, 1, 1,
-0.2099683, -1.39201, -3.025551, 0, 0, 1, 1, 1,
-0.204806, -0.4896045, -1.397372, 1, 0, 0, 1, 1,
-0.2021573, -1.452804, -3.858723, 1, 0, 0, 1, 1,
-0.1986958, -0.4097095, -2.268113, 1, 0, 0, 1, 1,
-0.1928666, -0.2994366, -1.847533, 1, 0, 0, 1, 1,
-0.1896469, 0.3845739, -0.8478111, 1, 0, 0, 1, 1,
-0.184188, 1.357421, 1.284798, 0, 0, 0, 1, 1,
-0.1841381, 1.295803, 1.906845, 0, 0, 0, 1, 1,
-0.1808096, 0.7494256, -0.5099427, 0, 0, 0, 1, 1,
-0.1784005, -0.8009786, -0.7722028, 0, 0, 0, 1, 1,
-0.1763694, -0.8262047, -3.130634, 0, 0, 0, 1, 1,
-0.1731504, 0.768353, -1.755562, 0, 0, 0, 1, 1,
-0.1677728, -0.8501483, -2.539818, 0, 0, 0, 1, 1,
-0.1670362, 0.6364924, -1.218753, 1, 1, 1, 1, 1,
-0.1659727, -0.8298979, -3.203209, 1, 1, 1, 1, 1,
-0.1638236, -1.888609, -2.748947, 1, 1, 1, 1, 1,
-0.1628913, -0.5207287, -3.957712, 1, 1, 1, 1, 1,
-0.1607109, 0.2780173, -0.5176597, 1, 1, 1, 1, 1,
-0.158394, -0.583818, -4.231516, 1, 1, 1, 1, 1,
-0.1558615, 0.2867191, -0.9969173, 1, 1, 1, 1, 1,
-0.1549037, -0.0004172768, -2.657579, 1, 1, 1, 1, 1,
-0.1517657, 0.4301266, 0.5288278, 1, 1, 1, 1, 1,
-0.1475443, -0.5935408, -1.255908, 1, 1, 1, 1, 1,
-0.143996, 1.607462, -0.5229272, 1, 1, 1, 1, 1,
-0.1393718, -1.072899, -2.284793, 1, 1, 1, 1, 1,
-0.1378238, -0.1632766, -2.065684, 1, 1, 1, 1, 1,
-0.1372332, 0.3101527, -2.010188, 1, 1, 1, 1, 1,
-0.1369873, 0.8781745, -0.9591706, 1, 1, 1, 1, 1,
-0.1345853, 1.176534, 0.9801497, 0, 0, 1, 1, 1,
-0.1312345, -1.203164, -3.135465, 1, 0, 0, 1, 1,
-0.1278936, 0.6457686, -0.1498761, 1, 0, 0, 1, 1,
-0.1276477, 0.6274468, -1.11693, 1, 0, 0, 1, 1,
-0.1262114, 1.085206, 0.8153954, 1, 0, 0, 1, 1,
-0.1242649, -1.839719, -2.864035, 1, 0, 0, 1, 1,
-0.1217898, 1.649715, -0.3857953, 0, 0, 0, 1, 1,
-0.1185465, -1.240675, -3.425779, 0, 0, 0, 1, 1,
-0.11641, 0.09837873, -1.427136, 0, 0, 0, 1, 1,
-0.1139628, 0.2404246, 0.3142231, 0, 0, 0, 1, 1,
-0.1109394, 0.3037081, -0.5913648, 0, 0, 0, 1, 1,
-0.1107841, -0.8166744, -3.573123, 0, 0, 0, 1, 1,
-0.1065888, 0.9159477, -0.6990532, 0, 0, 0, 1, 1,
-0.1017389, 0.2722487, -1.062777, 1, 1, 1, 1, 1,
-0.1005451, -0.7610696, -4.367169, 1, 1, 1, 1, 1,
-0.09925567, 1.273358, -1.661836, 1, 1, 1, 1, 1,
-0.09855308, 0.8595834, -1.609819, 1, 1, 1, 1, 1,
-0.09786632, -1.681718, -2.426336, 1, 1, 1, 1, 1,
-0.09503767, -0.1182926, -4.216989, 1, 1, 1, 1, 1,
-0.09281977, -0.6217147, -2.168171, 1, 1, 1, 1, 1,
-0.09169662, 1.51148, 0.3201172, 1, 1, 1, 1, 1,
-0.09000373, -0.5539162, -4.125411, 1, 1, 1, 1, 1,
-0.0867167, -0.3867544, -4.648034, 1, 1, 1, 1, 1,
-0.08115233, 0.5760227, 0.2961223, 1, 1, 1, 1, 1,
-0.07816869, -2.42969, -2.780473, 1, 1, 1, 1, 1,
-0.07770175, -1.172584, -2.479502, 1, 1, 1, 1, 1,
-0.07752665, 0.2904013, -0.7401736, 1, 1, 1, 1, 1,
-0.076855, -0.6107622, -2.610891, 1, 1, 1, 1, 1,
-0.07538956, 0.2231464, 1.118606, 0, 0, 1, 1, 1,
-0.07141297, 0.9004149, 1.01499, 1, 0, 0, 1, 1,
-0.07132726, 0.8813146, 1.674777, 1, 0, 0, 1, 1,
-0.06919082, 1.142293, -1.356724, 1, 0, 0, 1, 1,
-0.06697705, 1.94202, -1.256237, 1, 0, 0, 1, 1,
-0.06593367, -2.829858, -3.962724, 1, 0, 0, 1, 1,
-0.06322671, 0.2978343, 0.7727729, 0, 0, 0, 1, 1,
-0.06086241, -1.525968, -2.313183, 0, 0, 0, 1, 1,
-0.05985355, 0.5116516, -1.739044, 0, 0, 0, 1, 1,
-0.05980813, 2.167938, -1.748275, 0, 0, 0, 1, 1,
-0.05929037, 0.2523427, 0.7386782, 0, 0, 0, 1, 1,
-0.05723083, -0.6112054, -3.347486, 0, 0, 0, 1, 1,
-0.05585225, -1.002021, -1.331736, 0, 0, 0, 1, 1,
-0.05540524, 0.1396145, -1.566025, 1, 1, 1, 1, 1,
-0.0532532, 0.7971634, 1.81651, 1, 1, 1, 1, 1,
-0.05197322, 1.002108, 0.05540544, 1, 1, 1, 1, 1,
-0.04633245, -0.4258668, -4.240287, 1, 1, 1, 1, 1,
-0.04290601, -0.4293863, -3.382558, 1, 1, 1, 1, 1,
-0.03807573, 1.427615, -1.003023, 1, 1, 1, 1, 1,
-0.03600318, 0.7760609, -1.482995, 1, 1, 1, 1, 1,
-0.03356735, 0.7685082, 1.374136, 1, 1, 1, 1, 1,
-0.03291757, 0.1051895, -1.155505, 1, 1, 1, 1, 1,
-0.02965382, -0.5064859, -1.728766, 1, 1, 1, 1, 1,
-0.0292856, -1.49515, -1.946679, 1, 1, 1, 1, 1,
-0.02915359, -0.8211052, -4.048199, 1, 1, 1, 1, 1,
-0.02897981, -0.6499039, -3.686797, 1, 1, 1, 1, 1,
-0.02762217, -0.9638488, -3.405962, 1, 1, 1, 1, 1,
-0.02689462, 1.035804, -1.911108, 1, 1, 1, 1, 1,
-0.02034408, 1.773727, -0.04667364, 0, 0, 1, 1, 1,
-0.01480881, -0.6209342, -3.201981, 1, 0, 0, 1, 1,
-0.01425022, 0.4439451, 0.5759677, 1, 0, 0, 1, 1,
-0.008151051, 0.4131912, 0.450912, 1, 0, 0, 1, 1,
-0.007226669, 0.05157877, -0.8314803, 1, 0, 0, 1, 1,
-0.006177382, 1.853681, 0.7770337, 1, 0, 0, 1, 1,
-0.003398956, -1.56922, -1.558278, 0, 0, 0, 1, 1,
-0.001368087, 0.1429338, 0.9664212, 0, 0, 0, 1, 1,
2.886743e-05, -0.6385081, 3.502146, 0, 0, 0, 1, 1,
0.0005724613, -0.5411506, 4.616224, 0, 0, 0, 1, 1,
0.004951656, 0.4965664, -0.7908621, 0, 0, 0, 1, 1,
0.01509528, 1.234159, -0.445481, 0, 0, 0, 1, 1,
0.01887985, -0.2048317, 4.264208, 0, 0, 0, 1, 1,
0.01960775, -0.432716, 2.764095, 1, 1, 1, 1, 1,
0.02221551, 0.3117517, -0.3531637, 1, 1, 1, 1, 1,
0.02559411, 1.634009, 0.03003564, 1, 1, 1, 1, 1,
0.02563689, 1.198363, 0.2677827, 1, 1, 1, 1, 1,
0.02659461, 0.8339134, -1.714182, 1, 1, 1, 1, 1,
0.02822621, 2.033184, 0.3796531, 1, 1, 1, 1, 1,
0.02824335, 0.3974822, -1.388449, 1, 1, 1, 1, 1,
0.0284999, -0.8611814, 2.94818, 1, 1, 1, 1, 1,
0.03589499, 0.1264116, 0.6406317, 1, 1, 1, 1, 1,
0.03676602, 0.7335145, 0.8979073, 1, 1, 1, 1, 1,
0.04231608, 0.9289313, 0.7189533, 1, 1, 1, 1, 1,
0.04365112, 1.699721, 1.009859, 1, 1, 1, 1, 1,
0.04424305, -0.2613763, 2.813268, 1, 1, 1, 1, 1,
0.04772483, 1.639314, -1.458161, 1, 1, 1, 1, 1,
0.04781987, -0.02340023, 2.095024, 1, 1, 1, 1, 1,
0.04908106, 0.04886045, -0.3597507, 0, 0, 1, 1, 1,
0.04981609, -0.5695914, 3.304513, 1, 0, 0, 1, 1,
0.0523299, 0.9286101, 0.08605148, 1, 0, 0, 1, 1,
0.05341612, -0.01140062, 2.483723, 1, 0, 0, 1, 1,
0.05743239, 0.3592965, 0.7034058, 1, 0, 0, 1, 1,
0.05873467, 0.6577946, 0.6992909, 1, 0, 0, 1, 1,
0.06677829, 0.09237992, -0.1831757, 0, 0, 0, 1, 1,
0.06773957, -0.5255869, 2.365614, 0, 0, 0, 1, 1,
0.07401833, -0.1771944, 3.738898, 0, 0, 0, 1, 1,
0.07484352, 0.4360085, 0.354814, 0, 0, 0, 1, 1,
0.07650461, -2.59954, 3.754361, 0, 0, 0, 1, 1,
0.07784379, 1.633156, -0.595204, 0, 0, 0, 1, 1,
0.08123632, -0.4255233, 1.495343, 0, 0, 0, 1, 1,
0.0835687, 1.625165, 0.8870323, 1, 1, 1, 1, 1,
0.09005412, 0.5992466, 0.03689752, 1, 1, 1, 1, 1,
0.09234999, 0.493546, 1.806456, 1, 1, 1, 1, 1,
0.09248729, 0.287399, 0.9903075, 1, 1, 1, 1, 1,
0.09294638, 0.7862632, -1.250892, 1, 1, 1, 1, 1,
0.09311582, 0.4756047, 0.5563074, 1, 1, 1, 1, 1,
0.100735, -0.006855899, 0.5754899, 1, 1, 1, 1, 1,
0.1008925, -0.2395075, 0.2042851, 1, 1, 1, 1, 1,
0.1051233, 0.03117622, 1.934203, 1, 1, 1, 1, 1,
0.1058102, -0.6865733, 3.872682, 1, 1, 1, 1, 1,
0.1090604, 0.8164359, -0.6673464, 1, 1, 1, 1, 1,
0.1119593, -0.6566555, 4.996556, 1, 1, 1, 1, 1,
0.1160094, 0.40906, 1.323703, 1, 1, 1, 1, 1,
0.1164882, -2.032784, 2.950172, 1, 1, 1, 1, 1,
0.1201873, 1.607745, -0.6935664, 1, 1, 1, 1, 1,
0.1217363, -0.5528949, 2.698083, 0, 0, 1, 1, 1,
0.1232631, 0.5793995, -0.637529, 1, 0, 0, 1, 1,
0.1263981, 0.8386469, 0.06082942, 1, 0, 0, 1, 1,
0.130319, -2.607753, 1.576371, 1, 0, 0, 1, 1,
0.1307026, -1.474239, 4.290881, 1, 0, 0, 1, 1,
0.1336312, -0.7092315, 4.576131, 1, 0, 0, 1, 1,
0.1354327, 1.126798, -0.2740395, 0, 0, 0, 1, 1,
0.1363917, 0.2429223, 1.993614, 0, 0, 0, 1, 1,
0.1438084, -0.6154039, 3.732457, 0, 0, 0, 1, 1,
0.1530219, 1.530772, 1.463771, 0, 0, 0, 1, 1,
0.1530234, 0.3723933, 1.26194, 0, 0, 0, 1, 1,
0.1545881, 1.894928, 1.648815, 0, 0, 0, 1, 1,
0.1561904, 0.7192836, 0.9220478, 0, 0, 0, 1, 1,
0.1611982, -1.455194, 2.243514, 1, 1, 1, 1, 1,
0.1691133, 1.154338, 0.3249415, 1, 1, 1, 1, 1,
0.177069, 0.4061729, -0.1023418, 1, 1, 1, 1, 1,
0.1822555, 0.3737975, 0.7925695, 1, 1, 1, 1, 1,
0.1835305, -0.4018891, 2.515355, 1, 1, 1, 1, 1,
0.183626, -0.1395725, 2.219836, 1, 1, 1, 1, 1,
0.1838162, -0.2116093, 3.37609, 1, 1, 1, 1, 1,
0.1841467, -0.2545267, 1.969553, 1, 1, 1, 1, 1,
0.1849728, 1.061744, 1.395712, 1, 1, 1, 1, 1,
0.1852249, -1.001393, 1.732574, 1, 1, 1, 1, 1,
0.1858647, -0.7552091, 3.114332, 1, 1, 1, 1, 1,
0.1866355, 0.3394494, -1.200137, 1, 1, 1, 1, 1,
0.1903488, -2.149956, 4.256929, 1, 1, 1, 1, 1,
0.1915333, 0.381078, -0.7557881, 1, 1, 1, 1, 1,
0.1970464, -0.2727909, 3.545604, 1, 1, 1, 1, 1,
0.2031336, -0.5099507, 4.355679, 0, 0, 1, 1, 1,
0.2057423, -1.108983, 2.216702, 1, 0, 0, 1, 1,
0.2059177, 1.286491, -1.221815, 1, 0, 0, 1, 1,
0.2071546, 0.070664, 1.153008, 1, 0, 0, 1, 1,
0.2091523, -0.08332194, 1.531851, 1, 0, 0, 1, 1,
0.2122778, 0.3012155, -2.735132, 1, 0, 0, 1, 1,
0.2182219, 1.393697, 1.47856, 0, 0, 0, 1, 1,
0.221945, 0.13641, 0.01154484, 0, 0, 0, 1, 1,
0.2257177, 0.3621675, 1.722071, 0, 0, 0, 1, 1,
0.2267245, 0.5429665, -0.01431408, 0, 0, 0, 1, 1,
0.2269036, -0.2042624, 3.707906, 0, 0, 0, 1, 1,
0.2315156, -0.1402692, 1.530627, 0, 0, 0, 1, 1,
0.2315397, 1.10812, 0.09612314, 0, 0, 0, 1, 1,
0.2329565, 2.280524, 0.5989401, 1, 1, 1, 1, 1,
0.233134, -0.1444702, 3.004834, 1, 1, 1, 1, 1,
0.2345418, -0.5954453, 3.607205, 1, 1, 1, 1, 1,
0.2358414, -0.5715955, 3.457763, 1, 1, 1, 1, 1,
0.2378483, 0.1560021, -0.6730522, 1, 1, 1, 1, 1,
0.2407163, 1.361331, -0.9576101, 1, 1, 1, 1, 1,
0.2459418, -0.8384155, 1.904185, 1, 1, 1, 1, 1,
0.2468092, -0.4266399, 1.993149, 1, 1, 1, 1, 1,
0.2475204, 0.03917607, 2.03648, 1, 1, 1, 1, 1,
0.2479286, 0.1395623, 1.676512, 1, 1, 1, 1, 1,
0.2486996, -0.7244222, 3.982854, 1, 1, 1, 1, 1,
0.2520054, 0.8376863, 0.9807847, 1, 1, 1, 1, 1,
0.2549557, -0.3308401, 3.298652, 1, 1, 1, 1, 1,
0.2593202, 0.4751609, 1.159127, 1, 1, 1, 1, 1,
0.2637576, -0.3911375, 3.088923, 1, 1, 1, 1, 1,
0.2680978, 1.60296, -0.5564787, 0, 0, 1, 1, 1,
0.2693509, 0.6642317, 0.9157348, 1, 0, 0, 1, 1,
0.2712867, 0.516676, 0.6763818, 1, 0, 0, 1, 1,
0.2763251, -1.839234, 2.856291, 1, 0, 0, 1, 1,
0.2788168, 1.396358, 1.443854, 1, 0, 0, 1, 1,
0.2821439, 0.8703437, 0.5355614, 1, 0, 0, 1, 1,
0.2905299, -1.784601, 2.123194, 0, 0, 0, 1, 1,
0.2930004, -0.5139802, 2.415223, 0, 0, 0, 1, 1,
0.3047731, 0.297426, 0.2663133, 0, 0, 0, 1, 1,
0.3050002, 0.4626648, 1.373488, 0, 0, 0, 1, 1,
0.3088909, 1.273434, 1.759385, 0, 0, 0, 1, 1,
0.3110485, 1.31268, 0.72934, 0, 0, 0, 1, 1,
0.3189705, -0.522674, 4.71609, 0, 0, 0, 1, 1,
0.3195606, 1.184201, 0.3192181, 1, 1, 1, 1, 1,
0.324794, 0.4818068, 0.8768707, 1, 1, 1, 1, 1,
0.3292669, 0.7327145, -0.08968913, 1, 1, 1, 1, 1,
0.3332816, -1.019585, 3.054389, 1, 1, 1, 1, 1,
0.3362233, 0.3928233, -0.05371698, 1, 1, 1, 1, 1,
0.3367854, 0.9530215, 2.155163, 1, 1, 1, 1, 1,
0.3412807, 1.076417, -0.5496628, 1, 1, 1, 1, 1,
0.3452796, 0.168656, 0.1023683, 1, 1, 1, 1, 1,
0.3467655, 0.9300551, 0.2846296, 1, 1, 1, 1, 1,
0.3475908, 0.09990514, 1.353968, 1, 1, 1, 1, 1,
0.3517638, 0.4154812, 0.4798496, 1, 1, 1, 1, 1,
0.3629005, 0.2776235, 0.1351825, 1, 1, 1, 1, 1,
0.3645382, 0.6756259, -0.8466352, 1, 1, 1, 1, 1,
0.3686351, -0.2841802, 2.641417, 1, 1, 1, 1, 1,
0.3691061, -1.414867, 3.791293, 1, 1, 1, 1, 1,
0.3702007, -0.9296144, 1.092303, 0, 0, 1, 1, 1,
0.3721421, 1.825747, 0.03681704, 1, 0, 0, 1, 1,
0.3729809, 1.742815, -0.4944726, 1, 0, 0, 1, 1,
0.3759905, 0.5775275, 1.560508, 1, 0, 0, 1, 1,
0.3779567, -1.783588, 2.852779, 1, 0, 0, 1, 1,
0.3781267, 0.03018983, 1.284811, 1, 0, 0, 1, 1,
0.384546, -1.785135, 4.222213, 0, 0, 0, 1, 1,
0.3873407, -0.0860014, 3.161152, 0, 0, 0, 1, 1,
0.3892041, 0.2196819, 0.738037, 0, 0, 0, 1, 1,
0.3907878, 1.136668, -1.490528, 0, 0, 0, 1, 1,
0.392018, -0.1340206, 1.545602, 0, 0, 0, 1, 1,
0.3934646, 0.6980019, 0.5559649, 0, 0, 0, 1, 1,
0.3951958, -1.473453, 3.325469, 0, 0, 0, 1, 1,
0.4026687, 1.063592, -0.9081639, 1, 1, 1, 1, 1,
0.405004, -0.8162845, 2.085369, 1, 1, 1, 1, 1,
0.4084335, -0.7128487, 1.214332, 1, 1, 1, 1, 1,
0.408692, -0.1056686, 1.237633, 1, 1, 1, 1, 1,
0.4115205, 0.7136484, 0.5055654, 1, 1, 1, 1, 1,
0.415787, -1.869432, 2.830883, 1, 1, 1, 1, 1,
0.4160384, 2.015878, 1.236166, 1, 1, 1, 1, 1,
0.4175251, 0.5355667, 2.277005, 1, 1, 1, 1, 1,
0.4191821, 0.6585908, 1.12682, 1, 1, 1, 1, 1,
0.419851, -0.0121092, 1.53335, 1, 1, 1, 1, 1,
0.422046, -0.381761, 2.273819, 1, 1, 1, 1, 1,
0.4228925, -0.4583998, 1.775263, 1, 1, 1, 1, 1,
0.4229187, 0.6051061, 1.408503, 1, 1, 1, 1, 1,
0.4248969, 0.9202836, -0.2108233, 1, 1, 1, 1, 1,
0.426337, 0.157127, 1.735447, 1, 1, 1, 1, 1,
0.4278231, 0.8793533, -0.2645965, 0, 0, 1, 1, 1,
0.4338741, 0.5028028, -0.06375475, 1, 0, 0, 1, 1,
0.4353059, -1.954916, 2.55915, 1, 0, 0, 1, 1,
0.4360578, -0.4582546, 2.395486, 1, 0, 0, 1, 1,
0.441029, 0.2457689, 0.5421429, 1, 0, 0, 1, 1,
0.455669, 0.6256016, 0.4935633, 1, 0, 0, 1, 1,
0.4580837, -1.178405, 2.419829, 0, 0, 0, 1, 1,
0.4609942, -1.176022, 3.357742, 0, 0, 0, 1, 1,
0.4657598, -0.7795138, 2.155166, 0, 0, 0, 1, 1,
0.4671901, 0.1605819, 2.451041, 0, 0, 0, 1, 1,
0.470516, -0.4091023, 1.556415, 0, 0, 0, 1, 1,
0.4717844, -0.6171775, 2.34834, 0, 0, 0, 1, 1,
0.4756416, -0.5224262, 2.154997, 0, 0, 0, 1, 1,
0.4822781, 0.9135255, 1.754354, 1, 1, 1, 1, 1,
0.4838194, 0.5113078, 1.130864, 1, 1, 1, 1, 1,
0.4925898, 1.581051, 0.4333155, 1, 1, 1, 1, 1,
0.4945916, -0.1224239, 1.442713, 1, 1, 1, 1, 1,
0.4949, -0.4446145, 2.318219, 1, 1, 1, 1, 1,
0.4968329, 0.9492022, -0.3883364, 1, 1, 1, 1, 1,
0.4971085, 1.456784, 0.6749529, 1, 1, 1, 1, 1,
0.5063878, 0.2451502, 3.749525, 1, 1, 1, 1, 1,
0.5092388, -0.736649, 1.603719, 1, 1, 1, 1, 1,
0.5119073, -2.341387, 3.034904, 1, 1, 1, 1, 1,
0.5127047, -0.0689263, 2.539105, 1, 1, 1, 1, 1,
0.5165037, 0.3431537, -0.8092694, 1, 1, 1, 1, 1,
0.5165764, -0.4389676, 2.170939, 1, 1, 1, 1, 1,
0.5208424, 0.1057561, 1.885, 1, 1, 1, 1, 1,
0.5217481, 1.373579, -0.6375095, 1, 1, 1, 1, 1,
0.5261845, -0.7409533, 3.683396, 0, 0, 1, 1, 1,
0.5285755, -0.4316179, 1.827497, 1, 0, 0, 1, 1,
0.532047, 0.216602, -0.03526728, 1, 0, 0, 1, 1,
0.5362883, -0.7221965, 2.441693, 1, 0, 0, 1, 1,
0.536976, 1.453611, 0.3580168, 1, 0, 0, 1, 1,
0.5370414, 1.394981, 0.1084292, 1, 0, 0, 1, 1,
0.5380562, -1.230224, 2.859044, 0, 0, 0, 1, 1,
0.5395234, 2.332365, 1.001935, 0, 0, 0, 1, 1,
0.545138, 0.6326922, 1.854814, 0, 0, 0, 1, 1,
0.5466071, 0.8583123, -1.581783, 0, 0, 0, 1, 1,
0.5467055, 0.1402231, 2.415319, 0, 0, 0, 1, 1,
0.5478463, -0.2295543, 2.268218, 0, 0, 0, 1, 1,
0.5508709, 0.8788653, 1.499093, 0, 0, 0, 1, 1,
0.554615, 2.146205, 0.2027852, 1, 1, 1, 1, 1,
0.5554161, 0.6745776, 1.110623, 1, 1, 1, 1, 1,
0.5568829, -0.2653131, 2.421556, 1, 1, 1, 1, 1,
0.5571483, -0.7928857, 3.141738, 1, 1, 1, 1, 1,
0.5614341, 0.1469111, 2.557921, 1, 1, 1, 1, 1,
0.5651268, 0.6364142, 1.549489, 1, 1, 1, 1, 1,
0.5670984, -2.139966, 2.727342, 1, 1, 1, 1, 1,
0.5735602, -1.771713, 3.332121, 1, 1, 1, 1, 1,
0.5742297, -0.1435159, 1.123732, 1, 1, 1, 1, 1,
0.576371, -0.3943122, 1.36804, 1, 1, 1, 1, 1,
0.5766167, -1.253858, 2.704661, 1, 1, 1, 1, 1,
0.5798421, -0.7385022, 3.619654, 1, 1, 1, 1, 1,
0.5821736, 2.749563, 2.107383, 1, 1, 1, 1, 1,
0.5822548, 1.341686, 1.057894, 1, 1, 1, 1, 1,
0.5887876, 0.1138775, 0.1440488, 1, 1, 1, 1, 1,
0.5897101, -0.1332971, 1.879024, 0, 0, 1, 1, 1,
0.5956823, 0.05998661, -0.7495126, 1, 0, 0, 1, 1,
0.596689, 1.780544, -0.744684, 1, 0, 0, 1, 1,
0.60343, -0.07093158, 1.536581, 1, 0, 0, 1, 1,
0.603447, 0.6578064, 0.731938, 1, 0, 0, 1, 1,
0.6051859, -0.6226138, 3.545911, 1, 0, 0, 1, 1,
0.6071773, 2.128836, -1.097507, 0, 0, 0, 1, 1,
0.6073697, 0.2049785, -0.7314382, 0, 0, 0, 1, 1,
0.6100424, 0.03095176, 1.917022, 0, 0, 0, 1, 1,
0.6128703, -1.357292, 2.257556, 0, 0, 0, 1, 1,
0.6276307, 0.323857, 0.5319847, 0, 0, 0, 1, 1,
0.6402208, -2.465129, 1.970617, 0, 0, 0, 1, 1,
0.6449584, 0.997326, 0.9656591, 0, 0, 0, 1, 1,
0.6459808, -1.221866, 3.30812, 1, 1, 1, 1, 1,
0.6521821, 0.8313762, 1.412017, 1, 1, 1, 1, 1,
0.6542255, 0.2034189, 2.277237, 1, 1, 1, 1, 1,
0.6561618, -0.1289324, 2.382715, 1, 1, 1, 1, 1,
0.6571662, -0.169948, 0.7168283, 1, 1, 1, 1, 1,
0.6606161, 1.020882, -0.6188153, 1, 1, 1, 1, 1,
0.6643141, -0.8790113, 1.869408, 1, 1, 1, 1, 1,
0.6693224, -0.177278, 1.87716, 1, 1, 1, 1, 1,
0.6710336, -0.02065436, 2.391975, 1, 1, 1, 1, 1,
0.6765683, -3.010456, 2.798635, 1, 1, 1, 1, 1,
0.677556, 0.4993654, 1.362693, 1, 1, 1, 1, 1,
0.6806483, -1.08149, 4.71244, 1, 1, 1, 1, 1,
0.6934165, -0.877234, 1.410767, 1, 1, 1, 1, 1,
0.6978157, -1.502273, 2.240264, 1, 1, 1, 1, 1,
0.700619, 0.505896, -0.04529882, 1, 1, 1, 1, 1,
0.7055389, -0.2501854, 1.581253, 0, 0, 1, 1, 1,
0.708378, -0.7737044, 1.644922, 1, 0, 0, 1, 1,
0.7090137, -0.8496736, 2.996083, 1, 0, 0, 1, 1,
0.7112547, -0.325151, 2.204637, 1, 0, 0, 1, 1,
0.717079, -0.68454, 2.371365, 1, 0, 0, 1, 1,
0.717116, -0.3824689, 2.48063, 1, 0, 0, 1, 1,
0.722469, 0.3504247, -0.6966946, 0, 0, 0, 1, 1,
0.7228681, 1.445973, 0.8840635, 0, 0, 0, 1, 1,
0.7237822, 0.08930926, 2.185429, 0, 0, 0, 1, 1,
0.7268308, 1.5968, 0.7671246, 0, 0, 0, 1, 1,
0.7307742, 1.107309, 0.3583658, 0, 0, 0, 1, 1,
0.7309987, 0.03463865, 2.205269, 0, 0, 0, 1, 1,
0.7372901, 0.7287368, -0.0407415, 0, 0, 0, 1, 1,
0.738683, 0.4531249, 0.006065263, 1, 1, 1, 1, 1,
0.7417722, 1.391114, -1.005256, 1, 1, 1, 1, 1,
0.7449656, -1.586513, 2.649304, 1, 1, 1, 1, 1,
0.7466129, -2.016234, 2.949028, 1, 1, 1, 1, 1,
0.7520724, 0.2939968, 1.007859, 1, 1, 1, 1, 1,
0.7541704, -0.831639, 1.584628, 1, 1, 1, 1, 1,
0.7548114, -0.6991482, 1.452293, 1, 1, 1, 1, 1,
0.7580168, 0.9918566, 0.516699, 1, 1, 1, 1, 1,
0.7588782, -0.8110833, 1.232933, 1, 1, 1, 1, 1,
0.7656015, -0.5663148, 1.424891, 1, 1, 1, 1, 1,
0.7656683, -0.913509, 1.57178, 1, 1, 1, 1, 1,
0.7722525, -1.220314, 2.775539, 1, 1, 1, 1, 1,
0.7725349, -0.7226358, 1.542811, 1, 1, 1, 1, 1,
0.7758427, -1.093028, 0.2419133, 1, 1, 1, 1, 1,
0.778412, 0.8695023, 0.387699, 1, 1, 1, 1, 1,
0.7823744, 0.2731033, 1.757313, 0, 0, 1, 1, 1,
0.7849684, 1.181581, 0.3973569, 1, 0, 0, 1, 1,
0.7852125, -0.7666869, 4.208787, 1, 0, 0, 1, 1,
0.7886237, 0.08385461, 1.843768, 1, 0, 0, 1, 1,
0.7960879, 0.5233362, 2.99954, 1, 0, 0, 1, 1,
0.7998292, 0.8454406, 0.2698687, 1, 0, 0, 1, 1,
0.804261, -0.4058772, -0.7079558, 0, 0, 0, 1, 1,
0.8073146, 0.5998743, 0.3417246, 0, 0, 0, 1, 1,
0.8154901, 0.4141782, 1.414876, 0, 0, 0, 1, 1,
0.8200797, 0.6816282, 0.8163515, 0, 0, 0, 1, 1,
0.8218912, 1.929486, 0.05837129, 0, 0, 0, 1, 1,
0.8240783, 0.4790726, 1.191259, 0, 0, 0, 1, 1,
0.8318406, 2.150985, 1.537708, 0, 0, 0, 1, 1,
0.8322006, -1.916726, 2.839144, 1, 1, 1, 1, 1,
0.8373145, 1.158187, 0.7622128, 1, 1, 1, 1, 1,
0.8402876, -0.04988254, 2.952754, 1, 1, 1, 1, 1,
0.8447785, 0.08647671, 0.4451666, 1, 1, 1, 1, 1,
0.8534226, 0.0912495, 2.505576, 1, 1, 1, 1, 1,
0.8584284, -1.087497, 3.043617, 1, 1, 1, 1, 1,
0.8600896, 1.711458, 0.5103798, 1, 1, 1, 1, 1,
0.8621151, -0.03060007, 2.081734, 1, 1, 1, 1, 1,
0.865666, 0.4209527, 2.265057, 1, 1, 1, 1, 1,
0.8705573, 0.4013257, 2.34066, 1, 1, 1, 1, 1,
0.8721204, 0.8046191, -0.1066483, 1, 1, 1, 1, 1,
0.8908555, -1.531427, 2.270436, 1, 1, 1, 1, 1,
0.8911756, 0.5769818, -0.4883539, 1, 1, 1, 1, 1,
0.8925272, -0.344833, 2.554321, 1, 1, 1, 1, 1,
0.892994, 0.04814683, 0.3916265, 1, 1, 1, 1, 1,
0.8956958, 1.797928, -0.3252735, 0, 0, 1, 1, 1,
0.8966329, 2.271319, 2.32751, 1, 0, 0, 1, 1,
0.8982556, 0.7201529, 0.7372825, 1, 0, 0, 1, 1,
0.9006701, -0.85291, 4.058362, 1, 0, 0, 1, 1,
0.9021446, -0.2939391, 0.6658739, 1, 0, 0, 1, 1,
0.9022778, -0.1121218, 0.9381769, 1, 0, 0, 1, 1,
0.9029012, 0.05680815, 2.814021, 0, 0, 0, 1, 1,
0.9074359, -0.7919363, 0.6609792, 0, 0, 0, 1, 1,
0.9085917, -1.203209, 2.127333, 0, 0, 0, 1, 1,
0.9107697, 0.1676536, 1.264325, 0, 0, 0, 1, 1,
0.9124112, -0.04711724, 1.082161, 0, 0, 0, 1, 1,
0.9173771, 0.5318477, 0.08907885, 0, 0, 0, 1, 1,
0.920658, -0.1655375, 1.706706, 0, 0, 0, 1, 1,
0.9255399, -0.03764117, 1.559759, 1, 1, 1, 1, 1,
0.9278453, -0.2843183, 0.8542988, 1, 1, 1, 1, 1,
0.9305711, 1.877369, 1.14236, 1, 1, 1, 1, 1,
0.9324707, 1.229429, 1.642928, 1, 1, 1, 1, 1,
0.9392449, -1.392555, 2.920428, 1, 1, 1, 1, 1,
0.9422024, -0.1198876, 1.113528, 1, 1, 1, 1, 1,
0.9429557, 0.6516671, 1.18191, 1, 1, 1, 1, 1,
0.9445461, -0.4801839, 1.224584, 1, 1, 1, 1, 1,
0.9471244, 0.4691528, 1.754227, 1, 1, 1, 1, 1,
0.9603449, 0.5236434, 1.733768, 1, 1, 1, 1, 1,
0.9607857, -2.268001, 1.621132, 1, 1, 1, 1, 1,
0.9626353, -0.04081559, 1.702085, 1, 1, 1, 1, 1,
0.9648196, -1.354419, 2.948357, 1, 1, 1, 1, 1,
0.965097, 1.314173, 1.245203, 1, 1, 1, 1, 1,
0.9654673, -0.5866397, 2.326997, 1, 1, 1, 1, 1,
0.9665968, -0.2900015, 0.7506235, 0, 0, 1, 1, 1,
0.9734524, -1.156182, 3.418029, 1, 0, 0, 1, 1,
0.9756901, 0.2058124, 3.59325, 1, 0, 0, 1, 1,
0.9768908, 0.8506898, 0.7121441, 1, 0, 0, 1, 1,
0.9784225, -0.4785452, 1.540181, 1, 0, 0, 1, 1,
0.9787006, 0.1363686, 0.6806606, 1, 0, 0, 1, 1,
0.9850736, 0.7131402, 2.855937, 0, 0, 0, 1, 1,
0.9923116, -0.009803435, 1.41091, 0, 0, 0, 1, 1,
0.9957398, 1.064898, -0.5775341, 0, 0, 0, 1, 1,
1.000009, -1.263452, 0.441091, 0, 0, 0, 1, 1,
1.005943, 1.765986, -0.1618027, 0, 0, 0, 1, 1,
1.00663, -0.4683615, -0.1170906, 0, 0, 0, 1, 1,
1.014983, 0.419192, -1.049608, 0, 0, 0, 1, 1,
1.020682, -0.57222, 1.034353, 1, 1, 1, 1, 1,
1.021448, 1.014383, 0.4506329, 1, 1, 1, 1, 1,
1.024041, 0.5826386, 1.11512, 1, 1, 1, 1, 1,
1.024405, 0.9617543, 0.1738141, 1, 1, 1, 1, 1,
1.025293, -0.1479047, 3.21732, 1, 1, 1, 1, 1,
1.030242, -1.35424, 2.940604, 1, 1, 1, 1, 1,
1.031566, -1.023766, 2.018992, 1, 1, 1, 1, 1,
1.032561, -2.286419, 1.994824, 1, 1, 1, 1, 1,
1.041289, -0.3978818, 2.269372, 1, 1, 1, 1, 1,
1.041428, -0.1670165, 1.03824, 1, 1, 1, 1, 1,
1.04358, -0.2290134, 2.169806, 1, 1, 1, 1, 1,
1.043925, 0.3562943, 0.6733971, 1, 1, 1, 1, 1,
1.05573, 0.5185427, 1.528353, 1, 1, 1, 1, 1,
1.06338, 0.1217967, 2.352413, 1, 1, 1, 1, 1,
1.065474, -0.8445933, 2.263915, 1, 1, 1, 1, 1,
1.079606, -0.7927658, 1.997599, 0, 0, 1, 1, 1,
1.089311, -1.43649, 1.114076, 1, 0, 0, 1, 1,
1.093247, -0.5690154, 1.407996, 1, 0, 0, 1, 1,
1.098609, -0.8902518, 1.673294, 1, 0, 0, 1, 1,
1.103257, 0.5665814, 0.286084, 1, 0, 0, 1, 1,
1.105647, -0.2556842, 2.684432, 1, 0, 0, 1, 1,
1.108969, -0.4858765, 2.344258, 0, 0, 0, 1, 1,
1.116489, -1.345735, 3.207027, 0, 0, 0, 1, 1,
1.116675, -0.4525763, 1.29604, 0, 0, 0, 1, 1,
1.116865, -1.310954, 2.354429, 0, 0, 0, 1, 1,
1.116943, 1.052483, 0.5500215, 0, 0, 0, 1, 1,
1.118233, 0.6752542, 2.077289, 0, 0, 0, 1, 1,
1.119336, 0.7762923, -0.2566113, 0, 0, 0, 1, 1,
1.120234, -1.501798, 2.169027, 1, 1, 1, 1, 1,
1.127078, -0.9167646, 2.684651, 1, 1, 1, 1, 1,
1.127084, -0.4231393, 1.505925, 1, 1, 1, 1, 1,
1.128031, 0.04937573, 2.489809, 1, 1, 1, 1, 1,
1.152681, -0.8489584, 2.831939, 1, 1, 1, 1, 1,
1.161496, 0.7221603, 1.254899, 1, 1, 1, 1, 1,
1.166556, 2.00136, -0.09700467, 1, 1, 1, 1, 1,
1.171865, -0.1523149, 0.4577395, 1, 1, 1, 1, 1,
1.179118, 1.495783, 0.02649106, 1, 1, 1, 1, 1,
1.183683, -0.8260893, 2.158199, 1, 1, 1, 1, 1,
1.188948, -0.734227, 0.5525484, 1, 1, 1, 1, 1,
1.190526, -1.241892, 3.044075, 1, 1, 1, 1, 1,
1.193982, -2.681826, 1.663084, 1, 1, 1, 1, 1,
1.201212, -1.467756, 0.8751137, 1, 1, 1, 1, 1,
1.214064, 0.9410174, -0.2529515, 1, 1, 1, 1, 1,
1.219052, -1.125845, -0.03541864, 0, 0, 1, 1, 1,
1.226566, 1.299387, -0.09952544, 1, 0, 0, 1, 1,
1.226578, 0.4037525, 3.255785, 1, 0, 0, 1, 1,
1.239892, 0.46988, 0.4556499, 1, 0, 0, 1, 1,
1.242832, -0.0831161, 2.152015, 1, 0, 0, 1, 1,
1.247453, -0.4950786, 0.7982062, 1, 0, 0, 1, 1,
1.248283, -2.279502, 2.957857, 0, 0, 0, 1, 1,
1.261603, -1.081782, 0.6563058, 0, 0, 0, 1, 1,
1.269339, 0.3058665, 2.069063, 0, 0, 0, 1, 1,
1.290579, 0.4496697, 1.872483, 0, 0, 0, 1, 1,
1.29518, 1.081909, 0.5313909, 0, 0, 0, 1, 1,
1.295826, -1.917145, 1.179642, 0, 0, 0, 1, 1,
1.296076, -0.4138525, 1.456993, 0, 0, 0, 1, 1,
1.299602, 0.4145299, 2.778952, 1, 1, 1, 1, 1,
1.305317, -0.08990531, -0.4625046, 1, 1, 1, 1, 1,
1.315054, 0.04539531, 1.984454, 1, 1, 1, 1, 1,
1.328072, 1.280564, 0.853345, 1, 1, 1, 1, 1,
1.331968, -0.06292614, 0.5874785, 1, 1, 1, 1, 1,
1.341208, -0.2705038, 1.115761, 1, 1, 1, 1, 1,
1.341561, 2.810762, -0.6328306, 1, 1, 1, 1, 1,
1.343823, 1.151385, 2.035575, 1, 1, 1, 1, 1,
1.34411, -0.4883851, 1.436542, 1, 1, 1, 1, 1,
1.348754, -0.3534485, 2.98546, 1, 1, 1, 1, 1,
1.355161, 2.57439, 0.627592, 1, 1, 1, 1, 1,
1.364131, 0.08265042, 1.025363, 1, 1, 1, 1, 1,
1.37228, -0.4695558, 2.139071, 1, 1, 1, 1, 1,
1.38201, 0.008213495, -0.4362728, 1, 1, 1, 1, 1,
1.385702, -0.1125969, 2.748039, 1, 1, 1, 1, 1,
1.390434, -0.433719, 2.634104, 0, 0, 1, 1, 1,
1.395896, -0.2226358, 0.6151217, 1, 0, 0, 1, 1,
1.40055, 0.5443557, 0.8285806, 1, 0, 0, 1, 1,
1.406446, 0.409972, 1.891722, 1, 0, 0, 1, 1,
1.411954, 0.06179705, 1.293324, 1, 0, 0, 1, 1,
1.413808, 0.5056949, 2.89955, 1, 0, 0, 1, 1,
1.414521, 0.139901, 0.4991346, 0, 0, 0, 1, 1,
1.426088, 0.2747976, 0.3863299, 0, 0, 0, 1, 1,
1.436016, -1.221162, 3.524286, 0, 0, 0, 1, 1,
1.437608, 0.3522205, 0.6109372, 0, 0, 0, 1, 1,
1.438012, 1.031429, 1.070985, 0, 0, 0, 1, 1,
1.440971, -0.000982758, 0.01520653, 0, 0, 0, 1, 1,
1.444244, -0.2658902, 1.444731, 0, 0, 0, 1, 1,
1.465294, -0.2859583, 0.8287035, 1, 1, 1, 1, 1,
1.471969, 1.35877, 0.0432536, 1, 1, 1, 1, 1,
1.490885, -1.876351, 2.028458, 1, 1, 1, 1, 1,
1.493414, -0.4550685, 1.216772, 1, 1, 1, 1, 1,
1.493786, -0.05952385, 2.602291, 1, 1, 1, 1, 1,
1.51154, -0.669107, 2.972829, 1, 1, 1, 1, 1,
1.512565, -1.244543, 1.848636, 1, 1, 1, 1, 1,
1.517607, -0.5298283, 1.04969, 1, 1, 1, 1, 1,
1.518832, -0.5800452, 1.976931, 1, 1, 1, 1, 1,
1.561163, -0.01315351, 1.519888, 1, 1, 1, 1, 1,
1.566185, 0.4319531, 1.244595, 1, 1, 1, 1, 1,
1.56672, -0.2678427, 2.086943, 1, 1, 1, 1, 1,
1.569383, -0.7489585, 1.493279, 1, 1, 1, 1, 1,
1.579963, 2.223132, 2.137605, 1, 1, 1, 1, 1,
1.589671, 0.2564189, 0.7161792, 1, 1, 1, 1, 1,
1.592152, -0.9698889, 2.250358, 0, 0, 1, 1, 1,
1.593064, -0.8314961, 0.9084087, 1, 0, 0, 1, 1,
1.612164, 0.8263548, 0.3635406, 1, 0, 0, 1, 1,
1.616078, 1.292854, 2.056325, 1, 0, 0, 1, 1,
1.656872, -0.7923998, 1.65958, 1, 0, 0, 1, 1,
1.661301, 0.4146414, 1.392485, 1, 0, 0, 1, 1,
1.669424, 0.03363017, 1.713223, 0, 0, 0, 1, 1,
1.673054, -0.1526046, 1.73612, 0, 0, 0, 1, 1,
1.674896, -1.945708, 1.26769, 0, 0, 0, 1, 1,
1.681167, -1.935361, 3.690407, 0, 0, 0, 1, 1,
1.709772, -0.4059032, 1.667206, 0, 0, 0, 1, 1,
1.719046, -0.07159905, 0.1394413, 0, 0, 0, 1, 1,
1.745655, -0.0001757253, 1.376285, 0, 0, 0, 1, 1,
1.75498, -1.154626, 1.609016, 1, 1, 1, 1, 1,
1.788991, -1.101272, 1.879716, 1, 1, 1, 1, 1,
1.796088, -0.7113888, 1.796703, 1, 1, 1, 1, 1,
1.803545, 0.729756, 0.8431456, 1, 1, 1, 1, 1,
1.828571, -0.6887129, 1.483056, 1, 1, 1, 1, 1,
1.847133, 1.342817, 3.198613, 1, 1, 1, 1, 1,
1.861283, 0.5238392, 0.909718, 1, 1, 1, 1, 1,
1.865968, -0.4275166, 1.959131, 1, 1, 1, 1, 1,
1.866289, -0.1836058, 2.06845, 1, 1, 1, 1, 1,
1.873489, 0.8463826, 1.798966, 1, 1, 1, 1, 1,
1.873619, -0.2669787, 1.428026, 1, 1, 1, 1, 1,
1.880764, 1.450907, 1.598685, 1, 1, 1, 1, 1,
1.912502, 1.184709, 2.078932, 1, 1, 1, 1, 1,
1.921467, 1.756667, 0.2669107, 1, 1, 1, 1, 1,
1.936084, -0.1569563, 2.271021, 1, 1, 1, 1, 1,
1.996985, -1.758379, 3.436175, 0, 0, 1, 1, 1,
2.005497, -0.4784665, 2.213167, 1, 0, 0, 1, 1,
2.011084, -1.825088, 0.3489807, 1, 0, 0, 1, 1,
2.083123, -0.6927732, 2.213976, 1, 0, 0, 1, 1,
2.085587, 0.2286039, 0.06357557, 1, 0, 0, 1, 1,
2.120293, -0.5409893, 0.9835136, 1, 0, 0, 1, 1,
2.127229, -0.3908046, 1.258875, 0, 0, 0, 1, 1,
2.185287, 1.361092, 1.17554, 0, 0, 0, 1, 1,
2.186615, 0.3485864, 1.722156, 0, 0, 0, 1, 1,
2.197201, -0.430683, 0.6390096, 0, 0, 0, 1, 1,
2.292065, 0.2441749, 1.777443, 0, 0, 0, 1, 1,
2.311867, 0.4173259, 0.4204848, 0, 0, 0, 1, 1,
2.344587, -2.246968, 2.5851, 0, 0, 0, 1, 1,
2.36659, -1.761869, 3.947882, 1, 1, 1, 1, 1,
2.413478, 1.033205, -0.4058382, 1, 1, 1, 1, 1,
2.570922, -0.1134685, 1.458669, 1, 1, 1, 1, 1,
2.590969, -0.09844135, -0.3251772, 1, 1, 1, 1, 1,
2.602263, 0.136397, 2.530226, 1, 1, 1, 1, 1,
2.665252, -0.561041, 2.003922, 1, 1, 1, 1, 1,
2.836907, 0.6206191, 2.048528, 1, 1, 1, 1, 1
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
var radius = 9.311769;
var distance = 32.70719;
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
mvMatrix.translate( 0.3689474, -0.01905012, -0.1467216 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.70719);
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
