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
-3.722728, 0.8453353, -2.250247, 1, 0, 0, 1,
-2.912619, -0.24862, -2.023929, 1, 0.007843138, 0, 1,
-2.860045, -0.1691935, -2.594513, 1, 0.01176471, 0, 1,
-2.67163, -1.27203, -1.585008, 1, 0.01960784, 0, 1,
-2.501856, -0.2956585, -0.8877408, 1, 0.02352941, 0, 1,
-2.490519, -0.9306672, -2.255967, 1, 0.03137255, 0, 1,
-2.408509, 0.4565355, -1.966454, 1, 0.03529412, 0, 1,
-2.364215, 1.612782, -1.915823, 1, 0.04313726, 0, 1,
-2.357601, 0.05556105, 0.07979406, 1, 0.04705882, 0, 1,
-2.305252, -0.7334427, -0.6419715, 1, 0.05490196, 0, 1,
-2.26739, -0.02091257, -2.321565, 1, 0.05882353, 0, 1,
-2.267105, -0.1604987, -1.208915, 1, 0.06666667, 0, 1,
-2.26683, 0.994791, -0.8581849, 1, 0.07058824, 0, 1,
-2.262948, 0.8863596, -0.5600626, 1, 0.07843138, 0, 1,
-2.199873, -1.715069, -3.136336, 1, 0.08235294, 0, 1,
-2.196743, 1.582671, -0.3195895, 1, 0.09019608, 0, 1,
-2.180675, 1.004696, -0.6451097, 1, 0.09411765, 0, 1,
-2.170614, 0.04579674, -1.67269, 1, 0.1019608, 0, 1,
-2.139202, 0.8098371, -0.150935, 1, 0.1098039, 0, 1,
-2.092011, 0.3604651, -0.1649566, 1, 0.1137255, 0, 1,
-2.0566, -0.5626084, -2.089137, 1, 0.1215686, 0, 1,
-2.044264, 2.003442, -1.893992, 1, 0.1254902, 0, 1,
-2.040098, 0.4496201, -1.03532, 1, 0.1333333, 0, 1,
-2.03954, 0.3060328, -1.513108, 1, 0.1372549, 0, 1,
-1.987857, 1.227931, 0.5361421, 1, 0.145098, 0, 1,
-1.977443, 0.6552184, -2.226883, 1, 0.1490196, 0, 1,
-1.976976, -0.7966951, -0.9386286, 1, 0.1568628, 0, 1,
-1.971246, -1.185088, -1.501157, 1, 0.1607843, 0, 1,
-1.962668, 1.0162, -2.586696, 1, 0.1686275, 0, 1,
-1.926901, 0.6141617, -1.660341, 1, 0.172549, 0, 1,
-1.92255, 2.255904, 0.06678695, 1, 0.1803922, 0, 1,
-1.919791, -1.555197, -1.049073, 1, 0.1843137, 0, 1,
-1.908007, -0.910801, -1.13305, 1, 0.1921569, 0, 1,
-1.895466, 1.196911, -0.3683057, 1, 0.1960784, 0, 1,
-1.885392, -1.374407, -2.032177, 1, 0.2039216, 0, 1,
-1.884177, -0.4372957, -0.6469256, 1, 0.2117647, 0, 1,
-1.861623, 0.6615077, 0.7370281, 1, 0.2156863, 0, 1,
-1.859982, 0.2099142, -1.028023, 1, 0.2235294, 0, 1,
-1.858217, 0.7518394, -1.821599, 1, 0.227451, 0, 1,
-1.81419, 1.339718, -1.162443, 1, 0.2352941, 0, 1,
-1.793908, 1.422886, -0.8042002, 1, 0.2392157, 0, 1,
-1.761155, 0.5481411, -2.242287, 1, 0.2470588, 0, 1,
-1.755596, 0.2698708, -0.01608478, 1, 0.2509804, 0, 1,
-1.744188, 4.331757, -1.631695, 1, 0.2588235, 0, 1,
-1.741434, -0.3487162, -1.936871, 1, 0.2627451, 0, 1,
-1.726013, 0.6173273, 0.2443658, 1, 0.2705882, 0, 1,
-1.725425, 1.338361, 0.1246587, 1, 0.2745098, 0, 1,
-1.724277, -1.541102, -2.676111, 1, 0.282353, 0, 1,
-1.708921, -0.6501712, -2.438236, 1, 0.2862745, 0, 1,
-1.701369, -0.1646058, -0.8279883, 1, 0.2941177, 0, 1,
-1.699082, -0.1411884, -0.03068214, 1, 0.3019608, 0, 1,
-1.675876, 1.576255, -0.168051, 1, 0.3058824, 0, 1,
-1.675155, -0.9433619, -2.295837, 1, 0.3137255, 0, 1,
-1.658327, -0.4854214, -2.149, 1, 0.3176471, 0, 1,
-1.645329, -1.309134, -0.7585464, 1, 0.3254902, 0, 1,
-1.624073, -1.330351, -2.322491, 1, 0.3294118, 0, 1,
-1.620828, -0.9243886, -1.60551, 1, 0.3372549, 0, 1,
-1.603364, 0.5771772, -0.7672015, 1, 0.3411765, 0, 1,
-1.584246, 0.07509897, -0.752, 1, 0.3490196, 0, 1,
-1.58376, 0.1549661, -1.072209, 1, 0.3529412, 0, 1,
-1.566138, -0.8311638, -0.6222379, 1, 0.3607843, 0, 1,
-1.557611, 0.5234832, -1.98907, 1, 0.3647059, 0, 1,
-1.557409, -0.2496065, -2.156276, 1, 0.372549, 0, 1,
-1.55668, 0.03468337, -1.512401, 1, 0.3764706, 0, 1,
-1.552257, -0.2066394, -2.796345, 1, 0.3843137, 0, 1,
-1.549359, 1.060037, -0.02150766, 1, 0.3882353, 0, 1,
-1.54068, 0.8987947, -1.893016, 1, 0.3960784, 0, 1,
-1.529736, 0.805593, -1.136716, 1, 0.4039216, 0, 1,
-1.511107, -0.8671081, -1.658693, 1, 0.4078431, 0, 1,
-1.508043, -1.199216, -1.027855, 1, 0.4156863, 0, 1,
-1.499397, 0.7992266, -0.1993028, 1, 0.4196078, 0, 1,
-1.492824, 0.6017671, 1.303617, 1, 0.427451, 0, 1,
-1.484088, -1.327278, -3.818772, 1, 0.4313726, 0, 1,
-1.476391, 0.6628816, -1.23162, 1, 0.4392157, 0, 1,
-1.47115, 0.9051746, -3.050511, 1, 0.4431373, 0, 1,
-1.468562, -0.1822657, 0.6811891, 1, 0.4509804, 0, 1,
-1.468404, 0.3562012, -2.750381, 1, 0.454902, 0, 1,
-1.467865, 0.6015658, 0.5318009, 1, 0.4627451, 0, 1,
-1.460268, 1.067379, -2.614065, 1, 0.4666667, 0, 1,
-1.453393, 0.8173692, -1.358552, 1, 0.4745098, 0, 1,
-1.448084, -1.71594, -3.142372, 1, 0.4784314, 0, 1,
-1.434343, 0.4094281, -0.9089937, 1, 0.4862745, 0, 1,
-1.433254, -1.024456, -3.473006, 1, 0.4901961, 0, 1,
-1.424653, -0.709826, -2.580485, 1, 0.4980392, 0, 1,
-1.419197, -1.021403, -0.7227772, 1, 0.5058824, 0, 1,
-1.411076, 0.6425837, -0.3890377, 1, 0.509804, 0, 1,
-1.396194, -0.2976823, -2.430519, 1, 0.5176471, 0, 1,
-1.3892, -0.6028768, -1.369474, 1, 0.5215687, 0, 1,
-1.382693, -1.11806, -1.356417, 1, 0.5294118, 0, 1,
-1.379472, -1.059754, -0.7115057, 1, 0.5333334, 0, 1,
-1.375453, -0.2957091, -2.383855, 1, 0.5411765, 0, 1,
-1.373089, -0.1509196, -4.783176, 1, 0.5450981, 0, 1,
-1.372565, -0.6924964, -1.225127, 1, 0.5529412, 0, 1,
-1.363076, 0.5426096, -1.583511, 1, 0.5568628, 0, 1,
-1.359689, -2.964242, -4.025254, 1, 0.5647059, 0, 1,
-1.359524, 1.680402, -0.2702399, 1, 0.5686275, 0, 1,
-1.355111, -0.5930383, -2.219217, 1, 0.5764706, 0, 1,
-1.337782, 1.014865, -1.933164, 1, 0.5803922, 0, 1,
-1.337075, 0.1256528, -0.3523292, 1, 0.5882353, 0, 1,
-1.336718, 0.9089255, -0.1183613, 1, 0.5921569, 0, 1,
-1.335777, -0.774572, -1.475489, 1, 0.6, 0, 1,
-1.327711, 0.2835543, -2.299665, 1, 0.6078432, 0, 1,
-1.327304, 0.275042, -1.278685, 1, 0.6117647, 0, 1,
-1.322287, -0.04091662, -3.001096, 1, 0.6196079, 0, 1,
-1.305062, 0.9222706, 0.6802115, 1, 0.6235294, 0, 1,
-1.288703, -0.1105074, -0.9636524, 1, 0.6313726, 0, 1,
-1.286831, 0.5190893, -0.5846952, 1, 0.6352941, 0, 1,
-1.274218, 0.8589417, -2.057905, 1, 0.6431373, 0, 1,
-1.262045, 0.5388811, -2.67048, 1, 0.6470588, 0, 1,
-1.258324, 1.643043, -2.021483, 1, 0.654902, 0, 1,
-1.258272, 1.318659, -0.4204797, 1, 0.6588235, 0, 1,
-1.247186, 1.389883, -2.075649, 1, 0.6666667, 0, 1,
-1.223112, 0.258258, -1.550555, 1, 0.6705883, 0, 1,
-1.221605, 0.2327494, -1.518441, 1, 0.6784314, 0, 1,
-1.216516, -0.3201235, -0.5442814, 1, 0.682353, 0, 1,
-1.216366, 1.908549, 1.004447, 1, 0.6901961, 0, 1,
-1.213389, 1.234257, -2.354226, 1, 0.6941177, 0, 1,
-1.20284, 1.753086, -2.760788, 1, 0.7019608, 0, 1,
-1.189245, 0.2426683, -1.138351, 1, 0.7098039, 0, 1,
-1.183113, -2.193588, -1.602476, 1, 0.7137255, 0, 1,
-1.157298, 0.4809409, -0.4471335, 1, 0.7215686, 0, 1,
-1.156991, 0.1374384, -0.9300689, 1, 0.7254902, 0, 1,
-1.156773, 0.1295045, -0.9446322, 1, 0.7333333, 0, 1,
-1.155252, 0.9668165, -1.204824, 1, 0.7372549, 0, 1,
-1.147386, 3.089968, -0.5998895, 1, 0.7450981, 0, 1,
-1.139192, -0.4068088, -2.694977, 1, 0.7490196, 0, 1,
-1.134482, -1.143083, -3.34668, 1, 0.7568628, 0, 1,
-1.126153, -0.02562325, -2.589659, 1, 0.7607843, 0, 1,
-1.119445, -0.5005215, -2.406574, 1, 0.7686275, 0, 1,
-1.113838, 1.147132, -1.064705, 1, 0.772549, 0, 1,
-1.106447, -0.07282533, -1.303501, 1, 0.7803922, 0, 1,
-1.103071, -0.6450618, -2.594316, 1, 0.7843137, 0, 1,
-1.101772, -0.2087705, -2.522031, 1, 0.7921569, 0, 1,
-1.093451, 0.6170368, -2.221054, 1, 0.7960784, 0, 1,
-1.09326, -0.9823735, -3.766913, 1, 0.8039216, 0, 1,
-1.092228, -0.8124468, -0.915885, 1, 0.8117647, 0, 1,
-1.089871, 0.05580916, -2.68757, 1, 0.8156863, 0, 1,
-1.088285, -0.4049881, -0.8394653, 1, 0.8235294, 0, 1,
-1.082516, 2.335003, -0.3239816, 1, 0.827451, 0, 1,
-1.069201, 1.242794, -0.1996864, 1, 0.8352941, 0, 1,
-1.064449, -0.1946729, -1.277709, 1, 0.8392157, 0, 1,
-1.05856, -0.02363594, -1.102736, 1, 0.8470588, 0, 1,
-1.055323, 1.399485, -1.425948, 1, 0.8509804, 0, 1,
-1.049123, -0.1206648, -0.608672, 1, 0.8588235, 0, 1,
-1.046733, -0.5077042, -3.945476, 1, 0.8627451, 0, 1,
-1.032081, -1.718195, -3.736658, 1, 0.8705882, 0, 1,
-1.02921, 0.6930869, -1.240765, 1, 0.8745098, 0, 1,
-1.026821, -0.009277191, -0.510443, 1, 0.8823529, 0, 1,
-1.022975, 0.1493275, -1.74718, 1, 0.8862745, 0, 1,
-1.0191, 0.3215538, -0.4827381, 1, 0.8941177, 0, 1,
-1.01667, -0.5709096, -2.977947, 1, 0.8980392, 0, 1,
-1.015883, 0.5231975, -1.76547, 1, 0.9058824, 0, 1,
-1.014753, -0.05429935, -2.734115, 1, 0.9137255, 0, 1,
-1.010552, -0.8953184, -2.966538, 1, 0.9176471, 0, 1,
-1.007385, 0.3948746, -1.157358, 1, 0.9254902, 0, 1,
-0.9990686, 0.7365362, -2.472273, 1, 0.9294118, 0, 1,
-0.9975734, 0.02508574, -1.229466, 1, 0.9372549, 0, 1,
-0.9966068, -1.580841, -4.790435, 1, 0.9411765, 0, 1,
-0.9944671, -0.5934301, -2.838523, 1, 0.9490196, 0, 1,
-0.9715514, 1.465432, -0.1661001, 1, 0.9529412, 0, 1,
-0.9676379, 0.7518385, -2.098257, 1, 0.9607843, 0, 1,
-0.9660262, 1.289615, 1.010545, 1, 0.9647059, 0, 1,
-0.9644496, 0.8355379, 0.8688453, 1, 0.972549, 0, 1,
-0.9627005, -1.413423, -0.4859084, 1, 0.9764706, 0, 1,
-0.9582412, -0.1573285, -2.336223, 1, 0.9843137, 0, 1,
-0.9565749, -0.2187238, -3.445468, 1, 0.9882353, 0, 1,
-0.9504062, -0.642503, 0.2618268, 1, 0.9960784, 0, 1,
-0.9456244, 0.937097, -1.375531, 0.9960784, 1, 0, 1,
-0.9418703, 0.3164788, -1.084713, 0.9921569, 1, 0, 1,
-0.9402499, -0.406748, -2.500267, 0.9843137, 1, 0, 1,
-0.9321026, -1.658885, -0.3179616, 0.9803922, 1, 0, 1,
-0.9196389, -1.172099, -2.403593, 0.972549, 1, 0, 1,
-0.918663, 0.5294758, -1.91675, 0.9686275, 1, 0, 1,
-0.9178391, -0.9606714, -1.579885, 0.9607843, 1, 0, 1,
-0.9126599, -2.074852, -3.134411, 0.9568627, 1, 0, 1,
-0.9041963, -0.538963, -1.275823, 0.9490196, 1, 0, 1,
-0.9028199, -1.134726, -3.099134, 0.945098, 1, 0, 1,
-0.8984538, 0.1128815, 0.252815, 0.9372549, 1, 0, 1,
-0.8930843, -0.05326649, -1.440675, 0.9333333, 1, 0, 1,
-0.8853329, 0.7423427, -0.7534682, 0.9254902, 1, 0, 1,
-0.8829536, -0.1674068, -2.639598, 0.9215686, 1, 0, 1,
-0.8790542, 0.5998926, -0.4023802, 0.9137255, 1, 0, 1,
-0.8754745, -0.6082135, -3.147777, 0.9098039, 1, 0, 1,
-0.8737344, -0.3807943, -0.7520624, 0.9019608, 1, 0, 1,
-0.8722835, -1.377099, -4.016702, 0.8941177, 1, 0, 1,
-0.8710225, -0.4759508, -2.985012, 0.8901961, 1, 0, 1,
-0.8660135, -1.281043, -0.9550658, 0.8823529, 1, 0, 1,
-0.8586007, -0.6017003, -3.300351, 0.8784314, 1, 0, 1,
-0.8582293, -0.2646534, -1.80631, 0.8705882, 1, 0, 1,
-0.8517936, -2.139013, -2.177383, 0.8666667, 1, 0, 1,
-0.8502753, 0.1516915, -1.49111, 0.8588235, 1, 0, 1,
-0.8278826, -0.7484008, -1.290948, 0.854902, 1, 0, 1,
-0.8203801, -1.244387, -1.992345, 0.8470588, 1, 0, 1,
-0.8137531, 2.159285, -0.2143795, 0.8431373, 1, 0, 1,
-0.8125158, 0.09832224, -1.413267, 0.8352941, 1, 0, 1,
-0.8067921, 0.1127121, -1.508695, 0.8313726, 1, 0, 1,
-0.8052816, 1.98225, -0.9364156, 0.8235294, 1, 0, 1,
-0.7990268, 0.0314029, -1.537712, 0.8196079, 1, 0, 1,
-0.797157, 1.063354, -1.609921, 0.8117647, 1, 0, 1,
-0.789889, 0.1957189, 0.8354033, 0.8078431, 1, 0, 1,
-0.7881762, -0.521435, -1.50927, 0.8, 1, 0, 1,
-0.7851254, -0.5300981, -3.600506, 0.7921569, 1, 0, 1,
-0.7829358, -0.7703567, -2.947372, 0.7882353, 1, 0, 1,
-0.7779964, 0.7018577, -3.452382, 0.7803922, 1, 0, 1,
-0.7698421, 0.02737215, -2.622674, 0.7764706, 1, 0, 1,
-0.7663534, 0.6346099, -2.111926, 0.7686275, 1, 0, 1,
-0.764664, 0.9604511, -2.485041, 0.7647059, 1, 0, 1,
-0.762906, 0.5097019, 0.1097526, 0.7568628, 1, 0, 1,
-0.7622648, 1.072239, -0.8369465, 0.7529412, 1, 0, 1,
-0.7573986, 0.0802296, -2.051072, 0.7450981, 1, 0, 1,
-0.7545438, -0.2771622, -3.703418, 0.7411765, 1, 0, 1,
-0.7488794, -0.02559377, -3.61422, 0.7333333, 1, 0, 1,
-0.7476348, -0.7839884, -3.473052, 0.7294118, 1, 0, 1,
-0.7460305, 2.026603, -0.08031923, 0.7215686, 1, 0, 1,
-0.743124, 0.9761174, 0.6704882, 0.7176471, 1, 0, 1,
-0.7425396, 0.186984, -0.6157775, 0.7098039, 1, 0, 1,
-0.7425257, 0.236279, 0.258389, 0.7058824, 1, 0, 1,
-0.7389945, 0.1119701, -0.02930593, 0.6980392, 1, 0, 1,
-0.7329624, 0.7387773, 0.7539154, 0.6901961, 1, 0, 1,
-0.7325637, -0.4376303, -1.999499, 0.6862745, 1, 0, 1,
-0.7322379, -0.7771799, -4.152883, 0.6784314, 1, 0, 1,
-0.7132418, 0.09333038, -1.700404, 0.6745098, 1, 0, 1,
-0.7089173, -2.195364, -3.374609, 0.6666667, 1, 0, 1,
-0.7053375, 0.4983445, -0.3407083, 0.6627451, 1, 0, 1,
-0.7040815, 1.211882, -0.626605, 0.654902, 1, 0, 1,
-0.6966559, 0.2453672, -0.4108462, 0.6509804, 1, 0, 1,
-0.6937882, 1.013814, 0.02118023, 0.6431373, 1, 0, 1,
-0.6926561, 1.493866, 0.9728917, 0.6392157, 1, 0, 1,
-0.6885143, 0.04226645, -2.051029, 0.6313726, 1, 0, 1,
-0.6882238, -0.5020226, -2.997349, 0.627451, 1, 0, 1,
-0.6859357, 0.1591353, -1.436771, 0.6196079, 1, 0, 1,
-0.6853607, 0.1023766, -0.2489519, 0.6156863, 1, 0, 1,
-0.679812, -0.7313471, -1.97545, 0.6078432, 1, 0, 1,
-0.6780605, 0.8595886, -2.301795, 0.6039216, 1, 0, 1,
-0.6774487, 0.6103409, -0.2415768, 0.5960785, 1, 0, 1,
-0.6729578, 0.3579009, -0.4650562, 0.5882353, 1, 0, 1,
-0.6688421, -1.386304, -1.90422, 0.5843138, 1, 0, 1,
-0.668117, -0.7999371, -1.727737, 0.5764706, 1, 0, 1,
-0.6671796, 0.5007508, -2.914426, 0.572549, 1, 0, 1,
-0.6667491, -2.083568, -3.372233, 0.5647059, 1, 0, 1,
-0.6635041, -0.6244286, -1.986527, 0.5607843, 1, 0, 1,
-0.6554657, 0.5323234, 1.009674, 0.5529412, 1, 0, 1,
-0.6513972, -0.5910717, -2.828458, 0.5490196, 1, 0, 1,
-0.6504447, -0.3548287, -2.340158, 0.5411765, 1, 0, 1,
-0.648996, 0.9185194, -1.880438, 0.5372549, 1, 0, 1,
-0.6468517, -1.086163, -2.243406, 0.5294118, 1, 0, 1,
-0.642317, -0.4892491, -3.099291, 0.5254902, 1, 0, 1,
-0.6407367, -0.1557386, -0.1696759, 0.5176471, 1, 0, 1,
-0.6344706, -1.780261, -2.681446, 0.5137255, 1, 0, 1,
-0.6299655, 1.496772, 0.0638814, 0.5058824, 1, 0, 1,
-0.6278414, -0.1518156, -4.992759, 0.5019608, 1, 0, 1,
-0.6275296, 0.3978582, -1.797998, 0.4941176, 1, 0, 1,
-0.6204998, -0.7673435, -2.519359, 0.4862745, 1, 0, 1,
-0.6187459, 0.2793508, -0.2316127, 0.4823529, 1, 0, 1,
-0.6181265, -2.857093, -3.32646, 0.4745098, 1, 0, 1,
-0.6153073, -0.6815067, -3.827225, 0.4705882, 1, 0, 1,
-0.6145756, -0.7155637, -1.222865, 0.4627451, 1, 0, 1,
-0.6091309, 1.312156, -0.762028, 0.4588235, 1, 0, 1,
-0.608532, -0.5570375, -1.663952, 0.4509804, 1, 0, 1,
-0.60477, 1.376966, 1.291352, 0.4470588, 1, 0, 1,
-0.6030996, 1.000921, -0.5929539, 0.4392157, 1, 0, 1,
-0.6024517, -0.4522832, -2.415584, 0.4352941, 1, 0, 1,
-0.5970369, -0.5557721, -2.990597, 0.427451, 1, 0, 1,
-0.5900502, -0.430769, -3.392505, 0.4235294, 1, 0, 1,
-0.5892503, 0.1852144, -0.6624012, 0.4156863, 1, 0, 1,
-0.5818592, 0.9616287, -1.201865, 0.4117647, 1, 0, 1,
-0.5784947, -0.1895017, -0.8768896, 0.4039216, 1, 0, 1,
-0.5760864, -1.254689, -3.735659, 0.3960784, 1, 0, 1,
-0.5726443, -1.215458, -3.212409, 0.3921569, 1, 0, 1,
-0.5698143, 0.05431319, -2.132223, 0.3843137, 1, 0, 1,
-0.568303, -2.114907, -5.847407, 0.3803922, 1, 0, 1,
-0.5582247, 0.1698227, -0.3027645, 0.372549, 1, 0, 1,
-0.5576242, -0.2842929, -1.81397, 0.3686275, 1, 0, 1,
-0.5561057, 0.6301923, -1.217812, 0.3607843, 1, 0, 1,
-0.5550008, 0.3597316, -0.3696897, 0.3568628, 1, 0, 1,
-0.5539222, -1.091214, -2.367117, 0.3490196, 1, 0, 1,
-0.5509633, 0.3983482, -0.005680269, 0.345098, 1, 0, 1,
-0.5484086, -0.651264, -1.261276, 0.3372549, 1, 0, 1,
-0.5483364, -1.80232, -1.395154, 0.3333333, 1, 0, 1,
-0.5478711, 0.4195637, -0.9116012, 0.3254902, 1, 0, 1,
-0.547205, -0.5136625, -1.913484, 0.3215686, 1, 0, 1,
-0.5422103, -0.8689384, -2.50339, 0.3137255, 1, 0, 1,
-0.5389616, -0.4046455, -2.618097, 0.3098039, 1, 0, 1,
-0.5383522, 0.826131, -0.3932578, 0.3019608, 1, 0, 1,
-0.5358692, 0.5026481, 0.02562169, 0.2941177, 1, 0, 1,
-0.5344542, -2.021766, -2.706973, 0.2901961, 1, 0, 1,
-0.5323066, 0.9922451, -0.9928464, 0.282353, 1, 0, 1,
-0.5318471, 1.000594, 0.1923524, 0.2784314, 1, 0, 1,
-0.5296792, -1.165195, -2.868351, 0.2705882, 1, 0, 1,
-0.527465, -1.56316, -2.375583, 0.2666667, 1, 0, 1,
-0.5246041, 0.09098008, -0.8706303, 0.2588235, 1, 0, 1,
-0.5189041, -0.004453237, -0.257603, 0.254902, 1, 0, 1,
-0.5168598, -0.0378893, -0.2578669, 0.2470588, 1, 0, 1,
-0.5168035, -1.939998, -4.100636, 0.2431373, 1, 0, 1,
-0.5073299, 0.3518357, 0.5081198, 0.2352941, 1, 0, 1,
-0.5052466, -0.7250261, -0.9556835, 0.2313726, 1, 0, 1,
-0.5040732, 1.466944, 0.7757499, 0.2235294, 1, 0, 1,
-0.5036259, -0.2885063, -1.092242, 0.2196078, 1, 0, 1,
-0.5016272, -0.05101295, -1.885212, 0.2117647, 1, 0, 1,
-0.5012985, 1.104123, -0.4552597, 0.2078431, 1, 0, 1,
-0.4993696, -1.671696, -3.346807, 0.2, 1, 0, 1,
-0.4980627, -1.933347, -2.289821, 0.1921569, 1, 0, 1,
-0.4977626, 0.9509311, -2.478417, 0.1882353, 1, 0, 1,
-0.4895703, -1.435213, -1.519764, 0.1803922, 1, 0, 1,
-0.4878598, -0.2473744, 0.07786638, 0.1764706, 1, 0, 1,
-0.4862767, -2.351768, -2.863845, 0.1686275, 1, 0, 1,
-0.4819291, -1.999339, -2.03807, 0.1647059, 1, 0, 1,
-0.4719071, 0.4848608, -0.1465757, 0.1568628, 1, 0, 1,
-0.4662414, -2.150409, -2.209069, 0.1529412, 1, 0, 1,
-0.4607373, -0.09062385, -1.33663, 0.145098, 1, 0, 1,
-0.4528896, -0.9668636, -2.796532, 0.1411765, 1, 0, 1,
-0.450287, 1.443524, -1.32473, 0.1333333, 1, 0, 1,
-0.4432061, 1.199967, -0.06193938, 0.1294118, 1, 0, 1,
-0.44074, 1.922775, 1.85921, 0.1215686, 1, 0, 1,
-0.4363135, 0.8599706, 0.04919713, 0.1176471, 1, 0, 1,
-0.4351008, 0.4470707, -1.027382, 0.1098039, 1, 0, 1,
-0.434884, -2.253202, -3.878881, 0.1058824, 1, 0, 1,
-0.4300979, -0.7772058, -0.8951874, 0.09803922, 1, 0, 1,
-0.4284201, 0.2090641, -0.227786, 0.09019608, 1, 0, 1,
-0.4214413, -0.668176, -2.402828, 0.08627451, 1, 0, 1,
-0.4193818, 0.4738034, -1.332844, 0.07843138, 1, 0, 1,
-0.4136749, -0.8268497, -3.284592, 0.07450981, 1, 0, 1,
-0.413121, -1.187554, -2.34163, 0.06666667, 1, 0, 1,
-0.4083841, 0.9181392, -1.289307, 0.0627451, 1, 0, 1,
-0.4083754, -1.806232, -1.881882, 0.05490196, 1, 0, 1,
-0.4071159, -0.8256918, -0.1405113, 0.05098039, 1, 0, 1,
-0.4056662, 0.1674338, 0.8698856, 0.04313726, 1, 0, 1,
-0.3891231, 0.2987232, -0.9239025, 0.03921569, 1, 0, 1,
-0.3888645, 0.2755759, -0.8336518, 0.03137255, 1, 0, 1,
-0.3887256, -0.6899465, -2.323059, 0.02745098, 1, 0, 1,
-0.3868752, -1.437708, -2.588216, 0.01960784, 1, 0, 1,
-0.3840464, -0.8681195, -0.3310446, 0.01568628, 1, 0, 1,
-0.3815217, -0.8055226, -1.975122, 0.007843138, 1, 0, 1,
-0.380531, 0.5495803, -0.2759408, 0.003921569, 1, 0, 1,
-0.3796185, -1.144467, -3.708067, 0, 1, 0.003921569, 1,
-0.3779537, -0.30758, -1.509375, 0, 1, 0.01176471, 1,
-0.3726962, 1.75857, 1.994182, 0, 1, 0.01568628, 1,
-0.3706567, 1.458368, 0.4925393, 0, 1, 0.02352941, 1,
-0.3698826, -1.944715, 0.1008742, 0, 1, 0.02745098, 1,
-0.3667989, 1.927229, 0.3313692, 0, 1, 0.03529412, 1,
-0.3663353, 1.957554, -0.9420919, 0, 1, 0.03921569, 1,
-0.3611949, 1.610423, 0.9659618, 0, 1, 0.04705882, 1,
-0.3571846, -0.6503917, -3.131209, 0, 1, 0.05098039, 1,
-0.3548361, 0.04635899, -0.2838217, 0, 1, 0.05882353, 1,
-0.354706, -0.8000682, -3.393194, 0, 1, 0.0627451, 1,
-0.3508925, -1.224993, -3.69375, 0, 1, 0.07058824, 1,
-0.349881, 0.03179178, -1.913661, 0, 1, 0.07450981, 1,
-0.3496584, -1.092705, -2.824164, 0, 1, 0.08235294, 1,
-0.343871, 1.020944, 1.06477, 0, 1, 0.08627451, 1,
-0.3437682, -0.2064005, -3.69266, 0, 1, 0.09411765, 1,
-0.339025, 0.6285039, -1.184414, 0, 1, 0.1019608, 1,
-0.338147, -1.198485, -5.160599, 0, 1, 0.1058824, 1,
-0.3359917, -1.252966, -4.274777, 0, 1, 0.1137255, 1,
-0.3352785, 0.431677, -1.869721, 0, 1, 0.1176471, 1,
-0.3325943, -0.09691069, -2.175539, 0, 1, 0.1254902, 1,
-0.3317005, 0.3288377, -0.9829906, 0, 1, 0.1294118, 1,
-0.3261284, 0.06200752, -0.3305191, 0, 1, 0.1372549, 1,
-0.3233361, -0.2904244, -2.886529, 0, 1, 0.1411765, 1,
-0.3175139, 1.530298, -3.076381, 0, 1, 0.1490196, 1,
-0.3172452, 0.329585, -3.217208, 0, 1, 0.1529412, 1,
-0.316656, -0.4786577, -3.487421, 0, 1, 0.1607843, 1,
-0.3159623, -1.9935, -2.976418, 0, 1, 0.1647059, 1,
-0.3125705, 1.757122, 0.4046681, 0, 1, 0.172549, 1,
-0.3103966, -0.01329961, -1.893594, 0, 1, 0.1764706, 1,
-0.3054108, 0.2961046, -0.4030922, 0, 1, 0.1843137, 1,
-0.297572, 0.582294, 0.172057, 0, 1, 0.1882353, 1,
-0.2963816, -0.2122176, -0.2850362, 0, 1, 0.1960784, 1,
-0.2949587, 0.790092, 0.2202293, 0, 1, 0.2039216, 1,
-0.2924077, 1.327894, 0.8287612, 0, 1, 0.2078431, 1,
-0.291293, 1.812109, 0.2567348, 0, 1, 0.2156863, 1,
-0.2805786, 1.732479, 0.336149, 0, 1, 0.2196078, 1,
-0.2802096, 1.352755, -1.200517, 0, 1, 0.227451, 1,
-0.2796171, 0.06885663, -1.866298, 0, 1, 0.2313726, 1,
-0.2779147, -1.222777, -2.458497, 0, 1, 0.2392157, 1,
-0.277085, 1.020428, -0.5238456, 0, 1, 0.2431373, 1,
-0.2759323, -0.02317365, -1.057929, 0, 1, 0.2509804, 1,
-0.2709404, -0.8114735, -2.462874, 0, 1, 0.254902, 1,
-0.2707316, 0.9589647, 0.6170568, 0, 1, 0.2627451, 1,
-0.2682349, -1.976857, -2.014074, 0, 1, 0.2666667, 1,
-0.2674078, 1.502041, -0.7024969, 0, 1, 0.2745098, 1,
-0.26308, 1.97125, -0.2708102, 0, 1, 0.2784314, 1,
-0.2626117, -0.9442466, -1.801888, 0, 1, 0.2862745, 1,
-0.2596349, 0.258175, 1.828351, 0, 1, 0.2901961, 1,
-0.2575216, -0.1871884, -1.47701, 0, 1, 0.2980392, 1,
-0.2568352, 0.1654998, -2.950063, 0, 1, 0.3058824, 1,
-0.2536296, -0.01543413, -1.972732, 0, 1, 0.3098039, 1,
-0.2519961, 0.9184959, -0.5390311, 0, 1, 0.3176471, 1,
-0.2491488, -2.003182, -2.753443, 0, 1, 0.3215686, 1,
-0.2488594, 0.2814699, -1.454051, 0, 1, 0.3294118, 1,
-0.2469186, 1.398829, 1.159039, 0, 1, 0.3333333, 1,
-0.244004, 0.5264198, 0.3597065, 0, 1, 0.3411765, 1,
-0.2436109, 0.7175826, 0.9186456, 0, 1, 0.345098, 1,
-0.2394125, -0.01511941, -1.854643, 0, 1, 0.3529412, 1,
-0.2388638, -0.1217695, -1.724701, 0, 1, 0.3568628, 1,
-0.2341938, -0.6672136, -1.790525, 0, 1, 0.3647059, 1,
-0.2265598, 0.9672874, -0.12233, 0, 1, 0.3686275, 1,
-0.2220988, 0.1792638, -1.3668, 0, 1, 0.3764706, 1,
-0.2201724, -0.7304494, -4.101469, 0, 1, 0.3803922, 1,
-0.2200249, -0.3402337, -4.450998, 0, 1, 0.3882353, 1,
-0.2197644, 0.1939619, -1.74479, 0, 1, 0.3921569, 1,
-0.2193169, -0.05208194, -0.9022235, 0, 1, 0.4, 1,
-0.2167857, 1.158855, -0.4023986, 0, 1, 0.4078431, 1,
-0.2150204, 0.618769, 0.5820625, 0, 1, 0.4117647, 1,
-0.2133672, 0.004531804, -1.212249, 0, 1, 0.4196078, 1,
-0.208419, 0.613295, 1.376755, 0, 1, 0.4235294, 1,
-0.2043514, 1.358728, 0.009566147, 0, 1, 0.4313726, 1,
-0.203463, 0.4356022, -4.840805e-05, 0, 1, 0.4352941, 1,
-0.2012275, 0.3541188, -0.03200252, 0, 1, 0.4431373, 1,
-0.1959784, -1.387486, -2.477021, 0, 1, 0.4470588, 1,
-0.1948427, -0.01323998, -0.8186503, 0, 1, 0.454902, 1,
-0.1913221, -0.09215788, -0.5350748, 0, 1, 0.4588235, 1,
-0.184603, 0.04379284, -1.57427, 0, 1, 0.4666667, 1,
-0.182816, 1.341519, -0.4121303, 0, 1, 0.4705882, 1,
-0.1789863, -1.760001, -2.667542, 0, 1, 0.4784314, 1,
-0.1656525, -1.205862, -2.922431, 0, 1, 0.4823529, 1,
-0.1637565, 1.979295, -0.3333711, 0, 1, 0.4901961, 1,
-0.163541, -0.1584026, -2.604923, 0, 1, 0.4941176, 1,
-0.1613493, 0.04529728, -0.8208497, 0, 1, 0.5019608, 1,
-0.1587287, -0.1086653, -3.69804, 0, 1, 0.509804, 1,
-0.1586185, -0.736744, -4.026444, 0, 1, 0.5137255, 1,
-0.156028, -1.776989, -3.13508, 0, 1, 0.5215687, 1,
-0.1540468, 1.18768, -0.3995291, 0, 1, 0.5254902, 1,
-0.1456671, -0.07473683, -2.27844, 0, 1, 0.5333334, 1,
-0.1454141, -0.8628461, -4.446586, 0, 1, 0.5372549, 1,
-0.1445381, 0.9270492, 0.003646616, 0, 1, 0.5450981, 1,
-0.1421604, -0.5180989, -3.371893, 0, 1, 0.5490196, 1,
-0.1419153, -0.3165099, -3.497352, 0, 1, 0.5568628, 1,
-0.1413177, -0.5200183, -2.552674, 0, 1, 0.5607843, 1,
-0.1377991, 1.12411, 0.5347902, 0, 1, 0.5686275, 1,
-0.1372751, 2.29652, -0.9589345, 0, 1, 0.572549, 1,
-0.1365962, 0.4524296, -0.5846425, 0, 1, 0.5803922, 1,
-0.1359274, -0.003826918, -2.237149, 0, 1, 0.5843138, 1,
-0.135316, -1.931645, -5.279279, 0, 1, 0.5921569, 1,
-0.1346709, -0.0786737, -2.200288, 0, 1, 0.5960785, 1,
-0.1345662, 0.07440021, -1.928283, 0, 1, 0.6039216, 1,
-0.1340181, -1.262344, -4.673378, 0, 1, 0.6117647, 1,
-0.1318449, -0.5474929, -3.032233, 0, 1, 0.6156863, 1,
-0.1296302, 0.3410243, -1.339095, 0, 1, 0.6235294, 1,
-0.1279683, 0.314257, -0.7588941, 0, 1, 0.627451, 1,
-0.1239415, -2.759244, -4.163733, 0, 1, 0.6352941, 1,
-0.1209985, -0.5981293, -1.444917, 0, 1, 0.6392157, 1,
-0.1189964, 0.9194781, 0.4184763, 0, 1, 0.6470588, 1,
-0.11204, -0.3562294, -5.187489, 0, 1, 0.6509804, 1,
-0.1081198, -0.8142566, -3.250535, 0, 1, 0.6588235, 1,
-0.1041505, 0.6340948, -0.3407928, 0, 1, 0.6627451, 1,
-0.103022, 0.09327118, -1.926924, 0, 1, 0.6705883, 1,
-0.1011693, -0.02947295, -1.095621, 0, 1, 0.6745098, 1,
-0.09758416, -0.56937, -3.41861, 0, 1, 0.682353, 1,
-0.09728061, -0.3276981, -2.414331, 0, 1, 0.6862745, 1,
-0.09547152, 0.4599436, -1.046883, 0, 1, 0.6941177, 1,
-0.09158912, -0.6647999, -2.63836, 0, 1, 0.7019608, 1,
-0.09108643, -0.4587921, -3.461566, 0, 1, 0.7058824, 1,
-0.08643388, -1.761841, -3.341348, 0, 1, 0.7137255, 1,
-0.08105305, 0.8716456, -1.637583, 0, 1, 0.7176471, 1,
-0.08007923, -0.5115744, -4.264475, 0, 1, 0.7254902, 1,
-0.07915359, -0.8106129, -1.582303, 0, 1, 0.7294118, 1,
-0.07572954, -0.5645829, -3.447571, 0, 1, 0.7372549, 1,
-0.07567787, 0.5516671, -1.762688, 0, 1, 0.7411765, 1,
-0.07541203, -0.5207208, -2.382405, 0, 1, 0.7490196, 1,
-0.073793, 1.2476, -0.3191288, 0, 1, 0.7529412, 1,
-0.06897569, -0.8166851, -1.717311, 0, 1, 0.7607843, 1,
-0.06143539, 1.745032, 1.620494, 0, 1, 0.7647059, 1,
-0.05813118, -0.006436484, -1.372285, 0, 1, 0.772549, 1,
-0.05786311, 0.4961011, 0.8304154, 0, 1, 0.7764706, 1,
-0.05650602, -1.844309, -3.720912, 0, 1, 0.7843137, 1,
-0.05348421, 0.3844565, -0.2446444, 0, 1, 0.7882353, 1,
-0.05180184, 0.09068856, -0.877848, 0, 1, 0.7960784, 1,
-0.05157442, -1.917417, -3.070298, 0, 1, 0.8039216, 1,
-0.05145631, -0.2112564, -3.789423, 0, 1, 0.8078431, 1,
-0.0442491, -0.3721766, -3.668531, 0, 1, 0.8156863, 1,
-0.04352652, -0.1981239, -4.507611, 0, 1, 0.8196079, 1,
-0.03905581, 0.9667783, 0.3440053, 0, 1, 0.827451, 1,
-0.03763979, -0.6171028, -4.350517, 0, 1, 0.8313726, 1,
-0.03381578, -0.9176666, -3.345014, 0, 1, 0.8392157, 1,
-0.03225668, -0.4298928, -2.663256, 0, 1, 0.8431373, 1,
-0.0302975, -0.2604637, -2.457785, 0, 1, 0.8509804, 1,
-0.02541526, -0.01153651, -1.562144, 0, 1, 0.854902, 1,
-0.0248471, -0.2986062, -2.595299, 0, 1, 0.8627451, 1,
-0.0248431, -0.8131872, -3.407781, 0, 1, 0.8666667, 1,
-0.02386145, -0.4456139, -3.812948, 0, 1, 0.8745098, 1,
-0.01785784, 0.7156754, 1.098415, 0, 1, 0.8784314, 1,
-0.01781163, -0.4029398, -2.938755, 0, 1, 0.8862745, 1,
-0.01630239, 2.301558, 0.225232, 0, 1, 0.8901961, 1,
-0.01419806, -0.0818681, -3.341466, 0, 1, 0.8980392, 1,
-0.01208662, -1.729322, -4.268773, 0, 1, 0.9058824, 1,
-0.01014096, 0.3756084, 0.9734867, 0, 1, 0.9098039, 1,
-0.008066314, -1.408336, -3.516042, 0, 1, 0.9176471, 1,
-0.007088251, -0.6641631, -3.274749, 0, 1, 0.9215686, 1,
-0.003493833, -0.7015207, -3.939617, 0, 1, 0.9294118, 1,
-0.003094763, -0.1719013, -1.42408, 0, 1, 0.9333333, 1,
-0.002001684, 0.8315758, -0.9270009, 0, 1, 0.9411765, 1,
0.000549546, 1.41442, 0.3390487, 0, 1, 0.945098, 1,
0.0006861883, 0.5208967, 0.9483383, 0, 1, 0.9529412, 1,
0.001658931, 2.106669, -0.3823022, 0, 1, 0.9568627, 1,
0.003016503, 0.5063284, -1.018057, 0, 1, 0.9647059, 1,
0.00955025, 1.619471, -2.117837, 0, 1, 0.9686275, 1,
0.01118942, -2.036396, 2.346832, 0, 1, 0.9764706, 1,
0.01440507, -0.6426247, 3.304008, 0, 1, 0.9803922, 1,
0.02008404, -0.9480646, 3.592875, 0, 1, 0.9882353, 1,
0.0207714, 0.7082874, -0.4198332, 0, 1, 0.9921569, 1,
0.02157693, 0.2903911, -0.5033232, 0, 1, 1, 1,
0.02174193, -1.129246, 3.522967, 0, 0.9921569, 1, 1,
0.0305151, -1.597386, 2.341272, 0, 0.9882353, 1, 1,
0.03126273, 0.4696324, 1.092452, 0, 0.9803922, 1, 1,
0.03439738, -0.8289475, 1.92, 0, 0.9764706, 1, 1,
0.03525957, 0.3386204, -1.172651, 0, 0.9686275, 1, 1,
0.03845647, -1.388985, 3.727423, 0, 0.9647059, 1, 1,
0.04005319, 1.081979, -0.3481451, 0, 0.9568627, 1, 1,
0.04515512, -0.191137, 5.329499, 0, 0.9529412, 1, 1,
0.04682316, -0.733923, 3.8202, 0, 0.945098, 1, 1,
0.04754196, 1.044634, -0.4785242, 0, 0.9411765, 1, 1,
0.04774876, -0.4998736, 2.138552, 0, 0.9333333, 1, 1,
0.04795179, -0.8847666, 2.622305, 0, 0.9294118, 1, 1,
0.04797452, 0.3426057, 1.57219, 0, 0.9215686, 1, 1,
0.04879779, -0.6033672, 4.027634, 0, 0.9176471, 1, 1,
0.04895175, -0.5658569, 3.362712, 0, 0.9098039, 1, 1,
0.05121312, -0.8945508, 2.558446, 0, 0.9058824, 1, 1,
0.0539642, 0.1372784, 1.189773, 0, 0.8980392, 1, 1,
0.05779113, 0.09290665, 0.4829544, 0, 0.8901961, 1, 1,
0.0589564, -0.342531, 2.590194, 0, 0.8862745, 1, 1,
0.06099974, -0.3913701, 1.72424, 0, 0.8784314, 1, 1,
0.06500276, 0.8381606, 1.439209, 0, 0.8745098, 1, 1,
0.06514755, -2.015379, 3.684795, 0, 0.8666667, 1, 1,
0.06895697, 0.5951141, -0.1210444, 0, 0.8627451, 1, 1,
0.06942221, 0.1713119, 0.07680672, 0, 0.854902, 1, 1,
0.07803834, -0.2100649, 1.300948, 0, 0.8509804, 1, 1,
0.08190688, 0.07924334, 1.901296, 0, 0.8431373, 1, 1,
0.08624294, -0.4923411, 2.577142, 0, 0.8392157, 1, 1,
0.09618715, 0.2062348, 0.1314249, 0, 0.8313726, 1, 1,
0.09625196, 0.5984847, -1.16914, 0, 0.827451, 1, 1,
0.09749829, -1.062788, 3.092038, 0, 0.8196079, 1, 1,
0.1004477, -1.316972, 3.398127, 0, 0.8156863, 1, 1,
0.1018231, -0.7274294, 2.938611, 0, 0.8078431, 1, 1,
0.1019506, 0.1318451, 0.9679122, 0, 0.8039216, 1, 1,
0.1035931, -1.377093, 3.602617, 0, 0.7960784, 1, 1,
0.1046399, -1.585717, 2.850075, 0, 0.7882353, 1, 1,
0.1082191, 0.2989272, -0.2154629, 0, 0.7843137, 1, 1,
0.1114205, -1.384315, 3.88143, 0, 0.7764706, 1, 1,
0.1120547, -0.3238983, 2.517802, 0, 0.772549, 1, 1,
0.1193975, 1.294818, 0.8652475, 0, 0.7647059, 1, 1,
0.1198432, -0.5960172, 3.314745, 0, 0.7607843, 1, 1,
0.1206065, 0.3890647, 0.7014561, 0, 0.7529412, 1, 1,
0.1253666, 0.4465262, -0.7343163, 0, 0.7490196, 1, 1,
0.1268988, -0.841809, 1.98653, 0, 0.7411765, 1, 1,
0.1283717, 0.02700954, 2.305719, 0, 0.7372549, 1, 1,
0.1308307, -0.7175356, 1.948868, 0, 0.7294118, 1, 1,
0.1393683, -0.0006226254, 1.109416, 0, 0.7254902, 1, 1,
0.1402052, -0.2452004, 5.492997, 0, 0.7176471, 1, 1,
0.1428728, -0.7525523, 2.816629, 0, 0.7137255, 1, 1,
0.1436079, -0.8421769, -0.1524917, 0, 0.7058824, 1, 1,
0.1448083, 0.2431937, 1.723455, 0, 0.6980392, 1, 1,
0.1516735, -0.8958194, 3.153874, 0, 0.6941177, 1, 1,
0.1564988, -0.7987304, 1.43493, 0, 0.6862745, 1, 1,
0.1565522, 0.6360646, 0.4651437, 0, 0.682353, 1, 1,
0.1634586, -0.6510462, 2.977582, 0, 0.6745098, 1, 1,
0.1644977, -0.0651423, -1.535814, 0, 0.6705883, 1, 1,
0.1722168, 1.261031, -0.06569619, 0, 0.6627451, 1, 1,
0.1726184, 0.917837, -1.371373, 0, 0.6588235, 1, 1,
0.1740907, 1.527678, -1.927524, 0, 0.6509804, 1, 1,
0.1754757, 1.68017, 0.9162622, 0, 0.6470588, 1, 1,
0.1757203, -0.07286274, 2.452894, 0, 0.6392157, 1, 1,
0.1760617, 1.517836, -0.08552899, 0, 0.6352941, 1, 1,
0.1779584, 0.9003054, 0.5896645, 0, 0.627451, 1, 1,
0.1817686, -0.7677503, 2.357943, 0, 0.6235294, 1, 1,
0.1837322, -1.184728, 2.304544, 0, 0.6156863, 1, 1,
0.1856018, -1.114486, 3.65965, 0, 0.6117647, 1, 1,
0.1872828, 0.909345, 0.7045308, 0, 0.6039216, 1, 1,
0.1899492, -0.9832138, 3.569081, 0, 0.5960785, 1, 1,
0.1901346, -1.39805, 2.955628, 0, 0.5921569, 1, 1,
0.1921625, -0.9440687, 2.129705, 0, 0.5843138, 1, 1,
0.1934946, 1.696977, -0.7063553, 0, 0.5803922, 1, 1,
0.1939122, 0.5951836, 1.743479, 0, 0.572549, 1, 1,
0.1965897, -0.1404154, 1.723646, 0, 0.5686275, 1, 1,
0.1972805, -0.2680859, 2.064806, 0, 0.5607843, 1, 1,
0.1984984, 0.9259031, 0.2521564, 0, 0.5568628, 1, 1,
0.2098054, 0.2008478, 1.046935, 0, 0.5490196, 1, 1,
0.2134849, -1.023077, 3.582668, 0, 0.5450981, 1, 1,
0.2138816, -1.972953, 4.437264, 0, 0.5372549, 1, 1,
0.2142867, -0.6896341, 1.982756, 0, 0.5333334, 1, 1,
0.215483, 1.475079, -0.7395492, 0, 0.5254902, 1, 1,
0.2187532, 2.658733, -0.3548383, 0, 0.5215687, 1, 1,
0.2214775, -0.5309008, 2.413848, 0, 0.5137255, 1, 1,
0.2220952, 1.326249, -0.08806928, 0, 0.509804, 1, 1,
0.2230588, -1.738639, 3.826703, 0, 0.5019608, 1, 1,
0.2341518, -0.2489794, 1.754822, 0, 0.4941176, 1, 1,
0.2363794, 1.001546, 1.539932, 0, 0.4901961, 1, 1,
0.2369199, -0.5784656, 1.815782, 0, 0.4823529, 1, 1,
0.2376218, -0.4753112, 1.779303, 0, 0.4784314, 1, 1,
0.2390548, 0.3537185, 2.52413, 0, 0.4705882, 1, 1,
0.2423626, -0.5305437, 4.318584, 0, 0.4666667, 1, 1,
0.2437563, -0.6465712, 2.892292, 0, 0.4588235, 1, 1,
0.2467363, 0.2501899, 1.328049, 0, 0.454902, 1, 1,
0.250836, 0.1045338, 1.117708, 0, 0.4470588, 1, 1,
0.2553035, 0.9513063, 1.168648, 0, 0.4431373, 1, 1,
0.2556513, 1.234564, -1.018612, 0, 0.4352941, 1, 1,
0.2565368, -1.71422, 2.459895, 0, 0.4313726, 1, 1,
0.2580783, -0.3378147, 4.182086, 0, 0.4235294, 1, 1,
0.2588637, -0.372037, 2.668759, 0, 0.4196078, 1, 1,
0.2597123, 0.5961822, 0.2691934, 0, 0.4117647, 1, 1,
0.2618583, -1.214718, 2.599019, 0, 0.4078431, 1, 1,
0.2647101, 2.000566, -0.5478156, 0, 0.4, 1, 1,
0.2648127, 0.6714544, 1.962212, 0, 0.3921569, 1, 1,
0.2655101, -0.2088448, 1.282141, 0, 0.3882353, 1, 1,
0.2673357, -0.0923727, 1.248923, 0, 0.3803922, 1, 1,
0.2711448, 1.731413, 0.1687422, 0, 0.3764706, 1, 1,
0.2713757, 1.532904, 0.3107525, 0, 0.3686275, 1, 1,
0.2739299, 0.9168389, 0.2770344, 0, 0.3647059, 1, 1,
0.2740605, -1.65993, 3.640239, 0, 0.3568628, 1, 1,
0.2782306, -0.7182965, 1.27639, 0, 0.3529412, 1, 1,
0.2789469, 0.2026789, 0.6528857, 0, 0.345098, 1, 1,
0.281822, 0.2343842, 0.773374, 0, 0.3411765, 1, 1,
0.282444, -1.502412, 3.074643, 0, 0.3333333, 1, 1,
0.2833297, 0.3435629, 0.8804444, 0, 0.3294118, 1, 1,
0.2856305, -0.9657288, 2.921862, 0, 0.3215686, 1, 1,
0.296312, 0.1991712, -2.204204, 0, 0.3176471, 1, 1,
0.2969276, -0.08733036, -0.2150906, 0, 0.3098039, 1, 1,
0.2998539, 0.5634596, -0.08725469, 0, 0.3058824, 1, 1,
0.3003005, -0.3422984, 3.190734, 0, 0.2980392, 1, 1,
0.3048215, 1.216254, 0.1206027, 0, 0.2901961, 1, 1,
0.3138492, 0.6798943, -0.3396801, 0, 0.2862745, 1, 1,
0.3230782, -1.014862, 4.220247, 0, 0.2784314, 1, 1,
0.3249888, 2.223083, 0.9063011, 0, 0.2745098, 1, 1,
0.3254698, -1.11267, 3.022958, 0, 0.2666667, 1, 1,
0.3277282, -0.4316373, 1.958433, 0, 0.2627451, 1, 1,
0.3277423, -0.1258922, 1.729263, 0, 0.254902, 1, 1,
0.3283937, -1.304625, 2.26087, 0, 0.2509804, 1, 1,
0.3298806, -1.185191, 1.539381, 0, 0.2431373, 1, 1,
0.3301341, 0.5666867, -0.377543, 0, 0.2392157, 1, 1,
0.3337569, -0.7672126, 3.336078, 0, 0.2313726, 1, 1,
0.3367918, 0.1877393, -0.2708969, 0, 0.227451, 1, 1,
0.3373234, 0.7718055, 2.653372, 0, 0.2196078, 1, 1,
0.3379009, 1.311975, -0.3645099, 0, 0.2156863, 1, 1,
0.3426431, -0.002266086, 2.84732, 0, 0.2078431, 1, 1,
0.342955, -1.56936, 2.9824, 0, 0.2039216, 1, 1,
0.346433, 0.2501729, 0.9933487, 0, 0.1960784, 1, 1,
0.3466415, -1.235711, 2.996475, 0, 0.1882353, 1, 1,
0.3543213, 2.135546, 0.07196996, 0, 0.1843137, 1, 1,
0.3642604, 0.05701781, 0.514858, 0, 0.1764706, 1, 1,
0.3652167, 1.628362, -1.164886, 0, 0.172549, 1, 1,
0.3659019, 0.7506388, 0.9650989, 0, 0.1647059, 1, 1,
0.3702403, -0.9410378, 1.541934, 0, 0.1607843, 1, 1,
0.3719318, -0.2828634, 2.585025, 0, 0.1529412, 1, 1,
0.3724424, -0.6712206, 1.865478, 0, 0.1490196, 1, 1,
0.3743789, 1.613939, 0.7105098, 0, 0.1411765, 1, 1,
0.3748429, -4.076203, 3.48054, 0, 0.1372549, 1, 1,
0.3765198, 0.3262825, 1.127203, 0, 0.1294118, 1, 1,
0.3781472, 0.3061895, -0.0225719, 0, 0.1254902, 1, 1,
0.380449, -0.5155128, 1.519501, 0, 0.1176471, 1, 1,
0.3933518, -0.008255418, 2.716279, 0, 0.1137255, 1, 1,
0.3965271, -0.8764436, 3.600012, 0, 0.1058824, 1, 1,
0.4007532, -0.918134, 2.926891, 0, 0.09803922, 1, 1,
0.4021182, 1.098468, 0.06769215, 0, 0.09411765, 1, 1,
0.405554, -0.5761173, 3.363037, 0, 0.08627451, 1, 1,
0.4075955, 0.09629673, 1.065052, 0, 0.08235294, 1, 1,
0.4113613, 1.712877, -1.823683, 0, 0.07450981, 1, 1,
0.4117212, 1.034806, 0.1419675, 0, 0.07058824, 1, 1,
0.4152169, -0.9333332, 3.275418, 0, 0.0627451, 1, 1,
0.4203556, -0.1045245, 0.422977, 0, 0.05882353, 1, 1,
0.4215, 0.9110273, -1.191295, 0, 0.05098039, 1, 1,
0.4238752, -0.3254495, 2.75498, 0, 0.04705882, 1, 1,
0.426871, -1.28925, 2.162977, 0, 0.03921569, 1, 1,
0.4283264, -0.2504369, 1.181881, 0, 0.03529412, 1, 1,
0.4314436, 0.6340154, 0.4379838, 0, 0.02745098, 1, 1,
0.431485, -1.197526, 2.548443, 0, 0.02352941, 1, 1,
0.4328894, 0.03769053, 1.440665, 0, 0.01568628, 1, 1,
0.4340388, -0.3594286, 3.03155, 0, 0.01176471, 1, 1,
0.4373581, 1.528969, -0.5782478, 0, 0.003921569, 1, 1,
0.441597, -0.1378116, 3.62388, 0.003921569, 0, 1, 1,
0.4416221, -0.5858961, 1.8933, 0.007843138, 0, 1, 1,
0.4439427, -0.07200009, 2.127295, 0.01568628, 0, 1, 1,
0.4472112, -0.6350539, 2.802661, 0.01960784, 0, 1, 1,
0.4473982, -0.4332545, 2.45825, 0.02745098, 0, 1, 1,
0.4566419, 0.2379565, 1.30685, 0.03137255, 0, 1, 1,
0.4592063, 1.467757, -0.3833539, 0.03921569, 0, 1, 1,
0.4600426, 1.902145, 0.4545611, 0.04313726, 0, 1, 1,
0.4627936, -0.2169418, 1.296944, 0.05098039, 0, 1, 1,
0.468324, -0.1173972, 1.167144, 0.05490196, 0, 1, 1,
0.476325, 1.78691, 0.3829445, 0.0627451, 0, 1, 1,
0.4764373, -0.2194349, 2.708674, 0.06666667, 0, 1, 1,
0.4800054, -0.9972762, 4.416993, 0.07450981, 0, 1, 1,
0.48019, 0.2380981, 2.049959, 0.07843138, 0, 1, 1,
0.4807005, 0.2176402, 0.5872028, 0.08627451, 0, 1, 1,
0.481499, 0.4321029, 0.8415129, 0.09019608, 0, 1, 1,
0.4837793, 0.9902828, -0.5788631, 0.09803922, 0, 1, 1,
0.4859652, -0.3618391, 1.784673, 0.1058824, 0, 1, 1,
0.4951471, -0.8315515, 3.228819, 0.1098039, 0, 1, 1,
0.4991719, -0.5119419, 2.405096, 0.1176471, 0, 1, 1,
0.5010586, -0.1978133, 1.728232, 0.1215686, 0, 1, 1,
0.503925, 0.3355498, 0.8215197, 0.1294118, 0, 1, 1,
0.5108836, 0.8600342, -1.855751, 0.1333333, 0, 1, 1,
0.5137023, 0.7492305, -0.9841032, 0.1411765, 0, 1, 1,
0.5167554, 0.4523826, 0.812121, 0.145098, 0, 1, 1,
0.5174082, -0.04403429, 2.962085, 0.1529412, 0, 1, 1,
0.5223866, -1.35072, 3.520152, 0.1568628, 0, 1, 1,
0.5260171, 1.837735, -0.001682254, 0.1647059, 0, 1, 1,
0.526095, 0.6037902, 0.7771354, 0.1686275, 0, 1, 1,
0.5312808, 0.7478758, 1.738319, 0.1764706, 0, 1, 1,
0.5326329, 1.245451, 1.050042, 0.1803922, 0, 1, 1,
0.5360849, -1.432066, 2.831923, 0.1882353, 0, 1, 1,
0.5405447, 0.06688659, 2.700243, 0.1921569, 0, 1, 1,
0.5444883, 1.413333, -0.5268952, 0.2, 0, 1, 1,
0.5481768, -1.049272, 3.464275, 0.2078431, 0, 1, 1,
0.5518606, 1.263153, -0.6491811, 0.2117647, 0, 1, 1,
0.5549589, 0.438157, 0.8273441, 0.2196078, 0, 1, 1,
0.5585096, -0.8390704, 2.964408, 0.2235294, 0, 1, 1,
0.559146, -0.7383711, 2.954343, 0.2313726, 0, 1, 1,
0.5629899, 1.038489, 0.3156739, 0.2352941, 0, 1, 1,
0.5635551, -0.6488887, 2.735765, 0.2431373, 0, 1, 1,
0.5643412, -0.8803743, 1.736202, 0.2470588, 0, 1, 1,
0.5669786, 0.1196446, 0.9399131, 0.254902, 0, 1, 1,
0.5687477, -0.5451311, 3.573079, 0.2588235, 0, 1, 1,
0.5733047, -0.9122759, 3.446421, 0.2666667, 0, 1, 1,
0.5746128, -0.07775681, 2.369354, 0.2705882, 0, 1, 1,
0.5748348, -1.551976, 2.42088, 0.2784314, 0, 1, 1,
0.5751891, -1.8911, 1.837287, 0.282353, 0, 1, 1,
0.5777942, 0.9197385, 1.436563, 0.2901961, 0, 1, 1,
0.5794615, 1.295933, 0.70735, 0.2941177, 0, 1, 1,
0.5820371, -1.197772, 1.76474, 0.3019608, 0, 1, 1,
0.586226, 0.5732254, 1.436549, 0.3098039, 0, 1, 1,
0.5868994, -2.539632, 2.320615, 0.3137255, 0, 1, 1,
0.5890802, -1.600049, 3.279663, 0.3215686, 0, 1, 1,
0.5902185, 0.2130662, 1.744201, 0.3254902, 0, 1, 1,
0.5959731, -0.78793, 1.626127, 0.3333333, 0, 1, 1,
0.6094546, -1.040779, 3.313616, 0.3372549, 0, 1, 1,
0.6139085, 0.8221759, 1.119282, 0.345098, 0, 1, 1,
0.6166794, -0.1377518, 1.38271, 0.3490196, 0, 1, 1,
0.6195812, -0.758957, 2.991914, 0.3568628, 0, 1, 1,
0.623742, 1.811281, 0.209299, 0.3607843, 0, 1, 1,
0.6245604, 0.751148, -0.002299204, 0.3686275, 0, 1, 1,
0.6293187, -0.305855, 2.597927, 0.372549, 0, 1, 1,
0.6317629, -0.4026049, 3.378038, 0.3803922, 0, 1, 1,
0.6350141, -0.1250385, 1.386136, 0.3843137, 0, 1, 1,
0.6389843, -0.03671061, 3.108378, 0.3921569, 0, 1, 1,
0.6477844, -0.9683638, 3.957007, 0.3960784, 0, 1, 1,
0.6625729, 1.157762, 1.486473, 0.4039216, 0, 1, 1,
0.6652318, 0.2430141, -0.2039213, 0.4117647, 0, 1, 1,
0.6680261, -1.007201, 2.526667, 0.4156863, 0, 1, 1,
0.6688889, -0.06492536, 0.9778398, 0.4235294, 0, 1, 1,
0.6718581, 0.7175018, 1.146457, 0.427451, 0, 1, 1,
0.6753287, 0.3085286, 0.7243143, 0.4352941, 0, 1, 1,
0.6784926, -1.756468, 3.651077, 0.4392157, 0, 1, 1,
0.6844934, -0.6918776, 0.9985403, 0.4470588, 0, 1, 1,
0.69357, -0.01710302, 0.6570613, 0.4509804, 0, 1, 1,
0.6993678, 0.7335863, 0.03226876, 0.4588235, 0, 1, 1,
0.700398, 0.9781587, -1.408751, 0.4627451, 0, 1, 1,
0.7013787, 0.4489445, 1.815609, 0.4705882, 0, 1, 1,
0.7039453, -0.4733817, 4.270723, 0.4745098, 0, 1, 1,
0.7054507, -0.9565759, 2.43675, 0.4823529, 0, 1, 1,
0.7073846, 0.6261999, 2.331851, 0.4862745, 0, 1, 1,
0.7089056, -0.6995988, 3.688983, 0.4941176, 0, 1, 1,
0.7120591, 1.445116, -1.637935, 0.5019608, 0, 1, 1,
0.7172059, -1.844181, 3.170688, 0.5058824, 0, 1, 1,
0.7179681, 0.5280894, -1.047085, 0.5137255, 0, 1, 1,
0.7194146, 0.157989, 1.426509, 0.5176471, 0, 1, 1,
0.7262558, -1.216694, -0.8629807, 0.5254902, 0, 1, 1,
0.7283192, 1.196554, 0.555424, 0.5294118, 0, 1, 1,
0.7320681, -0.9919583, 1.310686, 0.5372549, 0, 1, 1,
0.7323649, -1.337418, 4.208572, 0.5411765, 0, 1, 1,
0.7326892, -0.6745174, 1.809203, 0.5490196, 0, 1, 1,
0.7343001, -0.101093, 2.050976, 0.5529412, 0, 1, 1,
0.7375568, -0.4725748, 2.435449, 0.5607843, 0, 1, 1,
0.7375939, -0.897028, 1.692408, 0.5647059, 0, 1, 1,
0.7408873, 0.2802926, 0.1188492, 0.572549, 0, 1, 1,
0.7476177, -0.5646423, 0.6026467, 0.5764706, 0, 1, 1,
0.7526334, -0.1293285, 4.376555, 0.5843138, 0, 1, 1,
0.7572851, -0.4575274, 3.094567, 0.5882353, 0, 1, 1,
0.7575967, 0.02374637, 0.8307458, 0.5960785, 0, 1, 1,
0.7670732, 0.03678519, 0.1434241, 0.6039216, 0, 1, 1,
0.7765834, 2.391861, 1.028048, 0.6078432, 0, 1, 1,
0.7814525, -2.679606, 1.415925, 0.6156863, 0, 1, 1,
0.7917411, 1.14866, 0.4163847, 0.6196079, 0, 1, 1,
0.7928175, 0.4301216, 0.9689994, 0.627451, 0, 1, 1,
0.7946787, -0.1149031, 0.4306781, 0.6313726, 0, 1, 1,
0.7977301, 1.231532, -0.9168507, 0.6392157, 0, 1, 1,
0.8005669, -0.9360409, 2.519561, 0.6431373, 0, 1, 1,
0.8016286, -1.587593, 2.538852, 0.6509804, 0, 1, 1,
0.8036412, 0.2231276, 0.4287279, 0.654902, 0, 1, 1,
0.8156088, 0.4332923, 2.728024, 0.6627451, 0, 1, 1,
0.8236896, 0.1781644, 2.315018, 0.6666667, 0, 1, 1,
0.8247349, -0.5192763, 2.983992, 0.6745098, 0, 1, 1,
0.8256344, -1.034709, 2.320737, 0.6784314, 0, 1, 1,
0.8258378, 1.850086, 0.9872919, 0.6862745, 0, 1, 1,
0.8316072, -0.3863598, 1.672766, 0.6901961, 0, 1, 1,
0.8336726, -0.1718435, 1.292456, 0.6980392, 0, 1, 1,
0.83499, -0.01620018, 1.304908, 0.7058824, 0, 1, 1,
0.8352515, 0.1867742, -0.06133914, 0.7098039, 0, 1, 1,
0.8391327, 0.51309, 0.2174981, 0.7176471, 0, 1, 1,
0.8400359, 0.8221939, 0.796704, 0.7215686, 0, 1, 1,
0.8423213, -1.025196, 2.553802, 0.7294118, 0, 1, 1,
0.8573294, -0.6409887, 0.04573207, 0.7333333, 0, 1, 1,
0.8579732, 0.9617686, 2.146449, 0.7411765, 0, 1, 1,
0.8582655, 0.7701538, 2.747942, 0.7450981, 0, 1, 1,
0.862711, 0.5127783, 2.118849, 0.7529412, 0, 1, 1,
0.8643505, 1.303775, 0.8810225, 0.7568628, 0, 1, 1,
0.8727764, -0.9756295, 2.246795, 0.7647059, 0, 1, 1,
0.8784923, -0.4485302, 0.578397, 0.7686275, 0, 1, 1,
0.8802675, -0.6403104, 1.503436, 0.7764706, 0, 1, 1,
0.8806624, 1.189235, 0.9272327, 0.7803922, 0, 1, 1,
0.8827718, -0.9499748, 0.7332451, 0.7882353, 0, 1, 1,
0.882964, 1.593322, 1.7463, 0.7921569, 0, 1, 1,
0.8895175, 1.129931, 1.782813, 0.8, 0, 1, 1,
0.895774, 0.4555759, 1.658339, 0.8078431, 0, 1, 1,
0.896304, -0.2862115, 2.585, 0.8117647, 0, 1, 1,
0.8974438, 0.6965444, 0.5702145, 0.8196079, 0, 1, 1,
0.8980442, 0.7858506, 0.5023763, 0.8235294, 0, 1, 1,
0.8980784, 0.8122962, 1.380532, 0.8313726, 0, 1, 1,
0.8992975, -1.122435, 2.396458, 0.8352941, 0, 1, 1,
0.8995966, -0.593123, 3.792424, 0.8431373, 0, 1, 1,
0.9005602, 0.4127471, 1.767962, 0.8470588, 0, 1, 1,
0.9019685, -1.049112, 3.005445, 0.854902, 0, 1, 1,
0.9057378, 1.819527, 0.9782296, 0.8588235, 0, 1, 1,
0.9118068, -1.443724, 0.9764069, 0.8666667, 0, 1, 1,
0.9183944, 0.2935054, 3.364197, 0.8705882, 0, 1, 1,
0.9197673, 0.4279619, 1.631435, 0.8784314, 0, 1, 1,
0.9354944, -0.2951511, 3.496304, 0.8823529, 0, 1, 1,
0.9361336, -0.802679, 3.068807, 0.8901961, 0, 1, 1,
0.9465796, -1.739126, 4.560976, 0.8941177, 0, 1, 1,
0.9474798, -0.6968933, 1.293898, 0.9019608, 0, 1, 1,
0.956616, -0.3942107, 3.007308, 0.9098039, 0, 1, 1,
0.9575967, 0.5353752, 0.3481424, 0.9137255, 0, 1, 1,
0.9609496, 0.05787605, 1.773012, 0.9215686, 0, 1, 1,
0.9625773, -0.3098337, 1.056589, 0.9254902, 0, 1, 1,
0.9649324, -0.3243732, 0.2321648, 0.9333333, 0, 1, 1,
0.9679976, 0.1141646, 3.391323, 0.9372549, 0, 1, 1,
0.9690829, 0.1610578, -0.221557, 0.945098, 0, 1, 1,
0.9692362, 1.285738, 1.162336, 0.9490196, 0, 1, 1,
0.9760926, 1.0214, 0.1322194, 0.9568627, 0, 1, 1,
0.9776297, -0.2227757, 0.9932793, 0.9607843, 0, 1, 1,
0.9816979, 0.6066121, 0.7941176, 0.9686275, 0, 1, 1,
0.9837419, 0.3555477, 2.27956, 0.972549, 0, 1, 1,
0.987655, 1.195161, 2.148834, 0.9803922, 0, 1, 1,
0.9892651, 1.436187, -0.2615578, 0.9843137, 0, 1, 1,
0.9953519, 1.667069, 0.4229512, 0.9921569, 0, 1, 1,
0.9970308, 0.271545, 2.39148, 0.9960784, 0, 1, 1,
1.000832, 0.3775601, 0.665413, 1, 0, 0.9960784, 1,
1.017009, -0.8885631, 1.428855, 1, 0, 0.9882353, 1,
1.019971, 0.6801557, 2.68723, 1, 0, 0.9843137, 1,
1.021856, -0.7352486, 2.624958, 1, 0, 0.9764706, 1,
1.03013, -1.122244, 2.436229, 1, 0, 0.972549, 1,
1.0324, 0.5653207, 1.763568, 1, 0, 0.9647059, 1,
1.035944, 1.272057, 0.9664096, 1, 0, 0.9607843, 1,
1.044673, 0.1229827, 0.2396825, 1, 0, 0.9529412, 1,
1.046305, 0.3338606, 2.306847, 1, 0, 0.9490196, 1,
1.046924, -0.8312091, 1.807856, 1, 0, 0.9411765, 1,
1.047664, -1.190117, 3.668122, 1, 0, 0.9372549, 1,
1.049689, 1.085094, 1.820333, 1, 0, 0.9294118, 1,
1.050987, -1.350142, 2.222296, 1, 0, 0.9254902, 1,
1.054389, 0.5548957, -0.3327158, 1, 0, 0.9176471, 1,
1.064817, -0.359778, 3.037608, 1, 0, 0.9137255, 1,
1.066268, 0.3003476, 0.4709459, 1, 0, 0.9058824, 1,
1.069952, 1.921132, -0.07723156, 1, 0, 0.9019608, 1,
1.070148, 0.9903877, 0.2499387, 1, 0, 0.8941177, 1,
1.073326, -0.04667614, 2.837003, 1, 0, 0.8862745, 1,
1.075722, -0.3065187, 1.192554, 1, 0, 0.8823529, 1,
1.083849, 1.299073, 1.7526, 1, 0, 0.8745098, 1,
1.084713, -0.3690845, 2.134101, 1, 0, 0.8705882, 1,
1.086648, 0.8391372, -0.02924836, 1, 0, 0.8627451, 1,
1.093358, -0.2538934, 2.995971, 1, 0, 0.8588235, 1,
1.09911, -0.0539563, 0.8505667, 1, 0, 0.8509804, 1,
1.104284, 0.7054959, 1.203813, 1, 0, 0.8470588, 1,
1.109038, 0.9979701, -0.02427409, 1, 0, 0.8392157, 1,
1.111862, 1.023361, 1.42746, 1, 0, 0.8352941, 1,
1.11386, -1.184443, 1.634582, 1, 0, 0.827451, 1,
1.122263, -0.0471607, 3.331619, 1, 0, 0.8235294, 1,
1.135039, 2.858968, 2.575691, 1, 0, 0.8156863, 1,
1.140057, -0.2262428, 2.979927, 1, 0, 0.8117647, 1,
1.14132, -1.352341, 4.125782, 1, 0, 0.8039216, 1,
1.141638, 2.300694, -0.8180098, 1, 0, 0.7960784, 1,
1.145078, 0.08169761, 1.735831, 1, 0, 0.7921569, 1,
1.145581, 0.5889548, 2.403736, 1, 0, 0.7843137, 1,
1.145754, -1.986768, 2.040625, 1, 0, 0.7803922, 1,
1.148671, -1.047319, 3.872247, 1, 0, 0.772549, 1,
1.152709, -0.1573492, 1.701462, 1, 0, 0.7686275, 1,
1.160792, -0.1114442, 2.300663, 1, 0, 0.7607843, 1,
1.162657, -1.248208, 0.9143645, 1, 0, 0.7568628, 1,
1.163469, 0.3851306, 0.8832998, 1, 0, 0.7490196, 1,
1.165853, -0.9757508, 1.475088, 1, 0, 0.7450981, 1,
1.167796, -0.1156364, 2.623762, 1, 0, 0.7372549, 1,
1.17467, 1.588874, 2.089983, 1, 0, 0.7333333, 1,
1.17672, -0.1885359, 1.623019, 1, 0, 0.7254902, 1,
1.178798, 1.965426, -0.6026244, 1, 0, 0.7215686, 1,
1.182206, 0.2200114, 0.8621738, 1, 0, 0.7137255, 1,
1.184112, 0.8598976, 0.9909359, 1, 0, 0.7098039, 1,
1.188389, -0.9107522, 2.254058, 1, 0, 0.7019608, 1,
1.194264, -0.4955978, 0.9548073, 1, 0, 0.6941177, 1,
1.199647, -0.9682191, 0.8902903, 1, 0, 0.6901961, 1,
1.200923, -1.891177, 3.234832, 1, 0, 0.682353, 1,
1.214426, 0.4358865, 0.6206787, 1, 0, 0.6784314, 1,
1.21461, -0.1742832, 2.406128, 1, 0, 0.6705883, 1,
1.21735, -1.539555, 2.660894, 1, 0, 0.6666667, 1,
1.2184, -0.3302559, 2.30575, 1, 0, 0.6588235, 1,
1.235677, 0.0439215, -0.7765818, 1, 0, 0.654902, 1,
1.240638, -0.9845401, 2.615919, 1, 0, 0.6470588, 1,
1.242964, -0.1532856, 1.410356, 1, 0, 0.6431373, 1,
1.243234, -0.8748172, 1.123908, 1, 0, 0.6352941, 1,
1.246973, 0.3809572, 1.61639, 1, 0, 0.6313726, 1,
1.250246, 0.01375882, 0.1252854, 1, 0, 0.6235294, 1,
1.251395, -1.131735, 2.974483, 1, 0, 0.6196079, 1,
1.252136, 0.2323093, 1.775992, 1, 0, 0.6117647, 1,
1.25978, 2.340403, 0.1373776, 1, 0, 0.6078432, 1,
1.263532, 1.294167, 1.190293, 1, 0, 0.6, 1,
1.273267, 0.8750659, 1.124003, 1, 0, 0.5921569, 1,
1.277129, 0.9170825, 2.040741, 1, 0, 0.5882353, 1,
1.278813, -0.8262985, 2.563481, 1, 0, 0.5803922, 1,
1.281194, -1.317399, 2.935421, 1, 0, 0.5764706, 1,
1.294836, -1.305457, 2.092052, 1, 0, 0.5686275, 1,
1.302288, 0.9214665, -0.6077588, 1, 0, 0.5647059, 1,
1.302842, -0.5626194, 1.726325, 1, 0, 0.5568628, 1,
1.31986, -0.2888972, 2.577941, 1, 0, 0.5529412, 1,
1.332317, -1.29156, 2.848563, 1, 0, 0.5450981, 1,
1.335727, -0.8865604, 2.970282, 1, 0, 0.5411765, 1,
1.342876, 0.9174449, 0.532562, 1, 0, 0.5333334, 1,
1.347623, -0.3975285, 1.521572, 1, 0, 0.5294118, 1,
1.362451, 1.612867, -0.3303403, 1, 0, 0.5215687, 1,
1.381915, 0.1636628, 1.683784, 1, 0, 0.5176471, 1,
1.383242, -0.6222875, 0.3405728, 1, 0, 0.509804, 1,
1.383684, 0.3658191, 2.558466, 1, 0, 0.5058824, 1,
1.385974, 2.210672, -1.677432, 1, 0, 0.4980392, 1,
1.387621, -0.6571883, 1.934197, 1, 0, 0.4901961, 1,
1.388945, -0.3685049, 2.188658, 1, 0, 0.4862745, 1,
1.393242, -0.2588093, 0.6663956, 1, 0, 0.4784314, 1,
1.399033, -0.02668415, 2.578536, 1, 0, 0.4745098, 1,
1.400343, -0.2522303, 2.320492, 1, 0, 0.4666667, 1,
1.404992, 1.689303, -0.5677326, 1, 0, 0.4627451, 1,
1.405927, 0.2118268, 1.269366, 1, 0, 0.454902, 1,
1.412452, 0.5443418, 2.820206, 1, 0, 0.4509804, 1,
1.425287, -0.2923184, 3.082795, 1, 0, 0.4431373, 1,
1.446333, -0.20529, 1.760675, 1, 0, 0.4392157, 1,
1.454527, -1.136155, 2.692336, 1, 0, 0.4313726, 1,
1.459072, -1.311482, 1.816537, 1, 0, 0.427451, 1,
1.465024, -0.5794449, 1.964435, 1, 0, 0.4196078, 1,
1.477515, 1.033901, 0.5567734, 1, 0, 0.4156863, 1,
1.494936, -0.3866117, 1.809317, 1, 0, 0.4078431, 1,
1.501665, 1.082609, 1.098916, 1, 0, 0.4039216, 1,
1.503253, 0.1714217, 0.4718628, 1, 0, 0.3960784, 1,
1.521321, 0.8988824, -0.02641453, 1, 0, 0.3882353, 1,
1.524822, -0.5327184, 1.128616, 1, 0, 0.3843137, 1,
1.52794, -0.7456554, -0.6094449, 1, 0, 0.3764706, 1,
1.528164, -2.041954, 3.898893, 1, 0, 0.372549, 1,
1.536183, 1.057168, 0.4214348, 1, 0, 0.3647059, 1,
1.54015, -0.009381943, 1.178637, 1, 0, 0.3607843, 1,
1.570864, -0.5437746, 1.740988, 1, 0, 0.3529412, 1,
1.578384, 1.710564, 1.960317, 1, 0, 0.3490196, 1,
1.585927, -0.3263164, 1.109189, 1, 0, 0.3411765, 1,
1.591357, 0.9251111, 1.869209, 1, 0, 0.3372549, 1,
1.599687, -0.1353144, 1.885152, 1, 0, 0.3294118, 1,
1.612127, -0.3279464, 2.359301, 1, 0, 0.3254902, 1,
1.612985, 1.193298, 0.795304, 1, 0, 0.3176471, 1,
1.62725, -1.195065, 2.553906, 1, 0, 0.3137255, 1,
1.64845, -0.4248889, 1.86595, 1, 0, 0.3058824, 1,
1.651693, -0.1557616, 3.600122, 1, 0, 0.2980392, 1,
1.657547, 1.063267, 0.3888044, 1, 0, 0.2941177, 1,
1.657916, 0.1751401, 0.9171321, 1, 0, 0.2862745, 1,
1.666025, -1.858833, 2.418602, 1, 0, 0.282353, 1,
1.669951, 1.271783, 1.209265, 1, 0, 0.2745098, 1,
1.696964, -0.1713691, 0.6756961, 1, 0, 0.2705882, 1,
1.718599, -0.7794966, 3.683639, 1, 0, 0.2627451, 1,
1.745281, -0.3383085, 2.554861, 1, 0, 0.2588235, 1,
1.74715, 0.05129241, 1.337533, 1, 0, 0.2509804, 1,
1.773116, -0.5306624, 1.522409, 1, 0, 0.2470588, 1,
1.775736, -0.05871788, 0.2556348, 1, 0, 0.2392157, 1,
1.779759, -0.2384089, 0.6872969, 1, 0, 0.2352941, 1,
1.782495, 1.579293, 0.9155471, 1, 0, 0.227451, 1,
1.790337, -1.42448, 1.627641, 1, 0, 0.2235294, 1,
1.791682, 1.04162, 3.22168, 1, 0, 0.2156863, 1,
1.800336, -0.6233279, 3.052237, 1, 0, 0.2117647, 1,
1.809113, -0.923272, 3.520716, 1, 0, 0.2039216, 1,
1.82474, -1.76561, 2.22355, 1, 0, 0.1960784, 1,
1.828104, -0.7827193, 1.774598, 1, 0, 0.1921569, 1,
1.842999, 0.6773676, -0.9907091, 1, 0, 0.1843137, 1,
1.844036, -1.598179, 1.422757, 1, 0, 0.1803922, 1,
1.851172, 2.152097, 0.6897136, 1, 0, 0.172549, 1,
1.868647, 1.047861, -0.596511, 1, 0, 0.1686275, 1,
1.871571, -0.2206933, 2.351329, 1, 0, 0.1607843, 1,
1.917946, 0.1951567, 2.891007, 1, 0, 0.1568628, 1,
1.92792, 0.5527201, 2.217262, 1, 0, 0.1490196, 1,
1.931527, 1.481412, -0.2527015, 1, 0, 0.145098, 1,
1.978582, -0.3575667, 0.6266588, 1, 0, 0.1372549, 1,
1.9877, -1.755651, 2.094706, 1, 0, 0.1333333, 1,
2.024829, 1.524509, 3.042838, 1, 0, 0.1254902, 1,
2.045247, -1.724986, 2.961268, 1, 0, 0.1215686, 1,
2.061713, -0.5769209, 2.019438, 1, 0, 0.1137255, 1,
2.072576, -0.8866748, 0.2982555, 1, 0, 0.1098039, 1,
2.081315, -2.021735, 1.995194, 1, 0, 0.1019608, 1,
2.114786, 1.88092, 0.5347769, 1, 0, 0.09411765, 1,
2.174797, 0.3848368, 3.139427, 1, 0, 0.09019608, 1,
2.195807, 0.3825159, 0.4208633, 1, 0, 0.08235294, 1,
2.216718, -0.2440293, 1.897762, 1, 0, 0.07843138, 1,
2.221246, -0.4470502, 0.7369308, 1, 0, 0.07058824, 1,
2.23013, 1.4546, 0.9971988, 1, 0, 0.06666667, 1,
2.235372, -1.971802, 4.391729, 1, 0, 0.05882353, 1,
2.276088, -1.223186, -0.3771899, 1, 0, 0.05490196, 1,
2.301033, 0.05783688, 1.554181, 1, 0, 0.04705882, 1,
2.343188, -0.2994531, 1.680145, 1, 0, 0.04313726, 1,
2.363835, -1.239202, 1.799304, 1, 0, 0.03529412, 1,
2.419379, -1.157913, 0.5033897, 1, 0, 0.03137255, 1,
2.610477, 0.6202323, 0.177215, 1, 0, 0.02352941, 1,
2.622646, -1.04131, 4.049757, 1, 0, 0.01960784, 1,
3.269752, 0.3627416, 2.515487, 1, 0, 0.01176471, 1,
3.504312, -0.05331669, 0.9095672, 1, 0, 0.007843138, 1
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
-0.109208, -5.501352, -7.769606, 0, -0.5, 0.5, 0.5,
-0.109208, -5.501352, -7.769606, 1, -0.5, 0.5, 0.5,
-0.109208, -5.501352, -7.769606, 1, 1.5, 0.5, 0.5,
-0.109208, -5.501352, -7.769606, 0, 1.5, 0.5, 0.5
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
-4.947711, 0.1277769, -7.769606, 0, -0.5, 0.5, 0.5,
-4.947711, 0.1277769, -7.769606, 1, -0.5, 0.5, 0.5,
-4.947711, 0.1277769, -7.769606, 1, 1.5, 0.5, 0.5,
-4.947711, 0.1277769, -7.769606, 0, 1.5, 0.5, 0.5
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
-4.947711, -5.501352, -0.1772051, 0, -0.5, 0.5, 0.5,
-4.947711, -5.501352, -0.1772051, 1, -0.5, 0.5, 0.5,
-4.947711, -5.501352, -0.1772051, 1, 1.5, 0.5, 0.5,
-4.947711, -5.501352, -0.1772051, 0, 1.5, 0.5, 0.5
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
-2, -4.202322, -6.017513,
2, -4.202322, -6.017513,
-2, -4.202322, -6.017513,
-2, -4.418827, -6.309529,
0, -4.202322, -6.017513,
0, -4.418827, -6.309529,
2, -4.202322, -6.017513,
2, -4.418827, -6.309529
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
"-2",
"0",
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
-2, -4.851837, -6.893559, 0, -0.5, 0.5, 0.5,
-2, -4.851837, -6.893559, 1, -0.5, 0.5, 0.5,
-2, -4.851837, -6.893559, 1, 1.5, 0.5, 0.5,
-2, -4.851837, -6.893559, 0, 1.5, 0.5, 0.5,
0, -4.851837, -6.893559, 0, -0.5, 0.5, 0.5,
0, -4.851837, -6.893559, 1, -0.5, 0.5, 0.5,
0, -4.851837, -6.893559, 1, 1.5, 0.5, 0.5,
0, -4.851837, -6.893559, 0, 1.5, 0.5, 0.5,
2, -4.851837, -6.893559, 0, -0.5, 0.5, 0.5,
2, -4.851837, -6.893559, 1, -0.5, 0.5, 0.5,
2, -4.851837, -6.893559, 1, 1.5, 0.5, 0.5,
2, -4.851837, -6.893559, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.831133, -4, -6.017513,
-3.831133, 4, -6.017513,
-3.831133, -4, -6.017513,
-4.01723, -4, -6.309529,
-3.831133, -2, -6.017513,
-4.01723, -2, -6.309529,
-3.831133, 0, -6.017513,
-4.01723, 0, -6.309529,
-3.831133, 2, -6.017513,
-4.01723, 2, -6.309529,
-3.831133, 4, -6.017513,
-4.01723, 4, -6.309529
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
"-4",
"-2",
"0",
"2",
"4"
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
-4.389422, -4, -6.893559, 0, -0.5, 0.5, 0.5,
-4.389422, -4, -6.893559, 1, -0.5, 0.5, 0.5,
-4.389422, -4, -6.893559, 1, 1.5, 0.5, 0.5,
-4.389422, -4, -6.893559, 0, 1.5, 0.5, 0.5,
-4.389422, -2, -6.893559, 0, -0.5, 0.5, 0.5,
-4.389422, -2, -6.893559, 1, -0.5, 0.5, 0.5,
-4.389422, -2, -6.893559, 1, 1.5, 0.5, 0.5,
-4.389422, -2, -6.893559, 0, 1.5, 0.5, 0.5,
-4.389422, 0, -6.893559, 0, -0.5, 0.5, 0.5,
-4.389422, 0, -6.893559, 1, -0.5, 0.5, 0.5,
-4.389422, 0, -6.893559, 1, 1.5, 0.5, 0.5,
-4.389422, 0, -6.893559, 0, 1.5, 0.5, 0.5,
-4.389422, 2, -6.893559, 0, -0.5, 0.5, 0.5,
-4.389422, 2, -6.893559, 1, -0.5, 0.5, 0.5,
-4.389422, 2, -6.893559, 1, 1.5, 0.5, 0.5,
-4.389422, 2, -6.893559, 0, 1.5, 0.5, 0.5,
-4.389422, 4, -6.893559, 0, -0.5, 0.5, 0.5,
-4.389422, 4, -6.893559, 1, -0.5, 0.5, 0.5,
-4.389422, 4, -6.893559, 1, 1.5, 0.5, 0.5,
-4.389422, 4, -6.893559, 0, 1.5, 0.5, 0.5
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
-3.831133, -4.202322, -4,
-3.831133, -4.202322, 4,
-3.831133, -4.202322, -4,
-4.01723, -4.418827, -4,
-3.831133, -4.202322, -2,
-4.01723, -4.418827, -2,
-3.831133, -4.202322, 0,
-4.01723, -4.418827, 0,
-3.831133, -4.202322, 2,
-4.01723, -4.418827, 2,
-3.831133, -4.202322, 4,
-4.01723, -4.418827, 4
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
-4.389422, -4.851837, -4, 0, -0.5, 0.5, 0.5,
-4.389422, -4.851837, -4, 1, -0.5, 0.5, 0.5,
-4.389422, -4.851837, -4, 1, 1.5, 0.5, 0.5,
-4.389422, -4.851837, -4, 0, 1.5, 0.5, 0.5,
-4.389422, -4.851837, -2, 0, -0.5, 0.5, 0.5,
-4.389422, -4.851837, -2, 1, -0.5, 0.5, 0.5,
-4.389422, -4.851837, -2, 1, 1.5, 0.5, 0.5,
-4.389422, -4.851837, -2, 0, 1.5, 0.5, 0.5,
-4.389422, -4.851837, 0, 0, -0.5, 0.5, 0.5,
-4.389422, -4.851837, 0, 1, -0.5, 0.5, 0.5,
-4.389422, -4.851837, 0, 1, 1.5, 0.5, 0.5,
-4.389422, -4.851837, 0, 0, 1.5, 0.5, 0.5,
-4.389422, -4.851837, 2, 0, -0.5, 0.5, 0.5,
-4.389422, -4.851837, 2, 1, -0.5, 0.5, 0.5,
-4.389422, -4.851837, 2, 1, 1.5, 0.5, 0.5,
-4.389422, -4.851837, 2, 0, 1.5, 0.5, 0.5,
-4.389422, -4.851837, 4, 0, -0.5, 0.5, 0.5,
-4.389422, -4.851837, 4, 1, -0.5, 0.5, 0.5,
-4.389422, -4.851837, 4, 1, 1.5, 0.5, 0.5,
-4.389422, -4.851837, 4, 0, 1.5, 0.5, 0.5
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
-3.831133, -4.202322, -6.017513,
-3.831133, 4.457876, -6.017513,
-3.831133, -4.202322, 5.663103,
-3.831133, 4.457876, 5.663103,
-3.831133, -4.202322, -6.017513,
-3.831133, -4.202322, 5.663103,
-3.831133, 4.457876, -6.017513,
-3.831133, 4.457876, 5.663103,
-3.831133, -4.202322, -6.017513,
3.612717, -4.202322, -6.017513,
-3.831133, -4.202322, 5.663103,
3.612717, -4.202322, 5.663103,
-3.831133, 4.457876, -6.017513,
3.612717, 4.457876, -6.017513,
-3.831133, 4.457876, 5.663103,
3.612717, 4.457876, 5.663103,
3.612717, -4.202322, -6.017513,
3.612717, 4.457876, -6.017513,
3.612717, -4.202322, 5.663103,
3.612717, 4.457876, 5.663103,
3.612717, -4.202322, -6.017513,
3.612717, -4.202322, 5.663103,
3.612717, 4.457876, -6.017513,
3.612717, 4.457876, 5.663103
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
var radius = 8.72281;
var distance = 38.80877;
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
mvMatrix.translate( 0.109208, -0.1277769, 0.1772051 );
mvMatrix.scale( 1.266989, 1.089037, 0.8074294 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.80877);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
## Error in read.table("N-ethylsulfonyl-2-ni.xyz"): no lines available in input
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
-3.722728, 0.8453353, -2.250247, 0, 0, 1, 1, 1,
-2.912619, -0.24862, -2.023929, 1, 0, 0, 1, 1,
-2.860045, -0.1691935, -2.594513, 1, 0, 0, 1, 1,
-2.67163, -1.27203, -1.585008, 1, 0, 0, 1, 1,
-2.501856, -0.2956585, -0.8877408, 1, 0, 0, 1, 1,
-2.490519, -0.9306672, -2.255967, 1, 0, 0, 1, 1,
-2.408509, 0.4565355, -1.966454, 0, 0, 0, 1, 1,
-2.364215, 1.612782, -1.915823, 0, 0, 0, 1, 1,
-2.357601, 0.05556105, 0.07979406, 0, 0, 0, 1, 1,
-2.305252, -0.7334427, -0.6419715, 0, 0, 0, 1, 1,
-2.26739, -0.02091257, -2.321565, 0, 0, 0, 1, 1,
-2.267105, -0.1604987, -1.208915, 0, 0, 0, 1, 1,
-2.26683, 0.994791, -0.8581849, 0, 0, 0, 1, 1,
-2.262948, 0.8863596, -0.5600626, 1, 1, 1, 1, 1,
-2.199873, -1.715069, -3.136336, 1, 1, 1, 1, 1,
-2.196743, 1.582671, -0.3195895, 1, 1, 1, 1, 1,
-2.180675, 1.004696, -0.6451097, 1, 1, 1, 1, 1,
-2.170614, 0.04579674, -1.67269, 1, 1, 1, 1, 1,
-2.139202, 0.8098371, -0.150935, 1, 1, 1, 1, 1,
-2.092011, 0.3604651, -0.1649566, 1, 1, 1, 1, 1,
-2.0566, -0.5626084, -2.089137, 1, 1, 1, 1, 1,
-2.044264, 2.003442, -1.893992, 1, 1, 1, 1, 1,
-2.040098, 0.4496201, -1.03532, 1, 1, 1, 1, 1,
-2.03954, 0.3060328, -1.513108, 1, 1, 1, 1, 1,
-1.987857, 1.227931, 0.5361421, 1, 1, 1, 1, 1,
-1.977443, 0.6552184, -2.226883, 1, 1, 1, 1, 1,
-1.976976, -0.7966951, -0.9386286, 1, 1, 1, 1, 1,
-1.971246, -1.185088, -1.501157, 1, 1, 1, 1, 1,
-1.962668, 1.0162, -2.586696, 0, 0, 1, 1, 1,
-1.926901, 0.6141617, -1.660341, 1, 0, 0, 1, 1,
-1.92255, 2.255904, 0.06678695, 1, 0, 0, 1, 1,
-1.919791, -1.555197, -1.049073, 1, 0, 0, 1, 1,
-1.908007, -0.910801, -1.13305, 1, 0, 0, 1, 1,
-1.895466, 1.196911, -0.3683057, 1, 0, 0, 1, 1,
-1.885392, -1.374407, -2.032177, 0, 0, 0, 1, 1,
-1.884177, -0.4372957, -0.6469256, 0, 0, 0, 1, 1,
-1.861623, 0.6615077, 0.7370281, 0, 0, 0, 1, 1,
-1.859982, 0.2099142, -1.028023, 0, 0, 0, 1, 1,
-1.858217, 0.7518394, -1.821599, 0, 0, 0, 1, 1,
-1.81419, 1.339718, -1.162443, 0, 0, 0, 1, 1,
-1.793908, 1.422886, -0.8042002, 0, 0, 0, 1, 1,
-1.761155, 0.5481411, -2.242287, 1, 1, 1, 1, 1,
-1.755596, 0.2698708, -0.01608478, 1, 1, 1, 1, 1,
-1.744188, 4.331757, -1.631695, 1, 1, 1, 1, 1,
-1.741434, -0.3487162, -1.936871, 1, 1, 1, 1, 1,
-1.726013, 0.6173273, 0.2443658, 1, 1, 1, 1, 1,
-1.725425, 1.338361, 0.1246587, 1, 1, 1, 1, 1,
-1.724277, -1.541102, -2.676111, 1, 1, 1, 1, 1,
-1.708921, -0.6501712, -2.438236, 1, 1, 1, 1, 1,
-1.701369, -0.1646058, -0.8279883, 1, 1, 1, 1, 1,
-1.699082, -0.1411884, -0.03068214, 1, 1, 1, 1, 1,
-1.675876, 1.576255, -0.168051, 1, 1, 1, 1, 1,
-1.675155, -0.9433619, -2.295837, 1, 1, 1, 1, 1,
-1.658327, -0.4854214, -2.149, 1, 1, 1, 1, 1,
-1.645329, -1.309134, -0.7585464, 1, 1, 1, 1, 1,
-1.624073, -1.330351, -2.322491, 1, 1, 1, 1, 1,
-1.620828, -0.9243886, -1.60551, 0, 0, 1, 1, 1,
-1.603364, 0.5771772, -0.7672015, 1, 0, 0, 1, 1,
-1.584246, 0.07509897, -0.752, 1, 0, 0, 1, 1,
-1.58376, 0.1549661, -1.072209, 1, 0, 0, 1, 1,
-1.566138, -0.8311638, -0.6222379, 1, 0, 0, 1, 1,
-1.557611, 0.5234832, -1.98907, 1, 0, 0, 1, 1,
-1.557409, -0.2496065, -2.156276, 0, 0, 0, 1, 1,
-1.55668, 0.03468337, -1.512401, 0, 0, 0, 1, 1,
-1.552257, -0.2066394, -2.796345, 0, 0, 0, 1, 1,
-1.549359, 1.060037, -0.02150766, 0, 0, 0, 1, 1,
-1.54068, 0.8987947, -1.893016, 0, 0, 0, 1, 1,
-1.529736, 0.805593, -1.136716, 0, 0, 0, 1, 1,
-1.511107, -0.8671081, -1.658693, 0, 0, 0, 1, 1,
-1.508043, -1.199216, -1.027855, 1, 1, 1, 1, 1,
-1.499397, 0.7992266, -0.1993028, 1, 1, 1, 1, 1,
-1.492824, 0.6017671, 1.303617, 1, 1, 1, 1, 1,
-1.484088, -1.327278, -3.818772, 1, 1, 1, 1, 1,
-1.476391, 0.6628816, -1.23162, 1, 1, 1, 1, 1,
-1.47115, 0.9051746, -3.050511, 1, 1, 1, 1, 1,
-1.468562, -0.1822657, 0.6811891, 1, 1, 1, 1, 1,
-1.468404, 0.3562012, -2.750381, 1, 1, 1, 1, 1,
-1.467865, 0.6015658, 0.5318009, 1, 1, 1, 1, 1,
-1.460268, 1.067379, -2.614065, 1, 1, 1, 1, 1,
-1.453393, 0.8173692, -1.358552, 1, 1, 1, 1, 1,
-1.448084, -1.71594, -3.142372, 1, 1, 1, 1, 1,
-1.434343, 0.4094281, -0.9089937, 1, 1, 1, 1, 1,
-1.433254, -1.024456, -3.473006, 1, 1, 1, 1, 1,
-1.424653, -0.709826, -2.580485, 1, 1, 1, 1, 1,
-1.419197, -1.021403, -0.7227772, 0, 0, 1, 1, 1,
-1.411076, 0.6425837, -0.3890377, 1, 0, 0, 1, 1,
-1.396194, -0.2976823, -2.430519, 1, 0, 0, 1, 1,
-1.3892, -0.6028768, -1.369474, 1, 0, 0, 1, 1,
-1.382693, -1.11806, -1.356417, 1, 0, 0, 1, 1,
-1.379472, -1.059754, -0.7115057, 1, 0, 0, 1, 1,
-1.375453, -0.2957091, -2.383855, 0, 0, 0, 1, 1,
-1.373089, -0.1509196, -4.783176, 0, 0, 0, 1, 1,
-1.372565, -0.6924964, -1.225127, 0, 0, 0, 1, 1,
-1.363076, 0.5426096, -1.583511, 0, 0, 0, 1, 1,
-1.359689, -2.964242, -4.025254, 0, 0, 0, 1, 1,
-1.359524, 1.680402, -0.2702399, 0, 0, 0, 1, 1,
-1.355111, -0.5930383, -2.219217, 0, 0, 0, 1, 1,
-1.337782, 1.014865, -1.933164, 1, 1, 1, 1, 1,
-1.337075, 0.1256528, -0.3523292, 1, 1, 1, 1, 1,
-1.336718, 0.9089255, -0.1183613, 1, 1, 1, 1, 1,
-1.335777, -0.774572, -1.475489, 1, 1, 1, 1, 1,
-1.327711, 0.2835543, -2.299665, 1, 1, 1, 1, 1,
-1.327304, 0.275042, -1.278685, 1, 1, 1, 1, 1,
-1.322287, -0.04091662, -3.001096, 1, 1, 1, 1, 1,
-1.305062, 0.9222706, 0.6802115, 1, 1, 1, 1, 1,
-1.288703, -0.1105074, -0.9636524, 1, 1, 1, 1, 1,
-1.286831, 0.5190893, -0.5846952, 1, 1, 1, 1, 1,
-1.274218, 0.8589417, -2.057905, 1, 1, 1, 1, 1,
-1.262045, 0.5388811, -2.67048, 1, 1, 1, 1, 1,
-1.258324, 1.643043, -2.021483, 1, 1, 1, 1, 1,
-1.258272, 1.318659, -0.4204797, 1, 1, 1, 1, 1,
-1.247186, 1.389883, -2.075649, 1, 1, 1, 1, 1,
-1.223112, 0.258258, -1.550555, 0, 0, 1, 1, 1,
-1.221605, 0.2327494, -1.518441, 1, 0, 0, 1, 1,
-1.216516, -0.3201235, -0.5442814, 1, 0, 0, 1, 1,
-1.216366, 1.908549, 1.004447, 1, 0, 0, 1, 1,
-1.213389, 1.234257, -2.354226, 1, 0, 0, 1, 1,
-1.20284, 1.753086, -2.760788, 1, 0, 0, 1, 1,
-1.189245, 0.2426683, -1.138351, 0, 0, 0, 1, 1,
-1.183113, -2.193588, -1.602476, 0, 0, 0, 1, 1,
-1.157298, 0.4809409, -0.4471335, 0, 0, 0, 1, 1,
-1.156991, 0.1374384, -0.9300689, 0, 0, 0, 1, 1,
-1.156773, 0.1295045, -0.9446322, 0, 0, 0, 1, 1,
-1.155252, 0.9668165, -1.204824, 0, 0, 0, 1, 1,
-1.147386, 3.089968, -0.5998895, 0, 0, 0, 1, 1,
-1.139192, -0.4068088, -2.694977, 1, 1, 1, 1, 1,
-1.134482, -1.143083, -3.34668, 1, 1, 1, 1, 1,
-1.126153, -0.02562325, -2.589659, 1, 1, 1, 1, 1,
-1.119445, -0.5005215, -2.406574, 1, 1, 1, 1, 1,
-1.113838, 1.147132, -1.064705, 1, 1, 1, 1, 1,
-1.106447, -0.07282533, -1.303501, 1, 1, 1, 1, 1,
-1.103071, -0.6450618, -2.594316, 1, 1, 1, 1, 1,
-1.101772, -0.2087705, -2.522031, 1, 1, 1, 1, 1,
-1.093451, 0.6170368, -2.221054, 1, 1, 1, 1, 1,
-1.09326, -0.9823735, -3.766913, 1, 1, 1, 1, 1,
-1.092228, -0.8124468, -0.915885, 1, 1, 1, 1, 1,
-1.089871, 0.05580916, -2.68757, 1, 1, 1, 1, 1,
-1.088285, -0.4049881, -0.8394653, 1, 1, 1, 1, 1,
-1.082516, 2.335003, -0.3239816, 1, 1, 1, 1, 1,
-1.069201, 1.242794, -0.1996864, 1, 1, 1, 1, 1,
-1.064449, -0.1946729, -1.277709, 0, 0, 1, 1, 1,
-1.05856, -0.02363594, -1.102736, 1, 0, 0, 1, 1,
-1.055323, 1.399485, -1.425948, 1, 0, 0, 1, 1,
-1.049123, -0.1206648, -0.608672, 1, 0, 0, 1, 1,
-1.046733, -0.5077042, -3.945476, 1, 0, 0, 1, 1,
-1.032081, -1.718195, -3.736658, 1, 0, 0, 1, 1,
-1.02921, 0.6930869, -1.240765, 0, 0, 0, 1, 1,
-1.026821, -0.009277191, -0.510443, 0, 0, 0, 1, 1,
-1.022975, 0.1493275, -1.74718, 0, 0, 0, 1, 1,
-1.0191, 0.3215538, -0.4827381, 0, 0, 0, 1, 1,
-1.01667, -0.5709096, -2.977947, 0, 0, 0, 1, 1,
-1.015883, 0.5231975, -1.76547, 0, 0, 0, 1, 1,
-1.014753, -0.05429935, -2.734115, 0, 0, 0, 1, 1,
-1.010552, -0.8953184, -2.966538, 1, 1, 1, 1, 1,
-1.007385, 0.3948746, -1.157358, 1, 1, 1, 1, 1,
-0.9990686, 0.7365362, -2.472273, 1, 1, 1, 1, 1,
-0.9975734, 0.02508574, -1.229466, 1, 1, 1, 1, 1,
-0.9966068, -1.580841, -4.790435, 1, 1, 1, 1, 1,
-0.9944671, -0.5934301, -2.838523, 1, 1, 1, 1, 1,
-0.9715514, 1.465432, -0.1661001, 1, 1, 1, 1, 1,
-0.9676379, 0.7518385, -2.098257, 1, 1, 1, 1, 1,
-0.9660262, 1.289615, 1.010545, 1, 1, 1, 1, 1,
-0.9644496, 0.8355379, 0.8688453, 1, 1, 1, 1, 1,
-0.9627005, -1.413423, -0.4859084, 1, 1, 1, 1, 1,
-0.9582412, -0.1573285, -2.336223, 1, 1, 1, 1, 1,
-0.9565749, -0.2187238, -3.445468, 1, 1, 1, 1, 1,
-0.9504062, -0.642503, 0.2618268, 1, 1, 1, 1, 1,
-0.9456244, 0.937097, -1.375531, 1, 1, 1, 1, 1,
-0.9418703, 0.3164788, -1.084713, 0, 0, 1, 1, 1,
-0.9402499, -0.406748, -2.500267, 1, 0, 0, 1, 1,
-0.9321026, -1.658885, -0.3179616, 1, 0, 0, 1, 1,
-0.9196389, -1.172099, -2.403593, 1, 0, 0, 1, 1,
-0.918663, 0.5294758, -1.91675, 1, 0, 0, 1, 1,
-0.9178391, -0.9606714, -1.579885, 1, 0, 0, 1, 1,
-0.9126599, -2.074852, -3.134411, 0, 0, 0, 1, 1,
-0.9041963, -0.538963, -1.275823, 0, 0, 0, 1, 1,
-0.9028199, -1.134726, -3.099134, 0, 0, 0, 1, 1,
-0.8984538, 0.1128815, 0.252815, 0, 0, 0, 1, 1,
-0.8930843, -0.05326649, -1.440675, 0, 0, 0, 1, 1,
-0.8853329, 0.7423427, -0.7534682, 0, 0, 0, 1, 1,
-0.8829536, -0.1674068, -2.639598, 0, 0, 0, 1, 1,
-0.8790542, 0.5998926, -0.4023802, 1, 1, 1, 1, 1,
-0.8754745, -0.6082135, -3.147777, 1, 1, 1, 1, 1,
-0.8737344, -0.3807943, -0.7520624, 1, 1, 1, 1, 1,
-0.8722835, -1.377099, -4.016702, 1, 1, 1, 1, 1,
-0.8710225, -0.4759508, -2.985012, 1, 1, 1, 1, 1,
-0.8660135, -1.281043, -0.9550658, 1, 1, 1, 1, 1,
-0.8586007, -0.6017003, -3.300351, 1, 1, 1, 1, 1,
-0.8582293, -0.2646534, -1.80631, 1, 1, 1, 1, 1,
-0.8517936, -2.139013, -2.177383, 1, 1, 1, 1, 1,
-0.8502753, 0.1516915, -1.49111, 1, 1, 1, 1, 1,
-0.8278826, -0.7484008, -1.290948, 1, 1, 1, 1, 1,
-0.8203801, -1.244387, -1.992345, 1, 1, 1, 1, 1,
-0.8137531, 2.159285, -0.2143795, 1, 1, 1, 1, 1,
-0.8125158, 0.09832224, -1.413267, 1, 1, 1, 1, 1,
-0.8067921, 0.1127121, -1.508695, 1, 1, 1, 1, 1,
-0.8052816, 1.98225, -0.9364156, 0, 0, 1, 1, 1,
-0.7990268, 0.0314029, -1.537712, 1, 0, 0, 1, 1,
-0.797157, 1.063354, -1.609921, 1, 0, 0, 1, 1,
-0.789889, 0.1957189, 0.8354033, 1, 0, 0, 1, 1,
-0.7881762, -0.521435, -1.50927, 1, 0, 0, 1, 1,
-0.7851254, -0.5300981, -3.600506, 1, 0, 0, 1, 1,
-0.7829358, -0.7703567, -2.947372, 0, 0, 0, 1, 1,
-0.7779964, 0.7018577, -3.452382, 0, 0, 0, 1, 1,
-0.7698421, 0.02737215, -2.622674, 0, 0, 0, 1, 1,
-0.7663534, 0.6346099, -2.111926, 0, 0, 0, 1, 1,
-0.764664, 0.9604511, -2.485041, 0, 0, 0, 1, 1,
-0.762906, 0.5097019, 0.1097526, 0, 0, 0, 1, 1,
-0.7622648, 1.072239, -0.8369465, 0, 0, 0, 1, 1,
-0.7573986, 0.0802296, -2.051072, 1, 1, 1, 1, 1,
-0.7545438, -0.2771622, -3.703418, 1, 1, 1, 1, 1,
-0.7488794, -0.02559377, -3.61422, 1, 1, 1, 1, 1,
-0.7476348, -0.7839884, -3.473052, 1, 1, 1, 1, 1,
-0.7460305, 2.026603, -0.08031923, 1, 1, 1, 1, 1,
-0.743124, 0.9761174, 0.6704882, 1, 1, 1, 1, 1,
-0.7425396, 0.186984, -0.6157775, 1, 1, 1, 1, 1,
-0.7425257, 0.236279, 0.258389, 1, 1, 1, 1, 1,
-0.7389945, 0.1119701, -0.02930593, 1, 1, 1, 1, 1,
-0.7329624, 0.7387773, 0.7539154, 1, 1, 1, 1, 1,
-0.7325637, -0.4376303, -1.999499, 1, 1, 1, 1, 1,
-0.7322379, -0.7771799, -4.152883, 1, 1, 1, 1, 1,
-0.7132418, 0.09333038, -1.700404, 1, 1, 1, 1, 1,
-0.7089173, -2.195364, -3.374609, 1, 1, 1, 1, 1,
-0.7053375, 0.4983445, -0.3407083, 1, 1, 1, 1, 1,
-0.7040815, 1.211882, -0.626605, 0, 0, 1, 1, 1,
-0.6966559, 0.2453672, -0.4108462, 1, 0, 0, 1, 1,
-0.6937882, 1.013814, 0.02118023, 1, 0, 0, 1, 1,
-0.6926561, 1.493866, 0.9728917, 1, 0, 0, 1, 1,
-0.6885143, 0.04226645, -2.051029, 1, 0, 0, 1, 1,
-0.6882238, -0.5020226, -2.997349, 1, 0, 0, 1, 1,
-0.6859357, 0.1591353, -1.436771, 0, 0, 0, 1, 1,
-0.6853607, 0.1023766, -0.2489519, 0, 0, 0, 1, 1,
-0.679812, -0.7313471, -1.97545, 0, 0, 0, 1, 1,
-0.6780605, 0.8595886, -2.301795, 0, 0, 0, 1, 1,
-0.6774487, 0.6103409, -0.2415768, 0, 0, 0, 1, 1,
-0.6729578, 0.3579009, -0.4650562, 0, 0, 0, 1, 1,
-0.6688421, -1.386304, -1.90422, 0, 0, 0, 1, 1,
-0.668117, -0.7999371, -1.727737, 1, 1, 1, 1, 1,
-0.6671796, 0.5007508, -2.914426, 1, 1, 1, 1, 1,
-0.6667491, -2.083568, -3.372233, 1, 1, 1, 1, 1,
-0.6635041, -0.6244286, -1.986527, 1, 1, 1, 1, 1,
-0.6554657, 0.5323234, 1.009674, 1, 1, 1, 1, 1,
-0.6513972, -0.5910717, -2.828458, 1, 1, 1, 1, 1,
-0.6504447, -0.3548287, -2.340158, 1, 1, 1, 1, 1,
-0.648996, 0.9185194, -1.880438, 1, 1, 1, 1, 1,
-0.6468517, -1.086163, -2.243406, 1, 1, 1, 1, 1,
-0.642317, -0.4892491, -3.099291, 1, 1, 1, 1, 1,
-0.6407367, -0.1557386, -0.1696759, 1, 1, 1, 1, 1,
-0.6344706, -1.780261, -2.681446, 1, 1, 1, 1, 1,
-0.6299655, 1.496772, 0.0638814, 1, 1, 1, 1, 1,
-0.6278414, -0.1518156, -4.992759, 1, 1, 1, 1, 1,
-0.6275296, 0.3978582, -1.797998, 1, 1, 1, 1, 1,
-0.6204998, -0.7673435, -2.519359, 0, 0, 1, 1, 1,
-0.6187459, 0.2793508, -0.2316127, 1, 0, 0, 1, 1,
-0.6181265, -2.857093, -3.32646, 1, 0, 0, 1, 1,
-0.6153073, -0.6815067, -3.827225, 1, 0, 0, 1, 1,
-0.6145756, -0.7155637, -1.222865, 1, 0, 0, 1, 1,
-0.6091309, 1.312156, -0.762028, 1, 0, 0, 1, 1,
-0.608532, -0.5570375, -1.663952, 0, 0, 0, 1, 1,
-0.60477, 1.376966, 1.291352, 0, 0, 0, 1, 1,
-0.6030996, 1.000921, -0.5929539, 0, 0, 0, 1, 1,
-0.6024517, -0.4522832, -2.415584, 0, 0, 0, 1, 1,
-0.5970369, -0.5557721, -2.990597, 0, 0, 0, 1, 1,
-0.5900502, -0.430769, -3.392505, 0, 0, 0, 1, 1,
-0.5892503, 0.1852144, -0.6624012, 0, 0, 0, 1, 1,
-0.5818592, 0.9616287, -1.201865, 1, 1, 1, 1, 1,
-0.5784947, -0.1895017, -0.8768896, 1, 1, 1, 1, 1,
-0.5760864, -1.254689, -3.735659, 1, 1, 1, 1, 1,
-0.5726443, -1.215458, -3.212409, 1, 1, 1, 1, 1,
-0.5698143, 0.05431319, -2.132223, 1, 1, 1, 1, 1,
-0.568303, -2.114907, -5.847407, 1, 1, 1, 1, 1,
-0.5582247, 0.1698227, -0.3027645, 1, 1, 1, 1, 1,
-0.5576242, -0.2842929, -1.81397, 1, 1, 1, 1, 1,
-0.5561057, 0.6301923, -1.217812, 1, 1, 1, 1, 1,
-0.5550008, 0.3597316, -0.3696897, 1, 1, 1, 1, 1,
-0.5539222, -1.091214, -2.367117, 1, 1, 1, 1, 1,
-0.5509633, 0.3983482, -0.005680269, 1, 1, 1, 1, 1,
-0.5484086, -0.651264, -1.261276, 1, 1, 1, 1, 1,
-0.5483364, -1.80232, -1.395154, 1, 1, 1, 1, 1,
-0.5478711, 0.4195637, -0.9116012, 1, 1, 1, 1, 1,
-0.547205, -0.5136625, -1.913484, 0, 0, 1, 1, 1,
-0.5422103, -0.8689384, -2.50339, 1, 0, 0, 1, 1,
-0.5389616, -0.4046455, -2.618097, 1, 0, 0, 1, 1,
-0.5383522, 0.826131, -0.3932578, 1, 0, 0, 1, 1,
-0.5358692, 0.5026481, 0.02562169, 1, 0, 0, 1, 1,
-0.5344542, -2.021766, -2.706973, 1, 0, 0, 1, 1,
-0.5323066, 0.9922451, -0.9928464, 0, 0, 0, 1, 1,
-0.5318471, 1.000594, 0.1923524, 0, 0, 0, 1, 1,
-0.5296792, -1.165195, -2.868351, 0, 0, 0, 1, 1,
-0.527465, -1.56316, -2.375583, 0, 0, 0, 1, 1,
-0.5246041, 0.09098008, -0.8706303, 0, 0, 0, 1, 1,
-0.5189041, -0.004453237, -0.257603, 0, 0, 0, 1, 1,
-0.5168598, -0.0378893, -0.2578669, 0, 0, 0, 1, 1,
-0.5168035, -1.939998, -4.100636, 1, 1, 1, 1, 1,
-0.5073299, 0.3518357, 0.5081198, 1, 1, 1, 1, 1,
-0.5052466, -0.7250261, -0.9556835, 1, 1, 1, 1, 1,
-0.5040732, 1.466944, 0.7757499, 1, 1, 1, 1, 1,
-0.5036259, -0.2885063, -1.092242, 1, 1, 1, 1, 1,
-0.5016272, -0.05101295, -1.885212, 1, 1, 1, 1, 1,
-0.5012985, 1.104123, -0.4552597, 1, 1, 1, 1, 1,
-0.4993696, -1.671696, -3.346807, 1, 1, 1, 1, 1,
-0.4980627, -1.933347, -2.289821, 1, 1, 1, 1, 1,
-0.4977626, 0.9509311, -2.478417, 1, 1, 1, 1, 1,
-0.4895703, -1.435213, -1.519764, 1, 1, 1, 1, 1,
-0.4878598, -0.2473744, 0.07786638, 1, 1, 1, 1, 1,
-0.4862767, -2.351768, -2.863845, 1, 1, 1, 1, 1,
-0.4819291, -1.999339, -2.03807, 1, 1, 1, 1, 1,
-0.4719071, 0.4848608, -0.1465757, 1, 1, 1, 1, 1,
-0.4662414, -2.150409, -2.209069, 0, 0, 1, 1, 1,
-0.4607373, -0.09062385, -1.33663, 1, 0, 0, 1, 1,
-0.4528896, -0.9668636, -2.796532, 1, 0, 0, 1, 1,
-0.450287, 1.443524, -1.32473, 1, 0, 0, 1, 1,
-0.4432061, 1.199967, -0.06193938, 1, 0, 0, 1, 1,
-0.44074, 1.922775, 1.85921, 1, 0, 0, 1, 1,
-0.4363135, 0.8599706, 0.04919713, 0, 0, 0, 1, 1,
-0.4351008, 0.4470707, -1.027382, 0, 0, 0, 1, 1,
-0.434884, -2.253202, -3.878881, 0, 0, 0, 1, 1,
-0.4300979, -0.7772058, -0.8951874, 0, 0, 0, 1, 1,
-0.4284201, 0.2090641, -0.227786, 0, 0, 0, 1, 1,
-0.4214413, -0.668176, -2.402828, 0, 0, 0, 1, 1,
-0.4193818, 0.4738034, -1.332844, 0, 0, 0, 1, 1,
-0.4136749, -0.8268497, -3.284592, 1, 1, 1, 1, 1,
-0.413121, -1.187554, -2.34163, 1, 1, 1, 1, 1,
-0.4083841, 0.9181392, -1.289307, 1, 1, 1, 1, 1,
-0.4083754, -1.806232, -1.881882, 1, 1, 1, 1, 1,
-0.4071159, -0.8256918, -0.1405113, 1, 1, 1, 1, 1,
-0.4056662, 0.1674338, 0.8698856, 1, 1, 1, 1, 1,
-0.3891231, 0.2987232, -0.9239025, 1, 1, 1, 1, 1,
-0.3888645, 0.2755759, -0.8336518, 1, 1, 1, 1, 1,
-0.3887256, -0.6899465, -2.323059, 1, 1, 1, 1, 1,
-0.3868752, -1.437708, -2.588216, 1, 1, 1, 1, 1,
-0.3840464, -0.8681195, -0.3310446, 1, 1, 1, 1, 1,
-0.3815217, -0.8055226, -1.975122, 1, 1, 1, 1, 1,
-0.380531, 0.5495803, -0.2759408, 1, 1, 1, 1, 1,
-0.3796185, -1.144467, -3.708067, 1, 1, 1, 1, 1,
-0.3779537, -0.30758, -1.509375, 1, 1, 1, 1, 1,
-0.3726962, 1.75857, 1.994182, 0, 0, 1, 1, 1,
-0.3706567, 1.458368, 0.4925393, 1, 0, 0, 1, 1,
-0.3698826, -1.944715, 0.1008742, 1, 0, 0, 1, 1,
-0.3667989, 1.927229, 0.3313692, 1, 0, 0, 1, 1,
-0.3663353, 1.957554, -0.9420919, 1, 0, 0, 1, 1,
-0.3611949, 1.610423, 0.9659618, 1, 0, 0, 1, 1,
-0.3571846, -0.6503917, -3.131209, 0, 0, 0, 1, 1,
-0.3548361, 0.04635899, -0.2838217, 0, 0, 0, 1, 1,
-0.354706, -0.8000682, -3.393194, 0, 0, 0, 1, 1,
-0.3508925, -1.224993, -3.69375, 0, 0, 0, 1, 1,
-0.349881, 0.03179178, -1.913661, 0, 0, 0, 1, 1,
-0.3496584, -1.092705, -2.824164, 0, 0, 0, 1, 1,
-0.343871, 1.020944, 1.06477, 0, 0, 0, 1, 1,
-0.3437682, -0.2064005, -3.69266, 1, 1, 1, 1, 1,
-0.339025, 0.6285039, -1.184414, 1, 1, 1, 1, 1,
-0.338147, -1.198485, -5.160599, 1, 1, 1, 1, 1,
-0.3359917, -1.252966, -4.274777, 1, 1, 1, 1, 1,
-0.3352785, 0.431677, -1.869721, 1, 1, 1, 1, 1,
-0.3325943, -0.09691069, -2.175539, 1, 1, 1, 1, 1,
-0.3317005, 0.3288377, -0.9829906, 1, 1, 1, 1, 1,
-0.3261284, 0.06200752, -0.3305191, 1, 1, 1, 1, 1,
-0.3233361, -0.2904244, -2.886529, 1, 1, 1, 1, 1,
-0.3175139, 1.530298, -3.076381, 1, 1, 1, 1, 1,
-0.3172452, 0.329585, -3.217208, 1, 1, 1, 1, 1,
-0.316656, -0.4786577, -3.487421, 1, 1, 1, 1, 1,
-0.3159623, -1.9935, -2.976418, 1, 1, 1, 1, 1,
-0.3125705, 1.757122, 0.4046681, 1, 1, 1, 1, 1,
-0.3103966, -0.01329961, -1.893594, 1, 1, 1, 1, 1,
-0.3054108, 0.2961046, -0.4030922, 0, 0, 1, 1, 1,
-0.297572, 0.582294, 0.172057, 1, 0, 0, 1, 1,
-0.2963816, -0.2122176, -0.2850362, 1, 0, 0, 1, 1,
-0.2949587, 0.790092, 0.2202293, 1, 0, 0, 1, 1,
-0.2924077, 1.327894, 0.8287612, 1, 0, 0, 1, 1,
-0.291293, 1.812109, 0.2567348, 1, 0, 0, 1, 1,
-0.2805786, 1.732479, 0.336149, 0, 0, 0, 1, 1,
-0.2802096, 1.352755, -1.200517, 0, 0, 0, 1, 1,
-0.2796171, 0.06885663, -1.866298, 0, 0, 0, 1, 1,
-0.2779147, -1.222777, -2.458497, 0, 0, 0, 1, 1,
-0.277085, 1.020428, -0.5238456, 0, 0, 0, 1, 1,
-0.2759323, -0.02317365, -1.057929, 0, 0, 0, 1, 1,
-0.2709404, -0.8114735, -2.462874, 0, 0, 0, 1, 1,
-0.2707316, 0.9589647, 0.6170568, 1, 1, 1, 1, 1,
-0.2682349, -1.976857, -2.014074, 1, 1, 1, 1, 1,
-0.2674078, 1.502041, -0.7024969, 1, 1, 1, 1, 1,
-0.26308, 1.97125, -0.2708102, 1, 1, 1, 1, 1,
-0.2626117, -0.9442466, -1.801888, 1, 1, 1, 1, 1,
-0.2596349, 0.258175, 1.828351, 1, 1, 1, 1, 1,
-0.2575216, -0.1871884, -1.47701, 1, 1, 1, 1, 1,
-0.2568352, 0.1654998, -2.950063, 1, 1, 1, 1, 1,
-0.2536296, -0.01543413, -1.972732, 1, 1, 1, 1, 1,
-0.2519961, 0.9184959, -0.5390311, 1, 1, 1, 1, 1,
-0.2491488, -2.003182, -2.753443, 1, 1, 1, 1, 1,
-0.2488594, 0.2814699, -1.454051, 1, 1, 1, 1, 1,
-0.2469186, 1.398829, 1.159039, 1, 1, 1, 1, 1,
-0.244004, 0.5264198, 0.3597065, 1, 1, 1, 1, 1,
-0.2436109, 0.7175826, 0.9186456, 1, 1, 1, 1, 1,
-0.2394125, -0.01511941, -1.854643, 0, 0, 1, 1, 1,
-0.2388638, -0.1217695, -1.724701, 1, 0, 0, 1, 1,
-0.2341938, -0.6672136, -1.790525, 1, 0, 0, 1, 1,
-0.2265598, 0.9672874, -0.12233, 1, 0, 0, 1, 1,
-0.2220988, 0.1792638, -1.3668, 1, 0, 0, 1, 1,
-0.2201724, -0.7304494, -4.101469, 1, 0, 0, 1, 1,
-0.2200249, -0.3402337, -4.450998, 0, 0, 0, 1, 1,
-0.2197644, 0.1939619, -1.74479, 0, 0, 0, 1, 1,
-0.2193169, -0.05208194, -0.9022235, 0, 0, 0, 1, 1,
-0.2167857, 1.158855, -0.4023986, 0, 0, 0, 1, 1,
-0.2150204, 0.618769, 0.5820625, 0, 0, 0, 1, 1,
-0.2133672, 0.004531804, -1.212249, 0, 0, 0, 1, 1,
-0.208419, 0.613295, 1.376755, 0, 0, 0, 1, 1,
-0.2043514, 1.358728, 0.009566147, 1, 1, 1, 1, 1,
-0.203463, 0.4356022, -4.840805e-05, 1, 1, 1, 1, 1,
-0.2012275, 0.3541188, -0.03200252, 1, 1, 1, 1, 1,
-0.1959784, -1.387486, -2.477021, 1, 1, 1, 1, 1,
-0.1948427, -0.01323998, -0.8186503, 1, 1, 1, 1, 1,
-0.1913221, -0.09215788, -0.5350748, 1, 1, 1, 1, 1,
-0.184603, 0.04379284, -1.57427, 1, 1, 1, 1, 1,
-0.182816, 1.341519, -0.4121303, 1, 1, 1, 1, 1,
-0.1789863, -1.760001, -2.667542, 1, 1, 1, 1, 1,
-0.1656525, -1.205862, -2.922431, 1, 1, 1, 1, 1,
-0.1637565, 1.979295, -0.3333711, 1, 1, 1, 1, 1,
-0.163541, -0.1584026, -2.604923, 1, 1, 1, 1, 1,
-0.1613493, 0.04529728, -0.8208497, 1, 1, 1, 1, 1,
-0.1587287, -0.1086653, -3.69804, 1, 1, 1, 1, 1,
-0.1586185, -0.736744, -4.026444, 1, 1, 1, 1, 1,
-0.156028, -1.776989, -3.13508, 0, 0, 1, 1, 1,
-0.1540468, 1.18768, -0.3995291, 1, 0, 0, 1, 1,
-0.1456671, -0.07473683, -2.27844, 1, 0, 0, 1, 1,
-0.1454141, -0.8628461, -4.446586, 1, 0, 0, 1, 1,
-0.1445381, 0.9270492, 0.003646616, 1, 0, 0, 1, 1,
-0.1421604, -0.5180989, -3.371893, 1, 0, 0, 1, 1,
-0.1419153, -0.3165099, -3.497352, 0, 0, 0, 1, 1,
-0.1413177, -0.5200183, -2.552674, 0, 0, 0, 1, 1,
-0.1377991, 1.12411, 0.5347902, 0, 0, 0, 1, 1,
-0.1372751, 2.29652, -0.9589345, 0, 0, 0, 1, 1,
-0.1365962, 0.4524296, -0.5846425, 0, 0, 0, 1, 1,
-0.1359274, -0.003826918, -2.237149, 0, 0, 0, 1, 1,
-0.135316, -1.931645, -5.279279, 0, 0, 0, 1, 1,
-0.1346709, -0.0786737, -2.200288, 1, 1, 1, 1, 1,
-0.1345662, 0.07440021, -1.928283, 1, 1, 1, 1, 1,
-0.1340181, -1.262344, -4.673378, 1, 1, 1, 1, 1,
-0.1318449, -0.5474929, -3.032233, 1, 1, 1, 1, 1,
-0.1296302, 0.3410243, -1.339095, 1, 1, 1, 1, 1,
-0.1279683, 0.314257, -0.7588941, 1, 1, 1, 1, 1,
-0.1239415, -2.759244, -4.163733, 1, 1, 1, 1, 1,
-0.1209985, -0.5981293, -1.444917, 1, 1, 1, 1, 1,
-0.1189964, 0.9194781, 0.4184763, 1, 1, 1, 1, 1,
-0.11204, -0.3562294, -5.187489, 1, 1, 1, 1, 1,
-0.1081198, -0.8142566, -3.250535, 1, 1, 1, 1, 1,
-0.1041505, 0.6340948, -0.3407928, 1, 1, 1, 1, 1,
-0.103022, 0.09327118, -1.926924, 1, 1, 1, 1, 1,
-0.1011693, -0.02947295, -1.095621, 1, 1, 1, 1, 1,
-0.09758416, -0.56937, -3.41861, 1, 1, 1, 1, 1,
-0.09728061, -0.3276981, -2.414331, 0, 0, 1, 1, 1,
-0.09547152, 0.4599436, -1.046883, 1, 0, 0, 1, 1,
-0.09158912, -0.6647999, -2.63836, 1, 0, 0, 1, 1,
-0.09108643, -0.4587921, -3.461566, 1, 0, 0, 1, 1,
-0.08643388, -1.761841, -3.341348, 1, 0, 0, 1, 1,
-0.08105305, 0.8716456, -1.637583, 1, 0, 0, 1, 1,
-0.08007923, -0.5115744, -4.264475, 0, 0, 0, 1, 1,
-0.07915359, -0.8106129, -1.582303, 0, 0, 0, 1, 1,
-0.07572954, -0.5645829, -3.447571, 0, 0, 0, 1, 1,
-0.07567787, 0.5516671, -1.762688, 0, 0, 0, 1, 1,
-0.07541203, -0.5207208, -2.382405, 0, 0, 0, 1, 1,
-0.073793, 1.2476, -0.3191288, 0, 0, 0, 1, 1,
-0.06897569, -0.8166851, -1.717311, 0, 0, 0, 1, 1,
-0.06143539, 1.745032, 1.620494, 1, 1, 1, 1, 1,
-0.05813118, -0.006436484, -1.372285, 1, 1, 1, 1, 1,
-0.05786311, 0.4961011, 0.8304154, 1, 1, 1, 1, 1,
-0.05650602, -1.844309, -3.720912, 1, 1, 1, 1, 1,
-0.05348421, 0.3844565, -0.2446444, 1, 1, 1, 1, 1,
-0.05180184, 0.09068856, -0.877848, 1, 1, 1, 1, 1,
-0.05157442, -1.917417, -3.070298, 1, 1, 1, 1, 1,
-0.05145631, -0.2112564, -3.789423, 1, 1, 1, 1, 1,
-0.0442491, -0.3721766, -3.668531, 1, 1, 1, 1, 1,
-0.04352652, -0.1981239, -4.507611, 1, 1, 1, 1, 1,
-0.03905581, 0.9667783, 0.3440053, 1, 1, 1, 1, 1,
-0.03763979, -0.6171028, -4.350517, 1, 1, 1, 1, 1,
-0.03381578, -0.9176666, -3.345014, 1, 1, 1, 1, 1,
-0.03225668, -0.4298928, -2.663256, 1, 1, 1, 1, 1,
-0.0302975, -0.2604637, -2.457785, 1, 1, 1, 1, 1,
-0.02541526, -0.01153651, -1.562144, 0, 0, 1, 1, 1,
-0.0248471, -0.2986062, -2.595299, 1, 0, 0, 1, 1,
-0.0248431, -0.8131872, -3.407781, 1, 0, 0, 1, 1,
-0.02386145, -0.4456139, -3.812948, 1, 0, 0, 1, 1,
-0.01785784, 0.7156754, 1.098415, 1, 0, 0, 1, 1,
-0.01781163, -0.4029398, -2.938755, 1, 0, 0, 1, 1,
-0.01630239, 2.301558, 0.225232, 0, 0, 0, 1, 1,
-0.01419806, -0.0818681, -3.341466, 0, 0, 0, 1, 1,
-0.01208662, -1.729322, -4.268773, 0, 0, 0, 1, 1,
-0.01014096, 0.3756084, 0.9734867, 0, 0, 0, 1, 1,
-0.008066314, -1.408336, -3.516042, 0, 0, 0, 1, 1,
-0.007088251, -0.6641631, -3.274749, 0, 0, 0, 1, 1,
-0.003493833, -0.7015207, -3.939617, 0, 0, 0, 1, 1,
-0.003094763, -0.1719013, -1.42408, 1, 1, 1, 1, 1,
-0.002001684, 0.8315758, -0.9270009, 1, 1, 1, 1, 1,
0.000549546, 1.41442, 0.3390487, 1, 1, 1, 1, 1,
0.0006861883, 0.5208967, 0.9483383, 1, 1, 1, 1, 1,
0.001658931, 2.106669, -0.3823022, 1, 1, 1, 1, 1,
0.003016503, 0.5063284, -1.018057, 1, 1, 1, 1, 1,
0.00955025, 1.619471, -2.117837, 1, 1, 1, 1, 1,
0.01118942, -2.036396, 2.346832, 1, 1, 1, 1, 1,
0.01440507, -0.6426247, 3.304008, 1, 1, 1, 1, 1,
0.02008404, -0.9480646, 3.592875, 1, 1, 1, 1, 1,
0.0207714, 0.7082874, -0.4198332, 1, 1, 1, 1, 1,
0.02157693, 0.2903911, -0.5033232, 1, 1, 1, 1, 1,
0.02174193, -1.129246, 3.522967, 1, 1, 1, 1, 1,
0.0305151, -1.597386, 2.341272, 1, 1, 1, 1, 1,
0.03126273, 0.4696324, 1.092452, 1, 1, 1, 1, 1,
0.03439738, -0.8289475, 1.92, 0, 0, 1, 1, 1,
0.03525957, 0.3386204, -1.172651, 1, 0, 0, 1, 1,
0.03845647, -1.388985, 3.727423, 1, 0, 0, 1, 1,
0.04005319, 1.081979, -0.3481451, 1, 0, 0, 1, 1,
0.04515512, -0.191137, 5.329499, 1, 0, 0, 1, 1,
0.04682316, -0.733923, 3.8202, 1, 0, 0, 1, 1,
0.04754196, 1.044634, -0.4785242, 0, 0, 0, 1, 1,
0.04774876, -0.4998736, 2.138552, 0, 0, 0, 1, 1,
0.04795179, -0.8847666, 2.622305, 0, 0, 0, 1, 1,
0.04797452, 0.3426057, 1.57219, 0, 0, 0, 1, 1,
0.04879779, -0.6033672, 4.027634, 0, 0, 0, 1, 1,
0.04895175, -0.5658569, 3.362712, 0, 0, 0, 1, 1,
0.05121312, -0.8945508, 2.558446, 0, 0, 0, 1, 1,
0.0539642, 0.1372784, 1.189773, 1, 1, 1, 1, 1,
0.05779113, 0.09290665, 0.4829544, 1, 1, 1, 1, 1,
0.0589564, -0.342531, 2.590194, 1, 1, 1, 1, 1,
0.06099974, -0.3913701, 1.72424, 1, 1, 1, 1, 1,
0.06500276, 0.8381606, 1.439209, 1, 1, 1, 1, 1,
0.06514755, -2.015379, 3.684795, 1, 1, 1, 1, 1,
0.06895697, 0.5951141, -0.1210444, 1, 1, 1, 1, 1,
0.06942221, 0.1713119, 0.07680672, 1, 1, 1, 1, 1,
0.07803834, -0.2100649, 1.300948, 1, 1, 1, 1, 1,
0.08190688, 0.07924334, 1.901296, 1, 1, 1, 1, 1,
0.08624294, -0.4923411, 2.577142, 1, 1, 1, 1, 1,
0.09618715, 0.2062348, 0.1314249, 1, 1, 1, 1, 1,
0.09625196, 0.5984847, -1.16914, 1, 1, 1, 1, 1,
0.09749829, -1.062788, 3.092038, 1, 1, 1, 1, 1,
0.1004477, -1.316972, 3.398127, 1, 1, 1, 1, 1,
0.1018231, -0.7274294, 2.938611, 0, 0, 1, 1, 1,
0.1019506, 0.1318451, 0.9679122, 1, 0, 0, 1, 1,
0.1035931, -1.377093, 3.602617, 1, 0, 0, 1, 1,
0.1046399, -1.585717, 2.850075, 1, 0, 0, 1, 1,
0.1082191, 0.2989272, -0.2154629, 1, 0, 0, 1, 1,
0.1114205, -1.384315, 3.88143, 1, 0, 0, 1, 1,
0.1120547, -0.3238983, 2.517802, 0, 0, 0, 1, 1,
0.1193975, 1.294818, 0.8652475, 0, 0, 0, 1, 1,
0.1198432, -0.5960172, 3.314745, 0, 0, 0, 1, 1,
0.1206065, 0.3890647, 0.7014561, 0, 0, 0, 1, 1,
0.1253666, 0.4465262, -0.7343163, 0, 0, 0, 1, 1,
0.1268988, -0.841809, 1.98653, 0, 0, 0, 1, 1,
0.1283717, 0.02700954, 2.305719, 0, 0, 0, 1, 1,
0.1308307, -0.7175356, 1.948868, 1, 1, 1, 1, 1,
0.1393683, -0.0006226254, 1.109416, 1, 1, 1, 1, 1,
0.1402052, -0.2452004, 5.492997, 1, 1, 1, 1, 1,
0.1428728, -0.7525523, 2.816629, 1, 1, 1, 1, 1,
0.1436079, -0.8421769, -0.1524917, 1, 1, 1, 1, 1,
0.1448083, 0.2431937, 1.723455, 1, 1, 1, 1, 1,
0.1516735, -0.8958194, 3.153874, 1, 1, 1, 1, 1,
0.1564988, -0.7987304, 1.43493, 1, 1, 1, 1, 1,
0.1565522, 0.6360646, 0.4651437, 1, 1, 1, 1, 1,
0.1634586, -0.6510462, 2.977582, 1, 1, 1, 1, 1,
0.1644977, -0.0651423, -1.535814, 1, 1, 1, 1, 1,
0.1722168, 1.261031, -0.06569619, 1, 1, 1, 1, 1,
0.1726184, 0.917837, -1.371373, 1, 1, 1, 1, 1,
0.1740907, 1.527678, -1.927524, 1, 1, 1, 1, 1,
0.1754757, 1.68017, 0.9162622, 1, 1, 1, 1, 1,
0.1757203, -0.07286274, 2.452894, 0, 0, 1, 1, 1,
0.1760617, 1.517836, -0.08552899, 1, 0, 0, 1, 1,
0.1779584, 0.9003054, 0.5896645, 1, 0, 0, 1, 1,
0.1817686, -0.7677503, 2.357943, 1, 0, 0, 1, 1,
0.1837322, -1.184728, 2.304544, 1, 0, 0, 1, 1,
0.1856018, -1.114486, 3.65965, 1, 0, 0, 1, 1,
0.1872828, 0.909345, 0.7045308, 0, 0, 0, 1, 1,
0.1899492, -0.9832138, 3.569081, 0, 0, 0, 1, 1,
0.1901346, -1.39805, 2.955628, 0, 0, 0, 1, 1,
0.1921625, -0.9440687, 2.129705, 0, 0, 0, 1, 1,
0.1934946, 1.696977, -0.7063553, 0, 0, 0, 1, 1,
0.1939122, 0.5951836, 1.743479, 0, 0, 0, 1, 1,
0.1965897, -0.1404154, 1.723646, 0, 0, 0, 1, 1,
0.1972805, -0.2680859, 2.064806, 1, 1, 1, 1, 1,
0.1984984, 0.9259031, 0.2521564, 1, 1, 1, 1, 1,
0.2098054, 0.2008478, 1.046935, 1, 1, 1, 1, 1,
0.2134849, -1.023077, 3.582668, 1, 1, 1, 1, 1,
0.2138816, -1.972953, 4.437264, 1, 1, 1, 1, 1,
0.2142867, -0.6896341, 1.982756, 1, 1, 1, 1, 1,
0.215483, 1.475079, -0.7395492, 1, 1, 1, 1, 1,
0.2187532, 2.658733, -0.3548383, 1, 1, 1, 1, 1,
0.2214775, -0.5309008, 2.413848, 1, 1, 1, 1, 1,
0.2220952, 1.326249, -0.08806928, 1, 1, 1, 1, 1,
0.2230588, -1.738639, 3.826703, 1, 1, 1, 1, 1,
0.2341518, -0.2489794, 1.754822, 1, 1, 1, 1, 1,
0.2363794, 1.001546, 1.539932, 1, 1, 1, 1, 1,
0.2369199, -0.5784656, 1.815782, 1, 1, 1, 1, 1,
0.2376218, -0.4753112, 1.779303, 1, 1, 1, 1, 1,
0.2390548, 0.3537185, 2.52413, 0, 0, 1, 1, 1,
0.2423626, -0.5305437, 4.318584, 1, 0, 0, 1, 1,
0.2437563, -0.6465712, 2.892292, 1, 0, 0, 1, 1,
0.2467363, 0.2501899, 1.328049, 1, 0, 0, 1, 1,
0.250836, 0.1045338, 1.117708, 1, 0, 0, 1, 1,
0.2553035, 0.9513063, 1.168648, 1, 0, 0, 1, 1,
0.2556513, 1.234564, -1.018612, 0, 0, 0, 1, 1,
0.2565368, -1.71422, 2.459895, 0, 0, 0, 1, 1,
0.2580783, -0.3378147, 4.182086, 0, 0, 0, 1, 1,
0.2588637, -0.372037, 2.668759, 0, 0, 0, 1, 1,
0.2597123, 0.5961822, 0.2691934, 0, 0, 0, 1, 1,
0.2618583, -1.214718, 2.599019, 0, 0, 0, 1, 1,
0.2647101, 2.000566, -0.5478156, 0, 0, 0, 1, 1,
0.2648127, 0.6714544, 1.962212, 1, 1, 1, 1, 1,
0.2655101, -0.2088448, 1.282141, 1, 1, 1, 1, 1,
0.2673357, -0.0923727, 1.248923, 1, 1, 1, 1, 1,
0.2711448, 1.731413, 0.1687422, 1, 1, 1, 1, 1,
0.2713757, 1.532904, 0.3107525, 1, 1, 1, 1, 1,
0.2739299, 0.9168389, 0.2770344, 1, 1, 1, 1, 1,
0.2740605, -1.65993, 3.640239, 1, 1, 1, 1, 1,
0.2782306, -0.7182965, 1.27639, 1, 1, 1, 1, 1,
0.2789469, 0.2026789, 0.6528857, 1, 1, 1, 1, 1,
0.281822, 0.2343842, 0.773374, 1, 1, 1, 1, 1,
0.282444, -1.502412, 3.074643, 1, 1, 1, 1, 1,
0.2833297, 0.3435629, 0.8804444, 1, 1, 1, 1, 1,
0.2856305, -0.9657288, 2.921862, 1, 1, 1, 1, 1,
0.296312, 0.1991712, -2.204204, 1, 1, 1, 1, 1,
0.2969276, -0.08733036, -0.2150906, 1, 1, 1, 1, 1,
0.2998539, 0.5634596, -0.08725469, 0, 0, 1, 1, 1,
0.3003005, -0.3422984, 3.190734, 1, 0, 0, 1, 1,
0.3048215, 1.216254, 0.1206027, 1, 0, 0, 1, 1,
0.3138492, 0.6798943, -0.3396801, 1, 0, 0, 1, 1,
0.3230782, -1.014862, 4.220247, 1, 0, 0, 1, 1,
0.3249888, 2.223083, 0.9063011, 1, 0, 0, 1, 1,
0.3254698, -1.11267, 3.022958, 0, 0, 0, 1, 1,
0.3277282, -0.4316373, 1.958433, 0, 0, 0, 1, 1,
0.3277423, -0.1258922, 1.729263, 0, 0, 0, 1, 1,
0.3283937, -1.304625, 2.26087, 0, 0, 0, 1, 1,
0.3298806, -1.185191, 1.539381, 0, 0, 0, 1, 1,
0.3301341, 0.5666867, -0.377543, 0, 0, 0, 1, 1,
0.3337569, -0.7672126, 3.336078, 0, 0, 0, 1, 1,
0.3367918, 0.1877393, -0.2708969, 1, 1, 1, 1, 1,
0.3373234, 0.7718055, 2.653372, 1, 1, 1, 1, 1,
0.3379009, 1.311975, -0.3645099, 1, 1, 1, 1, 1,
0.3426431, -0.002266086, 2.84732, 1, 1, 1, 1, 1,
0.342955, -1.56936, 2.9824, 1, 1, 1, 1, 1,
0.346433, 0.2501729, 0.9933487, 1, 1, 1, 1, 1,
0.3466415, -1.235711, 2.996475, 1, 1, 1, 1, 1,
0.3543213, 2.135546, 0.07196996, 1, 1, 1, 1, 1,
0.3642604, 0.05701781, 0.514858, 1, 1, 1, 1, 1,
0.3652167, 1.628362, -1.164886, 1, 1, 1, 1, 1,
0.3659019, 0.7506388, 0.9650989, 1, 1, 1, 1, 1,
0.3702403, -0.9410378, 1.541934, 1, 1, 1, 1, 1,
0.3719318, -0.2828634, 2.585025, 1, 1, 1, 1, 1,
0.3724424, -0.6712206, 1.865478, 1, 1, 1, 1, 1,
0.3743789, 1.613939, 0.7105098, 1, 1, 1, 1, 1,
0.3748429, -4.076203, 3.48054, 0, 0, 1, 1, 1,
0.3765198, 0.3262825, 1.127203, 1, 0, 0, 1, 1,
0.3781472, 0.3061895, -0.0225719, 1, 0, 0, 1, 1,
0.380449, -0.5155128, 1.519501, 1, 0, 0, 1, 1,
0.3933518, -0.008255418, 2.716279, 1, 0, 0, 1, 1,
0.3965271, -0.8764436, 3.600012, 1, 0, 0, 1, 1,
0.4007532, -0.918134, 2.926891, 0, 0, 0, 1, 1,
0.4021182, 1.098468, 0.06769215, 0, 0, 0, 1, 1,
0.405554, -0.5761173, 3.363037, 0, 0, 0, 1, 1,
0.4075955, 0.09629673, 1.065052, 0, 0, 0, 1, 1,
0.4113613, 1.712877, -1.823683, 0, 0, 0, 1, 1,
0.4117212, 1.034806, 0.1419675, 0, 0, 0, 1, 1,
0.4152169, -0.9333332, 3.275418, 0, 0, 0, 1, 1,
0.4203556, -0.1045245, 0.422977, 1, 1, 1, 1, 1,
0.4215, 0.9110273, -1.191295, 1, 1, 1, 1, 1,
0.4238752, -0.3254495, 2.75498, 1, 1, 1, 1, 1,
0.426871, -1.28925, 2.162977, 1, 1, 1, 1, 1,
0.4283264, -0.2504369, 1.181881, 1, 1, 1, 1, 1,
0.4314436, 0.6340154, 0.4379838, 1, 1, 1, 1, 1,
0.431485, -1.197526, 2.548443, 1, 1, 1, 1, 1,
0.4328894, 0.03769053, 1.440665, 1, 1, 1, 1, 1,
0.4340388, -0.3594286, 3.03155, 1, 1, 1, 1, 1,
0.4373581, 1.528969, -0.5782478, 1, 1, 1, 1, 1,
0.441597, -0.1378116, 3.62388, 1, 1, 1, 1, 1,
0.4416221, -0.5858961, 1.8933, 1, 1, 1, 1, 1,
0.4439427, -0.07200009, 2.127295, 1, 1, 1, 1, 1,
0.4472112, -0.6350539, 2.802661, 1, 1, 1, 1, 1,
0.4473982, -0.4332545, 2.45825, 1, 1, 1, 1, 1,
0.4566419, 0.2379565, 1.30685, 0, 0, 1, 1, 1,
0.4592063, 1.467757, -0.3833539, 1, 0, 0, 1, 1,
0.4600426, 1.902145, 0.4545611, 1, 0, 0, 1, 1,
0.4627936, -0.2169418, 1.296944, 1, 0, 0, 1, 1,
0.468324, -0.1173972, 1.167144, 1, 0, 0, 1, 1,
0.476325, 1.78691, 0.3829445, 1, 0, 0, 1, 1,
0.4764373, -0.2194349, 2.708674, 0, 0, 0, 1, 1,
0.4800054, -0.9972762, 4.416993, 0, 0, 0, 1, 1,
0.48019, 0.2380981, 2.049959, 0, 0, 0, 1, 1,
0.4807005, 0.2176402, 0.5872028, 0, 0, 0, 1, 1,
0.481499, 0.4321029, 0.8415129, 0, 0, 0, 1, 1,
0.4837793, 0.9902828, -0.5788631, 0, 0, 0, 1, 1,
0.4859652, -0.3618391, 1.784673, 0, 0, 0, 1, 1,
0.4951471, -0.8315515, 3.228819, 1, 1, 1, 1, 1,
0.4991719, -0.5119419, 2.405096, 1, 1, 1, 1, 1,
0.5010586, -0.1978133, 1.728232, 1, 1, 1, 1, 1,
0.503925, 0.3355498, 0.8215197, 1, 1, 1, 1, 1,
0.5108836, 0.8600342, -1.855751, 1, 1, 1, 1, 1,
0.5137023, 0.7492305, -0.9841032, 1, 1, 1, 1, 1,
0.5167554, 0.4523826, 0.812121, 1, 1, 1, 1, 1,
0.5174082, -0.04403429, 2.962085, 1, 1, 1, 1, 1,
0.5223866, -1.35072, 3.520152, 1, 1, 1, 1, 1,
0.5260171, 1.837735, -0.001682254, 1, 1, 1, 1, 1,
0.526095, 0.6037902, 0.7771354, 1, 1, 1, 1, 1,
0.5312808, 0.7478758, 1.738319, 1, 1, 1, 1, 1,
0.5326329, 1.245451, 1.050042, 1, 1, 1, 1, 1,
0.5360849, -1.432066, 2.831923, 1, 1, 1, 1, 1,
0.5405447, 0.06688659, 2.700243, 1, 1, 1, 1, 1,
0.5444883, 1.413333, -0.5268952, 0, 0, 1, 1, 1,
0.5481768, -1.049272, 3.464275, 1, 0, 0, 1, 1,
0.5518606, 1.263153, -0.6491811, 1, 0, 0, 1, 1,
0.5549589, 0.438157, 0.8273441, 1, 0, 0, 1, 1,
0.5585096, -0.8390704, 2.964408, 1, 0, 0, 1, 1,
0.559146, -0.7383711, 2.954343, 1, 0, 0, 1, 1,
0.5629899, 1.038489, 0.3156739, 0, 0, 0, 1, 1,
0.5635551, -0.6488887, 2.735765, 0, 0, 0, 1, 1,
0.5643412, -0.8803743, 1.736202, 0, 0, 0, 1, 1,
0.5669786, 0.1196446, 0.9399131, 0, 0, 0, 1, 1,
0.5687477, -0.5451311, 3.573079, 0, 0, 0, 1, 1,
0.5733047, -0.9122759, 3.446421, 0, 0, 0, 1, 1,
0.5746128, -0.07775681, 2.369354, 0, 0, 0, 1, 1,
0.5748348, -1.551976, 2.42088, 1, 1, 1, 1, 1,
0.5751891, -1.8911, 1.837287, 1, 1, 1, 1, 1,
0.5777942, 0.9197385, 1.436563, 1, 1, 1, 1, 1,
0.5794615, 1.295933, 0.70735, 1, 1, 1, 1, 1,
0.5820371, -1.197772, 1.76474, 1, 1, 1, 1, 1,
0.586226, 0.5732254, 1.436549, 1, 1, 1, 1, 1,
0.5868994, -2.539632, 2.320615, 1, 1, 1, 1, 1,
0.5890802, -1.600049, 3.279663, 1, 1, 1, 1, 1,
0.5902185, 0.2130662, 1.744201, 1, 1, 1, 1, 1,
0.5959731, -0.78793, 1.626127, 1, 1, 1, 1, 1,
0.6094546, -1.040779, 3.313616, 1, 1, 1, 1, 1,
0.6139085, 0.8221759, 1.119282, 1, 1, 1, 1, 1,
0.6166794, -0.1377518, 1.38271, 1, 1, 1, 1, 1,
0.6195812, -0.758957, 2.991914, 1, 1, 1, 1, 1,
0.623742, 1.811281, 0.209299, 1, 1, 1, 1, 1,
0.6245604, 0.751148, -0.002299204, 0, 0, 1, 1, 1,
0.6293187, -0.305855, 2.597927, 1, 0, 0, 1, 1,
0.6317629, -0.4026049, 3.378038, 1, 0, 0, 1, 1,
0.6350141, -0.1250385, 1.386136, 1, 0, 0, 1, 1,
0.6389843, -0.03671061, 3.108378, 1, 0, 0, 1, 1,
0.6477844, -0.9683638, 3.957007, 1, 0, 0, 1, 1,
0.6625729, 1.157762, 1.486473, 0, 0, 0, 1, 1,
0.6652318, 0.2430141, -0.2039213, 0, 0, 0, 1, 1,
0.6680261, -1.007201, 2.526667, 0, 0, 0, 1, 1,
0.6688889, -0.06492536, 0.9778398, 0, 0, 0, 1, 1,
0.6718581, 0.7175018, 1.146457, 0, 0, 0, 1, 1,
0.6753287, 0.3085286, 0.7243143, 0, 0, 0, 1, 1,
0.6784926, -1.756468, 3.651077, 0, 0, 0, 1, 1,
0.6844934, -0.6918776, 0.9985403, 1, 1, 1, 1, 1,
0.69357, -0.01710302, 0.6570613, 1, 1, 1, 1, 1,
0.6993678, 0.7335863, 0.03226876, 1, 1, 1, 1, 1,
0.700398, 0.9781587, -1.408751, 1, 1, 1, 1, 1,
0.7013787, 0.4489445, 1.815609, 1, 1, 1, 1, 1,
0.7039453, -0.4733817, 4.270723, 1, 1, 1, 1, 1,
0.7054507, -0.9565759, 2.43675, 1, 1, 1, 1, 1,
0.7073846, 0.6261999, 2.331851, 1, 1, 1, 1, 1,
0.7089056, -0.6995988, 3.688983, 1, 1, 1, 1, 1,
0.7120591, 1.445116, -1.637935, 1, 1, 1, 1, 1,
0.7172059, -1.844181, 3.170688, 1, 1, 1, 1, 1,
0.7179681, 0.5280894, -1.047085, 1, 1, 1, 1, 1,
0.7194146, 0.157989, 1.426509, 1, 1, 1, 1, 1,
0.7262558, -1.216694, -0.8629807, 1, 1, 1, 1, 1,
0.7283192, 1.196554, 0.555424, 1, 1, 1, 1, 1,
0.7320681, -0.9919583, 1.310686, 0, 0, 1, 1, 1,
0.7323649, -1.337418, 4.208572, 1, 0, 0, 1, 1,
0.7326892, -0.6745174, 1.809203, 1, 0, 0, 1, 1,
0.7343001, -0.101093, 2.050976, 1, 0, 0, 1, 1,
0.7375568, -0.4725748, 2.435449, 1, 0, 0, 1, 1,
0.7375939, -0.897028, 1.692408, 1, 0, 0, 1, 1,
0.7408873, 0.2802926, 0.1188492, 0, 0, 0, 1, 1,
0.7476177, -0.5646423, 0.6026467, 0, 0, 0, 1, 1,
0.7526334, -0.1293285, 4.376555, 0, 0, 0, 1, 1,
0.7572851, -0.4575274, 3.094567, 0, 0, 0, 1, 1,
0.7575967, 0.02374637, 0.8307458, 0, 0, 0, 1, 1,
0.7670732, 0.03678519, 0.1434241, 0, 0, 0, 1, 1,
0.7765834, 2.391861, 1.028048, 0, 0, 0, 1, 1,
0.7814525, -2.679606, 1.415925, 1, 1, 1, 1, 1,
0.7917411, 1.14866, 0.4163847, 1, 1, 1, 1, 1,
0.7928175, 0.4301216, 0.9689994, 1, 1, 1, 1, 1,
0.7946787, -0.1149031, 0.4306781, 1, 1, 1, 1, 1,
0.7977301, 1.231532, -0.9168507, 1, 1, 1, 1, 1,
0.8005669, -0.9360409, 2.519561, 1, 1, 1, 1, 1,
0.8016286, -1.587593, 2.538852, 1, 1, 1, 1, 1,
0.8036412, 0.2231276, 0.4287279, 1, 1, 1, 1, 1,
0.8156088, 0.4332923, 2.728024, 1, 1, 1, 1, 1,
0.8236896, 0.1781644, 2.315018, 1, 1, 1, 1, 1,
0.8247349, -0.5192763, 2.983992, 1, 1, 1, 1, 1,
0.8256344, -1.034709, 2.320737, 1, 1, 1, 1, 1,
0.8258378, 1.850086, 0.9872919, 1, 1, 1, 1, 1,
0.8316072, -0.3863598, 1.672766, 1, 1, 1, 1, 1,
0.8336726, -0.1718435, 1.292456, 1, 1, 1, 1, 1,
0.83499, -0.01620018, 1.304908, 0, 0, 1, 1, 1,
0.8352515, 0.1867742, -0.06133914, 1, 0, 0, 1, 1,
0.8391327, 0.51309, 0.2174981, 1, 0, 0, 1, 1,
0.8400359, 0.8221939, 0.796704, 1, 0, 0, 1, 1,
0.8423213, -1.025196, 2.553802, 1, 0, 0, 1, 1,
0.8573294, -0.6409887, 0.04573207, 1, 0, 0, 1, 1,
0.8579732, 0.9617686, 2.146449, 0, 0, 0, 1, 1,
0.8582655, 0.7701538, 2.747942, 0, 0, 0, 1, 1,
0.862711, 0.5127783, 2.118849, 0, 0, 0, 1, 1,
0.8643505, 1.303775, 0.8810225, 0, 0, 0, 1, 1,
0.8727764, -0.9756295, 2.246795, 0, 0, 0, 1, 1,
0.8784923, -0.4485302, 0.578397, 0, 0, 0, 1, 1,
0.8802675, -0.6403104, 1.503436, 0, 0, 0, 1, 1,
0.8806624, 1.189235, 0.9272327, 1, 1, 1, 1, 1,
0.8827718, -0.9499748, 0.7332451, 1, 1, 1, 1, 1,
0.882964, 1.593322, 1.7463, 1, 1, 1, 1, 1,
0.8895175, 1.129931, 1.782813, 1, 1, 1, 1, 1,
0.895774, 0.4555759, 1.658339, 1, 1, 1, 1, 1,
0.896304, -0.2862115, 2.585, 1, 1, 1, 1, 1,
0.8974438, 0.6965444, 0.5702145, 1, 1, 1, 1, 1,
0.8980442, 0.7858506, 0.5023763, 1, 1, 1, 1, 1,
0.8980784, 0.8122962, 1.380532, 1, 1, 1, 1, 1,
0.8992975, -1.122435, 2.396458, 1, 1, 1, 1, 1,
0.8995966, -0.593123, 3.792424, 1, 1, 1, 1, 1,
0.9005602, 0.4127471, 1.767962, 1, 1, 1, 1, 1,
0.9019685, -1.049112, 3.005445, 1, 1, 1, 1, 1,
0.9057378, 1.819527, 0.9782296, 1, 1, 1, 1, 1,
0.9118068, -1.443724, 0.9764069, 1, 1, 1, 1, 1,
0.9183944, 0.2935054, 3.364197, 0, 0, 1, 1, 1,
0.9197673, 0.4279619, 1.631435, 1, 0, 0, 1, 1,
0.9354944, -0.2951511, 3.496304, 1, 0, 0, 1, 1,
0.9361336, -0.802679, 3.068807, 1, 0, 0, 1, 1,
0.9465796, -1.739126, 4.560976, 1, 0, 0, 1, 1,
0.9474798, -0.6968933, 1.293898, 1, 0, 0, 1, 1,
0.956616, -0.3942107, 3.007308, 0, 0, 0, 1, 1,
0.9575967, 0.5353752, 0.3481424, 0, 0, 0, 1, 1,
0.9609496, 0.05787605, 1.773012, 0, 0, 0, 1, 1,
0.9625773, -0.3098337, 1.056589, 0, 0, 0, 1, 1,
0.9649324, -0.3243732, 0.2321648, 0, 0, 0, 1, 1,
0.9679976, 0.1141646, 3.391323, 0, 0, 0, 1, 1,
0.9690829, 0.1610578, -0.221557, 0, 0, 0, 1, 1,
0.9692362, 1.285738, 1.162336, 1, 1, 1, 1, 1,
0.9760926, 1.0214, 0.1322194, 1, 1, 1, 1, 1,
0.9776297, -0.2227757, 0.9932793, 1, 1, 1, 1, 1,
0.9816979, 0.6066121, 0.7941176, 1, 1, 1, 1, 1,
0.9837419, 0.3555477, 2.27956, 1, 1, 1, 1, 1,
0.987655, 1.195161, 2.148834, 1, 1, 1, 1, 1,
0.9892651, 1.436187, -0.2615578, 1, 1, 1, 1, 1,
0.9953519, 1.667069, 0.4229512, 1, 1, 1, 1, 1,
0.9970308, 0.271545, 2.39148, 1, 1, 1, 1, 1,
1.000832, 0.3775601, 0.665413, 1, 1, 1, 1, 1,
1.017009, -0.8885631, 1.428855, 1, 1, 1, 1, 1,
1.019971, 0.6801557, 2.68723, 1, 1, 1, 1, 1,
1.021856, -0.7352486, 2.624958, 1, 1, 1, 1, 1,
1.03013, -1.122244, 2.436229, 1, 1, 1, 1, 1,
1.0324, 0.5653207, 1.763568, 1, 1, 1, 1, 1,
1.035944, 1.272057, 0.9664096, 0, 0, 1, 1, 1,
1.044673, 0.1229827, 0.2396825, 1, 0, 0, 1, 1,
1.046305, 0.3338606, 2.306847, 1, 0, 0, 1, 1,
1.046924, -0.8312091, 1.807856, 1, 0, 0, 1, 1,
1.047664, -1.190117, 3.668122, 1, 0, 0, 1, 1,
1.049689, 1.085094, 1.820333, 1, 0, 0, 1, 1,
1.050987, -1.350142, 2.222296, 0, 0, 0, 1, 1,
1.054389, 0.5548957, -0.3327158, 0, 0, 0, 1, 1,
1.064817, -0.359778, 3.037608, 0, 0, 0, 1, 1,
1.066268, 0.3003476, 0.4709459, 0, 0, 0, 1, 1,
1.069952, 1.921132, -0.07723156, 0, 0, 0, 1, 1,
1.070148, 0.9903877, 0.2499387, 0, 0, 0, 1, 1,
1.073326, -0.04667614, 2.837003, 0, 0, 0, 1, 1,
1.075722, -0.3065187, 1.192554, 1, 1, 1, 1, 1,
1.083849, 1.299073, 1.7526, 1, 1, 1, 1, 1,
1.084713, -0.3690845, 2.134101, 1, 1, 1, 1, 1,
1.086648, 0.8391372, -0.02924836, 1, 1, 1, 1, 1,
1.093358, -0.2538934, 2.995971, 1, 1, 1, 1, 1,
1.09911, -0.0539563, 0.8505667, 1, 1, 1, 1, 1,
1.104284, 0.7054959, 1.203813, 1, 1, 1, 1, 1,
1.109038, 0.9979701, -0.02427409, 1, 1, 1, 1, 1,
1.111862, 1.023361, 1.42746, 1, 1, 1, 1, 1,
1.11386, -1.184443, 1.634582, 1, 1, 1, 1, 1,
1.122263, -0.0471607, 3.331619, 1, 1, 1, 1, 1,
1.135039, 2.858968, 2.575691, 1, 1, 1, 1, 1,
1.140057, -0.2262428, 2.979927, 1, 1, 1, 1, 1,
1.14132, -1.352341, 4.125782, 1, 1, 1, 1, 1,
1.141638, 2.300694, -0.8180098, 1, 1, 1, 1, 1,
1.145078, 0.08169761, 1.735831, 0, 0, 1, 1, 1,
1.145581, 0.5889548, 2.403736, 1, 0, 0, 1, 1,
1.145754, -1.986768, 2.040625, 1, 0, 0, 1, 1,
1.148671, -1.047319, 3.872247, 1, 0, 0, 1, 1,
1.152709, -0.1573492, 1.701462, 1, 0, 0, 1, 1,
1.160792, -0.1114442, 2.300663, 1, 0, 0, 1, 1,
1.162657, -1.248208, 0.9143645, 0, 0, 0, 1, 1,
1.163469, 0.3851306, 0.8832998, 0, 0, 0, 1, 1,
1.165853, -0.9757508, 1.475088, 0, 0, 0, 1, 1,
1.167796, -0.1156364, 2.623762, 0, 0, 0, 1, 1,
1.17467, 1.588874, 2.089983, 0, 0, 0, 1, 1,
1.17672, -0.1885359, 1.623019, 0, 0, 0, 1, 1,
1.178798, 1.965426, -0.6026244, 0, 0, 0, 1, 1,
1.182206, 0.2200114, 0.8621738, 1, 1, 1, 1, 1,
1.184112, 0.8598976, 0.9909359, 1, 1, 1, 1, 1,
1.188389, -0.9107522, 2.254058, 1, 1, 1, 1, 1,
1.194264, -0.4955978, 0.9548073, 1, 1, 1, 1, 1,
1.199647, -0.9682191, 0.8902903, 1, 1, 1, 1, 1,
1.200923, -1.891177, 3.234832, 1, 1, 1, 1, 1,
1.214426, 0.4358865, 0.6206787, 1, 1, 1, 1, 1,
1.21461, -0.1742832, 2.406128, 1, 1, 1, 1, 1,
1.21735, -1.539555, 2.660894, 1, 1, 1, 1, 1,
1.2184, -0.3302559, 2.30575, 1, 1, 1, 1, 1,
1.235677, 0.0439215, -0.7765818, 1, 1, 1, 1, 1,
1.240638, -0.9845401, 2.615919, 1, 1, 1, 1, 1,
1.242964, -0.1532856, 1.410356, 1, 1, 1, 1, 1,
1.243234, -0.8748172, 1.123908, 1, 1, 1, 1, 1,
1.246973, 0.3809572, 1.61639, 1, 1, 1, 1, 1,
1.250246, 0.01375882, 0.1252854, 0, 0, 1, 1, 1,
1.251395, -1.131735, 2.974483, 1, 0, 0, 1, 1,
1.252136, 0.2323093, 1.775992, 1, 0, 0, 1, 1,
1.25978, 2.340403, 0.1373776, 1, 0, 0, 1, 1,
1.263532, 1.294167, 1.190293, 1, 0, 0, 1, 1,
1.273267, 0.8750659, 1.124003, 1, 0, 0, 1, 1,
1.277129, 0.9170825, 2.040741, 0, 0, 0, 1, 1,
1.278813, -0.8262985, 2.563481, 0, 0, 0, 1, 1,
1.281194, -1.317399, 2.935421, 0, 0, 0, 1, 1,
1.294836, -1.305457, 2.092052, 0, 0, 0, 1, 1,
1.302288, 0.9214665, -0.6077588, 0, 0, 0, 1, 1,
1.302842, -0.5626194, 1.726325, 0, 0, 0, 1, 1,
1.31986, -0.2888972, 2.577941, 0, 0, 0, 1, 1,
1.332317, -1.29156, 2.848563, 1, 1, 1, 1, 1,
1.335727, -0.8865604, 2.970282, 1, 1, 1, 1, 1,
1.342876, 0.9174449, 0.532562, 1, 1, 1, 1, 1,
1.347623, -0.3975285, 1.521572, 1, 1, 1, 1, 1,
1.362451, 1.612867, -0.3303403, 1, 1, 1, 1, 1,
1.381915, 0.1636628, 1.683784, 1, 1, 1, 1, 1,
1.383242, -0.6222875, 0.3405728, 1, 1, 1, 1, 1,
1.383684, 0.3658191, 2.558466, 1, 1, 1, 1, 1,
1.385974, 2.210672, -1.677432, 1, 1, 1, 1, 1,
1.387621, -0.6571883, 1.934197, 1, 1, 1, 1, 1,
1.388945, -0.3685049, 2.188658, 1, 1, 1, 1, 1,
1.393242, -0.2588093, 0.6663956, 1, 1, 1, 1, 1,
1.399033, -0.02668415, 2.578536, 1, 1, 1, 1, 1,
1.400343, -0.2522303, 2.320492, 1, 1, 1, 1, 1,
1.404992, 1.689303, -0.5677326, 1, 1, 1, 1, 1,
1.405927, 0.2118268, 1.269366, 0, 0, 1, 1, 1,
1.412452, 0.5443418, 2.820206, 1, 0, 0, 1, 1,
1.425287, -0.2923184, 3.082795, 1, 0, 0, 1, 1,
1.446333, -0.20529, 1.760675, 1, 0, 0, 1, 1,
1.454527, -1.136155, 2.692336, 1, 0, 0, 1, 1,
1.459072, -1.311482, 1.816537, 1, 0, 0, 1, 1,
1.465024, -0.5794449, 1.964435, 0, 0, 0, 1, 1,
1.477515, 1.033901, 0.5567734, 0, 0, 0, 1, 1,
1.494936, -0.3866117, 1.809317, 0, 0, 0, 1, 1,
1.501665, 1.082609, 1.098916, 0, 0, 0, 1, 1,
1.503253, 0.1714217, 0.4718628, 0, 0, 0, 1, 1,
1.521321, 0.8988824, -0.02641453, 0, 0, 0, 1, 1,
1.524822, -0.5327184, 1.128616, 0, 0, 0, 1, 1,
1.52794, -0.7456554, -0.6094449, 1, 1, 1, 1, 1,
1.528164, -2.041954, 3.898893, 1, 1, 1, 1, 1,
1.536183, 1.057168, 0.4214348, 1, 1, 1, 1, 1,
1.54015, -0.009381943, 1.178637, 1, 1, 1, 1, 1,
1.570864, -0.5437746, 1.740988, 1, 1, 1, 1, 1,
1.578384, 1.710564, 1.960317, 1, 1, 1, 1, 1,
1.585927, -0.3263164, 1.109189, 1, 1, 1, 1, 1,
1.591357, 0.9251111, 1.869209, 1, 1, 1, 1, 1,
1.599687, -0.1353144, 1.885152, 1, 1, 1, 1, 1,
1.612127, -0.3279464, 2.359301, 1, 1, 1, 1, 1,
1.612985, 1.193298, 0.795304, 1, 1, 1, 1, 1,
1.62725, -1.195065, 2.553906, 1, 1, 1, 1, 1,
1.64845, -0.4248889, 1.86595, 1, 1, 1, 1, 1,
1.651693, -0.1557616, 3.600122, 1, 1, 1, 1, 1,
1.657547, 1.063267, 0.3888044, 1, 1, 1, 1, 1,
1.657916, 0.1751401, 0.9171321, 0, 0, 1, 1, 1,
1.666025, -1.858833, 2.418602, 1, 0, 0, 1, 1,
1.669951, 1.271783, 1.209265, 1, 0, 0, 1, 1,
1.696964, -0.1713691, 0.6756961, 1, 0, 0, 1, 1,
1.718599, -0.7794966, 3.683639, 1, 0, 0, 1, 1,
1.745281, -0.3383085, 2.554861, 1, 0, 0, 1, 1,
1.74715, 0.05129241, 1.337533, 0, 0, 0, 1, 1,
1.773116, -0.5306624, 1.522409, 0, 0, 0, 1, 1,
1.775736, -0.05871788, 0.2556348, 0, 0, 0, 1, 1,
1.779759, -0.2384089, 0.6872969, 0, 0, 0, 1, 1,
1.782495, 1.579293, 0.9155471, 0, 0, 0, 1, 1,
1.790337, -1.42448, 1.627641, 0, 0, 0, 1, 1,
1.791682, 1.04162, 3.22168, 0, 0, 0, 1, 1,
1.800336, -0.6233279, 3.052237, 1, 1, 1, 1, 1,
1.809113, -0.923272, 3.520716, 1, 1, 1, 1, 1,
1.82474, -1.76561, 2.22355, 1, 1, 1, 1, 1,
1.828104, -0.7827193, 1.774598, 1, 1, 1, 1, 1,
1.842999, 0.6773676, -0.9907091, 1, 1, 1, 1, 1,
1.844036, -1.598179, 1.422757, 1, 1, 1, 1, 1,
1.851172, 2.152097, 0.6897136, 1, 1, 1, 1, 1,
1.868647, 1.047861, -0.596511, 1, 1, 1, 1, 1,
1.871571, -0.2206933, 2.351329, 1, 1, 1, 1, 1,
1.917946, 0.1951567, 2.891007, 1, 1, 1, 1, 1,
1.92792, 0.5527201, 2.217262, 1, 1, 1, 1, 1,
1.931527, 1.481412, -0.2527015, 1, 1, 1, 1, 1,
1.978582, -0.3575667, 0.6266588, 1, 1, 1, 1, 1,
1.9877, -1.755651, 2.094706, 1, 1, 1, 1, 1,
2.024829, 1.524509, 3.042838, 1, 1, 1, 1, 1,
2.045247, -1.724986, 2.961268, 0, 0, 1, 1, 1,
2.061713, -0.5769209, 2.019438, 1, 0, 0, 1, 1,
2.072576, -0.8866748, 0.2982555, 1, 0, 0, 1, 1,
2.081315, -2.021735, 1.995194, 1, 0, 0, 1, 1,
2.114786, 1.88092, 0.5347769, 1, 0, 0, 1, 1,
2.174797, 0.3848368, 3.139427, 1, 0, 0, 1, 1,
2.195807, 0.3825159, 0.4208633, 0, 0, 0, 1, 1,
2.216718, -0.2440293, 1.897762, 0, 0, 0, 1, 1,
2.221246, -0.4470502, 0.7369308, 0, 0, 0, 1, 1,
2.23013, 1.4546, 0.9971988, 0, 0, 0, 1, 1,
2.235372, -1.971802, 4.391729, 0, 0, 0, 1, 1,
2.276088, -1.223186, -0.3771899, 0, 0, 0, 1, 1,
2.301033, 0.05783688, 1.554181, 0, 0, 0, 1, 1,
2.343188, -0.2994531, 1.680145, 1, 1, 1, 1, 1,
2.363835, -1.239202, 1.799304, 1, 1, 1, 1, 1,
2.419379, -1.157913, 0.5033897, 1, 1, 1, 1, 1,
2.610477, 0.6202323, 0.177215, 1, 1, 1, 1, 1,
2.622646, -1.04131, 4.049757, 1, 1, 1, 1, 1,
3.269752, 0.3627416, 2.515487, 1, 1, 1, 1, 1,
3.504312, -0.05331669, 0.9095672, 1, 1, 1, 1, 1
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
var radius = 10.59989;
var distance = 37.23166;
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
mvMatrix.translate( 0.1092081, -0.1277769, 0.1772051 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -37.23166);
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
