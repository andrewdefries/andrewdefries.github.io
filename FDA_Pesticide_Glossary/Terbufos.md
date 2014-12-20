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
-3.709553, -0.3698656, -0.4271392, 1, 0, 0, 1,
-3.494912, -0.2932529, 0.0607101, 1, 0.007843138, 0, 1,
-3.043131, -1.974451, -2.50483, 1, 0.01176471, 0, 1,
-2.633703, -0.0006431327, -1.314711, 1, 0.01960784, 0, 1,
-2.502361, 0.24165, -1.132666, 1, 0.02352941, 0, 1,
-2.416373, -0.2000644, -0.5484132, 1, 0.03137255, 0, 1,
-2.359503, 0.3685673, -2.513248, 1, 0.03529412, 0, 1,
-2.171146, -1.316366, -1.931972, 1, 0.04313726, 0, 1,
-2.123556, -0.4280281, -3.989943, 1, 0.04705882, 0, 1,
-2.042887, 1.373551, -0.549361, 1, 0.05490196, 0, 1,
-2.020324, 0.6086969, -2.806263, 1, 0.05882353, 0, 1,
-2.009236, 0.9166737, -1.542271, 1, 0.06666667, 0, 1,
-1.997888, 1.180755, -0.4812042, 1, 0.07058824, 0, 1,
-1.997277, -2.238013, -3.588432, 1, 0.07843138, 0, 1,
-1.991153, 0.501994, -0.7301924, 1, 0.08235294, 0, 1,
-1.938548, -1.471382, -1.828892, 1, 0.09019608, 0, 1,
-1.931388, -2.117266, -2.318288, 1, 0.09411765, 0, 1,
-1.930008, 0.7768406, -3.785554, 1, 0.1019608, 0, 1,
-1.906491, -0.3713748, 0.733376, 1, 0.1098039, 0, 1,
-1.899844, -1.582275, -1.772171, 1, 0.1137255, 0, 1,
-1.894794, 0.03478218, 0.1216676, 1, 0.1215686, 0, 1,
-1.889824, -0.5695692, -1.202526, 1, 0.1254902, 0, 1,
-1.887662, 0.3037911, -0.04858667, 1, 0.1333333, 0, 1,
-1.883504, 0.9722131, -0.4577509, 1, 0.1372549, 0, 1,
-1.873283, 1.652788, -0.2189686, 1, 0.145098, 0, 1,
-1.873031, -0.08283726, -3.219113, 1, 0.1490196, 0, 1,
-1.872775, -0.8753882, -2.693455, 1, 0.1568628, 0, 1,
-1.865954, 2.155194, -0.853022, 1, 0.1607843, 0, 1,
-1.863645, -0.8802574, -3.50229, 1, 0.1686275, 0, 1,
-1.836518, 0.3140518, -3.798193, 1, 0.172549, 0, 1,
-1.832006, 0.03094913, -1.719264, 1, 0.1803922, 0, 1,
-1.826589, -0.3982143, -2.698215, 1, 0.1843137, 0, 1,
-1.820556, -0.2652083, 0.1075884, 1, 0.1921569, 0, 1,
-1.817492, -0.005460508, -1.444545, 1, 0.1960784, 0, 1,
-1.817199, -0.6856179, -0.1950849, 1, 0.2039216, 0, 1,
-1.810803, 0.8665367, -0.201846, 1, 0.2117647, 0, 1,
-1.805702, -0.07110519, -2.187235, 1, 0.2156863, 0, 1,
-1.803224, -1.699287, -3.143009, 1, 0.2235294, 0, 1,
-1.785034, -1.044011, -2.945674, 1, 0.227451, 0, 1,
-1.782116, -0.1887356, -1.67684, 1, 0.2352941, 0, 1,
-1.780258, 0.1008649, -3.607172, 1, 0.2392157, 0, 1,
-1.776215, 0.8549268, -0.2078002, 1, 0.2470588, 0, 1,
-1.773111, -1.003947, -2.553497, 1, 0.2509804, 0, 1,
-1.767357, 0.8035514, -2.135168, 1, 0.2588235, 0, 1,
-1.757007, 1.334919, -0.1037716, 1, 0.2627451, 0, 1,
-1.752128, 0.4465991, -3.213578, 1, 0.2705882, 0, 1,
-1.72366, 0.0829072, -1.512734, 1, 0.2745098, 0, 1,
-1.715187, -0.1707779, -2.032286, 1, 0.282353, 0, 1,
-1.715177, 1.580187, -1.221933, 1, 0.2862745, 0, 1,
-1.711339, 0.05426389, -1.397014, 1, 0.2941177, 0, 1,
-1.711082, -2.141126, -1.124384, 1, 0.3019608, 0, 1,
-1.682981, -0.2775047, -1.522661, 1, 0.3058824, 0, 1,
-1.670703, -0.2915836, -0.07496028, 1, 0.3137255, 0, 1,
-1.667663, 0.3787881, -0.3044617, 1, 0.3176471, 0, 1,
-1.65612, 1.173983, -2.180275, 1, 0.3254902, 0, 1,
-1.654624, 1.739091, -1.85004, 1, 0.3294118, 0, 1,
-1.653341, -0.5307263, -1.159781, 1, 0.3372549, 0, 1,
-1.651507, -0.6179116, -2.101588, 1, 0.3411765, 0, 1,
-1.646784, -2.082368, -1.837657, 1, 0.3490196, 0, 1,
-1.636295, -0.1998452, 0.2689892, 1, 0.3529412, 0, 1,
-1.628499, 0.05337536, -1.710465, 1, 0.3607843, 0, 1,
-1.622545, 0.9994024, -1.868212, 1, 0.3647059, 0, 1,
-1.610588, 0.6130517, 0.02236379, 1, 0.372549, 0, 1,
-1.604915, -1.080474, -2.193038, 1, 0.3764706, 0, 1,
-1.602846, -0.6016889, -2.504279, 1, 0.3843137, 0, 1,
-1.595039, -0.5484989, -3.543327, 1, 0.3882353, 0, 1,
-1.586495, 0.5084344, -2.116582, 1, 0.3960784, 0, 1,
-1.567757, -3.686712, -3.075829, 1, 0.4039216, 0, 1,
-1.555286, 0.9563351, -0.7065398, 1, 0.4078431, 0, 1,
-1.547757, -1.15976, -3.172275, 1, 0.4156863, 0, 1,
-1.547352, 0.1306984, -2.420179, 1, 0.4196078, 0, 1,
-1.521566, 0.07440615, 0.02961992, 1, 0.427451, 0, 1,
-1.517289, -0.561223, -2.77218, 1, 0.4313726, 0, 1,
-1.490245, -1.543421, -3.700353, 1, 0.4392157, 0, 1,
-1.475385, 1.051531, 0.3693199, 1, 0.4431373, 0, 1,
-1.472135, -0.9445629, -3.419519, 1, 0.4509804, 0, 1,
-1.468898, -2.390953, -5.413688, 1, 0.454902, 0, 1,
-1.466979, 2.246051, 0.4599427, 1, 0.4627451, 0, 1,
-1.464134, 0.4314472, -0.916648, 1, 0.4666667, 0, 1,
-1.459356, -0.2019732, -1.925253, 1, 0.4745098, 0, 1,
-1.446523, -1.27497, -3.073606, 1, 0.4784314, 0, 1,
-1.442456, -1.676896, -2.378085, 1, 0.4862745, 0, 1,
-1.414928, 0.8881426, -2.022735, 1, 0.4901961, 0, 1,
-1.414524, 0.2431574, -0.9253834, 1, 0.4980392, 0, 1,
-1.404626, 0.2171489, 0.171353, 1, 0.5058824, 0, 1,
-1.403787, -0.7726216, -2.059933, 1, 0.509804, 0, 1,
-1.403258, -2.018018, -2.186338, 1, 0.5176471, 0, 1,
-1.3998, -0.04440027, -0.2759325, 1, 0.5215687, 0, 1,
-1.388677, 0.9873918, -2.341398, 1, 0.5294118, 0, 1,
-1.388475, 0.4403825, -0.2468439, 1, 0.5333334, 0, 1,
-1.379919, 0.5735317, -0.8767577, 1, 0.5411765, 0, 1,
-1.365222, 0.1213205, -1.426704, 1, 0.5450981, 0, 1,
-1.363105, 0.2139745, -1.616697, 1, 0.5529412, 0, 1,
-1.36248, -0.07557909, -2.278118, 1, 0.5568628, 0, 1,
-1.360702, 0.1446339, -1.672096, 1, 0.5647059, 0, 1,
-1.347276, -0.05187923, -0.7010091, 1, 0.5686275, 0, 1,
-1.335936, -1.765747, -3.776016, 1, 0.5764706, 0, 1,
-1.325976, 2.208277, -0.141388, 1, 0.5803922, 0, 1,
-1.325651, 1.262323, 0.05234443, 1, 0.5882353, 0, 1,
-1.32323, 0.1064293, -2.506965, 1, 0.5921569, 0, 1,
-1.322884, -0.1089613, -3.756605, 1, 0.6, 0, 1,
-1.320697, -1.520362, -3.616208, 1, 0.6078432, 0, 1,
-1.320262, 0.594456, -1.099868, 1, 0.6117647, 0, 1,
-1.304163, -0.08327378, -1.305889, 1, 0.6196079, 0, 1,
-1.29178, -2.830333, -2.646559, 1, 0.6235294, 0, 1,
-1.285688, 0.2348439, -1.221611, 1, 0.6313726, 0, 1,
-1.274442, 0.5750619, -1.341058, 1, 0.6352941, 0, 1,
-1.264214, 0.5075607, -1.291921, 1, 0.6431373, 0, 1,
-1.261155, -0.881139, -3.379812, 1, 0.6470588, 0, 1,
-1.257938, 1.140535, -1.7521, 1, 0.654902, 0, 1,
-1.251798, -1.004938, -4.183891, 1, 0.6588235, 0, 1,
-1.239388, 2.032624, -1.283677, 1, 0.6666667, 0, 1,
-1.237073, -0.07050673, -1.914823, 1, 0.6705883, 0, 1,
-1.228784, -0.4468544, -1.32021, 1, 0.6784314, 0, 1,
-1.223889, -0.00990917, -1.161081, 1, 0.682353, 0, 1,
-1.222551, -1.742168, -2.890427, 1, 0.6901961, 0, 1,
-1.222023, 0.317116, 0.02030587, 1, 0.6941177, 0, 1,
-1.214942, -1.120186, -0.3134555, 1, 0.7019608, 0, 1,
-1.210702, 0.07577039, -1.728385, 1, 0.7098039, 0, 1,
-1.200659, -0.1627608, -0.9827257, 1, 0.7137255, 0, 1,
-1.192448, 0.03476964, -0.5169818, 1, 0.7215686, 0, 1,
-1.189737, 0.06560165, -1.118481, 1, 0.7254902, 0, 1,
-1.188028, -0.3604434, -1.786599, 1, 0.7333333, 0, 1,
-1.188026, -0.8127366, -1.803028, 1, 0.7372549, 0, 1,
-1.187857, -0.3509468, -1.405741, 1, 0.7450981, 0, 1,
-1.172992, -0.663911, -2.303628, 1, 0.7490196, 0, 1,
-1.170027, -1.45449, -1.759284, 1, 0.7568628, 0, 1,
-1.168622, 0.08007811, -2.083859, 1, 0.7607843, 0, 1,
-1.158983, -0.4157896, -1.700225, 1, 0.7686275, 0, 1,
-1.158674, 0.1550315, 0.05721233, 1, 0.772549, 0, 1,
-1.152697, -0.9633257, -2.875399, 1, 0.7803922, 0, 1,
-1.149775, -0.8884215, -1.53109, 1, 0.7843137, 0, 1,
-1.147837, -1.356573, -2.53448, 1, 0.7921569, 0, 1,
-1.142837, -0.2358428, -0.6991117, 1, 0.7960784, 0, 1,
-1.139706, 1.172888, -0.3209959, 1, 0.8039216, 0, 1,
-1.138626, -0.03083163, -2.890485, 1, 0.8117647, 0, 1,
-1.135998, 1.027538, 0.6695504, 1, 0.8156863, 0, 1,
-1.131678, -1.18578, -2.782461, 1, 0.8235294, 0, 1,
-1.131348, 0.5354024, -1.462506, 1, 0.827451, 0, 1,
-1.125487, 0.9715512, 0.3082722, 1, 0.8352941, 0, 1,
-1.122469, -1.755055, -1.500319, 1, 0.8392157, 0, 1,
-1.110236, -1.230165, -1.148171, 1, 0.8470588, 0, 1,
-1.107385, 0.3153012, -0.3438159, 1, 0.8509804, 0, 1,
-1.098647, 0.2653792, -1.667788, 1, 0.8588235, 0, 1,
-1.094423, -0.8234665, -1.856774, 1, 0.8627451, 0, 1,
-1.091789, -0.2085718, -1.093957, 1, 0.8705882, 0, 1,
-1.090085, 0.2202818, -1.227672, 1, 0.8745098, 0, 1,
-1.087351, -0.5775309, -2.593453, 1, 0.8823529, 0, 1,
-1.08452, -0.3706107, -0.480452, 1, 0.8862745, 0, 1,
-1.072075, -0.609749, -2.665922, 1, 0.8941177, 0, 1,
-1.069789, 0.2759032, -2.281425, 1, 0.8980392, 0, 1,
-1.063535, 1.23369, -1.755947, 1, 0.9058824, 0, 1,
-1.063232, -0.330314, -3.350225, 1, 0.9137255, 0, 1,
-1.060648, -0.9088901, -3.508861, 1, 0.9176471, 0, 1,
-1.048931, -1.349602, -1.619817, 1, 0.9254902, 0, 1,
-1.048423, -0.6974896, -0.9242842, 1, 0.9294118, 0, 1,
-1.041137, -0.7702026, -0.5159082, 1, 0.9372549, 0, 1,
-1.039717, 0.1496447, -2.99024, 1, 0.9411765, 0, 1,
-1.037035, 1.221474, -1.253042, 1, 0.9490196, 0, 1,
-1.036162, 0.1733169, -4.231636, 1, 0.9529412, 0, 1,
-1.025882, 1.594844, -0.8233498, 1, 0.9607843, 0, 1,
-1.023906, 1.510422, 1.032968, 1, 0.9647059, 0, 1,
-1.014348, -2.432753, -4.195835, 1, 0.972549, 0, 1,
-1.013142, 0.3372427, -0.08517287, 1, 0.9764706, 0, 1,
-1.012042, -0.9072415, -3.267101, 1, 0.9843137, 0, 1,
-1.005167, 0.8271818, -0.01482236, 1, 0.9882353, 0, 1,
-0.9969866, 0.6039618, -0.7224858, 1, 0.9960784, 0, 1,
-0.9889563, -0.6515821, -1.626239, 0.9960784, 1, 0, 1,
-0.9839347, 0.1553497, -2.322781, 0.9921569, 1, 0, 1,
-0.9467944, -1.233218, -2.701296, 0.9843137, 1, 0, 1,
-0.9466481, -0.5201409, -3.827487, 0.9803922, 1, 0, 1,
-0.9410965, 0.9492859, -1.451377, 0.972549, 1, 0, 1,
-0.9346299, -0.4143666, -2.86055, 0.9686275, 1, 0, 1,
-0.933297, -0.1007954, -1.566099, 0.9607843, 1, 0, 1,
-0.9285669, 0.4197924, -1.347968, 0.9568627, 1, 0, 1,
-0.9278122, 0.7719088, 0.147418, 0.9490196, 1, 0, 1,
-0.9268548, -0.4798758, -2.173648, 0.945098, 1, 0, 1,
-0.925492, 0.3830312, -0.6166013, 0.9372549, 1, 0, 1,
-0.9245043, 0.7695553, -1.172566, 0.9333333, 1, 0, 1,
-0.920671, -0.5243587, -2.169068, 0.9254902, 1, 0, 1,
-0.915062, 0.8708875, -1.690108, 0.9215686, 1, 0, 1,
-0.9149994, 1.121602, 1.951215, 0.9137255, 1, 0, 1,
-0.9063416, 0.2004466, -1.912388, 0.9098039, 1, 0, 1,
-0.9060791, 0.5907699, -1.516216, 0.9019608, 1, 0, 1,
-0.8934665, -0.6384841, -1.274129, 0.8941177, 1, 0, 1,
-0.8904098, -1.233689, -3.912329, 0.8901961, 1, 0, 1,
-0.8901725, 0.9616486, -0.8313687, 0.8823529, 1, 0, 1,
-0.8898013, 0.3164482, -2.703232, 0.8784314, 1, 0, 1,
-0.8897849, -1.473079, -0.9029417, 0.8705882, 1, 0, 1,
-0.8873922, -1.054275, -2.200354, 0.8666667, 1, 0, 1,
-0.884403, -0.4033623, -1.899161, 0.8588235, 1, 0, 1,
-0.8819205, -1.533418, -1.76969, 0.854902, 1, 0, 1,
-0.8787411, -0.214052, -1.028183, 0.8470588, 1, 0, 1,
-0.8746063, 0.3233682, 0.3207726, 0.8431373, 1, 0, 1,
-0.8732854, 1.464488, -1.061348, 0.8352941, 1, 0, 1,
-0.8715754, -0.312375, -0.9898736, 0.8313726, 1, 0, 1,
-0.8683596, 0.0170184, -0.6078623, 0.8235294, 1, 0, 1,
-0.8552928, -1.002375, -2.579066, 0.8196079, 1, 0, 1,
-0.8446102, -0.00158705, -2.285518, 0.8117647, 1, 0, 1,
-0.8445998, 2.36391, 0.5355342, 0.8078431, 1, 0, 1,
-0.8437725, 0.9820725, -1.171897, 0.8, 1, 0, 1,
-0.8436415, 0.8498166, 0.146184, 0.7921569, 1, 0, 1,
-0.8405798, -0.03884039, -0.3010579, 0.7882353, 1, 0, 1,
-0.840389, 1.296988, 1.069365, 0.7803922, 1, 0, 1,
-0.8386959, -0.7800646, -0.9796975, 0.7764706, 1, 0, 1,
-0.8372893, -0.02911955, -1.41276, 0.7686275, 1, 0, 1,
-0.8315094, -0.2078099, -2.513886, 0.7647059, 1, 0, 1,
-0.8300339, -2.039381, -2.90227, 0.7568628, 1, 0, 1,
-0.8288888, 0.65196, -1.113336, 0.7529412, 1, 0, 1,
-0.8274207, -0.2932103, -1.951978, 0.7450981, 1, 0, 1,
-0.8259034, 0.71298, -0.5664447, 0.7411765, 1, 0, 1,
-0.8248192, -0.0103328, -2.117019, 0.7333333, 1, 0, 1,
-0.8177727, -0.2594129, -2.793454, 0.7294118, 1, 0, 1,
-0.8162363, 0.3334405, -0.836768, 0.7215686, 1, 0, 1,
-0.814338, 0.4458845, -0.8842407, 0.7176471, 1, 0, 1,
-0.805413, -0.08809851, -1.274781, 0.7098039, 1, 0, 1,
-0.8044166, -0.822575, -3.461935, 0.7058824, 1, 0, 1,
-0.7992358, -0.9274174, -1.77952, 0.6980392, 1, 0, 1,
-0.7943663, -1.484121, -1.622704, 0.6901961, 1, 0, 1,
-0.7937171, -0.0670261, -3.742567, 0.6862745, 1, 0, 1,
-0.7888671, -0.9718401, -3.978669, 0.6784314, 1, 0, 1,
-0.7831551, 1.305924, -2.04845, 0.6745098, 1, 0, 1,
-0.7788646, 1.18085, -1.486666, 0.6666667, 1, 0, 1,
-0.7758598, -1.68627, -2.360761, 0.6627451, 1, 0, 1,
-0.7697937, -1.371764, -2.645, 0.654902, 1, 0, 1,
-0.7680498, -0.02054992, -0.1890045, 0.6509804, 1, 0, 1,
-0.7591835, 1.577479, -2.304428, 0.6431373, 1, 0, 1,
-0.7572054, 0.9410577, -0.3858357, 0.6392157, 1, 0, 1,
-0.7563052, -0.4337199, -2.792716, 0.6313726, 1, 0, 1,
-0.7545424, 0.8221006, -0.4950134, 0.627451, 1, 0, 1,
-0.7531881, -1.030264, -2.90013, 0.6196079, 1, 0, 1,
-0.7527812, 0.9465259, -0.9188982, 0.6156863, 1, 0, 1,
-0.7523481, 0.5095426, -0.9991836, 0.6078432, 1, 0, 1,
-0.7450208, -1.60307, -2.224708, 0.6039216, 1, 0, 1,
-0.732518, -0.5915636, -0.570671, 0.5960785, 1, 0, 1,
-0.7312892, -0.2915744, -3.479667, 0.5882353, 1, 0, 1,
-0.7310672, -1.608017, -3.553194, 0.5843138, 1, 0, 1,
-0.7285814, 0.6408358, -0.4118506, 0.5764706, 1, 0, 1,
-0.7237017, -0.1641931, -1.507627, 0.572549, 1, 0, 1,
-0.7161561, 0.3532731, -1.546758, 0.5647059, 1, 0, 1,
-0.7106064, 2.109, -0.2191547, 0.5607843, 1, 0, 1,
-0.7078893, 0.4803407, 1.459569, 0.5529412, 1, 0, 1,
-0.6997662, -0.4637863, -3.251637, 0.5490196, 1, 0, 1,
-0.6976327, -0.8653313, -2.079487, 0.5411765, 1, 0, 1,
-0.6971459, 0.4735302, -2.397143, 0.5372549, 1, 0, 1,
-0.6941665, -0.7029769, -2.393762, 0.5294118, 1, 0, 1,
-0.6895818, 0.2271667, -0.6886894, 0.5254902, 1, 0, 1,
-0.6800717, -0.1112827, -0.1904612, 0.5176471, 1, 0, 1,
-0.6743295, 0.778402, -3.328457, 0.5137255, 1, 0, 1,
-0.6731984, 0.5692451, -2.082825, 0.5058824, 1, 0, 1,
-0.6707043, 0.4629061, -1.779024, 0.5019608, 1, 0, 1,
-0.6695278, -1.119941, -2.951087, 0.4941176, 1, 0, 1,
-0.6694345, -0.9324557, -2.135252, 0.4862745, 1, 0, 1,
-0.6647813, -1.116786, -3.523164, 0.4823529, 1, 0, 1,
-0.6638485, 0.8664395, -0.2305431, 0.4745098, 1, 0, 1,
-0.663682, 1.035346, 0.3815852, 0.4705882, 1, 0, 1,
-0.6579135, 0.239816, -1.153796, 0.4627451, 1, 0, 1,
-0.6474767, -0.3422459, -1.398186, 0.4588235, 1, 0, 1,
-0.6467472, -0.8967522, -0.525304, 0.4509804, 1, 0, 1,
-0.6423085, -0.9734735, -2.417697, 0.4470588, 1, 0, 1,
-0.6413879, -1.011053, -3.545748, 0.4392157, 1, 0, 1,
-0.6351448, -0.9576208, -2.219057, 0.4352941, 1, 0, 1,
-0.6324005, 1.144943, -1.330658, 0.427451, 1, 0, 1,
-0.6284518, -1.292283, -2.10949, 0.4235294, 1, 0, 1,
-0.6225396, -0.3206637, -1.966408, 0.4156863, 1, 0, 1,
-0.6199525, 1.09944, -0.4265776, 0.4117647, 1, 0, 1,
-0.6178793, 0.04449128, -0.0249583, 0.4039216, 1, 0, 1,
-0.6172506, -1.728023, -2.498888, 0.3960784, 1, 0, 1,
-0.616809, -0.99436, -1.968655, 0.3921569, 1, 0, 1,
-0.6156576, -0.4327566, -2.445891, 0.3843137, 1, 0, 1,
-0.6104335, -2.074567, -3.633945, 0.3803922, 1, 0, 1,
-0.6084436, -0.04878259, -4.892318, 0.372549, 1, 0, 1,
-0.6083082, 0.3256409, -0.1703884, 0.3686275, 1, 0, 1,
-0.6078851, 0.4256335, -2.073854, 0.3607843, 1, 0, 1,
-0.5981284, 1.026014, -1.169538, 0.3568628, 1, 0, 1,
-0.5971651, -0.1115916, -3.022507, 0.3490196, 1, 0, 1,
-0.5964766, 1.23356, -2.273115, 0.345098, 1, 0, 1,
-0.5962564, 0.131981, -2.119749, 0.3372549, 1, 0, 1,
-0.5920066, 0.3384923, -1.684038, 0.3333333, 1, 0, 1,
-0.5896823, 0.5167215, -0.991413, 0.3254902, 1, 0, 1,
-0.5843301, -1.806741, -3.819436, 0.3215686, 1, 0, 1,
-0.5826052, 1.256931, -2.174493, 0.3137255, 1, 0, 1,
-0.5815902, 0.5690066, -1.713353, 0.3098039, 1, 0, 1,
-0.5749221, -0.09859177, -3.592984, 0.3019608, 1, 0, 1,
-0.5724925, -0.06699195, -3.571879, 0.2941177, 1, 0, 1,
-0.5701263, -0.09705008, -0.5711616, 0.2901961, 1, 0, 1,
-0.5697954, 2.039594, -0.4074964, 0.282353, 1, 0, 1,
-0.5693644, 0.937027, -1.253805, 0.2784314, 1, 0, 1,
-0.5687907, -0.04975552, -1.228478, 0.2705882, 1, 0, 1,
-0.5663409, -0.3719584, 0.2789854, 0.2666667, 1, 0, 1,
-0.5645176, 0.5452317, -1.616924, 0.2588235, 1, 0, 1,
-0.5640703, -1.014504, -2.687516, 0.254902, 1, 0, 1,
-0.5576016, 0.76119, -0.002210509, 0.2470588, 1, 0, 1,
-0.5555674, 1.014095, -1.521708, 0.2431373, 1, 0, 1,
-0.5523645, -0.8447596, -1.00491, 0.2352941, 1, 0, 1,
-0.5519759, -0.7917455, -3.169938, 0.2313726, 1, 0, 1,
-0.5509561, 0.07042238, -1.823453, 0.2235294, 1, 0, 1,
-0.548431, -0.1240299, -2.659914, 0.2196078, 1, 0, 1,
-0.5425841, -0.0479036, -2.056917, 0.2117647, 1, 0, 1,
-0.5396358, -0.6208919, -2.260935, 0.2078431, 1, 0, 1,
-0.5358677, 0.2573387, -0.5833014, 0.2, 1, 0, 1,
-0.5351698, -1.01636, -2.432357, 0.1921569, 1, 0, 1,
-0.5326118, -0.6662936, -1.825655, 0.1882353, 1, 0, 1,
-0.5317087, -1.126288, -3.349283, 0.1803922, 1, 0, 1,
-0.5311028, 0.03128318, -0.3996554, 0.1764706, 1, 0, 1,
-0.528081, 1.099226, -0.1782602, 0.1686275, 1, 0, 1,
-0.5279002, 2.732087, 0.4757876, 0.1647059, 1, 0, 1,
-0.5272177, 1.423627, -0.1752933, 0.1568628, 1, 0, 1,
-0.5190812, 0.09847453, -3.089773, 0.1529412, 1, 0, 1,
-0.5142243, -0.1341611, -0.3648972, 0.145098, 1, 0, 1,
-0.5108356, -1.960702, -3.113188, 0.1411765, 1, 0, 1,
-0.5087466, -2.328374, -3.872449, 0.1333333, 1, 0, 1,
-0.5078689, -1.924915, -1.698613, 0.1294118, 1, 0, 1,
-0.499422, 0.153835, -2.108616, 0.1215686, 1, 0, 1,
-0.4954429, -0.6798151, -2.427088, 0.1176471, 1, 0, 1,
-0.4935932, -0.8756425, -3.669868, 0.1098039, 1, 0, 1,
-0.4864588, 0.5556981, -1.58584, 0.1058824, 1, 0, 1,
-0.4859583, -0.2265509, -2.603206, 0.09803922, 1, 0, 1,
-0.4838444, 1.722776, 0.4964102, 0.09019608, 1, 0, 1,
-0.4822306, 0.3154029, -0.9212547, 0.08627451, 1, 0, 1,
-0.4802369, 0.5251881, -0.4755441, 0.07843138, 1, 0, 1,
-0.4774252, -1.802431, -3.228957, 0.07450981, 1, 0, 1,
-0.4770299, 1.076587, -1.339349, 0.06666667, 1, 0, 1,
-0.4694541, 0.1992967, -1.858044, 0.0627451, 1, 0, 1,
-0.4658798, -1.143592, -2.058759, 0.05490196, 1, 0, 1,
-0.463817, 0.6833746, 0.471379, 0.05098039, 1, 0, 1,
-0.463072, -1.236006, -3.725892, 0.04313726, 1, 0, 1,
-0.457511, -0.9934561, -1.976424, 0.03921569, 1, 0, 1,
-0.4561386, -0.3640037, -3.275597, 0.03137255, 1, 0, 1,
-0.454661, -1.516661, -5.573456, 0.02745098, 1, 0, 1,
-0.4544267, 1.302963, 0.3214159, 0.01960784, 1, 0, 1,
-0.4510644, 1.508276, -0.7379497, 0.01568628, 1, 0, 1,
-0.4436599, -0.03197813, -2.465303, 0.007843138, 1, 0, 1,
-0.4427822, -0.3923314, -2.364098, 0.003921569, 1, 0, 1,
-0.4390301, -0.4055669, -1.242795, 0, 1, 0.003921569, 1,
-0.4309895, 0.06047096, -3.889224, 0, 1, 0.01176471, 1,
-0.4308994, -1.134383, -1.660291, 0, 1, 0.01568628, 1,
-0.4244594, 1.949198, -1.804538, 0, 1, 0.02352941, 1,
-0.4231949, 0.3157676, -0.3716797, 0, 1, 0.02745098, 1,
-0.4209718, -0.689601, -2.53381, 0, 1, 0.03529412, 1,
-0.4201663, 0.2567257, -3.215089, 0, 1, 0.03921569, 1,
-0.417221, -1.721766, -2.643626, 0, 1, 0.04705882, 1,
-0.4153091, 0.5209764, -1.234492, 0, 1, 0.05098039, 1,
-0.4149005, 0.384645, -3.181522, 0, 1, 0.05882353, 1,
-0.4128907, 2.308176, -1.082196, 0, 1, 0.0627451, 1,
-0.4119428, -0.556354, -2.007961, 0, 1, 0.07058824, 1,
-0.4111592, 0.4474025, -1.992637, 0, 1, 0.07450981, 1,
-0.4103281, -0.4344392, -1.916479, 0, 1, 0.08235294, 1,
-0.4095449, 0.783851, 2.965556, 0, 1, 0.08627451, 1,
-0.4094332, -0.5622619, -2.687315, 0, 1, 0.09411765, 1,
-0.4080421, 1.195856, -0.7465102, 0, 1, 0.1019608, 1,
-0.4057003, 0.9155722, 0.3528774, 0, 1, 0.1058824, 1,
-0.4034311, 1.165933, -2.696169, 0, 1, 0.1137255, 1,
-0.4033787, 0.3835343, -1.551348, 0, 1, 0.1176471, 1,
-0.4033014, -0.7574397, -5.058864, 0, 1, 0.1254902, 1,
-0.3968148, -2.296767, -3.4888, 0, 1, 0.1294118, 1,
-0.3964679, 0.5678275, -2.288335, 0, 1, 0.1372549, 1,
-0.3943529, -0.9434282, -2.391167, 0, 1, 0.1411765, 1,
-0.3935861, 0.01563359, -2.0849, 0, 1, 0.1490196, 1,
-0.3907815, 0.6647176, -1.35897, 0, 1, 0.1529412, 1,
-0.388226, 1.472469, 0.7540352, 0, 1, 0.1607843, 1,
-0.3848646, -1.499177, -3.336946, 0, 1, 0.1647059, 1,
-0.3833888, 0.8033253, 0.6513144, 0, 1, 0.172549, 1,
-0.380674, 0.6910279, -2.322067, 0, 1, 0.1764706, 1,
-0.3786189, -1.430895, -1.498574, 0, 1, 0.1843137, 1,
-0.3765981, -0.1081662, -1.978732, 0, 1, 0.1882353, 1,
-0.3729689, -0.1616747, -2.16151, 0, 1, 0.1960784, 1,
-0.3722697, 0.3347069, -1.200753, 0, 1, 0.2039216, 1,
-0.3706455, 0.5548102, -2.603928, 0, 1, 0.2078431, 1,
-0.3683026, 0.7410355, -1.692922, 0, 1, 0.2156863, 1,
-0.366694, 0.2757209, -1.421003, 0, 1, 0.2196078, 1,
-0.3664277, 1.378708, -0.277149, 0, 1, 0.227451, 1,
-0.3658276, 0.9100637, 0.006827092, 0, 1, 0.2313726, 1,
-0.3649917, -0.2294054, -1.092435, 0, 1, 0.2392157, 1,
-0.356535, 0.5964684, -0.8300906, 0, 1, 0.2431373, 1,
-0.3522442, 0.4753377, -0.07898545, 0, 1, 0.2509804, 1,
-0.3520979, 0.9070315, -2.734537, 0, 1, 0.254902, 1,
-0.3510403, -1.482669, -3.772565, 0, 1, 0.2627451, 1,
-0.3475595, 2.113388, 1.62353, 0, 1, 0.2666667, 1,
-0.3453659, 1.117234, -1.06261, 0, 1, 0.2745098, 1,
-0.3407513, 0.08229711, -1.746412, 0, 1, 0.2784314, 1,
-0.339066, -0.2466687, -2.844728, 0, 1, 0.2862745, 1,
-0.3357599, -0.2080276, -3.133573, 0, 1, 0.2901961, 1,
-0.3308817, 0.479795, 0.7294337, 0, 1, 0.2980392, 1,
-0.3300837, -1.129475, -1.48219, 0, 1, 0.3058824, 1,
-0.3276318, -0.8171095, -0.3878512, 0, 1, 0.3098039, 1,
-0.3268252, -0.6201345, -2.890975, 0, 1, 0.3176471, 1,
-0.3222398, -1.024576, -2.04715, 0, 1, 0.3215686, 1,
-0.3206587, 0.2480879, 0.1801076, 0, 1, 0.3294118, 1,
-0.3183839, 0.1553899, 0.1207382, 0, 1, 0.3333333, 1,
-0.3175978, 1.559932, -1.023889, 0, 1, 0.3411765, 1,
-0.3174879, 1.180329, -0.4638898, 0, 1, 0.345098, 1,
-0.3155649, -0.6844983, -4.813044, 0, 1, 0.3529412, 1,
-0.3149493, 0.3818, -1.423154, 0, 1, 0.3568628, 1,
-0.3148874, -0.1755226, -2.797758, 0, 1, 0.3647059, 1,
-0.3144074, 0.2052237, 0.359193, 0, 1, 0.3686275, 1,
-0.3136011, 0.1260674, -0.1818065, 0, 1, 0.3764706, 1,
-0.3118498, 0.5810755, 0.0468514, 0, 1, 0.3803922, 1,
-0.3086622, 0.5239842, -0.7577537, 0, 1, 0.3882353, 1,
-0.3073665, 0.6792726, -1.111503, 0, 1, 0.3921569, 1,
-0.3057565, 1.054981, -1.40589, 0, 1, 0.4, 1,
-0.3051911, 0.1882703, 0.02249188, 0, 1, 0.4078431, 1,
-0.3036154, -0.2689562, -1.426952, 0, 1, 0.4117647, 1,
-0.3012493, -0.826785, -4.27782, 0, 1, 0.4196078, 1,
-0.2967993, -0.6331661, -3.00851, 0, 1, 0.4235294, 1,
-0.293083, -0.5322488, -2.295568, 0, 1, 0.4313726, 1,
-0.2914895, 0.2611077, -1.55512, 0, 1, 0.4352941, 1,
-0.2877766, 0.4212528, -0.7930377, 0, 1, 0.4431373, 1,
-0.2853908, -0.2224566, -2.362295, 0, 1, 0.4470588, 1,
-0.2848887, -0.9269399, -1.563406, 0, 1, 0.454902, 1,
-0.2845323, -1.049919, -2.670942, 0, 1, 0.4588235, 1,
-0.2770351, 0.337579, 0.03869131, 0, 1, 0.4666667, 1,
-0.2750382, -1.142338, -2.257052, 0, 1, 0.4705882, 1,
-0.2729174, -1.475575, -3.742536, 0, 1, 0.4784314, 1,
-0.2705013, 0.5690229, -1.779679, 0, 1, 0.4823529, 1,
-0.2696661, 0.893948, 0.04607214, 0, 1, 0.4901961, 1,
-0.2665094, -1.109516, -2.333352, 0, 1, 0.4941176, 1,
-0.2660548, 0.01324493, -1.488819, 0, 1, 0.5019608, 1,
-0.2656646, -0.07235356, -1.331785, 0, 1, 0.509804, 1,
-0.2547203, 0.7931746, -0.4664468, 0, 1, 0.5137255, 1,
-0.2543765, 0.9848134, 0.7552559, 0, 1, 0.5215687, 1,
-0.2538145, -1.215665, -4.690856, 0, 1, 0.5254902, 1,
-0.2461014, -0.07173953, -1.143458, 0, 1, 0.5333334, 1,
-0.2444553, -0.5132109, -3.97125, 0, 1, 0.5372549, 1,
-0.2423179, -0.3878677, -1.459767, 0, 1, 0.5450981, 1,
-0.2419188, -1.320303, -3.211517, 0, 1, 0.5490196, 1,
-0.2333291, 1.266607, -0.003366526, 0, 1, 0.5568628, 1,
-0.2317711, -1.235791, -2.634545, 0, 1, 0.5607843, 1,
-0.231441, -0.3623338, -1.937094, 0, 1, 0.5686275, 1,
-0.2299605, 0.511745, -0.624055, 0, 1, 0.572549, 1,
-0.2292312, 0.2194374, -1.270452, 0, 1, 0.5803922, 1,
-0.227969, -0.4272479, -2.295871, 0, 1, 0.5843138, 1,
-0.2248535, -0.9045212, -2.37319, 0, 1, 0.5921569, 1,
-0.2243212, -0.803619, -2.62869, 0, 1, 0.5960785, 1,
-0.2205915, 1.483302, -0.1084764, 0, 1, 0.6039216, 1,
-0.2170144, -0.7165878, -0.1627894, 0, 1, 0.6117647, 1,
-0.2163255, 0.119161, -1.377824, 0, 1, 0.6156863, 1,
-0.2143698, -1.934057, -2.359486, 0, 1, 0.6235294, 1,
-0.2084765, 0.1838009, -0.7916223, 0, 1, 0.627451, 1,
-0.207177, -0.9095458, -3.541128, 0, 1, 0.6352941, 1,
-0.2067741, 0.3033993, -0.7281175, 0, 1, 0.6392157, 1,
-0.2065818, -0.6034219, -3.634804, 0, 1, 0.6470588, 1,
-0.2039876, -1.173135, -3.095771, 0, 1, 0.6509804, 1,
-0.2025053, -1.296118, -2.673403, 0, 1, 0.6588235, 1,
-0.2018738, 0.2419571, -1.939867, 0, 1, 0.6627451, 1,
-0.2007691, 1.727328, -1.473076, 0, 1, 0.6705883, 1,
-0.1994515, -0.8824278, -3.34715, 0, 1, 0.6745098, 1,
-0.1944468, -2.198004, -5.44139, 0, 1, 0.682353, 1,
-0.1925351, -0.5412291, -3.731805, 0, 1, 0.6862745, 1,
-0.1913209, -0.5083097, -4.451671, 0, 1, 0.6941177, 1,
-0.1870317, 0.6746342, 0.01433518, 0, 1, 0.7019608, 1,
-0.1858434, -0.8077559, -2.097696, 0, 1, 0.7058824, 1,
-0.1854762, -0.03659229, -2.030302, 0, 1, 0.7137255, 1,
-0.1826327, 0.01646097, -1.046655, 0, 1, 0.7176471, 1,
-0.1817935, -0.6571579, -2.015499, 0, 1, 0.7254902, 1,
-0.1805945, -0.8732521, -2.684425, 0, 1, 0.7294118, 1,
-0.1803957, 0.5294836, 0.3727261, 0, 1, 0.7372549, 1,
-0.1799545, -1.026452, -3.375746, 0, 1, 0.7411765, 1,
-0.1788542, 1.04929, -1.456688, 0, 1, 0.7490196, 1,
-0.1747127, -0.4137833, -3.287634, 0, 1, 0.7529412, 1,
-0.1741735, 0.6537703, 0.5981603, 0, 1, 0.7607843, 1,
-0.1726992, -1.340436, -4.200667, 0, 1, 0.7647059, 1,
-0.170874, -1.041992, -2.528386, 0, 1, 0.772549, 1,
-0.1612181, -0.2000508, -1.979695, 0, 1, 0.7764706, 1,
-0.1609627, -0.5768801, -3.497405, 0, 1, 0.7843137, 1,
-0.1609335, -0.05842832, -2.088774, 0, 1, 0.7882353, 1,
-0.1581221, 1.944108, -0.9109384, 0, 1, 0.7960784, 1,
-0.1565304, -1.596241, -4.114197, 0, 1, 0.8039216, 1,
-0.1549532, 1.727308, -0.1826396, 0, 1, 0.8078431, 1,
-0.1518994, -0.6011797, -1.369674, 0, 1, 0.8156863, 1,
-0.151799, 0.8953579, 1.158428, 0, 1, 0.8196079, 1,
-0.1517675, -0.009977465, -2.076453, 0, 1, 0.827451, 1,
-0.1508789, -0.7388813, -5.312517, 0, 1, 0.8313726, 1,
-0.1505226, -0.8511341, -3.148769, 0, 1, 0.8392157, 1,
-0.1470005, 0.4389522, 1.34497, 0, 1, 0.8431373, 1,
-0.1450564, -1.631141, -2.824922, 0, 1, 0.8509804, 1,
-0.1439441, 0.00892007, -3.206938, 0, 1, 0.854902, 1,
-0.1393095, 0.1994313, -0.3148728, 0, 1, 0.8627451, 1,
-0.1385839, -0.6031594, -5.332863, 0, 1, 0.8666667, 1,
-0.133821, 0.6305205, 1.268055, 0, 1, 0.8745098, 1,
-0.1286136, -1.236146, -3.282451, 0, 1, 0.8784314, 1,
-0.1283813, -0.1053265, -2.726375, 0, 1, 0.8862745, 1,
-0.1281862, 2.390704, -1.501628, 0, 1, 0.8901961, 1,
-0.1276283, 0.6098194, -0.4999802, 0, 1, 0.8980392, 1,
-0.1172702, -1.01728, -3.507057, 0, 1, 0.9058824, 1,
-0.1156633, -0.7536567, -4.739119, 0, 1, 0.9098039, 1,
-0.1135166, 0.2460292, -0.7017577, 0, 1, 0.9176471, 1,
-0.1095258, -0.05336607, -1.03239, 0, 1, 0.9215686, 1,
-0.1052135, -0.7627427, -2.836359, 0, 1, 0.9294118, 1,
-0.1037882, -0.1208968, -1.089931, 0, 1, 0.9333333, 1,
-0.1004441, 0.7115157, 0.9698327, 0, 1, 0.9411765, 1,
-0.1001678, -0.05878124, -1.581088, 0, 1, 0.945098, 1,
-0.09017774, 0.6117206, 0.2228481, 0, 1, 0.9529412, 1,
-0.08286806, -1.909941, -4.143508, 0, 1, 0.9568627, 1,
-0.08031469, 1.427909, 0.04691832, 0, 1, 0.9647059, 1,
-0.07288712, -0.07111335, -1.589638, 0, 1, 0.9686275, 1,
-0.06911305, -0.6468424, -3.1203, 0, 1, 0.9764706, 1,
-0.06901263, 0.4508113, 1.007388, 0, 1, 0.9803922, 1,
-0.0643673, 1.151922, 1.180136, 0, 1, 0.9882353, 1,
-0.06306832, -0.1050505, -2.25274, 0, 1, 0.9921569, 1,
-0.06150778, 0.1508235, -0.2825189, 0, 1, 1, 1,
-0.06139943, -1.959937, -2.183041, 0, 0.9921569, 1, 1,
-0.05719477, -1.124066, -3.708108, 0, 0.9882353, 1, 1,
-0.05015219, 0.3575089, 0.1175224, 0, 0.9803922, 1, 1,
-0.04739497, 1.866329, -0.9683353, 0, 0.9764706, 1, 1,
-0.04310001, -0.7617189, -3.326216, 0, 0.9686275, 1, 1,
-0.04052123, 0.5897126, 0.798349, 0, 0.9647059, 1, 1,
-0.04048996, -0.341951, -3.628989, 0, 0.9568627, 1, 1,
-0.0397256, -0.8665952, -2.343952, 0, 0.9529412, 1, 1,
-0.0378537, -0.5870129, -2.19424, 0, 0.945098, 1, 1,
-0.03570126, -1.406026, -2.870057, 0, 0.9411765, 1, 1,
-0.03369144, -1.105552, -2.245734, 0, 0.9333333, 1, 1,
-0.03247163, 0.6732306, -0.1814078, 0, 0.9294118, 1, 1,
-0.03060092, 0.4644696, -1.914718, 0, 0.9215686, 1, 1,
-0.02983947, -1.688106, -3.728798, 0, 0.9176471, 1, 1,
-0.02741287, -0.152755, -3.63411, 0, 0.9098039, 1, 1,
-0.01640528, 1.029232, -0.3334295, 0, 0.9058824, 1, 1,
-0.01538637, -1.780874, -2.639342, 0, 0.8980392, 1, 1,
-0.01088847, 0.1767516, -0.5122107, 0, 0.8901961, 1, 1,
-0.01041438, -0.6162973, -1.932955, 0, 0.8862745, 1, 1,
-0.01011489, -1.021295, -2.335892, 0, 0.8784314, 1, 1,
-0.009760239, -1.00464, -5.361134, 0, 0.8745098, 1, 1,
-0.005179286, 1.010909, -0.7567081, 0, 0.8666667, 1, 1,
-0.003074306, -0.3623231, -2.426067, 0, 0.8627451, 1, 1,
0.003693248, -2.115528, 4.045246, 0, 0.854902, 1, 1,
0.005113153, -0.3197689, 2.276775, 0, 0.8509804, 1, 1,
0.005163521, -0.05514217, 4.985076, 0, 0.8431373, 1, 1,
0.007998966, -0.6826646, 3.042641, 0, 0.8392157, 1, 1,
0.01194233, -2.441702, 4.516962, 0, 0.8313726, 1, 1,
0.0176225, -0.3888093, 3.097447, 0, 0.827451, 1, 1,
0.01796375, 1.734473, -1.96276, 0, 0.8196079, 1, 1,
0.01844763, -1.64467, 2.378335, 0, 0.8156863, 1, 1,
0.01855525, 0.1685497, -0.1765233, 0, 0.8078431, 1, 1,
0.01905277, 1.737355, -0.00227558, 0, 0.8039216, 1, 1,
0.02007814, 0.1048399, 0.7353466, 0, 0.7960784, 1, 1,
0.02008822, 1.52392, -0.6645243, 0, 0.7882353, 1, 1,
0.02409729, -0.214734, 1.949217, 0, 0.7843137, 1, 1,
0.02706292, 0.9038378, 0.9228256, 0, 0.7764706, 1, 1,
0.02890277, 0.2501543, -1.296973, 0, 0.772549, 1, 1,
0.02978708, -0.4058852, 4.985058, 0, 0.7647059, 1, 1,
0.0344967, 0.5835977, 0.1355774, 0, 0.7607843, 1, 1,
0.04119254, -1.926303, 4.718406, 0, 0.7529412, 1, 1,
0.0436493, -0.4934094, 2.835801, 0, 0.7490196, 1, 1,
0.04381744, 1.393975, -0.5227177, 0, 0.7411765, 1, 1,
0.04506196, 0.05225947, 1.712023, 0, 0.7372549, 1, 1,
0.04755906, 0.6046938, 0.4754001, 0, 0.7294118, 1, 1,
0.05073223, -2.568318, 2.534747, 0, 0.7254902, 1, 1,
0.05307795, 2.008404, 1.209887, 0, 0.7176471, 1, 1,
0.05630631, 0.7627075, 0.3844641, 0, 0.7137255, 1, 1,
0.05847359, -2.388586, 3.502105, 0, 0.7058824, 1, 1,
0.06065632, 1.387989, 0.6903865, 0, 0.6980392, 1, 1,
0.06673164, -1.010861, 4.632862, 0, 0.6941177, 1, 1,
0.07017749, -0.3631641, 3.791053, 0, 0.6862745, 1, 1,
0.07131761, -0.4536965, 1.925012, 0, 0.682353, 1, 1,
0.07374081, -0.8369334, 1.108148, 0, 0.6745098, 1, 1,
0.07643954, -0.3779112, 2.009388, 0, 0.6705883, 1, 1,
0.08475019, -2.134869, 3.314661, 0, 0.6627451, 1, 1,
0.08521291, 1.696505, -0.2266005, 0, 0.6588235, 1, 1,
0.09100421, 1.143694, -0.1892161, 0, 0.6509804, 1, 1,
0.09113295, -1.10815, 2.42358, 0, 0.6470588, 1, 1,
0.09377843, 0.2698665, 0.7308101, 0, 0.6392157, 1, 1,
0.09524928, 0.6792009, 1.905239, 0, 0.6352941, 1, 1,
0.09665289, -0.5062911, 2.565812, 0, 0.627451, 1, 1,
0.09681522, 0.6634998, -0.2372924, 0, 0.6235294, 1, 1,
0.09739282, 0.9578915, 1.433369, 0, 0.6156863, 1, 1,
0.09783141, -2.002424, 3.893854, 0, 0.6117647, 1, 1,
0.1021343, -0.9286839, 2.727257, 0, 0.6039216, 1, 1,
0.109034, 0.1677016, -0.4318435, 0, 0.5960785, 1, 1,
0.1147293, -0.3133191, 2.68262, 0, 0.5921569, 1, 1,
0.1211378, 0.270274, 0.9328415, 0, 0.5843138, 1, 1,
0.1228426, -0.7080526, 4.632367, 0, 0.5803922, 1, 1,
0.1244403, -1.057303, 1.691577, 0, 0.572549, 1, 1,
0.125953, 1.198988, -0.2993878, 0, 0.5686275, 1, 1,
0.1285769, -0.7450324, 2.021553, 0, 0.5607843, 1, 1,
0.1295189, 0.8045791, 0.7778541, 0, 0.5568628, 1, 1,
0.1316076, -0.8995872, 3.190884, 0, 0.5490196, 1, 1,
0.1319049, 1.127882, 0.9159963, 0, 0.5450981, 1, 1,
0.1359118, 0.5198293, -1.251558, 0, 0.5372549, 1, 1,
0.1360175, -0.4591458, 3.111434, 0, 0.5333334, 1, 1,
0.1393091, -1.052592, 4.224867, 0, 0.5254902, 1, 1,
0.1444791, -0.5751607, 2.61903, 0, 0.5215687, 1, 1,
0.1461959, -1.332801, 2.663499, 0, 0.5137255, 1, 1,
0.1470985, -0.9998442, 3.212449, 0, 0.509804, 1, 1,
0.1489942, -0.592343, 2.443481, 0, 0.5019608, 1, 1,
0.1528887, -0.4485878, 2.346492, 0, 0.4941176, 1, 1,
0.1548993, -1.903567, 3.151679, 0, 0.4901961, 1, 1,
0.1582162, -1.180396, 3.706551, 0, 0.4823529, 1, 1,
0.1591918, -0.5562789, 4.074755, 0, 0.4784314, 1, 1,
0.1620812, -0.8145234, 4.404785, 0, 0.4705882, 1, 1,
0.1643685, 0.02222258, 2.610689, 0, 0.4666667, 1, 1,
0.1705991, 0.2534308, 0.7618318, 0, 0.4588235, 1, 1,
0.1720158, 0.9139186, -0.7482312, 0, 0.454902, 1, 1,
0.1723817, -0.7015402, 3.750377, 0, 0.4470588, 1, 1,
0.1734141, -0.5153768, 1.723259, 0, 0.4431373, 1, 1,
0.1744525, -1.800336, 3.72945, 0, 0.4352941, 1, 1,
0.1795876, 0.167395, -0.3183002, 0, 0.4313726, 1, 1,
0.1809564, 0.1267976, 1.052078, 0, 0.4235294, 1, 1,
0.1853798, -0.1592155, 4.543651, 0, 0.4196078, 1, 1,
0.1865803, 0.8292003, -0.1179186, 0, 0.4117647, 1, 1,
0.1870255, -1.305524, 4.954212, 0, 0.4078431, 1, 1,
0.1906504, -0.3281142, 1.798084, 0, 0.4, 1, 1,
0.1927213, 0.5856504, 0.7381423, 0, 0.3921569, 1, 1,
0.1932962, 1.356273, -0.08122079, 0, 0.3882353, 1, 1,
0.1957742, 0.1903424, 0.07756878, 0, 0.3803922, 1, 1,
0.1995483, 0.5238166, -0.1451739, 0, 0.3764706, 1, 1,
0.2003932, -1.030753, 1.214263, 0, 0.3686275, 1, 1,
0.2009317, 0.2430882, 0.5752913, 0, 0.3647059, 1, 1,
0.2113244, -1.489412, 4.340784, 0, 0.3568628, 1, 1,
0.2119605, 1.216426, 1.162394, 0, 0.3529412, 1, 1,
0.2143341, -0.03909982, 0.7707286, 0, 0.345098, 1, 1,
0.214732, 0.6869025, 1.452773, 0, 0.3411765, 1, 1,
0.2172047, 0.3852189, 1.372269, 0, 0.3333333, 1, 1,
0.2176709, -1.210788, 1.936557, 0, 0.3294118, 1, 1,
0.2183909, 0.1740376, -0.5847925, 0, 0.3215686, 1, 1,
0.2227075, -1.561521, 2.91229, 0, 0.3176471, 1, 1,
0.2247325, -1.126356, 2.694127, 0, 0.3098039, 1, 1,
0.2299964, 1.599383, -0.2512715, 0, 0.3058824, 1, 1,
0.2353102, 1.668652, -0.4504527, 0, 0.2980392, 1, 1,
0.2365442, 0.8538946, 1.3886, 0, 0.2901961, 1, 1,
0.2380341, -0.5278445, 2.101309, 0, 0.2862745, 1, 1,
0.238169, -1.228595, 3.093719, 0, 0.2784314, 1, 1,
0.2393543, 0.3580285, 1.316516, 0, 0.2745098, 1, 1,
0.2403872, 0.867358, 1.135375, 0, 0.2666667, 1, 1,
0.2479876, -0.4283788, 0.3930672, 0, 0.2627451, 1, 1,
0.2540067, -0.003717845, 0.1187016, 0, 0.254902, 1, 1,
0.256994, 1.550501, -0.3630042, 0, 0.2509804, 1, 1,
0.2643393, 0.5088831, 0.825992, 0, 0.2431373, 1, 1,
0.2663607, -1.05079, 5.196012, 0, 0.2392157, 1, 1,
0.2669559, 0.6498954, 0.6937873, 0, 0.2313726, 1, 1,
0.2670115, -1.156244, 2.911046, 0, 0.227451, 1, 1,
0.2673277, -0.6300917, 1.195048, 0, 0.2196078, 1, 1,
0.2731622, -2.535839, 3.358448, 0, 0.2156863, 1, 1,
0.2750685, 0.6414103, 0.5401196, 0, 0.2078431, 1, 1,
0.2759506, -0.7481047, 3.430801, 0, 0.2039216, 1, 1,
0.275987, 0.2841328, 1.800449, 0, 0.1960784, 1, 1,
0.2765298, -0.32754, 1.80247, 0, 0.1882353, 1, 1,
0.2804218, 1.03346, 1.310701, 0, 0.1843137, 1, 1,
0.2830596, -0.4314471, 2.089492, 0, 0.1764706, 1, 1,
0.2921996, 1.591232, 1.546639, 0, 0.172549, 1, 1,
0.293552, 1.882749, 0.688671, 0, 0.1647059, 1, 1,
0.2942389, -0.569349, 1.76512, 0, 0.1607843, 1, 1,
0.2970883, -0.8699362, 3.251556, 0, 0.1529412, 1, 1,
0.2981185, -1.357434, 2.15038, 0, 0.1490196, 1, 1,
0.2994975, 0.5344642, -0.05796497, 0, 0.1411765, 1, 1,
0.302352, -0.1513118, 0.9698054, 0, 0.1372549, 1, 1,
0.3033245, 0.7090488, 0.2816503, 0, 0.1294118, 1, 1,
0.3057547, -0.8293917, 2.112441, 0, 0.1254902, 1, 1,
0.3088764, -1.373534, 1.9609, 0, 0.1176471, 1, 1,
0.3134759, 2.062048, 0.6261693, 0, 0.1137255, 1, 1,
0.3137117, 0.8267274, 0.8311048, 0, 0.1058824, 1, 1,
0.3159741, 1.682353, -0.3796613, 0, 0.09803922, 1, 1,
0.3175043, 1.031245, 1.882159, 0, 0.09411765, 1, 1,
0.3188343, 0.7107567, 1.597417, 0, 0.08627451, 1, 1,
0.3209013, 0.899044, 2.816019, 0, 0.08235294, 1, 1,
0.3214248, -0.8063462, 2.180211, 0, 0.07450981, 1, 1,
0.3285341, 1.053532, 0.1987271, 0, 0.07058824, 1, 1,
0.3298007, -2.579661, 2.792691, 0, 0.0627451, 1, 1,
0.3341744, -1.576967, 2.262978, 0, 0.05882353, 1, 1,
0.3359806, 1.328359, 0.04488305, 0, 0.05098039, 1, 1,
0.338069, -0.9551455, 3.721037, 0, 0.04705882, 1, 1,
0.3385647, 0.1005794, 3.319021, 0, 0.03921569, 1, 1,
0.3397467, -1.148786, 2.483187, 0, 0.03529412, 1, 1,
0.3412041, 0.007337781, 1.086393, 0, 0.02745098, 1, 1,
0.3413846, 2.122062, 0.664, 0, 0.02352941, 1, 1,
0.3463115, 1.026312, -0.2873924, 0, 0.01568628, 1, 1,
0.3528303, 0.5398641, 1.341161, 0, 0.01176471, 1, 1,
0.3594471, -0.1387161, 1.269959, 0, 0.003921569, 1, 1,
0.3601535, -0.9859239, 3.82598, 0.003921569, 0, 1, 1,
0.3606315, 1.073255, -0.5319472, 0.007843138, 0, 1, 1,
0.3627394, 0.6227154, 1.138193, 0.01568628, 0, 1, 1,
0.3632537, -0.8067803, 3.312088, 0.01960784, 0, 1, 1,
0.3720705, 0.1594723, 0.4341578, 0.02745098, 0, 1, 1,
0.3753287, 0.4133252, 0.1077527, 0.03137255, 0, 1, 1,
0.3793727, 1.477332, 0.1932856, 0.03921569, 0, 1, 1,
0.3810863, 0.05892172, 1.856963, 0.04313726, 0, 1, 1,
0.381495, -0.745662, 2.64464, 0.05098039, 0, 1, 1,
0.3843059, -2.098322, 3.901011, 0.05490196, 0, 1, 1,
0.3858976, 0.670639, 0.490191, 0.0627451, 0, 1, 1,
0.3862902, 0.6627309, 0.3597413, 0.06666667, 0, 1, 1,
0.3909691, -0.983006, 3.577661, 0.07450981, 0, 1, 1,
0.3929802, 0.7348514, 0.5497099, 0.07843138, 0, 1, 1,
0.3936746, 0.9205001, 1.94055, 0.08627451, 0, 1, 1,
0.3946131, -0.003771113, 0.3640932, 0.09019608, 0, 1, 1,
0.3957282, 1.361809, -0.4527969, 0.09803922, 0, 1, 1,
0.3962459, 0.1316145, 2.714753, 0.1058824, 0, 1, 1,
0.4003686, -0.7642497, 1.859024, 0.1098039, 0, 1, 1,
0.4010744, -0.7480149, 3.094444, 0.1176471, 0, 1, 1,
0.4029428, 1.449455, -0.1808992, 0.1215686, 0, 1, 1,
0.4031488, 2.432295, 0.6951548, 0.1294118, 0, 1, 1,
0.4044867, -0.4812651, 1.052014, 0.1333333, 0, 1, 1,
0.4149418, -1.623725, 1.688299, 0.1411765, 0, 1, 1,
0.4149605, 0.416757, 0.320446, 0.145098, 0, 1, 1,
0.4153332, 1.122933, 0.2869619, 0.1529412, 0, 1, 1,
0.4158364, -0.956463, 1.813222, 0.1568628, 0, 1, 1,
0.4169434, 0.1821112, 0.3311142, 0.1647059, 0, 1, 1,
0.4200956, -0.588425, 3.507858, 0.1686275, 0, 1, 1,
0.4206149, -0.7094901, 0.9714797, 0.1764706, 0, 1, 1,
0.4253367, -2.318197, 1.914218, 0.1803922, 0, 1, 1,
0.4283311, -1.327509, 2.459351, 0.1882353, 0, 1, 1,
0.4296627, 0.3903163, 1.119411, 0.1921569, 0, 1, 1,
0.43031, 0.6928152, -1.125243, 0.2, 0, 1, 1,
0.4360335, 1.135409, -0.7074512, 0.2078431, 0, 1, 1,
0.4429815, -0.4435434, 2.954248, 0.2117647, 0, 1, 1,
0.4454367, 0.7551277, 1.047997, 0.2196078, 0, 1, 1,
0.4462135, 1.186445, 1.108176, 0.2235294, 0, 1, 1,
0.4462178, -0.04356914, 0.9706512, 0.2313726, 0, 1, 1,
0.4471423, 0.60373, -0.2948838, 0.2352941, 0, 1, 1,
0.4499314, -1.086272, 1.404116, 0.2431373, 0, 1, 1,
0.4602317, -1.120172, 2.391938, 0.2470588, 0, 1, 1,
0.4682697, 1.177677, 0.1296151, 0.254902, 0, 1, 1,
0.4693392, -0.4071991, 0.8931971, 0.2588235, 0, 1, 1,
0.4727172, 0.4595913, 1.441931, 0.2666667, 0, 1, 1,
0.4809487, -1.85506, 1.576625, 0.2705882, 0, 1, 1,
0.4829736, -0.5915048, 3.243236, 0.2784314, 0, 1, 1,
0.4830537, 0.378387, 2.31143, 0.282353, 0, 1, 1,
0.4867015, 0.772756, 0.677227, 0.2901961, 0, 1, 1,
0.4911626, -1.452235, 4.70132, 0.2941177, 0, 1, 1,
0.4916491, 0.7675135, 2.877401, 0.3019608, 0, 1, 1,
0.4924734, 0.4530347, -2.083241, 0.3098039, 0, 1, 1,
0.5004417, 0.5107054, 1.963865, 0.3137255, 0, 1, 1,
0.5027129, -1.853127, 3.375311, 0.3215686, 0, 1, 1,
0.5079499, -0.6919987, 2.332735, 0.3254902, 0, 1, 1,
0.5118639, -0.485682, 1.628062, 0.3333333, 0, 1, 1,
0.5120138, 0.5574567, 0.6164442, 0.3372549, 0, 1, 1,
0.5178025, -1.213135, 3.082361, 0.345098, 0, 1, 1,
0.5182907, 1.424164, -0.3603377, 0.3490196, 0, 1, 1,
0.521031, 1.183986, 0.4032322, 0.3568628, 0, 1, 1,
0.528925, -0.8868333, 1.971163, 0.3607843, 0, 1, 1,
0.5295014, 0.6346931, 1.135377, 0.3686275, 0, 1, 1,
0.5365111, 0.2032133, 0.7354607, 0.372549, 0, 1, 1,
0.5370898, 0.6288165, 1.031385, 0.3803922, 0, 1, 1,
0.5412939, -0.4742938, 0.4485458, 0.3843137, 0, 1, 1,
0.5434105, -1.76952, 1.676141, 0.3921569, 0, 1, 1,
0.552245, -0.9645678, 1.119718, 0.3960784, 0, 1, 1,
0.5531802, 0.1742927, 0.03950281, 0.4039216, 0, 1, 1,
0.5544242, 0.6292774, 1.760438, 0.4117647, 0, 1, 1,
0.5546415, 1.226042, 0.4152803, 0.4156863, 0, 1, 1,
0.5549719, 0.6839733, -1.378269, 0.4235294, 0, 1, 1,
0.5558642, 0.5279027, 1.688876, 0.427451, 0, 1, 1,
0.5603605, 0.7447569, 2.071054, 0.4352941, 0, 1, 1,
0.5612866, 0.1664078, 1.343091, 0.4392157, 0, 1, 1,
0.5630431, -0.4353347, 0.9564326, 0.4470588, 0, 1, 1,
0.5635331, -2.051548, 2.084672, 0.4509804, 0, 1, 1,
0.5641506, 0.2983434, 2.290693, 0.4588235, 0, 1, 1,
0.5649325, -0.2225796, 4.208357, 0.4627451, 0, 1, 1,
0.5655961, -0.3179538, -0.03905336, 0.4705882, 0, 1, 1,
0.5688247, 1.486428, 1.612712, 0.4745098, 0, 1, 1,
0.5779585, 0.4870736, 0.741423, 0.4823529, 0, 1, 1,
0.5822499, -2.09469, 3.473554, 0.4862745, 0, 1, 1,
0.5837421, 0.6340786, 0.5262069, 0.4941176, 0, 1, 1,
0.5906802, -1.269242, 3.40191, 0.5019608, 0, 1, 1,
0.5926737, -0.6763183, 2.923012, 0.5058824, 0, 1, 1,
0.6067101, 1.242306, 0.02515682, 0.5137255, 0, 1, 1,
0.6110203, 0.225281, 1.446193, 0.5176471, 0, 1, 1,
0.6125336, -1.297366, 3.294294, 0.5254902, 0, 1, 1,
0.6135473, 0.1330178, 0.9297822, 0.5294118, 0, 1, 1,
0.6161653, 1.015242, 0.8714187, 0.5372549, 0, 1, 1,
0.6220855, -0.3049336, 2.157765, 0.5411765, 0, 1, 1,
0.6307712, 1.282189, -0.3283868, 0.5490196, 0, 1, 1,
0.6308163, 1.146891, -1.467653, 0.5529412, 0, 1, 1,
0.6334835, -0.8466358, 0.7494533, 0.5607843, 0, 1, 1,
0.6350175, -0.6846978, 2.347708, 0.5647059, 0, 1, 1,
0.6403254, 1.111582, 0.6305612, 0.572549, 0, 1, 1,
0.6416551, -1.521683, 3.23223, 0.5764706, 0, 1, 1,
0.6485749, -0.2989014, 2.093901, 0.5843138, 0, 1, 1,
0.6491849, -0.3210488, 2.262079, 0.5882353, 0, 1, 1,
0.6498618, -1.380667, 4.467161, 0.5960785, 0, 1, 1,
0.6522816, 0.3459089, 1.71841, 0.6039216, 0, 1, 1,
0.6604012, -0.01579858, 2.27803, 0.6078432, 0, 1, 1,
0.6608936, 2.700363, 1.140189, 0.6156863, 0, 1, 1,
0.6706316, 0.9623072, 0.6623057, 0.6196079, 0, 1, 1,
0.6733447, -0.2129409, 2.757199, 0.627451, 0, 1, 1,
0.6772265, 0.7438947, 0.2052887, 0.6313726, 0, 1, 1,
0.6833703, 1.362368, -0.8141373, 0.6392157, 0, 1, 1,
0.6869425, -0.8793219, 3.99197, 0.6431373, 0, 1, 1,
0.6874278, -2.269037, 3.465435, 0.6509804, 0, 1, 1,
0.6913232, -0.3128005, 0.8369368, 0.654902, 0, 1, 1,
0.6977882, -0.4585281, 0.908963, 0.6627451, 0, 1, 1,
0.7022669, 1.596656, -1.033689, 0.6666667, 0, 1, 1,
0.7027582, 0.09945115, 0.5512697, 0.6745098, 0, 1, 1,
0.7037269, -0.7695256, 1.923956, 0.6784314, 0, 1, 1,
0.7133617, 1.578175, -0.2615772, 0.6862745, 0, 1, 1,
0.7142876, 0.9994553, 2.927063, 0.6901961, 0, 1, 1,
0.7296632, -0.918768, 4.563631, 0.6980392, 0, 1, 1,
0.7328132, 0.3533764, 1.530312, 0.7058824, 0, 1, 1,
0.7367969, 0.08141933, 2.524805, 0.7098039, 0, 1, 1,
0.7393512, 0.3902482, 1.243604, 0.7176471, 0, 1, 1,
0.7398857, 0.5259554, 2.397766, 0.7215686, 0, 1, 1,
0.7437618, -1.055304, 3.438259, 0.7294118, 0, 1, 1,
0.7455091, -0.872511, 1.43494, 0.7333333, 0, 1, 1,
0.7515162, -0.09379669, 0.05587387, 0.7411765, 0, 1, 1,
0.7567848, -1.342504, 2.765989, 0.7450981, 0, 1, 1,
0.7588564, -0.4477462, 2.310893, 0.7529412, 0, 1, 1,
0.7637416, 2.071392, -2.412688, 0.7568628, 0, 1, 1,
0.7671321, -0.1495789, 0.1153051, 0.7647059, 0, 1, 1,
0.7683982, 0.1139695, 2.30881, 0.7686275, 0, 1, 1,
0.7754583, 2.050646, -0.1668843, 0.7764706, 0, 1, 1,
0.7775597, -0.7325665, 3.099326, 0.7803922, 0, 1, 1,
0.7790488, -0.1523061, 0.1545797, 0.7882353, 0, 1, 1,
0.7796798, 0.3418247, 2.125736, 0.7921569, 0, 1, 1,
0.782806, 2.463312, 1.089855, 0.8, 0, 1, 1,
0.7831167, 0.08185454, 0.9077783, 0.8078431, 0, 1, 1,
0.7882924, 0.9177279, 1.176075, 0.8117647, 0, 1, 1,
0.7884282, -0.05242182, 1.40784, 0.8196079, 0, 1, 1,
0.7921252, -1.23514, 3.528577, 0.8235294, 0, 1, 1,
0.7991997, 0.7967604, 0.007062362, 0.8313726, 0, 1, 1,
0.8059862, 1.390147, 0.5358253, 0.8352941, 0, 1, 1,
0.8069558, -0.9824979, 2.302638, 0.8431373, 0, 1, 1,
0.8161658, 0.448454, -0.9113306, 0.8470588, 0, 1, 1,
0.8161913, 0.2057772, 0.5960001, 0.854902, 0, 1, 1,
0.8168126, 0.2579282, 2.50043, 0.8588235, 0, 1, 1,
0.8174967, -0.8912854, 1.311986, 0.8666667, 0, 1, 1,
0.8197874, -0.1793011, 2.624121, 0.8705882, 0, 1, 1,
0.820061, -0.5186089, 1.362677, 0.8784314, 0, 1, 1,
0.8294459, 0.8832327, -1.003752, 0.8823529, 0, 1, 1,
0.8298751, 0.8410964, 0.8915765, 0.8901961, 0, 1, 1,
0.8363454, 0.4437513, 0.9742211, 0.8941177, 0, 1, 1,
0.8382217, -1.948746, 2.281699, 0.9019608, 0, 1, 1,
0.8407182, -0.9591765, 0.9338251, 0.9098039, 0, 1, 1,
0.8430775, 1.529309, -0.7148522, 0.9137255, 0, 1, 1,
0.84333, -0.4632047, 3.78219, 0.9215686, 0, 1, 1,
0.8447397, 0.02528219, 1.523055, 0.9254902, 0, 1, 1,
0.8485486, -0.3730121, 2.05452, 0.9333333, 0, 1, 1,
0.8491665, 1.016604, 1.48767, 0.9372549, 0, 1, 1,
0.857156, 1.421312, 1.441385, 0.945098, 0, 1, 1,
0.8724152, -1.133103, 2.752616, 0.9490196, 0, 1, 1,
0.8846036, -0.4892467, 0.6730638, 0.9568627, 0, 1, 1,
0.8870892, -0.1889996, 0.2169582, 0.9607843, 0, 1, 1,
0.8877897, -2.333431, 2.98951, 0.9686275, 0, 1, 1,
0.8983921, -0.9614058, 2.862222, 0.972549, 0, 1, 1,
0.9052491, -1.339567, 1.167034, 0.9803922, 0, 1, 1,
0.9169046, -0.7146359, 2.849828, 0.9843137, 0, 1, 1,
0.9272289, 0.1827117, 1.318862, 0.9921569, 0, 1, 1,
0.9305975, 1.984476, 0.7828906, 0.9960784, 0, 1, 1,
0.9432771, -0.3536692, 2.706102, 1, 0, 0.9960784, 1,
0.9484676, 0.05648148, 0.437893, 1, 0, 0.9882353, 1,
0.9548693, 2.39069, -0.3765577, 1, 0, 0.9843137, 1,
0.9664038, 0.4925224, 3.182034, 1, 0, 0.9764706, 1,
0.9696858, 1.665529, 0.3674093, 1, 0, 0.972549, 1,
0.9717628, 0.5167043, 2.231803, 1, 0, 0.9647059, 1,
0.9793543, 0.9831553, 2.212087, 1, 0, 0.9607843, 1,
0.980718, 0.02513298, 3.540294, 1, 0, 0.9529412, 1,
0.9814631, -1.203695, 2.457191, 1, 0, 0.9490196, 1,
0.9890532, 0.6890711, 0.2416053, 1, 0, 0.9411765, 1,
0.9897378, -0.1333886, 3.422196, 1, 0, 0.9372549, 1,
0.9904092, -0.1384623, 1.525019, 1, 0, 0.9294118, 1,
0.9928631, -0.3090768, 0.6962033, 1, 0, 0.9254902, 1,
0.9942777, 1.317322, 1.871179, 1, 0, 0.9176471, 1,
0.9977714, 1.171745, -0.2792381, 1, 0, 0.9137255, 1,
1.001559, 0.3516854, 1.505616, 1, 0, 0.9058824, 1,
1.010133, 0.8338591, 1.011265, 1, 0, 0.9019608, 1,
1.011041, 1.108228, 2.320543, 1, 0, 0.8941177, 1,
1.018516, 1.918378, 1.819035, 1, 0, 0.8862745, 1,
1.022513, -1.027802, 1.524285, 1, 0, 0.8823529, 1,
1.024333, 0.09290129, 1.54066, 1, 0, 0.8745098, 1,
1.026172, -1.058942, 1.986087, 1, 0, 0.8705882, 1,
1.033494, -0.5323634, 1.900386, 1, 0, 0.8627451, 1,
1.034109, -0.6529387, 2.227034, 1, 0, 0.8588235, 1,
1.034894, -0.2190052, 1.680296, 1, 0, 0.8509804, 1,
1.036473, -1.061233, 2.563447, 1, 0, 0.8470588, 1,
1.049129, -0.6576242, 1.68193, 1, 0, 0.8392157, 1,
1.050258, -0.4637333, 2.318228, 1, 0, 0.8352941, 1,
1.053247, 0.1002429, 1.436414, 1, 0, 0.827451, 1,
1.06065, -0.521419, 1.398467, 1, 0, 0.8235294, 1,
1.071435, -0.6339208, 0.7587265, 1, 0, 0.8156863, 1,
1.072795, -1.043173, 3.510828, 1, 0, 0.8117647, 1,
1.074139, 0.09322629, 1.931124, 1, 0, 0.8039216, 1,
1.08223, 2.564751, 1.288078, 1, 0, 0.7960784, 1,
1.086222, -0.3697491, 2.9943, 1, 0, 0.7921569, 1,
1.088277, -0.2591519, 1.453594, 1, 0, 0.7843137, 1,
1.089908, -1.2737, 1.55604, 1, 0, 0.7803922, 1,
1.096625, 0.001913706, 3.126023, 1, 0, 0.772549, 1,
1.102021, -0.7253167, 2.926239, 1, 0, 0.7686275, 1,
1.119812, 0.3424242, 0.20788, 1, 0, 0.7607843, 1,
1.122274, -1.275704, 1.043915, 1, 0, 0.7568628, 1,
1.129318, 0.7830576, 1.862971, 1, 0, 0.7490196, 1,
1.129804, 1.016406, 1.868767, 1, 0, 0.7450981, 1,
1.134481, -0.3579981, 1.51162, 1, 0, 0.7372549, 1,
1.135177, 0.1683945, 1.747147, 1, 0, 0.7333333, 1,
1.137814, 0.01369205, -0.320507, 1, 0, 0.7254902, 1,
1.143278, -0.4942992, 3.008561, 1, 0, 0.7215686, 1,
1.143949, 1.46686, 1.387464, 1, 0, 0.7137255, 1,
1.144122, 0.7302573, 1.593691, 1, 0, 0.7098039, 1,
1.155171, 0.4200719, 1.344242, 1, 0, 0.7019608, 1,
1.164039, -1.578687, 3.757068, 1, 0, 0.6941177, 1,
1.165079, 2.388071, 0.5467056, 1, 0, 0.6901961, 1,
1.17098, -1.37458, 2.428361, 1, 0, 0.682353, 1,
1.174791, 1.373939, 2.406625, 1, 0, 0.6784314, 1,
1.184647, 0.4591314, 2.025923, 1, 0, 0.6705883, 1,
1.185299, 0.9047276, -0.1597829, 1, 0, 0.6666667, 1,
1.191817, 0.1132268, 0.7416236, 1, 0, 0.6588235, 1,
1.195046, 0.1550151, 1.392724, 1, 0, 0.654902, 1,
1.198126, -0.6455957, 3.376796, 1, 0, 0.6470588, 1,
1.198595, 1.78722, 0.5896197, 1, 0, 0.6431373, 1,
1.201694, 0.9835635, 1.059941, 1, 0, 0.6352941, 1,
1.21098, -1.262994, 2.460065, 1, 0, 0.6313726, 1,
1.212428, 0.03662958, 1.34887, 1, 0, 0.6235294, 1,
1.214835, -0.05872698, 1.756139, 1, 0, 0.6196079, 1,
1.216164, 0.329342, 1.526708, 1, 0, 0.6117647, 1,
1.224458, -1.493834, 3.628409, 1, 0, 0.6078432, 1,
1.240321, 1.13955, 1.63826, 1, 0, 0.6, 1,
1.240661, 1.569164, 0.3023335, 1, 0, 0.5921569, 1,
1.24167, -0.9574257, 2.066622, 1, 0, 0.5882353, 1,
1.243988, -1.154282, 2.479116, 1, 0, 0.5803922, 1,
1.247508, 1.065804, -0.1004057, 1, 0, 0.5764706, 1,
1.250353, -1.592757, 4.073668, 1, 0, 0.5686275, 1,
1.261457, 0.8491652, -0.06047483, 1, 0, 0.5647059, 1,
1.264002, -0.6477413, 2.574606, 1, 0, 0.5568628, 1,
1.266096, 0.2702399, 0.4550132, 1, 0, 0.5529412, 1,
1.267383, 0.2997122, 0.2619888, 1, 0, 0.5450981, 1,
1.277342, -1.097254, 1.977879, 1, 0, 0.5411765, 1,
1.284996, 0.732857, 1.597067, 1, 0, 0.5333334, 1,
1.296726, -0.7901869, 3.505871, 1, 0, 0.5294118, 1,
1.298691, 0.3488599, 2.267774, 1, 0, 0.5215687, 1,
1.301974, 0.01231382, 1.282674, 1, 0, 0.5176471, 1,
1.312178, -0.4286844, 0.6151436, 1, 0, 0.509804, 1,
1.314497, 1.643898, 0.7108963, 1, 0, 0.5058824, 1,
1.316735, 0.2857196, 0.8222412, 1, 0, 0.4980392, 1,
1.319958, -0.200408, 2.66159, 1, 0, 0.4901961, 1,
1.325296, -0.827368, 1.52762, 1, 0, 0.4862745, 1,
1.331914, 0.372894, 0.5963084, 1, 0, 0.4784314, 1,
1.33922, -1.615706, 2.160019, 1, 0, 0.4745098, 1,
1.340474, 0.6430169, 1.538486, 1, 0, 0.4666667, 1,
1.346193, 0.659786, 0.5874842, 1, 0, 0.4627451, 1,
1.352283, -0.5662776, 2.295916, 1, 0, 0.454902, 1,
1.365469, -1.302698, 2.890456, 1, 0, 0.4509804, 1,
1.373139, 1.48397, 0.000611462, 1, 0, 0.4431373, 1,
1.382261, 0.799859, 2.526538, 1, 0, 0.4392157, 1,
1.386248, -0.5210292, 3.376283, 1, 0, 0.4313726, 1,
1.389536, -0.9875266, 0.1971125, 1, 0, 0.427451, 1,
1.394133, 0.06679235, 2.276025, 1, 0, 0.4196078, 1,
1.395252, 0.9563413, -0.2443527, 1, 0, 0.4156863, 1,
1.396408, 0.7444742, 2.891916, 1, 0, 0.4078431, 1,
1.400795, 0.8455229, 0.5366884, 1, 0, 0.4039216, 1,
1.413246, -0.1127051, 0.259407, 1, 0, 0.3960784, 1,
1.41357, -0.3443522, 3.019166, 1, 0, 0.3882353, 1,
1.46282, -0.7108887, 2.008098, 1, 0, 0.3843137, 1,
1.490953, 0.1643594, 1.13637, 1, 0, 0.3764706, 1,
1.517495, 0.9443092, 0.04418807, 1, 0, 0.372549, 1,
1.52601, 0.431165, 1.8812, 1, 0, 0.3647059, 1,
1.52611, -1.379454, 1.03805, 1, 0, 0.3607843, 1,
1.54159, 1.197138, 1.436689, 1, 0, 0.3529412, 1,
1.549454, -1.655647, 1.093824, 1, 0, 0.3490196, 1,
1.551184, -1.444755, 0.4195596, 1, 0, 0.3411765, 1,
1.5543, -2.446542, 0.630432, 1, 0, 0.3372549, 1,
1.564828, -1.232854, 0.9511447, 1, 0, 0.3294118, 1,
1.578052, 1.753181, 0.6326706, 1, 0, 0.3254902, 1,
1.587706, 1.241553, 2.22061, 1, 0, 0.3176471, 1,
1.608338, 0.9021971, 0.9378506, 1, 0, 0.3137255, 1,
1.620738, 1.195045, 3.139446, 1, 0, 0.3058824, 1,
1.632507, 0.09287285, 0.5882469, 1, 0, 0.2980392, 1,
1.633039, -0.06707647, 0.8449548, 1, 0, 0.2941177, 1,
1.641324, 0.04428989, 0.7015551, 1, 0, 0.2862745, 1,
1.644097, 0.2523306, 0.2354388, 1, 0, 0.282353, 1,
1.649279, 0.5301074, 0.2661476, 1, 0, 0.2745098, 1,
1.656198, -0.04609371, 1.234307, 1, 0, 0.2705882, 1,
1.658621, -1.134801, 0.8219627, 1, 0, 0.2627451, 1,
1.680358, -0.1102764, 1.194857, 1, 0, 0.2588235, 1,
1.684331, 0.5758486, 0.1700699, 1, 0, 0.2509804, 1,
1.6863, -0.3038508, 1.826624, 1, 0, 0.2470588, 1,
1.705272, -0.7643483, 0.5440276, 1, 0, 0.2392157, 1,
1.705932, 0.5645325, 0.257088, 1, 0, 0.2352941, 1,
1.709814, 2.164106, 2.996474, 1, 0, 0.227451, 1,
1.709893, -1.143506, 0.8212196, 1, 0, 0.2235294, 1,
1.721333, -0.3839521, 1.846946, 1, 0, 0.2156863, 1,
1.739898, 0.3124147, 2.173829, 1, 0, 0.2117647, 1,
1.756607, 0.3282043, 1.955105, 1, 0, 0.2039216, 1,
1.80013, 1.305146, 2.571176, 1, 0, 0.1960784, 1,
1.804644, -0.4204483, 2.471891, 1, 0, 0.1921569, 1,
1.805748, -0.3937072, 2.875005, 1, 0, 0.1843137, 1,
1.809961, 0.2094143, 1.962725, 1, 0, 0.1803922, 1,
1.850012, -1.09669, 1.880102, 1, 0, 0.172549, 1,
1.870714, 0.2907269, 1.416736, 1, 0, 0.1686275, 1,
1.907508, -2.144688, 2.128957, 1, 0, 0.1607843, 1,
1.908849, -1.745194, 0.489136, 1, 0, 0.1568628, 1,
1.919647, -1.052354, 2.195292, 1, 0, 0.1490196, 1,
1.935704, 0.5979539, 0.3467595, 1, 0, 0.145098, 1,
1.93669, 0.7941108, 2.153312, 1, 0, 0.1372549, 1,
1.938548, 0.8013368, 0.5993249, 1, 0, 0.1333333, 1,
1.941538, -1.244043, 2.502957, 1, 0, 0.1254902, 1,
1.952292, -0.3971472, 2.369692, 1, 0, 0.1215686, 1,
1.984098, 0.3568876, 1.752627, 1, 0, 0.1137255, 1,
2.011182, -0.4746615, 1.689488, 1, 0, 0.1098039, 1,
2.064803, -1.675459, 3.702297, 1, 0, 0.1019608, 1,
2.069675, 1.727932, 2.039966, 1, 0, 0.09411765, 1,
2.083325, 0.7790233, -1.217849, 1, 0, 0.09019608, 1,
2.115261, -0.5887197, 2.969881, 1, 0, 0.08235294, 1,
2.144077, 0.3614323, 0.8057729, 1, 0, 0.07843138, 1,
2.217386, 1.316496, 0.2422642, 1, 0, 0.07058824, 1,
2.231685, 1.560069, -1.833939, 1, 0, 0.06666667, 1,
2.276337, 1.537736, 0.8681834, 1, 0, 0.05882353, 1,
2.399457, 0.6384428, 2.266849, 1, 0, 0.05490196, 1,
2.460978, 0.6864142, 0.3566331, 1, 0, 0.04705882, 1,
2.50324, -0.4932741, 2.30861, 1, 0, 0.04313726, 1,
2.508815, -2.024142, 3.812232, 1, 0, 0.03529412, 1,
2.518026, -1.123477, 1.215543, 1, 0, 0.03137255, 1,
2.676987, 0.9313926, 2.313181, 1, 0, 0.02352941, 1,
2.732193, 0.4455136, 2.471446, 1, 0, 0.01960784, 1,
2.847891, 1.295731, 1.066572, 1, 0, 0.01176471, 1,
2.857029, 1.3873, 1.814432, 1, 0, 0.007843138, 1
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
-0.4262617, -4.774698, -7.398881, 0, -0.5, 0.5, 0.5,
-0.4262617, -4.774698, -7.398881, 1, -0.5, 0.5, 0.5,
-0.4262617, -4.774698, -7.398881, 1, 1.5, 0.5, 0.5,
-0.4262617, -4.774698, -7.398881, 0, 1.5, 0.5, 0.5
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
-4.822588, -0.4773123, -7.398881, 0, -0.5, 0.5, 0.5,
-4.822588, -0.4773123, -7.398881, 1, -0.5, 0.5, 0.5,
-4.822588, -0.4773123, -7.398881, 1, 1.5, 0.5, 0.5,
-4.822588, -0.4773123, -7.398881, 0, 1.5, 0.5, 0.5
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
-4.822588, -4.774698, -0.1887224, 0, -0.5, 0.5, 0.5,
-4.822588, -4.774698, -0.1887224, 1, -0.5, 0.5, 0.5,
-4.822588, -4.774698, -0.1887224, 1, 1.5, 0.5, 0.5,
-4.822588, -4.774698, -0.1887224, 0, 1.5, 0.5, 0.5
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
-3, -3.782994, -5.734998,
2, -3.782994, -5.734998,
-3, -3.782994, -5.734998,
-3, -3.948277, -6.012312,
-2, -3.782994, -5.734998,
-2, -3.948277, -6.012312,
-1, -3.782994, -5.734998,
-1, -3.948277, -6.012312,
0, -3.782994, -5.734998,
0, -3.948277, -6.012312,
1, -3.782994, -5.734998,
1, -3.948277, -6.012312,
2, -3.782994, -5.734998,
2, -3.948277, -6.012312
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
-3, -4.278846, -6.56694, 0, -0.5, 0.5, 0.5,
-3, -4.278846, -6.56694, 1, -0.5, 0.5, 0.5,
-3, -4.278846, -6.56694, 1, 1.5, 0.5, 0.5,
-3, -4.278846, -6.56694, 0, 1.5, 0.5, 0.5,
-2, -4.278846, -6.56694, 0, -0.5, 0.5, 0.5,
-2, -4.278846, -6.56694, 1, -0.5, 0.5, 0.5,
-2, -4.278846, -6.56694, 1, 1.5, 0.5, 0.5,
-2, -4.278846, -6.56694, 0, 1.5, 0.5, 0.5,
-1, -4.278846, -6.56694, 0, -0.5, 0.5, 0.5,
-1, -4.278846, -6.56694, 1, -0.5, 0.5, 0.5,
-1, -4.278846, -6.56694, 1, 1.5, 0.5, 0.5,
-1, -4.278846, -6.56694, 0, 1.5, 0.5, 0.5,
0, -4.278846, -6.56694, 0, -0.5, 0.5, 0.5,
0, -4.278846, -6.56694, 1, -0.5, 0.5, 0.5,
0, -4.278846, -6.56694, 1, 1.5, 0.5, 0.5,
0, -4.278846, -6.56694, 0, 1.5, 0.5, 0.5,
1, -4.278846, -6.56694, 0, -0.5, 0.5, 0.5,
1, -4.278846, -6.56694, 1, -0.5, 0.5, 0.5,
1, -4.278846, -6.56694, 1, 1.5, 0.5, 0.5,
1, -4.278846, -6.56694, 0, 1.5, 0.5, 0.5,
2, -4.278846, -6.56694, 0, -0.5, 0.5, 0.5,
2, -4.278846, -6.56694, 1, -0.5, 0.5, 0.5,
2, -4.278846, -6.56694, 1, 1.5, 0.5, 0.5,
2, -4.278846, -6.56694, 0, 1.5, 0.5, 0.5
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
-3.808051, -3, -5.734998,
-3.808051, 2, -5.734998,
-3.808051, -3, -5.734998,
-3.977141, -3, -6.012312,
-3.808051, -2, -5.734998,
-3.977141, -2, -6.012312,
-3.808051, -1, -5.734998,
-3.977141, -1, -6.012312,
-3.808051, 0, -5.734998,
-3.977141, 0, -6.012312,
-3.808051, 1, -5.734998,
-3.977141, 1, -6.012312,
-3.808051, 2, -5.734998,
-3.977141, 2, -6.012312
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
"2"
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
-4.31532, -3, -6.56694, 0, -0.5, 0.5, 0.5,
-4.31532, -3, -6.56694, 1, -0.5, 0.5, 0.5,
-4.31532, -3, -6.56694, 1, 1.5, 0.5, 0.5,
-4.31532, -3, -6.56694, 0, 1.5, 0.5, 0.5,
-4.31532, -2, -6.56694, 0, -0.5, 0.5, 0.5,
-4.31532, -2, -6.56694, 1, -0.5, 0.5, 0.5,
-4.31532, -2, -6.56694, 1, 1.5, 0.5, 0.5,
-4.31532, -2, -6.56694, 0, 1.5, 0.5, 0.5,
-4.31532, -1, -6.56694, 0, -0.5, 0.5, 0.5,
-4.31532, -1, -6.56694, 1, -0.5, 0.5, 0.5,
-4.31532, -1, -6.56694, 1, 1.5, 0.5, 0.5,
-4.31532, -1, -6.56694, 0, 1.5, 0.5, 0.5,
-4.31532, 0, -6.56694, 0, -0.5, 0.5, 0.5,
-4.31532, 0, -6.56694, 1, -0.5, 0.5, 0.5,
-4.31532, 0, -6.56694, 1, 1.5, 0.5, 0.5,
-4.31532, 0, -6.56694, 0, 1.5, 0.5, 0.5,
-4.31532, 1, -6.56694, 0, -0.5, 0.5, 0.5,
-4.31532, 1, -6.56694, 1, -0.5, 0.5, 0.5,
-4.31532, 1, -6.56694, 1, 1.5, 0.5, 0.5,
-4.31532, 1, -6.56694, 0, 1.5, 0.5, 0.5,
-4.31532, 2, -6.56694, 0, -0.5, 0.5, 0.5,
-4.31532, 2, -6.56694, 1, -0.5, 0.5, 0.5,
-4.31532, 2, -6.56694, 1, 1.5, 0.5, 0.5,
-4.31532, 2, -6.56694, 0, 1.5, 0.5, 0.5
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
-3.808051, -3.782994, -4,
-3.808051, -3.782994, 4,
-3.808051, -3.782994, -4,
-3.977141, -3.948277, -4,
-3.808051, -3.782994, -2,
-3.977141, -3.948277, -2,
-3.808051, -3.782994, 0,
-3.977141, -3.948277, 0,
-3.808051, -3.782994, 2,
-3.977141, -3.948277, 2,
-3.808051, -3.782994, 4,
-3.977141, -3.948277, 4
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
-4.31532, -4.278846, -4, 0, -0.5, 0.5, 0.5,
-4.31532, -4.278846, -4, 1, -0.5, 0.5, 0.5,
-4.31532, -4.278846, -4, 1, 1.5, 0.5, 0.5,
-4.31532, -4.278846, -4, 0, 1.5, 0.5, 0.5,
-4.31532, -4.278846, -2, 0, -0.5, 0.5, 0.5,
-4.31532, -4.278846, -2, 1, -0.5, 0.5, 0.5,
-4.31532, -4.278846, -2, 1, 1.5, 0.5, 0.5,
-4.31532, -4.278846, -2, 0, 1.5, 0.5, 0.5,
-4.31532, -4.278846, 0, 0, -0.5, 0.5, 0.5,
-4.31532, -4.278846, 0, 1, -0.5, 0.5, 0.5,
-4.31532, -4.278846, 0, 1, 1.5, 0.5, 0.5,
-4.31532, -4.278846, 0, 0, 1.5, 0.5, 0.5,
-4.31532, -4.278846, 2, 0, -0.5, 0.5, 0.5,
-4.31532, -4.278846, 2, 1, -0.5, 0.5, 0.5,
-4.31532, -4.278846, 2, 1, 1.5, 0.5, 0.5,
-4.31532, -4.278846, 2, 0, 1.5, 0.5, 0.5,
-4.31532, -4.278846, 4, 0, -0.5, 0.5, 0.5,
-4.31532, -4.278846, 4, 1, -0.5, 0.5, 0.5,
-4.31532, -4.278846, 4, 1, 1.5, 0.5, 0.5,
-4.31532, -4.278846, 4, 0, 1.5, 0.5, 0.5
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
-3.808051, -3.782994, -5.734998,
-3.808051, 2.828369, -5.734998,
-3.808051, -3.782994, 5.357553,
-3.808051, 2.828369, 5.357553,
-3.808051, -3.782994, -5.734998,
-3.808051, -3.782994, 5.357553,
-3.808051, 2.828369, -5.734998,
-3.808051, 2.828369, 5.357553,
-3.808051, -3.782994, -5.734998,
2.955528, -3.782994, -5.734998,
-3.808051, -3.782994, 5.357553,
2.955528, -3.782994, 5.357553,
-3.808051, 2.828369, -5.734998,
2.955528, 2.828369, -5.734998,
-3.808051, 2.828369, 5.357553,
2.955528, 2.828369, 5.357553,
2.955528, -3.782994, -5.734998,
2.955528, 2.828369, -5.734998,
2.955528, -3.782994, 5.357553,
2.955528, 2.828369, 5.357553,
2.955528, -3.782994, -5.734998,
2.955528, -3.782994, 5.357553,
2.955528, 2.828369, -5.734998,
2.955528, 2.828369, 5.357553
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
var radius = 7.784053;
var distance = 34.63213;
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
mvMatrix.translate( 0.4262617, 0.4773123, 0.1887224 );
mvMatrix.scale( 1.244352, 1.273001, 0.7587317 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63213);
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
Terbufos<-read.table("Terbufos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Terbufos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Terbufos' not found
```

```r
y<-Terbufos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Terbufos' not found
```

```r
z<-Terbufos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Terbufos' not found
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
-3.709553, -0.3698656, -0.4271392, 0, 0, 1, 1, 1,
-3.494912, -0.2932529, 0.0607101, 1, 0, 0, 1, 1,
-3.043131, -1.974451, -2.50483, 1, 0, 0, 1, 1,
-2.633703, -0.0006431327, -1.314711, 1, 0, 0, 1, 1,
-2.502361, 0.24165, -1.132666, 1, 0, 0, 1, 1,
-2.416373, -0.2000644, -0.5484132, 1, 0, 0, 1, 1,
-2.359503, 0.3685673, -2.513248, 0, 0, 0, 1, 1,
-2.171146, -1.316366, -1.931972, 0, 0, 0, 1, 1,
-2.123556, -0.4280281, -3.989943, 0, 0, 0, 1, 1,
-2.042887, 1.373551, -0.549361, 0, 0, 0, 1, 1,
-2.020324, 0.6086969, -2.806263, 0, 0, 0, 1, 1,
-2.009236, 0.9166737, -1.542271, 0, 0, 0, 1, 1,
-1.997888, 1.180755, -0.4812042, 0, 0, 0, 1, 1,
-1.997277, -2.238013, -3.588432, 1, 1, 1, 1, 1,
-1.991153, 0.501994, -0.7301924, 1, 1, 1, 1, 1,
-1.938548, -1.471382, -1.828892, 1, 1, 1, 1, 1,
-1.931388, -2.117266, -2.318288, 1, 1, 1, 1, 1,
-1.930008, 0.7768406, -3.785554, 1, 1, 1, 1, 1,
-1.906491, -0.3713748, 0.733376, 1, 1, 1, 1, 1,
-1.899844, -1.582275, -1.772171, 1, 1, 1, 1, 1,
-1.894794, 0.03478218, 0.1216676, 1, 1, 1, 1, 1,
-1.889824, -0.5695692, -1.202526, 1, 1, 1, 1, 1,
-1.887662, 0.3037911, -0.04858667, 1, 1, 1, 1, 1,
-1.883504, 0.9722131, -0.4577509, 1, 1, 1, 1, 1,
-1.873283, 1.652788, -0.2189686, 1, 1, 1, 1, 1,
-1.873031, -0.08283726, -3.219113, 1, 1, 1, 1, 1,
-1.872775, -0.8753882, -2.693455, 1, 1, 1, 1, 1,
-1.865954, 2.155194, -0.853022, 1, 1, 1, 1, 1,
-1.863645, -0.8802574, -3.50229, 0, 0, 1, 1, 1,
-1.836518, 0.3140518, -3.798193, 1, 0, 0, 1, 1,
-1.832006, 0.03094913, -1.719264, 1, 0, 0, 1, 1,
-1.826589, -0.3982143, -2.698215, 1, 0, 0, 1, 1,
-1.820556, -0.2652083, 0.1075884, 1, 0, 0, 1, 1,
-1.817492, -0.005460508, -1.444545, 1, 0, 0, 1, 1,
-1.817199, -0.6856179, -0.1950849, 0, 0, 0, 1, 1,
-1.810803, 0.8665367, -0.201846, 0, 0, 0, 1, 1,
-1.805702, -0.07110519, -2.187235, 0, 0, 0, 1, 1,
-1.803224, -1.699287, -3.143009, 0, 0, 0, 1, 1,
-1.785034, -1.044011, -2.945674, 0, 0, 0, 1, 1,
-1.782116, -0.1887356, -1.67684, 0, 0, 0, 1, 1,
-1.780258, 0.1008649, -3.607172, 0, 0, 0, 1, 1,
-1.776215, 0.8549268, -0.2078002, 1, 1, 1, 1, 1,
-1.773111, -1.003947, -2.553497, 1, 1, 1, 1, 1,
-1.767357, 0.8035514, -2.135168, 1, 1, 1, 1, 1,
-1.757007, 1.334919, -0.1037716, 1, 1, 1, 1, 1,
-1.752128, 0.4465991, -3.213578, 1, 1, 1, 1, 1,
-1.72366, 0.0829072, -1.512734, 1, 1, 1, 1, 1,
-1.715187, -0.1707779, -2.032286, 1, 1, 1, 1, 1,
-1.715177, 1.580187, -1.221933, 1, 1, 1, 1, 1,
-1.711339, 0.05426389, -1.397014, 1, 1, 1, 1, 1,
-1.711082, -2.141126, -1.124384, 1, 1, 1, 1, 1,
-1.682981, -0.2775047, -1.522661, 1, 1, 1, 1, 1,
-1.670703, -0.2915836, -0.07496028, 1, 1, 1, 1, 1,
-1.667663, 0.3787881, -0.3044617, 1, 1, 1, 1, 1,
-1.65612, 1.173983, -2.180275, 1, 1, 1, 1, 1,
-1.654624, 1.739091, -1.85004, 1, 1, 1, 1, 1,
-1.653341, -0.5307263, -1.159781, 0, 0, 1, 1, 1,
-1.651507, -0.6179116, -2.101588, 1, 0, 0, 1, 1,
-1.646784, -2.082368, -1.837657, 1, 0, 0, 1, 1,
-1.636295, -0.1998452, 0.2689892, 1, 0, 0, 1, 1,
-1.628499, 0.05337536, -1.710465, 1, 0, 0, 1, 1,
-1.622545, 0.9994024, -1.868212, 1, 0, 0, 1, 1,
-1.610588, 0.6130517, 0.02236379, 0, 0, 0, 1, 1,
-1.604915, -1.080474, -2.193038, 0, 0, 0, 1, 1,
-1.602846, -0.6016889, -2.504279, 0, 0, 0, 1, 1,
-1.595039, -0.5484989, -3.543327, 0, 0, 0, 1, 1,
-1.586495, 0.5084344, -2.116582, 0, 0, 0, 1, 1,
-1.567757, -3.686712, -3.075829, 0, 0, 0, 1, 1,
-1.555286, 0.9563351, -0.7065398, 0, 0, 0, 1, 1,
-1.547757, -1.15976, -3.172275, 1, 1, 1, 1, 1,
-1.547352, 0.1306984, -2.420179, 1, 1, 1, 1, 1,
-1.521566, 0.07440615, 0.02961992, 1, 1, 1, 1, 1,
-1.517289, -0.561223, -2.77218, 1, 1, 1, 1, 1,
-1.490245, -1.543421, -3.700353, 1, 1, 1, 1, 1,
-1.475385, 1.051531, 0.3693199, 1, 1, 1, 1, 1,
-1.472135, -0.9445629, -3.419519, 1, 1, 1, 1, 1,
-1.468898, -2.390953, -5.413688, 1, 1, 1, 1, 1,
-1.466979, 2.246051, 0.4599427, 1, 1, 1, 1, 1,
-1.464134, 0.4314472, -0.916648, 1, 1, 1, 1, 1,
-1.459356, -0.2019732, -1.925253, 1, 1, 1, 1, 1,
-1.446523, -1.27497, -3.073606, 1, 1, 1, 1, 1,
-1.442456, -1.676896, -2.378085, 1, 1, 1, 1, 1,
-1.414928, 0.8881426, -2.022735, 1, 1, 1, 1, 1,
-1.414524, 0.2431574, -0.9253834, 1, 1, 1, 1, 1,
-1.404626, 0.2171489, 0.171353, 0, 0, 1, 1, 1,
-1.403787, -0.7726216, -2.059933, 1, 0, 0, 1, 1,
-1.403258, -2.018018, -2.186338, 1, 0, 0, 1, 1,
-1.3998, -0.04440027, -0.2759325, 1, 0, 0, 1, 1,
-1.388677, 0.9873918, -2.341398, 1, 0, 0, 1, 1,
-1.388475, 0.4403825, -0.2468439, 1, 0, 0, 1, 1,
-1.379919, 0.5735317, -0.8767577, 0, 0, 0, 1, 1,
-1.365222, 0.1213205, -1.426704, 0, 0, 0, 1, 1,
-1.363105, 0.2139745, -1.616697, 0, 0, 0, 1, 1,
-1.36248, -0.07557909, -2.278118, 0, 0, 0, 1, 1,
-1.360702, 0.1446339, -1.672096, 0, 0, 0, 1, 1,
-1.347276, -0.05187923, -0.7010091, 0, 0, 0, 1, 1,
-1.335936, -1.765747, -3.776016, 0, 0, 0, 1, 1,
-1.325976, 2.208277, -0.141388, 1, 1, 1, 1, 1,
-1.325651, 1.262323, 0.05234443, 1, 1, 1, 1, 1,
-1.32323, 0.1064293, -2.506965, 1, 1, 1, 1, 1,
-1.322884, -0.1089613, -3.756605, 1, 1, 1, 1, 1,
-1.320697, -1.520362, -3.616208, 1, 1, 1, 1, 1,
-1.320262, 0.594456, -1.099868, 1, 1, 1, 1, 1,
-1.304163, -0.08327378, -1.305889, 1, 1, 1, 1, 1,
-1.29178, -2.830333, -2.646559, 1, 1, 1, 1, 1,
-1.285688, 0.2348439, -1.221611, 1, 1, 1, 1, 1,
-1.274442, 0.5750619, -1.341058, 1, 1, 1, 1, 1,
-1.264214, 0.5075607, -1.291921, 1, 1, 1, 1, 1,
-1.261155, -0.881139, -3.379812, 1, 1, 1, 1, 1,
-1.257938, 1.140535, -1.7521, 1, 1, 1, 1, 1,
-1.251798, -1.004938, -4.183891, 1, 1, 1, 1, 1,
-1.239388, 2.032624, -1.283677, 1, 1, 1, 1, 1,
-1.237073, -0.07050673, -1.914823, 0, 0, 1, 1, 1,
-1.228784, -0.4468544, -1.32021, 1, 0, 0, 1, 1,
-1.223889, -0.00990917, -1.161081, 1, 0, 0, 1, 1,
-1.222551, -1.742168, -2.890427, 1, 0, 0, 1, 1,
-1.222023, 0.317116, 0.02030587, 1, 0, 0, 1, 1,
-1.214942, -1.120186, -0.3134555, 1, 0, 0, 1, 1,
-1.210702, 0.07577039, -1.728385, 0, 0, 0, 1, 1,
-1.200659, -0.1627608, -0.9827257, 0, 0, 0, 1, 1,
-1.192448, 0.03476964, -0.5169818, 0, 0, 0, 1, 1,
-1.189737, 0.06560165, -1.118481, 0, 0, 0, 1, 1,
-1.188028, -0.3604434, -1.786599, 0, 0, 0, 1, 1,
-1.188026, -0.8127366, -1.803028, 0, 0, 0, 1, 1,
-1.187857, -0.3509468, -1.405741, 0, 0, 0, 1, 1,
-1.172992, -0.663911, -2.303628, 1, 1, 1, 1, 1,
-1.170027, -1.45449, -1.759284, 1, 1, 1, 1, 1,
-1.168622, 0.08007811, -2.083859, 1, 1, 1, 1, 1,
-1.158983, -0.4157896, -1.700225, 1, 1, 1, 1, 1,
-1.158674, 0.1550315, 0.05721233, 1, 1, 1, 1, 1,
-1.152697, -0.9633257, -2.875399, 1, 1, 1, 1, 1,
-1.149775, -0.8884215, -1.53109, 1, 1, 1, 1, 1,
-1.147837, -1.356573, -2.53448, 1, 1, 1, 1, 1,
-1.142837, -0.2358428, -0.6991117, 1, 1, 1, 1, 1,
-1.139706, 1.172888, -0.3209959, 1, 1, 1, 1, 1,
-1.138626, -0.03083163, -2.890485, 1, 1, 1, 1, 1,
-1.135998, 1.027538, 0.6695504, 1, 1, 1, 1, 1,
-1.131678, -1.18578, -2.782461, 1, 1, 1, 1, 1,
-1.131348, 0.5354024, -1.462506, 1, 1, 1, 1, 1,
-1.125487, 0.9715512, 0.3082722, 1, 1, 1, 1, 1,
-1.122469, -1.755055, -1.500319, 0, 0, 1, 1, 1,
-1.110236, -1.230165, -1.148171, 1, 0, 0, 1, 1,
-1.107385, 0.3153012, -0.3438159, 1, 0, 0, 1, 1,
-1.098647, 0.2653792, -1.667788, 1, 0, 0, 1, 1,
-1.094423, -0.8234665, -1.856774, 1, 0, 0, 1, 1,
-1.091789, -0.2085718, -1.093957, 1, 0, 0, 1, 1,
-1.090085, 0.2202818, -1.227672, 0, 0, 0, 1, 1,
-1.087351, -0.5775309, -2.593453, 0, 0, 0, 1, 1,
-1.08452, -0.3706107, -0.480452, 0, 0, 0, 1, 1,
-1.072075, -0.609749, -2.665922, 0, 0, 0, 1, 1,
-1.069789, 0.2759032, -2.281425, 0, 0, 0, 1, 1,
-1.063535, 1.23369, -1.755947, 0, 0, 0, 1, 1,
-1.063232, -0.330314, -3.350225, 0, 0, 0, 1, 1,
-1.060648, -0.9088901, -3.508861, 1, 1, 1, 1, 1,
-1.048931, -1.349602, -1.619817, 1, 1, 1, 1, 1,
-1.048423, -0.6974896, -0.9242842, 1, 1, 1, 1, 1,
-1.041137, -0.7702026, -0.5159082, 1, 1, 1, 1, 1,
-1.039717, 0.1496447, -2.99024, 1, 1, 1, 1, 1,
-1.037035, 1.221474, -1.253042, 1, 1, 1, 1, 1,
-1.036162, 0.1733169, -4.231636, 1, 1, 1, 1, 1,
-1.025882, 1.594844, -0.8233498, 1, 1, 1, 1, 1,
-1.023906, 1.510422, 1.032968, 1, 1, 1, 1, 1,
-1.014348, -2.432753, -4.195835, 1, 1, 1, 1, 1,
-1.013142, 0.3372427, -0.08517287, 1, 1, 1, 1, 1,
-1.012042, -0.9072415, -3.267101, 1, 1, 1, 1, 1,
-1.005167, 0.8271818, -0.01482236, 1, 1, 1, 1, 1,
-0.9969866, 0.6039618, -0.7224858, 1, 1, 1, 1, 1,
-0.9889563, -0.6515821, -1.626239, 1, 1, 1, 1, 1,
-0.9839347, 0.1553497, -2.322781, 0, 0, 1, 1, 1,
-0.9467944, -1.233218, -2.701296, 1, 0, 0, 1, 1,
-0.9466481, -0.5201409, -3.827487, 1, 0, 0, 1, 1,
-0.9410965, 0.9492859, -1.451377, 1, 0, 0, 1, 1,
-0.9346299, -0.4143666, -2.86055, 1, 0, 0, 1, 1,
-0.933297, -0.1007954, -1.566099, 1, 0, 0, 1, 1,
-0.9285669, 0.4197924, -1.347968, 0, 0, 0, 1, 1,
-0.9278122, 0.7719088, 0.147418, 0, 0, 0, 1, 1,
-0.9268548, -0.4798758, -2.173648, 0, 0, 0, 1, 1,
-0.925492, 0.3830312, -0.6166013, 0, 0, 0, 1, 1,
-0.9245043, 0.7695553, -1.172566, 0, 0, 0, 1, 1,
-0.920671, -0.5243587, -2.169068, 0, 0, 0, 1, 1,
-0.915062, 0.8708875, -1.690108, 0, 0, 0, 1, 1,
-0.9149994, 1.121602, 1.951215, 1, 1, 1, 1, 1,
-0.9063416, 0.2004466, -1.912388, 1, 1, 1, 1, 1,
-0.9060791, 0.5907699, -1.516216, 1, 1, 1, 1, 1,
-0.8934665, -0.6384841, -1.274129, 1, 1, 1, 1, 1,
-0.8904098, -1.233689, -3.912329, 1, 1, 1, 1, 1,
-0.8901725, 0.9616486, -0.8313687, 1, 1, 1, 1, 1,
-0.8898013, 0.3164482, -2.703232, 1, 1, 1, 1, 1,
-0.8897849, -1.473079, -0.9029417, 1, 1, 1, 1, 1,
-0.8873922, -1.054275, -2.200354, 1, 1, 1, 1, 1,
-0.884403, -0.4033623, -1.899161, 1, 1, 1, 1, 1,
-0.8819205, -1.533418, -1.76969, 1, 1, 1, 1, 1,
-0.8787411, -0.214052, -1.028183, 1, 1, 1, 1, 1,
-0.8746063, 0.3233682, 0.3207726, 1, 1, 1, 1, 1,
-0.8732854, 1.464488, -1.061348, 1, 1, 1, 1, 1,
-0.8715754, -0.312375, -0.9898736, 1, 1, 1, 1, 1,
-0.8683596, 0.0170184, -0.6078623, 0, 0, 1, 1, 1,
-0.8552928, -1.002375, -2.579066, 1, 0, 0, 1, 1,
-0.8446102, -0.00158705, -2.285518, 1, 0, 0, 1, 1,
-0.8445998, 2.36391, 0.5355342, 1, 0, 0, 1, 1,
-0.8437725, 0.9820725, -1.171897, 1, 0, 0, 1, 1,
-0.8436415, 0.8498166, 0.146184, 1, 0, 0, 1, 1,
-0.8405798, -0.03884039, -0.3010579, 0, 0, 0, 1, 1,
-0.840389, 1.296988, 1.069365, 0, 0, 0, 1, 1,
-0.8386959, -0.7800646, -0.9796975, 0, 0, 0, 1, 1,
-0.8372893, -0.02911955, -1.41276, 0, 0, 0, 1, 1,
-0.8315094, -0.2078099, -2.513886, 0, 0, 0, 1, 1,
-0.8300339, -2.039381, -2.90227, 0, 0, 0, 1, 1,
-0.8288888, 0.65196, -1.113336, 0, 0, 0, 1, 1,
-0.8274207, -0.2932103, -1.951978, 1, 1, 1, 1, 1,
-0.8259034, 0.71298, -0.5664447, 1, 1, 1, 1, 1,
-0.8248192, -0.0103328, -2.117019, 1, 1, 1, 1, 1,
-0.8177727, -0.2594129, -2.793454, 1, 1, 1, 1, 1,
-0.8162363, 0.3334405, -0.836768, 1, 1, 1, 1, 1,
-0.814338, 0.4458845, -0.8842407, 1, 1, 1, 1, 1,
-0.805413, -0.08809851, -1.274781, 1, 1, 1, 1, 1,
-0.8044166, -0.822575, -3.461935, 1, 1, 1, 1, 1,
-0.7992358, -0.9274174, -1.77952, 1, 1, 1, 1, 1,
-0.7943663, -1.484121, -1.622704, 1, 1, 1, 1, 1,
-0.7937171, -0.0670261, -3.742567, 1, 1, 1, 1, 1,
-0.7888671, -0.9718401, -3.978669, 1, 1, 1, 1, 1,
-0.7831551, 1.305924, -2.04845, 1, 1, 1, 1, 1,
-0.7788646, 1.18085, -1.486666, 1, 1, 1, 1, 1,
-0.7758598, -1.68627, -2.360761, 1, 1, 1, 1, 1,
-0.7697937, -1.371764, -2.645, 0, 0, 1, 1, 1,
-0.7680498, -0.02054992, -0.1890045, 1, 0, 0, 1, 1,
-0.7591835, 1.577479, -2.304428, 1, 0, 0, 1, 1,
-0.7572054, 0.9410577, -0.3858357, 1, 0, 0, 1, 1,
-0.7563052, -0.4337199, -2.792716, 1, 0, 0, 1, 1,
-0.7545424, 0.8221006, -0.4950134, 1, 0, 0, 1, 1,
-0.7531881, -1.030264, -2.90013, 0, 0, 0, 1, 1,
-0.7527812, 0.9465259, -0.9188982, 0, 0, 0, 1, 1,
-0.7523481, 0.5095426, -0.9991836, 0, 0, 0, 1, 1,
-0.7450208, -1.60307, -2.224708, 0, 0, 0, 1, 1,
-0.732518, -0.5915636, -0.570671, 0, 0, 0, 1, 1,
-0.7312892, -0.2915744, -3.479667, 0, 0, 0, 1, 1,
-0.7310672, -1.608017, -3.553194, 0, 0, 0, 1, 1,
-0.7285814, 0.6408358, -0.4118506, 1, 1, 1, 1, 1,
-0.7237017, -0.1641931, -1.507627, 1, 1, 1, 1, 1,
-0.7161561, 0.3532731, -1.546758, 1, 1, 1, 1, 1,
-0.7106064, 2.109, -0.2191547, 1, 1, 1, 1, 1,
-0.7078893, 0.4803407, 1.459569, 1, 1, 1, 1, 1,
-0.6997662, -0.4637863, -3.251637, 1, 1, 1, 1, 1,
-0.6976327, -0.8653313, -2.079487, 1, 1, 1, 1, 1,
-0.6971459, 0.4735302, -2.397143, 1, 1, 1, 1, 1,
-0.6941665, -0.7029769, -2.393762, 1, 1, 1, 1, 1,
-0.6895818, 0.2271667, -0.6886894, 1, 1, 1, 1, 1,
-0.6800717, -0.1112827, -0.1904612, 1, 1, 1, 1, 1,
-0.6743295, 0.778402, -3.328457, 1, 1, 1, 1, 1,
-0.6731984, 0.5692451, -2.082825, 1, 1, 1, 1, 1,
-0.6707043, 0.4629061, -1.779024, 1, 1, 1, 1, 1,
-0.6695278, -1.119941, -2.951087, 1, 1, 1, 1, 1,
-0.6694345, -0.9324557, -2.135252, 0, 0, 1, 1, 1,
-0.6647813, -1.116786, -3.523164, 1, 0, 0, 1, 1,
-0.6638485, 0.8664395, -0.2305431, 1, 0, 0, 1, 1,
-0.663682, 1.035346, 0.3815852, 1, 0, 0, 1, 1,
-0.6579135, 0.239816, -1.153796, 1, 0, 0, 1, 1,
-0.6474767, -0.3422459, -1.398186, 1, 0, 0, 1, 1,
-0.6467472, -0.8967522, -0.525304, 0, 0, 0, 1, 1,
-0.6423085, -0.9734735, -2.417697, 0, 0, 0, 1, 1,
-0.6413879, -1.011053, -3.545748, 0, 0, 0, 1, 1,
-0.6351448, -0.9576208, -2.219057, 0, 0, 0, 1, 1,
-0.6324005, 1.144943, -1.330658, 0, 0, 0, 1, 1,
-0.6284518, -1.292283, -2.10949, 0, 0, 0, 1, 1,
-0.6225396, -0.3206637, -1.966408, 0, 0, 0, 1, 1,
-0.6199525, 1.09944, -0.4265776, 1, 1, 1, 1, 1,
-0.6178793, 0.04449128, -0.0249583, 1, 1, 1, 1, 1,
-0.6172506, -1.728023, -2.498888, 1, 1, 1, 1, 1,
-0.616809, -0.99436, -1.968655, 1, 1, 1, 1, 1,
-0.6156576, -0.4327566, -2.445891, 1, 1, 1, 1, 1,
-0.6104335, -2.074567, -3.633945, 1, 1, 1, 1, 1,
-0.6084436, -0.04878259, -4.892318, 1, 1, 1, 1, 1,
-0.6083082, 0.3256409, -0.1703884, 1, 1, 1, 1, 1,
-0.6078851, 0.4256335, -2.073854, 1, 1, 1, 1, 1,
-0.5981284, 1.026014, -1.169538, 1, 1, 1, 1, 1,
-0.5971651, -0.1115916, -3.022507, 1, 1, 1, 1, 1,
-0.5964766, 1.23356, -2.273115, 1, 1, 1, 1, 1,
-0.5962564, 0.131981, -2.119749, 1, 1, 1, 1, 1,
-0.5920066, 0.3384923, -1.684038, 1, 1, 1, 1, 1,
-0.5896823, 0.5167215, -0.991413, 1, 1, 1, 1, 1,
-0.5843301, -1.806741, -3.819436, 0, 0, 1, 1, 1,
-0.5826052, 1.256931, -2.174493, 1, 0, 0, 1, 1,
-0.5815902, 0.5690066, -1.713353, 1, 0, 0, 1, 1,
-0.5749221, -0.09859177, -3.592984, 1, 0, 0, 1, 1,
-0.5724925, -0.06699195, -3.571879, 1, 0, 0, 1, 1,
-0.5701263, -0.09705008, -0.5711616, 1, 0, 0, 1, 1,
-0.5697954, 2.039594, -0.4074964, 0, 0, 0, 1, 1,
-0.5693644, 0.937027, -1.253805, 0, 0, 0, 1, 1,
-0.5687907, -0.04975552, -1.228478, 0, 0, 0, 1, 1,
-0.5663409, -0.3719584, 0.2789854, 0, 0, 0, 1, 1,
-0.5645176, 0.5452317, -1.616924, 0, 0, 0, 1, 1,
-0.5640703, -1.014504, -2.687516, 0, 0, 0, 1, 1,
-0.5576016, 0.76119, -0.002210509, 0, 0, 0, 1, 1,
-0.5555674, 1.014095, -1.521708, 1, 1, 1, 1, 1,
-0.5523645, -0.8447596, -1.00491, 1, 1, 1, 1, 1,
-0.5519759, -0.7917455, -3.169938, 1, 1, 1, 1, 1,
-0.5509561, 0.07042238, -1.823453, 1, 1, 1, 1, 1,
-0.548431, -0.1240299, -2.659914, 1, 1, 1, 1, 1,
-0.5425841, -0.0479036, -2.056917, 1, 1, 1, 1, 1,
-0.5396358, -0.6208919, -2.260935, 1, 1, 1, 1, 1,
-0.5358677, 0.2573387, -0.5833014, 1, 1, 1, 1, 1,
-0.5351698, -1.01636, -2.432357, 1, 1, 1, 1, 1,
-0.5326118, -0.6662936, -1.825655, 1, 1, 1, 1, 1,
-0.5317087, -1.126288, -3.349283, 1, 1, 1, 1, 1,
-0.5311028, 0.03128318, -0.3996554, 1, 1, 1, 1, 1,
-0.528081, 1.099226, -0.1782602, 1, 1, 1, 1, 1,
-0.5279002, 2.732087, 0.4757876, 1, 1, 1, 1, 1,
-0.5272177, 1.423627, -0.1752933, 1, 1, 1, 1, 1,
-0.5190812, 0.09847453, -3.089773, 0, 0, 1, 1, 1,
-0.5142243, -0.1341611, -0.3648972, 1, 0, 0, 1, 1,
-0.5108356, -1.960702, -3.113188, 1, 0, 0, 1, 1,
-0.5087466, -2.328374, -3.872449, 1, 0, 0, 1, 1,
-0.5078689, -1.924915, -1.698613, 1, 0, 0, 1, 1,
-0.499422, 0.153835, -2.108616, 1, 0, 0, 1, 1,
-0.4954429, -0.6798151, -2.427088, 0, 0, 0, 1, 1,
-0.4935932, -0.8756425, -3.669868, 0, 0, 0, 1, 1,
-0.4864588, 0.5556981, -1.58584, 0, 0, 0, 1, 1,
-0.4859583, -0.2265509, -2.603206, 0, 0, 0, 1, 1,
-0.4838444, 1.722776, 0.4964102, 0, 0, 0, 1, 1,
-0.4822306, 0.3154029, -0.9212547, 0, 0, 0, 1, 1,
-0.4802369, 0.5251881, -0.4755441, 0, 0, 0, 1, 1,
-0.4774252, -1.802431, -3.228957, 1, 1, 1, 1, 1,
-0.4770299, 1.076587, -1.339349, 1, 1, 1, 1, 1,
-0.4694541, 0.1992967, -1.858044, 1, 1, 1, 1, 1,
-0.4658798, -1.143592, -2.058759, 1, 1, 1, 1, 1,
-0.463817, 0.6833746, 0.471379, 1, 1, 1, 1, 1,
-0.463072, -1.236006, -3.725892, 1, 1, 1, 1, 1,
-0.457511, -0.9934561, -1.976424, 1, 1, 1, 1, 1,
-0.4561386, -0.3640037, -3.275597, 1, 1, 1, 1, 1,
-0.454661, -1.516661, -5.573456, 1, 1, 1, 1, 1,
-0.4544267, 1.302963, 0.3214159, 1, 1, 1, 1, 1,
-0.4510644, 1.508276, -0.7379497, 1, 1, 1, 1, 1,
-0.4436599, -0.03197813, -2.465303, 1, 1, 1, 1, 1,
-0.4427822, -0.3923314, -2.364098, 1, 1, 1, 1, 1,
-0.4390301, -0.4055669, -1.242795, 1, 1, 1, 1, 1,
-0.4309895, 0.06047096, -3.889224, 1, 1, 1, 1, 1,
-0.4308994, -1.134383, -1.660291, 0, 0, 1, 1, 1,
-0.4244594, 1.949198, -1.804538, 1, 0, 0, 1, 1,
-0.4231949, 0.3157676, -0.3716797, 1, 0, 0, 1, 1,
-0.4209718, -0.689601, -2.53381, 1, 0, 0, 1, 1,
-0.4201663, 0.2567257, -3.215089, 1, 0, 0, 1, 1,
-0.417221, -1.721766, -2.643626, 1, 0, 0, 1, 1,
-0.4153091, 0.5209764, -1.234492, 0, 0, 0, 1, 1,
-0.4149005, 0.384645, -3.181522, 0, 0, 0, 1, 1,
-0.4128907, 2.308176, -1.082196, 0, 0, 0, 1, 1,
-0.4119428, -0.556354, -2.007961, 0, 0, 0, 1, 1,
-0.4111592, 0.4474025, -1.992637, 0, 0, 0, 1, 1,
-0.4103281, -0.4344392, -1.916479, 0, 0, 0, 1, 1,
-0.4095449, 0.783851, 2.965556, 0, 0, 0, 1, 1,
-0.4094332, -0.5622619, -2.687315, 1, 1, 1, 1, 1,
-0.4080421, 1.195856, -0.7465102, 1, 1, 1, 1, 1,
-0.4057003, 0.9155722, 0.3528774, 1, 1, 1, 1, 1,
-0.4034311, 1.165933, -2.696169, 1, 1, 1, 1, 1,
-0.4033787, 0.3835343, -1.551348, 1, 1, 1, 1, 1,
-0.4033014, -0.7574397, -5.058864, 1, 1, 1, 1, 1,
-0.3968148, -2.296767, -3.4888, 1, 1, 1, 1, 1,
-0.3964679, 0.5678275, -2.288335, 1, 1, 1, 1, 1,
-0.3943529, -0.9434282, -2.391167, 1, 1, 1, 1, 1,
-0.3935861, 0.01563359, -2.0849, 1, 1, 1, 1, 1,
-0.3907815, 0.6647176, -1.35897, 1, 1, 1, 1, 1,
-0.388226, 1.472469, 0.7540352, 1, 1, 1, 1, 1,
-0.3848646, -1.499177, -3.336946, 1, 1, 1, 1, 1,
-0.3833888, 0.8033253, 0.6513144, 1, 1, 1, 1, 1,
-0.380674, 0.6910279, -2.322067, 1, 1, 1, 1, 1,
-0.3786189, -1.430895, -1.498574, 0, 0, 1, 1, 1,
-0.3765981, -0.1081662, -1.978732, 1, 0, 0, 1, 1,
-0.3729689, -0.1616747, -2.16151, 1, 0, 0, 1, 1,
-0.3722697, 0.3347069, -1.200753, 1, 0, 0, 1, 1,
-0.3706455, 0.5548102, -2.603928, 1, 0, 0, 1, 1,
-0.3683026, 0.7410355, -1.692922, 1, 0, 0, 1, 1,
-0.366694, 0.2757209, -1.421003, 0, 0, 0, 1, 1,
-0.3664277, 1.378708, -0.277149, 0, 0, 0, 1, 1,
-0.3658276, 0.9100637, 0.006827092, 0, 0, 0, 1, 1,
-0.3649917, -0.2294054, -1.092435, 0, 0, 0, 1, 1,
-0.356535, 0.5964684, -0.8300906, 0, 0, 0, 1, 1,
-0.3522442, 0.4753377, -0.07898545, 0, 0, 0, 1, 1,
-0.3520979, 0.9070315, -2.734537, 0, 0, 0, 1, 1,
-0.3510403, -1.482669, -3.772565, 1, 1, 1, 1, 1,
-0.3475595, 2.113388, 1.62353, 1, 1, 1, 1, 1,
-0.3453659, 1.117234, -1.06261, 1, 1, 1, 1, 1,
-0.3407513, 0.08229711, -1.746412, 1, 1, 1, 1, 1,
-0.339066, -0.2466687, -2.844728, 1, 1, 1, 1, 1,
-0.3357599, -0.2080276, -3.133573, 1, 1, 1, 1, 1,
-0.3308817, 0.479795, 0.7294337, 1, 1, 1, 1, 1,
-0.3300837, -1.129475, -1.48219, 1, 1, 1, 1, 1,
-0.3276318, -0.8171095, -0.3878512, 1, 1, 1, 1, 1,
-0.3268252, -0.6201345, -2.890975, 1, 1, 1, 1, 1,
-0.3222398, -1.024576, -2.04715, 1, 1, 1, 1, 1,
-0.3206587, 0.2480879, 0.1801076, 1, 1, 1, 1, 1,
-0.3183839, 0.1553899, 0.1207382, 1, 1, 1, 1, 1,
-0.3175978, 1.559932, -1.023889, 1, 1, 1, 1, 1,
-0.3174879, 1.180329, -0.4638898, 1, 1, 1, 1, 1,
-0.3155649, -0.6844983, -4.813044, 0, 0, 1, 1, 1,
-0.3149493, 0.3818, -1.423154, 1, 0, 0, 1, 1,
-0.3148874, -0.1755226, -2.797758, 1, 0, 0, 1, 1,
-0.3144074, 0.2052237, 0.359193, 1, 0, 0, 1, 1,
-0.3136011, 0.1260674, -0.1818065, 1, 0, 0, 1, 1,
-0.3118498, 0.5810755, 0.0468514, 1, 0, 0, 1, 1,
-0.3086622, 0.5239842, -0.7577537, 0, 0, 0, 1, 1,
-0.3073665, 0.6792726, -1.111503, 0, 0, 0, 1, 1,
-0.3057565, 1.054981, -1.40589, 0, 0, 0, 1, 1,
-0.3051911, 0.1882703, 0.02249188, 0, 0, 0, 1, 1,
-0.3036154, -0.2689562, -1.426952, 0, 0, 0, 1, 1,
-0.3012493, -0.826785, -4.27782, 0, 0, 0, 1, 1,
-0.2967993, -0.6331661, -3.00851, 0, 0, 0, 1, 1,
-0.293083, -0.5322488, -2.295568, 1, 1, 1, 1, 1,
-0.2914895, 0.2611077, -1.55512, 1, 1, 1, 1, 1,
-0.2877766, 0.4212528, -0.7930377, 1, 1, 1, 1, 1,
-0.2853908, -0.2224566, -2.362295, 1, 1, 1, 1, 1,
-0.2848887, -0.9269399, -1.563406, 1, 1, 1, 1, 1,
-0.2845323, -1.049919, -2.670942, 1, 1, 1, 1, 1,
-0.2770351, 0.337579, 0.03869131, 1, 1, 1, 1, 1,
-0.2750382, -1.142338, -2.257052, 1, 1, 1, 1, 1,
-0.2729174, -1.475575, -3.742536, 1, 1, 1, 1, 1,
-0.2705013, 0.5690229, -1.779679, 1, 1, 1, 1, 1,
-0.2696661, 0.893948, 0.04607214, 1, 1, 1, 1, 1,
-0.2665094, -1.109516, -2.333352, 1, 1, 1, 1, 1,
-0.2660548, 0.01324493, -1.488819, 1, 1, 1, 1, 1,
-0.2656646, -0.07235356, -1.331785, 1, 1, 1, 1, 1,
-0.2547203, 0.7931746, -0.4664468, 1, 1, 1, 1, 1,
-0.2543765, 0.9848134, 0.7552559, 0, 0, 1, 1, 1,
-0.2538145, -1.215665, -4.690856, 1, 0, 0, 1, 1,
-0.2461014, -0.07173953, -1.143458, 1, 0, 0, 1, 1,
-0.2444553, -0.5132109, -3.97125, 1, 0, 0, 1, 1,
-0.2423179, -0.3878677, -1.459767, 1, 0, 0, 1, 1,
-0.2419188, -1.320303, -3.211517, 1, 0, 0, 1, 1,
-0.2333291, 1.266607, -0.003366526, 0, 0, 0, 1, 1,
-0.2317711, -1.235791, -2.634545, 0, 0, 0, 1, 1,
-0.231441, -0.3623338, -1.937094, 0, 0, 0, 1, 1,
-0.2299605, 0.511745, -0.624055, 0, 0, 0, 1, 1,
-0.2292312, 0.2194374, -1.270452, 0, 0, 0, 1, 1,
-0.227969, -0.4272479, -2.295871, 0, 0, 0, 1, 1,
-0.2248535, -0.9045212, -2.37319, 0, 0, 0, 1, 1,
-0.2243212, -0.803619, -2.62869, 1, 1, 1, 1, 1,
-0.2205915, 1.483302, -0.1084764, 1, 1, 1, 1, 1,
-0.2170144, -0.7165878, -0.1627894, 1, 1, 1, 1, 1,
-0.2163255, 0.119161, -1.377824, 1, 1, 1, 1, 1,
-0.2143698, -1.934057, -2.359486, 1, 1, 1, 1, 1,
-0.2084765, 0.1838009, -0.7916223, 1, 1, 1, 1, 1,
-0.207177, -0.9095458, -3.541128, 1, 1, 1, 1, 1,
-0.2067741, 0.3033993, -0.7281175, 1, 1, 1, 1, 1,
-0.2065818, -0.6034219, -3.634804, 1, 1, 1, 1, 1,
-0.2039876, -1.173135, -3.095771, 1, 1, 1, 1, 1,
-0.2025053, -1.296118, -2.673403, 1, 1, 1, 1, 1,
-0.2018738, 0.2419571, -1.939867, 1, 1, 1, 1, 1,
-0.2007691, 1.727328, -1.473076, 1, 1, 1, 1, 1,
-0.1994515, -0.8824278, -3.34715, 1, 1, 1, 1, 1,
-0.1944468, -2.198004, -5.44139, 1, 1, 1, 1, 1,
-0.1925351, -0.5412291, -3.731805, 0, 0, 1, 1, 1,
-0.1913209, -0.5083097, -4.451671, 1, 0, 0, 1, 1,
-0.1870317, 0.6746342, 0.01433518, 1, 0, 0, 1, 1,
-0.1858434, -0.8077559, -2.097696, 1, 0, 0, 1, 1,
-0.1854762, -0.03659229, -2.030302, 1, 0, 0, 1, 1,
-0.1826327, 0.01646097, -1.046655, 1, 0, 0, 1, 1,
-0.1817935, -0.6571579, -2.015499, 0, 0, 0, 1, 1,
-0.1805945, -0.8732521, -2.684425, 0, 0, 0, 1, 1,
-0.1803957, 0.5294836, 0.3727261, 0, 0, 0, 1, 1,
-0.1799545, -1.026452, -3.375746, 0, 0, 0, 1, 1,
-0.1788542, 1.04929, -1.456688, 0, 0, 0, 1, 1,
-0.1747127, -0.4137833, -3.287634, 0, 0, 0, 1, 1,
-0.1741735, 0.6537703, 0.5981603, 0, 0, 0, 1, 1,
-0.1726992, -1.340436, -4.200667, 1, 1, 1, 1, 1,
-0.170874, -1.041992, -2.528386, 1, 1, 1, 1, 1,
-0.1612181, -0.2000508, -1.979695, 1, 1, 1, 1, 1,
-0.1609627, -0.5768801, -3.497405, 1, 1, 1, 1, 1,
-0.1609335, -0.05842832, -2.088774, 1, 1, 1, 1, 1,
-0.1581221, 1.944108, -0.9109384, 1, 1, 1, 1, 1,
-0.1565304, -1.596241, -4.114197, 1, 1, 1, 1, 1,
-0.1549532, 1.727308, -0.1826396, 1, 1, 1, 1, 1,
-0.1518994, -0.6011797, -1.369674, 1, 1, 1, 1, 1,
-0.151799, 0.8953579, 1.158428, 1, 1, 1, 1, 1,
-0.1517675, -0.009977465, -2.076453, 1, 1, 1, 1, 1,
-0.1508789, -0.7388813, -5.312517, 1, 1, 1, 1, 1,
-0.1505226, -0.8511341, -3.148769, 1, 1, 1, 1, 1,
-0.1470005, 0.4389522, 1.34497, 1, 1, 1, 1, 1,
-0.1450564, -1.631141, -2.824922, 1, 1, 1, 1, 1,
-0.1439441, 0.00892007, -3.206938, 0, 0, 1, 1, 1,
-0.1393095, 0.1994313, -0.3148728, 1, 0, 0, 1, 1,
-0.1385839, -0.6031594, -5.332863, 1, 0, 0, 1, 1,
-0.133821, 0.6305205, 1.268055, 1, 0, 0, 1, 1,
-0.1286136, -1.236146, -3.282451, 1, 0, 0, 1, 1,
-0.1283813, -0.1053265, -2.726375, 1, 0, 0, 1, 1,
-0.1281862, 2.390704, -1.501628, 0, 0, 0, 1, 1,
-0.1276283, 0.6098194, -0.4999802, 0, 0, 0, 1, 1,
-0.1172702, -1.01728, -3.507057, 0, 0, 0, 1, 1,
-0.1156633, -0.7536567, -4.739119, 0, 0, 0, 1, 1,
-0.1135166, 0.2460292, -0.7017577, 0, 0, 0, 1, 1,
-0.1095258, -0.05336607, -1.03239, 0, 0, 0, 1, 1,
-0.1052135, -0.7627427, -2.836359, 0, 0, 0, 1, 1,
-0.1037882, -0.1208968, -1.089931, 1, 1, 1, 1, 1,
-0.1004441, 0.7115157, 0.9698327, 1, 1, 1, 1, 1,
-0.1001678, -0.05878124, -1.581088, 1, 1, 1, 1, 1,
-0.09017774, 0.6117206, 0.2228481, 1, 1, 1, 1, 1,
-0.08286806, -1.909941, -4.143508, 1, 1, 1, 1, 1,
-0.08031469, 1.427909, 0.04691832, 1, 1, 1, 1, 1,
-0.07288712, -0.07111335, -1.589638, 1, 1, 1, 1, 1,
-0.06911305, -0.6468424, -3.1203, 1, 1, 1, 1, 1,
-0.06901263, 0.4508113, 1.007388, 1, 1, 1, 1, 1,
-0.0643673, 1.151922, 1.180136, 1, 1, 1, 1, 1,
-0.06306832, -0.1050505, -2.25274, 1, 1, 1, 1, 1,
-0.06150778, 0.1508235, -0.2825189, 1, 1, 1, 1, 1,
-0.06139943, -1.959937, -2.183041, 1, 1, 1, 1, 1,
-0.05719477, -1.124066, -3.708108, 1, 1, 1, 1, 1,
-0.05015219, 0.3575089, 0.1175224, 1, 1, 1, 1, 1,
-0.04739497, 1.866329, -0.9683353, 0, 0, 1, 1, 1,
-0.04310001, -0.7617189, -3.326216, 1, 0, 0, 1, 1,
-0.04052123, 0.5897126, 0.798349, 1, 0, 0, 1, 1,
-0.04048996, -0.341951, -3.628989, 1, 0, 0, 1, 1,
-0.0397256, -0.8665952, -2.343952, 1, 0, 0, 1, 1,
-0.0378537, -0.5870129, -2.19424, 1, 0, 0, 1, 1,
-0.03570126, -1.406026, -2.870057, 0, 0, 0, 1, 1,
-0.03369144, -1.105552, -2.245734, 0, 0, 0, 1, 1,
-0.03247163, 0.6732306, -0.1814078, 0, 0, 0, 1, 1,
-0.03060092, 0.4644696, -1.914718, 0, 0, 0, 1, 1,
-0.02983947, -1.688106, -3.728798, 0, 0, 0, 1, 1,
-0.02741287, -0.152755, -3.63411, 0, 0, 0, 1, 1,
-0.01640528, 1.029232, -0.3334295, 0, 0, 0, 1, 1,
-0.01538637, -1.780874, -2.639342, 1, 1, 1, 1, 1,
-0.01088847, 0.1767516, -0.5122107, 1, 1, 1, 1, 1,
-0.01041438, -0.6162973, -1.932955, 1, 1, 1, 1, 1,
-0.01011489, -1.021295, -2.335892, 1, 1, 1, 1, 1,
-0.009760239, -1.00464, -5.361134, 1, 1, 1, 1, 1,
-0.005179286, 1.010909, -0.7567081, 1, 1, 1, 1, 1,
-0.003074306, -0.3623231, -2.426067, 1, 1, 1, 1, 1,
0.003693248, -2.115528, 4.045246, 1, 1, 1, 1, 1,
0.005113153, -0.3197689, 2.276775, 1, 1, 1, 1, 1,
0.005163521, -0.05514217, 4.985076, 1, 1, 1, 1, 1,
0.007998966, -0.6826646, 3.042641, 1, 1, 1, 1, 1,
0.01194233, -2.441702, 4.516962, 1, 1, 1, 1, 1,
0.0176225, -0.3888093, 3.097447, 1, 1, 1, 1, 1,
0.01796375, 1.734473, -1.96276, 1, 1, 1, 1, 1,
0.01844763, -1.64467, 2.378335, 1, 1, 1, 1, 1,
0.01855525, 0.1685497, -0.1765233, 0, 0, 1, 1, 1,
0.01905277, 1.737355, -0.00227558, 1, 0, 0, 1, 1,
0.02007814, 0.1048399, 0.7353466, 1, 0, 0, 1, 1,
0.02008822, 1.52392, -0.6645243, 1, 0, 0, 1, 1,
0.02409729, -0.214734, 1.949217, 1, 0, 0, 1, 1,
0.02706292, 0.9038378, 0.9228256, 1, 0, 0, 1, 1,
0.02890277, 0.2501543, -1.296973, 0, 0, 0, 1, 1,
0.02978708, -0.4058852, 4.985058, 0, 0, 0, 1, 1,
0.0344967, 0.5835977, 0.1355774, 0, 0, 0, 1, 1,
0.04119254, -1.926303, 4.718406, 0, 0, 0, 1, 1,
0.0436493, -0.4934094, 2.835801, 0, 0, 0, 1, 1,
0.04381744, 1.393975, -0.5227177, 0, 0, 0, 1, 1,
0.04506196, 0.05225947, 1.712023, 0, 0, 0, 1, 1,
0.04755906, 0.6046938, 0.4754001, 1, 1, 1, 1, 1,
0.05073223, -2.568318, 2.534747, 1, 1, 1, 1, 1,
0.05307795, 2.008404, 1.209887, 1, 1, 1, 1, 1,
0.05630631, 0.7627075, 0.3844641, 1, 1, 1, 1, 1,
0.05847359, -2.388586, 3.502105, 1, 1, 1, 1, 1,
0.06065632, 1.387989, 0.6903865, 1, 1, 1, 1, 1,
0.06673164, -1.010861, 4.632862, 1, 1, 1, 1, 1,
0.07017749, -0.3631641, 3.791053, 1, 1, 1, 1, 1,
0.07131761, -0.4536965, 1.925012, 1, 1, 1, 1, 1,
0.07374081, -0.8369334, 1.108148, 1, 1, 1, 1, 1,
0.07643954, -0.3779112, 2.009388, 1, 1, 1, 1, 1,
0.08475019, -2.134869, 3.314661, 1, 1, 1, 1, 1,
0.08521291, 1.696505, -0.2266005, 1, 1, 1, 1, 1,
0.09100421, 1.143694, -0.1892161, 1, 1, 1, 1, 1,
0.09113295, -1.10815, 2.42358, 1, 1, 1, 1, 1,
0.09377843, 0.2698665, 0.7308101, 0, 0, 1, 1, 1,
0.09524928, 0.6792009, 1.905239, 1, 0, 0, 1, 1,
0.09665289, -0.5062911, 2.565812, 1, 0, 0, 1, 1,
0.09681522, 0.6634998, -0.2372924, 1, 0, 0, 1, 1,
0.09739282, 0.9578915, 1.433369, 1, 0, 0, 1, 1,
0.09783141, -2.002424, 3.893854, 1, 0, 0, 1, 1,
0.1021343, -0.9286839, 2.727257, 0, 0, 0, 1, 1,
0.109034, 0.1677016, -0.4318435, 0, 0, 0, 1, 1,
0.1147293, -0.3133191, 2.68262, 0, 0, 0, 1, 1,
0.1211378, 0.270274, 0.9328415, 0, 0, 0, 1, 1,
0.1228426, -0.7080526, 4.632367, 0, 0, 0, 1, 1,
0.1244403, -1.057303, 1.691577, 0, 0, 0, 1, 1,
0.125953, 1.198988, -0.2993878, 0, 0, 0, 1, 1,
0.1285769, -0.7450324, 2.021553, 1, 1, 1, 1, 1,
0.1295189, 0.8045791, 0.7778541, 1, 1, 1, 1, 1,
0.1316076, -0.8995872, 3.190884, 1, 1, 1, 1, 1,
0.1319049, 1.127882, 0.9159963, 1, 1, 1, 1, 1,
0.1359118, 0.5198293, -1.251558, 1, 1, 1, 1, 1,
0.1360175, -0.4591458, 3.111434, 1, 1, 1, 1, 1,
0.1393091, -1.052592, 4.224867, 1, 1, 1, 1, 1,
0.1444791, -0.5751607, 2.61903, 1, 1, 1, 1, 1,
0.1461959, -1.332801, 2.663499, 1, 1, 1, 1, 1,
0.1470985, -0.9998442, 3.212449, 1, 1, 1, 1, 1,
0.1489942, -0.592343, 2.443481, 1, 1, 1, 1, 1,
0.1528887, -0.4485878, 2.346492, 1, 1, 1, 1, 1,
0.1548993, -1.903567, 3.151679, 1, 1, 1, 1, 1,
0.1582162, -1.180396, 3.706551, 1, 1, 1, 1, 1,
0.1591918, -0.5562789, 4.074755, 1, 1, 1, 1, 1,
0.1620812, -0.8145234, 4.404785, 0, 0, 1, 1, 1,
0.1643685, 0.02222258, 2.610689, 1, 0, 0, 1, 1,
0.1705991, 0.2534308, 0.7618318, 1, 0, 0, 1, 1,
0.1720158, 0.9139186, -0.7482312, 1, 0, 0, 1, 1,
0.1723817, -0.7015402, 3.750377, 1, 0, 0, 1, 1,
0.1734141, -0.5153768, 1.723259, 1, 0, 0, 1, 1,
0.1744525, -1.800336, 3.72945, 0, 0, 0, 1, 1,
0.1795876, 0.167395, -0.3183002, 0, 0, 0, 1, 1,
0.1809564, 0.1267976, 1.052078, 0, 0, 0, 1, 1,
0.1853798, -0.1592155, 4.543651, 0, 0, 0, 1, 1,
0.1865803, 0.8292003, -0.1179186, 0, 0, 0, 1, 1,
0.1870255, -1.305524, 4.954212, 0, 0, 0, 1, 1,
0.1906504, -0.3281142, 1.798084, 0, 0, 0, 1, 1,
0.1927213, 0.5856504, 0.7381423, 1, 1, 1, 1, 1,
0.1932962, 1.356273, -0.08122079, 1, 1, 1, 1, 1,
0.1957742, 0.1903424, 0.07756878, 1, 1, 1, 1, 1,
0.1995483, 0.5238166, -0.1451739, 1, 1, 1, 1, 1,
0.2003932, -1.030753, 1.214263, 1, 1, 1, 1, 1,
0.2009317, 0.2430882, 0.5752913, 1, 1, 1, 1, 1,
0.2113244, -1.489412, 4.340784, 1, 1, 1, 1, 1,
0.2119605, 1.216426, 1.162394, 1, 1, 1, 1, 1,
0.2143341, -0.03909982, 0.7707286, 1, 1, 1, 1, 1,
0.214732, 0.6869025, 1.452773, 1, 1, 1, 1, 1,
0.2172047, 0.3852189, 1.372269, 1, 1, 1, 1, 1,
0.2176709, -1.210788, 1.936557, 1, 1, 1, 1, 1,
0.2183909, 0.1740376, -0.5847925, 1, 1, 1, 1, 1,
0.2227075, -1.561521, 2.91229, 1, 1, 1, 1, 1,
0.2247325, -1.126356, 2.694127, 1, 1, 1, 1, 1,
0.2299964, 1.599383, -0.2512715, 0, 0, 1, 1, 1,
0.2353102, 1.668652, -0.4504527, 1, 0, 0, 1, 1,
0.2365442, 0.8538946, 1.3886, 1, 0, 0, 1, 1,
0.2380341, -0.5278445, 2.101309, 1, 0, 0, 1, 1,
0.238169, -1.228595, 3.093719, 1, 0, 0, 1, 1,
0.2393543, 0.3580285, 1.316516, 1, 0, 0, 1, 1,
0.2403872, 0.867358, 1.135375, 0, 0, 0, 1, 1,
0.2479876, -0.4283788, 0.3930672, 0, 0, 0, 1, 1,
0.2540067, -0.003717845, 0.1187016, 0, 0, 0, 1, 1,
0.256994, 1.550501, -0.3630042, 0, 0, 0, 1, 1,
0.2643393, 0.5088831, 0.825992, 0, 0, 0, 1, 1,
0.2663607, -1.05079, 5.196012, 0, 0, 0, 1, 1,
0.2669559, 0.6498954, 0.6937873, 0, 0, 0, 1, 1,
0.2670115, -1.156244, 2.911046, 1, 1, 1, 1, 1,
0.2673277, -0.6300917, 1.195048, 1, 1, 1, 1, 1,
0.2731622, -2.535839, 3.358448, 1, 1, 1, 1, 1,
0.2750685, 0.6414103, 0.5401196, 1, 1, 1, 1, 1,
0.2759506, -0.7481047, 3.430801, 1, 1, 1, 1, 1,
0.275987, 0.2841328, 1.800449, 1, 1, 1, 1, 1,
0.2765298, -0.32754, 1.80247, 1, 1, 1, 1, 1,
0.2804218, 1.03346, 1.310701, 1, 1, 1, 1, 1,
0.2830596, -0.4314471, 2.089492, 1, 1, 1, 1, 1,
0.2921996, 1.591232, 1.546639, 1, 1, 1, 1, 1,
0.293552, 1.882749, 0.688671, 1, 1, 1, 1, 1,
0.2942389, -0.569349, 1.76512, 1, 1, 1, 1, 1,
0.2970883, -0.8699362, 3.251556, 1, 1, 1, 1, 1,
0.2981185, -1.357434, 2.15038, 1, 1, 1, 1, 1,
0.2994975, 0.5344642, -0.05796497, 1, 1, 1, 1, 1,
0.302352, -0.1513118, 0.9698054, 0, 0, 1, 1, 1,
0.3033245, 0.7090488, 0.2816503, 1, 0, 0, 1, 1,
0.3057547, -0.8293917, 2.112441, 1, 0, 0, 1, 1,
0.3088764, -1.373534, 1.9609, 1, 0, 0, 1, 1,
0.3134759, 2.062048, 0.6261693, 1, 0, 0, 1, 1,
0.3137117, 0.8267274, 0.8311048, 1, 0, 0, 1, 1,
0.3159741, 1.682353, -0.3796613, 0, 0, 0, 1, 1,
0.3175043, 1.031245, 1.882159, 0, 0, 0, 1, 1,
0.3188343, 0.7107567, 1.597417, 0, 0, 0, 1, 1,
0.3209013, 0.899044, 2.816019, 0, 0, 0, 1, 1,
0.3214248, -0.8063462, 2.180211, 0, 0, 0, 1, 1,
0.3285341, 1.053532, 0.1987271, 0, 0, 0, 1, 1,
0.3298007, -2.579661, 2.792691, 0, 0, 0, 1, 1,
0.3341744, -1.576967, 2.262978, 1, 1, 1, 1, 1,
0.3359806, 1.328359, 0.04488305, 1, 1, 1, 1, 1,
0.338069, -0.9551455, 3.721037, 1, 1, 1, 1, 1,
0.3385647, 0.1005794, 3.319021, 1, 1, 1, 1, 1,
0.3397467, -1.148786, 2.483187, 1, 1, 1, 1, 1,
0.3412041, 0.007337781, 1.086393, 1, 1, 1, 1, 1,
0.3413846, 2.122062, 0.664, 1, 1, 1, 1, 1,
0.3463115, 1.026312, -0.2873924, 1, 1, 1, 1, 1,
0.3528303, 0.5398641, 1.341161, 1, 1, 1, 1, 1,
0.3594471, -0.1387161, 1.269959, 1, 1, 1, 1, 1,
0.3601535, -0.9859239, 3.82598, 1, 1, 1, 1, 1,
0.3606315, 1.073255, -0.5319472, 1, 1, 1, 1, 1,
0.3627394, 0.6227154, 1.138193, 1, 1, 1, 1, 1,
0.3632537, -0.8067803, 3.312088, 1, 1, 1, 1, 1,
0.3720705, 0.1594723, 0.4341578, 1, 1, 1, 1, 1,
0.3753287, 0.4133252, 0.1077527, 0, 0, 1, 1, 1,
0.3793727, 1.477332, 0.1932856, 1, 0, 0, 1, 1,
0.3810863, 0.05892172, 1.856963, 1, 0, 0, 1, 1,
0.381495, -0.745662, 2.64464, 1, 0, 0, 1, 1,
0.3843059, -2.098322, 3.901011, 1, 0, 0, 1, 1,
0.3858976, 0.670639, 0.490191, 1, 0, 0, 1, 1,
0.3862902, 0.6627309, 0.3597413, 0, 0, 0, 1, 1,
0.3909691, -0.983006, 3.577661, 0, 0, 0, 1, 1,
0.3929802, 0.7348514, 0.5497099, 0, 0, 0, 1, 1,
0.3936746, 0.9205001, 1.94055, 0, 0, 0, 1, 1,
0.3946131, -0.003771113, 0.3640932, 0, 0, 0, 1, 1,
0.3957282, 1.361809, -0.4527969, 0, 0, 0, 1, 1,
0.3962459, 0.1316145, 2.714753, 0, 0, 0, 1, 1,
0.4003686, -0.7642497, 1.859024, 1, 1, 1, 1, 1,
0.4010744, -0.7480149, 3.094444, 1, 1, 1, 1, 1,
0.4029428, 1.449455, -0.1808992, 1, 1, 1, 1, 1,
0.4031488, 2.432295, 0.6951548, 1, 1, 1, 1, 1,
0.4044867, -0.4812651, 1.052014, 1, 1, 1, 1, 1,
0.4149418, -1.623725, 1.688299, 1, 1, 1, 1, 1,
0.4149605, 0.416757, 0.320446, 1, 1, 1, 1, 1,
0.4153332, 1.122933, 0.2869619, 1, 1, 1, 1, 1,
0.4158364, -0.956463, 1.813222, 1, 1, 1, 1, 1,
0.4169434, 0.1821112, 0.3311142, 1, 1, 1, 1, 1,
0.4200956, -0.588425, 3.507858, 1, 1, 1, 1, 1,
0.4206149, -0.7094901, 0.9714797, 1, 1, 1, 1, 1,
0.4253367, -2.318197, 1.914218, 1, 1, 1, 1, 1,
0.4283311, -1.327509, 2.459351, 1, 1, 1, 1, 1,
0.4296627, 0.3903163, 1.119411, 1, 1, 1, 1, 1,
0.43031, 0.6928152, -1.125243, 0, 0, 1, 1, 1,
0.4360335, 1.135409, -0.7074512, 1, 0, 0, 1, 1,
0.4429815, -0.4435434, 2.954248, 1, 0, 0, 1, 1,
0.4454367, 0.7551277, 1.047997, 1, 0, 0, 1, 1,
0.4462135, 1.186445, 1.108176, 1, 0, 0, 1, 1,
0.4462178, -0.04356914, 0.9706512, 1, 0, 0, 1, 1,
0.4471423, 0.60373, -0.2948838, 0, 0, 0, 1, 1,
0.4499314, -1.086272, 1.404116, 0, 0, 0, 1, 1,
0.4602317, -1.120172, 2.391938, 0, 0, 0, 1, 1,
0.4682697, 1.177677, 0.1296151, 0, 0, 0, 1, 1,
0.4693392, -0.4071991, 0.8931971, 0, 0, 0, 1, 1,
0.4727172, 0.4595913, 1.441931, 0, 0, 0, 1, 1,
0.4809487, -1.85506, 1.576625, 0, 0, 0, 1, 1,
0.4829736, -0.5915048, 3.243236, 1, 1, 1, 1, 1,
0.4830537, 0.378387, 2.31143, 1, 1, 1, 1, 1,
0.4867015, 0.772756, 0.677227, 1, 1, 1, 1, 1,
0.4911626, -1.452235, 4.70132, 1, 1, 1, 1, 1,
0.4916491, 0.7675135, 2.877401, 1, 1, 1, 1, 1,
0.4924734, 0.4530347, -2.083241, 1, 1, 1, 1, 1,
0.5004417, 0.5107054, 1.963865, 1, 1, 1, 1, 1,
0.5027129, -1.853127, 3.375311, 1, 1, 1, 1, 1,
0.5079499, -0.6919987, 2.332735, 1, 1, 1, 1, 1,
0.5118639, -0.485682, 1.628062, 1, 1, 1, 1, 1,
0.5120138, 0.5574567, 0.6164442, 1, 1, 1, 1, 1,
0.5178025, -1.213135, 3.082361, 1, 1, 1, 1, 1,
0.5182907, 1.424164, -0.3603377, 1, 1, 1, 1, 1,
0.521031, 1.183986, 0.4032322, 1, 1, 1, 1, 1,
0.528925, -0.8868333, 1.971163, 1, 1, 1, 1, 1,
0.5295014, 0.6346931, 1.135377, 0, 0, 1, 1, 1,
0.5365111, 0.2032133, 0.7354607, 1, 0, 0, 1, 1,
0.5370898, 0.6288165, 1.031385, 1, 0, 0, 1, 1,
0.5412939, -0.4742938, 0.4485458, 1, 0, 0, 1, 1,
0.5434105, -1.76952, 1.676141, 1, 0, 0, 1, 1,
0.552245, -0.9645678, 1.119718, 1, 0, 0, 1, 1,
0.5531802, 0.1742927, 0.03950281, 0, 0, 0, 1, 1,
0.5544242, 0.6292774, 1.760438, 0, 0, 0, 1, 1,
0.5546415, 1.226042, 0.4152803, 0, 0, 0, 1, 1,
0.5549719, 0.6839733, -1.378269, 0, 0, 0, 1, 1,
0.5558642, 0.5279027, 1.688876, 0, 0, 0, 1, 1,
0.5603605, 0.7447569, 2.071054, 0, 0, 0, 1, 1,
0.5612866, 0.1664078, 1.343091, 0, 0, 0, 1, 1,
0.5630431, -0.4353347, 0.9564326, 1, 1, 1, 1, 1,
0.5635331, -2.051548, 2.084672, 1, 1, 1, 1, 1,
0.5641506, 0.2983434, 2.290693, 1, 1, 1, 1, 1,
0.5649325, -0.2225796, 4.208357, 1, 1, 1, 1, 1,
0.5655961, -0.3179538, -0.03905336, 1, 1, 1, 1, 1,
0.5688247, 1.486428, 1.612712, 1, 1, 1, 1, 1,
0.5779585, 0.4870736, 0.741423, 1, 1, 1, 1, 1,
0.5822499, -2.09469, 3.473554, 1, 1, 1, 1, 1,
0.5837421, 0.6340786, 0.5262069, 1, 1, 1, 1, 1,
0.5906802, -1.269242, 3.40191, 1, 1, 1, 1, 1,
0.5926737, -0.6763183, 2.923012, 1, 1, 1, 1, 1,
0.6067101, 1.242306, 0.02515682, 1, 1, 1, 1, 1,
0.6110203, 0.225281, 1.446193, 1, 1, 1, 1, 1,
0.6125336, -1.297366, 3.294294, 1, 1, 1, 1, 1,
0.6135473, 0.1330178, 0.9297822, 1, 1, 1, 1, 1,
0.6161653, 1.015242, 0.8714187, 0, 0, 1, 1, 1,
0.6220855, -0.3049336, 2.157765, 1, 0, 0, 1, 1,
0.6307712, 1.282189, -0.3283868, 1, 0, 0, 1, 1,
0.6308163, 1.146891, -1.467653, 1, 0, 0, 1, 1,
0.6334835, -0.8466358, 0.7494533, 1, 0, 0, 1, 1,
0.6350175, -0.6846978, 2.347708, 1, 0, 0, 1, 1,
0.6403254, 1.111582, 0.6305612, 0, 0, 0, 1, 1,
0.6416551, -1.521683, 3.23223, 0, 0, 0, 1, 1,
0.6485749, -0.2989014, 2.093901, 0, 0, 0, 1, 1,
0.6491849, -0.3210488, 2.262079, 0, 0, 0, 1, 1,
0.6498618, -1.380667, 4.467161, 0, 0, 0, 1, 1,
0.6522816, 0.3459089, 1.71841, 0, 0, 0, 1, 1,
0.6604012, -0.01579858, 2.27803, 0, 0, 0, 1, 1,
0.6608936, 2.700363, 1.140189, 1, 1, 1, 1, 1,
0.6706316, 0.9623072, 0.6623057, 1, 1, 1, 1, 1,
0.6733447, -0.2129409, 2.757199, 1, 1, 1, 1, 1,
0.6772265, 0.7438947, 0.2052887, 1, 1, 1, 1, 1,
0.6833703, 1.362368, -0.8141373, 1, 1, 1, 1, 1,
0.6869425, -0.8793219, 3.99197, 1, 1, 1, 1, 1,
0.6874278, -2.269037, 3.465435, 1, 1, 1, 1, 1,
0.6913232, -0.3128005, 0.8369368, 1, 1, 1, 1, 1,
0.6977882, -0.4585281, 0.908963, 1, 1, 1, 1, 1,
0.7022669, 1.596656, -1.033689, 1, 1, 1, 1, 1,
0.7027582, 0.09945115, 0.5512697, 1, 1, 1, 1, 1,
0.7037269, -0.7695256, 1.923956, 1, 1, 1, 1, 1,
0.7133617, 1.578175, -0.2615772, 1, 1, 1, 1, 1,
0.7142876, 0.9994553, 2.927063, 1, 1, 1, 1, 1,
0.7296632, -0.918768, 4.563631, 1, 1, 1, 1, 1,
0.7328132, 0.3533764, 1.530312, 0, 0, 1, 1, 1,
0.7367969, 0.08141933, 2.524805, 1, 0, 0, 1, 1,
0.7393512, 0.3902482, 1.243604, 1, 0, 0, 1, 1,
0.7398857, 0.5259554, 2.397766, 1, 0, 0, 1, 1,
0.7437618, -1.055304, 3.438259, 1, 0, 0, 1, 1,
0.7455091, -0.872511, 1.43494, 1, 0, 0, 1, 1,
0.7515162, -0.09379669, 0.05587387, 0, 0, 0, 1, 1,
0.7567848, -1.342504, 2.765989, 0, 0, 0, 1, 1,
0.7588564, -0.4477462, 2.310893, 0, 0, 0, 1, 1,
0.7637416, 2.071392, -2.412688, 0, 0, 0, 1, 1,
0.7671321, -0.1495789, 0.1153051, 0, 0, 0, 1, 1,
0.7683982, 0.1139695, 2.30881, 0, 0, 0, 1, 1,
0.7754583, 2.050646, -0.1668843, 0, 0, 0, 1, 1,
0.7775597, -0.7325665, 3.099326, 1, 1, 1, 1, 1,
0.7790488, -0.1523061, 0.1545797, 1, 1, 1, 1, 1,
0.7796798, 0.3418247, 2.125736, 1, 1, 1, 1, 1,
0.782806, 2.463312, 1.089855, 1, 1, 1, 1, 1,
0.7831167, 0.08185454, 0.9077783, 1, 1, 1, 1, 1,
0.7882924, 0.9177279, 1.176075, 1, 1, 1, 1, 1,
0.7884282, -0.05242182, 1.40784, 1, 1, 1, 1, 1,
0.7921252, -1.23514, 3.528577, 1, 1, 1, 1, 1,
0.7991997, 0.7967604, 0.007062362, 1, 1, 1, 1, 1,
0.8059862, 1.390147, 0.5358253, 1, 1, 1, 1, 1,
0.8069558, -0.9824979, 2.302638, 1, 1, 1, 1, 1,
0.8161658, 0.448454, -0.9113306, 1, 1, 1, 1, 1,
0.8161913, 0.2057772, 0.5960001, 1, 1, 1, 1, 1,
0.8168126, 0.2579282, 2.50043, 1, 1, 1, 1, 1,
0.8174967, -0.8912854, 1.311986, 1, 1, 1, 1, 1,
0.8197874, -0.1793011, 2.624121, 0, 0, 1, 1, 1,
0.820061, -0.5186089, 1.362677, 1, 0, 0, 1, 1,
0.8294459, 0.8832327, -1.003752, 1, 0, 0, 1, 1,
0.8298751, 0.8410964, 0.8915765, 1, 0, 0, 1, 1,
0.8363454, 0.4437513, 0.9742211, 1, 0, 0, 1, 1,
0.8382217, -1.948746, 2.281699, 1, 0, 0, 1, 1,
0.8407182, -0.9591765, 0.9338251, 0, 0, 0, 1, 1,
0.8430775, 1.529309, -0.7148522, 0, 0, 0, 1, 1,
0.84333, -0.4632047, 3.78219, 0, 0, 0, 1, 1,
0.8447397, 0.02528219, 1.523055, 0, 0, 0, 1, 1,
0.8485486, -0.3730121, 2.05452, 0, 0, 0, 1, 1,
0.8491665, 1.016604, 1.48767, 0, 0, 0, 1, 1,
0.857156, 1.421312, 1.441385, 0, 0, 0, 1, 1,
0.8724152, -1.133103, 2.752616, 1, 1, 1, 1, 1,
0.8846036, -0.4892467, 0.6730638, 1, 1, 1, 1, 1,
0.8870892, -0.1889996, 0.2169582, 1, 1, 1, 1, 1,
0.8877897, -2.333431, 2.98951, 1, 1, 1, 1, 1,
0.8983921, -0.9614058, 2.862222, 1, 1, 1, 1, 1,
0.9052491, -1.339567, 1.167034, 1, 1, 1, 1, 1,
0.9169046, -0.7146359, 2.849828, 1, 1, 1, 1, 1,
0.9272289, 0.1827117, 1.318862, 1, 1, 1, 1, 1,
0.9305975, 1.984476, 0.7828906, 1, 1, 1, 1, 1,
0.9432771, -0.3536692, 2.706102, 1, 1, 1, 1, 1,
0.9484676, 0.05648148, 0.437893, 1, 1, 1, 1, 1,
0.9548693, 2.39069, -0.3765577, 1, 1, 1, 1, 1,
0.9664038, 0.4925224, 3.182034, 1, 1, 1, 1, 1,
0.9696858, 1.665529, 0.3674093, 1, 1, 1, 1, 1,
0.9717628, 0.5167043, 2.231803, 1, 1, 1, 1, 1,
0.9793543, 0.9831553, 2.212087, 0, 0, 1, 1, 1,
0.980718, 0.02513298, 3.540294, 1, 0, 0, 1, 1,
0.9814631, -1.203695, 2.457191, 1, 0, 0, 1, 1,
0.9890532, 0.6890711, 0.2416053, 1, 0, 0, 1, 1,
0.9897378, -0.1333886, 3.422196, 1, 0, 0, 1, 1,
0.9904092, -0.1384623, 1.525019, 1, 0, 0, 1, 1,
0.9928631, -0.3090768, 0.6962033, 0, 0, 0, 1, 1,
0.9942777, 1.317322, 1.871179, 0, 0, 0, 1, 1,
0.9977714, 1.171745, -0.2792381, 0, 0, 0, 1, 1,
1.001559, 0.3516854, 1.505616, 0, 0, 0, 1, 1,
1.010133, 0.8338591, 1.011265, 0, 0, 0, 1, 1,
1.011041, 1.108228, 2.320543, 0, 0, 0, 1, 1,
1.018516, 1.918378, 1.819035, 0, 0, 0, 1, 1,
1.022513, -1.027802, 1.524285, 1, 1, 1, 1, 1,
1.024333, 0.09290129, 1.54066, 1, 1, 1, 1, 1,
1.026172, -1.058942, 1.986087, 1, 1, 1, 1, 1,
1.033494, -0.5323634, 1.900386, 1, 1, 1, 1, 1,
1.034109, -0.6529387, 2.227034, 1, 1, 1, 1, 1,
1.034894, -0.2190052, 1.680296, 1, 1, 1, 1, 1,
1.036473, -1.061233, 2.563447, 1, 1, 1, 1, 1,
1.049129, -0.6576242, 1.68193, 1, 1, 1, 1, 1,
1.050258, -0.4637333, 2.318228, 1, 1, 1, 1, 1,
1.053247, 0.1002429, 1.436414, 1, 1, 1, 1, 1,
1.06065, -0.521419, 1.398467, 1, 1, 1, 1, 1,
1.071435, -0.6339208, 0.7587265, 1, 1, 1, 1, 1,
1.072795, -1.043173, 3.510828, 1, 1, 1, 1, 1,
1.074139, 0.09322629, 1.931124, 1, 1, 1, 1, 1,
1.08223, 2.564751, 1.288078, 1, 1, 1, 1, 1,
1.086222, -0.3697491, 2.9943, 0, 0, 1, 1, 1,
1.088277, -0.2591519, 1.453594, 1, 0, 0, 1, 1,
1.089908, -1.2737, 1.55604, 1, 0, 0, 1, 1,
1.096625, 0.001913706, 3.126023, 1, 0, 0, 1, 1,
1.102021, -0.7253167, 2.926239, 1, 0, 0, 1, 1,
1.119812, 0.3424242, 0.20788, 1, 0, 0, 1, 1,
1.122274, -1.275704, 1.043915, 0, 0, 0, 1, 1,
1.129318, 0.7830576, 1.862971, 0, 0, 0, 1, 1,
1.129804, 1.016406, 1.868767, 0, 0, 0, 1, 1,
1.134481, -0.3579981, 1.51162, 0, 0, 0, 1, 1,
1.135177, 0.1683945, 1.747147, 0, 0, 0, 1, 1,
1.137814, 0.01369205, -0.320507, 0, 0, 0, 1, 1,
1.143278, -0.4942992, 3.008561, 0, 0, 0, 1, 1,
1.143949, 1.46686, 1.387464, 1, 1, 1, 1, 1,
1.144122, 0.7302573, 1.593691, 1, 1, 1, 1, 1,
1.155171, 0.4200719, 1.344242, 1, 1, 1, 1, 1,
1.164039, -1.578687, 3.757068, 1, 1, 1, 1, 1,
1.165079, 2.388071, 0.5467056, 1, 1, 1, 1, 1,
1.17098, -1.37458, 2.428361, 1, 1, 1, 1, 1,
1.174791, 1.373939, 2.406625, 1, 1, 1, 1, 1,
1.184647, 0.4591314, 2.025923, 1, 1, 1, 1, 1,
1.185299, 0.9047276, -0.1597829, 1, 1, 1, 1, 1,
1.191817, 0.1132268, 0.7416236, 1, 1, 1, 1, 1,
1.195046, 0.1550151, 1.392724, 1, 1, 1, 1, 1,
1.198126, -0.6455957, 3.376796, 1, 1, 1, 1, 1,
1.198595, 1.78722, 0.5896197, 1, 1, 1, 1, 1,
1.201694, 0.9835635, 1.059941, 1, 1, 1, 1, 1,
1.21098, -1.262994, 2.460065, 1, 1, 1, 1, 1,
1.212428, 0.03662958, 1.34887, 0, 0, 1, 1, 1,
1.214835, -0.05872698, 1.756139, 1, 0, 0, 1, 1,
1.216164, 0.329342, 1.526708, 1, 0, 0, 1, 1,
1.224458, -1.493834, 3.628409, 1, 0, 0, 1, 1,
1.240321, 1.13955, 1.63826, 1, 0, 0, 1, 1,
1.240661, 1.569164, 0.3023335, 1, 0, 0, 1, 1,
1.24167, -0.9574257, 2.066622, 0, 0, 0, 1, 1,
1.243988, -1.154282, 2.479116, 0, 0, 0, 1, 1,
1.247508, 1.065804, -0.1004057, 0, 0, 0, 1, 1,
1.250353, -1.592757, 4.073668, 0, 0, 0, 1, 1,
1.261457, 0.8491652, -0.06047483, 0, 0, 0, 1, 1,
1.264002, -0.6477413, 2.574606, 0, 0, 0, 1, 1,
1.266096, 0.2702399, 0.4550132, 0, 0, 0, 1, 1,
1.267383, 0.2997122, 0.2619888, 1, 1, 1, 1, 1,
1.277342, -1.097254, 1.977879, 1, 1, 1, 1, 1,
1.284996, 0.732857, 1.597067, 1, 1, 1, 1, 1,
1.296726, -0.7901869, 3.505871, 1, 1, 1, 1, 1,
1.298691, 0.3488599, 2.267774, 1, 1, 1, 1, 1,
1.301974, 0.01231382, 1.282674, 1, 1, 1, 1, 1,
1.312178, -0.4286844, 0.6151436, 1, 1, 1, 1, 1,
1.314497, 1.643898, 0.7108963, 1, 1, 1, 1, 1,
1.316735, 0.2857196, 0.8222412, 1, 1, 1, 1, 1,
1.319958, -0.200408, 2.66159, 1, 1, 1, 1, 1,
1.325296, -0.827368, 1.52762, 1, 1, 1, 1, 1,
1.331914, 0.372894, 0.5963084, 1, 1, 1, 1, 1,
1.33922, -1.615706, 2.160019, 1, 1, 1, 1, 1,
1.340474, 0.6430169, 1.538486, 1, 1, 1, 1, 1,
1.346193, 0.659786, 0.5874842, 1, 1, 1, 1, 1,
1.352283, -0.5662776, 2.295916, 0, 0, 1, 1, 1,
1.365469, -1.302698, 2.890456, 1, 0, 0, 1, 1,
1.373139, 1.48397, 0.000611462, 1, 0, 0, 1, 1,
1.382261, 0.799859, 2.526538, 1, 0, 0, 1, 1,
1.386248, -0.5210292, 3.376283, 1, 0, 0, 1, 1,
1.389536, -0.9875266, 0.1971125, 1, 0, 0, 1, 1,
1.394133, 0.06679235, 2.276025, 0, 0, 0, 1, 1,
1.395252, 0.9563413, -0.2443527, 0, 0, 0, 1, 1,
1.396408, 0.7444742, 2.891916, 0, 0, 0, 1, 1,
1.400795, 0.8455229, 0.5366884, 0, 0, 0, 1, 1,
1.413246, -0.1127051, 0.259407, 0, 0, 0, 1, 1,
1.41357, -0.3443522, 3.019166, 0, 0, 0, 1, 1,
1.46282, -0.7108887, 2.008098, 0, 0, 0, 1, 1,
1.490953, 0.1643594, 1.13637, 1, 1, 1, 1, 1,
1.517495, 0.9443092, 0.04418807, 1, 1, 1, 1, 1,
1.52601, 0.431165, 1.8812, 1, 1, 1, 1, 1,
1.52611, -1.379454, 1.03805, 1, 1, 1, 1, 1,
1.54159, 1.197138, 1.436689, 1, 1, 1, 1, 1,
1.549454, -1.655647, 1.093824, 1, 1, 1, 1, 1,
1.551184, -1.444755, 0.4195596, 1, 1, 1, 1, 1,
1.5543, -2.446542, 0.630432, 1, 1, 1, 1, 1,
1.564828, -1.232854, 0.9511447, 1, 1, 1, 1, 1,
1.578052, 1.753181, 0.6326706, 1, 1, 1, 1, 1,
1.587706, 1.241553, 2.22061, 1, 1, 1, 1, 1,
1.608338, 0.9021971, 0.9378506, 1, 1, 1, 1, 1,
1.620738, 1.195045, 3.139446, 1, 1, 1, 1, 1,
1.632507, 0.09287285, 0.5882469, 1, 1, 1, 1, 1,
1.633039, -0.06707647, 0.8449548, 1, 1, 1, 1, 1,
1.641324, 0.04428989, 0.7015551, 0, 0, 1, 1, 1,
1.644097, 0.2523306, 0.2354388, 1, 0, 0, 1, 1,
1.649279, 0.5301074, 0.2661476, 1, 0, 0, 1, 1,
1.656198, -0.04609371, 1.234307, 1, 0, 0, 1, 1,
1.658621, -1.134801, 0.8219627, 1, 0, 0, 1, 1,
1.680358, -0.1102764, 1.194857, 1, 0, 0, 1, 1,
1.684331, 0.5758486, 0.1700699, 0, 0, 0, 1, 1,
1.6863, -0.3038508, 1.826624, 0, 0, 0, 1, 1,
1.705272, -0.7643483, 0.5440276, 0, 0, 0, 1, 1,
1.705932, 0.5645325, 0.257088, 0, 0, 0, 1, 1,
1.709814, 2.164106, 2.996474, 0, 0, 0, 1, 1,
1.709893, -1.143506, 0.8212196, 0, 0, 0, 1, 1,
1.721333, -0.3839521, 1.846946, 0, 0, 0, 1, 1,
1.739898, 0.3124147, 2.173829, 1, 1, 1, 1, 1,
1.756607, 0.3282043, 1.955105, 1, 1, 1, 1, 1,
1.80013, 1.305146, 2.571176, 1, 1, 1, 1, 1,
1.804644, -0.4204483, 2.471891, 1, 1, 1, 1, 1,
1.805748, -0.3937072, 2.875005, 1, 1, 1, 1, 1,
1.809961, 0.2094143, 1.962725, 1, 1, 1, 1, 1,
1.850012, -1.09669, 1.880102, 1, 1, 1, 1, 1,
1.870714, 0.2907269, 1.416736, 1, 1, 1, 1, 1,
1.907508, -2.144688, 2.128957, 1, 1, 1, 1, 1,
1.908849, -1.745194, 0.489136, 1, 1, 1, 1, 1,
1.919647, -1.052354, 2.195292, 1, 1, 1, 1, 1,
1.935704, 0.5979539, 0.3467595, 1, 1, 1, 1, 1,
1.93669, 0.7941108, 2.153312, 1, 1, 1, 1, 1,
1.938548, 0.8013368, 0.5993249, 1, 1, 1, 1, 1,
1.941538, -1.244043, 2.502957, 1, 1, 1, 1, 1,
1.952292, -0.3971472, 2.369692, 0, 0, 1, 1, 1,
1.984098, 0.3568876, 1.752627, 1, 0, 0, 1, 1,
2.011182, -0.4746615, 1.689488, 1, 0, 0, 1, 1,
2.064803, -1.675459, 3.702297, 1, 0, 0, 1, 1,
2.069675, 1.727932, 2.039966, 1, 0, 0, 1, 1,
2.083325, 0.7790233, -1.217849, 1, 0, 0, 1, 1,
2.115261, -0.5887197, 2.969881, 0, 0, 0, 1, 1,
2.144077, 0.3614323, 0.8057729, 0, 0, 0, 1, 1,
2.217386, 1.316496, 0.2422642, 0, 0, 0, 1, 1,
2.231685, 1.560069, -1.833939, 0, 0, 0, 1, 1,
2.276337, 1.537736, 0.8681834, 0, 0, 0, 1, 1,
2.399457, 0.6384428, 2.266849, 0, 0, 0, 1, 1,
2.460978, 0.6864142, 0.3566331, 0, 0, 0, 1, 1,
2.50324, -0.4932741, 2.30861, 1, 1, 1, 1, 1,
2.508815, -2.024142, 3.812232, 1, 1, 1, 1, 1,
2.518026, -1.123477, 1.215543, 1, 1, 1, 1, 1,
2.676987, 0.9313926, 2.313181, 1, 1, 1, 1, 1,
2.732193, 0.4455136, 2.471446, 1, 1, 1, 1, 1,
2.847891, 1.295731, 1.066572, 1, 1, 1, 1, 1,
2.857029, 1.3873, 1.814432, 1, 1, 1, 1, 1
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
var radius = 9.641828;
var distance = 33.86651;
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
mvMatrix.translate( 0.4262618, 0.4773122, 0.1887224 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.86651);
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
