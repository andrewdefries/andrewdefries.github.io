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
-3.613212, 0.1756423, -1.916668, 1, 0, 0, 1,
-3.249496, -0.3012611, -1.693942, 1, 0.007843138, 0, 1,
-2.914312, 0.4091944, -2.378944, 1, 0.01176471, 0, 1,
-2.87256, 1.180717, -1.645514, 1, 0.01960784, 0, 1,
-2.661889, -0.4365538, -1.586044, 1, 0.02352941, 0, 1,
-2.592512, -0.805745, -2.346076, 1, 0.03137255, 0, 1,
-2.5836, -2.32944, -2.395873, 1, 0.03529412, 0, 1,
-2.534895, -0.4199693, -1.998923, 1, 0.04313726, 0, 1,
-2.462062, -1.084785, -2.932026, 1, 0.04705882, 0, 1,
-2.350723, 0.2019025, -1.63479, 1, 0.05490196, 0, 1,
-2.318395, -0.6644101, -2.217782, 1, 0.05882353, 0, 1,
-2.302662, -0.01467262, -1.539737, 1, 0.06666667, 0, 1,
-2.293494, -0.05243554, -0.9282663, 1, 0.07058824, 0, 1,
-2.239099, -0.5306538, -2.192062, 1, 0.07843138, 0, 1,
-2.229846, -0.1899497, -1.353696, 1, 0.08235294, 0, 1,
-2.207573, 0.8373904, -1.635085, 1, 0.09019608, 0, 1,
-2.196429, 0.4144669, -1.147289, 1, 0.09411765, 0, 1,
-2.194074, -2.017848, -1.283689, 1, 0.1019608, 0, 1,
-2.04479, 0.1781612, -3.439923, 1, 0.1098039, 0, 1,
-2.036609, -0.6157061, -0.9914619, 1, 0.1137255, 0, 1,
-1.97779, 0.6609246, -1.577038, 1, 0.1215686, 0, 1,
-1.976447, 1.965737, -0.7973563, 1, 0.1254902, 0, 1,
-1.965212, 0.2728625, -2.535907, 1, 0.1333333, 0, 1,
-1.95857, -1.125085, -1.832905, 1, 0.1372549, 0, 1,
-1.927838, 0.6636252, 0.2071952, 1, 0.145098, 0, 1,
-1.915149, 1.536812, -1.562507, 1, 0.1490196, 0, 1,
-1.909603, -1.971464, -3.89679, 1, 0.1568628, 0, 1,
-1.893704, 2.111314, 0.2126203, 1, 0.1607843, 0, 1,
-1.88911, -1.301854, -2.095963, 1, 0.1686275, 0, 1,
-1.884304, -0.06130001, -0.1133678, 1, 0.172549, 0, 1,
-1.878518, -1.26064, -0.4698359, 1, 0.1803922, 0, 1,
-1.868142, -0.1499271, -1.819908, 1, 0.1843137, 0, 1,
-1.865621, 1.817285, 0.1956609, 1, 0.1921569, 0, 1,
-1.864071, -0.8346776, -2.20624, 1, 0.1960784, 0, 1,
-1.841365, -0.3397361, -1.624994, 1, 0.2039216, 0, 1,
-1.835675, -0.09947769, -2.593535, 1, 0.2117647, 0, 1,
-1.814726, -1.574292, -2.015863, 1, 0.2156863, 0, 1,
-1.806266, 1.224679, -0.9680434, 1, 0.2235294, 0, 1,
-1.80435, -0.07215904, -2.092834, 1, 0.227451, 0, 1,
-1.797949, 0.9745229, 0.5428617, 1, 0.2352941, 0, 1,
-1.784184, 0.09331095, -1.221894, 1, 0.2392157, 0, 1,
-1.779705, -0.2964499, -2.329886, 1, 0.2470588, 0, 1,
-1.752459, -0.5884094, -2.676455, 1, 0.2509804, 0, 1,
-1.750255, -0.1161542, -3.854507, 1, 0.2588235, 0, 1,
-1.745681, -1.573569, -2.855688, 1, 0.2627451, 0, 1,
-1.74002, 2.289573, -0.2796632, 1, 0.2705882, 0, 1,
-1.734153, -0.470745, -1.314826, 1, 0.2745098, 0, 1,
-1.729794, -0.2317687, -1.34887, 1, 0.282353, 0, 1,
-1.727133, -0.04820221, -1.976349, 1, 0.2862745, 0, 1,
-1.711816, -0.06932148, 0.5064965, 1, 0.2941177, 0, 1,
-1.686737, -0.07260669, -1.950459, 1, 0.3019608, 0, 1,
-1.679278, -0.7273214, 0.6179474, 1, 0.3058824, 0, 1,
-1.673891, -2.062449, 0.07312071, 1, 0.3137255, 0, 1,
-1.666712, 1.787124, -0.2875453, 1, 0.3176471, 0, 1,
-1.663049, -0.8236765, -1.952995, 1, 0.3254902, 0, 1,
-1.64751, 0.7105995, -2.009657, 1, 0.3294118, 0, 1,
-1.64175, 0.05281738, -3.0175, 1, 0.3372549, 0, 1,
-1.636014, -0.8410812, -4.103736, 1, 0.3411765, 0, 1,
-1.629359, -0.6255376, -1.181731, 1, 0.3490196, 0, 1,
-1.6255, -0.08888498, -0.2285658, 1, 0.3529412, 0, 1,
-1.616536, -1.239193, -1.582692, 1, 0.3607843, 0, 1,
-1.612982, -1.97835, -1.508274, 1, 0.3647059, 0, 1,
-1.60404, 1.777303, -0.6425433, 1, 0.372549, 0, 1,
-1.593656, 0.2417503, -4.049071, 1, 0.3764706, 0, 1,
-1.572772, -1.474614, -2.904949, 1, 0.3843137, 0, 1,
-1.568558, -1.194366, -3.048668, 1, 0.3882353, 0, 1,
-1.556732, -0.2202219, -2.146539, 1, 0.3960784, 0, 1,
-1.552364, 0.05775792, -0.851434, 1, 0.4039216, 0, 1,
-1.55016, -0.7418463, -1.946249, 1, 0.4078431, 0, 1,
-1.547336, -0.01199407, -1.998356, 1, 0.4156863, 0, 1,
-1.532803, -0.963974, -2.530877, 1, 0.4196078, 0, 1,
-1.522902, 2.16639, 0.01270197, 1, 0.427451, 0, 1,
-1.509644, 0.5605637, -0.6877514, 1, 0.4313726, 0, 1,
-1.498238, -1.718295, -4.186671, 1, 0.4392157, 0, 1,
-1.490496, -0.3593021, -2.295457, 1, 0.4431373, 0, 1,
-1.488169, -1.190975, -3.457425, 1, 0.4509804, 0, 1,
-1.485846, 0.4765323, -1.635641, 1, 0.454902, 0, 1,
-1.476659, 0.09342112, -0.5989401, 1, 0.4627451, 0, 1,
-1.475473, 0.8985202, -1.90763, 1, 0.4666667, 0, 1,
-1.473083, -1.06587, -1.827376, 1, 0.4745098, 0, 1,
-1.467043, -0.1729159, -2.143029, 1, 0.4784314, 0, 1,
-1.465472, -1.232017, -2.814327, 1, 0.4862745, 0, 1,
-1.464857, 0.887212, -1.87459, 1, 0.4901961, 0, 1,
-1.464292, -1.308263, -2.127397, 1, 0.4980392, 0, 1,
-1.462157, 0.1029127, -0.9426016, 1, 0.5058824, 0, 1,
-1.457759, 0.8669181, -0.6314159, 1, 0.509804, 0, 1,
-1.456306, 0.5166824, -1.967777, 1, 0.5176471, 0, 1,
-1.455844, -0.2953723, -1.446355, 1, 0.5215687, 0, 1,
-1.449705, -0.2878506, -0.3400861, 1, 0.5294118, 0, 1,
-1.449545, -0.4406801, -3.46014, 1, 0.5333334, 0, 1,
-1.446366, 0.1139547, -0.3982797, 1, 0.5411765, 0, 1,
-1.439275, -1.649677, -2.61622, 1, 0.5450981, 0, 1,
-1.434777, -0.7780827, -0.4074243, 1, 0.5529412, 0, 1,
-1.407326, -0.740241, -0.09298454, 1, 0.5568628, 0, 1,
-1.402792, -0.09839994, -2.07281, 1, 0.5647059, 0, 1,
-1.396293, -1.298038, -0.9087452, 1, 0.5686275, 0, 1,
-1.393174, 1.012148, -0.4195025, 1, 0.5764706, 0, 1,
-1.388728, -1.050638, -2.80176, 1, 0.5803922, 0, 1,
-1.383034, 0.2470883, -0.4841967, 1, 0.5882353, 0, 1,
-1.382149, 0.3264312, -1.039699, 1, 0.5921569, 0, 1,
-1.380965, -0.3403356, -2.629476, 1, 0.6, 0, 1,
-1.380177, 0.2704245, -3.02415, 1, 0.6078432, 0, 1,
-1.376713, -1.496985, -0.9994126, 1, 0.6117647, 0, 1,
-1.37531, 1.828592, 0.7260833, 1, 0.6196079, 0, 1,
-1.359116, 0.008841569, -0.4045689, 1, 0.6235294, 0, 1,
-1.358387, 0.388638, -3.104534, 1, 0.6313726, 0, 1,
-1.356069, 0.5775817, -2.051281, 1, 0.6352941, 0, 1,
-1.355879, 0.6618922, -0.4153709, 1, 0.6431373, 0, 1,
-1.351329, -1.187789, -2.902334, 1, 0.6470588, 0, 1,
-1.335606, -0.004063984, -2.941524, 1, 0.654902, 0, 1,
-1.3166, 0.6019557, -0.02704242, 1, 0.6588235, 0, 1,
-1.311808, 0.6530772, -0.6058833, 1, 0.6666667, 0, 1,
-1.309327, 0.09331223, 0.8820274, 1, 0.6705883, 0, 1,
-1.304283, -2.147293, -3.350864, 1, 0.6784314, 0, 1,
-1.278778, 0.4495986, -2.260005, 1, 0.682353, 0, 1,
-1.273684, 1.553118, -0.4299546, 1, 0.6901961, 0, 1,
-1.272436, 0.2185843, -2.54542, 1, 0.6941177, 0, 1,
-1.272151, -0.4743637, -1.847985, 1, 0.7019608, 0, 1,
-1.26618, 1.389318, 0.1009388, 1, 0.7098039, 0, 1,
-1.26282, 0.622106, -0.8156255, 1, 0.7137255, 0, 1,
-1.260714, 1.055635, 1.088332, 1, 0.7215686, 0, 1,
-1.258471, -0.783725, -0.8097012, 1, 0.7254902, 0, 1,
-1.253334, 1.503124, -3.385773, 1, 0.7333333, 0, 1,
-1.249193, -1.174729, -3.844552, 1, 0.7372549, 0, 1,
-1.245482, 0.4686137, -1.067137, 1, 0.7450981, 0, 1,
-1.244124, 1.99568, -0.5470623, 1, 0.7490196, 0, 1,
-1.241695, -0.03404674, -1.315144, 1, 0.7568628, 0, 1,
-1.231694, 0.8576518, 1.048999, 1, 0.7607843, 0, 1,
-1.224757, -1.291598, -0.2850506, 1, 0.7686275, 0, 1,
-1.221482, 1.121739, -0.9807605, 1, 0.772549, 0, 1,
-1.220595, 1.505466, -1.159073, 1, 0.7803922, 0, 1,
-1.216313, -0.3057179, -1.206495, 1, 0.7843137, 0, 1,
-1.214525, 0.862502, 0.2760803, 1, 0.7921569, 0, 1,
-1.20136, -0.6587484, -3.056933, 1, 0.7960784, 0, 1,
-1.198193, 0.2333213, -1.415334, 1, 0.8039216, 0, 1,
-1.1959, 0.4239411, -0.6919833, 1, 0.8117647, 0, 1,
-1.192859, 0.6830484, -1.761984, 1, 0.8156863, 0, 1,
-1.192833, -1.569299, -4.139122, 1, 0.8235294, 0, 1,
-1.191305, -0.03077072, -2.508545, 1, 0.827451, 0, 1,
-1.188993, 0.6849588, -1.881266, 1, 0.8352941, 0, 1,
-1.187799, -0.6416933, -3.648926, 1, 0.8392157, 0, 1,
-1.170581, 0.3958588, -3.190778, 1, 0.8470588, 0, 1,
-1.170566, -2.130845, -2.481878, 1, 0.8509804, 0, 1,
-1.16789, -2.061362, -1.690004, 1, 0.8588235, 0, 1,
-1.167167, -0.6836061, -2.99544, 1, 0.8627451, 0, 1,
-1.157212, 0.6938114, -0.1629694, 1, 0.8705882, 0, 1,
-1.156955, 2.053717, -0.4913216, 1, 0.8745098, 0, 1,
-1.14672, 1.222528, 0.03565633, 1, 0.8823529, 0, 1,
-1.133905, 0.04283307, -1.307016, 1, 0.8862745, 0, 1,
-1.133441, 1.537403, -0.03523541, 1, 0.8941177, 0, 1,
-1.126481, 0.09518418, -1.133129, 1, 0.8980392, 0, 1,
-1.12334, -1.317233, -2.630002, 1, 0.9058824, 0, 1,
-1.118785, -0.8360889, -2.92316, 1, 0.9137255, 0, 1,
-1.116941, 0.538833, -2.565885, 1, 0.9176471, 0, 1,
-1.114168, -0.3495238, -2.15577, 1, 0.9254902, 0, 1,
-1.108882, -0.9456635, -3.976243, 1, 0.9294118, 0, 1,
-1.097996, -1.069301, -1.353809, 1, 0.9372549, 0, 1,
-1.094567, 0.03327788, -0.5277897, 1, 0.9411765, 0, 1,
-1.090238, -0.3615257, -3.228876, 1, 0.9490196, 0, 1,
-1.084831, 1.045168, 0.2829396, 1, 0.9529412, 0, 1,
-1.076424, 1.256989, -2.120744, 1, 0.9607843, 0, 1,
-1.074458, -0.3473293, -3.401917, 1, 0.9647059, 0, 1,
-1.074005, -0.2286651, -2.504102, 1, 0.972549, 0, 1,
-1.061274, 1.176907, -0.8123544, 1, 0.9764706, 0, 1,
-1.056012, 0.7376937, -2.205725, 1, 0.9843137, 0, 1,
-1.038989, -2.335614, -3.287791, 1, 0.9882353, 0, 1,
-1.029141, -0.2517631, -1.333462, 1, 0.9960784, 0, 1,
-1.025629, -1.226269, -2.277273, 0.9960784, 1, 0, 1,
-1.024888, 2.921148, -1.137985, 0.9921569, 1, 0, 1,
-1.021439, 1.142668, 0.565331, 0.9843137, 1, 0, 1,
-1.02007, -0.2883658, -0.6966963, 0.9803922, 1, 0, 1,
-1.017142, 1.152174, -1.121164, 0.972549, 1, 0, 1,
-1.010301, -0.9295813, -1.382497, 0.9686275, 1, 0, 1,
-1.005673, 1.309433, -1.224937, 0.9607843, 1, 0, 1,
-0.9991102, -0.123689, -1.024161, 0.9568627, 1, 0, 1,
-0.998533, 0.5415696, -2.432399, 0.9490196, 1, 0, 1,
-0.9971178, 0.9080718, -2.047857, 0.945098, 1, 0, 1,
-0.9955658, 0.1460826, -2.722324, 0.9372549, 1, 0, 1,
-0.9944486, -0.2649439, -3.54392, 0.9333333, 1, 0, 1,
-0.9898316, 0.008040961, -2.036413, 0.9254902, 1, 0, 1,
-0.9895288, 1.570061, 0.0839301, 0.9215686, 1, 0, 1,
-0.9795498, 0.3587119, -1.22481, 0.9137255, 1, 0, 1,
-0.9705979, 0.640166, -0.7149282, 0.9098039, 1, 0, 1,
-0.9691745, 1.397091, -0.5576954, 0.9019608, 1, 0, 1,
-0.9670162, -1.748252, -3.074121, 0.8941177, 1, 0, 1,
-0.96334, -0.3403685, -1.991043, 0.8901961, 1, 0, 1,
-0.9608412, -0.5160009, -0.829565, 0.8823529, 1, 0, 1,
-0.9560073, -0.3241205, -1.665692, 0.8784314, 1, 0, 1,
-0.9549141, 2.468055, -0.9164976, 0.8705882, 1, 0, 1,
-0.9541374, 0.03538506, -2.00262, 0.8666667, 1, 0, 1,
-0.9512507, 0.3183818, 0.2987629, 0.8588235, 1, 0, 1,
-0.9402405, 1.249226, -0.556892, 0.854902, 1, 0, 1,
-0.9399995, -0.08184409, -2.736312, 0.8470588, 1, 0, 1,
-0.9362762, -0.3046845, -0.533824, 0.8431373, 1, 0, 1,
-0.9356635, 0.01662749, -1.268499, 0.8352941, 1, 0, 1,
-0.9325469, 0.171757, -0.1604157, 0.8313726, 1, 0, 1,
-0.929051, -0.8386414, -2.121461, 0.8235294, 1, 0, 1,
-0.92457, 1.36553, -1.192394, 0.8196079, 1, 0, 1,
-0.9221391, -1.022516, -3.379305, 0.8117647, 1, 0, 1,
-0.9220341, -0.8856965, -1.775751, 0.8078431, 1, 0, 1,
-0.9182317, 0.2424743, -0.6231216, 0.8, 1, 0, 1,
-0.9156048, -1.907518, -2.120745, 0.7921569, 1, 0, 1,
-0.9130591, 0.03234513, 1.848496, 0.7882353, 1, 0, 1,
-0.9124545, 0.6693202, -0.7844128, 0.7803922, 1, 0, 1,
-0.9055903, -1.225542, -0.9764886, 0.7764706, 1, 0, 1,
-0.9053344, -1.89854, -3.181185, 0.7686275, 1, 0, 1,
-0.9002212, 0.9112882, -0.8057931, 0.7647059, 1, 0, 1,
-0.8938043, 0.4129753, -1.569792, 0.7568628, 1, 0, 1,
-0.8888764, 1.580628, -0.7278019, 0.7529412, 1, 0, 1,
-0.8880632, -1.769819, -2.498335, 0.7450981, 1, 0, 1,
-0.8810527, -0.1058786, -1.472594, 0.7411765, 1, 0, 1,
-0.8766519, 1.336988, -1.506765, 0.7333333, 1, 0, 1,
-0.8750118, 1.245171, -1.883245, 0.7294118, 1, 0, 1,
-0.8700882, 0.4622489, -1.200299, 0.7215686, 1, 0, 1,
-0.8697151, -0.7651268, -3.529718, 0.7176471, 1, 0, 1,
-0.8681483, 2.416546, 0.6240283, 0.7098039, 1, 0, 1,
-0.8655879, -0.1277187, -4.268296, 0.7058824, 1, 0, 1,
-0.863738, 1.175465, -1.492953, 0.6980392, 1, 0, 1,
-0.8627771, -1.524273, -2.147845, 0.6901961, 1, 0, 1,
-0.8566875, 1.039218, -1.609553, 0.6862745, 1, 0, 1,
-0.8557221, 0.6099643, -0.4169351, 0.6784314, 1, 0, 1,
-0.8551098, -1.906744, -0.9606976, 0.6745098, 1, 0, 1,
-0.8550188, 0.8915387, -0.4814792, 0.6666667, 1, 0, 1,
-0.8503896, -0.5357454, -1.273324, 0.6627451, 1, 0, 1,
-0.844355, -0.892978, -1.888953, 0.654902, 1, 0, 1,
-0.8436209, 1.069263, -1.911347, 0.6509804, 1, 0, 1,
-0.8388302, 0.004481087, -1.07489, 0.6431373, 1, 0, 1,
-0.8304656, 0.9073514, -0.2283923, 0.6392157, 1, 0, 1,
-0.8255679, 0.1141674, -0.8218193, 0.6313726, 1, 0, 1,
-0.8237174, -0.9478519, -2.721228, 0.627451, 1, 0, 1,
-0.8215553, -1.516378, -1.659407, 0.6196079, 1, 0, 1,
-0.8125914, 0.03027235, -0.8171837, 0.6156863, 1, 0, 1,
-0.8004031, 1.251163, 0.3366284, 0.6078432, 1, 0, 1,
-0.7939141, 0.8429016, -0.968547, 0.6039216, 1, 0, 1,
-0.7896647, -0.7905995, -3.635588, 0.5960785, 1, 0, 1,
-0.7848246, -0.7204027, -0.2788174, 0.5882353, 1, 0, 1,
-0.7801095, 1.222, -1.230873, 0.5843138, 1, 0, 1,
-0.7748984, 0.431435, -1.705622, 0.5764706, 1, 0, 1,
-0.7731459, -0.1746427, -0.6734352, 0.572549, 1, 0, 1,
-0.7691313, -1.562624, -2.047024, 0.5647059, 1, 0, 1,
-0.7686526, 0.1227813, -2.067129, 0.5607843, 1, 0, 1,
-0.7651428, 0.5699835, 0.3458037, 0.5529412, 1, 0, 1,
-0.7624528, 0.5368367, -1.486022, 0.5490196, 1, 0, 1,
-0.7613662, -1.630691, -4.26426, 0.5411765, 1, 0, 1,
-0.759286, -0.988926, -2.983473, 0.5372549, 1, 0, 1,
-0.7545374, 0.4453233, -1.176178, 0.5294118, 1, 0, 1,
-0.754111, 0.1946517, -1.457646, 0.5254902, 1, 0, 1,
-0.7505167, -1.722796, -0.7175207, 0.5176471, 1, 0, 1,
-0.7434741, 0.4627067, -1.821048, 0.5137255, 1, 0, 1,
-0.7308751, -1.376564, -1.802312, 0.5058824, 1, 0, 1,
-0.7278913, 1.430312, -0.103212, 0.5019608, 1, 0, 1,
-0.7273075, -0.9077465, -1.532894, 0.4941176, 1, 0, 1,
-0.7259883, -1.551432, -5.022852, 0.4862745, 1, 0, 1,
-0.7227786, -0.5197791, -0.8842204, 0.4823529, 1, 0, 1,
-0.714242, -0.3618754, -2.346761, 0.4745098, 1, 0, 1,
-0.7139137, 0.3776164, -1.627521, 0.4705882, 1, 0, 1,
-0.7124835, 0.02337221, -2.002151, 0.4627451, 1, 0, 1,
-0.7113834, -0.07923473, -1.675602, 0.4588235, 1, 0, 1,
-0.6977059, -0.79401, -1.564569, 0.4509804, 1, 0, 1,
-0.6975353, 0.8988631, 0.09268444, 0.4470588, 1, 0, 1,
-0.6931515, 0.490878, -1.417318, 0.4392157, 1, 0, 1,
-0.6913415, -0.6425425, -2.037964, 0.4352941, 1, 0, 1,
-0.6912069, 0.4419168, 0.7801093, 0.427451, 1, 0, 1,
-0.6846215, -0.442025, -1.512956, 0.4235294, 1, 0, 1,
-0.6845321, -0.6115502, -2.509975, 0.4156863, 1, 0, 1,
-0.678917, -0.2577444, -2.036352, 0.4117647, 1, 0, 1,
-0.674013, 2.005695, 1.131448, 0.4039216, 1, 0, 1,
-0.6736751, 1.601052, -1.712178, 0.3960784, 1, 0, 1,
-0.6718042, -1.039344, -1.672655, 0.3921569, 1, 0, 1,
-0.6714712, -0.9329425, -2.299723, 0.3843137, 1, 0, 1,
-0.6702274, 1.120142, -0.8282209, 0.3803922, 1, 0, 1,
-0.6633672, -0.4823847, -1.906137, 0.372549, 1, 0, 1,
-0.6533232, -0.1197699, -2.197135, 0.3686275, 1, 0, 1,
-0.6458274, -0.5336367, -2.035771, 0.3607843, 1, 0, 1,
-0.6450894, 1.251211, -0.9613218, 0.3568628, 1, 0, 1,
-0.6416145, -0.2553087, -1.069057, 0.3490196, 1, 0, 1,
-0.6413123, -0.6764094, -3.197083, 0.345098, 1, 0, 1,
-0.6377219, -0.5881861, -2.323045, 0.3372549, 1, 0, 1,
-0.6352435, -0.6195564, -2.487002, 0.3333333, 1, 0, 1,
-0.631313, -0.0170176, -1.403022, 0.3254902, 1, 0, 1,
-0.6257256, -0.8233648, -4.752868, 0.3215686, 1, 0, 1,
-0.6154589, -0.4662118, -2.411448, 0.3137255, 1, 0, 1,
-0.6153415, -0.7063954, -1.563436, 0.3098039, 1, 0, 1,
-0.6129432, -0.7947598, -3.124426, 0.3019608, 1, 0, 1,
-0.6103724, -1.087591, -3.032309, 0.2941177, 1, 0, 1,
-0.6094152, 0.3943828, -0.5343997, 0.2901961, 1, 0, 1,
-0.6055031, 1.190032, -1.741404, 0.282353, 1, 0, 1,
-0.6045727, 0.2428469, -1.450098, 0.2784314, 1, 0, 1,
-0.597926, 1.68443, -0.4281618, 0.2705882, 1, 0, 1,
-0.5966101, 2.063189, -1.964303, 0.2666667, 1, 0, 1,
-0.5961916, -0.05318659, -3.359421, 0.2588235, 1, 0, 1,
-0.595585, 0.1705084, -1.606023, 0.254902, 1, 0, 1,
-0.5867189, 0.9127927, -2.909717, 0.2470588, 1, 0, 1,
-0.5843973, -2.543802, -3.163026, 0.2431373, 1, 0, 1,
-0.583562, -0.8508406, -2.066009, 0.2352941, 1, 0, 1,
-0.5774881, -0.4253451, -1.665256, 0.2313726, 1, 0, 1,
-0.5721021, 0.07759634, -0.6080388, 0.2235294, 1, 0, 1,
-0.5701292, -1.605112, -1.48102, 0.2196078, 1, 0, 1,
-0.564283, 1.067309, -2.09534, 0.2117647, 1, 0, 1,
-0.561241, -0.5555674, -1.740163, 0.2078431, 1, 0, 1,
-0.5559195, -1.369946, -1.065802, 0.2, 1, 0, 1,
-0.544846, 0.08836012, -0.5477843, 0.1921569, 1, 0, 1,
-0.5443872, -0.5460181, -2.145051, 0.1882353, 1, 0, 1,
-0.544238, 3.280542, -1.213842, 0.1803922, 1, 0, 1,
-0.5426381, -0.4689032, -4.775594, 0.1764706, 1, 0, 1,
-0.5425234, 0.1099122, -1.780322, 0.1686275, 1, 0, 1,
-0.5414974, -0.1144289, -2.062362, 0.1647059, 1, 0, 1,
-0.5356751, -0.2748366, -4.113624, 0.1568628, 1, 0, 1,
-0.5348706, -0.2800106, -1.385859, 0.1529412, 1, 0, 1,
-0.5309139, -0.3440052, -1.722504, 0.145098, 1, 0, 1,
-0.5259597, 0.009845295, 0.01646621, 0.1411765, 1, 0, 1,
-0.5259423, -0.5916553, -3.536318, 0.1333333, 1, 0, 1,
-0.5166467, 0.1459957, -2.439918, 0.1294118, 1, 0, 1,
-0.5166297, -1.071848, -3.590332, 0.1215686, 1, 0, 1,
-0.514922, 0.07976974, -2.017499, 0.1176471, 1, 0, 1,
-0.5089501, 0.7139878, 0.1751334, 0.1098039, 1, 0, 1,
-0.5065911, 1.051271, 0.1756043, 0.1058824, 1, 0, 1,
-0.5040116, 0.2016462, -2.660492, 0.09803922, 1, 0, 1,
-0.5023243, -1.473562, -3.752174, 0.09019608, 1, 0, 1,
-0.5020198, -1.064093, -0.9966811, 0.08627451, 1, 0, 1,
-0.5013639, -0.7988673, -1.574116, 0.07843138, 1, 0, 1,
-0.498974, 0.5229951, -0.5861837, 0.07450981, 1, 0, 1,
-0.4963346, 0.399769, -0.2037866, 0.06666667, 1, 0, 1,
-0.4931385, -0.419879, -2.53758, 0.0627451, 1, 0, 1,
-0.4924545, -1.687571, -4.25369, 0.05490196, 1, 0, 1,
-0.4924314, -1.383396, -4.296291, 0.05098039, 1, 0, 1,
-0.4915019, -0.1356162, -3.031308, 0.04313726, 1, 0, 1,
-0.4912364, -0.5495003, -0.9562565, 0.03921569, 1, 0, 1,
-0.481977, 0.6540341, 0.1514002, 0.03137255, 1, 0, 1,
-0.4790931, 0.107739, -1.7184, 0.02745098, 1, 0, 1,
-0.4780809, 0.4308489, -0.5159506, 0.01960784, 1, 0, 1,
-0.477832, -0.1232073, -2.291932, 0.01568628, 1, 0, 1,
-0.4772213, 2.060777, 0.4257725, 0.007843138, 1, 0, 1,
-0.4741441, -0.6829318, -1.910288, 0.003921569, 1, 0, 1,
-0.4724095, -0.8334209, -0.8850302, 0, 1, 0.003921569, 1,
-0.4703656, -0.5538048, -2.42154, 0, 1, 0.01176471, 1,
-0.4696733, 0.1800311, -0.9090619, 0, 1, 0.01568628, 1,
-0.4677041, -2.755199, -2.62958, 0, 1, 0.02352941, 1,
-0.4631227, 0.80646, -0.6177059, 0, 1, 0.02745098, 1,
-0.4617919, -0.2108939, -1.309374, 0, 1, 0.03529412, 1,
-0.4615377, 2.193974, -1.090411, 0, 1, 0.03921569, 1,
-0.4602518, 0.2476451, -2.41495, 0, 1, 0.04705882, 1,
-0.4546279, 0.2228431, -1.269783, 0, 1, 0.05098039, 1,
-0.4537392, 0.15825, -2.554438, 0, 1, 0.05882353, 1,
-0.4458794, -1.34008, -3.680958, 0, 1, 0.0627451, 1,
-0.4372489, -0.6900837, -2.764263, 0, 1, 0.07058824, 1,
-0.4363896, -0.2613656, -2.26162, 0, 1, 0.07450981, 1,
-0.4352511, 2.368396, -1.613533, 0, 1, 0.08235294, 1,
-0.4349889, -0.2230038, -2.746395, 0, 1, 0.08627451, 1,
-0.4320224, 0.2939807, -2.078101, 0, 1, 0.09411765, 1,
-0.4293344, -1.025269, -3.729237, 0, 1, 0.1019608, 1,
-0.4177693, -0.6622221, -2.711331, 0, 1, 0.1058824, 1,
-0.4164264, -0.4118499, -2.685375, 0, 1, 0.1137255, 1,
-0.4143354, 0.2998544, -0.4352041, 0, 1, 0.1176471, 1,
-0.4120257, -0.4387951, -2.263145, 0, 1, 0.1254902, 1,
-0.4073511, -1.664658, -2.380588, 0, 1, 0.1294118, 1,
-0.4062672, -0.02541563, -1.674426, 0, 1, 0.1372549, 1,
-0.4020103, -1.597675, -3.558741, 0, 1, 0.1411765, 1,
-0.3972072, -1.415154, -2.061868, 0, 1, 0.1490196, 1,
-0.3934308, -2.275181, -1.92763, 0, 1, 0.1529412, 1,
-0.3895898, -0.7506354, -2.338664, 0, 1, 0.1607843, 1,
-0.3883514, -1.996305, -2.22821, 0, 1, 0.1647059, 1,
-0.3878263, -0.7923659, -1.385568, 0, 1, 0.172549, 1,
-0.3834797, 0.06424008, -2.647916, 0, 1, 0.1764706, 1,
-0.3787282, -1.903063, -1.591965, 0, 1, 0.1843137, 1,
-0.3710903, -0.8314362, -1.806485, 0, 1, 0.1882353, 1,
-0.370938, -0.5095986, -2.83111, 0, 1, 0.1960784, 1,
-0.3614796, -1.17997, -3.87329, 0, 1, 0.2039216, 1,
-0.3614169, 1.066681, -0.07846465, 0, 1, 0.2078431, 1,
-0.3608367, -1.334596, -2.411006, 0, 1, 0.2156863, 1,
-0.3513258, -2.054519, -3.120995, 0, 1, 0.2196078, 1,
-0.3512821, -0.2367835, -1.12523, 0, 1, 0.227451, 1,
-0.3503933, -1.556437, -3.528755, 0, 1, 0.2313726, 1,
-0.3482942, 0.9422982, -1.077781, 0, 1, 0.2392157, 1,
-0.3473008, -0.398474, -2.60541, 0, 1, 0.2431373, 1,
-0.3458806, -1.115577, -0.8744099, 0, 1, 0.2509804, 1,
-0.3446123, 0.1896107, -2.447985, 0, 1, 0.254902, 1,
-0.3406489, 2.110908, 0.6414033, 0, 1, 0.2627451, 1,
-0.3388218, -2.191275, -4.778474, 0, 1, 0.2666667, 1,
-0.332961, -0.7575065, -3.926399, 0, 1, 0.2745098, 1,
-0.3314515, -1.33526, -4.560217, 0, 1, 0.2784314, 1,
-0.3299952, -0.7080016, -3.009278, 0, 1, 0.2862745, 1,
-0.3298284, -0.71415, -2.29815, 0, 1, 0.2901961, 1,
-0.328273, 1.012266, -1.766472, 0, 1, 0.2980392, 1,
-0.3276662, 1.271268, 0.8926385, 0, 1, 0.3058824, 1,
-0.3267037, -1.545168, -4.141985, 0, 1, 0.3098039, 1,
-0.324947, -0.4124935, -1.86208, 0, 1, 0.3176471, 1,
-0.3196822, -0.2629511, -2.866368, 0, 1, 0.3215686, 1,
-0.3180639, -1.18062, -2.744032, 0, 1, 0.3294118, 1,
-0.3155212, 0.564302, 0.0902528, 0, 1, 0.3333333, 1,
-0.315338, 0.2953973, -1.729516, 0, 1, 0.3411765, 1,
-0.3138837, 1.078502, -0.2589749, 0, 1, 0.345098, 1,
-0.3120717, 0.767491, -0.9070976, 0, 1, 0.3529412, 1,
-0.3091587, 0.151772, -1.12305, 0, 1, 0.3568628, 1,
-0.3074887, -1.435994, -2.666746, 0, 1, 0.3647059, 1,
-0.2985897, -0.6303463, -1.097628, 0, 1, 0.3686275, 1,
-0.295518, 0.07057118, -1.057926, 0, 1, 0.3764706, 1,
-0.2946604, 0.478302, -1.021654, 0, 1, 0.3803922, 1,
-0.293348, -0.3201328, -2.71543, 0, 1, 0.3882353, 1,
-0.2928301, 0.09186757, -2.352905, 0, 1, 0.3921569, 1,
-0.2919224, -0.8384851, -3.70438, 0, 1, 0.4, 1,
-0.2902172, -0.8160848, -2.011326, 0, 1, 0.4078431, 1,
-0.2890105, -1.312705, -2.376373, 0, 1, 0.4117647, 1,
-0.2855564, -0.2257501, -3.216612, 0, 1, 0.4196078, 1,
-0.2851912, 0.2978033, -0.2180983, 0, 1, 0.4235294, 1,
-0.2830722, 0.1100008, -1.272417, 0, 1, 0.4313726, 1,
-0.2813329, 0.4373613, -1.028122, 0, 1, 0.4352941, 1,
-0.2752655, 0.6073375, -2.292336, 0, 1, 0.4431373, 1,
-0.2748165, 0.6570023, -0.4469163, 0, 1, 0.4470588, 1,
-0.2651221, 1.008099, 2.461287, 0, 1, 0.454902, 1,
-0.2638681, -1.082494, -0.8091294, 0, 1, 0.4588235, 1,
-0.2624331, -1.246151, -3.317642, 0, 1, 0.4666667, 1,
-0.2583782, 0.8929633, 1.351489, 0, 1, 0.4705882, 1,
-0.2580735, 0.01806104, -1.969925, 0, 1, 0.4784314, 1,
-0.2578503, -1.370595, -4.184297, 0, 1, 0.4823529, 1,
-0.2534062, 0.03433731, -0.6250239, 0, 1, 0.4901961, 1,
-0.2454717, 1.174002, 0.6397905, 0, 1, 0.4941176, 1,
-0.2403006, 0.01299891, -2.582291, 0, 1, 0.5019608, 1,
-0.2396003, 1.146087, 1.079678, 0, 1, 0.509804, 1,
-0.2392823, -0.372313, -3.40978, 0, 1, 0.5137255, 1,
-0.2376059, 0.5965351, -1.865271, 0, 1, 0.5215687, 1,
-0.2374076, 0.7668655, 0.9077553, 0, 1, 0.5254902, 1,
-0.2372014, 0.4029239, -0.7313118, 0, 1, 0.5333334, 1,
-0.2371525, 0.8181655, -0.1125362, 0, 1, 0.5372549, 1,
-0.2327553, -0.1196377, -1.656475, 0, 1, 0.5450981, 1,
-0.2302951, 0.191719, -1.803442, 0, 1, 0.5490196, 1,
-0.2295411, -0.261337, -1.986347, 0, 1, 0.5568628, 1,
-0.2254107, -1.388849, -1.052131, 0, 1, 0.5607843, 1,
-0.2220685, -1.075464, -2.327684, 0, 1, 0.5686275, 1,
-0.2104392, 0.4375181, -0.9743164, 0, 1, 0.572549, 1,
-0.202011, -0.6456634, -3.379918, 0, 1, 0.5803922, 1,
-0.1869993, -0.639624, -3.861537, 0, 1, 0.5843138, 1,
-0.1807514, 1.499166, -1.420284, 0, 1, 0.5921569, 1,
-0.1807067, -0.290177, -3.09364, 0, 1, 0.5960785, 1,
-0.1792504, 0.1446161, 0.5187374, 0, 1, 0.6039216, 1,
-0.1785195, 0.9472167, -0.3523583, 0, 1, 0.6117647, 1,
-0.1761453, 0.2588553, 0.2982449, 0, 1, 0.6156863, 1,
-0.1699885, -0.8878306, -4.959799, 0, 1, 0.6235294, 1,
-0.1675196, -0.1417841, 0.1804138, 0, 1, 0.627451, 1,
-0.1674625, 0.3850081, -0.8331327, 0, 1, 0.6352941, 1,
-0.1647155, -0.1052623, -3.374697, 0, 1, 0.6392157, 1,
-0.1618357, -0.4568038, -2.963889, 0, 1, 0.6470588, 1,
-0.1615348, 2.190728, 0.8593609, 0, 1, 0.6509804, 1,
-0.15957, -0.2878156, -2.171851, 0, 1, 0.6588235, 1,
-0.1564033, -0.7846212, -3.20406, 0, 1, 0.6627451, 1,
-0.1502969, -0.8010368, -2.812235, 0, 1, 0.6705883, 1,
-0.1467979, -0.315002, -2.229065, 0, 1, 0.6745098, 1,
-0.1454636, 0.5483117, -0.2464233, 0, 1, 0.682353, 1,
-0.144077, 2.039689, -1.119262, 0, 1, 0.6862745, 1,
-0.1389199, 0.164666, 0.02399123, 0, 1, 0.6941177, 1,
-0.137114, -0.1933678, -2.901193, 0, 1, 0.7019608, 1,
-0.1312871, -0.5187682, -2.737679, 0, 1, 0.7058824, 1,
-0.1311293, 1.197078, -0.07090868, 0, 1, 0.7137255, 1,
-0.128334, 0.1355752, -0.01804995, 0, 1, 0.7176471, 1,
-0.1268006, 0.7600514, 1.056064, 0, 1, 0.7254902, 1,
-0.1257902, 1.749393, 0.4096376, 0, 1, 0.7294118, 1,
-0.1231561, -1.255307, -4.929273, 0, 1, 0.7372549, 1,
-0.1221528, -0.3833571, -2.621087, 0, 1, 0.7411765, 1,
-0.1214607, -0.8624852, -2.165936, 0, 1, 0.7490196, 1,
-0.1177257, 0.4743153, 0.5879564, 0, 1, 0.7529412, 1,
-0.11553, -0.3496392, -2.711583, 0, 1, 0.7607843, 1,
-0.1104147, -0.445588, -3.018739, 0, 1, 0.7647059, 1,
-0.1091658, 1.153616, -0.2785042, 0, 1, 0.772549, 1,
-0.1075565, 2.027932, -1.34549, 0, 1, 0.7764706, 1,
-0.1071738, 0.3570383, -1.076334, 0, 1, 0.7843137, 1,
-0.1044402, -0.7100268, -2.4275, 0, 1, 0.7882353, 1,
-0.102374, -0.7290712, -4.303347, 0, 1, 0.7960784, 1,
-0.1023386, -0.1389269, -2.17109, 0, 1, 0.8039216, 1,
-0.09957676, -1.343055, -4.225421, 0, 1, 0.8078431, 1,
-0.09865779, 1.027265, 0.3641452, 0, 1, 0.8156863, 1,
-0.09473212, -0.5402534, -1.571342, 0, 1, 0.8196079, 1,
-0.09443545, -0.7661038, -2.264968, 0, 1, 0.827451, 1,
-0.09210553, -1.524774, -2.925118, 0, 1, 0.8313726, 1,
-0.08928353, 0.3840786, -0.2289489, 0, 1, 0.8392157, 1,
-0.08846713, -0.4730482, -3.393249, 0, 1, 0.8431373, 1,
-0.08658069, 0.659068, 0.4583303, 0, 1, 0.8509804, 1,
-0.07581979, -0.1310084, -2.790167, 0, 1, 0.854902, 1,
-0.07543647, 0.5090209, -0.9157578, 0, 1, 0.8627451, 1,
-0.07530244, 0.8267979, 1.764619, 0, 1, 0.8666667, 1,
-0.07183452, -0.3335799, -2.631826, 0, 1, 0.8745098, 1,
-0.07160372, 0.8708842, -0.3155835, 0, 1, 0.8784314, 1,
-0.0685331, -0.5854899, -3.60108, 0, 1, 0.8862745, 1,
-0.06775127, 0.4280645, 1.013095, 0, 1, 0.8901961, 1,
-0.06755225, -0.5159292, -1.098403, 0, 1, 0.8980392, 1,
-0.06653723, -1.467131, -2.987959, 0, 1, 0.9058824, 1,
-0.06628468, 0.1904748, -0.6431456, 0, 1, 0.9098039, 1,
-0.06366591, 0.5132128, -2.012219, 0, 1, 0.9176471, 1,
-0.06345335, 0.6672972, -0.1068356, 0, 1, 0.9215686, 1,
-0.06245873, 1.184871, 0.371707, 0, 1, 0.9294118, 1,
-0.06126832, 1.138296, 0.1302076, 0, 1, 0.9333333, 1,
-0.05887065, -0.4548607, -2.198375, 0, 1, 0.9411765, 1,
-0.05751263, -0.4457143, -1.87323, 0, 1, 0.945098, 1,
-0.05106281, 0.9258057, 0.1961799, 0, 1, 0.9529412, 1,
-0.05093902, -0.05691206, -0.3246696, 0, 1, 0.9568627, 1,
-0.05075264, -0.271125, -1.401696, 0, 1, 0.9647059, 1,
-0.04885312, -0.05982749, -2.411283, 0, 1, 0.9686275, 1,
-0.04690843, 0.5364775, -1.050867, 0, 1, 0.9764706, 1,
-0.0431524, 1.324577, 0.1626032, 0, 1, 0.9803922, 1,
-0.04155003, -0.7501495, -3.603815, 0, 1, 0.9882353, 1,
-0.04005406, -1.192906, -3.856323, 0, 1, 0.9921569, 1,
-0.03945108, 1.225596, -0.2345532, 0, 1, 1, 1,
-0.03013494, 0.5604461, -1.230332, 0, 0.9921569, 1, 1,
-0.02521957, 1.136467, -2.358358, 0, 0.9882353, 1, 1,
-0.02458482, -0.7985809, -4.287749, 0, 0.9803922, 1, 1,
-0.02276005, 0.1031457, -0.07374656, 0, 0.9764706, 1, 1,
-0.02181296, -0.2551703, -3.844985, 0, 0.9686275, 1, 1,
-0.02145337, -2.064657, -3.278447, 0, 0.9647059, 1, 1,
-0.02088117, 0.3044763, 0.4289896, 0, 0.9568627, 1, 1,
-0.01711708, -0.6805775, -2.555193, 0, 0.9529412, 1, 1,
-0.01296239, 1.312147, 2.551867, 0, 0.945098, 1, 1,
-0.01149844, 1.347256, -0.5429134, 0, 0.9411765, 1, 1,
0.006216393, 0.3990524, 0.3318709, 0, 0.9333333, 1, 1,
0.008177105, -0.8645955, 2.362465, 0, 0.9294118, 1, 1,
0.008764478, 0.1408454, -0.0558314, 0, 0.9215686, 1, 1,
0.01753993, 1.345676, -0.764772, 0, 0.9176471, 1, 1,
0.01825998, 0.4451191, -0.8179151, 0, 0.9098039, 1, 1,
0.02123782, -0.2144867, 2.144495, 0, 0.9058824, 1, 1,
0.02379499, -0.06132186, 2.101999, 0, 0.8980392, 1, 1,
0.02875055, 0.8003122, 0.3966874, 0, 0.8901961, 1, 1,
0.03090035, 1.869383, 0.8487705, 0, 0.8862745, 1, 1,
0.03121493, 2.126303, 0.9252577, 0, 0.8784314, 1, 1,
0.03618364, -0.4445097, 3.181303, 0, 0.8745098, 1, 1,
0.03693659, -0.27371, 2.459426, 0, 0.8666667, 1, 1,
0.03712478, -0.7811827, 2.521109, 0, 0.8627451, 1, 1,
0.04185712, 0.2659931, 1.547485, 0, 0.854902, 1, 1,
0.04443768, 0.8828815, 0.12317, 0, 0.8509804, 1, 1,
0.04759231, -0.2570892, 1.443962, 0, 0.8431373, 1, 1,
0.05534567, 0.2492406, 0.4731738, 0, 0.8392157, 1, 1,
0.05579636, -1.481826, 4.099761, 0, 0.8313726, 1, 1,
0.05749442, 0.4586503, -1.383694, 0, 0.827451, 1, 1,
0.05827304, -0.4393781, 3.200242, 0, 0.8196079, 1, 1,
0.06104502, -2.15626, 3.942621, 0, 0.8156863, 1, 1,
0.06159049, 1.193553, -1.621847, 0, 0.8078431, 1, 1,
0.06238837, 1.293877, 0.9736308, 0, 0.8039216, 1, 1,
0.06720854, 1.35043, -0.9674001, 0, 0.7960784, 1, 1,
0.06864547, 1.001847, -1.633113, 0, 0.7882353, 1, 1,
0.06919342, 1.439242, -0.7156538, 0, 0.7843137, 1, 1,
0.07261746, -1.663113, 2.469433, 0, 0.7764706, 1, 1,
0.07851385, -0.1122732, 3.798478, 0, 0.772549, 1, 1,
0.08065619, 0.320191, 0.9693595, 0, 0.7647059, 1, 1,
0.08184561, -0.4093619, 3.16015, 0, 0.7607843, 1, 1,
0.08261377, -0.04915844, 0.0703836, 0, 0.7529412, 1, 1,
0.08292878, 0.7476099, -0.9876024, 0, 0.7490196, 1, 1,
0.08346898, -0.298869, 3.862895, 0, 0.7411765, 1, 1,
0.08485276, 0.3411165, 1.398627, 0, 0.7372549, 1, 1,
0.08621172, 0.9738461, 1.679651, 0, 0.7294118, 1, 1,
0.08933964, 0.3810144, -0.5037983, 0, 0.7254902, 1, 1,
0.08951908, -1.502867, 2.083372, 0, 0.7176471, 1, 1,
0.09717946, 0.12744, 0.3649626, 0, 0.7137255, 1, 1,
0.09878868, -0.4625892, 2.898596, 0, 0.7058824, 1, 1,
0.09903615, 0.7759631, 0.8478786, 0, 0.6980392, 1, 1,
0.09972862, -0.9977447, 3.904326, 0, 0.6941177, 1, 1,
0.1015784, -1.645893, 3.317364, 0, 0.6862745, 1, 1,
0.1033313, -1.528711, 2.554524, 0, 0.682353, 1, 1,
0.1037005, 0.3218724, 0.3125696, 0, 0.6745098, 1, 1,
0.1069543, -0.6226605, 1.508925, 0, 0.6705883, 1, 1,
0.108711, 0.9069966, 1.138009, 0, 0.6627451, 1, 1,
0.1098088, 0.1804443, -0.1972034, 0, 0.6588235, 1, 1,
0.1186809, -0.9035794, 2.065185, 0, 0.6509804, 1, 1,
0.1285225, 2.031679, -0.07494203, 0, 0.6470588, 1, 1,
0.1350588, 0.8551493, 1.931293, 0, 0.6392157, 1, 1,
0.1362198, 0.3717223, -1.545717, 0, 0.6352941, 1, 1,
0.1388109, -0.02088508, 1.539244, 0, 0.627451, 1, 1,
0.1399833, 1.749801, -0.8809277, 0, 0.6235294, 1, 1,
0.1401327, 1.293498, -0.2375772, 0, 0.6156863, 1, 1,
0.1438304, -2.474452, 2.886342, 0, 0.6117647, 1, 1,
0.1457856, 0.9503924, -0.3459528, 0, 0.6039216, 1, 1,
0.1470181, 0.1459304, 1.952905, 0, 0.5960785, 1, 1,
0.1519606, -2.669845, 3.665494, 0, 0.5921569, 1, 1,
0.1521677, 0.2200276, 1.130365, 0, 0.5843138, 1, 1,
0.1551098, -0.3548454, 2.399238, 0, 0.5803922, 1, 1,
0.1610039, 1.297843, -0.4265594, 0, 0.572549, 1, 1,
0.1613317, -0.1254689, 2.420247, 0, 0.5686275, 1, 1,
0.1693981, 1.284329, -0.4764891, 0, 0.5607843, 1, 1,
0.16977, 1.556111, -0.7460974, 0, 0.5568628, 1, 1,
0.1698939, -0.7845252, 4.030161, 0, 0.5490196, 1, 1,
0.1720531, 0.6637365, 0.4130739, 0, 0.5450981, 1, 1,
0.1750487, -1.744668, 2.938702, 0, 0.5372549, 1, 1,
0.1754421, -1.278219, 2.694876, 0, 0.5333334, 1, 1,
0.1768966, -1.203067, 2.407191, 0, 0.5254902, 1, 1,
0.1831235, 0.647876, -0.04298475, 0, 0.5215687, 1, 1,
0.1895986, -0.6376188, 2.79574, 0, 0.5137255, 1, 1,
0.1911695, 0.1640212, 0.7739878, 0, 0.509804, 1, 1,
0.1940868, -1.223493, 5.432802, 0, 0.5019608, 1, 1,
0.195599, -0.3411172, 1.422253, 0, 0.4941176, 1, 1,
0.1960135, 0.1399664, 0.9527907, 0, 0.4901961, 1, 1,
0.2033585, 0.2289942, -0.4818359, 0, 0.4823529, 1, 1,
0.2061169, 1.066064, 1.942695, 0, 0.4784314, 1, 1,
0.2080616, 0.7540715, -0.05520639, 0, 0.4705882, 1, 1,
0.2085345, -0.2443402, 2.866349, 0, 0.4666667, 1, 1,
0.2153829, -1.213215, 2.229067, 0, 0.4588235, 1, 1,
0.2166371, 0.1025267, 1.429133, 0, 0.454902, 1, 1,
0.220999, 0.2278576, -1.155427, 0, 0.4470588, 1, 1,
0.2227363, -0.5450079, 4.182484, 0, 0.4431373, 1, 1,
0.2303001, -0.3367097, 2.694983, 0, 0.4352941, 1, 1,
0.2313892, 1.393905, -0.2184466, 0, 0.4313726, 1, 1,
0.2320197, 1.164193, 0.7660614, 0, 0.4235294, 1, 1,
0.2372505, -0.6812819, 4.509225, 0, 0.4196078, 1, 1,
0.2397271, -0.6676269, 2.444376, 0, 0.4117647, 1, 1,
0.2450185, -1.106315, 2.183203, 0, 0.4078431, 1, 1,
0.2464949, 1.498195, -0.533897, 0, 0.4, 1, 1,
0.2481704, -1.574699, 4.470555, 0, 0.3921569, 1, 1,
0.2490051, -0.07266667, 1.914494, 0, 0.3882353, 1, 1,
0.2542498, 0.7945693, -0.3405395, 0, 0.3803922, 1, 1,
0.2565758, -2.340857, 2.112936, 0, 0.3764706, 1, 1,
0.2579579, 0.3999432, 0.9588556, 0, 0.3686275, 1, 1,
0.2594331, -2.29832, 4.132263, 0, 0.3647059, 1, 1,
0.2604218, 0.9204549, 0.7849946, 0, 0.3568628, 1, 1,
0.2608857, -0.02851583, 2.215587, 0, 0.3529412, 1, 1,
0.2659348, -0.04237726, 1.480685, 0, 0.345098, 1, 1,
0.2682658, -0.2770634, 1.435478, 0, 0.3411765, 1, 1,
0.2698219, 2.054178, 1.201384, 0, 0.3333333, 1, 1,
0.2735453, 0.9627391, -0.2809933, 0, 0.3294118, 1, 1,
0.2762188, 1.18058, 1.109589, 0, 0.3215686, 1, 1,
0.2768637, -1.217178, 2.03251, 0, 0.3176471, 1, 1,
0.2854873, 0.3929801, 1.334983, 0, 0.3098039, 1, 1,
0.2987714, 0.2430288, -0.1660566, 0, 0.3058824, 1, 1,
0.310366, -0.3899566, 2.953563, 0, 0.2980392, 1, 1,
0.3121045, 0.381845, -1.6137, 0, 0.2901961, 1, 1,
0.3123283, 0.05452988, 1.97888, 0, 0.2862745, 1, 1,
0.31738, -0.2132435, 1.929818, 0, 0.2784314, 1, 1,
0.3214519, -1.298302, 3.516261, 0, 0.2745098, 1, 1,
0.3229622, -1.125756, 1.631292, 0, 0.2666667, 1, 1,
0.327736, -0.2167604, 1.466715, 0, 0.2627451, 1, 1,
0.3307105, 1.465341, 1.499086, 0, 0.254902, 1, 1,
0.3339934, -1.477938, 4.635442, 0, 0.2509804, 1, 1,
0.3343934, -1.464207, 3.985244, 0, 0.2431373, 1, 1,
0.3348141, -0.8689728, 2.435095, 0, 0.2392157, 1, 1,
0.336277, -1.506928, 3.866058, 0, 0.2313726, 1, 1,
0.3368869, -0.8832547, 2.575834, 0, 0.227451, 1, 1,
0.3369227, 0.1401231, 1.326944, 0, 0.2196078, 1, 1,
0.3387473, -2.100117, 4.827209, 0, 0.2156863, 1, 1,
0.3393708, 0.0294438, 1.766513, 0, 0.2078431, 1, 1,
0.340176, 0.7707338, -1.114693, 0, 0.2039216, 1, 1,
0.343941, 1.530155, 0.243524, 0, 0.1960784, 1, 1,
0.3441446, 0.9832041, -1.418828, 0, 0.1882353, 1, 1,
0.3527056, -0.5765526, 3.960062, 0, 0.1843137, 1, 1,
0.3556316, 1.290604, 0.3848985, 0, 0.1764706, 1, 1,
0.3557991, -0.7639185, 4.782954, 0, 0.172549, 1, 1,
0.3591527, 0.01709417, 2.57618, 0, 0.1647059, 1, 1,
0.3591694, 0.6113058, 1.408459, 0, 0.1607843, 1, 1,
0.3617077, 1.264317, 1.603973, 0, 0.1529412, 1, 1,
0.3623364, -0.1397578, 0.3372689, 0, 0.1490196, 1, 1,
0.3633114, -0.6391617, 2.914715, 0, 0.1411765, 1, 1,
0.3638656, 0.3251836, 1.520913, 0, 0.1372549, 1, 1,
0.3680356, -0.1466646, 1.11957, 0, 0.1294118, 1, 1,
0.3780487, -2.286472, 2.871003, 0, 0.1254902, 1, 1,
0.3783414, 0.09217252, 0.8870726, 0, 0.1176471, 1, 1,
0.3863417, -1.152149, 2.457701, 0, 0.1137255, 1, 1,
0.3946248, -0.03799146, 2.507957, 0, 0.1058824, 1, 1,
0.3977926, 0.6118625, -0.368147, 0, 0.09803922, 1, 1,
0.3980362, 0.6244677, 0.8794442, 0, 0.09411765, 1, 1,
0.4009526, -0.1456167, 3.748312, 0, 0.08627451, 1, 1,
0.4025266, 0.8123652, 1.150184, 0, 0.08235294, 1, 1,
0.4032262, -0.6647479, 2.236859, 0, 0.07450981, 1, 1,
0.4061524, -0.8564208, 2.641616, 0, 0.07058824, 1, 1,
0.4064347, -0.0405454, 1.390145, 0, 0.0627451, 1, 1,
0.4212938, -0.9106561, 2.012373, 0, 0.05882353, 1, 1,
0.4214166, -0.436905, 3.685376, 0, 0.05098039, 1, 1,
0.4269929, 1.09288, 1.311107, 0, 0.04705882, 1, 1,
0.4278082, 0.2716052, 0.9577976, 0, 0.03921569, 1, 1,
0.4300978, -0.3730613, 3.355229, 0, 0.03529412, 1, 1,
0.4377688, 0.379051, 2.998994, 0, 0.02745098, 1, 1,
0.4403682, -1.605361, 3.25625, 0, 0.02352941, 1, 1,
0.4418116, 0.3366206, 0.7277983, 0, 0.01568628, 1, 1,
0.4428735, -0.2205352, 2.09876, 0, 0.01176471, 1, 1,
0.4444692, 1.144599, 0.8254331, 0, 0.003921569, 1, 1,
0.4522051, 1.045151, -0.5567406, 0.003921569, 0, 1, 1,
0.4530587, -1.847525, 3.714483, 0.007843138, 0, 1, 1,
0.4535927, 0.05294102, 1.229432, 0.01568628, 0, 1, 1,
0.455275, 0.9460383, 0.1474248, 0.01960784, 0, 1, 1,
0.4554552, 0.4792953, -0.215045, 0.02745098, 0, 1, 1,
0.4599382, -0.6262638, 0.9025977, 0.03137255, 0, 1, 1,
0.4621032, -0.970052, 1.841248, 0.03921569, 0, 1, 1,
0.4624955, -0.03848682, 1.49624, 0.04313726, 0, 1, 1,
0.4672663, 0.5535182, -0.5079711, 0.05098039, 0, 1, 1,
0.4680359, -0.9841728, 3.528689, 0.05490196, 0, 1, 1,
0.4764777, 1.761172, -0.08843379, 0.0627451, 0, 1, 1,
0.4846336, -0.8570958, 2.895126, 0.06666667, 0, 1, 1,
0.4858491, -1.11284, 3.381418, 0.07450981, 0, 1, 1,
0.4907835, 0.4404503, 1.095706, 0.07843138, 0, 1, 1,
0.4926357, 1.355607, -0.9516028, 0.08627451, 0, 1, 1,
0.4927829, -0.3605208, 4.680438, 0.09019608, 0, 1, 1,
0.4941152, -0.8375192, 2.357886, 0.09803922, 0, 1, 1,
0.4980975, 0.6565977, 1.684115, 0.1058824, 0, 1, 1,
0.5002837, 0.6868523, 0.7488557, 0.1098039, 0, 1, 1,
0.5055962, 1.314072, -0.1995877, 0.1176471, 0, 1, 1,
0.5068389, -1.750101, 1.584282, 0.1215686, 0, 1, 1,
0.5094864, -1.507969, 2.442852, 0.1294118, 0, 1, 1,
0.5095441, 0.4798257, -0.1172492, 0.1333333, 0, 1, 1,
0.5128814, 0.4006423, 1.615054, 0.1411765, 0, 1, 1,
0.5253416, -0.01736597, 0.3832851, 0.145098, 0, 1, 1,
0.5267438, 1.130643, 0.9051096, 0.1529412, 0, 1, 1,
0.5282509, -0.685914, 1.7147, 0.1568628, 0, 1, 1,
0.5283786, -0.3497808, 3.304134, 0.1647059, 0, 1, 1,
0.5298744, -1.268473, 2.247806, 0.1686275, 0, 1, 1,
0.5325688, -0.4586827, 3.40794, 0.1764706, 0, 1, 1,
0.5436859, -0.6145741, 2.115986, 0.1803922, 0, 1, 1,
0.5442087, -1.439851, 3.316918, 0.1882353, 0, 1, 1,
0.5490807, 0.8919777, 3.367353, 0.1921569, 0, 1, 1,
0.550938, 0.04933525, 2.152579, 0.2, 0, 1, 1,
0.5556632, 0.3550456, 1.121739, 0.2078431, 0, 1, 1,
0.5567951, 0.4589657, -0.3449086, 0.2117647, 0, 1, 1,
0.5609666, 0.646024, 2.06722, 0.2196078, 0, 1, 1,
0.5610822, 0.8170586, 0.746599, 0.2235294, 0, 1, 1,
0.5621792, 1.547185, 0.04298126, 0.2313726, 0, 1, 1,
0.563821, 0.7372215, 1.445964, 0.2352941, 0, 1, 1,
0.5699825, 0.06023593, 1.920746, 0.2431373, 0, 1, 1,
0.5719492, 0.04028569, 1.155792, 0.2470588, 0, 1, 1,
0.5722, 0.547609, 0.02351593, 0.254902, 0, 1, 1,
0.575582, 0.8595845, 1.148737, 0.2588235, 0, 1, 1,
0.5850134, -1.461094, 2.843936, 0.2666667, 0, 1, 1,
0.5855418, -0.03498405, 0.8859233, 0.2705882, 0, 1, 1,
0.585988, -0.3857262, -0.04908242, 0.2784314, 0, 1, 1,
0.5894604, 1.27501, -0.2199197, 0.282353, 0, 1, 1,
0.5910453, -0.5371267, 0.3789697, 0.2901961, 0, 1, 1,
0.5913941, 0.3177403, 1.702892, 0.2941177, 0, 1, 1,
0.6041399, -1.781161, 2.599526, 0.3019608, 0, 1, 1,
0.6051102, -0.2705727, 2.91147, 0.3098039, 0, 1, 1,
0.6069134, -1.166514, 4.313915, 0.3137255, 0, 1, 1,
0.6085354, -0.9143185, 1.773929, 0.3215686, 0, 1, 1,
0.6095386, -2.486046, 2.471017, 0.3254902, 0, 1, 1,
0.6134331, -1.072292, 3.036848, 0.3333333, 0, 1, 1,
0.6144261, 0.8576403, -0.04052102, 0.3372549, 0, 1, 1,
0.6214678, 0.8715212, 0.9710785, 0.345098, 0, 1, 1,
0.6216259, -0.3194555, 1.736477, 0.3490196, 0, 1, 1,
0.6219484, -0.8635646, 4.519879, 0.3568628, 0, 1, 1,
0.6229979, -0.8130236, 1.523904, 0.3607843, 0, 1, 1,
0.6284905, 0.4360589, 1.42049, 0.3686275, 0, 1, 1,
0.6312426, 0.1186971, 2.341481, 0.372549, 0, 1, 1,
0.6405291, 0.7376062, 2.081242, 0.3803922, 0, 1, 1,
0.641952, 1.435051, 1.83484, 0.3843137, 0, 1, 1,
0.6422054, -0.8010356, 3.194362, 0.3921569, 0, 1, 1,
0.6423824, 0.2812907, 1.715685, 0.3960784, 0, 1, 1,
0.6449369, 0.6013138, 0.8534107, 0.4039216, 0, 1, 1,
0.6500299, 0.2716746, 1.690332, 0.4117647, 0, 1, 1,
0.6510763, 1.324229, -0.1807548, 0.4156863, 0, 1, 1,
0.6531685, 0.05972943, 1.018252, 0.4235294, 0, 1, 1,
0.6532186, 0.5128619, -0.1276146, 0.427451, 0, 1, 1,
0.6566107, 0.2511157, 1.950055, 0.4352941, 0, 1, 1,
0.6574469, 0.5933819, 1.952307, 0.4392157, 0, 1, 1,
0.6594646, 0.8418925, -0.4437667, 0.4470588, 0, 1, 1,
0.6645017, 1.217291, -0.11346, 0.4509804, 0, 1, 1,
0.6750192, 0.05358505, 1.241626, 0.4588235, 0, 1, 1,
0.6753594, 0.7887391, 0.963519, 0.4627451, 0, 1, 1,
0.6775974, 1.289388, 0.9992172, 0.4705882, 0, 1, 1,
0.6810093, 1.092579, 0.07244954, 0.4745098, 0, 1, 1,
0.6892875, 1.358255, 2.416385, 0.4823529, 0, 1, 1,
0.6927011, -0.4660544, 2.260982, 0.4862745, 0, 1, 1,
0.6934854, -0.6637872, 3.274027, 0.4941176, 0, 1, 1,
0.6966572, 0.1738014, 1.323839, 0.5019608, 0, 1, 1,
0.6983212, 1.568579, -0.3328142, 0.5058824, 0, 1, 1,
0.7047669, -1.889735, 3.678705, 0.5137255, 0, 1, 1,
0.7052879, 1.127373, 0.3835555, 0.5176471, 0, 1, 1,
0.7145256, 0.6132838, 0.8557836, 0.5254902, 0, 1, 1,
0.7182879, -2.143391, 2.851414, 0.5294118, 0, 1, 1,
0.7192942, -0.8780429, 1.953782, 0.5372549, 0, 1, 1,
0.7220956, -2.091136, 4.315668, 0.5411765, 0, 1, 1,
0.7276594, 1.356205, 1.32049, 0.5490196, 0, 1, 1,
0.7336176, 0.0922152, 1.012579, 0.5529412, 0, 1, 1,
0.736028, 1.01215, 0.5108789, 0.5607843, 0, 1, 1,
0.7376831, 0.4938853, 1.381752, 0.5647059, 0, 1, 1,
0.7377615, -0.1244353, 4.136011, 0.572549, 0, 1, 1,
0.7423348, 1.244518, 1.039208, 0.5764706, 0, 1, 1,
0.7443377, 0.185624, 2.049425, 0.5843138, 0, 1, 1,
0.7452237, 0.3055707, 1.783134, 0.5882353, 0, 1, 1,
0.7563418, -0.2517099, 2.359062, 0.5960785, 0, 1, 1,
0.7609997, 0.507247, 1.806946, 0.6039216, 0, 1, 1,
0.7619581, 1.024111, 0.2332458, 0.6078432, 0, 1, 1,
0.7628214, -0.6686203, 1.869069, 0.6156863, 0, 1, 1,
0.7717003, -1.415194, 2.63159, 0.6196079, 0, 1, 1,
0.7745816, -0.7878304, 0.8797895, 0.627451, 0, 1, 1,
0.7746345, -0.08079902, 0.6596073, 0.6313726, 0, 1, 1,
0.7806966, 2.134708, 0.4661598, 0.6392157, 0, 1, 1,
0.7834569, -1.400142, 2.844757, 0.6431373, 0, 1, 1,
0.785383, -0.7644467, 3.232801, 0.6509804, 0, 1, 1,
0.7883582, -0.4156286, 0.1014224, 0.654902, 0, 1, 1,
0.7890285, -1.161463, 1.69598, 0.6627451, 0, 1, 1,
0.7900686, -0.8184027, 2.654523, 0.6666667, 0, 1, 1,
0.795673, -0.8472239, 2.895197, 0.6745098, 0, 1, 1,
0.8009287, 0.6646243, -0.2965983, 0.6784314, 0, 1, 1,
0.8032972, -1.599663, 1.813439, 0.6862745, 0, 1, 1,
0.8033158, -1.137824, 0.7970096, 0.6901961, 0, 1, 1,
0.8122929, -0.4612998, 0.4022078, 0.6980392, 0, 1, 1,
0.816841, 0.5512573, -0.07998911, 0.7058824, 0, 1, 1,
0.8210407, -1.378739, 1.792602, 0.7098039, 0, 1, 1,
0.8239983, -1.226306, 2.052727, 0.7176471, 0, 1, 1,
0.8288741, -0.8394212, 1.936883, 0.7215686, 0, 1, 1,
0.8317096, -0.8324819, 2.693965, 0.7294118, 0, 1, 1,
0.8378683, 0.2994605, 0.3639246, 0.7333333, 0, 1, 1,
0.8397284, -0.03739949, 1.502661, 0.7411765, 0, 1, 1,
0.8415418, -0.4862002, 2.205786, 0.7450981, 0, 1, 1,
0.8472235, -0.8040054, 1.729946, 0.7529412, 0, 1, 1,
0.8510063, 0.9304186, -0.462595, 0.7568628, 0, 1, 1,
0.8523483, -0.8730284, 1.861655, 0.7647059, 0, 1, 1,
0.8539327, -1.319647, 3.621671, 0.7686275, 0, 1, 1,
0.8572243, 1.797216, 1.571831, 0.7764706, 0, 1, 1,
0.8576706, -0.3277226, 1.562828, 0.7803922, 0, 1, 1,
0.8693323, 1.624763, -0.2182594, 0.7882353, 0, 1, 1,
0.8694138, 0.6238273, -0.7032121, 0.7921569, 0, 1, 1,
0.8729405, 0.3420933, 1.292515, 0.8, 0, 1, 1,
0.8769522, -0.06216744, 1.892143, 0.8078431, 0, 1, 1,
0.8780881, 0.01133865, 2.944763, 0.8117647, 0, 1, 1,
0.8824083, -1.258099, 3.086254, 0.8196079, 0, 1, 1,
0.8834381, 0.3634447, 0.4449907, 0.8235294, 0, 1, 1,
0.8873705, -0.5438396, 1.161678, 0.8313726, 0, 1, 1,
0.8921404, 0.05036262, 2.483811, 0.8352941, 0, 1, 1,
0.8935749, -0.8338786, 1.741513, 0.8431373, 0, 1, 1,
0.8988075, -0.5905128, 3.23699, 0.8470588, 0, 1, 1,
0.899454, -0.08058249, 1.882157, 0.854902, 0, 1, 1,
0.9012784, -0.4645418, 0.8256508, 0.8588235, 0, 1, 1,
0.9020425, -0.09479615, 0.6505322, 0.8666667, 0, 1, 1,
0.909378, -0.24595, 3.354811, 0.8705882, 0, 1, 1,
0.9126915, -1.323459, 2.572604, 0.8784314, 0, 1, 1,
0.9148703, 0.05473486, 2.710992, 0.8823529, 0, 1, 1,
0.9158407, 0.8859571, 1.470597, 0.8901961, 0, 1, 1,
0.9166399, -0.1007704, 2.435173, 0.8941177, 0, 1, 1,
0.916909, -0.1353074, 1.333667, 0.9019608, 0, 1, 1,
0.922641, -0.6997532, 2.924907, 0.9098039, 0, 1, 1,
0.9233434, 0.6108104, 0.7331157, 0.9137255, 0, 1, 1,
0.9289181, -0.7628781, 1.293184, 0.9215686, 0, 1, 1,
0.9348794, -1.805346, 2.556617, 0.9254902, 0, 1, 1,
0.939234, 0.5443233, 0.5153965, 0.9333333, 0, 1, 1,
0.9408621, -0.5331987, 2.400903, 0.9372549, 0, 1, 1,
0.9411745, -0.3962168, 2.14735, 0.945098, 0, 1, 1,
0.9537287, 0.3917537, 2.317481, 0.9490196, 0, 1, 1,
0.9550438, 0.4268656, 1.326038, 0.9568627, 0, 1, 1,
0.9691129, -0.5448079, 2.695505, 0.9607843, 0, 1, 1,
0.9692597, -0.7865373, 0.6442384, 0.9686275, 0, 1, 1,
0.9742611, -1.152854, 2.597291, 0.972549, 0, 1, 1,
0.9950341, 0.3558822, 3.206328, 0.9803922, 0, 1, 1,
1.002127, -0.9209583, 2.706139, 0.9843137, 0, 1, 1,
1.002889, -0.04434444, 2.131303, 0.9921569, 0, 1, 1,
1.006032, 1.25241, 0.06411346, 0.9960784, 0, 1, 1,
1.006392, 0.993659, 0.7944651, 1, 0, 0.9960784, 1,
1.007073, -0.442973, 3.460391, 1, 0, 0.9882353, 1,
1.01158, 1.992294, 0.4185545, 1, 0, 0.9843137, 1,
1.012644, -0.3583538, 1.926643, 1, 0, 0.9764706, 1,
1.014128, -1.628457, 2.247761, 1, 0, 0.972549, 1,
1.01454, 0.776361, 0.7313623, 1, 0, 0.9647059, 1,
1.015317, -0.2559855, 0.9675424, 1, 0, 0.9607843, 1,
1.024349, 1.162355, 0.4948035, 1, 0, 0.9529412, 1,
1.024946, -1.223108, 3.420337, 1, 0, 0.9490196, 1,
1.02754, -0.2630019, 1.203049, 1, 0, 0.9411765, 1,
1.027855, -0.2306619, 2.23822, 1, 0, 0.9372549, 1,
1.02906, -0.4899291, 2.957008, 1, 0, 0.9294118, 1,
1.045701, 0.3574853, 1.766101, 1, 0, 0.9254902, 1,
1.047134, 1.116811, 0.03840739, 1, 0, 0.9176471, 1,
1.048499, 1.992514, -0.1300388, 1, 0, 0.9137255, 1,
1.049453, 0.5418533, 0.2837086, 1, 0, 0.9058824, 1,
1.050114, -1.263424, 2.246198, 1, 0, 0.9019608, 1,
1.052723, 0.9743423, 1.029917, 1, 0, 0.8941177, 1,
1.053373, 0.6348296, 1.626324, 1, 0, 0.8862745, 1,
1.055091, -0.1502679, 1.337675, 1, 0, 0.8823529, 1,
1.055196, -1.076765, 4.252578, 1, 0, 0.8745098, 1,
1.055422, -0.5535249, 2.1014, 1, 0, 0.8705882, 1,
1.059414, -0.04585362, 1.531524, 1, 0, 0.8627451, 1,
1.065686, 0.01837159, 0.9359483, 1, 0, 0.8588235, 1,
1.07006, -0.8491899, 1.908116, 1, 0, 0.8509804, 1,
1.074009, -0.1059917, 2.060959, 1, 0, 0.8470588, 1,
1.083526, 1.857413, -0.05034766, 1, 0, 0.8392157, 1,
1.094688, -0.4532269, 2.777912, 1, 0, 0.8352941, 1,
1.095995, -0.5431039, 1.293385, 1, 0, 0.827451, 1,
1.098468, 0.9007313, 2.045128, 1, 0, 0.8235294, 1,
1.10958, -0.2015329, 1.853575, 1, 0, 0.8156863, 1,
1.110333, -0.01789192, 2.564606, 1, 0, 0.8117647, 1,
1.116399, -0.323504, 2.698834, 1, 0, 0.8039216, 1,
1.117615, -0.03475589, 1.731935, 1, 0, 0.7960784, 1,
1.124974, 0.08789034, 2.099681, 1, 0, 0.7921569, 1,
1.130442, 3.076154, 1.126115, 1, 0, 0.7843137, 1,
1.130478, -2.520495, 3.785002, 1, 0, 0.7803922, 1,
1.138292, 0.3504498, 1.809282, 1, 0, 0.772549, 1,
1.142295, -1.627485, 4.381601, 1, 0, 0.7686275, 1,
1.16317, 0.3042078, 1.428793, 1, 0, 0.7607843, 1,
1.166289, -0.3263977, 0.8611519, 1, 0, 0.7568628, 1,
1.17023, 0.2790434, 1.702695, 1, 0, 0.7490196, 1,
1.177756, 0.3804408, 1.216124, 1, 0, 0.7450981, 1,
1.177998, -0.2766563, 1.370144, 1, 0, 0.7372549, 1,
1.179014, -0.3364263, 1.449043, 1, 0, 0.7333333, 1,
1.179828, -2.033045, 3.396917, 1, 0, 0.7254902, 1,
1.180332, 0.8494945, 1.697824, 1, 0, 0.7215686, 1,
1.180984, 0.6729634, -0.3960909, 1, 0, 0.7137255, 1,
1.182454, 0.5237027, 1.466374, 1, 0, 0.7098039, 1,
1.182838, -1.166412, 1.637175, 1, 0, 0.7019608, 1,
1.187529, 1.026552, 1.678732, 1, 0, 0.6941177, 1,
1.192246, -0.008378149, 2.747427, 1, 0, 0.6901961, 1,
1.196333, 0.3346663, -0.4715248, 1, 0, 0.682353, 1,
1.203353, 0.07713086, 1.305367, 1, 0, 0.6784314, 1,
1.203524, 0.08044006, 1.753988, 1, 0, 0.6705883, 1,
1.21091, -0.5050061, 1.289195, 1, 0, 0.6666667, 1,
1.214543, 0.528066, 0.7664337, 1, 0, 0.6588235, 1,
1.231866, 1.319605, -0.08342794, 1, 0, 0.654902, 1,
1.232936, -0.6136507, 3.042921, 1, 0, 0.6470588, 1,
1.240308, -1.205452, 2.911314, 1, 0, 0.6431373, 1,
1.246472, -1.112503, 3.292064, 1, 0, 0.6352941, 1,
1.248153, 1.750517, 0.5893348, 1, 0, 0.6313726, 1,
1.253198, 0.8792192, 1.137941, 1, 0, 0.6235294, 1,
1.254823, 0.4889677, 0.699497, 1, 0, 0.6196079, 1,
1.259539, -1.346763, 1.655614, 1, 0, 0.6117647, 1,
1.268794, -0.1863988, 0.6577802, 1, 0, 0.6078432, 1,
1.272099, 2.371038, 2.103187, 1, 0, 0.6, 1,
1.272267, -0.3184231, 1.783511, 1, 0, 0.5921569, 1,
1.274261, 0.3765388, 1.724784, 1, 0, 0.5882353, 1,
1.290456, 0.6291766, 0.87308, 1, 0, 0.5803922, 1,
1.295768, 1.510805, -0.1514539, 1, 0, 0.5764706, 1,
1.300088, 0.05077609, 1.03935, 1, 0, 0.5686275, 1,
1.302411, -0.7814403, 2.742858, 1, 0, 0.5647059, 1,
1.312754, 0.4344526, 2.63067, 1, 0, 0.5568628, 1,
1.314341, 1.577502, 0.1118068, 1, 0, 0.5529412, 1,
1.316951, -1.052636, 1.774145, 1, 0, 0.5450981, 1,
1.317551, 0.7934741, 1.382303, 1, 0, 0.5411765, 1,
1.318831, 1.454671, 1.522041, 1, 0, 0.5333334, 1,
1.325611, -0.6836664, 2.59975, 1, 0, 0.5294118, 1,
1.332524, 1.034446, 0.9457267, 1, 0, 0.5215687, 1,
1.339648, 0.1190631, 2.530824, 1, 0, 0.5176471, 1,
1.343132, -0.7099419, 2.019356, 1, 0, 0.509804, 1,
1.348677, -0.2613967, 0.5127191, 1, 0, 0.5058824, 1,
1.349228, -1.021382, -0.1390146, 1, 0, 0.4980392, 1,
1.357305, 0.5041782, 1.117736, 1, 0, 0.4901961, 1,
1.367999, 2.277599, -1.316925, 1, 0, 0.4862745, 1,
1.369148, 0.9728942, 1.523419, 1, 0, 0.4784314, 1,
1.382092, -1.18977, 1.870909, 1, 0, 0.4745098, 1,
1.382203, 1.114744, 0.4837049, 1, 0, 0.4666667, 1,
1.385553, 1.364199, 1.222361, 1, 0, 0.4627451, 1,
1.386389, 0.5796067, 0.2783209, 1, 0, 0.454902, 1,
1.401832, 0.5440922, 2.331373, 1, 0, 0.4509804, 1,
1.41108, 0.3266517, 2.986561, 1, 0, 0.4431373, 1,
1.416097, -2.104913, 3.479676, 1, 0, 0.4392157, 1,
1.43004, 0.1128099, 0.9658903, 1, 0, 0.4313726, 1,
1.434195, 0.07514264, 2.169977, 1, 0, 0.427451, 1,
1.446274, -0.1423987, 4.450109, 1, 0, 0.4196078, 1,
1.448798, -0.6741822, 2.71315, 1, 0, 0.4156863, 1,
1.454369, -0.07267411, 2.237079, 1, 0, 0.4078431, 1,
1.469087, 0.8467705, 2.633997, 1, 0, 0.4039216, 1,
1.497401, 0.1214552, 2.152045, 1, 0, 0.3960784, 1,
1.502039, -0.1958136, 3.55436, 1, 0, 0.3882353, 1,
1.507458, -1.216451, 2.155795, 1, 0, 0.3843137, 1,
1.521455, -1.661608, 3.729992, 1, 0, 0.3764706, 1,
1.524476, 0.03835473, 1.056185, 1, 0, 0.372549, 1,
1.529703, 2.025753, 0.7994313, 1, 0, 0.3647059, 1,
1.532244, 1.537645, 0.7121488, 1, 0, 0.3607843, 1,
1.533287, 0.037466, 1.362354, 1, 0, 0.3529412, 1,
1.538755, -2.05929, 3.812069, 1, 0, 0.3490196, 1,
1.539431, -0.3656371, 2.276499, 1, 0, 0.3411765, 1,
1.540993, -0.8340645, 2.481821, 1, 0, 0.3372549, 1,
1.541579, 2.885125, 0.7790554, 1, 0, 0.3294118, 1,
1.545766, 0.7301623, 2.691951, 1, 0, 0.3254902, 1,
1.566454, -0.7085097, 1.569248, 1, 0, 0.3176471, 1,
1.570065, 0.2532209, 1.690958, 1, 0, 0.3137255, 1,
1.570136, -0.6186842, 1.542822, 1, 0, 0.3058824, 1,
1.593017, -0.9763577, 2.911062, 1, 0, 0.2980392, 1,
1.60321, -1.132987, 1.318672, 1, 0, 0.2941177, 1,
1.624451, -0.001186714, 0.3912801, 1, 0, 0.2862745, 1,
1.638165, -1.327443, 3.322904, 1, 0, 0.282353, 1,
1.676686, 0.2681295, 1.026267, 1, 0, 0.2745098, 1,
1.695498, 0.3092184, 3.8702, 1, 0, 0.2705882, 1,
1.698867, 1.449941, 1.222744, 1, 0, 0.2627451, 1,
1.702591, -0.2070469, 2.344046, 1, 0, 0.2588235, 1,
1.725151, 1.219197, 1.749783, 1, 0, 0.2509804, 1,
1.732737, 0.7357752, 2.148205, 1, 0, 0.2470588, 1,
1.748337, -0.4138297, 1.23575, 1, 0, 0.2392157, 1,
1.764212, -0.2871892, 1.225084, 1, 0, 0.2352941, 1,
1.767515, 0.6569432, 0.2381705, 1, 0, 0.227451, 1,
1.774636, -0.08409491, 2.714087, 1, 0, 0.2235294, 1,
1.775306, 0.7478846, 0.4953448, 1, 0, 0.2156863, 1,
1.776698, -0.1409366, 3.03772, 1, 0, 0.2117647, 1,
1.79665, -1.477673, 2.874196, 1, 0, 0.2039216, 1,
1.803686, 0.4839749, -1.348389, 1, 0, 0.1960784, 1,
1.804628, 0.0562704, 2.509418, 1, 0, 0.1921569, 1,
1.882522, 0.1389571, 2.210869, 1, 0, 0.1843137, 1,
1.895338, 0.4072708, 0.7864837, 1, 0, 0.1803922, 1,
1.913754, -0.9859891, 3.340014, 1, 0, 0.172549, 1,
1.917761, -1.571989, 2.153846, 1, 0, 0.1686275, 1,
1.932273, -1.351607, 2.554967, 1, 0, 0.1607843, 1,
1.94434, 0.5024198, -0.07013185, 1, 0, 0.1568628, 1,
1.972469, -0.4277355, 0.7844423, 1, 0, 0.1490196, 1,
1.976691, -1.439863, 2.595749, 1, 0, 0.145098, 1,
1.991397, 0.07108173, 3.280318, 1, 0, 0.1372549, 1,
1.994867, 0.26605, 2.059824, 1, 0, 0.1333333, 1,
1.995752, 0.4630007, 1.692852, 1, 0, 0.1254902, 1,
2.066858, 1.007237, 2.971727, 1, 0, 0.1215686, 1,
2.086807, 1.488287, 2.630482, 1, 0, 0.1137255, 1,
2.114029, -0.4228729, 2.391039, 1, 0, 0.1098039, 1,
2.11441, -1.104793, 4.008771, 1, 0, 0.1019608, 1,
2.118218, 0.4365686, -1.582003, 1, 0, 0.09411765, 1,
2.1193, 0.09851551, 1.79747, 1, 0, 0.09019608, 1,
2.153856, -0.7447461, 3.469486, 1, 0, 0.08235294, 1,
2.176968, 1.115756, 0.7802737, 1, 0, 0.07843138, 1,
2.189488, 0.806174, 1.790088, 1, 0, 0.07058824, 1,
2.271728, -0.3010492, 0.7580414, 1, 0, 0.06666667, 1,
2.292653, -0.4561407, 3.324364, 1, 0, 0.05882353, 1,
2.357739, 0.1644055, 2.416251, 1, 0, 0.05490196, 1,
2.360445, -1.362498, 1.829444, 1, 0, 0.04705882, 1,
2.449649, 0.6946139, 0.5472955, 1, 0, 0.04313726, 1,
2.479097, -2.047009, 3.298086, 1, 0, 0.03529412, 1,
2.637401, 2.465253, 2.051285, 1, 0, 0.03137255, 1,
2.642855, -0.6771888, 1.433745, 1, 0, 0.02352941, 1,
2.649287, 1.123364, 0.4403531, 1, 0, 0.01960784, 1,
2.870479, 0.1253711, 1.550779, 1, 0, 0.01176471, 1,
3.794641, 0.2379314, 3.225926, 1, 0, 0.007843138, 1
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
0.09071457, -3.778257, -6.795086, 0, -0.5, 0.5, 0.5,
0.09071457, -3.778257, -6.795086, 1, -0.5, 0.5, 0.5,
0.09071457, -3.778257, -6.795086, 1, 1.5, 0.5, 0.5,
0.09071457, -3.778257, -6.795086, 0, 1.5, 0.5, 0.5
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
-4.868843, 0.2626715, -6.795086, 0, -0.5, 0.5, 0.5,
-4.868843, 0.2626715, -6.795086, 1, -0.5, 0.5, 0.5,
-4.868843, 0.2626715, -6.795086, 1, 1.5, 0.5, 0.5,
-4.868843, 0.2626715, -6.795086, 0, 1.5, 0.5, 0.5
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
-4.868843, -3.778257, 0.2049749, 0, -0.5, 0.5, 0.5,
-4.868843, -3.778257, 0.2049749, 1, -0.5, 0.5, 0.5,
-4.868843, -3.778257, 0.2049749, 1, 1.5, 0.5, 0.5,
-4.868843, -3.778257, 0.2049749, 0, 1.5, 0.5, 0.5
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
-2, -2.845735, -5.179687,
2, -2.845735, -5.179687,
-2, -2.845735, -5.179687,
-2, -3.001155, -5.44892,
0, -2.845735, -5.179687,
0, -3.001155, -5.44892,
2, -2.845735, -5.179687,
2, -3.001155, -5.44892
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
-2, -3.311996, -5.987387, 0, -0.5, 0.5, 0.5,
-2, -3.311996, -5.987387, 1, -0.5, 0.5, 0.5,
-2, -3.311996, -5.987387, 1, 1.5, 0.5, 0.5,
-2, -3.311996, -5.987387, 0, 1.5, 0.5, 0.5,
0, -3.311996, -5.987387, 0, -0.5, 0.5, 0.5,
0, -3.311996, -5.987387, 1, -0.5, 0.5, 0.5,
0, -3.311996, -5.987387, 1, 1.5, 0.5, 0.5,
0, -3.311996, -5.987387, 0, 1.5, 0.5, 0.5,
2, -3.311996, -5.987387, 0, -0.5, 0.5, 0.5,
2, -3.311996, -5.987387, 1, -0.5, 0.5, 0.5,
2, -3.311996, -5.987387, 1, 1.5, 0.5, 0.5,
2, -3.311996, -5.987387, 0, 1.5, 0.5, 0.5
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
-3.72433, -2, -5.179687,
-3.72433, 3, -5.179687,
-3.72433, -2, -5.179687,
-3.915082, -2, -5.44892,
-3.72433, -1, -5.179687,
-3.915082, -1, -5.44892,
-3.72433, 0, -5.179687,
-3.915082, 0, -5.44892,
-3.72433, 1, -5.179687,
-3.915082, 1, -5.44892,
-3.72433, 2, -5.179687,
-3.915082, 2, -5.44892,
-3.72433, 3, -5.179687,
-3.915082, 3, -5.44892
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
-4.296587, -2, -5.987387, 0, -0.5, 0.5, 0.5,
-4.296587, -2, -5.987387, 1, -0.5, 0.5, 0.5,
-4.296587, -2, -5.987387, 1, 1.5, 0.5, 0.5,
-4.296587, -2, -5.987387, 0, 1.5, 0.5, 0.5,
-4.296587, -1, -5.987387, 0, -0.5, 0.5, 0.5,
-4.296587, -1, -5.987387, 1, -0.5, 0.5, 0.5,
-4.296587, -1, -5.987387, 1, 1.5, 0.5, 0.5,
-4.296587, -1, -5.987387, 0, 1.5, 0.5, 0.5,
-4.296587, 0, -5.987387, 0, -0.5, 0.5, 0.5,
-4.296587, 0, -5.987387, 1, -0.5, 0.5, 0.5,
-4.296587, 0, -5.987387, 1, 1.5, 0.5, 0.5,
-4.296587, 0, -5.987387, 0, 1.5, 0.5, 0.5,
-4.296587, 1, -5.987387, 0, -0.5, 0.5, 0.5,
-4.296587, 1, -5.987387, 1, -0.5, 0.5, 0.5,
-4.296587, 1, -5.987387, 1, 1.5, 0.5, 0.5,
-4.296587, 1, -5.987387, 0, 1.5, 0.5, 0.5,
-4.296587, 2, -5.987387, 0, -0.5, 0.5, 0.5,
-4.296587, 2, -5.987387, 1, -0.5, 0.5, 0.5,
-4.296587, 2, -5.987387, 1, 1.5, 0.5, 0.5,
-4.296587, 2, -5.987387, 0, 1.5, 0.5, 0.5,
-4.296587, 3, -5.987387, 0, -0.5, 0.5, 0.5,
-4.296587, 3, -5.987387, 1, -0.5, 0.5, 0.5,
-4.296587, 3, -5.987387, 1, 1.5, 0.5, 0.5,
-4.296587, 3, -5.987387, 0, 1.5, 0.5, 0.5
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
-3.72433, -2.845735, -4,
-3.72433, -2.845735, 4,
-3.72433, -2.845735, -4,
-3.915082, -3.001155, -4,
-3.72433, -2.845735, -2,
-3.915082, -3.001155, -2,
-3.72433, -2.845735, 0,
-3.915082, -3.001155, 0,
-3.72433, -2.845735, 2,
-3.915082, -3.001155, 2,
-3.72433, -2.845735, 4,
-3.915082, -3.001155, 4
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
-4.296587, -3.311996, -4, 0, -0.5, 0.5, 0.5,
-4.296587, -3.311996, -4, 1, -0.5, 0.5, 0.5,
-4.296587, -3.311996, -4, 1, 1.5, 0.5, 0.5,
-4.296587, -3.311996, -4, 0, 1.5, 0.5, 0.5,
-4.296587, -3.311996, -2, 0, -0.5, 0.5, 0.5,
-4.296587, -3.311996, -2, 1, -0.5, 0.5, 0.5,
-4.296587, -3.311996, -2, 1, 1.5, 0.5, 0.5,
-4.296587, -3.311996, -2, 0, 1.5, 0.5, 0.5,
-4.296587, -3.311996, 0, 0, -0.5, 0.5, 0.5,
-4.296587, -3.311996, 0, 1, -0.5, 0.5, 0.5,
-4.296587, -3.311996, 0, 1, 1.5, 0.5, 0.5,
-4.296587, -3.311996, 0, 0, 1.5, 0.5, 0.5,
-4.296587, -3.311996, 2, 0, -0.5, 0.5, 0.5,
-4.296587, -3.311996, 2, 1, -0.5, 0.5, 0.5,
-4.296587, -3.311996, 2, 1, 1.5, 0.5, 0.5,
-4.296587, -3.311996, 2, 0, 1.5, 0.5, 0.5,
-4.296587, -3.311996, 4, 0, -0.5, 0.5, 0.5,
-4.296587, -3.311996, 4, 1, -0.5, 0.5, 0.5,
-4.296587, -3.311996, 4, 1, 1.5, 0.5, 0.5,
-4.296587, -3.311996, 4, 0, 1.5, 0.5, 0.5
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
-3.72433, -2.845735, -5.179687,
-3.72433, 3.371078, -5.179687,
-3.72433, -2.845735, 5.589637,
-3.72433, 3.371078, 5.589637,
-3.72433, -2.845735, -5.179687,
-3.72433, -2.845735, 5.589637,
-3.72433, 3.371078, -5.179687,
-3.72433, 3.371078, 5.589637,
-3.72433, -2.845735, -5.179687,
3.905759, -2.845735, -5.179687,
-3.72433, -2.845735, 5.589637,
3.905759, -2.845735, 5.589637,
-3.72433, 3.371078, -5.179687,
3.905759, 3.371078, -5.179687,
-3.72433, 3.371078, 5.589637,
3.905759, 3.371078, 5.589637,
3.905759, -2.845735, -5.179687,
3.905759, 3.371078, -5.179687,
3.905759, -2.845735, 5.589637,
3.905759, 3.371078, 5.589637,
3.905759, -2.845735, -5.179687,
3.905759, -2.845735, 5.589637,
3.905759, 3.371078, -5.179687,
3.905759, 3.371078, 5.589637
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
var radius = 7.790361;
var distance = 34.66019;
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
mvMatrix.translate( -0.09071457, -0.2626715, -0.2049749 );
mvMatrix.scale( 1.103931, 1.354889, 0.7821373 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.66019);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
OUST<-read.table("OUST.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-OUST$V2
```

```
## Error in eval(expr, envir, enclos): object 'OUST' not found
```

```r
y<-OUST$V3
```

```
## Error in eval(expr, envir, enclos): object 'OUST' not found
```

```r
z<-OUST$V4
```

```
## Error in eval(expr, envir, enclos): object 'OUST' not found
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
-3.613212, 0.1756423, -1.916668, 0, 0, 1, 1, 1,
-3.249496, -0.3012611, -1.693942, 1, 0, 0, 1, 1,
-2.914312, 0.4091944, -2.378944, 1, 0, 0, 1, 1,
-2.87256, 1.180717, -1.645514, 1, 0, 0, 1, 1,
-2.661889, -0.4365538, -1.586044, 1, 0, 0, 1, 1,
-2.592512, -0.805745, -2.346076, 1, 0, 0, 1, 1,
-2.5836, -2.32944, -2.395873, 0, 0, 0, 1, 1,
-2.534895, -0.4199693, -1.998923, 0, 0, 0, 1, 1,
-2.462062, -1.084785, -2.932026, 0, 0, 0, 1, 1,
-2.350723, 0.2019025, -1.63479, 0, 0, 0, 1, 1,
-2.318395, -0.6644101, -2.217782, 0, 0, 0, 1, 1,
-2.302662, -0.01467262, -1.539737, 0, 0, 0, 1, 1,
-2.293494, -0.05243554, -0.9282663, 0, 0, 0, 1, 1,
-2.239099, -0.5306538, -2.192062, 1, 1, 1, 1, 1,
-2.229846, -0.1899497, -1.353696, 1, 1, 1, 1, 1,
-2.207573, 0.8373904, -1.635085, 1, 1, 1, 1, 1,
-2.196429, 0.4144669, -1.147289, 1, 1, 1, 1, 1,
-2.194074, -2.017848, -1.283689, 1, 1, 1, 1, 1,
-2.04479, 0.1781612, -3.439923, 1, 1, 1, 1, 1,
-2.036609, -0.6157061, -0.9914619, 1, 1, 1, 1, 1,
-1.97779, 0.6609246, -1.577038, 1, 1, 1, 1, 1,
-1.976447, 1.965737, -0.7973563, 1, 1, 1, 1, 1,
-1.965212, 0.2728625, -2.535907, 1, 1, 1, 1, 1,
-1.95857, -1.125085, -1.832905, 1, 1, 1, 1, 1,
-1.927838, 0.6636252, 0.2071952, 1, 1, 1, 1, 1,
-1.915149, 1.536812, -1.562507, 1, 1, 1, 1, 1,
-1.909603, -1.971464, -3.89679, 1, 1, 1, 1, 1,
-1.893704, 2.111314, 0.2126203, 1, 1, 1, 1, 1,
-1.88911, -1.301854, -2.095963, 0, 0, 1, 1, 1,
-1.884304, -0.06130001, -0.1133678, 1, 0, 0, 1, 1,
-1.878518, -1.26064, -0.4698359, 1, 0, 0, 1, 1,
-1.868142, -0.1499271, -1.819908, 1, 0, 0, 1, 1,
-1.865621, 1.817285, 0.1956609, 1, 0, 0, 1, 1,
-1.864071, -0.8346776, -2.20624, 1, 0, 0, 1, 1,
-1.841365, -0.3397361, -1.624994, 0, 0, 0, 1, 1,
-1.835675, -0.09947769, -2.593535, 0, 0, 0, 1, 1,
-1.814726, -1.574292, -2.015863, 0, 0, 0, 1, 1,
-1.806266, 1.224679, -0.9680434, 0, 0, 0, 1, 1,
-1.80435, -0.07215904, -2.092834, 0, 0, 0, 1, 1,
-1.797949, 0.9745229, 0.5428617, 0, 0, 0, 1, 1,
-1.784184, 0.09331095, -1.221894, 0, 0, 0, 1, 1,
-1.779705, -0.2964499, -2.329886, 1, 1, 1, 1, 1,
-1.752459, -0.5884094, -2.676455, 1, 1, 1, 1, 1,
-1.750255, -0.1161542, -3.854507, 1, 1, 1, 1, 1,
-1.745681, -1.573569, -2.855688, 1, 1, 1, 1, 1,
-1.74002, 2.289573, -0.2796632, 1, 1, 1, 1, 1,
-1.734153, -0.470745, -1.314826, 1, 1, 1, 1, 1,
-1.729794, -0.2317687, -1.34887, 1, 1, 1, 1, 1,
-1.727133, -0.04820221, -1.976349, 1, 1, 1, 1, 1,
-1.711816, -0.06932148, 0.5064965, 1, 1, 1, 1, 1,
-1.686737, -0.07260669, -1.950459, 1, 1, 1, 1, 1,
-1.679278, -0.7273214, 0.6179474, 1, 1, 1, 1, 1,
-1.673891, -2.062449, 0.07312071, 1, 1, 1, 1, 1,
-1.666712, 1.787124, -0.2875453, 1, 1, 1, 1, 1,
-1.663049, -0.8236765, -1.952995, 1, 1, 1, 1, 1,
-1.64751, 0.7105995, -2.009657, 1, 1, 1, 1, 1,
-1.64175, 0.05281738, -3.0175, 0, 0, 1, 1, 1,
-1.636014, -0.8410812, -4.103736, 1, 0, 0, 1, 1,
-1.629359, -0.6255376, -1.181731, 1, 0, 0, 1, 1,
-1.6255, -0.08888498, -0.2285658, 1, 0, 0, 1, 1,
-1.616536, -1.239193, -1.582692, 1, 0, 0, 1, 1,
-1.612982, -1.97835, -1.508274, 1, 0, 0, 1, 1,
-1.60404, 1.777303, -0.6425433, 0, 0, 0, 1, 1,
-1.593656, 0.2417503, -4.049071, 0, 0, 0, 1, 1,
-1.572772, -1.474614, -2.904949, 0, 0, 0, 1, 1,
-1.568558, -1.194366, -3.048668, 0, 0, 0, 1, 1,
-1.556732, -0.2202219, -2.146539, 0, 0, 0, 1, 1,
-1.552364, 0.05775792, -0.851434, 0, 0, 0, 1, 1,
-1.55016, -0.7418463, -1.946249, 0, 0, 0, 1, 1,
-1.547336, -0.01199407, -1.998356, 1, 1, 1, 1, 1,
-1.532803, -0.963974, -2.530877, 1, 1, 1, 1, 1,
-1.522902, 2.16639, 0.01270197, 1, 1, 1, 1, 1,
-1.509644, 0.5605637, -0.6877514, 1, 1, 1, 1, 1,
-1.498238, -1.718295, -4.186671, 1, 1, 1, 1, 1,
-1.490496, -0.3593021, -2.295457, 1, 1, 1, 1, 1,
-1.488169, -1.190975, -3.457425, 1, 1, 1, 1, 1,
-1.485846, 0.4765323, -1.635641, 1, 1, 1, 1, 1,
-1.476659, 0.09342112, -0.5989401, 1, 1, 1, 1, 1,
-1.475473, 0.8985202, -1.90763, 1, 1, 1, 1, 1,
-1.473083, -1.06587, -1.827376, 1, 1, 1, 1, 1,
-1.467043, -0.1729159, -2.143029, 1, 1, 1, 1, 1,
-1.465472, -1.232017, -2.814327, 1, 1, 1, 1, 1,
-1.464857, 0.887212, -1.87459, 1, 1, 1, 1, 1,
-1.464292, -1.308263, -2.127397, 1, 1, 1, 1, 1,
-1.462157, 0.1029127, -0.9426016, 0, 0, 1, 1, 1,
-1.457759, 0.8669181, -0.6314159, 1, 0, 0, 1, 1,
-1.456306, 0.5166824, -1.967777, 1, 0, 0, 1, 1,
-1.455844, -0.2953723, -1.446355, 1, 0, 0, 1, 1,
-1.449705, -0.2878506, -0.3400861, 1, 0, 0, 1, 1,
-1.449545, -0.4406801, -3.46014, 1, 0, 0, 1, 1,
-1.446366, 0.1139547, -0.3982797, 0, 0, 0, 1, 1,
-1.439275, -1.649677, -2.61622, 0, 0, 0, 1, 1,
-1.434777, -0.7780827, -0.4074243, 0, 0, 0, 1, 1,
-1.407326, -0.740241, -0.09298454, 0, 0, 0, 1, 1,
-1.402792, -0.09839994, -2.07281, 0, 0, 0, 1, 1,
-1.396293, -1.298038, -0.9087452, 0, 0, 0, 1, 1,
-1.393174, 1.012148, -0.4195025, 0, 0, 0, 1, 1,
-1.388728, -1.050638, -2.80176, 1, 1, 1, 1, 1,
-1.383034, 0.2470883, -0.4841967, 1, 1, 1, 1, 1,
-1.382149, 0.3264312, -1.039699, 1, 1, 1, 1, 1,
-1.380965, -0.3403356, -2.629476, 1, 1, 1, 1, 1,
-1.380177, 0.2704245, -3.02415, 1, 1, 1, 1, 1,
-1.376713, -1.496985, -0.9994126, 1, 1, 1, 1, 1,
-1.37531, 1.828592, 0.7260833, 1, 1, 1, 1, 1,
-1.359116, 0.008841569, -0.4045689, 1, 1, 1, 1, 1,
-1.358387, 0.388638, -3.104534, 1, 1, 1, 1, 1,
-1.356069, 0.5775817, -2.051281, 1, 1, 1, 1, 1,
-1.355879, 0.6618922, -0.4153709, 1, 1, 1, 1, 1,
-1.351329, -1.187789, -2.902334, 1, 1, 1, 1, 1,
-1.335606, -0.004063984, -2.941524, 1, 1, 1, 1, 1,
-1.3166, 0.6019557, -0.02704242, 1, 1, 1, 1, 1,
-1.311808, 0.6530772, -0.6058833, 1, 1, 1, 1, 1,
-1.309327, 0.09331223, 0.8820274, 0, 0, 1, 1, 1,
-1.304283, -2.147293, -3.350864, 1, 0, 0, 1, 1,
-1.278778, 0.4495986, -2.260005, 1, 0, 0, 1, 1,
-1.273684, 1.553118, -0.4299546, 1, 0, 0, 1, 1,
-1.272436, 0.2185843, -2.54542, 1, 0, 0, 1, 1,
-1.272151, -0.4743637, -1.847985, 1, 0, 0, 1, 1,
-1.26618, 1.389318, 0.1009388, 0, 0, 0, 1, 1,
-1.26282, 0.622106, -0.8156255, 0, 0, 0, 1, 1,
-1.260714, 1.055635, 1.088332, 0, 0, 0, 1, 1,
-1.258471, -0.783725, -0.8097012, 0, 0, 0, 1, 1,
-1.253334, 1.503124, -3.385773, 0, 0, 0, 1, 1,
-1.249193, -1.174729, -3.844552, 0, 0, 0, 1, 1,
-1.245482, 0.4686137, -1.067137, 0, 0, 0, 1, 1,
-1.244124, 1.99568, -0.5470623, 1, 1, 1, 1, 1,
-1.241695, -0.03404674, -1.315144, 1, 1, 1, 1, 1,
-1.231694, 0.8576518, 1.048999, 1, 1, 1, 1, 1,
-1.224757, -1.291598, -0.2850506, 1, 1, 1, 1, 1,
-1.221482, 1.121739, -0.9807605, 1, 1, 1, 1, 1,
-1.220595, 1.505466, -1.159073, 1, 1, 1, 1, 1,
-1.216313, -0.3057179, -1.206495, 1, 1, 1, 1, 1,
-1.214525, 0.862502, 0.2760803, 1, 1, 1, 1, 1,
-1.20136, -0.6587484, -3.056933, 1, 1, 1, 1, 1,
-1.198193, 0.2333213, -1.415334, 1, 1, 1, 1, 1,
-1.1959, 0.4239411, -0.6919833, 1, 1, 1, 1, 1,
-1.192859, 0.6830484, -1.761984, 1, 1, 1, 1, 1,
-1.192833, -1.569299, -4.139122, 1, 1, 1, 1, 1,
-1.191305, -0.03077072, -2.508545, 1, 1, 1, 1, 1,
-1.188993, 0.6849588, -1.881266, 1, 1, 1, 1, 1,
-1.187799, -0.6416933, -3.648926, 0, 0, 1, 1, 1,
-1.170581, 0.3958588, -3.190778, 1, 0, 0, 1, 1,
-1.170566, -2.130845, -2.481878, 1, 0, 0, 1, 1,
-1.16789, -2.061362, -1.690004, 1, 0, 0, 1, 1,
-1.167167, -0.6836061, -2.99544, 1, 0, 0, 1, 1,
-1.157212, 0.6938114, -0.1629694, 1, 0, 0, 1, 1,
-1.156955, 2.053717, -0.4913216, 0, 0, 0, 1, 1,
-1.14672, 1.222528, 0.03565633, 0, 0, 0, 1, 1,
-1.133905, 0.04283307, -1.307016, 0, 0, 0, 1, 1,
-1.133441, 1.537403, -0.03523541, 0, 0, 0, 1, 1,
-1.126481, 0.09518418, -1.133129, 0, 0, 0, 1, 1,
-1.12334, -1.317233, -2.630002, 0, 0, 0, 1, 1,
-1.118785, -0.8360889, -2.92316, 0, 0, 0, 1, 1,
-1.116941, 0.538833, -2.565885, 1, 1, 1, 1, 1,
-1.114168, -0.3495238, -2.15577, 1, 1, 1, 1, 1,
-1.108882, -0.9456635, -3.976243, 1, 1, 1, 1, 1,
-1.097996, -1.069301, -1.353809, 1, 1, 1, 1, 1,
-1.094567, 0.03327788, -0.5277897, 1, 1, 1, 1, 1,
-1.090238, -0.3615257, -3.228876, 1, 1, 1, 1, 1,
-1.084831, 1.045168, 0.2829396, 1, 1, 1, 1, 1,
-1.076424, 1.256989, -2.120744, 1, 1, 1, 1, 1,
-1.074458, -0.3473293, -3.401917, 1, 1, 1, 1, 1,
-1.074005, -0.2286651, -2.504102, 1, 1, 1, 1, 1,
-1.061274, 1.176907, -0.8123544, 1, 1, 1, 1, 1,
-1.056012, 0.7376937, -2.205725, 1, 1, 1, 1, 1,
-1.038989, -2.335614, -3.287791, 1, 1, 1, 1, 1,
-1.029141, -0.2517631, -1.333462, 1, 1, 1, 1, 1,
-1.025629, -1.226269, -2.277273, 1, 1, 1, 1, 1,
-1.024888, 2.921148, -1.137985, 0, 0, 1, 1, 1,
-1.021439, 1.142668, 0.565331, 1, 0, 0, 1, 1,
-1.02007, -0.2883658, -0.6966963, 1, 0, 0, 1, 1,
-1.017142, 1.152174, -1.121164, 1, 0, 0, 1, 1,
-1.010301, -0.9295813, -1.382497, 1, 0, 0, 1, 1,
-1.005673, 1.309433, -1.224937, 1, 0, 0, 1, 1,
-0.9991102, -0.123689, -1.024161, 0, 0, 0, 1, 1,
-0.998533, 0.5415696, -2.432399, 0, 0, 0, 1, 1,
-0.9971178, 0.9080718, -2.047857, 0, 0, 0, 1, 1,
-0.9955658, 0.1460826, -2.722324, 0, 0, 0, 1, 1,
-0.9944486, -0.2649439, -3.54392, 0, 0, 0, 1, 1,
-0.9898316, 0.008040961, -2.036413, 0, 0, 0, 1, 1,
-0.9895288, 1.570061, 0.0839301, 0, 0, 0, 1, 1,
-0.9795498, 0.3587119, -1.22481, 1, 1, 1, 1, 1,
-0.9705979, 0.640166, -0.7149282, 1, 1, 1, 1, 1,
-0.9691745, 1.397091, -0.5576954, 1, 1, 1, 1, 1,
-0.9670162, -1.748252, -3.074121, 1, 1, 1, 1, 1,
-0.96334, -0.3403685, -1.991043, 1, 1, 1, 1, 1,
-0.9608412, -0.5160009, -0.829565, 1, 1, 1, 1, 1,
-0.9560073, -0.3241205, -1.665692, 1, 1, 1, 1, 1,
-0.9549141, 2.468055, -0.9164976, 1, 1, 1, 1, 1,
-0.9541374, 0.03538506, -2.00262, 1, 1, 1, 1, 1,
-0.9512507, 0.3183818, 0.2987629, 1, 1, 1, 1, 1,
-0.9402405, 1.249226, -0.556892, 1, 1, 1, 1, 1,
-0.9399995, -0.08184409, -2.736312, 1, 1, 1, 1, 1,
-0.9362762, -0.3046845, -0.533824, 1, 1, 1, 1, 1,
-0.9356635, 0.01662749, -1.268499, 1, 1, 1, 1, 1,
-0.9325469, 0.171757, -0.1604157, 1, 1, 1, 1, 1,
-0.929051, -0.8386414, -2.121461, 0, 0, 1, 1, 1,
-0.92457, 1.36553, -1.192394, 1, 0, 0, 1, 1,
-0.9221391, -1.022516, -3.379305, 1, 0, 0, 1, 1,
-0.9220341, -0.8856965, -1.775751, 1, 0, 0, 1, 1,
-0.9182317, 0.2424743, -0.6231216, 1, 0, 0, 1, 1,
-0.9156048, -1.907518, -2.120745, 1, 0, 0, 1, 1,
-0.9130591, 0.03234513, 1.848496, 0, 0, 0, 1, 1,
-0.9124545, 0.6693202, -0.7844128, 0, 0, 0, 1, 1,
-0.9055903, -1.225542, -0.9764886, 0, 0, 0, 1, 1,
-0.9053344, -1.89854, -3.181185, 0, 0, 0, 1, 1,
-0.9002212, 0.9112882, -0.8057931, 0, 0, 0, 1, 1,
-0.8938043, 0.4129753, -1.569792, 0, 0, 0, 1, 1,
-0.8888764, 1.580628, -0.7278019, 0, 0, 0, 1, 1,
-0.8880632, -1.769819, -2.498335, 1, 1, 1, 1, 1,
-0.8810527, -0.1058786, -1.472594, 1, 1, 1, 1, 1,
-0.8766519, 1.336988, -1.506765, 1, 1, 1, 1, 1,
-0.8750118, 1.245171, -1.883245, 1, 1, 1, 1, 1,
-0.8700882, 0.4622489, -1.200299, 1, 1, 1, 1, 1,
-0.8697151, -0.7651268, -3.529718, 1, 1, 1, 1, 1,
-0.8681483, 2.416546, 0.6240283, 1, 1, 1, 1, 1,
-0.8655879, -0.1277187, -4.268296, 1, 1, 1, 1, 1,
-0.863738, 1.175465, -1.492953, 1, 1, 1, 1, 1,
-0.8627771, -1.524273, -2.147845, 1, 1, 1, 1, 1,
-0.8566875, 1.039218, -1.609553, 1, 1, 1, 1, 1,
-0.8557221, 0.6099643, -0.4169351, 1, 1, 1, 1, 1,
-0.8551098, -1.906744, -0.9606976, 1, 1, 1, 1, 1,
-0.8550188, 0.8915387, -0.4814792, 1, 1, 1, 1, 1,
-0.8503896, -0.5357454, -1.273324, 1, 1, 1, 1, 1,
-0.844355, -0.892978, -1.888953, 0, 0, 1, 1, 1,
-0.8436209, 1.069263, -1.911347, 1, 0, 0, 1, 1,
-0.8388302, 0.004481087, -1.07489, 1, 0, 0, 1, 1,
-0.8304656, 0.9073514, -0.2283923, 1, 0, 0, 1, 1,
-0.8255679, 0.1141674, -0.8218193, 1, 0, 0, 1, 1,
-0.8237174, -0.9478519, -2.721228, 1, 0, 0, 1, 1,
-0.8215553, -1.516378, -1.659407, 0, 0, 0, 1, 1,
-0.8125914, 0.03027235, -0.8171837, 0, 0, 0, 1, 1,
-0.8004031, 1.251163, 0.3366284, 0, 0, 0, 1, 1,
-0.7939141, 0.8429016, -0.968547, 0, 0, 0, 1, 1,
-0.7896647, -0.7905995, -3.635588, 0, 0, 0, 1, 1,
-0.7848246, -0.7204027, -0.2788174, 0, 0, 0, 1, 1,
-0.7801095, 1.222, -1.230873, 0, 0, 0, 1, 1,
-0.7748984, 0.431435, -1.705622, 1, 1, 1, 1, 1,
-0.7731459, -0.1746427, -0.6734352, 1, 1, 1, 1, 1,
-0.7691313, -1.562624, -2.047024, 1, 1, 1, 1, 1,
-0.7686526, 0.1227813, -2.067129, 1, 1, 1, 1, 1,
-0.7651428, 0.5699835, 0.3458037, 1, 1, 1, 1, 1,
-0.7624528, 0.5368367, -1.486022, 1, 1, 1, 1, 1,
-0.7613662, -1.630691, -4.26426, 1, 1, 1, 1, 1,
-0.759286, -0.988926, -2.983473, 1, 1, 1, 1, 1,
-0.7545374, 0.4453233, -1.176178, 1, 1, 1, 1, 1,
-0.754111, 0.1946517, -1.457646, 1, 1, 1, 1, 1,
-0.7505167, -1.722796, -0.7175207, 1, 1, 1, 1, 1,
-0.7434741, 0.4627067, -1.821048, 1, 1, 1, 1, 1,
-0.7308751, -1.376564, -1.802312, 1, 1, 1, 1, 1,
-0.7278913, 1.430312, -0.103212, 1, 1, 1, 1, 1,
-0.7273075, -0.9077465, -1.532894, 1, 1, 1, 1, 1,
-0.7259883, -1.551432, -5.022852, 0, 0, 1, 1, 1,
-0.7227786, -0.5197791, -0.8842204, 1, 0, 0, 1, 1,
-0.714242, -0.3618754, -2.346761, 1, 0, 0, 1, 1,
-0.7139137, 0.3776164, -1.627521, 1, 0, 0, 1, 1,
-0.7124835, 0.02337221, -2.002151, 1, 0, 0, 1, 1,
-0.7113834, -0.07923473, -1.675602, 1, 0, 0, 1, 1,
-0.6977059, -0.79401, -1.564569, 0, 0, 0, 1, 1,
-0.6975353, 0.8988631, 0.09268444, 0, 0, 0, 1, 1,
-0.6931515, 0.490878, -1.417318, 0, 0, 0, 1, 1,
-0.6913415, -0.6425425, -2.037964, 0, 0, 0, 1, 1,
-0.6912069, 0.4419168, 0.7801093, 0, 0, 0, 1, 1,
-0.6846215, -0.442025, -1.512956, 0, 0, 0, 1, 1,
-0.6845321, -0.6115502, -2.509975, 0, 0, 0, 1, 1,
-0.678917, -0.2577444, -2.036352, 1, 1, 1, 1, 1,
-0.674013, 2.005695, 1.131448, 1, 1, 1, 1, 1,
-0.6736751, 1.601052, -1.712178, 1, 1, 1, 1, 1,
-0.6718042, -1.039344, -1.672655, 1, 1, 1, 1, 1,
-0.6714712, -0.9329425, -2.299723, 1, 1, 1, 1, 1,
-0.6702274, 1.120142, -0.8282209, 1, 1, 1, 1, 1,
-0.6633672, -0.4823847, -1.906137, 1, 1, 1, 1, 1,
-0.6533232, -0.1197699, -2.197135, 1, 1, 1, 1, 1,
-0.6458274, -0.5336367, -2.035771, 1, 1, 1, 1, 1,
-0.6450894, 1.251211, -0.9613218, 1, 1, 1, 1, 1,
-0.6416145, -0.2553087, -1.069057, 1, 1, 1, 1, 1,
-0.6413123, -0.6764094, -3.197083, 1, 1, 1, 1, 1,
-0.6377219, -0.5881861, -2.323045, 1, 1, 1, 1, 1,
-0.6352435, -0.6195564, -2.487002, 1, 1, 1, 1, 1,
-0.631313, -0.0170176, -1.403022, 1, 1, 1, 1, 1,
-0.6257256, -0.8233648, -4.752868, 0, 0, 1, 1, 1,
-0.6154589, -0.4662118, -2.411448, 1, 0, 0, 1, 1,
-0.6153415, -0.7063954, -1.563436, 1, 0, 0, 1, 1,
-0.6129432, -0.7947598, -3.124426, 1, 0, 0, 1, 1,
-0.6103724, -1.087591, -3.032309, 1, 0, 0, 1, 1,
-0.6094152, 0.3943828, -0.5343997, 1, 0, 0, 1, 1,
-0.6055031, 1.190032, -1.741404, 0, 0, 0, 1, 1,
-0.6045727, 0.2428469, -1.450098, 0, 0, 0, 1, 1,
-0.597926, 1.68443, -0.4281618, 0, 0, 0, 1, 1,
-0.5966101, 2.063189, -1.964303, 0, 0, 0, 1, 1,
-0.5961916, -0.05318659, -3.359421, 0, 0, 0, 1, 1,
-0.595585, 0.1705084, -1.606023, 0, 0, 0, 1, 1,
-0.5867189, 0.9127927, -2.909717, 0, 0, 0, 1, 1,
-0.5843973, -2.543802, -3.163026, 1, 1, 1, 1, 1,
-0.583562, -0.8508406, -2.066009, 1, 1, 1, 1, 1,
-0.5774881, -0.4253451, -1.665256, 1, 1, 1, 1, 1,
-0.5721021, 0.07759634, -0.6080388, 1, 1, 1, 1, 1,
-0.5701292, -1.605112, -1.48102, 1, 1, 1, 1, 1,
-0.564283, 1.067309, -2.09534, 1, 1, 1, 1, 1,
-0.561241, -0.5555674, -1.740163, 1, 1, 1, 1, 1,
-0.5559195, -1.369946, -1.065802, 1, 1, 1, 1, 1,
-0.544846, 0.08836012, -0.5477843, 1, 1, 1, 1, 1,
-0.5443872, -0.5460181, -2.145051, 1, 1, 1, 1, 1,
-0.544238, 3.280542, -1.213842, 1, 1, 1, 1, 1,
-0.5426381, -0.4689032, -4.775594, 1, 1, 1, 1, 1,
-0.5425234, 0.1099122, -1.780322, 1, 1, 1, 1, 1,
-0.5414974, -0.1144289, -2.062362, 1, 1, 1, 1, 1,
-0.5356751, -0.2748366, -4.113624, 1, 1, 1, 1, 1,
-0.5348706, -0.2800106, -1.385859, 0, 0, 1, 1, 1,
-0.5309139, -0.3440052, -1.722504, 1, 0, 0, 1, 1,
-0.5259597, 0.009845295, 0.01646621, 1, 0, 0, 1, 1,
-0.5259423, -0.5916553, -3.536318, 1, 0, 0, 1, 1,
-0.5166467, 0.1459957, -2.439918, 1, 0, 0, 1, 1,
-0.5166297, -1.071848, -3.590332, 1, 0, 0, 1, 1,
-0.514922, 0.07976974, -2.017499, 0, 0, 0, 1, 1,
-0.5089501, 0.7139878, 0.1751334, 0, 0, 0, 1, 1,
-0.5065911, 1.051271, 0.1756043, 0, 0, 0, 1, 1,
-0.5040116, 0.2016462, -2.660492, 0, 0, 0, 1, 1,
-0.5023243, -1.473562, -3.752174, 0, 0, 0, 1, 1,
-0.5020198, -1.064093, -0.9966811, 0, 0, 0, 1, 1,
-0.5013639, -0.7988673, -1.574116, 0, 0, 0, 1, 1,
-0.498974, 0.5229951, -0.5861837, 1, 1, 1, 1, 1,
-0.4963346, 0.399769, -0.2037866, 1, 1, 1, 1, 1,
-0.4931385, -0.419879, -2.53758, 1, 1, 1, 1, 1,
-0.4924545, -1.687571, -4.25369, 1, 1, 1, 1, 1,
-0.4924314, -1.383396, -4.296291, 1, 1, 1, 1, 1,
-0.4915019, -0.1356162, -3.031308, 1, 1, 1, 1, 1,
-0.4912364, -0.5495003, -0.9562565, 1, 1, 1, 1, 1,
-0.481977, 0.6540341, 0.1514002, 1, 1, 1, 1, 1,
-0.4790931, 0.107739, -1.7184, 1, 1, 1, 1, 1,
-0.4780809, 0.4308489, -0.5159506, 1, 1, 1, 1, 1,
-0.477832, -0.1232073, -2.291932, 1, 1, 1, 1, 1,
-0.4772213, 2.060777, 0.4257725, 1, 1, 1, 1, 1,
-0.4741441, -0.6829318, -1.910288, 1, 1, 1, 1, 1,
-0.4724095, -0.8334209, -0.8850302, 1, 1, 1, 1, 1,
-0.4703656, -0.5538048, -2.42154, 1, 1, 1, 1, 1,
-0.4696733, 0.1800311, -0.9090619, 0, 0, 1, 1, 1,
-0.4677041, -2.755199, -2.62958, 1, 0, 0, 1, 1,
-0.4631227, 0.80646, -0.6177059, 1, 0, 0, 1, 1,
-0.4617919, -0.2108939, -1.309374, 1, 0, 0, 1, 1,
-0.4615377, 2.193974, -1.090411, 1, 0, 0, 1, 1,
-0.4602518, 0.2476451, -2.41495, 1, 0, 0, 1, 1,
-0.4546279, 0.2228431, -1.269783, 0, 0, 0, 1, 1,
-0.4537392, 0.15825, -2.554438, 0, 0, 0, 1, 1,
-0.4458794, -1.34008, -3.680958, 0, 0, 0, 1, 1,
-0.4372489, -0.6900837, -2.764263, 0, 0, 0, 1, 1,
-0.4363896, -0.2613656, -2.26162, 0, 0, 0, 1, 1,
-0.4352511, 2.368396, -1.613533, 0, 0, 0, 1, 1,
-0.4349889, -0.2230038, -2.746395, 0, 0, 0, 1, 1,
-0.4320224, 0.2939807, -2.078101, 1, 1, 1, 1, 1,
-0.4293344, -1.025269, -3.729237, 1, 1, 1, 1, 1,
-0.4177693, -0.6622221, -2.711331, 1, 1, 1, 1, 1,
-0.4164264, -0.4118499, -2.685375, 1, 1, 1, 1, 1,
-0.4143354, 0.2998544, -0.4352041, 1, 1, 1, 1, 1,
-0.4120257, -0.4387951, -2.263145, 1, 1, 1, 1, 1,
-0.4073511, -1.664658, -2.380588, 1, 1, 1, 1, 1,
-0.4062672, -0.02541563, -1.674426, 1, 1, 1, 1, 1,
-0.4020103, -1.597675, -3.558741, 1, 1, 1, 1, 1,
-0.3972072, -1.415154, -2.061868, 1, 1, 1, 1, 1,
-0.3934308, -2.275181, -1.92763, 1, 1, 1, 1, 1,
-0.3895898, -0.7506354, -2.338664, 1, 1, 1, 1, 1,
-0.3883514, -1.996305, -2.22821, 1, 1, 1, 1, 1,
-0.3878263, -0.7923659, -1.385568, 1, 1, 1, 1, 1,
-0.3834797, 0.06424008, -2.647916, 1, 1, 1, 1, 1,
-0.3787282, -1.903063, -1.591965, 0, 0, 1, 1, 1,
-0.3710903, -0.8314362, -1.806485, 1, 0, 0, 1, 1,
-0.370938, -0.5095986, -2.83111, 1, 0, 0, 1, 1,
-0.3614796, -1.17997, -3.87329, 1, 0, 0, 1, 1,
-0.3614169, 1.066681, -0.07846465, 1, 0, 0, 1, 1,
-0.3608367, -1.334596, -2.411006, 1, 0, 0, 1, 1,
-0.3513258, -2.054519, -3.120995, 0, 0, 0, 1, 1,
-0.3512821, -0.2367835, -1.12523, 0, 0, 0, 1, 1,
-0.3503933, -1.556437, -3.528755, 0, 0, 0, 1, 1,
-0.3482942, 0.9422982, -1.077781, 0, 0, 0, 1, 1,
-0.3473008, -0.398474, -2.60541, 0, 0, 0, 1, 1,
-0.3458806, -1.115577, -0.8744099, 0, 0, 0, 1, 1,
-0.3446123, 0.1896107, -2.447985, 0, 0, 0, 1, 1,
-0.3406489, 2.110908, 0.6414033, 1, 1, 1, 1, 1,
-0.3388218, -2.191275, -4.778474, 1, 1, 1, 1, 1,
-0.332961, -0.7575065, -3.926399, 1, 1, 1, 1, 1,
-0.3314515, -1.33526, -4.560217, 1, 1, 1, 1, 1,
-0.3299952, -0.7080016, -3.009278, 1, 1, 1, 1, 1,
-0.3298284, -0.71415, -2.29815, 1, 1, 1, 1, 1,
-0.328273, 1.012266, -1.766472, 1, 1, 1, 1, 1,
-0.3276662, 1.271268, 0.8926385, 1, 1, 1, 1, 1,
-0.3267037, -1.545168, -4.141985, 1, 1, 1, 1, 1,
-0.324947, -0.4124935, -1.86208, 1, 1, 1, 1, 1,
-0.3196822, -0.2629511, -2.866368, 1, 1, 1, 1, 1,
-0.3180639, -1.18062, -2.744032, 1, 1, 1, 1, 1,
-0.3155212, 0.564302, 0.0902528, 1, 1, 1, 1, 1,
-0.315338, 0.2953973, -1.729516, 1, 1, 1, 1, 1,
-0.3138837, 1.078502, -0.2589749, 1, 1, 1, 1, 1,
-0.3120717, 0.767491, -0.9070976, 0, 0, 1, 1, 1,
-0.3091587, 0.151772, -1.12305, 1, 0, 0, 1, 1,
-0.3074887, -1.435994, -2.666746, 1, 0, 0, 1, 1,
-0.2985897, -0.6303463, -1.097628, 1, 0, 0, 1, 1,
-0.295518, 0.07057118, -1.057926, 1, 0, 0, 1, 1,
-0.2946604, 0.478302, -1.021654, 1, 0, 0, 1, 1,
-0.293348, -0.3201328, -2.71543, 0, 0, 0, 1, 1,
-0.2928301, 0.09186757, -2.352905, 0, 0, 0, 1, 1,
-0.2919224, -0.8384851, -3.70438, 0, 0, 0, 1, 1,
-0.2902172, -0.8160848, -2.011326, 0, 0, 0, 1, 1,
-0.2890105, -1.312705, -2.376373, 0, 0, 0, 1, 1,
-0.2855564, -0.2257501, -3.216612, 0, 0, 0, 1, 1,
-0.2851912, 0.2978033, -0.2180983, 0, 0, 0, 1, 1,
-0.2830722, 0.1100008, -1.272417, 1, 1, 1, 1, 1,
-0.2813329, 0.4373613, -1.028122, 1, 1, 1, 1, 1,
-0.2752655, 0.6073375, -2.292336, 1, 1, 1, 1, 1,
-0.2748165, 0.6570023, -0.4469163, 1, 1, 1, 1, 1,
-0.2651221, 1.008099, 2.461287, 1, 1, 1, 1, 1,
-0.2638681, -1.082494, -0.8091294, 1, 1, 1, 1, 1,
-0.2624331, -1.246151, -3.317642, 1, 1, 1, 1, 1,
-0.2583782, 0.8929633, 1.351489, 1, 1, 1, 1, 1,
-0.2580735, 0.01806104, -1.969925, 1, 1, 1, 1, 1,
-0.2578503, -1.370595, -4.184297, 1, 1, 1, 1, 1,
-0.2534062, 0.03433731, -0.6250239, 1, 1, 1, 1, 1,
-0.2454717, 1.174002, 0.6397905, 1, 1, 1, 1, 1,
-0.2403006, 0.01299891, -2.582291, 1, 1, 1, 1, 1,
-0.2396003, 1.146087, 1.079678, 1, 1, 1, 1, 1,
-0.2392823, -0.372313, -3.40978, 1, 1, 1, 1, 1,
-0.2376059, 0.5965351, -1.865271, 0, 0, 1, 1, 1,
-0.2374076, 0.7668655, 0.9077553, 1, 0, 0, 1, 1,
-0.2372014, 0.4029239, -0.7313118, 1, 0, 0, 1, 1,
-0.2371525, 0.8181655, -0.1125362, 1, 0, 0, 1, 1,
-0.2327553, -0.1196377, -1.656475, 1, 0, 0, 1, 1,
-0.2302951, 0.191719, -1.803442, 1, 0, 0, 1, 1,
-0.2295411, -0.261337, -1.986347, 0, 0, 0, 1, 1,
-0.2254107, -1.388849, -1.052131, 0, 0, 0, 1, 1,
-0.2220685, -1.075464, -2.327684, 0, 0, 0, 1, 1,
-0.2104392, 0.4375181, -0.9743164, 0, 0, 0, 1, 1,
-0.202011, -0.6456634, -3.379918, 0, 0, 0, 1, 1,
-0.1869993, -0.639624, -3.861537, 0, 0, 0, 1, 1,
-0.1807514, 1.499166, -1.420284, 0, 0, 0, 1, 1,
-0.1807067, -0.290177, -3.09364, 1, 1, 1, 1, 1,
-0.1792504, 0.1446161, 0.5187374, 1, 1, 1, 1, 1,
-0.1785195, 0.9472167, -0.3523583, 1, 1, 1, 1, 1,
-0.1761453, 0.2588553, 0.2982449, 1, 1, 1, 1, 1,
-0.1699885, -0.8878306, -4.959799, 1, 1, 1, 1, 1,
-0.1675196, -0.1417841, 0.1804138, 1, 1, 1, 1, 1,
-0.1674625, 0.3850081, -0.8331327, 1, 1, 1, 1, 1,
-0.1647155, -0.1052623, -3.374697, 1, 1, 1, 1, 1,
-0.1618357, -0.4568038, -2.963889, 1, 1, 1, 1, 1,
-0.1615348, 2.190728, 0.8593609, 1, 1, 1, 1, 1,
-0.15957, -0.2878156, -2.171851, 1, 1, 1, 1, 1,
-0.1564033, -0.7846212, -3.20406, 1, 1, 1, 1, 1,
-0.1502969, -0.8010368, -2.812235, 1, 1, 1, 1, 1,
-0.1467979, -0.315002, -2.229065, 1, 1, 1, 1, 1,
-0.1454636, 0.5483117, -0.2464233, 1, 1, 1, 1, 1,
-0.144077, 2.039689, -1.119262, 0, 0, 1, 1, 1,
-0.1389199, 0.164666, 0.02399123, 1, 0, 0, 1, 1,
-0.137114, -0.1933678, -2.901193, 1, 0, 0, 1, 1,
-0.1312871, -0.5187682, -2.737679, 1, 0, 0, 1, 1,
-0.1311293, 1.197078, -0.07090868, 1, 0, 0, 1, 1,
-0.128334, 0.1355752, -0.01804995, 1, 0, 0, 1, 1,
-0.1268006, 0.7600514, 1.056064, 0, 0, 0, 1, 1,
-0.1257902, 1.749393, 0.4096376, 0, 0, 0, 1, 1,
-0.1231561, -1.255307, -4.929273, 0, 0, 0, 1, 1,
-0.1221528, -0.3833571, -2.621087, 0, 0, 0, 1, 1,
-0.1214607, -0.8624852, -2.165936, 0, 0, 0, 1, 1,
-0.1177257, 0.4743153, 0.5879564, 0, 0, 0, 1, 1,
-0.11553, -0.3496392, -2.711583, 0, 0, 0, 1, 1,
-0.1104147, -0.445588, -3.018739, 1, 1, 1, 1, 1,
-0.1091658, 1.153616, -0.2785042, 1, 1, 1, 1, 1,
-0.1075565, 2.027932, -1.34549, 1, 1, 1, 1, 1,
-0.1071738, 0.3570383, -1.076334, 1, 1, 1, 1, 1,
-0.1044402, -0.7100268, -2.4275, 1, 1, 1, 1, 1,
-0.102374, -0.7290712, -4.303347, 1, 1, 1, 1, 1,
-0.1023386, -0.1389269, -2.17109, 1, 1, 1, 1, 1,
-0.09957676, -1.343055, -4.225421, 1, 1, 1, 1, 1,
-0.09865779, 1.027265, 0.3641452, 1, 1, 1, 1, 1,
-0.09473212, -0.5402534, -1.571342, 1, 1, 1, 1, 1,
-0.09443545, -0.7661038, -2.264968, 1, 1, 1, 1, 1,
-0.09210553, -1.524774, -2.925118, 1, 1, 1, 1, 1,
-0.08928353, 0.3840786, -0.2289489, 1, 1, 1, 1, 1,
-0.08846713, -0.4730482, -3.393249, 1, 1, 1, 1, 1,
-0.08658069, 0.659068, 0.4583303, 1, 1, 1, 1, 1,
-0.07581979, -0.1310084, -2.790167, 0, 0, 1, 1, 1,
-0.07543647, 0.5090209, -0.9157578, 1, 0, 0, 1, 1,
-0.07530244, 0.8267979, 1.764619, 1, 0, 0, 1, 1,
-0.07183452, -0.3335799, -2.631826, 1, 0, 0, 1, 1,
-0.07160372, 0.8708842, -0.3155835, 1, 0, 0, 1, 1,
-0.0685331, -0.5854899, -3.60108, 1, 0, 0, 1, 1,
-0.06775127, 0.4280645, 1.013095, 0, 0, 0, 1, 1,
-0.06755225, -0.5159292, -1.098403, 0, 0, 0, 1, 1,
-0.06653723, -1.467131, -2.987959, 0, 0, 0, 1, 1,
-0.06628468, 0.1904748, -0.6431456, 0, 0, 0, 1, 1,
-0.06366591, 0.5132128, -2.012219, 0, 0, 0, 1, 1,
-0.06345335, 0.6672972, -0.1068356, 0, 0, 0, 1, 1,
-0.06245873, 1.184871, 0.371707, 0, 0, 0, 1, 1,
-0.06126832, 1.138296, 0.1302076, 1, 1, 1, 1, 1,
-0.05887065, -0.4548607, -2.198375, 1, 1, 1, 1, 1,
-0.05751263, -0.4457143, -1.87323, 1, 1, 1, 1, 1,
-0.05106281, 0.9258057, 0.1961799, 1, 1, 1, 1, 1,
-0.05093902, -0.05691206, -0.3246696, 1, 1, 1, 1, 1,
-0.05075264, -0.271125, -1.401696, 1, 1, 1, 1, 1,
-0.04885312, -0.05982749, -2.411283, 1, 1, 1, 1, 1,
-0.04690843, 0.5364775, -1.050867, 1, 1, 1, 1, 1,
-0.0431524, 1.324577, 0.1626032, 1, 1, 1, 1, 1,
-0.04155003, -0.7501495, -3.603815, 1, 1, 1, 1, 1,
-0.04005406, -1.192906, -3.856323, 1, 1, 1, 1, 1,
-0.03945108, 1.225596, -0.2345532, 1, 1, 1, 1, 1,
-0.03013494, 0.5604461, -1.230332, 1, 1, 1, 1, 1,
-0.02521957, 1.136467, -2.358358, 1, 1, 1, 1, 1,
-0.02458482, -0.7985809, -4.287749, 1, 1, 1, 1, 1,
-0.02276005, 0.1031457, -0.07374656, 0, 0, 1, 1, 1,
-0.02181296, -0.2551703, -3.844985, 1, 0, 0, 1, 1,
-0.02145337, -2.064657, -3.278447, 1, 0, 0, 1, 1,
-0.02088117, 0.3044763, 0.4289896, 1, 0, 0, 1, 1,
-0.01711708, -0.6805775, -2.555193, 1, 0, 0, 1, 1,
-0.01296239, 1.312147, 2.551867, 1, 0, 0, 1, 1,
-0.01149844, 1.347256, -0.5429134, 0, 0, 0, 1, 1,
0.006216393, 0.3990524, 0.3318709, 0, 0, 0, 1, 1,
0.008177105, -0.8645955, 2.362465, 0, 0, 0, 1, 1,
0.008764478, 0.1408454, -0.0558314, 0, 0, 0, 1, 1,
0.01753993, 1.345676, -0.764772, 0, 0, 0, 1, 1,
0.01825998, 0.4451191, -0.8179151, 0, 0, 0, 1, 1,
0.02123782, -0.2144867, 2.144495, 0, 0, 0, 1, 1,
0.02379499, -0.06132186, 2.101999, 1, 1, 1, 1, 1,
0.02875055, 0.8003122, 0.3966874, 1, 1, 1, 1, 1,
0.03090035, 1.869383, 0.8487705, 1, 1, 1, 1, 1,
0.03121493, 2.126303, 0.9252577, 1, 1, 1, 1, 1,
0.03618364, -0.4445097, 3.181303, 1, 1, 1, 1, 1,
0.03693659, -0.27371, 2.459426, 1, 1, 1, 1, 1,
0.03712478, -0.7811827, 2.521109, 1, 1, 1, 1, 1,
0.04185712, 0.2659931, 1.547485, 1, 1, 1, 1, 1,
0.04443768, 0.8828815, 0.12317, 1, 1, 1, 1, 1,
0.04759231, -0.2570892, 1.443962, 1, 1, 1, 1, 1,
0.05534567, 0.2492406, 0.4731738, 1, 1, 1, 1, 1,
0.05579636, -1.481826, 4.099761, 1, 1, 1, 1, 1,
0.05749442, 0.4586503, -1.383694, 1, 1, 1, 1, 1,
0.05827304, -0.4393781, 3.200242, 1, 1, 1, 1, 1,
0.06104502, -2.15626, 3.942621, 1, 1, 1, 1, 1,
0.06159049, 1.193553, -1.621847, 0, 0, 1, 1, 1,
0.06238837, 1.293877, 0.9736308, 1, 0, 0, 1, 1,
0.06720854, 1.35043, -0.9674001, 1, 0, 0, 1, 1,
0.06864547, 1.001847, -1.633113, 1, 0, 0, 1, 1,
0.06919342, 1.439242, -0.7156538, 1, 0, 0, 1, 1,
0.07261746, -1.663113, 2.469433, 1, 0, 0, 1, 1,
0.07851385, -0.1122732, 3.798478, 0, 0, 0, 1, 1,
0.08065619, 0.320191, 0.9693595, 0, 0, 0, 1, 1,
0.08184561, -0.4093619, 3.16015, 0, 0, 0, 1, 1,
0.08261377, -0.04915844, 0.0703836, 0, 0, 0, 1, 1,
0.08292878, 0.7476099, -0.9876024, 0, 0, 0, 1, 1,
0.08346898, -0.298869, 3.862895, 0, 0, 0, 1, 1,
0.08485276, 0.3411165, 1.398627, 0, 0, 0, 1, 1,
0.08621172, 0.9738461, 1.679651, 1, 1, 1, 1, 1,
0.08933964, 0.3810144, -0.5037983, 1, 1, 1, 1, 1,
0.08951908, -1.502867, 2.083372, 1, 1, 1, 1, 1,
0.09717946, 0.12744, 0.3649626, 1, 1, 1, 1, 1,
0.09878868, -0.4625892, 2.898596, 1, 1, 1, 1, 1,
0.09903615, 0.7759631, 0.8478786, 1, 1, 1, 1, 1,
0.09972862, -0.9977447, 3.904326, 1, 1, 1, 1, 1,
0.1015784, -1.645893, 3.317364, 1, 1, 1, 1, 1,
0.1033313, -1.528711, 2.554524, 1, 1, 1, 1, 1,
0.1037005, 0.3218724, 0.3125696, 1, 1, 1, 1, 1,
0.1069543, -0.6226605, 1.508925, 1, 1, 1, 1, 1,
0.108711, 0.9069966, 1.138009, 1, 1, 1, 1, 1,
0.1098088, 0.1804443, -0.1972034, 1, 1, 1, 1, 1,
0.1186809, -0.9035794, 2.065185, 1, 1, 1, 1, 1,
0.1285225, 2.031679, -0.07494203, 1, 1, 1, 1, 1,
0.1350588, 0.8551493, 1.931293, 0, 0, 1, 1, 1,
0.1362198, 0.3717223, -1.545717, 1, 0, 0, 1, 1,
0.1388109, -0.02088508, 1.539244, 1, 0, 0, 1, 1,
0.1399833, 1.749801, -0.8809277, 1, 0, 0, 1, 1,
0.1401327, 1.293498, -0.2375772, 1, 0, 0, 1, 1,
0.1438304, -2.474452, 2.886342, 1, 0, 0, 1, 1,
0.1457856, 0.9503924, -0.3459528, 0, 0, 0, 1, 1,
0.1470181, 0.1459304, 1.952905, 0, 0, 0, 1, 1,
0.1519606, -2.669845, 3.665494, 0, 0, 0, 1, 1,
0.1521677, 0.2200276, 1.130365, 0, 0, 0, 1, 1,
0.1551098, -0.3548454, 2.399238, 0, 0, 0, 1, 1,
0.1610039, 1.297843, -0.4265594, 0, 0, 0, 1, 1,
0.1613317, -0.1254689, 2.420247, 0, 0, 0, 1, 1,
0.1693981, 1.284329, -0.4764891, 1, 1, 1, 1, 1,
0.16977, 1.556111, -0.7460974, 1, 1, 1, 1, 1,
0.1698939, -0.7845252, 4.030161, 1, 1, 1, 1, 1,
0.1720531, 0.6637365, 0.4130739, 1, 1, 1, 1, 1,
0.1750487, -1.744668, 2.938702, 1, 1, 1, 1, 1,
0.1754421, -1.278219, 2.694876, 1, 1, 1, 1, 1,
0.1768966, -1.203067, 2.407191, 1, 1, 1, 1, 1,
0.1831235, 0.647876, -0.04298475, 1, 1, 1, 1, 1,
0.1895986, -0.6376188, 2.79574, 1, 1, 1, 1, 1,
0.1911695, 0.1640212, 0.7739878, 1, 1, 1, 1, 1,
0.1940868, -1.223493, 5.432802, 1, 1, 1, 1, 1,
0.195599, -0.3411172, 1.422253, 1, 1, 1, 1, 1,
0.1960135, 0.1399664, 0.9527907, 1, 1, 1, 1, 1,
0.2033585, 0.2289942, -0.4818359, 1, 1, 1, 1, 1,
0.2061169, 1.066064, 1.942695, 1, 1, 1, 1, 1,
0.2080616, 0.7540715, -0.05520639, 0, 0, 1, 1, 1,
0.2085345, -0.2443402, 2.866349, 1, 0, 0, 1, 1,
0.2153829, -1.213215, 2.229067, 1, 0, 0, 1, 1,
0.2166371, 0.1025267, 1.429133, 1, 0, 0, 1, 1,
0.220999, 0.2278576, -1.155427, 1, 0, 0, 1, 1,
0.2227363, -0.5450079, 4.182484, 1, 0, 0, 1, 1,
0.2303001, -0.3367097, 2.694983, 0, 0, 0, 1, 1,
0.2313892, 1.393905, -0.2184466, 0, 0, 0, 1, 1,
0.2320197, 1.164193, 0.7660614, 0, 0, 0, 1, 1,
0.2372505, -0.6812819, 4.509225, 0, 0, 0, 1, 1,
0.2397271, -0.6676269, 2.444376, 0, 0, 0, 1, 1,
0.2450185, -1.106315, 2.183203, 0, 0, 0, 1, 1,
0.2464949, 1.498195, -0.533897, 0, 0, 0, 1, 1,
0.2481704, -1.574699, 4.470555, 1, 1, 1, 1, 1,
0.2490051, -0.07266667, 1.914494, 1, 1, 1, 1, 1,
0.2542498, 0.7945693, -0.3405395, 1, 1, 1, 1, 1,
0.2565758, -2.340857, 2.112936, 1, 1, 1, 1, 1,
0.2579579, 0.3999432, 0.9588556, 1, 1, 1, 1, 1,
0.2594331, -2.29832, 4.132263, 1, 1, 1, 1, 1,
0.2604218, 0.9204549, 0.7849946, 1, 1, 1, 1, 1,
0.2608857, -0.02851583, 2.215587, 1, 1, 1, 1, 1,
0.2659348, -0.04237726, 1.480685, 1, 1, 1, 1, 1,
0.2682658, -0.2770634, 1.435478, 1, 1, 1, 1, 1,
0.2698219, 2.054178, 1.201384, 1, 1, 1, 1, 1,
0.2735453, 0.9627391, -0.2809933, 1, 1, 1, 1, 1,
0.2762188, 1.18058, 1.109589, 1, 1, 1, 1, 1,
0.2768637, -1.217178, 2.03251, 1, 1, 1, 1, 1,
0.2854873, 0.3929801, 1.334983, 1, 1, 1, 1, 1,
0.2987714, 0.2430288, -0.1660566, 0, 0, 1, 1, 1,
0.310366, -0.3899566, 2.953563, 1, 0, 0, 1, 1,
0.3121045, 0.381845, -1.6137, 1, 0, 0, 1, 1,
0.3123283, 0.05452988, 1.97888, 1, 0, 0, 1, 1,
0.31738, -0.2132435, 1.929818, 1, 0, 0, 1, 1,
0.3214519, -1.298302, 3.516261, 1, 0, 0, 1, 1,
0.3229622, -1.125756, 1.631292, 0, 0, 0, 1, 1,
0.327736, -0.2167604, 1.466715, 0, 0, 0, 1, 1,
0.3307105, 1.465341, 1.499086, 0, 0, 0, 1, 1,
0.3339934, -1.477938, 4.635442, 0, 0, 0, 1, 1,
0.3343934, -1.464207, 3.985244, 0, 0, 0, 1, 1,
0.3348141, -0.8689728, 2.435095, 0, 0, 0, 1, 1,
0.336277, -1.506928, 3.866058, 0, 0, 0, 1, 1,
0.3368869, -0.8832547, 2.575834, 1, 1, 1, 1, 1,
0.3369227, 0.1401231, 1.326944, 1, 1, 1, 1, 1,
0.3387473, -2.100117, 4.827209, 1, 1, 1, 1, 1,
0.3393708, 0.0294438, 1.766513, 1, 1, 1, 1, 1,
0.340176, 0.7707338, -1.114693, 1, 1, 1, 1, 1,
0.343941, 1.530155, 0.243524, 1, 1, 1, 1, 1,
0.3441446, 0.9832041, -1.418828, 1, 1, 1, 1, 1,
0.3527056, -0.5765526, 3.960062, 1, 1, 1, 1, 1,
0.3556316, 1.290604, 0.3848985, 1, 1, 1, 1, 1,
0.3557991, -0.7639185, 4.782954, 1, 1, 1, 1, 1,
0.3591527, 0.01709417, 2.57618, 1, 1, 1, 1, 1,
0.3591694, 0.6113058, 1.408459, 1, 1, 1, 1, 1,
0.3617077, 1.264317, 1.603973, 1, 1, 1, 1, 1,
0.3623364, -0.1397578, 0.3372689, 1, 1, 1, 1, 1,
0.3633114, -0.6391617, 2.914715, 1, 1, 1, 1, 1,
0.3638656, 0.3251836, 1.520913, 0, 0, 1, 1, 1,
0.3680356, -0.1466646, 1.11957, 1, 0, 0, 1, 1,
0.3780487, -2.286472, 2.871003, 1, 0, 0, 1, 1,
0.3783414, 0.09217252, 0.8870726, 1, 0, 0, 1, 1,
0.3863417, -1.152149, 2.457701, 1, 0, 0, 1, 1,
0.3946248, -0.03799146, 2.507957, 1, 0, 0, 1, 1,
0.3977926, 0.6118625, -0.368147, 0, 0, 0, 1, 1,
0.3980362, 0.6244677, 0.8794442, 0, 0, 0, 1, 1,
0.4009526, -0.1456167, 3.748312, 0, 0, 0, 1, 1,
0.4025266, 0.8123652, 1.150184, 0, 0, 0, 1, 1,
0.4032262, -0.6647479, 2.236859, 0, 0, 0, 1, 1,
0.4061524, -0.8564208, 2.641616, 0, 0, 0, 1, 1,
0.4064347, -0.0405454, 1.390145, 0, 0, 0, 1, 1,
0.4212938, -0.9106561, 2.012373, 1, 1, 1, 1, 1,
0.4214166, -0.436905, 3.685376, 1, 1, 1, 1, 1,
0.4269929, 1.09288, 1.311107, 1, 1, 1, 1, 1,
0.4278082, 0.2716052, 0.9577976, 1, 1, 1, 1, 1,
0.4300978, -0.3730613, 3.355229, 1, 1, 1, 1, 1,
0.4377688, 0.379051, 2.998994, 1, 1, 1, 1, 1,
0.4403682, -1.605361, 3.25625, 1, 1, 1, 1, 1,
0.4418116, 0.3366206, 0.7277983, 1, 1, 1, 1, 1,
0.4428735, -0.2205352, 2.09876, 1, 1, 1, 1, 1,
0.4444692, 1.144599, 0.8254331, 1, 1, 1, 1, 1,
0.4522051, 1.045151, -0.5567406, 1, 1, 1, 1, 1,
0.4530587, -1.847525, 3.714483, 1, 1, 1, 1, 1,
0.4535927, 0.05294102, 1.229432, 1, 1, 1, 1, 1,
0.455275, 0.9460383, 0.1474248, 1, 1, 1, 1, 1,
0.4554552, 0.4792953, -0.215045, 1, 1, 1, 1, 1,
0.4599382, -0.6262638, 0.9025977, 0, 0, 1, 1, 1,
0.4621032, -0.970052, 1.841248, 1, 0, 0, 1, 1,
0.4624955, -0.03848682, 1.49624, 1, 0, 0, 1, 1,
0.4672663, 0.5535182, -0.5079711, 1, 0, 0, 1, 1,
0.4680359, -0.9841728, 3.528689, 1, 0, 0, 1, 1,
0.4764777, 1.761172, -0.08843379, 1, 0, 0, 1, 1,
0.4846336, -0.8570958, 2.895126, 0, 0, 0, 1, 1,
0.4858491, -1.11284, 3.381418, 0, 0, 0, 1, 1,
0.4907835, 0.4404503, 1.095706, 0, 0, 0, 1, 1,
0.4926357, 1.355607, -0.9516028, 0, 0, 0, 1, 1,
0.4927829, -0.3605208, 4.680438, 0, 0, 0, 1, 1,
0.4941152, -0.8375192, 2.357886, 0, 0, 0, 1, 1,
0.4980975, 0.6565977, 1.684115, 0, 0, 0, 1, 1,
0.5002837, 0.6868523, 0.7488557, 1, 1, 1, 1, 1,
0.5055962, 1.314072, -0.1995877, 1, 1, 1, 1, 1,
0.5068389, -1.750101, 1.584282, 1, 1, 1, 1, 1,
0.5094864, -1.507969, 2.442852, 1, 1, 1, 1, 1,
0.5095441, 0.4798257, -0.1172492, 1, 1, 1, 1, 1,
0.5128814, 0.4006423, 1.615054, 1, 1, 1, 1, 1,
0.5253416, -0.01736597, 0.3832851, 1, 1, 1, 1, 1,
0.5267438, 1.130643, 0.9051096, 1, 1, 1, 1, 1,
0.5282509, -0.685914, 1.7147, 1, 1, 1, 1, 1,
0.5283786, -0.3497808, 3.304134, 1, 1, 1, 1, 1,
0.5298744, -1.268473, 2.247806, 1, 1, 1, 1, 1,
0.5325688, -0.4586827, 3.40794, 1, 1, 1, 1, 1,
0.5436859, -0.6145741, 2.115986, 1, 1, 1, 1, 1,
0.5442087, -1.439851, 3.316918, 1, 1, 1, 1, 1,
0.5490807, 0.8919777, 3.367353, 1, 1, 1, 1, 1,
0.550938, 0.04933525, 2.152579, 0, 0, 1, 1, 1,
0.5556632, 0.3550456, 1.121739, 1, 0, 0, 1, 1,
0.5567951, 0.4589657, -0.3449086, 1, 0, 0, 1, 1,
0.5609666, 0.646024, 2.06722, 1, 0, 0, 1, 1,
0.5610822, 0.8170586, 0.746599, 1, 0, 0, 1, 1,
0.5621792, 1.547185, 0.04298126, 1, 0, 0, 1, 1,
0.563821, 0.7372215, 1.445964, 0, 0, 0, 1, 1,
0.5699825, 0.06023593, 1.920746, 0, 0, 0, 1, 1,
0.5719492, 0.04028569, 1.155792, 0, 0, 0, 1, 1,
0.5722, 0.547609, 0.02351593, 0, 0, 0, 1, 1,
0.575582, 0.8595845, 1.148737, 0, 0, 0, 1, 1,
0.5850134, -1.461094, 2.843936, 0, 0, 0, 1, 1,
0.5855418, -0.03498405, 0.8859233, 0, 0, 0, 1, 1,
0.585988, -0.3857262, -0.04908242, 1, 1, 1, 1, 1,
0.5894604, 1.27501, -0.2199197, 1, 1, 1, 1, 1,
0.5910453, -0.5371267, 0.3789697, 1, 1, 1, 1, 1,
0.5913941, 0.3177403, 1.702892, 1, 1, 1, 1, 1,
0.6041399, -1.781161, 2.599526, 1, 1, 1, 1, 1,
0.6051102, -0.2705727, 2.91147, 1, 1, 1, 1, 1,
0.6069134, -1.166514, 4.313915, 1, 1, 1, 1, 1,
0.6085354, -0.9143185, 1.773929, 1, 1, 1, 1, 1,
0.6095386, -2.486046, 2.471017, 1, 1, 1, 1, 1,
0.6134331, -1.072292, 3.036848, 1, 1, 1, 1, 1,
0.6144261, 0.8576403, -0.04052102, 1, 1, 1, 1, 1,
0.6214678, 0.8715212, 0.9710785, 1, 1, 1, 1, 1,
0.6216259, -0.3194555, 1.736477, 1, 1, 1, 1, 1,
0.6219484, -0.8635646, 4.519879, 1, 1, 1, 1, 1,
0.6229979, -0.8130236, 1.523904, 1, 1, 1, 1, 1,
0.6284905, 0.4360589, 1.42049, 0, 0, 1, 1, 1,
0.6312426, 0.1186971, 2.341481, 1, 0, 0, 1, 1,
0.6405291, 0.7376062, 2.081242, 1, 0, 0, 1, 1,
0.641952, 1.435051, 1.83484, 1, 0, 0, 1, 1,
0.6422054, -0.8010356, 3.194362, 1, 0, 0, 1, 1,
0.6423824, 0.2812907, 1.715685, 1, 0, 0, 1, 1,
0.6449369, 0.6013138, 0.8534107, 0, 0, 0, 1, 1,
0.6500299, 0.2716746, 1.690332, 0, 0, 0, 1, 1,
0.6510763, 1.324229, -0.1807548, 0, 0, 0, 1, 1,
0.6531685, 0.05972943, 1.018252, 0, 0, 0, 1, 1,
0.6532186, 0.5128619, -0.1276146, 0, 0, 0, 1, 1,
0.6566107, 0.2511157, 1.950055, 0, 0, 0, 1, 1,
0.6574469, 0.5933819, 1.952307, 0, 0, 0, 1, 1,
0.6594646, 0.8418925, -0.4437667, 1, 1, 1, 1, 1,
0.6645017, 1.217291, -0.11346, 1, 1, 1, 1, 1,
0.6750192, 0.05358505, 1.241626, 1, 1, 1, 1, 1,
0.6753594, 0.7887391, 0.963519, 1, 1, 1, 1, 1,
0.6775974, 1.289388, 0.9992172, 1, 1, 1, 1, 1,
0.6810093, 1.092579, 0.07244954, 1, 1, 1, 1, 1,
0.6892875, 1.358255, 2.416385, 1, 1, 1, 1, 1,
0.6927011, -0.4660544, 2.260982, 1, 1, 1, 1, 1,
0.6934854, -0.6637872, 3.274027, 1, 1, 1, 1, 1,
0.6966572, 0.1738014, 1.323839, 1, 1, 1, 1, 1,
0.6983212, 1.568579, -0.3328142, 1, 1, 1, 1, 1,
0.7047669, -1.889735, 3.678705, 1, 1, 1, 1, 1,
0.7052879, 1.127373, 0.3835555, 1, 1, 1, 1, 1,
0.7145256, 0.6132838, 0.8557836, 1, 1, 1, 1, 1,
0.7182879, -2.143391, 2.851414, 1, 1, 1, 1, 1,
0.7192942, -0.8780429, 1.953782, 0, 0, 1, 1, 1,
0.7220956, -2.091136, 4.315668, 1, 0, 0, 1, 1,
0.7276594, 1.356205, 1.32049, 1, 0, 0, 1, 1,
0.7336176, 0.0922152, 1.012579, 1, 0, 0, 1, 1,
0.736028, 1.01215, 0.5108789, 1, 0, 0, 1, 1,
0.7376831, 0.4938853, 1.381752, 1, 0, 0, 1, 1,
0.7377615, -0.1244353, 4.136011, 0, 0, 0, 1, 1,
0.7423348, 1.244518, 1.039208, 0, 0, 0, 1, 1,
0.7443377, 0.185624, 2.049425, 0, 0, 0, 1, 1,
0.7452237, 0.3055707, 1.783134, 0, 0, 0, 1, 1,
0.7563418, -0.2517099, 2.359062, 0, 0, 0, 1, 1,
0.7609997, 0.507247, 1.806946, 0, 0, 0, 1, 1,
0.7619581, 1.024111, 0.2332458, 0, 0, 0, 1, 1,
0.7628214, -0.6686203, 1.869069, 1, 1, 1, 1, 1,
0.7717003, -1.415194, 2.63159, 1, 1, 1, 1, 1,
0.7745816, -0.7878304, 0.8797895, 1, 1, 1, 1, 1,
0.7746345, -0.08079902, 0.6596073, 1, 1, 1, 1, 1,
0.7806966, 2.134708, 0.4661598, 1, 1, 1, 1, 1,
0.7834569, -1.400142, 2.844757, 1, 1, 1, 1, 1,
0.785383, -0.7644467, 3.232801, 1, 1, 1, 1, 1,
0.7883582, -0.4156286, 0.1014224, 1, 1, 1, 1, 1,
0.7890285, -1.161463, 1.69598, 1, 1, 1, 1, 1,
0.7900686, -0.8184027, 2.654523, 1, 1, 1, 1, 1,
0.795673, -0.8472239, 2.895197, 1, 1, 1, 1, 1,
0.8009287, 0.6646243, -0.2965983, 1, 1, 1, 1, 1,
0.8032972, -1.599663, 1.813439, 1, 1, 1, 1, 1,
0.8033158, -1.137824, 0.7970096, 1, 1, 1, 1, 1,
0.8122929, -0.4612998, 0.4022078, 1, 1, 1, 1, 1,
0.816841, 0.5512573, -0.07998911, 0, 0, 1, 1, 1,
0.8210407, -1.378739, 1.792602, 1, 0, 0, 1, 1,
0.8239983, -1.226306, 2.052727, 1, 0, 0, 1, 1,
0.8288741, -0.8394212, 1.936883, 1, 0, 0, 1, 1,
0.8317096, -0.8324819, 2.693965, 1, 0, 0, 1, 1,
0.8378683, 0.2994605, 0.3639246, 1, 0, 0, 1, 1,
0.8397284, -0.03739949, 1.502661, 0, 0, 0, 1, 1,
0.8415418, -0.4862002, 2.205786, 0, 0, 0, 1, 1,
0.8472235, -0.8040054, 1.729946, 0, 0, 0, 1, 1,
0.8510063, 0.9304186, -0.462595, 0, 0, 0, 1, 1,
0.8523483, -0.8730284, 1.861655, 0, 0, 0, 1, 1,
0.8539327, -1.319647, 3.621671, 0, 0, 0, 1, 1,
0.8572243, 1.797216, 1.571831, 0, 0, 0, 1, 1,
0.8576706, -0.3277226, 1.562828, 1, 1, 1, 1, 1,
0.8693323, 1.624763, -0.2182594, 1, 1, 1, 1, 1,
0.8694138, 0.6238273, -0.7032121, 1, 1, 1, 1, 1,
0.8729405, 0.3420933, 1.292515, 1, 1, 1, 1, 1,
0.8769522, -0.06216744, 1.892143, 1, 1, 1, 1, 1,
0.8780881, 0.01133865, 2.944763, 1, 1, 1, 1, 1,
0.8824083, -1.258099, 3.086254, 1, 1, 1, 1, 1,
0.8834381, 0.3634447, 0.4449907, 1, 1, 1, 1, 1,
0.8873705, -0.5438396, 1.161678, 1, 1, 1, 1, 1,
0.8921404, 0.05036262, 2.483811, 1, 1, 1, 1, 1,
0.8935749, -0.8338786, 1.741513, 1, 1, 1, 1, 1,
0.8988075, -0.5905128, 3.23699, 1, 1, 1, 1, 1,
0.899454, -0.08058249, 1.882157, 1, 1, 1, 1, 1,
0.9012784, -0.4645418, 0.8256508, 1, 1, 1, 1, 1,
0.9020425, -0.09479615, 0.6505322, 1, 1, 1, 1, 1,
0.909378, -0.24595, 3.354811, 0, 0, 1, 1, 1,
0.9126915, -1.323459, 2.572604, 1, 0, 0, 1, 1,
0.9148703, 0.05473486, 2.710992, 1, 0, 0, 1, 1,
0.9158407, 0.8859571, 1.470597, 1, 0, 0, 1, 1,
0.9166399, -0.1007704, 2.435173, 1, 0, 0, 1, 1,
0.916909, -0.1353074, 1.333667, 1, 0, 0, 1, 1,
0.922641, -0.6997532, 2.924907, 0, 0, 0, 1, 1,
0.9233434, 0.6108104, 0.7331157, 0, 0, 0, 1, 1,
0.9289181, -0.7628781, 1.293184, 0, 0, 0, 1, 1,
0.9348794, -1.805346, 2.556617, 0, 0, 0, 1, 1,
0.939234, 0.5443233, 0.5153965, 0, 0, 0, 1, 1,
0.9408621, -0.5331987, 2.400903, 0, 0, 0, 1, 1,
0.9411745, -0.3962168, 2.14735, 0, 0, 0, 1, 1,
0.9537287, 0.3917537, 2.317481, 1, 1, 1, 1, 1,
0.9550438, 0.4268656, 1.326038, 1, 1, 1, 1, 1,
0.9691129, -0.5448079, 2.695505, 1, 1, 1, 1, 1,
0.9692597, -0.7865373, 0.6442384, 1, 1, 1, 1, 1,
0.9742611, -1.152854, 2.597291, 1, 1, 1, 1, 1,
0.9950341, 0.3558822, 3.206328, 1, 1, 1, 1, 1,
1.002127, -0.9209583, 2.706139, 1, 1, 1, 1, 1,
1.002889, -0.04434444, 2.131303, 1, 1, 1, 1, 1,
1.006032, 1.25241, 0.06411346, 1, 1, 1, 1, 1,
1.006392, 0.993659, 0.7944651, 1, 1, 1, 1, 1,
1.007073, -0.442973, 3.460391, 1, 1, 1, 1, 1,
1.01158, 1.992294, 0.4185545, 1, 1, 1, 1, 1,
1.012644, -0.3583538, 1.926643, 1, 1, 1, 1, 1,
1.014128, -1.628457, 2.247761, 1, 1, 1, 1, 1,
1.01454, 0.776361, 0.7313623, 1, 1, 1, 1, 1,
1.015317, -0.2559855, 0.9675424, 0, 0, 1, 1, 1,
1.024349, 1.162355, 0.4948035, 1, 0, 0, 1, 1,
1.024946, -1.223108, 3.420337, 1, 0, 0, 1, 1,
1.02754, -0.2630019, 1.203049, 1, 0, 0, 1, 1,
1.027855, -0.2306619, 2.23822, 1, 0, 0, 1, 1,
1.02906, -0.4899291, 2.957008, 1, 0, 0, 1, 1,
1.045701, 0.3574853, 1.766101, 0, 0, 0, 1, 1,
1.047134, 1.116811, 0.03840739, 0, 0, 0, 1, 1,
1.048499, 1.992514, -0.1300388, 0, 0, 0, 1, 1,
1.049453, 0.5418533, 0.2837086, 0, 0, 0, 1, 1,
1.050114, -1.263424, 2.246198, 0, 0, 0, 1, 1,
1.052723, 0.9743423, 1.029917, 0, 0, 0, 1, 1,
1.053373, 0.6348296, 1.626324, 0, 0, 0, 1, 1,
1.055091, -0.1502679, 1.337675, 1, 1, 1, 1, 1,
1.055196, -1.076765, 4.252578, 1, 1, 1, 1, 1,
1.055422, -0.5535249, 2.1014, 1, 1, 1, 1, 1,
1.059414, -0.04585362, 1.531524, 1, 1, 1, 1, 1,
1.065686, 0.01837159, 0.9359483, 1, 1, 1, 1, 1,
1.07006, -0.8491899, 1.908116, 1, 1, 1, 1, 1,
1.074009, -0.1059917, 2.060959, 1, 1, 1, 1, 1,
1.083526, 1.857413, -0.05034766, 1, 1, 1, 1, 1,
1.094688, -0.4532269, 2.777912, 1, 1, 1, 1, 1,
1.095995, -0.5431039, 1.293385, 1, 1, 1, 1, 1,
1.098468, 0.9007313, 2.045128, 1, 1, 1, 1, 1,
1.10958, -0.2015329, 1.853575, 1, 1, 1, 1, 1,
1.110333, -0.01789192, 2.564606, 1, 1, 1, 1, 1,
1.116399, -0.323504, 2.698834, 1, 1, 1, 1, 1,
1.117615, -0.03475589, 1.731935, 1, 1, 1, 1, 1,
1.124974, 0.08789034, 2.099681, 0, 0, 1, 1, 1,
1.130442, 3.076154, 1.126115, 1, 0, 0, 1, 1,
1.130478, -2.520495, 3.785002, 1, 0, 0, 1, 1,
1.138292, 0.3504498, 1.809282, 1, 0, 0, 1, 1,
1.142295, -1.627485, 4.381601, 1, 0, 0, 1, 1,
1.16317, 0.3042078, 1.428793, 1, 0, 0, 1, 1,
1.166289, -0.3263977, 0.8611519, 0, 0, 0, 1, 1,
1.17023, 0.2790434, 1.702695, 0, 0, 0, 1, 1,
1.177756, 0.3804408, 1.216124, 0, 0, 0, 1, 1,
1.177998, -0.2766563, 1.370144, 0, 0, 0, 1, 1,
1.179014, -0.3364263, 1.449043, 0, 0, 0, 1, 1,
1.179828, -2.033045, 3.396917, 0, 0, 0, 1, 1,
1.180332, 0.8494945, 1.697824, 0, 0, 0, 1, 1,
1.180984, 0.6729634, -0.3960909, 1, 1, 1, 1, 1,
1.182454, 0.5237027, 1.466374, 1, 1, 1, 1, 1,
1.182838, -1.166412, 1.637175, 1, 1, 1, 1, 1,
1.187529, 1.026552, 1.678732, 1, 1, 1, 1, 1,
1.192246, -0.008378149, 2.747427, 1, 1, 1, 1, 1,
1.196333, 0.3346663, -0.4715248, 1, 1, 1, 1, 1,
1.203353, 0.07713086, 1.305367, 1, 1, 1, 1, 1,
1.203524, 0.08044006, 1.753988, 1, 1, 1, 1, 1,
1.21091, -0.5050061, 1.289195, 1, 1, 1, 1, 1,
1.214543, 0.528066, 0.7664337, 1, 1, 1, 1, 1,
1.231866, 1.319605, -0.08342794, 1, 1, 1, 1, 1,
1.232936, -0.6136507, 3.042921, 1, 1, 1, 1, 1,
1.240308, -1.205452, 2.911314, 1, 1, 1, 1, 1,
1.246472, -1.112503, 3.292064, 1, 1, 1, 1, 1,
1.248153, 1.750517, 0.5893348, 1, 1, 1, 1, 1,
1.253198, 0.8792192, 1.137941, 0, 0, 1, 1, 1,
1.254823, 0.4889677, 0.699497, 1, 0, 0, 1, 1,
1.259539, -1.346763, 1.655614, 1, 0, 0, 1, 1,
1.268794, -0.1863988, 0.6577802, 1, 0, 0, 1, 1,
1.272099, 2.371038, 2.103187, 1, 0, 0, 1, 1,
1.272267, -0.3184231, 1.783511, 1, 0, 0, 1, 1,
1.274261, 0.3765388, 1.724784, 0, 0, 0, 1, 1,
1.290456, 0.6291766, 0.87308, 0, 0, 0, 1, 1,
1.295768, 1.510805, -0.1514539, 0, 0, 0, 1, 1,
1.300088, 0.05077609, 1.03935, 0, 0, 0, 1, 1,
1.302411, -0.7814403, 2.742858, 0, 0, 0, 1, 1,
1.312754, 0.4344526, 2.63067, 0, 0, 0, 1, 1,
1.314341, 1.577502, 0.1118068, 0, 0, 0, 1, 1,
1.316951, -1.052636, 1.774145, 1, 1, 1, 1, 1,
1.317551, 0.7934741, 1.382303, 1, 1, 1, 1, 1,
1.318831, 1.454671, 1.522041, 1, 1, 1, 1, 1,
1.325611, -0.6836664, 2.59975, 1, 1, 1, 1, 1,
1.332524, 1.034446, 0.9457267, 1, 1, 1, 1, 1,
1.339648, 0.1190631, 2.530824, 1, 1, 1, 1, 1,
1.343132, -0.7099419, 2.019356, 1, 1, 1, 1, 1,
1.348677, -0.2613967, 0.5127191, 1, 1, 1, 1, 1,
1.349228, -1.021382, -0.1390146, 1, 1, 1, 1, 1,
1.357305, 0.5041782, 1.117736, 1, 1, 1, 1, 1,
1.367999, 2.277599, -1.316925, 1, 1, 1, 1, 1,
1.369148, 0.9728942, 1.523419, 1, 1, 1, 1, 1,
1.382092, -1.18977, 1.870909, 1, 1, 1, 1, 1,
1.382203, 1.114744, 0.4837049, 1, 1, 1, 1, 1,
1.385553, 1.364199, 1.222361, 1, 1, 1, 1, 1,
1.386389, 0.5796067, 0.2783209, 0, 0, 1, 1, 1,
1.401832, 0.5440922, 2.331373, 1, 0, 0, 1, 1,
1.41108, 0.3266517, 2.986561, 1, 0, 0, 1, 1,
1.416097, -2.104913, 3.479676, 1, 0, 0, 1, 1,
1.43004, 0.1128099, 0.9658903, 1, 0, 0, 1, 1,
1.434195, 0.07514264, 2.169977, 1, 0, 0, 1, 1,
1.446274, -0.1423987, 4.450109, 0, 0, 0, 1, 1,
1.448798, -0.6741822, 2.71315, 0, 0, 0, 1, 1,
1.454369, -0.07267411, 2.237079, 0, 0, 0, 1, 1,
1.469087, 0.8467705, 2.633997, 0, 0, 0, 1, 1,
1.497401, 0.1214552, 2.152045, 0, 0, 0, 1, 1,
1.502039, -0.1958136, 3.55436, 0, 0, 0, 1, 1,
1.507458, -1.216451, 2.155795, 0, 0, 0, 1, 1,
1.521455, -1.661608, 3.729992, 1, 1, 1, 1, 1,
1.524476, 0.03835473, 1.056185, 1, 1, 1, 1, 1,
1.529703, 2.025753, 0.7994313, 1, 1, 1, 1, 1,
1.532244, 1.537645, 0.7121488, 1, 1, 1, 1, 1,
1.533287, 0.037466, 1.362354, 1, 1, 1, 1, 1,
1.538755, -2.05929, 3.812069, 1, 1, 1, 1, 1,
1.539431, -0.3656371, 2.276499, 1, 1, 1, 1, 1,
1.540993, -0.8340645, 2.481821, 1, 1, 1, 1, 1,
1.541579, 2.885125, 0.7790554, 1, 1, 1, 1, 1,
1.545766, 0.7301623, 2.691951, 1, 1, 1, 1, 1,
1.566454, -0.7085097, 1.569248, 1, 1, 1, 1, 1,
1.570065, 0.2532209, 1.690958, 1, 1, 1, 1, 1,
1.570136, -0.6186842, 1.542822, 1, 1, 1, 1, 1,
1.593017, -0.9763577, 2.911062, 1, 1, 1, 1, 1,
1.60321, -1.132987, 1.318672, 1, 1, 1, 1, 1,
1.624451, -0.001186714, 0.3912801, 0, 0, 1, 1, 1,
1.638165, -1.327443, 3.322904, 1, 0, 0, 1, 1,
1.676686, 0.2681295, 1.026267, 1, 0, 0, 1, 1,
1.695498, 0.3092184, 3.8702, 1, 0, 0, 1, 1,
1.698867, 1.449941, 1.222744, 1, 0, 0, 1, 1,
1.702591, -0.2070469, 2.344046, 1, 0, 0, 1, 1,
1.725151, 1.219197, 1.749783, 0, 0, 0, 1, 1,
1.732737, 0.7357752, 2.148205, 0, 0, 0, 1, 1,
1.748337, -0.4138297, 1.23575, 0, 0, 0, 1, 1,
1.764212, -0.2871892, 1.225084, 0, 0, 0, 1, 1,
1.767515, 0.6569432, 0.2381705, 0, 0, 0, 1, 1,
1.774636, -0.08409491, 2.714087, 0, 0, 0, 1, 1,
1.775306, 0.7478846, 0.4953448, 0, 0, 0, 1, 1,
1.776698, -0.1409366, 3.03772, 1, 1, 1, 1, 1,
1.79665, -1.477673, 2.874196, 1, 1, 1, 1, 1,
1.803686, 0.4839749, -1.348389, 1, 1, 1, 1, 1,
1.804628, 0.0562704, 2.509418, 1, 1, 1, 1, 1,
1.882522, 0.1389571, 2.210869, 1, 1, 1, 1, 1,
1.895338, 0.4072708, 0.7864837, 1, 1, 1, 1, 1,
1.913754, -0.9859891, 3.340014, 1, 1, 1, 1, 1,
1.917761, -1.571989, 2.153846, 1, 1, 1, 1, 1,
1.932273, -1.351607, 2.554967, 1, 1, 1, 1, 1,
1.94434, 0.5024198, -0.07013185, 1, 1, 1, 1, 1,
1.972469, -0.4277355, 0.7844423, 1, 1, 1, 1, 1,
1.976691, -1.439863, 2.595749, 1, 1, 1, 1, 1,
1.991397, 0.07108173, 3.280318, 1, 1, 1, 1, 1,
1.994867, 0.26605, 2.059824, 1, 1, 1, 1, 1,
1.995752, 0.4630007, 1.692852, 1, 1, 1, 1, 1,
2.066858, 1.007237, 2.971727, 0, 0, 1, 1, 1,
2.086807, 1.488287, 2.630482, 1, 0, 0, 1, 1,
2.114029, -0.4228729, 2.391039, 1, 0, 0, 1, 1,
2.11441, -1.104793, 4.008771, 1, 0, 0, 1, 1,
2.118218, 0.4365686, -1.582003, 1, 0, 0, 1, 1,
2.1193, 0.09851551, 1.79747, 1, 0, 0, 1, 1,
2.153856, -0.7447461, 3.469486, 0, 0, 0, 1, 1,
2.176968, 1.115756, 0.7802737, 0, 0, 0, 1, 1,
2.189488, 0.806174, 1.790088, 0, 0, 0, 1, 1,
2.271728, -0.3010492, 0.7580414, 0, 0, 0, 1, 1,
2.292653, -0.4561407, 3.324364, 0, 0, 0, 1, 1,
2.357739, 0.1644055, 2.416251, 0, 0, 0, 1, 1,
2.360445, -1.362498, 1.829444, 0, 0, 0, 1, 1,
2.449649, 0.6946139, 0.5472955, 1, 1, 1, 1, 1,
2.479097, -2.047009, 3.298086, 1, 1, 1, 1, 1,
2.637401, 2.465253, 2.051285, 1, 1, 1, 1, 1,
2.642855, -0.6771888, 1.433745, 1, 1, 1, 1, 1,
2.649287, 1.123364, 0.4403531, 1, 1, 1, 1, 1,
2.870479, 0.1253711, 1.550779, 1, 1, 1, 1, 1,
3.794641, 0.2379314, 3.225926, 1, 1, 1, 1, 1
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
var radius = 9.655973;
var distance = 33.91619;
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
mvMatrix.translate( -0.09071469, -0.2626715, -0.2049749 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.91619);
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