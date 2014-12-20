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
-3.983143, 0.6892513, -1.951853, 1, 0, 0, 1,
-3.419729, 0.3641638, 0.2066254, 1, 0.007843138, 0, 1,
-3.299836, -1.043375, -2.538821, 1, 0.01176471, 0, 1,
-2.972108, -0.82288, -0.8959102, 1, 0.01960784, 0, 1,
-2.653629, -0.9681011, -3.483631, 1, 0.02352941, 0, 1,
-2.442612, 0.1019298, -2.867661, 1, 0.03137255, 0, 1,
-2.351993, -1.224191, -2.293342, 1, 0.03529412, 0, 1,
-2.320977, -0.6782407, -0.9519592, 1, 0.04313726, 0, 1,
-2.278904, -0.2658049, -1.506745, 1, 0.04705882, 0, 1,
-2.270721, -0.5182706, -1.999007, 1, 0.05490196, 0, 1,
-2.245576, 0.1885011, -1.584825, 1, 0.05882353, 0, 1,
-2.178097, -0.1931587, 0.7173784, 1, 0.06666667, 0, 1,
-2.158863, -0.3455345, -1.481743, 1, 0.07058824, 0, 1,
-2.137511, 0.01781803, -1.160696, 1, 0.07843138, 0, 1,
-2.04102, -0.6121224, -1.067619, 1, 0.08235294, 0, 1,
-2.027155, 1.911649, -0.07437115, 1, 0.09019608, 0, 1,
-2.021163, 0.07662895, -3.281839, 1, 0.09411765, 0, 1,
-1.974185, 0.0625449, -3.490879, 1, 0.1019608, 0, 1,
-1.965131, 0.7196551, -0.5052931, 1, 0.1098039, 0, 1,
-1.941848, 0.4940105, -0.3306704, 1, 0.1137255, 0, 1,
-1.914034, 1.042687, -2.660006, 1, 0.1215686, 0, 1,
-1.89618, 0.8635759, -1.163748, 1, 0.1254902, 0, 1,
-1.864998, -0.07533968, -2.556454, 1, 0.1333333, 0, 1,
-1.852727, -1.807099, -1.786304, 1, 0.1372549, 0, 1,
-1.836823, -1.025856, -2.032002, 1, 0.145098, 0, 1,
-1.833164, -1.175231, -3.715159, 1, 0.1490196, 0, 1,
-1.827583, 2.804151, -0.7418659, 1, 0.1568628, 0, 1,
-1.82366, -0.005550878, -1.736253, 1, 0.1607843, 0, 1,
-1.823099, -0.5613655, -2.230871, 1, 0.1686275, 0, 1,
-1.799425, 0.8461915, 0.1584719, 1, 0.172549, 0, 1,
-1.780291, 0.5663182, -2.063573, 1, 0.1803922, 0, 1,
-1.778069, -0.7537851, -1.959642, 1, 0.1843137, 0, 1,
-1.764447, 0.4102609, -2.113009, 1, 0.1921569, 0, 1,
-1.760099, -0.9286484, -2.379552, 1, 0.1960784, 0, 1,
-1.755051, -0.6759222, -2.097506, 1, 0.2039216, 0, 1,
-1.755038, 0.2978103, -1.144383, 1, 0.2117647, 0, 1,
-1.747816, -0.3126647, -2.683346, 1, 0.2156863, 0, 1,
-1.73015, -1.694928, -2.189053, 1, 0.2235294, 0, 1,
-1.716005, 0.5987719, -1.843567, 1, 0.227451, 0, 1,
-1.709163, 2.019247, 0.316033, 1, 0.2352941, 0, 1,
-1.690859, -0.2079862, -2.037899, 1, 0.2392157, 0, 1,
-1.689983, -0.465386, -2.351887, 1, 0.2470588, 0, 1,
-1.6878, -0.2231793, -0.8793537, 1, 0.2509804, 0, 1,
-1.659196, -1.149224, -2.144794, 1, 0.2588235, 0, 1,
-1.640432, 0.9630672, 0.2729567, 1, 0.2627451, 0, 1,
-1.640347, -0.4113454, -2.593151, 1, 0.2705882, 0, 1,
-1.637684, 0.02108871, -0.7859684, 1, 0.2745098, 0, 1,
-1.633945, 1.88757, -0.1876522, 1, 0.282353, 0, 1,
-1.633881, -1.274759, -3.264627, 1, 0.2862745, 0, 1,
-1.631454, -0.88368, -2.270044, 1, 0.2941177, 0, 1,
-1.62843, -0.3721485, -2.841807, 1, 0.3019608, 0, 1,
-1.617558, -0.2892355, -2.966647, 1, 0.3058824, 0, 1,
-1.616912, -0.3882749, -2.03681, 1, 0.3137255, 0, 1,
-1.613191, 0.8086677, 0.5029412, 1, 0.3176471, 0, 1,
-1.605339, 0.2973728, 0.3553027, 1, 0.3254902, 0, 1,
-1.592835, 0.4415154, -2.589379, 1, 0.3294118, 0, 1,
-1.585461, 0.7107496, -1.474791, 1, 0.3372549, 0, 1,
-1.584817, 0.02427647, -0.8715905, 1, 0.3411765, 0, 1,
-1.567349, 1.198066, -0.6090122, 1, 0.3490196, 0, 1,
-1.559267, 0.007404125, -0.9668044, 1, 0.3529412, 0, 1,
-1.554007, -0.1776003, -1.39961, 1, 0.3607843, 0, 1,
-1.544728, -0.6708646, -1.753556, 1, 0.3647059, 0, 1,
-1.543191, 1.102438, 0.3342793, 1, 0.372549, 0, 1,
-1.536898, 0.04456208, -0.5453822, 1, 0.3764706, 0, 1,
-1.536467, 0.3077024, -3.270241, 1, 0.3843137, 0, 1,
-1.534677, -1.617585, -3.087906, 1, 0.3882353, 0, 1,
-1.529112, -0.1455283, -0.9179137, 1, 0.3960784, 0, 1,
-1.524359, 0.09630998, -1.645382, 1, 0.4039216, 0, 1,
-1.52184, 0.08340664, -2.072492, 1, 0.4078431, 0, 1,
-1.521782, -0.3232935, -1.910089, 1, 0.4156863, 0, 1,
-1.513698, -0.4273077, -0.7676502, 1, 0.4196078, 0, 1,
-1.509415, -0.1324743, 0.8014449, 1, 0.427451, 0, 1,
-1.50049, -0.1562918, -1.455358, 1, 0.4313726, 0, 1,
-1.497695, 0.7410755, 0.3912117, 1, 0.4392157, 0, 1,
-1.46808, 2.08372, -0.141971, 1, 0.4431373, 0, 1,
-1.461724, 0.9886292, -2.651324, 1, 0.4509804, 0, 1,
-1.413211, -1.716717, -4.233276, 1, 0.454902, 0, 1,
-1.408207, 1.093372, 0.8122309, 1, 0.4627451, 0, 1,
-1.402638, 0.5466139, -1.216209, 1, 0.4666667, 0, 1,
-1.397514, 0.09611192, -1.623966, 1, 0.4745098, 0, 1,
-1.389429, -0.6283907, -2.177742, 1, 0.4784314, 0, 1,
-1.385604, -1.355768, -3.319122, 1, 0.4862745, 0, 1,
-1.377864, 0.7533082, -2.346738, 1, 0.4901961, 0, 1,
-1.37006, 0.3406505, -1.325408, 1, 0.4980392, 0, 1,
-1.367567, 0.2734781, -0.9202673, 1, 0.5058824, 0, 1,
-1.360471, 0.005093547, -3.207566, 1, 0.509804, 0, 1,
-1.357927, -2.540624, -2.664974, 1, 0.5176471, 0, 1,
-1.352861, -0.9589711, -2.473063, 1, 0.5215687, 0, 1,
-1.351419, -0.0831064, -2.173185, 1, 0.5294118, 0, 1,
-1.335566, -0.491079, -1.632458, 1, 0.5333334, 0, 1,
-1.325298, -0.7718121, -1.624392, 1, 0.5411765, 0, 1,
-1.319378, 0.2475576, -1.455131, 1, 0.5450981, 0, 1,
-1.317744, 0.9878857, -1.035106, 1, 0.5529412, 0, 1,
-1.316089, -0.667627, -1.852127, 1, 0.5568628, 0, 1,
-1.310479, -0.08693694, 0.08944474, 1, 0.5647059, 0, 1,
-1.310412, -0.216187, -1.447472, 1, 0.5686275, 0, 1,
-1.307747, 0.4181816, -1.21784, 1, 0.5764706, 0, 1,
-1.306778, -1.011781, -1.795669, 1, 0.5803922, 0, 1,
-1.306427, 0.2630765, -1.69146, 1, 0.5882353, 0, 1,
-1.298644, -0.1189028, -2.241934, 1, 0.5921569, 0, 1,
-1.298077, 0.8880607, -1.506975, 1, 0.6, 0, 1,
-1.288402, -0.02232199, -2.137578, 1, 0.6078432, 0, 1,
-1.284767, 0.0009766761, -1.520831, 1, 0.6117647, 0, 1,
-1.269222, 1.738431, -1.281066, 1, 0.6196079, 0, 1,
-1.267865, -1.323446, -2.564277, 1, 0.6235294, 0, 1,
-1.244075, -0.8416691, -3.664829, 1, 0.6313726, 0, 1,
-1.237851, -2.844423, -1.754586, 1, 0.6352941, 0, 1,
-1.23548, 2.421872, -1.205788, 1, 0.6431373, 0, 1,
-1.232918, -1.425057, -2.472252, 1, 0.6470588, 0, 1,
-1.232067, -0.4571339, -2.397291, 1, 0.654902, 0, 1,
-1.218361, -0.5305709, -3.135309, 1, 0.6588235, 0, 1,
-1.217625, 0.7944756, 1.754448, 1, 0.6666667, 0, 1,
-1.217513, 0.2367251, -1.904956, 1, 0.6705883, 0, 1,
-1.213852, -1.117077, -1.714684, 1, 0.6784314, 0, 1,
-1.197184, 0.625055, -1.281716, 1, 0.682353, 0, 1,
-1.191769, 1.571664, -0.4893113, 1, 0.6901961, 0, 1,
-1.190426, 0.6813332, 0.7362176, 1, 0.6941177, 0, 1,
-1.188055, 1.31888, 1.607312, 1, 0.7019608, 0, 1,
-1.179411, 0.2638713, -2.33395, 1, 0.7098039, 0, 1,
-1.16579, -1.175242, -1.217318, 1, 0.7137255, 0, 1,
-1.164738, 0.4238092, -1.104851, 1, 0.7215686, 0, 1,
-1.162537, 0.2988744, 0.7688606, 1, 0.7254902, 0, 1,
-1.162109, 2.921313, 0.3666455, 1, 0.7333333, 0, 1,
-1.141402, -0.8533419, -3.704784, 1, 0.7372549, 0, 1,
-1.134558, -1.573565, -0.3563016, 1, 0.7450981, 0, 1,
-1.13024, -1.389133, -3.197004, 1, 0.7490196, 0, 1,
-1.127603, 0.637652, -1.331405, 1, 0.7568628, 0, 1,
-1.125573, -0.05477527, -1.542435, 1, 0.7607843, 0, 1,
-1.121661, -1.025563, -3.150731, 1, 0.7686275, 0, 1,
-1.090436, -0.0855641, -2.29923, 1, 0.772549, 0, 1,
-1.085926, -0.1146074, -2.505969, 1, 0.7803922, 0, 1,
-1.078183, -1.542252, -1.291472, 1, 0.7843137, 0, 1,
-1.07083, -1.069004, -3.38713, 1, 0.7921569, 0, 1,
-1.070323, 0.9200091, 0.432654, 1, 0.7960784, 0, 1,
-1.06573, -0.04399862, -2.391936, 1, 0.8039216, 0, 1,
-1.063873, 0.5641655, -1.664701, 1, 0.8117647, 0, 1,
-1.06127, 2.635263, -0.995599, 1, 0.8156863, 0, 1,
-1.060904, -0.8792145, -1.083898, 1, 0.8235294, 0, 1,
-1.058108, 1.022171, 1.167929, 1, 0.827451, 0, 1,
-1.055463, -1.752584, -2.455154, 1, 0.8352941, 0, 1,
-1.047382, 0.04572218, -2.186758, 1, 0.8392157, 0, 1,
-1.043197, -0.8677574, -1.276449, 1, 0.8470588, 0, 1,
-1.038888, -2.317371, -3.340477, 1, 0.8509804, 0, 1,
-1.027815, 0.8478313, -0.04169657, 1, 0.8588235, 0, 1,
-1.020659, 0.3587893, -1.509349, 1, 0.8627451, 0, 1,
-1.020595, -0.5412416, -0.8916582, 1, 0.8705882, 0, 1,
-1.020588, -0.5519345, -4.070107, 1, 0.8745098, 0, 1,
-1.017846, -0.4027619, -1.725027, 1, 0.8823529, 0, 1,
-1.012876, -0.9907355, -1.986805, 1, 0.8862745, 0, 1,
-1.011, 2.297695, 0.1480169, 1, 0.8941177, 0, 1,
-1.006196, 0.9116459, -3.423265, 1, 0.8980392, 0, 1,
-1.001499, 0.988107, -0.9072047, 1, 0.9058824, 0, 1,
-1.000505, 1.107566, -0.08728467, 1, 0.9137255, 0, 1,
-0.9999235, 0.7575896, 0.6026097, 1, 0.9176471, 0, 1,
-0.9976512, -0.5427684, -2.302691, 1, 0.9254902, 0, 1,
-0.994217, -0.8893192, -0.3183388, 1, 0.9294118, 0, 1,
-0.9852838, -0.7197329, -3.124365, 1, 0.9372549, 0, 1,
-0.9767285, -0.03970991, 0.1869952, 1, 0.9411765, 0, 1,
-0.9763638, 0.7987434, -0.4966421, 1, 0.9490196, 0, 1,
-0.9732001, -1.361352, -2.73666, 1, 0.9529412, 0, 1,
-0.9682348, -0.9852543, -1.68562, 1, 0.9607843, 0, 1,
-0.9666963, 0.2405152, -3.257076, 1, 0.9647059, 0, 1,
-0.9661981, 0.1758066, -2.096129, 1, 0.972549, 0, 1,
-0.9644729, -0.1899788, -2.517398, 1, 0.9764706, 0, 1,
-0.9510129, -0.5540919, -2.662741, 1, 0.9843137, 0, 1,
-0.9504654, 0.1205175, -0.9245707, 1, 0.9882353, 0, 1,
-0.9363992, 0.04060121, -1.389783, 1, 0.9960784, 0, 1,
-0.9339641, 1.08982, 0.6731714, 0.9960784, 1, 0, 1,
-0.9303855, 0.9670938, -0.9668213, 0.9921569, 1, 0, 1,
-0.9276258, -0.08257151, -2.192145, 0.9843137, 1, 0, 1,
-0.9275401, -0.8122362, -2.301486, 0.9803922, 1, 0, 1,
-0.9138223, -0.4452406, -3.109623, 0.972549, 1, 0, 1,
-0.9025188, 0.4623566, -2.453229, 0.9686275, 1, 0, 1,
-0.9022442, 1.416655, 0.8485539, 0.9607843, 1, 0, 1,
-0.8981503, -0.3803233, -3.218852, 0.9568627, 1, 0, 1,
-0.8892167, -0.7020107, -2.625618, 0.9490196, 1, 0, 1,
-0.8793214, 0.08884345, -2.722503, 0.945098, 1, 0, 1,
-0.8787358, -0.5522262, -2.524659, 0.9372549, 1, 0, 1,
-0.8773334, 0.2165546, -0.5209523, 0.9333333, 1, 0, 1,
-0.8708389, -1.245272, -2.369958, 0.9254902, 1, 0, 1,
-0.8689385, -0.886084, -1.365994, 0.9215686, 1, 0, 1,
-0.866874, 0.8820684, -1.61917, 0.9137255, 1, 0, 1,
-0.8662249, 1.080884, -1.304077, 0.9098039, 1, 0, 1,
-0.8624329, -0.07602759, -2.115937, 0.9019608, 1, 0, 1,
-0.8570581, 0.0754776, -1.428941, 0.8941177, 1, 0, 1,
-0.8522252, -0.7895712, -2.756835, 0.8901961, 1, 0, 1,
-0.8522133, -0.9224772, -2.810544, 0.8823529, 1, 0, 1,
-0.85109, -0.4352144, -3.78169, 0.8784314, 1, 0, 1,
-0.8463534, -0.04807511, -1.577457, 0.8705882, 1, 0, 1,
-0.8413638, 0.3551596, -1.259409, 0.8666667, 1, 0, 1,
-0.8384196, 0.5980285, -3.068188, 0.8588235, 1, 0, 1,
-0.8311458, -0.374281, -2.004433, 0.854902, 1, 0, 1,
-0.8301502, -1.466195, -3.116596, 0.8470588, 1, 0, 1,
-0.8216247, 0.8328775, -0.6006327, 0.8431373, 1, 0, 1,
-0.8100242, 1.100612, 0.06258964, 0.8352941, 1, 0, 1,
-0.799958, 0.5362515, 1.386694, 0.8313726, 1, 0, 1,
-0.7998229, -1.454944, -4.673694, 0.8235294, 1, 0, 1,
-0.7892585, 1.603198, 0.6198243, 0.8196079, 1, 0, 1,
-0.7881889, 1.10158, -1.548839, 0.8117647, 1, 0, 1,
-0.7683616, -0.6145334, -1.861781, 0.8078431, 1, 0, 1,
-0.7668672, -0.8469791, -1.370755, 0.8, 1, 0, 1,
-0.7667248, 0.004679302, -1.903274, 0.7921569, 1, 0, 1,
-0.764757, -0.1583526, -0.2590929, 0.7882353, 1, 0, 1,
-0.7636265, -0.7153586, -3.187658, 0.7803922, 1, 0, 1,
-0.7631382, 0.3738414, -0.7716876, 0.7764706, 1, 0, 1,
-0.7606289, -0.4350424, -2.988907, 0.7686275, 1, 0, 1,
-0.7589715, -0.4929644, -1.688252, 0.7647059, 1, 0, 1,
-0.750118, -1.740874, -3.339257, 0.7568628, 1, 0, 1,
-0.7468978, 0.02450734, -2.505913, 0.7529412, 1, 0, 1,
-0.7462577, -0.3897456, -2.087318, 0.7450981, 1, 0, 1,
-0.744961, -0.09675901, -0.6955861, 0.7411765, 1, 0, 1,
-0.7445258, 0.3334885, -1.424283, 0.7333333, 1, 0, 1,
-0.7410542, 0.5061807, -1.226073, 0.7294118, 1, 0, 1,
-0.7398241, 0.5755361, -1.406297, 0.7215686, 1, 0, 1,
-0.7287506, 0.6417925, -1.268279, 0.7176471, 1, 0, 1,
-0.7283174, -0.2007297, -2.003865, 0.7098039, 1, 0, 1,
-0.7217378, 0.1465637, -2.789509, 0.7058824, 1, 0, 1,
-0.7185146, -0.1322027, -2.054229, 0.6980392, 1, 0, 1,
-0.7180608, 0.4916073, -1.885597, 0.6901961, 1, 0, 1,
-0.7161985, 0.6643855, -0.8375794, 0.6862745, 1, 0, 1,
-0.7161641, 0.6798133, -0.8767833, 0.6784314, 1, 0, 1,
-0.7155617, -0.2670359, -0.5186582, 0.6745098, 1, 0, 1,
-0.7144898, -0.3390029, -2.299108, 0.6666667, 1, 0, 1,
-0.7121631, -0.1192679, -2.704211, 0.6627451, 1, 0, 1,
-0.7053204, -0.1858184, -1.685233, 0.654902, 1, 0, 1,
-0.7039071, 0.5043526, -0.7491944, 0.6509804, 1, 0, 1,
-0.7020372, 0.9339689, 1.811725, 0.6431373, 1, 0, 1,
-0.6996958, -0.8683062, -1.417008, 0.6392157, 1, 0, 1,
-0.6913518, 0.3973342, -2.020384, 0.6313726, 1, 0, 1,
-0.6867768, 0.4079504, -1.33114, 0.627451, 1, 0, 1,
-0.6854926, -0.6180449, -0.9574382, 0.6196079, 1, 0, 1,
-0.6833184, -0.1927433, -3.357435, 0.6156863, 1, 0, 1,
-0.6817444, -0.4669487, -1.213297, 0.6078432, 1, 0, 1,
-0.6813582, -0.3080006, -2.67296, 0.6039216, 1, 0, 1,
-0.6800258, -0.4704444, -2.313799, 0.5960785, 1, 0, 1,
-0.678277, -0.988279, -2.90182, 0.5882353, 1, 0, 1,
-0.6727474, 0.4296693, -2.563907, 0.5843138, 1, 0, 1,
-0.6699007, -1.493745, -2.199136, 0.5764706, 1, 0, 1,
-0.6689252, -0.4846272, -2.944618, 0.572549, 1, 0, 1,
-0.6685585, -1.060645, -1.847289, 0.5647059, 1, 0, 1,
-0.6685327, -0.113963, -1.332201, 0.5607843, 1, 0, 1,
-0.6676607, 1.205172, -1.775525, 0.5529412, 1, 0, 1,
-0.6587004, -1.480689, -2.35881, 0.5490196, 1, 0, 1,
-0.6537665, -0.2420851, -1.032979, 0.5411765, 1, 0, 1,
-0.6518769, -0.7613068, -4.671835, 0.5372549, 1, 0, 1,
-0.6485562, -0.2549618, -1.513436, 0.5294118, 1, 0, 1,
-0.6481385, 1.072205, -1.148908, 0.5254902, 1, 0, 1,
-0.6434174, -2.328175, -2.414153, 0.5176471, 1, 0, 1,
-0.638328, 0.1003903, 1.936351, 0.5137255, 1, 0, 1,
-0.6383034, -0.6681139, -3.230977, 0.5058824, 1, 0, 1,
-0.6374106, -0.1943747, -4.050996, 0.5019608, 1, 0, 1,
-0.6289685, -0.05970755, -2.250267, 0.4941176, 1, 0, 1,
-0.6282112, 0.2243418, -0.306033, 0.4862745, 1, 0, 1,
-0.6241425, 0.5297528, -2.231815, 0.4823529, 1, 0, 1,
-0.6233138, 0.3726636, -2.99858, 0.4745098, 1, 0, 1,
-0.6154209, 0.01139531, -1.385872, 0.4705882, 1, 0, 1,
-0.6132706, -0.2486942, -2.693811, 0.4627451, 1, 0, 1,
-0.6098937, -0.659942, -2.494575, 0.4588235, 1, 0, 1,
-0.6076206, 0.7734019, -1.030372, 0.4509804, 1, 0, 1,
-0.6075054, -1.816659, -3.174552, 0.4470588, 1, 0, 1,
-0.6073607, -1.284931, -3.088504, 0.4392157, 1, 0, 1,
-0.6070456, -0.1381875, -3.016671, 0.4352941, 1, 0, 1,
-0.6069079, -1.15409, -3.460523, 0.427451, 1, 0, 1,
-0.6067462, 0.2754513, -0.210607, 0.4235294, 1, 0, 1,
-0.6046945, 0.3207157, 0.8663925, 0.4156863, 1, 0, 1,
-0.6017817, 0.5393024, -1.832211, 0.4117647, 1, 0, 1,
-0.6004478, -1.138992, -1.562697, 0.4039216, 1, 0, 1,
-0.5951591, 0.7572569, 0.9428447, 0.3960784, 1, 0, 1,
-0.5915892, 0.297179, -0.7358243, 0.3921569, 1, 0, 1,
-0.5893619, -0.9293572, -1.918388, 0.3843137, 1, 0, 1,
-0.5843294, 0.5760404, -1.933098, 0.3803922, 1, 0, 1,
-0.5835903, -0.09546225, -0.3830933, 0.372549, 1, 0, 1,
-0.5765368, 1.658059, -1.555607, 0.3686275, 1, 0, 1,
-0.5764462, -0.6098675, -2.770111, 0.3607843, 1, 0, 1,
-0.5749273, 0.2719572, 0.07360689, 0.3568628, 1, 0, 1,
-0.5737423, 0.2242484, -0.603438, 0.3490196, 1, 0, 1,
-0.5695301, 0.8021124, -2.744012, 0.345098, 1, 0, 1,
-0.5693288, -1.259061, -2.048362, 0.3372549, 1, 0, 1,
-0.5681785, -1.477417, -1.909582, 0.3333333, 1, 0, 1,
-0.5676442, -1.32249, -3.336949, 0.3254902, 1, 0, 1,
-0.566235, 0.6709446, -1.539155, 0.3215686, 1, 0, 1,
-0.5623623, -0.2793178, -2.729838, 0.3137255, 1, 0, 1,
-0.5590045, -0.2012717, -1.413693, 0.3098039, 1, 0, 1,
-0.5588003, 0.4165752, -2.244854, 0.3019608, 1, 0, 1,
-0.556944, -2.611231, -3.313965, 0.2941177, 1, 0, 1,
-0.5558354, 0.8185505, -0.7041684, 0.2901961, 1, 0, 1,
-0.5512416, 0.6662521, -0.3345928, 0.282353, 1, 0, 1,
-0.5491621, -0.6548883, -1.292872, 0.2784314, 1, 0, 1,
-0.5448174, -0.3668028, -3.861915, 0.2705882, 1, 0, 1,
-0.5445921, -0.8843639, -1.721184, 0.2666667, 1, 0, 1,
-0.5407094, 0.09949403, -2.260383, 0.2588235, 1, 0, 1,
-0.5335087, -0.9817249, -1.882635, 0.254902, 1, 0, 1,
-0.5295687, 1.078783, 0.6634267, 0.2470588, 1, 0, 1,
-0.5278035, 0.1702514, 1.014747, 0.2431373, 1, 0, 1,
-0.5204987, 0.7638045, 1.152614, 0.2352941, 1, 0, 1,
-0.5156435, 0.1929613, -1.340023, 0.2313726, 1, 0, 1,
-0.5146747, -1.269371, -5.286402, 0.2235294, 1, 0, 1,
-0.5115315, 1.280432, -1.057002, 0.2196078, 1, 0, 1,
-0.5045328, -0.3541168, -1.64755, 0.2117647, 1, 0, 1,
-0.5006506, -0.2567403, -1.447316, 0.2078431, 1, 0, 1,
-0.497529, -2.316117, -2.863889, 0.2, 1, 0, 1,
-0.4948574, -0.1930001, -1.616544, 0.1921569, 1, 0, 1,
-0.4925354, 0.2155432, -0.9979511, 0.1882353, 1, 0, 1,
-0.4908521, -0.8263751, -3.239627, 0.1803922, 1, 0, 1,
-0.4882466, 0.1639585, -1.261735, 0.1764706, 1, 0, 1,
-0.4876499, 0.1559226, 0.3933702, 0.1686275, 1, 0, 1,
-0.4789249, -1.216381, -2.051018, 0.1647059, 1, 0, 1,
-0.476285, -0.5337466, -2.814634, 0.1568628, 1, 0, 1,
-0.4749126, -0.2712161, -1.982862, 0.1529412, 1, 0, 1,
-0.474724, 0.01539142, -0.9981689, 0.145098, 1, 0, 1,
-0.4733235, 0.2512475, -0.9758499, 0.1411765, 1, 0, 1,
-0.4716209, 0.6503096, -1.125741, 0.1333333, 1, 0, 1,
-0.4711932, 1.992699, -1.428755, 0.1294118, 1, 0, 1,
-0.4617182, 0.006356779, -2.259519, 0.1215686, 1, 0, 1,
-0.4501102, -1.376536, -1.433014, 0.1176471, 1, 0, 1,
-0.4498304, -0.4826763, -2.041258, 0.1098039, 1, 0, 1,
-0.448093, 0.6195064, -1.209199, 0.1058824, 1, 0, 1,
-0.4469413, 0.1761979, -0.4564723, 0.09803922, 1, 0, 1,
-0.4454731, 0.5787603, -1.416081, 0.09019608, 1, 0, 1,
-0.4439178, 0.0258512, -1.773887, 0.08627451, 1, 0, 1,
-0.4414006, -1.324494, -2.198451, 0.07843138, 1, 0, 1,
-0.4408872, 0.5445818, -1.889282, 0.07450981, 1, 0, 1,
-0.4402227, -0.6872911, -2.002884, 0.06666667, 1, 0, 1,
-0.4399159, -1.632235, -4.660423, 0.0627451, 1, 0, 1,
-0.4372824, 0.376067, -0.2261997, 0.05490196, 1, 0, 1,
-0.4296311, 0.3589475, -1.502609, 0.05098039, 1, 0, 1,
-0.4237224, 0.8838295, 0.9820756, 0.04313726, 1, 0, 1,
-0.4215527, -0.2775949, -0.8082127, 0.03921569, 1, 0, 1,
-0.4209759, 0.1927949, -1.030038, 0.03137255, 1, 0, 1,
-0.4156974, 2.609519, -0.1140735, 0.02745098, 1, 0, 1,
-0.4093834, -0.799441, -2.300144, 0.01960784, 1, 0, 1,
-0.4056568, -0.4913828, -0.1912358, 0.01568628, 1, 0, 1,
-0.4046878, -0.814341, -4.376823, 0.007843138, 1, 0, 1,
-0.4019989, -1.393517, -2.834515, 0.003921569, 1, 0, 1,
-0.3978879, -0.8854311, -3.587231, 0, 1, 0.003921569, 1,
-0.3956853, 0.5048909, -1.662856, 0, 1, 0.01176471, 1,
-0.39067, 0.08865615, -1.829827, 0, 1, 0.01568628, 1,
-0.3900405, -0.2261097, -1.54524, 0, 1, 0.02352941, 1,
-0.3870168, 2.349642, 0.4604224, 0, 1, 0.02745098, 1,
-0.3838724, -1.513265, -4.315047, 0, 1, 0.03529412, 1,
-0.3834396, 0.2193482, -1.057289, 0, 1, 0.03921569, 1,
-0.3797503, 0.03036839, -3.689321, 0, 1, 0.04705882, 1,
-0.3786224, 0.1045974, -1.716354, 0, 1, 0.05098039, 1,
-0.3647323, -0.0590657, -0.8188745, 0, 1, 0.05882353, 1,
-0.363681, -0.6064833, -2.141948, 0, 1, 0.0627451, 1,
-0.3623317, 1.478428, -1.744969, 0, 1, 0.07058824, 1,
-0.3619783, 2.272498, 0.2177712, 0, 1, 0.07450981, 1,
-0.3594225, 1.967809, -0.9532345, 0, 1, 0.08235294, 1,
-0.3585957, 0.3475516, -0.01455191, 0, 1, 0.08627451, 1,
-0.3542758, 0.8580893, -1.88277, 0, 1, 0.09411765, 1,
-0.3529354, -0.5821355, -2.20679, 0, 1, 0.1019608, 1,
-0.3523079, 1.561005, -1.141422, 0, 1, 0.1058824, 1,
-0.3485193, 1.128349, -0.5039675, 0, 1, 0.1137255, 1,
-0.3456363, -1.360244, -1.205646, 0, 1, 0.1176471, 1,
-0.3436053, 0.3624761, -1.949647, 0, 1, 0.1254902, 1,
-0.3430402, -0.4000049, -0.4009891, 0, 1, 0.1294118, 1,
-0.3430183, -0.2726265, -2.173089, 0, 1, 0.1372549, 1,
-0.3327217, -0.7976896, -2.775346, 0, 1, 0.1411765, 1,
-0.3295035, 0.6767887, -0.2946703, 0, 1, 0.1490196, 1,
-0.3253902, -1.099446, -1.786161, 0, 1, 0.1529412, 1,
-0.3249867, -1.173924, -3.139376, 0, 1, 0.1607843, 1,
-0.3242381, -0.1742925, -0.8667285, 0, 1, 0.1647059, 1,
-0.323544, 0.2939692, -1.549205, 0, 1, 0.172549, 1,
-0.3194923, -0.7011887, -3.406943, 0, 1, 0.1764706, 1,
-0.3176458, -1.557431, -2.587094, 0, 1, 0.1843137, 1,
-0.3156158, 0.3873622, -0.5510998, 0, 1, 0.1882353, 1,
-0.3139271, 0.1097205, -1.236399, 0, 1, 0.1960784, 1,
-0.3124944, -0.0761314, -1.938811, 0, 1, 0.2039216, 1,
-0.3109227, 0.351107, -0.72587, 0, 1, 0.2078431, 1,
-0.3090345, 0.6603711, 0.09261232, 0, 1, 0.2156863, 1,
-0.2988334, -0.01218591, -0.316234, 0, 1, 0.2196078, 1,
-0.2985106, -0.4861616, -2.340121, 0, 1, 0.227451, 1,
-0.296845, -0.01550973, -2.111474, 0, 1, 0.2313726, 1,
-0.2956012, 1.377414, -0.09505607, 0, 1, 0.2392157, 1,
-0.2947707, 1.712344, 0.4062941, 0, 1, 0.2431373, 1,
-0.2946788, 1.477545, -2.325054, 0, 1, 0.2509804, 1,
-0.2845701, -1.936227, -2.496481, 0, 1, 0.254902, 1,
-0.2791212, 0.1859167, -0.670287, 0, 1, 0.2627451, 1,
-0.2770393, 1.350802, 0.3428803, 0, 1, 0.2666667, 1,
-0.2770107, -0.1152221, -1.209993, 0, 1, 0.2745098, 1,
-0.2761915, 0.0510102, -1.775889, 0, 1, 0.2784314, 1,
-0.2720574, -1.226903, -2.126424, 0, 1, 0.2862745, 1,
-0.270327, 0.5947709, -0.5241298, 0, 1, 0.2901961, 1,
-0.2602375, 0.9310334, -1.805496, 0, 1, 0.2980392, 1,
-0.2578558, -1.064565, -2.072113, 0, 1, 0.3058824, 1,
-0.2564757, 0.6108742, 1.002837, 0, 1, 0.3098039, 1,
-0.2539908, -0.3053502, -2.699143, 0, 1, 0.3176471, 1,
-0.2512422, 2.582093, 0.1588881, 0, 1, 0.3215686, 1,
-0.2499624, 0.1407863, -0.673925, 0, 1, 0.3294118, 1,
-0.248667, 0.8594214, 0.01374439, 0, 1, 0.3333333, 1,
-0.243911, -0.4935457, -4.531851, 0, 1, 0.3411765, 1,
-0.2385417, -1.869923, -3.128611, 0, 1, 0.345098, 1,
-0.2366225, -1.174767, -0.7699742, 0, 1, 0.3529412, 1,
-0.231442, -0.8354717, -2.611167, 0, 1, 0.3568628, 1,
-0.2227856, -0.4561434, -2.184204, 0, 1, 0.3647059, 1,
-0.2223221, 0.5664381, -1.203011, 0, 1, 0.3686275, 1,
-0.2219173, -0.5275823, -2.181319, 0, 1, 0.3764706, 1,
-0.2213182, 0.1727474, 0.0277251, 0, 1, 0.3803922, 1,
-0.2042122, 1.705487, 0.2501447, 0, 1, 0.3882353, 1,
-0.202883, 0.3940032, -0.539553, 0, 1, 0.3921569, 1,
-0.2023515, -0.9229527, -3.20818, 0, 1, 0.4, 1,
-0.1996464, 0.8602926, 0.8191323, 0, 1, 0.4078431, 1,
-0.1985392, -0.3317738, -3.513852, 0, 1, 0.4117647, 1,
-0.1981745, 0.256806, -0.890995, 0, 1, 0.4196078, 1,
-0.1972684, 1.745336, -1.339154, 0, 1, 0.4235294, 1,
-0.1969397, -0.8266778, -2.23023, 0, 1, 0.4313726, 1,
-0.194595, -0.1388925, -3.348884, 0, 1, 0.4352941, 1,
-0.1914469, 0.7727146, 2.329704, 0, 1, 0.4431373, 1,
-0.1911836, -0.0673498, -2.733158, 0, 1, 0.4470588, 1,
-0.1902507, -0.004632474, -2.856004, 0, 1, 0.454902, 1,
-0.1902227, 0.5002139, 0.160994, 0, 1, 0.4588235, 1,
-0.1878968, 0.1857475, -0.4665035, 0, 1, 0.4666667, 1,
-0.1819204, 0.236692, -0.2167806, 0, 1, 0.4705882, 1,
-0.1784084, 0.7328542, 0.3107541, 0, 1, 0.4784314, 1,
-0.1762353, -0.4354925, -2.232314, 0, 1, 0.4823529, 1,
-0.1745421, 0.07956148, -1.962552, 0, 1, 0.4901961, 1,
-0.1715848, -1.27485, -1.378657, 0, 1, 0.4941176, 1,
-0.1710188, -0.3863944, -2.156633, 0, 1, 0.5019608, 1,
-0.1665468, 0.008768891, -0.7329725, 0, 1, 0.509804, 1,
-0.1638779, -0.7111624, -2.173474, 0, 1, 0.5137255, 1,
-0.1625162, 0.1625605, -0.4573832, 0, 1, 0.5215687, 1,
-0.1555826, 0.04233393, -0.4361696, 0, 1, 0.5254902, 1,
-0.1551895, 0.6972039, 0.7270732, 0, 1, 0.5333334, 1,
-0.1533887, -1.011132, -4.615815, 0, 1, 0.5372549, 1,
-0.1511689, -0.4835875, -2.518671, 0, 1, 0.5450981, 1,
-0.1500596, 0.9668232, 1.582395, 0, 1, 0.5490196, 1,
-0.1435658, 1.027277, 0.009017821, 0, 1, 0.5568628, 1,
-0.1404264, -0.3151114, -0.3475051, 0, 1, 0.5607843, 1,
-0.1389325, -1.330778, -3.823744, 0, 1, 0.5686275, 1,
-0.1297098, -1.455705, -3.600974, 0, 1, 0.572549, 1,
-0.1295629, 0.3299443, 1.440311, 0, 1, 0.5803922, 1,
-0.1284256, 0.00617449, -1.090684, 0, 1, 0.5843138, 1,
-0.1260672, -0.8173767, -1.692508, 0, 1, 0.5921569, 1,
-0.1231403, 0.7889018, 0.5187858, 0, 1, 0.5960785, 1,
-0.1228226, -0.4491619, -3.520579, 0, 1, 0.6039216, 1,
-0.1159157, 0.8214962, -0.6541998, 0, 1, 0.6117647, 1,
-0.1137825, -0.8760312, -3.248999, 0, 1, 0.6156863, 1,
-0.112977, -0.6402016, -2.812775, 0, 1, 0.6235294, 1,
-0.112844, 0.8969134, 0.0984709, 0, 1, 0.627451, 1,
-0.1063443, 0.787034, -0.3970771, 0, 1, 0.6352941, 1,
-0.1057376, 0.3461272, -1.453902, 0, 1, 0.6392157, 1,
-0.1052684, -0.7762901, -3.325319, 0, 1, 0.6470588, 1,
-0.1050202, -0.2295451, -2.885351, 0, 1, 0.6509804, 1,
-0.1041363, -0.4834346, -3.137476, 0, 1, 0.6588235, 1,
-0.09836678, 1.011722, -0.4635368, 0, 1, 0.6627451, 1,
-0.09418608, -0.008492407, -1.526485, 0, 1, 0.6705883, 1,
-0.08505859, -0.8175182, -1.795851, 0, 1, 0.6745098, 1,
-0.08280277, 0.4185266, -1.959508, 0, 1, 0.682353, 1,
-0.07716253, 0.8196464, 0.7743683, 0, 1, 0.6862745, 1,
-0.07683547, -0.3011582, -4.881221, 0, 1, 0.6941177, 1,
-0.07629369, -0.901913, -2.094558, 0, 1, 0.7019608, 1,
-0.0726317, 0.4419507, -0.7986737, 0, 1, 0.7058824, 1,
-0.07207323, -1.240935, -4.070345, 0, 1, 0.7137255, 1,
-0.07157136, -0.5477235, -2.744935, 0, 1, 0.7176471, 1,
-0.07087792, -1.732253, -3.154423, 0, 1, 0.7254902, 1,
-0.06588954, -0.680874, -1.894056, 0, 1, 0.7294118, 1,
-0.06262534, -0.6164692, -3.143537, 0, 1, 0.7372549, 1,
-0.06008605, -1.360984, -2.638418, 0, 1, 0.7411765, 1,
-0.05777269, -0.3039826, -3.345336, 0, 1, 0.7490196, 1,
-0.05542881, -0.9285423, -1.297114, 0, 1, 0.7529412, 1,
-0.0552528, 0.460736, 0.3464517, 0, 1, 0.7607843, 1,
-0.05435926, -0.09310984, -3.320816, 0, 1, 0.7647059, 1,
-0.05084376, -1.100393, -2.135717, 0, 1, 0.772549, 1,
-0.04986892, -0.3901888, -1.553067, 0, 1, 0.7764706, 1,
-0.04671423, 0.0101589, -2.568295, 0, 1, 0.7843137, 1,
-0.04319924, 0.01013188, -0.9309956, 0, 1, 0.7882353, 1,
-0.03793105, -0.1059541, -5.145845, 0, 1, 0.7960784, 1,
-0.03485066, 0.4181538, 0.7716399, 0, 1, 0.8039216, 1,
-0.03279211, 0.1182869, -0.6999046, 0, 1, 0.8078431, 1,
-0.02790566, -1.458144, -4.170266, 0, 1, 0.8156863, 1,
-0.0271801, 0.6243178, -0.157923, 0, 1, 0.8196079, 1,
-0.02715335, -1.476524, -0.641381, 0, 1, 0.827451, 1,
-0.02426834, 0.8919566, -0.126636, 0, 1, 0.8313726, 1,
-0.02119495, 1.295326, 0.3024199, 0, 1, 0.8392157, 1,
-0.01635828, -0.1003169, -3.475879, 0, 1, 0.8431373, 1,
-0.01413945, -0.002906802, 0.06793466, 0, 1, 0.8509804, 1,
-0.00985752, -1.159016, -5.062501, 0, 1, 0.854902, 1,
-0.009134467, 1.590713, -0.4191968, 0, 1, 0.8627451, 1,
-0.008992536, -0.599199, -3.128347, 0, 1, 0.8666667, 1,
-0.008249247, -0.09892321, -2.000525, 0, 1, 0.8745098, 1,
-0.007376384, 0.8872474, -0.7485, 0, 1, 0.8784314, 1,
-0.006661524, 0.4533258, -0.3246198, 0, 1, 0.8862745, 1,
-0.006237819, -0.1557169, -2.955211, 0, 1, 0.8901961, 1,
-0.002947744, 0.5969692, 0.4193171, 0, 1, 0.8980392, 1,
-0.002704932, 1.277106, -1.42783, 0, 1, 0.9058824, 1,
-0.001138708, -0.9667702, -4.147479, 0, 1, 0.9098039, 1,
0.0002932026, 1.728362, 0.09117693, 0, 1, 0.9176471, 1,
0.001789586, 0.134783, 1.811895, 0, 1, 0.9215686, 1,
0.004301389, 0.6183712, 0.0908013, 0, 1, 0.9294118, 1,
0.01133078, 0.5180257, 0.4944746, 0, 1, 0.9333333, 1,
0.01168285, 1.222676, 0.4797726, 0, 1, 0.9411765, 1,
0.01440933, -0.5309294, 4.419713, 0, 1, 0.945098, 1,
0.01810579, 1.007964, -1.043133, 0, 1, 0.9529412, 1,
0.02077165, -1.257897, 3.666428, 0, 1, 0.9568627, 1,
0.02334431, -0.4674582, 2.828354, 0, 1, 0.9647059, 1,
0.02679448, 0.9167005, 0.6535047, 0, 1, 0.9686275, 1,
0.02934622, -0.5855604, 2.593591, 0, 1, 0.9764706, 1,
0.02992232, -1.701468, 4.757686, 0, 1, 0.9803922, 1,
0.03795291, -0.5083848, 3.971528, 0, 1, 0.9882353, 1,
0.03808505, -0.2777216, 1.259809, 0, 1, 0.9921569, 1,
0.04700875, 0.07081694, 1.039368, 0, 1, 1, 1,
0.04757759, 0.7011935, -0.9824116, 0, 0.9921569, 1, 1,
0.05119586, -0.7279263, 2.717456, 0, 0.9882353, 1, 1,
0.05152186, -0.009988626, 0.7712489, 0, 0.9803922, 1, 1,
0.05470131, -0.6737989, 2.512594, 0, 0.9764706, 1, 1,
0.05710375, 1.826563, -0.366448, 0, 0.9686275, 1, 1,
0.05857146, -0.3092025, 3.064967, 0, 0.9647059, 1, 1,
0.06240205, 1.03855, -0.1649284, 0, 0.9568627, 1, 1,
0.06682751, -0.3295933, 3.38091, 0, 0.9529412, 1, 1,
0.07030816, 0.8782944, -0.4868837, 0, 0.945098, 1, 1,
0.07080684, 2.091803, -2.111798, 0, 0.9411765, 1, 1,
0.07144408, -1.046637, 2.44194, 0, 0.9333333, 1, 1,
0.07385536, 0.007074432, 2.252612, 0, 0.9294118, 1, 1,
0.07495223, 0.3608378, 0.7245368, 0, 0.9215686, 1, 1,
0.07734, 0.1406818, 1.434278, 0, 0.9176471, 1, 1,
0.08181109, -0.4946822, 3.028514, 0, 0.9098039, 1, 1,
0.08417461, -0.6815183, 2.475708, 0, 0.9058824, 1, 1,
0.08454949, -1.062121, 2.356183, 0, 0.8980392, 1, 1,
0.08474307, 0.4216363, 0.3340034, 0, 0.8901961, 1, 1,
0.09122518, -0.1808041, 1.151279, 0, 0.8862745, 1, 1,
0.09167261, 0.4559747, -0.5461067, 0, 0.8784314, 1, 1,
0.09318988, 1.090337, 0.0177533, 0, 0.8745098, 1, 1,
0.09916555, 1.356609, -0.8679258, 0, 0.8666667, 1, 1,
0.1020731, 1.016833, 0.436233, 0, 0.8627451, 1, 1,
0.106185, -0.5839278, 3.150195, 0, 0.854902, 1, 1,
0.1071389, -1.786552, 3.013313, 0, 0.8509804, 1, 1,
0.1078594, -0.1717737, 2.568295, 0, 0.8431373, 1, 1,
0.1092376, -0.06869636, 2.675895, 0, 0.8392157, 1, 1,
0.1120042, 0.03672935, 1.056959, 0, 0.8313726, 1, 1,
0.1131067, 0.6459859, 0.9581122, 0, 0.827451, 1, 1,
0.1131523, -0.5966955, 3.221794, 0, 0.8196079, 1, 1,
0.1160981, 0.1039707, 0.5878742, 0, 0.8156863, 1, 1,
0.1197326, -0.4834858, 4.078245, 0, 0.8078431, 1, 1,
0.1197336, -2.258033, 2.69296, 0, 0.8039216, 1, 1,
0.1219364, -0.7141786, 3.59616, 0, 0.7960784, 1, 1,
0.1229347, -1.043132, 3.354296, 0, 0.7882353, 1, 1,
0.1241723, -0.04932809, 0.3796297, 0, 0.7843137, 1, 1,
0.1271729, -0.1401671, 2.379127, 0, 0.7764706, 1, 1,
0.1298857, 1.058652, 0.2377817, 0, 0.772549, 1, 1,
0.1401243, -0.8785602, 2.620506, 0, 0.7647059, 1, 1,
0.1433541, -0.3229824, 1.792331, 0, 0.7607843, 1, 1,
0.1473531, 0.5843972, -1.808365, 0, 0.7529412, 1, 1,
0.1496062, -0.2887073, 2.674722, 0, 0.7490196, 1, 1,
0.1509555, -2.065074, 2.924686, 0, 0.7411765, 1, 1,
0.15162, -0.1169417, 2.219785, 0, 0.7372549, 1, 1,
0.1525044, 0.1775275, -1.075242, 0, 0.7294118, 1, 1,
0.1541039, -2.217974, 3.579168, 0, 0.7254902, 1, 1,
0.1544653, -1.553017, 2.362557, 0, 0.7176471, 1, 1,
0.158431, 0.7998937, 1.681056, 0, 0.7137255, 1, 1,
0.1596653, 0.2025464, 0.8540431, 0, 0.7058824, 1, 1,
0.1625821, 0.03336166, 1.275585, 0, 0.6980392, 1, 1,
0.1650085, -0.6479366, 5.388134, 0, 0.6941177, 1, 1,
0.1667575, 1.048507, -0.1062517, 0, 0.6862745, 1, 1,
0.178462, 1.037707, 0.8616557, 0, 0.682353, 1, 1,
0.1810968, -0.7532679, 2.346997, 0, 0.6745098, 1, 1,
0.1834389, 1.516088, 2.181079, 0, 0.6705883, 1, 1,
0.184058, -0.2364489, 2.907266, 0, 0.6627451, 1, 1,
0.1861356, 1.422175, -0.6611931, 0, 0.6588235, 1, 1,
0.1865622, 0.5811722, 0.6887243, 0, 0.6509804, 1, 1,
0.1866195, -1.197516, 2.640214, 0, 0.6470588, 1, 1,
0.1964964, 0.7669051, 1.026479, 0, 0.6392157, 1, 1,
0.1966108, 0.05471868, 1.331018, 0, 0.6352941, 1, 1,
0.1991654, -0.3855673, 2.631998, 0, 0.627451, 1, 1,
0.2061858, 1.040381, 1.57637, 0, 0.6235294, 1, 1,
0.2116289, -0.6228542, 1.441457, 0, 0.6156863, 1, 1,
0.2177643, 0.8057808, -0.9915051, 0, 0.6117647, 1, 1,
0.2226318, -0.5247663, 2.53934, 0, 0.6039216, 1, 1,
0.2237355, 0.6767312, 0.4992569, 0, 0.5960785, 1, 1,
0.2242896, 1.044897, 1.313396, 0, 0.5921569, 1, 1,
0.2260156, -0.2907062, 1.401972, 0, 0.5843138, 1, 1,
0.2264801, -0.1039632, 4.18585, 0, 0.5803922, 1, 1,
0.2279741, 1.184948, 0.9524325, 0, 0.572549, 1, 1,
0.2288094, 0.3992738, 1.081374, 0, 0.5686275, 1, 1,
0.2301509, 0.9504833, 1.584923, 0, 0.5607843, 1, 1,
0.2303112, -0.8303064, 4.152913, 0, 0.5568628, 1, 1,
0.2364064, -1.870403, 3.550699, 0, 0.5490196, 1, 1,
0.2373809, 0.1165657, 1.474687, 0, 0.5450981, 1, 1,
0.2394765, -1.119337, 0.6653584, 0, 0.5372549, 1, 1,
0.2404094, 0.8423166, -1.10268, 0, 0.5333334, 1, 1,
0.2412112, 0.6132348, 2.1321, 0, 0.5254902, 1, 1,
0.2414048, -1.381888, 1.393373, 0, 0.5215687, 1, 1,
0.2424419, 1.973093, -0.05840627, 0, 0.5137255, 1, 1,
0.2440201, 0.2319875, -0.06128274, 0, 0.509804, 1, 1,
0.2449113, -1.762936, 4.853482, 0, 0.5019608, 1, 1,
0.2470184, -1.306975, 2.172268, 0, 0.4941176, 1, 1,
0.2500605, -0.7637055, 3.11073, 0, 0.4901961, 1, 1,
0.2528912, 0.6231828, 0.3642488, 0, 0.4823529, 1, 1,
0.2541291, 2.104282, -2.300039, 0, 0.4784314, 1, 1,
0.2584809, -0.2438176, 3.093243, 0, 0.4705882, 1, 1,
0.2588083, 1.331028, -0.4323714, 0, 0.4666667, 1, 1,
0.2667192, -0.564974, 2.971395, 0, 0.4588235, 1, 1,
0.267147, 0.2580352, -0.1990776, 0, 0.454902, 1, 1,
0.2706377, 1.107458, 0.8960924, 0, 0.4470588, 1, 1,
0.2711539, 0.3409889, 0.7782726, 0, 0.4431373, 1, 1,
0.2715434, 0.5275925, -0.181561, 0, 0.4352941, 1, 1,
0.274907, -0.7304469, 3.003316, 0, 0.4313726, 1, 1,
0.2752706, -0.1946724, 2.987394, 0, 0.4235294, 1, 1,
0.2754207, 0.7483618, 1.446112, 0, 0.4196078, 1, 1,
0.2763215, -2.201834, 1.717035, 0, 0.4117647, 1, 1,
0.2833534, 1.885421, 0.7733917, 0, 0.4078431, 1, 1,
0.2834975, -1.506776, 1.54731, 0, 0.4, 1, 1,
0.2854205, -1.307057, 3.878561, 0, 0.3921569, 1, 1,
0.2858542, 0.3476592, 0.7755074, 0, 0.3882353, 1, 1,
0.2894279, 1.525881, -0.367349, 0, 0.3803922, 1, 1,
0.2912155, 1.177257, -0.5082698, 0, 0.3764706, 1, 1,
0.2936716, 0.4329796, 2.853688, 0, 0.3686275, 1, 1,
0.2956704, 0.7835703, 0.2389858, 0, 0.3647059, 1, 1,
0.2965337, -0.3854218, 1.38488, 0, 0.3568628, 1, 1,
0.2985036, 1.314597, 1.746113, 0, 0.3529412, 1, 1,
0.3048156, 1.192399, 1.521138, 0, 0.345098, 1, 1,
0.3120064, 1.413269, -0.3212719, 0, 0.3411765, 1, 1,
0.3135749, -0.3247134, 0.564568, 0, 0.3333333, 1, 1,
0.3176006, 1.081246, 0.3483709, 0, 0.3294118, 1, 1,
0.3203509, 0.3643593, 0.8634605, 0, 0.3215686, 1, 1,
0.3220474, 0.854697, -0.6759094, 0, 0.3176471, 1, 1,
0.3259992, -1.909863, 3.238093, 0, 0.3098039, 1, 1,
0.3294106, -0.6360564, 2.347213, 0, 0.3058824, 1, 1,
0.3349028, 1.239123, 1.097023, 0, 0.2980392, 1, 1,
0.3365488, -0.891426, 5.844338, 0, 0.2901961, 1, 1,
0.3465654, -0.1335291, 2.701377, 0, 0.2862745, 1, 1,
0.3482489, 0.7150117, 0.04865689, 0, 0.2784314, 1, 1,
0.3500791, -0.2442978, 2.519384, 0, 0.2745098, 1, 1,
0.3505915, 1.112387, -0.09630203, 0, 0.2666667, 1, 1,
0.3579795, -0.03650039, 1.154274, 0, 0.2627451, 1, 1,
0.3600535, 0.5456328, 0.5581025, 0, 0.254902, 1, 1,
0.3618883, 0.9967644, -0.4924036, 0, 0.2509804, 1, 1,
0.367386, 1.47949, -0.7348619, 0, 0.2431373, 1, 1,
0.3677331, -1.299924, 4.696677, 0, 0.2392157, 1, 1,
0.3685394, 0.2930139, 0.0828338, 0, 0.2313726, 1, 1,
0.3693302, -1.254808, 2.715037, 0, 0.227451, 1, 1,
0.3696093, -0.8836679, 3.579112, 0, 0.2196078, 1, 1,
0.3759661, -0.4631777, 2.248144, 0, 0.2156863, 1, 1,
0.3796419, -0.8726591, 1.404846, 0, 0.2078431, 1, 1,
0.3878569, -1.195839, 2.884259, 0, 0.2039216, 1, 1,
0.3903045, 0.3170471, 2.633142, 0, 0.1960784, 1, 1,
0.3950848, -0.1630818, 3.584169, 0, 0.1882353, 1, 1,
0.4030613, -0.5051119, 2.656761, 0, 0.1843137, 1, 1,
0.4045969, 0.0417018, 1.790281, 0, 0.1764706, 1, 1,
0.4092176, -0.2860842, 2.794384, 0, 0.172549, 1, 1,
0.4096145, -1.452221, 4.393696, 0, 0.1647059, 1, 1,
0.4108194, -0.3655114, 2.65462, 0, 0.1607843, 1, 1,
0.411966, -2.43279, 2.458852, 0, 0.1529412, 1, 1,
0.4133519, -0.8766332, 1.46061, 0, 0.1490196, 1, 1,
0.4155945, 0.2015022, 1.755392, 0, 0.1411765, 1, 1,
0.415808, 0.4607989, -0.5484717, 0, 0.1372549, 1, 1,
0.4161565, 0.1264536, 1.181831, 0, 0.1294118, 1, 1,
0.4205244, -0.7221504, 1.754339, 0, 0.1254902, 1, 1,
0.4237003, 0.3467302, 1.58299, 0, 0.1176471, 1, 1,
0.4291008, -0.4876751, 3.481396, 0, 0.1137255, 1, 1,
0.4293275, 0.7640099, 1.32815, 0, 0.1058824, 1, 1,
0.4296123, 0.45368, 2.153977, 0, 0.09803922, 1, 1,
0.4300189, -0.8533408, 3.127956, 0, 0.09411765, 1, 1,
0.4315745, 0.4367765, 1.309055, 0, 0.08627451, 1, 1,
0.432419, -0.2568552, 0.9101285, 0, 0.08235294, 1, 1,
0.4328198, -0.9495662, 1.738341, 0, 0.07450981, 1, 1,
0.4345427, -0.2098168, 3.047626, 0, 0.07058824, 1, 1,
0.4362037, 1.155426, -0.08232579, 0, 0.0627451, 1, 1,
0.4391941, -0.3251953, 3.192378, 0, 0.05882353, 1, 1,
0.441503, -0.004164225, 2.280946, 0, 0.05098039, 1, 1,
0.444538, 1.465535, -1.670222, 0, 0.04705882, 1, 1,
0.4462078, 1.344537, 0.1778728, 0, 0.03921569, 1, 1,
0.4524639, 0.01272143, 2.78468, 0, 0.03529412, 1, 1,
0.4556608, -0.3622529, 1.268034, 0, 0.02745098, 1, 1,
0.4558508, -1.426013, 2.04273, 0, 0.02352941, 1, 1,
0.458319, 0.2401363, 1.825116, 0, 0.01568628, 1, 1,
0.4596991, -0.7543408, 2.164411, 0, 0.01176471, 1, 1,
0.4641168, -1.207232, 3.653269, 0, 0.003921569, 1, 1,
0.4722505, 0.5711166, -1.145802, 0.003921569, 0, 1, 1,
0.4743336, 0.4658841, -0.4909941, 0.007843138, 0, 1, 1,
0.4804567, 1.500048, 0.4145505, 0.01568628, 0, 1, 1,
0.4856934, -0.1727269, 0.5184917, 0.01960784, 0, 1, 1,
0.490669, 0.336908, 0.5904722, 0.02745098, 0, 1, 1,
0.4917248, -1.499006, 1.956004, 0.03137255, 0, 1, 1,
0.4931598, 1.24467, -0.05950917, 0.03921569, 0, 1, 1,
0.5013242, 0.7588179, 1.635364, 0.04313726, 0, 1, 1,
0.502304, -0.381128, 1.172848, 0.05098039, 0, 1, 1,
0.5201559, -0.191821, 1.710581, 0.05490196, 0, 1, 1,
0.5259077, -0.1457307, 1.223397, 0.0627451, 0, 1, 1,
0.5301508, 1.57465, 0.8465573, 0.06666667, 0, 1, 1,
0.5338069, 0.4488791, 0.8122995, 0.07450981, 0, 1, 1,
0.5363327, 3.515787, -0.4481649, 0.07843138, 0, 1, 1,
0.5388491, 0.1050612, 2.116666, 0.08627451, 0, 1, 1,
0.5393005, -1.818473, 2.58814, 0.09019608, 0, 1, 1,
0.5415031, 0.5938072, 2.283501, 0.09803922, 0, 1, 1,
0.5426036, -0.7952397, 2.304299, 0.1058824, 0, 1, 1,
0.5464288, 0.8829737, 0.7405625, 0.1098039, 0, 1, 1,
0.5489382, 0.3215773, -0.2897226, 0.1176471, 0, 1, 1,
0.5507309, -0.2212093, 1.289999, 0.1215686, 0, 1, 1,
0.5526857, 0.6006331, 1.23634, 0.1294118, 0, 1, 1,
0.5536158, -0.5196648, 2.419343, 0.1333333, 0, 1, 1,
0.5536196, -0.1621616, 1.399666, 0.1411765, 0, 1, 1,
0.5594593, -1.70665, 2.031209, 0.145098, 0, 1, 1,
0.5598309, 0.9091815, 0.01248585, 0.1529412, 0, 1, 1,
0.5639569, -0.2904907, 2.240236, 0.1568628, 0, 1, 1,
0.5640213, 0.7950268, -0.8462723, 0.1647059, 0, 1, 1,
0.5649367, -1.006899, 1.56475, 0.1686275, 0, 1, 1,
0.5652347, 1.326279, -0.2561382, 0.1764706, 0, 1, 1,
0.5660469, -0.09082332, 0.03706073, 0.1803922, 0, 1, 1,
0.5660604, -0.3553976, 1.859165, 0.1882353, 0, 1, 1,
0.5691917, -1.544908, 2.343313, 0.1921569, 0, 1, 1,
0.5726717, 0.914911, 2.585548, 0.2, 0, 1, 1,
0.5805718, 0.8361073, 1.294924, 0.2078431, 0, 1, 1,
0.5841952, -0.4084096, 1.87279, 0.2117647, 0, 1, 1,
0.5859967, -1.194118, 1.051881, 0.2196078, 0, 1, 1,
0.5861062, -1.466583, 1.004255, 0.2235294, 0, 1, 1,
0.5963303, -1.338094, 1.566937, 0.2313726, 0, 1, 1,
0.602556, -0.2041627, 2.038456, 0.2352941, 0, 1, 1,
0.6032108, 2.407466, -0.4621006, 0.2431373, 0, 1, 1,
0.6054978, -0.2704453, 2.384766, 0.2470588, 0, 1, 1,
0.607418, 0.226187, 0.2654109, 0.254902, 0, 1, 1,
0.6108576, 0.8250357, 0.2296795, 0.2588235, 0, 1, 1,
0.615829, 0.8129744, -1.2458, 0.2666667, 0, 1, 1,
0.6209847, 1.281043, 0.8685541, 0.2705882, 0, 1, 1,
0.6211357, -0.3287626, 1.625118, 0.2784314, 0, 1, 1,
0.6225039, -0.6046619, 2.446043, 0.282353, 0, 1, 1,
0.6229105, -0.8320934, 0.7485291, 0.2901961, 0, 1, 1,
0.6283467, -1.346997, -0.2188168, 0.2941177, 0, 1, 1,
0.6298199, 0.6988724, 1.227876, 0.3019608, 0, 1, 1,
0.631844, -1.594594, 2.006167, 0.3098039, 0, 1, 1,
0.6353936, 0.3466652, 0.5619588, 0.3137255, 0, 1, 1,
0.6476792, -0.9317746, 1.68879, 0.3215686, 0, 1, 1,
0.6524159, 0.3273324, 1.147969, 0.3254902, 0, 1, 1,
0.65632, -1.595156, 2.417994, 0.3333333, 0, 1, 1,
0.6622432, -0.9483019, 3.614932, 0.3372549, 0, 1, 1,
0.6683563, -1.330293, 2.779906, 0.345098, 0, 1, 1,
0.6696282, 0.9827375, 2.550897, 0.3490196, 0, 1, 1,
0.6714177, 1.873933, -0.04101893, 0.3568628, 0, 1, 1,
0.6718493, 0.04150233, 0.07561377, 0.3607843, 0, 1, 1,
0.6769741, 2.58456, 0.8899084, 0.3686275, 0, 1, 1,
0.6801187, -0.4853401, 2.561355, 0.372549, 0, 1, 1,
0.6815042, -0.9233104, 2.441815, 0.3803922, 0, 1, 1,
0.6823353, -0.322793, 2.271866, 0.3843137, 0, 1, 1,
0.6845015, 1.694542, 1.130091, 0.3921569, 0, 1, 1,
0.6846029, -2.432538, 4.693925, 0.3960784, 0, 1, 1,
0.6856048, 0.6152264, 2.086774, 0.4039216, 0, 1, 1,
0.6869094, -1.57293, 2.902499, 0.4117647, 0, 1, 1,
0.6963733, 1.601726, 1.866992, 0.4156863, 0, 1, 1,
0.7135977, 1.626549, 0.6019787, 0.4235294, 0, 1, 1,
0.7166656, 1.435609, -0.08031757, 0.427451, 0, 1, 1,
0.7187436, -0.8414636, 1.46697, 0.4352941, 0, 1, 1,
0.7209839, -0.98225, 3.016565, 0.4392157, 0, 1, 1,
0.7256624, -1.265372, 1.307069, 0.4470588, 0, 1, 1,
0.7382861, 0.2658336, -0.08885556, 0.4509804, 0, 1, 1,
0.7386231, -0.1275364, 1.313626, 0.4588235, 0, 1, 1,
0.7405473, -2.265102, 3.272719, 0.4627451, 0, 1, 1,
0.7436771, -0.7146148, 3.761499, 0.4705882, 0, 1, 1,
0.7471298, -0.3228613, 1.951805, 0.4745098, 0, 1, 1,
0.7574165, -0.1143061, 0.9590097, 0.4823529, 0, 1, 1,
0.7582601, 1.775402, 1.129396, 0.4862745, 0, 1, 1,
0.7584432, -0.1668701, 1.857224, 0.4941176, 0, 1, 1,
0.759784, 0.3041819, -1.58209, 0.5019608, 0, 1, 1,
0.7655908, -0.3368979, 3.20391, 0.5058824, 0, 1, 1,
0.7710698, 0.3753113, 1.514118, 0.5137255, 0, 1, 1,
0.7811297, 1.26277, 0.5371693, 0.5176471, 0, 1, 1,
0.7841102, 0.6584794, 1.950677, 0.5254902, 0, 1, 1,
0.7844506, -1.351425, 3.45477, 0.5294118, 0, 1, 1,
0.7871299, -2.241707, 3.867499, 0.5372549, 0, 1, 1,
0.7873275, 0.2619648, -0.0598561, 0.5411765, 0, 1, 1,
0.7876316, -0.9970237, 2.413317, 0.5490196, 0, 1, 1,
0.7894611, -0.8114739, 0.8679292, 0.5529412, 0, 1, 1,
0.7907281, 0.8013229, 1.76057, 0.5607843, 0, 1, 1,
0.7950445, 0.234855, 1.458375, 0.5647059, 0, 1, 1,
0.796238, -0.1344788, 2.292621, 0.572549, 0, 1, 1,
0.7965961, -1.503018, 3.264414, 0.5764706, 0, 1, 1,
0.7994055, 0.01995972, 1.137689, 0.5843138, 0, 1, 1,
0.799782, 0.361384, -0.675999, 0.5882353, 0, 1, 1,
0.8025678, -0.2741915, 3.201152, 0.5960785, 0, 1, 1,
0.805074, 0.1229254, 2.12974, 0.6039216, 0, 1, 1,
0.8141249, -0.9419938, 2.606425, 0.6078432, 0, 1, 1,
0.8159872, -1.387808, 2.294454, 0.6156863, 0, 1, 1,
0.8250039, -0.4291779, 1.851176, 0.6196079, 0, 1, 1,
0.8260949, 0.2684651, 2.399683, 0.627451, 0, 1, 1,
0.8264887, -2.180847, 2.811269, 0.6313726, 0, 1, 1,
0.8270777, -2.371355, 0.9867995, 0.6392157, 0, 1, 1,
0.8277115, -0.4003636, 2.585223, 0.6431373, 0, 1, 1,
0.8342362, 0.1008254, 2.026824, 0.6509804, 0, 1, 1,
0.8387704, 1.126213, 0.7906107, 0.654902, 0, 1, 1,
0.8395072, -0.7358002, 1.752041, 0.6627451, 0, 1, 1,
0.8404343, -0.2628117, 3.394434, 0.6666667, 0, 1, 1,
0.841471, 0.9697788, -0.3845723, 0.6745098, 0, 1, 1,
0.842437, 1.323478, 0.8114787, 0.6784314, 0, 1, 1,
0.8439992, -1.574544, 3.287578, 0.6862745, 0, 1, 1,
0.8476177, 0.4861661, 2.09374, 0.6901961, 0, 1, 1,
0.8623326, -1.767159, 3.110611, 0.6980392, 0, 1, 1,
0.8673438, 0.1771025, -0.08948271, 0.7058824, 0, 1, 1,
0.8681797, -0.3147884, 1.618039, 0.7098039, 0, 1, 1,
0.8684364, -0.03287227, 0.5656947, 0.7176471, 0, 1, 1,
0.8726739, 0.5692732, 3.458861, 0.7215686, 0, 1, 1,
0.8731008, 2.559941, 1.354699, 0.7294118, 0, 1, 1,
0.8738354, -1.252184, 3.184622, 0.7333333, 0, 1, 1,
0.8749793, -0.01241034, 2.586737, 0.7411765, 0, 1, 1,
0.8762677, 0.8493434, 0.6337636, 0.7450981, 0, 1, 1,
0.8807437, 2.601291, 0.5360448, 0.7529412, 0, 1, 1,
0.8809581, 0.7521637, 1.222777, 0.7568628, 0, 1, 1,
0.881137, 0.2710508, 1.818494, 0.7647059, 0, 1, 1,
0.8820679, -0.3559705, 3.997849, 0.7686275, 0, 1, 1,
0.8826994, 1.315214, 1.062141, 0.7764706, 0, 1, 1,
0.8838796, 0.6302891, -0.2368283, 0.7803922, 0, 1, 1,
0.8865851, 1.863462, 0.997778, 0.7882353, 0, 1, 1,
0.8909502, 0.4372814, -0.8889136, 0.7921569, 0, 1, 1,
0.8911693, -0.2537266, 2.95437, 0.8, 0, 1, 1,
0.8919138, 0.7683566, 1.730518, 0.8078431, 0, 1, 1,
0.8948423, 0.8623376, 2.216942, 0.8117647, 0, 1, 1,
0.8976926, 0.8914927, 2.195567, 0.8196079, 0, 1, 1,
0.8999289, 0.7861238, 1.41301, 0.8235294, 0, 1, 1,
0.9141943, -0.6064339, 3.131257, 0.8313726, 0, 1, 1,
0.921667, 1.968263, 1.488646, 0.8352941, 0, 1, 1,
0.9238583, 0.2187658, 2.289715, 0.8431373, 0, 1, 1,
0.9244335, -0.8303402, 2.556456, 0.8470588, 0, 1, 1,
0.9248915, 0.2990712, 0.1358697, 0.854902, 0, 1, 1,
0.9320917, 1.696246, -0.399999, 0.8588235, 0, 1, 1,
0.9332929, -2.223536, 1.677787, 0.8666667, 0, 1, 1,
0.9406303, 0.5632752, 0.6184066, 0.8705882, 0, 1, 1,
0.9426715, 0.3764146, 1.276541, 0.8784314, 0, 1, 1,
0.9427157, -0.7057505, 1.021369, 0.8823529, 0, 1, 1,
0.9434838, -2.110421, 1.956849, 0.8901961, 0, 1, 1,
0.9466639, 1.336365, -0.3046772, 0.8941177, 0, 1, 1,
0.951849, -1.225516, 4.036549, 0.9019608, 0, 1, 1,
0.955655, -0.4494036, 2.112756, 0.9098039, 0, 1, 1,
0.9592373, -0.6471058, 1.483873, 0.9137255, 0, 1, 1,
0.9649635, 0.09858389, 0.8670466, 0.9215686, 0, 1, 1,
0.9693252, -0.7985831, 2.177928, 0.9254902, 0, 1, 1,
0.9721843, -0.7659978, 2.122128, 0.9333333, 0, 1, 1,
0.983753, 0.1119891, 0.7897679, 0.9372549, 0, 1, 1,
0.9847291, 0.3061579, 2.107324, 0.945098, 0, 1, 1,
0.9875661, -0.5065615, 2.408923, 0.9490196, 0, 1, 1,
0.9879793, 0.4139243, 2.57692, 0.9568627, 0, 1, 1,
0.9935066, -1.07148, 3.468498, 0.9607843, 0, 1, 1,
0.9943174, -0.01723363, -1.028461, 0.9686275, 0, 1, 1,
0.9949219, -0.3891195, 0.2706285, 0.972549, 0, 1, 1,
1.00469, -0.6934933, 1.578757, 0.9803922, 0, 1, 1,
1.006641, 0.056795, 1.11374, 0.9843137, 0, 1, 1,
1.009223, 1.213793, 1.159837, 0.9921569, 0, 1, 1,
1.012929, -0.7090101, 2.32673, 0.9960784, 0, 1, 1,
1.014021, -0.08754978, 1.756642, 1, 0, 0.9960784, 1,
1.018196, 0.7377152, 0.8918347, 1, 0, 0.9882353, 1,
1.02393, 0.02903846, 1.408721, 1, 0, 0.9843137, 1,
1.026505, 2.038285, 0.04519204, 1, 0, 0.9764706, 1,
1.036115, 0.546706, 0.1358098, 1, 0, 0.972549, 1,
1.038144, 0.4886776, 2.78926, 1, 0, 0.9647059, 1,
1.039596, -0.987703, 1.817316, 1, 0, 0.9607843, 1,
1.040509, -0.06199386, 2.405915, 1, 0, 0.9529412, 1,
1.042822, 0.1633719, -0.9573117, 1, 0, 0.9490196, 1,
1.052615, 1.222207, 1.068595, 1, 0, 0.9411765, 1,
1.068773, -0.3895713, 1.417487, 1, 0, 0.9372549, 1,
1.069255, -0.6344582, 2.02957, 1, 0, 0.9294118, 1,
1.071766, 1.244767, 0.2418311, 1, 0, 0.9254902, 1,
1.07206, -0.4483642, 2.982875, 1, 0, 0.9176471, 1,
1.077092, 0.6356161, 2.941813, 1, 0, 0.9137255, 1,
1.07717, 0.3057627, -0.8670331, 1, 0, 0.9058824, 1,
1.078601, -2.753083, 3.099072, 1, 0, 0.9019608, 1,
1.088415, -0.7702725, 2.068936, 1, 0, 0.8941177, 1,
1.093427, -0.4911239, 3.179421, 1, 0, 0.8862745, 1,
1.099769, -0.4477845, 3.215756, 1, 0, 0.8823529, 1,
1.099981, -0.5322211, 0.9440946, 1, 0, 0.8745098, 1,
1.101951, -1.631247, 2.513075, 1, 0, 0.8705882, 1,
1.104191, 0.4251722, 0.2517658, 1, 0, 0.8627451, 1,
1.106427, 0.3977893, 1.51241, 1, 0, 0.8588235, 1,
1.108441, 1.396872, -0.2199005, 1, 0, 0.8509804, 1,
1.110103, -0.212903, 1.736871, 1, 0, 0.8470588, 1,
1.110313, -0.4752025, 1.297482, 1, 0, 0.8392157, 1,
1.11064, 0.46373, 0.3687399, 1, 0, 0.8352941, 1,
1.111278, 1.454307, 0.5443974, 1, 0, 0.827451, 1,
1.115718, -0.4872475, 2.774536, 1, 0, 0.8235294, 1,
1.120317, -0.1476931, 1.116902, 1, 0, 0.8156863, 1,
1.123423, -0.3749884, 1.938461, 1, 0, 0.8117647, 1,
1.129058, 1.610702, 1.035591, 1, 0, 0.8039216, 1,
1.129442, -0.8901936, 2.67492, 1, 0, 0.7960784, 1,
1.133184, 0.4173996, 1.099455, 1, 0, 0.7921569, 1,
1.133399, 0.4682841, -0.3304424, 1, 0, 0.7843137, 1,
1.135577, 0.7500443, 1.625412, 1, 0, 0.7803922, 1,
1.138369, -0.1576149, 0.4293621, 1, 0, 0.772549, 1,
1.139703, -0.3494606, 3.185784, 1, 0, 0.7686275, 1,
1.143084, 1.042139, 0.9885226, 1, 0, 0.7607843, 1,
1.14409, -0.4432317, 1.464233, 1, 0, 0.7568628, 1,
1.14502, 0.8717392, 1.661049, 1, 0, 0.7490196, 1,
1.153703, -0.1169757, 0.4513496, 1, 0, 0.7450981, 1,
1.153926, -0.3908655, 1.168205, 1, 0, 0.7372549, 1,
1.156705, -0.209291, 2.376647, 1, 0, 0.7333333, 1,
1.159054, -0.3272028, 1.707173, 1, 0, 0.7254902, 1,
1.160394, -0.02340947, 1.315473, 1, 0, 0.7215686, 1,
1.162498, -0.1784173, 3.881973, 1, 0, 0.7137255, 1,
1.165128, 0.4675109, 0.2408835, 1, 0, 0.7098039, 1,
1.187895, 1.298298, 1.259354, 1, 0, 0.7019608, 1,
1.189033, -0.2386992, 2.40056, 1, 0, 0.6941177, 1,
1.193317, -1.233319, 4.349539, 1, 0, 0.6901961, 1,
1.198079, -0.3270166, 3.066617, 1, 0, 0.682353, 1,
1.200997, -0.6444228, 1.349294, 1, 0, 0.6784314, 1,
1.205394, -2.065814, 2.881939, 1, 0, 0.6705883, 1,
1.218372, -2.101917, 2.573277, 1, 0, 0.6666667, 1,
1.218984, 0.7611071, 1.322552, 1, 0, 0.6588235, 1,
1.229234, -0.4701116, 3.778915, 1, 0, 0.654902, 1,
1.246455, 2.434295, 0.6575249, 1, 0, 0.6470588, 1,
1.24708, 1.477901, -0.03060996, 1, 0, 0.6431373, 1,
1.247323, -1.091313, 3.868421, 1, 0, 0.6352941, 1,
1.252072, 0.2595052, 1.031401, 1, 0, 0.6313726, 1,
1.257833, 0.5810917, 2.608371, 1, 0, 0.6235294, 1,
1.258502, 0.439254, -1.241153, 1, 0, 0.6196079, 1,
1.269337, 0.313289, -0.7603133, 1, 0, 0.6117647, 1,
1.278676, 0.4448697, 0.6767441, 1, 0, 0.6078432, 1,
1.279123, 0.08095702, 2.16866, 1, 0, 0.6, 1,
1.280415, -1.076507, 2.042704, 1, 0, 0.5921569, 1,
1.282426, -0.9826483, 3.330986, 1, 0, 0.5882353, 1,
1.303764, 0.01843724, -0.03894357, 1, 0, 0.5803922, 1,
1.316391, -0.304966, 1.676182, 1, 0, 0.5764706, 1,
1.317318, -0.5524675, 0.6554599, 1, 0, 0.5686275, 1,
1.318982, -1.097832, 0.9156358, 1, 0, 0.5647059, 1,
1.327537, -0.6125582, 2.444652, 1, 0, 0.5568628, 1,
1.344663, 0.3987526, 1.268452, 1, 0, 0.5529412, 1,
1.353804, -0.7452303, 4.334455, 1, 0, 0.5450981, 1,
1.353922, -1.520241, 2.02362, 1, 0, 0.5411765, 1,
1.359672, -0.5759206, 1.148731, 1, 0, 0.5333334, 1,
1.36377, -0.5106762, 3.073581, 1, 0, 0.5294118, 1,
1.386137, 0.310897, -0.09816098, 1, 0, 0.5215687, 1,
1.392596, 0.084874, 1.935062, 1, 0, 0.5176471, 1,
1.400778, -0.350309, 2.999421, 1, 0, 0.509804, 1,
1.407743, -0.01502263, 2.389101, 1, 0, 0.5058824, 1,
1.41302, -0.1606734, 0.9750866, 1, 0, 0.4980392, 1,
1.426448, -1.816318, 0.5715482, 1, 0, 0.4901961, 1,
1.444065, -1.181887, 2.486569, 1, 0, 0.4862745, 1,
1.450318, -0.8866959, 2.957664, 1, 0, 0.4784314, 1,
1.451633, 0.9177967, 0.7996008, 1, 0, 0.4745098, 1,
1.461555, 1.188817, 1.435835, 1, 0, 0.4666667, 1,
1.462512, 1.858144, 1.114084, 1, 0, 0.4627451, 1,
1.464468, -0.1461334, 2.531041, 1, 0, 0.454902, 1,
1.470201, -1.368337, 2.123165, 1, 0, 0.4509804, 1,
1.474102, -0.2876447, -0.0719826, 1, 0, 0.4431373, 1,
1.474819, 0.7215868, 2.730478, 1, 0, 0.4392157, 1,
1.510173, -0.008199931, 2.552609, 1, 0, 0.4313726, 1,
1.522457, -0.3972886, 1.442044, 1, 0, 0.427451, 1,
1.522915, -0.6309173, 1.019702, 1, 0, 0.4196078, 1,
1.522924, 0.2010178, 2.381065, 1, 0, 0.4156863, 1,
1.526009, 0.8453026, 0.5826101, 1, 0, 0.4078431, 1,
1.530845, -0.199591, 1.231381, 1, 0, 0.4039216, 1,
1.533746, -1.231508, 4.158195, 1, 0, 0.3960784, 1,
1.539929, 1.786882, 2.643147, 1, 0, 0.3882353, 1,
1.546293, 0.5005218, 2.717759, 1, 0, 0.3843137, 1,
1.555491, 1.292331, 1.391327, 1, 0, 0.3764706, 1,
1.566911, -1.287305, 2.711478, 1, 0, 0.372549, 1,
1.568181, 0.5615829, 0.4896345, 1, 0, 0.3647059, 1,
1.573997, -0.2464104, 2.404023, 1, 0, 0.3607843, 1,
1.576051, -0.1479095, 0.9736844, 1, 0, 0.3529412, 1,
1.577721, -0.6259305, 3.343631, 1, 0, 0.3490196, 1,
1.596467, 1.642452, 2.044062, 1, 0, 0.3411765, 1,
1.622832, -0.1198283, 2.638421, 1, 0, 0.3372549, 1,
1.628856, -1.430456, 0.6814114, 1, 0, 0.3294118, 1,
1.636729, -0.5958561, 1.737915, 1, 0, 0.3254902, 1,
1.665069, -0.4878503, 2.082509, 1, 0, 0.3176471, 1,
1.674273, 0.9838824, 1.121413, 1, 0, 0.3137255, 1,
1.683971, 0.5546013, -0.6026872, 1, 0, 0.3058824, 1,
1.693009, 0.3633177, 0.2302556, 1, 0, 0.2980392, 1,
1.71112, 0.3533256, 2.425148, 1, 0, 0.2941177, 1,
1.740769, -0.9937301, 1.954688, 1, 0, 0.2862745, 1,
1.759485, -0.3546066, 2.980766, 1, 0, 0.282353, 1,
1.788362, -1.008987, 0.9825187, 1, 0, 0.2745098, 1,
1.788954, 2.011426, -0.01815863, 1, 0, 0.2705882, 1,
1.789327, 0.5437431, 1.710946, 1, 0, 0.2627451, 1,
1.799842, 0.2980788, 0.9241034, 1, 0, 0.2588235, 1,
1.829046, -0.3427846, 2.601419, 1, 0, 0.2509804, 1,
1.841039, 1.115593, 2.425107, 1, 0, 0.2470588, 1,
1.845359, 1.434959, 1.526806, 1, 0, 0.2392157, 1,
1.85886, 0.5232648, 1.465105, 1, 0, 0.2352941, 1,
1.869012, 0.0223553, 2.905138, 1, 0, 0.227451, 1,
1.869596, 1.364933, 2.046107, 1, 0, 0.2235294, 1,
1.887306, 0.7368871, 1.119091, 1, 0, 0.2156863, 1,
1.891545, -0.2141487, 2.044247, 1, 0, 0.2117647, 1,
1.89626, -0.8044549, 3.157822, 1, 0, 0.2039216, 1,
1.902762, 0.5534453, 0.5496479, 1, 0, 0.1960784, 1,
1.905789, 1.001446, 0.4588504, 1, 0, 0.1921569, 1,
1.913019, 0.8696069, -0.5288927, 1, 0, 0.1843137, 1,
1.959858, 1.37898, 1.733097, 1, 0, 0.1803922, 1,
1.964702, -0.4094931, 3.519667, 1, 0, 0.172549, 1,
1.970486, -0.5050377, 1.218673, 1, 0, 0.1686275, 1,
1.984173, 0.3895499, 1.148247, 1, 0, 0.1607843, 1,
1.99755, 1.367863, 1.483343, 1, 0, 0.1568628, 1,
2.055903, -0.2722083, 0.8445027, 1, 0, 0.1490196, 1,
2.076138, 0.8259051, 0.08803353, 1, 0, 0.145098, 1,
2.083464, -0.9288793, 0.5051357, 1, 0, 0.1372549, 1,
2.097442, -0.8561739, 1.204757, 1, 0, 0.1333333, 1,
2.102782, -1.01817, 1.115318, 1, 0, 0.1254902, 1,
2.139022, 0.4835295, 2.311493, 1, 0, 0.1215686, 1,
2.168342, -1.393201, 1.996382, 1, 0, 0.1137255, 1,
2.208952, -0.1061629, -0.6951031, 1, 0, 0.1098039, 1,
2.23865, -0.6146328, 1.578703, 1, 0, 0.1019608, 1,
2.240118, -0.3754075, 0.2940665, 1, 0, 0.09411765, 1,
2.244186, -2.038122, 1.784307, 1, 0, 0.09019608, 1,
2.333317, -0.5589144, 2.904051, 1, 0, 0.08235294, 1,
2.334985, 0.5168446, 2.33382, 1, 0, 0.07843138, 1,
2.350022, -0.1705263, 2.451004, 1, 0, 0.07058824, 1,
2.374547, -1.681301, 2.101557, 1, 0, 0.06666667, 1,
2.426593, 1.411842, 1.647215, 1, 0, 0.05882353, 1,
2.52308, -1.987679, 2.645368, 1, 0, 0.05490196, 1,
2.536594, -0.8093295, 0.8197874, 1, 0, 0.04705882, 1,
2.57275, 1.936148, 1.105945, 1, 0, 0.04313726, 1,
2.671209, 0.3427655, 1.280793, 1, 0, 0.03529412, 1,
2.812227, -2.210051, 3.467404, 1, 0, 0.03137255, 1,
2.834976, 0.06440713, -0.4364002, 1, 0, 0.02352941, 1,
2.921372, -0.1285357, 0.8020658, 1, 0, 0.01960784, 1,
2.949161, 0.2115138, 1.565741, 1, 0, 0.01176471, 1,
3.002729, 0.01440281, 1.795363, 1, 0, 0.007843138, 1
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
-0.490207, -3.922479, -7.173062, 0, -0.5, 0.5, 0.5,
-0.490207, -3.922479, -7.173062, 1, -0.5, 0.5, 0.5,
-0.490207, -3.922479, -7.173062, 1, 1.5, 0.5, 0.5,
-0.490207, -3.922479, -7.173062, 0, 1.5, 0.5, 0.5
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
-5.167248, 0.3356818, -7.173062, 0, -0.5, 0.5, 0.5,
-5.167248, 0.3356818, -7.173062, 1, -0.5, 0.5, 0.5,
-5.167248, 0.3356818, -7.173062, 1, 1.5, 0.5, 0.5,
-5.167248, 0.3356818, -7.173062, 0, 1.5, 0.5, 0.5
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
-5.167248, -3.922479, 0.2789683, 0, -0.5, 0.5, 0.5,
-5.167248, -3.922479, 0.2789683, 1, -0.5, 0.5, 0.5,
-5.167248, -3.922479, 0.2789683, 1, 1.5, 0.5, 0.5,
-5.167248, -3.922479, 0.2789683, 0, 1.5, 0.5, 0.5
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
-3, -2.939826, -5.453363,
3, -2.939826, -5.453363,
-3, -2.939826, -5.453363,
-3, -3.103602, -5.739979,
-2, -2.939826, -5.453363,
-2, -3.103602, -5.739979,
-1, -2.939826, -5.453363,
-1, -3.103602, -5.739979,
0, -2.939826, -5.453363,
0, -3.103602, -5.739979,
1, -2.939826, -5.453363,
1, -3.103602, -5.739979,
2, -2.939826, -5.453363,
2, -3.103602, -5.739979,
3, -2.939826, -5.453363,
3, -3.103602, -5.739979
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
-3, -3.431152, -6.313212, 0, -0.5, 0.5, 0.5,
-3, -3.431152, -6.313212, 1, -0.5, 0.5, 0.5,
-3, -3.431152, -6.313212, 1, 1.5, 0.5, 0.5,
-3, -3.431152, -6.313212, 0, 1.5, 0.5, 0.5,
-2, -3.431152, -6.313212, 0, -0.5, 0.5, 0.5,
-2, -3.431152, -6.313212, 1, -0.5, 0.5, 0.5,
-2, -3.431152, -6.313212, 1, 1.5, 0.5, 0.5,
-2, -3.431152, -6.313212, 0, 1.5, 0.5, 0.5,
-1, -3.431152, -6.313212, 0, -0.5, 0.5, 0.5,
-1, -3.431152, -6.313212, 1, -0.5, 0.5, 0.5,
-1, -3.431152, -6.313212, 1, 1.5, 0.5, 0.5,
-1, -3.431152, -6.313212, 0, 1.5, 0.5, 0.5,
0, -3.431152, -6.313212, 0, -0.5, 0.5, 0.5,
0, -3.431152, -6.313212, 1, -0.5, 0.5, 0.5,
0, -3.431152, -6.313212, 1, 1.5, 0.5, 0.5,
0, -3.431152, -6.313212, 0, 1.5, 0.5, 0.5,
1, -3.431152, -6.313212, 0, -0.5, 0.5, 0.5,
1, -3.431152, -6.313212, 1, -0.5, 0.5, 0.5,
1, -3.431152, -6.313212, 1, 1.5, 0.5, 0.5,
1, -3.431152, -6.313212, 0, 1.5, 0.5, 0.5,
2, -3.431152, -6.313212, 0, -0.5, 0.5, 0.5,
2, -3.431152, -6.313212, 1, -0.5, 0.5, 0.5,
2, -3.431152, -6.313212, 1, 1.5, 0.5, 0.5,
2, -3.431152, -6.313212, 0, 1.5, 0.5, 0.5,
3, -3.431152, -6.313212, 0, -0.5, 0.5, 0.5,
3, -3.431152, -6.313212, 1, -0.5, 0.5, 0.5,
3, -3.431152, -6.313212, 1, 1.5, 0.5, 0.5,
3, -3.431152, -6.313212, 0, 1.5, 0.5, 0.5
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
-4.087931, -2, -5.453363,
-4.087931, 3, -5.453363,
-4.087931, -2, -5.453363,
-4.267817, -2, -5.739979,
-4.087931, -1, -5.453363,
-4.267817, -1, -5.739979,
-4.087931, 0, -5.453363,
-4.267817, 0, -5.739979,
-4.087931, 1, -5.453363,
-4.267817, 1, -5.739979,
-4.087931, 2, -5.453363,
-4.267817, 2, -5.739979,
-4.087931, 3, -5.453363,
-4.267817, 3, -5.739979
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
-4.62759, -2, -6.313212, 0, -0.5, 0.5, 0.5,
-4.62759, -2, -6.313212, 1, -0.5, 0.5, 0.5,
-4.62759, -2, -6.313212, 1, 1.5, 0.5, 0.5,
-4.62759, -2, -6.313212, 0, 1.5, 0.5, 0.5,
-4.62759, -1, -6.313212, 0, -0.5, 0.5, 0.5,
-4.62759, -1, -6.313212, 1, -0.5, 0.5, 0.5,
-4.62759, -1, -6.313212, 1, 1.5, 0.5, 0.5,
-4.62759, -1, -6.313212, 0, 1.5, 0.5, 0.5,
-4.62759, 0, -6.313212, 0, -0.5, 0.5, 0.5,
-4.62759, 0, -6.313212, 1, -0.5, 0.5, 0.5,
-4.62759, 0, -6.313212, 1, 1.5, 0.5, 0.5,
-4.62759, 0, -6.313212, 0, 1.5, 0.5, 0.5,
-4.62759, 1, -6.313212, 0, -0.5, 0.5, 0.5,
-4.62759, 1, -6.313212, 1, -0.5, 0.5, 0.5,
-4.62759, 1, -6.313212, 1, 1.5, 0.5, 0.5,
-4.62759, 1, -6.313212, 0, 1.5, 0.5, 0.5,
-4.62759, 2, -6.313212, 0, -0.5, 0.5, 0.5,
-4.62759, 2, -6.313212, 1, -0.5, 0.5, 0.5,
-4.62759, 2, -6.313212, 1, 1.5, 0.5, 0.5,
-4.62759, 2, -6.313212, 0, 1.5, 0.5, 0.5,
-4.62759, 3, -6.313212, 0, -0.5, 0.5, 0.5,
-4.62759, 3, -6.313212, 1, -0.5, 0.5, 0.5,
-4.62759, 3, -6.313212, 1, 1.5, 0.5, 0.5,
-4.62759, 3, -6.313212, 0, 1.5, 0.5, 0.5
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
-4.087931, -2.939826, -4,
-4.087931, -2.939826, 4,
-4.087931, -2.939826, -4,
-4.267817, -3.103602, -4,
-4.087931, -2.939826, -2,
-4.267817, -3.103602, -2,
-4.087931, -2.939826, 0,
-4.267817, -3.103602, 0,
-4.087931, -2.939826, 2,
-4.267817, -3.103602, 2,
-4.087931, -2.939826, 4,
-4.267817, -3.103602, 4
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
-4.62759, -3.431152, -4, 0, -0.5, 0.5, 0.5,
-4.62759, -3.431152, -4, 1, -0.5, 0.5, 0.5,
-4.62759, -3.431152, -4, 1, 1.5, 0.5, 0.5,
-4.62759, -3.431152, -4, 0, 1.5, 0.5, 0.5,
-4.62759, -3.431152, -2, 0, -0.5, 0.5, 0.5,
-4.62759, -3.431152, -2, 1, -0.5, 0.5, 0.5,
-4.62759, -3.431152, -2, 1, 1.5, 0.5, 0.5,
-4.62759, -3.431152, -2, 0, 1.5, 0.5, 0.5,
-4.62759, -3.431152, 0, 0, -0.5, 0.5, 0.5,
-4.62759, -3.431152, 0, 1, -0.5, 0.5, 0.5,
-4.62759, -3.431152, 0, 1, 1.5, 0.5, 0.5,
-4.62759, -3.431152, 0, 0, 1.5, 0.5, 0.5,
-4.62759, -3.431152, 2, 0, -0.5, 0.5, 0.5,
-4.62759, -3.431152, 2, 1, -0.5, 0.5, 0.5,
-4.62759, -3.431152, 2, 1, 1.5, 0.5, 0.5,
-4.62759, -3.431152, 2, 0, 1.5, 0.5, 0.5,
-4.62759, -3.431152, 4, 0, -0.5, 0.5, 0.5,
-4.62759, -3.431152, 4, 1, -0.5, 0.5, 0.5,
-4.62759, -3.431152, 4, 1, 1.5, 0.5, 0.5,
-4.62759, -3.431152, 4, 0, 1.5, 0.5, 0.5
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
-4.087931, -2.939826, -5.453363,
-4.087931, 3.61119, -5.453363,
-4.087931, -2.939826, 6.0113,
-4.087931, 3.61119, 6.0113,
-4.087931, -2.939826, -5.453363,
-4.087931, -2.939826, 6.0113,
-4.087931, 3.61119, -5.453363,
-4.087931, 3.61119, 6.0113,
-4.087931, -2.939826, -5.453363,
3.107517, -2.939826, -5.453363,
-4.087931, -2.939826, 6.0113,
3.107517, -2.939826, 6.0113,
-4.087931, 3.61119, -5.453363,
3.107517, 3.61119, -5.453363,
-4.087931, 3.61119, 6.0113,
3.107517, 3.61119, 6.0113,
3.107517, -2.939826, -5.453363,
3.107517, 3.61119, -5.453363,
3.107517, -2.939826, 6.0113,
3.107517, 3.61119, 6.0113,
3.107517, -2.939826, -5.453363,
3.107517, -2.939826, 6.0113,
3.107517, 3.61119, -5.453363,
3.107517, 3.61119, 6.0113
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
var radius = 8.029775;
var distance = 35.72538;
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
mvMatrix.translate( 0.490207, -0.3356818, -0.2789683 );
mvMatrix.scale( 1.206589, 1.325283, 0.7572792 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.72538);
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
cyano-pyrazole<-read.table("cyano-pyrazole.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyano-pyrazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyano' not found
```

```r
y<-cyano-pyrazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyano' not found
```

```r
z<-cyano-pyrazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyano' not found
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
-3.983143, 0.6892513, -1.951853, 0, 0, 1, 1, 1,
-3.419729, 0.3641638, 0.2066254, 1, 0, 0, 1, 1,
-3.299836, -1.043375, -2.538821, 1, 0, 0, 1, 1,
-2.972108, -0.82288, -0.8959102, 1, 0, 0, 1, 1,
-2.653629, -0.9681011, -3.483631, 1, 0, 0, 1, 1,
-2.442612, 0.1019298, -2.867661, 1, 0, 0, 1, 1,
-2.351993, -1.224191, -2.293342, 0, 0, 0, 1, 1,
-2.320977, -0.6782407, -0.9519592, 0, 0, 0, 1, 1,
-2.278904, -0.2658049, -1.506745, 0, 0, 0, 1, 1,
-2.270721, -0.5182706, -1.999007, 0, 0, 0, 1, 1,
-2.245576, 0.1885011, -1.584825, 0, 0, 0, 1, 1,
-2.178097, -0.1931587, 0.7173784, 0, 0, 0, 1, 1,
-2.158863, -0.3455345, -1.481743, 0, 0, 0, 1, 1,
-2.137511, 0.01781803, -1.160696, 1, 1, 1, 1, 1,
-2.04102, -0.6121224, -1.067619, 1, 1, 1, 1, 1,
-2.027155, 1.911649, -0.07437115, 1, 1, 1, 1, 1,
-2.021163, 0.07662895, -3.281839, 1, 1, 1, 1, 1,
-1.974185, 0.0625449, -3.490879, 1, 1, 1, 1, 1,
-1.965131, 0.7196551, -0.5052931, 1, 1, 1, 1, 1,
-1.941848, 0.4940105, -0.3306704, 1, 1, 1, 1, 1,
-1.914034, 1.042687, -2.660006, 1, 1, 1, 1, 1,
-1.89618, 0.8635759, -1.163748, 1, 1, 1, 1, 1,
-1.864998, -0.07533968, -2.556454, 1, 1, 1, 1, 1,
-1.852727, -1.807099, -1.786304, 1, 1, 1, 1, 1,
-1.836823, -1.025856, -2.032002, 1, 1, 1, 1, 1,
-1.833164, -1.175231, -3.715159, 1, 1, 1, 1, 1,
-1.827583, 2.804151, -0.7418659, 1, 1, 1, 1, 1,
-1.82366, -0.005550878, -1.736253, 1, 1, 1, 1, 1,
-1.823099, -0.5613655, -2.230871, 0, 0, 1, 1, 1,
-1.799425, 0.8461915, 0.1584719, 1, 0, 0, 1, 1,
-1.780291, 0.5663182, -2.063573, 1, 0, 0, 1, 1,
-1.778069, -0.7537851, -1.959642, 1, 0, 0, 1, 1,
-1.764447, 0.4102609, -2.113009, 1, 0, 0, 1, 1,
-1.760099, -0.9286484, -2.379552, 1, 0, 0, 1, 1,
-1.755051, -0.6759222, -2.097506, 0, 0, 0, 1, 1,
-1.755038, 0.2978103, -1.144383, 0, 0, 0, 1, 1,
-1.747816, -0.3126647, -2.683346, 0, 0, 0, 1, 1,
-1.73015, -1.694928, -2.189053, 0, 0, 0, 1, 1,
-1.716005, 0.5987719, -1.843567, 0, 0, 0, 1, 1,
-1.709163, 2.019247, 0.316033, 0, 0, 0, 1, 1,
-1.690859, -0.2079862, -2.037899, 0, 0, 0, 1, 1,
-1.689983, -0.465386, -2.351887, 1, 1, 1, 1, 1,
-1.6878, -0.2231793, -0.8793537, 1, 1, 1, 1, 1,
-1.659196, -1.149224, -2.144794, 1, 1, 1, 1, 1,
-1.640432, 0.9630672, 0.2729567, 1, 1, 1, 1, 1,
-1.640347, -0.4113454, -2.593151, 1, 1, 1, 1, 1,
-1.637684, 0.02108871, -0.7859684, 1, 1, 1, 1, 1,
-1.633945, 1.88757, -0.1876522, 1, 1, 1, 1, 1,
-1.633881, -1.274759, -3.264627, 1, 1, 1, 1, 1,
-1.631454, -0.88368, -2.270044, 1, 1, 1, 1, 1,
-1.62843, -0.3721485, -2.841807, 1, 1, 1, 1, 1,
-1.617558, -0.2892355, -2.966647, 1, 1, 1, 1, 1,
-1.616912, -0.3882749, -2.03681, 1, 1, 1, 1, 1,
-1.613191, 0.8086677, 0.5029412, 1, 1, 1, 1, 1,
-1.605339, 0.2973728, 0.3553027, 1, 1, 1, 1, 1,
-1.592835, 0.4415154, -2.589379, 1, 1, 1, 1, 1,
-1.585461, 0.7107496, -1.474791, 0, 0, 1, 1, 1,
-1.584817, 0.02427647, -0.8715905, 1, 0, 0, 1, 1,
-1.567349, 1.198066, -0.6090122, 1, 0, 0, 1, 1,
-1.559267, 0.007404125, -0.9668044, 1, 0, 0, 1, 1,
-1.554007, -0.1776003, -1.39961, 1, 0, 0, 1, 1,
-1.544728, -0.6708646, -1.753556, 1, 0, 0, 1, 1,
-1.543191, 1.102438, 0.3342793, 0, 0, 0, 1, 1,
-1.536898, 0.04456208, -0.5453822, 0, 0, 0, 1, 1,
-1.536467, 0.3077024, -3.270241, 0, 0, 0, 1, 1,
-1.534677, -1.617585, -3.087906, 0, 0, 0, 1, 1,
-1.529112, -0.1455283, -0.9179137, 0, 0, 0, 1, 1,
-1.524359, 0.09630998, -1.645382, 0, 0, 0, 1, 1,
-1.52184, 0.08340664, -2.072492, 0, 0, 0, 1, 1,
-1.521782, -0.3232935, -1.910089, 1, 1, 1, 1, 1,
-1.513698, -0.4273077, -0.7676502, 1, 1, 1, 1, 1,
-1.509415, -0.1324743, 0.8014449, 1, 1, 1, 1, 1,
-1.50049, -0.1562918, -1.455358, 1, 1, 1, 1, 1,
-1.497695, 0.7410755, 0.3912117, 1, 1, 1, 1, 1,
-1.46808, 2.08372, -0.141971, 1, 1, 1, 1, 1,
-1.461724, 0.9886292, -2.651324, 1, 1, 1, 1, 1,
-1.413211, -1.716717, -4.233276, 1, 1, 1, 1, 1,
-1.408207, 1.093372, 0.8122309, 1, 1, 1, 1, 1,
-1.402638, 0.5466139, -1.216209, 1, 1, 1, 1, 1,
-1.397514, 0.09611192, -1.623966, 1, 1, 1, 1, 1,
-1.389429, -0.6283907, -2.177742, 1, 1, 1, 1, 1,
-1.385604, -1.355768, -3.319122, 1, 1, 1, 1, 1,
-1.377864, 0.7533082, -2.346738, 1, 1, 1, 1, 1,
-1.37006, 0.3406505, -1.325408, 1, 1, 1, 1, 1,
-1.367567, 0.2734781, -0.9202673, 0, 0, 1, 1, 1,
-1.360471, 0.005093547, -3.207566, 1, 0, 0, 1, 1,
-1.357927, -2.540624, -2.664974, 1, 0, 0, 1, 1,
-1.352861, -0.9589711, -2.473063, 1, 0, 0, 1, 1,
-1.351419, -0.0831064, -2.173185, 1, 0, 0, 1, 1,
-1.335566, -0.491079, -1.632458, 1, 0, 0, 1, 1,
-1.325298, -0.7718121, -1.624392, 0, 0, 0, 1, 1,
-1.319378, 0.2475576, -1.455131, 0, 0, 0, 1, 1,
-1.317744, 0.9878857, -1.035106, 0, 0, 0, 1, 1,
-1.316089, -0.667627, -1.852127, 0, 0, 0, 1, 1,
-1.310479, -0.08693694, 0.08944474, 0, 0, 0, 1, 1,
-1.310412, -0.216187, -1.447472, 0, 0, 0, 1, 1,
-1.307747, 0.4181816, -1.21784, 0, 0, 0, 1, 1,
-1.306778, -1.011781, -1.795669, 1, 1, 1, 1, 1,
-1.306427, 0.2630765, -1.69146, 1, 1, 1, 1, 1,
-1.298644, -0.1189028, -2.241934, 1, 1, 1, 1, 1,
-1.298077, 0.8880607, -1.506975, 1, 1, 1, 1, 1,
-1.288402, -0.02232199, -2.137578, 1, 1, 1, 1, 1,
-1.284767, 0.0009766761, -1.520831, 1, 1, 1, 1, 1,
-1.269222, 1.738431, -1.281066, 1, 1, 1, 1, 1,
-1.267865, -1.323446, -2.564277, 1, 1, 1, 1, 1,
-1.244075, -0.8416691, -3.664829, 1, 1, 1, 1, 1,
-1.237851, -2.844423, -1.754586, 1, 1, 1, 1, 1,
-1.23548, 2.421872, -1.205788, 1, 1, 1, 1, 1,
-1.232918, -1.425057, -2.472252, 1, 1, 1, 1, 1,
-1.232067, -0.4571339, -2.397291, 1, 1, 1, 1, 1,
-1.218361, -0.5305709, -3.135309, 1, 1, 1, 1, 1,
-1.217625, 0.7944756, 1.754448, 1, 1, 1, 1, 1,
-1.217513, 0.2367251, -1.904956, 0, 0, 1, 1, 1,
-1.213852, -1.117077, -1.714684, 1, 0, 0, 1, 1,
-1.197184, 0.625055, -1.281716, 1, 0, 0, 1, 1,
-1.191769, 1.571664, -0.4893113, 1, 0, 0, 1, 1,
-1.190426, 0.6813332, 0.7362176, 1, 0, 0, 1, 1,
-1.188055, 1.31888, 1.607312, 1, 0, 0, 1, 1,
-1.179411, 0.2638713, -2.33395, 0, 0, 0, 1, 1,
-1.16579, -1.175242, -1.217318, 0, 0, 0, 1, 1,
-1.164738, 0.4238092, -1.104851, 0, 0, 0, 1, 1,
-1.162537, 0.2988744, 0.7688606, 0, 0, 0, 1, 1,
-1.162109, 2.921313, 0.3666455, 0, 0, 0, 1, 1,
-1.141402, -0.8533419, -3.704784, 0, 0, 0, 1, 1,
-1.134558, -1.573565, -0.3563016, 0, 0, 0, 1, 1,
-1.13024, -1.389133, -3.197004, 1, 1, 1, 1, 1,
-1.127603, 0.637652, -1.331405, 1, 1, 1, 1, 1,
-1.125573, -0.05477527, -1.542435, 1, 1, 1, 1, 1,
-1.121661, -1.025563, -3.150731, 1, 1, 1, 1, 1,
-1.090436, -0.0855641, -2.29923, 1, 1, 1, 1, 1,
-1.085926, -0.1146074, -2.505969, 1, 1, 1, 1, 1,
-1.078183, -1.542252, -1.291472, 1, 1, 1, 1, 1,
-1.07083, -1.069004, -3.38713, 1, 1, 1, 1, 1,
-1.070323, 0.9200091, 0.432654, 1, 1, 1, 1, 1,
-1.06573, -0.04399862, -2.391936, 1, 1, 1, 1, 1,
-1.063873, 0.5641655, -1.664701, 1, 1, 1, 1, 1,
-1.06127, 2.635263, -0.995599, 1, 1, 1, 1, 1,
-1.060904, -0.8792145, -1.083898, 1, 1, 1, 1, 1,
-1.058108, 1.022171, 1.167929, 1, 1, 1, 1, 1,
-1.055463, -1.752584, -2.455154, 1, 1, 1, 1, 1,
-1.047382, 0.04572218, -2.186758, 0, 0, 1, 1, 1,
-1.043197, -0.8677574, -1.276449, 1, 0, 0, 1, 1,
-1.038888, -2.317371, -3.340477, 1, 0, 0, 1, 1,
-1.027815, 0.8478313, -0.04169657, 1, 0, 0, 1, 1,
-1.020659, 0.3587893, -1.509349, 1, 0, 0, 1, 1,
-1.020595, -0.5412416, -0.8916582, 1, 0, 0, 1, 1,
-1.020588, -0.5519345, -4.070107, 0, 0, 0, 1, 1,
-1.017846, -0.4027619, -1.725027, 0, 0, 0, 1, 1,
-1.012876, -0.9907355, -1.986805, 0, 0, 0, 1, 1,
-1.011, 2.297695, 0.1480169, 0, 0, 0, 1, 1,
-1.006196, 0.9116459, -3.423265, 0, 0, 0, 1, 1,
-1.001499, 0.988107, -0.9072047, 0, 0, 0, 1, 1,
-1.000505, 1.107566, -0.08728467, 0, 0, 0, 1, 1,
-0.9999235, 0.7575896, 0.6026097, 1, 1, 1, 1, 1,
-0.9976512, -0.5427684, -2.302691, 1, 1, 1, 1, 1,
-0.994217, -0.8893192, -0.3183388, 1, 1, 1, 1, 1,
-0.9852838, -0.7197329, -3.124365, 1, 1, 1, 1, 1,
-0.9767285, -0.03970991, 0.1869952, 1, 1, 1, 1, 1,
-0.9763638, 0.7987434, -0.4966421, 1, 1, 1, 1, 1,
-0.9732001, -1.361352, -2.73666, 1, 1, 1, 1, 1,
-0.9682348, -0.9852543, -1.68562, 1, 1, 1, 1, 1,
-0.9666963, 0.2405152, -3.257076, 1, 1, 1, 1, 1,
-0.9661981, 0.1758066, -2.096129, 1, 1, 1, 1, 1,
-0.9644729, -0.1899788, -2.517398, 1, 1, 1, 1, 1,
-0.9510129, -0.5540919, -2.662741, 1, 1, 1, 1, 1,
-0.9504654, 0.1205175, -0.9245707, 1, 1, 1, 1, 1,
-0.9363992, 0.04060121, -1.389783, 1, 1, 1, 1, 1,
-0.9339641, 1.08982, 0.6731714, 1, 1, 1, 1, 1,
-0.9303855, 0.9670938, -0.9668213, 0, 0, 1, 1, 1,
-0.9276258, -0.08257151, -2.192145, 1, 0, 0, 1, 1,
-0.9275401, -0.8122362, -2.301486, 1, 0, 0, 1, 1,
-0.9138223, -0.4452406, -3.109623, 1, 0, 0, 1, 1,
-0.9025188, 0.4623566, -2.453229, 1, 0, 0, 1, 1,
-0.9022442, 1.416655, 0.8485539, 1, 0, 0, 1, 1,
-0.8981503, -0.3803233, -3.218852, 0, 0, 0, 1, 1,
-0.8892167, -0.7020107, -2.625618, 0, 0, 0, 1, 1,
-0.8793214, 0.08884345, -2.722503, 0, 0, 0, 1, 1,
-0.8787358, -0.5522262, -2.524659, 0, 0, 0, 1, 1,
-0.8773334, 0.2165546, -0.5209523, 0, 0, 0, 1, 1,
-0.8708389, -1.245272, -2.369958, 0, 0, 0, 1, 1,
-0.8689385, -0.886084, -1.365994, 0, 0, 0, 1, 1,
-0.866874, 0.8820684, -1.61917, 1, 1, 1, 1, 1,
-0.8662249, 1.080884, -1.304077, 1, 1, 1, 1, 1,
-0.8624329, -0.07602759, -2.115937, 1, 1, 1, 1, 1,
-0.8570581, 0.0754776, -1.428941, 1, 1, 1, 1, 1,
-0.8522252, -0.7895712, -2.756835, 1, 1, 1, 1, 1,
-0.8522133, -0.9224772, -2.810544, 1, 1, 1, 1, 1,
-0.85109, -0.4352144, -3.78169, 1, 1, 1, 1, 1,
-0.8463534, -0.04807511, -1.577457, 1, 1, 1, 1, 1,
-0.8413638, 0.3551596, -1.259409, 1, 1, 1, 1, 1,
-0.8384196, 0.5980285, -3.068188, 1, 1, 1, 1, 1,
-0.8311458, -0.374281, -2.004433, 1, 1, 1, 1, 1,
-0.8301502, -1.466195, -3.116596, 1, 1, 1, 1, 1,
-0.8216247, 0.8328775, -0.6006327, 1, 1, 1, 1, 1,
-0.8100242, 1.100612, 0.06258964, 1, 1, 1, 1, 1,
-0.799958, 0.5362515, 1.386694, 1, 1, 1, 1, 1,
-0.7998229, -1.454944, -4.673694, 0, 0, 1, 1, 1,
-0.7892585, 1.603198, 0.6198243, 1, 0, 0, 1, 1,
-0.7881889, 1.10158, -1.548839, 1, 0, 0, 1, 1,
-0.7683616, -0.6145334, -1.861781, 1, 0, 0, 1, 1,
-0.7668672, -0.8469791, -1.370755, 1, 0, 0, 1, 1,
-0.7667248, 0.004679302, -1.903274, 1, 0, 0, 1, 1,
-0.764757, -0.1583526, -0.2590929, 0, 0, 0, 1, 1,
-0.7636265, -0.7153586, -3.187658, 0, 0, 0, 1, 1,
-0.7631382, 0.3738414, -0.7716876, 0, 0, 0, 1, 1,
-0.7606289, -0.4350424, -2.988907, 0, 0, 0, 1, 1,
-0.7589715, -0.4929644, -1.688252, 0, 0, 0, 1, 1,
-0.750118, -1.740874, -3.339257, 0, 0, 0, 1, 1,
-0.7468978, 0.02450734, -2.505913, 0, 0, 0, 1, 1,
-0.7462577, -0.3897456, -2.087318, 1, 1, 1, 1, 1,
-0.744961, -0.09675901, -0.6955861, 1, 1, 1, 1, 1,
-0.7445258, 0.3334885, -1.424283, 1, 1, 1, 1, 1,
-0.7410542, 0.5061807, -1.226073, 1, 1, 1, 1, 1,
-0.7398241, 0.5755361, -1.406297, 1, 1, 1, 1, 1,
-0.7287506, 0.6417925, -1.268279, 1, 1, 1, 1, 1,
-0.7283174, -0.2007297, -2.003865, 1, 1, 1, 1, 1,
-0.7217378, 0.1465637, -2.789509, 1, 1, 1, 1, 1,
-0.7185146, -0.1322027, -2.054229, 1, 1, 1, 1, 1,
-0.7180608, 0.4916073, -1.885597, 1, 1, 1, 1, 1,
-0.7161985, 0.6643855, -0.8375794, 1, 1, 1, 1, 1,
-0.7161641, 0.6798133, -0.8767833, 1, 1, 1, 1, 1,
-0.7155617, -0.2670359, -0.5186582, 1, 1, 1, 1, 1,
-0.7144898, -0.3390029, -2.299108, 1, 1, 1, 1, 1,
-0.7121631, -0.1192679, -2.704211, 1, 1, 1, 1, 1,
-0.7053204, -0.1858184, -1.685233, 0, 0, 1, 1, 1,
-0.7039071, 0.5043526, -0.7491944, 1, 0, 0, 1, 1,
-0.7020372, 0.9339689, 1.811725, 1, 0, 0, 1, 1,
-0.6996958, -0.8683062, -1.417008, 1, 0, 0, 1, 1,
-0.6913518, 0.3973342, -2.020384, 1, 0, 0, 1, 1,
-0.6867768, 0.4079504, -1.33114, 1, 0, 0, 1, 1,
-0.6854926, -0.6180449, -0.9574382, 0, 0, 0, 1, 1,
-0.6833184, -0.1927433, -3.357435, 0, 0, 0, 1, 1,
-0.6817444, -0.4669487, -1.213297, 0, 0, 0, 1, 1,
-0.6813582, -0.3080006, -2.67296, 0, 0, 0, 1, 1,
-0.6800258, -0.4704444, -2.313799, 0, 0, 0, 1, 1,
-0.678277, -0.988279, -2.90182, 0, 0, 0, 1, 1,
-0.6727474, 0.4296693, -2.563907, 0, 0, 0, 1, 1,
-0.6699007, -1.493745, -2.199136, 1, 1, 1, 1, 1,
-0.6689252, -0.4846272, -2.944618, 1, 1, 1, 1, 1,
-0.6685585, -1.060645, -1.847289, 1, 1, 1, 1, 1,
-0.6685327, -0.113963, -1.332201, 1, 1, 1, 1, 1,
-0.6676607, 1.205172, -1.775525, 1, 1, 1, 1, 1,
-0.6587004, -1.480689, -2.35881, 1, 1, 1, 1, 1,
-0.6537665, -0.2420851, -1.032979, 1, 1, 1, 1, 1,
-0.6518769, -0.7613068, -4.671835, 1, 1, 1, 1, 1,
-0.6485562, -0.2549618, -1.513436, 1, 1, 1, 1, 1,
-0.6481385, 1.072205, -1.148908, 1, 1, 1, 1, 1,
-0.6434174, -2.328175, -2.414153, 1, 1, 1, 1, 1,
-0.638328, 0.1003903, 1.936351, 1, 1, 1, 1, 1,
-0.6383034, -0.6681139, -3.230977, 1, 1, 1, 1, 1,
-0.6374106, -0.1943747, -4.050996, 1, 1, 1, 1, 1,
-0.6289685, -0.05970755, -2.250267, 1, 1, 1, 1, 1,
-0.6282112, 0.2243418, -0.306033, 0, 0, 1, 1, 1,
-0.6241425, 0.5297528, -2.231815, 1, 0, 0, 1, 1,
-0.6233138, 0.3726636, -2.99858, 1, 0, 0, 1, 1,
-0.6154209, 0.01139531, -1.385872, 1, 0, 0, 1, 1,
-0.6132706, -0.2486942, -2.693811, 1, 0, 0, 1, 1,
-0.6098937, -0.659942, -2.494575, 1, 0, 0, 1, 1,
-0.6076206, 0.7734019, -1.030372, 0, 0, 0, 1, 1,
-0.6075054, -1.816659, -3.174552, 0, 0, 0, 1, 1,
-0.6073607, -1.284931, -3.088504, 0, 0, 0, 1, 1,
-0.6070456, -0.1381875, -3.016671, 0, 0, 0, 1, 1,
-0.6069079, -1.15409, -3.460523, 0, 0, 0, 1, 1,
-0.6067462, 0.2754513, -0.210607, 0, 0, 0, 1, 1,
-0.6046945, 0.3207157, 0.8663925, 0, 0, 0, 1, 1,
-0.6017817, 0.5393024, -1.832211, 1, 1, 1, 1, 1,
-0.6004478, -1.138992, -1.562697, 1, 1, 1, 1, 1,
-0.5951591, 0.7572569, 0.9428447, 1, 1, 1, 1, 1,
-0.5915892, 0.297179, -0.7358243, 1, 1, 1, 1, 1,
-0.5893619, -0.9293572, -1.918388, 1, 1, 1, 1, 1,
-0.5843294, 0.5760404, -1.933098, 1, 1, 1, 1, 1,
-0.5835903, -0.09546225, -0.3830933, 1, 1, 1, 1, 1,
-0.5765368, 1.658059, -1.555607, 1, 1, 1, 1, 1,
-0.5764462, -0.6098675, -2.770111, 1, 1, 1, 1, 1,
-0.5749273, 0.2719572, 0.07360689, 1, 1, 1, 1, 1,
-0.5737423, 0.2242484, -0.603438, 1, 1, 1, 1, 1,
-0.5695301, 0.8021124, -2.744012, 1, 1, 1, 1, 1,
-0.5693288, -1.259061, -2.048362, 1, 1, 1, 1, 1,
-0.5681785, -1.477417, -1.909582, 1, 1, 1, 1, 1,
-0.5676442, -1.32249, -3.336949, 1, 1, 1, 1, 1,
-0.566235, 0.6709446, -1.539155, 0, 0, 1, 1, 1,
-0.5623623, -0.2793178, -2.729838, 1, 0, 0, 1, 1,
-0.5590045, -0.2012717, -1.413693, 1, 0, 0, 1, 1,
-0.5588003, 0.4165752, -2.244854, 1, 0, 0, 1, 1,
-0.556944, -2.611231, -3.313965, 1, 0, 0, 1, 1,
-0.5558354, 0.8185505, -0.7041684, 1, 0, 0, 1, 1,
-0.5512416, 0.6662521, -0.3345928, 0, 0, 0, 1, 1,
-0.5491621, -0.6548883, -1.292872, 0, 0, 0, 1, 1,
-0.5448174, -0.3668028, -3.861915, 0, 0, 0, 1, 1,
-0.5445921, -0.8843639, -1.721184, 0, 0, 0, 1, 1,
-0.5407094, 0.09949403, -2.260383, 0, 0, 0, 1, 1,
-0.5335087, -0.9817249, -1.882635, 0, 0, 0, 1, 1,
-0.5295687, 1.078783, 0.6634267, 0, 0, 0, 1, 1,
-0.5278035, 0.1702514, 1.014747, 1, 1, 1, 1, 1,
-0.5204987, 0.7638045, 1.152614, 1, 1, 1, 1, 1,
-0.5156435, 0.1929613, -1.340023, 1, 1, 1, 1, 1,
-0.5146747, -1.269371, -5.286402, 1, 1, 1, 1, 1,
-0.5115315, 1.280432, -1.057002, 1, 1, 1, 1, 1,
-0.5045328, -0.3541168, -1.64755, 1, 1, 1, 1, 1,
-0.5006506, -0.2567403, -1.447316, 1, 1, 1, 1, 1,
-0.497529, -2.316117, -2.863889, 1, 1, 1, 1, 1,
-0.4948574, -0.1930001, -1.616544, 1, 1, 1, 1, 1,
-0.4925354, 0.2155432, -0.9979511, 1, 1, 1, 1, 1,
-0.4908521, -0.8263751, -3.239627, 1, 1, 1, 1, 1,
-0.4882466, 0.1639585, -1.261735, 1, 1, 1, 1, 1,
-0.4876499, 0.1559226, 0.3933702, 1, 1, 1, 1, 1,
-0.4789249, -1.216381, -2.051018, 1, 1, 1, 1, 1,
-0.476285, -0.5337466, -2.814634, 1, 1, 1, 1, 1,
-0.4749126, -0.2712161, -1.982862, 0, 0, 1, 1, 1,
-0.474724, 0.01539142, -0.9981689, 1, 0, 0, 1, 1,
-0.4733235, 0.2512475, -0.9758499, 1, 0, 0, 1, 1,
-0.4716209, 0.6503096, -1.125741, 1, 0, 0, 1, 1,
-0.4711932, 1.992699, -1.428755, 1, 0, 0, 1, 1,
-0.4617182, 0.006356779, -2.259519, 1, 0, 0, 1, 1,
-0.4501102, -1.376536, -1.433014, 0, 0, 0, 1, 1,
-0.4498304, -0.4826763, -2.041258, 0, 0, 0, 1, 1,
-0.448093, 0.6195064, -1.209199, 0, 0, 0, 1, 1,
-0.4469413, 0.1761979, -0.4564723, 0, 0, 0, 1, 1,
-0.4454731, 0.5787603, -1.416081, 0, 0, 0, 1, 1,
-0.4439178, 0.0258512, -1.773887, 0, 0, 0, 1, 1,
-0.4414006, -1.324494, -2.198451, 0, 0, 0, 1, 1,
-0.4408872, 0.5445818, -1.889282, 1, 1, 1, 1, 1,
-0.4402227, -0.6872911, -2.002884, 1, 1, 1, 1, 1,
-0.4399159, -1.632235, -4.660423, 1, 1, 1, 1, 1,
-0.4372824, 0.376067, -0.2261997, 1, 1, 1, 1, 1,
-0.4296311, 0.3589475, -1.502609, 1, 1, 1, 1, 1,
-0.4237224, 0.8838295, 0.9820756, 1, 1, 1, 1, 1,
-0.4215527, -0.2775949, -0.8082127, 1, 1, 1, 1, 1,
-0.4209759, 0.1927949, -1.030038, 1, 1, 1, 1, 1,
-0.4156974, 2.609519, -0.1140735, 1, 1, 1, 1, 1,
-0.4093834, -0.799441, -2.300144, 1, 1, 1, 1, 1,
-0.4056568, -0.4913828, -0.1912358, 1, 1, 1, 1, 1,
-0.4046878, -0.814341, -4.376823, 1, 1, 1, 1, 1,
-0.4019989, -1.393517, -2.834515, 1, 1, 1, 1, 1,
-0.3978879, -0.8854311, -3.587231, 1, 1, 1, 1, 1,
-0.3956853, 0.5048909, -1.662856, 1, 1, 1, 1, 1,
-0.39067, 0.08865615, -1.829827, 0, 0, 1, 1, 1,
-0.3900405, -0.2261097, -1.54524, 1, 0, 0, 1, 1,
-0.3870168, 2.349642, 0.4604224, 1, 0, 0, 1, 1,
-0.3838724, -1.513265, -4.315047, 1, 0, 0, 1, 1,
-0.3834396, 0.2193482, -1.057289, 1, 0, 0, 1, 1,
-0.3797503, 0.03036839, -3.689321, 1, 0, 0, 1, 1,
-0.3786224, 0.1045974, -1.716354, 0, 0, 0, 1, 1,
-0.3647323, -0.0590657, -0.8188745, 0, 0, 0, 1, 1,
-0.363681, -0.6064833, -2.141948, 0, 0, 0, 1, 1,
-0.3623317, 1.478428, -1.744969, 0, 0, 0, 1, 1,
-0.3619783, 2.272498, 0.2177712, 0, 0, 0, 1, 1,
-0.3594225, 1.967809, -0.9532345, 0, 0, 0, 1, 1,
-0.3585957, 0.3475516, -0.01455191, 0, 0, 0, 1, 1,
-0.3542758, 0.8580893, -1.88277, 1, 1, 1, 1, 1,
-0.3529354, -0.5821355, -2.20679, 1, 1, 1, 1, 1,
-0.3523079, 1.561005, -1.141422, 1, 1, 1, 1, 1,
-0.3485193, 1.128349, -0.5039675, 1, 1, 1, 1, 1,
-0.3456363, -1.360244, -1.205646, 1, 1, 1, 1, 1,
-0.3436053, 0.3624761, -1.949647, 1, 1, 1, 1, 1,
-0.3430402, -0.4000049, -0.4009891, 1, 1, 1, 1, 1,
-0.3430183, -0.2726265, -2.173089, 1, 1, 1, 1, 1,
-0.3327217, -0.7976896, -2.775346, 1, 1, 1, 1, 1,
-0.3295035, 0.6767887, -0.2946703, 1, 1, 1, 1, 1,
-0.3253902, -1.099446, -1.786161, 1, 1, 1, 1, 1,
-0.3249867, -1.173924, -3.139376, 1, 1, 1, 1, 1,
-0.3242381, -0.1742925, -0.8667285, 1, 1, 1, 1, 1,
-0.323544, 0.2939692, -1.549205, 1, 1, 1, 1, 1,
-0.3194923, -0.7011887, -3.406943, 1, 1, 1, 1, 1,
-0.3176458, -1.557431, -2.587094, 0, 0, 1, 1, 1,
-0.3156158, 0.3873622, -0.5510998, 1, 0, 0, 1, 1,
-0.3139271, 0.1097205, -1.236399, 1, 0, 0, 1, 1,
-0.3124944, -0.0761314, -1.938811, 1, 0, 0, 1, 1,
-0.3109227, 0.351107, -0.72587, 1, 0, 0, 1, 1,
-0.3090345, 0.6603711, 0.09261232, 1, 0, 0, 1, 1,
-0.2988334, -0.01218591, -0.316234, 0, 0, 0, 1, 1,
-0.2985106, -0.4861616, -2.340121, 0, 0, 0, 1, 1,
-0.296845, -0.01550973, -2.111474, 0, 0, 0, 1, 1,
-0.2956012, 1.377414, -0.09505607, 0, 0, 0, 1, 1,
-0.2947707, 1.712344, 0.4062941, 0, 0, 0, 1, 1,
-0.2946788, 1.477545, -2.325054, 0, 0, 0, 1, 1,
-0.2845701, -1.936227, -2.496481, 0, 0, 0, 1, 1,
-0.2791212, 0.1859167, -0.670287, 1, 1, 1, 1, 1,
-0.2770393, 1.350802, 0.3428803, 1, 1, 1, 1, 1,
-0.2770107, -0.1152221, -1.209993, 1, 1, 1, 1, 1,
-0.2761915, 0.0510102, -1.775889, 1, 1, 1, 1, 1,
-0.2720574, -1.226903, -2.126424, 1, 1, 1, 1, 1,
-0.270327, 0.5947709, -0.5241298, 1, 1, 1, 1, 1,
-0.2602375, 0.9310334, -1.805496, 1, 1, 1, 1, 1,
-0.2578558, -1.064565, -2.072113, 1, 1, 1, 1, 1,
-0.2564757, 0.6108742, 1.002837, 1, 1, 1, 1, 1,
-0.2539908, -0.3053502, -2.699143, 1, 1, 1, 1, 1,
-0.2512422, 2.582093, 0.1588881, 1, 1, 1, 1, 1,
-0.2499624, 0.1407863, -0.673925, 1, 1, 1, 1, 1,
-0.248667, 0.8594214, 0.01374439, 1, 1, 1, 1, 1,
-0.243911, -0.4935457, -4.531851, 1, 1, 1, 1, 1,
-0.2385417, -1.869923, -3.128611, 1, 1, 1, 1, 1,
-0.2366225, -1.174767, -0.7699742, 0, 0, 1, 1, 1,
-0.231442, -0.8354717, -2.611167, 1, 0, 0, 1, 1,
-0.2227856, -0.4561434, -2.184204, 1, 0, 0, 1, 1,
-0.2223221, 0.5664381, -1.203011, 1, 0, 0, 1, 1,
-0.2219173, -0.5275823, -2.181319, 1, 0, 0, 1, 1,
-0.2213182, 0.1727474, 0.0277251, 1, 0, 0, 1, 1,
-0.2042122, 1.705487, 0.2501447, 0, 0, 0, 1, 1,
-0.202883, 0.3940032, -0.539553, 0, 0, 0, 1, 1,
-0.2023515, -0.9229527, -3.20818, 0, 0, 0, 1, 1,
-0.1996464, 0.8602926, 0.8191323, 0, 0, 0, 1, 1,
-0.1985392, -0.3317738, -3.513852, 0, 0, 0, 1, 1,
-0.1981745, 0.256806, -0.890995, 0, 0, 0, 1, 1,
-0.1972684, 1.745336, -1.339154, 0, 0, 0, 1, 1,
-0.1969397, -0.8266778, -2.23023, 1, 1, 1, 1, 1,
-0.194595, -0.1388925, -3.348884, 1, 1, 1, 1, 1,
-0.1914469, 0.7727146, 2.329704, 1, 1, 1, 1, 1,
-0.1911836, -0.0673498, -2.733158, 1, 1, 1, 1, 1,
-0.1902507, -0.004632474, -2.856004, 1, 1, 1, 1, 1,
-0.1902227, 0.5002139, 0.160994, 1, 1, 1, 1, 1,
-0.1878968, 0.1857475, -0.4665035, 1, 1, 1, 1, 1,
-0.1819204, 0.236692, -0.2167806, 1, 1, 1, 1, 1,
-0.1784084, 0.7328542, 0.3107541, 1, 1, 1, 1, 1,
-0.1762353, -0.4354925, -2.232314, 1, 1, 1, 1, 1,
-0.1745421, 0.07956148, -1.962552, 1, 1, 1, 1, 1,
-0.1715848, -1.27485, -1.378657, 1, 1, 1, 1, 1,
-0.1710188, -0.3863944, -2.156633, 1, 1, 1, 1, 1,
-0.1665468, 0.008768891, -0.7329725, 1, 1, 1, 1, 1,
-0.1638779, -0.7111624, -2.173474, 1, 1, 1, 1, 1,
-0.1625162, 0.1625605, -0.4573832, 0, 0, 1, 1, 1,
-0.1555826, 0.04233393, -0.4361696, 1, 0, 0, 1, 1,
-0.1551895, 0.6972039, 0.7270732, 1, 0, 0, 1, 1,
-0.1533887, -1.011132, -4.615815, 1, 0, 0, 1, 1,
-0.1511689, -0.4835875, -2.518671, 1, 0, 0, 1, 1,
-0.1500596, 0.9668232, 1.582395, 1, 0, 0, 1, 1,
-0.1435658, 1.027277, 0.009017821, 0, 0, 0, 1, 1,
-0.1404264, -0.3151114, -0.3475051, 0, 0, 0, 1, 1,
-0.1389325, -1.330778, -3.823744, 0, 0, 0, 1, 1,
-0.1297098, -1.455705, -3.600974, 0, 0, 0, 1, 1,
-0.1295629, 0.3299443, 1.440311, 0, 0, 0, 1, 1,
-0.1284256, 0.00617449, -1.090684, 0, 0, 0, 1, 1,
-0.1260672, -0.8173767, -1.692508, 0, 0, 0, 1, 1,
-0.1231403, 0.7889018, 0.5187858, 1, 1, 1, 1, 1,
-0.1228226, -0.4491619, -3.520579, 1, 1, 1, 1, 1,
-0.1159157, 0.8214962, -0.6541998, 1, 1, 1, 1, 1,
-0.1137825, -0.8760312, -3.248999, 1, 1, 1, 1, 1,
-0.112977, -0.6402016, -2.812775, 1, 1, 1, 1, 1,
-0.112844, 0.8969134, 0.0984709, 1, 1, 1, 1, 1,
-0.1063443, 0.787034, -0.3970771, 1, 1, 1, 1, 1,
-0.1057376, 0.3461272, -1.453902, 1, 1, 1, 1, 1,
-0.1052684, -0.7762901, -3.325319, 1, 1, 1, 1, 1,
-0.1050202, -0.2295451, -2.885351, 1, 1, 1, 1, 1,
-0.1041363, -0.4834346, -3.137476, 1, 1, 1, 1, 1,
-0.09836678, 1.011722, -0.4635368, 1, 1, 1, 1, 1,
-0.09418608, -0.008492407, -1.526485, 1, 1, 1, 1, 1,
-0.08505859, -0.8175182, -1.795851, 1, 1, 1, 1, 1,
-0.08280277, 0.4185266, -1.959508, 1, 1, 1, 1, 1,
-0.07716253, 0.8196464, 0.7743683, 0, 0, 1, 1, 1,
-0.07683547, -0.3011582, -4.881221, 1, 0, 0, 1, 1,
-0.07629369, -0.901913, -2.094558, 1, 0, 0, 1, 1,
-0.0726317, 0.4419507, -0.7986737, 1, 0, 0, 1, 1,
-0.07207323, -1.240935, -4.070345, 1, 0, 0, 1, 1,
-0.07157136, -0.5477235, -2.744935, 1, 0, 0, 1, 1,
-0.07087792, -1.732253, -3.154423, 0, 0, 0, 1, 1,
-0.06588954, -0.680874, -1.894056, 0, 0, 0, 1, 1,
-0.06262534, -0.6164692, -3.143537, 0, 0, 0, 1, 1,
-0.06008605, -1.360984, -2.638418, 0, 0, 0, 1, 1,
-0.05777269, -0.3039826, -3.345336, 0, 0, 0, 1, 1,
-0.05542881, -0.9285423, -1.297114, 0, 0, 0, 1, 1,
-0.0552528, 0.460736, 0.3464517, 0, 0, 0, 1, 1,
-0.05435926, -0.09310984, -3.320816, 1, 1, 1, 1, 1,
-0.05084376, -1.100393, -2.135717, 1, 1, 1, 1, 1,
-0.04986892, -0.3901888, -1.553067, 1, 1, 1, 1, 1,
-0.04671423, 0.0101589, -2.568295, 1, 1, 1, 1, 1,
-0.04319924, 0.01013188, -0.9309956, 1, 1, 1, 1, 1,
-0.03793105, -0.1059541, -5.145845, 1, 1, 1, 1, 1,
-0.03485066, 0.4181538, 0.7716399, 1, 1, 1, 1, 1,
-0.03279211, 0.1182869, -0.6999046, 1, 1, 1, 1, 1,
-0.02790566, -1.458144, -4.170266, 1, 1, 1, 1, 1,
-0.0271801, 0.6243178, -0.157923, 1, 1, 1, 1, 1,
-0.02715335, -1.476524, -0.641381, 1, 1, 1, 1, 1,
-0.02426834, 0.8919566, -0.126636, 1, 1, 1, 1, 1,
-0.02119495, 1.295326, 0.3024199, 1, 1, 1, 1, 1,
-0.01635828, -0.1003169, -3.475879, 1, 1, 1, 1, 1,
-0.01413945, -0.002906802, 0.06793466, 1, 1, 1, 1, 1,
-0.00985752, -1.159016, -5.062501, 0, 0, 1, 1, 1,
-0.009134467, 1.590713, -0.4191968, 1, 0, 0, 1, 1,
-0.008992536, -0.599199, -3.128347, 1, 0, 0, 1, 1,
-0.008249247, -0.09892321, -2.000525, 1, 0, 0, 1, 1,
-0.007376384, 0.8872474, -0.7485, 1, 0, 0, 1, 1,
-0.006661524, 0.4533258, -0.3246198, 1, 0, 0, 1, 1,
-0.006237819, -0.1557169, -2.955211, 0, 0, 0, 1, 1,
-0.002947744, 0.5969692, 0.4193171, 0, 0, 0, 1, 1,
-0.002704932, 1.277106, -1.42783, 0, 0, 0, 1, 1,
-0.001138708, -0.9667702, -4.147479, 0, 0, 0, 1, 1,
0.0002932026, 1.728362, 0.09117693, 0, 0, 0, 1, 1,
0.001789586, 0.134783, 1.811895, 0, 0, 0, 1, 1,
0.004301389, 0.6183712, 0.0908013, 0, 0, 0, 1, 1,
0.01133078, 0.5180257, 0.4944746, 1, 1, 1, 1, 1,
0.01168285, 1.222676, 0.4797726, 1, 1, 1, 1, 1,
0.01440933, -0.5309294, 4.419713, 1, 1, 1, 1, 1,
0.01810579, 1.007964, -1.043133, 1, 1, 1, 1, 1,
0.02077165, -1.257897, 3.666428, 1, 1, 1, 1, 1,
0.02334431, -0.4674582, 2.828354, 1, 1, 1, 1, 1,
0.02679448, 0.9167005, 0.6535047, 1, 1, 1, 1, 1,
0.02934622, -0.5855604, 2.593591, 1, 1, 1, 1, 1,
0.02992232, -1.701468, 4.757686, 1, 1, 1, 1, 1,
0.03795291, -0.5083848, 3.971528, 1, 1, 1, 1, 1,
0.03808505, -0.2777216, 1.259809, 1, 1, 1, 1, 1,
0.04700875, 0.07081694, 1.039368, 1, 1, 1, 1, 1,
0.04757759, 0.7011935, -0.9824116, 1, 1, 1, 1, 1,
0.05119586, -0.7279263, 2.717456, 1, 1, 1, 1, 1,
0.05152186, -0.009988626, 0.7712489, 1, 1, 1, 1, 1,
0.05470131, -0.6737989, 2.512594, 0, 0, 1, 1, 1,
0.05710375, 1.826563, -0.366448, 1, 0, 0, 1, 1,
0.05857146, -0.3092025, 3.064967, 1, 0, 0, 1, 1,
0.06240205, 1.03855, -0.1649284, 1, 0, 0, 1, 1,
0.06682751, -0.3295933, 3.38091, 1, 0, 0, 1, 1,
0.07030816, 0.8782944, -0.4868837, 1, 0, 0, 1, 1,
0.07080684, 2.091803, -2.111798, 0, 0, 0, 1, 1,
0.07144408, -1.046637, 2.44194, 0, 0, 0, 1, 1,
0.07385536, 0.007074432, 2.252612, 0, 0, 0, 1, 1,
0.07495223, 0.3608378, 0.7245368, 0, 0, 0, 1, 1,
0.07734, 0.1406818, 1.434278, 0, 0, 0, 1, 1,
0.08181109, -0.4946822, 3.028514, 0, 0, 0, 1, 1,
0.08417461, -0.6815183, 2.475708, 0, 0, 0, 1, 1,
0.08454949, -1.062121, 2.356183, 1, 1, 1, 1, 1,
0.08474307, 0.4216363, 0.3340034, 1, 1, 1, 1, 1,
0.09122518, -0.1808041, 1.151279, 1, 1, 1, 1, 1,
0.09167261, 0.4559747, -0.5461067, 1, 1, 1, 1, 1,
0.09318988, 1.090337, 0.0177533, 1, 1, 1, 1, 1,
0.09916555, 1.356609, -0.8679258, 1, 1, 1, 1, 1,
0.1020731, 1.016833, 0.436233, 1, 1, 1, 1, 1,
0.106185, -0.5839278, 3.150195, 1, 1, 1, 1, 1,
0.1071389, -1.786552, 3.013313, 1, 1, 1, 1, 1,
0.1078594, -0.1717737, 2.568295, 1, 1, 1, 1, 1,
0.1092376, -0.06869636, 2.675895, 1, 1, 1, 1, 1,
0.1120042, 0.03672935, 1.056959, 1, 1, 1, 1, 1,
0.1131067, 0.6459859, 0.9581122, 1, 1, 1, 1, 1,
0.1131523, -0.5966955, 3.221794, 1, 1, 1, 1, 1,
0.1160981, 0.1039707, 0.5878742, 1, 1, 1, 1, 1,
0.1197326, -0.4834858, 4.078245, 0, 0, 1, 1, 1,
0.1197336, -2.258033, 2.69296, 1, 0, 0, 1, 1,
0.1219364, -0.7141786, 3.59616, 1, 0, 0, 1, 1,
0.1229347, -1.043132, 3.354296, 1, 0, 0, 1, 1,
0.1241723, -0.04932809, 0.3796297, 1, 0, 0, 1, 1,
0.1271729, -0.1401671, 2.379127, 1, 0, 0, 1, 1,
0.1298857, 1.058652, 0.2377817, 0, 0, 0, 1, 1,
0.1401243, -0.8785602, 2.620506, 0, 0, 0, 1, 1,
0.1433541, -0.3229824, 1.792331, 0, 0, 0, 1, 1,
0.1473531, 0.5843972, -1.808365, 0, 0, 0, 1, 1,
0.1496062, -0.2887073, 2.674722, 0, 0, 0, 1, 1,
0.1509555, -2.065074, 2.924686, 0, 0, 0, 1, 1,
0.15162, -0.1169417, 2.219785, 0, 0, 0, 1, 1,
0.1525044, 0.1775275, -1.075242, 1, 1, 1, 1, 1,
0.1541039, -2.217974, 3.579168, 1, 1, 1, 1, 1,
0.1544653, -1.553017, 2.362557, 1, 1, 1, 1, 1,
0.158431, 0.7998937, 1.681056, 1, 1, 1, 1, 1,
0.1596653, 0.2025464, 0.8540431, 1, 1, 1, 1, 1,
0.1625821, 0.03336166, 1.275585, 1, 1, 1, 1, 1,
0.1650085, -0.6479366, 5.388134, 1, 1, 1, 1, 1,
0.1667575, 1.048507, -0.1062517, 1, 1, 1, 1, 1,
0.178462, 1.037707, 0.8616557, 1, 1, 1, 1, 1,
0.1810968, -0.7532679, 2.346997, 1, 1, 1, 1, 1,
0.1834389, 1.516088, 2.181079, 1, 1, 1, 1, 1,
0.184058, -0.2364489, 2.907266, 1, 1, 1, 1, 1,
0.1861356, 1.422175, -0.6611931, 1, 1, 1, 1, 1,
0.1865622, 0.5811722, 0.6887243, 1, 1, 1, 1, 1,
0.1866195, -1.197516, 2.640214, 1, 1, 1, 1, 1,
0.1964964, 0.7669051, 1.026479, 0, 0, 1, 1, 1,
0.1966108, 0.05471868, 1.331018, 1, 0, 0, 1, 1,
0.1991654, -0.3855673, 2.631998, 1, 0, 0, 1, 1,
0.2061858, 1.040381, 1.57637, 1, 0, 0, 1, 1,
0.2116289, -0.6228542, 1.441457, 1, 0, 0, 1, 1,
0.2177643, 0.8057808, -0.9915051, 1, 0, 0, 1, 1,
0.2226318, -0.5247663, 2.53934, 0, 0, 0, 1, 1,
0.2237355, 0.6767312, 0.4992569, 0, 0, 0, 1, 1,
0.2242896, 1.044897, 1.313396, 0, 0, 0, 1, 1,
0.2260156, -0.2907062, 1.401972, 0, 0, 0, 1, 1,
0.2264801, -0.1039632, 4.18585, 0, 0, 0, 1, 1,
0.2279741, 1.184948, 0.9524325, 0, 0, 0, 1, 1,
0.2288094, 0.3992738, 1.081374, 0, 0, 0, 1, 1,
0.2301509, 0.9504833, 1.584923, 1, 1, 1, 1, 1,
0.2303112, -0.8303064, 4.152913, 1, 1, 1, 1, 1,
0.2364064, -1.870403, 3.550699, 1, 1, 1, 1, 1,
0.2373809, 0.1165657, 1.474687, 1, 1, 1, 1, 1,
0.2394765, -1.119337, 0.6653584, 1, 1, 1, 1, 1,
0.2404094, 0.8423166, -1.10268, 1, 1, 1, 1, 1,
0.2412112, 0.6132348, 2.1321, 1, 1, 1, 1, 1,
0.2414048, -1.381888, 1.393373, 1, 1, 1, 1, 1,
0.2424419, 1.973093, -0.05840627, 1, 1, 1, 1, 1,
0.2440201, 0.2319875, -0.06128274, 1, 1, 1, 1, 1,
0.2449113, -1.762936, 4.853482, 1, 1, 1, 1, 1,
0.2470184, -1.306975, 2.172268, 1, 1, 1, 1, 1,
0.2500605, -0.7637055, 3.11073, 1, 1, 1, 1, 1,
0.2528912, 0.6231828, 0.3642488, 1, 1, 1, 1, 1,
0.2541291, 2.104282, -2.300039, 1, 1, 1, 1, 1,
0.2584809, -0.2438176, 3.093243, 0, 0, 1, 1, 1,
0.2588083, 1.331028, -0.4323714, 1, 0, 0, 1, 1,
0.2667192, -0.564974, 2.971395, 1, 0, 0, 1, 1,
0.267147, 0.2580352, -0.1990776, 1, 0, 0, 1, 1,
0.2706377, 1.107458, 0.8960924, 1, 0, 0, 1, 1,
0.2711539, 0.3409889, 0.7782726, 1, 0, 0, 1, 1,
0.2715434, 0.5275925, -0.181561, 0, 0, 0, 1, 1,
0.274907, -0.7304469, 3.003316, 0, 0, 0, 1, 1,
0.2752706, -0.1946724, 2.987394, 0, 0, 0, 1, 1,
0.2754207, 0.7483618, 1.446112, 0, 0, 0, 1, 1,
0.2763215, -2.201834, 1.717035, 0, 0, 0, 1, 1,
0.2833534, 1.885421, 0.7733917, 0, 0, 0, 1, 1,
0.2834975, -1.506776, 1.54731, 0, 0, 0, 1, 1,
0.2854205, -1.307057, 3.878561, 1, 1, 1, 1, 1,
0.2858542, 0.3476592, 0.7755074, 1, 1, 1, 1, 1,
0.2894279, 1.525881, -0.367349, 1, 1, 1, 1, 1,
0.2912155, 1.177257, -0.5082698, 1, 1, 1, 1, 1,
0.2936716, 0.4329796, 2.853688, 1, 1, 1, 1, 1,
0.2956704, 0.7835703, 0.2389858, 1, 1, 1, 1, 1,
0.2965337, -0.3854218, 1.38488, 1, 1, 1, 1, 1,
0.2985036, 1.314597, 1.746113, 1, 1, 1, 1, 1,
0.3048156, 1.192399, 1.521138, 1, 1, 1, 1, 1,
0.3120064, 1.413269, -0.3212719, 1, 1, 1, 1, 1,
0.3135749, -0.3247134, 0.564568, 1, 1, 1, 1, 1,
0.3176006, 1.081246, 0.3483709, 1, 1, 1, 1, 1,
0.3203509, 0.3643593, 0.8634605, 1, 1, 1, 1, 1,
0.3220474, 0.854697, -0.6759094, 1, 1, 1, 1, 1,
0.3259992, -1.909863, 3.238093, 1, 1, 1, 1, 1,
0.3294106, -0.6360564, 2.347213, 0, 0, 1, 1, 1,
0.3349028, 1.239123, 1.097023, 1, 0, 0, 1, 1,
0.3365488, -0.891426, 5.844338, 1, 0, 0, 1, 1,
0.3465654, -0.1335291, 2.701377, 1, 0, 0, 1, 1,
0.3482489, 0.7150117, 0.04865689, 1, 0, 0, 1, 1,
0.3500791, -0.2442978, 2.519384, 1, 0, 0, 1, 1,
0.3505915, 1.112387, -0.09630203, 0, 0, 0, 1, 1,
0.3579795, -0.03650039, 1.154274, 0, 0, 0, 1, 1,
0.3600535, 0.5456328, 0.5581025, 0, 0, 0, 1, 1,
0.3618883, 0.9967644, -0.4924036, 0, 0, 0, 1, 1,
0.367386, 1.47949, -0.7348619, 0, 0, 0, 1, 1,
0.3677331, -1.299924, 4.696677, 0, 0, 0, 1, 1,
0.3685394, 0.2930139, 0.0828338, 0, 0, 0, 1, 1,
0.3693302, -1.254808, 2.715037, 1, 1, 1, 1, 1,
0.3696093, -0.8836679, 3.579112, 1, 1, 1, 1, 1,
0.3759661, -0.4631777, 2.248144, 1, 1, 1, 1, 1,
0.3796419, -0.8726591, 1.404846, 1, 1, 1, 1, 1,
0.3878569, -1.195839, 2.884259, 1, 1, 1, 1, 1,
0.3903045, 0.3170471, 2.633142, 1, 1, 1, 1, 1,
0.3950848, -0.1630818, 3.584169, 1, 1, 1, 1, 1,
0.4030613, -0.5051119, 2.656761, 1, 1, 1, 1, 1,
0.4045969, 0.0417018, 1.790281, 1, 1, 1, 1, 1,
0.4092176, -0.2860842, 2.794384, 1, 1, 1, 1, 1,
0.4096145, -1.452221, 4.393696, 1, 1, 1, 1, 1,
0.4108194, -0.3655114, 2.65462, 1, 1, 1, 1, 1,
0.411966, -2.43279, 2.458852, 1, 1, 1, 1, 1,
0.4133519, -0.8766332, 1.46061, 1, 1, 1, 1, 1,
0.4155945, 0.2015022, 1.755392, 1, 1, 1, 1, 1,
0.415808, 0.4607989, -0.5484717, 0, 0, 1, 1, 1,
0.4161565, 0.1264536, 1.181831, 1, 0, 0, 1, 1,
0.4205244, -0.7221504, 1.754339, 1, 0, 0, 1, 1,
0.4237003, 0.3467302, 1.58299, 1, 0, 0, 1, 1,
0.4291008, -0.4876751, 3.481396, 1, 0, 0, 1, 1,
0.4293275, 0.7640099, 1.32815, 1, 0, 0, 1, 1,
0.4296123, 0.45368, 2.153977, 0, 0, 0, 1, 1,
0.4300189, -0.8533408, 3.127956, 0, 0, 0, 1, 1,
0.4315745, 0.4367765, 1.309055, 0, 0, 0, 1, 1,
0.432419, -0.2568552, 0.9101285, 0, 0, 0, 1, 1,
0.4328198, -0.9495662, 1.738341, 0, 0, 0, 1, 1,
0.4345427, -0.2098168, 3.047626, 0, 0, 0, 1, 1,
0.4362037, 1.155426, -0.08232579, 0, 0, 0, 1, 1,
0.4391941, -0.3251953, 3.192378, 1, 1, 1, 1, 1,
0.441503, -0.004164225, 2.280946, 1, 1, 1, 1, 1,
0.444538, 1.465535, -1.670222, 1, 1, 1, 1, 1,
0.4462078, 1.344537, 0.1778728, 1, 1, 1, 1, 1,
0.4524639, 0.01272143, 2.78468, 1, 1, 1, 1, 1,
0.4556608, -0.3622529, 1.268034, 1, 1, 1, 1, 1,
0.4558508, -1.426013, 2.04273, 1, 1, 1, 1, 1,
0.458319, 0.2401363, 1.825116, 1, 1, 1, 1, 1,
0.4596991, -0.7543408, 2.164411, 1, 1, 1, 1, 1,
0.4641168, -1.207232, 3.653269, 1, 1, 1, 1, 1,
0.4722505, 0.5711166, -1.145802, 1, 1, 1, 1, 1,
0.4743336, 0.4658841, -0.4909941, 1, 1, 1, 1, 1,
0.4804567, 1.500048, 0.4145505, 1, 1, 1, 1, 1,
0.4856934, -0.1727269, 0.5184917, 1, 1, 1, 1, 1,
0.490669, 0.336908, 0.5904722, 1, 1, 1, 1, 1,
0.4917248, -1.499006, 1.956004, 0, 0, 1, 1, 1,
0.4931598, 1.24467, -0.05950917, 1, 0, 0, 1, 1,
0.5013242, 0.7588179, 1.635364, 1, 0, 0, 1, 1,
0.502304, -0.381128, 1.172848, 1, 0, 0, 1, 1,
0.5201559, -0.191821, 1.710581, 1, 0, 0, 1, 1,
0.5259077, -0.1457307, 1.223397, 1, 0, 0, 1, 1,
0.5301508, 1.57465, 0.8465573, 0, 0, 0, 1, 1,
0.5338069, 0.4488791, 0.8122995, 0, 0, 0, 1, 1,
0.5363327, 3.515787, -0.4481649, 0, 0, 0, 1, 1,
0.5388491, 0.1050612, 2.116666, 0, 0, 0, 1, 1,
0.5393005, -1.818473, 2.58814, 0, 0, 0, 1, 1,
0.5415031, 0.5938072, 2.283501, 0, 0, 0, 1, 1,
0.5426036, -0.7952397, 2.304299, 0, 0, 0, 1, 1,
0.5464288, 0.8829737, 0.7405625, 1, 1, 1, 1, 1,
0.5489382, 0.3215773, -0.2897226, 1, 1, 1, 1, 1,
0.5507309, -0.2212093, 1.289999, 1, 1, 1, 1, 1,
0.5526857, 0.6006331, 1.23634, 1, 1, 1, 1, 1,
0.5536158, -0.5196648, 2.419343, 1, 1, 1, 1, 1,
0.5536196, -0.1621616, 1.399666, 1, 1, 1, 1, 1,
0.5594593, -1.70665, 2.031209, 1, 1, 1, 1, 1,
0.5598309, 0.9091815, 0.01248585, 1, 1, 1, 1, 1,
0.5639569, -0.2904907, 2.240236, 1, 1, 1, 1, 1,
0.5640213, 0.7950268, -0.8462723, 1, 1, 1, 1, 1,
0.5649367, -1.006899, 1.56475, 1, 1, 1, 1, 1,
0.5652347, 1.326279, -0.2561382, 1, 1, 1, 1, 1,
0.5660469, -0.09082332, 0.03706073, 1, 1, 1, 1, 1,
0.5660604, -0.3553976, 1.859165, 1, 1, 1, 1, 1,
0.5691917, -1.544908, 2.343313, 1, 1, 1, 1, 1,
0.5726717, 0.914911, 2.585548, 0, 0, 1, 1, 1,
0.5805718, 0.8361073, 1.294924, 1, 0, 0, 1, 1,
0.5841952, -0.4084096, 1.87279, 1, 0, 0, 1, 1,
0.5859967, -1.194118, 1.051881, 1, 0, 0, 1, 1,
0.5861062, -1.466583, 1.004255, 1, 0, 0, 1, 1,
0.5963303, -1.338094, 1.566937, 1, 0, 0, 1, 1,
0.602556, -0.2041627, 2.038456, 0, 0, 0, 1, 1,
0.6032108, 2.407466, -0.4621006, 0, 0, 0, 1, 1,
0.6054978, -0.2704453, 2.384766, 0, 0, 0, 1, 1,
0.607418, 0.226187, 0.2654109, 0, 0, 0, 1, 1,
0.6108576, 0.8250357, 0.2296795, 0, 0, 0, 1, 1,
0.615829, 0.8129744, -1.2458, 0, 0, 0, 1, 1,
0.6209847, 1.281043, 0.8685541, 0, 0, 0, 1, 1,
0.6211357, -0.3287626, 1.625118, 1, 1, 1, 1, 1,
0.6225039, -0.6046619, 2.446043, 1, 1, 1, 1, 1,
0.6229105, -0.8320934, 0.7485291, 1, 1, 1, 1, 1,
0.6283467, -1.346997, -0.2188168, 1, 1, 1, 1, 1,
0.6298199, 0.6988724, 1.227876, 1, 1, 1, 1, 1,
0.631844, -1.594594, 2.006167, 1, 1, 1, 1, 1,
0.6353936, 0.3466652, 0.5619588, 1, 1, 1, 1, 1,
0.6476792, -0.9317746, 1.68879, 1, 1, 1, 1, 1,
0.6524159, 0.3273324, 1.147969, 1, 1, 1, 1, 1,
0.65632, -1.595156, 2.417994, 1, 1, 1, 1, 1,
0.6622432, -0.9483019, 3.614932, 1, 1, 1, 1, 1,
0.6683563, -1.330293, 2.779906, 1, 1, 1, 1, 1,
0.6696282, 0.9827375, 2.550897, 1, 1, 1, 1, 1,
0.6714177, 1.873933, -0.04101893, 1, 1, 1, 1, 1,
0.6718493, 0.04150233, 0.07561377, 1, 1, 1, 1, 1,
0.6769741, 2.58456, 0.8899084, 0, 0, 1, 1, 1,
0.6801187, -0.4853401, 2.561355, 1, 0, 0, 1, 1,
0.6815042, -0.9233104, 2.441815, 1, 0, 0, 1, 1,
0.6823353, -0.322793, 2.271866, 1, 0, 0, 1, 1,
0.6845015, 1.694542, 1.130091, 1, 0, 0, 1, 1,
0.6846029, -2.432538, 4.693925, 1, 0, 0, 1, 1,
0.6856048, 0.6152264, 2.086774, 0, 0, 0, 1, 1,
0.6869094, -1.57293, 2.902499, 0, 0, 0, 1, 1,
0.6963733, 1.601726, 1.866992, 0, 0, 0, 1, 1,
0.7135977, 1.626549, 0.6019787, 0, 0, 0, 1, 1,
0.7166656, 1.435609, -0.08031757, 0, 0, 0, 1, 1,
0.7187436, -0.8414636, 1.46697, 0, 0, 0, 1, 1,
0.7209839, -0.98225, 3.016565, 0, 0, 0, 1, 1,
0.7256624, -1.265372, 1.307069, 1, 1, 1, 1, 1,
0.7382861, 0.2658336, -0.08885556, 1, 1, 1, 1, 1,
0.7386231, -0.1275364, 1.313626, 1, 1, 1, 1, 1,
0.7405473, -2.265102, 3.272719, 1, 1, 1, 1, 1,
0.7436771, -0.7146148, 3.761499, 1, 1, 1, 1, 1,
0.7471298, -0.3228613, 1.951805, 1, 1, 1, 1, 1,
0.7574165, -0.1143061, 0.9590097, 1, 1, 1, 1, 1,
0.7582601, 1.775402, 1.129396, 1, 1, 1, 1, 1,
0.7584432, -0.1668701, 1.857224, 1, 1, 1, 1, 1,
0.759784, 0.3041819, -1.58209, 1, 1, 1, 1, 1,
0.7655908, -0.3368979, 3.20391, 1, 1, 1, 1, 1,
0.7710698, 0.3753113, 1.514118, 1, 1, 1, 1, 1,
0.7811297, 1.26277, 0.5371693, 1, 1, 1, 1, 1,
0.7841102, 0.6584794, 1.950677, 1, 1, 1, 1, 1,
0.7844506, -1.351425, 3.45477, 1, 1, 1, 1, 1,
0.7871299, -2.241707, 3.867499, 0, 0, 1, 1, 1,
0.7873275, 0.2619648, -0.0598561, 1, 0, 0, 1, 1,
0.7876316, -0.9970237, 2.413317, 1, 0, 0, 1, 1,
0.7894611, -0.8114739, 0.8679292, 1, 0, 0, 1, 1,
0.7907281, 0.8013229, 1.76057, 1, 0, 0, 1, 1,
0.7950445, 0.234855, 1.458375, 1, 0, 0, 1, 1,
0.796238, -0.1344788, 2.292621, 0, 0, 0, 1, 1,
0.7965961, -1.503018, 3.264414, 0, 0, 0, 1, 1,
0.7994055, 0.01995972, 1.137689, 0, 0, 0, 1, 1,
0.799782, 0.361384, -0.675999, 0, 0, 0, 1, 1,
0.8025678, -0.2741915, 3.201152, 0, 0, 0, 1, 1,
0.805074, 0.1229254, 2.12974, 0, 0, 0, 1, 1,
0.8141249, -0.9419938, 2.606425, 0, 0, 0, 1, 1,
0.8159872, -1.387808, 2.294454, 1, 1, 1, 1, 1,
0.8250039, -0.4291779, 1.851176, 1, 1, 1, 1, 1,
0.8260949, 0.2684651, 2.399683, 1, 1, 1, 1, 1,
0.8264887, -2.180847, 2.811269, 1, 1, 1, 1, 1,
0.8270777, -2.371355, 0.9867995, 1, 1, 1, 1, 1,
0.8277115, -0.4003636, 2.585223, 1, 1, 1, 1, 1,
0.8342362, 0.1008254, 2.026824, 1, 1, 1, 1, 1,
0.8387704, 1.126213, 0.7906107, 1, 1, 1, 1, 1,
0.8395072, -0.7358002, 1.752041, 1, 1, 1, 1, 1,
0.8404343, -0.2628117, 3.394434, 1, 1, 1, 1, 1,
0.841471, 0.9697788, -0.3845723, 1, 1, 1, 1, 1,
0.842437, 1.323478, 0.8114787, 1, 1, 1, 1, 1,
0.8439992, -1.574544, 3.287578, 1, 1, 1, 1, 1,
0.8476177, 0.4861661, 2.09374, 1, 1, 1, 1, 1,
0.8623326, -1.767159, 3.110611, 1, 1, 1, 1, 1,
0.8673438, 0.1771025, -0.08948271, 0, 0, 1, 1, 1,
0.8681797, -0.3147884, 1.618039, 1, 0, 0, 1, 1,
0.8684364, -0.03287227, 0.5656947, 1, 0, 0, 1, 1,
0.8726739, 0.5692732, 3.458861, 1, 0, 0, 1, 1,
0.8731008, 2.559941, 1.354699, 1, 0, 0, 1, 1,
0.8738354, -1.252184, 3.184622, 1, 0, 0, 1, 1,
0.8749793, -0.01241034, 2.586737, 0, 0, 0, 1, 1,
0.8762677, 0.8493434, 0.6337636, 0, 0, 0, 1, 1,
0.8807437, 2.601291, 0.5360448, 0, 0, 0, 1, 1,
0.8809581, 0.7521637, 1.222777, 0, 0, 0, 1, 1,
0.881137, 0.2710508, 1.818494, 0, 0, 0, 1, 1,
0.8820679, -0.3559705, 3.997849, 0, 0, 0, 1, 1,
0.8826994, 1.315214, 1.062141, 0, 0, 0, 1, 1,
0.8838796, 0.6302891, -0.2368283, 1, 1, 1, 1, 1,
0.8865851, 1.863462, 0.997778, 1, 1, 1, 1, 1,
0.8909502, 0.4372814, -0.8889136, 1, 1, 1, 1, 1,
0.8911693, -0.2537266, 2.95437, 1, 1, 1, 1, 1,
0.8919138, 0.7683566, 1.730518, 1, 1, 1, 1, 1,
0.8948423, 0.8623376, 2.216942, 1, 1, 1, 1, 1,
0.8976926, 0.8914927, 2.195567, 1, 1, 1, 1, 1,
0.8999289, 0.7861238, 1.41301, 1, 1, 1, 1, 1,
0.9141943, -0.6064339, 3.131257, 1, 1, 1, 1, 1,
0.921667, 1.968263, 1.488646, 1, 1, 1, 1, 1,
0.9238583, 0.2187658, 2.289715, 1, 1, 1, 1, 1,
0.9244335, -0.8303402, 2.556456, 1, 1, 1, 1, 1,
0.9248915, 0.2990712, 0.1358697, 1, 1, 1, 1, 1,
0.9320917, 1.696246, -0.399999, 1, 1, 1, 1, 1,
0.9332929, -2.223536, 1.677787, 1, 1, 1, 1, 1,
0.9406303, 0.5632752, 0.6184066, 0, 0, 1, 1, 1,
0.9426715, 0.3764146, 1.276541, 1, 0, 0, 1, 1,
0.9427157, -0.7057505, 1.021369, 1, 0, 0, 1, 1,
0.9434838, -2.110421, 1.956849, 1, 0, 0, 1, 1,
0.9466639, 1.336365, -0.3046772, 1, 0, 0, 1, 1,
0.951849, -1.225516, 4.036549, 1, 0, 0, 1, 1,
0.955655, -0.4494036, 2.112756, 0, 0, 0, 1, 1,
0.9592373, -0.6471058, 1.483873, 0, 0, 0, 1, 1,
0.9649635, 0.09858389, 0.8670466, 0, 0, 0, 1, 1,
0.9693252, -0.7985831, 2.177928, 0, 0, 0, 1, 1,
0.9721843, -0.7659978, 2.122128, 0, 0, 0, 1, 1,
0.983753, 0.1119891, 0.7897679, 0, 0, 0, 1, 1,
0.9847291, 0.3061579, 2.107324, 0, 0, 0, 1, 1,
0.9875661, -0.5065615, 2.408923, 1, 1, 1, 1, 1,
0.9879793, 0.4139243, 2.57692, 1, 1, 1, 1, 1,
0.9935066, -1.07148, 3.468498, 1, 1, 1, 1, 1,
0.9943174, -0.01723363, -1.028461, 1, 1, 1, 1, 1,
0.9949219, -0.3891195, 0.2706285, 1, 1, 1, 1, 1,
1.00469, -0.6934933, 1.578757, 1, 1, 1, 1, 1,
1.006641, 0.056795, 1.11374, 1, 1, 1, 1, 1,
1.009223, 1.213793, 1.159837, 1, 1, 1, 1, 1,
1.012929, -0.7090101, 2.32673, 1, 1, 1, 1, 1,
1.014021, -0.08754978, 1.756642, 1, 1, 1, 1, 1,
1.018196, 0.7377152, 0.8918347, 1, 1, 1, 1, 1,
1.02393, 0.02903846, 1.408721, 1, 1, 1, 1, 1,
1.026505, 2.038285, 0.04519204, 1, 1, 1, 1, 1,
1.036115, 0.546706, 0.1358098, 1, 1, 1, 1, 1,
1.038144, 0.4886776, 2.78926, 1, 1, 1, 1, 1,
1.039596, -0.987703, 1.817316, 0, 0, 1, 1, 1,
1.040509, -0.06199386, 2.405915, 1, 0, 0, 1, 1,
1.042822, 0.1633719, -0.9573117, 1, 0, 0, 1, 1,
1.052615, 1.222207, 1.068595, 1, 0, 0, 1, 1,
1.068773, -0.3895713, 1.417487, 1, 0, 0, 1, 1,
1.069255, -0.6344582, 2.02957, 1, 0, 0, 1, 1,
1.071766, 1.244767, 0.2418311, 0, 0, 0, 1, 1,
1.07206, -0.4483642, 2.982875, 0, 0, 0, 1, 1,
1.077092, 0.6356161, 2.941813, 0, 0, 0, 1, 1,
1.07717, 0.3057627, -0.8670331, 0, 0, 0, 1, 1,
1.078601, -2.753083, 3.099072, 0, 0, 0, 1, 1,
1.088415, -0.7702725, 2.068936, 0, 0, 0, 1, 1,
1.093427, -0.4911239, 3.179421, 0, 0, 0, 1, 1,
1.099769, -0.4477845, 3.215756, 1, 1, 1, 1, 1,
1.099981, -0.5322211, 0.9440946, 1, 1, 1, 1, 1,
1.101951, -1.631247, 2.513075, 1, 1, 1, 1, 1,
1.104191, 0.4251722, 0.2517658, 1, 1, 1, 1, 1,
1.106427, 0.3977893, 1.51241, 1, 1, 1, 1, 1,
1.108441, 1.396872, -0.2199005, 1, 1, 1, 1, 1,
1.110103, -0.212903, 1.736871, 1, 1, 1, 1, 1,
1.110313, -0.4752025, 1.297482, 1, 1, 1, 1, 1,
1.11064, 0.46373, 0.3687399, 1, 1, 1, 1, 1,
1.111278, 1.454307, 0.5443974, 1, 1, 1, 1, 1,
1.115718, -0.4872475, 2.774536, 1, 1, 1, 1, 1,
1.120317, -0.1476931, 1.116902, 1, 1, 1, 1, 1,
1.123423, -0.3749884, 1.938461, 1, 1, 1, 1, 1,
1.129058, 1.610702, 1.035591, 1, 1, 1, 1, 1,
1.129442, -0.8901936, 2.67492, 1, 1, 1, 1, 1,
1.133184, 0.4173996, 1.099455, 0, 0, 1, 1, 1,
1.133399, 0.4682841, -0.3304424, 1, 0, 0, 1, 1,
1.135577, 0.7500443, 1.625412, 1, 0, 0, 1, 1,
1.138369, -0.1576149, 0.4293621, 1, 0, 0, 1, 1,
1.139703, -0.3494606, 3.185784, 1, 0, 0, 1, 1,
1.143084, 1.042139, 0.9885226, 1, 0, 0, 1, 1,
1.14409, -0.4432317, 1.464233, 0, 0, 0, 1, 1,
1.14502, 0.8717392, 1.661049, 0, 0, 0, 1, 1,
1.153703, -0.1169757, 0.4513496, 0, 0, 0, 1, 1,
1.153926, -0.3908655, 1.168205, 0, 0, 0, 1, 1,
1.156705, -0.209291, 2.376647, 0, 0, 0, 1, 1,
1.159054, -0.3272028, 1.707173, 0, 0, 0, 1, 1,
1.160394, -0.02340947, 1.315473, 0, 0, 0, 1, 1,
1.162498, -0.1784173, 3.881973, 1, 1, 1, 1, 1,
1.165128, 0.4675109, 0.2408835, 1, 1, 1, 1, 1,
1.187895, 1.298298, 1.259354, 1, 1, 1, 1, 1,
1.189033, -0.2386992, 2.40056, 1, 1, 1, 1, 1,
1.193317, -1.233319, 4.349539, 1, 1, 1, 1, 1,
1.198079, -0.3270166, 3.066617, 1, 1, 1, 1, 1,
1.200997, -0.6444228, 1.349294, 1, 1, 1, 1, 1,
1.205394, -2.065814, 2.881939, 1, 1, 1, 1, 1,
1.218372, -2.101917, 2.573277, 1, 1, 1, 1, 1,
1.218984, 0.7611071, 1.322552, 1, 1, 1, 1, 1,
1.229234, -0.4701116, 3.778915, 1, 1, 1, 1, 1,
1.246455, 2.434295, 0.6575249, 1, 1, 1, 1, 1,
1.24708, 1.477901, -0.03060996, 1, 1, 1, 1, 1,
1.247323, -1.091313, 3.868421, 1, 1, 1, 1, 1,
1.252072, 0.2595052, 1.031401, 1, 1, 1, 1, 1,
1.257833, 0.5810917, 2.608371, 0, 0, 1, 1, 1,
1.258502, 0.439254, -1.241153, 1, 0, 0, 1, 1,
1.269337, 0.313289, -0.7603133, 1, 0, 0, 1, 1,
1.278676, 0.4448697, 0.6767441, 1, 0, 0, 1, 1,
1.279123, 0.08095702, 2.16866, 1, 0, 0, 1, 1,
1.280415, -1.076507, 2.042704, 1, 0, 0, 1, 1,
1.282426, -0.9826483, 3.330986, 0, 0, 0, 1, 1,
1.303764, 0.01843724, -0.03894357, 0, 0, 0, 1, 1,
1.316391, -0.304966, 1.676182, 0, 0, 0, 1, 1,
1.317318, -0.5524675, 0.6554599, 0, 0, 0, 1, 1,
1.318982, -1.097832, 0.9156358, 0, 0, 0, 1, 1,
1.327537, -0.6125582, 2.444652, 0, 0, 0, 1, 1,
1.344663, 0.3987526, 1.268452, 0, 0, 0, 1, 1,
1.353804, -0.7452303, 4.334455, 1, 1, 1, 1, 1,
1.353922, -1.520241, 2.02362, 1, 1, 1, 1, 1,
1.359672, -0.5759206, 1.148731, 1, 1, 1, 1, 1,
1.36377, -0.5106762, 3.073581, 1, 1, 1, 1, 1,
1.386137, 0.310897, -0.09816098, 1, 1, 1, 1, 1,
1.392596, 0.084874, 1.935062, 1, 1, 1, 1, 1,
1.400778, -0.350309, 2.999421, 1, 1, 1, 1, 1,
1.407743, -0.01502263, 2.389101, 1, 1, 1, 1, 1,
1.41302, -0.1606734, 0.9750866, 1, 1, 1, 1, 1,
1.426448, -1.816318, 0.5715482, 1, 1, 1, 1, 1,
1.444065, -1.181887, 2.486569, 1, 1, 1, 1, 1,
1.450318, -0.8866959, 2.957664, 1, 1, 1, 1, 1,
1.451633, 0.9177967, 0.7996008, 1, 1, 1, 1, 1,
1.461555, 1.188817, 1.435835, 1, 1, 1, 1, 1,
1.462512, 1.858144, 1.114084, 1, 1, 1, 1, 1,
1.464468, -0.1461334, 2.531041, 0, 0, 1, 1, 1,
1.470201, -1.368337, 2.123165, 1, 0, 0, 1, 1,
1.474102, -0.2876447, -0.0719826, 1, 0, 0, 1, 1,
1.474819, 0.7215868, 2.730478, 1, 0, 0, 1, 1,
1.510173, -0.008199931, 2.552609, 1, 0, 0, 1, 1,
1.522457, -0.3972886, 1.442044, 1, 0, 0, 1, 1,
1.522915, -0.6309173, 1.019702, 0, 0, 0, 1, 1,
1.522924, 0.2010178, 2.381065, 0, 0, 0, 1, 1,
1.526009, 0.8453026, 0.5826101, 0, 0, 0, 1, 1,
1.530845, -0.199591, 1.231381, 0, 0, 0, 1, 1,
1.533746, -1.231508, 4.158195, 0, 0, 0, 1, 1,
1.539929, 1.786882, 2.643147, 0, 0, 0, 1, 1,
1.546293, 0.5005218, 2.717759, 0, 0, 0, 1, 1,
1.555491, 1.292331, 1.391327, 1, 1, 1, 1, 1,
1.566911, -1.287305, 2.711478, 1, 1, 1, 1, 1,
1.568181, 0.5615829, 0.4896345, 1, 1, 1, 1, 1,
1.573997, -0.2464104, 2.404023, 1, 1, 1, 1, 1,
1.576051, -0.1479095, 0.9736844, 1, 1, 1, 1, 1,
1.577721, -0.6259305, 3.343631, 1, 1, 1, 1, 1,
1.596467, 1.642452, 2.044062, 1, 1, 1, 1, 1,
1.622832, -0.1198283, 2.638421, 1, 1, 1, 1, 1,
1.628856, -1.430456, 0.6814114, 1, 1, 1, 1, 1,
1.636729, -0.5958561, 1.737915, 1, 1, 1, 1, 1,
1.665069, -0.4878503, 2.082509, 1, 1, 1, 1, 1,
1.674273, 0.9838824, 1.121413, 1, 1, 1, 1, 1,
1.683971, 0.5546013, -0.6026872, 1, 1, 1, 1, 1,
1.693009, 0.3633177, 0.2302556, 1, 1, 1, 1, 1,
1.71112, 0.3533256, 2.425148, 1, 1, 1, 1, 1,
1.740769, -0.9937301, 1.954688, 0, 0, 1, 1, 1,
1.759485, -0.3546066, 2.980766, 1, 0, 0, 1, 1,
1.788362, -1.008987, 0.9825187, 1, 0, 0, 1, 1,
1.788954, 2.011426, -0.01815863, 1, 0, 0, 1, 1,
1.789327, 0.5437431, 1.710946, 1, 0, 0, 1, 1,
1.799842, 0.2980788, 0.9241034, 1, 0, 0, 1, 1,
1.829046, -0.3427846, 2.601419, 0, 0, 0, 1, 1,
1.841039, 1.115593, 2.425107, 0, 0, 0, 1, 1,
1.845359, 1.434959, 1.526806, 0, 0, 0, 1, 1,
1.85886, 0.5232648, 1.465105, 0, 0, 0, 1, 1,
1.869012, 0.0223553, 2.905138, 0, 0, 0, 1, 1,
1.869596, 1.364933, 2.046107, 0, 0, 0, 1, 1,
1.887306, 0.7368871, 1.119091, 0, 0, 0, 1, 1,
1.891545, -0.2141487, 2.044247, 1, 1, 1, 1, 1,
1.89626, -0.8044549, 3.157822, 1, 1, 1, 1, 1,
1.902762, 0.5534453, 0.5496479, 1, 1, 1, 1, 1,
1.905789, 1.001446, 0.4588504, 1, 1, 1, 1, 1,
1.913019, 0.8696069, -0.5288927, 1, 1, 1, 1, 1,
1.959858, 1.37898, 1.733097, 1, 1, 1, 1, 1,
1.964702, -0.4094931, 3.519667, 1, 1, 1, 1, 1,
1.970486, -0.5050377, 1.218673, 1, 1, 1, 1, 1,
1.984173, 0.3895499, 1.148247, 1, 1, 1, 1, 1,
1.99755, 1.367863, 1.483343, 1, 1, 1, 1, 1,
2.055903, -0.2722083, 0.8445027, 1, 1, 1, 1, 1,
2.076138, 0.8259051, 0.08803353, 1, 1, 1, 1, 1,
2.083464, -0.9288793, 0.5051357, 1, 1, 1, 1, 1,
2.097442, -0.8561739, 1.204757, 1, 1, 1, 1, 1,
2.102782, -1.01817, 1.115318, 1, 1, 1, 1, 1,
2.139022, 0.4835295, 2.311493, 0, 0, 1, 1, 1,
2.168342, -1.393201, 1.996382, 1, 0, 0, 1, 1,
2.208952, -0.1061629, -0.6951031, 1, 0, 0, 1, 1,
2.23865, -0.6146328, 1.578703, 1, 0, 0, 1, 1,
2.240118, -0.3754075, 0.2940665, 1, 0, 0, 1, 1,
2.244186, -2.038122, 1.784307, 1, 0, 0, 1, 1,
2.333317, -0.5589144, 2.904051, 0, 0, 0, 1, 1,
2.334985, 0.5168446, 2.33382, 0, 0, 0, 1, 1,
2.350022, -0.1705263, 2.451004, 0, 0, 0, 1, 1,
2.374547, -1.681301, 2.101557, 0, 0, 0, 1, 1,
2.426593, 1.411842, 1.647215, 0, 0, 0, 1, 1,
2.52308, -1.987679, 2.645368, 0, 0, 0, 1, 1,
2.536594, -0.8093295, 0.8197874, 0, 0, 0, 1, 1,
2.57275, 1.936148, 1.105945, 1, 1, 1, 1, 1,
2.671209, 0.3427655, 1.280793, 1, 1, 1, 1, 1,
2.812227, -2.210051, 3.467404, 1, 1, 1, 1, 1,
2.834976, 0.06440713, -0.4364002, 1, 1, 1, 1, 1,
2.921372, -0.1285357, 0.8020658, 1, 1, 1, 1, 1,
2.949161, 0.2115138, 1.565741, 1, 1, 1, 1, 1,
3.002729, 0.01440281, 1.795363, 1, 1, 1, 1, 1
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
var radius = 9.885557;
var distance = 34.7226;
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
mvMatrix.translate( 0.4902067, -0.3356818, -0.2789683 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.7226);
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
