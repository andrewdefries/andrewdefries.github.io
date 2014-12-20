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
-3.502392, 0.8383421, -1.981551, 1, 0, 0, 1,
-2.987611, 0.583387, -3.323129, 1, 0.007843138, 0, 1,
-2.825482, -0.07635763, -1.839928, 1, 0.01176471, 0, 1,
-2.451198, -0.1281708, 0.6600314, 1, 0.01960784, 0, 1,
-2.44844, 1.090907, -0.2157078, 1, 0.02352941, 0, 1,
-2.435653, -0.3234379, -1.326191, 1, 0.03137255, 0, 1,
-2.307151, 1.03653, -0.1334744, 1, 0.03529412, 0, 1,
-2.257886, -2.030323, -1.758587, 1, 0.04313726, 0, 1,
-2.152809, -0.7086027, -0.214775, 1, 0.04705882, 0, 1,
-2.122006, 1.090423, -1.317964, 1, 0.05490196, 0, 1,
-2.104403, 0.6239807, -0.5713045, 1, 0.05882353, 0, 1,
-2.098067, 0.2428411, -0.5835737, 1, 0.06666667, 0, 1,
-2.015941, -1.008384, -1.768468, 1, 0.07058824, 0, 1,
-1.996028, 1.154735, -1.099843, 1, 0.07843138, 0, 1,
-1.985058, -0.9638754, -1.019457, 1, 0.08235294, 0, 1,
-1.952552, 0.8938512, -2.186637, 1, 0.09019608, 0, 1,
-1.951606, 0.5584339, -3.401346, 1, 0.09411765, 0, 1,
-1.940392, -0.04029785, -0.8207911, 1, 0.1019608, 0, 1,
-1.93385, 0.01990708, 0.1762889, 1, 0.1098039, 0, 1,
-1.92537, -0.6920464, -1.978985, 1, 0.1137255, 0, 1,
-1.924094, 0.06768585, -2.118109, 1, 0.1215686, 0, 1,
-1.923561, -1.053629, -3.028624, 1, 0.1254902, 0, 1,
-1.920644, -0.5941852, -2.269111, 1, 0.1333333, 0, 1,
-1.898405, 0.2989, -2.633427, 1, 0.1372549, 0, 1,
-1.885766, -0.3878136, -1.600381, 1, 0.145098, 0, 1,
-1.88231, 1.014979, -0.1286531, 1, 0.1490196, 0, 1,
-1.879615, -0.4243495, -1.81191, 1, 0.1568628, 0, 1,
-1.857115, -1.870571, -2.573893, 1, 0.1607843, 0, 1,
-1.828793, -1.744961, -2.635851, 1, 0.1686275, 0, 1,
-1.824454, -0.4983365, -1.618024, 1, 0.172549, 0, 1,
-1.808636, 1.999853, -0.9768005, 1, 0.1803922, 0, 1,
-1.808203, -0.6190704, -3.573342, 1, 0.1843137, 0, 1,
-1.792591, -0.4520423, -1.509696, 1, 0.1921569, 0, 1,
-1.78309, 0.01633583, -1.818576, 1, 0.1960784, 0, 1,
-1.773275, 0.4203354, -1.597131, 1, 0.2039216, 0, 1,
-1.757598, 0.7618675, -3.47439, 1, 0.2117647, 0, 1,
-1.75617, -1.861547, -1.860648, 1, 0.2156863, 0, 1,
-1.750178, -0.2809505, -2.756512, 1, 0.2235294, 0, 1,
-1.740408, -1.035717, -1.637865, 1, 0.227451, 0, 1,
-1.736924, -0.6263412, 0.2531449, 1, 0.2352941, 0, 1,
-1.734287, 0.6767752, -0.1594432, 1, 0.2392157, 0, 1,
-1.703861, -0.06657416, -1.655098, 1, 0.2470588, 0, 1,
-1.669024, 0.3893511, -2.670478, 1, 0.2509804, 0, 1,
-1.666872, -1.75637, -2.271949, 1, 0.2588235, 0, 1,
-1.661267, 0.2762421, -1.709834, 1, 0.2627451, 0, 1,
-1.65563, 0.7454089, -2.513561, 1, 0.2705882, 0, 1,
-1.650786, -0.9047646, -1.554864, 1, 0.2745098, 0, 1,
-1.649003, -0.94025, -2.500486, 1, 0.282353, 0, 1,
-1.6368, -0.8435605, -1.553919, 1, 0.2862745, 0, 1,
-1.62176, -0.0938513, -2.155914, 1, 0.2941177, 0, 1,
-1.617921, -0.2559669, -1.206175, 1, 0.3019608, 0, 1,
-1.615707, -1.836571, -2.354626, 1, 0.3058824, 0, 1,
-1.602521, 0.584226, -2.261911, 1, 0.3137255, 0, 1,
-1.595964, -0.638982, -2.523177, 1, 0.3176471, 0, 1,
-1.58833, -1.136783, -3.494911, 1, 0.3254902, 0, 1,
-1.584402, 0.01849111, -1.602573, 1, 0.3294118, 0, 1,
-1.576341, 1.725445, -2.445923, 1, 0.3372549, 0, 1,
-1.575956, -1.289018, -1.689076, 1, 0.3411765, 0, 1,
-1.57516, 0.1474173, -1.791957, 1, 0.3490196, 0, 1,
-1.560036, 0.8804334, -0.8083311, 1, 0.3529412, 0, 1,
-1.547427, -0.4085515, -2.320377, 1, 0.3607843, 0, 1,
-1.537778, 0.5188448, 0.9225709, 1, 0.3647059, 0, 1,
-1.529797, 1.329814, -1.618177, 1, 0.372549, 0, 1,
-1.525221, -0.6295586, -1.741489, 1, 0.3764706, 0, 1,
-1.521314, -0.06703211, -3.410278, 1, 0.3843137, 0, 1,
-1.511491, -0.2196684, -1.88895, 1, 0.3882353, 0, 1,
-1.469395, -1.166872, -2.026063, 1, 0.3960784, 0, 1,
-1.46702, -0.4305375, -3.123939, 1, 0.4039216, 0, 1,
-1.465693, -0.8222823, -2.101582, 1, 0.4078431, 0, 1,
-1.460208, 1.211126, 0.3185346, 1, 0.4156863, 0, 1,
-1.456397, -0.1662302, -2.326118, 1, 0.4196078, 0, 1,
-1.449563, -1.531947, -2.904376, 1, 0.427451, 0, 1,
-1.446523, 0.4519292, -0.8766198, 1, 0.4313726, 0, 1,
-1.445517, 0.9940838, -0.8832068, 1, 0.4392157, 0, 1,
-1.442446, 0.2338226, -1.276004, 1, 0.4431373, 0, 1,
-1.441684, 1.099483, -1.436973, 1, 0.4509804, 0, 1,
-1.438756, 0.6151195, -0.2225638, 1, 0.454902, 0, 1,
-1.428833, -0.1732668, -2.265404, 1, 0.4627451, 0, 1,
-1.427228, 0.7883486, -0.565008, 1, 0.4666667, 0, 1,
-1.422309, 1.71159, -1.892207, 1, 0.4745098, 0, 1,
-1.421754, -0.489579, -1.836273, 1, 0.4784314, 0, 1,
-1.415434, -0.368439, -2.243496, 1, 0.4862745, 0, 1,
-1.414361, -0.1161986, -3.618294, 1, 0.4901961, 0, 1,
-1.401134, -0.2020924, -3.152028, 1, 0.4980392, 0, 1,
-1.394278, 0.2586032, -1.83537, 1, 0.5058824, 0, 1,
-1.384867, -0.0587569, -1.217448, 1, 0.509804, 0, 1,
-1.384081, -0.2085326, -1.691375, 1, 0.5176471, 0, 1,
-1.379691, -0.5097389, -4.491209, 1, 0.5215687, 0, 1,
-1.378166, 0.04894145, -1.014794, 1, 0.5294118, 0, 1,
-1.373084, 0.1552248, -2.179724, 1, 0.5333334, 0, 1,
-1.361112, 0.1249503, -2.247949, 1, 0.5411765, 0, 1,
-1.335661, 0.1617871, -0.7074059, 1, 0.5450981, 0, 1,
-1.325945, 0.4451169, -1.487389, 1, 0.5529412, 0, 1,
-1.324927, 0.2905438, -1.581066, 1, 0.5568628, 0, 1,
-1.322346, 0.3313428, -1.622961, 1, 0.5647059, 0, 1,
-1.319766, -0.1628165, -2.348681, 1, 0.5686275, 0, 1,
-1.316416, 1.201805, -0.4111259, 1, 0.5764706, 0, 1,
-1.311813, -1.643918, -3.72706, 1, 0.5803922, 0, 1,
-1.306403, -0.09825779, -1.793983, 1, 0.5882353, 0, 1,
-1.30253, 0.1632223, -0.5112861, 1, 0.5921569, 0, 1,
-1.300769, 3.13576, -1.410959, 1, 0.6, 0, 1,
-1.299644, 0.8618973, -2.1415, 1, 0.6078432, 0, 1,
-1.285287, 0.6528349, -0.9196758, 1, 0.6117647, 0, 1,
-1.282637, -1.082025, -1.665126, 1, 0.6196079, 0, 1,
-1.27012, 0.9541866, -2.146005, 1, 0.6235294, 0, 1,
-1.26932, 0.9112269, 0.09095681, 1, 0.6313726, 0, 1,
-1.266223, -0.4142164, -1.775404, 1, 0.6352941, 0, 1,
-1.263251, 1.062865, -1.001998, 1, 0.6431373, 0, 1,
-1.261406, -0.2280046, -3.022308, 1, 0.6470588, 0, 1,
-1.260194, -0.2638309, -1.554311, 1, 0.654902, 0, 1,
-1.256717, -0.15067, -0.5401806, 1, 0.6588235, 0, 1,
-1.254269, -0.8943527, -3.834929, 1, 0.6666667, 0, 1,
-1.253717, -1.093262, -1.176422, 1, 0.6705883, 0, 1,
-1.249628, 0.5454251, -3.293789, 1, 0.6784314, 0, 1,
-1.2422, 0.571375, -1.468568, 1, 0.682353, 0, 1,
-1.241779, 1.581928, 0.01838374, 1, 0.6901961, 0, 1,
-1.235192, -1.201914, -3.108834, 1, 0.6941177, 0, 1,
-1.232191, 0.4129511, -1.32815, 1, 0.7019608, 0, 1,
-1.220363, 1.559369, 0.3821171, 1, 0.7098039, 0, 1,
-1.217893, 0.4477012, -2.25308, 1, 0.7137255, 0, 1,
-1.214208, 1.684043, -1.757568, 1, 0.7215686, 0, 1,
-1.212971, 0.6273375, 0.8506594, 1, 0.7254902, 0, 1,
-1.212247, -0.8460731, -2.454204, 1, 0.7333333, 0, 1,
-1.21074, 0.8270167, 1.358046, 1, 0.7372549, 0, 1,
-1.208505, 0.7084467, -0.9573889, 1, 0.7450981, 0, 1,
-1.202678, -0.2738105, -1.830223, 1, 0.7490196, 0, 1,
-1.201313, 1.05488, -1.128495, 1, 0.7568628, 0, 1,
-1.191882, 0.6454403, -1.272419, 1, 0.7607843, 0, 1,
-1.167302, -1.522452, -1.089949, 1, 0.7686275, 0, 1,
-1.150301, -0.2797594, -0.024383, 1, 0.772549, 0, 1,
-1.150175, 1.382428, -0.2513683, 1, 0.7803922, 0, 1,
-1.148203, 0.09576102, -2.049417, 1, 0.7843137, 0, 1,
-1.141266, -0.09152009, 0.5363422, 1, 0.7921569, 0, 1,
-1.126821, -0.6220356, -1.6035, 1, 0.7960784, 0, 1,
-1.126663, -2.19477, -1.169573, 1, 0.8039216, 0, 1,
-1.126376, 0.3247283, -2.709329, 1, 0.8117647, 0, 1,
-1.123413, 1.245926, 2.002059, 1, 0.8156863, 0, 1,
-1.116045, -1.64701, -4.782175, 1, 0.8235294, 0, 1,
-1.114779, 0.7406168, -2.5716, 1, 0.827451, 0, 1,
-1.098334, -0.06552236, -0.7647317, 1, 0.8352941, 0, 1,
-1.096101, -1.801508, -4.349173, 1, 0.8392157, 0, 1,
-1.088022, 0.4104405, -1.112826, 1, 0.8470588, 0, 1,
-1.083813, -0.1120028, -2.972009, 1, 0.8509804, 0, 1,
-1.080562, 0.6528968, 0.1332495, 1, 0.8588235, 0, 1,
-1.077038, -0.4557866, -1.084765, 1, 0.8627451, 0, 1,
-1.074937, 1.178278, -1.298456, 1, 0.8705882, 0, 1,
-1.071477, 1.363365, 0.57544, 1, 0.8745098, 0, 1,
-1.069753, 0.3641581, -1.667077, 1, 0.8823529, 0, 1,
-1.067307, 1.729561, -0.8245754, 1, 0.8862745, 0, 1,
-1.063983, -1.219168, -0.3304663, 1, 0.8941177, 0, 1,
-1.063026, 0.8058263, -1.456491, 1, 0.8980392, 0, 1,
-1.056715, 0.6321085, -0.7460443, 1, 0.9058824, 0, 1,
-1.053867, 1.588187, -0.8144071, 1, 0.9137255, 0, 1,
-1.049205, -1.32021, -2.185724, 1, 0.9176471, 0, 1,
-1.047325, 0.7405484, 0.2551851, 1, 0.9254902, 0, 1,
-1.036566, 0.07289682, -0.5057569, 1, 0.9294118, 0, 1,
-1.027725, 1.02332, -0.6717494, 1, 0.9372549, 0, 1,
-1.027639, 1.220304, -1.118901, 1, 0.9411765, 0, 1,
-1.015859, 0.232959, -3.144088, 1, 0.9490196, 0, 1,
-1.014836, 0.5266522, -1.893159, 1, 0.9529412, 0, 1,
-1.011487, -1.097628, -1.358086, 1, 0.9607843, 0, 1,
-1.011345, -1.204117, -2.819965, 1, 0.9647059, 0, 1,
-1.009775, -0.9747961, -3.612436, 1, 0.972549, 0, 1,
-1.008641, 1.437282, -0.2652123, 1, 0.9764706, 0, 1,
-1.006675, 1.49422, -1.322278, 1, 0.9843137, 0, 1,
-0.9970913, -0.05913561, -1.267137, 1, 0.9882353, 0, 1,
-0.9957176, -0.7163419, -0.6414257, 1, 0.9960784, 0, 1,
-0.9930158, -0.4713808, -2.57985, 0.9960784, 1, 0, 1,
-0.9896978, 0.2498361, -0.08942097, 0.9921569, 1, 0, 1,
-0.9779669, -0.4182509, -2.744623, 0.9843137, 1, 0, 1,
-0.9733255, -0.5516254, -1.253014, 0.9803922, 1, 0, 1,
-0.9649191, -1.150594, -2.519192, 0.972549, 1, 0, 1,
-0.9640486, -0.3384361, 0.02875522, 0.9686275, 1, 0, 1,
-0.9462258, -0.04359241, -0.2954844, 0.9607843, 1, 0, 1,
-0.9459785, 2.318176, -2.535486, 0.9568627, 1, 0, 1,
-0.9450159, 1.576111, -3.524171, 0.9490196, 1, 0, 1,
-0.9420874, 1.479626, -0.5671806, 0.945098, 1, 0, 1,
-0.9406879, 0.6114454, -1.654127, 0.9372549, 1, 0, 1,
-0.9348553, 0.9422393, -0.853626, 0.9333333, 1, 0, 1,
-0.9333201, -2.262099, -3.109299, 0.9254902, 1, 0, 1,
-0.9328648, -0.007386515, -0.5333052, 0.9215686, 1, 0, 1,
-0.9279539, 0.9983157, -1.070798, 0.9137255, 1, 0, 1,
-0.9275985, -0.6415717, -2.589703, 0.9098039, 1, 0, 1,
-0.9247661, 0.7339026, -0.008262467, 0.9019608, 1, 0, 1,
-0.9240631, -0.3551112, -3.036933, 0.8941177, 1, 0, 1,
-0.9222257, 0.3599468, -1.022204, 0.8901961, 1, 0, 1,
-0.9218754, -0.6740012, -1.819648, 0.8823529, 1, 0, 1,
-0.9147464, -1.973151, -3.017738, 0.8784314, 1, 0, 1,
-0.9127402, -1.342296, -3.48169, 0.8705882, 1, 0, 1,
-0.911875, 0.571359, 0.2183001, 0.8666667, 1, 0, 1,
-0.9114639, 0.2094665, -0.9923009, 0.8588235, 1, 0, 1,
-0.903497, 1.317636, 0.8008745, 0.854902, 1, 0, 1,
-0.8997351, -1.303465, -1.926475, 0.8470588, 1, 0, 1,
-0.8996661, -0.06924456, -1.993016, 0.8431373, 1, 0, 1,
-0.8983246, 1.034214, -1.204372, 0.8352941, 1, 0, 1,
-0.8963988, 1.284811, -0.5264238, 0.8313726, 1, 0, 1,
-0.8959021, -1.70631, -3.431767, 0.8235294, 1, 0, 1,
-0.8942417, -0.5196232, -2.346384, 0.8196079, 1, 0, 1,
-0.8846171, 1.859885, -0.6354941, 0.8117647, 1, 0, 1,
-0.8802925, -0.2475188, -2.845351, 0.8078431, 1, 0, 1,
-0.8793383, -0.8931691, -1.630521, 0.8, 1, 0, 1,
-0.8792044, 0.2840114, -3.276289, 0.7921569, 1, 0, 1,
-0.8736444, 0.8541837, -1.825386, 0.7882353, 1, 0, 1,
-0.8675991, -1.214076, -1.785334, 0.7803922, 1, 0, 1,
-0.8558796, 1.860275, -0.05079585, 0.7764706, 1, 0, 1,
-0.8523858, -0.6460587, -1.087771, 0.7686275, 1, 0, 1,
-0.8492159, -1.17371, -2.501162, 0.7647059, 1, 0, 1,
-0.8426236, 1.042943, -1.818936, 0.7568628, 1, 0, 1,
-0.8419573, 1.013503, -0.6358743, 0.7529412, 1, 0, 1,
-0.8352886, -0.4783449, -1.347523, 0.7450981, 1, 0, 1,
-0.8338734, 2.017885, 0.5590209, 0.7411765, 1, 0, 1,
-0.8299385, 3.350856e-05, -1.538975, 0.7333333, 1, 0, 1,
-0.8268251, -0.02818508, -1.057935, 0.7294118, 1, 0, 1,
-0.8241341, 0.789619, -1.023903, 0.7215686, 1, 0, 1,
-0.8192945, -0.1040083, -1.303604, 0.7176471, 1, 0, 1,
-0.8156948, -0.3654273, -1.771319, 0.7098039, 1, 0, 1,
-0.8140632, -1.204815, -1.771866, 0.7058824, 1, 0, 1,
-0.8102726, 0.4644729, -1.522076, 0.6980392, 1, 0, 1,
-0.8062975, -1.79938, -3.610792, 0.6901961, 1, 0, 1,
-0.7952669, 0.3400088, -2.033499, 0.6862745, 1, 0, 1,
-0.7945675, 0.6681393, -1.078349, 0.6784314, 1, 0, 1,
-0.7913805, 0.1098973, -3.147907, 0.6745098, 1, 0, 1,
-0.7831372, -0.2852159, 0.4773601, 0.6666667, 1, 0, 1,
-0.773242, 1.162167, -0.1555256, 0.6627451, 1, 0, 1,
-0.7631925, -1.555013, -1.744708, 0.654902, 1, 0, 1,
-0.7629789, -0.00349046, -1.477146, 0.6509804, 1, 0, 1,
-0.7599033, -0.5238366, -1.453072, 0.6431373, 1, 0, 1,
-0.7519162, -1.266751, -2.208512, 0.6392157, 1, 0, 1,
-0.7394508, -1.626112, -3.63021, 0.6313726, 1, 0, 1,
-0.7346935, -0.6185814, -0.3526953, 0.627451, 1, 0, 1,
-0.7339387, 0.6231395, -0.1300672, 0.6196079, 1, 0, 1,
-0.7320514, 1.20066, 0.0295271, 0.6156863, 1, 0, 1,
-0.7312579, -0.6455154, -3.076241, 0.6078432, 1, 0, 1,
-0.730512, -0.4400831, 0.09230801, 0.6039216, 1, 0, 1,
-0.7273312, -1.295088, -3.916414, 0.5960785, 1, 0, 1,
-0.7264671, 1.754489, -0.2504568, 0.5882353, 1, 0, 1,
-0.7194076, -1.276956, -3.439266, 0.5843138, 1, 0, 1,
-0.7173595, 1.741671, 0.2697765, 0.5764706, 1, 0, 1,
-0.7149807, -0.9040322, -4.129799, 0.572549, 1, 0, 1,
-0.7108986, 0.2757115, -2.367143, 0.5647059, 1, 0, 1,
-0.7101657, -0.4200945, -3.387501, 0.5607843, 1, 0, 1,
-0.708597, -0.1295351, -1.512665, 0.5529412, 1, 0, 1,
-0.6964104, -1.087648, -2.048175, 0.5490196, 1, 0, 1,
-0.69091, 1.588176, 0.7326705, 0.5411765, 1, 0, 1,
-0.6804259, 1.6699, -0.2666339, 0.5372549, 1, 0, 1,
-0.6773292, 0.3150311, -0.6253769, 0.5294118, 1, 0, 1,
-0.6765386, -1.074778, -2.608991, 0.5254902, 1, 0, 1,
-0.6678702, -0.4187946, -3.641555, 0.5176471, 1, 0, 1,
-0.6662009, -0.3196065, -1.636634, 0.5137255, 1, 0, 1,
-0.6537539, -1.13693, -3.467223, 0.5058824, 1, 0, 1,
-0.6514346, 0.3066946, -2.182961, 0.5019608, 1, 0, 1,
-0.6506081, -0.8145832, -1.053436, 0.4941176, 1, 0, 1,
-0.6464997, -0.4240538, -3.613072, 0.4862745, 1, 0, 1,
-0.640803, 0.07075728, 0.9326122, 0.4823529, 1, 0, 1,
-0.6378425, -2.2655, -4.849134, 0.4745098, 1, 0, 1,
-0.6340971, -1.095188, -3.36036, 0.4705882, 1, 0, 1,
-0.6337927, -0.9996294, -4.222086, 0.4627451, 1, 0, 1,
-0.6300578, -0.02230292, -2.974119, 0.4588235, 1, 0, 1,
-0.6236916, -1.221084, -2.957677, 0.4509804, 1, 0, 1,
-0.6213662, -3.281616, -4.852361, 0.4470588, 1, 0, 1,
-0.6178523, -2.649255, -3.169675, 0.4392157, 1, 0, 1,
-0.6163811, -1.386917, -3.357894, 0.4352941, 1, 0, 1,
-0.6149591, 0.8547311, -0.4968655, 0.427451, 1, 0, 1,
-0.6098434, 0.02180219, -2.476585, 0.4235294, 1, 0, 1,
-0.6082639, 0.09933501, -0.8322798, 0.4156863, 1, 0, 1,
-0.6065311, 0.5834631, -0.8516168, 0.4117647, 1, 0, 1,
-0.603891, -0.6576077, -1.608324, 0.4039216, 1, 0, 1,
-0.6011149, 1.47585, -0.7770194, 0.3960784, 1, 0, 1,
-0.5962802, -0.1557806, -0.8112514, 0.3921569, 1, 0, 1,
-0.5962402, -0.6401353, -3.215556, 0.3843137, 1, 0, 1,
-0.5921447, -1.300139, -5.276498, 0.3803922, 1, 0, 1,
-0.590929, -1.262886, -2.119278, 0.372549, 1, 0, 1,
-0.5893275, -0.7879204, -1.004053, 0.3686275, 1, 0, 1,
-0.584842, 0.6428202, 0.2312512, 0.3607843, 1, 0, 1,
-0.5828392, -0.2422135, -2.147888, 0.3568628, 1, 0, 1,
-0.5717258, -1.972085, -3.763032, 0.3490196, 1, 0, 1,
-0.5697741, 0.08079793, -1.853853, 0.345098, 1, 0, 1,
-0.5693954, -0.5903454, -0.7542782, 0.3372549, 1, 0, 1,
-0.5619887, -1.941227, -3.403961, 0.3333333, 1, 0, 1,
-0.5607441, 0.2357545, 0.07798427, 0.3254902, 1, 0, 1,
-0.5588925, 0.7418498, -1.257632, 0.3215686, 1, 0, 1,
-0.5543944, -0.610797, -1.276898, 0.3137255, 1, 0, 1,
-0.5532485, 1.531428, 0.728802, 0.3098039, 1, 0, 1,
-0.5501114, -2.886614, -4.083824, 0.3019608, 1, 0, 1,
-0.5465332, -1.470928, -2.692136, 0.2941177, 1, 0, 1,
-0.5375314, -0.4330527, -3.855102, 0.2901961, 1, 0, 1,
-0.536068, -2.100309, -2.090407, 0.282353, 1, 0, 1,
-0.5325237, -0.7307005, -3.480865, 0.2784314, 1, 0, 1,
-0.5296453, 0.2828408, -1.423198, 0.2705882, 1, 0, 1,
-0.5219394, -0.1808122, -1.984309, 0.2666667, 1, 0, 1,
-0.5210856, 0.7316691, -0.3210132, 0.2588235, 1, 0, 1,
-0.5205091, -0.6634278, -1.614467, 0.254902, 1, 0, 1,
-0.5189425, -0.7669765, -2.185323, 0.2470588, 1, 0, 1,
-0.5171422, 1.457924, -0.0345356, 0.2431373, 1, 0, 1,
-0.5169581, -1.041706, -2.259508, 0.2352941, 1, 0, 1,
-0.5121856, 1.873692, -0.5057108, 0.2313726, 1, 0, 1,
-0.5051659, 0.1971378, -0.4744324, 0.2235294, 1, 0, 1,
-0.5031666, 1.126881, -0.3142736, 0.2196078, 1, 0, 1,
-0.5012922, -1.241958, -2.219706, 0.2117647, 1, 0, 1,
-0.4979298, -0.6227662, -1.554028, 0.2078431, 1, 0, 1,
-0.4918991, -1.397918, -3.414685, 0.2, 1, 0, 1,
-0.4913149, -0.3053751, -2.17094, 0.1921569, 1, 0, 1,
-0.4910736, 1.07327, -2.422315, 0.1882353, 1, 0, 1,
-0.4902763, -1.652511, -1.129707, 0.1803922, 1, 0, 1,
-0.4893793, -0.01554069, -1.134156, 0.1764706, 1, 0, 1,
-0.4845161, -1.363691, -3.538867, 0.1686275, 1, 0, 1,
-0.4837328, -0.6799738, -3.777883, 0.1647059, 1, 0, 1,
-0.4833456, 0.02472066, -1.173037, 0.1568628, 1, 0, 1,
-0.4781315, -0.04103347, -1.158479, 0.1529412, 1, 0, 1,
-0.4771634, -0.4455509, -1.618036, 0.145098, 1, 0, 1,
-0.4765205, -0.07117195, -2.367092, 0.1411765, 1, 0, 1,
-0.4719132, 0.3206766, -0.9578139, 0.1333333, 1, 0, 1,
-0.4663562, 0.4629078, -0.2444527, 0.1294118, 1, 0, 1,
-0.4599371, 1.807285, 0.4675699, 0.1215686, 1, 0, 1,
-0.4567764, 1.230898, 0.6186062, 0.1176471, 1, 0, 1,
-0.4559983, -0.4508752, -2.96985, 0.1098039, 1, 0, 1,
-0.4556912, -0.5210462, -2.947319, 0.1058824, 1, 0, 1,
-0.4492655, -0.5636849, -2.080228, 0.09803922, 1, 0, 1,
-0.4412955, -0.1102626, -2.8672, 0.09019608, 1, 0, 1,
-0.439839, -0.3030727, -3.277457, 0.08627451, 1, 0, 1,
-0.4347079, 1.312635, -1.523157, 0.07843138, 1, 0, 1,
-0.4323418, -0.2001546, -1.850466, 0.07450981, 1, 0, 1,
-0.4272369, -0.3565663, -2.760084, 0.06666667, 1, 0, 1,
-0.4235715, 0.5983422, -1.267511, 0.0627451, 1, 0, 1,
-0.4223846, -0.307653, -3.429432, 0.05490196, 1, 0, 1,
-0.4178239, 1.46154, -0.3810468, 0.05098039, 1, 0, 1,
-0.4176273, 0.7207778, 0.5460751, 0.04313726, 1, 0, 1,
-0.4171088, 0.08358365, -3.137381, 0.03921569, 1, 0, 1,
-0.4149185, -1.332284, -3.0155, 0.03137255, 1, 0, 1,
-0.4109713, -1.585577, -0.1895072, 0.02745098, 1, 0, 1,
-0.4082856, 0.5239831, -1.309453, 0.01960784, 1, 0, 1,
-0.4063063, -0.357223, -1.775427, 0.01568628, 1, 0, 1,
-0.3974059, -0.4028573, -2.310864, 0.007843138, 1, 0, 1,
-0.3968875, 1.119788, 0.2376716, 0.003921569, 1, 0, 1,
-0.3956148, -0.6722664, -2.678623, 0, 1, 0.003921569, 1,
-0.3934211, -1.567784, -1.107418, 0, 1, 0.01176471, 1,
-0.3904803, -0.3570867, -2.855987, 0, 1, 0.01568628, 1,
-0.3890265, 0.1640818, -0.6836659, 0, 1, 0.02352941, 1,
-0.3864079, 0.1193256, -3.723854, 0, 1, 0.02745098, 1,
-0.3820187, 0.3395712, -0.4226369, 0, 1, 0.03529412, 1,
-0.3812138, -2.342164, -3.899095, 0, 1, 0.03921569, 1,
-0.3811797, 0.7319514, 0.5102444, 0, 1, 0.04705882, 1,
-0.3755174, -0.7835129, -1.094804, 0, 1, 0.05098039, 1,
-0.3754061, -0.5869143, -3.455459, 0, 1, 0.05882353, 1,
-0.3736354, 0.6680844, -1.612506, 0, 1, 0.0627451, 1,
-0.3713129, 0.8359661, -0.6003262, 0, 1, 0.07058824, 1,
-0.3667241, 0.6613593, 2.486052, 0, 1, 0.07450981, 1,
-0.3639332, 1.321172, -1.079465, 0, 1, 0.08235294, 1,
-0.3624553, 1.390441, -1.853932, 0, 1, 0.08627451, 1,
-0.3616023, -0.02182245, -0.7956439, 0, 1, 0.09411765, 1,
-0.3583265, -1.463401, -3.14661, 0, 1, 0.1019608, 1,
-0.3574626, -1.649534, -4.181345, 0, 1, 0.1058824, 1,
-0.3564676, 1.001783, 0.1712151, 0, 1, 0.1137255, 1,
-0.3549635, -1.093913, -2.249161, 0, 1, 0.1176471, 1,
-0.3542553, 0.1288209, 0.312291, 0, 1, 0.1254902, 1,
-0.3497882, -1.128265, -3.279279, 0, 1, 0.1294118, 1,
-0.3483399, -0.3740887, -1.664436, 0, 1, 0.1372549, 1,
-0.3482986, -1.224128, -2.193671, 0, 1, 0.1411765, 1,
-0.3435022, 0.4042642, -1.168034, 0, 1, 0.1490196, 1,
-0.3404104, 1.493464, -0.4768032, 0, 1, 0.1529412, 1,
-0.3400493, -0.85812, -3.926488, 0, 1, 0.1607843, 1,
-0.3388503, -0.3092301, -2.918739, 0, 1, 0.1647059, 1,
-0.3374276, -0.293255, -1.939465, 0, 1, 0.172549, 1,
-0.3331651, 0.7997009, -1.106748, 0, 1, 0.1764706, 1,
-0.3330311, -1.440706, -1.071004, 0, 1, 0.1843137, 1,
-0.3235869, 1.106362, -1.498479, 0, 1, 0.1882353, 1,
-0.3234086, -1.475969, -3.240913, 0, 1, 0.1960784, 1,
-0.3217479, 1.186998, -0.8441304, 0, 1, 0.2039216, 1,
-0.3153965, 0.6390359, -1.648204, 0, 1, 0.2078431, 1,
-0.3149374, -0.5818145, -0.1380706, 0, 1, 0.2156863, 1,
-0.3047333, -0.5707739, -1.710507, 0, 1, 0.2196078, 1,
-0.3038162, -1.815254, -4.195424, 0, 1, 0.227451, 1,
-0.2995825, -0.2752572, -2.694165, 0, 1, 0.2313726, 1,
-0.2993528, -0.5600703, -0.2890078, 0, 1, 0.2392157, 1,
-0.2974424, -0.6238918, -2.844305, 0, 1, 0.2431373, 1,
-0.2959253, -1.573073, -2.944914, 0, 1, 0.2509804, 1,
-0.2957273, 0.4901316, -0.8197604, 0, 1, 0.254902, 1,
-0.2906491, 0.02045402, -0.2133483, 0, 1, 0.2627451, 1,
-0.2904059, -0.2775733, -1.233857, 0, 1, 0.2666667, 1,
-0.2897319, -0.2519072, -2.318046, 0, 1, 0.2745098, 1,
-0.2875757, -0.7303425, -1.861593, 0, 1, 0.2784314, 1,
-0.2833984, 0.9785773, -0.7870456, 0, 1, 0.2862745, 1,
-0.2830643, 1.137291, -1.439869, 0, 1, 0.2901961, 1,
-0.2780817, 0.8772807, -0.1161505, 0, 1, 0.2980392, 1,
-0.2771336, 0.8234408, -2.06425, 0, 1, 0.3058824, 1,
-0.2720068, -1.680216, -1.672179, 0, 1, 0.3098039, 1,
-0.2716601, 0.3958033, -1.207103, 0, 1, 0.3176471, 1,
-0.2683327, 0.4249315, -0.1789548, 0, 1, 0.3215686, 1,
-0.2670229, 1.069472, -0.07720205, 0, 1, 0.3294118, 1,
-0.2575539, -0.6822609, -2.880551, 0, 1, 0.3333333, 1,
-0.2566367, -0.2426959, -0.9818094, 0, 1, 0.3411765, 1,
-0.256498, 0.2245707, -1.458136, 0, 1, 0.345098, 1,
-0.2500331, -1.481618, -4.288477, 0, 1, 0.3529412, 1,
-0.2495225, -1.010664, -3.150236, 0, 1, 0.3568628, 1,
-0.2437027, -0.1035562, -2.196814, 0, 1, 0.3647059, 1,
-0.2423618, 0.6470739, -1.061323, 0, 1, 0.3686275, 1,
-0.2336961, -1.601832, -3.808095, 0, 1, 0.3764706, 1,
-0.232939, -1.856639, -3.656747, 0, 1, 0.3803922, 1,
-0.2284739, -1.311962, -1.756894, 0, 1, 0.3882353, 1,
-0.2281248, 0.757005, -0.7336793, 0, 1, 0.3921569, 1,
-0.2271979, -0.8310599, -3.30617, 0, 1, 0.4, 1,
-0.2205523, 0.0853458, -1.193898, 0, 1, 0.4078431, 1,
-0.2204078, 0.6380051, 0.3424913, 0, 1, 0.4117647, 1,
-0.2134741, 0.3389457, -1.02814, 0, 1, 0.4196078, 1,
-0.2129494, 1.576794, 0.005127392, 0, 1, 0.4235294, 1,
-0.2104975, 2.531802, -0.2359658, 0, 1, 0.4313726, 1,
-0.2047441, 0.1434443, -2.772142, 0, 1, 0.4352941, 1,
-0.202701, 0.1942895, -0.194331, 0, 1, 0.4431373, 1,
-0.1996574, 1.120918, -0.7310489, 0, 1, 0.4470588, 1,
-0.19743, -1.776879, -3.813249, 0, 1, 0.454902, 1,
-0.1963891, 1.251811, 0.7146136, 0, 1, 0.4588235, 1,
-0.1950959, 0.623596, 1.936739, 0, 1, 0.4666667, 1,
-0.1949436, 0.7959976, 0.5107188, 0, 1, 0.4705882, 1,
-0.1811976, 0.4725509, 0.8423047, 0, 1, 0.4784314, 1,
-0.1792863, 0.7556896, 1.325544, 0, 1, 0.4823529, 1,
-0.1780252, 0.1764994, -0.3207533, 0, 1, 0.4901961, 1,
-0.1776802, -0.6573198, -3.687665, 0, 1, 0.4941176, 1,
-0.1752028, -2.563199, -3.428234, 0, 1, 0.5019608, 1,
-0.1737027, -0.6759359, -2.260404, 0, 1, 0.509804, 1,
-0.1730725, 0.3224767, -0.3901717, 0, 1, 0.5137255, 1,
-0.1728994, -1.090953, -2.165994, 0, 1, 0.5215687, 1,
-0.1702146, -0.3703521, -2.615514, 0, 1, 0.5254902, 1,
-0.1691888, 0.5416579, -0.3754689, 0, 1, 0.5333334, 1,
-0.1684159, 1.430883, -1.635251, 0, 1, 0.5372549, 1,
-0.1670288, -0.09198556, -2.223199, 0, 1, 0.5450981, 1,
-0.1656398, 2.022951, -1.471562, 0, 1, 0.5490196, 1,
-0.1597892, 1.694731, -1.212126, 0, 1, 0.5568628, 1,
-0.1591631, 0.291475, -2.296579, 0, 1, 0.5607843, 1,
-0.1565945, -0.7658877, -3.419124, 0, 1, 0.5686275, 1,
-0.1537872, 1.186558, 1.042311, 0, 1, 0.572549, 1,
-0.1495967, -0.4813881, -2.76388, 0, 1, 0.5803922, 1,
-0.1466755, -0.7720449, -3.033519, 0, 1, 0.5843138, 1,
-0.1453458, 2.10205, -0.8346353, 0, 1, 0.5921569, 1,
-0.1434398, -0.9489126, -3.160808, 0, 1, 0.5960785, 1,
-0.1428074, -1.445319, -3.416575, 0, 1, 0.6039216, 1,
-0.1388638, 0.3826261, 0.2306976, 0, 1, 0.6117647, 1,
-0.1377117, -0.05512214, 0.003731088, 0, 1, 0.6156863, 1,
-0.1354718, -0.6206264, -3.76343, 0, 1, 0.6235294, 1,
-0.1327111, 1.031994, -0.2536049, 0, 1, 0.627451, 1,
-0.130609, -0.103921, -3.799114, 0, 1, 0.6352941, 1,
-0.1304508, -1.79019, -2.32146, 0, 1, 0.6392157, 1,
-0.1234897, 1.601318, 1.077425, 0, 1, 0.6470588, 1,
-0.1216724, -0.6407707, -2.556793, 0, 1, 0.6509804, 1,
-0.1166013, -1.532306, -3.072437, 0, 1, 0.6588235, 1,
-0.1154086, -0.6497254, -2.815712, 0, 1, 0.6627451, 1,
-0.1145303, 0.2163672, 0.7073399, 0, 1, 0.6705883, 1,
-0.1064828, -0.72574, -2.380239, 0, 1, 0.6745098, 1,
-0.1061412, -0.6663002, -0.684234, 0, 1, 0.682353, 1,
-0.103705, -0.1544437, -3.671443, 0, 1, 0.6862745, 1,
-0.09517157, -0.3834824, -3.257863, 0, 1, 0.6941177, 1,
-0.0947553, 0.4255136, -1.126182, 0, 1, 0.7019608, 1,
-0.09466844, 0.2924156, -1.223955, 0, 1, 0.7058824, 1,
-0.09409898, -0.02262527, -1.687889, 0, 1, 0.7137255, 1,
-0.09108335, -0.7713953, -4.407763, 0, 1, 0.7176471, 1,
-0.09095203, -1.384353, -3.885602, 0, 1, 0.7254902, 1,
-0.08922755, 0.8154349, -0.07296448, 0, 1, 0.7294118, 1,
-0.08891394, 0.4871408, -1.800572, 0, 1, 0.7372549, 1,
-0.08308847, -1.639725, -1.83287, 0, 1, 0.7411765, 1,
-0.07324284, 0.3070002, -0.6494945, 0, 1, 0.7490196, 1,
-0.07053366, -1.037287, -4.374445, 0, 1, 0.7529412, 1,
-0.06976403, 0.8068127, -0.4670258, 0, 1, 0.7607843, 1,
-0.06733634, 0.09734407, 0.2833956, 0, 1, 0.7647059, 1,
-0.06302118, -1.417873, -3.733558, 0, 1, 0.772549, 1,
-0.06034482, 1.080114, -0.6871077, 0, 1, 0.7764706, 1,
-0.05570145, 0.6218082, -0.9344987, 0, 1, 0.7843137, 1,
-0.0556042, -0.9304113, -3.835835, 0, 1, 0.7882353, 1,
-0.05190317, -1.232881, -2.685991, 0, 1, 0.7960784, 1,
-0.0510269, -2.015668, -2.848144, 0, 1, 0.8039216, 1,
-0.05028308, -2.833416, -2.543317, 0, 1, 0.8078431, 1,
-0.04685486, 0.7538474, -0.2132907, 0, 1, 0.8156863, 1,
-0.04218351, -0.4610477, -2.566458, 0, 1, 0.8196079, 1,
-0.04046595, -0.02107349, -2.457258, 0, 1, 0.827451, 1,
-0.03652138, 0.6574169, -2.110931, 0, 1, 0.8313726, 1,
-0.03614671, 1.18047, 0.2855634, 0, 1, 0.8392157, 1,
-0.0337685, 0.4707421, -0.2153018, 0, 1, 0.8431373, 1,
-0.03299776, -0.6191534, -1.595448, 0, 1, 0.8509804, 1,
-0.03238175, -0.8077233, -3.292004, 0, 1, 0.854902, 1,
-0.03122514, 0.3902947, 0.3783083, 0, 1, 0.8627451, 1,
-0.03099084, 0.7303141, -1.192695, 0, 1, 0.8666667, 1,
-0.02911295, 1.571555, -1.048124, 0, 1, 0.8745098, 1,
-0.02573526, 1.589552, -1.398962, 0, 1, 0.8784314, 1,
-0.01245609, -1.715453, -3.856303, 0, 1, 0.8862745, 1,
-0.01117478, 0.3963475, -0.8414752, 0, 1, 0.8901961, 1,
-0.009351157, -0.8806537, -2.643272, 0, 1, 0.8980392, 1,
-0.008071771, -1.686705, -3.942388, 0, 1, 0.9058824, 1,
-0.007331174, 0.3477406, -1.125752, 0, 1, 0.9098039, 1,
-0.007193792, 0.9587538, -1.427113, 0, 1, 0.9176471, 1,
-0.00450176, -0.07703415, -3.448931, 0, 1, 0.9215686, 1,
-0.003783612, 0.7564449, -0.9457184, 0, 1, 0.9294118, 1,
0.0006645027, -0.3172283, 3.568122, 0, 1, 0.9333333, 1,
0.001815933, 1.533167, -0.2848202, 0, 1, 0.9411765, 1,
0.00479147, -1.801683, 3.870061, 0, 1, 0.945098, 1,
0.00604279, -0.001612907, 2.552854, 0, 1, 0.9529412, 1,
0.007036241, -0.02858268, 1.534392, 0, 1, 0.9568627, 1,
0.00756907, 0.3475364, 0.8283638, 0, 1, 0.9647059, 1,
0.007623961, -1.566666, 3.588823, 0, 1, 0.9686275, 1,
0.009646592, -0.2189886, 3.948644, 0, 1, 0.9764706, 1,
0.01123218, 0.8927755, 1.751496, 0, 1, 0.9803922, 1,
0.01166841, -0.02202479, 4.084781, 0, 1, 0.9882353, 1,
0.01463749, 1.001668, -0.1349838, 0, 1, 0.9921569, 1,
0.02209019, 0.3079654, 1.519582, 0, 1, 1, 1,
0.02301674, 0.741402, 1.146686, 0, 0.9921569, 1, 1,
0.02423992, -0.26515, 3.52549, 0, 0.9882353, 1, 1,
0.02463611, 0.8592736, -0.6264683, 0, 0.9803922, 1, 1,
0.02693654, 1.5983, -0.2243361, 0, 0.9764706, 1, 1,
0.02749667, -0.4847401, 4.207574, 0, 0.9686275, 1, 1,
0.02926758, -0.5812606, 2.284214, 0, 0.9647059, 1, 1,
0.03292818, 0.06719727, -0.7819703, 0, 0.9568627, 1, 1,
0.04074679, 2.103466, -0.6074289, 0, 0.9529412, 1, 1,
0.04290472, 1.510467, -0.4459879, 0, 0.945098, 1, 1,
0.0429905, -0.9504665, 3.143507, 0, 0.9411765, 1, 1,
0.04417353, -0.07834474, 3.252464, 0, 0.9333333, 1, 1,
0.04755406, -0.07374502, 3.669637, 0, 0.9294118, 1, 1,
0.05169611, -0.009763514, 1.914362, 0, 0.9215686, 1, 1,
0.05238703, 0.109332, 1.116046, 0, 0.9176471, 1, 1,
0.05761222, -0.921609, 1.405132, 0, 0.9098039, 1, 1,
0.05803603, 0.4048758, -0.344108, 0, 0.9058824, 1, 1,
0.06035194, 0.06634329, 0.6411475, 0, 0.8980392, 1, 1,
0.06432891, 1.372381, 1.136017, 0, 0.8901961, 1, 1,
0.06496996, -0.06235424, 1.345702, 0, 0.8862745, 1, 1,
0.06792275, -3.495088, 1.955182, 0, 0.8784314, 1, 1,
0.07053152, -0.3635623, 2.83489, 0, 0.8745098, 1, 1,
0.07072234, 0.7729628, -1.627363, 0, 0.8666667, 1, 1,
0.07762191, -0.08640735, 1.889014, 0, 0.8627451, 1, 1,
0.08110368, 0.4675129, -0.8689141, 0, 0.854902, 1, 1,
0.08115814, -0.6358579, 4.546773, 0, 0.8509804, 1, 1,
0.08386497, -0.5338632, 3.329047, 0, 0.8431373, 1, 1,
0.08390971, 0.3394215, 1.53953, 0, 0.8392157, 1, 1,
0.08486199, -0.638834, 4.868598, 0, 0.8313726, 1, 1,
0.08540884, -2.770766, 2.849746, 0, 0.827451, 1, 1,
0.08935781, 1.094226, 0.799934, 0, 0.8196079, 1, 1,
0.0910581, 0.1587413, -1.026638, 0, 0.8156863, 1, 1,
0.09132711, -0.7591832, 2.390862, 0, 0.8078431, 1, 1,
0.09234715, 0.9135073, -1.474521, 0, 0.8039216, 1, 1,
0.09291583, -1.708228, 2.841504, 0, 0.7960784, 1, 1,
0.09337068, 0.2638371, 1.025906, 0, 0.7882353, 1, 1,
0.0967152, -1.193398, 2.857835, 0, 0.7843137, 1, 1,
0.1026719, -0.6381588, 3.071818, 0, 0.7764706, 1, 1,
0.1054884, -0.4358909, 0.3834219, 0, 0.772549, 1, 1,
0.106012, 0.4202296, -0.1285415, 0, 0.7647059, 1, 1,
0.1077276, -1.157786, 1.900161, 0, 0.7607843, 1, 1,
0.1122046, 0.2295438, 0.0539281, 0, 0.7529412, 1, 1,
0.1170937, -2.916601, 2.915044, 0, 0.7490196, 1, 1,
0.1188467, -0.7003297, 4.864889, 0, 0.7411765, 1, 1,
0.1189679, 1.624357, -1.804185, 0, 0.7372549, 1, 1,
0.1214604, 1.685718, -1.035135, 0, 0.7294118, 1, 1,
0.121669, -1.731732, 4.256993, 0, 0.7254902, 1, 1,
0.1220892, 1.24767, -0.1375932, 0, 0.7176471, 1, 1,
0.1249324, 0.4488823, 0.4050364, 0, 0.7137255, 1, 1,
0.1266858, -0.135684, 4.229204, 0, 0.7058824, 1, 1,
0.1279926, -0.2954077, 3.602381, 0, 0.6980392, 1, 1,
0.1287724, -1.065002, 5.795952, 0, 0.6941177, 1, 1,
0.1350527, -0.9654257, 3.270871, 0, 0.6862745, 1, 1,
0.1393019, -0.8618751, 4.077107, 0, 0.682353, 1, 1,
0.139801, 1.709783, 0.08628248, 0, 0.6745098, 1, 1,
0.1406908, 0.4280243, -1.218495, 0, 0.6705883, 1, 1,
0.1408615, -2.089387, 3.585953, 0, 0.6627451, 1, 1,
0.1418145, -1.681466, 3.193343, 0, 0.6588235, 1, 1,
0.1421715, 0.6275464, 1.191159, 0, 0.6509804, 1, 1,
0.1428901, -0.7518251, 4.606225, 0, 0.6470588, 1, 1,
0.1437782, 0.9396402, -0.7029229, 0, 0.6392157, 1, 1,
0.1444504, -0.8589158, 3.286658, 0, 0.6352941, 1, 1,
0.1464058, -0.03008538, 0.6822054, 0, 0.627451, 1, 1,
0.1472798, 0.01525859, 2.147065, 0, 0.6235294, 1, 1,
0.1510223, -0.1447053, 1.870587, 0, 0.6156863, 1, 1,
0.1536482, 0.1641699, 2.130985, 0, 0.6117647, 1, 1,
0.1568521, -0.8017017, 3.075396, 0, 0.6039216, 1, 1,
0.1604661, -0.2543918, 1.871607, 0, 0.5960785, 1, 1,
0.1607213, 1.896521, 0.5465823, 0, 0.5921569, 1, 1,
0.1614968, -1.018713, 3.762534, 0, 0.5843138, 1, 1,
0.1635994, -0.8063404, 1.810126, 0, 0.5803922, 1, 1,
0.1718521, 0.5905204, 0.1249537, 0, 0.572549, 1, 1,
0.17286, 0.9677358, -0.6133685, 0, 0.5686275, 1, 1,
0.1745704, -0.07451882, 2.434304, 0, 0.5607843, 1, 1,
0.1765663, 0.3178887, 1.341113, 0, 0.5568628, 1, 1,
0.1783035, -0.03629493, 2.694116, 0, 0.5490196, 1, 1,
0.182687, -1.194669, 1.83016, 0, 0.5450981, 1, 1,
0.1883454, -1.513376, 2.407631, 0, 0.5372549, 1, 1,
0.1905588, -0.02983118, 0.219525, 0, 0.5333334, 1, 1,
0.1931533, 1.913999, 0.1195541, 0, 0.5254902, 1, 1,
0.1964106, 0.9645214, 1.258976, 0, 0.5215687, 1, 1,
0.1981978, -0.2536432, 1.899881, 0, 0.5137255, 1, 1,
0.1986694, 0.6781204, 1.569712, 0, 0.509804, 1, 1,
0.2004974, -1.819929, 4.56686, 0, 0.5019608, 1, 1,
0.2007715, 0.2127649, 0.0555561, 0, 0.4941176, 1, 1,
0.2027814, -0.3631223, 3.143021, 0, 0.4901961, 1, 1,
0.2040652, 1.221778, 0.1083446, 0, 0.4823529, 1, 1,
0.205274, 0.7952735, -0.7997349, 0, 0.4784314, 1, 1,
0.2074812, 0.04503841, 0.6813464, 0, 0.4705882, 1, 1,
0.2106424, -0.7582247, 1.976209, 0, 0.4666667, 1, 1,
0.2113962, -0.4016137, 4.729561, 0, 0.4588235, 1, 1,
0.2129552, -0.55955, 1.96012, 0, 0.454902, 1, 1,
0.2149691, 1.199314, 0.01393287, 0, 0.4470588, 1, 1,
0.215051, 0.1280367, 0.7644914, 0, 0.4431373, 1, 1,
0.2176294, -1.544456, 3.267495, 0, 0.4352941, 1, 1,
0.2223465, -2.273639, 2.423869, 0, 0.4313726, 1, 1,
0.2224455, 0.8852566, -0.1627783, 0, 0.4235294, 1, 1,
0.2238873, 0.5776039, 0.9232123, 0, 0.4196078, 1, 1,
0.2246359, 0.3220447, 1.492146, 0, 0.4117647, 1, 1,
0.2301861, 0.8823112, 2.320146, 0, 0.4078431, 1, 1,
0.2325296, 1.037333, -1.359864, 0, 0.4, 1, 1,
0.2350636, -0.040341, 2.815032, 0, 0.3921569, 1, 1,
0.238345, -0.5209323, 2.807617, 0, 0.3882353, 1, 1,
0.2408524, 0.4146982, 1.524805, 0, 0.3803922, 1, 1,
0.2427346, -0.75644, 2.50754, 0, 0.3764706, 1, 1,
0.2437207, -0.09398105, 3.02047, 0, 0.3686275, 1, 1,
0.244008, 0.3133975, 1.381586, 0, 0.3647059, 1, 1,
0.2445126, 0.01467672, 1.336167, 0, 0.3568628, 1, 1,
0.2479256, -1.104647, 4.003197, 0, 0.3529412, 1, 1,
0.2546286, -0.8711025, 2.585371, 0, 0.345098, 1, 1,
0.256952, -0.0697208, 1.558076, 0, 0.3411765, 1, 1,
0.2570453, -1.323091, 4.628416, 0, 0.3333333, 1, 1,
0.2592971, 1.59363, 1.285279, 0, 0.3294118, 1, 1,
0.260731, 0.1412318, 1.552446, 0, 0.3215686, 1, 1,
0.2625985, 3.153772, -0.5026233, 0, 0.3176471, 1, 1,
0.2630596, 0.7590761, 0.3832442, 0, 0.3098039, 1, 1,
0.2635812, 1.322738, 0.1688607, 0, 0.3058824, 1, 1,
0.2657209, 0.1542312, 0.9460852, 0, 0.2980392, 1, 1,
0.2665828, 0.8060216, -1.279591, 0, 0.2901961, 1, 1,
0.2718396, 0.1731268, 1.510739, 0, 0.2862745, 1, 1,
0.2746903, 1.205474, 0.2209696, 0, 0.2784314, 1, 1,
0.2769636, 0.9459089, 1.299365, 0, 0.2745098, 1, 1,
0.2794617, -0.8074142, 4.199048, 0, 0.2666667, 1, 1,
0.2818998, -0.4773975, 1.403008, 0, 0.2627451, 1, 1,
0.283417, 2.322869, 0.8137404, 0, 0.254902, 1, 1,
0.2835228, 0.8009989, -0.0848818, 0, 0.2509804, 1, 1,
0.2875126, -0.4909831, 2.736231, 0, 0.2431373, 1, 1,
0.2889378, -0.6411672, 3.708476, 0, 0.2392157, 1, 1,
0.2970589, -0.07407011, 2.115125, 0, 0.2313726, 1, 1,
0.3019445, -1.633604, 2.975266, 0, 0.227451, 1, 1,
0.3075786, 0.6412522, -0.9567627, 0, 0.2196078, 1, 1,
0.3107523, -0.6119578, 1.89724, 0, 0.2156863, 1, 1,
0.3185814, -0.0609482, 2.020147, 0, 0.2078431, 1, 1,
0.3194078, -0.5066579, 3.545783, 0, 0.2039216, 1, 1,
0.3249395, 1.827634, 1.233137, 0, 0.1960784, 1, 1,
0.3286455, 1.306941, 0.5635829, 0, 0.1882353, 1, 1,
0.336393, 0.7791355, 0.2021075, 0, 0.1843137, 1, 1,
0.3383195, -0.6014959, 3.52821, 0, 0.1764706, 1, 1,
0.3463056, 0.5539958, -0.4006214, 0, 0.172549, 1, 1,
0.3521919, 0.4575701, -0.1080538, 0, 0.1647059, 1, 1,
0.3548573, -0.1959372, 2.61714, 0, 0.1607843, 1, 1,
0.3556867, -0.2052099, 1.993221, 0, 0.1529412, 1, 1,
0.3590099, -0.106862, 1.209714, 0, 0.1490196, 1, 1,
0.3599444, 0.1712609, 1.195073, 0, 0.1411765, 1, 1,
0.3618988, 0.1699129, 2.087059, 0, 0.1372549, 1, 1,
0.3626047, -1.477488, 2.010589, 0, 0.1294118, 1, 1,
0.3679328, 1.548698, 1.244293, 0, 0.1254902, 1, 1,
0.3697701, -0.3428951, 1.416717, 0, 0.1176471, 1, 1,
0.3746953, 1.569011, 0.2373928, 0, 0.1137255, 1, 1,
0.3756879, 0.1754531, -0.4977766, 0, 0.1058824, 1, 1,
0.3804399, 0.2146805, 2.442605, 0, 0.09803922, 1, 1,
0.3809429, -0.8205177, 1.68058, 0, 0.09411765, 1, 1,
0.3831757, -0.9981852, 3.784686, 0, 0.08627451, 1, 1,
0.3838403, -1.842492, 2.617109, 0, 0.08235294, 1, 1,
0.3846388, 1.260401, -0.2399854, 0, 0.07450981, 1, 1,
0.3888116, -0.09464509, 2.007329, 0, 0.07058824, 1, 1,
0.4021112, 2.055323, 1.267643, 0, 0.0627451, 1, 1,
0.404017, 0.2524555, 1.392956, 0, 0.05882353, 1, 1,
0.4040858, -1.283788, 3.780586, 0, 0.05098039, 1, 1,
0.4048241, -0.2012324, 1.078266, 0, 0.04705882, 1, 1,
0.4050061, -1.112045, 0.9415968, 0, 0.03921569, 1, 1,
0.4051145, -0.4207553, 3.898305, 0, 0.03529412, 1, 1,
0.4067898, 0.2637051, 2.628371, 0, 0.02745098, 1, 1,
0.4091186, 0.5634657, 1.474279, 0, 0.02352941, 1, 1,
0.4132914, 1.142551, -0.4772597, 0, 0.01568628, 1, 1,
0.4138709, -0.4940454, 2.832644, 0, 0.01176471, 1, 1,
0.414967, 1.051396, -0.3959151, 0, 0.003921569, 1, 1,
0.4208328, -0.6819146, 1.987229, 0.003921569, 0, 1, 1,
0.4231405, 0.6156115, 1.255895, 0.007843138, 0, 1, 1,
0.4296999, 0.5999373, 1.9985, 0.01568628, 0, 1, 1,
0.4320649, -0.7159767, 3.687751, 0.01960784, 0, 1, 1,
0.4324061, -0.8051341, 1.238363, 0.02745098, 0, 1, 1,
0.435678, 1.117966, 0.9793748, 0.03137255, 0, 1, 1,
0.4363785, -0.1424473, 0.4083834, 0.03921569, 0, 1, 1,
0.4364778, -1.995769, 2.645822, 0.04313726, 0, 1, 1,
0.4383949, 2.835209, 0.04482975, 0.05098039, 0, 1, 1,
0.4408966, 1.711744, 0.9148039, 0.05490196, 0, 1, 1,
0.4414833, -1.768819, 3.79989, 0.0627451, 0, 1, 1,
0.4417454, -1.338685, 2.942808, 0.06666667, 0, 1, 1,
0.4430506, -0.7051689, 4.51489, 0.07450981, 0, 1, 1,
0.4477871, 1.459995, -1.522693, 0.07843138, 0, 1, 1,
0.4540479, -0.7013406, 2.077171, 0.08627451, 0, 1, 1,
0.4548146, -0.3848434, 2.024644, 0.09019608, 0, 1, 1,
0.4597175, -0.07756911, 0.4700344, 0.09803922, 0, 1, 1,
0.4637046, 2.114873, -0.8456084, 0.1058824, 0, 1, 1,
0.4712112, 0.6089382, 1.65421, 0.1098039, 0, 1, 1,
0.4727139, -1.511784, 3.354006, 0.1176471, 0, 1, 1,
0.4771404, -0.3280166, 0.8952794, 0.1215686, 0, 1, 1,
0.4831713, 0.6112183, 1.052947, 0.1294118, 0, 1, 1,
0.4868938, 0.39125, 0.1879987, 0.1333333, 0, 1, 1,
0.4908772, 1.324793, 0.8516102, 0.1411765, 0, 1, 1,
0.4924824, -1.502159, 3.192052, 0.145098, 0, 1, 1,
0.4939544, -1.541907, 2.592792, 0.1529412, 0, 1, 1,
0.4975807, -0.1708578, 1.361252, 0.1568628, 0, 1, 1,
0.4986494, -0.2401532, 0.5662817, 0.1647059, 0, 1, 1,
0.5012508, -1.158046, 4.244181, 0.1686275, 0, 1, 1,
0.5182694, -1.514543, 1.808901, 0.1764706, 0, 1, 1,
0.5207274, -0.9117397, 4.455112, 0.1803922, 0, 1, 1,
0.5277122, -0.1611088, 2.424601, 0.1882353, 0, 1, 1,
0.5340465, -1.54997, 1.96825, 0.1921569, 0, 1, 1,
0.5393759, -0.1278016, 1.392977, 0.2, 0, 1, 1,
0.5403768, 0.1177092, 1.205083, 0.2078431, 0, 1, 1,
0.5407518, -0.5682827, 2.512557, 0.2117647, 0, 1, 1,
0.5414439, 0.2991556, 0.5426092, 0.2196078, 0, 1, 1,
0.5445736, 0.1387568, 0.7280144, 0.2235294, 0, 1, 1,
0.5461237, 0.5478536, -1.236635, 0.2313726, 0, 1, 1,
0.5470161, 0.8223003, 1.961989, 0.2352941, 0, 1, 1,
0.547938, -0.1040017, 1.71091, 0.2431373, 0, 1, 1,
0.5586466, -1.372227, 2.591995, 0.2470588, 0, 1, 1,
0.564719, -0.4353559, 4.709907, 0.254902, 0, 1, 1,
0.5649668, 0.8271929, 0.01836927, 0.2588235, 0, 1, 1,
0.5709025, 1.551333, 0.004112571, 0.2666667, 0, 1, 1,
0.573128, 0.1270254, 1.326516, 0.2705882, 0, 1, 1,
0.5746021, 1.126478, -0.6894906, 0.2784314, 0, 1, 1,
0.5751289, 0.4978317, 0.6463308, 0.282353, 0, 1, 1,
0.5772856, 0.9920249, -0.8078874, 0.2901961, 0, 1, 1,
0.5805869, -1.779926, 3.439368, 0.2941177, 0, 1, 1,
0.5872124, -1.09531, 4.149601, 0.3019608, 0, 1, 1,
0.589785, -0.08173513, 1.92866, 0.3098039, 0, 1, 1,
0.5922925, -0.7228413, 3.379553, 0.3137255, 0, 1, 1,
0.5963144, 0.3489555, -0.1059359, 0.3215686, 0, 1, 1,
0.5969051, 0.3297639, -0.2547193, 0.3254902, 0, 1, 1,
0.5996897, 1.854812, -1.14078, 0.3333333, 0, 1, 1,
0.5998139, -0.08946435, 1.22933, 0.3372549, 0, 1, 1,
0.6007989, -0.6930687, 2.738888, 0.345098, 0, 1, 1,
0.6038884, 0.56677, 1.109494, 0.3490196, 0, 1, 1,
0.6048723, 0.4448339, 1.333291, 0.3568628, 0, 1, 1,
0.6049812, 0.4735336, 1.405133, 0.3607843, 0, 1, 1,
0.6132442, -0.1306249, 0.8903013, 0.3686275, 0, 1, 1,
0.6140217, -1.12059, 3.201923, 0.372549, 0, 1, 1,
0.6152924, 0.145228, 1.92339, 0.3803922, 0, 1, 1,
0.6213566, 0.3247738, 1.031885, 0.3843137, 0, 1, 1,
0.6227615, -0.6680581, 1.874996, 0.3921569, 0, 1, 1,
0.6231495, 0.9286003, -0.2559159, 0.3960784, 0, 1, 1,
0.6341457, -0.1589008, 2.180274, 0.4039216, 0, 1, 1,
0.6407817, -0.2371455, 0.8663449, 0.4117647, 0, 1, 1,
0.6441538, -0.2315597, 3.44495, 0.4156863, 0, 1, 1,
0.6456289, 0.36857, 1.796505, 0.4235294, 0, 1, 1,
0.6530061, -0.4945233, 4.102526, 0.427451, 0, 1, 1,
0.6567847, -1.17297, 1.904162, 0.4352941, 0, 1, 1,
0.6593038, -0.5650662, 2.036768, 0.4392157, 0, 1, 1,
0.6627346, -0.1963162, 1.07296, 0.4470588, 0, 1, 1,
0.6628596, -0.3251612, 2.271582, 0.4509804, 0, 1, 1,
0.6645048, 0.1377996, 1.272441, 0.4588235, 0, 1, 1,
0.6658472, 0.7708313, 0.2921342, 0.4627451, 0, 1, 1,
0.6704118, 0.3491943, 3.296203, 0.4705882, 0, 1, 1,
0.6747051, -0.4723866, 2.019805, 0.4745098, 0, 1, 1,
0.675957, -0.1000803, 2.6489, 0.4823529, 0, 1, 1,
0.6796372, -1.393191, 1.616472, 0.4862745, 0, 1, 1,
0.6910131, -0.6882578, 3.598835, 0.4941176, 0, 1, 1,
0.7000032, 0.5192649, 0.4757019, 0.5019608, 0, 1, 1,
0.7001031, 0.3384568, 0.8360134, 0.5058824, 0, 1, 1,
0.7005004, -0.5968282, 0.1822152, 0.5137255, 0, 1, 1,
0.7128589, -0.1009526, 1.244269, 0.5176471, 0, 1, 1,
0.7151668, -0.8872324, 1.887304, 0.5254902, 0, 1, 1,
0.7154923, -1.349231, 1.400946, 0.5294118, 0, 1, 1,
0.7183605, 1.891438, 1.392157, 0.5372549, 0, 1, 1,
0.7184409, 0.05394936, 1.83866, 0.5411765, 0, 1, 1,
0.7200017, 0.351725, 1.424312, 0.5490196, 0, 1, 1,
0.7337567, -1.32357, 2.336226, 0.5529412, 0, 1, 1,
0.7351146, -1.397132, 2.216608, 0.5607843, 0, 1, 1,
0.7375348, -0.587137, 2.508099, 0.5647059, 0, 1, 1,
0.73866, 2.619863, -0.3715252, 0.572549, 0, 1, 1,
0.7507825, 0.4250314, 2.404072, 0.5764706, 0, 1, 1,
0.7545841, 0.1357661, 1.213471, 0.5843138, 0, 1, 1,
0.7559936, 1.275858, 1.028992, 0.5882353, 0, 1, 1,
0.7572369, 1.144895, -1.376398, 0.5960785, 0, 1, 1,
0.7580119, -0.1976402, 3.254483, 0.6039216, 0, 1, 1,
0.7627937, -1.473078, 2.855615, 0.6078432, 0, 1, 1,
0.7673825, -0.3128891, 3.55425, 0.6156863, 0, 1, 1,
0.7713364, 0.3191336, -0.2069723, 0.6196079, 0, 1, 1,
0.7725509, -0.5683563, 2.125459, 0.627451, 0, 1, 1,
0.7781671, -0.1940904, 1.198501, 0.6313726, 0, 1, 1,
0.7834887, 1.27513, -0.00737557, 0.6392157, 0, 1, 1,
0.7854173, -0.1295487, 0.9838465, 0.6431373, 0, 1, 1,
0.7864367, 0.5656565, 2.516341, 0.6509804, 0, 1, 1,
0.7880141, -0.1348106, 0.2638352, 0.654902, 0, 1, 1,
0.7881309, 1.391511, 0.4955854, 0.6627451, 0, 1, 1,
0.7882046, 1.134261, 0.2510992, 0.6666667, 0, 1, 1,
0.7892759, -1.003239, 1.264605, 0.6745098, 0, 1, 1,
0.7895373, -0.07964798, 2.300543, 0.6784314, 0, 1, 1,
0.7929515, -0.3141354, 1.546264, 0.6862745, 0, 1, 1,
0.8054662, 0.3929851, 1.669888, 0.6901961, 0, 1, 1,
0.8073794, 0.226336, -0.5622198, 0.6980392, 0, 1, 1,
0.809438, -0.8633271, 1.680802, 0.7058824, 0, 1, 1,
0.8123091, 0.4330209, 0.008446123, 0.7098039, 0, 1, 1,
0.8149436, 0.2835336, 2.209009, 0.7176471, 0, 1, 1,
0.8336693, -0.248639, 3.259469, 0.7215686, 0, 1, 1,
0.8352535, -0.7110483, 2.62394, 0.7294118, 0, 1, 1,
0.8378536, -0.5450899, 2.017516, 0.7333333, 0, 1, 1,
0.8397389, -0.1801011, 1.866269, 0.7411765, 0, 1, 1,
0.8399665, -0.8869088, 3.119758, 0.7450981, 0, 1, 1,
0.8416395, -1.467019, 3.816258, 0.7529412, 0, 1, 1,
0.8445339, -0.3766392, 1.17138, 0.7568628, 0, 1, 1,
0.8489023, 0.4407385, 0.4846262, 0.7647059, 0, 1, 1,
0.8496853, 0.9430891, 0.3676427, 0.7686275, 0, 1, 1,
0.85681, 0.95101, 1.430173, 0.7764706, 0, 1, 1,
0.8580667, 0.6474788, 0.7055178, 0.7803922, 0, 1, 1,
0.8599067, 0.675586, -1.333493, 0.7882353, 0, 1, 1,
0.8644667, -1.155404, 2.100779, 0.7921569, 0, 1, 1,
0.8674698, 0.1176358, 3.646323, 0.8, 0, 1, 1,
0.8697734, 0.4402747, 1.134106, 0.8078431, 0, 1, 1,
0.8727553, 0.7709357, 0.07377827, 0.8117647, 0, 1, 1,
0.878446, -0.07065561, 1.137668, 0.8196079, 0, 1, 1,
0.8812921, -0.4269589, 2.26927, 0.8235294, 0, 1, 1,
0.883028, 0.8435869, 2.046358, 0.8313726, 0, 1, 1,
0.9006894, 0.7642638, 0.2656159, 0.8352941, 0, 1, 1,
0.9023672, 1.028354, 0.3937938, 0.8431373, 0, 1, 1,
0.9048064, 1.397857, 0.2509788, 0.8470588, 0, 1, 1,
0.9078922, -1.040871, 4.16124, 0.854902, 0, 1, 1,
0.9097597, 0.7772217, -0.5099666, 0.8588235, 0, 1, 1,
0.9104201, 0.6355789, 0.9555639, 0.8666667, 0, 1, 1,
0.9208834, -1.152552, 2.85694, 0.8705882, 0, 1, 1,
0.9306747, 0.2554246, 0.494768, 0.8784314, 0, 1, 1,
0.9388745, -0.3840508, 2.467708, 0.8823529, 0, 1, 1,
0.9392981, 0.8004363, 0.9179797, 0.8901961, 0, 1, 1,
0.9402928, 1.433016, 1.365917, 0.8941177, 0, 1, 1,
0.9514892, 0.7854367, 1.375386, 0.9019608, 0, 1, 1,
0.9538334, 0.4358164, 0.7388334, 0.9098039, 0, 1, 1,
0.9541038, -0.9780614, 1.670858, 0.9137255, 0, 1, 1,
0.9586837, 1.459635, 1.921886, 0.9215686, 0, 1, 1,
0.9604791, 1.597884, 0.647218, 0.9254902, 0, 1, 1,
0.960636, 0.4527934, -0.0003760676, 0.9333333, 0, 1, 1,
0.9627967, 0.9577461, 1.09171, 0.9372549, 0, 1, 1,
0.9724725, -1.604781, 3.98177, 0.945098, 0, 1, 1,
0.9751862, 0.8763604, 0.956651, 0.9490196, 0, 1, 1,
0.9876376, -0.3951842, -0.03843859, 0.9568627, 0, 1, 1,
0.9909139, -0.08906934, 1.430046, 0.9607843, 0, 1, 1,
0.9976091, 0.3151241, 1.869749, 0.9686275, 0, 1, 1,
0.9994032, 0.6709297, 0.7707362, 0.972549, 0, 1, 1,
1.002126, 1.275218, -0.9611396, 0.9803922, 0, 1, 1,
1.00876, 0.05716645, 1.426796, 0.9843137, 0, 1, 1,
1.009684, -1.295615, 3.422866, 0.9921569, 0, 1, 1,
1.013872, 1.103014, 0.932184, 0.9960784, 0, 1, 1,
1.019841, 0.8768256, -0.2527112, 1, 0, 0.9960784, 1,
1.022877, -0.111182, 1.94148, 1, 0, 0.9882353, 1,
1.023215, -2.073935, 0.8084605, 1, 0, 0.9843137, 1,
1.023387, 0.6542563, 0.1378784, 1, 0, 0.9764706, 1,
1.032137, 0.2645276, 2.235851, 1, 0, 0.972549, 1,
1.035537, -1.172169, 2.744748, 1, 0, 0.9647059, 1,
1.039902, 0.2648611, 1.280176, 1, 0, 0.9607843, 1,
1.044461, 0.34802, 2.309529, 1, 0, 0.9529412, 1,
1.054877, -1.785223, 4.017902, 1, 0, 0.9490196, 1,
1.058796, -0.3967791, 1.843953, 1, 0, 0.9411765, 1,
1.076113, 0.09157075, 0.9028655, 1, 0, 0.9372549, 1,
1.078251, -0.7935731, 1.513374, 1, 0, 0.9294118, 1,
1.08237, -0.07138234, 1.016415, 1, 0, 0.9254902, 1,
1.082459, -0.1832587, 1.54667, 1, 0, 0.9176471, 1,
1.088454, -0.5591866, 2.542283, 1, 0, 0.9137255, 1,
1.088926, -0.8250033, 1.036183, 1, 0, 0.9058824, 1,
1.092048, -1.413578, 3.000184, 1, 0, 0.9019608, 1,
1.095342, -0.3249575, 0.4492233, 1, 0, 0.8941177, 1,
1.108745, 1.343734, -0.8440405, 1, 0, 0.8862745, 1,
1.111989, -0.9605615, 3.248555, 1, 0, 0.8823529, 1,
1.115903, 1.293594, 0.3438288, 1, 0, 0.8745098, 1,
1.116606, -0.3541895, 1.781464, 1, 0, 0.8705882, 1,
1.116611, 0.7310078, 0.3330504, 1, 0, 0.8627451, 1,
1.118403, 0.4519727, 1.103986, 1, 0, 0.8588235, 1,
1.1253, 0.5436021, 0.3121479, 1, 0, 0.8509804, 1,
1.128822, 1.744191, 1.114888, 1, 0, 0.8470588, 1,
1.129706, 0.09779491, 1.465173, 1, 0, 0.8392157, 1,
1.132262, -0.2327865, 0.6653643, 1, 0, 0.8352941, 1,
1.13505, -1.40961, 3.046947, 1, 0, 0.827451, 1,
1.136129, 0.7443963, 2.232901, 1, 0, 0.8235294, 1,
1.144422, 1.025643, 0.7637706, 1, 0, 0.8156863, 1,
1.148748, 0.5734847, 2.170897, 1, 0, 0.8117647, 1,
1.151315, 1.468579, 0.5720068, 1, 0, 0.8039216, 1,
1.152853, -0.6031788, 1.121451, 1, 0, 0.7960784, 1,
1.160894, 0.2433271, 0.2303135, 1, 0, 0.7921569, 1,
1.161192, -0.1530534, 0.5413645, 1, 0, 0.7843137, 1,
1.161416, -0.6967226, 1.794444, 1, 0, 0.7803922, 1,
1.164362, -1.619991, 2.650311, 1, 0, 0.772549, 1,
1.166596, 0.7700475, 1.23948, 1, 0, 0.7686275, 1,
1.171635, -0.1966315, 1.125434, 1, 0, 0.7607843, 1,
1.175372, 0.1494487, 1.669611, 1, 0, 0.7568628, 1,
1.19337, -0.4253645, 1.91164, 1, 0, 0.7490196, 1,
1.203461, 0.7949891, -0.1506628, 1, 0, 0.7450981, 1,
1.210781, 1.673305, 2.240697, 1, 0, 0.7372549, 1,
1.21254, -0.4056238, 1.915376, 1, 0, 0.7333333, 1,
1.219578, 1.948816, 0.5482301, 1, 0, 0.7254902, 1,
1.221053, 0.757769, 2.209601, 1, 0, 0.7215686, 1,
1.222973, 1.495252, -2.841958, 1, 0, 0.7137255, 1,
1.228064, 0.2448674, 1.421615, 1, 0, 0.7098039, 1,
1.230509, -0.6534665, 1.531419, 1, 0, 0.7019608, 1,
1.230688, 0.8000232, 1.285193, 1, 0, 0.6941177, 1,
1.233793, 0.8726069, 0.2052112, 1, 0, 0.6901961, 1,
1.24188, -0.1824612, 0.9239116, 1, 0, 0.682353, 1,
1.250576, 0.7764446, 1.298492, 1, 0, 0.6784314, 1,
1.261448, -0.01799577, 2.42729, 1, 0, 0.6705883, 1,
1.270454, -0.6540065, 2.404347, 1, 0, 0.6666667, 1,
1.272231, 0.1059513, 0.1632379, 1, 0, 0.6588235, 1,
1.273666, -0.9216557, 2.985377, 1, 0, 0.654902, 1,
1.283482, 0.9931715, 0.05388699, 1, 0, 0.6470588, 1,
1.288041, 0.1912799, 1.619241, 1, 0, 0.6431373, 1,
1.292663, 0.3991862, 1.392417, 1, 0, 0.6352941, 1,
1.296713, 1.242826, 2.58226, 1, 0, 0.6313726, 1,
1.298839, 2.481832, 0.2320591, 1, 0, 0.6235294, 1,
1.299117, -2.012938, 1.061851, 1, 0, 0.6196079, 1,
1.32009, -0.6834069, 2.465525, 1, 0, 0.6117647, 1,
1.320148, 2.074715, 1.387813, 1, 0, 0.6078432, 1,
1.322804, 0.8559049, 0.8377263, 1, 0, 0.6, 1,
1.327223, -0.2062345, 2.829445, 1, 0, 0.5921569, 1,
1.328468, 1.996956, 1.087928, 1, 0, 0.5882353, 1,
1.33087, -0.5514932, 0.8682641, 1, 0, 0.5803922, 1,
1.332345, 0.01223992, 2.133046, 1, 0, 0.5764706, 1,
1.334158, 1.192906, 1.84534, 1, 0, 0.5686275, 1,
1.337106, -0.6429573, 1.965434, 1, 0, 0.5647059, 1,
1.338842, 0.2922932, 1.244068, 1, 0, 0.5568628, 1,
1.33991, 1.28957, 1.298591, 1, 0, 0.5529412, 1,
1.341086, 0.7854971, 0.99898, 1, 0, 0.5450981, 1,
1.354038, -1.661006, 3.59481, 1, 0, 0.5411765, 1,
1.359244, 1.739409, 2.035589, 1, 0, 0.5333334, 1,
1.373818, 0.6065339, 2.256412, 1, 0, 0.5294118, 1,
1.382506, 0.3087409, 2.962622, 1, 0, 0.5215687, 1,
1.388021, 0.6349155, 2.313257, 1, 0, 0.5176471, 1,
1.395632, -0.1504494, 1.375727, 1, 0, 0.509804, 1,
1.396246, -0.6539074, 3.135629, 1, 0, 0.5058824, 1,
1.409254, -0.7670888, 2.382757, 1, 0, 0.4980392, 1,
1.417422, 0.2369209, 2.110177, 1, 0, 0.4901961, 1,
1.429169, -0.8939426, 2.884685, 1, 0, 0.4862745, 1,
1.429189, 0.1465344, 0.7094066, 1, 0, 0.4784314, 1,
1.435761, -1.173417, 3.165902, 1, 0, 0.4745098, 1,
1.436397, 1.186985, 0.7696832, 1, 0, 0.4666667, 1,
1.438059, -0.7278108, 1.742347, 1, 0, 0.4627451, 1,
1.439361, 1.480879, 0.4002317, 1, 0, 0.454902, 1,
1.442767, -0.1249327, 2.937818, 1, 0, 0.4509804, 1,
1.450638, -0.210278, 1.954215, 1, 0, 0.4431373, 1,
1.463809, -0.1798373, 1.761926, 1, 0, 0.4392157, 1,
1.465124, 0.747032, 0.03930455, 1, 0, 0.4313726, 1,
1.473735, -0.4674414, 3.460681, 1, 0, 0.427451, 1,
1.505314, -0.6195083, 2.426411, 1, 0, 0.4196078, 1,
1.513646, -0.003773171, 1.496404, 1, 0, 0.4156863, 1,
1.518732, 0.5392643, 0.5831347, 1, 0, 0.4078431, 1,
1.524219, -0.2049072, 3.127761, 1, 0, 0.4039216, 1,
1.526348, -0.8101934, 1.60271, 1, 0, 0.3960784, 1,
1.52914, 0.3059785, 2.038546, 1, 0, 0.3882353, 1,
1.54697, -0.7631483, 1.72095, 1, 0, 0.3843137, 1,
1.556204, 0.08551652, 1.023486, 1, 0, 0.3764706, 1,
1.558133, 0.8423619, 1.657012, 1, 0, 0.372549, 1,
1.569941, -0.6738986, 0.711409, 1, 0, 0.3647059, 1,
1.582674, -0.8685808, 2.776873, 1, 0, 0.3607843, 1,
1.597383, 1.079123, 2.148024, 1, 0, 0.3529412, 1,
1.607057, -0.06483082, 1.304709, 1, 0, 0.3490196, 1,
1.616122, 0.03053322, 2.235569, 1, 0, 0.3411765, 1,
1.61738, -2.101119, 0.6014206, 1, 0, 0.3372549, 1,
1.617886, 0.6046996, 1.931873, 1, 0, 0.3294118, 1,
1.623529, -1.238839, 1.777875, 1, 0, 0.3254902, 1,
1.625705, -1.39844, 1.968229, 1, 0, 0.3176471, 1,
1.638394, -1.736086, 1.974851, 1, 0, 0.3137255, 1,
1.644936, -0.2478613, 1.165854, 1, 0, 0.3058824, 1,
1.652531, 0.8999804, 0.9221981, 1, 0, 0.2980392, 1,
1.660447, -0.4100427, 1.432924, 1, 0, 0.2941177, 1,
1.672961, 2.201011, -0.817163, 1, 0, 0.2862745, 1,
1.678355, 2.066344, 1.387471, 1, 0, 0.282353, 1,
1.67888, 1.065924, 0.8818939, 1, 0, 0.2745098, 1,
1.682076, -1.022849, 2.852229, 1, 0, 0.2705882, 1,
1.68595, 0.1329776, 1.801293, 1, 0, 0.2627451, 1,
1.699747, -1.23738, 1.479293, 1, 0, 0.2588235, 1,
1.700964, -0.6821802, 1.749552, 1, 0, 0.2509804, 1,
1.708325, -0.321816, 1.228416, 1, 0, 0.2470588, 1,
1.712704, -0.77917, 1.459989, 1, 0, 0.2392157, 1,
1.728141, -1.243402, 1.36492, 1, 0, 0.2352941, 1,
1.749526, -0.08449827, 0.1981785, 1, 0, 0.227451, 1,
1.752662, -1.957193, 0.9991519, 1, 0, 0.2235294, 1,
1.773161, 0.2681994, 2.405126, 1, 0, 0.2156863, 1,
1.780779, 0.3634855, 0.05030455, 1, 0, 0.2117647, 1,
1.782271, -0.6317847, 4.35085, 1, 0, 0.2039216, 1,
1.798915, -1.247309, 3.07958, 1, 0, 0.1960784, 1,
1.810898, -1.227507, 1.589132, 1, 0, 0.1921569, 1,
1.822221, -0.3349477, 2.843444, 1, 0, 0.1843137, 1,
1.870408, 0.7262704, 1.046741, 1, 0, 0.1803922, 1,
1.892096, -0.09870458, 2.250424, 1, 0, 0.172549, 1,
1.896172, 0.6424267, 0.6217337, 1, 0, 0.1686275, 1,
1.913164, 0.3597527, 1.86377, 1, 0, 0.1607843, 1,
1.919318, 2.484305, 0.7786264, 1, 0, 0.1568628, 1,
1.932893, 0.8252586, 3.128299, 1, 0, 0.1490196, 1,
2.006694, 3.055681, 2.362925, 1, 0, 0.145098, 1,
2.01717, -0.8943917, 1.392577, 1, 0, 0.1372549, 1,
2.02928, -0.7387114, 3.774384, 1, 0, 0.1333333, 1,
2.02934, -0.03373303, 2.220542, 1, 0, 0.1254902, 1,
2.053342, 1.645424, 0.6801624, 1, 0, 0.1215686, 1,
2.125813, -0.1219841, 1.164948, 1, 0, 0.1137255, 1,
2.15334, -0.1459362, 2.954337, 1, 0, 0.1098039, 1,
2.167796, -0.8270386, 1.451936, 1, 0, 0.1019608, 1,
2.180571, -0.4212139, 4.876149, 1, 0, 0.09411765, 1,
2.182368, -0.6332062, 0.572851, 1, 0, 0.09019608, 1,
2.204757, -0.5297917, 0.8236952, 1, 0, 0.08235294, 1,
2.22388, 1.983891, 1.015758, 1, 0, 0.07843138, 1,
2.237713, 1.498219, 1.852761, 1, 0, 0.07058824, 1,
2.308158, 1.377991, 1.519086, 1, 0, 0.06666667, 1,
2.325881, -1.501248, 1.530544, 1, 0, 0.05882353, 1,
2.417606, 0.9083796, 2.343989, 1, 0, 0.05490196, 1,
2.432924, -0.1712484, 0.4051309, 1, 0, 0.04705882, 1,
2.436339, 0.6586916, -0.6223503, 1, 0, 0.04313726, 1,
2.469713, 0.2405868, 1.327067, 1, 0, 0.03529412, 1,
2.483674, -0.7888394, 1.940585, 1, 0, 0.03137255, 1,
2.523466, -0.2821467, 0.242012, 1, 0, 0.02352941, 1,
2.538069, 1.868697, 2.049216, 1, 0, 0.01960784, 1,
2.653678, 0.2252896, -0.7893894, 1, 0, 0.01176471, 1,
2.771813, 0.1054354, 4.130689, 1, 0, 0.007843138, 1
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
-0.3652894, -4.622069, -7.153278, 0, -0.5, 0.5, 0.5,
-0.3652894, -4.622069, -7.153278, 1, -0.5, 0.5, 0.5,
-0.3652894, -4.622069, -7.153278, 1, 1.5, 0.5, 0.5,
-0.3652894, -4.622069, -7.153278, 0, 1.5, 0.5, 0.5
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
-4.56587, -0.1706581, -7.153278, 0, -0.5, 0.5, 0.5,
-4.56587, -0.1706581, -7.153278, 1, -0.5, 0.5, 0.5,
-4.56587, -0.1706581, -7.153278, 1, 1.5, 0.5, 0.5,
-4.56587, -0.1706581, -7.153278, 0, 1.5, 0.5, 0.5
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
-4.56587, -4.622069, 0.259727, 0, -0.5, 0.5, 0.5,
-4.56587, -4.622069, 0.259727, 1, -0.5, 0.5, 0.5,
-4.56587, -4.622069, 0.259727, 1, 1.5, 0.5, 0.5,
-4.56587, -4.622069, 0.259727, 0, 1.5, 0.5, 0.5
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
-3, -3.594821, -5.442585,
2, -3.594821, -5.442585,
-3, -3.594821, -5.442585,
-3, -3.766029, -5.7277,
-2, -3.594821, -5.442585,
-2, -3.766029, -5.7277,
-1, -3.594821, -5.442585,
-1, -3.766029, -5.7277,
0, -3.594821, -5.442585,
0, -3.766029, -5.7277,
1, -3.594821, -5.442585,
1, -3.766029, -5.7277,
2, -3.594821, -5.442585,
2, -3.766029, -5.7277
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
-3, -4.108445, -6.297931, 0, -0.5, 0.5, 0.5,
-3, -4.108445, -6.297931, 1, -0.5, 0.5, 0.5,
-3, -4.108445, -6.297931, 1, 1.5, 0.5, 0.5,
-3, -4.108445, -6.297931, 0, 1.5, 0.5, 0.5,
-2, -4.108445, -6.297931, 0, -0.5, 0.5, 0.5,
-2, -4.108445, -6.297931, 1, -0.5, 0.5, 0.5,
-2, -4.108445, -6.297931, 1, 1.5, 0.5, 0.5,
-2, -4.108445, -6.297931, 0, 1.5, 0.5, 0.5,
-1, -4.108445, -6.297931, 0, -0.5, 0.5, 0.5,
-1, -4.108445, -6.297931, 1, -0.5, 0.5, 0.5,
-1, -4.108445, -6.297931, 1, 1.5, 0.5, 0.5,
-1, -4.108445, -6.297931, 0, 1.5, 0.5, 0.5,
0, -4.108445, -6.297931, 0, -0.5, 0.5, 0.5,
0, -4.108445, -6.297931, 1, -0.5, 0.5, 0.5,
0, -4.108445, -6.297931, 1, 1.5, 0.5, 0.5,
0, -4.108445, -6.297931, 0, 1.5, 0.5, 0.5,
1, -4.108445, -6.297931, 0, -0.5, 0.5, 0.5,
1, -4.108445, -6.297931, 1, -0.5, 0.5, 0.5,
1, -4.108445, -6.297931, 1, 1.5, 0.5, 0.5,
1, -4.108445, -6.297931, 0, 1.5, 0.5, 0.5,
2, -4.108445, -6.297931, 0, -0.5, 0.5, 0.5,
2, -4.108445, -6.297931, 1, -0.5, 0.5, 0.5,
2, -4.108445, -6.297931, 1, 1.5, 0.5, 0.5,
2, -4.108445, -6.297931, 0, 1.5, 0.5, 0.5
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
-3.596505, -3, -5.442585,
-3.596505, 3, -5.442585,
-3.596505, -3, -5.442585,
-3.758066, -3, -5.7277,
-3.596505, -2, -5.442585,
-3.758066, -2, -5.7277,
-3.596505, -1, -5.442585,
-3.758066, -1, -5.7277,
-3.596505, 0, -5.442585,
-3.758066, 0, -5.7277,
-3.596505, 1, -5.442585,
-3.758066, 1, -5.7277,
-3.596505, 2, -5.442585,
-3.758066, 2, -5.7277,
-3.596505, 3, -5.442585,
-3.758066, 3, -5.7277
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
-4.081188, -3, -6.297931, 0, -0.5, 0.5, 0.5,
-4.081188, -3, -6.297931, 1, -0.5, 0.5, 0.5,
-4.081188, -3, -6.297931, 1, 1.5, 0.5, 0.5,
-4.081188, -3, -6.297931, 0, 1.5, 0.5, 0.5,
-4.081188, -2, -6.297931, 0, -0.5, 0.5, 0.5,
-4.081188, -2, -6.297931, 1, -0.5, 0.5, 0.5,
-4.081188, -2, -6.297931, 1, 1.5, 0.5, 0.5,
-4.081188, -2, -6.297931, 0, 1.5, 0.5, 0.5,
-4.081188, -1, -6.297931, 0, -0.5, 0.5, 0.5,
-4.081188, -1, -6.297931, 1, -0.5, 0.5, 0.5,
-4.081188, -1, -6.297931, 1, 1.5, 0.5, 0.5,
-4.081188, -1, -6.297931, 0, 1.5, 0.5, 0.5,
-4.081188, 0, -6.297931, 0, -0.5, 0.5, 0.5,
-4.081188, 0, -6.297931, 1, -0.5, 0.5, 0.5,
-4.081188, 0, -6.297931, 1, 1.5, 0.5, 0.5,
-4.081188, 0, -6.297931, 0, 1.5, 0.5, 0.5,
-4.081188, 1, -6.297931, 0, -0.5, 0.5, 0.5,
-4.081188, 1, -6.297931, 1, -0.5, 0.5, 0.5,
-4.081188, 1, -6.297931, 1, 1.5, 0.5, 0.5,
-4.081188, 1, -6.297931, 0, 1.5, 0.5, 0.5,
-4.081188, 2, -6.297931, 0, -0.5, 0.5, 0.5,
-4.081188, 2, -6.297931, 1, -0.5, 0.5, 0.5,
-4.081188, 2, -6.297931, 1, 1.5, 0.5, 0.5,
-4.081188, 2, -6.297931, 0, 1.5, 0.5, 0.5,
-4.081188, 3, -6.297931, 0, -0.5, 0.5, 0.5,
-4.081188, 3, -6.297931, 1, -0.5, 0.5, 0.5,
-4.081188, 3, -6.297931, 1, 1.5, 0.5, 0.5,
-4.081188, 3, -6.297931, 0, 1.5, 0.5, 0.5
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
-3.596505, -3.594821, -4,
-3.596505, -3.594821, 4,
-3.596505, -3.594821, -4,
-3.758066, -3.766029, -4,
-3.596505, -3.594821, -2,
-3.758066, -3.766029, -2,
-3.596505, -3.594821, 0,
-3.758066, -3.766029, 0,
-3.596505, -3.594821, 2,
-3.758066, -3.766029, 2,
-3.596505, -3.594821, 4,
-3.758066, -3.766029, 4
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
-4.081188, -4.108445, -4, 0, -0.5, 0.5, 0.5,
-4.081188, -4.108445, -4, 1, -0.5, 0.5, 0.5,
-4.081188, -4.108445, -4, 1, 1.5, 0.5, 0.5,
-4.081188, -4.108445, -4, 0, 1.5, 0.5, 0.5,
-4.081188, -4.108445, -2, 0, -0.5, 0.5, 0.5,
-4.081188, -4.108445, -2, 1, -0.5, 0.5, 0.5,
-4.081188, -4.108445, -2, 1, 1.5, 0.5, 0.5,
-4.081188, -4.108445, -2, 0, 1.5, 0.5, 0.5,
-4.081188, -4.108445, 0, 0, -0.5, 0.5, 0.5,
-4.081188, -4.108445, 0, 1, -0.5, 0.5, 0.5,
-4.081188, -4.108445, 0, 1, 1.5, 0.5, 0.5,
-4.081188, -4.108445, 0, 0, 1.5, 0.5, 0.5,
-4.081188, -4.108445, 2, 0, -0.5, 0.5, 0.5,
-4.081188, -4.108445, 2, 1, -0.5, 0.5, 0.5,
-4.081188, -4.108445, 2, 1, 1.5, 0.5, 0.5,
-4.081188, -4.108445, 2, 0, 1.5, 0.5, 0.5,
-4.081188, -4.108445, 4, 0, -0.5, 0.5, 0.5,
-4.081188, -4.108445, 4, 1, -0.5, 0.5, 0.5,
-4.081188, -4.108445, 4, 1, 1.5, 0.5, 0.5,
-4.081188, -4.108445, 4, 0, 1.5, 0.5, 0.5
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
-3.596505, -3.594821, -5.442585,
-3.596505, 3.253505, -5.442585,
-3.596505, -3.594821, 5.962039,
-3.596505, 3.253505, 5.962039,
-3.596505, -3.594821, -5.442585,
-3.596505, -3.594821, 5.962039,
-3.596505, 3.253505, -5.442585,
-3.596505, 3.253505, 5.962039,
-3.596505, -3.594821, -5.442585,
2.865927, -3.594821, -5.442585,
-3.596505, -3.594821, 5.962039,
2.865927, -3.594821, 5.962039,
-3.596505, 3.253505, -5.442585,
2.865927, 3.253505, -5.442585,
-3.596505, 3.253505, 5.962039,
2.865927, 3.253505, 5.962039,
2.865927, -3.594821, -5.442585,
2.865927, 3.253505, -5.442585,
2.865927, -3.594821, 5.962039,
2.865927, 3.253505, 5.962039,
2.865927, -3.594821, -5.442585,
2.865927, -3.594821, 5.962039,
2.865927, 3.253505, -5.442585,
2.865927, 3.253505, 5.962039
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
var radius = 7.897283;
var distance = 35.1359;
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
mvMatrix.translate( 0.3652894, 0.1706581, -0.259727 );
mvMatrix.scale( 1.321282, 1.24683, 0.7487049 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.1359);
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
bupirimate<-read.table("bupirimate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bupirimate$V2
```

```
## Error in eval(expr, envir, enclos): object 'bupirimate' not found
```

```r
y<-bupirimate$V3
```

```
## Error in eval(expr, envir, enclos): object 'bupirimate' not found
```

```r
z<-bupirimate$V4
```

```
## Error in eval(expr, envir, enclos): object 'bupirimate' not found
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
-3.502392, 0.8383421, -1.981551, 0, 0, 1, 1, 1,
-2.987611, 0.583387, -3.323129, 1, 0, 0, 1, 1,
-2.825482, -0.07635763, -1.839928, 1, 0, 0, 1, 1,
-2.451198, -0.1281708, 0.6600314, 1, 0, 0, 1, 1,
-2.44844, 1.090907, -0.2157078, 1, 0, 0, 1, 1,
-2.435653, -0.3234379, -1.326191, 1, 0, 0, 1, 1,
-2.307151, 1.03653, -0.1334744, 0, 0, 0, 1, 1,
-2.257886, -2.030323, -1.758587, 0, 0, 0, 1, 1,
-2.152809, -0.7086027, -0.214775, 0, 0, 0, 1, 1,
-2.122006, 1.090423, -1.317964, 0, 0, 0, 1, 1,
-2.104403, 0.6239807, -0.5713045, 0, 0, 0, 1, 1,
-2.098067, 0.2428411, -0.5835737, 0, 0, 0, 1, 1,
-2.015941, -1.008384, -1.768468, 0, 0, 0, 1, 1,
-1.996028, 1.154735, -1.099843, 1, 1, 1, 1, 1,
-1.985058, -0.9638754, -1.019457, 1, 1, 1, 1, 1,
-1.952552, 0.8938512, -2.186637, 1, 1, 1, 1, 1,
-1.951606, 0.5584339, -3.401346, 1, 1, 1, 1, 1,
-1.940392, -0.04029785, -0.8207911, 1, 1, 1, 1, 1,
-1.93385, 0.01990708, 0.1762889, 1, 1, 1, 1, 1,
-1.92537, -0.6920464, -1.978985, 1, 1, 1, 1, 1,
-1.924094, 0.06768585, -2.118109, 1, 1, 1, 1, 1,
-1.923561, -1.053629, -3.028624, 1, 1, 1, 1, 1,
-1.920644, -0.5941852, -2.269111, 1, 1, 1, 1, 1,
-1.898405, 0.2989, -2.633427, 1, 1, 1, 1, 1,
-1.885766, -0.3878136, -1.600381, 1, 1, 1, 1, 1,
-1.88231, 1.014979, -0.1286531, 1, 1, 1, 1, 1,
-1.879615, -0.4243495, -1.81191, 1, 1, 1, 1, 1,
-1.857115, -1.870571, -2.573893, 1, 1, 1, 1, 1,
-1.828793, -1.744961, -2.635851, 0, 0, 1, 1, 1,
-1.824454, -0.4983365, -1.618024, 1, 0, 0, 1, 1,
-1.808636, 1.999853, -0.9768005, 1, 0, 0, 1, 1,
-1.808203, -0.6190704, -3.573342, 1, 0, 0, 1, 1,
-1.792591, -0.4520423, -1.509696, 1, 0, 0, 1, 1,
-1.78309, 0.01633583, -1.818576, 1, 0, 0, 1, 1,
-1.773275, 0.4203354, -1.597131, 0, 0, 0, 1, 1,
-1.757598, 0.7618675, -3.47439, 0, 0, 0, 1, 1,
-1.75617, -1.861547, -1.860648, 0, 0, 0, 1, 1,
-1.750178, -0.2809505, -2.756512, 0, 0, 0, 1, 1,
-1.740408, -1.035717, -1.637865, 0, 0, 0, 1, 1,
-1.736924, -0.6263412, 0.2531449, 0, 0, 0, 1, 1,
-1.734287, 0.6767752, -0.1594432, 0, 0, 0, 1, 1,
-1.703861, -0.06657416, -1.655098, 1, 1, 1, 1, 1,
-1.669024, 0.3893511, -2.670478, 1, 1, 1, 1, 1,
-1.666872, -1.75637, -2.271949, 1, 1, 1, 1, 1,
-1.661267, 0.2762421, -1.709834, 1, 1, 1, 1, 1,
-1.65563, 0.7454089, -2.513561, 1, 1, 1, 1, 1,
-1.650786, -0.9047646, -1.554864, 1, 1, 1, 1, 1,
-1.649003, -0.94025, -2.500486, 1, 1, 1, 1, 1,
-1.6368, -0.8435605, -1.553919, 1, 1, 1, 1, 1,
-1.62176, -0.0938513, -2.155914, 1, 1, 1, 1, 1,
-1.617921, -0.2559669, -1.206175, 1, 1, 1, 1, 1,
-1.615707, -1.836571, -2.354626, 1, 1, 1, 1, 1,
-1.602521, 0.584226, -2.261911, 1, 1, 1, 1, 1,
-1.595964, -0.638982, -2.523177, 1, 1, 1, 1, 1,
-1.58833, -1.136783, -3.494911, 1, 1, 1, 1, 1,
-1.584402, 0.01849111, -1.602573, 1, 1, 1, 1, 1,
-1.576341, 1.725445, -2.445923, 0, 0, 1, 1, 1,
-1.575956, -1.289018, -1.689076, 1, 0, 0, 1, 1,
-1.57516, 0.1474173, -1.791957, 1, 0, 0, 1, 1,
-1.560036, 0.8804334, -0.8083311, 1, 0, 0, 1, 1,
-1.547427, -0.4085515, -2.320377, 1, 0, 0, 1, 1,
-1.537778, 0.5188448, 0.9225709, 1, 0, 0, 1, 1,
-1.529797, 1.329814, -1.618177, 0, 0, 0, 1, 1,
-1.525221, -0.6295586, -1.741489, 0, 0, 0, 1, 1,
-1.521314, -0.06703211, -3.410278, 0, 0, 0, 1, 1,
-1.511491, -0.2196684, -1.88895, 0, 0, 0, 1, 1,
-1.469395, -1.166872, -2.026063, 0, 0, 0, 1, 1,
-1.46702, -0.4305375, -3.123939, 0, 0, 0, 1, 1,
-1.465693, -0.8222823, -2.101582, 0, 0, 0, 1, 1,
-1.460208, 1.211126, 0.3185346, 1, 1, 1, 1, 1,
-1.456397, -0.1662302, -2.326118, 1, 1, 1, 1, 1,
-1.449563, -1.531947, -2.904376, 1, 1, 1, 1, 1,
-1.446523, 0.4519292, -0.8766198, 1, 1, 1, 1, 1,
-1.445517, 0.9940838, -0.8832068, 1, 1, 1, 1, 1,
-1.442446, 0.2338226, -1.276004, 1, 1, 1, 1, 1,
-1.441684, 1.099483, -1.436973, 1, 1, 1, 1, 1,
-1.438756, 0.6151195, -0.2225638, 1, 1, 1, 1, 1,
-1.428833, -0.1732668, -2.265404, 1, 1, 1, 1, 1,
-1.427228, 0.7883486, -0.565008, 1, 1, 1, 1, 1,
-1.422309, 1.71159, -1.892207, 1, 1, 1, 1, 1,
-1.421754, -0.489579, -1.836273, 1, 1, 1, 1, 1,
-1.415434, -0.368439, -2.243496, 1, 1, 1, 1, 1,
-1.414361, -0.1161986, -3.618294, 1, 1, 1, 1, 1,
-1.401134, -0.2020924, -3.152028, 1, 1, 1, 1, 1,
-1.394278, 0.2586032, -1.83537, 0, 0, 1, 1, 1,
-1.384867, -0.0587569, -1.217448, 1, 0, 0, 1, 1,
-1.384081, -0.2085326, -1.691375, 1, 0, 0, 1, 1,
-1.379691, -0.5097389, -4.491209, 1, 0, 0, 1, 1,
-1.378166, 0.04894145, -1.014794, 1, 0, 0, 1, 1,
-1.373084, 0.1552248, -2.179724, 1, 0, 0, 1, 1,
-1.361112, 0.1249503, -2.247949, 0, 0, 0, 1, 1,
-1.335661, 0.1617871, -0.7074059, 0, 0, 0, 1, 1,
-1.325945, 0.4451169, -1.487389, 0, 0, 0, 1, 1,
-1.324927, 0.2905438, -1.581066, 0, 0, 0, 1, 1,
-1.322346, 0.3313428, -1.622961, 0, 0, 0, 1, 1,
-1.319766, -0.1628165, -2.348681, 0, 0, 0, 1, 1,
-1.316416, 1.201805, -0.4111259, 0, 0, 0, 1, 1,
-1.311813, -1.643918, -3.72706, 1, 1, 1, 1, 1,
-1.306403, -0.09825779, -1.793983, 1, 1, 1, 1, 1,
-1.30253, 0.1632223, -0.5112861, 1, 1, 1, 1, 1,
-1.300769, 3.13576, -1.410959, 1, 1, 1, 1, 1,
-1.299644, 0.8618973, -2.1415, 1, 1, 1, 1, 1,
-1.285287, 0.6528349, -0.9196758, 1, 1, 1, 1, 1,
-1.282637, -1.082025, -1.665126, 1, 1, 1, 1, 1,
-1.27012, 0.9541866, -2.146005, 1, 1, 1, 1, 1,
-1.26932, 0.9112269, 0.09095681, 1, 1, 1, 1, 1,
-1.266223, -0.4142164, -1.775404, 1, 1, 1, 1, 1,
-1.263251, 1.062865, -1.001998, 1, 1, 1, 1, 1,
-1.261406, -0.2280046, -3.022308, 1, 1, 1, 1, 1,
-1.260194, -0.2638309, -1.554311, 1, 1, 1, 1, 1,
-1.256717, -0.15067, -0.5401806, 1, 1, 1, 1, 1,
-1.254269, -0.8943527, -3.834929, 1, 1, 1, 1, 1,
-1.253717, -1.093262, -1.176422, 0, 0, 1, 1, 1,
-1.249628, 0.5454251, -3.293789, 1, 0, 0, 1, 1,
-1.2422, 0.571375, -1.468568, 1, 0, 0, 1, 1,
-1.241779, 1.581928, 0.01838374, 1, 0, 0, 1, 1,
-1.235192, -1.201914, -3.108834, 1, 0, 0, 1, 1,
-1.232191, 0.4129511, -1.32815, 1, 0, 0, 1, 1,
-1.220363, 1.559369, 0.3821171, 0, 0, 0, 1, 1,
-1.217893, 0.4477012, -2.25308, 0, 0, 0, 1, 1,
-1.214208, 1.684043, -1.757568, 0, 0, 0, 1, 1,
-1.212971, 0.6273375, 0.8506594, 0, 0, 0, 1, 1,
-1.212247, -0.8460731, -2.454204, 0, 0, 0, 1, 1,
-1.21074, 0.8270167, 1.358046, 0, 0, 0, 1, 1,
-1.208505, 0.7084467, -0.9573889, 0, 0, 0, 1, 1,
-1.202678, -0.2738105, -1.830223, 1, 1, 1, 1, 1,
-1.201313, 1.05488, -1.128495, 1, 1, 1, 1, 1,
-1.191882, 0.6454403, -1.272419, 1, 1, 1, 1, 1,
-1.167302, -1.522452, -1.089949, 1, 1, 1, 1, 1,
-1.150301, -0.2797594, -0.024383, 1, 1, 1, 1, 1,
-1.150175, 1.382428, -0.2513683, 1, 1, 1, 1, 1,
-1.148203, 0.09576102, -2.049417, 1, 1, 1, 1, 1,
-1.141266, -0.09152009, 0.5363422, 1, 1, 1, 1, 1,
-1.126821, -0.6220356, -1.6035, 1, 1, 1, 1, 1,
-1.126663, -2.19477, -1.169573, 1, 1, 1, 1, 1,
-1.126376, 0.3247283, -2.709329, 1, 1, 1, 1, 1,
-1.123413, 1.245926, 2.002059, 1, 1, 1, 1, 1,
-1.116045, -1.64701, -4.782175, 1, 1, 1, 1, 1,
-1.114779, 0.7406168, -2.5716, 1, 1, 1, 1, 1,
-1.098334, -0.06552236, -0.7647317, 1, 1, 1, 1, 1,
-1.096101, -1.801508, -4.349173, 0, 0, 1, 1, 1,
-1.088022, 0.4104405, -1.112826, 1, 0, 0, 1, 1,
-1.083813, -0.1120028, -2.972009, 1, 0, 0, 1, 1,
-1.080562, 0.6528968, 0.1332495, 1, 0, 0, 1, 1,
-1.077038, -0.4557866, -1.084765, 1, 0, 0, 1, 1,
-1.074937, 1.178278, -1.298456, 1, 0, 0, 1, 1,
-1.071477, 1.363365, 0.57544, 0, 0, 0, 1, 1,
-1.069753, 0.3641581, -1.667077, 0, 0, 0, 1, 1,
-1.067307, 1.729561, -0.8245754, 0, 0, 0, 1, 1,
-1.063983, -1.219168, -0.3304663, 0, 0, 0, 1, 1,
-1.063026, 0.8058263, -1.456491, 0, 0, 0, 1, 1,
-1.056715, 0.6321085, -0.7460443, 0, 0, 0, 1, 1,
-1.053867, 1.588187, -0.8144071, 0, 0, 0, 1, 1,
-1.049205, -1.32021, -2.185724, 1, 1, 1, 1, 1,
-1.047325, 0.7405484, 0.2551851, 1, 1, 1, 1, 1,
-1.036566, 0.07289682, -0.5057569, 1, 1, 1, 1, 1,
-1.027725, 1.02332, -0.6717494, 1, 1, 1, 1, 1,
-1.027639, 1.220304, -1.118901, 1, 1, 1, 1, 1,
-1.015859, 0.232959, -3.144088, 1, 1, 1, 1, 1,
-1.014836, 0.5266522, -1.893159, 1, 1, 1, 1, 1,
-1.011487, -1.097628, -1.358086, 1, 1, 1, 1, 1,
-1.011345, -1.204117, -2.819965, 1, 1, 1, 1, 1,
-1.009775, -0.9747961, -3.612436, 1, 1, 1, 1, 1,
-1.008641, 1.437282, -0.2652123, 1, 1, 1, 1, 1,
-1.006675, 1.49422, -1.322278, 1, 1, 1, 1, 1,
-0.9970913, -0.05913561, -1.267137, 1, 1, 1, 1, 1,
-0.9957176, -0.7163419, -0.6414257, 1, 1, 1, 1, 1,
-0.9930158, -0.4713808, -2.57985, 1, 1, 1, 1, 1,
-0.9896978, 0.2498361, -0.08942097, 0, 0, 1, 1, 1,
-0.9779669, -0.4182509, -2.744623, 1, 0, 0, 1, 1,
-0.9733255, -0.5516254, -1.253014, 1, 0, 0, 1, 1,
-0.9649191, -1.150594, -2.519192, 1, 0, 0, 1, 1,
-0.9640486, -0.3384361, 0.02875522, 1, 0, 0, 1, 1,
-0.9462258, -0.04359241, -0.2954844, 1, 0, 0, 1, 1,
-0.9459785, 2.318176, -2.535486, 0, 0, 0, 1, 1,
-0.9450159, 1.576111, -3.524171, 0, 0, 0, 1, 1,
-0.9420874, 1.479626, -0.5671806, 0, 0, 0, 1, 1,
-0.9406879, 0.6114454, -1.654127, 0, 0, 0, 1, 1,
-0.9348553, 0.9422393, -0.853626, 0, 0, 0, 1, 1,
-0.9333201, -2.262099, -3.109299, 0, 0, 0, 1, 1,
-0.9328648, -0.007386515, -0.5333052, 0, 0, 0, 1, 1,
-0.9279539, 0.9983157, -1.070798, 1, 1, 1, 1, 1,
-0.9275985, -0.6415717, -2.589703, 1, 1, 1, 1, 1,
-0.9247661, 0.7339026, -0.008262467, 1, 1, 1, 1, 1,
-0.9240631, -0.3551112, -3.036933, 1, 1, 1, 1, 1,
-0.9222257, 0.3599468, -1.022204, 1, 1, 1, 1, 1,
-0.9218754, -0.6740012, -1.819648, 1, 1, 1, 1, 1,
-0.9147464, -1.973151, -3.017738, 1, 1, 1, 1, 1,
-0.9127402, -1.342296, -3.48169, 1, 1, 1, 1, 1,
-0.911875, 0.571359, 0.2183001, 1, 1, 1, 1, 1,
-0.9114639, 0.2094665, -0.9923009, 1, 1, 1, 1, 1,
-0.903497, 1.317636, 0.8008745, 1, 1, 1, 1, 1,
-0.8997351, -1.303465, -1.926475, 1, 1, 1, 1, 1,
-0.8996661, -0.06924456, -1.993016, 1, 1, 1, 1, 1,
-0.8983246, 1.034214, -1.204372, 1, 1, 1, 1, 1,
-0.8963988, 1.284811, -0.5264238, 1, 1, 1, 1, 1,
-0.8959021, -1.70631, -3.431767, 0, 0, 1, 1, 1,
-0.8942417, -0.5196232, -2.346384, 1, 0, 0, 1, 1,
-0.8846171, 1.859885, -0.6354941, 1, 0, 0, 1, 1,
-0.8802925, -0.2475188, -2.845351, 1, 0, 0, 1, 1,
-0.8793383, -0.8931691, -1.630521, 1, 0, 0, 1, 1,
-0.8792044, 0.2840114, -3.276289, 1, 0, 0, 1, 1,
-0.8736444, 0.8541837, -1.825386, 0, 0, 0, 1, 1,
-0.8675991, -1.214076, -1.785334, 0, 0, 0, 1, 1,
-0.8558796, 1.860275, -0.05079585, 0, 0, 0, 1, 1,
-0.8523858, -0.6460587, -1.087771, 0, 0, 0, 1, 1,
-0.8492159, -1.17371, -2.501162, 0, 0, 0, 1, 1,
-0.8426236, 1.042943, -1.818936, 0, 0, 0, 1, 1,
-0.8419573, 1.013503, -0.6358743, 0, 0, 0, 1, 1,
-0.8352886, -0.4783449, -1.347523, 1, 1, 1, 1, 1,
-0.8338734, 2.017885, 0.5590209, 1, 1, 1, 1, 1,
-0.8299385, 3.350856e-05, -1.538975, 1, 1, 1, 1, 1,
-0.8268251, -0.02818508, -1.057935, 1, 1, 1, 1, 1,
-0.8241341, 0.789619, -1.023903, 1, 1, 1, 1, 1,
-0.8192945, -0.1040083, -1.303604, 1, 1, 1, 1, 1,
-0.8156948, -0.3654273, -1.771319, 1, 1, 1, 1, 1,
-0.8140632, -1.204815, -1.771866, 1, 1, 1, 1, 1,
-0.8102726, 0.4644729, -1.522076, 1, 1, 1, 1, 1,
-0.8062975, -1.79938, -3.610792, 1, 1, 1, 1, 1,
-0.7952669, 0.3400088, -2.033499, 1, 1, 1, 1, 1,
-0.7945675, 0.6681393, -1.078349, 1, 1, 1, 1, 1,
-0.7913805, 0.1098973, -3.147907, 1, 1, 1, 1, 1,
-0.7831372, -0.2852159, 0.4773601, 1, 1, 1, 1, 1,
-0.773242, 1.162167, -0.1555256, 1, 1, 1, 1, 1,
-0.7631925, -1.555013, -1.744708, 0, 0, 1, 1, 1,
-0.7629789, -0.00349046, -1.477146, 1, 0, 0, 1, 1,
-0.7599033, -0.5238366, -1.453072, 1, 0, 0, 1, 1,
-0.7519162, -1.266751, -2.208512, 1, 0, 0, 1, 1,
-0.7394508, -1.626112, -3.63021, 1, 0, 0, 1, 1,
-0.7346935, -0.6185814, -0.3526953, 1, 0, 0, 1, 1,
-0.7339387, 0.6231395, -0.1300672, 0, 0, 0, 1, 1,
-0.7320514, 1.20066, 0.0295271, 0, 0, 0, 1, 1,
-0.7312579, -0.6455154, -3.076241, 0, 0, 0, 1, 1,
-0.730512, -0.4400831, 0.09230801, 0, 0, 0, 1, 1,
-0.7273312, -1.295088, -3.916414, 0, 0, 0, 1, 1,
-0.7264671, 1.754489, -0.2504568, 0, 0, 0, 1, 1,
-0.7194076, -1.276956, -3.439266, 0, 0, 0, 1, 1,
-0.7173595, 1.741671, 0.2697765, 1, 1, 1, 1, 1,
-0.7149807, -0.9040322, -4.129799, 1, 1, 1, 1, 1,
-0.7108986, 0.2757115, -2.367143, 1, 1, 1, 1, 1,
-0.7101657, -0.4200945, -3.387501, 1, 1, 1, 1, 1,
-0.708597, -0.1295351, -1.512665, 1, 1, 1, 1, 1,
-0.6964104, -1.087648, -2.048175, 1, 1, 1, 1, 1,
-0.69091, 1.588176, 0.7326705, 1, 1, 1, 1, 1,
-0.6804259, 1.6699, -0.2666339, 1, 1, 1, 1, 1,
-0.6773292, 0.3150311, -0.6253769, 1, 1, 1, 1, 1,
-0.6765386, -1.074778, -2.608991, 1, 1, 1, 1, 1,
-0.6678702, -0.4187946, -3.641555, 1, 1, 1, 1, 1,
-0.6662009, -0.3196065, -1.636634, 1, 1, 1, 1, 1,
-0.6537539, -1.13693, -3.467223, 1, 1, 1, 1, 1,
-0.6514346, 0.3066946, -2.182961, 1, 1, 1, 1, 1,
-0.6506081, -0.8145832, -1.053436, 1, 1, 1, 1, 1,
-0.6464997, -0.4240538, -3.613072, 0, 0, 1, 1, 1,
-0.640803, 0.07075728, 0.9326122, 1, 0, 0, 1, 1,
-0.6378425, -2.2655, -4.849134, 1, 0, 0, 1, 1,
-0.6340971, -1.095188, -3.36036, 1, 0, 0, 1, 1,
-0.6337927, -0.9996294, -4.222086, 1, 0, 0, 1, 1,
-0.6300578, -0.02230292, -2.974119, 1, 0, 0, 1, 1,
-0.6236916, -1.221084, -2.957677, 0, 0, 0, 1, 1,
-0.6213662, -3.281616, -4.852361, 0, 0, 0, 1, 1,
-0.6178523, -2.649255, -3.169675, 0, 0, 0, 1, 1,
-0.6163811, -1.386917, -3.357894, 0, 0, 0, 1, 1,
-0.6149591, 0.8547311, -0.4968655, 0, 0, 0, 1, 1,
-0.6098434, 0.02180219, -2.476585, 0, 0, 0, 1, 1,
-0.6082639, 0.09933501, -0.8322798, 0, 0, 0, 1, 1,
-0.6065311, 0.5834631, -0.8516168, 1, 1, 1, 1, 1,
-0.603891, -0.6576077, -1.608324, 1, 1, 1, 1, 1,
-0.6011149, 1.47585, -0.7770194, 1, 1, 1, 1, 1,
-0.5962802, -0.1557806, -0.8112514, 1, 1, 1, 1, 1,
-0.5962402, -0.6401353, -3.215556, 1, 1, 1, 1, 1,
-0.5921447, -1.300139, -5.276498, 1, 1, 1, 1, 1,
-0.590929, -1.262886, -2.119278, 1, 1, 1, 1, 1,
-0.5893275, -0.7879204, -1.004053, 1, 1, 1, 1, 1,
-0.584842, 0.6428202, 0.2312512, 1, 1, 1, 1, 1,
-0.5828392, -0.2422135, -2.147888, 1, 1, 1, 1, 1,
-0.5717258, -1.972085, -3.763032, 1, 1, 1, 1, 1,
-0.5697741, 0.08079793, -1.853853, 1, 1, 1, 1, 1,
-0.5693954, -0.5903454, -0.7542782, 1, 1, 1, 1, 1,
-0.5619887, -1.941227, -3.403961, 1, 1, 1, 1, 1,
-0.5607441, 0.2357545, 0.07798427, 1, 1, 1, 1, 1,
-0.5588925, 0.7418498, -1.257632, 0, 0, 1, 1, 1,
-0.5543944, -0.610797, -1.276898, 1, 0, 0, 1, 1,
-0.5532485, 1.531428, 0.728802, 1, 0, 0, 1, 1,
-0.5501114, -2.886614, -4.083824, 1, 0, 0, 1, 1,
-0.5465332, -1.470928, -2.692136, 1, 0, 0, 1, 1,
-0.5375314, -0.4330527, -3.855102, 1, 0, 0, 1, 1,
-0.536068, -2.100309, -2.090407, 0, 0, 0, 1, 1,
-0.5325237, -0.7307005, -3.480865, 0, 0, 0, 1, 1,
-0.5296453, 0.2828408, -1.423198, 0, 0, 0, 1, 1,
-0.5219394, -0.1808122, -1.984309, 0, 0, 0, 1, 1,
-0.5210856, 0.7316691, -0.3210132, 0, 0, 0, 1, 1,
-0.5205091, -0.6634278, -1.614467, 0, 0, 0, 1, 1,
-0.5189425, -0.7669765, -2.185323, 0, 0, 0, 1, 1,
-0.5171422, 1.457924, -0.0345356, 1, 1, 1, 1, 1,
-0.5169581, -1.041706, -2.259508, 1, 1, 1, 1, 1,
-0.5121856, 1.873692, -0.5057108, 1, 1, 1, 1, 1,
-0.5051659, 0.1971378, -0.4744324, 1, 1, 1, 1, 1,
-0.5031666, 1.126881, -0.3142736, 1, 1, 1, 1, 1,
-0.5012922, -1.241958, -2.219706, 1, 1, 1, 1, 1,
-0.4979298, -0.6227662, -1.554028, 1, 1, 1, 1, 1,
-0.4918991, -1.397918, -3.414685, 1, 1, 1, 1, 1,
-0.4913149, -0.3053751, -2.17094, 1, 1, 1, 1, 1,
-0.4910736, 1.07327, -2.422315, 1, 1, 1, 1, 1,
-0.4902763, -1.652511, -1.129707, 1, 1, 1, 1, 1,
-0.4893793, -0.01554069, -1.134156, 1, 1, 1, 1, 1,
-0.4845161, -1.363691, -3.538867, 1, 1, 1, 1, 1,
-0.4837328, -0.6799738, -3.777883, 1, 1, 1, 1, 1,
-0.4833456, 0.02472066, -1.173037, 1, 1, 1, 1, 1,
-0.4781315, -0.04103347, -1.158479, 0, 0, 1, 1, 1,
-0.4771634, -0.4455509, -1.618036, 1, 0, 0, 1, 1,
-0.4765205, -0.07117195, -2.367092, 1, 0, 0, 1, 1,
-0.4719132, 0.3206766, -0.9578139, 1, 0, 0, 1, 1,
-0.4663562, 0.4629078, -0.2444527, 1, 0, 0, 1, 1,
-0.4599371, 1.807285, 0.4675699, 1, 0, 0, 1, 1,
-0.4567764, 1.230898, 0.6186062, 0, 0, 0, 1, 1,
-0.4559983, -0.4508752, -2.96985, 0, 0, 0, 1, 1,
-0.4556912, -0.5210462, -2.947319, 0, 0, 0, 1, 1,
-0.4492655, -0.5636849, -2.080228, 0, 0, 0, 1, 1,
-0.4412955, -0.1102626, -2.8672, 0, 0, 0, 1, 1,
-0.439839, -0.3030727, -3.277457, 0, 0, 0, 1, 1,
-0.4347079, 1.312635, -1.523157, 0, 0, 0, 1, 1,
-0.4323418, -0.2001546, -1.850466, 1, 1, 1, 1, 1,
-0.4272369, -0.3565663, -2.760084, 1, 1, 1, 1, 1,
-0.4235715, 0.5983422, -1.267511, 1, 1, 1, 1, 1,
-0.4223846, -0.307653, -3.429432, 1, 1, 1, 1, 1,
-0.4178239, 1.46154, -0.3810468, 1, 1, 1, 1, 1,
-0.4176273, 0.7207778, 0.5460751, 1, 1, 1, 1, 1,
-0.4171088, 0.08358365, -3.137381, 1, 1, 1, 1, 1,
-0.4149185, -1.332284, -3.0155, 1, 1, 1, 1, 1,
-0.4109713, -1.585577, -0.1895072, 1, 1, 1, 1, 1,
-0.4082856, 0.5239831, -1.309453, 1, 1, 1, 1, 1,
-0.4063063, -0.357223, -1.775427, 1, 1, 1, 1, 1,
-0.3974059, -0.4028573, -2.310864, 1, 1, 1, 1, 1,
-0.3968875, 1.119788, 0.2376716, 1, 1, 1, 1, 1,
-0.3956148, -0.6722664, -2.678623, 1, 1, 1, 1, 1,
-0.3934211, -1.567784, -1.107418, 1, 1, 1, 1, 1,
-0.3904803, -0.3570867, -2.855987, 0, 0, 1, 1, 1,
-0.3890265, 0.1640818, -0.6836659, 1, 0, 0, 1, 1,
-0.3864079, 0.1193256, -3.723854, 1, 0, 0, 1, 1,
-0.3820187, 0.3395712, -0.4226369, 1, 0, 0, 1, 1,
-0.3812138, -2.342164, -3.899095, 1, 0, 0, 1, 1,
-0.3811797, 0.7319514, 0.5102444, 1, 0, 0, 1, 1,
-0.3755174, -0.7835129, -1.094804, 0, 0, 0, 1, 1,
-0.3754061, -0.5869143, -3.455459, 0, 0, 0, 1, 1,
-0.3736354, 0.6680844, -1.612506, 0, 0, 0, 1, 1,
-0.3713129, 0.8359661, -0.6003262, 0, 0, 0, 1, 1,
-0.3667241, 0.6613593, 2.486052, 0, 0, 0, 1, 1,
-0.3639332, 1.321172, -1.079465, 0, 0, 0, 1, 1,
-0.3624553, 1.390441, -1.853932, 0, 0, 0, 1, 1,
-0.3616023, -0.02182245, -0.7956439, 1, 1, 1, 1, 1,
-0.3583265, -1.463401, -3.14661, 1, 1, 1, 1, 1,
-0.3574626, -1.649534, -4.181345, 1, 1, 1, 1, 1,
-0.3564676, 1.001783, 0.1712151, 1, 1, 1, 1, 1,
-0.3549635, -1.093913, -2.249161, 1, 1, 1, 1, 1,
-0.3542553, 0.1288209, 0.312291, 1, 1, 1, 1, 1,
-0.3497882, -1.128265, -3.279279, 1, 1, 1, 1, 1,
-0.3483399, -0.3740887, -1.664436, 1, 1, 1, 1, 1,
-0.3482986, -1.224128, -2.193671, 1, 1, 1, 1, 1,
-0.3435022, 0.4042642, -1.168034, 1, 1, 1, 1, 1,
-0.3404104, 1.493464, -0.4768032, 1, 1, 1, 1, 1,
-0.3400493, -0.85812, -3.926488, 1, 1, 1, 1, 1,
-0.3388503, -0.3092301, -2.918739, 1, 1, 1, 1, 1,
-0.3374276, -0.293255, -1.939465, 1, 1, 1, 1, 1,
-0.3331651, 0.7997009, -1.106748, 1, 1, 1, 1, 1,
-0.3330311, -1.440706, -1.071004, 0, 0, 1, 1, 1,
-0.3235869, 1.106362, -1.498479, 1, 0, 0, 1, 1,
-0.3234086, -1.475969, -3.240913, 1, 0, 0, 1, 1,
-0.3217479, 1.186998, -0.8441304, 1, 0, 0, 1, 1,
-0.3153965, 0.6390359, -1.648204, 1, 0, 0, 1, 1,
-0.3149374, -0.5818145, -0.1380706, 1, 0, 0, 1, 1,
-0.3047333, -0.5707739, -1.710507, 0, 0, 0, 1, 1,
-0.3038162, -1.815254, -4.195424, 0, 0, 0, 1, 1,
-0.2995825, -0.2752572, -2.694165, 0, 0, 0, 1, 1,
-0.2993528, -0.5600703, -0.2890078, 0, 0, 0, 1, 1,
-0.2974424, -0.6238918, -2.844305, 0, 0, 0, 1, 1,
-0.2959253, -1.573073, -2.944914, 0, 0, 0, 1, 1,
-0.2957273, 0.4901316, -0.8197604, 0, 0, 0, 1, 1,
-0.2906491, 0.02045402, -0.2133483, 1, 1, 1, 1, 1,
-0.2904059, -0.2775733, -1.233857, 1, 1, 1, 1, 1,
-0.2897319, -0.2519072, -2.318046, 1, 1, 1, 1, 1,
-0.2875757, -0.7303425, -1.861593, 1, 1, 1, 1, 1,
-0.2833984, 0.9785773, -0.7870456, 1, 1, 1, 1, 1,
-0.2830643, 1.137291, -1.439869, 1, 1, 1, 1, 1,
-0.2780817, 0.8772807, -0.1161505, 1, 1, 1, 1, 1,
-0.2771336, 0.8234408, -2.06425, 1, 1, 1, 1, 1,
-0.2720068, -1.680216, -1.672179, 1, 1, 1, 1, 1,
-0.2716601, 0.3958033, -1.207103, 1, 1, 1, 1, 1,
-0.2683327, 0.4249315, -0.1789548, 1, 1, 1, 1, 1,
-0.2670229, 1.069472, -0.07720205, 1, 1, 1, 1, 1,
-0.2575539, -0.6822609, -2.880551, 1, 1, 1, 1, 1,
-0.2566367, -0.2426959, -0.9818094, 1, 1, 1, 1, 1,
-0.256498, 0.2245707, -1.458136, 1, 1, 1, 1, 1,
-0.2500331, -1.481618, -4.288477, 0, 0, 1, 1, 1,
-0.2495225, -1.010664, -3.150236, 1, 0, 0, 1, 1,
-0.2437027, -0.1035562, -2.196814, 1, 0, 0, 1, 1,
-0.2423618, 0.6470739, -1.061323, 1, 0, 0, 1, 1,
-0.2336961, -1.601832, -3.808095, 1, 0, 0, 1, 1,
-0.232939, -1.856639, -3.656747, 1, 0, 0, 1, 1,
-0.2284739, -1.311962, -1.756894, 0, 0, 0, 1, 1,
-0.2281248, 0.757005, -0.7336793, 0, 0, 0, 1, 1,
-0.2271979, -0.8310599, -3.30617, 0, 0, 0, 1, 1,
-0.2205523, 0.0853458, -1.193898, 0, 0, 0, 1, 1,
-0.2204078, 0.6380051, 0.3424913, 0, 0, 0, 1, 1,
-0.2134741, 0.3389457, -1.02814, 0, 0, 0, 1, 1,
-0.2129494, 1.576794, 0.005127392, 0, 0, 0, 1, 1,
-0.2104975, 2.531802, -0.2359658, 1, 1, 1, 1, 1,
-0.2047441, 0.1434443, -2.772142, 1, 1, 1, 1, 1,
-0.202701, 0.1942895, -0.194331, 1, 1, 1, 1, 1,
-0.1996574, 1.120918, -0.7310489, 1, 1, 1, 1, 1,
-0.19743, -1.776879, -3.813249, 1, 1, 1, 1, 1,
-0.1963891, 1.251811, 0.7146136, 1, 1, 1, 1, 1,
-0.1950959, 0.623596, 1.936739, 1, 1, 1, 1, 1,
-0.1949436, 0.7959976, 0.5107188, 1, 1, 1, 1, 1,
-0.1811976, 0.4725509, 0.8423047, 1, 1, 1, 1, 1,
-0.1792863, 0.7556896, 1.325544, 1, 1, 1, 1, 1,
-0.1780252, 0.1764994, -0.3207533, 1, 1, 1, 1, 1,
-0.1776802, -0.6573198, -3.687665, 1, 1, 1, 1, 1,
-0.1752028, -2.563199, -3.428234, 1, 1, 1, 1, 1,
-0.1737027, -0.6759359, -2.260404, 1, 1, 1, 1, 1,
-0.1730725, 0.3224767, -0.3901717, 1, 1, 1, 1, 1,
-0.1728994, -1.090953, -2.165994, 0, 0, 1, 1, 1,
-0.1702146, -0.3703521, -2.615514, 1, 0, 0, 1, 1,
-0.1691888, 0.5416579, -0.3754689, 1, 0, 0, 1, 1,
-0.1684159, 1.430883, -1.635251, 1, 0, 0, 1, 1,
-0.1670288, -0.09198556, -2.223199, 1, 0, 0, 1, 1,
-0.1656398, 2.022951, -1.471562, 1, 0, 0, 1, 1,
-0.1597892, 1.694731, -1.212126, 0, 0, 0, 1, 1,
-0.1591631, 0.291475, -2.296579, 0, 0, 0, 1, 1,
-0.1565945, -0.7658877, -3.419124, 0, 0, 0, 1, 1,
-0.1537872, 1.186558, 1.042311, 0, 0, 0, 1, 1,
-0.1495967, -0.4813881, -2.76388, 0, 0, 0, 1, 1,
-0.1466755, -0.7720449, -3.033519, 0, 0, 0, 1, 1,
-0.1453458, 2.10205, -0.8346353, 0, 0, 0, 1, 1,
-0.1434398, -0.9489126, -3.160808, 1, 1, 1, 1, 1,
-0.1428074, -1.445319, -3.416575, 1, 1, 1, 1, 1,
-0.1388638, 0.3826261, 0.2306976, 1, 1, 1, 1, 1,
-0.1377117, -0.05512214, 0.003731088, 1, 1, 1, 1, 1,
-0.1354718, -0.6206264, -3.76343, 1, 1, 1, 1, 1,
-0.1327111, 1.031994, -0.2536049, 1, 1, 1, 1, 1,
-0.130609, -0.103921, -3.799114, 1, 1, 1, 1, 1,
-0.1304508, -1.79019, -2.32146, 1, 1, 1, 1, 1,
-0.1234897, 1.601318, 1.077425, 1, 1, 1, 1, 1,
-0.1216724, -0.6407707, -2.556793, 1, 1, 1, 1, 1,
-0.1166013, -1.532306, -3.072437, 1, 1, 1, 1, 1,
-0.1154086, -0.6497254, -2.815712, 1, 1, 1, 1, 1,
-0.1145303, 0.2163672, 0.7073399, 1, 1, 1, 1, 1,
-0.1064828, -0.72574, -2.380239, 1, 1, 1, 1, 1,
-0.1061412, -0.6663002, -0.684234, 1, 1, 1, 1, 1,
-0.103705, -0.1544437, -3.671443, 0, 0, 1, 1, 1,
-0.09517157, -0.3834824, -3.257863, 1, 0, 0, 1, 1,
-0.0947553, 0.4255136, -1.126182, 1, 0, 0, 1, 1,
-0.09466844, 0.2924156, -1.223955, 1, 0, 0, 1, 1,
-0.09409898, -0.02262527, -1.687889, 1, 0, 0, 1, 1,
-0.09108335, -0.7713953, -4.407763, 1, 0, 0, 1, 1,
-0.09095203, -1.384353, -3.885602, 0, 0, 0, 1, 1,
-0.08922755, 0.8154349, -0.07296448, 0, 0, 0, 1, 1,
-0.08891394, 0.4871408, -1.800572, 0, 0, 0, 1, 1,
-0.08308847, -1.639725, -1.83287, 0, 0, 0, 1, 1,
-0.07324284, 0.3070002, -0.6494945, 0, 0, 0, 1, 1,
-0.07053366, -1.037287, -4.374445, 0, 0, 0, 1, 1,
-0.06976403, 0.8068127, -0.4670258, 0, 0, 0, 1, 1,
-0.06733634, 0.09734407, 0.2833956, 1, 1, 1, 1, 1,
-0.06302118, -1.417873, -3.733558, 1, 1, 1, 1, 1,
-0.06034482, 1.080114, -0.6871077, 1, 1, 1, 1, 1,
-0.05570145, 0.6218082, -0.9344987, 1, 1, 1, 1, 1,
-0.0556042, -0.9304113, -3.835835, 1, 1, 1, 1, 1,
-0.05190317, -1.232881, -2.685991, 1, 1, 1, 1, 1,
-0.0510269, -2.015668, -2.848144, 1, 1, 1, 1, 1,
-0.05028308, -2.833416, -2.543317, 1, 1, 1, 1, 1,
-0.04685486, 0.7538474, -0.2132907, 1, 1, 1, 1, 1,
-0.04218351, -0.4610477, -2.566458, 1, 1, 1, 1, 1,
-0.04046595, -0.02107349, -2.457258, 1, 1, 1, 1, 1,
-0.03652138, 0.6574169, -2.110931, 1, 1, 1, 1, 1,
-0.03614671, 1.18047, 0.2855634, 1, 1, 1, 1, 1,
-0.0337685, 0.4707421, -0.2153018, 1, 1, 1, 1, 1,
-0.03299776, -0.6191534, -1.595448, 1, 1, 1, 1, 1,
-0.03238175, -0.8077233, -3.292004, 0, 0, 1, 1, 1,
-0.03122514, 0.3902947, 0.3783083, 1, 0, 0, 1, 1,
-0.03099084, 0.7303141, -1.192695, 1, 0, 0, 1, 1,
-0.02911295, 1.571555, -1.048124, 1, 0, 0, 1, 1,
-0.02573526, 1.589552, -1.398962, 1, 0, 0, 1, 1,
-0.01245609, -1.715453, -3.856303, 1, 0, 0, 1, 1,
-0.01117478, 0.3963475, -0.8414752, 0, 0, 0, 1, 1,
-0.009351157, -0.8806537, -2.643272, 0, 0, 0, 1, 1,
-0.008071771, -1.686705, -3.942388, 0, 0, 0, 1, 1,
-0.007331174, 0.3477406, -1.125752, 0, 0, 0, 1, 1,
-0.007193792, 0.9587538, -1.427113, 0, 0, 0, 1, 1,
-0.00450176, -0.07703415, -3.448931, 0, 0, 0, 1, 1,
-0.003783612, 0.7564449, -0.9457184, 0, 0, 0, 1, 1,
0.0006645027, -0.3172283, 3.568122, 1, 1, 1, 1, 1,
0.001815933, 1.533167, -0.2848202, 1, 1, 1, 1, 1,
0.00479147, -1.801683, 3.870061, 1, 1, 1, 1, 1,
0.00604279, -0.001612907, 2.552854, 1, 1, 1, 1, 1,
0.007036241, -0.02858268, 1.534392, 1, 1, 1, 1, 1,
0.00756907, 0.3475364, 0.8283638, 1, 1, 1, 1, 1,
0.007623961, -1.566666, 3.588823, 1, 1, 1, 1, 1,
0.009646592, -0.2189886, 3.948644, 1, 1, 1, 1, 1,
0.01123218, 0.8927755, 1.751496, 1, 1, 1, 1, 1,
0.01166841, -0.02202479, 4.084781, 1, 1, 1, 1, 1,
0.01463749, 1.001668, -0.1349838, 1, 1, 1, 1, 1,
0.02209019, 0.3079654, 1.519582, 1, 1, 1, 1, 1,
0.02301674, 0.741402, 1.146686, 1, 1, 1, 1, 1,
0.02423992, -0.26515, 3.52549, 1, 1, 1, 1, 1,
0.02463611, 0.8592736, -0.6264683, 1, 1, 1, 1, 1,
0.02693654, 1.5983, -0.2243361, 0, 0, 1, 1, 1,
0.02749667, -0.4847401, 4.207574, 1, 0, 0, 1, 1,
0.02926758, -0.5812606, 2.284214, 1, 0, 0, 1, 1,
0.03292818, 0.06719727, -0.7819703, 1, 0, 0, 1, 1,
0.04074679, 2.103466, -0.6074289, 1, 0, 0, 1, 1,
0.04290472, 1.510467, -0.4459879, 1, 0, 0, 1, 1,
0.0429905, -0.9504665, 3.143507, 0, 0, 0, 1, 1,
0.04417353, -0.07834474, 3.252464, 0, 0, 0, 1, 1,
0.04755406, -0.07374502, 3.669637, 0, 0, 0, 1, 1,
0.05169611, -0.009763514, 1.914362, 0, 0, 0, 1, 1,
0.05238703, 0.109332, 1.116046, 0, 0, 0, 1, 1,
0.05761222, -0.921609, 1.405132, 0, 0, 0, 1, 1,
0.05803603, 0.4048758, -0.344108, 0, 0, 0, 1, 1,
0.06035194, 0.06634329, 0.6411475, 1, 1, 1, 1, 1,
0.06432891, 1.372381, 1.136017, 1, 1, 1, 1, 1,
0.06496996, -0.06235424, 1.345702, 1, 1, 1, 1, 1,
0.06792275, -3.495088, 1.955182, 1, 1, 1, 1, 1,
0.07053152, -0.3635623, 2.83489, 1, 1, 1, 1, 1,
0.07072234, 0.7729628, -1.627363, 1, 1, 1, 1, 1,
0.07762191, -0.08640735, 1.889014, 1, 1, 1, 1, 1,
0.08110368, 0.4675129, -0.8689141, 1, 1, 1, 1, 1,
0.08115814, -0.6358579, 4.546773, 1, 1, 1, 1, 1,
0.08386497, -0.5338632, 3.329047, 1, 1, 1, 1, 1,
0.08390971, 0.3394215, 1.53953, 1, 1, 1, 1, 1,
0.08486199, -0.638834, 4.868598, 1, 1, 1, 1, 1,
0.08540884, -2.770766, 2.849746, 1, 1, 1, 1, 1,
0.08935781, 1.094226, 0.799934, 1, 1, 1, 1, 1,
0.0910581, 0.1587413, -1.026638, 1, 1, 1, 1, 1,
0.09132711, -0.7591832, 2.390862, 0, 0, 1, 1, 1,
0.09234715, 0.9135073, -1.474521, 1, 0, 0, 1, 1,
0.09291583, -1.708228, 2.841504, 1, 0, 0, 1, 1,
0.09337068, 0.2638371, 1.025906, 1, 0, 0, 1, 1,
0.0967152, -1.193398, 2.857835, 1, 0, 0, 1, 1,
0.1026719, -0.6381588, 3.071818, 1, 0, 0, 1, 1,
0.1054884, -0.4358909, 0.3834219, 0, 0, 0, 1, 1,
0.106012, 0.4202296, -0.1285415, 0, 0, 0, 1, 1,
0.1077276, -1.157786, 1.900161, 0, 0, 0, 1, 1,
0.1122046, 0.2295438, 0.0539281, 0, 0, 0, 1, 1,
0.1170937, -2.916601, 2.915044, 0, 0, 0, 1, 1,
0.1188467, -0.7003297, 4.864889, 0, 0, 0, 1, 1,
0.1189679, 1.624357, -1.804185, 0, 0, 0, 1, 1,
0.1214604, 1.685718, -1.035135, 1, 1, 1, 1, 1,
0.121669, -1.731732, 4.256993, 1, 1, 1, 1, 1,
0.1220892, 1.24767, -0.1375932, 1, 1, 1, 1, 1,
0.1249324, 0.4488823, 0.4050364, 1, 1, 1, 1, 1,
0.1266858, -0.135684, 4.229204, 1, 1, 1, 1, 1,
0.1279926, -0.2954077, 3.602381, 1, 1, 1, 1, 1,
0.1287724, -1.065002, 5.795952, 1, 1, 1, 1, 1,
0.1350527, -0.9654257, 3.270871, 1, 1, 1, 1, 1,
0.1393019, -0.8618751, 4.077107, 1, 1, 1, 1, 1,
0.139801, 1.709783, 0.08628248, 1, 1, 1, 1, 1,
0.1406908, 0.4280243, -1.218495, 1, 1, 1, 1, 1,
0.1408615, -2.089387, 3.585953, 1, 1, 1, 1, 1,
0.1418145, -1.681466, 3.193343, 1, 1, 1, 1, 1,
0.1421715, 0.6275464, 1.191159, 1, 1, 1, 1, 1,
0.1428901, -0.7518251, 4.606225, 1, 1, 1, 1, 1,
0.1437782, 0.9396402, -0.7029229, 0, 0, 1, 1, 1,
0.1444504, -0.8589158, 3.286658, 1, 0, 0, 1, 1,
0.1464058, -0.03008538, 0.6822054, 1, 0, 0, 1, 1,
0.1472798, 0.01525859, 2.147065, 1, 0, 0, 1, 1,
0.1510223, -0.1447053, 1.870587, 1, 0, 0, 1, 1,
0.1536482, 0.1641699, 2.130985, 1, 0, 0, 1, 1,
0.1568521, -0.8017017, 3.075396, 0, 0, 0, 1, 1,
0.1604661, -0.2543918, 1.871607, 0, 0, 0, 1, 1,
0.1607213, 1.896521, 0.5465823, 0, 0, 0, 1, 1,
0.1614968, -1.018713, 3.762534, 0, 0, 0, 1, 1,
0.1635994, -0.8063404, 1.810126, 0, 0, 0, 1, 1,
0.1718521, 0.5905204, 0.1249537, 0, 0, 0, 1, 1,
0.17286, 0.9677358, -0.6133685, 0, 0, 0, 1, 1,
0.1745704, -0.07451882, 2.434304, 1, 1, 1, 1, 1,
0.1765663, 0.3178887, 1.341113, 1, 1, 1, 1, 1,
0.1783035, -0.03629493, 2.694116, 1, 1, 1, 1, 1,
0.182687, -1.194669, 1.83016, 1, 1, 1, 1, 1,
0.1883454, -1.513376, 2.407631, 1, 1, 1, 1, 1,
0.1905588, -0.02983118, 0.219525, 1, 1, 1, 1, 1,
0.1931533, 1.913999, 0.1195541, 1, 1, 1, 1, 1,
0.1964106, 0.9645214, 1.258976, 1, 1, 1, 1, 1,
0.1981978, -0.2536432, 1.899881, 1, 1, 1, 1, 1,
0.1986694, 0.6781204, 1.569712, 1, 1, 1, 1, 1,
0.2004974, -1.819929, 4.56686, 1, 1, 1, 1, 1,
0.2007715, 0.2127649, 0.0555561, 1, 1, 1, 1, 1,
0.2027814, -0.3631223, 3.143021, 1, 1, 1, 1, 1,
0.2040652, 1.221778, 0.1083446, 1, 1, 1, 1, 1,
0.205274, 0.7952735, -0.7997349, 1, 1, 1, 1, 1,
0.2074812, 0.04503841, 0.6813464, 0, 0, 1, 1, 1,
0.2106424, -0.7582247, 1.976209, 1, 0, 0, 1, 1,
0.2113962, -0.4016137, 4.729561, 1, 0, 0, 1, 1,
0.2129552, -0.55955, 1.96012, 1, 0, 0, 1, 1,
0.2149691, 1.199314, 0.01393287, 1, 0, 0, 1, 1,
0.215051, 0.1280367, 0.7644914, 1, 0, 0, 1, 1,
0.2176294, -1.544456, 3.267495, 0, 0, 0, 1, 1,
0.2223465, -2.273639, 2.423869, 0, 0, 0, 1, 1,
0.2224455, 0.8852566, -0.1627783, 0, 0, 0, 1, 1,
0.2238873, 0.5776039, 0.9232123, 0, 0, 0, 1, 1,
0.2246359, 0.3220447, 1.492146, 0, 0, 0, 1, 1,
0.2301861, 0.8823112, 2.320146, 0, 0, 0, 1, 1,
0.2325296, 1.037333, -1.359864, 0, 0, 0, 1, 1,
0.2350636, -0.040341, 2.815032, 1, 1, 1, 1, 1,
0.238345, -0.5209323, 2.807617, 1, 1, 1, 1, 1,
0.2408524, 0.4146982, 1.524805, 1, 1, 1, 1, 1,
0.2427346, -0.75644, 2.50754, 1, 1, 1, 1, 1,
0.2437207, -0.09398105, 3.02047, 1, 1, 1, 1, 1,
0.244008, 0.3133975, 1.381586, 1, 1, 1, 1, 1,
0.2445126, 0.01467672, 1.336167, 1, 1, 1, 1, 1,
0.2479256, -1.104647, 4.003197, 1, 1, 1, 1, 1,
0.2546286, -0.8711025, 2.585371, 1, 1, 1, 1, 1,
0.256952, -0.0697208, 1.558076, 1, 1, 1, 1, 1,
0.2570453, -1.323091, 4.628416, 1, 1, 1, 1, 1,
0.2592971, 1.59363, 1.285279, 1, 1, 1, 1, 1,
0.260731, 0.1412318, 1.552446, 1, 1, 1, 1, 1,
0.2625985, 3.153772, -0.5026233, 1, 1, 1, 1, 1,
0.2630596, 0.7590761, 0.3832442, 1, 1, 1, 1, 1,
0.2635812, 1.322738, 0.1688607, 0, 0, 1, 1, 1,
0.2657209, 0.1542312, 0.9460852, 1, 0, 0, 1, 1,
0.2665828, 0.8060216, -1.279591, 1, 0, 0, 1, 1,
0.2718396, 0.1731268, 1.510739, 1, 0, 0, 1, 1,
0.2746903, 1.205474, 0.2209696, 1, 0, 0, 1, 1,
0.2769636, 0.9459089, 1.299365, 1, 0, 0, 1, 1,
0.2794617, -0.8074142, 4.199048, 0, 0, 0, 1, 1,
0.2818998, -0.4773975, 1.403008, 0, 0, 0, 1, 1,
0.283417, 2.322869, 0.8137404, 0, 0, 0, 1, 1,
0.2835228, 0.8009989, -0.0848818, 0, 0, 0, 1, 1,
0.2875126, -0.4909831, 2.736231, 0, 0, 0, 1, 1,
0.2889378, -0.6411672, 3.708476, 0, 0, 0, 1, 1,
0.2970589, -0.07407011, 2.115125, 0, 0, 0, 1, 1,
0.3019445, -1.633604, 2.975266, 1, 1, 1, 1, 1,
0.3075786, 0.6412522, -0.9567627, 1, 1, 1, 1, 1,
0.3107523, -0.6119578, 1.89724, 1, 1, 1, 1, 1,
0.3185814, -0.0609482, 2.020147, 1, 1, 1, 1, 1,
0.3194078, -0.5066579, 3.545783, 1, 1, 1, 1, 1,
0.3249395, 1.827634, 1.233137, 1, 1, 1, 1, 1,
0.3286455, 1.306941, 0.5635829, 1, 1, 1, 1, 1,
0.336393, 0.7791355, 0.2021075, 1, 1, 1, 1, 1,
0.3383195, -0.6014959, 3.52821, 1, 1, 1, 1, 1,
0.3463056, 0.5539958, -0.4006214, 1, 1, 1, 1, 1,
0.3521919, 0.4575701, -0.1080538, 1, 1, 1, 1, 1,
0.3548573, -0.1959372, 2.61714, 1, 1, 1, 1, 1,
0.3556867, -0.2052099, 1.993221, 1, 1, 1, 1, 1,
0.3590099, -0.106862, 1.209714, 1, 1, 1, 1, 1,
0.3599444, 0.1712609, 1.195073, 1, 1, 1, 1, 1,
0.3618988, 0.1699129, 2.087059, 0, 0, 1, 1, 1,
0.3626047, -1.477488, 2.010589, 1, 0, 0, 1, 1,
0.3679328, 1.548698, 1.244293, 1, 0, 0, 1, 1,
0.3697701, -0.3428951, 1.416717, 1, 0, 0, 1, 1,
0.3746953, 1.569011, 0.2373928, 1, 0, 0, 1, 1,
0.3756879, 0.1754531, -0.4977766, 1, 0, 0, 1, 1,
0.3804399, 0.2146805, 2.442605, 0, 0, 0, 1, 1,
0.3809429, -0.8205177, 1.68058, 0, 0, 0, 1, 1,
0.3831757, -0.9981852, 3.784686, 0, 0, 0, 1, 1,
0.3838403, -1.842492, 2.617109, 0, 0, 0, 1, 1,
0.3846388, 1.260401, -0.2399854, 0, 0, 0, 1, 1,
0.3888116, -0.09464509, 2.007329, 0, 0, 0, 1, 1,
0.4021112, 2.055323, 1.267643, 0, 0, 0, 1, 1,
0.404017, 0.2524555, 1.392956, 1, 1, 1, 1, 1,
0.4040858, -1.283788, 3.780586, 1, 1, 1, 1, 1,
0.4048241, -0.2012324, 1.078266, 1, 1, 1, 1, 1,
0.4050061, -1.112045, 0.9415968, 1, 1, 1, 1, 1,
0.4051145, -0.4207553, 3.898305, 1, 1, 1, 1, 1,
0.4067898, 0.2637051, 2.628371, 1, 1, 1, 1, 1,
0.4091186, 0.5634657, 1.474279, 1, 1, 1, 1, 1,
0.4132914, 1.142551, -0.4772597, 1, 1, 1, 1, 1,
0.4138709, -0.4940454, 2.832644, 1, 1, 1, 1, 1,
0.414967, 1.051396, -0.3959151, 1, 1, 1, 1, 1,
0.4208328, -0.6819146, 1.987229, 1, 1, 1, 1, 1,
0.4231405, 0.6156115, 1.255895, 1, 1, 1, 1, 1,
0.4296999, 0.5999373, 1.9985, 1, 1, 1, 1, 1,
0.4320649, -0.7159767, 3.687751, 1, 1, 1, 1, 1,
0.4324061, -0.8051341, 1.238363, 1, 1, 1, 1, 1,
0.435678, 1.117966, 0.9793748, 0, 0, 1, 1, 1,
0.4363785, -0.1424473, 0.4083834, 1, 0, 0, 1, 1,
0.4364778, -1.995769, 2.645822, 1, 0, 0, 1, 1,
0.4383949, 2.835209, 0.04482975, 1, 0, 0, 1, 1,
0.4408966, 1.711744, 0.9148039, 1, 0, 0, 1, 1,
0.4414833, -1.768819, 3.79989, 1, 0, 0, 1, 1,
0.4417454, -1.338685, 2.942808, 0, 0, 0, 1, 1,
0.4430506, -0.7051689, 4.51489, 0, 0, 0, 1, 1,
0.4477871, 1.459995, -1.522693, 0, 0, 0, 1, 1,
0.4540479, -0.7013406, 2.077171, 0, 0, 0, 1, 1,
0.4548146, -0.3848434, 2.024644, 0, 0, 0, 1, 1,
0.4597175, -0.07756911, 0.4700344, 0, 0, 0, 1, 1,
0.4637046, 2.114873, -0.8456084, 0, 0, 0, 1, 1,
0.4712112, 0.6089382, 1.65421, 1, 1, 1, 1, 1,
0.4727139, -1.511784, 3.354006, 1, 1, 1, 1, 1,
0.4771404, -0.3280166, 0.8952794, 1, 1, 1, 1, 1,
0.4831713, 0.6112183, 1.052947, 1, 1, 1, 1, 1,
0.4868938, 0.39125, 0.1879987, 1, 1, 1, 1, 1,
0.4908772, 1.324793, 0.8516102, 1, 1, 1, 1, 1,
0.4924824, -1.502159, 3.192052, 1, 1, 1, 1, 1,
0.4939544, -1.541907, 2.592792, 1, 1, 1, 1, 1,
0.4975807, -0.1708578, 1.361252, 1, 1, 1, 1, 1,
0.4986494, -0.2401532, 0.5662817, 1, 1, 1, 1, 1,
0.5012508, -1.158046, 4.244181, 1, 1, 1, 1, 1,
0.5182694, -1.514543, 1.808901, 1, 1, 1, 1, 1,
0.5207274, -0.9117397, 4.455112, 1, 1, 1, 1, 1,
0.5277122, -0.1611088, 2.424601, 1, 1, 1, 1, 1,
0.5340465, -1.54997, 1.96825, 1, 1, 1, 1, 1,
0.5393759, -0.1278016, 1.392977, 0, 0, 1, 1, 1,
0.5403768, 0.1177092, 1.205083, 1, 0, 0, 1, 1,
0.5407518, -0.5682827, 2.512557, 1, 0, 0, 1, 1,
0.5414439, 0.2991556, 0.5426092, 1, 0, 0, 1, 1,
0.5445736, 0.1387568, 0.7280144, 1, 0, 0, 1, 1,
0.5461237, 0.5478536, -1.236635, 1, 0, 0, 1, 1,
0.5470161, 0.8223003, 1.961989, 0, 0, 0, 1, 1,
0.547938, -0.1040017, 1.71091, 0, 0, 0, 1, 1,
0.5586466, -1.372227, 2.591995, 0, 0, 0, 1, 1,
0.564719, -0.4353559, 4.709907, 0, 0, 0, 1, 1,
0.5649668, 0.8271929, 0.01836927, 0, 0, 0, 1, 1,
0.5709025, 1.551333, 0.004112571, 0, 0, 0, 1, 1,
0.573128, 0.1270254, 1.326516, 0, 0, 0, 1, 1,
0.5746021, 1.126478, -0.6894906, 1, 1, 1, 1, 1,
0.5751289, 0.4978317, 0.6463308, 1, 1, 1, 1, 1,
0.5772856, 0.9920249, -0.8078874, 1, 1, 1, 1, 1,
0.5805869, -1.779926, 3.439368, 1, 1, 1, 1, 1,
0.5872124, -1.09531, 4.149601, 1, 1, 1, 1, 1,
0.589785, -0.08173513, 1.92866, 1, 1, 1, 1, 1,
0.5922925, -0.7228413, 3.379553, 1, 1, 1, 1, 1,
0.5963144, 0.3489555, -0.1059359, 1, 1, 1, 1, 1,
0.5969051, 0.3297639, -0.2547193, 1, 1, 1, 1, 1,
0.5996897, 1.854812, -1.14078, 1, 1, 1, 1, 1,
0.5998139, -0.08946435, 1.22933, 1, 1, 1, 1, 1,
0.6007989, -0.6930687, 2.738888, 1, 1, 1, 1, 1,
0.6038884, 0.56677, 1.109494, 1, 1, 1, 1, 1,
0.6048723, 0.4448339, 1.333291, 1, 1, 1, 1, 1,
0.6049812, 0.4735336, 1.405133, 1, 1, 1, 1, 1,
0.6132442, -0.1306249, 0.8903013, 0, 0, 1, 1, 1,
0.6140217, -1.12059, 3.201923, 1, 0, 0, 1, 1,
0.6152924, 0.145228, 1.92339, 1, 0, 0, 1, 1,
0.6213566, 0.3247738, 1.031885, 1, 0, 0, 1, 1,
0.6227615, -0.6680581, 1.874996, 1, 0, 0, 1, 1,
0.6231495, 0.9286003, -0.2559159, 1, 0, 0, 1, 1,
0.6341457, -0.1589008, 2.180274, 0, 0, 0, 1, 1,
0.6407817, -0.2371455, 0.8663449, 0, 0, 0, 1, 1,
0.6441538, -0.2315597, 3.44495, 0, 0, 0, 1, 1,
0.6456289, 0.36857, 1.796505, 0, 0, 0, 1, 1,
0.6530061, -0.4945233, 4.102526, 0, 0, 0, 1, 1,
0.6567847, -1.17297, 1.904162, 0, 0, 0, 1, 1,
0.6593038, -0.5650662, 2.036768, 0, 0, 0, 1, 1,
0.6627346, -0.1963162, 1.07296, 1, 1, 1, 1, 1,
0.6628596, -0.3251612, 2.271582, 1, 1, 1, 1, 1,
0.6645048, 0.1377996, 1.272441, 1, 1, 1, 1, 1,
0.6658472, 0.7708313, 0.2921342, 1, 1, 1, 1, 1,
0.6704118, 0.3491943, 3.296203, 1, 1, 1, 1, 1,
0.6747051, -0.4723866, 2.019805, 1, 1, 1, 1, 1,
0.675957, -0.1000803, 2.6489, 1, 1, 1, 1, 1,
0.6796372, -1.393191, 1.616472, 1, 1, 1, 1, 1,
0.6910131, -0.6882578, 3.598835, 1, 1, 1, 1, 1,
0.7000032, 0.5192649, 0.4757019, 1, 1, 1, 1, 1,
0.7001031, 0.3384568, 0.8360134, 1, 1, 1, 1, 1,
0.7005004, -0.5968282, 0.1822152, 1, 1, 1, 1, 1,
0.7128589, -0.1009526, 1.244269, 1, 1, 1, 1, 1,
0.7151668, -0.8872324, 1.887304, 1, 1, 1, 1, 1,
0.7154923, -1.349231, 1.400946, 1, 1, 1, 1, 1,
0.7183605, 1.891438, 1.392157, 0, 0, 1, 1, 1,
0.7184409, 0.05394936, 1.83866, 1, 0, 0, 1, 1,
0.7200017, 0.351725, 1.424312, 1, 0, 0, 1, 1,
0.7337567, -1.32357, 2.336226, 1, 0, 0, 1, 1,
0.7351146, -1.397132, 2.216608, 1, 0, 0, 1, 1,
0.7375348, -0.587137, 2.508099, 1, 0, 0, 1, 1,
0.73866, 2.619863, -0.3715252, 0, 0, 0, 1, 1,
0.7507825, 0.4250314, 2.404072, 0, 0, 0, 1, 1,
0.7545841, 0.1357661, 1.213471, 0, 0, 0, 1, 1,
0.7559936, 1.275858, 1.028992, 0, 0, 0, 1, 1,
0.7572369, 1.144895, -1.376398, 0, 0, 0, 1, 1,
0.7580119, -0.1976402, 3.254483, 0, 0, 0, 1, 1,
0.7627937, -1.473078, 2.855615, 0, 0, 0, 1, 1,
0.7673825, -0.3128891, 3.55425, 1, 1, 1, 1, 1,
0.7713364, 0.3191336, -0.2069723, 1, 1, 1, 1, 1,
0.7725509, -0.5683563, 2.125459, 1, 1, 1, 1, 1,
0.7781671, -0.1940904, 1.198501, 1, 1, 1, 1, 1,
0.7834887, 1.27513, -0.00737557, 1, 1, 1, 1, 1,
0.7854173, -0.1295487, 0.9838465, 1, 1, 1, 1, 1,
0.7864367, 0.5656565, 2.516341, 1, 1, 1, 1, 1,
0.7880141, -0.1348106, 0.2638352, 1, 1, 1, 1, 1,
0.7881309, 1.391511, 0.4955854, 1, 1, 1, 1, 1,
0.7882046, 1.134261, 0.2510992, 1, 1, 1, 1, 1,
0.7892759, -1.003239, 1.264605, 1, 1, 1, 1, 1,
0.7895373, -0.07964798, 2.300543, 1, 1, 1, 1, 1,
0.7929515, -0.3141354, 1.546264, 1, 1, 1, 1, 1,
0.8054662, 0.3929851, 1.669888, 1, 1, 1, 1, 1,
0.8073794, 0.226336, -0.5622198, 1, 1, 1, 1, 1,
0.809438, -0.8633271, 1.680802, 0, 0, 1, 1, 1,
0.8123091, 0.4330209, 0.008446123, 1, 0, 0, 1, 1,
0.8149436, 0.2835336, 2.209009, 1, 0, 0, 1, 1,
0.8336693, -0.248639, 3.259469, 1, 0, 0, 1, 1,
0.8352535, -0.7110483, 2.62394, 1, 0, 0, 1, 1,
0.8378536, -0.5450899, 2.017516, 1, 0, 0, 1, 1,
0.8397389, -0.1801011, 1.866269, 0, 0, 0, 1, 1,
0.8399665, -0.8869088, 3.119758, 0, 0, 0, 1, 1,
0.8416395, -1.467019, 3.816258, 0, 0, 0, 1, 1,
0.8445339, -0.3766392, 1.17138, 0, 0, 0, 1, 1,
0.8489023, 0.4407385, 0.4846262, 0, 0, 0, 1, 1,
0.8496853, 0.9430891, 0.3676427, 0, 0, 0, 1, 1,
0.85681, 0.95101, 1.430173, 0, 0, 0, 1, 1,
0.8580667, 0.6474788, 0.7055178, 1, 1, 1, 1, 1,
0.8599067, 0.675586, -1.333493, 1, 1, 1, 1, 1,
0.8644667, -1.155404, 2.100779, 1, 1, 1, 1, 1,
0.8674698, 0.1176358, 3.646323, 1, 1, 1, 1, 1,
0.8697734, 0.4402747, 1.134106, 1, 1, 1, 1, 1,
0.8727553, 0.7709357, 0.07377827, 1, 1, 1, 1, 1,
0.878446, -0.07065561, 1.137668, 1, 1, 1, 1, 1,
0.8812921, -0.4269589, 2.26927, 1, 1, 1, 1, 1,
0.883028, 0.8435869, 2.046358, 1, 1, 1, 1, 1,
0.9006894, 0.7642638, 0.2656159, 1, 1, 1, 1, 1,
0.9023672, 1.028354, 0.3937938, 1, 1, 1, 1, 1,
0.9048064, 1.397857, 0.2509788, 1, 1, 1, 1, 1,
0.9078922, -1.040871, 4.16124, 1, 1, 1, 1, 1,
0.9097597, 0.7772217, -0.5099666, 1, 1, 1, 1, 1,
0.9104201, 0.6355789, 0.9555639, 1, 1, 1, 1, 1,
0.9208834, -1.152552, 2.85694, 0, 0, 1, 1, 1,
0.9306747, 0.2554246, 0.494768, 1, 0, 0, 1, 1,
0.9388745, -0.3840508, 2.467708, 1, 0, 0, 1, 1,
0.9392981, 0.8004363, 0.9179797, 1, 0, 0, 1, 1,
0.9402928, 1.433016, 1.365917, 1, 0, 0, 1, 1,
0.9514892, 0.7854367, 1.375386, 1, 0, 0, 1, 1,
0.9538334, 0.4358164, 0.7388334, 0, 0, 0, 1, 1,
0.9541038, -0.9780614, 1.670858, 0, 0, 0, 1, 1,
0.9586837, 1.459635, 1.921886, 0, 0, 0, 1, 1,
0.9604791, 1.597884, 0.647218, 0, 0, 0, 1, 1,
0.960636, 0.4527934, -0.0003760676, 0, 0, 0, 1, 1,
0.9627967, 0.9577461, 1.09171, 0, 0, 0, 1, 1,
0.9724725, -1.604781, 3.98177, 0, 0, 0, 1, 1,
0.9751862, 0.8763604, 0.956651, 1, 1, 1, 1, 1,
0.9876376, -0.3951842, -0.03843859, 1, 1, 1, 1, 1,
0.9909139, -0.08906934, 1.430046, 1, 1, 1, 1, 1,
0.9976091, 0.3151241, 1.869749, 1, 1, 1, 1, 1,
0.9994032, 0.6709297, 0.7707362, 1, 1, 1, 1, 1,
1.002126, 1.275218, -0.9611396, 1, 1, 1, 1, 1,
1.00876, 0.05716645, 1.426796, 1, 1, 1, 1, 1,
1.009684, -1.295615, 3.422866, 1, 1, 1, 1, 1,
1.013872, 1.103014, 0.932184, 1, 1, 1, 1, 1,
1.019841, 0.8768256, -0.2527112, 1, 1, 1, 1, 1,
1.022877, -0.111182, 1.94148, 1, 1, 1, 1, 1,
1.023215, -2.073935, 0.8084605, 1, 1, 1, 1, 1,
1.023387, 0.6542563, 0.1378784, 1, 1, 1, 1, 1,
1.032137, 0.2645276, 2.235851, 1, 1, 1, 1, 1,
1.035537, -1.172169, 2.744748, 1, 1, 1, 1, 1,
1.039902, 0.2648611, 1.280176, 0, 0, 1, 1, 1,
1.044461, 0.34802, 2.309529, 1, 0, 0, 1, 1,
1.054877, -1.785223, 4.017902, 1, 0, 0, 1, 1,
1.058796, -0.3967791, 1.843953, 1, 0, 0, 1, 1,
1.076113, 0.09157075, 0.9028655, 1, 0, 0, 1, 1,
1.078251, -0.7935731, 1.513374, 1, 0, 0, 1, 1,
1.08237, -0.07138234, 1.016415, 0, 0, 0, 1, 1,
1.082459, -0.1832587, 1.54667, 0, 0, 0, 1, 1,
1.088454, -0.5591866, 2.542283, 0, 0, 0, 1, 1,
1.088926, -0.8250033, 1.036183, 0, 0, 0, 1, 1,
1.092048, -1.413578, 3.000184, 0, 0, 0, 1, 1,
1.095342, -0.3249575, 0.4492233, 0, 0, 0, 1, 1,
1.108745, 1.343734, -0.8440405, 0, 0, 0, 1, 1,
1.111989, -0.9605615, 3.248555, 1, 1, 1, 1, 1,
1.115903, 1.293594, 0.3438288, 1, 1, 1, 1, 1,
1.116606, -0.3541895, 1.781464, 1, 1, 1, 1, 1,
1.116611, 0.7310078, 0.3330504, 1, 1, 1, 1, 1,
1.118403, 0.4519727, 1.103986, 1, 1, 1, 1, 1,
1.1253, 0.5436021, 0.3121479, 1, 1, 1, 1, 1,
1.128822, 1.744191, 1.114888, 1, 1, 1, 1, 1,
1.129706, 0.09779491, 1.465173, 1, 1, 1, 1, 1,
1.132262, -0.2327865, 0.6653643, 1, 1, 1, 1, 1,
1.13505, -1.40961, 3.046947, 1, 1, 1, 1, 1,
1.136129, 0.7443963, 2.232901, 1, 1, 1, 1, 1,
1.144422, 1.025643, 0.7637706, 1, 1, 1, 1, 1,
1.148748, 0.5734847, 2.170897, 1, 1, 1, 1, 1,
1.151315, 1.468579, 0.5720068, 1, 1, 1, 1, 1,
1.152853, -0.6031788, 1.121451, 1, 1, 1, 1, 1,
1.160894, 0.2433271, 0.2303135, 0, 0, 1, 1, 1,
1.161192, -0.1530534, 0.5413645, 1, 0, 0, 1, 1,
1.161416, -0.6967226, 1.794444, 1, 0, 0, 1, 1,
1.164362, -1.619991, 2.650311, 1, 0, 0, 1, 1,
1.166596, 0.7700475, 1.23948, 1, 0, 0, 1, 1,
1.171635, -0.1966315, 1.125434, 1, 0, 0, 1, 1,
1.175372, 0.1494487, 1.669611, 0, 0, 0, 1, 1,
1.19337, -0.4253645, 1.91164, 0, 0, 0, 1, 1,
1.203461, 0.7949891, -0.1506628, 0, 0, 0, 1, 1,
1.210781, 1.673305, 2.240697, 0, 0, 0, 1, 1,
1.21254, -0.4056238, 1.915376, 0, 0, 0, 1, 1,
1.219578, 1.948816, 0.5482301, 0, 0, 0, 1, 1,
1.221053, 0.757769, 2.209601, 0, 0, 0, 1, 1,
1.222973, 1.495252, -2.841958, 1, 1, 1, 1, 1,
1.228064, 0.2448674, 1.421615, 1, 1, 1, 1, 1,
1.230509, -0.6534665, 1.531419, 1, 1, 1, 1, 1,
1.230688, 0.8000232, 1.285193, 1, 1, 1, 1, 1,
1.233793, 0.8726069, 0.2052112, 1, 1, 1, 1, 1,
1.24188, -0.1824612, 0.9239116, 1, 1, 1, 1, 1,
1.250576, 0.7764446, 1.298492, 1, 1, 1, 1, 1,
1.261448, -0.01799577, 2.42729, 1, 1, 1, 1, 1,
1.270454, -0.6540065, 2.404347, 1, 1, 1, 1, 1,
1.272231, 0.1059513, 0.1632379, 1, 1, 1, 1, 1,
1.273666, -0.9216557, 2.985377, 1, 1, 1, 1, 1,
1.283482, 0.9931715, 0.05388699, 1, 1, 1, 1, 1,
1.288041, 0.1912799, 1.619241, 1, 1, 1, 1, 1,
1.292663, 0.3991862, 1.392417, 1, 1, 1, 1, 1,
1.296713, 1.242826, 2.58226, 1, 1, 1, 1, 1,
1.298839, 2.481832, 0.2320591, 0, 0, 1, 1, 1,
1.299117, -2.012938, 1.061851, 1, 0, 0, 1, 1,
1.32009, -0.6834069, 2.465525, 1, 0, 0, 1, 1,
1.320148, 2.074715, 1.387813, 1, 0, 0, 1, 1,
1.322804, 0.8559049, 0.8377263, 1, 0, 0, 1, 1,
1.327223, -0.2062345, 2.829445, 1, 0, 0, 1, 1,
1.328468, 1.996956, 1.087928, 0, 0, 0, 1, 1,
1.33087, -0.5514932, 0.8682641, 0, 0, 0, 1, 1,
1.332345, 0.01223992, 2.133046, 0, 0, 0, 1, 1,
1.334158, 1.192906, 1.84534, 0, 0, 0, 1, 1,
1.337106, -0.6429573, 1.965434, 0, 0, 0, 1, 1,
1.338842, 0.2922932, 1.244068, 0, 0, 0, 1, 1,
1.33991, 1.28957, 1.298591, 0, 0, 0, 1, 1,
1.341086, 0.7854971, 0.99898, 1, 1, 1, 1, 1,
1.354038, -1.661006, 3.59481, 1, 1, 1, 1, 1,
1.359244, 1.739409, 2.035589, 1, 1, 1, 1, 1,
1.373818, 0.6065339, 2.256412, 1, 1, 1, 1, 1,
1.382506, 0.3087409, 2.962622, 1, 1, 1, 1, 1,
1.388021, 0.6349155, 2.313257, 1, 1, 1, 1, 1,
1.395632, -0.1504494, 1.375727, 1, 1, 1, 1, 1,
1.396246, -0.6539074, 3.135629, 1, 1, 1, 1, 1,
1.409254, -0.7670888, 2.382757, 1, 1, 1, 1, 1,
1.417422, 0.2369209, 2.110177, 1, 1, 1, 1, 1,
1.429169, -0.8939426, 2.884685, 1, 1, 1, 1, 1,
1.429189, 0.1465344, 0.7094066, 1, 1, 1, 1, 1,
1.435761, -1.173417, 3.165902, 1, 1, 1, 1, 1,
1.436397, 1.186985, 0.7696832, 1, 1, 1, 1, 1,
1.438059, -0.7278108, 1.742347, 1, 1, 1, 1, 1,
1.439361, 1.480879, 0.4002317, 0, 0, 1, 1, 1,
1.442767, -0.1249327, 2.937818, 1, 0, 0, 1, 1,
1.450638, -0.210278, 1.954215, 1, 0, 0, 1, 1,
1.463809, -0.1798373, 1.761926, 1, 0, 0, 1, 1,
1.465124, 0.747032, 0.03930455, 1, 0, 0, 1, 1,
1.473735, -0.4674414, 3.460681, 1, 0, 0, 1, 1,
1.505314, -0.6195083, 2.426411, 0, 0, 0, 1, 1,
1.513646, -0.003773171, 1.496404, 0, 0, 0, 1, 1,
1.518732, 0.5392643, 0.5831347, 0, 0, 0, 1, 1,
1.524219, -0.2049072, 3.127761, 0, 0, 0, 1, 1,
1.526348, -0.8101934, 1.60271, 0, 0, 0, 1, 1,
1.52914, 0.3059785, 2.038546, 0, 0, 0, 1, 1,
1.54697, -0.7631483, 1.72095, 0, 0, 0, 1, 1,
1.556204, 0.08551652, 1.023486, 1, 1, 1, 1, 1,
1.558133, 0.8423619, 1.657012, 1, 1, 1, 1, 1,
1.569941, -0.6738986, 0.711409, 1, 1, 1, 1, 1,
1.582674, -0.8685808, 2.776873, 1, 1, 1, 1, 1,
1.597383, 1.079123, 2.148024, 1, 1, 1, 1, 1,
1.607057, -0.06483082, 1.304709, 1, 1, 1, 1, 1,
1.616122, 0.03053322, 2.235569, 1, 1, 1, 1, 1,
1.61738, -2.101119, 0.6014206, 1, 1, 1, 1, 1,
1.617886, 0.6046996, 1.931873, 1, 1, 1, 1, 1,
1.623529, -1.238839, 1.777875, 1, 1, 1, 1, 1,
1.625705, -1.39844, 1.968229, 1, 1, 1, 1, 1,
1.638394, -1.736086, 1.974851, 1, 1, 1, 1, 1,
1.644936, -0.2478613, 1.165854, 1, 1, 1, 1, 1,
1.652531, 0.8999804, 0.9221981, 1, 1, 1, 1, 1,
1.660447, -0.4100427, 1.432924, 1, 1, 1, 1, 1,
1.672961, 2.201011, -0.817163, 0, 0, 1, 1, 1,
1.678355, 2.066344, 1.387471, 1, 0, 0, 1, 1,
1.67888, 1.065924, 0.8818939, 1, 0, 0, 1, 1,
1.682076, -1.022849, 2.852229, 1, 0, 0, 1, 1,
1.68595, 0.1329776, 1.801293, 1, 0, 0, 1, 1,
1.699747, -1.23738, 1.479293, 1, 0, 0, 1, 1,
1.700964, -0.6821802, 1.749552, 0, 0, 0, 1, 1,
1.708325, -0.321816, 1.228416, 0, 0, 0, 1, 1,
1.712704, -0.77917, 1.459989, 0, 0, 0, 1, 1,
1.728141, -1.243402, 1.36492, 0, 0, 0, 1, 1,
1.749526, -0.08449827, 0.1981785, 0, 0, 0, 1, 1,
1.752662, -1.957193, 0.9991519, 0, 0, 0, 1, 1,
1.773161, 0.2681994, 2.405126, 0, 0, 0, 1, 1,
1.780779, 0.3634855, 0.05030455, 1, 1, 1, 1, 1,
1.782271, -0.6317847, 4.35085, 1, 1, 1, 1, 1,
1.798915, -1.247309, 3.07958, 1, 1, 1, 1, 1,
1.810898, -1.227507, 1.589132, 1, 1, 1, 1, 1,
1.822221, -0.3349477, 2.843444, 1, 1, 1, 1, 1,
1.870408, 0.7262704, 1.046741, 1, 1, 1, 1, 1,
1.892096, -0.09870458, 2.250424, 1, 1, 1, 1, 1,
1.896172, 0.6424267, 0.6217337, 1, 1, 1, 1, 1,
1.913164, 0.3597527, 1.86377, 1, 1, 1, 1, 1,
1.919318, 2.484305, 0.7786264, 1, 1, 1, 1, 1,
1.932893, 0.8252586, 3.128299, 1, 1, 1, 1, 1,
2.006694, 3.055681, 2.362925, 1, 1, 1, 1, 1,
2.01717, -0.8943917, 1.392577, 1, 1, 1, 1, 1,
2.02928, -0.7387114, 3.774384, 1, 1, 1, 1, 1,
2.02934, -0.03373303, 2.220542, 1, 1, 1, 1, 1,
2.053342, 1.645424, 0.6801624, 0, 0, 1, 1, 1,
2.125813, -0.1219841, 1.164948, 1, 0, 0, 1, 1,
2.15334, -0.1459362, 2.954337, 1, 0, 0, 1, 1,
2.167796, -0.8270386, 1.451936, 1, 0, 0, 1, 1,
2.180571, -0.4212139, 4.876149, 1, 0, 0, 1, 1,
2.182368, -0.6332062, 0.572851, 1, 0, 0, 1, 1,
2.204757, -0.5297917, 0.8236952, 0, 0, 0, 1, 1,
2.22388, 1.983891, 1.015758, 0, 0, 0, 1, 1,
2.237713, 1.498219, 1.852761, 0, 0, 0, 1, 1,
2.308158, 1.377991, 1.519086, 0, 0, 0, 1, 1,
2.325881, -1.501248, 1.530544, 0, 0, 0, 1, 1,
2.417606, 0.9083796, 2.343989, 0, 0, 0, 1, 1,
2.432924, -0.1712484, 0.4051309, 0, 0, 0, 1, 1,
2.436339, 0.6586916, -0.6223503, 1, 1, 1, 1, 1,
2.469713, 0.2405868, 1.327067, 1, 1, 1, 1, 1,
2.483674, -0.7888394, 1.940585, 1, 1, 1, 1, 1,
2.523466, -0.2821467, 0.242012, 1, 1, 1, 1, 1,
2.538069, 1.868697, 2.049216, 1, 1, 1, 1, 1,
2.653678, 0.2252896, -0.7893894, 1, 1, 1, 1, 1,
2.771813, 0.1054354, 4.130689, 1, 1, 1, 1, 1
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
var radius = 9.748417;
var distance = 34.2409;
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
mvMatrix.translate( 0.3652894, 0.1706581, -0.259727 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2409);
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
