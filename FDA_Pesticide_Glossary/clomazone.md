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
-4.556852, -2.576684, -2.657994, 1, 0, 0, 1,
-3.221587, -0.1940782, 0.4723148, 1, 0.007843138, 0, 1,
-3.085021, -0.5736946, -0.1780541, 1, 0.01176471, 0, 1,
-2.769676, -0.1393565, -0.4959539, 1, 0.01960784, 0, 1,
-2.748765, -1.324148, -1.012295, 1, 0.02352941, 0, 1,
-2.669057, 0.6971654, -2.205353, 1, 0.03137255, 0, 1,
-2.520474, 1.524685, -0.7039541, 1, 0.03529412, 0, 1,
-2.471948, 0.5568624, -0.4806849, 1, 0.04313726, 0, 1,
-2.393406, 0.5040655, -3.458687, 1, 0.04705882, 0, 1,
-2.33466, -1.131611, -0.9589127, 1, 0.05490196, 0, 1,
-2.322547, -1.478275, -2.65596, 1, 0.05882353, 0, 1,
-2.281502, -0.5788209, -0.9967241, 1, 0.06666667, 0, 1,
-2.254004, -0.8186694, -2.758216, 1, 0.07058824, 0, 1,
-2.199269, -0.3121366, -1.59456, 1, 0.07843138, 0, 1,
-2.198077, 0.8887482, -0.4129426, 1, 0.08235294, 0, 1,
-2.182835, -0.7824877, -0.7122533, 1, 0.09019608, 0, 1,
-2.177109, -0.3359329, -0.91637, 1, 0.09411765, 0, 1,
-2.174905, -1.380248, -1.967554, 1, 0.1019608, 0, 1,
-2.163116, -0.1786525, -1.819368, 1, 0.1098039, 0, 1,
-2.143425, 0.7073681, -3.157717, 1, 0.1137255, 0, 1,
-2.10361, 0.4489766, -0.4717474, 1, 0.1215686, 0, 1,
-2.087997, 2.188238, -1.562891, 1, 0.1254902, 0, 1,
-2.066583, 0.9221207, -0.4825596, 1, 0.1333333, 0, 1,
-2.053928, 0.3919147, -1.674929, 1, 0.1372549, 0, 1,
-2.043946, 1.362823, -1.765216, 1, 0.145098, 0, 1,
-2.00416, 0.7768079, -1.245982, 1, 0.1490196, 0, 1,
-2.000082, -0.7233105, -2.516848, 1, 0.1568628, 0, 1,
-1.984013, 1.226873, 0.57486, 1, 0.1607843, 0, 1,
-1.980307, 0.3966338, -0.5165406, 1, 0.1686275, 0, 1,
-1.974703, 2.456182, 0.3128556, 1, 0.172549, 0, 1,
-1.967843, 0.132464, -1.25468, 1, 0.1803922, 0, 1,
-1.957158, -1.080707, -1.231416, 1, 0.1843137, 0, 1,
-1.894021, 0.4103004, -3.364612, 1, 0.1921569, 0, 1,
-1.891075, -1.176723, -2.353251, 1, 0.1960784, 0, 1,
-1.890072, -0.230122, -1.987611, 1, 0.2039216, 0, 1,
-1.874946, -1.29275, -0.924284, 1, 0.2117647, 0, 1,
-1.861182, 0.7672497, -2.336484, 1, 0.2156863, 0, 1,
-1.858216, 1.443414, -0.641572, 1, 0.2235294, 0, 1,
-1.847495, -1.311072, -3.42886, 1, 0.227451, 0, 1,
-1.835963, 0.8183078, -0.7448978, 1, 0.2352941, 0, 1,
-1.831615, -0.4179268, -2.279106, 1, 0.2392157, 0, 1,
-1.815881, 0.4892835, -1.801456, 1, 0.2470588, 0, 1,
-1.808903, 1.042792, -2.114475, 1, 0.2509804, 0, 1,
-1.797409, 0.2459259, -0.7754225, 1, 0.2588235, 0, 1,
-1.786008, -0.1868807, -2.777227, 1, 0.2627451, 0, 1,
-1.784649, 0.2082368, -1.566973, 1, 0.2705882, 0, 1,
-1.783899, 0.1227381, -1.008217, 1, 0.2745098, 0, 1,
-1.781542, -0.3239655, -1.783483, 1, 0.282353, 0, 1,
-1.775619, -0.5030763, -1.793777, 1, 0.2862745, 0, 1,
-1.773701, -2.395413, -2.250579, 1, 0.2941177, 0, 1,
-1.724102, -0.9439756, -3.093627, 1, 0.3019608, 0, 1,
-1.70814, 0.4332447, -1.278427, 1, 0.3058824, 0, 1,
-1.695761, -0.2990336, -3.504447, 1, 0.3137255, 0, 1,
-1.687123, 1.251719, -1.063446, 1, 0.3176471, 0, 1,
-1.671483, 0.6571271, -1.593086, 1, 0.3254902, 0, 1,
-1.667143, 1.585077, 0.6397154, 1, 0.3294118, 0, 1,
-1.652741, 1.143543, 0.3202065, 1, 0.3372549, 0, 1,
-1.64627, 1.252056, -3.052277, 1, 0.3411765, 0, 1,
-1.645495, 1.105415, -0.02762695, 1, 0.3490196, 0, 1,
-1.644725, -0.3831151, -0.09178773, 1, 0.3529412, 0, 1,
-1.631012, 1.026072, -1.14073, 1, 0.3607843, 0, 1,
-1.6282, -1.552737, -2.223942, 1, 0.3647059, 0, 1,
-1.607656, 0.2113572, -0.8518146, 1, 0.372549, 0, 1,
-1.605611, -0.05700754, -1.161179, 1, 0.3764706, 0, 1,
-1.594694, 0.8647839, -2.066658, 1, 0.3843137, 0, 1,
-1.586762, 0.0788952, -0.2964481, 1, 0.3882353, 0, 1,
-1.578348, -0.4807026, -0.9228985, 1, 0.3960784, 0, 1,
-1.574103, 0.1201883, -1.864969, 1, 0.4039216, 0, 1,
-1.573787, 1.147633, 0.1833342, 1, 0.4078431, 0, 1,
-1.564969, -1.506522, -0.5948697, 1, 0.4156863, 0, 1,
-1.55874, 1.01644, 1.115763, 1, 0.4196078, 0, 1,
-1.558035, -0.23901, -2.511424, 1, 0.427451, 0, 1,
-1.556706, -0.3166899, -1.37412, 1, 0.4313726, 0, 1,
-1.552884, -0.4944952, -2.452456, 1, 0.4392157, 0, 1,
-1.542887, -0.709797, -1.680415, 1, 0.4431373, 0, 1,
-1.541208, -1.071997, -3.047596, 1, 0.4509804, 0, 1,
-1.539235, -0.09101446, -2.51751, 1, 0.454902, 0, 1,
-1.530521, 0.7602797, -1.387279, 1, 0.4627451, 0, 1,
-1.527012, 1.078757, -1.248714, 1, 0.4666667, 0, 1,
-1.518547, 0.1293134, -1.204624, 1, 0.4745098, 0, 1,
-1.505402, -2.191705, -4.114429, 1, 0.4784314, 0, 1,
-1.505186, 2.149466, -0.3933666, 1, 0.4862745, 0, 1,
-1.502457, -0.7899222, -2.811081, 1, 0.4901961, 0, 1,
-1.484199, -0.7308757, -0.9057414, 1, 0.4980392, 0, 1,
-1.478587, -1.291553, -3.748207, 1, 0.5058824, 0, 1,
-1.477351, -0.9322928, -2.016878, 1, 0.509804, 0, 1,
-1.473144, -0.03510613, -2.776089, 1, 0.5176471, 0, 1,
-1.46239, 0.6104976, -3.883809, 1, 0.5215687, 0, 1,
-1.46002, 0.5883006, -1.811036, 1, 0.5294118, 0, 1,
-1.45768, 1.849073, -1.743603, 1, 0.5333334, 0, 1,
-1.455733, 0.04766659, -2.783126, 1, 0.5411765, 0, 1,
-1.453883, 1.738547, -1.961971, 1, 0.5450981, 0, 1,
-1.452539, 0.8563389, -0.7692568, 1, 0.5529412, 0, 1,
-1.446651, -0.4782762, -3.158893, 1, 0.5568628, 0, 1,
-1.439292, 1.074659, -2.35074, 1, 0.5647059, 0, 1,
-1.432164, 0.4583915, -1.580109, 1, 0.5686275, 0, 1,
-1.431182, 0.5408587, -1.839044, 1, 0.5764706, 0, 1,
-1.420249, -1.716041, -3.077322, 1, 0.5803922, 0, 1,
-1.417928, 1.007649, -0.0817547, 1, 0.5882353, 0, 1,
-1.416034, 0.6098306, -1.193488, 1, 0.5921569, 0, 1,
-1.409862, 0.9795091, -0.7197669, 1, 0.6, 0, 1,
-1.409213, 0.8116282, -1.476109, 1, 0.6078432, 0, 1,
-1.407181, 0.9518766, 0.4101008, 1, 0.6117647, 0, 1,
-1.397171, -1.142528, -1.867521, 1, 0.6196079, 0, 1,
-1.396467, -0.01289992, -1.131686, 1, 0.6235294, 0, 1,
-1.39348, 0.4284325, -0.6227646, 1, 0.6313726, 0, 1,
-1.3887, 1.615461, -0.1826534, 1, 0.6352941, 0, 1,
-1.387196, -0.2215238, -1.642305, 1, 0.6431373, 0, 1,
-1.360678, 0.5047103, -1.152145, 1, 0.6470588, 0, 1,
-1.354107, -1.180809, -2.336861, 1, 0.654902, 0, 1,
-1.338728, -0.3798676, -3.182707, 1, 0.6588235, 0, 1,
-1.333528, -0.4010012, -2.462949, 1, 0.6666667, 0, 1,
-1.327005, -1.449032, -2.629272, 1, 0.6705883, 0, 1,
-1.323026, -0.6152984, -1.618887, 1, 0.6784314, 0, 1,
-1.315841, 1.840046, -0.03507448, 1, 0.682353, 0, 1,
-1.311915, 0.4464628, -0.5801453, 1, 0.6901961, 0, 1,
-1.3092, -0.3420934, -3.356959, 1, 0.6941177, 0, 1,
-1.296768, -0.8199647, -2.015051, 1, 0.7019608, 0, 1,
-1.291419, 0.3112387, -2.371345, 1, 0.7098039, 0, 1,
-1.289993, -1.600412, -2.066647, 1, 0.7137255, 0, 1,
-1.286892, 0.9653702, 0.1010871, 1, 0.7215686, 0, 1,
-1.286297, -1.64836, -3.6167, 1, 0.7254902, 0, 1,
-1.283747, 0.4603532, -0.5664864, 1, 0.7333333, 0, 1,
-1.275027, -2.403593, -3.703619, 1, 0.7372549, 0, 1,
-1.274551, -1.102039, -4.254645, 1, 0.7450981, 0, 1,
-1.27441, 0.8333557, -1.386933, 1, 0.7490196, 0, 1,
-1.261093, 0.05867541, -1.005812, 1, 0.7568628, 0, 1,
-1.257347, -0.01208442, -0.8791148, 1, 0.7607843, 0, 1,
-1.256354, -1.524899, -2.771445, 1, 0.7686275, 0, 1,
-1.247966, -1.308318, -0.7883306, 1, 0.772549, 0, 1,
-1.247948, 1.61914, -1.692232, 1, 0.7803922, 0, 1,
-1.246353, -0.8761797, -2.536717, 1, 0.7843137, 0, 1,
-1.216502, -0.7409603, -1.433333, 1, 0.7921569, 0, 1,
-1.21603, -1.207796, -1.891066, 1, 0.7960784, 0, 1,
-1.215951, -0.2158111, -2.921546, 1, 0.8039216, 0, 1,
-1.213953, -1.611629, -2.999411, 1, 0.8117647, 0, 1,
-1.205621, 0.1115512, 0.2973295, 1, 0.8156863, 0, 1,
-1.204943, 0.4651214, -0.5970584, 1, 0.8235294, 0, 1,
-1.202355, 0.1656691, -0.3071455, 1, 0.827451, 0, 1,
-1.193864, 1.175782, -0.686776, 1, 0.8352941, 0, 1,
-1.193646, -1.305843, -2.274526, 1, 0.8392157, 0, 1,
-1.185477, 0.7708082, -1.900913, 1, 0.8470588, 0, 1,
-1.18362, -0.1241021, -1.887633, 1, 0.8509804, 0, 1,
-1.182456, 1.242105, -0.4729661, 1, 0.8588235, 0, 1,
-1.18193, 0.9349976, -2.031049, 1, 0.8627451, 0, 1,
-1.161936, -0.2885104, -4.015342, 1, 0.8705882, 0, 1,
-1.151876, -0.4764777, -1.415817, 1, 0.8745098, 0, 1,
-1.150697, -0.4748419, -2.176526, 1, 0.8823529, 0, 1,
-1.141672, 2.764198, 0.4785649, 1, 0.8862745, 0, 1,
-1.140475, -0.4527659, -2.857028, 1, 0.8941177, 0, 1,
-1.139134, 0.1217258, -1.95102, 1, 0.8980392, 0, 1,
-1.135311, -0.7020851, -3.182468, 1, 0.9058824, 0, 1,
-1.135163, -1.979966, -1.161605, 1, 0.9137255, 0, 1,
-1.131424, 1.011038, -0.4106369, 1, 0.9176471, 0, 1,
-1.128643, -1.620034, -2.081828, 1, 0.9254902, 0, 1,
-1.120768, 0.3547845, -1.342124, 1, 0.9294118, 0, 1,
-1.116822, 0.1125405, -2.373273, 1, 0.9372549, 0, 1,
-1.113534, -0.9454538, -2.48468, 1, 0.9411765, 0, 1,
-1.111393, 2.54628, -0.8194517, 1, 0.9490196, 0, 1,
-1.110642, 1.307656, -0.3764904, 1, 0.9529412, 0, 1,
-1.109333, -1.156267, -1.530602, 1, 0.9607843, 0, 1,
-1.106494, -1.457057, -1.034236, 1, 0.9647059, 0, 1,
-1.087321, -0.6304992, -1.206435, 1, 0.972549, 0, 1,
-1.083143, 0.4237567, -1.673025, 1, 0.9764706, 0, 1,
-1.078321, 0.3246239, -0.833325, 1, 0.9843137, 0, 1,
-1.068751, -0.01606011, -1.083769, 1, 0.9882353, 0, 1,
-1.068098, 1.152312, -3.171148, 1, 0.9960784, 0, 1,
-1.063458, -0.07611994, -2.96773, 0.9960784, 1, 0, 1,
-1.063119, 1.458152, -0.2922308, 0.9921569, 1, 0, 1,
-1.055328, -0.2049289, -2.277955, 0.9843137, 1, 0, 1,
-1.048028, 0.6844758, -0.30044, 0.9803922, 1, 0, 1,
-1.034026, 1.853794, -1.300092, 0.972549, 1, 0, 1,
-1.033607, -0.2907274, -2.008545, 0.9686275, 1, 0, 1,
-1.026322, 1.185711, -1.825191, 0.9607843, 1, 0, 1,
-1.023401, -1.287294, -1.222463, 0.9568627, 1, 0, 1,
-1.022422, 1.640024, -0.7698207, 0.9490196, 1, 0, 1,
-1.020105, 0.5985192, -0.8975723, 0.945098, 1, 0, 1,
-1.019723, -1.891688, -2.809364, 0.9372549, 1, 0, 1,
-1.017088, -0.8557931, -1.97345, 0.9333333, 1, 0, 1,
-0.9912055, -0.5926902, -2.321277, 0.9254902, 1, 0, 1,
-0.9908831, -0.01599958, -1.220037, 0.9215686, 1, 0, 1,
-0.9847298, -0.2372408, 0.3325821, 0.9137255, 1, 0, 1,
-0.9810103, -0.789367, -0.2852785, 0.9098039, 1, 0, 1,
-0.9806576, 0.5207559, 0.2781728, 0.9019608, 1, 0, 1,
-0.9803346, -2.086821, -3.523639, 0.8941177, 1, 0, 1,
-0.9751481, -0.008346833, -0.9659307, 0.8901961, 1, 0, 1,
-0.9720091, -1.291167, -1.666108, 0.8823529, 1, 0, 1,
-0.966228, -0.7188854, -2.566972, 0.8784314, 1, 0, 1,
-0.954034, -0.3566933, -2.609928, 0.8705882, 1, 0, 1,
-0.9391364, 0.05854896, -2.532693, 0.8666667, 1, 0, 1,
-0.9358295, 0.5488831, -2.258115, 0.8588235, 1, 0, 1,
-0.9318299, -0.3730146, -2.616936, 0.854902, 1, 0, 1,
-0.929903, 2.345089, 0.3810543, 0.8470588, 1, 0, 1,
-0.9294542, -0.978215, -2.638644, 0.8431373, 1, 0, 1,
-0.9290496, 0.8642228, -1.64979, 0.8352941, 1, 0, 1,
-0.9274242, -0.4864539, -3.668283, 0.8313726, 1, 0, 1,
-0.9272504, 0.2233327, -2.996779, 0.8235294, 1, 0, 1,
-0.9272131, -0.4320174, -2.029803, 0.8196079, 1, 0, 1,
-0.9180123, -1.787279, -1.172451, 0.8117647, 1, 0, 1,
-0.9170108, 0.5189527, -2.390122, 0.8078431, 1, 0, 1,
-0.9054665, -0.3886176, -0.3451501, 0.8, 1, 0, 1,
-0.8976046, 0.8060339, 0.1520428, 0.7921569, 1, 0, 1,
-0.8936034, 0.1682411, 0.4326535, 0.7882353, 1, 0, 1,
-0.8936023, 1.126271, -0.6735332, 0.7803922, 1, 0, 1,
-0.8870272, 0.8262785, -1.193753, 0.7764706, 1, 0, 1,
-0.884914, -0.6669058, -1.881647, 0.7686275, 1, 0, 1,
-0.8841884, 0.3500775, -0.902899, 0.7647059, 1, 0, 1,
-0.8772362, -0.4324375, -2.71252, 0.7568628, 1, 0, 1,
-0.8767627, -0.1328148, -2.471737, 0.7529412, 1, 0, 1,
-0.8714077, -1.34672, -2.27044, 0.7450981, 1, 0, 1,
-0.8686597, -2.053958, -2.312207, 0.7411765, 1, 0, 1,
-0.8677885, -0.8517993, -3.371375, 0.7333333, 1, 0, 1,
-0.866791, -0.2371035, -2.292929, 0.7294118, 1, 0, 1,
-0.8662722, -0.8613096, -2.271203, 0.7215686, 1, 0, 1,
-0.8547488, 0.5279172, -1.323937, 0.7176471, 1, 0, 1,
-0.8542292, -0.8472652, -3.007561, 0.7098039, 1, 0, 1,
-0.8529596, -0.7722391, -2.340596, 0.7058824, 1, 0, 1,
-0.8513913, -0.09471709, -1.516428, 0.6980392, 1, 0, 1,
-0.8491206, -0.4466227, -2.093064, 0.6901961, 1, 0, 1,
-0.8475571, -0.4788048, -0.7180508, 0.6862745, 1, 0, 1,
-0.847409, -1.208746, -3.308194, 0.6784314, 1, 0, 1,
-0.8470632, -3.554091, -2.677347, 0.6745098, 1, 0, 1,
-0.8467391, -0.3965986, 0.06026195, 0.6666667, 1, 0, 1,
-0.8454893, -0.02464627, -2.731519, 0.6627451, 1, 0, 1,
-0.834194, 0.7354041, -0.4296137, 0.654902, 1, 0, 1,
-0.8324904, -0.1126744, -1.758371, 0.6509804, 1, 0, 1,
-0.8264059, -0.7568998, -2.899635, 0.6431373, 1, 0, 1,
-0.8263137, -0.02579181, -1.824246, 0.6392157, 1, 0, 1,
-0.8250999, -0.6995469, -1.318479, 0.6313726, 1, 0, 1,
-0.8250404, 0.7258484, 0.2539596, 0.627451, 1, 0, 1,
-0.8226441, 0.4328361, -1.310423, 0.6196079, 1, 0, 1,
-0.8164035, 1.60293, 0.02089275, 0.6156863, 1, 0, 1,
-0.814769, -0.2382779, -0.169989, 0.6078432, 1, 0, 1,
-0.8125575, -1.37177, -2.98193, 0.6039216, 1, 0, 1,
-0.8110619, -1.664026, -1.423051, 0.5960785, 1, 0, 1,
-0.8071225, -1.416848, -2.161438, 0.5882353, 1, 0, 1,
-0.7979305, -0.03250042, 0.154074, 0.5843138, 1, 0, 1,
-0.7976902, -2.135522, -2.710649, 0.5764706, 1, 0, 1,
-0.7937498, -1.674684, -2.255419, 0.572549, 1, 0, 1,
-0.7932187, 1.057437, -1.227586, 0.5647059, 1, 0, 1,
-0.7907762, -1.472939, -3.37446, 0.5607843, 1, 0, 1,
-0.7878738, 1.710185, 0.8508231, 0.5529412, 1, 0, 1,
-0.7870023, -0.9490545, -3.050625, 0.5490196, 1, 0, 1,
-0.7813976, 1.014615, -0.8830145, 0.5411765, 1, 0, 1,
-0.7811734, -0.5561837, -2.662113, 0.5372549, 1, 0, 1,
-0.776993, -2.625033, -3.391346, 0.5294118, 1, 0, 1,
-0.7738837, -0.3265751, -2.678019, 0.5254902, 1, 0, 1,
-0.7695987, -0.2663791, -1.561969, 0.5176471, 1, 0, 1,
-0.768724, -0.0167491, -1.764083, 0.5137255, 1, 0, 1,
-0.7585332, 0.3528336, -0.8622342, 0.5058824, 1, 0, 1,
-0.7550237, 1.860354, -1.114601, 0.5019608, 1, 0, 1,
-0.7503839, 0.05606626, -2.297464, 0.4941176, 1, 0, 1,
-0.7497216, -0.1744162, 0.7658402, 0.4862745, 1, 0, 1,
-0.7476487, -0.5693436, -1.441127, 0.4823529, 1, 0, 1,
-0.7466846, -0.2452499, -2.335401, 0.4745098, 1, 0, 1,
-0.7463378, 0.9879946, -0.5896038, 0.4705882, 1, 0, 1,
-0.7451444, -0.7508447, -3.435181, 0.4627451, 1, 0, 1,
-0.736995, -1.058549, -3.989554, 0.4588235, 1, 0, 1,
-0.736414, -0.9515142, -2.328816, 0.4509804, 1, 0, 1,
-0.7352287, 1.757298, 0.165546, 0.4470588, 1, 0, 1,
-0.730526, -0.38479, -1.719125, 0.4392157, 1, 0, 1,
-0.71997, -0.8436551, -1.200196, 0.4352941, 1, 0, 1,
-0.7084739, 0.3789373, -2.283062, 0.427451, 1, 0, 1,
-0.7083606, 3.197125, 0.326176, 0.4235294, 1, 0, 1,
-0.7082767, 0.5009913, -2.006061, 0.4156863, 1, 0, 1,
-0.7074803, -0.4460783, 0.322219, 0.4117647, 1, 0, 1,
-0.7049026, 1.195572, -0.2646142, 0.4039216, 1, 0, 1,
-0.7047508, 0.3241199, -2.337036, 0.3960784, 1, 0, 1,
-0.7045269, -0.6661565, -3.501411, 0.3921569, 1, 0, 1,
-0.6954066, -0.8260292, -2.45331, 0.3843137, 1, 0, 1,
-0.6944512, -0.9579467, -1.356841, 0.3803922, 1, 0, 1,
-0.6903235, 0.157704, -2.950178, 0.372549, 1, 0, 1,
-0.682447, -0.1315393, -3.425225, 0.3686275, 1, 0, 1,
-0.6785209, -2.424563, -3.096319, 0.3607843, 1, 0, 1,
-0.6742179, -0.3982196, -3.081234, 0.3568628, 1, 0, 1,
-0.6741206, -0.6886686, -1.611478, 0.3490196, 1, 0, 1,
-0.6723037, -0.871756, -2.865323, 0.345098, 1, 0, 1,
-0.6705069, -1.192331, -3.236011, 0.3372549, 1, 0, 1,
-0.6681098, -0.3742044, 0.4612396, 0.3333333, 1, 0, 1,
-0.6657668, -2.293854, -2.965986, 0.3254902, 1, 0, 1,
-0.6617798, 0.106056, -1.751841, 0.3215686, 1, 0, 1,
-0.6612168, -0.6203635, -1.610901, 0.3137255, 1, 0, 1,
-0.6520205, -0.6368082, -2.045634, 0.3098039, 1, 0, 1,
-0.6502566, -1.203472, -0.9908025, 0.3019608, 1, 0, 1,
-0.6383915, 0.06741634, -2.072953, 0.2941177, 1, 0, 1,
-0.6340452, -0.2722558, -0.4336511, 0.2901961, 1, 0, 1,
-0.6314164, -0.5835364, -2.30022, 0.282353, 1, 0, 1,
-0.6283953, 0.2304346, -2.283978, 0.2784314, 1, 0, 1,
-0.62584, 1.324571, -0.3518346, 0.2705882, 1, 0, 1,
-0.6254085, 2.198165, -1.255589, 0.2666667, 1, 0, 1,
-0.6161573, 0.3148727, -1.478458, 0.2588235, 1, 0, 1,
-0.6159681, 0.5712675, -0.2526155, 0.254902, 1, 0, 1,
-0.6127242, 0.6663619, -0.3860792, 0.2470588, 1, 0, 1,
-0.6054476, -1.639615, -3.144037, 0.2431373, 1, 0, 1,
-0.600692, 1.72839, -1.95928, 0.2352941, 1, 0, 1,
-0.5997482, 0.9055959, -0.4170825, 0.2313726, 1, 0, 1,
-0.5959835, 1.109431, -2.088806, 0.2235294, 1, 0, 1,
-0.5958258, 1.599926, -0.4101199, 0.2196078, 1, 0, 1,
-0.5933424, 0.3418095, -1.623681, 0.2117647, 1, 0, 1,
-0.5887045, 1.215235, 0.1706282, 0.2078431, 1, 0, 1,
-0.5800026, 1.548164, -0.7174376, 0.2, 1, 0, 1,
-0.5794568, -0.1465976, -2.161768, 0.1921569, 1, 0, 1,
-0.5764412, 0.6717791, -0.6013091, 0.1882353, 1, 0, 1,
-0.5750971, 1.521697, -0.1801743, 0.1803922, 1, 0, 1,
-0.573654, -0.5893126, -2.592274, 0.1764706, 1, 0, 1,
-0.5680117, -1.098729, -3.164144, 0.1686275, 1, 0, 1,
-0.5661433, -2.04469, -3.170249, 0.1647059, 1, 0, 1,
-0.565781, -0.4682436, -1.512745, 0.1568628, 1, 0, 1,
-0.5591542, -0.6529317, -2.732386, 0.1529412, 1, 0, 1,
-0.5509276, -0.2640371, -1.59355, 0.145098, 1, 0, 1,
-0.5471544, 0.2874821, -2.411713, 0.1411765, 1, 0, 1,
-0.5447828, 1.083862, -0.8264927, 0.1333333, 1, 0, 1,
-0.537021, 0.1359686, -2.483284, 0.1294118, 1, 0, 1,
-0.5364535, 0.916835, -0.8451515, 0.1215686, 1, 0, 1,
-0.5287802, -0.2467877, -1.632651, 0.1176471, 1, 0, 1,
-0.5267655, -1.344328, -3.849279, 0.1098039, 1, 0, 1,
-0.5257142, 1.057085, -0.5571828, 0.1058824, 1, 0, 1,
-0.5250044, -2.48928, -1.759609, 0.09803922, 1, 0, 1,
-0.5220006, 1.226496, -2.477057, 0.09019608, 1, 0, 1,
-0.5202103, 0.4556433, -0.5771382, 0.08627451, 1, 0, 1,
-0.5190942, 0.960682, -1.225229, 0.07843138, 1, 0, 1,
-0.5168663, -1.009633, -1.654346, 0.07450981, 1, 0, 1,
-0.5126297, -0.08039838, -0.8281043, 0.06666667, 1, 0, 1,
-0.5101666, 0.6375175, -1.023184, 0.0627451, 1, 0, 1,
-0.5092266, 1.835493, 0.7451913, 0.05490196, 1, 0, 1,
-0.5061279, -1.5841, -1.989022, 0.05098039, 1, 0, 1,
-0.5029564, -1.619728, -3.252651, 0.04313726, 1, 0, 1,
-0.4949797, -0.9439719, -2.530244, 0.03921569, 1, 0, 1,
-0.4939083, -0.8111602, -3.423264, 0.03137255, 1, 0, 1,
-0.4935943, -0.6364043, -3.870497, 0.02745098, 1, 0, 1,
-0.4888054, 0.0520673, -1.893584, 0.01960784, 1, 0, 1,
-0.487337, 0.2977203, -1.35899, 0.01568628, 1, 0, 1,
-0.4822665, 0.4881799, -0.9125791, 0.007843138, 1, 0, 1,
-0.4810839, -0.3125052, -2.679784, 0.003921569, 1, 0, 1,
-0.4771902, 1.571869, 1.424059, 0, 1, 0.003921569, 1,
-0.4753425, 0.4469365, -0.5184302, 0, 1, 0.01176471, 1,
-0.4737777, 0.7760307, -0.4417369, 0, 1, 0.01568628, 1,
-0.4594075, 0.04508395, -1.194927, 0, 1, 0.02352941, 1,
-0.4575285, -0.7489896, -2.736073, 0, 1, 0.02745098, 1,
-0.4559616, 0.7635091, -1.581856, 0, 1, 0.03529412, 1,
-0.4532169, 0.8734601, -0.3427215, 0, 1, 0.03921569, 1,
-0.4499323, -1.491858, -2.274595, 0, 1, 0.04705882, 1,
-0.442443, 1.601242, -0.5321681, 0, 1, 0.05098039, 1,
-0.4421995, 0.7292877, -0.6558088, 0, 1, 0.05882353, 1,
-0.4411199, -1.63454, -3.030038, 0, 1, 0.0627451, 1,
-0.440317, -0.3074652, -2.12314, 0, 1, 0.07058824, 1,
-0.4375364, -0.5939317, -1.175977, 0, 1, 0.07450981, 1,
-0.4322068, 0.893357, 1.0064, 0, 1, 0.08235294, 1,
-0.4293498, 0.5909319, -0.1351138, 0, 1, 0.08627451, 1,
-0.4239869, 0.9514985, -0.8465869, 0, 1, 0.09411765, 1,
-0.4232646, 1.074992, -1.412809, 0, 1, 0.1019608, 1,
-0.4217319, 0.4706796, -1.671907, 0, 1, 0.1058824, 1,
-0.4200078, -1.374587, -2.601686, 0, 1, 0.1137255, 1,
-0.4141623, 0.9822043, -0.4785129, 0, 1, 0.1176471, 1,
-0.4122553, 0.5428661, -2.237341, 0, 1, 0.1254902, 1,
-0.4072523, 0.2049878, -1.017897, 0, 1, 0.1294118, 1,
-0.4065009, -0.09865498, -2.662879, 0, 1, 0.1372549, 1,
-0.4060331, 0.674997, -3.057748, 0, 1, 0.1411765, 1,
-0.4032218, 1.000288, -1.455179, 0, 1, 0.1490196, 1,
-0.3974031, -0.3864506, -2.04539, 0, 1, 0.1529412, 1,
-0.3954698, -2.536568, -3.355612, 0, 1, 0.1607843, 1,
-0.3933359, 0.4567038, -0.568584, 0, 1, 0.1647059, 1,
-0.3929136, -0.677138, -2.425663, 0, 1, 0.172549, 1,
-0.3926737, 0.8188959, 0.8207631, 0, 1, 0.1764706, 1,
-0.3922079, 1.355175, 1.582708, 0, 1, 0.1843137, 1,
-0.38752, 0.04569, -2.645241, 0, 1, 0.1882353, 1,
-0.3857707, 1.273194, 1.225831, 0, 1, 0.1960784, 1,
-0.3825856, -1.58708, -3.214962, 0, 1, 0.2039216, 1,
-0.3816474, 1.714497, 1.338228, 0, 1, 0.2078431, 1,
-0.3794153, -1.082398, -4.317832, 0, 1, 0.2156863, 1,
-0.3767802, -1.149369, -2.931077, 0, 1, 0.2196078, 1,
-0.37636, -0.3395625, -2.181704, 0, 1, 0.227451, 1,
-0.3729569, 0.6036897, -2.885398, 0, 1, 0.2313726, 1,
-0.3698615, 0.6796903, -1.059795, 0, 1, 0.2392157, 1,
-0.3694771, -0.7334296, -2.648059, 0, 1, 0.2431373, 1,
-0.3688913, 0.04755391, -1.265667, 0, 1, 0.2509804, 1,
-0.3682828, -0.7273331, -3.916692, 0, 1, 0.254902, 1,
-0.3645197, 0.05042071, -2.594891, 0, 1, 0.2627451, 1,
-0.3633244, 1.398278, 0.9802623, 0, 1, 0.2666667, 1,
-0.360161, 0.5655791, -0.2848144, 0, 1, 0.2745098, 1,
-0.3541918, -0.1938965, -2.487647, 0, 1, 0.2784314, 1,
-0.3541169, -0.9610808, -1.577356, 0, 1, 0.2862745, 1,
-0.3498326, 0.5766305, 1.681827, 0, 1, 0.2901961, 1,
-0.346017, 1.537067, -0.6383001, 0, 1, 0.2980392, 1,
-0.33066, 0.9754069, -0.2182913, 0, 1, 0.3058824, 1,
-0.3273706, 1.272583, 0.881482, 0, 1, 0.3098039, 1,
-0.3240556, 1.384888, -0.07845824, 0, 1, 0.3176471, 1,
-0.321191, -0.100342, -3.308302, 0, 1, 0.3215686, 1,
-0.3197541, 1.239049, -1.525925, 0, 1, 0.3294118, 1,
-0.3175762, -1.513359, -2.474247, 0, 1, 0.3333333, 1,
-0.307469, 0.2008595, -0.7682633, 0, 1, 0.3411765, 1,
-0.306361, -1.618534, -2.816054, 0, 1, 0.345098, 1,
-0.306326, -0.953338, -2.909338, 0, 1, 0.3529412, 1,
-0.3060122, -1.035287, -4.231098, 0, 1, 0.3568628, 1,
-0.3052391, -0.9673406, -3.358896, 0, 1, 0.3647059, 1,
-0.3023663, 0.7563672, 0.4451655, 0, 1, 0.3686275, 1,
-0.3001878, -0.3696205, -1.671115, 0, 1, 0.3764706, 1,
-0.297155, -1.349029, -3.296178, 0, 1, 0.3803922, 1,
-0.2962784, 0.1446848, -0.6989623, 0, 1, 0.3882353, 1,
-0.2962001, -0.01737675, -0.7150812, 0, 1, 0.3921569, 1,
-0.294952, 0.2368969, -0.7765821, 0, 1, 0.4, 1,
-0.2935013, 0.8294532, 1.238132, 0, 1, 0.4078431, 1,
-0.2915217, 0.1527615, -0.4038661, 0, 1, 0.4117647, 1,
-0.2853485, -0.4548745, -2.580665, 0, 1, 0.4196078, 1,
-0.2852845, 0.2245664, -0.24401, 0, 1, 0.4235294, 1,
-0.2731667, 1.621637, 0.3618584, 0, 1, 0.4313726, 1,
-0.2727517, -0.7634273, -4.353407, 0, 1, 0.4352941, 1,
-0.2702932, -0.6558759, -3.402371, 0, 1, 0.4431373, 1,
-0.269897, -0.2600758, -2.624152, 0, 1, 0.4470588, 1,
-0.267088, -0.7589937, -3.669422, 0, 1, 0.454902, 1,
-0.2662773, -0.3388938, -2.053026, 0, 1, 0.4588235, 1,
-0.2646357, 0.9395441, 0.523553, 0, 1, 0.4666667, 1,
-0.2624886, -0.1975026, -1.457827, 0, 1, 0.4705882, 1,
-0.262279, 0.3689029, -2.104179, 0, 1, 0.4784314, 1,
-0.2604782, 0.02808247, -1.846974, 0, 1, 0.4823529, 1,
-0.2574737, -1.822724, -3.069241, 0, 1, 0.4901961, 1,
-0.2573864, 0.5838376, -1.896405, 0, 1, 0.4941176, 1,
-0.2556152, -0.3019329, -2.713607, 0, 1, 0.5019608, 1,
-0.2527248, -1.949844, -3.514821, 0, 1, 0.509804, 1,
-0.2424591, 1.40377, 0.6396496, 0, 1, 0.5137255, 1,
-0.2386321, -1.274319, -4.197486, 0, 1, 0.5215687, 1,
-0.2358513, 1.24803, 0.06549583, 0, 1, 0.5254902, 1,
-0.2321589, -1.153425, -1.536069, 0, 1, 0.5333334, 1,
-0.2298514, -2.467366, -4.106235, 0, 1, 0.5372549, 1,
-0.2278646, 0.03792729, -1.487059, 0, 1, 0.5450981, 1,
-0.2266853, -0.04664523, -2.694972, 0, 1, 0.5490196, 1,
-0.2259413, 1.163496, -0.9907895, 0, 1, 0.5568628, 1,
-0.2246725, -1.170121, -3.029332, 0, 1, 0.5607843, 1,
-0.2227274, -1.289336, -2.453063, 0, 1, 0.5686275, 1,
-0.2185882, -0.07506421, -3.766414, 0, 1, 0.572549, 1,
-0.210703, 0.4549229, -1.40952, 0, 1, 0.5803922, 1,
-0.2100549, 0.5285889, -1.113474, 0, 1, 0.5843138, 1,
-0.2054792, 0.1396764, -1.245446, 0, 1, 0.5921569, 1,
-0.2010626, -0.6840649, -1.756864, 0, 1, 0.5960785, 1,
-0.2004852, 0.3234468, -0.02477445, 0, 1, 0.6039216, 1,
-0.1976005, 1.279622, -0.1570989, 0, 1, 0.6117647, 1,
-0.1929705, 0.06368479, -3.768399, 0, 1, 0.6156863, 1,
-0.1914998, 2.060123, -0.1295918, 0, 1, 0.6235294, 1,
-0.1894817, -0.07370797, -1.645838, 0, 1, 0.627451, 1,
-0.186681, 0.02474492, -0.51257, 0, 1, 0.6352941, 1,
-0.1837764, -0.7863361, -4.549348, 0, 1, 0.6392157, 1,
-0.1808451, 0.8872336, -1.090475, 0, 1, 0.6470588, 1,
-0.1768987, 0.1244669, -0.5146428, 0, 1, 0.6509804, 1,
-0.1765133, 0.5538199, -0.7495275, 0, 1, 0.6588235, 1,
-0.1742358, 1.175604, -0.7773221, 0, 1, 0.6627451, 1,
-0.1733917, -1.901536, -2.481792, 0, 1, 0.6705883, 1,
-0.1701105, -0.8751106, -4.34596, 0, 1, 0.6745098, 1,
-0.1643688, -0.6880141, -2.933711, 0, 1, 0.682353, 1,
-0.1631843, -0.2953584, -3.979017, 0, 1, 0.6862745, 1,
-0.1622861, -2.237102, -4.571569, 0, 1, 0.6941177, 1,
-0.1609557, 0.1545775, -1.792738, 0, 1, 0.7019608, 1,
-0.1569231, -0.1339968, -3.817698, 0, 1, 0.7058824, 1,
-0.1508981, 1.566867, -0.2900761, 0, 1, 0.7137255, 1,
-0.1506213, -1.617362, -5.404192, 0, 1, 0.7176471, 1,
-0.1470221, 2.515003, -0.05833249, 0, 1, 0.7254902, 1,
-0.1450716, 2.435516, -1.740448, 0, 1, 0.7294118, 1,
-0.1425048, -1.253246, -4.313057, 0, 1, 0.7372549, 1,
-0.140386, 1.920635, 0.9407229, 0, 1, 0.7411765, 1,
-0.1401831, -2.258275, -2.916549, 0, 1, 0.7490196, 1,
-0.1334153, 0.3789169, -0.1103356, 0, 1, 0.7529412, 1,
-0.1305, 0.4819296, 0.2169536, 0, 1, 0.7607843, 1,
-0.1300308, 0.3374432, -1.438588, 0, 1, 0.7647059, 1,
-0.1271734, 0.3807225, 0.8397498, 0, 1, 0.772549, 1,
-0.1166987, 0.6842946, -0.4329087, 0, 1, 0.7764706, 1,
-0.1144584, 0.3446383, -1.065788, 0, 1, 0.7843137, 1,
-0.1107424, -0.9301185, -3.638641, 0, 1, 0.7882353, 1,
-0.1098372, 1.590811, -1.214307, 0, 1, 0.7960784, 1,
-0.10965, 1.139789, -0.5986892, 0, 1, 0.8039216, 1,
-0.1061831, -2.322116, -2.055201, 0, 1, 0.8078431, 1,
-0.1061324, 1.256673, 0.7954372, 0, 1, 0.8156863, 1,
-0.1044521, -0.7059307, -3.484261, 0, 1, 0.8196079, 1,
-0.1036828, 1.050709, -1.220351, 0, 1, 0.827451, 1,
-0.09972399, -0.4633894, -2.246266, 0, 1, 0.8313726, 1,
-0.08505508, 2.773442, -0.9495618, 0, 1, 0.8392157, 1,
-0.08341108, 0.6156007, 0.5829648, 0, 1, 0.8431373, 1,
-0.07971332, -0.9480682, -1.530174, 0, 1, 0.8509804, 1,
-0.07924481, -2.718938, -2.552826, 0, 1, 0.854902, 1,
-0.07888905, 1.488127, -0.1316068, 0, 1, 0.8627451, 1,
-0.07476573, -0.04657147, -2.66091, 0, 1, 0.8666667, 1,
-0.07393587, 0.3824298, 0.3504041, 0, 1, 0.8745098, 1,
-0.07179927, -0.625845, -0.769502, 0, 1, 0.8784314, 1,
-0.06802993, 0.290616, -0.2252385, 0, 1, 0.8862745, 1,
-0.06179253, -0.404779, -2.219436, 0, 1, 0.8901961, 1,
-0.05527719, -0.0748388, -1.39877, 0, 1, 0.8980392, 1,
-0.04573463, -1.53212, -4.40937, 0, 1, 0.9058824, 1,
-0.04510465, -0.2547354, -3.234651, 0, 1, 0.9098039, 1,
-0.03746929, 0.1546084, -0.6430387, 0, 1, 0.9176471, 1,
-0.03716422, -1.711502, -3.441438, 0, 1, 0.9215686, 1,
-0.0363524, 0.2017486, -0.9937901, 0, 1, 0.9294118, 1,
-0.02544452, 1.551464, 0.2408764, 0, 1, 0.9333333, 1,
-0.02361833, -1.323314, -3.417342, 0, 1, 0.9411765, 1,
-0.01638108, 0.7154371, -0.7941455, 0, 1, 0.945098, 1,
-0.01248127, 0.9331214, 0.01079688, 0, 1, 0.9529412, 1,
-0.009998375, 0.4832284, 0.81332, 0, 1, 0.9568627, 1,
-0.005364495, -0.8143458, -3.378689, 0, 1, 0.9647059, 1,
-0.004685688, -0.4292171, -3.478589, 0, 1, 0.9686275, 1,
-0.004091248, -0.5840475, -5.075492, 0, 1, 0.9764706, 1,
-0.00236278, 1.236814, -1.039286, 0, 1, 0.9803922, 1,
-0.0006945354, 1.225011, -0.6501127, 0, 1, 0.9882353, 1,
0.003696724, 2.172587, -0.6609101, 0, 1, 0.9921569, 1,
0.01244548, -0.4547411, 3.532592, 0, 1, 1, 1,
0.01447019, 1.35948, 0.6780372, 0, 0.9921569, 1, 1,
0.0164482, -1.815516, 2.567287, 0, 0.9882353, 1, 1,
0.0189653, -1.554423, 2.702893, 0, 0.9803922, 1, 1,
0.01941714, -1.863648, 3.320081, 0, 0.9764706, 1, 1,
0.01941923, -1.323411, 2.541382, 0, 0.9686275, 1, 1,
0.02263573, -0.4320249, 2.081335, 0, 0.9647059, 1, 1,
0.02959467, 1.831324, 0.4764637, 0, 0.9568627, 1, 1,
0.03068092, -0.4040229, 1.976751, 0, 0.9529412, 1, 1,
0.03108683, -0.7399763, 4.679701, 0, 0.945098, 1, 1,
0.03148579, -0.1607054, 3.607184, 0, 0.9411765, 1, 1,
0.03245448, 0.02472603, 3.514321, 0, 0.9333333, 1, 1,
0.03355645, -0.6656033, 3.953848, 0, 0.9294118, 1, 1,
0.03411539, -0.6427166, 2.881535, 0, 0.9215686, 1, 1,
0.03823316, -0.30812, 2.339043, 0, 0.9176471, 1, 1,
0.03831363, 1.190121, 0.01819433, 0, 0.9098039, 1, 1,
0.0396942, 1.059535, -0.4061145, 0, 0.9058824, 1, 1,
0.04476767, -0.4584428, 2.449174, 0, 0.8980392, 1, 1,
0.04608963, 1.183886, -0.9924522, 0, 0.8901961, 1, 1,
0.04674113, 1.075417, 0.6645029, 0, 0.8862745, 1, 1,
0.04772198, 0.3884132, -1.169741, 0, 0.8784314, 1, 1,
0.04926848, 0.2043541, -0.1842256, 0, 0.8745098, 1, 1,
0.05009915, 0.8161606, -0.6015739, 0, 0.8666667, 1, 1,
0.05201796, 0.3331133, -0.5581053, 0, 0.8627451, 1, 1,
0.05259559, -0.2970489, 4.005201, 0, 0.854902, 1, 1,
0.05324779, 0.8475275, -0.2341225, 0, 0.8509804, 1, 1,
0.0533627, -1.240546, 1.908205, 0, 0.8431373, 1, 1,
0.05367214, -0.5585383, 2.944225, 0, 0.8392157, 1, 1,
0.05841045, 0.8559771, -0.4272721, 0, 0.8313726, 1, 1,
0.05865446, 0.5244719, -0.195581, 0, 0.827451, 1, 1,
0.06418956, -1.786816, 3.595232, 0, 0.8196079, 1, 1,
0.06647237, 0.3976455, 0.6042087, 0, 0.8156863, 1, 1,
0.0689592, -0.3703463, 3.616816, 0, 0.8078431, 1, 1,
0.07116637, -0.535637, 4.180031, 0, 0.8039216, 1, 1,
0.07333558, -0.02793067, 2.295482, 0, 0.7960784, 1, 1,
0.07648631, 0.4618754, 0.4931338, 0, 0.7882353, 1, 1,
0.0768472, -0.2442236, 2.933947, 0, 0.7843137, 1, 1,
0.0773288, -0.4001162, 2.862943, 0, 0.7764706, 1, 1,
0.0784944, 0.6969969, 0.2686317, 0, 0.772549, 1, 1,
0.07936464, 0.2669013, 0.1189891, 0, 0.7647059, 1, 1,
0.07975808, -1.423229, 3.550822, 0, 0.7607843, 1, 1,
0.08199541, -0.3908393, 3.493062, 0, 0.7529412, 1, 1,
0.08242016, 0.3355588, 0.01068496, 0, 0.7490196, 1, 1,
0.08267758, 0.0119856, 2.161561, 0, 0.7411765, 1, 1,
0.09043825, -1.810387, 3.031741, 0, 0.7372549, 1, 1,
0.09133977, -0.4882132, 3.465515, 0, 0.7294118, 1, 1,
0.09208147, 0.006630071, -0.05166509, 0, 0.7254902, 1, 1,
0.09287158, 0.7475049, 1.744758, 0, 0.7176471, 1, 1,
0.09844858, 0.551573, 0.1511958, 0, 0.7137255, 1, 1,
0.1004813, -2.309327, 3.911017, 0, 0.7058824, 1, 1,
0.1101682, 1.030172, 1.191327, 0, 0.6980392, 1, 1,
0.1131119, 0.8364053, 0.6080239, 0, 0.6941177, 1, 1,
0.1160309, 0.7905141, -0.5993443, 0, 0.6862745, 1, 1,
0.1180873, 2.664305, 0.4788693, 0, 0.682353, 1, 1,
0.1200946, 1.515635, 0.1477322, 0, 0.6745098, 1, 1,
0.1215656, -0.2032606, 4.035774, 0, 0.6705883, 1, 1,
0.1215993, -1.033419, 1.351333, 0, 0.6627451, 1, 1,
0.1216604, 0.3119071, 2.230988, 0, 0.6588235, 1, 1,
0.1249879, -1.389982, 3.056405, 0, 0.6509804, 1, 1,
0.1331803, 0.383721, -0.6479474, 0, 0.6470588, 1, 1,
0.1366986, 0.7130641, -0.106346, 0, 0.6392157, 1, 1,
0.1371495, 0.1686621, 1.250671, 0, 0.6352941, 1, 1,
0.1399924, 0.0490959, 3.480839, 0, 0.627451, 1, 1,
0.1413186, 0.2735476, 0.708699, 0, 0.6235294, 1, 1,
0.1413943, -0.1970642, 3.247645, 0, 0.6156863, 1, 1,
0.141621, -0.7783474, 2.589775, 0, 0.6117647, 1, 1,
0.1426591, -0.7678462, 2.529133, 0, 0.6039216, 1, 1,
0.1433117, 0.3586906, 0.2002983, 0, 0.5960785, 1, 1,
0.1496824, -0.1489792, 2.774544, 0, 0.5921569, 1, 1,
0.1559685, -1.183027, 2.478499, 0, 0.5843138, 1, 1,
0.1615959, -0.7844287, 3.47438, 0, 0.5803922, 1, 1,
0.1616238, -1.184636, 2.508453, 0, 0.572549, 1, 1,
0.1672605, 1.720467, -0.1457705, 0, 0.5686275, 1, 1,
0.1702338, -0.5440711, 4.851943, 0, 0.5607843, 1, 1,
0.172895, -0.7650527, 4.414669, 0, 0.5568628, 1, 1,
0.1774699, 0.5472457, -0.2892576, 0, 0.5490196, 1, 1,
0.1794959, -0.5424687, 1.660968, 0, 0.5450981, 1, 1,
0.1820773, 0.8546384, 0.6649762, 0, 0.5372549, 1, 1,
0.1882813, 0.151566, 1.211408, 0, 0.5333334, 1, 1,
0.1894939, 0.4086336, -0.1443884, 0, 0.5254902, 1, 1,
0.1908269, 1.137318, 0.611953, 0, 0.5215687, 1, 1,
0.1932137, -0.691134, 4.614695, 0, 0.5137255, 1, 1,
0.194234, -1.170526, 2.874437, 0, 0.509804, 1, 1,
0.2057595, 0.8130706, 2.24754, 0, 0.5019608, 1, 1,
0.2087553, -1.191846, 1.621307, 0, 0.4941176, 1, 1,
0.220929, 0.2466907, 1.455649, 0, 0.4901961, 1, 1,
0.2236055, 0.7140363, 0.2663867, 0, 0.4823529, 1, 1,
0.2252146, 0.2195582, -0.2637413, 0, 0.4784314, 1, 1,
0.225702, 0.6435435, -0.5321196, 0, 0.4705882, 1, 1,
0.2267118, -1.137631, 2.58223, 0, 0.4666667, 1, 1,
0.2298593, 0.2447119, -0.04445773, 0, 0.4588235, 1, 1,
0.2334808, 0.1627004, 1.069103, 0, 0.454902, 1, 1,
0.234121, -0.2291138, 2.617404, 0, 0.4470588, 1, 1,
0.2368952, 0.02684965, 0.1625101, 0, 0.4431373, 1, 1,
0.2391281, -0.5760362, 2.994656, 0, 0.4352941, 1, 1,
0.2392327, -0.2193117, 2.990399, 0, 0.4313726, 1, 1,
0.24151, -1.207255, 3.981005, 0, 0.4235294, 1, 1,
0.2434008, 0.1970094, 1.871489, 0, 0.4196078, 1, 1,
0.2475236, 0.7331298, -0.2888569, 0, 0.4117647, 1, 1,
0.2479288, 0.2807326, 1.173436, 0, 0.4078431, 1, 1,
0.2493009, -0.8211357, 3.614132, 0, 0.4, 1, 1,
0.2518975, 0.4531694, 0.7671149, 0, 0.3921569, 1, 1,
0.2603808, 0.402108, 0.334254, 0, 0.3882353, 1, 1,
0.2625075, 0.652408, 1.703559, 0, 0.3803922, 1, 1,
0.2659886, 0.07425913, 1.007535, 0, 0.3764706, 1, 1,
0.2667278, -1.150142, 2.218995, 0, 0.3686275, 1, 1,
0.26779, 0.7046447, -0.2350485, 0, 0.3647059, 1, 1,
0.2732369, -0.2310576, 3.217086, 0, 0.3568628, 1, 1,
0.2745612, 1.513249, 0.3305314, 0, 0.3529412, 1, 1,
0.2777801, -0.60898, 3.835768, 0, 0.345098, 1, 1,
0.2802641, 0.8882434, 2.366158, 0, 0.3411765, 1, 1,
0.2821064, 0.2780322, 1.305532, 0, 0.3333333, 1, 1,
0.2838325, -0.2125273, 0.1998151, 0, 0.3294118, 1, 1,
0.2866832, 0.8072895, -1.021095, 0, 0.3215686, 1, 1,
0.2885283, -0.2646306, 2.005815, 0, 0.3176471, 1, 1,
0.2894956, -0.09647534, 1.709022, 0, 0.3098039, 1, 1,
0.2941779, 0.5069306, 0.1060121, 0, 0.3058824, 1, 1,
0.2947597, -0.1877059, 1.62011, 0, 0.2980392, 1, 1,
0.3067175, 1.887985, -0.4929425, 0, 0.2901961, 1, 1,
0.3076616, 0.4412754, 0.3515288, 0, 0.2862745, 1, 1,
0.3096801, 1.223785, 2.258744, 0, 0.2784314, 1, 1,
0.3141327, -0.06273792, 2.03795, 0, 0.2745098, 1, 1,
0.3179051, -0.2346783, 2.891829, 0, 0.2666667, 1, 1,
0.3207273, 0.9566784, 0.6911168, 0, 0.2627451, 1, 1,
0.3220563, -0.8869833, 2.314248, 0, 0.254902, 1, 1,
0.3228034, -1.866861, 1.814473, 0, 0.2509804, 1, 1,
0.3249587, 0.7256131, 0.4932947, 0, 0.2431373, 1, 1,
0.3256256, 0.5271198, 1.998084, 0, 0.2392157, 1, 1,
0.3265807, 0.0585863, 0.5178604, 0, 0.2313726, 1, 1,
0.3324387, 1.142446, 0.9679027, 0, 0.227451, 1, 1,
0.3328622, 1.27589, 1.409131, 0, 0.2196078, 1, 1,
0.3338948, -1.004338, 4.817357, 0, 0.2156863, 1, 1,
0.3366225, 0.6286328, 1.201676, 0, 0.2078431, 1, 1,
0.3475786, 0.9302095, -0.1886758, 0, 0.2039216, 1, 1,
0.3486558, 1.059764, -0.05244896, 0, 0.1960784, 1, 1,
0.3491229, -0.05291257, 3.622049, 0, 0.1882353, 1, 1,
0.3494651, -0.365067, 1.833865, 0, 0.1843137, 1, 1,
0.3507017, -0.4805576, 2.939094, 0, 0.1764706, 1, 1,
0.3555724, -0.5953022, 1.424275, 0, 0.172549, 1, 1,
0.3617513, 0.678288, 0.7924193, 0, 0.1647059, 1, 1,
0.3645859, 0.100544, 3.573722, 0, 0.1607843, 1, 1,
0.3650706, 0.3802484, 1.510725, 0, 0.1529412, 1, 1,
0.3651537, 0.2035369, 2.446123, 0, 0.1490196, 1, 1,
0.365626, 0.2547979, 2.024721, 0, 0.1411765, 1, 1,
0.3658812, 0.2033121, 0.7061167, 0, 0.1372549, 1, 1,
0.3665487, 0.7842866, 0.2852021, 0, 0.1294118, 1, 1,
0.3698878, 1.005819, 2.44385, 0, 0.1254902, 1, 1,
0.3773881, -0.4381709, 1.566321, 0, 0.1176471, 1, 1,
0.380727, -1.503677, 3.378527, 0, 0.1137255, 1, 1,
0.3841155, 0.3859614, 2.226958, 0, 0.1058824, 1, 1,
0.3845286, 0.6558989, 1.983238, 0, 0.09803922, 1, 1,
0.3850026, -1.180107, 2.278933, 0, 0.09411765, 1, 1,
0.387307, 0.2183463, 0.2590534, 0, 0.08627451, 1, 1,
0.3880769, -1.161111, 3.096181, 0, 0.08235294, 1, 1,
0.3963085, -0.6699902, 2.249361, 0, 0.07450981, 1, 1,
0.3970743, 1.698453, -0.4487216, 0, 0.07058824, 1, 1,
0.3970867, -1.76244, 4.854867, 0, 0.0627451, 1, 1,
0.4050471, -1.192634, 0.8618017, 0, 0.05882353, 1, 1,
0.4065799, 0.5528113, -0.1854858, 0, 0.05098039, 1, 1,
0.4117725, 0.6919616, -0.849134, 0, 0.04705882, 1, 1,
0.4123486, 0.9102847, 1.950243, 0, 0.03921569, 1, 1,
0.4150681, 1.054276, -0.1595803, 0, 0.03529412, 1, 1,
0.4177616, 1.924697, 1.080044, 0, 0.02745098, 1, 1,
0.4230281, 1.79598, 0.02542136, 0, 0.02352941, 1, 1,
0.4244245, -1.853478, 2.403543, 0, 0.01568628, 1, 1,
0.424626, 1.460961, 0.2335437, 0, 0.01176471, 1, 1,
0.4335316, 1.295782, 2.798424, 0, 0.003921569, 1, 1,
0.4347467, 1.271926, -0.5981433, 0.003921569, 0, 1, 1,
0.435925, -0.8702154, 3.258281, 0.007843138, 0, 1, 1,
0.4376699, 0.4263572, 1.3451, 0.01568628, 0, 1, 1,
0.4379518, -0.2226498, 2.364867, 0.01960784, 0, 1, 1,
0.4408198, -0.1053912, 2.787701, 0.02745098, 0, 1, 1,
0.4420628, 0.3401508, 1.66947, 0.03137255, 0, 1, 1,
0.4442946, -0.6334186, 3.094828, 0.03921569, 0, 1, 1,
0.4445496, -1.164939, 3.764071, 0.04313726, 0, 1, 1,
0.4454627, 0.2803111, -0.3369329, 0.05098039, 0, 1, 1,
0.4573091, 1.334232, -0.6396502, 0.05490196, 0, 1, 1,
0.4585653, 0.7835757, 1.497286, 0.0627451, 0, 1, 1,
0.4602783, -0.2507011, 1.878189, 0.06666667, 0, 1, 1,
0.4606471, -1.572936, 2.410655, 0.07450981, 0, 1, 1,
0.4635437, 0.211348, 1.354732, 0.07843138, 0, 1, 1,
0.467565, -1.501768, 1.818053, 0.08627451, 0, 1, 1,
0.4738605, 1.708926, 1.080942, 0.09019608, 0, 1, 1,
0.4826198, 0.06221228, 2.36017, 0.09803922, 0, 1, 1,
0.4826396, -0.9057024, 2.163381, 0.1058824, 0, 1, 1,
0.4842197, 0.9602131, -0.8529602, 0.1098039, 0, 1, 1,
0.4858437, -0.3522584, 1.378034, 0.1176471, 0, 1, 1,
0.4873437, -1.43932, 3.085558, 0.1215686, 0, 1, 1,
0.4962726, -0.7743806, 1.786216, 0.1294118, 0, 1, 1,
0.4986157, -0.004583559, 1.470758, 0.1333333, 0, 1, 1,
0.5001064, -0.6840966, 2.794739, 0.1411765, 0, 1, 1,
0.5028893, 1.657461, -0.9590516, 0.145098, 0, 1, 1,
0.5040038, 0.6636592, 0.08048392, 0.1529412, 0, 1, 1,
0.5042906, -1.291084, 2.045133, 0.1568628, 0, 1, 1,
0.5049646, -1.193978, 3.88751, 0.1647059, 0, 1, 1,
0.5060852, -0.7167975, 1.770502, 0.1686275, 0, 1, 1,
0.5078771, 0.8927373, 0.7867684, 0.1764706, 0, 1, 1,
0.5082321, 1.982877, 0.6728659, 0.1803922, 0, 1, 1,
0.5148311, 0.8861218, -0.3100902, 0.1882353, 0, 1, 1,
0.5170186, 0.2684727, 1.298206, 0.1921569, 0, 1, 1,
0.5188942, 0.07850226, 2.338879, 0.2, 0, 1, 1,
0.5242046, 0.139983, 1.680784, 0.2078431, 0, 1, 1,
0.524632, 0.993347, -0.9502096, 0.2117647, 0, 1, 1,
0.5297549, -0.6353304, 4.290436, 0.2196078, 0, 1, 1,
0.5373435, 0.3576193, 0.6174373, 0.2235294, 0, 1, 1,
0.5379952, -0.719696, 2.832928, 0.2313726, 0, 1, 1,
0.544727, 0.07551178, 1.376793, 0.2352941, 0, 1, 1,
0.544848, -0.2510459, 1.019299, 0.2431373, 0, 1, 1,
0.5496402, 0.07383497, 1.588842, 0.2470588, 0, 1, 1,
0.5559726, -1.443001, 2.498372, 0.254902, 0, 1, 1,
0.5569373, -1.58625, 3.940921, 0.2588235, 0, 1, 1,
0.5579858, 0.7842926, 1.058086, 0.2666667, 0, 1, 1,
0.5647435, -0.8603601, 3.331776, 0.2705882, 0, 1, 1,
0.5716181, -0.9533914, 3.241359, 0.2784314, 0, 1, 1,
0.5730276, -0.704574, 2.876925, 0.282353, 0, 1, 1,
0.5737255, 0.1192504, 0.8104045, 0.2901961, 0, 1, 1,
0.574864, -1.575425, 2.087019, 0.2941177, 0, 1, 1,
0.587209, 0.609179, 0.9512855, 0.3019608, 0, 1, 1,
0.5935858, -0.01184388, 3.581988, 0.3098039, 0, 1, 1,
0.6051595, -1.634453, 1.517565, 0.3137255, 0, 1, 1,
0.6052198, -1.416736, 2.757386, 0.3215686, 0, 1, 1,
0.605312, 1.384492, 2.754243, 0.3254902, 0, 1, 1,
0.6059485, -0.5593674, 2.536028, 0.3333333, 0, 1, 1,
0.607689, 0.8680122, 0.9131976, 0.3372549, 0, 1, 1,
0.6089534, -0.7760921, 2.266711, 0.345098, 0, 1, 1,
0.6097423, -0.395806, 2.046802, 0.3490196, 0, 1, 1,
0.6131861, -1.185147, 2.530485, 0.3568628, 0, 1, 1,
0.6133194, 0.2763901, 0.6119936, 0.3607843, 0, 1, 1,
0.6179184, 1.211264, 0.01461555, 0.3686275, 0, 1, 1,
0.6204403, -1.070119, 4.841084, 0.372549, 0, 1, 1,
0.6239035, -1.982902, 2.250151, 0.3803922, 0, 1, 1,
0.6249498, -0.798069, 2.406834, 0.3843137, 0, 1, 1,
0.6276118, 0.2021048, 1.435192, 0.3921569, 0, 1, 1,
0.6279473, -0.6100011, 2.191256, 0.3960784, 0, 1, 1,
0.629728, 0.4611195, 2.331817, 0.4039216, 0, 1, 1,
0.638764, 0.0336873, 1.142256, 0.4117647, 0, 1, 1,
0.6402249, 1.087049, -0.3269362, 0.4156863, 0, 1, 1,
0.6414769, -0.5692415, 3.035453, 0.4235294, 0, 1, 1,
0.6435385, 0.9199895, 0.5784369, 0.427451, 0, 1, 1,
0.6443994, 0.3927144, 2.245122, 0.4352941, 0, 1, 1,
0.6447939, -0.5861044, 2.441231, 0.4392157, 0, 1, 1,
0.6451693, -1.00612, 3.488218, 0.4470588, 0, 1, 1,
0.6472664, -1.174728, 2.030662, 0.4509804, 0, 1, 1,
0.653093, -0.1532922, 2.077239, 0.4588235, 0, 1, 1,
0.6542405, 0.1651484, 1.256307, 0.4627451, 0, 1, 1,
0.6599376, 0.9091858, -0.5120912, 0.4705882, 0, 1, 1,
0.6642709, -1.946854, 1.24697, 0.4745098, 0, 1, 1,
0.6703619, 0.2814629, 2.612082, 0.4823529, 0, 1, 1,
0.6710537, -1.42862, 2.989995, 0.4862745, 0, 1, 1,
0.6715665, 0.2887839, 1.296664, 0.4941176, 0, 1, 1,
0.6767035, -1.512192, 2.461859, 0.5019608, 0, 1, 1,
0.6767454, 0.8821703, -0.409384, 0.5058824, 0, 1, 1,
0.6772964, -0.8969749, 1.700911, 0.5137255, 0, 1, 1,
0.6819499, -0.9104114, 2.60966, 0.5176471, 0, 1, 1,
0.685377, 0.7089888, 2.25137, 0.5254902, 0, 1, 1,
0.6864405, 0.4492739, 1.613482, 0.5294118, 0, 1, 1,
0.6874613, 1.221033, 0.4999007, 0.5372549, 0, 1, 1,
0.689218, 1.145762, 0.491457, 0.5411765, 0, 1, 1,
0.6910012, -0.08109597, 1.864572, 0.5490196, 0, 1, 1,
0.6949316, 1.141983, 0.61218, 0.5529412, 0, 1, 1,
0.6963457, -0.1698753, 1.601907, 0.5607843, 0, 1, 1,
0.6978515, -0.3455994, 1.21838, 0.5647059, 0, 1, 1,
0.6992163, -0.192172, 1.067197, 0.572549, 0, 1, 1,
0.7000028, -0.3776926, 0.9608184, 0.5764706, 0, 1, 1,
0.703217, 0.6481017, 0.2875639, 0.5843138, 0, 1, 1,
0.7040453, 0.1174466, 0.5791048, 0.5882353, 0, 1, 1,
0.7307444, -0.1595724, 2.055366, 0.5960785, 0, 1, 1,
0.7441097, 1.364732, -0.35786, 0.6039216, 0, 1, 1,
0.7489783, -1.191528, 1.601933, 0.6078432, 0, 1, 1,
0.7520336, 0.2772248, -0.6101605, 0.6156863, 0, 1, 1,
0.7570366, 0.1116317, 2.142403, 0.6196079, 0, 1, 1,
0.7580558, -0.7208796, 2.445552, 0.627451, 0, 1, 1,
0.7598639, 1.024063, 0.03436182, 0.6313726, 0, 1, 1,
0.7599548, 0.5016593, 0.5357775, 0.6392157, 0, 1, 1,
0.7609575, -0.713299, 2.964942, 0.6431373, 0, 1, 1,
0.7641804, -0.9506021, 3.425137, 0.6509804, 0, 1, 1,
0.7674268, -0.2965536, 0.7657498, 0.654902, 0, 1, 1,
0.7730328, -0.1961071, 2.082422, 0.6627451, 0, 1, 1,
0.7731544, -0.3656361, 1.17635, 0.6666667, 0, 1, 1,
0.7738821, -1.621247, 4.837312, 0.6745098, 0, 1, 1,
0.7742267, -0.5664344, 1.828773, 0.6784314, 0, 1, 1,
0.7744873, -1.429799, 3.376707, 0.6862745, 0, 1, 1,
0.7780569, 1.092, -0.2801224, 0.6901961, 0, 1, 1,
0.7790028, -0.1871042, 2.29973, 0.6980392, 0, 1, 1,
0.7838981, 1.413993, -1.068134, 0.7058824, 0, 1, 1,
0.7845884, -0.4230713, 2.198049, 0.7098039, 0, 1, 1,
0.7849348, 0.1626516, 0.5206054, 0.7176471, 0, 1, 1,
0.7871374, -0.4566202, 2.203101, 0.7215686, 0, 1, 1,
0.7895485, 0.03657717, 1.039708, 0.7294118, 0, 1, 1,
0.7917581, 0.143966, 2.996927, 0.7333333, 0, 1, 1,
0.8035748, -0.8522311, 1.26965, 0.7411765, 0, 1, 1,
0.8041381, 0.474367, 2.233799, 0.7450981, 0, 1, 1,
0.8119987, 0.7151204, 0.3098592, 0.7529412, 0, 1, 1,
0.8130826, -1.003219, 2.446975, 0.7568628, 0, 1, 1,
0.8154684, 0.309214, 0.6353207, 0.7647059, 0, 1, 1,
0.8167359, 1.083464, -0.2735736, 0.7686275, 0, 1, 1,
0.8176553, 1.925736, 0.03681429, 0.7764706, 0, 1, 1,
0.8230445, 0.7247688, 0.7969061, 0.7803922, 0, 1, 1,
0.8283597, 1.139684, -0.8674346, 0.7882353, 0, 1, 1,
0.8293722, -1.606306, 2.927809, 0.7921569, 0, 1, 1,
0.8356315, 0.05472799, 0.2447102, 0.8, 0, 1, 1,
0.8392388, -1.363472, 2.640064, 0.8078431, 0, 1, 1,
0.8437939, -0.836086, 2.39939, 0.8117647, 0, 1, 1,
0.846085, 0.06967095, 1.192806, 0.8196079, 0, 1, 1,
0.8480787, 1.425418, 0.2193983, 0.8235294, 0, 1, 1,
0.8494612, -1.558799, 1.047984, 0.8313726, 0, 1, 1,
0.8521897, -0.7082842, 2.915484, 0.8352941, 0, 1, 1,
0.8574877, -0.7511005, 2.381891, 0.8431373, 0, 1, 1,
0.8589973, 0.09182163, 1.855827, 0.8470588, 0, 1, 1,
0.863783, -0.5222391, 1.128223, 0.854902, 0, 1, 1,
0.8644279, 0.3823271, -0.6220375, 0.8588235, 0, 1, 1,
0.8682119, -1.54663, 1.979935, 0.8666667, 0, 1, 1,
0.8726422, 0.8685256, 1.242788, 0.8705882, 0, 1, 1,
0.8728409, -1.097422, 1.489113, 0.8784314, 0, 1, 1,
0.8750491, -0.7484825, 2.572427, 0.8823529, 0, 1, 1,
0.8767751, -1.181551, 3.066214, 0.8901961, 0, 1, 1,
0.9036081, -0.1828485, 1.207153, 0.8941177, 0, 1, 1,
0.903659, 0.4124247, 0.6190766, 0.9019608, 0, 1, 1,
0.9055044, 0.6606149, 0.8411173, 0.9098039, 0, 1, 1,
0.9064612, -0.2778915, 1.037924, 0.9137255, 0, 1, 1,
0.9155766, -1.009086, 0.4132213, 0.9215686, 0, 1, 1,
0.9202938, 0.03996965, 2.087045, 0.9254902, 0, 1, 1,
0.9217184, -1.05751, 2.438456, 0.9333333, 0, 1, 1,
0.9218896, 0.2940791, -0.17819, 0.9372549, 0, 1, 1,
0.9235005, -0.09114285, 3.790998, 0.945098, 0, 1, 1,
0.9337105, -0.005056573, 2.836392, 0.9490196, 0, 1, 1,
0.9340785, -0.6145461, 4.207759, 0.9568627, 0, 1, 1,
0.93604, -0.3657041, 2.367609, 0.9607843, 0, 1, 1,
0.9393416, -0.3514642, 1.11983, 0.9686275, 0, 1, 1,
0.9410288, -0.1310341, 3.010286, 0.972549, 0, 1, 1,
0.9457766, 0.4380392, -1.110456, 0.9803922, 0, 1, 1,
0.9599795, -1.633551, 3.227261, 0.9843137, 0, 1, 1,
0.9612667, -0.7718126, 1.02174, 0.9921569, 0, 1, 1,
0.9635332, 0.1112859, 2.166114, 0.9960784, 0, 1, 1,
0.970903, -1.303153, 1.703961, 1, 0, 0.9960784, 1,
0.9740884, 1.512487, 0.3487455, 1, 0, 0.9882353, 1,
0.9799294, -0.4800881, 1.367339, 1, 0, 0.9843137, 1,
0.9832596, 0.005004736, 1.432859, 1, 0, 0.9764706, 1,
0.9898888, 0.8629515, 1.250945, 1, 0, 0.972549, 1,
0.9988394, 1.853115, -0.4269397, 1, 0, 0.9647059, 1,
0.999528, 1.027931, -0.4361531, 1, 0, 0.9607843, 1,
1.013425, 0.967038, 0.02630141, 1, 0, 0.9529412, 1,
1.01453, 0.1636693, 1.962034, 1, 0, 0.9490196, 1,
1.019277, 0.6449794, 1.401124, 1, 0, 0.9411765, 1,
1.0283, 0.5423039, 1.572008, 1, 0, 0.9372549, 1,
1.038592, -0.02743929, 2.035907, 1, 0, 0.9294118, 1,
1.040674, -1.042977, 1.876482, 1, 0, 0.9254902, 1,
1.050062, 0.1265039, 2.74187, 1, 0, 0.9176471, 1,
1.051081, -0.9125032, 2.901966, 1, 0, 0.9137255, 1,
1.054583, -1.228276, 1.817414, 1, 0, 0.9058824, 1,
1.067751, -0.5288817, 1.754756, 1, 0, 0.9019608, 1,
1.068749, 0.608776, 0.6366254, 1, 0, 0.8941177, 1,
1.071822, -0.1455889, 0.8353319, 1, 0, 0.8862745, 1,
1.076195, -0.04078287, 0.5950965, 1, 0, 0.8823529, 1,
1.080238, -0.5405092, 3.554206, 1, 0, 0.8745098, 1,
1.085167, -0.1858962, 2.565909, 1, 0, 0.8705882, 1,
1.086136, -0.3693112, 2.116701, 1, 0, 0.8627451, 1,
1.089, -0.4243843, 2.407318, 1, 0, 0.8588235, 1,
1.089099, 0.3685295, -0.1059198, 1, 0, 0.8509804, 1,
1.096821, 0.7563953, 1.577822, 1, 0, 0.8470588, 1,
1.097209, -0.6828853, 3.184494, 1, 0, 0.8392157, 1,
1.100309, -0.5946831, 1.925106, 1, 0, 0.8352941, 1,
1.104142, -0.9567694, 2.006997, 1, 0, 0.827451, 1,
1.116862, -1.196598, 1.695369, 1, 0, 0.8235294, 1,
1.119668, -0.1785537, 3.625212, 1, 0, 0.8156863, 1,
1.13216, -2.29603, 3.974982, 1, 0, 0.8117647, 1,
1.143531, -0.7806844, 2.402251, 1, 0, 0.8039216, 1,
1.151142, -0.3257485, 0.9951272, 1, 0, 0.7960784, 1,
1.155171, 1.217607, 0.1259286, 1, 0, 0.7921569, 1,
1.158115, -0.7652731, 1.432218, 1, 0, 0.7843137, 1,
1.166849, -0.6075443, 2.206563, 1, 0, 0.7803922, 1,
1.169304, 1.596667, -1.095962, 1, 0, 0.772549, 1,
1.17173, 0.2578105, -0.8109952, 1, 0, 0.7686275, 1,
1.172074, -0.9074333, 5.389907, 1, 0, 0.7607843, 1,
1.178826, -1.259664, 1.138242, 1, 0, 0.7568628, 1,
1.183289, 0.5665336, 2.712482, 1, 0, 0.7490196, 1,
1.186839, -1.424699, 3.492102, 1, 0, 0.7450981, 1,
1.188999, 0.4996054, 0.07318199, 1, 0, 0.7372549, 1,
1.197973, 0.3121834, 0.5482231, 1, 0, 0.7333333, 1,
1.201222, -0.4945185, 1.18583, 1, 0, 0.7254902, 1,
1.202621, 0.8130873, 2.163689, 1, 0, 0.7215686, 1,
1.210901, 0.9433728, 1.206887, 1, 0, 0.7137255, 1,
1.21292, -0.9517149, 2.577153, 1, 0, 0.7098039, 1,
1.215948, -1.89525, 3.011271, 1, 0, 0.7019608, 1,
1.22005, 1.424598, 0.6619868, 1, 0, 0.6941177, 1,
1.220941, -0.001823128, 0.4887417, 1, 0, 0.6901961, 1,
1.221055, 0.08632118, 2.306028, 1, 0, 0.682353, 1,
1.223187, 1.204632, -0.9975946, 1, 0, 0.6784314, 1,
1.226909, -1.335768, 2.087828, 1, 0, 0.6705883, 1,
1.227142, -0.002449044, 2.331069, 1, 0, 0.6666667, 1,
1.231483, 0.01855626, 1.378, 1, 0, 0.6588235, 1,
1.247181, 0.7276573, 0.7730117, 1, 0, 0.654902, 1,
1.248276, 2.056936, 0.3299688, 1, 0, 0.6470588, 1,
1.265152, 0.8555523, 1.231016, 1, 0, 0.6431373, 1,
1.27808, -2.07586, 2.760569, 1, 0, 0.6352941, 1,
1.298446, -0.5302483, 2.601682, 1, 0, 0.6313726, 1,
1.299054, 1.20151, -0.3277875, 1, 0, 0.6235294, 1,
1.302871, 0.179915, 2.221532, 1, 0, 0.6196079, 1,
1.30415, 0.9327322, 0.9249082, 1, 0, 0.6117647, 1,
1.315689, 0.860251, 0.6805794, 1, 0, 0.6078432, 1,
1.325567, -2.518892, 2.83357, 1, 0, 0.6, 1,
1.331037, -0.06401984, 2.657454, 1, 0, 0.5921569, 1,
1.333262, -1.627534, 3.372232, 1, 0, 0.5882353, 1,
1.337106, -0.2493926, 0.9243051, 1, 0, 0.5803922, 1,
1.362233, -0.4317364, 4.0993, 1, 0, 0.5764706, 1,
1.364773, 0.7993568, 0.5523247, 1, 0, 0.5686275, 1,
1.3763, -1.245777, 1.889544, 1, 0, 0.5647059, 1,
1.378649, -0.2697132, 1.777082, 1, 0, 0.5568628, 1,
1.383446, 1.389028, 0.1468258, 1, 0, 0.5529412, 1,
1.384762, -1.359189, 0.9837279, 1, 0, 0.5450981, 1,
1.388172, -0.5984992, 2.387592, 1, 0, 0.5411765, 1,
1.398279, -0.04718256, 0.835535, 1, 0, 0.5333334, 1,
1.421361, 0.2039493, 0.9939086, 1, 0, 0.5294118, 1,
1.4235, 0.316489, 2.772163, 1, 0, 0.5215687, 1,
1.425391, 1.763863, 0.9156096, 1, 0, 0.5176471, 1,
1.43883, 1.427126, 0.1370373, 1, 0, 0.509804, 1,
1.448416, -2.23616, 3.667119, 1, 0, 0.5058824, 1,
1.451026, -1.842296, 0.2617377, 1, 0, 0.4980392, 1,
1.457162, 1.080865, 0.3952032, 1, 0, 0.4901961, 1,
1.460905, -0.3398973, 2.844761, 1, 0, 0.4862745, 1,
1.4621, -0.7342228, 2.611674, 1, 0, 0.4784314, 1,
1.464834, 0.8600791, 2.824416, 1, 0, 0.4745098, 1,
1.473703, -0.1392521, 0.08382669, 1, 0, 0.4666667, 1,
1.485843, 0.5529553, 1.810699, 1, 0, 0.4627451, 1,
1.499432, -0.4486685, 3.445516, 1, 0, 0.454902, 1,
1.501366, -1.509129, 2.580268, 1, 0, 0.4509804, 1,
1.505157, -0.4004772, 1.707092, 1, 0, 0.4431373, 1,
1.516354, 0.07456384, 1.171723, 1, 0, 0.4392157, 1,
1.523893, -1.306045, 3.233931, 1, 0, 0.4313726, 1,
1.524083, -0.4027674, 2.328039, 1, 0, 0.427451, 1,
1.544406, -1.385737, 4.014268, 1, 0, 0.4196078, 1,
1.545065, 1.062221, 1.828209, 1, 0, 0.4156863, 1,
1.553622, 0.7122962, 0.9643191, 1, 0, 0.4078431, 1,
1.553968, 0.3520252, 2.066167, 1, 0, 0.4039216, 1,
1.556827, -0.5848487, 2.708487, 1, 0, 0.3960784, 1,
1.56696, 0.2200645, 0.1010455, 1, 0, 0.3882353, 1,
1.567053, 0.237587, 1.420373, 1, 0, 0.3843137, 1,
1.568149, 1.01386, 0.6393273, 1, 0, 0.3764706, 1,
1.574121, -1.483637, 2.805623, 1, 0, 0.372549, 1,
1.580852, 1.007496, -0.4312312, 1, 0, 0.3647059, 1,
1.584639, -0.06007732, 1.31627, 1, 0, 0.3607843, 1,
1.585264, 1.435655, 1.165688, 1, 0, 0.3529412, 1,
1.59203, 0.3141713, 1.994782, 1, 0, 0.3490196, 1,
1.599381, -0.02946915, 0.6772369, 1, 0, 0.3411765, 1,
1.605309, -1.306139, 0.8871041, 1, 0, 0.3372549, 1,
1.613595, 1.450706, 2.708898, 1, 0, 0.3294118, 1,
1.621794, 0.5204347, 1.467306, 1, 0, 0.3254902, 1,
1.646205, -1.199122, 3.106719, 1, 0, 0.3176471, 1,
1.660429, -2.029723, 1.0172, 1, 0, 0.3137255, 1,
1.663822, 0.7840318, 0.489758, 1, 0, 0.3058824, 1,
1.666541, -0.2860734, 2.610617, 1, 0, 0.2980392, 1,
1.683725, 0.3471625, 1.147704, 1, 0, 0.2941177, 1,
1.721063, 1.729164, -0.6393999, 1, 0, 0.2862745, 1,
1.732139, 0.9624201, 0.7002949, 1, 0, 0.282353, 1,
1.73262, 0.03828032, 2.043028, 1, 0, 0.2745098, 1,
1.741319, 0.2483949, 2.464856, 1, 0, 0.2705882, 1,
1.753787, -0.9831843, 1.041835, 1, 0, 0.2627451, 1,
1.756572, -0.1430816, 0.7317544, 1, 0, 0.2588235, 1,
1.778296, 0.5632618, 1.312181, 1, 0, 0.2509804, 1,
1.780199, 0.08441167, 2.583045, 1, 0, 0.2470588, 1,
1.780274, -1.802531, 1.950227, 1, 0, 0.2392157, 1,
1.782593, -0.334072, 2.692282, 1, 0, 0.2352941, 1,
1.788991, 0.632783, 0.05453781, 1, 0, 0.227451, 1,
1.808792, -0.7480668, 1.849549, 1, 0, 0.2235294, 1,
1.817493, -0.08166596, 1.197606, 1, 0, 0.2156863, 1,
1.843604, -0.8197608, 0.6245605, 1, 0, 0.2117647, 1,
1.857604, 0.4547081, 0.2822893, 1, 0, 0.2039216, 1,
1.878232, 1.284131, 2.867986, 1, 0, 0.1960784, 1,
1.880684, -1.536234, 3.750306, 1, 0, 0.1921569, 1,
1.90204, 0.8391178, 1.575756, 1, 0, 0.1843137, 1,
1.92102, -0.1136959, 1.720851, 1, 0, 0.1803922, 1,
1.929671, 0.7145751, 0.06467254, 1, 0, 0.172549, 1,
1.956248, -0.7526299, 3.55867, 1, 0, 0.1686275, 1,
1.957045, -0.1475259, 3.042551, 1, 0, 0.1607843, 1,
1.993878, 0.52147, 1.311932, 1, 0, 0.1568628, 1,
2.016314, 0.08836691, 1.286462, 1, 0, 0.1490196, 1,
2.017642, -0.5623233, 2.288196, 1, 0, 0.145098, 1,
2.031573, 0.5523087, 1.803362, 1, 0, 0.1372549, 1,
2.040257, 0.6550518, 3.22, 1, 0, 0.1333333, 1,
2.083478, -0.8783903, 1.511096, 1, 0, 0.1254902, 1,
2.112814, 0.5149284, 1.554855, 1, 0, 0.1215686, 1,
2.158938, 0.8214189, 0.5629508, 1, 0, 0.1137255, 1,
2.166774, -0.2855611, 1.388263, 1, 0, 0.1098039, 1,
2.173118, 0.6594985, 1.440462, 1, 0, 0.1019608, 1,
2.175693, -0.6240014, 3.158174, 1, 0, 0.09411765, 1,
2.220779, -0.1739206, 1.458217, 1, 0, 0.09019608, 1,
2.241527, -0.8903762, 0.7853038, 1, 0, 0.08235294, 1,
2.243777, 0.7437341, 0.7257467, 1, 0, 0.07843138, 1,
2.250099, 0.7983909, 1.109253, 1, 0, 0.07058824, 1,
2.282929, -1.258552, 2.653207, 1, 0, 0.06666667, 1,
2.303459, -0.2250715, 2.519318, 1, 0, 0.05882353, 1,
2.323846, 1.28859, 1.035879, 1, 0, 0.05490196, 1,
2.335055, -1.286132, 1.55763, 1, 0, 0.04705882, 1,
2.34441, -2.601937, 3.514804, 1, 0, 0.04313726, 1,
2.365535, -0.1233652, 1.012801, 1, 0, 0.03529412, 1,
2.366172, -1.483249, 2.339498, 1, 0, 0.03137255, 1,
2.389783, 2.75175, 1.469943, 1, 0, 0.02352941, 1,
2.410845, -0.04317979, 1.297671, 1, 0, 0.01960784, 1,
2.597877, 0.5205865, 0.7152851, 1, 0, 0.01176471, 1,
2.986751, -2.078151, 1.435745, 1, 0, 0.007843138, 1
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
-0.7850503, -4.698422, -7.233792, 0, -0.5, 0.5, 0.5,
-0.7850503, -4.698422, -7.233792, 1, -0.5, 0.5, 0.5,
-0.7850503, -4.698422, -7.233792, 1, 1.5, 0.5, 0.5,
-0.7850503, -4.698422, -7.233792, 0, 1.5, 0.5, 0.5
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
-5.835493, -0.1784834, -7.233792, 0, -0.5, 0.5, 0.5,
-5.835493, -0.1784834, -7.233792, 1, -0.5, 0.5, 0.5,
-5.835493, -0.1784834, -7.233792, 1, 1.5, 0.5, 0.5,
-5.835493, -0.1784834, -7.233792, 0, 1.5, 0.5, 0.5
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
-5.835493, -4.698422, -0.007142782, 0, -0.5, 0.5, 0.5,
-5.835493, -4.698422, -0.007142782, 1, -0.5, 0.5, 0.5,
-5.835493, -4.698422, -0.007142782, 1, 1.5, 0.5, 0.5,
-5.835493, -4.698422, -0.007142782, 0, 1.5, 0.5, 0.5
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
-4, -3.65536, -5.566104,
2, -3.65536, -5.566104,
-4, -3.65536, -5.566104,
-4, -3.829204, -5.844052,
-2, -3.65536, -5.566104,
-2, -3.829204, -5.844052,
0, -3.65536, -5.566104,
0, -3.829204, -5.844052,
2, -3.65536, -5.566104,
2, -3.829204, -5.844052
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
"-4",
"-2",
"0",
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
-4, -4.176891, -6.399948, 0, -0.5, 0.5, 0.5,
-4, -4.176891, -6.399948, 1, -0.5, 0.5, 0.5,
-4, -4.176891, -6.399948, 1, 1.5, 0.5, 0.5,
-4, -4.176891, -6.399948, 0, 1.5, 0.5, 0.5,
-2, -4.176891, -6.399948, 0, -0.5, 0.5, 0.5,
-2, -4.176891, -6.399948, 1, -0.5, 0.5, 0.5,
-2, -4.176891, -6.399948, 1, 1.5, 0.5, 0.5,
-2, -4.176891, -6.399948, 0, 1.5, 0.5, 0.5,
0, -4.176891, -6.399948, 0, -0.5, 0.5, 0.5,
0, -4.176891, -6.399948, 1, -0.5, 0.5, 0.5,
0, -4.176891, -6.399948, 1, 1.5, 0.5, 0.5,
0, -4.176891, -6.399948, 0, 1.5, 0.5, 0.5,
2, -4.176891, -6.399948, 0, -0.5, 0.5, 0.5,
2, -4.176891, -6.399948, 1, -0.5, 0.5, 0.5,
2, -4.176891, -6.399948, 1, 1.5, 0.5, 0.5,
2, -4.176891, -6.399948, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.670006, -3, -5.566104,
-4.670006, 3, -5.566104,
-4.670006, -3, -5.566104,
-4.864254, -3, -5.844052,
-4.670006, -2, -5.566104,
-4.864254, -2, -5.844052,
-4.670006, -1, -5.566104,
-4.864254, -1, -5.844052,
-4.670006, 0, -5.566104,
-4.864254, 0, -5.844052,
-4.670006, 1, -5.566104,
-4.864254, 1, -5.844052,
-4.670006, 2, -5.566104,
-4.864254, 2, -5.844052,
-4.670006, 3, -5.566104,
-4.864254, 3, -5.844052
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
-5.252749, -3, -6.399948, 0, -0.5, 0.5, 0.5,
-5.252749, -3, -6.399948, 1, -0.5, 0.5, 0.5,
-5.252749, -3, -6.399948, 1, 1.5, 0.5, 0.5,
-5.252749, -3, -6.399948, 0, 1.5, 0.5, 0.5,
-5.252749, -2, -6.399948, 0, -0.5, 0.5, 0.5,
-5.252749, -2, -6.399948, 1, -0.5, 0.5, 0.5,
-5.252749, -2, -6.399948, 1, 1.5, 0.5, 0.5,
-5.252749, -2, -6.399948, 0, 1.5, 0.5, 0.5,
-5.252749, -1, -6.399948, 0, -0.5, 0.5, 0.5,
-5.252749, -1, -6.399948, 1, -0.5, 0.5, 0.5,
-5.252749, -1, -6.399948, 1, 1.5, 0.5, 0.5,
-5.252749, -1, -6.399948, 0, 1.5, 0.5, 0.5,
-5.252749, 0, -6.399948, 0, -0.5, 0.5, 0.5,
-5.252749, 0, -6.399948, 1, -0.5, 0.5, 0.5,
-5.252749, 0, -6.399948, 1, 1.5, 0.5, 0.5,
-5.252749, 0, -6.399948, 0, 1.5, 0.5, 0.5,
-5.252749, 1, -6.399948, 0, -0.5, 0.5, 0.5,
-5.252749, 1, -6.399948, 1, -0.5, 0.5, 0.5,
-5.252749, 1, -6.399948, 1, 1.5, 0.5, 0.5,
-5.252749, 1, -6.399948, 0, 1.5, 0.5, 0.5,
-5.252749, 2, -6.399948, 0, -0.5, 0.5, 0.5,
-5.252749, 2, -6.399948, 1, -0.5, 0.5, 0.5,
-5.252749, 2, -6.399948, 1, 1.5, 0.5, 0.5,
-5.252749, 2, -6.399948, 0, 1.5, 0.5, 0.5,
-5.252749, 3, -6.399948, 0, -0.5, 0.5, 0.5,
-5.252749, 3, -6.399948, 1, -0.5, 0.5, 0.5,
-5.252749, 3, -6.399948, 1, 1.5, 0.5, 0.5,
-5.252749, 3, -6.399948, 0, 1.5, 0.5, 0.5
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
-4.670006, -3.65536, -4,
-4.670006, -3.65536, 4,
-4.670006, -3.65536, -4,
-4.864254, -3.829204, -4,
-4.670006, -3.65536, -2,
-4.864254, -3.829204, -2,
-4.670006, -3.65536, 0,
-4.864254, -3.829204, 0,
-4.670006, -3.65536, 2,
-4.864254, -3.829204, 2,
-4.670006, -3.65536, 4,
-4.864254, -3.829204, 4
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
-5.252749, -4.176891, -4, 0, -0.5, 0.5, 0.5,
-5.252749, -4.176891, -4, 1, -0.5, 0.5, 0.5,
-5.252749, -4.176891, -4, 1, 1.5, 0.5, 0.5,
-5.252749, -4.176891, -4, 0, 1.5, 0.5, 0.5,
-5.252749, -4.176891, -2, 0, -0.5, 0.5, 0.5,
-5.252749, -4.176891, -2, 1, -0.5, 0.5, 0.5,
-5.252749, -4.176891, -2, 1, 1.5, 0.5, 0.5,
-5.252749, -4.176891, -2, 0, 1.5, 0.5, 0.5,
-5.252749, -4.176891, 0, 0, -0.5, 0.5, 0.5,
-5.252749, -4.176891, 0, 1, -0.5, 0.5, 0.5,
-5.252749, -4.176891, 0, 1, 1.5, 0.5, 0.5,
-5.252749, -4.176891, 0, 0, 1.5, 0.5, 0.5,
-5.252749, -4.176891, 2, 0, -0.5, 0.5, 0.5,
-5.252749, -4.176891, 2, 1, -0.5, 0.5, 0.5,
-5.252749, -4.176891, 2, 1, 1.5, 0.5, 0.5,
-5.252749, -4.176891, 2, 0, 1.5, 0.5, 0.5,
-5.252749, -4.176891, 4, 0, -0.5, 0.5, 0.5,
-5.252749, -4.176891, 4, 1, -0.5, 0.5, 0.5,
-5.252749, -4.176891, 4, 1, 1.5, 0.5, 0.5,
-5.252749, -4.176891, 4, 0, 1.5, 0.5, 0.5
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
-4.670006, -3.65536, -5.566104,
-4.670006, 3.298393, -5.566104,
-4.670006, -3.65536, 5.551818,
-4.670006, 3.298393, 5.551818,
-4.670006, -3.65536, -5.566104,
-4.670006, -3.65536, 5.551818,
-4.670006, 3.298393, -5.566104,
-4.670006, 3.298393, 5.551818,
-4.670006, -3.65536, -5.566104,
3.099905, -3.65536, -5.566104,
-4.670006, -3.65536, 5.551818,
3.099905, -3.65536, 5.551818,
-4.670006, 3.298393, -5.566104,
3.099905, 3.298393, -5.566104,
-4.670006, 3.298393, 5.551818,
3.099905, 3.298393, 5.551818,
3.099905, -3.65536, -5.566104,
3.099905, 3.298393, -5.566104,
3.099905, -3.65536, 5.551818,
3.099905, 3.298393, 5.551818,
3.099905, -3.65536, -5.566104,
3.099905, -3.65536, 5.551818,
3.099905, 3.298393, -5.566104,
3.099905, 3.298393, 5.551818
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
var radius = 8.139209;
var distance = 36.21226;
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
mvMatrix.translate( 0.7850503, 0.1784834, 0.007142782 );
mvMatrix.scale( 1.132609, 1.265543, 0.7915393 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.21226);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
clomazone<-read.table("clomazone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-clomazone$V2
```

```
## Error in eval(expr, envir, enclos): object 'clomazone' not found
```

```r
y<-clomazone$V3
```

```
## Error in eval(expr, envir, enclos): object 'clomazone' not found
```

```r
z<-clomazone$V4
```

```
## Error in eval(expr, envir, enclos): object 'clomazone' not found
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
-4.556852, -2.576684, -2.657994, 0, 0, 1, 1, 1,
-3.221587, -0.1940782, 0.4723148, 1, 0, 0, 1, 1,
-3.085021, -0.5736946, -0.1780541, 1, 0, 0, 1, 1,
-2.769676, -0.1393565, -0.4959539, 1, 0, 0, 1, 1,
-2.748765, -1.324148, -1.012295, 1, 0, 0, 1, 1,
-2.669057, 0.6971654, -2.205353, 1, 0, 0, 1, 1,
-2.520474, 1.524685, -0.7039541, 0, 0, 0, 1, 1,
-2.471948, 0.5568624, -0.4806849, 0, 0, 0, 1, 1,
-2.393406, 0.5040655, -3.458687, 0, 0, 0, 1, 1,
-2.33466, -1.131611, -0.9589127, 0, 0, 0, 1, 1,
-2.322547, -1.478275, -2.65596, 0, 0, 0, 1, 1,
-2.281502, -0.5788209, -0.9967241, 0, 0, 0, 1, 1,
-2.254004, -0.8186694, -2.758216, 0, 0, 0, 1, 1,
-2.199269, -0.3121366, -1.59456, 1, 1, 1, 1, 1,
-2.198077, 0.8887482, -0.4129426, 1, 1, 1, 1, 1,
-2.182835, -0.7824877, -0.7122533, 1, 1, 1, 1, 1,
-2.177109, -0.3359329, -0.91637, 1, 1, 1, 1, 1,
-2.174905, -1.380248, -1.967554, 1, 1, 1, 1, 1,
-2.163116, -0.1786525, -1.819368, 1, 1, 1, 1, 1,
-2.143425, 0.7073681, -3.157717, 1, 1, 1, 1, 1,
-2.10361, 0.4489766, -0.4717474, 1, 1, 1, 1, 1,
-2.087997, 2.188238, -1.562891, 1, 1, 1, 1, 1,
-2.066583, 0.9221207, -0.4825596, 1, 1, 1, 1, 1,
-2.053928, 0.3919147, -1.674929, 1, 1, 1, 1, 1,
-2.043946, 1.362823, -1.765216, 1, 1, 1, 1, 1,
-2.00416, 0.7768079, -1.245982, 1, 1, 1, 1, 1,
-2.000082, -0.7233105, -2.516848, 1, 1, 1, 1, 1,
-1.984013, 1.226873, 0.57486, 1, 1, 1, 1, 1,
-1.980307, 0.3966338, -0.5165406, 0, 0, 1, 1, 1,
-1.974703, 2.456182, 0.3128556, 1, 0, 0, 1, 1,
-1.967843, 0.132464, -1.25468, 1, 0, 0, 1, 1,
-1.957158, -1.080707, -1.231416, 1, 0, 0, 1, 1,
-1.894021, 0.4103004, -3.364612, 1, 0, 0, 1, 1,
-1.891075, -1.176723, -2.353251, 1, 0, 0, 1, 1,
-1.890072, -0.230122, -1.987611, 0, 0, 0, 1, 1,
-1.874946, -1.29275, -0.924284, 0, 0, 0, 1, 1,
-1.861182, 0.7672497, -2.336484, 0, 0, 0, 1, 1,
-1.858216, 1.443414, -0.641572, 0, 0, 0, 1, 1,
-1.847495, -1.311072, -3.42886, 0, 0, 0, 1, 1,
-1.835963, 0.8183078, -0.7448978, 0, 0, 0, 1, 1,
-1.831615, -0.4179268, -2.279106, 0, 0, 0, 1, 1,
-1.815881, 0.4892835, -1.801456, 1, 1, 1, 1, 1,
-1.808903, 1.042792, -2.114475, 1, 1, 1, 1, 1,
-1.797409, 0.2459259, -0.7754225, 1, 1, 1, 1, 1,
-1.786008, -0.1868807, -2.777227, 1, 1, 1, 1, 1,
-1.784649, 0.2082368, -1.566973, 1, 1, 1, 1, 1,
-1.783899, 0.1227381, -1.008217, 1, 1, 1, 1, 1,
-1.781542, -0.3239655, -1.783483, 1, 1, 1, 1, 1,
-1.775619, -0.5030763, -1.793777, 1, 1, 1, 1, 1,
-1.773701, -2.395413, -2.250579, 1, 1, 1, 1, 1,
-1.724102, -0.9439756, -3.093627, 1, 1, 1, 1, 1,
-1.70814, 0.4332447, -1.278427, 1, 1, 1, 1, 1,
-1.695761, -0.2990336, -3.504447, 1, 1, 1, 1, 1,
-1.687123, 1.251719, -1.063446, 1, 1, 1, 1, 1,
-1.671483, 0.6571271, -1.593086, 1, 1, 1, 1, 1,
-1.667143, 1.585077, 0.6397154, 1, 1, 1, 1, 1,
-1.652741, 1.143543, 0.3202065, 0, 0, 1, 1, 1,
-1.64627, 1.252056, -3.052277, 1, 0, 0, 1, 1,
-1.645495, 1.105415, -0.02762695, 1, 0, 0, 1, 1,
-1.644725, -0.3831151, -0.09178773, 1, 0, 0, 1, 1,
-1.631012, 1.026072, -1.14073, 1, 0, 0, 1, 1,
-1.6282, -1.552737, -2.223942, 1, 0, 0, 1, 1,
-1.607656, 0.2113572, -0.8518146, 0, 0, 0, 1, 1,
-1.605611, -0.05700754, -1.161179, 0, 0, 0, 1, 1,
-1.594694, 0.8647839, -2.066658, 0, 0, 0, 1, 1,
-1.586762, 0.0788952, -0.2964481, 0, 0, 0, 1, 1,
-1.578348, -0.4807026, -0.9228985, 0, 0, 0, 1, 1,
-1.574103, 0.1201883, -1.864969, 0, 0, 0, 1, 1,
-1.573787, 1.147633, 0.1833342, 0, 0, 0, 1, 1,
-1.564969, -1.506522, -0.5948697, 1, 1, 1, 1, 1,
-1.55874, 1.01644, 1.115763, 1, 1, 1, 1, 1,
-1.558035, -0.23901, -2.511424, 1, 1, 1, 1, 1,
-1.556706, -0.3166899, -1.37412, 1, 1, 1, 1, 1,
-1.552884, -0.4944952, -2.452456, 1, 1, 1, 1, 1,
-1.542887, -0.709797, -1.680415, 1, 1, 1, 1, 1,
-1.541208, -1.071997, -3.047596, 1, 1, 1, 1, 1,
-1.539235, -0.09101446, -2.51751, 1, 1, 1, 1, 1,
-1.530521, 0.7602797, -1.387279, 1, 1, 1, 1, 1,
-1.527012, 1.078757, -1.248714, 1, 1, 1, 1, 1,
-1.518547, 0.1293134, -1.204624, 1, 1, 1, 1, 1,
-1.505402, -2.191705, -4.114429, 1, 1, 1, 1, 1,
-1.505186, 2.149466, -0.3933666, 1, 1, 1, 1, 1,
-1.502457, -0.7899222, -2.811081, 1, 1, 1, 1, 1,
-1.484199, -0.7308757, -0.9057414, 1, 1, 1, 1, 1,
-1.478587, -1.291553, -3.748207, 0, 0, 1, 1, 1,
-1.477351, -0.9322928, -2.016878, 1, 0, 0, 1, 1,
-1.473144, -0.03510613, -2.776089, 1, 0, 0, 1, 1,
-1.46239, 0.6104976, -3.883809, 1, 0, 0, 1, 1,
-1.46002, 0.5883006, -1.811036, 1, 0, 0, 1, 1,
-1.45768, 1.849073, -1.743603, 1, 0, 0, 1, 1,
-1.455733, 0.04766659, -2.783126, 0, 0, 0, 1, 1,
-1.453883, 1.738547, -1.961971, 0, 0, 0, 1, 1,
-1.452539, 0.8563389, -0.7692568, 0, 0, 0, 1, 1,
-1.446651, -0.4782762, -3.158893, 0, 0, 0, 1, 1,
-1.439292, 1.074659, -2.35074, 0, 0, 0, 1, 1,
-1.432164, 0.4583915, -1.580109, 0, 0, 0, 1, 1,
-1.431182, 0.5408587, -1.839044, 0, 0, 0, 1, 1,
-1.420249, -1.716041, -3.077322, 1, 1, 1, 1, 1,
-1.417928, 1.007649, -0.0817547, 1, 1, 1, 1, 1,
-1.416034, 0.6098306, -1.193488, 1, 1, 1, 1, 1,
-1.409862, 0.9795091, -0.7197669, 1, 1, 1, 1, 1,
-1.409213, 0.8116282, -1.476109, 1, 1, 1, 1, 1,
-1.407181, 0.9518766, 0.4101008, 1, 1, 1, 1, 1,
-1.397171, -1.142528, -1.867521, 1, 1, 1, 1, 1,
-1.396467, -0.01289992, -1.131686, 1, 1, 1, 1, 1,
-1.39348, 0.4284325, -0.6227646, 1, 1, 1, 1, 1,
-1.3887, 1.615461, -0.1826534, 1, 1, 1, 1, 1,
-1.387196, -0.2215238, -1.642305, 1, 1, 1, 1, 1,
-1.360678, 0.5047103, -1.152145, 1, 1, 1, 1, 1,
-1.354107, -1.180809, -2.336861, 1, 1, 1, 1, 1,
-1.338728, -0.3798676, -3.182707, 1, 1, 1, 1, 1,
-1.333528, -0.4010012, -2.462949, 1, 1, 1, 1, 1,
-1.327005, -1.449032, -2.629272, 0, 0, 1, 1, 1,
-1.323026, -0.6152984, -1.618887, 1, 0, 0, 1, 1,
-1.315841, 1.840046, -0.03507448, 1, 0, 0, 1, 1,
-1.311915, 0.4464628, -0.5801453, 1, 0, 0, 1, 1,
-1.3092, -0.3420934, -3.356959, 1, 0, 0, 1, 1,
-1.296768, -0.8199647, -2.015051, 1, 0, 0, 1, 1,
-1.291419, 0.3112387, -2.371345, 0, 0, 0, 1, 1,
-1.289993, -1.600412, -2.066647, 0, 0, 0, 1, 1,
-1.286892, 0.9653702, 0.1010871, 0, 0, 0, 1, 1,
-1.286297, -1.64836, -3.6167, 0, 0, 0, 1, 1,
-1.283747, 0.4603532, -0.5664864, 0, 0, 0, 1, 1,
-1.275027, -2.403593, -3.703619, 0, 0, 0, 1, 1,
-1.274551, -1.102039, -4.254645, 0, 0, 0, 1, 1,
-1.27441, 0.8333557, -1.386933, 1, 1, 1, 1, 1,
-1.261093, 0.05867541, -1.005812, 1, 1, 1, 1, 1,
-1.257347, -0.01208442, -0.8791148, 1, 1, 1, 1, 1,
-1.256354, -1.524899, -2.771445, 1, 1, 1, 1, 1,
-1.247966, -1.308318, -0.7883306, 1, 1, 1, 1, 1,
-1.247948, 1.61914, -1.692232, 1, 1, 1, 1, 1,
-1.246353, -0.8761797, -2.536717, 1, 1, 1, 1, 1,
-1.216502, -0.7409603, -1.433333, 1, 1, 1, 1, 1,
-1.21603, -1.207796, -1.891066, 1, 1, 1, 1, 1,
-1.215951, -0.2158111, -2.921546, 1, 1, 1, 1, 1,
-1.213953, -1.611629, -2.999411, 1, 1, 1, 1, 1,
-1.205621, 0.1115512, 0.2973295, 1, 1, 1, 1, 1,
-1.204943, 0.4651214, -0.5970584, 1, 1, 1, 1, 1,
-1.202355, 0.1656691, -0.3071455, 1, 1, 1, 1, 1,
-1.193864, 1.175782, -0.686776, 1, 1, 1, 1, 1,
-1.193646, -1.305843, -2.274526, 0, 0, 1, 1, 1,
-1.185477, 0.7708082, -1.900913, 1, 0, 0, 1, 1,
-1.18362, -0.1241021, -1.887633, 1, 0, 0, 1, 1,
-1.182456, 1.242105, -0.4729661, 1, 0, 0, 1, 1,
-1.18193, 0.9349976, -2.031049, 1, 0, 0, 1, 1,
-1.161936, -0.2885104, -4.015342, 1, 0, 0, 1, 1,
-1.151876, -0.4764777, -1.415817, 0, 0, 0, 1, 1,
-1.150697, -0.4748419, -2.176526, 0, 0, 0, 1, 1,
-1.141672, 2.764198, 0.4785649, 0, 0, 0, 1, 1,
-1.140475, -0.4527659, -2.857028, 0, 0, 0, 1, 1,
-1.139134, 0.1217258, -1.95102, 0, 0, 0, 1, 1,
-1.135311, -0.7020851, -3.182468, 0, 0, 0, 1, 1,
-1.135163, -1.979966, -1.161605, 0, 0, 0, 1, 1,
-1.131424, 1.011038, -0.4106369, 1, 1, 1, 1, 1,
-1.128643, -1.620034, -2.081828, 1, 1, 1, 1, 1,
-1.120768, 0.3547845, -1.342124, 1, 1, 1, 1, 1,
-1.116822, 0.1125405, -2.373273, 1, 1, 1, 1, 1,
-1.113534, -0.9454538, -2.48468, 1, 1, 1, 1, 1,
-1.111393, 2.54628, -0.8194517, 1, 1, 1, 1, 1,
-1.110642, 1.307656, -0.3764904, 1, 1, 1, 1, 1,
-1.109333, -1.156267, -1.530602, 1, 1, 1, 1, 1,
-1.106494, -1.457057, -1.034236, 1, 1, 1, 1, 1,
-1.087321, -0.6304992, -1.206435, 1, 1, 1, 1, 1,
-1.083143, 0.4237567, -1.673025, 1, 1, 1, 1, 1,
-1.078321, 0.3246239, -0.833325, 1, 1, 1, 1, 1,
-1.068751, -0.01606011, -1.083769, 1, 1, 1, 1, 1,
-1.068098, 1.152312, -3.171148, 1, 1, 1, 1, 1,
-1.063458, -0.07611994, -2.96773, 1, 1, 1, 1, 1,
-1.063119, 1.458152, -0.2922308, 0, 0, 1, 1, 1,
-1.055328, -0.2049289, -2.277955, 1, 0, 0, 1, 1,
-1.048028, 0.6844758, -0.30044, 1, 0, 0, 1, 1,
-1.034026, 1.853794, -1.300092, 1, 0, 0, 1, 1,
-1.033607, -0.2907274, -2.008545, 1, 0, 0, 1, 1,
-1.026322, 1.185711, -1.825191, 1, 0, 0, 1, 1,
-1.023401, -1.287294, -1.222463, 0, 0, 0, 1, 1,
-1.022422, 1.640024, -0.7698207, 0, 0, 0, 1, 1,
-1.020105, 0.5985192, -0.8975723, 0, 0, 0, 1, 1,
-1.019723, -1.891688, -2.809364, 0, 0, 0, 1, 1,
-1.017088, -0.8557931, -1.97345, 0, 0, 0, 1, 1,
-0.9912055, -0.5926902, -2.321277, 0, 0, 0, 1, 1,
-0.9908831, -0.01599958, -1.220037, 0, 0, 0, 1, 1,
-0.9847298, -0.2372408, 0.3325821, 1, 1, 1, 1, 1,
-0.9810103, -0.789367, -0.2852785, 1, 1, 1, 1, 1,
-0.9806576, 0.5207559, 0.2781728, 1, 1, 1, 1, 1,
-0.9803346, -2.086821, -3.523639, 1, 1, 1, 1, 1,
-0.9751481, -0.008346833, -0.9659307, 1, 1, 1, 1, 1,
-0.9720091, -1.291167, -1.666108, 1, 1, 1, 1, 1,
-0.966228, -0.7188854, -2.566972, 1, 1, 1, 1, 1,
-0.954034, -0.3566933, -2.609928, 1, 1, 1, 1, 1,
-0.9391364, 0.05854896, -2.532693, 1, 1, 1, 1, 1,
-0.9358295, 0.5488831, -2.258115, 1, 1, 1, 1, 1,
-0.9318299, -0.3730146, -2.616936, 1, 1, 1, 1, 1,
-0.929903, 2.345089, 0.3810543, 1, 1, 1, 1, 1,
-0.9294542, -0.978215, -2.638644, 1, 1, 1, 1, 1,
-0.9290496, 0.8642228, -1.64979, 1, 1, 1, 1, 1,
-0.9274242, -0.4864539, -3.668283, 1, 1, 1, 1, 1,
-0.9272504, 0.2233327, -2.996779, 0, 0, 1, 1, 1,
-0.9272131, -0.4320174, -2.029803, 1, 0, 0, 1, 1,
-0.9180123, -1.787279, -1.172451, 1, 0, 0, 1, 1,
-0.9170108, 0.5189527, -2.390122, 1, 0, 0, 1, 1,
-0.9054665, -0.3886176, -0.3451501, 1, 0, 0, 1, 1,
-0.8976046, 0.8060339, 0.1520428, 1, 0, 0, 1, 1,
-0.8936034, 0.1682411, 0.4326535, 0, 0, 0, 1, 1,
-0.8936023, 1.126271, -0.6735332, 0, 0, 0, 1, 1,
-0.8870272, 0.8262785, -1.193753, 0, 0, 0, 1, 1,
-0.884914, -0.6669058, -1.881647, 0, 0, 0, 1, 1,
-0.8841884, 0.3500775, -0.902899, 0, 0, 0, 1, 1,
-0.8772362, -0.4324375, -2.71252, 0, 0, 0, 1, 1,
-0.8767627, -0.1328148, -2.471737, 0, 0, 0, 1, 1,
-0.8714077, -1.34672, -2.27044, 1, 1, 1, 1, 1,
-0.8686597, -2.053958, -2.312207, 1, 1, 1, 1, 1,
-0.8677885, -0.8517993, -3.371375, 1, 1, 1, 1, 1,
-0.866791, -0.2371035, -2.292929, 1, 1, 1, 1, 1,
-0.8662722, -0.8613096, -2.271203, 1, 1, 1, 1, 1,
-0.8547488, 0.5279172, -1.323937, 1, 1, 1, 1, 1,
-0.8542292, -0.8472652, -3.007561, 1, 1, 1, 1, 1,
-0.8529596, -0.7722391, -2.340596, 1, 1, 1, 1, 1,
-0.8513913, -0.09471709, -1.516428, 1, 1, 1, 1, 1,
-0.8491206, -0.4466227, -2.093064, 1, 1, 1, 1, 1,
-0.8475571, -0.4788048, -0.7180508, 1, 1, 1, 1, 1,
-0.847409, -1.208746, -3.308194, 1, 1, 1, 1, 1,
-0.8470632, -3.554091, -2.677347, 1, 1, 1, 1, 1,
-0.8467391, -0.3965986, 0.06026195, 1, 1, 1, 1, 1,
-0.8454893, -0.02464627, -2.731519, 1, 1, 1, 1, 1,
-0.834194, 0.7354041, -0.4296137, 0, 0, 1, 1, 1,
-0.8324904, -0.1126744, -1.758371, 1, 0, 0, 1, 1,
-0.8264059, -0.7568998, -2.899635, 1, 0, 0, 1, 1,
-0.8263137, -0.02579181, -1.824246, 1, 0, 0, 1, 1,
-0.8250999, -0.6995469, -1.318479, 1, 0, 0, 1, 1,
-0.8250404, 0.7258484, 0.2539596, 1, 0, 0, 1, 1,
-0.8226441, 0.4328361, -1.310423, 0, 0, 0, 1, 1,
-0.8164035, 1.60293, 0.02089275, 0, 0, 0, 1, 1,
-0.814769, -0.2382779, -0.169989, 0, 0, 0, 1, 1,
-0.8125575, -1.37177, -2.98193, 0, 0, 0, 1, 1,
-0.8110619, -1.664026, -1.423051, 0, 0, 0, 1, 1,
-0.8071225, -1.416848, -2.161438, 0, 0, 0, 1, 1,
-0.7979305, -0.03250042, 0.154074, 0, 0, 0, 1, 1,
-0.7976902, -2.135522, -2.710649, 1, 1, 1, 1, 1,
-0.7937498, -1.674684, -2.255419, 1, 1, 1, 1, 1,
-0.7932187, 1.057437, -1.227586, 1, 1, 1, 1, 1,
-0.7907762, -1.472939, -3.37446, 1, 1, 1, 1, 1,
-0.7878738, 1.710185, 0.8508231, 1, 1, 1, 1, 1,
-0.7870023, -0.9490545, -3.050625, 1, 1, 1, 1, 1,
-0.7813976, 1.014615, -0.8830145, 1, 1, 1, 1, 1,
-0.7811734, -0.5561837, -2.662113, 1, 1, 1, 1, 1,
-0.776993, -2.625033, -3.391346, 1, 1, 1, 1, 1,
-0.7738837, -0.3265751, -2.678019, 1, 1, 1, 1, 1,
-0.7695987, -0.2663791, -1.561969, 1, 1, 1, 1, 1,
-0.768724, -0.0167491, -1.764083, 1, 1, 1, 1, 1,
-0.7585332, 0.3528336, -0.8622342, 1, 1, 1, 1, 1,
-0.7550237, 1.860354, -1.114601, 1, 1, 1, 1, 1,
-0.7503839, 0.05606626, -2.297464, 1, 1, 1, 1, 1,
-0.7497216, -0.1744162, 0.7658402, 0, 0, 1, 1, 1,
-0.7476487, -0.5693436, -1.441127, 1, 0, 0, 1, 1,
-0.7466846, -0.2452499, -2.335401, 1, 0, 0, 1, 1,
-0.7463378, 0.9879946, -0.5896038, 1, 0, 0, 1, 1,
-0.7451444, -0.7508447, -3.435181, 1, 0, 0, 1, 1,
-0.736995, -1.058549, -3.989554, 1, 0, 0, 1, 1,
-0.736414, -0.9515142, -2.328816, 0, 0, 0, 1, 1,
-0.7352287, 1.757298, 0.165546, 0, 0, 0, 1, 1,
-0.730526, -0.38479, -1.719125, 0, 0, 0, 1, 1,
-0.71997, -0.8436551, -1.200196, 0, 0, 0, 1, 1,
-0.7084739, 0.3789373, -2.283062, 0, 0, 0, 1, 1,
-0.7083606, 3.197125, 0.326176, 0, 0, 0, 1, 1,
-0.7082767, 0.5009913, -2.006061, 0, 0, 0, 1, 1,
-0.7074803, -0.4460783, 0.322219, 1, 1, 1, 1, 1,
-0.7049026, 1.195572, -0.2646142, 1, 1, 1, 1, 1,
-0.7047508, 0.3241199, -2.337036, 1, 1, 1, 1, 1,
-0.7045269, -0.6661565, -3.501411, 1, 1, 1, 1, 1,
-0.6954066, -0.8260292, -2.45331, 1, 1, 1, 1, 1,
-0.6944512, -0.9579467, -1.356841, 1, 1, 1, 1, 1,
-0.6903235, 0.157704, -2.950178, 1, 1, 1, 1, 1,
-0.682447, -0.1315393, -3.425225, 1, 1, 1, 1, 1,
-0.6785209, -2.424563, -3.096319, 1, 1, 1, 1, 1,
-0.6742179, -0.3982196, -3.081234, 1, 1, 1, 1, 1,
-0.6741206, -0.6886686, -1.611478, 1, 1, 1, 1, 1,
-0.6723037, -0.871756, -2.865323, 1, 1, 1, 1, 1,
-0.6705069, -1.192331, -3.236011, 1, 1, 1, 1, 1,
-0.6681098, -0.3742044, 0.4612396, 1, 1, 1, 1, 1,
-0.6657668, -2.293854, -2.965986, 1, 1, 1, 1, 1,
-0.6617798, 0.106056, -1.751841, 0, 0, 1, 1, 1,
-0.6612168, -0.6203635, -1.610901, 1, 0, 0, 1, 1,
-0.6520205, -0.6368082, -2.045634, 1, 0, 0, 1, 1,
-0.6502566, -1.203472, -0.9908025, 1, 0, 0, 1, 1,
-0.6383915, 0.06741634, -2.072953, 1, 0, 0, 1, 1,
-0.6340452, -0.2722558, -0.4336511, 1, 0, 0, 1, 1,
-0.6314164, -0.5835364, -2.30022, 0, 0, 0, 1, 1,
-0.6283953, 0.2304346, -2.283978, 0, 0, 0, 1, 1,
-0.62584, 1.324571, -0.3518346, 0, 0, 0, 1, 1,
-0.6254085, 2.198165, -1.255589, 0, 0, 0, 1, 1,
-0.6161573, 0.3148727, -1.478458, 0, 0, 0, 1, 1,
-0.6159681, 0.5712675, -0.2526155, 0, 0, 0, 1, 1,
-0.6127242, 0.6663619, -0.3860792, 0, 0, 0, 1, 1,
-0.6054476, -1.639615, -3.144037, 1, 1, 1, 1, 1,
-0.600692, 1.72839, -1.95928, 1, 1, 1, 1, 1,
-0.5997482, 0.9055959, -0.4170825, 1, 1, 1, 1, 1,
-0.5959835, 1.109431, -2.088806, 1, 1, 1, 1, 1,
-0.5958258, 1.599926, -0.4101199, 1, 1, 1, 1, 1,
-0.5933424, 0.3418095, -1.623681, 1, 1, 1, 1, 1,
-0.5887045, 1.215235, 0.1706282, 1, 1, 1, 1, 1,
-0.5800026, 1.548164, -0.7174376, 1, 1, 1, 1, 1,
-0.5794568, -0.1465976, -2.161768, 1, 1, 1, 1, 1,
-0.5764412, 0.6717791, -0.6013091, 1, 1, 1, 1, 1,
-0.5750971, 1.521697, -0.1801743, 1, 1, 1, 1, 1,
-0.573654, -0.5893126, -2.592274, 1, 1, 1, 1, 1,
-0.5680117, -1.098729, -3.164144, 1, 1, 1, 1, 1,
-0.5661433, -2.04469, -3.170249, 1, 1, 1, 1, 1,
-0.565781, -0.4682436, -1.512745, 1, 1, 1, 1, 1,
-0.5591542, -0.6529317, -2.732386, 0, 0, 1, 1, 1,
-0.5509276, -0.2640371, -1.59355, 1, 0, 0, 1, 1,
-0.5471544, 0.2874821, -2.411713, 1, 0, 0, 1, 1,
-0.5447828, 1.083862, -0.8264927, 1, 0, 0, 1, 1,
-0.537021, 0.1359686, -2.483284, 1, 0, 0, 1, 1,
-0.5364535, 0.916835, -0.8451515, 1, 0, 0, 1, 1,
-0.5287802, -0.2467877, -1.632651, 0, 0, 0, 1, 1,
-0.5267655, -1.344328, -3.849279, 0, 0, 0, 1, 1,
-0.5257142, 1.057085, -0.5571828, 0, 0, 0, 1, 1,
-0.5250044, -2.48928, -1.759609, 0, 0, 0, 1, 1,
-0.5220006, 1.226496, -2.477057, 0, 0, 0, 1, 1,
-0.5202103, 0.4556433, -0.5771382, 0, 0, 0, 1, 1,
-0.5190942, 0.960682, -1.225229, 0, 0, 0, 1, 1,
-0.5168663, -1.009633, -1.654346, 1, 1, 1, 1, 1,
-0.5126297, -0.08039838, -0.8281043, 1, 1, 1, 1, 1,
-0.5101666, 0.6375175, -1.023184, 1, 1, 1, 1, 1,
-0.5092266, 1.835493, 0.7451913, 1, 1, 1, 1, 1,
-0.5061279, -1.5841, -1.989022, 1, 1, 1, 1, 1,
-0.5029564, -1.619728, -3.252651, 1, 1, 1, 1, 1,
-0.4949797, -0.9439719, -2.530244, 1, 1, 1, 1, 1,
-0.4939083, -0.8111602, -3.423264, 1, 1, 1, 1, 1,
-0.4935943, -0.6364043, -3.870497, 1, 1, 1, 1, 1,
-0.4888054, 0.0520673, -1.893584, 1, 1, 1, 1, 1,
-0.487337, 0.2977203, -1.35899, 1, 1, 1, 1, 1,
-0.4822665, 0.4881799, -0.9125791, 1, 1, 1, 1, 1,
-0.4810839, -0.3125052, -2.679784, 1, 1, 1, 1, 1,
-0.4771902, 1.571869, 1.424059, 1, 1, 1, 1, 1,
-0.4753425, 0.4469365, -0.5184302, 1, 1, 1, 1, 1,
-0.4737777, 0.7760307, -0.4417369, 0, 0, 1, 1, 1,
-0.4594075, 0.04508395, -1.194927, 1, 0, 0, 1, 1,
-0.4575285, -0.7489896, -2.736073, 1, 0, 0, 1, 1,
-0.4559616, 0.7635091, -1.581856, 1, 0, 0, 1, 1,
-0.4532169, 0.8734601, -0.3427215, 1, 0, 0, 1, 1,
-0.4499323, -1.491858, -2.274595, 1, 0, 0, 1, 1,
-0.442443, 1.601242, -0.5321681, 0, 0, 0, 1, 1,
-0.4421995, 0.7292877, -0.6558088, 0, 0, 0, 1, 1,
-0.4411199, -1.63454, -3.030038, 0, 0, 0, 1, 1,
-0.440317, -0.3074652, -2.12314, 0, 0, 0, 1, 1,
-0.4375364, -0.5939317, -1.175977, 0, 0, 0, 1, 1,
-0.4322068, 0.893357, 1.0064, 0, 0, 0, 1, 1,
-0.4293498, 0.5909319, -0.1351138, 0, 0, 0, 1, 1,
-0.4239869, 0.9514985, -0.8465869, 1, 1, 1, 1, 1,
-0.4232646, 1.074992, -1.412809, 1, 1, 1, 1, 1,
-0.4217319, 0.4706796, -1.671907, 1, 1, 1, 1, 1,
-0.4200078, -1.374587, -2.601686, 1, 1, 1, 1, 1,
-0.4141623, 0.9822043, -0.4785129, 1, 1, 1, 1, 1,
-0.4122553, 0.5428661, -2.237341, 1, 1, 1, 1, 1,
-0.4072523, 0.2049878, -1.017897, 1, 1, 1, 1, 1,
-0.4065009, -0.09865498, -2.662879, 1, 1, 1, 1, 1,
-0.4060331, 0.674997, -3.057748, 1, 1, 1, 1, 1,
-0.4032218, 1.000288, -1.455179, 1, 1, 1, 1, 1,
-0.3974031, -0.3864506, -2.04539, 1, 1, 1, 1, 1,
-0.3954698, -2.536568, -3.355612, 1, 1, 1, 1, 1,
-0.3933359, 0.4567038, -0.568584, 1, 1, 1, 1, 1,
-0.3929136, -0.677138, -2.425663, 1, 1, 1, 1, 1,
-0.3926737, 0.8188959, 0.8207631, 1, 1, 1, 1, 1,
-0.3922079, 1.355175, 1.582708, 0, 0, 1, 1, 1,
-0.38752, 0.04569, -2.645241, 1, 0, 0, 1, 1,
-0.3857707, 1.273194, 1.225831, 1, 0, 0, 1, 1,
-0.3825856, -1.58708, -3.214962, 1, 0, 0, 1, 1,
-0.3816474, 1.714497, 1.338228, 1, 0, 0, 1, 1,
-0.3794153, -1.082398, -4.317832, 1, 0, 0, 1, 1,
-0.3767802, -1.149369, -2.931077, 0, 0, 0, 1, 1,
-0.37636, -0.3395625, -2.181704, 0, 0, 0, 1, 1,
-0.3729569, 0.6036897, -2.885398, 0, 0, 0, 1, 1,
-0.3698615, 0.6796903, -1.059795, 0, 0, 0, 1, 1,
-0.3694771, -0.7334296, -2.648059, 0, 0, 0, 1, 1,
-0.3688913, 0.04755391, -1.265667, 0, 0, 0, 1, 1,
-0.3682828, -0.7273331, -3.916692, 0, 0, 0, 1, 1,
-0.3645197, 0.05042071, -2.594891, 1, 1, 1, 1, 1,
-0.3633244, 1.398278, 0.9802623, 1, 1, 1, 1, 1,
-0.360161, 0.5655791, -0.2848144, 1, 1, 1, 1, 1,
-0.3541918, -0.1938965, -2.487647, 1, 1, 1, 1, 1,
-0.3541169, -0.9610808, -1.577356, 1, 1, 1, 1, 1,
-0.3498326, 0.5766305, 1.681827, 1, 1, 1, 1, 1,
-0.346017, 1.537067, -0.6383001, 1, 1, 1, 1, 1,
-0.33066, 0.9754069, -0.2182913, 1, 1, 1, 1, 1,
-0.3273706, 1.272583, 0.881482, 1, 1, 1, 1, 1,
-0.3240556, 1.384888, -0.07845824, 1, 1, 1, 1, 1,
-0.321191, -0.100342, -3.308302, 1, 1, 1, 1, 1,
-0.3197541, 1.239049, -1.525925, 1, 1, 1, 1, 1,
-0.3175762, -1.513359, -2.474247, 1, 1, 1, 1, 1,
-0.307469, 0.2008595, -0.7682633, 1, 1, 1, 1, 1,
-0.306361, -1.618534, -2.816054, 1, 1, 1, 1, 1,
-0.306326, -0.953338, -2.909338, 0, 0, 1, 1, 1,
-0.3060122, -1.035287, -4.231098, 1, 0, 0, 1, 1,
-0.3052391, -0.9673406, -3.358896, 1, 0, 0, 1, 1,
-0.3023663, 0.7563672, 0.4451655, 1, 0, 0, 1, 1,
-0.3001878, -0.3696205, -1.671115, 1, 0, 0, 1, 1,
-0.297155, -1.349029, -3.296178, 1, 0, 0, 1, 1,
-0.2962784, 0.1446848, -0.6989623, 0, 0, 0, 1, 1,
-0.2962001, -0.01737675, -0.7150812, 0, 0, 0, 1, 1,
-0.294952, 0.2368969, -0.7765821, 0, 0, 0, 1, 1,
-0.2935013, 0.8294532, 1.238132, 0, 0, 0, 1, 1,
-0.2915217, 0.1527615, -0.4038661, 0, 0, 0, 1, 1,
-0.2853485, -0.4548745, -2.580665, 0, 0, 0, 1, 1,
-0.2852845, 0.2245664, -0.24401, 0, 0, 0, 1, 1,
-0.2731667, 1.621637, 0.3618584, 1, 1, 1, 1, 1,
-0.2727517, -0.7634273, -4.353407, 1, 1, 1, 1, 1,
-0.2702932, -0.6558759, -3.402371, 1, 1, 1, 1, 1,
-0.269897, -0.2600758, -2.624152, 1, 1, 1, 1, 1,
-0.267088, -0.7589937, -3.669422, 1, 1, 1, 1, 1,
-0.2662773, -0.3388938, -2.053026, 1, 1, 1, 1, 1,
-0.2646357, 0.9395441, 0.523553, 1, 1, 1, 1, 1,
-0.2624886, -0.1975026, -1.457827, 1, 1, 1, 1, 1,
-0.262279, 0.3689029, -2.104179, 1, 1, 1, 1, 1,
-0.2604782, 0.02808247, -1.846974, 1, 1, 1, 1, 1,
-0.2574737, -1.822724, -3.069241, 1, 1, 1, 1, 1,
-0.2573864, 0.5838376, -1.896405, 1, 1, 1, 1, 1,
-0.2556152, -0.3019329, -2.713607, 1, 1, 1, 1, 1,
-0.2527248, -1.949844, -3.514821, 1, 1, 1, 1, 1,
-0.2424591, 1.40377, 0.6396496, 1, 1, 1, 1, 1,
-0.2386321, -1.274319, -4.197486, 0, 0, 1, 1, 1,
-0.2358513, 1.24803, 0.06549583, 1, 0, 0, 1, 1,
-0.2321589, -1.153425, -1.536069, 1, 0, 0, 1, 1,
-0.2298514, -2.467366, -4.106235, 1, 0, 0, 1, 1,
-0.2278646, 0.03792729, -1.487059, 1, 0, 0, 1, 1,
-0.2266853, -0.04664523, -2.694972, 1, 0, 0, 1, 1,
-0.2259413, 1.163496, -0.9907895, 0, 0, 0, 1, 1,
-0.2246725, -1.170121, -3.029332, 0, 0, 0, 1, 1,
-0.2227274, -1.289336, -2.453063, 0, 0, 0, 1, 1,
-0.2185882, -0.07506421, -3.766414, 0, 0, 0, 1, 1,
-0.210703, 0.4549229, -1.40952, 0, 0, 0, 1, 1,
-0.2100549, 0.5285889, -1.113474, 0, 0, 0, 1, 1,
-0.2054792, 0.1396764, -1.245446, 0, 0, 0, 1, 1,
-0.2010626, -0.6840649, -1.756864, 1, 1, 1, 1, 1,
-0.2004852, 0.3234468, -0.02477445, 1, 1, 1, 1, 1,
-0.1976005, 1.279622, -0.1570989, 1, 1, 1, 1, 1,
-0.1929705, 0.06368479, -3.768399, 1, 1, 1, 1, 1,
-0.1914998, 2.060123, -0.1295918, 1, 1, 1, 1, 1,
-0.1894817, -0.07370797, -1.645838, 1, 1, 1, 1, 1,
-0.186681, 0.02474492, -0.51257, 1, 1, 1, 1, 1,
-0.1837764, -0.7863361, -4.549348, 1, 1, 1, 1, 1,
-0.1808451, 0.8872336, -1.090475, 1, 1, 1, 1, 1,
-0.1768987, 0.1244669, -0.5146428, 1, 1, 1, 1, 1,
-0.1765133, 0.5538199, -0.7495275, 1, 1, 1, 1, 1,
-0.1742358, 1.175604, -0.7773221, 1, 1, 1, 1, 1,
-0.1733917, -1.901536, -2.481792, 1, 1, 1, 1, 1,
-0.1701105, -0.8751106, -4.34596, 1, 1, 1, 1, 1,
-0.1643688, -0.6880141, -2.933711, 1, 1, 1, 1, 1,
-0.1631843, -0.2953584, -3.979017, 0, 0, 1, 1, 1,
-0.1622861, -2.237102, -4.571569, 1, 0, 0, 1, 1,
-0.1609557, 0.1545775, -1.792738, 1, 0, 0, 1, 1,
-0.1569231, -0.1339968, -3.817698, 1, 0, 0, 1, 1,
-0.1508981, 1.566867, -0.2900761, 1, 0, 0, 1, 1,
-0.1506213, -1.617362, -5.404192, 1, 0, 0, 1, 1,
-0.1470221, 2.515003, -0.05833249, 0, 0, 0, 1, 1,
-0.1450716, 2.435516, -1.740448, 0, 0, 0, 1, 1,
-0.1425048, -1.253246, -4.313057, 0, 0, 0, 1, 1,
-0.140386, 1.920635, 0.9407229, 0, 0, 0, 1, 1,
-0.1401831, -2.258275, -2.916549, 0, 0, 0, 1, 1,
-0.1334153, 0.3789169, -0.1103356, 0, 0, 0, 1, 1,
-0.1305, 0.4819296, 0.2169536, 0, 0, 0, 1, 1,
-0.1300308, 0.3374432, -1.438588, 1, 1, 1, 1, 1,
-0.1271734, 0.3807225, 0.8397498, 1, 1, 1, 1, 1,
-0.1166987, 0.6842946, -0.4329087, 1, 1, 1, 1, 1,
-0.1144584, 0.3446383, -1.065788, 1, 1, 1, 1, 1,
-0.1107424, -0.9301185, -3.638641, 1, 1, 1, 1, 1,
-0.1098372, 1.590811, -1.214307, 1, 1, 1, 1, 1,
-0.10965, 1.139789, -0.5986892, 1, 1, 1, 1, 1,
-0.1061831, -2.322116, -2.055201, 1, 1, 1, 1, 1,
-0.1061324, 1.256673, 0.7954372, 1, 1, 1, 1, 1,
-0.1044521, -0.7059307, -3.484261, 1, 1, 1, 1, 1,
-0.1036828, 1.050709, -1.220351, 1, 1, 1, 1, 1,
-0.09972399, -0.4633894, -2.246266, 1, 1, 1, 1, 1,
-0.08505508, 2.773442, -0.9495618, 1, 1, 1, 1, 1,
-0.08341108, 0.6156007, 0.5829648, 1, 1, 1, 1, 1,
-0.07971332, -0.9480682, -1.530174, 1, 1, 1, 1, 1,
-0.07924481, -2.718938, -2.552826, 0, 0, 1, 1, 1,
-0.07888905, 1.488127, -0.1316068, 1, 0, 0, 1, 1,
-0.07476573, -0.04657147, -2.66091, 1, 0, 0, 1, 1,
-0.07393587, 0.3824298, 0.3504041, 1, 0, 0, 1, 1,
-0.07179927, -0.625845, -0.769502, 1, 0, 0, 1, 1,
-0.06802993, 0.290616, -0.2252385, 1, 0, 0, 1, 1,
-0.06179253, -0.404779, -2.219436, 0, 0, 0, 1, 1,
-0.05527719, -0.0748388, -1.39877, 0, 0, 0, 1, 1,
-0.04573463, -1.53212, -4.40937, 0, 0, 0, 1, 1,
-0.04510465, -0.2547354, -3.234651, 0, 0, 0, 1, 1,
-0.03746929, 0.1546084, -0.6430387, 0, 0, 0, 1, 1,
-0.03716422, -1.711502, -3.441438, 0, 0, 0, 1, 1,
-0.0363524, 0.2017486, -0.9937901, 0, 0, 0, 1, 1,
-0.02544452, 1.551464, 0.2408764, 1, 1, 1, 1, 1,
-0.02361833, -1.323314, -3.417342, 1, 1, 1, 1, 1,
-0.01638108, 0.7154371, -0.7941455, 1, 1, 1, 1, 1,
-0.01248127, 0.9331214, 0.01079688, 1, 1, 1, 1, 1,
-0.009998375, 0.4832284, 0.81332, 1, 1, 1, 1, 1,
-0.005364495, -0.8143458, -3.378689, 1, 1, 1, 1, 1,
-0.004685688, -0.4292171, -3.478589, 1, 1, 1, 1, 1,
-0.004091248, -0.5840475, -5.075492, 1, 1, 1, 1, 1,
-0.00236278, 1.236814, -1.039286, 1, 1, 1, 1, 1,
-0.0006945354, 1.225011, -0.6501127, 1, 1, 1, 1, 1,
0.003696724, 2.172587, -0.6609101, 1, 1, 1, 1, 1,
0.01244548, -0.4547411, 3.532592, 1, 1, 1, 1, 1,
0.01447019, 1.35948, 0.6780372, 1, 1, 1, 1, 1,
0.0164482, -1.815516, 2.567287, 1, 1, 1, 1, 1,
0.0189653, -1.554423, 2.702893, 1, 1, 1, 1, 1,
0.01941714, -1.863648, 3.320081, 0, 0, 1, 1, 1,
0.01941923, -1.323411, 2.541382, 1, 0, 0, 1, 1,
0.02263573, -0.4320249, 2.081335, 1, 0, 0, 1, 1,
0.02959467, 1.831324, 0.4764637, 1, 0, 0, 1, 1,
0.03068092, -0.4040229, 1.976751, 1, 0, 0, 1, 1,
0.03108683, -0.7399763, 4.679701, 1, 0, 0, 1, 1,
0.03148579, -0.1607054, 3.607184, 0, 0, 0, 1, 1,
0.03245448, 0.02472603, 3.514321, 0, 0, 0, 1, 1,
0.03355645, -0.6656033, 3.953848, 0, 0, 0, 1, 1,
0.03411539, -0.6427166, 2.881535, 0, 0, 0, 1, 1,
0.03823316, -0.30812, 2.339043, 0, 0, 0, 1, 1,
0.03831363, 1.190121, 0.01819433, 0, 0, 0, 1, 1,
0.0396942, 1.059535, -0.4061145, 0, 0, 0, 1, 1,
0.04476767, -0.4584428, 2.449174, 1, 1, 1, 1, 1,
0.04608963, 1.183886, -0.9924522, 1, 1, 1, 1, 1,
0.04674113, 1.075417, 0.6645029, 1, 1, 1, 1, 1,
0.04772198, 0.3884132, -1.169741, 1, 1, 1, 1, 1,
0.04926848, 0.2043541, -0.1842256, 1, 1, 1, 1, 1,
0.05009915, 0.8161606, -0.6015739, 1, 1, 1, 1, 1,
0.05201796, 0.3331133, -0.5581053, 1, 1, 1, 1, 1,
0.05259559, -0.2970489, 4.005201, 1, 1, 1, 1, 1,
0.05324779, 0.8475275, -0.2341225, 1, 1, 1, 1, 1,
0.0533627, -1.240546, 1.908205, 1, 1, 1, 1, 1,
0.05367214, -0.5585383, 2.944225, 1, 1, 1, 1, 1,
0.05841045, 0.8559771, -0.4272721, 1, 1, 1, 1, 1,
0.05865446, 0.5244719, -0.195581, 1, 1, 1, 1, 1,
0.06418956, -1.786816, 3.595232, 1, 1, 1, 1, 1,
0.06647237, 0.3976455, 0.6042087, 1, 1, 1, 1, 1,
0.0689592, -0.3703463, 3.616816, 0, 0, 1, 1, 1,
0.07116637, -0.535637, 4.180031, 1, 0, 0, 1, 1,
0.07333558, -0.02793067, 2.295482, 1, 0, 0, 1, 1,
0.07648631, 0.4618754, 0.4931338, 1, 0, 0, 1, 1,
0.0768472, -0.2442236, 2.933947, 1, 0, 0, 1, 1,
0.0773288, -0.4001162, 2.862943, 1, 0, 0, 1, 1,
0.0784944, 0.6969969, 0.2686317, 0, 0, 0, 1, 1,
0.07936464, 0.2669013, 0.1189891, 0, 0, 0, 1, 1,
0.07975808, -1.423229, 3.550822, 0, 0, 0, 1, 1,
0.08199541, -0.3908393, 3.493062, 0, 0, 0, 1, 1,
0.08242016, 0.3355588, 0.01068496, 0, 0, 0, 1, 1,
0.08267758, 0.0119856, 2.161561, 0, 0, 0, 1, 1,
0.09043825, -1.810387, 3.031741, 0, 0, 0, 1, 1,
0.09133977, -0.4882132, 3.465515, 1, 1, 1, 1, 1,
0.09208147, 0.006630071, -0.05166509, 1, 1, 1, 1, 1,
0.09287158, 0.7475049, 1.744758, 1, 1, 1, 1, 1,
0.09844858, 0.551573, 0.1511958, 1, 1, 1, 1, 1,
0.1004813, -2.309327, 3.911017, 1, 1, 1, 1, 1,
0.1101682, 1.030172, 1.191327, 1, 1, 1, 1, 1,
0.1131119, 0.8364053, 0.6080239, 1, 1, 1, 1, 1,
0.1160309, 0.7905141, -0.5993443, 1, 1, 1, 1, 1,
0.1180873, 2.664305, 0.4788693, 1, 1, 1, 1, 1,
0.1200946, 1.515635, 0.1477322, 1, 1, 1, 1, 1,
0.1215656, -0.2032606, 4.035774, 1, 1, 1, 1, 1,
0.1215993, -1.033419, 1.351333, 1, 1, 1, 1, 1,
0.1216604, 0.3119071, 2.230988, 1, 1, 1, 1, 1,
0.1249879, -1.389982, 3.056405, 1, 1, 1, 1, 1,
0.1331803, 0.383721, -0.6479474, 1, 1, 1, 1, 1,
0.1366986, 0.7130641, -0.106346, 0, 0, 1, 1, 1,
0.1371495, 0.1686621, 1.250671, 1, 0, 0, 1, 1,
0.1399924, 0.0490959, 3.480839, 1, 0, 0, 1, 1,
0.1413186, 0.2735476, 0.708699, 1, 0, 0, 1, 1,
0.1413943, -0.1970642, 3.247645, 1, 0, 0, 1, 1,
0.141621, -0.7783474, 2.589775, 1, 0, 0, 1, 1,
0.1426591, -0.7678462, 2.529133, 0, 0, 0, 1, 1,
0.1433117, 0.3586906, 0.2002983, 0, 0, 0, 1, 1,
0.1496824, -0.1489792, 2.774544, 0, 0, 0, 1, 1,
0.1559685, -1.183027, 2.478499, 0, 0, 0, 1, 1,
0.1615959, -0.7844287, 3.47438, 0, 0, 0, 1, 1,
0.1616238, -1.184636, 2.508453, 0, 0, 0, 1, 1,
0.1672605, 1.720467, -0.1457705, 0, 0, 0, 1, 1,
0.1702338, -0.5440711, 4.851943, 1, 1, 1, 1, 1,
0.172895, -0.7650527, 4.414669, 1, 1, 1, 1, 1,
0.1774699, 0.5472457, -0.2892576, 1, 1, 1, 1, 1,
0.1794959, -0.5424687, 1.660968, 1, 1, 1, 1, 1,
0.1820773, 0.8546384, 0.6649762, 1, 1, 1, 1, 1,
0.1882813, 0.151566, 1.211408, 1, 1, 1, 1, 1,
0.1894939, 0.4086336, -0.1443884, 1, 1, 1, 1, 1,
0.1908269, 1.137318, 0.611953, 1, 1, 1, 1, 1,
0.1932137, -0.691134, 4.614695, 1, 1, 1, 1, 1,
0.194234, -1.170526, 2.874437, 1, 1, 1, 1, 1,
0.2057595, 0.8130706, 2.24754, 1, 1, 1, 1, 1,
0.2087553, -1.191846, 1.621307, 1, 1, 1, 1, 1,
0.220929, 0.2466907, 1.455649, 1, 1, 1, 1, 1,
0.2236055, 0.7140363, 0.2663867, 1, 1, 1, 1, 1,
0.2252146, 0.2195582, -0.2637413, 1, 1, 1, 1, 1,
0.225702, 0.6435435, -0.5321196, 0, 0, 1, 1, 1,
0.2267118, -1.137631, 2.58223, 1, 0, 0, 1, 1,
0.2298593, 0.2447119, -0.04445773, 1, 0, 0, 1, 1,
0.2334808, 0.1627004, 1.069103, 1, 0, 0, 1, 1,
0.234121, -0.2291138, 2.617404, 1, 0, 0, 1, 1,
0.2368952, 0.02684965, 0.1625101, 1, 0, 0, 1, 1,
0.2391281, -0.5760362, 2.994656, 0, 0, 0, 1, 1,
0.2392327, -0.2193117, 2.990399, 0, 0, 0, 1, 1,
0.24151, -1.207255, 3.981005, 0, 0, 0, 1, 1,
0.2434008, 0.1970094, 1.871489, 0, 0, 0, 1, 1,
0.2475236, 0.7331298, -0.2888569, 0, 0, 0, 1, 1,
0.2479288, 0.2807326, 1.173436, 0, 0, 0, 1, 1,
0.2493009, -0.8211357, 3.614132, 0, 0, 0, 1, 1,
0.2518975, 0.4531694, 0.7671149, 1, 1, 1, 1, 1,
0.2603808, 0.402108, 0.334254, 1, 1, 1, 1, 1,
0.2625075, 0.652408, 1.703559, 1, 1, 1, 1, 1,
0.2659886, 0.07425913, 1.007535, 1, 1, 1, 1, 1,
0.2667278, -1.150142, 2.218995, 1, 1, 1, 1, 1,
0.26779, 0.7046447, -0.2350485, 1, 1, 1, 1, 1,
0.2732369, -0.2310576, 3.217086, 1, 1, 1, 1, 1,
0.2745612, 1.513249, 0.3305314, 1, 1, 1, 1, 1,
0.2777801, -0.60898, 3.835768, 1, 1, 1, 1, 1,
0.2802641, 0.8882434, 2.366158, 1, 1, 1, 1, 1,
0.2821064, 0.2780322, 1.305532, 1, 1, 1, 1, 1,
0.2838325, -0.2125273, 0.1998151, 1, 1, 1, 1, 1,
0.2866832, 0.8072895, -1.021095, 1, 1, 1, 1, 1,
0.2885283, -0.2646306, 2.005815, 1, 1, 1, 1, 1,
0.2894956, -0.09647534, 1.709022, 1, 1, 1, 1, 1,
0.2941779, 0.5069306, 0.1060121, 0, 0, 1, 1, 1,
0.2947597, -0.1877059, 1.62011, 1, 0, 0, 1, 1,
0.3067175, 1.887985, -0.4929425, 1, 0, 0, 1, 1,
0.3076616, 0.4412754, 0.3515288, 1, 0, 0, 1, 1,
0.3096801, 1.223785, 2.258744, 1, 0, 0, 1, 1,
0.3141327, -0.06273792, 2.03795, 1, 0, 0, 1, 1,
0.3179051, -0.2346783, 2.891829, 0, 0, 0, 1, 1,
0.3207273, 0.9566784, 0.6911168, 0, 0, 0, 1, 1,
0.3220563, -0.8869833, 2.314248, 0, 0, 0, 1, 1,
0.3228034, -1.866861, 1.814473, 0, 0, 0, 1, 1,
0.3249587, 0.7256131, 0.4932947, 0, 0, 0, 1, 1,
0.3256256, 0.5271198, 1.998084, 0, 0, 0, 1, 1,
0.3265807, 0.0585863, 0.5178604, 0, 0, 0, 1, 1,
0.3324387, 1.142446, 0.9679027, 1, 1, 1, 1, 1,
0.3328622, 1.27589, 1.409131, 1, 1, 1, 1, 1,
0.3338948, -1.004338, 4.817357, 1, 1, 1, 1, 1,
0.3366225, 0.6286328, 1.201676, 1, 1, 1, 1, 1,
0.3475786, 0.9302095, -0.1886758, 1, 1, 1, 1, 1,
0.3486558, 1.059764, -0.05244896, 1, 1, 1, 1, 1,
0.3491229, -0.05291257, 3.622049, 1, 1, 1, 1, 1,
0.3494651, -0.365067, 1.833865, 1, 1, 1, 1, 1,
0.3507017, -0.4805576, 2.939094, 1, 1, 1, 1, 1,
0.3555724, -0.5953022, 1.424275, 1, 1, 1, 1, 1,
0.3617513, 0.678288, 0.7924193, 1, 1, 1, 1, 1,
0.3645859, 0.100544, 3.573722, 1, 1, 1, 1, 1,
0.3650706, 0.3802484, 1.510725, 1, 1, 1, 1, 1,
0.3651537, 0.2035369, 2.446123, 1, 1, 1, 1, 1,
0.365626, 0.2547979, 2.024721, 1, 1, 1, 1, 1,
0.3658812, 0.2033121, 0.7061167, 0, 0, 1, 1, 1,
0.3665487, 0.7842866, 0.2852021, 1, 0, 0, 1, 1,
0.3698878, 1.005819, 2.44385, 1, 0, 0, 1, 1,
0.3773881, -0.4381709, 1.566321, 1, 0, 0, 1, 1,
0.380727, -1.503677, 3.378527, 1, 0, 0, 1, 1,
0.3841155, 0.3859614, 2.226958, 1, 0, 0, 1, 1,
0.3845286, 0.6558989, 1.983238, 0, 0, 0, 1, 1,
0.3850026, -1.180107, 2.278933, 0, 0, 0, 1, 1,
0.387307, 0.2183463, 0.2590534, 0, 0, 0, 1, 1,
0.3880769, -1.161111, 3.096181, 0, 0, 0, 1, 1,
0.3963085, -0.6699902, 2.249361, 0, 0, 0, 1, 1,
0.3970743, 1.698453, -0.4487216, 0, 0, 0, 1, 1,
0.3970867, -1.76244, 4.854867, 0, 0, 0, 1, 1,
0.4050471, -1.192634, 0.8618017, 1, 1, 1, 1, 1,
0.4065799, 0.5528113, -0.1854858, 1, 1, 1, 1, 1,
0.4117725, 0.6919616, -0.849134, 1, 1, 1, 1, 1,
0.4123486, 0.9102847, 1.950243, 1, 1, 1, 1, 1,
0.4150681, 1.054276, -0.1595803, 1, 1, 1, 1, 1,
0.4177616, 1.924697, 1.080044, 1, 1, 1, 1, 1,
0.4230281, 1.79598, 0.02542136, 1, 1, 1, 1, 1,
0.4244245, -1.853478, 2.403543, 1, 1, 1, 1, 1,
0.424626, 1.460961, 0.2335437, 1, 1, 1, 1, 1,
0.4335316, 1.295782, 2.798424, 1, 1, 1, 1, 1,
0.4347467, 1.271926, -0.5981433, 1, 1, 1, 1, 1,
0.435925, -0.8702154, 3.258281, 1, 1, 1, 1, 1,
0.4376699, 0.4263572, 1.3451, 1, 1, 1, 1, 1,
0.4379518, -0.2226498, 2.364867, 1, 1, 1, 1, 1,
0.4408198, -0.1053912, 2.787701, 1, 1, 1, 1, 1,
0.4420628, 0.3401508, 1.66947, 0, 0, 1, 1, 1,
0.4442946, -0.6334186, 3.094828, 1, 0, 0, 1, 1,
0.4445496, -1.164939, 3.764071, 1, 0, 0, 1, 1,
0.4454627, 0.2803111, -0.3369329, 1, 0, 0, 1, 1,
0.4573091, 1.334232, -0.6396502, 1, 0, 0, 1, 1,
0.4585653, 0.7835757, 1.497286, 1, 0, 0, 1, 1,
0.4602783, -0.2507011, 1.878189, 0, 0, 0, 1, 1,
0.4606471, -1.572936, 2.410655, 0, 0, 0, 1, 1,
0.4635437, 0.211348, 1.354732, 0, 0, 0, 1, 1,
0.467565, -1.501768, 1.818053, 0, 0, 0, 1, 1,
0.4738605, 1.708926, 1.080942, 0, 0, 0, 1, 1,
0.4826198, 0.06221228, 2.36017, 0, 0, 0, 1, 1,
0.4826396, -0.9057024, 2.163381, 0, 0, 0, 1, 1,
0.4842197, 0.9602131, -0.8529602, 1, 1, 1, 1, 1,
0.4858437, -0.3522584, 1.378034, 1, 1, 1, 1, 1,
0.4873437, -1.43932, 3.085558, 1, 1, 1, 1, 1,
0.4962726, -0.7743806, 1.786216, 1, 1, 1, 1, 1,
0.4986157, -0.004583559, 1.470758, 1, 1, 1, 1, 1,
0.5001064, -0.6840966, 2.794739, 1, 1, 1, 1, 1,
0.5028893, 1.657461, -0.9590516, 1, 1, 1, 1, 1,
0.5040038, 0.6636592, 0.08048392, 1, 1, 1, 1, 1,
0.5042906, -1.291084, 2.045133, 1, 1, 1, 1, 1,
0.5049646, -1.193978, 3.88751, 1, 1, 1, 1, 1,
0.5060852, -0.7167975, 1.770502, 1, 1, 1, 1, 1,
0.5078771, 0.8927373, 0.7867684, 1, 1, 1, 1, 1,
0.5082321, 1.982877, 0.6728659, 1, 1, 1, 1, 1,
0.5148311, 0.8861218, -0.3100902, 1, 1, 1, 1, 1,
0.5170186, 0.2684727, 1.298206, 1, 1, 1, 1, 1,
0.5188942, 0.07850226, 2.338879, 0, 0, 1, 1, 1,
0.5242046, 0.139983, 1.680784, 1, 0, 0, 1, 1,
0.524632, 0.993347, -0.9502096, 1, 0, 0, 1, 1,
0.5297549, -0.6353304, 4.290436, 1, 0, 0, 1, 1,
0.5373435, 0.3576193, 0.6174373, 1, 0, 0, 1, 1,
0.5379952, -0.719696, 2.832928, 1, 0, 0, 1, 1,
0.544727, 0.07551178, 1.376793, 0, 0, 0, 1, 1,
0.544848, -0.2510459, 1.019299, 0, 0, 0, 1, 1,
0.5496402, 0.07383497, 1.588842, 0, 0, 0, 1, 1,
0.5559726, -1.443001, 2.498372, 0, 0, 0, 1, 1,
0.5569373, -1.58625, 3.940921, 0, 0, 0, 1, 1,
0.5579858, 0.7842926, 1.058086, 0, 0, 0, 1, 1,
0.5647435, -0.8603601, 3.331776, 0, 0, 0, 1, 1,
0.5716181, -0.9533914, 3.241359, 1, 1, 1, 1, 1,
0.5730276, -0.704574, 2.876925, 1, 1, 1, 1, 1,
0.5737255, 0.1192504, 0.8104045, 1, 1, 1, 1, 1,
0.574864, -1.575425, 2.087019, 1, 1, 1, 1, 1,
0.587209, 0.609179, 0.9512855, 1, 1, 1, 1, 1,
0.5935858, -0.01184388, 3.581988, 1, 1, 1, 1, 1,
0.6051595, -1.634453, 1.517565, 1, 1, 1, 1, 1,
0.6052198, -1.416736, 2.757386, 1, 1, 1, 1, 1,
0.605312, 1.384492, 2.754243, 1, 1, 1, 1, 1,
0.6059485, -0.5593674, 2.536028, 1, 1, 1, 1, 1,
0.607689, 0.8680122, 0.9131976, 1, 1, 1, 1, 1,
0.6089534, -0.7760921, 2.266711, 1, 1, 1, 1, 1,
0.6097423, -0.395806, 2.046802, 1, 1, 1, 1, 1,
0.6131861, -1.185147, 2.530485, 1, 1, 1, 1, 1,
0.6133194, 0.2763901, 0.6119936, 1, 1, 1, 1, 1,
0.6179184, 1.211264, 0.01461555, 0, 0, 1, 1, 1,
0.6204403, -1.070119, 4.841084, 1, 0, 0, 1, 1,
0.6239035, -1.982902, 2.250151, 1, 0, 0, 1, 1,
0.6249498, -0.798069, 2.406834, 1, 0, 0, 1, 1,
0.6276118, 0.2021048, 1.435192, 1, 0, 0, 1, 1,
0.6279473, -0.6100011, 2.191256, 1, 0, 0, 1, 1,
0.629728, 0.4611195, 2.331817, 0, 0, 0, 1, 1,
0.638764, 0.0336873, 1.142256, 0, 0, 0, 1, 1,
0.6402249, 1.087049, -0.3269362, 0, 0, 0, 1, 1,
0.6414769, -0.5692415, 3.035453, 0, 0, 0, 1, 1,
0.6435385, 0.9199895, 0.5784369, 0, 0, 0, 1, 1,
0.6443994, 0.3927144, 2.245122, 0, 0, 0, 1, 1,
0.6447939, -0.5861044, 2.441231, 0, 0, 0, 1, 1,
0.6451693, -1.00612, 3.488218, 1, 1, 1, 1, 1,
0.6472664, -1.174728, 2.030662, 1, 1, 1, 1, 1,
0.653093, -0.1532922, 2.077239, 1, 1, 1, 1, 1,
0.6542405, 0.1651484, 1.256307, 1, 1, 1, 1, 1,
0.6599376, 0.9091858, -0.5120912, 1, 1, 1, 1, 1,
0.6642709, -1.946854, 1.24697, 1, 1, 1, 1, 1,
0.6703619, 0.2814629, 2.612082, 1, 1, 1, 1, 1,
0.6710537, -1.42862, 2.989995, 1, 1, 1, 1, 1,
0.6715665, 0.2887839, 1.296664, 1, 1, 1, 1, 1,
0.6767035, -1.512192, 2.461859, 1, 1, 1, 1, 1,
0.6767454, 0.8821703, -0.409384, 1, 1, 1, 1, 1,
0.6772964, -0.8969749, 1.700911, 1, 1, 1, 1, 1,
0.6819499, -0.9104114, 2.60966, 1, 1, 1, 1, 1,
0.685377, 0.7089888, 2.25137, 1, 1, 1, 1, 1,
0.6864405, 0.4492739, 1.613482, 1, 1, 1, 1, 1,
0.6874613, 1.221033, 0.4999007, 0, 0, 1, 1, 1,
0.689218, 1.145762, 0.491457, 1, 0, 0, 1, 1,
0.6910012, -0.08109597, 1.864572, 1, 0, 0, 1, 1,
0.6949316, 1.141983, 0.61218, 1, 0, 0, 1, 1,
0.6963457, -0.1698753, 1.601907, 1, 0, 0, 1, 1,
0.6978515, -0.3455994, 1.21838, 1, 0, 0, 1, 1,
0.6992163, -0.192172, 1.067197, 0, 0, 0, 1, 1,
0.7000028, -0.3776926, 0.9608184, 0, 0, 0, 1, 1,
0.703217, 0.6481017, 0.2875639, 0, 0, 0, 1, 1,
0.7040453, 0.1174466, 0.5791048, 0, 0, 0, 1, 1,
0.7307444, -0.1595724, 2.055366, 0, 0, 0, 1, 1,
0.7441097, 1.364732, -0.35786, 0, 0, 0, 1, 1,
0.7489783, -1.191528, 1.601933, 0, 0, 0, 1, 1,
0.7520336, 0.2772248, -0.6101605, 1, 1, 1, 1, 1,
0.7570366, 0.1116317, 2.142403, 1, 1, 1, 1, 1,
0.7580558, -0.7208796, 2.445552, 1, 1, 1, 1, 1,
0.7598639, 1.024063, 0.03436182, 1, 1, 1, 1, 1,
0.7599548, 0.5016593, 0.5357775, 1, 1, 1, 1, 1,
0.7609575, -0.713299, 2.964942, 1, 1, 1, 1, 1,
0.7641804, -0.9506021, 3.425137, 1, 1, 1, 1, 1,
0.7674268, -0.2965536, 0.7657498, 1, 1, 1, 1, 1,
0.7730328, -0.1961071, 2.082422, 1, 1, 1, 1, 1,
0.7731544, -0.3656361, 1.17635, 1, 1, 1, 1, 1,
0.7738821, -1.621247, 4.837312, 1, 1, 1, 1, 1,
0.7742267, -0.5664344, 1.828773, 1, 1, 1, 1, 1,
0.7744873, -1.429799, 3.376707, 1, 1, 1, 1, 1,
0.7780569, 1.092, -0.2801224, 1, 1, 1, 1, 1,
0.7790028, -0.1871042, 2.29973, 1, 1, 1, 1, 1,
0.7838981, 1.413993, -1.068134, 0, 0, 1, 1, 1,
0.7845884, -0.4230713, 2.198049, 1, 0, 0, 1, 1,
0.7849348, 0.1626516, 0.5206054, 1, 0, 0, 1, 1,
0.7871374, -0.4566202, 2.203101, 1, 0, 0, 1, 1,
0.7895485, 0.03657717, 1.039708, 1, 0, 0, 1, 1,
0.7917581, 0.143966, 2.996927, 1, 0, 0, 1, 1,
0.8035748, -0.8522311, 1.26965, 0, 0, 0, 1, 1,
0.8041381, 0.474367, 2.233799, 0, 0, 0, 1, 1,
0.8119987, 0.7151204, 0.3098592, 0, 0, 0, 1, 1,
0.8130826, -1.003219, 2.446975, 0, 0, 0, 1, 1,
0.8154684, 0.309214, 0.6353207, 0, 0, 0, 1, 1,
0.8167359, 1.083464, -0.2735736, 0, 0, 0, 1, 1,
0.8176553, 1.925736, 0.03681429, 0, 0, 0, 1, 1,
0.8230445, 0.7247688, 0.7969061, 1, 1, 1, 1, 1,
0.8283597, 1.139684, -0.8674346, 1, 1, 1, 1, 1,
0.8293722, -1.606306, 2.927809, 1, 1, 1, 1, 1,
0.8356315, 0.05472799, 0.2447102, 1, 1, 1, 1, 1,
0.8392388, -1.363472, 2.640064, 1, 1, 1, 1, 1,
0.8437939, -0.836086, 2.39939, 1, 1, 1, 1, 1,
0.846085, 0.06967095, 1.192806, 1, 1, 1, 1, 1,
0.8480787, 1.425418, 0.2193983, 1, 1, 1, 1, 1,
0.8494612, -1.558799, 1.047984, 1, 1, 1, 1, 1,
0.8521897, -0.7082842, 2.915484, 1, 1, 1, 1, 1,
0.8574877, -0.7511005, 2.381891, 1, 1, 1, 1, 1,
0.8589973, 0.09182163, 1.855827, 1, 1, 1, 1, 1,
0.863783, -0.5222391, 1.128223, 1, 1, 1, 1, 1,
0.8644279, 0.3823271, -0.6220375, 1, 1, 1, 1, 1,
0.8682119, -1.54663, 1.979935, 1, 1, 1, 1, 1,
0.8726422, 0.8685256, 1.242788, 0, 0, 1, 1, 1,
0.8728409, -1.097422, 1.489113, 1, 0, 0, 1, 1,
0.8750491, -0.7484825, 2.572427, 1, 0, 0, 1, 1,
0.8767751, -1.181551, 3.066214, 1, 0, 0, 1, 1,
0.9036081, -0.1828485, 1.207153, 1, 0, 0, 1, 1,
0.903659, 0.4124247, 0.6190766, 1, 0, 0, 1, 1,
0.9055044, 0.6606149, 0.8411173, 0, 0, 0, 1, 1,
0.9064612, -0.2778915, 1.037924, 0, 0, 0, 1, 1,
0.9155766, -1.009086, 0.4132213, 0, 0, 0, 1, 1,
0.9202938, 0.03996965, 2.087045, 0, 0, 0, 1, 1,
0.9217184, -1.05751, 2.438456, 0, 0, 0, 1, 1,
0.9218896, 0.2940791, -0.17819, 0, 0, 0, 1, 1,
0.9235005, -0.09114285, 3.790998, 0, 0, 0, 1, 1,
0.9337105, -0.005056573, 2.836392, 1, 1, 1, 1, 1,
0.9340785, -0.6145461, 4.207759, 1, 1, 1, 1, 1,
0.93604, -0.3657041, 2.367609, 1, 1, 1, 1, 1,
0.9393416, -0.3514642, 1.11983, 1, 1, 1, 1, 1,
0.9410288, -0.1310341, 3.010286, 1, 1, 1, 1, 1,
0.9457766, 0.4380392, -1.110456, 1, 1, 1, 1, 1,
0.9599795, -1.633551, 3.227261, 1, 1, 1, 1, 1,
0.9612667, -0.7718126, 1.02174, 1, 1, 1, 1, 1,
0.9635332, 0.1112859, 2.166114, 1, 1, 1, 1, 1,
0.970903, -1.303153, 1.703961, 1, 1, 1, 1, 1,
0.9740884, 1.512487, 0.3487455, 1, 1, 1, 1, 1,
0.9799294, -0.4800881, 1.367339, 1, 1, 1, 1, 1,
0.9832596, 0.005004736, 1.432859, 1, 1, 1, 1, 1,
0.9898888, 0.8629515, 1.250945, 1, 1, 1, 1, 1,
0.9988394, 1.853115, -0.4269397, 1, 1, 1, 1, 1,
0.999528, 1.027931, -0.4361531, 0, 0, 1, 1, 1,
1.013425, 0.967038, 0.02630141, 1, 0, 0, 1, 1,
1.01453, 0.1636693, 1.962034, 1, 0, 0, 1, 1,
1.019277, 0.6449794, 1.401124, 1, 0, 0, 1, 1,
1.0283, 0.5423039, 1.572008, 1, 0, 0, 1, 1,
1.038592, -0.02743929, 2.035907, 1, 0, 0, 1, 1,
1.040674, -1.042977, 1.876482, 0, 0, 0, 1, 1,
1.050062, 0.1265039, 2.74187, 0, 0, 0, 1, 1,
1.051081, -0.9125032, 2.901966, 0, 0, 0, 1, 1,
1.054583, -1.228276, 1.817414, 0, 0, 0, 1, 1,
1.067751, -0.5288817, 1.754756, 0, 0, 0, 1, 1,
1.068749, 0.608776, 0.6366254, 0, 0, 0, 1, 1,
1.071822, -0.1455889, 0.8353319, 0, 0, 0, 1, 1,
1.076195, -0.04078287, 0.5950965, 1, 1, 1, 1, 1,
1.080238, -0.5405092, 3.554206, 1, 1, 1, 1, 1,
1.085167, -0.1858962, 2.565909, 1, 1, 1, 1, 1,
1.086136, -0.3693112, 2.116701, 1, 1, 1, 1, 1,
1.089, -0.4243843, 2.407318, 1, 1, 1, 1, 1,
1.089099, 0.3685295, -0.1059198, 1, 1, 1, 1, 1,
1.096821, 0.7563953, 1.577822, 1, 1, 1, 1, 1,
1.097209, -0.6828853, 3.184494, 1, 1, 1, 1, 1,
1.100309, -0.5946831, 1.925106, 1, 1, 1, 1, 1,
1.104142, -0.9567694, 2.006997, 1, 1, 1, 1, 1,
1.116862, -1.196598, 1.695369, 1, 1, 1, 1, 1,
1.119668, -0.1785537, 3.625212, 1, 1, 1, 1, 1,
1.13216, -2.29603, 3.974982, 1, 1, 1, 1, 1,
1.143531, -0.7806844, 2.402251, 1, 1, 1, 1, 1,
1.151142, -0.3257485, 0.9951272, 1, 1, 1, 1, 1,
1.155171, 1.217607, 0.1259286, 0, 0, 1, 1, 1,
1.158115, -0.7652731, 1.432218, 1, 0, 0, 1, 1,
1.166849, -0.6075443, 2.206563, 1, 0, 0, 1, 1,
1.169304, 1.596667, -1.095962, 1, 0, 0, 1, 1,
1.17173, 0.2578105, -0.8109952, 1, 0, 0, 1, 1,
1.172074, -0.9074333, 5.389907, 1, 0, 0, 1, 1,
1.178826, -1.259664, 1.138242, 0, 0, 0, 1, 1,
1.183289, 0.5665336, 2.712482, 0, 0, 0, 1, 1,
1.186839, -1.424699, 3.492102, 0, 0, 0, 1, 1,
1.188999, 0.4996054, 0.07318199, 0, 0, 0, 1, 1,
1.197973, 0.3121834, 0.5482231, 0, 0, 0, 1, 1,
1.201222, -0.4945185, 1.18583, 0, 0, 0, 1, 1,
1.202621, 0.8130873, 2.163689, 0, 0, 0, 1, 1,
1.210901, 0.9433728, 1.206887, 1, 1, 1, 1, 1,
1.21292, -0.9517149, 2.577153, 1, 1, 1, 1, 1,
1.215948, -1.89525, 3.011271, 1, 1, 1, 1, 1,
1.22005, 1.424598, 0.6619868, 1, 1, 1, 1, 1,
1.220941, -0.001823128, 0.4887417, 1, 1, 1, 1, 1,
1.221055, 0.08632118, 2.306028, 1, 1, 1, 1, 1,
1.223187, 1.204632, -0.9975946, 1, 1, 1, 1, 1,
1.226909, -1.335768, 2.087828, 1, 1, 1, 1, 1,
1.227142, -0.002449044, 2.331069, 1, 1, 1, 1, 1,
1.231483, 0.01855626, 1.378, 1, 1, 1, 1, 1,
1.247181, 0.7276573, 0.7730117, 1, 1, 1, 1, 1,
1.248276, 2.056936, 0.3299688, 1, 1, 1, 1, 1,
1.265152, 0.8555523, 1.231016, 1, 1, 1, 1, 1,
1.27808, -2.07586, 2.760569, 1, 1, 1, 1, 1,
1.298446, -0.5302483, 2.601682, 1, 1, 1, 1, 1,
1.299054, 1.20151, -0.3277875, 0, 0, 1, 1, 1,
1.302871, 0.179915, 2.221532, 1, 0, 0, 1, 1,
1.30415, 0.9327322, 0.9249082, 1, 0, 0, 1, 1,
1.315689, 0.860251, 0.6805794, 1, 0, 0, 1, 1,
1.325567, -2.518892, 2.83357, 1, 0, 0, 1, 1,
1.331037, -0.06401984, 2.657454, 1, 0, 0, 1, 1,
1.333262, -1.627534, 3.372232, 0, 0, 0, 1, 1,
1.337106, -0.2493926, 0.9243051, 0, 0, 0, 1, 1,
1.362233, -0.4317364, 4.0993, 0, 0, 0, 1, 1,
1.364773, 0.7993568, 0.5523247, 0, 0, 0, 1, 1,
1.3763, -1.245777, 1.889544, 0, 0, 0, 1, 1,
1.378649, -0.2697132, 1.777082, 0, 0, 0, 1, 1,
1.383446, 1.389028, 0.1468258, 0, 0, 0, 1, 1,
1.384762, -1.359189, 0.9837279, 1, 1, 1, 1, 1,
1.388172, -0.5984992, 2.387592, 1, 1, 1, 1, 1,
1.398279, -0.04718256, 0.835535, 1, 1, 1, 1, 1,
1.421361, 0.2039493, 0.9939086, 1, 1, 1, 1, 1,
1.4235, 0.316489, 2.772163, 1, 1, 1, 1, 1,
1.425391, 1.763863, 0.9156096, 1, 1, 1, 1, 1,
1.43883, 1.427126, 0.1370373, 1, 1, 1, 1, 1,
1.448416, -2.23616, 3.667119, 1, 1, 1, 1, 1,
1.451026, -1.842296, 0.2617377, 1, 1, 1, 1, 1,
1.457162, 1.080865, 0.3952032, 1, 1, 1, 1, 1,
1.460905, -0.3398973, 2.844761, 1, 1, 1, 1, 1,
1.4621, -0.7342228, 2.611674, 1, 1, 1, 1, 1,
1.464834, 0.8600791, 2.824416, 1, 1, 1, 1, 1,
1.473703, -0.1392521, 0.08382669, 1, 1, 1, 1, 1,
1.485843, 0.5529553, 1.810699, 1, 1, 1, 1, 1,
1.499432, -0.4486685, 3.445516, 0, 0, 1, 1, 1,
1.501366, -1.509129, 2.580268, 1, 0, 0, 1, 1,
1.505157, -0.4004772, 1.707092, 1, 0, 0, 1, 1,
1.516354, 0.07456384, 1.171723, 1, 0, 0, 1, 1,
1.523893, -1.306045, 3.233931, 1, 0, 0, 1, 1,
1.524083, -0.4027674, 2.328039, 1, 0, 0, 1, 1,
1.544406, -1.385737, 4.014268, 0, 0, 0, 1, 1,
1.545065, 1.062221, 1.828209, 0, 0, 0, 1, 1,
1.553622, 0.7122962, 0.9643191, 0, 0, 0, 1, 1,
1.553968, 0.3520252, 2.066167, 0, 0, 0, 1, 1,
1.556827, -0.5848487, 2.708487, 0, 0, 0, 1, 1,
1.56696, 0.2200645, 0.1010455, 0, 0, 0, 1, 1,
1.567053, 0.237587, 1.420373, 0, 0, 0, 1, 1,
1.568149, 1.01386, 0.6393273, 1, 1, 1, 1, 1,
1.574121, -1.483637, 2.805623, 1, 1, 1, 1, 1,
1.580852, 1.007496, -0.4312312, 1, 1, 1, 1, 1,
1.584639, -0.06007732, 1.31627, 1, 1, 1, 1, 1,
1.585264, 1.435655, 1.165688, 1, 1, 1, 1, 1,
1.59203, 0.3141713, 1.994782, 1, 1, 1, 1, 1,
1.599381, -0.02946915, 0.6772369, 1, 1, 1, 1, 1,
1.605309, -1.306139, 0.8871041, 1, 1, 1, 1, 1,
1.613595, 1.450706, 2.708898, 1, 1, 1, 1, 1,
1.621794, 0.5204347, 1.467306, 1, 1, 1, 1, 1,
1.646205, -1.199122, 3.106719, 1, 1, 1, 1, 1,
1.660429, -2.029723, 1.0172, 1, 1, 1, 1, 1,
1.663822, 0.7840318, 0.489758, 1, 1, 1, 1, 1,
1.666541, -0.2860734, 2.610617, 1, 1, 1, 1, 1,
1.683725, 0.3471625, 1.147704, 1, 1, 1, 1, 1,
1.721063, 1.729164, -0.6393999, 0, 0, 1, 1, 1,
1.732139, 0.9624201, 0.7002949, 1, 0, 0, 1, 1,
1.73262, 0.03828032, 2.043028, 1, 0, 0, 1, 1,
1.741319, 0.2483949, 2.464856, 1, 0, 0, 1, 1,
1.753787, -0.9831843, 1.041835, 1, 0, 0, 1, 1,
1.756572, -0.1430816, 0.7317544, 1, 0, 0, 1, 1,
1.778296, 0.5632618, 1.312181, 0, 0, 0, 1, 1,
1.780199, 0.08441167, 2.583045, 0, 0, 0, 1, 1,
1.780274, -1.802531, 1.950227, 0, 0, 0, 1, 1,
1.782593, -0.334072, 2.692282, 0, 0, 0, 1, 1,
1.788991, 0.632783, 0.05453781, 0, 0, 0, 1, 1,
1.808792, -0.7480668, 1.849549, 0, 0, 0, 1, 1,
1.817493, -0.08166596, 1.197606, 0, 0, 0, 1, 1,
1.843604, -0.8197608, 0.6245605, 1, 1, 1, 1, 1,
1.857604, 0.4547081, 0.2822893, 1, 1, 1, 1, 1,
1.878232, 1.284131, 2.867986, 1, 1, 1, 1, 1,
1.880684, -1.536234, 3.750306, 1, 1, 1, 1, 1,
1.90204, 0.8391178, 1.575756, 1, 1, 1, 1, 1,
1.92102, -0.1136959, 1.720851, 1, 1, 1, 1, 1,
1.929671, 0.7145751, 0.06467254, 1, 1, 1, 1, 1,
1.956248, -0.7526299, 3.55867, 1, 1, 1, 1, 1,
1.957045, -0.1475259, 3.042551, 1, 1, 1, 1, 1,
1.993878, 0.52147, 1.311932, 1, 1, 1, 1, 1,
2.016314, 0.08836691, 1.286462, 1, 1, 1, 1, 1,
2.017642, -0.5623233, 2.288196, 1, 1, 1, 1, 1,
2.031573, 0.5523087, 1.803362, 1, 1, 1, 1, 1,
2.040257, 0.6550518, 3.22, 1, 1, 1, 1, 1,
2.083478, -0.8783903, 1.511096, 1, 1, 1, 1, 1,
2.112814, 0.5149284, 1.554855, 0, 0, 1, 1, 1,
2.158938, 0.8214189, 0.5629508, 1, 0, 0, 1, 1,
2.166774, -0.2855611, 1.388263, 1, 0, 0, 1, 1,
2.173118, 0.6594985, 1.440462, 1, 0, 0, 1, 1,
2.175693, -0.6240014, 3.158174, 1, 0, 0, 1, 1,
2.220779, -0.1739206, 1.458217, 1, 0, 0, 1, 1,
2.241527, -0.8903762, 0.7853038, 0, 0, 0, 1, 1,
2.243777, 0.7437341, 0.7257467, 0, 0, 0, 1, 1,
2.250099, 0.7983909, 1.109253, 0, 0, 0, 1, 1,
2.282929, -1.258552, 2.653207, 0, 0, 0, 1, 1,
2.303459, -0.2250715, 2.519318, 0, 0, 0, 1, 1,
2.323846, 1.28859, 1.035879, 0, 0, 0, 1, 1,
2.335055, -1.286132, 1.55763, 0, 0, 0, 1, 1,
2.34441, -2.601937, 3.514804, 1, 1, 1, 1, 1,
2.365535, -0.1233652, 1.012801, 1, 1, 1, 1, 1,
2.366172, -1.483249, 2.339498, 1, 1, 1, 1, 1,
2.389783, 2.75175, 1.469943, 1, 1, 1, 1, 1,
2.410845, -0.04317979, 1.297671, 1, 1, 1, 1, 1,
2.597877, 0.5205865, 0.7152851, 1, 1, 1, 1, 1,
2.986751, -2.078151, 1.435745, 1, 1, 1, 1, 1
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
var radius = 10.01171;
var distance = 35.1657;
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
mvMatrix.translate( 0.7850503, 0.1784835, 0.007142782 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.1657);
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
