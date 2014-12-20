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
-2.895876, 0.8488295, -2.013566, 1, 0, 0, 1,
-2.693575, 0.4687822, -2.262346, 1, 0.007843138, 0, 1,
-2.666047, 2.086488, -0.05650027, 1, 0.01176471, 0, 1,
-2.630905, -0.6325281, -2.091298, 1, 0.01960784, 0, 1,
-2.521348, -0.4017523, -2.038785, 1, 0.02352941, 0, 1,
-2.483284, -0.5696443, -1.971684, 1, 0.03137255, 0, 1,
-2.48313, 0.03396358, -1.724462, 1, 0.03529412, 0, 1,
-2.390253, 0.283953, -2.567153, 1, 0.04313726, 0, 1,
-2.332805, 0.5004361, -1.801116, 1, 0.04705882, 0, 1,
-2.306189, 1.047769, -2.382419, 1, 0.05490196, 0, 1,
-2.304679, 0.546095, -0.9789525, 1, 0.05882353, 0, 1,
-2.284422, 2.309044, -1.004691, 1, 0.06666667, 0, 1,
-2.265466, 0.9112808, -0.1217934, 1, 0.07058824, 0, 1,
-2.258324, -2.230489, -3.563518, 1, 0.07843138, 0, 1,
-2.225415, -0.558237, -2.3406, 1, 0.08235294, 0, 1,
-2.135212, 0.7125665, -1.685566, 1, 0.09019608, 0, 1,
-2.119849, 0.9855376, -2.958826, 1, 0.09411765, 0, 1,
-2.108016, 0.2342575, -0.8768103, 1, 0.1019608, 0, 1,
-2.071629, 0.6686221, 0.048016, 1, 0.1098039, 0, 1,
-2.067235, -2.06399, -1.912131, 1, 0.1137255, 0, 1,
-1.977212, -0.04489451, -0.3314528, 1, 0.1215686, 0, 1,
-1.944743, -0.6896409, -2.494498, 1, 0.1254902, 0, 1,
-1.923452, 1.287749, -3.300161, 1, 0.1333333, 0, 1,
-1.920469, -1.104899, -2.952964, 1, 0.1372549, 0, 1,
-1.909689, 1.438804, -0.6135441, 1, 0.145098, 0, 1,
-1.899114, -0.5463604, -2.049021, 1, 0.1490196, 0, 1,
-1.8547, 0.5905451, -1.682787, 1, 0.1568628, 0, 1,
-1.850912, 1.545151, -1.040164, 1, 0.1607843, 0, 1,
-1.841951, -0.7547661, -2.10379, 1, 0.1686275, 0, 1,
-1.832939, -0.9229531, -2.536575, 1, 0.172549, 0, 1,
-1.796755, -0.3377916, -1.501834, 1, 0.1803922, 0, 1,
-1.789067, 0.8806848, -2.415427, 1, 0.1843137, 0, 1,
-1.780175, 1.338984, -1.909705, 1, 0.1921569, 0, 1,
-1.765871, 1.151866, -2.005613, 1, 0.1960784, 0, 1,
-1.762503, -0.2924017, -3.247102, 1, 0.2039216, 0, 1,
-1.756013, -0.548262, -2.128703, 1, 0.2117647, 0, 1,
-1.748391, -0.1380452, -1.645332, 1, 0.2156863, 0, 1,
-1.745168, -0.5130332, -3.131256, 1, 0.2235294, 0, 1,
-1.739755, 0.776538, -2.7676, 1, 0.227451, 0, 1,
-1.717905, -0.3639689, -2.653065, 1, 0.2352941, 0, 1,
-1.715905, 1.169402, 1.064671, 1, 0.2392157, 0, 1,
-1.697228, 0.418302, -1.480539, 1, 0.2470588, 0, 1,
-1.688925, -1.974873, -3.704232, 1, 0.2509804, 0, 1,
-1.680754, -0.6652393, -3.366166, 1, 0.2588235, 0, 1,
-1.673917, 0.08781375, -1.766541, 1, 0.2627451, 0, 1,
-1.667067, 0.8885909, -2.074225, 1, 0.2705882, 0, 1,
-1.655385, 0.138918, -3.366645, 1, 0.2745098, 0, 1,
-1.641025, -0.3472747, -0.9469932, 1, 0.282353, 0, 1,
-1.632301, -0.1102101, -3.654456, 1, 0.2862745, 0, 1,
-1.613006, -1.698918, -2.451787, 1, 0.2941177, 0, 1,
-1.604277, -0.3351325, 0.2606265, 1, 0.3019608, 0, 1,
-1.596661, -1.519706, -1.766552, 1, 0.3058824, 0, 1,
-1.582601, 0.7758884, -1.509718, 1, 0.3137255, 0, 1,
-1.572858, -0.3490224, -0.2278608, 1, 0.3176471, 0, 1,
-1.559042, -0.1861008, -1.288301, 1, 0.3254902, 0, 1,
-1.546052, -1.323472, 0.4347396, 1, 0.3294118, 0, 1,
-1.540429, -0.4066415, -1.26686, 1, 0.3372549, 0, 1,
-1.522503, 0.3927366, 0.700739, 1, 0.3411765, 0, 1,
-1.518157, -1.242896, -3.733838, 1, 0.3490196, 0, 1,
-1.5021, -0.6005151, -3.702635, 1, 0.3529412, 0, 1,
-1.495014, -2.801886, -3.057644, 1, 0.3607843, 0, 1,
-1.472998, 0.562349, -1.040399, 1, 0.3647059, 0, 1,
-1.47145, -0.6008989, -2.81251, 1, 0.372549, 0, 1,
-1.462647, 0.6629189, -0.7291254, 1, 0.3764706, 0, 1,
-1.455293, 0.9688518, -0.7764173, 1, 0.3843137, 0, 1,
-1.453929, 1.794636, 1.022967, 1, 0.3882353, 0, 1,
-1.436162, -0.9623252, -2.082791, 1, 0.3960784, 0, 1,
-1.432979, -2.158249, -2.687325, 1, 0.4039216, 0, 1,
-1.431414, 0.9645031, -0.4858714, 1, 0.4078431, 0, 1,
-1.428216, 0.4569608, -1.198141, 1, 0.4156863, 0, 1,
-1.422605, 1.271056, -1.029593, 1, 0.4196078, 0, 1,
-1.414308, -0.7050038, -2.702782, 1, 0.427451, 0, 1,
-1.390171, 1.333033, -0.4587949, 1, 0.4313726, 0, 1,
-1.38895, -0.3823439, -1.277509, 1, 0.4392157, 0, 1,
-1.388616, -1.121246, -0.4632876, 1, 0.4431373, 0, 1,
-1.387227, 0.02451608, 0.1463998, 1, 0.4509804, 0, 1,
-1.383794, -1.35812, -3.399435, 1, 0.454902, 0, 1,
-1.381016, 1.026365, -0.9419493, 1, 0.4627451, 0, 1,
-1.359518, 0.0810414, -2.332103, 1, 0.4666667, 0, 1,
-1.359165, -0.8563753, -1.896048, 1, 0.4745098, 0, 1,
-1.343999, 0.2423578, 0.4644156, 1, 0.4784314, 0, 1,
-1.34247, -0.06152618, 0.6742737, 1, 0.4862745, 0, 1,
-1.334841, 1.882382, -1.285678, 1, 0.4901961, 0, 1,
-1.334161, 0.1483207, 0.001848973, 1, 0.4980392, 0, 1,
-1.321221, -1.288848, -3.59594, 1, 0.5058824, 0, 1,
-1.31328, -0.9294425, -0.9855008, 1, 0.509804, 0, 1,
-1.307425, -0.633155, -3.239358, 1, 0.5176471, 0, 1,
-1.307032, -0.4561561, -2.179557, 1, 0.5215687, 0, 1,
-1.299627, 0.58493, -3.078477, 1, 0.5294118, 0, 1,
-1.295543, -0.2800149, -2.765767, 1, 0.5333334, 0, 1,
-1.286914, 0.03160237, -2.389187, 1, 0.5411765, 0, 1,
-1.284926, 0.5906212, -2.042173, 1, 0.5450981, 0, 1,
-1.279859, 1.063977, -0.23605, 1, 0.5529412, 0, 1,
-1.271563, 0.3850037, -1.366707, 1, 0.5568628, 0, 1,
-1.270448, -0.8031688, -1.792517, 1, 0.5647059, 0, 1,
-1.265812, -0.06261253, -2.565062, 1, 0.5686275, 0, 1,
-1.264335, -0.179447, -0.1948456, 1, 0.5764706, 0, 1,
-1.262606, -0.1846812, -3.349834, 1, 0.5803922, 0, 1,
-1.260016, 0.10989, -0.2771195, 1, 0.5882353, 0, 1,
-1.255471, 0.2557329, -0.5919726, 1, 0.5921569, 0, 1,
-1.255335, -0.4293129, -3.058436, 1, 0.6, 0, 1,
-1.252728, -1.489351, -3.543745, 1, 0.6078432, 0, 1,
-1.247643, 0.877696, -0.7952793, 1, 0.6117647, 0, 1,
-1.245769, -1.758673, -2.647673, 1, 0.6196079, 0, 1,
-1.245376, -1.156993, -4.051441, 1, 0.6235294, 0, 1,
-1.244256, 0.2646327, -0.8839338, 1, 0.6313726, 0, 1,
-1.240713, 0.008111153, -1.478739, 1, 0.6352941, 0, 1,
-1.236499, 0.5237985, -1.469694, 1, 0.6431373, 0, 1,
-1.235847, -1.23653, -2.212583, 1, 0.6470588, 0, 1,
-1.235403, -0.3540601, 0.2638821, 1, 0.654902, 0, 1,
-1.231921, 0.5371245, 1.492848, 1, 0.6588235, 0, 1,
-1.220711, -0.4758851, -1.238719, 1, 0.6666667, 0, 1,
-1.215797, -0.9467561, -3.741542, 1, 0.6705883, 0, 1,
-1.207349, 0.03223768, -2.379798, 1, 0.6784314, 0, 1,
-1.204402, -1.052656, -3.666571, 1, 0.682353, 0, 1,
-1.198164, -0.03274465, -1.580085, 1, 0.6901961, 0, 1,
-1.196971, -0.7808959, -1.852267, 1, 0.6941177, 0, 1,
-1.196216, 2.139614, -0.3379102, 1, 0.7019608, 0, 1,
-1.188802, -0.5833352, -1.2423, 1, 0.7098039, 0, 1,
-1.186128, 0.7317519, -2.217154, 1, 0.7137255, 0, 1,
-1.174159, 0.2574707, -2.596898, 1, 0.7215686, 0, 1,
-1.161231, 1.406579, -0.7933019, 1, 0.7254902, 0, 1,
-1.160481, -0.1925844, -0.3683889, 1, 0.7333333, 0, 1,
-1.15765, -1.210477, -1.634924, 1, 0.7372549, 0, 1,
-1.154795, 1.622997, -0.4468221, 1, 0.7450981, 0, 1,
-1.154739, 1.375387, -0.3921258, 1, 0.7490196, 0, 1,
-1.1427, 0.563491, -1.316665, 1, 0.7568628, 0, 1,
-1.13897, 1.124881, -0.5471872, 1, 0.7607843, 0, 1,
-1.128341, 0.4050293, -1.025483, 1, 0.7686275, 0, 1,
-1.127875, -2.410871, -0.6904055, 1, 0.772549, 0, 1,
-1.123291, -1.304753, -3.752949, 1, 0.7803922, 0, 1,
-1.122612, 1.557513, -1.358562, 1, 0.7843137, 0, 1,
-1.106592, 2.700379, -1.727836, 1, 0.7921569, 0, 1,
-1.101363, 0.2845719, -1.876957, 1, 0.7960784, 0, 1,
-1.098455, 1.161889, -1.002151, 1, 0.8039216, 0, 1,
-1.09487, -0.8446965, -3.724018, 1, 0.8117647, 0, 1,
-1.082768, 0.2061095, -1.523243, 1, 0.8156863, 0, 1,
-1.081804, -0.3147971, -3.834277, 1, 0.8235294, 0, 1,
-1.080098, -1.190209, -3.33547, 1, 0.827451, 0, 1,
-1.080061, -0.9539605, -3.245124, 1, 0.8352941, 0, 1,
-1.07461, -0.2341344, -2.422237, 1, 0.8392157, 0, 1,
-1.072954, -0.7821811, -3.145341, 1, 0.8470588, 0, 1,
-1.071384, -1.745661, -1.089821, 1, 0.8509804, 0, 1,
-1.069132, -0.635159, -2.913278, 1, 0.8588235, 0, 1,
-1.050729, -0.6523735, -2.958378, 1, 0.8627451, 0, 1,
-1.043482, -1.369429, -1.329642, 1, 0.8705882, 0, 1,
-1.039817, 0.287799, -2.085851, 1, 0.8745098, 0, 1,
-1.032496, 1.703087, -0.1978858, 1, 0.8823529, 0, 1,
-1.028245, -0.6924566, -3.054125, 1, 0.8862745, 0, 1,
-1.027956, 0.3376333, -0.2666614, 1, 0.8941177, 0, 1,
-1.02677, 1.158569, -0.938314, 1, 0.8980392, 0, 1,
-1.018989, -1.539891, -3.264859, 1, 0.9058824, 0, 1,
-1.015572, 0.9727023, -1.000016, 1, 0.9137255, 0, 1,
-1.013437, -0.6207398, -2.547977, 1, 0.9176471, 0, 1,
-1.010075, 1.38035, -0.2481267, 1, 0.9254902, 0, 1,
-1.001633, -2.241484, -2.822794, 1, 0.9294118, 0, 1,
-1.000504, 1.57588, -0.1041311, 1, 0.9372549, 0, 1,
-0.9976575, 2.250788, 0.06611598, 1, 0.9411765, 0, 1,
-0.9739481, -1.230949, -1.994039, 1, 0.9490196, 0, 1,
-0.9726844, 0.2215956, -1.985012, 1, 0.9529412, 0, 1,
-0.9718274, 1.101385, -0.3460617, 1, 0.9607843, 0, 1,
-0.964413, 0.1754263, -0.5316942, 1, 0.9647059, 0, 1,
-0.9611694, 0.7771521, -0.281348, 1, 0.972549, 0, 1,
-0.9482976, 1.010345, -1.419854, 1, 0.9764706, 0, 1,
-0.9466836, 0.9405856, 0.8254405, 1, 0.9843137, 0, 1,
-0.9444816, -0.6117402, -0.9133636, 1, 0.9882353, 0, 1,
-0.9394733, -1.487616, -1.80316, 1, 0.9960784, 0, 1,
-0.9379564, -1.484838, -1.893916, 0.9960784, 1, 0, 1,
-0.9377431, 0.8309809, -1.788411, 0.9921569, 1, 0, 1,
-0.9318897, -0.6813263, -1.765356, 0.9843137, 1, 0, 1,
-0.9251523, -0.1903383, -2.283313, 0.9803922, 1, 0, 1,
-0.9240379, 2.749388, -0.6924192, 0.972549, 1, 0, 1,
-0.910724, -0.3074889, -2.26397, 0.9686275, 1, 0, 1,
-0.9079093, -0.00932263, -0.9580438, 0.9607843, 1, 0, 1,
-0.906382, -2.60644, -3.994567, 0.9568627, 1, 0, 1,
-0.9036804, -0.551748, -1.348073, 0.9490196, 1, 0, 1,
-0.8971901, 2.803026, 0.02243781, 0.945098, 1, 0, 1,
-0.8783204, -0.4931155, -1.48286, 0.9372549, 1, 0, 1,
-0.8763069, 1.19406, -1.114156, 0.9333333, 1, 0, 1,
-0.8754582, -0.01362112, -0.3002267, 0.9254902, 1, 0, 1,
-0.8743179, -0.184591, 1.014911, 0.9215686, 1, 0, 1,
-0.8669694, -1.059155, -1.762715, 0.9137255, 1, 0, 1,
-0.8662059, -0.05256558, -4.342068, 0.9098039, 1, 0, 1,
-0.8651776, 0.1693302, -3.380129, 0.9019608, 1, 0, 1,
-0.8618723, 0.743462, -0.9551812, 0.8941177, 1, 0, 1,
-0.8592891, -0.3697694, -1.793899, 0.8901961, 1, 0, 1,
-0.8562682, 0.6213863, 0.5062936, 0.8823529, 1, 0, 1,
-0.8555538, 0.5812986, -0.4462751, 0.8784314, 1, 0, 1,
-0.8498991, -0.007793461, -1.683416, 0.8705882, 1, 0, 1,
-0.847676, -0.3575312, -3.291687, 0.8666667, 1, 0, 1,
-0.8462361, 0.6910993, -0.5896515, 0.8588235, 1, 0, 1,
-0.8461148, 0.9934917, -1.493364, 0.854902, 1, 0, 1,
-0.8458844, 0.02097558, -1.798611, 0.8470588, 1, 0, 1,
-0.8421261, -0.07163735, -1.940486, 0.8431373, 1, 0, 1,
-0.8417316, -0.3384893, -2.528166, 0.8352941, 1, 0, 1,
-0.8417081, -1.439988, -3.429214, 0.8313726, 1, 0, 1,
-0.8411586, 0.7926804, -1.262473, 0.8235294, 1, 0, 1,
-0.8392587, 0.4994949, -0.8613679, 0.8196079, 1, 0, 1,
-0.8371691, 0.2356883, 0.1599329, 0.8117647, 1, 0, 1,
-0.8327368, 0.2395271, -0.9576052, 0.8078431, 1, 0, 1,
-0.8296053, -0.6623858, -2.402209, 0.8, 1, 0, 1,
-0.8293887, 0.02774094, -2.153116, 0.7921569, 1, 0, 1,
-0.8282405, 1.851699, -0.7533485, 0.7882353, 1, 0, 1,
-0.8220164, 1.144259, -0.235006, 0.7803922, 1, 0, 1,
-0.8192504, -0.1254076, -1.255599, 0.7764706, 1, 0, 1,
-0.818624, 0.4342208, 0.4500238, 0.7686275, 1, 0, 1,
-0.8134894, 1.305793, -1.397486, 0.7647059, 1, 0, 1,
-0.8134453, -0.1301848, -0.5169075, 0.7568628, 1, 0, 1,
-0.811618, -0.7973412, -3.493637, 0.7529412, 1, 0, 1,
-0.8082421, 0.3385138, -1.140527, 0.7450981, 1, 0, 1,
-0.8027748, 0.9483219, 0.9811184, 0.7411765, 1, 0, 1,
-0.7961689, -0.1390299, -2.859952, 0.7333333, 1, 0, 1,
-0.7943859, -2.221789, -2.753831, 0.7294118, 1, 0, 1,
-0.7907783, -1.162944, -3.224634, 0.7215686, 1, 0, 1,
-0.7860333, -0.04322677, -1.593103, 0.7176471, 1, 0, 1,
-0.7837733, 0.2472622, -3.684946, 0.7098039, 1, 0, 1,
-0.778357, 0.6825625, -1.482333, 0.7058824, 1, 0, 1,
-0.777222, -1.36016, -2.23798, 0.6980392, 1, 0, 1,
-0.7737347, -0.8473238, -4.137642, 0.6901961, 1, 0, 1,
-0.7720226, -0.263318, -1.061665, 0.6862745, 1, 0, 1,
-0.7538659, -2.236125, -2.348991, 0.6784314, 1, 0, 1,
-0.7525667, 1.606963, 0.1984321, 0.6745098, 1, 0, 1,
-0.7460152, -0.2734208, -1.470448, 0.6666667, 1, 0, 1,
-0.7430692, 0.3029517, 1.277199, 0.6627451, 1, 0, 1,
-0.7391282, 0.746236, -0.5179818, 0.654902, 1, 0, 1,
-0.7355812, 0.6862825, -0.06211286, 0.6509804, 1, 0, 1,
-0.7342952, -1.197302, -1.112993, 0.6431373, 1, 0, 1,
-0.7315457, -0.6726613, -1.692063, 0.6392157, 1, 0, 1,
-0.7260586, 2.221479, -0.04215501, 0.6313726, 1, 0, 1,
-0.7254342, -0.05795598, -0.162123, 0.627451, 1, 0, 1,
-0.7228583, 0.8004577, 0.5875121, 0.6196079, 1, 0, 1,
-0.7221991, 1.320108, -1.456249, 0.6156863, 1, 0, 1,
-0.7188846, -0.3303361, -2.244035, 0.6078432, 1, 0, 1,
-0.7144822, 3.309453, -1.603773, 0.6039216, 1, 0, 1,
-0.7134621, -0.130409, -0.8542029, 0.5960785, 1, 0, 1,
-0.7090912, 0.133641, -1.288408, 0.5882353, 1, 0, 1,
-0.7035218, -0.7031601, -1.974405, 0.5843138, 1, 0, 1,
-0.6966469, -0.8398187, -0.8281354, 0.5764706, 1, 0, 1,
-0.6954882, 1.479154, -0.8850753, 0.572549, 1, 0, 1,
-0.6932766, 2.089692, -1.521433, 0.5647059, 1, 0, 1,
-0.689897, 0.2494364, 0.4147229, 0.5607843, 1, 0, 1,
-0.6866387, -1.550066, -2.197253, 0.5529412, 1, 0, 1,
-0.6837221, 0.8340136, -1.829647, 0.5490196, 1, 0, 1,
-0.6825792, -0.8029944, -4.194022, 0.5411765, 1, 0, 1,
-0.6820266, -1.544255, -4.870914, 0.5372549, 1, 0, 1,
-0.6683643, -1.056249, -2.126091, 0.5294118, 1, 0, 1,
-0.6666312, 1.06431, -1.63591, 0.5254902, 1, 0, 1,
-0.6601196, -0.01465756, -2.613925, 0.5176471, 1, 0, 1,
-0.6574078, 0.7152256, 0.3304785, 0.5137255, 1, 0, 1,
-0.6508917, -0.631904, -3.568372, 0.5058824, 1, 0, 1,
-0.6503, 0.3162575, -0.5878502, 0.5019608, 1, 0, 1,
-0.6492463, -0.1481223, -1.588611, 0.4941176, 1, 0, 1,
-0.6464612, -0.3077404, -1.661488, 0.4862745, 1, 0, 1,
-0.645185, -2.279365, -3.005542, 0.4823529, 1, 0, 1,
-0.6443879, -1.454141, -0.646476, 0.4745098, 1, 0, 1,
-0.6384429, 0.8239202, -2.645306, 0.4705882, 1, 0, 1,
-0.6382411, 0.3563568, -1.473747, 0.4627451, 1, 0, 1,
-0.6381149, -0.5166173, -1.159682, 0.4588235, 1, 0, 1,
-0.6357712, -0.1079496, -1.132591, 0.4509804, 1, 0, 1,
-0.6352944, 0.9162553, -2.186865, 0.4470588, 1, 0, 1,
-0.6341026, 1.294243, -1.287373, 0.4392157, 1, 0, 1,
-0.6336949, 0.295291, -2.57989, 0.4352941, 1, 0, 1,
-0.6300781, 0.3455472, -1.988004, 0.427451, 1, 0, 1,
-0.6262656, -0.4875592, -1.511046, 0.4235294, 1, 0, 1,
-0.6210347, 0.4796637, -0.4837851, 0.4156863, 1, 0, 1,
-0.619951, 2.065741, -0.7764152, 0.4117647, 1, 0, 1,
-0.6187506, -1.374807, -3.790466, 0.4039216, 1, 0, 1,
-0.6150732, -0.6729552, -3.18881, 0.3960784, 1, 0, 1,
-0.611219, -0.04564526, -1.451482, 0.3921569, 1, 0, 1,
-0.6060982, -1.507519, -2.18524, 0.3843137, 1, 0, 1,
-0.5981802, 0.2415457, -2.047475, 0.3803922, 1, 0, 1,
-0.5901116, 0.2569913, -0.6385241, 0.372549, 1, 0, 1,
-0.5894228, 0.2904063, -0.3053653, 0.3686275, 1, 0, 1,
-0.5889095, -0.8923482, -2.601616, 0.3607843, 1, 0, 1,
-0.5866103, 0.2962413, -0.646136, 0.3568628, 1, 0, 1,
-0.5861244, 1.313117, -2.613748, 0.3490196, 1, 0, 1,
-0.5847626, 0.3250377, -0.1666674, 0.345098, 1, 0, 1,
-0.5816224, -0.9352085, -2.038183, 0.3372549, 1, 0, 1,
-0.5814595, -0.06972943, -1.989498, 0.3333333, 1, 0, 1,
-0.5811929, 0.941941, -1.532912, 0.3254902, 1, 0, 1,
-0.5795568, 1.093975, 1.296913, 0.3215686, 1, 0, 1,
-0.5688123, -0.3205778, -0.4107, 0.3137255, 1, 0, 1,
-0.5621026, 0.3944415, -2.184657, 0.3098039, 1, 0, 1,
-0.559281, -0.3552173, -2.39013, 0.3019608, 1, 0, 1,
-0.5584493, -0.8131059, -3.05404, 0.2941177, 1, 0, 1,
-0.5563007, 0.01410469, -2.26107, 0.2901961, 1, 0, 1,
-0.5521178, -1.964742, -0.644055, 0.282353, 1, 0, 1,
-0.5428284, -0.5140788, -3.918439, 0.2784314, 1, 0, 1,
-0.5420111, -0.1097513, -0.836685, 0.2705882, 1, 0, 1,
-0.5406058, -0.5054456, -3.991905, 0.2666667, 1, 0, 1,
-0.5379711, -0.07544102, -3.131347, 0.2588235, 1, 0, 1,
-0.5374758, -0.5374395, -2.447303, 0.254902, 1, 0, 1,
-0.5329655, 1.496237, -1.443476, 0.2470588, 1, 0, 1,
-0.5314611, -0.05577201, -1.53599, 0.2431373, 1, 0, 1,
-0.5249771, 0.01442347, -2.718945, 0.2352941, 1, 0, 1,
-0.523816, 0.5974613, -2.004828, 0.2313726, 1, 0, 1,
-0.5220156, 2.444564, 1.404505, 0.2235294, 1, 0, 1,
-0.5111189, 0.9244717, -1.655416, 0.2196078, 1, 0, 1,
-0.5107005, -0.9499279, -3.552006, 0.2117647, 1, 0, 1,
-0.5091271, 1.369334, -0.2917472, 0.2078431, 1, 0, 1,
-0.5074059, 0.837733, -0.4703847, 0.2, 1, 0, 1,
-0.506112, 0.5297586, -0.5513293, 0.1921569, 1, 0, 1,
-0.5040594, -1.903977, -4.405269, 0.1882353, 1, 0, 1,
-0.5035799, -0.4904991, -1.605869, 0.1803922, 1, 0, 1,
-0.5028642, 0.113287, -1.524578, 0.1764706, 1, 0, 1,
-0.5028258, -1.372257, -2.969913, 0.1686275, 1, 0, 1,
-0.501918, 0.4934894, -0.2804696, 0.1647059, 1, 0, 1,
-0.4975272, -1.46357, -3.556984, 0.1568628, 1, 0, 1,
-0.4963111, 1.066302, -1.131564, 0.1529412, 1, 0, 1,
-0.4957123, -0.6329737, -1.318747, 0.145098, 1, 0, 1,
-0.4945089, 2.235017, -1.595838, 0.1411765, 1, 0, 1,
-0.4930601, -0.5238652, -3.37503, 0.1333333, 1, 0, 1,
-0.4925484, -1.429309, -0.5995836, 0.1294118, 1, 0, 1,
-0.4903189, 1.131144, -1.797515, 0.1215686, 1, 0, 1,
-0.4899631, 0.2730134, -0.9529074, 0.1176471, 1, 0, 1,
-0.4893197, 0.3304528, -0.6455446, 0.1098039, 1, 0, 1,
-0.4803764, 2.602335, -1.352056, 0.1058824, 1, 0, 1,
-0.4705997, 0.3077226, -1.839324, 0.09803922, 1, 0, 1,
-0.4680566, 0.8162526, -1.111894, 0.09019608, 1, 0, 1,
-0.466496, -0.2380067, -0.7970391, 0.08627451, 1, 0, 1,
-0.4652848, -1.49753, -2.410029, 0.07843138, 1, 0, 1,
-0.4639008, -0.4622942, -3.323696, 0.07450981, 1, 0, 1,
-0.4609796, -0.9036009, -3.218699, 0.06666667, 1, 0, 1,
-0.4577877, -2.541725, -3.454901, 0.0627451, 1, 0, 1,
-0.4540026, -0.7401276, -3.17836, 0.05490196, 1, 0, 1,
-0.4470656, -1.556281, -3.301677, 0.05098039, 1, 0, 1,
-0.4467493, -0.1861811, -2.407244, 0.04313726, 1, 0, 1,
-0.4420701, 1.341058, 0.338909, 0.03921569, 1, 0, 1,
-0.4416595, 0.1172811, -0.7882936, 0.03137255, 1, 0, 1,
-0.4347823, 0.5038824, -1.298694, 0.02745098, 1, 0, 1,
-0.4341703, -0.5135633, -0.9923575, 0.01960784, 1, 0, 1,
-0.4320891, 1.560711, -0.8507047, 0.01568628, 1, 0, 1,
-0.4305495, 0.5448072, -1.510254, 0.007843138, 1, 0, 1,
-0.430366, -0.5046483, -3.02059, 0.003921569, 1, 0, 1,
-0.4293185, 0.6135366, -2.018382, 0, 1, 0.003921569, 1,
-0.4249233, -1.648401, -2.319053, 0, 1, 0.01176471, 1,
-0.4225346, -0.5647675, -4.050417, 0, 1, 0.01568628, 1,
-0.4220863, 0.8964078, 0.6427748, 0, 1, 0.02352941, 1,
-0.4174603, -0.2778837, -2.898324, 0, 1, 0.02745098, 1,
-0.4168462, -0.08810329, -2.844665, 0, 1, 0.03529412, 1,
-0.4127435, -1.198035, -3.381993, 0, 1, 0.03921569, 1,
-0.4035833, 0.4690876, 1.19433, 0, 1, 0.04705882, 1,
-0.3978376, 0.967519, -1.271568, 0, 1, 0.05098039, 1,
-0.3939337, -1.502159, -3.154979, 0, 1, 0.05882353, 1,
-0.3902442, -0.3893118, 0.3491129, 0, 1, 0.0627451, 1,
-0.3874373, -0.3645616, -2.284076, 0, 1, 0.07058824, 1,
-0.38599, -0.2654402, -2.358902, 0, 1, 0.07450981, 1,
-0.3836605, 0.04496737, -1.834133, 0, 1, 0.08235294, 1,
-0.3834646, -0.7061158, -2.062659, 0, 1, 0.08627451, 1,
-0.3829024, 1.795489, -0.08997918, 0, 1, 0.09411765, 1,
-0.379714, 0.4381478, -1.231698, 0, 1, 0.1019608, 1,
-0.3790973, -0.6872824, -2.779835, 0, 1, 0.1058824, 1,
-0.3706405, -0.2087625, -2.421558, 0, 1, 0.1137255, 1,
-0.3687281, -0.3207443, -3.239052, 0, 1, 0.1176471, 1,
-0.3686074, -0.4812846, -3.012043, 0, 1, 0.1254902, 1,
-0.3685745, -0.643263, -2.659037, 0, 1, 0.1294118, 1,
-0.3684684, 1.298208, -1.38549, 0, 1, 0.1372549, 1,
-0.367554, -0.1931891, -3.223902, 0, 1, 0.1411765, 1,
-0.3667771, -0.07614899, -0.8313658, 0, 1, 0.1490196, 1,
-0.3667186, -0.6668742, -2.601453, 0, 1, 0.1529412, 1,
-0.3658485, 1.719572, 0.233533, 0, 1, 0.1607843, 1,
-0.3643907, 1.742956, -1.034007, 0, 1, 0.1647059, 1,
-0.362554, -1.352083, -1.358913, 0, 1, 0.172549, 1,
-0.3622169, -0.005917989, -0.2401738, 0, 1, 0.1764706, 1,
-0.3595983, -0.4697047, -5.380265, 0, 1, 0.1843137, 1,
-0.3577934, 0.6966411, 0.219498, 0, 1, 0.1882353, 1,
-0.3506634, 0.2999025, -0.9302125, 0, 1, 0.1960784, 1,
-0.349348, -0.561931, -2.59701, 0, 1, 0.2039216, 1,
-0.3381234, 0.7257991, 0.30043, 0, 1, 0.2078431, 1,
-0.3372459, -0.03848036, -1.748459, 0, 1, 0.2156863, 1,
-0.3362501, -0.3961725, -2.855066, 0, 1, 0.2196078, 1,
-0.3357441, 1.352349, 1.01466, 0, 1, 0.227451, 1,
-0.3344028, -1.040008, -2.705494, 0, 1, 0.2313726, 1,
-0.3312797, 0.9093258, -1.156836, 0, 1, 0.2392157, 1,
-0.3294452, 0.7542487, -0.07874344, 0, 1, 0.2431373, 1,
-0.3229707, 0.1341102, -1.778191, 0, 1, 0.2509804, 1,
-0.3217487, 1.342264, -0.3172741, 0, 1, 0.254902, 1,
-0.3144983, -0.4822683, -2.683596, 0, 1, 0.2627451, 1,
-0.313719, 0.9030766, -0.08206218, 0, 1, 0.2666667, 1,
-0.3134302, -0.3640223, -0.5321274, 0, 1, 0.2745098, 1,
-0.3123766, -1.070527, -2.592531, 0, 1, 0.2784314, 1,
-0.3113791, 0.2689956, -0.3204716, 0, 1, 0.2862745, 1,
-0.2960525, -0.2566769, -1.337805, 0, 1, 0.2901961, 1,
-0.2907581, -0.4151017, -1.251038, 0, 1, 0.2980392, 1,
-0.2886606, -1.168396, -1.890473, 0, 1, 0.3058824, 1,
-0.2864487, 1.42319, -0.9275339, 0, 1, 0.3098039, 1,
-0.2831137, -0.5696208, -2.797865, 0, 1, 0.3176471, 1,
-0.2828978, -0.7016495, -2.722615, 0, 1, 0.3215686, 1,
-0.2809118, 2.34366, 1.365602, 0, 1, 0.3294118, 1,
-0.279905, 0.6239524, -2.210128, 0, 1, 0.3333333, 1,
-0.2771514, 0.2185042, -2.003604, 0, 1, 0.3411765, 1,
-0.2765707, -0.2335304, -2.494183, 0, 1, 0.345098, 1,
-0.2705904, -3.684038, -3.238324, 0, 1, 0.3529412, 1,
-0.2662017, 0.4047214, 0.3616646, 0, 1, 0.3568628, 1,
-0.2661392, -0.5881238, -0.9451802, 0, 1, 0.3647059, 1,
-0.2635575, -0.3226584, -3.704499, 0, 1, 0.3686275, 1,
-0.2607165, 0.5378158, -0.02720252, 0, 1, 0.3764706, 1,
-0.2534558, 0.5235301, 0.5571172, 0, 1, 0.3803922, 1,
-0.2509682, -2.585709, -2.56301, 0, 1, 0.3882353, 1,
-0.2469764, 0.01748301, -2.08924, 0, 1, 0.3921569, 1,
-0.2387163, 0.437216, 1.688942, 0, 1, 0.4, 1,
-0.2347119, -1.111058, -2.852879, 0, 1, 0.4078431, 1,
-0.2290366, -0.087237, -1.088934, 0, 1, 0.4117647, 1,
-0.2255857, 1.427923, -0.5636525, 0, 1, 0.4196078, 1,
-0.2184805, -2.575539, -3.501981, 0, 1, 0.4235294, 1,
-0.217445, 0.5214733, -0.6173295, 0, 1, 0.4313726, 1,
-0.2166436, 0.7492485, -0.6504311, 0, 1, 0.4352941, 1,
-0.2148744, -0.7648835, -2.140454, 0, 1, 0.4431373, 1,
-0.2096464, -1.382387, -2.672805, 0, 1, 0.4470588, 1,
-0.2080713, 2.046437, 0.1383772, 0, 1, 0.454902, 1,
-0.2029498, 0.7858072, -0.3298327, 0, 1, 0.4588235, 1,
-0.19906, -0.6223237, -1.830544, 0, 1, 0.4666667, 1,
-0.1949422, 0.401941, 0.2040281, 0, 1, 0.4705882, 1,
-0.191505, -0.8737658, -3.141108, 0, 1, 0.4784314, 1,
-0.1911587, 0.6228626, -0.2032794, 0, 1, 0.4823529, 1,
-0.190088, -0.9086687, -2.025229, 0, 1, 0.4901961, 1,
-0.1877817, 1.105555, 0.09909778, 0, 1, 0.4941176, 1,
-0.1847426, -1.532291, -3.829558, 0, 1, 0.5019608, 1,
-0.1843116, 0.6801117, 0.1393005, 0, 1, 0.509804, 1,
-0.1820613, 1.965536, -0.6995568, 0, 1, 0.5137255, 1,
-0.1728429, 0.8329263, 0.3677621, 0, 1, 0.5215687, 1,
-0.1672622, 0.6222609, -0.06690509, 0, 1, 0.5254902, 1,
-0.1663938, -0.4852505, -2.373951, 0, 1, 0.5333334, 1,
-0.1656722, 1.27636, -0.1536405, 0, 1, 0.5372549, 1,
-0.1626414, -0.2457573, -4.014563, 0, 1, 0.5450981, 1,
-0.1611853, 0.7383851, -1.056583, 0, 1, 0.5490196, 1,
-0.160901, 0.01688197, -3.041763, 0, 1, 0.5568628, 1,
-0.1606721, 0.2001084, 0.7254205, 0, 1, 0.5607843, 1,
-0.1583505, 0.04617269, -2.113636, 0, 1, 0.5686275, 1,
-0.1569331, 0.1079352, -1.544893, 0, 1, 0.572549, 1,
-0.1532461, 0.8197305, 0.5644257, 0, 1, 0.5803922, 1,
-0.1521328, -1.262898, -3.462035, 0, 1, 0.5843138, 1,
-0.1511539, -0.3618095, -3.840245, 0, 1, 0.5921569, 1,
-0.1494099, -0.9961952, -3.508112, 0, 1, 0.5960785, 1,
-0.1469726, -0.1680458, -2.763137, 0, 1, 0.6039216, 1,
-0.1430487, 0.8047379, 0.9214423, 0, 1, 0.6117647, 1,
-0.141687, 0.2760681, -0.01519121, 0, 1, 0.6156863, 1,
-0.1327795, 1.868584, -0.5291541, 0, 1, 0.6235294, 1,
-0.1324868, 0.4042728, -1.447261, 0, 1, 0.627451, 1,
-0.1322234, 0.1354804, -0.5276725, 0, 1, 0.6352941, 1,
-0.132186, -0.728792, -4.844663, 0, 1, 0.6392157, 1,
-0.1321638, 0.3814157, 0.1488392, 0, 1, 0.6470588, 1,
-0.1265267, 1.192393, 0.1099937, 0, 1, 0.6509804, 1,
-0.1228016, 1.112439, -1.487059, 0, 1, 0.6588235, 1,
-0.1227658, 0.6321684, -1.377482, 0, 1, 0.6627451, 1,
-0.1227061, 0.2388585, -0.7710623, 0, 1, 0.6705883, 1,
-0.1222272, 0.4339113, -0.3799741, 0, 1, 0.6745098, 1,
-0.1212552, -0.6569279, -2.038649, 0, 1, 0.682353, 1,
-0.1199707, 0.3701933, -1.684138, 0, 1, 0.6862745, 1,
-0.1175488, 0.7677283, -0.6739289, 0, 1, 0.6941177, 1,
-0.1166785, -1.015938, -2.336509, 0, 1, 0.7019608, 1,
-0.1155929, 0.4967684, -0.05172354, 0, 1, 0.7058824, 1,
-0.1151951, 0.6747056, -1.439382, 0, 1, 0.7137255, 1,
-0.1132996, -1.441221, -5.211497, 0, 1, 0.7176471, 1,
-0.1098628, -1.839182, -2.889059, 0, 1, 0.7254902, 1,
-0.1091347, -0.333271, -2.123775, 0, 1, 0.7294118, 1,
-0.1082144, -2.247665, -4.017735, 0, 1, 0.7372549, 1,
-0.0965062, 0.986129, -0.6959249, 0, 1, 0.7411765, 1,
-0.09349091, -0.6657836, -2.887724, 0, 1, 0.7490196, 1,
-0.09261025, -2.674826, -0.8741946, 0, 1, 0.7529412, 1,
-0.08387703, 0.2182778, -1.88301, 0, 1, 0.7607843, 1,
-0.06933673, 0.1625644, 0.2841881, 0, 1, 0.7647059, 1,
-0.06848869, -0.5293575, -2.047488, 0, 1, 0.772549, 1,
-0.06304117, -0.5437312, -2.725107, 0, 1, 0.7764706, 1,
-0.05905789, 1.162834, -0.6213277, 0, 1, 0.7843137, 1,
-0.05690282, 1.14203, -0.7872323, 0, 1, 0.7882353, 1,
-0.05637213, -1.546874, -2.064083, 0, 1, 0.7960784, 1,
-0.05432224, -1.282307, -2.672989, 0, 1, 0.8039216, 1,
-0.05390932, -0.456077, -2.063546, 0, 1, 0.8078431, 1,
-0.04707522, -0.6374056, -2.217741, 0, 1, 0.8156863, 1,
-0.04440014, 1.773626, -1.085169, 0, 1, 0.8196079, 1,
-0.04387992, 0.2772662, -0.9263155, 0, 1, 0.827451, 1,
-0.04263521, -0.1468619, -2.608862, 0, 1, 0.8313726, 1,
-0.03613091, -0.01047257, 0.4946747, 0, 1, 0.8392157, 1,
-0.03435826, 0.2495008, -1.259446, 0, 1, 0.8431373, 1,
-0.03315182, -0.4294215, -4.544301, 0, 1, 0.8509804, 1,
-0.02950343, -1.170781, -2.872155, 0, 1, 0.854902, 1,
-0.02860404, 0.1838851, 0.5479679, 0, 1, 0.8627451, 1,
-0.02762005, -1.097659, -4.147639, 0, 1, 0.8666667, 1,
-0.02344993, -0.6700463, -3.105262, 0, 1, 0.8745098, 1,
-0.02283533, 0.1827312, 0.2006472, 0, 1, 0.8784314, 1,
-0.02102619, -0.4432636, -3.095268, 0, 1, 0.8862745, 1,
-0.01542835, 1.805205, 0.9570045, 0, 1, 0.8901961, 1,
-0.01470351, 2.09017, 0.1568212, 0, 1, 0.8980392, 1,
-0.01372527, -1.509709, -4.230383, 0, 1, 0.9058824, 1,
-0.002837297, 0.2056547, -0.6618442, 0, 1, 0.9098039, 1,
-0.001745229, 1.010228, 2.153888, 0, 1, 0.9176471, 1,
-0.001155827, 0.3560483, 1.51823, 0, 1, 0.9215686, 1,
-0.0004561873, 1.078869, 0.2136857, 0, 1, 0.9294118, 1,
0.002723664, 0.4471019, 0.8610734, 0, 1, 0.9333333, 1,
0.009816567, 0.3564418, -0.03936782, 0, 1, 0.9411765, 1,
0.01009949, -1.062769, 3.876151, 0, 1, 0.945098, 1,
0.01042516, 1.186194, -1.014606, 0, 1, 0.9529412, 1,
0.01268644, 0.193121, -0.5654951, 0, 1, 0.9568627, 1,
0.02248522, -1.333973, 3.703945, 0, 1, 0.9647059, 1,
0.0226233, -1.658347, 1.849359, 0, 1, 0.9686275, 1,
0.02266553, -0.7232478, 4.926583, 0, 1, 0.9764706, 1,
0.02707131, 0.9700725, -0.2722619, 0, 1, 0.9803922, 1,
0.03214124, 0.03256814, 0.2401472, 0, 1, 0.9882353, 1,
0.03428014, -0.2518221, 3.734625, 0, 1, 0.9921569, 1,
0.03959547, -1.23774, 2.084174, 0, 1, 1, 1,
0.04030597, 1.535635, 1.578819, 0, 0.9921569, 1, 1,
0.04068501, 0.8083353, -0.3488527, 0, 0.9882353, 1, 1,
0.04491413, 0.6357505, -0.1757163, 0, 0.9803922, 1, 1,
0.04869232, -0.9658517, 2.414635, 0, 0.9764706, 1, 1,
0.05192351, -0.5202295, 1.292667, 0, 0.9686275, 1, 1,
0.05774504, -0.7063028, 3.635043, 0, 0.9647059, 1, 1,
0.05867904, -1.559669, 2.435868, 0, 0.9568627, 1, 1,
0.0613344, 0.0954681, -0.08007966, 0, 0.9529412, 1, 1,
0.06225269, 0.6674927, 0.8383242, 0, 0.945098, 1, 1,
0.06428628, 0.03266678, 1.06591, 0, 0.9411765, 1, 1,
0.06522064, -1.111646, 4.806558, 0, 0.9333333, 1, 1,
0.06573825, -0.4791863, 4.987962, 0, 0.9294118, 1, 1,
0.06709656, -0.04277888, 3.459045, 0, 0.9215686, 1, 1,
0.06917309, -0.9822417, 1.285539, 0, 0.9176471, 1, 1,
0.07475019, 2.432569, -0.9999466, 0, 0.9098039, 1, 1,
0.07720811, 1.833622, 1.074693, 0, 0.9058824, 1, 1,
0.07729138, 0.9659707, -0.5377704, 0, 0.8980392, 1, 1,
0.07920331, 0.9250937, 0.5117572, 0, 0.8901961, 1, 1,
0.08147129, -1.366138, 2.319252, 0, 0.8862745, 1, 1,
0.08349582, 0.9619385, -0.8190684, 0, 0.8784314, 1, 1,
0.08853105, 0.0004135326, 0.8856946, 0, 0.8745098, 1, 1,
0.0898281, 1.452736, -1.199189, 0, 0.8666667, 1, 1,
0.09237152, -2.023999, 1.196317, 0, 0.8627451, 1, 1,
0.09319117, 0.5909548, 0.3382838, 0, 0.854902, 1, 1,
0.1031168, 0.6340585, 0.02364445, 0, 0.8509804, 1, 1,
0.1037852, 0.4283016, -0.1295513, 0, 0.8431373, 1, 1,
0.1082623, 0.4055746, 0.09339482, 0, 0.8392157, 1, 1,
0.1105355, 0.2294165, -0.4862838, 0, 0.8313726, 1, 1,
0.1112834, -0.7729679, 1.609686, 0, 0.827451, 1, 1,
0.1158932, 0.6678196, 1.293865, 0, 0.8196079, 1, 1,
0.1176625, -0.6489255, 1.764049, 0, 0.8156863, 1, 1,
0.1210259, 0.7464184, 1.456556, 0, 0.8078431, 1, 1,
0.1226805, 0.2866907, -0.997929, 0, 0.8039216, 1, 1,
0.125826, 0.07008936, 2.266889, 0, 0.7960784, 1, 1,
0.1263182, -0.653395, 1.770766, 0, 0.7882353, 1, 1,
0.1270322, -0.8493369, 3.085233, 0, 0.7843137, 1, 1,
0.1282962, -0.06614155, 2.464871, 0, 0.7764706, 1, 1,
0.1311606, 2.25906, 0.02831074, 0, 0.772549, 1, 1,
0.1363918, 0.5985729, -0.8431831, 0, 0.7647059, 1, 1,
0.1401006, -1.190805, 3.056478, 0, 0.7607843, 1, 1,
0.1415615, -1.071803, 5.530588, 0, 0.7529412, 1, 1,
0.1437887, 0.3272617, 0.7925228, 0, 0.7490196, 1, 1,
0.1438136, -0.3131971, 4.125365, 0, 0.7411765, 1, 1,
0.1480813, -0.167129, 1.558137, 0, 0.7372549, 1, 1,
0.1563807, -0.06863942, 1.962217, 0, 0.7294118, 1, 1,
0.1566945, 1.575066, -1.195821, 0, 0.7254902, 1, 1,
0.1627656, -1.363502, 3.261381, 0, 0.7176471, 1, 1,
0.1641769, -0.1783052, 1.390726, 0, 0.7137255, 1, 1,
0.1690285, 0.7621255, -0.9420597, 0, 0.7058824, 1, 1,
0.1714013, -0.3877034, 1.928062, 0, 0.6980392, 1, 1,
0.1762522, -0.7684947, 2.604105, 0, 0.6941177, 1, 1,
0.1774727, -0.6351776, 2.155313, 0, 0.6862745, 1, 1,
0.1838736, 0.9444135, 0.3243962, 0, 0.682353, 1, 1,
0.1853264, 1.52616, -1.182512, 0, 0.6745098, 1, 1,
0.1853797, 0.4869472, 0.8881487, 0, 0.6705883, 1, 1,
0.1859305, -0.188268, 1.543527, 0, 0.6627451, 1, 1,
0.1887126, 0.2663096, 2.40955, 0, 0.6588235, 1, 1,
0.1930731, 0.1257611, 2.066198, 0, 0.6509804, 1, 1,
0.2011344, -1.436173, 2.878085, 0, 0.6470588, 1, 1,
0.2159855, 2.13443, -0.9671423, 0, 0.6392157, 1, 1,
0.2204093, -1.341414, 2.627123, 0, 0.6352941, 1, 1,
0.2249418, 0.2706535, 0.03445132, 0, 0.627451, 1, 1,
0.2254294, -2.315603, 3.359597, 0, 0.6235294, 1, 1,
0.2261204, 0.222571, -0.6495541, 0, 0.6156863, 1, 1,
0.2262874, -0.4273396, 3.4432, 0, 0.6117647, 1, 1,
0.2278849, 1.614929, -0.04876582, 0, 0.6039216, 1, 1,
0.2287656, -0.03642188, 1.73676, 0, 0.5960785, 1, 1,
0.228791, -0.8091137, 3.780452, 0, 0.5921569, 1, 1,
0.2295106, -0.02584554, 1.056271, 0, 0.5843138, 1, 1,
0.235479, 0.8707439, 0.7823933, 0, 0.5803922, 1, 1,
0.235518, 0.2987955, 1.373357, 0, 0.572549, 1, 1,
0.2359935, -1.603188, 2.372345, 0, 0.5686275, 1, 1,
0.2413535, -0.7345284, 2.276693, 0, 0.5607843, 1, 1,
0.2415427, 1.333489, 2.398124, 0, 0.5568628, 1, 1,
0.2463835, -1.48012, 3.435592, 0, 0.5490196, 1, 1,
0.2472869, 1.200262, 1.253121, 0, 0.5450981, 1, 1,
0.2503988, -0.119601, 2.613161, 0, 0.5372549, 1, 1,
0.2513213, 0.08508967, 1.688889, 0, 0.5333334, 1, 1,
0.2525091, -0.3038219, 1.126411, 0, 0.5254902, 1, 1,
0.2527586, 0.8730676, 0.1278211, 0, 0.5215687, 1, 1,
0.2568647, -0.07250876, -0.2034986, 0, 0.5137255, 1, 1,
0.2586823, -1.606298, 4.351357, 0, 0.509804, 1, 1,
0.2605998, -0.4837112, 3.045042, 0, 0.5019608, 1, 1,
0.2658582, -0.2301166, 2.364518, 0, 0.4941176, 1, 1,
0.2660366, -0.8244374, 2.798372, 0, 0.4901961, 1, 1,
0.2683294, 0.2143876, -0.5310816, 0, 0.4823529, 1, 1,
0.2740123, -0.1541169, -0.5119463, 0, 0.4784314, 1, 1,
0.2782267, -0.871587, 3.961396, 0, 0.4705882, 1, 1,
0.2790992, -1.835868, 2.301965, 0, 0.4666667, 1, 1,
0.2824144, 1.600508, -0.2874137, 0, 0.4588235, 1, 1,
0.2833768, -1.134092, 4.42722, 0, 0.454902, 1, 1,
0.2860818, -1.00076, 4.740433, 0, 0.4470588, 1, 1,
0.2924848, -0.4533266, 2.352879, 0, 0.4431373, 1, 1,
0.2930447, -0.6577812, 4.577574, 0, 0.4352941, 1, 1,
0.2934799, 1.360321, 2.357663, 0, 0.4313726, 1, 1,
0.2935408, 0.1746504, -0.5025867, 0, 0.4235294, 1, 1,
0.2969721, 0.2775388, 3.351732, 0, 0.4196078, 1, 1,
0.2973396, 0.9012555, -0.3494517, 0, 0.4117647, 1, 1,
0.2977269, -0.3429677, 1.627418, 0, 0.4078431, 1, 1,
0.3000736, 0.4715739, 1.251646, 0, 0.4, 1, 1,
0.3110109, 0.2560236, 0.4350474, 0, 0.3921569, 1, 1,
0.3118822, -1.101287, 3.712195, 0, 0.3882353, 1, 1,
0.3131779, 0.6716784, 1.010645, 0, 0.3803922, 1, 1,
0.3180855, -0.1018756, 3.95102, 0, 0.3764706, 1, 1,
0.3203435, 0.4656142, -0.4663212, 0, 0.3686275, 1, 1,
0.3207605, -0.3901834, 3.308621, 0, 0.3647059, 1, 1,
0.3255655, 0.8694459, -0.06333829, 0, 0.3568628, 1, 1,
0.3260804, -1.285375, 4.074203, 0, 0.3529412, 1, 1,
0.3312865, -0.615413, 2.730327, 0, 0.345098, 1, 1,
0.3375741, -0.5517855, 4.069637, 0, 0.3411765, 1, 1,
0.3386181, 0.5020603, -0.4925236, 0, 0.3333333, 1, 1,
0.3401224, -0.325769, 2.121556, 0, 0.3294118, 1, 1,
0.3438699, -2.192137, 0.8311487, 0, 0.3215686, 1, 1,
0.3492293, 0.04884014, 0.5979899, 0, 0.3176471, 1, 1,
0.3532276, 1.623981, -0.4333488, 0, 0.3098039, 1, 1,
0.3548049, -0.02550078, 1.954734, 0, 0.3058824, 1, 1,
0.3617143, 2.696014, 0.9401396, 0, 0.2980392, 1, 1,
0.3621562, -0.0181623, 3.156507, 0, 0.2901961, 1, 1,
0.3656866, -0.4453901, 1.744268, 0, 0.2862745, 1, 1,
0.3663333, -0.4439829, 3.785519, 0, 0.2784314, 1, 1,
0.3750364, 0.5584052, 0.5348965, 0, 0.2745098, 1, 1,
0.3778331, -0.6444119, 0.1881396, 0, 0.2666667, 1, 1,
0.3806887, 1.968754, -2.348907, 0, 0.2627451, 1, 1,
0.3826438, -1.133282, 1.974178, 0, 0.254902, 1, 1,
0.3861822, -0.8442728, 1.538081, 0, 0.2509804, 1, 1,
0.3862908, -0.5095947, 1.353313, 0, 0.2431373, 1, 1,
0.3863313, -0.8622549, 5.312285, 0, 0.2392157, 1, 1,
0.3873553, 0.8156842, 0.9680262, 0, 0.2313726, 1, 1,
0.388273, 0.1462776, -0.3899921, 0, 0.227451, 1, 1,
0.3883147, 0.1500322, 0.6092688, 0, 0.2196078, 1, 1,
0.3889111, 1.391578, 0.676991, 0, 0.2156863, 1, 1,
0.3904875, 2.820304, 0.2066355, 0, 0.2078431, 1, 1,
0.3926739, -0.6294192, 3.744353, 0, 0.2039216, 1, 1,
0.393038, -0.0333577, 2.323486, 0, 0.1960784, 1, 1,
0.398408, 0.2680345, 1.475964, 0, 0.1882353, 1, 1,
0.4007542, 0.6735471, -0.7200005, 0, 0.1843137, 1, 1,
0.4013828, 1.393419, -0.5415016, 0, 0.1764706, 1, 1,
0.4075639, 0.8223005, 0.7014653, 0, 0.172549, 1, 1,
0.4089379, 1.445219, 1.205736, 0, 0.1647059, 1, 1,
0.4118308, -0.8772849, 2.496792, 0, 0.1607843, 1, 1,
0.4119168, 0.03258216, -0.2214713, 0, 0.1529412, 1, 1,
0.4122702, -0.8290207, 3.403798, 0, 0.1490196, 1, 1,
0.4157144, 0.1498853, 2.018051, 0, 0.1411765, 1, 1,
0.4160988, -1.096293, 3.94899, 0, 0.1372549, 1, 1,
0.4183454, -0.7776427, 2.297262, 0, 0.1294118, 1, 1,
0.4223229, 0.5738854, 1.767344, 0, 0.1254902, 1, 1,
0.4224316, -0.3854656, 2.898232, 0, 0.1176471, 1, 1,
0.4225333, 0.4551875, -0.2012833, 0, 0.1137255, 1, 1,
0.4236528, 2.483167, -0.4787157, 0, 0.1058824, 1, 1,
0.4249305, -0.1449935, 2.58128, 0, 0.09803922, 1, 1,
0.4265639, -0.2995902, 1.672293, 0, 0.09411765, 1, 1,
0.4330663, -0.4471595, 2.627147, 0, 0.08627451, 1, 1,
0.4372901, -0.9575658, 3.480242, 0, 0.08235294, 1, 1,
0.4414765, 0.1811255, 2.095371, 0, 0.07450981, 1, 1,
0.4422152, -1.816272, 3.505311, 0, 0.07058824, 1, 1,
0.4442661, 0.2210157, 1.583427, 0, 0.0627451, 1, 1,
0.4471912, -0.5688747, 2.684158, 0, 0.05882353, 1, 1,
0.4539993, -1.666082, 0.3381631, 0, 0.05098039, 1, 1,
0.4569164, -0.03523015, 1.199195, 0, 0.04705882, 1, 1,
0.4576358, -0.463789, 2.626202, 0, 0.03921569, 1, 1,
0.4584346, -0.005897922, 1.745653, 0, 0.03529412, 1, 1,
0.4596448, -2.385028, 4.857593, 0, 0.02745098, 1, 1,
0.4597071, 0.5701618, 0.9430329, 0, 0.02352941, 1, 1,
0.4604745, 0.009770705, 2.50507, 0, 0.01568628, 1, 1,
0.4636702, -0.01845612, 0.4913167, 0, 0.01176471, 1, 1,
0.4668902, 0.1658359, -0.5566365, 0, 0.003921569, 1, 1,
0.4712227, -0.6326748, 2.389678, 0.003921569, 0, 1, 1,
0.4774037, 0.9477324, -0.1965539, 0.007843138, 0, 1, 1,
0.477952, 0.2631314, 1.136945, 0.01568628, 0, 1, 1,
0.4780505, -0.4988643, 1.148128, 0.01960784, 0, 1, 1,
0.4797874, -0.04559721, -0.1550723, 0.02745098, 0, 1, 1,
0.4823397, -0.635492, 1.962452, 0.03137255, 0, 1, 1,
0.4826158, -0.5931269, 2.069668, 0.03921569, 0, 1, 1,
0.4864187, 0.578127, 0.04299378, 0.04313726, 0, 1, 1,
0.4871498, -0.5793293, 3.242441, 0.05098039, 0, 1, 1,
0.4889991, -0.5470076, 4.00544, 0.05490196, 0, 1, 1,
0.4941187, 1.446437, -1.234013, 0.0627451, 0, 1, 1,
0.4946737, -0.5400828, 2.912418, 0.06666667, 0, 1, 1,
0.4947349, 1.026281, 2.414689, 0.07450981, 0, 1, 1,
0.4968625, 0.0499891, 0.2940715, 0.07843138, 0, 1, 1,
0.501006, 2.497939, 1.673131, 0.08627451, 0, 1, 1,
0.5021139, -2.545609, 2.830795, 0.09019608, 0, 1, 1,
0.5056747, -0.4083718, 0.7741467, 0.09803922, 0, 1, 1,
0.5078018, 0.4630398, 0.2446327, 0.1058824, 0, 1, 1,
0.5092865, -0.7465747, 1.791029, 0.1098039, 0, 1, 1,
0.5124141, 2.175516, -0.7225755, 0.1176471, 0, 1, 1,
0.5144926, -0.5488988, 0.8344471, 0.1215686, 0, 1, 1,
0.5172406, -1.219081, 3.214074, 0.1294118, 0, 1, 1,
0.5194473, 0.9124488, 0.8737262, 0.1333333, 0, 1, 1,
0.5201002, -1.085827, 4.882086, 0.1411765, 0, 1, 1,
0.526667, -1.177658, 3.519664, 0.145098, 0, 1, 1,
0.5279683, -1.67231, 3.287022, 0.1529412, 0, 1, 1,
0.5302216, 1.296969, 2.775378, 0.1568628, 0, 1, 1,
0.5332508, 0.6717485, 0.5955676, 0.1647059, 0, 1, 1,
0.5383862, -0.7009133, 1.236487, 0.1686275, 0, 1, 1,
0.5451931, 0.13599, 1.086704, 0.1764706, 0, 1, 1,
0.5482609, 0.1904451, -0.4440219, 0.1803922, 0, 1, 1,
0.5493386, -0.03099206, 0.5866913, 0.1882353, 0, 1, 1,
0.550905, -0.6123883, 1.446741, 0.1921569, 0, 1, 1,
0.5512379, 0.5287269, 1.36487, 0.2, 0, 1, 1,
0.5522488, -1.023495, 2.574341, 0.2078431, 0, 1, 1,
0.554423, -0.648006, 0.7465289, 0.2117647, 0, 1, 1,
0.5562727, -0.05741622, 3.868542, 0.2196078, 0, 1, 1,
0.5564579, 0.2715637, 0.2671518, 0.2235294, 0, 1, 1,
0.5566295, -0.2519967, 0.9291235, 0.2313726, 0, 1, 1,
0.5573416, -0.7180257, 3.28541, 0.2352941, 0, 1, 1,
0.5628881, 0.2737215, 1.798299, 0.2431373, 0, 1, 1,
0.5663074, -0.4937897, 1.576942, 0.2470588, 0, 1, 1,
0.5666737, -0.2685177, 1.597602, 0.254902, 0, 1, 1,
0.5681177, 1.407295, 0.7320604, 0.2588235, 0, 1, 1,
0.5754275, -0.2081547, 0.8246802, 0.2666667, 0, 1, 1,
0.5787274, 1.086083, -0.8193397, 0.2705882, 0, 1, 1,
0.5838185, 0.1490827, 2.254974, 0.2784314, 0, 1, 1,
0.5848731, -0.2300353, 1.046369, 0.282353, 0, 1, 1,
0.5858289, -1.236022, 0.6358358, 0.2901961, 0, 1, 1,
0.5862365, -0.329122, 1.995819, 0.2941177, 0, 1, 1,
0.5904542, -1.418489, 2.895747, 0.3019608, 0, 1, 1,
0.5919424, 1.089908, 2.459327, 0.3098039, 0, 1, 1,
0.5945105, -0.7345558, 2.308253, 0.3137255, 0, 1, 1,
0.594549, -0.6737262, 2.29334, 0.3215686, 0, 1, 1,
0.5946718, -0.7019363, 2.311586, 0.3254902, 0, 1, 1,
0.5950158, -1.502315, 3.167883, 0.3333333, 0, 1, 1,
0.6025742, -0.404474, 1.285911, 0.3372549, 0, 1, 1,
0.6025802, -0.7313538, 2.531123, 0.345098, 0, 1, 1,
0.6068245, 1.892826, 1.382048, 0.3490196, 0, 1, 1,
0.6097495, 1.625217, 3.345261, 0.3568628, 0, 1, 1,
0.6135225, 0.9667895, 1.104682, 0.3607843, 0, 1, 1,
0.6153899, 0.6033567, 0.2865747, 0.3686275, 0, 1, 1,
0.6166437, 0.8888687, 0.8885197, 0.372549, 0, 1, 1,
0.6179686, 0.136127, 0.8697305, 0.3803922, 0, 1, 1,
0.6206974, -0.3442484, 1.748088, 0.3843137, 0, 1, 1,
0.6266962, 0.9968596, 0.1512876, 0.3921569, 0, 1, 1,
0.6300238, 0.3765357, 1.237873, 0.3960784, 0, 1, 1,
0.6306295, -2.021245, 3.112914, 0.4039216, 0, 1, 1,
0.6349723, -0.4821122, 1.813266, 0.4117647, 0, 1, 1,
0.6363597, 0.2193338, 1.915565, 0.4156863, 0, 1, 1,
0.6387397, -1.31565, 3.517572, 0.4235294, 0, 1, 1,
0.6404433, 0.2038406, 2.275944, 0.427451, 0, 1, 1,
0.6491331, -0.1481414, 0.7983058, 0.4352941, 0, 1, 1,
0.6507483, -0.7774793, 1.621722, 0.4392157, 0, 1, 1,
0.6531987, 1.01571, 0.4012174, 0.4470588, 0, 1, 1,
0.6542843, -1.571559, 3.405326, 0.4509804, 0, 1, 1,
0.658226, -0.8977539, 2.101634, 0.4588235, 0, 1, 1,
0.6646189, -0.5452935, 1.34123, 0.4627451, 0, 1, 1,
0.6655396, -0.1924079, 2.514402, 0.4705882, 0, 1, 1,
0.6661552, -0.6379347, 2.682524, 0.4745098, 0, 1, 1,
0.6667183, -1.002327, 3.367614, 0.4823529, 0, 1, 1,
0.6690449, 0.5460522, 1.74318, 0.4862745, 0, 1, 1,
0.6702051, -2.041785, 4.528348, 0.4941176, 0, 1, 1,
0.6743942, 0.3537662, 0.9148297, 0.5019608, 0, 1, 1,
0.6754773, 0.893306, -0.7192298, 0.5058824, 0, 1, 1,
0.6768577, 1.376157, 1.730762, 0.5137255, 0, 1, 1,
0.6769285, -1.575455, 1.695195, 0.5176471, 0, 1, 1,
0.6793839, -0.0513819, 2.746392, 0.5254902, 0, 1, 1,
0.6800479, -1.625558, 1.684592, 0.5294118, 0, 1, 1,
0.6823828, 0.9730136, -0.654452, 0.5372549, 0, 1, 1,
0.6862913, -0.5359551, 2.41806, 0.5411765, 0, 1, 1,
0.6899522, -0.8773945, 2.711913, 0.5490196, 0, 1, 1,
0.692319, 0.1133551, 2.533412, 0.5529412, 0, 1, 1,
0.6938028, -0.1295059, 2.709467, 0.5607843, 0, 1, 1,
0.6969321, -0.8456891, 2.387728, 0.5647059, 0, 1, 1,
0.6997792, -0.3524568, 1.530826, 0.572549, 0, 1, 1,
0.7054522, -0.2766142, 1.655974, 0.5764706, 0, 1, 1,
0.7100234, -0.2590792, 2.991706, 0.5843138, 0, 1, 1,
0.7116288, -2.187521, 3.494263, 0.5882353, 0, 1, 1,
0.7147635, 2.636041, 0.9581569, 0.5960785, 0, 1, 1,
0.7156156, 0.6505741, 0.2940972, 0.6039216, 0, 1, 1,
0.7197142, -0.08998641, 1.867277, 0.6078432, 0, 1, 1,
0.72062, 0.48615, 0.581899, 0.6156863, 0, 1, 1,
0.7238731, 0.7986486, 1.420982, 0.6196079, 0, 1, 1,
0.7246226, -0.2644206, 2.084186, 0.627451, 0, 1, 1,
0.7252563, 0.8515537, 0.1560232, 0.6313726, 0, 1, 1,
0.7319427, 0.3510855, 1.607901, 0.6392157, 0, 1, 1,
0.7333138, -1.435284, 4.267859, 0.6431373, 0, 1, 1,
0.7341229, 0.9951383, 0.8300188, 0.6509804, 0, 1, 1,
0.7356139, 0.3653645, 2.142449, 0.654902, 0, 1, 1,
0.7414493, 0.2240819, 1.726212, 0.6627451, 0, 1, 1,
0.7430935, -0.3736174, 0.7392896, 0.6666667, 0, 1, 1,
0.7490544, -0.8319645, 0.1678453, 0.6745098, 0, 1, 1,
0.7491673, -0.2585796, 1.777929, 0.6784314, 0, 1, 1,
0.7497674, 0.3041404, 1.141067, 0.6862745, 0, 1, 1,
0.7525482, -0.03312621, 2.031791, 0.6901961, 0, 1, 1,
0.756541, 0.8260446, 1.358232, 0.6980392, 0, 1, 1,
0.7594614, -0.7366186, 2.584011, 0.7058824, 0, 1, 1,
0.7677947, 1.573264, 1.704639, 0.7098039, 0, 1, 1,
0.769743, -0.2376428, 3.735064, 0.7176471, 0, 1, 1,
0.7735115, 0.6354905, 1.76023, 0.7215686, 0, 1, 1,
0.7751474, 0.07528371, 2.562747, 0.7294118, 0, 1, 1,
0.7755454, 0.4212972, -0.6739172, 0.7333333, 0, 1, 1,
0.7799483, -0.4013133, 2.495235, 0.7411765, 0, 1, 1,
0.7808344, -0.3407855, 2.571543, 0.7450981, 0, 1, 1,
0.7841156, 0.7917064, 1.115119, 0.7529412, 0, 1, 1,
0.7867207, -0.1585108, 1.754838, 0.7568628, 0, 1, 1,
0.7924626, -0.6388547, 2.17231, 0.7647059, 0, 1, 1,
0.792715, 1.169462, -0.9090595, 0.7686275, 0, 1, 1,
0.7946914, -0.4399913, -0.6675315, 0.7764706, 0, 1, 1,
0.7951954, -1.237918, 3.053721, 0.7803922, 0, 1, 1,
0.7963625, -0.7773401, 1.728702, 0.7882353, 0, 1, 1,
0.7967981, 1.258283, -0.5510735, 0.7921569, 0, 1, 1,
0.797997, -0.4567671, 2.175103, 0.8, 0, 1, 1,
0.8005502, 0.2510496, 4.000605, 0.8078431, 0, 1, 1,
0.8043855, -2.284952, 2.801601, 0.8117647, 0, 1, 1,
0.8052257, 0.2164994, 2.965587, 0.8196079, 0, 1, 1,
0.8059651, -0.9457646, 1.425834, 0.8235294, 0, 1, 1,
0.8063511, -0.01502852, 1.659417, 0.8313726, 0, 1, 1,
0.8156914, -0.2866756, 1.942833, 0.8352941, 0, 1, 1,
0.831396, -0.3506187, 2.381228, 0.8431373, 0, 1, 1,
0.8323609, -0.3317191, 1.873824, 0.8470588, 0, 1, 1,
0.8324252, 1.037214, 0.4397609, 0.854902, 0, 1, 1,
0.8434703, 0.8927293, 1.194775, 0.8588235, 0, 1, 1,
0.84862, -0.2132762, 1.229172, 0.8666667, 0, 1, 1,
0.8546496, 0.5190281, 1.487133, 0.8705882, 0, 1, 1,
0.8570656, -0.2410152, 0.8461533, 0.8784314, 0, 1, 1,
0.85766, 0.3404426, 1.47442, 0.8823529, 0, 1, 1,
0.8668881, 2.25572, 0.4801958, 0.8901961, 0, 1, 1,
0.8697727, -1.215825, 3.29128, 0.8941177, 0, 1, 1,
0.8733793, -0.8922918, 0.9045364, 0.9019608, 0, 1, 1,
0.8846239, -2.18035, 1.435362, 0.9098039, 0, 1, 1,
0.8979986, -0.5590695, 2.594643, 0.9137255, 0, 1, 1,
0.9030497, 0.4931251, 0.4979478, 0.9215686, 0, 1, 1,
0.9080167, 0.0693972, 1.2645, 0.9254902, 0, 1, 1,
0.919145, 0.1467714, 2.279148, 0.9333333, 0, 1, 1,
0.9244179, 1.909239, -0.273678, 0.9372549, 0, 1, 1,
0.9278791, 0.4567721, 2.193995, 0.945098, 0, 1, 1,
0.9299155, -0.6856923, 3.007262, 0.9490196, 0, 1, 1,
0.9314617, -0.1728997, 2.606462, 0.9568627, 0, 1, 1,
0.935491, 1.349527, -0.06006633, 0.9607843, 0, 1, 1,
0.9369133, -0.6057742, 2.416086, 0.9686275, 0, 1, 1,
0.9390302, -0.1404439, 1.950469, 0.972549, 0, 1, 1,
0.942139, 0.430125, 1.757619, 0.9803922, 0, 1, 1,
0.9550141, -1.170034, 2.686579, 0.9843137, 0, 1, 1,
0.9610419, -2.394476, 4.429899, 0.9921569, 0, 1, 1,
0.9649107, -0.8426914, 3.609369, 0.9960784, 0, 1, 1,
0.9654008, 0.2977798, 1.401932, 1, 0, 0.9960784, 1,
0.9688063, 0.9196846, 0.630532, 1, 0, 0.9882353, 1,
0.9722385, 1.441343, 1.135955, 1, 0, 0.9843137, 1,
0.9725383, -0.6915694, 3.233717, 1, 0, 0.9764706, 1,
0.9781248, -0.7871258, 1.866974, 1, 0, 0.972549, 1,
0.9783562, -1.654746, 3.441747, 1, 0, 0.9647059, 1,
0.9788631, 0.5123823, 1.600008, 1, 0, 0.9607843, 1,
0.9826661, 1.046526, -0.2764474, 1, 0, 0.9529412, 1,
0.9835817, 1.44615, 1.029349, 1, 0, 0.9490196, 1,
0.9915647, 0.2143936, 0.8716302, 1, 0, 0.9411765, 1,
0.9921035, -0.2182265, 1.48972, 1, 0, 0.9372549, 1,
0.9931116, 2.606814, 1.1107, 1, 0, 0.9294118, 1,
0.9978512, -0.002322583, 0.6525389, 1, 0, 0.9254902, 1,
1.000405, 0.9632774, 0.5644046, 1, 0, 0.9176471, 1,
1.028557, 1.055905, 1.026667, 1, 0, 0.9137255, 1,
1.029369, 0.5483697, 2.979094, 1, 0, 0.9058824, 1,
1.030503, -0.1784805, 3.051152, 1, 0, 0.9019608, 1,
1.03161, 0.8717634, -0.2930126, 1, 0, 0.8941177, 1,
1.033933, 0.5090731, 0.3760741, 1, 0, 0.8862745, 1,
1.040816, -0.1598656, 3.79398, 1, 0, 0.8823529, 1,
1.04177, -1.343544, 2.050489, 1, 0, 0.8745098, 1,
1.042919, -1.43583, 2.122603, 1, 0, 0.8705882, 1,
1.053737, 0.5083225, 2.264623, 1, 0, 0.8627451, 1,
1.057032, -0.1421462, 3.404072, 1, 0, 0.8588235, 1,
1.0605, 0.09346408, 2.35835, 1, 0, 0.8509804, 1,
1.063551, 0.3799435, 1.634323, 1, 0, 0.8470588, 1,
1.063841, -0.1308468, 2.605947, 1, 0, 0.8392157, 1,
1.071898, -2.494416, 2.623298, 1, 0, 0.8352941, 1,
1.079423, 0.150773, 1.604291, 1, 0, 0.827451, 1,
1.080169, -0.7383684, 2.199586, 1, 0, 0.8235294, 1,
1.081223, -0.5622745, 3.162488, 1, 0, 0.8156863, 1,
1.083952, 0.7985772, 0.5441179, 1, 0, 0.8117647, 1,
1.085535, 0.3266786, 0.8054823, 1, 0, 0.8039216, 1,
1.085545, 0.1673846, 2.338966, 1, 0, 0.7960784, 1,
1.086277, -0.7702618, 2.46159, 1, 0, 0.7921569, 1,
1.091036, -0.03616786, 0.5806872, 1, 0, 0.7843137, 1,
1.093459, 0.195024, 1.536248, 1, 0, 0.7803922, 1,
1.110033, -0.2540866, 1.253256, 1, 0, 0.772549, 1,
1.122248, 0.03462395, 2.246595, 1, 0, 0.7686275, 1,
1.128096, 1.683381, 0.1716385, 1, 0, 0.7607843, 1,
1.130314, -0.07296526, 0.3859421, 1, 0, 0.7568628, 1,
1.130429, 0.9020644, 0.09837645, 1, 0, 0.7490196, 1,
1.13063, -0.3241075, 0.9494908, 1, 0, 0.7450981, 1,
1.134429, 0.08491345, 1.10911, 1, 0, 0.7372549, 1,
1.136742, 1.297736, 0.8636366, 1, 0, 0.7333333, 1,
1.139664, 1.091151, 1.532791, 1, 0, 0.7254902, 1,
1.144173, 0.5984243, 0.8614767, 1, 0, 0.7215686, 1,
1.144438, 0.4497815, 0.2661606, 1, 0, 0.7137255, 1,
1.145533, 1.338672, 0.8832682, 1, 0, 0.7098039, 1,
1.145861, 1.113248, 0.3988346, 1, 0, 0.7019608, 1,
1.162702, -0.1228055, 0.6952575, 1, 0, 0.6941177, 1,
1.16419, -1.219063, 2.381576, 1, 0, 0.6901961, 1,
1.165557, 1.549306, 1.135209, 1, 0, 0.682353, 1,
1.173321, 0.08958318, 0.3163415, 1, 0, 0.6784314, 1,
1.18202, 0.05756937, 2.562088, 1, 0, 0.6705883, 1,
1.187406, 1.54642, 1.615877, 1, 0, 0.6666667, 1,
1.198311, -0.1231941, 1.208923, 1, 0, 0.6588235, 1,
1.202934, 0.2661111, 1.603077, 1, 0, 0.654902, 1,
1.204635, 0.3815044, 1.496019, 1, 0, 0.6470588, 1,
1.207387, -0.8604228, 2.164331, 1, 0, 0.6431373, 1,
1.220834, 0.2666621, 0.9045333, 1, 0, 0.6352941, 1,
1.237302, 0.2086201, 2.074704, 1, 0, 0.6313726, 1,
1.247421, 1.415793, -0.02831304, 1, 0, 0.6235294, 1,
1.25074, -0.8356468, 1.839263, 1, 0, 0.6196079, 1,
1.252546, -0.2956896, 1.914299, 1, 0, 0.6117647, 1,
1.265247, -0.07356799, 2.415605, 1, 0, 0.6078432, 1,
1.276314, 0.3442335, 1.51109, 1, 0, 0.6, 1,
1.276358, 1.169446, 0.6244664, 1, 0, 0.5921569, 1,
1.278553, -0.267902, 1.821884, 1, 0, 0.5882353, 1,
1.287183, -0.5787072, 2.429608, 1, 0, 0.5803922, 1,
1.299245, 1.385982, 1.183781, 1, 0, 0.5764706, 1,
1.301511, -0.05147885, 1.153626, 1, 0, 0.5686275, 1,
1.305565, -2.113094, 4.555238, 1, 0, 0.5647059, 1,
1.320585, 1.791949, 1.866377, 1, 0, 0.5568628, 1,
1.327899, 0.06092876, 1.20897, 1, 0, 0.5529412, 1,
1.329475, -0.2558559, 1.772713, 1, 0, 0.5450981, 1,
1.330141, 0.009097956, 1.205021, 1, 0, 0.5411765, 1,
1.33152, -0.2126902, 1.725962, 1, 0, 0.5333334, 1,
1.331621, -0.7255701, 1.239456, 1, 0, 0.5294118, 1,
1.336007, -0.009630085, 0.0498515, 1, 0, 0.5215687, 1,
1.336711, 0.2081061, 2.77295, 1, 0, 0.5176471, 1,
1.347486, 0.7839273, 1.362032, 1, 0, 0.509804, 1,
1.348399, 0.9545329, 0.2405635, 1, 0, 0.5058824, 1,
1.354982, -0.693765, 2.222724, 1, 0, 0.4980392, 1,
1.385719, -0.03744404, 1.091622, 1, 0, 0.4901961, 1,
1.397083, -0.3072732, 0.6525619, 1, 0, 0.4862745, 1,
1.403325, 1.408217, 1.007473, 1, 0, 0.4784314, 1,
1.428757, 0.7183354, 0.4774103, 1, 0, 0.4745098, 1,
1.434481, 0.570112, 2.753453, 1, 0, 0.4666667, 1,
1.449957, 0.7140294, 1.367787, 1, 0, 0.4627451, 1,
1.451279, -1.876639, 1.615711, 1, 0, 0.454902, 1,
1.462312, -0.3068027, 1.109523, 1, 0, 0.4509804, 1,
1.462914, -0.1470477, 2.193176, 1, 0, 0.4431373, 1,
1.467131, -0.5756128, 1.37092, 1, 0, 0.4392157, 1,
1.473846, -0.3069332, 2.594853, 1, 0, 0.4313726, 1,
1.474655, -0.2128903, 1.289235, 1, 0, 0.427451, 1,
1.475069, 0.3848027, 0.8749172, 1, 0, 0.4196078, 1,
1.483844, 1.853501, 1.422886, 1, 0, 0.4156863, 1,
1.489674, -0.3746896, 2.001948, 1, 0, 0.4078431, 1,
1.491364, 0.8989698, 3.502189, 1, 0, 0.4039216, 1,
1.495353, -1.316036, 1.429445, 1, 0, 0.3960784, 1,
1.514983, -0.257484, 2.72674, 1, 0, 0.3882353, 1,
1.520963, -0.3842416, 3.154812, 1, 0, 0.3843137, 1,
1.526874, -0.06518812, -0.8064078, 1, 0, 0.3764706, 1,
1.543447, 0.02944112, 1.047691, 1, 0, 0.372549, 1,
1.558896, -0.7224603, 2.599961, 1, 0, 0.3647059, 1,
1.561792, 1.635667, 1.423452, 1, 0, 0.3607843, 1,
1.568729, -1.629339, 1.51466, 1, 0, 0.3529412, 1,
1.578896, -0.6598279, 3.44413, 1, 0, 0.3490196, 1,
1.58585, 0.203542, -0.2519789, 1, 0, 0.3411765, 1,
1.59955, 1.188447, 1.248494, 1, 0, 0.3372549, 1,
1.608063, 1.311924, -0.05193315, 1, 0, 0.3294118, 1,
1.614036, -0.1801316, 0.4451625, 1, 0, 0.3254902, 1,
1.617394, 0.8533198, 0.2408331, 1, 0, 0.3176471, 1,
1.643993, -1.161109, 2.05983, 1, 0, 0.3137255, 1,
1.705564, -0.61576, 1.830407, 1, 0, 0.3058824, 1,
1.736589, 0.8365604, 2.943483, 1, 0, 0.2980392, 1,
1.742746, -0.6051176, 2.704551, 1, 0, 0.2941177, 1,
1.743451, -0.8403348, 1.195638, 1, 0, 0.2862745, 1,
1.758631, 0.3604778, 1.27584, 1, 0, 0.282353, 1,
1.770955, 0.2679247, 2.612727, 1, 0, 0.2745098, 1,
1.795786, 0.04768464, 0.851457, 1, 0, 0.2705882, 1,
1.799776, -1.221107, 3.915261, 1, 0, 0.2627451, 1,
1.833762, -0.4080001, 1.062968, 1, 0, 0.2588235, 1,
1.85007, -1.242994, 1.771001, 1, 0, 0.2509804, 1,
1.853339, 0.726059, 1.560472, 1, 0, 0.2470588, 1,
1.861185, -1.991272, 2.304911, 1, 0, 0.2392157, 1,
1.862776, 1.260499, 0.5359458, 1, 0, 0.2352941, 1,
1.882947, -0.04313241, 1.619108, 1, 0, 0.227451, 1,
1.886864, 2.993954, 0.7043327, 1, 0, 0.2235294, 1,
1.902302, 1.250094, -0.7426453, 1, 0, 0.2156863, 1,
1.940449, 1.359115, -0.07109234, 1, 0, 0.2117647, 1,
1.954451, -2.684132, 1.93078, 1, 0, 0.2039216, 1,
1.960932, 0.0677627, 2.0668, 1, 0, 0.1960784, 1,
1.961788, -1.295179, 3.16956, 1, 0, 0.1921569, 1,
1.977901, -0.405522, 2.720168, 1, 0, 0.1843137, 1,
1.990071, -0.4250197, -0.3445947, 1, 0, 0.1803922, 1,
2.022487, 0.2882298, 2.692873, 1, 0, 0.172549, 1,
2.047558, 1.859709, 1.595504, 1, 0, 0.1686275, 1,
2.05194, 0.3452911, 1.521161, 1, 0, 0.1607843, 1,
2.057142, 0.8258638, 0.8616763, 1, 0, 0.1568628, 1,
2.080686, -0.1472941, 1.67889, 1, 0, 0.1490196, 1,
2.100035, -1.464853, 3.145448, 1, 0, 0.145098, 1,
2.107476, 1.410663, 0.8712367, 1, 0, 0.1372549, 1,
2.114106, -0.9338276, 1.307475, 1, 0, 0.1333333, 1,
2.1184, 0.3528044, 0.4227384, 1, 0, 0.1254902, 1,
2.135036, -0.3059743, 2.878696, 1, 0, 0.1215686, 1,
2.168541, 0.7541243, 1.153633, 1, 0, 0.1137255, 1,
2.189244, 1.785626, 1.326473, 1, 0, 0.1098039, 1,
2.19609, -1.71245, 1.967259, 1, 0, 0.1019608, 1,
2.21288, -0.06789723, 2.09216, 1, 0, 0.09411765, 1,
2.224448, -0.9075708, 0.6320352, 1, 0, 0.09019608, 1,
2.24912, 0.6226735, -0.4558855, 1, 0, 0.08235294, 1,
2.254935, 1.050994, 3.11621, 1, 0, 0.07843138, 1,
2.263978, -0.4870413, 2.478269, 1, 0, 0.07058824, 1,
2.361137, 0.2700326, 2.445163, 1, 0, 0.06666667, 1,
2.404428, 0.4965795, -0.1798427, 1, 0, 0.05882353, 1,
2.406378, 0.3177949, 1.739021, 1, 0, 0.05490196, 1,
2.43202, -1.152697, 2.729067, 1, 0, 0.04705882, 1,
2.480636, 1.932863, 3.10876, 1, 0, 0.04313726, 1,
2.562243, -1.96833, 2.473026, 1, 0, 0.03529412, 1,
2.620842, -0.5381515, 0.9441965, 1, 0, 0.03137255, 1,
2.741547, -0.02934248, 0.8488401, 1, 0, 0.02352941, 1,
2.869087, -0.2870241, 1.932506, 1, 0, 0.01960784, 1,
3.147581, 2.518415, 0.01000553, 1, 0, 0.01176471, 1,
4.026517, -1.903184, 2.945102, 1, 0, 0.007843138, 1
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
0.5653205, -4.869435, -7.229655, 0, -0.5, 0.5, 0.5,
0.5653205, -4.869435, -7.229655, 1, -0.5, 0.5, 0.5,
0.5653205, -4.869435, -7.229655, 1, 1.5, 0.5, 0.5,
0.5653205, -4.869435, -7.229655, 0, 1.5, 0.5, 0.5
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
-4.069222, -0.1872926, -7.229655, 0, -0.5, 0.5, 0.5,
-4.069222, -0.1872926, -7.229655, 1, -0.5, 0.5, 0.5,
-4.069222, -0.1872926, -7.229655, 1, 1.5, 0.5, 0.5,
-4.069222, -0.1872926, -7.229655, 0, 1.5, 0.5, 0.5
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
-4.069222, -4.869435, 0.07516146, 0, -0.5, 0.5, 0.5,
-4.069222, -4.869435, 0.07516146, 1, -0.5, 0.5, 0.5,
-4.069222, -4.869435, 0.07516146, 1, 1.5, 0.5, 0.5,
-4.069222, -4.869435, 0.07516146, 0, 1.5, 0.5, 0.5
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
-2, -3.78894, -5.543928,
4, -3.78894, -5.543928,
-2, -3.78894, -5.543928,
-2, -3.969023, -5.824883,
-1, -3.78894, -5.543928,
-1, -3.969023, -5.824883,
0, -3.78894, -5.543928,
0, -3.969023, -5.824883,
1, -3.78894, -5.543928,
1, -3.969023, -5.824883,
2, -3.78894, -5.543928,
2, -3.969023, -5.824883,
3, -3.78894, -5.543928,
3, -3.969023, -5.824883,
4, -3.78894, -5.543928,
4, -3.969023, -5.824883
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
"3",
"4"
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
-2, -4.329187, -6.386791, 0, -0.5, 0.5, 0.5,
-2, -4.329187, -6.386791, 1, -0.5, 0.5, 0.5,
-2, -4.329187, -6.386791, 1, 1.5, 0.5, 0.5,
-2, -4.329187, -6.386791, 0, 1.5, 0.5, 0.5,
-1, -4.329187, -6.386791, 0, -0.5, 0.5, 0.5,
-1, -4.329187, -6.386791, 1, -0.5, 0.5, 0.5,
-1, -4.329187, -6.386791, 1, 1.5, 0.5, 0.5,
-1, -4.329187, -6.386791, 0, 1.5, 0.5, 0.5,
0, -4.329187, -6.386791, 0, -0.5, 0.5, 0.5,
0, -4.329187, -6.386791, 1, -0.5, 0.5, 0.5,
0, -4.329187, -6.386791, 1, 1.5, 0.5, 0.5,
0, -4.329187, -6.386791, 0, 1.5, 0.5, 0.5,
1, -4.329187, -6.386791, 0, -0.5, 0.5, 0.5,
1, -4.329187, -6.386791, 1, -0.5, 0.5, 0.5,
1, -4.329187, -6.386791, 1, 1.5, 0.5, 0.5,
1, -4.329187, -6.386791, 0, 1.5, 0.5, 0.5,
2, -4.329187, -6.386791, 0, -0.5, 0.5, 0.5,
2, -4.329187, -6.386791, 1, -0.5, 0.5, 0.5,
2, -4.329187, -6.386791, 1, 1.5, 0.5, 0.5,
2, -4.329187, -6.386791, 0, 1.5, 0.5, 0.5,
3, -4.329187, -6.386791, 0, -0.5, 0.5, 0.5,
3, -4.329187, -6.386791, 1, -0.5, 0.5, 0.5,
3, -4.329187, -6.386791, 1, 1.5, 0.5, 0.5,
3, -4.329187, -6.386791, 0, 1.5, 0.5, 0.5,
4, -4.329187, -6.386791, 0, -0.5, 0.5, 0.5,
4, -4.329187, -6.386791, 1, -0.5, 0.5, 0.5,
4, -4.329187, -6.386791, 1, 1.5, 0.5, 0.5,
4, -4.329187, -6.386791, 0, 1.5, 0.5, 0.5
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
-2.999712, -3, -5.543928,
-2.999712, 3, -5.543928,
-2.999712, -3, -5.543928,
-3.177964, -3, -5.824883,
-2.999712, -2, -5.543928,
-3.177964, -2, -5.824883,
-2.999712, -1, -5.543928,
-3.177964, -1, -5.824883,
-2.999712, 0, -5.543928,
-3.177964, 0, -5.824883,
-2.999712, 1, -5.543928,
-3.177964, 1, -5.824883,
-2.999712, 2, -5.543928,
-3.177964, 2, -5.824883,
-2.999712, 3, -5.543928,
-3.177964, 3, -5.824883
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
-3.534467, -3, -6.386791, 0, -0.5, 0.5, 0.5,
-3.534467, -3, -6.386791, 1, -0.5, 0.5, 0.5,
-3.534467, -3, -6.386791, 1, 1.5, 0.5, 0.5,
-3.534467, -3, -6.386791, 0, 1.5, 0.5, 0.5,
-3.534467, -2, -6.386791, 0, -0.5, 0.5, 0.5,
-3.534467, -2, -6.386791, 1, -0.5, 0.5, 0.5,
-3.534467, -2, -6.386791, 1, 1.5, 0.5, 0.5,
-3.534467, -2, -6.386791, 0, 1.5, 0.5, 0.5,
-3.534467, -1, -6.386791, 0, -0.5, 0.5, 0.5,
-3.534467, -1, -6.386791, 1, -0.5, 0.5, 0.5,
-3.534467, -1, -6.386791, 1, 1.5, 0.5, 0.5,
-3.534467, -1, -6.386791, 0, 1.5, 0.5, 0.5,
-3.534467, 0, -6.386791, 0, -0.5, 0.5, 0.5,
-3.534467, 0, -6.386791, 1, -0.5, 0.5, 0.5,
-3.534467, 0, -6.386791, 1, 1.5, 0.5, 0.5,
-3.534467, 0, -6.386791, 0, 1.5, 0.5, 0.5,
-3.534467, 1, -6.386791, 0, -0.5, 0.5, 0.5,
-3.534467, 1, -6.386791, 1, -0.5, 0.5, 0.5,
-3.534467, 1, -6.386791, 1, 1.5, 0.5, 0.5,
-3.534467, 1, -6.386791, 0, 1.5, 0.5, 0.5,
-3.534467, 2, -6.386791, 0, -0.5, 0.5, 0.5,
-3.534467, 2, -6.386791, 1, -0.5, 0.5, 0.5,
-3.534467, 2, -6.386791, 1, 1.5, 0.5, 0.5,
-3.534467, 2, -6.386791, 0, 1.5, 0.5, 0.5,
-3.534467, 3, -6.386791, 0, -0.5, 0.5, 0.5,
-3.534467, 3, -6.386791, 1, -0.5, 0.5, 0.5,
-3.534467, 3, -6.386791, 1, 1.5, 0.5, 0.5,
-3.534467, 3, -6.386791, 0, 1.5, 0.5, 0.5
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
-2.999712, -3.78894, -4,
-2.999712, -3.78894, 4,
-2.999712, -3.78894, -4,
-3.177964, -3.969023, -4,
-2.999712, -3.78894, -2,
-3.177964, -3.969023, -2,
-2.999712, -3.78894, 0,
-3.177964, -3.969023, 0,
-2.999712, -3.78894, 2,
-3.177964, -3.969023, 2,
-2.999712, -3.78894, 4,
-3.177964, -3.969023, 4
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
-3.534467, -4.329187, -4, 0, -0.5, 0.5, 0.5,
-3.534467, -4.329187, -4, 1, -0.5, 0.5, 0.5,
-3.534467, -4.329187, -4, 1, 1.5, 0.5, 0.5,
-3.534467, -4.329187, -4, 0, 1.5, 0.5, 0.5,
-3.534467, -4.329187, -2, 0, -0.5, 0.5, 0.5,
-3.534467, -4.329187, -2, 1, -0.5, 0.5, 0.5,
-3.534467, -4.329187, -2, 1, 1.5, 0.5, 0.5,
-3.534467, -4.329187, -2, 0, 1.5, 0.5, 0.5,
-3.534467, -4.329187, 0, 0, -0.5, 0.5, 0.5,
-3.534467, -4.329187, 0, 1, -0.5, 0.5, 0.5,
-3.534467, -4.329187, 0, 1, 1.5, 0.5, 0.5,
-3.534467, -4.329187, 0, 0, 1.5, 0.5, 0.5,
-3.534467, -4.329187, 2, 0, -0.5, 0.5, 0.5,
-3.534467, -4.329187, 2, 1, -0.5, 0.5, 0.5,
-3.534467, -4.329187, 2, 1, 1.5, 0.5, 0.5,
-3.534467, -4.329187, 2, 0, 1.5, 0.5, 0.5,
-3.534467, -4.329187, 4, 0, -0.5, 0.5, 0.5,
-3.534467, -4.329187, 4, 1, -0.5, 0.5, 0.5,
-3.534467, -4.329187, 4, 1, 1.5, 0.5, 0.5,
-3.534467, -4.329187, 4, 0, 1.5, 0.5, 0.5
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
-2.999712, -3.78894, -5.543928,
-2.999712, 3.414355, -5.543928,
-2.999712, -3.78894, 5.694251,
-2.999712, 3.414355, 5.694251,
-2.999712, -3.78894, -5.543928,
-2.999712, -3.78894, 5.694251,
-2.999712, 3.414355, -5.543928,
-2.999712, 3.414355, 5.694251,
-2.999712, -3.78894, -5.543928,
4.130353, -3.78894, -5.543928,
-2.999712, -3.78894, 5.694251,
4.130353, -3.78894, 5.694251,
-2.999712, 3.414355, -5.543928,
4.130353, 3.414355, -5.543928,
-2.999712, 3.414355, 5.694251,
4.130353, 3.414355, 5.694251,
4.130353, -3.78894, -5.543928,
4.130353, 3.414355, -5.543928,
4.130353, -3.78894, 5.694251,
4.130353, 3.414355, 5.694251,
4.130353, -3.78894, -5.543928,
4.130353, -3.78894, 5.694251,
4.130353, 3.414355, -5.543928,
4.130353, 3.414355, 5.694251
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
var radius = 8.08098;
var distance = 35.95319;
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
mvMatrix.translate( -0.5653205, 0.1872926, -0.07516146 );
mvMatrix.scale( 1.225418, 1.212961, 0.7774671 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.95319);
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
bensulfuron-methyl<-read.table("bensulfuron-methyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bensulfuron-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'bensulfuron' not found
```

```r
y<-bensulfuron-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'bensulfuron' not found
```

```r
z<-bensulfuron-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'bensulfuron' not found
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
-2.895876, 0.8488295, -2.013566, 0, 0, 1, 1, 1,
-2.693575, 0.4687822, -2.262346, 1, 0, 0, 1, 1,
-2.666047, 2.086488, -0.05650027, 1, 0, 0, 1, 1,
-2.630905, -0.6325281, -2.091298, 1, 0, 0, 1, 1,
-2.521348, -0.4017523, -2.038785, 1, 0, 0, 1, 1,
-2.483284, -0.5696443, -1.971684, 1, 0, 0, 1, 1,
-2.48313, 0.03396358, -1.724462, 0, 0, 0, 1, 1,
-2.390253, 0.283953, -2.567153, 0, 0, 0, 1, 1,
-2.332805, 0.5004361, -1.801116, 0, 0, 0, 1, 1,
-2.306189, 1.047769, -2.382419, 0, 0, 0, 1, 1,
-2.304679, 0.546095, -0.9789525, 0, 0, 0, 1, 1,
-2.284422, 2.309044, -1.004691, 0, 0, 0, 1, 1,
-2.265466, 0.9112808, -0.1217934, 0, 0, 0, 1, 1,
-2.258324, -2.230489, -3.563518, 1, 1, 1, 1, 1,
-2.225415, -0.558237, -2.3406, 1, 1, 1, 1, 1,
-2.135212, 0.7125665, -1.685566, 1, 1, 1, 1, 1,
-2.119849, 0.9855376, -2.958826, 1, 1, 1, 1, 1,
-2.108016, 0.2342575, -0.8768103, 1, 1, 1, 1, 1,
-2.071629, 0.6686221, 0.048016, 1, 1, 1, 1, 1,
-2.067235, -2.06399, -1.912131, 1, 1, 1, 1, 1,
-1.977212, -0.04489451, -0.3314528, 1, 1, 1, 1, 1,
-1.944743, -0.6896409, -2.494498, 1, 1, 1, 1, 1,
-1.923452, 1.287749, -3.300161, 1, 1, 1, 1, 1,
-1.920469, -1.104899, -2.952964, 1, 1, 1, 1, 1,
-1.909689, 1.438804, -0.6135441, 1, 1, 1, 1, 1,
-1.899114, -0.5463604, -2.049021, 1, 1, 1, 1, 1,
-1.8547, 0.5905451, -1.682787, 1, 1, 1, 1, 1,
-1.850912, 1.545151, -1.040164, 1, 1, 1, 1, 1,
-1.841951, -0.7547661, -2.10379, 0, 0, 1, 1, 1,
-1.832939, -0.9229531, -2.536575, 1, 0, 0, 1, 1,
-1.796755, -0.3377916, -1.501834, 1, 0, 0, 1, 1,
-1.789067, 0.8806848, -2.415427, 1, 0, 0, 1, 1,
-1.780175, 1.338984, -1.909705, 1, 0, 0, 1, 1,
-1.765871, 1.151866, -2.005613, 1, 0, 0, 1, 1,
-1.762503, -0.2924017, -3.247102, 0, 0, 0, 1, 1,
-1.756013, -0.548262, -2.128703, 0, 0, 0, 1, 1,
-1.748391, -0.1380452, -1.645332, 0, 0, 0, 1, 1,
-1.745168, -0.5130332, -3.131256, 0, 0, 0, 1, 1,
-1.739755, 0.776538, -2.7676, 0, 0, 0, 1, 1,
-1.717905, -0.3639689, -2.653065, 0, 0, 0, 1, 1,
-1.715905, 1.169402, 1.064671, 0, 0, 0, 1, 1,
-1.697228, 0.418302, -1.480539, 1, 1, 1, 1, 1,
-1.688925, -1.974873, -3.704232, 1, 1, 1, 1, 1,
-1.680754, -0.6652393, -3.366166, 1, 1, 1, 1, 1,
-1.673917, 0.08781375, -1.766541, 1, 1, 1, 1, 1,
-1.667067, 0.8885909, -2.074225, 1, 1, 1, 1, 1,
-1.655385, 0.138918, -3.366645, 1, 1, 1, 1, 1,
-1.641025, -0.3472747, -0.9469932, 1, 1, 1, 1, 1,
-1.632301, -0.1102101, -3.654456, 1, 1, 1, 1, 1,
-1.613006, -1.698918, -2.451787, 1, 1, 1, 1, 1,
-1.604277, -0.3351325, 0.2606265, 1, 1, 1, 1, 1,
-1.596661, -1.519706, -1.766552, 1, 1, 1, 1, 1,
-1.582601, 0.7758884, -1.509718, 1, 1, 1, 1, 1,
-1.572858, -0.3490224, -0.2278608, 1, 1, 1, 1, 1,
-1.559042, -0.1861008, -1.288301, 1, 1, 1, 1, 1,
-1.546052, -1.323472, 0.4347396, 1, 1, 1, 1, 1,
-1.540429, -0.4066415, -1.26686, 0, 0, 1, 1, 1,
-1.522503, 0.3927366, 0.700739, 1, 0, 0, 1, 1,
-1.518157, -1.242896, -3.733838, 1, 0, 0, 1, 1,
-1.5021, -0.6005151, -3.702635, 1, 0, 0, 1, 1,
-1.495014, -2.801886, -3.057644, 1, 0, 0, 1, 1,
-1.472998, 0.562349, -1.040399, 1, 0, 0, 1, 1,
-1.47145, -0.6008989, -2.81251, 0, 0, 0, 1, 1,
-1.462647, 0.6629189, -0.7291254, 0, 0, 0, 1, 1,
-1.455293, 0.9688518, -0.7764173, 0, 0, 0, 1, 1,
-1.453929, 1.794636, 1.022967, 0, 0, 0, 1, 1,
-1.436162, -0.9623252, -2.082791, 0, 0, 0, 1, 1,
-1.432979, -2.158249, -2.687325, 0, 0, 0, 1, 1,
-1.431414, 0.9645031, -0.4858714, 0, 0, 0, 1, 1,
-1.428216, 0.4569608, -1.198141, 1, 1, 1, 1, 1,
-1.422605, 1.271056, -1.029593, 1, 1, 1, 1, 1,
-1.414308, -0.7050038, -2.702782, 1, 1, 1, 1, 1,
-1.390171, 1.333033, -0.4587949, 1, 1, 1, 1, 1,
-1.38895, -0.3823439, -1.277509, 1, 1, 1, 1, 1,
-1.388616, -1.121246, -0.4632876, 1, 1, 1, 1, 1,
-1.387227, 0.02451608, 0.1463998, 1, 1, 1, 1, 1,
-1.383794, -1.35812, -3.399435, 1, 1, 1, 1, 1,
-1.381016, 1.026365, -0.9419493, 1, 1, 1, 1, 1,
-1.359518, 0.0810414, -2.332103, 1, 1, 1, 1, 1,
-1.359165, -0.8563753, -1.896048, 1, 1, 1, 1, 1,
-1.343999, 0.2423578, 0.4644156, 1, 1, 1, 1, 1,
-1.34247, -0.06152618, 0.6742737, 1, 1, 1, 1, 1,
-1.334841, 1.882382, -1.285678, 1, 1, 1, 1, 1,
-1.334161, 0.1483207, 0.001848973, 1, 1, 1, 1, 1,
-1.321221, -1.288848, -3.59594, 0, 0, 1, 1, 1,
-1.31328, -0.9294425, -0.9855008, 1, 0, 0, 1, 1,
-1.307425, -0.633155, -3.239358, 1, 0, 0, 1, 1,
-1.307032, -0.4561561, -2.179557, 1, 0, 0, 1, 1,
-1.299627, 0.58493, -3.078477, 1, 0, 0, 1, 1,
-1.295543, -0.2800149, -2.765767, 1, 0, 0, 1, 1,
-1.286914, 0.03160237, -2.389187, 0, 0, 0, 1, 1,
-1.284926, 0.5906212, -2.042173, 0, 0, 0, 1, 1,
-1.279859, 1.063977, -0.23605, 0, 0, 0, 1, 1,
-1.271563, 0.3850037, -1.366707, 0, 0, 0, 1, 1,
-1.270448, -0.8031688, -1.792517, 0, 0, 0, 1, 1,
-1.265812, -0.06261253, -2.565062, 0, 0, 0, 1, 1,
-1.264335, -0.179447, -0.1948456, 0, 0, 0, 1, 1,
-1.262606, -0.1846812, -3.349834, 1, 1, 1, 1, 1,
-1.260016, 0.10989, -0.2771195, 1, 1, 1, 1, 1,
-1.255471, 0.2557329, -0.5919726, 1, 1, 1, 1, 1,
-1.255335, -0.4293129, -3.058436, 1, 1, 1, 1, 1,
-1.252728, -1.489351, -3.543745, 1, 1, 1, 1, 1,
-1.247643, 0.877696, -0.7952793, 1, 1, 1, 1, 1,
-1.245769, -1.758673, -2.647673, 1, 1, 1, 1, 1,
-1.245376, -1.156993, -4.051441, 1, 1, 1, 1, 1,
-1.244256, 0.2646327, -0.8839338, 1, 1, 1, 1, 1,
-1.240713, 0.008111153, -1.478739, 1, 1, 1, 1, 1,
-1.236499, 0.5237985, -1.469694, 1, 1, 1, 1, 1,
-1.235847, -1.23653, -2.212583, 1, 1, 1, 1, 1,
-1.235403, -0.3540601, 0.2638821, 1, 1, 1, 1, 1,
-1.231921, 0.5371245, 1.492848, 1, 1, 1, 1, 1,
-1.220711, -0.4758851, -1.238719, 1, 1, 1, 1, 1,
-1.215797, -0.9467561, -3.741542, 0, 0, 1, 1, 1,
-1.207349, 0.03223768, -2.379798, 1, 0, 0, 1, 1,
-1.204402, -1.052656, -3.666571, 1, 0, 0, 1, 1,
-1.198164, -0.03274465, -1.580085, 1, 0, 0, 1, 1,
-1.196971, -0.7808959, -1.852267, 1, 0, 0, 1, 1,
-1.196216, 2.139614, -0.3379102, 1, 0, 0, 1, 1,
-1.188802, -0.5833352, -1.2423, 0, 0, 0, 1, 1,
-1.186128, 0.7317519, -2.217154, 0, 0, 0, 1, 1,
-1.174159, 0.2574707, -2.596898, 0, 0, 0, 1, 1,
-1.161231, 1.406579, -0.7933019, 0, 0, 0, 1, 1,
-1.160481, -0.1925844, -0.3683889, 0, 0, 0, 1, 1,
-1.15765, -1.210477, -1.634924, 0, 0, 0, 1, 1,
-1.154795, 1.622997, -0.4468221, 0, 0, 0, 1, 1,
-1.154739, 1.375387, -0.3921258, 1, 1, 1, 1, 1,
-1.1427, 0.563491, -1.316665, 1, 1, 1, 1, 1,
-1.13897, 1.124881, -0.5471872, 1, 1, 1, 1, 1,
-1.128341, 0.4050293, -1.025483, 1, 1, 1, 1, 1,
-1.127875, -2.410871, -0.6904055, 1, 1, 1, 1, 1,
-1.123291, -1.304753, -3.752949, 1, 1, 1, 1, 1,
-1.122612, 1.557513, -1.358562, 1, 1, 1, 1, 1,
-1.106592, 2.700379, -1.727836, 1, 1, 1, 1, 1,
-1.101363, 0.2845719, -1.876957, 1, 1, 1, 1, 1,
-1.098455, 1.161889, -1.002151, 1, 1, 1, 1, 1,
-1.09487, -0.8446965, -3.724018, 1, 1, 1, 1, 1,
-1.082768, 0.2061095, -1.523243, 1, 1, 1, 1, 1,
-1.081804, -0.3147971, -3.834277, 1, 1, 1, 1, 1,
-1.080098, -1.190209, -3.33547, 1, 1, 1, 1, 1,
-1.080061, -0.9539605, -3.245124, 1, 1, 1, 1, 1,
-1.07461, -0.2341344, -2.422237, 0, 0, 1, 1, 1,
-1.072954, -0.7821811, -3.145341, 1, 0, 0, 1, 1,
-1.071384, -1.745661, -1.089821, 1, 0, 0, 1, 1,
-1.069132, -0.635159, -2.913278, 1, 0, 0, 1, 1,
-1.050729, -0.6523735, -2.958378, 1, 0, 0, 1, 1,
-1.043482, -1.369429, -1.329642, 1, 0, 0, 1, 1,
-1.039817, 0.287799, -2.085851, 0, 0, 0, 1, 1,
-1.032496, 1.703087, -0.1978858, 0, 0, 0, 1, 1,
-1.028245, -0.6924566, -3.054125, 0, 0, 0, 1, 1,
-1.027956, 0.3376333, -0.2666614, 0, 0, 0, 1, 1,
-1.02677, 1.158569, -0.938314, 0, 0, 0, 1, 1,
-1.018989, -1.539891, -3.264859, 0, 0, 0, 1, 1,
-1.015572, 0.9727023, -1.000016, 0, 0, 0, 1, 1,
-1.013437, -0.6207398, -2.547977, 1, 1, 1, 1, 1,
-1.010075, 1.38035, -0.2481267, 1, 1, 1, 1, 1,
-1.001633, -2.241484, -2.822794, 1, 1, 1, 1, 1,
-1.000504, 1.57588, -0.1041311, 1, 1, 1, 1, 1,
-0.9976575, 2.250788, 0.06611598, 1, 1, 1, 1, 1,
-0.9739481, -1.230949, -1.994039, 1, 1, 1, 1, 1,
-0.9726844, 0.2215956, -1.985012, 1, 1, 1, 1, 1,
-0.9718274, 1.101385, -0.3460617, 1, 1, 1, 1, 1,
-0.964413, 0.1754263, -0.5316942, 1, 1, 1, 1, 1,
-0.9611694, 0.7771521, -0.281348, 1, 1, 1, 1, 1,
-0.9482976, 1.010345, -1.419854, 1, 1, 1, 1, 1,
-0.9466836, 0.9405856, 0.8254405, 1, 1, 1, 1, 1,
-0.9444816, -0.6117402, -0.9133636, 1, 1, 1, 1, 1,
-0.9394733, -1.487616, -1.80316, 1, 1, 1, 1, 1,
-0.9379564, -1.484838, -1.893916, 1, 1, 1, 1, 1,
-0.9377431, 0.8309809, -1.788411, 0, 0, 1, 1, 1,
-0.9318897, -0.6813263, -1.765356, 1, 0, 0, 1, 1,
-0.9251523, -0.1903383, -2.283313, 1, 0, 0, 1, 1,
-0.9240379, 2.749388, -0.6924192, 1, 0, 0, 1, 1,
-0.910724, -0.3074889, -2.26397, 1, 0, 0, 1, 1,
-0.9079093, -0.00932263, -0.9580438, 1, 0, 0, 1, 1,
-0.906382, -2.60644, -3.994567, 0, 0, 0, 1, 1,
-0.9036804, -0.551748, -1.348073, 0, 0, 0, 1, 1,
-0.8971901, 2.803026, 0.02243781, 0, 0, 0, 1, 1,
-0.8783204, -0.4931155, -1.48286, 0, 0, 0, 1, 1,
-0.8763069, 1.19406, -1.114156, 0, 0, 0, 1, 1,
-0.8754582, -0.01362112, -0.3002267, 0, 0, 0, 1, 1,
-0.8743179, -0.184591, 1.014911, 0, 0, 0, 1, 1,
-0.8669694, -1.059155, -1.762715, 1, 1, 1, 1, 1,
-0.8662059, -0.05256558, -4.342068, 1, 1, 1, 1, 1,
-0.8651776, 0.1693302, -3.380129, 1, 1, 1, 1, 1,
-0.8618723, 0.743462, -0.9551812, 1, 1, 1, 1, 1,
-0.8592891, -0.3697694, -1.793899, 1, 1, 1, 1, 1,
-0.8562682, 0.6213863, 0.5062936, 1, 1, 1, 1, 1,
-0.8555538, 0.5812986, -0.4462751, 1, 1, 1, 1, 1,
-0.8498991, -0.007793461, -1.683416, 1, 1, 1, 1, 1,
-0.847676, -0.3575312, -3.291687, 1, 1, 1, 1, 1,
-0.8462361, 0.6910993, -0.5896515, 1, 1, 1, 1, 1,
-0.8461148, 0.9934917, -1.493364, 1, 1, 1, 1, 1,
-0.8458844, 0.02097558, -1.798611, 1, 1, 1, 1, 1,
-0.8421261, -0.07163735, -1.940486, 1, 1, 1, 1, 1,
-0.8417316, -0.3384893, -2.528166, 1, 1, 1, 1, 1,
-0.8417081, -1.439988, -3.429214, 1, 1, 1, 1, 1,
-0.8411586, 0.7926804, -1.262473, 0, 0, 1, 1, 1,
-0.8392587, 0.4994949, -0.8613679, 1, 0, 0, 1, 1,
-0.8371691, 0.2356883, 0.1599329, 1, 0, 0, 1, 1,
-0.8327368, 0.2395271, -0.9576052, 1, 0, 0, 1, 1,
-0.8296053, -0.6623858, -2.402209, 1, 0, 0, 1, 1,
-0.8293887, 0.02774094, -2.153116, 1, 0, 0, 1, 1,
-0.8282405, 1.851699, -0.7533485, 0, 0, 0, 1, 1,
-0.8220164, 1.144259, -0.235006, 0, 0, 0, 1, 1,
-0.8192504, -0.1254076, -1.255599, 0, 0, 0, 1, 1,
-0.818624, 0.4342208, 0.4500238, 0, 0, 0, 1, 1,
-0.8134894, 1.305793, -1.397486, 0, 0, 0, 1, 1,
-0.8134453, -0.1301848, -0.5169075, 0, 0, 0, 1, 1,
-0.811618, -0.7973412, -3.493637, 0, 0, 0, 1, 1,
-0.8082421, 0.3385138, -1.140527, 1, 1, 1, 1, 1,
-0.8027748, 0.9483219, 0.9811184, 1, 1, 1, 1, 1,
-0.7961689, -0.1390299, -2.859952, 1, 1, 1, 1, 1,
-0.7943859, -2.221789, -2.753831, 1, 1, 1, 1, 1,
-0.7907783, -1.162944, -3.224634, 1, 1, 1, 1, 1,
-0.7860333, -0.04322677, -1.593103, 1, 1, 1, 1, 1,
-0.7837733, 0.2472622, -3.684946, 1, 1, 1, 1, 1,
-0.778357, 0.6825625, -1.482333, 1, 1, 1, 1, 1,
-0.777222, -1.36016, -2.23798, 1, 1, 1, 1, 1,
-0.7737347, -0.8473238, -4.137642, 1, 1, 1, 1, 1,
-0.7720226, -0.263318, -1.061665, 1, 1, 1, 1, 1,
-0.7538659, -2.236125, -2.348991, 1, 1, 1, 1, 1,
-0.7525667, 1.606963, 0.1984321, 1, 1, 1, 1, 1,
-0.7460152, -0.2734208, -1.470448, 1, 1, 1, 1, 1,
-0.7430692, 0.3029517, 1.277199, 1, 1, 1, 1, 1,
-0.7391282, 0.746236, -0.5179818, 0, 0, 1, 1, 1,
-0.7355812, 0.6862825, -0.06211286, 1, 0, 0, 1, 1,
-0.7342952, -1.197302, -1.112993, 1, 0, 0, 1, 1,
-0.7315457, -0.6726613, -1.692063, 1, 0, 0, 1, 1,
-0.7260586, 2.221479, -0.04215501, 1, 0, 0, 1, 1,
-0.7254342, -0.05795598, -0.162123, 1, 0, 0, 1, 1,
-0.7228583, 0.8004577, 0.5875121, 0, 0, 0, 1, 1,
-0.7221991, 1.320108, -1.456249, 0, 0, 0, 1, 1,
-0.7188846, -0.3303361, -2.244035, 0, 0, 0, 1, 1,
-0.7144822, 3.309453, -1.603773, 0, 0, 0, 1, 1,
-0.7134621, -0.130409, -0.8542029, 0, 0, 0, 1, 1,
-0.7090912, 0.133641, -1.288408, 0, 0, 0, 1, 1,
-0.7035218, -0.7031601, -1.974405, 0, 0, 0, 1, 1,
-0.6966469, -0.8398187, -0.8281354, 1, 1, 1, 1, 1,
-0.6954882, 1.479154, -0.8850753, 1, 1, 1, 1, 1,
-0.6932766, 2.089692, -1.521433, 1, 1, 1, 1, 1,
-0.689897, 0.2494364, 0.4147229, 1, 1, 1, 1, 1,
-0.6866387, -1.550066, -2.197253, 1, 1, 1, 1, 1,
-0.6837221, 0.8340136, -1.829647, 1, 1, 1, 1, 1,
-0.6825792, -0.8029944, -4.194022, 1, 1, 1, 1, 1,
-0.6820266, -1.544255, -4.870914, 1, 1, 1, 1, 1,
-0.6683643, -1.056249, -2.126091, 1, 1, 1, 1, 1,
-0.6666312, 1.06431, -1.63591, 1, 1, 1, 1, 1,
-0.6601196, -0.01465756, -2.613925, 1, 1, 1, 1, 1,
-0.6574078, 0.7152256, 0.3304785, 1, 1, 1, 1, 1,
-0.6508917, -0.631904, -3.568372, 1, 1, 1, 1, 1,
-0.6503, 0.3162575, -0.5878502, 1, 1, 1, 1, 1,
-0.6492463, -0.1481223, -1.588611, 1, 1, 1, 1, 1,
-0.6464612, -0.3077404, -1.661488, 0, 0, 1, 1, 1,
-0.645185, -2.279365, -3.005542, 1, 0, 0, 1, 1,
-0.6443879, -1.454141, -0.646476, 1, 0, 0, 1, 1,
-0.6384429, 0.8239202, -2.645306, 1, 0, 0, 1, 1,
-0.6382411, 0.3563568, -1.473747, 1, 0, 0, 1, 1,
-0.6381149, -0.5166173, -1.159682, 1, 0, 0, 1, 1,
-0.6357712, -0.1079496, -1.132591, 0, 0, 0, 1, 1,
-0.6352944, 0.9162553, -2.186865, 0, 0, 0, 1, 1,
-0.6341026, 1.294243, -1.287373, 0, 0, 0, 1, 1,
-0.6336949, 0.295291, -2.57989, 0, 0, 0, 1, 1,
-0.6300781, 0.3455472, -1.988004, 0, 0, 0, 1, 1,
-0.6262656, -0.4875592, -1.511046, 0, 0, 0, 1, 1,
-0.6210347, 0.4796637, -0.4837851, 0, 0, 0, 1, 1,
-0.619951, 2.065741, -0.7764152, 1, 1, 1, 1, 1,
-0.6187506, -1.374807, -3.790466, 1, 1, 1, 1, 1,
-0.6150732, -0.6729552, -3.18881, 1, 1, 1, 1, 1,
-0.611219, -0.04564526, -1.451482, 1, 1, 1, 1, 1,
-0.6060982, -1.507519, -2.18524, 1, 1, 1, 1, 1,
-0.5981802, 0.2415457, -2.047475, 1, 1, 1, 1, 1,
-0.5901116, 0.2569913, -0.6385241, 1, 1, 1, 1, 1,
-0.5894228, 0.2904063, -0.3053653, 1, 1, 1, 1, 1,
-0.5889095, -0.8923482, -2.601616, 1, 1, 1, 1, 1,
-0.5866103, 0.2962413, -0.646136, 1, 1, 1, 1, 1,
-0.5861244, 1.313117, -2.613748, 1, 1, 1, 1, 1,
-0.5847626, 0.3250377, -0.1666674, 1, 1, 1, 1, 1,
-0.5816224, -0.9352085, -2.038183, 1, 1, 1, 1, 1,
-0.5814595, -0.06972943, -1.989498, 1, 1, 1, 1, 1,
-0.5811929, 0.941941, -1.532912, 1, 1, 1, 1, 1,
-0.5795568, 1.093975, 1.296913, 0, 0, 1, 1, 1,
-0.5688123, -0.3205778, -0.4107, 1, 0, 0, 1, 1,
-0.5621026, 0.3944415, -2.184657, 1, 0, 0, 1, 1,
-0.559281, -0.3552173, -2.39013, 1, 0, 0, 1, 1,
-0.5584493, -0.8131059, -3.05404, 1, 0, 0, 1, 1,
-0.5563007, 0.01410469, -2.26107, 1, 0, 0, 1, 1,
-0.5521178, -1.964742, -0.644055, 0, 0, 0, 1, 1,
-0.5428284, -0.5140788, -3.918439, 0, 0, 0, 1, 1,
-0.5420111, -0.1097513, -0.836685, 0, 0, 0, 1, 1,
-0.5406058, -0.5054456, -3.991905, 0, 0, 0, 1, 1,
-0.5379711, -0.07544102, -3.131347, 0, 0, 0, 1, 1,
-0.5374758, -0.5374395, -2.447303, 0, 0, 0, 1, 1,
-0.5329655, 1.496237, -1.443476, 0, 0, 0, 1, 1,
-0.5314611, -0.05577201, -1.53599, 1, 1, 1, 1, 1,
-0.5249771, 0.01442347, -2.718945, 1, 1, 1, 1, 1,
-0.523816, 0.5974613, -2.004828, 1, 1, 1, 1, 1,
-0.5220156, 2.444564, 1.404505, 1, 1, 1, 1, 1,
-0.5111189, 0.9244717, -1.655416, 1, 1, 1, 1, 1,
-0.5107005, -0.9499279, -3.552006, 1, 1, 1, 1, 1,
-0.5091271, 1.369334, -0.2917472, 1, 1, 1, 1, 1,
-0.5074059, 0.837733, -0.4703847, 1, 1, 1, 1, 1,
-0.506112, 0.5297586, -0.5513293, 1, 1, 1, 1, 1,
-0.5040594, -1.903977, -4.405269, 1, 1, 1, 1, 1,
-0.5035799, -0.4904991, -1.605869, 1, 1, 1, 1, 1,
-0.5028642, 0.113287, -1.524578, 1, 1, 1, 1, 1,
-0.5028258, -1.372257, -2.969913, 1, 1, 1, 1, 1,
-0.501918, 0.4934894, -0.2804696, 1, 1, 1, 1, 1,
-0.4975272, -1.46357, -3.556984, 1, 1, 1, 1, 1,
-0.4963111, 1.066302, -1.131564, 0, 0, 1, 1, 1,
-0.4957123, -0.6329737, -1.318747, 1, 0, 0, 1, 1,
-0.4945089, 2.235017, -1.595838, 1, 0, 0, 1, 1,
-0.4930601, -0.5238652, -3.37503, 1, 0, 0, 1, 1,
-0.4925484, -1.429309, -0.5995836, 1, 0, 0, 1, 1,
-0.4903189, 1.131144, -1.797515, 1, 0, 0, 1, 1,
-0.4899631, 0.2730134, -0.9529074, 0, 0, 0, 1, 1,
-0.4893197, 0.3304528, -0.6455446, 0, 0, 0, 1, 1,
-0.4803764, 2.602335, -1.352056, 0, 0, 0, 1, 1,
-0.4705997, 0.3077226, -1.839324, 0, 0, 0, 1, 1,
-0.4680566, 0.8162526, -1.111894, 0, 0, 0, 1, 1,
-0.466496, -0.2380067, -0.7970391, 0, 0, 0, 1, 1,
-0.4652848, -1.49753, -2.410029, 0, 0, 0, 1, 1,
-0.4639008, -0.4622942, -3.323696, 1, 1, 1, 1, 1,
-0.4609796, -0.9036009, -3.218699, 1, 1, 1, 1, 1,
-0.4577877, -2.541725, -3.454901, 1, 1, 1, 1, 1,
-0.4540026, -0.7401276, -3.17836, 1, 1, 1, 1, 1,
-0.4470656, -1.556281, -3.301677, 1, 1, 1, 1, 1,
-0.4467493, -0.1861811, -2.407244, 1, 1, 1, 1, 1,
-0.4420701, 1.341058, 0.338909, 1, 1, 1, 1, 1,
-0.4416595, 0.1172811, -0.7882936, 1, 1, 1, 1, 1,
-0.4347823, 0.5038824, -1.298694, 1, 1, 1, 1, 1,
-0.4341703, -0.5135633, -0.9923575, 1, 1, 1, 1, 1,
-0.4320891, 1.560711, -0.8507047, 1, 1, 1, 1, 1,
-0.4305495, 0.5448072, -1.510254, 1, 1, 1, 1, 1,
-0.430366, -0.5046483, -3.02059, 1, 1, 1, 1, 1,
-0.4293185, 0.6135366, -2.018382, 1, 1, 1, 1, 1,
-0.4249233, -1.648401, -2.319053, 1, 1, 1, 1, 1,
-0.4225346, -0.5647675, -4.050417, 0, 0, 1, 1, 1,
-0.4220863, 0.8964078, 0.6427748, 1, 0, 0, 1, 1,
-0.4174603, -0.2778837, -2.898324, 1, 0, 0, 1, 1,
-0.4168462, -0.08810329, -2.844665, 1, 0, 0, 1, 1,
-0.4127435, -1.198035, -3.381993, 1, 0, 0, 1, 1,
-0.4035833, 0.4690876, 1.19433, 1, 0, 0, 1, 1,
-0.3978376, 0.967519, -1.271568, 0, 0, 0, 1, 1,
-0.3939337, -1.502159, -3.154979, 0, 0, 0, 1, 1,
-0.3902442, -0.3893118, 0.3491129, 0, 0, 0, 1, 1,
-0.3874373, -0.3645616, -2.284076, 0, 0, 0, 1, 1,
-0.38599, -0.2654402, -2.358902, 0, 0, 0, 1, 1,
-0.3836605, 0.04496737, -1.834133, 0, 0, 0, 1, 1,
-0.3834646, -0.7061158, -2.062659, 0, 0, 0, 1, 1,
-0.3829024, 1.795489, -0.08997918, 1, 1, 1, 1, 1,
-0.379714, 0.4381478, -1.231698, 1, 1, 1, 1, 1,
-0.3790973, -0.6872824, -2.779835, 1, 1, 1, 1, 1,
-0.3706405, -0.2087625, -2.421558, 1, 1, 1, 1, 1,
-0.3687281, -0.3207443, -3.239052, 1, 1, 1, 1, 1,
-0.3686074, -0.4812846, -3.012043, 1, 1, 1, 1, 1,
-0.3685745, -0.643263, -2.659037, 1, 1, 1, 1, 1,
-0.3684684, 1.298208, -1.38549, 1, 1, 1, 1, 1,
-0.367554, -0.1931891, -3.223902, 1, 1, 1, 1, 1,
-0.3667771, -0.07614899, -0.8313658, 1, 1, 1, 1, 1,
-0.3667186, -0.6668742, -2.601453, 1, 1, 1, 1, 1,
-0.3658485, 1.719572, 0.233533, 1, 1, 1, 1, 1,
-0.3643907, 1.742956, -1.034007, 1, 1, 1, 1, 1,
-0.362554, -1.352083, -1.358913, 1, 1, 1, 1, 1,
-0.3622169, -0.005917989, -0.2401738, 1, 1, 1, 1, 1,
-0.3595983, -0.4697047, -5.380265, 0, 0, 1, 1, 1,
-0.3577934, 0.6966411, 0.219498, 1, 0, 0, 1, 1,
-0.3506634, 0.2999025, -0.9302125, 1, 0, 0, 1, 1,
-0.349348, -0.561931, -2.59701, 1, 0, 0, 1, 1,
-0.3381234, 0.7257991, 0.30043, 1, 0, 0, 1, 1,
-0.3372459, -0.03848036, -1.748459, 1, 0, 0, 1, 1,
-0.3362501, -0.3961725, -2.855066, 0, 0, 0, 1, 1,
-0.3357441, 1.352349, 1.01466, 0, 0, 0, 1, 1,
-0.3344028, -1.040008, -2.705494, 0, 0, 0, 1, 1,
-0.3312797, 0.9093258, -1.156836, 0, 0, 0, 1, 1,
-0.3294452, 0.7542487, -0.07874344, 0, 0, 0, 1, 1,
-0.3229707, 0.1341102, -1.778191, 0, 0, 0, 1, 1,
-0.3217487, 1.342264, -0.3172741, 0, 0, 0, 1, 1,
-0.3144983, -0.4822683, -2.683596, 1, 1, 1, 1, 1,
-0.313719, 0.9030766, -0.08206218, 1, 1, 1, 1, 1,
-0.3134302, -0.3640223, -0.5321274, 1, 1, 1, 1, 1,
-0.3123766, -1.070527, -2.592531, 1, 1, 1, 1, 1,
-0.3113791, 0.2689956, -0.3204716, 1, 1, 1, 1, 1,
-0.2960525, -0.2566769, -1.337805, 1, 1, 1, 1, 1,
-0.2907581, -0.4151017, -1.251038, 1, 1, 1, 1, 1,
-0.2886606, -1.168396, -1.890473, 1, 1, 1, 1, 1,
-0.2864487, 1.42319, -0.9275339, 1, 1, 1, 1, 1,
-0.2831137, -0.5696208, -2.797865, 1, 1, 1, 1, 1,
-0.2828978, -0.7016495, -2.722615, 1, 1, 1, 1, 1,
-0.2809118, 2.34366, 1.365602, 1, 1, 1, 1, 1,
-0.279905, 0.6239524, -2.210128, 1, 1, 1, 1, 1,
-0.2771514, 0.2185042, -2.003604, 1, 1, 1, 1, 1,
-0.2765707, -0.2335304, -2.494183, 1, 1, 1, 1, 1,
-0.2705904, -3.684038, -3.238324, 0, 0, 1, 1, 1,
-0.2662017, 0.4047214, 0.3616646, 1, 0, 0, 1, 1,
-0.2661392, -0.5881238, -0.9451802, 1, 0, 0, 1, 1,
-0.2635575, -0.3226584, -3.704499, 1, 0, 0, 1, 1,
-0.2607165, 0.5378158, -0.02720252, 1, 0, 0, 1, 1,
-0.2534558, 0.5235301, 0.5571172, 1, 0, 0, 1, 1,
-0.2509682, -2.585709, -2.56301, 0, 0, 0, 1, 1,
-0.2469764, 0.01748301, -2.08924, 0, 0, 0, 1, 1,
-0.2387163, 0.437216, 1.688942, 0, 0, 0, 1, 1,
-0.2347119, -1.111058, -2.852879, 0, 0, 0, 1, 1,
-0.2290366, -0.087237, -1.088934, 0, 0, 0, 1, 1,
-0.2255857, 1.427923, -0.5636525, 0, 0, 0, 1, 1,
-0.2184805, -2.575539, -3.501981, 0, 0, 0, 1, 1,
-0.217445, 0.5214733, -0.6173295, 1, 1, 1, 1, 1,
-0.2166436, 0.7492485, -0.6504311, 1, 1, 1, 1, 1,
-0.2148744, -0.7648835, -2.140454, 1, 1, 1, 1, 1,
-0.2096464, -1.382387, -2.672805, 1, 1, 1, 1, 1,
-0.2080713, 2.046437, 0.1383772, 1, 1, 1, 1, 1,
-0.2029498, 0.7858072, -0.3298327, 1, 1, 1, 1, 1,
-0.19906, -0.6223237, -1.830544, 1, 1, 1, 1, 1,
-0.1949422, 0.401941, 0.2040281, 1, 1, 1, 1, 1,
-0.191505, -0.8737658, -3.141108, 1, 1, 1, 1, 1,
-0.1911587, 0.6228626, -0.2032794, 1, 1, 1, 1, 1,
-0.190088, -0.9086687, -2.025229, 1, 1, 1, 1, 1,
-0.1877817, 1.105555, 0.09909778, 1, 1, 1, 1, 1,
-0.1847426, -1.532291, -3.829558, 1, 1, 1, 1, 1,
-0.1843116, 0.6801117, 0.1393005, 1, 1, 1, 1, 1,
-0.1820613, 1.965536, -0.6995568, 1, 1, 1, 1, 1,
-0.1728429, 0.8329263, 0.3677621, 0, 0, 1, 1, 1,
-0.1672622, 0.6222609, -0.06690509, 1, 0, 0, 1, 1,
-0.1663938, -0.4852505, -2.373951, 1, 0, 0, 1, 1,
-0.1656722, 1.27636, -0.1536405, 1, 0, 0, 1, 1,
-0.1626414, -0.2457573, -4.014563, 1, 0, 0, 1, 1,
-0.1611853, 0.7383851, -1.056583, 1, 0, 0, 1, 1,
-0.160901, 0.01688197, -3.041763, 0, 0, 0, 1, 1,
-0.1606721, 0.2001084, 0.7254205, 0, 0, 0, 1, 1,
-0.1583505, 0.04617269, -2.113636, 0, 0, 0, 1, 1,
-0.1569331, 0.1079352, -1.544893, 0, 0, 0, 1, 1,
-0.1532461, 0.8197305, 0.5644257, 0, 0, 0, 1, 1,
-0.1521328, -1.262898, -3.462035, 0, 0, 0, 1, 1,
-0.1511539, -0.3618095, -3.840245, 0, 0, 0, 1, 1,
-0.1494099, -0.9961952, -3.508112, 1, 1, 1, 1, 1,
-0.1469726, -0.1680458, -2.763137, 1, 1, 1, 1, 1,
-0.1430487, 0.8047379, 0.9214423, 1, 1, 1, 1, 1,
-0.141687, 0.2760681, -0.01519121, 1, 1, 1, 1, 1,
-0.1327795, 1.868584, -0.5291541, 1, 1, 1, 1, 1,
-0.1324868, 0.4042728, -1.447261, 1, 1, 1, 1, 1,
-0.1322234, 0.1354804, -0.5276725, 1, 1, 1, 1, 1,
-0.132186, -0.728792, -4.844663, 1, 1, 1, 1, 1,
-0.1321638, 0.3814157, 0.1488392, 1, 1, 1, 1, 1,
-0.1265267, 1.192393, 0.1099937, 1, 1, 1, 1, 1,
-0.1228016, 1.112439, -1.487059, 1, 1, 1, 1, 1,
-0.1227658, 0.6321684, -1.377482, 1, 1, 1, 1, 1,
-0.1227061, 0.2388585, -0.7710623, 1, 1, 1, 1, 1,
-0.1222272, 0.4339113, -0.3799741, 1, 1, 1, 1, 1,
-0.1212552, -0.6569279, -2.038649, 1, 1, 1, 1, 1,
-0.1199707, 0.3701933, -1.684138, 0, 0, 1, 1, 1,
-0.1175488, 0.7677283, -0.6739289, 1, 0, 0, 1, 1,
-0.1166785, -1.015938, -2.336509, 1, 0, 0, 1, 1,
-0.1155929, 0.4967684, -0.05172354, 1, 0, 0, 1, 1,
-0.1151951, 0.6747056, -1.439382, 1, 0, 0, 1, 1,
-0.1132996, -1.441221, -5.211497, 1, 0, 0, 1, 1,
-0.1098628, -1.839182, -2.889059, 0, 0, 0, 1, 1,
-0.1091347, -0.333271, -2.123775, 0, 0, 0, 1, 1,
-0.1082144, -2.247665, -4.017735, 0, 0, 0, 1, 1,
-0.0965062, 0.986129, -0.6959249, 0, 0, 0, 1, 1,
-0.09349091, -0.6657836, -2.887724, 0, 0, 0, 1, 1,
-0.09261025, -2.674826, -0.8741946, 0, 0, 0, 1, 1,
-0.08387703, 0.2182778, -1.88301, 0, 0, 0, 1, 1,
-0.06933673, 0.1625644, 0.2841881, 1, 1, 1, 1, 1,
-0.06848869, -0.5293575, -2.047488, 1, 1, 1, 1, 1,
-0.06304117, -0.5437312, -2.725107, 1, 1, 1, 1, 1,
-0.05905789, 1.162834, -0.6213277, 1, 1, 1, 1, 1,
-0.05690282, 1.14203, -0.7872323, 1, 1, 1, 1, 1,
-0.05637213, -1.546874, -2.064083, 1, 1, 1, 1, 1,
-0.05432224, -1.282307, -2.672989, 1, 1, 1, 1, 1,
-0.05390932, -0.456077, -2.063546, 1, 1, 1, 1, 1,
-0.04707522, -0.6374056, -2.217741, 1, 1, 1, 1, 1,
-0.04440014, 1.773626, -1.085169, 1, 1, 1, 1, 1,
-0.04387992, 0.2772662, -0.9263155, 1, 1, 1, 1, 1,
-0.04263521, -0.1468619, -2.608862, 1, 1, 1, 1, 1,
-0.03613091, -0.01047257, 0.4946747, 1, 1, 1, 1, 1,
-0.03435826, 0.2495008, -1.259446, 1, 1, 1, 1, 1,
-0.03315182, -0.4294215, -4.544301, 1, 1, 1, 1, 1,
-0.02950343, -1.170781, -2.872155, 0, 0, 1, 1, 1,
-0.02860404, 0.1838851, 0.5479679, 1, 0, 0, 1, 1,
-0.02762005, -1.097659, -4.147639, 1, 0, 0, 1, 1,
-0.02344993, -0.6700463, -3.105262, 1, 0, 0, 1, 1,
-0.02283533, 0.1827312, 0.2006472, 1, 0, 0, 1, 1,
-0.02102619, -0.4432636, -3.095268, 1, 0, 0, 1, 1,
-0.01542835, 1.805205, 0.9570045, 0, 0, 0, 1, 1,
-0.01470351, 2.09017, 0.1568212, 0, 0, 0, 1, 1,
-0.01372527, -1.509709, -4.230383, 0, 0, 0, 1, 1,
-0.002837297, 0.2056547, -0.6618442, 0, 0, 0, 1, 1,
-0.001745229, 1.010228, 2.153888, 0, 0, 0, 1, 1,
-0.001155827, 0.3560483, 1.51823, 0, 0, 0, 1, 1,
-0.0004561873, 1.078869, 0.2136857, 0, 0, 0, 1, 1,
0.002723664, 0.4471019, 0.8610734, 1, 1, 1, 1, 1,
0.009816567, 0.3564418, -0.03936782, 1, 1, 1, 1, 1,
0.01009949, -1.062769, 3.876151, 1, 1, 1, 1, 1,
0.01042516, 1.186194, -1.014606, 1, 1, 1, 1, 1,
0.01268644, 0.193121, -0.5654951, 1, 1, 1, 1, 1,
0.02248522, -1.333973, 3.703945, 1, 1, 1, 1, 1,
0.0226233, -1.658347, 1.849359, 1, 1, 1, 1, 1,
0.02266553, -0.7232478, 4.926583, 1, 1, 1, 1, 1,
0.02707131, 0.9700725, -0.2722619, 1, 1, 1, 1, 1,
0.03214124, 0.03256814, 0.2401472, 1, 1, 1, 1, 1,
0.03428014, -0.2518221, 3.734625, 1, 1, 1, 1, 1,
0.03959547, -1.23774, 2.084174, 1, 1, 1, 1, 1,
0.04030597, 1.535635, 1.578819, 1, 1, 1, 1, 1,
0.04068501, 0.8083353, -0.3488527, 1, 1, 1, 1, 1,
0.04491413, 0.6357505, -0.1757163, 1, 1, 1, 1, 1,
0.04869232, -0.9658517, 2.414635, 0, 0, 1, 1, 1,
0.05192351, -0.5202295, 1.292667, 1, 0, 0, 1, 1,
0.05774504, -0.7063028, 3.635043, 1, 0, 0, 1, 1,
0.05867904, -1.559669, 2.435868, 1, 0, 0, 1, 1,
0.0613344, 0.0954681, -0.08007966, 1, 0, 0, 1, 1,
0.06225269, 0.6674927, 0.8383242, 1, 0, 0, 1, 1,
0.06428628, 0.03266678, 1.06591, 0, 0, 0, 1, 1,
0.06522064, -1.111646, 4.806558, 0, 0, 0, 1, 1,
0.06573825, -0.4791863, 4.987962, 0, 0, 0, 1, 1,
0.06709656, -0.04277888, 3.459045, 0, 0, 0, 1, 1,
0.06917309, -0.9822417, 1.285539, 0, 0, 0, 1, 1,
0.07475019, 2.432569, -0.9999466, 0, 0, 0, 1, 1,
0.07720811, 1.833622, 1.074693, 0, 0, 0, 1, 1,
0.07729138, 0.9659707, -0.5377704, 1, 1, 1, 1, 1,
0.07920331, 0.9250937, 0.5117572, 1, 1, 1, 1, 1,
0.08147129, -1.366138, 2.319252, 1, 1, 1, 1, 1,
0.08349582, 0.9619385, -0.8190684, 1, 1, 1, 1, 1,
0.08853105, 0.0004135326, 0.8856946, 1, 1, 1, 1, 1,
0.0898281, 1.452736, -1.199189, 1, 1, 1, 1, 1,
0.09237152, -2.023999, 1.196317, 1, 1, 1, 1, 1,
0.09319117, 0.5909548, 0.3382838, 1, 1, 1, 1, 1,
0.1031168, 0.6340585, 0.02364445, 1, 1, 1, 1, 1,
0.1037852, 0.4283016, -0.1295513, 1, 1, 1, 1, 1,
0.1082623, 0.4055746, 0.09339482, 1, 1, 1, 1, 1,
0.1105355, 0.2294165, -0.4862838, 1, 1, 1, 1, 1,
0.1112834, -0.7729679, 1.609686, 1, 1, 1, 1, 1,
0.1158932, 0.6678196, 1.293865, 1, 1, 1, 1, 1,
0.1176625, -0.6489255, 1.764049, 1, 1, 1, 1, 1,
0.1210259, 0.7464184, 1.456556, 0, 0, 1, 1, 1,
0.1226805, 0.2866907, -0.997929, 1, 0, 0, 1, 1,
0.125826, 0.07008936, 2.266889, 1, 0, 0, 1, 1,
0.1263182, -0.653395, 1.770766, 1, 0, 0, 1, 1,
0.1270322, -0.8493369, 3.085233, 1, 0, 0, 1, 1,
0.1282962, -0.06614155, 2.464871, 1, 0, 0, 1, 1,
0.1311606, 2.25906, 0.02831074, 0, 0, 0, 1, 1,
0.1363918, 0.5985729, -0.8431831, 0, 0, 0, 1, 1,
0.1401006, -1.190805, 3.056478, 0, 0, 0, 1, 1,
0.1415615, -1.071803, 5.530588, 0, 0, 0, 1, 1,
0.1437887, 0.3272617, 0.7925228, 0, 0, 0, 1, 1,
0.1438136, -0.3131971, 4.125365, 0, 0, 0, 1, 1,
0.1480813, -0.167129, 1.558137, 0, 0, 0, 1, 1,
0.1563807, -0.06863942, 1.962217, 1, 1, 1, 1, 1,
0.1566945, 1.575066, -1.195821, 1, 1, 1, 1, 1,
0.1627656, -1.363502, 3.261381, 1, 1, 1, 1, 1,
0.1641769, -0.1783052, 1.390726, 1, 1, 1, 1, 1,
0.1690285, 0.7621255, -0.9420597, 1, 1, 1, 1, 1,
0.1714013, -0.3877034, 1.928062, 1, 1, 1, 1, 1,
0.1762522, -0.7684947, 2.604105, 1, 1, 1, 1, 1,
0.1774727, -0.6351776, 2.155313, 1, 1, 1, 1, 1,
0.1838736, 0.9444135, 0.3243962, 1, 1, 1, 1, 1,
0.1853264, 1.52616, -1.182512, 1, 1, 1, 1, 1,
0.1853797, 0.4869472, 0.8881487, 1, 1, 1, 1, 1,
0.1859305, -0.188268, 1.543527, 1, 1, 1, 1, 1,
0.1887126, 0.2663096, 2.40955, 1, 1, 1, 1, 1,
0.1930731, 0.1257611, 2.066198, 1, 1, 1, 1, 1,
0.2011344, -1.436173, 2.878085, 1, 1, 1, 1, 1,
0.2159855, 2.13443, -0.9671423, 0, 0, 1, 1, 1,
0.2204093, -1.341414, 2.627123, 1, 0, 0, 1, 1,
0.2249418, 0.2706535, 0.03445132, 1, 0, 0, 1, 1,
0.2254294, -2.315603, 3.359597, 1, 0, 0, 1, 1,
0.2261204, 0.222571, -0.6495541, 1, 0, 0, 1, 1,
0.2262874, -0.4273396, 3.4432, 1, 0, 0, 1, 1,
0.2278849, 1.614929, -0.04876582, 0, 0, 0, 1, 1,
0.2287656, -0.03642188, 1.73676, 0, 0, 0, 1, 1,
0.228791, -0.8091137, 3.780452, 0, 0, 0, 1, 1,
0.2295106, -0.02584554, 1.056271, 0, 0, 0, 1, 1,
0.235479, 0.8707439, 0.7823933, 0, 0, 0, 1, 1,
0.235518, 0.2987955, 1.373357, 0, 0, 0, 1, 1,
0.2359935, -1.603188, 2.372345, 0, 0, 0, 1, 1,
0.2413535, -0.7345284, 2.276693, 1, 1, 1, 1, 1,
0.2415427, 1.333489, 2.398124, 1, 1, 1, 1, 1,
0.2463835, -1.48012, 3.435592, 1, 1, 1, 1, 1,
0.2472869, 1.200262, 1.253121, 1, 1, 1, 1, 1,
0.2503988, -0.119601, 2.613161, 1, 1, 1, 1, 1,
0.2513213, 0.08508967, 1.688889, 1, 1, 1, 1, 1,
0.2525091, -0.3038219, 1.126411, 1, 1, 1, 1, 1,
0.2527586, 0.8730676, 0.1278211, 1, 1, 1, 1, 1,
0.2568647, -0.07250876, -0.2034986, 1, 1, 1, 1, 1,
0.2586823, -1.606298, 4.351357, 1, 1, 1, 1, 1,
0.2605998, -0.4837112, 3.045042, 1, 1, 1, 1, 1,
0.2658582, -0.2301166, 2.364518, 1, 1, 1, 1, 1,
0.2660366, -0.8244374, 2.798372, 1, 1, 1, 1, 1,
0.2683294, 0.2143876, -0.5310816, 1, 1, 1, 1, 1,
0.2740123, -0.1541169, -0.5119463, 1, 1, 1, 1, 1,
0.2782267, -0.871587, 3.961396, 0, 0, 1, 1, 1,
0.2790992, -1.835868, 2.301965, 1, 0, 0, 1, 1,
0.2824144, 1.600508, -0.2874137, 1, 0, 0, 1, 1,
0.2833768, -1.134092, 4.42722, 1, 0, 0, 1, 1,
0.2860818, -1.00076, 4.740433, 1, 0, 0, 1, 1,
0.2924848, -0.4533266, 2.352879, 1, 0, 0, 1, 1,
0.2930447, -0.6577812, 4.577574, 0, 0, 0, 1, 1,
0.2934799, 1.360321, 2.357663, 0, 0, 0, 1, 1,
0.2935408, 0.1746504, -0.5025867, 0, 0, 0, 1, 1,
0.2969721, 0.2775388, 3.351732, 0, 0, 0, 1, 1,
0.2973396, 0.9012555, -0.3494517, 0, 0, 0, 1, 1,
0.2977269, -0.3429677, 1.627418, 0, 0, 0, 1, 1,
0.3000736, 0.4715739, 1.251646, 0, 0, 0, 1, 1,
0.3110109, 0.2560236, 0.4350474, 1, 1, 1, 1, 1,
0.3118822, -1.101287, 3.712195, 1, 1, 1, 1, 1,
0.3131779, 0.6716784, 1.010645, 1, 1, 1, 1, 1,
0.3180855, -0.1018756, 3.95102, 1, 1, 1, 1, 1,
0.3203435, 0.4656142, -0.4663212, 1, 1, 1, 1, 1,
0.3207605, -0.3901834, 3.308621, 1, 1, 1, 1, 1,
0.3255655, 0.8694459, -0.06333829, 1, 1, 1, 1, 1,
0.3260804, -1.285375, 4.074203, 1, 1, 1, 1, 1,
0.3312865, -0.615413, 2.730327, 1, 1, 1, 1, 1,
0.3375741, -0.5517855, 4.069637, 1, 1, 1, 1, 1,
0.3386181, 0.5020603, -0.4925236, 1, 1, 1, 1, 1,
0.3401224, -0.325769, 2.121556, 1, 1, 1, 1, 1,
0.3438699, -2.192137, 0.8311487, 1, 1, 1, 1, 1,
0.3492293, 0.04884014, 0.5979899, 1, 1, 1, 1, 1,
0.3532276, 1.623981, -0.4333488, 1, 1, 1, 1, 1,
0.3548049, -0.02550078, 1.954734, 0, 0, 1, 1, 1,
0.3617143, 2.696014, 0.9401396, 1, 0, 0, 1, 1,
0.3621562, -0.0181623, 3.156507, 1, 0, 0, 1, 1,
0.3656866, -0.4453901, 1.744268, 1, 0, 0, 1, 1,
0.3663333, -0.4439829, 3.785519, 1, 0, 0, 1, 1,
0.3750364, 0.5584052, 0.5348965, 1, 0, 0, 1, 1,
0.3778331, -0.6444119, 0.1881396, 0, 0, 0, 1, 1,
0.3806887, 1.968754, -2.348907, 0, 0, 0, 1, 1,
0.3826438, -1.133282, 1.974178, 0, 0, 0, 1, 1,
0.3861822, -0.8442728, 1.538081, 0, 0, 0, 1, 1,
0.3862908, -0.5095947, 1.353313, 0, 0, 0, 1, 1,
0.3863313, -0.8622549, 5.312285, 0, 0, 0, 1, 1,
0.3873553, 0.8156842, 0.9680262, 0, 0, 0, 1, 1,
0.388273, 0.1462776, -0.3899921, 1, 1, 1, 1, 1,
0.3883147, 0.1500322, 0.6092688, 1, 1, 1, 1, 1,
0.3889111, 1.391578, 0.676991, 1, 1, 1, 1, 1,
0.3904875, 2.820304, 0.2066355, 1, 1, 1, 1, 1,
0.3926739, -0.6294192, 3.744353, 1, 1, 1, 1, 1,
0.393038, -0.0333577, 2.323486, 1, 1, 1, 1, 1,
0.398408, 0.2680345, 1.475964, 1, 1, 1, 1, 1,
0.4007542, 0.6735471, -0.7200005, 1, 1, 1, 1, 1,
0.4013828, 1.393419, -0.5415016, 1, 1, 1, 1, 1,
0.4075639, 0.8223005, 0.7014653, 1, 1, 1, 1, 1,
0.4089379, 1.445219, 1.205736, 1, 1, 1, 1, 1,
0.4118308, -0.8772849, 2.496792, 1, 1, 1, 1, 1,
0.4119168, 0.03258216, -0.2214713, 1, 1, 1, 1, 1,
0.4122702, -0.8290207, 3.403798, 1, 1, 1, 1, 1,
0.4157144, 0.1498853, 2.018051, 1, 1, 1, 1, 1,
0.4160988, -1.096293, 3.94899, 0, 0, 1, 1, 1,
0.4183454, -0.7776427, 2.297262, 1, 0, 0, 1, 1,
0.4223229, 0.5738854, 1.767344, 1, 0, 0, 1, 1,
0.4224316, -0.3854656, 2.898232, 1, 0, 0, 1, 1,
0.4225333, 0.4551875, -0.2012833, 1, 0, 0, 1, 1,
0.4236528, 2.483167, -0.4787157, 1, 0, 0, 1, 1,
0.4249305, -0.1449935, 2.58128, 0, 0, 0, 1, 1,
0.4265639, -0.2995902, 1.672293, 0, 0, 0, 1, 1,
0.4330663, -0.4471595, 2.627147, 0, 0, 0, 1, 1,
0.4372901, -0.9575658, 3.480242, 0, 0, 0, 1, 1,
0.4414765, 0.1811255, 2.095371, 0, 0, 0, 1, 1,
0.4422152, -1.816272, 3.505311, 0, 0, 0, 1, 1,
0.4442661, 0.2210157, 1.583427, 0, 0, 0, 1, 1,
0.4471912, -0.5688747, 2.684158, 1, 1, 1, 1, 1,
0.4539993, -1.666082, 0.3381631, 1, 1, 1, 1, 1,
0.4569164, -0.03523015, 1.199195, 1, 1, 1, 1, 1,
0.4576358, -0.463789, 2.626202, 1, 1, 1, 1, 1,
0.4584346, -0.005897922, 1.745653, 1, 1, 1, 1, 1,
0.4596448, -2.385028, 4.857593, 1, 1, 1, 1, 1,
0.4597071, 0.5701618, 0.9430329, 1, 1, 1, 1, 1,
0.4604745, 0.009770705, 2.50507, 1, 1, 1, 1, 1,
0.4636702, -0.01845612, 0.4913167, 1, 1, 1, 1, 1,
0.4668902, 0.1658359, -0.5566365, 1, 1, 1, 1, 1,
0.4712227, -0.6326748, 2.389678, 1, 1, 1, 1, 1,
0.4774037, 0.9477324, -0.1965539, 1, 1, 1, 1, 1,
0.477952, 0.2631314, 1.136945, 1, 1, 1, 1, 1,
0.4780505, -0.4988643, 1.148128, 1, 1, 1, 1, 1,
0.4797874, -0.04559721, -0.1550723, 1, 1, 1, 1, 1,
0.4823397, -0.635492, 1.962452, 0, 0, 1, 1, 1,
0.4826158, -0.5931269, 2.069668, 1, 0, 0, 1, 1,
0.4864187, 0.578127, 0.04299378, 1, 0, 0, 1, 1,
0.4871498, -0.5793293, 3.242441, 1, 0, 0, 1, 1,
0.4889991, -0.5470076, 4.00544, 1, 0, 0, 1, 1,
0.4941187, 1.446437, -1.234013, 1, 0, 0, 1, 1,
0.4946737, -0.5400828, 2.912418, 0, 0, 0, 1, 1,
0.4947349, 1.026281, 2.414689, 0, 0, 0, 1, 1,
0.4968625, 0.0499891, 0.2940715, 0, 0, 0, 1, 1,
0.501006, 2.497939, 1.673131, 0, 0, 0, 1, 1,
0.5021139, -2.545609, 2.830795, 0, 0, 0, 1, 1,
0.5056747, -0.4083718, 0.7741467, 0, 0, 0, 1, 1,
0.5078018, 0.4630398, 0.2446327, 0, 0, 0, 1, 1,
0.5092865, -0.7465747, 1.791029, 1, 1, 1, 1, 1,
0.5124141, 2.175516, -0.7225755, 1, 1, 1, 1, 1,
0.5144926, -0.5488988, 0.8344471, 1, 1, 1, 1, 1,
0.5172406, -1.219081, 3.214074, 1, 1, 1, 1, 1,
0.5194473, 0.9124488, 0.8737262, 1, 1, 1, 1, 1,
0.5201002, -1.085827, 4.882086, 1, 1, 1, 1, 1,
0.526667, -1.177658, 3.519664, 1, 1, 1, 1, 1,
0.5279683, -1.67231, 3.287022, 1, 1, 1, 1, 1,
0.5302216, 1.296969, 2.775378, 1, 1, 1, 1, 1,
0.5332508, 0.6717485, 0.5955676, 1, 1, 1, 1, 1,
0.5383862, -0.7009133, 1.236487, 1, 1, 1, 1, 1,
0.5451931, 0.13599, 1.086704, 1, 1, 1, 1, 1,
0.5482609, 0.1904451, -0.4440219, 1, 1, 1, 1, 1,
0.5493386, -0.03099206, 0.5866913, 1, 1, 1, 1, 1,
0.550905, -0.6123883, 1.446741, 1, 1, 1, 1, 1,
0.5512379, 0.5287269, 1.36487, 0, 0, 1, 1, 1,
0.5522488, -1.023495, 2.574341, 1, 0, 0, 1, 1,
0.554423, -0.648006, 0.7465289, 1, 0, 0, 1, 1,
0.5562727, -0.05741622, 3.868542, 1, 0, 0, 1, 1,
0.5564579, 0.2715637, 0.2671518, 1, 0, 0, 1, 1,
0.5566295, -0.2519967, 0.9291235, 1, 0, 0, 1, 1,
0.5573416, -0.7180257, 3.28541, 0, 0, 0, 1, 1,
0.5628881, 0.2737215, 1.798299, 0, 0, 0, 1, 1,
0.5663074, -0.4937897, 1.576942, 0, 0, 0, 1, 1,
0.5666737, -0.2685177, 1.597602, 0, 0, 0, 1, 1,
0.5681177, 1.407295, 0.7320604, 0, 0, 0, 1, 1,
0.5754275, -0.2081547, 0.8246802, 0, 0, 0, 1, 1,
0.5787274, 1.086083, -0.8193397, 0, 0, 0, 1, 1,
0.5838185, 0.1490827, 2.254974, 1, 1, 1, 1, 1,
0.5848731, -0.2300353, 1.046369, 1, 1, 1, 1, 1,
0.5858289, -1.236022, 0.6358358, 1, 1, 1, 1, 1,
0.5862365, -0.329122, 1.995819, 1, 1, 1, 1, 1,
0.5904542, -1.418489, 2.895747, 1, 1, 1, 1, 1,
0.5919424, 1.089908, 2.459327, 1, 1, 1, 1, 1,
0.5945105, -0.7345558, 2.308253, 1, 1, 1, 1, 1,
0.594549, -0.6737262, 2.29334, 1, 1, 1, 1, 1,
0.5946718, -0.7019363, 2.311586, 1, 1, 1, 1, 1,
0.5950158, -1.502315, 3.167883, 1, 1, 1, 1, 1,
0.6025742, -0.404474, 1.285911, 1, 1, 1, 1, 1,
0.6025802, -0.7313538, 2.531123, 1, 1, 1, 1, 1,
0.6068245, 1.892826, 1.382048, 1, 1, 1, 1, 1,
0.6097495, 1.625217, 3.345261, 1, 1, 1, 1, 1,
0.6135225, 0.9667895, 1.104682, 1, 1, 1, 1, 1,
0.6153899, 0.6033567, 0.2865747, 0, 0, 1, 1, 1,
0.6166437, 0.8888687, 0.8885197, 1, 0, 0, 1, 1,
0.6179686, 0.136127, 0.8697305, 1, 0, 0, 1, 1,
0.6206974, -0.3442484, 1.748088, 1, 0, 0, 1, 1,
0.6266962, 0.9968596, 0.1512876, 1, 0, 0, 1, 1,
0.6300238, 0.3765357, 1.237873, 1, 0, 0, 1, 1,
0.6306295, -2.021245, 3.112914, 0, 0, 0, 1, 1,
0.6349723, -0.4821122, 1.813266, 0, 0, 0, 1, 1,
0.6363597, 0.2193338, 1.915565, 0, 0, 0, 1, 1,
0.6387397, -1.31565, 3.517572, 0, 0, 0, 1, 1,
0.6404433, 0.2038406, 2.275944, 0, 0, 0, 1, 1,
0.6491331, -0.1481414, 0.7983058, 0, 0, 0, 1, 1,
0.6507483, -0.7774793, 1.621722, 0, 0, 0, 1, 1,
0.6531987, 1.01571, 0.4012174, 1, 1, 1, 1, 1,
0.6542843, -1.571559, 3.405326, 1, 1, 1, 1, 1,
0.658226, -0.8977539, 2.101634, 1, 1, 1, 1, 1,
0.6646189, -0.5452935, 1.34123, 1, 1, 1, 1, 1,
0.6655396, -0.1924079, 2.514402, 1, 1, 1, 1, 1,
0.6661552, -0.6379347, 2.682524, 1, 1, 1, 1, 1,
0.6667183, -1.002327, 3.367614, 1, 1, 1, 1, 1,
0.6690449, 0.5460522, 1.74318, 1, 1, 1, 1, 1,
0.6702051, -2.041785, 4.528348, 1, 1, 1, 1, 1,
0.6743942, 0.3537662, 0.9148297, 1, 1, 1, 1, 1,
0.6754773, 0.893306, -0.7192298, 1, 1, 1, 1, 1,
0.6768577, 1.376157, 1.730762, 1, 1, 1, 1, 1,
0.6769285, -1.575455, 1.695195, 1, 1, 1, 1, 1,
0.6793839, -0.0513819, 2.746392, 1, 1, 1, 1, 1,
0.6800479, -1.625558, 1.684592, 1, 1, 1, 1, 1,
0.6823828, 0.9730136, -0.654452, 0, 0, 1, 1, 1,
0.6862913, -0.5359551, 2.41806, 1, 0, 0, 1, 1,
0.6899522, -0.8773945, 2.711913, 1, 0, 0, 1, 1,
0.692319, 0.1133551, 2.533412, 1, 0, 0, 1, 1,
0.6938028, -0.1295059, 2.709467, 1, 0, 0, 1, 1,
0.6969321, -0.8456891, 2.387728, 1, 0, 0, 1, 1,
0.6997792, -0.3524568, 1.530826, 0, 0, 0, 1, 1,
0.7054522, -0.2766142, 1.655974, 0, 0, 0, 1, 1,
0.7100234, -0.2590792, 2.991706, 0, 0, 0, 1, 1,
0.7116288, -2.187521, 3.494263, 0, 0, 0, 1, 1,
0.7147635, 2.636041, 0.9581569, 0, 0, 0, 1, 1,
0.7156156, 0.6505741, 0.2940972, 0, 0, 0, 1, 1,
0.7197142, -0.08998641, 1.867277, 0, 0, 0, 1, 1,
0.72062, 0.48615, 0.581899, 1, 1, 1, 1, 1,
0.7238731, 0.7986486, 1.420982, 1, 1, 1, 1, 1,
0.7246226, -0.2644206, 2.084186, 1, 1, 1, 1, 1,
0.7252563, 0.8515537, 0.1560232, 1, 1, 1, 1, 1,
0.7319427, 0.3510855, 1.607901, 1, 1, 1, 1, 1,
0.7333138, -1.435284, 4.267859, 1, 1, 1, 1, 1,
0.7341229, 0.9951383, 0.8300188, 1, 1, 1, 1, 1,
0.7356139, 0.3653645, 2.142449, 1, 1, 1, 1, 1,
0.7414493, 0.2240819, 1.726212, 1, 1, 1, 1, 1,
0.7430935, -0.3736174, 0.7392896, 1, 1, 1, 1, 1,
0.7490544, -0.8319645, 0.1678453, 1, 1, 1, 1, 1,
0.7491673, -0.2585796, 1.777929, 1, 1, 1, 1, 1,
0.7497674, 0.3041404, 1.141067, 1, 1, 1, 1, 1,
0.7525482, -0.03312621, 2.031791, 1, 1, 1, 1, 1,
0.756541, 0.8260446, 1.358232, 1, 1, 1, 1, 1,
0.7594614, -0.7366186, 2.584011, 0, 0, 1, 1, 1,
0.7677947, 1.573264, 1.704639, 1, 0, 0, 1, 1,
0.769743, -0.2376428, 3.735064, 1, 0, 0, 1, 1,
0.7735115, 0.6354905, 1.76023, 1, 0, 0, 1, 1,
0.7751474, 0.07528371, 2.562747, 1, 0, 0, 1, 1,
0.7755454, 0.4212972, -0.6739172, 1, 0, 0, 1, 1,
0.7799483, -0.4013133, 2.495235, 0, 0, 0, 1, 1,
0.7808344, -0.3407855, 2.571543, 0, 0, 0, 1, 1,
0.7841156, 0.7917064, 1.115119, 0, 0, 0, 1, 1,
0.7867207, -0.1585108, 1.754838, 0, 0, 0, 1, 1,
0.7924626, -0.6388547, 2.17231, 0, 0, 0, 1, 1,
0.792715, 1.169462, -0.9090595, 0, 0, 0, 1, 1,
0.7946914, -0.4399913, -0.6675315, 0, 0, 0, 1, 1,
0.7951954, -1.237918, 3.053721, 1, 1, 1, 1, 1,
0.7963625, -0.7773401, 1.728702, 1, 1, 1, 1, 1,
0.7967981, 1.258283, -0.5510735, 1, 1, 1, 1, 1,
0.797997, -0.4567671, 2.175103, 1, 1, 1, 1, 1,
0.8005502, 0.2510496, 4.000605, 1, 1, 1, 1, 1,
0.8043855, -2.284952, 2.801601, 1, 1, 1, 1, 1,
0.8052257, 0.2164994, 2.965587, 1, 1, 1, 1, 1,
0.8059651, -0.9457646, 1.425834, 1, 1, 1, 1, 1,
0.8063511, -0.01502852, 1.659417, 1, 1, 1, 1, 1,
0.8156914, -0.2866756, 1.942833, 1, 1, 1, 1, 1,
0.831396, -0.3506187, 2.381228, 1, 1, 1, 1, 1,
0.8323609, -0.3317191, 1.873824, 1, 1, 1, 1, 1,
0.8324252, 1.037214, 0.4397609, 1, 1, 1, 1, 1,
0.8434703, 0.8927293, 1.194775, 1, 1, 1, 1, 1,
0.84862, -0.2132762, 1.229172, 1, 1, 1, 1, 1,
0.8546496, 0.5190281, 1.487133, 0, 0, 1, 1, 1,
0.8570656, -0.2410152, 0.8461533, 1, 0, 0, 1, 1,
0.85766, 0.3404426, 1.47442, 1, 0, 0, 1, 1,
0.8668881, 2.25572, 0.4801958, 1, 0, 0, 1, 1,
0.8697727, -1.215825, 3.29128, 1, 0, 0, 1, 1,
0.8733793, -0.8922918, 0.9045364, 1, 0, 0, 1, 1,
0.8846239, -2.18035, 1.435362, 0, 0, 0, 1, 1,
0.8979986, -0.5590695, 2.594643, 0, 0, 0, 1, 1,
0.9030497, 0.4931251, 0.4979478, 0, 0, 0, 1, 1,
0.9080167, 0.0693972, 1.2645, 0, 0, 0, 1, 1,
0.919145, 0.1467714, 2.279148, 0, 0, 0, 1, 1,
0.9244179, 1.909239, -0.273678, 0, 0, 0, 1, 1,
0.9278791, 0.4567721, 2.193995, 0, 0, 0, 1, 1,
0.9299155, -0.6856923, 3.007262, 1, 1, 1, 1, 1,
0.9314617, -0.1728997, 2.606462, 1, 1, 1, 1, 1,
0.935491, 1.349527, -0.06006633, 1, 1, 1, 1, 1,
0.9369133, -0.6057742, 2.416086, 1, 1, 1, 1, 1,
0.9390302, -0.1404439, 1.950469, 1, 1, 1, 1, 1,
0.942139, 0.430125, 1.757619, 1, 1, 1, 1, 1,
0.9550141, -1.170034, 2.686579, 1, 1, 1, 1, 1,
0.9610419, -2.394476, 4.429899, 1, 1, 1, 1, 1,
0.9649107, -0.8426914, 3.609369, 1, 1, 1, 1, 1,
0.9654008, 0.2977798, 1.401932, 1, 1, 1, 1, 1,
0.9688063, 0.9196846, 0.630532, 1, 1, 1, 1, 1,
0.9722385, 1.441343, 1.135955, 1, 1, 1, 1, 1,
0.9725383, -0.6915694, 3.233717, 1, 1, 1, 1, 1,
0.9781248, -0.7871258, 1.866974, 1, 1, 1, 1, 1,
0.9783562, -1.654746, 3.441747, 1, 1, 1, 1, 1,
0.9788631, 0.5123823, 1.600008, 0, 0, 1, 1, 1,
0.9826661, 1.046526, -0.2764474, 1, 0, 0, 1, 1,
0.9835817, 1.44615, 1.029349, 1, 0, 0, 1, 1,
0.9915647, 0.2143936, 0.8716302, 1, 0, 0, 1, 1,
0.9921035, -0.2182265, 1.48972, 1, 0, 0, 1, 1,
0.9931116, 2.606814, 1.1107, 1, 0, 0, 1, 1,
0.9978512, -0.002322583, 0.6525389, 0, 0, 0, 1, 1,
1.000405, 0.9632774, 0.5644046, 0, 0, 0, 1, 1,
1.028557, 1.055905, 1.026667, 0, 0, 0, 1, 1,
1.029369, 0.5483697, 2.979094, 0, 0, 0, 1, 1,
1.030503, -0.1784805, 3.051152, 0, 0, 0, 1, 1,
1.03161, 0.8717634, -0.2930126, 0, 0, 0, 1, 1,
1.033933, 0.5090731, 0.3760741, 0, 0, 0, 1, 1,
1.040816, -0.1598656, 3.79398, 1, 1, 1, 1, 1,
1.04177, -1.343544, 2.050489, 1, 1, 1, 1, 1,
1.042919, -1.43583, 2.122603, 1, 1, 1, 1, 1,
1.053737, 0.5083225, 2.264623, 1, 1, 1, 1, 1,
1.057032, -0.1421462, 3.404072, 1, 1, 1, 1, 1,
1.0605, 0.09346408, 2.35835, 1, 1, 1, 1, 1,
1.063551, 0.3799435, 1.634323, 1, 1, 1, 1, 1,
1.063841, -0.1308468, 2.605947, 1, 1, 1, 1, 1,
1.071898, -2.494416, 2.623298, 1, 1, 1, 1, 1,
1.079423, 0.150773, 1.604291, 1, 1, 1, 1, 1,
1.080169, -0.7383684, 2.199586, 1, 1, 1, 1, 1,
1.081223, -0.5622745, 3.162488, 1, 1, 1, 1, 1,
1.083952, 0.7985772, 0.5441179, 1, 1, 1, 1, 1,
1.085535, 0.3266786, 0.8054823, 1, 1, 1, 1, 1,
1.085545, 0.1673846, 2.338966, 1, 1, 1, 1, 1,
1.086277, -0.7702618, 2.46159, 0, 0, 1, 1, 1,
1.091036, -0.03616786, 0.5806872, 1, 0, 0, 1, 1,
1.093459, 0.195024, 1.536248, 1, 0, 0, 1, 1,
1.110033, -0.2540866, 1.253256, 1, 0, 0, 1, 1,
1.122248, 0.03462395, 2.246595, 1, 0, 0, 1, 1,
1.128096, 1.683381, 0.1716385, 1, 0, 0, 1, 1,
1.130314, -0.07296526, 0.3859421, 0, 0, 0, 1, 1,
1.130429, 0.9020644, 0.09837645, 0, 0, 0, 1, 1,
1.13063, -0.3241075, 0.9494908, 0, 0, 0, 1, 1,
1.134429, 0.08491345, 1.10911, 0, 0, 0, 1, 1,
1.136742, 1.297736, 0.8636366, 0, 0, 0, 1, 1,
1.139664, 1.091151, 1.532791, 0, 0, 0, 1, 1,
1.144173, 0.5984243, 0.8614767, 0, 0, 0, 1, 1,
1.144438, 0.4497815, 0.2661606, 1, 1, 1, 1, 1,
1.145533, 1.338672, 0.8832682, 1, 1, 1, 1, 1,
1.145861, 1.113248, 0.3988346, 1, 1, 1, 1, 1,
1.162702, -0.1228055, 0.6952575, 1, 1, 1, 1, 1,
1.16419, -1.219063, 2.381576, 1, 1, 1, 1, 1,
1.165557, 1.549306, 1.135209, 1, 1, 1, 1, 1,
1.173321, 0.08958318, 0.3163415, 1, 1, 1, 1, 1,
1.18202, 0.05756937, 2.562088, 1, 1, 1, 1, 1,
1.187406, 1.54642, 1.615877, 1, 1, 1, 1, 1,
1.198311, -0.1231941, 1.208923, 1, 1, 1, 1, 1,
1.202934, 0.2661111, 1.603077, 1, 1, 1, 1, 1,
1.204635, 0.3815044, 1.496019, 1, 1, 1, 1, 1,
1.207387, -0.8604228, 2.164331, 1, 1, 1, 1, 1,
1.220834, 0.2666621, 0.9045333, 1, 1, 1, 1, 1,
1.237302, 0.2086201, 2.074704, 1, 1, 1, 1, 1,
1.247421, 1.415793, -0.02831304, 0, 0, 1, 1, 1,
1.25074, -0.8356468, 1.839263, 1, 0, 0, 1, 1,
1.252546, -0.2956896, 1.914299, 1, 0, 0, 1, 1,
1.265247, -0.07356799, 2.415605, 1, 0, 0, 1, 1,
1.276314, 0.3442335, 1.51109, 1, 0, 0, 1, 1,
1.276358, 1.169446, 0.6244664, 1, 0, 0, 1, 1,
1.278553, -0.267902, 1.821884, 0, 0, 0, 1, 1,
1.287183, -0.5787072, 2.429608, 0, 0, 0, 1, 1,
1.299245, 1.385982, 1.183781, 0, 0, 0, 1, 1,
1.301511, -0.05147885, 1.153626, 0, 0, 0, 1, 1,
1.305565, -2.113094, 4.555238, 0, 0, 0, 1, 1,
1.320585, 1.791949, 1.866377, 0, 0, 0, 1, 1,
1.327899, 0.06092876, 1.20897, 0, 0, 0, 1, 1,
1.329475, -0.2558559, 1.772713, 1, 1, 1, 1, 1,
1.330141, 0.009097956, 1.205021, 1, 1, 1, 1, 1,
1.33152, -0.2126902, 1.725962, 1, 1, 1, 1, 1,
1.331621, -0.7255701, 1.239456, 1, 1, 1, 1, 1,
1.336007, -0.009630085, 0.0498515, 1, 1, 1, 1, 1,
1.336711, 0.2081061, 2.77295, 1, 1, 1, 1, 1,
1.347486, 0.7839273, 1.362032, 1, 1, 1, 1, 1,
1.348399, 0.9545329, 0.2405635, 1, 1, 1, 1, 1,
1.354982, -0.693765, 2.222724, 1, 1, 1, 1, 1,
1.385719, -0.03744404, 1.091622, 1, 1, 1, 1, 1,
1.397083, -0.3072732, 0.6525619, 1, 1, 1, 1, 1,
1.403325, 1.408217, 1.007473, 1, 1, 1, 1, 1,
1.428757, 0.7183354, 0.4774103, 1, 1, 1, 1, 1,
1.434481, 0.570112, 2.753453, 1, 1, 1, 1, 1,
1.449957, 0.7140294, 1.367787, 1, 1, 1, 1, 1,
1.451279, -1.876639, 1.615711, 0, 0, 1, 1, 1,
1.462312, -0.3068027, 1.109523, 1, 0, 0, 1, 1,
1.462914, -0.1470477, 2.193176, 1, 0, 0, 1, 1,
1.467131, -0.5756128, 1.37092, 1, 0, 0, 1, 1,
1.473846, -0.3069332, 2.594853, 1, 0, 0, 1, 1,
1.474655, -0.2128903, 1.289235, 1, 0, 0, 1, 1,
1.475069, 0.3848027, 0.8749172, 0, 0, 0, 1, 1,
1.483844, 1.853501, 1.422886, 0, 0, 0, 1, 1,
1.489674, -0.3746896, 2.001948, 0, 0, 0, 1, 1,
1.491364, 0.8989698, 3.502189, 0, 0, 0, 1, 1,
1.495353, -1.316036, 1.429445, 0, 0, 0, 1, 1,
1.514983, -0.257484, 2.72674, 0, 0, 0, 1, 1,
1.520963, -0.3842416, 3.154812, 0, 0, 0, 1, 1,
1.526874, -0.06518812, -0.8064078, 1, 1, 1, 1, 1,
1.543447, 0.02944112, 1.047691, 1, 1, 1, 1, 1,
1.558896, -0.7224603, 2.599961, 1, 1, 1, 1, 1,
1.561792, 1.635667, 1.423452, 1, 1, 1, 1, 1,
1.568729, -1.629339, 1.51466, 1, 1, 1, 1, 1,
1.578896, -0.6598279, 3.44413, 1, 1, 1, 1, 1,
1.58585, 0.203542, -0.2519789, 1, 1, 1, 1, 1,
1.59955, 1.188447, 1.248494, 1, 1, 1, 1, 1,
1.608063, 1.311924, -0.05193315, 1, 1, 1, 1, 1,
1.614036, -0.1801316, 0.4451625, 1, 1, 1, 1, 1,
1.617394, 0.8533198, 0.2408331, 1, 1, 1, 1, 1,
1.643993, -1.161109, 2.05983, 1, 1, 1, 1, 1,
1.705564, -0.61576, 1.830407, 1, 1, 1, 1, 1,
1.736589, 0.8365604, 2.943483, 1, 1, 1, 1, 1,
1.742746, -0.6051176, 2.704551, 1, 1, 1, 1, 1,
1.743451, -0.8403348, 1.195638, 0, 0, 1, 1, 1,
1.758631, 0.3604778, 1.27584, 1, 0, 0, 1, 1,
1.770955, 0.2679247, 2.612727, 1, 0, 0, 1, 1,
1.795786, 0.04768464, 0.851457, 1, 0, 0, 1, 1,
1.799776, -1.221107, 3.915261, 1, 0, 0, 1, 1,
1.833762, -0.4080001, 1.062968, 1, 0, 0, 1, 1,
1.85007, -1.242994, 1.771001, 0, 0, 0, 1, 1,
1.853339, 0.726059, 1.560472, 0, 0, 0, 1, 1,
1.861185, -1.991272, 2.304911, 0, 0, 0, 1, 1,
1.862776, 1.260499, 0.5359458, 0, 0, 0, 1, 1,
1.882947, -0.04313241, 1.619108, 0, 0, 0, 1, 1,
1.886864, 2.993954, 0.7043327, 0, 0, 0, 1, 1,
1.902302, 1.250094, -0.7426453, 0, 0, 0, 1, 1,
1.940449, 1.359115, -0.07109234, 1, 1, 1, 1, 1,
1.954451, -2.684132, 1.93078, 1, 1, 1, 1, 1,
1.960932, 0.0677627, 2.0668, 1, 1, 1, 1, 1,
1.961788, -1.295179, 3.16956, 1, 1, 1, 1, 1,
1.977901, -0.405522, 2.720168, 1, 1, 1, 1, 1,
1.990071, -0.4250197, -0.3445947, 1, 1, 1, 1, 1,
2.022487, 0.2882298, 2.692873, 1, 1, 1, 1, 1,
2.047558, 1.859709, 1.595504, 1, 1, 1, 1, 1,
2.05194, 0.3452911, 1.521161, 1, 1, 1, 1, 1,
2.057142, 0.8258638, 0.8616763, 1, 1, 1, 1, 1,
2.080686, -0.1472941, 1.67889, 1, 1, 1, 1, 1,
2.100035, -1.464853, 3.145448, 1, 1, 1, 1, 1,
2.107476, 1.410663, 0.8712367, 1, 1, 1, 1, 1,
2.114106, -0.9338276, 1.307475, 1, 1, 1, 1, 1,
2.1184, 0.3528044, 0.4227384, 1, 1, 1, 1, 1,
2.135036, -0.3059743, 2.878696, 0, 0, 1, 1, 1,
2.168541, 0.7541243, 1.153633, 1, 0, 0, 1, 1,
2.189244, 1.785626, 1.326473, 1, 0, 0, 1, 1,
2.19609, -1.71245, 1.967259, 1, 0, 0, 1, 1,
2.21288, -0.06789723, 2.09216, 1, 0, 0, 1, 1,
2.224448, -0.9075708, 0.6320352, 1, 0, 0, 1, 1,
2.24912, 0.6226735, -0.4558855, 0, 0, 0, 1, 1,
2.254935, 1.050994, 3.11621, 0, 0, 0, 1, 1,
2.263978, -0.4870413, 2.478269, 0, 0, 0, 1, 1,
2.361137, 0.2700326, 2.445163, 0, 0, 0, 1, 1,
2.404428, 0.4965795, -0.1798427, 0, 0, 0, 1, 1,
2.406378, 0.3177949, 1.739021, 0, 0, 0, 1, 1,
2.43202, -1.152697, 2.729067, 0, 0, 0, 1, 1,
2.480636, 1.932863, 3.10876, 1, 1, 1, 1, 1,
2.562243, -1.96833, 2.473026, 1, 1, 1, 1, 1,
2.620842, -0.5381515, 0.9441965, 1, 1, 1, 1, 1,
2.741547, -0.02934248, 0.8488401, 1, 1, 1, 1, 1,
2.869087, -0.2870241, 1.932506, 1, 1, 1, 1, 1,
3.147581, 2.518415, 0.01000553, 1, 1, 1, 1, 1,
4.026517, -1.903184, 2.945102, 1, 1, 1, 1, 1
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
var radius = 9.948497;
var distance = 34.94368;
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
mvMatrix.translate( -0.5653205, 0.1872926, -0.07516146 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.94368);
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
