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
-3.088674, -1.825481, -2.335547, 1, 0, 0, 1,
-3.036974, 0.6803269, -1.388365, 1, 0.007843138, 0, 1,
-3.007879, -0.5135162, -2.570362, 1, 0.01176471, 0, 1,
-2.928895, 0.3962558, -0.8357817, 1, 0.01960784, 0, 1,
-2.917572, 0.8713483, -1.000102, 1, 0.02352941, 0, 1,
-2.800536, -0.9121425, -4.615752, 1, 0.03137255, 0, 1,
-2.790813, 0.5969318, -1.961906, 1, 0.03529412, 0, 1,
-2.665854, -0.5546763, -2.034571, 1, 0.04313726, 0, 1,
-2.581627, -0.5133433, -2.854497, 1, 0.04705882, 0, 1,
-2.557215, -0.4702197, -1.766236, 1, 0.05490196, 0, 1,
-2.512978, -1.674783, -0.6776436, 1, 0.05882353, 0, 1,
-2.448875, -0.2225169, -1.230768, 1, 0.06666667, 0, 1,
-2.39274, 1.370677, 0.7229739, 1, 0.07058824, 0, 1,
-2.302065, -1.450757, -1.611547, 1, 0.07843138, 0, 1,
-2.265549, 0.8135938, -0.8614315, 1, 0.08235294, 0, 1,
-2.257646, 0.2839399, -2.909457, 1, 0.09019608, 0, 1,
-2.224403, -0.4307525, -2.032862, 1, 0.09411765, 0, 1,
-2.20424, -1.305002, -3.069825, 1, 0.1019608, 0, 1,
-2.16332, -0.01993666, -0.9259323, 1, 0.1098039, 0, 1,
-2.153587, -0.4044055, -0.6010027, 1, 0.1137255, 0, 1,
-2.143907, 0.3777256, -3.000449, 1, 0.1215686, 0, 1,
-2.088512, -1.234647, -0.7958578, 1, 0.1254902, 0, 1,
-2.051987, 0.8082013, 0.1202586, 1, 0.1333333, 0, 1,
-2.022001, 0.2648172, -1.186594, 1, 0.1372549, 0, 1,
-1.992544, 0.6570044, -1.805172, 1, 0.145098, 0, 1,
-1.936453, -1.177861, -1.885037, 1, 0.1490196, 0, 1,
-1.918396, -0.8161212, -1.452635, 1, 0.1568628, 0, 1,
-1.889953, 0.758603, -0.6624027, 1, 0.1607843, 0, 1,
-1.854564, -0.5252791, -0.7078174, 1, 0.1686275, 0, 1,
-1.841225, 0.5336556, -0.6582291, 1, 0.172549, 0, 1,
-1.838506, 0.9998705, 1.235258, 1, 0.1803922, 0, 1,
-1.834774, -0.203464, 0.1230649, 1, 0.1843137, 0, 1,
-1.819669, -1.1089, -2.963904, 1, 0.1921569, 0, 1,
-1.818886, -0.480706, -1.718922, 1, 0.1960784, 0, 1,
-1.815896, 2.307536, -2.150526, 1, 0.2039216, 0, 1,
-1.757874, 2.166685, -1.037233, 1, 0.2117647, 0, 1,
-1.752599, -0.2895815, -2.2568, 1, 0.2156863, 0, 1,
-1.719315, 0.2402459, -0.6224169, 1, 0.2235294, 0, 1,
-1.712286, -0.3880242, 0.3158896, 1, 0.227451, 0, 1,
-1.709654, 1.009235, -1.62032, 1, 0.2352941, 0, 1,
-1.697318, 0.8333622, -0.7905716, 1, 0.2392157, 0, 1,
-1.690565, -1.871439, -2.377405, 1, 0.2470588, 0, 1,
-1.687227, -1.06179, -3.09397, 1, 0.2509804, 0, 1,
-1.686076, -0.5438194, -1.500146, 1, 0.2588235, 0, 1,
-1.64982, -0.3280546, -1.9954, 1, 0.2627451, 0, 1,
-1.645425, 0.2998495, 1.058374, 1, 0.2705882, 0, 1,
-1.633202, 0.9826806, -1.347224, 1, 0.2745098, 0, 1,
-1.624104, 0.8415722, -3.052514, 1, 0.282353, 0, 1,
-1.610371, -0.2023792, -0.4881223, 1, 0.2862745, 0, 1,
-1.586583, 0.36926, -2.258074, 1, 0.2941177, 0, 1,
-1.563052, -0.2125157, -2.650599, 1, 0.3019608, 0, 1,
-1.549008, -0.7830846, -4.1702, 1, 0.3058824, 0, 1,
-1.547723, 1.21105, 0.08588278, 1, 0.3137255, 0, 1,
-1.539997, -0.6958902, -2.434852, 1, 0.3176471, 0, 1,
-1.526417, -0.2416705, -2.027828, 1, 0.3254902, 0, 1,
-1.520572, 0.2491284, -2.151189, 1, 0.3294118, 0, 1,
-1.508455, 0.2095578, -0.9278245, 1, 0.3372549, 0, 1,
-1.505893, 3.00361, -0.04234184, 1, 0.3411765, 0, 1,
-1.488884, -0.9919918, -1.015748, 1, 0.3490196, 0, 1,
-1.484445, -0.7022716, -2.475298, 1, 0.3529412, 0, 1,
-1.480698, -0.4474688, -3.607915, 1, 0.3607843, 0, 1,
-1.470458, -1.718069, -2.504652, 1, 0.3647059, 0, 1,
-1.463035, 0.08697942, -1.267236, 1, 0.372549, 0, 1,
-1.442523, 0.1707104, -0.9591875, 1, 0.3764706, 0, 1,
-1.434755, -0.2958377, -2.113125, 1, 0.3843137, 0, 1,
-1.4141, 1.493494, -1.706163, 1, 0.3882353, 0, 1,
-1.408501, 0.2631478, -1.239018, 1, 0.3960784, 0, 1,
-1.384905, -0.1105015, -0.09455629, 1, 0.4039216, 0, 1,
-1.370919, 0.9318729, -2.442888, 1, 0.4078431, 0, 1,
-1.367147, 0.3306817, -0.5725912, 1, 0.4156863, 0, 1,
-1.362095, 0.9344808, 0.4747417, 1, 0.4196078, 0, 1,
-1.359955, 0.9472039, -2.535216, 1, 0.427451, 0, 1,
-1.355131, -0.8444517, -3.372811, 1, 0.4313726, 0, 1,
-1.340747, 0.2187883, -1.98564, 1, 0.4392157, 0, 1,
-1.335444, 0.9043943, -0.1094483, 1, 0.4431373, 0, 1,
-1.332764, 0.8951942, -0.7284493, 1, 0.4509804, 0, 1,
-1.33093, 1.194719, 0.07419324, 1, 0.454902, 0, 1,
-1.328701, -0.4149148, -2.721942, 1, 0.4627451, 0, 1,
-1.324481, -1.15169, -1.671789, 1, 0.4666667, 0, 1,
-1.318936, 0.1397902, -1.392106, 1, 0.4745098, 0, 1,
-1.314873, 0.5945022, -1.999378, 1, 0.4784314, 0, 1,
-1.313166, 0.5399154, -1.180041, 1, 0.4862745, 0, 1,
-1.294523, 0.2762638, -0.9502398, 1, 0.4901961, 0, 1,
-1.291045, 0.4383768, -0.3377183, 1, 0.4980392, 0, 1,
-1.28922, 0.9572734, -0.3055786, 1, 0.5058824, 0, 1,
-1.288908, 0.4371378, -0.5622929, 1, 0.509804, 0, 1,
-1.276661, 1.72133, 0.6539631, 1, 0.5176471, 0, 1,
-1.268436, 0.3069734, -1.930155, 1, 0.5215687, 0, 1,
-1.257599, -0.03891388, -1.68161, 1, 0.5294118, 0, 1,
-1.255702, 0.8111817, 0.814534, 1, 0.5333334, 0, 1,
-1.245394, 0.4796425, -0.6529198, 1, 0.5411765, 0, 1,
-1.241611, 1.990212, -0.2016763, 1, 0.5450981, 0, 1,
-1.235465, -0.2482154, -2.779625, 1, 0.5529412, 0, 1,
-1.232886, -1.425607, -0.7262903, 1, 0.5568628, 0, 1,
-1.231959, -1.328102, -4.224703, 1, 0.5647059, 0, 1,
-1.231944, -0.9158615, -0.3178843, 1, 0.5686275, 0, 1,
-1.227069, 1.507768, -0.2686637, 1, 0.5764706, 0, 1,
-1.224652, 3.488074, 0.4640719, 1, 0.5803922, 0, 1,
-1.210141, 0.1479287, -1.916538, 1, 0.5882353, 0, 1,
-1.202919, 0.2080694, -2.144184, 1, 0.5921569, 0, 1,
-1.19849, 0.06765371, -0.428877, 1, 0.6, 0, 1,
-1.191828, -2.274426, 0.02891399, 1, 0.6078432, 0, 1,
-1.19, 0.2699724, -0.5740541, 1, 0.6117647, 0, 1,
-1.18927, 0.6970596, -1.220198, 1, 0.6196079, 0, 1,
-1.185744, -0.7012084, 0.4275279, 1, 0.6235294, 0, 1,
-1.182017, -0.1645797, -1.414286, 1, 0.6313726, 0, 1,
-1.180317, 0.2556121, 0.07933267, 1, 0.6352941, 0, 1,
-1.177616, 0.4329003, 0.5883899, 1, 0.6431373, 0, 1,
-1.173543, 0.083144, 0.1627722, 1, 0.6470588, 0, 1,
-1.168505, -1.157604, -1.931296, 1, 0.654902, 0, 1,
-1.165473, 0.2190342, -0.2553122, 1, 0.6588235, 0, 1,
-1.158825, 0.04986655, -1.486968, 1, 0.6666667, 0, 1,
-1.157434, 0.07293753, -1.863708, 1, 0.6705883, 0, 1,
-1.152692, 0.8019804, -1.279626, 1, 0.6784314, 0, 1,
-1.146609, 0.3765779, -0.6257917, 1, 0.682353, 0, 1,
-1.137597, 1.145981, -2.031203, 1, 0.6901961, 0, 1,
-1.133263, -0.08544118, -1.492998, 1, 0.6941177, 0, 1,
-1.130172, -2.15662, -2.423427, 1, 0.7019608, 0, 1,
-1.129257, 0.7754813, -1.464625, 1, 0.7098039, 0, 1,
-1.127138, 0.42169, -2.118288, 1, 0.7137255, 0, 1,
-1.126626, 0.1982833, -0.9485596, 1, 0.7215686, 0, 1,
-1.115288, 1.211232, -2.250368, 1, 0.7254902, 0, 1,
-1.115106, 0.6865437, -1.141864, 1, 0.7333333, 0, 1,
-1.103593, -1.560346, -1.43383, 1, 0.7372549, 0, 1,
-1.101045, -0.4806087, -1.973996, 1, 0.7450981, 0, 1,
-1.09565, -1.738466, -1.353911, 1, 0.7490196, 0, 1,
-1.090389, 1.016684, 0.2305281, 1, 0.7568628, 0, 1,
-1.086436, -1.997814, -3.757651, 1, 0.7607843, 0, 1,
-1.086379, 0.1222039, -2.50437, 1, 0.7686275, 0, 1,
-1.086057, -0.6246027, -2.690737, 1, 0.772549, 0, 1,
-1.074712, -2.120444, -3.487417, 1, 0.7803922, 0, 1,
-1.071628, 0.109797, -0.3237663, 1, 0.7843137, 0, 1,
-1.068983, -1.326545, -3.427668, 1, 0.7921569, 0, 1,
-1.060943, -0.01150842, 0.06239388, 1, 0.7960784, 0, 1,
-1.057637, 0.721482, -1.817249, 1, 0.8039216, 0, 1,
-1.055562, 0.05492613, -1.812203, 1, 0.8117647, 0, 1,
-1.048933, -0.6017994, -0.7350476, 1, 0.8156863, 0, 1,
-1.030532, 0.2799476, 0.009777548, 1, 0.8235294, 0, 1,
-1.02992, 0.4222918, -1.387258, 1, 0.827451, 0, 1,
-1.02912, 0.5368823, -0.374027, 1, 0.8352941, 0, 1,
-1.025131, 1.163578, -0.28162, 1, 0.8392157, 0, 1,
-1.021989, -0.8652277, -1.543649, 1, 0.8470588, 0, 1,
-1.020815, -1.396498, -2.748808, 1, 0.8509804, 0, 1,
-1.011125, -0.3546139, -1.614629, 1, 0.8588235, 0, 1,
-1.00771, 2.654007, 1.018674, 1, 0.8627451, 0, 1,
-1.006389, -0.2655157, -2.279775, 1, 0.8705882, 0, 1,
-1.00564, -0.167911, -2.065533, 1, 0.8745098, 0, 1,
-1.002512, 0.2261374, 1.241227, 1, 0.8823529, 0, 1,
-0.9998852, 0.7418802, -0.01897679, 1, 0.8862745, 0, 1,
-0.9924594, 0.636411, -3.469082, 1, 0.8941177, 0, 1,
-0.9894344, -0.02527553, -0.3806575, 1, 0.8980392, 0, 1,
-0.9708866, -0.5049715, -1.503026, 1, 0.9058824, 0, 1,
-0.9686626, -1.493386, -2.82738, 1, 0.9137255, 0, 1,
-0.9654124, 0.6989691, -0.3911907, 1, 0.9176471, 0, 1,
-0.964984, 0.3161759, -2.09997, 1, 0.9254902, 0, 1,
-0.9643523, 1.232023, -0.6442398, 1, 0.9294118, 0, 1,
-0.961346, -1.772666, -3.068955, 1, 0.9372549, 0, 1,
-0.9573084, 0.004577437, -3.26705, 1, 0.9411765, 0, 1,
-0.945591, 0.6009209, -2.041891, 1, 0.9490196, 0, 1,
-0.941361, -2.298372, -2.898753, 1, 0.9529412, 0, 1,
-0.9364728, 0.6120887, -1.073851, 1, 0.9607843, 0, 1,
-0.9352215, -0.1924644, -3.022315, 1, 0.9647059, 0, 1,
-0.9331132, 0.2447072, -2.408573, 1, 0.972549, 0, 1,
-0.9323422, -0.1536562, -2.814909, 1, 0.9764706, 0, 1,
-0.9317014, 0.4131899, -1.46898, 1, 0.9843137, 0, 1,
-0.9257774, -0.2440273, -2.730274, 1, 0.9882353, 0, 1,
-0.9250033, -1.264182, -1.534691, 1, 0.9960784, 0, 1,
-0.9061016, 0.3147453, -0.5328898, 0.9960784, 1, 0, 1,
-0.9039642, -1.125366, -3.755591, 0.9921569, 1, 0, 1,
-0.899084, 2.444887, -0.3205378, 0.9843137, 1, 0, 1,
-0.8979787, 0.4575957, -0.9151984, 0.9803922, 1, 0, 1,
-0.8959064, 0.5686285, -1.659687, 0.972549, 1, 0, 1,
-0.8942687, -1.004522, -1.814911, 0.9686275, 1, 0, 1,
-0.891494, -1.603872, -1.356859, 0.9607843, 1, 0, 1,
-0.8823004, 0.9688479, -1.081584, 0.9568627, 1, 0, 1,
-0.8685181, 0.904996, -1.683149, 0.9490196, 1, 0, 1,
-0.8665244, 0.7694563, -1.451882, 0.945098, 1, 0, 1,
-0.8618017, 0.9183059, -0.05159876, 0.9372549, 1, 0, 1,
-0.8598622, 0.4833257, -0.2135668, 0.9333333, 1, 0, 1,
-0.8561459, -0.9428169, 0.1045818, 0.9254902, 1, 0, 1,
-0.8543884, 2.094144, -0.08518258, 0.9215686, 1, 0, 1,
-0.8529329, 0.1790769, -0.5820358, 0.9137255, 1, 0, 1,
-0.8442534, -2.407636, -2.275282, 0.9098039, 1, 0, 1,
-0.8383071, 1.042675, -1.418012, 0.9019608, 1, 0, 1,
-0.8280408, 0.3362065, -3.51573, 0.8941177, 1, 0, 1,
-0.8110995, 0.03615184, -2.213287, 0.8901961, 1, 0, 1,
-0.8108856, -0.4826275, -0.7797035, 0.8823529, 1, 0, 1,
-0.8083744, 1.410776, -2.082436, 0.8784314, 1, 0, 1,
-0.8028663, 1.387699, 1.299388, 0.8705882, 1, 0, 1,
-0.8026271, 0.2238083, 0.1996362, 0.8666667, 1, 0, 1,
-0.7908545, 0.3065107, -0.9035055, 0.8588235, 1, 0, 1,
-0.7834439, 1.017437, 0.08025038, 0.854902, 1, 0, 1,
-0.7810221, -0.2533515, -2.517958, 0.8470588, 1, 0, 1,
-0.7808155, -0.8272508, -2.51759, 0.8431373, 1, 0, 1,
-0.7799952, 0.5174704, -0.6956953, 0.8352941, 1, 0, 1,
-0.774385, -0.9991076, -3.461569, 0.8313726, 1, 0, 1,
-0.7684399, 0.5608793, -0.3662323, 0.8235294, 1, 0, 1,
-0.7637444, 2.10194, 0.9370238, 0.8196079, 1, 0, 1,
-0.7625231, -1.556714, -1.980628, 0.8117647, 1, 0, 1,
-0.7602263, -0.7692068, -3.274134, 0.8078431, 1, 0, 1,
-0.7593204, 0.4595477, -1.35693, 0.8, 1, 0, 1,
-0.758534, -0.05660148, -1.897599, 0.7921569, 1, 0, 1,
-0.7568024, 0.8125262, -0.1111587, 0.7882353, 1, 0, 1,
-0.7533617, -0.1740214, -0.9369858, 0.7803922, 1, 0, 1,
-0.7531213, -0.4084575, -1.910768, 0.7764706, 1, 0, 1,
-0.75306, 0.191634, -2.89221, 0.7686275, 1, 0, 1,
-0.7519851, 0.2037577, -0.984554, 0.7647059, 1, 0, 1,
-0.7485346, -1.071635, -4.039544, 0.7568628, 1, 0, 1,
-0.7479845, -1.958235, -1.881849, 0.7529412, 1, 0, 1,
-0.747484, -1.456352, -2.210291, 0.7450981, 1, 0, 1,
-0.7468868, -0.7407086, -1.932126, 0.7411765, 1, 0, 1,
-0.7422778, 0.190785, -0.6186225, 0.7333333, 1, 0, 1,
-0.7388408, 2.719723, -0.7966046, 0.7294118, 1, 0, 1,
-0.737509, -0.6275595, -1.939647, 0.7215686, 1, 0, 1,
-0.7291771, -0.1499198, -2.94315, 0.7176471, 1, 0, 1,
-0.7284784, 0.1957085, 0.5347781, 0.7098039, 1, 0, 1,
-0.7273738, -1.530102, -1.604781, 0.7058824, 1, 0, 1,
-0.7268465, -1.666005, -2.409952, 0.6980392, 1, 0, 1,
-0.7264531, -0.3376395, -2.505508, 0.6901961, 1, 0, 1,
-0.7260795, 0.3691854, -0.6688051, 0.6862745, 1, 0, 1,
-0.7234623, -1.412448, -2.374073, 0.6784314, 1, 0, 1,
-0.7206703, 0.7125928, -0.2950322, 0.6745098, 1, 0, 1,
-0.7136835, 0.2791861, -1.28649, 0.6666667, 1, 0, 1,
-0.7136272, 1.590952, -0.9082749, 0.6627451, 1, 0, 1,
-0.7103329, 0.5252307, -2.53593, 0.654902, 1, 0, 1,
-0.7102777, 1.044126, -0.1829921, 0.6509804, 1, 0, 1,
-0.7076072, -0.9035332, -3.955906, 0.6431373, 1, 0, 1,
-0.7053621, -2.681992, -1.854972, 0.6392157, 1, 0, 1,
-0.7013289, -1.569335, -2.770674, 0.6313726, 1, 0, 1,
-0.6964101, -0.5647134, -3.254676, 0.627451, 1, 0, 1,
-0.6963886, -1.539498, -2.073622, 0.6196079, 1, 0, 1,
-0.6958142, -0.3442554, -1.900089, 0.6156863, 1, 0, 1,
-0.6940782, 0.8233477, -1.757629, 0.6078432, 1, 0, 1,
-0.6937962, 1.044236, -2.314127, 0.6039216, 1, 0, 1,
-0.6912826, 1.471643, -0.1080983, 0.5960785, 1, 0, 1,
-0.6888799, -0.6209384, -1.377973, 0.5882353, 1, 0, 1,
-0.6869563, 0.003289184, -1.633366, 0.5843138, 1, 0, 1,
-0.6815057, -0.06791626, 0.2086049, 0.5764706, 1, 0, 1,
-0.6793493, -0.01997984, -0.7135655, 0.572549, 1, 0, 1,
-0.6675766, 0.4694211, 0.1391507, 0.5647059, 1, 0, 1,
-0.6583223, 1.279681, -0.3794727, 0.5607843, 1, 0, 1,
-0.6565338, 1.050942, -1.917067, 0.5529412, 1, 0, 1,
-0.6553453, 0.8642497, 0.1452376, 0.5490196, 1, 0, 1,
-0.6540668, 0.718748, -1.720155, 0.5411765, 1, 0, 1,
-0.6499901, 0.2356832, -1.528235, 0.5372549, 1, 0, 1,
-0.6462802, -0.2454118, -1.680064, 0.5294118, 1, 0, 1,
-0.6443421, -0.4520683, -3.433168, 0.5254902, 1, 0, 1,
-0.644056, 1.516286, 0.2496526, 0.5176471, 1, 0, 1,
-0.6393417, 1.273136, -0.2522755, 0.5137255, 1, 0, 1,
-0.6359301, 0.4218778, -0.9328451, 0.5058824, 1, 0, 1,
-0.6345777, -0.04150166, -2.184433, 0.5019608, 1, 0, 1,
-0.6299556, 0.6668214, -0.1427025, 0.4941176, 1, 0, 1,
-0.6271191, 0.7761942, -0.6801442, 0.4862745, 1, 0, 1,
-0.6263332, -0.4890561, -3.183784, 0.4823529, 1, 0, 1,
-0.6253973, 0.1345637, -2.144015, 0.4745098, 1, 0, 1,
-0.6211841, -0.6976365, -1.372481, 0.4705882, 1, 0, 1,
-0.6184543, -1.051513, -2.27666, 0.4627451, 1, 0, 1,
-0.6155944, 1.164446, -1.362581, 0.4588235, 1, 0, 1,
-0.6150926, 0.9324049, -0.7942536, 0.4509804, 1, 0, 1,
-0.6121681, -0.6076713, -3.174717, 0.4470588, 1, 0, 1,
-0.6112155, -0.2682373, -1.438407, 0.4392157, 1, 0, 1,
-0.6108208, -0.199152, -1.92428, 0.4352941, 1, 0, 1,
-0.6094471, -0.2478989, -2.791559, 0.427451, 1, 0, 1,
-0.6090747, 1.397828, -1.65056, 0.4235294, 1, 0, 1,
-0.599576, 0.1574345, -2.287092, 0.4156863, 1, 0, 1,
-0.5991964, -0.1258498, -2.653461, 0.4117647, 1, 0, 1,
-0.598684, 1.981174, -0.4141082, 0.4039216, 1, 0, 1,
-0.5923607, 1.002726, 1.215448, 0.3960784, 1, 0, 1,
-0.5884913, 1.052121, -1.073758, 0.3921569, 1, 0, 1,
-0.5837542, -0.5913488, -3.52387, 0.3843137, 1, 0, 1,
-0.5828483, 0.7038616, -0.09045197, 0.3803922, 1, 0, 1,
-0.5773014, -0.9395702, -3.72014, 0.372549, 1, 0, 1,
-0.5712047, -0.3947831, -2.737025, 0.3686275, 1, 0, 1,
-0.5673899, -1.388755, -2.816597, 0.3607843, 1, 0, 1,
-0.5527912, 1.555528, -0.6261086, 0.3568628, 1, 0, 1,
-0.5447344, -1.015836, -2.632266, 0.3490196, 1, 0, 1,
-0.5389917, -0.1160801, -1.639274, 0.345098, 1, 0, 1,
-0.5381342, 0.9169061, -0.292687, 0.3372549, 1, 0, 1,
-0.5380671, -0.05404313, -2.384869, 0.3333333, 1, 0, 1,
-0.5369987, -0.5291695, -3.572394, 0.3254902, 1, 0, 1,
-0.5359467, 1.843948, -0.6075286, 0.3215686, 1, 0, 1,
-0.5347444, 0.3692056, -0.392452, 0.3137255, 1, 0, 1,
-0.5326036, -0.1780132, -1.69294, 0.3098039, 1, 0, 1,
-0.5309341, 2.614755, 0.3566085, 0.3019608, 1, 0, 1,
-0.5301004, -0.3569681, -1.786037, 0.2941177, 1, 0, 1,
-0.5253832, -1.696837, -2.349707, 0.2901961, 1, 0, 1,
-0.519585, 0.6944695, 0.06680777, 0.282353, 1, 0, 1,
-0.5168906, -1.299782, -3.412263, 0.2784314, 1, 0, 1,
-0.5159294, -1.600699, -2.637826, 0.2705882, 1, 0, 1,
-0.5052355, 1.203197, -0.292672, 0.2666667, 1, 0, 1,
-0.495243, -2.004073, -4.721054, 0.2588235, 1, 0, 1,
-0.4950771, -0.7637705, -3.701601, 0.254902, 1, 0, 1,
-0.492874, -1.283708, -2.842358, 0.2470588, 1, 0, 1,
-0.4852965, 0.09305327, -2.367457, 0.2431373, 1, 0, 1,
-0.4833647, -0.02429185, 0.3043081, 0.2352941, 1, 0, 1,
-0.4743251, -1.690222, -3.342269, 0.2313726, 1, 0, 1,
-0.4717157, -0.0269286, -2.729697, 0.2235294, 1, 0, 1,
-0.4712864, 0.8643848, -1.277094, 0.2196078, 1, 0, 1,
-0.4692597, -2.261176, -2.3603, 0.2117647, 1, 0, 1,
-0.4671302, -0.3508664, -1.440422, 0.2078431, 1, 0, 1,
-0.465377, 2.047405, -0.05598912, 0.2, 1, 0, 1,
-0.4647696, 0.8241074, 1.465359, 0.1921569, 1, 0, 1,
-0.4613526, -0.004811285, -1.426208, 0.1882353, 1, 0, 1,
-0.4603662, 1.236602, 0.317586, 0.1803922, 1, 0, 1,
-0.458525, -1.155026, -1.628748, 0.1764706, 1, 0, 1,
-0.4548408, -0.8215379, -2.487305, 0.1686275, 1, 0, 1,
-0.4547002, -1.328474, -0.508402, 0.1647059, 1, 0, 1,
-0.4526288, 0.3147249, -0.2999093, 0.1568628, 1, 0, 1,
-0.4509845, 0.02660189, -1.570517, 0.1529412, 1, 0, 1,
-0.4504633, -0.7987443, -1.616173, 0.145098, 1, 0, 1,
-0.4486714, -0.05818869, -0.3277884, 0.1411765, 1, 0, 1,
-0.4483155, -1.527521, -0.4976339, 0.1333333, 1, 0, 1,
-0.4476519, -0.6657322, -5.855012, 0.1294118, 1, 0, 1,
-0.4464993, 1.306486, -1.219563, 0.1215686, 1, 0, 1,
-0.4435726, -1.161837, -3.898024, 0.1176471, 1, 0, 1,
-0.4409632, 1.340136, -1.148157, 0.1098039, 1, 0, 1,
-0.4388447, 0.9891347, 0.1428781, 0.1058824, 1, 0, 1,
-0.4369019, -0.5058441, -1.890884, 0.09803922, 1, 0, 1,
-0.4306785, -0.4689244, -2.768514, 0.09019608, 1, 0, 1,
-0.4240307, -2.442806, -3.403796, 0.08627451, 1, 0, 1,
-0.4230876, 1.716757, -0.1823002, 0.07843138, 1, 0, 1,
-0.4223011, -0.7715639, -3.786052, 0.07450981, 1, 0, 1,
-0.4215471, -0.0428081, -2.173598, 0.06666667, 1, 0, 1,
-0.4209192, 0.5370063, -0.1562021, 0.0627451, 1, 0, 1,
-0.4169102, -0.1120782, -2.829415, 0.05490196, 1, 0, 1,
-0.4119321, -1.434658, -3.053483, 0.05098039, 1, 0, 1,
-0.4112785, 0.2888663, 0.6523193, 0.04313726, 1, 0, 1,
-0.4033627, -0.6130655, -0.5391529, 0.03921569, 1, 0, 1,
-0.4032193, -1.351236, -0.6467983, 0.03137255, 1, 0, 1,
-0.403094, 0.4232655, -1.909458, 0.02745098, 1, 0, 1,
-0.4026813, -0.8650932, -3.182282, 0.01960784, 1, 0, 1,
-0.4010209, 0.9106025, 0.6917207, 0.01568628, 1, 0, 1,
-0.3985098, 0.04420978, -1.551212, 0.007843138, 1, 0, 1,
-0.3978876, -2.641473, -3.656918, 0.003921569, 1, 0, 1,
-0.396623, -0.4998161, -2.326286, 0, 1, 0.003921569, 1,
-0.3964055, 0.2993692, -1.79412, 0, 1, 0.01176471, 1,
-0.3949236, -0.2826841, -2.502059, 0, 1, 0.01568628, 1,
-0.3939925, -0.09492747, -2.924343, 0, 1, 0.02352941, 1,
-0.3937666, -0.385996, -4.323007, 0, 1, 0.02745098, 1,
-0.3926288, -1.57363, -2.410985, 0, 1, 0.03529412, 1,
-0.3864554, 2.511723, 0.6406801, 0, 1, 0.03921569, 1,
-0.3851295, 1.757486, -0.3835538, 0, 1, 0.04705882, 1,
-0.3797458, 1.382466, 1.768069, 0, 1, 0.05098039, 1,
-0.3787535, -1.295486, -2.238075, 0, 1, 0.05882353, 1,
-0.3769741, -1.207356, -4.43704, 0, 1, 0.0627451, 1,
-0.3765118, -0.02379045, -0.9796903, 0, 1, 0.07058824, 1,
-0.3736915, -1.632354, -2.824235, 0, 1, 0.07450981, 1,
-0.3697864, -1.101967, -3.149101, 0, 1, 0.08235294, 1,
-0.3641335, 0.6508226, -0.8925511, 0, 1, 0.08627451, 1,
-0.3637924, 1.190044, 0.188437, 0, 1, 0.09411765, 1,
-0.3607127, 0.8600773, 0.8309479, 0, 1, 0.1019608, 1,
-0.3604642, -0.3794934, -1.80868, 0, 1, 0.1058824, 1,
-0.3604626, 0.09114169, -3.370874, 0, 1, 0.1137255, 1,
-0.3589571, 0.2922453, -0.930522, 0, 1, 0.1176471, 1,
-0.3545681, -0.936221, -2.405256, 0, 1, 0.1254902, 1,
-0.3516557, 0.9664875, 1.275682, 0, 1, 0.1294118, 1,
-0.3512444, 1.744165, -0.4079869, 0, 1, 0.1372549, 1,
-0.3511374, -0.1652193, -1.981899, 0, 1, 0.1411765, 1,
-0.3489325, 0.6502858, -0.4661739, 0, 1, 0.1490196, 1,
-0.3418629, -1.276277, -3.825875, 0, 1, 0.1529412, 1,
-0.3352103, 1.05981, -1.356719, 0, 1, 0.1607843, 1,
-0.3351136, 1.192955, 1.258314, 0, 1, 0.1647059, 1,
-0.3346807, 0.5632441, -0.3822591, 0, 1, 0.172549, 1,
-0.3342407, 0.1541371, -1.866806, 0, 1, 0.1764706, 1,
-0.3275752, 0.4190263, 0.8120626, 0, 1, 0.1843137, 1,
-0.3230082, 0.5650443, -0.9549232, 0, 1, 0.1882353, 1,
-0.3218144, -1.01369, -3.560143, 0, 1, 0.1960784, 1,
-0.3169348, 0.946925, -1.12869, 0, 1, 0.2039216, 1,
-0.3166745, 0.1926743, 0.1703373, 0, 1, 0.2078431, 1,
-0.314683, 0.245673, -1.787131, 0, 1, 0.2156863, 1,
-0.3129773, 1.810202, 1.421889, 0, 1, 0.2196078, 1,
-0.3116821, -0.004204868, 0.03330897, 0, 1, 0.227451, 1,
-0.3105507, 1.871909, 1.119455, 0, 1, 0.2313726, 1,
-0.309143, -0.6782587, -1.911913, 0, 1, 0.2392157, 1,
-0.3087116, 0.6268952, -0.2239501, 0, 1, 0.2431373, 1,
-0.3038798, 0.5614876, 0.3325333, 0, 1, 0.2509804, 1,
-0.302097, 2.285567, -0.9174824, 0, 1, 0.254902, 1,
-0.3009098, 0.7123066, -1.983666, 0, 1, 0.2627451, 1,
-0.2998299, -0.1691629, -1.998293, 0, 1, 0.2666667, 1,
-0.2979034, 1.160669, 0.09476147, 0, 1, 0.2745098, 1,
-0.2978895, 0.6711363, -0.01696904, 0, 1, 0.2784314, 1,
-0.2915747, 0.6963852, -1.169961, 0, 1, 0.2862745, 1,
-0.2892959, -0.381477, -1.726435, 0, 1, 0.2901961, 1,
-0.2860982, -0.07540184, -1.858852, 0, 1, 0.2980392, 1,
-0.2806424, -1.264988, -2.496939, 0, 1, 0.3058824, 1,
-0.2730682, -1.090974, -2.646325, 0, 1, 0.3098039, 1,
-0.271253, -0.8648014, -3.093653, 0, 1, 0.3176471, 1,
-0.2711249, -1.152941, -4.444177, 0, 1, 0.3215686, 1,
-0.26962, -0.1942252, -1.89606, 0, 1, 0.3294118, 1,
-0.2685648, 1.084527, -3.531656, 0, 1, 0.3333333, 1,
-0.2684333, 0.7590518, -0.5884269, 0, 1, 0.3411765, 1,
-0.2651294, -1.319941, -2.3472, 0, 1, 0.345098, 1,
-0.2630448, -0.3000006, -1.360707, 0, 1, 0.3529412, 1,
-0.262227, -0.2483784, -1.467746, 0, 1, 0.3568628, 1,
-0.2603337, -0.4005901, -2.366201, 0, 1, 0.3647059, 1,
-0.2513844, 1.428528, -0.09871417, 0, 1, 0.3686275, 1,
-0.245763, -0.2742646, -1.988688, 0, 1, 0.3764706, 1,
-0.2434516, -0.6191923, -3.141721, 0, 1, 0.3803922, 1,
-0.2378149, -0.5979204, -2.009288, 0, 1, 0.3882353, 1,
-0.2368493, 0.6165401, -0.5962581, 0, 1, 0.3921569, 1,
-0.2353948, -0.779614, -1.292742, 0, 1, 0.4, 1,
-0.2342448, -2.290121, -2.556346, 0, 1, 0.4078431, 1,
-0.2317996, -1.135605, -3.143136, 0, 1, 0.4117647, 1,
-0.2315249, -0.604615, -3.679811, 0, 1, 0.4196078, 1,
-0.2280628, -0.2900443, -2.679353, 0, 1, 0.4235294, 1,
-0.2246953, -2.422961, -4.129594, 0, 1, 0.4313726, 1,
-0.2225823, 0.2185721, -1.159488, 0, 1, 0.4352941, 1,
-0.2149362, 0.2302153, -1.283285, 0, 1, 0.4431373, 1,
-0.2147439, 0.7113814, -0.06951632, 0, 1, 0.4470588, 1,
-0.214649, -1.104207, -3.854139, 0, 1, 0.454902, 1,
-0.213314, 0.244091, -2.49659, 0, 1, 0.4588235, 1,
-0.212187, 0.6389993, -0.03011227, 0, 1, 0.4666667, 1,
-0.2060281, 0.08812194, 0.3912085, 0, 1, 0.4705882, 1,
-0.2032139, 0.9588055, -0.3766038, 0, 1, 0.4784314, 1,
-0.2023188, -0.4215406, -0.7514806, 0, 1, 0.4823529, 1,
-0.1991023, -0.5743811, -2.222121, 0, 1, 0.4901961, 1,
-0.1986874, -1.570646, -2.851239, 0, 1, 0.4941176, 1,
-0.1983966, -0.5652295, -1.321226, 0, 1, 0.5019608, 1,
-0.1978996, 0.1027277, -1.573554, 0, 1, 0.509804, 1,
-0.1951595, -0.4742408, -2.011182, 0, 1, 0.5137255, 1,
-0.1928463, -0.07610358, -1.277808, 0, 1, 0.5215687, 1,
-0.1922973, 1.4572, -1.240515, 0, 1, 0.5254902, 1,
-0.1899009, -0.6137211, -5.073503, 0, 1, 0.5333334, 1,
-0.1892801, -0.2883418, -1.200001, 0, 1, 0.5372549, 1,
-0.189146, 1.431358, -0.008245528, 0, 1, 0.5450981, 1,
-0.1809842, -1.354916, -2.828744, 0, 1, 0.5490196, 1,
-0.1802952, 0.416705, 0.8144776, 0, 1, 0.5568628, 1,
-0.1780009, 1.072678, -1.355698, 0, 1, 0.5607843, 1,
-0.1773228, 0.6621838, 0.05685848, 0, 1, 0.5686275, 1,
-0.1769487, -0.8461092, -3.433286, 0, 1, 0.572549, 1,
-0.1712728, 1.226045, 1.631054, 0, 1, 0.5803922, 1,
-0.1700571, -0.9127352, -3.427503, 0, 1, 0.5843138, 1,
-0.1696859, -0.2171124, -1.691176, 0, 1, 0.5921569, 1,
-0.1658245, 1.490038, 1.307444, 0, 1, 0.5960785, 1,
-0.1637766, 1.542703, 0.9635178, 0, 1, 0.6039216, 1,
-0.1636451, -2.022727, -0.8590665, 0, 1, 0.6117647, 1,
-0.1631539, 1.315892, -0.1011445, 0, 1, 0.6156863, 1,
-0.1609595, -0.03601195, -1.296963, 0, 1, 0.6235294, 1,
-0.1562148, -0.03928917, -0.9524029, 0, 1, 0.627451, 1,
-0.1558218, -1.115655, -3.310151, 0, 1, 0.6352941, 1,
-0.1552163, -1.896186, -3.374762, 0, 1, 0.6392157, 1,
-0.153913, 0.5857501, -1.104558, 0, 1, 0.6470588, 1,
-0.1502742, 0.6224267, -1.216557, 0, 1, 0.6509804, 1,
-0.1502699, 0.8460056, 0.561253, 0, 1, 0.6588235, 1,
-0.1497829, -0.9261337, -2.170236, 0, 1, 0.6627451, 1,
-0.1402238, 0.7918922, -1.505672, 0, 1, 0.6705883, 1,
-0.1392571, -0.2557089, -3.61422, 0, 1, 0.6745098, 1,
-0.1378685, 1.526677, -0.3572508, 0, 1, 0.682353, 1,
-0.1296915, -1.589927, -3.382259, 0, 1, 0.6862745, 1,
-0.1291109, 1.700168, -1.306859, 0, 1, 0.6941177, 1,
-0.1291091, 0.9205441, 0.3999594, 0, 1, 0.7019608, 1,
-0.129043, -1.099296, -1.930087, 0, 1, 0.7058824, 1,
-0.1272222, -0.7110983, -1.213379, 0, 1, 0.7137255, 1,
-0.1164187, -1.027585, -2.971053, 0, 1, 0.7176471, 1,
-0.1152153, -0.3883113, -3.020494, 0, 1, 0.7254902, 1,
-0.1100742, -1.964795, -3.041718, 0, 1, 0.7294118, 1,
-0.1066612, 0.4001449, 0.8084108, 0, 1, 0.7372549, 1,
-0.102262, 0.2509444, -0.4581834, 0, 1, 0.7411765, 1,
-0.09669762, -0.2223823, -1.955941, 0, 1, 0.7490196, 1,
-0.08813628, 0.6207908, 0.006627679, 0, 1, 0.7529412, 1,
-0.08650368, 0.5043779, 0.1425113, 0, 1, 0.7607843, 1,
-0.0830415, -0.9712471, -3.504795, 0, 1, 0.7647059, 1,
-0.0791325, 0.541326, 0.1208069, 0, 1, 0.772549, 1,
-0.07772117, -0.5863948, -4.259328, 0, 1, 0.7764706, 1,
-0.07351525, 1.014875, -0.02759512, 0, 1, 0.7843137, 1,
-0.06780381, 1.740401, -0.7924149, 0, 1, 0.7882353, 1,
-0.06556612, -0.82525, -2.907691, 0, 1, 0.7960784, 1,
-0.05905293, 2.920452, -0.4348426, 0, 1, 0.8039216, 1,
-0.05892317, -0.4984787, -3.096679, 0, 1, 0.8078431, 1,
-0.05860382, 1.26488, -1.435625, 0, 1, 0.8156863, 1,
-0.05743289, 0.0410772, 0.4326508, 0, 1, 0.8196079, 1,
-0.0568145, 0.2511642, 0.8143269, 0, 1, 0.827451, 1,
-0.05536349, 1.097881, -2.592016, 0, 1, 0.8313726, 1,
-0.05412981, -1.912197, -1.656491, 0, 1, 0.8392157, 1,
-0.05184244, -0.5426419, -1.307405, 0, 1, 0.8431373, 1,
-0.04638759, 0.8019307, -0.7218688, 0, 1, 0.8509804, 1,
-0.04637417, 0.1005195, -1.053369, 0, 1, 0.854902, 1,
-0.04528182, 0.9986936, 0.0805122, 0, 1, 0.8627451, 1,
-0.0449495, 0.8093252, 0.3544508, 0, 1, 0.8666667, 1,
-0.04403559, 1.688296, 0.3283814, 0, 1, 0.8745098, 1,
-0.04153247, 0.8784842, -0.5108391, 0, 1, 0.8784314, 1,
-0.0414216, -0.3643641, -4.824198, 0, 1, 0.8862745, 1,
-0.0381365, -0.008625979, -2.407605, 0, 1, 0.8901961, 1,
-0.03736616, -0.9786052, -4.221305, 0, 1, 0.8980392, 1,
-0.03686469, 0.9061607, -0.2826212, 0, 1, 0.9058824, 1,
-0.03302455, -0.2283528, -2.42331, 0, 1, 0.9098039, 1,
-0.03096089, -1.741069, -3.216953, 0, 1, 0.9176471, 1,
-0.02930984, -0.6715533, -3.260834, 0, 1, 0.9215686, 1,
-0.02080277, -0.1461978, -2.65944, 0, 1, 0.9294118, 1,
-0.01710355, 1.130738, 0.7133715, 0, 1, 0.9333333, 1,
-0.01670867, 0.3754361, -0.7954868, 0, 1, 0.9411765, 1,
-0.01505885, -0.8925335, -2.096688, 0, 1, 0.945098, 1,
-0.0141514, 1.517315, -0.07045065, 0, 1, 0.9529412, 1,
-0.0137925, 0.6401283, 0.9536896, 0, 1, 0.9568627, 1,
-0.01330729, 1.949721, 0.04572184, 0, 1, 0.9647059, 1,
-0.01218446, -0.8320321, -2.113508, 0, 1, 0.9686275, 1,
-0.01080558, -0.7298219, -2.696787, 0, 1, 0.9764706, 1,
-0.004436943, 0.6857737, 1.039709, 0, 1, 0.9803922, 1,
-0.002429748, 0.3929083, 0.3380611, 0, 1, 0.9882353, 1,
0.001640715, -0.7767001, 0.7788653, 0, 1, 0.9921569, 1,
0.005238574, -0.4697435, 4.87427, 0, 1, 1, 1,
0.00709064, -0.384003, 2.169561, 0, 0.9921569, 1, 1,
0.01109388, -1.29729, 3.920172, 0, 0.9882353, 1, 1,
0.01111291, -1.137851, 2.967778, 0, 0.9803922, 1, 1,
0.01549613, 1.121254, -0.04798556, 0, 0.9764706, 1, 1,
0.01575275, -0.5978547, 3.96925, 0, 0.9686275, 1, 1,
0.02798988, -1.138476, 2.889124, 0, 0.9647059, 1, 1,
0.02810712, 0.4291075, 0.2610403, 0, 0.9568627, 1, 1,
0.0301448, 0.2690985, 0.2786127, 0, 0.9529412, 1, 1,
0.03147623, 1.521363, -0.7306716, 0, 0.945098, 1, 1,
0.03316801, 0.223625, 0.1063853, 0, 0.9411765, 1, 1,
0.03349455, 0.1112905, 0.0181174, 0, 0.9333333, 1, 1,
0.03425531, -1.549418, 4.076656, 0, 0.9294118, 1, 1,
0.03456077, -0.6651157, 1.71507, 0, 0.9215686, 1, 1,
0.0381054, 0.1432589, 1.128074, 0, 0.9176471, 1, 1,
0.04032531, 1.304821, 1.531824, 0, 0.9098039, 1, 1,
0.04499101, 0.05270538, 0.2406027, 0, 0.9058824, 1, 1,
0.04622243, -0.2173175, 4.004747, 0, 0.8980392, 1, 1,
0.04653849, 0.1381051, 0.4383515, 0, 0.8901961, 1, 1,
0.04690009, 0.2675556, 0.4268584, 0, 0.8862745, 1, 1,
0.05064826, 0.2915263, 0.9121963, 0, 0.8784314, 1, 1,
0.05120318, 2.073403, 1.028874, 0, 0.8745098, 1, 1,
0.05144756, 0.005385788, 2.591353, 0, 0.8666667, 1, 1,
0.0528977, -0.3657546, 2.959774, 0, 0.8627451, 1, 1,
0.05632954, -0.02942136, 1.920356, 0, 0.854902, 1, 1,
0.05919481, 1.251316, 0.5085574, 0, 0.8509804, 1, 1,
0.06182459, -1.735766, 4.007819, 0, 0.8431373, 1, 1,
0.06858675, -2.081749, 2.89802, 0, 0.8392157, 1, 1,
0.06901256, 0.7577984, -0.02579095, 0, 0.8313726, 1, 1,
0.07109097, 1.691956, -0.8701612, 0, 0.827451, 1, 1,
0.07355723, 0.2681644, 1.359064, 0, 0.8196079, 1, 1,
0.07385862, 0.1768461, -0.07257318, 0, 0.8156863, 1, 1,
0.07705873, -0.3216607, 3.570026, 0, 0.8078431, 1, 1,
0.08059004, -1.034549, 3.344697, 0, 0.8039216, 1, 1,
0.08820939, -0.436636, 2.188402, 0, 0.7960784, 1, 1,
0.08925694, -0.6609486, 2.856053, 0, 0.7882353, 1, 1,
0.0913952, -0.9891836, 2.374039, 0, 0.7843137, 1, 1,
0.09615697, -2.589037, 2.252578, 0, 0.7764706, 1, 1,
0.09640855, 1.388753, 0.2332805, 0, 0.772549, 1, 1,
0.09665691, -0.7433887, 3.730755, 0, 0.7647059, 1, 1,
0.09790926, -0.171279, 2.336954, 0, 0.7607843, 1, 1,
0.1048297, 0.1249658, 0.9840897, 0, 0.7529412, 1, 1,
0.1073579, -0.1078664, 2.156676, 0, 0.7490196, 1, 1,
0.1083258, 0.7565605, 0.7798294, 0, 0.7411765, 1, 1,
0.109241, 0.8888782, -1.537968, 0, 0.7372549, 1, 1,
0.1097587, 0.02155539, 0.1943125, 0, 0.7294118, 1, 1,
0.1117469, 0.02269229, 0.995369, 0, 0.7254902, 1, 1,
0.1212283, 0.1532329, 0.7068062, 0, 0.7176471, 1, 1,
0.1244688, -1.557897, 2.909003, 0, 0.7137255, 1, 1,
0.1398481, -0.2930137, 3.546656, 0, 0.7058824, 1, 1,
0.1429507, -0.06208443, 2.711876, 0, 0.6980392, 1, 1,
0.1453502, 0.9121169, 0.07902598, 0, 0.6941177, 1, 1,
0.1521512, -0.1540135, 0.2655918, 0, 0.6862745, 1, 1,
0.1564199, 1.201753, 0.2400739, 0, 0.682353, 1, 1,
0.1588865, -0.7298016, 2.612538, 0, 0.6745098, 1, 1,
0.1592148, 0.4659473, 0.2269197, 0, 0.6705883, 1, 1,
0.1601904, 0.03679774, 0.5173982, 0, 0.6627451, 1, 1,
0.1640808, -1.012951, 5.478511, 0, 0.6588235, 1, 1,
0.1689353, 0.5496197, 0.3388982, 0, 0.6509804, 1, 1,
0.1720179, -1.472274, 2.959272, 0, 0.6470588, 1, 1,
0.1729164, 2.18098, -0.3126671, 0, 0.6392157, 1, 1,
0.1729639, -0.213031, 4.44272, 0, 0.6352941, 1, 1,
0.1748122, -0.4899286, 3.012613, 0, 0.627451, 1, 1,
0.1756585, -0.3656161, 5.312029, 0, 0.6235294, 1, 1,
0.1764518, 0.1938247, -1.306344, 0, 0.6156863, 1, 1,
0.1775587, 1.310517, -0.8309597, 0, 0.6117647, 1, 1,
0.1788358, 1.781132, 1.520749, 0, 0.6039216, 1, 1,
0.181362, 0.4490595, -0.00495905, 0, 0.5960785, 1, 1,
0.1823057, 0.08671067, 0.7663851, 0, 0.5921569, 1, 1,
0.1848833, 0.4786647, -0.487509, 0, 0.5843138, 1, 1,
0.1873766, 1.123425, 0.2582852, 0, 0.5803922, 1, 1,
0.1931958, -0.1018109, 2.684878, 0, 0.572549, 1, 1,
0.1939413, 1.069789, 1.695432, 0, 0.5686275, 1, 1,
0.1943223, 0.4524049, 0.5392247, 0, 0.5607843, 1, 1,
0.1962275, -0.4652031, 4.044984, 0, 0.5568628, 1, 1,
0.1969554, -0.1415021, 4.521255, 0, 0.5490196, 1, 1,
0.2053755, 1.167931, 0.4962791, 0, 0.5450981, 1, 1,
0.206593, -1.040662, 4.991108, 0, 0.5372549, 1, 1,
0.2069964, 0.9639534, 1.172212, 0, 0.5333334, 1, 1,
0.2070121, 0.4845857, 0.1806264, 0, 0.5254902, 1, 1,
0.217474, -0.1224139, 2.485216, 0, 0.5215687, 1, 1,
0.2221148, -0.1870125, 1.298785, 0, 0.5137255, 1, 1,
0.228414, -0.7553883, 2.183374, 0, 0.509804, 1, 1,
0.2321686, 1.17137, 0.5318661, 0, 0.5019608, 1, 1,
0.2339355, -0.5294484, 2.847653, 0, 0.4941176, 1, 1,
0.235183, 0.4545729, 0.8108542, 0, 0.4901961, 1, 1,
0.2363801, -0.9148002, 2.905182, 0, 0.4823529, 1, 1,
0.2383435, -0.4461324, 1.827384, 0, 0.4784314, 1, 1,
0.2392202, 0.9670398, -0.4045101, 0, 0.4705882, 1, 1,
0.2449656, -0.8827206, 1.181047, 0, 0.4666667, 1, 1,
0.2482015, 2.237472, 0.6721956, 0, 0.4588235, 1, 1,
0.2507424, 1.551324, -0.4423515, 0, 0.454902, 1, 1,
0.2522793, 0.06155282, -0.2462319, 0, 0.4470588, 1, 1,
0.252304, 0.6859567, -0.3345898, 0, 0.4431373, 1, 1,
0.2533373, -1.648841, 1.357376, 0, 0.4352941, 1, 1,
0.255481, -0.8141158, 3.249707, 0, 0.4313726, 1, 1,
0.2563127, 0.5479266, 0.9509451, 0, 0.4235294, 1, 1,
0.2565543, 0.2816633, 1.927964, 0, 0.4196078, 1, 1,
0.2565781, 0.733968, 0.6385098, 0, 0.4117647, 1, 1,
0.2567843, -0.9744621, 2.464011, 0, 0.4078431, 1, 1,
0.2581946, -0.8114318, 4.189294, 0, 0.4, 1, 1,
0.2616146, -0.3823747, 3.820649, 0, 0.3921569, 1, 1,
0.2656312, -0.01618247, 1.696987, 0, 0.3882353, 1, 1,
0.2691128, -2.182297, 2.977941, 0, 0.3803922, 1, 1,
0.269339, -1.057205, 0.9892083, 0, 0.3764706, 1, 1,
0.2701754, 0.3561446, 0.5756426, 0, 0.3686275, 1, 1,
0.2718267, -0.6013142, 2.134466, 0, 0.3647059, 1, 1,
0.2726327, 0.3341792, 1.257756, 0, 0.3568628, 1, 1,
0.2728123, 0.716735, 0.7571499, 0, 0.3529412, 1, 1,
0.2746135, -1.60024, 4.07289, 0, 0.345098, 1, 1,
0.2750679, -1.102546, 3.160853, 0, 0.3411765, 1, 1,
0.2782018, -0.02243896, 2.966549, 0, 0.3333333, 1, 1,
0.2820673, -0.3719413, 4.417931, 0, 0.3294118, 1, 1,
0.2870355, 0.5746948, -0.9636457, 0, 0.3215686, 1, 1,
0.2873339, -1.21242, 2.634547, 0, 0.3176471, 1, 1,
0.2879926, 1.612327, -0.9378005, 0, 0.3098039, 1, 1,
0.2880469, 0.2489521, -0.05503216, 0, 0.3058824, 1, 1,
0.2884909, 1.117331, 0.4497607, 0, 0.2980392, 1, 1,
0.2926768, -1.927975, 4.126381, 0, 0.2901961, 1, 1,
0.2929628, 1.19347, 0.02989385, 0, 0.2862745, 1, 1,
0.3046797, 1.862696, -0.8108052, 0, 0.2784314, 1, 1,
0.3168806, 0.7159458, -0.5232899, 0, 0.2745098, 1, 1,
0.3192811, -0.9958655, 3.565908, 0, 0.2666667, 1, 1,
0.3231854, -1.037074, 5.154678, 0, 0.2627451, 1, 1,
0.3259854, -0.9893417, 3.349441, 0, 0.254902, 1, 1,
0.3268736, -2.032604, 3.588155, 0, 0.2509804, 1, 1,
0.3288547, -0.1293766, 0.9296783, 0, 0.2431373, 1, 1,
0.3313324, 0.2835645, 1.375562, 0, 0.2392157, 1, 1,
0.3328228, 0.7373824, 0.1946942, 0, 0.2313726, 1, 1,
0.3363399, -0.471132, 2.987483, 0, 0.227451, 1, 1,
0.3380415, -1.191002, 2.802688, 0, 0.2196078, 1, 1,
0.3404061, 0.4204381, -0.8546125, 0, 0.2156863, 1, 1,
0.3419544, -1.826321, 3.907363, 0, 0.2078431, 1, 1,
0.3429793, -0.3332887, 1.509874, 0, 0.2039216, 1, 1,
0.3455961, 0.3302405, 2.579772, 0, 0.1960784, 1, 1,
0.3462023, -2.549284, 3.083783, 0, 0.1882353, 1, 1,
0.3496499, -0.8533859, 2.314449, 0, 0.1843137, 1, 1,
0.3497387, 0.6188276, 0.920198, 0, 0.1764706, 1, 1,
0.3498996, 0.09190995, 2.588685, 0, 0.172549, 1, 1,
0.3506594, -0.6022673, 4.527358, 0, 0.1647059, 1, 1,
0.3513304, 0.3277875, -1.651664, 0, 0.1607843, 1, 1,
0.3558732, -0.8779544, 4.634414, 0, 0.1529412, 1, 1,
0.3577584, -0.8255169, 2.477425, 0, 0.1490196, 1, 1,
0.359846, 0.3461906, 0.9316761, 0, 0.1411765, 1, 1,
0.3604856, 0.3446328, 3.71743, 0, 0.1372549, 1, 1,
0.3637426, -0.5843874, 1.135759, 0, 0.1294118, 1, 1,
0.3664072, 0.8136035, -0.08459827, 0, 0.1254902, 1, 1,
0.3671871, -1.099683, 2.548653, 0, 0.1176471, 1, 1,
0.3721914, -1.311664, 3.082112, 0, 0.1137255, 1, 1,
0.3751968, 1.05623, 1.034174, 0, 0.1058824, 1, 1,
0.3753059, 0.8069907, -0.5234143, 0, 0.09803922, 1, 1,
0.3766221, -1.037733, 4.198194, 0, 0.09411765, 1, 1,
0.3783621, 0.3409503, -0.4261913, 0, 0.08627451, 1, 1,
0.3828738, -1.053066, 0.7249258, 0, 0.08235294, 1, 1,
0.3829233, 1.171753, 1.291869, 0, 0.07450981, 1, 1,
0.3955314, 0.6719592, 0.01849133, 0, 0.07058824, 1, 1,
0.4027072, 0.3684009, 1.456462, 0, 0.0627451, 1, 1,
0.4037869, -0.2483725, 0.4510873, 0, 0.05882353, 1, 1,
0.4088771, 0.3986443, -0.7677209, 0, 0.05098039, 1, 1,
0.4165866, 0.3704822, -0.214799, 0, 0.04705882, 1, 1,
0.418857, -1.182219, 2.001201, 0, 0.03921569, 1, 1,
0.420864, 1.436824, -0.4131462, 0, 0.03529412, 1, 1,
0.4215786, -0.6301637, 4.449399, 0, 0.02745098, 1, 1,
0.4230037, 0.7666114, 0.432353, 0, 0.02352941, 1, 1,
0.4269763, -1.177151, 3.255071, 0, 0.01568628, 1, 1,
0.4294778, 0.225737, 0.06169308, 0, 0.01176471, 1, 1,
0.4304677, 0.0423401, 0.7664276, 0, 0.003921569, 1, 1,
0.4349243, 0.713622, 0.2509589, 0.003921569, 0, 1, 1,
0.4398908, -0.131251, 1.711601, 0.007843138, 0, 1, 1,
0.4413925, -0.3474533, 2.990191, 0.01568628, 0, 1, 1,
0.4501067, -0.4801619, 1.366172, 0.01960784, 0, 1, 1,
0.4528071, 1.098349, 0.6360437, 0.02745098, 0, 1, 1,
0.4531558, 1.158572, 1.511314, 0.03137255, 0, 1, 1,
0.4572273, 1.399457, -0.2205608, 0.03921569, 0, 1, 1,
0.4577156, 1.090222, 1.007233, 0.04313726, 0, 1, 1,
0.4591234, 0.07567431, 0.7986732, 0.05098039, 0, 1, 1,
0.4598445, 0.1163359, -0.545562, 0.05490196, 0, 1, 1,
0.4614806, 0.04765079, 1.318673, 0.0627451, 0, 1, 1,
0.4625375, 0.1611361, 2.272737, 0.06666667, 0, 1, 1,
0.466693, -1.05412, 1.240243, 0.07450981, 0, 1, 1,
0.4704459, -0.4751441, 2.513995, 0.07843138, 0, 1, 1,
0.4734831, 0.08502962, 2.253333, 0.08627451, 0, 1, 1,
0.4810291, 0.8491459, -0.3455658, 0.09019608, 0, 1, 1,
0.4815418, -0.6404529, 4.000008, 0.09803922, 0, 1, 1,
0.4843059, 2.160145, -2.508447, 0.1058824, 0, 1, 1,
0.4854925, 0.204768, -0.3794598, 0.1098039, 0, 1, 1,
0.4871537, -0.1609563, 2.042929, 0.1176471, 0, 1, 1,
0.4896836, 0.08952963, 1.301263, 0.1215686, 0, 1, 1,
0.4929914, 0.2088334, 0.7720814, 0.1294118, 0, 1, 1,
0.4952347, -0.5415246, 1.152136, 0.1333333, 0, 1, 1,
0.4964833, 0.04333316, 0.7691584, 0.1411765, 0, 1, 1,
0.4987835, -0.6653951, 3.141159, 0.145098, 0, 1, 1,
0.4997273, -0.09351937, 1.914391, 0.1529412, 0, 1, 1,
0.5001947, 0.8848965, 1.399971, 0.1568628, 0, 1, 1,
0.5002385, 1.340138, 1.471072, 0.1647059, 0, 1, 1,
0.5016872, -0.2102985, 1.078473, 0.1686275, 0, 1, 1,
0.5070077, 0.5449839, 1.650851, 0.1764706, 0, 1, 1,
0.5112698, 0.02284825, 1.298155, 0.1803922, 0, 1, 1,
0.5163924, -1.6458, 5.186368, 0.1882353, 0, 1, 1,
0.524984, -1.000065, 0.7460685, 0.1921569, 0, 1, 1,
0.5279877, -0.1578584, 3.272142, 0.2, 0, 1, 1,
0.5323009, -0.8168135, 3.337485, 0.2078431, 0, 1, 1,
0.5398323, -0.5413247, 1.972873, 0.2117647, 0, 1, 1,
0.5456647, 0.3718957, 0.6623957, 0.2196078, 0, 1, 1,
0.5530015, -0.6538282, 1.721104, 0.2235294, 0, 1, 1,
0.5535769, 0.6875065, -1.23702, 0.2313726, 0, 1, 1,
0.5571542, -1.018929, 4.002755, 0.2352941, 0, 1, 1,
0.5596164, -0.2374494, 1.182047, 0.2431373, 0, 1, 1,
0.5702842, 0.9366444, 0.7917253, 0.2470588, 0, 1, 1,
0.5704471, -2.380113, 3.498026, 0.254902, 0, 1, 1,
0.5731054, 0.8793688, 1.214431, 0.2588235, 0, 1, 1,
0.5756592, -0.7884025, 3.844453, 0.2666667, 0, 1, 1,
0.5798096, 0.2680576, 0.2055425, 0.2705882, 0, 1, 1,
0.5832332, 0.8417382, 0.6230327, 0.2784314, 0, 1, 1,
0.5838612, -0.02959894, -0.1867594, 0.282353, 0, 1, 1,
0.5873201, 0.1320617, 2.36047, 0.2901961, 0, 1, 1,
0.5899735, 0.1420075, 0.9875511, 0.2941177, 0, 1, 1,
0.5909732, -0.5106001, 1.38703, 0.3019608, 0, 1, 1,
0.5925282, -0.9024997, 2.797732, 0.3098039, 0, 1, 1,
0.5943468, 3.150665, 0.426029, 0.3137255, 0, 1, 1,
0.5958263, 0.5723593, -0.2595151, 0.3215686, 0, 1, 1,
0.5997947, -1.070235, 3.323782, 0.3254902, 0, 1, 1,
0.6105762, 1.568206, 0.5727763, 0.3333333, 0, 1, 1,
0.6117279, -0.1347087, 2.539862, 0.3372549, 0, 1, 1,
0.6121387, -0.4010965, 3.355949, 0.345098, 0, 1, 1,
0.6135343, -1.565013, 3.342541, 0.3490196, 0, 1, 1,
0.6248611, 0.9931669, 0.1959785, 0.3568628, 0, 1, 1,
0.6256723, -1.41976, 2.853641, 0.3607843, 0, 1, 1,
0.6303948, -1.545116, 2.99902, 0.3686275, 0, 1, 1,
0.6370751, 2.193979, -0.07782294, 0.372549, 0, 1, 1,
0.6378576, 0.07703086, 1.773775, 0.3803922, 0, 1, 1,
0.6383252, -1.805998, 3.073578, 0.3843137, 0, 1, 1,
0.6414578, -0.9129987, 1.715909, 0.3921569, 0, 1, 1,
0.6426585, -0.2596726, 1.422976, 0.3960784, 0, 1, 1,
0.6486277, -2.427533, 1.633492, 0.4039216, 0, 1, 1,
0.6510997, 0.05738924, 2.541665, 0.4117647, 0, 1, 1,
0.651262, -0.7094402, 1.203803, 0.4156863, 0, 1, 1,
0.6523032, 0.322037, 0.3354373, 0.4235294, 0, 1, 1,
0.6524402, -0.03464064, 1.212144, 0.427451, 0, 1, 1,
0.6576306, -1.880912, 2.566796, 0.4352941, 0, 1, 1,
0.6582082, 0.172745, 0.6940036, 0.4392157, 0, 1, 1,
0.6631163, 0.1199484, 2.512936, 0.4470588, 0, 1, 1,
0.66388, -0.9102967, 1.719014, 0.4509804, 0, 1, 1,
0.6643326, 1.075063, 0.4285446, 0.4588235, 0, 1, 1,
0.6658166, 0.01205199, 2.586921, 0.4627451, 0, 1, 1,
0.6664036, 1.075901, 0.5078987, 0.4705882, 0, 1, 1,
0.6666561, 0.9406509, 2.25543, 0.4745098, 0, 1, 1,
0.6684515, 2.35257, -0.6489875, 0.4823529, 0, 1, 1,
0.6696797, -0.7200706, 1.972246, 0.4862745, 0, 1, 1,
0.6770292, 2.792119, -0.1308953, 0.4941176, 0, 1, 1,
0.6776918, -0.3155558, 2.302161, 0.5019608, 0, 1, 1,
0.678623, 2.539041, 1.562951, 0.5058824, 0, 1, 1,
0.6857589, -0.3789605, 1.943677, 0.5137255, 0, 1, 1,
0.6898518, 0.5281329, 2.071519, 0.5176471, 0, 1, 1,
0.6907728, 1.440059, -0.04378222, 0.5254902, 0, 1, 1,
0.6920514, -0.5432723, 0.9846236, 0.5294118, 0, 1, 1,
0.694101, -1.00139, 3.215165, 0.5372549, 0, 1, 1,
0.6958206, -0.4890216, 2.794223, 0.5411765, 0, 1, 1,
0.6971366, -0.4954243, 2.991711, 0.5490196, 0, 1, 1,
0.7016513, 1.396853, 0.145804, 0.5529412, 0, 1, 1,
0.7016638, -0.08536501, 1.196143, 0.5607843, 0, 1, 1,
0.7031928, 0.1817223, 0.6932667, 0.5647059, 0, 1, 1,
0.7053748, 0.7570171, 0.7405357, 0.572549, 0, 1, 1,
0.7081692, 0.1090299, -0.008385534, 0.5764706, 0, 1, 1,
0.7154593, 0.05936519, 0.6824831, 0.5843138, 0, 1, 1,
0.7170383, 0.6927369, 0.1462278, 0.5882353, 0, 1, 1,
0.7222769, -1.208938, 1.647635, 0.5960785, 0, 1, 1,
0.7265671, 0.5796431, 2.384043, 0.6039216, 0, 1, 1,
0.7274748, 0.8001367, 0.2573602, 0.6078432, 0, 1, 1,
0.7355234, 0.06577498, 0.2264956, 0.6156863, 0, 1, 1,
0.7386789, -1.116321, 3.00245, 0.6196079, 0, 1, 1,
0.7437694, -0.6429641, 0.533415, 0.627451, 0, 1, 1,
0.7442892, -0.05634891, 1.174341, 0.6313726, 0, 1, 1,
0.7586278, 0.5477465, 0.04936041, 0.6392157, 0, 1, 1,
0.758875, 0.360326, -0.003405905, 0.6431373, 0, 1, 1,
0.7666701, 0.06963159, 1.058011, 0.6509804, 0, 1, 1,
0.7771434, -0.2229978, 2.323759, 0.654902, 0, 1, 1,
0.7772797, 1.813655, -1.03489, 0.6627451, 0, 1, 1,
0.7774054, -2.613873, 1.490985, 0.6666667, 0, 1, 1,
0.7817687, 0.2486529, 2.571829, 0.6745098, 0, 1, 1,
0.78255, -0.2297701, 3.598679, 0.6784314, 0, 1, 1,
0.7826229, -0.4851459, 2.957964, 0.6862745, 0, 1, 1,
0.7843566, 0.7813963, 0.8826374, 0.6901961, 0, 1, 1,
0.7862265, -0.6863366, 2.060879, 0.6980392, 0, 1, 1,
0.7926371, 1.410831, 1.115021, 0.7058824, 0, 1, 1,
0.7928841, 1.763152, 0.5384231, 0.7098039, 0, 1, 1,
0.7942618, -0.6702579, 0.7031636, 0.7176471, 0, 1, 1,
0.7983319, -0.06416656, 1.399912, 0.7215686, 0, 1, 1,
0.8009273, -0.8351883, 2.220858, 0.7294118, 0, 1, 1,
0.8018211, -0.7542814, 3.969838, 0.7333333, 0, 1, 1,
0.8061546, -0.2568054, 1.586657, 0.7411765, 0, 1, 1,
0.8124346, -1.043402, 0.9490499, 0.7450981, 0, 1, 1,
0.8159613, 0.8784152, 0.4447371, 0.7529412, 0, 1, 1,
0.8235648, 2.044284, -0.3132952, 0.7568628, 0, 1, 1,
0.825958, 0.9033703, 1.636545, 0.7647059, 0, 1, 1,
0.8301969, -1.577475, 1.900606, 0.7686275, 0, 1, 1,
0.8317605, 2.013477, -0.8770345, 0.7764706, 0, 1, 1,
0.8430099, 0.655311, 1.30309, 0.7803922, 0, 1, 1,
0.8490449, 0.8105501, 2.043863, 0.7882353, 0, 1, 1,
0.850414, -0.9856594, 2.27555, 0.7921569, 0, 1, 1,
0.8558549, 1.428093, 0.579546, 0.8, 0, 1, 1,
0.8580556, 0.2028994, 0.6807956, 0.8078431, 0, 1, 1,
0.858134, 1.639199, 0.9535887, 0.8117647, 0, 1, 1,
0.8623064, -0.9637007, 3.442533, 0.8196079, 0, 1, 1,
0.8641672, 1.487054, 2.489462, 0.8235294, 0, 1, 1,
0.8659363, -1.324247, 2.100847, 0.8313726, 0, 1, 1,
0.8695648, 0.9334578, 0.8821764, 0.8352941, 0, 1, 1,
0.8734253, 0.5894016, 1.503088, 0.8431373, 0, 1, 1,
0.877273, 0.5400209, 0.2158604, 0.8470588, 0, 1, 1,
0.8804806, 1.133531, 1.839541, 0.854902, 0, 1, 1,
0.8935481, 0.4959421, 0.5903786, 0.8588235, 0, 1, 1,
0.9048692, 0.8679073, 0.6229132, 0.8666667, 0, 1, 1,
0.9081907, 0.312183, 2.231268, 0.8705882, 0, 1, 1,
0.9132914, 0.9923459, 0.7822582, 0.8784314, 0, 1, 1,
0.9171609, -2.151001, 2.131702, 0.8823529, 0, 1, 1,
0.9190738, 2.505904, 2.086479, 0.8901961, 0, 1, 1,
0.9222654, -0.4709471, 2.193892, 0.8941177, 0, 1, 1,
0.9224018, -0.6420189, 1.464585, 0.9019608, 0, 1, 1,
0.9324201, 0.277738, 2.171001, 0.9098039, 0, 1, 1,
0.9332809, 1.432902, 1.245621, 0.9137255, 0, 1, 1,
0.9363088, -0.4824934, 1.684304, 0.9215686, 0, 1, 1,
0.9408687, 0.9942777, 2.186254, 0.9254902, 0, 1, 1,
0.9482937, -0.6151623, 2.826912, 0.9333333, 0, 1, 1,
0.9496618, 0.6356422, 2.366606, 0.9372549, 0, 1, 1,
0.9508734, 0.962896, 0.6611012, 0.945098, 0, 1, 1,
0.9540691, -0.2719588, 0.7932142, 0.9490196, 0, 1, 1,
0.9590349, 0.5556653, 1.774919, 0.9568627, 0, 1, 1,
0.9615719, 0.3551074, 2.325014, 0.9607843, 0, 1, 1,
0.9718388, -0.5427809, 1.367924, 0.9686275, 0, 1, 1,
0.9752636, 1.298943, -0.5649412, 0.972549, 0, 1, 1,
0.9806672, -0.8424674, 3.529235, 0.9803922, 0, 1, 1,
0.9912691, 1.898199, 0.1299952, 0.9843137, 0, 1, 1,
0.9923432, 1.396146, 0.8519386, 0.9921569, 0, 1, 1,
0.9951067, -0.9129636, 1.287026, 0.9960784, 0, 1, 1,
0.9962052, -1.000706, 0.0308465, 1, 0, 0.9960784, 1,
0.9970467, -0.9835873, 3.050483, 1, 0, 0.9882353, 1,
0.9984353, 1.180813, 0.6655139, 1, 0, 0.9843137, 1,
1.001158, -1.31559, 1.19899, 1, 0, 0.9764706, 1,
1.003121, 0.5453585, 0.8683583, 1, 0, 0.972549, 1,
1.005009, 0.1369185, 0.5450136, 1, 0, 0.9647059, 1,
1.013381, -0.7599069, 2.306253, 1, 0, 0.9607843, 1,
1.013501, 0.7979235, 2.706267, 1, 0, 0.9529412, 1,
1.020584, 0.784349, -0.1871397, 1, 0, 0.9490196, 1,
1.025541, -1.733281, 4.065944, 1, 0, 0.9411765, 1,
1.030779, -1.909855, 1.748374, 1, 0, 0.9372549, 1,
1.03156, 0.04701567, 3.235499, 1, 0, 0.9294118, 1,
1.035725, 1.369129, 1.299796, 1, 0, 0.9254902, 1,
1.039506, 0.9299896, 2.095834, 1, 0, 0.9176471, 1,
1.043425, 0.003368621, 1.757115, 1, 0, 0.9137255, 1,
1.04735, -0.2070199, 0.2332976, 1, 0, 0.9058824, 1,
1.04898, -1.731397, 3.853661, 1, 0, 0.9019608, 1,
1.050248, 0.457655, 0.8031538, 1, 0, 0.8941177, 1,
1.059832, -0.335879, 2.043002, 1, 0, 0.8862745, 1,
1.062744, 2.108966, -1.090965, 1, 0, 0.8823529, 1,
1.063925, 1.47213, 0.4631086, 1, 0, 0.8745098, 1,
1.068736, -0.7024558, 2.227073, 1, 0, 0.8705882, 1,
1.076675, 0.6397677, 1.232901, 1, 0, 0.8627451, 1,
1.079221, 0.3256409, 0.8663612, 1, 0, 0.8588235, 1,
1.085604, -0.6126365, 0.4817659, 1, 0, 0.8509804, 1,
1.087338, 0.2641191, 2.626715, 1, 0, 0.8470588, 1,
1.090491, 1.664988, 1.877602, 1, 0, 0.8392157, 1,
1.093573, 0.8773327, 2.058977, 1, 0, 0.8352941, 1,
1.094605, -0.2515521, 1.443463, 1, 0, 0.827451, 1,
1.098403, 0.3788109, 1.155796, 1, 0, 0.8235294, 1,
1.102458, 1.434759, 1.449624, 1, 0, 0.8156863, 1,
1.107027, 0.7959097, -0.09635838, 1, 0, 0.8117647, 1,
1.110564, 0.4661619, 0.607489, 1, 0, 0.8039216, 1,
1.116259, -0.7040346, 1.499139, 1, 0, 0.7960784, 1,
1.119804, -0.01673584, 2.705899, 1, 0, 0.7921569, 1,
1.121963, 0.6174684, 0.7419182, 1, 0, 0.7843137, 1,
1.122786, 0.8944173, 0.3925669, 1, 0, 0.7803922, 1,
1.124351, 0.8431181, 0.3799336, 1, 0, 0.772549, 1,
1.128051, 0.6819802, -0.7562649, 1, 0, 0.7686275, 1,
1.130559, -0.8162917, 1.342259, 1, 0, 0.7607843, 1,
1.136938, 0.745602, 0.4436534, 1, 0, 0.7568628, 1,
1.142809, -1.61886, 2.082312, 1, 0, 0.7490196, 1,
1.143953, 0.161757, -0.8637615, 1, 0, 0.7450981, 1,
1.163392, 1.473478, 1.345523, 1, 0, 0.7372549, 1,
1.174675, -0.337046, 0.1116622, 1, 0, 0.7333333, 1,
1.180906, -0.3740008, 1.939276, 1, 0, 0.7254902, 1,
1.190296, 0.2169378, 2.629495, 1, 0, 0.7215686, 1,
1.197972, 0.07828725, 3.181, 1, 0, 0.7137255, 1,
1.207067, -0.7949001, 0.4654092, 1, 0, 0.7098039, 1,
1.21414, 1.123437, 0.224935, 1, 0, 0.7019608, 1,
1.216065, -0.6117179, 2.023917, 1, 0, 0.6941177, 1,
1.219501, 1.208855, 0.637984, 1, 0, 0.6901961, 1,
1.224561, 0.9925098, 2.322259, 1, 0, 0.682353, 1,
1.229779, -0.3132944, 2.548435, 1, 0, 0.6784314, 1,
1.231482, -0.2757014, 1.918832, 1, 0, 0.6705883, 1,
1.231553, 0.1608626, 1.474986, 1, 0, 0.6666667, 1,
1.237463, -0.4220346, 3.191726, 1, 0, 0.6588235, 1,
1.239577, -0.4720801, 2.012976, 1, 0, 0.654902, 1,
1.251333, -1.40874, 1.785801, 1, 0, 0.6470588, 1,
1.258865, -0.7579175, 0.6878325, 1, 0, 0.6431373, 1,
1.264651, 1.239733, 0.6707999, 1, 0, 0.6352941, 1,
1.270847, -0.8946102, 2.008471, 1, 0, 0.6313726, 1,
1.280287, 0.3658203, 3.217569, 1, 0, 0.6235294, 1,
1.285625, 1.294387, 0.3316864, 1, 0, 0.6196079, 1,
1.287748, 0.8999311, -0.04660275, 1, 0, 0.6117647, 1,
1.292593, -1.527988, 2.664189, 1, 0, 0.6078432, 1,
1.339387, 0.2316283, -0.2438731, 1, 0, 0.6, 1,
1.339804, 1.327924, 0.4534617, 1, 0, 0.5921569, 1,
1.344016, 0.01466169, 2.481356, 1, 0, 0.5882353, 1,
1.355733, -0.05940284, 1.253974, 1, 0, 0.5803922, 1,
1.356518, 0.569158, -1.103464, 1, 0, 0.5764706, 1,
1.35686, -2.499622, 1.712957, 1, 0, 0.5686275, 1,
1.359589, 0.1026548, 0.9657092, 1, 0, 0.5647059, 1,
1.363994, -0.05941812, 1.679738, 1, 0, 0.5568628, 1,
1.365611, -0.6237826, 2.700037, 1, 0, 0.5529412, 1,
1.377725, 0.5951052, 0.08025803, 1, 0, 0.5450981, 1,
1.378646, 0.9998729, 2.53948, 1, 0, 0.5411765, 1,
1.386262, 1.072547, -0.04154137, 1, 0, 0.5333334, 1,
1.389782, 0.9635283, 1.634208, 1, 0, 0.5294118, 1,
1.391936, 0.4923202, 1.181755, 1, 0, 0.5215687, 1,
1.401207, 1.769545, -1.308786, 1, 0, 0.5176471, 1,
1.407802, -0.9080155, 1.609535, 1, 0, 0.509804, 1,
1.410743, -0.8918995, 0.6639504, 1, 0, 0.5058824, 1,
1.415755, -0.6546808, 1.768879, 1, 0, 0.4980392, 1,
1.423515, 1.530725, 2.038285, 1, 0, 0.4901961, 1,
1.43131, -0.243405, 2.147326, 1, 0, 0.4862745, 1,
1.442, -0.5382051, 2.996168, 1, 0, 0.4784314, 1,
1.450977, 0.3845725, 1.79316, 1, 0, 0.4745098, 1,
1.452014, -0.3884622, 2.289446, 1, 0, 0.4666667, 1,
1.484273, -0.4601979, 1.25067, 1, 0, 0.4627451, 1,
1.485822, 1.557397, 0.3964969, 1, 0, 0.454902, 1,
1.495741, 0.3488287, -0.6777479, 1, 0, 0.4509804, 1,
1.49761, -0.7366243, 3.61871, 1, 0, 0.4431373, 1,
1.498639, 0.1600016, 1.642028, 1, 0, 0.4392157, 1,
1.50153, 1.692528, 0.5653229, 1, 0, 0.4313726, 1,
1.508268, -0.6639786, 3.093794, 1, 0, 0.427451, 1,
1.511815, 0.5272627, 1.048872, 1, 0, 0.4196078, 1,
1.515307, -0.5023301, 2.081618, 1, 0, 0.4156863, 1,
1.520329, -0.719423, 1.766161, 1, 0, 0.4078431, 1,
1.529053, -0.4552811, 2.146627, 1, 0, 0.4039216, 1,
1.553573, 1.268972, -0.8430501, 1, 0, 0.3960784, 1,
1.56361, 0.3480796, 1.099232, 1, 0, 0.3882353, 1,
1.58524, -0.3669079, 0.9514256, 1, 0, 0.3843137, 1,
1.602383, -1.465677, 2.186719, 1, 0, 0.3764706, 1,
1.61883, -1.307076, 2.559527, 1, 0, 0.372549, 1,
1.619403, -1.245557, 3.523424, 1, 0, 0.3647059, 1,
1.623844, -0.8642974, 1.902524, 1, 0, 0.3607843, 1,
1.624206, 1.282341, 2.477181, 1, 0, 0.3529412, 1,
1.63002, -0.06674298, 0.8760277, 1, 0, 0.3490196, 1,
1.634392, -0.9311094, 3.837673, 1, 0, 0.3411765, 1,
1.63447, 1.087814, 2.468652, 1, 0, 0.3372549, 1,
1.641795, -1.173333, 1.839464, 1, 0, 0.3294118, 1,
1.65262, 0.4048755, 0.5808036, 1, 0, 0.3254902, 1,
1.653885, 1.395437, -0.4887015, 1, 0, 0.3176471, 1,
1.665591, 1.6302, 0.2089557, 1, 0, 0.3137255, 1,
1.66688, 0.6571481, 1.600027, 1, 0, 0.3058824, 1,
1.688742, -0.9923198, 1.941117, 1, 0, 0.2980392, 1,
1.692891, -1.598004, 2.238729, 1, 0, 0.2941177, 1,
1.71568, 0.2326441, 1.545865, 1, 0, 0.2862745, 1,
1.740535, -0.3515836, 2.372368, 1, 0, 0.282353, 1,
1.751345, -0.0295429, 1.899486, 1, 0, 0.2745098, 1,
1.768016, 0.4174844, 0.5948672, 1, 0, 0.2705882, 1,
1.768253, 0.1108674, 1.141459, 1, 0, 0.2627451, 1,
1.776652, 1.665942, 0.5709775, 1, 0, 0.2588235, 1,
1.778399, -0.5296901, 2.188023, 1, 0, 0.2509804, 1,
1.796228, 0.9334261, -1.146881, 1, 0, 0.2470588, 1,
1.809364, 0.6914689, 0.9535934, 1, 0, 0.2392157, 1,
1.811689, -1.954379, 2.45245, 1, 0, 0.2352941, 1,
1.83604, -0.5685171, 2.837293, 1, 0, 0.227451, 1,
1.848294, 1.211266, 0.1028708, 1, 0, 0.2235294, 1,
1.864531, -1.015742, 0.762909, 1, 0, 0.2156863, 1,
1.876076, -1.427938, 3.100539, 1, 0, 0.2117647, 1,
1.87671, -1.735606, 2.799089, 1, 0, 0.2039216, 1,
1.892777, -0.7423092, 2.054378, 1, 0, 0.1960784, 1,
1.921212, 0.5051681, 0.2711094, 1, 0, 0.1921569, 1,
1.924196, 1.651018, 1.639664, 1, 0, 0.1843137, 1,
1.925053, 1.536201, 2.253527, 1, 0, 0.1803922, 1,
1.937309, -1.144719, 2.497765, 1, 0, 0.172549, 1,
1.945397, 0.6391479, 1.98711, 1, 0, 0.1686275, 1,
1.950664, -0.9407358, 1.64836, 1, 0, 0.1607843, 1,
1.978195, -1.572193, 1.860745, 1, 0, 0.1568628, 1,
1.99477, 0.2011883, 1.128547, 1, 0, 0.1490196, 1,
1.995369, -0.8460537, 2.128603, 1, 0, 0.145098, 1,
2.013744, 2.343714, 2.312532, 1, 0, 0.1372549, 1,
2.021495, 0.8495646, 0.6127145, 1, 0, 0.1333333, 1,
2.036221, -0.5357999, 1.349822, 1, 0, 0.1254902, 1,
2.074429, 0.948526, 1.183083, 1, 0, 0.1215686, 1,
2.170406, 0.7195521, -1.004818, 1, 0, 0.1137255, 1,
2.177133, -1.21393, 3.00678, 1, 0, 0.1098039, 1,
2.181786, 0.4511729, 2.848453, 1, 0, 0.1019608, 1,
2.206936, 0.6477458, 1.397233, 1, 0, 0.09411765, 1,
2.207281, -1.529935, 3.431469, 1, 0, 0.09019608, 1,
2.222138, 0.5509113, 2.40667, 1, 0, 0.08235294, 1,
2.225238, 0.2257384, 0.9956324, 1, 0, 0.07843138, 1,
2.254224, 0.6591949, 1.862174, 1, 0, 0.07058824, 1,
2.260497, -0.5796457, 2.124716, 1, 0, 0.06666667, 1,
2.289093, 0.9684783, 1.02391, 1, 0, 0.05882353, 1,
2.307275, -0.07771001, 2.120134, 1, 0, 0.05490196, 1,
2.403523, 0.709696, 2.674057, 1, 0, 0.04705882, 1,
2.419151, -0.6710278, 2.032157, 1, 0, 0.04313726, 1,
2.437291, 0.5169177, 1.031592, 1, 0, 0.03529412, 1,
2.508596, -1.378539, 1.897478, 1, 0, 0.03137255, 1,
2.516855, -1.506201, 3.002173, 1, 0, 0.02352941, 1,
2.670039, 1.045083, 2.46452, 1, 0, 0.01960784, 1,
2.959889, -1.131114, 1.938883, 1, 0, 0.01176471, 1,
2.991307, 1.527737, 1.259534, 1, 0, 0.007843138, 1
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
-0.04868364, -3.727818, -7.776045, 0, -0.5, 0.5, 0.5,
-0.04868364, -3.727818, -7.776045, 1, -0.5, 0.5, 0.5,
-0.04868364, -3.727818, -7.776045, 1, 1.5, 0.5, 0.5,
-0.04868364, -3.727818, -7.776045, 0, 1.5, 0.5, 0.5
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
-4.119231, 0.403041, -7.776045, 0, -0.5, 0.5, 0.5,
-4.119231, 0.403041, -7.776045, 1, -0.5, 0.5, 0.5,
-4.119231, 0.403041, -7.776045, 1, 1.5, 0.5, 0.5,
-4.119231, 0.403041, -7.776045, 0, 1.5, 0.5, 0.5
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
-4.119231, -3.727818, -0.1882505, 0, -0.5, 0.5, 0.5,
-4.119231, -3.727818, -0.1882505, 1, -0.5, 0.5, 0.5,
-4.119231, -3.727818, -0.1882505, 1, 1.5, 0.5, 0.5,
-4.119231, -3.727818, -0.1882505, 0, 1.5, 0.5, 0.5
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
-3, -2.774543, -6.025015,
2, -2.774543, -6.025015,
-3, -2.774543, -6.025015,
-3, -2.933422, -6.316854,
-2, -2.774543, -6.025015,
-2, -2.933422, -6.316854,
-1, -2.774543, -6.025015,
-1, -2.933422, -6.316854,
0, -2.774543, -6.025015,
0, -2.933422, -6.316854,
1, -2.774543, -6.025015,
1, -2.933422, -6.316854,
2, -2.774543, -6.025015,
2, -2.933422, -6.316854
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
-3, -3.251181, -6.90053, 0, -0.5, 0.5, 0.5,
-3, -3.251181, -6.90053, 1, -0.5, 0.5, 0.5,
-3, -3.251181, -6.90053, 1, 1.5, 0.5, 0.5,
-3, -3.251181, -6.90053, 0, 1.5, 0.5, 0.5,
-2, -3.251181, -6.90053, 0, -0.5, 0.5, 0.5,
-2, -3.251181, -6.90053, 1, -0.5, 0.5, 0.5,
-2, -3.251181, -6.90053, 1, 1.5, 0.5, 0.5,
-2, -3.251181, -6.90053, 0, 1.5, 0.5, 0.5,
-1, -3.251181, -6.90053, 0, -0.5, 0.5, 0.5,
-1, -3.251181, -6.90053, 1, -0.5, 0.5, 0.5,
-1, -3.251181, -6.90053, 1, 1.5, 0.5, 0.5,
-1, -3.251181, -6.90053, 0, 1.5, 0.5, 0.5,
0, -3.251181, -6.90053, 0, -0.5, 0.5, 0.5,
0, -3.251181, -6.90053, 1, -0.5, 0.5, 0.5,
0, -3.251181, -6.90053, 1, 1.5, 0.5, 0.5,
0, -3.251181, -6.90053, 0, 1.5, 0.5, 0.5,
1, -3.251181, -6.90053, 0, -0.5, 0.5, 0.5,
1, -3.251181, -6.90053, 1, -0.5, 0.5, 0.5,
1, -3.251181, -6.90053, 1, 1.5, 0.5, 0.5,
1, -3.251181, -6.90053, 0, 1.5, 0.5, 0.5,
2, -3.251181, -6.90053, 0, -0.5, 0.5, 0.5,
2, -3.251181, -6.90053, 1, -0.5, 0.5, 0.5,
2, -3.251181, -6.90053, 1, 1.5, 0.5, 0.5,
2, -3.251181, -6.90053, 0, 1.5, 0.5, 0.5
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
-3.179874, -2, -6.025015,
-3.179874, 3, -6.025015,
-3.179874, -2, -6.025015,
-3.336433, -2, -6.316854,
-3.179874, -1, -6.025015,
-3.336433, -1, -6.316854,
-3.179874, 0, -6.025015,
-3.336433, 0, -6.316854,
-3.179874, 1, -6.025015,
-3.336433, 1, -6.316854,
-3.179874, 2, -6.025015,
-3.336433, 2, -6.316854,
-3.179874, 3, -6.025015,
-3.336433, 3, -6.316854
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
-3.649552, -2, -6.90053, 0, -0.5, 0.5, 0.5,
-3.649552, -2, -6.90053, 1, -0.5, 0.5, 0.5,
-3.649552, -2, -6.90053, 1, 1.5, 0.5, 0.5,
-3.649552, -2, -6.90053, 0, 1.5, 0.5, 0.5,
-3.649552, -1, -6.90053, 0, -0.5, 0.5, 0.5,
-3.649552, -1, -6.90053, 1, -0.5, 0.5, 0.5,
-3.649552, -1, -6.90053, 1, 1.5, 0.5, 0.5,
-3.649552, -1, -6.90053, 0, 1.5, 0.5, 0.5,
-3.649552, 0, -6.90053, 0, -0.5, 0.5, 0.5,
-3.649552, 0, -6.90053, 1, -0.5, 0.5, 0.5,
-3.649552, 0, -6.90053, 1, 1.5, 0.5, 0.5,
-3.649552, 0, -6.90053, 0, 1.5, 0.5, 0.5,
-3.649552, 1, -6.90053, 0, -0.5, 0.5, 0.5,
-3.649552, 1, -6.90053, 1, -0.5, 0.5, 0.5,
-3.649552, 1, -6.90053, 1, 1.5, 0.5, 0.5,
-3.649552, 1, -6.90053, 0, 1.5, 0.5, 0.5,
-3.649552, 2, -6.90053, 0, -0.5, 0.5, 0.5,
-3.649552, 2, -6.90053, 1, -0.5, 0.5, 0.5,
-3.649552, 2, -6.90053, 1, 1.5, 0.5, 0.5,
-3.649552, 2, -6.90053, 0, 1.5, 0.5, 0.5,
-3.649552, 3, -6.90053, 0, -0.5, 0.5, 0.5,
-3.649552, 3, -6.90053, 1, -0.5, 0.5, 0.5,
-3.649552, 3, -6.90053, 1, 1.5, 0.5, 0.5,
-3.649552, 3, -6.90053, 0, 1.5, 0.5, 0.5
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
-3.179874, -2.774543, -4,
-3.179874, -2.774543, 4,
-3.179874, -2.774543, -4,
-3.336433, -2.933422, -4,
-3.179874, -2.774543, -2,
-3.336433, -2.933422, -2,
-3.179874, -2.774543, 0,
-3.336433, -2.933422, 0,
-3.179874, -2.774543, 2,
-3.336433, -2.933422, 2,
-3.179874, -2.774543, 4,
-3.336433, -2.933422, 4
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
-3.649552, -3.251181, -4, 0, -0.5, 0.5, 0.5,
-3.649552, -3.251181, -4, 1, -0.5, 0.5, 0.5,
-3.649552, -3.251181, -4, 1, 1.5, 0.5, 0.5,
-3.649552, -3.251181, -4, 0, 1.5, 0.5, 0.5,
-3.649552, -3.251181, -2, 0, -0.5, 0.5, 0.5,
-3.649552, -3.251181, -2, 1, -0.5, 0.5, 0.5,
-3.649552, -3.251181, -2, 1, 1.5, 0.5, 0.5,
-3.649552, -3.251181, -2, 0, 1.5, 0.5, 0.5,
-3.649552, -3.251181, 0, 0, -0.5, 0.5, 0.5,
-3.649552, -3.251181, 0, 1, -0.5, 0.5, 0.5,
-3.649552, -3.251181, 0, 1, 1.5, 0.5, 0.5,
-3.649552, -3.251181, 0, 0, 1.5, 0.5, 0.5,
-3.649552, -3.251181, 2, 0, -0.5, 0.5, 0.5,
-3.649552, -3.251181, 2, 1, -0.5, 0.5, 0.5,
-3.649552, -3.251181, 2, 1, 1.5, 0.5, 0.5,
-3.649552, -3.251181, 2, 0, 1.5, 0.5, 0.5,
-3.649552, -3.251181, 4, 0, -0.5, 0.5, 0.5,
-3.649552, -3.251181, 4, 1, -0.5, 0.5, 0.5,
-3.649552, -3.251181, 4, 1, 1.5, 0.5, 0.5,
-3.649552, -3.251181, 4, 0, 1.5, 0.5, 0.5
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
-3.179874, -2.774543, -6.025015,
-3.179874, 3.580625, -6.025015,
-3.179874, -2.774543, 5.648514,
-3.179874, 3.580625, 5.648514,
-3.179874, -2.774543, -6.025015,
-3.179874, -2.774543, 5.648514,
-3.179874, 3.580625, -6.025015,
-3.179874, 3.580625, 5.648514,
-3.179874, -2.774543, -6.025015,
3.082506, -2.774543, -6.025015,
-3.179874, -2.774543, 5.648514,
3.082506, -2.774543, 5.648514,
-3.179874, 3.580625, -6.025015,
3.082506, 3.580625, -6.025015,
-3.179874, 3.580625, 5.648514,
3.082506, 3.580625, 5.648514,
3.082506, -2.774543, -6.025015,
3.082506, 3.580625, -6.025015,
3.082506, -2.774543, 5.648514,
3.082506, 3.580625, 5.648514,
3.082506, -2.774543, -6.025015,
3.082506, -2.774543, 5.648514,
3.082506, 3.580625, -6.025015,
3.082506, 3.580625, 5.648514
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
var radius = 7.845643;
var distance = 34.90615;
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
mvMatrix.translate( 0.04868364, -0.403041, 0.1882505 );
mvMatrix.scale( 1.354575, 1.334798, 0.726675 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.90615);
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
Pyrazophos<-read.table("Pyrazophos.xyz")
```

```
## Error in read.table("Pyrazophos.xyz"): no lines available in input
```

```r
x<-Pyrazophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pyrazophos' not found
```

```r
y<-Pyrazophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pyrazophos' not found
```

```r
z<-Pyrazophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pyrazophos' not found
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
-3.088674, -1.825481, -2.335547, 0, 0, 1, 1, 1,
-3.036974, 0.6803269, -1.388365, 1, 0, 0, 1, 1,
-3.007879, -0.5135162, -2.570362, 1, 0, 0, 1, 1,
-2.928895, 0.3962558, -0.8357817, 1, 0, 0, 1, 1,
-2.917572, 0.8713483, -1.000102, 1, 0, 0, 1, 1,
-2.800536, -0.9121425, -4.615752, 1, 0, 0, 1, 1,
-2.790813, 0.5969318, -1.961906, 0, 0, 0, 1, 1,
-2.665854, -0.5546763, -2.034571, 0, 0, 0, 1, 1,
-2.581627, -0.5133433, -2.854497, 0, 0, 0, 1, 1,
-2.557215, -0.4702197, -1.766236, 0, 0, 0, 1, 1,
-2.512978, -1.674783, -0.6776436, 0, 0, 0, 1, 1,
-2.448875, -0.2225169, -1.230768, 0, 0, 0, 1, 1,
-2.39274, 1.370677, 0.7229739, 0, 0, 0, 1, 1,
-2.302065, -1.450757, -1.611547, 1, 1, 1, 1, 1,
-2.265549, 0.8135938, -0.8614315, 1, 1, 1, 1, 1,
-2.257646, 0.2839399, -2.909457, 1, 1, 1, 1, 1,
-2.224403, -0.4307525, -2.032862, 1, 1, 1, 1, 1,
-2.20424, -1.305002, -3.069825, 1, 1, 1, 1, 1,
-2.16332, -0.01993666, -0.9259323, 1, 1, 1, 1, 1,
-2.153587, -0.4044055, -0.6010027, 1, 1, 1, 1, 1,
-2.143907, 0.3777256, -3.000449, 1, 1, 1, 1, 1,
-2.088512, -1.234647, -0.7958578, 1, 1, 1, 1, 1,
-2.051987, 0.8082013, 0.1202586, 1, 1, 1, 1, 1,
-2.022001, 0.2648172, -1.186594, 1, 1, 1, 1, 1,
-1.992544, 0.6570044, -1.805172, 1, 1, 1, 1, 1,
-1.936453, -1.177861, -1.885037, 1, 1, 1, 1, 1,
-1.918396, -0.8161212, -1.452635, 1, 1, 1, 1, 1,
-1.889953, 0.758603, -0.6624027, 1, 1, 1, 1, 1,
-1.854564, -0.5252791, -0.7078174, 0, 0, 1, 1, 1,
-1.841225, 0.5336556, -0.6582291, 1, 0, 0, 1, 1,
-1.838506, 0.9998705, 1.235258, 1, 0, 0, 1, 1,
-1.834774, -0.203464, 0.1230649, 1, 0, 0, 1, 1,
-1.819669, -1.1089, -2.963904, 1, 0, 0, 1, 1,
-1.818886, -0.480706, -1.718922, 1, 0, 0, 1, 1,
-1.815896, 2.307536, -2.150526, 0, 0, 0, 1, 1,
-1.757874, 2.166685, -1.037233, 0, 0, 0, 1, 1,
-1.752599, -0.2895815, -2.2568, 0, 0, 0, 1, 1,
-1.719315, 0.2402459, -0.6224169, 0, 0, 0, 1, 1,
-1.712286, -0.3880242, 0.3158896, 0, 0, 0, 1, 1,
-1.709654, 1.009235, -1.62032, 0, 0, 0, 1, 1,
-1.697318, 0.8333622, -0.7905716, 0, 0, 0, 1, 1,
-1.690565, -1.871439, -2.377405, 1, 1, 1, 1, 1,
-1.687227, -1.06179, -3.09397, 1, 1, 1, 1, 1,
-1.686076, -0.5438194, -1.500146, 1, 1, 1, 1, 1,
-1.64982, -0.3280546, -1.9954, 1, 1, 1, 1, 1,
-1.645425, 0.2998495, 1.058374, 1, 1, 1, 1, 1,
-1.633202, 0.9826806, -1.347224, 1, 1, 1, 1, 1,
-1.624104, 0.8415722, -3.052514, 1, 1, 1, 1, 1,
-1.610371, -0.2023792, -0.4881223, 1, 1, 1, 1, 1,
-1.586583, 0.36926, -2.258074, 1, 1, 1, 1, 1,
-1.563052, -0.2125157, -2.650599, 1, 1, 1, 1, 1,
-1.549008, -0.7830846, -4.1702, 1, 1, 1, 1, 1,
-1.547723, 1.21105, 0.08588278, 1, 1, 1, 1, 1,
-1.539997, -0.6958902, -2.434852, 1, 1, 1, 1, 1,
-1.526417, -0.2416705, -2.027828, 1, 1, 1, 1, 1,
-1.520572, 0.2491284, -2.151189, 1, 1, 1, 1, 1,
-1.508455, 0.2095578, -0.9278245, 0, 0, 1, 1, 1,
-1.505893, 3.00361, -0.04234184, 1, 0, 0, 1, 1,
-1.488884, -0.9919918, -1.015748, 1, 0, 0, 1, 1,
-1.484445, -0.7022716, -2.475298, 1, 0, 0, 1, 1,
-1.480698, -0.4474688, -3.607915, 1, 0, 0, 1, 1,
-1.470458, -1.718069, -2.504652, 1, 0, 0, 1, 1,
-1.463035, 0.08697942, -1.267236, 0, 0, 0, 1, 1,
-1.442523, 0.1707104, -0.9591875, 0, 0, 0, 1, 1,
-1.434755, -0.2958377, -2.113125, 0, 0, 0, 1, 1,
-1.4141, 1.493494, -1.706163, 0, 0, 0, 1, 1,
-1.408501, 0.2631478, -1.239018, 0, 0, 0, 1, 1,
-1.384905, -0.1105015, -0.09455629, 0, 0, 0, 1, 1,
-1.370919, 0.9318729, -2.442888, 0, 0, 0, 1, 1,
-1.367147, 0.3306817, -0.5725912, 1, 1, 1, 1, 1,
-1.362095, 0.9344808, 0.4747417, 1, 1, 1, 1, 1,
-1.359955, 0.9472039, -2.535216, 1, 1, 1, 1, 1,
-1.355131, -0.8444517, -3.372811, 1, 1, 1, 1, 1,
-1.340747, 0.2187883, -1.98564, 1, 1, 1, 1, 1,
-1.335444, 0.9043943, -0.1094483, 1, 1, 1, 1, 1,
-1.332764, 0.8951942, -0.7284493, 1, 1, 1, 1, 1,
-1.33093, 1.194719, 0.07419324, 1, 1, 1, 1, 1,
-1.328701, -0.4149148, -2.721942, 1, 1, 1, 1, 1,
-1.324481, -1.15169, -1.671789, 1, 1, 1, 1, 1,
-1.318936, 0.1397902, -1.392106, 1, 1, 1, 1, 1,
-1.314873, 0.5945022, -1.999378, 1, 1, 1, 1, 1,
-1.313166, 0.5399154, -1.180041, 1, 1, 1, 1, 1,
-1.294523, 0.2762638, -0.9502398, 1, 1, 1, 1, 1,
-1.291045, 0.4383768, -0.3377183, 1, 1, 1, 1, 1,
-1.28922, 0.9572734, -0.3055786, 0, 0, 1, 1, 1,
-1.288908, 0.4371378, -0.5622929, 1, 0, 0, 1, 1,
-1.276661, 1.72133, 0.6539631, 1, 0, 0, 1, 1,
-1.268436, 0.3069734, -1.930155, 1, 0, 0, 1, 1,
-1.257599, -0.03891388, -1.68161, 1, 0, 0, 1, 1,
-1.255702, 0.8111817, 0.814534, 1, 0, 0, 1, 1,
-1.245394, 0.4796425, -0.6529198, 0, 0, 0, 1, 1,
-1.241611, 1.990212, -0.2016763, 0, 0, 0, 1, 1,
-1.235465, -0.2482154, -2.779625, 0, 0, 0, 1, 1,
-1.232886, -1.425607, -0.7262903, 0, 0, 0, 1, 1,
-1.231959, -1.328102, -4.224703, 0, 0, 0, 1, 1,
-1.231944, -0.9158615, -0.3178843, 0, 0, 0, 1, 1,
-1.227069, 1.507768, -0.2686637, 0, 0, 0, 1, 1,
-1.224652, 3.488074, 0.4640719, 1, 1, 1, 1, 1,
-1.210141, 0.1479287, -1.916538, 1, 1, 1, 1, 1,
-1.202919, 0.2080694, -2.144184, 1, 1, 1, 1, 1,
-1.19849, 0.06765371, -0.428877, 1, 1, 1, 1, 1,
-1.191828, -2.274426, 0.02891399, 1, 1, 1, 1, 1,
-1.19, 0.2699724, -0.5740541, 1, 1, 1, 1, 1,
-1.18927, 0.6970596, -1.220198, 1, 1, 1, 1, 1,
-1.185744, -0.7012084, 0.4275279, 1, 1, 1, 1, 1,
-1.182017, -0.1645797, -1.414286, 1, 1, 1, 1, 1,
-1.180317, 0.2556121, 0.07933267, 1, 1, 1, 1, 1,
-1.177616, 0.4329003, 0.5883899, 1, 1, 1, 1, 1,
-1.173543, 0.083144, 0.1627722, 1, 1, 1, 1, 1,
-1.168505, -1.157604, -1.931296, 1, 1, 1, 1, 1,
-1.165473, 0.2190342, -0.2553122, 1, 1, 1, 1, 1,
-1.158825, 0.04986655, -1.486968, 1, 1, 1, 1, 1,
-1.157434, 0.07293753, -1.863708, 0, 0, 1, 1, 1,
-1.152692, 0.8019804, -1.279626, 1, 0, 0, 1, 1,
-1.146609, 0.3765779, -0.6257917, 1, 0, 0, 1, 1,
-1.137597, 1.145981, -2.031203, 1, 0, 0, 1, 1,
-1.133263, -0.08544118, -1.492998, 1, 0, 0, 1, 1,
-1.130172, -2.15662, -2.423427, 1, 0, 0, 1, 1,
-1.129257, 0.7754813, -1.464625, 0, 0, 0, 1, 1,
-1.127138, 0.42169, -2.118288, 0, 0, 0, 1, 1,
-1.126626, 0.1982833, -0.9485596, 0, 0, 0, 1, 1,
-1.115288, 1.211232, -2.250368, 0, 0, 0, 1, 1,
-1.115106, 0.6865437, -1.141864, 0, 0, 0, 1, 1,
-1.103593, -1.560346, -1.43383, 0, 0, 0, 1, 1,
-1.101045, -0.4806087, -1.973996, 0, 0, 0, 1, 1,
-1.09565, -1.738466, -1.353911, 1, 1, 1, 1, 1,
-1.090389, 1.016684, 0.2305281, 1, 1, 1, 1, 1,
-1.086436, -1.997814, -3.757651, 1, 1, 1, 1, 1,
-1.086379, 0.1222039, -2.50437, 1, 1, 1, 1, 1,
-1.086057, -0.6246027, -2.690737, 1, 1, 1, 1, 1,
-1.074712, -2.120444, -3.487417, 1, 1, 1, 1, 1,
-1.071628, 0.109797, -0.3237663, 1, 1, 1, 1, 1,
-1.068983, -1.326545, -3.427668, 1, 1, 1, 1, 1,
-1.060943, -0.01150842, 0.06239388, 1, 1, 1, 1, 1,
-1.057637, 0.721482, -1.817249, 1, 1, 1, 1, 1,
-1.055562, 0.05492613, -1.812203, 1, 1, 1, 1, 1,
-1.048933, -0.6017994, -0.7350476, 1, 1, 1, 1, 1,
-1.030532, 0.2799476, 0.009777548, 1, 1, 1, 1, 1,
-1.02992, 0.4222918, -1.387258, 1, 1, 1, 1, 1,
-1.02912, 0.5368823, -0.374027, 1, 1, 1, 1, 1,
-1.025131, 1.163578, -0.28162, 0, 0, 1, 1, 1,
-1.021989, -0.8652277, -1.543649, 1, 0, 0, 1, 1,
-1.020815, -1.396498, -2.748808, 1, 0, 0, 1, 1,
-1.011125, -0.3546139, -1.614629, 1, 0, 0, 1, 1,
-1.00771, 2.654007, 1.018674, 1, 0, 0, 1, 1,
-1.006389, -0.2655157, -2.279775, 1, 0, 0, 1, 1,
-1.00564, -0.167911, -2.065533, 0, 0, 0, 1, 1,
-1.002512, 0.2261374, 1.241227, 0, 0, 0, 1, 1,
-0.9998852, 0.7418802, -0.01897679, 0, 0, 0, 1, 1,
-0.9924594, 0.636411, -3.469082, 0, 0, 0, 1, 1,
-0.9894344, -0.02527553, -0.3806575, 0, 0, 0, 1, 1,
-0.9708866, -0.5049715, -1.503026, 0, 0, 0, 1, 1,
-0.9686626, -1.493386, -2.82738, 0, 0, 0, 1, 1,
-0.9654124, 0.6989691, -0.3911907, 1, 1, 1, 1, 1,
-0.964984, 0.3161759, -2.09997, 1, 1, 1, 1, 1,
-0.9643523, 1.232023, -0.6442398, 1, 1, 1, 1, 1,
-0.961346, -1.772666, -3.068955, 1, 1, 1, 1, 1,
-0.9573084, 0.004577437, -3.26705, 1, 1, 1, 1, 1,
-0.945591, 0.6009209, -2.041891, 1, 1, 1, 1, 1,
-0.941361, -2.298372, -2.898753, 1, 1, 1, 1, 1,
-0.9364728, 0.6120887, -1.073851, 1, 1, 1, 1, 1,
-0.9352215, -0.1924644, -3.022315, 1, 1, 1, 1, 1,
-0.9331132, 0.2447072, -2.408573, 1, 1, 1, 1, 1,
-0.9323422, -0.1536562, -2.814909, 1, 1, 1, 1, 1,
-0.9317014, 0.4131899, -1.46898, 1, 1, 1, 1, 1,
-0.9257774, -0.2440273, -2.730274, 1, 1, 1, 1, 1,
-0.9250033, -1.264182, -1.534691, 1, 1, 1, 1, 1,
-0.9061016, 0.3147453, -0.5328898, 1, 1, 1, 1, 1,
-0.9039642, -1.125366, -3.755591, 0, 0, 1, 1, 1,
-0.899084, 2.444887, -0.3205378, 1, 0, 0, 1, 1,
-0.8979787, 0.4575957, -0.9151984, 1, 0, 0, 1, 1,
-0.8959064, 0.5686285, -1.659687, 1, 0, 0, 1, 1,
-0.8942687, -1.004522, -1.814911, 1, 0, 0, 1, 1,
-0.891494, -1.603872, -1.356859, 1, 0, 0, 1, 1,
-0.8823004, 0.9688479, -1.081584, 0, 0, 0, 1, 1,
-0.8685181, 0.904996, -1.683149, 0, 0, 0, 1, 1,
-0.8665244, 0.7694563, -1.451882, 0, 0, 0, 1, 1,
-0.8618017, 0.9183059, -0.05159876, 0, 0, 0, 1, 1,
-0.8598622, 0.4833257, -0.2135668, 0, 0, 0, 1, 1,
-0.8561459, -0.9428169, 0.1045818, 0, 0, 0, 1, 1,
-0.8543884, 2.094144, -0.08518258, 0, 0, 0, 1, 1,
-0.8529329, 0.1790769, -0.5820358, 1, 1, 1, 1, 1,
-0.8442534, -2.407636, -2.275282, 1, 1, 1, 1, 1,
-0.8383071, 1.042675, -1.418012, 1, 1, 1, 1, 1,
-0.8280408, 0.3362065, -3.51573, 1, 1, 1, 1, 1,
-0.8110995, 0.03615184, -2.213287, 1, 1, 1, 1, 1,
-0.8108856, -0.4826275, -0.7797035, 1, 1, 1, 1, 1,
-0.8083744, 1.410776, -2.082436, 1, 1, 1, 1, 1,
-0.8028663, 1.387699, 1.299388, 1, 1, 1, 1, 1,
-0.8026271, 0.2238083, 0.1996362, 1, 1, 1, 1, 1,
-0.7908545, 0.3065107, -0.9035055, 1, 1, 1, 1, 1,
-0.7834439, 1.017437, 0.08025038, 1, 1, 1, 1, 1,
-0.7810221, -0.2533515, -2.517958, 1, 1, 1, 1, 1,
-0.7808155, -0.8272508, -2.51759, 1, 1, 1, 1, 1,
-0.7799952, 0.5174704, -0.6956953, 1, 1, 1, 1, 1,
-0.774385, -0.9991076, -3.461569, 1, 1, 1, 1, 1,
-0.7684399, 0.5608793, -0.3662323, 0, 0, 1, 1, 1,
-0.7637444, 2.10194, 0.9370238, 1, 0, 0, 1, 1,
-0.7625231, -1.556714, -1.980628, 1, 0, 0, 1, 1,
-0.7602263, -0.7692068, -3.274134, 1, 0, 0, 1, 1,
-0.7593204, 0.4595477, -1.35693, 1, 0, 0, 1, 1,
-0.758534, -0.05660148, -1.897599, 1, 0, 0, 1, 1,
-0.7568024, 0.8125262, -0.1111587, 0, 0, 0, 1, 1,
-0.7533617, -0.1740214, -0.9369858, 0, 0, 0, 1, 1,
-0.7531213, -0.4084575, -1.910768, 0, 0, 0, 1, 1,
-0.75306, 0.191634, -2.89221, 0, 0, 0, 1, 1,
-0.7519851, 0.2037577, -0.984554, 0, 0, 0, 1, 1,
-0.7485346, -1.071635, -4.039544, 0, 0, 0, 1, 1,
-0.7479845, -1.958235, -1.881849, 0, 0, 0, 1, 1,
-0.747484, -1.456352, -2.210291, 1, 1, 1, 1, 1,
-0.7468868, -0.7407086, -1.932126, 1, 1, 1, 1, 1,
-0.7422778, 0.190785, -0.6186225, 1, 1, 1, 1, 1,
-0.7388408, 2.719723, -0.7966046, 1, 1, 1, 1, 1,
-0.737509, -0.6275595, -1.939647, 1, 1, 1, 1, 1,
-0.7291771, -0.1499198, -2.94315, 1, 1, 1, 1, 1,
-0.7284784, 0.1957085, 0.5347781, 1, 1, 1, 1, 1,
-0.7273738, -1.530102, -1.604781, 1, 1, 1, 1, 1,
-0.7268465, -1.666005, -2.409952, 1, 1, 1, 1, 1,
-0.7264531, -0.3376395, -2.505508, 1, 1, 1, 1, 1,
-0.7260795, 0.3691854, -0.6688051, 1, 1, 1, 1, 1,
-0.7234623, -1.412448, -2.374073, 1, 1, 1, 1, 1,
-0.7206703, 0.7125928, -0.2950322, 1, 1, 1, 1, 1,
-0.7136835, 0.2791861, -1.28649, 1, 1, 1, 1, 1,
-0.7136272, 1.590952, -0.9082749, 1, 1, 1, 1, 1,
-0.7103329, 0.5252307, -2.53593, 0, 0, 1, 1, 1,
-0.7102777, 1.044126, -0.1829921, 1, 0, 0, 1, 1,
-0.7076072, -0.9035332, -3.955906, 1, 0, 0, 1, 1,
-0.7053621, -2.681992, -1.854972, 1, 0, 0, 1, 1,
-0.7013289, -1.569335, -2.770674, 1, 0, 0, 1, 1,
-0.6964101, -0.5647134, -3.254676, 1, 0, 0, 1, 1,
-0.6963886, -1.539498, -2.073622, 0, 0, 0, 1, 1,
-0.6958142, -0.3442554, -1.900089, 0, 0, 0, 1, 1,
-0.6940782, 0.8233477, -1.757629, 0, 0, 0, 1, 1,
-0.6937962, 1.044236, -2.314127, 0, 0, 0, 1, 1,
-0.6912826, 1.471643, -0.1080983, 0, 0, 0, 1, 1,
-0.6888799, -0.6209384, -1.377973, 0, 0, 0, 1, 1,
-0.6869563, 0.003289184, -1.633366, 0, 0, 0, 1, 1,
-0.6815057, -0.06791626, 0.2086049, 1, 1, 1, 1, 1,
-0.6793493, -0.01997984, -0.7135655, 1, 1, 1, 1, 1,
-0.6675766, 0.4694211, 0.1391507, 1, 1, 1, 1, 1,
-0.6583223, 1.279681, -0.3794727, 1, 1, 1, 1, 1,
-0.6565338, 1.050942, -1.917067, 1, 1, 1, 1, 1,
-0.6553453, 0.8642497, 0.1452376, 1, 1, 1, 1, 1,
-0.6540668, 0.718748, -1.720155, 1, 1, 1, 1, 1,
-0.6499901, 0.2356832, -1.528235, 1, 1, 1, 1, 1,
-0.6462802, -0.2454118, -1.680064, 1, 1, 1, 1, 1,
-0.6443421, -0.4520683, -3.433168, 1, 1, 1, 1, 1,
-0.644056, 1.516286, 0.2496526, 1, 1, 1, 1, 1,
-0.6393417, 1.273136, -0.2522755, 1, 1, 1, 1, 1,
-0.6359301, 0.4218778, -0.9328451, 1, 1, 1, 1, 1,
-0.6345777, -0.04150166, -2.184433, 1, 1, 1, 1, 1,
-0.6299556, 0.6668214, -0.1427025, 1, 1, 1, 1, 1,
-0.6271191, 0.7761942, -0.6801442, 0, 0, 1, 1, 1,
-0.6263332, -0.4890561, -3.183784, 1, 0, 0, 1, 1,
-0.6253973, 0.1345637, -2.144015, 1, 0, 0, 1, 1,
-0.6211841, -0.6976365, -1.372481, 1, 0, 0, 1, 1,
-0.6184543, -1.051513, -2.27666, 1, 0, 0, 1, 1,
-0.6155944, 1.164446, -1.362581, 1, 0, 0, 1, 1,
-0.6150926, 0.9324049, -0.7942536, 0, 0, 0, 1, 1,
-0.6121681, -0.6076713, -3.174717, 0, 0, 0, 1, 1,
-0.6112155, -0.2682373, -1.438407, 0, 0, 0, 1, 1,
-0.6108208, -0.199152, -1.92428, 0, 0, 0, 1, 1,
-0.6094471, -0.2478989, -2.791559, 0, 0, 0, 1, 1,
-0.6090747, 1.397828, -1.65056, 0, 0, 0, 1, 1,
-0.599576, 0.1574345, -2.287092, 0, 0, 0, 1, 1,
-0.5991964, -0.1258498, -2.653461, 1, 1, 1, 1, 1,
-0.598684, 1.981174, -0.4141082, 1, 1, 1, 1, 1,
-0.5923607, 1.002726, 1.215448, 1, 1, 1, 1, 1,
-0.5884913, 1.052121, -1.073758, 1, 1, 1, 1, 1,
-0.5837542, -0.5913488, -3.52387, 1, 1, 1, 1, 1,
-0.5828483, 0.7038616, -0.09045197, 1, 1, 1, 1, 1,
-0.5773014, -0.9395702, -3.72014, 1, 1, 1, 1, 1,
-0.5712047, -0.3947831, -2.737025, 1, 1, 1, 1, 1,
-0.5673899, -1.388755, -2.816597, 1, 1, 1, 1, 1,
-0.5527912, 1.555528, -0.6261086, 1, 1, 1, 1, 1,
-0.5447344, -1.015836, -2.632266, 1, 1, 1, 1, 1,
-0.5389917, -0.1160801, -1.639274, 1, 1, 1, 1, 1,
-0.5381342, 0.9169061, -0.292687, 1, 1, 1, 1, 1,
-0.5380671, -0.05404313, -2.384869, 1, 1, 1, 1, 1,
-0.5369987, -0.5291695, -3.572394, 1, 1, 1, 1, 1,
-0.5359467, 1.843948, -0.6075286, 0, 0, 1, 1, 1,
-0.5347444, 0.3692056, -0.392452, 1, 0, 0, 1, 1,
-0.5326036, -0.1780132, -1.69294, 1, 0, 0, 1, 1,
-0.5309341, 2.614755, 0.3566085, 1, 0, 0, 1, 1,
-0.5301004, -0.3569681, -1.786037, 1, 0, 0, 1, 1,
-0.5253832, -1.696837, -2.349707, 1, 0, 0, 1, 1,
-0.519585, 0.6944695, 0.06680777, 0, 0, 0, 1, 1,
-0.5168906, -1.299782, -3.412263, 0, 0, 0, 1, 1,
-0.5159294, -1.600699, -2.637826, 0, 0, 0, 1, 1,
-0.5052355, 1.203197, -0.292672, 0, 0, 0, 1, 1,
-0.495243, -2.004073, -4.721054, 0, 0, 0, 1, 1,
-0.4950771, -0.7637705, -3.701601, 0, 0, 0, 1, 1,
-0.492874, -1.283708, -2.842358, 0, 0, 0, 1, 1,
-0.4852965, 0.09305327, -2.367457, 1, 1, 1, 1, 1,
-0.4833647, -0.02429185, 0.3043081, 1, 1, 1, 1, 1,
-0.4743251, -1.690222, -3.342269, 1, 1, 1, 1, 1,
-0.4717157, -0.0269286, -2.729697, 1, 1, 1, 1, 1,
-0.4712864, 0.8643848, -1.277094, 1, 1, 1, 1, 1,
-0.4692597, -2.261176, -2.3603, 1, 1, 1, 1, 1,
-0.4671302, -0.3508664, -1.440422, 1, 1, 1, 1, 1,
-0.465377, 2.047405, -0.05598912, 1, 1, 1, 1, 1,
-0.4647696, 0.8241074, 1.465359, 1, 1, 1, 1, 1,
-0.4613526, -0.004811285, -1.426208, 1, 1, 1, 1, 1,
-0.4603662, 1.236602, 0.317586, 1, 1, 1, 1, 1,
-0.458525, -1.155026, -1.628748, 1, 1, 1, 1, 1,
-0.4548408, -0.8215379, -2.487305, 1, 1, 1, 1, 1,
-0.4547002, -1.328474, -0.508402, 1, 1, 1, 1, 1,
-0.4526288, 0.3147249, -0.2999093, 1, 1, 1, 1, 1,
-0.4509845, 0.02660189, -1.570517, 0, 0, 1, 1, 1,
-0.4504633, -0.7987443, -1.616173, 1, 0, 0, 1, 1,
-0.4486714, -0.05818869, -0.3277884, 1, 0, 0, 1, 1,
-0.4483155, -1.527521, -0.4976339, 1, 0, 0, 1, 1,
-0.4476519, -0.6657322, -5.855012, 1, 0, 0, 1, 1,
-0.4464993, 1.306486, -1.219563, 1, 0, 0, 1, 1,
-0.4435726, -1.161837, -3.898024, 0, 0, 0, 1, 1,
-0.4409632, 1.340136, -1.148157, 0, 0, 0, 1, 1,
-0.4388447, 0.9891347, 0.1428781, 0, 0, 0, 1, 1,
-0.4369019, -0.5058441, -1.890884, 0, 0, 0, 1, 1,
-0.4306785, -0.4689244, -2.768514, 0, 0, 0, 1, 1,
-0.4240307, -2.442806, -3.403796, 0, 0, 0, 1, 1,
-0.4230876, 1.716757, -0.1823002, 0, 0, 0, 1, 1,
-0.4223011, -0.7715639, -3.786052, 1, 1, 1, 1, 1,
-0.4215471, -0.0428081, -2.173598, 1, 1, 1, 1, 1,
-0.4209192, 0.5370063, -0.1562021, 1, 1, 1, 1, 1,
-0.4169102, -0.1120782, -2.829415, 1, 1, 1, 1, 1,
-0.4119321, -1.434658, -3.053483, 1, 1, 1, 1, 1,
-0.4112785, 0.2888663, 0.6523193, 1, 1, 1, 1, 1,
-0.4033627, -0.6130655, -0.5391529, 1, 1, 1, 1, 1,
-0.4032193, -1.351236, -0.6467983, 1, 1, 1, 1, 1,
-0.403094, 0.4232655, -1.909458, 1, 1, 1, 1, 1,
-0.4026813, -0.8650932, -3.182282, 1, 1, 1, 1, 1,
-0.4010209, 0.9106025, 0.6917207, 1, 1, 1, 1, 1,
-0.3985098, 0.04420978, -1.551212, 1, 1, 1, 1, 1,
-0.3978876, -2.641473, -3.656918, 1, 1, 1, 1, 1,
-0.396623, -0.4998161, -2.326286, 1, 1, 1, 1, 1,
-0.3964055, 0.2993692, -1.79412, 1, 1, 1, 1, 1,
-0.3949236, -0.2826841, -2.502059, 0, 0, 1, 1, 1,
-0.3939925, -0.09492747, -2.924343, 1, 0, 0, 1, 1,
-0.3937666, -0.385996, -4.323007, 1, 0, 0, 1, 1,
-0.3926288, -1.57363, -2.410985, 1, 0, 0, 1, 1,
-0.3864554, 2.511723, 0.6406801, 1, 0, 0, 1, 1,
-0.3851295, 1.757486, -0.3835538, 1, 0, 0, 1, 1,
-0.3797458, 1.382466, 1.768069, 0, 0, 0, 1, 1,
-0.3787535, -1.295486, -2.238075, 0, 0, 0, 1, 1,
-0.3769741, -1.207356, -4.43704, 0, 0, 0, 1, 1,
-0.3765118, -0.02379045, -0.9796903, 0, 0, 0, 1, 1,
-0.3736915, -1.632354, -2.824235, 0, 0, 0, 1, 1,
-0.3697864, -1.101967, -3.149101, 0, 0, 0, 1, 1,
-0.3641335, 0.6508226, -0.8925511, 0, 0, 0, 1, 1,
-0.3637924, 1.190044, 0.188437, 1, 1, 1, 1, 1,
-0.3607127, 0.8600773, 0.8309479, 1, 1, 1, 1, 1,
-0.3604642, -0.3794934, -1.80868, 1, 1, 1, 1, 1,
-0.3604626, 0.09114169, -3.370874, 1, 1, 1, 1, 1,
-0.3589571, 0.2922453, -0.930522, 1, 1, 1, 1, 1,
-0.3545681, -0.936221, -2.405256, 1, 1, 1, 1, 1,
-0.3516557, 0.9664875, 1.275682, 1, 1, 1, 1, 1,
-0.3512444, 1.744165, -0.4079869, 1, 1, 1, 1, 1,
-0.3511374, -0.1652193, -1.981899, 1, 1, 1, 1, 1,
-0.3489325, 0.6502858, -0.4661739, 1, 1, 1, 1, 1,
-0.3418629, -1.276277, -3.825875, 1, 1, 1, 1, 1,
-0.3352103, 1.05981, -1.356719, 1, 1, 1, 1, 1,
-0.3351136, 1.192955, 1.258314, 1, 1, 1, 1, 1,
-0.3346807, 0.5632441, -0.3822591, 1, 1, 1, 1, 1,
-0.3342407, 0.1541371, -1.866806, 1, 1, 1, 1, 1,
-0.3275752, 0.4190263, 0.8120626, 0, 0, 1, 1, 1,
-0.3230082, 0.5650443, -0.9549232, 1, 0, 0, 1, 1,
-0.3218144, -1.01369, -3.560143, 1, 0, 0, 1, 1,
-0.3169348, 0.946925, -1.12869, 1, 0, 0, 1, 1,
-0.3166745, 0.1926743, 0.1703373, 1, 0, 0, 1, 1,
-0.314683, 0.245673, -1.787131, 1, 0, 0, 1, 1,
-0.3129773, 1.810202, 1.421889, 0, 0, 0, 1, 1,
-0.3116821, -0.004204868, 0.03330897, 0, 0, 0, 1, 1,
-0.3105507, 1.871909, 1.119455, 0, 0, 0, 1, 1,
-0.309143, -0.6782587, -1.911913, 0, 0, 0, 1, 1,
-0.3087116, 0.6268952, -0.2239501, 0, 0, 0, 1, 1,
-0.3038798, 0.5614876, 0.3325333, 0, 0, 0, 1, 1,
-0.302097, 2.285567, -0.9174824, 0, 0, 0, 1, 1,
-0.3009098, 0.7123066, -1.983666, 1, 1, 1, 1, 1,
-0.2998299, -0.1691629, -1.998293, 1, 1, 1, 1, 1,
-0.2979034, 1.160669, 0.09476147, 1, 1, 1, 1, 1,
-0.2978895, 0.6711363, -0.01696904, 1, 1, 1, 1, 1,
-0.2915747, 0.6963852, -1.169961, 1, 1, 1, 1, 1,
-0.2892959, -0.381477, -1.726435, 1, 1, 1, 1, 1,
-0.2860982, -0.07540184, -1.858852, 1, 1, 1, 1, 1,
-0.2806424, -1.264988, -2.496939, 1, 1, 1, 1, 1,
-0.2730682, -1.090974, -2.646325, 1, 1, 1, 1, 1,
-0.271253, -0.8648014, -3.093653, 1, 1, 1, 1, 1,
-0.2711249, -1.152941, -4.444177, 1, 1, 1, 1, 1,
-0.26962, -0.1942252, -1.89606, 1, 1, 1, 1, 1,
-0.2685648, 1.084527, -3.531656, 1, 1, 1, 1, 1,
-0.2684333, 0.7590518, -0.5884269, 1, 1, 1, 1, 1,
-0.2651294, -1.319941, -2.3472, 1, 1, 1, 1, 1,
-0.2630448, -0.3000006, -1.360707, 0, 0, 1, 1, 1,
-0.262227, -0.2483784, -1.467746, 1, 0, 0, 1, 1,
-0.2603337, -0.4005901, -2.366201, 1, 0, 0, 1, 1,
-0.2513844, 1.428528, -0.09871417, 1, 0, 0, 1, 1,
-0.245763, -0.2742646, -1.988688, 1, 0, 0, 1, 1,
-0.2434516, -0.6191923, -3.141721, 1, 0, 0, 1, 1,
-0.2378149, -0.5979204, -2.009288, 0, 0, 0, 1, 1,
-0.2368493, 0.6165401, -0.5962581, 0, 0, 0, 1, 1,
-0.2353948, -0.779614, -1.292742, 0, 0, 0, 1, 1,
-0.2342448, -2.290121, -2.556346, 0, 0, 0, 1, 1,
-0.2317996, -1.135605, -3.143136, 0, 0, 0, 1, 1,
-0.2315249, -0.604615, -3.679811, 0, 0, 0, 1, 1,
-0.2280628, -0.2900443, -2.679353, 0, 0, 0, 1, 1,
-0.2246953, -2.422961, -4.129594, 1, 1, 1, 1, 1,
-0.2225823, 0.2185721, -1.159488, 1, 1, 1, 1, 1,
-0.2149362, 0.2302153, -1.283285, 1, 1, 1, 1, 1,
-0.2147439, 0.7113814, -0.06951632, 1, 1, 1, 1, 1,
-0.214649, -1.104207, -3.854139, 1, 1, 1, 1, 1,
-0.213314, 0.244091, -2.49659, 1, 1, 1, 1, 1,
-0.212187, 0.6389993, -0.03011227, 1, 1, 1, 1, 1,
-0.2060281, 0.08812194, 0.3912085, 1, 1, 1, 1, 1,
-0.2032139, 0.9588055, -0.3766038, 1, 1, 1, 1, 1,
-0.2023188, -0.4215406, -0.7514806, 1, 1, 1, 1, 1,
-0.1991023, -0.5743811, -2.222121, 1, 1, 1, 1, 1,
-0.1986874, -1.570646, -2.851239, 1, 1, 1, 1, 1,
-0.1983966, -0.5652295, -1.321226, 1, 1, 1, 1, 1,
-0.1978996, 0.1027277, -1.573554, 1, 1, 1, 1, 1,
-0.1951595, -0.4742408, -2.011182, 1, 1, 1, 1, 1,
-0.1928463, -0.07610358, -1.277808, 0, 0, 1, 1, 1,
-0.1922973, 1.4572, -1.240515, 1, 0, 0, 1, 1,
-0.1899009, -0.6137211, -5.073503, 1, 0, 0, 1, 1,
-0.1892801, -0.2883418, -1.200001, 1, 0, 0, 1, 1,
-0.189146, 1.431358, -0.008245528, 1, 0, 0, 1, 1,
-0.1809842, -1.354916, -2.828744, 1, 0, 0, 1, 1,
-0.1802952, 0.416705, 0.8144776, 0, 0, 0, 1, 1,
-0.1780009, 1.072678, -1.355698, 0, 0, 0, 1, 1,
-0.1773228, 0.6621838, 0.05685848, 0, 0, 0, 1, 1,
-0.1769487, -0.8461092, -3.433286, 0, 0, 0, 1, 1,
-0.1712728, 1.226045, 1.631054, 0, 0, 0, 1, 1,
-0.1700571, -0.9127352, -3.427503, 0, 0, 0, 1, 1,
-0.1696859, -0.2171124, -1.691176, 0, 0, 0, 1, 1,
-0.1658245, 1.490038, 1.307444, 1, 1, 1, 1, 1,
-0.1637766, 1.542703, 0.9635178, 1, 1, 1, 1, 1,
-0.1636451, -2.022727, -0.8590665, 1, 1, 1, 1, 1,
-0.1631539, 1.315892, -0.1011445, 1, 1, 1, 1, 1,
-0.1609595, -0.03601195, -1.296963, 1, 1, 1, 1, 1,
-0.1562148, -0.03928917, -0.9524029, 1, 1, 1, 1, 1,
-0.1558218, -1.115655, -3.310151, 1, 1, 1, 1, 1,
-0.1552163, -1.896186, -3.374762, 1, 1, 1, 1, 1,
-0.153913, 0.5857501, -1.104558, 1, 1, 1, 1, 1,
-0.1502742, 0.6224267, -1.216557, 1, 1, 1, 1, 1,
-0.1502699, 0.8460056, 0.561253, 1, 1, 1, 1, 1,
-0.1497829, -0.9261337, -2.170236, 1, 1, 1, 1, 1,
-0.1402238, 0.7918922, -1.505672, 1, 1, 1, 1, 1,
-0.1392571, -0.2557089, -3.61422, 1, 1, 1, 1, 1,
-0.1378685, 1.526677, -0.3572508, 1, 1, 1, 1, 1,
-0.1296915, -1.589927, -3.382259, 0, 0, 1, 1, 1,
-0.1291109, 1.700168, -1.306859, 1, 0, 0, 1, 1,
-0.1291091, 0.9205441, 0.3999594, 1, 0, 0, 1, 1,
-0.129043, -1.099296, -1.930087, 1, 0, 0, 1, 1,
-0.1272222, -0.7110983, -1.213379, 1, 0, 0, 1, 1,
-0.1164187, -1.027585, -2.971053, 1, 0, 0, 1, 1,
-0.1152153, -0.3883113, -3.020494, 0, 0, 0, 1, 1,
-0.1100742, -1.964795, -3.041718, 0, 0, 0, 1, 1,
-0.1066612, 0.4001449, 0.8084108, 0, 0, 0, 1, 1,
-0.102262, 0.2509444, -0.4581834, 0, 0, 0, 1, 1,
-0.09669762, -0.2223823, -1.955941, 0, 0, 0, 1, 1,
-0.08813628, 0.6207908, 0.006627679, 0, 0, 0, 1, 1,
-0.08650368, 0.5043779, 0.1425113, 0, 0, 0, 1, 1,
-0.0830415, -0.9712471, -3.504795, 1, 1, 1, 1, 1,
-0.0791325, 0.541326, 0.1208069, 1, 1, 1, 1, 1,
-0.07772117, -0.5863948, -4.259328, 1, 1, 1, 1, 1,
-0.07351525, 1.014875, -0.02759512, 1, 1, 1, 1, 1,
-0.06780381, 1.740401, -0.7924149, 1, 1, 1, 1, 1,
-0.06556612, -0.82525, -2.907691, 1, 1, 1, 1, 1,
-0.05905293, 2.920452, -0.4348426, 1, 1, 1, 1, 1,
-0.05892317, -0.4984787, -3.096679, 1, 1, 1, 1, 1,
-0.05860382, 1.26488, -1.435625, 1, 1, 1, 1, 1,
-0.05743289, 0.0410772, 0.4326508, 1, 1, 1, 1, 1,
-0.0568145, 0.2511642, 0.8143269, 1, 1, 1, 1, 1,
-0.05536349, 1.097881, -2.592016, 1, 1, 1, 1, 1,
-0.05412981, -1.912197, -1.656491, 1, 1, 1, 1, 1,
-0.05184244, -0.5426419, -1.307405, 1, 1, 1, 1, 1,
-0.04638759, 0.8019307, -0.7218688, 1, 1, 1, 1, 1,
-0.04637417, 0.1005195, -1.053369, 0, 0, 1, 1, 1,
-0.04528182, 0.9986936, 0.0805122, 1, 0, 0, 1, 1,
-0.0449495, 0.8093252, 0.3544508, 1, 0, 0, 1, 1,
-0.04403559, 1.688296, 0.3283814, 1, 0, 0, 1, 1,
-0.04153247, 0.8784842, -0.5108391, 1, 0, 0, 1, 1,
-0.0414216, -0.3643641, -4.824198, 1, 0, 0, 1, 1,
-0.0381365, -0.008625979, -2.407605, 0, 0, 0, 1, 1,
-0.03736616, -0.9786052, -4.221305, 0, 0, 0, 1, 1,
-0.03686469, 0.9061607, -0.2826212, 0, 0, 0, 1, 1,
-0.03302455, -0.2283528, -2.42331, 0, 0, 0, 1, 1,
-0.03096089, -1.741069, -3.216953, 0, 0, 0, 1, 1,
-0.02930984, -0.6715533, -3.260834, 0, 0, 0, 1, 1,
-0.02080277, -0.1461978, -2.65944, 0, 0, 0, 1, 1,
-0.01710355, 1.130738, 0.7133715, 1, 1, 1, 1, 1,
-0.01670867, 0.3754361, -0.7954868, 1, 1, 1, 1, 1,
-0.01505885, -0.8925335, -2.096688, 1, 1, 1, 1, 1,
-0.0141514, 1.517315, -0.07045065, 1, 1, 1, 1, 1,
-0.0137925, 0.6401283, 0.9536896, 1, 1, 1, 1, 1,
-0.01330729, 1.949721, 0.04572184, 1, 1, 1, 1, 1,
-0.01218446, -0.8320321, -2.113508, 1, 1, 1, 1, 1,
-0.01080558, -0.7298219, -2.696787, 1, 1, 1, 1, 1,
-0.004436943, 0.6857737, 1.039709, 1, 1, 1, 1, 1,
-0.002429748, 0.3929083, 0.3380611, 1, 1, 1, 1, 1,
0.001640715, -0.7767001, 0.7788653, 1, 1, 1, 1, 1,
0.005238574, -0.4697435, 4.87427, 1, 1, 1, 1, 1,
0.00709064, -0.384003, 2.169561, 1, 1, 1, 1, 1,
0.01109388, -1.29729, 3.920172, 1, 1, 1, 1, 1,
0.01111291, -1.137851, 2.967778, 1, 1, 1, 1, 1,
0.01549613, 1.121254, -0.04798556, 0, 0, 1, 1, 1,
0.01575275, -0.5978547, 3.96925, 1, 0, 0, 1, 1,
0.02798988, -1.138476, 2.889124, 1, 0, 0, 1, 1,
0.02810712, 0.4291075, 0.2610403, 1, 0, 0, 1, 1,
0.0301448, 0.2690985, 0.2786127, 1, 0, 0, 1, 1,
0.03147623, 1.521363, -0.7306716, 1, 0, 0, 1, 1,
0.03316801, 0.223625, 0.1063853, 0, 0, 0, 1, 1,
0.03349455, 0.1112905, 0.0181174, 0, 0, 0, 1, 1,
0.03425531, -1.549418, 4.076656, 0, 0, 0, 1, 1,
0.03456077, -0.6651157, 1.71507, 0, 0, 0, 1, 1,
0.0381054, 0.1432589, 1.128074, 0, 0, 0, 1, 1,
0.04032531, 1.304821, 1.531824, 0, 0, 0, 1, 1,
0.04499101, 0.05270538, 0.2406027, 0, 0, 0, 1, 1,
0.04622243, -0.2173175, 4.004747, 1, 1, 1, 1, 1,
0.04653849, 0.1381051, 0.4383515, 1, 1, 1, 1, 1,
0.04690009, 0.2675556, 0.4268584, 1, 1, 1, 1, 1,
0.05064826, 0.2915263, 0.9121963, 1, 1, 1, 1, 1,
0.05120318, 2.073403, 1.028874, 1, 1, 1, 1, 1,
0.05144756, 0.005385788, 2.591353, 1, 1, 1, 1, 1,
0.0528977, -0.3657546, 2.959774, 1, 1, 1, 1, 1,
0.05632954, -0.02942136, 1.920356, 1, 1, 1, 1, 1,
0.05919481, 1.251316, 0.5085574, 1, 1, 1, 1, 1,
0.06182459, -1.735766, 4.007819, 1, 1, 1, 1, 1,
0.06858675, -2.081749, 2.89802, 1, 1, 1, 1, 1,
0.06901256, 0.7577984, -0.02579095, 1, 1, 1, 1, 1,
0.07109097, 1.691956, -0.8701612, 1, 1, 1, 1, 1,
0.07355723, 0.2681644, 1.359064, 1, 1, 1, 1, 1,
0.07385862, 0.1768461, -0.07257318, 1, 1, 1, 1, 1,
0.07705873, -0.3216607, 3.570026, 0, 0, 1, 1, 1,
0.08059004, -1.034549, 3.344697, 1, 0, 0, 1, 1,
0.08820939, -0.436636, 2.188402, 1, 0, 0, 1, 1,
0.08925694, -0.6609486, 2.856053, 1, 0, 0, 1, 1,
0.0913952, -0.9891836, 2.374039, 1, 0, 0, 1, 1,
0.09615697, -2.589037, 2.252578, 1, 0, 0, 1, 1,
0.09640855, 1.388753, 0.2332805, 0, 0, 0, 1, 1,
0.09665691, -0.7433887, 3.730755, 0, 0, 0, 1, 1,
0.09790926, -0.171279, 2.336954, 0, 0, 0, 1, 1,
0.1048297, 0.1249658, 0.9840897, 0, 0, 0, 1, 1,
0.1073579, -0.1078664, 2.156676, 0, 0, 0, 1, 1,
0.1083258, 0.7565605, 0.7798294, 0, 0, 0, 1, 1,
0.109241, 0.8888782, -1.537968, 0, 0, 0, 1, 1,
0.1097587, 0.02155539, 0.1943125, 1, 1, 1, 1, 1,
0.1117469, 0.02269229, 0.995369, 1, 1, 1, 1, 1,
0.1212283, 0.1532329, 0.7068062, 1, 1, 1, 1, 1,
0.1244688, -1.557897, 2.909003, 1, 1, 1, 1, 1,
0.1398481, -0.2930137, 3.546656, 1, 1, 1, 1, 1,
0.1429507, -0.06208443, 2.711876, 1, 1, 1, 1, 1,
0.1453502, 0.9121169, 0.07902598, 1, 1, 1, 1, 1,
0.1521512, -0.1540135, 0.2655918, 1, 1, 1, 1, 1,
0.1564199, 1.201753, 0.2400739, 1, 1, 1, 1, 1,
0.1588865, -0.7298016, 2.612538, 1, 1, 1, 1, 1,
0.1592148, 0.4659473, 0.2269197, 1, 1, 1, 1, 1,
0.1601904, 0.03679774, 0.5173982, 1, 1, 1, 1, 1,
0.1640808, -1.012951, 5.478511, 1, 1, 1, 1, 1,
0.1689353, 0.5496197, 0.3388982, 1, 1, 1, 1, 1,
0.1720179, -1.472274, 2.959272, 1, 1, 1, 1, 1,
0.1729164, 2.18098, -0.3126671, 0, 0, 1, 1, 1,
0.1729639, -0.213031, 4.44272, 1, 0, 0, 1, 1,
0.1748122, -0.4899286, 3.012613, 1, 0, 0, 1, 1,
0.1756585, -0.3656161, 5.312029, 1, 0, 0, 1, 1,
0.1764518, 0.1938247, -1.306344, 1, 0, 0, 1, 1,
0.1775587, 1.310517, -0.8309597, 1, 0, 0, 1, 1,
0.1788358, 1.781132, 1.520749, 0, 0, 0, 1, 1,
0.181362, 0.4490595, -0.00495905, 0, 0, 0, 1, 1,
0.1823057, 0.08671067, 0.7663851, 0, 0, 0, 1, 1,
0.1848833, 0.4786647, -0.487509, 0, 0, 0, 1, 1,
0.1873766, 1.123425, 0.2582852, 0, 0, 0, 1, 1,
0.1931958, -0.1018109, 2.684878, 0, 0, 0, 1, 1,
0.1939413, 1.069789, 1.695432, 0, 0, 0, 1, 1,
0.1943223, 0.4524049, 0.5392247, 1, 1, 1, 1, 1,
0.1962275, -0.4652031, 4.044984, 1, 1, 1, 1, 1,
0.1969554, -0.1415021, 4.521255, 1, 1, 1, 1, 1,
0.2053755, 1.167931, 0.4962791, 1, 1, 1, 1, 1,
0.206593, -1.040662, 4.991108, 1, 1, 1, 1, 1,
0.2069964, 0.9639534, 1.172212, 1, 1, 1, 1, 1,
0.2070121, 0.4845857, 0.1806264, 1, 1, 1, 1, 1,
0.217474, -0.1224139, 2.485216, 1, 1, 1, 1, 1,
0.2221148, -0.1870125, 1.298785, 1, 1, 1, 1, 1,
0.228414, -0.7553883, 2.183374, 1, 1, 1, 1, 1,
0.2321686, 1.17137, 0.5318661, 1, 1, 1, 1, 1,
0.2339355, -0.5294484, 2.847653, 1, 1, 1, 1, 1,
0.235183, 0.4545729, 0.8108542, 1, 1, 1, 1, 1,
0.2363801, -0.9148002, 2.905182, 1, 1, 1, 1, 1,
0.2383435, -0.4461324, 1.827384, 1, 1, 1, 1, 1,
0.2392202, 0.9670398, -0.4045101, 0, 0, 1, 1, 1,
0.2449656, -0.8827206, 1.181047, 1, 0, 0, 1, 1,
0.2482015, 2.237472, 0.6721956, 1, 0, 0, 1, 1,
0.2507424, 1.551324, -0.4423515, 1, 0, 0, 1, 1,
0.2522793, 0.06155282, -0.2462319, 1, 0, 0, 1, 1,
0.252304, 0.6859567, -0.3345898, 1, 0, 0, 1, 1,
0.2533373, -1.648841, 1.357376, 0, 0, 0, 1, 1,
0.255481, -0.8141158, 3.249707, 0, 0, 0, 1, 1,
0.2563127, 0.5479266, 0.9509451, 0, 0, 0, 1, 1,
0.2565543, 0.2816633, 1.927964, 0, 0, 0, 1, 1,
0.2565781, 0.733968, 0.6385098, 0, 0, 0, 1, 1,
0.2567843, -0.9744621, 2.464011, 0, 0, 0, 1, 1,
0.2581946, -0.8114318, 4.189294, 0, 0, 0, 1, 1,
0.2616146, -0.3823747, 3.820649, 1, 1, 1, 1, 1,
0.2656312, -0.01618247, 1.696987, 1, 1, 1, 1, 1,
0.2691128, -2.182297, 2.977941, 1, 1, 1, 1, 1,
0.269339, -1.057205, 0.9892083, 1, 1, 1, 1, 1,
0.2701754, 0.3561446, 0.5756426, 1, 1, 1, 1, 1,
0.2718267, -0.6013142, 2.134466, 1, 1, 1, 1, 1,
0.2726327, 0.3341792, 1.257756, 1, 1, 1, 1, 1,
0.2728123, 0.716735, 0.7571499, 1, 1, 1, 1, 1,
0.2746135, -1.60024, 4.07289, 1, 1, 1, 1, 1,
0.2750679, -1.102546, 3.160853, 1, 1, 1, 1, 1,
0.2782018, -0.02243896, 2.966549, 1, 1, 1, 1, 1,
0.2820673, -0.3719413, 4.417931, 1, 1, 1, 1, 1,
0.2870355, 0.5746948, -0.9636457, 1, 1, 1, 1, 1,
0.2873339, -1.21242, 2.634547, 1, 1, 1, 1, 1,
0.2879926, 1.612327, -0.9378005, 1, 1, 1, 1, 1,
0.2880469, 0.2489521, -0.05503216, 0, 0, 1, 1, 1,
0.2884909, 1.117331, 0.4497607, 1, 0, 0, 1, 1,
0.2926768, -1.927975, 4.126381, 1, 0, 0, 1, 1,
0.2929628, 1.19347, 0.02989385, 1, 0, 0, 1, 1,
0.3046797, 1.862696, -0.8108052, 1, 0, 0, 1, 1,
0.3168806, 0.7159458, -0.5232899, 1, 0, 0, 1, 1,
0.3192811, -0.9958655, 3.565908, 0, 0, 0, 1, 1,
0.3231854, -1.037074, 5.154678, 0, 0, 0, 1, 1,
0.3259854, -0.9893417, 3.349441, 0, 0, 0, 1, 1,
0.3268736, -2.032604, 3.588155, 0, 0, 0, 1, 1,
0.3288547, -0.1293766, 0.9296783, 0, 0, 0, 1, 1,
0.3313324, 0.2835645, 1.375562, 0, 0, 0, 1, 1,
0.3328228, 0.7373824, 0.1946942, 0, 0, 0, 1, 1,
0.3363399, -0.471132, 2.987483, 1, 1, 1, 1, 1,
0.3380415, -1.191002, 2.802688, 1, 1, 1, 1, 1,
0.3404061, 0.4204381, -0.8546125, 1, 1, 1, 1, 1,
0.3419544, -1.826321, 3.907363, 1, 1, 1, 1, 1,
0.3429793, -0.3332887, 1.509874, 1, 1, 1, 1, 1,
0.3455961, 0.3302405, 2.579772, 1, 1, 1, 1, 1,
0.3462023, -2.549284, 3.083783, 1, 1, 1, 1, 1,
0.3496499, -0.8533859, 2.314449, 1, 1, 1, 1, 1,
0.3497387, 0.6188276, 0.920198, 1, 1, 1, 1, 1,
0.3498996, 0.09190995, 2.588685, 1, 1, 1, 1, 1,
0.3506594, -0.6022673, 4.527358, 1, 1, 1, 1, 1,
0.3513304, 0.3277875, -1.651664, 1, 1, 1, 1, 1,
0.3558732, -0.8779544, 4.634414, 1, 1, 1, 1, 1,
0.3577584, -0.8255169, 2.477425, 1, 1, 1, 1, 1,
0.359846, 0.3461906, 0.9316761, 1, 1, 1, 1, 1,
0.3604856, 0.3446328, 3.71743, 0, 0, 1, 1, 1,
0.3637426, -0.5843874, 1.135759, 1, 0, 0, 1, 1,
0.3664072, 0.8136035, -0.08459827, 1, 0, 0, 1, 1,
0.3671871, -1.099683, 2.548653, 1, 0, 0, 1, 1,
0.3721914, -1.311664, 3.082112, 1, 0, 0, 1, 1,
0.3751968, 1.05623, 1.034174, 1, 0, 0, 1, 1,
0.3753059, 0.8069907, -0.5234143, 0, 0, 0, 1, 1,
0.3766221, -1.037733, 4.198194, 0, 0, 0, 1, 1,
0.3783621, 0.3409503, -0.4261913, 0, 0, 0, 1, 1,
0.3828738, -1.053066, 0.7249258, 0, 0, 0, 1, 1,
0.3829233, 1.171753, 1.291869, 0, 0, 0, 1, 1,
0.3955314, 0.6719592, 0.01849133, 0, 0, 0, 1, 1,
0.4027072, 0.3684009, 1.456462, 0, 0, 0, 1, 1,
0.4037869, -0.2483725, 0.4510873, 1, 1, 1, 1, 1,
0.4088771, 0.3986443, -0.7677209, 1, 1, 1, 1, 1,
0.4165866, 0.3704822, -0.214799, 1, 1, 1, 1, 1,
0.418857, -1.182219, 2.001201, 1, 1, 1, 1, 1,
0.420864, 1.436824, -0.4131462, 1, 1, 1, 1, 1,
0.4215786, -0.6301637, 4.449399, 1, 1, 1, 1, 1,
0.4230037, 0.7666114, 0.432353, 1, 1, 1, 1, 1,
0.4269763, -1.177151, 3.255071, 1, 1, 1, 1, 1,
0.4294778, 0.225737, 0.06169308, 1, 1, 1, 1, 1,
0.4304677, 0.0423401, 0.7664276, 1, 1, 1, 1, 1,
0.4349243, 0.713622, 0.2509589, 1, 1, 1, 1, 1,
0.4398908, -0.131251, 1.711601, 1, 1, 1, 1, 1,
0.4413925, -0.3474533, 2.990191, 1, 1, 1, 1, 1,
0.4501067, -0.4801619, 1.366172, 1, 1, 1, 1, 1,
0.4528071, 1.098349, 0.6360437, 1, 1, 1, 1, 1,
0.4531558, 1.158572, 1.511314, 0, 0, 1, 1, 1,
0.4572273, 1.399457, -0.2205608, 1, 0, 0, 1, 1,
0.4577156, 1.090222, 1.007233, 1, 0, 0, 1, 1,
0.4591234, 0.07567431, 0.7986732, 1, 0, 0, 1, 1,
0.4598445, 0.1163359, -0.545562, 1, 0, 0, 1, 1,
0.4614806, 0.04765079, 1.318673, 1, 0, 0, 1, 1,
0.4625375, 0.1611361, 2.272737, 0, 0, 0, 1, 1,
0.466693, -1.05412, 1.240243, 0, 0, 0, 1, 1,
0.4704459, -0.4751441, 2.513995, 0, 0, 0, 1, 1,
0.4734831, 0.08502962, 2.253333, 0, 0, 0, 1, 1,
0.4810291, 0.8491459, -0.3455658, 0, 0, 0, 1, 1,
0.4815418, -0.6404529, 4.000008, 0, 0, 0, 1, 1,
0.4843059, 2.160145, -2.508447, 0, 0, 0, 1, 1,
0.4854925, 0.204768, -0.3794598, 1, 1, 1, 1, 1,
0.4871537, -0.1609563, 2.042929, 1, 1, 1, 1, 1,
0.4896836, 0.08952963, 1.301263, 1, 1, 1, 1, 1,
0.4929914, 0.2088334, 0.7720814, 1, 1, 1, 1, 1,
0.4952347, -0.5415246, 1.152136, 1, 1, 1, 1, 1,
0.4964833, 0.04333316, 0.7691584, 1, 1, 1, 1, 1,
0.4987835, -0.6653951, 3.141159, 1, 1, 1, 1, 1,
0.4997273, -0.09351937, 1.914391, 1, 1, 1, 1, 1,
0.5001947, 0.8848965, 1.399971, 1, 1, 1, 1, 1,
0.5002385, 1.340138, 1.471072, 1, 1, 1, 1, 1,
0.5016872, -0.2102985, 1.078473, 1, 1, 1, 1, 1,
0.5070077, 0.5449839, 1.650851, 1, 1, 1, 1, 1,
0.5112698, 0.02284825, 1.298155, 1, 1, 1, 1, 1,
0.5163924, -1.6458, 5.186368, 1, 1, 1, 1, 1,
0.524984, -1.000065, 0.7460685, 1, 1, 1, 1, 1,
0.5279877, -0.1578584, 3.272142, 0, 0, 1, 1, 1,
0.5323009, -0.8168135, 3.337485, 1, 0, 0, 1, 1,
0.5398323, -0.5413247, 1.972873, 1, 0, 0, 1, 1,
0.5456647, 0.3718957, 0.6623957, 1, 0, 0, 1, 1,
0.5530015, -0.6538282, 1.721104, 1, 0, 0, 1, 1,
0.5535769, 0.6875065, -1.23702, 1, 0, 0, 1, 1,
0.5571542, -1.018929, 4.002755, 0, 0, 0, 1, 1,
0.5596164, -0.2374494, 1.182047, 0, 0, 0, 1, 1,
0.5702842, 0.9366444, 0.7917253, 0, 0, 0, 1, 1,
0.5704471, -2.380113, 3.498026, 0, 0, 0, 1, 1,
0.5731054, 0.8793688, 1.214431, 0, 0, 0, 1, 1,
0.5756592, -0.7884025, 3.844453, 0, 0, 0, 1, 1,
0.5798096, 0.2680576, 0.2055425, 0, 0, 0, 1, 1,
0.5832332, 0.8417382, 0.6230327, 1, 1, 1, 1, 1,
0.5838612, -0.02959894, -0.1867594, 1, 1, 1, 1, 1,
0.5873201, 0.1320617, 2.36047, 1, 1, 1, 1, 1,
0.5899735, 0.1420075, 0.9875511, 1, 1, 1, 1, 1,
0.5909732, -0.5106001, 1.38703, 1, 1, 1, 1, 1,
0.5925282, -0.9024997, 2.797732, 1, 1, 1, 1, 1,
0.5943468, 3.150665, 0.426029, 1, 1, 1, 1, 1,
0.5958263, 0.5723593, -0.2595151, 1, 1, 1, 1, 1,
0.5997947, -1.070235, 3.323782, 1, 1, 1, 1, 1,
0.6105762, 1.568206, 0.5727763, 1, 1, 1, 1, 1,
0.6117279, -0.1347087, 2.539862, 1, 1, 1, 1, 1,
0.6121387, -0.4010965, 3.355949, 1, 1, 1, 1, 1,
0.6135343, -1.565013, 3.342541, 1, 1, 1, 1, 1,
0.6248611, 0.9931669, 0.1959785, 1, 1, 1, 1, 1,
0.6256723, -1.41976, 2.853641, 1, 1, 1, 1, 1,
0.6303948, -1.545116, 2.99902, 0, 0, 1, 1, 1,
0.6370751, 2.193979, -0.07782294, 1, 0, 0, 1, 1,
0.6378576, 0.07703086, 1.773775, 1, 0, 0, 1, 1,
0.6383252, -1.805998, 3.073578, 1, 0, 0, 1, 1,
0.6414578, -0.9129987, 1.715909, 1, 0, 0, 1, 1,
0.6426585, -0.2596726, 1.422976, 1, 0, 0, 1, 1,
0.6486277, -2.427533, 1.633492, 0, 0, 0, 1, 1,
0.6510997, 0.05738924, 2.541665, 0, 0, 0, 1, 1,
0.651262, -0.7094402, 1.203803, 0, 0, 0, 1, 1,
0.6523032, 0.322037, 0.3354373, 0, 0, 0, 1, 1,
0.6524402, -0.03464064, 1.212144, 0, 0, 0, 1, 1,
0.6576306, -1.880912, 2.566796, 0, 0, 0, 1, 1,
0.6582082, 0.172745, 0.6940036, 0, 0, 0, 1, 1,
0.6631163, 0.1199484, 2.512936, 1, 1, 1, 1, 1,
0.66388, -0.9102967, 1.719014, 1, 1, 1, 1, 1,
0.6643326, 1.075063, 0.4285446, 1, 1, 1, 1, 1,
0.6658166, 0.01205199, 2.586921, 1, 1, 1, 1, 1,
0.6664036, 1.075901, 0.5078987, 1, 1, 1, 1, 1,
0.6666561, 0.9406509, 2.25543, 1, 1, 1, 1, 1,
0.6684515, 2.35257, -0.6489875, 1, 1, 1, 1, 1,
0.6696797, -0.7200706, 1.972246, 1, 1, 1, 1, 1,
0.6770292, 2.792119, -0.1308953, 1, 1, 1, 1, 1,
0.6776918, -0.3155558, 2.302161, 1, 1, 1, 1, 1,
0.678623, 2.539041, 1.562951, 1, 1, 1, 1, 1,
0.6857589, -0.3789605, 1.943677, 1, 1, 1, 1, 1,
0.6898518, 0.5281329, 2.071519, 1, 1, 1, 1, 1,
0.6907728, 1.440059, -0.04378222, 1, 1, 1, 1, 1,
0.6920514, -0.5432723, 0.9846236, 1, 1, 1, 1, 1,
0.694101, -1.00139, 3.215165, 0, 0, 1, 1, 1,
0.6958206, -0.4890216, 2.794223, 1, 0, 0, 1, 1,
0.6971366, -0.4954243, 2.991711, 1, 0, 0, 1, 1,
0.7016513, 1.396853, 0.145804, 1, 0, 0, 1, 1,
0.7016638, -0.08536501, 1.196143, 1, 0, 0, 1, 1,
0.7031928, 0.1817223, 0.6932667, 1, 0, 0, 1, 1,
0.7053748, 0.7570171, 0.7405357, 0, 0, 0, 1, 1,
0.7081692, 0.1090299, -0.008385534, 0, 0, 0, 1, 1,
0.7154593, 0.05936519, 0.6824831, 0, 0, 0, 1, 1,
0.7170383, 0.6927369, 0.1462278, 0, 0, 0, 1, 1,
0.7222769, -1.208938, 1.647635, 0, 0, 0, 1, 1,
0.7265671, 0.5796431, 2.384043, 0, 0, 0, 1, 1,
0.7274748, 0.8001367, 0.2573602, 0, 0, 0, 1, 1,
0.7355234, 0.06577498, 0.2264956, 1, 1, 1, 1, 1,
0.7386789, -1.116321, 3.00245, 1, 1, 1, 1, 1,
0.7437694, -0.6429641, 0.533415, 1, 1, 1, 1, 1,
0.7442892, -0.05634891, 1.174341, 1, 1, 1, 1, 1,
0.7586278, 0.5477465, 0.04936041, 1, 1, 1, 1, 1,
0.758875, 0.360326, -0.003405905, 1, 1, 1, 1, 1,
0.7666701, 0.06963159, 1.058011, 1, 1, 1, 1, 1,
0.7771434, -0.2229978, 2.323759, 1, 1, 1, 1, 1,
0.7772797, 1.813655, -1.03489, 1, 1, 1, 1, 1,
0.7774054, -2.613873, 1.490985, 1, 1, 1, 1, 1,
0.7817687, 0.2486529, 2.571829, 1, 1, 1, 1, 1,
0.78255, -0.2297701, 3.598679, 1, 1, 1, 1, 1,
0.7826229, -0.4851459, 2.957964, 1, 1, 1, 1, 1,
0.7843566, 0.7813963, 0.8826374, 1, 1, 1, 1, 1,
0.7862265, -0.6863366, 2.060879, 1, 1, 1, 1, 1,
0.7926371, 1.410831, 1.115021, 0, 0, 1, 1, 1,
0.7928841, 1.763152, 0.5384231, 1, 0, 0, 1, 1,
0.7942618, -0.6702579, 0.7031636, 1, 0, 0, 1, 1,
0.7983319, -0.06416656, 1.399912, 1, 0, 0, 1, 1,
0.8009273, -0.8351883, 2.220858, 1, 0, 0, 1, 1,
0.8018211, -0.7542814, 3.969838, 1, 0, 0, 1, 1,
0.8061546, -0.2568054, 1.586657, 0, 0, 0, 1, 1,
0.8124346, -1.043402, 0.9490499, 0, 0, 0, 1, 1,
0.8159613, 0.8784152, 0.4447371, 0, 0, 0, 1, 1,
0.8235648, 2.044284, -0.3132952, 0, 0, 0, 1, 1,
0.825958, 0.9033703, 1.636545, 0, 0, 0, 1, 1,
0.8301969, -1.577475, 1.900606, 0, 0, 0, 1, 1,
0.8317605, 2.013477, -0.8770345, 0, 0, 0, 1, 1,
0.8430099, 0.655311, 1.30309, 1, 1, 1, 1, 1,
0.8490449, 0.8105501, 2.043863, 1, 1, 1, 1, 1,
0.850414, -0.9856594, 2.27555, 1, 1, 1, 1, 1,
0.8558549, 1.428093, 0.579546, 1, 1, 1, 1, 1,
0.8580556, 0.2028994, 0.6807956, 1, 1, 1, 1, 1,
0.858134, 1.639199, 0.9535887, 1, 1, 1, 1, 1,
0.8623064, -0.9637007, 3.442533, 1, 1, 1, 1, 1,
0.8641672, 1.487054, 2.489462, 1, 1, 1, 1, 1,
0.8659363, -1.324247, 2.100847, 1, 1, 1, 1, 1,
0.8695648, 0.9334578, 0.8821764, 1, 1, 1, 1, 1,
0.8734253, 0.5894016, 1.503088, 1, 1, 1, 1, 1,
0.877273, 0.5400209, 0.2158604, 1, 1, 1, 1, 1,
0.8804806, 1.133531, 1.839541, 1, 1, 1, 1, 1,
0.8935481, 0.4959421, 0.5903786, 1, 1, 1, 1, 1,
0.9048692, 0.8679073, 0.6229132, 1, 1, 1, 1, 1,
0.9081907, 0.312183, 2.231268, 0, 0, 1, 1, 1,
0.9132914, 0.9923459, 0.7822582, 1, 0, 0, 1, 1,
0.9171609, -2.151001, 2.131702, 1, 0, 0, 1, 1,
0.9190738, 2.505904, 2.086479, 1, 0, 0, 1, 1,
0.9222654, -0.4709471, 2.193892, 1, 0, 0, 1, 1,
0.9224018, -0.6420189, 1.464585, 1, 0, 0, 1, 1,
0.9324201, 0.277738, 2.171001, 0, 0, 0, 1, 1,
0.9332809, 1.432902, 1.245621, 0, 0, 0, 1, 1,
0.9363088, -0.4824934, 1.684304, 0, 0, 0, 1, 1,
0.9408687, 0.9942777, 2.186254, 0, 0, 0, 1, 1,
0.9482937, -0.6151623, 2.826912, 0, 0, 0, 1, 1,
0.9496618, 0.6356422, 2.366606, 0, 0, 0, 1, 1,
0.9508734, 0.962896, 0.6611012, 0, 0, 0, 1, 1,
0.9540691, -0.2719588, 0.7932142, 1, 1, 1, 1, 1,
0.9590349, 0.5556653, 1.774919, 1, 1, 1, 1, 1,
0.9615719, 0.3551074, 2.325014, 1, 1, 1, 1, 1,
0.9718388, -0.5427809, 1.367924, 1, 1, 1, 1, 1,
0.9752636, 1.298943, -0.5649412, 1, 1, 1, 1, 1,
0.9806672, -0.8424674, 3.529235, 1, 1, 1, 1, 1,
0.9912691, 1.898199, 0.1299952, 1, 1, 1, 1, 1,
0.9923432, 1.396146, 0.8519386, 1, 1, 1, 1, 1,
0.9951067, -0.9129636, 1.287026, 1, 1, 1, 1, 1,
0.9962052, -1.000706, 0.0308465, 1, 1, 1, 1, 1,
0.9970467, -0.9835873, 3.050483, 1, 1, 1, 1, 1,
0.9984353, 1.180813, 0.6655139, 1, 1, 1, 1, 1,
1.001158, -1.31559, 1.19899, 1, 1, 1, 1, 1,
1.003121, 0.5453585, 0.8683583, 1, 1, 1, 1, 1,
1.005009, 0.1369185, 0.5450136, 1, 1, 1, 1, 1,
1.013381, -0.7599069, 2.306253, 0, 0, 1, 1, 1,
1.013501, 0.7979235, 2.706267, 1, 0, 0, 1, 1,
1.020584, 0.784349, -0.1871397, 1, 0, 0, 1, 1,
1.025541, -1.733281, 4.065944, 1, 0, 0, 1, 1,
1.030779, -1.909855, 1.748374, 1, 0, 0, 1, 1,
1.03156, 0.04701567, 3.235499, 1, 0, 0, 1, 1,
1.035725, 1.369129, 1.299796, 0, 0, 0, 1, 1,
1.039506, 0.9299896, 2.095834, 0, 0, 0, 1, 1,
1.043425, 0.003368621, 1.757115, 0, 0, 0, 1, 1,
1.04735, -0.2070199, 0.2332976, 0, 0, 0, 1, 1,
1.04898, -1.731397, 3.853661, 0, 0, 0, 1, 1,
1.050248, 0.457655, 0.8031538, 0, 0, 0, 1, 1,
1.059832, -0.335879, 2.043002, 0, 0, 0, 1, 1,
1.062744, 2.108966, -1.090965, 1, 1, 1, 1, 1,
1.063925, 1.47213, 0.4631086, 1, 1, 1, 1, 1,
1.068736, -0.7024558, 2.227073, 1, 1, 1, 1, 1,
1.076675, 0.6397677, 1.232901, 1, 1, 1, 1, 1,
1.079221, 0.3256409, 0.8663612, 1, 1, 1, 1, 1,
1.085604, -0.6126365, 0.4817659, 1, 1, 1, 1, 1,
1.087338, 0.2641191, 2.626715, 1, 1, 1, 1, 1,
1.090491, 1.664988, 1.877602, 1, 1, 1, 1, 1,
1.093573, 0.8773327, 2.058977, 1, 1, 1, 1, 1,
1.094605, -0.2515521, 1.443463, 1, 1, 1, 1, 1,
1.098403, 0.3788109, 1.155796, 1, 1, 1, 1, 1,
1.102458, 1.434759, 1.449624, 1, 1, 1, 1, 1,
1.107027, 0.7959097, -0.09635838, 1, 1, 1, 1, 1,
1.110564, 0.4661619, 0.607489, 1, 1, 1, 1, 1,
1.116259, -0.7040346, 1.499139, 1, 1, 1, 1, 1,
1.119804, -0.01673584, 2.705899, 0, 0, 1, 1, 1,
1.121963, 0.6174684, 0.7419182, 1, 0, 0, 1, 1,
1.122786, 0.8944173, 0.3925669, 1, 0, 0, 1, 1,
1.124351, 0.8431181, 0.3799336, 1, 0, 0, 1, 1,
1.128051, 0.6819802, -0.7562649, 1, 0, 0, 1, 1,
1.130559, -0.8162917, 1.342259, 1, 0, 0, 1, 1,
1.136938, 0.745602, 0.4436534, 0, 0, 0, 1, 1,
1.142809, -1.61886, 2.082312, 0, 0, 0, 1, 1,
1.143953, 0.161757, -0.8637615, 0, 0, 0, 1, 1,
1.163392, 1.473478, 1.345523, 0, 0, 0, 1, 1,
1.174675, -0.337046, 0.1116622, 0, 0, 0, 1, 1,
1.180906, -0.3740008, 1.939276, 0, 0, 0, 1, 1,
1.190296, 0.2169378, 2.629495, 0, 0, 0, 1, 1,
1.197972, 0.07828725, 3.181, 1, 1, 1, 1, 1,
1.207067, -0.7949001, 0.4654092, 1, 1, 1, 1, 1,
1.21414, 1.123437, 0.224935, 1, 1, 1, 1, 1,
1.216065, -0.6117179, 2.023917, 1, 1, 1, 1, 1,
1.219501, 1.208855, 0.637984, 1, 1, 1, 1, 1,
1.224561, 0.9925098, 2.322259, 1, 1, 1, 1, 1,
1.229779, -0.3132944, 2.548435, 1, 1, 1, 1, 1,
1.231482, -0.2757014, 1.918832, 1, 1, 1, 1, 1,
1.231553, 0.1608626, 1.474986, 1, 1, 1, 1, 1,
1.237463, -0.4220346, 3.191726, 1, 1, 1, 1, 1,
1.239577, -0.4720801, 2.012976, 1, 1, 1, 1, 1,
1.251333, -1.40874, 1.785801, 1, 1, 1, 1, 1,
1.258865, -0.7579175, 0.6878325, 1, 1, 1, 1, 1,
1.264651, 1.239733, 0.6707999, 1, 1, 1, 1, 1,
1.270847, -0.8946102, 2.008471, 1, 1, 1, 1, 1,
1.280287, 0.3658203, 3.217569, 0, 0, 1, 1, 1,
1.285625, 1.294387, 0.3316864, 1, 0, 0, 1, 1,
1.287748, 0.8999311, -0.04660275, 1, 0, 0, 1, 1,
1.292593, -1.527988, 2.664189, 1, 0, 0, 1, 1,
1.339387, 0.2316283, -0.2438731, 1, 0, 0, 1, 1,
1.339804, 1.327924, 0.4534617, 1, 0, 0, 1, 1,
1.344016, 0.01466169, 2.481356, 0, 0, 0, 1, 1,
1.355733, -0.05940284, 1.253974, 0, 0, 0, 1, 1,
1.356518, 0.569158, -1.103464, 0, 0, 0, 1, 1,
1.35686, -2.499622, 1.712957, 0, 0, 0, 1, 1,
1.359589, 0.1026548, 0.9657092, 0, 0, 0, 1, 1,
1.363994, -0.05941812, 1.679738, 0, 0, 0, 1, 1,
1.365611, -0.6237826, 2.700037, 0, 0, 0, 1, 1,
1.377725, 0.5951052, 0.08025803, 1, 1, 1, 1, 1,
1.378646, 0.9998729, 2.53948, 1, 1, 1, 1, 1,
1.386262, 1.072547, -0.04154137, 1, 1, 1, 1, 1,
1.389782, 0.9635283, 1.634208, 1, 1, 1, 1, 1,
1.391936, 0.4923202, 1.181755, 1, 1, 1, 1, 1,
1.401207, 1.769545, -1.308786, 1, 1, 1, 1, 1,
1.407802, -0.9080155, 1.609535, 1, 1, 1, 1, 1,
1.410743, -0.8918995, 0.6639504, 1, 1, 1, 1, 1,
1.415755, -0.6546808, 1.768879, 1, 1, 1, 1, 1,
1.423515, 1.530725, 2.038285, 1, 1, 1, 1, 1,
1.43131, -0.243405, 2.147326, 1, 1, 1, 1, 1,
1.442, -0.5382051, 2.996168, 1, 1, 1, 1, 1,
1.450977, 0.3845725, 1.79316, 1, 1, 1, 1, 1,
1.452014, -0.3884622, 2.289446, 1, 1, 1, 1, 1,
1.484273, -0.4601979, 1.25067, 1, 1, 1, 1, 1,
1.485822, 1.557397, 0.3964969, 0, 0, 1, 1, 1,
1.495741, 0.3488287, -0.6777479, 1, 0, 0, 1, 1,
1.49761, -0.7366243, 3.61871, 1, 0, 0, 1, 1,
1.498639, 0.1600016, 1.642028, 1, 0, 0, 1, 1,
1.50153, 1.692528, 0.5653229, 1, 0, 0, 1, 1,
1.508268, -0.6639786, 3.093794, 1, 0, 0, 1, 1,
1.511815, 0.5272627, 1.048872, 0, 0, 0, 1, 1,
1.515307, -0.5023301, 2.081618, 0, 0, 0, 1, 1,
1.520329, -0.719423, 1.766161, 0, 0, 0, 1, 1,
1.529053, -0.4552811, 2.146627, 0, 0, 0, 1, 1,
1.553573, 1.268972, -0.8430501, 0, 0, 0, 1, 1,
1.56361, 0.3480796, 1.099232, 0, 0, 0, 1, 1,
1.58524, -0.3669079, 0.9514256, 0, 0, 0, 1, 1,
1.602383, -1.465677, 2.186719, 1, 1, 1, 1, 1,
1.61883, -1.307076, 2.559527, 1, 1, 1, 1, 1,
1.619403, -1.245557, 3.523424, 1, 1, 1, 1, 1,
1.623844, -0.8642974, 1.902524, 1, 1, 1, 1, 1,
1.624206, 1.282341, 2.477181, 1, 1, 1, 1, 1,
1.63002, -0.06674298, 0.8760277, 1, 1, 1, 1, 1,
1.634392, -0.9311094, 3.837673, 1, 1, 1, 1, 1,
1.63447, 1.087814, 2.468652, 1, 1, 1, 1, 1,
1.641795, -1.173333, 1.839464, 1, 1, 1, 1, 1,
1.65262, 0.4048755, 0.5808036, 1, 1, 1, 1, 1,
1.653885, 1.395437, -0.4887015, 1, 1, 1, 1, 1,
1.665591, 1.6302, 0.2089557, 1, 1, 1, 1, 1,
1.66688, 0.6571481, 1.600027, 1, 1, 1, 1, 1,
1.688742, -0.9923198, 1.941117, 1, 1, 1, 1, 1,
1.692891, -1.598004, 2.238729, 1, 1, 1, 1, 1,
1.71568, 0.2326441, 1.545865, 0, 0, 1, 1, 1,
1.740535, -0.3515836, 2.372368, 1, 0, 0, 1, 1,
1.751345, -0.0295429, 1.899486, 1, 0, 0, 1, 1,
1.768016, 0.4174844, 0.5948672, 1, 0, 0, 1, 1,
1.768253, 0.1108674, 1.141459, 1, 0, 0, 1, 1,
1.776652, 1.665942, 0.5709775, 1, 0, 0, 1, 1,
1.778399, -0.5296901, 2.188023, 0, 0, 0, 1, 1,
1.796228, 0.9334261, -1.146881, 0, 0, 0, 1, 1,
1.809364, 0.6914689, 0.9535934, 0, 0, 0, 1, 1,
1.811689, -1.954379, 2.45245, 0, 0, 0, 1, 1,
1.83604, -0.5685171, 2.837293, 0, 0, 0, 1, 1,
1.848294, 1.211266, 0.1028708, 0, 0, 0, 1, 1,
1.864531, -1.015742, 0.762909, 0, 0, 0, 1, 1,
1.876076, -1.427938, 3.100539, 1, 1, 1, 1, 1,
1.87671, -1.735606, 2.799089, 1, 1, 1, 1, 1,
1.892777, -0.7423092, 2.054378, 1, 1, 1, 1, 1,
1.921212, 0.5051681, 0.2711094, 1, 1, 1, 1, 1,
1.924196, 1.651018, 1.639664, 1, 1, 1, 1, 1,
1.925053, 1.536201, 2.253527, 1, 1, 1, 1, 1,
1.937309, -1.144719, 2.497765, 1, 1, 1, 1, 1,
1.945397, 0.6391479, 1.98711, 1, 1, 1, 1, 1,
1.950664, -0.9407358, 1.64836, 1, 1, 1, 1, 1,
1.978195, -1.572193, 1.860745, 1, 1, 1, 1, 1,
1.99477, 0.2011883, 1.128547, 1, 1, 1, 1, 1,
1.995369, -0.8460537, 2.128603, 1, 1, 1, 1, 1,
2.013744, 2.343714, 2.312532, 1, 1, 1, 1, 1,
2.021495, 0.8495646, 0.6127145, 1, 1, 1, 1, 1,
2.036221, -0.5357999, 1.349822, 1, 1, 1, 1, 1,
2.074429, 0.948526, 1.183083, 0, 0, 1, 1, 1,
2.170406, 0.7195521, -1.004818, 1, 0, 0, 1, 1,
2.177133, -1.21393, 3.00678, 1, 0, 0, 1, 1,
2.181786, 0.4511729, 2.848453, 1, 0, 0, 1, 1,
2.206936, 0.6477458, 1.397233, 1, 0, 0, 1, 1,
2.207281, -1.529935, 3.431469, 1, 0, 0, 1, 1,
2.222138, 0.5509113, 2.40667, 0, 0, 0, 1, 1,
2.225238, 0.2257384, 0.9956324, 0, 0, 0, 1, 1,
2.254224, 0.6591949, 1.862174, 0, 0, 0, 1, 1,
2.260497, -0.5796457, 2.124716, 0, 0, 0, 1, 1,
2.289093, 0.9684783, 1.02391, 0, 0, 0, 1, 1,
2.307275, -0.07771001, 2.120134, 0, 0, 0, 1, 1,
2.403523, 0.709696, 2.674057, 0, 0, 0, 1, 1,
2.419151, -0.6710278, 2.032157, 1, 1, 1, 1, 1,
2.437291, 0.5169177, 1.031592, 1, 1, 1, 1, 1,
2.508596, -1.378539, 1.897478, 1, 1, 1, 1, 1,
2.516855, -1.506201, 3.002173, 1, 1, 1, 1, 1,
2.670039, 1.045083, 2.46452, 1, 1, 1, 1, 1,
2.959889, -1.131114, 1.938883, 1, 1, 1, 1, 1,
2.991307, 1.527737, 1.259534, 1, 1, 1, 1, 1
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
var radius = 9.680921;
var distance = 34.00382;
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
mvMatrix.translate( 0.04868364, -0.4030411, 0.1882505 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.00382);
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
