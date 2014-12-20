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
-3.338306, -0.5382015, -2.379356, 1, 0, 0, 1,
-3.053372, -0.2067727, -0.2428888, 1, 0.007843138, 0, 1,
-2.989224, -1.149579, -2.625449, 1, 0.01176471, 0, 1,
-2.586831, -0.2325171, -2.042169, 1, 0.01960784, 0, 1,
-2.552253, -0.3981296, -2.81315, 1, 0.02352941, 0, 1,
-2.549053, 0.3645265, -1.186303, 1, 0.03137255, 0, 1,
-2.529434, 0.4804701, -2.752187, 1, 0.03529412, 0, 1,
-2.350087, -0.6315358, -1.537283, 1, 0.04313726, 0, 1,
-2.332537, 0.4480511, -1.012648, 1, 0.04705882, 0, 1,
-2.298544, -0.3194746, -2.736539, 1, 0.05490196, 0, 1,
-2.293391, 0.5637895, -3.207263, 1, 0.05882353, 0, 1,
-2.260678, -2.13679, -2.903364, 1, 0.06666667, 0, 1,
-2.252168, -0.591162, 0.1224174, 1, 0.07058824, 0, 1,
-2.230585, 0.2355513, -0.8196046, 1, 0.07843138, 0, 1,
-2.183737, -0.98917, -2.280369, 1, 0.08235294, 0, 1,
-2.144288, 0.8263733, 0.5761269, 1, 0.09019608, 0, 1,
-2.140261, 0.01875217, -1.179792, 1, 0.09411765, 0, 1,
-2.124526, 0.4420499, 0.3099799, 1, 0.1019608, 0, 1,
-2.116107, -1.580393, -0.800109, 1, 0.1098039, 0, 1,
-2.047125, 1.987266, -0.7537038, 1, 0.1137255, 0, 1,
-2.041646, -0.8857678, -0.1949557, 1, 0.1215686, 0, 1,
-2.037826, 0.5665687, -1.846903, 1, 0.1254902, 0, 1,
-2.003342, -2.040316, -3.750573, 1, 0.1333333, 0, 1,
-1.95417, 0.3048613, -1.183807, 1, 0.1372549, 0, 1,
-1.936466, 0.8236903, -0.2476309, 1, 0.145098, 0, 1,
-1.926676, -0.1597398, -2.763407, 1, 0.1490196, 0, 1,
-1.906351, -0.6307727, -3.303535, 1, 0.1568628, 0, 1,
-1.881201, 0.5275795, -0.3861763, 1, 0.1607843, 0, 1,
-1.865451, 1.775553, -0.3489046, 1, 0.1686275, 0, 1,
-1.84284, 0.2329313, -1.312238, 1, 0.172549, 0, 1,
-1.805172, 2.965636, -1.441918, 1, 0.1803922, 0, 1,
-1.780273, -0.1031499, -1.058743, 1, 0.1843137, 0, 1,
-1.759609, 0.3572357, -1.923127, 1, 0.1921569, 0, 1,
-1.710958, 1.352283, -2.478697, 1, 0.1960784, 0, 1,
-1.69079, -0.05517015, -2.099363, 1, 0.2039216, 0, 1,
-1.689435, 0.137131, -1.846546, 1, 0.2117647, 0, 1,
-1.646447, 0.7399076, -2.649681, 1, 0.2156863, 0, 1,
-1.637532, -0.6438832, -3.023601, 1, 0.2235294, 0, 1,
-1.616197, 0.1919068, -1.169914, 1, 0.227451, 0, 1,
-1.614216, 0.2036587, -2.480489, 1, 0.2352941, 0, 1,
-1.608429, 0.889773, -0.1349787, 1, 0.2392157, 0, 1,
-1.603253, 0.009794772, -1.318383, 1, 0.2470588, 0, 1,
-1.593372, -1.459571, -1.425446, 1, 0.2509804, 0, 1,
-1.589326, -1.881958, -1.112003, 1, 0.2588235, 0, 1,
-1.587577, 0.4826867, -0.9314368, 1, 0.2627451, 0, 1,
-1.577647, 2.238294, 0.661897, 1, 0.2705882, 0, 1,
-1.563788, 2.211979, -1.86355, 1, 0.2745098, 0, 1,
-1.559251, 0.8532965, -2.733076, 1, 0.282353, 0, 1,
-1.546885, -1.461573, -2.428057, 1, 0.2862745, 0, 1,
-1.544475, -0.1089139, -2.832988, 1, 0.2941177, 0, 1,
-1.542859, 0.2144907, -1.885573, 1, 0.3019608, 0, 1,
-1.520185, -0.5724498, -2.722945, 1, 0.3058824, 0, 1,
-1.51988, -0.2162579, -1.895713, 1, 0.3137255, 0, 1,
-1.51974, 0.7308226, -1.741399, 1, 0.3176471, 0, 1,
-1.502335, 1.030379, -0.3519477, 1, 0.3254902, 0, 1,
-1.496905, -0.03404207, -2.407069, 1, 0.3294118, 0, 1,
-1.480617, 1.933888, -2.026419, 1, 0.3372549, 0, 1,
-1.475887, 0.4539001, -2.759505, 1, 0.3411765, 0, 1,
-1.475646, 1.717286, -1.28927, 1, 0.3490196, 0, 1,
-1.474838, 0.634976, -0.5134333, 1, 0.3529412, 0, 1,
-1.471707, -1.135863, -2.923655, 1, 0.3607843, 0, 1,
-1.467401, -0.8666918, -1.725082, 1, 0.3647059, 0, 1,
-1.457006, 0.5917028, -1.564394, 1, 0.372549, 0, 1,
-1.448105, 0.05519939, -1.215159, 1, 0.3764706, 0, 1,
-1.445079, -1.420259, -1.379752, 1, 0.3843137, 0, 1,
-1.430734, -0.2856023, -0.5261799, 1, 0.3882353, 0, 1,
-1.424985, 1.756217, -1.096868, 1, 0.3960784, 0, 1,
-1.42017, -1.730849, -2.740922, 1, 0.4039216, 0, 1,
-1.417787, -0.3623105, -0.2969215, 1, 0.4078431, 0, 1,
-1.407639, -0.5113773, -3.571699, 1, 0.4156863, 0, 1,
-1.399842, 0.0008811925, -2.367195, 1, 0.4196078, 0, 1,
-1.397417, -0.5164765, -3.164216, 1, 0.427451, 0, 1,
-1.390466, 1.831751, -1.678589, 1, 0.4313726, 0, 1,
-1.386894, 1.108179, -1.047057, 1, 0.4392157, 0, 1,
-1.383598, -1.267513, -2.619679, 1, 0.4431373, 0, 1,
-1.376166, 0.06789767, -2.274639, 1, 0.4509804, 0, 1,
-1.368163, -1.847823, -2.274007, 1, 0.454902, 0, 1,
-1.357803, -0.1055239, -2.176901, 1, 0.4627451, 0, 1,
-1.357221, -0.9519271, -4.046139, 1, 0.4666667, 0, 1,
-1.346719, -0.6104093, -2.850283, 1, 0.4745098, 0, 1,
-1.342658, 1.167297, 1.082212, 1, 0.4784314, 0, 1,
-1.33919, 0.9054614, -1.021836, 1, 0.4862745, 0, 1,
-1.337529, 1.032785, -0.6389437, 1, 0.4901961, 0, 1,
-1.33564, -0.03503174, -0.03318899, 1, 0.4980392, 0, 1,
-1.328671, -0.8598596, -2.582186, 1, 0.5058824, 0, 1,
-1.322339, 1.215961, 0.0325287, 1, 0.509804, 0, 1,
-1.30655, -0.5436511, -0.2832997, 1, 0.5176471, 0, 1,
-1.304811, 1.867087, -0.8329006, 1, 0.5215687, 0, 1,
-1.295272, -0.4037583, -3.803808, 1, 0.5294118, 0, 1,
-1.285308, 0.762717, -0.7727067, 1, 0.5333334, 0, 1,
-1.274359, 1.16339, -1.507418, 1, 0.5411765, 0, 1,
-1.270405, 0.2199109, -0.6157721, 1, 0.5450981, 0, 1,
-1.264252, 0.6995426, 0.5194461, 1, 0.5529412, 0, 1,
-1.261217, -1.431007, -2.038239, 1, 0.5568628, 0, 1,
-1.256306, 0.2377253, -2.417384, 1, 0.5647059, 0, 1,
-1.236719, -0.4725196, -2.077906, 1, 0.5686275, 0, 1,
-1.234513, -0.2668996, -1.940085, 1, 0.5764706, 0, 1,
-1.229149, -1.682032, -1.493446, 1, 0.5803922, 0, 1,
-1.228146, 0.04162794, -2.467167, 1, 0.5882353, 0, 1,
-1.218179, 0.4777395, -1.929404, 1, 0.5921569, 0, 1,
-1.216555, -0.9350287, -2.247683, 1, 0.6, 0, 1,
-1.211397, -0.1816119, -0.6869165, 1, 0.6078432, 0, 1,
-1.20056, -0.5207503, -1.574713, 1, 0.6117647, 0, 1,
-1.196218, 1.039976, -1.849731, 1, 0.6196079, 0, 1,
-1.178853, -1.758359, -3.684606, 1, 0.6235294, 0, 1,
-1.17383, 0.3446289, -3.208789, 1, 0.6313726, 0, 1,
-1.173702, 0.6341478, -1.329979, 1, 0.6352941, 0, 1,
-1.170529, -1.735264, -3.730887, 1, 0.6431373, 0, 1,
-1.162642, -0.2071882, -1.331654, 1, 0.6470588, 0, 1,
-1.151895, -0.8784293, -2.097915, 1, 0.654902, 0, 1,
-1.149595, 0.348244, 1.059281, 1, 0.6588235, 0, 1,
-1.1489, -0.9920703, -2.034288, 1, 0.6666667, 0, 1,
-1.145794, -0.5264648, -0.206323, 1, 0.6705883, 0, 1,
-1.141055, 0.9387834, -2.427885, 1, 0.6784314, 0, 1,
-1.140323, 0.500585, -2.457032, 1, 0.682353, 0, 1,
-1.139601, -0.08195325, -1.461059, 1, 0.6901961, 0, 1,
-1.137012, 0.8831935, -0.7448678, 1, 0.6941177, 0, 1,
-1.135598, -0.2553505, -2.236863, 1, 0.7019608, 0, 1,
-1.12575, 1.622989, -0.07385547, 1, 0.7098039, 0, 1,
-1.123109, 1.392712, -0.1861968, 1, 0.7137255, 0, 1,
-1.115847, -1.35983, -3.172931, 1, 0.7215686, 0, 1,
-1.11052, 0.6564474, -0.7972128, 1, 0.7254902, 0, 1,
-1.104019, 1.352009, 0.3361606, 1, 0.7333333, 0, 1,
-1.102, -0.6913376, -1.655583, 1, 0.7372549, 0, 1,
-1.099509, -0.5405735, -3.298327, 1, 0.7450981, 0, 1,
-1.09728, 0.4621865, -1.569912, 1, 0.7490196, 0, 1,
-1.079616, -0.2409617, -3.094702, 1, 0.7568628, 0, 1,
-1.079351, 1.478642, -1.213853, 1, 0.7607843, 0, 1,
-1.073043, 1.069968, 0.7958082, 1, 0.7686275, 0, 1,
-1.065368, -1.29749, -2.093866, 1, 0.772549, 0, 1,
-1.065365, -0.7637311, -0.5035791, 1, 0.7803922, 0, 1,
-1.062384, 1.321031, -1.176278, 1, 0.7843137, 0, 1,
-1.054088, 2.410837, 0.937314, 1, 0.7921569, 0, 1,
-1.04628, 0.386658, -1.347565, 1, 0.7960784, 0, 1,
-1.043921, 0.1440598, -1.743949, 1, 0.8039216, 0, 1,
-1.033759, 0.4873238, -1.221789, 1, 0.8117647, 0, 1,
-1.031137, -0.6597271, -2.741412, 1, 0.8156863, 0, 1,
-1.03001, 0.09905434, -2.500904, 1, 0.8235294, 0, 1,
-1.028913, 0.5741673, -0.775399, 1, 0.827451, 0, 1,
-1.023559, 0.2861645, -1.573135, 1, 0.8352941, 0, 1,
-1.020721, 0.3916999, -2.036283, 1, 0.8392157, 0, 1,
-1.017204, -0.362363, -2.537389, 1, 0.8470588, 0, 1,
-1.012321, -0.4947307, -2.40836, 1, 0.8509804, 0, 1,
-1.010576, 0.9815617, -1.370205, 1, 0.8588235, 0, 1,
-1.004206, 0.2743215, -1.892022, 1, 0.8627451, 0, 1,
-0.9931802, 1.614495, -1.21216, 1, 0.8705882, 0, 1,
-0.9837728, -0.3753613, -0.5716495, 1, 0.8745098, 0, 1,
-0.9719849, 0.458138, 0.3352605, 1, 0.8823529, 0, 1,
-0.9687396, -1.104395, -1.247484, 1, 0.8862745, 0, 1,
-0.9437603, 0.8771726, -2.760421, 1, 0.8941177, 0, 1,
-0.9372207, 0.06331951, -4.366685, 1, 0.8980392, 0, 1,
-0.926874, -0.07975005, -2.261972, 1, 0.9058824, 0, 1,
-0.9189005, -0.7518456, -3.632758, 1, 0.9137255, 0, 1,
-0.9187645, 0.455172, -1.161781, 1, 0.9176471, 0, 1,
-0.9162681, -0.004193791, -1.837225, 1, 0.9254902, 0, 1,
-0.9052841, -0.3852563, -0.6939911, 1, 0.9294118, 0, 1,
-0.9050306, -0.4500061, -2.226798, 1, 0.9372549, 0, 1,
-0.9008125, -1.531807, -2.575667, 1, 0.9411765, 0, 1,
-0.8922045, -2.012762, -1.876066, 1, 0.9490196, 0, 1,
-0.8897559, 0.3367512, 0.1493482, 1, 0.9529412, 0, 1,
-0.8871462, -0.6953826, -1.783739, 1, 0.9607843, 0, 1,
-0.8844996, 0.6854475, -0.1983789, 1, 0.9647059, 0, 1,
-0.8799625, -0.6778876, -3.547491, 1, 0.972549, 0, 1,
-0.8776334, 0.6840043, -0.8733717, 1, 0.9764706, 0, 1,
-0.8732039, -1.120002, -2.993589, 1, 0.9843137, 0, 1,
-0.8616815, -0.1303897, -2.935665, 1, 0.9882353, 0, 1,
-0.8559206, 0.1479266, -0.9724089, 1, 0.9960784, 0, 1,
-0.8499237, -1.094714, -2.305015, 0.9960784, 1, 0, 1,
-0.8416843, -0.0007203875, -1.220764, 0.9921569, 1, 0, 1,
-0.8404618, 0.494022, 0.2441074, 0.9843137, 1, 0, 1,
-0.838376, -0.5458356, -0.9760389, 0.9803922, 1, 0, 1,
-0.8357947, 0.6604512, -0.3780118, 0.972549, 1, 0, 1,
-0.8291803, -0.6972116, -2.453544, 0.9686275, 1, 0, 1,
-0.8278539, 0.6082045, 0.6872509, 0.9607843, 1, 0, 1,
-0.8231189, 0.4015261, -3.27476, 0.9568627, 1, 0, 1,
-0.8137302, 1.154413, -1.200478, 0.9490196, 1, 0, 1,
-0.8133421, -0.3906097, -2.44171, 0.945098, 1, 0, 1,
-0.8121074, 0.2703155, -1.381509, 0.9372549, 1, 0, 1,
-0.8059816, -0.549809, -1.406339, 0.9333333, 1, 0, 1,
-0.8026784, 1.364341, -1.605111, 0.9254902, 1, 0, 1,
-0.7997847, 0.7769382, -0.9977691, 0.9215686, 1, 0, 1,
-0.7967021, -0.08815167, -1.234157, 0.9137255, 1, 0, 1,
-0.793154, -1.347109, -1.751227, 0.9098039, 1, 0, 1,
-0.7906033, 1.112926, -1.40655, 0.9019608, 1, 0, 1,
-0.789431, -0.178515, -2.242432, 0.8941177, 1, 0, 1,
-0.7849599, 0.4763036, -0.7649876, 0.8901961, 1, 0, 1,
-0.7821326, 1.307823, -1.067181, 0.8823529, 1, 0, 1,
-0.7775645, 0.5529435, -0.39192, 0.8784314, 1, 0, 1,
-0.7774406, -0.7114348, -2.742591, 0.8705882, 1, 0, 1,
-0.7742169, -0.0393563, -2.124734, 0.8666667, 1, 0, 1,
-0.7729696, -0.0732829, -1.914647, 0.8588235, 1, 0, 1,
-0.771079, -0.3706906, -3.015072, 0.854902, 1, 0, 1,
-0.7707552, -0.8016008, -3.509122, 0.8470588, 1, 0, 1,
-0.7685826, 0.475945, -0.6087627, 0.8431373, 1, 0, 1,
-0.7655089, -0.7478817, -2.813698, 0.8352941, 1, 0, 1,
-0.7527564, 0.7924315, -0.908008, 0.8313726, 1, 0, 1,
-0.752488, -0.1916808, -3.077963, 0.8235294, 1, 0, 1,
-0.7475309, -0.9525511, -2.994234, 0.8196079, 1, 0, 1,
-0.7442465, 0.1590403, -0.7373639, 0.8117647, 1, 0, 1,
-0.7428862, -0.6839178, -0.925544, 0.8078431, 1, 0, 1,
-0.7420504, -1.064633, -1.298013, 0.8, 1, 0, 1,
-0.7367862, 0.08051815, -2.123601, 0.7921569, 1, 0, 1,
-0.7302818, 0.7974443, -2.439481, 0.7882353, 1, 0, 1,
-0.723312, 0.9405815, -0.2197179, 0.7803922, 1, 0, 1,
-0.7175591, -0.2478597, -1.496768, 0.7764706, 1, 0, 1,
-0.7170742, 1.32746, 0.8660336, 0.7686275, 1, 0, 1,
-0.7162014, 0.1640348, -1.928212, 0.7647059, 1, 0, 1,
-0.7161449, -0.1466319, 0.1001146, 0.7568628, 1, 0, 1,
-0.7104725, -0.4364861, -3.663367, 0.7529412, 1, 0, 1,
-0.7039136, -0.7557818, -2.39864, 0.7450981, 1, 0, 1,
-0.7038119, 0.7025783, 0.2821085, 0.7411765, 1, 0, 1,
-0.7022299, -1.416485, -0.1792716, 0.7333333, 1, 0, 1,
-0.7016171, -2.27754, -2.061953, 0.7294118, 1, 0, 1,
-0.7003033, 1.848079, -0.3609292, 0.7215686, 1, 0, 1,
-0.6962302, -1.025601, -1.748707, 0.7176471, 1, 0, 1,
-0.6808938, 0.1963922, -1.718952, 0.7098039, 1, 0, 1,
-0.6770965, -0.3183395, -3.339375, 0.7058824, 1, 0, 1,
-0.674872, 1.248183, -1.136444, 0.6980392, 1, 0, 1,
-0.6689218, 1.403612, -2.189543, 0.6901961, 1, 0, 1,
-0.66449, 0.3058001, -1.023427, 0.6862745, 1, 0, 1,
-0.6627719, -0.3118185, -2.117417, 0.6784314, 1, 0, 1,
-0.6620283, -1.754205, -2.64768, 0.6745098, 1, 0, 1,
-0.6615618, 1.870611, -0.9320104, 0.6666667, 1, 0, 1,
-0.6579805, -1.663516, -3.74028, 0.6627451, 1, 0, 1,
-0.6575058, -0.3256069, -2.558155, 0.654902, 1, 0, 1,
-0.6572158, -0.5601249, -1.993313, 0.6509804, 1, 0, 1,
-0.6372716, -2.70942, -1.80681, 0.6431373, 1, 0, 1,
-0.6314374, 0.1779143, -1.417211, 0.6392157, 1, 0, 1,
-0.6291055, 0.06227724, 0.5071427, 0.6313726, 1, 0, 1,
-0.6262789, -0.4671246, -2.25317, 0.627451, 1, 0, 1,
-0.6225312, 0.8207191, 1.842867, 0.6196079, 1, 0, 1,
-0.6160227, 1.385229, 0.5453149, 0.6156863, 1, 0, 1,
-0.6156464, 0.8834636, 0.3867359, 0.6078432, 1, 0, 1,
-0.6097691, 0.3921708, -0.472953, 0.6039216, 1, 0, 1,
-0.6055856, -0.7914404, -3.581807, 0.5960785, 1, 0, 1,
-0.6033198, -0.3627731, -1.477033, 0.5882353, 1, 0, 1,
-0.6005338, 0.233029, -1.309026, 0.5843138, 1, 0, 1,
-0.596671, 0.2839386, 0.1838482, 0.5764706, 1, 0, 1,
-0.594461, -1.425408, -2.15866, 0.572549, 1, 0, 1,
-0.594229, 1.318993, -0.5160238, 0.5647059, 1, 0, 1,
-0.5888372, -0.404517, -2.19321, 0.5607843, 1, 0, 1,
-0.5874731, -1.464798, -2.054825, 0.5529412, 1, 0, 1,
-0.5862381, -1.047503, -3.44859, 0.5490196, 1, 0, 1,
-0.5848551, -0.8879133, -3.177433, 0.5411765, 1, 0, 1,
-0.5836017, 1.025003, -0.3463517, 0.5372549, 1, 0, 1,
-0.5835834, -1.102158, -2.296985, 0.5294118, 1, 0, 1,
-0.5817872, 0.02509226, -1.450236, 0.5254902, 1, 0, 1,
-0.5811057, -1.956155, -3.563567, 0.5176471, 1, 0, 1,
-0.5750536, 0.6440101, -0.2406089, 0.5137255, 1, 0, 1,
-0.5748864, 0.8605052, -0.119893, 0.5058824, 1, 0, 1,
-0.5670135, -2.448296, -2.269227, 0.5019608, 1, 0, 1,
-0.560625, -1.825798, -3.511509, 0.4941176, 1, 0, 1,
-0.5571907, 0.4453439, -2.121412, 0.4862745, 1, 0, 1,
-0.5556157, -1.610866, -3.958666, 0.4823529, 1, 0, 1,
-0.5539501, 0.5239324, -0.7540759, 0.4745098, 1, 0, 1,
-0.550114, 0.4298855, -0.5890231, 0.4705882, 1, 0, 1,
-0.5495929, -1.157015, -3.427767, 0.4627451, 1, 0, 1,
-0.5488637, -1.447844, -3.309799, 0.4588235, 1, 0, 1,
-0.5468941, 2.470587, -0.1139678, 0.4509804, 1, 0, 1,
-0.5390802, 0.5612999, -1.385714, 0.4470588, 1, 0, 1,
-0.5388646, -0.3961356, -1.987954, 0.4392157, 1, 0, 1,
-0.5326698, -0.669354, -3.295303, 0.4352941, 1, 0, 1,
-0.5314367, 0.1534944, -1.635858, 0.427451, 1, 0, 1,
-0.5300249, -0.5220953, -2.161818, 0.4235294, 1, 0, 1,
-0.5281996, -1.205431, -4.331125, 0.4156863, 1, 0, 1,
-0.5248489, -0.9452721, -2.363762, 0.4117647, 1, 0, 1,
-0.5244005, -0.275619, -0.7274162, 0.4039216, 1, 0, 1,
-0.5219881, 1.105796, -0.6850599, 0.3960784, 1, 0, 1,
-0.5192106, -0.390794, -3.065465, 0.3921569, 1, 0, 1,
-0.5190704, 1.396173, -1.24676, 0.3843137, 1, 0, 1,
-0.5171929, 1.282926, -0.2145958, 0.3803922, 1, 0, 1,
-0.5125675, 1.182969, -0.7708089, 0.372549, 1, 0, 1,
-0.5108224, -0.1189868, -0.5938528, 0.3686275, 1, 0, 1,
-0.5084754, 0.1693367, -2.034679, 0.3607843, 1, 0, 1,
-0.5080984, -0.218023, -2.216532, 0.3568628, 1, 0, 1,
-0.5046756, 1.129164, 1.031699, 0.3490196, 1, 0, 1,
-0.5008096, 0.4434239, 0.5338247, 0.345098, 1, 0, 1,
-0.4989185, -1.81722, -2.006309, 0.3372549, 1, 0, 1,
-0.4969153, 0.09290285, -0.5020953, 0.3333333, 1, 0, 1,
-0.4961917, 0.636409, -0.6130558, 0.3254902, 1, 0, 1,
-0.4959438, -2.044089, -2.961429, 0.3215686, 1, 0, 1,
-0.4928442, 0.5840003, -1.204513, 0.3137255, 1, 0, 1,
-0.4888377, -0.2704891, -1.960627, 0.3098039, 1, 0, 1,
-0.488027, -1.34192, -3.24355, 0.3019608, 1, 0, 1,
-0.4831012, 0.328474, 0.7366928, 0.2941177, 1, 0, 1,
-0.4812615, -1.022894, -2.981472, 0.2901961, 1, 0, 1,
-0.4795978, 0.4172938, -1.968785, 0.282353, 1, 0, 1,
-0.4785664, -1.240719, -4.071556, 0.2784314, 1, 0, 1,
-0.476331, 0.7289087, -0.5957164, 0.2705882, 1, 0, 1,
-0.4751971, 0.924965, 1.337415, 0.2666667, 1, 0, 1,
-0.4725481, -1.401994, -3.236474, 0.2588235, 1, 0, 1,
-0.4725314, -0.7719504, -1.433572, 0.254902, 1, 0, 1,
-0.4705096, -0.5149541, -2.450505, 0.2470588, 1, 0, 1,
-0.4692009, 1.566729, 0.2509652, 0.2431373, 1, 0, 1,
-0.4683543, 0.3522123, -1.065171, 0.2352941, 1, 0, 1,
-0.4651594, -0.7918329, -2.439205, 0.2313726, 1, 0, 1,
-0.4645363, 0.2159853, 0.317881, 0.2235294, 1, 0, 1,
-0.4640375, 0.5956312, -0.8301547, 0.2196078, 1, 0, 1,
-0.4604029, -0.7500171, -1.314966, 0.2117647, 1, 0, 1,
-0.4593517, -0.7668577, -3.271318, 0.2078431, 1, 0, 1,
-0.4581945, 0.1419877, 0.9786568, 0.2, 1, 0, 1,
-0.4569521, 0.6648337, -0.8284812, 0.1921569, 1, 0, 1,
-0.4542897, 0.8196713, -1.041998, 0.1882353, 1, 0, 1,
-0.4459168, 0.193909, 0.6186324, 0.1803922, 1, 0, 1,
-0.4335496, 0.7798126, -1.095076, 0.1764706, 1, 0, 1,
-0.4318735, 0.1340825, -1.094501, 0.1686275, 1, 0, 1,
-0.4293191, 0.7404803, -0.3591262, 0.1647059, 1, 0, 1,
-0.4268034, -0.05272065, -0.7600965, 0.1568628, 1, 0, 1,
-0.4234722, -1.530883, -1.466405, 0.1529412, 1, 0, 1,
-0.422131, 0.8269995, -0.1422293, 0.145098, 1, 0, 1,
-0.4186229, -1.32653, -4.006177, 0.1411765, 1, 0, 1,
-0.4176653, 0.7627777, -0.5955829, 0.1333333, 1, 0, 1,
-0.4165753, 1.416742, 0.01893597, 0.1294118, 1, 0, 1,
-0.4153882, -2.276762, -3.449939, 0.1215686, 1, 0, 1,
-0.4137017, 1.256547, 0.3437164, 0.1176471, 1, 0, 1,
-0.4136673, 0.3207372, 0.2846453, 0.1098039, 1, 0, 1,
-0.4088573, 0.6157118, -0.9177713, 0.1058824, 1, 0, 1,
-0.4085207, -2.722277, -1.487091, 0.09803922, 1, 0, 1,
-0.4071443, 0.7713574, -0.651116, 0.09019608, 1, 0, 1,
-0.4004759, -0.65644, -3.04372, 0.08627451, 1, 0, 1,
-0.3923259, -1.958673, -4.287922, 0.07843138, 1, 0, 1,
-0.3918045, 0.5059651, -1.676195, 0.07450981, 1, 0, 1,
-0.3888101, 1.757988, -1.322165, 0.06666667, 1, 0, 1,
-0.3836279, -1.714796, -3.033236, 0.0627451, 1, 0, 1,
-0.3791302, -0.2580084, -4.682161, 0.05490196, 1, 0, 1,
-0.3791108, -0.08437781, -2.055739, 0.05098039, 1, 0, 1,
-0.3728248, 0.178539, -1.381774, 0.04313726, 1, 0, 1,
-0.3704204, 0.76292, -1.094402, 0.03921569, 1, 0, 1,
-0.3693768, -0.3490955, -1.898582, 0.03137255, 1, 0, 1,
-0.3687036, 1.839103, -0.7781811, 0.02745098, 1, 0, 1,
-0.3684605, 0.6684001, -0.1110398, 0.01960784, 1, 0, 1,
-0.3655842, -0.9044688, -1.857408, 0.01568628, 1, 0, 1,
-0.3647755, 1.287794, -0.2452804, 0.007843138, 1, 0, 1,
-0.3637037, 1.491811, 0.4947065, 0.003921569, 1, 0, 1,
-0.362962, -0.8119233, -2.72426, 0, 1, 0.003921569, 1,
-0.3625212, -0.4714619, -3.248548, 0, 1, 0.01176471, 1,
-0.361616, 0.2326703, -1.399939, 0, 1, 0.01568628, 1,
-0.3589569, -1.079402, -2.195434, 0, 1, 0.02352941, 1,
-0.3542172, 0.4258444, -2.007239, 0, 1, 0.02745098, 1,
-0.352189, 0.0273923, 0.1331276, 0, 1, 0.03529412, 1,
-0.3508745, -1.208873, -1.80607, 0, 1, 0.03921569, 1,
-0.350308, 0.14843, -0.7386893, 0, 1, 0.04705882, 1,
-0.3494015, -1.22886, -2.560737, 0, 1, 0.05098039, 1,
-0.348435, 0.06664938, -0.7561564, 0, 1, 0.05882353, 1,
-0.3468975, 0.07726758, -1.100843, 0, 1, 0.0627451, 1,
-0.3459974, -0.6139082, -4.124044, 0, 1, 0.07058824, 1,
-0.3404078, 0.1144586, -2.314266, 0, 1, 0.07450981, 1,
-0.3399221, -2.033297, -2.057883, 0, 1, 0.08235294, 1,
-0.3348275, -0.01177468, -1.031723, 0, 1, 0.08627451, 1,
-0.3338421, -1.154823, -3.659181, 0, 1, 0.09411765, 1,
-0.3296808, -0.03411056, -2.862199, 0, 1, 0.1019608, 1,
-0.3270675, 0.3267303, -0.4992571, 0, 1, 0.1058824, 1,
-0.3226194, 0.2747459, 0.336762, 0, 1, 0.1137255, 1,
-0.3166371, 0.4155487, -0.8704781, 0, 1, 0.1176471, 1,
-0.3157001, 0.9160851, 0.09994061, 0, 1, 0.1254902, 1,
-0.3142867, -0.2338235, -2.473675, 0, 1, 0.1294118, 1,
-0.3133982, 0.7968152, 0.1405086, 0, 1, 0.1372549, 1,
-0.3127826, -0.1183252, -1.685378, 0, 1, 0.1411765, 1,
-0.3092881, 1.259951, 1.00995, 0, 1, 0.1490196, 1,
-0.3066953, 2.280923, 1.153604, 0, 1, 0.1529412, 1,
-0.2985727, 0.9397631, -1.773244, 0, 1, 0.1607843, 1,
-0.2949771, -1.408995, -2.652243, 0, 1, 0.1647059, 1,
-0.2926304, -1.28708, -4.605827, 0, 1, 0.172549, 1,
-0.2869886, -0.5611566, -3.148767, 0, 1, 0.1764706, 1,
-0.2834097, -1.559588, -0.7945456, 0, 1, 0.1843137, 1,
-0.2828295, 1.459022, 0.5713717, 0, 1, 0.1882353, 1,
-0.2794633, -0.3980806, -3.839851, 0, 1, 0.1960784, 1,
-0.2779587, -0.3699733, -2.304451, 0, 1, 0.2039216, 1,
-0.2742552, 1.206618, 0.193587, 0, 1, 0.2078431, 1,
-0.2680128, -0.7237772, -3.208751, 0, 1, 0.2156863, 1,
-0.2670612, -0.7285162, -1.988531, 0, 1, 0.2196078, 1,
-0.2651994, 0.9900489, 0.4165068, 0, 1, 0.227451, 1,
-0.2593987, -2.258889, -1.748328, 0, 1, 0.2313726, 1,
-0.2573184, -0.1709275, -2.029854, 0, 1, 0.2392157, 1,
-0.2565442, 2.168574, -1.212561, 0, 1, 0.2431373, 1,
-0.2548695, -0.1897918, -1.631761, 0, 1, 0.2509804, 1,
-0.2500516, 0.0366699, -2.709544, 0, 1, 0.254902, 1,
-0.2497602, 1.883488, 1.271388, 0, 1, 0.2627451, 1,
-0.2478931, 0.729819, -0.5630227, 0, 1, 0.2666667, 1,
-0.2463932, 0.2550205, -0.6501989, 0, 1, 0.2745098, 1,
-0.2425195, -0.9103939, -2.332018, 0, 1, 0.2784314, 1,
-0.2423025, -0.3683448, -4.879666, 0, 1, 0.2862745, 1,
-0.2416006, -0.07762649, -2.400084, 0, 1, 0.2901961, 1,
-0.2374219, -0.453411, -1.892161, 0, 1, 0.2980392, 1,
-0.2345243, -0.4481857, -2.892664, 0, 1, 0.3058824, 1,
-0.2342148, -2.219608, -3.167615, 0, 1, 0.3098039, 1,
-0.2321368, 1.170463, -0.3853071, 0, 1, 0.3176471, 1,
-0.2249395, -0.3745373, -3.093495, 0, 1, 0.3215686, 1,
-0.2239568, -1.111629, -1.581666, 0, 1, 0.3294118, 1,
-0.2205948, 0.5085173, 0.7178676, 0, 1, 0.3333333, 1,
-0.2181644, 1.430057, -0.1078122, 0, 1, 0.3411765, 1,
-0.2162593, 0.5208602, 0.1313017, 0, 1, 0.345098, 1,
-0.2100819, 0.3113607, -1.027829, 0, 1, 0.3529412, 1,
-0.2065437, -0.9691756, -3.182062, 0, 1, 0.3568628, 1,
-0.2061808, -2.075008, -3.224706, 0, 1, 0.3647059, 1,
-0.205835, 1.478759, 0.1390567, 0, 1, 0.3686275, 1,
-0.2041709, -0.6963475, -4.593706, 0, 1, 0.3764706, 1,
-0.2032252, -0.07207549, -2.832392, 0, 1, 0.3803922, 1,
-0.2025165, 0.2345619, -1.403489, 0, 1, 0.3882353, 1,
-0.1990894, 0.5277434, -2.120257, 0, 1, 0.3921569, 1,
-0.1989017, 0.2320154, -0.8770168, 0, 1, 0.4, 1,
-0.198566, 1.648969, -2.045344, 0, 1, 0.4078431, 1,
-0.1951563, 1.76202, 1.426643, 0, 1, 0.4117647, 1,
-0.1939915, 0.8529702, -0.7011303, 0, 1, 0.4196078, 1,
-0.1897854, -0.5290706, -2.624115, 0, 1, 0.4235294, 1,
-0.1893748, -1.862152, -3.649115, 0, 1, 0.4313726, 1,
-0.1846053, -1.171212, -4.625896, 0, 1, 0.4352941, 1,
-0.1827514, -1.434209, -2.27065, 0, 1, 0.4431373, 1,
-0.1824426, 0.6159636, -0.8750647, 0, 1, 0.4470588, 1,
-0.1731596, 1.605555, 1.832525, 0, 1, 0.454902, 1,
-0.1691311, -1.18614, -5.276358, 0, 1, 0.4588235, 1,
-0.16619, -0.8384101, -2.337464, 0, 1, 0.4666667, 1,
-0.1653648, -2.375499, -2.633592, 0, 1, 0.4705882, 1,
-0.164533, 0.690475, -3.006261, 0, 1, 0.4784314, 1,
-0.163276, 0.9032207, 0.7898843, 0, 1, 0.4823529, 1,
-0.1589699, 0.5038249, 0.322578, 0, 1, 0.4901961, 1,
-0.1577157, 0.04834979, -1.549344, 0, 1, 0.4941176, 1,
-0.1553137, -0.2316526, -1.855767, 0, 1, 0.5019608, 1,
-0.152956, -0.4488705, -2.452662, 0, 1, 0.509804, 1,
-0.1513736, -0.7783967, -2.915116, 0, 1, 0.5137255, 1,
-0.1494833, 0.1033298, -0.9262353, 0, 1, 0.5215687, 1,
-0.1463947, -1.341677, -3.656789, 0, 1, 0.5254902, 1,
-0.1443344, 0.1630431, -1.796694, 0, 1, 0.5333334, 1,
-0.1433605, 0.06801784, -1.525654, 0, 1, 0.5372549, 1,
-0.1423114, -1.076742, -3.644383, 0, 1, 0.5450981, 1,
-0.1413712, 0.8787282, -0.3605767, 0, 1, 0.5490196, 1,
-0.1403636, 2.334469, 0.0440947, 0, 1, 0.5568628, 1,
-0.1385787, 0.8480228, 0.1448034, 0, 1, 0.5607843, 1,
-0.1378582, 0.9526559, -1.308473, 0, 1, 0.5686275, 1,
-0.136887, -1.653037, -3.317283, 0, 1, 0.572549, 1,
-0.1367587, -0.1843877, -1.949544, 0, 1, 0.5803922, 1,
-0.1356644, 0.0705225, -0.7410783, 0, 1, 0.5843138, 1,
-0.1336372, 0.3770573, -2.000102, 0, 1, 0.5921569, 1,
-0.1312791, 1.440431, -1.419125, 0, 1, 0.5960785, 1,
-0.1305326, -1.687065, -5.656077, 0, 1, 0.6039216, 1,
-0.1243835, -0.8818933, -4.402818, 0, 1, 0.6117647, 1,
-0.1205359, 1.188938, 0.003544967, 0, 1, 0.6156863, 1,
-0.1178333, 0.6892156, 1.037236, 0, 1, 0.6235294, 1,
-0.1160595, -0.5197373, -1.344269, 0, 1, 0.627451, 1,
-0.114139, 0.2471707, 0.6332741, 0, 1, 0.6352941, 1,
-0.1113088, -1.271303, -4.184407, 0, 1, 0.6392157, 1,
-0.1104049, -0.5166505, -4.16272, 0, 1, 0.6470588, 1,
-0.1075524, 0.7682332, 1.508537, 0, 1, 0.6509804, 1,
-0.1050146, -0.2467892, -4.436866, 0, 1, 0.6588235, 1,
-0.1021944, 0.7377685, -1.034727, 0, 1, 0.6627451, 1,
-0.1009654, 1.302341, 0.3014913, 0, 1, 0.6705883, 1,
-0.09235854, -0.7447197, -2.648468, 0, 1, 0.6745098, 1,
-0.09200796, 2.012191, -0.7192563, 0, 1, 0.682353, 1,
-0.08955196, -1.664214, -1.959843, 0, 1, 0.6862745, 1,
-0.0895348, 0.2802725, -1.693669, 0, 1, 0.6941177, 1,
-0.08491533, 0.6398522, 0.2208903, 0, 1, 0.7019608, 1,
-0.08398727, -0.1846538, -2.495513, 0, 1, 0.7058824, 1,
-0.08049476, 1.719706, 0.8642126, 0, 1, 0.7137255, 1,
-0.0769131, -0.3000976, -4.033104, 0, 1, 0.7176471, 1,
-0.07521676, 1.890645, -1.459018, 0, 1, 0.7254902, 1,
-0.07195289, -0.7637848, -2.990152, 0, 1, 0.7294118, 1,
-0.06953599, -0.1615654, -1.493637, 0, 1, 0.7372549, 1,
-0.06928992, -0.2549866, -2.602028, 0, 1, 0.7411765, 1,
-0.06474611, -0.5241187, -2.938005, 0, 1, 0.7490196, 1,
-0.05862032, 0.3059951, -0.3282724, 0, 1, 0.7529412, 1,
-0.05803907, 0.08732148, 0.1186862, 0, 1, 0.7607843, 1,
-0.05677365, 1.058933, 0.005523925, 0, 1, 0.7647059, 1,
-0.05610519, 1.117657, -0.9401187, 0, 1, 0.772549, 1,
-0.05442454, -0.1879772, -3.834513, 0, 1, 0.7764706, 1,
-0.04931294, 2.275368, 0.463031, 0, 1, 0.7843137, 1,
-0.04669805, -0.8689398, -2.297247, 0, 1, 0.7882353, 1,
-0.04647273, 0.3818848, -0.4386144, 0, 1, 0.7960784, 1,
-0.04460396, -1.201429, -4.040887, 0, 1, 0.8039216, 1,
-0.04218002, -0.9400626, -4.420355, 0, 1, 0.8078431, 1,
-0.04134081, -0.7903133, -0.4324946, 0, 1, 0.8156863, 1,
-0.0392475, -0.08835085, -2.886297, 0, 1, 0.8196079, 1,
-0.03695417, 0.7887442, -0.72629, 0, 1, 0.827451, 1,
-0.03423733, -1.47557, -2.266037, 0, 1, 0.8313726, 1,
-0.03410722, 0.3678632, 0.1265642, 0, 1, 0.8392157, 1,
-0.0340908, 0.09115289, -2.004665, 0, 1, 0.8431373, 1,
-0.02810334, -0.1097279, -2.726267, 0, 1, 0.8509804, 1,
-0.02486331, 1.825174, 1.371797, 0, 1, 0.854902, 1,
-0.02148063, -1.369288, -3.598619, 0, 1, 0.8627451, 1,
-0.02120246, 1.113711, -0.101349, 0, 1, 0.8666667, 1,
-0.02014895, -0.7821571, -3.519722, 0, 1, 0.8745098, 1,
-0.01888323, 0.5666382, -0.3456239, 0, 1, 0.8784314, 1,
-0.01206821, -0.1762884, -3.499601, 0, 1, 0.8862745, 1,
-0.009846512, -0.7660941, -2.435781, 0, 1, 0.8901961, 1,
-0.005719661, -0.2467292, -2.660075, 0, 1, 0.8980392, 1,
-0.001392153, -1.090725, -3.951394, 0, 1, 0.9058824, 1,
-0.000858984, 0.4744106, -0.6577407, 0, 1, 0.9098039, 1,
0.004761904, 1.910608, -0.2175122, 0, 1, 0.9176471, 1,
0.005089868, 0.8028534, -0.1327172, 0, 1, 0.9215686, 1,
0.00642508, -0.6955007, 5.463772, 0, 1, 0.9294118, 1,
0.006478759, -1.298335, 4.265852, 0, 1, 0.9333333, 1,
0.01009201, 0.154007, 0.6698454, 0, 1, 0.9411765, 1,
0.01112503, -1.100009, 3.315302, 0, 1, 0.945098, 1,
0.0113262, 0.118136, 0.03422909, 0, 1, 0.9529412, 1,
0.01154553, -1.074137, 3.533996, 0, 1, 0.9568627, 1,
0.01233379, 0.3983156, -0.2001078, 0, 1, 0.9647059, 1,
0.01732703, -0.1439351, 3.179037, 0, 1, 0.9686275, 1,
0.02052649, 1.059515, -1.462141, 0, 1, 0.9764706, 1,
0.02264865, 1.630343, -0.2449613, 0, 1, 0.9803922, 1,
0.02889788, 2.066593, 1.196626, 0, 1, 0.9882353, 1,
0.03081916, 0.5723149, -1.192116, 0, 1, 0.9921569, 1,
0.0308368, -0.395965, 3.828686, 0, 1, 1, 1,
0.03786505, -0.09436564, 1.234189, 0, 0.9921569, 1, 1,
0.03922873, -1.035349, 3.381331, 0, 0.9882353, 1, 1,
0.03952345, -0.262592, 1.952085, 0, 0.9803922, 1, 1,
0.03998874, 0.4613072, -1.054583, 0, 0.9764706, 1, 1,
0.04154887, 0.5112482, -0.5814837, 0, 0.9686275, 1, 1,
0.04224648, 0.415975, 0.04041222, 0, 0.9647059, 1, 1,
0.04737748, 1.007633, 0.1118743, 0, 0.9568627, 1, 1,
0.04852113, -1.381939, 1.349422, 0, 0.9529412, 1, 1,
0.04976217, 0.8368569, -0.5314103, 0, 0.945098, 1, 1,
0.04990385, 1.31214, -0.2499531, 0, 0.9411765, 1, 1,
0.05176677, 1.003367, 1.209504, 0, 0.9333333, 1, 1,
0.05562965, -1.321288, 2.458269, 0, 0.9294118, 1, 1,
0.05606054, -0.2010583, 2.146879, 0, 0.9215686, 1, 1,
0.05612854, -0.8495318, 0.7899219, 0, 0.9176471, 1, 1,
0.05784736, 0.7563307, -0.1087594, 0, 0.9098039, 1, 1,
0.05849851, -0.8740935, 3.899293, 0, 0.9058824, 1, 1,
0.06108812, -0.2449906, 2.932336, 0, 0.8980392, 1, 1,
0.06417503, -0.3847873, 2.357831, 0, 0.8901961, 1, 1,
0.06421007, 0.07765433, 0.201696, 0, 0.8862745, 1, 1,
0.06425709, 1.673377, 0.2640758, 0, 0.8784314, 1, 1,
0.06497431, -0.2532577, 2.708838, 0, 0.8745098, 1, 1,
0.0659094, 0.445519, 0.654438, 0, 0.8666667, 1, 1,
0.06772922, 0.6643218, -0.1964718, 0, 0.8627451, 1, 1,
0.07326696, 0.0102106, 1.132455, 0, 0.854902, 1, 1,
0.07362393, -0.1735779, 1.915867, 0, 0.8509804, 1, 1,
0.07507791, 0.4269488, -0.978111, 0, 0.8431373, 1, 1,
0.0766478, -0.7755139, 2.116376, 0, 0.8392157, 1, 1,
0.07794948, -1.918415, 5.070859, 0, 0.8313726, 1, 1,
0.08155023, -0.3363772, 2.808257, 0, 0.827451, 1, 1,
0.08260482, 0.6419866, 1.743747, 0, 0.8196079, 1, 1,
0.08434968, 0.200809, 1.274115, 0, 0.8156863, 1, 1,
0.08757353, 0.2266214, 1.287391, 0, 0.8078431, 1, 1,
0.08799727, 0.2058657, 2.48646, 0, 0.8039216, 1, 1,
0.08919317, 0.8914959, 1.113378, 0, 0.7960784, 1, 1,
0.09131352, -1.06245, 3.960408, 0, 0.7882353, 1, 1,
0.09273235, -0.5381149, 4.600771, 0, 0.7843137, 1, 1,
0.0935078, 1.33121, 0.03205648, 0, 0.7764706, 1, 1,
0.09658417, -1.807058, 5.813645, 0, 0.772549, 1, 1,
0.104059, -1.185917, 2.433115, 0, 0.7647059, 1, 1,
0.1051437, 0.2990956, -0.1582946, 0, 0.7607843, 1, 1,
0.1052676, -1.590864, 3.702101, 0, 0.7529412, 1, 1,
0.1107321, -0.9830027, 2.869965, 0, 0.7490196, 1, 1,
0.1144765, -0.8197747, 2.042346, 0, 0.7411765, 1, 1,
0.1150514, -0.2175134, 3.657359, 0, 0.7372549, 1, 1,
0.1163018, -0.8227341, 1.983976, 0, 0.7294118, 1, 1,
0.1178539, -1.735079, 2.002382, 0, 0.7254902, 1, 1,
0.121079, -0.1912712, 2.638014, 0, 0.7176471, 1, 1,
0.1215153, 0.1841225, 2.590302, 0, 0.7137255, 1, 1,
0.12293, -1.619491, 2.939286, 0, 0.7058824, 1, 1,
0.1312787, 0.275445, 0.07879348, 0, 0.6980392, 1, 1,
0.1314835, 2.850277, 2.202703, 0, 0.6941177, 1, 1,
0.1315823, 0.01230189, 2.273741, 0, 0.6862745, 1, 1,
0.1318887, 1.012565, -1.299117, 0, 0.682353, 1, 1,
0.1325181, 0.5814529, -0.03152611, 0, 0.6745098, 1, 1,
0.1336053, -1.374218, 3.830541, 0, 0.6705883, 1, 1,
0.1346667, 0.4162793, 0.2889248, 0, 0.6627451, 1, 1,
0.1367356, 0.3101854, 0.222598, 0, 0.6588235, 1, 1,
0.1388495, 1.139833, 0.7721162, 0, 0.6509804, 1, 1,
0.1406182, -1.917656, 2.91341, 0, 0.6470588, 1, 1,
0.1457725, -1.173662, 2.479916, 0, 0.6392157, 1, 1,
0.1467043, 0.494622, -1.396569, 0, 0.6352941, 1, 1,
0.161842, 0.01840885, 2.345058, 0, 0.627451, 1, 1,
0.1710825, 0.5907326, 0.1351902, 0, 0.6235294, 1, 1,
0.1730634, -0.1654957, 2.494454, 0, 0.6156863, 1, 1,
0.1775492, 0.838864, -0.2968812, 0, 0.6117647, 1, 1,
0.1829372, 0.4301965, -0.3709393, 0, 0.6039216, 1, 1,
0.1832524, -1.275501, 2.674099, 0, 0.5960785, 1, 1,
0.1881448, 0.08832923, 0.9424235, 0, 0.5921569, 1, 1,
0.1949157, -0.5700787, 3.37436, 0, 0.5843138, 1, 1,
0.1987327, -0.6082614, 1.864339, 0, 0.5803922, 1, 1,
0.2025759, -0.7233415, 1.269077, 0, 0.572549, 1, 1,
0.2054933, 0.6260184, 3.194567, 0, 0.5686275, 1, 1,
0.214715, -0.7666138, 3.610401, 0, 0.5607843, 1, 1,
0.2153436, -0.3934613, 2.600066, 0, 0.5568628, 1, 1,
0.2167142, -0.2961946, 2.780505, 0, 0.5490196, 1, 1,
0.219668, 0.4664451, -0.04658395, 0, 0.5450981, 1, 1,
0.2202913, 1.252411, 0.2424122, 0, 0.5372549, 1, 1,
0.2215822, 1.281539, 0.9022837, 0, 0.5333334, 1, 1,
0.2221891, -0.9668617, 3.120551, 0, 0.5254902, 1, 1,
0.2253041, 0.9645727, 0.9288363, 0, 0.5215687, 1, 1,
0.2254304, -0.1207377, 2.784463, 0, 0.5137255, 1, 1,
0.2295445, 0.935019, -0.6832322, 0, 0.509804, 1, 1,
0.2310992, 0.3896073, 3.523315, 0, 0.5019608, 1, 1,
0.2336866, 0.5263777, 1.028378, 0, 0.4941176, 1, 1,
0.2356698, -1.099374, 2.591063, 0, 0.4901961, 1, 1,
0.238619, 1.623862, -0.2626705, 0, 0.4823529, 1, 1,
0.2413369, -1.893242, 1.99605, 0, 0.4784314, 1, 1,
0.243833, -0.09754632, 2.305809, 0, 0.4705882, 1, 1,
0.2466124, -0.4209903, 2.299973, 0, 0.4666667, 1, 1,
0.2471022, -0.1555819, 4.256805, 0, 0.4588235, 1, 1,
0.2474303, 1.510456, -1.755842, 0, 0.454902, 1, 1,
0.2518228, 0.6038947, 0.5958685, 0, 0.4470588, 1, 1,
0.2520444, 1.225606, -1.33094, 0, 0.4431373, 1, 1,
0.2560609, -0.09871383, -0.2825096, 0, 0.4352941, 1, 1,
0.2578307, 1.004219, 0.3207628, 0, 0.4313726, 1, 1,
0.2586316, 0.7306589, -1.386346, 0, 0.4235294, 1, 1,
0.2597334, -0.07569891, 1.847788, 0, 0.4196078, 1, 1,
0.2632096, 0.5140775, -0.4825127, 0, 0.4117647, 1, 1,
0.2661689, 0.08680426, 1.819221, 0, 0.4078431, 1, 1,
0.267205, -0.9685076, 3.748121, 0, 0.4, 1, 1,
0.2700399, 0.5938469, 0.1967967, 0, 0.3921569, 1, 1,
0.2704369, -1.077031, 3.743369, 0, 0.3882353, 1, 1,
0.2793361, -0.244097, 2.231885, 0, 0.3803922, 1, 1,
0.2804745, -0.0446383, 1.736177, 0, 0.3764706, 1, 1,
0.2805613, -0.5644893, 3.393617, 0, 0.3686275, 1, 1,
0.2829874, 0.645795, -0.6489632, 0, 0.3647059, 1, 1,
0.2830688, 0.954227, 2.855989, 0, 0.3568628, 1, 1,
0.2840605, -0.1634877, 2.525386, 0, 0.3529412, 1, 1,
0.2846167, -0.5608344, 2.143708, 0, 0.345098, 1, 1,
0.2858235, -0.2197081, 1.605156, 0, 0.3411765, 1, 1,
0.2872137, -0.5495281, 2.762596, 0, 0.3333333, 1, 1,
0.2889993, 1.249279, 0.8687028, 0, 0.3294118, 1, 1,
0.2937768, -0.7614047, 2.96773, 0, 0.3215686, 1, 1,
0.2954397, 0.6264812, 0.8897737, 0, 0.3176471, 1, 1,
0.2954692, 0.05083554, 0.5621055, 0, 0.3098039, 1, 1,
0.2993202, -0.5569122, 1.233359, 0, 0.3058824, 1, 1,
0.2996311, 1.084828, -0.8381029, 0, 0.2980392, 1, 1,
0.3037595, -1.165504, 4.329264, 0, 0.2901961, 1, 1,
0.3060274, 0.259645, 0.9151854, 0, 0.2862745, 1, 1,
0.3061742, -0.0974819, 0.7003413, 0, 0.2784314, 1, 1,
0.3090086, 1.179461, 1.267284, 0, 0.2745098, 1, 1,
0.3104711, 0.3885313, 0.6056646, 0, 0.2666667, 1, 1,
0.3133633, -0.6619559, 3.496133, 0, 0.2627451, 1, 1,
0.3154753, 0.4448974, 0.3122272, 0, 0.254902, 1, 1,
0.3177448, -0.8246593, 3.185295, 0, 0.2509804, 1, 1,
0.3192986, -0.1498066, 1.444869, 0, 0.2431373, 1, 1,
0.3200541, 0.4188747, -0.3536036, 0, 0.2392157, 1, 1,
0.320579, -0.5036511, 4.360937, 0, 0.2313726, 1, 1,
0.3234802, 0.7771777, -1.19199, 0, 0.227451, 1, 1,
0.3256593, 0.0445553, 0.4168136, 0, 0.2196078, 1, 1,
0.328225, -1.919538, 4.565382, 0, 0.2156863, 1, 1,
0.3283469, -0.4357658, 2.648099, 0, 0.2078431, 1, 1,
0.3333487, -1.00055, 1.656319, 0, 0.2039216, 1, 1,
0.3338694, -0.002708937, 2.268884, 0, 0.1960784, 1, 1,
0.3339064, -1.132231, 2.46529, 0, 0.1882353, 1, 1,
0.3351404, 0.01473388, 0.5012982, 0, 0.1843137, 1, 1,
0.3443841, 0.4207626, 1.347234, 0, 0.1764706, 1, 1,
0.3460672, 0.5711237, 0.5198874, 0, 0.172549, 1, 1,
0.3518759, -1.277113, 2.927045, 0, 0.1647059, 1, 1,
0.3543148, 0.413357, 0.2841642, 0, 0.1607843, 1, 1,
0.3548403, -0.9659575, 2.567521, 0, 0.1529412, 1, 1,
0.3574867, 0.1909631, -1.225806, 0, 0.1490196, 1, 1,
0.3596567, 0.9255804, 1.504751, 0, 0.1411765, 1, 1,
0.3605382, 1.978354, 0.5722265, 0, 0.1372549, 1, 1,
0.3629692, -0.9546676, 3.627259, 0, 0.1294118, 1, 1,
0.3653087, 0.08878639, 2.570648, 0, 0.1254902, 1, 1,
0.3701869, 0.1549614, 1.23456, 0, 0.1176471, 1, 1,
0.3756357, -0.08231866, 1.167378, 0, 0.1137255, 1, 1,
0.3807769, -0.9178145, 2.827895, 0, 0.1058824, 1, 1,
0.3831211, -0.6375284, 4.606136, 0, 0.09803922, 1, 1,
0.3844326, 0.01569489, 0.5058505, 0, 0.09411765, 1, 1,
0.3852513, 0.7762647, 0.7710419, 0, 0.08627451, 1, 1,
0.3872029, 1.679987, -0.456874, 0, 0.08235294, 1, 1,
0.3899711, 0.8832313, 1.09413, 0, 0.07450981, 1, 1,
0.3935978, -1.336588, 2.785336, 0, 0.07058824, 1, 1,
0.3945702, 0.2166523, 1.334485, 0, 0.0627451, 1, 1,
0.3966045, 0.4596778, 1.836394, 0, 0.05882353, 1, 1,
0.3967129, 0.2081112, 2.54519, 0, 0.05098039, 1, 1,
0.3969617, 0.09240521, -0.262656, 0, 0.04705882, 1, 1,
0.4030347, -1.443941, 1.078047, 0, 0.03921569, 1, 1,
0.408945, -0.7703332, 3.37152, 0, 0.03529412, 1, 1,
0.4191404, 1.827092, -0.6900031, 0, 0.02745098, 1, 1,
0.4196474, 0.2422624, 2.558167, 0, 0.02352941, 1, 1,
0.4223014, -0.1782576, 1.364491, 0, 0.01568628, 1, 1,
0.4267082, -0.539569, 1.704501, 0, 0.01176471, 1, 1,
0.429627, -0.9782184, 0.6393513, 0, 0.003921569, 1, 1,
0.4316509, 0.7871074, 0.8123628, 0.003921569, 0, 1, 1,
0.4317269, 0.1581106, 1.221037, 0.007843138, 0, 1, 1,
0.432178, -0.4807794, 3.860976, 0.01568628, 0, 1, 1,
0.4329543, -1.197623, 1.862972, 0.01960784, 0, 1, 1,
0.4350381, -0.9819081, 1.597505, 0.02745098, 0, 1, 1,
0.4358723, -0.6810712, 2.281085, 0.03137255, 0, 1, 1,
0.4428886, -0.6971117, 3.002978, 0.03921569, 0, 1, 1,
0.4436974, -1.904003, 3.697208, 0.04313726, 0, 1, 1,
0.4453726, -0.2379897, 0.4773414, 0.05098039, 0, 1, 1,
0.4464098, -0.8754082, 2.504807, 0.05490196, 0, 1, 1,
0.4477069, -0.04117279, -1.098386, 0.0627451, 0, 1, 1,
0.4486032, -0.1717016, 2.15398, 0.06666667, 0, 1, 1,
0.4519138, 0.1415051, 1.343454, 0.07450981, 0, 1, 1,
0.4531635, -0.9479455, 3.48136, 0.07843138, 0, 1, 1,
0.4585699, 1.732065, 0.5860618, 0.08627451, 0, 1, 1,
0.459642, 1.613428, 0.4062364, 0.09019608, 0, 1, 1,
0.4674354, -0.8568563, 4.337451, 0.09803922, 0, 1, 1,
0.4711461, -0.1383941, 0.4723536, 0.1058824, 0, 1, 1,
0.4749265, -1.079909, 3.215775, 0.1098039, 0, 1, 1,
0.4766822, 0.7079745, -0.01770264, 0.1176471, 0, 1, 1,
0.4770559, -0.5052822, 2.139529, 0.1215686, 0, 1, 1,
0.4794709, -0.4447977, 2.190499, 0.1294118, 0, 1, 1,
0.4813282, -0.1754152, 0.9351654, 0.1333333, 0, 1, 1,
0.4834543, -0.5150189, 0.8507311, 0.1411765, 0, 1, 1,
0.4846317, -0.7669234, 3.93732, 0.145098, 0, 1, 1,
0.4851359, 0.09547981, 1.572824, 0.1529412, 0, 1, 1,
0.4912093, -0.7563173, 1.006273, 0.1568628, 0, 1, 1,
0.4983051, 1.089038, 0.009024506, 0.1647059, 0, 1, 1,
0.5004069, 0.8375251, 0.4596296, 0.1686275, 0, 1, 1,
0.5029065, 0.1943673, 2.373758, 0.1764706, 0, 1, 1,
0.5059281, 2.221368, 0.6965396, 0.1803922, 0, 1, 1,
0.5074086, -0.01186927, 2.270108, 0.1882353, 0, 1, 1,
0.5076865, -0.2138961, 4.248985, 0.1921569, 0, 1, 1,
0.5097187, -1.707695, 1.712643, 0.2, 0, 1, 1,
0.5100262, -0.2126806, 2.638099, 0.2078431, 0, 1, 1,
0.5121384, 0.158168, 0.5732983, 0.2117647, 0, 1, 1,
0.5125101, -0.5428493, 2.646075, 0.2196078, 0, 1, 1,
0.5136757, -0.8366389, 2.952928, 0.2235294, 0, 1, 1,
0.5152519, -1.75556, 2.716902, 0.2313726, 0, 1, 1,
0.5155157, 1.811592, -0.4752936, 0.2352941, 0, 1, 1,
0.5207113, 0.4441689, 0.8477892, 0.2431373, 0, 1, 1,
0.5232846, -0.5850973, 1.829443, 0.2470588, 0, 1, 1,
0.5236691, 1.291463, -0.4314022, 0.254902, 0, 1, 1,
0.5255439, -0.7484756, 1.4621, 0.2588235, 0, 1, 1,
0.5277258, -1.618904, 2.979499, 0.2666667, 0, 1, 1,
0.5279704, -0.8355403, 3.036258, 0.2705882, 0, 1, 1,
0.5281681, 0.9617398, 2.879174, 0.2784314, 0, 1, 1,
0.5286419, 0.2748237, 0.01762692, 0.282353, 0, 1, 1,
0.5308406, 0.4737231, -0.3239542, 0.2901961, 0, 1, 1,
0.537208, 0.07485007, 1.191068, 0.2941177, 0, 1, 1,
0.5374725, 1.16159, 1.612723, 0.3019608, 0, 1, 1,
0.5384029, -0.08881179, 2.15521, 0.3098039, 0, 1, 1,
0.547241, 0.2311537, 0.5532118, 0.3137255, 0, 1, 1,
0.5499932, -0.6755807, 2.242016, 0.3215686, 0, 1, 1,
0.5579936, -1.501726, 3.575863, 0.3254902, 0, 1, 1,
0.5595343, -0.05026703, 0.4493788, 0.3333333, 0, 1, 1,
0.5668257, -0.8730386, 2.146363, 0.3372549, 0, 1, 1,
0.567291, -0.1770847, -0.320289, 0.345098, 0, 1, 1,
0.5689783, -0.6128384, 3.738349, 0.3490196, 0, 1, 1,
0.5802225, -0.7792842, 3.408675, 0.3568628, 0, 1, 1,
0.5831134, 0.04784062, 0.1363594, 0.3607843, 0, 1, 1,
0.583151, -0.01897291, 0.5193958, 0.3686275, 0, 1, 1,
0.5917784, 0.459924, 1.368091, 0.372549, 0, 1, 1,
0.5977321, -0.6876836, 3.57972, 0.3803922, 0, 1, 1,
0.6011984, -0.1754521, 1.777313, 0.3843137, 0, 1, 1,
0.6035007, 1.997705, 1.187571, 0.3921569, 0, 1, 1,
0.6059813, -1.217367, 1.951541, 0.3960784, 0, 1, 1,
0.6062678, 0.3931667, -0.01368895, 0.4039216, 0, 1, 1,
0.6085718, 1.63211, 0.6083406, 0.4117647, 0, 1, 1,
0.6110989, -0.4948316, 3.293159, 0.4156863, 0, 1, 1,
0.6139523, -1.355496, 3.0488, 0.4235294, 0, 1, 1,
0.6177934, 0.6240884, 1.153915, 0.427451, 0, 1, 1,
0.6220973, 0.8485947, 0.8382711, 0.4352941, 0, 1, 1,
0.627759, -0.7759188, 2.361481, 0.4392157, 0, 1, 1,
0.6291667, -0.1729885, 2.053021, 0.4470588, 0, 1, 1,
0.6298701, -0.6749125, 2.726967, 0.4509804, 0, 1, 1,
0.6303041, 0.2214568, -0.1789409, 0.4588235, 0, 1, 1,
0.6307465, -1.081676, 3.067374, 0.4627451, 0, 1, 1,
0.6344362, -0.2898402, 2.830944, 0.4705882, 0, 1, 1,
0.6361836, 0.2740549, -0.649415, 0.4745098, 0, 1, 1,
0.6414886, 0.9112385, 0.12208, 0.4823529, 0, 1, 1,
0.6525742, 0.4619303, 1.082499, 0.4862745, 0, 1, 1,
0.6543575, -0.3787541, 2.936698, 0.4941176, 0, 1, 1,
0.6593504, 1.197795, 0.5782499, 0.5019608, 0, 1, 1,
0.6621882, -0.4315144, 2.19615, 0.5058824, 0, 1, 1,
0.6710504, -1.233372, 3.589842, 0.5137255, 0, 1, 1,
0.6768909, 1.826205, 0.2348263, 0.5176471, 0, 1, 1,
0.679259, 0.9749808, 0.9012999, 0.5254902, 0, 1, 1,
0.6821294, 1.221093, 1.331713, 0.5294118, 0, 1, 1,
0.6835308, 0.1419316, 1.555469, 0.5372549, 0, 1, 1,
0.6836373, 0.5533262, 2.756026, 0.5411765, 0, 1, 1,
0.6851024, 1.764129, -0.7439251, 0.5490196, 0, 1, 1,
0.6877297, 0.9308293, -1.045448, 0.5529412, 0, 1, 1,
0.6972885, 1.441056, -0.371834, 0.5607843, 0, 1, 1,
0.6978683, -0.8753083, 1.778496, 0.5647059, 0, 1, 1,
0.698162, 2.374674, 0.9937045, 0.572549, 0, 1, 1,
0.7029162, 0.2241435, 0.5634204, 0.5764706, 0, 1, 1,
0.7087036, -0.4551639, 3.128041, 0.5843138, 0, 1, 1,
0.7149885, 0.8710921, -0.8775409, 0.5882353, 0, 1, 1,
0.7171922, 1.591821, 0.2596412, 0.5960785, 0, 1, 1,
0.7178531, 0.7410117, 0.1861016, 0.6039216, 0, 1, 1,
0.7213581, -0.1897219, 2.134246, 0.6078432, 0, 1, 1,
0.726051, 0.01814538, 0.7774719, 0.6156863, 0, 1, 1,
0.7322979, 1.341781, -1.075373, 0.6196079, 0, 1, 1,
0.7339783, -1.581572, 3.759709, 0.627451, 0, 1, 1,
0.7354629, -0.7527688, 2.833265, 0.6313726, 0, 1, 1,
0.7401928, -0.5198954, 1.648788, 0.6392157, 0, 1, 1,
0.742284, 2.109453, -0.4195201, 0.6431373, 0, 1, 1,
0.7511116, -0.1333117, 3.547, 0.6509804, 0, 1, 1,
0.7573073, 1.184209, 1.478639, 0.654902, 0, 1, 1,
0.7647564, 0.4746225, -0.4918892, 0.6627451, 0, 1, 1,
0.7734929, -0.2710029, 1.067673, 0.6666667, 0, 1, 1,
0.7752338, -1.505899, 2.916317, 0.6745098, 0, 1, 1,
0.779606, 0.06082776, 1.318375, 0.6784314, 0, 1, 1,
0.7805935, 1.488072, 0.2006935, 0.6862745, 0, 1, 1,
0.7812164, -0.3559613, 0.7633612, 0.6901961, 0, 1, 1,
0.7826034, -1.560505, 1.889251, 0.6980392, 0, 1, 1,
0.7935864, 1.37624, -0.6867671, 0.7058824, 0, 1, 1,
0.7957302, -1.566005, 2.003238, 0.7098039, 0, 1, 1,
0.7992498, 1.32592, 0.7991461, 0.7176471, 0, 1, 1,
0.8001575, 0.3607508, 0.2596323, 0.7215686, 0, 1, 1,
0.8027585, 1.02712, 0.1823544, 0.7294118, 0, 1, 1,
0.8042343, -0.6527315, 3.701324, 0.7333333, 0, 1, 1,
0.8068118, 0.5641859, 1.445477, 0.7411765, 0, 1, 1,
0.8130921, 0.8853036, 1.641457, 0.7450981, 0, 1, 1,
0.8156545, -0.6055372, 1.910775, 0.7529412, 0, 1, 1,
0.8209193, 1.052995, 0.7019011, 0.7568628, 0, 1, 1,
0.8274156, -0.5614069, 1.215804, 0.7647059, 0, 1, 1,
0.8351004, -2.112915, 1.102638, 0.7686275, 0, 1, 1,
0.8361095, 0.8685688, -0.2648677, 0.7764706, 0, 1, 1,
0.8428286, -0.7146393, 1.390296, 0.7803922, 0, 1, 1,
0.8437846, -0.357369, 2.889322, 0.7882353, 0, 1, 1,
0.8491113, -0.5871152, 2.396698, 0.7921569, 0, 1, 1,
0.8507288, -1.412984, 4.727569, 0.8, 0, 1, 1,
0.8513917, 0.6020742, 1.868866, 0.8078431, 0, 1, 1,
0.8584065, -0.5600567, 1.390014, 0.8117647, 0, 1, 1,
0.8651462, 0.6438645, -0.2672115, 0.8196079, 0, 1, 1,
0.8673967, -0.06763212, 0.5950821, 0.8235294, 0, 1, 1,
0.8684351, 0.2137074, 1.118462, 0.8313726, 0, 1, 1,
0.8698189, -1.501855, 3.596203, 0.8352941, 0, 1, 1,
0.8701304, -0.7694538, 1.766516, 0.8431373, 0, 1, 1,
0.8746171, 1.25956, 0.0972418, 0.8470588, 0, 1, 1,
0.8761411, -0.3228326, 0.9181348, 0.854902, 0, 1, 1,
0.8794234, -1.456151, 2.39244, 0.8588235, 0, 1, 1,
0.8798531, -1.463648, 3.023442, 0.8666667, 0, 1, 1,
0.8828773, 0.02761996, 1.346814, 0.8705882, 0, 1, 1,
0.8831353, -1.549806, 2.996659, 0.8784314, 0, 1, 1,
0.891, -1.109467, 2.580258, 0.8823529, 0, 1, 1,
0.8912064, 1.021052, 0.8937009, 0.8901961, 0, 1, 1,
0.9030041, 1.035831, 1.73411, 0.8941177, 0, 1, 1,
0.9061034, -1.054179, 2.947174, 0.9019608, 0, 1, 1,
0.9100276, -1.374435, 2.009421, 0.9098039, 0, 1, 1,
0.9105945, -0.08212591, 1.037557, 0.9137255, 0, 1, 1,
0.9149568, 0.09473347, 1.368666, 0.9215686, 0, 1, 1,
0.9211842, 0.8008035, 0.7069648, 0.9254902, 0, 1, 1,
0.9345852, 0.01167355, 1.138838, 0.9333333, 0, 1, 1,
0.935028, -1.696821, 4.432231, 0.9372549, 0, 1, 1,
0.9359692, 0.8753999, 1.2661, 0.945098, 0, 1, 1,
0.950766, 0.9190654, 1.820718, 0.9490196, 0, 1, 1,
0.9519375, 0.7929804, -0.6861738, 0.9568627, 0, 1, 1,
0.9528996, -1.133958, 3.079687, 0.9607843, 0, 1, 1,
0.968402, 0.9548941, 1.037386, 0.9686275, 0, 1, 1,
0.9685756, 1.182219, 2.631294, 0.972549, 0, 1, 1,
0.9736274, -0.6004158, 4.726428, 0.9803922, 0, 1, 1,
0.9751984, -1.002716, 3.166331, 0.9843137, 0, 1, 1,
0.9814825, 0.1710714, 0.8939729, 0.9921569, 0, 1, 1,
0.9830526, 0.4053312, 1.923631, 0.9960784, 0, 1, 1,
0.9856762, -0.3136966, 3.48306, 1, 0, 0.9960784, 1,
0.9889212, 0.4794995, 2.231854, 1, 0, 0.9882353, 1,
0.991132, 1.012578, 1.157179, 1, 0, 0.9843137, 1,
0.9923537, 0.0009978565, 0.5422039, 1, 0, 0.9764706, 1,
0.9947116, 2.094837, 1.100328, 1, 0, 0.972549, 1,
1.011755, 1.073263, 0.2761374, 1, 0, 0.9647059, 1,
1.014384, 2.390072, 1.989025, 1, 0, 0.9607843, 1,
1.014462, -0.2336167, -0.3174588, 1, 0, 0.9529412, 1,
1.023419, -0.4093864, 0.3818833, 1, 0, 0.9490196, 1,
1.028083, 1.530122, -0.4814933, 1, 0, 0.9411765, 1,
1.031092, -0.4280755, 2.771944, 1, 0, 0.9372549, 1,
1.03123, 0.6685826, 0.9789427, 1, 0, 0.9294118, 1,
1.032303, -1.028417, 1.512527, 1, 0, 0.9254902, 1,
1.034178, -0.6138032, 2.853256, 1, 0, 0.9176471, 1,
1.037746, 0.307997, 0.4485534, 1, 0, 0.9137255, 1,
1.049538, 0.9250135, 0.3492129, 1, 0, 0.9058824, 1,
1.055333, -1.061291, 2.421971, 1, 0, 0.9019608, 1,
1.056431, -1.634751, 2.354439, 1, 0, 0.8941177, 1,
1.058151, -0.7042711, 2.546944, 1, 0, 0.8862745, 1,
1.059532, -0.795599, 2.721781, 1, 0, 0.8823529, 1,
1.060105, 0.1700577, 2.591094, 1, 0, 0.8745098, 1,
1.061208, -0.1828227, 2.622598, 1, 0, 0.8705882, 1,
1.064504, 0.6106601, 1.926165, 1, 0, 0.8627451, 1,
1.068281, 0.576042, 1.696463, 1, 0, 0.8588235, 1,
1.071812, -0.7309246, 3.526799, 1, 0, 0.8509804, 1,
1.078192, 0.4249738, 0.9960256, 1, 0, 0.8470588, 1,
1.081038, -2.113135, 1.933916, 1, 0, 0.8392157, 1,
1.081984, -0.1296176, 2.286998, 1, 0, 0.8352941, 1,
1.082435, -1.259122, 2.270988, 1, 0, 0.827451, 1,
1.088733, -0.02728934, 1.818614, 1, 0, 0.8235294, 1,
1.090392, 0.1187229, 2.059531, 1, 0, 0.8156863, 1,
1.097576, -1.060306, 3.281089, 1, 0, 0.8117647, 1,
1.103894, -0.5931393, 2.52758, 1, 0, 0.8039216, 1,
1.1049, -0.6217598, 3.64349, 1, 0, 0.7960784, 1,
1.105745, -0.3710704, 2.085688, 1, 0, 0.7921569, 1,
1.105809, 0.03932646, 0.9158629, 1, 0, 0.7843137, 1,
1.107601, 1.354369, 0.2077716, 1, 0, 0.7803922, 1,
1.109377, -1.033566, 3.805727, 1, 0, 0.772549, 1,
1.111135, -0.444992, 1.603488, 1, 0, 0.7686275, 1,
1.111657, -1.066882, -0.5560221, 1, 0, 0.7607843, 1,
1.116886, -0.003290112, 0.9464735, 1, 0, 0.7568628, 1,
1.118575, -0.3341984, 1.063994, 1, 0, 0.7490196, 1,
1.120649, 0.4440123, 1.242036, 1, 0, 0.7450981, 1,
1.120769, -1.330108, 3.061663, 1, 0, 0.7372549, 1,
1.120938, -0.5651193, 1.773229, 1, 0, 0.7333333, 1,
1.123984, 0.7398629, 1.326361, 1, 0, 0.7254902, 1,
1.125772, 1.800882, 1.913198, 1, 0, 0.7215686, 1,
1.128183, 0.3994389, 1.420976, 1, 0, 0.7137255, 1,
1.129603, 0.01146217, 0.6382518, 1, 0, 0.7098039, 1,
1.131866, 1.646202, 0.1900523, 1, 0, 0.7019608, 1,
1.148025, 1.334777, 0.6157248, 1, 0, 0.6941177, 1,
1.14817, 2.008703, 1.449293, 1, 0, 0.6901961, 1,
1.150593, -1.71524, 2.04411, 1, 0, 0.682353, 1,
1.157602, -1.259063, 1.208934, 1, 0, 0.6784314, 1,
1.15785, -0.848392, 2.455885, 1, 0, 0.6705883, 1,
1.160843, -0.3120899, 1.784947, 1, 0, 0.6666667, 1,
1.16886, -0.5207016, 2.436035, 1, 0, 0.6588235, 1,
1.16923, 1.530948, -0.4630944, 1, 0, 0.654902, 1,
1.171344, 0.5511708, 1.767283, 1, 0, 0.6470588, 1,
1.171611, 0.01455192, 0.7084855, 1, 0, 0.6431373, 1,
1.175648, 0.1823568, 0.9585879, 1, 0, 0.6352941, 1,
1.180303, 0.6180298, 0.8717879, 1, 0, 0.6313726, 1,
1.188577, 0.6787739, 2.258053, 1, 0, 0.6235294, 1,
1.191596, -0.9103993, 1.718109, 1, 0, 0.6196079, 1,
1.195103, 0.1648885, 2.466097, 1, 0, 0.6117647, 1,
1.208537, 1.495875, 1.893135, 1, 0, 0.6078432, 1,
1.211091, 0.4385538, 1.644959, 1, 0, 0.6, 1,
1.212353, -1.224958, 2.716694, 1, 0, 0.5921569, 1,
1.240569, -1.422752, 2.70179, 1, 0, 0.5882353, 1,
1.25742, -0.06684782, 2.715142, 1, 0, 0.5803922, 1,
1.267231, 1.119935, 2.167981, 1, 0, 0.5764706, 1,
1.278774, 0.7588654, 0.1370544, 1, 0, 0.5686275, 1,
1.280094, 0.3379951, 3.169656, 1, 0, 0.5647059, 1,
1.283928, 0.5165824, 0.261214, 1, 0, 0.5568628, 1,
1.287517, -0.898905, 1.815723, 1, 0, 0.5529412, 1,
1.28771, -0.4154117, 1.693277, 1, 0, 0.5450981, 1,
1.318497, -1.334128, 2.531795, 1, 0, 0.5411765, 1,
1.319561, -2.487007, 2.893634, 1, 0, 0.5333334, 1,
1.339547, 0.8921751, 2.372787, 1, 0, 0.5294118, 1,
1.35405, -0.2268501, 2.970785, 1, 0, 0.5215687, 1,
1.363092, 0.07240008, 1.062081, 1, 0, 0.5176471, 1,
1.372791, 1.1383, -0.5125063, 1, 0, 0.509804, 1,
1.387629, 1.26763, -0.01167762, 1, 0, 0.5058824, 1,
1.387723, -0.5813773, 3.031875, 1, 0, 0.4980392, 1,
1.39636, 0.4144309, 2.210689, 1, 0, 0.4901961, 1,
1.396381, -2.702247, 2.582355, 1, 0, 0.4862745, 1,
1.40072, -1.168248, 1.436724, 1, 0, 0.4784314, 1,
1.407118, -1.858566, 2.741498, 1, 0, 0.4745098, 1,
1.415446, 0.4190603, 1.414627, 1, 0, 0.4666667, 1,
1.420282, 1.590119, 1.569933, 1, 0, 0.4627451, 1,
1.426822, -0.7261736, 1.669591, 1, 0, 0.454902, 1,
1.430982, -0.2537797, 0.1016722, 1, 0, 0.4509804, 1,
1.442217, -0.6200265, 2.007098, 1, 0, 0.4431373, 1,
1.46694, -0.7363837, 2.418244, 1, 0, 0.4392157, 1,
1.468329, 2.352159, 1.284183, 1, 0, 0.4313726, 1,
1.470751, 0.7306805, -0.04080087, 1, 0, 0.427451, 1,
1.471586, 0.7526038, 2.439466, 1, 0, 0.4196078, 1,
1.489613, 0.8283358, 1.744781, 1, 0, 0.4156863, 1,
1.494865, -0.7035311, 1.157753, 1, 0, 0.4078431, 1,
1.4952, -0.7974913, 1.36568, 1, 0, 0.4039216, 1,
1.502381, -0.8680747, 0.9866502, 1, 0, 0.3960784, 1,
1.509046, 0.7518931, 1.798144, 1, 0, 0.3882353, 1,
1.511858, -0.925141, 1.230468, 1, 0, 0.3843137, 1,
1.514464, -0.219887, 2.785842, 1, 0, 0.3764706, 1,
1.540537, 3.16845, -0.6818564, 1, 0, 0.372549, 1,
1.540835, -0.1307171, 0.2108637, 1, 0, 0.3647059, 1,
1.553242, 0.1548817, 2.284598, 1, 0, 0.3607843, 1,
1.556836, 0.7574767, 0.04487381, 1, 0, 0.3529412, 1,
1.557097, 0.04966423, 3.419065, 1, 0, 0.3490196, 1,
1.570354, -1.740661, 1.972656, 1, 0, 0.3411765, 1,
1.574748, 1.941321, 1.434298, 1, 0, 0.3372549, 1,
1.578119, -0.6745062, 0.7948613, 1, 0, 0.3294118, 1,
1.578205, -0.1150361, 2.89815, 1, 0, 0.3254902, 1,
1.58872, 1.298183, 1.644559, 1, 0, 0.3176471, 1,
1.589299, 1.234393, 0.4700514, 1, 0, 0.3137255, 1,
1.599011, 0.416471, 1.408753, 1, 0, 0.3058824, 1,
1.607311, -0.01055035, 1.942888, 1, 0, 0.2980392, 1,
1.617307, -0.0106514, 2.197316, 1, 0, 0.2941177, 1,
1.622701, -1.746297, 0.249368, 1, 0, 0.2862745, 1,
1.635739, 0.8996388, 0.932134, 1, 0, 0.282353, 1,
1.646118, 0.9291829, 0.8205584, 1, 0, 0.2745098, 1,
1.65941, -0.2771726, 2.831429, 1, 0, 0.2705882, 1,
1.660687, -0.5982638, 2.114698, 1, 0, 0.2627451, 1,
1.669262, 0.536571, 0.6732289, 1, 0, 0.2588235, 1,
1.676662, 2.381691, -1.031774, 1, 0, 0.2509804, 1,
1.742972, -0.01683285, 4.404628, 1, 0, 0.2470588, 1,
1.742996, -0.2905751, 1.198481, 1, 0, 0.2392157, 1,
1.747665, -0.4293677, 1.986026, 1, 0, 0.2352941, 1,
1.749757, 1.239174, -0.183817, 1, 0, 0.227451, 1,
1.762041, -0.607973, 1.140338, 1, 0, 0.2235294, 1,
1.769452, -0.9508276, 1.551028, 1, 0, 0.2156863, 1,
1.788109, -0.3725173, 0.5761157, 1, 0, 0.2117647, 1,
1.806302, -1.480994, 3.33931, 1, 0, 0.2039216, 1,
1.81432, -0.4292003, 2.073722, 1, 0, 0.1960784, 1,
1.825319, 0.5627744, 1.35984, 1, 0, 0.1921569, 1,
1.830835, -2.127513, 2.877095, 1, 0, 0.1843137, 1,
1.834116, 0.7376416, 2.726457, 1, 0, 0.1803922, 1,
1.834177, 0.07423874, 1.446233, 1, 0, 0.172549, 1,
1.873891, 0.3182722, 1.266145, 1, 0, 0.1686275, 1,
1.927227, -0.83051, 3.017508, 1, 0, 0.1607843, 1,
1.933328, 1.583015, 1.108981, 1, 0, 0.1568628, 1,
1.945634, 1.526683, 0.7241201, 1, 0, 0.1490196, 1,
1.972057, 0.9026878, 0.4841778, 1, 0, 0.145098, 1,
1.995908, -1.268137, 1.57992, 1, 0, 0.1372549, 1,
2.003749, 1.03108, 2.14319, 1, 0, 0.1333333, 1,
2.031203, -0.7942025, 0.7026384, 1, 0, 0.1254902, 1,
2.110175, -0.03476711, 2.505709, 1, 0, 0.1215686, 1,
2.218551, 0.9042189, 0.1096877, 1, 0, 0.1137255, 1,
2.219049, 1.110798, 2.341948, 1, 0, 0.1098039, 1,
2.248695, -0.07376115, 0.6611624, 1, 0, 0.1019608, 1,
2.290428, -0.3501603, 2.964797, 1, 0, 0.09411765, 1,
2.311624, -1.033897, -0.7436772, 1, 0, 0.09019608, 1,
2.321425, -1.609822, 1.437996, 1, 0, 0.08235294, 1,
2.336447, -0.4193241, 2.594167, 1, 0, 0.07843138, 1,
2.338276, -0.9966252, 0.4863197, 1, 0, 0.07058824, 1,
2.346362, 1.581946, 0.1144817, 1, 0, 0.06666667, 1,
2.352927, 0.09959336, 0.8341246, 1, 0, 0.05882353, 1,
2.406365, 1.966758, -0.0004436676, 1, 0, 0.05490196, 1,
2.476176, 0.2649386, 1.411875, 1, 0, 0.04705882, 1,
2.4838, -1.643337, 1.94635, 1, 0, 0.04313726, 1,
2.624264, 0.5887324, 1.035491, 1, 0, 0.03529412, 1,
2.726388, -0.5477788, 3.067684, 1, 0, 0.03137255, 1,
2.765759, -1.678059, 1.792271, 1, 0, 0.02352941, 1,
2.910279, 0.8211721, 1.313202, 1, 0, 0.01960784, 1,
2.987673, 0.7138796, 2.249145, 1, 0, 0.01176471, 1,
3.264711, -0.8065939, 1.206749, 1, 0, 0.007843138, 1
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
-0.0367974, -3.720756, -7.600195, 0, -0.5, 0.5, 0.5,
-0.0367974, -3.720756, -7.600195, 1, -0.5, 0.5, 0.5,
-0.0367974, -3.720756, -7.600195, 1, 1.5, 0.5, 0.5,
-0.0367974, -3.720756, -7.600195, 0, 1.5, 0.5, 0.5
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
-4.457517, 0.2230861, -7.600195, 0, -0.5, 0.5, 0.5,
-4.457517, 0.2230861, -7.600195, 1, -0.5, 0.5, 0.5,
-4.457517, 0.2230861, -7.600195, 1, 1.5, 0.5, 0.5,
-4.457517, 0.2230861, -7.600195, 0, 1.5, 0.5, 0.5
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
-4.457517, -3.720756, 0.07878399, 0, -0.5, 0.5, 0.5,
-4.457517, -3.720756, 0.07878399, 1, -0.5, 0.5, 0.5,
-4.457517, -3.720756, 0.07878399, 1, 1.5, 0.5, 0.5,
-4.457517, -3.720756, 0.07878399, 0, 1.5, 0.5, 0.5
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
-3, -2.810638, -5.828123,
3, -2.810638, -5.828123,
-3, -2.810638, -5.828123,
-3, -2.962325, -6.123468,
-2, -2.810638, -5.828123,
-2, -2.962325, -6.123468,
-1, -2.810638, -5.828123,
-1, -2.962325, -6.123468,
0, -2.810638, -5.828123,
0, -2.962325, -6.123468,
1, -2.810638, -5.828123,
1, -2.962325, -6.123468,
2, -2.810638, -5.828123,
2, -2.962325, -6.123468,
3, -2.810638, -5.828123,
3, -2.962325, -6.123468
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
-3, -3.265697, -6.714159, 0, -0.5, 0.5, 0.5,
-3, -3.265697, -6.714159, 1, -0.5, 0.5, 0.5,
-3, -3.265697, -6.714159, 1, 1.5, 0.5, 0.5,
-3, -3.265697, -6.714159, 0, 1.5, 0.5, 0.5,
-2, -3.265697, -6.714159, 0, -0.5, 0.5, 0.5,
-2, -3.265697, -6.714159, 1, -0.5, 0.5, 0.5,
-2, -3.265697, -6.714159, 1, 1.5, 0.5, 0.5,
-2, -3.265697, -6.714159, 0, 1.5, 0.5, 0.5,
-1, -3.265697, -6.714159, 0, -0.5, 0.5, 0.5,
-1, -3.265697, -6.714159, 1, -0.5, 0.5, 0.5,
-1, -3.265697, -6.714159, 1, 1.5, 0.5, 0.5,
-1, -3.265697, -6.714159, 0, 1.5, 0.5, 0.5,
0, -3.265697, -6.714159, 0, -0.5, 0.5, 0.5,
0, -3.265697, -6.714159, 1, -0.5, 0.5, 0.5,
0, -3.265697, -6.714159, 1, 1.5, 0.5, 0.5,
0, -3.265697, -6.714159, 0, 1.5, 0.5, 0.5,
1, -3.265697, -6.714159, 0, -0.5, 0.5, 0.5,
1, -3.265697, -6.714159, 1, -0.5, 0.5, 0.5,
1, -3.265697, -6.714159, 1, 1.5, 0.5, 0.5,
1, -3.265697, -6.714159, 0, 1.5, 0.5, 0.5,
2, -3.265697, -6.714159, 0, -0.5, 0.5, 0.5,
2, -3.265697, -6.714159, 1, -0.5, 0.5, 0.5,
2, -3.265697, -6.714159, 1, 1.5, 0.5, 0.5,
2, -3.265697, -6.714159, 0, 1.5, 0.5, 0.5,
3, -3.265697, -6.714159, 0, -0.5, 0.5, 0.5,
3, -3.265697, -6.714159, 1, -0.5, 0.5, 0.5,
3, -3.265697, -6.714159, 1, 1.5, 0.5, 0.5,
3, -3.265697, -6.714159, 0, 1.5, 0.5, 0.5
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
-3.437351, -2, -5.828123,
-3.437351, 3, -5.828123,
-3.437351, -2, -5.828123,
-3.607379, -2, -6.123468,
-3.437351, -1, -5.828123,
-3.607379, -1, -6.123468,
-3.437351, 0, -5.828123,
-3.607379, 0, -6.123468,
-3.437351, 1, -5.828123,
-3.607379, 1, -6.123468,
-3.437351, 2, -5.828123,
-3.607379, 2, -6.123468,
-3.437351, 3, -5.828123,
-3.607379, 3, -6.123468
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
-3.947434, -2, -6.714159, 0, -0.5, 0.5, 0.5,
-3.947434, -2, -6.714159, 1, -0.5, 0.5, 0.5,
-3.947434, -2, -6.714159, 1, 1.5, 0.5, 0.5,
-3.947434, -2, -6.714159, 0, 1.5, 0.5, 0.5,
-3.947434, -1, -6.714159, 0, -0.5, 0.5, 0.5,
-3.947434, -1, -6.714159, 1, -0.5, 0.5, 0.5,
-3.947434, -1, -6.714159, 1, 1.5, 0.5, 0.5,
-3.947434, -1, -6.714159, 0, 1.5, 0.5, 0.5,
-3.947434, 0, -6.714159, 0, -0.5, 0.5, 0.5,
-3.947434, 0, -6.714159, 1, -0.5, 0.5, 0.5,
-3.947434, 0, -6.714159, 1, 1.5, 0.5, 0.5,
-3.947434, 0, -6.714159, 0, 1.5, 0.5, 0.5,
-3.947434, 1, -6.714159, 0, -0.5, 0.5, 0.5,
-3.947434, 1, -6.714159, 1, -0.5, 0.5, 0.5,
-3.947434, 1, -6.714159, 1, 1.5, 0.5, 0.5,
-3.947434, 1, -6.714159, 0, 1.5, 0.5, 0.5,
-3.947434, 2, -6.714159, 0, -0.5, 0.5, 0.5,
-3.947434, 2, -6.714159, 1, -0.5, 0.5, 0.5,
-3.947434, 2, -6.714159, 1, 1.5, 0.5, 0.5,
-3.947434, 2, -6.714159, 0, 1.5, 0.5, 0.5,
-3.947434, 3, -6.714159, 0, -0.5, 0.5, 0.5,
-3.947434, 3, -6.714159, 1, -0.5, 0.5, 0.5,
-3.947434, 3, -6.714159, 1, 1.5, 0.5, 0.5,
-3.947434, 3, -6.714159, 0, 1.5, 0.5, 0.5
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
-3.437351, -2.810638, -4,
-3.437351, -2.810638, 4,
-3.437351, -2.810638, -4,
-3.607379, -2.962325, -4,
-3.437351, -2.810638, -2,
-3.607379, -2.962325, -2,
-3.437351, -2.810638, 0,
-3.607379, -2.962325, 0,
-3.437351, -2.810638, 2,
-3.607379, -2.962325, 2,
-3.437351, -2.810638, 4,
-3.607379, -2.962325, 4
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
-3.947434, -3.265697, -4, 0, -0.5, 0.5, 0.5,
-3.947434, -3.265697, -4, 1, -0.5, 0.5, 0.5,
-3.947434, -3.265697, -4, 1, 1.5, 0.5, 0.5,
-3.947434, -3.265697, -4, 0, 1.5, 0.5, 0.5,
-3.947434, -3.265697, -2, 0, -0.5, 0.5, 0.5,
-3.947434, -3.265697, -2, 1, -0.5, 0.5, 0.5,
-3.947434, -3.265697, -2, 1, 1.5, 0.5, 0.5,
-3.947434, -3.265697, -2, 0, 1.5, 0.5, 0.5,
-3.947434, -3.265697, 0, 0, -0.5, 0.5, 0.5,
-3.947434, -3.265697, 0, 1, -0.5, 0.5, 0.5,
-3.947434, -3.265697, 0, 1, 1.5, 0.5, 0.5,
-3.947434, -3.265697, 0, 0, 1.5, 0.5, 0.5,
-3.947434, -3.265697, 2, 0, -0.5, 0.5, 0.5,
-3.947434, -3.265697, 2, 1, -0.5, 0.5, 0.5,
-3.947434, -3.265697, 2, 1, 1.5, 0.5, 0.5,
-3.947434, -3.265697, 2, 0, 1.5, 0.5, 0.5,
-3.947434, -3.265697, 4, 0, -0.5, 0.5, 0.5,
-3.947434, -3.265697, 4, 1, -0.5, 0.5, 0.5,
-3.947434, -3.265697, 4, 1, 1.5, 0.5, 0.5,
-3.947434, -3.265697, 4, 0, 1.5, 0.5, 0.5
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
-3.437351, -2.810638, -5.828123,
-3.437351, 3.256811, -5.828123,
-3.437351, -2.810638, 5.985691,
-3.437351, 3.256811, 5.985691,
-3.437351, -2.810638, -5.828123,
-3.437351, -2.810638, 5.985691,
-3.437351, 3.256811, -5.828123,
-3.437351, 3.256811, 5.985691,
-3.437351, -2.810638, -5.828123,
3.363756, -2.810638, -5.828123,
-3.437351, -2.810638, 5.985691,
3.363756, -2.810638, 5.985691,
-3.437351, 3.256811, -5.828123,
3.363756, 3.256811, -5.828123,
-3.437351, 3.256811, 5.985691,
3.363756, 3.256811, 5.985691,
3.363756, -2.810638, -5.828123,
3.363756, 3.256811, -5.828123,
3.363756, -2.810638, 5.985691,
3.363756, 3.256811, 5.985691,
3.363756, -2.810638, -5.828123,
3.363756, -2.810638, 5.985691,
3.363756, 3.256811, -5.828123,
3.363756, 3.256811, 5.985691
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
var radius = 7.967506;
var distance = 35.44833;
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
mvMatrix.translate( 0.0367974, -0.2230861, -0.07878399 );
mvMatrix.scale( 1.26665, 1.41981, 0.7291992 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.44833);
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
chlorosulfamic_acid<-read.table("chlorosulfamic_acid.xyz")
```

```
## Error in read.table("chlorosulfamic_acid.xyz"): no lines available in input
```

```r
x<-chlorosulfamic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorosulfamic_acid' not found
```

```r
y<-chlorosulfamic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorosulfamic_acid' not found
```

```r
z<-chlorosulfamic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorosulfamic_acid' not found
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
-3.338306, -0.5382015, -2.379356, 0, 0, 1, 1, 1,
-3.053372, -0.2067727, -0.2428888, 1, 0, 0, 1, 1,
-2.989224, -1.149579, -2.625449, 1, 0, 0, 1, 1,
-2.586831, -0.2325171, -2.042169, 1, 0, 0, 1, 1,
-2.552253, -0.3981296, -2.81315, 1, 0, 0, 1, 1,
-2.549053, 0.3645265, -1.186303, 1, 0, 0, 1, 1,
-2.529434, 0.4804701, -2.752187, 0, 0, 0, 1, 1,
-2.350087, -0.6315358, -1.537283, 0, 0, 0, 1, 1,
-2.332537, 0.4480511, -1.012648, 0, 0, 0, 1, 1,
-2.298544, -0.3194746, -2.736539, 0, 0, 0, 1, 1,
-2.293391, 0.5637895, -3.207263, 0, 0, 0, 1, 1,
-2.260678, -2.13679, -2.903364, 0, 0, 0, 1, 1,
-2.252168, -0.591162, 0.1224174, 0, 0, 0, 1, 1,
-2.230585, 0.2355513, -0.8196046, 1, 1, 1, 1, 1,
-2.183737, -0.98917, -2.280369, 1, 1, 1, 1, 1,
-2.144288, 0.8263733, 0.5761269, 1, 1, 1, 1, 1,
-2.140261, 0.01875217, -1.179792, 1, 1, 1, 1, 1,
-2.124526, 0.4420499, 0.3099799, 1, 1, 1, 1, 1,
-2.116107, -1.580393, -0.800109, 1, 1, 1, 1, 1,
-2.047125, 1.987266, -0.7537038, 1, 1, 1, 1, 1,
-2.041646, -0.8857678, -0.1949557, 1, 1, 1, 1, 1,
-2.037826, 0.5665687, -1.846903, 1, 1, 1, 1, 1,
-2.003342, -2.040316, -3.750573, 1, 1, 1, 1, 1,
-1.95417, 0.3048613, -1.183807, 1, 1, 1, 1, 1,
-1.936466, 0.8236903, -0.2476309, 1, 1, 1, 1, 1,
-1.926676, -0.1597398, -2.763407, 1, 1, 1, 1, 1,
-1.906351, -0.6307727, -3.303535, 1, 1, 1, 1, 1,
-1.881201, 0.5275795, -0.3861763, 1, 1, 1, 1, 1,
-1.865451, 1.775553, -0.3489046, 0, 0, 1, 1, 1,
-1.84284, 0.2329313, -1.312238, 1, 0, 0, 1, 1,
-1.805172, 2.965636, -1.441918, 1, 0, 0, 1, 1,
-1.780273, -0.1031499, -1.058743, 1, 0, 0, 1, 1,
-1.759609, 0.3572357, -1.923127, 1, 0, 0, 1, 1,
-1.710958, 1.352283, -2.478697, 1, 0, 0, 1, 1,
-1.69079, -0.05517015, -2.099363, 0, 0, 0, 1, 1,
-1.689435, 0.137131, -1.846546, 0, 0, 0, 1, 1,
-1.646447, 0.7399076, -2.649681, 0, 0, 0, 1, 1,
-1.637532, -0.6438832, -3.023601, 0, 0, 0, 1, 1,
-1.616197, 0.1919068, -1.169914, 0, 0, 0, 1, 1,
-1.614216, 0.2036587, -2.480489, 0, 0, 0, 1, 1,
-1.608429, 0.889773, -0.1349787, 0, 0, 0, 1, 1,
-1.603253, 0.009794772, -1.318383, 1, 1, 1, 1, 1,
-1.593372, -1.459571, -1.425446, 1, 1, 1, 1, 1,
-1.589326, -1.881958, -1.112003, 1, 1, 1, 1, 1,
-1.587577, 0.4826867, -0.9314368, 1, 1, 1, 1, 1,
-1.577647, 2.238294, 0.661897, 1, 1, 1, 1, 1,
-1.563788, 2.211979, -1.86355, 1, 1, 1, 1, 1,
-1.559251, 0.8532965, -2.733076, 1, 1, 1, 1, 1,
-1.546885, -1.461573, -2.428057, 1, 1, 1, 1, 1,
-1.544475, -0.1089139, -2.832988, 1, 1, 1, 1, 1,
-1.542859, 0.2144907, -1.885573, 1, 1, 1, 1, 1,
-1.520185, -0.5724498, -2.722945, 1, 1, 1, 1, 1,
-1.51988, -0.2162579, -1.895713, 1, 1, 1, 1, 1,
-1.51974, 0.7308226, -1.741399, 1, 1, 1, 1, 1,
-1.502335, 1.030379, -0.3519477, 1, 1, 1, 1, 1,
-1.496905, -0.03404207, -2.407069, 1, 1, 1, 1, 1,
-1.480617, 1.933888, -2.026419, 0, 0, 1, 1, 1,
-1.475887, 0.4539001, -2.759505, 1, 0, 0, 1, 1,
-1.475646, 1.717286, -1.28927, 1, 0, 0, 1, 1,
-1.474838, 0.634976, -0.5134333, 1, 0, 0, 1, 1,
-1.471707, -1.135863, -2.923655, 1, 0, 0, 1, 1,
-1.467401, -0.8666918, -1.725082, 1, 0, 0, 1, 1,
-1.457006, 0.5917028, -1.564394, 0, 0, 0, 1, 1,
-1.448105, 0.05519939, -1.215159, 0, 0, 0, 1, 1,
-1.445079, -1.420259, -1.379752, 0, 0, 0, 1, 1,
-1.430734, -0.2856023, -0.5261799, 0, 0, 0, 1, 1,
-1.424985, 1.756217, -1.096868, 0, 0, 0, 1, 1,
-1.42017, -1.730849, -2.740922, 0, 0, 0, 1, 1,
-1.417787, -0.3623105, -0.2969215, 0, 0, 0, 1, 1,
-1.407639, -0.5113773, -3.571699, 1, 1, 1, 1, 1,
-1.399842, 0.0008811925, -2.367195, 1, 1, 1, 1, 1,
-1.397417, -0.5164765, -3.164216, 1, 1, 1, 1, 1,
-1.390466, 1.831751, -1.678589, 1, 1, 1, 1, 1,
-1.386894, 1.108179, -1.047057, 1, 1, 1, 1, 1,
-1.383598, -1.267513, -2.619679, 1, 1, 1, 1, 1,
-1.376166, 0.06789767, -2.274639, 1, 1, 1, 1, 1,
-1.368163, -1.847823, -2.274007, 1, 1, 1, 1, 1,
-1.357803, -0.1055239, -2.176901, 1, 1, 1, 1, 1,
-1.357221, -0.9519271, -4.046139, 1, 1, 1, 1, 1,
-1.346719, -0.6104093, -2.850283, 1, 1, 1, 1, 1,
-1.342658, 1.167297, 1.082212, 1, 1, 1, 1, 1,
-1.33919, 0.9054614, -1.021836, 1, 1, 1, 1, 1,
-1.337529, 1.032785, -0.6389437, 1, 1, 1, 1, 1,
-1.33564, -0.03503174, -0.03318899, 1, 1, 1, 1, 1,
-1.328671, -0.8598596, -2.582186, 0, 0, 1, 1, 1,
-1.322339, 1.215961, 0.0325287, 1, 0, 0, 1, 1,
-1.30655, -0.5436511, -0.2832997, 1, 0, 0, 1, 1,
-1.304811, 1.867087, -0.8329006, 1, 0, 0, 1, 1,
-1.295272, -0.4037583, -3.803808, 1, 0, 0, 1, 1,
-1.285308, 0.762717, -0.7727067, 1, 0, 0, 1, 1,
-1.274359, 1.16339, -1.507418, 0, 0, 0, 1, 1,
-1.270405, 0.2199109, -0.6157721, 0, 0, 0, 1, 1,
-1.264252, 0.6995426, 0.5194461, 0, 0, 0, 1, 1,
-1.261217, -1.431007, -2.038239, 0, 0, 0, 1, 1,
-1.256306, 0.2377253, -2.417384, 0, 0, 0, 1, 1,
-1.236719, -0.4725196, -2.077906, 0, 0, 0, 1, 1,
-1.234513, -0.2668996, -1.940085, 0, 0, 0, 1, 1,
-1.229149, -1.682032, -1.493446, 1, 1, 1, 1, 1,
-1.228146, 0.04162794, -2.467167, 1, 1, 1, 1, 1,
-1.218179, 0.4777395, -1.929404, 1, 1, 1, 1, 1,
-1.216555, -0.9350287, -2.247683, 1, 1, 1, 1, 1,
-1.211397, -0.1816119, -0.6869165, 1, 1, 1, 1, 1,
-1.20056, -0.5207503, -1.574713, 1, 1, 1, 1, 1,
-1.196218, 1.039976, -1.849731, 1, 1, 1, 1, 1,
-1.178853, -1.758359, -3.684606, 1, 1, 1, 1, 1,
-1.17383, 0.3446289, -3.208789, 1, 1, 1, 1, 1,
-1.173702, 0.6341478, -1.329979, 1, 1, 1, 1, 1,
-1.170529, -1.735264, -3.730887, 1, 1, 1, 1, 1,
-1.162642, -0.2071882, -1.331654, 1, 1, 1, 1, 1,
-1.151895, -0.8784293, -2.097915, 1, 1, 1, 1, 1,
-1.149595, 0.348244, 1.059281, 1, 1, 1, 1, 1,
-1.1489, -0.9920703, -2.034288, 1, 1, 1, 1, 1,
-1.145794, -0.5264648, -0.206323, 0, 0, 1, 1, 1,
-1.141055, 0.9387834, -2.427885, 1, 0, 0, 1, 1,
-1.140323, 0.500585, -2.457032, 1, 0, 0, 1, 1,
-1.139601, -0.08195325, -1.461059, 1, 0, 0, 1, 1,
-1.137012, 0.8831935, -0.7448678, 1, 0, 0, 1, 1,
-1.135598, -0.2553505, -2.236863, 1, 0, 0, 1, 1,
-1.12575, 1.622989, -0.07385547, 0, 0, 0, 1, 1,
-1.123109, 1.392712, -0.1861968, 0, 0, 0, 1, 1,
-1.115847, -1.35983, -3.172931, 0, 0, 0, 1, 1,
-1.11052, 0.6564474, -0.7972128, 0, 0, 0, 1, 1,
-1.104019, 1.352009, 0.3361606, 0, 0, 0, 1, 1,
-1.102, -0.6913376, -1.655583, 0, 0, 0, 1, 1,
-1.099509, -0.5405735, -3.298327, 0, 0, 0, 1, 1,
-1.09728, 0.4621865, -1.569912, 1, 1, 1, 1, 1,
-1.079616, -0.2409617, -3.094702, 1, 1, 1, 1, 1,
-1.079351, 1.478642, -1.213853, 1, 1, 1, 1, 1,
-1.073043, 1.069968, 0.7958082, 1, 1, 1, 1, 1,
-1.065368, -1.29749, -2.093866, 1, 1, 1, 1, 1,
-1.065365, -0.7637311, -0.5035791, 1, 1, 1, 1, 1,
-1.062384, 1.321031, -1.176278, 1, 1, 1, 1, 1,
-1.054088, 2.410837, 0.937314, 1, 1, 1, 1, 1,
-1.04628, 0.386658, -1.347565, 1, 1, 1, 1, 1,
-1.043921, 0.1440598, -1.743949, 1, 1, 1, 1, 1,
-1.033759, 0.4873238, -1.221789, 1, 1, 1, 1, 1,
-1.031137, -0.6597271, -2.741412, 1, 1, 1, 1, 1,
-1.03001, 0.09905434, -2.500904, 1, 1, 1, 1, 1,
-1.028913, 0.5741673, -0.775399, 1, 1, 1, 1, 1,
-1.023559, 0.2861645, -1.573135, 1, 1, 1, 1, 1,
-1.020721, 0.3916999, -2.036283, 0, 0, 1, 1, 1,
-1.017204, -0.362363, -2.537389, 1, 0, 0, 1, 1,
-1.012321, -0.4947307, -2.40836, 1, 0, 0, 1, 1,
-1.010576, 0.9815617, -1.370205, 1, 0, 0, 1, 1,
-1.004206, 0.2743215, -1.892022, 1, 0, 0, 1, 1,
-0.9931802, 1.614495, -1.21216, 1, 0, 0, 1, 1,
-0.9837728, -0.3753613, -0.5716495, 0, 0, 0, 1, 1,
-0.9719849, 0.458138, 0.3352605, 0, 0, 0, 1, 1,
-0.9687396, -1.104395, -1.247484, 0, 0, 0, 1, 1,
-0.9437603, 0.8771726, -2.760421, 0, 0, 0, 1, 1,
-0.9372207, 0.06331951, -4.366685, 0, 0, 0, 1, 1,
-0.926874, -0.07975005, -2.261972, 0, 0, 0, 1, 1,
-0.9189005, -0.7518456, -3.632758, 0, 0, 0, 1, 1,
-0.9187645, 0.455172, -1.161781, 1, 1, 1, 1, 1,
-0.9162681, -0.004193791, -1.837225, 1, 1, 1, 1, 1,
-0.9052841, -0.3852563, -0.6939911, 1, 1, 1, 1, 1,
-0.9050306, -0.4500061, -2.226798, 1, 1, 1, 1, 1,
-0.9008125, -1.531807, -2.575667, 1, 1, 1, 1, 1,
-0.8922045, -2.012762, -1.876066, 1, 1, 1, 1, 1,
-0.8897559, 0.3367512, 0.1493482, 1, 1, 1, 1, 1,
-0.8871462, -0.6953826, -1.783739, 1, 1, 1, 1, 1,
-0.8844996, 0.6854475, -0.1983789, 1, 1, 1, 1, 1,
-0.8799625, -0.6778876, -3.547491, 1, 1, 1, 1, 1,
-0.8776334, 0.6840043, -0.8733717, 1, 1, 1, 1, 1,
-0.8732039, -1.120002, -2.993589, 1, 1, 1, 1, 1,
-0.8616815, -0.1303897, -2.935665, 1, 1, 1, 1, 1,
-0.8559206, 0.1479266, -0.9724089, 1, 1, 1, 1, 1,
-0.8499237, -1.094714, -2.305015, 1, 1, 1, 1, 1,
-0.8416843, -0.0007203875, -1.220764, 0, 0, 1, 1, 1,
-0.8404618, 0.494022, 0.2441074, 1, 0, 0, 1, 1,
-0.838376, -0.5458356, -0.9760389, 1, 0, 0, 1, 1,
-0.8357947, 0.6604512, -0.3780118, 1, 0, 0, 1, 1,
-0.8291803, -0.6972116, -2.453544, 1, 0, 0, 1, 1,
-0.8278539, 0.6082045, 0.6872509, 1, 0, 0, 1, 1,
-0.8231189, 0.4015261, -3.27476, 0, 0, 0, 1, 1,
-0.8137302, 1.154413, -1.200478, 0, 0, 0, 1, 1,
-0.8133421, -0.3906097, -2.44171, 0, 0, 0, 1, 1,
-0.8121074, 0.2703155, -1.381509, 0, 0, 0, 1, 1,
-0.8059816, -0.549809, -1.406339, 0, 0, 0, 1, 1,
-0.8026784, 1.364341, -1.605111, 0, 0, 0, 1, 1,
-0.7997847, 0.7769382, -0.9977691, 0, 0, 0, 1, 1,
-0.7967021, -0.08815167, -1.234157, 1, 1, 1, 1, 1,
-0.793154, -1.347109, -1.751227, 1, 1, 1, 1, 1,
-0.7906033, 1.112926, -1.40655, 1, 1, 1, 1, 1,
-0.789431, -0.178515, -2.242432, 1, 1, 1, 1, 1,
-0.7849599, 0.4763036, -0.7649876, 1, 1, 1, 1, 1,
-0.7821326, 1.307823, -1.067181, 1, 1, 1, 1, 1,
-0.7775645, 0.5529435, -0.39192, 1, 1, 1, 1, 1,
-0.7774406, -0.7114348, -2.742591, 1, 1, 1, 1, 1,
-0.7742169, -0.0393563, -2.124734, 1, 1, 1, 1, 1,
-0.7729696, -0.0732829, -1.914647, 1, 1, 1, 1, 1,
-0.771079, -0.3706906, -3.015072, 1, 1, 1, 1, 1,
-0.7707552, -0.8016008, -3.509122, 1, 1, 1, 1, 1,
-0.7685826, 0.475945, -0.6087627, 1, 1, 1, 1, 1,
-0.7655089, -0.7478817, -2.813698, 1, 1, 1, 1, 1,
-0.7527564, 0.7924315, -0.908008, 1, 1, 1, 1, 1,
-0.752488, -0.1916808, -3.077963, 0, 0, 1, 1, 1,
-0.7475309, -0.9525511, -2.994234, 1, 0, 0, 1, 1,
-0.7442465, 0.1590403, -0.7373639, 1, 0, 0, 1, 1,
-0.7428862, -0.6839178, -0.925544, 1, 0, 0, 1, 1,
-0.7420504, -1.064633, -1.298013, 1, 0, 0, 1, 1,
-0.7367862, 0.08051815, -2.123601, 1, 0, 0, 1, 1,
-0.7302818, 0.7974443, -2.439481, 0, 0, 0, 1, 1,
-0.723312, 0.9405815, -0.2197179, 0, 0, 0, 1, 1,
-0.7175591, -0.2478597, -1.496768, 0, 0, 0, 1, 1,
-0.7170742, 1.32746, 0.8660336, 0, 0, 0, 1, 1,
-0.7162014, 0.1640348, -1.928212, 0, 0, 0, 1, 1,
-0.7161449, -0.1466319, 0.1001146, 0, 0, 0, 1, 1,
-0.7104725, -0.4364861, -3.663367, 0, 0, 0, 1, 1,
-0.7039136, -0.7557818, -2.39864, 1, 1, 1, 1, 1,
-0.7038119, 0.7025783, 0.2821085, 1, 1, 1, 1, 1,
-0.7022299, -1.416485, -0.1792716, 1, 1, 1, 1, 1,
-0.7016171, -2.27754, -2.061953, 1, 1, 1, 1, 1,
-0.7003033, 1.848079, -0.3609292, 1, 1, 1, 1, 1,
-0.6962302, -1.025601, -1.748707, 1, 1, 1, 1, 1,
-0.6808938, 0.1963922, -1.718952, 1, 1, 1, 1, 1,
-0.6770965, -0.3183395, -3.339375, 1, 1, 1, 1, 1,
-0.674872, 1.248183, -1.136444, 1, 1, 1, 1, 1,
-0.6689218, 1.403612, -2.189543, 1, 1, 1, 1, 1,
-0.66449, 0.3058001, -1.023427, 1, 1, 1, 1, 1,
-0.6627719, -0.3118185, -2.117417, 1, 1, 1, 1, 1,
-0.6620283, -1.754205, -2.64768, 1, 1, 1, 1, 1,
-0.6615618, 1.870611, -0.9320104, 1, 1, 1, 1, 1,
-0.6579805, -1.663516, -3.74028, 1, 1, 1, 1, 1,
-0.6575058, -0.3256069, -2.558155, 0, 0, 1, 1, 1,
-0.6572158, -0.5601249, -1.993313, 1, 0, 0, 1, 1,
-0.6372716, -2.70942, -1.80681, 1, 0, 0, 1, 1,
-0.6314374, 0.1779143, -1.417211, 1, 0, 0, 1, 1,
-0.6291055, 0.06227724, 0.5071427, 1, 0, 0, 1, 1,
-0.6262789, -0.4671246, -2.25317, 1, 0, 0, 1, 1,
-0.6225312, 0.8207191, 1.842867, 0, 0, 0, 1, 1,
-0.6160227, 1.385229, 0.5453149, 0, 0, 0, 1, 1,
-0.6156464, 0.8834636, 0.3867359, 0, 0, 0, 1, 1,
-0.6097691, 0.3921708, -0.472953, 0, 0, 0, 1, 1,
-0.6055856, -0.7914404, -3.581807, 0, 0, 0, 1, 1,
-0.6033198, -0.3627731, -1.477033, 0, 0, 0, 1, 1,
-0.6005338, 0.233029, -1.309026, 0, 0, 0, 1, 1,
-0.596671, 0.2839386, 0.1838482, 1, 1, 1, 1, 1,
-0.594461, -1.425408, -2.15866, 1, 1, 1, 1, 1,
-0.594229, 1.318993, -0.5160238, 1, 1, 1, 1, 1,
-0.5888372, -0.404517, -2.19321, 1, 1, 1, 1, 1,
-0.5874731, -1.464798, -2.054825, 1, 1, 1, 1, 1,
-0.5862381, -1.047503, -3.44859, 1, 1, 1, 1, 1,
-0.5848551, -0.8879133, -3.177433, 1, 1, 1, 1, 1,
-0.5836017, 1.025003, -0.3463517, 1, 1, 1, 1, 1,
-0.5835834, -1.102158, -2.296985, 1, 1, 1, 1, 1,
-0.5817872, 0.02509226, -1.450236, 1, 1, 1, 1, 1,
-0.5811057, -1.956155, -3.563567, 1, 1, 1, 1, 1,
-0.5750536, 0.6440101, -0.2406089, 1, 1, 1, 1, 1,
-0.5748864, 0.8605052, -0.119893, 1, 1, 1, 1, 1,
-0.5670135, -2.448296, -2.269227, 1, 1, 1, 1, 1,
-0.560625, -1.825798, -3.511509, 1, 1, 1, 1, 1,
-0.5571907, 0.4453439, -2.121412, 0, 0, 1, 1, 1,
-0.5556157, -1.610866, -3.958666, 1, 0, 0, 1, 1,
-0.5539501, 0.5239324, -0.7540759, 1, 0, 0, 1, 1,
-0.550114, 0.4298855, -0.5890231, 1, 0, 0, 1, 1,
-0.5495929, -1.157015, -3.427767, 1, 0, 0, 1, 1,
-0.5488637, -1.447844, -3.309799, 1, 0, 0, 1, 1,
-0.5468941, 2.470587, -0.1139678, 0, 0, 0, 1, 1,
-0.5390802, 0.5612999, -1.385714, 0, 0, 0, 1, 1,
-0.5388646, -0.3961356, -1.987954, 0, 0, 0, 1, 1,
-0.5326698, -0.669354, -3.295303, 0, 0, 0, 1, 1,
-0.5314367, 0.1534944, -1.635858, 0, 0, 0, 1, 1,
-0.5300249, -0.5220953, -2.161818, 0, 0, 0, 1, 1,
-0.5281996, -1.205431, -4.331125, 0, 0, 0, 1, 1,
-0.5248489, -0.9452721, -2.363762, 1, 1, 1, 1, 1,
-0.5244005, -0.275619, -0.7274162, 1, 1, 1, 1, 1,
-0.5219881, 1.105796, -0.6850599, 1, 1, 1, 1, 1,
-0.5192106, -0.390794, -3.065465, 1, 1, 1, 1, 1,
-0.5190704, 1.396173, -1.24676, 1, 1, 1, 1, 1,
-0.5171929, 1.282926, -0.2145958, 1, 1, 1, 1, 1,
-0.5125675, 1.182969, -0.7708089, 1, 1, 1, 1, 1,
-0.5108224, -0.1189868, -0.5938528, 1, 1, 1, 1, 1,
-0.5084754, 0.1693367, -2.034679, 1, 1, 1, 1, 1,
-0.5080984, -0.218023, -2.216532, 1, 1, 1, 1, 1,
-0.5046756, 1.129164, 1.031699, 1, 1, 1, 1, 1,
-0.5008096, 0.4434239, 0.5338247, 1, 1, 1, 1, 1,
-0.4989185, -1.81722, -2.006309, 1, 1, 1, 1, 1,
-0.4969153, 0.09290285, -0.5020953, 1, 1, 1, 1, 1,
-0.4961917, 0.636409, -0.6130558, 1, 1, 1, 1, 1,
-0.4959438, -2.044089, -2.961429, 0, 0, 1, 1, 1,
-0.4928442, 0.5840003, -1.204513, 1, 0, 0, 1, 1,
-0.4888377, -0.2704891, -1.960627, 1, 0, 0, 1, 1,
-0.488027, -1.34192, -3.24355, 1, 0, 0, 1, 1,
-0.4831012, 0.328474, 0.7366928, 1, 0, 0, 1, 1,
-0.4812615, -1.022894, -2.981472, 1, 0, 0, 1, 1,
-0.4795978, 0.4172938, -1.968785, 0, 0, 0, 1, 1,
-0.4785664, -1.240719, -4.071556, 0, 0, 0, 1, 1,
-0.476331, 0.7289087, -0.5957164, 0, 0, 0, 1, 1,
-0.4751971, 0.924965, 1.337415, 0, 0, 0, 1, 1,
-0.4725481, -1.401994, -3.236474, 0, 0, 0, 1, 1,
-0.4725314, -0.7719504, -1.433572, 0, 0, 0, 1, 1,
-0.4705096, -0.5149541, -2.450505, 0, 0, 0, 1, 1,
-0.4692009, 1.566729, 0.2509652, 1, 1, 1, 1, 1,
-0.4683543, 0.3522123, -1.065171, 1, 1, 1, 1, 1,
-0.4651594, -0.7918329, -2.439205, 1, 1, 1, 1, 1,
-0.4645363, 0.2159853, 0.317881, 1, 1, 1, 1, 1,
-0.4640375, 0.5956312, -0.8301547, 1, 1, 1, 1, 1,
-0.4604029, -0.7500171, -1.314966, 1, 1, 1, 1, 1,
-0.4593517, -0.7668577, -3.271318, 1, 1, 1, 1, 1,
-0.4581945, 0.1419877, 0.9786568, 1, 1, 1, 1, 1,
-0.4569521, 0.6648337, -0.8284812, 1, 1, 1, 1, 1,
-0.4542897, 0.8196713, -1.041998, 1, 1, 1, 1, 1,
-0.4459168, 0.193909, 0.6186324, 1, 1, 1, 1, 1,
-0.4335496, 0.7798126, -1.095076, 1, 1, 1, 1, 1,
-0.4318735, 0.1340825, -1.094501, 1, 1, 1, 1, 1,
-0.4293191, 0.7404803, -0.3591262, 1, 1, 1, 1, 1,
-0.4268034, -0.05272065, -0.7600965, 1, 1, 1, 1, 1,
-0.4234722, -1.530883, -1.466405, 0, 0, 1, 1, 1,
-0.422131, 0.8269995, -0.1422293, 1, 0, 0, 1, 1,
-0.4186229, -1.32653, -4.006177, 1, 0, 0, 1, 1,
-0.4176653, 0.7627777, -0.5955829, 1, 0, 0, 1, 1,
-0.4165753, 1.416742, 0.01893597, 1, 0, 0, 1, 1,
-0.4153882, -2.276762, -3.449939, 1, 0, 0, 1, 1,
-0.4137017, 1.256547, 0.3437164, 0, 0, 0, 1, 1,
-0.4136673, 0.3207372, 0.2846453, 0, 0, 0, 1, 1,
-0.4088573, 0.6157118, -0.9177713, 0, 0, 0, 1, 1,
-0.4085207, -2.722277, -1.487091, 0, 0, 0, 1, 1,
-0.4071443, 0.7713574, -0.651116, 0, 0, 0, 1, 1,
-0.4004759, -0.65644, -3.04372, 0, 0, 0, 1, 1,
-0.3923259, -1.958673, -4.287922, 0, 0, 0, 1, 1,
-0.3918045, 0.5059651, -1.676195, 1, 1, 1, 1, 1,
-0.3888101, 1.757988, -1.322165, 1, 1, 1, 1, 1,
-0.3836279, -1.714796, -3.033236, 1, 1, 1, 1, 1,
-0.3791302, -0.2580084, -4.682161, 1, 1, 1, 1, 1,
-0.3791108, -0.08437781, -2.055739, 1, 1, 1, 1, 1,
-0.3728248, 0.178539, -1.381774, 1, 1, 1, 1, 1,
-0.3704204, 0.76292, -1.094402, 1, 1, 1, 1, 1,
-0.3693768, -0.3490955, -1.898582, 1, 1, 1, 1, 1,
-0.3687036, 1.839103, -0.7781811, 1, 1, 1, 1, 1,
-0.3684605, 0.6684001, -0.1110398, 1, 1, 1, 1, 1,
-0.3655842, -0.9044688, -1.857408, 1, 1, 1, 1, 1,
-0.3647755, 1.287794, -0.2452804, 1, 1, 1, 1, 1,
-0.3637037, 1.491811, 0.4947065, 1, 1, 1, 1, 1,
-0.362962, -0.8119233, -2.72426, 1, 1, 1, 1, 1,
-0.3625212, -0.4714619, -3.248548, 1, 1, 1, 1, 1,
-0.361616, 0.2326703, -1.399939, 0, 0, 1, 1, 1,
-0.3589569, -1.079402, -2.195434, 1, 0, 0, 1, 1,
-0.3542172, 0.4258444, -2.007239, 1, 0, 0, 1, 1,
-0.352189, 0.0273923, 0.1331276, 1, 0, 0, 1, 1,
-0.3508745, -1.208873, -1.80607, 1, 0, 0, 1, 1,
-0.350308, 0.14843, -0.7386893, 1, 0, 0, 1, 1,
-0.3494015, -1.22886, -2.560737, 0, 0, 0, 1, 1,
-0.348435, 0.06664938, -0.7561564, 0, 0, 0, 1, 1,
-0.3468975, 0.07726758, -1.100843, 0, 0, 0, 1, 1,
-0.3459974, -0.6139082, -4.124044, 0, 0, 0, 1, 1,
-0.3404078, 0.1144586, -2.314266, 0, 0, 0, 1, 1,
-0.3399221, -2.033297, -2.057883, 0, 0, 0, 1, 1,
-0.3348275, -0.01177468, -1.031723, 0, 0, 0, 1, 1,
-0.3338421, -1.154823, -3.659181, 1, 1, 1, 1, 1,
-0.3296808, -0.03411056, -2.862199, 1, 1, 1, 1, 1,
-0.3270675, 0.3267303, -0.4992571, 1, 1, 1, 1, 1,
-0.3226194, 0.2747459, 0.336762, 1, 1, 1, 1, 1,
-0.3166371, 0.4155487, -0.8704781, 1, 1, 1, 1, 1,
-0.3157001, 0.9160851, 0.09994061, 1, 1, 1, 1, 1,
-0.3142867, -0.2338235, -2.473675, 1, 1, 1, 1, 1,
-0.3133982, 0.7968152, 0.1405086, 1, 1, 1, 1, 1,
-0.3127826, -0.1183252, -1.685378, 1, 1, 1, 1, 1,
-0.3092881, 1.259951, 1.00995, 1, 1, 1, 1, 1,
-0.3066953, 2.280923, 1.153604, 1, 1, 1, 1, 1,
-0.2985727, 0.9397631, -1.773244, 1, 1, 1, 1, 1,
-0.2949771, -1.408995, -2.652243, 1, 1, 1, 1, 1,
-0.2926304, -1.28708, -4.605827, 1, 1, 1, 1, 1,
-0.2869886, -0.5611566, -3.148767, 1, 1, 1, 1, 1,
-0.2834097, -1.559588, -0.7945456, 0, 0, 1, 1, 1,
-0.2828295, 1.459022, 0.5713717, 1, 0, 0, 1, 1,
-0.2794633, -0.3980806, -3.839851, 1, 0, 0, 1, 1,
-0.2779587, -0.3699733, -2.304451, 1, 0, 0, 1, 1,
-0.2742552, 1.206618, 0.193587, 1, 0, 0, 1, 1,
-0.2680128, -0.7237772, -3.208751, 1, 0, 0, 1, 1,
-0.2670612, -0.7285162, -1.988531, 0, 0, 0, 1, 1,
-0.2651994, 0.9900489, 0.4165068, 0, 0, 0, 1, 1,
-0.2593987, -2.258889, -1.748328, 0, 0, 0, 1, 1,
-0.2573184, -0.1709275, -2.029854, 0, 0, 0, 1, 1,
-0.2565442, 2.168574, -1.212561, 0, 0, 0, 1, 1,
-0.2548695, -0.1897918, -1.631761, 0, 0, 0, 1, 1,
-0.2500516, 0.0366699, -2.709544, 0, 0, 0, 1, 1,
-0.2497602, 1.883488, 1.271388, 1, 1, 1, 1, 1,
-0.2478931, 0.729819, -0.5630227, 1, 1, 1, 1, 1,
-0.2463932, 0.2550205, -0.6501989, 1, 1, 1, 1, 1,
-0.2425195, -0.9103939, -2.332018, 1, 1, 1, 1, 1,
-0.2423025, -0.3683448, -4.879666, 1, 1, 1, 1, 1,
-0.2416006, -0.07762649, -2.400084, 1, 1, 1, 1, 1,
-0.2374219, -0.453411, -1.892161, 1, 1, 1, 1, 1,
-0.2345243, -0.4481857, -2.892664, 1, 1, 1, 1, 1,
-0.2342148, -2.219608, -3.167615, 1, 1, 1, 1, 1,
-0.2321368, 1.170463, -0.3853071, 1, 1, 1, 1, 1,
-0.2249395, -0.3745373, -3.093495, 1, 1, 1, 1, 1,
-0.2239568, -1.111629, -1.581666, 1, 1, 1, 1, 1,
-0.2205948, 0.5085173, 0.7178676, 1, 1, 1, 1, 1,
-0.2181644, 1.430057, -0.1078122, 1, 1, 1, 1, 1,
-0.2162593, 0.5208602, 0.1313017, 1, 1, 1, 1, 1,
-0.2100819, 0.3113607, -1.027829, 0, 0, 1, 1, 1,
-0.2065437, -0.9691756, -3.182062, 1, 0, 0, 1, 1,
-0.2061808, -2.075008, -3.224706, 1, 0, 0, 1, 1,
-0.205835, 1.478759, 0.1390567, 1, 0, 0, 1, 1,
-0.2041709, -0.6963475, -4.593706, 1, 0, 0, 1, 1,
-0.2032252, -0.07207549, -2.832392, 1, 0, 0, 1, 1,
-0.2025165, 0.2345619, -1.403489, 0, 0, 0, 1, 1,
-0.1990894, 0.5277434, -2.120257, 0, 0, 0, 1, 1,
-0.1989017, 0.2320154, -0.8770168, 0, 0, 0, 1, 1,
-0.198566, 1.648969, -2.045344, 0, 0, 0, 1, 1,
-0.1951563, 1.76202, 1.426643, 0, 0, 0, 1, 1,
-0.1939915, 0.8529702, -0.7011303, 0, 0, 0, 1, 1,
-0.1897854, -0.5290706, -2.624115, 0, 0, 0, 1, 1,
-0.1893748, -1.862152, -3.649115, 1, 1, 1, 1, 1,
-0.1846053, -1.171212, -4.625896, 1, 1, 1, 1, 1,
-0.1827514, -1.434209, -2.27065, 1, 1, 1, 1, 1,
-0.1824426, 0.6159636, -0.8750647, 1, 1, 1, 1, 1,
-0.1731596, 1.605555, 1.832525, 1, 1, 1, 1, 1,
-0.1691311, -1.18614, -5.276358, 1, 1, 1, 1, 1,
-0.16619, -0.8384101, -2.337464, 1, 1, 1, 1, 1,
-0.1653648, -2.375499, -2.633592, 1, 1, 1, 1, 1,
-0.164533, 0.690475, -3.006261, 1, 1, 1, 1, 1,
-0.163276, 0.9032207, 0.7898843, 1, 1, 1, 1, 1,
-0.1589699, 0.5038249, 0.322578, 1, 1, 1, 1, 1,
-0.1577157, 0.04834979, -1.549344, 1, 1, 1, 1, 1,
-0.1553137, -0.2316526, -1.855767, 1, 1, 1, 1, 1,
-0.152956, -0.4488705, -2.452662, 1, 1, 1, 1, 1,
-0.1513736, -0.7783967, -2.915116, 1, 1, 1, 1, 1,
-0.1494833, 0.1033298, -0.9262353, 0, 0, 1, 1, 1,
-0.1463947, -1.341677, -3.656789, 1, 0, 0, 1, 1,
-0.1443344, 0.1630431, -1.796694, 1, 0, 0, 1, 1,
-0.1433605, 0.06801784, -1.525654, 1, 0, 0, 1, 1,
-0.1423114, -1.076742, -3.644383, 1, 0, 0, 1, 1,
-0.1413712, 0.8787282, -0.3605767, 1, 0, 0, 1, 1,
-0.1403636, 2.334469, 0.0440947, 0, 0, 0, 1, 1,
-0.1385787, 0.8480228, 0.1448034, 0, 0, 0, 1, 1,
-0.1378582, 0.9526559, -1.308473, 0, 0, 0, 1, 1,
-0.136887, -1.653037, -3.317283, 0, 0, 0, 1, 1,
-0.1367587, -0.1843877, -1.949544, 0, 0, 0, 1, 1,
-0.1356644, 0.0705225, -0.7410783, 0, 0, 0, 1, 1,
-0.1336372, 0.3770573, -2.000102, 0, 0, 0, 1, 1,
-0.1312791, 1.440431, -1.419125, 1, 1, 1, 1, 1,
-0.1305326, -1.687065, -5.656077, 1, 1, 1, 1, 1,
-0.1243835, -0.8818933, -4.402818, 1, 1, 1, 1, 1,
-0.1205359, 1.188938, 0.003544967, 1, 1, 1, 1, 1,
-0.1178333, 0.6892156, 1.037236, 1, 1, 1, 1, 1,
-0.1160595, -0.5197373, -1.344269, 1, 1, 1, 1, 1,
-0.114139, 0.2471707, 0.6332741, 1, 1, 1, 1, 1,
-0.1113088, -1.271303, -4.184407, 1, 1, 1, 1, 1,
-0.1104049, -0.5166505, -4.16272, 1, 1, 1, 1, 1,
-0.1075524, 0.7682332, 1.508537, 1, 1, 1, 1, 1,
-0.1050146, -0.2467892, -4.436866, 1, 1, 1, 1, 1,
-0.1021944, 0.7377685, -1.034727, 1, 1, 1, 1, 1,
-0.1009654, 1.302341, 0.3014913, 1, 1, 1, 1, 1,
-0.09235854, -0.7447197, -2.648468, 1, 1, 1, 1, 1,
-0.09200796, 2.012191, -0.7192563, 1, 1, 1, 1, 1,
-0.08955196, -1.664214, -1.959843, 0, 0, 1, 1, 1,
-0.0895348, 0.2802725, -1.693669, 1, 0, 0, 1, 1,
-0.08491533, 0.6398522, 0.2208903, 1, 0, 0, 1, 1,
-0.08398727, -0.1846538, -2.495513, 1, 0, 0, 1, 1,
-0.08049476, 1.719706, 0.8642126, 1, 0, 0, 1, 1,
-0.0769131, -0.3000976, -4.033104, 1, 0, 0, 1, 1,
-0.07521676, 1.890645, -1.459018, 0, 0, 0, 1, 1,
-0.07195289, -0.7637848, -2.990152, 0, 0, 0, 1, 1,
-0.06953599, -0.1615654, -1.493637, 0, 0, 0, 1, 1,
-0.06928992, -0.2549866, -2.602028, 0, 0, 0, 1, 1,
-0.06474611, -0.5241187, -2.938005, 0, 0, 0, 1, 1,
-0.05862032, 0.3059951, -0.3282724, 0, 0, 0, 1, 1,
-0.05803907, 0.08732148, 0.1186862, 0, 0, 0, 1, 1,
-0.05677365, 1.058933, 0.005523925, 1, 1, 1, 1, 1,
-0.05610519, 1.117657, -0.9401187, 1, 1, 1, 1, 1,
-0.05442454, -0.1879772, -3.834513, 1, 1, 1, 1, 1,
-0.04931294, 2.275368, 0.463031, 1, 1, 1, 1, 1,
-0.04669805, -0.8689398, -2.297247, 1, 1, 1, 1, 1,
-0.04647273, 0.3818848, -0.4386144, 1, 1, 1, 1, 1,
-0.04460396, -1.201429, -4.040887, 1, 1, 1, 1, 1,
-0.04218002, -0.9400626, -4.420355, 1, 1, 1, 1, 1,
-0.04134081, -0.7903133, -0.4324946, 1, 1, 1, 1, 1,
-0.0392475, -0.08835085, -2.886297, 1, 1, 1, 1, 1,
-0.03695417, 0.7887442, -0.72629, 1, 1, 1, 1, 1,
-0.03423733, -1.47557, -2.266037, 1, 1, 1, 1, 1,
-0.03410722, 0.3678632, 0.1265642, 1, 1, 1, 1, 1,
-0.0340908, 0.09115289, -2.004665, 1, 1, 1, 1, 1,
-0.02810334, -0.1097279, -2.726267, 1, 1, 1, 1, 1,
-0.02486331, 1.825174, 1.371797, 0, 0, 1, 1, 1,
-0.02148063, -1.369288, -3.598619, 1, 0, 0, 1, 1,
-0.02120246, 1.113711, -0.101349, 1, 0, 0, 1, 1,
-0.02014895, -0.7821571, -3.519722, 1, 0, 0, 1, 1,
-0.01888323, 0.5666382, -0.3456239, 1, 0, 0, 1, 1,
-0.01206821, -0.1762884, -3.499601, 1, 0, 0, 1, 1,
-0.009846512, -0.7660941, -2.435781, 0, 0, 0, 1, 1,
-0.005719661, -0.2467292, -2.660075, 0, 0, 0, 1, 1,
-0.001392153, -1.090725, -3.951394, 0, 0, 0, 1, 1,
-0.000858984, 0.4744106, -0.6577407, 0, 0, 0, 1, 1,
0.004761904, 1.910608, -0.2175122, 0, 0, 0, 1, 1,
0.005089868, 0.8028534, -0.1327172, 0, 0, 0, 1, 1,
0.00642508, -0.6955007, 5.463772, 0, 0, 0, 1, 1,
0.006478759, -1.298335, 4.265852, 1, 1, 1, 1, 1,
0.01009201, 0.154007, 0.6698454, 1, 1, 1, 1, 1,
0.01112503, -1.100009, 3.315302, 1, 1, 1, 1, 1,
0.0113262, 0.118136, 0.03422909, 1, 1, 1, 1, 1,
0.01154553, -1.074137, 3.533996, 1, 1, 1, 1, 1,
0.01233379, 0.3983156, -0.2001078, 1, 1, 1, 1, 1,
0.01732703, -0.1439351, 3.179037, 1, 1, 1, 1, 1,
0.02052649, 1.059515, -1.462141, 1, 1, 1, 1, 1,
0.02264865, 1.630343, -0.2449613, 1, 1, 1, 1, 1,
0.02889788, 2.066593, 1.196626, 1, 1, 1, 1, 1,
0.03081916, 0.5723149, -1.192116, 1, 1, 1, 1, 1,
0.0308368, -0.395965, 3.828686, 1, 1, 1, 1, 1,
0.03786505, -0.09436564, 1.234189, 1, 1, 1, 1, 1,
0.03922873, -1.035349, 3.381331, 1, 1, 1, 1, 1,
0.03952345, -0.262592, 1.952085, 1, 1, 1, 1, 1,
0.03998874, 0.4613072, -1.054583, 0, 0, 1, 1, 1,
0.04154887, 0.5112482, -0.5814837, 1, 0, 0, 1, 1,
0.04224648, 0.415975, 0.04041222, 1, 0, 0, 1, 1,
0.04737748, 1.007633, 0.1118743, 1, 0, 0, 1, 1,
0.04852113, -1.381939, 1.349422, 1, 0, 0, 1, 1,
0.04976217, 0.8368569, -0.5314103, 1, 0, 0, 1, 1,
0.04990385, 1.31214, -0.2499531, 0, 0, 0, 1, 1,
0.05176677, 1.003367, 1.209504, 0, 0, 0, 1, 1,
0.05562965, -1.321288, 2.458269, 0, 0, 0, 1, 1,
0.05606054, -0.2010583, 2.146879, 0, 0, 0, 1, 1,
0.05612854, -0.8495318, 0.7899219, 0, 0, 0, 1, 1,
0.05784736, 0.7563307, -0.1087594, 0, 0, 0, 1, 1,
0.05849851, -0.8740935, 3.899293, 0, 0, 0, 1, 1,
0.06108812, -0.2449906, 2.932336, 1, 1, 1, 1, 1,
0.06417503, -0.3847873, 2.357831, 1, 1, 1, 1, 1,
0.06421007, 0.07765433, 0.201696, 1, 1, 1, 1, 1,
0.06425709, 1.673377, 0.2640758, 1, 1, 1, 1, 1,
0.06497431, -0.2532577, 2.708838, 1, 1, 1, 1, 1,
0.0659094, 0.445519, 0.654438, 1, 1, 1, 1, 1,
0.06772922, 0.6643218, -0.1964718, 1, 1, 1, 1, 1,
0.07326696, 0.0102106, 1.132455, 1, 1, 1, 1, 1,
0.07362393, -0.1735779, 1.915867, 1, 1, 1, 1, 1,
0.07507791, 0.4269488, -0.978111, 1, 1, 1, 1, 1,
0.0766478, -0.7755139, 2.116376, 1, 1, 1, 1, 1,
0.07794948, -1.918415, 5.070859, 1, 1, 1, 1, 1,
0.08155023, -0.3363772, 2.808257, 1, 1, 1, 1, 1,
0.08260482, 0.6419866, 1.743747, 1, 1, 1, 1, 1,
0.08434968, 0.200809, 1.274115, 1, 1, 1, 1, 1,
0.08757353, 0.2266214, 1.287391, 0, 0, 1, 1, 1,
0.08799727, 0.2058657, 2.48646, 1, 0, 0, 1, 1,
0.08919317, 0.8914959, 1.113378, 1, 0, 0, 1, 1,
0.09131352, -1.06245, 3.960408, 1, 0, 0, 1, 1,
0.09273235, -0.5381149, 4.600771, 1, 0, 0, 1, 1,
0.0935078, 1.33121, 0.03205648, 1, 0, 0, 1, 1,
0.09658417, -1.807058, 5.813645, 0, 0, 0, 1, 1,
0.104059, -1.185917, 2.433115, 0, 0, 0, 1, 1,
0.1051437, 0.2990956, -0.1582946, 0, 0, 0, 1, 1,
0.1052676, -1.590864, 3.702101, 0, 0, 0, 1, 1,
0.1107321, -0.9830027, 2.869965, 0, 0, 0, 1, 1,
0.1144765, -0.8197747, 2.042346, 0, 0, 0, 1, 1,
0.1150514, -0.2175134, 3.657359, 0, 0, 0, 1, 1,
0.1163018, -0.8227341, 1.983976, 1, 1, 1, 1, 1,
0.1178539, -1.735079, 2.002382, 1, 1, 1, 1, 1,
0.121079, -0.1912712, 2.638014, 1, 1, 1, 1, 1,
0.1215153, 0.1841225, 2.590302, 1, 1, 1, 1, 1,
0.12293, -1.619491, 2.939286, 1, 1, 1, 1, 1,
0.1312787, 0.275445, 0.07879348, 1, 1, 1, 1, 1,
0.1314835, 2.850277, 2.202703, 1, 1, 1, 1, 1,
0.1315823, 0.01230189, 2.273741, 1, 1, 1, 1, 1,
0.1318887, 1.012565, -1.299117, 1, 1, 1, 1, 1,
0.1325181, 0.5814529, -0.03152611, 1, 1, 1, 1, 1,
0.1336053, -1.374218, 3.830541, 1, 1, 1, 1, 1,
0.1346667, 0.4162793, 0.2889248, 1, 1, 1, 1, 1,
0.1367356, 0.3101854, 0.222598, 1, 1, 1, 1, 1,
0.1388495, 1.139833, 0.7721162, 1, 1, 1, 1, 1,
0.1406182, -1.917656, 2.91341, 1, 1, 1, 1, 1,
0.1457725, -1.173662, 2.479916, 0, 0, 1, 1, 1,
0.1467043, 0.494622, -1.396569, 1, 0, 0, 1, 1,
0.161842, 0.01840885, 2.345058, 1, 0, 0, 1, 1,
0.1710825, 0.5907326, 0.1351902, 1, 0, 0, 1, 1,
0.1730634, -0.1654957, 2.494454, 1, 0, 0, 1, 1,
0.1775492, 0.838864, -0.2968812, 1, 0, 0, 1, 1,
0.1829372, 0.4301965, -0.3709393, 0, 0, 0, 1, 1,
0.1832524, -1.275501, 2.674099, 0, 0, 0, 1, 1,
0.1881448, 0.08832923, 0.9424235, 0, 0, 0, 1, 1,
0.1949157, -0.5700787, 3.37436, 0, 0, 0, 1, 1,
0.1987327, -0.6082614, 1.864339, 0, 0, 0, 1, 1,
0.2025759, -0.7233415, 1.269077, 0, 0, 0, 1, 1,
0.2054933, 0.6260184, 3.194567, 0, 0, 0, 1, 1,
0.214715, -0.7666138, 3.610401, 1, 1, 1, 1, 1,
0.2153436, -0.3934613, 2.600066, 1, 1, 1, 1, 1,
0.2167142, -0.2961946, 2.780505, 1, 1, 1, 1, 1,
0.219668, 0.4664451, -0.04658395, 1, 1, 1, 1, 1,
0.2202913, 1.252411, 0.2424122, 1, 1, 1, 1, 1,
0.2215822, 1.281539, 0.9022837, 1, 1, 1, 1, 1,
0.2221891, -0.9668617, 3.120551, 1, 1, 1, 1, 1,
0.2253041, 0.9645727, 0.9288363, 1, 1, 1, 1, 1,
0.2254304, -0.1207377, 2.784463, 1, 1, 1, 1, 1,
0.2295445, 0.935019, -0.6832322, 1, 1, 1, 1, 1,
0.2310992, 0.3896073, 3.523315, 1, 1, 1, 1, 1,
0.2336866, 0.5263777, 1.028378, 1, 1, 1, 1, 1,
0.2356698, -1.099374, 2.591063, 1, 1, 1, 1, 1,
0.238619, 1.623862, -0.2626705, 1, 1, 1, 1, 1,
0.2413369, -1.893242, 1.99605, 1, 1, 1, 1, 1,
0.243833, -0.09754632, 2.305809, 0, 0, 1, 1, 1,
0.2466124, -0.4209903, 2.299973, 1, 0, 0, 1, 1,
0.2471022, -0.1555819, 4.256805, 1, 0, 0, 1, 1,
0.2474303, 1.510456, -1.755842, 1, 0, 0, 1, 1,
0.2518228, 0.6038947, 0.5958685, 1, 0, 0, 1, 1,
0.2520444, 1.225606, -1.33094, 1, 0, 0, 1, 1,
0.2560609, -0.09871383, -0.2825096, 0, 0, 0, 1, 1,
0.2578307, 1.004219, 0.3207628, 0, 0, 0, 1, 1,
0.2586316, 0.7306589, -1.386346, 0, 0, 0, 1, 1,
0.2597334, -0.07569891, 1.847788, 0, 0, 0, 1, 1,
0.2632096, 0.5140775, -0.4825127, 0, 0, 0, 1, 1,
0.2661689, 0.08680426, 1.819221, 0, 0, 0, 1, 1,
0.267205, -0.9685076, 3.748121, 0, 0, 0, 1, 1,
0.2700399, 0.5938469, 0.1967967, 1, 1, 1, 1, 1,
0.2704369, -1.077031, 3.743369, 1, 1, 1, 1, 1,
0.2793361, -0.244097, 2.231885, 1, 1, 1, 1, 1,
0.2804745, -0.0446383, 1.736177, 1, 1, 1, 1, 1,
0.2805613, -0.5644893, 3.393617, 1, 1, 1, 1, 1,
0.2829874, 0.645795, -0.6489632, 1, 1, 1, 1, 1,
0.2830688, 0.954227, 2.855989, 1, 1, 1, 1, 1,
0.2840605, -0.1634877, 2.525386, 1, 1, 1, 1, 1,
0.2846167, -0.5608344, 2.143708, 1, 1, 1, 1, 1,
0.2858235, -0.2197081, 1.605156, 1, 1, 1, 1, 1,
0.2872137, -0.5495281, 2.762596, 1, 1, 1, 1, 1,
0.2889993, 1.249279, 0.8687028, 1, 1, 1, 1, 1,
0.2937768, -0.7614047, 2.96773, 1, 1, 1, 1, 1,
0.2954397, 0.6264812, 0.8897737, 1, 1, 1, 1, 1,
0.2954692, 0.05083554, 0.5621055, 1, 1, 1, 1, 1,
0.2993202, -0.5569122, 1.233359, 0, 0, 1, 1, 1,
0.2996311, 1.084828, -0.8381029, 1, 0, 0, 1, 1,
0.3037595, -1.165504, 4.329264, 1, 0, 0, 1, 1,
0.3060274, 0.259645, 0.9151854, 1, 0, 0, 1, 1,
0.3061742, -0.0974819, 0.7003413, 1, 0, 0, 1, 1,
0.3090086, 1.179461, 1.267284, 1, 0, 0, 1, 1,
0.3104711, 0.3885313, 0.6056646, 0, 0, 0, 1, 1,
0.3133633, -0.6619559, 3.496133, 0, 0, 0, 1, 1,
0.3154753, 0.4448974, 0.3122272, 0, 0, 0, 1, 1,
0.3177448, -0.8246593, 3.185295, 0, 0, 0, 1, 1,
0.3192986, -0.1498066, 1.444869, 0, 0, 0, 1, 1,
0.3200541, 0.4188747, -0.3536036, 0, 0, 0, 1, 1,
0.320579, -0.5036511, 4.360937, 0, 0, 0, 1, 1,
0.3234802, 0.7771777, -1.19199, 1, 1, 1, 1, 1,
0.3256593, 0.0445553, 0.4168136, 1, 1, 1, 1, 1,
0.328225, -1.919538, 4.565382, 1, 1, 1, 1, 1,
0.3283469, -0.4357658, 2.648099, 1, 1, 1, 1, 1,
0.3333487, -1.00055, 1.656319, 1, 1, 1, 1, 1,
0.3338694, -0.002708937, 2.268884, 1, 1, 1, 1, 1,
0.3339064, -1.132231, 2.46529, 1, 1, 1, 1, 1,
0.3351404, 0.01473388, 0.5012982, 1, 1, 1, 1, 1,
0.3443841, 0.4207626, 1.347234, 1, 1, 1, 1, 1,
0.3460672, 0.5711237, 0.5198874, 1, 1, 1, 1, 1,
0.3518759, -1.277113, 2.927045, 1, 1, 1, 1, 1,
0.3543148, 0.413357, 0.2841642, 1, 1, 1, 1, 1,
0.3548403, -0.9659575, 2.567521, 1, 1, 1, 1, 1,
0.3574867, 0.1909631, -1.225806, 1, 1, 1, 1, 1,
0.3596567, 0.9255804, 1.504751, 1, 1, 1, 1, 1,
0.3605382, 1.978354, 0.5722265, 0, 0, 1, 1, 1,
0.3629692, -0.9546676, 3.627259, 1, 0, 0, 1, 1,
0.3653087, 0.08878639, 2.570648, 1, 0, 0, 1, 1,
0.3701869, 0.1549614, 1.23456, 1, 0, 0, 1, 1,
0.3756357, -0.08231866, 1.167378, 1, 0, 0, 1, 1,
0.3807769, -0.9178145, 2.827895, 1, 0, 0, 1, 1,
0.3831211, -0.6375284, 4.606136, 0, 0, 0, 1, 1,
0.3844326, 0.01569489, 0.5058505, 0, 0, 0, 1, 1,
0.3852513, 0.7762647, 0.7710419, 0, 0, 0, 1, 1,
0.3872029, 1.679987, -0.456874, 0, 0, 0, 1, 1,
0.3899711, 0.8832313, 1.09413, 0, 0, 0, 1, 1,
0.3935978, -1.336588, 2.785336, 0, 0, 0, 1, 1,
0.3945702, 0.2166523, 1.334485, 0, 0, 0, 1, 1,
0.3966045, 0.4596778, 1.836394, 1, 1, 1, 1, 1,
0.3967129, 0.2081112, 2.54519, 1, 1, 1, 1, 1,
0.3969617, 0.09240521, -0.262656, 1, 1, 1, 1, 1,
0.4030347, -1.443941, 1.078047, 1, 1, 1, 1, 1,
0.408945, -0.7703332, 3.37152, 1, 1, 1, 1, 1,
0.4191404, 1.827092, -0.6900031, 1, 1, 1, 1, 1,
0.4196474, 0.2422624, 2.558167, 1, 1, 1, 1, 1,
0.4223014, -0.1782576, 1.364491, 1, 1, 1, 1, 1,
0.4267082, -0.539569, 1.704501, 1, 1, 1, 1, 1,
0.429627, -0.9782184, 0.6393513, 1, 1, 1, 1, 1,
0.4316509, 0.7871074, 0.8123628, 1, 1, 1, 1, 1,
0.4317269, 0.1581106, 1.221037, 1, 1, 1, 1, 1,
0.432178, -0.4807794, 3.860976, 1, 1, 1, 1, 1,
0.4329543, -1.197623, 1.862972, 1, 1, 1, 1, 1,
0.4350381, -0.9819081, 1.597505, 1, 1, 1, 1, 1,
0.4358723, -0.6810712, 2.281085, 0, 0, 1, 1, 1,
0.4428886, -0.6971117, 3.002978, 1, 0, 0, 1, 1,
0.4436974, -1.904003, 3.697208, 1, 0, 0, 1, 1,
0.4453726, -0.2379897, 0.4773414, 1, 0, 0, 1, 1,
0.4464098, -0.8754082, 2.504807, 1, 0, 0, 1, 1,
0.4477069, -0.04117279, -1.098386, 1, 0, 0, 1, 1,
0.4486032, -0.1717016, 2.15398, 0, 0, 0, 1, 1,
0.4519138, 0.1415051, 1.343454, 0, 0, 0, 1, 1,
0.4531635, -0.9479455, 3.48136, 0, 0, 0, 1, 1,
0.4585699, 1.732065, 0.5860618, 0, 0, 0, 1, 1,
0.459642, 1.613428, 0.4062364, 0, 0, 0, 1, 1,
0.4674354, -0.8568563, 4.337451, 0, 0, 0, 1, 1,
0.4711461, -0.1383941, 0.4723536, 0, 0, 0, 1, 1,
0.4749265, -1.079909, 3.215775, 1, 1, 1, 1, 1,
0.4766822, 0.7079745, -0.01770264, 1, 1, 1, 1, 1,
0.4770559, -0.5052822, 2.139529, 1, 1, 1, 1, 1,
0.4794709, -0.4447977, 2.190499, 1, 1, 1, 1, 1,
0.4813282, -0.1754152, 0.9351654, 1, 1, 1, 1, 1,
0.4834543, -0.5150189, 0.8507311, 1, 1, 1, 1, 1,
0.4846317, -0.7669234, 3.93732, 1, 1, 1, 1, 1,
0.4851359, 0.09547981, 1.572824, 1, 1, 1, 1, 1,
0.4912093, -0.7563173, 1.006273, 1, 1, 1, 1, 1,
0.4983051, 1.089038, 0.009024506, 1, 1, 1, 1, 1,
0.5004069, 0.8375251, 0.4596296, 1, 1, 1, 1, 1,
0.5029065, 0.1943673, 2.373758, 1, 1, 1, 1, 1,
0.5059281, 2.221368, 0.6965396, 1, 1, 1, 1, 1,
0.5074086, -0.01186927, 2.270108, 1, 1, 1, 1, 1,
0.5076865, -0.2138961, 4.248985, 1, 1, 1, 1, 1,
0.5097187, -1.707695, 1.712643, 0, 0, 1, 1, 1,
0.5100262, -0.2126806, 2.638099, 1, 0, 0, 1, 1,
0.5121384, 0.158168, 0.5732983, 1, 0, 0, 1, 1,
0.5125101, -0.5428493, 2.646075, 1, 0, 0, 1, 1,
0.5136757, -0.8366389, 2.952928, 1, 0, 0, 1, 1,
0.5152519, -1.75556, 2.716902, 1, 0, 0, 1, 1,
0.5155157, 1.811592, -0.4752936, 0, 0, 0, 1, 1,
0.5207113, 0.4441689, 0.8477892, 0, 0, 0, 1, 1,
0.5232846, -0.5850973, 1.829443, 0, 0, 0, 1, 1,
0.5236691, 1.291463, -0.4314022, 0, 0, 0, 1, 1,
0.5255439, -0.7484756, 1.4621, 0, 0, 0, 1, 1,
0.5277258, -1.618904, 2.979499, 0, 0, 0, 1, 1,
0.5279704, -0.8355403, 3.036258, 0, 0, 0, 1, 1,
0.5281681, 0.9617398, 2.879174, 1, 1, 1, 1, 1,
0.5286419, 0.2748237, 0.01762692, 1, 1, 1, 1, 1,
0.5308406, 0.4737231, -0.3239542, 1, 1, 1, 1, 1,
0.537208, 0.07485007, 1.191068, 1, 1, 1, 1, 1,
0.5374725, 1.16159, 1.612723, 1, 1, 1, 1, 1,
0.5384029, -0.08881179, 2.15521, 1, 1, 1, 1, 1,
0.547241, 0.2311537, 0.5532118, 1, 1, 1, 1, 1,
0.5499932, -0.6755807, 2.242016, 1, 1, 1, 1, 1,
0.5579936, -1.501726, 3.575863, 1, 1, 1, 1, 1,
0.5595343, -0.05026703, 0.4493788, 1, 1, 1, 1, 1,
0.5668257, -0.8730386, 2.146363, 1, 1, 1, 1, 1,
0.567291, -0.1770847, -0.320289, 1, 1, 1, 1, 1,
0.5689783, -0.6128384, 3.738349, 1, 1, 1, 1, 1,
0.5802225, -0.7792842, 3.408675, 1, 1, 1, 1, 1,
0.5831134, 0.04784062, 0.1363594, 1, 1, 1, 1, 1,
0.583151, -0.01897291, 0.5193958, 0, 0, 1, 1, 1,
0.5917784, 0.459924, 1.368091, 1, 0, 0, 1, 1,
0.5977321, -0.6876836, 3.57972, 1, 0, 0, 1, 1,
0.6011984, -0.1754521, 1.777313, 1, 0, 0, 1, 1,
0.6035007, 1.997705, 1.187571, 1, 0, 0, 1, 1,
0.6059813, -1.217367, 1.951541, 1, 0, 0, 1, 1,
0.6062678, 0.3931667, -0.01368895, 0, 0, 0, 1, 1,
0.6085718, 1.63211, 0.6083406, 0, 0, 0, 1, 1,
0.6110989, -0.4948316, 3.293159, 0, 0, 0, 1, 1,
0.6139523, -1.355496, 3.0488, 0, 0, 0, 1, 1,
0.6177934, 0.6240884, 1.153915, 0, 0, 0, 1, 1,
0.6220973, 0.8485947, 0.8382711, 0, 0, 0, 1, 1,
0.627759, -0.7759188, 2.361481, 0, 0, 0, 1, 1,
0.6291667, -0.1729885, 2.053021, 1, 1, 1, 1, 1,
0.6298701, -0.6749125, 2.726967, 1, 1, 1, 1, 1,
0.6303041, 0.2214568, -0.1789409, 1, 1, 1, 1, 1,
0.6307465, -1.081676, 3.067374, 1, 1, 1, 1, 1,
0.6344362, -0.2898402, 2.830944, 1, 1, 1, 1, 1,
0.6361836, 0.2740549, -0.649415, 1, 1, 1, 1, 1,
0.6414886, 0.9112385, 0.12208, 1, 1, 1, 1, 1,
0.6525742, 0.4619303, 1.082499, 1, 1, 1, 1, 1,
0.6543575, -0.3787541, 2.936698, 1, 1, 1, 1, 1,
0.6593504, 1.197795, 0.5782499, 1, 1, 1, 1, 1,
0.6621882, -0.4315144, 2.19615, 1, 1, 1, 1, 1,
0.6710504, -1.233372, 3.589842, 1, 1, 1, 1, 1,
0.6768909, 1.826205, 0.2348263, 1, 1, 1, 1, 1,
0.679259, 0.9749808, 0.9012999, 1, 1, 1, 1, 1,
0.6821294, 1.221093, 1.331713, 1, 1, 1, 1, 1,
0.6835308, 0.1419316, 1.555469, 0, 0, 1, 1, 1,
0.6836373, 0.5533262, 2.756026, 1, 0, 0, 1, 1,
0.6851024, 1.764129, -0.7439251, 1, 0, 0, 1, 1,
0.6877297, 0.9308293, -1.045448, 1, 0, 0, 1, 1,
0.6972885, 1.441056, -0.371834, 1, 0, 0, 1, 1,
0.6978683, -0.8753083, 1.778496, 1, 0, 0, 1, 1,
0.698162, 2.374674, 0.9937045, 0, 0, 0, 1, 1,
0.7029162, 0.2241435, 0.5634204, 0, 0, 0, 1, 1,
0.7087036, -0.4551639, 3.128041, 0, 0, 0, 1, 1,
0.7149885, 0.8710921, -0.8775409, 0, 0, 0, 1, 1,
0.7171922, 1.591821, 0.2596412, 0, 0, 0, 1, 1,
0.7178531, 0.7410117, 0.1861016, 0, 0, 0, 1, 1,
0.7213581, -0.1897219, 2.134246, 0, 0, 0, 1, 1,
0.726051, 0.01814538, 0.7774719, 1, 1, 1, 1, 1,
0.7322979, 1.341781, -1.075373, 1, 1, 1, 1, 1,
0.7339783, -1.581572, 3.759709, 1, 1, 1, 1, 1,
0.7354629, -0.7527688, 2.833265, 1, 1, 1, 1, 1,
0.7401928, -0.5198954, 1.648788, 1, 1, 1, 1, 1,
0.742284, 2.109453, -0.4195201, 1, 1, 1, 1, 1,
0.7511116, -0.1333117, 3.547, 1, 1, 1, 1, 1,
0.7573073, 1.184209, 1.478639, 1, 1, 1, 1, 1,
0.7647564, 0.4746225, -0.4918892, 1, 1, 1, 1, 1,
0.7734929, -0.2710029, 1.067673, 1, 1, 1, 1, 1,
0.7752338, -1.505899, 2.916317, 1, 1, 1, 1, 1,
0.779606, 0.06082776, 1.318375, 1, 1, 1, 1, 1,
0.7805935, 1.488072, 0.2006935, 1, 1, 1, 1, 1,
0.7812164, -0.3559613, 0.7633612, 1, 1, 1, 1, 1,
0.7826034, -1.560505, 1.889251, 1, 1, 1, 1, 1,
0.7935864, 1.37624, -0.6867671, 0, 0, 1, 1, 1,
0.7957302, -1.566005, 2.003238, 1, 0, 0, 1, 1,
0.7992498, 1.32592, 0.7991461, 1, 0, 0, 1, 1,
0.8001575, 0.3607508, 0.2596323, 1, 0, 0, 1, 1,
0.8027585, 1.02712, 0.1823544, 1, 0, 0, 1, 1,
0.8042343, -0.6527315, 3.701324, 1, 0, 0, 1, 1,
0.8068118, 0.5641859, 1.445477, 0, 0, 0, 1, 1,
0.8130921, 0.8853036, 1.641457, 0, 0, 0, 1, 1,
0.8156545, -0.6055372, 1.910775, 0, 0, 0, 1, 1,
0.8209193, 1.052995, 0.7019011, 0, 0, 0, 1, 1,
0.8274156, -0.5614069, 1.215804, 0, 0, 0, 1, 1,
0.8351004, -2.112915, 1.102638, 0, 0, 0, 1, 1,
0.8361095, 0.8685688, -0.2648677, 0, 0, 0, 1, 1,
0.8428286, -0.7146393, 1.390296, 1, 1, 1, 1, 1,
0.8437846, -0.357369, 2.889322, 1, 1, 1, 1, 1,
0.8491113, -0.5871152, 2.396698, 1, 1, 1, 1, 1,
0.8507288, -1.412984, 4.727569, 1, 1, 1, 1, 1,
0.8513917, 0.6020742, 1.868866, 1, 1, 1, 1, 1,
0.8584065, -0.5600567, 1.390014, 1, 1, 1, 1, 1,
0.8651462, 0.6438645, -0.2672115, 1, 1, 1, 1, 1,
0.8673967, -0.06763212, 0.5950821, 1, 1, 1, 1, 1,
0.8684351, 0.2137074, 1.118462, 1, 1, 1, 1, 1,
0.8698189, -1.501855, 3.596203, 1, 1, 1, 1, 1,
0.8701304, -0.7694538, 1.766516, 1, 1, 1, 1, 1,
0.8746171, 1.25956, 0.0972418, 1, 1, 1, 1, 1,
0.8761411, -0.3228326, 0.9181348, 1, 1, 1, 1, 1,
0.8794234, -1.456151, 2.39244, 1, 1, 1, 1, 1,
0.8798531, -1.463648, 3.023442, 1, 1, 1, 1, 1,
0.8828773, 0.02761996, 1.346814, 0, 0, 1, 1, 1,
0.8831353, -1.549806, 2.996659, 1, 0, 0, 1, 1,
0.891, -1.109467, 2.580258, 1, 0, 0, 1, 1,
0.8912064, 1.021052, 0.8937009, 1, 0, 0, 1, 1,
0.9030041, 1.035831, 1.73411, 1, 0, 0, 1, 1,
0.9061034, -1.054179, 2.947174, 1, 0, 0, 1, 1,
0.9100276, -1.374435, 2.009421, 0, 0, 0, 1, 1,
0.9105945, -0.08212591, 1.037557, 0, 0, 0, 1, 1,
0.9149568, 0.09473347, 1.368666, 0, 0, 0, 1, 1,
0.9211842, 0.8008035, 0.7069648, 0, 0, 0, 1, 1,
0.9345852, 0.01167355, 1.138838, 0, 0, 0, 1, 1,
0.935028, -1.696821, 4.432231, 0, 0, 0, 1, 1,
0.9359692, 0.8753999, 1.2661, 0, 0, 0, 1, 1,
0.950766, 0.9190654, 1.820718, 1, 1, 1, 1, 1,
0.9519375, 0.7929804, -0.6861738, 1, 1, 1, 1, 1,
0.9528996, -1.133958, 3.079687, 1, 1, 1, 1, 1,
0.968402, 0.9548941, 1.037386, 1, 1, 1, 1, 1,
0.9685756, 1.182219, 2.631294, 1, 1, 1, 1, 1,
0.9736274, -0.6004158, 4.726428, 1, 1, 1, 1, 1,
0.9751984, -1.002716, 3.166331, 1, 1, 1, 1, 1,
0.9814825, 0.1710714, 0.8939729, 1, 1, 1, 1, 1,
0.9830526, 0.4053312, 1.923631, 1, 1, 1, 1, 1,
0.9856762, -0.3136966, 3.48306, 1, 1, 1, 1, 1,
0.9889212, 0.4794995, 2.231854, 1, 1, 1, 1, 1,
0.991132, 1.012578, 1.157179, 1, 1, 1, 1, 1,
0.9923537, 0.0009978565, 0.5422039, 1, 1, 1, 1, 1,
0.9947116, 2.094837, 1.100328, 1, 1, 1, 1, 1,
1.011755, 1.073263, 0.2761374, 1, 1, 1, 1, 1,
1.014384, 2.390072, 1.989025, 0, 0, 1, 1, 1,
1.014462, -0.2336167, -0.3174588, 1, 0, 0, 1, 1,
1.023419, -0.4093864, 0.3818833, 1, 0, 0, 1, 1,
1.028083, 1.530122, -0.4814933, 1, 0, 0, 1, 1,
1.031092, -0.4280755, 2.771944, 1, 0, 0, 1, 1,
1.03123, 0.6685826, 0.9789427, 1, 0, 0, 1, 1,
1.032303, -1.028417, 1.512527, 0, 0, 0, 1, 1,
1.034178, -0.6138032, 2.853256, 0, 0, 0, 1, 1,
1.037746, 0.307997, 0.4485534, 0, 0, 0, 1, 1,
1.049538, 0.9250135, 0.3492129, 0, 0, 0, 1, 1,
1.055333, -1.061291, 2.421971, 0, 0, 0, 1, 1,
1.056431, -1.634751, 2.354439, 0, 0, 0, 1, 1,
1.058151, -0.7042711, 2.546944, 0, 0, 0, 1, 1,
1.059532, -0.795599, 2.721781, 1, 1, 1, 1, 1,
1.060105, 0.1700577, 2.591094, 1, 1, 1, 1, 1,
1.061208, -0.1828227, 2.622598, 1, 1, 1, 1, 1,
1.064504, 0.6106601, 1.926165, 1, 1, 1, 1, 1,
1.068281, 0.576042, 1.696463, 1, 1, 1, 1, 1,
1.071812, -0.7309246, 3.526799, 1, 1, 1, 1, 1,
1.078192, 0.4249738, 0.9960256, 1, 1, 1, 1, 1,
1.081038, -2.113135, 1.933916, 1, 1, 1, 1, 1,
1.081984, -0.1296176, 2.286998, 1, 1, 1, 1, 1,
1.082435, -1.259122, 2.270988, 1, 1, 1, 1, 1,
1.088733, -0.02728934, 1.818614, 1, 1, 1, 1, 1,
1.090392, 0.1187229, 2.059531, 1, 1, 1, 1, 1,
1.097576, -1.060306, 3.281089, 1, 1, 1, 1, 1,
1.103894, -0.5931393, 2.52758, 1, 1, 1, 1, 1,
1.1049, -0.6217598, 3.64349, 1, 1, 1, 1, 1,
1.105745, -0.3710704, 2.085688, 0, 0, 1, 1, 1,
1.105809, 0.03932646, 0.9158629, 1, 0, 0, 1, 1,
1.107601, 1.354369, 0.2077716, 1, 0, 0, 1, 1,
1.109377, -1.033566, 3.805727, 1, 0, 0, 1, 1,
1.111135, -0.444992, 1.603488, 1, 0, 0, 1, 1,
1.111657, -1.066882, -0.5560221, 1, 0, 0, 1, 1,
1.116886, -0.003290112, 0.9464735, 0, 0, 0, 1, 1,
1.118575, -0.3341984, 1.063994, 0, 0, 0, 1, 1,
1.120649, 0.4440123, 1.242036, 0, 0, 0, 1, 1,
1.120769, -1.330108, 3.061663, 0, 0, 0, 1, 1,
1.120938, -0.5651193, 1.773229, 0, 0, 0, 1, 1,
1.123984, 0.7398629, 1.326361, 0, 0, 0, 1, 1,
1.125772, 1.800882, 1.913198, 0, 0, 0, 1, 1,
1.128183, 0.3994389, 1.420976, 1, 1, 1, 1, 1,
1.129603, 0.01146217, 0.6382518, 1, 1, 1, 1, 1,
1.131866, 1.646202, 0.1900523, 1, 1, 1, 1, 1,
1.148025, 1.334777, 0.6157248, 1, 1, 1, 1, 1,
1.14817, 2.008703, 1.449293, 1, 1, 1, 1, 1,
1.150593, -1.71524, 2.04411, 1, 1, 1, 1, 1,
1.157602, -1.259063, 1.208934, 1, 1, 1, 1, 1,
1.15785, -0.848392, 2.455885, 1, 1, 1, 1, 1,
1.160843, -0.3120899, 1.784947, 1, 1, 1, 1, 1,
1.16886, -0.5207016, 2.436035, 1, 1, 1, 1, 1,
1.16923, 1.530948, -0.4630944, 1, 1, 1, 1, 1,
1.171344, 0.5511708, 1.767283, 1, 1, 1, 1, 1,
1.171611, 0.01455192, 0.7084855, 1, 1, 1, 1, 1,
1.175648, 0.1823568, 0.9585879, 1, 1, 1, 1, 1,
1.180303, 0.6180298, 0.8717879, 1, 1, 1, 1, 1,
1.188577, 0.6787739, 2.258053, 0, 0, 1, 1, 1,
1.191596, -0.9103993, 1.718109, 1, 0, 0, 1, 1,
1.195103, 0.1648885, 2.466097, 1, 0, 0, 1, 1,
1.208537, 1.495875, 1.893135, 1, 0, 0, 1, 1,
1.211091, 0.4385538, 1.644959, 1, 0, 0, 1, 1,
1.212353, -1.224958, 2.716694, 1, 0, 0, 1, 1,
1.240569, -1.422752, 2.70179, 0, 0, 0, 1, 1,
1.25742, -0.06684782, 2.715142, 0, 0, 0, 1, 1,
1.267231, 1.119935, 2.167981, 0, 0, 0, 1, 1,
1.278774, 0.7588654, 0.1370544, 0, 0, 0, 1, 1,
1.280094, 0.3379951, 3.169656, 0, 0, 0, 1, 1,
1.283928, 0.5165824, 0.261214, 0, 0, 0, 1, 1,
1.287517, -0.898905, 1.815723, 0, 0, 0, 1, 1,
1.28771, -0.4154117, 1.693277, 1, 1, 1, 1, 1,
1.318497, -1.334128, 2.531795, 1, 1, 1, 1, 1,
1.319561, -2.487007, 2.893634, 1, 1, 1, 1, 1,
1.339547, 0.8921751, 2.372787, 1, 1, 1, 1, 1,
1.35405, -0.2268501, 2.970785, 1, 1, 1, 1, 1,
1.363092, 0.07240008, 1.062081, 1, 1, 1, 1, 1,
1.372791, 1.1383, -0.5125063, 1, 1, 1, 1, 1,
1.387629, 1.26763, -0.01167762, 1, 1, 1, 1, 1,
1.387723, -0.5813773, 3.031875, 1, 1, 1, 1, 1,
1.39636, 0.4144309, 2.210689, 1, 1, 1, 1, 1,
1.396381, -2.702247, 2.582355, 1, 1, 1, 1, 1,
1.40072, -1.168248, 1.436724, 1, 1, 1, 1, 1,
1.407118, -1.858566, 2.741498, 1, 1, 1, 1, 1,
1.415446, 0.4190603, 1.414627, 1, 1, 1, 1, 1,
1.420282, 1.590119, 1.569933, 1, 1, 1, 1, 1,
1.426822, -0.7261736, 1.669591, 0, 0, 1, 1, 1,
1.430982, -0.2537797, 0.1016722, 1, 0, 0, 1, 1,
1.442217, -0.6200265, 2.007098, 1, 0, 0, 1, 1,
1.46694, -0.7363837, 2.418244, 1, 0, 0, 1, 1,
1.468329, 2.352159, 1.284183, 1, 0, 0, 1, 1,
1.470751, 0.7306805, -0.04080087, 1, 0, 0, 1, 1,
1.471586, 0.7526038, 2.439466, 0, 0, 0, 1, 1,
1.489613, 0.8283358, 1.744781, 0, 0, 0, 1, 1,
1.494865, -0.7035311, 1.157753, 0, 0, 0, 1, 1,
1.4952, -0.7974913, 1.36568, 0, 0, 0, 1, 1,
1.502381, -0.8680747, 0.9866502, 0, 0, 0, 1, 1,
1.509046, 0.7518931, 1.798144, 0, 0, 0, 1, 1,
1.511858, -0.925141, 1.230468, 0, 0, 0, 1, 1,
1.514464, -0.219887, 2.785842, 1, 1, 1, 1, 1,
1.540537, 3.16845, -0.6818564, 1, 1, 1, 1, 1,
1.540835, -0.1307171, 0.2108637, 1, 1, 1, 1, 1,
1.553242, 0.1548817, 2.284598, 1, 1, 1, 1, 1,
1.556836, 0.7574767, 0.04487381, 1, 1, 1, 1, 1,
1.557097, 0.04966423, 3.419065, 1, 1, 1, 1, 1,
1.570354, -1.740661, 1.972656, 1, 1, 1, 1, 1,
1.574748, 1.941321, 1.434298, 1, 1, 1, 1, 1,
1.578119, -0.6745062, 0.7948613, 1, 1, 1, 1, 1,
1.578205, -0.1150361, 2.89815, 1, 1, 1, 1, 1,
1.58872, 1.298183, 1.644559, 1, 1, 1, 1, 1,
1.589299, 1.234393, 0.4700514, 1, 1, 1, 1, 1,
1.599011, 0.416471, 1.408753, 1, 1, 1, 1, 1,
1.607311, -0.01055035, 1.942888, 1, 1, 1, 1, 1,
1.617307, -0.0106514, 2.197316, 1, 1, 1, 1, 1,
1.622701, -1.746297, 0.249368, 0, 0, 1, 1, 1,
1.635739, 0.8996388, 0.932134, 1, 0, 0, 1, 1,
1.646118, 0.9291829, 0.8205584, 1, 0, 0, 1, 1,
1.65941, -0.2771726, 2.831429, 1, 0, 0, 1, 1,
1.660687, -0.5982638, 2.114698, 1, 0, 0, 1, 1,
1.669262, 0.536571, 0.6732289, 1, 0, 0, 1, 1,
1.676662, 2.381691, -1.031774, 0, 0, 0, 1, 1,
1.742972, -0.01683285, 4.404628, 0, 0, 0, 1, 1,
1.742996, -0.2905751, 1.198481, 0, 0, 0, 1, 1,
1.747665, -0.4293677, 1.986026, 0, 0, 0, 1, 1,
1.749757, 1.239174, -0.183817, 0, 0, 0, 1, 1,
1.762041, -0.607973, 1.140338, 0, 0, 0, 1, 1,
1.769452, -0.9508276, 1.551028, 0, 0, 0, 1, 1,
1.788109, -0.3725173, 0.5761157, 1, 1, 1, 1, 1,
1.806302, -1.480994, 3.33931, 1, 1, 1, 1, 1,
1.81432, -0.4292003, 2.073722, 1, 1, 1, 1, 1,
1.825319, 0.5627744, 1.35984, 1, 1, 1, 1, 1,
1.830835, -2.127513, 2.877095, 1, 1, 1, 1, 1,
1.834116, 0.7376416, 2.726457, 1, 1, 1, 1, 1,
1.834177, 0.07423874, 1.446233, 1, 1, 1, 1, 1,
1.873891, 0.3182722, 1.266145, 1, 1, 1, 1, 1,
1.927227, -0.83051, 3.017508, 1, 1, 1, 1, 1,
1.933328, 1.583015, 1.108981, 1, 1, 1, 1, 1,
1.945634, 1.526683, 0.7241201, 1, 1, 1, 1, 1,
1.972057, 0.9026878, 0.4841778, 1, 1, 1, 1, 1,
1.995908, -1.268137, 1.57992, 1, 1, 1, 1, 1,
2.003749, 1.03108, 2.14319, 1, 1, 1, 1, 1,
2.031203, -0.7942025, 0.7026384, 1, 1, 1, 1, 1,
2.110175, -0.03476711, 2.505709, 0, 0, 1, 1, 1,
2.218551, 0.9042189, 0.1096877, 1, 0, 0, 1, 1,
2.219049, 1.110798, 2.341948, 1, 0, 0, 1, 1,
2.248695, -0.07376115, 0.6611624, 1, 0, 0, 1, 1,
2.290428, -0.3501603, 2.964797, 1, 0, 0, 1, 1,
2.311624, -1.033897, -0.7436772, 1, 0, 0, 1, 1,
2.321425, -1.609822, 1.437996, 0, 0, 0, 1, 1,
2.336447, -0.4193241, 2.594167, 0, 0, 0, 1, 1,
2.338276, -0.9966252, 0.4863197, 0, 0, 0, 1, 1,
2.346362, 1.581946, 0.1144817, 0, 0, 0, 1, 1,
2.352927, 0.09959336, 0.8341246, 0, 0, 0, 1, 1,
2.406365, 1.966758, -0.0004436676, 0, 0, 0, 1, 1,
2.476176, 0.2649386, 1.411875, 0, 0, 0, 1, 1,
2.4838, -1.643337, 1.94635, 1, 1, 1, 1, 1,
2.624264, 0.5887324, 1.035491, 1, 1, 1, 1, 1,
2.726388, -0.5477788, 3.067684, 1, 1, 1, 1, 1,
2.765759, -1.678059, 1.792271, 1, 1, 1, 1, 1,
2.910279, 0.8211721, 1.313202, 1, 1, 1, 1, 1,
2.987673, 0.7138796, 2.249145, 1, 1, 1, 1, 1,
3.264711, -0.8065939, 1.206749, 1, 1, 1, 1, 1
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
var radius = 9.803415;
var distance = 34.43408;
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
mvMatrix.translate( 0.03679729, -0.223086, -0.07878399 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.43408);
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
