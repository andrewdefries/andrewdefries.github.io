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
-3.179885, 2.569483, 0.03576896, 1, 0, 0, 1,
-3.086112, 0.1814694, -2.557444, 1, 0.007843138, 0, 1,
-3.045274, -0.5035908, -2.225467, 1, 0.01176471, 0, 1,
-2.941793, -0.9487005, -2.347166, 1, 0.01960784, 0, 1,
-2.737034, 0.3737825, -1.640399, 1, 0.02352941, 0, 1,
-2.723366, -1.512585, -1.823543, 1, 0.03137255, 0, 1,
-2.689206, -1.27122, -0.9565644, 1, 0.03529412, 0, 1,
-2.646744, -0.1017924, -1.836302, 1, 0.04313726, 0, 1,
-2.556925, 0.6676376, 0.02890453, 1, 0.04705882, 0, 1,
-2.543242, 0.9711245, -1.26603, 1, 0.05490196, 0, 1,
-2.525985, -0.5030003, -2.870294, 1, 0.05882353, 0, 1,
-2.437902, -0.4834813, -1.149336, 1, 0.06666667, 0, 1,
-2.364022, 0.643097, -0.9916281, 1, 0.07058824, 0, 1,
-2.330302, 1.221945, -1.831486, 1, 0.07843138, 0, 1,
-2.218297, -1.561269, -2.476123, 1, 0.08235294, 0, 1,
-2.207494, -0.7835906, -2.637671, 1, 0.09019608, 0, 1,
-2.150485, 0.4328875, -0.5140046, 1, 0.09411765, 0, 1,
-2.135669, -3.18602, -2.98578, 1, 0.1019608, 0, 1,
-2.0898, 2.153606, -1.012119, 1, 0.1098039, 0, 1,
-2.087642, 0.7873346, -1.738757, 1, 0.1137255, 0, 1,
-2.087128, 0.7013978, -1.295439, 1, 0.1215686, 0, 1,
-2.081149, -0.9214705, -0.6935868, 1, 0.1254902, 0, 1,
-2.042323, 1.107117, -2.123032, 1, 0.1333333, 0, 1,
-2.035489, 0.1368585, -3.489509, 1, 0.1372549, 0, 1,
-2.027929, -1.106479, -1.77798, 1, 0.145098, 0, 1,
-1.992796, 0.1987394, -1.438175, 1, 0.1490196, 0, 1,
-1.988813, -0.7138416, -0.006772047, 1, 0.1568628, 0, 1,
-1.977471, 0.3550697, -1.446628, 1, 0.1607843, 0, 1,
-1.944758, -0.2530796, -2.312603, 1, 0.1686275, 0, 1,
-1.921225, 0.190542, -1.864338, 1, 0.172549, 0, 1,
-1.91424, 0.446454, -2.399676, 1, 0.1803922, 0, 1,
-1.8907, 0.9910712, -1.012677, 1, 0.1843137, 0, 1,
-1.890396, 0.4102165, -1.237676, 1, 0.1921569, 0, 1,
-1.870005, -1.88171, -2.312982, 1, 0.1960784, 0, 1,
-1.861327, -1.229315, -2.987156, 1, 0.2039216, 0, 1,
-1.843459, 2.23819, 0.2538355, 1, 0.2117647, 0, 1,
-1.817906, 1.027661, -0.7296653, 1, 0.2156863, 0, 1,
-1.809066, 0.8617192, 0.1256741, 1, 0.2235294, 0, 1,
-1.807408, -0.3320499, -1.348788, 1, 0.227451, 0, 1,
-1.784855, 1.1327, -1.114664, 1, 0.2352941, 0, 1,
-1.767977, -0.7512857, -3.14336, 1, 0.2392157, 0, 1,
-1.740707, -1.252552, -1.779636, 1, 0.2470588, 0, 1,
-1.740321, 0.3195188, -1.066239, 1, 0.2509804, 0, 1,
-1.706173, 0.3433914, -1.184907, 1, 0.2588235, 0, 1,
-1.697658, 0.4844517, -1.229378, 1, 0.2627451, 0, 1,
-1.686793, 1.514, -0.7991054, 1, 0.2705882, 0, 1,
-1.666939, -0.4870482, -1.724517, 1, 0.2745098, 0, 1,
-1.664617, -0.4892763, -0.8888958, 1, 0.282353, 0, 1,
-1.658255, 0.205421, -2.373295, 1, 0.2862745, 0, 1,
-1.644109, 0.7124068, 1.300048, 1, 0.2941177, 0, 1,
-1.638686, 0.5611448, -2.410532, 1, 0.3019608, 0, 1,
-1.615225, -0.6623225, -3.023919, 1, 0.3058824, 0, 1,
-1.612608, 0.1834601, -1.084037, 1, 0.3137255, 0, 1,
-1.583386, -0.6460613, -1.235954, 1, 0.3176471, 0, 1,
-1.580789, 0.0164133, -1.314312, 1, 0.3254902, 0, 1,
-1.577775, -1.468017, -1.3289, 1, 0.3294118, 0, 1,
-1.577373, -0.2620543, -2.270797, 1, 0.3372549, 0, 1,
-1.572811, -0.9968185, -2.314717, 1, 0.3411765, 0, 1,
-1.571105, 0.796333, -0.8459235, 1, 0.3490196, 0, 1,
-1.563009, 0.0386386, -1.074847, 1, 0.3529412, 0, 1,
-1.560154, 0.3531237, -3.83577, 1, 0.3607843, 0, 1,
-1.540215, 0.8355799, -1.641921, 1, 0.3647059, 0, 1,
-1.535603, 1.144067, -0.187882, 1, 0.372549, 0, 1,
-1.520254, -0.4404299, -1.775417, 1, 0.3764706, 0, 1,
-1.517484, 0.2201196, -1.528443, 1, 0.3843137, 0, 1,
-1.515087, 0.00672191, -2.563239, 1, 0.3882353, 0, 1,
-1.507242, -1.29725, -1.880224, 1, 0.3960784, 0, 1,
-1.505814, 0.6066023, -3.28134, 1, 0.4039216, 0, 1,
-1.499166, 1.642492, 0.7021536, 1, 0.4078431, 0, 1,
-1.493779, -1.255219, -0.7673211, 1, 0.4156863, 0, 1,
-1.486727, 0.7634049, -1.022164, 1, 0.4196078, 0, 1,
-1.483822, -1.946547, -0.4976356, 1, 0.427451, 0, 1,
-1.480083, 1.075109, -1.285636, 1, 0.4313726, 0, 1,
-1.45421, -0.3770387, -2.043552, 1, 0.4392157, 0, 1,
-1.436933, 0.8071002, -0.01034218, 1, 0.4431373, 0, 1,
-1.435107, -0.8038918, -3.664222, 1, 0.4509804, 0, 1,
-1.432488, -0.1026661, -1.431334, 1, 0.454902, 0, 1,
-1.408125, 1.116006, -0.2234534, 1, 0.4627451, 0, 1,
-1.402771, -0.3784953, -3.741729, 1, 0.4666667, 0, 1,
-1.385925, -1.634584, -2.696188, 1, 0.4745098, 0, 1,
-1.384367, -0.4915027, -2.728269, 1, 0.4784314, 0, 1,
-1.38261, 0.6123909, -3.152044, 1, 0.4862745, 0, 1,
-1.38176, 0.3722482, -1.754184, 1, 0.4901961, 0, 1,
-1.374963, 0.7404204, -2.047269, 1, 0.4980392, 0, 1,
-1.374273, 1.597958, -0.6047824, 1, 0.5058824, 0, 1,
-1.366107, -0.8947566, -3.956421, 1, 0.509804, 0, 1,
-1.364675, -0.70415, -3.338277, 1, 0.5176471, 0, 1,
-1.362561, 0.04197271, 0.6010901, 1, 0.5215687, 0, 1,
-1.361958, 1.255334, -0.2329711, 1, 0.5294118, 0, 1,
-1.361796, 0.09234603, -3.678796, 1, 0.5333334, 0, 1,
-1.329822, 0.1618542, -2.15843, 1, 0.5411765, 0, 1,
-1.321468, -0.3586603, -2.309364, 1, 0.5450981, 0, 1,
-1.318468, 0.6347202, -1.26843, 1, 0.5529412, 0, 1,
-1.314661, -2.095567, -3.725134, 1, 0.5568628, 0, 1,
-1.301898, -0.3173838, -2.423551, 1, 0.5647059, 0, 1,
-1.298735, 0.4716859, -0.3934555, 1, 0.5686275, 0, 1,
-1.288529, -1.843009, -2.663606, 1, 0.5764706, 0, 1,
-1.285011, 0.3424913, 0.4890834, 1, 0.5803922, 0, 1,
-1.278232, 0.1864413, -2.374901, 1, 0.5882353, 0, 1,
-1.263403, -1.178248, -1.48826, 1, 0.5921569, 0, 1,
-1.262868, -1.113925, -3.008011, 1, 0.6, 0, 1,
-1.258115, 0.9452506, -0.9195132, 1, 0.6078432, 0, 1,
-1.242915, 1.045116, 0.2572385, 1, 0.6117647, 0, 1,
-1.23645, -0.486463, -1.288515, 1, 0.6196079, 0, 1,
-1.235048, 0.973887, -3.246472, 1, 0.6235294, 0, 1,
-1.234315, 1.245975, 0.5593312, 1, 0.6313726, 0, 1,
-1.210604, 0.2263618, -2.171072, 1, 0.6352941, 0, 1,
-1.209285, 1.025002, -1.252044, 1, 0.6431373, 0, 1,
-1.20802, 0.4143634, -1.186769, 1, 0.6470588, 0, 1,
-1.207576, 0.8068263, -1.823959, 1, 0.654902, 0, 1,
-1.194048, 0.1597955, -4.147858, 1, 0.6588235, 0, 1,
-1.190189, 1.317251, 0.8683943, 1, 0.6666667, 0, 1,
-1.182126, 0.5365983, -1.025487, 1, 0.6705883, 0, 1,
-1.180349, 0.4940631, -2.709488, 1, 0.6784314, 0, 1,
-1.177548, -1.356907, -2.410821, 1, 0.682353, 0, 1,
-1.171434, -0.3582596, -2.569513, 1, 0.6901961, 0, 1,
-1.169198, -1.157841, -3.102677, 1, 0.6941177, 0, 1,
-1.154683, -1.270352, -2.92919, 1, 0.7019608, 0, 1,
-1.153566, -0.139493, -2.433162, 1, 0.7098039, 0, 1,
-1.135962, 0.7647165, -0.4468496, 1, 0.7137255, 0, 1,
-1.133462, 2.070785, -1.317686, 1, 0.7215686, 0, 1,
-1.130289, 0.5165408, -0.168484, 1, 0.7254902, 0, 1,
-1.110716, 0.4150166, -0.3826201, 1, 0.7333333, 0, 1,
-1.105077, 0.5550429, -0.1228953, 1, 0.7372549, 0, 1,
-1.099928, -1.038835, -2.203557, 1, 0.7450981, 0, 1,
-1.096008, 1.957211, -1.49885, 1, 0.7490196, 0, 1,
-1.090269, 0.1617324, -1.903004, 1, 0.7568628, 0, 1,
-1.090187, -0.2054076, 0.1395001, 1, 0.7607843, 0, 1,
-1.087575, -0.4102512, -1.208042, 1, 0.7686275, 0, 1,
-1.082029, 0.7212462, -2.207982, 1, 0.772549, 0, 1,
-1.078753, 0.3106255, -0.01866259, 1, 0.7803922, 0, 1,
-1.077735, 0.6546662, -1.148594, 1, 0.7843137, 0, 1,
-1.073705, -0.4569179, -2.500182, 1, 0.7921569, 0, 1,
-1.071941, -3.200336, -3.235731, 1, 0.7960784, 0, 1,
-1.066855, -0.4301279, -0.8235514, 1, 0.8039216, 0, 1,
-1.06048, -0.2885049, -0.6745708, 1, 0.8117647, 0, 1,
-1.060107, -0.807651, -3.933456, 1, 0.8156863, 0, 1,
-1.059722, -0.8230674, -3.237183, 1, 0.8235294, 0, 1,
-1.059018, 0.8004028, -0.503713, 1, 0.827451, 0, 1,
-1.059001, 0.618363, -1.766157, 1, 0.8352941, 0, 1,
-1.055785, 1.846899, 0.2127665, 1, 0.8392157, 0, 1,
-1.046513, -0.6770299, -1.881654, 1, 0.8470588, 0, 1,
-1.041646, 0.5060009, -0.8411089, 1, 0.8509804, 0, 1,
-1.038941, 0.7315215, -0.1022977, 1, 0.8588235, 0, 1,
-1.028908, -0.643994, -2.997755, 1, 0.8627451, 0, 1,
-1.028148, -0.5187862, -1.271308, 1, 0.8705882, 0, 1,
-1.021771, 0.6922194, -1.197125, 1, 0.8745098, 0, 1,
-1.017895, -1.47198, -3.169251, 1, 0.8823529, 0, 1,
-1.017568, -0.5739212, -0.9911588, 1, 0.8862745, 0, 1,
-1.013185, -1.276556, 0.1708723, 1, 0.8941177, 0, 1,
-1.005539, -0.4268747, -2.36523, 1, 0.8980392, 0, 1,
-1.004531, -0.3621481, -3.084815, 1, 0.9058824, 0, 1,
-0.9970099, -0.7515075, -2.067475, 1, 0.9137255, 0, 1,
-0.9936459, -1.765926, -5.382388, 1, 0.9176471, 0, 1,
-0.9858756, 1.034962, -0.9800904, 1, 0.9254902, 0, 1,
-0.983937, 0.2138013, -1.549208, 1, 0.9294118, 0, 1,
-0.9776782, -0.8989398, -1.372567, 1, 0.9372549, 0, 1,
-0.9770024, -1.341314, -0.7320119, 1, 0.9411765, 0, 1,
-0.9737773, -0.2338863, -1.57788, 1, 0.9490196, 0, 1,
-0.9701211, -1.761292, -2.391649, 1, 0.9529412, 0, 1,
-0.962854, 0.8906119, -1.367705, 1, 0.9607843, 0, 1,
-0.9577041, -0.3474966, -2.010807, 1, 0.9647059, 0, 1,
-0.9545486, 0.1470659, -0.9673061, 1, 0.972549, 0, 1,
-0.9524796, -0.8125479, -3.121083, 1, 0.9764706, 0, 1,
-0.9509298, 1.220676, 1.529426, 1, 0.9843137, 0, 1,
-0.9502906, -0.1892091, -1.051577, 1, 0.9882353, 0, 1,
-0.9432548, 0.05417102, -1.95751, 1, 0.9960784, 0, 1,
-0.941514, 0.9297718, 0.8176745, 0.9960784, 1, 0, 1,
-0.9165496, 0.1705345, -1.911839, 0.9921569, 1, 0, 1,
-0.9161119, -0.7836458, -2.608868, 0.9843137, 1, 0, 1,
-0.9134381, -0.4257167, -1.794827, 0.9803922, 1, 0, 1,
-0.9128134, 0.776205, -1.585098, 0.972549, 1, 0, 1,
-0.91167, -1.678393, -1.882145, 0.9686275, 1, 0, 1,
-0.9116218, -1.343528, -1.148753, 0.9607843, 1, 0, 1,
-0.9090034, -0.8537953, -0.4740012, 0.9568627, 1, 0, 1,
-0.9079306, 0.9102302, 0.7773723, 0.9490196, 1, 0, 1,
-0.9002604, 1.259747, 1.736745, 0.945098, 1, 0, 1,
-0.8972648, 0.4166222, -1.02872, 0.9372549, 1, 0, 1,
-0.8932959, -0.2881523, -0.8400822, 0.9333333, 1, 0, 1,
-0.8916674, -0.2545442, -1.8835, 0.9254902, 1, 0, 1,
-0.8885288, -0.722384, -4.28228, 0.9215686, 1, 0, 1,
-0.8884051, -0.9854072, -1.402633, 0.9137255, 1, 0, 1,
-0.8879377, 0.6521907, -2.116702, 0.9098039, 1, 0, 1,
-0.8870057, 0.2470188, -0.6717153, 0.9019608, 1, 0, 1,
-0.8716269, 0.5200545, -1.002049, 0.8941177, 1, 0, 1,
-0.8715036, 0.1656927, -0.5900328, 0.8901961, 1, 0, 1,
-0.8696817, 0.1642598, -2.349735, 0.8823529, 1, 0, 1,
-0.8692983, -0.583903, -1.37682, 0.8784314, 1, 0, 1,
-0.8616599, -0.8696545, -5.114302, 0.8705882, 1, 0, 1,
-0.8569266, -1.769339, -2.937105, 0.8666667, 1, 0, 1,
-0.8548436, 1.73069, -1.153134, 0.8588235, 1, 0, 1,
-0.8451369, 0.281921, -0.4381248, 0.854902, 1, 0, 1,
-0.8437367, 0.6576518, -0.04205707, 0.8470588, 1, 0, 1,
-0.8430476, -1.490453, -2.270864, 0.8431373, 1, 0, 1,
-0.8416521, -0.5368933, -1.226407, 0.8352941, 1, 0, 1,
-0.8392566, -0.9351583, -3.282804, 0.8313726, 1, 0, 1,
-0.8390413, 1.485813, 0.7128006, 0.8235294, 1, 0, 1,
-0.8363532, 2.924929, 0.7257242, 0.8196079, 1, 0, 1,
-0.8339821, -0.806474, -1.688438, 0.8117647, 1, 0, 1,
-0.8308842, -1.512817, -2.457234, 0.8078431, 1, 0, 1,
-0.8288281, 0.7767782, -0.3483093, 0.8, 1, 0, 1,
-0.8259364, -1.250436, -2.361263, 0.7921569, 1, 0, 1,
-0.8257197, -1.008668, -2.101292, 0.7882353, 1, 0, 1,
-0.8250043, 0.2047462, -1.865679, 0.7803922, 1, 0, 1,
-0.8213457, -0.2176412, -1.500945, 0.7764706, 1, 0, 1,
-0.8162409, -1.65984, -2.539591, 0.7686275, 1, 0, 1,
-0.8123905, 1.094628, -0.6839031, 0.7647059, 1, 0, 1,
-0.8064834, -0.2977417, 0.2629565, 0.7568628, 1, 0, 1,
-0.7953277, -0.01346717, -2.280254, 0.7529412, 1, 0, 1,
-0.7950843, 1.584029, -0.7046966, 0.7450981, 1, 0, 1,
-0.7909465, -0.201639, -2.908865, 0.7411765, 1, 0, 1,
-0.787959, 0.3424683, -2.430576, 0.7333333, 1, 0, 1,
-0.786909, -1.953282, -2.73084, 0.7294118, 1, 0, 1,
-0.7834427, -1.617807, -3.254066, 0.7215686, 1, 0, 1,
-0.7813169, 1.951851, 0.5121602, 0.7176471, 1, 0, 1,
-0.7793874, -0.8449512, -2.856282, 0.7098039, 1, 0, 1,
-0.7753283, -2.644745, -4.506018, 0.7058824, 1, 0, 1,
-0.7750506, -0.3587157, -2.015229, 0.6980392, 1, 0, 1,
-0.7652794, -0.2309534, -4.257776, 0.6901961, 1, 0, 1,
-0.7651781, 0.225802, -0.7860532, 0.6862745, 1, 0, 1,
-0.764231, -0.250663, -0.8375428, 0.6784314, 1, 0, 1,
-0.7617951, 0.4668636, -0.5610024, 0.6745098, 1, 0, 1,
-0.7606323, -0.1113758, 0.3452775, 0.6666667, 1, 0, 1,
-0.7592894, 1.09197, 0.7550915, 0.6627451, 1, 0, 1,
-0.7590998, -0.6950867, -2.903979, 0.654902, 1, 0, 1,
-0.7568915, 1.194696, -2.868967, 0.6509804, 1, 0, 1,
-0.75479, -1.126179, -2.864024, 0.6431373, 1, 0, 1,
-0.7542312, -0.4035706, -1.187807, 0.6392157, 1, 0, 1,
-0.7510567, 0.02521376, -1.775598, 0.6313726, 1, 0, 1,
-0.7481475, -2.121781, -3.173315, 0.627451, 1, 0, 1,
-0.7420181, -1.133399, -2.61965, 0.6196079, 1, 0, 1,
-0.7403988, -0.5087673, -1.059215, 0.6156863, 1, 0, 1,
-0.7403254, -0.2029375, -2.250695, 0.6078432, 1, 0, 1,
-0.7278454, 0.3598742, 0.2004669, 0.6039216, 1, 0, 1,
-0.7248404, 1.087374, -0.003843035, 0.5960785, 1, 0, 1,
-0.7236151, 1.231391, 0.203143, 0.5882353, 1, 0, 1,
-0.7222831, 0.6040136, 0.08520313, 0.5843138, 1, 0, 1,
-0.7148142, 0.7219931, -1.064997, 0.5764706, 1, 0, 1,
-0.6975026, 0.4433114, 1.112323, 0.572549, 1, 0, 1,
-0.6944839, 0.4914668, -1.097886, 0.5647059, 1, 0, 1,
-0.6916969, -1.245927, -2.953751, 0.5607843, 1, 0, 1,
-0.6846428, -1.368095, -3.277403, 0.5529412, 1, 0, 1,
-0.6843137, -0.4730052, -4.595747, 0.5490196, 1, 0, 1,
-0.6816357, -0.1365554, -1.552947, 0.5411765, 1, 0, 1,
-0.6810676, 0.2862199, -0.9608145, 0.5372549, 1, 0, 1,
-0.6773047, -0.3681607, -0.5118938, 0.5294118, 1, 0, 1,
-0.6738442, 0.4722244, -1.891306, 0.5254902, 1, 0, 1,
-0.6693168, -0.9771237, -1.419133, 0.5176471, 1, 0, 1,
-0.6674461, -0.2015115, -0.5633767, 0.5137255, 1, 0, 1,
-0.6634248, 0.8646213, -2.184545, 0.5058824, 1, 0, 1,
-0.654562, 0.3280376, -1.087197, 0.5019608, 1, 0, 1,
-0.6523195, -0.2168428, -2.131606, 0.4941176, 1, 0, 1,
-0.6506017, 0.6181559, -1.010662, 0.4862745, 1, 0, 1,
-0.6497512, 1.389442, 0.3774885, 0.4823529, 1, 0, 1,
-0.639866, -0.2330973, -2.939304, 0.4745098, 1, 0, 1,
-0.6300992, 1.617446, -1.239597, 0.4705882, 1, 0, 1,
-0.6289766, 0.3915627, -0.8329257, 0.4627451, 1, 0, 1,
-0.6287731, 0.4345868, -2.239969, 0.4588235, 1, 0, 1,
-0.6276971, -0.7100542, -2.04692, 0.4509804, 1, 0, 1,
-0.6245776, -0.1846381, -1.850445, 0.4470588, 1, 0, 1,
-0.6225415, 0.5191888, -2.076357, 0.4392157, 1, 0, 1,
-0.6217003, -0.2197141, -2.526545, 0.4352941, 1, 0, 1,
-0.619738, -0.5519093, -2.392801, 0.427451, 1, 0, 1,
-0.6185412, -0.4038963, -3.591076, 0.4235294, 1, 0, 1,
-0.6169747, 0.693773, -0.812929, 0.4156863, 1, 0, 1,
-0.6119233, 0.2791997, -1.241325, 0.4117647, 1, 0, 1,
-0.6116028, 0.4716912, -1.679762, 0.4039216, 1, 0, 1,
-0.6114073, -0.8485255, -2.933289, 0.3960784, 1, 0, 1,
-0.6102707, -0.4689657, -2.93642, 0.3921569, 1, 0, 1,
-0.6087117, 0.1113611, -0.5457695, 0.3843137, 1, 0, 1,
-0.6028422, 0.139797, -4.472481, 0.3803922, 1, 0, 1,
-0.6013543, 1.935124, -0.1348977, 0.372549, 1, 0, 1,
-0.5999274, 0.8613023, -1.16347, 0.3686275, 1, 0, 1,
-0.5999239, 0.845401, 1.59385, 0.3607843, 1, 0, 1,
-0.5953156, 0.6465435, -1.374693, 0.3568628, 1, 0, 1,
-0.5951567, 0.2028325, -2.609037, 0.3490196, 1, 0, 1,
-0.5942765, 1.318424, -0.7982072, 0.345098, 1, 0, 1,
-0.5941845, 0.06964255, -2.230234, 0.3372549, 1, 0, 1,
-0.5938593, 0.1024226, -1.160194, 0.3333333, 1, 0, 1,
-0.5889122, -0.6227505, -2.246401, 0.3254902, 1, 0, 1,
-0.5883609, 0.797331, -0.6305377, 0.3215686, 1, 0, 1,
-0.5873868, 0.5585423, -0.5170428, 0.3137255, 1, 0, 1,
-0.576328, 1.130971, 1.732136, 0.3098039, 1, 0, 1,
-0.5755454, -0.9808487, -2.100324, 0.3019608, 1, 0, 1,
-0.5730505, 0.665345, -0.6707745, 0.2941177, 1, 0, 1,
-0.5729455, -0.3806864, -2.248694, 0.2901961, 1, 0, 1,
-0.5672163, 1.887387, 1.441964, 0.282353, 1, 0, 1,
-0.5639058, 0.5676418, -0.925135, 0.2784314, 1, 0, 1,
-0.5631649, 0.5411492, -0.05873386, 0.2705882, 1, 0, 1,
-0.5585934, 1.376518, -1.127788, 0.2666667, 1, 0, 1,
-0.5580549, -2.794204, -2.066515, 0.2588235, 1, 0, 1,
-0.556922, -1.711734, -2.794982, 0.254902, 1, 0, 1,
-0.5568621, -1.130247, -1.417781, 0.2470588, 1, 0, 1,
-0.5505586, -0.6013491, -2.305434, 0.2431373, 1, 0, 1,
-0.5402523, -0.1185292, -1.063607, 0.2352941, 1, 0, 1,
-0.5387151, 2.054057, 0.9712364, 0.2313726, 1, 0, 1,
-0.5360224, -1.827885, -2.345751, 0.2235294, 1, 0, 1,
-0.5355983, -0.5285625, -1.938153, 0.2196078, 1, 0, 1,
-0.5344591, -0.02815387, -1.489018, 0.2117647, 1, 0, 1,
-0.5288842, -1.656397, -1.510198, 0.2078431, 1, 0, 1,
-0.5274838, 0.7219369, -1.249523, 0.2, 1, 0, 1,
-0.5270109, -3.164212, -3.599085, 0.1921569, 1, 0, 1,
-0.5261902, -0.5328699, -5.290038, 0.1882353, 1, 0, 1,
-0.5235364, 0.6850672, 0.9564973, 0.1803922, 1, 0, 1,
-0.5229089, 1.270869, -0.2568086, 0.1764706, 1, 0, 1,
-0.5223872, -1.568266, -3.455686, 0.1686275, 1, 0, 1,
-0.5218238, -0.6410811, -1.361202, 0.1647059, 1, 0, 1,
-0.5193067, 0.5959318, -0.3912052, 0.1568628, 1, 0, 1,
-0.5188692, -0.6635324, -2.876548, 0.1529412, 1, 0, 1,
-0.5174571, -0.5167, -2.832351, 0.145098, 1, 0, 1,
-0.5156621, -0.4091828, -1.280243, 0.1411765, 1, 0, 1,
-0.5141933, 0.9838395, 0.6018299, 0.1333333, 1, 0, 1,
-0.5123276, 0.4331824, -1.36895, 0.1294118, 1, 0, 1,
-0.5117371, 0.6527222, 0.3000887, 0.1215686, 1, 0, 1,
-0.5109949, 0.9080115, -0.1694593, 0.1176471, 1, 0, 1,
-0.5101842, 0.4460995, -1.35564, 0.1098039, 1, 0, 1,
-0.5090346, -0.9624383, -2.751001, 0.1058824, 1, 0, 1,
-0.508935, 1.742993, -0.2964106, 0.09803922, 1, 0, 1,
-0.5071279, 0.09177879, -2.826677, 0.09019608, 1, 0, 1,
-0.5058833, -0.5630118, -2.633449, 0.08627451, 1, 0, 1,
-0.5014557, -0.0734629, -2.912148, 0.07843138, 1, 0, 1,
-0.5011258, -0.05083575, -1.665927, 0.07450981, 1, 0, 1,
-0.5007976, -0.08824269, -1.526189, 0.06666667, 1, 0, 1,
-0.4971555, 1.227226, 0.3269083, 0.0627451, 1, 0, 1,
-0.4957269, -0.9237741, -2.710086, 0.05490196, 1, 0, 1,
-0.4940567, -1.365214, -2.063503, 0.05098039, 1, 0, 1,
-0.4938093, 0.1918651, 0.6018634, 0.04313726, 1, 0, 1,
-0.4934816, 0.002308076, -2.488639, 0.03921569, 1, 0, 1,
-0.4897589, -0.7495615, -1.66894, 0.03137255, 1, 0, 1,
-0.4897349, 0.3481936, -0.9608204, 0.02745098, 1, 0, 1,
-0.4871542, 2.09871, 1.043755, 0.01960784, 1, 0, 1,
-0.4858684, -0.1006698, -1.250671, 0.01568628, 1, 0, 1,
-0.4781441, 0.5465031, -2.807503, 0.007843138, 1, 0, 1,
-0.4776187, 0.3382127, -1.147161, 0.003921569, 1, 0, 1,
-0.4735063, -0.6387281, -2.910011, 0, 1, 0.003921569, 1,
-0.4731044, 0.5008218, -0.576728, 0, 1, 0.01176471, 1,
-0.467777, -0.4894189, -2.401915, 0, 1, 0.01568628, 1,
-0.4675139, -0.9654268, -1.975675, 0, 1, 0.02352941, 1,
-0.4672416, 1.295433, -1.077764, 0, 1, 0.02745098, 1,
-0.4669068, 0.8196139, -1.240573, 0, 1, 0.03529412, 1,
-0.4625876, 0.1659881, -1.567711, 0, 1, 0.03921569, 1,
-0.462502, -0.3404208, -2.456443, 0, 1, 0.04705882, 1,
-0.4551834, -0.7626356, -2.358244, 0, 1, 0.05098039, 1,
-0.4546791, -0.213331, -1.94612, 0, 1, 0.05882353, 1,
-0.4504869, 0.1629531, -0.7384064, 0, 1, 0.0627451, 1,
-0.4455121, -0.9502575, -3.537882, 0, 1, 0.07058824, 1,
-0.4447273, -1.037729, -2.749416, 0, 1, 0.07450981, 1,
-0.443989, 0.04039833, -2.749081, 0, 1, 0.08235294, 1,
-0.4411207, 1.168099, -0.8320817, 0, 1, 0.08627451, 1,
-0.434315, 0.305704, -0.1279804, 0, 1, 0.09411765, 1,
-0.4323051, -1.532036, -3.817251, 0, 1, 0.1019608, 1,
-0.4295065, -0.008236534, -2.386557, 0, 1, 0.1058824, 1,
-0.4293714, -0.3346168, -1.207387, 0, 1, 0.1137255, 1,
-0.428855, 0.67956, -0.8291472, 0, 1, 0.1176471, 1,
-0.4251453, 0.5306059, -0.2218886, 0, 1, 0.1254902, 1,
-0.4247909, -0.336819, -3.256931, 0, 1, 0.1294118, 1,
-0.4237677, 0.05131312, -1.687841, 0, 1, 0.1372549, 1,
-0.4204186, 1.043407, -0.420634, 0, 1, 0.1411765, 1,
-0.4181905, -2.17922, -3.24474, 0, 1, 0.1490196, 1,
-0.4175903, 1.601194, -0.1200528, 0, 1, 0.1529412, 1,
-0.4159835, 0.1291015, -0.9077795, 0, 1, 0.1607843, 1,
-0.4135829, 0.8098409, 0.08579072, 0, 1, 0.1647059, 1,
-0.4126015, -0.2374066, -1.983129, 0, 1, 0.172549, 1,
-0.4087998, -0.331908, -2.539613, 0, 1, 0.1764706, 1,
-0.4078861, 1.470229, 0.679858, 0, 1, 0.1843137, 1,
-0.4073601, -0.1824355, -0.1433011, 0, 1, 0.1882353, 1,
-0.4060468, -1.018526, -2.00016, 0, 1, 0.1960784, 1,
-0.3983695, 0.9530026, -0.9401348, 0, 1, 0.2039216, 1,
-0.3951886, -1.040069, -2.459847, 0, 1, 0.2078431, 1,
-0.3944871, 0.5698182, 0.2146681, 0, 1, 0.2156863, 1,
-0.3896024, -1.453052, -3.560227, 0, 1, 0.2196078, 1,
-0.387932, -0.4638844, -2.307145, 0, 1, 0.227451, 1,
-0.3683857, 0.4695562, 0.6480815, 0, 1, 0.2313726, 1,
-0.3633969, -0.4205237, -0.7227112, 0, 1, 0.2392157, 1,
-0.360845, 0.6491371, -1.103864, 0, 1, 0.2431373, 1,
-0.3570079, 0.3313965, -0.223088, 0, 1, 0.2509804, 1,
-0.35363, 0.604672, -0.3290119, 0, 1, 0.254902, 1,
-0.3532149, -0.04720135, -3.393582, 0, 1, 0.2627451, 1,
-0.3520588, 0.3346768, -1.532501, 0, 1, 0.2666667, 1,
-0.3515496, -0.3089169, -0.9330513, 0, 1, 0.2745098, 1,
-0.3484988, -0.5512418, -0.6859945, 0, 1, 0.2784314, 1,
-0.3454097, 1.509054, 0.668724, 0, 1, 0.2862745, 1,
-0.3394269, 0.5227988, -0.9431494, 0, 1, 0.2901961, 1,
-0.3349714, 0.3061227, -0.4627635, 0, 1, 0.2980392, 1,
-0.3349316, -0.2672449, -1.943035, 0, 1, 0.3058824, 1,
-0.3348002, -1.467687, -2.606308, 0, 1, 0.3098039, 1,
-0.3343227, 0.3237544, 0.1405791, 0, 1, 0.3176471, 1,
-0.3286943, -0.664095, -4.441659, 0, 1, 0.3215686, 1,
-0.3276389, -0.0788651, -2.937667, 0, 1, 0.3294118, 1,
-0.326445, 0.4189565, 0.7017633, 0, 1, 0.3333333, 1,
-0.3216565, 0.4952918, -0.1733792, 0, 1, 0.3411765, 1,
-0.3204708, -0.5352193, -2.767162, 0, 1, 0.345098, 1,
-0.3189326, -0.5303206, -2.150478, 0, 1, 0.3529412, 1,
-0.3185423, -0.6168447, -3.033769, 0, 1, 0.3568628, 1,
-0.3161339, -0.6809441, -4.923931, 0, 1, 0.3647059, 1,
-0.313913, 0.5268972, 0.07379241, 0, 1, 0.3686275, 1,
-0.3090245, 0.1534443, -1.619325, 0, 1, 0.3764706, 1,
-0.309011, -0.5026326, -2.439305, 0, 1, 0.3803922, 1,
-0.3059077, 0.80267, -0.6466417, 0, 1, 0.3882353, 1,
-0.3017051, 0.9298424, 0.7064868, 0, 1, 0.3921569, 1,
-0.2950243, 0.3367058, -1.621344, 0, 1, 0.4, 1,
-0.2929043, 0.5770481, -0.8214324, 0, 1, 0.4078431, 1,
-0.2926808, -0.4327686, -2.075521, 0, 1, 0.4117647, 1,
-0.2919101, 0.2955406, -0.4624099, 0, 1, 0.4196078, 1,
-0.2844379, 1.310615, -0.817676, 0, 1, 0.4235294, 1,
-0.2824922, -0.4889554, -2.811371, 0, 1, 0.4313726, 1,
-0.2792629, 1.761598, -1.08779, 0, 1, 0.4352941, 1,
-0.2768514, -0.1605583, -1.218446, 0, 1, 0.4431373, 1,
-0.2765252, 0.07906957, -1.627211, 0, 1, 0.4470588, 1,
-0.276296, -2.904553, -2.963239, 0, 1, 0.454902, 1,
-0.27527, -0.9629959, -2.380227, 0, 1, 0.4588235, 1,
-0.2736098, 0.9593233, -0.7765279, 0, 1, 0.4666667, 1,
-0.2735336, 0.989618, 0.2605497, 0, 1, 0.4705882, 1,
-0.2656681, 0.2875227, -0.9311208, 0, 1, 0.4784314, 1,
-0.2635139, -1.051234, -1.699095, 0, 1, 0.4823529, 1,
-0.2631076, -0.4587204, -3.781518, 0, 1, 0.4901961, 1,
-0.2610515, 1.39804, -0.219553, 0, 1, 0.4941176, 1,
-0.259656, 0.06411284, -1.800969, 0, 1, 0.5019608, 1,
-0.2568536, 0.0102442, -0.6176997, 0, 1, 0.509804, 1,
-0.2526124, 0.2178809, -1.990317, 0, 1, 0.5137255, 1,
-0.2523527, -0.8412511, -3.353588, 0, 1, 0.5215687, 1,
-0.2518685, -0.4804639, -1.777995, 0, 1, 0.5254902, 1,
-0.2488707, -1.237702, -3.655174, 0, 1, 0.5333334, 1,
-0.2485323, 1.634831, 0.4083846, 0, 1, 0.5372549, 1,
-0.2478269, -0.5852261, -0.7094196, 0, 1, 0.5450981, 1,
-0.2476643, 1.303571, 0.1219998, 0, 1, 0.5490196, 1,
-0.2475957, -1.294177, -1.414504, 0, 1, 0.5568628, 1,
-0.2471596, 0.6760141, -0.6955907, 0, 1, 0.5607843, 1,
-0.2469953, 1.150769, -0.1622943, 0, 1, 0.5686275, 1,
-0.2462786, 0.4798754, 0.06700948, 0, 1, 0.572549, 1,
-0.2427208, 1.049569, -2.699895, 0, 1, 0.5803922, 1,
-0.2408639, -0.4926792, -1.888542, 0, 1, 0.5843138, 1,
-0.2388905, -0.5175276, -4.720434, 0, 1, 0.5921569, 1,
-0.2370149, -0.7499574, -2.697914, 0, 1, 0.5960785, 1,
-0.2363764, -0.05861559, -1.646542, 0, 1, 0.6039216, 1,
-0.2348909, -0.900216, -2.757807, 0, 1, 0.6117647, 1,
-0.2292444, -0.3540989, -4.115069, 0, 1, 0.6156863, 1,
-0.221143, -1.058366, -2.054078, 0, 1, 0.6235294, 1,
-0.218773, -1.141485, -4.252893, 0, 1, 0.627451, 1,
-0.2172235, 0.3678315, -0.1878801, 0, 1, 0.6352941, 1,
-0.2137478, 1.143632, 1.203749, 0, 1, 0.6392157, 1,
-0.2128283, 1.366083, -0.1531636, 0, 1, 0.6470588, 1,
-0.2093183, -1.860058, -2.724632, 0, 1, 0.6509804, 1,
-0.208686, -0.2686803, -2.328144, 0, 1, 0.6588235, 1,
-0.20861, -1.414361, -3.481885, 0, 1, 0.6627451, 1,
-0.2060747, -0.247684, -1.387633, 0, 1, 0.6705883, 1,
-0.2013467, 0.09866684, -1.593802, 0, 1, 0.6745098, 1,
-0.2003242, -1.627384, -4.655961, 0, 1, 0.682353, 1,
-0.1994334, 1.088159, -0.03985853, 0, 1, 0.6862745, 1,
-0.1985513, -0.6331016, -3.020725, 0, 1, 0.6941177, 1,
-0.197278, 0.6430385, -1.539702, 0, 1, 0.7019608, 1,
-0.1928286, 0.4763329, -0.8221042, 0, 1, 0.7058824, 1,
-0.1919541, -2.710652, -3.592424, 0, 1, 0.7137255, 1,
-0.1910618, 0.05749648, -1.636503, 0, 1, 0.7176471, 1,
-0.1905394, 0.1245066, 0.9743678, 0, 1, 0.7254902, 1,
-0.1866294, 3.414861, 0.2402034, 0, 1, 0.7294118, 1,
-0.1863373, -0.02797071, -3.392299, 0, 1, 0.7372549, 1,
-0.1831497, 0.1383426, -2.947213, 0, 1, 0.7411765, 1,
-0.1822129, 1.356528, 0.4007422, 0, 1, 0.7490196, 1,
-0.1798064, -1.001613, -2.945825, 0, 1, 0.7529412, 1,
-0.1795467, 1.425457, -0.5487525, 0, 1, 0.7607843, 1,
-0.169867, -1.396474, -3.309946, 0, 1, 0.7647059, 1,
-0.1688805, 0.9849833, -0.1816985, 0, 1, 0.772549, 1,
-0.1672421, -1.701013, -3.590726, 0, 1, 0.7764706, 1,
-0.1671687, -0.256095, -3.734646, 0, 1, 0.7843137, 1,
-0.165741, 0.8235831, -1.67849, 0, 1, 0.7882353, 1,
-0.1599524, -0.4031772, -2.24049, 0, 1, 0.7960784, 1,
-0.1598788, 0.6824303, -1.318792, 0, 1, 0.8039216, 1,
-0.1590963, -0.3518122, -2.838943, 0, 1, 0.8078431, 1,
-0.1588917, -0.1766083, -2.432718, 0, 1, 0.8156863, 1,
-0.1587011, -2.498406, -3.644396, 0, 1, 0.8196079, 1,
-0.1581616, 0.9948295, 0.3320286, 0, 1, 0.827451, 1,
-0.1574879, -0.5438153, -2.873566, 0, 1, 0.8313726, 1,
-0.1514345, 0.02270744, -1.743201, 0, 1, 0.8392157, 1,
-0.1423192, -1.945818, -2.453322, 0, 1, 0.8431373, 1,
-0.1415563, 0.7342095, -0.5412587, 0, 1, 0.8509804, 1,
-0.1404226, -0.7460938, -2.854776, 0, 1, 0.854902, 1,
-0.1311294, 1.190493, 1.234816, 0, 1, 0.8627451, 1,
-0.1244453, 1.015316, 1.21626, 0, 1, 0.8666667, 1,
-0.1238421, -0.898333, -3.537521, 0, 1, 0.8745098, 1,
-0.1208258, 1.477908, -1.690988, 0, 1, 0.8784314, 1,
-0.1205401, 0.6506303, -0.3243661, 0, 1, 0.8862745, 1,
-0.119695, 0.2721404, 0.1037307, 0, 1, 0.8901961, 1,
-0.1192907, -1.913186, -3.26643, 0, 1, 0.8980392, 1,
-0.1157461, -0.06334354, -2.903315, 0, 1, 0.9058824, 1,
-0.1047246, 0.5459723, 1.577556, 0, 1, 0.9098039, 1,
-0.1031517, 0.1850564, -0.4455078, 0, 1, 0.9176471, 1,
-0.1026329, -1.545899, -4.928973, 0, 1, 0.9215686, 1,
-0.1024967, -1.444375, -3.696381, 0, 1, 0.9294118, 1,
-0.08891036, -0.0539867, 0.7606934, 0, 1, 0.9333333, 1,
-0.0887415, -0.8021674, -4.481259, 0, 1, 0.9411765, 1,
-0.08333026, 0.3248223, -1.744586, 0, 1, 0.945098, 1,
-0.07528979, -1.469854, -3.510382, 0, 1, 0.9529412, 1,
-0.07122446, 0.684691, 1.323094, 0, 1, 0.9568627, 1,
-0.06912094, 0.2377495, -0.776254, 0, 1, 0.9647059, 1,
-0.06839705, -1.437985, -3.260914, 0, 1, 0.9686275, 1,
-0.06625284, 1.509302, -0.612129, 0, 1, 0.9764706, 1,
-0.0656658, -0.04907982, -1.481754, 0, 1, 0.9803922, 1,
-0.06299382, 1.056292, -0.125259, 0, 1, 0.9882353, 1,
-0.06214208, 0.6917975, 0.4293837, 0, 1, 0.9921569, 1,
-0.06041603, 0.3848165, -0.608605, 0, 1, 1, 1,
-0.06041332, 0.7487402, 2.606984, 0, 0.9921569, 1, 1,
-0.05850114, 0.7858741, -0.1235715, 0, 0.9882353, 1, 1,
-0.05720267, -0.9686587, -2.767674, 0, 0.9803922, 1, 1,
-0.05147775, 0.802324, -0.9532859, 0, 0.9764706, 1, 1,
-0.04920381, 0.6686084, 1.09581, 0, 0.9686275, 1, 1,
-0.04637323, 0.2522609, -1.296391, 0, 0.9647059, 1, 1,
-0.04475518, -0.8151891, -1.854305, 0, 0.9568627, 1, 1,
-0.04385694, -1.776685, -2.238968, 0, 0.9529412, 1, 1,
-0.04201589, -0.5627941, -2.881709, 0, 0.945098, 1, 1,
-0.04148023, -1.169196, -2.307912, 0, 0.9411765, 1, 1,
-0.03999013, 0.3205676, -1.212085, 0, 0.9333333, 1, 1,
-0.03929305, -0.6624803, -3.955194, 0, 0.9294118, 1, 1,
-0.03829535, 0.3933993, 1.559455, 0, 0.9215686, 1, 1,
-0.03706869, -0.2452707, -3.585604, 0, 0.9176471, 1, 1,
-0.03389291, -2.149399, -3.294291, 0, 0.9098039, 1, 1,
-0.03388584, -0.5959745, -3.815122, 0, 0.9058824, 1, 1,
-0.03327703, -1.538699, -2.679642, 0, 0.8980392, 1, 1,
-0.03118715, 0.5787374, 2.18483, 0, 0.8901961, 1, 1,
-0.03092086, -0.3132108, -2.846192, 0, 0.8862745, 1, 1,
-0.01928381, -0.546146, -1.931041, 0, 0.8784314, 1, 1,
-0.01754892, -1.354836, -3.775976, 0, 0.8745098, 1, 1,
0.004434476, -2.047156, 3.065844, 0, 0.8666667, 1, 1,
0.009581626, -0.7523056, 3.174338, 0, 0.8627451, 1, 1,
0.01918557, -0.06155716, 4.623645, 0, 0.854902, 1, 1,
0.02144895, -0.3617882, 3.775528, 0, 0.8509804, 1, 1,
0.02364229, 0.4803374, -0.9337529, 0, 0.8431373, 1, 1,
0.02380312, -1.967364, 3.532608, 0, 0.8392157, 1, 1,
0.03095916, -0.943067, 2.992929, 0, 0.8313726, 1, 1,
0.03200897, -0.3018394, 2.867244, 0, 0.827451, 1, 1,
0.03512438, 3.211636, 0.2326159, 0, 0.8196079, 1, 1,
0.03802133, 0.2634317, 0.8467728, 0, 0.8156863, 1, 1,
0.03960873, 0.5729482, 1.019494, 0, 0.8078431, 1, 1,
0.04350147, 0.8682038, -0.1070272, 0, 0.8039216, 1, 1,
0.0445643, 1.318275, -0.1267186, 0, 0.7960784, 1, 1,
0.04511916, 1.049455, -0.4357398, 0, 0.7882353, 1, 1,
0.04535599, 0.0802145, 0.1457784, 0, 0.7843137, 1, 1,
0.04663434, 0.8299351, -1.130136, 0, 0.7764706, 1, 1,
0.052201, -0.07488322, 1.895534, 0, 0.772549, 1, 1,
0.05376196, -2.257121, 2.548003, 0, 0.7647059, 1, 1,
0.05931297, 0.2397768, 0.22799, 0, 0.7607843, 1, 1,
0.06581925, -1.517386, 4.079477, 0, 0.7529412, 1, 1,
0.06712534, -0.2513412, 2.560853, 0, 0.7490196, 1, 1,
0.06925003, -0.09001125, 2.692297, 0, 0.7411765, 1, 1,
0.07443558, -1.332121, 3.476552, 0, 0.7372549, 1, 1,
0.07656197, -0.6805428, 3.207704, 0, 0.7294118, 1, 1,
0.07679967, -0.1984473, 1.927849, 0, 0.7254902, 1, 1,
0.07927949, 0.4296349, -0.6200488, 0, 0.7176471, 1, 1,
0.08145705, 0.2442019, 0.8665289, 0, 0.7137255, 1, 1,
0.08288681, 1.63221, 0.7755528, 0, 0.7058824, 1, 1,
0.08377825, -3.62578, 3.550947, 0, 0.6980392, 1, 1,
0.08836813, 0.5642532, -0.5304523, 0, 0.6941177, 1, 1,
0.09297223, -1.689713, 4.702056, 0, 0.6862745, 1, 1,
0.09704785, 0.6004006, 0.6283, 0, 0.682353, 1, 1,
0.09705269, -0.1340134, 0.9003051, 0, 0.6745098, 1, 1,
0.09957645, -0.8834578, 5.573028, 0, 0.6705883, 1, 1,
0.1001979, 0.7480036, 2.130093, 0, 0.6627451, 1, 1,
0.1063814, -0.2321932, 3.816641, 0, 0.6588235, 1, 1,
0.1066761, -0.2710755, 3.939586, 0, 0.6509804, 1, 1,
0.1132233, -0.6700901, 4.155625, 0, 0.6470588, 1, 1,
0.1153763, -0.2073126, 2.992177, 0, 0.6392157, 1, 1,
0.11892, 0.7567395, -0.008118303, 0, 0.6352941, 1, 1,
0.1225422, 1.283805, 0.5388573, 0, 0.627451, 1, 1,
0.1229423, -0.4553878, 3.806308, 0, 0.6235294, 1, 1,
0.123574, 0.1514748, -0.3344339, 0, 0.6156863, 1, 1,
0.1244289, 1.271048, -0.09476712, 0, 0.6117647, 1, 1,
0.1276097, 1.835314, -1.906535, 0, 0.6039216, 1, 1,
0.1295987, -0.1440084, 1.517143, 0, 0.5960785, 1, 1,
0.1332423, -1.212703, 1.93352, 0, 0.5921569, 1, 1,
0.1348081, -0.268889, 4.747429, 0, 0.5843138, 1, 1,
0.1359665, 1.233993, -0.6804757, 0, 0.5803922, 1, 1,
0.1425784, -0.1150168, 3.099333, 0, 0.572549, 1, 1,
0.1449222, 1.739403, 0.792171, 0, 0.5686275, 1, 1,
0.1466772, 1.038968, 0.703387, 0, 0.5607843, 1, 1,
0.148672, -0.1231792, 2.832408, 0, 0.5568628, 1, 1,
0.1552164, -2.71619, 4.4396, 0, 0.5490196, 1, 1,
0.1559189, 1.253889, 1.143, 0, 0.5450981, 1, 1,
0.1563967, 0.5315957, -0.1388043, 0, 0.5372549, 1, 1,
0.1566445, -1.571241, 4.097018, 0, 0.5333334, 1, 1,
0.1597262, 0.5004455, 0.7310738, 0, 0.5254902, 1, 1,
0.1614167, 0.3644194, 1.190637, 0, 0.5215687, 1, 1,
0.1639055, 1.311199, 2.098024, 0, 0.5137255, 1, 1,
0.1648593, 0.3230593, 0.4832245, 0, 0.509804, 1, 1,
0.1682399, -1.552243, 3.166726, 0, 0.5019608, 1, 1,
0.1694532, 1.110768, -0.7840158, 0, 0.4941176, 1, 1,
0.1729179, 0.8982109, 1.170361, 0, 0.4901961, 1, 1,
0.1736831, 0.3221145, 1.234915, 0, 0.4823529, 1, 1,
0.1749817, 0.7043275, -0.358937, 0, 0.4784314, 1, 1,
0.1766501, -0.09488969, 1.785954, 0, 0.4705882, 1, 1,
0.1814137, -1.1021, 3.008064, 0, 0.4666667, 1, 1,
0.1834146, -0.5893431, 3.17465, 0, 0.4588235, 1, 1,
0.1891237, -0.8914633, 1.905011, 0, 0.454902, 1, 1,
0.1901558, -0.5274728, 2.158742, 0, 0.4470588, 1, 1,
0.1924164, 0.388148, 0.6760157, 0, 0.4431373, 1, 1,
0.1944688, 0.4497291, -1.700839, 0, 0.4352941, 1, 1,
0.20246, 0.2558585, 0.8651679, 0, 0.4313726, 1, 1,
0.2044755, -0.7993664, 2.169784, 0, 0.4235294, 1, 1,
0.2054169, -0.4479962, 1.871188, 0, 0.4196078, 1, 1,
0.2116209, -0.7476953, 1.614174, 0, 0.4117647, 1, 1,
0.2116476, -0.04155453, 1.429097, 0, 0.4078431, 1, 1,
0.2146732, 1.320372, 1.541777, 0, 0.4, 1, 1,
0.2168092, -1.466366, 4.265913, 0, 0.3921569, 1, 1,
0.2184069, -2.141843, 2.19313, 0, 0.3882353, 1, 1,
0.2203432, -0.3619954, 1.770125, 0, 0.3803922, 1, 1,
0.2234168, -0.2239808, 0.9864258, 0, 0.3764706, 1, 1,
0.2278303, -0.1359687, 1.708683, 0, 0.3686275, 1, 1,
0.2295641, -1.462535, 2.016913, 0, 0.3647059, 1, 1,
0.2325907, 2.051342, 0.00153445, 0, 0.3568628, 1, 1,
0.2339844, -1.237313, 1.613533, 0, 0.3529412, 1, 1,
0.2363622, -1.740323, 2.788281, 0, 0.345098, 1, 1,
0.2397448, 0.5829985, 2.310049, 0, 0.3411765, 1, 1,
0.240862, -0.6621552, 2.600761, 0, 0.3333333, 1, 1,
0.2414217, -0.4307397, 2.963072, 0, 0.3294118, 1, 1,
0.2422901, 0.2724204, -0.3930438, 0, 0.3215686, 1, 1,
0.243823, 0.1818086, 0.7701697, 0, 0.3176471, 1, 1,
0.2449967, 1.656738, 0.7699246, 0, 0.3098039, 1, 1,
0.2502652, 0.1898942, 0.9348932, 0, 0.3058824, 1, 1,
0.2575665, -0.725415, 3.319525, 0, 0.2980392, 1, 1,
0.259561, -1.209854, 5.160554, 0, 0.2901961, 1, 1,
0.2606511, 0.1014314, 0.3075693, 0, 0.2862745, 1, 1,
0.2639551, 1.607572, 0.9721332, 0, 0.2784314, 1, 1,
0.2659303, 1.217857, -0.5679433, 0, 0.2745098, 1, 1,
0.2659585, 0.5289089, 0.3038106, 0, 0.2666667, 1, 1,
0.2660415, 0.5820973, 0.4969633, 0, 0.2627451, 1, 1,
0.2661551, 0.6094733, -0.3267352, 0, 0.254902, 1, 1,
0.2693703, 0.0990639, 0.1677375, 0, 0.2509804, 1, 1,
0.2694707, 0.6970817, 1.020751, 0, 0.2431373, 1, 1,
0.270575, 1.259301, -0.5669045, 0, 0.2392157, 1, 1,
0.2741694, 0.9971402, -0.6407577, 0, 0.2313726, 1, 1,
0.2768196, -1.780631, 3.221871, 0, 0.227451, 1, 1,
0.2829386, 0.6673362, 1.222018, 0, 0.2196078, 1, 1,
0.2842751, 0.216622, 2.287607, 0, 0.2156863, 1, 1,
0.2863958, -0.9760812, 3.197474, 0, 0.2078431, 1, 1,
0.2881804, 2.100386, 1.303447, 0, 0.2039216, 1, 1,
0.2901568, -0.6538697, 1.748878, 0, 0.1960784, 1, 1,
0.2919033, -1.198185, 2.803001, 0, 0.1882353, 1, 1,
0.2940385, 0.3698872, 0.5185431, 0, 0.1843137, 1, 1,
0.2962456, -0.3909344, 2.488353, 0, 0.1764706, 1, 1,
0.2984987, 0.1508695, 0.6587589, 0, 0.172549, 1, 1,
0.3043307, -1.436512, 2.961922, 0, 0.1647059, 1, 1,
0.3065752, 1.207873, -0.246275, 0, 0.1607843, 1, 1,
0.3156208, -0.2452002, 0.6538227, 0, 0.1529412, 1, 1,
0.3235934, -2.921232, 1.297325, 0, 0.1490196, 1, 1,
0.3246554, -0.6533131, 1.364804, 0, 0.1411765, 1, 1,
0.3275559, 0.3209626, 0.7083688, 0, 0.1372549, 1, 1,
0.3284349, 0.2481474, 2.971051, 0, 0.1294118, 1, 1,
0.3323808, 0.743329, 1.284045, 0, 0.1254902, 1, 1,
0.3361465, 0.339564, 1.107729, 0, 0.1176471, 1, 1,
0.3366579, 1.295837, -0.04164527, 0, 0.1137255, 1, 1,
0.3401973, 2.463414, 0.6504675, 0, 0.1058824, 1, 1,
0.3445016, -2.222946, 2.829537, 0, 0.09803922, 1, 1,
0.3530444, 1.495354, 0.7172545, 0, 0.09411765, 1, 1,
0.3615406, 0.04797976, -0.5607911, 0, 0.08627451, 1, 1,
0.3622023, -1.223296, 3.068749, 0, 0.08235294, 1, 1,
0.3654553, 0.4755543, 1.501327, 0, 0.07450981, 1, 1,
0.3754264, 0.5488328, 0.5145664, 0, 0.07058824, 1, 1,
0.3785647, -0.03559525, 2.346936, 0, 0.0627451, 1, 1,
0.3792457, 2.52381, -0.1588003, 0, 0.05882353, 1, 1,
0.3828614, -1.450749, 2.987162, 0, 0.05098039, 1, 1,
0.384735, -0.1414216, 1.423755, 0, 0.04705882, 1, 1,
0.3870551, 1.363305, -0.9752057, 0, 0.03921569, 1, 1,
0.3906643, -0.8591481, 3.305789, 0, 0.03529412, 1, 1,
0.3910382, -0.5798984, 3.918499, 0, 0.02745098, 1, 1,
0.3930248, -0.7163401, 3.461393, 0, 0.02352941, 1, 1,
0.3940296, 0.6471503, -0.4106071, 0, 0.01568628, 1, 1,
0.3947951, -0.002658172, 2.772558, 0, 0.01176471, 1, 1,
0.3949311, 0.9661695, 0.8537412, 0, 0.003921569, 1, 1,
0.397953, 0.8030004, 0.2661244, 0.003921569, 0, 1, 1,
0.3982163, -2.075168, 1.930266, 0.007843138, 0, 1, 1,
0.3985217, -0.419771, 1.367801, 0.01568628, 0, 1, 1,
0.4034651, 2.039155, -0.9607654, 0.01960784, 0, 1, 1,
0.4034946, 0.809155, -0.8315339, 0.02745098, 0, 1, 1,
0.4065869, 0.5786962, 1.417789, 0.03137255, 0, 1, 1,
0.40794, -0.7009038, 3.436359, 0.03921569, 0, 1, 1,
0.4084673, -0.02538951, 1.541202, 0.04313726, 0, 1, 1,
0.4171441, -0.7014304, 1.754086, 0.05098039, 0, 1, 1,
0.4185716, -1.49499, 2.186921, 0.05490196, 0, 1, 1,
0.4203046, 1.399037, -0.1714646, 0.0627451, 0, 1, 1,
0.4210813, -0.6300439, 2.612147, 0.06666667, 0, 1, 1,
0.4210964, 1.16276, 0.2693118, 0.07450981, 0, 1, 1,
0.4237835, -0.3066095, 3.397689, 0.07843138, 0, 1, 1,
0.4272343, -0.2589489, 2.594824, 0.08627451, 0, 1, 1,
0.4288703, -1.826669, 2.930624, 0.09019608, 0, 1, 1,
0.4345795, -0.8866638, 2.95672, 0.09803922, 0, 1, 1,
0.4356764, 1.072749, 0.5158486, 0.1058824, 0, 1, 1,
0.4400251, -0.04180601, 2.230021, 0.1098039, 0, 1, 1,
0.4401543, 0.9122605, -0.3730986, 0.1176471, 0, 1, 1,
0.4411773, 0.5427598, 0.6044766, 0.1215686, 0, 1, 1,
0.4432591, 0.5492724, 0.8140046, 0.1294118, 0, 1, 1,
0.4438808, -0.3441818, 3.311888, 0.1333333, 0, 1, 1,
0.4465324, -0.9259889, 1.667333, 0.1411765, 0, 1, 1,
0.4494388, 1.788897, 1.445574, 0.145098, 0, 1, 1,
0.4517003, 0.4690184, 0.7156498, 0.1529412, 0, 1, 1,
0.4536832, -0.9174525, 2.331533, 0.1568628, 0, 1, 1,
0.4580005, 0.1103639, 1.761931, 0.1647059, 0, 1, 1,
0.4607404, -0.0620237, 1.182731, 0.1686275, 0, 1, 1,
0.4611393, -0.687799, 2.567826, 0.1764706, 0, 1, 1,
0.4647203, 0.3100762, 1.487983, 0.1803922, 0, 1, 1,
0.4649131, 0.5084471, 1.566532, 0.1882353, 0, 1, 1,
0.4678824, 0.3166184, 1.672042, 0.1921569, 0, 1, 1,
0.469197, -0.7863892, 3.370294, 0.2, 0, 1, 1,
0.4723439, 0.4620072, 1.21568, 0.2078431, 0, 1, 1,
0.4774534, 0.4032542, -1.124803, 0.2117647, 0, 1, 1,
0.4815482, -0.6343428, 1.242861, 0.2196078, 0, 1, 1,
0.4864889, 0.325361, 1.714363, 0.2235294, 0, 1, 1,
0.4879258, -1.369659, 2.770696, 0.2313726, 0, 1, 1,
0.4890375, -0.8618088, 2.939824, 0.2352941, 0, 1, 1,
0.4896347, -0.7889165, 2.381947, 0.2431373, 0, 1, 1,
0.4904372, 0.9846557, -1.244814, 0.2470588, 0, 1, 1,
0.4927007, -1.767284, 2.913973, 0.254902, 0, 1, 1,
0.4934526, 0.5280165, 1.170551, 0.2588235, 0, 1, 1,
0.493941, 1.458923, -1.132853, 0.2666667, 0, 1, 1,
0.494905, 1.656255, -1.067555, 0.2705882, 0, 1, 1,
0.4972988, -0.9297123, 4.052367, 0.2784314, 0, 1, 1,
0.4998443, 1.114283, -0.6309331, 0.282353, 0, 1, 1,
0.4999276, 0.1402537, 0.09059201, 0.2901961, 0, 1, 1,
0.5047509, 0.173788, 1.252115, 0.2941177, 0, 1, 1,
0.5049379, -0.7136782, 3.336491, 0.3019608, 0, 1, 1,
0.5109414, -0.1875402, 1.753389, 0.3098039, 0, 1, 1,
0.5151669, 0.774685, 0.3891747, 0.3137255, 0, 1, 1,
0.5165927, 0.2634428, 0.410873, 0.3215686, 0, 1, 1,
0.5214492, -0.8918559, 3.427832, 0.3254902, 0, 1, 1,
0.5347486, 0.1493309, 1.806483, 0.3333333, 0, 1, 1,
0.5452681, -0.778442, 3.819409, 0.3372549, 0, 1, 1,
0.5465318, 0.08412776, -0.2045186, 0.345098, 0, 1, 1,
0.5477661, -1.478648, 3.041717, 0.3490196, 0, 1, 1,
0.5486636, -0.6390742, 2.771491, 0.3568628, 0, 1, 1,
0.5502425, -1.16871, 2.3515, 0.3607843, 0, 1, 1,
0.5507146, -1.759753, 3.515491, 0.3686275, 0, 1, 1,
0.5541683, -1.414147, 2.491433, 0.372549, 0, 1, 1,
0.557005, 0.4328896, 2.093483, 0.3803922, 0, 1, 1,
0.5571017, 1.184655, 0.7312116, 0.3843137, 0, 1, 1,
0.5599059, 0.3123708, -0.5527219, 0.3921569, 0, 1, 1,
0.5662239, -0.8580206, 3.920853, 0.3960784, 0, 1, 1,
0.5838341, -0.3269614, 4.65065, 0.4039216, 0, 1, 1,
0.5874874, -0.6729185, 2.212481, 0.4117647, 0, 1, 1,
0.5893712, -0.9282236, 3.384728, 0.4156863, 0, 1, 1,
0.5919852, -1.743555, 1.298767, 0.4235294, 0, 1, 1,
0.5931326, 0.9265451, 0.8095523, 0.427451, 0, 1, 1,
0.5948644, 0.3362915, 0.8972198, 0.4352941, 0, 1, 1,
0.5953655, 0.9285497, 0.1036842, 0.4392157, 0, 1, 1,
0.5960541, -1.059496, 3.42657, 0.4470588, 0, 1, 1,
0.6051813, -2.173383, 2.819406, 0.4509804, 0, 1, 1,
0.6055821, 1.18812, 0.7155144, 0.4588235, 0, 1, 1,
0.6065744, -0.5810554, 3.653376, 0.4627451, 0, 1, 1,
0.608121, 0.875434, 1.265148, 0.4705882, 0, 1, 1,
0.6086751, 1.429317, -0.6671297, 0.4745098, 0, 1, 1,
0.6093702, -0.5224391, 2.180617, 0.4823529, 0, 1, 1,
0.6174177, 0.9045123, 1.624804, 0.4862745, 0, 1, 1,
0.6178164, -1.247, 3.598275, 0.4941176, 0, 1, 1,
0.6185421, -2.172908, 3.157491, 0.5019608, 0, 1, 1,
0.6189619, 1.275474, -0.1009961, 0.5058824, 0, 1, 1,
0.6194325, -0.9939476, 1.884836, 0.5137255, 0, 1, 1,
0.6266496, 0.07605946, 0.1769092, 0.5176471, 0, 1, 1,
0.6320609, -1.241877, 3.074434, 0.5254902, 0, 1, 1,
0.6321537, -0.6180205, 4.319112, 0.5294118, 0, 1, 1,
0.6432188, 1.306816, 0.06550338, 0.5372549, 0, 1, 1,
0.6443136, -0.2496021, 1.920161, 0.5411765, 0, 1, 1,
0.6502717, -0.03738852, 0.1624629, 0.5490196, 0, 1, 1,
0.6571451, -1.235219, 3.167603, 0.5529412, 0, 1, 1,
0.6659147, 1.528783, 0.6249934, 0.5607843, 0, 1, 1,
0.6667767, 1.252665, 0.7842827, 0.5647059, 0, 1, 1,
0.6743621, -0.7463815, 3.620214, 0.572549, 0, 1, 1,
0.6744795, -0.4444262, 2.042914, 0.5764706, 0, 1, 1,
0.6862587, -0.7801662, 2.648082, 0.5843138, 0, 1, 1,
0.6874139, -0.7415794, 2.086862, 0.5882353, 0, 1, 1,
0.6885204, 0.05494996, 2.725001, 0.5960785, 0, 1, 1,
0.6913054, 1.511065, -0.6930469, 0.6039216, 0, 1, 1,
0.6928481, 0.04289092, 1.194044, 0.6078432, 0, 1, 1,
0.701997, -0.07427122, 1.285312, 0.6156863, 0, 1, 1,
0.70549, -0.4413717, 2.790934, 0.6196079, 0, 1, 1,
0.706449, 0.3380579, 2.56909, 0.627451, 0, 1, 1,
0.7064805, 1.016287, 0.9331867, 0.6313726, 0, 1, 1,
0.7068784, -0.2547785, 1.195671, 0.6392157, 0, 1, 1,
0.7108052, -1.192509, 3.019567, 0.6431373, 0, 1, 1,
0.7112187, -0.6877249, 2.005683, 0.6509804, 0, 1, 1,
0.7186306, 0.3496499, 0.349759, 0.654902, 0, 1, 1,
0.7213967, -1.437036, 3.517791, 0.6627451, 0, 1, 1,
0.727917, 1.401427, 0.2648784, 0.6666667, 0, 1, 1,
0.7398758, 0.6992912, 1.788474, 0.6745098, 0, 1, 1,
0.7479203, 1.302074, -0.6329516, 0.6784314, 0, 1, 1,
0.7558055, -1.13153, 1.790716, 0.6862745, 0, 1, 1,
0.7584528, 0.08795152, 0.6149625, 0.6901961, 0, 1, 1,
0.7595327, 0.9855212, 0.7723114, 0.6980392, 0, 1, 1,
0.7749681, 0.8143696, 0.3236683, 0.7058824, 0, 1, 1,
0.7756881, 0.2381042, 0.1591615, 0.7098039, 0, 1, 1,
0.7758497, -0.06273828, 1.812613, 0.7176471, 0, 1, 1,
0.7770349, 0.1022048, 2.175958, 0.7215686, 0, 1, 1,
0.7835329, -1.198189, 1.976716, 0.7294118, 0, 1, 1,
0.7855081, -0.03714734, 0.1918175, 0.7333333, 0, 1, 1,
0.7950634, 1.195008, 0.2927225, 0.7411765, 0, 1, 1,
0.7987309, -0.9213251, 2.770398, 0.7450981, 0, 1, 1,
0.8006785, 0.300869, 1.141293, 0.7529412, 0, 1, 1,
0.8012865, -1.22865, 1.937599, 0.7568628, 0, 1, 1,
0.8067228, 2.72849, 0.3251998, 0.7647059, 0, 1, 1,
0.8079381, 1.210493, -1.299584, 0.7686275, 0, 1, 1,
0.8094592, 0.9065713, -0.5981085, 0.7764706, 0, 1, 1,
0.8101607, -1.443498, 2.945598, 0.7803922, 0, 1, 1,
0.8152171, 0.996279, 1.360318, 0.7882353, 0, 1, 1,
0.8198817, 0.7272848, 1.918891, 0.7921569, 0, 1, 1,
0.821157, -0.8630105, 1.621256, 0.8, 0, 1, 1,
0.8227797, -1.412899, 1.69565, 0.8078431, 0, 1, 1,
0.8298964, 0.5137911, 1.863598, 0.8117647, 0, 1, 1,
0.8306091, -0.5302141, 2.70228, 0.8196079, 0, 1, 1,
0.845032, 0.8110746, 1.487914, 0.8235294, 0, 1, 1,
0.846074, 0.3925375, 2.039577, 0.8313726, 0, 1, 1,
0.8478071, 0.6636965, 1.635275, 0.8352941, 0, 1, 1,
0.8550219, -0.08233701, 1.928719, 0.8431373, 0, 1, 1,
0.8588637, 0.07890792, 3.158105, 0.8470588, 0, 1, 1,
0.8673326, 1.851963, 1.41887, 0.854902, 0, 1, 1,
0.8683525, -0.960259, 2.821276, 0.8588235, 0, 1, 1,
0.8709567, -0.4615298, 3.740009, 0.8666667, 0, 1, 1,
0.8711728, -0.2632525, 1.502137, 0.8705882, 0, 1, 1,
0.8733672, -0.6230038, 4.410949, 0.8784314, 0, 1, 1,
0.8810094, 0.1726593, 1.76529, 0.8823529, 0, 1, 1,
0.8852666, 0.7427463, 1.21301, 0.8901961, 0, 1, 1,
0.8865047, -2.13401, 2.623353, 0.8941177, 0, 1, 1,
0.8951297, -0.9499786, 1.635296, 0.9019608, 0, 1, 1,
0.8979964, 0.3110214, 1.282201, 0.9098039, 0, 1, 1,
0.9026898, 0.5692407, 3.067255, 0.9137255, 0, 1, 1,
0.9029054, -0.1478147, 1.008623, 0.9215686, 0, 1, 1,
0.9071245, -0.2506266, -0.212721, 0.9254902, 0, 1, 1,
0.9082422, 0.1358942, 4.01209, 0.9333333, 0, 1, 1,
0.9118215, 0.5423446, 1.370464, 0.9372549, 0, 1, 1,
0.9137949, 0.7160234, 1.493469, 0.945098, 0, 1, 1,
0.9138889, 1.459355, 2.70482, 0.9490196, 0, 1, 1,
0.9202784, -0.8662412, 1.481872, 0.9568627, 0, 1, 1,
0.9238076, -1.027067, 2.201266, 0.9607843, 0, 1, 1,
0.9239137, 1.64509, -0.2708632, 0.9686275, 0, 1, 1,
0.9298632, -0.3638514, 0.7074992, 0.972549, 0, 1, 1,
0.9315834, 0.05819652, 0.4669763, 0.9803922, 0, 1, 1,
0.9539288, 0.2525376, 0.3424223, 0.9843137, 0, 1, 1,
0.9547455, -1.027063, 2.623132, 0.9921569, 0, 1, 1,
0.9593717, -1.288536, 3.417967, 0.9960784, 0, 1, 1,
0.9621642, -1.166057, 2.838173, 1, 0, 0.9960784, 1,
0.9647588, -0.5064642, 2.656544, 1, 0, 0.9882353, 1,
0.9666569, 2.314309, -0.5739795, 1, 0, 0.9843137, 1,
0.9758433, -0.08583789, 1.822069, 1, 0, 0.9764706, 1,
0.9817526, -0.6204947, 0.975702, 1, 0, 0.972549, 1,
0.9875606, -0.1842494, 1.742203, 1, 0, 0.9647059, 1,
0.9901443, -2.162696, 2.834313, 1, 0, 0.9607843, 1,
0.9937162, 0.3168778, 2.50321, 1, 0, 0.9529412, 1,
0.9975836, 0.2025854, 0.3205195, 1, 0, 0.9490196, 1,
0.9977072, 0.286708, 2.504298, 1, 0, 0.9411765, 1,
0.9988565, 0.5087866, 1.71636, 1, 0, 0.9372549, 1,
0.9996008, 0.6894144, 1.370831, 1, 0, 0.9294118, 1,
1.038568, -0.291565, 3.012445, 1, 0, 0.9254902, 1,
1.044558, -0.1666399, 2.076276, 1, 0, 0.9176471, 1,
1.04507, -0.8604116, 2.252238, 1, 0, 0.9137255, 1,
1.046577, -0.2594076, 2.633222, 1, 0, 0.9058824, 1,
1.04907, -1.833589, 4.174276, 1, 0, 0.9019608, 1,
1.058903, -1.584027, 3.144326, 1, 0, 0.8941177, 1,
1.059229, 0.7858418, 0.2826491, 1, 0, 0.8862745, 1,
1.066332, 0.4730114, 1.904228, 1, 0, 0.8823529, 1,
1.073976, 0.5819441, 2.541588, 1, 0, 0.8745098, 1,
1.077194, -1.14929, 1.627083, 1, 0, 0.8705882, 1,
1.084145, -0.717778, 1.915195, 1, 0, 0.8627451, 1,
1.084286, 0.4727595, 0.09962928, 1, 0, 0.8588235, 1,
1.090995, 1.220098, 2.704629, 1, 0, 0.8509804, 1,
1.093797, -0.7016956, 3.559888, 1, 0, 0.8470588, 1,
1.095855, 1.242137, 1.293987, 1, 0, 0.8392157, 1,
1.098288, 0.1887653, 0.885024, 1, 0, 0.8352941, 1,
1.099268, -0.2852712, 2.483465, 1, 0, 0.827451, 1,
1.099281, 0.6764372, 0.4865845, 1, 0, 0.8235294, 1,
1.101008, 0.6761659, 1.540199, 1, 0, 0.8156863, 1,
1.106294, 0.4776998, -1.172713, 1, 0, 0.8117647, 1,
1.107738, 1.519201, 0.1752986, 1, 0, 0.8039216, 1,
1.113359, 0.173658, 1.733022, 1, 0, 0.7960784, 1,
1.123334, -0.3379631, 1.959723, 1, 0, 0.7921569, 1,
1.12422, -1.52059, 2.664655, 1, 0, 0.7843137, 1,
1.129181, -0.1259663, 1.408231, 1, 0, 0.7803922, 1,
1.129934, 0.4885084, -1.377268, 1, 0, 0.772549, 1,
1.133387, -0.304274, 0.9259941, 1, 0, 0.7686275, 1,
1.135032, -0.4775899, 1.45465, 1, 0, 0.7607843, 1,
1.137685, 0.9994945, 2.200528, 1, 0, 0.7568628, 1,
1.143761, -0.06700388, -0.4212881, 1, 0, 0.7490196, 1,
1.14615, 0.4534572, 1.358519, 1, 0, 0.7450981, 1,
1.147385, 2.162729, 0.7662289, 1, 0, 0.7372549, 1,
1.14798, 1.069528, 0.5488029, 1, 0, 0.7333333, 1,
1.160482, -1.046117, 0.5331067, 1, 0, 0.7254902, 1,
1.165106, -0.03771631, 1.241667, 1, 0, 0.7215686, 1,
1.167403, -1.070259, 2.214727, 1, 0, 0.7137255, 1,
1.168634, 1.015207, 1.582287, 1, 0, 0.7098039, 1,
1.169025, 0.5531235, 0.02267614, 1, 0, 0.7019608, 1,
1.173495, 0.5860152, 0.2844991, 1, 0, 0.6941177, 1,
1.173824, -0.2911516, 1.711042, 1, 0, 0.6901961, 1,
1.181058, -0.1945129, 1.108781, 1, 0, 0.682353, 1,
1.195197, -1.699716, 1.796739, 1, 0, 0.6784314, 1,
1.202011, 0.3968769, 2.216524, 1, 0, 0.6705883, 1,
1.209927, -0.7802727, 1.77891, 1, 0, 0.6666667, 1,
1.210668, -1.254918, 2.879624, 1, 0, 0.6588235, 1,
1.223339, -0.6567339, 2.845782, 1, 0, 0.654902, 1,
1.231816, 1.002003, 1.425769, 1, 0, 0.6470588, 1,
1.235996, -0.2633423, 1.239085, 1, 0, 0.6431373, 1,
1.240836, 0.4778311, 2.0132, 1, 0, 0.6352941, 1,
1.241269, 1.669378, 1.893425, 1, 0, 0.6313726, 1,
1.242337, -0.5672878, 3.443705, 1, 0, 0.6235294, 1,
1.243973, 0.3258691, 1.087349, 1, 0, 0.6196079, 1,
1.247022, 1.471816, 0.9156818, 1, 0, 0.6117647, 1,
1.248172, 1.112655, 2.469867, 1, 0, 0.6078432, 1,
1.249147, -0.2122526, 1.46208, 1, 0, 0.6, 1,
1.255397, 1.923445, 0.481848, 1, 0, 0.5921569, 1,
1.257297, -0.101704, 2.061093, 1, 0, 0.5882353, 1,
1.26589, -0.3462302, 1.717476, 1, 0, 0.5803922, 1,
1.272444, 0.7699805, 1.690709, 1, 0, 0.5764706, 1,
1.272655, -0.1013794, 1.041194, 1, 0, 0.5686275, 1,
1.275889, -0.4253184, 2.727732, 1, 0, 0.5647059, 1,
1.277877, -0.5726781, 0.6674529, 1, 0, 0.5568628, 1,
1.278994, -0.8397959, 1.92399, 1, 0, 0.5529412, 1,
1.279282, 0.07496507, 2.060592, 1, 0, 0.5450981, 1,
1.281634, -2.160018, 1.928994, 1, 0, 0.5411765, 1,
1.294287, 1.297061, 0.01418539, 1, 0, 0.5333334, 1,
1.310314, -0.60099, 1.707199, 1, 0, 0.5294118, 1,
1.324272, -1.258224, 2.655628, 1, 0, 0.5215687, 1,
1.32693, -1.765343, 2.870137, 1, 0, 0.5176471, 1,
1.327447, 1.922779, -0.8111085, 1, 0, 0.509804, 1,
1.32909, -0.2892298, 3.03459, 1, 0, 0.5058824, 1,
1.340657, 1.685809, 0.9269013, 1, 0, 0.4980392, 1,
1.342743, -0.3760812, 0.8213948, 1, 0, 0.4901961, 1,
1.375673, 0.2025294, 3.485119, 1, 0, 0.4862745, 1,
1.380385, 0.8671085, -0.8716373, 1, 0, 0.4784314, 1,
1.382225, 0.808379, 2.000143, 1, 0, 0.4745098, 1,
1.398675, 0.239875, -0.5565564, 1, 0, 0.4666667, 1,
1.404019, 0.5599124, 2.394376, 1, 0, 0.4627451, 1,
1.410919, 1.266665, -0.7171058, 1, 0, 0.454902, 1,
1.414954, 0.9362589, 1.516589, 1, 0, 0.4509804, 1,
1.432445, 2.892517, 0.01444257, 1, 0, 0.4431373, 1,
1.439464, -0.1650847, 1.417874, 1, 0, 0.4392157, 1,
1.453849, 1.386001, 0.5091144, 1, 0, 0.4313726, 1,
1.470786, -0.8701187, 2.328821, 1, 0, 0.427451, 1,
1.4784, -0.05379555, 2.208651, 1, 0, 0.4196078, 1,
1.484988, -0.588877, 1.018174, 1, 0, 0.4156863, 1,
1.486401, -0.2255072, 1.288484, 1, 0, 0.4078431, 1,
1.521344, 0.2272063, 2.761187, 1, 0, 0.4039216, 1,
1.523689, 0.2852278, 1.147261, 1, 0, 0.3960784, 1,
1.535981, 0.4439143, 0.9826913, 1, 0, 0.3882353, 1,
1.538959, 0.6750001, 1.692466, 1, 0, 0.3843137, 1,
1.548107, 1.58136, 0.6926704, 1, 0, 0.3764706, 1,
1.548493, 0.6683708, 0.7552629, 1, 0, 0.372549, 1,
1.550279, -0.5596142, 3.389507, 1, 0, 0.3647059, 1,
1.55161, -0.1970493, 1.474606, 1, 0, 0.3607843, 1,
1.564421, -0.34569, 0.7272409, 1, 0, 0.3529412, 1,
1.594072, -0.6158327, 1.770466, 1, 0, 0.3490196, 1,
1.594852, -0.2731714, 1.144738, 1, 0, 0.3411765, 1,
1.611756, 1.492904, -0.1782019, 1, 0, 0.3372549, 1,
1.625432, 1.382214, -0.2451426, 1, 0, 0.3294118, 1,
1.626696, 0.4009676, 2.393545, 1, 0, 0.3254902, 1,
1.629378, -0.468541, 0.9016086, 1, 0, 0.3176471, 1,
1.631139, -0.4089965, -0.1574269, 1, 0, 0.3137255, 1,
1.638249, -0.2112161, 3.043685, 1, 0, 0.3058824, 1,
1.64832, -0.8679268, 4.056952, 1, 0, 0.2980392, 1,
1.652108, -0.9105054, 0.7773424, 1, 0, 0.2941177, 1,
1.658802, -0.3892922, 2.282784, 1, 0, 0.2862745, 1,
1.666098, -0.7514851, 0.3581826, 1, 0, 0.282353, 1,
1.672565, -0.1749266, 0.7702957, 1, 0, 0.2745098, 1,
1.705924, 0.6979744, 1.080544, 1, 0, 0.2705882, 1,
1.719079, -0.3859767, 1.174882, 1, 0, 0.2627451, 1,
1.733896, 0.1001094, 1.64734, 1, 0, 0.2588235, 1,
1.7694, 0.01171383, 1.650997, 1, 0, 0.2509804, 1,
1.772592, 0.8118297, 1.132974, 1, 0, 0.2470588, 1,
1.774381, 0.1841903, 1.453586, 1, 0, 0.2392157, 1,
1.775268, 1.183533, 1.397307, 1, 0, 0.2352941, 1,
1.797118, 1.139984, 0.308304, 1, 0, 0.227451, 1,
1.799588, -0.469224, 1.566639, 1, 0, 0.2235294, 1,
1.812295, 0.561609, 1.085463, 1, 0, 0.2156863, 1,
1.843948, 0.5742772, 0.4907654, 1, 0, 0.2117647, 1,
1.850138, -0.3240136, 2.714501, 1, 0, 0.2039216, 1,
1.851134, -0.1037638, 1.417741, 1, 0, 0.1960784, 1,
1.85139, 2.043789, 1.530802, 1, 0, 0.1921569, 1,
1.877466, 0.7678749, 0.9622545, 1, 0, 0.1843137, 1,
1.89726, 1.915606, 0.2993711, 1, 0, 0.1803922, 1,
1.909531, -1.356293, 0.2265559, 1, 0, 0.172549, 1,
1.914557, -0.8760153, 1.955173, 1, 0, 0.1686275, 1,
1.918226, -0.2843332, 1.270404, 1, 0, 0.1607843, 1,
1.929265, -0.6880721, 3.142249, 1, 0, 0.1568628, 1,
1.938879, -0.05156407, 2.572143, 1, 0, 0.1490196, 1,
1.94379, -1.428978, 2.524068, 1, 0, 0.145098, 1,
1.966423, -0.2990122, 0.4227377, 1, 0, 0.1372549, 1,
1.967617, 0.1444036, 0.9176033, 1, 0, 0.1333333, 1,
1.972039, -0.7411448, 3.885012, 1, 0, 0.1254902, 1,
1.992907, -1.602704, 2.650436, 1, 0, 0.1215686, 1,
1.996163, -0.09723046, 1.344459, 1, 0, 0.1137255, 1,
1.998106, -0.6703272, 1.93691, 1, 0, 0.1098039, 1,
2.069731, -0.4328542, 0.1220232, 1, 0, 0.1019608, 1,
2.086775, 1.969894, 0.4974123, 1, 0, 0.09411765, 1,
2.091596, -0.1559344, 1.699358, 1, 0, 0.09019608, 1,
2.166122, -0.9744943, 2.096342, 1, 0, 0.08235294, 1,
2.200518, 0.5471632, 1.136548, 1, 0, 0.07843138, 1,
2.21558, 0.1348929, -0.04712953, 1, 0, 0.07058824, 1,
2.237526, -0.5250223, 1.112082, 1, 0, 0.06666667, 1,
2.250302, 0.5654203, 1.951049, 1, 0, 0.05882353, 1,
2.281575, -0.8368688, 0.7310129, 1, 0, 0.05490196, 1,
2.32661, -1.329331, 1.663608, 1, 0, 0.04705882, 1,
2.326832, 0.7783395, 2.265672, 1, 0, 0.04313726, 1,
2.364487, 0.02810614, 2.301455, 1, 0, 0.03529412, 1,
2.448184, -0.3427648, 0.7871137, 1, 0, 0.03137255, 1,
2.468329, -0.5774977, 2.599088, 1, 0, 0.02352941, 1,
2.515426, -0.08208707, 1.155116, 1, 0, 0.01960784, 1,
2.64566, 0.8937467, 1.349334, 1, 0, 0.01176471, 1,
2.874276, -0.03087424, 2.556433, 1, 0, 0.007843138, 1
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
-0.1528045, -4.819169, -7.239331, 0, -0.5, 0.5, 0.5,
-0.1528045, -4.819169, -7.239331, 1, -0.5, 0.5, 0.5,
-0.1528045, -4.819169, -7.239331, 1, 1.5, 0.5, 0.5,
-0.1528045, -4.819169, -7.239331, 0, 1.5, 0.5, 0.5
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
-4.206065, -0.1054593, -7.239331, 0, -0.5, 0.5, 0.5,
-4.206065, -0.1054593, -7.239331, 1, -0.5, 0.5, 0.5,
-4.206065, -0.1054593, -7.239331, 1, 1.5, 0.5, 0.5,
-4.206065, -0.1054593, -7.239331, 0, 1.5, 0.5, 0.5
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
-4.206065, -4.819169, 0.09531975, 0, -0.5, 0.5, 0.5,
-4.206065, -4.819169, 0.09531975, 1, -0.5, 0.5, 0.5,
-4.206065, -4.819169, 0.09531975, 1, 1.5, 0.5, 0.5,
-4.206065, -4.819169, 0.09531975, 0, 1.5, 0.5, 0.5
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
-3, -3.73139, -5.54672,
2, -3.73139, -5.54672,
-3, -3.73139, -5.54672,
-3, -3.912686, -5.828821,
-2, -3.73139, -5.54672,
-2, -3.912686, -5.828821,
-1, -3.73139, -5.54672,
-1, -3.912686, -5.828821,
0, -3.73139, -5.54672,
0, -3.912686, -5.828821,
1, -3.73139, -5.54672,
1, -3.912686, -5.828821,
2, -3.73139, -5.54672,
2, -3.912686, -5.828821
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
-3, -4.275279, -6.393025, 0, -0.5, 0.5, 0.5,
-3, -4.275279, -6.393025, 1, -0.5, 0.5, 0.5,
-3, -4.275279, -6.393025, 1, 1.5, 0.5, 0.5,
-3, -4.275279, -6.393025, 0, 1.5, 0.5, 0.5,
-2, -4.275279, -6.393025, 0, -0.5, 0.5, 0.5,
-2, -4.275279, -6.393025, 1, -0.5, 0.5, 0.5,
-2, -4.275279, -6.393025, 1, 1.5, 0.5, 0.5,
-2, -4.275279, -6.393025, 0, 1.5, 0.5, 0.5,
-1, -4.275279, -6.393025, 0, -0.5, 0.5, 0.5,
-1, -4.275279, -6.393025, 1, -0.5, 0.5, 0.5,
-1, -4.275279, -6.393025, 1, 1.5, 0.5, 0.5,
-1, -4.275279, -6.393025, 0, 1.5, 0.5, 0.5,
0, -4.275279, -6.393025, 0, -0.5, 0.5, 0.5,
0, -4.275279, -6.393025, 1, -0.5, 0.5, 0.5,
0, -4.275279, -6.393025, 1, 1.5, 0.5, 0.5,
0, -4.275279, -6.393025, 0, 1.5, 0.5, 0.5,
1, -4.275279, -6.393025, 0, -0.5, 0.5, 0.5,
1, -4.275279, -6.393025, 1, -0.5, 0.5, 0.5,
1, -4.275279, -6.393025, 1, 1.5, 0.5, 0.5,
1, -4.275279, -6.393025, 0, 1.5, 0.5, 0.5,
2, -4.275279, -6.393025, 0, -0.5, 0.5, 0.5,
2, -4.275279, -6.393025, 1, -0.5, 0.5, 0.5,
2, -4.275279, -6.393025, 1, 1.5, 0.5, 0.5,
2, -4.275279, -6.393025, 0, 1.5, 0.5, 0.5
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
-3.270697, -2, -5.54672,
-3.270697, 2, -5.54672,
-3.270697, -2, -5.54672,
-3.426592, -2, -5.828821,
-3.270697, 0, -5.54672,
-3.426592, 0, -5.828821,
-3.270697, 2, -5.54672,
-3.426592, 2, -5.828821
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
-3.738381, -2, -6.393025, 0, -0.5, 0.5, 0.5,
-3.738381, -2, -6.393025, 1, -0.5, 0.5, 0.5,
-3.738381, -2, -6.393025, 1, 1.5, 0.5, 0.5,
-3.738381, -2, -6.393025, 0, 1.5, 0.5, 0.5,
-3.738381, 0, -6.393025, 0, -0.5, 0.5, 0.5,
-3.738381, 0, -6.393025, 1, -0.5, 0.5, 0.5,
-3.738381, 0, -6.393025, 1, 1.5, 0.5, 0.5,
-3.738381, 0, -6.393025, 0, 1.5, 0.5, 0.5,
-3.738381, 2, -6.393025, 0, -0.5, 0.5, 0.5,
-3.738381, 2, -6.393025, 1, -0.5, 0.5, 0.5,
-3.738381, 2, -6.393025, 1, 1.5, 0.5, 0.5,
-3.738381, 2, -6.393025, 0, 1.5, 0.5, 0.5
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
-3.270697, -3.73139, -4,
-3.270697, -3.73139, 4,
-3.270697, -3.73139, -4,
-3.426592, -3.912686, -4,
-3.270697, -3.73139, -2,
-3.426592, -3.912686, -2,
-3.270697, -3.73139, 0,
-3.426592, -3.912686, 0,
-3.270697, -3.73139, 2,
-3.426592, -3.912686, 2,
-3.270697, -3.73139, 4,
-3.426592, -3.912686, 4
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
-3.738381, -4.275279, -4, 0, -0.5, 0.5, 0.5,
-3.738381, -4.275279, -4, 1, -0.5, 0.5, 0.5,
-3.738381, -4.275279, -4, 1, 1.5, 0.5, 0.5,
-3.738381, -4.275279, -4, 0, 1.5, 0.5, 0.5,
-3.738381, -4.275279, -2, 0, -0.5, 0.5, 0.5,
-3.738381, -4.275279, -2, 1, -0.5, 0.5, 0.5,
-3.738381, -4.275279, -2, 1, 1.5, 0.5, 0.5,
-3.738381, -4.275279, -2, 0, 1.5, 0.5, 0.5,
-3.738381, -4.275279, 0, 0, -0.5, 0.5, 0.5,
-3.738381, -4.275279, 0, 1, -0.5, 0.5, 0.5,
-3.738381, -4.275279, 0, 1, 1.5, 0.5, 0.5,
-3.738381, -4.275279, 0, 0, 1.5, 0.5, 0.5,
-3.738381, -4.275279, 2, 0, -0.5, 0.5, 0.5,
-3.738381, -4.275279, 2, 1, -0.5, 0.5, 0.5,
-3.738381, -4.275279, 2, 1, 1.5, 0.5, 0.5,
-3.738381, -4.275279, 2, 0, 1.5, 0.5, 0.5,
-3.738381, -4.275279, 4, 0, -0.5, 0.5, 0.5,
-3.738381, -4.275279, 4, 1, -0.5, 0.5, 0.5,
-3.738381, -4.275279, 4, 1, 1.5, 0.5, 0.5,
-3.738381, -4.275279, 4, 0, 1.5, 0.5, 0.5
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
-3.270697, -3.73139, -5.54672,
-3.270697, 3.520471, -5.54672,
-3.270697, -3.73139, 5.737359,
-3.270697, 3.520471, 5.737359,
-3.270697, -3.73139, -5.54672,
-3.270697, -3.73139, 5.737359,
-3.270697, 3.520471, -5.54672,
-3.270697, 3.520471, 5.737359,
-3.270697, -3.73139, -5.54672,
2.965088, -3.73139, -5.54672,
-3.270697, -3.73139, 5.737359,
2.965088, -3.73139, 5.737359,
-3.270697, 3.520471, -5.54672,
2.965088, 3.520471, -5.54672,
-3.270697, 3.520471, 5.737359,
2.965088, 3.520471, 5.737359,
2.965088, -3.73139, -5.54672,
2.965088, 3.520471, -5.54672,
2.965088, -3.73139, 5.737359,
2.965088, 3.520471, 5.737359,
2.965088, -3.73139, -5.54672,
2.965088, -3.73139, 5.737359,
2.965088, 3.520471, -5.54672,
2.965088, 3.520471, 5.737359
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
var radius = 7.89867;
var distance = 35.14208;
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
mvMatrix.translate( 0.1528045, 0.1054593, -0.09531975 );
mvMatrix.scale( 1.369546, 1.177656, 0.7568361 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.14208);
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
carbonate<-read.table("carbonate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carbonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'carbonate' not found
```

```r
y<-carbonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'carbonate' not found
```

```r
z<-carbonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'carbonate' not found
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
-3.179885, 2.569483, 0.03576896, 0, 0, 1, 1, 1,
-3.086112, 0.1814694, -2.557444, 1, 0, 0, 1, 1,
-3.045274, -0.5035908, -2.225467, 1, 0, 0, 1, 1,
-2.941793, -0.9487005, -2.347166, 1, 0, 0, 1, 1,
-2.737034, 0.3737825, -1.640399, 1, 0, 0, 1, 1,
-2.723366, -1.512585, -1.823543, 1, 0, 0, 1, 1,
-2.689206, -1.27122, -0.9565644, 0, 0, 0, 1, 1,
-2.646744, -0.1017924, -1.836302, 0, 0, 0, 1, 1,
-2.556925, 0.6676376, 0.02890453, 0, 0, 0, 1, 1,
-2.543242, 0.9711245, -1.26603, 0, 0, 0, 1, 1,
-2.525985, -0.5030003, -2.870294, 0, 0, 0, 1, 1,
-2.437902, -0.4834813, -1.149336, 0, 0, 0, 1, 1,
-2.364022, 0.643097, -0.9916281, 0, 0, 0, 1, 1,
-2.330302, 1.221945, -1.831486, 1, 1, 1, 1, 1,
-2.218297, -1.561269, -2.476123, 1, 1, 1, 1, 1,
-2.207494, -0.7835906, -2.637671, 1, 1, 1, 1, 1,
-2.150485, 0.4328875, -0.5140046, 1, 1, 1, 1, 1,
-2.135669, -3.18602, -2.98578, 1, 1, 1, 1, 1,
-2.0898, 2.153606, -1.012119, 1, 1, 1, 1, 1,
-2.087642, 0.7873346, -1.738757, 1, 1, 1, 1, 1,
-2.087128, 0.7013978, -1.295439, 1, 1, 1, 1, 1,
-2.081149, -0.9214705, -0.6935868, 1, 1, 1, 1, 1,
-2.042323, 1.107117, -2.123032, 1, 1, 1, 1, 1,
-2.035489, 0.1368585, -3.489509, 1, 1, 1, 1, 1,
-2.027929, -1.106479, -1.77798, 1, 1, 1, 1, 1,
-1.992796, 0.1987394, -1.438175, 1, 1, 1, 1, 1,
-1.988813, -0.7138416, -0.006772047, 1, 1, 1, 1, 1,
-1.977471, 0.3550697, -1.446628, 1, 1, 1, 1, 1,
-1.944758, -0.2530796, -2.312603, 0, 0, 1, 1, 1,
-1.921225, 0.190542, -1.864338, 1, 0, 0, 1, 1,
-1.91424, 0.446454, -2.399676, 1, 0, 0, 1, 1,
-1.8907, 0.9910712, -1.012677, 1, 0, 0, 1, 1,
-1.890396, 0.4102165, -1.237676, 1, 0, 0, 1, 1,
-1.870005, -1.88171, -2.312982, 1, 0, 0, 1, 1,
-1.861327, -1.229315, -2.987156, 0, 0, 0, 1, 1,
-1.843459, 2.23819, 0.2538355, 0, 0, 0, 1, 1,
-1.817906, 1.027661, -0.7296653, 0, 0, 0, 1, 1,
-1.809066, 0.8617192, 0.1256741, 0, 0, 0, 1, 1,
-1.807408, -0.3320499, -1.348788, 0, 0, 0, 1, 1,
-1.784855, 1.1327, -1.114664, 0, 0, 0, 1, 1,
-1.767977, -0.7512857, -3.14336, 0, 0, 0, 1, 1,
-1.740707, -1.252552, -1.779636, 1, 1, 1, 1, 1,
-1.740321, 0.3195188, -1.066239, 1, 1, 1, 1, 1,
-1.706173, 0.3433914, -1.184907, 1, 1, 1, 1, 1,
-1.697658, 0.4844517, -1.229378, 1, 1, 1, 1, 1,
-1.686793, 1.514, -0.7991054, 1, 1, 1, 1, 1,
-1.666939, -0.4870482, -1.724517, 1, 1, 1, 1, 1,
-1.664617, -0.4892763, -0.8888958, 1, 1, 1, 1, 1,
-1.658255, 0.205421, -2.373295, 1, 1, 1, 1, 1,
-1.644109, 0.7124068, 1.300048, 1, 1, 1, 1, 1,
-1.638686, 0.5611448, -2.410532, 1, 1, 1, 1, 1,
-1.615225, -0.6623225, -3.023919, 1, 1, 1, 1, 1,
-1.612608, 0.1834601, -1.084037, 1, 1, 1, 1, 1,
-1.583386, -0.6460613, -1.235954, 1, 1, 1, 1, 1,
-1.580789, 0.0164133, -1.314312, 1, 1, 1, 1, 1,
-1.577775, -1.468017, -1.3289, 1, 1, 1, 1, 1,
-1.577373, -0.2620543, -2.270797, 0, 0, 1, 1, 1,
-1.572811, -0.9968185, -2.314717, 1, 0, 0, 1, 1,
-1.571105, 0.796333, -0.8459235, 1, 0, 0, 1, 1,
-1.563009, 0.0386386, -1.074847, 1, 0, 0, 1, 1,
-1.560154, 0.3531237, -3.83577, 1, 0, 0, 1, 1,
-1.540215, 0.8355799, -1.641921, 1, 0, 0, 1, 1,
-1.535603, 1.144067, -0.187882, 0, 0, 0, 1, 1,
-1.520254, -0.4404299, -1.775417, 0, 0, 0, 1, 1,
-1.517484, 0.2201196, -1.528443, 0, 0, 0, 1, 1,
-1.515087, 0.00672191, -2.563239, 0, 0, 0, 1, 1,
-1.507242, -1.29725, -1.880224, 0, 0, 0, 1, 1,
-1.505814, 0.6066023, -3.28134, 0, 0, 0, 1, 1,
-1.499166, 1.642492, 0.7021536, 0, 0, 0, 1, 1,
-1.493779, -1.255219, -0.7673211, 1, 1, 1, 1, 1,
-1.486727, 0.7634049, -1.022164, 1, 1, 1, 1, 1,
-1.483822, -1.946547, -0.4976356, 1, 1, 1, 1, 1,
-1.480083, 1.075109, -1.285636, 1, 1, 1, 1, 1,
-1.45421, -0.3770387, -2.043552, 1, 1, 1, 1, 1,
-1.436933, 0.8071002, -0.01034218, 1, 1, 1, 1, 1,
-1.435107, -0.8038918, -3.664222, 1, 1, 1, 1, 1,
-1.432488, -0.1026661, -1.431334, 1, 1, 1, 1, 1,
-1.408125, 1.116006, -0.2234534, 1, 1, 1, 1, 1,
-1.402771, -0.3784953, -3.741729, 1, 1, 1, 1, 1,
-1.385925, -1.634584, -2.696188, 1, 1, 1, 1, 1,
-1.384367, -0.4915027, -2.728269, 1, 1, 1, 1, 1,
-1.38261, 0.6123909, -3.152044, 1, 1, 1, 1, 1,
-1.38176, 0.3722482, -1.754184, 1, 1, 1, 1, 1,
-1.374963, 0.7404204, -2.047269, 1, 1, 1, 1, 1,
-1.374273, 1.597958, -0.6047824, 0, 0, 1, 1, 1,
-1.366107, -0.8947566, -3.956421, 1, 0, 0, 1, 1,
-1.364675, -0.70415, -3.338277, 1, 0, 0, 1, 1,
-1.362561, 0.04197271, 0.6010901, 1, 0, 0, 1, 1,
-1.361958, 1.255334, -0.2329711, 1, 0, 0, 1, 1,
-1.361796, 0.09234603, -3.678796, 1, 0, 0, 1, 1,
-1.329822, 0.1618542, -2.15843, 0, 0, 0, 1, 1,
-1.321468, -0.3586603, -2.309364, 0, 0, 0, 1, 1,
-1.318468, 0.6347202, -1.26843, 0, 0, 0, 1, 1,
-1.314661, -2.095567, -3.725134, 0, 0, 0, 1, 1,
-1.301898, -0.3173838, -2.423551, 0, 0, 0, 1, 1,
-1.298735, 0.4716859, -0.3934555, 0, 0, 0, 1, 1,
-1.288529, -1.843009, -2.663606, 0, 0, 0, 1, 1,
-1.285011, 0.3424913, 0.4890834, 1, 1, 1, 1, 1,
-1.278232, 0.1864413, -2.374901, 1, 1, 1, 1, 1,
-1.263403, -1.178248, -1.48826, 1, 1, 1, 1, 1,
-1.262868, -1.113925, -3.008011, 1, 1, 1, 1, 1,
-1.258115, 0.9452506, -0.9195132, 1, 1, 1, 1, 1,
-1.242915, 1.045116, 0.2572385, 1, 1, 1, 1, 1,
-1.23645, -0.486463, -1.288515, 1, 1, 1, 1, 1,
-1.235048, 0.973887, -3.246472, 1, 1, 1, 1, 1,
-1.234315, 1.245975, 0.5593312, 1, 1, 1, 1, 1,
-1.210604, 0.2263618, -2.171072, 1, 1, 1, 1, 1,
-1.209285, 1.025002, -1.252044, 1, 1, 1, 1, 1,
-1.20802, 0.4143634, -1.186769, 1, 1, 1, 1, 1,
-1.207576, 0.8068263, -1.823959, 1, 1, 1, 1, 1,
-1.194048, 0.1597955, -4.147858, 1, 1, 1, 1, 1,
-1.190189, 1.317251, 0.8683943, 1, 1, 1, 1, 1,
-1.182126, 0.5365983, -1.025487, 0, 0, 1, 1, 1,
-1.180349, 0.4940631, -2.709488, 1, 0, 0, 1, 1,
-1.177548, -1.356907, -2.410821, 1, 0, 0, 1, 1,
-1.171434, -0.3582596, -2.569513, 1, 0, 0, 1, 1,
-1.169198, -1.157841, -3.102677, 1, 0, 0, 1, 1,
-1.154683, -1.270352, -2.92919, 1, 0, 0, 1, 1,
-1.153566, -0.139493, -2.433162, 0, 0, 0, 1, 1,
-1.135962, 0.7647165, -0.4468496, 0, 0, 0, 1, 1,
-1.133462, 2.070785, -1.317686, 0, 0, 0, 1, 1,
-1.130289, 0.5165408, -0.168484, 0, 0, 0, 1, 1,
-1.110716, 0.4150166, -0.3826201, 0, 0, 0, 1, 1,
-1.105077, 0.5550429, -0.1228953, 0, 0, 0, 1, 1,
-1.099928, -1.038835, -2.203557, 0, 0, 0, 1, 1,
-1.096008, 1.957211, -1.49885, 1, 1, 1, 1, 1,
-1.090269, 0.1617324, -1.903004, 1, 1, 1, 1, 1,
-1.090187, -0.2054076, 0.1395001, 1, 1, 1, 1, 1,
-1.087575, -0.4102512, -1.208042, 1, 1, 1, 1, 1,
-1.082029, 0.7212462, -2.207982, 1, 1, 1, 1, 1,
-1.078753, 0.3106255, -0.01866259, 1, 1, 1, 1, 1,
-1.077735, 0.6546662, -1.148594, 1, 1, 1, 1, 1,
-1.073705, -0.4569179, -2.500182, 1, 1, 1, 1, 1,
-1.071941, -3.200336, -3.235731, 1, 1, 1, 1, 1,
-1.066855, -0.4301279, -0.8235514, 1, 1, 1, 1, 1,
-1.06048, -0.2885049, -0.6745708, 1, 1, 1, 1, 1,
-1.060107, -0.807651, -3.933456, 1, 1, 1, 1, 1,
-1.059722, -0.8230674, -3.237183, 1, 1, 1, 1, 1,
-1.059018, 0.8004028, -0.503713, 1, 1, 1, 1, 1,
-1.059001, 0.618363, -1.766157, 1, 1, 1, 1, 1,
-1.055785, 1.846899, 0.2127665, 0, 0, 1, 1, 1,
-1.046513, -0.6770299, -1.881654, 1, 0, 0, 1, 1,
-1.041646, 0.5060009, -0.8411089, 1, 0, 0, 1, 1,
-1.038941, 0.7315215, -0.1022977, 1, 0, 0, 1, 1,
-1.028908, -0.643994, -2.997755, 1, 0, 0, 1, 1,
-1.028148, -0.5187862, -1.271308, 1, 0, 0, 1, 1,
-1.021771, 0.6922194, -1.197125, 0, 0, 0, 1, 1,
-1.017895, -1.47198, -3.169251, 0, 0, 0, 1, 1,
-1.017568, -0.5739212, -0.9911588, 0, 0, 0, 1, 1,
-1.013185, -1.276556, 0.1708723, 0, 0, 0, 1, 1,
-1.005539, -0.4268747, -2.36523, 0, 0, 0, 1, 1,
-1.004531, -0.3621481, -3.084815, 0, 0, 0, 1, 1,
-0.9970099, -0.7515075, -2.067475, 0, 0, 0, 1, 1,
-0.9936459, -1.765926, -5.382388, 1, 1, 1, 1, 1,
-0.9858756, 1.034962, -0.9800904, 1, 1, 1, 1, 1,
-0.983937, 0.2138013, -1.549208, 1, 1, 1, 1, 1,
-0.9776782, -0.8989398, -1.372567, 1, 1, 1, 1, 1,
-0.9770024, -1.341314, -0.7320119, 1, 1, 1, 1, 1,
-0.9737773, -0.2338863, -1.57788, 1, 1, 1, 1, 1,
-0.9701211, -1.761292, -2.391649, 1, 1, 1, 1, 1,
-0.962854, 0.8906119, -1.367705, 1, 1, 1, 1, 1,
-0.9577041, -0.3474966, -2.010807, 1, 1, 1, 1, 1,
-0.9545486, 0.1470659, -0.9673061, 1, 1, 1, 1, 1,
-0.9524796, -0.8125479, -3.121083, 1, 1, 1, 1, 1,
-0.9509298, 1.220676, 1.529426, 1, 1, 1, 1, 1,
-0.9502906, -0.1892091, -1.051577, 1, 1, 1, 1, 1,
-0.9432548, 0.05417102, -1.95751, 1, 1, 1, 1, 1,
-0.941514, 0.9297718, 0.8176745, 1, 1, 1, 1, 1,
-0.9165496, 0.1705345, -1.911839, 0, 0, 1, 1, 1,
-0.9161119, -0.7836458, -2.608868, 1, 0, 0, 1, 1,
-0.9134381, -0.4257167, -1.794827, 1, 0, 0, 1, 1,
-0.9128134, 0.776205, -1.585098, 1, 0, 0, 1, 1,
-0.91167, -1.678393, -1.882145, 1, 0, 0, 1, 1,
-0.9116218, -1.343528, -1.148753, 1, 0, 0, 1, 1,
-0.9090034, -0.8537953, -0.4740012, 0, 0, 0, 1, 1,
-0.9079306, 0.9102302, 0.7773723, 0, 0, 0, 1, 1,
-0.9002604, 1.259747, 1.736745, 0, 0, 0, 1, 1,
-0.8972648, 0.4166222, -1.02872, 0, 0, 0, 1, 1,
-0.8932959, -0.2881523, -0.8400822, 0, 0, 0, 1, 1,
-0.8916674, -0.2545442, -1.8835, 0, 0, 0, 1, 1,
-0.8885288, -0.722384, -4.28228, 0, 0, 0, 1, 1,
-0.8884051, -0.9854072, -1.402633, 1, 1, 1, 1, 1,
-0.8879377, 0.6521907, -2.116702, 1, 1, 1, 1, 1,
-0.8870057, 0.2470188, -0.6717153, 1, 1, 1, 1, 1,
-0.8716269, 0.5200545, -1.002049, 1, 1, 1, 1, 1,
-0.8715036, 0.1656927, -0.5900328, 1, 1, 1, 1, 1,
-0.8696817, 0.1642598, -2.349735, 1, 1, 1, 1, 1,
-0.8692983, -0.583903, -1.37682, 1, 1, 1, 1, 1,
-0.8616599, -0.8696545, -5.114302, 1, 1, 1, 1, 1,
-0.8569266, -1.769339, -2.937105, 1, 1, 1, 1, 1,
-0.8548436, 1.73069, -1.153134, 1, 1, 1, 1, 1,
-0.8451369, 0.281921, -0.4381248, 1, 1, 1, 1, 1,
-0.8437367, 0.6576518, -0.04205707, 1, 1, 1, 1, 1,
-0.8430476, -1.490453, -2.270864, 1, 1, 1, 1, 1,
-0.8416521, -0.5368933, -1.226407, 1, 1, 1, 1, 1,
-0.8392566, -0.9351583, -3.282804, 1, 1, 1, 1, 1,
-0.8390413, 1.485813, 0.7128006, 0, 0, 1, 1, 1,
-0.8363532, 2.924929, 0.7257242, 1, 0, 0, 1, 1,
-0.8339821, -0.806474, -1.688438, 1, 0, 0, 1, 1,
-0.8308842, -1.512817, -2.457234, 1, 0, 0, 1, 1,
-0.8288281, 0.7767782, -0.3483093, 1, 0, 0, 1, 1,
-0.8259364, -1.250436, -2.361263, 1, 0, 0, 1, 1,
-0.8257197, -1.008668, -2.101292, 0, 0, 0, 1, 1,
-0.8250043, 0.2047462, -1.865679, 0, 0, 0, 1, 1,
-0.8213457, -0.2176412, -1.500945, 0, 0, 0, 1, 1,
-0.8162409, -1.65984, -2.539591, 0, 0, 0, 1, 1,
-0.8123905, 1.094628, -0.6839031, 0, 0, 0, 1, 1,
-0.8064834, -0.2977417, 0.2629565, 0, 0, 0, 1, 1,
-0.7953277, -0.01346717, -2.280254, 0, 0, 0, 1, 1,
-0.7950843, 1.584029, -0.7046966, 1, 1, 1, 1, 1,
-0.7909465, -0.201639, -2.908865, 1, 1, 1, 1, 1,
-0.787959, 0.3424683, -2.430576, 1, 1, 1, 1, 1,
-0.786909, -1.953282, -2.73084, 1, 1, 1, 1, 1,
-0.7834427, -1.617807, -3.254066, 1, 1, 1, 1, 1,
-0.7813169, 1.951851, 0.5121602, 1, 1, 1, 1, 1,
-0.7793874, -0.8449512, -2.856282, 1, 1, 1, 1, 1,
-0.7753283, -2.644745, -4.506018, 1, 1, 1, 1, 1,
-0.7750506, -0.3587157, -2.015229, 1, 1, 1, 1, 1,
-0.7652794, -0.2309534, -4.257776, 1, 1, 1, 1, 1,
-0.7651781, 0.225802, -0.7860532, 1, 1, 1, 1, 1,
-0.764231, -0.250663, -0.8375428, 1, 1, 1, 1, 1,
-0.7617951, 0.4668636, -0.5610024, 1, 1, 1, 1, 1,
-0.7606323, -0.1113758, 0.3452775, 1, 1, 1, 1, 1,
-0.7592894, 1.09197, 0.7550915, 1, 1, 1, 1, 1,
-0.7590998, -0.6950867, -2.903979, 0, 0, 1, 1, 1,
-0.7568915, 1.194696, -2.868967, 1, 0, 0, 1, 1,
-0.75479, -1.126179, -2.864024, 1, 0, 0, 1, 1,
-0.7542312, -0.4035706, -1.187807, 1, 0, 0, 1, 1,
-0.7510567, 0.02521376, -1.775598, 1, 0, 0, 1, 1,
-0.7481475, -2.121781, -3.173315, 1, 0, 0, 1, 1,
-0.7420181, -1.133399, -2.61965, 0, 0, 0, 1, 1,
-0.7403988, -0.5087673, -1.059215, 0, 0, 0, 1, 1,
-0.7403254, -0.2029375, -2.250695, 0, 0, 0, 1, 1,
-0.7278454, 0.3598742, 0.2004669, 0, 0, 0, 1, 1,
-0.7248404, 1.087374, -0.003843035, 0, 0, 0, 1, 1,
-0.7236151, 1.231391, 0.203143, 0, 0, 0, 1, 1,
-0.7222831, 0.6040136, 0.08520313, 0, 0, 0, 1, 1,
-0.7148142, 0.7219931, -1.064997, 1, 1, 1, 1, 1,
-0.6975026, 0.4433114, 1.112323, 1, 1, 1, 1, 1,
-0.6944839, 0.4914668, -1.097886, 1, 1, 1, 1, 1,
-0.6916969, -1.245927, -2.953751, 1, 1, 1, 1, 1,
-0.6846428, -1.368095, -3.277403, 1, 1, 1, 1, 1,
-0.6843137, -0.4730052, -4.595747, 1, 1, 1, 1, 1,
-0.6816357, -0.1365554, -1.552947, 1, 1, 1, 1, 1,
-0.6810676, 0.2862199, -0.9608145, 1, 1, 1, 1, 1,
-0.6773047, -0.3681607, -0.5118938, 1, 1, 1, 1, 1,
-0.6738442, 0.4722244, -1.891306, 1, 1, 1, 1, 1,
-0.6693168, -0.9771237, -1.419133, 1, 1, 1, 1, 1,
-0.6674461, -0.2015115, -0.5633767, 1, 1, 1, 1, 1,
-0.6634248, 0.8646213, -2.184545, 1, 1, 1, 1, 1,
-0.654562, 0.3280376, -1.087197, 1, 1, 1, 1, 1,
-0.6523195, -0.2168428, -2.131606, 1, 1, 1, 1, 1,
-0.6506017, 0.6181559, -1.010662, 0, 0, 1, 1, 1,
-0.6497512, 1.389442, 0.3774885, 1, 0, 0, 1, 1,
-0.639866, -0.2330973, -2.939304, 1, 0, 0, 1, 1,
-0.6300992, 1.617446, -1.239597, 1, 0, 0, 1, 1,
-0.6289766, 0.3915627, -0.8329257, 1, 0, 0, 1, 1,
-0.6287731, 0.4345868, -2.239969, 1, 0, 0, 1, 1,
-0.6276971, -0.7100542, -2.04692, 0, 0, 0, 1, 1,
-0.6245776, -0.1846381, -1.850445, 0, 0, 0, 1, 1,
-0.6225415, 0.5191888, -2.076357, 0, 0, 0, 1, 1,
-0.6217003, -0.2197141, -2.526545, 0, 0, 0, 1, 1,
-0.619738, -0.5519093, -2.392801, 0, 0, 0, 1, 1,
-0.6185412, -0.4038963, -3.591076, 0, 0, 0, 1, 1,
-0.6169747, 0.693773, -0.812929, 0, 0, 0, 1, 1,
-0.6119233, 0.2791997, -1.241325, 1, 1, 1, 1, 1,
-0.6116028, 0.4716912, -1.679762, 1, 1, 1, 1, 1,
-0.6114073, -0.8485255, -2.933289, 1, 1, 1, 1, 1,
-0.6102707, -0.4689657, -2.93642, 1, 1, 1, 1, 1,
-0.6087117, 0.1113611, -0.5457695, 1, 1, 1, 1, 1,
-0.6028422, 0.139797, -4.472481, 1, 1, 1, 1, 1,
-0.6013543, 1.935124, -0.1348977, 1, 1, 1, 1, 1,
-0.5999274, 0.8613023, -1.16347, 1, 1, 1, 1, 1,
-0.5999239, 0.845401, 1.59385, 1, 1, 1, 1, 1,
-0.5953156, 0.6465435, -1.374693, 1, 1, 1, 1, 1,
-0.5951567, 0.2028325, -2.609037, 1, 1, 1, 1, 1,
-0.5942765, 1.318424, -0.7982072, 1, 1, 1, 1, 1,
-0.5941845, 0.06964255, -2.230234, 1, 1, 1, 1, 1,
-0.5938593, 0.1024226, -1.160194, 1, 1, 1, 1, 1,
-0.5889122, -0.6227505, -2.246401, 1, 1, 1, 1, 1,
-0.5883609, 0.797331, -0.6305377, 0, 0, 1, 1, 1,
-0.5873868, 0.5585423, -0.5170428, 1, 0, 0, 1, 1,
-0.576328, 1.130971, 1.732136, 1, 0, 0, 1, 1,
-0.5755454, -0.9808487, -2.100324, 1, 0, 0, 1, 1,
-0.5730505, 0.665345, -0.6707745, 1, 0, 0, 1, 1,
-0.5729455, -0.3806864, -2.248694, 1, 0, 0, 1, 1,
-0.5672163, 1.887387, 1.441964, 0, 0, 0, 1, 1,
-0.5639058, 0.5676418, -0.925135, 0, 0, 0, 1, 1,
-0.5631649, 0.5411492, -0.05873386, 0, 0, 0, 1, 1,
-0.5585934, 1.376518, -1.127788, 0, 0, 0, 1, 1,
-0.5580549, -2.794204, -2.066515, 0, 0, 0, 1, 1,
-0.556922, -1.711734, -2.794982, 0, 0, 0, 1, 1,
-0.5568621, -1.130247, -1.417781, 0, 0, 0, 1, 1,
-0.5505586, -0.6013491, -2.305434, 1, 1, 1, 1, 1,
-0.5402523, -0.1185292, -1.063607, 1, 1, 1, 1, 1,
-0.5387151, 2.054057, 0.9712364, 1, 1, 1, 1, 1,
-0.5360224, -1.827885, -2.345751, 1, 1, 1, 1, 1,
-0.5355983, -0.5285625, -1.938153, 1, 1, 1, 1, 1,
-0.5344591, -0.02815387, -1.489018, 1, 1, 1, 1, 1,
-0.5288842, -1.656397, -1.510198, 1, 1, 1, 1, 1,
-0.5274838, 0.7219369, -1.249523, 1, 1, 1, 1, 1,
-0.5270109, -3.164212, -3.599085, 1, 1, 1, 1, 1,
-0.5261902, -0.5328699, -5.290038, 1, 1, 1, 1, 1,
-0.5235364, 0.6850672, 0.9564973, 1, 1, 1, 1, 1,
-0.5229089, 1.270869, -0.2568086, 1, 1, 1, 1, 1,
-0.5223872, -1.568266, -3.455686, 1, 1, 1, 1, 1,
-0.5218238, -0.6410811, -1.361202, 1, 1, 1, 1, 1,
-0.5193067, 0.5959318, -0.3912052, 1, 1, 1, 1, 1,
-0.5188692, -0.6635324, -2.876548, 0, 0, 1, 1, 1,
-0.5174571, -0.5167, -2.832351, 1, 0, 0, 1, 1,
-0.5156621, -0.4091828, -1.280243, 1, 0, 0, 1, 1,
-0.5141933, 0.9838395, 0.6018299, 1, 0, 0, 1, 1,
-0.5123276, 0.4331824, -1.36895, 1, 0, 0, 1, 1,
-0.5117371, 0.6527222, 0.3000887, 1, 0, 0, 1, 1,
-0.5109949, 0.9080115, -0.1694593, 0, 0, 0, 1, 1,
-0.5101842, 0.4460995, -1.35564, 0, 0, 0, 1, 1,
-0.5090346, -0.9624383, -2.751001, 0, 0, 0, 1, 1,
-0.508935, 1.742993, -0.2964106, 0, 0, 0, 1, 1,
-0.5071279, 0.09177879, -2.826677, 0, 0, 0, 1, 1,
-0.5058833, -0.5630118, -2.633449, 0, 0, 0, 1, 1,
-0.5014557, -0.0734629, -2.912148, 0, 0, 0, 1, 1,
-0.5011258, -0.05083575, -1.665927, 1, 1, 1, 1, 1,
-0.5007976, -0.08824269, -1.526189, 1, 1, 1, 1, 1,
-0.4971555, 1.227226, 0.3269083, 1, 1, 1, 1, 1,
-0.4957269, -0.9237741, -2.710086, 1, 1, 1, 1, 1,
-0.4940567, -1.365214, -2.063503, 1, 1, 1, 1, 1,
-0.4938093, 0.1918651, 0.6018634, 1, 1, 1, 1, 1,
-0.4934816, 0.002308076, -2.488639, 1, 1, 1, 1, 1,
-0.4897589, -0.7495615, -1.66894, 1, 1, 1, 1, 1,
-0.4897349, 0.3481936, -0.9608204, 1, 1, 1, 1, 1,
-0.4871542, 2.09871, 1.043755, 1, 1, 1, 1, 1,
-0.4858684, -0.1006698, -1.250671, 1, 1, 1, 1, 1,
-0.4781441, 0.5465031, -2.807503, 1, 1, 1, 1, 1,
-0.4776187, 0.3382127, -1.147161, 1, 1, 1, 1, 1,
-0.4735063, -0.6387281, -2.910011, 1, 1, 1, 1, 1,
-0.4731044, 0.5008218, -0.576728, 1, 1, 1, 1, 1,
-0.467777, -0.4894189, -2.401915, 0, 0, 1, 1, 1,
-0.4675139, -0.9654268, -1.975675, 1, 0, 0, 1, 1,
-0.4672416, 1.295433, -1.077764, 1, 0, 0, 1, 1,
-0.4669068, 0.8196139, -1.240573, 1, 0, 0, 1, 1,
-0.4625876, 0.1659881, -1.567711, 1, 0, 0, 1, 1,
-0.462502, -0.3404208, -2.456443, 1, 0, 0, 1, 1,
-0.4551834, -0.7626356, -2.358244, 0, 0, 0, 1, 1,
-0.4546791, -0.213331, -1.94612, 0, 0, 0, 1, 1,
-0.4504869, 0.1629531, -0.7384064, 0, 0, 0, 1, 1,
-0.4455121, -0.9502575, -3.537882, 0, 0, 0, 1, 1,
-0.4447273, -1.037729, -2.749416, 0, 0, 0, 1, 1,
-0.443989, 0.04039833, -2.749081, 0, 0, 0, 1, 1,
-0.4411207, 1.168099, -0.8320817, 0, 0, 0, 1, 1,
-0.434315, 0.305704, -0.1279804, 1, 1, 1, 1, 1,
-0.4323051, -1.532036, -3.817251, 1, 1, 1, 1, 1,
-0.4295065, -0.008236534, -2.386557, 1, 1, 1, 1, 1,
-0.4293714, -0.3346168, -1.207387, 1, 1, 1, 1, 1,
-0.428855, 0.67956, -0.8291472, 1, 1, 1, 1, 1,
-0.4251453, 0.5306059, -0.2218886, 1, 1, 1, 1, 1,
-0.4247909, -0.336819, -3.256931, 1, 1, 1, 1, 1,
-0.4237677, 0.05131312, -1.687841, 1, 1, 1, 1, 1,
-0.4204186, 1.043407, -0.420634, 1, 1, 1, 1, 1,
-0.4181905, -2.17922, -3.24474, 1, 1, 1, 1, 1,
-0.4175903, 1.601194, -0.1200528, 1, 1, 1, 1, 1,
-0.4159835, 0.1291015, -0.9077795, 1, 1, 1, 1, 1,
-0.4135829, 0.8098409, 0.08579072, 1, 1, 1, 1, 1,
-0.4126015, -0.2374066, -1.983129, 1, 1, 1, 1, 1,
-0.4087998, -0.331908, -2.539613, 1, 1, 1, 1, 1,
-0.4078861, 1.470229, 0.679858, 0, 0, 1, 1, 1,
-0.4073601, -0.1824355, -0.1433011, 1, 0, 0, 1, 1,
-0.4060468, -1.018526, -2.00016, 1, 0, 0, 1, 1,
-0.3983695, 0.9530026, -0.9401348, 1, 0, 0, 1, 1,
-0.3951886, -1.040069, -2.459847, 1, 0, 0, 1, 1,
-0.3944871, 0.5698182, 0.2146681, 1, 0, 0, 1, 1,
-0.3896024, -1.453052, -3.560227, 0, 0, 0, 1, 1,
-0.387932, -0.4638844, -2.307145, 0, 0, 0, 1, 1,
-0.3683857, 0.4695562, 0.6480815, 0, 0, 0, 1, 1,
-0.3633969, -0.4205237, -0.7227112, 0, 0, 0, 1, 1,
-0.360845, 0.6491371, -1.103864, 0, 0, 0, 1, 1,
-0.3570079, 0.3313965, -0.223088, 0, 0, 0, 1, 1,
-0.35363, 0.604672, -0.3290119, 0, 0, 0, 1, 1,
-0.3532149, -0.04720135, -3.393582, 1, 1, 1, 1, 1,
-0.3520588, 0.3346768, -1.532501, 1, 1, 1, 1, 1,
-0.3515496, -0.3089169, -0.9330513, 1, 1, 1, 1, 1,
-0.3484988, -0.5512418, -0.6859945, 1, 1, 1, 1, 1,
-0.3454097, 1.509054, 0.668724, 1, 1, 1, 1, 1,
-0.3394269, 0.5227988, -0.9431494, 1, 1, 1, 1, 1,
-0.3349714, 0.3061227, -0.4627635, 1, 1, 1, 1, 1,
-0.3349316, -0.2672449, -1.943035, 1, 1, 1, 1, 1,
-0.3348002, -1.467687, -2.606308, 1, 1, 1, 1, 1,
-0.3343227, 0.3237544, 0.1405791, 1, 1, 1, 1, 1,
-0.3286943, -0.664095, -4.441659, 1, 1, 1, 1, 1,
-0.3276389, -0.0788651, -2.937667, 1, 1, 1, 1, 1,
-0.326445, 0.4189565, 0.7017633, 1, 1, 1, 1, 1,
-0.3216565, 0.4952918, -0.1733792, 1, 1, 1, 1, 1,
-0.3204708, -0.5352193, -2.767162, 1, 1, 1, 1, 1,
-0.3189326, -0.5303206, -2.150478, 0, 0, 1, 1, 1,
-0.3185423, -0.6168447, -3.033769, 1, 0, 0, 1, 1,
-0.3161339, -0.6809441, -4.923931, 1, 0, 0, 1, 1,
-0.313913, 0.5268972, 0.07379241, 1, 0, 0, 1, 1,
-0.3090245, 0.1534443, -1.619325, 1, 0, 0, 1, 1,
-0.309011, -0.5026326, -2.439305, 1, 0, 0, 1, 1,
-0.3059077, 0.80267, -0.6466417, 0, 0, 0, 1, 1,
-0.3017051, 0.9298424, 0.7064868, 0, 0, 0, 1, 1,
-0.2950243, 0.3367058, -1.621344, 0, 0, 0, 1, 1,
-0.2929043, 0.5770481, -0.8214324, 0, 0, 0, 1, 1,
-0.2926808, -0.4327686, -2.075521, 0, 0, 0, 1, 1,
-0.2919101, 0.2955406, -0.4624099, 0, 0, 0, 1, 1,
-0.2844379, 1.310615, -0.817676, 0, 0, 0, 1, 1,
-0.2824922, -0.4889554, -2.811371, 1, 1, 1, 1, 1,
-0.2792629, 1.761598, -1.08779, 1, 1, 1, 1, 1,
-0.2768514, -0.1605583, -1.218446, 1, 1, 1, 1, 1,
-0.2765252, 0.07906957, -1.627211, 1, 1, 1, 1, 1,
-0.276296, -2.904553, -2.963239, 1, 1, 1, 1, 1,
-0.27527, -0.9629959, -2.380227, 1, 1, 1, 1, 1,
-0.2736098, 0.9593233, -0.7765279, 1, 1, 1, 1, 1,
-0.2735336, 0.989618, 0.2605497, 1, 1, 1, 1, 1,
-0.2656681, 0.2875227, -0.9311208, 1, 1, 1, 1, 1,
-0.2635139, -1.051234, -1.699095, 1, 1, 1, 1, 1,
-0.2631076, -0.4587204, -3.781518, 1, 1, 1, 1, 1,
-0.2610515, 1.39804, -0.219553, 1, 1, 1, 1, 1,
-0.259656, 0.06411284, -1.800969, 1, 1, 1, 1, 1,
-0.2568536, 0.0102442, -0.6176997, 1, 1, 1, 1, 1,
-0.2526124, 0.2178809, -1.990317, 1, 1, 1, 1, 1,
-0.2523527, -0.8412511, -3.353588, 0, 0, 1, 1, 1,
-0.2518685, -0.4804639, -1.777995, 1, 0, 0, 1, 1,
-0.2488707, -1.237702, -3.655174, 1, 0, 0, 1, 1,
-0.2485323, 1.634831, 0.4083846, 1, 0, 0, 1, 1,
-0.2478269, -0.5852261, -0.7094196, 1, 0, 0, 1, 1,
-0.2476643, 1.303571, 0.1219998, 1, 0, 0, 1, 1,
-0.2475957, -1.294177, -1.414504, 0, 0, 0, 1, 1,
-0.2471596, 0.6760141, -0.6955907, 0, 0, 0, 1, 1,
-0.2469953, 1.150769, -0.1622943, 0, 0, 0, 1, 1,
-0.2462786, 0.4798754, 0.06700948, 0, 0, 0, 1, 1,
-0.2427208, 1.049569, -2.699895, 0, 0, 0, 1, 1,
-0.2408639, -0.4926792, -1.888542, 0, 0, 0, 1, 1,
-0.2388905, -0.5175276, -4.720434, 0, 0, 0, 1, 1,
-0.2370149, -0.7499574, -2.697914, 1, 1, 1, 1, 1,
-0.2363764, -0.05861559, -1.646542, 1, 1, 1, 1, 1,
-0.2348909, -0.900216, -2.757807, 1, 1, 1, 1, 1,
-0.2292444, -0.3540989, -4.115069, 1, 1, 1, 1, 1,
-0.221143, -1.058366, -2.054078, 1, 1, 1, 1, 1,
-0.218773, -1.141485, -4.252893, 1, 1, 1, 1, 1,
-0.2172235, 0.3678315, -0.1878801, 1, 1, 1, 1, 1,
-0.2137478, 1.143632, 1.203749, 1, 1, 1, 1, 1,
-0.2128283, 1.366083, -0.1531636, 1, 1, 1, 1, 1,
-0.2093183, -1.860058, -2.724632, 1, 1, 1, 1, 1,
-0.208686, -0.2686803, -2.328144, 1, 1, 1, 1, 1,
-0.20861, -1.414361, -3.481885, 1, 1, 1, 1, 1,
-0.2060747, -0.247684, -1.387633, 1, 1, 1, 1, 1,
-0.2013467, 0.09866684, -1.593802, 1, 1, 1, 1, 1,
-0.2003242, -1.627384, -4.655961, 1, 1, 1, 1, 1,
-0.1994334, 1.088159, -0.03985853, 0, 0, 1, 1, 1,
-0.1985513, -0.6331016, -3.020725, 1, 0, 0, 1, 1,
-0.197278, 0.6430385, -1.539702, 1, 0, 0, 1, 1,
-0.1928286, 0.4763329, -0.8221042, 1, 0, 0, 1, 1,
-0.1919541, -2.710652, -3.592424, 1, 0, 0, 1, 1,
-0.1910618, 0.05749648, -1.636503, 1, 0, 0, 1, 1,
-0.1905394, 0.1245066, 0.9743678, 0, 0, 0, 1, 1,
-0.1866294, 3.414861, 0.2402034, 0, 0, 0, 1, 1,
-0.1863373, -0.02797071, -3.392299, 0, 0, 0, 1, 1,
-0.1831497, 0.1383426, -2.947213, 0, 0, 0, 1, 1,
-0.1822129, 1.356528, 0.4007422, 0, 0, 0, 1, 1,
-0.1798064, -1.001613, -2.945825, 0, 0, 0, 1, 1,
-0.1795467, 1.425457, -0.5487525, 0, 0, 0, 1, 1,
-0.169867, -1.396474, -3.309946, 1, 1, 1, 1, 1,
-0.1688805, 0.9849833, -0.1816985, 1, 1, 1, 1, 1,
-0.1672421, -1.701013, -3.590726, 1, 1, 1, 1, 1,
-0.1671687, -0.256095, -3.734646, 1, 1, 1, 1, 1,
-0.165741, 0.8235831, -1.67849, 1, 1, 1, 1, 1,
-0.1599524, -0.4031772, -2.24049, 1, 1, 1, 1, 1,
-0.1598788, 0.6824303, -1.318792, 1, 1, 1, 1, 1,
-0.1590963, -0.3518122, -2.838943, 1, 1, 1, 1, 1,
-0.1588917, -0.1766083, -2.432718, 1, 1, 1, 1, 1,
-0.1587011, -2.498406, -3.644396, 1, 1, 1, 1, 1,
-0.1581616, 0.9948295, 0.3320286, 1, 1, 1, 1, 1,
-0.1574879, -0.5438153, -2.873566, 1, 1, 1, 1, 1,
-0.1514345, 0.02270744, -1.743201, 1, 1, 1, 1, 1,
-0.1423192, -1.945818, -2.453322, 1, 1, 1, 1, 1,
-0.1415563, 0.7342095, -0.5412587, 1, 1, 1, 1, 1,
-0.1404226, -0.7460938, -2.854776, 0, 0, 1, 1, 1,
-0.1311294, 1.190493, 1.234816, 1, 0, 0, 1, 1,
-0.1244453, 1.015316, 1.21626, 1, 0, 0, 1, 1,
-0.1238421, -0.898333, -3.537521, 1, 0, 0, 1, 1,
-0.1208258, 1.477908, -1.690988, 1, 0, 0, 1, 1,
-0.1205401, 0.6506303, -0.3243661, 1, 0, 0, 1, 1,
-0.119695, 0.2721404, 0.1037307, 0, 0, 0, 1, 1,
-0.1192907, -1.913186, -3.26643, 0, 0, 0, 1, 1,
-0.1157461, -0.06334354, -2.903315, 0, 0, 0, 1, 1,
-0.1047246, 0.5459723, 1.577556, 0, 0, 0, 1, 1,
-0.1031517, 0.1850564, -0.4455078, 0, 0, 0, 1, 1,
-0.1026329, -1.545899, -4.928973, 0, 0, 0, 1, 1,
-0.1024967, -1.444375, -3.696381, 0, 0, 0, 1, 1,
-0.08891036, -0.0539867, 0.7606934, 1, 1, 1, 1, 1,
-0.0887415, -0.8021674, -4.481259, 1, 1, 1, 1, 1,
-0.08333026, 0.3248223, -1.744586, 1, 1, 1, 1, 1,
-0.07528979, -1.469854, -3.510382, 1, 1, 1, 1, 1,
-0.07122446, 0.684691, 1.323094, 1, 1, 1, 1, 1,
-0.06912094, 0.2377495, -0.776254, 1, 1, 1, 1, 1,
-0.06839705, -1.437985, -3.260914, 1, 1, 1, 1, 1,
-0.06625284, 1.509302, -0.612129, 1, 1, 1, 1, 1,
-0.0656658, -0.04907982, -1.481754, 1, 1, 1, 1, 1,
-0.06299382, 1.056292, -0.125259, 1, 1, 1, 1, 1,
-0.06214208, 0.6917975, 0.4293837, 1, 1, 1, 1, 1,
-0.06041603, 0.3848165, -0.608605, 1, 1, 1, 1, 1,
-0.06041332, 0.7487402, 2.606984, 1, 1, 1, 1, 1,
-0.05850114, 0.7858741, -0.1235715, 1, 1, 1, 1, 1,
-0.05720267, -0.9686587, -2.767674, 1, 1, 1, 1, 1,
-0.05147775, 0.802324, -0.9532859, 0, 0, 1, 1, 1,
-0.04920381, 0.6686084, 1.09581, 1, 0, 0, 1, 1,
-0.04637323, 0.2522609, -1.296391, 1, 0, 0, 1, 1,
-0.04475518, -0.8151891, -1.854305, 1, 0, 0, 1, 1,
-0.04385694, -1.776685, -2.238968, 1, 0, 0, 1, 1,
-0.04201589, -0.5627941, -2.881709, 1, 0, 0, 1, 1,
-0.04148023, -1.169196, -2.307912, 0, 0, 0, 1, 1,
-0.03999013, 0.3205676, -1.212085, 0, 0, 0, 1, 1,
-0.03929305, -0.6624803, -3.955194, 0, 0, 0, 1, 1,
-0.03829535, 0.3933993, 1.559455, 0, 0, 0, 1, 1,
-0.03706869, -0.2452707, -3.585604, 0, 0, 0, 1, 1,
-0.03389291, -2.149399, -3.294291, 0, 0, 0, 1, 1,
-0.03388584, -0.5959745, -3.815122, 0, 0, 0, 1, 1,
-0.03327703, -1.538699, -2.679642, 1, 1, 1, 1, 1,
-0.03118715, 0.5787374, 2.18483, 1, 1, 1, 1, 1,
-0.03092086, -0.3132108, -2.846192, 1, 1, 1, 1, 1,
-0.01928381, -0.546146, -1.931041, 1, 1, 1, 1, 1,
-0.01754892, -1.354836, -3.775976, 1, 1, 1, 1, 1,
0.004434476, -2.047156, 3.065844, 1, 1, 1, 1, 1,
0.009581626, -0.7523056, 3.174338, 1, 1, 1, 1, 1,
0.01918557, -0.06155716, 4.623645, 1, 1, 1, 1, 1,
0.02144895, -0.3617882, 3.775528, 1, 1, 1, 1, 1,
0.02364229, 0.4803374, -0.9337529, 1, 1, 1, 1, 1,
0.02380312, -1.967364, 3.532608, 1, 1, 1, 1, 1,
0.03095916, -0.943067, 2.992929, 1, 1, 1, 1, 1,
0.03200897, -0.3018394, 2.867244, 1, 1, 1, 1, 1,
0.03512438, 3.211636, 0.2326159, 1, 1, 1, 1, 1,
0.03802133, 0.2634317, 0.8467728, 1, 1, 1, 1, 1,
0.03960873, 0.5729482, 1.019494, 0, 0, 1, 1, 1,
0.04350147, 0.8682038, -0.1070272, 1, 0, 0, 1, 1,
0.0445643, 1.318275, -0.1267186, 1, 0, 0, 1, 1,
0.04511916, 1.049455, -0.4357398, 1, 0, 0, 1, 1,
0.04535599, 0.0802145, 0.1457784, 1, 0, 0, 1, 1,
0.04663434, 0.8299351, -1.130136, 1, 0, 0, 1, 1,
0.052201, -0.07488322, 1.895534, 0, 0, 0, 1, 1,
0.05376196, -2.257121, 2.548003, 0, 0, 0, 1, 1,
0.05931297, 0.2397768, 0.22799, 0, 0, 0, 1, 1,
0.06581925, -1.517386, 4.079477, 0, 0, 0, 1, 1,
0.06712534, -0.2513412, 2.560853, 0, 0, 0, 1, 1,
0.06925003, -0.09001125, 2.692297, 0, 0, 0, 1, 1,
0.07443558, -1.332121, 3.476552, 0, 0, 0, 1, 1,
0.07656197, -0.6805428, 3.207704, 1, 1, 1, 1, 1,
0.07679967, -0.1984473, 1.927849, 1, 1, 1, 1, 1,
0.07927949, 0.4296349, -0.6200488, 1, 1, 1, 1, 1,
0.08145705, 0.2442019, 0.8665289, 1, 1, 1, 1, 1,
0.08288681, 1.63221, 0.7755528, 1, 1, 1, 1, 1,
0.08377825, -3.62578, 3.550947, 1, 1, 1, 1, 1,
0.08836813, 0.5642532, -0.5304523, 1, 1, 1, 1, 1,
0.09297223, -1.689713, 4.702056, 1, 1, 1, 1, 1,
0.09704785, 0.6004006, 0.6283, 1, 1, 1, 1, 1,
0.09705269, -0.1340134, 0.9003051, 1, 1, 1, 1, 1,
0.09957645, -0.8834578, 5.573028, 1, 1, 1, 1, 1,
0.1001979, 0.7480036, 2.130093, 1, 1, 1, 1, 1,
0.1063814, -0.2321932, 3.816641, 1, 1, 1, 1, 1,
0.1066761, -0.2710755, 3.939586, 1, 1, 1, 1, 1,
0.1132233, -0.6700901, 4.155625, 1, 1, 1, 1, 1,
0.1153763, -0.2073126, 2.992177, 0, 0, 1, 1, 1,
0.11892, 0.7567395, -0.008118303, 1, 0, 0, 1, 1,
0.1225422, 1.283805, 0.5388573, 1, 0, 0, 1, 1,
0.1229423, -0.4553878, 3.806308, 1, 0, 0, 1, 1,
0.123574, 0.1514748, -0.3344339, 1, 0, 0, 1, 1,
0.1244289, 1.271048, -0.09476712, 1, 0, 0, 1, 1,
0.1276097, 1.835314, -1.906535, 0, 0, 0, 1, 1,
0.1295987, -0.1440084, 1.517143, 0, 0, 0, 1, 1,
0.1332423, -1.212703, 1.93352, 0, 0, 0, 1, 1,
0.1348081, -0.268889, 4.747429, 0, 0, 0, 1, 1,
0.1359665, 1.233993, -0.6804757, 0, 0, 0, 1, 1,
0.1425784, -0.1150168, 3.099333, 0, 0, 0, 1, 1,
0.1449222, 1.739403, 0.792171, 0, 0, 0, 1, 1,
0.1466772, 1.038968, 0.703387, 1, 1, 1, 1, 1,
0.148672, -0.1231792, 2.832408, 1, 1, 1, 1, 1,
0.1552164, -2.71619, 4.4396, 1, 1, 1, 1, 1,
0.1559189, 1.253889, 1.143, 1, 1, 1, 1, 1,
0.1563967, 0.5315957, -0.1388043, 1, 1, 1, 1, 1,
0.1566445, -1.571241, 4.097018, 1, 1, 1, 1, 1,
0.1597262, 0.5004455, 0.7310738, 1, 1, 1, 1, 1,
0.1614167, 0.3644194, 1.190637, 1, 1, 1, 1, 1,
0.1639055, 1.311199, 2.098024, 1, 1, 1, 1, 1,
0.1648593, 0.3230593, 0.4832245, 1, 1, 1, 1, 1,
0.1682399, -1.552243, 3.166726, 1, 1, 1, 1, 1,
0.1694532, 1.110768, -0.7840158, 1, 1, 1, 1, 1,
0.1729179, 0.8982109, 1.170361, 1, 1, 1, 1, 1,
0.1736831, 0.3221145, 1.234915, 1, 1, 1, 1, 1,
0.1749817, 0.7043275, -0.358937, 1, 1, 1, 1, 1,
0.1766501, -0.09488969, 1.785954, 0, 0, 1, 1, 1,
0.1814137, -1.1021, 3.008064, 1, 0, 0, 1, 1,
0.1834146, -0.5893431, 3.17465, 1, 0, 0, 1, 1,
0.1891237, -0.8914633, 1.905011, 1, 0, 0, 1, 1,
0.1901558, -0.5274728, 2.158742, 1, 0, 0, 1, 1,
0.1924164, 0.388148, 0.6760157, 1, 0, 0, 1, 1,
0.1944688, 0.4497291, -1.700839, 0, 0, 0, 1, 1,
0.20246, 0.2558585, 0.8651679, 0, 0, 0, 1, 1,
0.2044755, -0.7993664, 2.169784, 0, 0, 0, 1, 1,
0.2054169, -0.4479962, 1.871188, 0, 0, 0, 1, 1,
0.2116209, -0.7476953, 1.614174, 0, 0, 0, 1, 1,
0.2116476, -0.04155453, 1.429097, 0, 0, 0, 1, 1,
0.2146732, 1.320372, 1.541777, 0, 0, 0, 1, 1,
0.2168092, -1.466366, 4.265913, 1, 1, 1, 1, 1,
0.2184069, -2.141843, 2.19313, 1, 1, 1, 1, 1,
0.2203432, -0.3619954, 1.770125, 1, 1, 1, 1, 1,
0.2234168, -0.2239808, 0.9864258, 1, 1, 1, 1, 1,
0.2278303, -0.1359687, 1.708683, 1, 1, 1, 1, 1,
0.2295641, -1.462535, 2.016913, 1, 1, 1, 1, 1,
0.2325907, 2.051342, 0.00153445, 1, 1, 1, 1, 1,
0.2339844, -1.237313, 1.613533, 1, 1, 1, 1, 1,
0.2363622, -1.740323, 2.788281, 1, 1, 1, 1, 1,
0.2397448, 0.5829985, 2.310049, 1, 1, 1, 1, 1,
0.240862, -0.6621552, 2.600761, 1, 1, 1, 1, 1,
0.2414217, -0.4307397, 2.963072, 1, 1, 1, 1, 1,
0.2422901, 0.2724204, -0.3930438, 1, 1, 1, 1, 1,
0.243823, 0.1818086, 0.7701697, 1, 1, 1, 1, 1,
0.2449967, 1.656738, 0.7699246, 1, 1, 1, 1, 1,
0.2502652, 0.1898942, 0.9348932, 0, 0, 1, 1, 1,
0.2575665, -0.725415, 3.319525, 1, 0, 0, 1, 1,
0.259561, -1.209854, 5.160554, 1, 0, 0, 1, 1,
0.2606511, 0.1014314, 0.3075693, 1, 0, 0, 1, 1,
0.2639551, 1.607572, 0.9721332, 1, 0, 0, 1, 1,
0.2659303, 1.217857, -0.5679433, 1, 0, 0, 1, 1,
0.2659585, 0.5289089, 0.3038106, 0, 0, 0, 1, 1,
0.2660415, 0.5820973, 0.4969633, 0, 0, 0, 1, 1,
0.2661551, 0.6094733, -0.3267352, 0, 0, 0, 1, 1,
0.2693703, 0.0990639, 0.1677375, 0, 0, 0, 1, 1,
0.2694707, 0.6970817, 1.020751, 0, 0, 0, 1, 1,
0.270575, 1.259301, -0.5669045, 0, 0, 0, 1, 1,
0.2741694, 0.9971402, -0.6407577, 0, 0, 0, 1, 1,
0.2768196, -1.780631, 3.221871, 1, 1, 1, 1, 1,
0.2829386, 0.6673362, 1.222018, 1, 1, 1, 1, 1,
0.2842751, 0.216622, 2.287607, 1, 1, 1, 1, 1,
0.2863958, -0.9760812, 3.197474, 1, 1, 1, 1, 1,
0.2881804, 2.100386, 1.303447, 1, 1, 1, 1, 1,
0.2901568, -0.6538697, 1.748878, 1, 1, 1, 1, 1,
0.2919033, -1.198185, 2.803001, 1, 1, 1, 1, 1,
0.2940385, 0.3698872, 0.5185431, 1, 1, 1, 1, 1,
0.2962456, -0.3909344, 2.488353, 1, 1, 1, 1, 1,
0.2984987, 0.1508695, 0.6587589, 1, 1, 1, 1, 1,
0.3043307, -1.436512, 2.961922, 1, 1, 1, 1, 1,
0.3065752, 1.207873, -0.246275, 1, 1, 1, 1, 1,
0.3156208, -0.2452002, 0.6538227, 1, 1, 1, 1, 1,
0.3235934, -2.921232, 1.297325, 1, 1, 1, 1, 1,
0.3246554, -0.6533131, 1.364804, 1, 1, 1, 1, 1,
0.3275559, 0.3209626, 0.7083688, 0, 0, 1, 1, 1,
0.3284349, 0.2481474, 2.971051, 1, 0, 0, 1, 1,
0.3323808, 0.743329, 1.284045, 1, 0, 0, 1, 1,
0.3361465, 0.339564, 1.107729, 1, 0, 0, 1, 1,
0.3366579, 1.295837, -0.04164527, 1, 0, 0, 1, 1,
0.3401973, 2.463414, 0.6504675, 1, 0, 0, 1, 1,
0.3445016, -2.222946, 2.829537, 0, 0, 0, 1, 1,
0.3530444, 1.495354, 0.7172545, 0, 0, 0, 1, 1,
0.3615406, 0.04797976, -0.5607911, 0, 0, 0, 1, 1,
0.3622023, -1.223296, 3.068749, 0, 0, 0, 1, 1,
0.3654553, 0.4755543, 1.501327, 0, 0, 0, 1, 1,
0.3754264, 0.5488328, 0.5145664, 0, 0, 0, 1, 1,
0.3785647, -0.03559525, 2.346936, 0, 0, 0, 1, 1,
0.3792457, 2.52381, -0.1588003, 1, 1, 1, 1, 1,
0.3828614, -1.450749, 2.987162, 1, 1, 1, 1, 1,
0.384735, -0.1414216, 1.423755, 1, 1, 1, 1, 1,
0.3870551, 1.363305, -0.9752057, 1, 1, 1, 1, 1,
0.3906643, -0.8591481, 3.305789, 1, 1, 1, 1, 1,
0.3910382, -0.5798984, 3.918499, 1, 1, 1, 1, 1,
0.3930248, -0.7163401, 3.461393, 1, 1, 1, 1, 1,
0.3940296, 0.6471503, -0.4106071, 1, 1, 1, 1, 1,
0.3947951, -0.002658172, 2.772558, 1, 1, 1, 1, 1,
0.3949311, 0.9661695, 0.8537412, 1, 1, 1, 1, 1,
0.397953, 0.8030004, 0.2661244, 1, 1, 1, 1, 1,
0.3982163, -2.075168, 1.930266, 1, 1, 1, 1, 1,
0.3985217, -0.419771, 1.367801, 1, 1, 1, 1, 1,
0.4034651, 2.039155, -0.9607654, 1, 1, 1, 1, 1,
0.4034946, 0.809155, -0.8315339, 1, 1, 1, 1, 1,
0.4065869, 0.5786962, 1.417789, 0, 0, 1, 1, 1,
0.40794, -0.7009038, 3.436359, 1, 0, 0, 1, 1,
0.4084673, -0.02538951, 1.541202, 1, 0, 0, 1, 1,
0.4171441, -0.7014304, 1.754086, 1, 0, 0, 1, 1,
0.4185716, -1.49499, 2.186921, 1, 0, 0, 1, 1,
0.4203046, 1.399037, -0.1714646, 1, 0, 0, 1, 1,
0.4210813, -0.6300439, 2.612147, 0, 0, 0, 1, 1,
0.4210964, 1.16276, 0.2693118, 0, 0, 0, 1, 1,
0.4237835, -0.3066095, 3.397689, 0, 0, 0, 1, 1,
0.4272343, -0.2589489, 2.594824, 0, 0, 0, 1, 1,
0.4288703, -1.826669, 2.930624, 0, 0, 0, 1, 1,
0.4345795, -0.8866638, 2.95672, 0, 0, 0, 1, 1,
0.4356764, 1.072749, 0.5158486, 0, 0, 0, 1, 1,
0.4400251, -0.04180601, 2.230021, 1, 1, 1, 1, 1,
0.4401543, 0.9122605, -0.3730986, 1, 1, 1, 1, 1,
0.4411773, 0.5427598, 0.6044766, 1, 1, 1, 1, 1,
0.4432591, 0.5492724, 0.8140046, 1, 1, 1, 1, 1,
0.4438808, -0.3441818, 3.311888, 1, 1, 1, 1, 1,
0.4465324, -0.9259889, 1.667333, 1, 1, 1, 1, 1,
0.4494388, 1.788897, 1.445574, 1, 1, 1, 1, 1,
0.4517003, 0.4690184, 0.7156498, 1, 1, 1, 1, 1,
0.4536832, -0.9174525, 2.331533, 1, 1, 1, 1, 1,
0.4580005, 0.1103639, 1.761931, 1, 1, 1, 1, 1,
0.4607404, -0.0620237, 1.182731, 1, 1, 1, 1, 1,
0.4611393, -0.687799, 2.567826, 1, 1, 1, 1, 1,
0.4647203, 0.3100762, 1.487983, 1, 1, 1, 1, 1,
0.4649131, 0.5084471, 1.566532, 1, 1, 1, 1, 1,
0.4678824, 0.3166184, 1.672042, 1, 1, 1, 1, 1,
0.469197, -0.7863892, 3.370294, 0, 0, 1, 1, 1,
0.4723439, 0.4620072, 1.21568, 1, 0, 0, 1, 1,
0.4774534, 0.4032542, -1.124803, 1, 0, 0, 1, 1,
0.4815482, -0.6343428, 1.242861, 1, 0, 0, 1, 1,
0.4864889, 0.325361, 1.714363, 1, 0, 0, 1, 1,
0.4879258, -1.369659, 2.770696, 1, 0, 0, 1, 1,
0.4890375, -0.8618088, 2.939824, 0, 0, 0, 1, 1,
0.4896347, -0.7889165, 2.381947, 0, 0, 0, 1, 1,
0.4904372, 0.9846557, -1.244814, 0, 0, 0, 1, 1,
0.4927007, -1.767284, 2.913973, 0, 0, 0, 1, 1,
0.4934526, 0.5280165, 1.170551, 0, 0, 0, 1, 1,
0.493941, 1.458923, -1.132853, 0, 0, 0, 1, 1,
0.494905, 1.656255, -1.067555, 0, 0, 0, 1, 1,
0.4972988, -0.9297123, 4.052367, 1, 1, 1, 1, 1,
0.4998443, 1.114283, -0.6309331, 1, 1, 1, 1, 1,
0.4999276, 0.1402537, 0.09059201, 1, 1, 1, 1, 1,
0.5047509, 0.173788, 1.252115, 1, 1, 1, 1, 1,
0.5049379, -0.7136782, 3.336491, 1, 1, 1, 1, 1,
0.5109414, -0.1875402, 1.753389, 1, 1, 1, 1, 1,
0.5151669, 0.774685, 0.3891747, 1, 1, 1, 1, 1,
0.5165927, 0.2634428, 0.410873, 1, 1, 1, 1, 1,
0.5214492, -0.8918559, 3.427832, 1, 1, 1, 1, 1,
0.5347486, 0.1493309, 1.806483, 1, 1, 1, 1, 1,
0.5452681, -0.778442, 3.819409, 1, 1, 1, 1, 1,
0.5465318, 0.08412776, -0.2045186, 1, 1, 1, 1, 1,
0.5477661, -1.478648, 3.041717, 1, 1, 1, 1, 1,
0.5486636, -0.6390742, 2.771491, 1, 1, 1, 1, 1,
0.5502425, -1.16871, 2.3515, 1, 1, 1, 1, 1,
0.5507146, -1.759753, 3.515491, 0, 0, 1, 1, 1,
0.5541683, -1.414147, 2.491433, 1, 0, 0, 1, 1,
0.557005, 0.4328896, 2.093483, 1, 0, 0, 1, 1,
0.5571017, 1.184655, 0.7312116, 1, 0, 0, 1, 1,
0.5599059, 0.3123708, -0.5527219, 1, 0, 0, 1, 1,
0.5662239, -0.8580206, 3.920853, 1, 0, 0, 1, 1,
0.5838341, -0.3269614, 4.65065, 0, 0, 0, 1, 1,
0.5874874, -0.6729185, 2.212481, 0, 0, 0, 1, 1,
0.5893712, -0.9282236, 3.384728, 0, 0, 0, 1, 1,
0.5919852, -1.743555, 1.298767, 0, 0, 0, 1, 1,
0.5931326, 0.9265451, 0.8095523, 0, 0, 0, 1, 1,
0.5948644, 0.3362915, 0.8972198, 0, 0, 0, 1, 1,
0.5953655, 0.9285497, 0.1036842, 0, 0, 0, 1, 1,
0.5960541, -1.059496, 3.42657, 1, 1, 1, 1, 1,
0.6051813, -2.173383, 2.819406, 1, 1, 1, 1, 1,
0.6055821, 1.18812, 0.7155144, 1, 1, 1, 1, 1,
0.6065744, -0.5810554, 3.653376, 1, 1, 1, 1, 1,
0.608121, 0.875434, 1.265148, 1, 1, 1, 1, 1,
0.6086751, 1.429317, -0.6671297, 1, 1, 1, 1, 1,
0.6093702, -0.5224391, 2.180617, 1, 1, 1, 1, 1,
0.6174177, 0.9045123, 1.624804, 1, 1, 1, 1, 1,
0.6178164, -1.247, 3.598275, 1, 1, 1, 1, 1,
0.6185421, -2.172908, 3.157491, 1, 1, 1, 1, 1,
0.6189619, 1.275474, -0.1009961, 1, 1, 1, 1, 1,
0.6194325, -0.9939476, 1.884836, 1, 1, 1, 1, 1,
0.6266496, 0.07605946, 0.1769092, 1, 1, 1, 1, 1,
0.6320609, -1.241877, 3.074434, 1, 1, 1, 1, 1,
0.6321537, -0.6180205, 4.319112, 1, 1, 1, 1, 1,
0.6432188, 1.306816, 0.06550338, 0, 0, 1, 1, 1,
0.6443136, -0.2496021, 1.920161, 1, 0, 0, 1, 1,
0.6502717, -0.03738852, 0.1624629, 1, 0, 0, 1, 1,
0.6571451, -1.235219, 3.167603, 1, 0, 0, 1, 1,
0.6659147, 1.528783, 0.6249934, 1, 0, 0, 1, 1,
0.6667767, 1.252665, 0.7842827, 1, 0, 0, 1, 1,
0.6743621, -0.7463815, 3.620214, 0, 0, 0, 1, 1,
0.6744795, -0.4444262, 2.042914, 0, 0, 0, 1, 1,
0.6862587, -0.7801662, 2.648082, 0, 0, 0, 1, 1,
0.6874139, -0.7415794, 2.086862, 0, 0, 0, 1, 1,
0.6885204, 0.05494996, 2.725001, 0, 0, 0, 1, 1,
0.6913054, 1.511065, -0.6930469, 0, 0, 0, 1, 1,
0.6928481, 0.04289092, 1.194044, 0, 0, 0, 1, 1,
0.701997, -0.07427122, 1.285312, 1, 1, 1, 1, 1,
0.70549, -0.4413717, 2.790934, 1, 1, 1, 1, 1,
0.706449, 0.3380579, 2.56909, 1, 1, 1, 1, 1,
0.7064805, 1.016287, 0.9331867, 1, 1, 1, 1, 1,
0.7068784, -0.2547785, 1.195671, 1, 1, 1, 1, 1,
0.7108052, -1.192509, 3.019567, 1, 1, 1, 1, 1,
0.7112187, -0.6877249, 2.005683, 1, 1, 1, 1, 1,
0.7186306, 0.3496499, 0.349759, 1, 1, 1, 1, 1,
0.7213967, -1.437036, 3.517791, 1, 1, 1, 1, 1,
0.727917, 1.401427, 0.2648784, 1, 1, 1, 1, 1,
0.7398758, 0.6992912, 1.788474, 1, 1, 1, 1, 1,
0.7479203, 1.302074, -0.6329516, 1, 1, 1, 1, 1,
0.7558055, -1.13153, 1.790716, 1, 1, 1, 1, 1,
0.7584528, 0.08795152, 0.6149625, 1, 1, 1, 1, 1,
0.7595327, 0.9855212, 0.7723114, 1, 1, 1, 1, 1,
0.7749681, 0.8143696, 0.3236683, 0, 0, 1, 1, 1,
0.7756881, 0.2381042, 0.1591615, 1, 0, 0, 1, 1,
0.7758497, -0.06273828, 1.812613, 1, 0, 0, 1, 1,
0.7770349, 0.1022048, 2.175958, 1, 0, 0, 1, 1,
0.7835329, -1.198189, 1.976716, 1, 0, 0, 1, 1,
0.7855081, -0.03714734, 0.1918175, 1, 0, 0, 1, 1,
0.7950634, 1.195008, 0.2927225, 0, 0, 0, 1, 1,
0.7987309, -0.9213251, 2.770398, 0, 0, 0, 1, 1,
0.8006785, 0.300869, 1.141293, 0, 0, 0, 1, 1,
0.8012865, -1.22865, 1.937599, 0, 0, 0, 1, 1,
0.8067228, 2.72849, 0.3251998, 0, 0, 0, 1, 1,
0.8079381, 1.210493, -1.299584, 0, 0, 0, 1, 1,
0.8094592, 0.9065713, -0.5981085, 0, 0, 0, 1, 1,
0.8101607, -1.443498, 2.945598, 1, 1, 1, 1, 1,
0.8152171, 0.996279, 1.360318, 1, 1, 1, 1, 1,
0.8198817, 0.7272848, 1.918891, 1, 1, 1, 1, 1,
0.821157, -0.8630105, 1.621256, 1, 1, 1, 1, 1,
0.8227797, -1.412899, 1.69565, 1, 1, 1, 1, 1,
0.8298964, 0.5137911, 1.863598, 1, 1, 1, 1, 1,
0.8306091, -0.5302141, 2.70228, 1, 1, 1, 1, 1,
0.845032, 0.8110746, 1.487914, 1, 1, 1, 1, 1,
0.846074, 0.3925375, 2.039577, 1, 1, 1, 1, 1,
0.8478071, 0.6636965, 1.635275, 1, 1, 1, 1, 1,
0.8550219, -0.08233701, 1.928719, 1, 1, 1, 1, 1,
0.8588637, 0.07890792, 3.158105, 1, 1, 1, 1, 1,
0.8673326, 1.851963, 1.41887, 1, 1, 1, 1, 1,
0.8683525, -0.960259, 2.821276, 1, 1, 1, 1, 1,
0.8709567, -0.4615298, 3.740009, 1, 1, 1, 1, 1,
0.8711728, -0.2632525, 1.502137, 0, 0, 1, 1, 1,
0.8733672, -0.6230038, 4.410949, 1, 0, 0, 1, 1,
0.8810094, 0.1726593, 1.76529, 1, 0, 0, 1, 1,
0.8852666, 0.7427463, 1.21301, 1, 0, 0, 1, 1,
0.8865047, -2.13401, 2.623353, 1, 0, 0, 1, 1,
0.8951297, -0.9499786, 1.635296, 1, 0, 0, 1, 1,
0.8979964, 0.3110214, 1.282201, 0, 0, 0, 1, 1,
0.9026898, 0.5692407, 3.067255, 0, 0, 0, 1, 1,
0.9029054, -0.1478147, 1.008623, 0, 0, 0, 1, 1,
0.9071245, -0.2506266, -0.212721, 0, 0, 0, 1, 1,
0.9082422, 0.1358942, 4.01209, 0, 0, 0, 1, 1,
0.9118215, 0.5423446, 1.370464, 0, 0, 0, 1, 1,
0.9137949, 0.7160234, 1.493469, 0, 0, 0, 1, 1,
0.9138889, 1.459355, 2.70482, 1, 1, 1, 1, 1,
0.9202784, -0.8662412, 1.481872, 1, 1, 1, 1, 1,
0.9238076, -1.027067, 2.201266, 1, 1, 1, 1, 1,
0.9239137, 1.64509, -0.2708632, 1, 1, 1, 1, 1,
0.9298632, -0.3638514, 0.7074992, 1, 1, 1, 1, 1,
0.9315834, 0.05819652, 0.4669763, 1, 1, 1, 1, 1,
0.9539288, 0.2525376, 0.3424223, 1, 1, 1, 1, 1,
0.9547455, -1.027063, 2.623132, 1, 1, 1, 1, 1,
0.9593717, -1.288536, 3.417967, 1, 1, 1, 1, 1,
0.9621642, -1.166057, 2.838173, 1, 1, 1, 1, 1,
0.9647588, -0.5064642, 2.656544, 1, 1, 1, 1, 1,
0.9666569, 2.314309, -0.5739795, 1, 1, 1, 1, 1,
0.9758433, -0.08583789, 1.822069, 1, 1, 1, 1, 1,
0.9817526, -0.6204947, 0.975702, 1, 1, 1, 1, 1,
0.9875606, -0.1842494, 1.742203, 1, 1, 1, 1, 1,
0.9901443, -2.162696, 2.834313, 0, 0, 1, 1, 1,
0.9937162, 0.3168778, 2.50321, 1, 0, 0, 1, 1,
0.9975836, 0.2025854, 0.3205195, 1, 0, 0, 1, 1,
0.9977072, 0.286708, 2.504298, 1, 0, 0, 1, 1,
0.9988565, 0.5087866, 1.71636, 1, 0, 0, 1, 1,
0.9996008, 0.6894144, 1.370831, 1, 0, 0, 1, 1,
1.038568, -0.291565, 3.012445, 0, 0, 0, 1, 1,
1.044558, -0.1666399, 2.076276, 0, 0, 0, 1, 1,
1.04507, -0.8604116, 2.252238, 0, 0, 0, 1, 1,
1.046577, -0.2594076, 2.633222, 0, 0, 0, 1, 1,
1.04907, -1.833589, 4.174276, 0, 0, 0, 1, 1,
1.058903, -1.584027, 3.144326, 0, 0, 0, 1, 1,
1.059229, 0.7858418, 0.2826491, 0, 0, 0, 1, 1,
1.066332, 0.4730114, 1.904228, 1, 1, 1, 1, 1,
1.073976, 0.5819441, 2.541588, 1, 1, 1, 1, 1,
1.077194, -1.14929, 1.627083, 1, 1, 1, 1, 1,
1.084145, -0.717778, 1.915195, 1, 1, 1, 1, 1,
1.084286, 0.4727595, 0.09962928, 1, 1, 1, 1, 1,
1.090995, 1.220098, 2.704629, 1, 1, 1, 1, 1,
1.093797, -0.7016956, 3.559888, 1, 1, 1, 1, 1,
1.095855, 1.242137, 1.293987, 1, 1, 1, 1, 1,
1.098288, 0.1887653, 0.885024, 1, 1, 1, 1, 1,
1.099268, -0.2852712, 2.483465, 1, 1, 1, 1, 1,
1.099281, 0.6764372, 0.4865845, 1, 1, 1, 1, 1,
1.101008, 0.6761659, 1.540199, 1, 1, 1, 1, 1,
1.106294, 0.4776998, -1.172713, 1, 1, 1, 1, 1,
1.107738, 1.519201, 0.1752986, 1, 1, 1, 1, 1,
1.113359, 0.173658, 1.733022, 1, 1, 1, 1, 1,
1.123334, -0.3379631, 1.959723, 0, 0, 1, 1, 1,
1.12422, -1.52059, 2.664655, 1, 0, 0, 1, 1,
1.129181, -0.1259663, 1.408231, 1, 0, 0, 1, 1,
1.129934, 0.4885084, -1.377268, 1, 0, 0, 1, 1,
1.133387, -0.304274, 0.9259941, 1, 0, 0, 1, 1,
1.135032, -0.4775899, 1.45465, 1, 0, 0, 1, 1,
1.137685, 0.9994945, 2.200528, 0, 0, 0, 1, 1,
1.143761, -0.06700388, -0.4212881, 0, 0, 0, 1, 1,
1.14615, 0.4534572, 1.358519, 0, 0, 0, 1, 1,
1.147385, 2.162729, 0.7662289, 0, 0, 0, 1, 1,
1.14798, 1.069528, 0.5488029, 0, 0, 0, 1, 1,
1.160482, -1.046117, 0.5331067, 0, 0, 0, 1, 1,
1.165106, -0.03771631, 1.241667, 0, 0, 0, 1, 1,
1.167403, -1.070259, 2.214727, 1, 1, 1, 1, 1,
1.168634, 1.015207, 1.582287, 1, 1, 1, 1, 1,
1.169025, 0.5531235, 0.02267614, 1, 1, 1, 1, 1,
1.173495, 0.5860152, 0.2844991, 1, 1, 1, 1, 1,
1.173824, -0.2911516, 1.711042, 1, 1, 1, 1, 1,
1.181058, -0.1945129, 1.108781, 1, 1, 1, 1, 1,
1.195197, -1.699716, 1.796739, 1, 1, 1, 1, 1,
1.202011, 0.3968769, 2.216524, 1, 1, 1, 1, 1,
1.209927, -0.7802727, 1.77891, 1, 1, 1, 1, 1,
1.210668, -1.254918, 2.879624, 1, 1, 1, 1, 1,
1.223339, -0.6567339, 2.845782, 1, 1, 1, 1, 1,
1.231816, 1.002003, 1.425769, 1, 1, 1, 1, 1,
1.235996, -0.2633423, 1.239085, 1, 1, 1, 1, 1,
1.240836, 0.4778311, 2.0132, 1, 1, 1, 1, 1,
1.241269, 1.669378, 1.893425, 1, 1, 1, 1, 1,
1.242337, -0.5672878, 3.443705, 0, 0, 1, 1, 1,
1.243973, 0.3258691, 1.087349, 1, 0, 0, 1, 1,
1.247022, 1.471816, 0.9156818, 1, 0, 0, 1, 1,
1.248172, 1.112655, 2.469867, 1, 0, 0, 1, 1,
1.249147, -0.2122526, 1.46208, 1, 0, 0, 1, 1,
1.255397, 1.923445, 0.481848, 1, 0, 0, 1, 1,
1.257297, -0.101704, 2.061093, 0, 0, 0, 1, 1,
1.26589, -0.3462302, 1.717476, 0, 0, 0, 1, 1,
1.272444, 0.7699805, 1.690709, 0, 0, 0, 1, 1,
1.272655, -0.1013794, 1.041194, 0, 0, 0, 1, 1,
1.275889, -0.4253184, 2.727732, 0, 0, 0, 1, 1,
1.277877, -0.5726781, 0.6674529, 0, 0, 0, 1, 1,
1.278994, -0.8397959, 1.92399, 0, 0, 0, 1, 1,
1.279282, 0.07496507, 2.060592, 1, 1, 1, 1, 1,
1.281634, -2.160018, 1.928994, 1, 1, 1, 1, 1,
1.294287, 1.297061, 0.01418539, 1, 1, 1, 1, 1,
1.310314, -0.60099, 1.707199, 1, 1, 1, 1, 1,
1.324272, -1.258224, 2.655628, 1, 1, 1, 1, 1,
1.32693, -1.765343, 2.870137, 1, 1, 1, 1, 1,
1.327447, 1.922779, -0.8111085, 1, 1, 1, 1, 1,
1.32909, -0.2892298, 3.03459, 1, 1, 1, 1, 1,
1.340657, 1.685809, 0.9269013, 1, 1, 1, 1, 1,
1.342743, -0.3760812, 0.8213948, 1, 1, 1, 1, 1,
1.375673, 0.2025294, 3.485119, 1, 1, 1, 1, 1,
1.380385, 0.8671085, -0.8716373, 1, 1, 1, 1, 1,
1.382225, 0.808379, 2.000143, 1, 1, 1, 1, 1,
1.398675, 0.239875, -0.5565564, 1, 1, 1, 1, 1,
1.404019, 0.5599124, 2.394376, 1, 1, 1, 1, 1,
1.410919, 1.266665, -0.7171058, 0, 0, 1, 1, 1,
1.414954, 0.9362589, 1.516589, 1, 0, 0, 1, 1,
1.432445, 2.892517, 0.01444257, 1, 0, 0, 1, 1,
1.439464, -0.1650847, 1.417874, 1, 0, 0, 1, 1,
1.453849, 1.386001, 0.5091144, 1, 0, 0, 1, 1,
1.470786, -0.8701187, 2.328821, 1, 0, 0, 1, 1,
1.4784, -0.05379555, 2.208651, 0, 0, 0, 1, 1,
1.484988, -0.588877, 1.018174, 0, 0, 0, 1, 1,
1.486401, -0.2255072, 1.288484, 0, 0, 0, 1, 1,
1.521344, 0.2272063, 2.761187, 0, 0, 0, 1, 1,
1.523689, 0.2852278, 1.147261, 0, 0, 0, 1, 1,
1.535981, 0.4439143, 0.9826913, 0, 0, 0, 1, 1,
1.538959, 0.6750001, 1.692466, 0, 0, 0, 1, 1,
1.548107, 1.58136, 0.6926704, 1, 1, 1, 1, 1,
1.548493, 0.6683708, 0.7552629, 1, 1, 1, 1, 1,
1.550279, -0.5596142, 3.389507, 1, 1, 1, 1, 1,
1.55161, -0.1970493, 1.474606, 1, 1, 1, 1, 1,
1.564421, -0.34569, 0.7272409, 1, 1, 1, 1, 1,
1.594072, -0.6158327, 1.770466, 1, 1, 1, 1, 1,
1.594852, -0.2731714, 1.144738, 1, 1, 1, 1, 1,
1.611756, 1.492904, -0.1782019, 1, 1, 1, 1, 1,
1.625432, 1.382214, -0.2451426, 1, 1, 1, 1, 1,
1.626696, 0.4009676, 2.393545, 1, 1, 1, 1, 1,
1.629378, -0.468541, 0.9016086, 1, 1, 1, 1, 1,
1.631139, -0.4089965, -0.1574269, 1, 1, 1, 1, 1,
1.638249, -0.2112161, 3.043685, 1, 1, 1, 1, 1,
1.64832, -0.8679268, 4.056952, 1, 1, 1, 1, 1,
1.652108, -0.9105054, 0.7773424, 1, 1, 1, 1, 1,
1.658802, -0.3892922, 2.282784, 0, 0, 1, 1, 1,
1.666098, -0.7514851, 0.3581826, 1, 0, 0, 1, 1,
1.672565, -0.1749266, 0.7702957, 1, 0, 0, 1, 1,
1.705924, 0.6979744, 1.080544, 1, 0, 0, 1, 1,
1.719079, -0.3859767, 1.174882, 1, 0, 0, 1, 1,
1.733896, 0.1001094, 1.64734, 1, 0, 0, 1, 1,
1.7694, 0.01171383, 1.650997, 0, 0, 0, 1, 1,
1.772592, 0.8118297, 1.132974, 0, 0, 0, 1, 1,
1.774381, 0.1841903, 1.453586, 0, 0, 0, 1, 1,
1.775268, 1.183533, 1.397307, 0, 0, 0, 1, 1,
1.797118, 1.139984, 0.308304, 0, 0, 0, 1, 1,
1.799588, -0.469224, 1.566639, 0, 0, 0, 1, 1,
1.812295, 0.561609, 1.085463, 0, 0, 0, 1, 1,
1.843948, 0.5742772, 0.4907654, 1, 1, 1, 1, 1,
1.850138, -0.3240136, 2.714501, 1, 1, 1, 1, 1,
1.851134, -0.1037638, 1.417741, 1, 1, 1, 1, 1,
1.85139, 2.043789, 1.530802, 1, 1, 1, 1, 1,
1.877466, 0.7678749, 0.9622545, 1, 1, 1, 1, 1,
1.89726, 1.915606, 0.2993711, 1, 1, 1, 1, 1,
1.909531, -1.356293, 0.2265559, 1, 1, 1, 1, 1,
1.914557, -0.8760153, 1.955173, 1, 1, 1, 1, 1,
1.918226, -0.2843332, 1.270404, 1, 1, 1, 1, 1,
1.929265, -0.6880721, 3.142249, 1, 1, 1, 1, 1,
1.938879, -0.05156407, 2.572143, 1, 1, 1, 1, 1,
1.94379, -1.428978, 2.524068, 1, 1, 1, 1, 1,
1.966423, -0.2990122, 0.4227377, 1, 1, 1, 1, 1,
1.967617, 0.1444036, 0.9176033, 1, 1, 1, 1, 1,
1.972039, -0.7411448, 3.885012, 1, 1, 1, 1, 1,
1.992907, -1.602704, 2.650436, 0, 0, 1, 1, 1,
1.996163, -0.09723046, 1.344459, 1, 0, 0, 1, 1,
1.998106, -0.6703272, 1.93691, 1, 0, 0, 1, 1,
2.069731, -0.4328542, 0.1220232, 1, 0, 0, 1, 1,
2.086775, 1.969894, 0.4974123, 1, 0, 0, 1, 1,
2.091596, -0.1559344, 1.699358, 1, 0, 0, 1, 1,
2.166122, -0.9744943, 2.096342, 0, 0, 0, 1, 1,
2.200518, 0.5471632, 1.136548, 0, 0, 0, 1, 1,
2.21558, 0.1348929, -0.04712953, 0, 0, 0, 1, 1,
2.237526, -0.5250223, 1.112082, 0, 0, 0, 1, 1,
2.250302, 0.5654203, 1.951049, 0, 0, 0, 1, 1,
2.281575, -0.8368688, 0.7310129, 0, 0, 0, 1, 1,
2.32661, -1.329331, 1.663608, 0, 0, 0, 1, 1,
2.326832, 0.7783395, 2.265672, 1, 1, 1, 1, 1,
2.364487, 0.02810614, 2.301455, 1, 1, 1, 1, 1,
2.448184, -0.3427648, 0.7871137, 1, 1, 1, 1, 1,
2.468329, -0.5774977, 2.599088, 1, 1, 1, 1, 1,
2.515426, -0.08208707, 1.155116, 1, 1, 1, 1, 1,
2.64566, 0.8937467, 1.349334, 1, 1, 1, 1, 1,
2.874276, -0.03087424, 2.556433, 1, 1, 1, 1, 1
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
var radius = 9.752936;
var distance = 34.25677;
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
mvMatrix.translate( 0.1528046, 0.1054595, -0.09531975 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.25677);
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
