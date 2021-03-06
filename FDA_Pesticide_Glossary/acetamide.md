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
-3.653569, -0.4455039, -1.94758, 1, 0, 0, 1,
-3.059787, -0.7199892, -3.145923, 1, 0.007843138, 0, 1,
-2.95358, -1.381772, -1.374447, 1, 0.01176471, 0, 1,
-2.47321, 0.08130419, -2.285404, 1, 0.01960784, 0, 1,
-2.471651, 1.671428, 0.1828005, 1, 0.02352941, 0, 1,
-2.38831, 0.6264795, -0.8470548, 1, 0.03137255, 0, 1,
-2.372981, -0.1725065, -1.347876, 1, 0.03529412, 0, 1,
-2.268097, 0.5163466, 0.6184711, 1, 0.04313726, 0, 1,
-2.267189, -0.9153773, -1.751656, 1, 0.04705882, 0, 1,
-2.256114, 0.8959489, -0.8201983, 1, 0.05490196, 0, 1,
-2.246711, -0.6317793, -2.612595, 1, 0.05882353, 0, 1,
-2.219297, -0.1684644, -1.268225, 1, 0.06666667, 0, 1,
-2.167372, 0.6478466, -0.6931338, 1, 0.07058824, 0, 1,
-2.161656, -0.431432, -2.085019, 1, 0.07843138, 0, 1,
-2.112677, -0.3909676, -4.338009, 1, 0.08235294, 0, 1,
-2.099658, -2.020245, -2.103264, 1, 0.09019608, 0, 1,
-2.047846, -0.3938167, -0.1631548, 1, 0.09411765, 0, 1,
-2.036972, 1.273654, -1.051534, 1, 0.1019608, 0, 1,
-2.033058, -0.8431512, -2.783127, 1, 0.1098039, 0, 1,
-2.004999, -0.4940518, -1.446994, 1, 0.1137255, 0, 1,
-2.002182, -1.629508, -1.014065, 1, 0.1215686, 0, 1,
-1.957999, -0.4464812, -0.628726, 1, 0.1254902, 0, 1,
-1.956051, -0.5090923, -3.396867, 1, 0.1333333, 0, 1,
-1.948199, -2.142667, -2.897265, 1, 0.1372549, 0, 1,
-1.939717, 0.081986, -1.068046, 1, 0.145098, 0, 1,
-1.899282, 0.6648026, -1.908265, 1, 0.1490196, 0, 1,
-1.8948, -1.157195, -2.859761, 1, 0.1568628, 0, 1,
-1.890952, -1.67584, -2.257552, 1, 0.1607843, 0, 1,
-1.890438, 0.2115154, -2.108334, 1, 0.1686275, 0, 1,
-1.88399, 1.566204, 1.358872, 1, 0.172549, 0, 1,
-1.883858, -1.305077, -2.391179, 1, 0.1803922, 0, 1,
-1.852517, -0.8449758, -2.927429, 1, 0.1843137, 0, 1,
-1.852304, 0.3660995, -2.050238, 1, 0.1921569, 0, 1,
-1.838259, -0.8597083, -2.020429, 1, 0.1960784, 0, 1,
-1.801868, -0.04509513, -3.035106, 1, 0.2039216, 0, 1,
-1.781543, -1.596412, -1.149341, 1, 0.2117647, 0, 1,
-1.780758, -0.1691793, -3.95812, 1, 0.2156863, 0, 1,
-1.778991, -0.6572105, -0.9332628, 1, 0.2235294, 0, 1,
-1.75733, 1.384631, -1.935202, 1, 0.227451, 0, 1,
-1.729762, 0.0759614, -1.254951, 1, 0.2352941, 0, 1,
-1.719153, -0.5215477, -1.186643, 1, 0.2392157, 0, 1,
-1.708972, -0.3228278, -2.184871, 1, 0.2470588, 0, 1,
-1.673641, -0.2888728, -1.681449, 1, 0.2509804, 0, 1,
-1.664542, -0.7667199, -4.956375, 1, 0.2588235, 0, 1,
-1.662804, 0.3358639, -1.189274, 1, 0.2627451, 0, 1,
-1.641821, 1.516916, 1.588407, 1, 0.2705882, 0, 1,
-1.627015, 0.8412104, 0.1159234, 1, 0.2745098, 0, 1,
-1.616033, -0.05096064, -1.752942, 1, 0.282353, 0, 1,
-1.610206, 0.3021982, -0.8375642, 1, 0.2862745, 0, 1,
-1.608365, -1.409245, -2.340591, 1, 0.2941177, 0, 1,
-1.601923, 2.317645, -0.3088562, 1, 0.3019608, 0, 1,
-1.596187, 1.542883, -0.1249463, 1, 0.3058824, 0, 1,
-1.592697, -1.112752, -0.9683269, 1, 0.3137255, 0, 1,
-1.586632, -0.7727053, -1.299002, 1, 0.3176471, 0, 1,
-1.579857, -0.3381175, -0.8368328, 1, 0.3254902, 0, 1,
-1.567156, -0.2210183, -0.4198742, 1, 0.3294118, 0, 1,
-1.559921, -1.786826, -1.860546, 1, 0.3372549, 0, 1,
-1.556274, -0.9456053, -3.213504, 1, 0.3411765, 0, 1,
-1.546634, -0.9079043, -0.6044926, 1, 0.3490196, 0, 1,
-1.545712, -0.1877269, -3.031486, 1, 0.3529412, 0, 1,
-1.544932, 0.7306919, -0.7702511, 1, 0.3607843, 0, 1,
-1.524417, -0.205027, -3.237351, 1, 0.3647059, 0, 1,
-1.513931, -1.951137, -2.477195, 1, 0.372549, 0, 1,
-1.500345, 0.3644739, -1.1536, 1, 0.3764706, 0, 1,
-1.490796, 1.171591, -1.486114, 1, 0.3843137, 0, 1,
-1.489281, -1.335836, -3.110054, 1, 0.3882353, 0, 1,
-1.481394, 0.3949915, -0.3574533, 1, 0.3960784, 0, 1,
-1.479394, 0.4587644, -1.635297, 1, 0.4039216, 0, 1,
-1.474064, 1.276808, -2.428585, 1, 0.4078431, 0, 1,
-1.469257, -0.7952006, -1.634119, 1, 0.4156863, 0, 1,
-1.464412, -1.548916, -3.714033, 1, 0.4196078, 0, 1,
-1.448858, -0.2583071, -3.899121, 1, 0.427451, 0, 1,
-1.4397, 0.6541056, -2.066316, 1, 0.4313726, 0, 1,
-1.438655, -0.9079861, -0.002779274, 1, 0.4392157, 0, 1,
-1.434173, 0.3583668, 0.8558145, 1, 0.4431373, 0, 1,
-1.425649, 0.6800579, -1.002515, 1, 0.4509804, 0, 1,
-1.423547, -0.8575042, -1.681158, 1, 0.454902, 0, 1,
-1.42271, -0.4751533, -0.8737885, 1, 0.4627451, 0, 1,
-1.418747, -1.467333, -2.675759, 1, 0.4666667, 0, 1,
-1.418612, 0.678486, 0.01631762, 1, 0.4745098, 0, 1,
-1.412806, -0.410009, -0.9931455, 1, 0.4784314, 0, 1,
-1.407534, 0.6727911, 0.1546105, 1, 0.4862745, 0, 1,
-1.397813, -1.175578, -1.493235, 1, 0.4901961, 0, 1,
-1.395199, 0.3652295, -3.966696, 1, 0.4980392, 0, 1,
-1.381093, 0.6025139, -1.313153, 1, 0.5058824, 0, 1,
-1.371075, -1.142086, -0.8399355, 1, 0.509804, 0, 1,
-1.351814, 0.9231991, 0.01984326, 1, 0.5176471, 0, 1,
-1.343843, 0.2858908, -3.316468, 1, 0.5215687, 0, 1,
-1.342522, 0.696307, -0.3133484, 1, 0.5294118, 0, 1,
-1.341231, -0.4084592, -0.9337282, 1, 0.5333334, 0, 1,
-1.334454, 0.5031277, -2.055613, 1, 0.5411765, 0, 1,
-1.323189, -0.4849381, -3.083334, 1, 0.5450981, 0, 1,
-1.314938, -0.1226508, -2.563012, 1, 0.5529412, 0, 1,
-1.31405, -1.225219, -0.5967149, 1, 0.5568628, 0, 1,
-1.30285, -1.217145, -2.580081, 1, 0.5647059, 0, 1,
-1.300255, 0.03188097, -0.5199819, 1, 0.5686275, 0, 1,
-1.298142, -0.1789083, -2.182142, 1, 0.5764706, 0, 1,
-1.287416, -0.7484615, -3.840787, 1, 0.5803922, 0, 1,
-1.284716, 0.6275496, 0.2680075, 1, 0.5882353, 0, 1,
-1.278904, 1.464563, -0.9422169, 1, 0.5921569, 0, 1,
-1.269806, 0.06692538, 0.07319263, 1, 0.6, 0, 1,
-1.259072, -1.541779, -1.203993, 1, 0.6078432, 0, 1,
-1.253174, -1.380532, -1.589917, 1, 0.6117647, 0, 1,
-1.250066, -1.320865, -3.957172, 1, 0.6196079, 0, 1,
-1.247508, -0.8742902, -2.690312, 1, 0.6235294, 0, 1,
-1.229056, 1.141482, -1.361765, 1, 0.6313726, 0, 1,
-1.226978, -0.4971527, -2.494345, 1, 0.6352941, 0, 1,
-1.226845, 0.8057294, 0.04737878, 1, 0.6431373, 0, 1,
-1.224057, 0.4334566, -1.482597, 1, 0.6470588, 0, 1,
-1.218276, 1.217317, -1.484426, 1, 0.654902, 0, 1,
-1.217127, 0.5554588, -1.71867, 1, 0.6588235, 0, 1,
-1.216341, -0.4384786, -0.3898894, 1, 0.6666667, 0, 1,
-1.21621, -0.01753838, -1.049157, 1, 0.6705883, 0, 1,
-1.208288, 0.1600002, 0.03682457, 1, 0.6784314, 0, 1,
-1.202845, -1.522809, -3.342096, 1, 0.682353, 0, 1,
-1.197626, 2.069307, 0.6031194, 1, 0.6901961, 0, 1,
-1.194059, -0.3278989, -1.152662, 1, 0.6941177, 0, 1,
-1.194043, 0.007149123, -1.144045, 1, 0.7019608, 0, 1,
-1.193603, -0.0668835, -1.160468, 1, 0.7098039, 0, 1,
-1.18065, -0.5283105, -2.321669, 1, 0.7137255, 0, 1,
-1.171069, -0.5357047, -0.2239961, 1, 0.7215686, 0, 1,
-1.168953, -0.204763, -0.5084658, 1, 0.7254902, 0, 1,
-1.167772, -1.273297, -0.3690791, 1, 0.7333333, 0, 1,
-1.167607, -0.7274367, -1.802697, 1, 0.7372549, 0, 1,
-1.159712, -0.459167, -1.067045, 1, 0.7450981, 0, 1,
-1.157964, 0.06652583, -0.4129665, 1, 0.7490196, 0, 1,
-1.157699, 1.312635, -0.1748006, 1, 0.7568628, 0, 1,
-1.157552, 1.556952, -0.7230408, 1, 0.7607843, 0, 1,
-1.1559, -0.08629357, -1.980956, 1, 0.7686275, 0, 1,
-1.152428, 0.9308969, -1.220073, 1, 0.772549, 0, 1,
-1.147205, 0.5187659, -1.83394, 1, 0.7803922, 0, 1,
-1.145717, 0.4420007, -0.1639098, 1, 0.7843137, 0, 1,
-1.144931, 1.445917, -0.5770763, 1, 0.7921569, 0, 1,
-1.138555, -0.2145677, -0.7694363, 1, 0.7960784, 0, 1,
-1.133696, 1.27722, -2.437731, 1, 0.8039216, 0, 1,
-1.129301, 1.870957, -1.450857, 1, 0.8117647, 0, 1,
-1.12707, 0.2140525, -1.407101, 1, 0.8156863, 0, 1,
-1.123692, 0.2902406, -0.3995271, 1, 0.8235294, 0, 1,
-1.119353, -1.449834, -2.555558, 1, 0.827451, 0, 1,
-1.11564, 0.1492998, -1.003644, 1, 0.8352941, 0, 1,
-1.114521, -1.970703, -1.453116, 1, 0.8392157, 0, 1,
-1.107538, -0.5794606, -2.661523, 1, 0.8470588, 0, 1,
-1.098123, 0.2868981, 0.01525307, 1, 0.8509804, 0, 1,
-1.097953, 0.3921227, -0.4069076, 1, 0.8588235, 0, 1,
-1.086512, -1.94302, -2.637206, 1, 0.8627451, 0, 1,
-1.08403, 0.2907076, -1.257502, 1, 0.8705882, 0, 1,
-1.073449, 1.514079, -1.977085, 1, 0.8745098, 0, 1,
-1.073096, 2.554799, 0.4580343, 1, 0.8823529, 0, 1,
-1.072678, -0.5472403, -2.797446, 1, 0.8862745, 0, 1,
-1.069079, -0.5353866, -2.506229, 1, 0.8941177, 0, 1,
-1.067638, 0.9422548, -2.260778, 1, 0.8980392, 0, 1,
-1.065022, -0.06327891, -2.111707, 1, 0.9058824, 0, 1,
-1.061198, 2.324415, -0.7401809, 1, 0.9137255, 0, 1,
-1.060781, 0.6189988, -1.073292, 1, 0.9176471, 0, 1,
-1.056576, -1.196514, -0.5173302, 1, 0.9254902, 0, 1,
-1.054623, 0.1079661, -0.8315319, 1, 0.9294118, 0, 1,
-1.050438, -0.5811996, -3.137978, 1, 0.9372549, 0, 1,
-1.043385, 0.04487228, -0.2209336, 1, 0.9411765, 0, 1,
-1.04278, 0.6263059, -0.7485474, 1, 0.9490196, 0, 1,
-1.019329, 0.7137764, -0.8950462, 1, 0.9529412, 0, 1,
-1.018864, 0.05902713, -2.347184, 1, 0.9607843, 0, 1,
-1.013082, -0.203564, -1.114095, 1, 0.9647059, 0, 1,
-1.006925, -1.8795, -4.192736, 1, 0.972549, 0, 1,
-1.005806, -0.1363174, -3.264996, 1, 0.9764706, 0, 1,
-0.9986277, -0.5027812, -2.580534, 1, 0.9843137, 0, 1,
-0.99804, 0.02435887, -2.315221, 1, 0.9882353, 0, 1,
-0.9929717, -1.867622, -4.907715, 1, 0.9960784, 0, 1,
-0.9921512, -0.8099778, -1.777309, 0.9960784, 1, 0, 1,
-0.9879449, -0.3765345, -5.044196, 0.9921569, 1, 0, 1,
-0.9778938, 1.068762, -0.5138211, 0.9843137, 1, 0, 1,
-0.9774401, 0.2639369, -2.167926, 0.9803922, 1, 0, 1,
-0.9764366, 0.2510453, -0.7335313, 0.972549, 1, 0, 1,
-0.974804, -0.04927305, -1.024669, 0.9686275, 1, 0, 1,
-0.9744359, -0.9024531, -3.478854, 0.9607843, 1, 0, 1,
-0.9674984, 0.6371304, -1.436489, 0.9568627, 1, 0, 1,
-0.9643155, 1.46954, -0.6859375, 0.9490196, 1, 0, 1,
-0.9595711, 0.4034591, -2.837798, 0.945098, 1, 0, 1,
-0.9589744, -0.2591318, 0.4086367, 0.9372549, 1, 0, 1,
-0.9551984, 0.2890914, -1.078391, 0.9333333, 1, 0, 1,
-0.9454354, 1.099149, 0.6611735, 0.9254902, 1, 0, 1,
-0.9443857, 0.04974096, -2.305067, 0.9215686, 1, 0, 1,
-0.9436259, 0.5942283, -1.077795, 0.9137255, 1, 0, 1,
-0.9420618, -0.5012882, -2.784126, 0.9098039, 1, 0, 1,
-0.9403754, 1.806708, -0.2839232, 0.9019608, 1, 0, 1,
-0.9403062, 0.5224026, -2.576864, 0.8941177, 1, 0, 1,
-0.9315183, 1.032306, -0.5470437, 0.8901961, 1, 0, 1,
-0.9251526, -1.247358, -2.573832, 0.8823529, 1, 0, 1,
-0.9247713, -0.9782047, -1.369218, 0.8784314, 1, 0, 1,
-0.9228542, 0.1343435, -3.282758, 0.8705882, 1, 0, 1,
-0.9216365, -0.3134443, -2.756998, 0.8666667, 1, 0, 1,
-0.9113514, 1.230526, 1.247382, 0.8588235, 1, 0, 1,
-0.9085863, -0.7548581, -2.769689, 0.854902, 1, 0, 1,
-0.9084523, -0.2440219, 0.2159066, 0.8470588, 1, 0, 1,
-0.9075912, -0.86212, -2.597921, 0.8431373, 1, 0, 1,
-0.9047469, -1.934363, -3.243516, 0.8352941, 1, 0, 1,
-0.9041258, -0.429563, -3.089551, 0.8313726, 1, 0, 1,
-0.9020953, 1.835629, -1.046262, 0.8235294, 1, 0, 1,
-0.8999599, -0.1522152, -2.38803, 0.8196079, 1, 0, 1,
-0.8980612, -0.9483695, -1.171375, 0.8117647, 1, 0, 1,
-0.8946872, 0.2983449, -0.5918465, 0.8078431, 1, 0, 1,
-0.8929371, -0.4558617, -1.138547, 0.8, 1, 0, 1,
-0.8909982, 0.7320738, -2.129712, 0.7921569, 1, 0, 1,
-0.8826455, 0.2571783, -1.273133, 0.7882353, 1, 0, 1,
-0.8777261, -1.300086, -3.289448, 0.7803922, 1, 0, 1,
-0.8756491, -0.6077953, -2.644843, 0.7764706, 1, 0, 1,
-0.8703309, -0.8268564, -2.362177, 0.7686275, 1, 0, 1,
-0.8699386, -0.05431056, -1.332276, 0.7647059, 1, 0, 1,
-0.869309, 0.4363914, -0.2406283, 0.7568628, 1, 0, 1,
-0.8693029, 1.117891, -0.9044394, 0.7529412, 1, 0, 1,
-0.8645547, -1.625395, -1.977122, 0.7450981, 1, 0, 1,
-0.8627855, -0.3313601, -1.481171, 0.7411765, 1, 0, 1,
-0.8539216, -0.06823944, -0.2536616, 0.7333333, 1, 0, 1,
-0.8504205, 0.2638072, -1.379969, 0.7294118, 1, 0, 1,
-0.8481773, -2.033611, -2.080937, 0.7215686, 1, 0, 1,
-0.8411409, 1.256176, 0.7765164, 0.7176471, 1, 0, 1,
-0.8408659, 0.8431813, -1.650753, 0.7098039, 1, 0, 1,
-0.8395469, 0.8999969, -0.0800807, 0.7058824, 1, 0, 1,
-0.8355246, -0.2406742, -2.698487, 0.6980392, 1, 0, 1,
-0.8317075, -0.1740002, -2.253606, 0.6901961, 1, 0, 1,
-0.8276787, -0.851903, -3.99894, 0.6862745, 1, 0, 1,
-0.825944, 0.5124161, -2.430169, 0.6784314, 1, 0, 1,
-0.8254648, -0.9925653, -4.515881, 0.6745098, 1, 0, 1,
-0.8213489, 0.7869526, -0.02560936, 0.6666667, 1, 0, 1,
-0.8185481, 1.294681, -0.5762028, 0.6627451, 1, 0, 1,
-0.8147638, -0.5598247, -2.453562, 0.654902, 1, 0, 1,
-0.8136773, -0.5802059, -4.214521, 0.6509804, 1, 0, 1,
-0.7988847, -1.171035, -1.920738, 0.6431373, 1, 0, 1,
-0.7966253, 0.1965593, -2.315662, 0.6392157, 1, 0, 1,
-0.7958445, 0.01181828, -0.4047025, 0.6313726, 1, 0, 1,
-0.7930472, -1.906874, -3.783895, 0.627451, 1, 0, 1,
-0.7913207, 0.136179, 0.09388865, 0.6196079, 1, 0, 1,
-0.7877936, -2.111145, -1.972144, 0.6156863, 1, 0, 1,
-0.7865908, -1.454925, -2.586052, 0.6078432, 1, 0, 1,
-0.7809351, 0.1318522, -1.459603, 0.6039216, 1, 0, 1,
-0.780626, -2.118868, -4.229497, 0.5960785, 1, 0, 1,
-0.7612332, 0.8878352, -0.20086, 0.5882353, 1, 0, 1,
-0.755003, -1.208778, -3.585052, 0.5843138, 1, 0, 1,
-0.7485762, 0.5675146, 1.148849, 0.5764706, 1, 0, 1,
-0.7480417, 0.6851814, -1.525713, 0.572549, 1, 0, 1,
-0.7448826, 0.6219336, -0.6526103, 0.5647059, 1, 0, 1,
-0.7436644, 1.063321, -1.549155, 0.5607843, 1, 0, 1,
-0.7435209, 1.054341, -2.596904, 0.5529412, 1, 0, 1,
-0.7425203, -1.778185, -1.417397, 0.5490196, 1, 0, 1,
-0.7414805, -0.1712963, -1.522291, 0.5411765, 1, 0, 1,
-0.7329355, 1.855657, -0.6288203, 0.5372549, 1, 0, 1,
-0.7323388, -1.494883, -2.019282, 0.5294118, 1, 0, 1,
-0.7311663, 0.1561021, -1.015976, 0.5254902, 1, 0, 1,
-0.7309913, 0.02427657, -0.9431874, 0.5176471, 1, 0, 1,
-0.730831, 1.219518, -0.3766069, 0.5137255, 1, 0, 1,
-0.725264, -0.5946031, -2.759161, 0.5058824, 1, 0, 1,
-0.7232035, -0.9971173, -3.031193, 0.5019608, 1, 0, 1,
-0.7220348, -0.9552408, -3.837691, 0.4941176, 1, 0, 1,
-0.7220317, 0.698394, -1.692284, 0.4862745, 1, 0, 1,
-0.7178568, -0.4244461, -1.882646, 0.4823529, 1, 0, 1,
-0.7139104, -0.4979466, -1.135189, 0.4745098, 1, 0, 1,
-0.700135, -0.7375612, -2.638913, 0.4705882, 1, 0, 1,
-0.6996177, -0.1090182, -4.143669, 0.4627451, 1, 0, 1,
-0.6974622, 0.9401891, -2.041373, 0.4588235, 1, 0, 1,
-0.6963162, -0.08437665, -1.528692, 0.4509804, 1, 0, 1,
-0.6960764, -0.4215168, -0.5864956, 0.4470588, 1, 0, 1,
-0.6933396, -0.6866585, -2.944651, 0.4392157, 1, 0, 1,
-0.6929877, -1.214342, -2.297224, 0.4352941, 1, 0, 1,
-0.6899083, 1.204876, -0.7245899, 0.427451, 1, 0, 1,
-0.6877581, 0.5405152, -1.891845, 0.4235294, 1, 0, 1,
-0.6873426, 0.3861803, -0.1777021, 0.4156863, 1, 0, 1,
-0.6829762, 0.6407529, -2.920163, 0.4117647, 1, 0, 1,
-0.6809564, 0.1520473, -0.8807835, 0.4039216, 1, 0, 1,
-0.6806483, 0.7667568, -1.637864, 0.3960784, 1, 0, 1,
-0.6799828, 0.4571386, -0.3007409, 0.3921569, 1, 0, 1,
-0.6772287, 1.135596, -1.37449, 0.3843137, 1, 0, 1,
-0.6687097, -0.5051995, -1.563611, 0.3803922, 1, 0, 1,
-0.6608393, 0.6866587, -0.4513342, 0.372549, 1, 0, 1,
-0.6600851, -0.6669942, -2.085352, 0.3686275, 1, 0, 1,
-0.6560209, -1.168478, -3.127642, 0.3607843, 1, 0, 1,
-0.6528303, -0.01949554, -2.58122, 0.3568628, 1, 0, 1,
-0.6487842, 0.2020946, -1.551152, 0.3490196, 1, 0, 1,
-0.6362976, 0.7950988, -2.320229, 0.345098, 1, 0, 1,
-0.6327425, -0.186217, -3.070901, 0.3372549, 1, 0, 1,
-0.6300907, 0.2128712, 0.4034498, 0.3333333, 1, 0, 1,
-0.6279988, 0.3969214, -0.3078874, 0.3254902, 1, 0, 1,
-0.6242181, -0.4273748, -3.530124, 0.3215686, 1, 0, 1,
-0.6236141, 0.07512525, -1.257229, 0.3137255, 1, 0, 1,
-0.6229657, 0.9419475, -2.78616, 0.3098039, 1, 0, 1,
-0.6164528, -0.2508746, -2.942837, 0.3019608, 1, 0, 1,
-0.6136523, -0.9666577, -3.294334, 0.2941177, 1, 0, 1,
-0.6132221, 1.685954, -0.5845826, 0.2901961, 1, 0, 1,
-0.6116566, 0.2592911, -1.325784, 0.282353, 1, 0, 1,
-0.6092689, 0.2760542, -2.1546, 0.2784314, 1, 0, 1,
-0.6053131, -0.1389912, -1.306174, 0.2705882, 1, 0, 1,
-0.6035251, -1.140116, -0.9927203, 0.2666667, 1, 0, 1,
-0.6026791, 0.7856292, -1.290432, 0.2588235, 1, 0, 1,
-0.599247, 0.8542161, -1.035901, 0.254902, 1, 0, 1,
-0.5991356, 0.7631632, 0.1723313, 0.2470588, 1, 0, 1,
-0.5885105, -0.5902095, -1.784403, 0.2431373, 1, 0, 1,
-0.5801505, -0.723991, -3.220586, 0.2352941, 1, 0, 1,
-0.5793406, -1.769987, -4.122629, 0.2313726, 1, 0, 1,
-0.5753576, 1.110848, -2.155921, 0.2235294, 1, 0, 1,
-0.5737975, 0.7764499, -0.998284, 0.2196078, 1, 0, 1,
-0.5652481, -0.182506, -2.136456, 0.2117647, 1, 0, 1,
-0.5639911, -1.026367, -1.997227, 0.2078431, 1, 0, 1,
-0.5597033, -0.3061196, -2.539649, 0.2, 1, 0, 1,
-0.5592102, 0.9163023, -0.4799003, 0.1921569, 1, 0, 1,
-0.5591534, -1.549206, -3.424834, 0.1882353, 1, 0, 1,
-0.5570557, 1.238824, 0.1918332, 0.1803922, 1, 0, 1,
-0.5564767, -0.103101, -1.950085, 0.1764706, 1, 0, 1,
-0.5559484, -1.070686, -2.569181, 0.1686275, 1, 0, 1,
-0.5537501, 1.785115, 1.220235, 0.1647059, 1, 0, 1,
-0.5536192, 2.300708, -1.703888, 0.1568628, 1, 0, 1,
-0.5513291, -1.154696, -3.380992, 0.1529412, 1, 0, 1,
-0.5510098, -1.552186, -1.957763, 0.145098, 1, 0, 1,
-0.5502999, 0.7610333, -1.432656, 0.1411765, 1, 0, 1,
-0.5490154, 1.344733, -0.04044844, 0.1333333, 1, 0, 1,
-0.5460337, -1.323335, -2.097791, 0.1294118, 1, 0, 1,
-0.5388338, -0.05308671, 0.2549733, 0.1215686, 1, 0, 1,
-0.5379928, -0.2388672, -2.563699, 0.1176471, 1, 0, 1,
-0.5363798, 0.2094457, -1.015882, 0.1098039, 1, 0, 1,
-0.5336893, 1.043755, -1.394452, 0.1058824, 1, 0, 1,
-0.5331735, 0.01050058, -1.290714, 0.09803922, 1, 0, 1,
-0.5315648, -0.02479654, -2.895463, 0.09019608, 1, 0, 1,
-0.5300974, 1.603232, 0.7549317, 0.08627451, 1, 0, 1,
-0.5288851, -0.8638589, -2.840251, 0.07843138, 1, 0, 1,
-0.5270616, 0.4408217, -1.740093, 0.07450981, 1, 0, 1,
-0.5236439, -0.03212868, -1.508033, 0.06666667, 1, 0, 1,
-0.5202945, -0.7211983, -1.844633, 0.0627451, 1, 0, 1,
-0.5166889, -0.8972157, -3.601666, 0.05490196, 1, 0, 1,
-0.5164562, 0.3206, -1.849581, 0.05098039, 1, 0, 1,
-0.5143271, 1.117349, -0.9364781, 0.04313726, 1, 0, 1,
-0.5103426, -0.4284874, -2.478954, 0.03921569, 1, 0, 1,
-0.510183, 1.735964, 1.828413, 0.03137255, 1, 0, 1,
-0.5084271, -1.201537, -3.042709, 0.02745098, 1, 0, 1,
-0.5083956, -0.03918089, -1.146577, 0.01960784, 1, 0, 1,
-0.5016055, -1.016488, -2.125165, 0.01568628, 1, 0, 1,
-0.4958264, -0.5194649, -3.112817, 0.007843138, 1, 0, 1,
-0.4918028, 1.281379, -0.8926908, 0.003921569, 1, 0, 1,
-0.4902031, 0.3148267, -2.00772, 0, 1, 0.003921569, 1,
-0.4880199, -0.8122652, -2.355047, 0, 1, 0.01176471, 1,
-0.4825083, -0.3090243, -3.349109, 0, 1, 0.01568628, 1,
-0.4741954, -1.948616, -2.671998, 0, 1, 0.02352941, 1,
-0.4658054, -2.099088, -2.893855, 0, 1, 0.02745098, 1,
-0.4645565, -0.9366352, -0.8058187, 0, 1, 0.03529412, 1,
-0.4556803, -1.164017, -2.214738, 0, 1, 0.03921569, 1,
-0.4529724, 1.097223, -1.22085, 0, 1, 0.04705882, 1,
-0.4478351, 0.02618968, -0.6211013, 0, 1, 0.05098039, 1,
-0.4416459, 0.2226297, -1.80297, 0, 1, 0.05882353, 1,
-0.4370991, -1.522898, -1.858608, 0, 1, 0.0627451, 1,
-0.4355808, 2.088438, -0.1178214, 0, 1, 0.07058824, 1,
-0.4325705, -0.8406448, -3.758765, 0, 1, 0.07450981, 1,
-0.4266366, -0.8739657, -3.191296, 0, 1, 0.08235294, 1,
-0.4256223, 0.30722, -2.202497, 0, 1, 0.08627451, 1,
-0.4255316, 0.4775739, -0.5408774, 0, 1, 0.09411765, 1,
-0.4254058, 0.3348598, -0.5538625, 0, 1, 0.1019608, 1,
-0.4253541, 1.483629, 0.7128761, 0, 1, 0.1058824, 1,
-0.4123646, 1.618703, -0.02174489, 0, 1, 0.1137255, 1,
-0.4070964, -0.7422805, -4.236712, 0, 1, 0.1176471, 1,
-0.40346, 0.6261159, -1.281382, 0, 1, 0.1254902, 1,
-0.3981811, -0.2568648, -0.1717269, 0, 1, 0.1294118, 1,
-0.3971747, 2.025389, -1.443115, 0, 1, 0.1372549, 1,
-0.3955935, 0.9981705, -1.401414, 0, 1, 0.1411765, 1,
-0.3943343, -0.4113651, -2.677624, 0, 1, 0.1490196, 1,
-0.3934348, 0.903104, -0.2264576, 0, 1, 0.1529412, 1,
-0.3851601, 0.5996415, -0.1597572, 0, 1, 0.1607843, 1,
-0.3851207, -0.219399, -1.231596, 0, 1, 0.1647059, 1,
-0.3821059, 0.2510182, -0.5583375, 0, 1, 0.172549, 1,
-0.3729925, -1.94729, -2.852341, 0, 1, 0.1764706, 1,
-0.3641998, 1.299394, -1.483202, 0, 1, 0.1843137, 1,
-0.3619108, -1.047527, -3.361842, 0, 1, 0.1882353, 1,
-0.3607506, -0.1185727, -2.095164, 0, 1, 0.1960784, 1,
-0.3561215, -0.1159115, -1.075271, 0, 1, 0.2039216, 1,
-0.3554868, 1.412552, 0.0542765, 0, 1, 0.2078431, 1,
-0.3514971, -0.01708398, -2.815423, 0, 1, 0.2156863, 1,
-0.3500174, -0.642584, -1.084011, 0, 1, 0.2196078, 1,
-0.3445965, 1.179443, -1.960897, 0, 1, 0.227451, 1,
-0.3414107, -0.2441462, -1.570763, 0, 1, 0.2313726, 1,
-0.3413698, -0.5363432, -1.754591, 0, 1, 0.2392157, 1,
-0.3388403, -0.2206252, -1.299466, 0, 1, 0.2431373, 1,
-0.3349083, 0.1254097, -0.51091, 0, 1, 0.2509804, 1,
-0.3317335, -0.2682577, -1.825046, 0, 1, 0.254902, 1,
-0.3284906, 1.134343, -0.1744785, 0, 1, 0.2627451, 1,
-0.324518, -1.120538, -1.616118, 0, 1, 0.2666667, 1,
-0.3222038, 0.8192649, -1.576947, 0, 1, 0.2745098, 1,
-0.322055, -0.3575887, -4.275723, 0, 1, 0.2784314, 1,
-0.3188631, -0.3462949, -3.247422, 0, 1, 0.2862745, 1,
-0.3164933, -0.3546671, -2.95341, 0, 1, 0.2901961, 1,
-0.3162681, 1.909197, 0.719466, 0, 1, 0.2980392, 1,
-0.3160033, 0.4471427, -0.2627395, 0, 1, 0.3058824, 1,
-0.3157144, -0.3358907, -2.405901, 0, 1, 0.3098039, 1,
-0.3131019, 0.7378806, 0.4655509, 0, 1, 0.3176471, 1,
-0.307925, -0.4627213, -1.348108, 0, 1, 0.3215686, 1,
-0.306014, -1.121839, -2.26331, 0, 1, 0.3294118, 1,
-0.3053527, 1.18549, -0.8006296, 0, 1, 0.3333333, 1,
-0.3040134, 1.112649, -1.753435, 0, 1, 0.3411765, 1,
-0.3020295, 0.2581116, -0.7073862, 0, 1, 0.345098, 1,
-0.3018064, 0.2623881, -0.6255093, 0, 1, 0.3529412, 1,
-0.3012202, 0.2621502, 0.1857958, 0, 1, 0.3568628, 1,
-0.3003068, -0.9399746, -1.060598, 0, 1, 0.3647059, 1,
-0.2985659, 0.09250398, -1.512721, 0, 1, 0.3686275, 1,
-0.2982289, 1.167239, 1.602236, 0, 1, 0.3764706, 1,
-0.2974381, 0.5892971, 0.1670092, 0, 1, 0.3803922, 1,
-0.2972924, 0.6912952, -0.9548243, 0, 1, 0.3882353, 1,
-0.2968107, -0.1946219, -2.41823, 0, 1, 0.3921569, 1,
-0.2949623, -1.339487, -3.459998, 0, 1, 0.4, 1,
-0.2943799, -1.368456, -3.966108, 0, 1, 0.4078431, 1,
-0.2881422, 2.197231, 0.6205847, 0, 1, 0.4117647, 1,
-0.2876716, 2.893135, 1.146431, 0, 1, 0.4196078, 1,
-0.2869321, 0.7719481, -1.203029, 0, 1, 0.4235294, 1,
-0.285928, 0.893684, -0.5817595, 0, 1, 0.4313726, 1,
-0.2766937, -0.7004622, -2.601846, 0, 1, 0.4352941, 1,
-0.2747194, 0.3338858, -1.184215, 0, 1, 0.4431373, 1,
-0.273598, 0.7553272, 0.7652862, 0, 1, 0.4470588, 1,
-0.2734769, 1.105265, 0.1306497, 0, 1, 0.454902, 1,
-0.2730528, -0.4932155, -0.7342249, 0, 1, 0.4588235, 1,
-0.2690931, -0.5861236, -2.969269, 0, 1, 0.4666667, 1,
-0.265718, -1.582749, -3.09451, 0, 1, 0.4705882, 1,
-0.2642207, -0.1106785, -2.015946, 0, 1, 0.4784314, 1,
-0.2615491, -0.7840398, -3.707025, 0, 1, 0.4823529, 1,
-0.258557, -0.3261549, -2.393804, 0, 1, 0.4901961, 1,
-0.2565561, 1.338792, -0.91614, 0, 1, 0.4941176, 1,
-0.2539926, -0.7167345, -3.567941, 0, 1, 0.5019608, 1,
-0.2530027, 0.6932459, 0.01031454, 0, 1, 0.509804, 1,
-0.2516889, 0.7936096, -1.084011, 0, 1, 0.5137255, 1,
-0.2511711, -0.09380943, -3.353644, 0, 1, 0.5215687, 1,
-0.2511612, 1.374694, -1.34502, 0, 1, 0.5254902, 1,
-0.2480764, 0.583462, -1.242538, 0, 1, 0.5333334, 1,
-0.2459278, -0.04255666, -2.411385, 0, 1, 0.5372549, 1,
-0.2438867, -0.3355618, -0.6084281, 0, 1, 0.5450981, 1,
-0.2399674, 0.7662395, 0.4685916, 0, 1, 0.5490196, 1,
-0.2392188, 1.707807, 0.1437879, 0, 1, 0.5568628, 1,
-0.2391126, -0.9805272, -2.772744, 0, 1, 0.5607843, 1,
-0.236213, -0.002589248, -2.682535, 0, 1, 0.5686275, 1,
-0.2337925, 0.3795588, -1.586449, 0, 1, 0.572549, 1,
-0.2328643, 0.3311184, -0.7696493, 0, 1, 0.5803922, 1,
-0.2314824, -1.931853, -3.297058, 0, 1, 0.5843138, 1,
-0.2256396, -0.2350297, -1.346051, 0, 1, 0.5921569, 1,
-0.2252783, -1.016112, -2.27484, 0, 1, 0.5960785, 1,
-0.2225346, 0.1823724, 0.1274945, 0, 1, 0.6039216, 1,
-0.215652, 0.1443513, 1.364701, 0, 1, 0.6117647, 1,
-0.2128794, 0.04475867, -1.505677, 0, 1, 0.6156863, 1,
-0.2033363, 0.8866755, -1.306836, 0, 1, 0.6235294, 1,
-0.2002144, 0.3509494, -1.68135, 0, 1, 0.627451, 1,
-0.1973277, 1.332893, -0.7735747, 0, 1, 0.6352941, 1,
-0.1964447, 0.4512968, -0.8821061, 0, 1, 0.6392157, 1,
-0.1954162, -1.183047, -5.303507, 0, 1, 0.6470588, 1,
-0.194351, 0.5925968, -2.321233, 0, 1, 0.6509804, 1,
-0.1936783, -0.8624705, -3.349663, 0, 1, 0.6588235, 1,
-0.1850506, -1.094232, -1.404022, 0, 1, 0.6627451, 1,
-0.1754218, 0.4994543, -1.24728, 0, 1, 0.6705883, 1,
-0.1737257, 0.8211067, -1.850278, 0, 1, 0.6745098, 1,
-0.1717229, -0.424699, -2.535127, 0, 1, 0.682353, 1,
-0.1715824, 1.386026, 0.1118729, 0, 1, 0.6862745, 1,
-0.1712509, -0.6752379, -3.796183, 0, 1, 0.6941177, 1,
-0.1697964, 0.8582777, 1.92619, 0, 1, 0.7019608, 1,
-0.1689702, 1.837617, -0.06511409, 0, 1, 0.7058824, 1,
-0.1673585, -0.4797974, -1.828332, 0, 1, 0.7137255, 1,
-0.1637084, -0.8405332, -3.739029, 0, 1, 0.7176471, 1,
-0.1634427, 0.08972514, -2.072761, 0, 1, 0.7254902, 1,
-0.1630408, -3.101023, -1.320419, 0, 1, 0.7294118, 1,
-0.1615903, 1.057245, 0.4912279, 0, 1, 0.7372549, 1,
-0.1608252, -0.4103785, -1.872855, 0, 1, 0.7411765, 1,
-0.1532097, 0.715704, -1.374882, 0, 1, 0.7490196, 1,
-0.1530573, 1.026406, -2.166033, 0, 1, 0.7529412, 1,
-0.1523904, -0.4128186, -2.661736, 0, 1, 0.7607843, 1,
-0.149972, 1.310117, -0.2357248, 0, 1, 0.7647059, 1,
-0.1492982, 0.07915889, -0.7809218, 0, 1, 0.772549, 1,
-0.1452484, 0.8214738, -0.00011437, 0, 1, 0.7764706, 1,
-0.1356038, 0.6164024, 2.97505, 0, 1, 0.7843137, 1,
-0.1310631, -1.954346, -4.798978, 0, 1, 0.7882353, 1,
-0.1308342, -0.2262163, -3.419175, 0, 1, 0.7960784, 1,
-0.1304325, 0.426563, 0.9576606, 0, 1, 0.8039216, 1,
-0.1215336, -0.1946899, -2.619034, 0, 1, 0.8078431, 1,
-0.1213617, -0.889205, -1.823056, 0, 1, 0.8156863, 1,
-0.1183535, -1.33876, -3.37533, 0, 1, 0.8196079, 1,
-0.1180569, 0.7226672, 0.4606559, 0, 1, 0.827451, 1,
-0.1175944, 1.801079, 0.1686709, 0, 1, 0.8313726, 1,
-0.1159521, -0.9178255, -2.832913, 0, 1, 0.8392157, 1,
-0.1129629, -0.3812153, -3.968787, 0, 1, 0.8431373, 1,
-0.1129144, 1.963344, -0.6445639, 0, 1, 0.8509804, 1,
-0.1094212, 0.4916853, -1.679276, 0, 1, 0.854902, 1,
-0.1073087, -0.2797852, -4.118753, 0, 1, 0.8627451, 1,
-0.1008696, -1.192814, -4.130651, 0, 1, 0.8666667, 1,
-0.1008378, -0.2082109, -3.950731, 0, 1, 0.8745098, 1,
-0.09840409, 1.693978, -0.5677403, 0, 1, 0.8784314, 1,
-0.09496202, 1.497138, -0.4499743, 0, 1, 0.8862745, 1,
-0.09451517, 1.943454, 1.504999, 0, 1, 0.8901961, 1,
-0.08956013, 0.7265241, -1.302345, 0, 1, 0.8980392, 1,
-0.08866199, -0.01640287, -0.5787271, 0, 1, 0.9058824, 1,
-0.08422492, 0.8896828, -0.2543514, 0, 1, 0.9098039, 1,
-0.08115351, 0.1456817, -0.8289173, 0, 1, 0.9176471, 1,
-0.0787115, -0.4543056, -3.613263, 0, 1, 0.9215686, 1,
-0.07804634, -1.071647, -3.913856, 0, 1, 0.9294118, 1,
-0.07779489, 0.4979503, 1.344753, 0, 1, 0.9333333, 1,
-0.07673182, 0.1862005, -0.5088296, 0, 1, 0.9411765, 1,
-0.07312398, 0.4014724, 0.01406013, 0, 1, 0.945098, 1,
-0.07110321, -1.088192, -3.521834, 0, 1, 0.9529412, 1,
-0.0615959, 1.347502, 1.159739, 0, 1, 0.9568627, 1,
-0.06024304, 1.524492, -0.4473143, 0, 1, 0.9647059, 1,
-0.05364707, 0.4682379, -0.8997856, 0, 1, 0.9686275, 1,
-0.04901004, 0.4062661, -0.9374906, 0, 1, 0.9764706, 1,
-0.04769976, 0.08775832, -0.5292728, 0, 1, 0.9803922, 1,
-0.04709407, -0.7028999, -2.367382, 0, 1, 0.9882353, 1,
-0.04382077, -2.130661, -3.592529, 0, 1, 0.9921569, 1,
-0.04265046, 0.3725174, -0.2110702, 0, 1, 1, 1,
-0.03217601, -1.235011, -3.602985, 0, 0.9921569, 1, 1,
-0.02410686, 1.429739, 0.6757916, 0, 0.9882353, 1, 1,
-0.02366105, 0.404666, 0.7436185, 0, 0.9803922, 1, 1,
-0.02060935, 0.3703869, 0.9583414, 0, 0.9764706, 1, 1,
-0.01920786, -0.2571434, -3.2366, 0, 0.9686275, 1, 1,
-0.01779761, 0.1675849, 0.1887481, 0, 0.9647059, 1, 1,
-0.01432313, -0.3686213, -2.183037, 0, 0.9568627, 1, 1,
-0.01398128, 1.107138, 0.7516086, 0, 0.9529412, 1, 1,
-0.01233032, -0.2180908, -2.650105, 0, 0.945098, 1, 1,
-0.005144936, 1.640615, -0.05410329, 0, 0.9411765, 1, 1,
-0.001492695, -1.120431, -2.728938, 0, 0.9333333, 1, 1,
-0.00108019, 0.6155967, -0.3706263, 0, 0.9294118, 1, 1,
0.001157372, 1.258956, -0.5966296, 0, 0.9215686, 1, 1,
0.003409323, -1.290759, 2.722299, 0, 0.9176471, 1, 1,
0.003927764, -0.2860543, 4.258873, 0, 0.9098039, 1, 1,
0.007071259, -0.2151894, 1.978491, 0, 0.9058824, 1, 1,
0.008634335, 0.8829803, 1.322511, 0, 0.8980392, 1, 1,
0.01043246, -1.267372, 2.588645, 0, 0.8901961, 1, 1,
0.01528731, 1.255289, -1.300467, 0, 0.8862745, 1, 1,
0.01725103, 0.8255115, 0.2771228, 0, 0.8784314, 1, 1,
0.01792586, 0.09566841, 0.7213188, 0, 0.8745098, 1, 1,
0.01937581, 0.5145435, 1.050972, 0, 0.8666667, 1, 1,
0.02004247, -0.7789718, 4.542192, 0, 0.8627451, 1, 1,
0.02228888, -0.7011114, 2.93809, 0, 0.854902, 1, 1,
0.02388361, -0.548408, 4.043036, 0, 0.8509804, 1, 1,
0.02546223, 0.4535372, 0.1283209, 0, 0.8431373, 1, 1,
0.02607613, 0.9094092, 0.2822114, 0, 0.8392157, 1, 1,
0.0380374, -0.3954928, 1.7724, 0, 0.8313726, 1, 1,
0.03983809, 0.5824975, -0.1983872, 0, 0.827451, 1, 1,
0.04001789, 2.186435, 0.1640498, 0, 0.8196079, 1, 1,
0.04238139, 0.4032208, -2.057294, 0, 0.8156863, 1, 1,
0.0467339, -0.5613372, 4.252653, 0, 0.8078431, 1, 1,
0.04822301, -0.6083136, 3.444944, 0, 0.8039216, 1, 1,
0.04984836, -0.1351606, 2.682056, 0, 0.7960784, 1, 1,
0.0667844, -0.1196958, 1.969322, 0, 0.7882353, 1, 1,
0.06948389, -0.2696891, 2.777919, 0, 0.7843137, 1, 1,
0.070652, -0.1192605, 1.481122, 0, 0.7764706, 1, 1,
0.07184776, -0.4539234, 2.843366, 0, 0.772549, 1, 1,
0.0825053, 0.1284976, 1.656492, 0, 0.7647059, 1, 1,
0.08354169, 1.182838, -1.115266, 0, 0.7607843, 1, 1,
0.08811093, 1.294764, -1.352141, 0, 0.7529412, 1, 1,
0.08848444, -0.5727543, 3.404806, 0, 0.7490196, 1, 1,
0.08988576, 0.574285, 0.2263913, 0, 0.7411765, 1, 1,
0.09311095, 0.3059416, -1.013502, 0, 0.7372549, 1, 1,
0.09381174, -1.763386, 2.152307, 0, 0.7294118, 1, 1,
0.09414582, -0.08825479, 1.639178, 0, 0.7254902, 1, 1,
0.09675098, 0.6482285, -0.9202831, 0, 0.7176471, 1, 1,
0.09831948, 0.7266297, 0.474647, 0, 0.7137255, 1, 1,
0.09842799, 0.2689258, -1.147611, 0, 0.7058824, 1, 1,
0.1029469, 0.7565197, 1.816213, 0, 0.6980392, 1, 1,
0.1097339, -0.02525143, 1.789522, 0, 0.6941177, 1, 1,
0.1098194, 0.8169673, -0.1348931, 0, 0.6862745, 1, 1,
0.115184, 1.424072, -0.4784606, 0, 0.682353, 1, 1,
0.1159271, 1.287894, 0.2852206, 0, 0.6745098, 1, 1,
0.1189117, 0.3611916, 0.3054612, 0, 0.6705883, 1, 1,
0.1206167, 0.0205424, 2.717092, 0, 0.6627451, 1, 1,
0.1208513, 0.4714351, -0.7334424, 0, 0.6588235, 1, 1,
0.1236332, 0.1242942, 0.4424056, 0, 0.6509804, 1, 1,
0.1269635, 0.8603548, -1.201319, 0, 0.6470588, 1, 1,
0.1297749, 1.351486, -0.5437669, 0, 0.6392157, 1, 1,
0.1313352, -0.6035807, 3.554729, 0, 0.6352941, 1, 1,
0.131632, -0.4840883, 3.791186, 0, 0.627451, 1, 1,
0.1335527, -1.522305, 2.335626, 0, 0.6235294, 1, 1,
0.1338636, -0.4742723, 3.731852, 0, 0.6156863, 1, 1,
0.1355251, -2.184473, 3.663049, 0, 0.6117647, 1, 1,
0.1379838, -0.9206458, 2.854291, 0, 0.6039216, 1, 1,
0.1406227, 0.08872662, 0.1886902, 0, 0.5960785, 1, 1,
0.1439996, 1.643985, -0.8904848, 0, 0.5921569, 1, 1,
0.145476, 0.7083849, 0.2338089, 0, 0.5843138, 1, 1,
0.1477328, -0.3355396, 2.474083, 0, 0.5803922, 1, 1,
0.1517719, 1.941879, 0.4965121, 0, 0.572549, 1, 1,
0.1563411, 0.90266, 0.1007503, 0, 0.5686275, 1, 1,
0.158551, -1.511279, 2.22083, 0, 0.5607843, 1, 1,
0.1591457, 1.466729, 1.537765, 0, 0.5568628, 1, 1,
0.1594438, -0.03356307, 2.679638, 0, 0.5490196, 1, 1,
0.1649288, 2.729335, -2.227153, 0, 0.5450981, 1, 1,
0.1665817, -0.1768439, 2.168404, 0, 0.5372549, 1, 1,
0.1689855, -1.6932, 1.836082, 0, 0.5333334, 1, 1,
0.1766996, 0.5364981, 1.715608, 0, 0.5254902, 1, 1,
0.1778883, 0.7379877, 0.4334791, 0, 0.5215687, 1, 1,
0.1793431, 1.742131, 1.68815, 0, 0.5137255, 1, 1,
0.1811635, -0.8227057, 2.920479, 0, 0.509804, 1, 1,
0.1842986, -1.146309, 3.501189, 0, 0.5019608, 1, 1,
0.1866874, 0.0322298, 0.8940393, 0, 0.4941176, 1, 1,
0.1873119, 1.442742, 2.677653, 0, 0.4901961, 1, 1,
0.1894249, 1.389149, 0.5865797, 0, 0.4823529, 1, 1,
0.1899868, 0.9852561, 1.188673, 0, 0.4784314, 1, 1,
0.1936861, -0.4866594, 3.397797, 0, 0.4705882, 1, 1,
0.194429, -0.9080346, 3.325216, 0, 0.4666667, 1, 1,
0.1949776, -0.6684518, 2.191023, 0, 0.4588235, 1, 1,
0.1949894, -1.399246, 2.969138, 0, 0.454902, 1, 1,
0.200139, 0.2239859, 0.6867564, 0, 0.4470588, 1, 1,
0.2017535, -1.155066, 2.35666, 0, 0.4431373, 1, 1,
0.2031958, 1.540424, 0.2872366, 0, 0.4352941, 1, 1,
0.2088945, 0.5627452, 0.710014, 0, 0.4313726, 1, 1,
0.2101227, -0.8611417, 3.08976, 0, 0.4235294, 1, 1,
0.2144355, 0.2263587, 0.8538678, 0, 0.4196078, 1, 1,
0.2154446, 0.01449291, -0.1091034, 0, 0.4117647, 1, 1,
0.217289, -1.308256, 3.071528, 0, 0.4078431, 1, 1,
0.2235077, -1.670868, 2.79794, 0, 0.4, 1, 1,
0.2244238, -1.389343, 1.67379, 0, 0.3921569, 1, 1,
0.2244646, -0.3305594, 3.502731, 0, 0.3882353, 1, 1,
0.2286071, 0.7804785, -0.6690957, 0, 0.3803922, 1, 1,
0.2301947, -0.8017811, 4.075354, 0, 0.3764706, 1, 1,
0.2302216, 0.711143, 0.3589833, 0, 0.3686275, 1, 1,
0.2323761, 1.608493, 1.020345, 0, 0.3647059, 1, 1,
0.2331731, -0.4100968, 2.572637, 0, 0.3568628, 1, 1,
0.2376824, 0.761941, -0.9074365, 0, 0.3529412, 1, 1,
0.242679, 0.2079517, 0.3492822, 0, 0.345098, 1, 1,
0.2430134, 0.6442935, 0.8131841, 0, 0.3411765, 1, 1,
0.2450805, -0.9182314, 1.763053, 0, 0.3333333, 1, 1,
0.2487644, 0.2857957, 0.8631817, 0, 0.3294118, 1, 1,
0.2487944, -0.4156503, 3.063282, 0, 0.3215686, 1, 1,
0.2538109, -0.1988241, 2.330247, 0, 0.3176471, 1, 1,
0.2566777, 0.4574629, -0.1131476, 0, 0.3098039, 1, 1,
0.2578575, 0.1062347, 0.3728496, 0, 0.3058824, 1, 1,
0.282658, 0.5664684, 0.878495, 0, 0.2980392, 1, 1,
0.2842042, 0.9171788, 1.600701, 0, 0.2901961, 1, 1,
0.2862929, -0.5450876, 2.640995, 0, 0.2862745, 1, 1,
0.2863263, -0.2100147, 1.281705, 0, 0.2784314, 1, 1,
0.2909356, -0.832895, 2.088853, 0, 0.2745098, 1, 1,
0.2910354, 1.273792, 0.116902, 0, 0.2666667, 1, 1,
0.293501, -0.107713, 1.531222, 0, 0.2627451, 1, 1,
0.2982602, 1.687628, -1.283818, 0, 0.254902, 1, 1,
0.3029032, 0.01689014, 2.145327, 0, 0.2509804, 1, 1,
0.3043442, -1.764231, 1.822336, 0, 0.2431373, 1, 1,
0.3059532, 0.1542687, 1.082002, 0, 0.2392157, 1, 1,
0.3066036, 2.468788, 2.619314, 0, 0.2313726, 1, 1,
0.3150495, -0.6838115, 3.739495, 0, 0.227451, 1, 1,
0.3183598, 0.7331961, 2.387609, 0, 0.2196078, 1, 1,
0.3188978, 0.2378161, 1.234313, 0, 0.2156863, 1, 1,
0.3214994, -2.722754, 2.472369, 0, 0.2078431, 1, 1,
0.3241116, 0.9064977, -0.5453436, 0, 0.2039216, 1, 1,
0.3252458, -0.8507005, 4.577324, 0, 0.1960784, 1, 1,
0.3253551, -2.00852, 3.086694, 0, 0.1882353, 1, 1,
0.3265926, -1.569412, 3.475783, 0, 0.1843137, 1, 1,
0.328084, -1.126249, 1.786085, 0, 0.1764706, 1, 1,
0.3298163, -0.618238, 4.051239, 0, 0.172549, 1, 1,
0.3331297, -1.885198, 2.095936, 0, 0.1647059, 1, 1,
0.334173, 0.3577235, 1.726058, 0, 0.1607843, 1, 1,
0.3362648, 1.782676, -0.2078513, 0, 0.1529412, 1, 1,
0.3406814, -2.122348, 3.58681, 0, 0.1490196, 1, 1,
0.3442237, -0.03177913, 3.503118, 0, 0.1411765, 1, 1,
0.3511602, 0.5109677, 1.639754, 0, 0.1372549, 1, 1,
0.3516286, 0.08164449, 1.981576, 0, 0.1294118, 1, 1,
0.3542545, -0.6531751, 2.871629, 0, 0.1254902, 1, 1,
0.3553222, 0.7558914, -1.25839, 0, 0.1176471, 1, 1,
0.3619982, 2.036596, -0.9468943, 0, 0.1137255, 1, 1,
0.3629398, 0.3001738, 0.2505512, 0, 0.1058824, 1, 1,
0.3635369, -0.4618608, 3.265665, 0, 0.09803922, 1, 1,
0.3658004, 0.2272305, 2.596194, 0, 0.09411765, 1, 1,
0.3740488, -0.574899, 2.759373, 0, 0.08627451, 1, 1,
0.3780533, 0.5236324, 1.887751, 0, 0.08235294, 1, 1,
0.3823705, 0.2342103, 2.510074, 0, 0.07450981, 1, 1,
0.3828417, 0.4373071, 0.7763475, 0, 0.07058824, 1, 1,
0.3849415, -0.8406971, 1.289762, 0, 0.0627451, 1, 1,
0.387428, -0.6150824, 2.497828, 0, 0.05882353, 1, 1,
0.3891455, -0.04882032, 0.9917958, 0, 0.05098039, 1, 1,
0.3891851, 0.563032, 0.3055862, 0, 0.04705882, 1, 1,
0.389879, 0.5844776, 0.04303686, 0, 0.03921569, 1, 1,
0.3914996, -1.206135, 2.304625, 0, 0.03529412, 1, 1,
0.3923879, -1.362039, 3.741978, 0, 0.02745098, 1, 1,
0.3932302, -1.137126, 3.325331, 0, 0.02352941, 1, 1,
0.3938181, 0.0001943855, 3.159952, 0, 0.01568628, 1, 1,
0.3949405, 0.7553629, 0.1675503, 0, 0.01176471, 1, 1,
0.4009038, -0.2938718, 2.271442, 0, 0.003921569, 1, 1,
0.4014, -0.3808663, 4.528111, 0.003921569, 0, 1, 1,
0.4014113, -1.11494, 2.660126, 0.007843138, 0, 1, 1,
0.4070089, 1.75358, -0.0132968, 0.01568628, 0, 1, 1,
0.4095594, -0.7911987, 3.176947, 0.01960784, 0, 1, 1,
0.4097394, 0.1874471, 1.3394, 0.02745098, 0, 1, 1,
0.4098272, -0.08255972, 3.049465, 0.03137255, 0, 1, 1,
0.412959, -2.09887, 3.524709, 0.03921569, 0, 1, 1,
0.4191745, 0.3796781, 1.430671, 0.04313726, 0, 1, 1,
0.4218581, 1.021981, -0.6353459, 0.05098039, 0, 1, 1,
0.422032, -0.7435914, 2.213582, 0.05490196, 0, 1, 1,
0.4245991, 0.88667, 0.005504726, 0.0627451, 0, 1, 1,
0.4266913, -1.314434, 2.03339, 0.06666667, 0, 1, 1,
0.4302285, 0.1562875, 1.06489, 0.07450981, 0, 1, 1,
0.4318443, 0.801534, 0.5714285, 0.07843138, 0, 1, 1,
0.434093, -0.4958772, 3.611284, 0.08627451, 0, 1, 1,
0.4343964, 0.3343081, -0.528863, 0.09019608, 0, 1, 1,
0.4346766, -0.1494863, 0.6029465, 0.09803922, 0, 1, 1,
0.4398302, -1.015618, 2.856321, 0.1058824, 0, 1, 1,
0.440502, 2.15163, 1.361388, 0.1098039, 0, 1, 1,
0.4413664, -0.4605226, 2.281778, 0.1176471, 0, 1, 1,
0.4436631, 1.58185, 0.2918442, 0.1215686, 0, 1, 1,
0.4479664, 1.648138, 0.1587721, 0.1294118, 0, 1, 1,
0.4501814, 1.997895, 0.7729537, 0.1333333, 0, 1, 1,
0.4521756, -1.743356, 3.943273, 0.1411765, 0, 1, 1,
0.4566824, -0.1648794, 1.029757, 0.145098, 0, 1, 1,
0.4567966, -1.624122, 4.481633, 0.1529412, 0, 1, 1,
0.4587409, -1.27852, 2.746071, 0.1568628, 0, 1, 1,
0.4628792, 0.3601672, 0.5774974, 0.1647059, 0, 1, 1,
0.4658515, -0.5746051, 1.786043, 0.1686275, 0, 1, 1,
0.468311, 0.49564, 0.313048, 0.1764706, 0, 1, 1,
0.4697167, 0.1011881, 2.553851, 0.1803922, 0, 1, 1,
0.4708381, -1.333853, 4.479955, 0.1882353, 0, 1, 1,
0.4718678, -0.1788102, 1.828791, 0.1921569, 0, 1, 1,
0.4765263, -0.1329695, 0.6691952, 0.2, 0, 1, 1,
0.4814617, 0.4205719, 0.4851743, 0.2078431, 0, 1, 1,
0.4838184, -0.2091476, 1.367561, 0.2117647, 0, 1, 1,
0.4866713, -1.858187, 3.9066, 0.2196078, 0, 1, 1,
0.4881495, 0.4223632, 1.915572, 0.2235294, 0, 1, 1,
0.4905195, -0.8337038, 2.772687, 0.2313726, 0, 1, 1,
0.4955085, -0.4352753, 2.103935, 0.2352941, 0, 1, 1,
0.4963877, 0.1522887, 2.664802, 0.2431373, 0, 1, 1,
0.496677, -0.6109532, 3.134837, 0.2470588, 0, 1, 1,
0.49861, -0.8270167, 1.549154, 0.254902, 0, 1, 1,
0.499676, -0.3776301, 1.429993, 0.2588235, 0, 1, 1,
0.5003978, -0.3760705, 2.072909, 0.2666667, 0, 1, 1,
0.501391, 1.059811, 0.7093657, 0.2705882, 0, 1, 1,
0.5045071, -0.4641768, 2.465422, 0.2784314, 0, 1, 1,
0.5063779, 0.7188461, 1.672081, 0.282353, 0, 1, 1,
0.5178651, 0.01106451, 2.878839, 0.2901961, 0, 1, 1,
0.5286289, 1.219062, -1.123252, 0.2941177, 0, 1, 1,
0.5286555, 0.708858, 0.3151742, 0.3019608, 0, 1, 1,
0.545575, -0.00629162, 2.207016, 0.3098039, 0, 1, 1,
0.5576643, 0.616073, 1.163541, 0.3137255, 0, 1, 1,
0.5629095, -1.473876, 2.024904, 0.3215686, 0, 1, 1,
0.5630666, 0.3928747, 2.355571, 0.3254902, 0, 1, 1,
0.564244, -1.464547, 2.006289, 0.3333333, 0, 1, 1,
0.5681556, 0.6444388, -0.5978362, 0.3372549, 0, 1, 1,
0.5700586, 0.5618822, 3.658099, 0.345098, 0, 1, 1,
0.5728216, -0.5593074, 2.261042, 0.3490196, 0, 1, 1,
0.5729601, -0.005868935, 2.158053, 0.3568628, 0, 1, 1,
0.5730756, -0.6337161, 1.875924, 0.3607843, 0, 1, 1,
0.573844, 1.176039, 1.02286, 0.3686275, 0, 1, 1,
0.5747544, 0.5440167, -0.3080764, 0.372549, 0, 1, 1,
0.5775395, 0.2458542, 1.451229, 0.3803922, 0, 1, 1,
0.5852982, -0.9681175, 2.183411, 0.3843137, 0, 1, 1,
0.5861676, -0.02185271, 0.6552597, 0.3921569, 0, 1, 1,
0.5862089, -0.9559592, 2.206531, 0.3960784, 0, 1, 1,
0.5892876, -0.3184708, 0.8539804, 0.4039216, 0, 1, 1,
0.5905703, 0.09431376, 1.82071, 0.4117647, 0, 1, 1,
0.5909934, 1.200615, 1.12769, 0.4156863, 0, 1, 1,
0.6067281, -0.002395252, 2.577458, 0.4235294, 0, 1, 1,
0.6116821, -1.719712, 4.006999, 0.427451, 0, 1, 1,
0.6219814, -1.374357, 4.366848, 0.4352941, 0, 1, 1,
0.624993, 1.272205, 1.717328, 0.4392157, 0, 1, 1,
0.6265504, -0.6734146, 0.6555172, 0.4470588, 0, 1, 1,
0.628311, 2.308534, -1.258625, 0.4509804, 0, 1, 1,
0.631663, 1.960917, 0.7852798, 0.4588235, 0, 1, 1,
0.6322743, -0.5271421, 1.32739, 0.4627451, 0, 1, 1,
0.6348606, 0.06266496, -0.2256508, 0.4705882, 0, 1, 1,
0.6367741, 1.096398, 0.9727082, 0.4745098, 0, 1, 1,
0.6384898, 1.176119, 0.9821174, 0.4823529, 0, 1, 1,
0.639015, -0.367952, 2.298468, 0.4862745, 0, 1, 1,
0.640145, 0.9533401, 1.510874, 0.4941176, 0, 1, 1,
0.6503367, 0.2053998, 1.684877, 0.5019608, 0, 1, 1,
0.6519123, -2.054234, 3.492183, 0.5058824, 0, 1, 1,
0.6520272, -0.1606473, 1.718006, 0.5137255, 0, 1, 1,
0.6529068, 2.275826, -0.1450136, 0.5176471, 0, 1, 1,
0.656553, -0.5953292, 1.549883, 0.5254902, 0, 1, 1,
0.660032, 0.1850684, 2.177083, 0.5294118, 0, 1, 1,
0.6619527, -0.5665556, 0.8734879, 0.5372549, 0, 1, 1,
0.6626534, -1.435818, 2.627479, 0.5411765, 0, 1, 1,
0.6630925, 0.02887337, 3.419749, 0.5490196, 0, 1, 1,
0.6633766, 0.6814309, 0.6348038, 0.5529412, 0, 1, 1,
0.6635303, -0.8871721, 2.150904, 0.5607843, 0, 1, 1,
0.6640992, 0.6861234, 0.9620441, 0.5647059, 0, 1, 1,
0.6669534, -1.304796, 4.464927, 0.572549, 0, 1, 1,
0.6669539, -0.290207, -0.2710397, 0.5764706, 0, 1, 1,
0.688842, 1.058126, 1.224607, 0.5843138, 0, 1, 1,
0.6939256, -0.5477651, 1.851214, 0.5882353, 0, 1, 1,
0.6970278, 1.457058, 0.5881962, 0.5960785, 0, 1, 1,
0.7030175, -1.896271, 3.883876, 0.6039216, 0, 1, 1,
0.7034313, -0.05084956, 1.045421, 0.6078432, 0, 1, 1,
0.7054207, -0.9419907, 2.087827, 0.6156863, 0, 1, 1,
0.7068182, 0.4164456, 1.916227, 0.6196079, 0, 1, 1,
0.7131022, -0.3924087, 2.273961, 0.627451, 0, 1, 1,
0.7176464, 0.7184201, 1.308785, 0.6313726, 0, 1, 1,
0.7182726, 0.675626, 2.155834, 0.6392157, 0, 1, 1,
0.7186522, -1.067532, 2.362664, 0.6431373, 0, 1, 1,
0.7218688, 1.071589, 0.5925605, 0.6509804, 0, 1, 1,
0.723047, 0.6331764, 0.6271174, 0.654902, 0, 1, 1,
0.7311579, -0.5263093, 3.626191, 0.6627451, 0, 1, 1,
0.7385378, 0.3731076, 1.407661, 0.6666667, 0, 1, 1,
0.7393758, 0.3124627, 1.984553, 0.6745098, 0, 1, 1,
0.7462619, -0.385704, 2.776969, 0.6784314, 0, 1, 1,
0.7515088, -1.299289, 2.590321, 0.6862745, 0, 1, 1,
0.7515991, -0.6684815, 4.285052, 0.6901961, 0, 1, 1,
0.7557028, 0.02404348, -0.04504423, 0.6980392, 0, 1, 1,
0.7587441, -0.2915288, 1.812047, 0.7058824, 0, 1, 1,
0.7609929, -2.599071, 3.048513, 0.7098039, 0, 1, 1,
0.7610521, -0.5256281, 3.617552, 0.7176471, 0, 1, 1,
0.7642208, 0.3833859, 2.222506, 0.7215686, 0, 1, 1,
0.7721596, 0.2929019, 2.158059, 0.7294118, 0, 1, 1,
0.7730837, 0.2853296, 1.872743, 0.7333333, 0, 1, 1,
0.7745372, -0.6957929, 3.591137, 0.7411765, 0, 1, 1,
0.7786248, 2.55399, -0.4098051, 0.7450981, 0, 1, 1,
0.7802085, 0.8501247, 2.478651, 0.7529412, 0, 1, 1,
0.7820641, 0.06014501, 1.973854, 0.7568628, 0, 1, 1,
0.7868558, 0.3428079, -0.3196664, 0.7647059, 0, 1, 1,
0.8117512, -0.3582543, 2.391291, 0.7686275, 0, 1, 1,
0.8166901, -0.2480202, 3.444701, 0.7764706, 0, 1, 1,
0.821806, -0.03521925, 1.715623, 0.7803922, 0, 1, 1,
0.8226783, 0.6119832, 1.416713, 0.7882353, 0, 1, 1,
0.8252738, -1.636746, 2.915798, 0.7921569, 0, 1, 1,
0.8253295, 0.411095, 0.2447976, 0.8, 0, 1, 1,
0.8270537, 0.1746144, 1.145499, 0.8078431, 0, 1, 1,
0.828291, 0.2185933, 1.425303, 0.8117647, 0, 1, 1,
0.8297157, -0.02138192, 0.1735286, 0.8196079, 0, 1, 1,
0.8350793, 0.07480998, 1.788886, 0.8235294, 0, 1, 1,
0.8382524, 0.03448977, 1.972806, 0.8313726, 0, 1, 1,
0.8393208, 1.412319, 1.198316, 0.8352941, 0, 1, 1,
0.8424615, -0.06937763, 1.094057, 0.8431373, 0, 1, 1,
0.8512032, -0.1167571, 2.434898, 0.8470588, 0, 1, 1,
0.8516146, 0.5220276, 1.999745, 0.854902, 0, 1, 1,
0.8544205, -0.8546651, 4.310027, 0.8588235, 0, 1, 1,
0.8569198, 0.2150097, 1.19294, 0.8666667, 0, 1, 1,
0.8639739, 0.2111014, 0.9594196, 0.8705882, 0, 1, 1,
0.8670635, -1.147731, 4.505178, 0.8784314, 0, 1, 1,
0.8711536, 1.928116, -0.4651642, 0.8823529, 0, 1, 1,
0.8813242, 0.03087065, -0.1184276, 0.8901961, 0, 1, 1,
0.8926198, -0.04872328, 1.461996, 0.8941177, 0, 1, 1,
0.8952772, -2.207438, 2.959008, 0.9019608, 0, 1, 1,
0.9014415, -1.879241, 4.151752, 0.9098039, 0, 1, 1,
0.903824, 0.9477497, -1.292852, 0.9137255, 0, 1, 1,
0.9052364, 0.8928497, -1.262615, 0.9215686, 0, 1, 1,
0.906842, 1.437588, -0.8541998, 0.9254902, 0, 1, 1,
0.9119951, 1.621947, 0.871374, 0.9333333, 0, 1, 1,
0.9125302, -0.6887349, -0.1936456, 0.9372549, 0, 1, 1,
0.9127948, 0.4460148, 0.5810621, 0.945098, 0, 1, 1,
0.9179317, 0.5669088, 1.40869, 0.9490196, 0, 1, 1,
0.9197859, 1.428801, -0.06720758, 0.9568627, 0, 1, 1,
0.9216002, 1.684006, -0.1333539, 0.9607843, 0, 1, 1,
0.9229383, -0.3667089, 1.232673, 0.9686275, 0, 1, 1,
0.9242082, -0.5788887, 1.299021, 0.972549, 0, 1, 1,
0.9246348, -1.615202, 3.056578, 0.9803922, 0, 1, 1,
0.9277056, 1.086601, 0.06149731, 0.9843137, 0, 1, 1,
0.9283059, 0.04394415, 0.8797839, 0.9921569, 0, 1, 1,
0.9337031, 0.6351665, 1.73031, 0.9960784, 0, 1, 1,
0.9385356, -1.796133, 1.257722, 1, 0, 0.9960784, 1,
0.9446837, 0.2088357, 1.493479, 1, 0, 0.9882353, 1,
0.9447835, 0.9935374, -0.1199055, 1, 0, 0.9843137, 1,
0.9488472, 1.95875, 0.1292505, 1, 0, 0.9764706, 1,
0.9523683, -0.9542592, 3.338823, 1, 0, 0.972549, 1,
0.9537769, -1.815061, 2.644797, 1, 0, 0.9647059, 1,
0.9548088, -0.253295, 0.03569588, 1, 0, 0.9607843, 1,
0.9578407, 0.9795824, 1.892127, 1, 0, 0.9529412, 1,
0.9601352, -1.472546, 3.460099, 1, 0, 0.9490196, 1,
0.9735845, -0.8221989, 3.109763, 1, 0, 0.9411765, 1,
0.9746806, 0.5132878, 1.03869, 1, 0, 0.9372549, 1,
0.9746917, -0.3321739, 1.39978, 1, 0, 0.9294118, 1,
0.9763247, -0.5940018, 2.528621, 1, 0, 0.9254902, 1,
0.9780838, -0.4086999, 1.606057, 1, 0, 0.9176471, 1,
0.9798831, 0.5489865, -0.2839864, 1, 0, 0.9137255, 1,
0.9867294, -1.169931, 1.490328, 1, 0, 0.9058824, 1,
0.9878808, 0.1101463, 1.242106, 1, 0, 0.9019608, 1,
0.9893053, 0.3129665, 1.492271, 1, 0, 0.8941177, 1,
0.9923317, -0.09454408, 2.342834, 1, 0, 0.8862745, 1,
0.9967456, -0.3096259, 1.49684, 1, 0, 0.8823529, 1,
0.9975824, -0.6620518, 2.075319, 1, 0, 0.8745098, 1,
1.006038, -0.8520423, 2.422616, 1, 0, 0.8705882, 1,
1.00637, 0.4395943, 2.577766, 1, 0, 0.8627451, 1,
1.011393, -0.424445, 1.297467, 1, 0, 0.8588235, 1,
1.012534, -0.3249683, 1.568672, 1, 0, 0.8509804, 1,
1.013305, -0.641274, 1.916348, 1, 0, 0.8470588, 1,
1.014482, -0.9185612, 3.383577, 1, 0, 0.8392157, 1,
1.017984, 1.110629, 1.780583, 1, 0, 0.8352941, 1,
1.019661, 0.7507555, 0.8478323, 1, 0, 0.827451, 1,
1.020239, 1.656196, 0.781372, 1, 0, 0.8235294, 1,
1.025679, -0.2134728, 3.334052, 1, 0, 0.8156863, 1,
1.028985, 0.7538356, 1.769562, 1, 0, 0.8117647, 1,
1.044848, -0.4975114, 2.778636, 1, 0, 0.8039216, 1,
1.04594, 0.1391973, 0.9221019, 1, 0, 0.7960784, 1,
1.048582, 0.6297918, -1.827102, 1, 0, 0.7921569, 1,
1.049216, -0.2129791, 1.842193, 1, 0, 0.7843137, 1,
1.04996, 0.2413669, -0.4492244, 1, 0, 0.7803922, 1,
1.055229, -1.146566, 1.018026, 1, 0, 0.772549, 1,
1.075028, -0.6599669, 1.699193, 1, 0, 0.7686275, 1,
1.076432, -0.6825397, 3.305317, 1, 0, 0.7607843, 1,
1.08568, 0.3457926, 0.6629949, 1, 0, 0.7568628, 1,
1.087803, 1.60493, 0.9064934, 1, 0, 0.7490196, 1,
1.092576, -0.01724188, -0.5559469, 1, 0, 0.7450981, 1,
1.100267, 0.4897069, 1.042012, 1, 0, 0.7372549, 1,
1.100763, -0.2579012, 3.22947, 1, 0, 0.7333333, 1,
1.116392, 1.190853, 0.911544, 1, 0, 0.7254902, 1,
1.122898, 0.8250604, -0.05288739, 1, 0, 0.7215686, 1,
1.125113, 0.6393606, 1.369347, 1, 0, 0.7137255, 1,
1.126454, -0.6924616, 0.7215534, 1, 0, 0.7098039, 1,
1.130454, -1.878002, 3.612592, 1, 0, 0.7019608, 1,
1.136911, -0.05408753, 0.3843414, 1, 0, 0.6941177, 1,
1.141681, 0.6575072, 0.848223, 1, 0, 0.6901961, 1,
1.142035, -1.251519, 1.885535, 1, 0, 0.682353, 1,
1.155619, 0.1042297, 1.097997, 1, 0, 0.6784314, 1,
1.156397, -0.3840395, 2.322026, 1, 0, 0.6705883, 1,
1.156954, 0.03311069, 0.5504233, 1, 0, 0.6666667, 1,
1.158318, 1.041768, 1.72219, 1, 0, 0.6588235, 1,
1.160649, 0.4633658, 2.429203, 1, 0, 0.654902, 1,
1.167811, 0.3070175, 1.74458, 1, 0, 0.6470588, 1,
1.17154, 0.3395392, 1.633685, 1, 0, 0.6431373, 1,
1.183077, 0.1020177, 1.75104, 1, 0, 0.6352941, 1,
1.18918, 0.9553803, 0.5371439, 1, 0, 0.6313726, 1,
1.192641, -0.1227744, 1.939694, 1, 0, 0.6235294, 1,
1.193565, -0.5617031, 3.137775, 1, 0, 0.6196079, 1,
1.198215, 0.8388855, 1.077788, 1, 0, 0.6117647, 1,
1.20547, -0.0242896, 3.173091, 1, 0, 0.6078432, 1,
1.206043, 0.0988113, 2.604528, 1, 0, 0.6, 1,
1.213174, 1.923705, 1.270644, 1, 0, 0.5921569, 1,
1.215157, -0.5715874, 3.041153, 1, 0, 0.5882353, 1,
1.219951, 1.208479, 0.8326441, 1, 0, 0.5803922, 1,
1.239176, -0.1821872, 2.445991, 1, 0, 0.5764706, 1,
1.248143, -0.1085216, 2.30277, 1, 0, 0.5686275, 1,
1.248939, -0.5507807, 0.9257573, 1, 0, 0.5647059, 1,
1.250571, 1.238865, -0.2073366, 1, 0, 0.5568628, 1,
1.254039, 0.0007746052, 1.542925, 1, 0, 0.5529412, 1,
1.255353, 0.2571984, 2.177263, 1, 0, 0.5450981, 1,
1.265448, 0.111278, 2.171136, 1, 0, 0.5411765, 1,
1.269652, -0.02815064, 1.158424, 1, 0, 0.5333334, 1,
1.273365, -0.1380268, 1.957552, 1, 0, 0.5294118, 1,
1.285066, -0.2319549, 1.917845, 1, 0, 0.5215687, 1,
1.285701, -0.5908046, 0.7709375, 1, 0, 0.5176471, 1,
1.289467, 0.466616, 2.816726, 1, 0, 0.509804, 1,
1.303626, 0.02791223, 0.1801251, 1, 0, 0.5058824, 1,
1.313366, -0.5141086, 1.221013, 1, 0, 0.4980392, 1,
1.334036, 0.9763567, -0.2657942, 1, 0, 0.4901961, 1,
1.343159, 0.9060578, 1.568102, 1, 0, 0.4862745, 1,
1.369793, 0.4323485, 1.549528, 1, 0, 0.4784314, 1,
1.386204, 0.01816093, 0.9115951, 1, 0, 0.4745098, 1,
1.392489, -0.1638898, 1.405098, 1, 0, 0.4666667, 1,
1.394105, -0.7008887, 3.400163, 1, 0, 0.4627451, 1,
1.394936, -0.6741359, 1.810977, 1, 0, 0.454902, 1,
1.405118, 1.102426, -0.0947541, 1, 0, 0.4509804, 1,
1.413993, -0.1082004, 1.492872, 1, 0, 0.4431373, 1,
1.419481, 1.182503, -0.2731244, 1, 0, 0.4392157, 1,
1.423402, 0.140001, 0.2870078, 1, 0, 0.4313726, 1,
1.432351, -0.216348, 1.956575, 1, 0, 0.427451, 1,
1.438252, 1.253627, 0.6051137, 1, 0, 0.4196078, 1,
1.445711, -1.042081, 1.530095, 1, 0, 0.4156863, 1,
1.448477, 0.1959039, 2.133531, 1, 0, 0.4078431, 1,
1.451494, 0.4881353, 1.972011, 1, 0, 0.4039216, 1,
1.461847, 1.236498, 1.543957, 1, 0, 0.3960784, 1,
1.465647, 0.3541918, 1.743721, 1, 0, 0.3882353, 1,
1.468469, -1.173763, 2.659066, 1, 0, 0.3843137, 1,
1.474341, -1.084982, 1.172906, 1, 0, 0.3764706, 1,
1.477229, -1.095085, 2.327451, 1, 0, 0.372549, 1,
1.482746, -0.5211104, 0.9960936, 1, 0, 0.3647059, 1,
1.484544, -0.8003623, 2.76841, 1, 0, 0.3607843, 1,
1.495095, -0.8461756, 2.271628, 1, 0, 0.3529412, 1,
1.496115, 0.5798033, 0.4790177, 1, 0, 0.3490196, 1,
1.497364, -0.5753169, 2.565342, 1, 0, 0.3411765, 1,
1.500571, -0.7181294, 1.369614, 1, 0, 0.3372549, 1,
1.505444, -0.4600494, 2.19706, 1, 0, 0.3294118, 1,
1.517572, -0.06642838, 0.09367543, 1, 0, 0.3254902, 1,
1.5204, -1.352886, 3.060989, 1, 0, 0.3176471, 1,
1.530851, 0.04536547, 1.564079, 1, 0, 0.3137255, 1,
1.533153, -0.1090881, 1.807608, 1, 0, 0.3058824, 1,
1.535554, -1.258996, 0.7170552, 1, 0, 0.2980392, 1,
1.56417, 0.3504901, 2.904151, 1, 0, 0.2941177, 1,
1.567253, -0.7125612, 1.76421, 1, 0, 0.2862745, 1,
1.569282, 0.6871372, -0.5887774, 1, 0, 0.282353, 1,
1.579854, 0.07508487, 2.500151, 1, 0, 0.2745098, 1,
1.582957, -0.207938, 0.9123157, 1, 0, 0.2705882, 1,
1.590121, -0.5823025, 0.989053, 1, 0, 0.2627451, 1,
1.604466, -0.2483075, -0.3797583, 1, 0, 0.2588235, 1,
1.607744, 0.8413262, 0.1711548, 1, 0, 0.2509804, 1,
1.608389, 0.7122787, 0.4950596, 1, 0, 0.2470588, 1,
1.615689, -0.2427258, 1.973854, 1, 0, 0.2392157, 1,
1.647742, -1.347316, 2.219473, 1, 0, 0.2352941, 1,
1.665067, 0.7886378, 1.332799, 1, 0, 0.227451, 1,
1.667157, 0.03991755, 1.785987, 1, 0, 0.2235294, 1,
1.670959, -1.302941, 3.478095, 1, 0, 0.2156863, 1,
1.673018, 0.4529427, 1.126212, 1, 0, 0.2117647, 1,
1.68584, 0.1001183, -0.8988706, 1, 0, 0.2039216, 1,
1.700638, 0.06590331, -0.3753245, 1, 0, 0.1960784, 1,
1.705765, 1.284978, 0.5747227, 1, 0, 0.1921569, 1,
1.709293, -1.167082, 2.142228, 1, 0, 0.1843137, 1,
1.711393, -1.761557, 1.707019, 1, 0, 0.1803922, 1,
1.714701, 0.2333224, 2.170667, 1, 0, 0.172549, 1,
1.733784, -1.154184, 1.770104, 1, 0, 0.1686275, 1,
1.781437, -0.1995842, 2.840561, 1, 0, 0.1607843, 1,
1.79737, -0.518492, 0.6449286, 1, 0, 0.1568628, 1,
1.805115, -0.09772766, 0.02082012, 1, 0, 0.1490196, 1,
1.840035, 0.1418264, 2.457972, 1, 0, 0.145098, 1,
1.853194, -2.65254, 2.990144, 1, 0, 0.1372549, 1,
1.863722, -0.742551, 1.916507, 1, 0, 0.1333333, 1,
1.86702, 1.160847, 0.2167449, 1, 0, 0.1254902, 1,
1.891408, 0.4390988, 1.0582, 1, 0, 0.1215686, 1,
1.899682, -0.1667882, 0.7078539, 1, 0, 0.1137255, 1,
1.905423, -0.4662054, 3.272893, 1, 0, 0.1098039, 1,
1.916281, -0.1878284, 1.274082, 1, 0, 0.1019608, 1,
1.922102, 0.9024776, 3.107523, 1, 0, 0.09411765, 1,
1.925688, -0.2706895, 0.8135797, 1, 0, 0.09019608, 1,
2.024215, -0.9388104, 1.097584, 1, 0, 0.08235294, 1,
2.080998, -0.5037866, 3.767614, 1, 0, 0.07843138, 1,
2.093596, -0.5059265, 2.462582, 1, 0, 0.07058824, 1,
2.131623, 0.1327576, 1.855708, 1, 0, 0.06666667, 1,
2.162413, 0.883653, 0.7628114, 1, 0, 0.05882353, 1,
2.225998, 0.006469694, 1.102297, 1, 0, 0.05490196, 1,
2.259266, -0.004737598, 3.448973, 1, 0, 0.04705882, 1,
2.385766, -1.166019, 2.284509, 1, 0, 0.04313726, 1,
2.38604, -0.752947, -0.42274, 1, 0, 0.03529412, 1,
2.421972, 0.8816101, 1.93335, 1, 0, 0.03137255, 1,
2.466957, 0.7012811, 0.8880485, 1, 0, 0.02352941, 1,
2.475612, -0.9447506, 1.276198, 1, 0, 0.01960784, 1,
2.51459, -0.1630625, 1.248865, 1, 0, 0.01176471, 1,
2.729573, 0.4454983, 2.455091, 1, 0, 0.007843138, 1
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
-0.461998, -4.117033, -6.978308, 0, -0.5, 0.5, 0.5,
-0.461998, -4.117033, -6.978308, 1, -0.5, 0.5, 0.5,
-0.461998, -4.117033, -6.978308, 1, 1.5, 0.5, 0.5,
-0.461998, -4.117033, -6.978308, 0, 1.5, 0.5, 0.5
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
-4.735511, -0.1039439, -6.978308, 0, -0.5, 0.5, 0.5,
-4.735511, -0.1039439, -6.978308, 1, -0.5, 0.5, 0.5,
-4.735511, -0.1039439, -6.978308, 1, 1.5, 0.5, 0.5,
-4.735511, -0.1039439, -6.978308, 0, 1.5, 0.5, 0.5
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
-4.735511, -4.117033, -0.3630912, 0, -0.5, 0.5, 0.5,
-4.735511, -4.117033, -0.3630912, 1, -0.5, 0.5, 0.5,
-4.735511, -4.117033, -0.3630912, 1, 1.5, 0.5, 0.5,
-4.735511, -4.117033, -0.3630912, 0, 1.5, 0.5, 0.5
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
-3, -3.190935, -5.451719,
2, -3.190935, -5.451719,
-3, -3.190935, -5.451719,
-3, -3.345285, -5.706151,
-2, -3.190935, -5.451719,
-2, -3.345285, -5.706151,
-1, -3.190935, -5.451719,
-1, -3.345285, -5.706151,
0, -3.190935, -5.451719,
0, -3.345285, -5.706151,
1, -3.190935, -5.451719,
1, -3.345285, -5.706151,
2, -3.190935, -5.451719,
2, -3.345285, -5.706151
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
-3, -3.653984, -6.215014, 0, -0.5, 0.5, 0.5,
-3, -3.653984, -6.215014, 1, -0.5, 0.5, 0.5,
-3, -3.653984, -6.215014, 1, 1.5, 0.5, 0.5,
-3, -3.653984, -6.215014, 0, 1.5, 0.5, 0.5,
-2, -3.653984, -6.215014, 0, -0.5, 0.5, 0.5,
-2, -3.653984, -6.215014, 1, -0.5, 0.5, 0.5,
-2, -3.653984, -6.215014, 1, 1.5, 0.5, 0.5,
-2, -3.653984, -6.215014, 0, 1.5, 0.5, 0.5,
-1, -3.653984, -6.215014, 0, -0.5, 0.5, 0.5,
-1, -3.653984, -6.215014, 1, -0.5, 0.5, 0.5,
-1, -3.653984, -6.215014, 1, 1.5, 0.5, 0.5,
-1, -3.653984, -6.215014, 0, 1.5, 0.5, 0.5,
0, -3.653984, -6.215014, 0, -0.5, 0.5, 0.5,
0, -3.653984, -6.215014, 1, -0.5, 0.5, 0.5,
0, -3.653984, -6.215014, 1, 1.5, 0.5, 0.5,
0, -3.653984, -6.215014, 0, 1.5, 0.5, 0.5,
1, -3.653984, -6.215014, 0, -0.5, 0.5, 0.5,
1, -3.653984, -6.215014, 1, -0.5, 0.5, 0.5,
1, -3.653984, -6.215014, 1, 1.5, 0.5, 0.5,
1, -3.653984, -6.215014, 0, 1.5, 0.5, 0.5,
2, -3.653984, -6.215014, 0, -0.5, 0.5, 0.5,
2, -3.653984, -6.215014, 1, -0.5, 0.5, 0.5,
2, -3.653984, -6.215014, 1, 1.5, 0.5, 0.5,
2, -3.653984, -6.215014, 0, 1.5, 0.5, 0.5
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
-3.749316, -3, -5.451719,
-3.749316, 2, -5.451719,
-3.749316, -3, -5.451719,
-3.913682, -3, -5.706151,
-3.749316, -2, -5.451719,
-3.913682, -2, -5.706151,
-3.749316, -1, -5.451719,
-3.913682, -1, -5.706151,
-3.749316, 0, -5.451719,
-3.913682, 0, -5.706151,
-3.749316, 1, -5.451719,
-3.913682, 1, -5.706151,
-3.749316, 2, -5.451719,
-3.913682, 2, -5.706151
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
-4.242413, -3, -6.215014, 0, -0.5, 0.5, 0.5,
-4.242413, -3, -6.215014, 1, -0.5, 0.5, 0.5,
-4.242413, -3, -6.215014, 1, 1.5, 0.5, 0.5,
-4.242413, -3, -6.215014, 0, 1.5, 0.5, 0.5,
-4.242413, -2, -6.215014, 0, -0.5, 0.5, 0.5,
-4.242413, -2, -6.215014, 1, -0.5, 0.5, 0.5,
-4.242413, -2, -6.215014, 1, 1.5, 0.5, 0.5,
-4.242413, -2, -6.215014, 0, 1.5, 0.5, 0.5,
-4.242413, -1, -6.215014, 0, -0.5, 0.5, 0.5,
-4.242413, -1, -6.215014, 1, -0.5, 0.5, 0.5,
-4.242413, -1, -6.215014, 1, 1.5, 0.5, 0.5,
-4.242413, -1, -6.215014, 0, 1.5, 0.5, 0.5,
-4.242413, 0, -6.215014, 0, -0.5, 0.5, 0.5,
-4.242413, 0, -6.215014, 1, -0.5, 0.5, 0.5,
-4.242413, 0, -6.215014, 1, 1.5, 0.5, 0.5,
-4.242413, 0, -6.215014, 0, 1.5, 0.5, 0.5,
-4.242413, 1, -6.215014, 0, -0.5, 0.5, 0.5,
-4.242413, 1, -6.215014, 1, -0.5, 0.5, 0.5,
-4.242413, 1, -6.215014, 1, 1.5, 0.5, 0.5,
-4.242413, 1, -6.215014, 0, 1.5, 0.5, 0.5,
-4.242413, 2, -6.215014, 0, -0.5, 0.5, 0.5,
-4.242413, 2, -6.215014, 1, -0.5, 0.5, 0.5,
-4.242413, 2, -6.215014, 1, 1.5, 0.5, 0.5,
-4.242413, 2, -6.215014, 0, 1.5, 0.5, 0.5
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
-3.749316, -3.190935, -4,
-3.749316, -3.190935, 4,
-3.749316, -3.190935, -4,
-3.913682, -3.345285, -4,
-3.749316, -3.190935, -2,
-3.913682, -3.345285, -2,
-3.749316, -3.190935, 0,
-3.913682, -3.345285, 0,
-3.749316, -3.190935, 2,
-3.913682, -3.345285, 2,
-3.749316, -3.190935, 4,
-3.913682, -3.345285, 4
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
-4.242413, -3.653984, -4, 0, -0.5, 0.5, 0.5,
-4.242413, -3.653984, -4, 1, -0.5, 0.5, 0.5,
-4.242413, -3.653984, -4, 1, 1.5, 0.5, 0.5,
-4.242413, -3.653984, -4, 0, 1.5, 0.5, 0.5,
-4.242413, -3.653984, -2, 0, -0.5, 0.5, 0.5,
-4.242413, -3.653984, -2, 1, -0.5, 0.5, 0.5,
-4.242413, -3.653984, -2, 1, 1.5, 0.5, 0.5,
-4.242413, -3.653984, -2, 0, 1.5, 0.5, 0.5,
-4.242413, -3.653984, 0, 0, -0.5, 0.5, 0.5,
-4.242413, -3.653984, 0, 1, -0.5, 0.5, 0.5,
-4.242413, -3.653984, 0, 1, 1.5, 0.5, 0.5,
-4.242413, -3.653984, 0, 0, 1.5, 0.5, 0.5,
-4.242413, -3.653984, 2, 0, -0.5, 0.5, 0.5,
-4.242413, -3.653984, 2, 1, -0.5, 0.5, 0.5,
-4.242413, -3.653984, 2, 1, 1.5, 0.5, 0.5,
-4.242413, -3.653984, 2, 0, 1.5, 0.5, 0.5,
-4.242413, -3.653984, 4, 0, -0.5, 0.5, 0.5,
-4.242413, -3.653984, 4, 1, -0.5, 0.5, 0.5,
-4.242413, -3.653984, 4, 1, 1.5, 0.5, 0.5,
-4.242413, -3.653984, 4, 0, 1.5, 0.5, 0.5
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
-3.749316, -3.190935, -5.451719,
-3.749316, 2.983047, -5.451719,
-3.749316, -3.190935, 4.725537,
-3.749316, 2.983047, 4.725537,
-3.749316, -3.190935, -5.451719,
-3.749316, -3.190935, 4.725537,
-3.749316, 2.983047, -5.451719,
-3.749316, 2.983047, 4.725537,
-3.749316, -3.190935, -5.451719,
2.82532, -3.190935, -5.451719,
-3.749316, -3.190935, 4.725537,
2.82532, -3.190935, 4.725537,
-3.749316, 2.983047, -5.451719,
2.82532, 2.983047, -5.451719,
-3.749316, 2.983047, 4.725537,
2.82532, 2.983047, 4.725537,
2.82532, -3.190935, -5.451719,
2.82532, 2.983047, -5.451719,
2.82532, -3.190935, 4.725537,
2.82532, 2.983047, 4.725537,
2.82532, -3.190935, -5.451719,
2.82532, -3.190935, 4.725537,
2.82532, 2.983047, -5.451719,
2.82532, 2.983047, 4.725537
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
var radius = 7.261359;
var distance = 32.30661;
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
mvMatrix.translate( 0.461998, 0.1039439, 0.3630912 );
mvMatrix.scale( 1.194154, 1.271646, 0.7714382 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.30661);
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
acetamide<-read.table("acetamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acetamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetamide' not found
```

```r
y<-acetamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetamide' not found
```

```r
z<-acetamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetamide' not found
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
-3.653569, -0.4455039, -1.94758, 0, 0, 1, 1, 1,
-3.059787, -0.7199892, -3.145923, 1, 0, 0, 1, 1,
-2.95358, -1.381772, -1.374447, 1, 0, 0, 1, 1,
-2.47321, 0.08130419, -2.285404, 1, 0, 0, 1, 1,
-2.471651, 1.671428, 0.1828005, 1, 0, 0, 1, 1,
-2.38831, 0.6264795, -0.8470548, 1, 0, 0, 1, 1,
-2.372981, -0.1725065, -1.347876, 0, 0, 0, 1, 1,
-2.268097, 0.5163466, 0.6184711, 0, 0, 0, 1, 1,
-2.267189, -0.9153773, -1.751656, 0, 0, 0, 1, 1,
-2.256114, 0.8959489, -0.8201983, 0, 0, 0, 1, 1,
-2.246711, -0.6317793, -2.612595, 0, 0, 0, 1, 1,
-2.219297, -0.1684644, -1.268225, 0, 0, 0, 1, 1,
-2.167372, 0.6478466, -0.6931338, 0, 0, 0, 1, 1,
-2.161656, -0.431432, -2.085019, 1, 1, 1, 1, 1,
-2.112677, -0.3909676, -4.338009, 1, 1, 1, 1, 1,
-2.099658, -2.020245, -2.103264, 1, 1, 1, 1, 1,
-2.047846, -0.3938167, -0.1631548, 1, 1, 1, 1, 1,
-2.036972, 1.273654, -1.051534, 1, 1, 1, 1, 1,
-2.033058, -0.8431512, -2.783127, 1, 1, 1, 1, 1,
-2.004999, -0.4940518, -1.446994, 1, 1, 1, 1, 1,
-2.002182, -1.629508, -1.014065, 1, 1, 1, 1, 1,
-1.957999, -0.4464812, -0.628726, 1, 1, 1, 1, 1,
-1.956051, -0.5090923, -3.396867, 1, 1, 1, 1, 1,
-1.948199, -2.142667, -2.897265, 1, 1, 1, 1, 1,
-1.939717, 0.081986, -1.068046, 1, 1, 1, 1, 1,
-1.899282, 0.6648026, -1.908265, 1, 1, 1, 1, 1,
-1.8948, -1.157195, -2.859761, 1, 1, 1, 1, 1,
-1.890952, -1.67584, -2.257552, 1, 1, 1, 1, 1,
-1.890438, 0.2115154, -2.108334, 0, 0, 1, 1, 1,
-1.88399, 1.566204, 1.358872, 1, 0, 0, 1, 1,
-1.883858, -1.305077, -2.391179, 1, 0, 0, 1, 1,
-1.852517, -0.8449758, -2.927429, 1, 0, 0, 1, 1,
-1.852304, 0.3660995, -2.050238, 1, 0, 0, 1, 1,
-1.838259, -0.8597083, -2.020429, 1, 0, 0, 1, 1,
-1.801868, -0.04509513, -3.035106, 0, 0, 0, 1, 1,
-1.781543, -1.596412, -1.149341, 0, 0, 0, 1, 1,
-1.780758, -0.1691793, -3.95812, 0, 0, 0, 1, 1,
-1.778991, -0.6572105, -0.9332628, 0, 0, 0, 1, 1,
-1.75733, 1.384631, -1.935202, 0, 0, 0, 1, 1,
-1.729762, 0.0759614, -1.254951, 0, 0, 0, 1, 1,
-1.719153, -0.5215477, -1.186643, 0, 0, 0, 1, 1,
-1.708972, -0.3228278, -2.184871, 1, 1, 1, 1, 1,
-1.673641, -0.2888728, -1.681449, 1, 1, 1, 1, 1,
-1.664542, -0.7667199, -4.956375, 1, 1, 1, 1, 1,
-1.662804, 0.3358639, -1.189274, 1, 1, 1, 1, 1,
-1.641821, 1.516916, 1.588407, 1, 1, 1, 1, 1,
-1.627015, 0.8412104, 0.1159234, 1, 1, 1, 1, 1,
-1.616033, -0.05096064, -1.752942, 1, 1, 1, 1, 1,
-1.610206, 0.3021982, -0.8375642, 1, 1, 1, 1, 1,
-1.608365, -1.409245, -2.340591, 1, 1, 1, 1, 1,
-1.601923, 2.317645, -0.3088562, 1, 1, 1, 1, 1,
-1.596187, 1.542883, -0.1249463, 1, 1, 1, 1, 1,
-1.592697, -1.112752, -0.9683269, 1, 1, 1, 1, 1,
-1.586632, -0.7727053, -1.299002, 1, 1, 1, 1, 1,
-1.579857, -0.3381175, -0.8368328, 1, 1, 1, 1, 1,
-1.567156, -0.2210183, -0.4198742, 1, 1, 1, 1, 1,
-1.559921, -1.786826, -1.860546, 0, 0, 1, 1, 1,
-1.556274, -0.9456053, -3.213504, 1, 0, 0, 1, 1,
-1.546634, -0.9079043, -0.6044926, 1, 0, 0, 1, 1,
-1.545712, -0.1877269, -3.031486, 1, 0, 0, 1, 1,
-1.544932, 0.7306919, -0.7702511, 1, 0, 0, 1, 1,
-1.524417, -0.205027, -3.237351, 1, 0, 0, 1, 1,
-1.513931, -1.951137, -2.477195, 0, 0, 0, 1, 1,
-1.500345, 0.3644739, -1.1536, 0, 0, 0, 1, 1,
-1.490796, 1.171591, -1.486114, 0, 0, 0, 1, 1,
-1.489281, -1.335836, -3.110054, 0, 0, 0, 1, 1,
-1.481394, 0.3949915, -0.3574533, 0, 0, 0, 1, 1,
-1.479394, 0.4587644, -1.635297, 0, 0, 0, 1, 1,
-1.474064, 1.276808, -2.428585, 0, 0, 0, 1, 1,
-1.469257, -0.7952006, -1.634119, 1, 1, 1, 1, 1,
-1.464412, -1.548916, -3.714033, 1, 1, 1, 1, 1,
-1.448858, -0.2583071, -3.899121, 1, 1, 1, 1, 1,
-1.4397, 0.6541056, -2.066316, 1, 1, 1, 1, 1,
-1.438655, -0.9079861, -0.002779274, 1, 1, 1, 1, 1,
-1.434173, 0.3583668, 0.8558145, 1, 1, 1, 1, 1,
-1.425649, 0.6800579, -1.002515, 1, 1, 1, 1, 1,
-1.423547, -0.8575042, -1.681158, 1, 1, 1, 1, 1,
-1.42271, -0.4751533, -0.8737885, 1, 1, 1, 1, 1,
-1.418747, -1.467333, -2.675759, 1, 1, 1, 1, 1,
-1.418612, 0.678486, 0.01631762, 1, 1, 1, 1, 1,
-1.412806, -0.410009, -0.9931455, 1, 1, 1, 1, 1,
-1.407534, 0.6727911, 0.1546105, 1, 1, 1, 1, 1,
-1.397813, -1.175578, -1.493235, 1, 1, 1, 1, 1,
-1.395199, 0.3652295, -3.966696, 1, 1, 1, 1, 1,
-1.381093, 0.6025139, -1.313153, 0, 0, 1, 1, 1,
-1.371075, -1.142086, -0.8399355, 1, 0, 0, 1, 1,
-1.351814, 0.9231991, 0.01984326, 1, 0, 0, 1, 1,
-1.343843, 0.2858908, -3.316468, 1, 0, 0, 1, 1,
-1.342522, 0.696307, -0.3133484, 1, 0, 0, 1, 1,
-1.341231, -0.4084592, -0.9337282, 1, 0, 0, 1, 1,
-1.334454, 0.5031277, -2.055613, 0, 0, 0, 1, 1,
-1.323189, -0.4849381, -3.083334, 0, 0, 0, 1, 1,
-1.314938, -0.1226508, -2.563012, 0, 0, 0, 1, 1,
-1.31405, -1.225219, -0.5967149, 0, 0, 0, 1, 1,
-1.30285, -1.217145, -2.580081, 0, 0, 0, 1, 1,
-1.300255, 0.03188097, -0.5199819, 0, 0, 0, 1, 1,
-1.298142, -0.1789083, -2.182142, 0, 0, 0, 1, 1,
-1.287416, -0.7484615, -3.840787, 1, 1, 1, 1, 1,
-1.284716, 0.6275496, 0.2680075, 1, 1, 1, 1, 1,
-1.278904, 1.464563, -0.9422169, 1, 1, 1, 1, 1,
-1.269806, 0.06692538, 0.07319263, 1, 1, 1, 1, 1,
-1.259072, -1.541779, -1.203993, 1, 1, 1, 1, 1,
-1.253174, -1.380532, -1.589917, 1, 1, 1, 1, 1,
-1.250066, -1.320865, -3.957172, 1, 1, 1, 1, 1,
-1.247508, -0.8742902, -2.690312, 1, 1, 1, 1, 1,
-1.229056, 1.141482, -1.361765, 1, 1, 1, 1, 1,
-1.226978, -0.4971527, -2.494345, 1, 1, 1, 1, 1,
-1.226845, 0.8057294, 0.04737878, 1, 1, 1, 1, 1,
-1.224057, 0.4334566, -1.482597, 1, 1, 1, 1, 1,
-1.218276, 1.217317, -1.484426, 1, 1, 1, 1, 1,
-1.217127, 0.5554588, -1.71867, 1, 1, 1, 1, 1,
-1.216341, -0.4384786, -0.3898894, 1, 1, 1, 1, 1,
-1.21621, -0.01753838, -1.049157, 0, 0, 1, 1, 1,
-1.208288, 0.1600002, 0.03682457, 1, 0, 0, 1, 1,
-1.202845, -1.522809, -3.342096, 1, 0, 0, 1, 1,
-1.197626, 2.069307, 0.6031194, 1, 0, 0, 1, 1,
-1.194059, -0.3278989, -1.152662, 1, 0, 0, 1, 1,
-1.194043, 0.007149123, -1.144045, 1, 0, 0, 1, 1,
-1.193603, -0.0668835, -1.160468, 0, 0, 0, 1, 1,
-1.18065, -0.5283105, -2.321669, 0, 0, 0, 1, 1,
-1.171069, -0.5357047, -0.2239961, 0, 0, 0, 1, 1,
-1.168953, -0.204763, -0.5084658, 0, 0, 0, 1, 1,
-1.167772, -1.273297, -0.3690791, 0, 0, 0, 1, 1,
-1.167607, -0.7274367, -1.802697, 0, 0, 0, 1, 1,
-1.159712, -0.459167, -1.067045, 0, 0, 0, 1, 1,
-1.157964, 0.06652583, -0.4129665, 1, 1, 1, 1, 1,
-1.157699, 1.312635, -0.1748006, 1, 1, 1, 1, 1,
-1.157552, 1.556952, -0.7230408, 1, 1, 1, 1, 1,
-1.1559, -0.08629357, -1.980956, 1, 1, 1, 1, 1,
-1.152428, 0.9308969, -1.220073, 1, 1, 1, 1, 1,
-1.147205, 0.5187659, -1.83394, 1, 1, 1, 1, 1,
-1.145717, 0.4420007, -0.1639098, 1, 1, 1, 1, 1,
-1.144931, 1.445917, -0.5770763, 1, 1, 1, 1, 1,
-1.138555, -0.2145677, -0.7694363, 1, 1, 1, 1, 1,
-1.133696, 1.27722, -2.437731, 1, 1, 1, 1, 1,
-1.129301, 1.870957, -1.450857, 1, 1, 1, 1, 1,
-1.12707, 0.2140525, -1.407101, 1, 1, 1, 1, 1,
-1.123692, 0.2902406, -0.3995271, 1, 1, 1, 1, 1,
-1.119353, -1.449834, -2.555558, 1, 1, 1, 1, 1,
-1.11564, 0.1492998, -1.003644, 1, 1, 1, 1, 1,
-1.114521, -1.970703, -1.453116, 0, 0, 1, 1, 1,
-1.107538, -0.5794606, -2.661523, 1, 0, 0, 1, 1,
-1.098123, 0.2868981, 0.01525307, 1, 0, 0, 1, 1,
-1.097953, 0.3921227, -0.4069076, 1, 0, 0, 1, 1,
-1.086512, -1.94302, -2.637206, 1, 0, 0, 1, 1,
-1.08403, 0.2907076, -1.257502, 1, 0, 0, 1, 1,
-1.073449, 1.514079, -1.977085, 0, 0, 0, 1, 1,
-1.073096, 2.554799, 0.4580343, 0, 0, 0, 1, 1,
-1.072678, -0.5472403, -2.797446, 0, 0, 0, 1, 1,
-1.069079, -0.5353866, -2.506229, 0, 0, 0, 1, 1,
-1.067638, 0.9422548, -2.260778, 0, 0, 0, 1, 1,
-1.065022, -0.06327891, -2.111707, 0, 0, 0, 1, 1,
-1.061198, 2.324415, -0.7401809, 0, 0, 0, 1, 1,
-1.060781, 0.6189988, -1.073292, 1, 1, 1, 1, 1,
-1.056576, -1.196514, -0.5173302, 1, 1, 1, 1, 1,
-1.054623, 0.1079661, -0.8315319, 1, 1, 1, 1, 1,
-1.050438, -0.5811996, -3.137978, 1, 1, 1, 1, 1,
-1.043385, 0.04487228, -0.2209336, 1, 1, 1, 1, 1,
-1.04278, 0.6263059, -0.7485474, 1, 1, 1, 1, 1,
-1.019329, 0.7137764, -0.8950462, 1, 1, 1, 1, 1,
-1.018864, 0.05902713, -2.347184, 1, 1, 1, 1, 1,
-1.013082, -0.203564, -1.114095, 1, 1, 1, 1, 1,
-1.006925, -1.8795, -4.192736, 1, 1, 1, 1, 1,
-1.005806, -0.1363174, -3.264996, 1, 1, 1, 1, 1,
-0.9986277, -0.5027812, -2.580534, 1, 1, 1, 1, 1,
-0.99804, 0.02435887, -2.315221, 1, 1, 1, 1, 1,
-0.9929717, -1.867622, -4.907715, 1, 1, 1, 1, 1,
-0.9921512, -0.8099778, -1.777309, 1, 1, 1, 1, 1,
-0.9879449, -0.3765345, -5.044196, 0, 0, 1, 1, 1,
-0.9778938, 1.068762, -0.5138211, 1, 0, 0, 1, 1,
-0.9774401, 0.2639369, -2.167926, 1, 0, 0, 1, 1,
-0.9764366, 0.2510453, -0.7335313, 1, 0, 0, 1, 1,
-0.974804, -0.04927305, -1.024669, 1, 0, 0, 1, 1,
-0.9744359, -0.9024531, -3.478854, 1, 0, 0, 1, 1,
-0.9674984, 0.6371304, -1.436489, 0, 0, 0, 1, 1,
-0.9643155, 1.46954, -0.6859375, 0, 0, 0, 1, 1,
-0.9595711, 0.4034591, -2.837798, 0, 0, 0, 1, 1,
-0.9589744, -0.2591318, 0.4086367, 0, 0, 0, 1, 1,
-0.9551984, 0.2890914, -1.078391, 0, 0, 0, 1, 1,
-0.9454354, 1.099149, 0.6611735, 0, 0, 0, 1, 1,
-0.9443857, 0.04974096, -2.305067, 0, 0, 0, 1, 1,
-0.9436259, 0.5942283, -1.077795, 1, 1, 1, 1, 1,
-0.9420618, -0.5012882, -2.784126, 1, 1, 1, 1, 1,
-0.9403754, 1.806708, -0.2839232, 1, 1, 1, 1, 1,
-0.9403062, 0.5224026, -2.576864, 1, 1, 1, 1, 1,
-0.9315183, 1.032306, -0.5470437, 1, 1, 1, 1, 1,
-0.9251526, -1.247358, -2.573832, 1, 1, 1, 1, 1,
-0.9247713, -0.9782047, -1.369218, 1, 1, 1, 1, 1,
-0.9228542, 0.1343435, -3.282758, 1, 1, 1, 1, 1,
-0.9216365, -0.3134443, -2.756998, 1, 1, 1, 1, 1,
-0.9113514, 1.230526, 1.247382, 1, 1, 1, 1, 1,
-0.9085863, -0.7548581, -2.769689, 1, 1, 1, 1, 1,
-0.9084523, -0.2440219, 0.2159066, 1, 1, 1, 1, 1,
-0.9075912, -0.86212, -2.597921, 1, 1, 1, 1, 1,
-0.9047469, -1.934363, -3.243516, 1, 1, 1, 1, 1,
-0.9041258, -0.429563, -3.089551, 1, 1, 1, 1, 1,
-0.9020953, 1.835629, -1.046262, 0, 0, 1, 1, 1,
-0.8999599, -0.1522152, -2.38803, 1, 0, 0, 1, 1,
-0.8980612, -0.9483695, -1.171375, 1, 0, 0, 1, 1,
-0.8946872, 0.2983449, -0.5918465, 1, 0, 0, 1, 1,
-0.8929371, -0.4558617, -1.138547, 1, 0, 0, 1, 1,
-0.8909982, 0.7320738, -2.129712, 1, 0, 0, 1, 1,
-0.8826455, 0.2571783, -1.273133, 0, 0, 0, 1, 1,
-0.8777261, -1.300086, -3.289448, 0, 0, 0, 1, 1,
-0.8756491, -0.6077953, -2.644843, 0, 0, 0, 1, 1,
-0.8703309, -0.8268564, -2.362177, 0, 0, 0, 1, 1,
-0.8699386, -0.05431056, -1.332276, 0, 0, 0, 1, 1,
-0.869309, 0.4363914, -0.2406283, 0, 0, 0, 1, 1,
-0.8693029, 1.117891, -0.9044394, 0, 0, 0, 1, 1,
-0.8645547, -1.625395, -1.977122, 1, 1, 1, 1, 1,
-0.8627855, -0.3313601, -1.481171, 1, 1, 1, 1, 1,
-0.8539216, -0.06823944, -0.2536616, 1, 1, 1, 1, 1,
-0.8504205, 0.2638072, -1.379969, 1, 1, 1, 1, 1,
-0.8481773, -2.033611, -2.080937, 1, 1, 1, 1, 1,
-0.8411409, 1.256176, 0.7765164, 1, 1, 1, 1, 1,
-0.8408659, 0.8431813, -1.650753, 1, 1, 1, 1, 1,
-0.8395469, 0.8999969, -0.0800807, 1, 1, 1, 1, 1,
-0.8355246, -0.2406742, -2.698487, 1, 1, 1, 1, 1,
-0.8317075, -0.1740002, -2.253606, 1, 1, 1, 1, 1,
-0.8276787, -0.851903, -3.99894, 1, 1, 1, 1, 1,
-0.825944, 0.5124161, -2.430169, 1, 1, 1, 1, 1,
-0.8254648, -0.9925653, -4.515881, 1, 1, 1, 1, 1,
-0.8213489, 0.7869526, -0.02560936, 1, 1, 1, 1, 1,
-0.8185481, 1.294681, -0.5762028, 1, 1, 1, 1, 1,
-0.8147638, -0.5598247, -2.453562, 0, 0, 1, 1, 1,
-0.8136773, -0.5802059, -4.214521, 1, 0, 0, 1, 1,
-0.7988847, -1.171035, -1.920738, 1, 0, 0, 1, 1,
-0.7966253, 0.1965593, -2.315662, 1, 0, 0, 1, 1,
-0.7958445, 0.01181828, -0.4047025, 1, 0, 0, 1, 1,
-0.7930472, -1.906874, -3.783895, 1, 0, 0, 1, 1,
-0.7913207, 0.136179, 0.09388865, 0, 0, 0, 1, 1,
-0.7877936, -2.111145, -1.972144, 0, 0, 0, 1, 1,
-0.7865908, -1.454925, -2.586052, 0, 0, 0, 1, 1,
-0.7809351, 0.1318522, -1.459603, 0, 0, 0, 1, 1,
-0.780626, -2.118868, -4.229497, 0, 0, 0, 1, 1,
-0.7612332, 0.8878352, -0.20086, 0, 0, 0, 1, 1,
-0.755003, -1.208778, -3.585052, 0, 0, 0, 1, 1,
-0.7485762, 0.5675146, 1.148849, 1, 1, 1, 1, 1,
-0.7480417, 0.6851814, -1.525713, 1, 1, 1, 1, 1,
-0.7448826, 0.6219336, -0.6526103, 1, 1, 1, 1, 1,
-0.7436644, 1.063321, -1.549155, 1, 1, 1, 1, 1,
-0.7435209, 1.054341, -2.596904, 1, 1, 1, 1, 1,
-0.7425203, -1.778185, -1.417397, 1, 1, 1, 1, 1,
-0.7414805, -0.1712963, -1.522291, 1, 1, 1, 1, 1,
-0.7329355, 1.855657, -0.6288203, 1, 1, 1, 1, 1,
-0.7323388, -1.494883, -2.019282, 1, 1, 1, 1, 1,
-0.7311663, 0.1561021, -1.015976, 1, 1, 1, 1, 1,
-0.7309913, 0.02427657, -0.9431874, 1, 1, 1, 1, 1,
-0.730831, 1.219518, -0.3766069, 1, 1, 1, 1, 1,
-0.725264, -0.5946031, -2.759161, 1, 1, 1, 1, 1,
-0.7232035, -0.9971173, -3.031193, 1, 1, 1, 1, 1,
-0.7220348, -0.9552408, -3.837691, 1, 1, 1, 1, 1,
-0.7220317, 0.698394, -1.692284, 0, 0, 1, 1, 1,
-0.7178568, -0.4244461, -1.882646, 1, 0, 0, 1, 1,
-0.7139104, -0.4979466, -1.135189, 1, 0, 0, 1, 1,
-0.700135, -0.7375612, -2.638913, 1, 0, 0, 1, 1,
-0.6996177, -0.1090182, -4.143669, 1, 0, 0, 1, 1,
-0.6974622, 0.9401891, -2.041373, 1, 0, 0, 1, 1,
-0.6963162, -0.08437665, -1.528692, 0, 0, 0, 1, 1,
-0.6960764, -0.4215168, -0.5864956, 0, 0, 0, 1, 1,
-0.6933396, -0.6866585, -2.944651, 0, 0, 0, 1, 1,
-0.6929877, -1.214342, -2.297224, 0, 0, 0, 1, 1,
-0.6899083, 1.204876, -0.7245899, 0, 0, 0, 1, 1,
-0.6877581, 0.5405152, -1.891845, 0, 0, 0, 1, 1,
-0.6873426, 0.3861803, -0.1777021, 0, 0, 0, 1, 1,
-0.6829762, 0.6407529, -2.920163, 1, 1, 1, 1, 1,
-0.6809564, 0.1520473, -0.8807835, 1, 1, 1, 1, 1,
-0.6806483, 0.7667568, -1.637864, 1, 1, 1, 1, 1,
-0.6799828, 0.4571386, -0.3007409, 1, 1, 1, 1, 1,
-0.6772287, 1.135596, -1.37449, 1, 1, 1, 1, 1,
-0.6687097, -0.5051995, -1.563611, 1, 1, 1, 1, 1,
-0.6608393, 0.6866587, -0.4513342, 1, 1, 1, 1, 1,
-0.6600851, -0.6669942, -2.085352, 1, 1, 1, 1, 1,
-0.6560209, -1.168478, -3.127642, 1, 1, 1, 1, 1,
-0.6528303, -0.01949554, -2.58122, 1, 1, 1, 1, 1,
-0.6487842, 0.2020946, -1.551152, 1, 1, 1, 1, 1,
-0.6362976, 0.7950988, -2.320229, 1, 1, 1, 1, 1,
-0.6327425, -0.186217, -3.070901, 1, 1, 1, 1, 1,
-0.6300907, 0.2128712, 0.4034498, 1, 1, 1, 1, 1,
-0.6279988, 0.3969214, -0.3078874, 1, 1, 1, 1, 1,
-0.6242181, -0.4273748, -3.530124, 0, 0, 1, 1, 1,
-0.6236141, 0.07512525, -1.257229, 1, 0, 0, 1, 1,
-0.6229657, 0.9419475, -2.78616, 1, 0, 0, 1, 1,
-0.6164528, -0.2508746, -2.942837, 1, 0, 0, 1, 1,
-0.6136523, -0.9666577, -3.294334, 1, 0, 0, 1, 1,
-0.6132221, 1.685954, -0.5845826, 1, 0, 0, 1, 1,
-0.6116566, 0.2592911, -1.325784, 0, 0, 0, 1, 1,
-0.6092689, 0.2760542, -2.1546, 0, 0, 0, 1, 1,
-0.6053131, -0.1389912, -1.306174, 0, 0, 0, 1, 1,
-0.6035251, -1.140116, -0.9927203, 0, 0, 0, 1, 1,
-0.6026791, 0.7856292, -1.290432, 0, 0, 0, 1, 1,
-0.599247, 0.8542161, -1.035901, 0, 0, 0, 1, 1,
-0.5991356, 0.7631632, 0.1723313, 0, 0, 0, 1, 1,
-0.5885105, -0.5902095, -1.784403, 1, 1, 1, 1, 1,
-0.5801505, -0.723991, -3.220586, 1, 1, 1, 1, 1,
-0.5793406, -1.769987, -4.122629, 1, 1, 1, 1, 1,
-0.5753576, 1.110848, -2.155921, 1, 1, 1, 1, 1,
-0.5737975, 0.7764499, -0.998284, 1, 1, 1, 1, 1,
-0.5652481, -0.182506, -2.136456, 1, 1, 1, 1, 1,
-0.5639911, -1.026367, -1.997227, 1, 1, 1, 1, 1,
-0.5597033, -0.3061196, -2.539649, 1, 1, 1, 1, 1,
-0.5592102, 0.9163023, -0.4799003, 1, 1, 1, 1, 1,
-0.5591534, -1.549206, -3.424834, 1, 1, 1, 1, 1,
-0.5570557, 1.238824, 0.1918332, 1, 1, 1, 1, 1,
-0.5564767, -0.103101, -1.950085, 1, 1, 1, 1, 1,
-0.5559484, -1.070686, -2.569181, 1, 1, 1, 1, 1,
-0.5537501, 1.785115, 1.220235, 1, 1, 1, 1, 1,
-0.5536192, 2.300708, -1.703888, 1, 1, 1, 1, 1,
-0.5513291, -1.154696, -3.380992, 0, 0, 1, 1, 1,
-0.5510098, -1.552186, -1.957763, 1, 0, 0, 1, 1,
-0.5502999, 0.7610333, -1.432656, 1, 0, 0, 1, 1,
-0.5490154, 1.344733, -0.04044844, 1, 0, 0, 1, 1,
-0.5460337, -1.323335, -2.097791, 1, 0, 0, 1, 1,
-0.5388338, -0.05308671, 0.2549733, 1, 0, 0, 1, 1,
-0.5379928, -0.2388672, -2.563699, 0, 0, 0, 1, 1,
-0.5363798, 0.2094457, -1.015882, 0, 0, 0, 1, 1,
-0.5336893, 1.043755, -1.394452, 0, 0, 0, 1, 1,
-0.5331735, 0.01050058, -1.290714, 0, 0, 0, 1, 1,
-0.5315648, -0.02479654, -2.895463, 0, 0, 0, 1, 1,
-0.5300974, 1.603232, 0.7549317, 0, 0, 0, 1, 1,
-0.5288851, -0.8638589, -2.840251, 0, 0, 0, 1, 1,
-0.5270616, 0.4408217, -1.740093, 1, 1, 1, 1, 1,
-0.5236439, -0.03212868, -1.508033, 1, 1, 1, 1, 1,
-0.5202945, -0.7211983, -1.844633, 1, 1, 1, 1, 1,
-0.5166889, -0.8972157, -3.601666, 1, 1, 1, 1, 1,
-0.5164562, 0.3206, -1.849581, 1, 1, 1, 1, 1,
-0.5143271, 1.117349, -0.9364781, 1, 1, 1, 1, 1,
-0.5103426, -0.4284874, -2.478954, 1, 1, 1, 1, 1,
-0.510183, 1.735964, 1.828413, 1, 1, 1, 1, 1,
-0.5084271, -1.201537, -3.042709, 1, 1, 1, 1, 1,
-0.5083956, -0.03918089, -1.146577, 1, 1, 1, 1, 1,
-0.5016055, -1.016488, -2.125165, 1, 1, 1, 1, 1,
-0.4958264, -0.5194649, -3.112817, 1, 1, 1, 1, 1,
-0.4918028, 1.281379, -0.8926908, 1, 1, 1, 1, 1,
-0.4902031, 0.3148267, -2.00772, 1, 1, 1, 1, 1,
-0.4880199, -0.8122652, -2.355047, 1, 1, 1, 1, 1,
-0.4825083, -0.3090243, -3.349109, 0, 0, 1, 1, 1,
-0.4741954, -1.948616, -2.671998, 1, 0, 0, 1, 1,
-0.4658054, -2.099088, -2.893855, 1, 0, 0, 1, 1,
-0.4645565, -0.9366352, -0.8058187, 1, 0, 0, 1, 1,
-0.4556803, -1.164017, -2.214738, 1, 0, 0, 1, 1,
-0.4529724, 1.097223, -1.22085, 1, 0, 0, 1, 1,
-0.4478351, 0.02618968, -0.6211013, 0, 0, 0, 1, 1,
-0.4416459, 0.2226297, -1.80297, 0, 0, 0, 1, 1,
-0.4370991, -1.522898, -1.858608, 0, 0, 0, 1, 1,
-0.4355808, 2.088438, -0.1178214, 0, 0, 0, 1, 1,
-0.4325705, -0.8406448, -3.758765, 0, 0, 0, 1, 1,
-0.4266366, -0.8739657, -3.191296, 0, 0, 0, 1, 1,
-0.4256223, 0.30722, -2.202497, 0, 0, 0, 1, 1,
-0.4255316, 0.4775739, -0.5408774, 1, 1, 1, 1, 1,
-0.4254058, 0.3348598, -0.5538625, 1, 1, 1, 1, 1,
-0.4253541, 1.483629, 0.7128761, 1, 1, 1, 1, 1,
-0.4123646, 1.618703, -0.02174489, 1, 1, 1, 1, 1,
-0.4070964, -0.7422805, -4.236712, 1, 1, 1, 1, 1,
-0.40346, 0.6261159, -1.281382, 1, 1, 1, 1, 1,
-0.3981811, -0.2568648, -0.1717269, 1, 1, 1, 1, 1,
-0.3971747, 2.025389, -1.443115, 1, 1, 1, 1, 1,
-0.3955935, 0.9981705, -1.401414, 1, 1, 1, 1, 1,
-0.3943343, -0.4113651, -2.677624, 1, 1, 1, 1, 1,
-0.3934348, 0.903104, -0.2264576, 1, 1, 1, 1, 1,
-0.3851601, 0.5996415, -0.1597572, 1, 1, 1, 1, 1,
-0.3851207, -0.219399, -1.231596, 1, 1, 1, 1, 1,
-0.3821059, 0.2510182, -0.5583375, 1, 1, 1, 1, 1,
-0.3729925, -1.94729, -2.852341, 1, 1, 1, 1, 1,
-0.3641998, 1.299394, -1.483202, 0, 0, 1, 1, 1,
-0.3619108, -1.047527, -3.361842, 1, 0, 0, 1, 1,
-0.3607506, -0.1185727, -2.095164, 1, 0, 0, 1, 1,
-0.3561215, -0.1159115, -1.075271, 1, 0, 0, 1, 1,
-0.3554868, 1.412552, 0.0542765, 1, 0, 0, 1, 1,
-0.3514971, -0.01708398, -2.815423, 1, 0, 0, 1, 1,
-0.3500174, -0.642584, -1.084011, 0, 0, 0, 1, 1,
-0.3445965, 1.179443, -1.960897, 0, 0, 0, 1, 1,
-0.3414107, -0.2441462, -1.570763, 0, 0, 0, 1, 1,
-0.3413698, -0.5363432, -1.754591, 0, 0, 0, 1, 1,
-0.3388403, -0.2206252, -1.299466, 0, 0, 0, 1, 1,
-0.3349083, 0.1254097, -0.51091, 0, 0, 0, 1, 1,
-0.3317335, -0.2682577, -1.825046, 0, 0, 0, 1, 1,
-0.3284906, 1.134343, -0.1744785, 1, 1, 1, 1, 1,
-0.324518, -1.120538, -1.616118, 1, 1, 1, 1, 1,
-0.3222038, 0.8192649, -1.576947, 1, 1, 1, 1, 1,
-0.322055, -0.3575887, -4.275723, 1, 1, 1, 1, 1,
-0.3188631, -0.3462949, -3.247422, 1, 1, 1, 1, 1,
-0.3164933, -0.3546671, -2.95341, 1, 1, 1, 1, 1,
-0.3162681, 1.909197, 0.719466, 1, 1, 1, 1, 1,
-0.3160033, 0.4471427, -0.2627395, 1, 1, 1, 1, 1,
-0.3157144, -0.3358907, -2.405901, 1, 1, 1, 1, 1,
-0.3131019, 0.7378806, 0.4655509, 1, 1, 1, 1, 1,
-0.307925, -0.4627213, -1.348108, 1, 1, 1, 1, 1,
-0.306014, -1.121839, -2.26331, 1, 1, 1, 1, 1,
-0.3053527, 1.18549, -0.8006296, 1, 1, 1, 1, 1,
-0.3040134, 1.112649, -1.753435, 1, 1, 1, 1, 1,
-0.3020295, 0.2581116, -0.7073862, 1, 1, 1, 1, 1,
-0.3018064, 0.2623881, -0.6255093, 0, 0, 1, 1, 1,
-0.3012202, 0.2621502, 0.1857958, 1, 0, 0, 1, 1,
-0.3003068, -0.9399746, -1.060598, 1, 0, 0, 1, 1,
-0.2985659, 0.09250398, -1.512721, 1, 0, 0, 1, 1,
-0.2982289, 1.167239, 1.602236, 1, 0, 0, 1, 1,
-0.2974381, 0.5892971, 0.1670092, 1, 0, 0, 1, 1,
-0.2972924, 0.6912952, -0.9548243, 0, 0, 0, 1, 1,
-0.2968107, -0.1946219, -2.41823, 0, 0, 0, 1, 1,
-0.2949623, -1.339487, -3.459998, 0, 0, 0, 1, 1,
-0.2943799, -1.368456, -3.966108, 0, 0, 0, 1, 1,
-0.2881422, 2.197231, 0.6205847, 0, 0, 0, 1, 1,
-0.2876716, 2.893135, 1.146431, 0, 0, 0, 1, 1,
-0.2869321, 0.7719481, -1.203029, 0, 0, 0, 1, 1,
-0.285928, 0.893684, -0.5817595, 1, 1, 1, 1, 1,
-0.2766937, -0.7004622, -2.601846, 1, 1, 1, 1, 1,
-0.2747194, 0.3338858, -1.184215, 1, 1, 1, 1, 1,
-0.273598, 0.7553272, 0.7652862, 1, 1, 1, 1, 1,
-0.2734769, 1.105265, 0.1306497, 1, 1, 1, 1, 1,
-0.2730528, -0.4932155, -0.7342249, 1, 1, 1, 1, 1,
-0.2690931, -0.5861236, -2.969269, 1, 1, 1, 1, 1,
-0.265718, -1.582749, -3.09451, 1, 1, 1, 1, 1,
-0.2642207, -0.1106785, -2.015946, 1, 1, 1, 1, 1,
-0.2615491, -0.7840398, -3.707025, 1, 1, 1, 1, 1,
-0.258557, -0.3261549, -2.393804, 1, 1, 1, 1, 1,
-0.2565561, 1.338792, -0.91614, 1, 1, 1, 1, 1,
-0.2539926, -0.7167345, -3.567941, 1, 1, 1, 1, 1,
-0.2530027, 0.6932459, 0.01031454, 1, 1, 1, 1, 1,
-0.2516889, 0.7936096, -1.084011, 1, 1, 1, 1, 1,
-0.2511711, -0.09380943, -3.353644, 0, 0, 1, 1, 1,
-0.2511612, 1.374694, -1.34502, 1, 0, 0, 1, 1,
-0.2480764, 0.583462, -1.242538, 1, 0, 0, 1, 1,
-0.2459278, -0.04255666, -2.411385, 1, 0, 0, 1, 1,
-0.2438867, -0.3355618, -0.6084281, 1, 0, 0, 1, 1,
-0.2399674, 0.7662395, 0.4685916, 1, 0, 0, 1, 1,
-0.2392188, 1.707807, 0.1437879, 0, 0, 0, 1, 1,
-0.2391126, -0.9805272, -2.772744, 0, 0, 0, 1, 1,
-0.236213, -0.002589248, -2.682535, 0, 0, 0, 1, 1,
-0.2337925, 0.3795588, -1.586449, 0, 0, 0, 1, 1,
-0.2328643, 0.3311184, -0.7696493, 0, 0, 0, 1, 1,
-0.2314824, -1.931853, -3.297058, 0, 0, 0, 1, 1,
-0.2256396, -0.2350297, -1.346051, 0, 0, 0, 1, 1,
-0.2252783, -1.016112, -2.27484, 1, 1, 1, 1, 1,
-0.2225346, 0.1823724, 0.1274945, 1, 1, 1, 1, 1,
-0.215652, 0.1443513, 1.364701, 1, 1, 1, 1, 1,
-0.2128794, 0.04475867, -1.505677, 1, 1, 1, 1, 1,
-0.2033363, 0.8866755, -1.306836, 1, 1, 1, 1, 1,
-0.2002144, 0.3509494, -1.68135, 1, 1, 1, 1, 1,
-0.1973277, 1.332893, -0.7735747, 1, 1, 1, 1, 1,
-0.1964447, 0.4512968, -0.8821061, 1, 1, 1, 1, 1,
-0.1954162, -1.183047, -5.303507, 1, 1, 1, 1, 1,
-0.194351, 0.5925968, -2.321233, 1, 1, 1, 1, 1,
-0.1936783, -0.8624705, -3.349663, 1, 1, 1, 1, 1,
-0.1850506, -1.094232, -1.404022, 1, 1, 1, 1, 1,
-0.1754218, 0.4994543, -1.24728, 1, 1, 1, 1, 1,
-0.1737257, 0.8211067, -1.850278, 1, 1, 1, 1, 1,
-0.1717229, -0.424699, -2.535127, 1, 1, 1, 1, 1,
-0.1715824, 1.386026, 0.1118729, 0, 0, 1, 1, 1,
-0.1712509, -0.6752379, -3.796183, 1, 0, 0, 1, 1,
-0.1697964, 0.8582777, 1.92619, 1, 0, 0, 1, 1,
-0.1689702, 1.837617, -0.06511409, 1, 0, 0, 1, 1,
-0.1673585, -0.4797974, -1.828332, 1, 0, 0, 1, 1,
-0.1637084, -0.8405332, -3.739029, 1, 0, 0, 1, 1,
-0.1634427, 0.08972514, -2.072761, 0, 0, 0, 1, 1,
-0.1630408, -3.101023, -1.320419, 0, 0, 0, 1, 1,
-0.1615903, 1.057245, 0.4912279, 0, 0, 0, 1, 1,
-0.1608252, -0.4103785, -1.872855, 0, 0, 0, 1, 1,
-0.1532097, 0.715704, -1.374882, 0, 0, 0, 1, 1,
-0.1530573, 1.026406, -2.166033, 0, 0, 0, 1, 1,
-0.1523904, -0.4128186, -2.661736, 0, 0, 0, 1, 1,
-0.149972, 1.310117, -0.2357248, 1, 1, 1, 1, 1,
-0.1492982, 0.07915889, -0.7809218, 1, 1, 1, 1, 1,
-0.1452484, 0.8214738, -0.00011437, 1, 1, 1, 1, 1,
-0.1356038, 0.6164024, 2.97505, 1, 1, 1, 1, 1,
-0.1310631, -1.954346, -4.798978, 1, 1, 1, 1, 1,
-0.1308342, -0.2262163, -3.419175, 1, 1, 1, 1, 1,
-0.1304325, 0.426563, 0.9576606, 1, 1, 1, 1, 1,
-0.1215336, -0.1946899, -2.619034, 1, 1, 1, 1, 1,
-0.1213617, -0.889205, -1.823056, 1, 1, 1, 1, 1,
-0.1183535, -1.33876, -3.37533, 1, 1, 1, 1, 1,
-0.1180569, 0.7226672, 0.4606559, 1, 1, 1, 1, 1,
-0.1175944, 1.801079, 0.1686709, 1, 1, 1, 1, 1,
-0.1159521, -0.9178255, -2.832913, 1, 1, 1, 1, 1,
-0.1129629, -0.3812153, -3.968787, 1, 1, 1, 1, 1,
-0.1129144, 1.963344, -0.6445639, 1, 1, 1, 1, 1,
-0.1094212, 0.4916853, -1.679276, 0, 0, 1, 1, 1,
-0.1073087, -0.2797852, -4.118753, 1, 0, 0, 1, 1,
-0.1008696, -1.192814, -4.130651, 1, 0, 0, 1, 1,
-0.1008378, -0.2082109, -3.950731, 1, 0, 0, 1, 1,
-0.09840409, 1.693978, -0.5677403, 1, 0, 0, 1, 1,
-0.09496202, 1.497138, -0.4499743, 1, 0, 0, 1, 1,
-0.09451517, 1.943454, 1.504999, 0, 0, 0, 1, 1,
-0.08956013, 0.7265241, -1.302345, 0, 0, 0, 1, 1,
-0.08866199, -0.01640287, -0.5787271, 0, 0, 0, 1, 1,
-0.08422492, 0.8896828, -0.2543514, 0, 0, 0, 1, 1,
-0.08115351, 0.1456817, -0.8289173, 0, 0, 0, 1, 1,
-0.0787115, -0.4543056, -3.613263, 0, 0, 0, 1, 1,
-0.07804634, -1.071647, -3.913856, 0, 0, 0, 1, 1,
-0.07779489, 0.4979503, 1.344753, 1, 1, 1, 1, 1,
-0.07673182, 0.1862005, -0.5088296, 1, 1, 1, 1, 1,
-0.07312398, 0.4014724, 0.01406013, 1, 1, 1, 1, 1,
-0.07110321, -1.088192, -3.521834, 1, 1, 1, 1, 1,
-0.0615959, 1.347502, 1.159739, 1, 1, 1, 1, 1,
-0.06024304, 1.524492, -0.4473143, 1, 1, 1, 1, 1,
-0.05364707, 0.4682379, -0.8997856, 1, 1, 1, 1, 1,
-0.04901004, 0.4062661, -0.9374906, 1, 1, 1, 1, 1,
-0.04769976, 0.08775832, -0.5292728, 1, 1, 1, 1, 1,
-0.04709407, -0.7028999, -2.367382, 1, 1, 1, 1, 1,
-0.04382077, -2.130661, -3.592529, 1, 1, 1, 1, 1,
-0.04265046, 0.3725174, -0.2110702, 1, 1, 1, 1, 1,
-0.03217601, -1.235011, -3.602985, 1, 1, 1, 1, 1,
-0.02410686, 1.429739, 0.6757916, 1, 1, 1, 1, 1,
-0.02366105, 0.404666, 0.7436185, 1, 1, 1, 1, 1,
-0.02060935, 0.3703869, 0.9583414, 0, 0, 1, 1, 1,
-0.01920786, -0.2571434, -3.2366, 1, 0, 0, 1, 1,
-0.01779761, 0.1675849, 0.1887481, 1, 0, 0, 1, 1,
-0.01432313, -0.3686213, -2.183037, 1, 0, 0, 1, 1,
-0.01398128, 1.107138, 0.7516086, 1, 0, 0, 1, 1,
-0.01233032, -0.2180908, -2.650105, 1, 0, 0, 1, 1,
-0.005144936, 1.640615, -0.05410329, 0, 0, 0, 1, 1,
-0.001492695, -1.120431, -2.728938, 0, 0, 0, 1, 1,
-0.00108019, 0.6155967, -0.3706263, 0, 0, 0, 1, 1,
0.001157372, 1.258956, -0.5966296, 0, 0, 0, 1, 1,
0.003409323, -1.290759, 2.722299, 0, 0, 0, 1, 1,
0.003927764, -0.2860543, 4.258873, 0, 0, 0, 1, 1,
0.007071259, -0.2151894, 1.978491, 0, 0, 0, 1, 1,
0.008634335, 0.8829803, 1.322511, 1, 1, 1, 1, 1,
0.01043246, -1.267372, 2.588645, 1, 1, 1, 1, 1,
0.01528731, 1.255289, -1.300467, 1, 1, 1, 1, 1,
0.01725103, 0.8255115, 0.2771228, 1, 1, 1, 1, 1,
0.01792586, 0.09566841, 0.7213188, 1, 1, 1, 1, 1,
0.01937581, 0.5145435, 1.050972, 1, 1, 1, 1, 1,
0.02004247, -0.7789718, 4.542192, 1, 1, 1, 1, 1,
0.02228888, -0.7011114, 2.93809, 1, 1, 1, 1, 1,
0.02388361, -0.548408, 4.043036, 1, 1, 1, 1, 1,
0.02546223, 0.4535372, 0.1283209, 1, 1, 1, 1, 1,
0.02607613, 0.9094092, 0.2822114, 1, 1, 1, 1, 1,
0.0380374, -0.3954928, 1.7724, 1, 1, 1, 1, 1,
0.03983809, 0.5824975, -0.1983872, 1, 1, 1, 1, 1,
0.04001789, 2.186435, 0.1640498, 1, 1, 1, 1, 1,
0.04238139, 0.4032208, -2.057294, 1, 1, 1, 1, 1,
0.0467339, -0.5613372, 4.252653, 0, 0, 1, 1, 1,
0.04822301, -0.6083136, 3.444944, 1, 0, 0, 1, 1,
0.04984836, -0.1351606, 2.682056, 1, 0, 0, 1, 1,
0.0667844, -0.1196958, 1.969322, 1, 0, 0, 1, 1,
0.06948389, -0.2696891, 2.777919, 1, 0, 0, 1, 1,
0.070652, -0.1192605, 1.481122, 1, 0, 0, 1, 1,
0.07184776, -0.4539234, 2.843366, 0, 0, 0, 1, 1,
0.0825053, 0.1284976, 1.656492, 0, 0, 0, 1, 1,
0.08354169, 1.182838, -1.115266, 0, 0, 0, 1, 1,
0.08811093, 1.294764, -1.352141, 0, 0, 0, 1, 1,
0.08848444, -0.5727543, 3.404806, 0, 0, 0, 1, 1,
0.08988576, 0.574285, 0.2263913, 0, 0, 0, 1, 1,
0.09311095, 0.3059416, -1.013502, 0, 0, 0, 1, 1,
0.09381174, -1.763386, 2.152307, 1, 1, 1, 1, 1,
0.09414582, -0.08825479, 1.639178, 1, 1, 1, 1, 1,
0.09675098, 0.6482285, -0.9202831, 1, 1, 1, 1, 1,
0.09831948, 0.7266297, 0.474647, 1, 1, 1, 1, 1,
0.09842799, 0.2689258, -1.147611, 1, 1, 1, 1, 1,
0.1029469, 0.7565197, 1.816213, 1, 1, 1, 1, 1,
0.1097339, -0.02525143, 1.789522, 1, 1, 1, 1, 1,
0.1098194, 0.8169673, -0.1348931, 1, 1, 1, 1, 1,
0.115184, 1.424072, -0.4784606, 1, 1, 1, 1, 1,
0.1159271, 1.287894, 0.2852206, 1, 1, 1, 1, 1,
0.1189117, 0.3611916, 0.3054612, 1, 1, 1, 1, 1,
0.1206167, 0.0205424, 2.717092, 1, 1, 1, 1, 1,
0.1208513, 0.4714351, -0.7334424, 1, 1, 1, 1, 1,
0.1236332, 0.1242942, 0.4424056, 1, 1, 1, 1, 1,
0.1269635, 0.8603548, -1.201319, 1, 1, 1, 1, 1,
0.1297749, 1.351486, -0.5437669, 0, 0, 1, 1, 1,
0.1313352, -0.6035807, 3.554729, 1, 0, 0, 1, 1,
0.131632, -0.4840883, 3.791186, 1, 0, 0, 1, 1,
0.1335527, -1.522305, 2.335626, 1, 0, 0, 1, 1,
0.1338636, -0.4742723, 3.731852, 1, 0, 0, 1, 1,
0.1355251, -2.184473, 3.663049, 1, 0, 0, 1, 1,
0.1379838, -0.9206458, 2.854291, 0, 0, 0, 1, 1,
0.1406227, 0.08872662, 0.1886902, 0, 0, 0, 1, 1,
0.1439996, 1.643985, -0.8904848, 0, 0, 0, 1, 1,
0.145476, 0.7083849, 0.2338089, 0, 0, 0, 1, 1,
0.1477328, -0.3355396, 2.474083, 0, 0, 0, 1, 1,
0.1517719, 1.941879, 0.4965121, 0, 0, 0, 1, 1,
0.1563411, 0.90266, 0.1007503, 0, 0, 0, 1, 1,
0.158551, -1.511279, 2.22083, 1, 1, 1, 1, 1,
0.1591457, 1.466729, 1.537765, 1, 1, 1, 1, 1,
0.1594438, -0.03356307, 2.679638, 1, 1, 1, 1, 1,
0.1649288, 2.729335, -2.227153, 1, 1, 1, 1, 1,
0.1665817, -0.1768439, 2.168404, 1, 1, 1, 1, 1,
0.1689855, -1.6932, 1.836082, 1, 1, 1, 1, 1,
0.1766996, 0.5364981, 1.715608, 1, 1, 1, 1, 1,
0.1778883, 0.7379877, 0.4334791, 1, 1, 1, 1, 1,
0.1793431, 1.742131, 1.68815, 1, 1, 1, 1, 1,
0.1811635, -0.8227057, 2.920479, 1, 1, 1, 1, 1,
0.1842986, -1.146309, 3.501189, 1, 1, 1, 1, 1,
0.1866874, 0.0322298, 0.8940393, 1, 1, 1, 1, 1,
0.1873119, 1.442742, 2.677653, 1, 1, 1, 1, 1,
0.1894249, 1.389149, 0.5865797, 1, 1, 1, 1, 1,
0.1899868, 0.9852561, 1.188673, 1, 1, 1, 1, 1,
0.1936861, -0.4866594, 3.397797, 0, 0, 1, 1, 1,
0.194429, -0.9080346, 3.325216, 1, 0, 0, 1, 1,
0.1949776, -0.6684518, 2.191023, 1, 0, 0, 1, 1,
0.1949894, -1.399246, 2.969138, 1, 0, 0, 1, 1,
0.200139, 0.2239859, 0.6867564, 1, 0, 0, 1, 1,
0.2017535, -1.155066, 2.35666, 1, 0, 0, 1, 1,
0.2031958, 1.540424, 0.2872366, 0, 0, 0, 1, 1,
0.2088945, 0.5627452, 0.710014, 0, 0, 0, 1, 1,
0.2101227, -0.8611417, 3.08976, 0, 0, 0, 1, 1,
0.2144355, 0.2263587, 0.8538678, 0, 0, 0, 1, 1,
0.2154446, 0.01449291, -0.1091034, 0, 0, 0, 1, 1,
0.217289, -1.308256, 3.071528, 0, 0, 0, 1, 1,
0.2235077, -1.670868, 2.79794, 0, 0, 0, 1, 1,
0.2244238, -1.389343, 1.67379, 1, 1, 1, 1, 1,
0.2244646, -0.3305594, 3.502731, 1, 1, 1, 1, 1,
0.2286071, 0.7804785, -0.6690957, 1, 1, 1, 1, 1,
0.2301947, -0.8017811, 4.075354, 1, 1, 1, 1, 1,
0.2302216, 0.711143, 0.3589833, 1, 1, 1, 1, 1,
0.2323761, 1.608493, 1.020345, 1, 1, 1, 1, 1,
0.2331731, -0.4100968, 2.572637, 1, 1, 1, 1, 1,
0.2376824, 0.761941, -0.9074365, 1, 1, 1, 1, 1,
0.242679, 0.2079517, 0.3492822, 1, 1, 1, 1, 1,
0.2430134, 0.6442935, 0.8131841, 1, 1, 1, 1, 1,
0.2450805, -0.9182314, 1.763053, 1, 1, 1, 1, 1,
0.2487644, 0.2857957, 0.8631817, 1, 1, 1, 1, 1,
0.2487944, -0.4156503, 3.063282, 1, 1, 1, 1, 1,
0.2538109, -0.1988241, 2.330247, 1, 1, 1, 1, 1,
0.2566777, 0.4574629, -0.1131476, 1, 1, 1, 1, 1,
0.2578575, 0.1062347, 0.3728496, 0, 0, 1, 1, 1,
0.282658, 0.5664684, 0.878495, 1, 0, 0, 1, 1,
0.2842042, 0.9171788, 1.600701, 1, 0, 0, 1, 1,
0.2862929, -0.5450876, 2.640995, 1, 0, 0, 1, 1,
0.2863263, -0.2100147, 1.281705, 1, 0, 0, 1, 1,
0.2909356, -0.832895, 2.088853, 1, 0, 0, 1, 1,
0.2910354, 1.273792, 0.116902, 0, 0, 0, 1, 1,
0.293501, -0.107713, 1.531222, 0, 0, 0, 1, 1,
0.2982602, 1.687628, -1.283818, 0, 0, 0, 1, 1,
0.3029032, 0.01689014, 2.145327, 0, 0, 0, 1, 1,
0.3043442, -1.764231, 1.822336, 0, 0, 0, 1, 1,
0.3059532, 0.1542687, 1.082002, 0, 0, 0, 1, 1,
0.3066036, 2.468788, 2.619314, 0, 0, 0, 1, 1,
0.3150495, -0.6838115, 3.739495, 1, 1, 1, 1, 1,
0.3183598, 0.7331961, 2.387609, 1, 1, 1, 1, 1,
0.3188978, 0.2378161, 1.234313, 1, 1, 1, 1, 1,
0.3214994, -2.722754, 2.472369, 1, 1, 1, 1, 1,
0.3241116, 0.9064977, -0.5453436, 1, 1, 1, 1, 1,
0.3252458, -0.8507005, 4.577324, 1, 1, 1, 1, 1,
0.3253551, -2.00852, 3.086694, 1, 1, 1, 1, 1,
0.3265926, -1.569412, 3.475783, 1, 1, 1, 1, 1,
0.328084, -1.126249, 1.786085, 1, 1, 1, 1, 1,
0.3298163, -0.618238, 4.051239, 1, 1, 1, 1, 1,
0.3331297, -1.885198, 2.095936, 1, 1, 1, 1, 1,
0.334173, 0.3577235, 1.726058, 1, 1, 1, 1, 1,
0.3362648, 1.782676, -0.2078513, 1, 1, 1, 1, 1,
0.3406814, -2.122348, 3.58681, 1, 1, 1, 1, 1,
0.3442237, -0.03177913, 3.503118, 1, 1, 1, 1, 1,
0.3511602, 0.5109677, 1.639754, 0, 0, 1, 1, 1,
0.3516286, 0.08164449, 1.981576, 1, 0, 0, 1, 1,
0.3542545, -0.6531751, 2.871629, 1, 0, 0, 1, 1,
0.3553222, 0.7558914, -1.25839, 1, 0, 0, 1, 1,
0.3619982, 2.036596, -0.9468943, 1, 0, 0, 1, 1,
0.3629398, 0.3001738, 0.2505512, 1, 0, 0, 1, 1,
0.3635369, -0.4618608, 3.265665, 0, 0, 0, 1, 1,
0.3658004, 0.2272305, 2.596194, 0, 0, 0, 1, 1,
0.3740488, -0.574899, 2.759373, 0, 0, 0, 1, 1,
0.3780533, 0.5236324, 1.887751, 0, 0, 0, 1, 1,
0.3823705, 0.2342103, 2.510074, 0, 0, 0, 1, 1,
0.3828417, 0.4373071, 0.7763475, 0, 0, 0, 1, 1,
0.3849415, -0.8406971, 1.289762, 0, 0, 0, 1, 1,
0.387428, -0.6150824, 2.497828, 1, 1, 1, 1, 1,
0.3891455, -0.04882032, 0.9917958, 1, 1, 1, 1, 1,
0.3891851, 0.563032, 0.3055862, 1, 1, 1, 1, 1,
0.389879, 0.5844776, 0.04303686, 1, 1, 1, 1, 1,
0.3914996, -1.206135, 2.304625, 1, 1, 1, 1, 1,
0.3923879, -1.362039, 3.741978, 1, 1, 1, 1, 1,
0.3932302, -1.137126, 3.325331, 1, 1, 1, 1, 1,
0.3938181, 0.0001943855, 3.159952, 1, 1, 1, 1, 1,
0.3949405, 0.7553629, 0.1675503, 1, 1, 1, 1, 1,
0.4009038, -0.2938718, 2.271442, 1, 1, 1, 1, 1,
0.4014, -0.3808663, 4.528111, 1, 1, 1, 1, 1,
0.4014113, -1.11494, 2.660126, 1, 1, 1, 1, 1,
0.4070089, 1.75358, -0.0132968, 1, 1, 1, 1, 1,
0.4095594, -0.7911987, 3.176947, 1, 1, 1, 1, 1,
0.4097394, 0.1874471, 1.3394, 1, 1, 1, 1, 1,
0.4098272, -0.08255972, 3.049465, 0, 0, 1, 1, 1,
0.412959, -2.09887, 3.524709, 1, 0, 0, 1, 1,
0.4191745, 0.3796781, 1.430671, 1, 0, 0, 1, 1,
0.4218581, 1.021981, -0.6353459, 1, 0, 0, 1, 1,
0.422032, -0.7435914, 2.213582, 1, 0, 0, 1, 1,
0.4245991, 0.88667, 0.005504726, 1, 0, 0, 1, 1,
0.4266913, -1.314434, 2.03339, 0, 0, 0, 1, 1,
0.4302285, 0.1562875, 1.06489, 0, 0, 0, 1, 1,
0.4318443, 0.801534, 0.5714285, 0, 0, 0, 1, 1,
0.434093, -0.4958772, 3.611284, 0, 0, 0, 1, 1,
0.4343964, 0.3343081, -0.528863, 0, 0, 0, 1, 1,
0.4346766, -0.1494863, 0.6029465, 0, 0, 0, 1, 1,
0.4398302, -1.015618, 2.856321, 0, 0, 0, 1, 1,
0.440502, 2.15163, 1.361388, 1, 1, 1, 1, 1,
0.4413664, -0.4605226, 2.281778, 1, 1, 1, 1, 1,
0.4436631, 1.58185, 0.2918442, 1, 1, 1, 1, 1,
0.4479664, 1.648138, 0.1587721, 1, 1, 1, 1, 1,
0.4501814, 1.997895, 0.7729537, 1, 1, 1, 1, 1,
0.4521756, -1.743356, 3.943273, 1, 1, 1, 1, 1,
0.4566824, -0.1648794, 1.029757, 1, 1, 1, 1, 1,
0.4567966, -1.624122, 4.481633, 1, 1, 1, 1, 1,
0.4587409, -1.27852, 2.746071, 1, 1, 1, 1, 1,
0.4628792, 0.3601672, 0.5774974, 1, 1, 1, 1, 1,
0.4658515, -0.5746051, 1.786043, 1, 1, 1, 1, 1,
0.468311, 0.49564, 0.313048, 1, 1, 1, 1, 1,
0.4697167, 0.1011881, 2.553851, 1, 1, 1, 1, 1,
0.4708381, -1.333853, 4.479955, 1, 1, 1, 1, 1,
0.4718678, -0.1788102, 1.828791, 1, 1, 1, 1, 1,
0.4765263, -0.1329695, 0.6691952, 0, 0, 1, 1, 1,
0.4814617, 0.4205719, 0.4851743, 1, 0, 0, 1, 1,
0.4838184, -0.2091476, 1.367561, 1, 0, 0, 1, 1,
0.4866713, -1.858187, 3.9066, 1, 0, 0, 1, 1,
0.4881495, 0.4223632, 1.915572, 1, 0, 0, 1, 1,
0.4905195, -0.8337038, 2.772687, 1, 0, 0, 1, 1,
0.4955085, -0.4352753, 2.103935, 0, 0, 0, 1, 1,
0.4963877, 0.1522887, 2.664802, 0, 0, 0, 1, 1,
0.496677, -0.6109532, 3.134837, 0, 0, 0, 1, 1,
0.49861, -0.8270167, 1.549154, 0, 0, 0, 1, 1,
0.499676, -0.3776301, 1.429993, 0, 0, 0, 1, 1,
0.5003978, -0.3760705, 2.072909, 0, 0, 0, 1, 1,
0.501391, 1.059811, 0.7093657, 0, 0, 0, 1, 1,
0.5045071, -0.4641768, 2.465422, 1, 1, 1, 1, 1,
0.5063779, 0.7188461, 1.672081, 1, 1, 1, 1, 1,
0.5178651, 0.01106451, 2.878839, 1, 1, 1, 1, 1,
0.5286289, 1.219062, -1.123252, 1, 1, 1, 1, 1,
0.5286555, 0.708858, 0.3151742, 1, 1, 1, 1, 1,
0.545575, -0.00629162, 2.207016, 1, 1, 1, 1, 1,
0.5576643, 0.616073, 1.163541, 1, 1, 1, 1, 1,
0.5629095, -1.473876, 2.024904, 1, 1, 1, 1, 1,
0.5630666, 0.3928747, 2.355571, 1, 1, 1, 1, 1,
0.564244, -1.464547, 2.006289, 1, 1, 1, 1, 1,
0.5681556, 0.6444388, -0.5978362, 1, 1, 1, 1, 1,
0.5700586, 0.5618822, 3.658099, 1, 1, 1, 1, 1,
0.5728216, -0.5593074, 2.261042, 1, 1, 1, 1, 1,
0.5729601, -0.005868935, 2.158053, 1, 1, 1, 1, 1,
0.5730756, -0.6337161, 1.875924, 1, 1, 1, 1, 1,
0.573844, 1.176039, 1.02286, 0, 0, 1, 1, 1,
0.5747544, 0.5440167, -0.3080764, 1, 0, 0, 1, 1,
0.5775395, 0.2458542, 1.451229, 1, 0, 0, 1, 1,
0.5852982, -0.9681175, 2.183411, 1, 0, 0, 1, 1,
0.5861676, -0.02185271, 0.6552597, 1, 0, 0, 1, 1,
0.5862089, -0.9559592, 2.206531, 1, 0, 0, 1, 1,
0.5892876, -0.3184708, 0.8539804, 0, 0, 0, 1, 1,
0.5905703, 0.09431376, 1.82071, 0, 0, 0, 1, 1,
0.5909934, 1.200615, 1.12769, 0, 0, 0, 1, 1,
0.6067281, -0.002395252, 2.577458, 0, 0, 0, 1, 1,
0.6116821, -1.719712, 4.006999, 0, 0, 0, 1, 1,
0.6219814, -1.374357, 4.366848, 0, 0, 0, 1, 1,
0.624993, 1.272205, 1.717328, 0, 0, 0, 1, 1,
0.6265504, -0.6734146, 0.6555172, 1, 1, 1, 1, 1,
0.628311, 2.308534, -1.258625, 1, 1, 1, 1, 1,
0.631663, 1.960917, 0.7852798, 1, 1, 1, 1, 1,
0.6322743, -0.5271421, 1.32739, 1, 1, 1, 1, 1,
0.6348606, 0.06266496, -0.2256508, 1, 1, 1, 1, 1,
0.6367741, 1.096398, 0.9727082, 1, 1, 1, 1, 1,
0.6384898, 1.176119, 0.9821174, 1, 1, 1, 1, 1,
0.639015, -0.367952, 2.298468, 1, 1, 1, 1, 1,
0.640145, 0.9533401, 1.510874, 1, 1, 1, 1, 1,
0.6503367, 0.2053998, 1.684877, 1, 1, 1, 1, 1,
0.6519123, -2.054234, 3.492183, 1, 1, 1, 1, 1,
0.6520272, -0.1606473, 1.718006, 1, 1, 1, 1, 1,
0.6529068, 2.275826, -0.1450136, 1, 1, 1, 1, 1,
0.656553, -0.5953292, 1.549883, 1, 1, 1, 1, 1,
0.660032, 0.1850684, 2.177083, 1, 1, 1, 1, 1,
0.6619527, -0.5665556, 0.8734879, 0, 0, 1, 1, 1,
0.6626534, -1.435818, 2.627479, 1, 0, 0, 1, 1,
0.6630925, 0.02887337, 3.419749, 1, 0, 0, 1, 1,
0.6633766, 0.6814309, 0.6348038, 1, 0, 0, 1, 1,
0.6635303, -0.8871721, 2.150904, 1, 0, 0, 1, 1,
0.6640992, 0.6861234, 0.9620441, 1, 0, 0, 1, 1,
0.6669534, -1.304796, 4.464927, 0, 0, 0, 1, 1,
0.6669539, -0.290207, -0.2710397, 0, 0, 0, 1, 1,
0.688842, 1.058126, 1.224607, 0, 0, 0, 1, 1,
0.6939256, -0.5477651, 1.851214, 0, 0, 0, 1, 1,
0.6970278, 1.457058, 0.5881962, 0, 0, 0, 1, 1,
0.7030175, -1.896271, 3.883876, 0, 0, 0, 1, 1,
0.7034313, -0.05084956, 1.045421, 0, 0, 0, 1, 1,
0.7054207, -0.9419907, 2.087827, 1, 1, 1, 1, 1,
0.7068182, 0.4164456, 1.916227, 1, 1, 1, 1, 1,
0.7131022, -0.3924087, 2.273961, 1, 1, 1, 1, 1,
0.7176464, 0.7184201, 1.308785, 1, 1, 1, 1, 1,
0.7182726, 0.675626, 2.155834, 1, 1, 1, 1, 1,
0.7186522, -1.067532, 2.362664, 1, 1, 1, 1, 1,
0.7218688, 1.071589, 0.5925605, 1, 1, 1, 1, 1,
0.723047, 0.6331764, 0.6271174, 1, 1, 1, 1, 1,
0.7311579, -0.5263093, 3.626191, 1, 1, 1, 1, 1,
0.7385378, 0.3731076, 1.407661, 1, 1, 1, 1, 1,
0.7393758, 0.3124627, 1.984553, 1, 1, 1, 1, 1,
0.7462619, -0.385704, 2.776969, 1, 1, 1, 1, 1,
0.7515088, -1.299289, 2.590321, 1, 1, 1, 1, 1,
0.7515991, -0.6684815, 4.285052, 1, 1, 1, 1, 1,
0.7557028, 0.02404348, -0.04504423, 1, 1, 1, 1, 1,
0.7587441, -0.2915288, 1.812047, 0, 0, 1, 1, 1,
0.7609929, -2.599071, 3.048513, 1, 0, 0, 1, 1,
0.7610521, -0.5256281, 3.617552, 1, 0, 0, 1, 1,
0.7642208, 0.3833859, 2.222506, 1, 0, 0, 1, 1,
0.7721596, 0.2929019, 2.158059, 1, 0, 0, 1, 1,
0.7730837, 0.2853296, 1.872743, 1, 0, 0, 1, 1,
0.7745372, -0.6957929, 3.591137, 0, 0, 0, 1, 1,
0.7786248, 2.55399, -0.4098051, 0, 0, 0, 1, 1,
0.7802085, 0.8501247, 2.478651, 0, 0, 0, 1, 1,
0.7820641, 0.06014501, 1.973854, 0, 0, 0, 1, 1,
0.7868558, 0.3428079, -0.3196664, 0, 0, 0, 1, 1,
0.8117512, -0.3582543, 2.391291, 0, 0, 0, 1, 1,
0.8166901, -0.2480202, 3.444701, 0, 0, 0, 1, 1,
0.821806, -0.03521925, 1.715623, 1, 1, 1, 1, 1,
0.8226783, 0.6119832, 1.416713, 1, 1, 1, 1, 1,
0.8252738, -1.636746, 2.915798, 1, 1, 1, 1, 1,
0.8253295, 0.411095, 0.2447976, 1, 1, 1, 1, 1,
0.8270537, 0.1746144, 1.145499, 1, 1, 1, 1, 1,
0.828291, 0.2185933, 1.425303, 1, 1, 1, 1, 1,
0.8297157, -0.02138192, 0.1735286, 1, 1, 1, 1, 1,
0.8350793, 0.07480998, 1.788886, 1, 1, 1, 1, 1,
0.8382524, 0.03448977, 1.972806, 1, 1, 1, 1, 1,
0.8393208, 1.412319, 1.198316, 1, 1, 1, 1, 1,
0.8424615, -0.06937763, 1.094057, 1, 1, 1, 1, 1,
0.8512032, -0.1167571, 2.434898, 1, 1, 1, 1, 1,
0.8516146, 0.5220276, 1.999745, 1, 1, 1, 1, 1,
0.8544205, -0.8546651, 4.310027, 1, 1, 1, 1, 1,
0.8569198, 0.2150097, 1.19294, 1, 1, 1, 1, 1,
0.8639739, 0.2111014, 0.9594196, 0, 0, 1, 1, 1,
0.8670635, -1.147731, 4.505178, 1, 0, 0, 1, 1,
0.8711536, 1.928116, -0.4651642, 1, 0, 0, 1, 1,
0.8813242, 0.03087065, -0.1184276, 1, 0, 0, 1, 1,
0.8926198, -0.04872328, 1.461996, 1, 0, 0, 1, 1,
0.8952772, -2.207438, 2.959008, 1, 0, 0, 1, 1,
0.9014415, -1.879241, 4.151752, 0, 0, 0, 1, 1,
0.903824, 0.9477497, -1.292852, 0, 0, 0, 1, 1,
0.9052364, 0.8928497, -1.262615, 0, 0, 0, 1, 1,
0.906842, 1.437588, -0.8541998, 0, 0, 0, 1, 1,
0.9119951, 1.621947, 0.871374, 0, 0, 0, 1, 1,
0.9125302, -0.6887349, -0.1936456, 0, 0, 0, 1, 1,
0.9127948, 0.4460148, 0.5810621, 0, 0, 0, 1, 1,
0.9179317, 0.5669088, 1.40869, 1, 1, 1, 1, 1,
0.9197859, 1.428801, -0.06720758, 1, 1, 1, 1, 1,
0.9216002, 1.684006, -0.1333539, 1, 1, 1, 1, 1,
0.9229383, -0.3667089, 1.232673, 1, 1, 1, 1, 1,
0.9242082, -0.5788887, 1.299021, 1, 1, 1, 1, 1,
0.9246348, -1.615202, 3.056578, 1, 1, 1, 1, 1,
0.9277056, 1.086601, 0.06149731, 1, 1, 1, 1, 1,
0.9283059, 0.04394415, 0.8797839, 1, 1, 1, 1, 1,
0.9337031, 0.6351665, 1.73031, 1, 1, 1, 1, 1,
0.9385356, -1.796133, 1.257722, 1, 1, 1, 1, 1,
0.9446837, 0.2088357, 1.493479, 1, 1, 1, 1, 1,
0.9447835, 0.9935374, -0.1199055, 1, 1, 1, 1, 1,
0.9488472, 1.95875, 0.1292505, 1, 1, 1, 1, 1,
0.9523683, -0.9542592, 3.338823, 1, 1, 1, 1, 1,
0.9537769, -1.815061, 2.644797, 1, 1, 1, 1, 1,
0.9548088, -0.253295, 0.03569588, 0, 0, 1, 1, 1,
0.9578407, 0.9795824, 1.892127, 1, 0, 0, 1, 1,
0.9601352, -1.472546, 3.460099, 1, 0, 0, 1, 1,
0.9735845, -0.8221989, 3.109763, 1, 0, 0, 1, 1,
0.9746806, 0.5132878, 1.03869, 1, 0, 0, 1, 1,
0.9746917, -0.3321739, 1.39978, 1, 0, 0, 1, 1,
0.9763247, -0.5940018, 2.528621, 0, 0, 0, 1, 1,
0.9780838, -0.4086999, 1.606057, 0, 0, 0, 1, 1,
0.9798831, 0.5489865, -0.2839864, 0, 0, 0, 1, 1,
0.9867294, -1.169931, 1.490328, 0, 0, 0, 1, 1,
0.9878808, 0.1101463, 1.242106, 0, 0, 0, 1, 1,
0.9893053, 0.3129665, 1.492271, 0, 0, 0, 1, 1,
0.9923317, -0.09454408, 2.342834, 0, 0, 0, 1, 1,
0.9967456, -0.3096259, 1.49684, 1, 1, 1, 1, 1,
0.9975824, -0.6620518, 2.075319, 1, 1, 1, 1, 1,
1.006038, -0.8520423, 2.422616, 1, 1, 1, 1, 1,
1.00637, 0.4395943, 2.577766, 1, 1, 1, 1, 1,
1.011393, -0.424445, 1.297467, 1, 1, 1, 1, 1,
1.012534, -0.3249683, 1.568672, 1, 1, 1, 1, 1,
1.013305, -0.641274, 1.916348, 1, 1, 1, 1, 1,
1.014482, -0.9185612, 3.383577, 1, 1, 1, 1, 1,
1.017984, 1.110629, 1.780583, 1, 1, 1, 1, 1,
1.019661, 0.7507555, 0.8478323, 1, 1, 1, 1, 1,
1.020239, 1.656196, 0.781372, 1, 1, 1, 1, 1,
1.025679, -0.2134728, 3.334052, 1, 1, 1, 1, 1,
1.028985, 0.7538356, 1.769562, 1, 1, 1, 1, 1,
1.044848, -0.4975114, 2.778636, 1, 1, 1, 1, 1,
1.04594, 0.1391973, 0.9221019, 1, 1, 1, 1, 1,
1.048582, 0.6297918, -1.827102, 0, 0, 1, 1, 1,
1.049216, -0.2129791, 1.842193, 1, 0, 0, 1, 1,
1.04996, 0.2413669, -0.4492244, 1, 0, 0, 1, 1,
1.055229, -1.146566, 1.018026, 1, 0, 0, 1, 1,
1.075028, -0.6599669, 1.699193, 1, 0, 0, 1, 1,
1.076432, -0.6825397, 3.305317, 1, 0, 0, 1, 1,
1.08568, 0.3457926, 0.6629949, 0, 0, 0, 1, 1,
1.087803, 1.60493, 0.9064934, 0, 0, 0, 1, 1,
1.092576, -0.01724188, -0.5559469, 0, 0, 0, 1, 1,
1.100267, 0.4897069, 1.042012, 0, 0, 0, 1, 1,
1.100763, -0.2579012, 3.22947, 0, 0, 0, 1, 1,
1.116392, 1.190853, 0.911544, 0, 0, 0, 1, 1,
1.122898, 0.8250604, -0.05288739, 0, 0, 0, 1, 1,
1.125113, 0.6393606, 1.369347, 1, 1, 1, 1, 1,
1.126454, -0.6924616, 0.7215534, 1, 1, 1, 1, 1,
1.130454, -1.878002, 3.612592, 1, 1, 1, 1, 1,
1.136911, -0.05408753, 0.3843414, 1, 1, 1, 1, 1,
1.141681, 0.6575072, 0.848223, 1, 1, 1, 1, 1,
1.142035, -1.251519, 1.885535, 1, 1, 1, 1, 1,
1.155619, 0.1042297, 1.097997, 1, 1, 1, 1, 1,
1.156397, -0.3840395, 2.322026, 1, 1, 1, 1, 1,
1.156954, 0.03311069, 0.5504233, 1, 1, 1, 1, 1,
1.158318, 1.041768, 1.72219, 1, 1, 1, 1, 1,
1.160649, 0.4633658, 2.429203, 1, 1, 1, 1, 1,
1.167811, 0.3070175, 1.74458, 1, 1, 1, 1, 1,
1.17154, 0.3395392, 1.633685, 1, 1, 1, 1, 1,
1.183077, 0.1020177, 1.75104, 1, 1, 1, 1, 1,
1.18918, 0.9553803, 0.5371439, 1, 1, 1, 1, 1,
1.192641, -0.1227744, 1.939694, 0, 0, 1, 1, 1,
1.193565, -0.5617031, 3.137775, 1, 0, 0, 1, 1,
1.198215, 0.8388855, 1.077788, 1, 0, 0, 1, 1,
1.20547, -0.0242896, 3.173091, 1, 0, 0, 1, 1,
1.206043, 0.0988113, 2.604528, 1, 0, 0, 1, 1,
1.213174, 1.923705, 1.270644, 1, 0, 0, 1, 1,
1.215157, -0.5715874, 3.041153, 0, 0, 0, 1, 1,
1.219951, 1.208479, 0.8326441, 0, 0, 0, 1, 1,
1.239176, -0.1821872, 2.445991, 0, 0, 0, 1, 1,
1.248143, -0.1085216, 2.30277, 0, 0, 0, 1, 1,
1.248939, -0.5507807, 0.9257573, 0, 0, 0, 1, 1,
1.250571, 1.238865, -0.2073366, 0, 0, 0, 1, 1,
1.254039, 0.0007746052, 1.542925, 0, 0, 0, 1, 1,
1.255353, 0.2571984, 2.177263, 1, 1, 1, 1, 1,
1.265448, 0.111278, 2.171136, 1, 1, 1, 1, 1,
1.269652, -0.02815064, 1.158424, 1, 1, 1, 1, 1,
1.273365, -0.1380268, 1.957552, 1, 1, 1, 1, 1,
1.285066, -0.2319549, 1.917845, 1, 1, 1, 1, 1,
1.285701, -0.5908046, 0.7709375, 1, 1, 1, 1, 1,
1.289467, 0.466616, 2.816726, 1, 1, 1, 1, 1,
1.303626, 0.02791223, 0.1801251, 1, 1, 1, 1, 1,
1.313366, -0.5141086, 1.221013, 1, 1, 1, 1, 1,
1.334036, 0.9763567, -0.2657942, 1, 1, 1, 1, 1,
1.343159, 0.9060578, 1.568102, 1, 1, 1, 1, 1,
1.369793, 0.4323485, 1.549528, 1, 1, 1, 1, 1,
1.386204, 0.01816093, 0.9115951, 1, 1, 1, 1, 1,
1.392489, -0.1638898, 1.405098, 1, 1, 1, 1, 1,
1.394105, -0.7008887, 3.400163, 1, 1, 1, 1, 1,
1.394936, -0.6741359, 1.810977, 0, 0, 1, 1, 1,
1.405118, 1.102426, -0.0947541, 1, 0, 0, 1, 1,
1.413993, -0.1082004, 1.492872, 1, 0, 0, 1, 1,
1.419481, 1.182503, -0.2731244, 1, 0, 0, 1, 1,
1.423402, 0.140001, 0.2870078, 1, 0, 0, 1, 1,
1.432351, -0.216348, 1.956575, 1, 0, 0, 1, 1,
1.438252, 1.253627, 0.6051137, 0, 0, 0, 1, 1,
1.445711, -1.042081, 1.530095, 0, 0, 0, 1, 1,
1.448477, 0.1959039, 2.133531, 0, 0, 0, 1, 1,
1.451494, 0.4881353, 1.972011, 0, 0, 0, 1, 1,
1.461847, 1.236498, 1.543957, 0, 0, 0, 1, 1,
1.465647, 0.3541918, 1.743721, 0, 0, 0, 1, 1,
1.468469, -1.173763, 2.659066, 0, 0, 0, 1, 1,
1.474341, -1.084982, 1.172906, 1, 1, 1, 1, 1,
1.477229, -1.095085, 2.327451, 1, 1, 1, 1, 1,
1.482746, -0.5211104, 0.9960936, 1, 1, 1, 1, 1,
1.484544, -0.8003623, 2.76841, 1, 1, 1, 1, 1,
1.495095, -0.8461756, 2.271628, 1, 1, 1, 1, 1,
1.496115, 0.5798033, 0.4790177, 1, 1, 1, 1, 1,
1.497364, -0.5753169, 2.565342, 1, 1, 1, 1, 1,
1.500571, -0.7181294, 1.369614, 1, 1, 1, 1, 1,
1.505444, -0.4600494, 2.19706, 1, 1, 1, 1, 1,
1.517572, -0.06642838, 0.09367543, 1, 1, 1, 1, 1,
1.5204, -1.352886, 3.060989, 1, 1, 1, 1, 1,
1.530851, 0.04536547, 1.564079, 1, 1, 1, 1, 1,
1.533153, -0.1090881, 1.807608, 1, 1, 1, 1, 1,
1.535554, -1.258996, 0.7170552, 1, 1, 1, 1, 1,
1.56417, 0.3504901, 2.904151, 1, 1, 1, 1, 1,
1.567253, -0.7125612, 1.76421, 0, 0, 1, 1, 1,
1.569282, 0.6871372, -0.5887774, 1, 0, 0, 1, 1,
1.579854, 0.07508487, 2.500151, 1, 0, 0, 1, 1,
1.582957, -0.207938, 0.9123157, 1, 0, 0, 1, 1,
1.590121, -0.5823025, 0.989053, 1, 0, 0, 1, 1,
1.604466, -0.2483075, -0.3797583, 1, 0, 0, 1, 1,
1.607744, 0.8413262, 0.1711548, 0, 0, 0, 1, 1,
1.608389, 0.7122787, 0.4950596, 0, 0, 0, 1, 1,
1.615689, -0.2427258, 1.973854, 0, 0, 0, 1, 1,
1.647742, -1.347316, 2.219473, 0, 0, 0, 1, 1,
1.665067, 0.7886378, 1.332799, 0, 0, 0, 1, 1,
1.667157, 0.03991755, 1.785987, 0, 0, 0, 1, 1,
1.670959, -1.302941, 3.478095, 0, 0, 0, 1, 1,
1.673018, 0.4529427, 1.126212, 1, 1, 1, 1, 1,
1.68584, 0.1001183, -0.8988706, 1, 1, 1, 1, 1,
1.700638, 0.06590331, -0.3753245, 1, 1, 1, 1, 1,
1.705765, 1.284978, 0.5747227, 1, 1, 1, 1, 1,
1.709293, -1.167082, 2.142228, 1, 1, 1, 1, 1,
1.711393, -1.761557, 1.707019, 1, 1, 1, 1, 1,
1.714701, 0.2333224, 2.170667, 1, 1, 1, 1, 1,
1.733784, -1.154184, 1.770104, 1, 1, 1, 1, 1,
1.781437, -0.1995842, 2.840561, 1, 1, 1, 1, 1,
1.79737, -0.518492, 0.6449286, 1, 1, 1, 1, 1,
1.805115, -0.09772766, 0.02082012, 1, 1, 1, 1, 1,
1.840035, 0.1418264, 2.457972, 1, 1, 1, 1, 1,
1.853194, -2.65254, 2.990144, 1, 1, 1, 1, 1,
1.863722, -0.742551, 1.916507, 1, 1, 1, 1, 1,
1.86702, 1.160847, 0.2167449, 1, 1, 1, 1, 1,
1.891408, 0.4390988, 1.0582, 0, 0, 1, 1, 1,
1.899682, -0.1667882, 0.7078539, 1, 0, 0, 1, 1,
1.905423, -0.4662054, 3.272893, 1, 0, 0, 1, 1,
1.916281, -0.1878284, 1.274082, 1, 0, 0, 1, 1,
1.922102, 0.9024776, 3.107523, 1, 0, 0, 1, 1,
1.925688, -0.2706895, 0.8135797, 1, 0, 0, 1, 1,
2.024215, -0.9388104, 1.097584, 0, 0, 0, 1, 1,
2.080998, -0.5037866, 3.767614, 0, 0, 0, 1, 1,
2.093596, -0.5059265, 2.462582, 0, 0, 0, 1, 1,
2.131623, 0.1327576, 1.855708, 0, 0, 0, 1, 1,
2.162413, 0.883653, 0.7628114, 0, 0, 0, 1, 1,
2.225998, 0.006469694, 1.102297, 0, 0, 0, 1, 1,
2.259266, -0.004737598, 3.448973, 0, 0, 0, 1, 1,
2.385766, -1.166019, 2.284509, 1, 1, 1, 1, 1,
2.38604, -0.752947, -0.42274, 1, 1, 1, 1, 1,
2.421972, 0.8816101, 1.93335, 1, 1, 1, 1, 1,
2.466957, 0.7012811, 0.8880485, 1, 1, 1, 1, 1,
2.475612, -0.9447506, 1.276198, 1, 1, 1, 1, 1,
2.51459, -0.1630625, 1.248865, 1, 1, 1, 1, 1,
2.729573, 0.4454983, 2.455091, 1, 1, 1, 1, 1
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
var radius = 9.126318;
var distance = 32.05581;
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
mvMatrix.translate( 0.4619979, 0.1039438, 0.3630912 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.05581);
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
