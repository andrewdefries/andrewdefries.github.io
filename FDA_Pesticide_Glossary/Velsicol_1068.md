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
-2.909088, -0.7352183, -1.181514, 1, 0, 0, 1,
-2.559943, 0.5955991, -2.551142, 1, 0.007843138, 0, 1,
-2.550871, 0.4794003, -2.342565, 1, 0.01176471, 0, 1,
-2.535298, 0.9755726, -1.57155, 1, 0.01960784, 0, 1,
-2.520428, 1.085368, -2.296489, 1, 0.02352941, 0, 1,
-2.457045, 0.1028366, -1.303522, 1, 0.03137255, 0, 1,
-2.444471, -1.945125, -1.704036, 1, 0.03529412, 0, 1,
-2.437964, 0.1951789, -1.286353, 1, 0.04313726, 0, 1,
-2.416879, 0.1692242, 1.534894, 1, 0.04705882, 0, 1,
-2.413576, 2.671592, -0.2332436, 1, 0.05490196, 0, 1,
-2.375833, -0.7524951, -3.440172, 1, 0.05882353, 0, 1,
-2.366578, 0.3931896, -1.742531, 1, 0.06666667, 0, 1,
-2.333635, -2.413275, -2.548277, 1, 0.07058824, 0, 1,
-2.31795, 0.3110408, -2.311531, 1, 0.07843138, 0, 1,
-2.290323, -1.269018, -2.417162, 1, 0.08235294, 0, 1,
-2.241796, -1.037078, -3.036086, 1, 0.09019608, 0, 1,
-2.235804, -0.6449537, -2.232936, 1, 0.09411765, 0, 1,
-2.224621, -0.7517325, -2.902145, 1, 0.1019608, 0, 1,
-2.205902, 0.2277681, -1.610758, 1, 0.1098039, 0, 1,
-2.194179, 0.8493626, -0.5315098, 1, 0.1137255, 0, 1,
-2.160488, -0.2361483, -1.704707, 1, 0.1215686, 0, 1,
-2.156966, 3.814383, -0.6307581, 1, 0.1254902, 0, 1,
-2.147767, 1.790427, -0.3587875, 1, 0.1333333, 0, 1,
-2.123354, -0.1971989, -1.835779, 1, 0.1372549, 0, 1,
-2.084376, -0.2503609, -0.767839, 1, 0.145098, 0, 1,
-2.082327, -1.121881, -3.699357, 1, 0.1490196, 0, 1,
-2.071157, -0.05494497, 0.02367927, 1, 0.1568628, 0, 1,
-2.05497, 1.186352, -0.3800165, 1, 0.1607843, 0, 1,
-2.047027, 0.2624141, -2.540027, 1, 0.1686275, 0, 1,
-2.044105, 0.1768372, -0.6667584, 1, 0.172549, 0, 1,
-1.994088, -0.1835718, -2.380486, 1, 0.1803922, 0, 1,
-1.986449, 0.4209507, -1.412467, 1, 0.1843137, 0, 1,
-1.980477, 0.1253934, -0.3170677, 1, 0.1921569, 0, 1,
-1.980453, 0.1011046, -1.664445, 1, 0.1960784, 0, 1,
-1.953783, 1.590951, -1.385045, 1, 0.2039216, 0, 1,
-1.946118, -0.3195011, -0.8930842, 1, 0.2117647, 0, 1,
-1.913828, 2.311076, 0.05852862, 1, 0.2156863, 0, 1,
-1.897395, 0.2295082, -1.134638, 1, 0.2235294, 0, 1,
-1.871517, -0.7647274, -2.725859, 1, 0.227451, 0, 1,
-1.866513, -0.0610766, -1.34553, 1, 0.2352941, 0, 1,
-1.805411, 0.2948886, -3.886174, 1, 0.2392157, 0, 1,
-1.792024, -0.06029874, -3.260306, 1, 0.2470588, 0, 1,
-1.791686, 0.8372465, -0.9691939, 1, 0.2509804, 0, 1,
-1.785487, 0.02915829, -2.165272, 1, 0.2588235, 0, 1,
-1.780637, 0.01517584, -0.6907063, 1, 0.2627451, 0, 1,
-1.772533, 0.5929126, -0.1785708, 1, 0.2705882, 0, 1,
-1.76802, 1.388035, 1.151826, 1, 0.2745098, 0, 1,
-1.746462, 0.08314193, -2.838479, 1, 0.282353, 0, 1,
-1.746428, 0.7162735, -3.083037, 1, 0.2862745, 0, 1,
-1.702066, -0.4622046, -0.4183864, 1, 0.2941177, 0, 1,
-1.684665, -0.5901052, -2.48165, 1, 0.3019608, 0, 1,
-1.679493, -0.2166925, -3.601718, 1, 0.3058824, 0, 1,
-1.672915, 0.3205029, -2.447583, 1, 0.3137255, 0, 1,
-1.668128, -0.217709, -2.643102, 1, 0.3176471, 0, 1,
-1.666962, -0.4080011, -2.163223, 1, 0.3254902, 0, 1,
-1.664184, 0.6204647, -1.53427, 1, 0.3294118, 0, 1,
-1.662871, -1.464058, -3.462115, 1, 0.3372549, 0, 1,
-1.639973, 0.3161173, -1.861295, 1, 0.3411765, 0, 1,
-1.637841, -0.9935802, -3.138658, 1, 0.3490196, 0, 1,
-1.635623, 0.451073, -2.378468, 1, 0.3529412, 0, 1,
-1.586637, -0.1269832, -3.400419, 1, 0.3607843, 0, 1,
-1.58543, -0.951905, -2.953761, 1, 0.3647059, 0, 1,
-1.574279, -0.9217846, -2.496426, 1, 0.372549, 0, 1,
-1.542896, 2.154163, -1.755329, 1, 0.3764706, 0, 1,
-1.526355, -0.2804056, -0.9279141, 1, 0.3843137, 0, 1,
-1.524392, 0.3163849, 0.216393, 1, 0.3882353, 0, 1,
-1.510515, 1.179785, -0.2924769, 1, 0.3960784, 0, 1,
-1.495422, 0.5812631, -0.2133995, 1, 0.4039216, 0, 1,
-1.484377, -1.382956, -2.124514, 1, 0.4078431, 0, 1,
-1.474903, -2.197542, -1.041949, 1, 0.4156863, 0, 1,
-1.470126, -0.6137818, -2.320655, 1, 0.4196078, 0, 1,
-1.468605, -1.418062, -2.66445, 1, 0.427451, 0, 1,
-1.468276, -0.8613237, -3.837911, 1, 0.4313726, 0, 1,
-1.458991, 1.075174, -0.847183, 1, 0.4392157, 0, 1,
-1.453512, -1.326373, -1.461198, 1, 0.4431373, 0, 1,
-1.440755, 1.756973, -1.229601, 1, 0.4509804, 0, 1,
-1.440583, 1.264627, -2.793291, 1, 0.454902, 0, 1,
-1.420317, 0.6870428, -2.288488, 1, 0.4627451, 0, 1,
-1.411804, -0.7983803, -1.890728, 1, 0.4666667, 0, 1,
-1.409699, 2.114537, 0.4888479, 1, 0.4745098, 0, 1,
-1.398454, -0.06903993, -0.3155973, 1, 0.4784314, 0, 1,
-1.393452, -0.9787059, -2.436385, 1, 0.4862745, 0, 1,
-1.390668, 0.3646812, -2.833878, 1, 0.4901961, 0, 1,
-1.39034, -0.5994298, -1.725206, 1, 0.4980392, 0, 1,
-1.389073, -0.6675628, -2.196584, 1, 0.5058824, 0, 1,
-1.378913, -0.7347161, -1.110868, 1, 0.509804, 0, 1,
-1.376014, 1.123448, -0.8110949, 1, 0.5176471, 0, 1,
-1.370264, 0.3415753, -0.5227091, 1, 0.5215687, 0, 1,
-1.363495, 0.4201968, -2.228039, 1, 0.5294118, 0, 1,
-1.361129, 1.682087, 0.04633643, 1, 0.5333334, 0, 1,
-1.341095, 0.1390339, -1.26558, 1, 0.5411765, 0, 1,
-1.334751, 0.5343016, -1.255556, 1, 0.5450981, 0, 1,
-1.3339, 0.7472094, 0.04445475, 1, 0.5529412, 0, 1,
-1.333307, -0.5538086, -0.3452075, 1, 0.5568628, 0, 1,
-1.321261, 0.5984612, -3.457306, 1, 0.5647059, 0, 1,
-1.309791, -0.8652503, -2.823702, 1, 0.5686275, 0, 1,
-1.308752, -0.3520385, -1.503772, 1, 0.5764706, 0, 1,
-1.308181, 0.7869759, 0.3621069, 1, 0.5803922, 0, 1,
-1.308134, 1.333551, 0.3360217, 1, 0.5882353, 0, 1,
-1.307854, -0.9535425, -1.784195, 1, 0.5921569, 0, 1,
-1.293973, -3.223277, -3.16564, 1, 0.6, 0, 1,
-1.292485, -0.9930513, -1.824814, 1, 0.6078432, 0, 1,
-1.280798, -0.953084, -3.163156, 1, 0.6117647, 0, 1,
-1.2735, -1.159846, -1.71365, 1, 0.6196079, 0, 1,
-1.265703, -0.4277968, -1.994641, 1, 0.6235294, 0, 1,
-1.26282, -0.3267, -1.866907, 1, 0.6313726, 0, 1,
-1.257739, -1.023729, -2.65377, 1, 0.6352941, 0, 1,
-1.255644, 0.7477714, -2.37629, 1, 0.6431373, 0, 1,
-1.245898, -1.511276, -0.9670022, 1, 0.6470588, 0, 1,
-1.24252, -0.3034012, -2.750497, 1, 0.654902, 0, 1,
-1.239928, 2.805689, 0.528402, 1, 0.6588235, 0, 1,
-1.23965, -0.7786542, -1.565017, 1, 0.6666667, 0, 1,
-1.236187, -0.3020101, -1.458109, 1, 0.6705883, 0, 1,
-1.230343, 1.788108, -0.8001204, 1, 0.6784314, 0, 1,
-1.217334, 0.9732344, -1.248549, 1, 0.682353, 0, 1,
-1.210412, -0.5952172, -2.001312, 1, 0.6901961, 0, 1,
-1.210124, 0.2332914, -1.630584, 1, 0.6941177, 0, 1,
-1.20807, 1.25767, -2.5106, 1, 0.7019608, 0, 1,
-1.201597, 1.456565, 0.3355238, 1, 0.7098039, 0, 1,
-1.198653, -0.4305187, -1.102378, 1, 0.7137255, 0, 1,
-1.198143, -0.16739, -1.107448, 1, 0.7215686, 0, 1,
-1.194185, -0.2437414, -0.2475867, 1, 0.7254902, 0, 1,
-1.192492, -2.028192, -1.879164, 1, 0.7333333, 0, 1,
-1.188343, -1.69297, -1.528684, 1, 0.7372549, 0, 1,
-1.18811, 0.6608305, -1.908278, 1, 0.7450981, 0, 1,
-1.187922, 0.008523389, -1.606463, 1, 0.7490196, 0, 1,
-1.185005, -1.314925, -1.906764, 1, 0.7568628, 0, 1,
-1.18073, 1.585065, -1.830858, 1, 0.7607843, 0, 1,
-1.175795, 0.6935871, -0.3011029, 1, 0.7686275, 0, 1,
-1.172955, 0.9308903, -1.14949, 1, 0.772549, 0, 1,
-1.170478, -0.4511529, -1.330402, 1, 0.7803922, 0, 1,
-1.161462, -0.1629995, -1.100608, 1, 0.7843137, 0, 1,
-1.156283, -0.5741971, -1.811349, 1, 0.7921569, 0, 1,
-1.153262, 0.5738285, -0.9214582, 1, 0.7960784, 0, 1,
-1.145067, -2.161031, -1.720931, 1, 0.8039216, 0, 1,
-1.127495, 1.646676, -0.5490564, 1, 0.8117647, 0, 1,
-1.122388, 1.303664, -0.5366017, 1, 0.8156863, 0, 1,
-1.121695, -0.2878748, -1.473422, 1, 0.8235294, 0, 1,
-1.121375, -1.167446, -0.2531698, 1, 0.827451, 0, 1,
-1.119715, -0.1560353, -2.120973, 1, 0.8352941, 0, 1,
-1.118578, -2.858375, -4.091124, 1, 0.8392157, 0, 1,
-1.111582, 0.5296947, -1.25369, 1, 0.8470588, 0, 1,
-1.104373, 1.273037, -0.9154803, 1, 0.8509804, 0, 1,
-1.102249, 1.124886, -1.036616, 1, 0.8588235, 0, 1,
-1.100158, 1.109177, -1.568867, 1, 0.8627451, 0, 1,
-1.092589, 0.6154379, -1.015039, 1, 0.8705882, 0, 1,
-1.092304, 2.317921, 0.01930488, 1, 0.8745098, 0, 1,
-1.090618, 0.4539906, -3.191334, 1, 0.8823529, 0, 1,
-1.088753, -0.8100491, -2.280135, 1, 0.8862745, 0, 1,
-1.079562, -0.9748003, -4.189762, 1, 0.8941177, 0, 1,
-1.079254, 0.8622391, -0.7861332, 1, 0.8980392, 0, 1,
-1.076841, -0.101113, -3.022983, 1, 0.9058824, 0, 1,
-1.072037, 0.5940455, -0.8698117, 1, 0.9137255, 0, 1,
-1.069922, -0.4252533, -3.738398, 1, 0.9176471, 0, 1,
-1.061398, -0.08680368, -0.1894443, 1, 0.9254902, 0, 1,
-1.050503, -1.800598, -2.42575, 1, 0.9294118, 0, 1,
-1.04939, 0.5295329, -2.185437, 1, 0.9372549, 0, 1,
-1.046271, 1.009723, -0.01679201, 1, 0.9411765, 0, 1,
-1.044732, -0.7606163, -0.6388589, 1, 0.9490196, 0, 1,
-1.043683, 0.3829651, -2.704866, 1, 0.9529412, 0, 1,
-1.040301, -0.7875701, -0.4564571, 1, 0.9607843, 0, 1,
-1.034823, 1.781204, -0.3085677, 1, 0.9647059, 0, 1,
-1.033082, 0.7654485, -1.406008, 1, 0.972549, 0, 1,
-1.032025, 0.913539, -0.1941314, 1, 0.9764706, 0, 1,
-1.02344, -0.244888, -1.460396, 1, 0.9843137, 0, 1,
-1.0136, 0.7497313, -0.1699751, 1, 0.9882353, 0, 1,
-1.008487, -1.38841, -1.380338, 1, 0.9960784, 0, 1,
-0.9984747, -1.609149, -5.138824, 0.9960784, 1, 0, 1,
-0.9974435, -1.485461, -1.046268, 0.9921569, 1, 0, 1,
-0.9967272, 0.9105412, -1.183342, 0.9843137, 1, 0, 1,
-0.9963567, 0.3823938, -0.2735859, 0.9803922, 1, 0, 1,
-0.9914572, 0.4897143, -2.182717, 0.972549, 1, 0, 1,
-0.9889653, -1.654773, -2.765392, 0.9686275, 1, 0, 1,
-0.9783393, -2.153944, -2.145779, 0.9607843, 1, 0, 1,
-0.9721404, 0.7885284, -1.738435, 0.9568627, 1, 0, 1,
-0.9704019, -1.558125, -1.868592, 0.9490196, 1, 0, 1,
-0.9700347, 0.1213125, -0.6259839, 0.945098, 1, 0, 1,
-0.952678, -0.8608521, -2.337568, 0.9372549, 1, 0, 1,
-0.9513775, -0.008467216, -1.232872, 0.9333333, 1, 0, 1,
-0.9491524, 1.354479, -0.5343686, 0.9254902, 1, 0, 1,
-0.9455395, 0.03630206, -2.366939, 0.9215686, 1, 0, 1,
-0.9418057, 0.6632617, -1.82234, 0.9137255, 1, 0, 1,
-0.9407863, 0.3665103, -2.572756, 0.9098039, 1, 0, 1,
-0.939145, 1.409946, 1.145195, 0.9019608, 1, 0, 1,
-0.9384159, -0.5336975, -1.525917, 0.8941177, 1, 0, 1,
-0.937622, 1.171807, -0.797835, 0.8901961, 1, 0, 1,
-0.9311094, -1.472734, -3.407072, 0.8823529, 1, 0, 1,
-0.9236381, -1.144835, -2.99542, 0.8784314, 1, 0, 1,
-0.922057, -0.1306172, -1.878937, 0.8705882, 1, 0, 1,
-0.9219974, 0.5169995, -1.723272, 0.8666667, 1, 0, 1,
-0.9169984, 0.9204859, -0.02166408, 0.8588235, 1, 0, 1,
-0.9163268, -0.5845156, -2.874516, 0.854902, 1, 0, 1,
-0.9138901, -1.58733, -2.562442, 0.8470588, 1, 0, 1,
-0.9128954, 0.2308332, 0.2368145, 0.8431373, 1, 0, 1,
-0.9061961, -0.6086971, -2.399145, 0.8352941, 1, 0, 1,
-0.9057217, -1.513031, -4.70445, 0.8313726, 1, 0, 1,
-0.904327, -0.3915815, -3.327689, 0.8235294, 1, 0, 1,
-0.898789, -0.9893972, -2.347806, 0.8196079, 1, 0, 1,
-0.8942172, 0.008217227, -2.753423, 0.8117647, 1, 0, 1,
-0.8903261, 0.06372861, -3.039538, 0.8078431, 1, 0, 1,
-0.8838703, -0.4761201, -4.212987, 0.8, 1, 0, 1,
-0.8802252, -0.4797637, -1.235762, 0.7921569, 1, 0, 1,
-0.8796385, 1.717662, -1.548165, 0.7882353, 1, 0, 1,
-0.8779934, 0.3323413, 0.8521348, 0.7803922, 1, 0, 1,
-0.8689899, -0.34263, -0.9242419, 0.7764706, 1, 0, 1,
-0.859836, 0.2782012, -2.282108, 0.7686275, 1, 0, 1,
-0.8591135, -1.443871, -2.780804, 0.7647059, 1, 0, 1,
-0.8533185, -0.7241367, -3.382926, 0.7568628, 1, 0, 1,
-0.8377453, 0.3934341, -0.7144662, 0.7529412, 1, 0, 1,
-0.8366213, -0.9929542, -1.767395, 0.7450981, 1, 0, 1,
-0.8363698, -1.113723, -3.685866, 0.7411765, 1, 0, 1,
-0.8329379, -0.3996504, -0.9913305, 0.7333333, 1, 0, 1,
-0.8324661, 0.1026607, -0.603996, 0.7294118, 1, 0, 1,
-0.8323457, -0.1261934, -0.6069118, 0.7215686, 1, 0, 1,
-0.8297758, 0.4643987, -1.696681, 0.7176471, 1, 0, 1,
-0.8282079, -0.6875139, -1.15485, 0.7098039, 1, 0, 1,
-0.8267378, 0.907013, -0.6626193, 0.7058824, 1, 0, 1,
-0.8250664, 0.483597, -1.349764, 0.6980392, 1, 0, 1,
-0.8237106, -0.02533716, -0.8581845, 0.6901961, 1, 0, 1,
-0.8205704, -1.890194, -1.79048, 0.6862745, 1, 0, 1,
-0.8112146, -0.09294996, -1.745321, 0.6784314, 1, 0, 1,
-0.8090799, 0.3405486, -1.008847, 0.6745098, 1, 0, 1,
-0.8010954, -1.206954, -2.633634, 0.6666667, 1, 0, 1,
-0.8003601, 0.6301246, -1.184027, 0.6627451, 1, 0, 1,
-0.7954898, 0.8194679, -1.241938, 0.654902, 1, 0, 1,
-0.7929803, -2.546633, -1.59387, 0.6509804, 1, 0, 1,
-0.7920887, 0.1158996, -1.699213, 0.6431373, 1, 0, 1,
-0.7916633, -0.1020363, -2.54849, 0.6392157, 1, 0, 1,
-0.7904071, 0.592463, -0.1854982, 0.6313726, 1, 0, 1,
-0.7859439, -1.81986, -3.018681, 0.627451, 1, 0, 1,
-0.7823068, -0.1781613, 0.1697854, 0.6196079, 1, 0, 1,
-0.7796468, 1.69153, -1.087515, 0.6156863, 1, 0, 1,
-0.773885, -0.4908544, -3.034714, 0.6078432, 1, 0, 1,
-0.7737239, -1.026245, -2.380554, 0.6039216, 1, 0, 1,
-0.7619519, -0.7514897, -3.126709, 0.5960785, 1, 0, 1,
-0.7547536, -0.1501452, -0.6692677, 0.5882353, 1, 0, 1,
-0.746798, -0.8689008, -3.324344, 0.5843138, 1, 0, 1,
-0.74309, 2.006994, -1.244403, 0.5764706, 1, 0, 1,
-0.74024, -0.1881381, -2.323479, 0.572549, 1, 0, 1,
-0.7379509, 2.321298, -1.45604, 0.5647059, 1, 0, 1,
-0.7371738, 0.4956124, 0.200843, 0.5607843, 1, 0, 1,
-0.7295082, 0.9531735, -1.863906, 0.5529412, 1, 0, 1,
-0.7282289, -0.7179981, 0.2379886, 0.5490196, 1, 0, 1,
-0.7226201, 0.3739196, -2.113825, 0.5411765, 1, 0, 1,
-0.7219776, 0.4428694, -3.437058, 0.5372549, 1, 0, 1,
-0.7175066, -0.413871, -1.84767, 0.5294118, 1, 0, 1,
-0.7157788, -0.3541494, -2.319466, 0.5254902, 1, 0, 1,
-0.712635, 0.010771, -1.498464, 0.5176471, 1, 0, 1,
-0.7106094, 1.455007, -1.999247, 0.5137255, 1, 0, 1,
-0.7085019, -0.2021556, -3.134732, 0.5058824, 1, 0, 1,
-0.7076839, -1.52594, -2.406175, 0.5019608, 1, 0, 1,
-0.7071165, 0.005684952, -1.940785, 0.4941176, 1, 0, 1,
-0.7060356, 0.4523002, 0.00959499, 0.4862745, 1, 0, 1,
-0.7051275, 1.864815, -0.4574709, 0.4823529, 1, 0, 1,
-0.7014667, 0.3394468, 0.183913, 0.4745098, 1, 0, 1,
-0.7002626, 1.115892, -0.8797644, 0.4705882, 1, 0, 1,
-0.6992739, 1.095407, -0.2142518, 0.4627451, 1, 0, 1,
-0.699067, 1.220908, -1.864862, 0.4588235, 1, 0, 1,
-0.694887, -1.818209, -2.893854, 0.4509804, 1, 0, 1,
-0.6942005, -0.3451271, -2.653835, 0.4470588, 1, 0, 1,
-0.6937498, 0.1605887, -0.4824148, 0.4392157, 1, 0, 1,
-0.6881811, -0.3805729, -2.233014, 0.4352941, 1, 0, 1,
-0.684493, 1.640947, -0.2580698, 0.427451, 1, 0, 1,
-0.6823886, 1.550871, 0.2662134, 0.4235294, 1, 0, 1,
-0.681069, 1.0374, 1.92975, 0.4156863, 1, 0, 1,
-0.6802259, 0.2785433, -0.7969055, 0.4117647, 1, 0, 1,
-0.6737779, -0.1303504, -2.158559, 0.4039216, 1, 0, 1,
-0.6737227, -0.5429006, -1.177468, 0.3960784, 1, 0, 1,
-0.6703077, 0.5398157, 0.1123904, 0.3921569, 1, 0, 1,
-0.667002, -0.246611, -1.526219, 0.3843137, 1, 0, 1,
-0.6660072, -0.5001588, -2.567078, 0.3803922, 1, 0, 1,
-0.6588294, -1.373204, -3.956313, 0.372549, 1, 0, 1,
-0.6538643, 0.5471821, -1.046417, 0.3686275, 1, 0, 1,
-0.6534306, -0.3854562, -2.175728, 0.3607843, 1, 0, 1,
-0.6490944, 0.6553038, -1.741799, 0.3568628, 1, 0, 1,
-0.6481389, -0.5856423, -1.092325, 0.3490196, 1, 0, 1,
-0.6461653, -2.00943, -4.413936, 0.345098, 1, 0, 1,
-0.6444824, -0.9799712, -2.252477, 0.3372549, 1, 0, 1,
-0.6438962, 0.1545239, -1.299736, 0.3333333, 1, 0, 1,
-0.6414631, 0.1413315, -0.5831117, 0.3254902, 1, 0, 1,
-0.6351157, 1.825227, -0.8052241, 0.3215686, 1, 0, 1,
-0.6299925, -0.1223143, -1.007776, 0.3137255, 1, 0, 1,
-0.6262097, 1.627507, -1.553598, 0.3098039, 1, 0, 1,
-0.6172971, 0.6703645, -0.3762116, 0.3019608, 1, 0, 1,
-0.6149552, 1.709952, -1.660136, 0.2941177, 1, 0, 1,
-0.6059933, -0.4299222, -3.765121, 0.2901961, 1, 0, 1,
-0.6036745, 2.938887, 0.2929392, 0.282353, 1, 0, 1,
-0.6017101, 0.02025834, -0.8449531, 0.2784314, 1, 0, 1,
-0.6016656, -0.03655145, -2.068667, 0.2705882, 1, 0, 1,
-0.5971029, 1.460371, -1.095254, 0.2666667, 1, 0, 1,
-0.5946073, -1.870139, -3.418146, 0.2588235, 1, 0, 1,
-0.5929957, 1.164683, 0.11195, 0.254902, 1, 0, 1,
-0.5849212, -0.5466523, -2.59276, 0.2470588, 1, 0, 1,
-0.5823592, -0.3660165, -2.352702, 0.2431373, 1, 0, 1,
-0.5821925, 0.1313846, 0.2390778, 0.2352941, 1, 0, 1,
-0.5819821, -0.4750874, -1.903145, 0.2313726, 1, 0, 1,
-0.5778778, -0.3919102, -3.299074, 0.2235294, 1, 0, 1,
-0.5743284, -0.674733, -2.013889, 0.2196078, 1, 0, 1,
-0.5732716, 0.006375112, -1.343315, 0.2117647, 1, 0, 1,
-0.5728382, -0.7819152, -2.374349, 0.2078431, 1, 0, 1,
-0.5710493, -0.6546183, -2.505124, 0.2, 1, 0, 1,
-0.566613, 0.5460202, -0.6612152, 0.1921569, 1, 0, 1,
-0.5579262, -0.7571921, -1.535589, 0.1882353, 1, 0, 1,
-0.5551688, -1.863979, -3.194631, 0.1803922, 1, 0, 1,
-0.5537468, 0.266287, -2.993153, 0.1764706, 1, 0, 1,
-0.5448017, -1.623974, -2.347111, 0.1686275, 1, 0, 1,
-0.5443754, 0.3787975, -0.7729581, 0.1647059, 1, 0, 1,
-0.5372964, -1.116813, -3.589708, 0.1568628, 1, 0, 1,
-0.5318524, -0.3645979, -0.3676329, 0.1529412, 1, 0, 1,
-0.5308231, 1.310587, 0.7563546, 0.145098, 1, 0, 1,
-0.5285345, -0.1489765, -1.810392, 0.1411765, 1, 0, 1,
-0.5278004, -0.2014637, -2.703636, 0.1333333, 1, 0, 1,
-0.5257252, -2.191921, -2.752924, 0.1294118, 1, 0, 1,
-0.5253077, -0.8763531, -2.146519, 0.1215686, 1, 0, 1,
-0.5197181, 0.08435604, -1.484712, 0.1176471, 1, 0, 1,
-0.5147021, 0.1396901, -2.915715, 0.1098039, 1, 0, 1,
-0.5140631, 0.1081363, 1.212701, 0.1058824, 1, 0, 1,
-0.5103431, -0.05285743, -2.603356, 0.09803922, 1, 0, 1,
-0.5089342, -0.732893, -3.813753, 0.09019608, 1, 0, 1,
-0.5081849, -0.2611477, -1.80023, 0.08627451, 1, 0, 1,
-0.5075497, -0.1672072, -2.792056, 0.07843138, 1, 0, 1,
-0.5066029, 0.8851079, 0.1629982, 0.07450981, 1, 0, 1,
-0.5057352, -0.1823451, -1.392582, 0.06666667, 1, 0, 1,
-0.5000046, -1.357042, -1.701746, 0.0627451, 1, 0, 1,
-0.4999364, 1.275208, -1.977232, 0.05490196, 1, 0, 1,
-0.4926543, 0.768967, -0.4612041, 0.05098039, 1, 0, 1,
-0.4896671, 0.8966082, -0.7687715, 0.04313726, 1, 0, 1,
-0.4896091, 0.1185682, -1.950256, 0.03921569, 1, 0, 1,
-0.4864993, -0.1999246, -2.948674, 0.03137255, 1, 0, 1,
-0.4808433, -0.0756205, -2.525318, 0.02745098, 1, 0, 1,
-0.4796404, -0.9684914, -2.630012, 0.01960784, 1, 0, 1,
-0.474619, -0.1011205, -1.857147, 0.01568628, 1, 0, 1,
-0.47409, 0.09231249, -2.577917, 0.007843138, 1, 0, 1,
-0.4723374, -1.554651, -2.996887, 0.003921569, 1, 0, 1,
-0.4722731, 1.791897, -1.42222, 0, 1, 0.003921569, 1,
-0.4658998, 0.4955123, 0.2459316, 0, 1, 0.01176471, 1,
-0.4633402, 0.6705754, 0.7596335, 0, 1, 0.01568628, 1,
-0.4576495, -0.3492357, -4.349962, 0, 1, 0.02352941, 1,
-0.4573906, 0.241515, -1.288939, 0, 1, 0.02745098, 1,
-0.453958, -1.425196, -3.601387, 0, 1, 0.03529412, 1,
-0.4514729, 0.5320146, -2.048259, 0, 1, 0.03921569, 1,
-0.4497233, -0.8275219, -3.044693, 0, 1, 0.04705882, 1,
-0.4491788, -1.15249, -1.46351, 0, 1, 0.05098039, 1,
-0.4465827, -2.130252, -2.69038, 0, 1, 0.05882353, 1,
-0.4465552, 0.3900057, 0.8987869, 0, 1, 0.0627451, 1,
-0.4442476, 1.286654, -0.8052971, 0, 1, 0.07058824, 1,
-0.4411882, -0.4087752, -1.988694, 0, 1, 0.07450981, 1,
-0.4336525, -0.1737826, -0.3756087, 0, 1, 0.08235294, 1,
-0.4232563, -0.3746113, -2.48131, 0, 1, 0.08627451, 1,
-0.4206187, 0.763684, -0.2426691, 0, 1, 0.09411765, 1,
-0.4130727, 0.5420048, -0.9231784, 0, 1, 0.1019608, 1,
-0.4110768, 1.007644, -0.5021718, 0, 1, 0.1058824, 1,
-0.4079376, 0.5569025, -2.519429, 0, 1, 0.1137255, 1,
-0.407417, 0.7730951, -2.826729, 0, 1, 0.1176471, 1,
-0.4043796, -0.3764989, -2.221568, 0, 1, 0.1254902, 1,
-0.4042754, -1.839421, -4.290298, 0, 1, 0.1294118, 1,
-0.4011379, -0.4431795, -3.849428, 0, 1, 0.1372549, 1,
-0.3993804, -0.2103417, -3.639871, 0, 1, 0.1411765, 1,
-0.3965158, -1.184134, -3.669394, 0, 1, 0.1490196, 1,
-0.39242, 0.4910433, -1.167079, 0, 1, 0.1529412, 1,
-0.3897455, 0.433466, -1.650159, 0, 1, 0.1607843, 1,
-0.3820063, -0.2860116, -1.743295, 0, 1, 0.1647059, 1,
-0.3767848, -0.547091, -2.0674, 0, 1, 0.172549, 1,
-0.3733242, 0.9570549, -0.4540625, 0, 1, 0.1764706, 1,
-0.371661, -0.3395015, -1.593377, 0, 1, 0.1843137, 1,
-0.3700602, 0.4459608, 0.1329733, 0, 1, 0.1882353, 1,
-0.3698983, -0.4126146, -0.1304108, 0, 1, 0.1960784, 1,
-0.3692406, -1.032741, -3.829686, 0, 1, 0.2039216, 1,
-0.3677993, 0.5672699, 2.188236, 0, 1, 0.2078431, 1,
-0.3646522, 0.4411142, -1.21099, 0, 1, 0.2156863, 1,
-0.3638, 0.9314789, -0.396941, 0, 1, 0.2196078, 1,
-0.362309, 1.441706, -0.8838627, 0, 1, 0.227451, 1,
-0.3606406, -0.8570212, -4.671419, 0, 1, 0.2313726, 1,
-0.3589245, -2.39483, -4.069214, 0, 1, 0.2392157, 1,
-0.3582722, -0.3818039, -4.111414, 0, 1, 0.2431373, 1,
-0.3550829, 1.25288, -1.802813, 0, 1, 0.2509804, 1,
-0.3498712, -1.71878, -3.255843, 0, 1, 0.254902, 1,
-0.3381477, -0.4759502, -3.316333, 0, 1, 0.2627451, 1,
-0.333456, 2.184638, -0.3899092, 0, 1, 0.2666667, 1,
-0.332437, 0.8033451, 1.099947, 0, 1, 0.2745098, 1,
-0.3310302, -0.3316384, 0.0329487, 0, 1, 0.2784314, 1,
-0.3201786, 0.3170848, -0.9370394, 0, 1, 0.2862745, 1,
-0.3197018, 1.70398, -0.06933005, 0, 1, 0.2901961, 1,
-0.318855, 1.483968, -0.7182432, 0, 1, 0.2980392, 1,
-0.312456, 0.3152214, -1.3577, 0, 1, 0.3058824, 1,
-0.3111326, -0.6002508, -1.929636, 0, 1, 0.3098039, 1,
-0.3073055, -1.251842, -2.27702, 0, 1, 0.3176471, 1,
-0.3063139, -1.019007, -2.449081, 0, 1, 0.3215686, 1,
-0.3051676, 0.2804942, 0.8331348, 0, 1, 0.3294118, 1,
-0.3044248, 0.3930755, -0.5248707, 0, 1, 0.3333333, 1,
-0.2939676, 0.8692213, -0.1228896, 0, 1, 0.3411765, 1,
-0.2922664, 0.1549565, -1.03874, 0, 1, 0.345098, 1,
-0.2916468, 1.045255, -0.3592184, 0, 1, 0.3529412, 1,
-0.2831454, 2.001365, -1.243685, 0, 1, 0.3568628, 1,
-0.2822959, -1.155554, -3.847046, 0, 1, 0.3647059, 1,
-0.2786587, 0.9040037, -0.01627677, 0, 1, 0.3686275, 1,
-0.2682938, -1.420526, -3.353042, 0, 1, 0.3764706, 1,
-0.2668047, -1.110318, -1.950292, 0, 1, 0.3803922, 1,
-0.2648404, 0.7603477, 1.009948, 0, 1, 0.3882353, 1,
-0.2628652, -0.2842498, -1.928041, 0, 1, 0.3921569, 1,
-0.2599937, 0.8864236, 0.2747543, 0, 1, 0.4, 1,
-0.2593209, 3.177332, 0.5774881, 0, 1, 0.4078431, 1,
-0.25767, 1.676313, 0.8480992, 0, 1, 0.4117647, 1,
-0.2533744, -0.292078, -2.042502, 0, 1, 0.4196078, 1,
-0.2496846, -1.415284, -1.805, 0, 1, 0.4235294, 1,
-0.2477047, -1.182412, -3.853876, 0, 1, 0.4313726, 1,
-0.2435583, 0.5747026, -1.674715, 0, 1, 0.4352941, 1,
-0.238658, 0.5984345, -1.21576, 0, 1, 0.4431373, 1,
-0.2385342, 0.8422397, 0.2472263, 0, 1, 0.4470588, 1,
-0.2382316, -1.162596, -2.348079, 0, 1, 0.454902, 1,
-0.2365143, 0.7057272, 0.6482362, 0, 1, 0.4588235, 1,
-0.2327993, 0.7454972, 2.45958, 0, 1, 0.4666667, 1,
-0.230778, 0.1940583, -0.3840473, 0, 1, 0.4705882, 1,
-0.2280068, -0.3399699, -1.816187, 0, 1, 0.4784314, 1,
-0.2238653, 0.3798124, -0.182056, 0, 1, 0.4823529, 1,
-0.2164322, -0.3771541, -2.998409, 0, 1, 0.4901961, 1,
-0.2161771, -0.8510564, -2.407961, 0, 1, 0.4941176, 1,
-0.2143449, -0.01411368, -2.360003, 0, 1, 0.5019608, 1,
-0.2088495, 0.7148967, 1.405498, 0, 1, 0.509804, 1,
-0.2053643, -0.5703629, -4.143544, 0, 1, 0.5137255, 1,
-0.2053509, 0.3699776, -1.868729, 0, 1, 0.5215687, 1,
-0.199333, 1.034485, -0.2810104, 0, 1, 0.5254902, 1,
-0.1978011, -0.6742364, -3.192078, 0, 1, 0.5333334, 1,
-0.1908082, -0.5007499, -2.263961, 0, 1, 0.5372549, 1,
-0.1894258, 0.4256962, 0.08985747, 0, 1, 0.5450981, 1,
-0.188836, 0.323643, -1.599048, 0, 1, 0.5490196, 1,
-0.1870312, 0.9333751, 1.116005, 0, 1, 0.5568628, 1,
-0.1862816, 0.1907052, 0.2080704, 0, 1, 0.5607843, 1,
-0.1842848, -0.1589572, -2.745064, 0, 1, 0.5686275, 1,
-0.1830504, -0.1175549, -1.840604, 0, 1, 0.572549, 1,
-0.1826743, -0.5171914, -1.096488, 0, 1, 0.5803922, 1,
-0.1812961, -0.5746996, -1.916043, 0, 1, 0.5843138, 1,
-0.1791459, 1.155874, 0.5881342, 0, 1, 0.5921569, 1,
-0.1786732, -0.9303739, -2.918505, 0, 1, 0.5960785, 1,
-0.1767552, 2.15436, 0.4602149, 0, 1, 0.6039216, 1,
-0.1752127, -0.4082977, -2.543493, 0, 1, 0.6117647, 1,
-0.1688903, -0.7735984, -4.814155, 0, 1, 0.6156863, 1,
-0.1678598, -1.110657, -3.652724, 0, 1, 0.6235294, 1,
-0.1632846, -1.058881, -3.607784, 0, 1, 0.627451, 1,
-0.1539996, -1.62095, -3.339055, 0, 1, 0.6352941, 1,
-0.1530292, 0.9657065, -0.1625353, 0, 1, 0.6392157, 1,
-0.1529089, -1.364799, -3.296237, 0, 1, 0.6470588, 1,
-0.1496304, -0.03688926, -1.236589, 0, 1, 0.6509804, 1,
-0.1366647, -0.1410775, -3.178543, 0, 1, 0.6588235, 1,
-0.1360959, -1.732348, -3.851672, 0, 1, 0.6627451, 1,
-0.1264539, 0.1708672, -0.2787083, 0, 1, 0.6705883, 1,
-0.1243844, 0.5942793, -0.6148152, 0, 1, 0.6745098, 1,
-0.110352, -0.5035617, -3.799145, 0, 1, 0.682353, 1,
-0.1096621, -1.554876, -3.608619, 0, 1, 0.6862745, 1,
-0.1070798, 0.8751013, 1.839761, 0, 1, 0.6941177, 1,
-0.1069383, -0.1161239, -1.334215, 0, 1, 0.7019608, 1,
-0.1056828, -0.1714295, -2.439705, 0, 1, 0.7058824, 1,
-0.1050643, -0.5379527, -3.633759, 0, 1, 0.7137255, 1,
-0.1037964, -0.1581966, -2.282252, 0, 1, 0.7176471, 1,
-0.1001586, 0.8238057, 0.524445, 0, 1, 0.7254902, 1,
-0.09982074, 0.7677482, -0.9083642, 0, 1, 0.7294118, 1,
-0.09281466, 0.6226478, 2.114278, 0, 1, 0.7372549, 1,
-0.09007543, -0.3388489, -0.5512169, 0, 1, 0.7411765, 1,
-0.08941016, 0.3598818, -0.7682241, 0, 1, 0.7490196, 1,
-0.08768575, -0.5489984, -2.616693, 0, 1, 0.7529412, 1,
-0.08384664, 0.7496982, 0.02840993, 0, 1, 0.7607843, 1,
-0.0794289, -0.8332863, -3.966518, 0, 1, 0.7647059, 1,
-0.07833645, 0.09311806, -0.9144985, 0, 1, 0.772549, 1,
-0.0759525, 0.197171, -2.542733, 0, 1, 0.7764706, 1,
-0.07448091, -1.29169, -2.513404, 0, 1, 0.7843137, 1,
-0.07228871, 0.1873516, -0.2689295, 0, 1, 0.7882353, 1,
-0.07126564, -0.2357329, -3.094604, 0, 1, 0.7960784, 1,
-0.06819256, 0.1884639, -0.8751789, 0, 1, 0.8039216, 1,
-0.0678004, -0.4240946, -4.315343, 0, 1, 0.8078431, 1,
-0.06725231, 0.4564699, -0.3221664, 0, 1, 0.8156863, 1,
-0.06499549, 0.901085, 0.5599836, 0, 1, 0.8196079, 1,
-0.05648296, -0.0180175, -0.8132613, 0, 1, 0.827451, 1,
-0.0564759, 1.590722, -2.201802, 0, 1, 0.8313726, 1,
-0.05323458, 0.8277788, -1.262168, 0, 1, 0.8392157, 1,
-0.05053269, 1.291396, -0.01381191, 0, 1, 0.8431373, 1,
-0.0478039, 0.8689222, -0.1367989, 0, 1, 0.8509804, 1,
-0.04724654, -0.3104366, -0.9265826, 0, 1, 0.854902, 1,
-0.04657954, 0.9181833, 0.7562585, 0, 1, 0.8627451, 1,
-0.04165397, 0.7447687, 0.1525631, 0, 1, 0.8666667, 1,
-0.04000476, -0.3930112, -3.851928, 0, 1, 0.8745098, 1,
-0.03606852, 0.2778617, -1.037077, 0, 1, 0.8784314, 1,
-0.03510714, 0.4686925, -1.140134, 0, 1, 0.8862745, 1,
-0.03066957, -2.184012, -3.78933, 0, 1, 0.8901961, 1,
-0.02657118, 1.824835, 0.6789025, 0, 1, 0.8980392, 1,
-0.0231771, 0.2068623, 0.3475565, 0, 1, 0.9058824, 1,
-0.02133641, -0.01972005, -1.763813, 0, 1, 0.9098039, 1,
-0.01928161, -0.03002063, -3.986009, 0, 1, 0.9176471, 1,
-0.01412774, 0.4025319, -0.2710995, 0, 1, 0.9215686, 1,
-0.01105779, 1.508115, -0.7421001, 0, 1, 0.9294118, 1,
-0.005950763, -0.922196, -2.81408, 0, 1, 0.9333333, 1,
0.004093304, -1.481722, 2.583052, 0, 1, 0.9411765, 1,
0.01084877, 0.4964707, -0.6146327, 0, 1, 0.945098, 1,
0.01971305, 0.5323232, 1.912696, 0, 1, 0.9529412, 1,
0.0217361, 1.55893, 1.435483, 0, 1, 0.9568627, 1,
0.02525477, -0.5250117, 3.077694, 0, 1, 0.9647059, 1,
0.03194275, -0.7806172, 4.490962, 0, 1, 0.9686275, 1,
0.0336632, 0.2864357, -0.07592147, 0, 1, 0.9764706, 1,
0.03468318, -1.32648, 3.016552, 0, 1, 0.9803922, 1,
0.03491971, -0.2064876, 2.77145, 0, 1, 0.9882353, 1,
0.03763748, -0.3732159, 3.570933, 0, 1, 0.9921569, 1,
0.03893251, -0.4062395, 2.320687, 0, 1, 1, 1,
0.04018056, 0.7166271, -0.5917355, 0, 0.9921569, 1, 1,
0.04177874, 0.98108, 0.02662432, 0, 0.9882353, 1, 1,
0.04996707, 1.663237, 0.4024889, 0, 0.9803922, 1, 1,
0.05028717, 0.5193946, 0.05970944, 0, 0.9764706, 1, 1,
0.0513966, 0.4858886, 0.760885, 0, 0.9686275, 1, 1,
0.05426973, -1.043619, 1.844499, 0, 0.9647059, 1, 1,
0.05851753, 1.623138, -2.307848, 0, 0.9568627, 1, 1,
0.06275518, 0.5486786, -0.833299, 0, 0.9529412, 1, 1,
0.06352457, 1.223049, 0.6840972, 0, 0.945098, 1, 1,
0.06806158, -0.1743562, 1.088975, 0, 0.9411765, 1, 1,
0.06957229, 1.460129, 0.8026565, 0, 0.9333333, 1, 1,
0.07438415, -0.8721818, 3.063185, 0, 0.9294118, 1, 1,
0.07732417, -0.5372776, 2.049097, 0, 0.9215686, 1, 1,
0.07751417, 0.65711, 0.2137677, 0, 0.9176471, 1, 1,
0.07940263, -0.5234696, 4.768198, 0, 0.9098039, 1, 1,
0.08033817, -0.5763035, 2.838749, 0, 0.9058824, 1, 1,
0.08841766, 0.3428698, -0.2123297, 0, 0.8980392, 1, 1,
0.09071603, 1.805963, -1.121884, 0, 0.8901961, 1, 1,
0.09743692, -2.559064, 2.013525, 0, 0.8862745, 1, 1,
0.09859316, 0.2658103, 0.7777249, 0, 0.8784314, 1, 1,
0.1014752, -0.2273592, 1.88485, 0, 0.8745098, 1, 1,
0.1033746, 0.678637, -1.801176, 0, 0.8666667, 1, 1,
0.1036619, 0.02675284, 0.4358476, 0, 0.8627451, 1, 1,
0.1067981, 1.461313, 1.225367, 0, 0.854902, 1, 1,
0.1080792, -0.9773338, 2.322615, 0, 0.8509804, 1, 1,
0.1087535, -0.6618457, 4.300414, 0, 0.8431373, 1, 1,
0.112411, 0.739175, -2.275649, 0, 0.8392157, 1, 1,
0.1128621, -1.539278, 4.068127, 0, 0.8313726, 1, 1,
0.1141263, 0.5719597, 1.979159, 0, 0.827451, 1, 1,
0.1199496, 2.216769, 0.9752699, 0, 0.8196079, 1, 1,
0.123279, -0.4799546, 2.211579, 0, 0.8156863, 1, 1,
0.1291761, -1.158402, 2.326756, 0, 0.8078431, 1, 1,
0.1306963, 0.3231432, 1.312125, 0, 0.8039216, 1, 1,
0.1322916, -1.770199, 4.124435, 0, 0.7960784, 1, 1,
0.1330933, 1.333812, 0.6831144, 0, 0.7882353, 1, 1,
0.1345129, -1.228242, 3.43261, 0, 0.7843137, 1, 1,
0.1387889, 2.087994, 0.1774699, 0, 0.7764706, 1, 1,
0.1437368, -0.0390434, 1.952565, 0, 0.772549, 1, 1,
0.1447118, 0.5991105, 0.1366713, 0, 0.7647059, 1, 1,
0.1455498, 1.459562, 0.4227809, 0, 0.7607843, 1, 1,
0.1487283, 1.071447, -0.5661711, 0, 0.7529412, 1, 1,
0.1513078, 0.2451674, 0.1070674, 0, 0.7490196, 1, 1,
0.1564776, -1.144622, 3.684222, 0, 0.7411765, 1, 1,
0.15708, 0.5659206, -0.8457122, 0, 0.7372549, 1, 1,
0.1632723, -1.156041, 3.075772, 0, 0.7294118, 1, 1,
0.1636122, 0.04003229, 1.583331, 0, 0.7254902, 1, 1,
0.168973, 1.033027, 0.7826765, 0, 0.7176471, 1, 1,
0.1713018, 1.028242, 0.6719851, 0, 0.7137255, 1, 1,
0.1726913, -0.8777289, 1.784701, 0, 0.7058824, 1, 1,
0.1734551, -1.259577, 3.866925, 0, 0.6980392, 1, 1,
0.174859, 1.40451, -0.4257004, 0, 0.6941177, 1, 1,
0.1764603, -1.614058, 3.49391, 0, 0.6862745, 1, 1,
0.178874, -0.6201639, 4.023109, 0, 0.682353, 1, 1,
0.1865867, 0.2342822, -0.4191275, 0, 0.6745098, 1, 1,
0.1881614, 0.664485, 0.4842727, 0, 0.6705883, 1, 1,
0.1887334, -0.4840904, 4.273016, 0, 0.6627451, 1, 1,
0.1894957, 0.4512291, -0.4818251, 0, 0.6588235, 1, 1,
0.1917305, 0.04781481, 1.988861, 0, 0.6509804, 1, 1,
0.1917565, 1.588046, 0.1748546, 0, 0.6470588, 1, 1,
0.1919507, -0.1099164, 1.618673, 0, 0.6392157, 1, 1,
0.1928985, 3.088663, 0.7135448, 0, 0.6352941, 1, 1,
0.1952154, -0.3543111, 1.025381, 0, 0.627451, 1, 1,
0.195697, 0.5936877, 0.6948733, 0, 0.6235294, 1, 1,
0.1975813, 0.1356367, -0.07471001, 0, 0.6156863, 1, 1,
0.2021022, -1.573208, 3.011513, 0, 0.6117647, 1, 1,
0.2021296, 0.8809677, 1.504643, 0, 0.6039216, 1, 1,
0.2031281, 0.1352541, -0.483085, 0, 0.5960785, 1, 1,
0.2093868, 0.1031104, 0.6174459, 0, 0.5921569, 1, 1,
0.2126392, -0.8230404, 2.08598, 0, 0.5843138, 1, 1,
0.2127754, -0.5742249, 1.444695, 0, 0.5803922, 1, 1,
0.2130045, 1.062436, -0.2704654, 0, 0.572549, 1, 1,
0.2137586, 0.2333512, 0.6063267, 0, 0.5686275, 1, 1,
0.2140367, 0.3013759, 1.050375, 0, 0.5607843, 1, 1,
0.2163201, -0.4331871, 3.568888, 0, 0.5568628, 1, 1,
0.2165926, -0.4061794, 2.711516, 0, 0.5490196, 1, 1,
0.2173697, 0.6530371, 0.4712832, 0, 0.5450981, 1, 1,
0.2203522, 0.3099325, 0.8130916, 0, 0.5372549, 1, 1,
0.2209259, 1.123778, 1.353089, 0, 0.5333334, 1, 1,
0.2213482, -0.1206599, 1.66199, 0, 0.5254902, 1, 1,
0.2218217, -0.296673, 2.164998, 0, 0.5215687, 1, 1,
0.2218602, 0.03548762, 1.893592, 0, 0.5137255, 1, 1,
0.2234221, -1.206491, 5.14034, 0, 0.509804, 1, 1,
0.2246839, -0.1385446, 2.30728, 0, 0.5019608, 1, 1,
0.225831, 0.5597408, -0.1839579, 0, 0.4941176, 1, 1,
0.2264429, -1.424534, 3.447179, 0, 0.4901961, 1, 1,
0.2386073, -0.3132373, -0.595255, 0, 0.4823529, 1, 1,
0.23973, 1.726688, -0.8734892, 0, 0.4784314, 1, 1,
0.2424206, -0.5214829, 1.497389, 0, 0.4705882, 1, 1,
0.2434035, 1.478677, 0.4696145, 0, 0.4666667, 1, 1,
0.2467517, -0.9817256, 3.155497, 0, 0.4588235, 1, 1,
0.2486867, -0.252343, 1.426032, 0, 0.454902, 1, 1,
0.2580548, 0.07182491, 0.4896348, 0, 0.4470588, 1, 1,
0.2678123, -0.3370617, 3.661917, 0, 0.4431373, 1, 1,
0.2694238, -0.3132996, 2.926278, 0, 0.4352941, 1, 1,
0.2739174, -0.6319094, 0.9931973, 0, 0.4313726, 1, 1,
0.2756438, 0.6663538, -0.1962823, 0, 0.4235294, 1, 1,
0.2763663, 0.9992701, 0.7635102, 0, 0.4196078, 1, 1,
0.2784878, 0.139727, -0.9923696, 0, 0.4117647, 1, 1,
0.2793406, -1.397218, 4.26778, 0, 0.4078431, 1, 1,
0.282101, 0.7668582, 1.408825, 0, 0.4, 1, 1,
0.2827615, -0.4068242, 2.504715, 0, 0.3921569, 1, 1,
0.2831861, 1.482637, 1.771059, 0, 0.3882353, 1, 1,
0.2836871, 0.5952321, 0.9895651, 0, 0.3803922, 1, 1,
0.2869949, 2.486573, -0.3745589, 0, 0.3764706, 1, 1,
0.2891552, 0.02129389, 1.490526, 0, 0.3686275, 1, 1,
0.2901212, -0.703897, 4.792111, 0, 0.3647059, 1, 1,
0.2908343, -0.1582341, 1.840537, 0, 0.3568628, 1, 1,
0.2915039, -0.1510633, -0.01510066, 0, 0.3529412, 1, 1,
0.2921114, -0.7986109, 3.290739, 0, 0.345098, 1, 1,
0.2963274, -0.2155962, 2.793772, 0, 0.3411765, 1, 1,
0.2978611, 1.375857, 0.5070303, 0, 0.3333333, 1, 1,
0.2984339, -0.8039619, 2.487947, 0, 0.3294118, 1, 1,
0.2987214, 0.8807111, 0.1526945, 0, 0.3215686, 1, 1,
0.3003361, -2.378452, 3.490458, 0, 0.3176471, 1, 1,
0.3028133, -0.3633476, 1.992274, 0, 0.3098039, 1, 1,
0.3078152, 1.07923, -0.1594508, 0, 0.3058824, 1, 1,
0.3082386, 0.7344804, 0.7116479, 0, 0.2980392, 1, 1,
0.3136938, -0.491104, 3.430909, 0, 0.2901961, 1, 1,
0.3153095, -0.1454382, 3.399568, 0, 0.2862745, 1, 1,
0.317751, -0.8448428, 5.47433, 0, 0.2784314, 1, 1,
0.3211347, -0.6773749, 3.930152, 0, 0.2745098, 1, 1,
0.3216784, 0.271694, 1.481312, 0, 0.2666667, 1, 1,
0.3272048, -0.629218, 4.36541, 0, 0.2627451, 1, 1,
0.32845, -1.12323, 4.185341, 0, 0.254902, 1, 1,
0.328779, -0.8049179, 2.443438, 0, 0.2509804, 1, 1,
0.3294294, -0.06693079, -0.275128, 0, 0.2431373, 1, 1,
0.3312667, -1.08537, 2.154667, 0, 0.2392157, 1, 1,
0.3355116, 0.5105724, 0.4935363, 0, 0.2313726, 1, 1,
0.3358336, -0.2573215, 2.320725, 0, 0.227451, 1, 1,
0.3374738, 0.5730753, 1.254929, 0, 0.2196078, 1, 1,
0.3437501, -0.2663746, 2.582618, 0, 0.2156863, 1, 1,
0.3463491, 0.5784196, 0.5857273, 0, 0.2078431, 1, 1,
0.3476948, -0.3681284, 4.818821, 0, 0.2039216, 1, 1,
0.3505304, -2.967956, 3.140659, 0, 0.1960784, 1, 1,
0.3528259, -0.4034298, 1.37141, 0, 0.1882353, 1, 1,
0.3553694, 0.1222571, 0.7111866, 0, 0.1843137, 1, 1,
0.3571069, 0.4377849, 1.667511, 0, 0.1764706, 1, 1,
0.3586192, -1.236986, 3.488015, 0, 0.172549, 1, 1,
0.3629785, 0.07451126, 1.509645, 0, 0.1647059, 1, 1,
0.3636038, -1.03392, 2.916658, 0, 0.1607843, 1, 1,
0.3656538, 0.04819075, 1.278291, 0, 0.1529412, 1, 1,
0.3669758, 0.2871778, 0.4048177, 0, 0.1490196, 1, 1,
0.367321, 0.7253776, -0.2326795, 0, 0.1411765, 1, 1,
0.3708694, -2.972163, 4.586293, 0, 0.1372549, 1, 1,
0.3739878, 0.7994666, -0.2164462, 0, 0.1294118, 1, 1,
0.375292, 0.5184747, 0.3726109, 0, 0.1254902, 1, 1,
0.3756048, 1.521986, 0.5737, 0, 0.1176471, 1, 1,
0.3776689, -0.7244778, 1.738411, 0, 0.1137255, 1, 1,
0.3820328, -0.2319896, 2.149451, 0, 0.1058824, 1, 1,
0.3820941, 0.06764672, 1.301243, 0, 0.09803922, 1, 1,
0.3827329, -0.636429, 1.260354, 0, 0.09411765, 1, 1,
0.3838704, 0.68779, -0.7699758, 0, 0.08627451, 1, 1,
0.3851602, 1.616343, -0.9197177, 0, 0.08235294, 1, 1,
0.388464, 1.240988, 0.118251, 0, 0.07450981, 1, 1,
0.3920413, 0.3181542, 0.3674852, 0, 0.07058824, 1, 1,
0.3931655, 0.648239, 1.594542, 0, 0.0627451, 1, 1,
0.4007711, 0.4454665, -1.900744, 0, 0.05882353, 1, 1,
0.4058748, -0.2551221, 1.442046, 0, 0.05098039, 1, 1,
0.4126149, 1.348487, 1.623845, 0, 0.04705882, 1, 1,
0.4130711, 1.236064, 1.262069, 0, 0.03921569, 1, 1,
0.4150755, 0.8527456, 0.2128928, 0, 0.03529412, 1, 1,
0.4223389, 0.08483589, -2.067846, 0, 0.02745098, 1, 1,
0.424732, -0.8831103, 2.756407, 0, 0.02352941, 1, 1,
0.4257501, 1.759396, -0.7241747, 0, 0.01568628, 1, 1,
0.4291774, 0.6010725, 2.428285, 0, 0.01176471, 1, 1,
0.4294537, 0.09068538, 1.055226, 0, 0.003921569, 1, 1,
0.4312559, -0.4739859, 3.263569, 0.003921569, 0, 1, 1,
0.4317057, -2.529307, 1.797422, 0.007843138, 0, 1, 1,
0.4335552, 0.9482675, 0.37851, 0.01568628, 0, 1, 1,
0.4384837, -0.289796, 3.412085, 0.01960784, 0, 1, 1,
0.4391084, 0.6975691, 0.6118465, 0.02745098, 0, 1, 1,
0.440174, -0.09008013, 0.3818574, 0.03137255, 0, 1, 1,
0.4417749, 0.2462551, 1.43571, 0.03921569, 0, 1, 1,
0.4433901, -1.712598, 1.977404, 0.04313726, 0, 1, 1,
0.4457411, -1.115631, 2.608294, 0.05098039, 0, 1, 1,
0.4508433, 1.837483, -0.5351229, 0.05490196, 0, 1, 1,
0.4529853, -0.7827227, 3.249355, 0.0627451, 0, 1, 1,
0.4596246, 0.5192894, -0.5774666, 0.06666667, 0, 1, 1,
0.4596574, -0.9627556, 0.6003545, 0.07450981, 0, 1, 1,
0.4608134, 0.6987805, 1.163216, 0.07843138, 0, 1, 1,
0.4618869, -0.7604052, 2.963324, 0.08627451, 0, 1, 1,
0.4669816, -1.180267, 2.615934, 0.09019608, 0, 1, 1,
0.4729581, -1.747518, 3.250749, 0.09803922, 0, 1, 1,
0.4736353, -0.563675, 3.299789, 0.1058824, 0, 1, 1,
0.4749516, 0.06531557, 1.608215, 0.1098039, 0, 1, 1,
0.4785896, -0.5573293, 1.735634, 0.1176471, 0, 1, 1,
0.4794615, 0.2941112, 0.94573, 0.1215686, 0, 1, 1,
0.4849513, -0.05295006, 2.817635, 0.1294118, 0, 1, 1,
0.4851146, -0.3870368, 0.7909145, 0.1333333, 0, 1, 1,
0.485145, -0.9388953, 1.851477, 0.1411765, 0, 1, 1,
0.4878488, 0.5689002, 1.457782, 0.145098, 0, 1, 1,
0.4895794, -0.2889578, 1.67254, 0.1529412, 0, 1, 1,
0.4903041, -0.6594456, 1.73305, 0.1568628, 0, 1, 1,
0.4920653, 0.1297459, 1.866567, 0.1647059, 0, 1, 1,
0.4963817, 0.8297347, -0.006218699, 0.1686275, 0, 1, 1,
0.4969278, 0.8032153, -0.388255, 0.1764706, 0, 1, 1,
0.5019606, 0.4363182, 0.1060377, 0.1803922, 0, 1, 1,
0.5067076, -1.353469, 4.45056, 0.1882353, 0, 1, 1,
0.5101263, -1.512941, 3.022298, 0.1921569, 0, 1, 1,
0.5126877, -0.5401408, 4.202313, 0.2, 0, 1, 1,
0.5187287, -0.7235007, 2.063311, 0.2078431, 0, 1, 1,
0.5219039, -0.7114627, 2.298686, 0.2117647, 0, 1, 1,
0.5225685, 0.4535656, -0.6528786, 0.2196078, 0, 1, 1,
0.5238148, 0.2505332, 0.6499401, 0.2235294, 0, 1, 1,
0.5276384, -1.589781, 3.944944, 0.2313726, 0, 1, 1,
0.5331212, 1.334971, 0.4336222, 0.2352941, 0, 1, 1,
0.5333129, 0.1487745, 2.311383, 0.2431373, 0, 1, 1,
0.5335154, -0.4355283, 1.519832, 0.2470588, 0, 1, 1,
0.5367905, -0.635769, 2.933872, 0.254902, 0, 1, 1,
0.5391653, 0.3521641, 1.1367, 0.2588235, 0, 1, 1,
0.5400909, 0.2223223, 1.497475, 0.2666667, 0, 1, 1,
0.545268, 0.5575232, 1.286491, 0.2705882, 0, 1, 1,
0.5504104, 0.7757641, 0.07003858, 0.2784314, 0, 1, 1,
0.5507737, 1.169636, 0.9719095, 0.282353, 0, 1, 1,
0.553405, 0.764115, -2.227828, 0.2901961, 0, 1, 1,
0.5616801, -0.5264066, 2.732367, 0.2941177, 0, 1, 1,
0.5621647, 0.155975, 1.580613, 0.3019608, 0, 1, 1,
0.5648273, 0.07369678, 2.007292, 0.3098039, 0, 1, 1,
0.5670146, -0.7076957, 3.052731, 0.3137255, 0, 1, 1,
0.5692128, 0.5310802, 1.130926, 0.3215686, 0, 1, 1,
0.5733816, 0.1882815, 0.4615479, 0.3254902, 0, 1, 1,
0.5737486, 0.1491259, 0.3293201, 0.3333333, 0, 1, 1,
0.5773262, -0.3424252, -0.09233534, 0.3372549, 0, 1, 1,
0.5806678, -1.524203, 2.660736, 0.345098, 0, 1, 1,
0.5836481, 1.079233, 0.4825387, 0.3490196, 0, 1, 1,
0.5891726, -0.4320223, 2.374406, 0.3568628, 0, 1, 1,
0.5912223, -1.339959, 0.8516502, 0.3607843, 0, 1, 1,
0.5937457, 0.3369427, 0.6406951, 0.3686275, 0, 1, 1,
0.5985439, -1.243946, 2.381169, 0.372549, 0, 1, 1,
0.5997491, 1.6773, 0.5718035, 0.3803922, 0, 1, 1,
0.6115977, 1.719262, 1.418087, 0.3843137, 0, 1, 1,
0.6158094, -0.1869546, 2.376336, 0.3921569, 0, 1, 1,
0.6177168, 0.8282718, 0.8998771, 0.3960784, 0, 1, 1,
0.6190102, -1.697458, 2.80719, 0.4039216, 0, 1, 1,
0.6221107, -1.762811, 3.78324, 0.4117647, 0, 1, 1,
0.6283334, 0.7968397, -0.2852875, 0.4156863, 0, 1, 1,
0.6285936, 0.4619373, 0.5469451, 0.4235294, 0, 1, 1,
0.6293071, -0.3495425, 1.418546, 0.427451, 0, 1, 1,
0.6312085, 0.9188974, -0.2786397, 0.4352941, 0, 1, 1,
0.642726, 0.1282932, 1.86284, 0.4392157, 0, 1, 1,
0.6461799, -1.102265, 2.726279, 0.4470588, 0, 1, 1,
0.6463755, -0.3404723, 2.800952, 0.4509804, 0, 1, 1,
0.6488608, 0.4412159, 1.443185, 0.4588235, 0, 1, 1,
0.6511714, 0.5139181, 1.46662, 0.4627451, 0, 1, 1,
0.6532185, -0.8279368, 2.012666, 0.4705882, 0, 1, 1,
0.6537554, -0.7797665, 1.276378, 0.4745098, 0, 1, 1,
0.6558456, -0.2779562, 1.928618, 0.4823529, 0, 1, 1,
0.6619388, 0.004080158, 1.347892, 0.4862745, 0, 1, 1,
0.6718021, -0.1620883, 4.049545, 0.4941176, 0, 1, 1,
0.6742138, 0.3593612, 1.047225, 0.5019608, 0, 1, 1,
0.6776346, 0.6713188, 0.9631813, 0.5058824, 0, 1, 1,
0.6811386, 0.02555011, 0.4809157, 0.5137255, 0, 1, 1,
0.6850495, 0.953324, 1.125827, 0.5176471, 0, 1, 1,
0.68936, -0.05598177, 2.520892, 0.5254902, 0, 1, 1,
0.6922776, 0.7461368, 1.263093, 0.5294118, 0, 1, 1,
0.6945534, -1.022986, 3.288073, 0.5372549, 0, 1, 1,
0.6980755, 0.522217, 1.302086, 0.5411765, 0, 1, 1,
0.7022185, 0.6593794, 1.946575, 0.5490196, 0, 1, 1,
0.7050497, 0.2389603, 1.771633, 0.5529412, 0, 1, 1,
0.7121836, -1.275155, 2.58668, 0.5607843, 0, 1, 1,
0.7125333, -1.184759, 2.319327, 0.5647059, 0, 1, 1,
0.71723, -0.36817, 1.491779, 0.572549, 0, 1, 1,
0.718133, 0.06527188, 0.8645908, 0.5764706, 0, 1, 1,
0.7190605, 0.4613315, -0.1662363, 0.5843138, 0, 1, 1,
0.7226037, -0.3865899, 1.58351, 0.5882353, 0, 1, 1,
0.7240936, 0.0272276, 2.269865, 0.5960785, 0, 1, 1,
0.7275111, 0.7611892, 0.2937885, 0.6039216, 0, 1, 1,
0.7338974, 0.5419475, 2.519719, 0.6078432, 0, 1, 1,
0.7372652, 1.952392, 0.7861469, 0.6156863, 0, 1, 1,
0.7373021, 0.2880984, 1.689425, 0.6196079, 0, 1, 1,
0.7382638, 1.539546, -0.4148471, 0.627451, 0, 1, 1,
0.7443272, 1.355162, 0.5176178, 0.6313726, 0, 1, 1,
0.7473303, 1.821504, 0.4817457, 0.6392157, 0, 1, 1,
0.7478001, 0.1544949, 0.356236, 0.6431373, 0, 1, 1,
0.7484378, -0.03244909, 2.465271, 0.6509804, 0, 1, 1,
0.7546389, -0.1575054, 1.089191, 0.654902, 0, 1, 1,
0.7556014, 0.5982253, 2.598741, 0.6627451, 0, 1, 1,
0.7561483, -0.3866131, 1.113302, 0.6666667, 0, 1, 1,
0.7578236, 1.729266, 0.006518967, 0.6745098, 0, 1, 1,
0.7589833, -0.3596649, 2.917499, 0.6784314, 0, 1, 1,
0.7609365, 0.5270624, -0.2837356, 0.6862745, 0, 1, 1,
0.765292, -0.01970602, 1.088571, 0.6901961, 0, 1, 1,
0.7705005, 1.311693, 0.1861041, 0.6980392, 0, 1, 1,
0.7738609, 1.09397, 1.421795, 0.7058824, 0, 1, 1,
0.776118, 1.251566, 0.8786653, 0.7098039, 0, 1, 1,
0.7887324, 0.8459557, -0.7966869, 0.7176471, 0, 1, 1,
0.7999209, -2.398662, 1.942502, 0.7215686, 0, 1, 1,
0.8014936, -0.2585338, 2.081402, 0.7294118, 0, 1, 1,
0.8024254, 0.1593055, 2.533957, 0.7333333, 0, 1, 1,
0.8036104, -0.008259149, 0.6109707, 0.7411765, 0, 1, 1,
0.8081021, -0.7301424, 4.028738, 0.7450981, 0, 1, 1,
0.8088349, -0.4441969, 2.883271, 0.7529412, 0, 1, 1,
0.812564, 1.604901, -0.3186478, 0.7568628, 0, 1, 1,
0.8140705, 1.02589, 1.220065, 0.7647059, 0, 1, 1,
0.8160323, 1.168523, 1.399845, 0.7686275, 0, 1, 1,
0.8165469, 0.01609636, 2.52687, 0.7764706, 0, 1, 1,
0.8186316, 1.03717, 0.7893394, 0.7803922, 0, 1, 1,
0.8190987, 1.680516, 0.4863476, 0.7882353, 0, 1, 1,
0.8194948, -1.839124, 1.802583, 0.7921569, 0, 1, 1,
0.8217073, -0.3260232, 1.225822, 0.8, 0, 1, 1,
0.8399022, 0.2850804, 1.265887, 0.8078431, 0, 1, 1,
0.8451701, 1.062428, 0.7417675, 0.8117647, 0, 1, 1,
0.8465885, 1.115285, -0.006545933, 0.8196079, 0, 1, 1,
0.8480756, 0.4704578, 0.647019, 0.8235294, 0, 1, 1,
0.8530095, 1.167085, 0.6280509, 0.8313726, 0, 1, 1,
0.8564526, -0.8436244, 2.834483, 0.8352941, 0, 1, 1,
0.8578922, -0.1040296, 1.127224, 0.8431373, 0, 1, 1,
0.8694509, -0.7155734, 3.629729, 0.8470588, 0, 1, 1,
0.8878292, -0.3020662, 2.384344, 0.854902, 0, 1, 1,
0.8921252, -1.43283, 4.109914, 0.8588235, 0, 1, 1,
0.8950782, -1.192204, 2.795414, 0.8666667, 0, 1, 1,
0.8997908, 0.9925714, 1.317028, 0.8705882, 0, 1, 1,
0.9002285, -0.1307766, 1.645883, 0.8784314, 0, 1, 1,
0.901188, -1.425645, 3.89982, 0.8823529, 0, 1, 1,
0.9104017, -1.171692, 2.871339, 0.8901961, 0, 1, 1,
0.9159467, 0.6486718, 1.901231, 0.8941177, 0, 1, 1,
0.920256, -1.469954, 2.924598, 0.9019608, 0, 1, 1,
0.9206776, 0.009268359, 2.064764, 0.9098039, 0, 1, 1,
0.9259493, -1.428021, 2.623072, 0.9137255, 0, 1, 1,
0.9262848, -2.50508, 0.9579468, 0.9215686, 0, 1, 1,
0.927009, -0.9040844, 3.172038, 0.9254902, 0, 1, 1,
0.9340975, -1.567894, 4.192691, 0.9333333, 0, 1, 1,
0.9349914, -0.6007989, 3.521122, 0.9372549, 0, 1, 1,
0.9384983, -0.7497835, 1.058992, 0.945098, 0, 1, 1,
0.9412546, -0.9202434, 2.930766, 0.9490196, 0, 1, 1,
0.9459291, 1.617666, 0.221704, 0.9568627, 0, 1, 1,
0.9566135, -0.933529, 2.660175, 0.9607843, 0, 1, 1,
0.9610867, -0.3048073, 1.843917, 0.9686275, 0, 1, 1,
0.9645686, 0.4074476, -0.09916909, 0.972549, 0, 1, 1,
0.9648358, -1.825031, 3.391928, 0.9803922, 0, 1, 1,
0.9682586, -2.132962, 4.833139, 0.9843137, 0, 1, 1,
0.9705895, 0.4068382, 0.7505121, 0.9921569, 0, 1, 1,
0.9798238, 0.1626936, 2.16668, 0.9960784, 0, 1, 1,
0.9812864, -0.168316, 1.459488, 1, 0, 0.9960784, 1,
0.9882329, -0.7927386, 3.120206, 1, 0, 0.9882353, 1,
0.9885445, -1.099368, 3.58314, 1, 0, 0.9843137, 1,
0.9994913, 0.1796646, 2.253739, 1, 0, 0.9764706, 1,
1.002127, -0.04434995, 2.028753, 1, 0, 0.972549, 1,
1.006758, 0.4577446, 1.459198, 1, 0, 0.9647059, 1,
1.008512, -2.175087, 2.180712, 1, 0, 0.9607843, 1,
1.010229, 1.11317, -0.03178885, 1, 0, 0.9529412, 1,
1.010852, 1.032394, 0.7962147, 1, 0, 0.9490196, 1,
1.019714, 0.7142867, 0.3986525, 1, 0, 0.9411765, 1,
1.022561, 0.307504, 0.9140773, 1, 0, 0.9372549, 1,
1.030401, -0.04858262, 1.458302, 1, 0, 0.9294118, 1,
1.032148, 0.3080626, 0.5630378, 1, 0, 0.9254902, 1,
1.033584, 1.280276, -0.1214719, 1, 0, 0.9176471, 1,
1.058989, 0.01171379, 1.645343, 1, 0, 0.9137255, 1,
1.059585, -0.2981857, 2.6362, 1, 0, 0.9058824, 1,
1.077394, -1.322521, 2.616515, 1, 0, 0.9019608, 1,
1.077588, -1.396492, 2.933846, 1, 0, 0.8941177, 1,
1.085606, -0.8900509, 1.076141, 1, 0, 0.8862745, 1,
1.099272, -0.5124524, 1.020549, 1, 0, 0.8823529, 1,
1.101846, -1.405812, 2.858497, 1, 0, 0.8745098, 1,
1.102933, 1.478795, -0.8854137, 1, 0, 0.8705882, 1,
1.107946, -0.3495836, 0.1226066, 1, 0, 0.8627451, 1,
1.109996, 1.703995, 1.181076, 1, 0, 0.8588235, 1,
1.110313, 0.5539598, 1.225485, 1, 0, 0.8509804, 1,
1.115593, -0.297729, 1.19404, 1, 0, 0.8470588, 1,
1.120363, 0.1866981, 2.804347, 1, 0, 0.8392157, 1,
1.128777, 0.2970193, 0.1349131, 1, 0, 0.8352941, 1,
1.128814, 0.5304629, 1.546251, 1, 0, 0.827451, 1,
1.130162, -1.152642, 1.870519, 1, 0, 0.8235294, 1,
1.14141, 0.4257952, 3.681259, 1, 0, 0.8156863, 1,
1.151274, -0.6226965, 2.375147, 1, 0, 0.8117647, 1,
1.153921, -0.8830067, 1.860635, 1, 0, 0.8039216, 1,
1.155237, 0.3456252, -0.09882653, 1, 0, 0.7960784, 1,
1.159579, 0.04775976, 1.046915, 1, 0, 0.7921569, 1,
1.161944, -0.5644929, 1.352231, 1, 0, 0.7843137, 1,
1.163137, -0.5640522, 2.790839, 1, 0, 0.7803922, 1,
1.169916, -2.087728, 3.645122, 1, 0, 0.772549, 1,
1.178277, -0.7801183, 2.441644, 1, 0, 0.7686275, 1,
1.180891, -0.7265873, 1.798802, 1, 0, 0.7607843, 1,
1.205587, -0.8653401, 2.128123, 1, 0, 0.7568628, 1,
1.225973, 0.8597435, -0.1537232, 1, 0, 0.7490196, 1,
1.226734, -0.3686045, 1.433964, 1, 0, 0.7450981, 1,
1.234269, 0.741667, 0.9043382, 1, 0, 0.7372549, 1,
1.23471, 0.3552964, 0.4906229, 1, 0, 0.7333333, 1,
1.240177, 1.293956, -0.09856535, 1, 0, 0.7254902, 1,
1.244466, -0.1103888, 2.191721, 1, 0, 0.7215686, 1,
1.264737, -0.2518218, 2.552104, 1, 0, 0.7137255, 1,
1.26982, 0.03484497, 2.350322, 1, 0, 0.7098039, 1,
1.269848, 0.1127243, -0.657333, 1, 0, 0.7019608, 1,
1.278731, -0.08469287, 0.9259933, 1, 0, 0.6941177, 1,
1.282809, 1.207117, 1.458827, 1, 0, 0.6901961, 1,
1.287332, -1.356307, 3.573182, 1, 0, 0.682353, 1,
1.292143, -0.2122477, 2.124938, 1, 0, 0.6784314, 1,
1.294424, -1.1776, 2.391958, 1, 0, 0.6705883, 1,
1.304265, 0.530891, 0.3584215, 1, 0, 0.6666667, 1,
1.306569, -0.8970046, 2.344008, 1, 0, 0.6588235, 1,
1.315154, 0.08664916, 1.454984, 1, 0, 0.654902, 1,
1.324703, 0.08928286, 1.102034, 1, 0, 0.6470588, 1,
1.336677, -0.042105, 0.6303869, 1, 0, 0.6431373, 1,
1.356181, -0.03984038, 1.698128, 1, 0, 0.6352941, 1,
1.358787, -0.4299799, 1.800406, 1, 0, 0.6313726, 1,
1.385392, -0.83464, 1.109671, 1, 0, 0.6235294, 1,
1.402056, 0.1413823, 1.044713, 1, 0, 0.6196079, 1,
1.407088, 1.043337, 2.176693, 1, 0, 0.6117647, 1,
1.412848, 1.424676, 1.162386, 1, 0, 0.6078432, 1,
1.418854, -0.5295749, 1.082478, 1, 0, 0.6, 1,
1.432147, -1.335275, 1.54255, 1, 0, 0.5921569, 1,
1.43459, -1.236799, 2.394831, 1, 0, 0.5882353, 1,
1.454876, 3.435879, 2.121727, 1, 0, 0.5803922, 1,
1.461541, 1.7842, 0.7751228, 1, 0, 0.5764706, 1,
1.463942, 0.05181531, 2.542191, 1, 0, 0.5686275, 1,
1.470971, -0.6041111, 1.607681, 1, 0, 0.5647059, 1,
1.473142, 0.9021928, 0.4071842, 1, 0, 0.5568628, 1,
1.479737, 0.2014583, 2.688848, 1, 0, 0.5529412, 1,
1.486951, 0.3989846, 0.8420172, 1, 0, 0.5450981, 1,
1.489763, -1.029496, 3.005424, 1, 0, 0.5411765, 1,
1.493778, -0.6553964, 2.434775, 1, 0, 0.5333334, 1,
1.497107, -0.009666641, 2.211963, 1, 0, 0.5294118, 1,
1.49768, -0.1401465, 0.6638066, 1, 0, 0.5215687, 1,
1.50181, 0.3453269, 0.6726722, 1, 0, 0.5176471, 1,
1.503469, 1.384928, -0.2539242, 1, 0, 0.509804, 1,
1.511817, 0.8628164, 0.2715002, 1, 0, 0.5058824, 1,
1.514197, 0.1891312, 0.6867, 1, 0, 0.4980392, 1,
1.51871, 0.2817126, 1.185636, 1, 0, 0.4901961, 1,
1.524322, 0.06552067, -0.4969113, 1, 0, 0.4862745, 1,
1.529396, 1.836213, 0.3430787, 1, 0, 0.4784314, 1,
1.532889, -0.5876273, 1.352542, 1, 0, 0.4745098, 1,
1.540401, -0.3022807, 1.393393, 1, 0, 0.4666667, 1,
1.542128, 0.7999232, 0.1433011, 1, 0, 0.4627451, 1,
1.542314, 0.2325099, 2.544739, 1, 0, 0.454902, 1,
1.549897, -1.250687, 2.550307, 1, 0, 0.4509804, 1,
1.555609, -0.7652537, 2.11229, 1, 0, 0.4431373, 1,
1.557179, 0.06928411, 0.4477754, 1, 0, 0.4392157, 1,
1.566354, -1.029815, 1.556036, 1, 0, 0.4313726, 1,
1.566678, 0.1251443, 1.623108, 1, 0, 0.427451, 1,
1.570992, -0.8702039, 1.930048, 1, 0, 0.4196078, 1,
1.579213, 0.4843819, 0.2146241, 1, 0, 0.4156863, 1,
1.595355, -0.08970193, 2.077189, 1, 0, 0.4078431, 1,
1.595998, -1.236995, 0.3905182, 1, 0, 0.4039216, 1,
1.615214, 0.8368936, 1.859853, 1, 0, 0.3960784, 1,
1.615808, -0.7807294, 1.570137, 1, 0, 0.3882353, 1,
1.636274, 0.4610956, 1.093276, 1, 0, 0.3843137, 1,
1.637785, -0.2753708, 1.079643, 1, 0, 0.3764706, 1,
1.637816, 0.4315823, 2.507598, 1, 0, 0.372549, 1,
1.647681, 1.196091, 1.582385, 1, 0, 0.3647059, 1,
1.656049, 0.5562129, 1.178011, 1, 0, 0.3607843, 1,
1.656291, 1.693823, 1.871894, 1, 0, 0.3529412, 1,
1.664645, -0.9073871, 3.313837, 1, 0, 0.3490196, 1,
1.666057, 1.721931, 0.001490607, 1, 0, 0.3411765, 1,
1.667333, 1.880948, 0.3677786, 1, 0, 0.3372549, 1,
1.671709, 1.848609, 0.5767089, 1, 0, 0.3294118, 1,
1.698202, 0.8060182, 3.214776, 1, 0, 0.3254902, 1,
1.700885, 1.154785, 1.809951, 1, 0, 0.3176471, 1,
1.701727, -0.1085198, 1.804942, 1, 0, 0.3137255, 1,
1.70339, -0.6459781, 1.180901, 1, 0, 0.3058824, 1,
1.728769, 1.115256, 0.2641731, 1, 0, 0.2980392, 1,
1.738015, -0.9093648, 1.037367, 1, 0, 0.2941177, 1,
1.74581, -0.8732294, 2.663567, 1, 0, 0.2862745, 1,
1.746844, -0.3185128, 2.655812, 1, 0, 0.282353, 1,
1.757861, 0.6303838, -0.5014109, 1, 0, 0.2745098, 1,
1.758533, -0.2149183, -0.1820641, 1, 0, 0.2705882, 1,
1.76992, 0.1223805, 1.833044, 1, 0, 0.2627451, 1,
1.794095, -0.3148875, 2.667157, 1, 0, 0.2588235, 1,
1.796978, 0.145391, 2.014775, 1, 0, 0.2509804, 1,
1.834699, 1.799612, 2.063181, 1, 0, 0.2470588, 1,
1.846871, 0.7345282, 0.9617584, 1, 0, 0.2392157, 1,
1.858518, -0.8314357, 1.792207, 1, 0, 0.2352941, 1,
1.866799, 1.874015, 1.489084, 1, 0, 0.227451, 1,
1.879256, 0.40463, 2.32895, 1, 0, 0.2235294, 1,
1.880375, -0.158987, 2.498503, 1, 0, 0.2156863, 1,
1.927617, -1.24253, 2.214916, 1, 0, 0.2117647, 1,
1.947526, 1.38193, -0.4323661, 1, 0, 0.2039216, 1,
1.95615, -0.5756429, 1.681637, 1, 0, 0.1960784, 1,
1.968478, -0.05543845, 0.6916419, 1, 0, 0.1921569, 1,
1.983392, -0.9583122, 1.01453, 1, 0, 0.1843137, 1,
1.993007, -0.5549573, 1.956689, 1, 0, 0.1803922, 1,
2.022995, 1.404314, 0.6340376, 1, 0, 0.172549, 1,
2.055162, 0.5649986, 3.418719, 1, 0, 0.1686275, 1,
2.06203, 1.114355, -0.1260747, 1, 0, 0.1607843, 1,
2.071837, 1.95675, 1.11651, 1, 0, 0.1568628, 1,
2.072598, 0.5066082, 2.628309, 1, 0, 0.1490196, 1,
2.073352, 0.8205746, 1.409477, 1, 0, 0.145098, 1,
2.080999, 0.2063078, 2.482985, 1, 0, 0.1372549, 1,
2.108334, -0.5391529, 3.295053, 1, 0, 0.1333333, 1,
2.125893, 0.3179742, 2.357034, 1, 0, 0.1254902, 1,
2.126941, 0.3452352, 0.4192212, 1, 0, 0.1215686, 1,
2.145248, 0.4389287, 3.341313, 1, 0, 0.1137255, 1,
2.172563, -0.2231233, 2.389338, 1, 0, 0.1098039, 1,
2.174911, -0.7043524, 0.3094597, 1, 0, 0.1019608, 1,
2.191974, 0.2306522, 2.201588, 1, 0, 0.09411765, 1,
2.196088, -0.1070616, 0.2880654, 1, 0, 0.09019608, 1,
2.215252, -0.957877, 1.558156, 1, 0, 0.08235294, 1,
2.262551, 0.2666271, 1.937559, 1, 0, 0.07843138, 1,
2.288124, 1.128033, 1.050515, 1, 0, 0.07058824, 1,
2.410627, 0.03700653, 1.257521, 1, 0, 0.06666667, 1,
2.462846, -1.151907, 1.863132, 1, 0, 0.05882353, 1,
2.487197, -0.3036724, 2.295682, 1, 0, 0.05490196, 1,
2.494051, -1.043377, 1.660421, 1, 0, 0.04705882, 1,
2.526864, 0.1172876, 2.240112, 1, 0, 0.04313726, 1,
2.551773, -0.1823925, 0.1330796, 1, 0, 0.03529412, 1,
2.575675, 0.1743024, 1.549928, 1, 0, 0.03137255, 1,
2.620792, -0.3146906, 2.650592, 1, 0, 0.02352941, 1,
2.706616, -2.336367, 3.016989, 1, 0, 0.01960784, 1,
2.711216, 1.626805, 1.633604, 1, 0, 0.01176471, 1,
3.110025, 0.6291444, 2.33005, 1, 0, 0.007843138, 1
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
0.1004683, -4.416161, -6.937754, 0, -0.5, 0.5, 0.5,
0.1004683, -4.416161, -6.937754, 1, -0.5, 0.5, 0.5,
0.1004683, -4.416161, -6.937754, 1, 1.5, 0.5, 0.5,
0.1004683, -4.416161, -6.937754, 0, 1.5, 0.5, 0.5
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
-3.929328, 0.295553, -6.937754, 0, -0.5, 0.5, 0.5,
-3.929328, 0.295553, -6.937754, 1, -0.5, 0.5, 0.5,
-3.929328, 0.295553, -6.937754, 1, 1.5, 0.5, 0.5,
-3.929328, 0.295553, -6.937754, 0, 1.5, 0.5, 0.5
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
-3.929328, -4.416161, 0.1677532, 0, -0.5, 0.5, 0.5,
-3.929328, -4.416161, 0.1677532, 1, -0.5, 0.5, 0.5,
-3.929328, -4.416161, 0.1677532, 1, 1.5, 0.5, 0.5,
-3.929328, -4.416161, 0.1677532, 0, 1.5, 0.5, 0.5
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
-2, -3.328842, -5.298021,
3, -3.328842, -5.298021,
-2, -3.328842, -5.298021,
-2, -3.510062, -5.57131,
-1, -3.328842, -5.298021,
-1, -3.510062, -5.57131,
0, -3.328842, -5.298021,
0, -3.510062, -5.57131,
1, -3.328842, -5.298021,
1, -3.510062, -5.57131,
2, -3.328842, -5.298021,
2, -3.510062, -5.57131,
3, -3.328842, -5.298021,
3, -3.510062, -5.57131
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
-2, -3.872502, -6.117887, 0, -0.5, 0.5, 0.5,
-2, -3.872502, -6.117887, 1, -0.5, 0.5, 0.5,
-2, -3.872502, -6.117887, 1, 1.5, 0.5, 0.5,
-2, -3.872502, -6.117887, 0, 1.5, 0.5, 0.5,
-1, -3.872502, -6.117887, 0, -0.5, 0.5, 0.5,
-1, -3.872502, -6.117887, 1, -0.5, 0.5, 0.5,
-1, -3.872502, -6.117887, 1, 1.5, 0.5, 0.5,
-1, -3.872502, -6.117887, 0, 1.5, 0.5, 0.5,
0, -3.872502, -6.117887, 0, -0.5, 0.5, 0.5,
0, -3.872502, -6.117887, 1, -0.5, 0.5, 0.5,
0, -3.872502, -6.117887, 1, 1.5, 0.5, 0.5,
0, -3.872502, -6.117887, 0, 1.5, 0.5, 0.5,
1, -3.872502, -6.117887, 0, -0.5, 0.5, 0.5,
1, -3.872502, -6.117887, 1, -0.5, 0.5, 0.5,
1, -3.872502, -6.117887, 1, 1.5, 0.5, 0.5,
1, -3.872502, -6.117887, 0, 1.5, 0.5, 0.5,
2, -3.872502, -6.117887, 0, -0.5, 0.5, 0.5,
2, -3.872502, -6.117887, 1, -0.5, 0.5, 0.5,
2, -3.872502, -6.117887, 1, 1.5, 0.5, 0.5,
2, -3.872502, -6.117887, 0, 1.5, 0.5, 0.5,
3, -3.872502, -6.117887, 0, -0.5, 0.5, 0.5,
3, -3.872502, -6.117887, 1, -0.5, 0.5, 0.5,
3, -3.872502, -6.117887, 1, 1.5, 0.5, 0.5,
3, -3.872502, -6.117887, 0, 1.5, 0.5, 0.5
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
-2.999375, -2, -5.298021,
-2.999375, 2, -5.298021,
-2.999375, -2, -5.298021,
-3.154367, -2, -5.57131,
-2.999375, 0, -5.298021,
-3.154367, 0, -5.57131,
-2.999375, 2, -5.298021,
-3.154367, 2, -5.57131
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
"0",
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
-3.464352, -2, -6.117887, 0, -0.5, 0.5, 0.5,
-3.464352, -2, -6.117887, 1, -0.5, 0.5, 0.5,
-3.464352, -2, -6.117887, 1, 1.5, 0.5, 0.5,
-3.464352, -2, -6.117887, 0, 1.5, 0.5, 0.5,
-3.464352, 0, -6.117887, 0, -0.5, 0.5, 0.5,
-3.464352, 0, -6.117887, 1, -0.5, 0.5, 0.5,
-3.464352, 0, -6.117887, 1, 1.5, 0.5, 0.5,
-3.464352, 0, -6.117887, 0, 1.5, 0.5, 0.5,
-3.464352, 2, -6.117887, 0, -0.5, 0.5, 0.5,
-3.464352, 2, -6.117887, 1, -0.5, 0.5, 0.5,
-3.464352, 2, -6.117887, 1, 1.5, 0.5, 0.5,
-3.464352, 2, -6.117887, 0, 1.5, 0.5, 0.5
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
-2.999375, -3.328842, -4,
-2.999375, -3.328842, 4,
-2.999375, -3.328842, -4,
-3.154367, -3.510062, -4,
-2.999375, -3.328842, -2,
-3.154367, -3.510062, -2,
-2.999375, -3.328842, 0,
-3.154367, -3.510062, 0,
-2.999375, -3.328842, 2,
-3.154367, -3.510062, 2,
-2.999375, -3.328842, 4,
-3.154367, -3.510062, 4
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
-3.464352, -3.872502, -4, 0, -0.5, 0.5, 0.5,
-3.464352, -3.872502, -4, 1, -0.5, 0.5, 0.5,
-3.464352, -3.872502, -4, 1, 1.5, 0.5, 0.5,
-3.464352, -3.872502, -4, 0, 1.5, 0.5, 0.5,
-3.464352, -3.872502, -2, 0, -0.5, 0.5, 0.5,
-3.464352, -3.872502, -2, 1, -0.5, 0.5, 0.5,
-3.464352, -3.872502, -2, 1, 1.5, 0.5, 0.5,
-3.464352, -3.872502, -2, 0, 1.5, 0.5, 0.5,
-3.464352, -3.872502, 0, 0, -0.5, 0.5, 0.5,
-3.464352, -3.872502, 0, 1, -0.5, 0.5, 0.5,
-3.464352, -3.872502, 0, 1, 1.5, 0.5, 0.5,
-3.464352, -3.872502, 0, 0, 1.5, 0.5, 0.5,
-3.464352, -3.872502, 2, 0, -0.5, 0.5, 0.5,
-3.464352, -3.872502, 2, 1, -0.5, 0.5, 0.5,
-3.464352, -3.872502, 2, 1, 1.5, 0.5, 0.5,
-3.464352, -3.872502, 2, 0, 1.5, 0.5, 0.5,
-3.464352, -3.872502, 4, 0, -0.5, 0.5, 0.5,
-3.464352, -3.872502, 4, 1, -0.5, 0.5, 0.5,
-3.464352, -3.872502, 4, 1, 1.5, 0.5, 0.5,
-3.464352, -3.872502, 4, 0, 1.5, 0.5, 0.5
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
-2.999375, -3.328842, -5.298021,
-2.999375, 3.919948, -5.298021,
-2.999375, -3.328842, 5.633528,
-2.999375, 3.919948, 5.633528,
-2.999375, -3.328842, -5.298021,
-2.999375, -3.328842, 5.633528,
-2.999375, 3.919948, -5.298021,
-2.999375, 3.919948, 5.633528,
-2.999375, -3.328842, -5.298021,
3.200312, -3.328842, -5.298021,
-2.999375, -3.328842, 5.633528,
3.200312, -3.328842, 5.633528,
-2.999375, 3.919948, -5.298021,
3.200312, 3.919948, -5.298021,
-2.999375, 3.919948, 5.633528,
3.200312, 3.919948, 5.633528,
3.200312, -3.328842, -5.298021,
3.200312, 3.919948, -5.298021,
3.200312, -3.328842, 5.633528,
3.200312, 3.919948, 5.633528,
3.200312, -3.328842, -5.298021,
3.200312, -3.328842, 5.633528,
3.200312, 3.919948, -5.298021,
3.200312, 3.919948, 5.633528
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
var radius = 7.746949;
var distance = 34.46705;
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
mvMatrix.translate( -0.1004683, -0.295553, -0.1677532 );
mvMatrix.scale( 1.351061, 1.155524, 0.7662367 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.46705);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Velsicol_1068<-read.table("Velsicol_1068.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Velsicol_1068$V2
```

```
## Error in eval(expr, envir, enclos): object 'Velsicol_1068' not found
```

```r
y<-Velsicol_1068$V3
```

```
## Error in eval(expr, envir, enclos): object 'Velsicol_1068' not found
```

```r
z<-Velsicol_1068$V4
```

```
## Error in eval(expr, envir, enclos): object 'Velsicol_1068' not found
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
-2.909088, -0.7352183, -1.181514, 0, 0, 1, 1, 1,
-2.559943, 0.5955991, -2.551142, 1, 0, 0, 1, 1,
-2.550871, 0.4794003, -2.342565, 1, 0, 0, 1, 1,
-2.535298, 0.9755726, -1.57155, 1, 0, 0, 1, 1,
-2.520428, 1.085368, -2.296489, 1, 0, 0, 1, 1,
-2.457045, 0.1028366, -1.303522, 1, 0, 0, 1, 1,
-2.444471, -1.945125, -1.704036, 0, 0, 0, 1, 1,
-2.437964, 0.1951789, -1.286353, 0, 0, 0, 1, 1,
-2.416879, 0.1692242, 1.534894, 0, 0, 0, 1, 1,
-2.413576, 2.671592, -0.2332436, 0, 0, 0, 1, 1,
-2.375833, -0.7524951, -3.440172, 0, 0, 0, 1, 1,
-2.366578, 0.3931896, -1.742531, 0, 0, 0, 1, 1,
-2.333635, -2.413275, -2.548277, 0, 0, 0, 1, 1,
-2.31795, 0.3110408, -2.311531, 1, 1, 1, 1, 1,
-2.290323, -1.269018, -2.417162, 1, 1, 1, 1, 1,
-2.241796, -1.037078, -3.036086, 1, 1, 1, 1, 1,
-2.235804, -0.6449537, -2.232936, 1, 1, 1, 1, 1,
-2.224621, -0.7517325, -2.902145, 1, 1, 1, 1, 1,
-2.205902, 0.2277681, -1.610758, 1, 1, 1, 1, 1,
-2.194179, 0.8493626, -0.5315098, 1, 1, 1, 1, 1,
-2.160488, -0.2361483, -1.704707, 1, 1, 1, 1, 1,
-2.156966, 3.814383, -0.6307581, 1, 1, 1, 1, 1,
-2.147767, 1.790427, -0.3587875, 1, 1, 1, 1, 1,
-2.123354, -0.1971989, -1.835779, 1, 1, 1, 1, 1,
-2.084376, -0.2503609, -0.767839, 1, 1, 1, 1, 1,
-2.082327, -1.121881, -3.699357, 1, 1, 1, 1, 1,
-2.071157, -0.05494497, 0.02367927, 1, 1, 1, 1, 1,
-2.05497, 1.186352, -0.3800165, 1, 1, 1, 1, 1,
-2.047027, 0.2624141, -2.540027, 0, 0, 1, 1, 1,
-2.044105, 0.1768372, -0.6667584, 1, 0, 0, 1, 1,
-1.994088, -0.1835718, -2.380486, 1, 0, 0, 1, 1,
-1.986449, 0.4209507, -1.412467, 1, 0, 0, 1, 1,
-1.980477, 0.1253934, -0.3170677, 1, 0, 0, 1, 1,
-1.980453, 0.1011046, -1.664445, 1, 0, 0, 1, 1,
-1.953783, 1.590951, -1.385045, 0, 0, 0, 1, 1,
-1.946118, -0.3195011, -0.8930842, 0, 0, 0, 1, 1,
-1.913828, 2.311076, 0.05852862, 0, 0, 0, 1, 1,
-1.897395, 0.2295082, -1.134638, 0, 0, 0, 1, 1,
-1.871517, -0.7647274, -2.725859, 0, 0, 0, 1, 1,
-1.866513, -0.0610766, -1.34553, 0, 0, 0, 1, 1,
-1.805411, 0.2948886, -3.886174, 0, 0, 0, 1, 1,
-1.792024, -0.06029874, -3.260306, 1, 1, 1, 1, 1,
-1.791686, 0.8372465, -0.9691939, 1, 1, 1, 1, 1,
-1.785487, 0.02915829, -2.165272, 1, 1, 1, 1, 1,
-1.780637, 0.01517584, -0.6907063, 1, 1, 1, 1, 1,
-1.772533, 0.5929126, -0.1785708, 1, 1, 1, 1, 1,
-1.76802, 1.388035, 1.151826, 1, 1, 1, 1, 1,
-1.746462, 0.08314193, -2.838479, 1, 1, 1, 1, 1,
-1.746428, 0.7162735, -3.083037, 1, 1, 1, 1, 1,
-1.702066, -0.4622046, -0.4183864, 1, 1, 1, 1, 1,
-1.684665, -0.5901052, -2.48165, 1, 1, 1, 1, 1,
-1.679493, -0.2166925, -3.601718, 1, 1, 1, 1, 1,
-1.672915, 0.3205029, -2.447583, 1, 1, 1, 1, 1,
-1.668128, -0.217709, -2.643102, 1, 1, 1, 1, 1,
-1.666962, -0.4080011, -2.163223, 1, 1, 1, 1, 1,
-1.664184, 0.6204647, -1.53427, 1, 1, 1, 1, 1,
-1.662871, -1.464058, -3.462115, 0, 0, 1, 1, 1,
-1.639973, 0.3161173, -1.861295, 1, 0, 0, 1, 1,
-1.637841, -0.9935802, -3.138658, 1, 0, 0, 1, 1,
-1.635623, 0.451073, -2.378468, 1, 0, 0, 1, 1,
-1.586637, -0.1269832, -3.400419, 1, 0, 0, 1, 1,
-1.58543, -0.951905, -2.953761, 1, 0, 0, 1, 1,
-1.574279, -0.9217846, -2.496426, 0, 0, 0, 1, 1,
-1.542896, 2.154163, -1.755329, 0, 0, 0, 1, 1,
-1.526355, -0.2804056, -0.9279141, 0, 0, 0, 1, 1,
-1.524392, 0.3163849, 0.216393, 0, 0, 0, 1, 1,
-1.510515, 1.179785, -0.2924769, 0, 0, 0, 1, 1,
-1.495422, 0.5812631, -0.2133995, 0, 0, 0, 1, 1,
-1.484377, -1.382956, -2.124514, 0, 0, 0, 1, 1,
-1.474903, -2.197542, -1.041949, 1, 1, 1, 1, 1,
-1.470126, -0.6137818, -2.320655, 1, 1, 1, 1, 1,
-1.468605, -1.418062, -2.66445, 1, 1, 1, 1, 1,
-1.468276, -0.8613237, -3.837911, 1, 1, 1, 1, 1,
-1.458991, 1.075174, -0.847183, 1, 1, 1, 1, 1,
-1.453512, -1.326373, -1.461198, 1, 1, 1, 1, 1,
-1.440755, 1.756973, -1.229601, 1, 1, 1, 1, 1,
-1.440583, 1.264627, -2.793291, 1, 1, 1, 1, 1,
-1.420317, 0.6870428, -2.288488, 1, 1, 1, 1, 1,
-1.411804, -0.7983803, -1.890728, 1, 1, 1, 1, 1,
-1.409699, 2.114537, 0.4888479, 1, 1, 1, 1, 1,
-1.398454, -0.06903993, -0.3155973, 1, 1, 1, 1, 1,
-1.393452, -0.9787059, -2.436385, 1, 1, 1, 1, 1,
-1.390668, 0.3646812, -2.833878, 1, 1, 1, 1, 1,
-1.39034, -0.5994298, -1.725206, 1, 1, 1, 1, 1,
-1.389073, -0.6675628, -2.196584, 0, 0, 1, 1, 1,
-1.378913, -0.7347161, -1.110868, 1, 0, 0, 1, 1,
-1.376014, 1.123448, -0.8110949, 1, 0, 0, 1, 1,
-1.370264, 0.3415753, -0.5227091, 1, 0, 0, 1, 1,
-1.363495, 0.4201968, -2.228039, 1, 0, 0, 1, 1,
-1.361129, 1.682087, 0.04633643, 1, 0, 0, 1, 1,
-1.341095, 0.1390339, -1.26558, 0, 0, 0, 1, 1,
-1.334751, 0.5343016, -1.255556, 0, 0, 0, 1, 1,
-1.3339, 0.7472094, 0.04445475, 0, 0, 0, 1, 1,
-1.333307, -0.5538086, -0.3452075, 0, 0, 0, 1, 1,
-1.321261, 0.5984612, -3.457306, 0, 0, 0, 1, 1,
-1.309791, -0.8652503, -2.823702, 0, 0, 0, 1, 1,
-1.308752, -0.3520385, -1.503772, 0, 0, 0, 1, 1,
-1.308181, 0.7869759, 0.3621069, 1, 1, 1, 1, 1,
-1.308134, 1.333551, 0.3360217, 1, 1, 1, 1, 1,
-1.307854, -0.9535425, -1.784195, 1, 1, 1, 1, 1,
-1.293973, -3.223277, -3.16564, 1, 1, 1, 1, 1,
-1.292485, -0.9930513, -1.824814, 1, 1, 1, 1, 1,
-1.280798, -0.953084, -3.163156, 1, 1, 1, 1, 1,
-1.2735, -1.159846, -1.71365, 1, 1, 1, 1, 1,
-1.265703, -0.4277968, -1.994641, 1, 1, 1, 1, 1,
-1.26282, -0.3267, -1.866907, 1, 1, 1, 1, 1,
-1.257739, -1.023729, -2.65377, 1, 1, 1, 1, 1,
-1.255644, 0.7477714, -2.37629, 1, 1, 1, 1, 1,
-1.245898, -1.511276, -0.9670022, 1, 1, 1, 1, 1,
-1.24252, -0.3034012, -2.750497, 1, 1, 1, 1, 1,
-1.239928, 2.805689, 0.528402, 1, 1, 1, 1, 1,
-1.23965, -0.7786542, -1.565017, 1, 1, 1, 1, 1,
-1.236187, -0.3020101, -1.458109, 0, 0, 1, 1, 1,
-1.230343, 1.788108, -0.8001204, 1, 0, 0, 1, 1,
-1.217334, 0.9732344, -1.248549, 1, 0, 0, 1, 1,
-1.210412, -0.5952172, -2.001312, 1, 0, 0, 1, 1,
-1.210124, 0.2332914, -1.630584, 1, 0, 0, 1, 1,
-1.20807, 1.25767, -2.5106, 1, 0, 0, 1, 1,
-1.201597, 1.456565, 0.3355238, 0, 0, 0, 1, 1,
-1.198653, -0.4305187, -1.102378, 0, 0, 0, 1, 1,
-1.198143, -0.16739, -1.107448, 0, 0, 0, 1, 1,
-1.194185, -0.2437414, -0.2475867, 0, 0, 0, 1, 1,
-1.192492, -2.028192, -1.879164, 0, 0, 0, 1, 1,
-1.188343, -1.69297, -1.528684, 0, 0, 0, 1, 1,
-1.18811, 0.6608305, -1.908278, 0, 0, 0, 1, 1,
-1.187922, 0.008523389, -1.606463, 1, 1, 1, 1, 1,
-1.185005, -1.314925, -1.906764, 1, 1, 1, 1, 1,
-1.18073, 1.585065, -1.830858, 1, 1, 1, 1, 1,
-1.175795, 0.6935871, -0.3011029, 1, 1, 1, 1, 1,
-1.172955, 0.9308903, -1.14949, 1, 1, 1, 1, 1,
-1.170478, -0.4511529, -1.330402, 1, 1, 1, 1, 1,
-1.161462, -0.1629995, -1.100608, 1, 1, 1, 1, 1,
-1.156283, -0.5741971, -1.811349, 1, 1, 1, 1, 1,
-1.153262, 0.5738285, -0.9214582, 1, 1, 1, 1, 1,
-1.145067, -2.161031, -1.720931, 1, 1, 1, 1, 1,
-1.127495, 1.646676, -0.5490564, 1, 1, 1, 1, 1,
-1.122388, 1.303664, -0.5366017, 1, 1, 1, 1, 1,
-1.121695, -0.2878748, -1.473422, 1, 1, 1, 1, 1,
-1.121375, -1.167446, -0.2531698, 1, 1, 1, 1, 1,
-1.119715, -0.1560353, -2.120973, 1, 1, 1, 1, 1,
-1.118578, -2.858375, -4.091124, 0, 0, 1, 1, 1,
-1.111582, 0.5296947, -1.25369, 1, 0, 0, 1, 1,
-1.104373, 1.273037, -0.9154803, 1, 0, 0, 1, 1,
-1.102249, 1.124886, -1.036616, 1, 0, 0, 1, 1,
-1.100158, 1.109177, -1.568867, 1, 0, 0, 1, 1,
-1.092589, 0.6154379, -1.015039, 1, 0, 0, 1, 1,
-1.092304, 2.317921, 0.01930488, 0, 0, 0, 1, 1,
-1.090618, 0.4539906, -3.191334, 0, 0, 0, 1, 1,
-1.088753, -0.8100491, -2.280135, 0, 0, 0, 1, 1,
-1.079562, -0.9748003, -4.189762, 0, 0, 0, 1, 1,
-1.079254, 0.8622391, -0.7861332, 0, 0, 0, 1, 1,
-1.076841, -0.101113, -3.022983, 0, 0, 0, 1, 1,
-1.072037, 0.5940455, -0.8698117, 0, 0, 0, 1, 1,
-1.069922, -0.4252533, -3.738398, 1, 1, 1, 1, 1,
-1.061398, -0.08680368, -0.1894443, 1, 1, 1, 1, 1,
-1.050503, -1.800598, -2.42575, 1, 1, 1, 1, 1,
-1.04939, 0.5295329, -2.185437, 1, 1, 1, 1, 1,
-1.046271, 1.009723, -0.01679201, 1, 1, 1, 1, 1,
-1.044732, -0.7606163, -0.6388589, 1, 1, 1, 1, 1,
-1.043683, 0.3829651, -2.704866, 1, 1, 1, 1, 1,
-1.040301, -0.7875701, -0.4564571, 1, 1, 1, 1, 1,
-1.034823, 1.781204, -0.3085677, 1, 1, 1, 1, 1,
-1.033082, 0.7654485, -1.406008, 1, 1, 1, 1, 1,
-1.032025, 0.913539, -0.1941314, 1, 1, 1, 1, 1,
-1.02344, -0.244888, -1.460396, 1, 1, 1, 1, 1,
-1.0136, 0.7497313, -0.1699751, 1, 1, 1, 1, 1,
-1.008487, -1.38841, -1.380338, 1, 1, 1, 1, 1,
-0.9984747, -1.609149, -5.138824, 1, 1, 1, 1, 1,
-0.9974435, -1.485461, -1.046268, 0, 0, 1, 1, 1,
-0.9967272, 0.9105412, -1.183342, 1, 0, 0, 1, 1,
-0.9963567, 0.3823938, -0.2735859, 1, 0, 0, 1, 1,
-0.9914572, 0.4897143, -2.182717, 1, 0, 0, 1, 1,
-0.9889653, -1.654773, -2.765392, 1, 0, 0, 1, 1,
-0.9783393, -2.153944, -2.145779, 1, 0, 0, 1, 1,
-0.9721404, 0.7885284, -1.738435, 0, 0, 0, 1, 1,
-0.9704019, -1.558125, -1.868592, 0, 0, 0, 1, 1,
-0.9700347, 0.1213125, -0.6259839, 0, 0, 0, 1, 1,
-0.952678, -0.8608521, -2.337568, 0, 0, 0, 1, 1,
-0.9513775, -0.008467216, -1.232872, 0, 0, 0, 1, 1,
-0.9491524, 1.354479, -0.5343686, 0, 0, 0, 1, 1,
-0.9455395, 0.03630206, -2.366939, 0, 0, 0, 1, 1,
-0.9418057, 0.6632617, -1.82234, 1, 1, 1, 1, 1,
-0.9407863, 0.3665103, -2.572756, 1, 1, 1, 1, 1,
-0.939145, 1.409946, 1.145195, 1, 1, 1, 1, 1,
-0.9384159, -0.5336975, -1.525917, 1, 1, 1, 1, 1,
-0.937622, 1.171807, -0.797835, 1, 1, 1, 1, 1,
-0.9311094, -1.472734, -3.407072, 1, 1, 1, 1, 1,
-0.9236381, -1.144835, -2.99542, 1, 1, 1, 1, 1,
-0.922057, -0.1306172, -1.878937, 1, 1, 1, 1, 1,
-0.9219974, 0.5169995, -1.723272, 1, 1, 1, 1, 1,
-0.9169984, 0.9204859, -0.02166408, 1, 1, 1, 1, 1,
-0.9163268, -0.5845156, -2.874516, 1, 1, 1, 1, 1,
-0.9138901, -1.58733, -2.562442, 1, 1, 1, 1, 1,
-0.9128954, 0.2308332, 0.2368145, 1, 1, 1, 1, 1,
-0.9061961, -0.6086971, -2.399145, 1, 1, 1, 1, 1,
-0.9057217, -1.513031, -4.70445, 1, 1, 1, 1, 1,
-0.904327, -0.3915815, -3.327689, 0, 0, 1, 1, 1,
-0.898789, -0.9893972, -2.347806, 1, 0, 0, 1, 1,
-0.8942172, 0.008217227, -2.753423, 1, 0, 0, 1, 1,
-0.8903261, 0.06372861, -3.039538, 1, 0, 0, 1, 1,
-0.8838703, -0.4761201, -4.212987, 1, 0, 0, 1, 1,
-0.8802252, -0.4797637, -1.235762, 1, 0, 0, 1, 1,
-0.8796385, 1.717662, -1.548165, 0, 0, 0, 1, 1,
-0.8779934, 0.3323413, 0.8521348, 0, 0, 0, 1, 1,
-0.8689899, -0.34263, -0.9242419, 0, 0, 0, 1, 1,
-0.859836, 0.2782012, -2.282108, 0, 0, 0, 1, 1,
-0.8591135, -1.443871, -2.780804, 0, 0, 0, 1, 1,
-0.8533185, -0.7241367, -3.382926, 0, 0, 0, 1, 1,
-0.8377453, 0.3934341, -0.7144662, 0, 0, 0, 1, 1,
-0.8366213, -0.9929542, -1.767395, 1, 1, 1, 1, 1,
-0.8363698, -1.113723, -3.685866, 1, 1, 1, 1, 1,
-0.8329379, -0.3996504, -0.9913305, 1, 1, 1, 1, 1,
-0.8324661, 0.1026607, -0.603996, 1, 1, 1, 1, 1,
-0.8323457, -0.1261934, -0.6069118, 1, 1, 1, 1, 1,
-0.8297758, 0.4643987, -1.696681, 1, 1, 1, 1, 1,
-0.8282079, -0.6875139, -1.15485, 1, 1, 1, 1, 1,
-0.8267378, 0.907013, -0.6626193, 1, 1, 1, 1, 1,
-0.8250664, 0.483597, -1.349764, 1, 1, 1, 1, 1,
-0.8237106, -0.02533716, -0.8581845, 1, 1, 1, 1, 1,
-0.8205704, -1.890194, -1.79048, 1, 1, 1, 1, 1,
-0.8112146, -0.09294996, -1.745321, 1, 1, 1, 1, 1,
-0.8090799, 0.3405486, -1.008847, 1, 1, 1, 1, 1,
-0.8010954, -1.206954, -2.633634, 1, 1, 1, 1, 1,
-0.8003601, 0.6301246, -1.184027, 1, 1, 1, 1, 1,
-0.7954898, 0.8194679, -1.241938, 0, 0, 1, 1, 1,
-0.7929803, -2.546633, -1.59387, 1, 0, 0, 1, 1,
-0.7920887, 0.1158996, -1.699213, 1, 0, 0, 1, 1,
-0.7916633, -0.1020363, -2.54849, 1, 0, 0, 1, 1,
-0.7904071, 0.592463, -0.1854982, 1, 0, 0, 1, 1,
-0.7859439, -1.81986, -3.018681, 1, 0, 0, 1, 1,
-0.7823068, -0.1781613, 0.1697854, 0, 0, 0, 1, 1,
-0.7796468, 1.69153, -1.087515, 0, 0, 0, 1, 1,
-0.773885, -0.4908544, -3.034714, 0, 0, 0, 1, 1,
-0.7737239, -1.026245, -2.380554, 0, 0, 0, 1, 1,
-0.7619519, -0.7514897, -3.126709, 0, 0, 0, 1, 1,
-0.7547536, -0.1501452, -0.6692677, 0, 0, 0, 1, 1,
-0.746798, -0.8689008, -3.324344, 0, 0, 0, 1, 1,
-0.74309, 2.006994, -1.244403, 1, 1, 1, 1, 1,
-0.74024, -0.1881381, -2.323479, 1, 1, 1, 1, 1,
-0.7379509, 2.321298, -1.45604, 1, 1, 1, 1, 1,
-0.7371738, 0.4956124, 0.200843, 1, 1, 1, 1, 1,
-0.7295082, 0.9531735, -1.863906, 1, 1, 1, 1, 1,
-0.7282289, -0.7179981, 0.2379886, 1, 1, 1, 1, 1,
-0.7226201, 0.3739196, -2.113825, 1, 1, 1, 1, 1,
-0.7219776, 0.4428694, -3.437058, 1, 1, 1, 1, 1,
-0.7175066, -0.413871, -1.84767, 1, 1, 1, 1, 1,
-0.7157788, -0.3541494, -2.319466, 1, 1, 1, 1, 1,
-0.712635, 0.010771, -1.498464, 1, 1, 1, 1, 1,
-0.7106094, 1.455007, -1.999247, 1, 1, 1, 1, 1,
-0.7085019, -0.2021556, -3.134732, 1, 1, 1, 1, 1,
-0.7076839, -1.52594, -2.406175, 1, 1, 1, 1, 1,
-0.7071165, 0.005684952, -1.940785, 1, 1, 1, 1, 1,
-0.7060356, 0.4523002, 0.00959499, 0, 0, 1, 1, 1,
-0.7051275, 1.864815, -0.4574709, 1, 0, 0, 1, 1,
-0.7014667, 0.3394468, 0.183913, 1, 0, 0, 1, 1,
-0.7002626, 1.115892, -0.8797644, 1, 0, 0, 1, 1,
-0.6992739, 1.095407, -0.2142518, 1, 0, 0, 1, 1,
-0.699067, 1.220908, -1.864862, 1, 0, 0, 1, 1,
-0.694887, -1.818209, -2.893854, 0, 0, 0, 1, 1,
-0.6942005, -0.3451271, -2.653835, 0, 0, 0, 1, 1,
-0.6937498, 0.1605887, -0.4824148, 0, 0, 0, 1, 1,
-0.6881811, -0.3805729, -2.233014, 0, 0, 0, 1, 1,
-0.684493, 1.640947, -0.2580698, 0, 0, 0, 1, 1,
-0.6823886, 1.550871, 0.2662134, 0, 0, 0, 1, 1,
-0.681069, 1.0374, 1.92975, 0, 0, 0, 1, 1,
-0.6802259, 0.2785433, -0.7969055, 1, 1, 1, 1, 1,
-0.6737779, -0.1303504, -2.158559, 1, 1, 1, 1, 1,
-0.6737227, -0.5429006, -1.177468, 1, 1, 1, 1, 1,
-0.6703077, 0.5398157, 0.1123904, 1, 1, 1, 1, 1,
-0.667002, -0.246611, -1.526219, 1, 1, 1, 1, 1,
-0.6660072, -0.5001588, -2.567078, 1, 1, 1, 1, 1,
-0.6588294, -1.373204, -3.956313, 1, 1, 1, 1, 1,
-0.6538643, 0.5471821, -1.046417, 1, 1, 1, 1, 1,
-0.6534306, -0.3854562, -2.175728, 1, 1, 1, 1, 1,
-0.6490944, 0.6553038, -1.741799, 1, 1, 1, 1, 1,
-0.6481389, -0.5856423, -1.092325, 1, 1, 1, 1, 1,
-0.6461653, -2.00943, -4.413936, 1, 1, 1, 1, 1,
-0.6444824, -0.9799712, -2.252477, 1, 1, 1, 1, 1,
-0.6438962, 0.1545239, -1.299736, 1, 1, 1, 1, 1,
-0.6414631, 0.1413315, -0.5831117, 1, 1, 1, 1, 1,
-0.6351157, 1.825227, -0.8052241, 0, 0, 1, 1, 1,
-0.6299925, -0.1223143, -1.007776, 1, 0, 0, 1, 1,
-0.6262097, 1.627507, -1.553598, 1, 0, 0, 1, 1,
-0.6172971, 0.6703645, -0.3762116, 1, 0, 0, 1, 1,
-0.6149552, 1.709952, -1.660136, 1, 0, 0, 1, 1,
-0.6059933, -0.4299222, -3.765121, 1, 0, 0, 1, 1,
-0.6036745, 2.938887, 0.2929392, 0, 0, 0, 1, 1,
-0.6017101, 0.02025834, -0.8449531, 0, 0, 0, 1, 1,
-0.6016656, -0.03655145, -2.068667, 0, 0, 0, 1, 1,
-0.5971029, 1.460371, -1.095254, 0, 0, 0, 1, 1,
-0.5946073, -1.870139, -3.418146, 0, 0, 0, 1, 1,
-0.5929957, 1.164683, 0.11195, 0, 0, 0, 1, 1,
-0.5849212, -0.5466523, -2.59276, 0, 0, 0, 1, 1,
-0.5823592, -0.3660165, -2.352702, 1, 1, 1, 1, 1,
-0.5821925, 0.1313846, 0.2390778, 1, 1, 1, 1, 1,
-0.5819821, -0.4750874, -1.903145, 1, 1, 1, 1, 1,
-0.5778778, -0.3919102, -3.299074, 1, 1, 1, 1, 1,
-0.5743284, -0.674733, -2.013889, 1, 1, 1, 1, 1,
-0.5732716, 0.006375112, -1.343315, 1, 1, 1, 1, 1,
-0.5728382, -0.7819152, -2.374349, 1, 1, 1, 1, 1,
-0.5710493, -0.6546183, -2.505124, 1, 1, 1, 1, 1,
-0.566613, 0.5460202, -0.6612152, 1, 1, 1, 1, 1,
-0.5579262, -0.7571921, -1.535589, 1, 1, 1, 1, 1,
-0.5551688, -1.863979, -3.194631, 1, 1, 1, 1, 1,
-0.5537468, 0.266287, -2.993153, 1, 1, 1, 1, 1,
-0.5448017, -1.623974, -2.347111, 1, 1, 1, 1, 1,
-0.5443754, 0.3787975, -0.7729581, 1, 1, 1, 1, 1,
-0.5372964, -1.116813, -3.589708, 1, 1, 1, 1, 1,
-0.5318524, -0.3645979, -0.3676329, 0, 0, 1, 1, 1,
-0.5308231, 1.310587, 0.7563546, 1, 0, 0, 1, 1,
-0.5285345, -0.1489765, -1.810392, 1, 0, 0, 1, 1,
-0.5278004, -0.2014637, -2.703636, 1, 0, 0, 1, 1,
-0.5257252, -2.191921, -2.752924, 1, 0, 0, 1, 1,
-0.5253077, -0.8763531, -2.146519, 1, 0, 0, 1, 1,
-0.5197181, 0.08435604, -1.484712, 0, 0, 0, 1, 1,
-0.5147021, 0.1396901, -2.915715, 0, 0, 0, 1, 1,
-0.5140631, 0.1081363, 1.212701, 0, 0, 0, 1, 1,
-0.5103431, -0.05285743, -2.603356, 0, 0, 0, 1, 1,
-0.5089342, -0.732893, -3.813753, 0, 0, 0, 1, 1,
-0.5081849, -0.2611477, -1.80023, 0, 0, 0, 1, 1,
-0.5075497, -0.1672072, -2.792056, 0, 0, 0, 1, 1,
-0.5066029, 0.8851079, 0.1629982, 1, 1, 1, 1, 1,
-0.5057352, -0.1823451, -1.392582, 1, 1, 1, 1, 1,
-0.5000046, -1.357042, -1.701746, 1, 1, 1, 1, 1,
-0.4999364, 1.275208, -1.977232, 1, 1, 1, 1, 1,
-0.4926543, 0.768967, -0.4612041, 1, 1, 1, 1, 1,
-0.4896671, 0.8966082, -0.7687715, 1, 1, 1, 1, 1,
-0.4896091, 0.1185682, -1.950256, 1, 1, 1, 1, 1,
-0.4864993, -0.1999246, -2.948674, 1, 1, 1, 1, 1,
-0.4808433, -0.0756205, -2.525318, 1, 1, 1, 1, 1,
-0.4796404, -0.9684914, -2.630012, 1, 1, 1, 1, 1,
-0.474619, -0.1011205, -1.857147, 1, 1, 1, 1, 1,
-0.47409, 0.09231249, -2.577917, 1, 1, 1, 1, 1,
-0.4723374, -1.554651, -2.996887, 1, 1, 1, 1, 1,
-0.4722731, 1.791897, -1.42222, 1, 1, 1, 1, 1,
-0.4658998, 0.4955123, 0.2459316, 1, 1, 1, 1, 1,
-0.4633402, 0.6705754, 0.7596335, 0, 0, 1, 1, 1,
-0.4576495, -0.3492357, -4.349962, 1, 0, 0, 1, 1,
-0.4573906, 0.241515, -1.288939, 1, 0, 0, 1, 1,
-0.453958, -1.425196, -3.601387, 1, 0, 0, 1, 1,
-0.4514729, 0.5320146, -2.048259, 1, 0, 0, 1, 1,
-0.4497233, -0.8275219, -3.044693, 1, 0, 0, 1, 1,
-0.4491788, -1.15249, -1.46351, 0, 0, 0, 1, 1,
-0.4465827, -2.130252, -2.69038, 0, 0, 0, 1, 1,
-0.4465552, 0.3900057, 0.8987869, 0, 0, 0, 1, 1,
-0.4442476, 1.286654, -0.8052971, 0, 0, 0, 1, 1,
-0.4411882, -0.4087752, -1.988694, 0, 0, 0, 1, 1,
-0.4336525, -0.1737826, -0.3756087, 0, 0, 0, 1, 1,
-0.4232563, -0.3746113, -2.48131, 0, 0, 0, 1, 1,
-0.4206187, 0.763684, -0.2426691, 1, 1, 1, 1, 1,
-0.4130727, 0.5420048, -0.9231784, 1, 1, 1, 1, 1,
-0.4110768, 1.007644, -0.5021718, 1, 1, 1, 1, 1,
-0.4079376, 0.5569025, -2.519429, 1, 1, 1, 1, 1,
-0.407417, 0.7730951, -2.826729, 1, 1, 1, 1, 1,
-0.4043796, -0.3764989, -2.221568, 1, 1, 1, 1, 1,
-0.4042754, -1.839421, -4.290298, 1, 1, 1, 1, 1,
-0.4011379, -0.4431795, -3.849428, 1, 1, 1, 1, 1,
-0.3993804, -0.2103417, -3.639871, 1, 1, 1, 1, 1,
-0.3965158, -1.184134, -3.669394, 1, 1, 1, 1, 1,
-0.39242, 0.4910433, -1.167079, 1, 1, 1, 1, 1,
-0.3897455, 0.433466, -1.650159, 1, 1, 1, 1, 1,
-0.3820063, -0.2860116, -1.743295, 1, 1, 1, 1, 1,
-0.3767848, -0.547091, -2.0674, 1, 1, 1, 1, 1,
-0.3733242, 0.9570549, -0.4540625, 1, 1, 1, 1, 1,
-0.371661, -0.3395015, -1.593377, 0, 0, 1, 1, 1,
-0.3700602, 0.4459608, 0.1329733, 1, 0, 0, 1, 1,
-0.3698983, -0.4126146, -0.1304108, 1, 0, 0, 1, 1,
-0.3692406, -1.032741, -3.829686, 1, 0, 0, 1, 1,
-0.3677993, 0.5672699, 2.188236, 1, 0, 0, 1, 1,
-0.3646522, 0.4411142, -1.21099, 1, 0, 0, 1, 1,
-0.3638, 0.9314789, -0.396941, 0, 0, 0, 1, 1,
-0.362309, 1.441706, -0.8838627, 0, 0, 0, 1, 1,
-0.3606406, -0.8570212, -4.671419, 0, 0, 0, 1, 1,
-0.3589245, -2.39483, -4.069214, 0, 0, 0, 1, 1,
-0.3582722, -0.3818039, -4.111414, 0, 0, 0, 1, 1,
-0.3550829, 1.25288, -1.802813, 0, 0, 0, 1, 1,
-0.3498712, -1.71878, -3.255843, 0, 0, 0, 1, 1,
-0.3381477, -0.4759502, -3.316333, 1, 1, 1, 1, 1,
-0.333456, 2.184638, -0.3899092, 1, 1, 1, 1, 1,
-0.332437, 0.8033451, 1.099947, 1, 1, 1, 1, 1,
-0.3310302, -0.3316384, 0.0329487, 1, 1, 1, 1, 1,
-0.3201786, 0.3170848, -0.9370394, 1, 1, 1, 1, 1,
-0.3197018, 1.70398, -0.06933005, 1, 1, 1, 1, 1,
-0.318855, 1.483968, -0.7182432, 1, 1, 1, 1, 1,
-0.312456, 0.3152214, -1.3577, 1, 1, 1, 1, 1,
-0.3111326, -0.6002508, -1.929636, 1, 1, 1, 1, 1,
-0.3073055, -1.251842, -2.27702, 1, 1, 1, 1, 1,
-0.3063139, -1.019007, -2.449081, 1, 1, 1, 1, 1,
-0.3051676, 0.2804942, 0.8331348, 1, 1, 1, 1, 1,
-0.3044248, 0.3930755, -0.5248707, 1, 1, 1, 1, 1,
-0.2939676, 0.8692213, -0.1228896, 1, 1, 1, 1, 1,
-0.2922664, 0.1549565, -1.03874, 1, 1, 1, 1, 1,
-0.2916468, 1.045255, -0.3592184, 0, 0, 1, 1, 1,
-0.2831454, 2.001365, -1.243685, 1, 0, 0, 1, 1,
-0.2822959, -1.155554, -3.847046, 1, 0, 0, 1, 1,
-0.2786587, 0.9040037, -0.01627677, 1, 0, 0, 1, 1,
-0.2682938, -1.420526, -3.353042, 1, 0, 0, 1, 1,
-0.2668047, -1.110318, -1.950292, 1, 0, 0, 1, 1,
-0.2648404, 0.7603477, 1.009948, 0, 0, 0, 1, 1,
-0.2628652, -0.2842498, -1.928041, 0, 0, 0, 1, 1,
-0.2599937, 0.8864236, 0.2747543, 0, 0, 0, 1, 1,
-0.2593209, 3.177332, 0.5774881, 0, 0, 0, 1, 1,
-0.25767, 1.676313, 0.8480992, 0, 0, 0, 1, 1,
-0.2533744, -0.292078, -2.042502, 0, 0, 0, 1, 1,
-0.2496846, -1.415284, -1.805, 0, 0, 0, 1, 1,
-0.2477047, -1.182412, -3.853876, 1, 1, 1, 1, 1,
-0.2435583, 0.5747026, -1.674715, 1, 1, 1, 1, 1,
-0.238658, 0.5984345, -1.21576, 1, 1, 1, 1, 1,
-0.2385342, 0.8422397, 0.2472263, 1, 1, 1, 1, 1,
-0.2382316, -1.162596, -2.348079, 1, 1, 1, 1, 1,
-0.2365143, 0.7057272, 0.6482362, 1, 1, 1, 1, 1,
-0.2327993, 0.7454972, 2.45958, 1, 1, 1, 1, 1,
-0.230778, 0.1940583, -0.3840473, 1, 1, 1, 1, 1,
-0.2280068, -0.3399699, -1.816187, 1, 1, 1, 1, 1,
-0.2238653, 0.3798124, -0.182056, 1, 1, 1, 1, 1,
-0.2164322, -0.3771541, -2.998409, 1, 1, 1, 1, 1,
-0.2161771, -0.8510564, -2.407961, 1, 1, 1, 1, 1,
-0.2143449, -0.01411368, -2.360003, 1, 1, 1, 1, 1,
-0.2088495, 0.7148967, 1.405498, 1, 1, 1, 1, 1,
-0.2053643, -0.5703629, -4.143544, 1, 1, 1, 1, 1,
-0.2053509, 0.3699776, -1.868729, 0, 0, 1, 1, 1,
-0.199333, 1.034485, -0.2810104, 1, 0, 0, 1, 1,
-0.1978011, -0.6742364, -3.192078, 1, 0, 0, 1, 1,
-0.1908082, -0.5007499, -2.263961, 1, 0, 0, 1, 1,
-0.1894258, 0.4256962, 0.08985747, 1, 0, 0, 1, 1,
-0.188836, 0.323643, -1.599048, 1, 0, 0, 1, 1,
-0.1870312, 0.9333751, 1.116005, 0, 0, 0, 1, 1,
-0.1862816, 0.1907052, 0.2080704, 0, 0, 0, 1, 1,
-0.1842848, -0.1589572, -2.745064, 0, 0, 0, 1, 1,
-0.1830504, -0.1175549, -1.840604, 0, 0, 0, 1, 1,
-0.1826743, -0.5171914, -1.096488, 0, 0, 0, 1, 1,
-0.1812961, -0.5746996, -1.916043, 0, 0, 0, 1, 1,
-0.1791459, 1.155874, 0.5881342, 0, 0, 0, 1, 1,
-0.1786732, -0.9303739, -2.918505, 1, 1, 1, 1, 1,
-0.1767552, 2.15436, 0.4602149, 1, 1, 1, 1, 1,
-0.1752127, -0.4082977, -2.543493, 1, 1, 1, 1, 1,
-0.1688903, -0.7735984, -4.814155, 1, 1, 1, 1, 1,
-0.1678598, -1.110657, -3.652724, 1, 1, 1, 1, 1,
-0.1632846, -1.058881, -3.607784, 1, 1, 1, 1, 1,
-0.1539996, -1.62095, -3.339055, 1, 1, 1, 1, 1,
-0.1530292, 0.9657065, -0.1625353, 1, 1, 1, 1, 1,
-0.1529089, -1.364799, -3.296237, 1, 1, 1, 1, 1,
-0.1496304, -0.03688926, -1.236589, 1, 1, 1, 1, 1,
-0.1366647, -0.1410775, -3.178543, 1, 1, 1, 1, 1,
-0.1360959, -1.732348, -3.851672, 1, 1, 1, 1, 1,
-0.1264539, 0.1708672, -0.2787083, 1, 1, 1, 1, 1,
-0.1243844, 0.5942793, -0.6148152, 1, 1, 1, 1, 1,
-0.110352, -0.5035617, -3.799145, 1, 1, 1, 1, 1,
-0.1096621, -1.554876, -3.608619, 0, 0, 1, 1, 1,
-0.1070798, 0.8751013, 1.839761, 1, 0, 0, 1, 1,
-0.1069383, -0.1161239, -1.334215, 1, 0, 0, 1, 1,
-0.1056828, -0.1714295, -2.439705, 1, 0, 0, 1, 1,
-0.1050643, -0.5379527, -3.633759, 1, 0, 0, 1, 1,
-0.1037964, -0.1581966, -2.282252, 1, 0, 0, 1, 1,
-0.1001586, 0.8238057, 0.524445, 0, 0, 0, 1, 1,
-0.09982074, 0.7677482, -0.9083642, 0, 0, 0, 1, 1,
-0.09281466, 0.6226478, 2.114278, 0, 0, 0, 1, 1,
-0.09007543, -0.3388489, -0.5512169, 0, 0, 0, 1, 1,
-0.08941016, 0.3598818, -0.7682241, 0, 0, 0, 1, 1,
-0.08768575, -0.5489984, -2.616693, 0, 0, 0, 1, 1,
-0.08384664, 0.7496982, 0.02840993, 0, 0, 0, 1, 1,
-0.0794289, -0.8332863, -3.966518, 1, 1, 1, 1, 1,
-0.07833645, 0.09311806, -0.9144985, 1, 1, 1, 1, 1,
-0.0759525, 0.197171, -2.542733, 1, 1, 1, 1, 1,
-0.07448091, -1.29169, -2.513404, 1, 1, 1, 1, 1,
-0.07228871, 0.1873516, -0.2689295, 1, 1, 1, 1, 1,
-0.07126564, -0.2357329, -3.094604, 1, 1, 1, 1, 1,
-0.06819256, 0.1884639, -0.8751789, 1, 1, 1, 1, 1,
-0.0678004, -0.4240946, -4.315343, 1, 1, 1, 1, 1,
-0.06725231, 0.4564699, -0.3221664, 1, 1, 1, 1, 1,
-0.06499549, 0.901085, 0.5599836, 1, 1, 1, 1, 1,
-0.05648296, -0.0180175, -0.8132613, 1, 1, 1, 1, 1,
-0.0564759, 1.590722, -2.201802, 1, 1, 1, 1, 1,
-0.05323458, 0.8277788, -1.262168, 1, 1, 1, 1, 1,
-0.05053269, 1.291396, -0.01381191, 1, 1, 1, 1, 1,
-0.0478039, 0.8689222, -0.1367989, 1, 1, 1, 1, 1,
-0.04724654, -0.3104366, -0.9265826, 0, 0, 1, 1, 1,
-0.04657954, 0.9181833, 0.7562585, 1, 0, 0, 1, 1,
-0.04165397, 0.7447687, 0.1525631, 1, 0, 0, 1, 1,
-0.04000476, -0.3930112, -3.851928, 1, 0, 0, 1, 1,
-0.03606852, 0.2778617, -1.037077, 1, 0, 0, 1, 1,
-0.03510714, 0.4686925, -1.140134, 1, 0, 0, 1, 1,
-0.03066957, -2.184012, -3.78933, 0, 0, 0, 1, 1,
-0.02657118, 1.824835, 0.6789025, 0, 0, 0, 1, 1,
-0.0231771, 0.2068623, 0.3475565, 0, 0, 0, 1, 1,
-0.02133641, -0.01972005, -1.763813, 0, 0, 0, 1, 1,
-0.01928161, -0.03002063, -3.986009, 0, 0, 0, 1, 1,
-0.01412774, 0.4025319, -0.2710995, 0, 0, 0, 1, 1,
-0.01105779, 1.508115, -0.7421001, 0, 0, 0, 1, 1,
-0.005950763, -0.922196, -2.81408, 1, 1, 1, 1, 1,
0.004093304, -1.481722, 2.583052, 1, 1, 1, 1, 1,
0.01084877, 0.4964707, -0.6146327, 1, 1, 1, 1, 1,
0.01971305, 0.5323232, 1.912696, 1, 1, 1, 1, 1,
0.0217361, 1.55893, 1.435483, 1, 1, 1, 1, 1,
0.02525477, -0.5250117, 3.077694, 1, 1, 1, 1, 1,
0.03194275, -0.7806172, 4.490962, 1, 1, 1, 1, 1,
0.0336632, 0.2864357, -0.07592147, 1, 1, 1, 1, 1,
0.03468318, -1.32648, 3.016552, 1, 1, 1, 1, 1,
0.03491971, -0.2064876, 2.77145, 1, 1, 1, 1, 1,
0.03763748, -0.3732159, 3.570933, 1, 1, 1, 1, 1,
0.03893251, -0.4062395, 2.320687, 1, 1, 1, 1, 1,
0.04018056, 0.7166271, -0.5917355, 1, 1, 1, 1, 1,
0.04177874, 0.98108, 0.02662432, 1, 1, 1, 1, 1,
0.04996707, 1.663237, 0.4024889, 1, 1, 1, 1, 1,
0.05028717, 0.5193946, 0.05970944, 0, 0, 1, 1, 1,
0.0513966, 0.4858886, 0.760885, 1, 0, 0, 1, 1,
0.05426973, -1.043619, 1.844499, 1, 0, 0, 1, 1,
0.05851753, 1.623138, -2.307848, 1, 0, 0, 1, 1,
0.06275518, 0.5486786, -0.833299, 1, 0, 0, 1, 1,
0.06352457, 1.223049, 0.6840972, 1, 0, 0, 1, 1,
0.06806158, -0.1743562, 1.088975, 0, 0, 0, 1, 1,
0.06957229, 1.460129, 0.8026565, 0, 0, 0, 1, 1,
0.07438415, -0.8721818, 3.063185, 0, 0, 0, 1, 1,
0.07732417, -0.5372776, 2.049097, 0, 0, 0, 1, 1,
0.07751417, 0.65711, 0.2137677, 0, 0, 0, 1, 1,
0.07940263, -0.5234696, 4.768198, 0, 0, 0, 1, 1,
0.08033817, -0.5763035, 2.838749, 0, 0, 0, 1, 1,
0.08841766, 0.3428698, -0.2123297, 1, 1, 1, 1, 1,
0.09071603, 1.805963, -1.121884, 1, 1, 1, 1, 1,
0.09743692, -2.559064, 2.013525, 1, 1, 1, 1, 1,
0.09859316, 0.2658103, 0.7777249, 1, 1, 1, 1, 1,
0.1014752, -0.2273592, 1.88485, 1, 1, 1, 1, 1,
0.1033746, 0.678637, -1.801176, 1, 1, 1, 1, 1,
0.1036619, 0.02675284, 0.4358476, 1, 1, 1, 1, 1,
0.1067981, 1.461313, 1.225367, 1, 1, 1, 1, 1,
0.1080792, -0.9773338, 2.322615, 1, 1, 1, 1, 1,
0.1087535, -0.6618457, 4.300414, 1, 1, 1, 1, 1,
0.112411, 0.739175, -2.275649, 1, 1, 1, 1, 1,
0.1128621, -1.539278, 4.068127, 1, 1, 1, 1, 1,
0.1141263, 0.5719597, 1.979159, 1, 1, 1, 1, 1,
0.1199496, 2.216769, 0.9752699, 1, 1, 1, 1, 1,
0.123279, -0.4799546, 2.211579, 1, 1, 1, 1, 1,
0.1291761, -1.158402, 2.326756, 0, 0, 1, 1, 1,
0.1306963, 0.3231432, 1.312125, 1, 0, 0, 1, 1,
0.1322916, -1.770199, 4.124435, 1, 0, 0, 1, 1,
0.1330933, 1.333812, 0.6831144, 1, 0, 0, 1, 1,
0.1345129, -1.228242, 3.43261, 1, 0, 0, 1, 1,
0.1387889, 2.087994, 0.1774699, 1, 0, 0, 1, 1,
0.1437368, -0.0390434, 1.952565, 0, 0, 0, 1, 1,
0.1447118, 0.5991105, 0.1366713, 0, 0, 0, 1, 1,
0.1455498, 1.459562, 0.4227809, 0, 0, 0, 1, 1,
0.1487283, 1.071447, -0.5661711, 0, 0, 0, 1, 1,
0.1513078, 0.2451674, 0.1070674, 0, 0, 0, 1, 1,
0.1564776, -1.144622, 3.684222, 0, 0, 0, 1, 1,
0.15708, 0.5659206, -0.8457122, 0, 0, 0, 1, 1,
0.1632723, -1.156041, 3.075772, 1, 1, 1, 1, 1,
0.1636122, 0.04003229, 1.583331, 1, 1, 1, 1, 1,
0.168973, 1.033027, 0.7826765, 1, 1, 1, 1, 1,
0.1713018, 1.028242, 0.6719851, 1, 1, 1, 1, 1,
0.1726913, -0.8777289, 1.784701, 1, 1, 1, 1, 1,
0.1734551, -1.259577, 3.866925, 1, 1, 1, 1, 1,
0.174859, 1.40451, -0.4257004, 1, 1, 1, 1, 1,
0.1764603, -1.614058, 3.49391, 1, 1, 1, 1, 1,
0.178874, -0.6201639, 4.023109, 1, 1, 1, 1, 1,
0.1865867, 0.2342822, -0.4191275, 1, 1, 1, 1, 1,
0.1881614, 0.664485, 0.4842727, 1, 1, 1, 1, 1,
0.1887334, -0.4840904, 4.273016, 1, 1, 1, 1, 1,
0.1894957, 0.4512291, -0.4818251, 1, 1, 1, 1, 1,
0.1917305, 0.04781481, 1.988861, 1, 1, 1, 1, 1,
0.1917565, 1.588046, 0.1748546, 1, 1, 1, 1, 1,
0.1919507, -0.1099164, 1.618673, 0, 0, 1, 1, 1,
0.1928985, 3.088663, 0.7135448, 1, 0, 0, 1, 1,
0.1952154, -0.3543111, 1.025381, 1, 0, 0, 1, 1,
0.195697, 0.5936877, 0.6948733, 1, 0, 0, 1, 1,
0.1975813, 0.1356367, -0.07471001, 1, 0, 0, 1, 1,
0.2021022, -1.573208, 3.011513, 1, 0, 0, 1, 1,
0.2021296, 0.8809677, 1.504643, 0, 0, 0, 1, 1,
0.2031281, 0.1352541, -0.483085, 0, 0, 0, 1, 1,
0.2093868, 0.1031104, 0.6174459, 0, 0, 0, 1, 1,
0.2126392, -0.8230404, 2.08598, 0, 0, 0, 1, 1,
0.2127754, -0.5742249, 1.444695, 0, 0, 0, 1, 1,
0.2130045, 1.062436, -0.2704654, 0, 0, 0, 1, 1,
0.2137586, 0.2333512, 0.6063267, 0, 0, 0, 1, 1,
0.2140367, 0.3013759, 1.050375, 1, 1, 1, 1, 1,
0.2163201, -0.4331871, 3.568888, 1, 1, 1, 1, 1,
0.2165926, -0.4061794, 2.711516, 1, 1, 1, 1, 1,
0.2173697, 0.6530371, 0.4712832, 1, 1, 1, 1, 1,
0.2203522, 0.3099325, 0.8130916, 1, 1, 1, 1, 1,
0.2209259, 1.123778, 1.353089, 1, 1, 1, 1, 1,
0.2213482, -0.1206599, 1.66199, 1, 1, 1, 1, 1,
0.2218217, -0.296673, 2.164998, 1, 1, 1, 1, 1,
0.2218602, 0.03548762, 1.893592, 1, 1, 1, 1, 1,
0.2234221, -1.206491, 5.14034, 1, 1, 1, 1, 1,
0.2246839, -0.1385446, 2.30728, 1, 1, 1, 1, 1,
0.225831, 0.5597408, -0.1839579, 1, 1, 1, 1, 1,
0.2264429, -1.424534, 3.447179, 1, 1, 1, 1, 1,
0.2386073, -0.3132373, -0.595255, 1, 1, 1, 1, 1,
0.23973, 1.726688, -0.8734892, 1, 1, 1, 1, 1,
0.2424206, -0.5214829, 1.497389, 0, 0, 1, 1, 1,
0.2434035, 1.478677, 0.4696145, 1, 0, 0, 1, 1,
0.2467517, -0.9817256, 3.155497, 1, 0, 0, 1, 1,
0.2486867, -0.252343, 1.426032, 1, 0, 0, 1, 1,
0.2580548, 0.07182491, 0.4896348, 1, 0, 0, 1, 1,
0.2678123, -0.3370617, 3.661917, 1, 0, 0, 1, 1,
0.2694238, -0.3132996, 2.926278, 0, 0, 0, 1, 1,
0.2739174, -0.6319094, 0.9931973, 0, 0, 0, 1, 1,
0.2756438, 0.6663538, -0.1962823, 0, 0, 0, 1, 1,
0.2763663, 0.9992701, 0.7635102, 0, 0, 0, 1, 1,
0.2784878, 0.139727, -0.9923696, 0, 0, 0, 1, 1,
0.2793406, -1.397218, 4.26778, 0, 0, 0, 1, 1,
0.282101, 0.7668582, 1.408825, 0, 0, 0, 1, 1,
0.2827615, -0.4068242, 2.504715, 1, 1, 1, 1, 1,
0.2831861, 1.482637, 1.771059, 1, 1, 1, 1, 1,
0.2836871, 0.5952321, 0.9895651, 1, 1, 1, 1, 1,
0.2869949, 2.486573, -0.3745589, 1, 1, 1, 1, 1,
0.2891552, 0.02129389, 1.490526, 1, 1, 1, 1, 1,
0.2901212, -0.703897, 4.792111, 1, 1, 1, 1, 1,
0.2908343, -0.1582341, 1.840537, 1, 1, 1, 1, 1,
0.2915039, -0.1510633, -0.01510066, 1, 1, 1, 1, 1,
0.2921114, -0.7986109, 3.290739, 1, 1, 1, 1, 1,
0.2963274, -0.2155962, 2.793772, 1, 1, 1, 1, 1,
0.2978611, 1.375857, 0.5070303, 1, 1, 1, 1, 1,
0.2984339, -0.8039619, 2.487947, 1, 1, 1, 1, 1,
0.2987214, 0.8807111, 0.1526945, 1, 1, 1, 1, 1,
0.3003361, -2.378452, 3.490458, 1, 1, 1, 1, 1,
0.3028133, -0.3633476, 1.992274, 1, 1, 1, 1, 1,
0.3078152, 1.07923, -0.1594508, 0, 0, 1, 1, 1,
0.3082386, 0.7344804, 0.7116479, 1, 0, 0, 1, 1,
0.3136938, -0.491104, 3.430909, 1, 0, 0, 1, 1,
0.3153095, -0.1454382, 3.399568, 1, 0, 0, 1, 1,
0.317751, -0.8448428, 5.47433, 1, 0, 0, 1, 1,
0.3211347, -0.6773749, 3.930152, 1, 0, 0, 1, 1,
0.3216784, 0.271694, 1.481312, 0, 0, 0, 1, 1,
0.3272048, -0.629218, 4.36541, 0, 0, 0, 1, 1,
0.32845, -1.12323, 4.185341, 0, 0, 0, 1, 1,
0.328779, -0.8049179, 2.443438, 0, 0, 0, 1, 1,
0.3294294, -0.06693079, -0.275128, 0, 0, 0, 1, 1,
0.3312667, -1.08537, 2.154667, 0, 0, 0, 1, 1,
0.3355116, 0.5105724, 0.4935363, 0, 0, 0, 1, 1,
0.3358336, -0.2573215, 2.320725, 1, 1, 1, 1, 1,
0.3374738, 0.5730753, 1.254929, 1, 1, 1, 1, 1,
0.3437501, -0.2663746, 2.582618, 1, 1, 1, 1, 1,
0.3463491, 0.5784196, 0.5857273, 1, 1, 1, 1, 1,
0.3476948, -0.3681284, 4.818821, 1, 1, 1, 1, 1,
0.3505304, -2.967956, 3.140659, 1, 1, 1, 1, 1,
0.3528259, -0.4034298, 1.37141, 1, 1, 1, 1, 1,
0.3553694, 0.1222571, 0.7111866, 1, 1, 1, 1, 1,
0.3571069, 0.4377849, 1.667511, 1, 1, 1, 1, 1,
0.3586192, -1.236986, 3.488015, 1, 1, 1, 1, 1,
0.3629785, 0.07451126, 1.509645, 1, 1, 1, 1, 1,
0.3636038, -1.03392, 2.916658, 1, 1, 1, 1, 1,
0.3656538, 0.04819075, 1.278291, 1, 1, 1, 1, 1,
0.3669758, 0.2871778, 0.4048177, 1, 1, 1, 1, 1,
0.367321, 0.7253776, -0.2326795, 1, 1, 1, 1, 1,
0.3708694, -2.972163, 4.586293, 0, 0, 1, 1, 1,
0.3739878, 0.7994666, -0.2164462, 1, 0, 0, 1, 1,
0.375292, 0.5184747, 0.3726109, 1, 0, 0, 1, 1,
0.3756048, 1.521986, 0.5737, 1, 0, 0, 1, 1,
0.3776689, -0.7244778, 1.738411, 1, 0, 0, 1, 1,
0.3820328, -0.2319896, 2.149451, 1, 0, 0, 1, 1,
0.3820941, 0.06764672, 1.301243, 0, 0, 0, 1, 1,
0.3827329, -0.636429, 1.260354, 0, 0, 0, 1, 1,
0.3838704, 0.68779, -0.7699758, 0, 0, 0, 1, 1,
0.3851602, 1.616343, -0.9197177, 0, 0, 0, 1, 1,
0.388464, 1.240988, 0.118251, 0, 0, 0, 1, 1,
0.3920413, 0.3181542, 0.3674852, 0, 0, 0, 1, 1,
0.3931655, 0.648239, 1.594542, 0, 0, 0, 1, 1,
0.4007711, 0.4454665, -1.900744, 1, 1, 1, 1, 1,
0.4058748, -0.2551221, 1.442046, 1, 1, 1, 1, 1,
0.4126149, 1.348487, 1.623845, 1, 1, 1, 1, 1,
0.4130711, 1.236064, 1.262069, 1, 1, 1, 1, 1,
0.4150755, 0.8527456, 0.2128928, 1, 1, 1, 1, 1,
0.4223389, 0.08483589, -2.067846, 1, 1, 1, 1, 1,
0.424732, -0.8831103, 2.756407, 1, 1, 1, 1, 1,
0.4257501, 1.759396, -0.7241747, 1, 1, 1, 1, 1,
0.4291774, 0.6010725, 2.428285, 1, 1, 1, 1, 1,
0.4294537, 0.09068538, 1.055226, 1, 1, 1, 1, 1,
0.4312559, -0.4739859, 3.263569, 1, 1, 1, 1, 1,
0.4317057, -2.529307, 1.797422, 1, 1, 1, 1, 1,
0.4335552, 0.9482675, 0.37851, 1, 1, 1, 1, 1,
0.4384837, -0.289796, 3.412085, 1, 1, 1, 1, 1,
0.4391084, 0.6975691, 0.6118465, 1, 1, 1, 1, 1,
0.440174, -0.09008013, 0.3818574, 0, 0, 1, 1, 1,
0.4417749, 0.2462551, 1.43571, 1, 0, 0, 1, 1,
0.4433901, -1.712598, 1.977404, 1, 0, 0, 1, 1,
0.4457411, -1.115631, 2.608294, 1, 0, 0, 1, 1,
0.4508433, 1.837483, -0.5351229, 1, 0, 0, 1, 1,
0.4529853, -0.7827227, 3.249355, 1, 0, 0, 1, 1,
0.4596246, 0.5192894, -0.5774666, 0, 0, 0, 1, 1,
0.4596574, -0.9627556, 0.6003545, 0, 0, 0, 1, 1,
0.4608134, 0.6987805, 1.163216, 0, 0, 0, 1, 1,
0.4618869, -0.7604052, 2.963324, 0, 0, 0, 1, 1,
0.4669816, -1.180267, 2.615934, 0, 0, 0, 1, 1,
0.4729581, -1.747518, 3.250749, 0, 0, 0, 1, 1,
0.4736353, -0.563675, 3.299789, 0, 0, 0, 1, 1,
0.4749516, 0.06531557, 1.608215, 1, 1, 1, 1, 1,
0.4785896, -0.5573293, 1.735634, 1, 1, 1, 1, 1,
0.4794615, 0.2941112, 0.94573, 1, 1, 1, 1, 1,
0.4849513, -0.05295006, 2.817635, 1, 1, 1, 1, 1,
0.4851146, -0.3870368, 0.7909145, 1, 1, 1, 1, 1,
0.485145, -0.9388953, 1.851477, 1, 1, 1, 1, 1,
0.4878488, 0.5689002, 1.457782, 1, 1, 1, 1, 1,
0.4895794, -0.2889578, 1.67254, 1, 1, 1, 1, 1,
0.4903041, -0.6594456, 1.73305, 1, 1, 1, 1, 1,
0.4920653, 0.1297459, 1.866567, 1, 1, 1, 1, 1,
0.4963817, 0.8297347, -0.006218699, 1, 1, 1, 1, 1,
0.4969278, 0.8032153, -0.388255, 1, 1, 1, 1, 1,
0.5019606, 0.4363182, 0.1060377, 1, 1, 1, 1, 1,
0.5067076, -1.353469, 4.45056, 1, 1, 1, 1, 1,
0.5101263, -1.512941, 3.022298, 1, 1, 1, 1, 1,
0.5126877, -0.5401408, 4.202313, 0, 0, 1, 1, 1,
0.5187287, -0.7235007, 2.063311, 1, 0, 0, 1, 1,
0.5219039, -0.7114627, 2.298686, 1, 0, 0, 1, 1,
0.5225685, 0.4535656, -0.6528786, 1, 0, 0, 1, 1,
0.5238148, 0.2505332, 0.6499401, 1, 0, 0, 1, 1,
0.5276384, -1.589781, 3.944944, 1, 0, 0, 1, 1,
0.5331212, 1.334971, 0.4336222, 0, 0, 0, 1, 1,
0.5333129, 0.1487745, 2.311383, 0, 0, 0, 1, 1,
0.5335154, -0.4355283, 1.519832, 0, 0, 0, 1, 1,
0.5367905, -0.635769, 2.933872, 0, 0, 0, 1, 1,
0.5391653, 0.3521641, 1.1367, 0, 0, 0, 1, 1,
0.5400909, 0.2223223, 1.497475, 0, 0, 0, 1, 1,
0.545268, 0.5575232, 1.286491, 0, 0, 0, 1, 1,
0.5504104, 0.7757641, 0.07003858, 1, 1, 1, 1, 1,
0.5507737, 1.169636, 0.9719095, 1, 1, 1, 1, 1,
0.553405, 0.764115, -2.227828, 1, 1, 1, 1, 1,
0.5616801, -0.5264066, 2.732367, 1, 1, 1, 1, 1,
0.5621647, 0.155975, 1.580613, 1, 1, 1, 1, 1,
0.5648273, 0.07369678, 2.007292, 1, 1, 1, 1, 1,
0.5670146, -0.7076957, 3.052731, 1, 1, 1, 1, 1,
0.5692128, 0.5310802, 1.130926, 1, 1, 1, 1, 1,
0.5733816, 0.1882815, 0.4615479, 1, 1, 1, 1, 1,
0.5737486, 0.1491259, 0.3293201, 1, 1, 1, 1, 1,
0.5773262, -0.3424252, -0.09233534, 1, 1, 1, 1, 1,
0.5806678, -1.524203, 2.660736, 1, 1, 1, 1, 1,
0.5836481, 1.079233, 0.4825387, 1, 1, 1, 1, 1,
0.5891726, -0.4320223, 2.374406, 1, 1, 1, 1, 1,
0.5912223, -1.339959, 0.8516502, 1, 1, 1, 1, 1,
0.5937457, 0.3369427, 0.6406951, 0, 0, 1, 1, 1,
0.5985439, -1.243946, 2.381169, 1, 0, 0, 1, 1,
0.5997491, 1.6773, 0.5718035, 1, 0, 0, 1, 1,
0.6115977, 1.719262, 1.418087, 1, 0, 0, 1, 1,
0.6158094, -0.1869546, 2.376336, 1, 0, 0, 1, 1,
0.6177168, 0.8282718, 0.8998771, 1, 0, 0, 1, 1,
0.6190102, -1.697458, 2.80719, 0, 0, 0, 1, 1,
0.6221107, -1.762811, 3.78324, 0, 0, 0, 1, 1,
0.6283334, 0.7968397, -0.2852875, 0, 0, 0, 1, 1,
0.6285936, 0.4619373, 0.5469451, 0, 0, 0, 1, 1,
0.6293071, -0.3495425, 1.418546, 0, 0, 0, 1, 1,
0.6312085, 0.9188974, -0.2786397, 0, 0, 0, 1, 1,
0.642726, 0.1282932, 1.86284, 0, 0, 0, 1, 1,
0.6461799, -1.102265, 2.726279, 1, 1, 1, 1, 1,
0.6463755, -0.3404723, 2.800952, 1, 1, 1, 1, 1,
0.6488608, 0.4412159, 1.443185, 1, 1, 1, 1, 1,
0.6511714, 0.5139181, 1.46662, 1, 1, 1, 1, 1,
0.6532185, -0.8279368, 2.012666, 1, 1, 1, 1, 1,
0.6537554, -0.7797665, 1.276378, 1, 1, 1, 1, 1,
0.6558456, -0.2779562, 1.928618, 1, 1, 1, 1, 1,
0.6619388, 0.004080158, 1.347892, 1, 1, 1, 1, 1,
0.6718021, -0.1620883, 4.049545, 1, 1, 1, 1, 1,
0.6742138, 0.3593612, 1.047225, 1, 1, 1, 1, 1,
0.6776346, 0.6713188, 0.9631813, 1, 1, 1, 1, 1,
0.6811386, 0.02555011, 0.4809157, 1, 1, 1, 1, 1,
0.6850495, 0.953324, 1.125827, 1, 1, 1, 1, 1,
0.68936, -0.05598177, 2.520892, 1, 1, 1, 1, 1,
0.6922776, 0.7461368, 1.263093, 1, 1, 1, 1, 1,
0.6945534, -1.022986, 3.288073, 0, 0, 1, 1, 1,
0.6980755, 0.522217, 1.302086, 1, 0, 0, 1, 1,
0.7022185, 0.6593794, 1.946575, 1, 0, 0, 1, 1,
0.7050497, 0.2389603, 1.771633, 1, 0, 0, 1, 1,
0.7121836, -1.275155, 2.58668, 1, 0, 0, 1, 1,
0.7125333, -1.184759, 2.319327, 1, 0, 0, 1, 1,
0.71723, -0.36817, 1.491779, 0, 0, 0, 1, 1,
0.718133, 0.06527188, 0.8645908, 0, 0, 0, 1, 1,
0.7190605, 0.4613315, -0.1662363, 0, 0, 0, 1, 1,
0.7226037, -0.3865899, 1.58351, 0, 0, 0, 1, 1,
0.7240936, 0.0272276, 2.269865, 0, 0, 0, 1, 1,
0.7275111, 0.7611892, 0.2937885, 0, 0, 0, 1, 1,
0.7338974, 0.5419475, 2.519719, 0, 0, 0, 1, 1,
0.7372652, 1.952392, 0.7861469, 1, 1, 1, 1, 1,
0.7373021, 0.2880984, 1.689425, 1, 1, 1, 1, 1,
0.7382638, 1.539546, -0.4148471, 1, 1, 1, 1, 1,
0.7443272, 1.355162, 0.5176178, 1, 1, 1, 1, 1,
0.7473303, 1.821504, 0.4817457, 1, 1, 1, 1, 1,
0.7478001, 0.1544949, 0.356236, 1, 1, 1, 1, 1,
0.7484378, -0.03244909, 2.465271, 1, 1, 1, 1, 1,
0.7546389, -0.1575054, 1.089191, 1, 1, 1, 1, 1,
0.7556014, 0.5982253, 2.598741, 1, 1, 1, 1, 1,
0.7561483, -0.3866131, 1.113302, 1, 1, 1, 1, 1,
0.7578236, 1.729266, 0.006518967, 1, 1, 1, 1, 1,
0.7589833, -0.3596649, 2.917499, 1, 1, 1, 1, 1,
0.7609365, 0.5270624, -0.2837356, 1, 1, 1, 1, 1,
0.765292, -0.01970602, 1.088571, 1, 1, 1, 1, 1,
0.7705005, 1.311693, 0.1861041, 1, 1, 1, 1, 1,
0.7738609, 1.09397, 1.421795, 0, 0, 1, 1, 1,
0.776118, 1.251566, 0.8786653, 1, 0, 0, 1, 1,
0.7887324, 0.8459557, -0.7966869, 1, 0, 0, 1, 1,
0.7999209, -2.398662, 1.942502, 1, 0, 0, 1, 1,
0.8014936, -0.2585338, 2.081402, 1, 0, 0, 1, 1,
0.8024254, 0.1593055, 2.533957, 1, 0, 0, 1, 1,
0.8036104, -0.008259149, 0.6109707, 0, 0, 0, 1, 1,
0.8081021, -0.7301424, 4.028738, 0, 0, 0, 1, 1,
0.8088349, -0.4441969, 2.883271, 0, 0, 0, 1, 1,
0.812564, 1.604901, -0.3186478, 0, 0, 0, 1, 1,
0.8140705, 1.02589, 1.220065, 0, 0, 0, 1, 1,
0.8160323, 1.168523, 1.399845, 0, 0, 0, 1, 1,
0.8165469, 0.01609636, 2.52687, 0, 0, 0, 1, 1,
0.8186316, 1.03717, 0.7893394, 1, 1, 1, 1, 1,
0.8190987, 1.680516, 0.4863476, 1, 1, 1, 1, 1,
0.8194948, -1.839124, 1.802583, 1, 1, 1, 1, 1,
0.8217073, -0.3260232, 1.225822, 1, 1, 1, 1, 1,
0.8399022, 0.2850804, 1.265887, 1, 1, 1, 1, 1,
0.8451701, 1.062428, 0.7417675, 1, 1, 1, 1, 1,
0.8465885, 1.115285, -0.006545933, 1, 1, 1, 1, 1,
0.8480756, 0.4704578, 0.647019, 1, 1, 1, 1, 1,
0.8530095, 1.167085, 0.6280509, 1, 1, 1, 1, 1,
0.8564526, -0.8436244, 2.834483, 1, 1, 1, 1, 1,
0.8578922, -0.1040296, 1.127224, 1, 1, 1, 1, 1,
0.8694509, -0.7155734, 3.629729, 1, 1, 1, 1, 1,
0.8878292, -0.3020662, 2.384344, 1, 1, 1, 1, 1,
0.8921252, -1.43283, 4.109914, 1, 1, 1, 1, 1,
0.8950782, -1.192204, 2.795414, 1, 1, 1, 1, 1,
0.8997908, 0.9925714, 1.317028, 0, 0, 1, 1, 1,
0.9002285, -0.1307766, 1.645883, 1, 0, 0, 1, 1,
0.901188, -1.425645, 3.89982, 1, 0, 0, 1, 1,
0.9104017, -1.171692, 2.871339, 1, 0, 0, 1, 1,
0.9159467, 0.6486718, 1.901231, 1, 0, 0, 1, 1,
0.920256, -1.469954, 2.924598, 1, 0, 0, 1, 1,
0.9206776, 0.009268359, 2.064764, 0, 0, 0, 1, 1,
0.9259493, -1.428021, 2.623072, 0, 0, 0, 1, 1,
0.9262848, -2.50508, 0.9579468, 0, 0, 0, 1, 1,
0.927009, -0.9040844, 3.172038, 0, 0, 0, 1, 1,
0.9340975, -1.567894, 4.192691, 0, 0, 0, 1, 1,
0.9349914, -0.6007989, 3.521122, 0, 0, 0, 1, 1,
0.9384983, -0.7497835, 1.058992, 0, 0, 0, 1, 1,
0.9412546, -0.9202434, 2.930766, 1, 1, 1, 1, 1,
0.9459291, 1.617666, 0.221704, 1, 1, 1, 1, 1,
0.9566135, -0.933529, 2.660175, 1, 1, 1, 1, 1,
0.9610867, -0.3048073, 1.843917, 1, 1, 1, 1, 1,
0.9645686, 0.4074476, -0.09916909, 1, 1, 1, 1, 1,
0.9648358, -1.825031, 3.391928, 1, 1, 1, 1, 1,
0.9682586, -2.132962, 4.833139, 1, 1, 1, 1, 1,
0.9705895, 0.4068382, 0.7505121, 1, 1, 1, 1, 1,
0.9798238, 0.1626936, 2.16668, 1, 1, 1, 1, 1,
0.9812864, -0.168316, 1.459488, 1, 1, 1, 1, 1,
0.9882329, -0.7927386, 3.120206, 1, 1, 1, 1, 1,
0.9885445, -1.099368, 3.58314, 1, 1, 1, 1, 1,
0.9994913, 0.1796646, 2.253739, 1, 1, 1, 1, 1,
1.002127, -0.04434995, 2.028753, 1, 1, 1, 1, 1,
1.006758, 0.4577446, 1.459198, 1, 1, 1, 1, 1,
1.008512, -2.175087, 2.180712, 0, 0, 1, 1, 1,
1.010229, 1.11317, -0.03178885, 1, 0, 0, 1, 1,
1.010852, 1.032394, 0.7962147, 1, 0, 0, 1, 1,
1.019714, 0.7142867, 0.3986525, 1, 0, 0, 1, 1,
1.022561, 0.307504, 0.9140773, 1, 0, 0, 1, 1,
1.030401, -0.04858262, 1.458302, 1, 0, 0, 1, 1,
1.032148, 0.3080626, 0.5630378, 0, 0, 0, 1, 1,
1.033584, 1.280276, -0.1214719, 0, 0, 0, 1, 1,
1.058989, 0.01171379, 1.645343, 0, 0, 0, 1, 1,
1.059585, -0.2981857, 2.6362, 0, 0, 0, 1, 1,
1.077394, -1.322521, 2.616515, 0, 0, 0, 1, 1,
1.077588, -1.396492, 2.933846, 0, 0, 0, 1, 1,
1.085606, -0.8900509, 1.076141, 0, 0, 0, 1, 1,
1.099272, -0.5124524, 1.020549, 1, 1, 1, 1, 1,
1.101846, -1.405812, 2.858497, 1, 1, 1, 1, 1,
1.102933, 1.478795, -0.8854137, 1, 1, 1, 1, 1,
1.107946, -0.3495836, 0.1226066, 1, 1, 1, 1, 1,
1.109996, 1.703995, 1.181076, 1, 1, 1, 1, 1,
1.110313, 0.5539598, 1.225485, 1, 1, 1, 1, 1,
1.115593, -0.297729, 1.19404, 1, 1, 1, 1, 1,
1.120363, 0.1866981, 2.804347, 1, 1, 1, 1, 1,
1.128777, 0.2970193, 0.1349131, 1, 1, 1, 1, 1,
1.128814, 0.5304629, 1.546251, 1, 1, 1, 1, 1,
1.130162, -1.152642, 1.870519, 1, 1, 1, 1, 1,
1.14141, 0.4257952, 3.681259, 1, 1, 1, 1, 1,
1.151274, -0.6226965, 2.375147, 1, 1, 1, 1, 1,
1.153921, -0.8830067, 1.860635, 1, 1, 1, 1, 1,
1.155237, 0.3456252, -0.09882653, 1, 1, 1, 1, 1,
1.159579, 0.04775976, 1.046915, 0, 0, 1, 1, 1,
1.161944, -0.5644929, 1.352231, 1, 0, 0, 1, 1,
1.163137, -0.5640522, 2.790839, 1, 0, 0, 1, 1,
1.169916, -2.087728, 3.645122, 1, 0, 0, 1, 1,
1.178277, -0.7801183, 2.441644, 1, 0, 0, 1, 1,
1.180891, -0.7265873, 1.798802, 1, 0, 0, 1, 1,
1.205587, -0.8653401, 2.128123, 0, 0, 0, 1, 1,
1.225973, 0.8597435, -0.1537232, 0, 0, 0, 1, 1,
1.226734, -0.3686045, 1.433964, 0, 0, 0, 1, 1,
1.234269, 0.741667, 0.9043382, 0, 0, 0, 1, 1,
1.23471, 0.3552964, 0.4906229, 0, 0, 0, 1, 1,
1.240177, 1.293956, -0.09856535, 0, 0, 0, 1, 1,
1.244466, -0.1103888, 2.191721, 0, 0, 0, 1, 1,
1.264737, -0.2518218, 2.552104, 1, 1, 1, 1, 1,
1.26982, 0.03484497, 2.350322, 1, 1, 1, 1, 1,
1.269848, 0.1127243, -0.657333, 1, 1, 1, 1, 1,
1.278731, -0.08469287, 0.9259933, 1, 1, 1, 1, 1,
1.282809, 1.207117, 1.458827, 1, 1, 1, 1, 1,
1.287332, -1.356307, 3.573182, 1, 1, 1, 1, 1,
1.292143, -0.2122477, 2.124938, 1, 1, 1, 1, 1,
1.294424, -1.1776, 2.391958, 1, 1, 1, 1, 1,
1.304265, 0.530891, 0.3584215, 1, 1, 1, 1, 1,
1.306569, -0.8970046, 2.344008, 1, 1, 1, 1, 1,
1.315154, 0.08664916, 1.454984, 1, 1, 1, 1, 1,
1.324703, 0.08928286, 1.102034, 1, 1, 1, 1, 1,
1.336677, -0.042105, 0.6303869, 1, 1, 1, 1, 1,
1.356181, -0.03984038, 1.698128, 1, 1, 1, 1, 1,
1.358787, -0.4299799, 1.800406, 1, 1, 1, 1, 1,
1.385392, -0.83464, 1.109671, 0, 0, 1, 1, 1,
1.402056, 0.1413823, 1.044713, 1, 0, 0, 1, 1,
1.407088, 1.043337, 2.176693, 1, 0, 0, 1, 1,
1.412848, 1.424676, 1.162386, 1, 0, 0, 1, 1,
1.418854, -0.5295749, 1.082478, 1, 0, 0, 1, 1,
1.432147, -1.335275, 1.54255, 1, 0, 0, 1, 1,
1.43459, -1.236799, 2.394831, 0, 0, 0, 1, 1,
1.454876, 3.435879, 2.121727, 0, 0, 0, 1, 1,
1.461541, 1.7842, 0.7751228, 0, 0, 0, 1, 1,
1.463942, 0.05181531, 2.542191, 0, 0, 0, 1, 1,
1.470971, -0.6041111, 1.607681, 0, 0, 0, 1, 1,
1.473142, 0.9021928, 0.4071842, 0, 0, 0, 1, 1,
1.479737, 0.2014583, 2.688848, 0, 0, 0, 1, 1,
1.486951, 0.3989846, 0.8420172, 1, 1, 1, 1, 1,
1.489763, -1.029496, 3.005424, 1, 1, 1, 1, 1,
1.493778, -0.6553964, 2.434775, 1, 1, 1, 1, 1,
1.497107, -0.009666641, 2.211963, 1, 1, 1, 1, 1,
1.49768, -0.1401465, 0.6638066, 1, 1, 1, 1, 1,
1.50181, 0.3453269, 0.6726722, 1, 1, 1, 1, 1,
1.503469, 1.384928, -0.2539242, 1, 1, 1, 1, 1,
1.511817, 0.8628164, 0.2715002, 1, 1, 1, 1, 1,
1.514197, 0.1891312, 0.6867, 1, 1, 1, 1, 1,
1.51871, 0.2817126, 1.185636, 1, 1, 1, 1, 1,
1.524322, 0.06552067, -0.4969113, 1, 1, 1, 1, 1,
1.529396, 1.836213, 0.3430787, 1, 1, 1, 1, 1,
1.532889, -0.5876273, 1.352542, 1, 1, 1, 1, 1,
1.540401, -0.3022807, 1.393393, 1, 1, 1, 1, 1,
1.542128, 0.7999232, 0.1433011, 1, 1, 1, 1, 1,
1.542314, 0.2325099, 2.544739, 0, 0, 1, 1, 1,
1.549897, -1.250687, 2.550307, 1, 0, 0, 1, 1,
1.555609, -0.7652537, 2.11229, 1, 0, 0, 1, 1,
1.557179, 0.06928411, 0.4477754, 1, 0, 0, 1, 1,
1.566354, -1.029815, 1.556036, 1, 0, 0, 1, 1,
1.566678, 0.1251443, 1.623108, 1, 0, 0, 1, 1,
1.570992, -0.8702039, 1.930048, 0, 0, 0, 1, 1,
1.579213, 0.4843819, 0.2146241, 0, 0, 0, 1, 1,
1.595355, -0.08970193, 2.077189, 0, 0, 0, 1, 1,
1.595998, -1.236995, 0.3905182, 0, 0, 0, 1, 1,
1.615214, 0.8368936, 1.859853, 0, 0, 0, 1, 1,
1.615808, -0.7807294, 1.570137, 0, 0, 0, 1, 1,
1.636274, 0.4610956, 1.093276, 0, 0, 0, 1, 1,
1.637785, -0.2753708, 1.079643, 1, 1, 1, 1, 1,
1.637816, 0.4315823, 2.507598, 1, 1, 1, 1, 1,
1.647681, 1.196091, 1.582385, 1, 1, 1, 1, 1,
1.656049, 0.5562129, 1.178011, 1, 1, 1, 1, 1,
1.656291, 1.693823, 1.871894, 1, 1, 1, 1, 1,
1.664645, -0.9073871, 3.313837, 1, 1, 1, 1, 1,
1.666057, 1.721931, 0.001490607, 1, 1, 1, 1, 1,
1.667333, 1.880948, 0.3677786, 1, 1, 1, 1, 1,
1.671709, 1.848609, 0.5767089, 1, 1, 1, 1, 1,
1.698202, 0.8060182, 3.214776, 1, 1, 1, 1, 1,
1.700885, 1.154785, 1.809951, 1, 1, 1, 1, 1,
1.701727, -0.1085198, 1.804942, 1, 1, 1, 1, 1,
1.70339, -0.6459781, 1.180901, 1, 1, 1, 1, 1,
1.728769, 1.115256, 0.2641731, 1, 1, 1, 1, 1,
1.738015, -0.9093648, 1.037367, 1, 1, 1, 1, 1,
1.74581, -0.8732294, 2.663567, 0, 0, 1, 1, 1,
1.746844, -0.3185128, 2.655812, 1, 0, 0, 1, 1,
1.757861, 0.6303838, -0.5014109, 1, 0, 0, 1, 1,
1.758533, -0.2149183, -0.1820641, 1, 0, 0, 1, 1,
1.76992, 0.1223805, 1.833044, 1, 0, 0, 1, 1,
1.794095, -0.3148875, 2.667157, 1, 0, 0, 1, 1,
1.796978, 0.145391, 2.014775, 0, 0, 0, 1, 1,
1.834699, 1.799612, 2.063181, 0, 0, 0, 1, 1,
1.846871, 0.7345282, 0.9617584, 0, 0, 0, 1, 1,
1.858518, -0.8314357, 1.792207, 0, 0, 0, 1, 1,
1.866799, 1.874015, 1.489084, 0, 0, 0, 1, 1,
1.879256, 0.40463, 2.32895, 0, 0, 0, 1, 1,
1.880375, -0.158987, 2.498503, 0, 0, 0, 1, 1,
1.927617, -1.24253, 2.214916, 1, 1, 1, 1, 1,
1.947526, 1.38193, -0.4323661, 1, 1, 1, 1, 1,
1.95615, -0.5756429, 1.681637, 1, 1, 1, 1, 1,
1.968478, -0.05543845, 0.6916419, 1, 1, 1, 1, 1,
1.983392, -0.9583122, 1.01453, 1, 1, 1, 1, 1,
1.993007, -0.5549573, 1.956689, 1, 1, 1, 1, 1,
2.022995, 1.404314, 0.6340376, 1, 1, 1, 1, 1,
2.055162, 0.5649986, 3.418719, 1, 1, 1, 1, 1,
2.06203, 1.114355, -0.1260747, 1, 1, 1, 1, 1,
2.071837, 1.95675, 1.11651, 1, 1, 1, 1, 1,
2.072598, 0.5066082, 2.628309, 1, 1, 1, 1, 1,
2.073352, 0.8205746, 1.409477, 1, 1, 1, 1, 1,
2.080999, 0.2063078, 2.482985, 1, 1, 1, 1, 1,
2.108334, -0.5391529, 3.295053, 1, 1, 1, 1, 1,
2.125893, 0.3179742, 2.357034, 1, 1, 1, 1, 1,
2.126941, 0.3452352, 0.4192212, 0, 0, 1, 1, 1,
2.145248, 0.4389287, 3.341313, 1, 0, 0, 1, 1,
2.172563, -0.2231233, 2.389338, 1, 0, 0, 1, 1,
2.174911, -0.7043524, 0.3094597, 1, 0, 0, 1, 1,
2.191974, 0.2306522, 2.201588, 1, 0, 0, 1, 1,
2.196088, -0.1070616, 0.2880654, 1, 0, 0, 1, 1,
2.215252, -0.957877, 1.558156, 0, 0, 0, 1, 1,
2.262551, 0.2666271, 1.937559, 0, 0, 0, 1, 1,
2.288124, 1.128033, 1.050515, 0, 0, 0, 1, 1,
2.410627, 0.03700653, 1.257521, 0, 0, 0, 1, 1,
2.462846, -1.151907, 1.863132, 0, 0, 0, 1, 1,
2.487197, -0.3036724, 2.295682, 0, 0, 0, 1, 1,
2.494051, -1.043377, 1.660421, 0, 0, 0, 1, 1,
2.526864, 0.1172876, 2.240112, 1, 1, 1, 1, 1,
2.551773, -0.1823925, 0.1330796, 1, 1, 1, 1, 1,
2.575675, 0.1743024, 1.549928, 1, 1, 1, 1, 1,
2.620792, -0.3146906, 2.650592, 1, 1, 1, 1, 1,
2.706616, -2.336367, 3.016989, 1, 1, 1, 1, 1,
2.711216, 1.626805, 1.633604, 1, 1, 1, 1, 1,
3.110025, 0.6291444, 2.33005, 1, 1, 1, 1, 1
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
var radius = 9.606552;
var distance = 33.7426;
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
mvMatrix.translate( -0.1004683, -0.2955532, -0.1677532 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.7426);
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
