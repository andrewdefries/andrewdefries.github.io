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
-2.985337, 0.3913904, -3.967128, 1, 0, 0, 1,
-2.947706, 0.553323, -2.04002, 1, 0.007843138, 0, 1,
-2.66524, 1.318572, -0.7751081, 1, 0.01176471, 0, 1,
-2.624566, 0.5904306, -1.487879, 1, 0.01960784, 0, 1,
-2.589887, -0.01969518, -0.7928754, 1, 0.02352941, 0, 1,
-2.366288, -1.062705, -1.975466, 1, 0.03137255, 0, 1,
-2.350798, -0.3807858, -0.4782287, 1, 0.03529412, 0, 1,
-2.318635, -0.4823734, -1.470759, 1, 0.04313726, 0, 1,
-2.281902, 1.210992, -0.1649814, 1, 0.04705882, 0, 1,
-2.259992, -0.5974123, -2.475183, 1, 0.05490196, 0, 1,
-2.198922, 1.075692, -2.242789, 1, 0.05882353, 0, 1,
-2.195405, 0.3806219, -1.469333, 1, 0.06666667, 0, 1,
-2.169898, 1.07109, -1.104756, 1, 0.07058824, 0, 1,
-2.075502, -0.7707055, -1.717389, 1, 0.07843138, 0, 1,
-2.060369, 1.249113, -1.09615, 1, 0.08235294, 0, 1,
-2.054334, 0.6144739, -0.3617233, 1, 0.09019608, 0, 1,
-2.040413, -0.06536613, -1.75185, 1, 0.09411765, 0, 1,
-2.020294, 0.5264995, -1.994126, 1, 0.1019608, 0, 1,
-2.011398, 0.1919889, -1.938213, 1, 0.1098039, 0, 1,
-1.986782, -0.2173974, -1.76334, 1, 0.1137255, 0, 1,
-1.980511, 0.004355276, -2.786105, 1, 0.1215686, 0, 1,
-1.978438, 0.5369725, -2.184337, 1, 0.1254902, 0, 1,
-1.956681, -1.008892, -2.842188, 1, 0.1333333, 0, 1,
-1.947111, 0.1689664, -1.920276, 1, 0.1372549, 0, 1,
-1.930001, -1.216143, 0.5558211, 1, 0.145098, 0, 1,
-1.880483, -0.3853904, -2.168256, 1, 0.1490196, 0, 1,
-1.876331, 0.3287826, -2.080081, 1, 0.1568628, 0, 1,
-1.853633, -0.9293919, -2.235437, 1, 0.1607843, 0, 1,
-1.820958, 0.7495756, -1.911263, 1, 0.1686275, 0, 1,
-1.806547, 0.2147953, -2.26992, 1, 0.172549, 0, 1,
-1.789163, -0.1567778, -1.757444, 1, 0.1803922, 0, 1,
-1.787541, -0.4691811, -1.616827, 1, 0.1843137, 0, 1,
-1.783467, -0.8652174, -1.201691, 1, 0.1921569, 0, 1,
-1.779317, 0.5830122, -1.137106, 1, 0.1960784, 0, 1,
-1.756626, 0.9230708, -2.119851, 1, 0.2039216, 0, 1,
-1.747743, 0.6729929, -2.040768, 1, 0.2117647, 0, 1,
-1.732529, -0.5485998, -1.895708, 1, 0.2156863, 0, 1,
-1.716568, -0.06107609, -1.906744, 1, 0.2235294, 0, 1,
-1.715636, 1.543324, -0.3436081, 1, 0.227451, 0, 1,
-1.714439, -1.427156, -3.773353, 1, 0.2352941, 0, 1,
-1.708117, 0.8775111, -1.125322, 1, 0.2392157, 0, 1,
-1.698125, 1.80832, -0.278995, 1, 0.2470588, 0, 1,
-1.696368, 1.724652, 0.3046716, 1, 0.2509804, 0, 1,
-1.669162, -1.292801, -1.451538, 1, 0.2588235, 0, 1,
-1.667918, -1.760916, -2.742471, 1, 0.2627451, 0, 1,
-1.662744, 0.5568044, -1.19444, 1, 0.2705882, 0, 1,
-1.656601, -0.5846319, -3.808795, 1, 0.2745098, 0, 1,
-1.651934, 0.2473766, -1.852203, 1, 0.282353, 0, 1,
-1.642577, 0.8623644, -1.637731, 1, 0.2862745, 0, 1,
-1.639926, -1.448983, -2.383013, 1, 0.2941177, 0, 1,
-1.633076, 0.7640038, -0.4306155, 1, 0.3019608, 0, 1,
-1.621907, -0.9143077, -2.012161, 1, 0.3058824, 0, 1,
-1.601804, 0.238754, -3.000544, 1, 0.3137255, 0, 1,
-1.59713, 0.08935015, -0.2862864, 1, 0.3176471, 0, 1,
-1.593749, 0.4943092, -2.084365, 1, 0.3254902, 0, 1,
-1.593094, -0.258678, -3.137408, 1, 0.3294118, 0, 1,
-1.589128, -1.07731, -2.051462, 1, 0.3372549, 0, 1,
-1.581656, -0.7288426, -2.060848, 1, 0.3411765, 0, 1,
-1.576991, 0.3259592, 0.08007269, 1, 0.3490196, 0, 1,
-1.576958, 0.9502639, -0.1266624, 1, 0.3529412, 0, 1,
-1.572098, -0.134461, -2.079267, 1, 0.3607843, 0, 1,
-1.563337, 0.01926898, -0.03271799, 1, 0.3647059, 0, 1,
-1.555963, -0.3361971, -2.146473, 1, 0.372549, 0, 1,
-1.555296, 1.368346, -0.3161288, 1, 0.3764706, 0, 1,
-1.545326, -0.1961982, -2.562246, 1, 0.3843137, 0, 1,
-1.534573, -0.4121442, -1.744276, 1, 0.3882353, 0, 1,
-1.52383, 0.4429733, -2.611203, 1, 0.3960784, 0, 1,
-1.516623, 0.1233306, 0.04076112, 1, 0.4039216, 0, 1,
-1.514665, -0.2711942, -1.932221, 1, 0.4078431, 0, 1,
-1.505647, -0.2101135, 1.05443, 1, 0.4156863, 0, 1,
-1.495766, 0.3354316, -2.432608, 1, 0.4196078, 0, 1,
-1.481326, -1.653253, -1.955553, 1, 0.427451, 0, 1,
-1.473526, -1.124185, -2.447622, 1, 0.4313726, 0, 1,
-1.472886, -0.9548929, -1.136775, 1, 0.4392157, 0, 1,
-1.450641, 0.07070703, -1.702636, 1, 0.4431373, 0, 1,
-1.441857, 0.779052, -0.6133112, 1, 0.4509804, 0, 1,
-1.424355, -0.3929664, -1.514506, 1, 0.454902, 0, 1,
-1.420817, 0.9151831, -2.492762, 1, 0.4627451, 0, 1,
-1.407773, 0.5149605, 0.2604908, 1, 0.4666667, 0, 1,
-1.403072, -1.475764, -1.245442, 1, 0.4745098, 0, 1,
-1.397178, 0.8378723, -1.609799, 1, 0.4784314, 0, 1,
-1.396893, 0.1328354, -1.305332, 1, 0.4862745, 0, 1,
-1.393549, -0.9774898, -2.697843, 1, 0.4901961, 0, 1,
-1.386549, 1.761107, 1.214737, 1, 0.4980392, 0, 1,
-1.386212, -0.651765, -2.628527, 1, 0.5058824, 0, 1,
-1.385571, -0.5660451, -2.16706, 1, 0.509804, 0, 1,
-1.383935, 0.4928427, -1.246502, 1, 0.5176471, 0, 1,
-1.380852, 0.2262191, -2.930649, 1, 0.5215687, 0, 1,
-1.357263, -0.3095222, -2.875246, 1, 0.5294118, 0, 1,
-1.341913, -0.02785014, -2.367409, 1, 0.5333334, 0, 1,
-1.340229, 0.7397332, -0.7213643, 1, 0.5411765, 0, 1,
-1.337756, -0.04164973, 0.6937498, 1, 0.5450981, 0, 1,
-1.333329, -0.4463886, -2.435932, 1, 0.5529412, 0, 1,
-1.331793, 0.259358, -0.3806641, 1, 0.5568628, 0, 1,
-1.320242, 0.3370121, -2.610071, 1, 0.5647059, 0, 1,
-1.305499, 0.7309119, -0.9388666, 1, 0.5686275, 0, 1,
-1.302869, -0.390517, -2.018297, 1, 0.5764706, 0, 1,
-1.294002, -0.4524081, -1.487918, 1, 0.5803922, 0, 1,
-1.292647, 0.5504875, -0.02529023, 1, 0.5882353, 0, 1,
-1.285936, 1.231517, -1.371624, 1, 0.5921569, 0, 1,
-1.277027, 1.114293, -0.9355819, 1, 0.6, 0, 1,
-1.275307, 0.4211557, -2.68971, 1, 0.6078432, 0, 1,
-1.271206, 0.3368728, -1.617349, 1, 0.6117647, 0, 1,
-1.27011, -0.09756473, -0.4645852, 1, 0.6196079, 0, 1,
-1.267917, 2.79868, -1.261706, 1, 0.6235294, 0, 1,
-1.260528, 0.2438523, -1.149786, 1, 0.6313726, 0, 1,
-1.260344, 0.06437593, -1.615541, 1, 0.6352941, 0, 1,
-1.257675, -2.197915, -3.453513, 1, 0.6431373, 0, 1,
-1.248311, -0.6370453, -2.587209, 1, 0.6470588, 0, 1,
-1.245075, 0.3283992, -2.688635, 1, 0.654902, 0, 1,
-1.231277, -0.8654478, -2.606079, 1, 0.6588235, 0, 1,
-1.223508, 0.8958549, -0.2047568, 1, 0.6666667, 0, 1,
-1.222245, 2.286576, -1.06174, 1, 0.6705883, 0, 1,
-1.222198, -0.2869169, -2.721106, 1, 0.6784314, 0, 1,
-1.22188, 0.07300809, -2.960615, 1, 0.682353, 0, 1,
-1.221854, -0.5908056, -2.282367, 1, 0.6901961, 0, 1,
-1.214366, 2.270376, -1.350504, 1, 0.6941177, 0, 1,
-1.210827, -2.369272, -1.026705, 1, 0.7019608, 0, 1,
-1.203005, 1.299327, -0.2874065, 1, 0.7098039, 0, 1,
-1.200333, 0.3285401, 0.836311, 1, 0.7137255, 0, 1,
-1.199125, -1.799774, -2.468486, 1, 0.7215686, 0, 1,
-1.184995, -1.167776, -1.884489, 1, 0.7254902, 0, 1,
-1.179736, 0.4500557, -0.6476659, 1, 0.7333333, 0, 1,
-1.17902, 1.238901, -0.7268078, 1, 0.7372549, 0, 1,
-1.161476, 0.1885482, -2.044336, 1, 0.7450981, 0, 1,
-1.157363, -0.283823, -2.177286, 1, 0.7490196, 0, 1,
-1.154704, 0.2251786, -0.7154979, 1, 0.7568628, 0, 1,
-1.152044, 0.9682987, 0.9188229, 1, 0.7607843, 0, 1,
-1.150092, -2.154434, -2.524915, 1, 0.7686275, 0, 1,
-1.142573, 1.218351, -0.5382317, 1, 0.772549, 0, 1,
-1.142375, -0.9770278, -3.589056, 1, 0.7803922, 0, 1,
-1.134585, -0.5129619, -3.408467, 1, 0.7843137, 0, 1,
-1.133983, 0.3740029, -0.7302215, 1, 0.7921569, 0, 1,
-1.127691, -0.8328802, -2.435802, 1, 0.7960784, 0, 1,
-1.117244, 0.1118565, -2.118568, 1, 0.8039216, 0, 1,
-1.114555, -0.4518418, -2.630025, 1, 0.8117647, 0, 1,
-1.11211, 2.2712, 0.7665249, 1, 0.8156863, 0, 1,
-1.111147, 1.83307, -1.32643, 1, 0.8235294, 0, 1,
-1.108625, -0.1812264, -1.810791, 1, 0.827451, 0, 1,
-1.105912, -0.6131379, -2.509261, 1, 0.8352941, 0, 1,
-1.105174, -0.08000033, -1.011923, 1, 0.8392157, 0, 1,
-1.092501, -0.1428313, -1.551629, 1, 0.8470588, 0, 1,
-1.082427, 0.7133068, -1.415992, 1, 0.8509804, 0, 1,
-1.073102, -1.800253, -2.87847, 1, 0.8588235, 0, 1,
-1.070161, -0.002001624, -0.1045237, 1, 0.8627451, 0, 1,
-1.0695, 0.9728954, -1.54797, 1, 0.8705882, 0, 1,
-1.063995, -0.3836286, -1.251834, 1, 0.8745098, 0, 1,
-1.061715, -0.7358935, -3.79298, 1, 0.8823529, 0, 1,
-1.06067, 0.1624881, -0.4835739, 1, 0.8862745, 0, 1,
-1.054763, 1.129434, -1.121354, 1, 0.8941177, 0, 1,
-1.052334, 0.7443175, 0.214116, 1, 0.8980392, 0, 1,
-1.048886, 0.7569166, 0.2229885, 1, 0.9058824, 0, 1,
-1.045123, -0.5580539, -2.414382, 1, 0.9137255, 0, 1,
-1.038598, 0.8517701, -1.277722, 1, 0.9176471, 0, 1,
-1.026507, 0.8767192, -1.569908, 1, 0.9254902, 0, 1,
-1.024026, 1.021334, -1.639155, 1, 0.9294118, 0, 1,
-1.018145, 0.1186787, -1.421097, 1, 0.9372549, 0, 1,
-1.015316, 1.259918, 1.892097, 1, 0.9411765, 0, 1,
-1.00622, -1.430856, -1.390977, 1, 0.9490196, 0, 1,
-0.9922134, -0.148372, -1.473787, 1, 0.9529412, 0, 1,
-0.9905328, 1.796352, -0.7553263, 1, 0.9607843, 0, 1,
-0.990442, 0.8428812, -0.5622535, 1, 0.9647059, 0, 1,
-0.9873279, 0.7186496, -0.5236385, 1, 0.972549, 0, 1,
-0.9847889, 0.629083, -0.8895973, 1, 0.9764706, 0, 1,
-0.9820041, 0.5763928, -2.123836, 1, 0.9843137, 0, 1,
-0.9780197, -0.119368, -0.5468091, 1, 0.9882353, 0, 1,
-0.9715731, -0.3293012, -2.125303, 1, 0.9960784, 0, 1,
-0.9684936, -0.4013697, -0.6076122, 0.9960784, 1, 0, 1,
-0.9683949, 0.6073605, -1.992127, 0.9921569, 1, 0, 1,
-0.9576038, -0.342714, -0.07659934, 0.9843137, 1, 0, 1,
-0.9460301, -1.080466, -1.100718, 0.9803922, 1, 0, 1,
-0.9412543, 0.9239973, -0.3052202, 0.972549, 1, 0, 1,
-0.9410947, -0.1680737, -1.070989, 0.9686275, 1, 0, 1,
-0.9375627, -1.239217, -1.484865, 0.9607843, 1, 0, 1,
-0.9329417, -1.807383, -3.41381, 0.9568627, 1, 0, 1,
-0.9286953, -0.2400279, -0.3341867, 0.9490196, 1, 0, 1,
-0.9213249, -0.3962376, -1.823063, 0.945098, 1, 0, 1,
-0.9150764, -0.5857108, -3.535468, 0.9372549, 1, 0, 1,
-0.907981, 1.775623, -1.758773, 0.9333333, 1, 0, 1,
-0.9025528, -0.1954969, -1.358606, 0.9254902, 1, 0, 1,
-0.8950438, -0.4374559, -4.740399, 0.9215686, 1, 0, 1,
-0.8941454, 2.683375, -0.7458768, 0.9137255, 1, 0, 1,
-0.8852494, -1.590631, -1.922601, 0.9098039, 1, 0, 1,
-0.8821569, -0.1195396, -1.21407, 0.9019608, 1, 0, 1,
-0.8786652, 0.3308088, -0.5254074, 0.8941177, 1, 0, 1,
-0.8776451, -0.3775455, -0.9472534, 0.8901961, 1, 0, 1,
-0.8754362, 2.974555, -0.8138692, 0.8823529, 1, 0, 1,
-0.8687482, -0.4170928, -1.772054, 0.8784314, 1, 0, 1,
-0.8632602, -1.078456, -4.48149, 0.8705882, 1, 0, 1,
-0.8541979, -0.3369372, -4.055213, 0.8666667, 1, 0, 1,
-0.8538126, 0.6776001, -2.758067, 0.8588235, 1, 0, 1,
-0.8496956, 0.9149573, -1.641308, 0.854902, 1, 0, 1,
-0.8473554, -0.249613, -0.9470339, 0.8470588, 1, 0, 1,
-0.8442825, 0.02983346, -0.9390888, 0.8431373, 1, 0, 1,
-0.8439111, 0.6939106, 0.3474712, 0.8352941, 1, 0, 1,
-0.8422254, -1.862561, -0.9280547, 0.8313726, 1, 0, 1,
-0.8297416, -0.8296793, -1.808805, 0.8235294, 1, 0, 1,
-0.8251275, 0.934702, 1.48747, 0.8196079, 1, 0, 1,
-0.822762, 0.02381436, -0.8839794, 0.8117647, 1, 0, 1,
-0.8214103, 1.028527, -2.031133, 0.8078431, 1, 0, 1,
-0.8124912, -1.295934, -2.506833, 0.8, 1, 0, 1,
-0.8080862, 0.452509, -1.032394, 0.7921569, 1, 0, 1,
-0.8045372, 0.9780886, -0.3819157, 0.7882353, 1, 0, 1,
-0.802601, -2.424544, -4.185356, 0.7803922, 1, 0, 1,
-0.7979757, 1.388156, -1.622496, 0.7764706, 1, 0, 1,
-0.7970104, -1.333964, -0.9741222, 0.7686275, 1, 0, 1,
-0.7944256, 0.07357458, -0.5744145, 0.7647059, 1, 0, 1,
-0.7869219, -1.025474, -2.280174, 0.7568628, 1, 0, 1,
-0.7777098, -0.1716987, -2.381967, 0.7529412, 1, 0, 1,
-0.7763048, 1.260139, -2.430689, 0.7450981, 1, 0, 1,
-0.7734109, -0.1583157, -1.588834, 0.7411765, 1, 0, 1,
-0.7708485, 1.578273, 1.116764, 0.7333333, 1, 0, 1,
-0.768524, 0.3290541, -1.247414, 0.7294118, 1, 0, 1,
-0.7615316, 0.0566189, -1.241866, 0.7215686, 1, 0, 1,
-0.7538228, -1.119719, -2.142803, 0.7176471, 1, 0, 1,
-0.7500958, -0.08017766, -2.038013, 0.7098039, 1, 0, 1,
-0.7460005, -0.4864808, -1.950345, 0.7058824, 1, 0, 1,
-0.7414287, 0.7289435, 0.2123235, 0.6980392, 1, 0, 1,
-0.7403813, -1.247215, -3.108128, 0.6901961, 1, 0, 1,
-0.737835, -1.481019, -0.9992471, 0.6862745, 1, 0, 1,
-0.7343783, 1.016692, -0.7430661, 0.6784314, 1, 0, 1,
-0.7333147, -0.01588087, -1.847315, 0.6745098, 1, 0, 1,
-0.7283542, -0.1378841, -0.1452487, 0.6666667, 1, 0, 1,
-0.7259285, -0.7310354, -2.776273, 0.6627451, 1, 0, 1,
-0.7226107, -1.164044, -3.551134, 0.654902, 1, 0, 1,
-0.713931, 0.2454886, -2.313693, 0.6509804, 1, 0, 1,
-0.7123914, 0.5830409, -0.4103434, 0.6431373, 1, 0, 1,
-0.7078336, 0.1887954, -1.226252, 0.6392157, 1, 0, 1,
-0.6938586, -0.6422319, -3.024248, 0.6313726, 1, 0, 1,
-0.6869158, 0.6340287, -1.384762, 0.627451, 1, 0, 1,
-0.6828943, -0.7698059, -0.8700747, 0.6196079, 1, 0, 1,
-0.6819548, -1.504058, -2.333652, 0.6156863, 1, 0, 1,
-0.6741885, -1.047126, -1.412365, 0.6078432, 1, 0, 1,
-0.673953, 1.175818, -0.2173521, 0.6039216, 1, 0, 1,
-0.6730468, -1.161395, -4.728203, 0.5960785, 1, 0, 1,
-0.6724001, -0.1583622, -2.129517, 0.5882353, 1, 0, 1,
-0.6686475, -1.687884, -2.983101, 0.5843138, 1, 0, 1,
-0.6623884, -0.5591688, -3.444371, 0.5764706, 1, 0, 1,
-0.6613329, 1.690695, 0.2917332, 0.572549, 1, 0, 1,
-0.6472701, 1.225428, 1.352651, 0.5647059, 1, 0, 1,
-0.6464838, -0.8846054, -3.76773, 0.5607843, 1, 0, 1,
-0.6464613, -1.060555, -3.994983, 0.5529412, 1, 0, 1,
-0.6412903, -0.8842971, -2.676109, 0.5490196, 1, 0, 1,
-0.639845, -0.1523753, -3.868267, 0.5411765, 1, 0, 1,
-0.6289853, -0.5310569, -1.802176, 0.5372549, 1, 0, 1,
-0.628931, 1.077616, 0.6797534, 0.5294118, 1, 0, 1,
-0.6283412, -1.012646, -1.458994, 0.5254902, 1, 0, 1,
-0.6271604, -0.02886176, -0.7569607, 0.5176471, 1, 0, 1,
-0.6232011, 0.846812, -1.187316, 0.5137255, 1, 0, 1,
-0.6209239, 0.374859, -1.15955, 0.5058824, 1, 0, 1,
-0.6204261, -0.08859359, -2.596981, 0.5019608, 1, 0, 1,
-0.620302, -1.443566, -2.881245, 0.4941176, 1, 0, 1,
-0.6180097, 0.6025577, -0.2073623, 0.4862745, 1, 0, 1,
-0.6168178, -0.7038414, -3.823332, 0.4823529, 1, 0, 1,
-0.6159844, -1.34669, -4.580758, 0.4745098, 1, 0, 1,
-0.6115214, 0.2417109, -2.902181, 0.4705882, 1, 0, 1,
-0.608672, 0.06145999, -4.086129, 0.4627451, 1, 0, 1,
-0.6054335, -1.025762, -2.864042, 0.4588235, 1, 0, 1,
-0.5996908, -0.8490598, -4.11671, 0.4509804, 1, 0, 1,
-0.5985901, 0.08337443, -0.7949361, 0.4470588, 1, 0, 1,
-0.5909783, 0.2722558, -1.255006, 0.4392157, 1, 0, 1,
-0.5884667, -0.0537954, -0.7985571, 0.4352941, 1, 0, 1,
-0.5881414, -0.9967399, -3.501708, 0.427451, 1, 0, 1,
-0.5863585, -0.02973498, 0.9734737, 0.4235294, 1, 0, 1,
-0.5796927, 0.6919136, -2.309528, 0.4156863, 1, 0, 1,
-0.575974, -0.2641869, -3.543834, 0.4117647, 1, 0, 1,
-0.5650051, -1.159197, -2.852721, 0.4039216, 1, 0, 1,
-0.5645037, 0.4538932, -1.299331, 0.3960784, 1, 0, 1,
-0.5638807, -0.2312386, -2.939126, 0.3921569, 1, 0, 1,
-0.5617487, 0.2365453, -1.325346, 0.3843137, 1, 0, 1,
-0.5612202, 0.6050443, -2.677084, 0.3803922, 1, 0, 1,
-0.5608361, -0.861286, -2.33815, 0.372549, 1, 0, 1,
-0.5607011, -0.1284092, -3.086914, 0.3686275, 1, 0, 1,
-0.5581969, 1.589239, 0.8032467, 0.3607843, 1, 0, 1,
-0.5560207, -0.04874948, -1.324861, 0.3568628, 1, 0, 1,
-0.5527533, -1.035512, -1.798092, 0.3490196, 1, 0, 1,
-0.5435418, 0.7708125, -1.201605, 0.345098, 1, 0, 1,
-0.5398404, 1.48788, 0.3093265, 0.3372549, 1, 0, 1,
-0.5308183, 0.3881737, 0.1573927, 0.3333333, 1, 0, 1,
-0.5297029, -0.3806061, -1.397849, 0.3254902, 1, 0, 1,
-0.5296204, 0.002617274, -1.297017, 0.3215686, 1, 0, 1,
-0.5282684, -1.028467, -2.12669, 0.3137255, 1, 0, 1,
-0.5245196, -0.7850763, -1.65416, 0.3098039, 1, 0, 1,
-0.5222319, 0.8586299, -1.406919, 0.3019608, 1, 0, 1,
-0.5219987, 1.825978, 0.5109105, 0.2941177, 1, 0, 1,
-0.5111861, 1.527926, 0.1809662, 0.2901961, 1, 0, 1,
-0.5105128, 0.4165168, -1.29724, 0.282353, 1, 0, 1,
-0.509702, 1.807956, -1.335986, 0.2784314, 1, 0, 1,
-0.5094025, -0.1480485, -1.01511, 0.2705882, 1, 0, 1,
-0.5086225, -1.070005, -1.200534, 0.2666667, 1, 0, 1,
-0.5068875, -0.09746838, -2.134443, 0.2588235, 1, 0, 1,
-0.5054325, -1.409582, -3.157798, 0.254902, 1, 0, 1,
-0.4994731, 0.703088, 1.172346, 0.2470588, 1, 0, 1,
-0.4994271, -1.679944, -3.619079, 0.2431373, 1, 0, 1,
-0.4992836, 1.09749, -0.6649533, 0.2352941, 1, 0, 1,
-0.4967917, -0.4272576, -2.802767, 0.2313726, 1, 0, 1,
-0.4929135, -1.094071, -3.986247, 0.2235294, 1, 0, 1,
-0.4852067, 0.987004, -1.450979, 0.2196078, 1, 0, 1,
-0.4800124, -0.5508509, -3.942379, 0.2117647, 1, 0, 1,
-0.4793884, 0.8352411, -0.1931252, 0.2078431, 1, 0, 1,
-0.4767041, 0.18332, -0.1471222, 0.2, 1, 0, 1,
-0.4719986, 0.5135505, -3.191341, 0.1921569, 1, 0, 1,
-0.4689353, -0.3250863, -2.771315, 0.1882353, 1, 0, 1,
-0.4671774, -0.405958, -2.309186, 0.1803922, 1, 0, 1,
-0.4661216, -1.390943, -3.497472, 0.1764706, 1, 0, 1,
-0.463758, 0.2674514, 0.2625326, 0.1686275, 1, 0, 1,
-0.4607524, 0.7125208, -2.713426, 0.1647059, 1, 0, 1,
-0.45896, -1.150511, -2.192146, 0.1568628, 1, 0, 1,
-0.4579328, -0.8493374, -1.384893, 0.1529412, 1, 0, 1,
-0.4570295, 1.541089, 0.08919208, 0.145098, 1, 0, 1,
-0.4547907, 0.3668652, -0.7402834, 0.1411765, 1, 0, 1,
-0.4451859, -1.326593, -1.807354, 0.1333333, 1, 0, 1,
-0.4426691, -0.5566396, -1.779312, 0.1294118, 1, 0, 1,
-0.4420494, 2.113095, -0.9774177, 0.1215686, 1, 0, 1,
-0.4392413, 1.020571, -0.6271416, 0.1176471, 1, 0, 1,
-0.4372041, 0.08515754, 0.4391467, 0.1098039, 1, 0, 1,
-0.4343452, -0.992821, -2.608238, 0.1058824, 1, 0, 1,
-0.4305383, -1.517148, -2.546326, 0.09803922, 1, 0, 1,
-0.425153, -0.382797, -2.318104, 0.09019608, 1, 0, 1,
-0.4221693, 0.2292293, -0.6274444, 0.08627451, 1, 0, 1,
-0.4210109, 1.387583, 0.8902471, 0.07843138, 1, 0, 1,
-0.4206077, -0.06662045, -2.685674, 0.07450981, 1, 0, 1,
-0.411012, 0.6263615, -0.8796291, 0.06666667, 1, 0, 1,
-0.4109924, -0.2340402, -3.5413, 0.0627451, 1, 0, 1,
-0.4079034, 1.154671, 0.5813493, 0.05490196, 1, 0, 1,
-0.4073874, -1.017322, -3.072038, 0.05098039, 1, 0, 1,
-0.4071461, -0.6689335, -2.223896, 0.04313726, 1, 0, 1,
-0.4024433, 0.3672921, 0.4548266, 0.03921569, 1, 0, 1,
-0.3999172, 0.1772232, -1.606072, 0.03137255, 1, 0, 1,
-0.3986445, -0.4207859, -2.381012, 0.02745098, 1, 0, 1,
-0.3957012, -2.272713, -3.582904, 0.01960784, 1, 0, 1,
-0.3950107, -2.745663, -1.751512, 0.01568628, 1, 0, 1,
-0.3890609, 0.7033653, -0.5721509, 0.007843138, 1, 0, 1,
-0.3887966, -1.166927, -1.348715, 0.003921569, 1, 0, 1,
-0.3883138, -1.007921, -2.60585, 0, 1, 0.003921569, 1,
-0.3857445, -0.1864588, -2.990322, 0, 1, 0.01176471, 1,
-0.3844912, -1.329329, -2.612608, 0, 1, 0.01568628, 1,
-0.3835508, -2.130779, -1.688703, 0, 1, 0.02352941, 1,
-0.3832041, -0.07627559, -0.5090876, 0, 1, 0.02745098, 1,
-0.3817203, -0.03359979, 0.7202745, 0, 1, 0.03529412, 1,
-0.3817011, -0.3461152, -2.742106, 0, 1, 0.03921569, 1,
-0.3790407, 0.09182305, 0.01976992, 0, 1, 0.04705882, 1,
-0.37615, -0.6931265, -2.894417, 0, 1, 0.05098039, 1,
-0.3741258, -0.6267644, -2.379874, 0, 1, 0.05882353, 1,
-0.3715937, -0.0225342, -3.871423, 0, 1, 0.0627451, 1,
-0.3711663, -0.05158549, -1.621872, 0, 1, 0.07058824, 1,
-0.3638885, -0.2158997, -1.191331, 0, 1, 0.07450981, 1,
-0.3637315, 0.4785537, -0.1333568, 0, 1, 0.08235294, 1,
-0.3491994, -0.6837077, -0.550633, 0, 1, 0.08627451, 1,
-0.3470394, -1.697477, -3.155081, 0, 1, 0.09411765, 1,
-0.3462653, 1.492707, 1.468562, 0, 1, 0.1019608, 1,
-0.3460504, 0.9251284, 0.2523642, 0, 1, 0.1058824, 1,
-0.3458171, -1.670145, -3.703064, 0, 1, 0.1137255, 1,
-0.3457182, 1.246747, -0.3887278, 0, 1, 0.1176471, 1,
-0.345024, 0.1222149, 0.02244969, 0, 1, 0.1254902, 1,
-0.3259055, 0.9072086, -0.7438598, 0, 1, 0.1294118, 1,
-0.3257617, 0.9661012, -1.357308, 0, 1, 0.1372549, 1,
-0.3243471, -1.15665, -3.476893, 0, 1, 0.1411765, 1,
-0.3231874, 1.092796, 0.6920547, 0, 1, 0.1490196, 1,
-0.3219664, 1.398375, 0.3011214, 0, 1, 0.1529412, 1,
-0.3191764, 0.9992009, -1.003923, 0, 1, 0.1607843, 1,
-0.3164364, -0.3034714, -2.171859, 0, 1, 0.1647059, 1,
-0.3153351, -0.3303166, -3.3589, 0, 1, 0.172549, 1,
-0.3094766, 0.4454571, 1.18449, 0, 1, 0.1764706, 1,
-0.3090543, 0.08491857, -1.134825, 0, 1, 0.1843137, 1,
-0.3078165, -1.303213, -3.139868, 0, 1, 0.1882353, 1,
-0.3073754, 0.3728335, -1.837921, 0, 1, 0.1960784, 1,
-0.3014853, 0.4199263, -0.3196741, 0, 1, 0.2039216, 1,
-0.2944974, 0.7959905, 0.2002542, 0, 1, 0.2078431, 1,
-0.288096, 1.600334, 0.5365092, 0, 1, 0.2156863, 1,
-0.2847169, -0.6757506, -1.398547, 0, 1, 0.2196078, 1,
-0.2829939, -0.3961689, -2.775667, 0, 1, 0.227451, 1,
-0.2800908, -0.5718439, -2.300731, 0, 1, 0.2313726, 1,
-0.2742919, -0.5642098, -3.907323, 0, 1, 0.2392157, 1,
-0.2733518, 0.9946139, 0.1766886, 0, 1, 0.2431373, 1,
-0.2721529, -1.165357, -3.420772, 0, 1, 0.2509804, 1,
-0.2718534, 1.340363, -1.19374, 0, 1, 0.254902, 1,
-0.2698984, -1.06303, -2.219846, 0, 1, 0.2627451, 1,
-0.2691786, 0.2592583, 0.276592, 0, 1, 0.2666667, 1,
-0.2665344, -0.4328304, -2.937432, 0, 1, 0.2745098, 1,
-0.263864, 0.2884802, -0.8423159, 0, 1, 0.2784314, 1,
-0.2634032, 1.110718, -0.9572663, 0, 1, 0.2862745, 1,
-0.2633511, -0.3060115, -1.883104, 0, 1, 0.2901961, 1,
-0.2625281, -0.101184, -3.113156, 0, 1, 0.2980392, 1,
-0.2619303, 1.834992, 0.7244198, 0, 1, 0.3058824, 1,
-0.2580989, 1.071533, -0.5249667, 0, 1, 0.3098039, 1,
-0.2576677, 0.5331471, -0.06178718, 0, 1, 0.3176471, 1,
-0.253245, 0.9753113, 0.576565, 0, 1, 0.3215686, 1,
-0.2507438, -1.178918, -3.476412, 0, 1, 0.3294118, 1,
-0.2468745, -1.193106, -2.819841, 0, 1, 0.3333333, 1,
-0.2463894, -1.392232, -1.943134, 0, 1, 0.3411765, 1,
-0.2447817, -0.3437483, -2.163871, 0, 1, 0.345098, 1,
-0.2422769, -1.552768, -2.249557, 0, 1, 0.3529412, 1,
-0.2401619, -0.9807083, -2.894985, 0, 1, 0.3568628, 1,
-0.2395094, 0.7159883, 1.087517, 0, 1, 0.3647059, 1,
-0.2337143, -0.01045886, -1.560662, 0, 1, 0.3686275, 1,
-0.2309495, -0.9537383, -1.64244, 0, 1, 0.3764706, 1,
-0.2295101, 0.3511609, -0.8921351, 0, 1, 0.3803922, 1,
-0.2293269, 0.9965277, 0.9813277, 0, 1, 0.3882353, 1,
-0.2267806, -0.5218533, -3.91503, 0, 1, 0.3921569, 1,
-0.2231811, 0.04425494, -2.821939, 0, 1, 0.4, 1,
-0.2200394, 0.696296, 0.1386957, 0, 1, 0.4078431, 1,
-0.2187534, -0.6038135, -4.065543, 0, 1, 0.4117647, 1,
-0.2163848, 1.301345, -0.07287342, 0, 1, 0.4196078, 1,
-0.198229, 0.9925418, -0.3732087, 0, 1, 0.4235294, 1,
-0.1967193, -0.5791467, -1.90182, 0, 1, 0.4313726, 1,
-0.1945721, 0.157132, -0.1257072, 0, 1, 0.4352941, 1,
-0.1935163, 0.7646706, -0.9524254, 0, 1, 0.4431373, 1,
-0.1872169, 0.4928403, 0.3765463, 0, 1, 0.4470588, 1,
-0.1781104, -1.736466, -4.185877, 0, 1, 0.454902, 1,
-0.1763706, -0.3255685, -2.815698, 0, 1, 0.4588235, 1,
-0.1741032, 0.1836217, -1.535842, 0, 1, 0.4666667, 1,
-0.1720169, -0.3879228, -3.383414, 0, 1, 0.4705882, 1,
-0.1678957, -0.1400471, -2.153537, 0, 1, 0.4784314, 1,
-0.1663683, -0.1108906, -3.066735, 0, 1, 0.4823529, 1,
-0.1603928, -0.7843815, -4.279235, 0, 1, 0.4901961, 1,
-0.1585685, 0.2639338, -2.274661, 0, 1, 0.4941176, 1,
-0.1575072, -0.3531041, -3.938681, 0, 1, 0.5019608, 1,
-0.1486829, 0.7103364, -0.4089565, 0, 1, 0.509804, 1,
-0.1477983, 1.117698, 0.1060622, 0, 1, 0.5137255, 1,
-0.1448704, -0.6861618, -2.947304, 0, 1, 0.5215687, 1,
-0.1437861, -0.8465211, -2.26317, 0, 1, 0.5254902, 1,
-0.1413645, 0.5078158, 0.3939896, 0, 1, 0.5333334, 1,
-0.1404148, -0.8684669, -3.431961, 0, 1, 0.5372549, 1,
-0.1379722, 1.526655, 0.9833485, 0, 1, 0.5450981, 1,
-0.1368873, -0.8724222, -3.867379, 0, 1, 0.5490196, 1,
-0.1348703, -1.071441, -5.274486, 0, 1, 0.5568628, 1,
-0.1256127, 0.4576639, 0.1042905, 0, 1, 0.5607843, 1,
-0.1238354, -0.4179363, -4.524141, 0, 1, 0.5686275, 1,
-0.1232843, -1.389028, -3.455028, 0, 1, 0.572549, 1,
-0.1216422, -1.058447, -3.079825, 0, 1, 0.5803922, 1,
-0.1179575, 1.271504, 1.700387, 0, 1, 0.5843138, 1,
-0.1155256, -2.269382, -3.806217, 0, 1, 0.5921569, 1,
-0.1145052, -0.1587998, -3.692449, 0, 1, 0.5960785, 1,
-0.1061495, -0.3237431, -2.189587, 0, 1, 0.6039216, 1,
-0.1024934, 1.001897, -0.7485506, 0, 1, 0.6117647, 1,
-0.09577927, -1.309172, -2.968434, 0, 1, 0.6156863, 1,
-0.09172038, 0.4449994, 1.382963, 0, 1, 0.6235294, 1,
-0.09130093, 0.3132047, -1.12642, 0, 1, 0.627451, 1,
-0.0910146, -1.26072, -3.117408, 0, 1, 0.6352941, 1,
-0.08569612, -0.2303524, -1.922761, 0, 1, 0.6392157, 1,
-0.07867295, -1.578862, -2.785573, 0, 1, 0.6470588, 1,
-0.0776577, 0.05289475, -0.08769374, 0, 1, 0.6509804, 1,
-0.07504821, 0.51795, -0.5926785, 0, 1, 0.6588235, 1,
-0.06859457, -1.504391, -2.901799, 0, 1, 0.6627451, 1,
-0.06674521, -1.390069, -2.931172, 0, 1, 0.6705883, 1,
-0.06470153, 1.034336, -1.836298, 0, 1, 0.6745098, 1,
-0.06405231, -0.86439, -4.005147, 0, 1, 0.682353, 1,
-0.06329184, -0.5856979, -1.276657, 0, 1, 0.6862745, 1,
-0.06179395, 2.476699, -1.287551, 0, 1, 0.6941177, 1,
-0.06129735, -1.368657, -2.302849, 0, 1, 0.7019608, 1,
-0.05964743, 1.658427, -0.9837524, 0, 1, 0.7058824, 1,
-0.05253165, -1.831367, -2.972213, 0, 1, 0.7137255, 1,
-0.05159949, -0.4584064, -4.39272, 0, 1, 0.7176471, 1,
-0.05142466, 0.1369072, 0.2298348, 0, 1, 0.7254902, 1,
-0.04502535, 0.3334129, 0.0801487, 0, 1, 0.7294118, 1,
-0.04406078, -0.4099971, -3.099607, 0, 1, 0.7372549, 1,
-0.04328982, -0.4692193, -3.144521, 0, 1, 0.7411765, 1,
-0.0407274, 0.789809, 0.214248, 0, 1, 0.7490196, 1,
-0.03960895, -1.327279, -2.74615, 0, 1, 0.7529412, 1,
-0.0321266, 0.5499056, -0.7785859, 0, 1, 0.7607843, 1,
-0.03141259, 0.01935359, -1.294237, 0, 1, 0.7647059, 1,
-0.02961407, -1.97671, -3.729323, 0, 1, 0.772549, 1,
-0.02153369, -0.6576408, -1.897718, 0, 1, 0.7764706, 1,
-0.01318234, 0.8217441, 0.9051461, 0, 1, 0.7843137, 1,
-0.01056298, 0.2088807, -0.6274539, 0, 1, 0.7882353, 1,
-0.01038214, -0.7104843, -3.310437, 0, 1, 0.7960784, 1,
-0.007094329, -0.9126393, -3.682332, 0, 1, 0.8039216, 1,
-0.006180524, 1.136342, -0.7263407, 0, 1, 0.8078431, 1,
-0.006049349, 0.7048016, 1.781815, 0, 1, 0.8156863, 1,
-0.003958773, -0.7513473, -2.969676, 0, 1, 0.8196079, 1,
0.003953396, -1.077186, 3.802212, 0, 1, 0.827451, 1,
0.006055205, 0.2409368, 0.2164089, 0, 1, 0.8313726, 1,
0.008799922, -1.139868, 3.534518, 0, 1, 0.8392157, 1,
0.01103672, -0.4575222, 2.258571, 0, 1, 0.8431373, 1,
0.01414311, 0.68991, 1.375309, 0, 1, 0.8509804, 1,
0.01695434, -0.9561816, 2.585195, 0, 1, 0.854902, 1,
0.01747855, 0.2153918, -0.3484172, 0, 1, 0.8627451, 1,
0.01818589, -0.01179135, 1.954024, 0, 1, 0.8666667, 1,
0.02696143, 0.3057417, 0.1938969, 0, 1, 0.8745098, 1,
0.03176478, -0.1693118, 1.274506, 0, 1, 0.8784314, 1,
0.03457025, 0.8940344, 0.7095009, 0, 1, 0.8862745, 1,
0.03614066, -1.06739, 4.475335, 0, 1, 0.8901961, 1,
0.04142393, -0.2834479, 2.148388, 0, 1, 0.8980392, 1,
0.04410533, 1.428469, 0.5887277, 0, 1, 0.9058824, 1,
0.05110238, 0.4650812, -0.0316953, 0, 1, 0.9098039, 1,
0.05282238, -0.4985435, 2.639195, 0, 1, 0.9176471, 1,
0.05506278, 1.358279, -0.7479927, 0, 1, 0.9215686, 1,
0.06229521, 1.613774, 0.1611241, 0, 1, 0.9294118, 1,
0.06272165, -0.8603474, 3.589651, 0, 1, 0.9333333, 1,
0.06370468, -0.08240844, 0.3841298, 0, 1, 0.9411765, 1,
0.06413986, -0.5442247, 1.485753, 0, 1, 0.945098, 1,
0.06526375, -0.9491063, 3.801796, 0, 1, 0.9529412, 1,
0.07639614, -0.2365816, 3.717457, 0, 1, 0.9568627, 1,
0.08540745, 0.9164653, 0.2780278, 0, 1, 0.9647059, 1,
0.08582237, 0.7172461, 0.7830391, 0, 1, 0.9686275, 1,
0.08625442, 1.168069, -0.8614673, 0, 1, 0.9764706, 1,
0.08789178, 0.1619869, 1.004499, 0, 1, 0.9803922, 1,
0.08924162, 0.5984012, -0.9021435, 0, 1, 0.9882353, 1,
0.09219248, 0.1597559, 1.138957, 0, 1, 0.9921569, 1,
0.09431428, -1.596547, 4.269354, 0, 1, 1, 1,
0.09589377, 0.7816392, 0.9345981, 0, 0.9921569, 1, 1,
0.1011396, 0.1089719, 0.5000371, 0, 0.9882353, 1, 1,
0.1047946, 0.6714491, 0.2466637, 0, 0.9803922, 1, 1,
0.1054518, 0.8263146, 1.223541, 0, 0.9764706, 1, 1,
0.1085481, 2.395706, 0.04784958, 0, 0.9686275, 1, 1,
0.1091382, 0.04927655, 0.4758931, 0, 0.9647059, 1, 1,
0.1102918, -0.8476497, 3.357205, 0, 0.9568627, 1, 1,
0.1116342, 1.055778, 0.4645965, 0, 0.9529412, 1, 1,
0.1165848, -1.034739, 1.596306, 0, 0.945098, 1, 1,
0.1171217, 0.5822595, -0.4052103, 0, 0.9411765, 1, 1,
0.1187203, 2.255931, -0.8006332, 0, 0.9333333, 1, 1,
0.1202999, 0.2559438, 0.5308775, 0, 0.9294118, 1, 1,
0.1220132, -0.6023663, 1.268658, 0, 0.9215686, 1, 1,
0.1220778, 1.501346, 0.571644, 0, 0.9176471, 1, 1,
0.1248755, -2.268075, 1.75087, 0, 0.9098039, 1, 1,
0.1251235, -0.9897767, 3.507279, 0, 0.9058824, 1, 1,
0.1286519, 1.084335, 0.6367059, 0, 0.8980392, 1, 1,
0.1321334, 0.3635561, 1.45687, 0, 0.8901961, 1, 1,
0.1322404, -2.010249, 4.047725, 0, 0.8862745, 1, 1,
0.1325753, 0.03027625, -0.178526, 0, 0.8784314, 1, 1,
0.1329502, -1.700226, 4.091127, 0, 0.8745098, 1, 1,
0.1370717, 1.230126, 1.047362, 0, 0.8666667, 1, 1,
0.1405917, -0.6637523, 1.196734, 0, 0.8627451, 1, 1,
0.1435684, -0.9723889, 2.008155, 0, 0.854902, 1, 1,
0.1440865, 0.9174609, -0.005222621, 0, 0.8509804, 1, 1,
0.1449952, 1.435186, 1.743804, 0, 0.8431373, 1, 1,
0.1489211, 0.5400589, -0.01405581, 0, 0.8392157, 1, 1,
0.1529586, 1.275436, 1.667859, 0, 0.8313726, 1, 1,
0.1569687, -1.135381, 5.714378, 0, 0.827451, 1, 1,
0.1575378, 1.391088, -0.2377045, 0, 0.8196079, 1, 1,
0.1594514, -0.6491293, 2.339442, 0, 0.8156863, 1, 1,
0.160355, 0.8453256, 0.3683091, 0, 0.8078431, 1, 1,
0.1619989, 0.5493397, 1.389697, 0, 0.8039216, 1, 1,
0.1639345, 0.4284182, -0.2792519, 0, 0.7960784, 1, 1,
0.1662699, -2.14287, 2.009988, 0, 0.7882353, 1, 1,
0.1676164, -1.03397, 2.984512, 0, 0.7843137, 1, 1,
0.1694416, 1.602902, -0.5273882, 0, 0.7764706, 1, 1,
0.1710555, 0.09837551, 0.1038003, 0, 0.772549, 1, 1,
0.1712255, -0.6773424, 2.522932, 0, 0.7647059, 1, 1,
0.1716903, -0.9189987, 0.8299272, 0, 0.7607843, 1, 1,
0.1738666, 0.9780535, -0.009700655, 0, 0.7529412, 1, 1,
0.1832186, -0.5217907, 2.198755, 0, 0.7490196, 1, 1,
0.1853286, -1.816691, 1.595801, 0, 0.7411765, 1, 1,
0.1889456, 1.116812, -0.05843657, 0, 0.7372549, 1, 1,
0.1921342, 1.459409, 0.6730027, 0, 0.7294118, 1, 1,
0.1940314, -0.9963146, 3.280437, 0, 0.7254902, 1, 1,
0.1945728, 1.40247, 0.6968316, 0, 0.7176471, 1, 1,
0.1972012, 0.5231845, -1.16144, 0, 0.7137255, 1, 1,
0.1989266, -1.160201, 3.084431, 0, 0.7058824, 1, 1,
0.2007474, -0.5175985, 4.501437, 0, 0.6980392, 1, 1,
0.2011253, -0.5009228, 2.772768, 0, 0.6941177, 1, 1,
0.2011729, -1.950868, 3.082174, 0, 0.6862745, 1, 1,
0.2054469, -1.580142, 3.205256, 0, 0.682353, 1, 1,
0.2063217, -0.438508, 1.828289, 0, 0.6745098, 1, 1,
0.2093451, 0.5276831, 1.527194, 0, 0.6705883, 1, 1,
0.2122513, 1.384716, 2.178087, 0, 0.6627451, 1, 1,
0.2136796, 1.682043, 0.9025259, 0, 0.6588235, 1, 1,
0.2147724, -0.2636553, 4.228633, 0, 0.6509804, 1, 1,
0.2175702, 0.04874804, 1.903639, 0, 0.6470588, 1, 1,
0.2194685, 1.188206, 0.3634638, 0, 0.6392157, 1, 1,
0.2210429, 0.1502247, 0.6525941, 0, 0.6352941, 1, 1,
0.2214184, -0.7809092, 3.800527, 0, 0.627451, 1, 1,
0.2218402, -0.9153678, 3.349602, 0, 0.6235294, 1, 1,
0.2223587, -0.6455405, 1.900388, 0, 0.6156863, 1, 1,
0.2232103, 0.8565128, 0.3412002, 0, 0.6117647, 1, 1,
0.2272608, 1.580741, -1.215373, 0, 0.6039216, 1, 1,
0.2297639, -0.7275533, 1.726946, 0, 0.5960785, 1, 1,
0.2308224, 2.116668, -0.2664301, 0, 0.5921569, 1, 1,
0.235042, 1.358315, 1.414029, 0, 0.5843138, 1, 1,
0.2387712, 1.751786, -0.7173615, 0, 0.5803922, 1, 1,
0.2418826, 1.391489, -1.191378, 0, 0.572549, 1, 1,
0.2420289, 1.279678, 0.1188564, 0, 0.5686275, 1, 1,
0.2439, -0.3514031, 1.809197, 0, 0.5607843, 1, 1,
0.2462502, 1.220792, 0.8689595, 0, 0.5568628, 1, 1,
0.2469636, 1.260243, -1.325151, 0, 0.5490196, 1, 1,
0.2471548, 0.5604259, 1.29184, 0, 0.5450981, 1, 1,
0.2475923, 0.7286142, -0.765969, 0, 0.5372549, 1, 1,
0.2515945, -0.3310857, 2.433777, 0, 0.5333334, 1, 1,
0.254063, 0.04691134, 0.8175095, 0, 0.5254902, 1, 1,
0.2554757, -1.78023, 2.175566, 0, 0.5215687, 1, 1,
0.2560115, 0.03372483, 0.7192715, 0, 0.5137255, 1, 1,
0.2567265, -0.3596007, 3.245636, 0, 0.509804, 1, 1,
0.2580981, -0.8556966, 3.36744, 0, 0.5019608, 1, 1,
0.2774867, 0.4648366, 2.163154, 0, 0.4941176, 1, 1,
0.2791127, -0.4403532, 2.387503, 0, 0.4901961, 1, 1,
0.2800727, 0.2447815, 0.1510199, 0, 0.4823529, 1, 1,
0.2808361, 1.987075, -0.8134969, 0, 0.4784314, 1, 1,
0.2866323, -0.2178466, 2.489701, 0, 0.4705882, 1, 1,
0.2881317, 0.6767581, 0.5932047, 0, 0.4666667, 1, 1,
0.2883192, 1.032791, -0.4310144, 0, 0.4588235, 1, 1,
0.2885467, -0.6643814, 4.071124, 0, 0.454902, 1, 1,
0.2921417, -1.10522, 4.28944, 0, 0.4470588, 1, 1,
0.2969482, 0.4979362, 0.9534057, 0, 0.4431373, 1, 1,
0.2992114, -0.3958879, 4.814682, 0, 0.4352941, 1, 1,
0.29963, -1.883808, 2.909271, 0, 0.4313726, 1, 1,
0.3062784, 0.6279855, -0.2381092, 0, 0.4235294, 1, 1,
0.306316, -1.151309, 3.402643, 0, 0.4196078, 1, 1,
0.3068161, -1.181156, 2.381842, 0, 0.4117647, 1, 1,
0.3121264, -0.2470469, 3.629044, 0, 0.4078431, 1, 1,
0.3136322, -0.01386719, 1.229736, 0, 0.4, 1, 1,
0.3279722, 0.349627, -0.9674128, 0, 0.3921569, 1, 1,
0.330231, 1.158781, -0.4892955, 0, 0.3882353, 1, 1,
0.3307532, -0.3484626, 3.842769, 0, 0.3803922, 1, 1,
0.3307591, -1.679684, 3.387518, 0, 0.3764706, 1, 1,
0.3307787, 0.2043088, 1.466909, 0, 0.3686275, 1, 1,
0.334435, -0.03690548, 1.570225, 0, 0.3647059, 1, 1,
0.3348679, -0.1733924, 2.395871, 0, 0.3568628, 1, 1,
0.3378567, -0.6281729, 1.396462, 0, 0.3529412, 1, 1,
0.3379264, 1.993933, 2.459978, 0, 0.345098, 1, 1,
0.3458345, 1.319351, -0.4677462, 0, 0.3411765, 1, 1,
0.3515734, -0.9811507, 2.996723, 0, 0.3333333, 1, 1,
0.3525864, -1.484606, 3.497723, 0, 0.3294118, 1, 1,
0.3537308, -0.2368475, 3.209101, 0, 0.3215686, 1, 1,
0.3540344, -1.039932, 5.104904, 0, 0.3176471, 1, 1,
0.3612254, -0.3689615, 1.595606, 0, 0.3098039, 1, 1,
0.3620696, -0.335663, 1.171524, 0, 0.3058824, 1, 1,
0.3639909, 0.9498994, -1.105668, 0, 0.2980392, 1, 1,
0.3643369, 0.17595, 1.665566, 0, 0.2901961, 1, 1,
0.3666109, -0.1113555, 2.958333, 0, 0.2862745, 1, 1,
0.368391, -1.217006, 3.612578, 0, 0.2784314, 1, 1,
0.3687966, -0.7699862, 4.424326, 0, 0.2745098, 1, 1,
0.370252, -0.2866757, 2.877372, 0, 0.2666667, 1, 1,
0.3709596, -0.425979, 2.901758, 0, 0.2627451, 1, 1,
0.3715921, -1.557678, 3.92665, 0, 0.254902, 1, 1,
0.3734556, 0.9064566, 0.299871, 0, 0.2509804, 1, 1,
0.3750359, 0.3146651, 2.549142, 0, 0.2431373, 1, 1,
0.3764157, 0.09125865, 2.19808, 0, 0.2392157, 1, 1,
0.3820935, 0.4319908, 0.9253415, 0, 0.2313726, 1, 1,
0.3829565, 1.632975, -0.3661583, 0, 0.227451, 1, 1,
0.3836201, -1.036345, 2.027017, 0, 0.2196078, 1, 1,
0.3856098, -1.373733, 2.502366, 0, 0.2156863, 1, 1,
0.3885455, 0.04505565, 1.643453, 0, 0.2078431, 1, 1,
0.3911937, -0.08527949, 2.796515, 0, 0.2039216, 1, 1,
0.3931179, -0.3553774, 1.754526, 0, 0.1960784, 1, 1,
0.3981174, 2.198911, -1.823243, 0, 0.1882353, 1, 1,
0.3982003, -0.2877821, 3.488227, 0, 0.1843137, 1, 1,
0.4004185, -0.5216024, 2.225892, 0, 0.1764706, 1, 1,
0.4051751, 0.3831494, 0.3586883, 0, 0.172549, 1, 1,
0.4053724, -0.3072139, 1.802203, 0, 0.1647059, 1, 1,
0.4065771, -1.189461, 3.064593, 0, 0.1607843, 1, 1,
0.4073339, -1.05183, 2.415263, 0, 0.1529412, 1, 1,
0.4077644, -0.4498042, 3.342809, 0, 0.1490196, 1, 1,
0.4136254, -1.169119, 4.450314, 0, 0.1411765, 1, 1,
0.4170581, 0.612685, 0.01725013, 0, 0.1372549, 1, 1,
0.4172929, 1.442902, -0.9795691, 0, 0.1294118, 1, 1,
0.418032, -0.6082774, 1.788425, 0, 0.1254902, 1, 1,
0.4182692, 0.1501088, 1.104456, 0, 0.1176471, 1, 1,
0.4203359, -0.5514094, 3.909719, 0, 0.1137255, 1, 1,
0.4205427, 0.4597888, 0.3621024, 0, 0.1058824, 1, 1,
0.4225177, 0.0837821, 2.337906, 0, 0.09803922, 1, 1,
0.4239439, 0.7302799, 1.945703, 0, 0.09411765, 1, 1,
0.4314135, -0.185147, 0.8932439, 0, 0.08627451, 1, 1,
0.4315822, -0.7107647, 2.497122, 0, 0.08235294, 1, 1,
0.4322653, -1.946932, 5.855024, 0, 0.07450981, 1, 1,
0.4326146, -0.02323434, 0.2453748, 0, 0.07058824, 1, 1,
0.4380403, -0.8947785, 1.850393, 0, 0.0627451, 1, 1,
0.438235, -1.771433, 2.018768, 0, 0.05882353, 1, 1,
0.4436781, -0.02258613, 1.397114, 0, 0.05098039, 1, 1,
0.4448322, -0.7069919, 2.838971, 0, 0.04705882, 1, 1,
0.4473388, -0.7744173, 3.284881, 0, 0.03921569, 1, 1,
0.4531613, 1.733886, 0.7357351, 0, 0.03529412, 1, 1,
0.4542382, 1.634723, 0.4736914, 0, 0.02745098, 1, 1,
0.4582387, 1.345561, -0.2087648, 0, 0.02352941, 1, 1,
0.4588955, 1.549288, 0.4504082, 0, 0.01568628, 1, 1,
0.4608655, -0.5416968, 2.053244, 0, 0.01176471, 1, 1,
0.4611377, -0.3012968, 2.903351, 0, 0.003921569, 1, 1,
0.4613281, -1.009063, 1.826803, 0.003921569, 0, 1, 1,
0.4737024, -0.3436048, 1.293582, 0.007843138, 0, 1, 1,
0.4748312, 0.5738445, 1.880899, 0.01568628, 0, 1, 1,
0.4794076, 0.3778637, -1.699619, 0.01960784, 0, 1, 1,
0.487643, -0.09235847, 1.742409, 0.02745098, 0, 1, 1,
0.4924715, 0.03469366, 1.627408, 0.03137255, 0, 1, 1,
0.4929539, 2.02983, 0.9330982, 0.03921569, 0, 1, 1,
0.5004563, -0.2247644, 3.076596, 0.04313726, 0, 1, 1,
0.5014237, 0.2349866, 1.252353, 0.05098039, 0, 1, 1,
0.5051525, 0.113123, 0.0533317, 0.05490196, 0, 1, 1,
0.5071677, 0.7917252, 0.9240027, 0.0627451, 0, 1, 1,
0.5141093, -1.439339, 3.698309, 0.06666667, 0, 1, 1,
0.5171744, 1.158715, 0.423889, 0.07450981, 0, 1, 1,
0.5207998, -0.8646651, 2.854087, 0.07843138, 0, 1, 1,
0.5210871, -1.569037, 3.062213, 0.08627451, 0, 1, 1,
0.5216279, 0.1498745, 0.6177043, 0.09019608, 0, 1, 1,
0.5220286, 0.7802825, 0.3170432, 0.09803922, 0, 1, 1,
0.5313016, -1.23866, 2.909117, 0.1058824, 0, 1, 1,
0.5352362, -0.01166129, 0.3930176, 0.1098039, 0, 1, 1,
0.5364797, 0.2797248, -0.7624252, 0.1176471, 0, 1, 1,
0.536532, -0.8647586, 2.916098, 0.1215686, 0, 1, 1,
0.5367401, 0.3637848, 2.421196, 0.1294118, 0, 1, 1,
0.5441629, -2.239901, 3.678011, 0.1333333, 0, 1, 1,
0.545271, 0.1062753, 0.2817352, 0.1411765, 0, 1, 1,
0.5454654, -0.2280248, 2.198548, 0.145098, 0, 1, 1,
0.5477213, -0.04473168, 1.797557, 0.1529412, 0, 1, 1,
0.5519444, 1.376135, 0.6009527, 0.1568628, 0, 1, 1,
0.5548397, -1.518435, 1.640187, 0.1647059, 0, 1, 1,
0.5617856, -0.7412398, 2.39994, 0.1686275, 0, 1, 1,
0.5650901, -0.487089, 3.146532, 0.1764706, 0, 1, 1,
0.5667108, -0.2816408, 3.043804, 0.1803922, 0, 1, 1,
0.5688431, -2.032923, 3.706107, 0.1882353, 0, 1, 1,
0.571238, -0.2339674, 1.451998, 0.1921569, 0, 1, 1,
0.5719072, -0.5468348, 2.681808, 0.2, 0, 1, 1,
0.5751033, 1.078976, -0.8064678, 0.2078431, 0, 1, 1,
0.5789546, -0.04884718, 1.538371, 0.2117647, 0, 1, 1,
0.5831007, 1.776881, -0.3244971, 0.2196078, 0, 1, 1,
0.5865524, 0.9478338, 1.523461, 0.2235294, 0, 1, 1,
0.5927312, 0.4930451, 0.2065727, 0.2313726, 0, 1, 1,
0.5957923, -0.003218576, 3.041426, 0.2352941, 0, 1, 1,
0.5967478, -1.996738, 3.930522, 0.2431373, 0, 1, 1,
0.6073134, 0.1781096, 1.657165, 0.2470588, 0, 1, 1,
0.6075314, -0.7347488, 1.563261, 0.254902, 0, 1, 1,
0.6156539, 0.2839441, 1.619611, 0.2588235, 0, 1, 1,
0.6167833, -0.7411736, 1.274011, 0.2666667, 0, 1, 1,
0.6214059, 0.7127484, -0.7494098, 0.2705882, 0, 1, 1,
0.6244353, -0.5739517, 1.691353, 0.2784314, 0, 1, 1,
0.6246923, 0.7157195, 1.143345, 0.282353, 0, 1, 1,
0.6255857, -1.412695, 3.902125, 0.2901961, 0, 1, 1,
0.6259992, 0.6025001, 0.478833, 0.2941177, 0, 1, 1,
0.6278141, 0.7749066, 1.35693, 0.3019608, 0, 1, 1,
0.6296925, -0.6768944, 3.35124, 0.3098039, 0, 1, 1,
0.6333138, 0.619454, 0.8348505, 0.3137255, 0, 1, 1,
0.6373756, -1.137287, 1.818091, 0.3215686, 0, 1, 1,
0.6394129, 1.728845, 1.025289, 0.3254902, 0, 1, 1,
0.6456583, -0.1646029, 1.956769, 0.3333333, 0, 1, 1,
0.6485213, -1.52485, 1.854945, 0.3372549, 0, 1, 1,
0.6493677, -2.281304, 3.284791, 0.345098, 0, 1, 1,
0.6503804, -2.00402, 3.920631, 0.3490196, 0, 1, 1,
0.6540751, -0.8630688, 2.776102, 0.3568628, 0, 1, 1,
0.656856, -0.926116, 1.614132, 0.3607843, 0, 1, 1,
0.6576436, -0.7934822, 3.314395, 0.3686275, 0, 1, 1,
0.6578386, 1.004519, 1.144161, 0.372549, 0, 1, 1,
0.6598147, -1.386227, 2.962415, 0.3803922, 0, 1, 1,
0.6636142, 0.6980799, 1.525432, 0.3843137, 0, 1, 1,
0.6649526, -0.7330302, 1.548323, 0.3921569, 0, 1, 1,
0.6681613, -1.827396, 3.172798, 0.3960784, 0, 1, 1,
0.670386, -0.1690043, 1.959676, 0.4039216, 0, 1, 1,
0.6734626, -0.6799629, 2.661372, 0.4117647, 0, 1, 1,
0.6845622, -0.5984261, 1.67137, 0.4156863, 0, 1, 1,
0.6868786, 0.9176694, -1.651228, 0.4235294, 0, 1, 1,
0.6915427, -0.4147083, 2.179885, 0.427451, 0, 1, 1,
0.6941116, -0.1539277, 1.598648, 0.4352941, 0, 1, 1,
0.6965103, 1.462592, -0.6576559, 0.4392157, 0, 1, 1,
0.6966709, -0.216912, 1.194267, 0.4470588, 0, 1, 1,
0.7019048, -0.7945177, 0.8275022, 0.4509804, 0, 1, 1,
0.7065417, -0.3955528, 3.02319, 0.4588235, 0, 1, 1,
0.7072753, -0.3125986, 1.59292, 0.4627451, 0, 1, 1,
0.7109487, 0.7686082, -1.013186, 0.4705882, 0, 1, 1,
0.7140735, -0.626189, 0.9856616, 0.4745098, 0, 1, 1,
0.7148896, 0.6578506, 2.988933, 0.4823529, 0, 1, 1,
0.7216227, -2.187593, 2.711522, 0.4862745, 0, 1, 1,
0.7235221, 0.7993319, 1.062324, 0.4941176, 0, 1, 1,
0.7260031, -0.06035949, 1.526054, 0.5019608, 0, 1, 1,
0.7266921, 0.0938673, 1.890514, 0.5058824, 0, 1, 1,
0.7268722, 0.5631354, 2.205964, 0.5137255, 0, 1, 1,
0.7310171, -1.729017, 3.41386, 0.5176471, 0, 1, 1,
0.731386, -0.6537384, 3.509033, 0.5254902, 0, 1, 1,
0.7416064, -0.4584329, 2.360707, 0.5294118, 0, 1, 1,
0.7484993, 0.800091, 1.39616, 0.5372549, 0, 1, 1,
0.7514997, -1.079096, 3.213858, 0.5411765, 0, 1, 1,
0.7664201, 0.3940995, 0.9154338, 0.5490196, 0, 1, 1,
0.7683527, 0.002314531, 0.3074351, 0.5529412, 0, 1, 1,
0.7726519, 0.1007676, 2.095625, 0.5607843, 0, 1, 1,
0.7765827, -0.08389932, 1.564629, 0.5647059, 0, 1, 1,
0.7827556, -1.674556, 1.547338, 0.572549, 0, 1, 1,
0.7851172, 0.3928578, -1.032546, 0.5764706, 0, 1, 1,
0.7871595, 0.08626854, 1.743734, 0.5843138, 0, 1, 1,
0.7934887, 0.8504174, -0.3481485, 0.5882353, 0, 1, 1,
0.8038697, -0.4439905, 2.531497, 0.5960785, 0, 1, 1,
0.8044322, -0.8680062, 2.292353, 0.6039216, 0, 1, 1,
0.8062971, -1.781973, 2.626452, 0.6078432, 0, 1, 1,
0.814425, -0.311154, 1.821355, 0.6156863, 0, 1, 1,
0.8162465, 0.03415629, 1.275524, 0.6196079, 0, 1, 1,
0.8237234, 0.2339275, 1.551003, 0.627451, 0, 1, 1,
0.8245767, 0.8176116, 3.103183, 0.6313726, 0, 1, 1,
0.8279706, 0.451825, 0.6951247, 0.6392157, 0, 1, 1,
0.8333782, 0.5600033, 0.4507563, 0.6431373, 0, 1, 1,
0.8337414, -0.6028286, 0.05833917, 0.6509804, 0, 1, 1,
0.8342742, -0.1559708, 3.385437, 0.654902, 0, 1, 1,
0.8370994, 0.3648026, 1.719946, 0.6627451, 0, 1, 1,
0.8407173, 1.010526, 0.7236512, 0.6666667, 0, 1, 1,
0.8407977, 0.8216907, 0.9805952, 0.6745098, 0, 1, 1,
0.8424938, 2.596942, 0.8833146, 0.6784314, 0, 1, 1,
0.842975, -0.8925362, 2.093811, 0.6862745, 0, 1, 1,
0.8456249, 0.9905516, -0.4365499, 0.6901961, 0, 1, 1,
0.8465565, 0.975632, -1.175377, 0.6980392, 0, 1, 1,
0.8500096, 1.227503, 0.7079534, 0.7058824, 0, 1, 1,
0.8525812, 1.181979, 2.461704, 0.7098039, 0, 1, 1,
0.8566527, -0.5576476, 2.372115, 0.7176471, 0, 1, 1,
0.858931, 0.103662, -0.9865646, 0.7215686, 0, 1, 1,
0.8594905, -0.2404237, 2.191109, 0.7294118, 0, 1, 1,
0.8621443, -1.251113, 1.172876, 0.7333333, 0, 1, 1,
0.8710377, 0.5083127, 0.2843101, 0.7411765, 0, 1, 1,
0.874616, -0.09827311, 1.829387, 0.7450981, 0, 1, 1,
0.8787858, 1.022288, -0.5172232, 0.7529412, 0, 1, 1,
0.8807812, 0.4546035, 1.416031, 0.7568628, 0, 1, 1,
0.8818942, 0.6715299, 1.208763, 0.7647059, 0, 1, 1,
0.8854041, 0.1981187, 2.294016, 0.7686275, 0, 1, 1,
0.8914604, -0.3859569, 1.211725, 0.7764706, 0, 1, 1,
0.8926012, 1.024018, 0.7595643, 0.7803922, 0, 1, 1,
0.905158, -0.7917298, 3.30882, 0.7882353, 0, 1, 1,
0.9091867, -1.360933, 2.784598, 0.7921569, 0, 1, 1,
0.9103519, 0.0759755, 0.1105408, 0.8, 0, 1, 1,
0.9235584, 0.7405767, 2.258688, 0.8078431, 0, 1, 1,
0.9236575, 0.6445354, 0.7403682, 0.8117647, 0, 1, 1,
0.9285164, 0.06628409, 2.15901, 0.8196079, 0, 1, 1,
0.9304135, -1.521388, 2.635406, 0.8235294, 0, 1, 1,
0.9318401, 0.1314577, 1.534751, 0.8313726, 0, 1, 1,
0.933651, 1.727811, 0.6800442, 0.8352941, 0, 1, 1,
0.9342625, -0.1119897, 1.076014, 0.8431373, 0, 1, 1,
0.9357093, -0.5759538, 0.7461447, 0.8470588, 0, 1, 1,
0.9389401, -1.413623, 3.268245, 0.854902, 0, 1, 1,
0.939785, 0.1795336, 2.46203, 0.8588235, 0, 1, 1,
0.9420529, -1.317312, 1.558386, 0.8666667, 0, 1, 1,
0.9441503, -0.2917856, 1.887435, 0.8705882, 0, 1, 1,
0.9445862, 1.161153, -0.5911306, 0.8784314, 0, 1, 1,
0.947112, -0.06277107, 0.8894991, 0.8823529, 0, 1, 1,
0.9509419, -0.2148202, 1.818318, 0.8901961, 0, 1, 1,
0.9569677, 3.075408, 0.6696694, 0.8941177, 0, 1, 1,
0.9573027, 1.907871, 3.072369, 0.9019608, 0, 1, 1,
0.9596616, -0.5415824, 2.396736, 0.9098039, 0, 1, 1,
0.960009, -1.197431, 2.042183, 0.9137255, 0, 1, 1,
0.9611346, 1.22722, -1.223383, 0.9215686, 0, 1, 1,
0.9627588, -0.9688433, 1.983399, 0.9254902, 0, 1, 1,
0.9681602, -1.150314, 2.316543, 0.9333333, 0, 1, 1,
0.9694071, 0.4263341, 3.372277, 0.9372549, 0, 1, 1,
0.9786216, 0.1845623, 3.093091, 0.945098, 0, 1, 1,
0.9838178, -0.118052, 1.480258, 0.9490196, 0, 1, 1,
0.9845337, -0.9298211, 3.392948, 0.9568627, 0, 1, 1,
0.9922126, -1.227114, 3.282067, 0.9607843, 0, 1, 1,
0.9925023, 0.4225526, 1.259718, 0.9686275, 0, 1, 1,
0.9942806, 0.4117891, -0.4546325, 0.972549, 0, 1, 1,
0.9959813, 0.3872921, 0.9817376, 0.9803922, 0, 1, 1,
1.000652, -0.1248346, 3.072068, 0.9843137, 0, 1, 1,
1.004693, 0.268194, 1.211417, 0.9921569, 0, 1, 1,
1.008289, -0.4811062, 1.693856, 0.9960784, 0, 1, 1,
1.015776, 1.000107, 0.250206, 1, 0, 0.9960784, 1,
1.016794, -0.2246329, 2.857799, 1, 0, 0.9882353, 1,
1.018918, 0.3620186, 1.566431, 1, 0, 0.9843137, 1,
1.020921, 0.1517472, 2.19363, 1, 0, 0.9764706, 1,
1.027966, -2.24319, 4.057396, 1, 0, 0.972549, 1,
1.036639, 0.2144679, 2.789445, 1, 0, 0.9647059, 1,
1.041483, -0.06353857, 0.8513165, 1, 0, 0.9607843, 1,
1.044317, 0.2766166, 3.193012, 1, 0, 0.9529412, 1,
1.048363, -0.4116178, 1.210762, 1, 0, 0.9490196, 1,
1.049859, 0.05920525, 0.2882105, 1, 0, 0.9411765, 1,
1.050413, 0.4111242, 1.389046, 1, 0, 0.9372549, 1,
1.050655, 0.3651042, 3.09277, 1, 0, 0.9294118, 1,
1.062036, 0.9676899, -0.3859518, 1, 0, 0.9254902, 1,
1.065843, -1.407799, 2.730854, 1, 0, 0.9176471, 1,
1.07265, 0.795696, 2.328721, 1, 0, 0.9137255, 1,
1.072914, 0.3265916, 1.571675, 1, 0, 0.9058824, 1,
1.073819, 0.02206416, 2.074703, 1, 0, 0.9019608, 1,
1.082444, 0.4019903, 1.364344, 1, 0, 0.8941177, 1,
1.083143, -1.817791, 4.036232, 1, 0, 0.8862745, 1,
1.090435, -0.6461232, 2.598601, 1, 0, 0.8823529, 1,
1.097798, 0.1240797, 1.116653, 1, 0, 0.8745098, 1,
1.116462, -1.543015, 0.7540752, 1, 0, 0.8705882, 1,
1.118965, -0.2341121, 2.244791, 1, 0, 0.8627451, 1,
1.129794, 1.571129, -0.576593, 1, 0, 0.8588235, 1,
1.139203, -1.713682, 4.093863, 1, 0, 0.8509804, 1,
1.141432, 1.166626, 1.90135, 1, 0, 0.8470588, 1,
1.148443, 0.4858525, 2.852628, 1, 0, 0.8392157, 1,
1.153182, -2.084987, 2.22256, 1, 0, 0.8352941, 1,
1.156212, 0.08030632, 0.5413765, 1, 0, 0.827451, 1,
1.162452, -1.049937, 1.955713, 1, 0, 0.8235294, 1,
1.165125, -0.603661, 1.809469, 1, 0, 0.8156863, 1,
1.167794, -0.4971527, 1.305015, 1, 0, 0.8117647, 1,
1.180654, -0.587117, 0.6905063, 1, 0, 0.8039216, 1,
1.183109, 0.2403617, 1.162845, 1, 0, 0.7960784, 1,
1.191486, -0.1596588, 2.524732, 1, 0, 0.7921569, 1,
1.197439, 1.509264, 0.03867731, 1, 0, 0.7843137, 1,
1.198175, 0.1300014, 1.361331, 1, 0, 0.7803922, 1,
1.200188, 0.1846693, 1.857405, 1, 0, 0.772549, 1,
1.203387, -1.455431, 2.297601, 1, 0, 0.7686275, 1,
1.205561, 0.6719919, 1.995889, 1, 0, 0.7607843, 1,
1.20795, -0.1503387, 1.552656, 1, 0, 0.7568628, 1,
1.208356, -0.1662034, 0.6454398, 1, 0, 0.7490196, 1,
1.21615, -1.029024, 2.802865, 1, 0, 0.7450981, 1,
1.225023, 2.768848, 2.267982, 1, 0, 0.7372549, 1,
1.225445, 0.9932563, 0.7365086, 1, 0, 0.7333333, 1,
1.226288, 0.976795, 0.8192109, 1, 0, 0.7254902, 1,
1.227763, -1.250946, 3.45861, 1, 0, 0.7215686, 1,
1.240389, 0.8648633, 0.6417278, 1, 0, 0.7137255, 1,
1.250892, 0.7679947, -0.6275975, 1, 0, 0.7098039, 1,
1.251661, -1.926885, 2.721121, 1, 0, 0.7019608, 1,
1.254141, 0.6140516, 1.592129, 1, 0, 0.6941177, 1,
1.25456, 1.755824, 1.399638, 1, 0, 0.6901961, 1,
1.26149, -0.4339665, 2.590564, 1, 0, 0.682353, 1,
1.261951, -0.01046296, 1.029162, 1, 0, 0.6784314, 1,
1.262786, 0.3416626, 2.201158, 1, 0, 0.6705883, 1,
1.263906, 0.3668411, 2.427235, 1, 0, 0.6666667, 1,
1.264778, -0.7089655, 2.831529, 1, 0, 0.6588235, 1,
1.266841, -0.3133617, 2.17204, 1, 0, 0.654902, 1,
1.267004, -0.3804725, 1.552897, 1, 0, 0.6470588, 1,
1.268746, -1.791969, 2.740683, 1, 0, 0.6431373, 1,
1.274278, -2.540604, 2.087362, 1, 0, 0.6352941, 1,
1.290838, 0.8224551, 1.071674, 1, 0, 0.6313726, 1,
1.304215, -0.3940741, 0.8489478, 1, 0, 0.6235294, 1,
1.32086, 0.637719, 0.6241904, 1, 0, 0.6196079, 1,
1.321412, -0.3945908, 2.690066, 1, 0, 0.6117647, 1,
1.325681, -0.6635059, 1.611171, 1, 0, 0.6078432, 1,
1.33099, -0.3503758, 2.145919, 1, 0, 0.6, 1,
1.334793, 1.349025, 0.8864695, 1, 0, 0.5921569, 1,
1.337123, -0.2775276, 1.892796, 1, 0, 0.5882353, 1,
1.342337, -2.470834, 4.414691, 1, 0, 0.5803922, 1,
1.343123, 0.1839944, 2.629078, 1, 0, 0.5764706, 1,
1.348555, -1.666443, 2.482922, 1, 0, 0.5686275, 1,
1.351423, -0.5035486, 2.111857, 1, 0, 0.5647059, 1,
1.354837, 0.7541514, 0.6115142, 1, 0, 0.5568628, 1,
1.357289, -0.7992621, 2.917244, 1, 0, 0.5529412, 1,
1.358907, 1.163992, 1.684613, 1, 0, 0.5450981, 1,
1.375227, -0.2011477, -0.3519356, 1, 0, 0.5411765, 1,
1.38505, -0.5669568, 1.333519, 1, 0, 0.5333334, 1,
1.392927, 0.3226233, 2.246309, 1, 0, 0.5294118, 1,
1.39375, -0.8917118, 3.167317, 1, 0, 0.5215687, 1,
1.409554, 0.2774502, 0.9242852, 1, 0, 0.5176471, 1,
1.414853, 1.754078, 0.2024557, 1, 0, 0.509804, 1,
1.418602, 0.1084561, 1.989208, 1, 0, 0.5058824, 1,
1.423614, -0.1760859, 0.6086891, 1, 0, 0.4980392, 1,
1.425976, 0.9497135, 2.591263, 1, 0, 0.4901961, 1,
1.426415, 0.8028362, 1.761913, 1, 0, 0.4862745, 1,
1.427294, 0.03862315, 1.556147, 1, 0, 0.4784314, 1,
1.429125, 0.08215436, 1.27048, 1, 0, 0.4745098, 1,
1.441214, -0.7748612, 2.622651, 1, 0, 0.4666667, 1,
1.442708, 0.3838037, 0.3471283, 1, 0, 0.4627451, 1,
1.44322, -0.04299476, 2.873839, 1, 0, 0.454902, 1,
1.444178, -0.7807978, 1.809621, 1, 0, 0.4509804, 1,
1.451194, 0.3158488, 1.342765, 1, 0, 0.4431373, 1,
1.460408, -0.02981436, 2.484662, 1, 0, 0.4392157, 1,
1.463155, -0.2071146, 2.174496, 1, 0, 0.4313726, 1,
1.471116, -0.8464757, 0.5525804, 1, 0, 0.427451, 1,
1.475749, -0.04854813, 2.100829, 1, 0, 0.4196078, 1,
1.477021, 0.7360649, 2.877898, 1, 0, 0.4156863, 1,
1.481471, 1.827437, 1.534332, 1, 0, 0.4078431, 1,
1.49522, 0.02334664, 1.004432, 1, 0, 0.4039216, 1,
1.504342, -0.7932153, 2.008034, 1, 0, 0.3960784, 1,
1.509149, 0.8278883, -0.01285973, 1, 0, 0.3882353, 1,
1.514068, 0.2423097, 0.6522387, 1, 0, 0.3843137, 1,
1.528142, 0.9155768, 0.8840675, 1, 0, 0.3764706, 1,
1.561407, 0.5633086, 0.2440729, 1, 0, 0.372549, 1,
1.583052, -1.244247, 2.172298, 1, 0, 0.3647059, 1,
1.596454, -0.2636948, 1.05138, 1, 0, 0.3607843, 1,
1.60061, 1.331849, 0.8760557, 1, 0, 0.3529412, 1,
1.607976, 0.2884867, 1.993168, 1, 0, 0.3490196, 1,
1.614723, 0.9280652, -1.110025, 1, 0, 0.3411765, 1,
1.618408, 1.025067, 1.678616, 1, 0, 0.3372549, 1,
1.637499, 0.154667, 0.3420934, 1, 0, 0.3294118, 1,
1.650253, -0.5704665, 1.246375, 1, 0, 0.3254902, 1,
1.651837, -1.292962, 2.134431, 1, 0, 0.3176471, 1,
1.652737, -0.6192771, 2.842109, 1, 0, 0.3137255, 1,
1.65327, 0.7239839, -0.03924293, 1, 0, 0.3058824, 1,
1.687914, -0.9426486, 1.099036, 1, 0, 0.2980392, 1,
1.689552, -0.2197577, 1.891308, 1, 0, 0.2941177, 1,
1.701148, 1.087569, 1.235438, 1, 0, 0.2862745, 1,
1.701982, 1.494891, 2.361548, 1, 0, 0.282353, 1,
1.713986, 1.304557, 0.4060338, 1, 0, 0.2745098, 1,
1.737911, -0.9365643, 1.274907, 1, 0, 0.2705882, 1,
1.739292, 1.085651, 1.425259, 1, 0, 0.2627451, 1,
1.741369, -0.7154897, 1.520323, 1, 0, 0.2588235, 1,
1.749294, 1.118063, 0.9253933, 1, 0, 0.2509804, 1,
1.763627, -0.5652682, 1.114268, 1, 0, 0.2470588, 1,
1.792723, -0.1168626, 1.342307, 1, 0, 0.2392157, 1,
1.806989, 1.809502, -0.0360488, 1, 0, 0.2352941, 1,
1.817429, 0.2225588, 0.7150684, 1, 0, 0.227451, 1,
1.856665, 1.531695, -2.25288, 1, 0, 0.2235294, 1,
1.859955, 0.3784049, 0.1966402, 1, 0, 0.2156863, 1,
1.860391, -0.3217155, 1.557954, 1, 0, 0.2117647, 1,
1.861599, 0.7271374, 1.697727, 1, 0, 0.2039216, 1,
1.862972, 1.16205, -0.4050618, 1, 0, 0.1960784, 1,
1.874618, -1.142905, 2.978927, 1, 0, 0.1921569, 1,
1.892182, 0.7006748, 0.04488336, 1, 0, 0.1843137, 1,
1.914044, 1.099445, 0.9881684, 1, 0, 0.1803922, 1,
1.927553, -0.2556576, 2.860912, 1, 0, 0.172549, 1,
1.937718, 1.063574, 1.502982, 1, 0, 0.1686275, 1,
1.946281, 2.105842, -0.2565319, 1, 0, 0.1607843, 1,
1.94649, -0.6234587, 2.924893, 1, 0, 0.1568628, 1,
1.978416, 0.0701478, 1.476915, 1, 0, 0.1490196, 1,
1.98954, 0.3861884, 2.58005, 1, 0, 0.145098, 1,
2.025853, 0.5004964, 1.258174, 1, 0, 0.1372549, 1,
2.040041, -0.2721781, 0.5577879, 1, 0, 0.1333333, 1,
2.041528, 0.1538964, -0.3040666, 1, 0, 0.1254902, 1,
2.042418, 0.07759766, 3.604269, 1, 0, 0.1215686, 1,
2.120064, -1.443277, 1.453632, 1, 0, 0.1137255, 1,
2.160453, -1.930863, 1.884462, 1, 0, 0.1098039, 1,
2.166094, -1.369954, 3.205964, 1, 0, 0.1019608, 1,
2.2248, 0.05876018, 1.510718, 1, 0, 0.09411765, 1,
2.250922, -0.06118398, 2.178542, 1, 0, 0.09019608, 1,
2.270537, 0.841889, 0.6232598, 1, 0, 0.08235294, 1,
2.3052, -0.1977661, 2.762332, 1, 0, 0.07843138, 1,
2.325851, -1.166649, 2.389086, 1, 0, 0.07058824, 1,
2.355352, -0.02986649, 0.4281527, 1, 0, 0.06666667, 1,
2.365418, -0.4572146, 1.01625, 1, 0, 0.05882353, 1,
2.396332, -0.07673489, 0.7795225, 1, 0, 0.05490196, 1,
2.459369, -0.4378366, 1.961959, 1, 0, 0.04705882, 1,
2.475314, -1.866631, 0.3927813, 1, 0, 0.04313726, 1,
2.581179, 0.2357827, 1.116498, 1, 0, 0.03529412, 1,
2.929301, -0.05794565, 3.512749, 1, 0, 0.03137255, 1,
2.962682, -0.6945466, 1.191096, 1, 0, 0.02352941, 1,
3.106713, -2.146423, 1.254068, 1, 0, 0.01960784, 1,
3.202168, -0.6170838, 1.344485, 1, 0, 0.01176471, 1,
3.616868, 0.9883083, 2.314134, 1, 0, 0.007843138, 1
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
0.315766, -3.732335, -7.160937, 0, -0.5, 0.5, 0.5,
0.315766, -3.732335, -7.160937, 1, -0.5, 0.5, 0.5,
0.315766, -3.732335, -7.160937, 1, 1.5, 0.5, 0.5,
0.315766, -3.732335, -7.160937, 0, 1.5, 0.5, 0.5
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
-4.10441, 0.1648723, -7.160937, 0, -0.5, 0.5, 0.5,
-4.10441, 0.1648723, -7.160937, 1, -0.5, 0.5, 0.5,
-4.10441, 0.1648723, -7.160937, 1, 1.5, 0.5, 0.5,
-4.10441, 0.1648723, -7.160937, 0, 1.5, 0.5, 0.5
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
-4.10441, -3.732335, 0.2902691, 0, -0.5, 0.5, 0.5,
-4.10441, -3.732335, 0.2902691, 1, -0.5, 0.5, 0.5,
-4.10441, -3.732335, 0.2902691, 1, 1.5, 0.5, 0.5,
-4.10441, -3.732335, 0.2902691, 0, 1.5, 0.5, 0.5
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
-2, -2.832979, -5.441428,
3, -2.832979, -5.441428,
-2, -2.832979, -5.441428,
-2, -2.982872, -5.728013,
-1, -2.832979, -5.441428,
-1, -2.982872, -5.728013,
0, -2.832979, -5.441428,
0, -2.982872, -5.728013,
1, -2.832979, -5.441428,
1, -2.982872, -5.728013,
2, -2.832979, -5.441428,
2, -2.982872, -5.728013,
3, -2.832979, -5.441428,
3, -2.982872, -5.728013
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
-2, -3.282657, -6.301183, 0, -0.5, 0.5, 0.5,
-2, -3.282657, -6.301183, 1, -0.5, 0.5, 0.5,
-2, -3.282657, -6.301183, 1, 1.5, 0.5, 0.5,
-2, -3.282657, -6.301183, 0, 1.5, 0.5, 0.5,
-1, -3.282657, -6.301183, 0, -0.5, 0.5, 0.5,
-1, -3.282657, -6.301183, 1, -0.5, 0.5, 0.5,
-1, -3.282657, -6.301183, 1, 1.5, 0.5, 0.5,
-1, -3.282657, -6.301183, 0, 1.5, 0.5, 0.5,
0, -3.282657, -6.301183, 0, -0.5, 0.5, 0.5,
0, -3.282657, -6.301183, 1, -0.5, 0.5, 0.5,
0, -3.282657, -6.301183, 1, 1.5, 0.5, 0.5,
0, -3.282657, -6.301183, 0, 1.5, 0.5, 0.5,
1, -3.282657, -6.301183, 0, -0.5, 0.5, 0.5,
1, -3.282657, -6.301183, 1, -0.5, 0.5, 0.5,
1, -3.282657, -6.301183, 1, 1.5, 0.5, 0.5,
1, -3.282657, -6.301183, 0, 1.5, 0.5, 0.5,
2, -3.282657, -6.301183, 0, -0.5, 0.5, 0.5,
2, -3.282657, -6.301183, 1, -0.5, 0.5, 0.5,
2, -3.282657, -6.301183, 1, 1.5, 0.5, 0.5,
2, -3.282657, -6.301183, 0, 1.5, 0.5, 0.5,
3, -3.282657, -6.301183, 0, -0.5, 0.5, 0.5,
3, -3.282657, -6.301183, 1, -0.5, 0.5, 0.5,
3, -3.282657, -6.301183, 1, 1.5, 0.5, 0.5,
3, -3.282657, -6.301183, 0, 1.5, 0.5, 0.5
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
-3.08437, -2, -5.441428,
-3.08437, 3, -5.441428,
-3.08437, -2, -5.441428,
-3.254376, -2, -5.728013,
-3.08437, -1, -5.441428,
-3.254376, -1, -5.728013,
-3.08437, 0, -5.441428,
-3.254376, 0, -5.728013,
-3.08437, 1, -5.441428,
-3.254376, 1, -5.728013,
-3.08437, 2, -5.441428,
-3.254376, 2, -5.728013,
-3.08437, 3, -5.441428,
-3.254376, 3, -5.728013
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
-3.59439, -2, -6.301183, 0, -0.5, 0.5, 0.5,
-3.59439, -2, -6.301183, 1, -0.5, 0.5, 0.5,
-3.59439, -2, -6.301183, 1, 1.5, 0.5, 0.5,
-3.59439, -2, -6.301183, 0, 1.5, 0.5, 0.5,
-3.59439, -1, -6.301183, 0, -0.5, 0.5, 0.5,
-3.59439, -1, -6.301183, 1, -0.5, 0.5, 0.5,
-3.59439, -1, -6.301183, 1, 1.5, 0.5, 0.5,
-3.59439, -1, -6.301183, 0, 1.5, 0.5, 0.5,
-3.59439, 0, -6.301183, 0, -0.5, 0.5, 0.5,
-3.59439, 0, -6.301183, 1, -0.5, 0.5, 0.5,
-3.59439, 0, -6.301183, 1, 1.5, 0.5, 0.5,
-3.59439, 0, -6.301183, 0, 1.5, 0.5, 0.5,
-3.59439, 1, -6.301183, 0, -0.5, 0.5, 0.5,
-3.59439, 1, -6.301183, 1, -0.5, 0.5, 0.5,
-3.59439, 1, -6.301183, 1, 1.5, 0.5, 0.5,
-3.59439, 1, -6.301183, 0, 1.5, 0.5, 0.5,
-3.59439, 2, -6.301183, 0, -0.5, 0.5, 0.5,
-3.59439, 2, -6.301183, 1, -0.5, 0.5, 0.5,
-3.59439, 2, -6.301183, 1, 1.5, 0.5, 0.5,
-3.59439, 2, -6.301183, 0, 1.5, 0.5, 0.5,
-3.59439, 3, -6.301183, 0, -0.5, 0.5, 0.5,
-3.59439, 3, -6.301183, 1, -0.5, 0.5, 0.5,
-3.59439, 3, -6.301183, 1, 1.5, 0.5, 0.5,
-3.59439, 3, -6.301183, 0, 1.5, 0.5, 0.5
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
-3.08437, -2.832979, -4,
-3.08437, -2.832979, 4,
-3.08437, -2.832979, -4,
-3.254376, -2.982872, -4,
-3.08437, -2.832979, -2,
-3.254376, -2.982872, -2,
-3.08437, -2.832979, 0,
-3.254376, -2.982872, 0,
-3.08437, -2.832979, 2,
-3.254376, -2.982872, 2,
-3.08437, -2.832979, 4,
-3.254376, -2.982872, 4
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
-3.59439, -3.282657, -4, 0, -0.5, 0.5, 0.5,
-3.59439, -3.282657, -4, 1, -0.5, 0.5, 0.5,
-3.59439, -3.282657, -4, 1, 1.5, 0.5, 0.5,
-3.59439, -3.282657, -4, 0, 1.5, 0.5, 0.5,
-3.59439, -3.282657, -2, 0, -0.5, 0.5, 0.5,
-3.59439, -3.282657, -2, 1, -0.5, 0.5, 0.5,
-3.59439, -3.282657, -2, 1, 1.5, 0.5, 0.5,
-3.59439, -3.282657, -2, 0, 1.5, 0.5, 0.5,
-3.59439, -3.282657, 0, 0, -0.5, 0.5, 0.5,
-3.59439, -3.282657, 0, 1, -0.5, 0.5, 0.5,
-3.59439, -3.282657, 0, 1, 1.5, 0.5, 0.5,
-3.59439, -3.282657, 0, 0, 1.5, 0.5, 0.5,
-3.59439, -3.282657, 2, 0, -0.5, 0.5, 0.5,
-3.59439, -3.282657, 2, 1, -0.5, 0.5, 0.5,
-3.59439, -3.282657, 2, 1, 1.5, 0.5, 0.5,
-3.59439, -3.282657, 2, 0, 1.5, 0.5, 0.5,
-3.59439, -3.282657, 4, 0, -0.5, 0.5, 0.5,
-3.59439, -3.282657, 4, 1, -0.5, 0.5, 0.5,
-3.59439, -3.282657, 4, 1, 1.5, 0.5, 0.5,
-3.59439, -3.282657, 4, 0, 1.5, 0.5, 0.5
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
-3.08437, -2.832979, -5.441428,
-3.08437, 3.162724, -5.441428,
-3.08437, -2.832979, 6.021966,
-3.08437, 3.162724, 6.021966,
-3.08437, -2.832979, -5.441428,
-3.08437, -2.832979, 6.021966,
-3.08437, 3.162724, -5.441428,
-3.08437, 3.162724, 6.021966,
-3.08437, -2.832979, -5.441428,
3.715902, -2.832979, -5.441428,
-3.08437, -2.832979, 6.021966,
3.715902, -2.832979, 6.021966,
-3.08437, 3.162724, -5.441428,
3.715902, 3.162724, -5.441428,
-3.08437, 3.162724, 6.021966,
3.715902, 3.162724, 6.021966,
3.715902, -2.832979, -5.441428,
3.715902, 3.162724, -5.441428,
3.715902, -2.832979, 6.021966,
3.715902, 3.162724, 6.021966,
3.715902, -2.832979, -5.441428,
3.715902, -2.832979, 6.021966,
3.715902, 3.162724, -5.441428,
3.715902, 3.162724, 6.021966
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
var radius = 7.804187;
var distance = 34.72171;
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
mvMatrix.translate( -0.315766, -0.1648723, -0.2902691 );
mvMatrix.scale( 1.240839, 1.407348, 0.7360857 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.72171);
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
Phenmedipham<-read.table("Phenmedipham.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenmedipham$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenmedipham' not found
```

```r
y<-Phenmedipham$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenmedipham' not found
```

```r
z<-Phenmedipham$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenmedipham' not found
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
-2.985337, 0.3913904, -3.967128, 0, 0, 1, 1, 1,
-2.947706, 0.553323, -2.04002, 1, 0, 0, 1, 1,
-2.66524, 1.318572, -0.7751081, 1, 0, 0, 1, 1,
-2.624566, 0.5904306, -1.487879, 1, 0, 0, 1, 1,
-2.589887, -0.01969518, -0.7928754, 1, 0, 0, 1, 1,
-2.366288, -1.062705, -1.975466, 1, 0, 0, 1, 1,
-2.350798, -0.3807858, -0.4782287, 0, 0, 0, 1, 1,
-2.318635, -0.4823734, -1.470759, 0, 0, 0, 1, 1,
-2.281902, 1.210992, -0.1649814, 0, 0, 0, 1, 1,
-2.259992, -0.5974123, -2.475183, 0, 0, 0, 1, 1,
-2.198922, 1.075692, -2.242789, 0, 0, 0, 1, 1,
-2.195405, 0.3806219, -1.469333, 0, 0, 0, 1, 1,
-2.169898, 1.07109, -1.104756, 0, 0, 0, 1, 1,
-2.075502, -0.7707055, -1.717389, 1, 1, 1, 1, 1,
-2.060369, 1.249113, -1.09615, 1, 1, 1, 1, 1,
-2.054334, 0.6144739, -0.3617233, 1, 1, 1, 1, 1,
-2.040413, -0.06536613, -1.75185, 1, 1, 1, 1, 1,
-2.020294, 0.5264995, -1.994126, 1, 1, 1, 1, 1,
-2.011398, 0.1919889, -1.938213, 1, 1, 1, 1, 1,
-1.986782, -0.2173974, -1.76334, 1, 1, 1, 1, 1,
-1.980511, 0.004355276, -2.786105, 1, 1, 1, 1, 1,
-1.978438, 0.5369725, -2.184337, 1, 1, 1, 1, 1,
-1.956681, -1.008892, -2.842188, 1, 1, 1, 1, 1,
-1.947111, 0.1689664, -1.920276, 1, 1, 1, 1, 1,
-1.930001, -1.216143, 0.5558211, 1, 1, 1, 1, 1,
-1.880483, -0.3853904, -2.168256, 1, 1, 1, 1, 1,
-1.876331, 0.3287826, -2.080081, 1, 1, 1, 1, 1,
-1.853633, -0.9293919, -2.235437, 1, 1, 1, 1, 1,
-1.820958, 0.7495756, -1.911263, 0, 0, 1, 1, 1,
-1.806547, 0.2147953, -2.26992, 1, 0, 0, 1, 1,
-1.789163, -0.1567778, -1.757444, 1, 0, 0, 1, 1,
-1.787541, -0.4691811, -1.616827, 1, 0, 0, 1, 1,
-1.783467, -0.8652174, -1.201691, 1, 0, 0, 1, 1,
-1.779317, 0.5830122, -1.137106, 1, 0, 0, 1, 1,
-1.756626, 0.9230708, -2.119851, 0, 0, 0, 1, 1,
-1.747743, 0.6729929, -2.040768, 0, 0, 0, 1, 1,
-1.732529, -0.5485998, -1.895708, 0, 0, 0, 1, 1,
-1.716568, -0.06107609, -1.906744, 0, 0, 0, 1, 1,
-1.715636, 1.543324, -0.3436081, 0, 0, 0, 1, 1,
-1.714439, -1.427156, -3.773353, 0, 0, 0, 1, 1,
-1.708117, 0.8775111, -1.125322, 0, 0, 0, 1, 1,
-1.698125, 1.80832, -0.278995, 1, 1, 1, 1, 1,
-1.696368, 1.724652, 0.3046716, 1, 1, 1, 1, 1,
-1.669162, -1.292801, -1.451538, 1, 1, 1, 1, 1,
-1.667918, -1.760916, -2.742471, 1, 1, 1, 1, 1,
-1.662744, 0.5568044, -1.19444, 1, 1, 1, 1, 1,
-1.656601, -0.5846319, -3.808795, 1, 1, 1, 1, 1,
-1.651934, 0.2473766, -1.852203, 1, 1, 1, 1, 1,
-1.642577, 0.8623644, -1.637731, 1, 1, 1, 1, 1,
-1.639926, -1.448983, -2.383013, 1, 1, 1, 1, 1,
-1.633076, 0.7640038, -0.4306155, 1, 1, 1, 1, 1,
-1.621907, -0.9143077, -2.012161, 1, 1, 1, 1, 1,
-1.601804, 0.238754, -3.000544, 1, 1, 1, 1, 1,
-1.59713, 0.08935015, -0.2862864, 1, 1, 1, 1, 1,
-1.593749, 0.4943092, -2.084365, 1, 1, 1, 1, 1,
-1.593094, -0.258678, -3.137408, 1, 1, 1, 1, 1,
-1.589128, -1.07731, -2.051462, 0, 0, 1, 1, 1,
-1.581656, -0.7288426, -2.060848, 1, 0, 0, 1, 1,
-1.576991, 0.3259592, 0.08007269, 1, 0, 0, 1, 1,
-1.576958, 0.9502639, -0.1266624, 1, 0, 0, 1, 1,
-1.572098, -0.134461, -2.079267, 1, 0, 0, 1, 1,
-1.563337, 0.01926898, -0.03271799, 1, 0, 0, 1, 1,
-1.555963, -0.3361971, -2.146473, 0, 0, 0, 1, 1,
-1.555296, 1.368346, -0.3161288, 0, 0, 0, 1, 1,
-1.545326, -0.1961982, -2.562246, 0, 0, 0, 1, 1,
-1.534573, -0.4121442, -1.744276, 0, 0, 0, 1, 1,
-1.52383, 0.4429733, -2.611203, 0, 0, 0, 1, 1,
-1.516623, 0.1233306, 0.04076112, 0, 0, 0, 1, 1,
-1.514665, -0.2711942, -1.932221, 0, 0, 0, 1, 1,
-1.505647, -0.2101135, 1.05443, 1, 1, 1, 1, 1,
-1.495766, 0.3354316, -2.432608, 1, 1, 1, 1, 1,
-1.481326, -1.653253, -1.955553, 1, 1, 1, 1, 1,
-1.473526, -1.124185, -2.447622, 1, 1, 1, 1, 1,
-1.472886, -0.9548929, -1.136775, 1, 1, 1, 1, 1,
-1.450641, 0.07070703, -1.702636, 1, 1, 1, 1, 1,
-1.441857, 0.779052, -0.6133112, 1, 1, 1, 1, 1,
-1.424355, -0.3929664, -1.514506, 1, 1, 1, 1, 1,
-1.420817, 0.9151831, -2.492762, 1, 1, 1, 1, 1,
-1.407773, 0.5149605, 0.2604908, 1, 1, 1, 1, 1,
-1.403072, -1.475764, -1.245442, 1, 1, 1, 1, 1,
-1.397178, 0.8378723, -1.609799, 1, 1, 1, 1, 1,
-1.396893, 0.1328354, -1.305332, 1, 1, 1, 1, 1,
-1.393549, -0.9774898, -2.697843, 1, 1, 1, 1, 1,
-1.386549, 1.761107, 1.214737, 1, 1, 1, 1, 1,
-1.386212, -0.651765, -2.628527, 0, 0, 1, 1, 1,
-1.385571, -0.5660451, -2.16706, 1, 0, 0, 1, 1,
-1.383935, 0.4928427, -1.246502, 1, 0, 0, 1, 1,
-1.380852, 0.2262191, -2.930649, 1, 0, 0, 1, 1,
-1.357263, -0.3095222, -2.875246, 1, 0, 0, 1, 1,
-1.341913, -0.02785014, -2.367409, 1, 0, 0, 1, 1,
-1.340229, 0.7397332, -0.7213643, 0, 0, 0, 1, 1,
-1.337756, -0.04164973, 0.6937498, 0, 0, 0, 1, 1,
-1.333329, -0.4463886, -2.435932, 0, 0, 0, 1, 1,
-1.331793, 0.259358, -0.3806641, 0, 0, 0, 1, 1,
-1.320242, 0.3370121, -2.610071, 0, 0, 0, 1, 1,
-1.305499, 0.7309119, -0.9388666, 0, 0, 0, 1, 1,
-1.302869, -0.390517, -2.018297, 0, 0, 0, 1, 1,
-1.294002, -0.4524081, -1.487918, 1, 1, 1, 1, 1,
-1.292647, 0.5504875, -0.02529023, 1, 1, 1, 1, 1,
-1.285936, 1.231517, -1.371624, 1, 1, 1, 1, 1,
-1.277027, 1.114293, -0.9355819, 1, 1, 1, 1, 1,
-1.275307, 0.4211557, -2.68971, 1, 1, 1, 1, 1,
-1.271206, 0.3368728, -1.617349, 1, 1, 1, 1, 1,
-1.27011, -0.09756473, -0.4645852, 1, 1, 1, 1, 1,
-1.267917, 2.79868, -1.261706, 1, 1, 1, 1, 1,
-1.260528, 0.2438523, -1.149786, 1, 1, 1, 1, 1,
-1.260344, 0.06437593, -1.615541, 1, 1, 1, 1, 1,
-1.257675, -2.197915, -3.453513, 1, 1, 1, 1, 1,
-1.248311, -0.6370453, -2.587209, 1, 1, 1, 1, 1,
-1.245075, 0.3283992, -2.688635, 1, 1, 1, 1, 1,
-1.231277, -0.8654478, -2.606079, 1, 1, 1, 1, 1,
-1.223508, 0.8958549, -0.2047568, 1, 1, 1, 1, 1,
-1.222245, 2.286576, -1.06174, 0, 0, 1, 1, 1,
-1.222198, -0.2869169, -2.721106, 1, 0, 0, 1, 1,
-1.22188, 0.07300809, -2.960615, 1, 0, 0, 1, 1,
-1.221854, -0.5908056, -2.282367, 1, 0, 0, 1, 1,
-1.214366, 2.270376, -1.350504, 1, 0, 0, 1, 1,
-1.210827, -2.369272, -1.026705, 1, 0, 0, 1, 1,
-1.203005, 1.299327, -0.2874065, 0, 0, 0, 1, 1,
-1.200333, 0.3285401, 0.836311, 0, 0, 0, 1, 1,
-1.199125, -1.799774, -2.468486, 0, 0, 0, 1, 1,
-1.184995, -1.167776, -1.884489, 0, 0, 0, 1, 1,
-1.179736, 0.4500557, -0.6476659, 0, 0, 0, 1, 1,
-1.17902, 1.238901, -0.7268078, 0, 0, 0, 1, 1,
-1.161476, 0.1885482, -2.044336, 0, 0, 0, 1, 1,
-1.157363, -0.283823, -2.177286, 1, 1, 1, 1, 1,
-1.154704, 0.2251786, -0.7154979, 1, 1, 1, 1, 1,
-1.152044, 0.9682987, 0.9188229, 1, 1, 1, 1, 1,
-1.150092, -2.154434, -2.524915, 1, 1, 1, 1, 1,
-1.142573, 1.218351, -0.5382317, 1, 1, 1, 1, 1,
-1.142375, -0.9770278, -3.589056, 1, 1, 1, 1, 1,
-1.134585, -0.5129619, -3.408467, 1, 1, 1, 1, 1,
-1.133983, 0.3740029, -0.7302215, 1, 1, 1, 1, 1,
-1.127691, -0.8328802, -2.435802, 1, 1, 1, 1, 1,
-1.117244, 0.1118565, -2.118568, 1, 1, 1, 1, 1,
-1.114555, -0.4518418, -2.630025, 1, 1, 1, 1, 1,
-1.11211, 2.2712, 0.7665249, 1, 1, 1, 1, 1,
-1.111147, 1.83307, -1.32643, 1, 1, 1, 1, 1,
-1.108625, -0.1812264, -1.810791, 1, 1, 1, 1, 1,
-1.105912, -0.6131379, -2.509261, 1, 1, 1, 1, 1,
-1.105174, -0.08000033, -1.011923, 0, 0, 1, 1, 1,
-1.092501, -0.1428313, -1.551629, 1, 0, 0, 1, 1,
-1.082427, 0.7133068, -1.415992, 1, 0, 0, 1, 1,
-1.073102, -1.800253, -2.87847, 1, 0, 0, 1, 1,
-1.070161, -0.002001624, -0.1045237, 1, 0, 0, 1, 1,
-1.0695, 0.9728954, -1.54797, 1, 0, 0, 1, 1,
-1.063995, -0.3836286, -1.251834, 0, 0, 0, 1, 1,
-1.061715, -0.7358935, -3.79298, 0, 0, 0, 1, 1,
-1.06067, 0.1624881, -0.4835739, 0, 0, 0, 1, 1,
-1.054763, 1.129434, -1.121354, 0, 0, 0, 1, 1,
-1.052334, 0.7443175, 0.214116, 0, 0, 0, 1, 1,
-1.048886, 0.7569166, 0.2229885, 0, 0, 0, 1, 1,
-1.045123, -0.5580539, -2.414382, 0, 0, 0, 1, 1,
-1.038598, 0.8517701, -1.277722, 1, 1, 1, 1, 1,
-1.026507, 0.8767192, -1.569908, 1, 1, 1, 1, 1,
-1.024026, 1.021334, -1.639155, 1, 1, 1, 1, 1,
-1.018145, 0.1186787, -1.421097, 1, 1, 1, 1, 1,
-1.015316, 1.259918, 1.892097, 1, 1, 1, 1, 1,
-1.00622, -1.430856, -1.390977, 1, 1, 1, 1, 1,
-0.9922134, -0.148372, -1.473787, 1, 1, 1, 1, 1,
-0.9905328, 1.796352, -0.7553263, 1, 1, 1, 1, 1,
-0.990442, 0.8428812, -0.5622535, 1, 1, 1, 1, 1,
-0.9873279, 0.7186496, -0.5236385, 1, 1, 1, 1, 1,
-0.9847889, 0.629083, -0.8895973, 1, 1, 1, 1, 1,
-0.9820041, 0.5763928, -2.123836, 1, 1, 1, 1, 1,
-0.9780197, -0.119368, -0.5468091, 1, 1, 1, 1, 1,
-0.9715731, -0.3293012, -2.125303, 1, 1, 1, 1, 1,
-0.9684936, -0.4013697, -0.6076122, 1, 1, 1, 1, 1,
-0.9683949, 0.6073605, -1.992127, 0, 0, 1, 1, 1,
-0.9576038, -0.342714, -0.07659934, 1, 0, 0, 1, 1,
-0.9460301, -1.080466, -1.100718, 1, 0, 0, 1, 1,
-0.9412543, 0.9239973, -0.3052202, 1, 0, 0, 1, 1,
-0.9410947, -0.1680737, -1.070989, 1, 0, 0, 1, 1,
-0.9375627, -1.239217, -1.484865, 1, 0, 0, 1, 1,
-0.9329417, -1.807383, -3.41381, 0, 0, 0, 1, 1,
-0.9286953, -0.2400279, -0.3341867, 0, 0, 0, 1, 1,
-0.9213249, -0.3962376, -1.823063, 0, 0, 0, 1, 1,
-0.9150764, -0.5857108, -3.535468, 0, 0, 0, 1, 1,
-0.907981, 1.775623, -1.758773, 0, 0, 0, 1, 1,
-0.9025528, -0.1954969, -1.358606, 0, 0, 0, 1, 1,
-0.8950438, -0.4374559, -4.740399, 0, 0, 0, 1, 1,
-0.8941454, 2.683375, -0.7458768, 1, 1, 1, 1, 1,
-0.8852494, -1.590631, -1.922601, 1, 1, 1, 1, 1,
-0.8821569, -0.1195396, -1.21407, 1, 1, 1, 1, 1,
-0.8786652, 0.3308088, -0.5254074, 1, 1, 1, 1, 1,
-0.8776451, -0.3775455, -0.9472534, 1, 1, 1, 1, 1,
-0.8754362, 2.974555, -0.8138692, 1, 1, 1, 1, 1,
-0.8687482, -0.4170928, -1.772054, 1, 1, 1, 1, 1,
-0.8632602, -1.078456, -4.48149, 1, 1, 1, 1, 1,
-0.8541979, -0.3369372, -4.055213, 1, 1, 1, 1, 1,
-0.8538126, 0.6776001, -2.758067, 1, 1, 1, 1, 1,
-0.8496956, 0.9149573, -1.641308, 1, 1, 1, 1, 1,
-0.8473554, -0.249613, -0.9470339, 1, 1, 1, 1, 1,
-0.8442825, 0.02983346, -0.9390888, 1, 1, 1, 1, 1,
-0.8439111, 0.6939106, 0.3474712, 1, 1, 1, 1, 1,
-0.8422254, -1.862561, -0.9280547, 1, 1, 1, 1, 1,
-0.8297416, -0.8296793, -1.808805, 0, 0, 1, 1, 1,
-0.8251275, 0.934702, 1.48747, 1, 0, 0, 1, 1,
-0.822762, 0.02381436, -0.8839794, 1, 0, 0, 1, 1,
-0.8214103, 1.028527, -2.031133, 1, 0, 0, 1, 1,
-0.8124912, -1.295934, -2.506833, 1, 0, 0, 1, 1,
-0.8080862, 0.452509, -1.032394, 1, 0, 0, 1, 1,
-0.8045372, 0.9780886, -0.3819157, 0, 0, 0, 1, 1,
-0.802601, -2.424544, -4.185356, 0, 0, 0, 1, 1,
-0.7979757, 1.388156, -1.622496, 0, 0, 0, 1, 1,
-0.7970104, -1.333964, -0.9741222, 0, 0, 0, 1, 1,
-0.7944256, 0.07357458, -0.5744145, 0, 0, 0, 1, 1,
-0.7869219, -1.025474, -2.280174, 0, 0, 0, 1, 1,
-0.7777098, -0.1716987, -2.381967, 0, 0, 0, 1, 1,
-0.7763048, 1.260139, -2.430689, 1, 1, 1, 1, 1,
-0.7734109, -0.1583157, -1.588834, 1, 1, 1, 1, 1,
-0.7708485, 1.578273, 1.116764, 1, 1, 1, 1, 1,
-0.768524, 0.3290541, -1.247414, 1, 1, 1, 1, 1,
-0.7615316, 0.0566189, -1.241866, 1, 1, 1, 1, 1,
-0.7538228, -1.119719, -2.142803, 1, 1, 1, 1, 1,
-0.7500958, -0.08017766, -2.038013, 1, 1, 1, 1, 1,
-0.7460005, -0.4864808, -1.950345, 1, 1, 1, 1, 1,
-0.7414287, 0.7289435, 0.2123235, 1, 1, 1, 1, 1,
-0.7403813, -1.247215, -3.108128, 1, 1, 1, 1, 1,
-0.737835, -1.481019, -0.9992471, 1, 1, 1, 1, 1,
-0.7343783, 1.016692, -0.7430661, 1, 1, 1, 1, 1,
-0.7333147, -0.01588087, -1.847315, 1, 1, 1, 1, 1,
-0.7283542, -0.1378841, -0.1452487, 1, 1, 1, 1, 1,
-0.7259285, -0.7310354, -2.776273, 1, 1, 1, 1, 1,
-0.7226107, -1.164044, -3.551134, 0, 0, 1, 1, 1,
-0.713931, 0.2454886, -2.313693, 1, 0, 0, 1, 1,
-0.7123914, 0.5830409, -0.4103434, 1, 0, 0, 1, 1,
-0.7078336, 0.1887954, -1.226252, 1, 0, 0, 1, 1,
-0.6938586, -0.6422319, -3.024248, 1, 0, 0, 1, 1,
-0.6869158, 0.6340287, -1.384762, 1, 0, 0, 1, 1,
-0.6828943, -0.7698059, -0.8700747, 0, 0, 0, 1, 1,
-0.6819548, -1.504058, -2.333652, 0, 0, 0, 1, 1,
-0.6741885, -1.047126, -1.412365, 0, 0, 0, 1, 1,
-0.673953, 1.175818, -0.2173521, 0, 0, 0, 1, 1,
-0.6730468, -1.161395, -4.728203, 0, 0, 0, 1, 1,
-0.6724001, -0.1583622, -2.129517, 0, 0, 0, 1, 1,
-0.6686475, -1.687884, -2.983101, 0, 0, 0, 1, 1,
-0.6623884, -0.5591688, -3.444371, 1, 1, 1, 1, 1,
-0.6613329, 1.690695, 0.2917332, 1, 1, 1, 1, 1,
-0.6472701, 1.225428, 1.352651, 1, 1, 1, 1, 1,
-0.6464838, -0.8846054, -3.76773, 1, 1, 1, 1, 1,
-0.6464613, -1.060555, -3.994983, 1, 1, 1, 1, 1,
-0.6412903, -0.8842971, -2.676109, 1, 1, 1, 1, 1,
-0.639845, -0.1523753, -3.868267, 1, 1, 1, 1, 1,
-0.6289853, -0.5310569, -1.802176, 1, 1, 1, 1, 1,
-0.628931, 1.077616, 0.6797534, 1, 1, 1, 1, 1,
-0.6283412, -1.012646, -1.458994, 1, 1, 1, 1, 1,
-0.6271604, -0.02886176, -0.7569607, 1, 1, 1, 1, 1,
-0.6232011, 0.846812, -1.187316, 1, 1, 1, 1, 1,
-0.6209239, 0.374859, -1.15955, 1, 1, 1, 1, 1,
-0.6204261, -0.08859359, -2.596981, 1, 1, 1, 1, 1,
-0.620302, -1.443566, -2.881245, 1, 1, 1, 1, 1,
-0.6180097, 0.6025577, -0.2073623, 0, 0, 1, 1, 1,
-0.6168178, -0.7038414, -3.823332, 1, 0, 0, 1, 1,
-0.6159844, -1.34669, -4.580758, 1, 0, 0, 1, 1,
-0.6115214, 0.2417109, -2.902181, 1, 0, 0, 1, 1,
-0.608672, 0.06145999, -4.086129, 1, 0, 0, 1, 1,
-0.6054335, -1.025762, -2.864042, 1, 0, 0, 1, 1,
-0.5996908, -0.8490598, -4.11671, 0, 0, 0, 1, 1,
-0.5985901, 0.08337443, -0.7949361, 0, 0, 0, 1, 1,
-0.5909783, 0.2722558, -1.255006, 0, 0, 0, 1, 1,
-0.5884667, -0.0537954, -0.7985571, 0, 0, 0, 1, 1,
-0.5881414, -0.9967399, -3.501708, 0, 0, 0, 1, 1,
-0.5863585, -0.02973498, 0.9734737, 0, 0, 0, 1, 1,
-0.5796927, 0.6919136, -2.309528, 0, 0, 0, 1, 1,
-0.575974, -0.2641869, -3.543834, 1, 1, 1, 1, 1,
-0.5650051, -1.159197, -2.852721, 1, 1, 1, 1, 1,
-0.5645037, 0.4538932, -1.299331, 1, 1, 1, 1, 1,
-0.5638807, -0.2312386, -2.939126, 1, 1, 1, 1, 1,
-0.5617487, 0.2365453, -1.325346, 1, 1, 1, 1, 1,
-0.5612202, 0.6050443, -2.677084, 1, 1, 1, 1, 1,
-0.5608361, -0.861286, -2.33815, 1, 1, 1, 1, 1,
-0.5607011, -0.1284092, -3.086914, 1, 1, 1, 1, 1,
-0.5581969, 1.589239, 0.8032467, 1, 1, 1, 1, 1,
-0.5560207, -0.04874948, -1.324861, 1, 1, 1, 1, 1,
-0.5527533, -1.035512, -1.798092, 1, 1, 1, 1, 1,
-0.5435418, 0.7708125, -1.201605, 1, 1, 1, 1, 1,
-0.5398404, 1.48788, 0.3093265, 1, 1, 1, 1, 1,
-0.5308183, 0.3881737, 0.1573927, 1, 1, 1, 1, 1,
-0.5297029, -0.3806061, -1.397849, 1, 1, 1, 1, 1,
-0.5296204, 0.002617274, -1.297017, 0, 0, 1, 1, 1,
-0.5282684, -1.028467, -2.12669, 1, 0, 0, 1, 1,
-0.5245196, -0.7850763, -1.65416, 1, 0, 0, 1, 1,
-0.5222319, 0.8586299, -1.406919, 1, 0, 0, 1, 1,
-0.5219987, 1.825978, 0.5109105, 1, 0, 0, 1, 1,
-0.5111861, 1.527926, 0.1809662, 1, 0, 0, 1, 1,
-0.5105128, 0.4165168, -1.29724, 0, 0, 0, 1, 1,
-0.509702, 1.807956, -1.335986, 0, 0, 0, 1, 1,
-0.5094025, -0.1480485, -1.01511, 0, 0, 0, 1, 1,
-0.5086225, -1.070005, -1.200534, 0, 0, 0, 1, 1,
-0.5068875, -0.09746838, -2.134443, 0, 0, 0, 1, 1,
-0.5054325, -1.409582, -3.157798, 0, 0, 0, 1, 1,
-0.4994731, 0.703088, 1.172346, 0, 0, 0, 1, 1,
-0.4994271, -1.679944, -3.619079, 1, 1, 1, 1, 1,
-0.4992836, 1.09749, -0.6649533, 1, 1, 1, 1, 1,
-0.4967917, -0.4272576, -2.802767, 1, 1, 1, 1, 1,
-0.4929135, -1.094071, -3.986247, 1, 1, 1, 1, 1,
-0.4852067, 0.987004, -1.450979, 1, 1, 1, 1, 1,
-0.4800124, -0.5508509, -3.942379, 1, 1, 1, 1, 1,
-0.4793884, 0.8352411, -0.1931252, 1, 1, 1, 1, 1,
-0.4767041, 0.18332, -0.1471222, 1, 1, 1, 1, 1,
-0.4719986, 0.5135505, -3.191341, 1, 1, 1, 1, 1,
-0.4689353, -0.3250863, -2.771315, 1, 1, 1, 1, 1,
-0.4671774, -0.405958, -2.309186, 1, 1, 1, 1, 1,
-0.4661216, -1.390943, -3.497472, 1, 1, 1, 1, 1,
-0.463758, 0.2674514, 0.2625326, 1, 1, 1, 1, 1,
-0.4607524, 0.7125208, -2.713426, 1, 1, 1, 1, 1,
-0.45896, -1.150511, -2.192146, 1, 1, 1, 1, 1,
-0.4579328, -0.8493374, -1.384893, 0, 0, 1, 1, 1,
-0.4570295, 1.541089, 0.08919208, 1, 0, 0, 1, 1,
-0.4547907, 0.3668652, -0.7402834, 1, 0, 0, 1, 1,
-0.4451859, -1.326593, -1.807354, 1, 0, 0, 1, 1,
-0.4426691, -0.5566396, -1.779312, 1, 0, 0, 1, 1,
-0.4420494, 2.113095, -0.9774177, 1, 0, 0, 1, 1,
-0.4392413, 1.020571, -0.6271416, 0, 0, 0, 1, 1,
-0.4372041, 0.08515754, 0.4391467, 0, 0, 0, 1, 1,
-0.4343452, -0.992821, -2.608238, 0, 0, 0, 1, 1,
-0.4305383, -1.517148, -2.546326, 0, 0, 0, 1, 1,
-0.425153, -0.382797, -2.318104, 0, 0, 0, 1, 1,
-0.4221693, 0.2292293, -0.6274444, 0, 0, 0, 1, 1,
-0.4210109, 1.387583, 0.8902471, 0, 0, 0, 1, 1,
-0.4206077, -0.06662045, -2.685674, 1, 1, 1, 1, 1,
-0.411012, 0.6263615, -0.8796291, 1, 1, 1, 1, 1,
-0.4109924, -0.2340402, -3.5413, 1, 1, 1, 1, 1,
-0.4079034, 1.154671, 0.5813493, 1, 1, 1, 1, 1,
-0.4073874, -1.017322, -3.072038, 1, 1, 1, 1, 1,
-0.4071461, -0.6689335, -2.223896, 1, 1, 1, 1, 1,
-0.4024433, 0.3672921, 0.4548266, 1, 1, 1, 1, 1,
-0.3999172, 0.1772232, -1.606072, 1, 1, 1, 1, 1,
-0.3986445, -0.4207859, -2.381012, 1, 1, 1, 1, 1,
-0.3957012, -2.272713, -3.582904, 1, 1, 1, 1, 1,
-0.3950107, -2.745663, -1.751512, 1, 1, 1, 1, 1,
-0.3890609, 0.7033653, -0.5721509, 1, 1, 1, 1, 1,
-0.3887966, -1.166927, -1.348715, 1, 1, 1, 1, 1,
-0.3883138, -1.007921, -2.60585, 1, 1, 1, 1, 1,
-0.3857445, -0.1864588, -2.990322, 1, 1, 1, 1, 1,
-0.3844912, -1.329329, -2.612608, 0, 0, 1, 1, 1,
-0.3835508, -2.130779, -1.688703, 1, 0, 0, 1, 1,
-0.3832041, -0.07627559, -0.5090876, 1, 0, 0, 1, 1,
-0.3817203, -0.03359979, 0.7202745, 1, 0, 0, 1, 1,
-0.3817011, -0.3461152, -2.742106, 1, 0, 0, 1, 1,
-0.3790407, 0.09182305, 0.01976992, 1, 0, 0, 1, 1,
-0.37615, -0.6931265, -2.894417, 0, 0, 0, 1, 1,
-0.3741258, -0.6267644, -2.379874, 0, 0, 0, 1, 1,
-0.3715937, -0.0225342, -3.871423, 0, 0, 0, 1, 1,
-0.3711663, -0.05158549, -1.621872, 0, 0, 0, 1, 1,
-0.3638885, -0.2158997, -1.191331, 0, 0, 0, 1, 1,
-0.3637315, 0.4785537, -0.1333568, 0, 0, 0, 1, 1,
-0.3491994, -0.6837077, -0.550633, 0, 0, 0, 1, 1,
-0.3470394, -1.697477, -3.155081, 1, 1, 1, 1, 1,
-0.3462653, 1.492707, 1.468562, 1, 1, 1, 1, 1,
-0.3460504, 0.9251284, 0.2523642, 1, 1, 1, 1, 1,
-0.3458171, -1.670145, -3.703064, 1, 1, 1, 1, 1,
-0.3457182, 1.246747, -0.3887278, 1, 1, 1, 1, 1,
-0.345024, 0.1222149, 0.02244969, 1, 1, 1, 1, 1,
-0.3259055, 0.9072086, -0.7438598, 1, 1, 1, 1, 1,
-0.3257617, 0.9661012, -1.357308, 1, 1, 1, 1, 1,
-0.3243471, -1.15665, -3.476893, 1, 1, 1, 1, 1,
-0.3231874, 1.092796, 0.6920547, 1, 1, 1, 1, 1,
-0.3219664, 1.398375, 0.3011214, 1, 1, 1, 1, 1,
-0.3191764, 0.9992009, -1.003923, 1, 1, 1, 1, 1,
-0.3164364, -0.3034714, -2.171859, 1, 1, 1, 1, 1,
-0.3153351, -0.3303166, -3.3589, 1, 1, 1, 1, 1,
-0.3094766, 0.4454571, 1.18449, 1, 1, 1, 1, 1,
-0.3090543, 0.08491857, -1.134825, 0, 0, 1, 1, 1,
-0.3078165, -1.303213, -3.139868, 1, 0, 0, 1, 1,
-0.3073754, 0.3728335, -1.837921, 1, 0, 0, 1, 1,
-0.3014853, 0.4199263, -0.3196741, 1, 0, 0, 1, 1,
-0.2944974, 0.7959905, 0.2002542, 1, 0, 0, 1, 1,
-0.288096, 1.600334, 0.5365092, 1, 0, 0, 1, 1,
-0.2847169, -0.6757506, -1.398547, 0, 0, 0, 1, 1,
-0.2829939, -0.3961689, -2.775667, 0, 0, 0, 1, 1,
-0.2800908, -0.5718439, -2.300731, 0, 0, 0, 1, 1,
-0.2742919, -0.5642098, -3.907323, 0, 0, 0, 1, 1,
-0.2733518, 0.9946139, 0.1766886, 0, 0, 0, 1, 1,
-0.2721529, -1.165357, -3.420772, 0, 0, 0, 1, 1,
-0.2718534, 1.340363, -1.19374, 0, 0, 0, 1, 1,
-0.2698984, -1.06303, -2.219846, 1, 1, 1, 1, 1,
-0.2691786, 0.2592583, 0.276592, 1, 1, 1, 1, 1,
-0.2665344, -0.4328304, -2.937432, 1, 1, 1, 1, 1,
-0.263864, 0.2884802, -0.8423159, 1, 1, 1, 1, 1,
-0.2634032, 1.110718, -0.9572663, 1, 1, 1, 1, 1,
-0.2633511, -0.3060115, -1.883104, 1, 1, 1, 1, 1,
-0.2625281, -0.101184, -3.113156, 1, 1, 1, 1, 1,
-0.2619303, 1.834992, 0.7244198, 1, 1, 1, 1, 1,
-0.2580989, 1.071533, -0.5249667, 1, 1, 1, 1, 1,
-0.2576677, 0.5331471, -0.06178718, 1, 1, 1, 1, 1,
-0.253245, 0.9753113, 0.576565, 1, 1, 1, 1, 1,
-0.2507438, -1.178918, -3.476412, 1, 1, 1, 1, 1,
-0.2468745, -1.193106, -2.819841, 1, 1, 1, 1, 1,
-0.2463894, -1.392232, -1.943134, 1, 1, 1, 1, 1,
-0.2447817, -0.3437483, -2.163871, 1, 1, 1, 1, 1,
-0.2422769, -1.552768, -2.249557, 0, 0, 1, 1, 1,
-0.2401619, -0.9807083, -2.894985, 1, 0, 0, 1, 1,
-0.2395094, 0.7159883, 1.087517, 1, 0, 0, 1, 1,
-0.2337143, -0.01045886, -1.560662, 1, 0, 0, 1, 1,
-0.2309495, -0.9537383, -1.64244, 1, 0, 0, 1, 1,
-0.2295101, 0.3511609, -0.8921351, 1, 0, 0, 1, 1,
-0.2293269, 0.9965277, 0.9813277, 0, 0, 0, 1, 1,
-0.2267806, -0.5218533, -3.91503, 0, 0, 0, 1, 1,
-0.2231811, 0.04425494, -2.821939, 0, 0, 0, 1, 1,
-0.2200394, 0.696296, 0.1386957, 0, 0, 0, 1, 1,
-0.2187534, -0.6038135, -4.065543, 0, 0, 0, 1, 1,
-0.2163848, 1.301345, -0.07287342, 0, 0, 0, 1, 1,
-0.198229, 0.9925418, -0.3732087, 0, 0, 0, 1, 1,
-0.1967193, -0.5791467, -1.90182, 1, 1, 1, 1, 1,
-0.1945721, 0.157132, -0.1257072, 1, 1, 1, 1, 1,
-0.1935163, 0.7646706, -0.9524254, 1, 1, 1, 1, 1,
-0.1872169, 0.4928403, 0.3765463, 1, 1, 1, 1, 1,
-0.1781104, -1.736466, -4.185877, 1, 1, 1, 1, 1,
-0.1763706, -0.3255685, -2.815698, 1, 1, 1, 1, 1,
-0.1741032, 0.1836217, -1.535842, 1, 1, 1, 1, 1,
-0.1720169, -0.3879228, -3.383414, 1, 1, 1, 1, 1,
-0.1678957, -0.1400471, -2.153537, 1, 1, 1, 1, 1,
-0.1663683, -0.1108906, -3.066735, 1, 1, 1, 1, 1,
-0.1603928, -0.7843815, -4.279235, 1, 1, 1, 1, 1,
-0.1585685, 0.2639338, -2.274661, 1, 1, 1, 1, 1,
-0.1575072, -0.3531041, -3.938681, 1, 1, 1, 1, 1,
-0.1486829, 0.7103364, -0.4089565, 1, 1, 1, 1, 1,
-0.1477983, 1.117698, 0.1060622, 1, 1, 1, 1, 1,
-0.1448704, -0.6861618, -2.947304, 0, 0, 1, 1, 1,
-0.1437861, -0.8465211, -2.26317, 1, 0, 0, 1, 1,
-0.1413645, 0.5078158, 0.3939896, 1, 0, 0, 1, 1,
-0.1404148, -0.8684669, -3.431961, 1, 0, 0, 1, 1,
-0.1379722, 1.526655, 0.9833485, 1, 0, 0, 1, 1,
-0.1368873, -0.8724222, -3.867379, 1, 0, 0, 1, 1,
-0.1348703, -1.071441, -5.274486, 0, 0, 0, 1, 1,
-0.1256127, 0.4576639, 0.1042905, 0, 0, 0, 1, 1,
-0.1238354, -0.4179363, -4.524141, 0, 0, 0, 1, 1,
-0.1232843, -1.389028, -3.455028, 0, 0, 0, 1, 1,
-0.1216422, -1.058447, -3.079825, 0, 0, 0, 1, 1,
-0.1179575, 1.271504, 1.700387, 0, 0, 0, 1, 1,
-0.1155256, -2.269382, -3.806217, 0, 0, 0, 1, 1,
-0.1145052, -0.1587998, -3.692449, 1, 1, 1, 1, 1,
-0.1061495, -0.3237431, -2.189587, 1, 1, 1, 1, 1,
-0.1024934, 1.001897, -0.7485506, 1, 1, 1, 1, 1,
-0.09577927, -1.309172, -2.968434, 1, 1, 1, 1, 1,
-0.09172038, 0.4449994, 1.382963, 1, 1, 1, 1, 1,
-0.09130093, 0.3132047, -1.12642, 1, 1, 1, 1, 1,
-0.0910146, -1.26072, -3.117408, 1, 1, 1, 1, 1,
-0.08569612, -0.2303524, -1.922761, 1, 1, 1, 1, 1,
-0.07867295, -1.578862, -2.785573, 1, 1, 1, 1, 1,
-0.0776577, 0.05289475, -0.08769374, 1, 1, 1, 1, 1,
-0.07504821, 0.51795, -0.5926785, 1, 1, 1, 1, 1,
-0.06859457, -1.504391, -2.901799, 1, 1, 1, 1, 1,
-0.06674521, -1.390069, -2.931172, 1, 1, 1, 1, 1,
-0.06470153, 1.034336, -1.836298, 1, 1, 1, 1, 1,
-0.06405231, -0.86439, -4.005147, 1, 1, 1, 1, 1,
-0.06329184, -0.5856979, -1.276657, 0, 0, 1, 1, 1,
-0.06179395, 2.476699, -1.287551, 1, 0, 0, 1, 1,
-0.06129735, -1.368657, -2.302849, 1, 0, 0, 1, 1,
-0.05964743, 1.658427, -0.9837524, 1, 0, 0, 1, 1,
-0.05253165, -1.831367, -2.972213, 1, 0, 0, 1, 1,
-0.05159949, -0.4584064, -4.39272, 1, 0, 0, 1, 1,
-0.05142466, 0.1369072, 0.2298348, 0, 0, 0, 1, 1,
-0.04502535, 0.3334129, 0.0801487, 0, 0, 0, 1, 1,
-0.04406078, -0.4099971, -3.099607, 0, 0, 0, 1, 1,
-0.04328982, -0.4692193, -3.144521, 0, 0, 0, 1, 1,
-0.0407274, 0.789809, 0.214248, 0, 0, 0, 1, 1,
-0.03960895, -1.327279, -2.74615, 0, 0, 0, 1, 1,
-0.0321266, 0.5499056, -0.7785859, 0, 0, 0, 1, 1,
-0.03141259, 0.01935359, -1.294237, 1, 1, 1, 1, 1,
-0.02961407, -1.97671, -3.729323, 1, 1, 1, 1, 1,
-0.02153369, -0.6576408, -1.897718, 1, 1, 1, 1, 1,
-0.01318234, 0.8217441, 0.9051461, 1, 1, 1, 1, 1,
-0.01056298, 0.2088807, -0.6274539, 1, 1, 1, 1, 1,
-0.01038214, -0.7104843, -3.310437, 1, 1, 1, 1, 1,
-0.007094329, -0.9126393, -3.682332, 1, 1, 1, 1, 1,
-0.006180524, 1.136342, -0.7263407, 1, 1, 1, 1, 1,
-0.006049349, 0.7048016, 1.781815, 1, 1, 1, 1, 1,
-0.003958773, -0.7513473, -2.969676, 1, 1, 1, 1, 1,
0.003953396, -1.077186, 3.802212, 1, 1, 1, 1, 1,
0.006055205, 0.2409368, 0.2164089, 1, 1, 1, 1, 1,
0.008799922, -1.139868, 3.534518, 1, 1, 1, 1, 1,
0.01103672, -0.4575222, 2.258571, 1, 1, 1, 1, 1,
0.01414311, 0.68991, 1.375309, 1, 1, 1, 1, 1,
0.01695434, -0.9561816, 2.585195, 0, 0, 1, 1, 1,
0.01747855, 0.2153918, -0.3484172, 1, 0, 0, 1, 1,
0.01818589, -0.01179135, 1.954024, 1, 0, 0, 1, 1,
0.02696143, 0.3057417, 0.1938969, 1, 0, 0, 1, 1,
0.03176478, -0.1693118, 1.274506, 1, 0, 0, 1, 1,
0.03457025, 0.8940344, 0.7095009, 1, 0, 0, 1, 1,
0.03614066, -1.06739, 4.475335, 0, 0, 0, 1, 1,
0.04142393, -0.2834479, 2.148388, 0, 0, 0, 1, 1,
0.04410533, 1.428469, 0.5887277, 0, 0, 0, 1, 1,
0.05110238, 0.4650812, -0.0316953, 0, 0, 0, 1, 1,
0.05282238, -0.4985435, 2.639195, 0, 0, 0, 1, 1,
0.05506278, 1.358279, -0.7479927, 0, 0, 0, 1, 1,
0.06229521, 1.613774, 0.1611241, 0, 0, 0, 1, 1,
0.06272165, -0.8603474, 3.589651, 1, 1, 1, 1, 1,
0.06370468, -0.08240844, 0.3841298, 1, 1, 1, 1, 1,
0.06413986, -0.5442247, 1.485753, 1, 1, 1, 1, 1,
0.06526375, -0.9491063, 3.801796, 1, 1, 1, 1, 1,
0.07639614, -0.2365816, 3.717457, 1, 1, 1, 1, 1,
0.08540745, 0.9164653, 0.2780278, 1, 1, 1, 1, 1,
0.08582237, 0.7172461, 0.7830391, 1, 1, 1, 1, 1,
0.08625442, 1.168069, -0.8614673, 1, 1, 1, 1, 1,
0.08789178, 0.1619869, 1.004499, 1, 1, 1, 1, 1,
0.08924162, 0.5984012, -0.9021435, 1, 1, 1, 1, 1,
0.09219248, 0.1597559, 1.138957, 1, 1, 1, 1, 1,
0.09431428, -1.596547, 4.269354, 1, 1, 1, 1, 1,
0.09589377, 0.7816392, 0.9345981, 1, 1, 1, 1, 1,
0.1011396, 0.1089719, 0.5000371, 1, 1, 1, 1, 1,
0.1047946, 0.6714491, 0.2466637, 1, 1, 1, 1, 1,
0.1054518, 0.8263146, 1.223541, 0, 0, 1, 1, 1,
0.1085481, 2.395706, 0.04784958, 1, 0, 0, 1, 1,
0.1091382, 0.04927655, 0.4758931, 1, 0, 0, 1, 1,
0.1102918, -0.8476497, 3.357205, 1, 0, 0, 1, 1,
0.1116342, 1.055778, 0.4645965, 1, 0, 0, 1, 1,
0.1165848, -1.034739, 1.596306, 1, 0, 0, 1, 1,
0.1171217, 0.5822595, -0.4052103, 0, 0, 0, 1, 1,
0.1187203, 2.255931, -0.8006332, 0, 0, 0, 1, 1,
0.1202999, 0.2559438, 0.5308775, 0, 0, 0, 1, 1,
0.1220132, -0.6023663, 1.268658, 0, 0, 0, 1, 1,
0.1220778, 1.501346, 0.571644, 0, 0, 0, 1, 1,
0.1248755, -2.268075, 1.75087, 0, 0, 0, 1, 1,
0.1251235, -0.9897767, 3.507279, 0, 0, 0, 1, 1,
0.1286519, 1.084335, 0.6367059, 1, 1, 1, 1, 1,
0.1321334, 0.3635561, 1.45687, 1, 1, 1, 1, 1,
0.1322404, -2.010249, 4.047725, 1, 1, 1, 1, 1,
0.1325753, 0.03027625, -0.178526, 1, 1, 1, 1, 1,
0.1329502, -1.700226, 4.091127, 1, 1, 1, 1, 1,
0.1370717, 1.230126, 1.047362, 1, 1, 1, 1, 1,
0.1405917, -0.6637523, 1.196734, 1, 1, 1, 1, 1,
0.1435684, -0.9723889, 2.008155, 1, 1, 1, 1, 1,
0.1440865, 0.9174609, -0.005222621, 1, 1, 1, 1, 1,
0.1449952, 1.435186, 1.743804, 1, 1, 1, 1, 1,
0.1489211, 0.5400589, -0.01405581, 1, 1, 1, 1, 1,
0.1529586, 1.275436, 1.667859, 1, 1, 1, 1, 1,
0.1569687, -1.135381, 5.714378, 1, 1, 1, 1, 1,
0.1575378, 1.391088, -0.2377045, 1, 1, 1, 1, 1,
0.1594514, -0.6491293, 2.339442, 1, 1, 1, 1, 1,
0.160355, 0.8453256, 0.3683091, 0, 0, 1, 1, 1,
0.1619989, 0.5493397, 1.389697, 1, 0, 0, 1, 1,
0.1639345, 0.4284182, -0.2792519, 1, 0, 0, 1, 1,
0.1662699, -2.14287, 2.009988, 1, 0, 0, 1, 1,
0.1676164, -1.03397, 2.984512, 1, 0, 0, 1, 1,
0.1694416, 1.602902, -0.5273882, 1, 0, 0, 1, 1,
0.1710555, 0.09837551, 0.1038003, 0, 0, 0, 1, 1,
0.1712255, -0.6773424, 2.522932, 0, 0, 0, 1, 1,
0.1716903, -0.9189987, 0.8299272, 0, 0, 0, 1, 1,
0.1738666, 0.9780535, -0.009700655, 0, 0, 0, 1, 1,
0.1832186, -0.5217907, 2.198755, 0, 0, 0, 1, 1,
0.1853286, -1.816691, 1.595801, 0, 0, 0, 1, 1,
0.1889456, 1.116812, -0.05843657, 0, 0, 0, 1, 1,
0.1921342, 1.459409, 0.6730027, 1, 1, 1, 1, 1,
0.1940314, -0.9963146, 3.280437, 1, 1, 1, 1, 1,
0.1945728, 1.40247, 0.6968316, 1, 1, 1, 1, 1,
0.1972012, 0.5231845, -1.16144, 1, 1, 1, 1, 1,
0.1989266, -1.160201, 3.084431, 1, 1, 1, 1, 1,
0.2007474, -0.5175985, 4.501437, 1, 1, 1, 1, 1,
0.2011253, -0.5009228, 2.772768, 1, 1, 1, 1, 1,
0.2011729, -1.950868, 3.082174, 1, 1, 1, 1, 1,
0.2054469, -1.580142, 3.205256, 1, 1, 1, 1, 1,
0.2063217, -0.438508, 1.828289, 1, 1, 1, 1, 1,
0.2093451, 0.5276831, 1.527194, 1, 1, 1, 1, 1,
0.2122513, 1.384716, 2.178087, 1, 1, 1, 1, 1,
0.2136796, 1.682043, 0.9025259, 1, 1, 1, 1, 1,
0.2147724, -0.2636553, 4.228633, 1, 1, 1, 1, 1,
0.2175702, 0.04874804, 1.903639, 1, 1, 1, 1, 1,
0.2194685, 1.188206, 0.3634638, 0, 0, 1, 1, 1,
0.2210429, 0.1502247, 0.6525941, 1, 0, 0, 1, 1,
0.2214184, -0.7809092, 3.800527, 1, 0, 0, 1, 1,
0.2218402, -0.9153678, 3.349602, 1, 0, 0, 1, 1,
0.2223587, -0.6455405, 1.900388, 1, 0, 0, 1, 1,
0.2232103, 0.8565128, 0.3412002, 1, 0, 0, 1, 1,
0.2272608, 1.580741, -1.215373, 0, 0, 0, 1, 1,
0.2297639, -0.7275533, 1.726946, 0, 0, 0, 1, 1,
0.2308224, 2.116668, -0.2664301, 0, 0, 0, 1, 1,
0.235042, 1.358315, 1.414029, 0, 0, 0, 1, 1,
0.2387712, 1.751786, -0.7173615, 0, 0, 0, 1, 1,
0.2418826, 1.391489, -1.191378, 0, 0, 0, 1, 1,
0.2420289, 1.279678, 0.1188564, 0, 0, 0, 1, 1,
0.2439, -0.3514031, 1.809197, 1, 1, 1, 1, 1,
0.2462502, 1.220792, 0.8689595, 1, 1, 1, 1, 1,
0.2469636, 1.260243, -1.325151, 1, 1, 1, 1, 1,
0.2471548, 0.5604259, 1.29184, 1, 1, 1, 1, 1,
0.2475923, 0.7286142, -0.765969, 1, 1, 1, 1, 1,
0.2515945, -0.3310857, 2.433777, 1, 1, 1, 1, 1,
0.254063, 0.04691134, 0.8175095, 1, 1, 1, 1, 1,
0.2554757, -1.78023, 2.175566, 1, 1, 1, 1, 1,
0.2560115, 0.03372483, 0.7192715, 1, 1, 1, 1, 1,
0.2567265, -0.3596007, 3.245636, 1, 1, 1, 1, 1,
0.2580981, -0.8556966, 3.36744, 1, 1, 1, 1, 1,
0.2774867, 0.4648366, 2.163154, 1, 1, 1, 1, 1,
0.2791127, -0.4403532, 2.387503, 1, 1, 1, 1, 1,
0.2800727, 0.2447815, 0.1510199, 1, 1, 1, 1, 1,
0.2808361, 1.987075, -0.8134969, 1, 1, 1, 1, 1,
0.2866323, -0.2178466, 2.489701, 0, 0, 1, 1, 1,
0.2881317, 0.6767581, 0.5932047, 1, 0, 0, 1, 1,
0.2883192, 1.032791, -0.4310144, 1, 0, 0, 1, 1,
0.2885467, -0.6643814, 4.071124, 1, 0, 0, 1, 1,
0.2921417, -1.10522, 4.28944, 1, 0, 0, 1, 1,
0.2969482, 0.4979362, 0.9534057, 1, 0, 0, 1, 1,
0.2992114, -0.3958879, 4.814682, 0, 0, 0, 1, 1,
0.29963, -1.883808, 2.909271, 0, 0, 0, 1, 1,
0.3062784, 0.6279855, -0.2381092, 0, 0, 0, 1, 1,
0.306316, -1.151309, 3.402643, 0, 0, 0, 1, 1,
0.3068161, -1.181156, 2.381842, 0, 0, 0, 1, 1,
0.3121264, -0.2470469, 3.629044, 0, 0, 0, 1, 1,
0.3136322, -0.01386719, 1.229736, 0, 0, 0, 1, 1,
0.3279722, 0.349627, -0.9674128, 1, 1, 1, 1, 1,
0.330231, 1.158781, -0.4892955, 1, 1, 1, 1, 1,
0.3307532, -0.3484626, 3.842769, 1, 1, 1, 1, 1,
0.3307591, -1.679684, 3.387518, 1, 1, 1, 1, 1,
0.3307787, 0.2043088, 1.466909, 1, 1, 1, 1, 1,
0.334435, -0.03690548, 1.570225, 1, 1, 1, 1, 1,
0.3348679, -0.1733924, 2.395871, 1, 1, 1, 1, 1,
0.3378567, -0.6281729, 1.396462, 1, 1, 1, 1, 1,
0.3379264, 1.993933, 2.459978, 1, 1, 1, 1, 1,
0.3458345, 1.319351, -0.4677462, 1, 1, 1, 1, 1,
0.3515734, -0.9811507, 2.996723, 1, 1, 1, 1, 1,
0.3525864, -1.484606, 3.497723, 1, 1, 1, 1, 1,
0.3537308, -0.2368475, 3.209101, 1, 1, 1, 1, 1,
0.3540344, -1.039932, 5.104904, 1, 1, 1, 1, 1,
0.3612254, -0.3689615, 1.595606, 1, 1, 1, 1, 1,
0.3620696, -0.335663, 1.171524, 0, 0, 1, 1, 1,
0.3639909, 0.9498994, -1.105668, 1, 0, 0, 1, 1,
0.3643369, 0.17595, 1.665566, 1, 0, 0, 1, 1,
0.3666109, -0.1113555, 2.958333, 1, 0, 0, 1, 1,
0.368391, -1.217006, 3.612578, 1, 0, 0, 1, 1,
0.3687966, -0.7699862, 4.424326, 1, 0, 0, 1, 1,
0.370252, -0.2866757, 2.877372, 0, 0, 0, 1, 1,
0.3709596, -0.425979, 2.901758, 0, 0, 0, 1, 1,
0.3715921, -1.557678, 3.92665, 0, 0, 0, 1, 1,
0.3734556, 0.9064566, 0.299871, 0, 0, 0, 1, 1,
0.3750359, 0.3146651, 2.549142, 0, 0, 0, 1, 1,
0.3764157, 0.09125865, 2.19808, 0, 0, 0, 1, 1,
0.3820935, 0.4319908, 0.9253415, 0, 0, 0, 1, 1,
0.3829565, 1.632975, -0.3661583, 1, 1, 1, 1, 1,
0.3836201, -1.036345, 2.027017, 1, 1, 1, 1, 1,
0.3856098, -1.373733, 2.502366, 1, 1, 1, 1, 1,
0.3885455, 0.04505565, 1.643453, 1, 1, 1, 1, 1,
0.3911937, -0.08527949, 2.796515, 1, 1, 1, 1, 1,
0.3931179, -0.3553774, 1.754526, 1, 1, 1, 1, 1,
0.3981174, 2.198911, -1.823243, 1, 1, 1, 1, 1,
0.3982003, -0.2877821, 3.488227, 1, 1, 1, 1, 1,
0.4004185, -0.5216024, 2.225892, 1, 1, 1, 1, 1,
0.4051751, 0.3831494, 0.3586883, 1, 1, 1, 1, 1,
0.4053724, -0.3072139, 1.802203, 1, 1, 1, 1, 1,
0.4065771, -1.189461, 3.064593, 1, 1, 1, 1, 1,
0.4073339, -1.05183, 2.415263, 1, 1, 1, 1, 1,
0.4077644, -0.4498042, 3.342809, 1, 1, 1, 1, 1,
0.4136254, -1.169119, 4.450314, 1, 1, 1, 1, 1,
0.4170581, 0.612685, 0.01725013, 0, 0, 1, 1, 1,
0.4172929, 1.442902, -0.9795691, 1, 0, 0, 1, 1,
0.418032, -0.6082774, 1.788425, 1, 0, 0, 1, 1,
0.4182692, 0.1501088, 1.104456, 1, 0, 0, 1, 1,
0.4203359, -0.5514094, 3.909719, 1, 0, 0, 1, 1,
0.4205427, 0.4597888, 0.3621024, 1, 0, 0, 1, 1,
0.4225177, 0.0837821, 2.337906, 0, 0, 0, 1, 1,
0.4239439, 0.7302799, 1.945703, 0, 0, 0, 1, 1,
0.4314135, -0.185147, 0.8932439, 0, 0, 0, 1, 1,
0.4315822, -0.7107647, 2.497122, 0, 0, 0, 1, 1,
0.4322653, -1.946932, 5.855024, 0, 0, 0, 1, 1,
0.4326146, -0.02323434, 0.2453748, 0, 0, 0, 1, 1,
0.4380403, -0.8947785, 1.850393, 0, 0, 0, 1, 1,
0.438235, -1.771433, 2.018768, 1, 1, 1, 1, 1,
0.4436781, -0.02258613, 1.397114, 1, 1, 1, 1, 1,
0.4448322, -0.7069919, 2.838971, 1, 1, 1, 1, 1,
0.4473388, -0.7744173, 3.284881, 1, 1, 1, 1, 1,
0.4531613, 1.733886, 0.7357351, 1, 1, 1, 1, 1,
0.4542382, 1.634723, 0.4736914, 1, 1, 1, 1, 1,
0.4582387, 1.345561, -0.2087648, 1, 1, 1, 1, 1,
0.4588955, 1.549288, 0.4504082, 1, 1, 1, 1, 1,
0.4608655, -0.5416968, 2.053244, 1, 1, 1, 1, 1,
0.4611377, -0.3012968, 2.903351, 1, 1, 1, 1, 1,
0.4613281, -1.009063, 1.826803, 1, 1, 1, 1, 1,
0.4737024, -0.3436048, 1.293582, 1, 1, 1, 1, 1,
0.4748312, 0.5738445, 1.880899, 1, 1, 1, 1, 1,
0.4794076, 0.3778637, -1.699619, 1, 1, 1, 1, 1,
0.487643, -0.09235847, 1.742409, 1, 1, 1, 1, 1,
0.4924715, 0.03469366, 1.627408, 0, 0, 1, 1, 1,
0.4929539, 2.02983, 0.9330982, 1, 0, 0, 1, 1,
0.5004563, -0.2247644, 3.076596, 1, 0, 0, 1, 1,
0.5014237, 0.2349866, 1.252353, 1, 0, 0, 1, 1,
0.5051525, 0.113123, 0.0533317, 1, 0, 0, 1, 1,
0.5071677, 0.7917252, 0.9240027, 1, 0, 0, 1, 1,
0.5141093, -1.439339, 3.698309, 0, 0, 0, 1, 1,
0.5171744, 1.158715, 0.423889, 0, 0, 0, 1, 1,
0.5207998, -0.8646651, 2.854087, 0, 0, 0, 1, 1,
0.5210871, -1.569037, 3.062213, 0, 0, 0, 1, 1,
0.5216279, 0.1498745, 0.6177043, 0, 0, 0, 1, 1,
0.5220286, 0.7802825, 0.3170432, 0, 0, 0, 1, 1,
0.5313016, -1.23866, 2.909117, 0, 0, 0, 1, 1,
0.5352362, -0.01166129, 0.3930176, 1, 1, 1, 1, 1,
0.5364797, 0.2797248, -0.7624252, 1, 1, 1, 1, 1,
0.536532, -0.8647586, 2.916098, 1, 1, 1, 1, 1,
0.5367401, 0.3637848, 2.421196, 1, 1, 1, 1, 1,
0.5441629, -2.239901, 3.678011, 1, 1, 1, 1, 1,
0.545271, 0.1062753, 0.2817352, 1, 1, 1, 1, 1,
0.5454654, -0.2280248, 2.198548, 1, 1, 1, 1, 1,
0.5477213, -0.04473168, 1.797557, 1, 1, 1, 1, 1,
0.5519444, 1.376135, 0.6009527, 1, 1, 1, 1, 1,
0.5548397, -1.518435, 1.640187, 1, 1, 1, 1, 1,
0.5617856, -0.7412398, 2.39994, 1, 1, 1, 1, 1,
0.5650901, -0.487089, 3.146532, 1, 1, 1, 1, 1,
0.5667108, -0.2816408, 3.043804, 1, 1, 1, 1, 1,
0.5688431, -2.032923, 3.706107, 1, 1, 1, 1, 1,
0.571238, -0.2339674, 1.451998, 1, 1, 1, 1, 1,
0.5719072, -0.5468348, 2.681808, 0, 0, 1, 1, 1,
0.5751033, 1.078976, -0.8064678, 1, 0, 0, 1, 1,
0.5789546, -0.04884718, 1.538371, 1, 0, 0, 1, 1,
0.5831007, 1.776881, -0.3244971, 1, 0, 0, 1, 1,
0.5865524, 0.9478338, 1.523461, 1, 0, 0, 1, 1,
0.5927312, 0.4930451, 0.2065727, 1, 0, 0, 1, 1,
0.5957923, -0.003218576, 3.041426, 0, 0, 0, 1, 1,
0.5967478, -1.996738, 3.930522, 0, 0, 0, 1, 1,
0.6073134, 0.1781096, 1.657165, 0, 0, 0, 1, 1,
0.6075314, -0.7347488, 1.563261, 0, 0, 0, 1, 1,
0.6156539, 0.2839441, 1.619611, 0, 0, 0, 1, 1,
0.6167833, -0.7411736, 1.274011, 0, 0, 0, 1, 1,
0.6214059, 0.7127484, -0.7494098, 0, 0, 0, 1, 1,
0.6244353, -0.5739517, 1.691353, 1, 1, 1, 1, 1,
0.6246923, 0.7157195, 1.143345, 1, 1, 1, 1, 1,
0.6255857, -1.412695, 3.902125, 1, 1, 1, 1, 1,
0.6259992, 0.6025001, 0.478833, 1, 1, 1, 1, 1,
0.6278141, 0.7749066, 1.35693, 1, 1, 1, 1, 1,
0.6296925, -0.6768944, 3.35124, 1, 1, 1, 1, 1,
0.6333138, 0.619454, 0.8348505, 1, 1, 1, 1, 1,
0.6373756, -1.137287, 1.818091, 1, 1, 1, 1, 1,
0.6394129, 1.728845, 1.025289, 1, 1, 1, 1, 1,
0.6456583, -0.1646029, 1.956769, 1, 1, 1, 1, 1,
0.6485213, -1.52485, 1.854945, 1, 1, 1, 1, 1,
0.6493677, -2.281304, 3.284791, 1, 1, 1, 1, 1,
0.6503804, -2.00402, 3.920631, 1, 1, 1, 1, 1,
0.6540751, -0.8630688, 2.776102, 1, 1, 1, 1, 1,
0.656856, -0.926116, 1.614132, 1, 1, 1, 1, 1,
0.6576436, -0.7934822, 3.314395, 0, 0, 1, 1, 1,
0.6578386, 1.004519, 1.144161, 1, 0, 0, 1, 1,
0.6598147, -1.386227, 2.962415, 1, 0, 0, 1, 1,
0.6636142, 0.6980799, 1.525432, 1, 0, 0, 1, 1,
0.6649526, -0.7330302, 1.548323, 1, 0, 0, 1, 1,
0.6681613, -1.827396, 3.172798, 1, 0, 0, 1, 1,
0.670386, -0.1690043, 1.959676, 0, 0, 0, 1, 1,
0.6734626, -0.6799629, 2.661372, 0, 0, 0, 1, 1,
0.6845622, -0.5984261, 1.67137, 0, 0, 0, 1, 1,
0.6868786, 0.9176694, -1.651228, 0, 0, 0, 1, 1,
0.6915427, -0.4147083, 2.179885, 0, 0, 0, 1, 1,
0.6941116, -0.1539277, 1.598648, 0, 0, 0, 1, 1,
0.6965103, 1.462592, -0.6576559, 0, 0, 0, 1, 1,
0.6966709, -0.216912, 1.194267, 1, 1, 1, 1, 1,
0.7019048, -0.7945177, 0.8275022, 1, 1, 1, 1, 1,
0.7065417, -0.3955528, 3.02319, 1, 1, 1, 1, 1,
0.7072753, -0.3125986, 1.59292, 1, 1, 1, 1, 1,
0.7109487, 0.7686082, -1.013186, 1, 1, 1, 1, 1,
0.7140735, -0.626189, 0.9856616, 1, 1, 1, 1, 1,
0.7148896, 0.6578506, 2.988933, 1, 1, 1, 1, 1,
0.7216227, -2.187593, 2.711522, 1, 1, 1, 1, 1,
0.7235221, 0.7993319, 1.062324, 1, 1, 1, 1, 1,
0.7260031, -0.06035949, 1.526054, 1, 1, 1, 1, 1,
0.7266921, 0.0938673, 1.890514, 1, 1, 1, 1, 1,
0.7268722, 0.5631354, 2.205964, 1, 1, 1, 1, 1,
0.7310171, -1.729017, 3.41386, 1, 1, 1, 1, 1,
0.731386, -0.6537384, 3.509033, 1, 1, 1, 1, 1,
0.7416064, -0.4584329, 2.360707, 1, 1, 1, 1, 1,
0.7484993, 0.800091, 1.39616, 0, 0, 1, 1, 1,
0.7514997, -1.079096, 3.213858, 1, 0, 0, 1, 1,
0.7664201, 0.3940995, 0.9154338, 1, 0, 0, 1, 1,
0.7683527, 0.002314531, 0.3074351, 1, 0, 0, 1, 1,
0.7726519, 0.1007676, 2.095625, 1, 0, 0, 1, 1,
0.7765827, -0.08389932, 1.564629, 1, 0, 0, 1, 1,
0.7827556, -1.674556, 1.547338, 0, 0, 0, 1, 1,
0.7851172, 0.3928578, -1.032546, 0, 0, 0, 1, 1,
0.7871595, 0.08626854, 1.743734, 0, 0, 0, 1, 1,
0.7934887, 0.8504174, -0.3481485, 0, 0, 0, 1, 1,
0.8038697, -0.4439905, 2.531497, 0, 0, 0, 1, 1,
0.8044322, -0.8680062, 2.292353, 0, 0, 0, 1, 1,
0.8062971, -1.781973, 2.626452, 0, 0, 0, 1, 1,
0.814425, -0.311154, 1.821355, 1, 1, 1, 1, 1,
0.8162465, 0.03415629, 1.275524, 1, 1, 1, 1, 1,
0.8237234, 0.2339275, 1.551003, 1, 1, 1, 1, 1,
0.8245767, 0.8176116, 3.103183, 1, 1, 1, 1, 1,
0.8279706, 0.451825, 0.6951247, 1, 1, 1, 1, 1,
0.8333782, 0.5600033, 0.4507563, 1, 1, 1, 1, 1,
0.8337414, -0.6028286, 0.05833917, 1, 1, 1, 1, 1,
0.8342742, -0.1559708, 3.385437, 1, 1, 1, 1, 1,
0.8370994, 0.3648026, 1.719946, 1, 1, 1, 1, 1,
0.8407173, 1.010526, 0.7236512, 1, 1, 1, 1, 1,
0.8407977, 0.8216907, 0.9805952, 1, 1, 1, 1, 1,
0.8424938, 2.596942, 0.8833146, 1, 1, 1, 1, 1,
0.842975, -0.8925362, 2.093811, 1, 1, 1, 1, 1,
0.8456249, 0.9905516, -0.4365499, 1, 1, 1, 1, 1,
0.8465565, 0.975632, -1.175377, 1, 1, 1, 1, 1,
0.8500096, 1.227503, 0.7079534, 0, 0, 1, 1, 1,
0.8525812, 1.181979, 2.461704, 1, 0, 0, 1, 1,
0.8566527, -0.5576476, 2.372115, 1, 0, 0, 1, 1,
0.858931, 0.103662, -0.9865646, 1, 0, 0, 1, 1,
0.8594905, -0.2404237, 2.191109, 1, 0, 0, 1, 1,
0.8621443, -1.251113, 1.172876, 1, 0, 0, 1, 1,
0.8710377, 0.5083127, 0.2843101, 0, 0, 0, 1, 1,
0.874616, -0.09827311, 1.829387, 0, 0, 0, 1, 1,
0.8787858, 1.022288, -0.5172232, 0, 0, 0, 1, 1,
0.8807812, 0.4546035, 1.416031, 0, 0, 0, 1, 1,
0.8818942, 0.6715299, 1.208763, 0, 0, 0, 1, 1,
0.8854041, 0.1981187, 2.294016, 0, 0, 0, 1, 1,
0.8914604, -0.3859569, 1.211725, 0, 0, 0, 1, 1,
0.8926012, 1.024018, 0.7595643, 1, 1, 1, 1, 1,
0.905158, -0.7917298, 3.30882, 1, 1, 1, 1, 1,
0.9091867, -1.360933, 2.784598, 1, 1, 1, 1, 1,
0.9103519, 0.0759755, 0.1105408, 1, 1, 1, 1, 1,
0.9235584, 0.7405767, 2.258688, 1, 1, 1, 1, 1,
0.9236575, 0.6445354, 0.7403682, 1, 1, 1, 1, 1,
0.9285164, 0.06628409, 2.15901, 1, 1, 1, 1, 1,
0.9304135, -1.521388, 2.635406, 1, 1, 1, 1, 1,
0.9318401, 0.1314577, 1.534751, 1, 1, 1, 1, 1,
0.933651, 1.727811, 0.6800442, 1, 1, 1, 1, 1,
0.9342625, -0.1119897, 1.076014, 1, 1, 1, 1, 1,
0.9357093, -0.5759538, 0.7461447, 1, 1, 1, 1, 1,
0.9389401, -1.413623, 3.268245, 1, 1, 1, 1, 1,
0.939785, 0.1795336, 2.46203, 1, 1, 1, 1, 1,
0.9420529, -1.317312, 1.558386, 1, 1, 1, 1, 1,
0.9441503, -0.2917856, 1.887435, 0, 0, 1, 1, 1,
0.9445862, 1.161153, -0.5911306, 1, 0, 0, 1, 1,
0.947112, -0.06277107, 0.8894991, 1, 0, 0, 1, 1,
0.9509419, -0.2148202, 1.818318, 1, 0, 0, 1, 1,
0.9569677, 3.075408, 0.6696694, 1, 0, 0, 1, 1,
0.9573027, 1.907871, 3.072369, 1, 0, 0, 1, 1,
0.9596616, -0.5415824, 2.396736, 0, 0, 0, 1, 1,
0.960009, -1.197431, 2.042183, 0, 0, 0, 1, 1,
0.9611346, 1.22722, -1.223383, 0, 0, 0, 1, 1,
0.9627588, -0.9688433, 1.983399, 0, 0, 0, 1, 1,
0.9681602, -1.150314, 2.316543, 0, 0, 0, 1, 1,
0.9694071, 0.4263341, 3.372277, 0, 0, 0, 1, 1,
0.9786216, 0.1845623, 3.093091, 0, 0, 0, 1, 1,
0.9838178, -0.118052, 1.480258, 1, 1, 1, 1, 1,
0.9845337, -0.9298211, 3.392948, 1, 1, 1, 1, 1,
0.9922126, -1.227114, 3.282067, 1, 1, 1, 1, 1,
0.9925023, 0.4225526, 1.259718, 1, 1, 1, 1, 1,
0.9942806, 0.4117891, -0.4546325, 1, 1, 1, 1, 1,
0.9959813, 0.3872921, 0.9817376, 1, 1, 1, 1, 1,
1.000652, -0.1248346, 3.072068, 1, 1, 1, 1, 1,
1.004693, 0.268194, 1.211417, 1, 1, 1, 1, 1,
1.008289, -0.4811062, 1.693856, 1, 1, 1, 1, 1,
1.015776, 1.000107, 0.250206, 1, 1, 1, 1, 1,
1.016794, -0.2246329, 2.857799, 1, 1, 1, 1, 1,
1.018918, 0.3620186, 1.566431, 1, 1, 1, 1, 1,
1.020921, 0.1517472, 2.19363, 1, 1, 1, 1, 1,
1.027966, -2.24319, 4.057396, 1, 1, 1, 1, 1,
1.036639, 0.2144679, 2.789445, 1, 1, 1, 1, 1,
1.041483, -0.06353857, 0.8513165, 0, 0, 1, 1, 1,
1.044317, 0.2766166, 3.193012, 1, 0, 0, 1, 1,
1.048363, -0.4116178, 1.210762, 1, 0, 0, 1, 1,
1.049859, 0.05920525, 0.2882105, 1, 0, 0, 1, 1,
1.050413, 0.4111242, 1.389046, 1, 0, 0, 1, 1,
1.050655, 0.3651042, 3.09277, 1, 0, 0, 1, 1,
1.062036, 0.9676899, -0.3859518, 0, 0, 0, 1, 1,
1.065843, -1.407799, 2.730854, 0, 0, 0, 1, 1,
1.07265, 0.795696, 2.328721, 0, 0, 0, 1, 1,
1.072914, 0.3265916, 1.571675, 0, 0, 0, 1, 1,
1.073819, 0.02206416, 2.074703, 0, 0, 0, 1, 1,
1.082444, 0.4019903, 1.364344, 0, 0, 0, 1, 1,
1.083143, -1.817791, 4.036232, 0, 0, 0, 1, 1,
1.090435, -0.6461232, 2.598601, 1, 1, 1, 1, 1,
1.097798, 0.1240797, 1.116653, 1, 1, 1, 1, 1,
1.116462, -1.543015, 0.7540752, 1, 1, 1, 1, 1,
1.118965, -0.2341121, 2.244791, 1, 1, 1, 1, 1,
1.129794, 1.571129, -0.576593, 1, 1, 1, 1, 1,
1.139203, -1.713682, 4.093863, 1, 1, 1, 1, 1,
1.141432, 1.166626, 1.90135, 1, 1, 1, 1, 1,
1.148443, 0.4858525, 2.852628, 1, 1, 1, 1, 1,
1.153182, -2.084987, 2.22256, 1, 1, 1, 1, 1,
1.156212, 0.08030632, 0.5413765, 1, 1, 1, 1, 1,
1.162452, -1.049937, 1.955713, 1, 1, 1, 1, 1,
1.165125, -0.603661, 1.809469, 1, 1, 1, 1, 1,
1.167794, -0.4971527, 1.305015, 1, 1, 1, 1, 1,
1.180654, -0.587117, 0.6905063, 1, 1, 1, 1, 1,
1.183109, 0.2403617, 1.162845, 1, 1, 1, 1, 1,
1.191486, -0.1596588, 2.524732, 0, 0, 1, 1, 1,
1.197439, 1.509264, 0.03867731, 1, 0, 0, 1, 1,
1.198175, 0.1300014, 1.361331, 1, 0, 0, 1, 1,
1.200188, 0.1846693, 1.857405, 1, 0, 0, 1, 1,
1.203387, -1.455431, 2.297601, 1, 0, 0, 1, 1,
1.205561, 0.6719919, 1.995889, 1, 0, 0, 1, 1,
1.20795, -0.1503387, 1.552656, 0, 0, 0, 1, 1,
1.208356, -0.1662034, 0.6454398, 0, 0, 0, 1, 1,
1.21615, -1.029024, 2.802865, 0, 0, 0, 1, 1,
1.225023, 2.768848, 2.267982, 0, 0, 0, 1, 1,
1.225445, 0.9932563, 0.7365086, 0, 0, 0, 1, 1,
1.226288, 0.976795, 0.8192109, 0, 0, 0, 1, 1,
1.227763, -1.250946, 3.45861, 0, 0, 0, 1, 1,
1.240389, 0.8648633, 0.6417278, 1, 1, 1, 1, 1,
1.250892, 0.7679947, -0.6275975, 1, 1, 1, 1, 1,
1.251661, -1.926885, 2.721121, 1, 1, 1, 1, 1,
1.254141, 0.6140516, 1.592129, 1, 1, 1, 1, 1,
1.25456, 1.755824, 1.399638, 1, 1, 1, 1, 1,
1.26149, -0.4339665, 2.590564, 1, 1, 1, 1, 1,
1.261951, -0.01046296, 1.029162, 1, 1, 1, 1, 1,
1.262786, 0.3416626, 2.201158, 1, 1, 1, 1, 1,
1.263906, 0.3668411, 2.427235, 1, 1, 1, 1, 1,
1.264778, -0.7089655, 2.831529, 1, 1, 1, 1, 1,
1.266841, -0.3133617, 2.17204, 1, 1, 1, 1, 1,
1.267004, -0.3804725, 1.552897, 1, 1, 1, 1, 1,
1.268746, -1.791969, 2.740683, 1, 1, 1, 1, 1,
1.274278, -2.540604, 2.087362, 1, 1, 1, 1, 1,
1.290838, 0.8224551, 1.071674, 1, 1, 1, 1, 1,
1.304215, -0.3940741, 0.8489478, 0, 0, 1, 1, 1,
1.32086, 0.637719, 0.6241904, 1, 0, 0, 1, 1,
1.321412, -0.3945908, 2.690066, 1, 0, 0, 1, 1,
1.325681, -0.6635059, 1.611171, 1, 0, 0, 1, 1,
1.33099, -0.3503758, 2.145919, 1, 0, 0, 1, 1,
1.334793, 1.349025, 0.8864695, 1, 0, 0, 1, 1,
1.337123, -0.2775276, 1.892796, 0, 0, 0, 1, 1,
1.342337, -2.470834, 4.414691, 0, 0, 0, 1, 1,
1.343123, 0.1839944, 2.629078, 0, 0, 0, 1, 1,
1.348555, -1.666443, 2.482922, 0, 0, 0, 1, 1,
1.351423, -0.5035486, 2.111857, 0, 0, 0, 1, 1,
1.354837, 0.7541514, 0.6115142, 0, 0, 0, 1, 1,
1.357289, -0.7992621, 2.917244, 0, 0, 0, 1, 1,
1.358907, 1.163992, 1.684613, 1, 1, 1, 1, 1,
1.375227, -0.2011477, -0.3519356, 1, 1, 1, 1, 1,
1.38505, -0.5669568, 1.333519, 1, 1, 1, 1, 1,
1.392927, 0.3226233, 2.246309, 1, 1, 1, 1, 1,
1.39375, -0.8917118, 3.167317, 1, 1, 1, 1, 1,
1.409554, 0.2774502, 0.9242852, 1, 1, 1, 1, 1,
1.414853, 1.754078, 0.2024557, 1, 1, 1, 1, 1,
1.418602, 0.1084561, 1.989208, 1, 1, 1, 1, 1,
1.423614, -0.1760859, 0.6086891, 1, 1, 1, 1, 1,
1.425976, 0.9497135, 2.591263, 1, 1, 1, 1, 1,
1.426415, 0.8028362, 1.761913, 1, 1, 1, 1, 1,
1.427294, 0.03862315, 1.556147, 1, 1, 1, 1, 1,
1.429125, 0.08215436, 1.27048, 1, 1, 1, 1, 1,
1.441214, -0.7748612, 2.622651, 1, 1, 1, 1, 1,
1.442708, 0.3838037, 0.3471283, 1, 1, 1, 1, 1,
1.44322, -0.04299476, 2.873839, 0, 0, 1, 1, 1,
1.444178, -0.7807978, 1.809621, 1, 0, 0, 1, 1,
1.451194, 0.3158488, 1.342765, 1, 0, 0, 1, 1,
1.460408, -0.02981436, 2.484662, 1, 0, 0, 1, 1,
1.463155, -0.2071146, 2.174496, 1, 0, 0, 1, 1,
1.471116, -0.8464757, 0.5525804, 1, 0, 0, 1, 1,
1.475749, -0.04854813, 2.100829, 0, 0, 0, 1, 1,
1.477021, 0.7360649, 2.877898, 0, 0, 0, 1, 1,
1.481471, 1.827437, 1.534332, 0, 0, 0, 1, 1,
1.49522, 0.02334664, 1.004432, 0, 0, 0, 1, 1,
1.504342, -0.7932153, 2.008034, 0, 0, 0, 1, 1,
1.509149, 0.8278883, -0.01285973, 0, 0, 0, 1, 1,
1.514068, 0.2423097, 0.6522387, 0, 0, 0, 1, 1,
1.528142, 0.9155768, 0.8840675, 1, 1, 1, 1, 1,
1.561407, 0.5633086, 0.2440729, 1, 1, 1, 1, 1,
1.583052, -1.244247, 2.172298, 1, 1, 1, 1, 1,
1.596454, -0.2636948, 1.05138, 1, 1, 1, 1, 1,
1.60061, 1.331849, 0.8760557, 1, 1, 1, 1, 1,
1.607976, 0.2884867, 1.993168, 1, 1, 1, 1, 1,
1.614723, 0.9280652, -1.110025, 1, 1, 1, 1, 1,
1.618408, 1.025067, 1.678616, 1, 1, 1, 1, 1,
1.637499, 0.154667, 0.3420934, 1, 1, 1, 1, 1,
1.650253, -0.5704665, 1.246375, 1, 1, 1, 1, 1,
1.651837, -1.292962, 2.134431, 1, 1, 1, 1, 1,
1.652737, -0.6192771, 2.842109, 1, 1, 1, 1, 1,
1.65327, 0.7239839, -0.03924293, 1, 1, 1, 1, 1,
1.687914, -0.9426486, 1.099036, 1, 1, 1, 1, 1,
1.689552, -0.2197577, 1.891308, 1, 1, 1, 1, 1,
1.701148, 1.087569, 1.235438, 0, 0, 1, 1, 1,
1.701982, 1.494891, 2.361548, 1, 0, 0, 1, 1,
1.713986, 1.304557, 0.4060338, 1, 0, 0, 1, 1,
1.737911, -0.9365643, 1.274907, 1, 0, 0, 1, 1,
1.739292, 1.085651, 1.425259, 1, 0, 0, 1, 1,
1.741369, -0.7154897, 1.520323, 1, 0, 0, 1, 1,
1.749294, 1.118063, 0.9253933, 0, 0, 0, 1, 1,
1.763627, -0.5652682, 1.114268, 0, 0, 0, 1, 1,
1.792723, -0.1168626, 1.342307, 0, 0, 0, 1, 1,
1.806989, 1.809502, -0.0360488, 0, 0, 0, 1, 1,
1.817429, 0.2225588, 0.7150684, 0, 0, 0, 1, 1,
1.856665, 1.531695, -2.25288, 0, 0, 0, 1, 1,
1.859955, 0.3784049, 0.1966402, 0, 0, 0, 1, 1,
1.860391, -0.3217155, 1.557954, 1, 1, 1, 1, 1,
1.861599, 0.7271374, 1.697727, 1, 1, 1, 1, 1,
1.862972, 1.16205, -0.4050618, 1, 1, 1, 1, 1,
1.874618, -1.142905, 2.978927, 1, 1, 1, 1, 1,
1.892182, 0.7006748, 0.04488336, 1, 1, 1, 1, 1,
1.914044, 1.099445, 0.9881684, 1, 1, 1, 1, 1,
1.927553, -0.2556576, 2.860912, 1, 1, 1, 1, 1,
1.937718, 1.063574, 1.502982, 1, 1, 1, 1, 1,
1.946281, 2.105842, -0.2565319, 1, 1, 1, 1, 1,
1.94649, -0.6234587, 2.924893, 1, 1, 1, 1, 1,
1.978416, 0.0701478, 1.476915, 1, 1, 1, 1, 1,
1.98954, 0.3861884, 2.58005, 1, 1, 1, 1, 1,
2.025853, 0.5004964, 1.258174, 1, 1, 1, 1, 1,
2.040041, -0.2721781, 0.5577879, 1, 1, 1, 1, 1,
2.041528, 0.1538964, -0.3040666, 1, 1, 1, 1, 1,
2.042418, 0.07759766, 3.604269, 0, 0, 1, 1, 1,
2.120064, -1.443277, 1.453632, 1, 0, 0, 1, 1,
2.160453, -1.930863, 1.884462, 1, 0, 0, 1, 1,
2.166094, -1.369954, 3.205964, 1, 0, 0, 1, 1,
2.2248, 0.05876018, 1.510718, 1, 0, 0, 1, 1,
2.250922, -0.06118398, 2.178542, 1, 0, 0, 1, 1,
2.270537, 0.841889, 0.6232598, 0, 0, 0, 1, 1,
2.3052, -0.1977661, 2.762332, 0, 0, 0, 1, 1,
2.325851, -1.166649, 2.389086, 0, 0, 0, 1, 1,
2.355352, -0.02986649, 0.4281527, 0, 0, 0, 1, 1,
2.365418, -0.4572146, 1.01625, 0, 0, 0, 1, 1,
2.396332, -0.07673489, 0.7795225, 0, 0, 0, 1, 1,
2.459369, -0.4378366, 1.961959, 0, 0, 0, 1, 1,
2.475314, -1.866631, 0.3927813, 1, 1, 1, 1, 1,
2.581179, 0.2357827, 1.116498, 1, 1, 1, 1, 1,
2.929301, -0.05794565, 3.512749, 1, 1, 1, 1, 1,
2.962682, -0.6945466, 1.191096, 1, 1, 1, 1, 1,
3.106713, -2.146423, 1.254068, 1, 1, 1, 1, 1,
3.202168, -0.6170838, 1.344485, 1, 1, 1, 1, 1,
3.616868, 0.9883083, 2.314134, 1, 1, 1, 1, 1
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
var radius = 9.645424;
var distance = 33.87914;
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
mvMatrix.translate( -0.315766, -0.1648723, -0.2902691 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.87914);
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
