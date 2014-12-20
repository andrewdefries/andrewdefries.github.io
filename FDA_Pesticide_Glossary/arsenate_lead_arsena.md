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
-2.986016, -0.2748899, -2.351688, 1, 0, 0, 1,
-2.846744, -0.3969523, -2.593366, 1, 0.007843138, 0, 1,
-2.829332, 1.540731, -1.433092, 1, 0.01176471, 0, 1,
-2.82478, -0.07753289, -1.068278, 1, 0.01960784, 0, 1,
-2.7947, -2.031512, -3.28035, 1, 0.02352941, 0, 1,
-2.787828, -0.1239719, -0.7615991, 1, 0.03137255, 0, 1,
-2.60381, 0.6229675, -0.426328, 1, 0.03529412, 0, 1,
-2.602014, -1.120258, -3.268085, 1, 0.04313726, 0, 1,
-2.53973, -0.4705546, -2.381286, 1, 0.04705882, 0, 1,
-2.51563, -0.08581343, -2.218855, 1, 0.05490196, 0, 1,
-2.512103, -1.659339, -2.55303, 1, 0.05882353, 0, 1,
-2.369929, 0.09097303, -0.6471499, 1, 0.06666667, 0, 1,
-2.362843, -0.5255988, -3.736431, 1, 0.07058824, 0, 1,
-2.314374, 0.06303302, -0.2503295, 1, 0.07843138, 0, 1,
-2.289325, 1.110921, -0.08578775, 1, 0.08235294, 0, 1,
-2.285898, 0.4920844, -1.046387, 1, 0.09019608, 0, 1,
-2.278084, -1.407656, -1.74034, 1, 0.09411765, 0, 1,
-2.231223, 0.05804538, -1.013493, 1, 0.1019608, 0, 1,
-2.208007, -1.912997, -2.253147, 1, 0.1098039, 0, 1,
-2.1668, 0.4779702, -2.261707, 1, 0.1137255, 0, 1,
-2.158818, -0.7994624, -2.134516, 1, 0.1215686, 0, 1,
-2.154085, -1.581397, -2.118786, 1, 0.1254902, 0, 1,
-2.143982, 0.6882493, -1.028608, 1, 0.1333333, 0, 1,
-2.141103, 0.2539214, -1.925413, 1, 0.1372549, 0, 1,
-2.111013, -0.1092524, -1.040326, 1, 0.145098, 0, 1,
-2.084682, -0.4106889, -2.501051, 1, 0.1490196, 0, 1,
-2.038856, 0.5562878, -0.5389858, 1, 0.1568628, 0, 1,
-1.991855, -0.4432796, 0.02484484, 1, 0.1607843, 0, 1,
-1.974389, -0.4487777, -1.138427, 1, 0.1686275, 0, 1,
-1.963805, -0.2579497, -0.6187817, 1, 0.172549, 0, 1,
-1.962483, 0.3250995, -2.206454, 1, 0.1803922, 0, 1,
-1.954587, -1.285032, -1.753901, 1, 0.1843137, 0, 1,
-1.928769, -1.06469, -2.113802, 1, 0.1921569, 0, 1,
-1.927623, -0.9543967, -2.285333, 1, 0.1960784, 0, 1,
-1.919961, -0.5985062, -0.8611912, 1, 0.2039216, 0, 1,
-1.907255, 0.002329063, -1.01789, 1, 0.2117647, 0, 1,
-1.905762, 0.7594787, -1.908284, 1, 0.2156863, 0, 1,
-1.899798, -0.5347134, -2.109292, 1, 0.2235294, 0, 1,
-1.895764, -0.4502371, -1.613796, 1, 0.227451, 0, 1,
-1.859242, 0.3154022, -1.177577, 1, 0.2352941, 0, 1,
-1.853722, 0.08962153, -0.2210232, 1, 0.2392157, 0, 1,
-1.852841, -0.9505405, -0.7564746, 1, 0.2470588, 0, 1,
-1.848668, 2.490939, 0.9310479, 1, 0.2509804, 0, 1,
-1.848416, -1.185869, -3.266249, 1, 0.2588235, 0, 1,
-1.831506, 0.6304781, -2.434497, 1, 0.2627451, 0, 1,
-1.826192, 0.02192752, -0.223238, 1, 0.2705882, 0, 1,
-1.809652, -0.3960595, -2.697454, 1, 0.2745098, 0, 1,
-1.801633, 0.2749141, -1.933069, 1, 0.282353, 0, 1,
-1.798322, -0.3953634, -3.259804, 1, 0.2862745, 0, 1,
-1.796652, 0.5280797, -0.3657802, 1, 0.2941177, 0, 1,
-1.785441, 0.8770027, -0.9313765, 1, 0.3019608, 0, 1,
-1.77083, 1.298235, 0.06039774, 1, 0.3058824, 0, 1,
-1.760114, 0.7673672, -2.472226, 1, 0.3137255, 0, 1,
-1.749417, 1.155615, -2.089278, 1, 0.3176471, 0, 1,
-1.720289, -0.410549, -1.820918, 1, 0.3254902, 0, 1,
-1.717153, -0.2146806, -1.904177, 1, 0.3294118, 0, 1,
-1.665097, 0.07318538, 0.07485623, 1, 0.3372549, 0, 1,
-1.664483, 1.693363, -1.215219, 1, 0.3411765, 0, 1,
-1.650822, -0.6836222, -1.894186, 1, 0.3490196, 0, 1,
-1.649578, -0.5337809, -2.153738, 1, 0.3529412, 0, 1,
-1.640431, 0.7782609, -1.38487, 1, 0.3607843, 0, 1,
-1.640424, -0.5411453, -1.928864, 1, 0.3647059, 0, 1,
-1.63342, -0.05624065, 0.4693942, 1, 0.372549, 0, 1,
-1.609348, -0.3828098, -2.45493, 1, 0.3764706, 0, 1,
-1.584967, 1.376861, -0.8074269, 1, 0.3843137, 0, 1,
-1.572901, 0.5968562, -1.795384, 1, 0.3882353, 0, 1,
-1.560328, 0.03116968, -0.8084909, 1, 0.3960784, 0, 1,
-1.558676, -0.3863113, -1.898423, 1, 0.4039216, 0, 1,
-1.54911, 0.006696782, -0.6725675, 1, 0.4078431, 0, 1,
-1.533557, -0.2034782, -3.529873, 1, 0.4156863, 0, 1,
-1.520545, 0.7576361, -1.49624, 1, 0.4196078, 0, 1,
-1.519824, -0.003889873, -2.596865, 1, 0.427451, 0, 1,
-1.518144, -1.944003, -4.419846, 1, 0.4313726, 0, 1,
-1.508658, 1.701067, -0.6232732, 1, 0.4392157, 0, 1,
-1.505165, 0.9297832, -2.105709, 1, 0.4431373, 0, 1,
-1.489053, -0.2810902, -1.540222, 1, 0.4509804, 0, 1,
-1.486857, 1.750519, -1.124154, 1, 0.454902, 0, 1,
-1.480214, -0.8549636, -1.916331, 1, 0.4627451, 0, 1,
-1.479773, -0.2290541, -2.685777, 1, 0.4666667, 0, 1,
-1.477965, -0.1542992, -2.607432, 1, 0.4745098, 0, 1,
-1.471401, 0.6584328, -0.4817407, 1, 0.4784314, 0, 1,
-1.455518, -0.3613249, -2.425248, 1, 0.4862745, 0, 1,
-1.451737, 0.3534104, -1.645126, 1, 0.4901961, 0, 1,
-1.439282, -0.1344829, -1.454656, 1, 0.4980392, 0, 1,
-1.427863, 0.2171216, -1.092221, 1, 0.5058824, 0, 1,
-1.424752, 0.5812908, -0.5103711, 1, 0.509804, 0, 1,
-1.42086, -0.1638891, -4.120495, 1, 0.5176471, 0, 1,
-1.420795, 0.4953044, -0.5435522, 1, 0.5215687, 0, 1,
-1.418455, 0.003826281, -0.7267291, 1, 0.5294118, 0, 1,
-1.406369, 0.1213575, -0.1449029, 1, 0.5333334, 0, 1,
-1.37949, 0.1512343, -2.095206, 1, 0.5411765, 0, 1,
-1.362208, 0.8157988, -1.345461, 1, 0.5450981, 0, 1,
-1.361711, 0.9687648, -0.4853777, 1, 0.5529412, 0, 1,
-1.361621, -0.8588635, 0.1595135, 1, 0.5568628, 0, 1,
-1.341865, -0.3354847, -1.053899, 1, 0.5647059, 0, 1,
-1.338972, 0.5247552, -0.02734066, 1, 0.5686275, 0, 1,
-1.334291, 0.1275645, -2.10444, 1, 0.5764706, 0, 1,
-1.330079, -0.3925625, -0.8981022, 1, 0.5803922, 0, 1,
-1.32691, -0.2578743, -1.904351, 1, 0.5882353, 0, 1,
-1.320791, -1.208029, -1.776979, 1, 0.5921569, 0, 1,
-1.316874, 0.3323101, -1.937952, 1, 0.6, 0, 1,
-1.313951, 0.4633662, -0.8525439, 1, 0.6078432, 0, 1,
-1.290951, -0.4573691, -1.654345, 1, 0.6117647, 0, 1,
-1.287931, 1.08933, -0.97201, 1, 0.6196079, 0, 1,
-1.277411, -0.5886801, -1.698868, 1, 0.6235294, 0, 1,
-1.261867, 0.5136829, -0.3781087, 1, 0.6313726, 0, 1,
-1.252385, -0.6012259, -1.796267, 1, 0.6352941, 0, 1,
-1.249405, 0.4756733, -1.658432, 1, 0.6431373, 0, 1,
-1.238001, -0.4064243, -0.422153, 1, 0.6470588, 0, 1,
-1.225561, -0.2878261, -1.989638, 1, 0.654902, 0, 1,
-1.225447, -0.3206721, -2.886709, 1, 0.6588235, 0, 1,
-1.222143, 1.610455, -0.6531172, 1, 0.6666667, 0, 1,
-1.204655, -0.7708768, -2.550547, 1, 0.6705883, 0, 1,
-1.203109, 0.6684086, -1.477154, 1, 0.6784314, 0, 1,
-1.199419, 0.3437558, -0.9734964, 1, 0.682353, 0, 1,
-1.194506, 0.3738794, -0.8618961, 1, 0.6901961, 0, 1,
-1.18687, 0.8782087, -0.6878564, 1, 0.6941177, 0, 1,
-1.177379, 0.5815036, 0.1741893, 1, 0.7019608, 0, 1,
-1.173423, 0.1947529, -0.8680758, 1, 0.7098039, 0, 1,
-1.168724, 0.2182126, -2.32319, 1, 0.7137255, 0, 1,
-1.166655, -2.223332, -3.768811, 1, 0.7215686, 0, 1,
-1.164234, -0.2588751, -2.435792, 1, 0.7254902, 0, 1,
-1.162241, -0.8546597, -2.888021, 1, 0.7333333, 0, 1,
-1.161574, 0.7769026, -0.6339228, 1, 0.7372549, 0, 1,
-1.156719, -1.558644, -2.086759, 1, 0.7450981, 0, 1,
-1.153338, -0.4498461, -2.225733, 1, 0.7490196, 0, 1,
-1.152063, 0.2091752, -1.108214, 1, 0.7568628, 0, 1,
-1.151051, 0.9341146, 0.1817807, 1, 0.7607843, 0, 1,
-1.146731, 0.8200498, -1.509816, 1, 0.7686275, 0, 1,
-1.14276, 1.326333, -1.188191, 1, 0.772549, 0, 1,
-1.138891, 0.5445313, -1.156064, 1, 0.7803922, 0, 1,
-1.138393, 0.6801543, -0.608124, 1, 0.7843137, 0, 1,
-1.128369, 0.2284162, -1.568459, 1, 0.7921569, 0, 1,
-1.117844, -0.5539024, -1.718253, 1, 0.7960784, 0, 1,
-1.113841, 0.4754349, -0.9674335, 1, 0.8039216, 0, 1,
-1.105263, 0.3113988, -1.937119, 1, 0.8117647, 0, 1,
-1.097583, 0.8120972, -1.276308, 1, 0.8156863, 0, 1,
-1.080582, -0.6103494, -4.160319, 1, 0.8235294, 0, 1,
-1.079852, -0.6938682, -3.433848, 1, 0.827451, 0, 1,
-1.073932, -0.685976, -1.947445, 1, 0.8352941, 0, 1,
-1.071453, 0.4472348, -0.2657962, 1, 0.8392157, 0, 1,
-1.071431, 1.40897, -0.497192, 1, 0.8470588, 0, 1,
-1.065804, 0.4478425, -0.8826644, 1, 0.8509804, 0, 1,
-1.05634, 1.368076, -0.271081, 1, 0.8588235, 0, 1,
-1.055225, 2.272276, -0.4936802, 1, 0.8627451, 0, 1,
-1.053415, -2.335841, -2.928677, 1, 0.8705882, 0, 1,
-1.052452, 0.2355951, -1.609828, 1, 0.8745098, 0, 1,
-1.051268, -1.645313, -0.06233794, 1, 0.8823529, 0, 1,
-1.049086, 1.508019, 0.6728984, 1, 0.8862745, 0, 1,
-1.048703, -0.4181818, -0.4274664, 1, 0.8941177, 0, 1,
-1.036561, -1.58243, -2.098564, 1, 0.8980392, 0, 1,
-1.034837, -0.05209113, -1.996346, 1, 0.9058824, 0, 1,
-1.031838, 0.3964073, -0.8858911, 1, 0.9137255, 0, 1,
-1.02459, 1.200138, -0.6572477, 1, 0.9176471, 0, 1,
-1.020915, -1.770332, -2.068639, 1, 0.9254902, 0, 1,
-1.018245, -1.507245, -1.850675, 1, 0.9294118, 0, 1,
-1.014926, 1.049962, 0.6540298, 1, 0.9372549, 0, 1,
-1.013743, -0.7826553, -1.88349, 1, 0.9411765, 0, 1,
-1.011302, -0.588101, -4.139421, 1, 0.9490196, 0, 1,
-1.009898, 0.4858038, -1.413175, 1, 0.9529412, 0, 1,
-1.008342, -0.5467334, -1.576346, 1, 0.9607843, 0, 1,
-1.000102, 2.038462, 1.287515, 1, 0.9647059, 0, 1,
-0.9960576, -0.6922124, -2.717912, 1, 0.972549, 0, 1,
-0.9956496, -0.9967994, -1.802051, 1, 0.9764706, 0, 1,
-0.970912, 0.6208437, -0.4563372, 1, 0.9843137, 0, 1,
-0.9626002, -1.16426, -3.216286, 1, 0.9882353, 0, 1,
-0.9612222, -0.2430739, 0.1994912, 1, 0.9960784, 0, 1,
-0.9508036, -0.4027421, -0.873045, 0.9960784, 1, 0, 1,
-0.9461584, -0.4349854, -2.550524, 0.9921569, 1, 0, 1,
-0.9437837, 0.4968641, -0.9545792, 0.9843137, 1, 0, 1,
-0.9396278, 0.6480636, -1.474187, 0.9803922, 1, 0, 1,
-0.9385601, 2.17789, -1.485438, 0.972549, 1, 0, 1,
-0.938224, -0.189723, -1.051932, 0.9686275, 1, 0, 1,
-0.9339551, 0.9776129, -0.1954267, 0.9607843, 1, 0, 1,
-0.9325897, 0.3444123, -0.6331377, 0.9568627, 1, 0, 1,
-0.9291742, -0.4081796, -2.119628, 0.9490196, 1, 0, 1,
-0.9237732, -0.9889157, -1.047402, 0.945098, 1, 0, 1,
-0.9157758, 0.6040772, -1.174406, 0.9372549, 1, 0, 1,
-0.9100301, -0.9869874, -1.877587, 0.9333333, 1, 0, 1,
-0.9087835, 0.4724166, -1.35992, 0.9254902, 1, 0, 1,
-0.902409, 1.963925, 0.5080717, 0.9215686, 1, 0, 1,
-0.8967078, -1.340522, -3.09504, 0.9137255, 1, 0, 1,
-0.8885944, 1.326324, 0.05290231, 0.9098039, 1, 0, 1,
-0.8821287, 0.6389641, -2.452282, 0.9019608, 1, 0, 1,
-0.8747419, 1.083703, -1.248981, 0.8941177, 1, 0, 1,
-0.8728039, -1.361073, -2.612983, 0.8901961, 1, 0, 1,
-0.8692927, -0.8623656, -1.356351, 0.8823529, 1, 0, 1,
-0.8636914, 0.557058, -1.742878, 0.8784314, 1, 0, 1,
-0.8598804, 0.7010182, -3.421513, 0.8705882, 1, 0, 1,
-0.8570061, -0.04104061, -1.627537, 0.8666667, 1, 0, 1,
-0.8545095, -1.976585, -1.341907, 0.8588235, 1, 0, 1,
-0.8498873, 1.249409, 0.3196187, 0.854902, 1, 0, 1,
-0.8495979, 0.7559021, -1.069668, 0.8470588, 1, 0, 1,
-0.8461326, -0.09036376, -3.267644, 0.8431373, 1, 0, 1,
-0.8432246, -1.893865, -3.885745, 0.8352941, 1, 0, 1,
-0.8431189, 0.04706465, -1.09557, 0.8313726, 1, 0, 1,
-0.838873, 0.8356866, 0.2455793, 0.8235294, 1, 0, 1,
-0.8350772, 0.9292083, -0.5397516, 0.8196079, 1, 0, 1,
-0.8346471, -0.4396221, -1.56397, 0.8117647, 1, 0, 1,
-0.8343206, 1.290224, -2.318034, 0.8078431, 1, 0, 1,
-0.8280909, 0.2529123, -1.346299, 0.8, 1, 0, 1,
-0.8255534, -1.230324, -3.523882, 0.7921569, 1, 0, 1,
-0.8179314, -0.5496383, -3.037781, 0.7882353, 1, 0, 1,
-0.8161748, -0.1091048, 0.3302572, 0.7803922, 1, 0, 1,
-0.8157094, 0.5370711, 0.4625489, 0.7764706, 1, 0, 1,
-0.8151167, -0.8794972, -2.302911, 0.7686275, 1, 0, 1,
-0.8126473, -0.1760734, -2.423403, 0.7647059, 1, 0, 1,
-0.81224, 0.134879, -1.134841, 0.7568628, 1, 0, 1,
-0.810629, -0.3190018, 0.6660247, 0.7529412, 1, 0, 1,
-0.809694, 1.160322, -0.1607808, 0.7450981, 1, 0, 1,
-0.8017991, -0.6509951, -1.32943, 0.7411765, 1, 0, 1,
-0.795923, 0.7969192, -1.000805, 0.7333333, 1, 0, 1,
-0.7945339, 1.682329, 1.145064, 0.7294118, 1, 0, 1,
-0.7930967, -2.52891, -2.134085, 0.7215686, 1, 0, 1,
-0.7895146, 0.810142, 0.1254863, 0.7176471, 1, 0, 1,
-0.7872808, -0.4001118, -2.52113, 0.7098039, 1, 0, 1,
-0.7871769, 1.642945, -0.5534252, 0.7058824, 1, 0, 1,
-0.7860768, -0.2592845, -4.431094, 0.6980392, 1, 0, 1,
-0.7842374, -0.7873575, -0.7034783, 0.6901961, 1, 0, 1,
-0.7824992, -0.4204895, -1.898486, 0.6862745, 1, 0, 1,
-0.7811664, -0.03320528, -1.312079, 0.6784314, 1, 0, 1,
-0.779051, -1.625283, -2.214867, 0.6745098, 1, 0, 1,
-0.7759885, 1.780312, 1.408162, 0.6666667, 1, 0, 1,
-0.7690179, 0.8982482, 1.25619, 0.6627451, 1, 0, 1,
-0.7689636, 0.1244002, -1.067295, 0.654902, 1, 0, 1,
-0.7664807, -2.23055, -5.072726, 0.6509804, 1, 0, 1,
-0.7593431, 0.8936644, -0.7985368, 0.6431373, 1, 0, 1,
-0.7529526, -0.1708983, -0.8347077, 0.6392157, 1, 0, 1,
-0.7487585, 0.9842614, -0.8326723, 0.6313726, 1, 0, 1,
-0.7419188, -1.385574, -1.60675, 0.627451, 1, 0, 1,
-0.7388724, 1.2356, -1.251396, 0.6196079, 1, 0, 1,
-0.7360748, -1.084343, -2.363137, 0.6156863, 1, 0, 1,
-0.7348238, 1.500622, -0.117241, 0.6078432, 1, 0, 1,
-0.7297573, 0.1971724, -0.04404176, 0.6039216, 1, 0, 1,
-0.7242744, 0.3696217, -0.2690739, 0.5960785, 1, 0, 1,
-0.7229781, 1.940723, 0.30957, 0.5882353, 1, 0, 1,
-0.7213029, -1.49875, -1.224328, 0.5843138, 1, 0, 1,
-0.7174805, 0.8847753, 0.2877169, 0.5764706, 1, 0, 1,
-0.7170119, -0.8839522, -2.328793, 0.572549, 1, 0, 1,
-0.7162839, -0.3391109, -3.323513, 0.5647059, 1, 0, 1,
-0.7114538, 0.1218835, -0.4979935, 0.5607843, 1, 0, 1,
-0.7067072, -0.262535, -1.164672, 0.5529412, 1, 0, 1,
-0.7055365, -0.5141767, -2.608926, 0.5490196, 1, 0, 1,
-0.7043605, 1.142126, -1.702416, 0.5411765, 1, 0, 1,
-0.7029085, -1.061671, -2.386472, 0.5372549, 1, 0, 1,
-0.7009836, 0.03046958, -2.165731, 0.5294118, 1, 0, 1,
-0.6986982, -0.8293247, -1.531188, 0.5254902, 1, 0, 1,
-0.6970037, 0.1747426, -2.232216, 0.5176471, 1, 0, 1,
-0.6938599, 0.8767804, 0.7878096, 0.5137255, 1, 0, 1,
-0.6926535, -0.4585546, -1.36342, 0.5058824, 1, 0, 1,
-0.6922216, -0.7982761, -1.947308, 0.5019608, 1, 0, 1,
-0.6906412, 0.398325, -0.7802108, 0.4941176, 1, 0, 1,
-0.6886888, -0.8525877, -2.645966, 0.4862745, 1, 0, 1,
-0.6863734, -0.1203999, -0.9774595, 0.4823529, 1, 0, 1,
-0.6798979, 0.706091, 0.2709801, 0.4745098, 1, 0, 1,
-0.6787415, 2.066598, -2.937871, 0.4705882, 1, 0, 1,
-0.6784511, -0.5519469, -4.206206, 0.4627451, 1, 0, 1,
-0.6768764, 0.7485092, -1.199516, 0.4588235, 1, 0, 1,
-0.6709237, -0.5273126, -0.8424127, 0.4509804, 1, 0, 1,
-0.6708117, -1.609632, -2.197691, 0.4470588, 1, 0, 1,
-0.666554, 0.8644615, -0.02269274, 0.4392157, 1, 0, 1,
-0.6660606, 0.8298645, -1.813108, 0.4352941, 1, 0, 1,
-0.6587145, -0.92965, -0.6628344, 0.427451, 1, 0, 1,
-0.6575136, 1.92065, 0.6463832, 0.4235294, 1, 0, 1,
-0.6537479, 0.4265904, -2.749898, 0.4156863, 1, 0, 1,
-0.6521115, -0.2855644, -1.589947, 0.4117647, 1, 0, 1,
-0.6431285, 0.5170408, -0.5668829, 0.4039216, 1, 0, 1,
-0.6396378, 0.2026866, -0.9323698, 0.3960784, 1, 0, 1,
-0.6396185, -0.6994996, -2.226505, 0.3921569, 1, 0, 1,
-0.6345583, -0.4774759, -2.03072, 0.3843137, 1, 0, 1,
-0.6294393, 1.568593, 0.4775923, 0.3803922, 1, 0, 1,
-0.6249909, 0.9517922, -1.66952, 0.372549, 1, 0, 1,
-0.6249273, -0.4552202, -3.299217, 0.3686275, 1, 0, 1,
-0.6218225, 0.321261, -1.303359, 0.3607843, 1, 0, 1,
-0.6105704, -0.3970745, -1.576137, 0.3568628, 1, 0, 1,
-0.602049, -1.173296, -2.679035, 0.3490196, 1, 0, 1,
-0.5990996, 0.8810061, -1.776513, 0.345098, 1, 0, 1,
-0.5970061, 0.1358971, -1.697976, 0.3372549, 1, 0, 1,
-0.5909066, -0.6436447, -1.797952, 0.3333333, 1, 0, 1,
-0.5884994, 1.507312, -1.355765, 0.3254902, 1, 0, 1,
-0.5814747, -0.4630357, -2.33204, 0.3215686, 1, 0, 1,
-0.5763444, 0.9329026, -0.6022625, 0.3137255, 1, 0, 1,
-0.5737606, -2.117082, -4.491197, 0.3098039, 1, 0, 1,
-0.5698115, 0.08518455, 0.460256, 0.3019608, 1, 0, 1,
-0.5674794, -0.03058076, -1.544721, 0.2941177, 1, 0, 1,
-0.5623072, 0.415548, -2.058687, 0.2901961, 1, 0, 1,
-0.5607914, -0.2488225, -2.468717, 0.282353, 1, 0, 1,
-0.5592718, -0.1046019, -1.010667, 0.2784314, 1, 0, 1,
-0.5548387, 1.065916, -1.734288, 0.2705882, 1, 0, 1,
-0.5420386, -0.4578181, -3.403184, 0.2666667, 1, 0, 1,
-0.5409248, -0.01483017, -1.920086, 0.2588235, 1, 0, 1,
-0.5314338, -1.069869, -2.75154, 0.254902, 1, 0, 1,
-0.5269914, -1.896719, -2.498702, 0.2470588, 1, 0, 1,
-0.5246376, 1.348342, -1.180941, 0.2431373, 1, 0, 1,
-0.5217096, 0.9855332, 0.5355378, 0.2352941, 1, 0, 1,
-0.5171486, 1.102333, 0.2464829, 0.2313726, 1, 0, 1,
-0.5163026, -1.495923, -4.653101, 0.2235294, 1, 0, 1,
-0.5148377, -0.3150728, -0.6939092, 0.2196078, 1, 0, 1,
-0.5136154, -0.3977567, -0.8139554, 0.2117647, 1, 0, 1,
-0.5128038, -0.2873469, -3.478848, 0.2078431, 1, 0, 1,
-0.5034629, -2.132233, -3.571074, 0.2, 1, 0, 1,
-0.4946871, 1.438097, 0.8280486, 0.1921569, 1, 0, 1,
-0.4911627, -0.8065338, -0.9366573, 0.1882353, 1, 0, 1,
-0.4869854, 0.222205, 0.7755781, 0.1803922, 1, 0, 1,
-0.4863916, -0.7275017, -4.522763, 0.1764706, 1, 0, 1,
-0.4851156, -1.526048, -1.944848, 0.1686275, 1, 0, 1,
-0.4803661, 1.389126, -1.14406, 0.1647059, 1, 0, 1,
-0.4799672, -1.279301, -2.688948, 0.1568628, 1, 0, 1,
-0.476965, 0.3875987, -0.9061614, 0.1529412, 1, 0, 1,
-0.4759209, -0.9305118, -1.592737, 0.145098, 1, 0, 1,
-0.4733873, 0.952086, -1.778147, 0.1411765, 1, 0, 1,
-0.4710947, -1.653801, -3.392427, 0.1333333, 1, 0, 1,
-0.4696976, -0.06618436, -0.3869876, 0.1294118, 1, 0, 1,
-0.4636779, -0.4512782, -3.417621, 0.1215686, 1, 0, 1,
-0.4603675, 0.0251644, -1.671384, 0.1176471, 1, 0, 1,
-0.4587593, 0.1113332, -2.093246, 0.1098039, 1, 0, 1,
-0.4578218, -2.265567, -1.755361, 0.1058824, 1, 0, 1,
-0.4504794, -0.01600977, -1.639098, 0.09803922, 1, 0, 1,
-0.4501256, -0.693011, -2.488408, 0.09019608, 1, 0, 1,
-0.4484782, 0.6214705, -1.195669, 0.08627451, 1, 0, 1,
-0.445031, -0.4192344, -1.466282, 0.07843138, 1, 0, 1,
-0.4371033, -1.254336, -3.655734, 0.07450981, 1, 0, 1,
-0.4364096, -0.4007129, -2.175726, 0.06666667, 1, 0, 1,
-0.4360241, -0.2032865, -1.2573, 0.0627451, 1, 0, 1,
-0.4287174, 1.334258, 0.1763442, 0.05490196, 1, 0, 1,
-0.4285313, -0.6267999, -2.594171, 0.05098039, 1, 0, 1,
-0.4273183, -0.8094649, -2.410569, 0.04313726, 1, 0, 1,
-0.4257029, -0.01396868, -0.8194852, 0.03921569, 1, 0, 1,
-0.4246253, 1.701387, -0.5069959, 0.03137255, 1, 0, 1,
-0.4184503, 0.4822232, -0.9882313, 0.02745098, 1, 0, 1,
-0.4135324, 0.4813167, -1.011296, 0.01960784, 1, 0, 1,
-0.4122456, -0.412659, -2.011723, 0.01568628, 1, 0, 1,
-0.4099875, 1.385933, 0.1081718, 0.007843138, 1, 0, 1,
-0.4083883, 1.183268, -0.575336, 0.003921569, 1, 0, 1,
-0.4018536, -0.03735989, -2.115146, 0, 1, 0.003921569, 1,
-0.4008678, -0.5156566, -1.324308, 0, 1, 0.01176471, 1,
-0.3988351, -1.349831, -4.565459, 0, 1, 0.01568628, 1,
-0.3921369, 0.03678613, -0.5913157, 0, 1, 0.02352941, 1,
-0.3917716, -1.264418, -3.95988, 0, 1, 0.02745098, 1,
-0.3895752, 0.9431599, -2.210724, 0, 1, 0.03529412, 1,
-0.3889934, -0.9683009, -3.907807, 0, 1, 0.03921569, 1,
-0.3875003, 1.900879, -0.933831, 0, 1, 0.04705882, 1,
-0.3871699, -0.320845, -1.546822, 0, 1, 0.05098039, 1,
-0.3852854, -0.659972, -4.100931, 0, 1, 0.05882353, 1,
-0.3722652, 1.244185, -0.4181443, 0, 1, 0.0627451, 1,
-0.3703905, 0.5500849, -0.6247066, 0, 1, 0.07058824, 1,
-0.3643928, 0.7425624, -1.443635, 0, 1, 0.07450981, 1,
-0.358208, -0.8357345, -4.256611, 0, 1, 0.08235294, 1,
-0.356277, 0.5537091, 0.1938391, 0, 1, 0.08627451, 1,
-0.3561316, 0.7611154, -0.3118145, 0, 1, 0.09411765, 1,
-0.3428487, -1.914892, -2.107509, 0, 1, 0.1019608, 1,
-0.3409531, -0.08491715, -2.308605, 0, 1, 0.1058824, 1,
-0.3370524, -0.3616238, -3.315648, 0, 1, 0.1137255, 1,
-0.3352829, -1.889549, -3.273936, 0, 1, 0.1176471, 1,
-0.3282648, 0.7842586, -0.09872253, 0, 1, 0.1254902, 1,
-0.3212461, -0.7263553, -2.091852, 0, 1, 0.1294118, 1,
-0.3151962, 0.2762001, -0.1819832, 0, 1, 0.1372549, 1,
-0.3141389, 0.4658519, 0.6777672, 0, 1, 0.1411765, 1,
-0.3112716, -0.3241813, -2.535685, 0, 1, 0.1490196, 1,
-0.3066189, -1.071029, -4.909826, 0, 1, 0.1529412, 1,
-0.3014878, 0.623307, -1.192834, 0, 1, 0.1607843, 1,
-0.3003338, 0.1242807, -1.783618, 0, 1, 0.1647059, 1,
-0.2994776, 0.02751883, -0.9006624, 0, 1, 0.172549, 1,
-0.2965536, -1.000492, -3.209706, 0, 1, 0.1764706, 1,
-0.296377, -0.2318616, -2.179332, 0, 1, 0.1843137, 1,
-0.2934582, -1.942397, -3.655273, 0, 1, 0.1882353, 1,
-0.2924183, -0.3533128, -2.512741, 0, 1, 0.1960784, 1,
-0.2921484, -0.9844896, -3.437228, 0, 1, 0.2039216, 1,
-0.291427, -0.6044999, -2.394163, 0, 1, 0.2078431, 1,
-0.2889183, -0.4438246, -2.940797, 0, 1, 0.2156863, 1,
-0.2863374, -0.408507, -2.674608, 0, 1, 0.2196078, 1,
-0.2819405, -0.1580901, -0.3610944, 0, 1, 0.227451, 1,
-0.280705, -1.835872, -4.251881, 0, 1, 0.2313726, 1,
-0.2780246, -0.9651263, -3.75867, 0, 1, 0.2392157, 1,
-0.2776741, -0.227098, -2.872179, 0, 1, 0.2431373, 1,
-0.2769014, 0.4875105, -0.04416662, 0, 1, 0.2509804, 1,
-0.2738733, 0.08324323, -3.086861, 0, 1, 0.254902, 1,
-0.2697638, 1.208967, 0.2045573, 0, 1, 0.2627451, 1,
-0.2674359, 0.2803305, -0.04693482, 0, 1, 0.2666667, 1,
-0.2650869, -0.6328439, -3.193621, 0, 1, 0.2745098, 1,
-0.262155, -1.175468, -3.405059, 0, 1, 0.2784314, 1,
-0.2584943, -0.991312, -3.066966, 0, 1, 0.2862745, 1,
-0.2583933, -0.4222925, -1.345064, 0, 1, 0.2901961, 1,
-0.257563, -0.1209086, -2.807633, 0, 1, 0.2980392, 1,
-0.2568755, -0.2172078, -3.604378, 0, 1, 0.3058824, 1,
-0.2566756, 0.2620529, -0.05282579, 0, 1, 0.3098039, 1,
-0.256481, 0.4615184, -1.636194, 0, 1, 0.3176471, 1,
-0.2493567, 0.4968054, -0.70535, 0, 1, 0.3215686, 1,
-0.2449904, 0.3896421, -0.4086321, 0, 1, 0.3294118, 1,
-0.2397491, -0.2529566, -3.430206, 0, 1, 0.3333333, 1,
-0.2384051, -0.5085379, -4.14829, 0, 1, 0.3411765, 1,
-0.2304766, 0.09704933, -1.640102, 0, 1, 0.345098, 1,
-0.2294367, -0.05711259, -2.80926, 0, 1, 0.3529412, 1,
-0.2293453, 0.8135868, -0.4406674, 0, 1, 0.3568628, 1,
-0.2293107, -2.409807, -3.619798, 0, 1, 0.3647059, 1,
-0.2287978, -0.06644711, -1.664441, 0, 1, 0.3686275, 1,
-0.2221694, 0.5076152, -0.747055, 0, 1, 0.3764706, 1,
-0.2219248, -1.299721, -2.755798, 0, 1, 0.3803922, 1,
-0.2137144, -0.3813877, -2.089844, 0, 1, 0.3882353, 1,
-0.2123705, 0.7999847, -0.1375069, 0, 1, 0.3921569, 1,
-0.2122706, -0.5492142, -2.424695, 0, 1, 0.4, 1,
-0.2087897, -0.8827616, -3.606779, 0, 1, 0.4078431, 1,
-0.2048474, 1.046429, -0.06870962, 0, 1, 0.4117647, 1,
-0.2048115, -1.132846, -3.030298, 0, 1, 0.4196078, 1,
-0.2025439, 0.474508, 0.3876118, 0, 1, 0.4235294, 1,
-0.2021147, 0.0247072, 0.3329044, 0, 1, 0.4313726, 1,
-0.1990854, -0.8919613, -2.972317, 0, 1, 0.4352941, 1,
-0.1971435, -1.099082, -4.076151, 0, 1, 0.4431373, 1,
-0.197109, -0.373323, -4.120454, 0, 1, 0.4470588, 1,
-0.1969707, 1.239753, 0.04069291, 0, 1, 0.454902, 1,
-0.1940618, 0.7374368, -1.260138, 0, 1, 0.4588235, 1,
-0.1906764, -0.8965166, -1.482499, 0, 1, 0.4666667, 1,
-0.188227, 0.005042273, -2.668065, 0, 1, 0.4705882, 1,
-0.1877219, -0.2158437, -2.234684, 0, 1, 0.4784314, 1,
-0.1870384, -1.09406, -2.052914, 0, 1, 0.4823529, 1,
-0.1744791, 0.07719792, 1.217592, 0, 1, 0.4901961, 1,
-0.1703193, 1.811033, 0.1482978, 0, 1, 0.4941176, 1,
-0.1673115, 0.6901029, -0.2606702, 0, 1, 0.5019608, 1,
-0.1632766, 1.346304, -0.5193752, 0, 1, 0.509804, 1,
-0.1615734, -1.381541, -2.240545, 0, 1, 0.5137255, 1,
-0.1589373, -0.5010002, -2.637722, 0, 1, 0.5215687, 1,
-0.1502588, 2.165532, -0.1092151, 0, 1, 0.5254902, 1,
-0.1464994, 1.118777, 0.3258288, 0, 1, 0.5333334, 1,
-0.1408074, -1.177392, -3.320822, 0, 1, 0.5372549, 1,
-0.135922, -0.2939672, -1.684742, 0, 1, 0.5450981, 1,
-0.1350507, 1.319303, -0.39279, 0, 1, 0.5490196, 1,
-0.134048, -1.120216, -1.985007, 0, 1, 0.5568628, 1,
-0.1336712, -0.6515739, -1.57592, 0, 1, 0.5607843, 1,
-0.1326492, -0.8034338, -2.72286, 0, 1, 0.5686275, 1,
-0.1307472, 0.3984148, 0.005690071, 0, 1, 0.572549, 1,
-0.1269348, 2.995633, -0.6482152, 0, 1, 0.5803922, 1,
-0.125665, -0.3071395, -2.341815, 0, 1, 0.5843138, 1,
-0.1236012, 0.1504097, -1.420856, 0, 1, 0.5921569, 1,
-0.1212364, -0.1423697, -1.465464, 0, 1, 0.5960785, 1,
-0.1152684, 0.4968012, -0.8230097, 0, 1, 0.6039216, 1,
-0.1140831, 0.2537249, -1.148988, 0, 1, 0.6117647, 1,
-0.1094138, -0.6328475, -5.36065, 0, 1, 0.6156863, 1,
-0.1076539, 0.9462293, 0.03785604, 0, 1, 0.6235294, 1,
-0.10765, 0.3998657, 0.1976762, 0, 1, 0.627451, 1,
-0.1000839, -0.5183712, -2.966499, 0, 1, 0.6352941, 1,
-0.08924915, -0.4709882, -3.436377, 0, 1, 0.6392157, 1,
-0.08801518, -0.9965377, -0.492322, 0, 1, 0.6470588, 1,
-0.08781032, -1.740502, -3.920244, 0, 1, 0.6509804, 1,
-0.08725987, 0.2449601, 0.9735759, 0, 1, 0.6588235, 1,
-0.08600215, 0.06972875, -1.355149, 0, 1, 0.6627451, 1,
-0.08422425, -0.1347412, -2.013529, 0, 1, 0.6705883, 1,
-0.08193088, 1.330513, -1.7431, 0, 1, 0.6745098, 1,
-0.08188011, -0.4013311, -2.634407, 0, 1, 0.682353, 1,
-0.07982347, 0.7402502, 0.3174235, 0, 1, 0.6862745, 1,
-0.07656078, 1.174704, -0.5461994, 0, 1, 0.6941177, 1,
-0.07521892, 2.799826, -0.2271944, 0, 1, 0.7019608, 1,
-0.07305442, -0.4384505, -3.780297, 0, 1, 0.7058824, 1,
-0.0682744, -0.5353296, -3.145565, 0, 1, 0.7137255, 1,
-0.06821768, -1.697977, -3.236951, 0, 1, 0.7176471, 1,
-0.06629669, -0.5998724, -3.521225, 0, 1, 0.7254902, 1,
-0.06517459, -0.6580356, -3.525983, 0, 1, 0.7294118, 1,
-0.06414419, -0.6412387, -2.692743, 0, 1, 0.7372549, 1,
-0.06411855, 0.4596718, -1.228217, 0, 1, 0.7411765, 1,
-0.05792929, -0.7244676, -4.103089, 0, 1, 0.7490196, 1,
-0.05640215, 1.015832, -0.8755858, 0, 1, 0.7529412, 1,
-0.05566882, -1.94313, -2.225484, 0, 1, 0.7607843, 1,
-0.05476212, -0.4160804, -1.790601, 0, 1, 0.7647059, 1,
-0.05426443, -0.4051538, -2.75865, 0, 1, 0.772549, 1,
-0.05279016, 0.6381994, -0.2427548, 0, 1, 0.7764706, 1,
-0.0514327, -0.3052818, -2.983761, 0, 1, 0.7843137, 1,
-0.05039148, -0.5695277, -3.060323, 0, 1, 0.7882353, 1,
-0.04828483, -1.125358, 0.05071853, 0, 1, 0.7960784, 1,
-0.04640318, 0.7170934, -1.354319, 0, 1, 0.8039216, 1,
-0.04535684, -0.2976067, -4.106729, 0, 1, 0.8078431, 1,
-0.04087459, 0.8153584, -1.301091, 0, 1, 0.8156863, 1,
-0.03683787, -0.3224791, -3.924063, 0, 1, 0.8196079, 1,
-0.02998555, 0.2200838, -1.756603, 0, 1, 0.827451, 1,
-0.02972599, -0.8326276, -3.629383, 0, 1, 0.8313726, 1,
-0.02790357, -1.199085, -2.377704, 0, 1, 0.8392157, 1,
-0.02329551, -1.414322, -3.114778, 0, 1, 0.8431373, 1,
-0.02159012, -0.87897, -2.021234, 0, 1, 0.8509804, 1,
-0.02099071, 1.187526, 0.6537763, 0, 1, 0.854902, 1,
-0.02095821, 0.02904865, 0.03600781, 0, 1, 0.8627451, 1,
-0.01733375, 0.1749641, 0.1014283, 0, 1, 0.8666667, 1,
-0.01531721, -0.9570644, -1.740998, 0, 1, 0.8745098, 1,
-0.01409354, -0.4582498, -4.430922, 0, 1, 0.8784314, 1,
-0.01240888, 0.467236, 0.1078328, 0, 1, 0.8862745, 1,
-0.01162266, 2.040512, -0.5994855, 0, 1, 0.8901961, 1,
-0.00944116, -1.045452, -3.399575, 0, 1, 0.8980392, 1,
-0.008211656, 0.6939986, -0.4052709, 0, 1, 0.9058824, 1,
-0.005437402, -0.4320918, -3.176668, 0, 1, 0.9098039, 1,
0.0004308948, 1.816789, 2.023082, 0, 1, 0.9176471, 1,
0.00387663, -0.761117, 1.464851, 0, 1, 0.9215686, 1,
0.006807018, 1.643625, -0.6664572, 0, 1, 0.9294118, 1,
0.007375454, -1.084373, 3.71738, 0, 1, 0.9333333, 1,
0.01059987, -0.8691501, 3.880219, 0, 1, 0.9411765, 1,
0.01060694, -0.08334034, 1.944933, 0, 1, 0.945098, 1,
0.01185352, 1.305205, 0.09511583, 0, 1, 0.9529412, 1,
0.01662305, -1.174133, 4.81712, 0, 1, 0.9568627, 1,
0.01682459, -0.9139597, 3.849867, 0, 1, 0.9647059, 1,
0.01805664, 1.546388, -1.094168, 0, 1, 0.9686275, 1,
0.02249976, 0.9290038, 0.4695788, 0, 1, 0.9764706, 1,
0.02278412, -0.98585, 3.924312, 0, 1, 0.9803922, 1,
0.02498579, -0.9722686, 3.829404, 0, 1, 0.9882353, 1,
0.02710082, -0.8297699, 2.346803, 0, 1, 0.9921569, 1,
0.03048814, 3.070049, -0.4630541, 0, 1, 1, 1,
0.0321569, 0.4222416, -0.4925834, 0, 0.9921569, 1, 1,
0.04265458, 0.2315843, 0.05477364, 0, 0.9882353, 1, 1,
0.04636282, 0.06044918, 1.508557, 0, 0.9803922, 1, 1,
0.05199904, 0.3715987, -0.6913691, 0, 0.9764706, 1, 1,
0.05364546, -2.259595, 3.383706, 0, 0.9686275, 1, 1,
0.05829646, 0.6333093, 0.04112739, 0, 0.9647059, 1, 1,
0.06165522, -0.5233672, 2.446683, 0, 0.9568627, 1, 1,
0.0620426, -0.9481201, 3.906031, 0, 0.9529412, 1, 1,
0.06240826, -0.603539, 2.209708, 0, 0.945098, 1, 1,
0.06391207, 1.74598, 2.290624, 0, 0.9411765, 1, 1,
0.06461355, -1.779441, 2.37214, 0, 0.9333333, 1, 1,
0.06654789, 0.3815821, 0.8051721, 0, 0.9294118, 1, 1,
0.07114109, 0.849459, 0.5180194, 0, 0.9215686, 1, 1,
0.07636377, 2.729048, 0.9393997, 0, 0.9176471, 1, 1,
0.07689256, -0.04702165, 1.087125, 0, 0.9098039, 1, 1,
0.08332183, 1.541736, 1.277866, 0, 0.9058824, 1, 1,
0.08471581, -1.053384, 3.904461, 0, 0.8980392, 1, 1,
0.08630944, -0.05589967, 3.26683, 0, 0.8901961, 1, 1,
0.08788777, 0.111549, 1.148687, 0, 0.8862745, 1, 1,
0.09018121, 0.9010029, 0.1605336, 0, 0.8784314, 1, 1,
0.09420595, -0.9130571, 3.345608, 0, 0.8745098, 1, 1,
0.09654551, -0.08980906, 3.079487, 0, 0.8666667, 1, 1,
0.09677527, -1.189206, 1.430452, 0, 0.8627451, 1, 1,
0.09719504, -0.4703346, 2.784431, 0, 0.854902, 1, 1,
0.09981657, -0.3205239, 3.754369, 0, 0.8509804, 1, 1,
0.1004925, 0.9881002, 0.5263028, 0, 0.8431373, 1, 1,
0.1049756, 1.351112, 0.7146058, 0, 0.8392157, 1, 1,
0.1066276, -0.8781819, 5.237674, 0, 0.8313726, 1, 1,
0.1067911, -0.4368033, 3.928847, 0, 0.827451, 1, 1,
0.1145049, 1.110959, 0.2159674, 0, 0.8196079, 1, 1,
0.1159483, 0.2650712, 0.0944595, 0, 0.8156863, 1, 1,
0.1219382, -0.1134548, 3.359043, 0, 0.8078431, 1, 1,
0.1254391, 0.705631, 2.129873, 0, 0.8039216, 1, 1,
0.1297218, 0.3586634, -0.6427367, 0, 0.7960784, 1, 1,
0.1308652, -0.5406237, 2.045741, 0, 0.7882353, 1, 1,
0.1309711, 1.877976, 0.7714509, 0, 0.7843137, 1, 1,
0.1311215, 1.135298, -0.4854536, 0, 0.7764706, 1, 1,
0.1346062, -0.6890994, 2.977902, 0, 0.772549, 1, 1,
0.1402301, 0.8475217, -1.181562, 0, 0.7647059, 1, 1,
0.1414754, 0.6334879, -0.5072106, 0, 0.7607843, 1, 1,
0.1439879, 0.4909829, 1.060385, 0, 0.7529412, 1, 1,
0.149965, -0.2910154, 2.78323, 0, 0.7490196, 1, 1,
0.1516897, -1.171901, 3.203427, 0, 0.7411765, 1, 1,
0.1532045, -1.593095, 4.974036, 0, 0.7372549, 1, 1,
0.156227, 1.498074, 1.219711, 0, 0.7294118, 1, 1,
0.1603778, -0.6675305, 1.010177, 0, 0.7254902, 1, 1,
0.1606136, 0.747467, 0.4120407, 0, 0.7176471, 1, 1,
0.1607938, -0.6348186, 1.856101, 0, 0.7137255, 1, 1,
0.16399, -0.4843121, 1.321414, 0, 0.7058824, 1, 1,
0.1665288, 0.3249545, -0.5930806, 0, 0.6980392, 1, 1,
0.1689297, -0.8310252, 4.311222, 0, 0.6941177, 1, 1,
0.1748722, 0.2974302, -0.04783774, 0, 0.6862745, 1, 1,
0.1759045, -1.261797, 2.324697, 0, 0.682353, 1, 1,
0.1763898, -0.3672794, 1.819404, 0, 0.6745098, 1, 1,
0.1803123, 0.5861608, -0.8766178, 0, 0.6705883, 1, 1,
0.1830128, 0.482274, 0.1984043, 0, 0.6627451, 1, 1,
0.1837601, 0.2901679, 0.9751887, 0, 0.6588235, 1, 1,
0.186857, 1.753093, -0.01222113, 0, 0.6509804, 1, 1,
0.1881829, -2.449078, 4.379409, 0, 0.6470588, 1, 1,
0.1928351, -0.7357265, 2.470314, 0, 0.6392157, 1, 1,
0.1984467, 1.16086, -1.044561, 0, 0.6352941, 1, 1,
0.2014271, -1.612604, 5.653339, 0, 0.627451, 1, 1,
0.2016813, 0.6499345, 1.409168, 0, 0.6235294, 1, 1,
0.2029113, -0.04570006, 3.498042, 0, 0.6156863, 1, 1,
0.2033378, 0.4314801, 0.2543488, 0, 0.6117647, 1, 1,
0.2112943, -1.279441, 1.514224, 0, 0.6039216, 1, 1,
0.2147399, -1.148524, 2.80416, 0, 0.5960785, 1, 1,
0.2158461, -1.472878, 1.474176, 0, 0.5921569, 1, 1,
0.2177163, 0.579667, 0.3797049, 0, 0.5843138, 1, 1,
0.2181537, -0.6939059, 2.640192, 0, 0.5803922, 1, 1,
0.2188798, -0.6051409, 4.175653, 0, 0.572549, 1, 1,
0.2198451, -0.5045394, 2.273414, 0, 0.5686275, 1, 1,
0.2201182, -0.9912077, 2.711004, 0, 0.5607843, 1, 1,
0.2229441, -2.159033, 3.019947, 0, 0.5568628, 1, 1,
0.2261679, -0.6701902, 2.32458, 0, 0.5490196, 1, 1,
0.2279214, 1.631407, 0.756888, 0, 0.5450981, 1, 1,
0.2294843, 1.353152, 0.9874414, 0, 0.5372549, 1, 1,
0.2298052, 0.6493129, 0.06178402, 0, 0.5333334, 1, 1,
0.2298694, 0.5402358, 1.201038, 0, 0.5254902, 1, 1,
0.2329862, 0.9089676, 0.9505282, 0, 0.5215687, 1, 1,
0.2386637, -0.5570185, 2.58334, 0, 0.5137255, 1, 1,
0.2387121, -0.4526832, 2.741696, 0, 0.509804, 1, 1,
0.239286, 1.396213, 1.131396, 0, 0.5019608, 1, 1,
0.2415419, 0.5904063, -0.292975, 0, 0.4941176, 1, 1,
0.2477738, -0.7458523, 3.167979, 0, 0.4901961, 1, 1,
0.249692, -0.4844913, 2.549838, 0, 0.4823529, 1, 1,
0.252749, 0.1281149, 0.9338703, 0, 0.4784314, 1, 1,
0.2530166, 1.016562, -0.7126451, 0, 0.4705882, 1, 1,
0.2539031, -0.6179812, 2.155849, 0, 0.4666667, 1, 1,
0.2572625, -0.2460407, 1.040211, 0, 0.4588235, 1, 1,
0.2651795, -0.4070212, 2.619929, 0, 0.454902, 1, 1,
0.2660839, 0.2323152, 0.8555678, 0, 0.4470588, 1, 1,
0.2682566, -0.1910905, 3.673918, 0, 0.4431373, 1, 1,
0.2698218, -1.065372, 1.580501, 0, 0.4352941, 1, 1,
0.2717171, -0.5803095, 2.485774, 0, 0.4313726, 1, 1,
0.2740137, 1.138923, 0.06341396, 0, 0.4235294, 1, 1,
0.2762897, -2.52824, 3.046677, 0, 0.4196078, 1, 1,
0.2770295, 0.5585077, 2.28879, 0, 0.4117647, 1, 1,
0.2799492, -1.109015, 3.836542, 0, 0.4078431, 1, 1,
0.2803662, -0.9813145, 2.313198, 0, 0.4, 1, 1,
0.2806139, 1.517947, 0.3642548, 0, 0.3921569, 1, 1,
0.2832709, 1.034562, -0.3388, 0, 0.3882353, 1, 1,
0.2839006, 1.051529, 1.394383, 0, 0.3803922, 1, 1,
0.2914879, 0.2006444, -0.3087993, 0, 0.3764706, 1, 1,
0.2918057, -0.1512877, 3.120392, 0, 0.3686275, 1, 1,
0.2935555, 0.6996275, -0.5898217, 0, 0.3647059, 1, 1,
0.2941775, -0.8943051, 5.590642, 0, 0.3568628, 1, 1,
0.2962952, -1.042261, 1.640299, 0, 0.3529412, 1, 1,
0.3021823, 1.439125, -0.3492599, 0, 0.345098, 1, 1,
0.3056799, -0.4738238, 2.277489, 0, 0.3411765, 1, 1,
0.3066351, -2.349596, 4.607772, 0, 0.3333333, 1, 1,
0.3098948, -0.361423, 1.258782, 0, 0.3294118, 1, 1,
0.3134246, -0.3905526, 2.298463, 0, 0.3215686, 1, 1,
0.314136, -0.01930496, 1.687766, 0, 0.3176471, 1, 1,
0.3142438, 1.108183, -0.3896088, 0, 0.3098039, 1, 1,
0.3191795, 1.191474, 1.923637, 0, 0.3058824, 1, 1,
0.3199248, 0.5988523, 1.432865, 0, 0.2980392, 1, 1,
0.3207157, 0.6601619, 2.33404, 0, 0.2901961, 1, 1,
0.3232706, 0.360338, 1.542276, 0, 0.2862745, 1, 1,
0.3239253, 0.7682048, -0.428822, 0, 0.2784314, 1, 1,
0.3263167, 0.2624125, 1.400782, 0, 0.2745098, 1, 1,
0.3263193, 0.01569351, 2.452201, 0, 0.2666667, 1, 1,
0.3347228, 2.188513, 0.4949272, 0, 0.2627451, 1, 1,
0.3376642, -0.6160614, 4.238709, 0, 0.254902, 1, 1,
0.3395592, 0.4534578, -0.1243408, 0, 0.2509804, 1, 1,
0.3434912, 0.9861133, 0.6174995, 0, 0.2431373, 1, 1,
0.3463278, -1.065887, 2.588207, 0, 0.2392157, 1, 1,
0.348695, -0.281928, 2.823677, 0, 0.2313726, 1, 1,
0.3503476, 0.2997083, 0.3557732, 0, 0.227451, 1, 1,
0.3508584, -0.6490223, 2.509861, 0, 0.2196078, 1, 1,
0.3524978, -1.797678, 2.13305, 0, 0.2156863, 1, 1,
0.352722, -0.8329805, 3.586553, 0, 0.2078431, 1, 1,
0.3536465, 1.828803, -0.701901, 0, 0.2039216, 1, 1,
0.3595761, 0.2264511, -1.310401, 0, 0.1960784, 1, 1,
0.3603044, -1.724994, 2.289142, 0, 0.1882353, 1, 1,
0.3676195, 1.223915, -0.5348157, 0, 0.1843137, 1, 1,
0.3686159, 0.6539015, 1.306373, 0, 0.1764706, 1, 1,
0.3716002, 1.892486, -0.3802179, 0, 0.172549, 1, 1,
0.3725523, 0.001592172, 1.135744, 0, 0.1647059, 1, 1,
0.3836258, 0.1512055, 0.8487939, 0, 0.1607843, 1, 1,
0.3837554, 1.569712, -0.8831926, 0, 0.1529412, 1, 1,
0.3864567, -0.5957322, 3.034736, 0, 0.1490196, 1, 1,
0.3883409, 0.008360887, 0.9759542, 0, 0.1411765, 1, 1,
0.3981151, 0.9226781, -0.5481642, 0, 0.1372549, 1, 1,
0.3997319, -2.005041, 1.794389, 0, 0.1294118, 1, 1,
0.4023642, 1.35308, -0.01102803, 0, 0.1254902, 1, 1,
0.406802, 0.7587195, 0.7684131, 0, 0.1176471, 1, 1,
0.4089172, -0.6469505, 3.495323, 0, 0.1137255, 1, 1,
0.409804, -0.6389332, 4.796004, 0, 0.1058824, 1, 1,
0.4105469, -1.139791, 1.426738, 0, 0.09803922, 1, 1,
0.4177843, -0.4417933, 1.25711, 0, 0.09411765, 1, 1,
0.4218778, -2.101926, 3.723815, 0, 0.08627451, 1, 1,
0.4241483, 1.088028, 0.6076655, 0, 0.08235294, 1, 1,
0.4263478, 0.8559566, 1.644986, 0, 0.07450981, 1, 1,
0.4293771, 0.01873573, 2.345019, 0, 0.07058824, 1, 1,
0.429648, 0.4289452, 0.743745, 0, 0.0627451, 1, 1,
0.433538, -1.738906, 2.132639, 0, 0.05882353, 1, 1,
0.4361545, 0.7431945, -1.740975, 0, 0.05098039, 1, 1,
0.4374647, 0.9498535, 1.755823, 0, 0.04705882, 1, 1,
0.4383211, 0.8968959, 0.8129231, 0, 0.03921569, 1, 1,
0.438507, 0.01831597, 1.544204, 0, 0.03529412, 1, 1,
0.4400756, -0.9308322, -0.7960064, 0, 0.02745098, 1, 1,
0.447345, 0.2809009, 0.6775127, 0, 0.02352941, 1, 1,
0.4492317, -0.1357597, 1.614787, 0, 0.01568628, 1, 1,
0.449731, -3.145052, 2.674299, 0, 0.01176471, 1, 1,
0.4502247, 0.630383, 0.5600232, 0, 0.003921569, 1, 1,
0.450649, -1.323194, 2.887838, 0.003921569, 0, 1, 1,
0.4563766, -0.06988326, 4.778542, 0.007843138, 0, 1, 1,
0.4587379, -0.98802, 2.063336, 0.01568628, 0, 1, 1,
0.4593494, -0.481186, 1.670651, 0.01960784, 0, 1, 1,
0.4596342, 0.7528085, 1.105018, 0.02745098, 0, 1, 1,
0.460777, 0.794988, -0.3661682, 0.03137255, 0, 1, 1,
0.4607884, -0.2743562, 2.599824, 0.03921569, 0, 1, 1,
0.4616826, -0.7084873, 2.242916, 0.04313726, 0, 1, 1,
0.4670909, -1.08465, 2.567136, 0.05098039, 0, 1, 1,
0.4674266, 1.001824, 0.1709145, 0.05490196, 0, 1, 1,
0.4732759, -3.604348, 5.227344, 0.0627451, 0, 1, 1,
0.494073, 0.5082331, -0.2352896, 0.06666667, 0, 1, 1,
0.4955758, -1.272888, 1.559095, 0.07450981, 0, 1, 1,
0.4995322, 1.372686, 0.7849727, 0.07843138, 0, 1, 1,
0.5048126, 0.2723187, 0.3518513, 0.08627451, 0, 1, 1,
0.5075309, 0.9988798, 0.2509682, 0.09019608, 0, 1, 1,
0.508087, 0.3466918, 1.037305, 0.09803922, 0, 1, 1,
0.5119822, -0.2901442, 3.340973, 0.1058824, 0, 1, 1,
0.5120893, 0.6667842, 1.019146, 0.1098039, 0, 1, 1,
0.5127564, 1.596822, -0.4594178, 0.1176471, 0, 1, 1,
0.5144899, -0.3978886, 2.598795, 0.1215686, 0, 1, 1,
0.5154086, -2.354016, 3.712007, 0.1294118, 0, 1, 1,
0.5183271, -0.2756144, 0.882028, 0.1333333, 0, 1, 1,
0.5193976, -0.5712295, 2.250899, 0.1411765, 0, 1, 1,
0.5206811, -0.1421414, 3.202471, 0.145098, 0, 1, 1,
0.5257435, -0.7176908, 1.522117, 0.1529412, 0, 1, 1,
0.5271545, 1.845851, 0.2578534, 0.1568628, 0, 1, 1,
0.5330855, -2.590889, 3.813937, 0.1647059, 0, 1, 1,
0.5409448, 0.4152177, 1.806791, 0.1686275, 0, 1, 1,
0.5417088, -1.116706, 2.637207, 0.1764706, 0, 1, 1,
0.54422, 1.073252, 0.2766959, 0.1803922, 0, 1, 1,
0.5448, -1.24489, 3.702546, 0.1882353, 0, 1, 1,
0.5461909, -0.8781016, 2.865464, 0.1921569, 0, 1, 1,
0.5553388, -1.110027, 2.156443, 0.2, 0, 1, 1,
0.5581514, -0.07834359, 1.46922, 0.2078431, 0, 1, 1,
0.5590172, -0.6038626, 3.221243, 0.2117647, 0, 1, 1,
0.5597739, -0.4455687, 3.03891, 0.2196078, 0, 1, 1,
0.560807, -0.004292557, 1.340619, 0.2235294, 0, 1, 1,
0.5637326, -0.9988706, 3.342139, 0.2313726, 0, 1, 1,
0.5658722, 0.08824164, 2.129809, 0.2352941, 0, 1, 1,
0.5672445, 0.5185435, -0.05155599, 0.2431373, 0, 1, 1,
0.5692374, 1.580049, 1.30639, 0.2470588, 0, 1, 1,
0.5698349, -0.4865143, 1.453089, 0.254902, 0, 1, 1,
0.5764446, -0.7828623, 2.586161, 0.2588235, 0, 1, 1,
0.5899832, -1.516252, 4.380491, 0.2666667, 0, 1, 1,
0.5935195, -1.034791, 3.689591, 0.2705882, 0, 1, 1,
0.5971057, -1.584229, 1.329434, 0.2784314, 0, 1, 1,
0.5982919, 2.565968, -1.378989, 0.282353, 0, 1, 1,
0.5983205, 0.3641416, -1.15197, 0.2901961, 0, 1, 1,
0.5993802, 0.6067158, 0.4714192, 0.2941177, 0, 1, 1,
0.6013681, 0.2242586, 0.9976014, 0.3019608, 0, 1, 1,
0.6032069, -0.5634018, 1.49625, 0.3098039, 0, 1, 1,
0.605562, 0.6758487, 1.070896, 0.3137255, 0, 1, 1,
0.6093178, 1.093003, 0.03609087, 0.3215686, 0, 1, 1,
0.6166136, -0.280145, 1.942699, 0.3254902, 0, 1, 1,
0.6173476, 0.1152988, -0.5360765, 0.3333333, 0, 1, 1,
0.6176937, 0.1699148, 1.393404, 0.3372549, 0, 1, 1,
0.6177055, 0.4063929, -0.01418856, 0.345098, 0, 1, 1,
0.6177128, 0.3589302, 0.2267666, 0.3490196, 0, 1, 1,
0.6197475, 1.246882, -0.8476372, 0.3568628, 0, 1, 1,
0.6239988, -0.3040574, 2.443314, 0.3607843, 0, 1, 1,
0.6295834, 1.150592, 1.143736, 0.3686275, 0, 1, 1,
0.6308249, -1.064634, 2.144453, 0.372549, 0, 1, 1,
0.636162, -0.1243825, 2.987243, 0.3803922, 0, 1, 1,
0.6438774, 0.2269521, 0.8024468, 0.3843137, 0, 1, 1,
0.6571992, -1.082662, 2.152243, 0.3921569, 0, 1, 1,
0.6572725, -0.04169155, 1.493935, 0.3960784, 0, 1, 1,
0.6587437, -1.042549, 1.672342, 0.4039216, 0, 1, 1,
0.6610326, -1.229923, 4.220729, 0.4117647, 0, 1, 1,
0.6613292, -0.7560065, 1.629183, 0.4156863, 0, 1, 1,
0.6622481, -0.8380508, 1.53996, 0.4235294, 0, 1, 1,
0.6653091, -0.5359671, 4.813647, 0.427451, 0, 1, 1,
0.6727216, 1.207151, 0.6667005, 0.4352941, 0, 1, 1,
0.6733057, -0.4615063, -0.5683078, 0.4392157, 0, 1, 1,
0.6767701, -0.155034, 3.237824, 0.4470588, 0, 1, 1,
0.67766, 0.5015921, 1.010617, 0.4509804, 0, 1, 1,
0.6778826, -0.9196651, 2.365325, 0.4588235, 0, 1, 1,
0.6811113, -0.8924422, 2.76891, 0.4627451, 0, 1, 1,
0.684183, 0.2759493, 2.143208, 0.4705882, 0, 1, 1,
0.6865637, 0.2813958, 2.469856, 0.4745098, 0, 1, 1,
0.687396, -1.185733, 3.17664, 0.4823529, 0, 1, 1,
0.6896086, 0.3242465, -0.814357, 0.4862745, 0, 1, 1,
0.6905935, 1.20612, -0.5919886, 0.4941176, 0, 1, 1,
0.6947024, 0.0212871, 3.484736, 0.5019608, 0, 1, 1,
0.6984451, 0.6737293, -0.2476737, 0.5058824, 0, 1, 1,
0.7054423, 0.2167136, 0.2849872, 0.5137255, 0, 1, 1,
0.7058725, -0.0631526, 1.844923, 0.5176471, 0, 1, 1,
0.7068866, 1.098206, 1.055164, 0.5254902, 0, 1, 1,
0.7071869, 0.002198979, 2.879265, 0.5294118, 0, 1, 1,
0.7137093, -2.020142, 2.039454, 0.5372549, 0, 1, 1,
0.7140154, -0.6049096, 2.63465, 0.5411765, 0, 1, 1,
0.7180054, 0.7404619, -0.5438558, 0.5490196, 0, 1, 1,
0.7190389, -0.7403147, 0.7281071, 0.5529412, 0, 1, 1,
0.7221911, -1.099489, 1.044528, 0.5607843, 0, 1, 1,
0.7237089, -0.6334211, 0.3743896, 0.5647059, 0, 1, 1,
0.729695, -0.210267, 1.632456, 0.572549, 0, 1, 1,
0.7305964, -0.2212264, 1.543754, 0.5764706, 0, 1, 1,
0.7349201, -0.5175036, 3.124168, 0.5843138, 0, 1, 1,
0.737717, 0.6927739, -2.20315, 0.5882353, 0, 1, 1,
0.7383094, 0.5375303, 0.957501, 0.5960785, 0, 1, 1,
0.7411737, -0.876479, 2.138009, 0.6039216, 0, 1, 1,
0.7416329, 0.6232442, 0.75489, 0.6078432, 0, 1, 1,
0.7429708, 0.6881184, -0.5908184, 0.6156863, 0, 1, 1,
0.7440742, 0.7130993, 1.609281, 0.6196079, 0, 1, 1,
0.7483878, 0.09470922, 0.9991474, 0.627451, 0, 1, 1,
0.7494617, 0.1223868, 3.161203, 0.6313726, 0, 1, 1,
0.7520691, 1.753261, 1.166452, 0.6392157, 0, 1, 1,
0.7526308, -0.9442883, 2.350662, 0.6431373, 0, 1, 1,
0.761112, -0.3058235, 2.383522, 0.6509804, 0, 1, 1,
0.7612, 0.5589811, 2.681545, 0.654902, 0, 1, 1,
0.7630522, 0.005673898, 1.736879, 0.6627451, 0, 1, 1,
0.7725786, -0.5626045, 1.753495, 0.6666667, 0, 1, 1,
0.7758306, -1.336196, -0.4253545, 0.6745098, 0, 1, 1,
0.7758429, 0.5005826, 1.337432, 0.6784314, 0, 1, 1,
0.7764388, 0.5856752, 1.160687, 0.6862745, 0, 1, 1,
0.7775538, -0.2815836, 0.6358153, 0.6901961, 0, 1, 1,
0.7780468, -1.23411, 4.009489, 0.6980392, 0, 1, 1,
0.7830092, -0.4142892, 1.925076, 0.7058824, 0, 1, 1,
0.783867, 1.876755, 0.4586517, 0.7098039, 0, 1, 1,
0.7896714, -0.3712206, 3.375111, 0.7176471, 0, 1, 1,
0.7916221, -0.1681316, 2.253012, 0.7215686, 0, 1, 1,
0.7923988, -1.448261, 2.128477, 0.7294118, 0, 1, 1,
0.8000296, 0.4961776, 1.821694, 0.7333333, 0, 1, 1,
0.8035681, -1.187378, 2.184702, 0.7411765, 0, 1, 1,
0.8092043, -0.4431159, 1.793932, 0.7450981, 0, 1, 1,
0.8115735, 1.674983, 2.409405, 0.7529412, 0, 1, 1,
0.8179468, 0.7196841, 2.070361, 0.7568628, 0, 1, 1,
0.8181455, -1.273111, 1.208357, 0.7647059, 0, 1, 1,
0.8189096, 0.2156213, 1.865411, 0.7686275, 0, 1, 1,
0.8298031, -0.4424094, 3.002563, 0.7764706, 0, 1, 1,
0.8394475, -0.6151001, 2.92354, 0.7803922, 0, 1, 1,
0.844669, -0.9419267, 2.288673, 0.7882353, 0, 1, 1,
0.8488173, -0.1965383, 1.831255, 0.7921569, 0, 1, 1,
0.8580595, -1.521465, 2.036397, 0.8, 0, 1, 1,
0.8643619, 0.8091879, 0.09421612, 0.8078431, 0, 1, 1,
0.8693955, -0.009013991, 1.963581, 0.8117647, 0, 1, 1,
0.8697899, 0.2309667, 1.741142, 0.8196079, 0, 1, 1,
0.873117, 0.8579397, 1.129986, 0.8235294, 0, 1, 1,
0.8758523, -0.5696098, 2.32932, 0.8313726, 0, 1, 1,
0.8770542, 1.911468, -0.9582589, 0.8352941, 0, 1, 1,
0.8793213, -0.5427808, 2.39716, 0.8431373, 0, 1, 1,
0.8835318, -0.3483515, 2.540522, 0.8470588, 0, 1, 1,
0.8867239, -0.04859089, 2.220448, 0.854902, 0, 1, 1,
0.8893786, 1.097353, 0.7073044, 0.8588235, 0, 1, 1,
0.8909305, 0.5338385, -0.2430504, 0.8666667, 0, 1, 1,
0.8925046, -0.3520624, 1.235159, 0.8705882, 0, 1, 1,
0.8970772, -1.895949, 3.070603, 0.8784314, 0, 1, 1,
0.9092876, 0.1675132, 1.845774, 0.8823529, 0, 1, 1,
0.9116586, -0.2983909, 0.872875, 0.8901961, 0, 1, 1,
0.9205871, 0.6863565, 0.5272173, 0.8941177, 0, 1, 1,
0.9227046, 0.1707067, 2.952487, 0.9019608, 0, 1, 1,
0.9234254, 0.6870716, 2.689074, 0.9098039, 0, 1, 1,
0.9258219, -0.8144469, 3.978842, 0.9137255, 0, 1, 1,
0.9301184, -2.857466, 3.018323, 0.9215686, 0, 1, 1,
0.9314738, 1.877246, 0.03527625, 0.9254902, 0, 1, 1,
0.9488201, 2.156864, -0.09049211, 0.9333333, 0, 1, 1,
0.9494244, -0.9104152, 0.6022634, 0.9372549, 0, 1, 1,
0.9539199, 0.09220617, 1.51332, 0.945098, 0, 1, 1,
0.9541048, -0.1595718, 1.916498, 0.9490196, 0, 1, 1,
0.9545563, 1.319684, 1.761276, 0.9568627, 0, 1, 1,
0.9670135, -1.639518, 3.857404, 0.9607843, 0, 1, 1,
0.9704622, 0.8644741, 0.8877574, 0.9686275, 0, 1, 1,
0.9738966, -0.4956797, 1.561871, 0.972549, 0, 1, 1,
0.9743782, -0.8177681, 2.353191, 0.9803922, 0, 1, 1,
0.9749982, 0.5342727, -0.09737522, 0.9843137, 0, 1, 1,
0.9754941, -1.259133, 3.476514, 0.9921569, 0, 1, 1,
0.9773305, -1.76282, 2.648657, 0.9960784, 0, 1, 1,
0.9829891, 0.6700473, 1.560329, 1, 0, 0.9960784, 1,
0.9833264, -1.311478, 1.601892, 1, 0, 0.9882353, 1,
0.9876522, 0.8551401, 0.8033016, 1, 0, 0.9843137, 1,
0.9903718, -1.680783, 2.646373, 1, 0, 0.9764706, 1,
0.9963102, 0.1676017, 0.4191139, 1, 0, 0.972549, 1,
0.9995499, 1.027916, 1.572419, 1, 0, 0.9647059, 1,
1.007958, -1.208868, 2.073439, 1, 0, 0.9607843, 1,
1.016065, 0.3386516, -0.6352725, 1, 0, 0.9529412, 1,
1.019579, -1.049222, 4.102593, 1, 0, 0.9490196, 1,
1.025896, -0.8650122, 2.020803, 1, 0, 0.9411765, 1,
1.030793, -0.7477213, 3.219925, 1, 0, 0.9372549, 1,
1.032081, -1.129824, 4.626214, 1, 0, 0.9294118, 1,
1.036022, -0.4716493, 2.603949, 1, 0, 0.9254902, 1,
1.039147, -0.8946884, 1.62459, 1, 0, 0.9176471, 1,
1.041618, -0.8147169, 1.555162, 1, 0, 0.9137255, 1,
1.044803, 0.1329155, 1.285301, 1, 0, 0.9058824, 1,
1.04896, -0.1401951, 1.500546, 1, 0, 0.9019608, 1,
1.056288, 0.3328121, -0.4132387, 1, 0, 0.8941177, 1,
1.056692, 0.2892514, 1.18468, 1, 0, 0.8862745, 1,
1.061628, -1.998405, 2.671481, 1, 0, 0.8823529, 1,
1.064014, 0.6010672, 0.1173063, 1, 0, 0.8745098, 1,
1.073376, -0.4692285, 3.011032, 1, 0, 0.8705882, 1,
1.074334, -1.553653, 1.443634, 1, 0, 0.8627451, 1,
1.077506, 0.9093236, 1.197923, 1, 0, 0.8588235, 1,
1.080798, 0.2540339, -0.1904053, 1, 0, 0.8509804, 1,
1.083523, 0.1499002, 1.279393, 1, 0, 0.8470588, 1,
1.085116, 0.8220581, 1.809937, 1, 0, 0.8392157, 1,
1.085703, -0.0858119, 1.350137, 1, 0, 0.8352941, 1,
1.101011, -0.1559771, 3.403131, 1, 0, 0.827451, 1,
1.107187, 0.9738793, 0.1594022, 1, 0, 0.8235294, 1,
1.114154, -0.8940321, 3.00215, 1, 0, 0.8156863, 1,
1.120755, -1.241712, 2.338058, 1, 0, 0.8117647, 1,
1.123707, 0.6950949, 0.8670416, 1, 0, 0.8039216, 1,
1.124546, 0.2394901, 2.290343, 1, 0, 0.7960784, 1,
1.124632, 0.843155, 1.801039, 1, 0, 0.7921569, 1,
1.127337, 0.4649921, 0.6989449, 1, 0, 0.7843137, 1,
1.134093, -0.9990598, 1.671834, 1, 0, 0.7803922, 1,
1.136046, 0.8097669, 3.231911, 1, 0, 0.772549, 1,
1.138664, -0.8334367, 1.584451, 1, 0, 0.7686275, 1,
1.144253, -0.7610233, 0.5352985, 1, 0, 0.7607843, 1,
1.151337, 0.3192847, 0.2747538, 1, 0, 0.7568628, 1,
1.156963, 0.7449867, 2.995546, 1, 0, 0.7490196, 1,
1.158838, 0.6756067, 1.490846, 1, 0, 0.7450981, 1,
1.166839, -0.2495288, 1.371788, 1, 0, 0.7372549, 1,
1.171013, -1.261505, 2.655948, 1, 0, 0.7333333, 1,
1.174459, -1.75225, 2.987013, 1, 0, 0.7254902, 1,
1.177968, -0.6196631, 0.8371408, 1, 0, 0.7215686, 1,
1.195244, 3.097097, -1.053301, 1, 0, 0.7137255, 1,
1.200475, -1.29023, 3.025816, 1, 0, 0.7098039, 1,
1.203062, -0.1830436, 1.449244, 1, 0, 0.7019608, 1,
1.208903, 0.07227018, 4.373221, 1, 0, 0.6941177, 1,
1.210762, -0.1675841, 1.505866, 1, 0, 0.6901961, 1,
1.213596, -0.6451858, 2.284724, 1, 0, 0.682353, 1,
1.213744, 0.3752913, 3.507672, 1, 0, 0.6784314, 1,
1.216987, 0.5524709, 1.604762, 1, 0, 0.6705883, 1,
1.217055, 1.366064, 1.616124, 1, 0, 0.6666667, 1,
1.217674, 1.292392, 1.539693, 1, 0, 0.6588235, 1,
1.218879, 1.862839, 1.844345, 1, 0, 0.654902, 1,
1.220924, 1.148126, 1.586042, 1, 0, 0.6470588, 1,
1.230429, -0.06357594, 1.388563, 1, 0, 0.6431373, 1,
1.231331, 0.149471, 0.1874186, 1, 0, 0.6352941, 1,
1.247844, -0.9533214, 3.85507, 1, 0, 0.6313726, 1,
1.262289, -0.05970256, 2.997489, 1, 0, 0.6235294, 1,
1.274345, 0.6643278, -0.1710917, 1, 0, 0.6196079, 1,
1.274422, -0.9730325, 0.6969723, 1, 0, 0.6117647, 1,
1.275893, 0.9911163, 0.5717126, 1, 0, 0.6078432, 1,
1.289983, 0.3022979, 2.027953, 1, 0, 0.6, 1,
1.292359, -0.2856482, 2.049049, 1, 0, 0.5921569, 1,
1.292513, -0.4098979, 1.343604, 1, 0, 0.5882353, 1,
1.320073, 1.293842, 1.300696, 1, 0, 0.5803922, 1,
1.321678, -0.3487503, 1.949082, 1, 0, 0.5764706, 1,
1.324328, -0.1498349, 2.587276, 1, 0, 0.5686275, 1,
1.341047, 0.3878552, 0.1531777, 1, 0, 0.5647059, 1,
1.345951, 0.6648757, 0.8151038, 1, 0, 0.5568628, 1,
1.34604, 1.037008, 0.2705912, 1, 0, 0.5529412, 1,
1.350115, 2.030537, 0.6381965, 1, 0, 0.5450981, 1,
1.350663, 1.53863, 0.6142945, 1, 0, 0.5411765, 1,
1.352953, -2.245162, 3.506659, 1, 0, 0.5333334, 1,
1.356773, -0.6838788, 1.476199, 1, 0, 0.5294118, 1,
1.377365, -0.5773473, 1.742731, 1, 0, 0.5215687, 1,
1.383724, 1.386842, 0.3453358, 1, 0, 0.5176471, 1,
1.390959, -1.061284, 0.5323349, 1, 0, 0.509804, 1,
1.392106, -0.022473, 2.76853, 1, 0, 0.5058824, 1,
1.397555, -0.8656923, 2.937532, 1, 0, 0.4980392, 1,
1.399032, -0.1177644, 1.768367, 1, 0, 0.4901961, 1,
1.441189, 1.041119, 0.8906229, 1, 0, 0.4862745, 1,
1.441701, 0.3827218, 1.090177, 1, 0, 0.4784314, 1,
1.448455, 1.23149, 1.637875, 1, 0, 0.4745098, 1,
1.462006, -0.4390025, 4.283092, 1, 0, 0.4666667, 1,
1.471196, 0.8930283, 0.2518168, 1, 0, 0.4627451, 1,
1.472094, 0.598986, 1.369922, 1, 0, 0.454902, 1,
1.482952, -0.8777327, 2.653043, 1, 0, 0.4509804, 1,
1.488454, 0.1137985, 0.5487567, 1, 0, 0.4431373, 1,
1.494053, -1.488405, 1.848537, 1, 0, 0.4392157, 1,
1.508655, 1.526473, 2.292144, 1, 0, 0.4313726, 1,
1.511975, 0.2422943, 2.00157, 1, 0, 0.427451, 1,
1.527497, -0.3976098, 3.104804, 1, 0, 0.4196078, 1,
1.529489, 0.1517694, 1.876788, 1, 0, 0.4156863, 1,
1.533767, 0.6812325, 0.1028518, 1, 0, 0.4078431, 1,
1.537385, 1.545298, 0.8828285, 1, 0, 0.4039216, 1,
1.546007, -0.7843955, 1.374267, 1, 0, 0.3960784, 1,
1.563682, -1.164525, 2.307801, 1, 0, 0.3882353, 1,
1.563691, 2.381893, 0.2982168, 1, 0, 0.3843137, 1,
1.563995, 0.7874897, 1.460244, 1, 0, 0.3764706, 1,
1.574127, 1.169302, 0.4773101, 1, 0, 0.372549, 1,
1.595273, -1.296987, 1.22235, 1, 0, 0.3647059, 1,
1.597442, -0.1605766, 2.05465, 1, 0, 0.3607843, 1,
1.60212, 0.1520324, 3.727828, 1, 0, 0.3529412, 1,
1.609887, -0.1904598, 0.4228882, 1, 0, 0.3490196, 1,
1.61122, -0.1535496, 0.4815839, 1, 0, 0.3411765, 1,
1.615124, 0.8084486, 0.5335146, 1, 0, 0.3372549, 1,
1.646285, 0.2952798, 2.586794, 1, 0, 0.3294118, 1,
1.661759, -1.610525, 2.08548, 1, 0, 0.3254902, 1,
1.662361, -0.7619187, 0.7331791, 1, 0, 0.3176471, 1,
1.68974, 1.088035, -0.4632476, 1, 0, 0.3137255, 1,
1.698359, -0.5852961, 1.832983, 1, 0, 0.3058824, 1,
1.701443, 0.2428635, 2.408358, 1, 0, 0.2980392, 1,
1.715299, 1.462094, 1.401501, 1, 0, 0.2941177, 1,
1.723889, 0.3115248, 0.05492353, 1, 0, 0.2862745, 1,
1.740648, 0.08140825, 1.902651, 1, 0, 0.282353, 1,
1.755242, -0.6812256, 1.697378, 1, 0, 0.2745098, 1,
1.7646, -0.01653759, -0.3175676, 1, 0, 0.2705882, 1,
1.771791, -0.8421564, 1.312562, 1, 0, 0.2627451, 1,
1.776269, -1.331575, 1.361412, 1, 0, 0.2588235, 1,
1.779075, -0.4055153, 1.737263, 1, 0, 0.2509804, 1,
1.795364, -1.247158, 1.819115, 1, 0, 0.2470588, 1,
1.798718, -0.8286092, 2.60987, 1, 0, 0.2392157, 1,
1.815827, 0.7265198, -0.06072211, 1, 0, 0.2352941, 1,
1.852806, 0.4181478, 1.632402, 1, 0, 0.227451, 1,
1.870335, -1.322887, 0.8928554, 1, 0, 0.2235294, 1,
1.875988, 0.009011986, 2.057793, 1, 0, 0.2156863, 1,
1.879673, -0.4027769, 2.951387, 1, 0, 0.2117647, 1,
1.90344, -0.8523262, 4.762465, 1, 0, 0.2039216, 1,
1.913846, -0.6922132, 2.677457, 1, 0, 0.1960784, 1,
1.956619, 2.084382, 0.7451485, 1, 0, 0.1921569, 1,
1.988569, 1.074293, 0.7485767, 1, 0, 0.1843137, 1,
1.995983, 0.1545463, 1.871273, 1, 0, 0.1803922, 1,
2.046595, -0.07518391, 3.410942, 1, 0, 0.172549, 1,
2.117429, -0.5860294, 2.089694, 1, 0, 0.1686275, 1,
2.131302, -1.325939, 4.594113, 1, 0, 0.1607843, 1,
2.144429, -0.5209826, 3.090999, 1, 0, 0.1568628, 1,
2.149469, -0.6379918, 0.4683026, 1, 0, 0.1490196, 1,
2.150543, -0.6851708, 2.127259, 1, 0, 0.145098, 1,
2.172855, 0.2123028, 0.9066003, 1, 0, 0.1372549, 1,
2.209096, 0.4548363, 1.829559, 1, 0, 0.1333333, 1,
2.235709, -1.302891, 1.324584, 1, 0, 0.1254902, 1,
2.253269, 0.1508386, 2.67005, 1, 0, 0.1215686, 1,
2.262545, -0.1400346, 1.646961, 1, 0, 0.1137255, 1,
2.291885, -0.5914976, 1.158001, 1, 0, 0.1098039, 1,
2.297688, -0.2206567, 1.456653, 1, 0, 0.1019608, 1,
2.359015, -0.9136187, 2.133037, 1, 0, 0.09411765, 1,
2.39493, 0.8296375, 2.056974, 1, 0, 0.09019608, 1,
2.417914, -0.8614366, 1.941252, 1, 0, 0.08235294, 1,
2.418347, -1.431765, 1.920965, 1, 0, 0.07843138, 1,
2.434945, 0.4490907, 2.39886, 1, 0, 0.07058824, 1,
2.469499, 0.8622501, 1.57793, 1, 0, 0.06666667, 1,
2.584611, 1.664477, 2.73096, 1, 0, 0.05882353, 1,
2.608639, 1.242325, 0.7380439, 1, 0, 0.05490196, 1,
2.61409, -0.5037183, 0.8504725, 1, 0, 0.04705882, 1,
2.655063, 0.2485605, 2.170281, 1, 0, 0.04313726, 1,
2.716964, 0.9604513, -0.9778386, 1, 0, 0.03529412, 1,
2.781894, -1.215968, 2.062713, 1, 0, 0.03137255, 1,
2.787617, 0.1161061, 2.051587, 1, 0, 0.02352941, 1,
2.839016, -1.241, 0.1327043, 1, 0, 0.01960784, 1,
3.276371, -0.03928474, 0.2590878, 1, 0, 0.01176471, 1,
3.371479, -0.4472463, 0.8388937, 1, 0, 0.007843138, 1
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
0.1927316, -4.740243, -7.227521, 0, -0.5, 0.5, 0.5,
0.1927316, -4.740243, -7.227521, 1, -0.5, 0.5, 0.5,
0.1927316, -4.740243, -7.227521, 1, 1.5, 0.5, 0.5,
0.1927316, -4.740243, -7.227521, 0, 1.5, 0.5, 0.5
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
-4.063611, -0.2536253, -7.227521, 0, -0.5, 0.5, 0.5,
-4.063611, -0.2536253, -7.227521, 1, -0.5, 0.5, 0.5,
-4.063611, -0.2536253, -7.227521, 1, 1.5, 0.5, 0.5,
-4.063611, -0.2536253, -7.227521, 0, 1.5, 0.5, 0.5
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
-4.063611, -4.740243, 0.1463449, 0, -0.5, 0.5, 0.5,
-4.063611, -4.740243, 0.1463449, 1, -0.5, 0.5, 0.5,
-4.063611, -4.740243, 0.1463449, 1, 1.5, 0.5, 0.5,
-4.063611, -4.740243, 0.1463449, 0, 1.5, 0.5, 0.5
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
-2, -3.70487, -5.525859,
3, -3.70487, -5.525859,
-2, -3.70487, -5.525859,
-2, -3.877432, -5.80947,
-1, -3.70487, -5.525859,
-1, -3.877432, -5.80947,
0, -3.70487, -5.525859,
0, -3.877432, -5.80947,
1, -3.70487, -5.525859,
1, -3.877432, -5.80947,
2, -3.70487, -5.525859,
2, -3.877432, -5.80947,
3, -3.70487, -5.525859,
3, -3.877432, -5.80947
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
-2, -4.222556, -6.37669, 0, -0.5, 0.5, 0.5,
-2, -4.222556, -6.37669, 1, -0.5, 0.5, 0.5,
-2, -4.222556, -6.37669, 1, 1.5, 0.5, 0.5,
-2, -4.222556, -6.37669, 0, 1.5, 0.5, 0.5,
-1, -4.222556, -6.37669, 0, -0.5, 0.5, 0.5,
-1, -4.222556, -6.37669, 1, -0.5, 0.5, 0.5,
-1, -4.222556, -6.37669, 1, 1.5, 0.5, 0.5,
-1, -4.222556, -6.37669, 0, 1.5, 0.5, 0.5,
0, -4.222556, -6.37669, 0, -0.5, 0.5, 0.5,
0, -4.222556, -6.37669, 1, -0.5, 0.5, 0.5,
0, -4.222556, -6.37669, 1, 1.5, 0.5, 0.5,
0, -4.222556, -6.37669, 0, 1.5, 0.5, 0.5,
1, -4.222556, -6.37669, 0, -0.5, 0.5, 0.5,
1, -4.222556, -6.37669, 1, -0.5, 0.5, 0.5,
1, -4.222556, -6.37669, 1, 1.5, 0.5, 0.5,
1, -4.222556, -6.37669, 0, 1.5, 0.5, 0.5,
2, -4.222556, -6.37669, 0, -0.5, 0.5, 0.5,
2, -4.222556, -6.37669, 1, -0.5, 0.5, 0.5,
2, -4.222556, -6.37669, 1, 1.5, 0.5, 0.5,
2, -4.222556, -6.37669, 0, 1.5, 0.5, 0.5,
3, -4.222556, -6.37669, 0, -0.5, 0.5, 0.5,
3, -4.222556, -6.37669, 1, -0.5, 0.5, 0.5,
3, -4.222556, -6.37669, 1, 1.5, 0.5, 0.5,
3, -4.222556, -6.37669, 0, 1.5, 0.5, 0.5
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
-3.081378, -3, -5.525859,
-3.081378, 3, -5.525859,
-3.081378, -3, -5.525859,
-3.245084, -3, -5.80947,
-3.081378, -2, -5.525859,
-3.245084, -2, -5.80947,
-3.081378, -1, -5.525859,
-3.245084, -1, -5.80947,
-3.081378, 0, -5.525859,
-3.245084, 0, -5.80947,
-3.081378, 1, -5.525859,
-3.245084, 1, -5.80947,
-3.081378, 2, -5.525859,
-3.245084, 2, -5.80947,
-3.081378, 3, -5.525859,
-3.245084, 3, -5.80947
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
-3.572495, -3, -6.37669, 0, -0.5, 0.5, 0.5,
-3.572495, -3, -6.37669, 1, -0.5, 0.5, 0.5,
-3.572495, -3, -6.37669, 1, 1.5, 0.5, 0.5,
-3.572495, -3, -6.37669, 0, 1.5, 0.5, 0.5,
-3.572495, -2, -6.37669, 0, -0.5, 0.5, 0.5,
-3.572495, -2, -6.37669, 1, -0.5, 0.5, 0.5,
-3.572495, -2, -6.37669, 1, 1.5, 0.5, 0.5,
-3.572495, -2, -6.37669, 0, 1.5, 0.5, 0.5,
-3.572495, -1, -6.37669, 0, -0.5, 0.5, 0.5,
-3.572495, -1, -6.37669, 1, -0.5, 0.5, 0.5,
-3.572495, -1, -6.37669, 1, 1.5, 0.5, 0.5,
-3.572495, -1, -6.37669, 0, 1.5, 0.5, 0.5,
-3.572495, 0, -6.37669, 0, -0.5, 0.5, 0.5,
-3.572495, 0, -6.37669, 1, -0.5, 0.5, 0.5,
-3.572495, 0, -6.37669, 1, 1.5, 0.5, 0.5,
-3.572495, 0, -6.37669, 0, 1.5, 0.5, 0.5,
-3.572495, 1, -6.37669, 0, -0.5, 0.5, 0.5,
-3.572495, 1, -6.37669, 1, -0.5, 0.5, 0.5,
-3.572495, 1, -6.37669, 1, 1.5, 0.5, 0.5,
-3.572495, 1, -6.37669, 0, 1.5, 0.5, 0.5,
-3.572495, 2, -6.37669, 0, -0.5, 0.5, 0.5,
-3.572495, 2, -6.37669, 1, -0.5, 0.5, 0.5,
-3.572495, 2, -6.37669, 1, 1.5, 0.5, 0.5,
-3.572495, 2, -6.37669, 0, 1.5, 0.5, 0.5,
-3.572495, 3, -6.37669, 0, -0.5, 0.5, 0.5,
-3.572495, 3, -6.37669, 1, -0.5, 0.5, 0.5,
-3.572495, 3, -6.37669, 1, 1.5, 0.5, 0.5,
-3.572495, 3, -6.37669, 0, 1.5, 0.5, 0.5
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
-3.081378, -3.70487, -4,
-3.081378, -3.70487, 4,
-3.081378, -3.70487, -4,
-3.245084, -3.877432, -4,
-3.081378, -3.70487, -2,
-3.245084, -3.877432, -2,
-3.081378, -3.70487, 0,
-3.245084, -3.877432, 0,
-3.081378, -3.70487, 2,
-3.245084, -3.877432, 2,
-3.081378, -3.70487, 4,
-3.245084, -3.877432, 4
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
-3.572495, -4.222556, -4, 0, -0.5, 0.5, 0.5,
-3.572495, -4.222556, -4, 1, -0.5, 0.5, 0.5,
-3.572495, -4.222556, -4, 1, 1.5, 0.5, 0.5,
-3.572495, -4.222556, -4, 0, 1.5, 0.5, 0.5,
-3.572495, -4.222556, -2, 0, -0.5, 0.5, 0.5,
-3.572495, -4.222556, -2, 1, -0.5, 0.5, 0.5,
-3.572495, -4.222556, -2, 1, 1.5, 0.5, 0.5,
-3.572495, -4.222556, -2, 0, 1.5, 0.5, 0.5,
-3.572495, -4.222556, 0, 0, -0.5, 0.5, 0.5,
-3.572495, -4.222556, 0, 1, -0.5, 0.5, 0.5,
-3.572495, -4.222556, 0, 1, 1.5, 0.5, 0.5,
-3.572495, -4.222556, 0, 0, 1.5, 0.5, 0.5,
-3.572495, -4.222556, 2, 0, -0.5, 0.5, 0.5,
-3.572495, -4.222556, 2, 1, -0.5, 0.5, 0.5,
-3.572495, -4.222556, 2, 1, 1.5, 0.5, 0.5,
-3.572495, -4.222556, 2, 0, 1.5, 0.5, 0.5,
-3.572495, -4.222556, 4, 0, -0.5, 0.5, 0.5,
-3.572495, -4.222556, 4, 1, -0.5, 0.5, 0.5,
-3.572495, -4.222556, 4, 1, 1.5, 0.5, 0.5,
-3.572495, -4.222556, 4, 0, 1.5, 0.5, 0.5
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
-3.081378, -3.70487, -5.525859,
-3.081378, 3.197619, -5.525859,
-3.081378, -3.70487, 5.818549,
-3.081378, 3.197619, 5.818549,
-3.081378, -3.70487, -5.525859,
-3.081378, -3.70487, 5.818549,
-3.081378, 3.197619, -5.525859,
-3.081378, 3.197619, 5.818549,
-3.081378, -3.70487, -5.525859,
3.466841, -3.70487, -5.525859,
-3.081378, -3.70487, 5.818549,
3.466841, -3.70487, 5.818549,
-3.081378, 3.197619, -5.525859,
3.466841, 3.197619, -5.525859,
-3.081378, 3.197619, 5.818549,
3.466841, 3.197619, 5.818549,
3.466841, -3.70487, -5.525859,
3.466841, 3.197619, -5.525859,
3.466841, -3.70487, 5.818549,
3.466841, 3.197619, 5.818549,
3.466841, -3.70487, -5.525859,
3.466841, -3.70487, 5.818549,
3.466841, 3.197619, -5.525859,
3.466841, 3.197619, 5.818549
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
var radius = 7.906143;
var distance = 35.17532;
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
mvMatrix.translate( -0.1927316, 0.2536253, -0.1463449 );
mvMatrix.scale( 1.305435, 1.238434, 0.7535234 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.17532);
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
arsenate_lead_arsena<-read.table("arsenate_lead_arsena.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-arsenate_lead_arsena$V2
```

```
## Error in eval(expr, envir, enclos): object 'arsenate_lead_arsena' not found
```

```r
y<-arsenate_lead_arsena$V3
```

```
## Error in eval(expr, envir, enclos): object 'arsenate_lead_arsena' not found
```

```r
z<-arsenate_lead_arsena$V4
```

```
## Error in eval(expr, envir, enclos): object 'arsenate_lead_arsena' not found
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
-2.986016, -0.2748899, -2.351688, 0, 0, 1, 1, 1,
-2.846744, -0.3969523, -2.593366, 1, 0, 0, 1, 1,
-2.829332, 1.540731, -1.433092, 1, 0, 0, 1, 1,
-2.82478, -0.07753289, -1.068278, 1, 0, 0, 1, 1,
-2.7947, -2.031512, -3.28035, 1, 0, 0, 1, 1,
-2.787828, -0.1239719, -0.7615991, 1, 0, 0, 1, 1,
-2.60381, 0.6229675, -0.426328, 0, 0, 0, 1, 1,
-2.602014, -1.120258, -3.268085, 0, 0, 0, 1, 1,
-2.53973, -0.4705546, -2.381286, 0, 0, 0, 1, 1,
-2.51563, -0.08581343, -2.218855, 0, 0, 0, 1, 1,
-2.512103, -1.659339, -2.55303, 0, 0, 0, 1, 1,
-2.369929, 0.09097303, -0.6471499, 0, 0, 0, 1, 1,
-2.362843, -0.5255988, -3.736431, 0, 0, 0, 1, 1,
-2.314374, 0.06303302, -0.2503295, 1, 1, 1, 1, 1,
-2.289325, 1.110921, -0.08578775, 1, 1, 1, 1, 1,
-2.285898, 0.4920844, -1.046387, 1, 1, 1, 1, 1,
-2.278084, -1.407656, -1.74034, 1, 1, 1, 1, 1,
-2.231223, 0.05804538, -1.013493, 1, 1, 1, 1, 1,
-2.208007, -1.912997, -2.253147, 1, 1, 1, 1, 1,
-2.1668, 0.4779702, -2.261707, 1, 1, 1, 1, 1,
-2.158818, -0.7994624, -2.134516, 1, 1, 1, 1, 1,
-2.154085, -1.581397, -2.118786, 1, 1, 1, 1, 1,
-2.143982, 0.6882493, -1.028608, 1, 1, 1, 1, 1,
-2.141103, 0.2539214, -1.925413, 1, 1, 1, 1, 1,
-2.111013, -0.1092524, -1.040326, 1, 1, 1, 1, 1,
-2.084682, -0.4106889, -2.501051, 1, 1, 1, 1, 1,
-2.038856, 0.5562878, -0.5389858, 1, 1, 1, 1, 1,
-1.991855, -0.4432796, 0.02484484, 1, 1, 1, 1, 1,
-1.974389, -0.4487777, -1.138427, 0, 0, 1, 1, 1,
-1.963805, -0.2579497, -0.6187817, 1, 0, 0, 1, 1,
-1.962483, 0.3250995, -2.206454, 1, 0, 0, 1, 1,
-1.954587, -1.285032, -1.753901, 1, 0, 0, 1, 1,
-1.928769, -1.06469, -2.113802, 1, 0, 0, 1, 1,
-1.927623, -0.9543967, -2.285333, 1, 0, 0, 1, 1,
-1.919961, -0.5985062, -0.8611912, 0, 0, 0, 1, 1,
-1.907255, 0.002329063, -1.01789, 0, 0, 0, 1, 1,
-1.905762, 0.7594787, -1.908284, 0, 0, 0, 1, 1,
-1.899798, -0.5347134, -2.109292, 0, 0, 0, 1, 1,
-1.895764, -0.4502371, -1.613796, 0, 0, 0, 1, 1,
-1.859242, 0.3154022, -1.177577, 0, 0, 0, 1, 1,
-1.853722, 0.08962153, -0.2210232, 0, 0, 0, 1, 1,
-1.852841, -0.9505405, -0.7564746, 1, 1, 1, 1, 1,
-1.848668, 2.490939, 0.9310479, 1, 1, 1, 1, 1,
-1.848416, -1.185869, -3.266249, 1, 1, 1, 1, 1,
-1.831506, 0.6304781, -2.434497, 1, 1, 1, 1, 1,
-1.826192, 0.02192752, -0.223238, 1, 1, 1, 1, 1,
-1.809652, -0.3960595, -2.697454, 1, 1, 1, 1, 1,
-1.801633, 0.2749141, -1.933069, 1, 1, 1, 1, 1,
-1.798322, -0.3953634, -3.259804, 1, 1, 1, 1, 1,
-1.796652, 0.5280797, -0.3657802, 1, 1, 1, 1, 1,
-1.785441, 0.8770027, -0.9313765, 1, 1, 1, 1, 1,
-1.77083, 1.298235, 0.06039774, 1, 1, 1, 1, 1,
-1.760114, 0.7673672, -2.472226, 1, 1, 1, 1, 1,
-1.749417, 1.155615, -2.089278, 1, 1, 1, 1, 1,
-1.720289, -0.410549, -1.820918, 1, 1, 1, 1, 1,
-1.717153, -0.2146806, -1.904177, 1, 1, 1, 1, 1,
-1.665097, 0.07318538, 0.07485623, 0, 0, 1, 1, 1,
-1.664483, 1.693363, -1.215219, 1, 0, 0, 1, 1,
-1.650822, -0.6836222, -1.894186, 1, 0, 0, 1, 1,
-1.649578, -0.5337809, -2.153738, 1, 0, 0, 1, 1,
-1.640431, 0.7782609, -1.38487, 1, 0, 0, 1, 1,
-1.640424, -0.5411453, -1.928864, 1, 0, 0, 1, 1,
-1.63342, -0.05624065, 0.4693942, 0, 0, 0, 1, 1,
-1.609348, -0.3828098, -2.45493, 0, 0, 0, 1, 1,
-1.584967, 1.376861, -0.8074269, 0, 0, 0, 1, 1,
-1.572901, 0.5968562, -1.795384, 0, 0, 0, 1, 1,
-1.560328, 0.03116968, -0.8084909, 0, 0, 0, 1, 1,
-1.558676, -0.3863113, -1.898423, 0, 0, 0, 1, 1,
-1.54911, 0.006696782, -0.6725675, 0, 0, 0, 1, 1,
-1.533557, -0.2034782, -3.529873, 1, 1, 1, 1, 1,
-1.520545, 0.7576361, -1.49624, 1, 1, 1, 1, 1,
-1.519824, -0.003889873, -2.596865, 1, 1, 1, 1, 1,
-1.518144, -1.944003, -4.419846, 1, 1, 1, 1, 1,
-1.508658, 1.701067, -0.6232732, 1, 1, 1, 1, 1,
-1.505165, 0.9297832, -2.105709, 1, 1, 1, 1, 1,
-1.489053, -0.2810902, -1.540222, 1, 1, 1, 1, 1,
-1.486857, 1.750519, -1.124154, 1, 1, 1, 1, 1,
-1.480214, -0.8549636, -1.916331, 1, 1, 1, 1, 1,
-1.479773, -0.2290541, -2.685777, 1, 1, 1, 1, 1,
-1.477965, -0.1542992, -2.607432, 1, 1, 1, 1, 1,
-1.471401, 0.6584328, -0.4817407, 1, 1, 1, 1, 1,
-1.455518, -0.3613249, -2.425248, 1, 1, 1, 1, 1,
-1.451737, 0.3534104, -1.645126, 1, 1, 1, 1, 1,
-1.439282, -0.1344829, -1.454656, 1, 1, 1, 1, 1,
-1.427863, 0.2171216, -1.092221, 0, 0, 1, 1, 1,
-1.424752, 0.5812908, -0.5103711, 1, 0, 0, 1, 1,
-1.42086, -0.1638891, -4.120495, 1, 0, 0, 1, 1,
-1.420795, 0.4953044, -0.5435522, 1, 0, 0, 1, 1,
-1.418455, 0.003826281, -0.7267291, 1, 0, 0, 1, 1,
-1.406369, 0.1213575, -0.1449029, 1, 0, 0, 1, 1,
-1.37949, 0.1512343, -2.095206, 0, 0, 0, 1, 1,
-1.362208, 0.8157988, -1.345461, 0, 0, 0, 1, 1,
-1.361711, 0.9687648, -0.4853777, 0, 0, 0, 1, 1,
-1.361621, -0.8588635, 0.1595135, 0, 0, 0, 1, 1,
-1.341865, -0.3354847, -1.053899, 0, 0, 0, 1, 1,
-1.338972, 0.5247552, -0.02734066, 0, 0, 0, 1, 1,
-1.334291, 0.1275645, -2.10444, 0, 0, 0, 1, 1,
-1.330079, -0.3925625, -0.8981022, 1, 1, 1, 1, 1,
-1.32691, -0.2578743, -1.904351, 1, 1, 1, 1, 1,
-1.320791, -1.208029, -1.776979, 1, 1, 1, 1, 1,
-1.316874, 0.3323101, -1.937952, 1, 1, 1, 1, 1,
-1.313951, 0.4633662, -0.8525439, 1, 1, 1, 1, 1,
-1.290951, -0.4573691, -1.654345, 1, 1, 1, 1, 1,
-1.287931, 1.08933, -0.97201, 1, 1, 1, 1, 1,
-1.277411, -0.5886801, -1.698868, 1, 1, 1, 1, 1,
-1.261867, 0.5136829, -0.3781087, 1, 1, 1, 1, 1,
-1.252385, -0.6012259, -1.796267, 1, 1, 1, 1, 1,
-1.249405, 0.4756733, -1.658432, 1, 1, 1, 1, 1,
-1.238001, -0.4064243, -0.422153, 1, 1, 1, 1, 1,
-1.225561, -0.2878261, -1.989638, 1, 1, 1, 1, 1,
-1.225447, -0.3206721, -2.886709, 1, 1, 1, 1, 1,
-1.222143, 1.610455, -0.6531172, 1, 1, 1, 1, 1,
-1.204655, -0.7708768, -2.550547, 0, 0, 1, 1, 1,
-1.203109, 0.6684086, -1.477154, 1, 0, 0, 1, 1,
-1.199419, 0.3437558, -0.9734964, 1, 0, 0, 1, 1,
-1.194506, 0.3738794, -0.8618961, 1, 0, 0, 1, 1,
-1.18687, 0.8782087, -0.6878564, 1, 0, 0, 1, 1,
-1.177379, 0.5815036, 0.1741893, 1, 0, 0, 1, 1,
-1.173423, 0.1947529, -0.8680758, 0, 0, 0, 1, 1,
-1.168724, 0.2182126, -2.32319, 0, 0, 0, 1, 1,
-1.166655, -2.223332, -3.768811, 0, 0, 0, 1, 1,
-1.164234, -0.2588751, -2.435792, 0, 0, 0, 1, 1,
-1.162241, -0.8546597, -2.888021, 0, 0, 0, 1, 1,
-1.161574, 0.7769026, -0.6339228, 0, 0, 0, 1, 1,
-1.156719, -1.558644, -2.086759, 0, 0, 0, 1, 1,
-1.153338, -0.4498461, -2.225733, 1, 1, 1, 1, 1,
-1.152063, 0.2091752, -1.108214, 1, 1, 1, 1, 1,
-1.151051, 0.9341146, 0.1817807, 1, 1, 1, 1, 1,
-1.146731, 0.8200498, -1.509816, 1, 1, 1, 1, 1,
-1.14276, 1.326333, -1.188191, 1, 1, 1, 1, 1,
-1.138891, 0.5445313, -1.156064, 1, 1, 1, 1, 1,
-1.138393, 0.6801543, -0.608124, 1, 1, 1, 1, 1,
-1.128369, 0.2284162, -1.568459, 1, 1, 1, 1, 1,
-1.117844, -0.5539024, -1.718253, 1, 1, 1, 1, 1,
-1.113841, 0.4754349, -0.9674335, 1, 1, 1, 1, 1,
-1.105263, 0.3113988, -1.937119, 1, 1, 1, 1, 1,
-1.097583, 0.8120972, -1.276308, 1, 1, 1, 1, 1,
-1.080582, -0.6103494, -4.160319, 1, 1, 1, 1, 1,
-1.079852, -0.6938682, -3.433848, 1, 1, 1, 1, 1,
-1.073932, -0.685976, -1.947445, 1, 1, 1, 1, 1,
-1.071453, 0.4472348, -0.2657962, 0, 0, 1, 1, 1,
-1.071431, 1.40897, -0.497192, 1, 0, 0, 1, 1,
-1.065804, 0.4478425, -0.8826644, 1, 0, 0, 1, 1,
-1.05634, 1.368076, -0.271081, 1, 0, 0, 1, 1,
-1.055225, 2.272276, -0.4936802, 1, 0, 0, 1, 1,
-1.053415, -2.335841, -2.928677, 1, 0, 0, 1, 1,
-1.052452, 0.2355951, -1.609828, 0, 0, 0, 1, 1,
-1.051268, -1.645313, -0.06233794, 0, 0, 0, 1, 1,
-1.049086, 1.508019, 0.6728984, 0, 0, 0, 1, 1,
-1.048703, -0.4181818, -0.4274664, 0, 0, 0, 1, 1,
-1.036561, -1.58243, -2.098564, 0, 0, 0, 1, 1,
-1.034837, -0.05209113, -1.996346, 0, 0, 0, 1, 1,
-1.031838, 0.3964073, -0.8858911, 0, 0, 0, 1, 1,
-1.02459, 1.200138, -0.6572477, 1, 1, 1, 1, 1,
-1.020915, -1.770332, -2.068639, 1, 1, 1, 1, 1,
-1.018245, -1.507245, -1.850675, 1, 1, 1, 1, 1,
-1.014926, 1.049962, 0.6540298, 1, 1, 1, 1, 1,
-1.013743, -0.7826553, -1.88349, 1, 1, 1, 1, 1,
-1.011302, -0.588101, -4.139421, 1, 1, 1, 1, 1,
-1.009898, 0.4858038, -1.413175, 1, 1, 1, 1, 1,
-1.008342, -0.5467334, -1.576346, 1, 1, 1, 1, 1,
-1.000102, 2.038462, 1.287515, 1, 1, 1, 1, 1,
-0.9960576, -0.6922124, -2.717912, 1, 1, 1, 1, 1,
-0.9956496, -0.9967994, -1.802051, 1, 1, 1, 1, 1,
-0.970912, 0.6208437, -0.4563372, 1, 1, 1, 1, 1,
-0.9626002, -1.16426, -3.216286, 1, 1, 1, 1, 1,
-0.9612222, -0.2430739, 0.1994912, 1, 1, 1, 1, 1,
-0.9508036, -0.4027421, -0.873045, 1, 1, 1, 1, 1,
-0.9461584, -0.4349854, -2.550524, 0, 0, 1, 1, 1,
-0.9437837, 0.4968641, -0.9545792, 1, 0, 0, 1, 1,
-0.9396278, 0.6480636, -1.474187, 1, 0, 0, 1, 1,
-0.9385601, 2.17789, -1.485438, 1, 0, 0, 1, 1,
-0.938224, -0.189723, -1.051932, 1, 0, 0, 1, 1,
-0.9339551, 0.9776129, -0.1954267, 1, 0, 0, 1, 1,
-0.9325897, 0.3444123, -0.6331377, 0, 0, 0, 1, 1,
-0.9291742, -0.4081796, -2.119628, 0, 0, 0, 1, 1,
-0.9237732, -0.9889157, -1.047402, 0, 0, 0, 1, 1,
-0.9157758, 0.6040772, -1.174406, 0, 0, 0, 1, 1,
-0.9100301, -0.9869874, -1.877587, 0, 0, 0, 1, 1,
-0.9087835, 0.4724166, -1.35992, 0, 0, 0, 1, 1,
-0.902409, 1.963925, 0.5080717, 0, 0, 0, 1, 1,
-0.8967078, -1.340522, -3.09504, 1, 1, 1, 1, 1,
-0.8885944, 1.326324, 0.05290231, 1, 1, 1, 1, 1,
-0.8821287, 0.6389641, -2.452282, 1, 1, 1, 1, 1,
-0.8747419, 1.083703, -1.248981, 1, 1, 1, 1, 1,
-0.8728039, -1.361073, -2.612983, 1, 1, 1, 1, 1,
-0.8692927, -0.8623656, -1.356351, 1, 1, 1, 1, 1,
-0.8636914, 0.557058, -1.742878, 1, 1, 1, 1, 1,
-0.8598804, 0.7010182, -3.421513, 1, 1, 1, 1, 1,
-0.8570061, -0.04104061, -1.627537, 1, 1, 1, 1, 1,
-0.8545095, -1.976585, -1.341907, 1, 1, 1, 1, 1,
-0.8498873, 1.249409, 0.3196187, 1, 1, 1, 1, 1,
-0.8495979, 0.7559021, -1.069668, 1, 1, 1, 1, 1,
-0.8461326, -0.09036376, -3.267644, 1, 1, 1, 1, 1,
-0.8432246, -1.893865, -3.885745, 1, 1, 1, 1, 1,
-0.8431189, 0.04706465, -1.09557, 1, 1, 1, 1, 1,
-0.838873, 0.8356866, 0.2455793, 0, 0, 1, 1, 1,
-0.8350772, 0.9292083, -0.5397516, 1, 0, 0, 1, 1,
-0.8346471, -0.4396221, -1.56397, 1, 0, 0, 1, 1,
-0.8343206, 1.290224, -2.318034, 1, 0, 0, 1, 1,
-0.8280909, 0.2529123, -1.346299, 1, 0, 0, 1, 1,
-0.8255534, -1.230324, -3.523882, 1, 0, 0, 1, 1,
-0.8179314, -0.5496383, -3.037781, 0, 0, 0, 1, 1,
-0.8161748, -0.1091048, 0.3302572, 0, 0, 0, 1, 1,
-0.8157094, 0.5370711, 0.4625489, 0, 0, 0, 1, 1,
-0.8151167, -0.8794972, -2.302911, 0, 0, 0, 1, 1,
-0.8126473, -0.1760734, -2.423403, 0, 0, 0, 1, 1,
-0.81224, 0.134879, -1.134841, 0, 0, 0, 1, 1,
-0.810629, -0.3190018, 0.6660247, 0, 0, 0, 1, 1,
-0.809694, 1.160322, -0.1607808, 1, 1, 1, 1, 1,
-0.8017991, -0.6509951, -1.32943, 1, 1, 1, 1, 1,
-0.795923, 0.7969192, -1.000805, 1, 1, 1, 1, 1,
-0.7945339, 1.682329, 1.145064, 1, 1, 1, 1, 1,
-0.7930967, -2.52891, -2.134085, 1, 1, 1, 1, 1,
-0.7895146, 0.810142, 0.1254863, 1, 1, 1, 1, 1,
-0.7872808, -0.4001118, -2.52113, 1, 1, 1, 1, 1,
-0.7871769, 1.642945, -0.5534252, 1, 1, 1, 1, 1,
-0.7860768, -0.2592845, -4.431094, 1, 1, 1, 1, 1,
-0.7842374, -0.7873575, -0.7034783, 1, 1, 1, 1, 1,
-0.7824992, -0.4204895, -1.898486, 1, 1, 1, 1, 1,
-0.7811664, -0.03320528, -1.312079, 1, 1, 1, 1, 1,
-0.779051, -1.625283, -2.214867, 1, 1, 1, 1, 1,
-0.7759885, 1.780312, 1.408162, 1, 1, 1, 1, 1,
-0.7690179, 0.8982482, 1.25619, 1, 1, 1, 1, 1,
-0.7689636, 0.1244002, -1.067295, 0, 0, 1, 1, 1,
-0.7664807, -2.23055, -5.072726, 1, 0, 0, 1, 1,
-0.7593431, 0.8936644, -0.7985368, 1, 0, 0, 1, 1,
-0.7529526, -0.1708983, -0.8347077, 1, 0, 0, 1, 1,
-0.7487585, 0.9842614, -0.8326723, 1, 0, 0, 1, 1,
-0.7419188, -1.385574, -1.60675, 1, 0, 0, 1, 1,
-0.7388724, 1.2356, -1.251396, 0, 0, 0, 1, 1,
-0.7360748, -1.084343, -2.363137, 0, 0, 0, 1, 1,
-0.7348238, 1.500622, -0.117241, 0, 0, 0, 1, 1,
-0.7297573, 0.1971724, -0.04404176, 0, 0, 0, 1, 1,
-0.7242744, 0.3696217, -0.2690739, 0, 0, 0, 1, 1,
-0.7229781, 1.940723, 0.30957, 0, 0, 0, 1, 1,
-0.7213029, -1.49875, -1.224328, 0, 0, 0, 1, 1,
-0.7174805, 0.8847753, 0.2877169, 1, 1, 1, 1, 1,
-0.7170119, -0.8839522, -2.328793, 1, 1, 1, 1, 1,
-0.7162839, -0.3391109, -3.323513, 1, 1, 1, 1, 1,
-0.7114538, 0.1218835, -0.4979935, 1, 1, 1, 1, 1,
-0.7067072, -0.262535, -1.164672, 1, 1, 1, 1, 1,
-0.7055365, -0.5141767, -2.608926, 1, 1, 1, 1, 1,
-0.7043605, 1.142126, -1.702416, 1, 1, 1, 1, 1,
-0.7029085, -1.061671, -2.386472, 1, 1, 1, 1, 1,
-0.7009836, 0.03046958, -2.165731, 1, 1, 1, 1, 1,
-0.6986982, -0.8293247, -1.531188, 1, 1, 1, 1, 1,
-0.6970037, 0.1747426, -2.232216, 1, 1, 1, 1, 1,
-0.6938599, 0.8767804, 0.7878096, 1, 1, 1, 1, 1,
-0.6926535, -0.4585546, -1.36342, 1, 1, 1, 1, 1,
-0.6922216, -0.7982761, -1.947308, 1, 1, 1, 1, 1,
-0.6906412, 0.398325, -0.7802108, 1, 1, 1, 1, 1,
-0.6886888, -0.8525877, -2.645966, 0, 0, 1, 1, 1,
-0.6863734, -0.1203999, -0.9774595, 1, 0, 0, 1, 1,
-0.6798979, 0.706091, 0.2709801, 1, 0, 0, 1, 1,
-0.6787415, 2.066598, -2.937871, 1, 0, 0, 1, 1,
-0.6784511, -0.5519469, -4.206206, 1, 0, 0, 1, 1,
-0.6768764, 0.7485092, -1.199516, 1, 0, 0, 1, 1,
-0.6709237, -0.5273126, -0.8424127, 0, 0, 0, 1, 1,
-0.6708117, -1.609632, -2.197691, 0, 0, 0, 1, 1,
-0.666554, 0.8644615, -0.02269274, 0, 0, 0, 1, 1,
-0.6660606, 0.8298645, -1.813108, 0, 0, 0, 1, 1,
-0.6587145, -0.92965, -0.6628344, 0, 0, 0, 1, 1,
-0.6575136, 1.92065, 0.6463832, 0, 0, 0, 1, 1,
-0.6537479, 0.4265904, -2.749898, 0, 0, 0, 1, 1,
-0.6521115, -0.2855644, -1.589947, 1, 1, 1, 1, 1,
-0.6431285, 0.5170408, -0.5668829, 1, 1, 1, 1, 1,
-0.6396378, 0.2026866, -0.9323698, 1, 1, 1, 1, 1,
-0.6396185, -0.6994996, -2.226505, 1, 1, 1, 1, 1,
-0.6345583, -0.4774759, -2.03072, 1, 1, 1, 1, 1,
-0.6294393, 1.568593, 0.4775923, 1, 1, 1, 1, 1,
-0.6249909, 0.9517922, -1.66952, 1, 1, 1, 1, 1,
-0.6249273, -0.4552202, -3.299217, 1, 1, 1, 1, 1,
-0.6218225, 0.321261, -1.303359, 1, 1, 1, 1, 1,
-0.6105704, -0.3970745, -1.576137, 1, 1, 1, 1, 1,
-0.602049, -1.173296, -2.679035, 1, 1, 1, 1, 1,
-0.5990996, 0.8810061, -1.776513, 1, 1, 1, 1, 1,
-0.5970061, 0.1358971, -1.697976, 1, 1, 1, 1, 1,
-0.5909066, -0.6436447, -1.797952, 1, 1, 1, 1, 1,
-0.5884994, 1.507312, -1.355765, 1, 1, 1, 1, 1,
-0.5814747, -0.4630357, -2.33204, 0, 0, 1, 1, 1,
-0.5763444, 0.9329026, -0.6022625, 1, 0, 0, 1, 1,
-0.5737606, -2.117082, -4.491197, 1, 0, 0, 1, 1,
-0.5698115, 0.08518455, 0.460256, 1, 0, 0, 1, 1,
-0.5674794, -0.03058076, -1.544721, 1, 0, 0, 1, 1,
-0.5623072, 0.415548, -2.058687, 1, 0, 0, 1, 1,
-0.5607914, -0.2488225, -2.468717, 0, 0, 0, 1, 1,
-0.5592718, -0.1046019, -1.010667, 0, 0, 0, 1, 1,
-0.5548387, 1.065916, -1.734288, 0, 0, 0, 1, 1,
-0.5420386, -0.4578181, -3.403184, 0, 0, 0, 1, 1,
-0.5409248, -0.01483017, -1.920086, 0, 0, 0, 1, 1,
-0.5314338, -1.069869, -2.75154, 0, 0, 0, 1, 1,
-0.5269914, -1.896719, -2.498702, 0, 0, 0, 1, 1,
-0.5246376, 1.348342, -1.180941, 1, 1, 1, 1, 1,
-0.5217096, 0.9855332, 0.5355378, 1, 1, 1, 1, 1,
-0.5171486, 1.102333, 0.2464829, 1, 1, 1, 1, 1,
-0.5163026, -1.495923, -4.653101, 1, 1, 1, 1, 1,
-0.5148377, -0.3150728, -0.6939092, 1, 1, 1, 1, 1,
-0.5136154, -0.3977567, -0.8139554, 1, 1, 1, 1, 1,
-0.5128038, -0.2873469, -3.478848, 1, 1, 1, 1, 1,
-0.5034629, -2.132233, -3.571074, 1, 1, 1, 1, 1,
-0.4946871, 1.438097, 0.8280486, 1, 1, 1, 1, 1,
-0.4911627, -0.8065338, -0.9366573, 1, 1, 1, 1, 1,
-0.4869854, 0.222205, 0.7755781, 1, 1, 1, 1, 1,
-0.4863916, -0.7275017, -4.522763, 1, 1, 1, 1, 1,
-0.4851156, -1.526048, -1.944848, 1, 1, 1, 1, 1,
-0.4803661, 1.389126, -1.14406, 1, 1, 1, 1, 1,
-0.4799672, -1.279301, -2.688948, 1, 1, 1, 1, 1,
-0.476965, 0.3875987, -0.9061614, 0, 0, 1, 1, 1,
-0.4759209, -0.9305118, -1.592737, 1, 0, 0, 1, 1,
-0.4733873, 0.952086, -1.778147, 1, 0, 0, 1, 1,
-0.4710947, -1.653801, -3.392427, 1, 0, 0, 1, 1,
-0.4696976, -0.06618436, -0.3869876, 1, 0, 0, 1, 1,
-0.4636779, -0.4512782, -3.417621, 1, 0, 0, 1, 1,
-0.4603675, 0.0251644, -1.671384, 0, 0, 0, 1, 1,
-0.4587593, 0.1113332, -2.093246, 0, 0, 0, 1, 1,
-0.4578218, -2.265567, -1.755361, 0, 0, 0, 1, 1,
-0.4504794, -0.01600977, -1.639098, 0, 0, 0, 1, 1,
-0.4501256, -0.693011, -2.488408, 0, 0, 0, 1, 1,
-0.4484782, 0.6214705, -1.195669, 0, 0, 0, 1, 1,
-0.445031, -0.4192344, -1.466282, 0, 0, 0, 1, 1,
-0.4371033, -1.254336, -3.655734, 1, 1, 1, 1, 1,
-0.4364096, -0.4007129, -2.175726, 1, 1, 1, 1, 1,
-0.4360241, -0.2032865, -1.2573, 1, 1, 1, 1, 1,
-0.4287174, 1.334258, 0.1763442, 1, 1, 1, 1, 1,
-0.4285313, -0.6267999, -2.594171, 1, 1, 1, 1, 1,
-0.4273183, -0.8094649, -2.410569, 1, 1, 1, 1, 1,
-0.4257029, -0.01396868, -0.8194852, 1, 1, 1, 1, 1,
-0.4246253, 1.701387, -0.5069959, 1, 1, 1, 1, 1,
-0.4184503, 0.4822232, -0.9882313, 1, 1, 1, 1, 1,
-0.4135324, 0.4813167, -1.011296, 1, 1, 1, 1, 1,
-0.4122456, -0.412659, -2.011723, 1, 1, 1, 1, 1,
-0.4099875, 1.385933, 0.1081718, 1, 1, 1, 1, 1,
-0.4083883, 1.183268, -0.575336, 1, 1, 1, 1, 1,
-0.4018536, -0.03735989, -2.115146, 1, 1, 1, 1, 1,
-0.4008678, -0.5156566, -1.324308, 1, 1, 1, 1, 1,
-0.3988351, -1.349831, -4.565459, 0, 0, 1, 1, 1,
-0.3921369, 0.03678613, -0.5913157, 1, 0, 0, 1, 1,
-0.3917716, -1.264418, -3.95988, 1, 0, 0, 1, 1,
-0.3895752, 0.9431599, -2.210724, 1, 0, 0, 1, 1,
-0.3889934, -0.9683009, -3.907807, 1, 0, 0, 1, 1,
-0.3875003, 1.900879, -0.933831, 1, 0, 0, 1, 1,
-0.3871699, -0.320845, -1.546822, 0, 0, 0, 1, 1,
-0.3852854, -0.659972, -4.100931, 0, 0, 0, 1, 1,
-0.3722652, 1.244185, -0.4181443, 0, 0, 0, 1, 1,
-0.3703905, 0.5500849, -0.6247066, 0, 0, 0, 1, 1,
-0.3643928, 0.7425624, -1.443635, 0, 0, 0, 1, 1,
-0.358208, -0.8357345, -4.256611, 0, 0, 0, 1, 1,
-0.356277, 0.5537091, 0.1938391, 0, 0, 0, 1, 1,
-0.3561316, 0.7611154, -0.3118145, 1, 1, 1, 1, 1,
-0.3428487, -1.914892, -2.107509, 1, 1, 1, 1, 1,
-0.3409531, -0.08491715, -2.308605, 1, 1, 1, 1, 1,
-0.3370524, -0.3616238, -3.315648, 1, 1, 1, 1, 1,
-0.3352829, -1.889549, -3.273936, 1, 1, 1, 1, 1,
-0.3282648, 0.7842586, -0.09872253, 1, 1, 1, 1, 1,
-0.3212461, -0.7263553, -2.091852, 1, 1, 1, 1, 1,
-0.3151962, 0.2762001, -0.1819832, 1, 1, 1, 1, 1,
-0.3141389, 0.4658519, 0.6777672, 1, 1, 1, 1, 1,
-0.3112716, -0.3241813, -2.535685, 1, 1, 1, 1, 1,
-0.3066189, -1.071029, -4.909826, 1, 1, 1, 1, 1,
-0.3014878, 0.623307, -1.192834, 1, 1, 1, 1, 1,
-0.3003338, 0.1242807, -1.783618, 1, 1, 1, 1, 1,
-0.2994776, 0.02751883, -0.9006624, 1, 1, 1, 1, 1,
-0.2965536, -1.000492, -3.209706, 1, 1, 1, 1, 1,
-0.296377, -0.2318616, -2.179332, 0, 0, 1, 1, 1,
-0.2934582, -1.942397, -3.655273, 1, 0, 0, 1, 1,
-0.2924183, -0.3533128, -2.512741, 1, 0, 0, 1, 1,
-0.2921484, -0.9844896, -3.437228, 1, 0, 0, 1, 1,
-0.291427, -0.6044999, -2.394163, 1, 0, 0, 1, 1,
-0.2889183, -0.4438246, -2.940797, 1, 0, 0, 1, 1,
-0.2863374, -0.408507, -2.674608, 0, 0, 0, 1, 1,
-0.2819405, -0.1580901, -0.3610944, 0, 0, 0, 1, 1,
-0.280705, -1.835872, -4.251881, 0, 0, 0, 1, 1,
-0.2780246, -0.9651263, -3.75867, 0, 0, 0, 1, 1,
-0.2776741, -0.227098, -2.872179, 0, 0, 0, 1, 1,
-0.2769014, 0.4875105, -0.04416662, 0, 0, 0, 1, 1,
-0.2738733, 0.08324323, -3.086861, 0, 0, 0, 1, 1,
-0.2697638, 1.208967, 0.2045573, 1, 1, 1, 1, 1,
-0.2674359, 0.2803305, -0.04693482, 1, 1, 1, 1, 1,
-0.2650869, -0.6328439, -3.193621, 1, 1, 1, 1, 1,
-0.262155, -1.175468, -3.405059, 1, 1, 1, 1, 1,
-0.2584943, -0.991312, -3.066966, 1, 1, 1, 1, 1,
-0.2583933, -0.4222925, -1.345064, 1, 1, 1, 1, 1,
-0.257563, -0.1209086, -2.807633, 1, 1, 1, 1, 1,
-0.2568755, -0.2172078, -3.604378, 1, 1, 1, 1, 1,
-0.2566756, 0.2620529, -0.05282579, 1, 1, 1, 1, 1,
-0.256481, 0.4615184, -1.636194, 1, 1, 1, 1, 1,
-0.2493567, 0.4968054, -0.70535, 1, 1, 1, 1, 1,
-0.2449904, 0.3896421, -0.4086321, 1, 1, 1, 1, 1,
-0.2397491, -0.2529566, -3.430206, 1, 1, 1, 1, 1,
-0.2384051, -0.5085379, -4.14829, 1, 1, 1, 1, 1,
-0.2304766, 0.09704933, -1.640102, 1, 1, 1, 1, 1,
-0.2294367, -0.05711259, -2.80926, 0, 0, 1, 1, 1,
-0.2293453, 0.8135868, -0.4406674, 1, 0, 0, 1, 1,
-0.2293107, -2.409807, -3.619798, 1, 0, 0, 1, 1,
-0.2287978, -0.06644711, -1.664441, 1, 0, 0, 1, 1,
-0.2221694, 0.5076152, -0.747055, 1, 0, 0, 1, 1,
-0.2219248, -1.299721, -2.755798, 1, 0, 0, 1, 1,
-0.2137144, -0.3813877, -2.089844, 0, 0, 0, 1, 1,
-0.2123705, 0.7999847, -0.1375069, 0, 0, 0, 1, 1,
-0.2122706, -0.5492142, -2.424695, 0, 0, 0, 1, 1,
-0.2087897, -0.8827616, -3.606779, 0, 0, 0, 1, 1,
-0.2048474, 1.046429, -0.06870962, 0, 0, 0, 1, 1,
-0.2048115, -1.132846, -3.030298, 0, 0, 0, 1, 1,
-0.2025439, 0.474508, 0.3876118, 0, 0, 0, 1, 1,
-0.2021147, 0.0247072, 0.3329044, 1, 1, 1, 1, 1,
-0.1990854, -0.8919613, -2.972317, 1, 1, 1, 1, 1,
-0.1971435, -1.099082, -4.076151, 1, 1, 1, 1, 1,
-0.197109, -0.373323, -4.120454, 1, 1, 1, 1, 1,
-0.1969707, 1.239753, 0.04069291, 1, 1, 1, 1, 1,
-0.1940618, 0.7374368, -1.260138, 1, 1, 1, 1, 1,
-0.1906764, -0.8965166, -1.482499, 1, 1, 1, 1, 1,
-0.188227, 0.005042273, -2.668065, 1, 1, 1, 1, 1,
-0.1877219, -0.2158437, -2.234684, 1, 1, 1, 1, 1,
-0.1870384, -1.09406, -2.052914, 1, 1, 1, 1, 1,
-0.1744791, 0.07719792, 1.217592, 1, 1, 1, 1, 1,
-0.1703193, 1.811033, 0.1482978, 1, 1, 1, 1, 1,
-0.1673115, 0.6901029, -0.2606702, 1, 1, 1, 1, 1,
-0.1632766, 1.346304, -0.5193752, 1, 1, 1, 1, 1,
-0.1615734, -1.381541, -2.240545, 1, 1, 1, 1, 1,
-0.1589373, -0.5010002, -2.637722, 0, 0, 1, 1, 1,
-0.1502588, 2.165532, -0.1092151, 1, 0, 0, 1, 1,
-0.1464994, 1.118777, 0.3258288, 1, 0, 0, 1, 1,
-0.1408074, -1.177392, -3.320822, 1, 0, 0, 1, 1,
-0.135922, -0.2939672, -1.684742, 1, 0, 0, 1, 1,
-0.1350507, 1.319303, -0.39279, 1, 0, 0, 1, 1,
-0.134048, -1.120216, -1.985007, 0, 0, 0, 1, 1,
-0.1336712, -0.6515739, -1.57592, 0, 0, 0, 1, 1,
-0.1326492, -0.8034338, -2.72286, 0, 0, 0, 1, 1,
-0.1307472, 0.3984148, 0.005690071, 0, 0, 0, 1, 1,
-0.1269348, 2.995633, -0.6482152, 0, 0, 0, 1, 1,
-0.125665, -0.3071395, -2.341815, 0, 0, 0, 1, 1,
-0.1236012, 0.1504097, -1.420856, 0, 0, 0, 1, 1,
-0.1212364, -0.1423697, -1.465464, 1, 1, 1, 1, 1,
-0.1152684, 0.4968012, -0.8230097, 1, 1, 1, 1, 1,
-0.1140831, 0.2537249, -1.148988, 1, 1, 1, 1, 1,
-0.1094138, -0.6328475, -5.36065, 1, 1, 1, 1, 1,
-0.1076539, 0.9462293, 0.03785604, 1, 1, 1, 1, 1,
-0.10765, 0.3998657, 0.1976762, 1, 1, 1, 1, 1,
-0.1000839, -0.5183712, -2.966499, 1, 1, 1, 1, 1,
-0.08924915, -0.4709882, -3.436377, 1, 1, 1, 1, 1,
-0.08801518, -0.9965377, -0.492322, 1, 1, 1, 1, 1,
-0.08781032, -1.740502, -3.920244, 1, 1, 1, 1, 1,
-0.08725987, 0.2449601, 0.9735759, 1, 1, 1, 1, 1,
-0.08600215, 0.06972875, -1.355149, 1, 1, 1, 1, 1,
-0.08422425, -0.1347412, -2.013529, 1, 1, 1, 1, 1,
-0.08193088, 1.330513, -1.7431, 1, 1, 1, 1, 1,
-0.08188011, -0.4013311, -2.634407, 1, 1, 1, 1, 1,
-0.07982347, 0.7402502, 0.3174235, 0, 0, 1, 1, 1,
-0.07656078, 1.174704, -0.5461994, 1, 0, 0, 1, 1,
-0.07521892, 2.799826, -0.2271944, 1, 0, 0, 1, 1,
-0.07305442, -0.4384505, -3.780297, 1, 0, 0, 1, 1,
-0.0682744, -0.5353296, -3.145565, 1, 0, 0, 1, 1,
-0.06821768, -1.697977, -3.236951, 1, 0, 0, 1, 1,
-0.06629669, -0.5998724, -3.521225, 0, 0, 0, 1, 1,
-0.06517459, -0.6580356, -3.525983, 0, 0, 0, 1, 1,
-0.06414419, -0.6412387, -2.692743, 0, 0, 0, 1, 1,
-0.06411855, 0.4596718, -1.228217, 0, 0, 0, 1, 1,
-0.05792929, -0.7244676, -4.103089, 0, 0, 0, 1, 1,
-0.05640215, 1.015832, -0.8755858, 0, 0, 0, 1, 1,
-0.05566882, -1.94313, -2.225484, 0, 0, 0, 1, 1,
-0.05476212, -0.4160804, -1.790601, 1, 1, 1, 1, 1,
-0.05426443, -0.4051538, -2.75865, 1, 1, 1, 1, 1,
-0.05279016, 0.6381994, -0.2427548, 1, 1, 1, 1, 1,
-0.0514327, -0.3052818, -2.983761, 1, 1, 1, 1, 1,
-0.05039148, -0.5695277, -3.060323, 1, 1, 1, 1, 1,
-0.04828483, -1.125358, 0.05071853, 1, 1, 1, 1, 1,
-0.04640318, 0.7170934, -1.354319, 1, 1, 1, 1, 1,
-0.04535684, -0.2976067, -4.106729, 1, 1, 1, 1, 1,
-0.04087459, 0.8153584, -1.301091, 1, 1, 1, 1, 1,
-0.03683787, -0.3224791, -3.924063, 1, 1, 1, 1, 1,
-0.02998555, 0.2200838, -1.756603, 1, 1, 1, 1, 1,
-0.02972599, -0.8326276, -3.629383, 1, 1, 1, 1, 1,
-0.02790357, -1.199085, -2.377704, 1, 1, 1, 1, 1,
-0.02329551, -1.414322, -3.114778, 1, 1, 1, 1, 1,
-0.02159012, -0.87897, -2.021234, 1, 1, 1, 1, 1,
-0.02099071, 1.187526, 0.6537763, 0, 0, 1, 1, 1,
-0.02095821, 0.02904865, 0.03600781, 1, 0, 0, 1, 1,
-0.01733375, 0.1749641, 0.1014283, 1, 0, 0, 1, 1,
-0.01531721, -0.9570644, -1.740998, 1, 0, 0, 1, 1,
-0.01409354, -0.4582498, -4.430922, 1, 0, 0, 1, 1,
-0.01240888, 0.467236, 0.1078328, 1, 0, 0, 1, 1,
-0.01162266, 2.040512, -0.5994855, 0, 0, 0, 1, 1,
-0.00944116, -1.045452, -3.399575, 0, 0, 0, 1, 1,
-0.008211656, 0.6939986, -0.4052709, 0, 0, 0, 1, 1,
-0.005437402, -0.4320918, -3.176668, 0, 0, 0, 1, 1,
0.0004308948, 1.816789, 2.023082, 0, 0, 0, 1, 1,
0.00387663, -0.761117, 1.464851, 0, 0, 0, 1, 1,
0.006807018, 1.643625, -0.6664572, 0, 0, 0, 1, 1,
0.007375454, -1.084373, 3.71738, 1, 1, 1, 1, 1,
0.01059987, -0.8691501, 3.880219, 1, 1, 1, 1, 1,
0.01060694, -0.08334034, 1.944933, 1, 1, 1, 1, 1,
0.01185352, 1.305205, 0.09511583, 1, 1, 1, 1, 1,
0.01662305, -1.174133, 4.81712, 1, 1, 1, 1, 1,
0.01682459, -0.9139597, 3.849867, 1, 1, 1, 1, 1,
0.01805664, 1.546388, -1.094168, 1, 1, 1, 1, 1,
0.02249976, 0.9290038, 0.4695788, 1, 1, 1, 1, 1,
0.02278412, -0.98585, 3.924312, 1, 1, 1, 1, 1,
0.02498579, -0.9722686, 3.829404, 1, 1, 1, 1, 1,
0.02710082, -0.8297699, 2.346803, 1, 1, 1, 1, 1,
0.03048814, 3.070049, -0.4630541, 1, 1, 1, 1, 1,
0.0321569, 0.4222416, -0.4925834, 1, 1, 1, 1, 1,
0.04265458, 0.2315843, 0.05477364, 1, 1, 1, 1, 1,
0.04636282, 0.06044918, 1.508557, 1, 1, 1, 1, 1,
0.05199904, 0.3715987, -0.6913691, 0, 0, 1, 1, 1,
0.05364546, -2.259595, 3.383706, 1, 0, 0, 1, 1,
0.05829646, 0.6333093, 0.04112739, 1, 0, 0, 1, 1,
0.06165522, -0.5233672, 2.446683, 1, 0, 0, 1, 1,
0.0620426, -0.9481201, 3.906031, 1, 0, 0, 1, 1,
0.06240826, -0.603539, 2.209708, 1, 0, 0, 1, 1,
0.06391207, 1.74598, 2.290624, 0, 0, 0, 1, 1,
0.06461355, -1.779441, 2.37214, 0, 0, 0, 1, 1,
0.06654789, 0.3815821, 0.8051721, 0, 0, 0, 1, 1,
0.07114109, 0.849459, 0.5180194, 0, 0, 0, 1, 1,
0.07636377, 2.729048, 0.9393997, 0, 0, 0, 1, 1,
0.07689256, -0.04702165, 1.087125, 0, 0, 0, 1, 1,
0.08332183, 1.541736, 1.277866, 0, 0, 0, 1, 1,
0.08471581, -1.053384, 3.904461, 1, 1, 1, 1, 1,
0.08630944, -0.05589967, 3.26683, 1, 1, 1, 1, 1,
0.08788777, 0.111549, 1.148687, 1, 1, 1, 1, 1,
0.09018121, 0.9010029, 0.1605336, 1, 1, 1, 1, 1,
0.09420595, -0.9130571, 3.345608, 1, 1, 1, 1, 1,
0.09654551, -0.08980906, 3.079487, 1, 1, 1, 1, 1,
0.09677527, -1.189206, 1.430452, 1, 1, 1, 1, 1,
0.09719504, -0.4703346, 2.784431, 1, 1, 1, 1, 1,
0.09981657, -0.3205239, 3.754369, 1, 1, 1, 1, 1,
0.1004925, 0.9881002, 0.5263028, 1, 1, 1, 1, 1,
0.1049756, 1.351112, 0.7146058, 1, 1, 1, 1, 1,
0.1066276, -0.8781819, 5.237674, 1, 1, 1, 1, 1,
0.1067911, -0.4368033, 3.928847, 1, 1, 1, 1, 1,
0.1145049, 1.110959, 0.2159674, 1, 1, 1, 1, 1,
0.1159483, 0.2650712, 0.0944595, 1, 1, 1, 1, 1,
0.1219382, -0.1134548, 3.359043, 0, 0, 1, 1, 1,
0.1254391, 0.705631, 2.129873, 1, 0, 0, 1, 1,
0.1297218, 0.3586634, -0.6427367, 1, 0, 0, 1, 1,
0.1308652, -0.5406237, 2.045741, 1, 0, 0, 1, 1,
0.1309711, 1.877976, 0.7714509, 1, 0, 0, 1, 1,
0.1311215, 1.135298, -0.4854536, 1, 0, 0, 1, 1,
0.1346062, -0.6890994, 2.977902, 0, 0, 0, 1, 1,
0.1402301, 0.8475217, -1.181562, 0, 0, 0, 1, 1,
0.1414754, 0.6334879, -0.5072106, 0, 0, 0, 1, 1,
0.1439879, 0.4909829, 1.060385, 0, 0, 0, 1, 1,
0.149965, -0.2910154, 2.78323, 0, 0, 0, 1, 1,
0.1516897, -1.171901, 3.203427, 0, 0, 0, 1, 1,
0.1532045, -1.593095, 4.974036, 0, 0, 0, 1, 1,
0.156227, 1.498074, 1.219711, 1, 1, 1, 1, 1,
0.1603778, -0.6675305, 1.010177, 1, 1, 1, 1, 1,
0.1606136, 0.747467, 0.4120407, 1, 1, 1, 1, 1,
0.1607938, -0.6348186, 1.856101, 1, 1, 1, 1, 1,
0.16399, -0.4843121, 1.321414, 1, 1, 1, 1, 1,
0.1665288, 0.3249545, -0.5930806, 1, 1, 1, 1, 1,
0.1689297, -0.8310252, 4.311222, 1, 1, 1, 1, 1,
0.1748722, 0.2974302, -0.04783774, 1, 1, 1, 1, 1,
0.1759045, -1.261797, 2.324697, 1, 1, 1, 1, 1,
0.1763898, -0.3672794, 1.819404, 1, 1, 1, 1, 1,
0.1803123, 0.5861608, -0.8766178, 1, 1, 1, 1, 1,
0.1830128, 0.482274, 0.1984043, 1, 1, 1, 1, 1,
0.1837601, 0.2901679, 0.9751887, 1, 1, 1, 1, 1,
0.186857, 1.753093, -0.01222113, 1, 1, 1, 1, 1,
0.1881829, -2.449078, 4.379409, 1, 1, 1, 1, 1,
0.1928351, -0.7357265, 2.470314, 0, 0, 1, 1, 1,
0.1984467, 1.16086, -1.044561, 1, 0, 0, 1, 1,
0.2014271, -1.612604, 5.653339, 1, 0, 0, 1, 1,
0.2016813, 0.6499345, 1.409168, 1, 0, 0, 1, 1,
0.2029113, -0.04570006, 3.498042, 1, 0, 0, 1, 1,
0.2033378, 0.4314801, 0.2543488, 1, 0, 0, 1, 1,
0.2112943, -1.279441, 1.514224, 0, 0, 0, 1, 1,
0.2147399, -1.148524, 2.80416, 0, 0, 0, 1, 1,
0.2158461, -1.472878, 1.474176, 0, 0, 0, 1, 1,
0.2177163, 0.579667, 0.3797049, 0, 0, 0, 1, 1,
0.2181537, -0.6939059, 2.640192, 0, 0, 0, 1, 1,
0.2188798, -0.6051409, 4.175653, 0, 0, 0, 1, 1,
0.2198451, -0.5045394, 2.273414, 0, 0, 0, 1, 1,
0.2201182, -0.9912077, 2.711004, 1, 1, 1, 1, 1,
0.2229441, -2.159033, 3.019947, 1, 1, 1, 1, 1,
0.2261679, -0.6701902, 2.32458, 1, 1, 1, 1, 1,
0.2279214, 1.631407, 0.756888, 1, 1, 1, 1, 1,
0.2294843, 1.353152, 0.9874414, 1, 1, 1, 1, 1,
0.2298052, 0.6493129, 0.06178402, 1, 1, 1, 1, 1,
0.2298694, 0.5402358, 1.201038, 1, 1, 1, 1, 1,
0.2329862, 0.9089676, 0.9505282, 1, 1, 1, 1, 1,
0.2386637, -0.5570185, 2.58334, 1, 1, 1, 1, 1,
0.2387121, -0.4526832, 2.741696, 1, 1, 1, 1, 1,
0.239286, 1.396213, 1.131396, 1, 1, 1, 1, 1,
0.2415419, 0.5904063, -0.292975, 1, 1, 1, 1, 1,
0.2477738, -0.7458523, 3.167979, 1, 1, 1, 1, 1,
0.249692, -0.4844913, 2.549838, 1, 1, 1, 1, 1,
0.252749, 0.1281149, 0.9338703, 1, 1, 1, 1, 1,
0.2530166, 1.016562, -0.7126451, 0, 0, 1, 1, 1,
0.2539031, -0.6179812, 2.155849, 1, 0, 0, 1, 1,
0.2572625, -0.2460407, 1.040211, 1, 0, 0, 1, 1,
0.2651795, -0.4070212, 2.619929, 1, 0, 0, 1, 1,
0.2660839, 0.2323152, 0.8555678, 1, 0, 0, 1, 1,
0.2682566, -0.1910905, 3.673918, 1, 0, 0, 1, 1,
0.2698218, -1.065372, 1.580501, 0, 0, 0, 1, 1,
0.2717171, -0.5803095, 2.485774, 0, 0, 0, 1, 1,
0.2740137, 1.138923, 0.06341396, 0, 0, 0, 1, 1,
0.2762897, -2.52824, 3.046677, 0, 0, 0, 1, 1,
0.2770295, 0.5585077, 2.28879, 0, 0, 0, 1, 1,
0.2799492, -1.109015, 3.836542, 0, 0, 0, 1, 1,
0.2803662, -0.9813145, 2.313198, 0, 0, 0, 1, 1,
0.2806139, 1.517947, 0.3642548, 1, 1, 1, 1, 1,
0.2832709, 1.034562, -0.3388, 1, 1, 1, 1, 1,
0.2839006, 1.051529, 1.394383, 1, 1, 1, 1, 1,
0.2914879, 0.2006444, -0.3087993, 1, 1, 1, 1, 1,
0.2918057, -0.1512877, 3.120392, 1, 1, 1, 1, 1,
0.2935555, 0.6996275, -0.5898217, 1, 1, 1, 1, 1,
0.2941775, -0.8943051, 5.590642, 1, 1, 1, 1, 1,
0.2962952, -1.042261, 1.640299, 1, 1, 1, 1, 1,
0.3021823, 1.439125, -0.3492599, 1, 1, 1, 1, 1,
0.3056799, -0.4738238, 2.277489, 1, 1, 1, 1, 1,
0.3066351, -2.349596, 4.607772, 1, 1, 1, 1, 1,
0.3098948, -0.361423, 1.258782, 1, 1, 1, 1, 1,
0.3134246, -0.3905526, 2.298463, 1, 1, 1, 1, 1,
0.314136, -0.01930496, 1.687766, 1, 1, 1, 1, 1,
0.3142438, 1.108183, -0.3896088, 1, 1, 1, 1, 1,
0.3191795, 1.191474, 1.923637, 0, 0, 1, 1, 1,
0.3199248, 0.5988523, 1.432865, 1, 0, 0, 1, 1,
0.3207157, 0.6601619, 2.33404, 1, 0, 0, 1, 1,
0.3232706, 0.360338, 1.542276, 1, 0, 0, 1, 1,
0.3239253, 0.7682048, -0.428822, 1, 0, 0, 1, 1,
0.3263167, 0.2624125, 1.400782, 1, 0, 0, 1, 1,
0.3263193, 0.01569351, 2.452201, 0, 0, 0, 1, 1,
0.3347228, 2.188513, 0.4949272, 0, 0, 0, 1, 1,
0.3376642, -0.6160614, 4.238709, 0, 0, 0, 1, 1,
0.3395592, 0.4534578, -0.1243408, 0, 0, 0, 1, 1,
0.3434912, 0.9861133, 0.6174995, 0, 0, 0, 1, 1,
0.3463278, -1.065887, 2.588207, 0, 0, 0, 1, 1,
0.348695, -0.281928, 2.823677, 0, 0, 0, 1, 1,
0.3503476, 0.2997083, 0.3557732, 1, 1, 1, 1, 1,
0.3508584, -0.6490223, 2.509861, 1, 1, 1, 1, 1,
0.3524978, -1.797678, 2.13305, 1, 1, 1, 1, 1,
0.352722, -0.8329805, 3.586553, 1, 1, 1, 1, 1,
0.3536465, 1.828803, -0.701901, 1, 1, 1, 1, 1,
0.3595761, 0.2264511, -1.310401, 1, 1, 1, 1, 1,
0.3603044, -1.724994, 2.289142, 1, 1, 1, 1, 1,
0.3676195, 1.223915, -0.5348157, 1, 1, 1, 1, 1,
0.3686159, 0.6539015, 1.306373, 1, 1, 1, 1, 1,
0.3716002, 1.892486, -0.3802179, 1, 1, 1, 1, 1,
0.3725523, 0.001592172, 1.135744, 1, 1, 1, 1, 1,
0.3836258, 0.1512055, 0.8487939, 1, 1, 1, 1, 1,
0.3837554, 1.569712, -0.8831926, 1, 1, 1, 1, 1,
0.3864567, -0.5957322, 3.034736, 1, 1, 1, 1, 1,
0.3883409, 0.008360887, 0.9759542, 1, 1, 1, 1, 1,
0.3981151, 0.9226781, -0.5481642, 0, 0, 1, 1, 1,
0.3997319, -2.005041, 1.794389, 1, 0, 0, 1, 1,
0.4023642, 1.35308, -0.01102803, 1, 0, 0, 1, 1,
0.406802, 0.7587195, 0.7684131, 1, 0, 0, 1, 1,
0.4089172, -0.6469505, 3.495323, 1, 0, 0, 1, 1,
0.409804, -0.6389332, 4.796004, 1, 0, 0, 1, 1,
0.4105469, -1.139791, 1.426738, 0, 0, 0, 1, 1,
0.4177843, -0.4417933, 1.25711, 0, 0, 0, 1, 1,
0.4218778, -2.101926, 3.723815, 0, 0, 0, 1, 1,
0.4241483, 1.088028, 0.6076655, 0, 0, 0, 1, 1,
0.4263478, 0.8559566, 1.644986, 0, 0, 0, 1, 1,
0.4293771, 0.01873573, 2.345019, 0, 0, 0, 1, 1,
0.429648, 0.4289452, 0.743745, 0, 0, 0, 1, 1,
0.433538, -1.738906, 2.132639, 1, 1, 1, 1, 1,
0.4361545, 0.7431945, -1.740975, 1, 1, 1, 1, 1,
0.4374647, 0.9498535, 1.755823, 1, 1, 1, 1, 1,
0.4383211, 0.8968959, 0.8129231, 1, 1, 1, 1, 1,
0.438507, 0.01831597, 1.544204, 1, 1, 1, 1, 1,
0.4400756, -0.9308322, -0.7960064, 1, 1, 1, 1, 1,
0.447345, 0.2809009, 0.6775127, 1, 1, 1, 1, 1,
0.4492317, -0.1357597, 1.614787, 1, 1, 1, 1, 1,
0.449731, -3.145052, 2.674299, 1, 1, 1, 1, 1,
0.4502247, 0.630383, 0.5600232, 1, 1, 1, 1, 1,
0.450649, -1.323194, 2.887838, 1, 1, 1, 1, 1,
0.4563766, -0.06988326, 4.778542, 1, 1, 1, 1, 1,
0.4587379, -0.98802, 2.063336, 1, 1, 1, 1, 1,
0.4593494, -0.481186, 1.670651, 1, 1, 1, 1, 1,
0.4596342, 0.7528085, 1.105018, 1, 1, 1, 1, 1,
0.460777, 0.794988, -0.3661682, 0, 0, 1, 1, 1,
0.4607884, -0.2743562, 2.599824, 1, 0, 0, 1, 1,
0.4616826, -0.7084873, 2.242916, 1, 0, 0, 1, 1,
0.4670909, -1.08465, 2.567136, 1, 0, 0, 1, 1,
0.4674266, 1.001824, 0.1709145, 1, 0, 0, 1, 1,
0.4732759, -3.604348, 5.227344, 1, 0, 0, 1, 1,
0.494073, 0.5082331, -0.2352896, 0, 0, 0, 1, 1,
0.4955758, -1.272888, 1.559095, 0, 0, 0, 1, 1,
0.4995322, 1.372686, 0.7849727, 0, 0, 0, 1, 1,
0.5048126, 0.2723187, 0.3518513, 0, 0, 0, 1, 1,
0.5075309, 0.9988798, 0.2509682, 0, 0, 0, 1, 1,
0.508087, 0.3466918, 1.037305, 0, 0, 0, 1, 1,
0.5119822, -0.2901442, 3.340973, 0, 0, 0, 1, 1,
0.5120893, 0.6667842, 1.019146, 1, 1, 1, 1, 1,
0.5127564, 1.596822, -0.4594178, 1, 1, 1, 1, 1,
0.5144899, -0.3978886, 2.598795, 1, 1, 1, 1, 1,
0.5154086, -2.354016, 3.712007, 1, 1, 1, 1, 1,
0.5183271, -0.2756144, 0.882028, 1, 1, 1, 1, 1,
0.5193976, -0.5712295, 2.250899, 1, 1, 1, 1, 1,
0.5206811, -0.1421414, 3.202471, 1, 1, 1, 1, 1,
0.5257435, -0.7176908, 1.522117, 1, 1, 1, 1, 1,
0.5271545, 1.845851, 0.2578534, 1, 1, 1, 1, 1,
0.5330855, -2.590889, 3.813937, 1, 1, 1, 1, 1,
0.5409448, 0.4152177, 1.806791, 1, 1, 1, 1, 1,
0.5417088, -1.116706, 2.637207, 1, 1, 1, 1, 1,
0.54422, 1.073252, 0.2766959, 1, 1, 1, 1, 1,
0.5448, -1.24489, 3.702546, 1, 1, 1, 1, 1,
0.5461909, -0.8781016, 2.865464, 1, 1, 1, 1, 1,
0.5553388, -1.110027, 2.156443, 0, 0, 1, 1, 1,
0.5581514, -0.07834359, 1.46922, 1, 0, 0, 1, 1,
0.5590172, -0.6038626, 3.221243, 1, 0, 0, 1, 1,
0.5597739, -0.4455687, 3.03891, 1, 0, 0, 1, 1,
0.560807, -0.004292557, 1.340619, 1, 0, 0, 1, 1,
0.5637326, -0.9988706, 3.342139, 1, 0, 0, 1, 1,
0.5658722, 0.08824164, 2.129809, 0, 0, 0, 1, 1,
0.5672445, 0.5185435, -0.05155599, 0, 0, 0, 1, 1,
0.5692374, 1.580049, 1.30639, 0, 0, 0, 1, 1,
0.5698349, -0.4865143, 1.453089, 0, 0, 0, 1, 1,
0.5764446, -0.7828623, 2.586161, 0, 0, 0, 1, 1,
0.5899832, -1.516252, 4.380491, 0, 0, 0, 1, 1,
0.5935195, -1.034791, 3.689591, 0, 0, 0, 1, 1,
0.5971057, -1.584229, 1.329434, 1, 1, 1, 1, 1,
0.5982919, 2.565968, -1.378989, 1, 1, 1, 1, 1,
0.5983205, 0.3641416, -1.15197, 1, 1, 1, 1, 1,
0.5993802, 0.6067158, 0.4714192, 1, 1, 1, 1, 1,
0.6013681, 0.2242586, 0.9976014, 1, 1, 1, 1, 1,
0.6032069, -0.5634018, 1.49625, 1, 1, 1, 1, 1,
0.605562, 0.6758487, 1.070896, 1, 1, 1, 1, 1,
0.6093178, 1.093003, 0.03609087, 1, 1, 1, 1, 1,
0.6166136, -0.280145, 1.942699, 1, 1, 1, 1, 1,
0.6173476, 0.1152988, -0.5360765, 1, 1, 1, 1, 1,
0.6176937, 0.1699148, 1.393404, 1, 1, 1, 1, 1,
0.6177055, 0.4063929, -0.01418856, 1, 1, 1, 1, 1,
0.6177128, 0.3589302, 0.2267666, 1, 1, 1, 1, 1,
0.6197475, 1.246882, -0.8476372, 1, 1, 1, 1, 1,
0.6239988, -0.3040574, 2.443314, 1, 1, 1, 1, 1,
0.6295834, 1.150592, 1.143736, 0, 0, 1, 1, 1,
0.6308249, -1.064634, 2.144453, 1, 0, 0, 1, 1,
0.636162, -0.1243825, 2.987243, 1, 0, 0, 1, 1,
0.6438774, 0.2269521, 0.8024468, 1, 0, 0, 1, 1,
0.6571992, -1.082662, 2.152243, 1, 0, 0, 1, 1,
0.6572725, -0.04169155, 1.493935, 1, 0, 0, 1, 1,
0.6587437, -1.042549, 1.672342, 0, 0, 0, 1, 1,
0.6610326, -1.229923, 4.220729, 0, 0, 0, 1, 1,
0.6613292, -0.7560065, 1.629183, 0, 0, 0, 1, 1,
0.6622481, -0.8380508, 1.53996, 0, 0, 0, 1, 1,
0.6653091, -0.5359671, 4.813647, 0, 0, 0, 1, 1,
0.6727216, 1.207151, 0.6667005, 0, 0, 0, 1, 1,
0.6733057, -0.4615063, -0.5683078, 0, 0, 0, 1, 1,
0.6767701, -0.155034, 3.237824, 1, 1, 1, 1, 1,
0.67766, 0.5015921, 1.010617, 1, 1, 1, 1, 1,
0.6778826, -0.9196651, 2.365325, 1, 1, 1, 1, 1,
0.6811113, -0.8924422, 2.76891, 1, 1, 1, 1, 1,
0.684183, 0.2759493, 2.143208, 1, 1, 1, 1, 1,
0.6865637, 0.2813958, 2.469856, 1, 1, 1, 1, 1,
0.687396, -1.185733, 3.17664, 1, 1, 1, 1, 1,
0.6896086, 0.3242465, -0.814357, 1, 1, 1, 1, 1,
0.6905935, 1.20612, -0.5919886, 1, 1, 1, 1, 1,
0.6947024, 0.0212871, 3.484736, 1, 1, 1, 1, 1,
0.6984451, 0.6737293, -0.2476737, 1, 1, 1, 1, 1,
0.7054423, 0.2167136, 0.2849872, 1, 1, 1, 1, 1,
0.7058725, -0.0631526, 1.844923, 1, 1, 1, 1, 1,
0.7068866, 1.098206, 1.055164, 1, 1, 1, 1, 1,
0.7071869, 0.002198979, 2.879265, 1, 1, 1, 1, 1,
0.7137093, -2.020142, 2.039454, 0, 0, 1, 1, 1,
0.7140154, -0.6049096, 2.63465, 1, 0, 0, 1, 1,
0.7180054, 0.7404619, -0.5438558, 1, 0, 0, 1, 1,
0.7190389, -0.7403147, 0.7281071, 1, 0, 0, 1, 1,
0.7221911, -1.099489, 1.044528, 1, 0, 0, 1, 1,
0.7237089, -0.6334211, 0.3743896, 1, 0, 0, 1, 1,
0.729695, -0.210267, 1.632456, 0, 0, 0, 1, 1,
0.7305964, -0.2212264, 1.543754, 0, 0, 0, 1, 1,
0.7349201, -0.5175036, 3.124168, 0, 0, 0, 1, 1,
0.737717, 0.6927739, -2.20315, 0, 0, 0, 1, 1,
0.7383094, 0.5375303, 0.957501, 0, 0, 0, 1, 1,
0.7411737, -0.876479, 2.138009, 0, 0, 0, 1, 1,
0.7416329, 0.6232442, 0.75489, 0, 0, 0, 1, 1,
0.7429708, 0.6881184, -0.5908184, 1, 1, 1, 1, 1,
0.7440742, 0.7130993, 1.609281, 1, 1, 1, 1, 1,
0.7483878, 0.09470922, 0.9991474, 1, 1, 1, 1, 1,
0.7494617, 0.1223868, 3.161203, 1, 1, 1, 1, 1,
0.7520691, 1.753261, 1.166452, 1, 1, 1, 1, 1,
0.7526308, -0.9442883, 2.350662, 1, 1, 1, 1, 1,
0.761112, -0.3058235, 2.383522, 1, 1, 1, 1, 1,
0.7612, 0.5589811, 2.681545, 1, 1, 1, 1, 1,
0.7630522, 0.005673898, 1.736879, 1, 1, 1, 1, 1,
0.7725786, -0.5626045, 1.753495, 1, 1, 1, 1, 1,
0.7758306, -1.336196, -0.4253545, 1, 1, 1, 1, 1,
0.7758429, 0.5005826, 1.337432, 1, 1, 1, 1, 1,
0.7764388, 0.5856752, 1.160687, 1, 1, 1, 1, 1,
0.7775538, -0.2815836, 0.6358153, 1, 1, 1, 1, 1,
0.7780468, -1.23411, 4.009489, 1, 1, 1, 1, 1,
0.7830092, -0.4142892, 1.925076, 0, 0, 1, 1, 1,
0.783867, 1.876755, 0.4586517, 1, 0, 0, 1, 1,
0.7896714, -0.3712206, 3.375111, 1, 0, 0, 1, 1,
0.7916221, -0.1681316, 2.253012, 1, 0, 0, 1, 1,
0.7923988, -1.448261, 2.128477, 1, 0, 0, 1, 1,
0.8000296, 0.4961776, 1.821694, 1, 0, 0, 1, 1,
0.8035681, -1.187378, 2.184702, 0, 0, 0, 1, 1,
0.8092043, -0.4431159, 1.793932, 0, 0, 0, 1, 1,
0.8115735, 1.674983, 2.409405, 0, 0, 0, 1, 1,
0.8179468, 0.7196841, 2.070361, 0, 0, 0, 1, 1,
0.8181455, -1.273111, 1.208357, 0, 0, 0, 1, 1,
0.8189096, 0.2156213, 1.865411, 0, 0, 0, 1, 1,
0.8298031, -0.4424094, 3.002563, 0, 0, 0, 1, 1,
0.8394475, -0.6151001, 2.92354, 1, 1, 1, 1, 1,
0.844669, -0.9419267, 2.288673, 1, 1, 1, 1, 1,
0.8488173, -0.1965383, 1.831255, 1, 1, 1, 1, 1,
0.8580595, -1.521465, 2.036397, 1, 1, 1, 1, 1,
0.8643619, 0.8091879, 0.09421612, 1, 1, 1, 1, 1,
0.8693955, -0.009013991, 1.963581, 1, 1, 1, 1, 1,
0.8697899, 0.2309667, 1.741142, 1, 1, 1, 1, 1,
0.873117, 0.8579397, 1.129986, 1, 1, 1, 1, 1,
0.8758523, -0.5696098, 2.32932, 1, 1, 1, 1, 1,
0.8770542, 1.911468, -0.9582589, 1, 1, 1, 1, 1,
0.8793213, -0.5427808, 2.39716, 1, 1, 1, 1, 1,
0.8835318, -0.3483515, 2.540522, 1, 1, 1, 1, 1,
0.8867239, -0.04859089, 2.220448, 1, 1, 1, 1, 1,
0.8893786, 1.097353, 0.7073044, 1, 1, 1, 1, 1,
0.8909305, 0.5338385, -0.2430504, 1, 1, 1, 1, 1,
0.8925046, -0.3520624, 1.235159, 0, 0, 1, 1, 1,
0.8970772, -1.895949, 3.070603, 1, 0, 0, 1, 1,
0.9092876, 0.1675132, 1.845774, 1, 0, 0, 1, 1,
0.9116586, -0.2983909, 0.872875, 1, 0, 0, 1, 1,
0.9205871, 0.6863565, 0.5272173, 1, 0, 0, 1, 1,
0.9227046, 0.1707067, 2.952487, 1, 0, 0, 1, 1,
0.9234254, 0.6870716, 2.689074, 0, 0, 0, 1, 1,
0.9258219, -0.8144469, 3.978842, 0, 0, 0, 1, 1,
0.9301184, -2.857466, 3.018323, 0, 0, 0, 1, 1,
0.9314738, 1.877246, 0.03527625, 0, 0, 0, 1, 1,
0.9488201, 2.156864, -0.09049211, 0, 0, 0, 1, 1,
0.9494244, -0.9104152, 0.6022634, 0, 0, 0, 1, 1,
0.9539199, 0.09220617, 1.51332, 0, 0, 0, 1, 1,
0.9541048, -0.1595718, 1.916498, 1, 1, 1, 1, 1,
0.9545563, 1.319684, 1.761276, 1, 1, 1, 1, 1,
0.9670135, -1.639518, 3.857404, 1, 1, 1, 1, 1,
0.9704622, 0.8644741, 0.8877574, 1, 1, 1, 1, 1,
0.9738966, -0.4956797, 1.561871, 1, 1, 1, 1, 1,
0.9743782, -0.8177681, 2.353191, 1, 1, 1, 1, 1,
0.9749982, 0.5342727, -0.09737522, 1, 1, 1, 1, 1,
0.9754941, -1.259133, 3.476514, 1, 1, 1, 1, 1,
0.9773305, -1.76282, 2.648657, 1, 1, 1, 1, 1,
0.9829891, 0.6700473, 1.560329, 1, 1, 1, 1, 1,
0.9833264, -1.311478, 1.601892, 1, 1, 1, 1, 1,
0.9876522, 0.8551401, 0.8033016, 1, 1, 1, 1, 1,
0.9903718, -1.680783, 2.646373, 1, 1, 1, 1, 1,
0.9963102, 0.1676017, 0.4191139, 1, 1, 1, 1, 1,
0.9995499, 1.027916, 1.572419, 1, 1, 1, 1, 1,
1.007958, -1.208868, 2.073439, 0, 0, 1, 1, 1,
1.016065, 0.3386516, -0.6352725, 1, 0, 0, 1, 1,
1.019579, -1.049222, 4.102593, 1, 0, 0, 1, 1,
1.025896, -0.8650122, 2.020803, 1, 0, 0, 1, 1,
1.030793, -0.7477213, 3.219925, 1, 0, 0, 1, 1,
1.032081, -1.129824, 4.626214, 1, 0, 0, 1, 1,
1.036022, -0.4716493, 2.603949, 0, 0, 0, 1, 1,
1.039147, -0.8946884, 1.62459, 0, 0, 0, 1, 1,
1.041618, -0.8147169, 1.555162, 0, 0, 0, 1, 1,
1.044803, 0.1329155, 1.285301, 0, 0, 0, 1, 1,
1.04896, -0.1401951, 1.500546, 0, 0, 0, 1, 1,
1.056288, 0.3328121, -0.4132387, 0, 0, 0, 1, 1,
1.056692, 0.2892514, 1.18468, 0, 0, 0, 1, 1,
1.061628, -1.998405, 2.671481, 1, 1, 1, 1, 1,
1.064014, 0.6010672, 0.1173063, 1, 1, 1, 1, 1,
1.073376, -0.4692285, 3.011032, 1, 1, 1, 1, 1,
1.074334, -1.553653, 1.443634, 1, 1, 1, 1, 1,
1.077506, 0.9093236, 1.197923, 1, 1, 1, 1, 1,
1.080798, 0.2540339, -0.1904053, 1, 1, 1, 1, 1,
1.083523, 0.1499002, 1.279393, 1, 1, 1, 1, 1,
1.085116, 0.8220581, 1.809937, 1, 1, 1, 1, 1,
1.085703, -0.0858119, 1.350137, 1, 1, 1, 1, 1,
1.101011, -0.1559771, 3.403131, 1, 1, 1, 1, 1,
1.107187, 0.9738793, 0.1594022, 1, 1, 1, 1, 1,
1.114154, -0.8940321, 3.00215, 1, 1, 1, 1, 1,
1.120755, -1.241712, 2.338058, 1, 1, 1, 1, 1,
1.123707, 0.6950949, 0.8670416, 1, 1, 1, 1, 1,
1.124546, 0.2394901, 2.290343, 1, 1, 1, 1, 1,
1.124632, 0.843155, 1.801039, 0, 0, 1, 1, 1,
1.127337, 0.4649921, 0.6989449, 1, 0, 0, 1, 1,
1.134093, -0.9990598, 1.671834, 1, 0, 0, 1, 1,
1.136046, 0.8097669, 3.231911, 1, 0, 0, 1, 1,
1.138664, -0.8334367, 1.584451, 1, 0, 0, 1, 1,
1.144253, -0.7610233, 0.5352985, 1, 0, 0, 1, 1,
1.151337, 0.3192847, 0.2747538, 0, 0, 0, 1, 1,
1.156963, 0.7449867, 2.995546, 0, 0, 0, 1, 1,
1.158838, 0.6756067, 1.490846, 0, 0, 0, 1, 1,
1.166839, -0.2495288, 1.371788, 0, 0, 0, 1, 1,
1.171013, -1.261505, 2.655948, 0, 0, 0, 1, 1,
1.174459, -1.75225, 2.987013, 0, 0, 0, 1, 1,
1.177968, -0.6196631, 0.8371408, 0, 0, 0, 1, 1,
1.195244, 3.097097, -1.053301, 1, 1, 1, 1, 1,
1.200475, -1.29023, 3.025816, 1, 1, 1, 1, 1,
1.203062, -0.1830436, 1.449244, 1, 1, 1, 1, 1,
1.208903, 0.07227018, 4.373221, 1, 1, 1, 1, 1,
1.210762, -0.1675841, 1.505866, 1, 1, 1, 1, 1,
1.213596, -0.6451858, 2.284724, 1, 1, 1, 1, 1,
1.213744, 0.3752913, 3.507672, 1, 1, 1, 1, 1,
1.216987, 0.5524709, 1.604762, 1, 1, 1, 1, 1,
1.217055, 1.366064, 1.616124, 1, 1, 1, 1, 1,
1.217674, 1.292392, 1.539693, 1, 1, 1, 1, 1,
1.218879, 1.862839, 1.844345, 1, 1, 1, 1, 1,
1.220924, 1.148126, 1.586042, 1, 1, 1, 1, 1,
1.230429, -0.06357594, 1.388563, 1, 1, 1, 1, 1,
1.231331, 0.149471, 0.1874186, 1, 1, 1, 1, 1,
1.247844, -0.9533214, 3.85507, 1, 1, 1, 1, 1,
1.262289, -0.05970256, 2.997489, 0, 0, 1, 1, 1,
1.274345, 0.6643278, -0.1710917, 1, 0, 0, 1, 1,
1.274422, -0.9730325, 0.6969723, 1, 0, 0, 1, 1,
1.275893, 0.9911163, 0.5717126, 1, 0, 0, 1, 1,
1.289983, 0.3022979, 2.027953, 1, 0, 0, 1, 1,
1.292359, -0.2856482, 2.049049, 1, 0, 0, 1, 1,
1.292513, -0.4098979, 1.343604, 0, 0, 0, 1, 1,
1.320073, 1.293842, 1.300696, 0, 0, 0, 1, 1,
1.321678, -0.3487503, 1.949082, 0, 0, 0, 1, 1,
1.324328, -0.1498349, 2.587276, 0, 0, 0, 1, 1,
1.341047, 0.3878552, 0.1531777, 0, 0, 0, 1, 1,
1.345951, 0.6648757, 0.8151038, 0, 0, 0, 1, 1,
1.34604, 1.037008, 0.2705912, 0, 0, 0, 1, 1,
1.350115, 2.030537, 0.6381965, 1, 1, 1, 1, 1,
1.350663, 1.53863, 0.6142945, 1, 1, 1, 1, 1,
1.352953, -2.245162, 3.506659, 1, 1, 1, 1, 1,
1.356773, -0.6838788, 1.476199, 1, 1, 1, 1, 1,
1.377365, -0.5773473, 1.742731, 1, 1, 1, 1, 1,
1.383724, 1.386842, 0.3453358, 1, 1, 1, 1, 1,
1.390959, -1.061284, 0.5323349, 1, 1, 1, 1, 1,
1.392106, -0.022473, 2.76853, 1, 1, 1, 1, 1,
1.397555, -0.8656923, 2.937532, 1, 1, 1, 1, 1,
1.399032, -0.1177644, 1.768367, 1, 1, 1, 1, 1,
1.441189, 1.041119, 0.8906229, 1, 1, 1, 1, 1,
1.441701, 0.3827218, 1.090177, 1, 1, 1, 1, 1,
1.448455, 1.23149, 1.637875, 1, 1, 1, 1, 1,
1.462006, -0.4390025, 4.283092, 1, 1, 1, 1, 1,
1.471196, 0.8930283, 0.2518168, 1, 1, 1, 1, 1,
1.472094, 0.598986, 1.369922, 0, 0, 1, 1, 1,
1.482952, -0.8777327, 2.653043, 1, 0, 0, 1, 1,
1.488454, 0.1137985, 0.5487567, 1, 0, 0, 1, 1,
1.494053, -1.488405, 1.848537, 1, 0, 0, 1, 1,
1.508655, 1.526473, 2.292144, 1, 0, 0, 1, 1,
1.511975, 0.2422943, 2.00157, 1, 0, 0, 1, 1,
1.527497, -0.3976098, 3.104804, 0, 0, 0, 1, 1,
1.529489, 0.1517694, 1.876788, 0, 0, 0, 1, 1,
1.533767, 0.6812325, 0.1028518, 0, 0, 0, 1, 1,
1.537385, 1.545298, 0.8828285, 0, 0, 0, 1, 1,
1.546007, -0.7843955, 1.374267, 0, 0, 0, 1, 1,
1.563682, -1.164525, 2.307801, 0, 0, 0, 1, 1,
1.563691, 2.381893, 0.2982168, 0, 0, 0, 1, 1,
1.563995, 0.7874897, 1.460244, 1, 1, 1, 1, 1,
1.574127, 1.169302, 0.4773101, 1, 1, 1, 1, 1,
1.595273, -1.296987, 1.22235, 1, 1, 1, 1, 1,
1.597442, -0.1605766, 2.05465, 1, 1, 1, 1, 1,
1.60212, 0.1520324, 3.727828, 1, 1, 1, 1, 1,
1.609887, -0.1904598, 0.4228882, 1, 1, 1, 1, 1,
1.61122, -0.1535496, 0.4815839, 1, 1, 1, 1, 1,
1.615124, 0.8084486, 0.5335146, 1, 1, 1, 1, 1,
1.646285, 0.2952798, 2.586794, 1, 1, 1, 1, 1,
1.661759, -1.610525, 2.08548, 1, 1, 1, 1, 1,
1.662361, -0.7619187, 0.7331791, 1, 1, 1, 1, 1,
1.68974, 1.088035, -0.4632476, 1, 1, 1, 1, 1,
1.698359, -0.5852961, 1.832983, 1, 1, 1, 1, 1,
1.701443, 0.2428635, 2.408358, 1, 1, 1, 1, 1,
1.715299, 1.462094, 1.401501, 1, 1, 1, 1, 1,
1.723889, 0.3115248, 0.05492353, 0, 0, 1, 1, 1,
1.740648, 0.08140825, 1.902651, 1, 0, 0, 1, 1,
1.755242, -0.6812256, 1.697378, 1, 0, 0, 1, 1,
1.7646, -0.01653759, -0.3175676, 1, 0, 0, 1, 1,
1.771791, -0.8421564, 1.312562, 1, 0, 0, 1, 1,
1.776269, -1.331575, 1.361412, 1, 0, 0, 1, 1,
1.779075, -0.4055153, 1.737263, 0, 0, 0, 1, 1,
1.795364, -1.247158, 1.819115, 0, 0, 0, 1, 1,
1.798718, -0.8286092, 2.60987, 0, 0, 0, 1, 1,
1.815827, 0.7265198, -0.06072211, 0, 0, 0, 1, 1,
1.852806, 0.4181478, 1.632402, 0, 0, 0, 1, 1,
1.870335, -1.322887, 0.8928554, 0, 0, 0, 1, 1,
1.875988, 0.009011986, 2.057793, 0, 0, 0, 1, 1,
1.879673, -0.4027769, 2.951387, 1, 1, 1, 1, 1,
1.90344, -0.8523262, 4.762465, 1, 1, 1, 1, 1,
1.913846, -0.6922132, 2.677457, 1, 1, 1, 1, 1,
1.956619, 2.084382, 0.7451485, 1, 1, 1, 1, 1,
1.988569, 1.074293, 0.7485767, 1, 1, 1, 1, 1,
1.995983, 0.1545463, 1.871273, 1, 1, 1, 1, 1,
2.046595, -0.07518391, 3.410942, 1, 1, 1, 1, 1,
2.117429, -0.5860294, 2.089694, 1, 1, 1, 1, 1,
2.131302, -1.325939, 4.594113, 1, 1, 1, 1, 1,
2.144429, -0.5209826, 3.090999, 1, 1, 1, 1, 1,
2.149469, -0.6379918, 0.4683026, 1, 1, 1, 1, 1,
2.150543, -0.6851708, 2.127259, 1, 1, 1, 1, 1,
2.172855, 0.2123028, 0.9066003, 1, 1, 1, 1, 1,
2.209096, 0.4548363, 1.829559, 1, 1, 1, 1, 1,
2.235709, -1.302891, 1.324584, 1, 1, 1, 1, 1,
2.253269, 0.1508386, 2.67005, 0, 0, 1, 1, 1,
2.262545, -0.1400346, 1.646961, 1, 0, 0, 1, 1,
2.291885, -0.5914976, 1.158001, 1, 0, 0, 1, 1,
2.297688, -0.2206567, 1.456653, 1, 0, 0, 1, 1,
2.359015, -0.9136187, 2.133037, 1, 0, 0, 1, 1,
2.39493, 0.8296375, 2.056974, 1, 0, 0, 1, 1,
2.417914, -0.8614366, 1.941252, 0, 0, 0, 1, 1,
2.418347, -1.431765, 1.920965, 0, 0, 0, 1, 1,
2.434945, 0.4490907, 2.39886, 0, 0, 0, 1, 1,
2.469499, 0.8622501, 1.57793, 0, 0, 0, 1, 1,
2.584611, 1.664477, 2.73096, 0, 0, 0, 1, 1,
2.608639, 1.242325, 0.7380439, 0, 0, 0, 1, 1,
2.61409, -0.5037183, 0.8504725, 0, 0, 0, 1, 1,
2.655063, 0.2485605, 2.170281, 1, 1, 1, 1, 1,
2.716964, 0.9604513, -0.9778386, 1, 1, 1, 1, 1,
2.781894, -1.215968, 2.062713, 1, 1, 1, 1, 1,
2.787617, 0.1161061, 2.051587, 1, 1, 1, 1, 1,
2.839016, -1.241, 0.1327043, 1, 1, 1, 1, 1,
3.276371, -0.03928474, 0.2590878, 1, 1, 1, 1, 1,
3.371479, -0.4472463, 0.8388937, 1, 1, 1, 1, 1
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
var radius = 9.760397;
var distance = 34.28298;
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
mvMatrix.translate( -0.1927316, 0.2536254, -0.1463449 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.28298);
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
