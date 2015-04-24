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
-3.043664, 1.235227, -1.538729, 1, 0, 0, 1,
-2.912411, -0.68998, -0.8634041, 1, 0.007843138, 0, 1,
-2.858146, -0.1837868, -3.071329, 1, 0.01176471, 0, 1,
-2.733322, 0.2313572, -1.35037, 1, 0.01960784, 0, 1,
-2.591876, 0.5544636, -0.7614194, 1, 0.02352941, 0, 1,
-2.567155, 0.8289993, -0.4438492, 1, 0.03137255, 0, 1,
-2.497568, -0.8518372, -1.02285, 1, 0.03529412, 0, 1,
-2.434972, -0.01400695, -2.946383, 1, 0.04313726, 0, 1,
-2.320255, -0.9982544, -2.076389, 1, 0.04705882, 0, 1,
-2.311675, 0.3148974, -2.04905, 1, 0.05490196, 0, 1,
-2.307361, -0.4817474, -1.270058, 1, 0.05882353, 0, 1,
-2.266425, 1.869188, -0.7599199, 1, 0.06666667, 0, 1,
-2.18658, -1.478525, -1.559335, 1, 0.07058824, 0, 1,
-2.176053, 0.3995304, -0.8056645, 1, 0.07843138, 0, 1,
-2.163342, 0.6437854, -1.810327, 1, 0.08235294, 0, 1,
-2.153535, -0.4596863, -3.756462, 1, 0.09019608, 0, 1,
-2.119733, 0.01707979, -0.6746365, 1, 0.09411765, 0, 1,
-2.103725, -0.7774298, -0.4721128, 1, 0.1019608, 0, 1,
-2.094536, -1.276293, -1.910681, 1, 0.1098039, 0, 1,
-2.05324, 0.4829097, -0.02851783, 1, 0.1137255, 0, 1,
-2.037139, -1.68853, 1.250913, 1, 0.1215686, 0, 1,
-2.01293, -0.1327425, -1.566075, 1, 0.1254902, 0, 1,
-2.001913, 0.8445669, 0.3623596, 1, 0.1333333, 0, 1,
-1.984879, -0.474317, -0.3620601, 1, 0.1372549, 0, 1,
-1.969825, -0.009328804, -1.390683, 1, 0.145098, 0, 1,
-1.967291, -0.9785984, -3.135502, 1, 0.1490196, 0, 1,
-1.953768, -0.5265912, -1.214171, 1, 0.1568628, 0, 1,
-1.939473, -0.03751741, -0.2890767, 1, 0.1607843, 0, 1,
-1.931241, 0.01273732, -1.870146, 1, 0.1686275, 0, 1,
-1.930331, 2.418802, 0.6254303, 1, 0.172549, 0, 1,
-1.923215, -0.8012756, -1.556711, 1, 0.1803922, 0, 1,
-1.914001, 0.1687318, -0.4938011, 1, 0.1843137, 0, 1,
-1.911786, -0.4264349, -1.085903, 1, 0.1921569, 0, 1,
-1.890929, -0.3190794, 0.2859083, 1, 0.1960784, 0, 1,
-1.887421, 0.3143556, -1.913298, 1, 0.2039216, 0, 1,
-1.875354, 0.7503992, -0.1122522, 1, 0.2117647, 0, 1,
-1.856162, -0.2661647, -0.66258, 1, 0.2156863, 0, 1,
-1.819551, 0.8132056, -1.685749, 1, 0.2235294, 0, 1,
-1.813913, 1.618463, -0.3286429, 1, 0.227451, 0, 1,
-1.780152, 0.3008066, -2.408337, 1, 0.2352941, 0, 1,
-1.773899, -0.1049902, -3.930461, 1, 0.2392157, 0, 1,
-1.737273, 1.244311, -1.518646, 1, 0.2470588, 0, 1,
-1.731717, -0.2257373, -3.03919, 1, 0.2509804, 0, 1,
-1.728459, 0.1494837, -2.388652, 1, 0.2588235, 0, 1,
-1.720658, 1.252921, -1.276091, 1, 0.2627451, 0, 1,
-1.696302, 0.4555839, -2.6743, 1, 0.2705882, 0, 1,
-1.69196, -0.06660943, -0.4041899, 1, 0.2745098, 0, 1,
-1.680742, -0.7546917, 0.05533619, 1, 0.282353, 0, 1,
-1.637885, 1.208503, -0.550642, 1, 0.2862745, 0, 1,
-1.624346, -1.475934, -2.879109, 1, 0.2941177, 0, 1,
-1.621946, -0.6659369, -1.3317, 1, 0.3019608, 0, 1,
-1.620613, -1.208959, -2.763531, 1, 0.3058824, 0, 1,
-1.605807, 0.4324561, -2.509301, 1, 0.3137255, 0, 1,
-1.605125, -0.9657496, -2.484276, 1, 0.3176471, 0, 1,
-1.604478, -1.270937, -1.632134, 1, 0.3254902, 0, 1,
-1.580866, 0.1341304, -0.996749, 1, 0.3294118, 0, 1,
-1.564445, -0.3554388, -1.938012, 1, 0.3372549, 0, 1,
-1.54287, 0.2496217, -1.755227, 1, 0.3411765, 0, 1,
-1.533463, -0.362862, -1.050603, 1, 0.3490196, 0, 1,
-1.522969, -1.390774, -2.236059, 1, 0.3529412, 0, 1,
-1.511718, -0.2915326, -2.484749, 1, 0.3607843, 0, 1,
-1.504476, -0.1183768, -0.285924, 1, 0.3647059, 0, 1,
-1.493729, -0.1127455, -0.5581748, 1, 0.372549, 0, 1,
-1.48738, 1.344593, -0.5885707, 1, 0.3764706, 0, 1,
-1.478408, -0.440405, -2.021566, 1, 0.3843137, 0, 1,
-1.451114, 2.143659, -0.2331012, 1, 0.3882353, 0, 1,
-1.449213, 0.5112804, -0.2263111, 1, 0.3960784, 0, 1,
-1.444633, -0.9959382, -2.489125, 1, 0.4039216, 0, 1,
-1.432743, -0.1323424, -3.525543, 1, 0.4078431, 0, 1,
-1.427951, -0.4072931, 0.9864857, 1, 0.4156863, 0, 1,
-1.421739, -0.385869, -2.462751, 1, 0.4196078, 0, 1,
-1.418099, 2.028106, 0.8030282, 1, 0.427451, 0, 1,
-1.390502, -1.972989, -2.56602, 1, 0.4313726, 0, 1,
-1.372691, 0.3363892, -2.279162, 1, 0.4392157, 0, 1,
-1.368705, -0.913603, -3.058727, 1, 0.4431373, 0, 1,
-1.367121, 0.2957767, -0.4972528, 1, 0.4509804, 0, 1,
-1.362654, 0.2581472, -1.69097, 1, 0.454902, 0, 1,
-1.36127, 0.4945126, -1.829372, 1, 0.4627451, 0, 1,
-1.360145, 1.627044, 0.8127329, 1, 0.4666667, 0, 1,
-1.357391, 0.2257827, -1.542499, 1, 0.4745098, 0, 1,
-1.351738, -1.915332, -2.496524, 1, 0.4784314, 0, 1,
-1.345795, -0.3076054, -3.119778, 1, 0.4862745, 0, 1,
-1.342378, -0.03575028, -1.452095, 1, 0.4901961, 0, 1,
-1.33392, 0.09608193, -2.430472, 1, 0.4980392, 0, 1,
-1.332965, 0.071305, -1.443255, 1, 0.5058824, 0, 1,
-1.326308, 0.03593842, -1.287719, 1, 0.509804, 0, 1,
-1.322106, -0.9563674, -1.530755, 1, 0.5176471, 0, 1,
-1.320726, -1.505177, -1.879327, 1, 0.5215687, 0, 1,
-1.302712, 0.474395, -0.4840005, 1, 0.5294118, 0, 1,
-1.296311, -1.004315, -1.12782, 1, 0.5333334, 0, 1,
-1.281985, -0.1293097, -0.9461366, 1, 0.5411765, 0, 1,
-1.26353, 0.0248898, -4.015838, 1, 0.5450981, 0, 1,
-1.262449, -0.6940725, -1.90119, 1, 0.5529412, 0, 1,
-1.26192, 0.7635859, -1.127093, 1, 0.5568628, 0, 1,
-1.259107, -1.249673, -1.548387, 1, 0.5647059, 0, 1,
-1.257002, 0.7297339, 0.06247997, 1, 0.5686275, 0, 1,
-1.247486, 0.1420604, -1.798721, 1, 0.5764706, 0, 1,
-1.242552, 1.746992, 0.405932, 1, 0.5803922, 0, 1,
-1.241745, 0.8203664, -2.410504, 1, 0.5882353, 0, 1,
-1.227524, -2.117324, -1.938554, 1, 0.5921569, 0, 1,
-1.218285, -0.2375131, -0.6195796, 1, 0.6, 0, 1,
-1.209852, -0.7653216, -1.432621, 1, 0.6078432, 0, 1,
-1.208786, 0.3580078, -0.8967521, 1, 0.6117647, 0, 1,
-1.20787, 0.2469004, -1.124401, 1, 0.6196079, 0, 1,
-1.197976, 1.056629, -0.5311101, 1, 0.6235294, 0, 1,
-1.191619, 0.0295773, -1.3796, 1, 0.6313726, 0, 1,
-1.190228, 0.8642828, -0.1939232, 1, 0.6352941, 0, 1,
-1.189048, -1.375301, -3.652379, 1, 0.6431373, 0, 1,
-1.181786, -1.553572, -0.1691785, 1, 0.6470588, 0, 1,
-1.181727, 0.1703793, -0.9376038, 1, 0.654902, 0, 1,
-1.181415, -1.431118, -4.009669, 1, 0.6588235, 0, 1,
-1.177428, 0.5847543, -2.023114, 1, 0.6666667, 0, 1,
-1.175312, -0.4343928, -1.916231, 1, 0.6705883, 0, 1,
-1.159644, -0.6330964, -0.4346711, 1, 0.6784314, 0, 1,
-1.141505, -0.2644293, -2.888931, 1, 0.682353, 0, 1,
-1.139487, -0.3409913, -2.126665, 1, 0.6901961, 0, 1,
-1.13692, -0.4434602, -2.469312, 1, 0.6941177, 0, 1,
-1.136247, -0.8206205, -1.572011, 1, 0.7019608, 0, 1,
-1.125841, -2.258626, -1.786769, 1, 0.7098039, 0, 1,
-1.124738, -0.3195063, -2.947124, 1, 0.7137255, 0, 1,
-1.117049, -0.1742255, -1.698863, 1, 0.7215686, 0, 1,
-1.115888, 1.936362, -0.298602, 1, 0.7254902, 0, 1,
-1.10569, -0.05313128, -1.797238, 1, 0.7333333, 0, 1,
-1.104048, 0.6257145, -0.5251581, 1, 0.7372549, 0, 1,
-1.101155, -0.8126124, -2.89365, 1, 0.7450981, 0, 1,
-1.092652, 0.9948213, -2.540067, 1, 0.7490196, 0, 1,
-1.089455, -0.2774792, -3.401558, 1, 0.7568628, 0, 1,
-1.082654, -0.147271, -1.171924, 1, 0.7607843, 0, 1,
-1.082081, 0.8165547, -1.243759, 1, 0.7686275, 0, 1,
-1.072617, 3.424122, -3.771436, 1, 0.772549, 0, 1,
-1.055663, 1.235172, -1.731637, 1, 0.7803922, 0, 1,
-1.046037, 0.2773079, -1.820093, 1, 0.7843137, 0, 1,
-1.045761, -0.957974, -2.245484, 1, 0.7921569, 0, 1,
-1.04034, 1.766071, -1.063484, 1, 0.7960784, 0, 1,
-1.034209, 0.02353191, -2.362274, 1, 0.8039216, 0, 1,
-1.027245, -3.287526, -3.414034, 1, 0.8117647, 0, 1,
-1.022967, -0.3830542, -1.725187, 1, 0.8156863, 0, 1,
-1.019709, -0.4727552, -0.5523445, 1, 0.8235294, 0, 1,
-1.016131, -0.9712715, -2.064719, 1, 0.827451, 0, 1,
-1.003959, 1.500956, -1.285303, 1, 0.8352941, 0, 1,
-0.9902669, -1.270089, -2.29785, 1, 0.8392157, 0, 1,
-0.9899047, 0.1011778, -1.669604, 1, 0.8470588, 0, 1,
-0.985856, 0.04830402, -4.095018, 1, 0.8509804, 0, 1,
-0.9816235, -0.2352094, 1.011658, 1, 0.8588235, 0, 1,
-0.9764174, -0.07007205, -1.74677, 1, 0.8627451, 0, 1,
-0.9752164, 0.3693519, -1.087537, 1, 0.8705882, 0, 1,
-0.9659748, -2.595081, -1.813876, 1, 0.8745098, 0, 1,
-0.9655013, -0.04324568, -1.07843, 1, 0.8823529, 0, 1,
-0.9602847, -0.7924591, -3.473031, 1, 0.8862745, 0, 1,
-0.9525095, 0.01659018, -2.100874, 1, 0.8941177, 0, 1,
-0.9483314, -0.847051, -1.263821, 1, 0.8980392, 0, 1,
-0.9426044, 0.3212122, -1.203432, 1, 0.9058824, 0, 1,
-0.9309177, 1.497598, -1.112434, 1, 0.9137255, 0, 1,
-0.9293023, -0.5398329, -2.813387, 1, 0.9176471, 0, 1,
-0.9274795, -1.190169, -1.622635, 1, 0.9254902, 0, 1,
-0.9238597, 0.2861959, -0.2536527, 1, 0.9294118, 0, 1,
-0.9208564, 0.2768891, -2.302325, 1, 0.9372549, 0, 1,
-0.9196514, 0.1934305, -1.934886, 1, 0.9411765, 0, 1,
-0.9187361, -2.166476, -1.683622, 1, 0.9490196, 0, 1,
-0.9151325, 0.5150614, -1.05703, 1, 0.9529412, 0, 1,
-0.9150743, -0.2798697, -4.526924, 1, 0.9607843, 0, 1,
-0.9098315, 0.3728007, -1.240915, 1, 0.9647059, 0, 1,
-0.9050871, 0.5055543, 0.4979566, 1, 0.972549, 0, 1,
-0.903402, 0.1206236, -1.321971, 1, 0.9764706, 0, 1,
-0.9027399, -1.143934, -2.435471, 1, 0.9843137, 0, 1,
-0.8940917, 1.818235, -0.8977506, 1, 0.9882353, 0, 1,
-0.8871391, 1.405881, -0.1471505, 1, 0.9960784, 0, 1,
-0.8778331, -1.326428, -2.468769, 0.9960784, 1, 0, 1,
-0.873763, 0.2136612, -2.49601, 0.9921569, 1, 0, 1,
-0.8669044, 1.210225, -3.074336, 0.9843137, 1, 0, 1,
-0.8665587, 1.466521, 0.6314085, 0.9803922, 1, 0, 1,
-0.8646368, -0.9341841, -1.269724, 0.972549, 1, 0, 1,
-0.8628963, 1.373566, -1.259718, 0.9686275, 1, 0, 1,
-0.8586676, 0.004089264, -0.8856364, 0.9607843, 1, 0, 1,
-0.8567609, 0.882224, -1.185027, 0.9568627, 1, 0, 1,
-0.8440746, 0.8993108, -1.394129, 0.9490196, 1, 0, 1,
-0.8422802, 0.08977861, -3.54856, 0.945098, 1, 0, 1,
-0.837707, 1.56809, -1.760261, 0.9372549, 1, 0, 1,
-0.8323636, -0.08064614, -1.442055, 0.9333333, 1, 0, 1,
-0.831406, -1.144116, -2.804796, 0.9254902, 1, 0, 1,
-0.8283085, -0.3621564, -1.934472, 0.9215686, 1, 0, 1,
-0.8266234, -1.411096, -1.010692, 0.9137255, 1, 0, 1,
-0.8153397, -0.9518536, -1.73335, 0.9098039, 1, 0, 1,
-0.8105509, -0.8170716, -3.065113, 0.9019608, 1, 0, 1,
-0.8073639, -0.6457624, -3.284433, 0.8941177, 1, 0, 1,
-0.8070108, -0.7372955, -2.777694, 0.8901961, 1, 0, 1,
-0.802774, 0.3542402, -2.441819, 0.8823529, 1, 0, 1,
-0.8022146, -1.991987, -1.180813, 0.8784314, 1, 0, 1,
-0.7976863, -0.5092871, -2.655589, 0.8705882, 1, 0, 1,
-0.7953821, 0.8468636, 0.2475843, 0.8666667, 1, 0, 1,
-0.7925318, 0.9470277, 1.867956, 0.8588235, 1, 0, 1,
-0.790182, 0.3981209, -1.256618, 0.854902, 1, 0, 1,
-0.7865395, -0.2974289, -1.154216, 0.8470588, 1, 0, 1,
-0.785328, 0.2306357, -2.292176, 0.8431373, 1, 0, 1,
-0.7796879, -0.4712283, -3.803426, 0.8352941, 1, 0, 1,
-0.7791076, 0.4181373, -1.730675, 0.8313726, 1, 0, 1,
-0.7783332, 0.4944826, -1.171975, 0.8235294, 1, 0, 1,
-0.7780982, -1.679576, -2.835138, 0.8196079, 1, 0, 1,
-0.7713384, -0.1504016, -2.068852, 0.8117647, 1, 0, 1,
-0.7674122, 1.229433, -1.936093, 0.8078431, 1, 0, 1,
-0.7656392, -0.8084449, -2.38968, 0.8, 1, 0, 1,
-0.7640529, -1.992691, -3.645612, 0.7921569, 1, 0, 1,
-0.7636814, -0.8860812, -1.794301, 0.7882353, 1, 0, 1,
-0.7537674, 0.08438209, -1.347565, 0.7803922, 1, 0, 1,
-0.7534463, -2.094128, -2.452062, 0.7764706, 1, 0, 1,
-0.7528442, -0.4909872, -2.840571, 0.7686275, 1, 0, 1,
-0.7491089, 1.26653, -0.7161315, 0.7647059, 1, 0, 1,
-0.7477297, -1.278042, -1.992932, 0.7568628, 1, 0, 1,
-0.7454917, -0.830465, -5.575431, 0.7529412, 1, 0, 1,
-0.7453245, -0.4040284, -2.590958, 0.7450981, 1, 0, 1,
-0.7434482, -0.06118837, -2.356615, 0.7411765, 1, 0, 1,
-0.7388899, -1.661297, -2.057097, 0.7333333, 1, 0, 1,
-0.7377201, 2.158991, 0.4303184, 0.7294118, 1, 0, 1,
-0.7361355, 1.679775, -1.163737, 0.7215686, 1, 0, 1,
-0.7350492, 0.8699607, 1.073579, 0.7176471, 1, 0, 1,
-0.730963, -0.3808658, -0.3245681, 0.7098039, 1, 0, 1,
-0.7270662, 0.1598289, -0.733209, 0.7058824, 1, 0, 1,
-0.7250666, 1.196687, -0.91265, 0.6980392, 1, 0, 1,
-0.7221109, 0.4251806, -0.5950947, 0.6901961, 1, 0, 1,
-0.7158557, -0.3116278, -2.111755, 0.6862745, 1, 0, 1,
-0.7082402, -1.819871, -4.257789, 0.6784314, 1, 0, 1,
-0.7055887, -1.920314, -3.229838, 0.6745098, 1, 0, 1,
-0.7016265, -0.2799257, -1.465391, 0.6666667, 1, 0, 1,
-0.701246, 1.386788, -0.9064717, 0.6627451, 1, 0, 1,
-0.6994808, -1.874105, -3.324877, 0.654902, 1, 0, 1,
-0.6992513, -0.03935584, -1.064198, 0.6509804, 1, 0, 1,
-0.6969479, 0.3664645, -1.778687, 0.6431373, 1, 0, 1,
-0.696361, 0.4443676, -0.8686644, 0.6392157, 1, 0, 1,
-0.6963436, -1.614301, -3.72071, 0.6313726, 1, 0, 1,
-0.6959406, 1.061465, -1.129002, 0.627451, 1, 0, 1,
-0.6933908, -1.536472, -4.011291, 0.6196079, 1, 0, 1,
-0.6931608, 0.07349999, 0.2529972, 0.6156863, 1, 0, 1,
-0.6927983, 0.4771236, -0.3360084, 0.6078432, 1, 0, 1,
-0.6926801, 0.06121269, -0.947956, 0.6039216, 1, 0, 1,
-0.6884274, 0.8616418, 0.07394003, 0.5960785, 1, 0, 1,
-0.6869445, 0.6913027, -1.264927, 0.5882353, 1, 0, 1,
-0.6811138, 1.492234, 0.3214566, 0.5843138, 1, 0, 1,
-0.6772454, -0.5739607, -2.570726, 0.5764706, 1, 0, 1,
-0.6740151, -0.7076675, -1.958388, 0.572549, 1, 0, 1,
-0.669105, -1.129146, -3.059578, 0.5647059, 1, 0, 1,
-0.6631953, 1.291812, 0.1710359, 0.5607843, 1, 0, 1,
-0.6598825, 1.576225, -0.06583607, 0.5529412, 1, 0, 1,
-0.6565223, 0.145224, -0.9099042, 0.5490196, 1, 0, 1,
-0.6552069, -1.245265, -4.421418, 0.5411765, 1, 0, 1,
-0.6532398, 0.3295461, -0.5450401, 0.5372549, 1, 0, 1,
-0.6529522, 0.5556722, -1.71542, 0.5294118, 1, 0, 1,
-0.6520539, -0.4859721, -0.9754447, 0.5254902, 1, 0, 1,
-0.6504301, 0.06508828, -2.787471, 0.5176471, 1, 0, 1,
-0.6498461, 0.3975329, 0.5440781, 0.5137255, 1, 0, 1,
-0.6464548, 0.5608076, -0.6295228, 0.5058824, 1, 0, 1,
-0.6452768, 0.8771603, -0.7037857, 0.5019608, 1, 0, 1,
-0.6428349, 2.419743, -0.4617308, 0.4941176, 1, 0, 1,
-0.6398785, 1.598968, -0.8324334, 0.4862745, 1, 0, 1,
-0.6372154, -0.5018694, 0.001987674, 0.4823529, 1, 0, 1,
-0.6342414, -0.1640891, -1.354258, 0.4745098, 1, 0, 1,
-0.6335118, 0.3293155, -0.9313179, 0.4705882, 1, 0, 1,
-0.6291516, -1.25064, -1.357792, 0.4627451, 1, 0, 1,
-0.629015, -0.04605745, -2.826078, 0.4588235, 1, 0, 1,
-0.6283165, 0.8974262, -2.226056, 0.4509804, 1, 0, 1,
-0.6270251, -1.292106, -2.273337, 0.4470588, 1, 0, 1,
-0.6267293, -0.4319206, -3.756516, 0.4392157, 1, 0, 1,
-0.6196301, -0.5406888, -2.106011, 0.4352941, 1, 0, 1,
-0.6189365, -0.185997, -1.573698, 0.427451, 1, 0, 1,
-0.6187037, 0.8758649, -1.435285, 0.4235294, 1, 0, 1,
-0.6171409, 0.1814792, -1.823509, 0.4156863, 1, 0, 1,
-0.6166369, 0.6941112, -0.8763853, 0.4117647, 1, 0, 1,
-0.6152665, 0.04186952, -1.878133, 0.4039216, 1, 0, 1,
-0.612382, -1.533161, -2.441874, 0.3960784, 1, 0, 1,
-0.6060735, 0.7996197, -2.237875, 0.3921569, 1, 0, 1,
-0.6048648, 2.441888, -1.879129, 0.3843137, 1, 0, 1,
-0.5975846, -1.115597, -1.624719, 0.3803922, 1, 0, 1,
-0.5956933, 0.3772006, -1.706297, 0.372549, 1, 0, 1,
-0.5899874, -1.087881, -2.743023, 0.3686275, 1, 0, 1,
-0.5899665, -0.1243783, -1.736542, 0.3607843, 1, 0, 1,
-0.5888167, -1.965822, -3.047896, 0.3568628, 1, 0, 1,
-0.5857667, -0.5758156, -3.483135, 0.3490196, 1, 0, 1,
-0.5791221, -0.2918321, -2.640369, 0.345098, 1, 0, 1,
-0.5781964, -1.08095, -5.261709, 0.3372549, 1, 0, 1,
-0.5725437, 0.6885664, 0.9844738, 0.3333333, 1, 0, 1,
-0.5722319, -0.02579779, -1.336352, 0.3254902, 1, 0, 1,
-0.5705622, -0.3155532, -2.995264, 0.3215686, 1, 0, 1,
-0.5658672, 0.3992268, -1.823656, 0.3137255, 1, 0, 1,
-0.5589952, -1.323926, -2.374414, 0.3098039, 1, 0, 1,
-0.5557002, 2.762694, -0.8768826, 0.3019608, 1, 0, 1,
-0.5530626, -1.068686, -2.059783, 0.2941177, 1, 0, 1,
-0.5502663, -0.963808, -2.250907, 0.2901961, 1, 0, 1,
-0.5463319, 0.4986251, -1.558637, 0.282353, 1, 0, 1,
-0.5456124, -1.213779, -2.874671, 0.2784314, 1, 0, 1,
-0.5453773, -1.260151, -1.704977, 0.2705882, 1, 0, 1,
-0.5381576, 1.379369, -1.772163, 0.2666667, 1, 0, 1,
-0.5379408, 1.816022, -2.127137, 0.2588235, 1, 0, 1,
-0.5372475, -0.4572339, -2.299047, 0.254902, 1, 0, 1,
-0.5363364, 0.03123028, -1.194468, 0.2470588, 1, 0, 1,
-0.5348887, -0.8839424, -2.266323, 0.2431373, 1, 0, 1,
-0.531719, -1.751822, -3.63022, 0.2352941, 1, 0, 1,
-0.5313929, -0.2201551, -2.033478, 0.2313726, 1, 0, 1,
-0.5301195, -1.072348, -3.356508, 0.2235294, 1, 0, 1,
-0.5268245, -1.599654, -4.219634, 0.2196078, 1, 0, 1,
-0.5230499, 0.2862177, -0.8217298, 0.2117647, 1, 0, 1,
-0.5200288, 1.77969, -1.999208, 0.2078431, 1, 0, 1,
-0.5185602, 0.7434483, -0.9732794, 0.2, 1, 0, 1,
-0.5162188, -0.8994697, -3.71159, 0.1921569, 1, 0, 1,
-0.5142483, -1.093793, -3.178887, 0.1882353, 1, 0, 1,
-0.5137631, -1.331721, -2.63973, 0.1803922, 1, 0, 1,
-0.5083235, -1.082648, -4.328143, 0.1764706, 1, 0, 1,
-0.5026807, 0.04680383, -2.307182, 0.1686275, 1, 0, 1,
-0.4996703, 0.2744826, -0.112564, 0.1647059, 1, 0, 1,
-0.4989014, -0.01634037, -1.324478, 0.1568628, 1, 0, 1,
-0.4988296, -0.9127518, -3.144852, 0.1529412, 1, 0, 1,
-0.4985813, 0.1895251, -0.6060299, 0.145098, 1, 0, 1,
-0.4965404, 0.2332065, -2.777629, 0.1411765, 1, 0, 1,
-0.4876859, -0.2399316, -2.021015, 0.1333333, 1, 0, 1,
-0.4876042, -2.592449, -4.461365, 0.1294118, 1, 0, 1,
-0.4812396, -0.6165879, -2.126318, 0.1215686, 1, 0, 1,
-0.4799219, -0.7014434, -1.423159, 0.1176471, 1, 0, 1,
-0.4747591, -0.06090478, -1.704309, 0.1098039, 1, 0, 1,
-0.4726004, -0.3357773, -1.490611, 0.1058824, 1, 0, 1,
-0.4698744, -0.8633881, -3.552758, 0.09803922, 1, 0, 1,
-0.4695966, 2.013455, -0.06994025, 0.09019608, 1, 0, 1,
-0.4657414, 0.4570708, -1.354679, 0.08627451, 1, 0, 1,
-0.4656706, -2.592005, -4.810852, 0.07843138, 1, 0, 1,
-0.4618316, -1.621198, -2.213954, 0.07450981, 1, 0, 1,
-0.4598407, -1.315226, -3.085324, 0.06666667, 1, 0, 1,
-0.453045, 0.9229862, -1.434407, 0.0627451, 1, 0, 1,
-0.4520118, -0.03828311, 0.5851921, 0.05490196, 1, 0, 1,
-0.4518577, 0.1101775, -2.230764, 0.05098039, 1, 0, 1,
-0.445552, -0.3271961, -2.279706, 0.04313726, 1, 0, 1,
-0.444026, 0.8664517, -1.576709, 0.03921569, 1, 0, 1,
-0.440176, 0.2279491, -1.897271, 0.03137255, 1, 0, 1,
-0.4393139, -0.7234574, -3.650469, 0.02745098, 1, 0, 1,
-0.4377925, 0.3464397, -0.2809592, 0.01960784, 1, 0, 1,
-0.4346282, -0.6114466, -3.454126, 0.01568628, 1, 0, 1,
-0.4281733, -0.616715, -2.173478, 0.007843138, 1, 0, 1,
-0.4239596, 0.6712081, -1.091532, 0.003921569, 1, 0, 1,
-0.4208411, 0.919091, -0.937874, 0, 1, 0.003921569, 1,
-0.418114, 1.404082, -1.566812, 0, 1, 0.01176471, 1,
-0.4169819, 0.697392, -0.4287093, 0, 1, 0.01568628, 1,
-0.4153204, -0.25488, -2.494171, 0, 1, 0.02352941, 1,
-0.4126277, 0.05761947, -2.538964, 0, 1, 0.02745098, 1,
-0.4074818, 0.7498546, -0.4764587, 0, 1, 0.03529412, 1,
-0.4065645, 1.632079, -1.390073, 0, 1, 0.03921569, 1,
-0.4047233, 1.371267, -0.6595899, 0, 1, 0.04705882, 1,
-0.4000635, -1.189289, -2.370278, 0, 1, 0.05098039, 1,
-0.3987661, 0.6517155, -0.3862216, 0, 1, 0.05882353, 1,
-0.3946302, 0.2229713, 0.1000843, 0, 1, 0.0627451, 1,
-0.3928609, -1.926155, -2.548562, 0, 1, 0.07058824, 1,
-0.391805, 0.8299567, -0.5349769, 0, 1, 0.07450981, 1,
-0.3871262, -0.2887317, -4.003225, 0, 1, 0.08235294, 1,
-0.3863503, 0.9509117, -1.416215, 0, 1, 0.08627451, 1,
-0.3797454, -0.3568539, -0.4724666, 0, 1, 0.09411765, 1,
-0.3772989, 1.950331, 0.9752539, 0, 1, 0.1019608, 1,
-0.375952, -1.264685, -3.399667, 0, 1, 0.1058824, 1,
-0.3739719, -1.233021, -4.914332, 0, 1, 0.1137255, 1,
-0.3724478, 1.270327, 0.766528, 0, 1, 0.1176471, 1,
-0.3635438, 1.346225, -0.7360157, 0, 1, 0.1254902, 1,
-0.3631063, -0.5579209, -2.30967, 0, 1, 0.1294118, 1,
-0.359769, -1.328292, -1.927477, 0, 1, 0.1372549, 1,
-0.3500699, -0.375829, -2.169555, 0, 1, 0.1411765, 1,
-0.3481694, -1.206406, -4.204298, 0, 1, 0.1490196, 1,
-0.3448147, -0.5138572, -3.193579, 0, 1, 0.1529412, 1,
-0.3432502, -1.751855, -0.9424411, 0, 1, 0.1607843, 1,
-0.3307675, 0.7264879, -0.0260768, 0, 1, 0.1647059, 1,
-0.3279472, -0.5471812, -3.502587, 0, 1, 0.172549, 1,
-0.3229862, 0.5185496, -1.690392, 0, 1, 0.1764706, 1,
-0.3202145, 0.04261022, -1.787907, 0, 1, 0.1843137, 1,
-0.3160009, 1.44969, -1.217768, 0, 1, 0.1882353, 1,
-0.3131971, -0.1368783, -2.272763, 0, 1, 0.1960784, 1,
-0.3091981, -1.132693, -2.013197, 0, 1, 0.2039216, 1,
-0.3050989, -0.6981073, -3.211625, 0, 1, 0.2078431, 1,
-0.3034533, 0.2178093, -0.2551774, 0, 1, 0.2156863, 1,
-0.3019528, -2.341766, -2.794529, 0, 1, 0.2196078, 1,
-0.3017517, 0.880977, 0.8698316, 0, 1, 0.227451, 1,
-0.2991579, 0.8884889, 0.5180556, 0, 1, 0.2313726, 1,
-0.298953, 2.07571, -0.6593548, 0, 1, 0.2392157, 1,
-0.2974286, 0.7697882, -0.7550539, 0, 1, 0.2431373, 1,
-0.2970814, -0.1532076, -1.81376, 0, 1, 0.2509804, 1,
-0.2957053, -0.1212783, -2.875642, 0, 1, 0.254902, 1,
-0.2922432, 0.6964906, -0.5931005, 0, 1, 0.2627451, 1,
-0.2918317, 0.4256237, -2.534237, 0, 1, 0.2666667, 1,
-0.2903646, -0.2719612, -1.983685, 0, 1, 0.2745098, 1,
-0.2900288, -1.848625, -1.680865, 0, 1, 0.2784314, 1,
-0.2880943, 0.3081884, -0.5142301, 0, 1, 0.2862745, 1,
-0.2872398, -1.67735, -0.003936598, 0, 1, 0.2901961, 1,
-0.2867675, 0.9869196, -1.348693, 0, 1, 0.2980392, 1,
-0.2788711, 1.832129, 0.1190764, 0, 1, 0.3058824, 1,
-0.2768317, 0.4640688, -0.1449545, 0, 1, 0.3098039, 1,
-0.2761627, -0.7406532, -4.431765, 0, 1, 0.3176471, 1,
-0.275548, -1.350379, -3.860892, 0, 1, 0.3215686, 1,
-0.2740319, 0.4223992, -1.012749, 0, 1, 0.3294118, 1,
-0.2718536, 2.248905, -0.8403339, 0, 1, 0.3333333, 1,
-0.2694058, 0.2424235, -0.3386219, 0, 1, 0.3411765, 1,
-0.2674573, 0.519905, 0.2522939, 0, 1, 0.345098, 1,
-0.2652554, 1.081996, -1.228261, 0, 1, 0.3529412, 1,
-0.2652027, -0.8161497, -4.764432, 0, 1, 0.3568628, 1,
-0.2615, 0.02749962, 0.43589, 0, 1, 0.3647059, 1,
-0.2613649, -2.731011, -1.970621, 0, 1, 0.3686275, 1,
-0.2597522, 1.08706, -0.2928904, 0, 1, 0.3764706, 1,
-0.2556509, 2.288111, 0.129458, 0, 1, 0.3803922, 1,
-0.2507937, -2.053607, -2.862491, 0, 1, 0.3882353, 1,
-0.249198, -3.078685, -3.022932, 0, 1, 0.3921569, 1,
-0.2488769, 0.1075283, -1.892434, 0, 1, 0.4, 1,
-0.2472842, -1.061827, -3.164173, 0, 1, 0.4078431, 1,
-0.2455115, -0.06770077, -1.559833, 0, 1, 0.4117647, 1,
-0.2451154, -1.318175, -3.769871, 0, 1, 0.4196078, 1,
-0.2414084, 0.7042259, -0.3599398, 0, 1, 0.4235294, 1,
-0.2413669, 0.2924265, 0.9024239, 0, 1, 0.4313726, 1,
-0.2379589, -0.2762213, -1.759215, 0, 1, 0.4352941, 1,
-0.2362424, 0.4626382, -0.1793174, 0, 1, 0.4431373, 1,
-0.2353299, -1.165118, -2.525103, 0, 1, 0.4470588, 1,
-0.2315814, 2.290219, -1.9026, 0, 1, 0.454902, 1,
-0.2307408, 0.8165879, -0.7783545, 0, 1, 0.4588235, 1,
-0.2240253, -0.5667614, -4.661992, 0, 1, 0.4666667, 1,
-0.2226664, 0.4499999, -0.8549504, 0, 1, 0.4705882, 1,
-0.221676, -0.2088104, -0.4049447, 0, 1, 0.4784314, 1,
-0.2174826, -0.115918, -0.8838341, 0, 1, 0.4823529, 1,
-0.2155489, 1.359232, 0.40962, 0, 1, 0.4901961, 1,
-0.2121774, 0.2281448, -0.7139813, 0, 1, 0.4941176, 1,
-0.210958, 0.4308007, -0.4607544, 0, 1, 0.5019608, 1,
-0.207262, -0.5875114, -2.091049, 0, 1, 0.509804, 1,
-0.2016338, 1.918348, -0.2441805, 0, 1, 0.5137255, 1,
-0.1978707, 0.4204524, 1.586116, 0, 1, 0.5215687, 1,
-0.1961648, -0.2186614, -1.724454, 0, 1, 0.5254902, 1,
-0.194111, -0.5557457, -1.987601, 0, 1, 0.5333334, 1,
-0.1868563, 2.479832, -0.3346272, 0, 1, 0.5372549, 1,
-0.1865301, 0.1719069, -0.7286755, 0, 1, 0.5450981, 1,
-0.183768, -0.5651791, -3.705136, 0, 1, 0.5490196, 1,
-0.1828425, 0.9105703, -0.5870856, 0, 1, 0.5568628, 1,
-0.1821088, 0.8251022, 0.3491607, 0, 1, 0.5607843, 1,
-0.1805992, 0.2039792, -0.9117089, 0, 1, 0.5686275, 1,
-0.1788819, -0.5390046, -2.934295, 0, 1, 0.572549, 1,
-0.1776939, -0.540481, -2.536977, 0, 1, 0.5803922, 1,
-0.175648, 0.8361107, -0.6814417, 0, 1, 0.5843138, 1,
-0.1718086, -0.09996162, -2.431692, 0, 1, 0.5921569, 1,
-0.1706437, 1.863423, 0.9705457, 0, 1, 0.5960785, 1,
-0.1662217, 0.05000696, -0.2066, 0, 1, 0.6039216, 1,
-0.1631228, 1.207308, 0.7301384, 0, 1, 0.6117647, 1,
-0.1533313, 1.122425, 0.5236316, 0, 1, 0.6156863, 1,
-0.1461267, -0.501484, -1.881968, 0, 1, 0.6235294, 1,
-0.1458883, 0.5858143, 0.5491284, 0, 1, 0.627451, 1,
-0.1448531, -0.2648149, -2.039698, 0, 1, 0.6352941, 1,
-0.1445191, -0.2132308, -2.445868, 0, 1, 0.6392157, 1,
-0.1431906, -0.6342896, -2.696915, 0, 1, 0.6470588, 1,
-0.1402187, 0.09057185, -1.142965, 0, 1, 0.6509804, 1,
-0.1390419, -2.185323, -3.421307, 0, 1, 0.6588235, 1,
-0.1374743, -2.67888, -2.897499, 0, 1, 0.6627451, 1,
-0.1370303, 0.2221751, -1.010917, 0, 1, 0.6705883, 1,
-0.1337289, -0.6044958, -2.851406, 0, 1, 0.6745098, 1,
-0.1334121, 2.233734, 0.2057014, 0, 1, 0.682353, 1,
-0.1329955, -0.1778779, -1.156012, 0, 1, 0.6862745, 1,
-0.132665, -0.07435866, -2.311399, 0, 1, 0.6941177, 1,
-0.1313305, -0.4078286, -2.653944, 0, 1, 0.7019608, 1,
-0.1305029, 0.9938078, -0.8131823, 0, 1, 0.7058824, 1,
-0.1301192, 0.8839894, -1.639608, 0, 1, 0.7137255, 1,
-0.1288575, 1.533363, 0.3967653, 0, 1, 0.7176471, 1,
-0.1218551, -2.57548, -3.725208, 0, 1, 0.7254902, 1,
-0.1166704, 0.8477852, -2.16801, 0, 1, 0.7294118, 1,
-0.1153176, 2.251362, 0.03939764, 0, 1, 0.7372549, 1,
-0.1146359, 0.5691909, 0.1121408, 0, 1, 0.7411765, 1,
-0.1143528, -1.848394, -2.906271, 0, 1, 0.7490196, 1,
-0.1090734, 0.9937984, -0.5571487, 0, 1, 0.7529412, 1,
-0.0968646, 0.6222637, -2.829508, 0, 1, 0.7607843, 1,
-0.09597891, 0.7386589, -1.015894, 0, 1, 0.7647059, 1,
-0.09424221, 1.58886, 1.244631, 0, 1, 0.772549, 1,
-0.09190898, -1.016159, -4.980357, 0, 1, 0.7764706, 1,
-0.09081362, -0.4468112, -2.139101, 0, 1, 0.7843137, 1,
-0.08871578, -1.330652, -1.31488, 0, 1, 0.7882353, 1,
-0.0876481, -1.913411, -2.514261, 0, 1, 0.7960784, 1,
-0.08576144, -1.132448, -3.705641, 0, 1, 0.8039216, 1,
-0.08236212, 0.781303, 1.069127, 0, 1, 0.8078431, 1,
-0.08168189, 0.1162878, -1.23148, 0, 1, 0.8156863, 1,
-0.0816671, 0.7025924, -0.7422884, 0, 1, 0.8196079, 1,
-0.08041797, -1.627933, -3.70404, 0, 1, 0.827451, 1,
-0.07711032, -0.9702353, -2.466975, 0, 1, 0.8313726, 1,
-0.07645597, 0.7382388, -0.5302489, 0, 1, 0.8392157, 1,
-0.07334573, -0.7922977, -0.2230297, 0, 1, 0.8431373, 1,
-0.07330965, -0.2935598, -2.668203, 0, 1, 0.8509804, 1,
-0.06554905, 0.6122128, 0.1863311, 0, 1, 0.854902, 1,
-0.0620177, 0.5770212, -1.782288, 0, 1, 0.8627451, 1,
-0.06193581, 1.472305, -2.380642, 0, 1, 0.8666667, 1,
-0.06184804, -0.1089964, -2.304714, 0, 1, 0.8745098, 1,
-0.05736136, 0.050243, -0.7607125, 0, 1, 0.8784314, 1,
-0.05703853, -0.4647126, -2.968235, 0, 1, 0.8862745, 1,
-0.05414242, -2.053926, -2.830497, 0, 1, 0.8901961, 1,
-0.05306982, -0.8113523, -2.883618, 0, 1, 0.8980392, 1,
-0.05251774, -0.5733623, -3.17623, 0, 1, 0.9058824, 1,
-0.05134521, -0.9327135, -2.769253, 0, 1, 0.9098039, 1,
-0.04751479, 0.2345759, 0.3400519, 0, 1, 0.9176471, 1,
-0.04157212, 0.9794328, -1.483394, 0, 1, 0.9215686, 1,
-0.04064865, -1.427831, -2.993116, 0, 1, 0.9294118, 1,
-0.04029843, 0.08877965, -0.5917783, 0, 1, 0.9333333, 1,
-0.0384865, 0.2438823, -0.6044077, 0, 1, 0.9411765, 1,
-0.03264927, 0.6345204, -0.7338555, 0, 1, 0.945098, 1,
-0.02784881, 1.606856, 0.65479, 0, 1, 0.9529412, 1,
-0.02473527, -0.5594739, -4.209513, 0, 1, 0.9568627, 1,
-0.02043053, -1.8271, -3.340619, 0, 1, 0.9647059, 1,
-0.01951453, -0.6231803, -3.758864, 0, 1, 0.9686275, 1,
-0.01924434, -0.3340478, -4.154294, 0, 1, 0.9764706, 1,
-0.01769936, 0.6909909, -1.953158, 0, 1, 0.9803922, 1,
-0.01573208, -1.79968, -2.964909, 0, 1, 0.9882353, 1,
-0.01493125, 1.53659, -1.160456, 0, 1, 0.9921569, 1,
6.073275e-05, -0.8207307, 4.129187, 0, 1, 1, 1,
0.0003791678, 0.8864855, -0.3493814, 0, 0.9921569, 1, 1,
0.002019722, -0.4731974, 3.682886, 0, 0.9882353, 1, 1,
0.002532607, 2.274841, 0.3551301, 0, 0.9803922, 1, 1,
0.008888328, 0.7678598, -0.8498607, 0, 0.9764706, 1, 1,
0.01705612, 0.3717521, -0.1753985, 0, 0.9686275, 1, 1,
0.01710734, -1.815309, 2.669738, 0, 0.9647059, 1, 1,
0.01773167, 0.03551191, 0.3939642, 0, 0.9568627, 1, 1,
0.02149918, -0.6680684, 3.700572, 0, 0.9529412, 1, 1,
0.02188081, 0.8232241, -0.1597571, 0, 0.945098, 1, 1,
0.0237152, -1.332274, 3.013315, 0, 0.9411765, 1, 1,
0.02936895, -1.004918, 3.308149, 0, 0.9333333, 1, 1,
0.03008306, 2.447815, -0.2424985, 0, 0.9294118, 1, 1,
0.03120195, 1.90258, 0.7459532, 0, 0.9215686, 1, 1,
0.03151605, -0.7602232, 4.083894, 0, 0.9176471, 1, 1,
0.0322379, 0.2647972, -0.3582261, 0, 0.9098039, 1, 1,
0.03620987, -1.942567, 3.222064, 0, 0.9058824, 1, 1,
0.0363724, -0.08197936, 2.608269, 0, 0.8980392, 1, 1,
0.03784603, -1.697338, 3.856007, 0, 0.8901961, 1, 1,
0.04438934, 0.9401515, -1.172852, 0, 0.8862745, 1, 1,
0.04596312, -0.9312719, 3.795333, 0, 0.8784314, 1, 1,
0.04855369, -0.03610101, 2.096179, 0, 0.8745098, 1, 1,
0.0487232, -0.7667316, 3.270392, 0, 0.8666667, 1, 1,
0.05106459, 0.3797714, 2.2936, 0, 0.8627451, 1, 1,
0.05109229, -0.9690712, -0.1549445, 0, 0.854902, 1, 1,
0.05219799, 0.7566659, 1.16166, 0, 0.8509804, 1, 1,
0.05226661, -0.5727088, 3.347936, 0, 0.8431373, 1, 1,
0.05651375, 1.597507, -0.7959527, 0, 0.8392157, 1, 1,
0.05659695, -0.2435349, 2.734574, 0, 0.8313726, 1, 1,
0.05748351, 0.7129012, 0.8022471, 0, 0.827451, 1, 1,
0.05979806, -0.2452701, 2.824687, 0, 0.8196079, 1, 1,
0.06446104, -1.81514, 3.250792, 0, 0.8156863, 1, 1,
0.06641278, 0.1259756, 1.280476, 0, 0.8078431, 1, 1,
0.0665866, -0.2937129, 2.676304, 0, 0.8039216, 1, 1,
0.06861642, -0.567185, 3.556214, 0, 0.7960784, 1, 1,
0.07831432, 1.017963, -1.227802, 0, 0.7882353, 1, 1,
0.08591907, 0.8361748, 0.7899133, 0, 0.7843137, 1, 1,
0.08670963, 1.054212, 1.361929, 0, 0.7764706, 1, 1,
0.08761805, -0.2296629, 1.225492, 0, 0.772549, 1, 1,
0.08832374, 0.441401, -0.4680192, 0, 0.7647059, 1, 1,
0.08919607, 0.7055814, 1.578565, 0, 0.7607843, 1, 1,
0.08920625, 1.374021, 0.74458, 0, 0.7529412, 1, 1,
0.08962286, 0.07288865, 1.784631, 0, 0.7490196, 1, 1,
0.09090694, -0.001735917, 0.8366929, 0, 0.7411765, 1, 1,
0.09739711, 0.6114978, 0.9367941, 0, 0.7372549, 1, 1,
0.09821306, -1.386002, 2.023625, 0, 0.7294118, 1, 1,
0.0996034, 0.4747205, 0.3149006, 0, 0.7254902, 1, 1,
0.1056455, 0.6343333, 0.5267583, 0, 0.7176471, 1, 1,
0.1066462, -1.398469, 4.113905, 0, 0.7137255, 1, 1,
0.1115471, -0.02344425, 2.520914, 0, 0.7058824, 1, 1,
0.1120409, 0.5806923, -1.016187, 0, 0.6980392, 1, 1,
0.1139889, -0.312018, 3.072833, 0, 0.6941177, 1, 1,
0.1233306, 1.562335, -0.7035131, 0, 0.6862745, 1, 1,
0.1243733, -0.08032654, 0.9200343, 0, 0.682353, 1, 1,
0.1260744, -1.091209, 3.228376, 0, 0.6745098, 1, 1,
0.1262736, -0.9825683, 2.47029, 0, 0.6705883, 1, 1,
0.1412879, -1.45472, 3.76035, 0, 0.6627451, 1, 1,
0.1459746, 1.254577, 1.132524, 0, 0.6588235, 1, 1,
0.1482909, 0.2942671, -1.690223, 0, 0.6509804, 1, 1,
0.1509625, 0.07541052, 1.157926, 0, 0.6470588, 1, 1,
0.153079, 1.115894, -0.560704, 0, 0.6392157, 1, 1,
0.1546016, -0.06856313, 0.2082478, 0, 0.6352941, 1, 1,
0.154806, 0.6924864, -1.090038, 0, 0.627451, 1, 1,
0.1617388, 1.310885, 0.284916, 0, 0.6235294, 1, 1,
0.1624266, -0.924242, 1.932365, 0, 0.6156863, 1, 1,
0.1636123, 0.5951132, -0.07583066, 0, 0.6117647, 1, 1,
0.1643199, 2.371808, 0.1331009, 0, 0.6039216, 1, 1,
0.1700894, -0.6066272, 2.534461, 0, 0.5960785, 1, 1,
0.1727305, 1.646524, 0.1864976, 0, 0.5921569, 1, 1,
0.1731604, -0.40067, 2.999714, 0, 0.5843138, 1, 1,
0.1734049, -0.801743, 4.116891, 0, 0.5803922, 1, 1,
0.1772014, 1.084572, -0.5158788, 0, 0.572549, 1, 1,
0.1789122, -0.6335142, 1.188478, 0, 0.5686275, 1, 1,
0.1817687, -0.9601606, 4.635078, 0, 0.5607843, 1, 1,
0.1835622, -0.3308148, 1.695584, 0, 0.5568628, 1, 1,
0.1853626, -0.2776608, 5.831019, 0, 0.5490196, 1, 1,
0.1855876, -0.1560934, 0.5930383, 0, 0.5450981, 1, 1,
0.1926292, -0.09972493, 2.9095, 0, 0.5372549, 1, 1,
0.1942777, 0.09765149, 1.117706, 0, 0.5333334, 1, 1,
0.1952523, -2.911597, 3.076028, 0, 0.5254902, 1, 1,
0.1971532, 1.736814, 0.2273064, 0, 0.5215687, 1, 1,
0.1973067, 0.1326436, 0.5542143, 0, 0.5137255, 1, 1,
0.1980038, -0.7684041, 3.791445, 0, 0.509804, 1, 1,
0.2047577, -0.8037165, 2.012604, 0, 0.5019608, 1, 1,
0.2050451, -0.2698272, 2.735106, 0, 0.4941176, 1, 1,
0.2073258, 0.4822957, 0.4686895, 0, 0.4901961, 1, 1,
0.2078955, 0.6539208, 0.8906901, 0, 0.4823529, 1, 1,
0.211332, -0.0743389, 0.1342785, 0, 0.4784314, 1, 1,
0.213438, -0.537604, 2.574553, 0, 0.4705882, 1, 1,
0.2155652, 0.8603391, 1.680469, 0, 0.4666667, 1, 1,
0.216533, 2.905329, -0.5301763, 0, 0.4588235, 1, 1,
0.2189548, 0.8359867, 0.993314, 0, 0.454902, 1, 1,
0.2285866, -1.360907, 2.731937, 0, 0.4470588, 1, 1,
0.2297626, 0.1740748, 3.180264, 0, 0.4431373, 1, 1,
0.2341004, 0.6514511, -0.4059773, 0, 0.4352941, 1, 1,
0.2347451, -0.6736797, 3.582953, 0, 0.4313726, 1, 1,
0.2348704, 0.4443954, 1.987612, 0, 0.4235294, 1, 1,
0.2353512, -1.300241, 2.940739, 0, 0.4196078, 1, 1,
0.2365562, -0.5085472, 2.956533, 0, 0.4117647, 1, 1,
0.2394189, -0.8935811, 2.793769, 0, 0.4078431, 1, 1,
0.2396282, 0.5447131, 0.2294593, 0, 0.4, 1, 1,
0.2410654, -0.2402371, 3.360742, 0, 0.3921569, 1, 1,
0.2411507, -1.180608, 2.742558, 0, 0.3882353, 1, 1,
0.2490923, 0.677694, -0.4130341, 0, 0.3803922, 1, 1,
0.2552363, -0.6738922, 2.718258, 0, 0.3764706, 1, 1,
0.2590879, 0.07511529, 1.198274, 0, 0.3686275, 1, 1,
0.2616771, -1.640386, 3.444206, 0, 0.3647059, 1, 1,
0.2687032, -0.7473702, 2.675825, 0, 0.3568628, 1, 1,
0.2708971, 1.476356, 1.581531, 0, 0.3529412, 1, 1,
0.2743068, -2.019512, 3.08306, 0, 0.345098, 1, 1,
0.2837833, 0.8506874, 0.4753264, 0, 0.3411765, 1, 1,
0.2881691, 0.6916195, -0.6666477, 0, 0.3333333, 1, 1,
0.2993544, -1.50495, 3.044314, 0, 0.3294118, 1, 1,
0.3000977, -1.039837, 2.094733, 0, 0.3215686, 1, 1,
0.3033217, 0.7278646, 1.734669, 0, 0.3176471, 1, 1,
0.3055882, -1.410819, 4.085509, 0, 0.3098039, 1, 1,
0.3094223, 0.5909223, 0.9658886, 0, 0.3058824, 1, 1,
0.3145709, -0.01294812, 1.302017, 0, 0.2980392, 1, 1,
0.317906, 0.4734943, 1.719435, 0, 0.2901961, 1, 1,
0.3181927, 0.1577486, 1.010401, 0, 0.2862745, 1, 1,
0.3194391, -0.2615669, 1.842456, 0, 0.2784314, 1, 1,
0.3196938, 0.2796493, 2.719762, 0, 0.2745098, 1, 1,
0.3197198, 0.4467776, 3.834623, 0, 0.2666667, 1, 1,
0.3203391, 1.942958, 0.7319426, 0, 0.2627451, 1, 1,
0.3214607, 0.8721549, 2.198669, 0, 0.254902, 1, 1,
0.32329, 1.088216, 0.09408116, 0, 0.2509804, 1, 1,
0.3245215, -0.1066377, 0.4963671, 0, 0.2431373, 1, 1,
0.3266132, -3.459732, 2.503387, 0, 0.2392157, 1, 1,
0.3271838, 2.408726, 1.315755, 0, 0.2313726, 1, 1,
0.3280217, -0.650272, 2.449164, 0, 0.227451, 1, 1,
0.342093, -0.3134503, 0.812769, 0, 0.2196078, 1, 1,
0.3439274, 1.196339, 0.5618881, 0, 0.2156863, 1, 1,
0.3452648, 2.061958, -0.2300651, 0, 0.2078431, 1, 1,
0.3464951, 1.65637, 0.5062367, 0, 0.2039216, 1, 1,
0.3482955, 1.054703, 0.07591144, 0, 0.1960784, 1, 1,
0.3513937, 2.2023, -1.561478, 0, 0.1882353, 1, 1,
0.3561127, 0.1913245, 1.245361, 0, 0.1843137, 1, 1,
0.3745545, 0.4255753, 1.325455, 0, 0.1764706, 1, 1,
0.3779921, -0.9304814, 2.192273, 0, 0.172549, 1, 1,
0.3814653, 0.403178, -0.8794342, 0, 0.1647059, 1, 1,
0.3816761, -0.06559832, 2.739241, 0, 0.1607843, 1, 1,
0.3841253, 0.4606138, 1.003818, 0, 0.1529412, 1, 1,
0.3850648, -0.5743572, 3.849898, 0, 0.1490196, 1, 1,
0.3855403, -0.6115091, 2.862863, 0, 0.1411765, 1, 1,
0.3862679, 0.7470681, 0.7619739, 0, 0.1372549, 1, 1,
0.38629, 1.139971, -1.124432, 0, 0.1294118, 1, 1,
0.391753, -1.725134, 2.726321, 0, 0.1254902, 1, 1,
0.394888, 0.4143943, 0.3607509, 0, 0.1176471, 1, 1,
0.3964495, 0.02633907, 0.8556308, 0, 0.1137255, 1, 1,
0.3970124, -0.2412674, 2.115991, 0, 0.1058824, 1, 1,
0.3988884, -0.9828494, 2.915412, 0, 0.09803922, 1, 1,
0.3989371, 0.5997332, -1.812897, 0, 0.09411765, 1, 1,
0.4001847, -0.8551289, 3.150643, 0, 0.08627451, 1, 1,
0.4066325, -1.117452, 3.067705, 0, 0.08235294, 1, 1,
0.4169632, 1.019315, -0.08646613, 0, 0.07450981, 1, 1,
0.4179118, 1.41792, 0.210877, 0, 0.07058824, 1, 1,
0.420515, 0.9269484, -0.7390089, 0, 0.0627451, 1, 1,
0.429189, 0.5653054, -1.709673, 0, 0.05882353, 1, 1,
0.4320926, 0.3887407, 1.428586, 0, 0.05098039, 1, 1,
0.4325174, -0.8804713, 3.246587, 0, 0.04705882, 1, 1,
0.4397255, 0.8860806, -0.5697927, 0, 0.03921569, 1, 1,
0.4429755, -0.736456, 3.833179, 0, 0.03529412, 1, 1,
0.4445585, 0.7520563, 0.9115558, 0, 0.02745098, 1, 1,
0.4504928, 1.666072, 0.6056644, 0, 0.02352941, 1, 1,
0.4539173, -1.314358, 2.09064, 0, 0.01568628, 1, 1,
0.4552153, -0.8323362, 1.690976, 0, 0.01176471, 1, 1,
0.4562375, 0.1653663, 1.965518, 0, 0.003921569, 1, 1,
0.459094, -0.08667906, 1.140262, 0.003921569, 0, 1, 1,
0.4599696, 0.6194203, 3.325244, 0.007843138, 0, 1, 1,
0.4685523, -0.5345528, 3.160005, 0.01568628, 0, 1, 1,
0.468848, -0.4581646, 2.668127, 0.01960784, 0, 1, 1,
0.4710521, -0.9625087, 2.315676, 0.02745098, 0, 1, 1,
0.4731246, 1.874187, -0.3920897, 0.03137255, 0, 1, 1,
0.4740985, 0.4254456, -0.09545008, 0.03921569, 0, 1, 1,
0.4833728, -0.06898832, 0.5210828, 0.04313726, 0, 1, 1,
0.4870045, -0.4585568, 1.874619, 0.05098039, 0, 1, 1,
0.4873992, -0.1984378, 1.339308, 0.05490196, 0, 1, 1,
0.4945414, -0.7285977, 1.816474, 0.0627451, 0, 1, 1,
0.4970984, -0.326064, 3.347689, 0.06666667, 0, 1, 1,
0.4998767, 0.2257089, 0.8792913, 0.07450981, 0, 1, 1,
0.5009464, 2.124068, 2.187231, 0.07843138, 0, 1, 1,
0.5054105, -0.9359947, 1.730706, 0.08627451, 0, 1, 1,
0.508269, -0.9512346, 3.725361, 0.09019608, 0, 1, 1,
0.5093581, -0.3985261, 1.074838, 0.09803922, 0, 1, 1,
0.5163805, 0.06324214, 0.5881348, 0.1058824, 0, 1, 1,
0.5164468, -1.615116, 3.029407, 0.1098039, 0, 1, 1,
0.5288482, 1.14732, 0.5116267, 0.1176471, 0, 1, 1,
0.5300601, -0.02808526, 1.330087, 0.1215686, 0, 1, 1,
0.533603, 0.3798882, 1.819562, 0.1294118, 0, 1, 1,
0.5398338, 0.316624, 1.024143, 0.1333333, 0, 1, 1,
0.5435302, -1.858418, 0.9024411, 0.1411765, 0, 1, 1,
0.5436956, -0.7665703, 1.902562, 0.145098, 0, 1, 1,
0.5456427, -0.166843, 0.5689284, 0.1529412, 0, 1, 1,
0.5606021, -0.9471076, 2.614928, 0.1568628, 0, 1, 1,
0.5608378, -1.567791, 4.602589, 0.1647059, 0, 1, 1,
0.5618468, 0.5633709, 0.9185041, 0.1686275, 0, 1, 1,
0.5629308, -0.1134477, 2.846878, 0.1764706, 0, 1, 1,
0.5630102, -1.021218, 2.558637, 0.1803922, 0, 1, 1,
0.5662038, -0.7237622, 2.534042, 0.1882353, 0, 1, 1,
0.5690366, -0.9886791, 1.14968, 0.1921569, 0, 1, 1,
0.5738004, 1.431105, 1.225099, 0.2, 0, 1, 1,
0.5828333, -0.03787207, 1.522136, 0.2078431, 0, 1, 1,
0.5829298, -0.9516457, 2.191476, 0.2117647, 0, 1, 1,
0.5870172, -0.7891231, 2.563909, 0.2196078, 0, 1, 1,
0.5897378, -0.02222246, 2.17836, 0.2235294, 0, 1, 1,
0.5926105, -0.1180699, 2.413395, 0.2313726, 0, 1, 1,
0.5959423, -0.5140864, 2.578052, 0.2352941, 0, 1, 1,
0.5975872, -0.3329968, 1.593004, 0.2431373, 0, 1, 1,
0.599871, 1.115554, -0.6026227, 0.2470588, 0, 1, 1,
0.6005824, -0.1052012, 0.3764783, 0.254902, 0, 1, 1,
0.6040118, 0.7754425, 0.6846519, 0.2588235, 0, 1, 1,
0.6068404, 2.100317, 0.9714043, 0.2666667, 0, 1, 1,
0.6111642, 0.2298681, -0.5571216, 0.2705882, 0, 1, 1,
0.6116945, 0.5436156, 2.230421, 0.2784314, 0, 1, 1,
0.6130623, 0.2918258, 0.07711709, 0.282353, 0, 1, 1,
0.6267071, -0.2767429, 3.767722, 0.2901961, 0, 1, 1,
0.6269544, 1.014346, 2.584486, 0.2941177, 0, 1, 1,
0.629635, 0.05714831, 2.381913, 0.3019608, 0, 1, 1,
0.6304615, 0.6358254, 1.642433, 0.3098039, 0, 1, 1,
0.63167, 0.9318606, 1.167473, 0.3137255, 0, 1, 1,
0.6403175, 1.091498, 0.9143885, 0.3215686, 0, 1, 1,
0.6407688, 0.4082089, -1.574208, 0.3254902, 0, 1, 1,
0.6419241, -0.963503, 2.620199, 0.3333333, 0, 1, 1,
0.6436429, -2.746928, 5.047122, 0.3372549, 0, 1, 1,
0.6461265, 1.368016, -0.01000079, 0.345098, 0, 1, 1,
0.6509324, -0.8291156, 2.031414, 0.3490196, 0, 1, 1,
0.6551527, -0.9537367, 2.401209, 0.3568628, 0, 1, 1,
0.6620895, 0.1582921, 1.332463, 0.3607843, 0, 1, 1,
0.6637042, 1.918529, -0.9738197, 0.3686275, 0, 1, 1,
0.6652602, -0.7150031, 2.933634, 0.372549, 0, 1, 1,
0.6654955, 0.3733865, 0.7275161, 0.3803922, 0, 1, 1,
0.6662424, 0.2529667, 0.9708815, 0.3843137, 0, 1, 1,
0.6679358, 0.06244041, 1.104797, 0.3921569, 0, 1, 1,
0.6773365, 1.264389, -0.3771414, 0.3960784, 0, 1, 1,
0.685771, 0.7575976, 2.297925, 0.4039216, 0, 1, 1,
0.6901299, 1.004432, 0.9489053, 0.4117647, 0, 1, 1,
0.6926587, -1.831895, 2.637409, 0.4156863, 0, 1, 1,
0.6955954, -0.836343, 3.998116, 0.4235294, 0, 1, 1,
0.6997903, 0.1010542, 1.965627, 0.427451, 0, 1, 1,
0.7002653, 0.6583081, -0.08556072, 0.4352941, 0, 1, 1,
0.7036675, 0.213151, 3.140726, 0.4392157, 0, 1, 1,
0.7077481, 0.1861885, 0.2883718, 0.4470588, 0, 1, 1,
0.7092256, 0.1077052, 1.409806, 0.4509804, 0, 1, 1,
0.7118074, -0.09824414, 2.171433, 0.4588235, 0, 1, 1,
0.7131684, 1.020968, -0.9952008, 0.4627451, 0, 1, 1,
0.7173283, -0.6516204, 2.026001, 0.4705882, 0, 1, 1,
0.7196987, -2.178387, 3.063776, 0.4745098, 0, 1, 1,
0.7206811, -0.2763645, -0.444788, 0.4823529, 0, 1, 1,
0.7213804, 0.5297719, 1.644597, 0.4862745, 0, 1, 1,
0.7215486, -0.8054501, 2.365188, 0.4941176, 0, 1, 1,
0.7235286, -2.162152, 2.046928, 0.5019608, 0, 1, 1,
0.7338889, 0.3085875, 2.135265, 0.5058824, 0, 1, 1,
0.7388753, -0.9689175, 1.963622, 0.5137255, 0, 1, 1,
0.7391239, -0.4772828, 0.9265941, 0.5176471, 0, 1, 1,
0.7433005, 2.152656, 1.4619, 0.5254902, 0, 1, 1,
0.74713, 1.325939, 0.2395608, 0.5294118, 0, 1, 1,
0.7474229, 0.8648137, -1.039861, 0.5372549, 0, 1, 1,
0.749299, 0.268812, 0.7309304, 0.5411765, 0, 1, 1,
0.7600088, -0.325742, -0.4335765, 0.5490196, 0, 1, 1,
0.7632155, -0.764973, 1.810173, 0.5529412, 0, 1, 1,
0.7769219, -1.287513, 2.719969, 0.5607843, 0, 1, 1,
0.7791381, 0.6979683, -2.370952, 0.5647059, 0, 1, 1,
0.7884626, -0.3263067, 1.544514, 0.572549, 0, 1, 1,
0.7908922, -0.9814287, 2.234602, 0.5764706, 0, 1, 1,
0.7926335, -0.5201691, 1.090267, 0.5843138, 0, 1, 1,
0.796174, 2.393502, 0.8505619, 0.5882353, 0, 1, 1,
0.7969998, -1.217354, 2.845858, 0.5960785, 0, 1, 1,
0.7973235, 1.834948, 0.5988113, 0.6039216, 0, 1, 1,
0.7977996, -0.2548251, 2.595054, 0.6078432, 0, 1, 1,
0.7981235, 0.224781, 0.3758769, 0.6156863, 0, 1, 1,
0.8015482, 0.3456188, 1.503393, 0.6196079, 0, 1, 1,
0.8028501, -0.1762627, 2.270746, 0.627451, 0, 1, 1,
0.8105133, 0.3570198, 1.996775, 0.6313726, 0, 1, 1,
0.8135729, -0.3624143, 1.502259, 0.6392157, 0, 1, 1,
0.8156378, 0.9196265, 0.2577659, 0.6431373, 0, 1, 1,
0.817522, -0.1066164, 0.684077, 0.6509804, 0, 1, 1,
0.8261379, -1.296088, 2.762919, 0.654902, 0, 1, 1,
0.8279771, 2.287524, 0.1771647, 0.6627451, 0, 1, 1,
0.8327307, 1.018075, 1.12092, 0.6666667, 0, 1, 1,
0.8366625, 0.05591587, 1.216131, 0.6745098, 0, 1, 1,
0.8409036, -0.8301355, 1.562702, 0.6784314, 0, 1, 1,
0.8456418, 1.663996, -0.5287368, 0.6862745, 0, 1, 1,
0.8468778, -0.3164434, 0.1469623, 0.6901961, 0, 1, 1,
0.8487527, -0.594166, 1.372248, 0.6980392, 0, 1, 1,
0.8508015, -0.2767844, 3.562007, 0.7058824, 0, 1, 1,
0.8552455, 0.0334334, 0.7122003, 0.7098039, 0, 1, 1,
0.8558133, -0.8551556, 4.866023, 0.7176471, 0, 1, 1,
0.8621275, -0.7299236, 2.053077, 0.7215686, 0, 1, 1,
0.8626605, -0.1543392, 1.110133, 0.7294118, 0, 1, 1,
0.8727165, -0.8095779, 2.568989, 0.7333333, 0, 1, 1,
0.8749378, 0.5109222, 1.493135, 0.7411765, 0, 1, 1,
0.8811027, -0.3228335, 1.606951, 0.7450981, 0, 1, 1,
0.8870026, -0.07827582, 0.4707262, 0.7529412, 0, 1, 1,
0.8924738, -1.515818, 1.621994, 0.7568628, 0, 1, 1,
0.8982539, -0.8325523, 1.694718, 0.7647059, 0, 1, 1,
0.8990064, -0.5694093, 0.8463721, 0.7686275, 0, 1, 1,
0.8999431, 1.294673, 1.65018, 0.7764706, 0, 1, 1,
0.9022432, -1.573381, 3.703814, 0.7803922, 0, 1, 1,
0.9096356, 0.4879915, 0.008325332, 0.7882353, 0, 1, 1,
0.9097686, 0.8009412, -0.1061588, 0.7921569, 0, 1, 1,
0.911705, 0.5871533, -0.09466329, 0.8, 0, 1, 1,
0.9243259, 1.051634, -0.3942106, 0.8078431, 0, 1, 1,
0.9251253, -1.398907, 2.470114, 0.8117647, 0, 1, 1,
0.9257353, -0.04377393, 2.872094, 0.8196079, 0, 1, 1,
0.927727, -0.3207677, 2.967303, 0.8235294, 0, 1, 1,
0.9279854, 2.251641, -1.333896, 0.8313726, 0, 1, 1,
0.9307441, 1.883108, 1.336107, 0.8352941, 0, 1, 1,
0.9313716, 0.910404, -0.4931965, 0.8431373, 0, 1, 1,
0.9332061, -1.138213, 3.030085, 0.8470588, 0, 1, 1,
0.9347017, -0.0243204, 1.725203, 0.854902, 0, 1, 1,
0.9355702, 1.999191, 0.9397047, 0.8588235, 0, 1, 1,
0.9381794, 0.8797057, -0.1355367, 0.8666667, 0, 1, 1,
0.9432389, 0.08482409, 1.912353, 0.8705882, 0, 1, 1,
0.9477672, 0.8828113, -0.07470123, 0.8784314, 0, 1, 1,
0.9502205, 0.4014835, 1.27061, 0.8823529, 0, 1, 1,
0.9502791, -1.666225, 2.915066, 0.8901961, 0, 1, 1,
0.9561582, -0.5572965, 1.923674, 0.8941177, 0, 1, 1,
0.9645038, -2.506005, 3.499757, 0.9019608, 0, 1, 1,
0.9672459, -1.524678, 1.171261, 0.9098039, 0, 1, 1,
0.9681771, 0.6419315, 1.538263, 0.9137255, 0, 1, 1,
0.9686064, -0.6250124, 2.301351, 0.9215686, 0, 1, 1,
0.9699427, 0.8730379, 1.188832, 0.9254902, 0, 1, 1,
0.9709117, 0.9392267, 0.2703529, 0.9333333, 0, 1, 1,
0.9724281, 1.779868, -0.5227399, 0.9372549, 0, 1, 1,
0.9779866, 1.242033, 0.2609385, 0.945098, 0, 1, 1,
0.9829972, -0.2627188, 0.3224609, 0.9490196, 0, 1, 1,
0.9835017, 1.360731, 0.9116648, 0.9568627, 0, 1, 1,
0.9862947, 0.1552347, 1.103313, 0.9607843, 0, 1, 1,
0.9916736, -0.3675656, 2.537587, 0.9686275, 0, 1, 1,
0.9993893, -1.785562, 2.565584, 0.972549, 0, 1, 1,
1.001082, 1.174986, 1.643977, 0.9803922, 0, 1, 1,
1.00478, -1.382075, 0.3474735, 0.9843137, 0, 1, 1,
1.012275, 0.9456156, 0.4221138, 0.9921569, 0, 1, 1,
1.01318, -0.7445261, 3.519211, 0.9960784, 0, 1, 1,
1.013283, -0.9628925, 2.520397, 1, 0, 0.9960784, 1,
1.015119, -0.5958308, 0.3081909, 1, 0, 0.9882353, 1,
1.019336, 0.372592, 0.8902273, 1, 0, 0.9843137, 1,
1.023541, 0.8672792, 0.9834111, 1, 0, 0.9764706, 1,
1.030599, -0.1000177, 0.3489476, 1, 0, 0.972549, 1,
1.03112, 0.03912007, 1.268932, 1, 0, 0.9647059, 1,
1.037301, 0.356641, 1.844029, 1, 0, 0.9607843, 1,
1.040541, -1.193211, 2.990935, 1, 0, 0.9529412, 1,
1.045506, 0.3834703, 0.5560821, 1, 0, 0.9490196, 1,
1.045584, -1.274865, 4.062816, 1, 0, 0.9411765, 1,
1.057827, -0.2921628, 1.968412, 1, 0, 0.9372549, 1,
1.061918, -0.1655316, 2.338404, 1, 0, 0.9294118, 1,
1.066567, 0.3570263, 0.4740366, 1, 0, 0.9254902, 1,
1.072315, -0.006935908, 1.917473, 1, 0, 0.9176471, 1,
1.080427, 0.1191004, 0.8538854, 1, 0, 0.9137255, 1,
1.083439, -1.486911, 2.793555, 1, 0, 0.9058824, 1,
1.092633, -2.532303, 2.708775, 1, 0, 0.9019608, 1,
1.094288, -0.1483997, 2.781285, 1, 0, 0.8941177, 1,
1.094864, 1.788078, -0.9906404, 1, 0, 0.8862745, 1,
1.097673, 0.2083949, 0.7702814, 1, 0, 0.8823529, 1,
1.107819, 0.7900781, 1.214978, 1, 0, 0.8745098, 1,
1.108353, 0.6892962, 0.4228289, 1, 0, 0.8705882, 1,
1.128725, 1.523759, -0.8787733, 1, 0, 0.8627451, 1,
1.137335, 1.099191, -0.437446, 1, 0, 0.8588235, 1,
1.14022, 0.05976271, 1.179285, 1, 0, 0.8509804, 1,
1.142916, 0.03642097, 0.9557402, 1, 0, 0.8470588, 1,
1.146378, 0.5396357, 1.317182, 1, 0, 0.8392157, 1,
1.15125, -1.187259, 1.930444, 1, 0, 0.8352941, 1,
1.154994, 0.2305203, 3.340409, 1, 0, 0.827451, 1,
1.155562, 3.433181, 1.360447, 1, 0, 0.8235294, 1,
1.165442, -0.1358143, 0.755443, 1, 0, 0.8156863, 1,
1.173076, -1.663263, 3.664391, 1, 0, 0.8117647, 1,
1.182858, 1.686099, -1.068439, 1, 0, 0.8039216, 1,
1.185902, 0.0842248, 1.666781, 1, 0, 0.7960784, 1,
1.198749, 2.071719, 0.3634759, 1, 0, 0.7921569, 1,
1.204981, 0.1183136, 0.6352717, 1, 0, 0.7843137, 1,
1.207554, -0.01699051, 4.048723, 1, 0, 0.7803922, 1,
1.208322, 0.5929175, 0.2184698, 1, 0, 0.772549, 1,
1.210966, 1.141188, 0.4769269, 1, 0, 0.7686275, 1,
1.217069, -1.023678, 4.485572, 1, 0, 0.7607843, 1,
1.226074, -0.06876832, 2.153517, 1, 0, 0.7568628, 1,
1.230783, 0.5604759, 1.71649, 1, 0, 0.7490196, 1,
1.233048, -0.08013403, 0.2246656, 1, 0, 0.7450981, 1,
1.254422, -0.1138559, 4.101385, 1, 0, 0.7372549, 1,
1.258119, 0.9098552, 0.02877948, 1, 0, 0.7333333, 1,
1.262233, 0.3237527, 1.048593, 1, 0, 0.7254902, 1,
1.267359, 1.215771, 0.03620714, 1, 0, 0.7215686, 1,
1.269886, -1.490936, 1.656933, 1, 0, 0.7137255, 1,
1.292086, -1.604205, 1.983595, 1, 0, 0.7098039, 1,
1.293357, -0.6830871, 0.4965115, 1, 0, 0.7019608, 1,
1.293976, -0.5580359, 0.7720602, 1, 0, 0.6941177, 1,
1.298303, -0.9205059, 1.766835, 1, 0, 0.6901961, 1,
1.307686, -1.088705, 3.858512, 1, 0, 0.682353, 1,
1.309048, -0.4039744, 1.316257, 1, 0, 0.6784314, 1,
1.310702, 0.09759722, 0.9128048, 1, 0, 0.6705883, 1,
1.315061, -0.5604213, 1.462237, 1, 0, 0.6666667, 1,
1.325323, -0.8268613, 1.728473, 1, 0, 0.6588235, 1,
1.326419, 0.5066863, 1.732515, 1, 0, 0.654902, 1,
1.336926, 0.5980457, 1.869193, 1, 0, 0.6470588, 1,
1.350334, 1.043684, -0.06344472, 1, 0, 0.6431373, 1,
1.35666, -0.3687851, 4.176201, 1, 0, 0.6352941, 1,
1.363568, -1.266656, 1.504192, 1, 0, 0.6313726, 1,
1.364081, 0.1964055, 1.229682, 1, 0, 0.6235294, 1,
1.368472, -0.1599274, 1.94394, 1, 0, 0.6196079, 1,
1.38338, -0.7406585, 3.61644, 1, 0, 0.6117647, 1,
1.384138, -1.334055, 3.225447, 1, 0, 0.6078432, 1,
1.385056, 1.15056, 1.522098, 1, 0, 0.6, 1,
1.398207, -0.8436314, 0.6118554, 1, 0, 0.5921569, 1,
1.407713, 0.8210307, 1.304783, 1, 0, 0.5882353, 1,
1.410706, -2.134898, 2.591917, 1, 0, 0.5803922, 1,
1.413445, -0.25577, 0.4706835, 1, 0, 0.5764706, 1,
1.413894, -1.098133, 3.353457, 1, 0, 0.5686275, 1,
1.427099, -0.1336142, 1.766018, 1, 0, 0.5647059, 1,
1.431179, 1.045655, -0.172347, 1, 0, 0.5568628, 1,
1.433256, 1.041448, 2.522803, 1, 0, 0.5529412, 1,
1.440154, 0.03998968, 1.808413, 1, 0, 0.5450981, 1,
1.444323, -2.061096, 2.629403, 1, 0, 0.5411765, 1,
1.4449, 1.519254, 0.9104016, 1, 0, 0.5333334, 1,
1.454312, 1.664467, 0.08795515, 1, 0, 0.5294118, 1,
1.458014, -0.9633594, 2.654299, 1, 0, 0.5215687, 1,
1.459844, -0.3926743, 2.975514, 1, 0, 0.5176471, 1,
1.470999, -1.042479, 0.9939967, 1, 0, 0.509804, 1,
1.478052, -0.8762186, 0.2464722, 1, 0, 0.5058824, 1,
1.482226, 0.3746279, 1.486767, 1, 0, 0.4980392, 1,
1.485042, 0.4825747, 2.666908, 1, 0, 0.4901961, 1,
1.508784, 1.543746, -0.1793532, 1, 0, 0.4862745, 1,
1.534726, -0.752143, 0.8095173, 1, 0, 0.4784314, 1,
1.544926, -0.6875724, 1.391903, 1, 0, 0.4745098, 1,
1.5459, 0.5784281, -0.3558965, 1, 0, 0.4666667, 1,
1.557117, -0.5881099, 2.16048, 1, 0, 0.4627451, 1,
1.563233, -1.145394, 0.4066755, 1, 0, 0.454902, 1,
1.56419, -0.4404309, 1.995536, 1, 0, 0.4509804, 1,
1.56755, -0.186294, 4.119135, 1, 0, 0.4431373, 1,
1.567623, 1.076128, 1.733073, 1, 0, 0.4392157, 1,
1.573369, -0.9599889, 2.424592, 1, 0, 0.4313726, 1,
1.57954, -1.017093, 0.2198344, 1, 0, 0.427451, 1,
1.581661, -1.512143, 3.874916, 1, 0, 0.4196078, 1,
1.583564, -0.1927576, 1.150361, 1, 0, 0.4156863, 1,
1.631169, -1.17346, 2.553691, 1, 0, 0.4078431, 1,
1.636149, -0.1111675, 1.116045, 1, 0, 0.4039216, 1,
1.643335, 1.115832, 1.023025, 1, 0, 0.3960784, 1,
1.645052, 0.3679334, 2.253503, 1, 0, 0.3882353, 1,
1.655441, 0.4338143, 1.332242, 1, 0, 0.3843137, 1,
1.695807, -1.073659, 0.6202962, 1, 0, 0.3764706, 1,
1.700436, 0.8231958, 0.9291427, 1, 0, 0.372549, 1,
1.701529, -0.914897, 2.289053, 1, 0, 0.3647059, 1,
1.702938, 1.370504, 2.995601, 1, 0, 0.3607843, 1,
1.703701, 0.1885938, 1.313662, 1, 0, 0.3529412, 1,
1.713043, 0.2297095, 0.2879335, 1, 0, 0.3490196, 1,
1.722623, 0.2490921, -0.3426241, 1, 0, 0.3411765, 1,
1.725289, 0.275425, 2.004003, 1, 0, 0.3372549, 1,
1.733579, 0.4328317, -0.1086774, 1, 0, 0.3294118, 1,
1.738657, 1.551201, 0.938691, 1, 0, 0.3254902, 1,
1.756885, 1.413371, 0.2115324, 1, 0, 0.3176471, 1,
1.756999, -0.1107213, 2.503678, 1, 0, 0.3137255, 1,
1.762434, -0.4264331, 1.327037, 1, 0, 0.3058824, 1,
1.768506, -0.002803487, 1.578388, 1, 0, 0.2980392, 1,
1.770675, 0.8756381, 0.4357461, 1, 0, 0.2941177, 1,
1.80036, -0.4449364, 1.709604, 1, 0, 0.2862745, 1,
1.833153, -0.08658557, 2.175438, 1, 0, 0.282353, 1,
1.833293, -1.219077, 1.733323, 1, 0, 0.2745098, 1,
1.884941, -0.1185807, 0.3218356, 1, 0, 0.2705882, 1,
1.895853, -0.04035804, -0.9015099, 1, 0, 0.2627451, 1,
1.896709, 0.04559981, 1.430516, 1, 0, 0.2588235, 1,
1.901083, -0.3856197, 1.42028, 1, 0, 0.2509804, 1,
1.922156, 0.5230297, 3.182544, 1, 0, 0.2470588, 1,
1.934844, -1.320539, 2.06427, 1, 0, 0.2392157, 1,
1.9594, -0.7526611, 1.801386, 1, 0, 0.2352941, 1,
1.965933, -1.349452, 2.631044, 1, 0, 0.227451, 1,
1.970534, 0.5757163, 2.439371, 1, 0, 0.2235294, 1,
1.971935, 0.3749135, 2.060715, 1, 0, 0.2156863, 1,
1.973092, -0.9349965, 2.348222, 1, 0, 0.2117647, 1,
1.982245, 0.0539341, 2.794732, 1, 0, 0.2039216, 1,
2.017487, 0.4875378, 0.7875131, 1, 0, 0.1960784, 1,
2.060561, -1.764331, 1.918497, 1, 0, 0.1921569, 1,
2.063472, 2.092052, 0.4486892, 1, 0, 0.1843137, 1,
2.075972, -0.6829082, 0.3556434, 1, 0, 0.1803922, 1,
2.087277, 0.7788675, 1.391111, 1, 0, 0.172549, 1,
2.090648, -0.4202125, 1.073433, 1, 0, 0.1686275, 1,
2.11518, -0.3768226, 2.408874, 1, 0, 0.1607843, 1,
2.139074, -0.9511813, 4.306394, 1, 0, 0.1568628, 1,
2.153037, -0.06499996, 1.443484, 1, 0, 0.1490196, 1,
2.169221, -2.072242, 1.628653, 1, 0, 0.145098, 1,
2.173277, 2.06457, 0.5322631, 1, 0, 0.1372549, 1,
2.184653, 1.389399, 1.856731, 1, 0, 0.1333333, 1,
2.217498, -0.2014056, 3.595875, 1, 0, 0.1254902, 1,
2.296432, 1.797974, 1.985976, 1, 0, 0.1215686, 1,
2.299881, 1.624803, 1.788648, 1, 0, 0.1137255, 1,
2.314434, -2.652536, 0.6604072, 1, 0, 0.1098039, 1,
2.398788, 1.046847, 0.7054685, 1, 0, 0.1019608, 1,
2.441733, 0.8817917, 1.331876, 1, 0, 0.09411765, 1,
2.449955, -0.7098724, 3.699237, 1, 0, 0.09019608, 1,
2.455459, 0.9955406, -0.4211114, 1, 0, 0.08235294, 1,
2.502293, 0.8967132, 1.639334, 1, 0, 0.07843138, 1,
2.513994, -0.7850887, 1.462989, 1, 0, 0.07058824, 1,
2.573618, -0.7093215, 2.158902, 1, 0, 0.06666667, 1,
2.610337, -0.7374594, 0.3167235, 1, 0, 0.05882353, 1,
2.721156, 1.409998, 0.1736611, 1, 0, 0.05490196, 1,
2.784486, -1.9055, 3.945846, 1, 0, 0.04705882, 1,
2.861098, -0.8965787, 2.397156, 1, 0, 0.04313726, 1,
2.914939, 0.029207, 1.31192, 1, 0, 0.03529412, 1,
2.964361, 1.295104, 2.407929, 1, 0, 0.03137255, 1,
3.058779, 0.7730792, 0.8988117, 1, 0, 0.02352941, 1,
3.117545, 2.131878, 0.3909668, 1, 0, 0.01960784, 1,
3.573506, -0.6953833, 1.692185, 1, 0, 0.01176471, 1,
3.634946, -0.2745756, 0.4632033, 1, 0, 0.007843138, 1
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
0.2956412, -4.62808, -7.508824, 0, -0.5, 0.5, 0.5,
0.2956412, -4.62808, -7.508824, 1, -0.5, 0.5, 0.5,
0.2956412, -4.62808, -7.508824, 1, 1.5, 0.5, 0.5,
0.2956412, -4.62808, -7.508824, 0, 1.5, 0.5, 0.5
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
-4.175688, -0.01327538, -7.508824, 0, -0.5, 0.5, 0.5,
-4.175688, -0.01327538, -7.508824, 1, -0.5, 0.5, 0.5,
-4.175688, -0.01327538, -7.508824, 1, 1.5, 0.5, 0.5,
-4.175688, -0.01327538, -7.508824, 0, 1.5, 0.5, 0.5
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
-4.175688, -4.62808, 0.1277943, 0, -0.5, 0.5, 0.5,
-4.175688, -4.62808, 0.1277943, 1, -0.5, 0.5, 0.5,
-4.175688, -4.62808, 0.1277943, 1, 1.5, 0.5, 0.5,
-4.175688, -4.62808, 0.1277943, 0, 1.5, 0.5, 0.5
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
-3, -3.563126, -5.746528,
3, -3.563126, -5.746528,
-3, -3.563126, -5.746528,
-3, -3.740618, -6.040244,
-2, -3.563126, -5.746528,
-2, -3.740618, -6.040244,
-1, -3.563126, -5.746528,
-1, -3.740618, -6.040244,
0, -3.563126, -5.746528,
0, -3.740618, -6.040244,
1, -3.563126, -5.746528,
1, -3.740618, -6.040244,
2, -3.563126, -5.746528,
2, -3.740618, -6.040244,
3, -3.563126, -5.746528,
3, -3.740618, -6.040244
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
-3, -4.095603, -6.627676, 0, -0.5, 0.5, 0.5,
-3, -4.095603, -6.627676, 1, -0.5, 0.5, 0.5,
-3, -4.095603, -6.627676, 1, 1.5, 0.5, 0.5,
-3, -4.095603, -6.627676, 0, 1.5, 0.5, 0.5,
-2, -4.095603, -6.627676, 0, -0.5, 0.5, 0.5,
-2, -4.095603, -6.627676, 1, -0.5, 0.5, 0.5,
-2, -4.095603, -6.627676, 1, 1.5, 0.5, 0.5,
-2, -4.095603, -6.627676, 0, 1.5, 0.5, 0.5,
-1, -4.095603, -6.627676, 0, -0.5, 0.5, 0.5,
-1, -4.095603, -6.627676, 1, -0.5, 0.5, 0.5,
-1, -4.095603, -6.627676, 1, 1.5, 0.5, 0.5,
-1, -4.095603, -6.627676, 0, 1.5, 0.5, 0.5,
0, -4.095603, -6.627676, 0, -0.5, 0.5, 0.5,
0, -4.095603, -6.627676, 1, -0.5, 0.5, 0.5,
0, -4.095603, -6.627676, 1, 1.5, 0.5, 0.5,
0, -4.095603, -6.627676, 0, 1.5, 0.5, 0.5,
1, -4.095603, -6.627676, 0, -0.5, 0.5, 0.5,
1, -4.095603, -6.627676, 1, -0.5, 0.5, 0.5,
1, -4.095603, -6.627676, 1, 1.5, 0.5, 0.5,
1, -4.095603, -6.627676, 0, 1.5, 0.5, 0.5,
2, -4.095603, -6.627676, 0, -0.5, 0.5, 0.5,
2, -4.095603, -6.627676, 1, -0.5, 0.5, 0.5,
2, -4.095603, -6.627676, 1, 1.5, 0.5, 0.5,
2, -4.095603, -6.627676, 0, 1.5, 0.5, 0.5,
3, -4.095603, -6.627676, 0, -0.5, 0.5, 0.5,
3, -4.095603, -6.627676, 1, -0.5, 0.5, 0.5,
3, -4.095603, -6.627676, 1, 1.5, 0.5, 0.5,
3, -4.095603, -6.627676, 0, 1.5, 0.5, 0.5
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
-3.143843, -3, -5.746528,
-3.143843, 3, -5.746528,
-3.143843, -3, -5.746528,
-3.315817, -3, -6.040244,
-3.143843, -2, -5.746528,
-3.315817, -2, -6.040244,
-3.143843, -1, -5.746528,
-3.315817, -1, -6.040244,
-3.143843, 0, -5.746528,
-3.315817, 0, -6.040244,
-3.143843, 1, -5.746528,
-3.315817, 1, -6.040244,
-3.143843, 2, -5.746528,
-3.315817, 2, -6.040244,
-3.143843, 3, -5.746528,
-3.315817, 3, -6.040244
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
-3.659765, -3, -6.627676, 0, -0.5, 0.5, 0.5,
-3.659765, -3, -6.627676, 1, -0.5, 0.5, 0.5,
-3.659765, -3, -6.627676, 1, 1.5, 0.5, 0.5,
-3.659765, -3, -6.627676, 0, 1.5, 0.5, 0.5,
-3.659765, -2, -6.627676, 0, -0.5, 0.5, 0.5,
-3.659765, -2, -6.627676, 1, -0.5, 0.5, 0.5,
-3.659765, -2, -6.627676, 1, 1.5, 0.5, 0.5,
-3.659765, -2, -6.627676, 0, 1.5, 0.5, 0.5,
-3.659765, -1, -6.627676, 0, -0.5, 0.5, 0.5,
-3.659765, -1, -6.627676, 1, -0.5, 0.5, 0.5,
-3.659765, -1, -6.627676, 1, 1.5, 0.5, 0.5,
-3.659765, -1, -6.627676, 0, 1.5, 0.5, 0.5,
-3.659765, 0, -6.627676, 0, -0.5, 0.5, 0.5,
-3.659765, 0, -6.627676, 1, -0.5, 0.5, 0.5,
-3.659765, 0, -6.627676, 1, 1.5, 0.5, 0.5,
-3.659765, 0, -6.627676, 0, 1.5, 0.5, 0.5,
-3.659765, 1, -6.627676, 0, -0.5, 0.5, 0.5,
-3.659765, 1, -6.627676, 1, -0.5, 0.5, 0.5,
-3.659765, 1, -6.627676, 1, 1.5, 0.5, 0.5,
-3.659765, 1, -6.627676, 0, 1.5, 0.5, 0.5,
-3.659765, 2, -6.627676, 0, -0.5, 0.5, 0.5,
-3.659765, 2, -6.627676, 1, -0.5, 0.5, 0.5,
-3.659765, 2, -6.627676, 1, 1.5, 0.5, 0.5,
-3.659765, 2, -6.627676, 0, 1.5, 0.5, 0.5,
-3.659765, 3, -6.627676, 0, -0.5, 0.5, 0.5,
-3.659765, 3, -6.627676, 1, -0.5, 0.5, 0.5,
-3.659765, 3, -6.627676, 1, 1.5, 0.5, 0.5,
-3.659765, 3, -6.627676, 0, 1.5, 0.5, 0.5
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
-3.143843, -3.563126, -4,
-3.143843, -3.563126, 4,
-3.143843, -3.563126, -4,
-3.315817, -3.740618, -4,
-3.143843, -3.563126, -2,
-3.315817, -3.740618, -2,
-3.143843, -3.563126, 0,
-3.315817, -3.740618, 0,
-3.143843, -3.563126, 2,
-3.315817, -3.740618, 2,
-3.143843, -3.563126, 4,
-3.315817, -3.740618, 4
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
-3.659765, -4.095603, -4, 0, -0.5, 0.5, 0.5,
-3.659765, -4.095603, -4, 1, -0.5, 0.5, 0.5,
-3.659765, -4.095603, -4, 1, 1.5, 0.5, 0.5,
-3.659765, -4.095603, -4, 0, 1.5, 0.5, 0.5,
-3.659765, -4.095603, -2, 0, -0.5, 0.5, 0.5,
-3.659765, -4.095603, -2, 1, -0.5, 0.5, 0.5,
-3.659765, -4.095603, -2, 1, 1.5, 0.5, 0.5,
-3.659765, -4.095603, -2, 0, 1.5, 0.5, 0.5,
-3.659765, -4.095603, 0, 0, -0.5, 0.5, 0.5,
-3.659765, -4.095603, 0, 1, -0.5, 0.5, 0.5,
-3.659765, -4.095603, 0, 1, 1.5, 0.5, 0.5,
-3.659765, -4.095603, 0, 0, 1.5, 0.5, 0.5,
-3.659765, -4.095603, 2, 0, -0.5, 0.5, 0.5,
-3.659765, -4.095603, 2, 1, -0.5, 0.5, 0.5,
-3.659765, -4.095603, 2, 1, 1.5, 0.5, 0.5,
-3.659765, -4.095603, 2, 0, 1.5, 0.5, 0.5,
-3.659765, -4.095603, 4, 0, -0.5, 0.5, 0.5,
-3.659765, -4.095603, 4, 1, -0.5, 0.5, 0.5,
-3.659765, -4.095603, 4, 1, 1.5, 0.5, 0.5,
-3.659765, -4.095603, 4, 0, 1.5, 0.5, 0.5
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
-3.143843, -3.563126, -5.746528,
-3.143843, 3.536575, -5.746528,
-3.143843, -3.563126, 6.002116,
-3.143843, 3.536575, 6.002116,
-3.143843, -3.563126, -5.746528,
-3.143843, -3.563126, 6.002116,
-3.143843, 3.536575, -5.746528,
-3.143843, 3.536575, 6.002116,
-3.143843, -3.563126, -5.746528,
3.735125, -3.563126, -5.746528,
-3.143843, -3.563126, 6.002116,
3.735125, -3.563126, 6.002116,
-3.143843, 3.536575, -5.746528,
3.735125, 3.536575, -5.746528,
-3.143843, 3.536575, 6.002116,
3.735125, 3.536575, 6.002116,
3.735125, -3.563126, -5.746528,
3.735125, 3.536575, -5.746528,
3.735125, -3.563126, 6.002116,
3.735125, 3.536575, 6.002116,
3.735125, -3.563126, -5.746528,
3.735125, -3.563126, 6.002116,
3.735125, 3.536575, -5.746528,
3.735125, 3.536575, 6.002116
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
var radius = 8.198934;
var distance = 36.47798;
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
mvMatrix.translate( -0.2956412, 0.01327538, -0.1277943 );
mvMatrix.scale( 1.288689, 1.248623, 0.7545422 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.47798);
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
Sowell<-read.table("Sowell.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sowell$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sowell' not found
```

```r
y<-Sowell$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sowell' not found
```

```r
z<-Sowell$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sowell' not found
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
-3.043664, 1.235227, -1.538729, 0, 0, 1, 1, 1,
-2.912411, -0.68998, -0.8634041, 1, 0, 0, 1, 1,
-2.858146, -0.1837868, -3.071329, 1, 0, 0, 1, 1,
-2.733322, 0.2313572, -1.35037, 1, 0, 0, 1, 1,
-2.591876, 0.5544636, -0.7614194, 1, 0, 0, 1, 1,
-2.567155, 0.8289993, -0.4438492, 1, 0, 0, 1, 1,
-2.497568, -0.8518372, -1.02285, 0, 0, 0, 1, 1,
-2.434972, -0.01400695, -2.946383, 0, 0, 0, 1, 1,
-2.320255, -0.9982544, -2.076389, 0, 0, 0, 1, 1,
-2.311675, 0.3148974, -2.04905, 0, 0, 0, 1, 1,
-2.307361, -0.4817474, -1.270058, 0, 0, 0, 1, 1,
-2.266425, 1.869188, -0.7599199, 0, 0, 0, 1, 1,
-2.18658, -1.478525, -1.559335, 0, 0, 0, 1, 1,
-2.176053, 0.3995304, -0.8056645, 1, 1, 1, 1, 1,
-2.163342, 0.6437854, -1.810327, 1, 1, 1, 1, 1,
-2.153535, -0.4596863, -3.756462, 1, 1, 1, 1, 1,
-2.119733, 0.01707979, -0.6746365, 1, 1, 1, 1, 1,
-2.103725, -0.7774298, -0.4721128, 1, 1, 1, 1, 1,
-2.094536, -1.276293, -1.910681, 1, 1, 1, 1, 1,
-2.05324, 0.4829097, -0.02851783, 1, 1, 1, 1, 1,
-2.037139, -1.68853, 1.250913, 1, 1, 1, 1, 1,
-2.01293, -0.1327425, -1.566075, 1, 1, 1, 1, 1,
-2.001913, 0.8445669, 0.3623596, 1, 1, 1, 1, 1,
-1.984879, -0.474317, -0.3620601, 1, 1, 1, 1, 1,
-1.969825, -0.009328804, -1.390683, 1, 1, 1, 1, 1,
-1.967291, -0.9785984, -3.135502, 1, 1, 1, 1, 1,
-1.953768, -0.5265912, -1.214171, 1, 1, 1, 1, 1,
-1.939473, -0.03751741, -0.2890767, 1, 1, 1, 1, 1,
-1.931241, 0.01273732, -1.870146, 0, 0, 1, 1, 1,
-1.930331, 2.418802, 0.6254303, 1, 0, 0, 1, 1,
-1.923215, -0.8012756, -1.556711, 1, 0, 0, 1, 1,
-1.914001, 0.1687318, -0.4938011, 1, 0, 0, 1, 1,
-1.911786, -0.4264349, -1.085903, 1, 0, 0, 1, 1,
-1.890929, -0.3190794, 0.2859083, 1, 0, 0, 1, 1,
-1.887421, 0.3143556, -1.913298, 0, 0, 0, 1, 1,
-1.875354, 0.7503992, -0.1122522, 0, 0, 0, 1, 1,
-1.856162, -0.2661647, -0.66258, 0, 0, 0, 1, 1,
-1.819551, 0.8132056, -1.685749, 0, 0, 0, 1, 1,
-1.813913, 1.618463, -0.3286429, 0, 0, 0, 1, 1,
-1.780152, 0.3008066, -2.408337, 0, 0, 0, 1, 1,
-1.773899, -0.1049902, -3.930461, 0, 0, 0, 1, 1,
-1.737273, 1.244311, -1.518646, 1, 1, 1, 1, 1,
-1.731717, -0.2257373, -3.03919, 1, 1, 1, 1, 1,
-1.728459, 0.1494837, -2.388652, 1, 1, 1, 1, 1,
-1.720658, 1.252921, -1.276091, 1, 1, 1, 1, 1,
-1.696302, 0.4555839, -2.6743, 1, 1, 1, 1, 1,
-1.69196, -0.06660943, -0.4041899, 1, 1, 1, 1, 1,
-1.680742, -0.7546917, 0.05533619, 1, 1, 1, 1, 1,
-1.637885, 1.208503, -0.550642, 1, 1, 1, 1, 1,
-1.624346, -1.475934, -2.879109, 1, 1, 1, 1, 1,
-1.621946, -0.6659369, -1.3317, 1, 1, 1, 1, 1,
-1.620613, -1.208959, -2.763531, 1, 1, 1, 1, 1,
-1.605807, 0.4324561, -2.509301, 1, 1, 1, 1, 1,
-1.605125, -0.9657496, -2.484276, 1, 1, 1, 1, 1,
-1.604478, -1.270937, -1.632134, 1, 1, 1, 1, 1,
-1.580866, 0.1341304, -0.996749, 1, 1, 1, 1, 1,
-1.564445, -0.3554388, -1.938012, 0, 0, 1, 1, 1,
-1.54287, 0.2496217, -1.755227, 1, 0, 0, 1, 1,
-1.533463, -0.362862, -1.050603, 1, 0, 0, 1, 1,
-1.522969, -1.390774, -2.236059, 1, 0, 0, 1, 1,
-1.511718, -0.2915326, -2.484749, 1, 0, 0, 1, 1,
-1.504476, -0.1183768, -0.285924, 1, 0, 0, 1, 1,
-1.493729, -0.1127455, -0.5581748, 0, 0, 0, 1, 1,
-1.48738, 1.344593, -0.5885707, 0, 0, 0, 1, 1,
-1.478408, -0.440405, -2.021566, 0, 0, 0, 1, 1,
-1.451114, 2.143659, -0.2331012, 0, 0, 0, 1, 1,
-1.449213, 0.5112804, -0.2263111, 0, 0, 0, 1, 1,
-1.444633, -0.9959382, -2.489125, 0, 0, 0, 1, 1,
-1.432743, -0.1323424, -3.525543, 0, 0, 0, 1, 1,
-1.427951, -0.4072931, 0.9864857, 1, 1, 1, 1, 1,
-1.421739, -0.385869, -2.462751, 1, 1, 1, 1, 1,
-1.418099, 2.028106, 0.8030282, 1, 1, 1, 1, 1,
-1.390502, -1.972989, -2.56602, 1, 1, 1, 1, 1,
-1.372691, 0.3363892, -2.279162, 1, 1, 1, 1, 1,
-1.368705, -0.913603, -3.058727, 1, 1, 1, 1, 1,
-1.367121, 0.2957767, -0.4972528, 1, 1, 1, 1, 1,
-1.362654, 0.2581472, -1.69097, 1, 1, 1, 1, 1,
-1.36127, 0.4945126, -1.829372, 1, 1, 1, 1, 1,
-1.360145, 1.627044, 0.8127329, 1, 1, 1, 1, 1,
-1.357391, 0.2257827, -1.542499, 1, 1, 1, 1, 1,
-1.351738, -1.915332, -2.496524, 1, 1, 1, 1, 1,
-1.345795, -0.3076054, -3.119778, 1, 1, 1, 1, 1,
-1.342378, -0.03575028, -1.452095, 1, 1, 1, 1, 1,
-1.33392, 0.09608193, -2.430472, 1, 1, 1, 1, 1,
-1.332965, 0.071305, -1.443255, 0, 0, 1, 1, 1,
-1.326308, 0.03593842, -1.287719, 1, 0, 0, 1, 1,
-1.322106, -0.9563674, -1.530755, 1, 0, 0, 1, 1,
-1.320726, -1.505177, -1.879327, 1, 0, 0, 1, 1,
-1.302712, 0.474395, -0.4840005, 1, 0, 0, 1, 1,
-1.296311, -1.004315, -1.12782, 1, 0, 0, 1, 1,
-1.281985, -0.1293097, -0.9461366, 0, 0, 0, 1, 1,
-1.26353, 0.0248898, -4.015838, 0, 0, 0, 1, 1,
-1.262449, -0.6940725, -1.90119, 0, 0, 0, 1, 1,
-1.26192, 0.7635859, -1.127093, 0, 0, 0, 1, 1,
-1.259107, -1.249673, -1.548387, 0, 0, 0, 1, 1,
-1.257002, 0.7297339, 0.06247997, 0, 0, 0, 1, 1,
-1.247486, 0.1420604, -1.798721, 0, 0, 0, 1, 1,
-1.242552, 1.746992, 0.405932, 1, 1, 1, 1, 1,
-1.241745, 0.8203664, -2.410504, 1, 1, 1, 1, 1,
-1.227524, -2.117324, -1.938554, 1, 1, 1, 1, 1,
-1.218285, -0.2375131, -0.6195796, 1, 1, 1, 1, 1,
-1.209852, -0.7653216, -1.432621, 1, 1, 1, 1, 1,
-1.208786, 0.3580078, -0.8967521, 1, 1, 1, 1, 1,
-1.20787, 0.2469004, -1.124401, 1, 1, 1, 1, 1,
-1.197976, 1.056629, -0.5311101, 1, 1, 1, 1, 1,
-1.191619, 0.0295773, -1.3796, 1, 1, 1, 1, 1,
-1.190228, 0.8642828, -0.1939232, 1, 1, 1, 1, 1,
-1.189048, -1.375301, -3.652379, 1, 1, 1, 1, 1,
-1.181786, -1.553572, -0.1691785, 1, 1, 1, 1, 1,
-1.181727, 0.1703793, -0.9376038, 1, 1, 1, 1, 1,
-1.181415, -1.431118, -4.009669, 1, 1, 1, 1, 1,
-1.177428, 0.5847543, -2.023114, 1, 1, 1, 1, 1,
-1.175312, -0.4343928, -1.916231, 0, 0, 1, 1, 1,
-1.159644, -0.6330964, -0.4346711, 1, 0, 0, 1, 1,
-1.141505, -0.2644293, -2.888931, 1, 0, 0, 1, 1,
-1.139487, -0.3409913, -2.126665, 1, 0, 0, 1, 1,
-1.13692, -0.4434602, -2.469312, 1, 0, 0, 1, 1,
-1.136247, -0.8206205, -1.572011, 1, 0, 0, 1, 1,
-1.125841, -2.258626, -1.786769, 0, 0, 0, 1, 1,
-1.124738, -0.3195063, -2.947124, 0, 0, 0, 1, 1,
-1.117049, -0.1742255, -1.698863, 0, 0, 0, 1, 1,
-1.115888, 1.936362, -0.298602, 0, 0, 0, 1, 1,
-1.10569, -0.05313128, -1.797238, 0, 0, 0, 1, 1,
-1.104048, 0.6257145, -0.5251581, 0, 0, 0, 1, 1,
-1.101155, -0.8126124, -2.89365, 0, 0, 0, 1, 1,
-1.092652, 0.9948213, -2.540067, 1, 1, 1, 1, 1,
-1.089455, -0.2774792, -3.401558, 1, 1, 1, 1, 1,
-1.082654, -0.147271, -1.171924, 1, 1, 1, 1, 1,
-1.082081, 0.8165547, -1.243759, 1, 1, 1, 1, 1,
-1.072617, 3.424122, -3.771436, 1, 1, 1, 1, 1,
-1.055663, 1.235172, -1.731637, 1, 1, 1, 1, 1,
-1.046037, 0.2773079, -1.820093, 1, 1, 1, 1, 1,
-1.045761, -0.957974, -2.245484, 1, 1, 1, 1, 1,
-1.04034, 1.766071, -1.063484, 1, 1, 1, 1, 1,
-1.034209, 0.02353191, -2.362274, 1, 1, 1, 1, 1,
-1.027245, -3.287526, -3.414034, 1, 1, 1, 1, 1,
-1.022967, -0.3830542, -1.725187, 1, 1, 1, 1, 1,
-1.019709, -0.4727552, -0.5523445, 1, 1, 1, 1, 1,
-1.016131, -0.9712715, -2.064719, 1, 1, 1, 1, 1,
-1.003959, 1.500956, -1.285303, 1, 1, 1, 1, 1,
-0.9902669, -1.270089, -2.29785, 0, 0, 1, 1, 1,
-0.9899047, 0.1011778, -1.669604, 1, 0, 0, 1, 1,
-0.985856, 0.04830402, -4.095018, 1, 0, 0, 1, 1,
-0.9816235, -0.2352094, 1.011658, 1, 0, 0, 1, 1,
-0.9764174, -0.07007205, -1.74677, 1, 0, 0, 1, 1,
-0.9752164, 0.3693519, -1.087537, 1, 0, 0, 1, 1,
-0.9659748, -2.595081, -1.813876, 0, 0, 0, 1, 1,
-0.9655013, -0.04324568, -1.07843, 0, 0, 0, 1, 1,
-0.9602847, -0.7924591, -3.473031, 0, 0, 0, 1, 1,
-0.9525095, 0.01659018, -2.100874, 0, 0, 0, 1, 1,
-0.9483314, -0.847051, -1.263821, 0, 0, 0, 1, 1,
-0.9426044, 0.3212122, -1.203432, 0, 0, 0, 1, 1,
-0.9309177, 1.497598, -1.112434, 0, 0, 0, 1, 1,
-0.9293023, -0.5398329, -2.813387, 1, 1, 1, 1, 1,
-0.9274795, -1.190169, -1.622635, 1, 1, 1, 1, 1,
-0.9238597, 0.2861959, -0.2536527, 1, 1, 1, 1, 1,
-0.9208564, 0.2768891, -2.302325, 1, 1, 1, 1, 1,
-0.9196514, 0.1934305, -1.934886, 1, 1, 1, 1, 1,
-0.9187361, -2.166476, -1.683622, 1, 1, 1, 1, 1,
-0.9151325, 0.5150614, -1.05703, 1, 1, 1, 1, 1,
-0.9150743, -0.2798697, -4.526924, 1, 1, 1, 1, 1,
-0.9098315, 0.3728007, -1.240915, 1, 1, 1, 1, 1,
-0.9050871, 0.5055543, 0.4979566, 1, 1, 1, 1, 1,
-0.903402, 0.1206236, -1.321971, 1, 1, 1, 1, 1,
-0.9027399, -1.143934, -2.435471, 1, 1, 1, 1, 1,
-0.8940917, 1.818235, -0.8977506, 1, 1, 1, 1, 1,
-0.8871391, 1.405881, -0.1471505, 1, 1, 1, 1, 1,
-0.8778331, -1.326428, -2.468769, 1, 1, 1, 1, 1,
-0.873763, 0.2136612, -2.49601, 0, 0, 1, 1, 1,
-0.8669044, 1.210225, -3.074336, 1, 0, 0, 1, 1,
-0.8665587, 1.466521, 0.6314085, 1, 0, 0, 1, 1,
-0.8646368, -0.9341841, -1.269724, 1, 0, 0, 1, 1,
-0.8628963, 1.373566, -1.259718, 1, 0, 0, 1, 1,
-0.8586676, 0.004089264, -0.8856364, 1, 0, 0, 1, 1,
-0.8567609, 0.882224, -1.185027, 0, 0, 0, 1, 1,
-0.8440746, 0.8993108, -1.394129, 0, 0, 0, 1, 1,
-0.8422802, 0.08977861, -3.54856, 0, 0, 0, 1, 1,
-0.837707, 1.56809, -1.760261, 0, 0, 0, 1, 1,
-0.8323636, -0.08064614, -1.442055, 0, 0, 0, 1, 1,
-0.831406, -1.144116, -2.804796, 0, 0, 0, 1, 1,
-0.8283085, -0.3621564, -1.934472, 0, 0, 0, 1, 1,
-0.8266234, -1.411096, -1.010692, 1, 1, 1, 1, 1,
-0.8153397, -0.9518536, -1.73335, 1, 1, 1, 1, 1,
-0.8105509, -0.8170716, -3.065113, 1, 1, 1, 1, 1,
-0.8073639, -0.6457624, -3.284433, 1, 1, 1, 1, 1,
-0.8070108, -0.7372955, -2.777694, 1, 1, 1, 1, 1,
-0.802774, 0.3542402, -2.441819, 1, 1, 1, 1, 1,
-0.8022146, -1.991987, -1.180813, 1, 1, 1, 1, 1,
-0.7976863, -0.5092871, -2.655589, 1, 1, 1, 1, 1,
-0.7953821, 0.8468636, 0.2475843, 1, 1, 1, 1, 1,
-0.7925318, 0.9470277, 1.867956, 1, 1, 1, 1, 1,
-0.790182, 0.3981209, -1.256618, 1, 1, 1, 1, 1,
-0.7865395, -0.2974289, -1.154216, 1, 1, 1, 1, 1,
-0.785328, 0.2306357, -2.292176, 1, 1, 1, 1, 1,
-0.7796879, -0.4712283, -3.803426, 1, 1, 1, 1, 1,
-0.7791076, 0.4181373, -1.730675, 1, 1, 1, 1, 1,
-0.7783332, 0.4944826, -1.171975, 0, 0, 1, 1, 1,
-0.7780982, -1.679576, -2.835138, 1, 0, 0, 1, 1,
-0.7713384, -0.1504016, -2.068852, 1, 0, 0, 1, 1,
-0.7674122, 1.229433, -1.936093, 1, 0, 0, 1, 1,
-0.7656392, -0.8084449, -2.38968, 1, 0, 0, 1, 1,
-0.7640529, -1.992691, -3.645612, 1, 0, 0, 1, 1,
-0.7636814, -0.8860812, -1.794301, 0, 0, 0, 1, 1,
-0.7537674, 0.08438209, -1.347565, 0, 0, 0, 1, 1,
-0.7534463, -2.094128, -2.452062, 0, 0, 0, 1, 1,
-0.7528442, -0.4909872, -2.840571, 0, 0, 0, 1, 1,
-0.7491089, 1.26653, -0.7161315, 0, 0, 0, 1, 1,
-0.7477297, -1.278042, -1.992932, 0, 0, 0, 1, 1,
-0.7454917, -0.830465, -5.575431, 0, 0, 0, 1, 1,
-0.7453245, -0.4040284, -2.590958, 1, 1, 1, 1, 1,
-0.7434482, -0.06118837, -2.356615, 1, 1, 1, 1, 1,
-0.7388899, -1.661297, -2.057097, 1, 1, 1, 1, 1,
-0.7377201, 2.158991, 0.4303184, 1, 1, 1, 1, 1,
-0.7361355, 1.679775, -1.163737, 1, 1, 1, 1, 1,
-0.7350492, 0.8699607, 1.073579, 1, 1, 1, 1, 1,
-0.730963, -0.3808658, -0.3245681, 1, 1, 1, 1, 1,
-0.7270662, 0.1598289, -0.733209, 1, 1, 1, 1, 1,
-0.7250666, 1.196687, -0.91265, 1, 1, 1, 1, 1,
-0.7221109, 0.4251806, -0.5950947, 1, 1, 1, 1, 1,
-0.7158557, -0.3116278, -2.111755, 1, 1, 1, 1, 1,
-0.7082402, -1.819871, -4.257789, 1, 1, 1, 1, 1,
-0.7055887, -1.920314, -3.229838, 1, 1, 1, 1, 1,
-0.7016265, -0.2799257, -1.465391, 1, 1, 1, 1, 1,
-0.701246, 1.386788, -0.9064717, 1, 1, 1, 1, 1,
-0.6994808, -1.874105, -3.324877, 0, 0, 1, 1, 1,
-0.6992513, -0.03935584, -1.064198, 1, 0, 0, 1, 1,
-0.6969479, 0.3664645, -1.778687, 1, 0, 0, 1, 1,
-0.696361, 0.4443676, -0.8686644, 1, 0, 0, 1, 1,
-0.6963436, -1.614301, -3.72071, 1, 0, 0, 1, 1,
-0.6959406, 1.061465, -1.129002, 1, 0, 0, 1, 1,
-0.6933908, -1.536472, -4.011291, 0, 0, 0, 1, 1,
-0.6931608, 0.07349999, 0.2529972, 0, 0, 0, 1, 1,
-0.6927983, 0.4771236, -0.3360084, 0, 0, 0, 1, 1,
-0.6926801, 0.06121269, -0.947956, 0, 0, 0, 1, 1,
-0.6884274, 0.8616418, 0.07394003, 0, 0, 0, 1, 1,
-0.6869445, 0.6913027, -1.264927, 0, 0, 0, 1, 1,
-0.6811138, 1.492234, 0.3214566, 0, 0, 0, 1, 1,
-0.6772454, -0.5739607, -2.570726, 1, 1, 1, 1, 1,
-0.6740151, -0.7076675, -1.958388, 1, 1, 1, 1, 1,
-0.669105, -1.129146, -3.059578, 1, 1, 1, 1, 1,
-0.6631953, 1.291812, 0.1710359, 1, 1, 1, 1, 1,
-0.6598825, 1.576225, -0.06583607, 1, 1, 1, 1, 1,
-0.6565223, 0.145224, -0.9099042, 1, 1, 1, 1, 1,
-0.6552069, -1.245265, -4.421418, 1, 1, 1, 1, 1,
-0.6532398, 0.3295461, -0.5450401, 1, 1, 1, 1, 1,
-0.6529522, 0.5556722, -1.71542, 1, 1, 1, 1, 1,
-0.6520539, -0.4859721, -0.9754447, 1, 1, 1, 1, 1,
-0.6504301, 0.06508828, -2.787471, 1, 1, 1, 1, 1,
-0.6498461, 0.3975329, 0.5440781, 1, 1, 1, 1, 1,
-0.6464548, 0.5608076, -0.6295228, 1, 1, 1, 1, 1,
-0.6452768, 0.8771603, -0.7037857, 1, 1, 1, 1, 1,
-0.6428349, 2.419743, -0.4617308, 1, 1, 1, 1, 1,
-0.6398785, 1.598968, -0.8324334, 0, 0, 1, 1, 1,
-0.6372154, -0.5018694, 0.001987674, 1, 0, 0, 1, 1,
-0.6342414, -0.1640891, -1.354258, 1, 0, 0, 1, 1,
-0.6335118, 0.3293155, -0.9313179, 1, 0, 0, 1, 1,
-0.6291516, -1.25064, -1.357792, 1, 0, 0, 1, 1,
-0.629015, -0.04605745, -2.826078, 1, 0, 0, 1, 1,
-0.6283165, 0.8974262, -2.226056, 0, 0, 0, 1, 1,
-0.6270251, -1.292106, -2.273337, 0, 0, 0, 1, 1,
-0.6267293, -0.4319206, -3.756516, 0, 0, 0, 1, 1,
-0.6196301, -0.5406888, -2.106011, 0, 0, 0, 1, 1,
-0.6189365, -0.185997, -1.573698, 0, 0, 0, 1, 1,
-0.6187037, 0.8758649, -1.435285, 0, 0, 0, 1, 1,
-0.6171409, 0.1814792, -1.823509, 0, 0, 0, 1, 1,
-0.6166369, 0.6941112, -0.8763853, 1, 1, 1, 1, 1,
-0.6152665, 0.04186952, -1.878133, 1, 1, 1, 1, 1,
-0.612382, -1.533161, -2.441874, 1, 1, 1, 1, 1,
-0.6060735, 0.7996197, -2.237875, 1, 1, 1, 1, 1,
-0.6048648, 2.441888, -1.879129, 1, 1, 1, 1, 1,
-0.5975846, -1.115597, -1.624719, 1, 1, 1, 1, 1,
-0.5956933, 0.3772006, -1.706297, 1, 1, 1, 1, 1,
-0.5899874, -1.087881, -2.743023, 1, 1, 1, 1, 1,
-0.5899665, -0.1243783, -1.736542, 1, 1, 1, 1, 1,
-0.5888167, -1.965822, -3.047896, 1, 1, 1, 1, 1,
-0.5857667, -0.5758156, -3.483135, 1, 1, 1, 1, 1,
-0.5791221, -0.2918321, -2.640369, 1, 1, 1, 1, 1,
-0.5781964, -1.08095, -5.261709, 1, 1, 1, 1, 1,
-0.5725437, 0.6885664, 0.9844738, 1, 1, 1, 1, 1,
-0.5722319, -0.02579779, -1.336352, 1, 1, 1, 1, 1,
-0.5705622, -0.3155532, -2.995264, 0, 0, 1, 1, 1,
-0.5658672, 0.3992268, -1.823656, 1, 0, 0, 1, 1,
-0.5589952, -1.323926, -2.374414, 1, 0, 0, 1, 1,
-0.5557002, 2.762694, -0.8768826, 1, 0, 0, 1, 1,
-0.5530626, -1.068686, -2.059783, 1, 0, 0, 1, 1,
-0.5502663, -0.963808, -2.250907, 1, 0, 0, 1, 1,
-0.5463319, 0.4986251, -1.558637, 0, 0, 0, 1, 1,
-0.5456124, -1.213779, -2.874671, 0, 0, 0, 1, 1,
-0.5453773, -1.260151, -1.704977, 0, 0, 0, 1, 1,
-0.5381576, 1.379369, -1.772163, 0, 0, 0, 1, 1,
-0.5379408, 1.816022, -2.127137, 0, 0, 0, 1, 1,
-0.5372475, -0.4572339, -2.299047, 0, 0, 0, 1, 1,
-0.5363364, 0.03123028, -1.194468, 0, 0, 0, 1, 1,
-0.5348887, -0.8839424, -2.266323, 1, 1, 1, 1, 1,
-0.531719, -1.751822, -3.63022, 1, 1, 1, 1, 1,
-0.5313929, -0.2201551, -2.033478, 1, 1, 1, 1, 1,
-0.5301195, -1.072348, -3.356508, 1, 1, 1, 1, 1,
-0.5268245, -1.599654, -4.219634, 1, 1, 1, 1, 1,
-0.5230499, 0.2862177, -0.8217298, 1, 1, 1, 1, 1,
-0.5200288, 1.77969, -1.999208, 1, 1, 1, 1, 1,
-0.5185602, 0.7434483, -0.9732794, 1, 1, 1, 1, 1,
-0.5162188, -0.8994697, -3.71159, 1, 1, 1, 1, 1,
-0.5142483, -1.093793, -3.178887, 1, 1, 1, 1, 1,
-0.5137631, -1.331721, -2.63973, 1, 1, 1, 1, 1,
-0.5083235, -1.082648, -4.328143, 1, 1, 1, 1, 1,
-0.5026807, 0.04680383, -2.307182, 1, 1, 1, 1, 1,
-0.4996703, 0.2744826, -0.112564, 1, 1, 1, 1, 1,
-0.4989014, -0.01634037, -1.324478, 1, 1, 1, 1, 1,
-0.4988296, -0.9127518, -3.144852, 0, 0, 1, 1, 1,
-0.4985813, 0.1895251, -0.6060299, 1, 0, 0, 1, 1,
-0.4965404, 0.2332065, -2.777629, 1, 0, 0, 1, 1,
-0.4876859, -0.2399316, -2.021015, 1, 0, 0, 1, 1,
-0.4876042, -2.592449, -4.461365, 1, 0, 0, 1, 1,
-0.4812396, -0.6165879, -2.126318, 1, 0, 0, 1, 1,
-0.4799219, -0.7014434, -1.423159, 0, 0, 0, 1, 1,
-0.4747591, -0.06090478, -1.704309, 0, 0, 0, 1, 1,
-0.4726004, -0.3357773, -1.490611, 0, 0, 0, 1, 1,
-0.4698744, -0.8633881, -3.552758, 0, 0, 0, 1, 1,
-0.4695966, 2.013455, -0.06994025, 0, 0, 0, 1, 1,
-0.4657414, 0.4570708, -1.354679, 0, 0, 0, 1, 1,
-0.4656706, -2.592005, -4.810852, 0, 0, 0, 1, 1,
-0.4618316, -1.621198, -2.213954, 1, 1, 1, 1, 1,
-0.4598407, -1.315226, -3.085324, 1, 1, 1, 1, 1,
-0.453045, 0.9229862, -1.434407, 1, 1, 1, 1, 1,
-0.4520118, -0.03828311, 0.5851921, 1, 1, 1, 1, 1,
-0.4518577, 0.1101775, -2.230764, 1, 1, 1, 1, 1,
-0.445552, -0.3271961, -2.279706, 1, 1, 1, 1, 1,
-0.444026, 0.8664517, -1.576709, 1, 1, 1, 1, 1,
-0.440176, 0.2279491, -1.897271, 1, 1, 1, 1, 1,
-0.4393139, -0.7234574, -3.650469, 1, 1, 1, 1, 1,
-0.4377925, 0.3464397, -0.2809592, 1, 1, 1, 1, 1,
-0.4346282, -0.6114466, -3.454126, 1, 1, 1, 1, 1,
-0.4281733, -0.616715, -2.173478, 1, 1, 1, 1, 1,
-0.4239596, 0.6712081, -1.091532, 1, 1, 1, 1, 1,
-0.4208411, 0.919091, -0.937874, 1, 1, 1, 1, 1,
-0.418114, 1.404082, -1.566812, 1, 1, 1, 1, 1,
-0.4169819, 0.697392, -0.4287093, 0, 0, 1, 1, 1,
-0.4153204, -0.25488, -2.494171, 1, 0, 0, 1, 1,
-0.4126277, 0.05761947, -2.538964, 1, 0, 0, 1, 1,
-0.4074818, 0.7498546, -0.4764587, 1, 0, 0, 1, 1,
-0.4065645, 1.632079, -1.390073, 1, 0, 0, 1, 1,
-0.4047233, 1.371267, -0.6595899, 1, 0, 0, 1, 1,
-0.4000635, -1.189289, -2.370278, 0, 0, 0, 1, 1,
-0.3987661, 0.6517155, -0.3862216, 0, 0, 0, 1, 1,
-0.3946302, 0.2229713, 0.1000843, 0, 0, 0, 1, 1,
-0.3928609, -1.926155, -2.548562, 0, 0, 0, 1, 1,
-0.391805, 0.8299567, -0.5349769, 0, 0, 0, 1, 1,
-0.3871262, -0.2887317, -4.003225, 0, 0, 0, 1, 1,
-0.3863503, 0.9509117, -1.416215, 0, 0, 0, 1, 1,
-0.3797454, -0.3568539, -0.4724666, 1, 1, 1, 1, 1,
-0.3772989, 1.950331, 0.9752539, 1, 1, 1, 1, 1,
-0.375952, -1.264685, -3.399667, 1, 1, 1, 1, 1,
-0.3739719, -1.233021, -4.914332, 1, 1, 1, 1, 1,
-0.3724478, 1.270327, 0.766528, 1, 1, 1, 1, 1,
-0.3635438, 1.346225, -0.7360157, 1, 1, 1, 1, 1,
-0.3631063, -0.5579209, -2.30967, 1, 1, 1, 1, 1,
-0.359769, -1.328292, -1.927477, 1, 1, 1, 1, 1,
-0.3500699, -0.375829, -2.169555, 1, 1, 1, 1, 1,
-0.3481694, -1.206406, -4.204298, 1, 1, 1, 1, 1,
-0.3448147, -0.5138572, -3.193579, 1, 1, 1, 1, 1,
-0.3432502, -1.751855, -0.9424411, 1, 1, 1, 1, 1,
-0.3307675, 0.7264879, -0.0260768, 1, 1, 1, 1, 1,
-0.3279472, -0.5471812, -3.502587, 1, 1, 1, 1, 1,
-0.3229862, 0.5185496, -1.690392, 1, 1, 1, 1, 1,
-0.3202145, 0.04261022, -1.787907, 0, 0, 1, 1, 1,
-0.3160009, 1.44969, -1.217768, 1, 0, 0, 1, 1,
-0.3131971, -0.1368783, -2.272763, 1, 0, 0, 1, 1,
-0.3091981, -1.132693, -2.013197, 1, 0, 0, 1, 1,
-0.3050989, -0.6981073, -3.211625, 1, 0, 0, 1, 1,
-0.3034533, 0.2178093, -0.2551774, 1, 0, 0, 1, 1,
-0.3019528, -2.341766, -2.794529, 0, 0, 0, 1, 1,
-0.3017517, 0.880977, 0.8698316, 0, 0, 0, 1, 1,
-0.2991579, 0.8884889, 0.5180556, 0, 0, 0, 1, 1,
-0.298953, 2.07571, -0.6593548, 0, 0, 0, 1, 1,
-0.2974286, 0.7697882, -0.7550539, 0, 0, 0, 1, 1,
-0.2970814, -0.1532076, -1.81376, 0, 0, 0, 1, 1,
-0.2957053, -0.1212783, -2.875642, 0, 0, 0, 1, 1,
-0.2922432, 0.6964906, -0.5931005, 1, 1, 1, 1, 1,
-0.2918317, 0.4256237, -2.534237, 1, 1, 1, 1, 1,
-0.2903646, -0.2719612, -1.983685, 1, 1, 1, 1, 1,
-0.2900288, -1.848625, -1.680865, 1, 1, 1, 1, 1,
-0.2880943, 0.3081884, -0.5142301, 1, 1, 1, 1, 1,
-0.2872398, -1.67735, -0.003936598, 1, 1, 1, 1, 1,
-0.2867675, 0.9869196, -1.348693, 1, 1, 1, 1, 1,
-0.2788711, 1.832129, 0.1190764, 1, 1, 1, 1, 1,
-0.2768317, 0.4640688, -0.1449545, 1, 1, 1, 1, 1,
-0.2761627, -0.7406532, -4.431765, 1, 1, 1, 1, 1,
-0.275548, -1.350379, -3.860892, 1, 1, 1, 1, 1,
-0.2740319, 0.4223992, -1.012749, 1, 1, 1, 1, 1,
-0.2718536, 2.248905, -0.8403339, 1, 1, 1, 1, 1,
-0.2694058, 0.2424235, -0.3386219, 1, 1, 1, 1, 1,
-0.2674573, 0.519905, 0.2522939, 1, 1, 1, 1, 1,
-0.2652554, 1.081996, -1.228261, 0, 0, 1, 1, 1,
-0.2652027, -0.8161497, -4.764432, 1, 0, 0, 1, 1,
-0.2615, 0.02749962, 0.43589, 1, 0, 0, 1, 1,
-0.2613649, -2.731011, -1.970621, 1, 0, 0, 1, 1,
-0.2597522, 1.08706, -0.2928904, 1, 0, 0, 1, 1,
-0.2556509, 2.288111, 0.129458, 1, 0, 0, 1, 1,
-0.2507937, -2.053607, -2.862491, 0, 0, 0, 1, 1,
-0.249198, -3.078685, -3.022932, 0, 0, 0, 1, 1,
-0.2488769, 0.1075283, -1.892434, 0, 0, 0, 1, 1,
-0.2472842, -1.061827, -3.164173, 0, 0, 0, 1, 1,
-0.2455115, -0.06770077, -1.559833, 0, 0, 0, 1, 1,
-0.2451154, -1.318175, -3.769871, 0, 0, 0, 1, 1,
-0.2414084, 0.7042259, -0.3599398, 0, 0, 0, 1, 1,
-0.2413669, 0.2924265, 0.9024239, 1, 1, 1, 1, 1,
-0.2379589, -0.2762213, -1.759215, 1, 1, 1, 1, 1,
-0.2362424, 0.4626382, -0.1793174, 1, 1, 1, 1, 1,
-0.2353299, -1.165118, -2.525103, 1, 1, 1, 1, 1,
-0.2315814, 2.290219, -1.9026, 1, 1, 1, 1, 1,
-0.2307408, 0.8165879, -0.7783545, 1, 1, 1, 1, 1,
-0.2240253, -0.5667614, -4.661992, 1, 1, 1, 1, 1,
-0.2226664, 0.4499999, -0.8549504, 1, 1, 1, 1, 1,
-0.221676, -0.2088104, -0.4049447, 1, 1, 1, 1, 1,
-0.2174826, -0.115918, -0.8838341, 1, 1, 1, 1, 1,
-0.2155489, 1.359232, 0.40962, 1, 1, 1, 1, 1,
-0.2121774, 0.2281448, -0.7139813, 1, 1, 1, 1, 1,
-0.210958, 0.4308007, -0.4607544, 1, 1, 1, 1, 1,
-0.207262, -0.5875114, -2.091049, 1, 1, 1, 1, 1,
-0.2016338, 1.918348, -0.2441805, 1, 1, 1, 1, 1,
-0.1978707, 0.4204524, 1.586116, 0, 0, 1, 1, 1,
-0.1961648, -0.2186614, -1.724454, 1, 0, 0, 1, 1,
-0.194111, -0.5557457, -1.987601, 1, 0, 0, 1, 1,
-0.1868563, 2.479832, -0.3346272, 1, 0, 0, 1, 1,
-0.1865301, 0.1719069, -0.7286755, 1, 0, 0, 1, 1,
-0.183768, -0.5651791, -3.705136, 1, 0, 0, 1, 1,
-0.1828425, 0.9105703, -0.5870856, 0, 0, 0, 1, 1,
-0.1821088, 0.8251022, 0.3491607, 0, 0, 0, 1, 1,
-0.1805992, 0.2039792, -0.9117089, 0, 0, 0, 1, 1,
-0.1788819, -0.5390046, -2.934295, 0, 0, 0, 1, 1,
-0.1776939, -0.540481, -2.536977, 0, 0, 0, 1, 1,
-0.175648, 0.8361107, -0.6814417, 0, 0, 0, 1, 1,
-0.1718086, -0.09996162, -2.431692, 0, 0, 0, 1, 1,
-0.1706437, 1.863423, 0.9705457, 1, 1, 1, 1, 1,
-0.1662217, 0.05000696, -0.2066, 1, 1, 1, 1, 1,
-0.1631228, 1.207308, 0.7301384, 1, 1, 1, 1, 1,
-0.1533313, 1.122425, 0.5236316, 1, 1, 1, 1, 1,
-0.1461267, -0.501484, -1.881968, 1, 1, 1, 1, 1,
-0.1458883, 0.5858143, 0.5491284, 1, 1, 1, 1, 1,
-0.1448531, -0.2648149, -2.039698, 1, 1, 1, 1, 1,
-0.1445191, -0.2132308, -2.445868, 1, 1, 1, 1, 1,
-0.1431906, -0.6342896, -2.696915, 1, 1, 1, 1, 1,
-0.1402187, 0.09057185, -1.142965, 1, 1, 1, 1, 1,
-0.1390419, -2.185323, -3.421307, 1, 1, 1, 1, 1,
-0.1374743, -2.67888, -2.897499, 1, 1, 1, 1, 1,
-0.1370303, 0.2221751, -1.010917, 1, 1, 1, 1, 1,
-0.1337289, -0.6044958, -2.851406, 1, 1, 1, 1, 1,
-0.1334121, 2.233734, 0.2057014, 1, 1, 1, 1, 1,
-0.1329955, -0.1778779, -1.156012, 0, 0, 1, 1, 1,
-0.132665, -0.07435866, -2.311399, 1, 0, 0, 1, 1,
-0.1313305, -0.4078286, -2.653944, 1, 0, 0, 1, 1,
-0.1305029, 0.9938078, -0.8131823, 1, 0, 0, 1, 1,
-0.1301192, 0.8839894, -1.639608, 1, 0, 0, 1, 1,
-0.1288575, 1.533363, 0.3967653, 1, 0, 0, 1, 1,
-0.1218551, -2.57548, -3.725208, 0, 0, 0, 1, 1,
-0.1166704, 0.8477852, -2.16801, 0, 0, 0, 1, 1,
-0.1153176, 2.251362, 0.03939764, 0, 0, 0, 1, 1,
-0.1146359, 0.5691909, 0.1121408, 0, 0, 0, 1, 1,
-0.1143528, -1.848394, -2.906271, 0, 0, 0, 1, 1,
-0.1090734, 0.9937984, -0.5571487, 0, 0, 0, 1, 1,
-0.0968646, 0.6222637, -2.829508, 0, 0, 0, 1, 1,
-0.09597891, 0.7386589, -1.015894, 1, 1, 1, 1, 1,
-0.09424221, 1.58886, 1.244631, 1, 1, 1, 1, 1,
-0.09190898, -1.016159, -4.980357, 1, 1, 1, 1, 1,
-0.09081362, -0.4468112, -2.139101, 1, 1, 1, 1, 1,
-0.08871578, -1.330652, -1.31488, 1, 1, 1, 1, 1,
-0.0876481, -1.913411, -2.514261, 1, 1, 1, 1, 1,
-0.08576144, -1.132448, -3.705641, 1, 1, 1, 1, 1,
-0.08236212, 0.781303, 1.069127, 1, 1, 1, 1, 1,
-0.08168189, 0.1162878, -1.23148, 1, 1, 1, 1, 1,
-0.0816671, 0.7025924, -0.7422884, 1, 1, 1, 1, 1,
-0.08041797, -1.627933, -3.70404, 1, 1, 1, 1, 1,
-0.07711032, -0.9702353, -2.466975, 1, 1, 1, 1, 1,
-0.07645597, 0.7382388, -0.5302489, 1, 1, 1, 1, 1,
-0.07334573, -0.7922977, -0.2230297, 1, 1, 1, 1, 1,
-0.07330965, -0.2935598, -2.668203, 1, 1, 1, 1, 1,
-0.06554905, 0.6122128, 0.1863311, 0, 0, 1, 1, 1,
-0.0620177, 0.5770212, -1.782288, 1, 0, 0, 1, 1,
-0.06193581, 1.472305, -2.380642, 1, 0, 0, 1, 1,
-0.06184804, -0.1089964, -2.304714, 1, 0, 0, 1, 1,
-0.05736136, 0.050243, -0.7607125, 1, 0, 0, 1, 1,
-0.05703853, -0.4647126, -2.968235, 1, 0, 0, 1, 1,
-0.05414242, -2.053926, -2.830497, 0, 0, 0, 1, 1,
-0.05306982, -0.8113523, -2.883618, 0, 0, 0, 1, 1,
-0.05251774, -0.5733623, -3.17623, 0, 0, 0, 1, 1,
-0.05134521, -0.9327135, -2.769253, 0, 0, 0, 1, 1,
-0.04751479, 0.2345759, 0.3400519, 0, 0, 0, 1, 1,
-0.04157212, 0.9794328, -1.483394, 0, 0, 0, 1, 1,
-0.04064865, -1.427831, -2.993116, 0, 0, 0, 1, 1,
-0.04029843, 0.08877965, -0.5917783, 1, 1, 1, 1, 1,
-0.0384865, 0.2438823, -0.6044077, 1, 1, 1, 1, 1,
-0.03264927, 0.6345204, -0.7338555, 1, 1, 1, 1, 1,
-0.02784881, 1.606856, 0.65479, 1, 1, 1, 1, 1,
-0.02473527, -0.5594739, -4.209513, 1, 1, 1, 1, 1,
-0.02043053, -1.8271, -3.340619, 1, 1, 1, 1, 1,
-0.01951453, -0.6231803, -3.758864, 1, 1, 1, 1, 1,
-0.01924434, -0.3340478, -4.154294, 1, 1, 1, 1, 1,
-0.01769936, 0.6909909, -1.953158, 1, 1, 1, 1, 1,
-0.01573208, -1.79968, -2.964909, 1, 1, 1, 1, 1,
-0.01493125, 1.53659, -1.160456, 1, 1, 1, 1, 1,
6.073275e-05, -0.8207307, 4.129187, 1, 1, 1, 1, 1,
0.0003791678, 0.8864855, -0.3493814, 1, 1, 1, 1, 1,
0.002019722, -0.4731974, 3.682886, 1, 1, 1, 1, 1,
0.002532607, 2.274841, 0.3551301, 1, 1, 1, 1, 1,
0.008888328, 0.7678598, -0.8498607, 0, 0, 1, 1, 1,
0.01705612, 0.3717521, -0.1753985, 1, 0, 0, 1, 1,
0.01710734, -1.815309, 2.669738, 1, 0, 0, 1, 1,
0.01773167, 0.03551191, 0.3939642, 1, 0, 0, 1, 1,
0.02149918, -0.6680684, 3.700572, 1, 0, 0, 1, 1,
0.02188081, 0.8232241, -0.1597571, 1, 0, 0, 1, 1,
0.0237152, -1.332274, 3.013315, 0, 0, 0, 1, 1,
0.02936895, -1.004918, 3.308149, 0, 0, 0, 1, 1,
0.03008306, 2.447815, -0.2424985, 0, 0, 0, 1, 1,
0.03120195, 1.90258, 0.7459532, 0, 0, 0, 1, 1,
0.03151605, -0.7602232, 4.083894, 0, 0, 0, 1, 1,
0.0322379, 0.2647972, -0.3582261, 0, 0, 0, 1, 1,
0.03620987, -1.942567, 3.222064, 0, 0, 0, 1, 1,
0.0363724, -0.08197936, 2.608269, 1, 1, 1, 1, 1,
0.03784603, -1.697338, 3.856007, 1, 1, 1, 1, 1,
0.04438934, 0.9401515, -1.172852, 1, 1, 1, 1, 1,
0.04596312, -0.9312719, 3.795333, 1, 1, 1, 1, 1,
0.04855369, -0.03610101, 2.096179, 1, 1, 1, 1, 1,
0.0487232, -0.7667316, 3.270392, 1, 1, 1, 1, 1,
0.05106459, 0.3797714, 2.2936, 1, 1, 1, 1, 1,
0.05109229, -0.9690712, -0.1549445, 1, 1, 1, 1, 1,
0.05219799, 0.7566659, 1.16166, 1, 1, 1, 1, 1,
0.05226661, -0.5727088, 3.347936, 1, 1, 1, 1, 1,
0.05651375, 1.597507, -0.7959527, 1, 1, 1, 1, 1,
0.05659695, -0.2435349, 2.734574, 1, 1, 1, 1, 1,
0.05748351, 0.7129012, 0.8022471, 1, 1, 1, 1, 1,
0.05979806, -0.2452701, 2.824687, 1, 1, 1, 1, 1,
0.06446104, -1.81514, 3.250792, 1, 1, 1, 1, 1,
0.06641278, 0.1259756, 1.280476, 0, 0, 1, 1, 1,
0.0665866, -0.2937129, 2.676304, 1, 0, 0, 1, 1,
0.06861642, -0.567185, 3.556214, 1, 0, 0, 1, 1,
0.07831432, 1.017963, -1.227802, 1, 0, 0, 1, 1,
0.08591907, 0.8361748, 0.7899133, 1, 0, 0, 1, 1,
0.08670963, 1.054212, 1.361929, 1, 0, 0, 1, 1,
0.08761805, -0.2296629, 1.225492, 0, 0, 0, 1, 1,
0.08832374, 0.441401, -0.4680192, 0, 0, 0, 1, 1,
0.08919607, 0.7055814, 1.578565, 0, 0, 0, 1, 1,
0.08920625, 1.374021, 0.74458, 0, 0, 0, 1, 1,
0.08962286, 0.07288865, 1.784631, 0, 0, 0, 1, 1,
0.09090694, -0.001735917, 0.8366929, 0, 0, 0, 1, 1,
0.09739711, 0.6114978, 0.9367941, 0, 0, 0, 1, 1,
0.09821306, -1.386002, 2.023625, 1, 1, 1, 1, 1,
0.0996034, 0.4747205, 0.3149006, 1, 1, 1, 1, 1,
0.1056455, 0.6343333, 0.5267583, 1, 1, 1, 1, 1,
0.1066462, -1.398469, 4.113905, 1, 1, 1, 1, 1,
0.1115471, -0.02344425, 2.520914, 1, 1, 1, 1, 1,
0.1120409, 0.5806923, -1.016187, 1, 1, 1, 1, 1,
0.1139889, -0.312018, 3.072833, 1, 1, 1, 1, 1,
0.1233306, 1.562335, -0.7035131, 1, 1, 1, 1, 1,
0.1243733, -0.08032654, 0.9200343, 1, 1, 1, 1, 1,
0.1260744, -1.091209, 3.228376, 1, 1, 1, 1, 1,
0.1262736, -0.9825683, 2.47029, 1, 1, 1, 1, 1,
0.1412879, -1.45472, 3.76035, 1, 1, 1, 1, 1,
0.1459746, 1.254577, 1.132524, 1, 1, 1, 1, 1,
0.1482909, 0.2942671, -1.690223, 1, 1, 1, 1, 1,
0.1509625, 0.07541052, 1.157926, 1, 1, 1, 1, 1,
0.153079, 1.115894, -0.560704, 0, 0, 1, 1, 1,
0.1546016, -0.06856313, 0.2082478, 1, 0, 0, 1, 1,
0.154806, 0.6924864, -1.090038, 1, 0, 0, 1, 1,
0.1617388, 1.310885, 0.284916, 1, 0, 0, 1, 1,
0.1624266, -0.924242, 1.932365, 1, 0, 0, 1, 1,
0.1636123, 0.5951132, -0.07583066, 1, 0, 0, 1, 1,
0.1643199, 2.371808, 0.1331009, 0, 0, 0, 1, 1,
0.1700894, -0.6066272, 2.534461, 0, 0, 0, 1, 1,
0.1727305, 1.646524, 0.1864976, 0, 0, 0, 1, 1,
0.1731604, -0.40067, 2.999714, 0, 0, 0, 1, 1,
0.1734049, -0.801743, 4.116891, 0, 0, 0, 1, 1,
0.1772014, 1.084572, -0.5158788, 0, 0, 0, 1, 1,
0.1789122, -0.6335142, 1.188478, 0, 0, 0, 1, 1,
0.1817687, -0.9601606, 4.635078, 1, 1, 1, 1, 1,
0.1835622, -0.3308148, 1.695584, 1, 1, 1, 1, 1,
0.1853626, -0.2776608, 5.831019, 1, 1, 1, 1, 1,
0.1855876, -0.1560934, 0.5930383, 1, 1, 1, 1, 1,
0.1926292, -0.09972493, 2.9095, 1, 1, 1, 1, 1,
0.1942777, 0.09765149, 1.117706, 1, 1, 1, 1, 1,
0.1952523, -2.911597, 3.076028, 1, 1, 1, 1, 1,
0.1971532, 1.736814, 0.2273064, 1, 1, 1, 1, 1,
0.1973067, 0.1326436, 0.5542143, 1, 1, 1, 1, 1,
0.1980038, -0.7684041, 3.791445, 1, 1, 1, 1, 1,
0.2047577, -0.8037165, 2.012604, 1, 1, 1, 1, 1,
0.2050451, -0.2698272, 2.735106, 1, 1, 1, 1, 1,
0.2073258, 0.4822957, 0.4686895, 1, 1, 1, 1, 1,
0.2078955, 0.6539208, 0.8906901, 1, 1, 1, 1, 1,
0.211332, -0.0743389, 0.1342785, 1, 1, 1, 1, 1,
0.213438, -0.537604, 2.574553, 0, 0, 1, 1, 1,
0.2155652, 0.8603391, 1.680469, 1, 0, 0, 1, 1,
0.216533, 2.905329, -0.5301763, 1, 0, 0, 1, 1,
0.2189548, 0.8359867, 0.993314, 1, 0, 0, 1, 1,
0.2285866, -1.360907, 2.731937, 1, 0, 0, 1, 1,
0.2297626, 0.1740748, 3.180264, 1, 0, 0, 1, 1,
0.2341004, 0.6514511, -0.4059773, 0, 0, 0, 1, 1,
0.2347451, -0.6736797, 3.582953, 0, 0, 0, 1, 1,
0.2348704, 0.4443954, 1.987612, 0, 0, 0, 1, 1,
0.2353512, -1.300241, 2.940739, 0, 0, 0, 1, 1,
0.2365562, -0.5085472, 2.956533, 0, 0, 0, 1, 1,
0.2394189, -0.8935811, 2.793769, 0, 0, 0, 1, 1,
0.2396282, 0.5447131, 0.2294593, 0, 0, 0, 1, 1,
0.2410654, -0.2402371, 3.360742, 1, 1, 1, 1, 1,
0.2411507, -1.180608, 2.742558, 1, 1, 1, 1, 1,
0.2490923, 0.677694, -0.4130341, 1, 1, 1, 1, 1,
0.2552363, -0.6738922, 2.718258, 1, 1, 1, 1, 1,
0.2590879, 0.07511529, 1.198274, 1, 1, 1, 1, 1,
0.2616771, -1.640386, 3.444206, 1, 1, 1, 1, 1,
0.2687032, -0.7473702, 2.675825, 1, 1, 1, 1, 1,
0.2708971, 1.476356, 1.581531, 1, 1, 1, 1, 1,
0.2743068, -2.019512, 3.08306, 1, 1, 1, 1, 1,
0.2837833, 0.8506874, 0.4753264, 1, 1, 1, 1, 1,
0.2881691, 0.6916195, -0.6666477, 1, 1, 1, 1, 1,
0.2993544, -1.50495, 3.044314, 1, 1, 1, 1, 1,
0.3000977, -1.039837, 2.094733, 1, 1, 1, 1, 1,
0.3033217, 0.7278646, 1.734669, 1, 1, 1, 1, 1,
0.3055882, -1.410819, 4.085509, 1, 1, 1, 1, 1,
0.3094223, 0.5909223, 0.9658886, 0, 0, 1, 1, 1,
0.3145709, -0.01294812, 1.302017, 1, 0, 0, 1, 1,
0.317906, 0.4734943, 1.719435, 1, 0, 0, 1, 1,
0.3181927, 0.1577486, 1.010401, 1, 0, 0, 1, 1,
0.3194391, -0.2615669, 1.842456, 1, 0, 0, 1, 1,
0.3196938, 0.2796493, 2.719762, 1, 0, 0, 1, 1,
0.3197198, 0.4467776, 3.834623, 0, 0, 0, 1, 1,
0.3203391, 1.942958, 0.7319426, 0, 0, 0, 1, 1,
0.3214607, 0.8721549, 2.198669, 0, 0, 0, 1, 1,
0.32329, 1.088216, 0.09408116, 0, 0, 0, 1, 1,
0.3245215, -0.1066377, 0.4963671, 0, 0, 0, 1, 1,
0.3266132, -3.459732, 2.503387, 0, 0, 0, 1, 1,
0.3271838, 2.408726, 1.315755, 0, 0, 0, 1, 1,
0.3280217, -0.650272, 2.449164, 1, 1, 1, 1, 1,
0.342093, -0.3134503, 0.812769, 1, 1, 1, 1, 1,
0.3439274, 1.196339, 0.5618881, 1, 1, 1, 1, 1,
0.3452648, 2.061958, -0.2300651, 1, 1, 1, 1, 1,
0.3464951, 1.65637, 0.5062367, 1, 1, 1, 1, 1,
0.3482955, 1.054703, 0.07591144, 1, 1, 1, 1, 1,
0.3513937, 2.2023, -1.561478, 1, 1, 1, 1, 1,
0.3561127, 0.1913245, 1.245361, 1, 1, 1, 1, 1,
0.3745545, 0.4255753, 1.325455, 1, 1, 1, 1, 1,
0.3779921, -0.9304814, 2.192273, 1, 1, 1, 1, 1,
0.3814653, 0.403178, -0.8794342, 1, 1, 1, 1, 1,
0.3816761, -0.06559832, 2.739241, 1, 1, 1, 1, 1,
0.3841253, 0.4606138, 1.003818, 1, 1, 1, 1, 1,
0.3850648, -0.5743572, 3.849898, 1, 1, 1, 1, 1,
0.3855403, -0.6115091, 2.862863, 1, 1, 1, 1, 1,
0.3862679, 0.7470681, 0.7619739, 0, 0, 1, 1, 1,
0.38629, 1.139971, -1.124432, 1, 0, 0, 1, 1,
0.391753, -1.725134, 2.726321, 1, 0, 0, 1, 1,
0.394888, 0.4143943, 0.3607509, 1, 0, 0, 1, 1,
0.3964495, 0.02633907, 0.8556308, 1, 0, 0, 1, 1,
0.3970124, -0.2412674, 2.115991, 1, 0, 0, 1, 1,
0.3988884, -0.9828494, 2.915412, 0, 0, 0, 1, 1,
0.3989371, 0.5997332, -1.812897, 0, 0, 0, 1, 1,
0.4001847, -0.8551289, 3.150643, 0, 0, 0, 1, 1,
0.4066325, -1.117452, 3.067705, 0, 0, 0, 1, 1,
0.4169632, 1.019315, -0.08646613, 0, 0, 0, 1, 1,
0.4179118, 1.41792, 0.210877, 0, 0, 0, 1, 1,
0.420515, 0.9269484, -0.7390089, 0, 0, 0, 1, 1,
0.429189, 0.5653054, -1.709673, 1, 1, 1, 1, 1,
0.4320926, 0.3887407, 1.428586, 1, 1, 1, 1, 1,
0.4325174, -0.8804713, 3.246587, 1, 1, 1, 1, 1,
0.4397255, 0.8860806, -0.5697927, 1, 1, 1, 1, 1,
0.4429755, -0.736456, 3.833179, 1, 1, 1, 1, 1,
0.4445585, 0.7520563, 0.9115558, 1, 1, 1, 1, 1,
0.4504928, 1.666072, 0.6056644, 1, 1, 1, 1, 1,
0.4539173, -1.314358, 2.09064, 1, 1, 1, 1, 1,
0.4552153, -0.8323362, 1.690976, 1, 1, 1, 1, 1,
0.4562375, 0.1653663, 1.965518, 1, 1, 1, 1, 1,
0.459094, -0.08667906, 1.140262, 1, 1, 1, 1, 1,
0.4599696, 0.6194203, 3.325244, 1, 1, 1, 1, 1,
0.4685523, -0.5345528, 3.160005, 1, 1, 1, 1, 1,
0.468848, -0.4581646, 2.668127, 1, 1, 1, 1, 1,
0.4710521, -0.9625087, 2.315676, 1, 1, 1, 1, 1,
0.4731246, 1.874187, -0.3920897, 0, 0, 1, 1, 1,
0.4740985, 0.4254456, -0.09545008, 1, 0, 0, 1, 1,
0.4833728, -0.06898832, 0.5210828, 1, 0, 0, 1, 1,
0.4870045, -0.4585568, 1.874619, 1, 0, 0, 1, 1,
0.4873992, -0.1984378, 1.339308, 1, 0, 0, 1, 1,
0.4945414, -0.7285977, 1.816474, 1, 0, 0, 1, 1,
0.4970984, -0.326064, 3.347689, 0, 0, 0, 1, 1,
0.4998767, 0.2257089, 0.8792913, 0, 0, 0, 1, 1,
0.5009464, 2.124068, 2.187231, 0, 0, 0, 1, 1,
0.5054105, -0.9359947, 1.730706, 0, 0, 0, 1, 1,
0.508269, -0.9512346, 3.725361, 0, 0, 0, 1, 1,
0.5093581, -0.3985261, 1.074838, 0, 0, 0, 1, 1,
0.5163805, 0.06324214, 0.5881348, 0, 0, 0, 1, 1,
0.5164468, -1.615116, 3.029407, 1, 1, 1, 1, 1,
0.5288482, 1.14732, 0.5116267, 1, 1, 1, 1, 1,
0.5300601, -0.02808526, 1.330087, 1, 1, 1, 1, 1,
0.533603, 0.3798882, 1.819562, 1, 1, 1, 1, 1,
0.5398338, 0.316624, 1.024143, 1, 1, 1, 1, 1,
0.5435302, -1.858418, 0.9024411, 1, 1, 1, 1, 1,
0.5436956, -0.7665703, 1.902562, 1, 1, 1, 1, 1,
0.5456427, -0.166843, 0.5689284, 1, 1, 1, 1, 1,
0.5606021, -0.9471076, 2.614928, 1, 1, 1, 1, 1,
0.5608378, -1.567791, 4.602589, 1, 1, 1, 1, 1,
0.5618468, 0.5633709, 0.9185041, 1, 1, 1, 1, 1,
0.5629308, -0.1134477, 2.846878, 1, 1, 1, 1, 1,
0.5630102, -1.021218, 2.558637, 1, 1, 1, 1, 1,
0.5662038, -0.7237622, 2.534042, 1, 1, 1, 1, 1,
0.5690366, -0.9886791, 1.14968, 1, 1, 1, 1, 1,
0.5738004, 1.431105, 1.225099, 0, 0, 1, 1, 1,
0.5828333, -0.03787207, 1.522136, 1, 0, 0, 1, 1,
0.5829298, -0.9516457, 2.191476, 1, 0, 0, 1, 1,
0.5870172, -0.7891231, 2.563909, 1, 0, 0, 1, 1,
0.5897378, -0.02222246, 2.17836, 1, 0, 0, 1, 1,
0.5926105, -0.1180699, 2.413395, 1, 0, 0, 1, 1,
0.5959423, -0.5140864, 2.578052, 0, 0, 0, 1, 1,
0.5975872, -0.3329968, 1.593004, 0, 0, 0, 1, 1,
0.599871, 1.115554, -0.6026227, 0, 0, 0, 1, 1,
0.6005824, -0.1052012, 0.3764783, 0, 0, 0, 1, 1,
0.6040118, 0.7754425, 0.6846519, 0, 0, 0, 1, 1,
0.6068404, 2.100317, 0.9714043, 0, 0, 0, 1, 1,
0.6111642, 0.2298681, -0.5571216, 0, 0, 0, 1, 1,
0.6116945, 0.5436156, 2.230421, 1, 1, 1, 1, 1,
0.6130623, 0.2918258, 0.07711709, 1, 1, 1, 1, 1,
0.6267071, -0.2767429, 3.767722, 1, 1, 1, 1, 1,
0.6269544, 1.014346, 2.584486, 1, 1, 1, 1, 1,
0.629635, 0.05714831, 2.381913, 1, 1, 1, 1, 1,
0.6304615, 0.6358254, 1.642433, 1, 1, 1, 1, 1,
0.63167, 0.9318606, 1.167473, 1, 1, 1, 1, 1,
0.6403175, 1.091498, 0.9143885, 1, 1, 1, 1, 1,
0.6407688, 0.4082089, -1.574208, 1, 1, 1, 1, 1,
0.6419241, -0.963503, 2.620199, 1, 1, 1, 1, 1,
0.6436429, -2.746928, 5.047122, 1, 1, 1, 1, 1,
0.6461265, 1.368016, -0.01000079, 1, 1, 1, 1, 1,
0.6509324, -0.8291156, 2.031414, 1, 1, 1, 1, 1,
0.6551527, -0.9537367, 2.401209, 1, 1, 1, 1, 1,
0.6620895, 0.1582921, 1.332463, 1, 1, 1, 1, 1,
0.6637042, 1.918529, -0.9738197, 0, 0, 1, 1, 1,
0.6652602, -0.7150031, 2.933634, 1, 0, 0, 1, 1,
0.6654955, 0.3733865, 0.7275161, 1, 0, 0, 1, 1,
0.6662424, 0.2529667, 0.9708815, 1, 0, 0, 1, 1,
0.6679358, 0.06244041, 1.104797, 1, 0, 0, 1, 1,
0.6773365, 1.264389, -0.3771414, 1, 0, 0, 1, 1,
0.685771, 0.7575976, 2.297925, 0, 0, 0, 1, 1,
0.6901299, 1.004432, 0.9489053, 0, 0, 0, 1, 1,
0.6926587, -1.831895, 2.637409, 0, 0, 0, 1, 1,
0.6955954, -0.836343, 3.998116, 0, 0, 0, 1, 1,
0.6997903, 0.1010542, 1.965627, 0, 0, 0, 1, 1,
0.7002653, 0.6583081, -0.08556072, 0, 0, 0, 1, 1,
0.7036675, 0.213151, 3.140726, 0, 0, 0, 1, 1,
0.7077481, 0.1861885, 0.2883718, 1, 1, 1, 1, 1,
0.7092256, 0.1077052, 1.409806, 1, 1, 1, 1, 1,
0.7118074, -0.09824414, 2.171433, 1, 1, 1, 1, 1,
0.7131684, 1.020968, -0.9952008, 1, 1, 1, 1, 1,
0.7173283, -0.6516204, 2.026001, 1, 1, 1, 1, 1,
0.7196987, -2.178387, 3.063776, 1, 1, 1, 1, 1,
0.7206811, -0.2763645, -0.444788, 1, 1, 1, 1, 1,
0.7213804, 0.5297719, 1.644597, 1, 1, 1, 1, 1,
0.7215486, -0.8054501, 2.365188, 1, 1, 1, 1, 1,
0.7235286, -2.162152, 2.046928, 1, 1, 1, 1, 1,
0.7338889, 0.3085875, 2.135265, 1, 1, 1, 1, 1,
0.7388753, -0.9689175, 1.963622, 1, 1, 1, 1, 1,
0.7391239, -0.4772828, 0.9265941, 1, 1, 1, 1, 1,
0.7433005, 2.152656, 1.4619, 1, 1, 1, 1, 1,
0.74713, 1.325939, 0.2395608, 1, 1, 1, 1, 1,
0.7474229, 0.8648137, -1.039861, 0, 0, 1, 1, 1,
0.749299, 0.268812, 0.7309304, 1, 0, 0, 1, 1,
0.7600088, -0.325742, -0.4335765, 1, 0, 0, 1, 1,
0.7632155, -0.764973, 1.810173, 1, 0, 0, 1, 1,
0.7769219, -1.287513, 2.719969, 1, 0, 0, 1, 1,
0.7791381, 0.6979683, -2.370952, 1, 0, 0, 1, 1,
0.7884626, -0.3263067, 1.544514, 0, 0, 0, 1, 1,
0.7908922, -0.9814287, 2.234602, 0, 0, 0, 1, 1,
0.7926335, -0.5201691, 1.090267, 0, 0, 0, 1, 1,
0.796174, 2.393502, 0.8505619, 0, 0, 0, 1, 1,
0.7969998, -1.217354, 2.845858, 0, 0, 0, 1, 1,
0.7973235, 1.834948, 0.5988113, 0, 0, 0, 1, 1,
0.7977996, -0.2548251, 2.595054, 0, 0, 0, 1, 1,
0.7981235, 0.224781, 0.3758769, 1, 1, 1, 1, 1,
0.8015482, 0.3456188, 1.503393, 1, 1, 1, 1, 1,
0.8028501, -0.1762627, 2.270746, 1, 1, 1, 1, 1,
0.8105133, 0.3570198, 1.996775, 1, 1, 1, 1, 1,
0.8135729, -0.3624143, 1.502259, 1, 1, 1, 1, 1,
0.8156378, 0.9196265, 0.2577659, 1, 1, 1, 1, 1,
0.817522, -0.1066164, 0.684077, 1, 1, 1, 1, 1,
0.8261379, -1.296088, 2.762919, 1, 1, 1, 1, 1,
0.8279771, 2.287524, 0.1771647, 1, 1, 1, 1, 1,
0.8327307, 1.018075, 1.12092, 1, 1, 1, 1, 1,
0.8366625, 0.05591587, 1.216131, 1, 1, 1, 1, 1,
0.8409036, -0.8301355, 1.562702, 1, 1, 1, 1, 1,
0.8456418, 1.663996, -0.5287368, 1, 1, 1, 1, 1,
0.8468778, -0.3164434, 0.1469623, 1, 1, 1, 1, 1,
0.8487527, -0.594166, 1.372248, 1, 1, 1, 1, 1,
0.8508015, -0.2767844, 3.562007, 0, 0, 1, 1, 1,
0.8552455, 0.0334334, 0.7122003, 1, 0, 0, 1, 1,
0.8558133, -0.8551556, 4.866023, 1, 0, 0, 1, 1,
0.8621275, -0.7299236, 2.053077, 1, 0, 0, 1, 1,
0.8626605, -0.1543392, 1.110133, 1, 0, 0, 1, 1,
0.8727165, -0.8095779, 2.568989, 1, 0, 0, 1, 1,
0.8749378, 0.5109222, 1.493135, 0, 0, 0, 1, 1,
0.8811027, -0.3228335, 1.606951, 0, 0, 0, 1, 1,
0.8870026, -0.07827582, 0.4707262, 0, 0, 0, 1, 1,
0.8924738, -1.515818, 1.621994, 0, 0, 0, 1, 1,
0.8982539, -0.8325523, 1.694718, 0, 0, 0, 1, 1,
0.8990064, -0.5694093, 0.8463721, 0, 0, 0, 1, 1,
0.8999431, 1.294673, 1.65018, 0, 0, 0, 1, 1,
0.9022432, -1.573381, 3.703814, 1, 1, 1, 1, 1,
0.9096356, 0.4879915, 0.008325332, 1, 1, 1, 1, 1,
0.9097686, 0.8009412, -0.1061588, 1, 1, 1, 1, 1,
0.911705, 0.5871533, -0.09466329, 1, 1, 1, 1, 1,
0.9243259, 1.051634, -0.3942106, 1, 1, 1, 1, 1,
0.9251253, -1.398907, 2.470114, 1, 1, 1, 1, 1,
0.9257353, -0.04377393, 2.872094, 1, 1, 1, 1, 1,
0.927727, -0.3207677, 2.967303, 1, 1, 1, 1, 1,
0.9279854, 2.251641, -1.333896, 1, 1, 1, 1, 1,
0.9307441, 1.883108, 1.336107, 1, 1, 1, 1, 1,
0.9313716, 0.910404, -0.4931965, 1, 1, 1, 1, 1,
0.9332061, -1.138213, 3.030085, 1, 1, 1, 1, 1,
0.9347017, -0.0243204, 1.725203, 1, 1, 1, 1, 1,
0.9355702, 1.999191, 0.9397047, 1, 1, 1, 1, 1,
0.9381794, 0.8797057, -0.1355367, 1, 1, 1, 1, 1,
0.9432389, 0.08482409, 1.912353, 0, 0, 1, 1, 1,
0.9477672, 0.8828113, -0.07470123, 1, 0, 0, 1, 1,
0.9502205, 0.4014835, 1.27061, 1, 0, 0, 1, 1,
0.9502791, -1.666225, 2.915066, 1, 0, 0, 1, 1,
0.9561582, -0.5572965, 1.923674, 1, 0, 0, 1, 1,
0.9645038, -2.506005, 3.499757, 1, 0, 0, 1, 1,
0.9672459, -1.524678, 1.171261, 0, 0, 0, 1, 1,
0.9681771, 0.6419315, 1.538263, 0, 0, 0, 1, 1,
0.9686064, -0.6250124, 2.301351, 0, 0, 0, 1, 1,
0.9699427, 0.8730379, 1.188832, 0, 0, 0, 1, 1,
0.9709117, 0.9392267, 0.2703529, 0, 0, 0, 1, 1,
0.9724281, 1.779868, -0.5227399, 0, 0, 0, 1, 1,
0.9779866, 1.242033, 0.2609385, 0, 0, 0, 1, 1,
0.9829972, -0.2627188, 0.3224609, 1, 1, 1, 1, 1,
0.9835017, 1.360731, 0.9116648, 1, 1, 1, 1, 1,
0.9862947, 0.1552347, 1.103313, 1, 1, 1, 1, 1,
0.9916736, -0.3675656, 2.537587, 1, 1, 1, 1, 1,
0.9993893, -1.785562, 2.565584, 1, 1, 1, 1, 1,
1.001082, 1.174986, 1.643977, 1, 1, 1, 1, 1,
1.00478, -1.382075, 0.3474735, 1, 1, 1, 1, 1,
1.012275, 0.9456156, 0.4221138, 1, 1, 1, 1, 1,
1.01318, -0.7445261, 3.519211, 1, 1, 1, 1, 1,
1.013283, -0.9628925, 2.520397, 1, 1, 1, 1, 1,
1.015119, -0.5958308, 0.3081909, 1, 1, 1, 1, 1,
1.019336, 0.372592, 0.8902273, 1, 1, 1, 1, 1,
1.023541, 0.8672792, 0.9834111, 1, 1, 1, 1, 1,
1.030599, -0.1000177, 0.3489476, 1, 1, 1, 1, 1,
1.03112, 0.03912007, 1.268932, 1, 1, 1, 1, 1,
1.037301, 0.356641, 1.844029, 0, 0, 1, 1, 1,
1.040541, -1.193211, 2.990935, 1, 0, 0, 1, 1,
1.045506, 0.3834703, 0.5560821, 1, 0, 0, 1, 1,
1.045584, -1.274865, 4.062816, 1, 0, 0, 1, 1,
1.057827, -0.2921628, 1.968412, 1, 0, 0, 1, 1,
1.061918, -0.1655316, 2.338404, 1, 0, 0, 1, 1,
1.066567, 0.3570263, 0.4740366, 0, 0, 0, 1, 1,
1.072315, -0.006935908, 1.917473, 0, 0, 0, 1, 1,
1.080427, 0.1191004, 0.8538854, 0, 0, 0, 1, 1,
1.083439, -1.486911, 2.793555, 0, 0, 0, 1, 1,
1.092633, -2.532303, 2.708775, 0, 0, 0, 1, 1,
1.094288, -0.1483997, 2.781285, 0, 0, 0, 1, 1,
1.094864, 1.788078, -0.9906404, 0, 0, 0, 1, 1,
1.097673, 0.2083949, 0.7702814, 1, 1, 1, 1, 1,
1.107819, 0.7900781, 1.214978, 1, 1, 1, 1, 1,
1.108353, 0.6892962, 0.4228289, 1, 1, 1, 1, 1,
1.128725, 1.523759, -0.8787733, 1, 1, 1, 1, 1,
1.137335, 1.099191, -0.437446, 1, 1, 1, 1, 1,
1.14022, 0.05976271, 1.179285, 1, 1, 1, 1, 1,
1.142916, 0.03642097, 0.9557402, 1, 1, 1, 1, 1,
1.146378, 0.5396357, 1.317182, 1, 1, 1, 1, 1,
1.15125, -1.187259, 1.930444, 1, 1, 1, 1, 1,
1.154994, 0.2305203, 3.340409, 1, 1, 1, 1, 1,
1.155562, 3.433181, 1.360447, 1, 1, 1, 1, 1,
1.165442, -0.1358143, 0.755443, 1, 1, 1, 1, 1,
1.173076, -1.663263, 3.664391, 1, 1, 1, 1, 1,
1.182858, 1.686099, -1.068439, 1, 1, 1, 1, 1,
1.185902, 0.0842248, 1.666781, 1, 1, 1, 1, 1,
1.198749, 2.071719, 0.3634759, 0, 0, 1, 1, 1,
1.204981, 0.1183136, 0.6352717, 1, 0, 0, 1, 1,
1.207554, -0.01699051, 4.048723, 1, 0, 0, 1, 1,
1.208322, 0.5929175, 0.2184698, 1, 0, 0, 1, 1,
1.210966, 1.141188, 0.4769269, 1, 0, 0, 1, 1,
1.217069, -1.023678, 4.485572, 1, 0, 0, 1, 1,
1.226074, -0.06876832, 2.153517, 0, 0, 0, 1, 1,
1.230783, 0.5604759, 1.71649, 0, 0, 0, 1, 1,
1.233048, -0.08013403, 0.2246656, 0, 0, 0, 1, 1,
1.254422, -0.1138559, 4.101385, 0, 0, 0, 1, 1,
1.258119, 0.9098552, 0.02877948, 0, 0, 0, 1, 1,
1.262233, 0.3237527, 1.048593, 0, 0, 0, 1, 1,
1.267359, 1.215771, 0.03620714, 0, 0, 0, 1, 1,
1.269886, -1.490936, 1.656933, 1, 1, 1, 1, 1,
1.292086, -1.604205, 1.983595, 1, 1, 1, 1, 1,
1.293357, -0.6830871, 0.4965115, 1, 1, 1, 1, 1,
1.293976, -0.5580359, 0.7720602, 1, 1, 1, 1, 1,
1.298303, -0.9205059, 1.766835, 1, 1, 1, 1, 1,
1.307686, -1.088705, 3.858512, 1, 1, 1, 1, 1,
1.309048, -0.4039744, 1.316257, 1, 1, 1, 1, 1,
1.310702, 0.09759722, 0.9128048, 1, 1, 1, 1, 1,
1.315061, -0.5604213, 1.462237, 1, 1, 1, 1, 1,
1.325323, -0.8268613, 1.728473, 1, 1, 1, 1, 1,
1.326419, 0.5066863, 1.732515, 1, 1, 1, 1, 1,
1.336926, 0.5980457, 1.869193, 1, 1, 1, 1, 1,
1.350334, 1.043684, -0.06344472, 1, 1, 1, 1, 1,
1.35666, -0.3687851, 4.176201, 1, 1, 1, 1, 1,
1.363568, -1.266656, 1.504192, 1, 1, 1, 1, 1,
1.364081, 0.1964055, 1.229682, 0, 0, 1, 1, 1,
1.368472, -0.1599274, 1.94394, 1, 0, 0, 1, 1,
1.38338, -0.7406585, 3.61644, 1, 0, 0, 1, 1,
1.384138, -1.334055, 3.225447, 1, 0, 0, 1, 1,
1.385056, 1.15056, 1.522098, 1, 0, 0, 1, 1,
1.398207, -0.8436314, 0.6118554, 1, 0, 0, 1, 1,
1.407713, 0.8210307, 1.304783, 0, 0, 0, 1, 1,
1.410706, -2.134898, 2.591917, 0, 0, 0, 1, 1,
1.413445, -0.25577, 0.4706835, 0, 0, 0, 1, 1,
1.413894, -1.098133, 3.353457, 0, 0, 0, 1, 1,
1.427099, -0.1336142, 1.766018, 0, 0, 0, 1, 1,
1.431179, 1.045655, -0.172347, 0, 0, 0, 1, 1,
1.433256, 1.041448, 2.522803, 0, 0, 0, 1, 1,
1.440154, 0.03998968, 1.808413, 1, 1, 1, 1, 1,
1.444323, -2.061096, 2.629403, 1, 1, 1, 1, 1,
1.4449, 1.519254, 0.9104016, 1, 1, 1, 1, 1,
1.454312, 1.664467, 0.08795515, 1, 1, 1, 1, 1,
1.458014, -0.9633594, 2.654299, 1, 1, 1, 1, 1,
1.459844, -0.3926743, 2.975514, 1, 1, 1, 1, 1,
1.470999, -1.042479, 0.9939967, 1, 1, 1, 1, 1,
1.478052, -0.8762186, 0.2464722, 1, 1, 1, 1, 1,
1.482226, 0.3746279, 1.486767, 1, 1, 1, 1, 1,
1.485042, 0.4825747, 2.666908, 1, 1, 1, 1, 1,
1.508784, 1.543746, -0.1793532, 1, 1, 1, 1, 1,
1.534726, -0.752143, 0.8095173, 1, 1, 1, 1, 1,
1.544926, -0.6875724, 1.391903, 1, 1, 1, 1, 1,
1.5459, 0.5784281, -0.3558965, 1, 1, 1, 1, 1,
1.557117, -0.5881099, 2.16048, 1, 1, 1, 1, 1,
1.563233, -1.145394, 0.4066755, 0, 0, 1, 1, 1,
1.56419, -0.4404309, 1.995536, 1, 0, 0, 1, 1,
1.56755, -0.186294, 4.119135, 1, 0, 0, 1, 1,
1.567623, 1.076128, 1.733073, 1, 0, 0, 1, 1,
1.573369, -0.9599889, 2.424592, 1, 0, 0, 1, 1,
1.57954, -1.017093, 0.2198344, 1, 0, 0, 1, 1,
1.581661, -1.512143, 3.874916, 0, 0, 0, 1, 1,
1.583564, -0.1927576, 1.150361, 0, 0, 0, 1, 1,
1.631169, -1.17346, 2.553691, 0, 0, 0, 1, 1,
1.636149, -0.1111675, 1.116045, 0, 0, 0, 1, 1,
1.643335, 1.115832, 1.023025, 0, 0, 0, 1, 1,
1.645052, 0.3679334, 2.253503, 0, 0, 0, 1, 1,
1.655441, 0.4338143, 1.332242, 0, 0, 0, 1, 1,
1.695807, -1.073659, 0.6202962, 1, 1, 1, 1, 1,
1.700436, 0.8231958, 0.9291427, 1, 1, 1, 1, 1,
1.701529, -0.914897, 2.289053, 1, 1, 1, 1, 1,
1.702938, 1.370504, 2.995601, 1, 1, 1, 1, 1,
1.703701, 0.1885938, 1.313662, 1, 1, 1, 1, 1,
1.713043, 0.2297095, 0.2879335, 1, 1, 1, 1, 1,
1.722623, 0.2490921, -0.3426241, 1, 1, 1, 1, 1,
1.725289, 0.275425, 2.004003, 1, 1, 1, 1, 1,
1.733579, 0.4328317, -0.1086774, 1, 1, 1, 1, 1,
1.738657, 1.551201, 0.938691, 1, 1, 1, 1, 1,
1.756885, 1.413371, 0.2115324, 1, 1, 1, 1, 1,
1.756999, -0.1107213, 2.503678, 1, 1, 1, 1, 1,
1.762434, -0.4264331, 1.327037, 1, 1, 1, 1, 1,
1.768506, -0.002803487, 1.578388, 1, 1, 1, 1, 1,
1.770675, 0.8756381, 0.4357461, 1, 1, 1, 1, 1,
1.80036, -0.4449364, 1.709604, 0, 0, 1, 1, 1,
1.833153, -0.08658557, 2.175438, 1, 0, 0, 1, 1,
1.833293, -1.219077, 1.733323, 1, 0, 0, 1, 1,
1.884941, -0.1185807, 0.3218356, 1, 0, 0, 1, 1,
1.895853, -0.04035804, -0.9015099, 1, 0, 0, 1, 1,
1.896709, 0.04559981, 1.430516, 1, 0, 0, 1, 1,
1.901083, -0.3856197, 1.42028, 0, 0, 0, 1, 1,
1.922156, 0.5230297, 3.182544, 0, 0, 0, 1, 1,
1.934844, -1.320539, 2.06427, 0, 0, 0, 1, 1,
1.9594, -0.7526611, 1.801386, 0, 0, 0, 1, 1,
1.965933, -1.349452, 2.631044, 0, 0, 0, 1, 1,
1.970534, 0.5757163, 2.439371, 0, 0, 0, 1, 1,
1.971935, 0.3749135, 2.060715, 0, 0, 0, 1, 1,
1.973092, -0.9349965, 2.348222, 1, 1, 1, 1, 1,
1.982245, 0.0539341, 2.794732, 1, 1, 1, 1, 1,
2.017487, 0.4875378, 0.7875131, 1, 1, 1, 1, 1,
2.060561, -1.764331, 1.918497, 1, 1, 1, 1, 1,
2.063472, 2.092052, 0.4486892, 1, 1, 1, 1, 1,
2.075972, -0.6829082, 0.3556434, 1, 1, 1, 1, 1,
2.087277, 0.7788675, 1.391111, 1, 1, 1, 1, 1,
2.090648, -0.4202125, 1.073433, 1, 1, 1, 1, 1,
2.11518, -0.3768226, 2.408874, 1, 1, 1, 1, 1,
2.139074, -0.9511813, 4.306394, 1, 1, 1, 1, 1,
2.153037, -0.06499996, 1.443484, 1, 1, 1, 1, 1,
2.169221, -2.072242, 1.628653, 1, 1, 1, 1, 1,
2.173277, 2.06457, 0.5322631, 1, 1, 1, 1, 1,
2.184653, 1.389399, 1.856731, 1, 1, 1, 1, 1,
2.217498, -0.2014056, 3.595875, 1, 1, 1, 1, 1,
2.296432, 1.797974, 1.985976, 0, 0, 1, 1, 1,
2.299881, 1.624803, 1.788648, 1, 0, 0, 1, 1,
2.314434, -2.652536, 0.6604072, 1, 0, 0, 1, 1,
2.398788, 1.046847, 0.7054685, 1, 0, 0, 1, 1,
2.441733, 0.8817917, 1.331876, 1, 0, 0, 1, 1,
2.449955, -0.7098724, 3.699237, 1, 0, 0, 1, 1,
2.455459, 0.9955406, -0.4211114, 0, 0, 0, 1, 1,
2.502293, 0.8967132, 1.639334, 0, 0, 0, 1, 1,
2.513994, -0.7850887, 1.462989, 0, 0, 0, 1, 1,
2.573618, -0.7093215, 2.158902, 0, 0, 0, 1, 1,
2.610337, -0.7374594, 0.3167235, 0, 0, 0, 1, 1,
2.721156, 1.409998, 0.1736611, 0, 0, 0, 1, 1,
2.784486, -1.9055, 3.945846, 0, 0, 0, 1, 1,
2.861098, -0.8965787, 2.397156, 1, 1, 1, 1, 1,
2.914939, 0.029207, 1.31192, 1, 1, 1, 1, 1,
2.964361, 1.295104, 2.407929, 1, 1, 1, 1, 1,
3.058779, 0.7730792, 0.8988117, 1, 1, 1, 1, 1,
3.117545, 2.131878, 0.3909668, 1, 1, 1, 1, 1,
3.573506, -0.6953833, 1.692185, 1, 1, 1, 1, 1,
3.634946, -0.2745756, 0.4632033, 1, 1, 1, 1, 1
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
var radius = 10.05365;
var distance = 35.31301;
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
mvMatrix.translate( -0.2956409, 0.01327562, -0.1277943 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.31301);
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