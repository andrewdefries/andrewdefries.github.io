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
-3.51605, -0.590712, -1.64606, 1, 0, 0, 1,
-2.848983, -0.5946655, -2.2446, 1, 0.007843138, 0, 1,
-2.815252, -0.2250404, -2.897478, 1, 0.01176471, 0, 1,
-2.776776, -2.334301, -4.774472, 1, 0.01960784, 0, 1,
-2.750104, -1.043874, -3.013535, 1, 0.02352941, 0, 1,
-2.530087, -1.667998, -4.117895, 1, 0.03137255, 0, 1,
-2.370977, -0.1550523, -1.822753, 1, 0.03529412, 0, 1,
-2.32189, 0.4392119, -1.404222, 1, 0.04313726, 0, 1,
-2.300201, 0.223878, -0.3047571, 1, 0.04705882, 0, 1,
-2.253388, -0.5075107, -2.734195, 1, 0.05490196, 0, 1,
-2.200581, 1.320345, -0.1109126, 1, 0.05882353, 0, 1,
-2.196042, 0.388189, -2.491979, 1, 0.06666667, 0, 1,
-2.190278, 0.411858, -0.844856, 1, 0.07058824, 0, 1,
-2.189678, 1.659938, -1.739547, 1, 0.07843138, 0, 1,
-2.179439, -1.132711, -0.5531614, 1, 0.08235294, 0, 1,
-2.171793, 0.5768189, -0.02644011, 1, 0.09019608, 0, 1,
-2.149664, 0.1200133, 0.1946696, 1, 0.09411765, 0, 1,
-2.145948, 1.70615, 1.343774, 1, 0.1019608, 0, 1,
-2.144704, -0.4383906, -0.3898376, 1, 0.1098039, 0, 1,
-2.130143, 0.5104644, -1.476948, 1, 0.1137255, 0, 1,
-2.07983, 0.2171026, -0.006630788, 1, 0.1215686, 0, 1,
-2.075872, 0.8134272, -1.174572, 1, 0.1254902, 0, 1,
-2.053676, 0.03591201, -1.205428, 1, 0.1333333, 0, 1,
-2.044449, 0.7680163, -0.4893696, 1, 0.1372549, 0, 1,
-2.032141, -1.463308, -2.005394, 1, 0.145098, 0, 1,
-2.01673, -0.2706236, -2.804531, 1, 0.1490196, 0, 1,
-2.00065, -3.197099, -1.275842, 1, 0.1568628, 0, 1,
-1.991524, -1.389873, -3.308856, 1, 0.1607843, 0, 1,
-1.973452, -2.510592, -2.549312, 1, 0.1686275, 0, 1,
-1.967344, -1.042871, -3.326993, 1, 0.172549, 0, 1,
-1.947159, -1.042931, -0.9607251, 1, 0.1803922, 0, 1,
-1.945969, -1.138891, -2.634355, 1, 0.1843137, 0, 1,
-1.910491, 1.376127, -0.1547061, 1, 0.1921569, 0, 1,
-1.860923, 0.6096579, -0.7925982, 1, 0.1960784, 0, 1,
-1.856477, 2.074723, 0.4612136, 1, 0.2039216, 0, 1,
-1.855102, -1.509142, -2.415462, 1, 0.2117647, 0, 1,
-1.818806, 1.585575, 0.9182512, 1, 0.2156863, 0, 1,
-1.813067, 0.8379951, -1.910629, 1, 0.2235294, 0, 1,
-1.798379, -0.8509989, -1.155938, 1, 0.227451, 0, 1,
-1.773238, 1.747485, -1.137286, 1, 0.2352941, 0, 1,
-1.761681, -0.4980905, -1.046604, 1, 0.2392157, 0, 1,
-1.732376, -0.5984551, -0.9505605, 1, 0.2470588, 0, 1,
-1.726884, -0.7924678, -3.192109, 1, 0.2509804, 0, 1,
-1.723396, 0.4183529, -2.275316, 1, 0.2588235, 0, 1,
-1.698406, 0.381478, -1.093616, 1, 0.2627451, 0, 1,
-1.669065, 0.2182741, -1.57391, 1, 0.2705882, 0, 1,
-1.667052, 0.5918119, -3.138566, 1, 0.2745098, 0, 1,
-1.657224, -0.3834999, -0.7178051, 1, 0.282353, 0, 1,
-1.640548, 0.09056155, -1.166902, 1, 0.2862745, 0, 1,
-1.63261, -2.261407, -2.128211, 1, 0.2941177, 0, 1,
-1.609469, 0.951132, 0.6591371, 1, 0.3019608, 0, 1,
-1.600494, 0.9792417, -1.621879, 1, 0.3058824, 0, 1,
-1.599397, -0.4705477, 0.6150976, 1, 0.3137255, 0, 1,
-1.587349, 0.449313, 0.3494865, 1, 0.3176471, 0, 1,
-1.577834, -0.6611163, -2.646449, 1, 0.3254902, 0, 1,
-1.576515, 0.3308624, -0.2852394, 1, 0.3294118, 0, 1,
-1.575851, -1.332136, -2.07074, 1, 0.3372549, 0, 1,
-1.57036, 1.194889, -2.321413, 1, 0.3411765, 0, 1,
-1.566184, -0.6721101, -1.405881, 1, 0.3490196, 0, 1,
-1.559873, -0.9812728, -1.04234, 1, 0.3529412, 0, 1,
-1.54698, 0.356946, -1.618597, 1, 0.3607843, 0, 1,
-1.539308, -0.2425344, -0.5828155, 1, 0.3647059, 0, 1,
-1.538164, 0.9531025, 0.1117019, 1, 0.372549, 0, 1,
-1.521447, -0.607006, -3.989422, 1, 0.3764706, 0, 1,
-1.515215, 1.735946, -1.496521, 1, 0.3843137, 0, 1,
-1.505467, 0.1077047, -3.399113, 1, 0.3882353, 0, 1,
-1.502453, -0.0542811, -1.663165, 1, 0.3960784, 0, 1,
-1.500941, -1.05235, -0.1011476, 1, 0.4039216, 0, 1,
-1.498555, 0.4585556, -0.12811, 1, 0.4078431, 0, 1,
-1.494817, -2.33496, -3.029887, 1, 0.4156863, 0, 1,
-1.483093, 0.5342852, -1.289158, 1, 0.4196078, 0, 1,
-1.478788, -0.685033, -3.827835, 1, 0.427451, 0, 1,
-1.475928, 1.146021, -0.2166964, 1, 0.4313726, 0, 1,
-1.458858, 1.456255, -2.513124, 1, 0.4392157, 0, 1,
-1.451404, 0.6877522, -1.984706, 1, 0.4431373, 0, 1,
-1.446589, -0.6171302, -2.075366, 1, 0.4509804, 0, 1,
-1.436843, 0.2182343, -0.7408117, 1, 0.454902, 0, 1,
-1.435783, -1.405681, -0.5798061, 1, 0.4627451, 0, 1,
-1.434759, 0.8747231, -1.399521, 1, 0.4666667, 0, 1,
-1.43357, 0.4947186, -1.695456, 1, 0.4745098, 0, 1,
-1.425051, -2.354952, -2.355287, 1, 0.4784314, 0, 1,
-1.412848, 1.435247, -1.164102, 1, 0.4862745, 0, 1,
-1.412586, 0.2742667, -1.620721, 1, 0.4901961, 0, 1,
-1.396653, -0.6809315, -2.948198, 1, 0.4980392, 0, 1,
-1.376729, -0.1493934, -1.171052, 1, 0.5058824, 0, 1,
-1.366122, 0.4986132, -2.195083, 1, 0.509804, 0, 1,
-1.344006, 0.5433444, -0.1583046, 1, 0.5176471, 0, 1,
-1.339341, 0.1715844, -0.1671505, 1, 0.5215687, 0, 1,
-1.33346, -1.650876, -3.583909, 1, 0.5294118, 0, 1,
-1.327545, 1.157582, 0.5967816, 1, 0.5333334, 0, 1,
-1.32681, -0.2350532, -1.851023, 1, 0.5411765, 0, 1,
-1.320438, 0.1119277, -0.2398328, 1, 0.5450981, 0, 1,
-1.309231, -0.5147968, -1.366372, 1, 0.5529412, 0, 1,
-1.295879, 0.05666044, -2.050137, 1, 0.5568628, 0, 1,
-1.293393, -1.251074, -1.605167, 1, 0.5647059, 0, 1,
-1.290682, 1.169408, -1.713809, 1, 0.5686275, 0, 1,
-1.28743, 0.01231662, -0.307402, 1, 0.5764706, 0, 1,
-1.285677, 1.179235, -2.050873, 1, 0.5803922, 0, 1,
-1.28418, 0.2978039, -1.835122, 1, 0.5882353, 0, 1,
-1.276363, 1.211533, 1.355804, 1, 0.5921569, 0, 1,
-1.269867, 0.7411368, -0.3218646, 1, 0.6, 0, 1,
-1.267535, -0.5291688, -2.334166, 1, 0.6078432, 0, 1,
-1.254107, 2.469756, -1.279051, 1, 0.6117647, 0, 1,
-1.245106, -0.07606896, -1.094733, 1, 0.6196079, 0, 1,
-1.235381, -0.3387051, -1.465727, 1, 0.6235294, 0, 1,
-1.232499, -1.394108, -1.336532, 1, 0.6313726, 0, 1,
-1.232009, -1.308725, -0.6117427, 1, 0.6352941, 0, 1,
-1.228053, 0.8327912, -2.566598, 1, 0.6431373, 0, 1,
-1.226581, 0.1246036, -1.210138, 1, 0.6470588, 0, 1,
-1.213568, -1.956083, -3.604816, 1, 0.654902, 0, 1,
-1.195987, 0.3311331, -0.2946697, 1, 0.6588235, 0, 1,
-1.195627, 1.519014, 0.6801382, 1, 0.6666667, 0, 1,
-1.194512, -0.04498717, -0.7850207, 1, 0.6705883, 0, 1,
-1.190206, 0.3139389, -3.008623, 1, 0.6784314, 0, 1,
-1.188122, 0.0402868, -1.540966, 1, 0.682353, 0, 1,
-1.187387, -0.2711559, -1.911826, 1, 0.6901961, 0, 1,
-1.184584, -1.034521, -3.885597, 1, 0.6941177, 0, 1,
-1.172375, 0.3318826, -1.960043, 1, 0.7019608, 0, 1,
-1.170457, -0.6005909, -1.654674, 1, 0.7098039, 0, 1,
-1.169737, -0.9644949, -1.391018, 1, 0.7137255, 0, 1,
-1.165794, -0.1126949, -0.364484, 1, 0.7215686, 0, 1,
-1.154037, 0.4825783, 0.201849, 1, 0.7254902, 0, 1,
-1.151373, 0.7630599, -1.273122, 1, 0.7333333, 0, 1,
-1.140481, 0.02386097, -1.935984, 1, 0.7372549, 0, 1,
-1.138693, -0.09784333, 0.06382564, 1, 0.7450981, 0, 1,
-1.135514, -0.503338, -1.07699, 1, 0.7490196, 0, 1,
-1.134312, 0.4977094, -2.353887, 1, 0.7568628, 0, 1,
-1.131895, 0.1391108, -3.130087, 1, 0.7607843, 0, 1,
-1.130052, -0.4706619, -0.4761973, 1, 0.7686275, 0, 1,
-1.129371, 1.576731, -0.03475947, 1, 0.772549, 0, 1,
-1.126748, -0.9826498, -1.141023, 1, 0.7803922, 0, 1,
-1.124394, -1.497047, -3.467686, 1, 0.7843137, 0, 1,
-1.121231, 0.115561, -2.703561, 1, 0.7921569, 0, 1,
-1.118514, -1.269343, -2.824482, 1, 0.7960784, 0, 1,
-1.110298, -1.490674, -1.912765, 1, 0.8039216, 0, 1,
-1.109619, 0.3759856, -0.7539663, 1, 0.8117647, 0, 1,
-1.108579, 0.8101801, -1.106262, 1, 0.8156863, 0, 1,
-1.108065, 1.678816, -1.555529, 1, 0.8235294, 0, 1,
-1.105496, 1.084396, -0.9903067, 1, 0.827451, 0, 1,
-1.093799, 0.1380022, -3.607119, 1, 0.8352941, 0, 1,
-1.071225, -0.6856827, -2.245198, 1, 0.8392157, 0, 1,
-1.065394, 1.447775, -0.1132185, 1, 0.8470588, 0, 1,
-1.062408, -0.4777385, -0.8327307, 1, 0.8509804, 0, 1,
-1.054783, 0.2741802, -1.102272, 1, 0.8588235, 0, 1,
-1.054074, 1.049594, 0.2683853, 1, 0.8627451, 0, 1,
-1.049953, -1.306015, -1.070214, 1, 0.8705882, 0, 1,
-1.043141, -1.378403, -0.6838021, 1, 0.8745098, 0, 1,
-1.033417, 0.9356073, 0.05317431, 1, 0.8823529, 0, 1,
-1.031197, 2.314376, -2.298994, 1, 0.8862745, 0, 1,
-1.030377, -0.7325842, -1.402275, 1, 0.8941177, 0, 1,
-1.014082, 0.6033852, 0.5085751, 1, 0.8980392, 0, 1,
-1.012565, -0.7389416, -1.524018, 1, 0.9058824, 0, 1,
-1.010587, -1.402551, -3.505033, 1, 0.9137255, 0, 1,
-1.006685, -0.5373006, -2.251904, 1, 0.9176471, 0, 1,
-1.006229, -0.2764657, -2.242625, 1, 0.9254902, 0, 1,
-1.00503, -0.4915588, -1.599871, 1, 0.9294118, 0, 1,
-1.000388, -0.03919682, -3.239874, 1, 0.9372549, 0, 1,
-0.997587, 1.480083, -1.515151, 1, 0.9411765, 0, 1,
-0.997294, -0.9217998, -3.804019, 1, 0.9490196, 0, 1,
-0.9964781, 0.8528231, -1.597575, 1, 0.9529412, 0, 1,
-0.9928662, -1.334496, -2.894295, 1, 0.9607843, 0, 1,
-0.9913111, 0.3389792, -2.474597, 1, 0.9647059, 0, 1,
-0.9902983, 0.141051, -1.274359, 1, 0.972549, 0, 1,
-0.9900253, -1.116552, -1.817274, 1, 0.9764706, 0, 1,
-0.9890767, 1.277678, -0.2427898, 1, 0.9843137, 0, 1,
-0.9872714, 1.02313, -0.7091991, 1, 0.9882353, 0, 1,
-0.9870686, -1.713367, -2.892722, 1, 0.9960784, 0, 1,
-0.9834505, -0.9801991, -1.128749, 0.9960784, 1, 0, 1,
-0.9779091, 1.87502, -0.7113222, 0.9921569, 1, 0, 1,
-0.9729286, 1.077876, -1.393158, 0.9843137, 1, 0, 1,
-0.9715174, 1.230497, 2.028967, 0.9803922, 1, 0, 1,
-0.968094, -0.31802, -2.979565, 0.972549, 1, 0, 1,
-0.9678499, -1.121975, -3.258482, 0.9686275, 1, 0, 1,
-0.9674731, 0.8536543, -0.6410226, 0.9607843, 1, 0, 1,
-0.9662709, -1.915063, -2.948917, 0.9568627, 1, 0, 1,
-0.960957, 0.4854311, -0.7012197, 0.9490196, 1, 0, 1,
-0.9595356, 0.4260226, -0.720639, 0.945098, 1, 0, 1,
-0.9560599, -0.3734979, 0.06048925, 0.9372549, 1, 0, 1,
-0.9550215, -0.809454, -0.7726176, 0.9333333, 1, 0, 1,
-0.9539768, -0.4136133, -1.545359, 0.9254902, 1, 0, 1,
-0.9530677, -0.7291797, -2.460518, 0.9215686, 1, 0, 1,
-0.9520774, -0.283529, -3.135028, 0.9137255, 1, 0, 1,
-0.9485067, -0.5196787, -2.443414, 0.9098039, 1, 0, 1,
-0.9459884, 0.6787311, -0.4553357, 0.9019608, 1, 0, 1,
-0.9407777, -2.164132, -0.3182484, 0.8941177, 1, 0, 1,
-0.9361364, 2.593265, 0.5144705, 0.8901961, 1, 0, 1,
-0.9340675, -0.4004091, -2.730253, 0.8823529, 1, 0, 1,
-0.928107, 1.746564, -0.09751112, 0.8784314, 1, 0, 1,
-0.9255737, -0.3840152, -0.6691406, 0.8705882, 1, 0, 1,
-0.925423, -1.22435, -2.099577, 0.8666667, 1, 0, 1,
-0.9243408, 0.2001298, -1.018983, 0.8588235, 1, 0, 1,
-0.9189478, 1.296543, 0.6340762, 0.854902, 1, 0, 1,
-0.9159163, -0.2125829, -2.80286, 0.8470588, 1, 0, 1,
-0.9114506, -0.8982728, -2.297687, 0.8431373, 1, 0, 1,
-0.9100803, 0.8818099, -2.376061, 0.8352941, 1, 0, 1,
-0.9095275, -0.3086978, -1.491487, 0.8313726, 1, 0, 1,
-0.9078107, 0.1187326, 0.4378359, 0.8235294, 1, 0, 1,
-0.904251, -1.719684, -3.301713, 0.8196079, 1, 0, 1,
-0.9037057, 1.268273, -2.296819, 0.8117647, 1, 0, 1,
-0.8984653, -1.512069, -2.921522, 0.8078431, 1, 0, 1,
-0.8958616, 0.2260285, -2.35111, 0.8, 1, 0, 1,
-0.8858405, 0.08068836, -0.5891232, 0.7921569, 1, 0, 1,
-0.8837207, -0.5408095, -0.6766251, 0.7882353, 1, 0, 1,
-0.880747, -0.1716706, -1.524894, 0.7803922, 1, 0, 1,
-0.8731824, -1.256802, -1.658821, 0.7764706, 1, 0, 1,
-0.8718119, -1.210419, -2.220556, 0.7686275, 1, 0, 1,
-0.8706964, 0.8115092, -0.1817499, 0.7647059, 1, 0, 1,
-0.8702911, -0.3847506, -1.29273, 0.7568628, 1, 0, 1,
-0.8702544, 0.5652021, 0.7533277, 0.7529412, 1, 0, 1,
-0.8658688, -1.951694, -2.527669, 0.7450981, 1, 0, 1,
-0.8630604, -0.2266513, -0.8069506, 0.7411765, 1, 0, 1,
-0.8629476, 0.8877004, -0.4955667, 0.7333333, 1, 0, 1,
-0.8583318, 0.9580687, 1.874132, 0.7294118, 1, 0, 1,
-0.8535204, -0.08280291, -2.059215, 0.7215686, 1, 0, 1,
-0.8478215, 1.270858, -1.20526, 0.7176471, 1, 0, 1,
-0.8472784, -0.07925178, -0.5086522, 0.7098039, 1, 0, 1,
-0.8375446, -0.571285, -3.532308, 0.7058824, 1, 0, 1,
-0.8340785, -1.283477, -2.533798, 0.6980392, 1, 0, 1,
-0.8305368, 0.1733685, -0.4875364, 0.6901961, 1, 0, 1,
-0.8273138, 1.136309, 0.4563898, 0.6862745, 1, 0, 1,
-0.8271332, -1.520804, -2.698944, 0.6784314, 1, 0, 1,
-0.8268111, -1.231636, -2.304767, 0.6745098, 1, 0, 1,
-0.825367, 0.631839, -1.089962, 0.6666667, 1, 0, 1,
-0.8189639, -0.7969986, -1.852831, 0.6627451, 1, 0, 1,
-0.8096636, -0.1411584, -3.025183, 0.654902, 1, 0, 1,
-0.8009183, 0.2733563, -0.147564, 0.6509804, 1, 0, 1,
-0.7901071, 0.2102525, -3.375796, 0.6431373, 1, 0, 1,
-0.7900756, -0.9799722, -2.323882, 0.6392157, 1, 0, 1,
-0.7876074, 0.06462078, -0.2390231, 0.6313726, 1, 0, 1,
-0.7854021, 1.973191, 0.2001565, 0.627451, 1, 0, 1,
-0.7853662, 0.06464418, -2.308955, 0.6196079, 1, 0, 1,
-0.7851353, -0.8465858, -0.9793944, 0.6156863, 1, 0, 1,
-0.7839391, 0.155733, -0.8148437, 0.6078432, 1, 0, 1,
-0.7817854, 1.105981, 0.05825482, 0.6039216, 1, 0, 1,
-0.7793916, -0.400252, -3.799968, 0.5960785, 1, 0, 1,
-0.7746927, -0.5674513, -3.382232, 0.5882353, 1, 0, 1,
-0.7685155, 0.8210737, -1.995602, 0.5843138, 1, 0, 1,
-0.7654508, -0.4927638, -2.168095, 0.5764706, 1, 0, 1,
-0.7608528, -1.312368, -1.769387, 0.572549, 1, 0, 1,
-0.7594141, 0.2358735, -0.1703166, 0.5647059, 1, 0, 1,
-0.7585207, -2.483869, -4.300907, 0.5607843, 1, 0, 1,
-0.7583528, 0.7691046, -0.2899426, 0.5529412, 1, 0, 1,
-0.7549946, 0.8456655, 0.01447106, 0.5490196, 1, 0, 1,
-0.7549192, -0.5035483, -2.366435, 0.5411765, 1, 0, 1,
-0.7490459, -0.5016912, -3.200907, 0.5372549, 1, 0, 1,
-0.7483153, 0.5402724, 0.1589419, 0.5294118, 1, 0, 1,
-0.7479313, 0.2220708, -0.6089869, 0.5254902, 1, 0, 1,
-0.7468932, -3.04436, -3.173744, 0.5176471, 1, 0, 1,
-0.7372341, -0.6838633, -3.613583, 0.5137255, 1, 0, 1,
-0.733509, -1.508814, -4.069902, 0.5058824, 1, 0, 1,
-0.7333063, 0.2395759, 0.2196649, 0.5019608, 1, 0, 1,
-0.7250435, -0.3363577, -2.958555, 0.4941176, 1, 0, 1,
-0.724561, -1.03177, -2.447653, 0.4862745, 1, 0, 1,
-0.7176118, -0.6394265, -1.85842, 0.4823529, 1, 0, 1,
-0.7167919, -1.134466, -2.855528, 0.4745098, 1, 0, 1,
-0.7165985, -0.2252672, -2.152398, 0.4705882, 1, 0, 1,
-0.7080065, -0.7688489, -1.119488, 0.4627451, 1, 0, 1,
-0.7045909, 1.338521, -0.1632376, 0.4588235, 1, 0, 1,
-0.6949906, 1.02097, -1.148649, 0.4509804, 1, 0, 1,
-0.6912237, -0.07166085, -1.176297, 0.4470588, 1, 0, 1,
-0.6907374, 0.06150591, -2.007386, 0.4392157, 1, 0, 1,
-0.6883557, 0.08147084, -1.362841, 0.4352941, 1, 0, 1,
-0.6798725, 0.5476809, -1.411103, 0.427451, 1, 0, 1,
-0.6785701, -0.2507542, -1.826875, 0.4235294, 1, 0, 1,
-0.673281, -1.315501, -1.359533, 0.4156863, 1, 0, 1,
-0.6684247, -1.000567, -3.186136, 0.4117647, 1, 0, 1,
-0.668176, -0.3269813, -1.051011, 0.4039216, 1, 0, 1,
-0.667583, -1.2238, -2.748644, 0.3960784, 1, 0, 1,
-0.6623548, -0.5816246, -2.99999, 0.3921569, 1, 0, 1,
-0.6571159, -0.6359717, -2.454088, 0.3843137, 1, 0, 1,
-0.6522889, -1.329627, -2.460624, 0.3803922, 1, 0, 1,
-0.6511627, -0.3575769, -2.323523, 0.372549, 1, 0, 1,
-0.6508994, 0.0162945, -0.01890971, 0.3686275, 1, 0, 1,
-0.6472428, -0.1133943, -3.156406, 0.3607843, 1, 0, 1,
-0.6448441, -0.9052969, -3.879459, 0.3568628, 1, 0, 1,
-0.6436124, 0.6291836, -2.434496, 0.3490196, 1, 0, 1,
-0.6273171, 0.5554391, -1.559173, 0.345098, 1, 0, 1,
-0.6257107, -0.4050775, -1.371021, 0.3372549, 1, 0, 1,
-0.6256618, 0.1739712, -2.293189, 0.3333333, 1, 0, 1,
-0.625068, -1.971127, -2.644586, 0.3254902, 1, 0, 1,
-0.6246728, -0.9939574, -2.689722, 0.3215686, 1, 0, 1,
-0.622831, 0.7558024, -0.3340167, 0.3137255, 1, 0, 1,
-0.6194384, 0.111213, -2.491499, 0.3098039, 1, 0, 1,
-0.616138, 0.3899189, -0.3255527, 0.3019608, 1, 0, 1,
-0.613363, 1.022068, -0.5244445, 0.2941177, 1, 0, 1,
-0.6099653, -0.9514223, -2.087898, 0.2901961, 1, 0, 1,
-0.6094121, -0.3922303, -1.471042, 0.282353, 1, 0, 1,
-0.6078739, 0.3925469, -1.884748, 0.2784314, 1, 0, 1,
-0.6062444, -0.7774659, -1.548834, 0.2705882, 1, 0, 1,
-0.6024685, 0.9141446, -0.9932418, 0.2666667, 1, 0, 1,
-0.6013878, -0.2655791, -2.377927, 0.2588235, 1, 0, 1,
-0.5979996, -0.01890837, -0.8799906, 0.254902, 1, 0, 1,
-0.5960812, -1.494664, -3.908942, 0.2470588, 1, 0, 1,
-0.5954162, -1.550221, -1.9292, 0.2431373, 1, 0, 1,
-0.5919579, -0.5886469, -3.482478, 0.2352941, 1, 0, 1,
-0.5864967, 1.067429, -1.03477, 0.2313726, 1, 0, 1,
-0.5832451, -0.7561641, -4.175684, 0.2235294, 1, 0, 1,
-0.5804785, -1.611803, -3.268685, 0.2196078, 1, 0, 1,
-0.5748822, 0.3429438, -2.231503, 0.2117647, 1, 0, 1,
-0.5677176, -1.171238, -1.615493, 0.2078431, 1, 0, 1,
-0.5667416, 1.024064, -1.019384, 0.2, 1, 0, 1,
-0.5665189, 1.334706, -0.6163041, 0.1921569, 1, 0, 1,
-0.5623988, -0.3908799, -2.898991, 0.1882353, 1, 0, 1,
-0.5610874, -0.5513536, 0.8902317, 0.1803922, 1, 0, 1,
-0.5606429, -0.3241705, -2.072613, 0.1764706, 1, 0, 1,
-0.5569572, -0.2237027, -0.8433565, 0.1686275, 1, 0, 1,
-0.5558876, 0.06338471, 0.6414796, 0.1647059, 1, 0, 1,
-0.5530582, 0.7660192, -1.476076, 0.1568628, 1, 0, 1,
-0.5523561, -0.860486, -1.864073, 0.1529412, 1, 0, 1,
-0.5487239, 0.1726191, -1.335409, 0.145098, 1, 0, 1,
-0.5471644, -0.8669981, -3.215023, 0.1411765, 1, 0, 1,
-0.5400113, -0.3943739, -3.237274, 0.1333333, 1, 0, 1,
-0.539616, 0.4948144, -2.983833, 0.1294118, 1, 0, 1,
-0.5384657, 1.14725, 1.068118, 0.1215686, 1, 0, 1,
-0.5378683, 1.711712, 1.06183, 0.1176471, 1, 0, 1,
-0.5348276, -0.9990587, -1.095821, 0.1098039, 1, 0, 1,
-0.5269914, -1.623327, -3.016268, 0.1058824, 1, 0, 1,
-0.5258656, 0.4259309, -1.198189, 0.09803922, 1, 0, 1,
-0.5237022, 0.2202496, -0.2440502, 0.09019608, 1, 0, 1,
-0.5214548, 0.1526757, 0.07231101, 0.08627451, 1, 0, 1,
-0.518894, 0.1313426, -1.60695, 0.07843138, 1, 0, 1,
-0.5187946, -0.7469241, -3.590678, 0.07450981, 1, 0, 1,
-0.5148063, -0.5302542, -2.504492, 0.06666667, 1, 0, 1,
-0.5106899, 0.8995593, -1.049398, 0.0627451, 1, 0, 1,
-0.5094495, -0.4404396, -3.706857, 0.05490196, 1, 0, 1,
-0.504083, 0.8265029, -0.3246892, 0.05098039, 1, 0, 1,
-0.5033239, 0.004436913, -1.004929, 0.04313726, 1, 0, 1,
-0.5004926, -0.9084333, 0.3500721, 0.03921569, 1, 0, 1,
-0.4966543, 0.5748807, -0.5432339, 0.03137255, 1, 0, 1,
-0.4945812, -1.406416, -3.863151, 0.02745098, 1, 0, 1,
-0.4930306, 0.0213511, -0.1682725, 0.01960784, 1, 0, 1,
-0.4855205, -1.320134, -4.526032, 0.01568628, 1, 0, 1,
-0.4853963, -0.3074785, -1.876253, 0.007843138, 1, 0, 1,
-0.4853393, -0.7323496, -2.114486, 0.003921569, 1, 0, 1,
-0.4849441, 0.3272721, 0.3329336, 0, 1, 0.003921569, 1,
-0.4844238, 0.839278, -2.636877, 0, 1, 0.01176471, 1,
-0.4743789, -0.5132589, -3.661126, 0, 1, 0.01568628, 1,
-0.4634642, 0.7386885, -0.913389, 0, 1, 0.02352941, 1,
-0.458658, 0.6316494, -0.9598227, 0, 1, 0.02745098, 1,
-0.4582515, 1.529333, 0.4311373, 0, 1, 0.03529412, 1,
-0.4575264, -1.324186, -6.252175, 0, 1, 0.03921569, 1,
-0.4549329, 0.07269195, -0.5994298, 0, 1, 0.04705882, 1,
-0.4509515, 1.214002, 0.3056865, 0, 1, 0.05098039, 1,
-0.4500061, -1.011719, -0.764048, 0, 1, 0.05882353, 1,
-0.4498164, -1.808208, -1.893769, 0, 1, 0.0627451, 1,
-0.4460178, -0.3368428, -1.918894, 0, 1, 0.07058824, 1,
-0.4410802, 0.8769615, -0.1420061, 0, 1, 0.07450981, 1,
-0.4405733, 0.3609347, -0.8830479, 0, 1, 0.08235294, 1,
-0.4343792, -0.1754012, -1.394575, 0, 1, 0.08627451, 1,
-0.433543, 0.01965506, -2.80785, 0, 1, 0.09411765, 1,
-0.4297294, 0.2278782, -2.020909, 0, 1, 0.1019608, 1,
-0.4224551, -0.3658896, -1.303241, 0, 1, 0.1058824, 1,
-0.4204346, -1.062884, -2.210998, 0, 1, 0.1137255, 1,
-0.4196985, 0.7948055, 0.2845232, 0, 1, 0.1176471, 1,
-0.4193488, 0.2697075, -0.8622744, 0, 1, 0.1254902, 1,
-0.4170614, -0.6161165, -1.860883, 0, 1, 0.1294118, 1,
-0.4154362, 1.294412, -1.699515, 0, 1, 0.1372549, 1,
-0.415042, 0.9780275, 0.1485743, 0, 1, 0.1411765, 1,
-0.4064198, -1.897343, -3.136683, 0, 1, 0.1490196, 1,
-0.4025987, 0.8337846, -1.675578, 0, 1, 0.1529412, 1,
-0.400944, 0.6761311, -1.251901, 0, 1, 0.1607843, 1,
-0.4005175, 2.406696, 1.383058, 0, 1, 0.1647059, 1,
-0.3991328, -1.139588, -1.179859, 0, 1, 0.172549, 1,
-0.3974403, -2.351605, -2.454272, 0, 1, 0.1764706, 1,
-0.3966522, 1.218192, 0.437063, 0, 1, 0.1843137, 1,
-0.3875256, 1.059734, -0.7258571, 0, 1, 0.1882353, 1,
-0.3832453, -1.981191, -2.385286, 0, 1, 0.1960784, 1,
-0.3802338, -0.5313348, -2.723402, 0, 1, 0.2039216, 1,
-0.3792294, -0.6157745, -2.138775, 0, 1, 0.2078431, 1,
-0.3776793, 0.7650887, 0.1397436, 0, 1, 0.2156863, 1,
-0.3773682, -0.2426965, -4.35283, 0, 1, 0.2196078, 1,
-0.3759798, -0.2485477, -2.044498, 0, 1, 0.227451, 1,
-0.3705172, 1.358065, -1.413336, 0, 1, 0.2313726, 1,
-0.3654036, -1.415062, -1.023968, 0, 1, 0.2392157, 1,
-0.3579078, -0.3969927, -3.536051, 0, 1, 0.2431373, 1,
-0.3476695, -0.4716656, -1.883441, 0, 1, 0.2509804, 1,
-0.3476652, -0.1014018, -2.54386, 0, 1, 0.254902, 1,
-0.3403834, -0.6636409, -1.855969, 0, 1, 0.2627451, 1,
-0.3386995, 0.7132044, -0.9496643, 0, 1, 0.2666667, 1,
-0.3363422, -1.371932, -5.227222, 0, 1, 0.2745098, 1,
-0.3330986, -0.8035198, -4.008323, 0, 1, 0.2784314, 1,
-0.3320112, -0.3796513, -1.700006, 0, 1, 0.2862745, 1,
-0.3304706, -1.259072, -1.490728, 0, 1, 0.2901961, 1,
-0.3253598, -0.2021068, -3.1817, 0, 1, 0.2980392, 1,
-0.3245768, 1.277676, 0.149238, 0, 1, 0.3058824, 1,
-0.3211209, 0.9811696, 0.8414584, 0, 1, 0.3098039, 1,
-0.3182667, 0.2046266, -0.4128579, 0, 1, 0.3176471, 1,
-0.3168128, -0.5354666, -3.181615, 0, 1, 0.3215686, 1,
-0.3157223, 1.104705, 1.237519, 0, 1, 0.3294118, 1,
-0.315527, 0.03926561, -0.6123869, 0, 1, 0.3333333, 1,
-0.3136913, 0.6829755, -1.476794, 0, 1, 0.3411765, 1,
-0.3127716, -0.329451, -3.035257, 0, 1, 0.345098, 1,
-0.3121937, -0.2670529, -1.247511, 0, 1, 0.3529412, 1,
-0.308468, -0.01827932, -0.7226115, 0, 1, 0.3568628, 1,
-0.30844, -1.211402, -4.23371, 0, 1, 0.3647059, 1,
-0.3012047, 2.059067, 0.4896873, 0, 1, 0.3686275, 1,
-0.3005368, -0.3068571, -2.605483, 0, 1, 0.3764706, 1,
-0.288288, 1.491488, -0.301918, 0, 1, 0.3803922, 1,
-0.2872655, 0.5011895, -0.2833872, 0, 1, 0.3882353, 1,
-0.2837636, -0.6434525, -3.31731, 0, 1, 0.3921569, 1,
-0.2832925, -0.4090534, -3.641519, 0, 1, 0.4, 1,
-0.2823707, 0.4788416, -2.153555, 0, 1, 0.4078431, 1,
-0.2816446, -2.148262, -3.202849, 0, 1, 0.4117647, 1,
-0.2777077, 0.9770513, -1.441018, 0, 1, 0.4196078, 1,
-0.2719941, 1.411585, -0.1376224, 0, 1, 0.4235294, 1,
-0.2711284, -0.8116999, -1.870529, 0, 1, 0.4313726, 1,
-0.2708313, -0.3780786, -2.648133, 0, 1, 0.4352941, 1,
-0.270669, 0.6507629, 0.9249362, 0, 1, 0.4431373, 1,
-0.2614264, -0.7778929, -1.864093, 0, 1, 0.4470588, 1,
-0.2609423, -2.07548, -2.019172, 0, 1, 0.454902, 1,
-0.2594228, -1.086305, -0.8849534, 0, 1, 0.4588235, 1,
-0.2578887, 1.534879, -0.6718721, 0, 1, 0.4666667, 1,
-0.257698, -0.4509215, -2.46066, 0, 1, 0.4705882, 1,
-0.2534438, 0.3499568, -1.644972, 0, 1, 0.4784314, 1,
-0.2519524, -0.4313947, -2.22254, 0, 1, 0.4823529, 1,
-0.2488749, -1.246727, -3.337106, 0, 1, 0.4901961, 1,
-0.2397656, -1.379174, -2.676915, 0, 1, 0.4941176, 1,
-0.2359373, 0.2897316, -0.4269302, 0, 1, 0.5019608, 1,
-0.229692, -1.760427, -1.383481, 0, 1, 0.509804, 1,
-0.228666, 0.7388138, -0.9286841, 0, 1, 0.5137255, 1,
-0.2206421, 1.249091, 0.4058683, 0, 1, 0.5215687, 1,
-0.2204212, 0.603039, 0.9547466, 0, 1, 0.5254902, 1,
-0.2180088, 1.06041, -0.2163431, 0, 1, 0.5333334, 1,
-0.2174324, 0.312177, -1.509893, 0, 1, 0.5372549, 1,
-0.2170302, -1.030304, -3.141334, 0, 1, 0.5450981, 1,
-0.2167639, -0.1980115, -1.966511, 0, 1, 0.5490196, 1,
-0.2133697, -0.2685842, -1.678581, 0, 1, 0.5568628, 1,
-0.2102615, -2.521409, -3.015311, 0, 1, 0.5607843, 1,
-0.2072297, 2.467932, -2.347703, 0, 1, 0.5686275, 1,
-0.2056347, 1.201087, -2.287452, 0, 1, 0.572549, 1,
-0.2031826, -0.9950209, -3.64106, 0, 1, 0.5803922, 1,
-0.1995744, -0.6988197, -3.3281, 0, 1, 0.5843138, 1,
-0.1960619, 0.3629144, 0.2717404, 0, 1, 0.5921569, 1,
-0.1931157, 0.2423276, -0.03188474, 0, 1, 0.5960785, 1,
-0.191891, 0.4788557, -1.270714, 0, 1, 0.6039216, 1,
-0.1916488, 0.9440337, 0.5600625, 0, 1, 0.6117647, 1,
-0.1878938, -0.7094209, -4.318682, 0, 1, 0.6156863, 1,
-0.1869482, -0.06818423, -3.102809, 0, 1, 0.6235294, 1,
-0.1865932, 1.295736, -1.249107, 0, 1, 0.627451, 1,
-0.1853352, -0.2101919, -3.84749, 0, 1, 0.6352941, 1,
-0.1837636, 1.296575, -0.4226465, 0, 1, 0.6392157, 1,
-0.1831819, -1.598882, -2.559973, 0, 1, 0.6470588, 1,
-0.1815379, -0.151549, -1.064247, 0, 1, 0.6509804, 1,
-0.1756772, -2.302426, -3.598993, 0, 1, 0.6588235, 1,
-0.1731582, -0.979944, -2.098764, 0, 1, 0.6627451, 1,
-0.1724158, -0.1999888, -2.345413, 0, 1, 0.6705883, 1,
-0.1676823, 0.4819652, 0.06327891, 0, 1, 0.6745098, 1,
-0.1654528, -0.6482388, -3.437943, 0, 1, 0.682353, 1,
-0.1621033, -1.560372, -3.607983, 0, 1, 0.6862745, 1,
-0.1608971, -2.468791, -4.109772, 0, 1, 0.6941177, 1,
-0.1594352, 0.8366212, 1.115155, 0, 1, 0.7019608, 1,
-0.1558072, -0.5272291, -1.615227, 0, 1, 0.7058824, 1,
-0.1555396, 0.2620215, -1.592592, 0, 1, 0.7137255, 1,
-0.1542553, 0.1975207, -1.526736, 0, 1, 0.7176471, 1,
-0.1533366, 0.1589765, 1.319179, 0, 1, 0.7254902, 1,
-0.1525525, -1.774323, -1.067376, 0, 1, 0.7294118, 1,
-0.15217, 0.4032822, 0.1129421, 0, 1, 0.7372549, 1,
-0.1516202, 0.2867974, -0.02287036, 0, 1, 0.7411765, 1,
-0.1503205, -0.2687232, -3.578346, 0, 1, 0.7490196, 1,
-0.1496505, -1.547499, -1.730279, 0, 1, 0.7529412, 1,
-0.1479075, 0.08871182, 1.087641, 0, 1, 0.7607843, 1,
-0.1467838, 1.659534, -0.6244322, 0, 1, 0.7647059, 1,
-0.1452474, 3.505044, -1.296736, 0, 1, 0.772549, 1,
-0.141881, 0.4778018, -0.8026898, 0, 1, 0.7764706, 1,
-0.1397989, -2.189171, -2.450008, 0, 1, 0.7843137, 1,
-0.1391597, 0.2391877, 0.1916697, 0, 1, 0.7882353, 1,
-0.1380634, 2.058501, 0.9822423, 0, 1, 0.7960784, 1,
-0.1377252, -0.4728228, -2.965237, 0, 1, 0.8039216, 1,
-0.1375248, -0.04904407, -0.7487299, 0, 1, 0.8078431, 1,
-0.1368369, 0.02719236, 0.3656774, 0, 1, 0.8156863, 1,
-0.1364258, 0.9626975, -1.407893, 0, 1, 0.8196079, 1,
-0.1352044, -0.8647968, -3.944321, 0, 1, 0.827451, 1,
-0.130717, -0.2039227, -2.132992, 0, 1, 0.8313726, 1,
-0.1296697, -0.9383028, -3.646327, 0, 1, 0.8392157, 1,
-0.1282924, 0.4443021, 0.559404, 0, 1, 0.8431373, 1,
-0.1278032, -0.5214692, -1.964164, 0, 1, 0.8509804, 1,
-0.1272775, 0.1955322, 0.5195517, 0, 1, 0.854902, 1,
-0.1266904, 1.149016, 0.2936693, 0, 1, 0.8627451, 1,
-0.1247906, 0.3747536, -1.16218, 0, 1, 0.8666667, 1,
-0.1245449, -0.270144, -2.016113, 0, 1, 0.8745098, 1,
-0.1233716, -1.195485, -2.907208, 0, 1, 0.8784314, 1,
-0.1160169, -2.109104, -2.589857, 0, 1, 0.8862745, 1,
-0.1148682, -1.048255, -2.694724, 0, 1, 0.8901961, 1,
-0.1119718, 1.319315, 1.439068, 0, 1, 0.8980392, 1,
-0.1071083, -0.7877145, -3.749629, 0, 1, 0.9058824, 1,
-0.09798763, 0.7965819, -0.4353923, 0, 1, 0.9098039, 1,
-0.09787665, -1.188229, -2.950064, 0, 1, 0.9176471, 1,
-0.09784865, -0.4057922, -2.385193, 0, 1, 0.9215686, 1,
-0.09120286, 1.102398, -0.05238622, 0, 1, 0.9294118, 1,
-0.08690751, 1.021678, -0.6234722, 0, 1, 0.9333333, 1,
-0.0860299, 1.421315, 0.9872951, 0, 1, 0.9411765, 1,
-0.08318296, 1.489555, -0.5561326, 0, 1, 0.945098, 1,
-0.07980271, -1.56142, -2.578706, 0, 1, 0.9529412, 1,
-0.07839235, -0.6447371, -1.90337, 0, 1, 0.9568627, 1,
-0.07592051, -2.913191, -2.092443, 0, 1, 0.9647059, 1,
-0.07561707, -1.163448, -2.852339, 0, 1, 0.9686275, 1,
-0.07359724, 0.7490769, 1.667696, 0, 1, 0.9764706, 1,
-0.07200857, -1.882351, -4.332103, 0, 1, 0.9803922, 1,
-0.06737211, -1.014067, -2.393976, 0, 1, 0.9882353, 1,
-0.06507218, 0.331979, -0.6827068, 0, 1, 0.9921569, 1,
-0.06440824, 0.809344, -0.4808686, 0, 1, 1, 1,
-0.0637754, -0.05750873, -1.429265, 0, 0.9921569, 1, 1,
-0.0625684, -0.7017933, -3.185624, 0, 0.9882353, 1, 1,
-0.06222751, -0.4208114, -0.9354294, 0, 0.9803922, 1, 1,
-0.06027409, -0.8431109, -3.069337, 0, 0.9764706, 1, 1,
-0.05981109, -0.09529231, -3.830001, 0, 0.9686275, 1, 1,
-0.05926212, -1.046269, -4.407071, 0, 0.9647059, 1, 1,
-0.05778772, 1.942933, 0.5248404, 0, 0.9568627, 1, 1,
-0.05620036, 1.02446, -1.505677, 0, 0.9529412, 1, 1,
-0.05159926, -1.391177, -2.714703, 0, 0.945098, 1, 1,
-0.04782908, -0.3601398, -2.908551, 0, 0.9411765, 1, 1,
-0.04771709, -0.08031957, -1.85629, 0, 0.9333333, 1, 1,
-0.04548041, -1.589025, -2.652732, 0, 0.9294118, 1, 1,
-0.04101046, -0.7030402, -0.5739705, 0, 0.9215686, 1, 1,
-0.04096739, -0.4318084, -3.430446, 0, 0.9176471, 1, 1,
-0.03897669, -1.327214, -2.874557, 0, 0.9098039, 1, 1,
-0.03398547, -1.498814, -4.144263, 0, 0.9058824, 1, 1,
-0.0321606, -0.6963505, -3.133213, 0, 0.8980392, 1, 1,
-0.03020412, 2.051289, 0.7638363, 0, 0.8901961, 1, 1,
-0.02880118, -0.8432437, -1.828326, 0, 0.8862745, 1, 1,
-0.02706138, 0.2927939, -1.384897, 0, 0.8784314, 1, 1,
-0.02464224, 0.5149752, -0.4988009, 0, 0.8745098, 1, 1,
-0.02242537, -1.060822, -3.737673, 0, 0.8666667, 1, 1,
-0.0210437, 1.694261, 0.3168025, 0, 0.8627451, 1, 1,
-0.01703557, 0.2058045, -1.083426, 0, 0.854902, 1, 1,
-0.01647459, -1.448361, -4.555005, 0, 0.8509804, 1, 1,
-0.009679923, 0.4181799, -0.2438896, 0, 0.8431373, 1, 1,
-0.008230645, 0.4100895, -1.220755, 0, 0.8392157, 1, 1,
-0.006803624, 0.1261931, 0.6426413, 0, 0.8313726, 1, 1,
-0.002970774, 1.243023, -0.3454373, 0, 0.827451, 1, 1,
-0.002023051, 0.6028745, -0.31287, 0, 0.8196079, 1, 1,
-0.001532666, -0.3823923, -3.281784, 0, 0.8156863, 1, 1,
-0.001499458, 0.9279899, 1.033074, 0, 0.8078431, 1, 1,
0.002252949, 0.8419616, 2.059813, 0, 0.8039216, 1, 1,
0.009697076, -0.463998, 2.267694, 0, 0.7960784, 1, 1,
0.009998856, 0.4744996, 0.08539733, 0, 0.7882353, 1, 1,
0.01232323, 1.079283, 2.223248, 0, 0.7843137, 1, 1,
0.01411396, -1.904227, 3.606576, 0, 0.7764706, 1, 1,
0.01516501, 0.6891085, 1.891133, 0, 0.772549, 1, 1,
0.01691014, -1.474369, 4.677703, 0, 0.7647059, 1, 1,
0.01974841, 1.012742, -0.07544107, 0, 0.7607843, 1, 1,
0.0202083, 0.5136418, -0.6409728, 0, 0.7529412, 1, 1,
0.02551753, 0.923637, 0.1064941, 0, 0.7490196, 1, 1,
0.02593773, -0.6663082, 2.164179, 0, 0.7411765, 1, 1,
0.03060299, 0.3297146, -0.8546433, 0, 0.7372549, 1, 1,
0.03357075, 1.978139, 0.3306037, 0, 0.7294118, 1, 1,
0.03378733, -0.2037589, 2.298187, 0, 0.7254902, 1, 1,
0.03443995, 0.7303212, 1.933152, 0, 0.7176471, 1, 1,
0.03522489, -0.9687101, 2.001959, 0, 0.7137255, 1, 1,
0.03525973, 0.2162513, 2.328249, 0, 0.7058824, 1, 1,
0.03999144, 0.8478789, 0.385543, 0, 0.6980392, 1, 1,
0.04757408, 0.7642282, -0.3500368, 0, 0.6941177, 1, 1,
0.05107039, -2.978506, 3.018773, 0, 0.6862745, 1, 1,
0.05781684, -0.2019518, 2.101224, 0, 0.682353, 1, 1,
0.05900115, -0.7806802, 1.372863, 0, 0.6745098, 1, 1,
0.06379384, 0.6406457, 2.075613, 0, 0.6705883, 1, 1,
0.06864037, -0.3821121, 2.382313, 0, 0.6627451, 1, 1,
0.07538403, -1.723411, 2.836699, 0, 0.6588235, 1, 1,
0.08023384, -1.143777, 3.361667, 0, 0.6509804, 1, 1,
0.08083909, -0.7438905, 2.424579, 0, 0.6470588, 1, 1,
0.08287235, 0.005436128, 1.661268, 0, 0.6392157, 1, 1,
0.08668032, -0.0424259, 2.398937, 0, 0.6352941, 1, 1,
0.08709661, 0.7214349, 0.8517421, 0, 0.627451, 1, 1,
0.08786815, -0.1534587, 2.603717, 0, 0.6235294, 1, 1,
0.08809853, 0.1118035, 0.6065779, 0, 0.6156863, 1, 1,
0.09245972, 0.4815865, 0.5418501, 0, 0.6117647, 1, 1,
0.09264478, 0.3755982, 3.204136, 0, 0.6039216, 1, 1,
0.0934926, -2.157342, 2.41187, 0, 0.5960785, 1, 1,
0.09543838, 0.5110976, -0.5863982, 0, 0.5921569, 1, 1,
0.09564713, -0.5142975, 4.736993, 0, 0.5843138, 1, 1,
0.097386, 1.250997, 0.850423, 0, 0.5803922, 1, 1,
0.1055555, -0.6186054, 2.054316, 0, 0.572549, 1, 1,
0.1077515, 0.1007001, 0.1195844, 0, 0.5686275, 1, 1,
0.1091111, 1.431741, 1.668095, 0, 0.5607843, 1, 1,
0.1093464, 1.423633, -0.8564724, 0, 0.5568628, 1, 1,
0.1095257, 1.014342, -1.730237, 0, 0.5490196, 1, 1,
0.1108607, 1.628996, 0.3159264, 0, 0.5450981, 1, 1,
0.1195147, 0.09539894, 0.7139933, 0, 0.5372549, 1, 1,
0.1238301, 1.411842, 0.8365442, 0, 0.5333334, 1, 1,
0.1259432, 1.123855, -1.242859, 0, 0.5254902, 1, 1,
0.1279134, 0.02386713, 1.66658, 0, 0.5215687, 1, 1,
0.1308942, -0.1710731, 3.001128, 0, 0.5137255, 1, 1,
0.1348599, 0.8301043, -0.4104168, 0, 0.509804, 1, 1,
0.1353942, -0.540758, 3.716514, 0, 0.5019608, 1, 1,
0.1381853, -0.5007246, 2.887325, 0, 0.4941176, 1, 1,
0.1383553, 0.5182995, 0.9736816, 0, 0.4901961, 1, 1,
0.1424435, -1.182244, 2.991542, 0, 0.4823529, 1, 1,
0.1485054, 1.357605, -1.845301, 0, 0.4784314, 1, 1,
0.1545909, 0.3200391, 1.571585, 0, 0.4705882, 1, 1,
0.1564134, -0.2091013, 3.163392, 0, 0.4666667, 1, 1,
0.1578677, -1.688363, 1.881131, 0, 0.4588235, 1, 1,
0.1625728, 0.08289713, 0.7978865, 0, 0.454902, 1, 1,
0.1627126, -0.6311348, 3.36974, 0, 0.4470588, 1, 1,
0.1651063, 0.21588, 2.703592, 0, 0.4431373, 1, 1,
0.165843, -0.3423907, 4.035102, 0, 0.4352941, 1, 1,
0.1669274, 1.311652, 0.4137356, 0, 0.4313726, 1, 1,
0.1677001, 0.9090573, -0.7931519, 0, 0.4235294, 1, 1,
0.1732687, -0.5639529, 3.253982, 0, 0.4196078, 1, 1,
0.1767206, 0.1238012, 0.6704985, 0, 0.4117647, 1, 1,
0.1788246, 0.9775394, 1.324709, 0, 0.4078431, 1, 1,
0.1795763, -0.3382393, 2.556526, 0, 0.4, 1, 1,
0.1879279, 1.089377, 0.5495154, 0, 0.3921569, 1, 1,
0.1901024, -1.314215, 4.09798, 0, 0.3882353, 1, 1,
0.1901656, 0.4712652, -0.6136364, 0, 0.3803922, 1, 1,
0.1914082, 0.07227571, 2.517134, 0, 0.3764706, 1, 1,
0.1945827, 0.6072575, -0.1792291, 0, 0.3686275, 1, 1,
0.1985764, 0.4328988, 1.86543, 0, 0.3647059, 1, 1,
0.2015748, 0.7940425, -1.031489, 0, 0.3568628, 1, 1,
0.2052489, 0.4570227, 0.9669891, 0, 0.3529412, 1, 1,
0.2167782, 0.1771897, 1.605348, 0, 0.345098, 1, 1,
0.2187206, 0.08618288, 1.031634, 0, 0.3411765, 1, 1,
0.2207652, -2.34044, 2.587014, 0, 0.3333333, 1, 1,
0.2208443, -1.186607, 1.735126, 0, 0.3294118, 1, 1,
0.2244442, 0.09081933, 0.3351671, 0, 0.3215686, 1, 1,
0.2247763, -1.593913, 2.575128, 0, 0.3176471, 1, 1,
0.2253763, 0.6915333, -2.063919, 0, 0.3098039, 1, 1,
0.2263202, 1.465801, -0.06494648, 0, 0.3058824, 1, 1,
0.2302739, -1.563028, 2.259195, 0, 0.2980392, 1, 1,
0.2321729, 2.5443, -0.4765008, 0, 0.2901961, 1, 1,
0.2328516, 0.3498525, 0.0907005, 0, 0.2862745, 1, 1,
0.2346415, -0.0219014, 0.4664528, 0, 0.2784314, 1, 1,
0.2366749, -0.5013329, 2.595897, 0, 0.2745098, 1, 1,
0.2367342, -1.49458, 2.015993, 0, 0.2666667, 1, 1,
0.2390207, -0.5265888, 1.528962, 0, 0.2627451, 1, 1,
0.2396286, 0.8369694, 1.111133, 0, 0.254902, 1, 1,
0.2400843, 1.045084, 1.229639, 0, 0.2509804, 1, 1,
0.240712, -0.1410688, 2.815394, 0, 0.2431373, 1, 1,
0.2462212, -0.2059634, 2.113775, 0, 0.2392157, 1, 1,
0.246822, 2.314131, -0.1394758, 0, 0.2313726, 1, 1,
0.2520067, 0.5131308, 0.3664218, 0, 0.227451, 1, 1,
0.2537274, 1.352476, -2.46795, 0, 0.2196078, 1, 1,
0.2546257, 1.041243, 0.2850327, 0, 0.2156863, 1, 1,
0.255743, 1.385239, 1.716414, 0, 0.2078431, 1, 1,
0.2561556, 1.00668, -0.07711874, 0, 0.2039216, 1, 1,
0.2601334, -0.5805132, 3.15171, 0, 0.1960784, 1, 1,
0.2601892, -1.239135, 3.541626, 0, 0.1882353, 1, 1,
0.2602861, -2.040555, 2.823436, 0, 0.1843137, 1, 1,
0.264251, -0.8571853, 2.105504, 0, 0.1764706, 1, 1,
0.266154, -0.6959902, 0.8625593, 0, 0.172549, 1, 1,
0.267909, 1.232254, -2.160142, 0, 0.1647059, 1, 1,
0.2724511, 1.489462, 0.9509435, 0, 0.1607843, 1, 1,
0.2729075, 0.9963617, -0.5553583, 0, 0.1529412, 1, 1,
0.2757703, 0.6087652, 1.134182, 0, 0.1490196, 1, 1,
0.2775888, -0.6132048, 2.746511, 0, 0.1411765, 1, 1,
0.2799496, 0.696, -0.3692786, 0, 0.1372549, 1, 1,
0.2813619, -0.7662758, 0.4472066, 0, 0.1294118, 1, 1,
0.2851034, 0.1992204, 2.062286, 0, 0.1254902, 1, 1,
0.2861563, 0.3883013, 0.6836966, 0, 0.1176471, 1, 1,
0.2910699, 0.4859419, -0.05237151, 0, 0.1137255, 1, 1,
0.2955222, -1.354073, 2.036039, 0, 0.1058824, 1, 1,
0.2964587, 0.7440113, -0.2793797, 0, 0.09803922, 1, 1,
0.3005555, -0.8267822, 1.935427, 0, 0.09411765, 1, 1,
0.3044801, -1.170235, 1.884201, 0, 0.08627451, 1, 1,
0.3093939, -0.0193518, 2.06118, 0, 0.08235294, 1, 1,
0.3119724, 1.044994, 0.8263851, 0, 0.07450981, 1, 1,
0.3153913, 0.83178, 0.640955, 0, 0.07058824, 1, 1,
0.3176541, -0.2097993, 1.342112, 0, 0.0627451, 1, 1,
0.3222085, -2.090894, 2.81544, 0, 0.05882353, 1, 1,
0.3323804, 1.854471, 1.408249, 0, 0.05098039, 1, 1,
0.3323913, -1.107299, 2.40596, 0, 0.04705882, 1, 1,
0.3397924, 0.6293794, 0.5227737, 0, 0.03921569, 1, 1,
0.3438362, -0.4782325, 1.765842, 0, 0.03529412, 1, 1,
0.3466983, -1.17074, 3.48869, 0, 0.02745098, 1, 1,
0.3534411, -0.07647683, 2.227914, 0, 0.02352941, 1, 1,
0.3595343, 0.9953573, 1.368502, 0, 0.01568628, 1, 1,
0.3598925, 0.3270676, 0.3151006, 0, 0.01176471, 1, 1,
0.3610292, -0.3246612, 3.214551, 0, 0.003921569, 1, 1,
0.3610622, -0.839172, 2.87415, 0.003921569, 0, 1, 1,
0.3611552, 1.640975, 0.4577314, 0.007843138, 0, 1, 1,
0.3634487, 2.740011, -0.9609186, 0.01568628, 0, 1, 1,
0.3673741, -0.1278396, 2.8242, 0.01960784, 0, 1, 1,
0.3866044, 0.04429699, 0.468676, 0.02745098, 0, 1, 1,
0.3907548, 1.528773, 0.3665421, 0.03137255, 0, 1, 1,
0.392886, -1.043277, 1.098075, 0.03921569, 0, 1, 1,
0.3939537, 0.3329723, 0.6866307, 0.04313726, 0, 1, 1,
0.3998708, 0.5900294, 1.670779, 0.05098039, 0, 1, 1,
0.4027377, -0.07281853, 2.357421, 0.05490196, 0, 1, 1,
0.4032647, 1.365106, 1.67209, 0.0627451, 0, 1, 1,
0.4053044, -2.105173, 2.826233, 0.06666667, 0, 1, 1,
0.4073362, -0.8349044, 1.793912, 0.07450981, 0, 1, 1,
0.4080403, -2.256712, 3.879763, 0.07843138, 0, 1, 1,
0.4083932, 0.6313419, 1.433897, 0.08627451, 0, 1, 1,
0.409239, -0.04148482, 2.356994, 0.09019608, 0, 1, 1,
0.4139118, 1.317635, -0.4283388, 0.09803922, 0, 1, 1,
0.4143285, -0.4882464, 2.652757, 0.1058824, 0, 1, 1,
0.4239223, -1.053643, 4.424079, 0.1098039, 0, 1, 1,
0.4260353, 1.264878, 0.8835119, 0.1176471, 0, 1, 1,
0.4271483, 1.610383, 0.6680672, 0.1215686, 0, 1, 1,
0.4274261, 0.9480729, -0.1908323, 0.1294118, 0, 1, 1,
0.4323516, -1.081996, 1.35759, 0.1333333, 0, 1, 1,
0.4338962, 1.775261, 1.209103, 0.1411765, 0, 1, 1,
0.4358884, 0.3781414, -0.02957904, 0.145098, 0, 1, 1,
0.4390696, -1.08188, 2.978658, 0.1529412, 0, 1, 1,
0.4405034, 0.8522382, 0.09758703, 0.1568628, 0, 1, 1,
0.4405977, -0.6681027, 2.717866, 0.1647059, 0, 1, 1,
0.4449969, 0.9229329, 0.4395101, 0.1686275, 0, 1, 1,
0.4450936, -0.4079926, 3.224456, 0.1764706, 0, 1, 1,
0.4504313, -0.5436232, 2.263213, 0.1803922, 0, 1, 1,
0.4515323, 0.3498951, 0.7654998, 0.1882353, 0, 1, 1,
0.4518256, -0.4514071, 2.652751, 0.1921569, 0, 1, 1,
0.4549157, -0.09955996, 1.575616, 0.2, 0, 1, 1,
0.4604689, 0.8072651, 0.7272022, 0.2078431, 0, 1, 1,
0.4617296, -0.05188652, 1.246774, 0.2117647, 0, 1, 1,
0.4630443, -0.5776744, 3.601094, 0.2196078, 0, 1, 1,
0.4690684, -1.375578, 3.296112, 0.2235294, 0, 1, 1,
0.4696987, 0.9606043, 0.1891821, 0.2313726, 0, 1, 1,
0.4801168, 0.9392723, -0.3827544, 0.2352941, 0, 1, 1,
0.4810241, -0.10761, 1.303951, 0.2431373, 0, 1, 1,
0.4828832, 0.2334995, 0.6743283, 0.2470588, 0, 1, 1,
0.4833393, -1.121209, 3.787153, 0.254902, 0, 1, 1,
0.4840518, 1.069528, 2.04122, 0.2588235, 0, 1, 1,
0.4872835, -0.04310511, 0.8338339, 0.2666667, 0, 1, 1,
0.4889652, 0.7735599, 0.6173418, 0.2705882, 0, 1, 1,
0.4905775, 0.5535875, -0.8716934, 0.2784314, 0, 1, 1,
0.4930612, -0.2510079, 2.409609, 0.282353, 0, 1, 1,
0.5087307, 0.06930104, 1.316855, 0.2901961, 0, 1, 1,
0.5150116, 1.514151, -0.242036, 0.2941177, 0, 1, 1,
0.5222805, 0.7430896, 0.1316306, 0.3019608, 0, 1, 1,
0.5251855, 0.1015339, 1.6782, 0.3098039, 0, 1, 1,
0.5336986, 0.4336244, -0.3346273, 0.3137255, 0, 1, 1,
0.5364092, 0.08318875, 2.115321, 0.3215686, 0, 1, 1,
0.539772, -1.382848, 3.669339, 0.3254902, 0, 1, 1,
0.5470934, 0.3174939, 0.1870362, 0.3333333, 0, 1, 1,
0.5486641, -0.1224553, 4.466161, 0.3372549, 0, 1, 1,
0.5530028, -1.0743, 3.358878, 0.345098, 0, 1, 1,
0.5587393, -0.3647308, 1.407101, 0.3490196, 0, 1, 1,
0.5618275, 0.2904683, 1.079072, 0.3568628, 0, 1, 1,
0.5622775, 0.6438764, 0.8728402, 0.3607843, 0, 1, 1,
0.5650711, -2.467623, 2.755501, 0.3686275, 0, 1, 1,
0.5781084, -0.4506046, 2.332867, 0.372549, 0, 1, 1,
0.5829961, -0.7213963, 1.71951, 0.3803922, 0, 1, 1,
0.5859129, -2.668187, 2.752, 0.3843137, 0, 1, 1,
0.5881582, 2.308315, -1.882999, 0.3921569, 0, 1, 1,
0.5941125, -1.483808, 3.254428, 0.3960784, 0, 1, 1,
0.5974815, 0.6548699, -0.1483274, 0.4039216, 0, 1, 1,
0.6081895, 0.2454551, 0.4609537, 0.4117647, 0, 1, 1,
0.6170799, -0.3933862, 2.873527, 0.4156863, 0, 1, 1,
0.6192272, 1.473315, 0.4090853, 0.4235294, 0, 1, 1,
0.623888, 0.7782869, 1.597597, 0.427451, 0, 1, 1,
0.6247018, -0.1047833, 0.9789697, 0.4352941, 0, 1, 1,
0.6253106, 1.075794, -1.175085, 0.4392157, 0, 1, 1,
0.6275077, 0.2689967, 1.664482, 0.4470588, 0, 1, 1,
0.6298171, 0.01006548, 4.154183, 0.4509804, 0, 1, 1,
0.6313404, 0.7787043, 0.6075941, 0.4588235, 0, 1, 1,
0.633462, -0.9119879, 3.447979, 0.4627451, 0, 1, 1,
0.6381229, -0.8725095, 6.168863, 0.4705882, 0, 1, 1,
0.6401362, 0.3379941, 0.4471157, 0.4745098, 0, 1, 1,
0.6441201, 0.8450072, 1.499724, 0.4823529, 0, 1, 1,
0.6487293, -0.3754458, 3.145216, 0.4862745, 0, 1, 1,
0.6522625, 0.2047287, 2.164185, 0.4941176, 0, 1, 1,
0.6600251, -0.999683, 3.330039, 0.5019608, 0, 1, 1,
0.6620516, -0.8359241, 2.868431, 0.5058824, 0, 1, 1,
0.664311, 1.364325, 1.943421, 0.5137255, 0, 1, 1,
0.6682178, 0.6757363, 0.3975489, 0.5176471, 0, 1, 1,
0.6725106, -0.854628, 1.845018, 0.5254902, 0, 1, 1,
0.6849191, 0.2135996, 0.7022125, 0.5294118, 0, 1, 1,
0.6853182, 2.792952, 0.3026066, 0.5372549, 0, 1, 1,
0.6876839, -0.1402506, 2.377637, 0.5411765, 0, 1, 1,
0.6906266, -0.2735429, 0.671554, 0.5490196, 0, 1, 1,
0.6914883, -1.949346, 2.615297, 0.5529412, 0, 1, 1,
0.7023763, 0.9442161, -0.5351248, 0.5607843, 0, 1, 1,
0.7032589, 0.7574888, 1.04676, 0.5647059, 0, 1, 1,
0.7048426, -0.4043729, 4.202575, 0.572549, 0, 1, 1,
0.7072192, -0.7290075, 2.38975, 0.5764706, 0, 1, 1,
0.7162392, -1.783117, 2.666619, 0.5843138, 0, 1, 1,
0.7208259, 0.5827814, 2.418489, 0.5882353, 0, 1, 1,
0.7229258, 1.00123, 0.3273991, 0.5960785, 0, 1, 1,
0.7297446, -0.8656914, 1.16676, 0.6039216, 0, 1, 1,
0.7339207, 1.453596, -0.09728152, 0.6078432, 0, 1, 1,
0.7390503, 0.2258811, -0.08515731, 0.6156863, 0, 1, 1,
0.7402987, 0.1299938, 1.02016, 0.6196079, 0, 1, 1,
0.7423432, -1.312354, 1.345053, 0.627451, 0, 1, 1,
0.7474195, -0.7864354, 2.128019, 0.6313726, 0, 1, 1,
0.7474332, -0.1633502, 0.7880177, 0.6392157, 0, 1, 1,
0.7554969, 0.5393434, -1.257332, 0.6431373, 0, 1, 1,
0.7669652, 0.3181141, 2.688445, 0.6509804, 0, 1, 1,
0.7740476, -0.8297179, 2.79222, 0.654902, 0, 1, 1,
0.7754296, -1.043799, 3.131095, 0.6627451, 0, 1, 1,
0.7760624, 0.1269255, 2.474494, 0.6666667, 0, 1, 1,
0.7763029, -0.6330136, 1.069281, 0.6745098, 0, 1, 1,
0.7811456, -1.06575, 2.169458, 0.6784314, 0, 1, 1,
0.7854552, 0.8242629, 0.02179134, 0.6862745, 0, 1, 1,
0.7947798, -0.9567223, 2.781138, 0.6901961, 0, 1, 1,
0.7958419, 0.250056, -0.003973583, 0.6980392, 0, 1, 1,
0.8023435, -1.970723, 3.525004, 0.7058824, 0, 1, 1,
0.8088655, -0.09618113, 0.9204061, 0.7098039, 0, 1, 1,
0.8162872, -2.240238, 2.563241, 0.7176471, 0, 1, 1,
0.8189871, 0.1891636, 1.230923, 0.7215686, 0, 1, 1,
0.8222514, 1.022401, -1.411326, 0.7294118, 0, 1, 1,
0.8248193, -0.3655751, 2.764631, 0.7333333, 0, 1, 1,
0.8301085, -2.199474, 1.905178, 0.7411765, 0, 1, 1,
0.8313523, 0.07375297, 1.357335, 0.7450981, 0, 1, 1,
0.8313951, -1.555387, 1.813156, 0.7529412, 0, 1, 1,
0.8384635, 0.3043795, 1.932778, 0.7568628, 0, 1, 1,
0.8386801, -0.2720876, 1.709736, 0.7647059, 0, 1, 1,
0.8423373, -0.3162201, 4.067317, 0.7686275, 0, 1, 1,
0.8427767, 0.165261, 0.3532665, 0.7764706, 0, 1, 1,
0.8448132, -0.6420941, 2.076101, 0.7803922, 0, 1, 1,
0.84738, -3.327438, 2.778226, 0.7882353, 0, 1, 1,
0.8488291, 0.473222, -0.008771461, 0.7921569, 0, 1, 1,
0.8499799, 0.696984, 1.691766, 0.8, 0, 1, 1,
0.8523363, -0.8239411, 3.14197, 0.8078431, 0, 1, 1,
0.8578672, -1.495931, 3.170775, 0.8117647, 0, 1, 1,
0.8623087, 0.1629215, 0.6020387, 0.8196079, 0, 1, 1,
0.8714327, 0.4290412, 1.572, 0.8235294, 0, 1, 1,
0.8723956, -0.4701436, 2.572498, 0.8313726, 0, 1, 1,
0.8738185, 0.7041911, 0.2828285, 0.8352941, 0, 1, 1,
0.8741238, -0.4962844, 2.506577, 0.8431373, 0, 1, 1,
0.8769424, 0.5215607, 1.696151, 0.8470588, 0, 1, 1,
0.8777654, -0.7183075, 1.952692, 0.854902, 0, 1, 1,
0.8805467, -1.709774, 2.666212, 0.8588235, 0, 1, 1,
0.8814661, -1.125088, 3.486364, 0.8666667, 0, 1, 1,
0.899393, 1.290225, -0.7633814, 0.8705882, 0, 1, 1,
0.9069096, -0.0345739, 2.149739, 0.8784314, 0, 1, 1,
0.90996, 3.081621, 0.07096855, 0.8823529, 0, 1, 1,
0.9125925, 1.195938, 0.571634, 0.8901961, 0, 1, 1,
0.9161259, 1.243776, 2.615682, 0.8941177, 0, 1, 1,
0.9177805, -0.02133579, 1.66408, 0.9019608, 0, 1, 1,
0.9311774, 0.2208193, 2.148183, 0.9098039, 0, 1, 1,
0.9373113, 0.817179, 1.22698, 0.9137255, 0, 1, 1,
0.9378715, -0.3974093, 2.993016, 0.9215686, 0, 1, 1,
0.9497612, -0.509567, 1.923365, 0.9254902, 0, 1, 1,
0.9498507, 0.5049211, 1.989565, 0.9333333, 0, 1, 1,
0.9503514, 0.5193409, -0.6465766, 0.9372549, 0, 1, 1,
0.9552889, -1.207235, 2.493668, 0.945098, 0, 1, 1,
0.9562845, 0.5859975, 1.81173, 0.9490196, 0, 1, 1,
0.9586891, -0.07721481, 2.473674, 0.9568627, 0, 1, 1,
0.960273, 0.1344893, 1.140922, 0.9607843, 0, 1, 1,
0.9624157, -1.357016, 2.270474, 0.9686275, 0, 1, 1,
0.9637807, -1.125275, 1.314283, 0.972549, 0, 1, 1,
0.9664109, 0.6446755, 2.377383, 0.9803922, 0, 1, 1,
0.9673163, 0.8539732, -0.293464, 0.9843137, 0, 1, 1,
0.9735901, 0.02420154, 3.36911, 0.9921569, 0, 1, 1,
0.9755197, -0.6446604, 1.8316, 0.9960784, 0, 1, 1,
0.9756843, 1.448403, 0.2590687, 1, 0, 0.9960784, 1,
0.9773385, 1.177987, 0.7771721, 1, 0, 0.9882353, 1,
0.9781387, -0.358432, 1.192151, 1, 0, 0.9843137, 1,
0.9788327, -0.32004, 1.982002, 1, 0, 0.9764706, 1,
0.9853925, -0.4826693, -0.4893427, 1, 0, 0.972549, 1,
0.9991607, 0.1552604, 3.808881, 1, 0, 0.9647059, 1,
1.001338, 0.1515399, 0.4900742, 1, 0, 0.9607843, 1,
1.003619, -0.4776706, 1.691643, 1, 0, 0.9529412, 1,
1.01141, 0.4167621, 1.638653, 1, 0, 0.9490196, 1,
1.012627, -0.34773, 4.199378, 1, 0, 0.9411765, 1,
1.01497, 0.8281816, 1.863279, 1, 0, 0.9372549, 1,
1.015851, -0.01060175, 1.830576, 1, 0, 0.9294118, 1,
1.027307, -0.9831024, 1.979145, 1, 0, 0.9254902, 1,
1.029111, -0.8233486, 5.208729, 1, 0, 0.9176471, 1,
1.030566, -0.609173, 3.774245, 1, 0, 0.9137255, 1,
1.033733, -0.6346568, 3.759343, 1, 0, 0.9058824, 1,
1.037785, 0.3849889, 0.5069383, 1, 0, 0.9019608, 1,
1.038233, 0.4099451, -1.349428, 1, 0, 0.8941177, 1,
1.046589, -1.807206, 1.658122, 1, 0, 0.8862745, 1,
1.048304, 0.3095475, 1.769659, 1, 0, 0.8823529, 1,
1.051944, 0.6102778, 0.07677884, 1, 0, 0.8745098, 1,
1.052649, -0.440949, 1.509657, 1, 0, 0.8705882, 1,
1.053092, 0.294583, 2.639848, 1, 0, 0.8627451, 1,
1.053783, 0.1638319, 0.7649509, 1, 0, 0.8588235, 1,
1.054615, -0.7881189, 1.836767, 1, 0, 0.8509804, 1,
1.056663, 0.02568077, 1.159949, 1, 0, 0.8470588, 1,
1.057946, -2.479809, 4.204435, 1, 0, 0.8392157, 1,
1.063727, 1.248722, 0.441119, 1, 0, 0.8352941, 1,
1.064713, -0.5398557, 2.398345, 1, 0, 0.827451, 1,
1.067617, 0.7134559, 1.442724, 1, 0, 0.8235294, 1,
1.070035, 1.059057, 1.283781, 1, 0, 0.8156863, 1,
1.074538, -0.8995341, 4.197857, 1, 0, 0.8117647, 1,
1.075376, 0.673322, 0.6619303, 1, 0, 0.8039216, 1,
1.079497, -0.02786981, 2.545178, 1, 0, 0.7960784, 1,
1.080799, -0.8117323, 1.815442, 1, 0, 0.7921569, 1,
1.101701, 1.303409, -0.254454, 1, 0, 0.7843137, 1,
1.102173, -0.5716638, 1.834543, 1, 0, 0.7803922, 1,
1.103091, 1.420324, -1.249067, 1, 0, 0.772549, 1,
1.111136, 0.9048381, 1.299457, 1, 0, 0.7686275, 1,
1.114221, -2.533775, 3.883756, 1, 0, 0.7607843, 1,
1.123428, -0.1423905, 1.636432, 1, 0, 0.7568628, 1,
1.124297, -1.673611, 4.536155, 1, 0, 0.7490196, 1,
1.124688, 0.4185532, 2.244918, 1, 0, 0.7450981, 1,
1.128796, -1.04807, 2.48089, 1, 0, 0.7372549, 1,
1.139504, 0.3660828, 2.576308, 1, 0, 0.7333333, 1,
1.139863, 0.5599962, 2.697121, 1, 0, 0.7254902, 1,
1.147066, -0.2834595, -0.726162, 1, 0, 0.7215686, 1,
1.149535, 0.0479557, 0.9269626, 1, 0, 0.7137255, 1,
1.149908, -0.04392892, 3.308057, 1, 0, 0.7098039, 1,
1.159559, 2.44073, 0.05583995, 1, 0, 0.7019608, 1,
1.169768, 0.1397927, 1.227768, 1, 0, 0.6941177, 1,
1.170182, -0.4539834, 0.763265, 1, 0, 0.6901961, 1,
1.173478, -0.4087618, 2.665338, 1, 0, 0.682353, 1,
1.180647, 0.5584542, 0.9203952, 1, 0, 0.6784314, 1,
1.191677, -0.4503646, 2.342175, 1, 0, 0.6705883, 1,
1.195403, -1.46606, 1.534752, 1, 0, 0.6666667, 1,
1.19909, 0.3973384, 1.479635, 1, 0, 0.6588235, 1,
1.205185, 0.3456147, 0.9392517, 1, 0, 0.654902, 1,
1.207125, 0.4266489, 1.809687, 1, 0, 0.6470588, 1,
1.210095, -2.168283, 4.808486, 1, 0, 0.6431373, 1,
1.21124, 0.7214565, 1.415274, 1, 0, 0.6352941, 1,
1.225182, -1.4019, 1.976984, 1, 0, 0.6313726, 1,
1.234622, -3.378266, 2.24931, 1, 0, 0.6235294, 1,
1.237709, 0.07000421, 1.878585, 1, 0, 0.6196079, 1,
1.240014, 2.52956, 0.05115486, 1, 0, 0.6117647, 1,
1.24092, 0.4805961, 0.1974499, 1, 0, 0.6078432, 1,
1.243073, -1.754971, 3.602656, 1, 0, 0.6, 1,
1.248936, 1.427367, 0.3485433, 1, 0, 0.5921569, 1,
1.256237, -1.763915, 1.983021, 1, 0, 0.5882353, 1,
1.263107, -1.035551, 2.563864, 1, 0, 0.5803922, 1,
1.270434, -0.7572501, 2.965067, 1, 0, 0.5764706, 1,
1.274416, 0.2446507, 0.5777519, 1, 0, 0.5686275, 1,
1.277601, -2.466622, 3.087907, 1, 0, 0.5647059, 1,
1.278317, 0.1153781, 2.779935, 1, 0, 0.5568628, 1,
1.302442, 0.5079308, -0.4767256, 1, 0, 0.5529412, 1,
1.311173, -0.1728709, 3.623168, 1, 0, 0.5450981, 1,
1.322514, -2.151716, 3.751822, 1, 0, 0.5411765, 1,
1.346256, -0.5288955, 1.843714, 1, 0, 0.5333334, 1,
1.359694, 0.2221828, 0.1956766, 1, 0, 0.5294118, 1,
1.368954, 0.7243444, 0.3232781, 1, 0, 0.5215687, 1,
1.371159, 1.654955, 0.7617559, 1, 0, 0.5176471, 1,
1.371679, -0.7480596, 1.622867, 1, 0, 0.509804, 1,
1.386206, 0.662976, 2.302735, 1, 0, 0.5058824, 1,
1.387218, 0.1613964, 2.048173, 1, 0, 0.4980392, 1,
1.409707, -0.4633025, 1.626933, 1, 0, 0.4901961, 1,
1.413468, -1.591922, 2.803441, 1, 0, 0.4862745, 1,
1.437762, -1.031075, 3.553975, 1, 0, 0.4784314, 1,
1.437938, 0.8452652, 1.197458, 1, 0, 0.4745098, 1,
1.438984, -1.097275, 2.173644, 1, 0, 0.4666667, 1,
1.445057, 0.01692641, 1.914505, 1, 0, 0.4627451, 1,
1.454915, 1.076128, 0.3966464, 1, 0, 0.454902, 1,
1.456932, -0.1809482, 0.01430881, 1, 0, 0.4509804, 1,
1.460049, 1.597288, -1.948956, 1, 0, 0.4431373, 1,
1.47549, 0.408075, 1.881809, 1, 0, 0.4392157, 1,
1.481911, -0.7666937, 2.585921, 1, 0, 0.4313726, 1,
1.485249, 0.3078429, 0.8576234, 1, 0, 0.427451, 1,
1.487644, 1.08703, 1.672008, 1, 0, 0.4196078, 1,
1.499207, -0.07867777, 1.836615, 1, 0, 0.4156863, 1,
1.522315, -0.8352983, 1.825746, 1, 0, 0.4078431, 1,
1.532042, 0.8236463, 1.474071, 1, 0, 0.4039216, 1,
1.547283, -0.5306365, 2.328899, 1, 0, 0.3960784, 1,
1.565639, 0.3955887, 1.01944, 1, 0, 0.3882353, 1,
1.567983, -0.4542379, 0.3228356, 1, 0, 0.3843137, 1,
1.590291, 0.1385617, 1.088588, 1, 0, 0.3764706, 1,
1.609282, -0.02143458, 3.857863, 1, 0, 0.372549, 1,
1.612402, -3.065205, 3.569057, 1, 0, 0.3647059, 1,
1.619212, -1.005273, 0.07196415, 1, 0, 0.3607843, 1,
1.63515, -0.6560713, 0.798292, 1, 0, 0.3529412, 1,
1.659064, 0.4457718, 0.1442788, 1, 0, 0.3490196, 1,
1.660861, 1.458377, 1.683506, 1, 0, 0.3411765, 1,
1.684643, 0.2111533, 2.755694, 1, 0, 0.3372549, 1,
1.690706, -0.004942805, -1.086111, 1, 0, 0.3294118, 1,
1.691644, 0.5714307, 1.257837, 1, 0, 0.3254902, 1,
1.696992, 1.620949, 0.4725961, 1, 0, 0.3176471, 1,
1.697618, -1.077537, 1.366879, 1, 0, 0.3137255, 1,
1.703265, 2.301416, 1.301133, 1, 0, 0.3058824, 1,
1.735181, 0.5742033, 1.152212, 1, 0, 0.2980392, 1,
1.740531, 0.4266592, 0.4974987, 1, 0, 0.2941177, 1,
1.758147, -0.1966725, 2.067269, 1, 0, 0.2862745, 1,
1.761692, -1.268933, 3.167821, 1, 0, 0.282353, 1,
1.761772, 0.4221588, 1.460144, 1, 0, 0.2745098, 1,
1.778119, 0.5900395, 0.4636787, 1, 0, 0.2705882, 1,
1.782997, -0.8404021, 1.2309, 1, 0, 0.2627451, 1,
1.803699, -0.08473308, 1.039232, 1, 0, 0.2588235, 1,
1.837276, -0.3887625, 2.270437, 1, 0, 0.2509804, 1,
1.84653, 2.186583, 0.4345517, 1, 0, 0.2470588, 1,
1.854661, 0.7394233, 2.348647, 1, 0, 0.2392157, 1,
1.859678, -0.8114349, 1.740338, 1, 0, 0.2352941, 1,
1.860091, 0.4984219, -0.8196365, 1, 0, 0.227451, 1,
1.860138, 2.06027, -0.3520003, 1, 0, 0.2235294, 1,
1.862219, -0.02458675, 0.8737294, 1, 0, 0.2156863, 1,
1.878593, 0.8388574, 1.717287, 1, 0, 0.2117647, 1,
1.892001, 0.3869401, 2.831044, 1, 0, 0.2039216, 1,
1.89788, 0.77682, 1.34143, 1, 0, 0.1960784, 1,
1.906906, -0.3981352, 1.395113, 1, 0, 0.1921569, 1,
1.908602, -0.03208872, 1.952124, 1, 0, 0.1843137, 1,
1.939236, 1.072888, -0.08798184, 1, 0, 0.1803922, 1,
1.941086, 1.764517, 1.802434, 1, 0, 0.172549, 1,
1.986761, -1.724842, 1.430809, 1, 0, 0.1686275, 1,
2.00162, -2.158681, 1.755649, 1, 0, 0.1607843, 1,
2.024611, -2.597765, 1.267793, 1, 0, 0.1568628, 1,
2.038991, -2.73647, 3.584601, 1, 0, 0.1490196, 1,
2.047304, 0.325324, 1.760077, 1, 0, 0.145098, 1,
2.059156, -0.3390044, 1.555405, 1, 0, 0.1372549, 1,
2.061635, -2.221703, 4.811343, 1, 0, 0.1333333, 1,
2.074813, 0.4856428, 0.9376372, 1, 0, 0.1254902, 1,
2.079783, -0.6357445, 2.964077, 1, 0, 0.1215686, 1,
2.081725, -1.01731, 2.698461, 1, 0, 0.1137255, 1,
2.149767, 0.537714, 0.6152895, 1, 0, 0.1098039, 1,
2.160111, 0.4622564, 0.5752858, 1, 0, 0.1019608, 1,
2.162534, 0.4653764, 2.102601, 1, 0, 0.09411765, 1,
2.237234, 0.2894382, 1.458888, 1, 0, 0.09019608, 1,
2.241136, -2.137506, 4.292998, 1, 0, 0.08235294, 1,
2.254745, -1.346834, 1.148454, 1, 0, 0.07843138, 1,
2.277995, 0.1039316, 0.4725534, 1, 0, 0.07058824, 1,
2.341413, -1.525502, 3.298636, 1, 0, 0.06666667, 1,
2.348772, -0.1969579, 1.794576, 1, 0, 0.05882353, 1,
2.353463, -1.736373, 3.042843, 1, 0, 0.05490196, 1,
2.401881, 0.9515454, 1.036384, 1, 0, 0.04705882, 1,
2.439954, -0.5536526, 0.277155, 1, 0, 0.04313726, 1,
2.703922, -1.044742, 1.915463, 1, 0, 0.03529412, 1,
2.703983, 1.42976, 0.3649411, 1, 0, 0.03137255, 1,
2.771776, -1.382159, 2.71372, 1, 0, 0.02352941, 1,
2.777822, 0.7604601, 1.901086, 1, 0, 0.01960784, 1,
2.861828, -0.8927067, 0.3239894, 1, 0, 0.01176471, 1,
2.991726, 0.2390974, 0.5994541, 1, 0, 0.007843138, 1
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
-0.2621621, -4.544987, -8.357541, 0, -0.5, 0.5, 0.5,
-0.2621621, -4.544987, -8.357541, 1, -0.5, 0.5, 0.5,
-0.2621621, -4.544987, -8.357541, 1, 1.5, 0.5, 0.5,
-0.2621621, -4.544987, -8.357541, 0, 1.5, 0.5, 0.5
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
-4.619118, 0.06338871, -8.357541, 0, -0.5, 0.5, 0.5,
-4.619118, 0.06338871, -8.357541, 1, -0.5, 0.5, 0.5,
-4.619118, 0.06338871, -8.357541, 1, 1.5, 0.5, 0.5,
-4.619118, 0.06338871, -8.357541, 0, 1.5, 0.5, 0.5
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
-4.619118, -4.544987, -0.04165602, 0, -0.5, 0.5, 0.5,
-4.619118, -4.544987, -0.04165602, 1, -0.5, 0.5, 0.5,
-4.619118, -4.544987, -0.04165602, 1, 1.5, 0.5, 0.5,
-4.619118, -4.544987, -0.04165602, 0, 1.5, 0.5, 0.5
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
-3, -3.481516, -6.438491,
2, -3.481516, -6.438491,
-3, -3.481516, -6.438491,
-3, -3.658761, -6.758333,
-2, -3.481516, -6.438491,
-2, -3.658761, -6.758333,
-1, -3.481516, -6.438491,
-1, -3.658761, -6.758333,
0, -3.481516, -6.438491,
0, -3.658761, -6.758333,
1, -3.481516, -6.438491,
1, -3.658761, -6.758333,
2, -3.481516, -6.438491,
2, -3.658761, -6.758333
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
-3, -4.013252, -7.398016, 0, -0.5, 0.5, 0.5,
-3, -4.013252, -7.398016, 1, -0.5, 0.5, 0.5,
-3, -4.013252, -7.398016, 1, 1.5, 0.5, 0.5,
-3, -4.013252, -7.398016, 0, 1.5, 0.5, 0.5,
-2, -4.013252, -7.398016, 0, -0.5, 0.5, 0.5,
-2, -4.013252, -7.398016, 1, -0.5, 0.5, 0.5,
-2, -4.013252, -7.398016, 1, 1.5, 0.5, 0.5,
-2, -4.013252, -7.398016, 0, 1.5, 0.5, 0.5,
-1, -4.013252, -7.398016, 0, -0.5, 0.5, 0.5,
-1, -4.013252, -7.398016, 1, -0.5, 0.5, 0.5,
-1, -4.013252, -7.398016, 1, 1.5, 0.5, 0.5,
-1, -4.013252, -7.398016, 0, 1.5, 0.5, 0.5,
0, -4.013252, -7.398016, 0, -0.5, 0.5, 0.5,
0, -4.013252, -7.398016, 1, -0.5, 0.5, 0.5,
0, -4.013252, -7.398016, 1, 1.5, 0.5, 0.5,
0, -4.013252, -7.398016, 0, 1.5, 0.5, 0.5,
1, -4.013252, -7.398016, 0, -0.5, 0.5, 0.5,
1, -4.013252, -7.398016, 1, -0.5, 0.5, 0.5,
1, -4.013252, -7.398016, 1, 1.5, 0.5, 0.5,
1, -4.013252, -7.398016, 0, 1.5, 0.5, 0.5,
2, -4.013252, -7.398016, 0, -0.5, 0.5, 0.5,
2, -4.013252, -7.398016, 1, -0.5, 0.5, 0.5,
2, -4.013252, -7.398016, 1, 1.5, 0.5, 0.5,
2, -4.013252, -7.398016, 0, 1.5, 0.5, 0.5
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
-3.613667, -3, -6.438491,
-3.613667, 3, -6.438491,
-3.613667, -3, -6.438491,
-3.781242, -3, -6.758333,
-3.613667, -2, -6.438491,
-3.781242, -2, -6.758333,
-3.613667, -1, -6.438491,
-3.781242, -1, -6.758333,
-3.613667, 0, -6.438491,
-3.781242, 0, -6.758333,
-3.613667, 1, -6.438491,
-3.781242, 1, -6.758333,
-3.613667, 2, -6.438491,
-3.781242, 2, -6.758333,
-3.613667, 3, -6.438491,
-3.781242, 3, -6.758333
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
-4.116393, -3, -7.398016, 0, -0.5, 0.5, 0.5,
-4.116393, -3, -7.398016, 1, -0.5, 0.5, 0.5,
-4.116393, -3, -7.398016, 1, 1.5, 0.5, 0.5,
-4.116393, -3, -7.398016, 0, 1.5, 0.5, 0.5,
-4.116393, -2, -7.398016, 0, -0.5, 0.5, 0.5,
-4.116393, -2, -7.398016, 1, -0.5, 0.5, 0.5,
-4.116393, -2, -7.398016, 1, 1.5, 0.5, 0.5,
-4.116393, -2, -7.398016, 0, 1.5, 0.5, 0.5,
-4.116393, -1, -7.398016, 0, -0.5, 0.5, 0.5,
-4.116393, -1, -7.398016, 1, -0.5, 0.5, 0.5,
-4.116393, -1, -7.398016, 1, 1.5, 0.5, 0.5,
-4.116393, -1, -7.398016, 0, 1.5, 0.5, 0.5,
-4.116393, 0, -7.398016, 0, -0.5, 0.5, 0.5,
-4.116393, 0, -7.398016, 1, -0.5, 0.5, 0.5,
-4.116393, 0, -7.398016, 1, 1.5, 0.5, 0.5,
-4.116393, 0, -7.398016, 0, 1.5, 0.5, 0.5,
-4.116393, 1, -7.398016, 0, -0.5, 0.5, 0.5,
-4.116393, 1, -7.398016, 1, -0.5, 0.5, 0.5,
-4.116393, 1, -7.398016, 1, 1.5, 0.5, 0.5,
-4.116393, 1, -7.398016, 0, 1.5, 0.5, 0.5,
-4.116393, 2, -7.398016, 0, -0.5, 0.5, 0.5,
-4.116393, 2, -7.398016, 1, -0.5, 0.5, 0.5,
-4.116393, 2, -7.398016, 1, 1.5, 0.5, 0.5,
-4.116393, 2, -7.398016, 0, 1.5, 0.5, 0.5,
-4.116393, 3, -7.398016, 0, -0.5, 0.5, 0.5,
-4.116393, 3, -7.398016, 1, -0.5, 0.5, 0.5,
-4.116393, 3, -7.398016, 1, 1.5, 0.5, 0.5,
-4.116393, 3, -7.398016, 0, 1.5, 0.5, 0.5
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
-3.613667, -3.481516, -6,
-3.613667, -3.481516, 6,
-3.613667, -3.481516, -6,
-3.781242, -3.658761, -6,
-3.613667, -3.481516, -4,
-3.781242, -3.658761, -4,
-3.613667, -3.481516, -2,
-3.781242, -3.658761, -2,
-3.613667, -3.481516, 0,
-3.781242, -3.658761, 0,
-3.613667, -3.481516, 2,
-3.781242, -3.658761, 2,
-3.613667, -3.481516, 4,
-3.781242, -3.658761, 4,
-3.613667, -3.481516, 6,
-3.781242, -3.658761, 6
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
"-6",
"-4",
"-2",
"0",
"2",
"4",
"6"
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
-4.116393, -4.013252, -6, 0, -0.5, 0.5, 0.5,
-4.116393, -4.013252, -6, 1, -0.5, 0.5, 0.5,
-4.116393, -4.013252, -6, 1, 1.5, 0.5, 0.5,
-4.116393, -4.013252, -6, 0, 1.5, 0.5, 0.5,
-4.116393, -4.013252, -4, 0, -0.5, 0.5, 0.5,
-4.116393, -4.013252, -4, 1, -0.5, 0.5, 0.5,
-4.116393, -4.013252, -4, 1, 1.5, 0.5, 0.5,
-4.116393, -4.013252, -4, 0, 1.5, 0.5, 0.5,
-4.116393, -4.013252, -2, 0, -0.5, 0.5, 0.5,
-4.116393, -4.013252, -2, 1, -0.5, 0.5, 0.5,
-4.116393, -4.013252, -2, 1, 1.5, 0.5, 0.5,
-4.116393, -4.013252, -2, 0, 1.5, 0.5, 0.5,
-4.116393, -4.013252, 0, 0, -0.5, 0.5, 0.5,
-4.116393, -4.013252, 0, 1, -0.5, 0.5, 0.5,
-4.116393, -4.013252, 0, 1, 1.5, 0.5, 0.5,
-4.116393, -4.013252, 0, 0, 1.5, 0.5, 0.5,
-4.116393, -4.013252, 2, 0, -0.5, 0.5, 0.5,
-4.116393, -4.013252, 2, 1, -0.5, 0.5, 0.5,
-4.116393, -4.013252, 2, 1, 1.5, 0.5, 0.5,
-4.116393, -4.013252, 2, 0, 1.5, 0.5, 0.5,
-4.116393, -4.013252, 4, 0, -0.5, 0.5, 0.5,
-4.116393, -4.013252, 4, 1, -0.5, 0.5, 0.5,
-4.116393, -4.013252, 4, 1, 1.5, 0.5, 0.5,
-4.116393, -4.013252, 4, 0, 1.5, 0.5, 0.5,
-4.116393, -4.013252, 6, 0, -0.5, 0.5, 0.5,
-4.116393, -4.013252, 6, 1, -0.5, 0.5, 0.5,
-4.116393, -4.013252, 6, 1, 1.5, 0.5, 0.5,
-4.116393, -4.013252, 6, 0, 1.5, 0.5, 0.5
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
-3.613667, -3.481516, -6.438491,
-3.613667, 3.608293, -6.438491,
-3.613667, -3.481516, 6.355179,
-3.613667, 3.608293, 6.355179,
-3.613667, -3.481516, -6.438491,
-3.613667, -3.481516, 6.355179,
-3.613667, 3.608293, -6.438491,
-3.613667, 3.608293, 6.355179,
-3.613667, -3.481516, -6.438491,
3.089343, -3.481516, -6.438491,
-3.613667, -3.481516, 6.355179,
3.089343, -3.481516, 6.355179,
-3.613667, 3.608293, -6.438491,
3.089343, 3.608293, -6.438491,
-3.613667, 3.608293, 6.355179,
3.089343, 3.608293, 6.355179,
3.089343, -3.481516, -6.438491,
3.089343, 3.608293, -6.438491,
3.089343, -3.481516, 6.355179,
3.089343, 3.608293, 6.355179,
3.089343, -3.481516, -6.438491,
3.089343, -3.481516, 6.355179,
3.089343, 3.608293, -6.438491,
3.089343, 3.608293, 6.355179
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
var radius = 8.591509;
var distance = 38.22459;
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
mvMatrix.translate( 0.2621621, -0.06338871, 0.04165602 );
mvMatrix.scale( 1.385841, 1.310234, 0.7260863 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.22459);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
bifenox<-read.table("bifenox.xyz")
```

```
## Error in read.table("bifenox.xyz"): no lines available in input
```

```r
x<-bifenox$V2
```

```
## Error in eval(expr, envir, enclos): object 'bifenox' not found
```

```r
y<-bifenox$V3
```

```
## Error in eval(expr, envir, enclos): object 'bifenox' not found
```

```r
z<-bifenox$V4
```

```
## Error in eval(expr, envir, enclos): object 'bifenox' not found
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
-3.51605, -0.590712, -1.64606, 0, 0, 1, 1, 1,
-2.848983, -0.5946655, -2.2446, 1, 0, 0, 1, 1,
-2.815252, -0.2250404, -2.897478, 1, 0, 0, 1, 1,
-2.776776, -2.334301, -4.774472, 1, 0, 0, 1, 1,
-2.750104, -1.043874, -3.013535, 1, 0, 0, 1, 1,
-2.530087, -1.667998, -4.117895, 1, 0, 0, 1, 1,
-2.370977, -0.1550523, -1.822753, 0, 0, 0, 1, 1,
-2.32189, 0.4392119, -1.404222, 0, 0, 0, 1, 1,
-2.300201, 0.223878, -0.3047571, 0, 0, 0, 1, 1,
-2.253388, -0.5075107, -2.734195, 0, 0, 0, 1, 1,
-2.200581, 1.320345, -0.1109126, 0, 0, 0, 1, 1,
-2.196042, 0.388189, -2.491979, 0, 0, 0, 1, 1,
-2.190278, 0.411858, -0.844856, 0, 0, 0, 1, 1,
-2.189678, 1.659938, -1.739547, 1, 1, 1, 1, 1,
-2.179439, -1.132711, -0.5531614, 1, 1, 1, 1, 1,
-2.171793, 0.5768189, -0.02644011, 1, 1, 1, 1, 1,
-2.149664, 0.1200133, 0.1946696, 1, 1, 1, 1, 1,
-2.145948, 1.70615, 1.343774, 1, 1, 1, 1, 1,
-2.144704, -0.4383906, -0.3898376, 1, 1, 1, 1, 1,
-2.130143, 0.5104644, -1.476948, 1, 1, 1, 1, 1,
-2.07983, 0.2171026, -0.006630788, 1, 1, 1, 1, 1,
-2.075872, 0.8134272, -1.174572, 1, 1, 1, 1, 1,
-2.053676, 0.03591201, -1.205428, 1, 1, 1, 1, 1,
-2.044449, 0.7680163, -0.4893696, 1, 1, 1, 1, 1,
-2.032141, -1.463308, -2.005394, 1, 1, 1, 1, 1,
-2.01673, -0.2706236, -2.804531, 1, 1, 1, 1, 1,
-2.00065, -3.197099, -1.275842, 1, 1, 1, 1, 1,
-1.991524, -1.389873, -3.308856, 1, 1, 1, 1, 1,
-1.973452, -2.510592, -2.549312, 0, 0, 1, 1, 1,
-1.967344, -1.042871, -3.326993, 1, 0, 0, 1, 1,
-1.947159, -1.042931, -0.9607251, 1, 0, 0, 1, 1,
-1.945969, -1.138891, -2.634355, 1, 0, 0, 1, 1,
-1.910491, 1.376127, -0.1547061, 1, 0, 0, 1, 1,
-1.860923, 0.6096579, -0.7925982, 1, 0, 0, 1, 1,
-1.856477, 2.074723, 0.4612136, 0, 0, 0, 1, 1,
-1.855102, -1.509142, -2.415462, 0, 0, 0, 1, 1,
-1.818806, 1.585575, 0.9182512, 0, 0, 0, 1, 1,
-1.813067, 0.8379951, -1.910629, 0, 0, 0, 1, 1,
-1.798379, -0.8509989, -1.155938, 0, 0, 0, 1, 1,
-1.773238, 1.747485, -1.137286, 0, 0, 0, 1, 1,
-1.761681, -0.4980905, -1.046604, 0, 0, 0, 1, 1,
-1.732376, -0.5984551, -0.9505605, 1, 1, 1, 1, 1,
-1.726884, -0.7924678, -3.192109, 1, 1, 1, 1, 1,
-1.723396, 0.4183529, -2.275316, 1, 1, 1, 1, 1,
-1.698406, 0.381478, -1.093616, 1, 1, 1, 1, 1,
-1.669065, 0.2182741, -1.57391, 1, 1, 1, 1, 1,
-1.667052, 0.5918119, -3.138566, 1, 1, 1, 1, 1,
-1.657224, -0.3834999, -0.7178051, 1, 1, 1, 1, 1,
-1.640548, 0.09056155, -1.166902, 1, 1, 1, 1, 1,
-1.63261, -2.261407, -2.128211, 1, 1, 1, 1, 1,
-1.609469, 0.951132, 0.6591371, 1, 1, 1, 1, 1,
-1.600494, 0.9792417, -1.621879, 1, 1, 1, 1, 1,
-1.599397, -0.4705477, 0.6150976, 1, 1, 1, 1, 1,
-1.587349, 0.449313, 0.3494865, 1, 1, 1, 1, 1,
-1.577834, -0.6611163, -2.646449, 1, 1, 1, 1, 1,
-1.576515, 0.3308624, -0.2852394, 1, 1, 1, 1, 1,
-1.575851, -1.332136, -2.07074, 0, 0, 1, 1, 1,
-1.57036, 1.194889, -2.321413, 1, 0, 0, 1, 1,
-1.566184, -0.6721101, -1.405881, 1, 0, 0, 1, 1,
-1.559873, -0.9812728, -1.04234, 1, 0, 0, 1, 1,
-1.54698, 0.356946, -1.618597, 1, 0, 0, 1, 1,
-1.539308, -0.2425344, -0.5828155, 1, 0, 0, 1, 1,
-1.538164, 0.9531025, 0.1117019, 0, 0, 0, 1, 1,
-1.521447, -0.607006, -3.989422, 0, 0, 0, 1, 1,
-1.515215, 1.735946, -1.496521, 0, 0, 0, 1, 1,
-1.505467, 0.1077047, -3.399113, 0, 0, 0, 1, 1,
-1.502453, -0.0542811, -1.663165, 0, 0, 0, 1, 1,
-1.500941, -1.05235, -0.1011476, 0, 0, 0, 1, 1,
-1.498555, 0.4585556, -0.12811, 0, 0, 0, 1, 1,
-1.494817, -2.33496, -3.029887, 1, 1, 1, 1, 1,
-1.483093, 0.5342852, -1.289158, 1, 1, 1, 1, 1,
-1.478788, -0.685033, -3.827835, 1, 1, 1, 1, 1,
-1.475928, 1.146021, -0.2166964, 1, 1, 1, 1, 1,
-1.458858, 1.456255, -2.513124, 1, 1, 1, 1, 1,
-1.451404, 0.6877522, -1.984706, 1, 1, 1, 1, 1,
-1.446589, -0.6171302, -2.075366, 1, 1, 1, 1, 1,
-1.436843, 0.2182343, -0.7408117, 1, 1, 1, 1, 1,
-1.435783, -1.405681, -0.5798061, 1, 1, 1, 1, 1,
-1.434759, 0.8747231, -1.399521, 1, 1, 1, 1, 1,
-1.43357, 0.4947186, -1.695456, 1, 1, 1, 1, 1,
-1.425051, -2.354952, -2.355287, 1, 1, 1, 1, 1,
-1.412848, 1.435247, -1.164102, 1, 1, 1, 1, 1,
-1.412586, 0.2742667, -1.620721, 1, 1, 1, 1, 1,
-1.396653, -0.6809315, -2.948198, 1, 1, 1, 1, 1,
-1.376729, -0.1493934, -1.171052, 0, 0, 1, 1, 1,
-1.366122, 0.4986132, -2.195083, 1, 0, 0, 1, 1,
-1.344006, 0.5433444, -0.1583046, 1, 0, 0, 1, 1,
-1.339341, 0.1715844, -0.1671505, 1, 0, 0, 1, 1,
-1.33346, -1.650876, -3.583909, 1, 0, 0, 1, 1,
-1.327545, 1.157582, 0.5967816, 1, 0, 0, 1, 1,
-1.32681, -0.2350532, -1.851023, 0, 0, 0, 1, 1,
-1.320438, 0.1119277, -0.2398328, 0, 0, 0, 1, 1,
-1.309231, -0.5147968, -1.366372, 0, 0, 0, 1, 1,
-1.295879, 0.05666044, -2.050137, 0, 0, 0, 1, 1,
-1.293393, -1.251074, -1.605167, 0, 0, 0, 1, 1,
-1.290682, 1.169408, -1.713809, 0, 0, 0, 1, 1,
-1.28743, 0.01231662, -0.307402, 0, 0, 0, 1, 1,
-1.285677, 1.179235, -2.050873, 1, 1, 1, 1, 1,
-1.28418, 0.2978039, -1.835122, 1, 1, 1, 1, 1,
-1.276363, 1.211533, 1.355804, 1, 1, 1, 1, 1,
-1.269867, 0.7411368, -0.3218646, 1, 1, 1, 1, 1,
-1.267535, -0.5291688, -2.334166, 1, 1, 1, 1, 1,
-1.254107, 2.469756, -1.279051, 1, 1, 1, 1, 1,
-1.245106, -0.07606896, -1.094733, 1, 1, 1, 1, 1,
-1.235381, -0.3387051, -1.465727, 1, 1, 1, 1, 1,
-1.232499, -1.394108, -1.336532, 1, 1, 1, 1, 1,
-1.232009, -1.308725, -0.6117427, 1, 1, 1, 1, 1,
-1.228053, 0.8327912, -2.566598, 1, 1, 1, 1, 1,
-1.226581, 0.1246036, -1.210138, 1, 1, 1, 1, 1,
-1.213568, -1.956083, -3.604816, 1, 1, 1, 1, 1,
-1.195987, 0.3311331, -0.2946697, 1, 1, 1, 1, 1,
-1.195627, 1.519014, 0.6801382, 1, 1, 1, 1, 1,
-1.194512, -0.04498717, -0.7850207, 0, 0, 1, 1, 1,
-1.190206, 0.3139389, -3.008623, 1, 0, 0, 1, 1,
-1.188122, 0.0402868, -1.540966, 1, 0, 0, 1, 1,
-1.187387, -0.2711559, -1.911826, 1, 0, 0, 1, 1,
-1.184584, -1.034521, -3.885597, 1, 0, 0, 1, 1,
-1.172375, 0.3318826, -1.960043, 1, 0, 0, 1, 1,
-1.170457, -0.6005909, -1.654674, 0, 0, 0, 1, 1,
-1.169737, -0.9644949, -1.391018, 0, 0, 0, 1, 1,
-1.165794, -0.1126949, -0.364484, 0, 0, 0, 1, 1,
-1.154037, 0.4825783, 0.201849, 0, 0, 0, 1, 1,
-1.151373, 0.7630599, -1.273122, 0, 0, 0, 1, 1,
-1.140481, 0.02386097, -1.935984, 0, 0, 0, 1, 1,
-1.138693, -0.09784333, 0.06382564, 0, 0, 0, 1, 1,
-1.135514, -0.503338, -1.07699, 1, 1, 1, 1, 1,
-1.134312, 0.4977094, -2.353887, 1, 1, 1, 1, 1,
-1.131895, 0.1391108, -3.130087, 1, 1, 1, 1, 1,
-1.130052, -0.4706619, -0.4761973, 1, 1, 1, 1, 1,
-1.129371, 1.576731, -0.03475947, 1, 1, 1, 1, 1,
-1.126748, -0.9826498, -1.141023, 1, 1, 1, 1, 1,
-1.124394, -1.497047, -3.467686, 1, 1, 1, 1, 1,
-1.121231, 0.115561, -2.703561, 1, 1, 1, 1, 1,
-1.118514, -1.269343, -2.824482, 1, 1, 1, 1, 1,
-1.110298, -1.490674, -1.912765, 1, 1, 1, 1, 1,
-1.109619, 0.3759856, -0.7539663, 1, 1, 1, 1, 1,
-1.108579, 0.8101801, -1.106262, 1, 1, 1, 1, 1,
-1.108065, 1.678816, -1.555529, 1, 1, 1, 1, 1,
-1.105496, 1.084396, -0.9903067, 1, 1, 1, 1, 1,
-1.093799, 0.1380022, -3.607119, 1, 1, 1, 1, 1,
-1.071225, -0.6856827, -2.245198, 0, 0, 1, 1, 1,
-1.065394, 1.447775, -0.1132185, 1, 0, 0, 1, 1,
-1.062408, -0.4777385, -0.8327307, 1, 0, 0, 1, 1,
-1.054783, 0.2741802, -1.102272, 1, 0, 0, 1, 1,
-1.054074, 1.049594, 0.2683853, 1, 0, 0, 1, 1,
-1.049953, -1.306015, -1.070214, 1, 0, 0, 1, 1,
-1.043141, -1.378403, -0.6838021, 0, 0, 0, 1, 1,
-1.033417, 0.9356073, 0.05317431, 0, 0, 0, 1, 1,
-1.031197, 2.314376, -2.298994, 0, 0, 0, 1, 1,
-1.030377, -0.7325842, -1.402275, 0, 0, 0, 1, 1,
-1.014082, 0.6033852, 0.5085751, 0, 0, 0, 1, 1,
-1.012565, -0.7389416, -1.524018, 0, 0, 0, 1, 1,
-1.010587, -1.402551, -3.505033, 0, 0, 0, 1, 1,
-1.006685, -0.5373006, -2.251904, 1, 1, 1, 1, 1,
-1.006229, -0.2764657, -2.242625, 1, 1, 1, 1, 1,
-1.00503, -0.4915588, -1.599871, 1, 1, 1, 1, 1,
-1.000388, -0.03919682, -3.239874, 1, 1, 1, 1, 1,
-0.997587, 1.480083, -1.515151, 1, 1, 1, 1, 1,
-0.997294, -0.9217998, -3.804019, 1, 1, 1, 1, 1,
-0.9964781, 0.8528231, -1.597575, 1, 1, 1, 1, 1,
-0.9928662, -1.334496, -2.894295, 1, 1, 1, 1, 1,
-0.9913111, 0.3389792, -2.474597, 1, 1, 1, 1, 1,
-0.9902983, 0.141051, -1.274359, 1, 1, 1, 1, 1,
-0.9900253, -1.116552, -1.817274, 1, 1, 1, 1, 1,
-0.9890767, 1.277678, -0.2427898, 1, 1, 1, 1, 1,
-0.9872714, 1.02313, -0.7091991, 1, 1, 1, 1, 1,
-0.9870686, -1.713367, -2.892722, 1, 1, 1, 1, 1,
-0.9834505, -0.9801991, -1.128749, 1, 1, 1, 1, 1,
-0.9779091, 1.87502, -0.7113222, 0, 0, 1, 1, 1,
-0.9729286, 1.077876, -1.393158, 1, 0, 0, 1, 1,
-0.9715174, 1.230497, 2.028967, 1, 0, 0, 1, 1,
-0.968094, -0.31802, -2.979565, 1, 0, 0, 1, 1,
-0.9678499, -1.121975, -3.258482, 1, 0, 0, 1, 1,
-0.9674731, 0.8536543, -0.6410226, 1, 0, 0, 1, 1,
-0.9662709, -1.915063, -2.948917, 0, 0, 0, 1, 1,
-0.960957, 0.4854311, -0.7012197, 0, 0, 0, 1, 1,
-0.9595356, 0.4260226, -0.720639, 0, 0, 0, 1, 1,
-0.9560599, -0.3734979, 0.06048925, 0, 0, 0, 1, 1,
-0.9550215, -0.809454, -0.7726176, 0, 0, 0, 1, 1,
-0.9539768, -0.4136133, -1.545359, 0, 0, 0, 1, 1,
-0.9530677, -0.7291797, -2.460518, 0, 0, 0, 1, 1,
-0.9520774, -0.283529, -3.135028, 1, 1, 1, 1, 1,
-0.9485067, -0.5196787, -2.443414, 1, 1, 1, 1, 1,
-0.9459884, 0.6787311, -0.4553357, 1, 1, 1, 1, 1,
-0.9407777, -2.164132, -0.3182484, 1, 1, 1, 1, 1,
-0.9361364, 2.593265, 0.5144705, 1, 1, 1, 1, 1,
-0.9340675, -0.4004091, -2.730253, 1, 1, 1, 1, 1,
-0.928107, 1.746564, -0.09751112, 1, 1, 1, 1, 1,
-0.9255737, -0.3840152, -0.6691406, 1, 1, 1, 1, 1,
-0.925423, -1.22435, -2.099577, 1, 1, 1, 1, 1,
-0.9243408, 0.2001298, -1.018983, 1, 1, 1, 1, 1,
-0.9189478, 1.296543, 0.6340762, 1, 1, 1, 1, 1,
-0.9159163, -0.2125829, -2.80286, 1, 1, 1, 1, 1,
-0.9114506, -0.8982728, -2.297687, 1, 1, 1, 1, 1,
-0.9100803, 0.8818099, -2.376061, 1, 1, 1, 1, 1,
-0.9095275, -0.3086978, -1.491487, 1, 1, 1, 1, 1,
-0.9078107, 0.1187326, 0.4378359, 0, 0, 1, 1, 1,
-0.904251, -1.719684, -3.301713, 1, 0, 0, 1, 1,
-0.9037057, 1.268273, -2.296819, 1, 0, 0, 1, 1,
-0.8984653, -1.512069, -2.921522, 1, 0, 0, 1, 1,
-0.8958616, 0.2260285, -2.35111, 1, 0, 0, 1, 1,
-0.8858405, 0.08068836, -0.5891232, 1, 0, 0, 1, 1,
-0.8837207, -0.5408095, -0.6766251, 0, 0, 0, 1, 1,
-0.880747, -0.1716706, -1.524894, 0, 0, 0, 1, 1,
-0.8731824, -1.256802, -1.658821, 0, 0, 0, 1, 1,
-0.8718119, -1.210419, -2.220556, 0, 0, 0, 1, 1,
-0.8706964, 0.8115092, -0.1817499, 0, 0, 0, 1, 1,
-0.8702911, -0.3847506, -1.29273, 0, 0, 0, 1, 1,
-0.8702544, 0.5652021, 0.7533277, 0, 0, 0, 1, 1,
-0.8658688, -1.951694, -2.527669, 1, 1, 1, 1, 1,
-0.8630604, -0.2266513, -0.8069506, 1, 1, 1, 1, 1,
-0.8629476, 0.8877004, -0.4955667, 1, 1, 1, 1, 1,
-0.8583318, 0.9580687, 1.874132, 1, 1, 1, 1, 1,
-0.8535204, -0.08280291, -2.059215, 1, 1, 1, 1, 1,
-0.8478215, 1.270858, -1.20526, 1, 1, 1, 1, 1,
-0.8472784, -0.07925178, -0.5086522, 1, 1, 1, 1, 1,
-0.8375446, -0.571285, -3.532308, 1, 1, 1, 1, 1,
-0.8340785, -1.283477, -2.533798, 1, 1, 1, 1, 1,
-0.8305368, 0.1733685, -0.4875364, 1, 1, 1, 1, 1,
-0.8273138, 1.136309, 0.4563898, 1, 1, 1, 1, 1,
-0.8271332, -1.520804, -2.698944, 1, 1, 1, 1, 1,
-0.8268111, -1.231636, -2.304767, 1, 1, 1, 1, 1,
-0.825367, 0.631839, -1.089962, 1, 1, 1, 1, 1,
-0.8189639, -0.7969986, -1.852831, 1, 1, 1, 1, 1,
-0.8096636, -0.1411584, -3.025183, 0, 0, 1, 1, 1,
-0.8009183, 0.2733563, -0.147564, 1, 0, 0, 1, 1,
-0.7901071, 0.2102525, -3.375796, 1, 0, 0, 1, 1,
-0.7900756, -0.9799722, -2.323882, 1, 0, 0, 1, 1,
-0.7876074, 0.06462078, -0.2390231, 1, 0, 0, 1, 1,
-0.7854021, 1.973191, 0.2001565, 1, 0, 0, 1, 1,
-0.7853662, 0.06464418, -2.308955, 0, 0, 0, 1, 1,
-0.7851353, -0.8465858, -0.9793944, 0, 0, 0, 1, 1,
-0.7839391, 0.155733, -0.8148437, 0, 0, 0, 1, 1,
-0.7817854, 1.105981, 0.05825482, 0, 0, 0, 1, 1,
-0.7793916, -0.400252, -3.799968, 0, 0, 0, 1, 1,
-0.7746927, -0.5674513, -3.382232, 0, 0, 0, 1, 1,
-0.7685155, 0.8210737, -1.995602, 0, 0, 0, 1, 1,
-0.7654508, -0.4927638, -2.168095, 1, 1, 1, 1, 1,
-0.7608528, -1.312368, -1.769387, 1, 1, 1, 1, 1,
-0.7594141, 0.2358735, -0.1703166, 1, 1, 1, 1, 1,
-0.7585207, -2.483869, -4.300907, 1, 1, 1, 1, 1,
-0.7583528, 0.7691046, -0.2899426, 1, 1, 1, 1, 1,
-0.7549946, 0.8456655, 0.01447106, 1, 1, 1, 1, 1,
-0.7549192, -0.5035483, -2.366435, 1, 1, 1, 1, 1,
-0.7490459, -0.5016912, -3.200907, 1, 1, 1, 1, 1,
-0.7483153, 0.5402724, 0.1589419, 1, 1, 1, 1, 1,
-0.7479313, 0.2220708, -0.6089869, 1, 1, 1, 1, 1,
-0.7468932, -3.04436, -3.173744, 1, 1, 1, 1, 1,
-0.7372341, -0.6838633, -3.613583, 1, 1, 1, 1, 1,
-0.733509, -1.508814, -4.069902, 1, 1, 1, 1, 1,
-0.7333063, 0.2395759, 0.2196649, 1, 1, 1, 1, 1,
-0.7250435, -0.3363577, -2.958555, 1, 1, 1, 1, 1,
-0.724561, -1.03177, -2.447653, 0, 0, 1, 1, 1,
-0.7176118, -0.6394265, -1.85842, 1, 0, 0, 1, 1,
-0.7167919, -1.134466, -2.855528, 1, 0, 0, 1, 1,
-0.7165985, -0.2252672, -2.152398, 1, 0, 0, 1, 1,
-0.7080065, -0.7688489, -1.119488, 1, 0, 0, 1, 1,
-0.7045909, 1.338521, -0.1632376, 1, 0, 0, 1, 1,
-0.6949906, 1.02097, -1.148649, 0, 0, 0, 1, 1,
-0.6912237, -0.07166085, -1.176297, 0, 0, 0, 1, 1,
-0.6907374, 0.06150591, -2.007386, 0, 0, 0, 1, 1,
-0.6883557, 0.08147084, -1.362841, 0, 0, 0, 1, 1,
-0.6798725, 0.5476809, -1.411103, 0, 0, 0, 1, 1,
-0.6785701, -0.2507542, -1.826875, 0, 0, 0, 1, 1,
-0.673281, -1.315501, -1.359533, 0, 0, 0, 1, 1,
-0.6684247, -1.000567, -3.186136, 1, 1, 1, 1, 1,
-0.668176, -0.3269813, -1.051011, 1, 1, 1, 1, 1,
-0.667583, -1.2238, -2.748644, 1, 1, 1, 1, 1,
-0.6623548, -0.5816246, -2.99999, 1, 1, 1, 1, 1,
-0.6571159, -0.6359717, -2.454088, 1, 1, 1, 1, 1,
-0.6522889, -1.329627, -2.460624, 1, 1, 1, 1, 1,
-0.6511627, -0.3575769, -2.323523, 1, 1, 1, 1, 1,
-0.6508994, 0.0162945, -0.01890971, 1, 1, 1, 1, 1,
-0.6472428, -0.1133943, -3.156406, 1, 1, 1, 1, 1,
-0.6448441, -0.9052969, -3.879459, 1, 1, 1, 1, 1,
-0.6436124, 0.6291836, -2.434496, 1, 1, 1, 1, 1,
-0.6273171, 0.5554391, -1.559173, 1, 1, 1, 1, 1,
-0.6257107, -0.4050775, -1.371021, 1, 1, 1, 1, 1,
-0.6256618, 0.1739712, -2.293189, 1, 1, 1, 1, 1,
-0.625068, -1.971127, -2.644586, 1, 1, 1, 1, 1,
-0.6246728, -0.9939574, -2.689722, 0, 0, 1, 1, 1,
-0.622831, 0.7558024, -0.3340167, 1, 0, 0, 1, 1,
-0.6194384, 0.111213, -2.491499, 1, 0, 0, 1, 1,
-0.616138, 0.3899189, -0.3255527, 1, 0, 0, 1, 1,
-0.613363, 1.022068, -0.5244445, 1, 0, 0, 1, 1,
-0.6099653, -0.9514223, -2.087898, 1, 0, 0, 1, 1,
-0.6094121, -0.3922303, -1.471042, 0, 0, 0, 1, 1,
-0.6078739, 0.3925469, -1.884748, 0, 0, 0, 1, 1,
-0.6062444, -0.7774659, -1.548834, 0, 0, 0, 1, 1,
-0.6024685, 0.9141446, -0.9932418, 0, 0, 0, 1, 1,
-0.6013878, -0.2655791, -2.377927, 0, 0, 0, 1, 1,
-0.5979996, -0.01890837, -0.8799906, 0, 0, 0, 1, 1,
-0.5960812, -1.494664, -3.908942, 0, 0, 0, 1, 1,
-0.5954162, -1.550221, -1.9292, 1, 1, 1, 1, 1,
-0.5919579, -0.5886469, -3.482478, 1, 1, 1, 1, 1,
-0.5864967, 1.067429, -1.03477, 1, 1, 1, 1, 1,
-0.5832451, -0.7561641, -4.175684, 1, 1, 1, 1, 1,
-0.5804785, -1.611803, -3.268685, 1, 1, 1, 1, 1,
-0.5748822, 0.3429438, -2.231503, 1, 1, 1, 1, 1,
-0.5677176, -1.171238, -1.615493, 1, 1, 1, 1, 1,
-0.5667416, 1.024064, -1.019384, 1, 1, 1, 1, 1,
-0.5665189, 1.334706, -0.6163041, 1, 1, 1, 1, 1,
-0.5623988, -0.3908799, -2.898991, 1, 1, 1, 1, 1,
-0.5610874, -0.5513536, 0.8902317, 1, 1, 1, 1, 1,
-0.5606429, -0.3241705, -2.072613, 1, 1, 1, 1, 1,
-0.5569572, -0.2237027, -0.8433565, 1, 1, 1, 1, 1,
-0.5558876, 0.06338471, 0.6414796, 1, 1, 1, 1, 1,
-0.5530582, 0.7660192, -1.476076, 1, 1, 1, 1, 1,
-0.5523561, -0.860486, -1.864073, 0, 0, 1, 1, 1,
-0.5487239, 0.1726191, -1.335409, 1, 0, 0, 1, 1,
-0.5471644, -0.8669981, -3.215023, 1, 0, 0, 1, 1,
-0.5400113, -0.3943739, -3.237274, 1, 0, 0, 1, 1,
-0.539616, 0.4948144, -2.983833, 1, 0, 0, 1, 1,
-0.5384657, 1.14725, 1.068118, 1, 0, 0, 1, 1,
-0.5378683, 1.711712, 1.06183, 0, 0, 0, 1, 1,
-0.5348276, -0.9990587, -1.095821, 0, 0, 0, 1, 1,
-0.5269914, -1.623327, -3.016268, 0, 0, 0, 1, 1,
-0.5258656, 0.4259309, -1.198189, 0, 0, 0, 1, 1,
-0.5237022, 0.2202496, -0.2440502, 0, 0, 0, 1, 1,
-0.5214548, 0.1526757, 0.07231101, 0, 0, 0, 1, 1,
-0.518894, 0.1313426, -1.60695, 0, 0, 0, 1, 1,
-0.5187946, -0.7469241, -3.590678, 1, 1, 1, 1, 1,
-0.5148063, -0.5302542, -2.504492, 1, 1, 1, 1, 1,
-0.5106899, 0.8995593, -1.049398, 1, 1, 1, 1, 1,
-0.5094495, -0.4404396, -3.706857, 1, 1, 1, 1, 1,
-0.504083, 0.8265029, -0.3246892, 1, 1, 1, 1, 1,
-0.5033239, 0.004436913, -1.004929, 1, 1, 1, 1, 1,
-0.5004926, -0.9084333, 0.3500721, 1, 1, 1, 1, 1,
-0.4966543, 0.5748807, -0.5432339, 1, 1, 1, 1, 1,
-0.4945812, -1.406416, -3.863151, 1, 1, 1, 1, 1,
-0.4930306, 0.0213511, -0.1682725, 1, 1, 1, 1, 1,
-0.4855205, -1.320134, -4.526032, 1, 1, 1, 1, 1,
-0.4853963, -0.3074785, -1.876253, 1, 1, 1, 1, 1,
-0.4853393, -0.7323496, -2.114486, 1, 1, 1, 1, 1,
-0.4849441, 0.3272721, 0.3329336, 1, 1, 1, 1, 1,
-0.4844238, 0.839278, -2.636877, 1, 1, 1, 1, 1,
-0.4743789, -0.5132589, -3.661126, 0, 0, 1, 1, 1,
-0.4634642, 0.7386885, -0.913389, 1, 0, 0, 1, 1,
-0.458658, 0.6316494, -0.9598227, 1, 0, 0, 1, 1,
-0.4582515, 1.529333, 0.4311373, 1, 0, 0, 1, 1,
-0.4575264, -1.324186, -6.252175, 1, 0, 0, 1, 1,
-0.4549329, 0.07269195, -0.5994298, 1, 0, 0, 1, 1,
-0.4509515, 1.214002, 0.3056865, 0, 0, 0, 1, 1,
-0.4500061, -1.011719, -0.764048, 0, 0, 0, 1, 1,
-0.4498164, -1.808208, -1.893769, 0, 0, 0, 1, 1,
-0.4460178, -0.3368428, -1.918894, 0, 0, 0, 1, 1,
-0.4410802, 0.8769615, -0.1420061, 0, 0, 0, 1, 1,
-0.4405733, 0.3609347, -0.8830479, 0, 0, 0, 1, 1,
-0.4343792, -0.1754012, -1.394575, 0, 0, 0, 1, 1,
-0.433543, 0.01965506, -2.80785, 1, 1, 1, 1, 1,
-0.4297294, 0.2278782, -2.020909, 1, 1, 1, 1, 1,
-0.4224551, -0.3658896, -1.303241, 1, 1, 1, 1, 1,
-0.4204346, -1.062884, -2.210998, 1, 1, 1, 1, 1,
-0.4196985, 0.7948055, 0.2845232, 1, 1, 1, 1, 1,
-0.4193488, 0.2697075, -0.8622744, 1, 1, 1, 1, 1,
-0.4170614, -0.6161165, -1.860883, 1, 1, 1, 1, 1,
-0.4154362, 1.294412, -1.699515, 1, 1, 1, 1, 1,
-0.415042, 0.9780275, 0.1485743, 1, 1, 1, 1, 1,
-0.4064198, -1.897343, -3.136683, 1, 1, 1, 1, 1,
-0.4025987, 0.8337846, -1.675578, 1, 1, 1, 1, 1,
-0.400944, 0.6761311, -1.251901, 1, 1, 1, 1, 1,
-0.4005175, 2.406696, 1.383058, 1, 1, 1, 1, 1,
-0.3991328, -1.139588, -1.179859, 1, 1, 1, 1, 1,
-0.3974403, -2.351605, -2.454272, 1, 1, 1, 1, 1,
-0.3966522, 1.218192, 0.437063, 0, 0, 1, 1, 1,
-0.3875256, 1.059734, -0.7258571, 1, 0, 0, 1, 1,
-0.3832453, -1.981191, -2.385286, 1, 0, 0, 1, 1,
-0.3802338, -0.5313348, -2.723402, 1, 0, 0, 1, 1,
-0.3792294, -0.6157745, -2.138775, 1, 0, 0, 1, 1,
-0.3776793, 0.7650887, 0.1397436, 1, 0, 0, 1, 1,
-0.3773682, -0.2426965, -4.35283, 0, 0, 0, 1, 1,
-0.3759798, -0.2485477, -2.044498, 0, 0, 0, 1, 1,
-0.3705172, 1.358065, -1.413336, 0, 0, 0, 1, 1,
-0.3654036, -1.415062, -1.023968, 0, 0, 0, 1, 1,
-0.3579078, -0.3969927, -3.536051, 0, 0, 0, 1, 1,
-0.3476695, -0.4716656, -1.883441, 0, 0, 0, 1, 1,
-0.3476652, -0.1014018, -2.54386, 0, 0, 0, 1, 1,
-0.3403834, -0.6636409, -1.855969, 1, 1, 1, 1, 1,
-0.3386995, 0.7132044, -0.9496643, 1, 1, 1, 1, 1,
-0.3363422, -1.371932, -5.227222, 1, 1, 1, 1, 1,
-0.3330986, -0.8035198, -4.008323, 1, 1, 1, 1, 1,
-0.3320112, -0.3796513, -1.700006, 1, 1, 1, 1, 1,
-0.3304706, -1.259072, -1.490728, 1, 1, 1, 1, 1,
-0.3253598, -0.2021068, -3.1817, 1, 1, 1, 1, 1,
-0.3245768, 1.277676, 0.149238, 1, 1, 1, 1, 1,
-0.3211209, 0.9811696, 0.8414584, 1, 1, 1, 1, 1,
-0.3182667, 0.2046266, -0.4128579, 1, 1, 1, 1, 1,
-0.3168128, -0.5354666, -3.181615, 1, 1, 1, 1, 1,
-0.3157223, 1.104705, 1.237519, 1, 1, 1, 1, 1,
-0.315527, 0.03926561, -0.6123869, 1, 1, 1, 1, 1,
-0.3136913, 0.6829755, -1.476794, 1, 1, 1, 1, 1,
-0.3127716, -0.329451, -3.035257, 1, 1, 1, 1, 1,
-0.3121937, -0.2670529, -1.247511, 0, 0, 1, 1, 1,
-0.308468, -0.01827932, -0.7226115, 1, 0, 0, 1, 1,
-0.30844, -1.211402, -4.23371, 1, 0, 0, 1, 1,
-0.3012047, 2.059067, 0.4896873, 1, 0, 0, 1, 1,
-0.3005368, -0.3068571, -2.605483, 1, 0, 0, 1, 1,
-0.288288, 1.491488, -0.301918, 1, 0, 0, 1, 1,
-0.2872655, 0.5011895, -0.2833872, 0, 0, 0, 1, 1,
-0.2837636, -0.6434525, -3.31731, 0, 0, 0, 1, 1,
-0.2832925, -0.4090534, -3.641519, 0, 0, 0, 1, 1,
-0.2823707, 0.4788416, -2.153555, 0, 0, 0, 1, 1,
-0.2816446, -2.148262, -3.202849, 0, 0, 0, 1, 1,
-0.2777077, 0.9770513, -1.441018, 0, 0, 0, 1, 1,
-0.2719941, 1.411585, -0.1376224, 0, 0, 0, 1, 1,
-0.2711284, -0.8116999, -1.870529, 1, 1, 1, 1, 1,
-0.2708313, -0.3780786, -2.648133, 1, 1, 1, 1, 1,
-0.270669, 0.6507629, 0.9249362, 1, 1, 1, 1, 1,
-0.2614264, -0.7778929, -1.864093, 1, 1, 1, 1, 1,
-0.2609423, -2.07548, -2.019172, 1, 1, 1, 1, 1,
-0.2594228, -1.086305, -0.8849534, 1, 1, 1, 1, 1,
-0.2578887, 1.534879, -0.6718721, 1, 1, 1, 1, 1,
-0.257698, -0.4509215, -2.46066, 1, 1, 1, 1, 1,
-0.2534438, 0.3499568, -1.644972, 1, 1, 1, 1, 1,
-0.2519524, -0.4313947, -2.22254, 1, 1, 1, 1, 1,
-0.2488749, -1.246727, -3.337106, 1, 1, 1, 1, 1,
-0.2397656, -1.379174, -2.676915, 1, 1, 1, 1, 1,
-0.2359373, 0.2897316, -0.4269302, 1, 1, 1, 1, 1,
-0.229692, -1.760427, -1.383481, 1, 1, 1, 1, 1,
-0.228666, 0.7388138, -0.9286841, 1, 1, 1, 1, 1,
-0.2206421, 1.249091, 0.4058683, 0, 0, 1, 1, 1,
-0.2204212, 0.603039, 0.9547466, 1, 0, 0, 1, 1,
-0.2180088, 1.06041, -0.2163431, 1, 0, 0, 1, 1,
-0.2174324, 0.312177, -1.509893, 1, 0, 0, 1, 1,
-0.2170302, -1.030304, -3.141334, 1, 0, 0, 1, 1,
-0.2167639, -0.1980115, -1.966511, 1, 0, 0, 1, 1,
-0.2133697, -0.2685842, -1.678581, 0, 0, 0, 1, 1,
-0.2102615, -2.521409, -3.015311, 0, 0, 0, 1, 1,
-0.2072297, 2.467932, -2.347703, 0, 0, 0, 1, 1,
-0.2056347, 1.201087, -2.287452, 0, 0, 0, 1, 1,
-0.2031826, -0.9950209, -3.64106, 0, 0, 0, 1, 1,
-0.1995744, -0.6988197, -3.3281, 0, 0, 0, 1, 1,
-0.1960619, 0.3629144, 0.2717404, 0, 0, 0, 1, 1,
-0.1931157, 0.2423276, -0.03188474, 1, 1, 1, 1, 1,
-0.191891, 0.4788557, -1.270714, 1, 1, 1, 1, 1,
-0.1916488, 0.9440337, 0.5600625, 1, 1, 1, 1, 1,
-0.1878938, -0.7094209, -4.318682, 1, 1, 1, 1, 1,
-0.1869482, -0.06818423, -3.102809, 1, 1, 1, 1, 1,
-0.1865932, 1.295736, -1.249107, 1, 1, 1, 1, 1,
-0.1853352, -0.2101919, -3.84749, 1, 1, 1, 1, 1,
-0.1837636, 1.296575, -0.4226465, 1, 1, 1, 1, 1,
-0.1831819, -1.598882, -2.559973, 1, 1, 1, 1, 1,
-0.1815379, -0.151549, -1.064247, 1, 1, 1, 1, 1,
-0.1756772, -2.302426, -3.598993, 1, 1, 1, 1, 1,
-0.1731582, -0.979944, -2.098764, 1, 1, 1, 1, 1,
-0.1724158, -0.1999888, -2.345413, 1, 1, 1, 1, 1,
-0.1676823, 0.4819652, 0.06327891, 1, 1, 1, 1, 1,
-0.1654528, -0.6482388, -3.437943, 1, 1, 1, 1, 1,
-0.1621033, -1.560372, -3.607983, 0, 0, 1, 1, 1,
-0.1608971, -2.468791, -4.109772, 1, 0, 0, 1, 1,
-0.1594352, 0.8366212, 1.115155, 1, 0, 0, 1, 1,
-0.1558072, -0.5272291, -1.615227, 1, 0, 0, 1, 1,
-0.1555396, 0.2620215, -1.592592, 1, 0, 0, 1, 1,
-0.1542553, 0.1975207, -1.526736, 1, 0, 0, 1, 1,
-0.1533366, 0.1589765, 1.319179, 0, 0, 0, 1, 1,
-0.1525525, -1.774323, -1.067376, 0, 0, 0, 1, 1,
-0.15217, 0.4032822, 0.1129421, 0, 0, 0, 1, 1,
-0.1516202, 0.2867974, -0.02287036, 0, 0, 0, 1, 1,
-0.1503205, -0.2687232, -3.578346, 0, 0, 0, 1, 1,
-0.1496505, -1.547499, -1.730279, 0, 0, 0, 1, 1,
-0.1479075, 0.08871182, 1.087641, 0, 0, 0, 1, 1,
-0.1467838, 1.659534, -0.6244322, 1, 1, 1, 1, 1,
-0.1452474, 3.505044, -1.296736, 1, 1, 1, 1, 1,
-0.141881, 0.4778018, -0.8026898, 1, 1, 1, 1, 1,
-0.1397989, -2.189171, -2.450008, 1, 1, 1, 1, 1,
-0.1391597, 0.2391877, 0.1916697, 1, 1, 1, 1, 1,
-0.1380634, 2.058501, 0.9822423, 1, 1, 1, 1, 1,
-0.1377252, -0.4728228, -2.965237, 1, 1, 1, 1, 1,
-0.1375248, -0.04904407, -0.7487299, 1, 1, 1, 1, 1,
-0.1368369, 0.02719236, 0.3656774, 1, 1, 1, 1, 1,
-0.1364258, 0.9626975, -1.407893, 1, 1, 1, 1, 1,
-0.1352044, -0.8647968, -3.944321, 1, 1, 1, 1, 1,
-0.130717, -0.2039227, -2.132992, 1, 1, 1, 1, 1,
-0.1296697, -0.9383028, -3.646327, 1, 1, 1, 1, 1,
-0.1282924, 0.4443021, 0.559404, 1, 1, 1, 1, 1,
-0.1278032, -0.5214692, -1.964164, 1, 1, 1, 1, 1,
-0.1272775, 0.1955322, 0.5195517, 0, 0, 1, 1, 1,
-0.1266904, 1.149016, 0.2936693, 1, 0, 0, 1, 1,
-0.1247906, 0.3747536, -1.16218, 1, 0, 0, 1, 1,
-0.1245449, -0.270144, -2.016113, 1, 0, 0, 1, 1,
-0.1233716, -1.195485, -2.907208, 1, 0, 0, 1, 1,
-0.1160169, -2.109104, -2.589857, 1, 0, 0, 1, 1,
-0.1148682, -1.048255, -2.694724, 0, 0, 0, 1, 1,
-0.1119718, 1.319315, 1.439068, 0, 0, 0, 1, 1,
-0.1071083, -0.7877145, -3.749629, 0, 0, 0, 1, 1,
-0.09798763, 0.7965819, -0.4353923, 0, 0, 0, 1, 1,
-0.09787665, -1.188229, -2.950064, 0, 0, 0, 1, 1,
-0.09784865, -0.4057922, -2.385193, 0, 0, 0, 1, 1,
-0.09120286, 1.102398, -0.05238622, 0, 0, 0, 1, 1,
-0.08690751, 1.021678, -0.6234722, 1, 1, 1, 1, 1,
-0.0860299, 1.421315, 0.9872951, 1, 1, 1, 1, 1,
-0.08318296, 1.489555, -0.5561326, 1, 1, 1, 1, 1,
-0.07980271, -1.56142, -2.578706, 1, 1, 1, 1, 1,
-0.07839235, -0.6447371, -1.90337, 1, 1, 1, 1, 1,
-0.07592051, -2.913191, -2.092443, 1, 1, 1, 1, 1,
-0.07561707, -1.163448, -2.852339, 1, 1, 1, 1, 1,
-0.07359724, 0.7490769, 1.667696, 1, 1, 1, 1, 1,
-0.07200857, -1.882351, -4.332103, 1, 1, 1, 1, 1,
-0.06737211, -1.014067, -2.393976, 1, 1, 1, 1, 1,
-0.06507218, 0.331979, -0.6827068, 1, 1, 1, 1, 1,
-0.06440824, 0.809344, -0.4808686, 1, 1, 1, 1, 1,
-0.0637754, -0.05750873, -1.429265, 1, 1, 1, 1, 1,
-0.0625684, -0.7017933, -3.185624, 1, 1, 1, 1, 1,
-0.06222751, -0.4208114, -0.9354294, 1, 1, 1, 1, 1,
-0.06027409, -0.8431109, -3.069337, 0, 0, 1, 1, 1,
-0.05981109, -0.09529231, -3.830001, 1, 0, 0, 1, 1,
-0.05926212, -1.046269, -4.407071, 1, 0, 0, 1, 1,
-0.05778772, 1.942933, 0.5248404, 1, 0, 0, 1, 1,
-0.05620036, 1.02446, -1.505677, 1, 0, 0, 1, 1,
-0.05159926, -1.391177, -2.714703, 1, 0, 0, 1, 1,
-0.04782908, -0.3601398, -2.908551, 0, 0, 0, 1, 1,
-0.04771709, -0.08031957, -1.85629, 0, 0, 0, 1, 1,
-0.04548041, -1.589025, -2.652732, 0, 0, 0, 1, 1,
-0.04101046, -0.7030402, -0.5739705, 0, 0, 0, 1, 1,
-0.04096739, -0.4318084, -3.430446, 0, 0, 0, 1, 1,
-0.03897669, -1.327214, -2.874557, 0, 0, 0, 1, 1,
-0.03398547, -1.498814, -4.144263, 0, 0, 0, 1, 1,
-0.0321606, -0.6963505, -3.133213, 1, 1, 1, 1, 1,
-0.03020412, 2.051289, 0.7638363, 1, 1, 1, 1, 1,
-0.02880118, -0.8432437, -1.828326, 1, 1, 1, 1, 1,
-0.02706138, 0.2927939, -1.384897, 1, 1, 1, 1, 1,
-0.02464224, 0.5149752, -0.4988009, 1, 1, 1, 1, 1,
-0.02242537, -1.060822, -3.737673, 1, 1, 1, 1, 1,
-0.0210437, 1.694261, 0.3168025, 1, 1, 1, 1, 1,
-0.01703557, 0.2058045, -1.083426, 1, 1, 1, 1, 1,
-0.01647459, -1.448361, -4.555005, 1, 1, 1, 1, 1,
-0.009679923, 0.4181799, -0.2438896, 1, 1, 1, 1, 1,
-0.008230645, 0.4100895, -1.220755, 1, 1, 1, 1, 1,
-0.006803624, 0.1261931, 0.6426413, 1, 1, 1, 1, 1,
-0.002970774, 1.243023, -0.3454373, 1, 1, 1, 1, 1,
-0.002023051, 0.6028745, -0.31287, 1, 1, 1, 1, 1,
-0.001532666, -0.3823923, -3.281784, 1, 1, 1, 1, 1,
-0.001499458, 0.9279899, 1.033074, 0, 0, 1, 1, 1,
0.002252949, 0.8419616, 2.059813, 1, 0, 0, 1, 1,
0.009697076, -0.463998, 2.267694, 1, 0, 0, 1, 1,
0.009998856, 0.4744996, 0.08539733, 1, 0, 0, 1, 1,
0.01232323, 1.079283, 2.223248, 1, 0, 0, 1, 1,
0.01411396, -1.904227, 3.606576, 1, 0, 0, 1, 1,
0.01516501, 0.6891085, 1.891133, 0, 0, 0, 1, 1,
0.01691014, -1.474369, 4.677703, 0, 0, 0, 1, 1,
0.01974841, 1.012742, -0.07544107, 0, 0, 0, 1, 1,
0.0202083, 0.5136418, -0.6409728, 0, 0, 0, 1, 1,
0.02551753, 0.923637, 0.1064941, 0, 0, 0, 1, 1,
0.02593773, -0.6663082, 2.164179, 0, 0, 0, 1, 1,
0.03060299, 0.3297146, -0.8546433, 0, 0, 0, 1, 1,
0.03357075, 1.978139, 0.3306037, 1, 1, 1, 1, 1,
0.03378733, -0.2037589, 2.298187, 1, 1, 1, 1, 1,
0.03443995, 0.7303212, 1.933152, 1, 1, 1, 1, 1,
0.03522489, -0.9687101, 2.001959, 1, 1, 1, 1, 1,
0.03525973, 0.2162513, 2.328249, 1, 1, 1, 1, 1,
0.03999144, 0.8478789, 0.385543, 1, 1, 1, 1, 1,
0.04757408, 0.7642282, -0.3500368, 1, 1, 1, 1, 1,
0.05107039, -2.978506, 3.018773, 1, 1, 1, 1, 1,
0.05781684, -0.2019518, 2.101224, 1, 1, 1, 1, 1,
0.05900115, -0.7806802, 1.372863, 1, 1, 1, 1, 1,
0.06379384, 0.6406457, 2.075613, 1, 1, 1, 1, 1,
0.06864037, -0.3821121, 2.382313, 1, 1, 1, 1, 1,
0.07538403, -1.723411, 2.836699, 1, 1, 1, 1, 1,
0.08023384, -1.143777, 3.361667, 1, 1, 1, 1, 1,
0.08083909, -0.7438905, 2.424579, 1, 1, 1, 1, 1,
0.08287235, 0.005436128, 1.661268, 0, 0, 1, 1, 1,
0.08668032, -0.0424259, 2.398937, 1, 0, 0, 1, 1,
0.08709661, 0.7214349, 0.8517421, 1, 0, 0, 1, 1,
0.08786815, -0.1534587, 2.603717, 1, 0, 0, 1, 1,
0.08809853, 0.1118035, 0.6065779, 1, 0, 0, 1, 1,
0.09245972, 0.4815865, 0.5418501, 1, 0, 0, 1, 1,
0.09264478, 0.3755982, 3.204136, 0, 0, 0, 1, 1,
0.0934926, -2.157342, 2.41187, 0, 0, 0, 1, 1,
0.09543838, 0.5110976, -0.5863982, 0, 0, 0, 1, 1,
0.09564713, -0.5142975, 4.736993, 0, 0, 0, 1, 1,
0.097386, 1.250997, 0.850423, 0, 0, 0, 1, 1,
0.1055555, -0.6186054, 2.054316, 0, 0, 0, 1, 1,
0.1077515, 0.1007001, 0.1195844, 0, 0, 0, 1, 1,
0.1091111, 1.431741, 1.668095, 1, 1, 1, 1, 1,
0.1093464, 1.423633, -0.8564724, 1, 1, 1, 1, 1,
0.1095257, 1.014342, -1.730237, 1, 1, 1, 1, 1,
0.1108607, 1.628996, 0.3159264, 1, 1, 1, 1, 1,
0.1195147, 0.09539894, 0.7139933, 1, 1, 1, 1, 1,
0.1238301, 1.411842, 0.8365442, 1, 1, 1, 1, 1,
0.1259432, 1.123855, -1.242859, 1, 1, 1, 1, 1,
0.1279134, 0.02386713, 1.66658, 1, 1, 1, 1, 1,
0.1308942, -0.1710731, 3.001128, 1, 1, 1, 1, 1,
0.1348599, 0.8301043, -0.4104168, 1, 1, 1, 1, 1,
0.1353942, -0.540758, 3.716514, 1, 1, 1, 1, 1,
0.1381853, -0.5007246, 2.887325, 1, 1, 1, 1, 1,
0.1383553, 0.5182995, 0.9736816, 1, 1, 1, 1, 1,
0.1424435, -1.182244, 2.991542, 1, 1, 1, 1, 1,
0.1485054, 1.357605, -1.845301, 1, 1, 1, 1, 1,
0.1545909, 0.3200391, 1.571585, 0, 0, 1, 1, 1,
0.1564134, -0.2091013, 3.163392, 1, 0, 0, 1, 1,
0.1578677, -1.688363, 1.881131, 1, 0, 0, 1, 1,
0.1625728, 0.08289713, 0.7978865, 1, 0, 0, 1, 1,
0.1627126, -0.6311348, 3.36974, 1, 0, 0, 1, 1,
0.1651063, 0.21588, 2.703592, 1, 0, 0, 1, 1,
0.165843, -0.3423907, 4.035102, 0, 0, 0, 1, 1,
0.1669274, 1.311652, 0.4137356, 0, 0, 0, 1, 1,
0.1677001, 0.9090573, -0.7931519, 0, 0, 0, 1, 1,
0.1732687, -0.5639529, 3.253982, 0, 0, 0, 1, 1,
0.1767206, 0.1238012, 0.6704985, 0, 0, 0, 1, 1,
0.1788246, 0.9775394, 1.324709, 0, 0, 0, 1, 1,
0.1795763, -0.3382393, 2.556526, 0, 0, 0, 1, 1,
0.1879279, 1.089377, 0.5495154, 1, 1, 1, 1, 1,
0.1901024, -1.314215, 4.09798, 1, 1, 1, 1, 1,
0.1901656, 0.4712652, -0.6136364, 1, 1, 1, 1, 1,
0.1914082, 0.07227571, 2.517134, 1, 1, 1, 1, 1,
0.1945827, 0.6072575, -0.1792291, 1, 1, 1, 1, 1,
0.1985764, 0.4328988, 1.86543, 1, 1, 1, 1, 1,
0.2015748, 0.7940425, -1.031489, 1, 1, 1, 1, 1,
0.2052489, 0.4570227, 0.9669891, 1, 1, 1, 1, 1,
0.2167782, 0.1771897, 1.605348, 1, 1, 1, 1, 1,
0.2187206, 0.08618288, 1.031634, 1, 1, 1, 1, 1,
0.2207652, -2.34044, 2.587014, 1, 1, 1, 1, 1,
0.2208443, -1.186607, 1.735126, 1, 1, 1, 1, 1,
0.2244442, 0.09081933, 0.3351671, 1, 1, 1, 1, 1,
0.2247763, -1.593913, 2.575128, 1, 1, 1, 1, 1,
0.2253763, 0.6915333, -2.063919, 1, 1, 1, 1, 1,
0.2263202, 1.465801, -0.06494648, 0, 0, 1, 1, 1,
0.2302739, -1.563028, 2.259195, 1, 0, 0, 1, 1,
0.2321729, 2.5443, -0.4765008, 1, 0, 0, 1, 1,
0.2328516, 0.3498525, 0.0907005, 1, 0, 0, 1, 1,
0.2346415, -0.0219014, 0.4664528, 1, 0, 0, 1, 1,
0.2366749, -0.5013329, 2.595897, 1, 0, 0, 1, 1,
0.2367342, -1.49458, 2.015993, 0, 0, 0, 1, 1,
0.2390207, -0.5265888, 1.528962, 0, 0, 0, 1, 1,
0.2396286, 0.8369694, 1.111133, 0, 0, 0, 1, 1,
0.2400843, 1.045084, 1.229639, 0, 0, 0, 1, 1,
0.240712, -0.1410688, 2.815394, 0, 0, 0, 1, 1,
0.2462212, -0.2059634, 2.113775, 0, 0, 0, 1, 1,
0.246822, 2.314131, -0.1394758, 0, 0, 0, 1, 1,
0.2520067, 0.5131308, 0.3664218, 1, 1, 1, 1, 1,
0.2537274, 1.352476, -2.46795, 1, 1, 1, 1, 1,
0.2546257, 1.041243, 0.2850327, 1, 1, 1, 1, 1,
0.255743, 1.385239, 1.716414, 1, 1, 1, 1, 1,
0.2561556, 1.00668, -0.07711874, 1, 1, 1, 1, 1,
0.2601334, -0.5805132, 3.15171, 1, 1, 1, 1, 1,
0.2601892, -1.239135, 3.541626, 1, 1, 1, 1, 1,
0.2602861, -2.040555, 2.823436, 1, 1, 1, 1, 1,
0.264251, -0.8571853, 2.105504, 1, 1, 1, 1, 1,
0.266154, -0.6959902, 0.8625593, 1, 1, 1, 1, 1,
0.267909, 1.232254, -2.160142, 1, 1, 1, 1, 1,
0.2724511, 1.489462, 0.9509435, 1, 1, 1, 1, 1,
0.2729075, 0.9963617, -0.5553583, 1, 1, 1, 1, 1,
0.2757703, 0.6087652, 1.134182, 1, 1, 1, 1, 1,
0.2775888, -0.6132048, 2.746511, 1, 1, 1, 1, 1,
0.2799496, 0.696, -0.3692786, 0, 0, 1, 1, 1,
0.2813619, -0.7662758, 0.4472066, 1, 0, 0, 1, 1,
0.2851034, 0.1992204, 2.062286, 1, 0, 0, 1, 1,
0.2861563, 0.3883013, 0.6836966, 1, 0, 0, 1, 1,
0.2910699, 0.4859419, -0.05237151, 1, 0, 0, 1, 1,
0.2955222, -1.354073, 2.036039, 1, 0, 0, 1, 1,
0.2964587, 0.7440113, -0.2793797, 0, 0, 0, 1, 1,
0.3005555, -0.8267822, 1.935427, 0, 0, 0, 1, 1,
0.3044801, -1.170235, 1.884201, 0, 0, 0, 1, 1,
0.3093939, -0.0193518, 2.06118, 0, 0, 0, 1, 1,
0.3119724, 1.044994, 0.8263851, 0, 0, 0, 1, 1,
0.3153913, 0.83178, 0.640955, 0, 0, 0, 1, 1,
0.3176541, -0.2097993, 1.342112, 0, 0, 0, 1, 1,
0.3222085, -2.090894, 2.81544, 1, 1, 1, 1, 1,
0.3323804, 1.854471, 1.408249, 1, 1, 1, 1, 1,
0.3323913, -1.107299, 2.40596, 1, 1, 1, 1, 1,
0.3397924, 0.6293794, 0.5227737, 1, 1, 1, 1, 1,
0.3438362, -0.4782325, 1.765842, 1, 1, 1, 1, 1,
0.3466983, -1.17074, 3.48869, 1, 1, 1, 1, 1,
0.3534411, -0.07647683, 2.227914, 1, 1, 1, 1, 1,
0.3595343, 0.9953573, 1.368502, 1, 1, 1, 1, 1,
0.3598925, 0.3270676, 0.3151006, 1, 1, 1, 1, 1,
0.3610292, -0.3246612, 3.214551, 1, 1, 1, 1, 1,
0.3610622, -0.839172, 2.87415, 1, 1, 1, 1, 1,
0.3611552, 1.640975, 0.4577314, 1, 1, 1, 1, 1,
0.3634487, 2.740011, -0.9609186, 1, 1, 1, 1, 1,
0.3673741, -0.1278396, 2.8242, 1, 1, 1, 1, 1,
0.3866044, 0.04429699, 0.468676, 1, 1, 1, 1, 1,
0.3907548, 1.528773, 0.3665421, 0, 0, 1, 1, 1,
0.392886, -1.043277, 1.098075, 1, 0, 0, 1, 1,
0.3939537, 0.3329723, 0.6866307, 1, 0, 0, 1, 1,
0.3998708, 0.5900294, 1.670779, 1, 0, 0, 1, 1,
0.4027377, -0.07281853, 2.357421, 1, 0, 0, 1, 1,
0.4032647, 1.365106, 1.67209, 1, 0, 0, 1, 1,
0.4053044, -2.105173, 2.826233, 0, 0, 0, 1, 1,
0.4073362, -0.8349044, 1.793912, 0, 0, 0, 1, 1,
0.4080403, -2.256712, 3.879763, 0, 0, 0, 1, 1,
0.4083932, 0.6313419, 1.433897, 0, 0, 0, 1, 1,
0.409239, -0.04148482, 2.356994, 0, 0, 0, 1, 1,
0.4139118, 1.317635, -0.4283388, 0, 0, 0, 1, 1,
0.4143285, -0.4882464, 2.652757, 0, 0, 0, 1, 1,
0.4239223, -1.053643, 4.424079, 1, 1, 1, 1, 1,
0.4260353, 1.264878, 0.8835119, 1, 1, 1, 1, 1,
0.4271483, 1.610383, 0.6680672, 1, 1, 1, 1, 1,
0.4274261, 0.9480729, -0.1908323, 1, 1, 1, 1, 1,
0.4323516, -1.081996, 1.35759, 1, 1, 1, 1, 1,
0.4338962, 1.775261, 1.209103, 1, 1, 1, 1, 1,
0.4358884, 0.3781414, -0.02957904, 1, 1, 1, 1, 1,
0.4390696, -1.08188, 2.978658, 1, 1, 1, 1, 1,
0.4405034, 0.8522382, 0.09758703, 1, 1, 1, 1, 1,
0.4405977, -0.6681027, 2.717866, 1, 1, 1, 1, 1,
0.4449969, 0.9229329, 0.4395101, 1, 1, 1, 1, 1,
0.4450936, -0.4079926, 3.224456, 1, 1, 1, 1, 1,
0.4504313, -0.5436232, 2.263213, 1, 1, 1, 1, 1,
0.4515323, 0.3498951, 0.7654998, 1, 1, 1, 1, 1,
0.4518256, -0.4514071, 2.652751, 1, 1, 1, 1, 1,
0.4549157, -0.09955996, 1.575616, 0, 0, 1, 1, 1,
0.4604689, 0.8072651, 0.7272022, 1, 0, 0, 1, 1,
0.4617296, -0.05188652, 1.246774, 1, 0, 0, 1, 1,
0.4630443, -0.5776744, 3.601094, 1, 0, 0, 1, 1,
0.4690684, -1.375578, 3.296112, 1, 0, 0, 1, 1,
0.4696987, 0.9606043, 0.1891821, 1, 0, 0, 1, 1,
0.4801168, 0.9392723, -0.3827544, 0, 0, 0, 1, 1,
0.4810241, -0.10761, 1.303951, 0, 0, 0, 1, 1,
0.4828832, 0.2334995, 0.6743283, 0, 0, 0, 1, 1,
0.4833393, -1.121209, 3.787153, 0, 0, 0, 1, 1,
0.4840518, 1.069528, 2.04122, 0, 0, 0, 1, 1,
0.4872835, -0.04310511, 0.8338339, 0, 0, 0, 1, 1,
0.4889652, 0.7735599, 0.6173418, 0, 0, 0, 1, 1,
0.4905775, 0.5535875, -0.8716934, 1, 1, 1, 1, 1,
0.4930612, -0.2510079, 2.409609, 1, 1, 1, 1, 1,
0.5087307, 0.06930104, 1.316855, 1, 1, 1, 1, 1,
0.5150116, 1.514151, -0.242036, 1, 1, 1, 1, 1,
0.5222805, 0.7430896, 0.1316306, 1, 1, 1, 1, 1,
0.5251855, 0.1015339, 1.6782, 1, 1, 1, 1, 1,
0.5336986, 0.4336244, -0.3346273, 1, 1, 1, 1, 1,
0.5364092, 0.08318875, 2.115321, 1, 1, 1, 1, 1,
0.539772, -1.382848, 3.669339, 1, 1, 1, 1, 1,
0.5470934, 0.3174939, 0.1870362, 1, 1, 1, 1, 1,
0.5486641, -0.1224553, 4.466161, 1, 1, 1, 1, 1,
0.5530028, -1.0743, 3.358878, 1, 1, 1, 1, 1,
0.5587393, -0.3647308, 1.407101, 1, 1, 1, 1, 1,
0.5618275, 0.2904683, 1.079072, 1, 1, 1, 1, 1,
0.5622775, 0.6438764, 0.8728402, 1, 1, 1, 1, 1,
0.5650711, -2.467623, 2.755501, 0, 0, 1, 1, 1,
0.5781084, -0.4506046, 2.332867, 1, 0, 0, 1, 1,
0.5829961, -0.7213963, 1.71951, 1, 0, 0, 1, 1,
0.5859129, -2.668187, 2.752, 1, 0, 0, 1, 1,
0.5881582, 2.308315, -1.882999, 1, 0, 0, 1, 1,
0.5941125, -1.483808, 3.254428, 1, 0, 0, 1, 1,
0.5974815, 0.6548699, -0.1483274, 0, 0, 0, 1, 1,
0.6081895, 0.2454551, 0.4609537, 0, 0, 0, 1, 1,
0.6170799, -0.3933862, 2.873527, 0, 0, 0, 1, 1,
0.6192272, 1.473315, 0.4090853, 0, 0, 0, 1, 1,
0.623888, 0.7782869, 1.597597, 0, 0, 0, 1, 1,
0.6247018, -0.1047833, 0.9789697, 0, 0, 0, 1, 1,
0.6253106, 1.075794, -1.175085, 0, 0, 0, 1, 1,
0.6275077, 0.2689967, 1.664482, 1, 1, 1, 1, 1,
0.6298171, 0.01006548, 4.154183, 1, 1, 1, 1, 1,
0.6313404, 0.7787043, 0.6075941, 1, 1, 1, 1, 1,
0.633462, -0.9119879, 3.447979, 1, 1, 1, 1, 1,
0.6381229, -0.8725095, 6.168863, 1, 1, 1, 1, 1,
0.6401362, 0.3379941, 0.4471157, 1, 1, 1, 1, 1,
0.6441201, 0.8450072, 1.499724, 1, 1, 1, 1, 1,
0.6487293, -0.3754458, 3.145216, 1, 1, 1, 1, 1,
0.6522625, 0.2047287, 2.164185, 1, 1, 1, 1, 1,
0.6600251, -0.999683, 3.330039, 1, 1, 1, 1, 1,
0.6620516, -0.8359241, 2.868431, 1, 1, 1, 1, 1,
0.664311, 1.364325, 1.943421, 1, 1, 1, 1, 1,
0.6682178, 0.6757363, 0.3975489, 1, 1, 1, 1, 1,
0.6725106, -0.854628, 1.845018, 1, 1, 1, 1, 1,
0.6849191, 0.2135996, 0.7022125, 1, 1, 1, 1, 1,
0.6853182, 2.792952, 0.3026066, 0, 0, 1, 1, 1,
0.6876839, -0.1402506, 2.377637, 1, 0, 0, 1, 1,
0.6906266, -0.2735429, 0.671554, 1, 0, 0, 1, 1,
0.6914883, -1.949346, 2.615297, 1, 0, 0, 1, 1,
0.7023763, 0.9442161, -0.5351248, 1, 0, 0, 1, 1,
0.7032589, 0.7574888, 1.04676, 1, 0, 0, 1, 1,
0.7048426, -0.4043729, 4.202575, 0, 0, 0, 1, 1,
0.7072192, -0.7290075, 2.38975, 0, 0, 0, 1, 1,
0.7162392, -1.783117, 2.666619, 0, 0, 0, 1, 1,
0.7208259, 0.5827814, 2.418489, 0, 0, 0, 1, 1,
0.7229258, 1.00123, 0.3273991, 0, 0, 0, 1, 1,
0.7297446, -0.8656914, 1.16676, 0, 0, 0, 1, 1,
0.7339207, 1.453596, -0.09728152, 0, 0, 0, 1, 1,
0.7390503, 0.2258811, -0.08515731, 1, 1, 1, 1, 1,
0.7402987, 0.1299938, 1.02016, 1, 1, 1, 1, 1,
0.7423432, -1.312354, 1.345053, 1, 1, 1, 1, 1,
0.7474195, -0.7864354, 2.128019, 1, 1, 1, 1, 1,
0.7474332, -0.1633502, 0.7880177, 1, 1, 1, 1, 1,
0.7554969, 0.5393434, -1.257332, 1, 1, 1, 1, 1,
0.7669652, 0.3181141, 2.688445, 1, 1, 1, 1, 1,
0.7740476, -0.8297179, 2.79222, 1, 1, 1, 1, 1,
0.7754296, -1.043799, 3.131095, 1, 1, 1, 1, 1,
0.7760624, 0.1269255, 2.474494, 1, 1, 1, 1, 1,
0.7763029, -0.6330136, 1.069281, 1, 1, 1, 1, 1,
0.7811456, -1.06575, 2.169458, 1, 1, 1, 1, 1,
0.7854552, 0.8242629, 0.02179134, 1, 1, 1, 1, 1,
0.7947798, -0.9567223, 2.781138, 1, 1, 1, 1, 1,
0.7958419, 0.250056, -0.003973583, 1, 1, 1, 1, 1,
0.8023435, -1.970723, 3.525004, 0, 0, 1, 1, 1,
0.8088655, -0.09618113, 0.9204061, 1, 0, 0, 1, 1,
0.8162872, -2.240238, 2.563241, 1, 0, 0, 1, 1,
0.8189871, 0.1891636, 1.230923, 1, 0, 0, 1, 1,
0.8222514, 1.022401, -1.411326, 1, 0, 0, 1, 1,
0.8248193, -0.3655751, 2.764631, 1, 0, 0, 1, 1,
0.8301085, -2.199474, 1.905178, 0, 0, 0, 1, 1,
0.8313523, 0.07375297, 1.357335, 0, 0, 0, 1, 1,
0.8313951, -1.555387, 1.813156, 0, 0, 0, 1, 1,
0.8384635, 0.3043795, 1.932778, 0, 0, 0, 1, 1,
0.8386801, -0.2720876, 1.709736, 0, 0, 0, 1, 1,
0.8423373, -0.3162201, 4.067317, 0, 0, 0, 1, 1,
0.8427767, 0.165261, 0.3532665, 0, 0, 0, 1, 1,
0.8448132, -0.6420941, 2.076101, 1, 1, 1, 1, 1,
0.84738, -3.327438, 2.778226, 1, 1, 1, 1, 1,
0.8488291, 0.473222, -0.008771461, 1, 1, 1, 1, 1,
0.8499799, 0.696984, 1.691766, 1, 1, 1, 1, 1,
0.8523363, -0.8239411, 3.14197, 1, 1, 1, 1, 1,
0.8578672, -1.495931, 3.170775, 1, 1, 1, 1, 1,
0.8623087, 0.1629215, 0.6020387, 1, 1, 1, 1, 1,
0.8714327, 0.4290412, 1.572, 1, 1, 1, 1, 1,
0.8723956, -0.4701436, 2.572498, 1, 1, 1, 1, 1,
0.8738185, 0.7041911, 0.2828285, 1, 1, 1, 1, 1,
0.8741238, -0.4962844, 2.506577, 1, 1, 1, 1, 1,
0.8769424, 0.5215607, 1.696151, 1, 1, 1, 1, 1,
0.8777654, -0.7183075, 1.952692, 1, 1, 1, 1, 1,
0.8805467, -1.709774, 2.666212, 1, 1, 1, 1, 1,
0.8814661, -1.125088, 3.486364, 1, 1, 1, 1, 1,
0.899393, 1.290225, -0.7633814, 0, 0, 1, 1, 1,
0.9069096, -0.0345739, 2.149739, 1, 0, 0, 1, 1,
0.90996, 3.081621, 0.07096855, 1, 0, 0, 1, 1,
0.9125925, 1.195938, 0.571634, 1, 0, 0, 1, 1,
0.9161259, 1.243776, 2.615682, 1, 0, 0, 1, 1,
0.9177805, -0.02133579, 1.66408, 1, 0, 0, 1, 1,
0.9311774, 0.2208193, 2.148183, 0, 0, 0, 1, 1,
0.9373113, 0.817179, 1.22698, 0, 0, 0, 1, 1,
0.9378715, -0.3974093, 2.993016, 0, 0, 0, 1, 1,
0.9497612, -0.509567, 1.923365, 0, 0, 0, 1, 1,
0.9498507, 0.5049211, 1.989565, 0, 0, 0, 1, 1,
0.9503514, 0.5193409, -0.6465766, 0, 0, 0, 1, 1,
0.9552889, -1.207235, 2.493668, 0, 0, 0, 1, 1,
0.9562845, 0.5859975, 1.81173, 1, 1, 1, 1, 1,
0.9586891, -0.07721481, 2.473674, 1, 1, 1, 1, 1,
0.960273, 0.1344893, 1.140922, 1, 1, 1, 1, 1,
0.9624157, -1.357016, 2.270474, 1, 1, 1, 1, 1,
0.9637807, -1.125275, 1.314283, 1, 1, 1, 1, 1,
0.9664109, 0.6446755, 2.377383, 1, 1, 1, 1, 1,
0.9673163, 0.8539732, -0.293464, 1, 1, 1, 1, 1,
0.9735901, 0.02420154, 3.36911, 1, 1, 1, 1, 1,
0.9755197, -0.6446604, 1.8316, 1, 1, 1, 1, 1,
0.9756843, 1.448403, 0.2590687, 1, 1, 1, 1, 1,
0.9773385, 1.177987, 0.7771721, 1, 1, 1, 1, 1,
0.9781387, -0.358432, 1.192151, 1, 1, 1, 1, 1,
0.9788327, -0.32004, 1.982002, 1, 1, 1, 1, 1,
0.9853925, -0.4826693, -0.4893427, 1, 1, 1, 1, 1,
0.9991607, 0.1552604, 3.808881, 1, 1, 1, 1, 1,
1.001338, 0.1515399, 0.4900742, 0, 0, 1, 1, 1,
1.003619, -0.4776706, 1.691643, 1, 0, 0, 1, 1,
1.01141, 0.4167621, 1.638653, 1, 0, 0, 1, 1,
1.012627, -0.34773, 4.199378, 1, 0, 0, 1, 1,
1.01497, 0.8281816, 1.863279, 1, 0, 0, 1, 1,
1.015851, -0.01060175, 1.830576, 1, 0, 0, 1, 1,
1.027307, -0.9831024, 1.979145, 0, 0, 0, 1, 1,
1.029111, -0.8233486, 5.208729, 0, 0, 0, 1, 1,
1.030566, -0.609173, 3.774245, 0, 0, 0, 1, 1,
1.033733, -0.6346568, 3.759343, 0, 0, 0, 1, 1,
1.037785, 0.3849889, 0.5069383, 0, 0, 0, 1, 1,
1.038233, 0.4099451, -1.349428, 0, 0, 0, 1, 1,
1.046589, -1.807206, 1.658122, 0, 0, 0, 1, 1,
1.048304, 0.3095475, 1.769659, 1, 1, 1, 1, 1,
1.051944, 0.6102778, 0.07677884, 1, 1, 1, 1, 1,
1.052649, -0.440949, 1.509657, 1, 1, 1, 1, 1,
1.053092, 0.294583, 2.639848, 1, 1, 1, 1, 1,
1.053783, 0.1638319, 0.7649509, 1, 1, 1, 1, 1,
1.054615, -0.7881189, 1.836767, 1, 1, 1, 1, 1,
1.056663, 0.02568077, 1.159949, 1, 1, 1, 1, 1,
1.057946, -2.479809, 4.204435, 1, 1, 1, 1, 1,
1.063727, 1.248722, 0.441119, 1, 1, 1, 1, 1,
1.064713, -0.5398557, 2.398345, 1, 1, 1, 1, 1,
1.067617, 0.7134559, 1.442724, 1, 1, 1, 1, 1,
1.070035, 1.059057, 1.283781, 1, 1, 1, 1, 1,
1.074538, -0.8995341, 4.197857, 1, 1, 1, 1, 1,
1.075376, 0.673322, 0.6619303, 1, 1, 1, 1, 1,
1.079497, -0.02786981, 2.545178, 1, 1, 1, 1, 1,
1.080799, -0.8117323, 1.815442, 0, 0, 1, 1, 1,
1.101701, 1.303409, -0.254454, 1, 0, 0, 1, 1,
1.102173, -0.5716638, 1.834543, 1, 0, 0, 1, 1,
1.103091, 1.420324, -1.249067, 1, 0, 0, 1, 1,
1.111136, 0.9048381, 1.299457, 1, 0, 0, 1, 1,
1.114221, -2.533775, 3.883756, 1, 0, 0, 1, 1,
1.123428, -0.1423905, 1.636432, 0, 0, 0, 1, 1,
1.124297, -1.673611, 4.536155, 0, 0, 0, 1, 1,
1.124688, 0.4185532, 2.244918, 0, 0, 0, 1, 1,
1.128796, -1.04807, 2.48089, 0, 0, 0, 1, 1,
1.139504, 0.3660828, 2.576308, 0, 0, 0, 1, 1,
1.139863, 0.5599962, 2.697121, 0, 0, 0, 1, 1,
1.147066, -0.2834595, -0.726162, 0, 0, 0, 1, 1,
1.149535, 0.0479557, 0.9269626, 1, 1, 1, 1, 1,
1.149908, -0.04392892, 3.308057, 1, 1, 1, 1, 1,
1.159559, 2.44073, 0.05583995, 1, 1, 1, 1, 1,
1.169768, 0.1397927, 1.227768, 1, 1, 1, 1, 1,
1.170182, -0.4539834, 0.763265, 1, 1, 1, 1, 1,
1.173478, -0.4087618, 2.665338, 1, 1, 1, 1, 1,
1.180647, 0.5584542, 0.9203952, 1, 1, 1, 1, 1,
1.191677, -0.4503646, 2.342175, 1, 1, 1, 1, 1,
1.195403, -1.46606, 1.534752, 1, 1, 1, 1, 1,
1.19909, 0.3973384, 1.479635, 1, 1, 1, 1, 1,
1.205185, 0.3456147, 0.9392517, 1, 1, 1, 1, 1,
1.207125, 0.4266489, 1.809687, 1, 1, 1, 1, 1,
1.210095, -2.168283, 4.808486, 1, 1, 1, 1, 1,
1.21124, 0.7214565, 1.415274, 1, 1, 1, 1, 1,
1.225182, -1.4019, 1.976984, 1, 1, 1, 1, 1,
1.234622, -3.378266, 2.24931, 0, 0, 1, 1, 1,
1.237709, 0.07000421, 1.878585, 1, 0, 0, 1, 1,
1.240014, 2.52956, 0.05115486, 1, 0, 0, 1, 1,
1.24092, 0.4805961, 0.1974499, 1, 0, 0, 1, 1,
1.243073, -1.754971, 3.602656, 1, 0, 0, 1, 1,
1.248936, 1.427367, 0.3485433, 1, 0, 0, 1, 1,
1.256237, -1.763915, 1.983021, 0, 0, 0, 1, 1,
1.263107, -1.035551, 2.563864, 0, 0, 0, 1, 1,
1.270434, -0.7572501, 2.965067, 0, 0, 0, 1, 1,
1.274416, 0.2446507, 0.5777519, 0, 0, 0, 1, 1,
1.277601, -2.466622, 3.087907, 0, 0, 0, 1, 1,
1.278317, 0.1153781, 2.779935, 0, 0, 0, 1, 1,
1.302442, 0.5079308, -0.4767256, 0, 0, 0, 1, 1,
1.311173, -0.1728709, 3.623168, 1, 1, 1, 1, 1,
1.322514, -2.151716, 3.751822, 1, 1, 1, 1, 1,
1.346256, -0.5288955, 1.843714, 1, 1, 1, 1, 1,
1.359694, 0.2221828, 0.1956766, 1, 1, 1, 1, 1,
1.368954, 0.7243444, 0.3232781, 1, 1, 1, 1, 1,
1.371159, 1.654955, 0.7617559, 1, 1, 1, 1, 1,
1.371679, -0.7480596, 1.622867, 1, 1, 1, 1, 1,
1.386206, 0.662976, 2.302735, 1, 1, 1, 1, 1,
1.387218, 0.1613964, 2.048173, 1, 1, 1, 1, 1,
1.409707, -0.4633025, 1.626933, 1, 1, 1, 1, 1,
1.413468, -1.591922, 2.803441, 1, 1, 1, 1, 1,
1.437762, -1.031075, 3.553975, 1, 1, 1, 1, 1,
1.437938, 0.8452652, 1.197458, 1, 1, 1, 1, 1,
1.438984, -1.097275, 2.173644, 1, 1, 1, 1, 1,
1.445057, 0.01692641, 1.914505, 1, 1, 1, 1, 1,
1.454915, 1.076128, 0.3966464, 0, 0, 1, 1, 1,
1.456932, -0.1809482, 0.01430881, 1, 0, 0, 1, 1,
1.460049, 1.597288, -1.948956, 1, 0, 0, 1, 1,
1.47549, 0.408075, 1.881809, 1, 0, 0, 1, 1,
1.481911, -0.7666937, 2.585921, 1, 0, 0, 1, 1,
1.485249, 0.3078429, 0.8576234, 1, 0, 0, 1, 1,
1.487644, 1.08703, 1.672008, 0, 0, 0, 1, 1,
1.499207, -0.07867777, 1.836615, 0, 0, 0, 1, 1,
1.522315, -0.8352983, 1.825746, 0, 0, 0, 1, 1,
1.532042, 0.8236463, 1.474071, 0, 0, 0, 1, 1,
1.547283, -0.5306365, 2.328899, 0, 0, 0, 1, 1,
1.565639, 0.3955887, 1.01944, 0, 0, 0, 1, 1,
1.567983, -0.4542379, 0.3228356, 0, 0, 0, 1, 1,
1.590291, 0.1385617, 1.088588, 1, 1, 1, 1, 1,
1.609282, -0.02143458, 3.857863, 1, 1, 1, 1, 1,
1.612402, -3.065205, 3.569057, 1, 1, 1, 1, 1,
1.619212, -1.005273, 0.07196415, 1, 1, 1, 1, 1,
1.63515, -0.6560713, 0.798292, 1, 1, 1, 1, 1,
1.659064, 0.4457718, 0.1442788, 1, 1, 1, 1, 1,
1.660861, 1.458377, 1.683506, 1, 1, 1, 1, 1,
1.684643, 0.2111533, 2.755694, 1, 1, 1, 1, 1,
1.690706, -0.004942805, -1.086111, 1, 1, 1, 1, 1,
1.691644, 0.5714307, 1.257837, 1, 1, 1, 1, 1,
1.696992, 1.620949, 0.4725961, 1, 1, 1, 1, 1,
1.697618, -1.077537, 1.366879, 1, 1, 1, 1, 1,
1.703265, 2.301416, 1.301133, 1, 1, 1, 1, 1,
1.735181, 0.5742033, 1.152212, 1, 1, 1, 1, 1,
1.740531, 0.4266592, 0.4974987, 1, 1, 1, 1, 1,
1.758147, -0.1966725, 2.067269, 0, 0, 1, 1, 1,
1.761692, -1.268933, 3.167821, 1, 0, 0, 1, 1,
1.761772, 0.4221588, 1.460144, 1, 0, 0, 1, 1,
1.778119, 0.5900395, 0.4636787, 1, 0, 0, 1, 1,
1.782997, -0.8404021, 1.2309, 1, 0, 0, 1, 1,
1.803699, -0.08473308, 1.039232, 1, 0, 0, 1, 1,
1.837276, -0.3887625, 2.270437, 0, 0, 0, 1, 1,
1.84653, 2.186583, 0.4345517, 0, 0, 0, 1, 1,
1.854661, 0.7394233, 2.348647, 0, 0, 0, 1, 1,
1.859678, -0.8114349, 1.740338, 0, 0, 0, 1, 1,
1.860091, 0.4984219, -0.8196365, 0, 0, 0, 1, 1,
1.860138, 2.06027, -0.3520003, 0, 0, 0, 1, 1,
1.862219, -0.02458675, 0.8737294, 0, 0, 0, 1, 1,
1.878593, 0.8388574, 1.717287, 1, 1, 1, 1, 1,
1.892001, 0.3869401, 2.831044, 1, 1, 1, 1, 1,
1.89788, 0.77682, 1.34143, 1, 1, 1, 1, 1,
1.906906, -0.3981352, 1.395113, 1, 1, 1, 1, 1,
1.908602, -0.03208872, 1.952124, 1, 1, 1, 1, 1,
1.939236, 1.072888, -0.08798184, 1, 1, 1, 1, 1,
1.941086, 1.764517, 1.802434, 1, 1, 1, 1, 1,
1.986761, -1.724842, 1.430809, 1, 1, 1, 1, 1,
2.00162, -2.158681, 1.755649, 1, 1, 1, 1, 1,
2.024611, -2.597765, 1.267793, 1, 1, 1, 1, 1,
2.038991, -2.73647, 3.584601, 1, 1, 1, 1, 1,
2.047304, 0.325324, 1.760077, 1, 1, 1, 1, 1,
2.059156, -0.3390044, 1.555405, 1, 1, 1, 1, 1,
2.061635, -2.221703, 4.811343, 1, 1, 1, 1, 1,
2.074813, 0.4856428, 0.9376372, 1, 1, 1, 1, 1,
2.079783, -0.6357445, 2.964077, 0, 0, 1, 1, 1,
2.081725, -1.01731, 2.698461, 1, 0, 0, 1, 1,
2.149767, 0.537714, 0.6152895, 1, 0, 0, 1, 1,
2.160111, 0.4622564, 0.5752858, 1, 0, 0, 1, 1,
2.162534, 0.4653764, 2.102601, 1, 0, 0, 1, 1,
2.237234, 0.2894382, 1.458888, 1, 0, 0, 1, 1,
2.241136, -2.137506, 4.292998, 0, 0, 0, 1, 1,
2.254745, -1.346834, 1.148454, 0, 0, 0, 1, 1,
2.277995, 0.1039316, 0.4725534, 0, 0, 0, 1, 1,
2.341413, -1.525502, 3.298636, 0, 0, 0, 1, 1,
2.348772, -0.1969579, 1.794576, 0, 0, 0, 1, 1,
2.353463, -1.736373, 3.042843, 0, 0, 0, 1, 1,
2.401881, 0.9515454, 1.036384, 0, 0, 0, 1, 1,
2.439954, -0.5536526, 0.277155, 1, 1, 1, 1, 1,
2.703922, -1.044742, 1.915463, 1, 1, 1, 1, 1,
2.703983, 1.42976, 0.3649411, 1, 1, 1, 1, 1,
2.771776, -1.382159, 2.71372, 1, 1, 1, 1, 1,
2.777822, 0.7604601, 1.901086, 1, 1, 1, 1, 1,
2.861828, -0.8927067, 0.3239894, 1, 1, 1, 1, 1,
2.991726, 0.2390974, 0.5994541, 1, 1, 1, 1, 1
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
var radius = 10.42481;
var distance = 36.61671;
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
mvMatrix.translate( 0.2621622, -0.06338882, 0.04165602 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.61671);
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
