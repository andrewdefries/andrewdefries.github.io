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
-3.278138, 0.7458305, -0.09374096, 1, 0, 0, 1,
-3.093872, 0.004117985, -1.166483, 1, 0.007843138, 0, 1,
-2.89727, -2.116826, -3.143124, 1, 0.01176471, 0, 1,
-2.807838, -0.4893407, -1.352316, 1, 0.01960784, 0, 1,
-2.770804, 1.643808, 0.1304506, 1, 0.02352941, 0, 1,
-2.760296, 0.338089, -1.318515, 1, 0.03137255, 0, 1,
-2.725739, 1.76397, -1.246281, 1, 0.03529412, 0, 1,
-2.694328, 2.029268, -1.956666, 1, 0.04313726, 0, 1,
-2.652454, -0.01684061, -0.7390844, 1, 0.04705882, 0, 1,
-2.587556, -0.9046254, -2.274903, 1, 0.05490196, 0, 1,
-2.534418, 1.716767, 0.2349837, 1, 0.05882353, 0, 1,
-2.484587, 0.2631201, -2.712037, 1, 0.06666667, 0, 1,
-2.415034, -0.1995429, -0.1893687, 1, 0.07058824, 0, 1,
-2.41486, 0.38029, -1.31792, 1, 0.07843138, 0, 1,
-2.350251, 0.2899953, -2.42924, 1, 0.08235294, 0, 1,
-2.324041, 0.4365118, -0.7646059, 1, 0.09019608, 0, 1,
-2.29761, 0.8575792, 0.1709095, 1, 0.09411765, 0, 1,
-2.293096, -0.6587396, -1.191363, 1, 0.1019608, 0, 1,
-2.280327, -0.6127155, -2.187691, 1, 0.1098039, 0, 1,
-2.272169, -0.3791471, -2.252808, 1, 0.1137255, 0, 1,
-2.194939, 0.8540772, -0.4558835, 1, 0.1215686, 0, 1,
-2.125289, 0.6751004, -1.193042, 1, 0.1254902, 0, 1,
-2.109968, -0.9711902, -2.408589, 1, 0.1333333, 0, 1,
-2.106105, -0.3907547, -2.128738, 1, 0.1372549, 0, 1,
-2.09035, -0.269371, -1.584805, 1, 0.145098, 0, 1,
-2.078228, 0.7179182, -0.857967, 1, 0.1490196, 0, 1,
-2.067299, 0.6529874, -1.617095, 1, 0.1568628, 0, 1,
-2.051521, 0.9950707, -1.474731, 1, 0.1607843, 0, 1,
-2.048015, -0.56879, -0.2388387, 1, 0.1686275, 0, 1,
-2.038743, -0.9465789, -4.329733, 1, 0.172549, 0, 1,
-2.004, 1.278461, -0.8978318, 1, 0.1803922, 0, 1,
-1.992868, 0.955736, -0.1481847, 1, 0.1843137, 0, 1,
-1.934898, -0.8833739, -2.321575, 1, 0.1921569, 0, 1,
-1.931442, 0.8312553, -1.825848, 1, 0.1960784, 0, 1,
-1.922566, -0.5233816, -1.479122, 1, 0.2039216, 0, 1,
-1.917083, 0.8280688, -1.409999, 1, 0.2117647, 0, 1,
-1.9142, 1.880194, 0.3977784, 1, 0.2156863, 0, 1,
-1.908697, 1.114876, -1.839649, 1, 0.2235294, 0, 1,
-1.901307, -0.4525867, -2.887107, 1, 0.227451, 0, 1,
-1.896769, -0.05714158, -3.414803, 1, 0.2352941, 0, 1,
-1.863032, -0.09689121, -0.7081271, 1, 0.2392157, 0, 1,
-1.852304, -1.343306, -2.249856, 1, 0.2470588, 0, 1,
-1.796877, 0.5035121, -2.288713, 1, 0.2509804, 0, 1,
-1.796874, -1.117527, -0.4053352, 1, 0.2588235, 0, 1,
-1.78702, -0.1105193, -1.101819, 1, 0.2627451, 0, 1,
-1.754237, -0.9159436, -2.485372, 1, 0.2705882, 0, 1,
-1.750486, 0.5905484, -0.42931, 1, 0.2745098, 0, 1,
-1.732255, 0.5102791, 0.05282654, 1, 0.282353, 0, 1,
-1.72685, 0.5953207, -1.022646, 1, 0.2862745, 0, 1,
-1.721055, -0.3224566, -2.520565, 1, 0.2941177, 0, 1,
-1.715002, 0.2799087, -0.5585306, 1, 0.3019608, 0, 1,
-1.694984, 0.5248877, -2.029199, 1, 0.3058824, 0, 1,
-1.685593, -0.3757943, -2.245938, 1, 0.3137255, 0, 1,
-1.675795, 0.9148706, 1.113021, 1, 0.3176471, 0, 1,
-1.640652, -0.4903817, -2.050329, 1, 0.3254902, 0, 1,
-1.636903, 0.9702685, -1.533315, 1, 0.3294118, 0, 1,
-1.628694, 0.4417566, -3.952626, 1, 0.3372549, 0, 1,
-1.621305, -0.5985829, -2.766109, 1, 0.3411765, 0, 1,
-1.62058, 1.170416, 0.3397131, 1, 0.3490196, 0, 1,
-1.618804, 1.270526, -2.281983, 1, 0.3529412, 0, 1,
-1.603465, 0.2418821, 0.03895926, 1, 0.3607843, 0, 1,
-1.564081, 1.257546, -1.495561, 1, 0.3647059, 0, 1,
-1.562119, 0.03709812, -1.184296, 1, 0.372549, 0, 1,
-1.559494, 1.187483, -2.089782, 1, 0.3764706, 0, 1,
-1.548226, 1.923172, -0.8680182, 1, 0.3843137, 0, 1,
-1.543546, 1.442398, -1.311804, 1, 0.3882353, 0, 1,
-1.538435, -0.4730059, -0.7105958, 1, 0.3960784, 0, 1,
-1.534503, 0.3567907, -2.822883, 1, 0.4039216, 0, 1,
-1.534171, -1.851318, -2.781905, 1, 0.4078431, 0, 1,
-1.525198, 0.0589845, -3.250518, 1, 0.4156863, 0, 1,
-1.524677, -0.7931895, -0.7150653, 1, 0.4196078, 0, 1,
-1.478894, 1.322909, -1.397465, 1, 0.427451, 0, 1,
-1.464193, 0.998017, 1.551442, 1, 0.4313726, 0, 1,
-1.449118, 0.9442301, -1.139189, 1, 0.4392157, 0, 1,
-1.448613, 0.8656453, -0.4559507, 1, 0.4431373, 0, 1,
-1.446966, 0.1185883, -0.5451506, 1, 0.4509804, 0, 1,
-1.430565, 1.424059, -0.496986, 1, 0.454902, 0, 1,
-1.421515, 0.5642535, -1.330349, 1, 0.4627451, 0, 1,
-1.416458, -0.5457585, -0.4826036, 1, 0.4666667, 0, 1,
-1.41214, -1.091573, -2.257511, 1, 0.4745098, 0, 1,
-1.401513, -0.5443427, -2.446949, 1, 0.4784314, 0, 1,
-1.401044, -0.3653973, -0.6327813, 1, 0.4862745, 0, 1,
-1.399682, -0.8100199, -3.793292, 1, 0.4901961, 0, 1,
-1.389942, -1.152238, -2.028452, 1, 0.4980392, 0, 1,
-1.386069, 2.93943, 0.07280543, 1, 0.5058824, 0, 1,
-1.370866, 1.095558, 0.5404397, 1, 0.509804, 0, 1,
-1.367979, -0.6460739, -3.709365, 1, 0.5176471, 0, 1,
-1.3646, -2.004427, -1.810788, 1, 0.5215687, 0, 1,
-1.364314, -1.304602, -1.903691, 1, 0.5294118, 0, 1,
-1.344116, 1.468194, 0.1210106, 1, 0.5333334, 0, 1,
-1.339517, 0.01251972, -1.274824, 1, 0.5411765, 0, 1,
-1.321403, -0.7138442, -2.126141, 1, 0.5450981, 0, 1,
-1.307846, 1.70886, -1.956887, 1, 0.5529412, 0, 1,
-1.304039, 0.04990383, -1.057617, 1, 0.5568628, 0, 1,
-1.297073, 1.444974, -0.1815285, 1, 0.5647059, 0, 1,
-1.288842, 0.1574894, -1.558487, 1, 0.5686275, 0, 1,
-1.273494, 0.04347557, -2.435702, 1, 0.5764706, 0, 1,
-1.272282, 0.418606, -1.582298, 1, 0.5803922, 0, 1,
-1.267999, 0.166847, -1.05948, 1, 0.5882353, 0, 1,
-1.266895, 1.986444, -0.7535227, 1, 0.5921569, 0, 1,
-1.264729, 0.1845012, -3.538557, 1, 0.6, 0, 1,
-1.262004, 1.454262, -1.152094, 1, 0.6078432, 0, 1,
-1.252029, -0.1095237, -2.756815, 1, 0.6117647, 0, 1,
-1.250051, -0.896779, -1.966645, 1, 0.6196079, 0, 1,
-1.241703, 0.124102, -0.5894439, 1, 0.6235294, 0, 1,
-1.237032, -1.29999, -1.573929, 1, 0.6313726, 0, 1,
-1.228318, 0.8195668, 0.5223243, 1, 0.6352941, 0, 1,
-1.220148, 1.170691, 0.6228412, 1, 0.6431373, 0, 1,
-1.219697, -0.2036343, 0.6072528, 1, 0.6470588, 0, 1,
-1.219433, 0.6684817, -1.168511, 1, 0.654902, 0, 1,
-1.217546, -0.4195499, -3.049758, 1, 0.6588235, 0, 1,
-1.213544, 0.06202243, -2.493172, 1, 0.6666667, 0, 1,
-1.210078, 0.223655, -0.5186406, 1, 0.6705883, 0, 1,
-1.208644, 0.4572533, -3.168072, 1, 0.6784314, 0, 1,
-1.205944, -0.547446, -1.985305, 1, 0.682353, 0, 1,
-1.204866, -1.568772, -2.486927, 1, 0.6901961, 0, 1,
-1.204066, 0.6907648, -0.8970551, 1, 0.6941177, 0, 1,
-1.203729, -0.8655751, -2.088713, 1, 0.7019608, 0, 1,
-1.194488, 0.8193927, -1.82693, 1, 0.7098039, 0, 1,
-1.182915, 1.641726, -2.166567, 1, 0.7137255, 0, 1,
-1.164924, -0.793718, -2.096662, 1, 0.7215686, 0, 1,
-1.162268, 0.591397, -1.408691, 1, 0.7254902, 0, 1,
-1.159825, -1.864128, -4.272724, 1, 0.7333333, 0, 1,
-1.159663, 0.7383989, -1.490302, 1, 0.7372549, 0, 1,
-1.155917, 2.197099, 0.794553, 1, 0.7450981, 0, 1,
-1.15422, -0.5524338, -0.5585499, 1, 0.7490196, 0, 1,
-1.152911, -0.8284926, -1.38364, 1, 0.7568628, 0, 1,
-1.134117, -0.1316465, -0.05860285, 1, 0.7607843, 0, 1,
-1.13387, 0.3168873, -2.387347, 1, 0.7686275, 0, 1,
-1.128477, 0.8820104, -2.158026, 1, 0.772549, 0, 1,
-1.117072, -1.683136, -2.495227, 1, 0.7803922, 0, 1,
-1.116009, -0.7152449, -1.681918, 1, 0.7843137, 0, 1,
-1.103738, -0.8357381, -2.336368, 1, 0.7921569, 0, 1,
-1.10183, -1.944057, -2.376863, 1, 0.7960784, 0, 1,
-1.097685, -0.4784033, -2.842337, 1, 0.8039216, 0, 1,
-1.092159, 0.6317743, -1.0917, 1, 0.8117647, 0, 1,
-1.08744, 2.292787, -2.615562, 1, 0.8156863, 0, 1,
-1.081946, 1.499278, 0.01195402, 1, 0.8235294, 0, 1,
-1.079489, -0.1352429, -0.3576164, 1, 0.827451, 0, 1,
-1.077201, -0.1068225, -2.908309, 1, 0.8352941, 0, 1,
-1.074918, -1.152568, -3.382172, 1, 0.8392157, 0, 1,
-1.07398, -0.03516958, -2.500371, 1, 0.8470588, 0, 1,
-1.070486, -0.5792597, -2.718371, 1, 0.8509804, 0, 1,
-1.069291, 0.2596833, -2.645529, 1, 0.8588235, 0, 1,
-1.067575, -0.8307324, -2.061926, 1, 0.8627451, 0, 1,
-1.065416, -0.8728071, -1.89349, 1, 0.8705882, 0, 1,
-1.063216, 0.6325424, -2.732638, 1, 0.8745098, 0, 1,
-1.062104, -0.4640196, -0.3928092, 1, 0.8823529, 0, 1,
-1.059045, 0.3791637, -0.3932103, 1, 0.8862745, 0, 1,
-1.058687, 1.284328, 0.4992634, 1, 0.8941177, 0, 1,
-1.050388, -1.994903, -2.944171, 1, 0.8980392, 0, 1,
-1.043895, 1.350441, -1.776462, 1, 0.9058824, 0, 1,
-1.037941, 1.124203, 0.2298326, 1, 0.9137255, 0, 1,
-1.034132, 0.5496026, -1.019796, 1, 0.9176471, 0, 1,
-1.020798, 1.846661, 0.5501807, 1, 0.9254902, 0, 1,
-1.020547, -0.9881623, -2.694929, 1, 0.9294118, 0, 1,
-1.007449, 0.1172442, -2.779598, 1, 0.9372549, 0, 1,
-1.005671, -0.1898321, -2.740824, 1, 0.9411765, 0, 1,
-1.003753, -0.09740007, -3.060248, 1, 0.9490196, 0, 1,
-1.001394, 0.8110828, -0.09469336, 1, 0.9529412, 0, 1,
-0.9994299, -0.7314696, -1.486982, 1, 0.9607843, 0, 1,
-0.994661, -0.5807894, -0.5288056, 1, 0.9647059, 0, 1,
-0.9873676, -0.4148386, -1.298825, 1, 0.972549, 0, 1,
-0.9846962, 0.05868118, -1.533134, 1, 0.9764706, 0, 1,
-0.9795539, -2.017482, -3.92114, 1, 0.9843137, 0, 1,
-0.9755738, -0.2481443, -2.332085, 1, 0.9882353, 0, 1,
-0.9677035, 0.9463112, -0.5095574, 1, 0.9960784, 0, 1,
-0.9521822, 0.8552468, 0.4156732, 0.9960784, 1, 0, 1,
-0.9494002, -1.044045, -2.597672, 0.9921569, 1, 0, 1,
-0.9490103, 0.343043, -0.6298246, 0.9843137, 1, 0, 1,
-0.9487311, 0.5259447, -2.084013, 0.9803922, 1, 0, 1,
-0.9430487, 0.1671119, -1.547422, 0.972549, 1, 0, 1,
-0.940995, 0.5305097, -0.7293925, 0.9686275, 1, 0, 1,
-0.9331118, 2.02356, -1.38128, 0.9607843, 1, 0, 1,
-0.9187542, -1.027597, -1.000381, 0.9568627, 1, 0, 1,
-0.9138737, 1.038925, 0.01877172, 0.9490196, 1, 0, 1,
-0.905158, -1.80538, -3.534605, 0.945098, 1, 0, 1,
-0.9042318, -0.04129302, -2.58558, 0.9372549, 1, 0, 1,
-0.895126, -1.131069, -1.109656, 0.9333333, 1, 0, 1,
-0.8946936, 0.8767165, -0.08954864, 0.9254902, 1, 0, 1,
-0.8775142, -0.03120099, -2.28688, 0.9215686, 1, 0, 1,
-0.8772412, 1.664262, 0.5505663, 0.9137255, 1, 0, 1,
-0.8770789, -0.4104024, -0.9364765, 0.9098039, 1, 0, 1,
-0.876628, 1.128625, 0.3907809, 0.9019608, 1, 0, 1,
-0.8677015, 1.94426, -0.1316525, 0.8941177, 1, 0, 1,
-0.852808, 0.2535217, -1.076397, 0.8901961, 1, 0, 1,
-0.8471988, 0.4640467, -1.906352, 0.8823529, 1, 0, 1,
-0.8459111, -0.055198, -1.65604, 0.8784314, 1, 0, 1,
-0.8452763, 1.250034, -2.083474, 0.8705882, 1, 0, 1,
-0.8440339, 0.7125405, 0.1004875, 0.8666667, 1, 0, 1,
-0.8419845, -0.5661515, -2.157569, 0.8588235, 1, 0, 1,
-0.8408588, 0.8462341, -1.426954, 0.854902, 1, 0, 1,
-0.8388042, 0.4451172, -0.9585367, 0.8470588, 1, 0, 1,
-0.8349094, 0.7701828, -0.6347969, 0.8431373, 1, 0, 1,
-0.8310155, 1.446849, -2.221741, 0.8352941, 1, 0, 1,
-0.8305623, -1.583283, -3.109346, 0.8313726, 1, 0, 1,
-0.8237529, 1.355353, -1.311277, 0.8235294, 1, 0, 1,
-0.8061872, 0.3218779, 0.5531952, 0.8196079, 1, 0, 1,
-0.8048732, 0.4058641, -0.001672523, 0.8117647, 1, 0, 1,
-0.8024525, -0.1126666, -0.3869082, 0.8078431, 1, 0, 1,
-0.8014328, 0.4750011, -0.9322886, 0.8, 1, 0, 1,
-0.7941009, -1.242427, -1.746574, 0.7921569, 1, 0, 1,
-0.7899894, 0.4452499, -0.09265711, 0.7882353, 1, 0, 1,
-0.7896049, 0.04091633, -1.338805, 0.7803922, 1, 0, 1,
-0.7852014, -0.366906, -1.490909, 0.7764706, 1, 0, 1,
-0.783232, 0.06024001, 0.5855449, 0.7686275, 1, 0, 1,
-0.7831148, -1.610837, -1.444458, 0.7647059, 1, 0, 1,
-0.7790645, -0.956368, -1.658707, 0.7568628, 1, 0, 1,
-0.7780926, -1.044028, -3.015244, 0.7529412, 1, 0, 1,
-0.7779086, 0.2282581, -2.655743, 0.7450981, 1, 0, 1,
-0.7774404, -0.3168135, -1.87895, 0.7411765, 1, 0, 1,
-0.773967, 0.4174972, -1.852577, 0.7333333, 1, 0, 1,
-0.756158, -0.02669442, -2.962332, 0.7294118, 1, 0, 1,
-0.7549058, -1.086716, -1.761337, 0.7215686, 1, 0, 1,
-0.7534735, 1.552813, 0.3100096, 0.7176471, 1, 0, 1,
-0.7484946, -0.0925449, -0.2422228, 0.7098039, 1, 0, 1,
-0.7480554, -0.1997876, -2.04452, 0.7058824, 1, 0, 1,
-0.7473392, 0.8205577, -1.972961, 0.6980392, 1, 0, 1,
-0.7433428, -0.936593, -3.094592, 0.6901961, 1, 0, 1,
-0.7409463, -0.8207998, -0.8884514, 0.6862745, 1, 0, 1,
-0.7349701, 0.1738683, -3.367962, 0.6784314, 1, 0, 1,
-0.7316288, -0.6436446, -3.15713, 0.6745098, 1, 0, 1,
-0.7267843, 0.1603722, -2.195713, 0.6666667, 1, 0, 1,
-0.7170367, 0.7415754, 0.1983153, 0.6627451, 1, 0, 1,
-0.7061796, 0.3363248, -2.235486, 0.654902, 1, 0, 1,
-0.696631, -0.2127492, -1.832188, 0.6509804, 1, 0, 1,
-0.6927825, -0.9049914, -3.866554, 0.6431373, 1, 0, 1,
-0.6917061, -0.6646971, -1.073955, 0.6392157, 1, 0, 1,
-0.691216, -0.1838196, -1.725807, 0.6313726, 1, 0, 1,
-0.6898906, 1.497772, 0.7429095, 0.627451, 1, 0, 1,
-0.6885523, -0.009859428, -1.511823, 0.6196079, 1, 0, 1,
-0.6882712, -1.10425, -0.862877, 0.6156863, 1, 0, 1,
-0.6816702, 0.9469097, -2.298679, 0.6078432, 1, 0, 1,
-0.6783065, 1.166739, -1.085909, 0.6039216, 1, 0, 1,
-0.6773415, -1.427262, -4.180406, 0.5960785, 1, 0, 1,
-0.6695605, 0.2264693, -2.6359, 0.5882353, 1, 0, 1,
-0.6664641, -0.7649855, -2.745965, 0.5843138, 1, 0, 1,
-0.6639373, 1.092555, -1.023152, 0.5764706, 1, 0, 1,
-0.6606618, -1.531607, -3.57115, 0.572549, 1, 0, 1,
-0.660226, -0.6261498, -3.647367, 0.5647059, 1, 0, 1,
-0.6550428, 0.1394602, -1.998071, 0.5607843, 1, 0, 1,
-0.651425, 1.810241, -0.818786, 0.5529412, 1, 0, 1,
-0.6504204, -2.113456, -2.429554, 0.5490196, 1, 0, 1,
-0.6500378, -0.3312559, -1.413433, 0.5411765, 1, 0, 1,
-0.6457479, -0.4335709, -1.825996, 0.5372549, 1, 0, 1,
-0.6337878, 0.7581209, 0.2737009, 0.5294118, 1, 0, 1,
-0.6334742, 0.6732998, -1.530838, 0.5254902, 1, 0, 1,
-0.6328799, -0.8093914, -1.82086, 0.5176471, 1, 0, 1,
-0.6293145, -0.5539373, -2.515584, 0.5137255, 1, 0, 1,
-0.6240857, -0.2457353, -2.163933, 0.5058824, 1, 0, 1,
-0.6238809, -0.2815109, -0.8437728, 0.5019608, 1, 0, 1,
-0.6218093, -0.004836326, -2.459447, 0.4941176, 1, 0, 1,
-0.6193939, 0.2124457, -2.130389, 0.4862745, 1, 0, 1,
-0.6168807, 0.3805066, -0.2902796, 0.4823529, 1, 0, 1,
-0.6164933, 0.2461717, -0.4121784, 0.4745098, 1, 0, 1,
-0.6139935, 0.3365534, 0.4274642, 0.4705882, 1, 0, 1,
-0.6107741, 0.8982691, -1.877647, 0.4627451, 1, 0, 1,
-0.6033376, 2.068011, -0.8448277, 0.4588235, 1, 0, 1,
-0.5990468, -0.7675137, -0.3945123, 0.4509804, 1, 0, 1,
-0.5989546, 0.5667726, -0.6650678, 0.4470588, 1, 0, 1,
-0.5958324, -0.228701, -1.669202, 0.4392157, 1, 0, 1,
-0.5942141, 0.5647226, -1.409258, 0.4352941, 1, 0, 1,
-0.590324, 1.483316, -1.187938, 0.427451, 1, 0, 1,
-0.589562, -0.8860026, -1.133464, 0.4235294, 1, 0, 1,
-0.5876625, 0.3354943, -0.4643084, 0.4156863, 1, 0, 1,
-0.5835547, 0.1548995, -2.246651, 0.4117647, 1, 0, 1,
-0.5833061, 1.163528, 0.4885527, 0.4039216, 1, 0, 1,
-0.5734535, 0.7436365, 0.02190531, 0.3960784, 1, 0, 1,
-0.567628, -0.9116885, -2.634313, 0.3921569, 1, 0, 1,
-0.5666077, 1.230762, -1.041793, 0.3843137, 1, 0, 1,
-0.5577441, -0.4212523, -2.039882, 0.3803922, 1, 0, 1,
-0.5551647, 0.4445209, -1.282395, 0.372549, 1, 0, 1,
-0.5546169, 0.9321122, 0.08932552, 0.3686275, 1, 0, 1,
-0.5542795, 0.1759917, -3.327876, 0.3607843, 1, 0, 1,
-0.548435, 1.402187, 0.02797015, 0.3568628, 1, 0, 1,
-0.5464237, 1.932343, -0.1189146, 0.3490196, 1, 0, 1,
-0.5456498, 0.9793218, -0.05274398, 0.345098, 1, 0, 1,
-0.5415139, -0.1242507, -2.194246, 0.3372549, 1, 0, 1,
-0.5312096, -1.271765, -0.981295, 0.3333333, 1, 0, 1,
-0.5227223, -2.920513, -5.257195, 0.3254902, 1, 0, 1,
-0.5176381, -0.7773031, -5.17515, 0.3215686, 1, 0, 1,
-0.5166474, 0.9967297, -0.2310225, 0.3137255, 1, 0, 1,
-0.5133312, 1.765, -2.548376, 0.3098039, 1, 0, 1,
-0.5127012, 1.115194, -0.6933247, 0.3019608, 1, 0, 1,
-0.5124052, -0.08772296, -2.3604, 0.2941177, 1, 0, 1,
-0.5115014, 0.05766068, -1.711369, 0.2901961, 1, 0, 1,
-0.5110499, 0.2859218, -2.005247, 0.282353, 1, 0, 1,
-0.5106177, -0.4454012, -1.651508, 0.2784314, 1, 0, 1,
-0.5082219, -1.545527, -3.744912, 0.2705882, 1, 0, 1,
-0.5072061, 0.009152817, -0.8255131, 0.2666667, 1, 0, 1,
-0.5071675, 0.4882829, 1.180123, 0.2588235, 1, 0, 1,
-0.5048937, 0.4653185, -1.075685, 0.254902, 1, 0, 1,
-0.5011154, 1.678701, 0.8296766, 0.2470588, 1, 0, 1,
-0.4989654, -0.7611568, -1.705226, 0.2431373, 1, 0, 1,
-0.4948802, -0.09614066, -3.812662, 0.2352941, 1, 0, 1,
-0.4947016, -0.4308315, -3.191749, 0.2313726, 1, 0, 1,
-0.4910001, 0.03141477, 0.9208253, 0.2235294, 1, 0, 1,
-0.4887085, 0.1031989, -0.001982981, 0.2196078, 1, 0, 1,
-0.488681, 0.1628356, -1.671084, 0.2117647, 1, 0, 1,
-0.4883601, -2.035801, -3.30969, 0.2078431, 1, 0, 1,
-0.4878083, 0.9057843, -0.8796073, 0.2, 1, 0, 1,
-0.4877724, 0.6800482, 0.7508609, 0.1921569, 1, 0, 1,
-0.487047, -0.517186, -1.915403, 0.1882353, 1, 0, 1,
-0.4841742, -0.3934335, -3.153534, 0.1803922, 1, 0, 1,
-0.4836407, 0.5476282, -0.8501596, 0.1764706, 1, 0, 1,
-0.4809232, 0.1924853, -2.343955, 0.1686275, 1, 0, 1,
-0.4780401, -0.205852, -3.286413, 0.1647059, 1, 0, 1,
-0.4778377, -0.5219277, -1.967318, 0.1568628, 1, 0, 1,
-0.4753478, 1.409943, -0.3149731, 0.1529412, 1, 0, 1,
-0.4715431, 0.6826541, 0.2654753, 0.145098, 1, 0, 1,
-0.4710865, 0.5984094, -2.303634, 0.1411765, 1, 0, 1,
-0.4704905, -0.2750306, -0.8337908, 0.1333333, 1, 0, 1,
-0.4656408, -0.6066395, -1.323802, 0.1294118, 1, 0, 1,
-0.4655965, 0.738382, -1.147195, 0.1215686, 1, 0, 1,
-0.4639414, 1.837672, 0.5897397, 0.1176471, 1, 0, 1,
-0.4632403, -0.02212905, -3.082554, 0.1098039, 1, 0, 1,
-0.4629179, 0.8110812, -0.2217135, 0.1058824, 1, 0, 1,
-0.4593768, -0.5078124, -3.43497, 0.09803922, 1, 0, 1,
-0.4568585, -0.2447231, -1.904347, 0.09019608, 1, 0, 1,
-0.456654, -1.467428, -2.289405, 0.08627451, 1, 0, 1,
-0.456342, -0.07097012, -1.302337, 0.07843138, 1, 0, 1,
-0.4527396, 1.443787, 0.9322595, 0.07450981, 1, 0, 1,
-0.4525498, -0.8304512, -5.107462, 0.06666667, 1, 0, 1,
-0.4457676, -0.5105984, -2.276372, 0.0627451, 1, 0, 1,
-0.4445393, -0.01677368, -2.175704, 0.05490196, 1, 0, 1,
-0.4439453, 1.100593, 0.6442953, 0.05098039, 1, 0, 1,
-0.4433647, 0.6062614, -1.834738, 0.04313726, 1, 0, 1,
-0.4425949, 1.251146, 0.6617307, 0.03921569, 1, 0, 1,
-0.438799, -0.603699, -2.36192, 0.03137255, 1, 0, 1,
-0.4287792, -0.08314857, -1.877643, 0.02745098, 1, 0, 1,
-0.4266257, 1.195897, 0.6653464, 0.01960784, 1, 0, 1,
-0.4265209, 1.783181, -1.082024, 0.01568628, 1, 0, 1,
-0.4264852, -1.608932, -3.624374, 0.007843138, 1, 0, 1,
-0.4241319, 0.2255674, -0.9994606, 0.003921569, 1, 0, 1,
-0.422261, 1.854083, 1.75687, 0, 1, 0.003921569, 1,
-0.4180918, -0.07118976, -1.523444, 0, 1, 0.01176471, 1,
-0.4166314, -0.493744, -2.199592, 0, 1, 0.01568628, 1,
-0.4165542, -0.04315693, -1.682514, 0, 1, 0.02352941, 1,
-0.4134256, -0.4071342, -2.769243, 0, 1, 0.02745098, 1,
-0.4092942, 2.021456, -1.526653, 0, 1, 0.03529412, 1,
-0.4073493, -0.2064466, -1.442875, 0, 1, 0.03921569, 1,
-0.4056504, 0.4615397, -0.1938212, 0, 1, 0.04705882, 1,
-0.3904327, -1.027432, -1.259456, 0, 1, 0.05098039, 1,
-0.3900259, 1.461352, -1.341599, 0, 1, 0.05882353, 1,
-0.3886902, 0.1812213, 1.737251, 0, 1, 0.0627451, 1,
-0.3885234, -0.3582788, -3.989893, 0, 1, 0.07058824, 1,
-0.3875902, 0.9657159, 0.3754578, 0, 1, 0.07450981, 1,
-0.3869353, -0.3563384, -3.268627, 0, 1, 0.08235294, 1,
-0.3849272, 0.4395993, -2.031984, 0, 1, 0.08627451, 1,
-0.3800545, 0.5052958, 0.7047145, 0, 1, 0.09411765, 1,
-0.3750334, -1.061687, -0.6655723, 0, 1, 0.1019608, 1,
-0.3742907, -0.6888112, -2.582728, 0, 1, 0.1058824, 1,
-0.373845, -0.5374513, -2.148665, 0, 1, 0.1137255, 1,
-0.372916, -0.7206954, -2.431601, 0, 1, 0.1176471, 1,
-0.372281, 0.6870461, -1.868563, 0, 1, 0.1254902, 1,
-0.3669903, -0.2442743, -3.62391, 0, 1, 0.1294118, 1,
-0.3661318, -1.942923, -3.149832, 0, 1, 0.1372549, 1,
-0.3619815, -1.352852, -2.927032, 0, 1, 0.1411765, 1,
-0.3613275, -0.4074484, -0.6946784, 0, 1, 0.1490196, 1,
-0.354661, 0.8972716, -1.195467, 0, 1, 0.1529412, 1,
-0.3500302, 0.328645, -1.883354, 0, 1, 0.1607843, 1,
-0.3495025, -0.143589, -1.525846, 0, 1, 0.1647059, 1,
-0.3487371, -0.7737889, -3.183104, 0, 1, 0.172549, 1,
-0.3443922, 0.666541, -0.5994479, 0, 1, 0.1764706, 1,
-0.3414606, -0.5186415, -1.987679, 0, 1, 0.1843137, 1,
-0.3395497, -0.05839714, -0.609941, 0, 1, 0.1882353, 1,
-0.3386582, -0.02757192, -2.181201, 0, 1, 0.1960784, 1,
-0.3355432, 0.6955128, -1.033289, 0, 1, 0.2039216, 1,
-0.3295287, 1.15987, -0.2641743, 0, 1, 0.2078431, 1,
-0.324813, -0.6313038, -4.157774, 0, 1, 0.2156863, 1,
-0.3208408, 0.3226774, 1.165897, 0, 1, 0.2196078, 1,
-0.3201284, 1.590416, 2.371097, 0, 1, 0.227451, 1,
-0.3182991, -2.378065, -4.183885, 0, 1, 0.2313726, 1,
-0.3099522, 0.5650457, -0.3257672, 0, 1, 0.2392157, 1,
-0.3086584, 0.4467657, -2.126314, 0, 1, 0.2431373, 1,
-0.3077609, 0.3062996, -0.9850339, 0, 1, 0.2509804, 1,
-0.3058512, -0.3967888, -2.891679, 0, 1, 0.254902, 1,
-0.3041022, 0.3042331, -0.7740648, 0, 1, 0.2627451, 1,
-0.3039873, -0.1856176, -0.1221674, 0, 1, 0.2666667, 1,
-0.3031604, 0.9741067, -0.8004864, 0, 1, 0.2745098, 1,
-0.2989666, -1.137542, -0.6765506, 0, 1, 0.2784314, 1,
-0.294239, 0.9563051, -1.477465, 0, 1, 0.2862745, 1,
-0.2935705, 0.3585406, -2.11223, 0, 1, 0.2901961, 1,
-0.2927359, -2.527799, -0.9663226, 0, 1, 0.2980392, 1,
-0.2875032, -0.6298444, -0.719081, 0, 1, 0.3058824, 1,
-0.2808939, 0.2731948, -0.8334652, 0, 1, 0.3098039, 1,
-0.2782974, -1.514223, -3.231263, 0, 1, 0.3176471, 1,
-0.2760634, 0.6568989, -0.918632, 0, 1, 0.3215686, 1,
-0.2745098, 0.1113109, -0.1836521, 0, 1, 0.3294118, 1,
-0.2741087, -0.9451429, -2.531602, 0, 1, 0.3333333, 1,
-0.2738175, 2.762983, -0.348169, 0, 1, 0.3411765, 1,
-0.2734539, 0.6624615, -1.492301, 0, 1, 0.345098, 1,
-0.2696901, 0.4105789, -1.570304, 0, 1, 0.3529412, 1,
-0.2678894, -1.788706, -4.175474, 0, 1, 0.3568628, 1,
-0.266141, -0.2869955, -2.775525, 0, 1, 0.3647059, 1,
-0.2641631, -0.8543695, -2.81776, 0, 1, 0.3686275, 1,
-0.2622904, 0.3745649, 0.6722532, 0, 1, 0.3764706, 1,
-0.2621295, 0.343116, 0.4675713, 0, 1, 0.3803922, 1,
-0.2590812, 0.3985172, -2.447405, 0, 1, 0.3882353, 1,
-0.2575524, -0.1987678, -3.058002, 0, 1, 0.3921569, 1,
-0.2570441, 0.537668, 0.8910029, 0, 1, 0.4, 1,
-0.2552288, 0.1176151, -1.394451, 0, 1, 0.4078431, 1,
-0.255037, -1.211674, -3.156598, 0, 1, 0.4117647, 1,
-0.248546, -0.389812, -2.770284, 0, 1, 0.4196078, 1,
-0.2450847, -1.477415, -2.575396, 0, 1, 0.4235294, 1,
-0.2430842, -0.2365578, -0.8361395, 0, 1, 0.4313726, 1,
-0.2410395, -0.4161423, -1.359719, 0, 1, 0.4352941, 1,
-0.2352715, -1.712877, -2.509333, 0, 1, 0.4431373, 1,
-0.2307732, 1.398545, -0.04617215, 0, 1, 0.4470588, 1,
-0.2245816, -0.6235945, -4.65654, 0, 1, 0.454902, 1,
-0.2230957, -0.8393527, -2.31549, 0, 1, 0.4588235, 1,
-0.2223338, -0.4665604, -2.43717, 0, 1, 0.4666667, 1,
-0.221802, 2.103595, 0.3223053, 0, 1, 0.4705882, 1,
-0.219916, -0.264993, -2.402311, 0, 1, 0.4784314, 1,
-0.2194414, 1.658354, -0.1201027, 0, 1, 0.4823529, 1,
-0.2176276, -1.196799, -2.586253, 0, 1, 0.4901961, 1,
-0.2157432, 0.2583272, -0.5615749, 0, 1, 0.4941176, 1,
-0.2153217, -0.6669496, -2.411702, 0, 1, 0.5019608, 1,
-0.2146696, 1.119548, 0.1583615, 0, 1, 0.509804, 1,
-0.21461, 1.290522, -0.3604169, 0, 1, 0.5137255, 1,
-0.2084501, -0.2444513, -4.770181, 0, 1, 0.5215687, 1,
-0.2053115, -2.081134, -4.211433, 0, 1, 0.5254902, 1,
-0.2023667, 1.206265, -1.711025, 0, 1, 0.5333334, 1,
-0.1972781, 0.2184622, -2.22136, 0, 1, 0.5372549, 1,
-0.1947045, -0.1426956, -1.089326, 0, 1, 0.5450981, 1,
-0.1942163, -0.6844924, -2.473288, 0, 1, 0.5490196, 1,
-0.1927081, 0.1421605, -1.340325, 0, 1, 0.5568628, 1,
-0.1910496, -0.5759126, -3.440669, 0, 1, 0.5607843, 1,
-0.1850307, 0.2120073, -0.4478345, 0, 1, 0.5686275, 1,
-0.1849705, -0.911019, -2.961969, 0, 1, 0.572549, 1,
-0.1759581, -0.5247234, -3.173877, 0, 1, 0.5803922, 1,
-0.1718088, -0.5226358, -4.366019, 0, 1, 0.5843138, 1,
-0.170055, 1.083695, -1.086002, 0, 1, 0.5921569, 1,
-0.1666414, 0.5633883, 1.473065, 0, 1, 0.5960785, 1,
-0.161827, -0.5563857, -2.502128, 0, 1, 0.6039216, 1,
-0.1596918, 0.1942587, 0.01417692, 0, 1, 0.6117647, 1,
-0.1554593, 0.4899531, -1.301063, 0, 1, 0.6156863, 1,
-0.1544089, 0.1880962, -1.445963, 0, 1, 0.6235294, 1,
-0.1442405, -0.012436, -1.989223, 0, 1, 0.627451, 1,
-0.1430498, 0.9748768, -1.768032, 0, 1, 0.6352941, 1,
-0.142005, -1.429096, -3.125302, 0, 1, 0.6392157, 1,
-0.1332573, 1.523788, -1.416557, 0, 1, 0.6470588, 1,
-0.1267763, 0.0999161, -0.4953502, 0, 1, 0.6509804, 1,
-0.123179, 0.279474, -0.5214645, 0, 1, 0.6588235, 1,
-0.1220401, 0.01740119, 0.1599347, 0, 1, 0.6627451, 1,
-0.1187412, 0.630257, 0.09521998, 0, 1, 0.6705883, 1,
-0.1147797, -1.184366, -2.467716, 0, 1, 0.6745098, 1,
-0.1129607, -0.446207, -2.146452, 0, 1, 0.682353, 1,
-0.1054543, 0.07211035, -0.2108859, 0, 1, 0.6862745, 1,
-0.1047326, 0.9060776, 0.5554273, 0, 1, 0.6941177, 1,
-0.1038142, -0.8701187, -3.561589, 0, 1, 0.7019608, 1,
-0.1020558, -0.4785827, -1.895162, 0, 1, 0.7058824, 1,
-0.09811477, 1.146548, -0.2050831, 0, 1, 0.7137255, 1,
-0.09691551, -0.317881, -4.388891, 0, 1, 0.7176471, 1,
-0.08970272, -1.229592, -4.085843, 0, 1, 0.7254902, 1,
-0.08881715, -0.9159253, -1.740434, 0, 1, 0.7294118, 1,
-0.08567493, 2.534322, -0.2165387, 0, 1, 0.7372549, 1,
-0.08189515, 2.556594, -0.0296816, 0, 1, 0.7411765, 1,
-0.07991325, -0.1727494, -1.967942, 0, 1, 0.7490196, 1,
-0.07600974, 0.4351479, -0.8321025, 0, 1, 0.7529412, 1,
-0.07191187, -0.554399, -4.048236, 0, 1, 0.7607843, 1,
-0.06882071, -0.7688534, -2.27899, 0, 1, 0.7647059, 1,
-0.06860831, -0.4702318, -1.87814, 0, 1, 0.772549, 1,
-0.06635479, -0.5929036, -3.365031, 0, 1, 0.7764706, 1,
-0.06448456, -0.5387397, -4.051816, 0, 1, 0.7843137, 1,
-0.06079762, -0.4164477, -3.154935, 0, 1, 0.7882353, 1,
-0.05781846, -0.2032659, -3.755029, 0, 1, 0.7960784, 1,
-0.04710186, -0.214682, -5.320382, 0, 1, 0.8039216, 1,
-0.04530079, -0.6567991, -2.226948, 0, 1, 0.8078431, 1,
-0.03802484, -0.2220687, -2.141572, 0, 1, 0.8156863, 1,
-0.03745935, -0.4983891, -4.227877, 0, 1, 0.8196079, 1,
-0.0360012, 0.1686163, -0.1557321, 0, 1, 0.827451, 1,
-0.0322868, 1.191958, 1.424556, 0, 1, 0.8313726, 1,
-0.02940287, -0.5215654, -1.336352, 0, 1, 0.8392157, 1,
-0.02881271, 0.4142135, 0.9589316, 0, 1, 0.8431373, 1,
-0.02183229, 0.1798986, -2.040766, 0, 1, 0.8509804, 1,
-0.0131629, -0.08934432, -3.333234, 0, 1, 0.854902, 1,
-0.01260097, -0.01513642, -1.170126, 0, 1, 0.8627451, 1,
-0.01153377, 0.6353241, -0.7950351, 0, 1, 0.8666667, 1,
-0.01077792, -0.4691759, -3.075434, 0, 1, 0.8745098, 1,
-0.003498181, 2.284408, 0.1651103, 0, 1, 0.8784314, 1,
-0.001748843, -0.1724101, -2.875984, 0, 1, 0.8862745, 1,
0.001304718, -0.1391293, 3.420475, 0, 1, 0.8901961, 1,
0.00401155, 0.3005716, -0.9900196, 0, 1, 0.8980392, 1,
0.006440111, -1.049858, 2.057964, 0, 1, 0.9058824, 1,
0.007294952, -0.8774609, 3.271418, 0, 1, 0.9098039, 1,
0.007367248, 0.4023578, 1.983326, 0, 1, 0.9176471, 1,
0.009696801, 0.5155984, 0.3151875, 0, 1, 0.9215686, 1,
0.01628057, 0.4573072, -0.3481007, 0, 1, 0.9294118, 1,
0.01671608, 0.2610077, -0.5345754, 0, 1, 0.9333333, 1,
0.01946382, -1.240449, 1.869168, 0, 1, 0.9411765, 1,
0.02541682, -1.200608, 3.832081, 0, 1, 0.945098, 1,
0.02590071, -1.786621, 3.695974, 0, 1, 0.9529412, 1,
0.0262339, 0.7183676, 0.5309131, 0, 1, 0.9568627, 1,
0.02650118, 0.3922298, 0.2648053, 0, 1, 0.9647059, 1,
0.02705255, 1.50341, -1.168731, 0, 1, 0.9686275, 1,
0.02981738, 0.7549697, 0.7649608, 0, 1, 0.9764706, 1,
0.0320888, 0.04469635, 1.118622, 0, 1, 0.9803922, 1,
0.0323917, -1.387421, 2.433723, 0, 1, 0.9882353, 1,
0.03579734, -0.5130678, 3.634394, 0, 1, 0.9921569, 1,
0.0380878, 2.336584, -0.4125526, 0, 1, 1, 1,
0.04076624, 0.503419, -0.1724979, 0, 0.9921569, 1, 1,
0.04228366, -0.5101899, 2.297137, 0, 0.9882353, 1, 1,
0.04478742, -0.0505014, 2.747799, 0, 0.9803922, 1, 1,
0.04505568, -1.542961, 1.232377, 0, 0.9764706, 1, 1,
0.04576067, -1.317027, 4.271755, 0, 0.9686275, 1, 1,
0.0498596, -1.944272, 4.609259, 0, 0.9647059, 1, 1,
0.05307579, 1.748341, 0.9495392, 0, 0.9568627, 1, 1,
0.05990132, 0.5075281, 2.681699, 0, 0.9529412, 1, 1,
0.06102794, 0.3720495, 1.010886, 0, 0.945098, 1, 1,
0.06232567, 0.4633592, 0.1081883, 0, 0.9411765, 1, 1,
0.06911002, -0.12264, 3.178568, 0, 0.9333333, 1, 1,
0.07428344, 0.7955058, -0.6617411, 0, 0.9294118, 1, 1,
0.07462682, 0.6006213, -0.1580535, 0, 0.9215686, 1, 1,
0.07692891, 0.302851, 1.622872, 0, 0.9176471, 1, 1,
0.07900973, -1.309801, 2.511949, 0, 0.9098039, 1, 1,
0.08218551, 0.09266303, 0.07202967, 0, 0.9058824, 1, 1,
0.08360866, -0.2133373, 2.633791, 0, 0.8980392, 1, 1,
0.0842412, 1.260732, 0.07745952, 0, 0.8901961, 1, 1,
0.08743861, -1.60673, 4.293155, 0, 0.8862745, 1, 1,
0.08888882, 0.1218005, 0.3201042, 0, 0.8784314, 1, 1,
0.08955642, -0.2913598, 3.02858, 0, 0.8745098, 1, 1,
0.09384961, -1.517052, 5.075924, 0, 0.8666667, 1, 1,
0.09714516, 0.8581058, 0.7133923, 0, 0.8627451, 1, 1,
0.09783099, -1.597995, 1.284645, 0, 0.854902, 1, 1,
0.1008184, -0.9582879, 2.181277, 0, 0.8509804, 1, 1,
0.1026051, 0.7935607, 0.2553716, 0, 0.8431373, 1, 1,
0.103639, -1.2881, 1.489254, 0, 0.8392157, 1, 1,
0.1038949, 0.01711969, 0.856675, 0, 0.8313726, 1, 1,
0.1060429, 1.499296, 0.883382, 0, 0.827451, 1, 1,
0.1070977, 0.521409, 0.8683636, 0, 0.8196079, 1, 1,
0.1096632, -0.9257805, 4.402151, 0, 0.8156863, 1, 1,
0.1107178, -0.08329644, 1.610479, 0, 0.8078431, 1, 1,
0.1129995, 0.4822303, -1.001819, 0, 0.8039216, 1, 1,
0.1163184, 0.590399, 0.9144408, 0, 0.7960784, 1, 1,
0.1165741, -0.6270205, 2.502184, 0, 0.7882353, 1, 1,
0.1201833, 1.17155, 2.018976, 0, 0.7843137, 1, 1,
0.1211602, -0.8127462, 2.70666, 0, 0.7764706, 1, 1,
0.1222147, -0.523629, 3.707257, 0, 0.772549, 1, 1,
0.122396, 0.9586638, 0.809375, 0, 0.7647059, 1, 1,
0.1241086, -1.157704, 2.533642, 0, 0.7607843, 1, 1,
0.1241274, 0.009039276, 1.848372, 0, 0.7529412, 1, 1,
0.125788, 1.291655, -0.3950311, 0, 0.7490196, 1, 1,
0.1272417, -0.6174682, 2.675135, 0, 0.7411765, 1, 1,
0.1286172, 0.4212321, 0.6015077, 0, 0.7372549, 1, 1,
0.129665, -0.00644375, 0.5064834, 0, 0.7294118, 1, 1,
0.1315165, -0.2752416, 2.42587, 0, 0.7254902, 1, 1,
0.1334688, -0.2531562, 4.30713, 0, 0.7176471, 1, 1,
0.1354451, 0.8440663, -0.5060312, 0, 0.7137255, 1, 1,
0.135647, -1.871172, 3.943369, 0, 0.7058824, 1, 1,
0.1375248, 1.001108, -0.4461185, 0, 0.6980392, 1, 1,
0.1378795, -0.1019559, 2.192172, 0, 0.6941177, 1, 1,
0.1380833, 2.501684, 0.2698341, 0, 0.6862745, 1, 1,
0.1401848, 0.3815631, 0.2186378, 0, 0.682353, 1, 1,
0.1411492, -0.2301787, 3.623122, 0, 0.6745098, 1, 1,
0.1433003, 0.0846269, 0.5668251, 0, 0.6705883, 1, 1,
0.1505027, -0.4610566, 2.212912, 0, 0.6627451, 1, 1,
0.1520543, -2.540131, 3.843157, 0, 0.6588235, 1, 1,
0.153032, 2.117163, 0.3448529, 0, 0.6509804, 1, 1,
0.1538884, -0.4442766, 2.438852, 0, 0.6470588, 1, 1,
0.1553267, -0.6616836, 4.15687, 0, 0.6392157, 1, 1,
0.1564494, -0.7511834, 2.130331, 0, 0.6352941, 1, 1,
0.1578105, 0.3695856, 1.679697, 0, 0.627451, 1, 1,
0.1588444, -1.544986, 3.419723, 0, 0.6235294, 1, 1,
0.1644598, 1.179175, 0.5699022, 0, 0.6156863, 1, 1,
0.1649039, 0.1310342, -0.4833004, 0, 0.6117647, 1, 1,
0.1654508, 0.9801059, -0.2251052, 0, 0.6039216, 1, 1,
0.1712242, -1.650652, 4.264762, 0, 0.5960785, 1, 1,
0.1780854, -0.7691631, 4.559279, 0, 0.5921569, 1, 1,
0.1830878, 0.1106212, 0.8502215, 0, 0.5843138, 1, 1,
0.1899499, 0.7342597, 0.8231834, 0, 0.5803922, 1, 1,
0.1915096, -1.304398, 2.820971, 0, 0.572549, 1, 1,
0.1919606, 1.424937, -0.9842173, 0, 0.5686275, 1, 1,
0.1928611, -0.8992267, 2.028506, 0, 0.5607843, 1, 1,
0.2036235, 0.127581, 1.277632, 0, 0.5568628, 1, 1,
0.2046788, -0.4201298, 2.741285, 0, 0.5490196, 1, 1,
0.2060342, 0.9890736, -0.7535398, 0, 0.5450981, 1, 1,
0.2103823, -2.172661, 1.681204, 0, 0.5372549, 1, 1,
0.2216971, -0.01586982, 0.7326351, 0, 0.5333334, 1, 1,
0.222738, 0.8383294, -0.5027211, 0, 0.5254902, 1, 1,
0.2229691, 0.9417707, 2.104972, 0, 0.5215687, 1, 1,
0.2265047, 1.473871, 0.2744375, 0, 0.5137255, 1, 1,
0.2294005, 1.30136, -0.1752679, 0, 0.509804, 1, 1,
0.2414329, -0.6153972, 3.402952, 0, 0.5019608, 1, 1,
0.2447015, -0.1224046, 1.40612, 0, 0.4941176, 1, 1,
0.2461021, -0.5204512, 4.4417, 0, 0.4901961, 1, 1,
0.2485691, 1.478283, -1.306969, 0, 0.4823529, 1, 1,
0.2485965, 0.2607102, 0.3342153, 0, 0.4784314, 1, 1,
0.2506889, -1.211031, 3.550607, 0, 0.4705882, 1, 1,
0.2528584, 2.094719, 0.4506053, 0, 0.4666667, 1, 1,
0.2529527, -1.321496, 3.630785, 0, 0.4588235, 1, 1,
0.2530874, -0.4831729, 2.839153, 0, 0.454902, 1, 1,
0.2594317, -0.3876348, 3.698715, 0, 0.4470588, 1, 1,
0.2595983, -1.111717, 2.28653, 0, 0.4431373, 1, 1,
0.2639167, -0.4842864, 1.520491, 0, 0.4352941, 1, 1,
0.2647752, 0.3320913, 0.9395227, 0, 0.4313726, 1, 1,
0.2715122, -1.042808, 2.675183, 0, 0.4235294, 1, 1,
0.2725487, -0.06400438, 1.117339, 0, 0.4196078, 1, 1,
0.2768453, -0.3293621, 2.836652, 0, 0.4117647, 1, 1,
0.2827401, -0.06082123, 1.747144, 0, 0.4078431, 1, 1,
0.2845581, -0.1995718, 3.459179, 0, 0.4, 1, 1,
0.2881425, -1.107819, 2.426952, 0, 0.3921569, 1, 1,
0.288769, 0.5501641, -2.492539, 0, 0.3882353, 1, 1,
0.2892437, -0.3109101, 0.4778229, 0, 0.3803922, 1, 1,
0.28989, -1.134535, 4.05167, 0, 0.3764706, 1, 1,
0.2902548, -1.495154, 3.080413, 0, 0.3686275, 1, 1,
0.2917423, 0.05568136, 1.718384, 0, 0.3647059, 1, 1,
0.2960856, -0.4908293, 2.920134, 0, 0.3568628, 1, 1,
0.2988216, -0.9735072, 4.80468, 0, 0.3529412, 1, 1,
0.300238, -1.861017, 3.779211, 0, 0.345098, 1, 1,
0.3029326, -0.9190914, 3.660234, 0, 0.3411765, 1, 1,
0.3039806, -1.341679, 2.955192, 0, 0.3333333, 1, 1,
0.3075601, 0.5642765, -0.3609642, 0, 0.3294118, 1, 1,
0.3095714, -1.230948, 3.094382, 0, 0.3215686, 1, 1,
0.3103847, 1.144123, 2.049527, 0, 0.3176471, 1, 1,
0.3118486, -1.386442, 2.493635, 0, 0.3098039, 1, 1,
0.312248, -1.524583, 2.690581, 0, 0.3058824, 1, 1,
0.3130613, -0.215941, 3.164171, 0, 0.2980392, 1, 1,
0.31468, -0.06581616, 2.196786, 0, 0.2901961, 1, 1,
0.3152337, -0.5497472, 3.219991, 0, 0.2862745, 1, 1,
0.3167514, -0.5225341, 3.171113, 0, 0.2784314, 1, 1,
0.3182892, -0.07189898, 0.8020195, 0, 0.2745098, 1, 1,
0.3208164, -1.508176, 4.121899, 0, 0.2666667, 1, 1,
0.3224634, -1.139747, 1.386083, 0, 0.2627451, 1, 1,
0.3231775, 0.04977955, 0.1294092, 0, 0.254902, 1, 1,
0.3237515, 2.002533, -0.4538023, 0, 0.2509804, 1, 1,
0.3238571, -0.3476474, 2.764595, 0, 0.2431373, 1, 1,
0.3252279, -0.04038798, 1.269911, 0, 0.2392157, 1, 1,
0.3267435, -0.751699, 1.416744, 0, 0.2313726, 1, 1,
0.327632, 0.3279376, 0.1847123, 0, 0.227451, 1, 1,
0.32872, 1.235703, 0.6881333, 0, 0.2196078, 1, 1,
0.3307217, 0.5961761, 0.1387704, 0, 0.2156863, 1, 1,
0.3346887, 0.4175177, 1.60058, 0, 0.2078431, 1, 1,
0.3402959, -1.362017, 2.348239, 0, 0.2039216, 1, 1,
0.3460504, 0.1172171, 1.652722, 0, 0.1960784, 1, 1,
0.3491764, -0.2548539, 1.876458, 0, 0.1882353, 1, 1,
0.3520115, 0.07000875, 1.345672, 0, 0.1843137, 1, 1,
0.3521318, 0.257696, 0.7508662, 0, 0.1764706, 1, 1,
0.3556322, 1.027277, 0.5899429, 0, 0.172549, 1, 1,
0.3558868, -0.5892478, 2.362838, 0, 0.1647059, 1, 1,
0.3567313, -0.4209598, 1.417391, 0, 0.1607843, 1, 1,
0.357145, 0.9786712, 1.969621, 0, 0.1529412, 1, 1,
0.3591285, 0.9588445, 1.066788, 0, 0.1490196, 1, 1,
0.3599743, 2.512794, -0.7924408, 0, 0.1411765, 1, 1,
0.367899, 0.9671996, -0.9712882, 0, 0.1372549, 1, 1,
0.3706483, -0.7866791, 1.894276, 0, 0.1294118, 1, 1,
0.3727347, -1.666628, 3.911066, 0, 0.1254902, 1, 1,
0.3738099, 0.3623431, -0.6788014, 0, 0.1176471, 1, 1,
0.3751977, 1.107989, 0.2642365, 0, 0.1137255, 1, 1,
0.3767861, -0.2498017, 3.258943, 0, 0.1058824, 1, 1,
0.3776955, 0.3999727, 0.7333342, 0, 0.09803922, 1, 1,
0.38407, 0.1417862, -0.05915675, 0, 0.09411765, 1, 1,
0.3857066, -0.8976594, 3.269231, 0, 0.08627451, 1, 1,
0.3868277, 1.467225, 0.4360404, 0, 0.08235294, 1, 1,
0.3869239, 0.7482226, 1.135275, 0, 0.07450981, 1, 1,
0.3902201, -0.1186098, 2.320289, 0, 0.07058824, 1, 1,
0.3933481, 0.2670465, -0.3838251, 0, 0.0627451, 1, 1,
0.3937638, 0.08757726, 0.4255904, 0, 0.05882353, 1, 1,
0.3952002, -0.1480256, 2.295072, 0, 0.05098039, 1, 1,
0.3982983, 1.087156, -0.04129962, 0, 0.04705882, 1, 1,
0.4031371, 0.005226628, 2.594222, 0, 0.03921569, 1, 1,
0.4103549, 1.189392, 1.333964, 0, 0.03529412, 1, 1,
0.411099, 0.3212399, 2.443644, 0, 0.02745098, 1, 1,
0.4123224, 0.9648811, 0.4040804, 0, 0.02352941, 1, 1,
0.4212797, -0.5277297, 1.685969, 0, 0.01568628, 1, 1,
0.4232846, 0.8593567, -1.094349, 0, 0.01176471, 1, 1,
0.426864, 0.5512979, 1.399979, 0, 0.003921569, 1, 1,
0.4348418, 0.991849, 1.206573, 0.003921569, 0, 1, 1,
0.4356974, 0.697904, -1.688822, 0.007843138, 0, 1, 1,
0.4397357, -0.2557367, 1.110482, 0.01568628, 0, 1, 1,
0.4541619, 0.08797155, 3.001945, 0.01960784, 0, 1, 1,
0.4557581, 0.6835536, -1.248247, 0.02745098, 0, 1, 1,
0.4563376, -0.704183, 1.321058, 0.03137255, 0, 1, 1,
0.456948, 1.57177, -0.03809609, 0.03921569, 0, 1, 1,
0.4622824, 2.379137, -1.029948, 0.04313726, 0, 1, 1,
0.4635125, 0.1378481, 2.691878, 0.05098039, 0, 1, 1,
0.4664311, -0.690591, 0.9586367, 0.05490196, 0, 1, 1,
0.4694881, -0.3891254, 1.145244, 0.0627451, 0, 1, 1,
0.473278, -0.3829311, 4.235268, 0.06666667, 0, 1, 1,
0.4766666, -0.4504298, 2.153907, 0.07450981, 0, 1, 1,
0.4837907, 1.188131, 0.4761765, 0.07843138, 0, 1, 1,
0.4840491, 0.4586454, 1.028195, 0.08627451, 0, 1, 1,
0.4852609, 0.430158, 0.6403382, 0.09019608, 0, 1, 1,
0.4863074, 1.2214, 2.551506, 0.09803922, 0, 1, 1,
0.4962748, 0.1921277, -0.343848, 0.1058824, 0, 1, 1,
0.498437, 0.4316132, 0.2580713, 0.1098039, 0, 1, 1,
0.4991596, -0.8121123, 1.294556, 0.1176471, 0, 1, 1,
0.5010083, -1.756188, 1.739594, 0.1215686, 0, 1, 1,
0.5027967, -1.820506, 4.174187, 0.1294118, 0, 1, 1,
0.5032558, 0.2143112, 0.1208605, 0.1333333, 0, 1, 1,
0.5045281, 0.05146586, 2.036417, 0.1411765, 0, 1, 1,
0.5092731, -1.776511, 4.139281, 0.145098, 0, 1, 1,
0.509997, 1.966975, 0.3584501, 0.1529412, 0, 1, 1,
0.5109699, 0.07003964, 1.4173, 0.1568628, 0, 1, 1,
0.5126265, 0.9368979, 1.272699, 0.1647059, 0, 1, 1,
0.5160366, 0.5369883, 0.4558555, 0.1686275, 0, 1, 1,
0.5168021, -0.3729201, 1.426174, 0.1764706, 0, 1, 1,
0.5179803, 1.60899, 0.9908364, 0.1803922, 0, 1, 1,
0.5180585, -0.2835145, 1.403012, 0.1882353, 0, 1, 1,
0.5220546, -0.1644611, 0.8537584, 0.1921569, 0, 1, 1,
0.5235592, 0.2072856, 1.416347, 0.2, 0, 1, 1,
0.5248722, -1.105832, 2.624051, 0.2078431, 0, 1, 1,
0.5294429, 1.240073, 2.29791, 0.2117647, 0, 1, 1,
0.5404022, 0.3120636, 1.370425, 0.2196078, 0, 1, 1,
0.5414438, -0.2633652, 2.597484, 0.2235294, 0, 1, 1,
0.5414454, -1.462441, 3.179944, 0.2313726, 0, 1, 1,
0.5418426, -1.657111, 2.506301, 0.2352941, 0, 1, 1,
0.5422786, -0.6603429, 3.465299, 0.2431373, 0, 1, 1,
0.5441391, 0.3577536, 1.301112, 0.2470588, 0, 1, 1,
0.5450954, -1.401355, 1.341587, 0.254902, 0, 1, 1,
0.5469713, 1.081277, -0.5757941, 0.2588235, 0, 1, 1,
0.5478298, 0.2769668, 2.016851, 0.2666667, 0, 1, 1,
0.5491692, -0.2715694, 2.377192, 0.2705882, 0, 1, 1,
0.5505278, -1.044023, 2.321516, 0.2784314, 0, 1, 1,
0.5575281, 0.669967, 0.61825, 0.282353, 0, 1, 1,
0.5631992, 0.3472725, 1.792761, 0.2901961, 0, 1, 1,
0.5632335, -0.6584563, 2.039429, 0.2941177, 0, 1, 1,
0.5674152, -1.108727, 3.003886, 0.3019608, 0, 1, 1,
0.5687012, 0.87292, 1.067966, 0.3098039, 0, 1, 1,
0.5700545, -0.1797539, 0.549778, 0.3137255, 0, 1, 1,
0.5712551, 0.1326343, 0.6617613, 0.3215686, 0, 1, 1,
0.5737769, -0.2164675, 0.9716811, 0.3254902, 0, 1, 1,
0.5745777, 0.04212597, 2.085573, 0.3333333, 0, 1, 1,
0.5778531, -1.335728, 2.428356, 0.3372549, 0, 1, 1,
0.5794805, -0.4258349, 3.396752, 0.345098, 0, 1, 1,
0.5805615, 0.5644389, -0.4385045, 0.3490196, 0, 1, 1,
0.5851674, -1.180061, 2.31422, 0.3568628, 0, 1, 1,
0.5852133, 0.4739178, -0.1239758, 0.3607843, 0, 1, 1,
0.5856239, -0.8498149, 2.928636, 0.3686275, 0, 1, 1,
0.5924042, 0.7470479, 1.1338, 0.372549, 0, 1, 1,
0.594807, 1.716397, -1.808293, 0.3803922, 0, 1, 1,
0.5954317, 0.3739129, 1.376011, 0.3843137, 0, 1, 1,
0.5977935, -0.8199084, 2.550416, 0.3921569, 0, 1, 1,
0.5997587, -0.4747089, 2.976368, 0.3960784, 0, 1, 1,
0.6122091, -0.614681, 2.256345, 0.4039216, 0, 1, 1,
0.6127366, -0.4225321, 2.000203, 0.4117647, 0, 1, 1,
0.6138554, -0.9712692, 2.509628, 0.4156863, 0, 1, 1,
0.6231043, 0.3638366, 0.03843909, 0.4235294, 0, 1, 1,
0.6240391, -1.227579, 1.338803, 0.427451, 0, 1, 1,
0.6304481, 0.6790228, 0.9414917, 0.4352941, 0, 1, 1,
0.6306931, -0.1668066, 1.853408, 0.4392157, 0, 1, 1,
0.6358751, -1.233589, 2.128305, 0.4470588, 0, 1, 1,
0.6369848, -1.181211, 2.860529, 0.4509804, 0, 1, 1,
0.6421729, 2.078078, -0.4097673, 0.4588235, 0, 1, 1,
0.6431217, -0.5324352, 2.066109, 0.4627451, 0, 1, 1,
0.6437475, 0.9710935, -0.0413436, 0.4705882, 0, 1, 1,
0.6444257, 1.017789, 0.9074108, 0.4745098, 0, 1, 1,
0.6492207, -0.2938446, 2.328044, 0.4823529, 0, 1, 1,
0.6502111, 0.811321, 0.2313933, 0.4862745, 0, 1, 1,
0.6526987, -0.3089669, 0.4326081, 0.4941176, 0, 1, 1,
0.6563092, 0.8073188, 2.333238, 0.5019608, 0, 1, 1,
0.6572908, 0.8178892, 1.830749, 0.5058824, 0, 1, 1,
0.6604597, 0.9234807, 1.657801, 0.5137255, 0, 1, 1,
0.6633052, 0.2452175, 1.545217, 0.5176471, 0, 1, 1,
0.6672197, -0.85829, 1.831486, 0.5254902, 0, 1, 1,
0.6727323, 0.2775135, 2.088666, 0.5294118, 0, 1, 1,
0.6797134, -0.8282537, 3.175905, 0.5372549, 0, 1, 1,
0.682088, -0.9020924, 3.002616, 0.5411765, 0, 1, 1,
0.6822861, 0.5976364, 1.492702, 0.5490196, 0, 1, 1,
0.6829703, -1.283208, 0.6585558, 0.5529412, 0, 1, 1,
0.6872505, -0.173636, 1.829299, 0.5607843, 0, 1, 1,
0.6913568, -1.127882, 1.85308, 0.5647059, 0, 1, 1,
0.6930838, 0.0747227, 0.5029068, 0.572549, 0, 1, 1,
0.6991628, -0.4877865, 0.8863853, 0.5764706, 0, 1, 1,
0.6999794, -2.783348, 1.936074, 0.5843138, 0, 1, 1,
0.7151991, -0.3130949, 0.7163032, 0.5882353, 0, 1, 1,
0.7170258, -1.334265, 3.019376, 0.5960785, 0, 1, 1,
0.7249231, -0.08707178, 2.001339, 0.6039216, 0, 1, 1,
0.7260101, -0.7208987, 1.922099, 0.6078432, 0, 1, 1,
0.7262244, 0.306844, 2.457976, 0.6156863, 0, 1, 1,
0.7303954, -0.04399649, 0.8203495, 0.6196079, 0, 1, 1,
0.7335769, -0.494681, 1.829947, 0.627451, 0, 1, 1,
0.7463015, 0.006116535, 1.639934, 0.6313726, 0, 1, 1,
0.7470897, -0.464751, 2.361838, 0.6392157, 0, 1, 1,
0.747292, 0.317976, -1.08182, 0.6431373, 0, 1, 1,
0.7473722, -0.2622189, 1.13434, 0.6509804, 0, 1, 1,
0.7528502, 0.7589311, 0.2924111, 0.654902, 0, 1, 1,
0.7541509, -0.04048023, 1.492837, 0.6627451, 0, 1, 1,
0.7596384, -0.4381293, 0.5034789, 0.6666667, 0, 1, 1,
0.759717, -0.193324, 0.1475978, 0.6745098, 0, 1, 1,
0.7599913, -0.5103841, 1.992702, 0.6784314, 0, 1, 1,
0.7603761, -0.4005846, 2.400163, 0.6862745, 0, 1, 1,
0.761908, -1.288147, 3.025171, 0.6901961, 0, 1, 1,
0.76368, -1.987521, 3.434119, 0.6980392, 0, 1, 1,
0.7698393, -0.7442201, 1.776851, 0.7058824, 0, 1, 1,
0.7725158, 0.4391398, 0.9747679, 0.7098039, 0, 1, 1,
0.7744759, 0.6861936, 0.9080124, 0.7176471, 0, 1, 1,
0.7746862, 0.8636903, 1.094044, 0.7215686, 0, 1, 1,
0.7754632, 2.366942, 0.4452017, 0.7294118, 0, 1, 1,
0.775872, -1.149783, 1.539112, 0.7333333, 0, 1, 1,
0.7759692, -0.4952244, 1.440519, 0.7411765, 0, 1, 1,
0.7769341, 1.070248, 0.6630544, 0.7450981, 0, 1, 1,
0.7839996, 0.02304037, 0.3213351, 0.7529412, 0, 1, 1,
0.7863775, -0.8088626, 3.396252, 0.7568628, 0, 1, 1,
0.792173, -1.31906, 4.051453, 0.7647059, 0, 1, 1,
0.793699, 0.7157737, 1.115666, 0.7686275, 0, 1, 1,
0.7957022, -1.829221, 3.501808, 0.7764706, 0, 1, 1,
0.7975479, 0.315073, -0.7386678, 0.7803922, 0, 1, 1,
0.8054503, 0.3645705, 1.928029, 0.7882353, 0, 1, 1,
0.8169165, 0.746266, -0.2314895, 0.7921569, 0, 1, 1,
0.8183842, 0.2915528, 2.680791, 0.8, 0, 1, 1,
0.8184298, 0.6790331, 0.2582012, 0.8078431, 0, 1, 1,
0.8192973, -0.03410954, 1.866835, 0.8117647, 0, 1, 1,
0.8220615, -0.09165422, 1.862669, 0.8196079, 0, 1, 1,
0.8249044, 0.02965704, 1.881856, 0.8235294, 0, 1, 1,
0.8297248, 0.7800339, 2.048824, 0.8313726, 0, 1, 1,
0.8319103, -0.6781489, 1.18911, 0.8352941, 0, 1, 1,
0.8405778, -0.2128296, 2.892648, 0.8431373, 0, 1, 1,
0.8442139, 0.5164019, 1.924666, 0.8470588, 0, 1, 1,
0.8452143, 0.2755727, 1.361226, 0.854902, 0, 1, 1,
0.8468903, -0.4332093, 0.8264345, 0.8588235, 0, 1, 1,
0.8488738, 0.0304293, 1.611434, 0.8666667, 0, 1, 1,
0.849161, -0.7338364, 1.66016, 0.8705882, 0, 1, 1,
0.8495171, -1.098468, 2.606226, 0.8784314, 0, 1, 1,
0.8502107, 0.4070253, 2.051145, 0.8823529, 0, 1, 1,
0.8505149, 0.1934137, 2.091878, 0.8901961, 0, 1, 1,
0.8530405, 1.243284, 2.243456, 0.8941177, 0, 1, 1,
0.857, -1.316272, 3.109334, 0.9019608, 0, 1, 1,
0.8586802, -0.4635988, 2.637877, 0.9098039, 0, 1, 1,
0.8623953, -0.7010893, 2.409993, 0.9137255, 0, 1, 1,
0.8645651, -0.7344298, 2.489091, 0.9215686, 0, 1, 1,
0.8659526, 0.6702303, 0.6246091, 0.9254902, 0, 1, 1,
0.8728706, -1.148714, 2.51906, 0.9333333, 0, 1, 1,
0.8730357, -0.3623519, 1.948727, 0.9372549, 0, 1, 1,
0.8787743, 0.7989622, 0.891023, 0.945098, 0, 1, 1,
0.8818396, 0.204209, 0.4255156, 0.9490196, 0, 1, 1,
0.8868847, 0.5136108, 0.9769861, 0.9568627, 0, 1, 1,
0.8926058, -0.1893532, 2.328361, 0.9607843, 0, 1, 1,
0.8990427, 0.4943388, 1.388497, 0.9686275, 0, 1, 1,
0.8991675, 1.274394, 1.429295, 0.972549, 0, 1, 1,
0.8993489, -1.345217, 2.521839, 0.9803922, 0, 1, 1,
0.9020159, 0.3685516, 1.849549, 0.9843137, 0, 1, 1,
0.9061087, -0.4404307, 3.199155, 0.9921569, 0, 1, 1,
0.9087529, 0.2356038, 1.078037, 0.9960784, 0, 1, 1,
0.91971, 0.2880202, 1.463921, 1, 0, 0.9960784, 1,
0.9233083, -1.498939, 2.506715, 1, 0, 0.9882353, 1,
0.9287167, 1.85746, -0.6047407, 1, 0, 0.9843137, 1,
0.9328583, -0.8713974, 1.200214, 1, 0, 0.9764706, 1,
0.9330457, 0.6084867, 2.046438, 1, 0, 0.972549, 1,
0.9346621, -0.1238055, 2.207462, 1, 0, 0.9647059, 1,
0.9371281, 0.8166555, 0.8721005, 1, 0, 0.9607843, 1,
0.9404571, -0.8599545, 3.522085, 1, 0, 0.9529412, 1,
0.9471968, 0.4095608, 0.1070428, 1, 0, 0.9490196, 1,
0.9492015, -0.3385164, 0.6847484, 1, 0, 0.9411765, 1,
0.952616, 0.5845222, 1.748357, 1, 0, 0.9372549, 1,
0.9578849, 0.8804389, -0.9826689, 1, 0, 0.9294118, 1,
0.9653684, 0.6293145, 1.697328, 1, 0, 0.9254902, 1,
0.9692407, -0.7757212, 1.692073, 1, 0, 0.9176471, 1,
0.9738958, 0.9242064, -0.838502, 1, 0, 0.9137255, 1,
0.9757916, 0.4259537, 2.583431, 1, 0, 0.9058824, 1,
0.9877044, -0.5028309, 2.635674, 1, 0, 0.9019608, 1,
0.9919671, 0.6869357, 1.007482, 1, 0, 0.8941177, 1,
0.9938399, 1.288404, -0.2819374, 1, 0, 0.8862745, 1,
1.000272, 0.9969682, 1.144555, 1, 0, 0.8823529, 1,
1.01101, 0.4383474, 1.127544, 1, 0, 0.8745098, 1,
1.017667, 0.548445, 1.291925, 1, 0, 0.8705882, 1,
1.019796, -1.14883, 1.78354, 1, 0, 0.8627451, 1,
1.023611, 0.6182763, 2.816139, 1, 0, 0.8588235, 1,
1.026667, -0.5801618, 3.328092, 1, 0, 0.8509804, 1,
1.02712, -1.887763, 3.773823, 1, 0, 0.8470588, 1,
1.028072, 0.08190536, 1.386739, 1, 0, 0.8392157, 1,
1.042733, 0.1921871, 1.655373, 1, 0, 0.8352941, 1,
1.042848, -1.509438, 0.5578854, 1, 0, 0.827451, 1,
1.04509, 1.03008, 0.2268923, 1, 0, 0.8235294, 1,
1.052345, -0.9301634, 3.263742, 1, 0, 0.8156863, 1,
1.054358, -1.216196, 1.328132, 1, 0, 0.8117647, 1,
1.054868, 1.289841, 0.6619193, 1, 0, 0.8039216, 1,
1.064668, -0.6281412, 0.8630518, 1, 0, 0.7960784, 1,
1.067942, -0.1226204, 2.130184, 1, 0, 0.7921569, 1,
1.068965, -1.206349, 2.37449, 1, 0, 0.7843137, 1,
1.070088, 0.8885161, 1.814049, 1, 0, 0.7803922, 1,
1.074454, -0.9554833, 3.312172, 1, 0, 0.772549, 1,
1.079334, -0.05910156, 2.885286, 1, 0, 0.7686275, 1,
1.085094, 0.8784176, 1.227233, 1, 0, 0.7607843, 1,
1.085673, 0.3044468, 0.3177531, 1, 0, 0.7568628, 1,
1.086373, -1.020231, 2.164914, 1, 0, 0.7490196, 1,
1.08772, 0.7468389, 0.8509536, 1, 0, 0.7450981, 1,
1.092264, -0.2712716, 2.689905, 1, 0, 0.7372549, 1,
1.093269, 0.6021867, 1.138289, 1, 0, 0.7333333, 1,
1.093476, -0.1594314, 1.351225, 1, 0, 0.7254902, 1,
1.097465, -0.429664, 1.806353, 1, 0, 0.7215686, 1,
1.098654, -1.671018, 4.241302, 1, 0, 0.7137255, 1,
1.100786, 1.208584, 1.855877, 1, 0, 0.7098039, 1,
1.103697, -0.02683496, 3.592399, 1, 0, 0.7019608, 1,
1.106978, -0.7873914, 1.806599, 1, 0, 0.6941177, 1,
1.107033, 0.3873149, 1.509652, 1, 0, 0.6901961, 1,
1.111572, -0.04584838, 3.210713, 1, 0, 0.682353, 1,
1.111807, -0.8136494, 1.865011, 1, 0, 0.6784314, 1,
1.114169, 0.5872528, -0.1552791, 1, 0, 0.6705883, 1,
1.114359, 0.2767614, 1.223822, 1, 0, 0.6666667, 1,
1.115632, -1.257164, 3.766394, 1, 0, 0.6588235, 1,
1.116187, 0.5860366, 1.014542, 1, 0, 0.654902, 1,
1.12163, 0.9339582, -0.2866942, 1, 0, 0.6470588, 1,
1.125205, 0.9715678, 0.08829682, 1, 0, 0.6431373, 1,
1.128083, 1.552375, 1.639038, 1, 0, 0.6352941, 1,
1.132183, -0.2383915, 1.377518, 1, 0, 0.6313726, 1,
1.13682, 1.307437, 0.9001652, 1, 0, 0.6235294, 1,
1.139539, 0.3011717, 1.629468, 1, 0, 0.6196079, 1,
1.152027, 0.07011991, 1.025874, 1, 0, 0.6117647, 1,
1.166014, 0.8177648, 0.4014357, 1, 0, 0.6078432, 1,
1.175254, -1.086821, 1.48792, 1, 0, 0.6, 1,
1.176748, -1.34197, 2.636786, 1, 0, 0.5921569, 1,
1.180422, 1.531627, 0.3285923, 1, 0, 0.5882353, 1,
1.190894, -1.14806, 1.486841, 1, 0, 0.5803922, 1,
1.192179, -1.917945, 3.410118, 1, 0, 0.5764706, 1,
1.219575, -0.989788, 2.596098, 1, 0, 0.5686275, 1,
1.219789, 1.085614, 0.0296191, 1, 0, 0.5647059, 1,
1.223322, 1.257136, -0.09968699, 1, 0, 0.5568628, 1,
1.225291, -1.128316, 1.277645, 1, 0, 0.5529412, 1,
1.230357, -2.192605, 1.765599, 1, 0, 0.5450981, 1,
1.231676, 0.7501019, 1.346816, 1, 0, 0.5411765, 1,
1.234029, 0.9185449, 0.0608727, 1, 0, 0.5333334, 1,
1.242571, -1.67121, 3.502778, 1, 0, 0.5294118, 1,
1.245927, -0.3671087, 3.902772, 1, 0, 0.5215687, 1,
1.246636, 0.2846466, 0.7377743, 1, 0, 0.5176471, 1,
1.24788, -0.4984871, 2.594568, 1, 0, 0.509804, 1,
1.248919, -2.801841, 3.819339, 1, 0, 0.5058824, 1,
1.270597, 0.4792359, 0.7673669, 1, 0, 0.4980392, 1,
1.272536, -1.761276, 1.368202, 1, 0, 0.4901961, 1,
1.273064, 0.6739274, 1.551493, 1, 0, 0.4862745, 1,
1.273406, 1.542885, 2.385103, 1, 0, 0.4784314, 1,
1.273813, 1.339053, 0.5503455, 1, 0, 0.4745098, 1,
1.273851, 0.1584976, 1.640017, 1, 0, 0.4666667, 1,
1.307281, 1.108899, 1.452656, 1, 0, 0.4627451, 1,
1.307337, -1.556489, 2.375751, 1, 0, 0.454902, 1,
1.310086, 1.069946, 1.984832, 1, 0, 0.4509804, 1,
1.318183, 0.6876772, 2.163548, 1, 0, 0.4431373, 1,
1.339295, -2.209631, 2.341403, 1, 0, 0.4392157, 1,
1.347085, -0.4151817, 1.365904, 1, 0, 0.4313726, 1,
1.355421, 0.9858409, 2.142513, 1, 0, 0.427451, 1,
1.362229, -0.1381499, 2.370032, 1, 0, 0.4196078, 1,
1.373746, 0.921428, -0.2911542, 1, 0, 0.4156863, 1,
1.374426, 0.4208333, 2.713409, 1, 0, 0.4078431, 1,
1.376708, 0.3613161, 2.449853, 1, 0, 0.4039216, 1,
1.384497, 1.363662, 0.9187272, 1, 0, 0.3960784, 1,
1.398825, 0.5694266, 2.098043, 1, 0, 0.3882353, 1,
1.404104, -0.8123029, 2.295987, 1, 0, 0.3843137, 1,
1.404522, 0.5806392, 2.072661, 1, 0, 0.3764706, 1,
1.406575, -0.1349967, 2.106403, 1, 0, 0.372549, 1,
1.413491, -1.386508, 2.343913, 1, 0, 0.3647059, 1,
1.416946, -1.208794, 1.993299, 1, 0, 0.3607843, 1,
1.423476, 1.26998, 1.752811, 1, 0, 0.3529412, 1,
1.451218, -0.2936377, 2.530679, 1, 0, 0.3490196, 1,
1.453984, 0.1915591, 1.05359, 1, 0, 0.3411765, 1,
1.463853, 0.2365594, 0.7612273, 1, 0, 0.3372549, 1,
1.465937, 0.05913639, 1.323161, 1, 0, 0.3294118, 1,
1.473297, -1.204661, 1.990237, 1, 0, 0.3254902, 1,
1.475923, 0.88456, 0.7151468, 1, 0, 0.3176471, 1,
1.479199, -1.520966, 2.698887, 1, 0, 0.3137255, 1,
1.492402, -0.5943762, 1.516479, 1, 0, 0.3058824, 1,
1.509163, -1.819367, 0.4486949, 1, 0, 0.2980392, 1,
1.526662, -1.588122, 4.194582, 1, 0, 0.2941177, 1,
1.568365, -0.5534043, 2.413786, 1, 0, 0.2862745, 1,
1.576518, 1.056101, 0.3045158, 1, 0, 0.282353, 1,
1.577788, -0.9607797, 1.224115, 1, 0, 0.2745098, 1,
1.581195, -0.2019641, 0.9482849, 1, 0, 0.2705882, 1,
1.588233, -0.5167422, 0.7939962, 1, 0, 0.2627451, 1,
1.592062, -1.072873, 1.506329, 1, 0, 0.2588235, 1,
1.600407, 1.281987, 1.248089, 1, 0, 0.2509804, 1,
1.624462, -0.406938, 2.766517, 1, 0, 0.2470588, 1,
1.627281, -1.367113, 0.7496238, 1, 0, 0.2392157, 1,
1.63397, 0.05500496, 3.001414, 1, 0, 0.2352941, 1,
1.640977, -1.301671, 2.004784, 1, 0, 0.227451, 1,
1.649231, 0.02622307, 0.6172088, 1, 0, 0.2235294, 1,
1.653109, 0.2034683, 2.186239, 1, 0, 0.2156863, 1,
1.665177, -0.4238593, 0.4534614, 1, 0, 0.2117647, 1,
1.666988, 0.105207, 1.21507, 1, 0, 0.2039216, 1,
1.701202, 0.003462197, 1.159167, 1, 0, 0.1960784, 1,
1.701495, -0.05048689, 2.174809, 1, 0, 0.1921569, 1,
1.710004, -0.5330887, 2.836116, 1, 0, 0.1843137, 1,
1.733955, 1.999046, 0.1420771, 1, 0, 0.1803922, 1,
1.781928, -0.2205577, 1.933068, 1, 0, 0.172549, 1,
1.783812, -0.6994998, 3.769531, 1, 0, 0.1686275, 1,
1.785, 1.705665, 1.146747, 1, 0, 0.1607843, 1,
1.827392, 2.212261, 1.448565, 1, 0, 0.1568628, 1,
1.832528, -0.7091742, 3.315236, 1, 0, 0.1490196, 1,
1.87595, 0.1885843, 2.680601, 1, 0, 0.145098, 1,
1.890545, 0.3046058, 3.372903, 1, 0, 0.1372549, 1,
1.983546, 1.695707, -0.4321148, 1, 0, 0.1333333, 1,
2.033174, 1.771356, 1.457933, 1, 0, 0.1254902, 1,
2.046027, -0.6339196, 1.379473, 1, 0, 0.1215686, 1,
2.089233, -0.6635638, 2.957915, 1, 0, 0.1137255, 1,
2.101837, 0.1850431, 1.327329, 1, 0, 0.1098039, 1,
2.166042, 1.205552, -0.1582343, 1, 0, 0.1019608, 1,
2.185904, -1.03116, 0.7339582, 1, 0, 0.09411765, 1,
2.196894, 0.579653, 0.5725544, 1, 0, 0.09019608, 1,
2.198156, 1.458419, 2.011743, 1, 0, 0.08235294, 1,
2.237934, -0.6166962, 0.6462085, 1, 0, 0.07843138, 1,
2.25241, 1.550821, 1.131271, 1, 0, 0.07058824, 1,
2.28111, 2.751801, -0.1656131, 1, 0, 0.06666667, 1,
2.306219, -0.3715186, 0.7296877, 1, 0, 0.05882353, 1,
2.317513, 3.059457, 0.159958, 1, 0, 0.05490196, 1,
2.318714, 0.6053453, -0.07645648, 1, 0, 0.04705882, 1,
2.378315, 2.064332, 1.893082, 1, 0, 0.04313726, 1,
2.435387, 0.419176, 1.286886, 1, 0, 0.03529412, 1,
2.487603, -0.06104324, 1.281201, 1, 0, 0.03137255, 1,
2.586623, -0.8056728, 2.496768, 1, 0, 0.02352941, 1,
2.681935, 0.593181, 1.579649, 1, 0, 0.01960784, 1,
2.924681, -0.0404084, 2.093915, 1, 0, 0.01176471, 1,
3.41329, 1.223811, -0.9911756, 1, 0, 0.007843138, 1
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
0.06757629, -3.934118, -7.082556, 0, -0.5, 0.5, 0.5,
0.06757629, -3.934118, -7.082556, 1, -0.5, 0.5, 0.5,
0.06757629, -3.934118, -7.082556, 1, 1.5, 0.5, 0.5,
0.06757629, -3.934118, -7.082556, 0, 1.5, 0.5, 0.5
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
-4.412335, 0.06947231, -7.082556, 0, -0.5, 0.5, 0.5,
-4.412335, 0.06947231, -7.082556, 1, -0.5, 0.5, 0.5,
-4.412335, 0.06947231, -7.082556, 1, 1.5, 0.5, 0.5,
-4.412335, 0.06947231, -7.082556, 0, 1.5, 0.5, 0.5
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
-4.412335, -3.934118, -0.1222289, 0, -0.5, 0.5, 0.5,
-4.412335, -3.934118, -0.1222289, 1, -0.5, 0.5, 0.5,
-4.412335, -3.934118, -0.1222289, 1, 1.5, 0.5, 0.5,
-4.412335, -3.934118, -0.1222289, 0, 1.5, 0.5, 0.5
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
-3, -3.010212, -5.476327,
3, -3.010212, -5.476327,
-3, -3.010212, -5.476327,
-3, -3.164196, -5.744031,
-2, -3.010212, -5.476327,
-2, -3.164196, -5.744031,
-1, -3.010212, -5.476327,
-1, -3.164196, -5.744031,
0, -3.010212, -5.476327,
0, -3.164196, -5.744031,
1, -3.010212, -5.476327,
1, -3.164196, -5.744031,
2, -3.010212, -5.476327,
2, -3.164196, -5.744031,
3, -3.010212, -5.476327,
3, -3.164196, -5.744031
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
-3, -3.472165, -6.279441, 0, -0.5, 0.5, 0.5,
-3, -3.472165, -6.279441, 1, -0.5, 0.5, 0.5,
-3, -3.472165, -6.279441, 1, 1.5, 0.5, 0.5,
-3, -3.472165, -6.279441, 0, 1.5, 0.5, 0.5,
-2, -3.472165, -6.279441, 0, -0.5, 0.5, 0.5,
-2, -3.472165, -6.279441, 1, -0.5, 0.5, 0.5,
-2, -3.472165, -6.279441, 1, 1.5, 0.5, 0.5,
-2, -3.472165, -6.279441, 0, 1.5, 0.5, 0.5,
-1, -3.472165, -6.279441, 0, -0.5, 0.5, 0.5,
-1, -3.472165, -6.279441, 1, -0.5, 0.5, 0.5,
-1, -3.472165, -6.279441, 1, 1.5, 0.5, 0.5,
-1, -3.472165, -6.279441, 0, 1.5, 0.5, 0.5,
0, -3.472165, -6.279441, 0, -0.5, 0.5, 0.5,
0, -3.472165, -6.279441, 1, -0.5, 0.5, 0.5,
0, -3.472165, -6.279441, 1, 1.5, 0.5, 0.5,
0, -3.472165, -6.279441, 0, 1.5, 0.5, 0.5,
1, -3.472165, -6.279441, 0, -0.5, 0.5, 0.5,
1, -3.472165, -6.279441, 1, -0.5, 0.5, 0.5,
1, -3.472165, -6.279441, 1, 1.5, 0.5, 0.5,
1, -3.472165, -6.279441, 0, 1.5, 0.5, 0.5,
2, -3.472165, -6.279441, 0, -0.5, 0.5, 0.5,
2, -3.472165, -6.279441, 1, -0.5, 0.5, 0.5,
2, -3.472165, -6.279441, 1, 1.5, 0.5, 0.5,
2, -3.472165, -6.279441, 0, 1.5, 0.5, 0.5,
3, -3.472165, -6.279441, 0, -0.5, 0.5, 0.5,
3, -3.472165, -6.279441, 1, -0.5, 0.5, 0.5,
3, -3.472165, -6.279441, 1, 1.5, 0.5, 0.5,
3, -3.472165, -6.279441, 0, 1.5, 0.5, 0.5
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
-3.378509, -2, -5.476327,
-3.378509, 3, -5.476327,
-3.378509, -2, -5.476327,
-3.550813, -2, -5.744031,
-3.378509, -1, -5.476327,
-3.550813, -1, -5.744031,
-3.378509, 0, -5.476327,
-3.550813, 0, -5.744031,
-3.378509, 1, -5.476327,
-3.550813, 1, -5.744031,
-3.378509, 2, -5.476327,
-3.550813, 2, -5.744031,
-3.378509, 3, -5.476327,
-3.550813, 3, -5.744031
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
-3.895422, -2, -6.279441, 0, -0.5, 0.5, 0.5,
-3.895422, -2, -6.279441, 1, -0.5, 0.5, 0.5,
-3.895422, -2, -6.279441, 1, 1.5, 0.5, 0.5,
-3.895422, -2, -6.279441, 0, 1.5, 0.5, 0.5,
-3.895422, -1, -6.279441, 0, -0.5, 0.5, 0.5,
-3.895422, -1, -6.279441, 1, -0.5, 0.5, 0.5,
-3.895422, -1, -6.279441, 1, 1.5, 0.5, 0.5,
-3.895422, -1, -6.279441, 0, 1.5, 0.5, 0.5,
-3.895422, 0, -6.279441, 0, -0.5, 0.5, 0.5,
-3.895422, 0, -6.279441, 1, -0.5, 0.5, 0.5,
-3.895422, 0, -6.279441, 1, 1.5, 0.5, 0.5,
-3.895422, 0, -6.279441, 0, 1.5, 0.5, 0.5,
-3.895422, 1, -6.279441, 0, -0.5, 0.5, 0.5,
-3.895422, 1, -6.279441, 1, -0.5, 0.5, 0.5,
-3.895422, 1, -6.279441, 1, 1.5, 0.5, 0.5,
-3.895422, 1, -6.279441, 0, 1.5, 0.5, 0.5,
-3.895422, 2, -6.279441, 0, -0.5, 0.5, 0.5,
-3.895422, 2, -6.279441, 1, -0.5, 0.5, 0.5,
-3.895422, 2, -6.279441, 1, 1.5, 0.5, 0.5,
-3.895422, 2, -6.279441, 0, 1.5, 0.5, 0.5,
-3.895422, 3, -6.279441, 0, -0.5, 0.5, 0.5,
-3.895422, 3, -6.279441, 1, -0.5, 0.5, 0.5,
-3.895422, 3, -6.279441, 1, 1.5, 0.5, 0.5,
-3.895422, 3, -6.279441, 0, 1.5, 0.5, 0.5
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
-3.378509, -3.010212, -4,
-3.378509, -3.010212, 4,
-3.378509, -3.010212, -4,
-3.550813, -3.164196, -4,
-3.378509, -3.010212, -2,
-3.550813, -3.164196, -2,
-3.378509, -3.010212, 0,
-3.550813, -3.164196, 0,
-3.378509, -3.010212, 2,
-3.550813, -3.164196, 2,
-3.378509, -3.010212, 4,
-3.550813, -3.164196, 4
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
-3.895422, -3.472165, -4, 0, -0.5, 0.5, 0.5,
-3.895422, -3.472165, -4, 1, -0.5, 0.5, 0.5,
-3.895422, -3.472165, -4, 1, 1.5, 0.5, 0.5,
-3.895422, -3.472165, -4, 0, 1.5, 0.5, 0.5,
-3.895422, -3.472165, -2, 0, -0.5, 0.5, 0.5,
-3.895422, -3.472165, -2, 1, -0.5, 0.5, 0.5,
-3.895422, -3.472165, -2, 1, 1.5, 0.5, 0.5,
-3.895422, -3.472165, -2, 0, 1.5, 0.5, 0.5,
-3.895422, -3.472165, 0, 0, -0.5, 0.5, 0.5,
-3.895422, -3.472165, 0, 1, -0.5, 0.5, 0.5,
-3.895422, -3.472165, 0, 1, 1.5, 0.5, 0.5,
-3.895422, -3.472165, 0, 0, 1.5, 0.5, 0.5,
-3.895422, -3.472165, 2, 0, -0.5, 0.5, 0.5,
-3.895422, -3.472165, 2, 1, -0.5, 0.5, 0.5,
-3.895422, -3.472165, 2, 1, 1.5, 0.5, 0.5,
-3.895422, -3.472165, 2, 0, 1.5, 0.5, 0.5,
-3.895422, -3.472165, 4, 0, -0.5, 0.5, 0.5,
-3.895422, -3.472165, 4, 1, -0.5, 0.5, 0.5,
-3.895422, -3.472165, 4, 1, 1.5, 0.5, 0.5,
-3.895422, -3.472165, 4, 0, 1.5, 0.5, 0.5
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
-3.378509, -3.010212, -5.476327,
-3.378509, 3.149157, -5.476327,
-3.378509, -3.010212, 5.231869,
-3.378509, 3.149157, 5.231869,
-3.378509, -3.010212, -5.476327,
-3.378509, -3.010212, 5.231869,
-3.378509, 3.149157, -5.476327,
-3.378509, 3.149157, 5.231869,
-3.378509, -3.010212, -5.476327,
3.513662, -3.010212, -5.476327,
-3.378509, -3.010212, 5.231869,
3.513662, -3.010212, 5.231869,
-3.378509, 3.149157, -5.476327,
3.513662, 3.149157, -5.476327,
-3.378509, 3.149157, 5.231869,
3.513662, 3.149157, 5.231869,
3.513662, -3.010212, -5.476327,
3.513662, 3.149157, -5.476327,
3.513662, -3.010212, 5.231869,
3.513662, 3.149157, 5.231869,
3.513662, -3.010212, -5.476327,
3.513662, -3.010212, 5.231869,
3.513662, 3.149157, -5.476327,
3.513662, 3.149157, 5.231869
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
var radius = 7.553614;
var distance = 33.60688;
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
mvMatrix.translate( -0.06757629, -0.06947231, 0.1222289 );
mvMatrix.scale( 1.184984, 1.325966, 0.7626976 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.60688);
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
Polyoxymethylene<-read.table("Polyoxymethylene.xyz")
```

```
## Error in read.table("Polyoxymethylene.xyz"): no lines available in input
```

```r
x<-Polyoxymethylene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Polyoxymethylene' not found
```

```r
y<-Polyoxymethylene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Polyoxymethylene' not found
```

```r
z<-Polyoxymethylene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Polyoxymethylene' not found
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
-3.278138, 0.7458305, -0.09374096, 0, 0, 1, 1, 1,
-3.093872, 0.004117985, -1.166483, 1, 0, 0, 1, 1,
-2.89727, -2.116826, -3.143124, 1, 0, 0, 1, 1,
-2.807838, -0.4893407, -1.352316, 1, 0, 0, 1, 1,
-2.770804, 1.643808, 0.1304506, 1, 0, 0, 1, 1,
-2.760296, 0.338089, -1.318515, 1, 0, 0, 1, 1,
-2.725739, 1.76397, -1.246281, 0, 0, 0, 1, 1,
-2.694328, 2.029268, -1.956666, 0, 0, 0, 1, 1,
-2.652454, -0.01684061, -0.7390844, 0, 0, 0, 1, 1,
-2.587556, -0.9046254, -2.274903, 0, 0, 0, 1, 1,
-2.534418, 1.716767, 0.2349837, 0, 0, 0, 1, 1,
-2.484587, 0.2631201, -2.712037, 0, 0, 0, 1, 1,
-2.415034, -0.1995429, -0.1893687, 0, 0, 0, 1, 1,
-2.41486, 0.38029, -1.31792, 1, 1, 1, 1, 1,
-2.350251, 0.2899953, -2.42924, 1, 1, 1, 1, 1,
-2.324041, 0.4365118, -0.7646059, 1, 1, 1, 1, 1,
-2.29761, 0.8575792, 0.1709095, 1, 1, 1, 1, 1,
-2.293096, -0.6587396, -1.191363, 1, 1, 1, 1, 1,
-2.280327, -0.6127155, -2.187691, 1, 1, 1, 1, 1,
-2.272169, -0.3791471, -2.252808, 1, 1, 1, 1, 1,
-2.194939, 0.8540772, -0.4558835, 1, 1, 1, 1, 1,
-2.125289, 0.6751004, -1.193042, 1, 1, 1, 1, 1,
-2.109968, -0.9711902, -2.408589, 1, 1, 1, 1, 1,
-2.106105, -0.3907547, -2.128738, 1, 1, 1, 1, 1,
-2.09035, -0.269371, -1.584805, 1, 1, 1, 1, 1,
-2.078228, 0.7179182, -0.857967, 1, 1, 1, 1, 1,
-2.067299, 0.6529874, -1.617095, 1, 1, 1, 1, 1,
-2.051521, 0.9950707, -1.474731, 1, 1, 1, 1, 1,
-2.048015, -0.56879, -0.2388387, 0, 0, 1, 1, 1,
-2.038743, -0.9465789, -4.329733, 1, 0, 0, 1, 1,
-2.004, 1.278461, -0.8978318, 1, 0, 0, 1, 1,
-1.992868, 0.955736, -0.1481847, 1, 0, 0, 1, 1,
-1.934898, -0.8833739, -2.321575, 1, 0, 0, 1, 1,
-1.931442, 0.8312553, -1.825848, 1, 0, 0, 1, 1,
-1.922566, -0.5233816, -1.479122, 0, 0, 0, 1, 1,
-1.917083, 0.8280688, -1.409999, 0, 0, 0, 1, 1,
-1.9142, 1.880194, 0.3977784, 0, 0, 0, 1, 1,
-1.908697, 1.114876, -1.839649, 0, 0, 0, 1, 1,
-1.901307, -0.4525867, -2.887107, 0, 0, 0, 1, 1,
-1.896769, -0.05714158, -3.414803, 0, 0, 0, 1, 1,
-1.863032, -0.09689121, -0.7081271, 0, 0, 0, 1, 1,
-1.852304, -1.343306, -2.249856, 1, 1, 1, 1, 1,
-1.796877, 0.5035121, -2.288713, 1, 1, 1, 1, 1,
-1.796874, -1.117527, -0.4053352, 1, 1, 1, 1, 1,
-1.78702, -0.1105193, -1.101819, 1, 1, 1, 1, 1,
-1.754237, -0.9159436, -2.485372, 1, 1, 1, 1, 1,
-1.750486, 0.5905484, -0.42931, 1, 1, 1, 1, 1,
-1.732255, 0.5102791, 0.05282654, 1, 1, 1, 1, 1,
-1.72685, 0.5953207, -1.022646, 1, 1, 1, 1, 1,
-1.721055, -0.3224566, -2.520565, 1, 1, 1, 1, 1,
-1.715002, 0.2799087, -0.5585306, 1, 1, 1, 1, 1,
-1.694984, 0.5248877, -2.029199, 1, 1, 1, 1, 1,
-1.685593, -0.3757943, -2.245938, 1, 1, 1, 1, 1,
-1.675795, 0.9148706, 1.113021, 1, 1, 1, 1, 1,
-1.640652, -0.4903817, -2.050329, 1, 1, 1, 1, 1,
-1.636903, 0.9702685, -1.533315, 1, 1, 1, 1, 1,
-1.628694, 0.4417566, -3.952626, 0, 0, 1, 1, 1,
-1.621305, -0.5985829, -2.766109, 1, 0, 0, 1, 1,
-1.62058, 1.170416, 0.3397131, 1, 0, 0, 1, 1,
-1.618804, 1.270526, -2.281983, 1, 0, 0, 1, 1,
-1.603465, 0.2418821, 0.03895926, 1, 0, 0, 1, 1,
-1.564081, 1.257546, -1.495561, 1, 0, 0, 1, 1,
-1.562119, 0.03709812, -1.184296, 0, 0, 0, 1, 1,
-1.559494, 1.187483, -2.089782, 0, 0, 0, 1, 1,
-1.548226, 1.923172, -0.8680182, 0, 0, 0, 1, 1,
-1.543546, 1.442398, -1.311804, 0, 0, 0, 1, 1,
-1.538435, -0.4730059, -0.7105958, 0, 0, 0, 1, 1,
-1.534503, 0.3567907, -2.822883, 0, 0, 0, 1, 1,
-1.534171, -1.851318, -2.781905, 0, 0, 0, 1, 1,
-1.525198, 0.0589845, -3.250518, 1, 1, 1, 1, 1,
-1.524677, -0.7931895, -0.7150653, 1, 1, 1, 1, 1,
-1.478894, 1.322909, -1.397465, 1, 1, 1, 1, 1,
-1.464193, 0.998017, 1.551442, 1, 1, 1, 1, 1,
-1.449118, 0.9442301, -1.139189, 1, 1, 1, 1, 1,
-1.448613, 0.8656453, -0.4559507, 1, 1, 1, 1, 1,
-1.446966, 0.1185883, -0.5451506, 1, 1, 1, 1, 1,
-1.430565, 1.424059, -0.496986, 1, 1, 1, 1, 1,
-1.421515, 0.5642535, -1.330349, 1, 1, 1, 1, 1,
-1.416458, -0.5457585, -0.4826036, 1, 1, 1, 1, 1,
-1.41214, -1.091573, -2.257511, 1, 1, 1, 1, 1,
-1.401513, -0.5443427, -2.446949, 1, 1, 1, 1, 1,
-1.401044, -0.3653973, -0.6327813, 1, 1, 1, 1, 1,
-1.399682, -0.8100199, -3.793292, 1, 1, 1, 1, 1,
-1.389942, -1.152238, -2.028452, 1, 1, 1, 1, 1,
-1.386069, 2.93943, 0.07280543, 0, 0, 1, 1, 1,
-1.370866, 1.095558, 0.5404397, 1, 0, 0, 1, 1,
-1.367979, -0.6460739, -3.709365, 1, 0, 0, 1, 1,
-1.3646, -2.004427, -1.810788, 1, 0, 0, 1, 1,
-1.364314, -1.304602, -1.903691, 1, 0, 0, 1, 1,
-1.344116, 1.468194, 0.1210106, 1, 0, 0, 1, 1,
-1.339517, 0.01251972, -1.274824, 0, 0, 0, 1, 1,
-1.321403, -0.7138442, -2.126141, 0, 0, 0, 1, 1,
-1.307846, 1.70886, -1.956887, 0, 0, 0, 1, 1,
-1.304039, 0.04990383, -1.057617, 0, 0, 0, 1, 1,
-1.297073, 1.444974, -0.1815285, 0, 0, 0, 1, 1,
-1.288842, 0.1574894, -1.558487, 0, 0, 0, 1, 1,
-1.273494, 0.04347557, -2.435702, 0, 0, 0, 1, 1,
-1.272282, 0.418606, -1.582298, 1, 1, 1, 1, 1,
-1.267999, 0.166847, -1.05948, 1, 1, 1, 1, 1,
-1.266895, 1.986444, -0.7535227, 1, 1, 1, 1, 1,
-1.264729, 0.1845012, -3.538557, 1, 1, 1, 1, 1,
-1.262004, 1.454262, -1.152094, 1, 1, 1, 1, 1,
-1.252029, -0.1095237, -2.756815, 1, 1, 1, 1, 1,
-1.250051, -0.896779, -1.966645, 1, 1, 1, 1, 1,
-1.241703, 0.124102, -0.5894439, 1, 1, 1, 1, 1,
-1.237032, -1.29999, -1.573929, 1, 1, 1, 1, 1,
-1.228318, 0.8195668, 0.5223243, 1, 1, 1, 1, 1,
-1.220148, 1.170691, 0.6228412, 1, 1, 1, 1, 1,
-1.219697, -0.2036343, 0.6072528, 1, 1, 1, 1, 1,
-1.219433, 0.6684817, -1.168511, 1, 1, 1, 1, 1,
-1.217546, -0.4195499, -3.049758, 1, 1, 1, 1, 1,
-1.213544, 0.06202243, -2.493172, 1, 1, 1, 1, 1,
-1.210078, 0.223655, -0.5186406, 0, 0, 1, 1, 1,
-1.208644, 0.4572533, -3.168072, 1, 0, 0, 1, 1,
-1.205944, -0.547446, -1.985305, 1, 0, 0, 1, 1,
-1.204866, -1.568772, -2.486927, 1, 0, 0, 1, 1,
-1.204066, 0.6907648, -0.8970551, 1, 0, 0, 1, 1,
-1.203729, -0.8655751, -2.088713, 1, 0, 0, 1, 1,
-1.194488, 0.8193927, -1.82693, 0, 0, 0, 1, 1,
-1.182915, 1.641726, -2.166567, 0, 0, 0, 1, 1,
-1.164924, -0.793718, -2.096662, 0, 0, 0, 1, 1,
-1.162268, 0.591397, -1.408691, 0, 0, 0, 1, 1,
-1.159825, -1.864128, -4.272724, 0, 0, 0, 1, 1,
-1.159663, 0.7383989, -1.490302, 0, 0, 0, 1, 1,
-1.155917, 2.197099, 0.794553, 0, 0, 0, 1, 1,
-1.15422, -0.5524338, -0.5585499, 1, 1, 1, 1, 1,
-1.152911, -0.8284926, -1.38364, 1, 1, 1, 1, 1,
-1.134117, -0.1316465, -0.05860285, 1, 1, 1, 1, 1,
-1.13387, 0.3168873, -2.387347, 1, 1, 1, 1, 1,
-1.128477, 0.8820104, -2.158026, 1, 1, 1, 1, 1,
-1.117072, -1.683136, -2.495227, 1, 1, 1, 1, 1,
-1.116009, -0.7152449, -1.681918, 1, 1, 1, 1, 1,
-1.103738, -0.8357381, -2.336368, 1, 1, 1, 1, 1,
-1.10183, -1.944057, -2.376863, 1, 1, 1, 1, 1,
-1.097685, -0.4784033, -2.842337, 1, 1, 1, 1, 1,
-1.092159, 0.6317743, -1.0917, 1, 1, 1, 1, 1,
-1.08744, 2.292787, -2.615562, 1, 1, 1, 1, 1,
-1.081946, 1.499278, 0.01195402, 1, 1, 1, 1, 1,
-1.079489, -0.1352429, -0.3576164, 1, 1, 1, 1, 1,
-1.077201, -0.1068225, -2.908309, 1, 1, 1, 1, 1,
-1.074918, -1.152568, -3.382172, 0, 0, 1, 1, 1,
-1.07398, -0.03516958, -2.500371, 1, 0, 0, 1, 1,
-1.070486, -0.5792597, -2.718371, 1, 0, 0, 1, 1,
-1.069291, 0.2596833, -2.645529, 1, 0, 0, 1, 1,
-1.067575, -0.8307324, -2.061926, 1, 0, 0, 1, 1,
-1.065416, -0.8728071, -1.89349, 1, 0, 0, 1, 1,
-1.063216, 0.6325424, -2.732638, 0, 0, 0, 1, 1,
-1.062104, -0.4640196, -0.3928092, 0, 0, 0, 1, 1,
-1.059045, 0.3791637, -0.3932103, 0, 0, 0, 1, 1,
-1.058687, 1.284328, 0.4992634, 0, 0, 0, 1, 1,
-1.050388, -1.994903, -2.944171, 0, 0, 0, 1, 1,
-1.043895, 1.350441, -1.776462, 0, 0, 0, 1, 1,
-1.037941, 1.124203, 0.2298326, 0, 0, 0, 1, 1,
-1.034132, 0.5496026, -1.019796, 1, 1, 1, 1, 1,
-1.020798, 1.846661, 0.5501807, 1, 1, 1, 1, 1,
-1.020547, -0.9881623, -2.694929, 1, 1, 1, 1, 1,
-1.007449, 0.1172442, -2.779598, 1, 1, 1, 1, 1,
-1.005671, -0.1898321, -2.740824, 1, 1, 1, 1, 1,
-1.003753, -0.09740007, -3.060248, 1, 1, 1, 1, 1,
-1.001394, 0.8110828, -0.09469336, 1, 1, 1, 1, 1,
-0.9994299, -0.7314696, -1.486982, 1, 1, 1, 1, 1,
-0.994661, -0.5807894, -0.5288056, 1, 1, 1, 1, 1,
-0.9873676, -0.4148386, -1.298825, 1, 1, 1, 1, 1,
-0.9846962, 0.05868118, -1.533134, 1, 1, 1, 1, 1,
-0.9795539, -2.017482, -3.92114, 1, 1, 1, 1, 1,
-0.9755738, -0.2481443, -2.332085, 1, 1, 1, 1, 1,
-0.9677035, 0.9463112, -0.5095574, 1, 1, 1, 1, 1,
-0.9521822, 0.8552468, 0.4156732, 1, 1, 1, 1, 1,
-0.9494002, -1.044045, -2.597672, 0, 0, 1, 1, 1,
-0.9490103, 0.343043, -0.6298246, 1, 0, 0, 1, 1,
-0.9487311, 0.5259447, -2.084013, 1, 0, 0, 1, 1,
-0.9430487, 0.1671119, -1.547422, 1, 0, 0, 1, 1,
-0.940995, 0.5305097, -0.7293925, 1, 0, 0, 1, 1,
-0.9331118, 2.02356, -1.38128, 1, 0, 0, 1, 1,
-0.9187542, -1.027597, -1.000381, 0, 0, 0, 1, 1,
-0.9138737, 1.038925, 0.01877172, 0, 0, 0, 1, 1,
-0.905158, -1.80538, -3.534605, 0, 0, 0, 1, 1,
-0.9042318, -0.04129302, -2.58558, 0, 0, 0, 1, 1,
-0.895126, -1.131069, -1.109656, 0, 0, 0, 1, 1,
-0.8946936, 0.8767165, -0.08954864, 0, 0, 0, 1, 1,
-0.8775142, -0.03120099, -2.28688, 0, 0, 0, 1, 1,
-0.8772412, 1.664262, 0.5505663, 1, 1, 1, 1, 1,
-0.8770789, -0.4104024, -0.9364765, 1, 1, 1, 1, 1,
-0.876628, 1.128625, 0.3907809, 1, 1, 1, 1, 1,
-0.8677015, 1.94426, -0.1316525, 1, 1, 1, 1, 1,
-0.852808, 0.2535217, -1.076397, 1, 1, 1, 1, 1,
-0.8471988, 0.4640467, -1.906352, 1, 1, 1, 1, 1,
-0.8459111, -0.055198, -1.65604, 1, 1, 1, 1, 1,
-0.8452763, 1.250034, -2.083474, 1, 1, 1, 1, 1,
-0.8440339, 0.7125405, 0.1004875, 1, 1, 1, 1, 1,
-0.8419845, -0.5661515, -2.157569, 1, 1, 1, 1, 1,
-0.8408588, 0.8462341, -1.426954, 1, 1, 1, 1, 1,
-0.8388042, 0.4451172, -0.9585367, 1, 1, 1, 1, 1,
-0.8349094, 0.7701828, -0.6347969, 1, 1, 1, 1, 1,
-0.8310155, 1.446849, -2.221741, 1, 1, 1, 1, 1,
-0.8305623, -1.583283, -3.109346, 1, 1, 1, 1, 1,
-0.8237529, 1.355353, -1.311277, 0, 0, 1, 1, 1,
-0.8061872, 0.3218779, 0.5531952, 1, 0, 0, 1, 1,
-0.8048732, 0.4058641, -0.001672523, 1, 0, 0, 1, 1,
-0.8024525, -0.1126666, -0.3869082, 1, 0, 0, 1, 1,
-0.8014328, 0.4750011, -0.9322886, 1, 0, 0, 1, 1,
-0.7941009, -1.242427, -1.746574, 1, 0, 0, 1, 1,
-0.7899894, 0.4452499, -0.09265711, 0, 0, 0, 1, 1,
-0.7896049, 0.04091633, -1.338805, 0, 0, 0, 1, 1,
-0.7852014, -0.366906, -1.490909, 0, 0, 0, 1, 1,
-0.783232, 0.06024001, 0.5855449, 0, 0, 0, 1, 1,
-0.7831148, -1.610837, -1.444458, 0, 0, 0, 1, 1,
-0.7790645, -0.956368, -1.658707, 0, 0, 0, 1, 1,
-0.7780926, -1.044028, -3.015244, 0, 0, 0, 1, 1,
-0.7779086, 0.2282581, -2.655743, 1, 1, 1, 1, 1,
-0.7774404, -0.3168135, -1.87895, 1, 1, 1, 1, 1,
-0.773967, 0.4174972, -1.852577, 1, 1, 1, 1, 1,
-0.756158, -0.02669442, -2.962332, 1, 1, 1, 1, 1,
-0.7549058, -1.086716, -1.761337, 1, 1, 1, 1, 1,
-0.7534735, 1.552813, 0.3100096, 1, 1, 1, 1, 1,
-0.7484946, -0.0925449, -0.2422228, 1, 1, 1, 1, 1,
-0.7480554, -0.1997876, -2.04452, 1, 1, 1, 1, 1,
-0.7473392, 0.8205577, -1.972961, 1, 1, 1, 1, 1,
-0.7433428, -0.936593, -3.094592, 1, 1, 1, 1, 1,
-0.7409463, -0.8207998, -0.8884514, 1, 1, 1, 1, 1,
-0.7349701, 0.1738683, -3.367962, 1, 1, 1, 1, 1,
-0.7316288, -0.6436446, -3.15713, 1, 1, 1, 1, 1,
-0.7267843, 0.1603722, -2.195713, 1, 1, 1, 1, 1,
-0.7170367, 0.7415754, 0.1983153, 1, 1, 1, 1, 1,
-0.7061796, 0.3363248, -2.235486, 0, 0, 1, 1, 1,
-0.696631, -0.2127492, -1.832188, 1, 0, 0, 1, 1,
-0.6927825, -0.9049914, -3.866554, 1, 0, 0, 1, 1,
-0.6917061, -0.6646971, -1.073955, 1, 0, 0, 1, 1,
-0.691216, -0.1838196, -1.725807, 1, 0, 0, 1, 1,
-0.6898906, 1.497772, 0.7429095, 1, 0, 0, 1, 1,
-0.6885523, -0.009859428, -1.511823, 0, 0, 0, 1, 1,
-0.6882712, -1.10425, -0.862877, 0, 0, 0, 1, 1,
-0.6816702, 0.9469097, -2.298679, 0, 0, 0, 1, 1,
-0.6783065, 1.166739, -1.085909, 0, 0, 0, 1, 1,
-0.6773415, -1.427262, -4.180406, 0, 0, 0, 1, 1,
-0.6695605, 0.2264693, -2.6359, 0, 0, 0, 1, 1,
-0.6664641, -0.7649855, -2.745965, 0, 0, 0, 1, 1,
-0.6639373, 1.092555, -1.023152, 1, 1, 1, 1, 1,
-0.6606618, -1.531607, -3.57115, 1, 1, 1, 1, 1,
-0.660226, -0.6261498, -3.647367, 1, 1, 1, 1, 1,
-0.6550428, 0.1394602, -1.998071, 1, 1, 1, 1, 1,
-0.651425, 1.810241, -0.818786, 1, 1, 1, 1, 1,
-0.6504204, -2.113456, -2.429554, 1, 1, 1, 1, 1,
-0.6500378, -0.3312559, -1.413433, 1, 1, 1, 1, 1,
-0.6457479, -0.4335709, -1.825996, 1, 1, 1, 1, 1,
-0.6337878, 0.7581209, 0.2737009, 1, 1, 1, 1, 1,
-0.6334742, 0.6732998, -1.530838, 1, 1, 1, 1, 1,
-0.6328799, -0.8093914, -1.82086, 1, 1, 1, 1, 1,
-0.6293145, -0.5539373, -2.515584, 1, 1, 1, 1, 1,
-0.6240857, -0.2457353, -2.163933, 1, 1, 1, 1, 1,
-0.6238809, -0.2815109, -0.8437728, 1, 1, 1, 1, 1,
-0.6218093, -0.004836326, -2.459447, 1, 1, 1, 1, 1,
-0.6193939, 0.2124457, -2.130389, 0, 0, 1, 1, 1,
-0.6168807, 0.3805066, -0.2902796, 1, 0, 0, 1, 1,
-0.6164933, 0.2461717, -0.4121784, 1, 0, 0, 1, 1,
-0.6139935, 0.3365534, 0.4274642, 1, 0, 0, 1, 1,
-0.6107741, 0.8982691, -1.877647, 1, 0, 0, 1, 1,
-0.6033376, 2.068011, -0.8448277, 1, 0, 0, 1, 1,
-0.5990468, -0.7675137, -0.3945123, 0, 0, 0, 1, 1,
-0.5989546, 0.5667726, -0.6650678, 0, 0, 0, 1, 1,
-0.5958324, -0.228701, -1.669202, 0, 0, 0, 1, 1,
-0.5942141, 0.5647226, -1.409258, 0, 0, 0, 1, 1,
-0.590324, 1.483316, -1.187938, 0, 0, 0, 1, 1,
-0.589562, -0.8860026, -1.133464, 0, 0, 0, 1, 1,
-0.5876625, 0.3354943, -0.4643084, 0, 0, 0, 1, 1,
-0.5835547, 0.1548995, -2.246651, 1, 1, 1, 1, 1,
-0.5833061, 1.163528, 0.4885527, 1, 1, 1, 1, 1,
-0.5734535, 0.7436365, 0.02190531, 1, 1, 1, 1, 1,
-0.567628, -0.9116885, -2.634313, 1, 1, 1, 1, 1,
-0.5666077, 1.230762, -1.041793, 1, 1, 1, 1, 1,
-0.5577441, -0.4212523, -2.039882, 1, 1, 1, 1, 1,
-0.5551647, 0.4445209, -1.282395, 1, 1, 1, 1, 1,
-0.5546169, 0.9321122, 0.08932552, 1, 1, 1, 1, 1,
-0.5542795, 0.1759917, -3.327876, 1, 1, 1, 1, 1,
-0.548435, 1.402187, 0.02797015, 1, 1, 1, 1, 1,
-0.5464237, 1.932343, -0.1189146, 1, 1, 1, 1, 1,
-0.5456498, 0.9793218, -0.05274398, 1, 1, 1, 1, 1,
-0.5415139, -0.1242507, -2.194246, 1, 1, 1, 1, 1,
-0.5312096, -1.271765, -0.981295, 1, 1, 1, 1, 1,
-0.5227223, -2.920513, -5.257195, 1, 1, 1, 1, 1,
-0.5176381, -0.7773031, -5.17515, 0, 0, 1, 1, 1,
-0.5166474, 0.9967297, -0.2310225, 1, 0, 0, 1, 1,
-0.5133312, 1.765, -2.548376, 1, 0, 0, 1, 1,
-0.5127012, 1.115194, -0.6933247, 1, 0, 0, 1, 1,
-0.5124052, -0.08772296, -2.3604, 1, 0, 0, 1, 1,
-0.5115014, 0.05766068, -1.711369, 1, 0, 0, 1, 1,
-0.5110499, 0.2859218, -2.005247, 0, 0, 0, 1, 1,
-0.5106177, -0.4454012, -1.651508, 0, 0, 0, 1, 1,
-0.5082219, -1.545527, -3.744912, 0, 0, 0, 1, 1,
-0.5072061, 0.009152817, -0.8255131, 0, 0, 0, 1, 1,
-0.5071675, 0.4882829, 1.180123, 0, 0, 0, 1, 1,
-0.5048937, 0.4653185, -1.075685, 0, 0, 0, 1, 1,
-0.5011154, 1.678701, 0.8296766, 0, 0, 0, 1, 1,
-0.4989654, -0.7611568, -1.705226, 1, 1, 1, 1, 1,
-0.4948802, -0.09614066, -3.812662, 1, 1, 1, 1, 1,
-0.4947016, -0.4308315, -3.191749, 1, 1, 1, 1, 1,
-0.4910001, 0.03141477, 0.9208253, 1, 1, 1, 1, 1,
-0.4887085, 0.1031989, -0.001982981, 1, 1, 1, 1, 1,
-0.488681, 0.1628356, -1.671084, 1, 1, 1, 1, 1,
-0.4883601, -2.035801, -3.30969, 1, 1, 1, 1, 1,
-0.4878083, 0.9057843, -0.8796073, 1, 1, 1, 1, 1,
-0.4877724, 0.6800482, 0.7508609, 1, 1, 1, 1, 1,
-0.487047, -0.517186, -1.915403, 1, 1, 1, 1, 1,
-0.4841742, -0.3934335, -3.153534, 1, 1, 1, 1, 1,
-0.4836407, 0.5476282, -0.8501596, 1, 1, 1, 1, 1,
-0.4809232, 0.1924853, -2.343955, 1, 1, 1, 1, 1,
-0.4780401, -0.205852, -3.286413, 1, 1, 1, 1, 1,
-0.4778377, -0.5219277, -1.967318, 1, 1, 1, 1, 1,
-0.4753478, 1.409943, -0.3149731, 0, 0, 1, 1, 1,
-0.4715431, 0.6826541, 0.2654753, 1, 0, 0, 1, 1,
-0.4710865, 0.5984094, -2.303634, 1, 0, 0, 1, 1,
-0.4704905, -0.2750306, -0.8337908, 1, 0, 0, 1, 1,
-0.4656408, -0.6066395, -1.323802, 1, 0, 0, 1, 1,
-0.4655965, 0.738382, -1.147195, 1, 0, 0, 1, 1,
-0.4639414, 1.837672, 0.5897397, 0, 0, 0, 1, 1,
-0.4632403, -0.02212905, -3.082554, 0, 0, 0, 1, 1,
-0.4629179, 0.8110812, -0.2217135, 0, 0, 0, 1, 1,
-0.4593768, -0.5078124, -3.43497, 0, 0, 0, 1, 1,
-0.4568585, -0.2447231, -1.904347, 0, 0, 0, 1, 1,
-0.456654, -1.467428, -2.289405, 0, 0, 0, 1, 1,
-0.456342, -0.07097012, -1.302337, 0, 0, 0, 1, 1,
-0.4527396, 1.443787, 0.9322595, 1, 1, 1, 1, 1,
-0.4525498, -0.8304512, -5.107462, 1, 1, 1, 1, 1,
-0.4457676, -0.5105984, -2.276372, 1, 1, 1, 1, 1,
-0.4445393, -0.01677368, -2.175704, 1, 1, 1, 1, 1,
-0.4439453, 1.100593, 0.6442953, 1, 1, 1, 1, 1,
-0.4433647, 0.6062614, -1.834738, 1, 1, 1, 1, 1,
-0.4425949, 1.251146, 0.6617307, 1, 1, 1, 1, 1,
-0.438799, -0.603699, -2.36192, 1, 1, 1, 1, 1,
-0.4287792, -0.08314857, -1.877643, 1, 1, 1, 1, 1,
-0.4266257, 1.195897, 0.6653464, 1, 1, 1, 1, 1,
-0.4265209, 1.783181, -1.082024, 1, 1, 1, 1, 1,
-0.4264852, -1.608932, -3.624374, 1, 1, 1, 1, 1,
-0.4241319, 0.2255674, -0.9994606, 1, 1, 1, 1, 1,
-0.422261, 1.854083, 1.75687, 1, 1, 1, 1, 1,
-0.4180918, -0.07118976, -1.523444, 1, 1, 1, 1, 1,
-0.4166314, -0.493744, -2.199592, 0, 0, 1, 1, 1,
-0.4165542, -0.04315693, -1.682514, 1, 0, 0, 1, 1,
-0.4134256, -0.4071342, -2.769243, 1, 0, 0, 1, 1,
-0.4092942, 2.021456, -1.526653, 1, 0, 0, 1, 1,
-0.4073493, -0.2064466, -1.442875, 1, 0, 0, 1, 1,
-0.4056504, 0.4615397, -0.1938212, 1, 0, 0, 1, 1,
-0.3904327, -1.027432, -1.259456, 0, 0, 0, 1, 1,
-0.3900259, 1.461352, -1.341599, 0, 0, 0, 1, 1,
-0.3886902, 0.1812213, 1.737251, 0, 0, 0, 1, 1,
-0.3885234, -0.3582788, -3.989893, 0, 0, 0, 1, 1,
-0.3875902, 0.9657159, 0.3754578, 0, 0, 0, 1, 1,
-0.3869353, -0.3563384, -3.268627, 0, 0, 0, 1, 1,
-0.3849272, 0.4395993, -2.031984, 0, 0, 0, 1, 1,
-0.3800545, 0.5052958, 0.7047145, 1, 1, 1, 1, 1,
-0.3750334, -1.061687, -0.6655723, 1, 1, 1, 1, 1,
-0.3742907, -0.6888112, -2.582728, 1, 1, 1, 1, 1,
-0.373845, -0.5374513, -2.148665, 1, 1, 1, 1, 1,
-0.372916, -0.7206954, -2.431601, 1, 1, 1, 1, 1,
-0.372281, 0.6870461, -1.868563, 1, 1, 1, 1, 1,
-0.3669903, -0.2442743, -3.62391, 1, 1, 1, 1, 1,
-0.3661318, -1.942923, -3.149832, 1, 1, 1, 1, 1,
-0.3619815, -1.352852, -2.927032, 1, 1, 1, 1, 1,
-0.3613275, -0.4074484, -0.6946784, 1, 1, 1, 1, 1,
-0.354661, 0.8972716, -1.195467, 1, 1, 1, 1, 1,
-0.3500302, 0.328645, -1.883354, 1, 1, 1, 1, 1,
-0.3495025, -0.143589, -1.525846, 1, 1, 1, 1, 1,
-0.3487371, -0.7737889, -3.183104, 1, 1, 1, 1, 1,
-0.3443922, 0.666541, -0.5994479, 1, 1, 1, 1, 1,
-0.3414606, -0.5186415, -1.987679, 0, 0, 1, 1, 1,
-0.3395497, -0.05839714, -0.609941, 1, 0, 0, 1, 1,
-0.3386582, -0.02757192, -2.181201, 1, 0, 0, 1, 1,
-0.3355432, 0.6955128, -1.033289, 1, 0, 0, 1, 1,
-0.3295287, 1.15987, -0.2641743, 1, 0, 0, 1, 1,
-0.324813, -0.6313038, -4.157774, 1, 0, 0, 1, 1,
-0.3208408, 0.3226774, 1.165897, 0, 0, 0, 1, 1,
-0.3201284, 1.590416, 2.371097, 0, 0, 0, 1, 1,
-0.3182991, -2.378065, -4.183885, 0, 0, 0, 1, 1,
-0.3099522, 0.5650457, -0.3257672, 0, 0, 0, 1, 1,
-0.3086584, 0.4467657, -2.126314, 0, 0, 0, 1, 1,
-0.3077609, 0.3062996, -0.9850339, 0, 0, 0, 1, 1,
-0.3058512, -0.3967888, -2.891679, 0, 0, 0, 1, 1,
-0.3041022, 0.3042331, -0.7740648, 1, 1, 1, 1, 1,
-0.3039873, -0.1856176, -0.1221674, 1, 1, 1, 1, 1,
-0.3031604, 0.9741067, -0.8004864, 1, 1, 1, 1, 1,
-0.2989666, -1.137542, -0.6765506, 1, 1, 1, 1, 1,
-0.294239, 0.9563051, -1.477465, 1, 1, 1, 1, 1,
-0.2935705, 0.3585406, -2.11223, 1, 1, 1, 1, 1,
-0.2927359, -2.527799, -0.9663226, 1, 1, 1, 1, 1,
-0.2875032, -0.6298444, -0.719081, 1, 1, 1, 1, 1,
-0.2808939, 0.2731948, -0.8334652, 1, 1, 1, 1, 1,
-0.2782974, -1.514223, -3.231263, 1, 1, 1, 1, 1,
-0.2760634, 0.6568989, -0.918632, 1, 1, 1, 1, 1,
-0.2745098, 0.1113109, -0.1836521, 1, 1, 1, 1, 1,
-0.2741087, -0.9451429, -2.531602, 1, 1, 1, 1, 1,
-0.2738175, 2.762983, -0.348169, 1, 1, 1, 1, 1,
-0.2734539, 0.6624615, -1.492301, 1, 1, 1, 1, 1,
-0.2696901, 0.4105789, -1.570304, 0, 0, 1, 1, 1,
-0.2678894, -1.788706, -4.175474, 1, 0, 0, 1, 1,
-0.266141, -0.2869955, -2.775525, 1, 0, 0, 1, 1,
-0.2641631, -0.8543695, -2.81776, 1, 0, 0, 1, 1,
-0.2622904, 0.3745649, 0.6722532, 1, 0, 0, 1, 1,
-0.2621295, 0.343116, 0.4675713, 1, 0, 0, 1, 1,
-0.2590812, 0.3985172, -2.447405, 0, 0, 0, 1, 1,
-0.2575524, -0.1987678, -3.058002, 0, 0, 0, 1, 1,
-0.2570441, 0.537668, 0.8910029, 0, 0, 0, 1, 1,
-0.2552288, 0.1176151, -1.394451, 0, 0, 0, 1, 1,
-0.255037, -1.211674, -3.156598, 0, 0, 0, 1, 1,
-0.248546, -0.389812, -2.770284, 0, 0, 0, 1, 1,
-0.2450847, -1.477415, -2.575396, 0, 0, 0, 1, 1,
-0.2430842, -0.2365578, -0.8361395, 1, 1, 1, 1, 1,
-0.2410395, -0.4161423, -1.359719, 1, 1, 1, 1, 1,
-0.2352715, -1.712877, -2.509333, 1, 1, 1, 1, 1,
-0.2307732, 1.398545, -0.04617215, 1, 1, 1, 1, 1,
-0.2245816, -0.6235945, -4.65654, 1, 1, 1, 1, 1,
-0.2230957, -0.8393527, -2.31549, 1, 1, 1, 1, 1,
-0.2223338, -0.4665604, -2.43717, 1, 1, 1, 1, 1,
-0.221802, 2.103595, 0.3223053, 1, 1, 1, 1, 1,
-0.219916, -0.264993, -2.402311, 1, 1, 1, 1, 1,
-0.2194414, 1.658354, -0.1201027, 1, 1, 1, 1, 1,
-0.2176276, -1.196799, -2.586253, 1, 1, 1, 1, 1,
-0.2157432, 0.2583272, -0.5615749, 1, 1, 1, 1, 1,
-0.2153217, -0.6669496, -2.411702, 1, 1, 1, 1, 1,
-0.2146696, 1.119548, 0.1583615, 1, 1, 1, 1, 1,
-0.21461, 1.290522, -0.3604169, 1, 1, 1, 1, 1,
-0.2084501, -0.2444513, -4.770181, 0, 0, 1, 1, 1,
-0.2053115, -2.081134, -4.211433, 1, 0, 0, 1, 1,
-0.2023667, 1.206265, -1.711025, 1, 0, 0, 1, 1,
-0.1972781, 0.2184622, -2.22136, 1, 0, 0, 1, 1,
-0.1947045, -0.1426956, -1.089326, 1, 0, 0, 1, 1,
-0.1942163, -0.6844924, -2.473288, 1, 0, 0, 1, 1,
-0.1927081, 0.1421605, -1.340325, 0, 0, 0, 1, 1,
-0.1910496, -0.5759126, -3.440669, 0, 0, 0, 1, 1,
-0.1850307, 0.2120073, -0.4478345, 0, 0, 0, 1, 1,
-0.1849705, -0.911019, -2.961969, 0, 0, 0, 1, 1,
-0.1759581, -0.5247234, -3.173877, 0, 0, 0, 1, 1,
-0.1718088, -0.5226358, -4.366019, 0, 0, 0, 1, 1,
-0.170055, 1.083695, -1.086002, 0, 0, 0, 1, 1,
-0.1666414, 0.5633883, 1.473065, 1, 1, 1, 1, 1,
-0.161827, -0.5563857, -2.502128, 1, 1, 1, 1, 1,
-0.1596918, 0.1942587, 0.01417692, 1, 1, 1, 1, 1,
-0.1554593, 0.4899531, -1.301063, 1, 1, 1, 1, 1,
-0.1544089, 0.1880962, -1.445963, 1, 1, 1, 1, 1,
-0.1442405, -0.012436, -1.989223, 1, 1, 1, 1, 1,
-0.1430498, 0.9748768, -1.768032, 1, 1, 1, 1, 1,
-0.142005, -1.429096, -3.125302, 1, 1, 1, 1, 1,
-0.1332573, 1.523788, -1.416557, 1, 1, 1, 1, 1,
-0.1267763, 0.0999161, -0.4953502, 1, 1, 1, 1, 1,
-0.123179, 0.279474, -0.5214645, 1, 1, 1, 1, 1,
-0.1220401, 0.01740119, 0.1599347, 1, 1, 1, 1, 1,
-0.1187412, 0.630257, 0.09521998, 1, 1, 1, 1, 1,
-0.1147797, -1.184366, -2.467716, 1, 1, 1, 1, 1,
-0.1129607, -0.446207, -2.146452, 1, 1, 1, 1, 1,
-0.1054543, 0.07211035, -0.2108859, 0, 0, 1, 1, 1,
-0.1047326, 0.9060776, 0.5554273, 1, 0, 0, 1, 1,
-0.1038142, -0.8701187, -3.561589, 1, 0, 0, 1, 1,
-0.1020558, -0.4785827, -1.895162, 1, 0, 0, 1, 1,
-0.09811477, 1.146548, -0.2050831, 1, 0, 0, 1, 1,
-0.09691551, -0.317881, -4.388891, 1, 0, 0, 1, 1,
-0.08970272, -1.229592, -4.085843, 0, 0, 0, 1, 1,
-0.08881715, -0.9159253, -1.740434, 0, 0, 0, 1, 1,
-0.08567493, 2.534322, -0.2165387, 0, 0, 0, 1, 1,
-0.08189515, 2.556594, -0.0296816, 0, 0, 0, 1, 1,
-0.07991325, -0.1727494, -1.967942, 0, 0, 0, 1, 1,
-0.07600974, 0.4351479, -0.8321025, 0, 0, 0, 1, 1,
-0.07191187, -0.554399, -4.048236, 0, 0, 0, 1, 1,
-0.06882071, -0.7688534, -2.27899, 1, 1, 1, 1, 1,
-0.06860831, -0.4702318, -1.87814, 1, 1, 1, 1, 1,
-0.06635479, -0.5929036, -3.365031, 1, 1, 1, 1, 1,
-0.06448456, -0.5387397, -4.051816, 1, 1, 1, 1, 1,
-0.06079762, -0.4164477, -3.154935, 1, 1, 1, 1, 1,
-0.05781846, -0.2032659, -3.755029, 1, 1, 1, 1, 1,
-0.04710186, -0.214682, -5.320382, 1, 1, 1, 1, 1,
-0.04530079, -0.6567991, -2.226948, 1, 1, 1, 1, 1,
-0.03802484, -0.2220687, -2.141572, 1, 1, 1, 1, 1,
-0.03745935, -0.4983891, -4.227877, 1, 1, 1, 1, 1,
-0.0360012, 0.1686163, -0.1557321, 1, 1, 1, 1, 1,
-0.0322868, 1.191958, 1.424556, 1, 1, 1, 1, 1,
-0.02940287, -0.5215654, -1.336352, 1, 1, 1, 1, 1,
-0.02881271, 0.4142135, 0.9589316, 1, 1, 1, 1, 1,
-0.02183229, 0.1798986, -2.040766, 1, 1, 1, 1, 1,
-0.0131629, -0.08934432, -3.333234, 0, 0, 1, 1, 1,
-0.01260097, -0.01513642, -1.170126, 1, 0, 0, 1, 1,
-0.01153377, 0.6353241, -0.7950351, 1, 0, 0, 1, 1,
-0.01077792, -0.4691759, -3.075434, 1, 0, 0, 1, 1,
-0.003498181, 2.284408, 0.1651103, 1, 0, 0, 1, 1,
-0.001748843, -0.1724101, -2.875984, 1, 0, 0, 1, 1,
0.001304718, -0.1391293, 3.420475, 0, 0, 0, 1, 1,
0.00401155, 0.3005716, -0.9900196, 0, 0, 0, 1, 1,
0.006440111, -1.049858, 2.057964, 0, 0, 0, 1, 1,
0.007294952, -0.8774609, 3.271418, 0, 0, 0, 1, 1,
0.007367248, 0.4023578, 1.983326, 0, 0, 0, 1, 1,
0.009696801, 0.5155984, 0.3151875, 0, 0, 0, 1, 1,
0.01628057, 0.4573072, -0.3481007, 0, 0, 0, 1, 1,
0.01671608, 0.2610077, -0.5345754, 1, 1, 1, 1, 1,
0.01946382, -1.240449, 1.869168, 1, 1, 1, 1, 1,
0.02541682, -1.200608, 3.832081, 1, 1, 1, 1, 1,
0.02590071, -1.786621, 3.695974, 1, 1, 1, 1, 1,
0.0262339, 0.7183676, 0.5309131, 1, 1, 1, 1, 1,
0.02650118, 0.3922298, 0.2648053, 1, 1, 1, 1, 1,
0.02705255, 1.50341, -1.168731, 1, 1, 1, 1, 1,
0.02981738, 0.7549697, 0.7649608, 1, 1, 1, 1, 1,
0.0320888, 0.04469635, 1.118622, 1, 1, 1, 1, 1,
0.0323917, -1.387421, 2.433723, 1, 1, 1, 1, 1,
0.03579734, -0.5130678, 3.634394, 1, 1, 1, 1, 1,
0.0380878, 2.336584, -0.4125526, 1, 1, 1, 1, 1,
0.04076624, 0.503419, -0.1724979, 1, 1, 1, 1, 1,
0.04228366, -0.5101899, 2.297137, 1, 1, 1, 1, 1,
0.04478742, -0.0505014, 2.747799, 1, 1, 1, 1, 1,
0.04505568, -1.542961, 1.232377, 0, 0, 1, 1, 1,
0.04576067, -1.317027, 4.271755, 1, 0, 0, 1, 1,
0.0498596, -1.944272, 4.609259, 1, 0, 0, 1, 1,
0.05307579, 1.748341, 0.9495392, 1, 0, 0, 1, 1,
0.05990132, 0.5075281, 2.681699, 1, 0, 0, 1, 1,
0.06102794, 0.3720495, 1.010886, 1, 0, 0, 1, 1,
0.06232567, 0.4633592, 0.1081883, 0, 0, 0, 1, 1,
0.06911002, -0.12264, 3.178568, 0, 0, 0, 1, 1,
0.07428344, 0.7955058, -0.6617411, 0, 0, 0, 1, 1,
0.07462682, 0.6006213, -0.1580535, 0, 0, 0, 1, 1,
0.07692891, 0.302851, 1.622872, 0, 0, 0, 1, 1,
0.07900973, -1.309801, 2.511949, 0, 0, 0, 1, 1,
0.08218551, 0.09266303, 0.07202967, 0, 0, 0, 1, 1,
0.08360866, -0.2133373, 2.633791, 1, 1, 1, 1, 1,
0.0842412, 1.260732, 0.07745952, 1, 1, 1, 1, 1,
0.08743861, -1.60673, 4.293155, 1, 1, 1, 1, 1,
0.08888882, 0.1218005, 0.3201042, 1, 1, 1, 1, 1,
0.08955642, -0.2913598, 3.02858, 1, 1, 1, 1, 1,
0.09384961, -1.517052, 5.075924, 1, 1, 1, 1, 1,
0.09714516, 0.8581058, 0.7133923, 1, 1, 1, 1, 1,
0.09783099, -1.597995, 1.284645, 1, 1, 1, 1, 1,
0.1008184, -0.9582879, 2.181277, 1, 1, 1, 1, 1,
0.1026051, 0.7935607, 0.2553716, 1, 1, 1, 1, 1,
0.103639, -1.2881, 1.489254, 1, 1, 1, 1, 1,
0.1038949, 0.01711969, 0.856675, 1, 1, 1, 1, 1,
0.1060429, 1.499296, 0.883382, 1, 1, 1, 1, 1,
0.1070977, 0.521409, 0.8683636, 1, 1, 1, 1, 1,
0.1096632, -0.9257805, 4.402151, 1, 1, 1, 1, 1,
0.1107178, -0.08329644, 1.610479, 0, 0, 1, 1, 1,
0.1129995, 0.4822303, -1.001819, 1, 0, 0, 1, 1,
0.1163184, 0.590399, 0.9144408, 1, 0, 0, 1, 1,
0.1165741, -0.6270205, 2.502184, 1, 0, 0, 1, 1,
0.1201833, 1.17155, 2.018976, 1, 0, 0, 1, 1,
0.1211602, -0.8127462, 2.70666, 1, 0, 0, 1, 1,
0.1222147, -0.523629, 3.707257, 0, 0, 0, 1, 1,
0.122396, 0.9586638, 0.809375, 0, 0, 0, 1, 1,
0.1241086, -1.157704, 2.533642, 0, 0, 0, 1, 1,
0.1241274, 0.009039276, 1.848372, 0, 0, 0, 1, 1,
0.125788, 1.291655, -0.3950311, 0, 0, 0, 1, 1,
0.1272417, -0.6174682, 2.675135, 0, 0, 0, 1, 1,
0.1286172, 0.4212321, 0.6015077, 0, 0, 0, 1, 1,
0.129665, -0.00644375, 0.5064834, 1, 1, 1, 1, 1,
0.1315165, -0.2752416, 2.42587, 1, 1, 1, 1, 1,
0.1334688, -0.2531562, 4.30713, 1, 1, 1, 1, 1,
0.1354451, 0.8440663, -0.5060312, 1, 1, 1, 1, 1,
0.135647, -1.871172, 3.943369, 1, 1, 1, 1, 1,
0.1375248, 1.001108, -0.4461185, 1, 1, 1, 1, 1,
0.1378795, -0.1019559, 2.192172, 1, 1, 1, 1, 1,
0.1380833, 2.501684, 0.2698341, 1, 1, 1, 1, 1,
0.1401848, 0.3815631, 0.2186378, 1, 1, 1, 1, 1,
0.1411492, -0.2301787, 3.623122, 1, 1, 1, 1, 1,
0.1433003, 0.0846269, 0.5668251, 1, 1, 1, 1, 1,
0.1505027, -0.4610566, 2.212912, 1, 1, 1, 1, 1,
0.1520543, -2.540131, 3.843157, 1, 1, 1, 1, 1,
0.153032, 2.117163, 0.3448529, 1, 1, 1, 1, 1,
0.1538884, -0.4442766, 2.438852, 1, 1, 1, 1, 1,
0.1553267, -0.6616836, 4.15687, 0, 0, 1, 1, 1,
0.1564494, -0.7511834, 2.130331, 1, 0, 0, 1, 1,
0.1578105, 0.3695856, 1.679697, 1, 0, 0, 1, 1,
0.1588444, -1.544986, 3.419723, 1, 0, 0, 1, 1,
0.1644598, 1.179175, 0.5699022, 1, 0, 0, 1, 1,
0.1649039, 0.1310342, -0.4833004, 1, 0, 0, 1, 1,
0.1654508, 0.9801059, -0.2251052, 0, 0, 0, 1, 1,
0.1712242, -1.650652, 4.264762, 0, 0, 0, 1, 1,
0.1780854, -0.7691631, 4.559279, 0, 0, 0, 1, 1,
0.1830878, 0.1106212, 0.8502215, 0, 0, 0, 1, 1,
0.1899499, 0.7342597, 0.8231834, 0, 0, 0, 1, 1,
0.1915096, -1.304398, 2.820971, 0, 0, 0, 1, 1,
0.1919606, 1.424937, -0.9842173, 0, 0, 0, 1, 1,
0.1928611, -0.8992267, 2.028506, 1, 1, 1, 1, 1,
0.2036235, 0.127581, 1.277632, 1, 1, 1, 1, 1,
0.2046788, -0.4201298, 2.741285, 1, 1, 1, 1, 1,
0.2060342, 0.9890736, -0.7535398, 1, 1, 1, 1, 1,
0.2103823, -2.172661, 1.681204, 1, 1, 1, 1, 1,
0.2216971, -0.01586982, 0.7326351, 1, 1, 1, 1, 1,
0.222738, 0.8383294, -0.5027211, 1, 1, 1, 1, 1,
0.2229691, 0.9417707, 2.104972, 1, 1, 1, 1, 1,
0.2265047, 1.473871, 0.2744375, 1, 1, 1, 1, 1,
0.2294005, 1.30136, -0.1752679, 1, 1, 1, 1, 1,
0.2414329, -0.6153972, 3.402952, 1, 1, 1, 1, 1,
0.2447015, -0.1224046, 1.40612, 1, 1, 1, 1, 1,
0.2461021, -0.5204512, 4.4417, 1, 1, 1, 1, 1,
0.2485691, 1.478283, -1.306969, 1, 1, 1, 1, 1,
0.2485965, 0.2607102, 0.3342153, 1, 1, 1, 1, 1,
0.2506889, -1.211031, 3.550607, 0, 0, 1, 1, 1,
0.2528584, 2.094719, 0.4506053, 1, 0, 0, 1, 1,
0.2529527, -1.321496, 3.630785, 1, 0, 0, 1, 1,
0.2530874, -0.4831729, 2.839153, 1, 0, 0, 1, 1,
0.2594317, -0.3876348, 3.698715, 1, 0, 0, 1, 1,
0.2595983, -1.111717, 2.28653, 1, 0, 0, 1, 1,
0.2639167, -0.4842864, 1.520491, 0, 0, 0, 1, 1,
0.2647752, 0.3320913, 0.9395227, 0, 0, 0, 1, 1,
0.2715122, -1.042808, 2.675183, 0, 0, 0, 1, 1,
0.2725487, -0.06400438, 1.117339, 0, 0, 0, 1, 1,
0.2768453, -0.3293621, 2.836652, 0, 0, 0, 1, 1,
0.2827401, -0.06082123, 1.747144, 0, 0, 0, 1, 1,
0.2845581, -0.1995718, 3.459179, 0, 0, 0, 1, 1,
0.2881425, -1.107819, 2.426952, 1, 1, 1, 1, 1,
0.288769, 0.5501641, -2.492539, 1, 1, 1, 1, 1,
0.2892437, -0.3109101, 0.4778229, 1, 1, 1, 1, 1,
0.28989, -1.134535, 4.05167, 1, 1, 1, 1, 1,
0.2902548, -1.495154, 3.080413, 1, 1, 1, 1, 1,
0.2917423, 0.05568136, 1.718384, 1, 1, 1, 1, 1,
0.2960856, -0.4908293, 2.920134, 1, 1, 1, 1, 1,
0.2988216, -0.9735072, 4.80468, 1, 1, 1, 1, 1,
0.300238, -1.861017, 3.779211, 1, 1, 1, 1, 1,
0.3029326, -0.9190914, 3.660234, 1, 1, 1, 1, 1,
0.3039806, -1.341679, 2.955192, 1, 1, 1, 1, 1,
0.3075601, 0.5642765, -0.3609642, 1, 1, 1, 1, 1,
0.3095714, -1.230948, 3.094382, 1, 1, 1, 1, 1,
0.3103847, 1.144123, 2.049527, 1, 1, 1, 1, 1,
0.3118486, -1.386442, 2.493635, 1, 1, 1, 1, 1,
0.312248, -1.524583, 2.690581, 0, 0, 1, 1, 1,
0.3130613, -0.215941, 3.164171, 1, 0, 0, 1, 1,
0.31468, -0.06581616, 2.196786, 1, 0, 0, 1, 1,
0.3152337, -0.5497472, 3.219991, 1, 0, 0, 1, 1,
0.3167514, -0.5225341, 3.171113, 1, 0, 0, 1, 1,
0.3182892, -0.07189898, 0.8020195, 1, 0, 0, 1, 1,
0.3208164, -1.508176, 4.121899, 0, 0, 0, 1, 1,
0.3224634, -1.139747, 1.386083, 0, 0, 0, 1, 1,
0.3231775, 0.04977955, 0.1294092, 0, 0, 0, 1, 1,
0.3237515, 2.002533, -0.4538023, 0, 0, 0, 1, 1,
0.3238571, -0.3476474, 2.764595, 0, 0, 0, 1, 1,
0.3252279, -0.04038798, 1.269911, 0, 0, 0, 1, 1,
0.3267435, -0.751699, 1.416744, 0, 0, 0, 1, 1,
0.327632, 0.3279376, 0.1847123, 1, 1, 1, 1, 1,
0.32872, 1.235703, 0.6881333, 1, 1, 1, 1, 1,
0.3307217, 0.5961761, 0.1387704, 1, 1, 1, 1, 1,
0.3346887, 0.4175177, 1.60058, 1, 1, 1, 1, 1,
0.3402959, -1.362017, 2.348239, 1, 1, 1, 1, 1,
0.3460504, 0.1172171, 1.652722, 1, 1, 1, 1, 1,
0.3491764, -0.2548539, 1.876458, 1, 1, 1, 1, 1,
0.3520115, 0.07000875, 1.345672, 1, 1, 1, 1, 1,
0.3521318, 0.257696, 0.7508662, 1, 1, 1, 1, 1,
0.3556322, 1.027277, 0.5899429, 1, 1, 1, 1, 1,
0.3558868, -0.5892478, 2.362838, 1, 1, 1, 1, 1,
0.3567313, -0.4209598, 1.417391, 1, 1, 1, 1, 1,
0.357145, 0.9786712, 1.969621, 1, 1, 1, 1, 1,
0.3591285, 0.9588445, 1.066788, 1, 1, 1, 1, 1,
0.3599743, 2.512794, -0.7924408, 1, 1, 1, 1, 1,
0.367899, 0.9671996, -0.9712882, 0, 0, 1, 1, 1,
0.3706483, -0.7866791, 1.894276, 1, 0, 0, 1, 1,
0.3727347, -1.666628, 3.911066, 1, 0, 0, 1, 1,
0.3738099, 0.3623431, -0.6788014, 1, 0, 0, 1, 1,
0.3751977, 1.107989, 0.2642365, 1, 0, 0, 1, 1,
0.3767861, -0.2498017, 3.258943, 1, 0, 0, 1, 1,
0.3776955, 0.3999727, 0.7333342, 0, 0, 0, 1, 1,
0.38407, 0.1417862, -0.05915675, 0, 0, 0, 1, 1,
0.3857066, -0.8976594, 3.269231, 0, 0, 0, 1, 1,
0.3868277, 1.467225, 0.4360404, 0, 0, 0, 1, 1,
0.3869239, 0.7482226, 1.135275, 0, 0, 0, 1, 1,
0.3902201, -0.1186098, 2.320289, 0, 0, 0, 1, 1,
0.3933481, 0.2670465, -0.3838251, 0, 0, 0, 1, 1,
0.3937638, 0.08757726, 0.4255904, 1, 1, 1, 1, 1,
0.3952002, -0.1480256, 2.295072, 1, 1, 1, 1, 1,
0.3982983, 1.087156, -0.04129962, 1, 1, 1, 1, 1,
0.4031371, 0.005226628, 2.594222, 1, 1, 1, 1, 1,
0.4103549, 1.189392, 1.333964, 1, 1, 1, 1, 1,
0.411099, 0.3212399, 2.443644, 1, 1, 1, 1, 1,
0.4123224, 0.9648811, 0.4040804, 1, 1, 1, 1, 1,
0.4212797, -0.5277297, 1.685969, 1, 1, 1, 1, 1,
0.4232846, 0.8593567, -1.094349, 1, 1, 1, 1, 1,
0.426864, 0.5512979, 1.399979, 1, 1, 1, 1, 1,
0.4348418, 0.991849, 1.206573, 1, 1, 1, 1, 1,
0.4356974, 0.697904, -1.688822, 1, 1, 1, 1, 1,
0.4397357, -0.2557367, 1.110482, 1, 1, 1, 1, 1,
0.4541619, 0.08797155, 3.001945, 1, 1, 1, 1, 1,
0.4557581, 0.6835536, -1.248247, 1, 1, 1, 1, 1,
0.4563376, -0.704183, 1.321058, 0, 0, 1, 1, 1,
0.456948, 1.57177, -0.03809609, 1, 0, 0, 1, 1,
0.4622824, 2.379137, -1.029948, 1, 0, 0, 1, 1,
0.4635125, 0.1378481, 2.691878, 1, 0, 0, 1, 1,
0.4664311, -0.690591, 0.9586367, 1, 0, 0, 1, 1,
0.4694881, -0.3891254, 1.145244, 1, 0, 0, 1, 1,
0.473278, -0.3829311, 4.235268, 0, 0, 0, 1, 1,
0.4766666, -0.4504298, 2.153907, 0, 0, 0, 1, 1,
0.4837907, 1.188131, 0.4761765, 0, 0, 0, 1, 1,
0.4840491, 0.4586454, 1.028195, 0, 0, 0, 1, 1,
0.4852609, 0.430158, 0.6403382, 0, 0, 0, 1, 1,
0.4863074, 1.2214, 2.551506, 0, 0, 0, 1, 1,
0.4962748, 0.1921277, -0.343848, 0, 0, 0, 1, 1,
0.498437, 0.4316132, 0.2580713, 1, 1, 1, 1, 1,
0.4991596, -0.8121123, 1.294556, 1, 1, 1, 1, 1,
0.5010083, -1.756188, 1.739594, 1, 1, 1, 1, 1,
0.5027967, -1.820506, 4.174187, 1, 1, 1, 1, 1,
0.5032558, 0.2143112, 0.1208605, 1, 1, 1, 1, 1,
0.5045281, 0.05146586, 2.036417, 1, 1, 1, 1, 1,
0.5092731, -1.776511, 4.139281, 1, 1, 1, 1, 1,
0.509997, 1.966975, 0.3584501, 1, 1, 1, 1, 1,
0.5109699, 0.07003964, 1.4173, 1, 1, 1, 1, 1,
0.5126265, 0.9368979, 1.272699, 1, 1, 1, 1, 1,
0.5160366, 0.5369883, 0.4558555, 1, 1, 1, 1, 1,
0.5168021, -0.3729201, 1.426174, 1, 1, 1, 1, 1,
0.5179803, 1.60899, 0.9908364, 1, 1, 1, 1, 1,
0.5180585, -0.2835145, 1.403012, 1, 1, 1, 1, 1,
0.5220546, -0.1644611, 0.8537584, 1, 1, 1, 1, 1,
0.5235592, 0.2072856, 1.416347, 0, 0, 1, 1, 1,
0.5248722, -1.105832, 2.624051, 1, 0, 0, 1, 1,
0.5294429, 1.240073, 2.29791, 1, 0, 0, 1, 1,
0.5404022, 0.3120636, 1.370425, 1, 0, 0, 1, 1,
0.5414438, -0.2633652, 2.597484, 1, 0, 0, 1, 1,
0.5414454, -1.462441, 3.179944, 1, 0, 0, 1, 1,
0.5418426, -1.657111, 2.506301, 0, 0, 0, 1, 1,
0.5422786, -0.6603429, 3.465299, 0, 0, 0, 1, 1,
0.5441391, 0.3577536, 1.301112, 0, 0, 0, 1, 1,
0.5450954, -1.401355, 1.341587, 0, 0, 0, 1, 1,
0.5469713, 1.081277, -0.5757941, 0, 0, 0, 1, 1,
0.5478298, 0.2769668, 2.016851, 0, 0, 0, 1, 1,
0.5491692, -0.2715694, 2.377192, 0, 0, 0, 1, 1,
0.5505278, -1.044023, 2.321516, 1, 1, 1, 1, 1,
0.5575281, 0.669967, 0.61825, 1, 1, 1, 1, 1,
0.5631992, 0.3472725, 1.792761, 1, 1, 1, 1, 1,
0.5632335, -0.6584563, 2.039429, 1, 1, 1, 1, 1,
0.5674152, -1.108727, 3.003886, 1, 1, 1, 1, 1,
0.5687012, 0.87292, 1.067966, 1, 1, 1, 1, 1,
0.5700545, -0.1797539, 0.549778, 1, 1, 1, 1, 1,
0.5712551, 0.1326343, 0.6617613, 1, 1, 1, 1, 1,
0.5737769, -0.2164675, 0.9716811, 1, 1, 1, 1, 1,
0.5745777, 0.04212597, 2.085573, 1, 1, 1, 1, 1,
0.5778531, -1.335728, 2.428356, 1, 1, 1, 1, 1,
0.5794805, -0.4258349, 3.396752, 1, 1, 1, 1, 1,
0.5805615, 0.5644389, -0.4385045, 1, 1, 1, 1, 1,
0.5851674, -1.180061, 2.31422, 1, 1, 1, 1, 1,
0.5852133, 0.4739178, -0.1239758, 1, 1, 1, 1, 1,
0.5856239, -0.8498149, 2.928636, 0, 0, 1, 1, 1,
0.5924042, 0.7470479, 1.1338, 1, 0, 0, 1, 1,
0.594807, 1.716397, -1.808293, 1, 0, 0, 1, 1,
0.5954317, 0.3739129, 1.376011, 1, 0, 0, 1, 1,
0.5977935, -0.8199084, 2.550416, 1, 0, 0, 1, 1,
0.5997587, -0.4747089, 2.976368, 1, 0, 0, 1, 1,
0.6122091, -0.614681, 2.256345, 0, 0, 0, 1, 1,
0.6127366, -0.4225321, 2.000203, 0, 0, 0, 1, 1,
0.6138554, -0.9712692, 2.509628, 0, 0, 0, 1, 1,
0.6231043, 0.3638366, 0.03843909, 0, 0, 0, 1, 1,
0.6240391, -1.227579, 1.338803, 0, 0, 0, 1, 1,
0.6304481, 0.6790228, 0.9414917, 0, 0, 0, 1, 1,
0.6306931, -0.1668066, 1.853408, 0, 0, 0, 1, 1,
0.6358751, -1.233589, 2.128305, 1, 1, 1, 1, 1,
0.6369848, -1.181211, 2.860529, 1, 1, 1, 1, 1,
0.6421729, 2.078078, -0.4097673, 1, 1, 1, 1, 1,
0.6431217, -0.5324352, 2.066109, 1, 1, 1, 1, 1,
0.6437475, 0.9710935, -0.0413436, 1, 1, 1, 1, 1,
0.6444257, 1.017789, 0.9074108, 1, 1, 1, 1, 1,
0.6492207, -0.2938446, 2.328044, 1, 1, 1, 1, 1,
0.6502111, 0.811321, 0.2313933, 1, 1, 1, 1, 1,
0.6526987, -0.3089669, 0.4326081, 1, 1, 1, 1, 1,
0.6563092, 0.8073188, 2.333238, 1, 1, 1, 1, 1,
0.6572908, 0.8178892, 1.830749, 1, 1, 1, 1, 1,
0.6604597, 0.9234807, 1.657801, 1, 1, 1, 1, 1,
0.6633052, 0.2452175, 1.545217, 1, 1, 1, 1, 1,
0.6672197, -0.85829, 1.831486, 1, 1, 1, 1, 1,
0.6727323, 0.2775135, 2.088666, 1, 1, 1, 1, 1,
0.6797134, -0.8282537, 3.175905, 0, 0, 1, 1, 1,
0.682088, -0.9020924, 3.002616, 1, 0, 0, 1, 1,
0.6822861, 0.5976364, 1.492702, 1, 0, 0, 1, 1,
0.6829703, -1.283208, 0.6585558, 1, 0, 0, 1, 1,
0.6872505, -0.173636, 1.829299, 1, 0, 0, 1, 1,
0.6913568, -1.127882, 1.85308, 1, 0, 0, 1, 1,
0.6930838, 0.0747227, 0.5029068, 0, 0, 0, 1, 1,
0.6991628, -0.4877865, 0.8863853, 0, 0, 0, 1, 1,
0.6999794, -2.783348, 1.936074, 0, 0, 0, 1, 1,
0.7151991, -0.3130949, 0.7163032, 0, 0, 0, 1, 1,
0.7170258, -1.334265, 3.019376, 0, 0, 0, 1, 1,
0.7249231, -0.08707178, 2.001339, 0, 0, 0, 1, 1,
0.7260101, -0.7208987, 1.922099, 0, 0, 0, 1, 1,
0.7262244, 0.306844, 2.457976, 1, 1, 1, 1, 1,
0.7303954, -0.04399649, 0.8203495, 1, 1, 1, 1, 1,
0.7335769, -0.494681, 1.829947, 1, 1, 1, 1, 1,
0.7463015, 0.006116535, 1.639934, 1, 1, 1, 1, 1,
0.7470897, -0.464751, 2.361838, 1, 1, 1, 1, 1,
0.747292, 0.317976, -1.08182, 1, 1, 1, 1, 1,
0.7473722, -0.2622189, 1.13434, 1, 1, 1, 1, 1,
0.7528502, 0.7589311, 0.2924111, 1, 1, 1, 1, 1,
0.7541509, -0.04048023, 1.492837, 1, 1, 1, 1, 1,
0.7596384, -0.4381293, 0.5034789, 1, 1, 1, 1, 1,
0.759717, -0.193324, 0.1475978, 1, 1, 1, 1, 1,
0.7599913, -0.5103841, 1.992702, 1, 1, 1, 1, 1,
0.7603761, -0.4005846, 2.400163, 1, 1, 1, 1, 1,
0.761908, -1.288147, 3.025171, 1, 1, 1, 1, 1,
0.76368, -1.987521, 3.434119, 1, 1, 1, 1, 1,
0.7698393, -0.7442201, 1.776851, 0, 0, 1, 1, 1,
0.7725158, 0.4391398, 0.9747679, 1, 0, 0, 1, 1,
0.7744759, 0.6861936, 0.9080124, 1, 0, 0, 1, 1,
0.7746862, 0.8636903, 1.094044, 1, 0, 0, 1, 1,
0.7754632, 2.366942, 0.4452017, 1, 0, 0, 1, 1,
0.775872, -1.149783, 1.539112, 1, 0, 0, 1, 1,
0.7759692, -0.4952244, 1.440519, 0, 0, 0, 1, 1,
0.7769341, 1.070248, 0.6630544, 0, 0, 0, 1, 1,
0.7839996, 0.02304037, 0.3213351, 0, 0, 0, 1, 1,
0.7863775, -0.8088626, 3.396252, 0, 0, 0, 1, 1,
0.792173, -1.31906, 4.051453, 0, 0, 0, 1, 1,
0.793699, 0.7157737, 1.115666, 0, 0, 0, 1, 1,
0.7957022, -1.829221, 3.501808, 0, 0, 0, 1, 1,
0.7975479, 0.315073, -0.7386678, 1, 1, 1, 1, 1,
0.8054503, 0.3645705, 1.928029, 1, 1, 1, 1, 1,
0.8169165, 0.746266, -0.2314895, 1, 1, 1, 1, 1,
0.8183842, 0.2915528, 2.680791, 1, 1, 1, 1, 1,
0.8184298, 0.6790331, 0.2582012, 1, 1, 1, 1, 1,
0.8192973, -0.03410954, 1.866835, 1, 1, 1, 1, 1,
0.8220615, -0.09165422, 1.862669, 1, 1, 1, 1, 1,
0.8249044, 0.02965704, 1.881856, 1, 1, 1, 1, 1,
0.8297248, 0.7800339, 2.048824, 1, 1, 1, 1, 1,
0.8319103, -0.6781489, 1.18911, 1, 1, 1, 1, 1,
0.8405778, -0.2128296, 2.892648, 1, 1, 1, 1, 1,
0.8442139, 0.5164019, 1.924666, 1, 1, 1, 1, 1,
0.8452143, 0.2755727, 1.361226, 1, 1, 1, 1, 1,
0.8468903, -0.4332093, 0.8264345, 1, 1, 1, 1, 1,
0.8488738, 0.0304293, 1.611434, 1, 1, 1, 1, 1,
0.849161, -0.7338364, 1.66016, 0, 0, 1, 1, 1,
0.8495171, -1.098468, 2.606226, 1, 0, 0, 1, 1,
0.8502107, 0.4070253, 2.051145, 1, 0, 0, 1, 1,
0.8505149, 0.1934137, 2.091878, 1, 0, 0, 1, 1,
0.8530405, 1.243284, 2.243456, 1, 0, 0, 1, 1,
0.857, -1.316272, 3.109334, 1, 0, 0, 1, 1,
0.8586802, -0.4635988, 2.637877, 0, 0, 0, 1, 1,
0.8623953, -0.7010893, 2.409993, 0, 0, 0, 1, 1,
0.8645651, -0.7344298, 2.489091, 0, 0, 0, 1, 1,
0.8659526, 0.6702303, 0.6246091, 0, 0, 0, 1, 1,
0.8728706, -1.148714, 2.51906, 0, 0, 0, 1, 1,
0.8730357, -0.3623519, 1.948727, 0, 0, 0, 1, 1,
0.8787743, 0.7989622, 0.891023, 0, 0, 0, 1, 1,
0.8818396, 0.204209, 0.4255156, 1, 1, 1, 1, 1,
0.8868847, 0.5136108, 0.9769861, 1, 1, 1, 1, 1,
0.8926058, -0.1893532, 2.328361, 1, 1, 1, 1, 1,
0.8990427, 0.4943388, 1.388497, 1, 1, 1, 1, 1,
0.8991675, 1.274394, 1.429295, 1, 1, 1, 1, 1,
0.8993489, -1.345217, 2.521839, 1, 1, 1, 1, 1,
0.9020159, 0.3685516, 1.849549, 1, 1, 1, 1, 1,
0.9061087, -0.4404307, 3.199155, 1, 1, 1, 1, 1,
0.9087529, 0.2356038, 1.078037, 1, 1, 1, 1, 1,
0.91971, 0.2880202, 1.463921, 1, 1, 1, 1, 1,
0.9233083, -1.498939, 2.506715, 1, 1, 1, 1, 1,
0.9287167, 1.85746, -0.6047407, 1, 1, 1, 1, 1,
0.9328583, -0.8713974, 1.200214, 1, 1, 1, 1, 1,
0.9330457, 0.6084867, 2.046438, 1, 1, 1, 1, 1,
0.9346621, -0.1238055, 2.207462, 1, 1, 1, 1, 1,
0.9371281, 0.8166555, 0.8721005, 0, 0, 1, 1, 1,
0.9404571, -0.8599545, 3.522085, 1, 0, 0, 1, 1,
0.9471968, 0.4095608, 0.1070428, 1, 0, 0, 1, 1,
0.9492015, -0.3385164, 0.6847484, 1, 0, 0, 1, 1,
0.952616, 0.5845222, 1.748357, 1, 0, 0, 1, 1,
0.9578849, 0.8804389, -0.9826689, 1, 0, 0, 1, 1,
0.9653684, 0.6293145, 1.697328, 0, 0, 0, 1, 1,
0.9692407, -0.7757212, 1.692073, 0, 0, 0, 1, 1,
0.9738958, 0.9242064, -0.838502, 0, 0, 0, 1, 1,
0.9757916, 0.4259537, 2.583431, 0, 0, 0, 1, 1,
0.9877044, -0.5028309, 2.635674, 0, 0, 0, 1, 1,
0.9919671, 0.6869357, 1.007482, 0, 0, 0, 1, 1,
0.9938399, 1.288404, -0.2819374, 0, 0, 0, 1, 1,
1.000272, 0.9969682, 1.144555, 1, 1, 1, 1, 1,
1.01101, 0.4383474, 1.127544, 1, 1, 1, 1, 1,
1.017667, 0.548445, 1.291925, 1, 1, 1, 1, 1,
1.019796, -1.14883, 1.78354, 1, 1, 1, 1, 1,
1.023611, 0.6182763, 2.816139, 1, 1, 1, 1, 1,
1.026667, -0.5801618, 3.328092, 1, 1, 1, 1, 1,
1.02712, -1.887763, 3.773823, 1, 1, 1, 1, 1,
1.028072, 0.08190536, 1.386739, 1, 1, 1, 1, 1,
1.042733, 0.1921871, 1.655373, 1, 1, 1, 1, 1,
1.042848, -1.509438, 0.5578854, 1, 1, 1, 1, 1,
1.04509, 1.03008, 0.2268923, 1, 1, 1, 1, 1,
1.052345, -0.9301634, 3.263742, 1, 1, 1, 1, 1,
1.054358, -1.216196, 1.328132, 1, 1, 1, 1, 1,
1.054868, 1.289841, 0.6619193, 1, 1, 1, 1, 1,
1.064668, -0.6281412, 0.8630518, 1, 1, 1, 1, 1,
1.067942, -0.1226204, 2.130184, 0, 0, 1, 1, 1,
1.068965, -1.206349, 2.37449, 1, 0, 0, 1, 1,
1.070088, 0.8885161, 1.814049, 1, 0, 0, 1, 1,
1.074454, -0.9554833, 3.312172, 1, 0, 0, 1, 1,
1.079334, -0.05910156, 2.885286, 1, 0, 0, 1, 1,
1.085094, 0.8784176, 1.227233, 1, 0, 0, 1, 1,
1.085673, 0.3044468, 0.3177531, 0, 0, 0, 1, 1,
1.086373, -1.020231, 2.164914, 0, 0, 0, 1, 1,
1.08772, 0.7468389, 0.8509536, 0, 0, 0, 1, 1,
1.092264, -0.2712716, 2.689905, 0, 0, 0, 1, 1,
1.093269, 0.6021867, 1.138289, 0, 0, 0, 1, 1,
1.093476, -0.1594314, 1.351225, 0, 0, 0, 1, 1,
1.097465, -0.429664, 1.806353, 0, 0, 0, 1, 1,
1.098654, -1.671018, 4.241302, 1, 1, 1, 1, 1,
1.100786, 1.208584, 1.855877, 1, 1, 1, 1, 1,
1.103697, -0.02683496, 3.592399, 1, 1, 1, 1, 1,
1.106978, -0.7873914, 1.806599, 1, 1, 1, 1, 1,
1.107033, 0.3873149, 1.509652, 1, 1, 1, 1, 1,
1.111572, -0.04584838, 3.210713, 1, 1, 1, 1, 1,
1.111807, -0.8136494, 1.865011, 1, 1, 1, 1, 1,
1.114169, 0.5872528, -0.1552791, 1, 1, 1, 1, 1,
1.114359, 0.2767614, 1.223822, 1, 1, 1, 1, 1,
1.115632, -1.257164, 3.766394, 1, 1, 1, 1, 1,
1.116187, 0.5860366, 1.014542, 1, 1, 1, 1, 1,
1.12163, 0.9339582, -0.2866942, 1, 1, 1, 1, 1,
1.125205, 0.9715678, 0.08829682, 1, 1, 1, 1, 1,
1.128083, 1.552375, 1.639038, 1, 1, 1, 1, 1,
1.132183, -0.2383915, 1.377518, 1, 1, 1, 1, 1,
1.13682, 1.307437, 0.9001652, 0, 0, 1, 1, 1,
1.139539, 0.3011717, 1.629468, 1, 0, 0, 1, 1,
1.152027, 0.07011991, 1.025874, 1, 0, 0, 1, 1,
1.166014, 0.8177648, 0.4014357, 1, 0, 0, 1, 1,
1.175254, -1.086821, 1.48792, 1, 0, 0, 1, 1,
1.176748, -1.34197, 2.636786, 1, 0, 0, 1, 1,
1.180422, 1.531627, 0.3285923, 0, 0, 0, 1, 1,
1.190894, -1.14806, 1.486841, 0, 0, 0, 1, 1,
1.192179, -1.917945, 3.410118, 0, 0, 0, 1, 1,
1.219575, -0.989788, 2.596098, 0, 0, 0, 1, 1,
1.219789, 1.085614, 0.0296191, 0, 0, 0, 1, 1,
1.223322, 1.257136, -0.09968699, 0, 0, 0, 1, 1,
1.225291, -1.128316, 1.277645, 0, 0, 0, 1, 1,
1.230357, -2.192605, 1.765599, 1, 1, 1, 1, 1,
1.231676, 0.7501019, 1.346816, 1, 1, 1, 1, 1,
1.234029, 0.9185449, 0.0608727, 1, 1, 1, 1, 1,
1.242571, -1.67121, 3.502778, 1, 1, 1, 1, 1,
1.245927, -0.3671087, 3.902772, 1, 1, 1, 1, 1,
1.246636, 0.2846466, 0.7377743, 1, 1, 1, 1, 1,
1.24788, -0.4984871, 2.594568, 1, 1, 1, 1, 1,
1.248919, -2.801841, 3.819339, 1, 1, 1, 1, 1,
1.270597, 0.4792359, 0.7673669, 1, 1, 1, 1, 1,
1.272536, -1.761276, 1.368202, 1, 1, 1, 1, 1,
1.273064, 0.6739274, 1.551493, 1, 1, 1, 1, 1,
1.273406, 1.542885, 2.385103, 1, 1, 1, 1, 1,
1.273813, 1.339053, 0.5503455, 1, 1, 1, 1, 1,
1.273851, 0.1584976, 1.640017, 1, 1, 1, 1, 1,
1.307281, 1.108899, 1.452656, 1, 1, 1, 1, 1,
1.307337, -1.556489, 2.375751, 0, 0, 1, 1, 1,
1.310086, 1.069946, 1.984832, 1, 0, 0, 1, 1,
1.318183, 0.6876772, 2.163548, 1, 0, 0, 1, 1,
1.339295, -2.209631, 2.341403, 1, 0, 0, 1, 1,
1.347085, -0.4151817, 1.365904, 1, 0, 0, 1, 1,
1.355421, 0.9858409, 2.142513, 1, 0, 0, 1, 1,
1.362229, -0.1381499, 2.370032, 0, 0, 0, 1, 1,
1.373746, 0.921428, -0.2911542, 0, 0, 0, 1, 1,
1.374426, 0.4208333, 2.713409, 0, 0, 0, 1, 1,
1.376708, 0.3613161, 2.449853, 0, 0, 0, 1, 1,
1.384497, 1.363662, 0.9187272, 0, 0, 0, 1, 1,
1.398825, 0.5694266, 2.098043, 0, 0, 0, 1, 1,
1.404104, -0.8123029, 2.295987, 0, 0, 0, 1, 1,
1.404522, 0.5806392, 2.072661, 1, 1, 1, 1, 1,
1.406575, -0.1349967, 2.106403, 1, 1, 1, 1, 1,
1.413491, -1.386508, 2.343913, 1, 1, 1, 1, 1,
1.416946, -1.208794, 1.993299, 1, 1, 1, 1, 1,
1.423476, 1.26998, 1.752811, 1, 1, 1, 1, 1,
1.451218, -0.2936377, 2.530679, 1, 1, 1, 1, 1,
1.453984, 0.1915591, 1.05359, 1, 1, 1, 1, 1,
1.463853, 0.2365594, 0.7612273, 1, 1, 1, 1, 1,
1.465937, 0.05913639, 1.323161, 1, 1, 1, 1, 1,
1.473297, -1.204661, 1.990237, 1, 1, 1, 1, 1,
1.475923, 0.88456, 0.7151468, 1, 1, 1, 1, 1,
1.479199, -1.520966, 2.698887, 1, 1, 1, 1, 1,
1.492402, -0.5943762, 1.516479, 1, 1, 1, 1, 1,
1.509163, -1.819367, 0.4486949, 1, 1, 1, 1, 1,
1.526662, -1.588122, 4.194582, 1, 1, 1, 1, 1,
1.568365, -0.5534043, 2.413786, 0, 0, 1, 1, 1,
1.576518, 1.056101, 0.3045158, 1, 0, 0, 1, 1,
1.577788, -0.9607797, 1.224115, 1, 0, 0, 1, 1,
1.581195, -0.2019641, 0.9482849, 1, 0, 0, 1, 1,
1.588233, -0.5167422, 0.7939962, 1, 0, 0, 1, 1,
1.592062, -1.072873, 1.506329, 1, 0, 0, 1, 1,
1.600407, 1.281987, 1.248089, 0, 0, 0, 1, 1,
1.624462, -0.406938, 2.766517, 0, 0, 0, 1, 1,
1.627281, -1.367113, 0.7496238, 0, 0, 0, 1, 1,
1.63397, 0.05500496, 3.001414, 0, 0, 0, 1, 1,
1.640977, -1.301671, 2.004784, 0, 0, 0, 1, 1,
1.649231, 0.02622307, 0.6172088, 0, 0, 0, 1, 1,
1.653109, 0.2034683, 2.186239, 0, 0, 0, 1, 1,
1.665177, -0.4238593, 0.4534614, 1, 1, 1, 1, 1,
1.666988, 0.105207, 1.21507, 1, 1, 1, 1, 1,
1.701202, 0.003462197, 1.159167, 1, 1, 1, 1, 1,
1.701495, -0.05048689, 2.174809, 1, 1, 1, 1, 1,
1.710004, -0.5330887, 2.836116, 1, 1, 1, 1, 1,
1.733955, 1.999046, 0.1420771, 1, 1, 1, 1, 1,
1.781928, -0.2205577, 1.933068, 1, 1, 1, 1, 1,
1.783812, -0.6994998, 3.769531, 1, 1, 1, 1, 1,
1.785, 1.705665, 1.146747, 1, 1, 1, 1, 1,
1.827392, 2.212261, 1.448565, 1, 1, 1, 1, 1,
1.832528, -0.7091742, 3.315236, 1, 1, 1, 1, 1,
1.87595, 0.1885843, 2.680601, 1, 1, 1, 1, 1,
1.890545, 0.3046058, 3.372903, 1, 1, 1, 1, 1,
1.983546, 1.695707, -0.4321148, 1, 1, 1, 1, 1,
2.033174, 1.771356, 1.457933, 1, 1, 1, 1, 1,
2.046027, -0.6339196, 1.379473, 0, 0, 1, 1, 1,
2.089233, -0.6635638, 2.957915, 1, 0, 0, 1, 1,
2.101837, 0.1850431, 1.327329, 1, 0, 0, 1, 1,
2.166042, 1.205552, -0.1582343, 1, 0, 0, 1, 1,
2.185904, -1.03116, 0.7339582, 1, 0, 0, 1, 1,
2.196894, 0.579653, 0.5725544, 1, 0, 0, 1, 1,
2.198156, 1.458419, 2.011743, 0, 0, 0, 1, 1,
2.237934, -0.6166962, 0.6462085, 0, 0, 0, 1, 1,
2.25241, 1.550821, 1.131271, 0, 0, 0, 1, 1,
2.28111, 2.751801, -0.1656131, 0, 0, 0, 1, 1,
2.306219, -0.3715186, 0.7296877, 0, 0, 0, 1, 1,
2.317513, 3.059457, 0.159958, 0, 0, 0, 1, 1,
2.318714, 0.6053453, -0.07645648, 0, 0, 0, 1, 1,
2.378315, 2.064332, 1.893082, 1, 1, 1, 1, 1,
2.435387, 0.419176, 1.286886, 1, 1, 1, 1, 1,
2.487603, -0.06104324, 1.281201, 1, 1, 1, 1, 1,
2.586623, -0.8056728, 2.496768, 1, 1, 1, 1, 1,
2.681935, 0.593181, 1.579649, 1, 1, 1, 1, 1,
2.924681, -0.0404084, 2.093915, 1, 1, 1, 1, 1,
3.41329, 1.223811, -0.9911756, 1, 1, 1, 1, 1
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
var radius = 9.412704;
var distance = 33.06173;
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
mvMatrix.translate( -0.06757617, -0.06947231, 0.1222289 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.06173);
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
