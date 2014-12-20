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
-3.255961, -0.1949242, -1.253115, 1, 0, 0, 1,
-3.076691, 1.329252, -2.106881, 1, 0.007843138, 0, 1,
-2.935159, -0.6453901, -2.20366, 1, 0.01176471, 0, 1,
-2.907261, -0.7368317, -2.449767, 1, 0.01960784, 0, 1,
-2.896128, -0.3707914, -1.947447, 1, 0.02352941, 0, 1,
-2.840566, -0.7920077, -2.224902, 1, 0.03137255, 0, 1,
-2.777696, -0.3966631, -1.373707, 1, 0.03529412, 0, 1,
-2.751865, -0.2835513, -1.948618, 1, 0.04313726, 0, 1,
-2.663058, -1.325296, -0.789919, 1, 0.04705882, 0, 1,
-2.630439, 1.884666, -0.8751502, 1, 0.05490196, 0, 1,
-2.571196, 0.02507383, -1.496442, 1, 0.05882353, 0, 1,
-2.50564, -0.8792033, -2.034648, 1, 0.06666667, 0, 1,
-2.49561, -0.9111063, -2.649565, 1, 0.07058824, 0, 1,
-2.484111, 0.2359908, -0.9108868, 1, 0.07843138, 0, 1,
-2.397198, -1.419029, -1.898694, 1, 0.08235294, 0, 1,
-2.372607, 0.4255757, -0.8088201, 1, 0.09019608, 0, 1,
-2.36515, 0.6320676, -1.310174, 1, 0.09411765, 0, 1,
-2.327966, 1.306502, -0.06493333, 1, 0.1019608, 0, 1,
-2.31127, -1.462893, -1.788069, 1, 0.1098039, 0, 1,
-2.280903, 0.03586116, -1.280292, 1, 0.1137255, 0, 1,
-2.259206, 0.6239404, -1.716564, 1, 0.1215686, 0, 1,
-2.221075, -0.3722221, -0.9030858, 1, 0.1254902, 0, 1,
-2.186985, -0.2891143, -0.5975521, 1, 0.1333333, 0, 1,
-2.123852, 0.4821254, -1.352511, 1, 0.1372549, 0, 1,
-2.12273, 0.2467181, -0.4988659, 1, 0.145098, 0, 1,
-2.106619, -0.9294075, -0.9431099, 1, 0.1490196, 0, 1,
-2.092024, -0.3877392, -0.08645604, 1, 0.1568628, 0, 1,
-2.035135, 1.503805, 0.4801357, 1, 0.1607843, 0, 1,
-2.010646, -0.1574091, -0.9844632, 1, 0.1686275, 0, 1,
-1.990779, -0.9073809, -2.458743, 1, 0.172549, 0, 1,
-1.982742, 0.2724043, -2.000886, 1, 0.1803922, 0, 1,
-1.958336, -0.7929177, -2.625556, 1, 0.1843137, 0, 1,
-1.896787, 0.1245066, -1.418798, 1, 0.1921569, 0, 1,
-1.868579, 0.7183388, -0.08016023, 1, 0.1960784, 0, 1,
-1.866007, 1.199179, -0.2705422, 1, 0.2039216, 0, 1,
-1.844371, 2.425021, -0.1278841, 1, 0.2117647, 0, 1,
-1.812353, 0.1525317, -1.592185, 1, 0.2156863, 0, 1,
-1.806073, 0.5459187, -0.5722532, 1, 0.2235294, 0, 1,
-1.787308, 0.7032418, -2.228666, 1, 0.227451, 0, 1,
-1.739773, -0.3628692, -3.073887, 1, 0.2352941, 0, 1,
-1.728653, 0.8105558, -0.6309248, 1, 0.2392157, 0, 1,
-1.721328, 0.8788976, -1.381212, 1, 0.2470588, 0, 1,
-1.710305, -0.9066694, -1.469081, 1, 0.2509804, 0, 1,
-1.70924, 1.667128, 0.4897259, 1, 0.2588235, 0, 1,
-1.694333, -1.320013, -0.2034535, 1, 0.2627451, 0, 1,
-1.67441, -1.363069, -1.882591, 1, 0.2705882, 0, 1,
-1.673849, 1.229357, 1.031838, 1, 0.2745098, 0, 1,
-1.658891, -0.9157118, -1.900104, 1, 0.282353, 0, 1,
-1.648938, -0.1705702, -3.545609, 1, 0.2862745, 0, 1,
-1.642576, -1.331344, -2.710792, 1, 0.2941177, 0, 1,
-1.640797, -0.5526345, -0.6775057, 1, 0.3019608, 0, 1,
-1.631905, -0.4977329, -1.589643, 1, 0.3058824, 0, 1,
-1.61891, -0.5043499, -1.613788, 1, 0.3137255, 0, 1,
-1.612837, -0.1995593, -2.221514, 1, 0.3176471, 0, 1,
-1.604863, -0.5755661, -2.450459, 1, 0.3254902, 0, 1,
-1.596681, -0.9217412, -2.545864, 1, 0.3294118, 0, 1,
-1.594047, 0.7740898, -1.612628, 1, 0.3372549, 0, 1,
-1.592246, -1.461613, -3.005153, 1, 0.3411765, 0, 1,
-1.590312, -0.4100398, -2.701369, 1, 0.3490196, 0, 1,
-1.583975, 1.392481, -0.187344, 1, 0.3529412, 0, 1,
-1.577936, 0.3894509, -1.59149, 1, 0.3607843, 0, 1,
-1.544676, -0.6375158, -2.683224, 1, 0.3647059, 0, 1,
-1.536437, 0.6271716, -0.5633277, 1, 0.372549, 0, 1,
-1.532741, -1.037557, -3.64267, 1, 0.3764706, 0, 1,
-1.51738, 2.436042, -0.3941208, 1, 0.3843137, 0, 1,
-1.507497, -0.4620709, -3.170285, 1, 0.3882353, 0, 1,
-1.50396, 0.2469343, -2.422572, 1, 0.3960784, 0, 1,
-1.502388, -0.5743793, -1.10663, 1, 0.4039216, 0, 1,
-1.501845, -1.507833, -2.54437, 1, 0.4078431, 0, 1,
-1.50128, -0.02247057, -0.6026277, 1, 0.4156863, 0, 1,
-1.499015, -0.2807032, -1.812971, 1, 0.4196078, 0, 1,
-1.496226, 0.05704551, -2.615119, 1, 0.427451, 0, 1,
-1.496137, -0.2421472, -2.591937, 1, 0.4313726, 0, 1,
-1.482382, -1.382336, -0.990266, 1, 0.4392157, 0, 1,
-1.481562, 0.1812233, -2.486496, 1, 0.4431373, 0, 1,
-1.478849, 0.1192404, -1.584678, 1, 0.4509804, 0, 1,
-1.46976, -0.7294227, -2.230137, 1, 0.454902, 0, 1,
-1.468016, -0.7121243, -3.079603, 1, 0.4627451, 0, 1,
-1.467655, 0.2253784, -0.5659522, 1, 0.4666667, 0, 1,
-1.463543, -0.5515407, -2.644086, 1, 0.4745098, 0, 1,
-1.460415, -0.6751031, -1.152725, 1, 0.4784314, 0, 1,
-1.451956, 0.4293326, -2.069699, 1, 0.4862745, 0, 1,
-1.448582, -0.3926203, -1.219717, 1, 0.4901961, 0, 1,
-1.436381, 0.7125459, -1.744995, 1, 0.4980392, 0, 1,
-1.432765, 1.849077, -0.4743813, 1, 0.5058824, 0, 1,
-1.423116, -0.5575097, -2.018445, 1, 0.509804, 0, 1,
-1.422627, 0.01586304, -0.519409, 1, 0.5176471, 0, 1,
-1.416136, 0.9200661, -1.868262, 1, 0.5215687, 0, 1,
-1.410283, -1.567619, -1.515305, 1, 0.5294118, 0, 1,
-1.405682, 1.847162, -1.225712, 1, 0.5333334, 0, 1,
-1.399059, -1.395504, -3.761431, 1, 0.5411765, 0, 1,
-1.397215, 0.4665734, -0.5293935, 1, 0.5450981, 0, 1,
-1.379097, 1.993396, -1.251413, 1, 0.5529412, 0, 1,
-1.371651, 1.909931, -0.1023144, 1, 0.5568628, 0, 1,
-1.360586, 1.301337, -1.670626, 1, 0.5647059, 0, 1,
-1.353514, 2.809433, 0.5993479, 1, 0.5686275, 0, 1,
-1.340218, -0.6061344, -1.210389, 1, 0.5764706, 0, 1,
-1.337953, 0.004135145, -0.9390627, 1, 0.5803922, 0, 1,
-1.332202, 0.6315404, -0.4228876, 1, 0.5882353, 0, 1,
-1.331354, -1.009426, -1.425659, 1, 0.5921569, 0, 1,
-1.324866, 0.3533182, -1.072787, 1, 0.6, 0, 1,
-1.322015, 0.5003029, -1.365352, 1, 0.6078432, 0, 1,
-1.314004, 0.8735043, -2.330855, 1, 0.6117647, 0, 1,
-1.313428, 0.2198635, -0.2024656, 1, 0.6196079, 0, 1,
-1.302159, -0.04328953, -3.255015, 1, 0.6235294, 0, 1,
-1.283775, 0.9883988, -1.446214, 1, 0.6313726, 0, 1,
-1.277544, -1.81085, -3.695569, 1, 0.6352941, 0, 1,
-1.268224, 0.8503239, -1.579172, 1, 0.6431373, 0, 1,
-1.25945, 0.6168982, -2.468163, 1, 0.6470588, 0, 1,
-1.2582, -0.7681372, -0.1878133, 1, 0.654902, 0, 1,
-1.256325, -0.3775034, -0.8045486, 1, 0.6588235, 0, 1,
-1.25371, -0.9249917, -0.4906934, 1, 0.6666667, 0, 1,
-1.252014, 0.6793281, -1.156103, 1, 0.6705883, 0, 1,
-1.247802, 0.2344524, -1.35338, 1, 0.6784314, 0, 1,
-1.245866, 0.9364502, -0.4343327, 1, 0.682353, 0, 1,
-1.232854, -0.1890247, -0.009786755, 1, 0.6901961, 0, 1,
-1.231957, -0.1394811, -2.266854, 1, 0.6941177, 0, 1,
-1.22605, 0.08092415, -2.02418, 1, 0.7019608, 0, 1,
-1.223837, 0.4856165, -1.399743, 1, 0.7098039, 0, 1,
-1.21606, -0.4664612, -1.138995, 1, 0.7137255, 0, 1,
-1.215198, 0.6937395, -1.57338, 1, 0.7215686, 0, 1,
-1.213403, -0.4289221, -2.860918, 1, 0.7254902, 0, 1,
-1.208211, 0.3790302, -2.182231, 1, 0.7333333, 0, 1,
-1.20344, 0.09705881, -0.5298642, 1, 0.7372549, 0, 1,
-1.193326, 0.2364957, -0.5948174, 1, 0.7450981, 0, 1,
-1.191792, -0.7662264, -0.8777621, 1, 0.7490196, 0, 1,
-1.185894, -0.3736084, -4.131365, 1, 0.7568628, 0, 1,
-1.170957, 0.8449956, 0.08111986, 1, 0.7607843, 0, 1,
-1.169285, -0.7308092, -2.575537, 1, 0.7686275, 0, 1,
-1.162543, 0.8523127, -0.2452301, 1, 0.772549, 0, 1,
-1.156082, -2.510077, -3.054879, 1, 0.7803922, 0, 1,
-1.155911, 0.7326907, -2.1744, 1, 0.7843137, 0, 1,
-1.150162, -0.003995848, -1.625178, 1, 0.7921569, 0, 1,
-1.142206, 0.7316023, -1.659996, 1, 0.7960784, 0, 1,
-1.140436, 0.7797795, -1.635933, 1, 0.8039216, 0, 1,
-1.131786, 0.8877261, -1.676161, 1, 0.8117647, 0, 1,
-1.129659, 0.6894534, -1.271614, 1, 0.8156863, 0, 1,
-1.127171, -0.2248767, -1.793131, 1, 0.8235294, 0, 1,
-1.123143, -0.2393419, -2.05872, 1, 0.827451, 0, 1,
-1.111323, -0.7220813, -1.402185, 1, 0.8352941, 0, 1,
-1.107529, 0.1238377, 0.188318, 1, 0.8392157, 0, 1,
-1.10156, 0.1384509, -1.536332, 1, 0.8470588, 0, 1,
-1.09883, 0.3487594, -0.2132151, 1, 0.8509804, 0, 1,
-1.093681, -0.06892923, -1.762932, 1, 0.8588235, 0, 1,
-1.08868, 1.592342, -0.1663696, 1, 0.8627451, 0, 1,
-1.085341, 0.6207275, -1.666116, 1, 0.8705882, 0, 1,
-1.077297, -0.3266037, -0.9366113, 1, 0.8745098, 0, 1,
-1.076505, -0.1416798, -1.807072, 1, 0.8823529, 0, 1,
-1.075415, -0.7848682, -2.861152, 1, 0.8862745, 0, 1,
-1.074663, 1.708374, 0.1986903, 1, 0.8941177, 0, 1,
-1.070336, -1.749794, -2.010183, 1, 0.8980392, 0, 1,
-1.069206, -0.6191531, -1.123893, 1, 0.9058824, 0, 1,
-1.060064, 0.6067864, -0.7629999, 1, 0.9137255, 0, 1,
-1.042588, 2.458231, 1.131924, 1, 0.9176471, 0, 1,
-1.041769, 0.1153534, -1.206927, 1, 0.9254902, 0, 1,
-1.028416, -1.043877, -1.446866, 1, 0.9294118, 0, 1,
-1.027785, -1.88729, -2.360522, 1, 0.9372549, 0, 1,
-1.025692, 0.2474906, -1.747105, 1, 0.9411765, 0, 1,
-1.025185, -1.223072, -1.736776, 1, 0.9490196, 0, 1,
-1.018037, -0.3216122, -3.872925, 1, 0.9529412, 0, 1,
-1.016048, -1.348155, -4.029933, 1, 0.9607843, 0, 1,
-1.010774, -0.5969911, -0.9940649, 1, 0.9647059, 0, 1,
-1.000529, -0.8623385, -1.409224, 1, 0.972549, 0, 1,
-0.9957693, -0.7770913, -3.86653, 1, 0.9764706, 0, 1,
-0.9947743, -0.3833379, -1.216337, 1, 0.9843137, 0, 1,
-0.9937372, 2.137415, -1.008179, 1, 0.9882353, 0, 1,
-0.9921125, 1.433193, -0.7433318, 1, 0.9960784, 0, 1,
-0.9851421, 2.053079, -2.676066, 0.9960784, 1, 0, 1,
-0.9811816, 0.6473238, -2.574754, 0.9921569, 1, 0, 1,
-0.9782623, 1.44711, -2.138006, 0.9843137, 1, 0, 1,
-0.9771144, 0.08236648, -0.1381905, 0.9803922, 1, 0, 1,
-0.9770728, 0.3167599, -2.065861, 0.972549, 1, 0, 1,
-0.9668012, -0.567913, -1.635851, 0.9686275, 1, 0, 1,
-0.9666503, -0.3901312, -2.948773, 0.9607843, 1, 0, 1,
-0.960544, -0.741291, -2.836775, 0.9568627, 1, 0, 1,
-0.9557044, 1.048005, -0.1370092, 0.9490196, 1, 0, 1,
-0.9536173, -0.4284598, -2.401408, 0.945098, 1, 0, 1,
-0.9513225, -2.037458, -0.4852567, 0.9372549, 1, 0, 1,
-0.9506233, 0.2057185, -1.694515, 0.9333333, 1, 0, 1,
-0.9465878, -0.2709143, -0.8188631, 0.9254902, 1, 0, 1,
-0.9461291, -0.2450959, -0.562002, 0.9215686, 1, 0, 1,
-0.9433598, -1.976237, -1.603401, 0.9137255, 1, 0, 1,
-0.9409003, 0.4797983, -2.382548, 0.9098039, 1, 0, 1,
-0.9408445, 0.4440168, 0.7144147, 0.9019608, 1, 0, 1,
-0.9393819, 0.7695972, -1.011213, 0.8941177, 1, 0, 1,
-0.9393669, -0.03216161, -2.228763, 0.8901961, 1, 0, 1,
-0.9387513, -0.3020484, -2.858259, 0.8823529, 1, 0, 1,
-0.9310726, -0.5458993, -1.896798, 0.8784314, 1, 0, 1,
-0.929536, 0.1741206, -0.7358886, 0.8705882, 1, 0, 1,
-0.9293224, -0.6101039, -2.858294, 0.8666667, 1, 0, 1,
-0.928122, 0.2493567, -1.507374, 0.8588235, 1, 0, 1,
-0.9269314, -0.007969559, -0.4431854, 0.854902, 1, 0, 1,
-0.91979, -0.0644276, -1.914549, 0.8470588, 1, 0, 1,
-0.9076836, 1.213674, -0.6104237, 0.8431373, 1, 0, 1,
-0.9047528, -0.9747323, -4.406717, 0.8352941, 1, 0, 1,
-0.900933, -0.2255448, -1.667198, 0.8313726, 1, 0, 1,
-0.8992254, 0.9580271, 0.1601992, 0.8235294, 1, 0, 1,
-0.8964741, -0.790649, -2.833649, 0.8196079, 1, 0, 1,
-0.8838621, 0.2376007, -1.370285, 0.8117647, 1, 0, 1,
-0.8838554, 2.848178, -1.381708, 0.8078431, 1, 0, 1,
-0.8836499, 2.583224, -1.23906, 0.8, 1, 0, 1,
-0.880707, -1.412662, -2.082719, 0.7921569, 1, 0, 1,
-0.8781818, -0.1159737, -3.369125, 0.7882353, 1, 0, 1,
-0.8630493, -0.2972129, -3.863999, 0.7803922, 1, 0, 1,
-0.8610901, 1.649113, -0.2790515, 0.7764706, 1, 0, 1,
-0.860483, 1.120848, -1.018245, 0.7686275, 1, 0, 1,
-0.8587062, -0.189709, -1.787825, 0.7647059, 1, 0, 1,
-0.8567275, -1.620011, -1.193603, 0.7568628, 1, 0, 1,
-0.855869, -0.307653, -2.375703, 0.7529412, 1, 0, 1,
-0.8442161, -0.9023815, -1.559285, 0.7450981, 1, 0, 1,
-0.8408163, -1.028209, -3.426374, 0.7411765, 1, 0, 1,
-0.8382912, -2.564083, -3.31019, 0.7333333, 1, 0, 1,
-0.8342844, 0.6274068, -0.5343122, 0.7294118, 1, 0, 1,
-0.8254399, 1.914859, -0.6581677, 0.7215686, 1, 0, 1,
-0.8230487, -0.7435734, -3.955513, 0.7176471, 1, 0, 1,
-0.8220318, 0.4550095, -0.1656666, 0.7098039, 1, 0, 1,
-0.8211731, 1.761703, 0.9169915, 0.7058824, 1, 0, 1,
-0.8203474, -1.288493, -2.416823, 0.6980392, 1, 0, 1,
-0.8119333, -1.2197, -2.713207, 0.6901961, 1, 0, 1,
-0.8117638, 1.27175, -1.445304, 0.6862745, 1, 0, 1,
-0.8108311, -0.4486852, -1.023888, 0.6784314, 1, 0, 1,
-0.8100116, 0.2842191, 0.1011602, 0.6745098, 1, 0, 1,
-0.8022645, -1.887076, -2.269974, 0.6666667, 1, 0, 1,
-0.801316, -0.1041452, -1.032101, 0.6627451, 1, 0, 1,
-0.7994412, -0.8687895, -1.46514, 0.654902, 1, 0, 1,
-0.7971439, -0.1168102, -2.239757, 0.6509804, 1, 0, 1,
-0.7919181, 0.3634499, -1.530954, 0.6431373, 1, 0, 1,
-0.7908768, -0.01536035, -1.260188, 0.6392157, 1, 0, 1,
-0.7882592, 0.6926724, -0.4392913, 0.6313726, 1, 0, 1,
-0.7879888, 2.031405, 0.8857694, 0.627451, 1, 0, 1,
-0.7788589, -0.1952475, -0.5789093, 0.6196079, 1, 0, 1,
-0.7731638, 0.802483, -1.291105, 0.6156863, 1, 0, 1,
-0.7725925, 0.6565002, -1.66335, 0.6078432, 1, 0, 1,
-0.7712605, 0.3729652, -1.929367, 0.6039216, 1, 0, 1,
-0.7702441, 0.8338969, 1.437067, 0.5960785, 1, 0, 1,
-0.7631021, -0.7762484, -2.347746, 0.5882353, 1, 0, 1,
-0.7568853, -0.8054751, -3.286518, 0.5843138, 1, 0, 1,
-0.7562953, 0.8927116, -0.9581991, 0.5764706, 1, 0, 1,
-0.7544121, -0.9974351, -2.761047, 0.572549, 1, 0, 1,
-0.7536764, 0.1352179, 0.1255723, 0.5647059, 1, 0, 1,
-0.750063, -0.3957906, -1.390103, 0.5607843, 1, 0, 1,
-0.7498567, -0.1903041, -2.614598, 0.5529412, 1, 0, 1,
-0.7485247, 1.741646, 0.8331023, 0.5490196, 1, 0, 1,
-0.7442009, -0.03451094, -1.112165, 0.5411765, 1, 0, 1,
-0.7310601, -0.3913662, -3.991552, 0.5372549, 1, 0, 1,
-0.7298346, 2.230944, -0.9323971, 0.5294118, 1, 0, 1,
-0.7294629, 0.1867926, -0.7405738, 0.5254902, 1, 0, 1,
-0.7287083, 0.2567082, -0.955737, 0.5176471, 1, 0, 1,
-0.7241703, -1.218807, -5.027923, 0.5137255, 1, 0, 1,
-0.7192679, -0.4543762, -1.803426, 0.5058824, 1, 0, 1,
-0.7189134, -0.2729913, -1.853521, 0.5019608, 1, 0, 1,
-0.7120844, 0.2465476, -1.572893, 0.4941176, 1, 0, 1,
-0.7080414, -0.002826911, -2.100214, 0.4862745, 1, 0, 1,
-0.7073428, -1.108389, -1.357346, 0.4823529, 1, 0, 1,
-0.7061474, -0.06614329, -2.287636, 0.4745098, 1, 0, 1,
-0.7035834, -0.511461, -2.886922, 0.4705882, 1, 0, 1,
-0.7024319, -0.1999096, -3.041512, 0.4627451, 1, 0, 1,
-0.7016666, -0.2056405, -1.352569, 0.4588235, 1, 0, 1,
-0.6996104, 0.2270732, -1.533617, 0.4509804, 1, 0, 1,
-0.6916378, -0.02264298, -1.886991, 0.4470588, 1, 0, 1,
-0.6864495, -0.2815428, -0.2572866, 0.4392157, 1, 0, 1,
-0.6831736, -0.1780669, -3.473666, 0.4352941, 1, 0, 1,
-0.6789509, -0.142727, -2.510076, 0.427451, 1, 0, 1,
-0.6737631, -1.720112, -0.9476935, 0.4235294, 1, 0, 1,
-0.6655508, -1.188799, -3.533737, 0.4156863, 1, 0, 1,
-0.6593573, 1.235287, -0.9163709, 0.4117647, 1, 0, 1,
-0.6593053, 0.7651379, -0.5862517, 0.4039216, 1, 0, 1,
-0.6534769, 2.050504, 0.06393373, 0.3960784, 1, 0, 1,
-0.6511532, 1.899481, 0.5563796, 0.3921569, 1, 0, 1,
-0.651051, 1.564688, 0.5600756, 0.3843137, 1, 0, 1,
-0.6462327, -0.6672959, -0.4352056, 0.3803922, 1, 0, 1,
-0.6450706, -0.3477346, -2.076213, 0.372549, 1, 0, 1,
-0.6410454, -0.5080278, -2.662603, 0.3686275, 1, 0, 1,
-0.6405058, -1.154571, -2.728357, 0.3607843, 1, 0, 1,
-0.6394963, -0.5209787, -1.767991, 0.3568628, 1, 0, 1,
-0.6332392, -0.9020386, -2.117086, 0.3490196, 1, 0, 1,
-0.6324363, -0.1792383, -1.844903, 0.345098, 1, 0, 1,
-0.6303511, -0.1634002, -1.173442, 0.3372549, 1, 0, 1,
-0.6263877, 1.800747, -1.863571, 0.3333333, 1, 0, 1,
-0.6236088, 0.2495393, -0.7255774, 0.3254902, 1, 0, 1,
-0.6218588, 0.6031498, -1.125281, 0.3215686, 1, 0, 1,
-0.607322, -0.6286603, -1.895809, 0.3137255, 1, 0, 1,
-0.6012629, -0.7099776, -2.94161, 0.3098039, 1, 0, 1,
-0.5967193, -0.4427547, -2.804562, 0.3019608, 1, 0, 1,
-0.5964038, 0.3181404, -2.484784, 0.2941177, 1, 0, 1,
-0.5915152, 1.876074, -0.8172739, 0.2901961, 1, 0, 1,
-0.5836858, 1.196692, -0.2167313, 0.282353, 1, 0, 1,
-0.5812212, -1.035137, -2.617011, 0.2784314, 1, 0, 1,
-0.5746596, 0.6955485, 0.9411597, 0.2705882, 1, 0, 1,
-0.5695291, 0.08099055, -0.5830315, 0.2666667, 1, 0, 1,
-0.5578722, 0.3979746, -0.6875048, 0.2588235, 1, 0, 1,
-0.5570116, 0.3963661, -0.4235175, 0.254902, 1, 0, 1,
-0.5547057, 0.01811022, -1.402889, 0.2470588, 1, 0, 1,
-0.553299, -0.8960704, -2.923677, 0.2431373, 1, 0, 1,
-0.5521134, -0.7371427, -1.413906, 0.2352941, 1, 0, 1,
-0.5487796, -1.077585, -4.118808, 0.2313726, 1, 0, 1,
-0.5439458, -0.4705038, -1.810538, 0.2235294, 1, 0, 1,
-0.5405587, 1.299417, -0.3218551, 0.2196078, 1, 0, 1,
-0.5385218, -0.9038466, -2.537489, 0.2117647, 1, 0, 1,
-0.5362619, -1.22017, -2.491884, 0.2078431, 1, 0, 1,
-0.5298027, -2.101167, -1.183858, 0.2, 1, 0, 1,
-0.5250958, 0.191337, -0.4454522, 0.1921569, 1, 0, 1,
-0.5181327, 0.8446267, -1.383368, 0.1882353, 1, 0, 1,
-0.5163535, 0.002425894, -1.973247, 0.1803922, 1, 0, 1,
-0.5160615, 0.2760293, -1.658766, 0.1764706, 1, 0, 1,
-0.5157923, 0.7130702, -1.257474, 0.1686275, 1, 0, 1,
-0.5139278, -0.001417068, -0.5651807, 0.1647059, 1, 0, 1,
-0.5125969, 1.236308, -1.078389, 0.1568628, 1, 0, 1,
-0.509423, 1.40665, -1.295876, 0.1529412, 1, 0, 1,
-0.5072448, 2.080195, -1.165006, 0.145098, 1, 0, 1,
-0.50685, 0.6560906, -0.9085928, 0.1411765, 1, 0, 1,
-0.5064955, -1.278674, -2.438223, 0.1333333, 1, 0, 1,
-0.503004, 1.221354, -0.9899212, 0.1294118, 1, 0, 1,
-0.500718, -0.8635664, -3.108891, 0.1215686, 1, 0, 1,
-0.5005147, 0.5331391, 0.8236439, 0.1176471, 1, 0, 1,
-0.4964411, -1.257744, -3.113936, 0.1098039, 1, 0, 1,
-0.4946491, -0.1324317, -2.921633, 0.1058824, 1, 0, 1,
-0.4930692, 0.0900439, -1.941026, 0.09803922, 1, 0, 1,
-0.4884627, -0.6918297, -3.467354, 0.09019608, 1, 0, 1,
-0.4818613, 1.028334, -2.402832, 0.08627451, 1, 0, 1,
-0.4790415, 0.3031198, -0.834598, 0.07843138, 1, 0, 1,
-0.4784037, 0.2684498, -0.7331528, 0.07450981, 1, 0, 1,
-0.4766551, 0.6129571, -0.2580554, 0.06666667, 1, 0, 1,
-0.4761331, -0.6575663, -1.8658, 0.0627451, 1, 0, 1,
-0.474483, 1.047635, 0.05641754, 0.05490196, 1, 0, 1,
-0.4734717, 0.1229504, -0.9274185, 0.05098039, 1, 0, 1,
-0.4711776, -1.566826, -4.159832, 0.04313726, 1, 0, 1,
-0.4704652, -0.3408213, -3.336801, 0.03921569, 1, 0, 1,
-0.4681925, -0.8311742, -1.735113, 0.03137255, 1, 0, 1,
-0.4640605, -0.1182327, -2.416064, 0.02745098, 1, 0, 1,
-0.4619248, 1.569604, -1.47452, 0.01960784, 1, 0, 1,
-0.4594256, -1.14978, -1.841339, 0.01568628, 1, 0, 1,
-0.4564187, -0.1812081, -0.08978947, 0.007843138, 1, 0, 1,
-0.4543292, -0.8772128, -2.720626, 0.003921569, 1, 0, 1,
-0.4541167, -0.558132, -2.28004, 0, 1, 0.003921569, 1,
-0.4539365, 1.6337, 0.1030211, 0, 1, 0.01176471, 1,
-0.4497421, 0.4903518, 0.86132, 0, 1, 0.01568628, 1,
-0.4484236, -0.4425582, -2.809314, 0, 1, 0.02352941, 1,
-0.4444961, -1.168794, -4.10708, 0, 1, 0.02745098, 1,
-0.4405791, -0.0647854, -2.385077, 0, 1, 0.03529412, 1,
-0.4373702, 1.832338, 0.4388777, 0, 1, 0.03921569, 1,
-0.4335993, 0.6457348, -0.365475, 0, 1, 0.04705882, 1,
-0.4328791, -0.1366717, -2.454214, 0, 1, 0.05098039, 1,
-0.431854, 1.530397, -0.4695964, 0, 1, 0.05882353, 1,
-0.4314332, 0.9798077, 0.1570019, 0, 1, 0.0627451, 1,
-0.4209492, 0.2996396, -1.227289, 0, 1, 0.07058824, 1,
-0.420614, 1.673351, -0.3272648, 0, 1, 0.07450981, 1,
-0.4173198, -1.094151, -3.41622, 0, 1, 0.08235294, 1,
-0.4163712, 1.13625, 0.6791139, 0, 1, 0.08627451, 1,
-0.4125777, -1.396874, -2.165964, 0, 1, 0.09411765, 1,
-0.409535, -0.2103716, -2.370149, 0, 1, 0.1019608, 1,
-0.4086445, 1.155725, -0.1096709, 0, 1, 0.1058824, 1,
-0.4077724, -0.8021056, -1.656942, 0, 1, 0.1137255, 1,
-0.4035184, 0.162995, -2.109263, 0, 1, 0.1176471, 1,
-0.3915509, 0.9506865, -0.1693416, 0, 1, 0.1254902, 1,
-0.3909323, -1.317244, -4.222317, 0, 1, 0.1294118, 1,
-0.3878206, 1.068856, -0.03065404, 0, 1, 0.1372549, 1,
-0.3711404, 0.1959207, -1.807419, 0, 1, 0.1411765, 1,
-0.3665946, 0.4956496, -1.248011, 0, 1, 0.1490196, 1,
-0.3655024, 2.502764, 0.8891853, 0, 1, 0.1529412, 1,
-0.363979, 1.021806, -2.109787, 0, 1, 0.1607843, 1,
-0.3613752, 1.011943, -0.3487246, 0, 1, 0.1647059, 1,
-0.3561833, 0.7232593, 1.992669, 0, 1, 0.172549, 1,
-0.3548276, -1.511745, -3.706494, 0, 1, 0.1764706, 1,
-0.3542505, -1.365535, -2.669153, 0, 1, 0.1843137, 1,
-0.352111, -1.556207, -3.908829, 0, 1, 0.1882353, 1,
-0.3485629, -2.321536, -1.81729, 0, 1, 0.1960784, 1,
-0.3478344, 0.9055653, -0.8448362, 0, 1, 0.2039216, 1,
-0.3433102, -1.510781, -2.068463, 0, 1, 0.2078431, 1,
-0.339614, 0.5966485, -0.5520978, 0, 1, 0.2156863, 1,
-0.3370135, -0.3373164, -4.867184, 0, 1, 0.2196078, 1,
-0.3360021, -0.7249098, -3.071127, 0, 1, 0.227451, 1,
-0.3359966, -2.009792, -1.901695, 0, 1, 0.2313726, 1,
-0.335527, 0.4871453, -0.2775729, 0, 1, 0.2392157, 1,
-0.3343404, 0.5160841, -0.7504871, 0, 1, 0.2431373, 1,
-0.3338854, -0.1763003, -3.279721, 0, 1, 0.2509804, 1,
-0.3337061, -1.557764, -4.317127, 0, 1, 0.254902, 1,
-0.3314309, -0.02545811, -1.736786, 0, 1, 0.2627451, 1,
-0.3309774, 0.4249278, 0.6207271, 0, 1, 0.2666667, 1,
-0.3300787, 0.7665736, -0.2038282, 0, 1, 0.2745098, 1,
-0.329019, -0.1663255, -2.146738, 0, 1, 0.2784314, 1,
-0.328181, -0.6341825, -1.865036, 0, 1, 0.2862745, 1,
-0.3241847, 0.8041697, -0.1399516, 0, 1, 0.2901961, 1,
-0.3228471, 1.07793, -1.81448, 0, 1, 0.2980392, 1,
-0.3189335, 0.4016905, -2.591314, 0, 1, 0.3058824, 1,
-0.3120279, 1.162276, 0.05115532, 0, 1, 0.3098039, 1,
-0.3108561, 0.0557963, -1.009292, 0, 1, 0.3176471, 1,
-0.3062519, -0.5528436, -3.951478, 0, 1, 0.3215686, 1,
-0.3038039, -1.703299, -3.057653, 0, 1, 0.3294118, 1,
-0.3031293, -0.2806969, -1.144336, 0, 1, 0.3333333, 1,
-0.2958954, -0.8401687, -2.133267, 0, 1, 0.3411765, 1,
-0.2924314, -1.937646, -2.583051, 0, 1, 0.345098, 1,
-0.292286, -0.6067246, -2.254152, 0, 1, 0.3529412, 1,
-0.292197, 0.4723297, -0.3646497, 0, 1, 0.3568628, 1,
-0.2906219, 0.4493015, -1.1277, 0, 1, 0.3647059, 1,
-0.2898052, -2.336347, -1.440713, 0, 1, 0.3686275, 1,
-0.2898026, -0.02360928, -2.332057, 0, 1, 0.3764706, 1,
-0.2861565, 1.275738, -0.1512677, 0, 1, 0.3803922, 1,
-0.2855237, 0.02287982, -1.887284, 0, 1, 0.3882353, 1,
-0.2808867, 0.2435066, -2.138135, 0, 1, 0.3921569, 1,
-0.2788127, -0.2044266, -2.140807, 0, 1, 0.4, 1,
-0.2766744, 0.491183, -0.3098817, 0, 1, 0.4078431, 1,
-0.2727303, -0.168644, -1.491748, 0, 1, 0.4117647, 1,
-0.2726748, 1.61424, -1.101778, 0, 1, 0.4196078, 1,
-0.2721279, 1.108523, 1.728978, 0, 1, 0.4235294, 1,
-0.2706068, 0.2933784, -1.315418, 0, 1, 0.4313726, 1,
-0.2704011, -1.103214, -3.459992, 0, 1, 0.4352941, 1,
-0.2682603, 1.751253, 1.160788, 0, 1, 0.4431373, 1,
-0.2624747, 0.4020073, -1.528267, 0, 1, 0.4470588, 1,
-0.2569242, -0.3722094, -3.169985, 0, 1, 0.454902, 1,
-0.2557641, 0.2226539, -0.1469664, 0, 1, 0.4588235, 1,
-0.2468276, 0.06000026, 0.4405043, 0, 1, 0.4666667, 1,
-0.2454515, 0.2998979, -1.161907, 0, 1, 0.4705882, 1,
-0.2429476, -0.2252932, -2.71615, 0, 1, 0.4784314, 1,
-0.2414022, 0.2917275, -1.940729, 0, 1, 0.4823529, 1,
-0.2411272, 0.9167679, -2.465512, 0, 1, 0.4901961, 1,
-0.2405846, 1.001904, -2.133834, 0, 1, 0.4941176, 1,
-0.2381426, -0.2772264, -2.820702, 0, 1, 0.5019608, 1,
-0.2356283, -2.850292, -3.368123, 0, 1, 0.509804, 1,
-0.2321737, 0.5116955, -0.4967277, 0, 1, 0.5137255, 1,
-0.2270187, -0.0322829, -1.204102, 0, 1, 0.5215687, 1,
-0.2253958, -0.7792696, -2.11728, 0, 1, 0.5254902, 1,
-0.2238497, 1.409934, 0.9440734, 0, 1, 0.5333334, 1,
-0.2232724, -1.095336, -2.924783, 0, 1, 0.5372549, 1,
-0.2223797, 0.4455225, -0.5591258, 0, 1, 0.5450981, 1,
-0.2186282, 1.054672, -0.1553157, 0, 1, 0.5490196, 1,
-0.2136014, 0.5671978, -0.4316473, 0, 1, 0.5568628, 1,
-0.2130038, -0.6858187, -4.285519, 0, 1, 0.5607843, 1,
-0.2091347, -0.446247, -3.255749, 0, 1, 0.5686275, 1,
-0.2068872, 1.299016, 0.3343844, 0, 1, 0.572549, 1,
-0.204664, -0.9644137, -2.386652, 0, 1, 0.5803922, 1,
-0.2038978, 0.4132844, 0.2200291, 0, 1, 0.5843138, 1,
-0.1987818, 0.5509582, 0.1324156, 0, 1, 0.5921569, 1,
-0.1941169, 0.3587767, 0.2930442, 0, 1, 0.5960785, 1,
-0.1930078, 0.08766431, -0.6261601, 0, 1, 0.6039216, 1,
-0.1908978, -0.5632799, -2.226832, 0, 1, 0.6117647, 1,
-0.1868912, 1.449653, -0.6057166, 0, 1, 0.6156863, 1,
-0.1852967, -0.09448867, -1.695452, 0, 1, 0.6235294, 1,
-0.1850245, -0.6189705, -2.187342, 0, 1, 0.627451, 1,
-0.1836776, -0.6955436, -4.281621, 0, 1, 0.6352941, 1,
-0.182963, 1.472679, 0.9209924, 0, 1, 0.6392157, 1,
-0.1805653, -2.053288, -2.713861, 0, 1, 0.6470588, 1,
-0.1784781, 0.18481, -1.621273, 0, 1, 0.6509804, 1,
-0.1776955, 1.918675, 0.07632606, 0, 1, 0.6588235, 1,
-0.1768404, -2.53753, -3.202132, 0, 1, 0.6627451, 1,
-0.1707461, 0.1937099, -1.570022, 0, 1, 0.6705883, 1,
-0.1644941, 0.833733, 0.2975174, 0, 1, 0.6745098, 1,
-0.1481118, -0.4079412, -4.181973, 0, 1, 0.682353, 1,
-0.1480523, -0.341158, -3.352745, 0, 1, 0.6862745, 1,
-0.14803, -0.4163402, -3.064265, 0, 1, 0.6941177, 1,
-0.146441, 2.406097, -0.09870333, 0, 1, 0.7019608, 1,
-0.1461941, 1.452687, -0.6712627, 0, 1, 0.7058824, 1,
-0.1455172, 1.396956, -2.189749, 0, 1, 0.7137255, 1,
-0.1416377, -0.3112978, -2.652237, 0, 1, 0.7176471, 1,
-0.1346622, 0.0973512, -2.077621, 0, 1, 0.7254902, 1,
-0.1339826, -0.09622898, -2.211792, 0, 1, 0.7294118, 1,
-0.1306823, 1.423655, 0.4317099, 0, 1, 0.7372549, 1,
-0.1305856, -1.071218, -3.870308, 0, 1, 0.7411765, 1,
-0.1267575, 0.284294, -1.817497, 0, 1, 0.7490196, 1,
-0.1241563, 0.1491069, -0.6542647, 0, 1, 0.7529412, 1,
-0.1237876, 0.5921602, -0.2342145, 0, 1, 0.7607843, 1,
-0.1218484, 1.006676, 1.236355, 0, 1, 0.7647059, 1,
-0.1211292, -1.501764, -2.334589, 0, 1, 0.772549, 1,
-0.1203873, 0.6556171, -0.02489134, 0, 1, 0.7764706, 1,
-0.1159008, -0.4285909, -2.280835, 0, 1, 0.7843137, 1,
-0.1148858, 0.5880896, -0.8340567, 0, 1, 0.7882353, 1,
-0.1132686, -0.4219348, -4.609548, 0, 1, 0.7960784, 1,
-0.1132192, -0.4492573, -3.011589, 0, 1, 0.8039216, 1,
-0.107239, -3.189267, -3.049581, 0, 1, 0.8078431, 1,
-0.1051068, 0.2842122, 0.3225157, 0, 1, 0.8156863, 1,
-0.1029117, -0.5245882, -4.098599, 0, 1, 0.8196079, 1,
-0.1022547, -0.4249688, -2.262679, 0, 1, 0.827451, 1,
-0.09253192, 0.6245685, -0.04396421, 0, 1, 0.8313726, 1,
-0.08978513, 0.6208714, 0.1112824, 0, 1, 0.8392157, 1,
-0.089127, -0.7198492, -3.450073, 0, 1, 0.8431373, 1,
-0.08781968, -0.2422646, -2.534683, 0, 1, 0.8509804, 1,
-0.0841598, -0.3821377, -4.355667, 0, 1, 0.854902, 1,
-0.08227593, 0.3113048, -0.5301642, 0, 1, 0.8627451, 1,
-0.08215484, -0.09358293, -3.082337, 0, 1, 0.8666667, 1,
-0.08148895, 0.09419941, -1.967111, 0, 1, 0.8745098, 1,
-0.0786365, 0.4764345, 0.3141356, 0, 1, 0.8784314, 1,
-0.07684972, 1.147127, 0.8848144, 0, 1, 0.8862745, 1,
-0.07635979, -0.7973225, -3.111527, 0, 1, 0.8901961, 1,
-0.073407, 0.1341087, 2.183627, 0, 1, 0.8980392, 1,
-0.07101396, 0.1614605, -1.731874, 0, 1, 0.9058824, 1,
-0.07030241, 0.475665, -0.08560947, 0, 1, 0.9098039, 1,
-0.0673987, -2.172865, -2.328706, 0, 1, 0.9176471, 1,
-0.06600524, -0.4847647, -1.650526, 0, 1, 0.9215686, 1,
-0.0656289, 0.5066584, -1.526423, 0, 1, 0.9294118, 1,
-0.06203536, -1.7476, -3.583772, 0, 1, 0.9333333, 1,
-0.05676739, -0.008436634, -2.900907, 0, 1, 0.9411765, 1,
-0.05663817, 0.2457694, 0.8803973, 0, 1, 0.945098, 1,
-0.05147945, 0.5098399, 0.4426194, 0, 1, 0.9529412, 1,
-0.05091663, -0.7714101, -2.95916, 0, 1, 0.9568627, 1,
-0.04702693, -0.7867329, -4.390025, 0, 1, 0.9647059, 1,
-0.04555207, -1.130105, -4.389749, 0, 1, 0.9686275, 1,
-0.04318833, -0.05220603, -2.88393, 0, 1, 0.9764706, 1,
-0.04263652, -0.3509341, -2.790138, 0, 1, 0.9803922, 1,
-0.03903064, 1.582917, -0.5653363, 0, 1, 0.9882353, 1,
-0.03191881, -0.6566154, -2.660675, 0, 1, 0.9921569, 1,
-0.03128176, -0.7466213, -1.891652, 0, 1, 1, 1,
-0.02913592, 0.2234416, 1.363249, 0, 0.9921569, 1, 1,
-0.01873751, 0.6724585, 1.802912, 0, 0.9882353, 1, 1,
-0.01447712, 0.6847082, -0.3022575, 0, 0.9803922, 1, 1,
-0.01384284, -0.3695585, -3.1378, 0, 0.9764706, 1, 1,
-0.01296834, 1.091797, -1.126057, 0, 0.9686275, 1, 1,
-0.01254585, 1.363724, -0.08164585, 0, 0.9647059, 1, 1,
-0.007743406, 0.7599701, -1.044377, 0, 0.9568627, 1, 1,
-0.004767308, -0.5921661, -3.974005, 0, 0.9529412, 1, 1,
0.004795434, 0.01349083, -2.919401, 0, 0.945098, 1, 1,
0.008080205, -1.868995, 1.438272, 0, 0.9411765, 1, 1,
0.008344241, 0.4413369, 0.1938693, 0, 0.9333333, 1, 1,
0.01071758, 0.7207504, -0.9117113, 0, 0.9294118, 1, 1,
0.01434295, 1.327686, 1.170504, 0, 0.9215686, 1, 1,
0.01625337, -0.1925616, 2.935422, 0, 0.9176471, 1, 1,
0.02456197, -0.411928, 2.319833, 0, 0.9098039, 1, 1,
0.02617721, 1.898425, 0.931955, 0, 0.9058824, 1, 1,
0.03106997, 0.5641157, 2.183986, 0, 0.8980392, 1, 1,
0.03119361, -1.600358, 1.903439, 0, 0.8901961, 1, 1,
0.03170828, 2.009386, -1.426785, 0, 0.8862745, 1, 1,
0.03317984, 0.7017, 0.3159659, 0, 0.8784314, 1, 1,
0.03734667, -1.386277, 3.232988, 0, 0.8745098, 1, 1,
0.03911473, -2.895089, 3.59768, 0, 0.8666667, 1, 1,
0.04037272, -1.846189, 4.396232, 0, 0.8627451, 1, 1,
0.04101833, -0.5803622, 2.585699, 0, 0.854902, 1, 1,
0.04175861, -1.035137, 3.775836, 0, 0.8509804, 1, 1,
0.04513336, 1.467036, 0.6490774, 0, 0.8431373, 1, 1,
0.04621405, 0.07766814, 1.371722, 0, 0.8392157, 1, 1,
0.0493964, -0.4908654, 2.876267, 0, 0.8313726, 1, 1,
0.04986774, -2.385742, 2.795846, 0, 0.827451, 1, 1,
0.05102855, -0.01483886, 0.8565637, 0, 0.8196079, 1, 1,
0.05240704, -1.947256, 4.280789, 0, 0.8156863, 1, 1,
0.05403219, -0.3898169, 2.47132, 0, 0.8078431, 1, 1,
0.05882993, -0.528769, 2.290552, 0, 0.8039216, 1, 1,
0.05906551, 0.7415981, -0.3234705, 0, 0.7960784, 1, 1,
0.06003452, -0.1614785, 1.462185, 0, 0.7882353, 1, 1,
0.06985008, -1.17632, 4.393528, 0, 0.7843137, 1, 1,
0.07060407, 1.404776, -0.6845095, 0, 0.7764706, 1, 1,
0.07085035, -0.4266113, 2.954152, 0, 0.772549, 1, 1,
0.07615347, -0.3354758, 3.879864, 0, 0.7647059, 1, 1,
0.0762152, 0.4014865, 2.553048, 0, 0.7607843, 1, 1,
0.07744701, 0.3797979, -0.570258, 0, 0.7529412, 1, 1,
0.08065998, 1.255345, 0.6096729, 0, 0.7490196, 1, 1,
0.0825825, 0.6831583, 0.124367, 0, 0.7411765, 1, 1,
0.08465856, -0.02970515, 1.873342, 0, 0.7372549, 1, 1,
0.08518621, -1.514912, 2.900348, 0, 0.7294118, 1, 1,
0.08623607, -0.4241806, 3.088442, 0, 0.7254902, 1, 1,
0.08687282, 1.376115, -1.137417, 0, 0.7176471, 1, 1,
0.08773994, -0.05385744, 3.822028, 0, 0.7137255, 1, 1,
0.08975613, 1.862952, 0.5109659, 0, 0.7058824, 1, 1,
0.09139632, -1.359726, 3.677883, 0, 0.6980392, 1, 1,
0.09337988, -0.5084556, 2.984253, 0, 0.6941177, 1, 1,
0.09465218, -1.558195, 3.612184, 0, 0.6862745, 1, 1,
0.1001921, -0.3504148, 2.797871, 0, 0.682353, 1, 1,
0.1100332, -1.165609, 2.297367, 0, 0.6745098, 1, 1,
0.110185, 1.390648, 0.5050811, 0, 0.6705883, 1, 1,
0.11085, -0.1477671, 2.912832, 0, 0.6627451, 1, 1,
0.1118619, -0.5709318, 2.279395, 0, 0.6588235, 1, 1,
0.117516, 1.527238, 0.1808443, 0, 0.6509804, 1, 1,
0.1213766, 0.2482413, 2.806044, 0, 0.6470588, 1, 1,
0.1262514, -0.285408, 1.286888, 0, 0.6392157, 1, 1,
0.1280308, 0.2703343, 0.2351214, 0, 0.6352941, 1, 1,
0.1296346, -0.8615775, 3.366648, 0, 0.627451, 1, 1,
0.1333127, 0.5041689, 0.5223086, 0, 0.6235294, 1, 1,
0.133365, -0.3555478, 3.413383, 0, 0.6156863, 1, 1,
0.1362991, 0.07480115, 2.323174, 0, 0.6117647, 1, 1,
0.1401563, -1.613784, 3.516925, 0, 0.6039216, 1, 1,
0.1437285, 0.0552543, -0.2008115, 0, 0.5960785, 1, 1,
0.1439058, 0.5747748, -0.8724151, 0, 0.5921569, 1, 1,
0.1458849, -0.7211242, 3.024242, 0, 0.5843138, 1, 1,
0.1461463, 0.02155992, 2.45695, 0, 0.5803922, 1, 1,
0.1500953, 0.3763409, 0.2331119, 0, 0.572549, 1, 1,
0.1605093, 0.1978037, 1.176429, 0, 0.5686275, 1, 1,
0.1635866, -0.270412, 2.668596, 0, 0.5607843, 1, 1,
0.1697626, 0.6867685, 0.6357211, 0, 0.5568628, 1, 1,
0.1701456, -1.343179, 5.885133, 0, 0.5490196, 1, 1,
0.1706261, -1.838241, 4.404268, 0, 0.5450981, 1, 1,
0.1747284, 0.8948364, 2.245735, 0, 0.5372549, 1, 1,
0.1769207, -1.640366, 2.691537, 0, 0.5333334, 1, 1,
0.1811235, 1.622686, 0.3253115, 0, 0.5254902, 1, 1,
0.1854181, -0.2868144, 2.93593, 0, 0.5215687, 1, 1,
0.1947412, 1.460155, -0.3434096, 0, 0.5137255, 1, 1,
0.1972696, 0.0295283, 1.243537, 0, 0.509804, 1, 1,
0.2005113, -0.8919947, 1.570902, 0, 0.5019608, 1, 1,
0.2024395, 0.4493378, 0.01270521, 0, 0.4941176, 1, 1,
0.2078728, -1.139367, 3.575334, 0, 0.4901961, 1, 1,
0.2095618, 2.046032, -0.9240286, 0, 0.4823529, 1, 1,
0.2131485, -0.5811381, 2.262478, 0, 0.4784314, 1, 1,
0.2187441, 0.2238, 2.411852, 0, 0.4705882, 1, 1,
0.2226497, 2.103216, -1.895755, 0, 0.4666667, 1, 1,
0.2242315, -1.352855, 2.068573, 0, 0.4588235, 1, 1,
0.2269089, -0.9895447, 2.794167, 0, 0.454902, 1, 1,
0.2273063, -0.306031, 2.010846, 0, 0.4470588, 1, 1,
0.2278855, 1.429968, -0.908212, 0, 0.4431373, 1, 1,
0.2338666, 1.4899, 0.3562018, 0, 0.4352941, 1, 1,
0.2356997, -0.1980071, 0.9387658, 0, 0.4313726, 1, 1,
0.2407946, 1.083227, -0.1079807, 0, 0.4235294, 1, 1,
0.2428178, 0.8286405, 0.1494596, 0, 0.4196078, 1, 1,
0.2430751, -0.5823215, 1.666526, 0, 0.4117647, 1, 1,
0.2434534, -0.5216699, 3.377117, 0, 0.4078431, 1, 1,
0.2443496, 1.063579, -0.3354163, 0, 0.4, 1, 1,
0.2453327, -1.237227, 2.80329, 0, 0.3921569, 1, 1,
0.2460306, -1.0244, 1.915862, 0, 0.3882353, 1, 1,
0.2470346, -1.606547, 2.519007, 0, 0.3803922, 1, 1,
0.2493263, -0.2596349, 5.257771, 0, 0.3764706, 1, 1,
0.2502909, 1.442956, 1.676531, 0, 0.3686275, 1, 1,
0.2563111, 0.4533098, 0.3012174, 0, 0.3647059, 1, 1,
0.2570929, 0.01552103, 1.691063, 0, 0.3568628, 1, 1,
0.2612849, -0.7330387, 1.747823, 0, 0.3529412, 1, 1,
0.2663622, -1.353096, 3.600408, 0, 0.345098, 1, 1,
0.2683155, -1.804416, 4.956887, 0, 0.3411765, 1, 1,
0.2698598, -0.7003679, 2.784727, 0, 0.3333333, 1, 1,
0.2709605, 0.04028432, 2.357522, 0, 0.3294118, 1, 1,
0.2727624, 2.502181, 0.1871082, 0, 0.3215686, 1, 1,
0.2761836, 0.06512018, 2.363612, 0, 0.3176471, 1, 1,
0.2771149, -2.161887, 2.922687, 0, 0.3098039, 1, 1,
0.2797139, -2.299897, 4.536183, 0, 0.3058824, 1, 1,
0.282407, -1.372468, 2.606009, 0, 0.2980392, 1, 1,
0.2829115, -0.3504211, 2.956408, 0, 0.2901961, 1, 1,
0.2856998, 0.2615677, 0.2344387, 0, 0.2862745, 1, 1,
0.2872327, 1.244568, -0.05544467, 0, 0.2784314, 1, 1,
0.2915748, 0.513801, -0.002985595, 0, 0.2745098, 1, 1,
0.2995091, -0.5962621, 3.250515, 0, 0.2666667, 1, 1,
0.3022529, 0.3508107, 1.579694, 0, 0.2627451, 1, 1,
0.3033589, 0.2219068, 0.319475, 0, 0.254902, 1, 1,
0.3039973, -0.06557865, 2.545805, 0, 0.2509804, 1, 1,
0.3068951, -0.8597136, 0.9024958, 0, 0.2431373, 1, 1,
0.3069219, -1.032738, 1.497547, 0, 0.2392157, 1, 1,
0.3091804, -0.3672215, 1.862644, 0, 0.2313726, 1, 1,
0.3108349, 1.594102, -0.6858218, 0, 0.227451, 1, 1,
0.3112475, 0.4503899, 1.322068, 0, 0.2196078, 1, 1,
0.3119127, -0.4961541, 2.711805, 0, 0.2156863, 1, 1,
0.3168157, -0.8114515, 4.630032, 0, 0.2078431, 1, 1,
0.3267802, -1.584697, 3.100056, 0, 0.2039216, 1, 1,
0.3281078, -0.04107796, 1.869964, 0, 0.1960784, 1, 1,
0.3296923, 0.08928626, 0.23974, 0, 0.1882353, 1, 1,
0.3297198, 0.8337618, 0.9873889, 0, 0.1843137, 1, 1,
0.3333976, 0.2433538, 1.562742, 0, 0.1764706, 1, 1,
0.3358042, -0.8109027, 2.83317, 0, 0.172549, 1, 1,
0.3377283, 0.3984154, -0.4709359, 0, 0.1647059, 1, 1,
0.3433099, -0.8297115, 1.506723, 0, 0.1607843, 1, 1,
0.3452829, -0.7799022, 2.351597, 0, 0.1529412, 1, 1,
0.3476154, 0.4300778, -0.4404297, 0, 0.1490196, 1, 1,
0.3534441, 0.3832135, 0.9185585, 0, 0.1411765, 1, 1,
0.3586604, 0.02346887, 1.767943, 0, 0.1372549, 1, 1,
0.3682738, 0.7402202, -0.7745071, 0, 0.1294118, 1, 1,
0.3688889, 1.48791, 0.8439897, 0, 0.1254902, 1, 1,
0.3702775, -1.502606, 3.352022, 0, 0.1176471, 1, 1,
0.3722571, 1.3668, 1.186685, 0, 0.1137255, 1, 1,
0.3724737, -0.6933846, 3.328674, 0, 0.1058824, 1, 1,
0.3735612, -0.9249471, 2.975209, 0, 0.09803922, 1, 1,
0.375549, -0.9944136, 2.006973, 0, 0.09411765, 1, 1,
0.3868682, -0.7943586, 1.341571, 0, 0.08627451, 1, 1,
0.3910336, -2.400511, 3.487005, 0, 0.08235294, 1, 1,
0.3963429, 0.8261276, 2.00631, 0, 0.07450981, 1, 1,
0.3986309, 1.07088, 2.518952, 0, 0.07058824, 1, 1,
0.4073979, 0.8319931, -0.4874091, 0, 0.0627451, 1, 1,
0.4101483, -1.367738, 3.514437, 0, 0.05882353, 1, 1,
0.4184954, -0.3186981, 1.100122, 0, 0.05098039, 1, 1,
0.4197311, 0.289003, 0.6207727, 0, 0.04705882, 1, 1,
0.4277454, -0.448727, 1.882475, 0, 0.03921569, 1, 1,
0.4278993, 1.140782, 0.9634136, 0, 0.03529412, 1, 1,
0.4328588, -0.6714469, 2.577206, 0, 0.02745098, 1, 1,
0.4375027, -0.4281531, 1.803666, 0, 0.02352941, 1, 1,
0.4406036, -1.870125, 0.7717683, 0, 0.01568628, 1, 1,
0.4421106, 0.2599152, 0.4727548, 0, 0.01176471, 1, 1,
0.4424575, -0.8594281, 2.980721, 0, 0.003921569, 1, 1,
0.4534276, -1.976526, 3.51624, 0.003921569, 0, 1, 1,
0.4620699, -1.71441, 3.036206, 0.007843138, 0, 1, 1,
0.4631328, 0.4319889, 1.774921, 0.01568628, 0, 1, 1,
0.4633077, 0.1634943, 3.144508, 0.01960784, 0, 1, 1,
0.4662285, 0.3176257, 0.9213766, 0.02745098, 0, 1, 1,
0.4688107, 0.2700181, -1.140454, 0.03137255, 0, 1, 1,
0.4690934, -0.3052413, 1.639298, 0.03921569, 0, 1, 1,
0.4755466, -1.123215, 2.488252, 0.04313726, 0, 1, 1,
0.4793849, 0.81972, 1.039832, 0.05098039, 0, 1, 1,
0.4845724, 0.8515898, -0.09004214, 0.05490196, 0, 1, 1,
0.491988, -0.562997, 3.433167, 0.0627451, 0, 1, 1,
0.4921743, 0.2234942, -1.119653, 0.06666667, 0, 1, 1,
0.4981298, 0.2900806, -0.5063471, 0.07450981, 0, 1, 1,
0.5033328, -0.6380659, 2.737013, 0.07843138, 0, 1, 1,
0.5050688, 0.5484049, 1.404002, 0.08627451, 0, 1, 1,
0.5059699, -0.08088233, 2.644044, 0.09019608, 0, 1, 1,
0.5077064, -0.8020448, 0.4610693, 0.09803922, 0, 1, 1,
0.5173313, 0.1970376, 1.666226, 0.1058824, 0, 1, 1,
0.5224161, -1.475933, 2.965355, 0.1098039, 0, 1, 1,
0.522919, -1.533071, 3.300293, 0.1176471, 0, 1, 1,
0.5338591, 0.3097679, 1.905515, 0.1215686, 0, 1, 1,
0.5384704, 1.168276, 1.644847, 0.1294118, 0, 1, 1,
0.5385765, 0.4611985, 0.2673131, 0.1333333, 0, 1, 1,
0.5411843, -0.9647265, 1.288721, 0.1411765, 0, 1, 1,
0.5412676, 0.4829645, 1.360228, 0.145098, 0, 1, 1,
0.5419554, -0.5711503, 1.347004, 0.1529412, 0, 1, 1,
0.5495561, -0.9756085, 3.313716, 0.1568628, 0, 1, 1,
0.5506318, 0.7465239, 0.7415994, 0.1647059, 0, 1, 1,
0.5540109, -0.6148365, 3.544392, 0.1686275, 0, 1, 1,
0.55783, -0.605676, 2.2881, 0.1764706, 0, 1, 1,
0.558753, -1.335952, 2.135192, 0.1803922, 0, 1, 1,
0.559477, 0.456425, 0.2800967, 0.1882353, 0, 1, 1,
0.5636709, 0.7177952, 0.5816229, 0.1921569, 0, 1, 1,
0.5646867, -2.549717, 2.881981, 0.2, 0, 1, 1,
0.572193, 0.1726474, -0.09810988, 0.2078431, 0, 1, 1,
0.5750888, 0.6687466, 0.7413802, 0.2117647, 0, 1, 1,
0.5810845, -0.2544296, 1.3107, 0.2196078, 0, 1, 1,
0.5827987, -1.806666, 2.512715, 0.2235294, 0, 1, 1,
0.5876293, 2.12141, 2.364472, 0.2313726, 0, 1, 1,
0.5881712, -0.2510188, 1.974099, 0.2352941, 0, 1, 1,
0.5900087, -0.7907495, 1.544024, 0.2431373, 0, 1, 1,
0.5928012, -0.3434436, 0.9211631, 0.2470588, 0, 1, 1,
0.5982159, -1.076887, 2.310167, 0.254902, 0, 1, 1,
0.600069, 0.538965, 0.826758, 0.2588235, 0, 1, 1,
0.6119245, -0.4256626, 2.328526, 0.2666667, 0, 1, 1,
0.6119632, 1.592947, 0.7733986, 0.2705882, 0, 1, 1,
0.6178847, 1.14812, 0.1509001, 0.2784314, 0, 1, 1,
0.6210335, 0.325411, 1.049806, 0.282353, 0, 1, 1,
0.6254956, -0.1760103, 1.723861, 0.2901961, 0, 1, 1,
0.6268406, -0.8333901, 2.722066, 0.2941177, 0, 1, 1,
0.6344452, -0.423212, 2.162526, 0.3019608, 0, 1, 1,
0.6361511, -0.8593601, 4.824928, 0.3098039, 0, 1, 1,
0.6366847, -0.1134702, 1.040609, 0.3137255, 0, 1, 1,
0.6379191, -0.7416092, 2.475218, 0.3215686, 0, 1, 1,
0.6404814, -1.322611, 3.493892, 0.3254902, 0, 1, 1,
0.6436971, 0.5435485, 3.465914, 0.3333333, 0, 1, 1,
0.6479408, 1.44752, -0.9614755, 0.3372549, 0, 1, 1,
0.6485939, -0.3908066, 2.261283, 0.345098, 0, 1, 1,
0.6488813, 2.382112, 0.4205302, 0.3490196, 0, 1, 1,
0.6531322, 1.01658, 0.7138323, 0.3568628, 0, 1, 1,
0.6565638, -0.9886145, 4.259574, 0.3607843, 0, 1, 1,
0.6654033, 0.6710824, -0.5492352, 0.3686275, 0, 1, 1,
0.6676997, 0.138302, 0.5187152, 0.372549, 0, 1, 1,
0.6691923, -0.8941829, 3.161101, 0.3803922, 0, 1, 1,
0.6699171, -0.3164176, 2.605415, 0.3843137, 0, 1, 1,
0.6742985, -0.4708769, 1.261861, 0.3921569, 0, 1, 1,
0.675705, 0.829244, 0.1629497, 0.3960784, 0, 1, 1,
0.6784681, -0.2938251, 3.724054, 0.4039216, 0, 1, 1,
0.6792691, -0.02222927, 3.252713, 0.4117647, 0, 1, 1,
0.6797766, 0.383797, 1.424908, 0.4156863, 0, 1, 1,
0.6817542, 1.063595, 0.341475, 0.4235294, 0, 1, 1,
0.6825376, 0.540609, 1.201735, 0.427451, 0, 1, 1,
0.6882151, 1.260306, 1.662229, 0.4352941, 0, 1, 1,
0.6910673, 0.7038413, 0.6618703, 0.4392157, 0, 1, 1,
0.691081, 0.4075834, 1.653611, 0.4470588, 0, 1, 1,
0.7003767, -1.432824, 3.016235, 0.4509804, 0, 1, 1,
0.7028354, -0.1037999, 1.764999, 0.4588235, 0, 1, 1,
0.7072873, -1.125039, 1.262223, 0.4627451, 0, 1, 1,
0.7086859, -0.6856707, 2.576229, 0.4705882, 0, 1, 1,
0.7104275, 0.5261287, 1.10052, 0.4745098, 0, 1, 1,
0.711966, 1.389471, 1.990928, 0.4823529, 0, 1, 1,
0.7139571, 0.2335242, 0.8490875, 0.4862745, 0, 1, 1,
0.7153348, -1.01032, 2.352439, 0.4941176, 0, 1, 1,
0.7170798, 0.706587, 2.33614, 0.5019608, 0, 1, 1,
0.7204205, 0.5912744, 2.869124, 0.5058824, 0, 1, 1,
0.7248126, -0.1191583, -0.1553616, 0.5137255, 0, 1, 1,
0.7251378, 0.6597053, 2.297523, 0.5176471, 0, 1, 1,
0.72614, -0.1196367, 1.418322, 0.5254902, 0, 1, 1,
0.7262802, -0.6209934, 1.697528, 0.5294118, 0, 1, 1,
0.7292956, 1.077478, 0.25223, 0.5372549, 0, 1, 1,
0.7323125, -0.4056343, 1.70222, 0.5411765, 0, 1, 1,
0.7366918, 0.1215262, 2.342914, 0.5490196, 0, 1, 1,
0.7442822, 0.7436651, -0.02596672, 0.5529412, 0, 1, 1,
0.7479269, 0.3243214, 1.105134, 0.5607843, 0, 1, 1,
0.7486529, 1.21439, -0.1414097, 0.5647059, 0, 1, 1,
0.7526816, -1.39636, 3.416019, 0.572549, 0, 1, 1,
0.7538091, -0.6427271, 3.243767, 0.5764706, 0, 1, 1,
0.7649601, 0.2526495, 0.4193237, 0.5843138, 0, 1, 1,
0.7658355, -0.3292272, 0.0304285, 0.5882353, 0, 1, 1,
0.7660033, 0.7582001, 0.3687583, 0.5960785, 0, 1, 1,
0.7702326, -1.964262, 2.463297, 0.6039216, 0, 1, 1,
0.7805296, -0.007129542, 3.279855, 0.6078432, 0, 1, 1,
0.7826685, -2.112006, 2.957418, 0.6156863, 0, 1, 1,
0.7854788, 0.9078867, 1.931705, 0.6196079, 0, 1, 1,
0.7905377, -1.467133, 1.194587, 0.627451, 0, 1, 1,
0.7967603, 0.7653303, 0.06003641, 0.6313726, 0, 1, 1,
0.7998919, 2.097831, -0.428738, 0.6392157, 0, 1, 1,
0.8036326, 0.1693083, 3.328898, 0.6431373, 0, 1, 1,
0.8051057, -2.808012, 2.886418, 0.6509804, 0, 1, 1,
0.8090039, 1.349624, 0.110031, 0.654902, 0, 1, 1,
0.8156207, -1.391237, 1.413955, 0.6627451, 0, 1, 1,
0.8306365, 0.2181555, 0.7895815, 0.6666667, 0, 1, 1,
0.83333, 0.06113826, 0.3021791, 0.6745098, 0, 1, 1,
0.8342028, 0.4682035, 0.8480925, 0.6784314, 0, 1, 1,
0.8399012, 0.7490362, 0.6356682, 0.6862745, 0, 1, 1,
0.8549374, -0.9430903, 2.12543, 0.6901961, 0, 1, 1,
0.8709907, -1.670069, 2.471632, 0.6980392, 0, 1, 1,
0.8716606, 0.8601328, 1.650915, 0.7058824, 0, 1, 1,
0.8762671, 1.204522, 0.872025, 0.7098039, 0, 1, 1,
0.877251, 0.9085311, 1.914922, 0.7176471, 0, 1, 1,
0.8800341, -0.4685242, 1.83327, 0.7215686, 0, 1, 1,
0.8805894, -0.5667787, 1.195734, 0.7294118, 0, 1, 1,
0.8889356, -0.2859183, 1.945813, 0.7333333, 0, 1, 1,
0.892184, 1.352193, 0.6985609, 0.7411765, 0, 1, 1,
0.8983858, -0.09594859, 2.589506, 0.7450981, 0, 1, 1,
0.8995759, 1.765316, -0.7315375, 0.7529412, 0, 1, 1,
0.903221, 0.3797216, 1.725058, 0.7568628, 0, 1, 1,
0.9048303, 0.145866, 1.519906, 0.7647059, 0, 1, 1,
0.9109034, -1.169342, 2.422323, 0.7686275, 0, 1, 1,
0.9110879, 2.064271, 0.3807583, 0.7764706, 0, 1, 1,
0.9176798, -1.267671, 2.442446, 0.7803922, 0, 1, 1,
0.9190413, -1.682679, 1.476919, 0.7882353, 0, 1, 1,
0.9355288, 1.186321, 0.794852, 0.7921569, 0, 1, 1,
0.9364359, -0.57881, 2.243658, 0.8, 0, 1, 1,
0.940908, -1.171382, 3.290159, 0.8078431, 0, 1, 1,
0.9411753, 1.652025, 1.330499, 0.8117647, 0, 1, 1,
0.9432763, -0.6072183, 3.882101, 0.8196079, 0, 1, 1,
0.9492888, -1.32538, 4.41738, 0.8235294, 0, 1, 1,
0.9535285, -0.537939, 1.770425, 0.8313726, 0, 1, 1,
0.9600499, -0.7486985, 2.810867, 0.8352941, 0, 1, 1,
0.9607493, 1.242513, 0.5501032, 0.8431373, 0, 1, 1,
0.9670816, -1.034636, 1.524391, 0.8470588, 0, 1, 1,
0.9680132, -0.09939383, 1.377507, 0.854902, 0, 1, 1,
0.9725736, -3.382462, 2.86934, 0.8588235, 0, 1, 1,
0.9727859, -0.3531619, 3.116583, 0.8666667, 0, 1, 1,
0.9745876, -0.2942929, 1.147695, 0.8705882, 0, 1, 1,
0.9764957, -2.047603, 3.853596, 0.8784314, 0, 1, 1,
0.9776805, -0.2618711, 2.919298, 0.8823529, 0, 1, 1,
0.9776838, -1.044175, 1.240513, 0.8901961, 0, 1, 1,
0.979535, 1.924133, -0.1518269, 0.8941177, 0, 1, 1,
0.9816236, 1.414513, 0.4660732, 0.9019608, 0, 1, 1,
0.9868121, -0.4248654, 3.219136, 0.9098039, 0, 1, 1,
0.9878343, -1.706582, 0.4374872, 0.9137255, 0, 1, 1,
0.9888992, -0.4267336, 1.791861, 0.9215686, 0, 1, 1,
0.9995273, -0.09961286, 1.120752, 0.9254902, 0, 1, 1,
1.000176, 0.3170567, 2.218536, 0.9333333, 0, 1, 1,
1.000322, 0.6815076, 3.357309, 0.9372549, 0, 1, 1,
1.00098, -0.5113525, 2.671505, 0.945098, 0, 1, 1,
1.003733, -0.791117, 3.802833, 0.9490196, 0, 1, 1,
1.004, 0.1493059, 1.517803, 0.9568627, 0, 1, 1,
1.006836, -1.144067, 2.631744, 0.9607843, 0, 1, 1,
1.006993, 0.4579097, 1.65624, 0.9686275, 0, 1, 1,
1.007904, -0.6393282, 2.553752, 0.972549, 0, 1, 1,
1.011897, -0.806232, 2.198098, 0.9803922, 0, 1, 1,
1.012774, 1.455638, 2.452006, 0.9843137, 0, 1, 1,
1.016905, 0.1347332, 1.78351, 0.9921569, 0, 1, 1,
1.018188, -1.347489, 0.8102489, 0.9960784, 0, 1, 1,
1.022118, 0.1629181, 2.156268, 1, 0, 0.9960784, 1,
1.047258, -0.3911601, 0.9075102, 1, 0, 0.9882353, 1,
1.051609, 0.7083129, 0.6267672, 1, 0, 0.9843137, 1,
1.057844, -0.5273281, 1.780512, 1, 0, 0.9764706, 1,
1.064666, -0.3094665, 4.215744, 1, 0, 0.972549, 1,
1.067613, -0.2939663, 2.559057, 1, 0, 0.9647059, 1,
1.070121, -0.08467841, 1.119275, 1, 0, 0.9607843, 1,
1.074198, 0.2458787, 1.629682, 1, 0, 0.9529412, 1,
1.083015, 0.4078064, 1.175618, 1, 0, 0.9490196, 1,
1.09848, 2.099273, 1.051908, 1, 0, 0.9411765, 1,
1.103447, 0.426904, 1.32652, 1, 0, 0.9372549, 1,
1.10668, 1.04589, 1.039835, 1, 0, 0.9294118, 1,
1.108442, -1.702015, 3.694538, 1, 0, 0.9254902, 1,
1.113683, 2.245162, -0.7755681, 1, 0, 0.9176471, 1,
1.115818, 0.04138487, 0.8562824, 1, 0, 0.9137255, 1,
1.119162, -0.5301967, 0.5568931, 1, 0, 0.9058824, 1,
1.120466, -1.968721, 2.972021, 1, 0, 0.9019608, 1,
1.122761, 0.4753516, 0.9396457, 1, 0, 0.8941177, 1,
1.129607, 0.8945625, 0.5600108, 1, 0, 0.8862745, 1,
1.132226, -0.5259027, 3.282998, 1, 0, 0.8823529, 1,
1.134327, 0.7529639, 1.079764, 1, 0, 0.8745098, 1,
1.135387, -1.171897, 2.224961, 1, 0, 0.8705882, 1,
1.135388, 1.050385, 0.7995304, 1, 0, 0.8627451, 1,
1.135735, -1.115455, 1.156129, 1, 0, 0.8588235, 1,
1.136873, 0.006990901, 2.17018, 1, 0, 0.8509804, 1,
1.1498, 0.8835867, -0.6428596, 1, 0, 0.8470588, 1,
1.150807, 0.3475761, 3.622227, 1, 0, 0.8392157, 1,
1.151339, 0.07162081, 1.238809, 1, 0, 0.8352941, 1,
1.152899, -0.4583831, 1.904382, 1, 0, 0.827451, 1,
1.164233, 1.157566, 1.58156, 1, 0, 0.8235294, 1,
1.164769, -0.5954407, 2.612096, 1, 0, 0.8156863, 1,
1.168107, -0.5440435, 2.157119, 1, 0, 0.8117647, 1,
1.171704, 0.5899432, 0.9241351, 1, 0, 0.8039216, 1,
1.175653, -0.937669, 1.245012, 1, 0, 0.7960784, 1,
1.177224, 1.849334, -0.2975015, 1, 0, 0.7921569, 1,
1.177676, -0.2865053, 3.006967, 1, 0, 0.7843137, 1,
1.186538, -0.4131017, 2.203606, 1, 0, 0.7803922, 1,
1.199762, -0.8649653, 1.526352, 1, 0, 0.772549, 1,
1.20613, 1.330762, 0.7725534, 1, 0, 0.7686275, 1,
1.215036, -1.770769, 3.830974, 1, 0, 0.7607843, 1,
1.215231, 0.3188325, 2.147105, 1, 0, 0.7568628, 1,
1.215409, -0.1089709, 0.1495563, 1, 0, 0.7490196, 1,
1.217499, 0.9165425, 2.180177, 1, 0, 0.7450981, 1,
1.21893, 1.043751, -0.2433395, 1, 0, 0.7372549, 1,
1.22101, 0.2569955, 2.311888, 1, 0, 0.7333333, 1,
1.222847, 0.3033974, 0.9918193, 1, 0, 0.7254902, 1,
1.224866, 0.6479918, 0.1788741, 1, 0, 0.7215686, 1,
1.230101, -0.5640757, 1.080593, 1, 0, 0.7137255, 1,
1.231328, 2.307529, 1.385774, 1, 0, 0.7098039, 1,
1.23871, 0.4592769, 3.403642, 1, 0, 0.7019608, 1,
1.241878, 1.984189, 0.9178241, 1, 0, 0.6941177, 1,
1.242108, 0.7132427, 0.4112189, 1, 0, 0.6901961, 1,
1.242381, -0.5435283, 1.548987, 1, 0, 0.682353, 1,
1.244919, 0.2523212, 0.8336211, 1, 0, 0.6784314, 1,
1.251121, 0.7349445, 1.065062, 1, 0, 0.6705883, 1,
1.256503, 1.466833, -0.209222, 1, 0, 0.6666667, 1,
1.259781, 0.6747165, -0.401451, 1, 0, 0.6588235, 1,
1.260137, -1.486435, 2.004215, 1, 0, 0.654902, 1,
1.268582, -0.2678745, 1.318106, 1, 0, 0.6470588, 1,
1.279058, -0.5040818, 0.4687769, 1, 0, 0.6431373, 1,
1.279306, -0.3225788, 1.347383, 1, 0, 0.6352941, 1,
1.28502, -0.6169061, 1.193697, 1, 0, 0.6313726, 1,
1.292001, 0.7048085, -0.5937234, 1, 0, 0.6235294, 1,
1.294673, 0.4383669, 1.577848, 1, 0, 0.6196079, 1,
1.299568, -1.620868, 1.542793, 1, 0, 0.6117647, 1,
1.305057, 0.3765112, 0.07783418, 1, 0, 0.6078432, 1,
1.307265, 0.9179332, 1.791076, 1, 0, 0.6, 1,
1.308938, 0.06746911, 0.4779504, 1, 0, 0.5921569, 1,
1.30922, 2.30894, 0.9672159, 1, 0, 0.5882353, 1,
1.310792, -1.046617, 2.819225, 1, 0, 0.5803922, 1,
1.336688, -1.138763, 2.7989, 1, 0, 0.5764706, 1,
1.337587, -0.1268297, 0.5393988, 1, 0, 0.5686275, 1,
1.351553, 0.4272482, 1.879395, 1, 0, 0.5647059, 1,
1.359674, -0.0668138, 2.744159, 1, 0, 0.5568628, 1,
1.360818, 0.7825669, 0.8797604, 1, 0, 0.5529412, 1,
1.366272, 0.5348749, 1.367428, 1, 0, 0.5450981, 1,
1.370309, 0.4309922, 0.9671114, 1, 0, 0.5411765, 1,
1.372978, -0.3889082, 1.682398, 1, 0, 0.5333334, 1,
1.379299, -0.9546514, 5.436958, 1, 0, 0.5294118, 1,
1.383401, -1.425411, 1.562112, 1, 0, 0.5215687, 1,
1.3869, 0.1839444, -0.1667518, 1, 0, 0.5176471, 1,
1.387182, -0.400056, 1.866866, 1, 0, 0.509804, 1,
1.389068, -0.1968122, 2.646538, 1, 0, 0.5058824, 1,
1.390202, 0.363782, 1.485946, 1, 0, 0.4980392, 1,
1.395627, 0.6845633, 1.94105, 1, 0, 0.4901961, 1,
1.40125, -1.647879, 1.603157, 1, 0, 0.4862745, 1,
1.407859, 0.384023, -1.371428, 1, 0, 0.4784314, 1,
1.421372, 1.310272, 1.152682, 1, 0, 0.4745098, 1,
1.422657, -1.111646, 1.381345, 1, 0, 0.4666667, 1,
1.429596, 0.2092759, 2.421582, 1, 0, 0.4627451, 1,
1.431514, 0.9856361, 0.84844, 1, 0, 0.454902, 1,
1.437036, -1.475133, 2.212882, 1, 0, 0.4509804, 1,
1.437715, -0.5271807, 2.225267, 1, 0, 0.4431373, 1,
1.441223, 0.5682039, 1.664806, 1, 0, 0.4392157, 1,
1.450671, -0.9278592, 0.009108019, 1, 0, 0.4313726, 1,
1.469084, 0.7587851, 0.9665194, 1, 0, 0.427451, 1,
1.482812, -1.260839, 2.696707, 1, 0, 0.4196078, 1,
1.485484, 0.9276302, 1.824951, 1, 0, 0.4156863, 1,
1.487694, -0.4101179, 1.171116, 1, 0, 0.4078431, 1,
1.490947, 0.9775547, 1.98621, 1, 0, 0.4039216, 1,
1.510948, 0.2264731, 0.7108828, 1, 0, 0.3960784, 1,
1.525275, 1.613284, 0.5559217, 1, 0, 0.3882353, 1,
1.528501, 0.08210844, 1.589706, 1, 0, 0.3843137, 1,
1.53834, 0.4176699, 1.891851, 1, 0, 0.3764706, 1,
1.53982, 0.3119845, 1.469007, 1, 0, 0.372549, 1,
1.54952, 0.7261063, 0.9466482, 1, 0, 0.3647059, 1,
1.568562, -0.5656239, 2.040112, 1, 0, 0.3607843, 1,
1.568925, 1.425974, 1.067405, 1, 0, 0.3529412, 1,
1.569746, 0.7672853, 2.667274, 1, 0, 0.3490196, 1,
1.570847, 1.881044, 0.4331947, 1, 0, 0.3411765, 1,
1.576606, 0.1101137, -0.8495933, 1, 0, 0.3372549, 1,
1.582109, -0.0639695, 2.053038, 1, 0, 0.3294118, 1,
1.58541, -0.4154333, 2.718591, 1, 0, 0.3254902, 1,
1.59524, 0.5984808, 0.1737304, 1, 0, 0.3176471, 1,
1.597759, -0.5306249, 3.476588, 1, 0, 0.3137255, 1,
1.611113, 0.8245444, -0.08641789, 1, 0, 0.3058824, 1,
1.626298, -0.2261243, 1.411331, 1, 0, 0.2980392, 1,
1.628771, -1.85415, 3.561388, 1, 0, 0.2941177, 1,
1.64792, 0.01121704, 1.395125, 1, 0, 0.2862745, 1,
1.649112, 0.4988455, 1.321106, 1, 0, 0.282353, 1,
1.658597, 1.255266, 1.555755, 1, 0, 0.2745098, 1,
1.659466, -1.138677, 0.6590183, 1, 0, 0.2705882, 1,
1.662419, 0.6772698, 0.8712915, 1, 0, 0.2627451, 1,
1.674131, -0.5217465, 2.030392, 1, 0, 0.2588235, 1,
1.674424, -0.548165, 1.003427, 1, 0, 0.2509804, 1,
1.689917, -1.276929, 2.379764, 1, 0, 0.2470588, 1,
1.692846, 1.595469, 0.4149283, 1, 0, 0.2392157, 1,
1.696557, -2.070368, 2.557263, 1, 0, 0.2352941, 1,
1.752415, 0.7257046, 2.266911, 1, 0, 0.227451, 1,
1.782204, 0.1966607, 3.345521, 1, 0, 0.2235294, 1,
1.833803, 2.325871, 1.089826, 1, 0, 0.2156863, 1,
1.864294, 1.263321, 1.637984, 1, 0, 0.2117647, 1,
1.874005, -0.0709738, 2.215786, 1, 0, 0.2039216, 1,
1.882942, 0.2411392, -0.4601633, 1, 0, 0.1960784, 1,
1.933175, -0.9084929, 1.255324, 1, 0, 0.1921569, 1,
1.965085, 1.390936, 1.427681, 1, 0, 0.1843137, 1,
1.967716, 0.2487473, 1.52616, 1, 0, 0.1803922, 1,
1.968598, -0.6371093, 1.690899, 1, 0, 0.172549, 1,
1.973803, -0.3749723, 0.916208, 1, 0, 0.1686275, 1,
1.97595, 0.06391007, 0.7059907, 1, 0, 0.1607843, 1,
2.037986, 1.904523, 2.475857, 1, 0, 0.1568628, 1,
2.053344, -0.0834659, 0.7656428, 1, 0, 0.1490196, 1,
2.056767, -0.1084679, 2.647625, 1, 0, 0.145098, 1,
2.067563, -0.01179564, 1.284796, 1, 0, 0.1372549, 1,
2.077274, -0.5823966, 1.341341, 1, 0, 0.1333333, 1,
2.085213, 0.937005, -1.025742, 1, 0, 0.1254902, 1,
2.153085, 0.761063, -0.6224189, 1, 0, 0.1215686, 1,
2.154375, -2.723256, 2.647043, 1, 0, 0.1137255, 1,
2.16411, 1.141727, 0.375369, 1, 0, 0.1098039, 1,
2.218215, 0.3541166, 1.847069, 1, 0, 0.1019608, 1,
2.221151, -0.9608246, 1.861419, 1, 0, 0.09411765, 1,
2.230786, 0.04028544, 1.900976, 1, 0, 0.09019608, 1,
2.235199, 1.290829, 1.468655, 1, 0, 0.08235294, 1,
2.34028, -0.6200134, 2.064652, 1, 0, 0.07843138, 1,
2.401553, -0.03322409, 0.6235979, 1, 0, 0.07058824, 1,
2.417639, 0.727653, 3.068488, 1, 0, 0.06666667, 1,
2.428249, -0.104752, 1.612301, 1, 0, 0.05882353, 1,
2.431011, -0.9790898, 1.234488, 1, 0, 0.05490196, 1,
2.480607, -1.428133, 1.342147, 1, 0, 0.04705882, 1,
2.486499, -2.045957, 5.1425, 1, 0, 0.04313726, 1,
2.486918, -1.053138, 2.37919, 1, 0, 0.03529412, 1,
2.512346, 3.468801, 0.8114523, 1, 0, 0.03137255, 1,
2.541178, 1.799349, 1.242227, 1, 0, 0.02352941, 1,
2.614629, 1.300254, 0.6982322, 1, 0, 0.01960784, 1,
2.837601, -0.03476919, 1.272908, 1, 0, 0.01176471, 1,
2.845425, -0.3786463, 2.366784, 1, 0, 0.007843138, 1
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
-0.2052678, -4.543751, -6.877686, 0, -0.5, 0.5, 0.5,
-0.2052678, -4.543751, -6.877686, 1, -0.5, 0.5, 0.5,
-0.2052678, -4.543751, -6.877686, 1, 1.5, 0.5, 0.5,
-0.2052678, -4.543751, -6.877686, 0, 1.5, 0.5, 0.5
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
-4.290146, 0.04316938, -6.877686, 0, -0.5, 0.5, 0.5,
-4.290146, 0.04316938, -6.877686, 1, -0.5, 0.5, 0.5,
-4.290146, 0.04316938, -6.877686, 1, 1.5, 0.5, 0.5,
-4.290146, 0.04316938, -6.877686, 0, 1.5, 0.5, 0.5
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
-4.290146, -4.543751, 0.4286053, 0, -0.5, 0.5, 0.5,
-4.290146, -4.543751, 0.4286053, 1, -0.5, 0.5, 0.5,
-4.290146, -4.543751, 0.4286053, 1, 1.5, 0.5, 0.5,
-4.290146, -4.543751, 0.4286053, 0, 1.5, 0.5, 0.5
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
-3, -3.485231, -5.191618,
2, -3.485231, -5.191618,
-3, -3.485231, -5.191618,
-3, -3.661651, -5.47263,
-2, -3.485231, -5.191618,
-2, -3.661651, -5.47263,
-1, -3.485231, -5.191618,
-1, -3.661651, -5.47263,
0, -3.485231, -5.191618,
0, -3.661651, -5.47263,
1, -3.485231, -5.191618,
1, -3.661651, -5.47263,
2, -3.485231, -5.191618,
2, -3.661651, -5.47263
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
-3, -4.014491, -6.034652, 0, -0.5, 0.5, 0.5,
-3, -4.014491, -6.034652, 1, -0.5, 0.5, 0.5,
-3, -4.014491, -6.034652, 1, 1.5, 0.5, 0.5,
-3, -4.014491, -6.034652, 0, 1.5, 0.5, 0.5,
-2, -4.014491, -6.034652, 0, -0.5, 0.5, 0.5,
-2, -4.014491, -6.034652, 1, -0.5, 0.5, 0.5,
-2, -4.014491, -6.034652, 1, 1.5, 0.5, 0.5,
-2, -4.014491, -6.034652, 0, 1.5, 0.5, 0.5,
-1, -4.014491, -6.034652, 0, -0.5, 0.5, 0.5,
-1, -4.014491, -6.034652, 1, -0.5, 0.5, 0.5,
-1, -4.014491, -6.034652, 1, 1.5, 0.5, 0.5,
-1, -4.014491, -6.034652, 0, 1.5, 0.5, 0.5,
0, -4.014491, -6.034652, 0, -0.5, 0.5, 0.5,
0, -4.014491, -6.034652, 1, -0.5, 0.5, 0.5,
0, -4.014491, -6.034652, 1, 1.5, 0.5, 0.5,
0, -4.014491, -6.034652, 0, 1.5, 0.5, 0.5,
1, -4.014491, -6.034652, 0, -0.5, 0.5, 0.5,
1, -4.014491, -6.034652, 1, -0.5, 0.5, 0.5,
1, -4.014491, -6.034652, 1, 1.5, 0.5, 0.5,
1, -4.014491, -6.034652, 0, 1.5, 0.5, 0.5,
2, -4.014491, -6.034652, 0, -0.5, 0.5, 0.5,
2, -4.014491, -6.034652, 1, -0.5, 0.5, 0.5,
2, -4.014491, -6.034652, 1, 1.5, 0.5, 0.5,
2, -4.014491, -6.034652, 0, 1.5, 0.5, 0.5
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
-3.347482, -3, -5.191618,
-3.347482, 3, -5.191618,
-3.347482, -3, -5.191618,
-3.504592, -3, -5.47263,
-3.347482, -2, -5.191618,
-3.504592, -2, -5.47263,
-3.347482, -1, -5.191618,
-3.504592, -1, -5.47263,
-3.347482, 0, -5.191618,
-3.504592, 0, -5.47263,
-3.347482, 1, -5.191618,
-3.504592, 1, -5.47263,
-3.347482, 2, -5.191618,
-3.504592, 2, -5.47263,
-3.347482, 3, -5.191618,
-3.504592, 3, -5.47263
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
-3.818814, -3, -6.034652, 0, -0.5, 0.5, 0.5,
-3.818814, -3, -6.034652, 1, -0.5, 0.5, 0.5,
-3.818814, -3, -6.034652, 1, 1.5, 0.5, 0.5,
-3.818814, -3, -6.034652, 0, 1.5, 0.5, 0.5,
-3.818814, -2, -6.034652, 0, -0.5, 0.5, 0.5,
-3.818814, -2, -6.034652, 1, -0.5, 0.5, 0.5,
-3.818814, -2, -6.034652, 1, 1.5, 0.5, 0.5,
-3.818814, -2, -6.034652, 0, 1.5, 0.5, 0.5,
-3.818814, -1, -6.034652, 0, -0.5, 0.5, 0.5,
-3.818814, -1, -6.034652, 1, -0.5, 0.5, 0.5,
-3.818814, -1, -6.034652, 1, 1.5, 0.5, 0.5,
-3.818814, -1, -6.034652, 0, 1.5, 0.5, 0.5,
-3.818814, 0, -6.034652, 0, -0.5, 0.5, 0.5,
-3.818814, 0, -6.034652, 1, -0.5, 0.5, 0.5,
-3.818814, 0, -6.034652, 1, 1.5, 0.5, 0.5,
-3.818814, 0, -6.034652, 0, 1.5, 0.5, 0.5,
-3.818814, 1, -6.034652, 0, -0.5, 0.5, 0.5,
-3.818814, 1, -6.034652, 1, -0.5, 0.5, 0.5,
-3.818814, 1, -6.034652, 1, 1.5, 0.5, 0.5,
-3.818814, 1, -6.034652, 0, 1.5, 0.5, 0.5,
-3.818814, 2, -6.034652, 0, -0.5, 0.5, 0.5,
-3.818814, 2, -6.034652, 1, -0.5, 0.5, 0.5,
-3.818814, 2, -6.034652, 1, 1.5, 0.5, 0.5,
-3.818814, 2, -6.034652, 0, 1.5, 0.5, 0.5,
-3.818814, 3, -6.034652, 0, -0.5, 0.5, 0.5,
-3.818814, 3, -6.034652, 1, -0.5, 0.5, 0.5,
-3.818814, 3, -6.034652, 1, 1.5, 0.5, 0.5,
-3.818814, 3, -6.034652, 0, 1.5, 0.5, 0.5
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
-3.347482, -3.485231, -4,
-3.347482, -3.485231, 4,
-3.347482, -3.485231, -4,
-3.504592, -3.661651, -4,
-3.347482, -3.485231, -2,
-3.504592, -3.661651, -2,
-3.347482, -3.485231, 0,
-3.504592, -3.661651, 0,
-3.347482, -3.485231, 2,
-3.504592, -3.661651, 2,
-3.347482, -3.485231, 4,
-3.504592, -3.661651, 4
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
-3.818814, -4.014491, -4, 0, -0.5, 0.5, 0.5,
-3.818814, -4.014491, -4, 1, -0.5, 0.5, 0.5,
-3.818814, -4.014491, -4, 1, 1.5, 0.5, 0.5,
-3.818814, -4.014491, -4, 0, 1.5, 0.5, 0.5,
-3.818814, -4.014491, -2, 0, -0.5, 0.5, 0.5,
-3.818814, -4.014491, -2, 1, -0.5, 0.5, 0.5,
-3.818814, -4.014491, -2, 1, 1.5, 0.5, 0.5,
-3.818814, -4.014491, -2, 0, 1.5, 0.5, 0.5,
-3.818814, -4.014491, 0, 0, -0.5, 0.5, 0.5,
-3.818814, -4.014491, 0, 1, -0.5, 0.5, 0.5,
-3.818814, -4.014491, 0, 1, 1.5, 0.5, 0.5,
-3.818814, -4.014491, 0, 0, 1.5, 0.5, 0.5,
-3.818814, -4.014491, 2, 0, -0.5, 0.5, 0.5,
-3.818814, -4.014491, 2, 1, -0.5, 0.5, 0.5,
-3.818814, -4.014491, 2, 1, 1.5, 0.5, 0.5,
-3.818814, -4.014491, 2, 0, 1.5, 0.5, 0.5,
-3.818814, -4.014491, 4, 0, -0.5, 0.5, 0.5,
-3.818814, -4.014491, 4, 1, -0.5, 0.5, 0.5,
-3.818814, -4.014491, 4, 1, 1.5, 0.5, 0.5,
-3.818814, -4.014491, 4, 0, 1.5, 0.5, 0.5
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
-3.347482, -3.485231, -5.191618,
-3.347482, 3.57157, -5.191618,
-3.347482, -3.485231, 6.048829,
-3.347482, 3.57157, 6.048829,
-3.347482, -3.485231, -5.191618,
-3.347482, -3.485231, 6.048829,
-3.347482, 3.57157, -5.191618,
-3.347482, 3.57157, 6.048829,
-3.347482, -3.485231, -5.191618,
2.936946, -3.485231, -5.191618,
-3.347482, -3.485231, 6.048829,
2.936946, -3.485231, 6.048829,
-3.347482, 3.57157, -5.191618,
2.936946, 3.57157, -5.191618,
-3.347482, 3.57157, 6.048829,
2.936946, 3.57157, 6.048829,
2.936946, -3.485231, -5.191618,
2.936946, 3.57157, -5.191618,
2.936946, -3.485231, 6.048829,
2.936946, 3.57157, 6.048829,
2.936946, -3.485231, -5.191618,
2.936946, -3.485231, 6.048829,
2.936946, 3.57157, -5.191618,
2.936946, 3.57157, 6.048829
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
var radius = 7.84134;
var distance = 34.887;
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
mvMatrix.translate( 0.2052678, -0.04316938, -0.4286053 );
mvMatrix.scale( 1.349082, 1.201424, 0.7542591 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.887);
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
allophanate_dimethyl<-read.table("allophanate_dimethyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-allophanate_dimethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'allophanate_dimethyl' not found
```

```r
y<-allophanate_dimethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'allophanate_dimethyl' not found
```

```r
z<-allophanate_dimethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'allophanate_dimethyl' not found
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
-3.255961, -0.1949242, -1.253115, 0, 0, 1, 1, 1,
-3.076691, 1.329252, -2.106881, 1, 0, 0, 1, 1,
-2.935159, -0.6453901, -2.20366, 1, 0, 0, 1, 1,
-2.907261, -0.7368317, -2.449767, 1, 0, 0, 1, 1,
-2.896128, -0.3707914, -1.947447, 1, 0, 0, 1, 1,
-2.840566, -0.7920077, -2.224902, 1, 0, 0, 1, 1,
-2.777696, -0.3966631, -1.373707, 0, 0, 0, 1, 1,
-2.751865, -0.2835513, -1.948618, 0, 0, 0, 1, 1,
-2.663058, -1.325296, -0.789919, 0, 0, 0, 1, 1,
-2.630439, 1.884666, -0.8751502, 0, 0, 0, 1, 1,
-2.571196, 0.02507383, -1.496442, 0, 0, 0, 1, 1,
-2.50564, -0.8792033, -2.034648, 0, 0, 0, 1, 1,
-2.49561, -0.9111063, -2.649565, 0, 0, 0, 1, 1,
-2.484111, 0.2359908, -0.9108868, 1, 1, 1, 1, 1,
-2.397198, -1.419029, -1.898694, 1, 1, 1, 1, 1,
-2.372607, 0.4255757, -0.8088201, 1, 1, 1, 1, 1,
-2.36515, 0.6320676, -1.310174, 1, 1, 1, 1, 1,
-2.327966, 1.306502, -0.06493333, 1, 1, 1, 1, 1,
-2.31127, -1.462893, -1.788069, 1, 1, 1, 1, 1,
-2.280903, 0.03586116, -1.280292, 1, 1, 1, 1, 1,
-2.259206, 0.6239404, -1.716564, 1, 1, 1, 1, 1,
-2.221075, -0.3722221, -0.9030858, 1, 1, 1, 1, 1,
-2.186985, -0.2891143, -0.5975521, 1, 1, 1, 1, 1,
-2.123852, 0.4821254, -1.352511, 1, 1, 1, 1, 1,
-2.12273, 0.2467181, -0.4988659, 1, 1, 1, 1, 1,
-2.106619, -0.9294075, -0.9431099, 1, 1, 1, 1, 1,
-2.092024, -0.3877392, -0.08645604, 1, 1, 1, 1, 1,
-2.035135, 1.503805, 0.4801357, 1, 1, 1, 1, 1,
-2.010646, -0.1574091, -0.9844632, 0, 0, 1, 1, 1,
-1.990779, -0.9073809, -2.458743, 1, 0, 0, 1, 1,
-1.982742, 0.2724043, -2.000886, 1, 0, 0, 1, 1,
-1.958336, -0.7929177, -2.625556, 1, 0, 0, 1, 1,
-1.896787, 0.1245066, -1.418798, 1, 0, 0, 1, 1,
-1.868579, 0.7183388, -0.08016023, 1, 0, 0, 1, 1,
-1.866007, 1.199179, -0.2705422, 0, 0, 0, 1, 1,
-1.844371, 2.425021, -0.1278841, 0, 0, 0, 1, 1,
-1.812353, 0.1525317, -1.592185, 0, 0, 0, 1, 1,
-1.806073, 0.5459187, -0.5722532, 0, 0, 0, 1, 1,
-1.787308, 0.7032418, -2.228666, 0, 0, 0, 1, 1,
-1.739773, -0.3628692, -3.073887, 0, 0, 0, 1, 1,
-1.728653, 0.8105558, -0.6309248, 0, 0, 0, 1, 1,
-1.721328, 0.8788976, -1.381212, 1, 1, 1, 1, 1,
-1.710305, -0.9066694, -1.469081, 1, 1, 1, 1, 1,
-1.70924, 1.667128, 0.4897259, 1, 1, 1, 1, 1,
-1.694333, -1.320013, -0.2034535, 1, 1, 1, 1, 1,
-1.67441, -1.363069, -1.882591, 1, 1, 1, 1, 1,
-1.673849, 1.229357, 1.031838, 1, 1, 1, 1, 1,
-1.658891, -0.9157118, -1.900104, 1, 1, 1, 1, 1,
-1.648938, -0.1705702, -3.545609, 1, 1, 1, 1, 1,
-1.642576, -1.331344, -2.710792, 1, 1, 1, 1, 1,
-1.640797, -0.5526345, -0.6775057, 1, 1, 1, 1, 1,
-1.631905, -0.4977329, -1.589643, 1, 1, 1, 1, 1,
-1.61891, -0.5043499, -1.613788, 1, 1, 1, 1, 1,
-1.612837, -0.1995593, -2.221514, 1, 1, 1, 1, 1,
-1.604863, -0.5755661, -2.450459, 1, 1, 1, 1, 1,
-1.596681, -0.9217412, -2.545864, 1, 1, 1, 1, 1,
-1.594047, 0.7740898, -1.612628, 0, 0, 1, 1, 1,
-1.592246, -1.461613, -3.005153, 1, 0, 0, 1, 1,
-1.590312, -0.4100398, -2.701369, 1, 0, 0, 1, 1,
-1.583975, 1.392481, -0.187344, 1, 0, 0, 1, 1,
-1.577936, 0.3894509, -1.59149, 1, 0, 0, 1, 1,
-1.544676, -0.6375158, -2.683224, 1, 0, 0, 1, 1,
-1.536437, 0.6271716, -0.5633277, 0, 0, 0, 1, 1,
-1.532741, -1.037557, -3.64267, 0, 0, 0, 1, 1,
-1.51738, 2.436042, -0.3941208, 0, 0, 0, 1, 1,
-1.507497, -0.4620709, -3.170285, 0, 0, 0, 1, 1,
-1.50396, 0.2469343, -2.422572, 0, 0, 0, 1, 1,
-1.502388, -0.5743793, -1.10663, 0, 0, 0, 1, 1,
-1.501845, -1.507833, -2.54437, 0, 0, 0, 1, 1,
-1.50128, -0.02247057, -0.6026277, 1, 1, 1, 1, 1,
-1.499015, -0.2807032, -1.812971, 1, 1, 1, 1, 1,
-1.496226, 0.05704551, -2.615119, 1, 1, 1, 1, 1,
-1.496137, -0.2421472, -2.591937, 1, 1, 1, 1, 1,
-1.482382, -1.382336, -0.990266, 1, 1, 1, 1, 1,
-1.481562, 0.1812233, -2.486496, 1, 1, 1, 1, 1,
-1.478849, 0.1192404, -1.584678, 1, 1, 1, 1, 1,
-1.46976, -0.7294227, -2.230137, 1, 1, 1, 1, 1,
-1.468016, -0.7121243, -3.079603, 1, 1, 1, 1, 1,
-1.467655, 0.2253784, -0.5659522, 1, 1, 1, 1, 1,
-1.463543, -0.5515407, -2.644086, 1, 1, 1, 1, 1,
-1.460415, -0.6751031, -1.152725, 1, 1, 1, 1, 1,
-1.451956, 0.4293326, -2.069699, 1, 1, 1, 1, 1,
-1.448582, -0.3926203, -1.219717, 1, 1, 1, 1, 1,
-1.436381, 0.7125459, -1.744995, 1, 1, 1, 1, 1,
-1.432765, 1.849077, -0.4743813, 0, 0, 1, 1, 1,
-1.423116, -0.5575097, -2.018445, 1, 0, 0, 1, 1,
-1.422627, 0.01586304, -0.519409, 1, 0, 0, 1, 1,
-1.416136, 0.9200661, -1.868262, 1, 0, 0, 1, 1,
-1.410283, -1.567619, -1.515305, 1, 0, 0, 1, 1,
-1.405682, 1.847162, -1.225712, 1, 0, 0, 1, 1,
-1.399059, -1.395504, -3.761431, 0, 0, 0, 1, 1,
-1.397215, 0.4665734, -0.5293935, 0, 0, 0, 1, 1,
-1.379097, 1.993396, -1.251413, 0, 0, 0, 1, 1,
-1.371651, 1.909931, -0.1023144, 0, 0, 0, 1, 1,
-1.360586, 1.301337, -1.670626, 0, 0, 0, 1, 1,
-1.353514, 2.809433, 0.5993479, 0, 0, 0, 1, 1,
-1.340218, -0.6061344, -1.210389, 0, 0, 0, 1, 1,
-1.337953, 0.004135145, -0.9390627, 1, 1, 1, 1, 1,
-1.332202, 0.6315404, -0.4228876, 1, 1, 1, 1, 1,
-1.331354, -1.009426, -1.425659, 1, 1, 1, 1, 1,
-1.324866, 0.3533182, -1.072787, 1, 1, 1, 1, 1,
-1.322015, 0.5003029, -1.365352, 1, 1, 1, 1, 1,
-1.314004, 0.8735043, -2.330855, 1, 1, 1, 1, 1,
-1.313428, 0.2198635, -0.2024656, 1, 1, 1, 1, 1,
-1.302159, -0.04328953, -3.255015, 1, 1, 1, 1, 1,
-1.283775, 0.9883988, -1.446214, 1, 1, 1, 1, 1,
-1.277544, -1.81085, -3.695569, 1, 1, 1, 1, 1,
-1.268224, 0.8503239, -1.579172, 1, 1, 1, 1, 1,
-1.25945, 0.6168982, -2.468163, 1, 1, 1, 1, 1,
-1.2582, -0.7681372, -0.1878133, 1, 1, 1, 1, 1,
-1.256325, -0.3775034, -0.8045486, 1, 1, 1, 1, 1,
-1.25371, -0.9249917, -0.4906934, 1, 1, 1, 1, 1,
-1.252014, 0.6793281, -1.156103, 0, 0, 1, 1, 1,
-1.247802, 0.2344524, -1.35338, 1, 0, 0, 1, 1,
-1.245866, 0.9364502, -0.4343327, 1, 0, 0, 1, 1,
-1.232854, -0.1890247, -0.009786755, 1, 0, 0, 1, 1,
-1.231957, -0.1394811, -2.266854, 1, 0, 0, 1, 1,
-1.22605, 0.08092415, -2.02418, 1, 0, 0, 1, 1,
-1.223837, 0.4856165, -1.399743, 0, 0, 0, 1, 1,
-1.21606, -0.4664612, -1.138995, 0, 0, 0, 1, 1,
-1.215198, 0.6937395, -1.57338, 0, 0, 0, 1, 1,
-1.213403, -0.4289221, -2.860918, 0, 0, 0, 1, 1,
-1.208211, 0.3790302, -2.182231, 0, 0, 0, 1, 1,
-1.20344, 0.09705881, -0.5298642, 0, 0, 0, 1, 1,
-1.193326, 0.2364957, -0.5948174, 0, 0, 0, 1, 1,
-1.191792, -0.7662264, -0.8777621, 1, 1, 1, 1, 1,
-1.185894, -0.3736084, -4.131365, 1, 1, 1, 1, 1,
-1.170957, 0.8449956, 0.08111986, 1, 1, 1, 1, 1,
-1.169285, -0.7308092, -2.575537, 1, 1, 1, 1, 1,
-1.162543, 0.8523127, -0.2452301, 1, 1, 1, 1, 1,
-1.156082, -2.510077, -3.054879, 1, 1, 1, 1, 1,
-1.155911, 0.7326907, -2.1744, 1, 1, 1, 1, 1,
-1.150162, -0.003995848, -1.625178, 1, 1, 1, 1, 1,
-1.142206, 0.7316023, -1.659996, 1, 1, 1, 1, 1,
-1.140436, 0.7797795, -1.635933, 1, 1, 1, 1, 1,
-1.131786, 0.8877261, -1.676161, 1, 1, 1, 1, 1,
-1.129659, 0.6894534, -1.271614, 1, 1, 1, 1, 1,
-1.127171, -0.2248767, -1.793131, 1, 1, 1, 1, 1,
-1.123143, -0.2393419, -2.05872, 1, 1, 1, 1, 1,
-1.111323, -0.7220813, -1.402185, 1, 1, 1, 1, 1,
-1.107529, 0.1238377, 0.188318, 0, 0, 1, 1, 1,
-1.10156, 0.1384509, -1.536332, 1, 0, 0, 1, 1,
-1.09883, 0.3487594, -0.2132151, 1, 0, 0, 1, 1,
-1.093681, -0.06892923, -1.762932, 1, 0, 0, 1, 1,
-1.08868, 1.592342, -0.1663696, 1, 0, 0, 1, 1,
-1.085341, 0.6207275, -1.666116, 1, 0, 0, 1, 1,
-1.077297, -0.3266037, -0.9366113, 0, 0, 0, 1, 1,
-1.076505, -0.1416798, -1.807072, 0, 0, 0, 1, 1,
-1.075415, -0.7848682, -2.861152, 0, 0, 0, 1, 1,
-1.074663, 1.708374, 0.1986903, 0, 0, 0, 1, 1,
-1.070336, -1.749794, -2.010183, 0, 0, 0, 1, 1,
-1.069206, -0.6191531, -1.123893, 0, 0, 0, 1, 1,
-1.060064, 0.6067864, -0.7629999, 0, 0, 0, 1, 1,
-1.042588, 2.458231, 1.131924, 1, 1, 1, 1, 1,
-1.041769, 0.1153534, -1.206927, 1, 1, 1, 1, 1,
-1.028416, -1.043877, -1.446866, 1, 1, 1, 1, 1,
-1.027785, -1.88729, -2.360522, 1, 1, 1, 1, 1,
-1.025692, 0.2474906, -1.747105, 1, 1, 1, 1, 1,
-1.025185, -1.223072, -1.736776, 1, 1, 1, 1, 1,
-1.018037, -0.3216122, -3.872925, 1, 1, 1, 1, 1,
-1.016048, -1.348155, -4.029933, 1, 1, 1, 1, 1,
-1.010774, -0.5969911, -0.9940649, 1, 1, 1, 1, 1,
-1.000529, -0.8623385, -1.409224, 1, 1, 1, 1, 1,
-0.9957693, -0.7770913, -3.86653, 1, 1, 1, 1, 1,
-0.9947743, -0.3833379, -1.216337, 1, 1, 1, 1, 1,
-0.9937372, 2.137415, -1.008179, 1, 1, 1, 1, 1,
-0.9921125, 1.433193, -0.7433318, 1, 1, 1, 1, 1,
-0.9851421, 2.053079, -2.676066, 1, 1, 1, 1, 1,
-0.9811816, 0.6473238, -2.574754, 0, 0, 1, 1, 1,
-0.9782623, 1.44711, -2.138006, 1, 0, 0, 1, 1,
-0.9771144, 0.08236648, -0.1381905, 1, 0, 0, 1, 1,
-0.9770728, 0.3167599, -2.065861, 1, 0, 0, 1, 1,
-0.9668012, -0.567913, -1.635851, 1, 0, 0, 1, 1,
-0.9666503, -0.3901312, -2.948773, 1, 0, 0, 1, 1,
-0.960544, -0.741291, -2.836775, 0, 0, 0, 1, 1,
-0.9557044, 1.048005, -0.1370092, 0, 0, 0, 1, 1,
-0.9536173, -0.4284598, -2.401408, 0, 0, 0, 1, 1,
-0.9513225, -2.037458, -0.4852567, 0, 0, 0, 1, 1,
-0.9506233, 0.2057185, -1.694515, 0, 0, 0, 1, 1,
-0.9465878, -0.2709143, -0.8188631, 0, 0, 0, 1, 1,
-0.9461291, -0.2450959, -0.562002, 0, 0, 0, 1, 1,
-0.9433598, -1.976237, -1.603401, 1, 1, 1, 1, 1,
-0.9409003, 0.4797983, -2.382548, 1, 1, 1, 1, 1,
-0.9408445, 0.4440168, 0.7144147, 1, 1, 1, 1, 1,
-0.9393819, 0.7695972, -1.011213, 1, 1, 1, 1, 1,
-0.9393669, -0.03216161, -2.228763, 1, 1, 1, 1, 1,
-0.9387513, -0.3020484, -2.858259, 1, 1, 1, 1, 1,
-0.9310726, -0.5458993, -1.896798, 1, 1, 1, 1, 1,
-0.929536, 0.1741206, -0.7358886, 1, 1, 1, 1, 1,
-0.9293224, -0.6101039, -2.858294, 1, 1, 1, 1, 1,
-0.928122, 0.2493567, -1.507374, 1, 1, 1, 1, 1,
-0.9269314, -0.007969559, -0.4431854, 1, 1, 1, 1, 1,
-0.91979, -0.0644276, -1.914549, 1, 1, 1, 1, 1,
-0.9076836, 1.213674, -0.6104237, 1, 1, 1, 1, 1,
-0.9047528, -0.9747323, -4.406717, 1, 1, 1, 1, 1,
-0.900933, -0.2255448, -1.667198, 1, 1, 1, 1, 1,
-0.8992254, 0.9580271, 0.1601992, 0, 0, 1, 1, 1,
-0.8964741, -0.790649, -2.833649, 1, 0, 0, 1, 1,
-0.8838621, 0.2376007, -1.370285, 1, 0, 0, 1, 1,
-0.8838554, 2.848178, -1.381708, 1, 0, 0, 1, 1,
-0.8836499, 2.583224, -1.23906, 1, 0, 0, 1, 1,
-0.880707, -1.412662, -2.082719, 1, 0, 0, 1, 1,
-0.8781818, -0.1159737, -3.369125, 0, 0, 0, 1, 1,
-0.8630493, -0.2972129, -3.863999, 0, 0, 0, 1, 1,
-0.8610901, 1.649113, -0.2790515, 0, 0, 0, 1, 1,
-0.860483, 1.120848, -1.018245, 0, 0, 0, 1, 1,
-0.8587062, -0.189709, -1.787825, 0, 0, 0, 1, 1,
-0.8567275, -1.620011, -1.193603, 0, 0, 0, 1, 1,
-0.855869, -0.307653, -2.375703, 0, 0, 0, 1, 1,
-0.8442161, -0.9023815, -1.559285, 1, 1, 1, 1, 1,
-0.8408163, -1.028209, -3.426374, 1, 1, 1, 1, 1,
-0.8382912, -2.564083, -3.31019, 1, 1, 1, 1, 1,
-0.8342844, 0.6274068, -0.5343122, 1, 1, 1, 1, 1,
-0.8254399, 1.914859, -0.6581677, 1, 1, 1, 1, 1,
-0.8230487, -0.7435734, -3.955513, 1, 1, 1, 1, 1,
-0.8220318, 0.4550095, -0.1656666, 1, 1, 1, 1, 1,
-0.8211731, 1.761703, 0.9169915, 1, 1, 1, 1, 1,
-0.8203474, -1.288493, -2.416823, 1, 1, 1, 1, 1,
-0.8119333, -1.2197, -2.713207, 1, 1, 1, 1, 1,
-0.8117638, 1.27175, -1.445304, 1, 1, 1, 1, 1,
-0.8108311, -0.4486852, -1.023888, 1, 1, 1, 1, 1,
-0.8100116, 0.2842191, 0.1011602, 1, 1, 1, 1, 1,
-0.8022645, -1.887076, -2.269974, 1, 1, 1, 1, 1,
-0.801316, -0.1041452, -1.032101, 1, 1, 1, 1, 1,
-0.7994412, -0.8687895, -1.46514, 0, 0, 1, 1, 1,
-0.7971439, -0.1168102, -2.239757, 1, 0, 0, 1, 1,
-0.7919181, 0.3634499, -1.530954, 1, 0, 0, 1, 1,
-0.7908768, -0.01536035, -1.260188, 1, 0, 0, 1, 1,
-0.7882592, 0.6926724, -0.4392913, 1, 0, 0, 1, 1,
-0.7879888, 2.031405, 0.8857694, 1, 0, 0, 1, 1,
-0.7788589, -0.1952475, -0.5789093, 0, 0, 0, 1, 1,
-0.7731638, 0.802483, -1.291105, 0, 0, 0, 1, 1,
-0.7725925, 0.6565002, -1.66335, 0, 0, 0, 1, 1,
-0.7712605, 0.3729652, -1.929367, 0, 0, 0, 1, 1,
-0.7702441, 0.8338969, 1.437067, 0, 0, 0, 1, 1,
-0.7631021, -0.7762484, -2.347746, 0, 0, 0, 1, 1,
-0.7568853, -0.8054751, -3.286518, 0, 0, 0, 1, 1,
-0.7562953, 0.8927116, -0.9581991, 1, 1, 1, 1, 1,
-0.7544121, -0.9974351, -2.761047, 1, 1, 1, 1, 1,
-0.7536764, 0.1352179, 0.1255723, 1, 1, 1, 1, 1,
-0.750063, -0.3957906, -1.390103, 1, 1, 1, 1, 1,
-0.7498567, -0.1903041, -2.614598, 1, 1, 1, 1, 1,
-0.7485247, 1.741646, 0.8331023, 1, 1, 1, 1, 1,
-0.7442009, -0.03451094, -1.112165, 1, 1, 1, 1, 1,
-0.7310601, -0.3913662, -3.991552, 1, 1, 1, 1, 1,
-0.7298346, 2.230944, -0.9323971, 1, 1, 1, 1, 1,
-0.7294629, 0.1867926, -0.7405738, 1, 1, 1, 1, 1,
-0.7287083, 0.2567082, -0.955737, 1, 1, 1, 1, 1,
-0.7241703, -1.218807, -5.027923, 1, 1, 1, 1, 1,
-0.7192679, -0.4543762, -1.803426, 1, 1, 1, 1, 1,
-0.7189134, -0.2729913, -1.853521, 1, 1, 1, 1, 1,
-0.7120844, 0.2465476, -1.572893, 1, 1, 1, 1, 1,
-0.7080414, -0.002826911, -2.100214, 0, 0, 1, 1, 1,
-0.7073428, -1.108389, -1.357346, 1, 0, 0, 1, 1,
-0.7061474, -0.06614329, -2.287636, 1, 0, 0, 1, 1,
-0.7035834, -0.511461, -2.886922, 1, 0, 0, 1, 1,
-0.7024319, -0.1999096, -3.041512, 1, 0, 0, 1, 1,
-0.7016666, -0.2056405, -1.352569, 1, 0, 0, 1, 1,
-0.6996104, 0.2270732, -1.533617, 0, 0, 0, 1, 1,
-0.6916378, -0.02264298, -1.886991, 0, 0, 0, 1, 1,
-0.6864495, -0.2815428, -0.2572866, 0, 0, 0, 1, 1,
-0.6831736, -0.1780669, -3.473666, 0, 0, 0, 1, 1,
-0.6789509, -0.142727, -2.510076, 0, 0, 0, 1, 1,
-0.6737631, -1.720112, -0.9476935, 0, 0, 0, 1, 1,
-0.6655508, -1.188799, -3.533737, 0, 0, 0, 1, 1,
-0.6593573, 1.235287, -0.9163709, 1, 1, 1, 1, 1,
-0.6593053, 0.7651379, -0.5862517, 1, 1, 1, 1, 1,
-0.6534769, 2.050504, 0.06393373, 1, 1, 1, 1, 1,
-0.6511532, 1.899481, 0.5563796, 1, 1, 1, 1, 1,
-0.651051, 1.564688, 0.5600756, 1, 1, 1, 1, 1,
-0.6462327, -0.6672959, -0.4352056, 1, 1, 1, 1, 1,
-0.6450706, -0.3477346, -2.076213, 1, 1, 1, 1, 1,
-0.6410454, -0.5080278, -2.662603, 1, 1, 1, 1, 1,
-0.6405058, -1.154571, -2.728357, 1, 1, 1, 1, 1,
-0.6394963, -0.5209787, -1.767991, 1, 1, 1, 1, 1,
-0.6332392, -0.9020386, -2.117086, 1, 1, 1, 1, 1,
-0.6324363, -0.1792383, -1.844903, 1, 1, 1, 1, 1,
-0.6303511, -0.1634002, -1.173442, 1, 1, 1, 1, 1,
-0.6263877, 1.800747, -1.863571, 1, 1, 1, 1, 1,
-0.6236088, 0.2495393, -0.7255774, 1, 1, 1, 1, 1,
-0.6218588, 0.6031498, -1.125281, 0, 0, 1, 1, 1,
-0.607322, -0.6286603, -1.895809, 1, 0, 0, 1, 1,
-0.6012629, -0.7099776, -2.94161, 1, 0, 0, 1, 1,
-0.5967193, -0.4427547, -2.804562, 1, 0, 0, 1, 1,
-0.5964038, 0.3181404, -2.484784, 1, 0, 0, 1, 1,
-0.5915152, 1.876074, -0.8172739, 1, 0, 0, 1, 1,
-0.5836858, 1.196692, -0.2167313, 0, 0, 0, 1, 1,
-0.5812212, -1.035137, -2.617011, 0, 0, 0, 1, 1,
-0.5746596, 0.6955485, 0.9411597, 0, 0, 0, 1, 1,
-0.5695291, 0.08099055, -0.5830315, 0, 0, 0, 1, 1,
-0.5578722, 0.3979746, -0.6875048, 0, 0, 0, 1, 1,
-0.5570116, 0.3963661, -0.4235175, 0, 0, 0, 1, 1,
-0.5547057, 0.01811022, -1.402889, 0, 0, 0, 1, 1,
-0.553299, -0.8960704, -2.923677, 1, 1, 1, 1, 1,
-0.5521134, -0.7371427, -1.413906, 1, 1, 1, 1, 1,
-0.5487796, -1.077585, -4.118808, 1, 1, 1, 1, 1,
-0.5439458, -0.4705038, -1.810538, 1, 1, 1, 1, 1,
-0.5405587, 1.299417, -0.3218551, 1, 1, 1, 1, 1,
-0.5385218, -0.9038466, -2.537489, 1, 1, 1, 1, 1,
-0.5362619, -1.22017, -2.491884, 1, 1, 1, 1, 1,
-0.5298027, -2.101167, -1.183858, 1, 1, 1, 1, 1,
-0.5250958, 0.191337, -0.4454522, 1, 1, 1, 1, 1,
-0.5181327, 0.8446267, -1.383368, 1, 1, 1, 1, 1,
-0.5163535, 0.002425894, -1.973247, 1, 1, 1, 1, 1,
-0.5160615, 0.2760293, -1.658766, 1, 1, 1, 1, 1,
-0.5157923, 0.7130702, -1.257474, 1, 1, 1, 1, 1,
-0.5139278, -0.001417068, -0.5651807, 1, 1, 1, 1, 1,
-0.5125969, 1.236308, -1.078389, 1, 1, 1, 1, 1,
-0.509423, 1.40665, -1.295876, 0, 0, 1, 1, 1,
-0.5072448, 2.080195, -1.165006, 1, 0, 0, 1, 1,
-0.50685, 0.6560906, -0.9085928, 1, 0, 0, 1, 1,
-0.5064955, -1.278674, -2.438223, 1, 0, 0, 1, 1,
-0.503004, 1.221354, -0.9899212, 1, 0, 0, 1, 1,
-0.500718, -0.8635664, -3.108891, 1, 0, 0, 1, 1,
-0.5005147, 0.5331391, 0.8236439, 0, 0, 0, 1, 1,
-0.4964411, -1.257744, -3.113936, 0, 0, 0, 1, 1,
-0.4946491, -0.1324317, -2.921633, 0, 0, 0, 1, 1,
-0.4930692, 0.0900439, -1.941026, 0, 0, 0, 1, 1,
-0.4884627, -0.6918297, -3.467354, 0, 0, 0, 1, 1,
-0.4818613, 1.028334, -2.402832, 0, 0, 0, 1, 1,
-0.4790415, 0.3031198, -0.834598, 0, 0, 0, 1, 1,
-0.4784037, 0.2684498, -0.7331528, 1, 1, 1, 1, 1,
-0.4766551, 0.6129571, -0.2580554, 1, 1, 1, 1, 1,
-0.4761331, -0.6575663, -1.8658, 1, 1, 1, 1, 1,
-0.474483, 1.047635, 0.05641754, 1, 1, 1, 1, 1,
-0.4734717, 0.1229504, -0.9274185, 1, 1, 1, 1, 1,
-0.4711776, -1.566826, -4.159832, 1, 1, 1, 1, 1,
-0.4704652, -0.3408213, -3.336801, 1, 1, 1, 1, 1,
-0.4681925, -0.8311742, -1.735113, 1, 1, 1, 1, 1,
-0.4640605, -0.1182327, -2.416064, 1, 1, 1, 1, 1,
-0.4619248, 1.569604, -1.47452, 1, 1, 1, 1, 1,
-0.4594256, -1.14978, -1.841339, 1, 1, 1, 1, 1,
-0.4564187, -0.1812081, -0.08978947, 1, 1, 1, 1, 1,
-0.4543292, -0.8772128, -2.720626, 1, 1, 1, 1, 1,
-0.4541167, -0.558132, -2.28004, 1, 1, 1, 1, 1,
-0.4539365, 1.6337, 0.1030211, 1, 1, 1, 1, 1,
-0.4497421, 0.4903518, 0.86132, 0, 0, 1, 1, 1,
-0.4484236, -0.4425582, -2.809314, 1, 0, 0, 1, 1,
-0.4444961, -1.168794, -4.10708, 1, 0, 0, 1, 1,
-0.4405791, -0.0647854, -2.385077, 1, 0, 0, 1, 1,
-0.4373702, 1.832338, 0.4388777, 1, 0, 0, 1, 1,
-0.4335993, 0.6457348, -0.365475, 1, 0, 0, 1, 1,
-0.4328791, -0.1366717, -2.454214, 0, 0, 0, 1, 1,
-0.431854, 1.530397, -0.4695964, 0, 0, 0, 1, 1,
-0.4314332, 0.9798077, 0.1570019, 0, 0, 0, 1, 1,
-0.4209492, 0.2996396, -1.227289, 0, 0, 0, 1, 1,
-0.420614, 1.673351, -0.3272648, 0, 0, 0, 1, 1,
-0.4173198, -1.094151, -3.41622, 0, 0, 0, 1, 1,
-0.4163712, 1.13625, 0.6791139, 0, 0, 0, 1, 1,
-0.4125777, -1.396874, -2.165964, 1, 1, 1, 1, 1,
-0.409535, -0.2103716, -2.370149, 1, 1, 1, 1, 1,
-0.4086445, 1.155725, -0.1096709, 1, 1, 1, 1, 1,
-0.4077724, -0.8021056, -1.656942, 1, 1, 1, 1, 1,
-0.4035184, 0.162995, -2.109263, 1, 1, 1, 1, 1,
-0.3915509, 0.9506865, -0.1693416, 1, 1, 1, 1, 1,
-0.3909323, -1.317244, -4.222317, 1, 1, 1, 1, 1,
-0.3878206, 1.068856, -0.03065404, 1, 1, 1, 1, 1,
-0.3711404, 0.1959207, -1.807419, 1, 1, 1, 1, 1,
-0.3665946, 0.4956496, -1.248011, 1, 1, 1, 1, 1,
-0.3655024, 2.502764, 0.8891853, 1, 1, 1, 1, 1,
-0.363979, 1.021806, -2.109787, 1, 1, 1, 1, 1,
-0.3613752, 1.011943, -0.3487246, 1, 1, 1, 1, 1,
-0.3561833, 0.7232593, 1.992669, 1, 1, 1, 1, 1,
-0.3548276, -1.511745, -3.706494, 1, 1, 1, 1, 1,
-0.3542505, -1.365535, -2.669153, 0, 0, 1, 1, 1,
-0.352111, -1.556207, -3.908829, 1, 0, 0, 1, 1,
-0.3485629, -2.321536, -1.81729, 1, 0, 0, 1, 1,
-0.3478344, 0.9055653, -0.8448362, 1, 0, 0, 1, 1,
-0.3433102, -1.510781, -2.068463, 1, 0, 0, 1, 1,
-0.339614, 0.5966485, -0.5520978, 1, 0, 0, 1, 1,
-0.3370135, -0.3373164, -4.867184, 0, 0, 0, 1, 1,
-0.3360021, -0.7249098, -3.071127, 0, 0, 0, 1, 1,
-0.3359966, -2.009792, -1.901695, 0, 0, 0, 1, 1,
-0.335527, 0.4871453, -0.2775729, 0, 0, 0, 1, 1,
-0.3343404, 0.5160841, -0.7504871, 0, 0, 0, 1, 1,
-0.3338854, -0.1763003, -3.279721, 0, 0, 0, 1, 1,
-0.3337061, -1.557764, -4.317127, 0, 0, 0, 1, 1,
-0.3314309, -0.02545811, -1.736786, 1, 1, 1, 1, 1,
-0.3309774, 0.4249278, 0.6207271, 1, 1, 1, 1, 1,
-0.3300787, 0.7665736, -0.2038282, 1, 1, 1, 1, 1,
-0.329019, -0.1663255, -2.146738, 1, 1, 1, 1, 1,
-0.328181, -0.6341825, -1.865036, 1, 1, 1, 1, 1,
-0.3241847, 0.8041697, -0.1399516, 1, 1, 1, 1, 1,
-0.3228471, 1.07793, -1.81448, 1, 1, 1, 1, 1,
-0.3189335, 0.4016905, -2.591314, 1, 1, 1, 1, 1,
-0.3120279, 1.162276, 0.05115532, 1, 1, 1, 1, 1,
-0.3108561, 0.0557963, -1.009292, 1, 1, 1, 1, 1,
-0.3062519, -0.5528436, -3.951478, 1, 1, 1, 1, 1,
-0.3038039, -1.703299, -3.057653, 1, 1, 1, 1, 1,
-0.3031293, -0.2806969, -1.144336, 1, 1, 1, 1, 1,
-0.2958954, -0.8401687, -2.133267, 1, 1, 1, 1, 1,
-0.2924314, -1.937646, -2.583051, 1, 1, 1, 1, 1,
-0.292286, -0.6067246, -2.254152, 0, 0, 1, 1, 1,
-0.292197, 0.4723297, -0.3646497, 1, 0, 0, 1, 1,
-0.2906219, 0.4493015, -1.1277, 1, 0, 0, 1, 1,
-0.2898052, -2.336347, -1.440713, 1, 0, 0, 1, 1,
-0.2898026, -0.02360928, -2.332057, 1, 0, 0, 1, 1,
-0.2861565, 1.275738, -0.1512677, 1, 0, 0, 1, 1,
-0.2855237, 0.02287982, -1.887284, 0, 0, 0, 1, 1,
-0.2808867, 0.2435066, -2.138135, 0, 0, 0, 1, 1,
-0.2788127, -0.2044266, -2.140807, 0, 0, 0, 1, 1,
-0.2766744, 0.491183, -0.3098817, 0, 0, 0, 1, 1,
-0.2727303, -0.168644, -1.491748, 0, 0, 0, 1, 1,
-0.2726748, 1.61424, -1.101778, 0, 0, 0, 1, 1,
-0.2721279, 1.108523, 1.728978, 0, 0, 0, 1, 1,
-0.2706068, 0.2933784, -1.315418, 1, 1, 1, 1, 1,
-0.2704011, -1.103214, -3.459992, 1, 1, 1, 1, 1,
-0.2682603, 1.751253, 1.160788, 1, 1, 1, 1, 1,
-0.2624747, 0.4020073, -1.528267, 1, 1, 1, 1, 1,
-0.2569242, -0.3722094, -3.169985, 1, 1, 1, 1, 1,
-0.2557641, 0.2226539, -0.1469664, 1, 1, 1, 1, 1,
-0.2468276, 0.06000026, 0.4405043, 1, 1, 1, 1, 1,
-0.2454515, 0.2998979, -1.161907, 1, 1, 1, 1, 1,
-0.2429476, -0.2252932, -2.71615, 1, 1, 1, 1, 1,
-0.2414022, 0.2917275, -1.940729, 1, 1, 1, 1, 1,
-0.2411272, 0.9167679, -2.465512, 1, 1, 1, 1, 1,
-0.2405846, 1.001904, -2.133834, 1, 1, 1, 1, 1,
-0.2381426, -0.2772264, -2.820702, 1, 1, 1, 1, 1,
-0.2356283, -2.850292, -3.368123, 1, 1, 1, 1, 1,
-0.2321737, 0.5116955, -0.4967277, 1, 1, 1, 1, 1,
-0.2270187, -0.0322829, -1.204102, 0, 0, 1, 1, 1,
-0.2253958, -0.7792696, -2.11728, 1, 0, 0, 1, 1,
-0.2238497, 1.409934, 0.9440734, 1, 0, 0, 1, 1,
-0.2232724, -1.095336, -2.924783, 1, 0, 0, 1, 1,
-0.2223797, 0.4455225, -0.5591258, 1, 0, 0, 1, 1,
-0.2186282, 1.054672, -0.1553157, 1, 0, 0, 1, 1,
-0.2136014, 0.5671978, -0.4316473, 0, 0, 0, 1, 1,
-0.2130038, -0.6858187, -4.285519, 0, 0, 0, 1, 1,
-0.2091347, -0.446247, -3.255749, 0, 0, 0, 1, 1,
-0.2068872, 1.299016, 0.3343844, 0, 0, 0, 1, 1,
-0.204664, -0.9644137, -2.386652, 0, 0, 0, 1, 1,
-0.2038978, 0.4132844, 0.2200291, 0, 0, 0, 1, 1,
-0.1987818, 0.5509582, 0.1324156, 0, 0, 0, 1, 1,
-0.1941169, 0.3587767, 0.2930442, 1, 1, 1, 1, 1,
-0.1930078, 0.08766431, -0.6261601, 1, 1, 1, 1, 1,
-0.1908978, -0.5632799, -2.226832, 1, 1, 1, 1, 1,
-0.1868912, 1.449653, -0.6057166, 1, 1, 1, 1, 1,
-0.1852967, -0.09448867, -1.695452, 1, 1, 1, 1, 1,
-0.1850245, -0.6189705, -2.187342, 1, 1, 1, 1, 1,
-0.1836776, -0.6955436, -4.281621, 1, 1, 1, 1, 1,
-0.182963, 1.472679, 0.9209924, 1, 1, 1, 1, 1,
-0.1805653, -2.053288, -2.713861, 1, 1, 1, 1, 1,
-0.1784781, 0.18481, -1.621273, 1, 1, 1, 1, 1,
-0.1776955, 1.918675, 0.07632606, 1, 1, 1, 1, 1,
-0.1768404, -2.53753, -3.202132, 1, 1, 1, 1, 1,
-0.1707461, 0.1937099, -1.570022, 1, 1, 1, 1, 1,
-0.1644941, 0.833733, 0.2975174, 1, 1, 1, 1, 1,
-0.1481118, -0.4079412, -4.181973, 1, 1, 1, 1, 1,
-0.1480523, -0.341158, -3.352745, 0, 0, 1, 1, 1,
-0.14803, -0.4163402, -3.064265, 1, 0, 0, 1, 1,
-0.146441, 2.406097, -0.09870333, 1, 0, 0, 1, 1,
-0.1461941, 1.452687, -0.6712627, 1, 0, 0, 1, 1,
-0.1455172, 1.396956, -2.189749, 1, 0, 0, 1, 1,
-0.1416377, -0.3112978, -2.652237, 1, 0, 0, 1, 1,
-0.1346622, 0.0973512, -2.077621, 0, 0, 0, 1, 1,
-0.1339826, -0.09622898, -2.211792, 0, 0, 0, 1, 1,
-0.1306823, 1.423655, 0.4317099, 0, 0, 0, 1, 1,
-0.1305856, -1.071218, -3.870308, 0, 0, 0, 1, 1,
-0.1267575, 0.284294, -1.817497, 0, 0, 0, 1, 1,
-0.1241563, 0.1491069, -0.6542647, 0, 0, 0, 1, 1,
-0.1237876, 0.5921602, -0.2342145, 0, 0, 0, 1, 1,
-0.1218484, 1.006676, 1.236355, 1, 1, 1, 1, 1,
-0.1211292, -1.501764, -2.334589, 1, 1, 1, 1, 1,
-0.1203873, 0.6556171, -0.02489134, 1, 1, 1, 1, 1,
-0.1159008, -0.4285909, -2.280835, 1, 1, 1, 1, 1,
-0.1148858, 0.5880896, -0.8340567, 1, 1, 1, 1, 1,
-0.1132686, -0.4219348, -4.609548, 1, 1, 1, 1, 1,
-0.1132192, -0.4492573, -3.011589, 1, 1, 1, 1, 1,
-0.107239, -3.189267, -3.049581, 1, 1, 1, 1, 1,
-0.1051068, 0.2842122, 0.3225157, 1, 1, 1, 1, 1,
-0.1029117, -0.5245882, -4.098599, 1, 1, 1, 1, 1,
-0.1022547, -0.4249688, -2.262679, 1, 1, 1, 1, 1,
-0.09253192, 0.6245685, -0.04396421, 1, 1, 1, 1, 1,
-0.08978513, 0.6208714, 0.1112824, 1, 1, 1, 1, 1,
-0.089127, -0.7198492, -3.450073, 1, 1, 1, 1, 1,
-0.08781968, -0.2422646, -2.534683, 1, 1, 1, 1, 1,
-0.0841598, -0.3821377, -4.355667, 0, 0, 1, 1, 1,
-0.08227593, 0.3113048, -0.5301642, 1, 0, 0, 1, 1,
-0.08215484, -0.09358293, -3.082337, 1, 0, 0, 1, 1,
-0.08148895, 0.09419941, -1.967111, 1, 0, 0, 1, 1,
-0.0786365, 0.4764345, 0.3141356, 1, 0, 0, 1, 1,
-0.07684972, 1.147127, 0.8848144, 1, 0, 0, 1, 1,
-0.07635979, -0.7973225, -3.111527, 0, 0, 0, 1, 1,
-0.073407, 0.1341087, 2.183627, 0, 0, 0, 1, 1,
-0.07101396, 0.1614605, -1.731874, 0, 0, 0, 1, 1,
-0.07030241, 0.475665, -0.08560947, 0, 0, 0, 1, 1,
-0.0673987, -2.172865, -2.328706, 0, 0, 0, 1, 1,
-0.06600524, -0.4847647, -1.650526, 0, 0, 0, 1, 1,
-0.0656289, 0.5066584, -1.526423, 0, 0, 0, 1, 1,
-0.06203536, -1.7476, -3.583772, 1, 1, 1, 1, 1,
-0.05676739, -0.008436634, -2.900907, 1, 1, 1, 1, 1,
-0.05663817, 0.2457694, 0.8803973, 1, 1, 1, 1, 1,
-0.05147945, 0.5098399, 0.4426194, 1, 1, 1, 1, 1,
-0.05091663, -0.7714101, -2.95916, 1, 1, 1, 1, 1,
-0.04702693, -0.7867329, -4.390025, 1, 1, 1, 1, 1,
-0.04555207, -1.130105, -4.389749, 1, 1, 1, 1, 1,
-0.04318833, -0.05220603, -2.88393, 1, 1, 1, 1, 1,
-0.04263652, -0.3509341, -2.790138, 1, 1, 1, 1, 1,
-0.03903064, 1.582917, -0.5653363, 1, 1, 1, 1, 1,
-0.03191881, -0.6566154, -2.660675, 1, 1, 1, 1, 1,
-0.03128176, -0.7466213, -1.891652, 1, 1, 1, 1, 1,
-0.02913592, 0.2234416, 1.363249, 1, 1, 1, 1, 1,
-0.01873751, 0.6724585, 1.802912, 1, 1, 1, 1, 1,
-0.01447712, 0.6847082, -0.3022575, 1, 1, 1, 1, 1,
-0.01384284, -0.3695585, -3.1378, 0, 0, 1, 1, 1,
-0.01296834, 1.091797, -1.126057, 1, 0, 0, 1, 1,
-0.01254585, 1.363724, -0.08164585, 1, 0, 0, 1, 1,
-0.007743406, 0.7599701, -1.044377, 1, 0, 0, 1, 1,
-0.004767308, -0.5921661, -3.974005, 1, 0, 0, 1, 1,
0.004795434, 0.01349083, -2.919401, 1, 0, 0, 1, 1,
0.008080205, -1.868995, 1.438272, 0, 0, 0, 1, 1,
0.008344241, 0.4413369, 0.1938693, 0, 0, 0, 1, 1,
0.01071758, 0.7207504, -0.9117113, 0, 0, 0, 1, 1,
0.01434295, 1.327686, 1.170504, 0, 0, 0, 1, 1,
0.01625337, -0.1925616, 2.935422, 0, 0, 0, 1, 1,
0.02456197, -0.411928, 2.319833, 0, 0, 0, 1, 1,
0.02617721, 1.898425, 0.931955, 0, 0, 0, 1, 1,
0.03106997, 0.5641157, 2.183986, 1, 1, 1, 1, 1,
0.03119361, -1.600358, 1.903439, 1, 1, 1, 1, 1,
0.03170828, 2.009386, -1.426785, 1, 1, 1, 1, 1,
0.03317984, 0.7017, 0.3159659, 1, 1, 1, 1, 1,
0.03734667, -1.386277, 3.232988, 1, 1, 1, 1, 1,
0.03911473, -2.895089, 3.59768, 1, 1, 1, 1, 1,
0.04037272, -1.846189, 4.396232, 1, 1, 1, 1, 1,
0.04101833, -0.5803622, 2.585699, 1, 1, 1, 1, 1,
0.04175861, -1.035137, 3.775836, 1, 1, 1, 1, 1,
0.04513336, 1.467036, 0.6490774, 1, 1, 1, 1, 1,
0.04621405, 0.07766814, 1.371722, 1, 1, 1, 1, 1,
0.0493964, -0.4908654, 2.876267, 1, 1, 1, 1, 1,
0.04986774, -2.385742, 2.795846, 1, 1, 1, 1, 1,
0.05102855, -0.01483886, 0.8565637, 1, 1, 1, 1, 1,
0.05240704, -1.947256, 4.280789, 1, 1, 1, 1, 1,
0.05403219, -0.3898169, 2.47132, 0, 0, 1, 1, 1,
0.05882993, -0.528769, 2.290552, 1, 0, 0, 1, 1,
0.05906551, 0.7415981, -0.3234705, 1, 0, 0, 1, 1,
0.06003452, -0.1614785, 1.462185, 1, 0, 0, 1, 1,
0.06985008, -1.17632, 4.393528, 1, 0, 0, 1, 1,
0.07060407, 1.404776, -0.6845095, 1, 0, 0, 1, 1,
0.07085035, -0.4266113, 2.954152, 0, 0, 0, 1, 1,
0.07615347, -0.3354758, 3.879864, 0, 0, 0, 1, 1,
0.0762152, 0.4014865, 2.553048, 0, 0, 0, 1, 1,
0.07744701, 0.3797979, -0.570258, 0, 0, 0, 1, 1,
0.08065998, 1.255345, 0.6096729, 0, 0, 0, 1, 1,
0.0825825, 0.6831583, 0.124367, 0, 0, 0, 1, 1,
0.08465856, -0.02970515, 1.873342, 0, 0, 0, 1, 1,
0.08518621, -1.514912, 2.900348, 1, 1, 1, 1, 1,
0.08623607, -0.4241806, 3.088442, 1, 1, 1, 1, 1,
0.08687282, 1.376115, -1.137417, 1, 1, 1, 1, 1,
0.08773994, -0.05385744, 3.822028, 1, 1, 1, 1, 1,
0.08975613, 1.862952, 0.5109659, 1, 1, 1, 1, 1,
0.09139632, -1.359726, 3.677883, 1, 1, 1, 1, 1,
0.09337988, -0.5084556, 2.984253, 1, 1, 1, 1, 1,
0.09465218, -1.558195, 3.612184, 1, 1, 1, 1, 1,
0.1001921, -0.3504148, 2.797871, 1, 1, 1, 1, 1,
0.1100332, -1.165609, 2.297367, 1, 1, 1, 1, 1,
0.110185, 1.390648, 0.5050811, 1, 1, 1, 1, 1,
0.11085, -0.1477671, 2.912832, 1, 1, 1, 1, 1,
0.1118619, -0.5709318, 2.279395, 1, 1, 1, 1, 1,
0.117516, 1.527238, 0.1808443, 1, 1, 1, 1, 1,
0.1213766, 0.2482413, 2.806044, 1, 1, 1, 1, 1,
0.1262514, -0.285408, 1.286888, 0, 0, 1, 1, 1,
0.1280308, 0.2703343, 0.2351214, 1, 0, 0, 1, 1,
0.1296346, -0.8615775, 3.366648, 1, 0, 0, 1, 1,
0.1333127, 0.5041689, 0.5223086, 1, 0, 0, 1, 1,
0.133365, -0.3555478, 3.413383, 1, 0, 0, 1, 1,
0.1362991, 0.07480115, 2.323174, 1, 0, 0, 1, 1,
0.1401563, -1.613784, 3.516925, 0, 0, 0, 1, 1,
0.1437285, 0.0552543, -0.2008115, 0, 0, 0, 1, 1,
0.1439058, 0.5747748, -0.8724151, 0, 0, 0, 1, 1,
0.1458849, -0.7211242, 3.024242, 0, 0, 0, 1, 1,
0.1461463, 0.02155992, 2.45695, 0, 0, 0, 1, 1,
0.1500953, 0.3763409, 0.2331119, 0, 0, 0, 1, 1,
0.1605093, 0.1978037, 1.176429, 0, 0, 0, 1, 1,
0.1635866, -0.270412, 2.668596, 1, 1, 1, 1, 1,
0.1697626, 0.6867685, 0.6357211, 1, 1, 1, 1, 1,
0.1701456, -1.343179, 5.885133, 1, 1, 1, 1, 1,
0.1706261, -1.838241, 4.404268, 1, 1, 1, 1, 1,
0.1747284, 0.8948364, 2.245735, 1, 1, 1, 1, 1,
0.1769207, -1.640366, 2.691537, 1, 1, 1, 1, 1,
0.1811235, 1.622686, 0.3253115, 1, 1, 1, 1, 1,
0.1854181, -0.2868144, 2.93593, 1, 1, 1, 1, 1,
0.1947412, 1.460155, -0.3434096, 1, 1, 1, 1, 1,
0.1972696, 0.0295283, 1.243537, 1, 1, 1, 1, 1,
0.2005113, -0.8919947, 1.570902, 1, 1, 1, 1, 1,
0.2024395, 0.4493378, 0.01270521, 1, 1, 1, 1, 1,
0.2078728, -1.139367, 3.575334, 1, 1, 1, 1, 1,
0.2095618, 2.046032, -0.9240286, 1, 1, 1, 1, 1,
0.2131485, -0.5811381, 2.262478, 1, 1, 1, 1, 1,
0.2187441, 0.2238, 2.411852, 0, 0, 1, 1, 1,
0.2226497, 2.103216, -1.895755, 1, 0, 0, 1, 1,
0.2242315, -1.352855, 2.068573, 1, 0, 0, 1, 1,
0.2269089, -0.9895447, 2.794167, 1, 0, 0, 1, 1,
0.2273063, -0.306031, 2.010846, 1, 0, 0, 1, 1,
0.2278855, 1.429968, -0.908212, 1, 0, 0, 1, 1,
0.2338666, 1.4899, 0.3562018, 0, 0, 0, 1, 1,
0.2356997, -0.1980071, 0.9387658, 0, 0, 0, 1, 1,
0.2407946, 1.083227, -0.1079807, 0, 0, 0, 1, 1,
0.2428178, 0.8286405, 0.1494596, 0, 0, 0, 1, 1,
0.2430751, -0.5823215, 1.666526, 0, 0, 0, 1, 1,
0.2434534, -0.5216699, 3.377117, 0, 0, 0, 1, 1,
0.2443496, 1.063579, -0.3354163, 0, 0, 0, 1, 1,
0.2453327, -1.237227, 2.80329, 1, 1, 1, 1, 1,
0.2460306, -1.0244, 1.915862, 1, 1, 1, 1, 1,
0.2470346, -1.606547, 2.519007, 1, 1, 1, 1, 1,
0.2493263, -0.2596349, 5.257771, 1, 1, 1, 1, 1,
0.2502909, 1.442956, 1.676531, 1, 1, 1, 1, 1,
0.2563111, 0.4533098, 0.3012174, 1, 1, 1, 1, 1,
0.2570929, 0.01552103, 1.691063, 1, 1, 1, 1, 1,
0.2612849, -0.7330387, 1.747823, 1, 1, 1, 1, 1,
0.2663622, -1.353096, 3.600408, 1, 1, 1, 1, 1,
0.2683155, -1.804416, 4.956887, 1, 1, 1, 1, 1,
0.2698598, -0.7003679, 2.784727, 1, 1, 1, 1, 1,
0.2709605, 0.04028432, 2.357522, 1, 1, 1, 1, 1,
0.2727624, 2.502181, 0.1871082, 1, 1, 1, 1, 1,
0.2761836, 0.06512018, 2.363612, 1, 1, 1, 1, 1,
0.2771149, -2.161887, 2.922687, 1, 1, 1, 1, 1,
0.2797139, -2.299897, 4.536183, 0, 0, 1, 1, 1,
0.282407, -1.372468, 2.606009, 1, 0, 0, 1, 1,
0.2829115, -0.3504211, 2.956408, 1, 0, 0, 1, 1,
0.2856998, 0.2615677, 0.2344387, 1, 0, 0, 1, 1,
0.2872327, 1.244568, -0.05544467, 1, 0, 0, 1, 1,
0.2915748, 0.513801, -0.002985595, 1, 0, 0, 1, 1,
0.2995091, -0.5962621, 3.250515, 0, 0, 0, 1, 1,
0.3022529, 0.3508107, 1.579694, 0, 0, 0, 1, 1,
0.3033589, 0.2219068, 0.319475, 0, 0, 0, 1, 1,
0.3039973, -0.06557865, 2.545805, 0, 0, 0, 1, 1,
0.3068951, -0.8597136, 0.9024958, 0, 0, 0, 1, 1,
0.3069219, -1.032738, 1.497547, 0, 0, 0, 1, 1,
0.3091804, -0.3672215, 1.862644, 0, 0, 0, 1, 1,
0.3108349, 1.594102, -0.6858218, 1, 1, 1, 1, 1,
0.3112475, 0.4503899, 1.322068, 1, 1, 1, 1, 1,
0.3119127, -0.4961541, 2.711805, 1, 1, 1, 1, 1,
0.3168157, -0.8114515, 4.630032, 1, 1, 1, 1, 1,
0.3267802, -1.584697, 3.100056, 1, 1, 1, 1, 1,
0.3281078, -0.04107796, 1.869964, 1, 1, 1, 1, 1,
0.3296923, 0.08928626, 0.23974, 1, 1, 1, 1, 1,
0.3297198, 0.8337618, 0.9873889, 1, 1, 1, 1, 1,
0.3333976, 0.2433538, 1.562742, 1, 1, 1, 1, 1,
0.3358042, -0.8109027, 2.83317, 1, 1, 1, 1, 1,
0.3377283, 0.3984154, -0.4709359, 1, 1, 1, 1, 1,
0.3433099, -0.8297115, 1.506723, 1, 1, 1, 1, 1,
0.3452829, -0.7799022, 2.351597, 1, 1, 1, 1, 1,
0.3476154, 0.4300778, -0.4404297, 1, 1, 1, 1, 1,
0.3534441, 0.3832135, 0.9185585, 1, 1, 1, 1, 1,
0.3586604, 0.02346887, 1.767943, 0, 0, 1, 1, 1,
0.3682738, 0.7402202, -0.7745071, 1, 0, 0, 1, 1,
0.3688889, 1.48791, 0.8439897, 1, 0, 0, 1, 1,
0.3702775, -1.502606, 3.352022, 1, 0, 0, 1, 1,
0.3722571, 1.3668, 1.186685, 1, 0, 0, 1, 1,
0.3724737, -0.6933846, 3.328674, 1, 0, 0, 1, 1,
0.3735612, -0.9249471, 2.975209, 0, 0, 0, 1, 1,
0.375549, -0.9944136, 2.006973, 0, 0, 0, 1, 1,
0.3868682, -0.7943586, 1.341571, 0, 0, 0, 1, 1,
0.3910336, -2.400511, 3.487005, 0, 0, 0, 1, 1,
0.3963429, 0.8261276, 2.00631, 0, 0, 0, 1, 1,
0.3986309, 1.07088, 2.518952, 0, 0, 0, 1, 1,
0.4073979, 0.8319931, -0.4874091, 0, 0, 0, 1, 1,
0.4101483, -1.367738, 3.514437, 1, 1, 1, 1, 1,
0.4184954, -0.3186981, 1.100122, 1, 1, 1, 1, 1,
0.4197311, 0.289003, 0.6207727, 1, 1, 1, 1, 1,
0.4277454, -0.448727, 1.882475, 1, 1, 1, 1, 1,
0.4278993, 1.140782, 0.9634136, 1, 1, 1, 1, 1,
0.4328588, -0.6714469, 2.577206, 1, 1, 1, 1, 1,
0.4375027, -0.4281531, 1.803666, 1, 1, 1, 1, 1,
0.4406036, -1.870125, 0.7717683, 1, 1, 1, 1, 1,
0.4421106, 0.2599152, 0.4727548, 1, 1, 1, 1, 1,
0.4424575, -0.8594281, 2.980721, 1, 1, 1, 1, 1,
0.4534276, -1.976526, 3.51624, 1, 1, 1, 1, 1,
0.4620699, -1.71441, 3.036206, 1, 1, 1, 1, 1,
0.4631328, 0.4319889, 1.774921, 1, 1, 1, 1, 1,
0.4633077, 0.1634943, 3.144508, 1, 1, 1, 1, 1,
0.4662285, 0.3176257, 0.9213766, 1, 1, 1, 1, 1,
0.4688107, 0.2700181, -1.140454, 0, 0, 1, 1, 1,
0.4690934, -0.3052413, 1.639298, 1, 0, 0, 1, 1,
0.4755466, -1.123215, 2.488252, 1, 0, 0, 1, 1,
0.4793849, 0.81972, 1.039832, 1, 0, 0, 1, 1,
0.4845724, 0.8515898, -0.09004214, 1, 0, 0, 1, 1,
0.491988, -0.562997, 3.433167, 1, 0, 0, 1, 1,
0.4921743, 0.2234942, -1.119653, 0, 0, 0, 1, 1,
0.4981298, 0.2900806, -0.5063471, 0, 0, 0, 1, 1,
0.5033328, -0.6380659, 2.737013, 0, 0, 0, 1, 1,
0.5050688, 0.5484049, 1.404002, 0, 0, 0, 1, 1,
0.5059699, -0.08088233, 2.644044, 0, 0, 0, 1, 1,
0.5077064, -0.8020448, 0.4610693, 0, 0, 0, 1, 1,
0.5173313, 0.1970376, 1.666226, 0, 0, 0, 1, 1,
0.5224161, -1.475933, 2.965355, 1, 1, 1, 1, 1,
0.522919, -1.533071, 3.300293, 1, 1, 1, 1, 1,
0.5338591, 0.3097679, 1.905515, 1, 1, 1, 1, 1,
0.5384704, 1.168276, 1.644847, 1, 1, 1, 1, 1,
0.5385765, 0.4611985, 0.2673131, 1, 1, 1, 1, 1,
0.5411843, -0.9647265, 1.288721, 1, 1, 1, 1, 1,
0.5412676, 0.4829645, 1.360228, 1, 1, 1, 1, 1,
0.5419554, -0.5711503, 1.347004, 1, 1, 1, 1, 1,
0.5495561, -0.9756085, 3.313716, 1, 1, 1, 1, 1,
0.5506318, 0.7465239, 0.7415994, 1, 1, 1, 1, 1,
0.5540109, -0.6148365, 3.544392, 1, 1, 1, 1, 1,
0.55783, -0.605676, 2.2881, 1, 1, 1, 1, 1,
0.558753, -1.335952, 2.135192, 1, 1, 1, 1, 1,
0.559477, 0.456425, 0.2800967, 1, 1, 1, 1, 1,
0.5636709, 0.7177952, 0.5816229, 1, 1, 1, 1, 1,
0.5646867, -2.549717, 2.881981, 0, 0, 1, 1, 1,
0.572193, 0.1726474, -0.09810988, 1, 0, 0, 1, 1,
0.5750888, 0.6687466, 0.7413802, 1, 0, 0, 1, 1,
0.5810845, -0.2544296, 1.3107, 1, 0, 0, 1, 1,
0.5827987, -1.806666, 2.512715, 1, 0, 0, 1, 1,
0.5876293, 2.12141, 2.364472, 1, 0, 0, 1, 1,
0.5881712, -0.2510188, 1.974099, 0, 0, 0, 1, 1,
0.5900087, -0.7907495, 1.544024, 0, 0, 0, 1, 1,
0.5928012, -0.3434436, 0.9211631, 0, 0, 0, 1, 1,
0.5982159, -1.076887, 2.310167, 0, 0, 0, 1, 1,
0.600069, 0.538965, 0.826758, 0, 0, 0, 1, 1,
0.6119245, -0.4256626, 2.328526, 0, 0, 0, 1, 1,
0.6119632, 1.592947, 0.7733986, 0, 0, 0, 1, 1,
0.6178847, 1.14812, 0.1509001, 1, 1, 1, 1, 1,
0.6210335, 0.325411, 1.049806, 1, 1, 1, 1, 1,
0.6254956, -0.1760103, 1.723861, 1, 1, 1, 1, 1,
0.6268406, -0.8333901, 2.722066, 1, 1, 1, 1, 1,
0.6344452, -0.423212, 2.162526, 1, 1, 1, 1, 1,
0.6361511, -0.8593601, 4.824928, 1, 1, 1, 1, 1,
0.6366847, -0.1134702, 1.040609, 1, 1, 1, 1, 1,
0.6379191, -0.7416092, 2.475218, 1, 1, 1, 1, 1,
0.6404814, -1.322611, 3.493892, 1, 1, 1, 1, 1,
0.6436971, 0.5435485, 3.465914, 1, 1, 1, 1, 1,
0.6479408, 1.44752, -0.9614755, 1, 1, 1, 1, 1,
0.6485939, -0.3908066, 2.261283, 1, 1, 1, 1, 1,
0.6488813, 2.382112, 0.4205302, 1, 1, 1, 1, 1,
0.6531322, 1.01658, 0.7138323, 1, 1, 1, 1, 1,
0.6565638, -0.9886145, 4.259574, 1, 1, 1, 1, 1,
0.6654033, 0.6710824, -0.5492352, 0, 0, 1, 1, 1,
0.6676997, 0.138302, 0.5187152, 1, 0, 0, 1, 1,
0.6691923, -0.8941829, 3.161101, 1, 0, 0, 1, 1,
0.6699171, -0.3164176, 2.605415, 1, 0, 0, 1, 1,
0.6742985, -0.4708769, 1.261861, 1, 0, 0, 1, 1,
0.675705, 0.829244, 0.1629497, 1, 0, 0, 1, 1,
0.6784681, -0.2938251, 3.724054, 0, 0, 0, 1, 1,
0.6792691, -0.02222927, 3.252713, 0, 0, 0, 1, 1,
0.6797766, 0.383797, 1.424908, 0, 0, 0, 1, 1,
0.6817542, 1.063595, 0.341475, 0, 0, 0, 1, 1,
0.6825376, 0.540609, 1.201735, 0, 0, 0, 1, 1,
0.6882151, 1.260306, 1.662229, 0, 0, 0, 1, 1,
0.6910673, 0.7038413, 0.6618703, 0, 0, 0, 1, 1,
0.691081, 0.4075834, 1.653611, 1, 1, 1, 1, 1,
0.7003767, -1.432824, 3.016235, 1, 1, 1, 1, 1,
0.7028354, -0.1037999, 1.764999, 1, 1, 1, 1, 1,
0.7072873, -1.125039, 1.262223, 1, 1, 1, 1, 1,
0.7086859, -0.6856707, 2.576229, 1, 1, 1, 1, 1,
0.7104275, 0.5261287, 1.10052, 1, 1, 1, 1, 1,
0.711966, 1.389471, 1.990928, 1, 1, 1, 1, 1,
0.7139571, 0.2335242, 0.8490875, 1, 1, 1, 1, 1,
0.7153348, -1.01032, 2.352439, 1, 1, 1, 1, 1,
0.7170798, 0.706587, 2.33614, 1, 1, 1, 1, 1,
0.7204205, 0.5912744, 2.869124, 1, 1, 1, 1, 1,
0.7248126, -0.1191583, -0.1553616, 1, 1, 1, 1, 1,
0.7251378, 0.6597053, 2.297523, 1, 1, 1, 1, 1,
0.72614, -0.1196367, 1.418322, 1, 1, 1, 1, 1,
0.7262802, -0.6209934, 1.697528, 1, 1, 1, 1, 1,
0.7292956, 1.077478, 0.25223, 0, 0, 1, 1, 1,
0.7323125, -0.4056343, 1.70222, 1, 0, 0, 1, 1,
0.7366918, 0.1215262, 2.342914, 1, 0, 0, 1, 1,
0.7442822, 0.7436651, -0.02596672, 1, 0, 0, 1, 1,
0.7479269, 0.3243214, 1.105134, 1, 0, 0, 1, 1,
0.7486529, 1.21439, -0.1414097, 1, 0, 0, 1, 1,
0.7526816, -1.39636, 3.416019, 0, 0, 0, 1, 1,
0.7538091, -0.6427271, 3.243767, 0, 0, 0, 1, 1,
0.7649601, 0.2526495, 0.4193237, 0, 0, 0, 1, 1,
0.7658355, -0.3292272, 0.0304285, 0, 0, 0, 1, 1,
0.7660033, 0.7582001, 0.3687583, 0, 0, 0, 1, 1,
0.7702326, -1.964262, 2.463297, 0, 0, 0, 1, 1,
0.7805296, -0.007129542, 3.279855, 0, 0, 0, 1, 1,
0.7826685, -2.112006, 2.957418, 1, 1, 1, 1, 1,
0.7854788, 0.9078867, 1.931705, 1, 1, 1, 1, 1,
0.7905377, -1.467133, 1.194587, 1, 1, 1, 1, 1,
0.7967603, 0.7653303, 0.06003641, 1, 1, 1, 1, 1,
0.7998919, 2.097831, -0.428738, 1, 1, 1, 1, 1,
0.8036326, 0.1693083, 3.328898, 1, 1, 1, 1, 1,
0.8051057, -2.808012, 2.886418, 1, 1, 1, 1, 1,
0.8090039, 1.349624, 0.110031, 1, 1, 1, 1, 1,
0.8156207, -1.391237, 1.413955, 1, 1, 1, 1, 1,
0.8306365, 0.2181555, 0.7895815, 1, 1, 1, 1, 1,
0.83333, 0.06113826, 0.3021791, 1, 1, 1, 1, 1,
0.8342028, 0.4682035, 0.8480925, 1, 1, 1, 1, 1,
0.8399012, 0.7490362, 0.6356682, 1, 1, 1, 1, 1,
0.8549374, -0.9430903, 2.12543, 1, 1, 1, 1, 1,
0.8709907, -1.670069, 2.471632, 1, 1, 1, 1, 1,
0.8716606, 0.8601328, 1.650915, 0, 0, 1, 1, 1,
0.8762671, 1.204522, 0.872025, 1, 0, 0, 1, 1,
0.877251, 0.9085311, 1.914922, 1, 0, 0, 1, 1,
0.8800341, -0.4685242, 1.83327, 1, 0, 0, 1, 1,
0.8805894, -0.5667787, 1.195734, 1, 0, 0, 1, 1,
0.8889356, -0.2859183, 1.945813, 1, 0, 0, 1, 1,
0.892184, 1.352193, 0.6985609, 0, 0, 0, 1, 1,
0.8983858, -0.09594859, 2.589506, 0, 0, 0, 1, 1,
0.8995759, 1.765316, -0.7315375, 0, 0, 0, 1, 1,
0.903221, 0.3797216, 1.725058, 0, 0, 0, 1, 1,
0.9048303, 0.145866, 1.519906, 0, 0, 0, 1, 1,
0.9109034, -1.169342, 2.422323, 0, 0, 0, 1, 1,
0.9110879, 2.064271, 0.3807583, 0, 0, 0, 1, 1,
0.9176798, -1.267671, 2.442446, 1, 1, 1, 1, 1,
0.9190413, -1.682679, 1.476919, 1, 1, 1, 1, 1,
0.9355288, 1.186321, 0.794852, 1, 1, 1, 1, 1,
0.9364359, -0.57881, 2.243658, 1, 1, 1, 1, 1,
0.940908, -1.171382, 3.290159, 1, 1, 1, 1, 1,
0.9411753, 1.652025, 1.330499, 1, 1, 1, 1, 1,
0.9432763, -0.6072183, 3.882101, 1, 1, 1, 1, 1,
0.9492888, -1.32538, 4.41738, 1, 1, 1, 1, 1,
0.9535285, -0.537939, 1.770425, 1, 1, 1, 1, 1,
0.9600499, -0.7486985, 2.810867, 1, 1, 1, 1, 1,
0.9607493, 1.242513, 0.5501032, 1, 1, 1, 1, 1,
0.9670816, -1.034636, 1.524391, 1, 1, 1, 1, 1,
0.9680132, -0.09939383, 1.377507, 1, 1, 1, 1, 1,
0.9725736, -3.382462, 2.86934, 1, 1, 1, 1, 1,
0.9727859, -0.3531619, 3.116583, 1, 1, 1, 1, 1,
0.9745876, -0.2942929, 1.147695, 0, 0, 1, 1, 1,
0.9764957, -2.047603, 3.853596, 1, 0, 0, 1, 1,
0.9776805, -0.2618711, 2.919298, 1, 0, 0, 1, 1,
0.9776838, -1.044175, 1.240513, 1, 0, 0, 1, 1,
0.979535, 1.924133, -0.1518269, 1, 0, 0, 1, 1,
0.9816236, 1.414513, 0.4660732, 1, 0, 0, 1, 1,
0.9868121, -0.4248654, 3.219136, 0, 0, 0, 1, 1,
0.9878343, -1.706582, 0.4374872, 0, 0, 0, 1, 1,
0.9888992, -0.4267336, 1.791861, 0, 0, 0, 1, 1,
0.9995273, -0.09961286, 1.120752, 0, 0, 0, 1, 1,
1.000176, 0.3170567, 2.218536, 0, 0, 0, 1, 1,
1.000322, 0.6815076, 3.357309, 0, 0, 0, 1, 1,
1.00098, -0.5113525, 2.671505, 0, 0, 0, 1, 1,
1.003733, -0.791117, 3.802833, 1, 1, 1, 1, 1,
1.004, 0.1493059, 1.517803, 1, 1, 1, 1, 1,
1.006836, -1.144067, 2.631744, 1, 1, 1, 1, 1,
1.006993, 0.4579097, 1.65624, 1, 1, 1, 1, 1,
1.007904, -0.6393282, 2.553752, 1, 1, 1, 1, 1,
1.011897, -0.806232, 2.198098, 1, 1, 1, 1, 1,
1.012774, 1.455638, 2.452006, 1, 1, 1, 1, 1,
1.016905, 0.1347332, 1.78351, 1, 1, 1, 1, 1,
1.018188, -1.347489, 0.8102489, 1, 1, 1, 1, 1,
1.022118, 0.1629181, 2.156268, 1, 1, 1, 1, 1,
1.047258, -0.3911601, 0.9075102, 1, 1, 1, 1, 1,
1.051609, 0.7083129, 0.6267672, 1, 1, 1, 1, 1,
1.057844, -0.5273281, 1.780512, 1, 1, 1, 1, 1,
1.064666, -0.3094665, 4.215744, 1, 1, 1, 1, 1,
1.067613, -0.2939663, 2.559057, 1, 1, 1, 1, 1,
1.070121, -0.08467841, 1.119275, 0, 0, 1, 1, 1,
1.074198, 0.2458787, 1.629682, 1, 0, 0, 1, 1,
1.083015, 0.4078064, 1.175618, 1, 0, 0, 1, 1,
1.09848, 2.099273, 1.051908, 1, 0, 0, 1, 1,
1.103447, 0.426904, 1.32652, 1, 0, 0, 1, 1,
1.10668, 1.04589, 1.039835, 1, 0, 0, 1, 1,
1.108442, -1.702015, 3.694538, 0, 0, 0, 1, 1,
1.113683, 2.245162, -0.7755681, 0, 0, 0, 1, 1,
1.115818, 0.04138487, 0.8562824, 0, 0, 0, 1, 1,
1.119162, -0.5301967, 0.5568931, 0, 0, 0, 1, 1,
1.120466, -1.968721, 2.972021, 0, 0, 0, 1, 1,
1.122761, 0.4753516, 0.9396457, 0, 0, 0, 1, 1,
1.129607, 0.8945625, 0.5600108, 0, 0, 0, 1, 1,
1.132226, -0.5259027, 3.282998, 1, 1, 1, 1, 1,
1.134327, 0.7529639, 1.079764, 1, 1, 1, 1, 1,
1.135387, -1.171897, 2.224961, 1, 1, 1, 1, 1,
1.135388, 1.050385, 0.7995304, 1, 1, 1, 1, 1,
1.135735, -1.115455, 1.156129, 1, 1, 1, 1, 1,
1.136873, 0.006990901, 2.17018, 1, 1, 1, 1, 1,
1.1498, 0.8835867, -0.6428596, 1, 1, 1, 1, 1,
1.150807, 0.3475761, 3.622227, 1, 1, 1, 1, 1,
1.151339, 0.07162081, 1.238809, 1, 1, 1, 1, 1,
1.152899, -0.4583831, 1.904382, 1, 1, 1, 1, 1,
1.164233, 1.157566, 1.58156, 1, 1, 1, 1, 1,
1.164769, -0.5954407, 2.612096, 1, 1, 1, 1, 1,
1.168107, -0.5440435, 2.157119, 1, 1, 1, 1, 1,
1.171704, 0.5899432, 0.9241351, 1, 1, 1, 1, 1,
1.175653, -0.937669, 1.245012, 1, 1, 1, 1, 1,
1.177224, 1.849334, -0.2975015, 0, 0, 1, 1, 1,
1.177676, -0.2865053, 3.006967, 1, 0, 0, 1, 1,
1.186538, -0.4131017, 2.203606, 1, 0, 0, 1, 1,
1.199762, -0.8649653, 1.526352, 1, 0, 0, 1, 1,
1.20613, 1.330762, 0.7725534, 1, 0, 0, 1, 1,
1.215036, -1.770769, 3.830974, 1, 0, 0, 1, 1,
1.215231, 0.3188325, 2.147105, 0, 0, 0, 1, 1,
1.215409, -0.1089709, 0.1495563, 0, 0, 0, 1, 1,
1.217499, 0.9165425, 2.180177, 0, 0, 0, 1, 1,
1.21893, 1.043751, -0.2433395, 0, 0, 0, 1, 1,
1.22101, 0.2569955, 2.311888, 0, 0, 0, 1, 1,
1.222847, 0.3033974, 0.9918193, 0, 0, 0, 1, 1,
1.224866, 0.6479918, 0.1788741, 0, 0, 0, 1, 1,
1.230101, -0.5640757, 1.080593, 1, 1, 1, 1, 1,
1.231328, 2.307529, 1.385774, 1, 1, 1, 1, 1,
1.23871, 0.4592769, 3.403642, 1, 1, 1, 1, 1,
1.241878, 1.984189, 0.9178241, 1, 1, 1, 1, 1,
1.242108, 0.7132427, 0.4112189, 1, 1, 1, 1, 1,
1.242381, -0.5435283, 1.548987, 1, 1, 1, 1, 1,
1.244919, 0.2523212, 0.8336211, 1, 1, 1, 1, 1,
1.251121, 0.7349445, 1.065062, 1, 1, 1, 1, 1,
1.256503, 1.466833, -0.209222, 1, 1, 1, 1, 1,
1.259781, 0.6747165, -0.401451, 1, 1, 1, 1, 1,
1.260137, -1.486435, 2.004215, 1, 1, 1, 1, 1,
1.268582, -0.2678745, 1.318106, 1, 1, 1, 1, 1,
1.279058, -0.5040818, 0.4687769, 1, 1, 1, 1, 1,
1.279306, -0.3225788, 1.347383, 1, 1, 1, 1, 1,
1.28502, -0.6169061, 1.193697, 1, 1, 1, 1, 1,
1.292001, 0.7048085, -0.5937234, 0, 0, 1, 1, 1,
1.294673, 0.4383669, 1.577848, 1, 0, 0, 1, 1,
1.299568, -1.620868, 1.542793, 1, 0, 0, 1, 1,
1.305057, 0.3765112, 0.07783418, 1, 0, 0, 1, 1,
1.307265, 0.9179332, 1.791076, 1, 0, 0, 1, 1,
1.308938, 0.06746911, 0.4779504, 1, 0, 0, 1, 1,
1.30922, 2.30894, 0.9672159, 0, 0, 0, 1, 1,
1.310792, -1.046617, 2.819225, 0, 0, 0, 1, 1,
1.336688, -1.138763, 2.7989, 0, 0, 0, 1, 1,
1.337587, -0.1268297, 0.5393988, 0, 0, 0, 1, 1,
1.351553, 0.4272482, 1.879395, 0, 0, 0, 1, 1,
1.359674, -0.0668138, 2.744159, 0, 0, 0, 1, 1,
1.360818, 0.7825669, 0.8797604, 0, 0, 0, 1, 1,
1.366272, 0.5348749, 1.367428, 1, 1, 1, 1, 1,
1.370309, 0.4309922, 0.9671114, 1, 1, 1, 1, 1,
1.372978, -0.3889082, 1.682398, 1, 1, 1, 1, 1,
1.379299, -0.9546514, 5.436958, 1, 1, 1, 1, 1,
1.383401, -1.425411, 1.562112, 1, 1, 1, 1, 1,
1.3869, 0.1839444, -0.1667518, 1, 1, 1, 1, 1,
1.387182, -0.400056, 1.866866, 1, 1, 1, 1, 1,
1.389068, -0.1968122, 2.646538, 1, 1, 1, 1, 1,
1.390202, 0.363782, 1.485946, 1, 1, 1, 1, 1,
1.395627, 0.6845633, 1.94105, 1, 1, 1, 1, 1,
1.40125, -1.647879, 1.603157, 1, 1, 1, 1, 1,
1.407859, 0.384023, -1.371428, 1, 1, 1, 1, 1,
1.421372, 1.310272, 1.152682, 1, 1, 1, 1, 1,
1.422657, -1.111646, 1.381345, 1, 1, 1, 1, 1,
1.429596, 0.2092759, 2.421582, 1, 1, 1, 1, 1,
1.431514, 0.9856361, 0.84844, 0, 0, 1, 1, 1,
1.437036, -1.475133, 2.212882, 1, 0, 0, 1, 1,
1.437715, -0.5271807, 2.225267, 1, 0, 0, 1, 1,
1.441223, 0.5682039, 1.664806, 1, 0, 0, 1, 1,
1.450671, -0.9278592, 0.009108019, 1, 0, 0, 1, 1,
1.469084, 0.7587851, 0.9665194, 1, 0, 0, 1, 1,
1.482812, -1.260839, 2.696707, 0, 0, 0, 1, 1,
1.485484, 0.9276302, 1.824951, 0, 0, 0, 1, 1,
1.487694, -0.4101179, 1.171116, 0, 0, 0, 1, 1,
1.490947, 0.9775547, 1.98621, 0, 0, 0, 1, 1,
1.510948, 0.2264731, 0.7108828, 0, 0, 0, 1, 1,
1.525275, 1.613284, 0.5559217, 0, 0, 0, 1, 1,
1.528501, 0.08210844, 1.589706, 0, 0, 0, 1, 1,
1.53834, 0.4176699, 1.891851, 1, 1, 1, 1, 1,
1.53982, 0.3119845, 1.469007, 1, 1, 1, 1, 1,
1.54952, 0.7261063, 0.9466482, 1, 1, 1, 1, 1,
1.568562, -0.5656239, 2.040112, 1, 1, 1, 1, 1,
1.568925, 1.425974, 1.067405, 1, 1, 1, 1, 1,
1.569746, 0.7672853, 2.667274, 1, 1, 1, 1, 1,
1.570847, 1.881044, 0.4331947, 1, 1, 1, 1, 1,
1.576606, 0.1101137, -0.8495933, 1, 1, 1, 1, 1,
1.582109, -0.0639695, 2.053038, 1, 1, 1, 1, 1,
1.58541, -0.4154333, 2.718591, 1, 1, 1, 1, 1,
1.59524, 0.5984808, 0.1737304, 1, 1, 1, 1, 1,
1.597759, -0.5306249, 3.476588, 1, 1, 1, 1, 1,
1.611113, 0.8245444, -0.08641789, 1, 1, 1, 1, 1,
1.626298, -0.2261243, 1.411331, 1, 1, 1, 1, 1,
1.628771, -1.85415, 3.561388, 1, 1, 1, 1, 1,
1.64792, 0.01121704, 1.395125, 0, 0, 1, 1, 1,
1.649112, 0.4988455, 1.321106, 1, 0, 0, 1, 1,
1.658597, 1.255266, 1.555755, 1, 0, 0, 1, 1,
1.659466, -1.138677, 0.6590183, 1, 0, 0, 1, 1,
1.662419, 0.6772698, 0.8712915, 1, 0, 0, 1, 1,
1.674131, -0.5217465, 2.030392, 1, 0, 0, 1, 1,
1.674424, -0.548165, 1.003427, 0, 0, 0, 1, 1,
1.689917, -1.276929, 2.379764, 0, 0, 0, 1, 1,
1.692846, 1.595469, 0.4149283, 0, 0, 0, 1, 1,
1.696557, -2.070368, 2.557263, 0, 0, 0, 1, 1,
1.752415, 0.7257046, 2.266911, 0, 0, 0, 1, 1,
1.782204, 0.1966607, 3.345521, 0, 0, 0, 1, 1,
1.833803, 2.325871, 1.089826, 0, 0, 0, 1, 1,
1.864294, 1.263321, 1.637984, 1, 1, 1, 1, 1,
1.874005, -0.0709738, 2.215786, 1, 1, 1, 1, 1,
1.882942, 0.2411392, -0.4601633, 1, 1, 1, 1, 1,
1.933175, -0.9084929, 1.255324, 1, 1, 1, 1, 1,
1.965085, 1.390936, 1.427681, 1, 1, 1, 1, 1,
1.967716, 0.2487473, 1.52616, 1, 1, 1, 1, 1,
1.968598, -0.6371093, 1.690899, 1, 1, 1, 1, 1,
1.973803, -0.3749723, 0.916208, 1, 1, 1, 1, 1,
1.97595, 0.06391007, 0.7059907, 1, 1, 1, 1, 1,
2.037986, 1.904523, 2.475857, 1, 1, 1, 1, 1,
2.053344, -0.0834659, 0.7656428, 1, 1, 1, 1, 1,
2.056767, -0.1084679, 2.647625, 1, 1, 1, 1, 1,
2.067563, -0.01179564, 1.284796, 1, 1, 1, 1, 1,
2.077274, -0.5823966, 1.341341, 1, 1, 1, 1, 1,
2.085213, 0.937005, -1.025742, 1, 1, 1, 1, 1,
2.153085, 0.761063, -0.6224189, 0, 0, 1, 1, 1,
2.154375, -2.723256, 2.647043, 1, 0, 0, 1, 1,
2.16411, 1.141727, 0.375369, 1, 0, 0, 1, 1,
2.218215, 0.3541166, 1.847069, 1, 0, 0, 1, 1,
2.221151, -0.9608246, 1.861419, 1, 0, 0, 1, 1,
2.230786, 0.04028544, 1.900976, 1, 0, 0, 1, 1,
2.235199, 1.290829, 1.468655, 0, 0, 0, 1, 1,
2.34028, -0.6200134, 2.064652, 0, 0, 0, 1, 1,
2.401553, -0.03322409, 0.6235979, 0, 0, 0, 1, 1,
2.417639, 0.727653, 3.068488, 0, 0, 0, 1, 1,
2.428249, -0.104752, 1.612301, 0, 0, 0, 1, 1,
2.431011, -0.9790898, 1.234488, 0, 0, 0, 1, 1,
2.480607, -1.428133, 1.342147, 0, 0, 0, 1, 1,
2.486499, -2.045957, 5.1425, 1, 1, 1, 1, 1,
2.486918, -1.053138, 2.37919, 1, 1, 1, 1, 1,
2.512346, 3.468801, 0.8114523, 1, 1, 1, 1, 1,
2.541178, 1.799349, 1.242227, 1, 1, 1, 1, 1,
2.614629, 1.300254, 0.6982322, 1, 1, 1, 1, 1,
2.837601, -0.03476919, 1.272908, 1, 1, 1, 1, 1,
2.845425, -0.3786463, 2.366784, 1, 1, 1, 1, 1
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
var radius = 9.695056;
var distance = 34.05347;
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
mvMatrix.translate( 0.2052678, -0.04316926, -0.4286053 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.05347);
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
