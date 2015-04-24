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
-2.929824, -0.5913778, -1.082826, 1, 0, 0, 1,
-2.921464, 2.345762, -1.314856, 1, 0.007843138, 0, 1,
-2.915553, -0.7378672, -3.639361, 1, 0.01176471, 0, 1,
-2.905423, -1.705348, -1.624883, 1, 0.01960784, 0, 1,
-2.824919, -0.1220921, -1.565369, 1, 0.02352941, 0, 1,
-2.775312, 0.9007247, -1.468638, 1, 0.03137255, 0, 1,
-2.770627, -0.7952486, -2.700573, 1, 0.03529412, 0, 1,
-2.735583, -0.6660915, -2.156489, 1, 0.04313726, 0, 1,
-2.721633, 0.4928933, -2.708714, 1, 0.04705882, 0, 1,
-2.678887, 0.02538742, -1.882193, 1, 0.05490196, 0, 1,
-2.623603, -1.472397, -2.410626, 1, 0.05882353, 0, 1,
-2.460486, -0.6416212, -0.5432055, 1, 0.06666667, 0, 1,
-2.420042, 1.725529, 0.01175999, 1, 0.07058824, 0, 1,
-2.338619, 0.6476188, -2.373573, 1, 0.07843138, 0, 1,
-2.283134, 0.4152886, -0.3781579, 1, 0.08235294, 0, 1,
-2.280279, 1.362624, -0.6651884, 1, 0.09019608, 0, 1,
-2.259008, -0.1938452, -1.78242, 1, 0.09411765, 0, 1,
-2.198242, -0.8448655, -0.9288936, 1, 0.1019608, 0, 1,
-2.116317, 0.6744047, -1.821146, 1, 0.1098039, 0, 1,
-2.098264, 0.5441115, -0.8691694, 1, 0.1137255, 0, 1,
-2.090324, -0.2023633, -2.637654, 1, 0.1215686, 0, 1,
-2.064622, 0.3627518, -1.579656, 1, 0.1254902, 0, 1,
-2.014297, -0.05297054, -1.518288, 1, 0.1333333, 0, 1,
-2.011819, -0.207314, -0.9108585, 1, 0.1372549, 0, 1,
-1.989111, -0.9942236, -1.809966, 1, 0.145098, 0, 1,
-1.977908, 1.319456, -3.915593, 1, 0.1490196, 0, 1,
-1.971399, 1.371683, -0.6322491, 1, 0.1568628, 0, 1,
-1.970125, -0.3558601, -1.875022, 1, 0.1607843, 0, 1,
-1.938957, 0.476452, -0.8181828, 1, 0.1686275, 0, 1,
-1.929247, 1.382675, -2.802956, 1, 0.172549, 0, 1,
-1.928762, 0.2088881, -0.7213097, 1, 0.1803922, 0, 1,
-1.916975, 2.366887, -1.020054, 1, 0.1843137, 0, 1,
-1.916248, 0.5681818, -0.04579243, 1, 0.1921569, 0, 1,
-1.879337, -0.7431704, -2.384214, 1, 0.1960784, 0, 1,
-1.878694, 0.01333419, -1.06794, 1, 0.2039216, 0, 1,
-1.877946, 1.142743, 0.8236905, 1, 0.2117647, 0, 1,
-1.801893, 0.3069417, -0.8157098, 1, 0.2156863, 0, 1,
-1.785214, -0.2246612, 0.7402151, 1, 0.2235294, 0, 1,
-1.781189, 1.453789, -2.14154, 1, 0.227451, 0, 1,
-1.775034, -2.007837, -2.800982, 1, 0.2352941, 0, 1,
-1.768561, -0.3105823, -0.2327093, 1, 0.2392157, 0, 1,
-1.750847, -0.08439039, -2.059157, 1, 0.2470588, 0, 1,
-1.721654, -0.4821353, -2.051802, 1, 0.2509804, 0, 1,
-1.720427, -0.05318251, -2.299538, 1, 0.2588235, 0, 1,
-1.692754, 0.4245003, 0.1534303, 1, 0.2627451, 0, 1,
-1.663766, -1.477137, -1.37745, 1, 0.2705882, 0, 1,
-1.642826, 0.3786688, 0.2613503, 1, 0.2745098, 0, 1,
-1.631418, 1.544498, -1.717633, 1, 0.282353, 0, 1,
-1.628778, -1.21695, -1.876665, 1, 0.2862745, 0, 1,
-1.62472, 2.003472, 0.2214051, 1, 0.2941177, 0, 1,
-1.591974, -1.061077, -2.576395, 1, 0.3019608, 0, 1,
-1.58587, 0.5013216, -2.149887, 1, 0.3058824, 0, 1,
-1.585737, 0.1061713, -0.9938532, 1, 0.3137255, 0, 1,
-1.57901, 0.2374619, -2.397566, 1, 0.3176471, 0, 1,
-1.577154, 0.2778656, -2.547225, 1, 0.3254902, 0, 1,
-1.559158, -0.09908695, -1.7428, 1, 0.3294118, 0, 1,
-1.552422, -0.04824732, -0.3520649, 1, 0.3372549, 0, 1,
-1.542524, -0.2578206, -2.005591, 1, 0.3411765, 0, 1,
-1.53615, 0.3850855, -1.689547, 1, 0.3490196, 0, 1,
-1.524166, -1.525117, -3.892595, 1, 0.3529412, 0, 1,
-1.521732, 2.485259, 1.69999, 1, 0.3607843, 0, 1,
-1.51098, -0.2848785, -1.966982, 1, 0.3647059, 0, 1,
-1.506825, 0.2536317, -2.738286, 1, 0.372549, 0, 1,
-1.488782, -0.514608, -3.205243, 1, 0.3764706, 0, 1,
-1.480952, -1.320599, -1.725088, 1, 0.3843137, 0, 1,
-1.468122, 0.9146067, 0.4873331, 1, 0.3882353, 0, 1,
-1.462706, -0.1155199, -2.058069, 1, 0.3960784, 0, 1,
-1.458641, 0.07446752, -1.205527, 1, 0.4039216, 0, 1,
-1.454122, -1.293756, -1.271136, 1, 0.4078431, 0, 1,
-1.442206, -0.8106093, -2.505241, 1, 0.4156863, 0, 1,
-1.43768, 0.60337, -0.60623, 1, 0.4196078, 0, 1,
-1.435147, -0.6769742, -1.129223, 1, 0.427451, 0, 1,
-1.434967, -0.07105113, -1.22489, 1, 0.4313726, 0, 1,
-1.433782, 0.5210035, -3.512605, 1, 0.4392157, 0, 1,
-1.433522, -0.02314407, -0.9178157, 1, 0.4431373, 0, 1,
-1.429294, 0.6403818, -1.389314, 1, 0.4509804, 0, 1,
-1.428174, 0.5712914, -1.095138, 1, 0.454902, 0, 1,
-1.415533, 0.3740749, -0.5494269, 1, 0.4627451, 0, 1,
-1.403821, 0.7067122, -2.105688, 1, 0.4666667, 0, 1,
-1.39606, -0.5809974, -2.530156, 1, 0.4745098, 0, 1,
-1.395838, -0.3968804, -2.674149, 1, 0.4784314, 0, 1,
-1.39026, -0.5450693, -2.117804, 1, 0.4862745, 0, 1,
-1.384467, 0.2659316, -2.939196, 1, 0.4901961, 0, 1,
-1.383718, 0.5334444, -1.996839, 1, 0.4980392, 0, 1,
-1.358561, -0.5778492, -0.7697957, 1, 0.5058824, 0, 1,
-1.349554, -0.5603084, -2.470739, 1, 0.509804, 0, 1,
-1.348657, -1.516879, -4.300934, 1, 0.5176471, 0, 1,
-1.340765, 0.8674342, -2.631127, 1, 0.5215687, 0, 1,
-1.325238, -0.1355013, -2.891833, 1, 0.5294118, 0, 1,
-1.319987, 0.09592116, -0.1112598, 1, 0.5333334, 0, 1,
-1.297288, -0.05807775, -0.6225579, 1, 0.5411765, 0, 1,
-1.289501, -0.2496208, -1.150767, 1, 0.5450981, 0, 1,
-1.288585, -0.6300105, -0.5951383, 1, 0.5529412, 0, 1,
-1.287827, -1.299912, -3.002207, 1, 0.5568628, 0, 1,
-1.2789, -1.507294, -2.881513, 1, 0.5647059, 0, 1,
-1.267925, -0.217374, -1.530822, 1, 0.5686275, 0, 1,
-1.26527, -1.903334, -2.495003, 1, 0.5764706, 0, 1,
-1.265143, 0.9441065, -0.8457742, 1, 0.5803922, 0, 1,
-1.265097, 0.5013874, -2.615968, 1, 0.5882353, 0, 1,
-1.248179, -1.364929, -2.679526, 1, 0.5921569, 0, 1,
-1.241836, 1.285533, -0.7446093, 1, 0.6, 0, 1,
-1.228881, -0.05857893, -3.244722, 1, 0.6078432, 0, 1,
-1.228373, -0.9081985, -0.9645635, 1, 0.6117647, 0, 1,
-1.212245, -0.1705758, -0.4476796, 1, 0.6196079, 0, 1,
-1.21001, -0.2260363, -1.742943, 1, 0.6235294, 0, 1,
-1.20688, 0.5485609, -1.930698, 1, 0.6313726, 0, 1,
-1.196542, -1.036275, -1.468267, 1, 0.6352941, 0, 1,
-1.189508, 0.1242951, -0.6964443, 1, 0.6431373, 0, 1,
-1.183518, 1.420496, -0.7457032, 1, 0.6470588, 0, 1,
-1.175166, -1.34963, -0.9839864, 1, 0.654902, 0, 1,
-1.170557, -0.1038267, -3.065809, 1, 0.6588235, 0, 1,
-1.164605, -0.2764791, -1.156558, 1, 0.6666667, 0, 1,
-1.163332, -0.9403901, -0.6785227, 1, 0.6705883, 0, 1,
-1.159171, -0.9400215, -3.411858, 1, 0.6784314, 0, 1,
-1.159067, -0.7265073, -3.331273, 1, 0.682353, 0, 1,
-1.142878, 1.103717, -0.6422291, 1, 0.6901961, 0, 1,
-1.139112, -0.02201661, -2.192961, 1, 0.6941177, 0, 1,
-1.134016, 0.5138654, -1.624569, 1, 0.7019608, 0, 1,
-1.133592, -0.5255562, -1.946724, 1, 0.7098039, 0, 1,
-1.130805, -0.591695, -2.484274, 1, 0.7137255, 0, 1,
-1.129217, 0.5885939, -0.1659626, 1, 0.7215686, 0, 1,
-1.126384, 0.09302206, -1.395123, 1, 0.7254902, 0, 1,
-1.125589, -0.4607348, -2.140134, 1, 0.7333333, 0, 1,
-1.124418, -0.5614371, -0.7472969, 1, 0.7372549, 0, 1,
-1.123566, -0.7195444, -2.513206, 1, 0.7450981, 0, 1,
-1.121496, -0.9004005, -2.377394, 1, 0.7490196, 0, 1,
-1.113774, 1.239063, -0.1575735, 1, 0.7568628, 0, 1,
-1.111386, 0.09724279, -2.773656, 1, 0.7607843, 0, 1,
-1.106201, -0.05545896, -1.284241, 1, 0.7686275, 0, 1,
-1.092753, -1.930446, -3.035395, 1, 0.772549, 0, 1,
-1.0921, 0.01380459, 0.02410673, 1, 0.7803922, 0, 1,
-1.083957, -0.5371277, -1.36301, 1, 0.7843137, 0, 1,
-1.067561, 1.640613, -0.2635776, 1, 0.7921569, 0, 1,
-1.066176, -1.324795, -2.426031, 1, 0.7960784, 0, 1,
-1.060084, 0.9429473, 1.162073, 1, 0.8039216, 0, 1,
-1.057584, -1.135641, -1.147797, 1, 0.8117647, 0, 1,
-1.053337, -0.260598, -1.412088, 1, 0.8156863, 0, 1,
-1.051981, 1.372276, -1.163102, 1, 0.8235294, 0, 1,
-1.044374, 1.358686, -1.66967, 1, 0.827451, 0, 1,
-1.042529, 0.09037562, -1.155292, 1, 0.8352941, 0, 1,
-1.039349, -1.557362, -3.331729, 1, 0.8392157, 0, 1,
-1.034408, 0.875527, -0.4733065, 1, 0.8470588, 0, 1,
-1.033109, 1.053586, -1.516919, 1, 0.8509804, 0, 1,
-1.029955, 1.199597, -0.6270724, 1, 0.8588235, 0, 1,
-1.025768, 0.4854612, 0.9468388, 1, 0.8627451, 0, 1,
-1.025446, 1.296369, 0.65505, 1, 0.8705882, 0, 1,
-1.02228, 0.1639331, -1.039472, 1, 0.8745098, 0, 1,
-1.007176, -0.9746934, -2.695543, 1, 0.8823529, 0, 1,
-1.005572, 1.037052, -0.7212397, 1, 0.8862745, 0, 1,
-1.002401, -0.3576677, -1.298688, 1, 0.8941177, 0, 1,
-1.002241, -1.160676, -2.351463, 1, 0.8980392, 0, 1,
-0.996489, 0.1058466, -2.337532, 1, 0.9058824, 0, 1,
-0.9936634, -1.401256, -3.1842, 1, 0.9137255, 0, 1,
-0.9934308, -0.736576, 1.00649, 1, 0.9176471, 0, 1,
-0.9923376, 0.6347724, -0.6038086, 1, 0.9254902, 0, 1,
-0.9905112, -0.1859185, -0.2323736, 1, 0.9294118, 0, 1,
-0.9899412, -1.28958, -3.421395, 1, 0.9372549, 0, 1,
-0.9878535, 0.8813849, 1.84385, 1, 0.9411765, 0, 1,
-0.9828158, -0.9654793, -2.231919, 1, 0.9490196, 0, 1,
-0.9823235, 0.4584254, -1.766283, 1, 0.9529412, 0, 1,
-0.9823096, 0.9204627, -0.002493877, 1, 0.9607843, 0, 1,
-0.9812955, -1.940479, -3.152677, 1, 0.9647059, 0, 1,
-0.9802878, -0.709689, -1.063394, 1, 0.972549, 0, 1,
-0.9789606, -0.1635367, -1.066097, 1, 0.9764706, 0, 1,
-0.9741706, 0.4104443, -1.790267, 1, 0.9843137, 0, 1,
-0.9736298, -0.8628961, -2.913467, 1, 0.9882353, 0, 1,
-0.9644829, -2.162251, -1.485355, 1, 0.9960784, 0, 1,
-0.9564687, -1.217953, -3.218467, 0.9960784, 1, 0, 1,
-0.9547725, -2.151597, -3.002935, 0.9921569, 1, 0, 1,
-0.9514682, -1.103999, -4.041978, 0.9843137, 1, 0, 1,
-0.9490397, 0.5210202, 0.7113892, 0.9803922, 1, 0, 1,
-0.9469007, 1.015941, -0.2507632, 0.972549, 1, 0, 1,
-0.9435711, -0.6034567, -0.8831774, 0.9686275, 1, 0, 1,
-0.9429257, -0.5990922, -2.463982, 0.9607843, 1, 0, 1,
-0.9426716, -0.4768789, -0.3849775, 0.9568627, 1, 0, 1,
-0.9352761, -1.163584, -3.979507, 0.9490196, 1, 0, 1,
-0.9292617, 0.04114695, -0.5977474, 0.945098, 1, 0, 1,
-0.9280569, 0.6382223, -0.6100345, 0.9372549, 1, 0, 1,
-0.9257342, -0.4390097, -3.721577, 0.9333333, 1, 0, 1,
-0.9250663, 0.8957605, -0.5654662, 0.9254902, 1, 0, 1,
-0.9239553, 1.892272, -0.03927613, 0.9215686, 1, 0, 1,
-0.9230317, 0.6531981, -0.7489929, 0.9137255, 1, 0, 1,
-0.9202315, -1.060595, -2.255578, 0.9098039, 1, 0, 1,
-0.9196787, -1.388744, -2.886789, 0.9019608, 1, 0, 1,
-0.9172098, -0.1971397, -1.800732, 0.8941177, 1, 0, 1,
-0.9093335, 0.1083263, -0.7357908, 0.8901961, 1, 0, 1,
-0.9041664, -1.098349, -1.058029, 0.8823529, 1, 0, 1,
-0.9000915, 0.5322362, -1.986015, 0.8784314, 1, 0, 1,
-0.8962221, 0.2917258, -1.639402, 0.8705882, 1, 0, 1,
-0.8954311, -0.2726961, -2.321349, 0.8666667, 1, 0, 1,
-0.8937027, -1.508886, -4.250272, 0.8588235, 1, 0, 1,
-0.8889366, 1.081798, -0.9674935, 0.854902, 1, 0, 1,
-0.8809865, -0.2449866, -2.913985, 0.8470588, 1, 0, 1,
-0.879392, 0.4824155, -1.48478, 0.8431373, 1, 0, 1,
-0.8761124, -1.498465, -3.224988, 0.8352941, 1, 0, 1,
-0.8735394, 0.4868025, 1.440771, 0.8313726, 1, 0, 1,
-0.8660495, 0.8648382, 1.886972, 0.8235294, 1, 0, 1,
-0.8651932, -1.039165, -1.046334, 0.8196079, 1, 0, 1,
-0.863786, 1.827487, -1.037557, 0.8117647, 1, 0, 1,
-0.8532701, 0.1241087, -1.262019, 0.8078431, 1, 0, 1,
-0.8511471, 1.262245, -2.137064, 0.8, 1, 0, 1,
-0.8474267, 0.05772118, -0.07643981, 0.7921569, 1, 0, 1,
-0.8431971, 0.1615035, -1.573013, 0.7882353, 1, 0, 1,
-0.8292996, -0.6222581, -1.936656, 0.7803922, 1, 0, 1,
-0.8283433, 0.7952951, -0.403877, 0.7764706, 1, 0, 1,
-0.8185296, 1.492033, -0.8792765, 0.7686275, 1, 0, 1,
-0.8115716, 2.591628, 0.4304273, 0.7647059, 1, 0, 1,
-0.8106353, -0.245523, -3.028197, 0.7568628, 1, 0, 1,
-0.8004473, 1.048087, -0.7372981, 0.7529412, 1, 0, 1,
-0.7912413, -0.6333689, -3.982998, 0.7450981, 1, 0, 1,
-0.7901652, -0.9498268, -0.9787302, 0.7411765, 1, 0, 1,
-0.7898006, -0.4830675, -1.867637, 0.7333333, 1, 0, 1,
-0.7892594, 0.8170557, -0.4264455, 0.7294118, 1, 0, 1,
-0.7887867, -0.6279797, -0.2366632, 0.7215686, 1, 0, 1,
-0.7881286, 0.09456703, -1.554361, 0.7176471, 1, 0, 1,
-0.7857744, 0.4755119, 0.7322967, 0.7098039, 1, 0, 1,
-0.784844, -0.422116, -2.339046, 0.7058824, 1, 0, 1,
-0.7670356, -1.869747, -2.380947, 0.6980392, 1, 0, 1,
-0.7644836, -0.4571864, -1.160694, 0.6901961, 1, 0, 1,
-0.7572504, 0.5591904, -2.683665, 0.6862745, 1, 0, 1,
-0.7526523, 0.5408305, -1.449152, 0.6784314, 1, 0, 1,
-0.7444988, 0.1426291, -0.1370644, 0.6745098, 1, 0, 1,
-0.7394743, 0.4958952, -1.251553, 0.6666667, 1, 0, 1,
-0.7375069, -1.078207, -3.861734, 0.6627451, 1, 0, 1,
-0.7345083, 0.3959483, -2.334151, 0.654902, 1, 0, 1,
-0.7314167, 0.6588004, -0.3440865, 0.6509804, 1, 0, 1,
-0.7290347, -1.028177, -1.06083, 0.6431373, 1, 0, 1,
-0.7242178, 0.9299481, 0.5407834, 0.6392157, 1, 0, 1,
-0.7218164, 1.156668, -0.7181109, 0.6313726, 1, 0, 1,
-0.7203003, 0.8415623, 0.08784443, 0.627451, 1, 0, 1,
-0.7181616, -1.286225, -0.331377, 0.6196079, 1, 0, 1,
-0.7105002, 0.07543317, -1.178313, 0.6156863, 1, 0, 1,
-0.7039981, -0.7036753, -4.339704, 0.6078432, 1, 0, 1,
-0.6999229, 0.6720392, -0.5753551, 0.6039216, 1, 0, 1,
-0.6980228, 1.745187, -0.926348, 0.5960785, 1, 0, 1,
-0.6956175, -1.22133, -2.810622, 0.5882353, 1, 0, 1,
-0.6903874, 0.9247106, -0.4526353, 0.5843138, 1, 0, 1,
-0.6885372, 0.1196779, -1.637152, 0.5764706, 1, 0, 1,
-0.6820322, 0.5163373, -1.137415, 0.572549, 1, 0, 1,
-0.6804453, -0.8432084, -2.009359, 0.5647059, 1, 0, 1,
-0.6793009, -1.482691, -4.302533, 0.5607843, 1, 0, 1,
-0.6744848, -0.8175457, -3.613639, 0.5529412, 1, 0, 1,
-0.6711549, -1.255008, -2.13401, 0.5490196, 1, 0, 1,
-0.6683372, -0.836247, -2.947854, 0.5411765, 1, 0, 1,
-0.667182, -1.515638, -1.351964, 0.5372549, 1, 0, 1,
-0.6634193, 0.04816489, -1.424416, 0.5294118, 1, 0, 1,
-0.6633794, -0.6158356, -2.58996, 0.5254902, 1, 0, 1,
-0.6493508, 0.1567411, -2.659806, 0.5176471, 1, 0, 1,
-0.6465889, -0.2630637, -2.774755, 0.5137255, 1, 0, 1,
-0.6462392, 0.2955002, -0.871505, 0.5058824, 1, 0, 1,
-0.6460634, -0.6186031, -4.52521, 0.5019608, 1, 0, 1,
-0.6354952, -0.3401419, -2.973243, 0.4941176, 1, 0, 1,
-0.6286317, 0.1908476, -0.8620328, 0.4862745, 1, 0, 1,
-0.6281513, -1.01413, -1.742945, 0.4823529, 1, 0, 1,
-0.616755, 1.149783, -1.295619, 0.4745098, 1, 0, 1,
-0.6160452, -1.114783, -1.66001, 0.4705882, 1, 0, 1,
-0.6146759, 0.1525267, -0.9803352, 0.4627451, 1, 0, 1,
-0.6146154, -0.7154482, -1.237933, 0.4588235, 1, 0, 1,
-0.6136314, -0.3316493, -1.132841, 0.4509804, 1, 0, 1,
-0.6082778, -1.293668, -1.334155, 0.4470588, 1, 0, 1,
-0.6049616, -0.6018785, -3.253805, 0.4392157, 1, 0, 1,
-0.5971708, -0.008807484, -2.440686, 0.4352941, 1, 0, 1,
-0.5897804, 0.8068932, 0.3380934, 0.427451, 1, 0, 1,
-0.586552, -0.1946261, -2.334365, 0.4235294, 1, 0, 1,
-0.5846007, -0.1531336, -0.5677834, 0.4156863, 1, 0, 1,
-0.5822504, 0.3513891, -1.023342, 0.4117647, 1, 0, 1,
-0.5822407, 0.08205705, -1.54707, 0.4039216, 1, 0, 1,
-0.5761293, -0.6508817, -1.724141, 0.3960784, 1, 0, 1,
-0.5722562, -1.321596, -2.787443, 0.3921569, 1, 0, 1,
-0.5683792, 0.3274391, 0.3284944, 0.3843137, 1, 0, 1,
-0.5636235, 2.074275, -0.6825008, 0.3803922, 1, 0, 1,
-0.5516651, 0.6011401, -2.73235, 0.372549, 1, 0, 1,
-0.5419046, -0.6057683, -4.159308, 0.3686275, 1, 0, 1,
-0.5390363, -0.899851, -2.268245, 0.3607843, 1, 0, 1,
-0.5356345, -1.044367, -4.076311, 0.3568628, 1, 0, 1,
-0.532058, -0.7454692, -2.835839, 0.3490196, 1, 0, 1,
-0.5310487, 1.145583, -3.475015, 0.345098, 1, 0, 1,
-0.5254583, 0.1884057, -0.3689648, 0.3372549, 1, 0, 1,
-0.5230257, -0.9701208, -3.776073, 0.3333333, 1, 0, 1,
-0.5157056, 0.6625886, -2.106999, 0.3254902, 1, 0, 1,
-0.5138588, -0.435606, -3.234094, 0.3215686, 1, 0, 1,
-0.5110188, 0.2637876, -1.17577, 0.3137255, 1, 0, 1,
-0.5106763, -0.1738698, -3.728703, 0.3098039, 1, 0, 1,
-0.5097633, -0.2867088, -2.734373, 0.3019608, 1, 0, 1,
-0.5065999, 0.8302379, -1.331338, 0.2941177, 1, 0, 1,
-0.4999643, 0.9081009, -1.538522, 0.2901961, 1, 0, 1,
-0.4953652, 0.195929, -0.921846, 0.282353, 1, 0, 1,
-0.4948075, 1.917117, 0.2510235, 0.2784314, 1, 0, 1,
-0.492189, 0.5763466, -0.5177751, 0.2705882, 1, 0, 1,
-0.4871537, 0.3729284, -0.5060693, 0.2666667, 1, 0, 1,
-0.4869961, -0.8949802, -1.802175, 0.2588235, 1, 0, 1,
-0.4858893, -0.7099776, -0.7092215, 0.254902, 1, 0, 1,
-0.4850622, -0.470288, -2.909539, 0.2470588, 1, 0, 1,
-0.4849963, -1.128928, -3.051692, 0.2431373, 1, 0, 1,
-0.482191, 0.07243807, -2.527928, 0.2352941, 1, 0, 1,
-0.4820939, 0.4301272, -2.116374, 0.2313726, 1, 0, 1,
-0.4706277, 0.4558045, -0.4806694, 0.2235294, 1, 0, 1,
-0.4689832, -0.1087925, -2.7025, 0.2196078, 1, 0, 1,
-0.4625978, 1.003479, -1.321055, 0.2117647, 1, 0, 1,
-0.4611557, 1.609655, 0.7464216, 0.2078431, 1, 0, 1,
-0.4590065, -1.355922, -4.109206, 0.2, 1, 0, 1,
-0.4563747, 0.3866134, -1.174209, 0.1921569, 1, 0, 1,
-0.4507793, -0.1021018, -2.101595, 0.1882353, 1, 0, 1,
-0.4499998, 1.063964, -2.231897, 0.1803922, 1, 0, 1,
-0.4493695, 0.9318179, -1.260351, 0.1764706, 1, 0, 1,
-0.4467131, 0.3995504, -0.003634403, 0.1686275, 1, 0, 1,
-0.4450153, -0.6346481, -2.307095, 0.1647059, 1, 0, 1,
-0.4378895, 0.09510062, -2.845577, 0.1568628, 1, 0, 1,
-0.4372679, 1.301065, -0.9769486, 0.1529412, 1, 0, 1,
-0.4370842, -0.7146473, -1.858793, 0.145098, 1, 0, 1,
-0.4312774, 0.09770714, -1.113931, 0.1411765, 1, 0, 1,
-0.4253063, -0.5484939, -2.465215, 0.1333333, 1, 0, 1,
-0.4247729, -1.148226, -1.852898, 0.1294118, 1, 0, 1,
-0.420622, 0.5891443, -0.1763062, 0.1215686, 1, 0, 1,
-0.4164963, 0.08999965, -0.6047328, 0.1176471, 1, 0, 1,
-0.4141508, 1.158662, 1.333174, 0.1098039, 1, 0, 1,
-0.4139979, -0.6072506, -2.378939, 0.1058824, 1, 0, 1,
-0.4135058, -0.07337243, -1.802704, 0.09803922, 1, 0, 1,
-0.4131214, 0.1479384, -1.477049, 0.09019608, 1, 0, 1,
-0.4118547, 0.2481795, -1.177509, 0.08627451, 1, 0, 1,
-0.4014096, 0.5767277, -0.6526841, 0.07843138, 1, 0, 1,
-0.3965595, 0.9846081, 0.2681087, 0.07450981, 1, 0, 1,
-0.3805162, -1.985235, -4.223953, 0.06666667, 1, 0, 1,
-0.3804867, -1.959955, -1.665411, 0.0627451, 1, 0, 1,
-0.379535, -0.650649, -2.484905, 0.05490196, 1, 0, 1,
-0.3782555, 2.014856, -1.789456, 0.05098039, 1, 0, 1,
-0.3659323, -0.1351795, -2.40166, 0.04313726, 1, 0, 1,
-0.3590932, -0.617729, -3.092767, 0.03921569, 1, 0, 1,
-0.3518277, -1.145688, -2.43268, 0.03137255, 1, 0, 1,
-0.3501635, -0.851423, -3.363341, 0.02745098, 1, 0, 1,
-0.3474749, 0.2000847, -1.713856, 0.01960784, 1, 0, 1,
-0.3471711, 0.8416039, -0.1044744, 0.01568628, 1, 0, 1,
-0.3414876, 0.1761103, -0.5829665, 0.007843138, 1, 0, 1,
-0.3385893, -1.207798, -1.544139, 0.003921569, 1, 0, 1,
-0.3383478, 0.7120605, 0.2385183, 0, 1, 0.003921569, 1,
-0.3378742, 0.1318601, 0.3944381, 0, 1, 0.01176471, 1,
-0.3376735, -0.262599, -4.098053, 0, 1, 0.01568628, 1,
-0.3348688, 1.008796, 0.8570911, 0, 1, 0.02352941, 1,
-0.3320358, 1.026571, -0.6078777, 0, 1, 0.02745098, 1,
-0.3317537, 1.046988, -0.6979169, 0, 1, 0.03529412, 1,
-0.3287205, 0.7911437, 1.202392, 0, 1, 0.03921569, 1,
-0.327405, 1.076661, 0.6891978, 0, 1, 0.04705882, 1,
-0.3267532, 0.2975042, -0.9571245, 0, 1, 0.05098039, 1,
-0.3266787, 0.6395708, 0.6854851, 0, 1, 0.05882353, 1,
-0.3195172, -1.761598, -0.8386589, 0, 1, 0.0627451, 1,
-0.3176821, 0.5986583, -2.04868, 0, 1, 0.07058824, 1,
-0.3165473, -0.3966585, -3.898318, 0, 1, 0.07450981, 1,
-0.3152308, 0.3427791, 0.01499652, 0, 1, 0.08235294, 1,
-0.3139395, 0.9352373, 0.5953598, 0, 1, 0.08627451, 1,
-0.3134839, -0.7788403, -4.295912, 0, 1, 0.09411765, 1,
-0.306497, 0.224522, -0.2912464, 0, 1, 0.1019608, 1,
-0.3053259, 1.881732, -0.02596574, 0, 1, 0.1058824, 1,
-0.2988326, 0.6111118, 0.3263767, 0, 1, 0.1137255, 1,
-0.2979608, -1.072682, -2.069916, 0, 1, 0.1176471, 1,
-0.2977185, 0.09572215, -2.611562, 0, 1, 0.1254902, 1,
-0.2946702, 0.3640015, -0.7873923, 0, 1, 0.1294118, 1,
-0.2890101, 0.8143644, 0.08153099, 0, 1, 0.1372549, 1,
-0.2886482, -0.1021443, -1.272018, 0, 1, 0.1411765, 1,
-0.2868997, 0.1587076, -2.620775, 0, 1, 0.1490196, 1,
-0.2834519, 0.9233361, -0.9124729, 0, 1, 0.1529412, 1,
-0.2827088, 0.4684364, -1.445056, 0, 1, 0.1607843, 1,
-0.2811135, -0.3185388, -1.04178, 0, 1, 0.1647059, 1,
-0.2807027, -1.21898, -3.043815, 0, 1, 0.172549, 1,
-0.2744214, 2.855751, 0.4136499, 0, 1, 0.1764706, 1,
-0.2726225, 0.8505022, -2.03074, 0, 1, 0.1843137, 1,
-0.2706645, -1.093886, -2.775476, 0, 1, 0.1882353, 1,
-0.2703544, -0.3415038, -4.092814, 0, 1, 0.1960784, 1,
-0.2677427, 0.2111354, -0.3043418, 0, 1, 0.2039216, 1,
-0.2670649, -0.008545018, -0.885824, 0, 1, 0.2078431, 1,
-0.2637915, -0.9364606, -2.351984, 0, 1, 0.2156863, 1,
-0.2618297, -1.335567, -1.866896, 0, 1, 0.2196078, 1,
-0.2599908, 0.3314111, 0.7666738, 0, 1, 0.227451, 1,
-0.2562097, -0.1660397, -2.172751, 0, 1, 0.2313726, 1,
-0.2560518, 0.9101818, -1.536453, 0, 1, 0.2392157, 1,
-0.2535779, -0.1045315, -2.316212, 0, 1, 0.2431373, 1,
-0.2528906, 0.4246351, -1.261337, 0, 1, 0.2509804, 1,
-0.2523913, -0.7634763, -3.956851, 0, 1, 0.254902, 1,
-0.250475, 2.384378, 0.8538761, 0, 1, 0.2627451, 1,
-0.2446735, 0.4649643, -0.4254537, 0, 1, 0.2666667, 1,
-0.2420369, -1.694751, -1.932645, 0, 1, 0.2745098, 1,
-0.2401293, 0.3327253, 1.099079, 0, 1, 0.2784314, 1,
-0.2377641, -0.5751495, -4.690853, 0, 1, 0.2862745, 1,
-0.2369341, -1.396462, -2.401704, 0, 1, 0.2901961, 1,
-0.2313001, -0.7511484, -1.53379, 0, 1, 0.2980392, 1,
-0.2245295, -0.7256336, -2.804733, 0, 1, 0.3058824, 1,
-0.2230618, 1.271909, -2.002155, 0, 1, 0.3098039, 1,
-0.2208171, -0.9642726, -4.416447, 0, 1, 0.3176471, 1,
-0.2200663, -0.6933173, -2.45306, 0, 1, 0.3215686, 1,
-0.2120003, -0.431518, -2.975613, 0, 1, 0.3294118, 1,
-0.2118951, 1.207847, -2.562888, 0, 1, 0.3333333, 1,
-0.2100186, -0.2919749, -3.199538, 0, 1, 0.3411765, 1,
-0.2088801, 2.18207, 0.4009038, 0, 1, 0.345098, 1,
-0.2085641, -1.356758, -2.638944, 0, 1, 0.3529412, 1,
-0.2073899, -1.984984, -5.0327, 0, 1, 0.3568628, 1,
-0.2042087, 0.02435264, -2.431793, 0, 1, 0.3647059, 1,
-0.2041921, 0.2095402, -1.474235, 0, 1, 0.3686275, 1,
-0.2038278, 0.2086853, 1.351015, 0, 1, 0.3764706, 1,
-0.1974469, -1.391095, -3.23343, 0, 1, 0.3803922, 1,
-0.1936551, -0.6511157, -1.928636, 0, 1, 0.3882353, 1,
-0.1911932, -0.3988307, -2.122584, 0, 1, 0.3921569, 1,
-0.1877008, 0.04619444, 1.1259, 0, 1, 0.4, 1,
-0.1872884, 1.456971, -0.6946483, 0, 1, 0.4078431, 1,
-0.1872042, -0.01637225, -0.12981, 0, 1, 0.4117647, 1,
-0.1862667, 1.78224, -1.224, 0, 1, 0.4196078, 1,
-0.1845481, 1.434234, 0.7145812, 0, 1, 0.4235294, 1,
-0.181007, 0.01411735, -2.073756, 0, 1, 0.4313726, 1,
-0.1787304, 0.3098962, 0.02547695, 0, 1, 0.4352941, 1,
-0.1761452, 0.1027054, -1.479619, 0, 1, 0.4431373, 1,
-0.1759689, -1.229855, -0.6311308, 0, 1, 0.4470588, 1,
-0.1757693, 0.6498235, -0.10186, 0, 1, 0.454902, 1,
-0.1751607, -0.5404339, -1.971985, 0, 1, 0.4588235, 1,
-0.1695711, -0.865311, -2.745456, 0, 1, 0.4666667, 1,
-0.1639862, 0.348702, 1.49053, 0, 1, 0.4705882, 1,
-0.1636862, -1.621314, -2.510382, 0, 1, 0.4784314, 1,
-0.163326, 0.1888126, 0.04424272, 0, 1, 0.4823529, 1,
-0.1603683, -0.7316296, -1.788821, 0, 1, 0.4901961, 1,
-0.1600472, -0.9429013, -2.735534, 0, 1, 0.4941176, 1,
-0.1593039, -0.1063257, -0.134656, 0, 1, 0.5019608, 1,
-0.1531782, 0.4449775, -0.2789488, 0, 1, 0.509804, 1,
-0.1501112, -0.6202427, -2.921093, 0, 1, 0.5137255, 1,
-0.1499716, 0.02626084, -1.571923, 0, 1, 0.5215687, 1,
-0.1476765, -0.008975312, -2.334144, 0, 1, 0.5254902, 1,
-0.1474697, 0.3511113, -2.261479, 0, 1, 0.5333334, 1,
-0.1464576, 0.4917161, -0.4957426, 0, 1, 0.5372549, 1,
-0.1450931, 0.8100151, 0.6013932, 0, 1, 0.5450981, 1,
-0.1439066, -2.735256, -5.86248, 0, 1, 0.5490196, 1,
-0.1386403, -0.230807, -3.631551, 0, 1, 0.5568628, 1,
-0.1338114, -1.365316, -3.413252, 0, 1, 0.5607843, 1,
-0.1299941, 0.2085329, -1.821863, 0, 1, 0.5686275, 1,
-0.1290705, 0.6509643, -1.157041, 0, 1, 0.572549, 1,
-0.1241834, -0.3573989, -3.069201, 0, 1, 0.5803922, 1,
-0.1214642, 1.933337, -0.4438337, 0, 1, 0.5843138, 1,
-0.1214197, -0.06808329, -2.103628, 0, 1, 0.5921569, 1,
-0.1211216, -1.488621, -4.113338, 0, 1, 0.5960785, 1,
-0.1170122, 1.488037, 1.744568, 0, 1, 0.6039216, 1,
-0.1165534, 0.3919252, -0.004727726, 0, 1, 0.6117647, 1,
-0.116402, -1.141222, -3.849279, 0, 1, 0.6156863, 1,
-0.115935, 0.1046849, -0.985412, 0, 1, 0.6235294, 1,
-0.1155516, 0.8196939, -2.77536, 0, 1, 0.627451, 1,
-0.1153566, -0.9398875, -2.045702, 0, 1, 0.6352941, 1,
-0.1141286, -0.1118724, -2.463221, 0, 1, 0.6392157, 1,
-0.1094156, -0.7328784, -1.915528, 0, 1, 0.6470588, 1,
-0.108071, -0.2652325, -2.524467, 0, 1, 0.6509804, 1,
-0.1072699, -0.6222754, -4.201731, 0, 1, 0.6588235, 1,
-0.1044388, -0.2919345, -3.797263, 0, 1, 0.6627451, 1,
-0.09985168, -0.2405604, -3.623063, 0, 1, 0.6705883, 1,
-0.09695984, 1.290738, 0.9548184, 0, 1, 0.6745098, 1,
-0.09641489, -1.572413, -2.788522, 0, 1, 0.682353, 1,
-0.09619961, 1.559463, 1.824347, 0, 1, 0.6862745, 1,
-0.09213392, 0.268469, 0.3509385, 0, 1, 0.6941177, 1,
-0.09005564, 0.6003982, -0.7020455, 0, 1, 0.7019608, 1,
-0.08736081, 1.518778, -1.184536, 0, 1, 0.7058824, 1,
-0.08429505, 0.1394378, -0.5629509, 0, 1, 0.7137255, 1,
-0.08111922, 0.7457902, -0.1320782, 0, 1, 0.7176471, 1,
-0.07372592, -0.2045494, -3.294746, 0, 1, 0.7254902, 1,
-0.07323004, -0.1535115, -1.558694, 0, 1, 0.7294118, 1,
-0.0611327, -0.7665864, -4.239499, 0, 1, 0.7372549, 1,
-0.06111408, -0.327505, -3.820912, 0, 1, 0.7411765, 1,
-0.05690857, 1.777057, -1.035577, 0, 1, 0.7490196, 1,
-0.05387887, 1.267581, -0.04715358, 0, 1, 0.7529412, 1,
-0.04410754, -0.5714766, -3.558584, 0, 1, 0.7607843, 1,
-0.04381903, -0.6531563, -3.003071, 0, 1, 0.7647059, 1,
-0.04336105, 0.1027494, -0.450649, 0, 1, 0.772549, 1,
-0.0408858, -1.941452, -1.492664, 0, 1, 0.7764706, 1,
-0.03968839, -1.093225, -3.137876, 0, 1, 0.7843137, 1,
-0.03752864, -0.658682, -2.882663, 0, 1, 0.7882353, 1,
-0.03584492, 1.986239, -1.159368, 0, 1, 0.7960784, 1,
-0.03515279, 0.1556458, -0.5158052, 0, 1, 0.8039216, 1,
-0.03420894, 0.5679815, 1.98223, 0, 1, 0.8078431, 1,
-0.03420201, -0.06210554, -3.142867, 0, 1, 0.8156863, 1,
-0.02791258, 0.3729219, 0.6042743, 0, 1, 0.8196079, 1,
-0.02732807, 1.030014, 0.473369, 0, 1, 0.827451, 1,
-0.02637963, 1.996785, 0.1633702, 0, 1, 0.8313726, 1,
-0.02351196, -2.261292, -1.946758, 0, 1, 0.8392157, 1,
-0.02251233, -0.8555101, -3.852649, 0, 1, 0.8431373, 1,
-0.02182265, -0.1058122, -2.203861, 0, 1, 0.8509804, 1,
-0.01901069, 0.4278583, -1.477803, 0, 1, 0.854902, 1,
-0.01574168, 0.1358592, -0.8105258, 0, 1, 0.8627451, 1,
-0.01436932, -1.526531, -3.638431, 0, 1, 0.8666667, 1,
-0.01107352, 0.9217798, -0.8695631, 0, 1, 0.8745098, 1,
-0.006570915, -0.3428629, -2.767263, 0, 1, 0.8784314, 1,
-0.004707739, -2.064105, -2.68155, 0, 1, 0.8862745, 1,
0.001736361, 0.9498907, 0.3816808, 0, 1, 0.8901961, 1,
0.001798071, -0.2540197, 3.111735, 0, 1, 0.8980392, 1,
0.004018292, -0.5434316, 1.162691, 0, 1, 0.9058824, 1,
0.007311057, 1.091833, 0.2081213, 0, 1, 0.9098039, 1,
0.01042627, -0.9285628, 1.194484, 0, 1, 0.9176471, 1,
0.0127093, -0.0189265, 2.112324, 0, 1, 0.9215686, 1,
0.01359637, -0.2570529, 4.485237, 0, 1, 0.9294118, 1,
0.01564154, -0.3806723, 1.813566, 0, 1, 0.9333333, 1,
0.01901834, 1.37445, 0.3535707, 0, 1, 0.9411765, 1,
0.02479432, 0.2374094, 1.215683, 0, 1, 0.945098, 1,
0.02524573, 2.4268, 0.7823173, 0, 1, 0.9529412, 1,
0.02603769, 1.434119, -1.982975, 0, 1, 0.9568627, 1,
0.03094357, -0.0923735, 4.01892, 0, 1, 0.9647059, 1,
0.03480555, -1.091129, 2.188443, 0, 1, 0.9686275, 1,
0.0353716, 0.38894, 0.7109973, 0, 1, 0.9764706, 1,
0.03665717, 0.9816886, -1.568327, 0, 1, 0.9803922, 1,
0.0374421, 0.05386799, 2.195032, 0, 1, 0.9882353, 1,
0.041396, 2.097475, 1.445735, 0, 1, 0.9921569, 1,
0.04195578, 1.370507, 0.7038522, 0, 1, 1, 1,
0.04771508, 0.9323121, -2.321992, 0, 0.9921569, 1, 1,
0.04942052, 0.5412086, 0.6838079, 0, 0.9882353, 1, 1,
0.05111687, -0.3987212, 3.348205, 0, 0.9803922, 1, 1,
0.0530536, 0.6097004, -0.2446631, 0, 0.9764706, 1, 1,
0.05597037, 1.784236, 1.632932, 0, 0.9686275, 1, 1,
0.05613983, 2.227313, 0.005751859, 0, 0.9647059, 1, 1,
0.06149722, -0.08030754, 3.782396, 0, 0.9568627, 1, 1,
0.06599185, 0.0163711, 1.344367, 0, 0.9529412, 1, 1,
0.06818557, -1.081516, 4.787894, 0, 0.945098, 1, 1,
0.07324802, 0.4692465, 1.14681, 0, 0.9411765, 1, 1,
0.07414751, 0.04147556, -0.3996132, 0, 0.9333333, 1, 1,
0.07577795, -1.816523, 3.283617, 0, 0.9294118, 1, 1,
0.07645857, -0.3446168, 4.025046, 0, 0.9215686, 1, 1,
0.08264274, -0.7629523, 2.339568, 0, 0.9176471, 1, 1,
0.09162803, -0.4002788, 3.807275, 0, 0.9098039, 1, 1,
0.09710988, 0.693066, -0.9957286, 0, 0.9058824, 1, 1,
0.09853286, -0.3195474, 3.317048, 0, 0.8980392, 1, 1,
0.09950107, 0.6013097, 0.743463, 0, 0.8901961, 1, 1,
0.1050788, 0.9150532, -1.284867, 0, 0.8862745, 1, 1,
0.1069256, 0.3594122, 1.785797, 0, 0.8784314, 1, 1,
0.1075995, -1.135612, 3.291472, 0, 0.8745098, 1, 1,
0.1084796, 2.330349, 0.5879369, 0, 0.8666667, 1, 1,
0.108554, 0.06586669, -0.5276943, 0, 0.8627451, 1, 1,
0.1106233, 1.876553, 0.519255, 0, 0.854902, 1, 1,
0.11207, -0.3977163, 3.414823, 0, 0.8509804, 1, 1,
0.1142531, -0.05952107, 2.089605, 0, 0.8431373, 1, 1,
0.1154348, -0.01153476, 0.4090344, 0, 0.8392157, 1, 1,
0.1180418, -0.9895918, 4.655114, 0, 0.8313726, 1, 1,
0.119339, -0.1168299, 1.641893, 0, 0.827451, 1, 1,
0.1211223, 0.2656075, -2.329291, 0, 0.8196079, 1, 1,
0.1221958, -0.3889602, 1.706785, 0, 0.8156863, 1, 1,
0.1227388, 1.325844, 0.4240632, 0, 0.8078431, 1, 1,
0.1233804, -1.391676, 3.83223, 0, 0.8039216, 1, 1,
0.1252539, -0.1365537, 4.126525, 0, 0.7960784, 1, 1,
0.1292793, -1.457167, 2.448408, 0, 0.7882353, 1, 1,
0.1320655, 1.693754, 0.7613581, 0, 0.7843137, 1, 1,
0.1325049, -0.8917258, 4.908816, 0, 0.7764706, 1, 1,
0.1337787, -1.449878, 3.231166, 0, 0.772549, 1, 1,
0.133986, -0.1299471, 1.325587, 0, 0.7647059, 1, 1,
0.1400837, -0.2430831, 1.714603, 0, 0.7607843, 1, 1,
0.1416933, 0.5229281, -0.5242256, 0, 0.7529412, 1, 1,
0.1439115, -0.7528819, 4.138455, 0, 0.7490196, 1, 1,
0.1471642, 0.1207354, 0.3431643, 0, 0.7411765, 1, 1,
0.1475147, -1.369938, 2.770901, 0, 0.7372549, 1, 1,
0.1511893, 0.3186174, -1.957657, 0, 0.7294118, 1, 1,
0.152182, 0.06085737, 0.3944108, 0, 0.7254902, 1, 1,
0.1523479, 0.0607668, 1.837048, 0, 0.7176471, 1, 1,
0.1566123, 2.25627, -0.363323, 0, 0.7137255, 1, 1,
0.1608559, -0.5038586, 2.768158, 0, 0.7058824, 1, 1,
0.1613994, -1.661367, 2.277827, 0, 0.6980392, 1, 1,
0.1702351, 0.4232785, -0.09639804, 0, 0.6941177, 1, 1,
0.1731981, -1.349764, 4.128232, 0, 0.6862745, 1, 1,
0.1746565, 0.5580302, 1.319373, 0, 0.682353, 1, 1,
0.1833085, 0.4922788, -0.2330744, 0, 0.6745098, 1, 1,
0.1837139, -0.1964966, 2.461493, 0, 0.6705883, 1, 1,
0.1856226, -0.854516, 3.571868, 0, 0.6627451, 1, 1,
0.1863014, 0.1291147, 2.077875, 0, 0.6588235, 1, 1,
0.1874696, 1.000804, 0.7226386, 0, 0.6509804, 1, 1,
0.1900587, 0.3407376, -0.4036418, 0, 0.6470588, 1, 1,
0.1902303, -0.1291561, 1.690048, 0, 0.6392157, 1, 1,
0.1909788, 0.4506661, -0.631114, 0, 0.6352941, 1, 1,
0.1962056, -0.397274, 3.018324, 0, 0.627451, 1, 1,
0.1990882, -1.114698, 3.311931, 0, 0.6235294, 1, 1,
0.1996132, -0.3863048, 2.01505, 0, 0.6156863, 1, 1,
0.2012089, -0.4396552, 2.481657, 0, 0.6117647, 1, 1,
0.2020309, 0.1416536, -0.2828897, 0, 0.6039216, 1, 1,
0.2039102, -0.047163, 2.078604, 0, 0.5960785, 1, 1,
0.2065964, 0.4701518, 1.000538, 0, 0.5921569, 1, 1,
0.2133996, 0.2477275, -0.7176746, 0, 0.5843138, 1, 1,
0.2138717, -0.03551673, 0.9478003, 0, 0.5803922, 1, 1,
0.2139034, -0.06199224, 2.882776, 0, 0.572549, 1, 1,
0.2139416, -0.9008382, 2.491946, 0, 0.5686275, 1, 1,
0.222898, -0.4052901, 0.6203007, 0, 0.5607843, 1, 1,
0.2314228, 0.002961932, 1.955532, 0, 0.5568628, 1, 1,
0.2319006, 0.6553769, 1.485932, 0, 0.5490196, 1, 1,
0.2369406, 0.6663412, -0.4698255, 0, 0.5450981, 1, 1,
0.2376595, 0.06263892, 3.481829, 0, 0.5372549, 1, 1,
0.2383716, -0.6114731, 2.323042, 0, 0.5333334, 1, 1,
0.2395126, -0.3919206, 1.539725, 0, 0.5254902, 1, 1,
0.2409684, 1.966097, -0.6706099, 0, 0.5215687, 1, 1,
0.2423248, -1.287274, 1.616618, 0, 0.5137255, 1, 1,
0.2487132, 1.020695, -1.873622, 0, 0.509804, 1, 1,
0.2490494, 0.1704418, 0.4879175, 0, 0.5019608, 1, 1,
0.2514501, -0.6661019, 2.529019, 0, 0.4941176, 1, 1,
0.254193, -0.2614456, 1.946028, 0, 0.4901961, 1, 1,
0.2550488, -0.7861792, 2.005228, 0, 0.4823529, 1, 1,
0.2600527, 0.7507985, -0.270457, 0, 0.4784314, 1, 1,
0.262776, -0.3244248, 1.572912, 0, 0.4705882, 1, 1,
0.266528, 1.516266, -0.8837885, 0, 0.4666667, 1, 1,
0.2669443, -0.6935987, 2.799096, 0, 0.4588235, 1, 1,
0.268352, 0.2948782, 2.753735, 0, 0.454902, 1, 1,
0.2701601, 0.003338149, 2.786236, 0, 0.4470588, 1, 1,
0.277654, 0.5265688, 0.8822214, 0, 0.4431373, 1, 1,
0.2798295, 0.007243661, 2.887259, 0, 0.4352941, 1, 1,
0.2809882, -1.509923, 3.114983, 0, 0.4313726, 1, 1,
0.2834671, 1.460453, -0.920787, 0, 0.4235294, 1, 1,
0.2837633, 3.86851, -1.097511, 0, 0.4196078, 1, 1,
0.2849415, 0.5035265, 0.03713117, 0, 0.4117647, 1, 1,
0.2857642, 0.02343108, 1.619357, 0, 0.4078431, 1, 1,
0.2858486, -0.1240359, 1.657692, 0, 0.4, 1, 1,
0.2879894, 0.2888711, 0.9745997, 0, 0.3921569, 1, 1,
0.2895881, -0.5605144, 3.581738, 0, 0.3882353, 1, 1,
0.2920794, 0.9874871, 1.875974, 0, 0.3803922, 1, 1,
0.2934361, -0.4915074, 2.142362, 0, 0.3764706, 1, 1,
0.2947994, 0.265276, 0.5162363, 0, 0.3686275, 1, 1,
0.2981072, -0.9103035, 1.74966, 0, 0.3647059, 1, 1,
0.3013265, -1.310201, 3.50196, 0, 0.3568628, 1, 1,
0.3042569, 0.8769804, -0.8081709, 0, 0.3529412, 1, 1,
0.3070233, -0.8134697, 3.153163, 0, 0.345098, 1, 1,
0.313208, -1.946578, 2.362185, 0, 0.3411765, 1, 1,
0.3134159, -0.4173037, 1.331144, 0, 0.3333333, 1, 1,
0.3158146, -2.094815, 3.111783, 0, 0.3294118, 1, 1,
0.3165046, 0.3928123, 1.559098, 0, 0.3215686, 1, 1,
0.3219435, -1.015418, 1.468196, 0, 0.3176471, 1, 1,
0.3260001, 1.278085, -0.4818445, 0, 0.3098039, 1, 1,
0.3271039, -0.7945571, 2.521039, 0, 0.3058824, 1, 1,
0.3271145, 1.284404, 0.06999454, 0, 0.2980392, 1, 1,
0.3293808, -0.466269, 2.64659, 0, 0.2901961, 1, 1,
0.3363472, -0.1400203, 2.318663, 0, 0.2862745, 1, 1,
0.3403105, -0.95309, 5.303411, 0, 0.2784314, 1, 1,
0.3444935, 0.2725089, 0.2921566, 0, 0.2745098, 1, 1,
0.344754, -0.2755674, 1.818675, 0, 0.2666667, 1, 1,
0.3491386, -0.2273087, 2.286274, 0, 0.2627451, 1, 1,
0.3501631, -1.426065, 2.725407, 0, 0.254902, 1, 1,
0.3510429, -1.721347, 5.40909, 0, 0.2509804, 1, 1,
0.3555562, -0.3188331, 1.353483, 0, 0.2431373, 1, 1,
0.357724, -0.1627811, 0.457964, 0, 0.2392157, 1, 1,
0.3654005, 0.3479279, 1.099292, 0, 0.2313726, 1, 1,
0.3662469, 0.09439086, 2.502521, 0, 0.227451, 1, 1,
0.3684987, 0.7656312, 0.6958554, 0, 0.2196078, 1, 1,
0.3710975, -0.4188294, 3.007025, 0, 0.2156863, 1, 1,
0.3730821, -1.267189, 2.660883, 0, 0.2078431, 1, 1,
0.3731823, -0.03614175, 2.462817, 0, 0.2039216, 1, 1,
0.3814575, -0.6048959, 3.978099, 0, 0.1960784, 1, 1,
0.3820548, 0.01515215, 1.710138, 0, 0.1882353, 1, 1,
0.3851775, 0.5838892, 1.214194, 0, 0.1843137, 1, 1,
0.3862456, 0.1998431, 1.570474, 0, 0.1764706, 1, 1,
0.3875196, 2.016153, -0.3459065, 0, 0.172549, 1, 1,
0.391083, -0.4795386, 2.481174, 0, 0.1647059, 1, 1,
0.3916208, 0.747271, -0.09274403, 0, 0.1607843, 1, 1,
0.3927305, -0.4507972, 3.184059, 0, 0.1529412, 1, 1,
0.3928735, 0.7566625, -1.524389, 0, 0.1490196, 1, 1,
0.3956159, -0.1149154, 1.966598, 0, 0.1411765, 1, 1,
0.4001507, 0.1581025, 0.2180597, 0, 0.1372549, 1, 1,
0.4032892, -1.075848, 2.173092, 0, 0.1294118, 1, 1,
0.4069053, -0.449025, 2.141398, 0, 0.1254902, 1, 1,
0.411189, 0.6011028, 1.656152, 0, 0.1176471, 1, 1,
0.41219, -0.5618435, 1.827421, 0, 0.1137255, 1, 1,
0.4189741, 1.037651, 1.838675, 0, 0.1058824, 1, 1,
0.4195875, 0.4380997, -0.1375791, 0, 0.09803922, 1, 1,
0.4274761, -1.575128, 3.635247, 0, 0.09411765, 1, 1,
0.4276195, 0.6116053, -0.3226587, 0, 0.08627451, 1, 1,
0.4286712, 1.425428, -0.8515227, 0, 0.08235294, 1, 1,
0.434983, -0.9948991, 1.887332, 0, 0.07450981, 1, 1,
0.4374898, -1.886013, 2.80087, 0, 0.07058824, 1, 1,
0.4392239, 0.3876073, 0.9246124, 0, 0.0627451, 1, 1,
0.4393589, -0.1452265, 1.622197, 0, 0.05882353, 1, 1,
0.4393821, -1.629704, 3.181411, 0, 0.05098039, 1, 1,
0.4404755, -0.6149368, 2.644751, 0, 0.04705882, 1, 1,
0.4527358, 1.941924, 1.571601, 0, 0.03921569, 1, 1,
0.455495, 0.9562975, -1.618831, 0, 0.03529412, 1, 1,
0.4563179, -0.1888788, 1.941218, 0, 0.02745098, 1, 1,
0.4596541, -1.78182, 1.591661, 0, 0.02352941, 1, 1,
0.4634053, -0.1150019, 2.220645, 0, 0.01568628, 1, 1,
0.4670842, -1.139914, 1.776662, 0, 0.01176471, 1, 1,
0.4704973, -0.4924647, 0.08176687, 0, 0.003921569, 1, 1,
0.4832934, 0.4681692, 1.928165, 0.003921569, 0, 1, 1,
0.4835172, 0.285992, 0.7356643, 0.007843138, 0, 1, 1,
0.4871384, -1.403004, 2.1778, 0.01568628, 0, 1, 1,
0.4895437, 0.731162, 0.6922207, 0.01960784, 0, 1, 1,
0.4903103, 0.8038806, -0.5697974, 0.02745098, 0, 1, 1,
0.4936383, -0.823688, 2.469058, 0.03137255, 0, 1, 1,
0.4938949, -0.5342484, 3.284497, 0.03921569, 0, 1, 1,
0.4990398, 1.582161, 0.4193954, 0.04313726, 0, 1, 1,
0.4997188, -0.7603514, 1.548687, 0.05098039, 0, 1, 1,
0.5044358, -0.7406989, 2.963127, 0.05490196, 0, 1, 1,
0.5076229, 0.8007935, -1.089454, 0.0627451, 0, 1, 1,
0.5079594, 0.6364203, 0.6623707, 0.06666667, 0, 1, 1,
0.5080056, 1.369522, 0.8438488, 0.07450981, 0, 1, 1,
0.5141085, -0.3324226, 0.9855464, 0.07843138, 0, 1, 1,
0.5159771, 2.151644, -0.4204546, 0.08627451, 0, 1, 1,
0.5179803, -0.9378432, 0.5452488, 0.09019608, 0, 1, 1,
0.5193491, -0.9777058, 3.465518, 0.09803922, 0, 1, 1,
0.5226029, 1.235916, 0.09032508, 0.1058824, 0, 1, 1,
0.52455, 1.460501, -0.8435391, 0.1098039, 0, 1, 1,
0.5246027, -0.6707358, 3.459308, 0.1176471, 0, 1, 1,
0.5248618, -0.02290813, 1.425883, 0.1215686, 0, 1, 1,
0.5409334, -0.6146956, 1.201247, 0.1294118, 0, 1, 1,
0.543054, 1.367725, -0.6719809, 0.1333333, 0, 1, 1,
0.5461868, -1.030433, 1.933624, 0.1411765, 0, 1, 1,
0.5539191, 1.560504, 0.606278, 0.145098, 0, 1, 1,
0.5571876, 0.3808067, 1.656534, 0.1529412, 0, 1, 1,
0.558621, -0.8694239, 3.026281, 0.1568628, 0, 1, 1,
0.5607625, 1.104784, -0.5546529, 0.1647059, 0, 1, 1,
0.5672978, -1.077896, 2.98326, 0.1686275, 0, 1, 1,
0.5693263, 0.4541461, 1.394713, 0.1764706, 0, 1, 1,
0.5711897, -1.140842, 2.681649, 0.1803922, 0, 1, 1,
0.5718635, 0.2152782, 2.535506, 0.1882353, 0, 1, 1,
0.5731068, 0.3250927, -1.201864, 0.1921569, 0, 1, 1,
0.5785776, -0.8768563, 3.905785, 0.2, 0, 1, 1,
0.5869095, 2.669738, -0.2287811, 0.2078431, 0, 1, 1,
0.6004252, 1.129616, -0.2988024, 0.2117647, 0, 1, 1,
0.6042647, 0.4967617, 1.041134, 0.2196078, 0, 1, 1,
0.6075621, -1.157565, 1.597625, 0.2235294, 0, 1, 1,
0.6088595, -1.144334, 3.059267, 0.2313726, 0, 1, 1,
0.6101255, 0.1420692, 1.658036, 0.2352941, 0, 1, 1,
0.6111966, 0.5487988, 2.301983, 0.2431373, 0, 1, 1,
0.6120256, 0.4769941, 0.7480868, 0.2470588, 0, 1, 1,
0.6126697, 0.8855404, -1.027708, 0.254902, 0, 1, 1,
0.6157262, -0.2319785, 1.62252, 0.2588235, 0, 1, 1,
0.6168978, -0.07070866, 3.021488, 0.2666667, 0, 1, 1,
0.6184742, 0.4939055, -1.765955, 0.2705882, 0, 1, 1,
0.619734, -1.245437, 2.312928, 0.2784314, 0, 1, 1,
0.6199167, -0.3610755, 1.998642, 0.282353, 0, 1, 1,
0.6230171, 0.5312359, 1.803067, 0.2901961, 0, 1, 1,
0.628327, 0.4616091, 1.425478, 0.2941177, 0, 1, 1,
0.6311482, -0.4635915, 4.022818, 0.3019608, 0, 1, 1,
0.6313967, -1.112541, 1.200822, 0.3098039, 0, 1, 1,
0.6323732, -0.03252518, 2.079134, 0.3137255, 0, 1, 1,
0.6328892, 0.5138636, 0.7650335, 0.3215686, 0, 1, 1,
0.6351458, -0.3601961, 3.048166, 0.3254902, 0, 1, 1,
0.6351753, 0.1657667, 0.2512982, 0.3333333, 0, 1, 1,
0.6365342, 0.09535024, 0.2603097, 0.3372549, 0, 1, 1,
0.6414195, -0.5493668, 1.885411, 0.345098, 0, 1, 1,
0.6437073, -0.01472327, 2.117428, 0.3490196, 0, 1, 1,
0.645614, -0.398441, 3.544575, 0.3568628, 0, 1, 1,
0.6468388, -0.2210552, 0.9225821, 0.3607843, 0, 1, 1,
0.6536998, -0.1634285, 2.614312, 0.3686275, 0, 1, 1,
0.6557791, 0.4730014, 2.683419, 0.372549, 0, 1, 1,
0.6578742, 0.6023485, 1.134236, 0.3803922, 0, 1, 1,
0.6587489, 1.710375, 0.3938427, 0.3843137, 0, 1, 1,
0.658825, -2.186003, 3.071944, 0.3921569, 0, 1, 1,
0.6633922, 1.241262, 0.6627054, 0.3960784, 0, 1, 1,
0.6645637, 0.5812342, 1.581572, 0.4039216, 0, 1, 1,
0.6668027, -1.552621, 3.296459, 0.4117647, 0, 1, 1,
0.6694639, 0.4442064, 0.02523718, 0.4156863, 0, 1, 1,
0.6726503, -0.009429905, 1.87481, 0.4235294, 0, 1, 1,
0.6765024, 0.2093949, 1.157716, 0.427451, 0, 1, 1,
0.6798372, 0.02202264, -0.6774492, 0.4352941, 0, 1, 1,
0.6799724, 0.5285253, 1.086529, 0.4392157, 0, 1, 1,
0.6844147, -1.277579, 1.849737, 0.4470588, 0, 1, 1,
0.686518, -0.290703, 1.503146, 0.4509804, 0, 1, 1,
0.6877185, -0.6535982, 4.427578, 0.4588235, 0, 1, 1,
0.6986804, 0.8627908, 2.127984, 0.4627451, 0, 1, 1,
0.6994082, -0.8750581, 4.569843, 0.4705882, 0, 1, 1,
0.7022073, -0.4789727, 1.819524, 0.4745098, 0, 1, 1,
0.7032245, 0.4186424, 3.291175, 0.4823529, 0, 1, 1,
0.7138001, -1.367453, 2.605935, 0.4862745, 0, 1, 1,
0.7140863, -0.07472143, 1.450283, 0.4941176, 0, 1, 1,
0.7154374, 0.7937433, -0.3710287, 0.5019608, 0, 1, 1,
0.7162598, 1.004915, 0.02003271, 0.5058824, 0, 1, 1,
0.7300094, 0.9312761, -0.03652161, 0.5137255, 0, 1, 1,
0.7301558, -0.5369822, 1.902779, 0.5176471, 0, 1, 1,
0.7321056, -1.119518, 1.811433, 0.5254902, 0, 1, 1,
0.7376738, -0.4872536, 2.132711, 0.5294118, 0, 1, 1,
0.7389609, 0.1656379, 2.272283, 0.5372549, 0, 1, 1,
0.7427298, 0.2578443, 1.193277, 0.5411765, 0, 1, 1,
0.7448145, -0.2559294, 2.408909, 0.5490196, 0, 1, 1,
0.7666237, 0.2069998, 2.872925, 0.5529412, 0, 1, 1,
0.7807364, -0.5578716, 3.043892, 0.5607843, 0, 1, 1,
0.7930288, 0.1298987, 2.264913, 0.5647059, 0, 1, 1,
0.7932773, 0.7741433, 1.106505, 0.572549, 0, 1, 1,
0.797522, -0.6534917, 1.775859, 0.5764706, 0, 1, 1,
0.8033047, -0.2792408, 3.004458, 0.5843138, 0, 1, 1,
0.8102134, -1.376886, 2.625651, 0.5882353, 0, 1, 1,
0.817347, -0.767433, 3.403923, 0.5960785, 0, 1, 1,
0.8179805, 0.09118091, 0.3002211, 0.6039216, 0, 1, 1,
0.8183669, -1.479494, 1.597877, 0.6078432, 0, 1, 1,
0.8210195, -0.967703, 0.8583304, 0.6156863, 0, 1, 1,
0.8239664, -0.961033, 1.657394, 0.6196079, 0, 1, 1,
0.8249229, 1.641103, -0.07348254, 0.627451, 0, 1, 1,
0.8252853, -1.273252, 3.288464, 0.6313726, 0, 1, 1,
0.8265634, -1.88719, 3.296722, 0.6392157, 0, 1, 1,
0.8266908, 1.65985, 0.8761241, 0.6431373, 0, 1, 1,
0.827395, -1.474035, 3.131857, 0.6509804, 0, 1, 1,
0.8282179, -0.3869016, 3.83231, 0.654902, 0, 1, 1,
0.8321152, -0.2370705, 1.016019, 0.6627451, 0, 1, 1,
0.8366514, -0.8901795, 2.219199, 0.6666667, 0, 1, 1,
0.8385006, 1.227959, 0.2069786, 0.6745098, 0, 1, 1,
0.842513, 0.3226009, -0.03183204, 0.6784314, 0, 1, 1,
0.8432339, 1.340586, 0.8143287, 0.6862745, 0, 1, 1,
0.843621, -0.1554597, 2.977162, 0.6901961, 0, 1, 1,
0.8501274, -0.9394204, 2.351433, 0.6980392, 0, 1, 1,
0.8548136, -1.95723, 2.127521, 0.7058824, 0, 1, 1,
0.8580853, -0.5458859, 3.836884, 0.7098039, 0, 1, 1,
0.8598154, 0.01808175, 2.664835, 0.7176471, 0, 1, 1,
0.8660405, 1.657681, 1.088206, 0.7215686, 0, 1, 1,
0.8664929, -0.2214236, 2.838378, 0.7294118, 0, 1, 1,
0.8805888, 1.032334, 0.6500056, 0.7333333, 0, 1, 1,
0.8805952, -0.2928464, -0.7963507, 0.7411765, 0, 1, 1,
0.884885, 0.8955469, 0.7271698, 0.7450981, 0, 1, 1,
0.8887486, -1.552576, 2.883303, 0.7529412, 0, 1, 1,
0.8907212, 0.6304671, 1.283049, 0.7568628, 0, 1, 1,
0.8999623, -0.2563606, 0.2771278, 0.7647059, 0, 1, 1,
0.9003084, -0.06363749, 0.04279538, 0.7686275, 0, 1, 1,
0.9042418, -1.30266, 4.336925, 0.7764706, 0, 1, 1,
0.9056733, 0.02742923, 3.08598, 0.7803922, 0, 1, 1,
0.9058651, 0.7968617, -0.1080089, 0.7882353, 0, 1, 1,
0.9077271, 0.2142722, 2.22009, 0.7921569, 0, 1, 1,
0.9091157, 1.313123, -0.5066208, 0.8, 0, 1, 1,
0.9110256, 0.6360235, 1.573534, 0.8078431, 0, 1, 1,
0.9120365, -1.139698, 4.140332, 0.8117647, 0, 1, 1,
0.9142486, -0.6340138, 3.380997, 0.8196079, 0, 1, 1,
0.9292333, 0.0822366, 2.806807, 0.8235294, 0, 1, 1,
0.9296343, -0.768927, 2.820155, 0.8313726, 0, 1, 1,
0.9313888, 0.5182517, 0.8265281, 0.8352941, 0, 1, 1,
0.9328588, -0.9634897, 2.197758, 0.8431373, 0, 1, 1,
0.9341673, -1.831985, 1.619683, 0.8470588, 0, 1, 1,
0.9347117, 1.430159, 1.690768, 0.854902, 0, 1, 1,
0.9352056, -0.005369166, 1.974252, 0.8588235, 0, 1, 1,
0.9400197, 0.3090181, 3.190337, 0.8666667, 0, 1, 1,
0.9445819, -1.703118, 3.040503, 0.8705882, 0, 1, 1,
0.9450439, -0.0432287, 1.537928, 0.8784314, 0, 1, 1,
0.9460235, -0.7911209, 0.4603039, 0.8823529, 0, 1, 1,
0.9460256, 1.307932, 0.01274882, 0.8901961, 0, 1, 1,
0.9486062, 0.7230293, 1.171627, 0.8941177, 0, 1, 1,
0.9527313, 0.8387542, 0.3686028, 0.9019608, 0, 1, 1,
0.9600851, 0.6304445, 1.536322, 0.9098039, 0, 1, 1,
0.9603501, 1.523065, 1.19338, 0.9137255, 0, 1, 1,
0.9618037, 0.04280992, 1.763122, 0.9215686, 0, 1, 1,
0.9669331, 0.7409576, 0.08987072, 0.9254902, 0, 1, 1,
0.968922, -1.055477, 1.673637, 0.9333333, 0, 1, 1,
0.9727416, -0.2418608, 1.782622, 0.9372549, 0, 1, 1,
0.9736148, -0.9493886, 2.143051, 0.945098, 0, 1, 1,
0.9762103, 0.9065254, -2.403209, 0.9490196, 0, 1, 1,
0.977125, -1.355767, 1.742718, 0.9568627, 0, 1, 1,
0.9774162, 0.4547316, 2.829941, 0.9607843, 0, 1, 1,
0.9778727, 0.05958623, 0.4893555, 0.9686275, 0, 1, 1,
0.9820531, 0.3635842, 1.135876, 0.972549, 0, 1, 1,
0.9821702, -0.07365047, 1.372066, 0.9803922, 0, 1, 1,
0.9842989, 1.018914, 1.607541, 0.9843137, 0, 1, 1,
0.9868508, 0.3058966, 1.160307, 0.9921569, 0, 1, 1,
0.9882958, -1.444401, 3.328872, 0.9960784, 0, 1, 1,
0.9897138, -0.1458607, 2.590218, 1, 0, 0.9960784, 1,
0.9947205, -0.5746965, 2.964545, 1, 0, 0.9882353, 1,
0.9956827, 0.476895, 1.404991, 1, 0, 0.9843137, 1,
1.005973, -0.3741175, 0.3618827, 1, 0, 0.9764706, 1,
1.009629, -0.1257942, 1.619723, 1, 0, 0.972549, 1,
1.012563, 0.7668698, 1.040572, 1, 0, 0.9647059, 1,
1.015122, 1.386428, 1.663104, 1, 0, 0.9607843, 1,
1.02008, 0.4786395, 2.489669, 1, 0, 0.9529412, 1,
1.028849, 1.167877, 1.415611, 1, 0, 0.9490196, 1,
1.031961, 0.9483658, 1.159381, 1, 0, 0.9411765, 1,
1.036712, 0.3458704, 1.875759, 1, 0, 0.9372549, 1,
1.038641, -1.009884, 1.786366, 1, 0, 0.9294118, 1,
1.040604, -0.815956, 3.140486, 1, 0, 0.9254902, 1,
1.058208, 0.7239632, 2.386596, 1, 0, 0.9176471, 1,
1.063512, 1.136938, 0.2578835, 1, 0, 0.9137255, 1,
1.073053, 0.4902906, 0.4045205, 1, 0, 0.9058824, 1,
1.075878, 0.7458777, 1.588017, 1, 0, 0.9019608, 1,
1.079648, -1.344506, 3.298413, 1, 0, 0.8941177, 1,
1.081741, -0.6989369, 2.279698, 1, 0, 0.8862745, 1,
1.086333, -0.2862092, 1.539853, 1, 0, 0.8823529, 1,
1.088244, 0.04047483, 1.383853, 1, 0, 0.8745098, 1,
1.09323, -0.02855691, 2.69512, 1, 0, 0.8705882, 1,
1.094858, 1.630065, -0.171708, 1, 0, 0.8627451, 1,
1.106111, -1.360913, 2.196997, 1, 0, 0.8588235, 1,
1.106269, 1.010404, 1.489982, 1, 0, 0.8509804, 1,
1.107322, -0.5232075, 2.285245, 1, 0, 0.8470588, 1,
1.114144, 1.744172, 0.3381989, 1, 0, 0.8392157, 1,
1.11494, 1.010362, -0.9529629, 1, 0, 0.8352941, 1,
1.120228, -0.9830716, 1.973274, 1, 0, 0.827451, 1,
1.12092, -2.890759, 1.623572, 1, 0, 0.8235294, 1,
1.123892, 0.235878, -0.707404, 1, 0, 0.8156863, 1,
1.124091, -0.7272821, 2.540766, 1, 0, 0.8117647, 1,
1.12811, 1.420751, -0.4055537, 1, 0, 0.8039216, 1,
1.137182, 0.1098107, -0.633746, 1, 0, 0.7960784, 1,
1.145596, 0.5700627, 0.8531174, 1, 0, 0.7921569, 1,
1.14853, 1.511246, -2.194735, 1, 0, 0.7843137, 1,
1.1529, -0.5434474, 1.919204, 1, 0, 0.7803922, 1,
1.154741, 1.032526, 0.6035997, 1, 0, 0.772549, 1,
1.159808, -0.9895004, 3.059284, 1, 0, 0.7686275, 1,
1.169898, 0.2911198, 0.8963383, 1, 0, 0.7607843, 1,
1.170046, -0.9391277, 3.080498, 1, 0, 0.7568628, 1,
1.176925, 0.05352156, 2.877037, 1, 0, 0.7490196, 1,
1.183651, -0.424505, 2.354259, 1, 0, 0.7450981, 1,
1.209116, 0.0259067, 2.801663, 1, 0, 0.7372549, 1,
1.210378, 0.5688506, 1.520517, 1, 0, 0.7333333, 1,
1.222666, 0.1146328, -0.006274217, 1, 0, 0.7254902, 1,
1.224737, -0.9553555, 1.231158, 1, 0, 0.7215686, 1,
1.232677, 1.088606, -1.020982, 1, 0, 0.7137255, 1,
1.244131, 0.8124755, 1.352307, 1, 0, 0.7098039, 1,
1.26195, 0.1833007, 0.8688607, 1, 0, 0.7019608, 1,
1.262542, 0.2096351, 1.84821, 1, 0, 0.6941177, 1,
1.26445, 1.26233, 1.127226, 1, 0, 0.6901961, 1,
1.268999, 1.377204, 1.272441, 1, 0, 0.682353, 1,
1.277327, 0.9894068, -0.04678319, 1, 0, 0.6784314, 1,
1.278462, 0.2238274, 0.08777497, 1, 0, 0.6705883, 1,
1.282699, -0.9362756, 2.150761, 1, 0, 0.6666667, 1,
1.296626, 0.1798743, 2.196027, 1, 0, 0.6588235, 1,
1.300173, -0.6541119, 1.509951, 1, 0, 0.654902, 1,
1.305484, 0.761579, 2.813397, 1, 0, 0.6470588, 1,
1.306344, 1.851826, 1.092894, 1, 0, 0.6431373, 1,
1.311706, -1.055933, 3.976716, 1, 0, 0.6352941, 1,
1.32914, -1.092083, 4.859412, 1, 0, 0.6313726, 1,
1.34006, -2.44356, 1.963905, 1, 0, 0.6235294, 1,
1.346015, 0.3740067, -1.2579, 1, 0, 0.6196079, 1,
1.35231, 0.1461485, 1.055144, 1, 0, 0.6117647, 1,
1.355397, -0.2487107, 1.459187, 1, 0, 0.6078432, 1,
1.355543, -0.5957767, 2.915377, 1, 0, 0.6, 1,
1.37287, 1.350055, 0.8684223, 1, 0, 0.5921569, 1,
1.37388, 0.1734371, 1.300821, 1, 0, 0.5882353, 1,
1.375038, -3.196146, 2.886474, 1, 0, 0.5803922, 1,
1.390096, 0.3014939, 0.9849468, 1, 0, 0.5764706, 1,
1.392364, -0.3573008, 0.5654562, 1, 0, 0.5686275, 1,
1.398653, 1.623888, -0.08344159, 1, 0, 0.5647059, 1,
1.418814, -0.8378727, 2.263297, 1, 0, 0.5568628, 1,
1.431617, -0.9905625, 0.3786749, 1, 0, 0.5529412, 1,
1.432512, -1.37547, 3.395327, 1, 0, 0.5450981, 1,
1.443512, 0.4327352, 0.5404927, 1, 0, 0.5411765, 1,
1.444544, 0.1679726, 0.5254382, 1, 0, 0.5333334, 1,
1.450015, 1.038376, 2.652889, 1, 0, 0.5294118, 1,
1.451326, -0.630859, 2.117625, 1, 0, 0.5215687, 1,
1.459867, 0.2962943, 0.08138372, 1, 0, 0.5176471, 1,
1.460042, 0.1594751, 2.159435, 1, 0, 0.509804, 1,
1.460856, 0.6905843, 1.925423, 1, 0, 0.5058824, 1,
1.463882, -0.6050515, 1.757835, 1, 0, 0.4980392, 1,
1.468246, -2.22006, 2.232761, 1, 0, 0.4901961, 1,
1.46946, 2.464027, 1.026386, 1, 0, 0.4862745, 1,
1.474552, 1.241445, 1.637115, 1, 0, 0.4784314, 1,
1.476042, -0.9348201, 2.004677, 1, 0, 0.4745098, 1,
1.481048, 0.1813128, -0.2017818, 1, 0, 0.4666667, 1,
1.489921, 1.19503, 1.529661, 1, 0, 0.4627451, 1,
1.495308, -1.014261, 3.524024, 1, 0, 0.454902, 1,
1.499768, 0.8131572, 1.219629, 1, 0, 0.4509804, 1,
1.509162, -1.648408, 3.066039, 1, 0, 0.4431373, 1,
1.509428, 0.2293118, 1.854756, 1, 0, 0.4392157, 1,
1.519027, -0.4447774, 2.27046, 1, 0, 0.4313726, 1,
1.520956, -0.3340494, 2.393597, 1, 0, 0.427451, 1,
1.524259, 1.332863, 0.8388809, 1, 0, 0.4196078, 1,
1.536849, 1.627454, 0.2267086, 1, 0, 0.4156863, 1,
1.541116, -0.006379728, -0.2281863, 1, 0, 0.4078431, 1,
1.542414, 0.9058318, 1.366311, 1, 0, 0.4039216, 1,
1.543974, -0.2779712, 1.256211, 1, 0, 0.3960784, 1,
1.551077, -0.3906095, 1.183335, 1, 0, 0.3882353, 1,
1.553556, -0.5409813, -1.514341, 1, 0, 0.3843137, 1,
1.555218, -0.004687324, 1.19447, 1, 0, 0.3764706, 1,
1.56724, -0.1999125, 1.616115, 1, 0, 0.372549, 1,
1.573356, -0.5441118, 1.877051, 1, 0, 0.3647059, 1,
1.59576, 1.713333, -0.7767413, 1, 0, 0.3607843, 1,
1.611841, 0.2474635, -0.1749662, 1, 0, 0.3529412, 1,
1.621964, -0.1673819, 0.6693105, 1, 0, 0.3490196, 1,
1.622946, -0.4691918, 2.073966, 1, 0, 0.3411765, 1,
1.635373, 0.002694424, 2.371058, 1, 0, 0.3372549, 1,
1.643442, -0.2430867, 2.037533, 1, 0, 0.3294118, 1,
1.64541, -0.2153428, 2.842088, 1, 0, 0.3254902, 1,
1.650154, -0.4015021, 3.267139, 1, 0, 0.3176471, 1,
1.650263, -0.1707916, 2.267852, 1, 0, 0.3137255, 1,
1.651109, 1.393852, -0.10233, 1, 0, 0.3058824, 1,
1.668364, 0.4206346, 1.653999, 1, 0, 0.2980392, 1,
1.683809, -1.376491, 3.830666, 1, 0, 0.2941177, 1,
1.683811, -0.2128779, 2.264633, 1, 0, 0.2862745, 1,
1.690638, 1.952785, 0.6826409, 1, 0, 0.282353, 1,
1.706234, -1.676261, 2.438097, 1, 0, 0.2745098, 1,
1.715407, -0.2103305, 1.28429, 1, 0, 0.2705882, 1,
1.741739, 1.023541, -0.2865812, 1, 0, 0.2627451, 1,
1.756415, -0.6139547, 2.357597, 1, 0, 0.2588235, 1,
1.797222, -1.508137, 0.5429929, 1, 0, 0.2509804, 1,
1.801092, 0.5114067, 0.6392551, 1, 0, 0.2470588, 1,
1.803263, -0.6828519, 3.192705, 1, 0, 0.2392157, 1,
1.830543, -0.2639679, 2.114359, 1, 0, 0.2352941, 1,
1.830879, -0.8018876, 0.7394682, 1, 0, 0.227451, 1,
1.840541, -2.089618, 2.716243, 1, 0, 0.2235294, 1,
1.854299, -0.6400166, 1.717895, 1, 0, 0.2156863, 1,
1.865573, 0.5776139, 1.474157, 1, 0, 0.2117647, 1,
1.875757, 0.05549373, 2.136823, 1, 0, 0.2039216, 1,
1.878267, -0.247425, 2.288718, 1, 0, 0.1960784, 1,
1.885773, 0.2950948, 2.242766, 1, 0, 0.1921569, 1,
1.899302, -0.6731256, 2.200576, 1, 0, 0.1843137, 1,
1.931824, 0.1151698, 2.395643, 1, 0, 0.1803922, 1,
1.936831, 0.03297554, 0.6942762, 1, 0, 0.172549, 1,
1.967871, -1.175604, 3.301517, 1, 0, 0.1686275, 1,
1.98752, 2.652844, -0.1654609, 1, 0, 0.1607843, 1,
1.988885, 0.001834215, 2.143972, 1, 0, 0.1568628, 1,
2.002625, -2.164631, 2.154711, 1, 0, 0.1490196, 1,
2.015698, -0.06251676, 1.237424, 1, 0, 0.145098, 1,
2.046448, 0.1646818, 3.716749, 1, 0, 0.1372549, 1,
2.049078, 0.6868447, 0.2897301, 1, 0, 0.1333333, 1,
2.08928, 0.3507099, 0.2233042, 1, 0, 0.1254902, 1,
2.106031, 0.4274691, 2.059099, 1, 0, 0.1215686, 1,
2.119619, 1.040963, 2.562312, 1, 0, 0.1137255, 1,
2.13923, -2.174631, 2.353894, 1, 0, 0.1098039, 1,
2.164396, 0.2496732, 1.242033, 1, 0, 0.1019608, 1,
2.170198, -1.144799, 3.90228, 1, 0, 0.09411765, 1,
2.191391, 1.068075, 3.164176, 1, 0, 0.09019608, 1,
2.239708, -0.1213057, 3.412405, 1, 0, 0.08235294, 1,
2.279179, -0.03106401, 2.612364, 1, 0, 0.07843138, 1,
2.282566, -0.1330086, 0.8394742, 1, 0, 0.07058824, 1,
2.339243, 0.3862747, 0.8892123, 1, 0, 0.06666667, 1,
2.444979, 0.5573472, 1.558192, 1, 0, 0.05882353, 1,
2.525983, -0.8442576, 4.125362, 1, 0, 0.05490196, 1,
2.648025, 0.5439706, 1.745271, 1, 0, 0.04705882, 1,
2.727782, -0.6355217, 0.9768742, 1, 0, 0.04313726, 1,
2.752478, 0.006427503, 3.002544, 1, 0, 0.03529412, 1,
2.761579, 1.06988, 3.519331, 1, 0, 0.03137255, 1,
2.838389, 1.463561, 0.3306692, 1, 0, 0.02352941, 1,
2.947356, -0.6851422, 1.856957, 1, 0, 0.01960784, 1,
2.952329, -0.924811, 1.692296, 1, 0, 0.01176471, 1,
3.059395, 0.9277197, 1.69506, 1, 0, 0.007843138, 1
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
0.06478548, -4.393606, -7.773011, 0, -0.5, 0.5, 0.5,
0.06478548, -4.393606, -7.773011, 1, -0.5, 0.5, 0.5,
0.06478548, -4.393606, -7.773011, 1, 1.5, 0.5, 0.5,
0.06478548, -4.393606, -7.773011, 0, 1.5, 0.5, 0.5
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
-3.944997, 0.3361815, -7.773011, 0, -0.5, 0.5, 0.5,
-3.944997, 0.3361815, -7.773011, 1, -0.5, 0.5, 0.5,
-3.944997, 0.3361815, -7.773011, 1, 1.5, 0.5, 0.5,
-3.944997, 0.3361815, -7.773011, 0, 1.5, 0.5, 0.5
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
-3.944997, -4.393606, -0.2266953, 0, -0.5, 0.5, 0.5,
-3.944997, -4.393606, -0.2266953, 1, -0.5, 0.5, 0.5,
-3.944997, -4.393606, -0.2266953, 1, 1.5, 0.5, 0.5,
-3.944997, -4.393606, -0.2266953, 0, 1.5, 0.5, 0.5
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
-2, -3.302116, -6.031554,
3, -3.302116, -6.031554,
-2, -3.302116, -6.031554,
-2, -3.484031, -6.321796,
-1, -3.302116, -6.031554,
-1, -3.484031, -6.321796,
0, -3.302116, -6.031554,
0, -3.484031, -6.321796,
1, -3.302116, -6.031554,
1, -3.484031, -6.321796,
2, -3.302116, -6.031554,
2, -3.484031, -6.321796,
3, -3.302116, -6.031554,
3, -3.484031, -6.321796
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
-2, -3.847861, -6.902282, 0, -0.5, 0.5, 0.5,
-2, -3.847861, -6.902282, 1, -0.5, 0.5, 0.5,
-2, -3.847861, -6.902282, 1, 1.5, 0.5, 0.5,
-2, -3.847861, -6.902282, 0, 1.5, 0.5, 0.5,
-1, -3.847861, -6.902282, 0, -0.5, 0.5, 0.5,
-1, -3.847861, -6.902282, 1, -0.5, 0.5, 0.5,
-1, -3.847861, -6.902282, 1, 1.5, 0.5, 0.5,
-1, -3.847861, -6.902282, 0, 1.5, 0.5, 0.5,
0, -3.847861, -6.902282, 0, -0.5, 0.5, 0.5,
0, -3.847861, -6.902282, 1, -0.5, 0.5, 0.5,
0, -3.847861, -6.902282, 1, 1.5, 0.5, 0.5,
0, -3.847861, -6.902282, 0, 1.5, 0.5, 0.5,
1, -3.847861, -6.902282, 0, -0.5, 0.5, 0.5,
1, -3.847861, -6.902282, 1, -0.5, 0.5, 0.5,
1, -3.847861, -6.902282, 1, 1.5, 0.5, 0.5,
1, -3.847861, -6.902282, 0, 1.5, 0.5, 0.5,
2, -3.847861, -6.902282, 0, -0.5, 0.5, 0.5,
2, -3.847861, -6.902282, 1, -0.5, 0.5, 0.5,
2, -3.847861, -6.902282, 1, 1.5, 0.5, 0.5,
2, -3.847861, -6.902282, 0, 1.5, 0.5, 0.5,
3, -3.847861, -6.902282, 0, -0.5, 0.5, 0.5,
3, -3.847861, -6.902282, 1, -0.5, 0.5, 0.5,
3, -3.847861, -6.902282, 1, 1.5, 0.5, 0.5,
3, -3.847861, -6.902282, 0, 1.5, 0.5, 0.5
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
-3.019663, -2, -6.031554,
-3.019663, 2, -6.031554,
-3.019663, -2, -6.031554,
-3.173885, -2, -6.321796,
-3.019663, 0, -6.031554,
-3.173885, 0, -6.321796,
-3.019663, 2, -6.031554,
-3.173885, 2, -6.321796
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
-3.48233, -2, -6.902282, 0, -0.5, 0.5, 0.5,
-3.48233, -2, -6.902282, 1, -0.5, 0.5, 0.5,
-3.48233, -2, -6.902282, 1, 1.5, 0.5, 0.5,
-3.48233, -2, -6.902282, 0, 1.5, 0.5, 0.5,
-3.48233, 0, -6.902282, 0, -0.5, 0.5, 0.5,
-3.48233, 0, -6.902282, 1, -0.5, 0.5, 0.5,
-3.48233, 0, -6.902282, 1, 1.5, 0.5, 0.5,
-3.48233, 0, -6.902282, 0, 1.5, 0.5, 0.5,
-3.48233, 2, -6.902282, 0, -0.5, 0.5, 0.5,
-3.48233, 2, -6.902282, 1, -0.5, 0.5, 0.5,
-3.48233, 2, -6.902282, 1, 1.5, 0.5, 0.5,
-3.48233, 2, -6.902282, 0, 1.5, 0.5, 0.5
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
-3.019663, -3.302116, -4,
-3.019663, -3.302116, 4,
-3.019663, -3.302116, -4,
-3.173885, -3.484031, -4,
-3.019663, -3.302116, -2,
-3.173885, -3.484031, -2,
-3.019663, -3.302116, 0,
-3.173885, -3.484031, 0,
-3.019663, -3.302116, 2,
-3.173885, -3.484031, 2,
-3.019663, -3.302116, 4,
-3.173885, -3.484031, 4
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
-3.48233, -3.847861, -4, 0, -0.5, 0.5, 0.5,
-3.48233, -3.847861, -4, 1, -0.5, 0.5, 0.5,
-3.48233, -3.847861, -4, 1, 1.5, 0.5, 0.5,
-3.48233, -3.847861, -4, 0, 1.5, 0.5, 0.5,
-3.48233, -3.847861, -2, 0, -0.5, 0.5, 0.5,
-3.48233, -3.847861, -2, 1, -0.5, 0.5, 0.5,
-3.48233, -3.847861, -2, 1, 1.5, 0.5, 0.5,
-3.48233, -3.847861, -2, 0, 1.5, 0.5, 0.5,
-3.48233, -3.847861, 0, 0, -0.5, 0.5, 0.5,
-3.48233, -3.847861, 0, 1, -0.5, 0.5, 0.5,
-3.48233, -3.847861, 0, 1, 1.5, 0.5, 0.5,
-3.48233, -3.847861, 0, 0, 1.5, 0.5, 0.5,
-3.48233, -3.847861, 2, 0, -0.5, 0.5, 0.5,
-3.48233, -3.847861, 2, 1, -0.5, 0.5, 0.5,
-3.48233, -3.847861, 2, 1, 1.5, 0.5, 0.5,
-3.48233, -3.847861, 2, 0, 1.5, 0.5, 0.5,
-3.48233, -3.847861, 4, 0, -0.5, 0.5, 0.5,
-3.48233, -3.847861, 4, 1, -0.5, 0.5, 0.5,
-3.48233, -3.847861, 4, 1, 1.5, 0.5, 0.5,
-3.48233, -3.847861, 4, 0, 1.5, 0.5, 0.5
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
-3.019663, -3.302116, -6.031554,
-3.019663, 3.974479, -6.031554,
-3.019663, -3.302116, 5.578163,
-3.019663, 3.974479, 5.578163,
-3.019663, -3.302116, -6.031554,
-3.019663, -3.302116, 5.578163,
-3.019663, 3.974479, -6.031554,
-3.019663, 3.974479, 5.578163,
-3.019663, -3.302116, -6.031554,
3.149234, -3.302116, -6.031554,
-3.019663, -3.302116, 5.578163,
3.149234, -3.302116, 5.578163,
-3.019663, 3.974479, -6.031554,
3.149234, 3.974479, -6.031554,
-3.019663, 3.974479, 5.578163,
3.149234, 3.974479, 5.578163,
3.149234, -3.302116, -6.031554,
3.149234, 3.974479, -6.031554,
3.149234, -3.302116, 5.578163,
3.149234, 3.974479, 5.578163,
3.149234, -3.302116, -6.031554,
3.149234, -3.302116, 5.578163,
3.149234, 3.974479, -6.031554,
3.149234, 3.974479, 5.578163
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
var radius = 8.023752;
var distance = 35.69858;
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
mvMatrix.translate( -0.06478548, -0.3361815, 0.2266953 );
mvMatrix.scale( 1.406319, 1.192238, 0.7472566 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.69858);
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
cyprofuram<-read.table("cyprofuram.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyprofuram$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyprofuram' not found
```

```r
y<-cyprofuram$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyprofuram' not found
```

```r
z<-cyprofuram$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyprofuram' not found
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
-2.929824, -0.5913778, -1.082826, 0, 0, 1, 1, 1,
-2.921464, 2.345762, -1.314856, 1, 0, 0, 1, 1,
-2.915553, -0.7378672, -3.639361, 1, 0, 0, 1, 1,
-2.905423, -1.705348, -1.624883, 1, 0, 0, 1, 1,
-2.824919, -0.1220921, -1.565369, 1, 0, 0, 1, 1,
-2.775312, 0.9007247, -1.468638, 1, 0, 0, 1, 1,
-2.770627, -0.7952486, -2.700573, 0, 0, 0, 1, 1,
-2.735583, -0.6660915, -2.156489, 0, 0, 0, 1, 1,
-2.721633, 0.4928933, -2.708714, 0, 0, 0, 1, 1,
-2.678887, 0.02538742, -1.882193, 0, 0, 0, 1, 1,
-2.623603, -1.472397, -2.410626, 0, 0, 0, 1, 1,
-2.460486, -0.6416212, -0.5432055, 0, 0, 0, 1, 1,
-2.420042, 1.725529, 0.01175999, 0, 0, 0, 1, 1,
-2.338619, 0.6476188, -2.373573, 1, 1, 1, 1, 1,
-2.283134, 0.4152886, -0.3781579, 1, 1, 1, 1, 1,
-2.280279, 1.362624, -0.6651884, 1, 1, 1, 1, 1,
-2.259008, -0.1938452, -1.78242, 1, 1, 1, 1, 1,
-2.198242, -0.8448655, -0.9288936, 1, 1, 1, 1, 1,
-2.116317, 0.6744047, -1.821146, 1, 1, 1, 1, 1,
-2.098264, 0.5441115, -0.8691694, 1, 1, 1, 1, 1,
-2.090324, -0.2023633, -2.637654, 1, 1, 1, 1, 1,
-2.064622, 0.3627518, -1.579656, 1, 1, 1, 1, 1,
-2.014297, -0.05297054, -1.518288, 1, 1, 1, 1, 1,
-2.011819, -0.207314, -0.9108585, 1, 1, 1, 1, 1,
-1.989111, -0.9942236, -1.809966, 1, 1, 1, 1, 1,
-1.977908, 1.319456, -3.915593, 1, 1, 1, 1, 1,
-1.971399, 1.371683, -0.6322491, 1, 1, 1, 1, 1,
-1.970125, -0.3558601, -1.875022, 1, 1, 1, 1, 1,
-1.938957, 0.476452, -0.8181828, 0, 0, 1, 1, 1,
-1.929247, 1.382675, -2.802956, 1, 0, 0, 1, 1,
-1.928762, 0.2088881, -0.7213097, 1, 0, 0, 1, 1,
-1.916975, 2.366887, -1.020054, 1, 0, 0, 1, 1,
-1.916248, 0.5681818, -0.04579243, 1, 0, 0, 1, 1,
-1.879337, -0.7431704, -2.384214, 1, 0, 0, 1, 1,
-1.878694, 0.01333419, -1.06794, 0, 0, 0, 1, 1,
-1.877946, 1.142743, 0.8236905, 0, 0, 0, 1, 1,
-1.801893, 0.3069417, -0.8157098, 0, 0, 0, 1, 1,
-1.785214, -0.2246612, 0.7402151, 0, 0, 0, 1, 1,
-1.781189, 1.453789, -2.14154, 0, 0, 0, 1, 1,
-1.775034, -2.007837, -2.800982, 0, 0, 0, 1, 1,
-1.768561, -0.3105823, -0.2327093, 0, 0, 0, 1, 1,
-1.750847, -0.08439039, -2.059157, 1, 1, 1, 1, 1,
-1.721654, -0.4821353, -2.051802, 1, 1, 1, 1, 1,
-1.720427, -0.05318251, -2.299538, 1, 1, 1, 1, 1,
-1.692754, 0.4245003, 0.1534303, 1, 1, 1, 1, 1,
-1.663766, -1.477137, -1.37745, 1, 1, 1, 1, 1,
-1.642826, 0.3786688, 0.2613503, 1, 1, 1, 1, 1,
-1.631418, 1.544498, -1.717633, 1, 1, 1, 1, 1,
-1.628778, -1.21695, -1.876665, 1, 1, 1, 1, 1,
-1.62472, 2.003472, 0.2214051, 1, 1, 1, 1, 1,
-1.591974, -1.061077, -2.576395, 1, 1, 1, 1, 1,
-1.58587, 0.5013216, -2.149887, 1, 1, 1, 1, 1,
-1.585737, 0.1061713, -0.9938532, 1, 1, 1, 1, 1,
-1.57901, 0.2374619, -2.397566, 1, 1, 1, 1, 1,
-1.577154, 0.2778656, -2.547225, 1, 1, 1, 1, 1,
-1.559158, -0.09908695, -1.7428, 1, 1, 1, 1, 1,
-1.552422, -0.04824732, -0.3520649, 0, 0, 1, 1, 1,
-1.542524, -0.2578206, -2.005591, 1, 0, 0, 1, 1,
-1.53615, 0.3850855, -1.689547, 1, 0, 0, 1, 1,
-1.524166, -1.525117, -3.892595, 1, 0, 0, 1, 1,
-1.521732, 2.485259, 1.69999, 1, 0, 0, 1, 1,
-1.51098, -0.2848785, -1.966982, 1, 0, 0, 1, 1,
-1.506825, 0.2536317, -2.738286, 0, 0, 0, 1, 1,
-1.488782, -0.514608, -3.205243, 0, 0, 0, 1, 1,
-1.480952, -1.320599, -1.725088, 0, 0, 0, 1, 1,
-1.468122, 0.9146067, 0.4873331, 0, 0, 0, 1, 1,
-1.462706, -0.1155199, -2.058069, 0, 0, 0, 1, 1,
-1.458641, 0.07446752, -1.205527, 0, 0, 0, 1, 1,
-1.454122, -1.293756, -1.271136, 0, 0, 0, 1, 1,
-1.442206, -0.8106093, -2.505241, 1, 1, 1, 1, 1,
-1.43768, 0.60337, -0.60623, 1, 1, 1, 1, 1,
-1.435147, -0.6769742, -1.129223, 1, 1, 1, 1, 1,
-1.434967, -0.07105113, -1.22489, 1, 1, 1, 1, 1,
-1.433782, 0.5210035, -3.512605, 1, 1, 1, 1, 1,
-1.433522, -0.02314407, -0.9178157, 1, 1, 1, 1, 1,
-1.429294, 0.6403818, -1.389314, 1, 1, 1, 1, 1,
-1.428174, 0.5712914, -1.095138, 1, 1, 1, 1, 1,
-1.415533, 0.3740749, -0.5494269, 1, 1, 1, 1, 1,
-1.403821, 0.7067122, -2.105688, 1, 1, 1, 1, 1,
-1.39606, -0.5809974, -2.530156, 1, 1, 1, 1, 1,
-1.395838, -0.3968804, -2.674149, 1, 1, 1, 1, 1,
-1.39026, -0.5450693, -2.117804, 1, 1, 1, 1, 1,
-1.384467, 0.2659316, -2.939196, 1, 1, 1, 1, 1,
-1.383718, 0.5334444, -1.996839, 1, 1, 1, 1, 1,
-1.358561, -0.5778492, -0.7697957, 0, 0, 1, 1, 1,
-1.349554, -0.5603084, -2.470739, 1, 0, 0, 1, 1,
-1.348657, -1.516879, -4.300934, 1, 0, 0, 1, 1,
-1.340765, 0.8674342, -2.631127, 1, 0, 0, 1, 1,
-1.325238, -0.1355013, -2.891833, 1, 0, 0, 1, 1,
-1.319987, 0.09592116, -0.1112598, 1, 0, 0, 1, 1,
-1.297288, -0.05807775, -0.6225579, 0, 0, 0, 1, 1,
-1.289501, -0.2496208, -1.150767, 0, 0, 0, 1, 1,
-1.288585, -0.6300105, -0.5951383, 0, 0, 0, 1, 1,
-1.287827, -1.299912, -3.002207, 0, 0, 0, 1, 1,
-1.2789, -1.507294, -2.881513, 0, 0, 0, 1, 1,
-1.267925, -0.217374, -1.530822, 0, 0, 0, 1, 1,
-1.26527, -1.903334, -2.495003, 0, 0, 0, 1, 1,
-1.265143, 0.9441065, -0.8457742, 1, 1, 1, 1, 1,
-1.265097, 0.5013874, -2.615968, 1, 1, 1, 1, 1,
-1.248179, -1.364929, -2.679526, 1, 1, 1, 1, 1,
-1.241836, 1.285533, -0.7446093, 1, 1, 1, 1, 1,
-1.228881, -0.05857893, -3.244722, 1, 1, 1, 1, 1,
-1.228373, -0.9081985, -0.9645635, 1, 1, 1, 1, 1,
-1.212245, -0.1705758, -0.4476796, 1, 1, 1, 1, 1,
-1.21001, -0.2260363, -1.742943, 1, 1, 1, 1, 1,
-1.20688, 0.5485609, -1.930698, 1, 1, 1, 1, 1,
-1.196542, -1.036275, -1.468267, 1, 1, 1, 1, 1,
-1.189508, 0.1242951, -0.6964443, 1, 1, 1, 1, 1,
-1.183518, 1.420496, -0.7457032, 1, 1, 1, 1, 1,
-1.175166, -1.34963, -0.9839864, 1, 1, 1, 1, 1,
-1.170557, -0.1038267, -3.065809, 1, 1, 1, 1, 1,
-1.164605, -0.2764791, -1.156558, 1, 1, 1, 1, 1,
-1.163332, -0.9403901, -0.6785227, 0, 0, 1, 1, 1,
-1.159171, -0.9400215, -3.411858, 1, 0, 0, 1, 1,
-1.159067, -0.7265073, -3.331273, 1, 0, 0, 1, 1,
-1.142878, 1.103717, -0.6422291, 1, 0, 0, 1, 1,
-1.139112, -0.02201661, -2.192961, 1, 0, 0, 1, 1,
-1.134016, 0.5138654, -1.624569, 1, 0, 0, 1, 1,
-1.133592, -0.5255562, -1.946724, 0, 0, 0, 1, 1,
-1.130805, -0.591695, -2.484274, 0, 0, 0, 1, 1,
-1.129217, 0.5885939, -0.1659626, 0, 0, 0, 1, 1,
-1.126384, 0.09302206, -1.395123, 0, 0, 0, 1, 1,
-1.125589, -0.4607348, -2.140134, 0, 0, 0, 1, 1,
-1.124418, -0.5614371, -0.7472969, 0, 0, 0, 1, 1,
-1.123566, -0.7195444, -2.513206, 0, 0, 0, 1, 1,
-1.121496, -0.9004005, -2.377394, 1, 1, 1, 1, 1,
-1.113774, 1.239063, -0.1575735, 1, 1, 1, 1, 1,
-1.111386, 0.09724279, -2.773656, 1, 1, 1, 1, 1,
-1.106201, -0.05545896, -1.284241, 1, 1, 1, 1, 1,
-1.092753, -1.930446, -3.035395, 1, 1, 1, 1, 1,
-1.0921, 0.01380459, 0.02410673, 1, 1, 1, 1, 1,
-1.083957, -0.5371277, -1.36301, 1, 1, 1, 1, 1,
-1.067561, 1.640613, -0.2635776, 1, 1, 1, 1, 1,
-1.066176, -1.324795, -2.426031, 1, 1, 1, 1, 1,
-1.060084, 0.9429473, 1.162073, 1, 1, 1, 1, 1,
-1.057584, -1.135641, -1.147797, 1, 1, 1, 1, 1,
-1.053337, -0.260598, -1.412088, 1, 1, 1, 1, 1,
-1.051981, 1.372276, -1.163102, 1, 1, 1, 1, 1,
-1.044374, 1.358686, -1.66967, 1, 1, 1, 1, 1,
-1.042529, 0.09037562, -1.155292, 1, 1, 1, 1, 1,
-1.039349, -1.557362, -3.331729, 0, 0, 1, 1, 1,
-1.034408, 0.875527, -0.4733065, 1, 0, 0, 1, 1,
-1.033109, 1.053586, -1.516919, 1, 0, 0, 1, 1,
-1.029955, 1.199597, -0.6270724, 1, 0, 0, 1, 1,
-1.025768, 0.4854612, 0.9468388, 1, 0, 0, 1, 1,
-1.025446, 1.296369, 0.65505, 1, 0, 0, 1, 1,
-1.02228, 0.1639331, -1.039472, 0, 0, 0, 1, 1,
-1.007176, -0.9746934, -2.695543, 0, 0, 0, 1, 1,
-1.005572, 1.037052, -0.7212397, 0, 0, 0, 1, 1,
-1.002401, -0.3576677, -1.298688, 0, 0, 0, 1, 1,
-1.002241, -1.160676, -2.351463, 0, 0, 0, 1, 1,
-0.996489, 0.1058466, -2.337532, 0, 0, 0, 1, 1,
-0.9936634, -1.401256, -3.1842, 0, 0, 0, 1, 1,
-0.9934308, -0.736576, 1.00649, 1, 1, 1, 1, 1,
-0.9923376, 0.6347724, -0.6038086, 1, 1, 1, 1, 1,
-0.9905112, -0.1859185, -0.2323736, 1, 1, 1, 1, 1,
-0.9899412, -1.28958, -3.421395, 1, 1, 1, 1, 1,
-0.9878535, 0.8813849, 1.84385, 1, 1, 1, 1, 1,
-0.9828158, -0.9654793, -2.231919, 1, 1, 1, 1, 1,
-0.9823235, 0.4584254, -1.766283, 1, 1, 1, 1, 1,
-0.9823096, 0.9204627, -0.002493877, 1, 1, 1, 1, 1,
-0.9812955, -1.940479, -3.152677, 1, 1, 1, 1, 1,
-0.9802878, -0.709689, -1.063394, 1, 1, 1, 1, 1,
-0.9789606, -0.1635367, -1.066097, 1, 1, 1, 1, 1,
-0.9741706, 0.4104443, -1.790267, 1, 1, 1, 1, 1,
-0.9736298, -0.8628961, -2.913467, 1, 1, 1, 1, 1,
-0.9644829, -2.162251, -1.485355, 1, 1, 1, 1, 1,
-0.9564687, -1.217953, -3.218467, 1, 1, 1, 1, 1,
-0.9547725, -2.151597, -3.002935, 0, 0, 1, 1, 1,
-0.9514682, -1.103999, -4.041978, 1, 0, 0, 1, 1,
-0.9490397, 0.5210202, 0.7113892, 1, 0, 0, 1, 1,
-0.9469007, 1.015941, -0.2507632, 1, 0, 0, 1, 1,
-0.9435711, -0.6034567, -0.8831774, 1, 0, 0, 1, 1,
-0.9429257, -0.5990922, -2.463982, 1, 0, 0, 1, 1,
-0.9426716, -0.4768789, -0.3849775, 0, 0, 0, 1, 1,
-0.9352761, -1.163584, -3.979507, 0, 0, 0, 1, 1,
-0.9292617, 0.04114695, -0.5977474, 0, 0, 0, 1, 1,
-0.9280569, 0.6382223, -0.6100345, 0, 0, 0, 1, 1,
-0.9257342, -0.4390097, -3.721577, 0, 0, 0, 1, 1,
-0.9250663, 0.8957605, -0.5654662, 0, 0, 0, 1, 1,
-0.9239553, 1.892272, -0.03927613, 0, 0, 0, 1, 1,
-0.9230317, 0.6531981, -0.7489929, 1, 1, 1, 1, 1,
-0.9202315, -1.060595, -2.255578, 1, 1, 1, 1, 1,
-0.9196787, -1.388744, -2.886789, 1, 1, 1, 1, 1,
-0.9172098, -0.1971397, -1.800732, 1, 1, 1, 1, 1,
-0.9093335, 0.1083263, -0.7357908, 1, 1, 1, 1, 1,
-0.9041664, -1.098349, -1.058029, 1, 1, 1, 1, 1,
-0.9000915, 0.5322362, -1.986015, 1, 1, 1, 1, 1,
-0.8962221, 0.2917258, -1.639402, 1, 1, 1, 1, 1,
-0.8954311, -0.2726961, -2.321349, 1, 1, 1, 1, 1,
-0.8937027, -1.508886, -4.250272, 1, 1, 1, 1, 1,
-0.8889366, 1.081798, -0.9674935, 1, 1, 1, 1, 1,
-0.8809865, -0.2449866, -2.913985, 1, 1, 1, 1, 1,
-0.879392, 0.4824155, -1.48478, 1, 1, 1, 1, 1,
-0.8761124, -1.498465, -3.224988, 1, 1, 1, 1, 1,
-0.8735394, 0.4868025, 1.440771, 1, 1, 1, 1, 1,
-0.8660495, 0.8648382, 1.886972, 0, 0, 1, 1, 1,
-0.8651932, -1.039165, -1.046334, 1, 0, 0, 1, 1,
-0.863786, 1.827487, -1.037557, 1, 0, 0, 1, 1,
-0.8532701, 0.1241087, -1.262019, 1, 0, 0, 1, 1,
-0.8511471, 1.262245, -2.137064, 1, 0, 0, 1, 1,
-0.8474267, 0.05772118, -0.07643981, 1, 0, 0, 1, 1,
-0.8431971, 0.1615035, -1.573013, 0, 0, 0, 1, 1,
-0.8292996, -0.6222581, -1.936656, 0, 0, 0, 1, 1,
-0.8283433, 0.7952951, -0.403877, 0, 0, 0, 1, 1,
-0.8185296, 1.492033, -0.8792765, 0, 0, 0, 1, 1,
-0.8115716, 2.591628, 0.4304273, 0, 0, 0, 1, 1,
-0.8106353, -0.245523, -3.028197, 0, 0, 0, 1, 1,
-0.8004473, 1.048087, -0.7372981, 0, 0, 0, 1, 1,
-0.7912413, -0.6333689, -3.982998, 1, 1, 1, 1, 1,
-0.7901652, -0.9498268, -0.9787302, 1, 1, 1, 1, 1,
-0.7898006, -0.4830675, -1.867637, 1, 1, 1, 1, 1,
-0.7892594, 0.8170557, -0.4264455, 1, 1, 1, 1, 1,
-0.7887867, -0.6279797, -0.2366632, 1, 1, 1, 1, 1,
-0.7881286, 0.09456703, -1.554361, 1, 1, 1, 1, 1,
-0.7857744, 0.4755119, 0.7322967, 1, 1, 1, 1, 1,
-0.784844, -0.422116, -2.339046, 1, 1, 1, 1, 1,
-0.7670356, -1.869747, -2.380947, 1, 1, 1, 1, 1,
-0.7644836, -0.4571864, -1.160694, 1, 1, 1, 1, 1,
-0.7572504, 0.5591904, -2.683665, 1, 1, 1, 1, 1,
-0.7526523, 0.5408305, -1.449152, 1, 1, 1, 1, 1,
-0.7444988, 0.1426291, -0.1370644, 1, 1, 1, 1, 1,
-0.7394743, 0.4958952, -1.251553, 1, 1, 1, 1, 1,
-0.7375069, -1.078207, -3.861734, 1, 1, 1, 1, 1,
-0.7345083, 0.3959483, -2.334151, 0, 0, 1, 1, 1,
-0.7314167, 0.6588004, -0.3440865, 1, 0, 0, 1, 1,
-0.7290347, -1.028177, -1.06083, 1, 0, 0, 1, 1,
-0.7242178, 0.9299481, 0.5407834, 1, 0, 0, 1, 1,
-0.7218164, 1.156668, -0.7181109, 1, 0, 0, 1, 1,
-0.7203003, 0.8415623, 0.08784443, 1, 0, 0, 1, 1,
-0.7181616, -1.286225, -0.331377, 0, 0, 0, 1, 1,
-0.7105002, 0.07543317, -1.178313, 0, 0, 0, 1, 1,
-0.7039981, -0.7036753, -4.339704, 0, 0, 0, 1, 1,
-0.6999229, 0.6720392, -0.5753551, 0, 0, 0, 1, 1,
-0.6980228, 1.745187, -0.926348, 0, 0, 0, 1, 1,
-0.6956175, -1.22133, -2.810622, 0, 0, 0, 1, 1,
-0.6903874, 0.9247106, -0.4526353, 0, 0, 0, 1, 1,
-0.6885372, 0.1196779, -1.637152, 1, 1, 1, 1, 1,
-0.6820322, 0.5163373, -1.137415, 1, 1, 1, 1, 1,
-0.6804453, -0.8432084, -2.009359, 1, 1, 1, 1, 1,
-0.6793009, -1.482691, -4.302533, 1, 1, 1, 1, 1,
-0.6744848, -0.8175457, -3.613639, 1, 1, 1, 1, 1,
-0.6711549, -1.255008, -2.13401, 1, 1, 1, 1, 1,
-0.6683372, -0.836247, -2.947854, 1, 1, 1, 1, 1,
-0.667182, -1.515638, -1.351964, 1, 1, 1, 1, 1,
-0.6634193, 0.04816489, -1.424416, 1, 1, 1, 1, 1,
-0.6633794, -0.6158356, -2.58996, 1, 1, 1, 1, 1,
-0.6493508, 0.1567411, -2.659806, 1, 1, 1, 1, 1,
-0.6465889, -0.2630637, -2.774755, 1, 1, 1, 1, 1,
-0.6462392, 0.2955002, -0.871505, 1, 1, 1, 1, 1,
-0.6460634, -0.6186031, -4.52521, 1, 1, 1, 1, 1,
-0.6354952, -0.3401419, -2.973243, 1, 1, 1, 1, 1,
-0.6286317, 0.1908476, -0.8620328, 0, 0, 1, 1, 1,
-0.6281513, -1.01413, -1.742945, 1, 0, 0, 1, 1,
-0.616755, 1.149783, -1.295619, 1, 0, 0, 1, 1,
-0.6160452, -1.114783, -1.66001, 1, 0, 0, 1, 1,
-0.6146759, 0.1525267, -0.9803352, 1, 0, 0, 1, 1,
-0.6146154, -0.7154482, -1.237933, 1, 0, 0, 1, 1,
-0.6136314, -0.3316493, -1.132841, 0, 0, 0, 1, 1,
-0.6082778, -1.293668, -1.334155, 0, 0, 0, 1, 1,
-0.6049616, -0.6018785, -3.253805, 0, 0, 0, 1, 1,
-0.5971708, -0.008807484, -2.440686, 0, 0, 0, 1, 1,
-0.5897804, 0.8068932, 0.3380934, 0, 0, 0, 1, 1,
-0.586552, -0.1946261, -2.334365, 0, 0, 0, 1, 1,
-0.5846007, -0.1531336, -0.5677834, 0, 0, 0, 1, 1,
-0.5822504, 0.3513891, -1.023342, 1, 1, 1, 1, 1,
-0.5822407, 0.08205705, -1.54707, 1, 1, 1, 1, 1,
-0.5761293, -0.6508817, -1.724141, 1, 1, 1, 1, 1,
-0.5722562, -1.321596, -2.787443, 1, 1, 1, 1, 1,
-0.5683792, 0.3274391, 0.3284944, 1, 1, 1, 1, 1,
-0.5636235, 2.074275, -0.6825008, 1, 1, 1, 1, 1,
-0.5516651, 0.6011401, -2.73235, 1, 1, 1, 1, 1,
-0.5419046, -0.6057683, -4.159308, 1, 1, 1, 1, 1,
-0.5390363, -0.899851, -2.268245, 1, 1, 1, 1, 1,
-0.5356345, -1.044367, -4.076311, 1, 1, 1, 1, 1,
-0.532058, -0.7454692, -2.835839, 1, 1, 1, 1, 1,
-0.5310487, 1.145583, -3.475015, 1, 1, 1, 1, 1,
-0.5254583, 0.1884057, -0.3689648, 1, 1, 1, 1, 1,
-0.5230257, -0.9701208, -3.776073, 1, 1, 1, 1, 1,
-0.5157056, 0.6625886, -2.106999, 1, 1, 1, 1, 1,
-0.5138588, -0.435606, -3.234094, 0, 0, 1, 1, 1,
-0.5110188, 0.2637876, -1.17577, 1, 0, 0, 1, 1,
-0.5106763, -0.1738698, -3.728703, 1, 0, 0, 1, 1,
-0.5097633, -0.2867088, -2.734373, 1, 0, 0, 1, 1,
-0.5065999, 0.8302379, -1.331338, 1, 0, 0, 1, 1,
-0.4999643, 0.9081009, -1.538522, 1, 0, 0, 1, 1,
-0.4953652, 0.195929, -0.921846, 0, 0, 0, 1, 1,
-0.4948075, 1.917117, 0.2510235, 0, 0, 0, 1, 1,
-0.492189, 0.5763466, -0.5177751, 0, 0, 0, 1, 1,
-0.4871537, 0.3729284, -0.5060693, 0, 0, 0, 1, 1,
-0.4869961, -0.8949802, -1.802175, 0, 0, 0, 1, 1,
-0.4858893, -0.7099776, -0.7092215, 0, 0, 0, 1, 1,
-0.4850622, -0.470288, -2.909539, 0, 0, 0, 1, 1,
-0.4849963, -1.128928, -3.051692, 1, 1, 1, 1, 1,
-0.482191, 0.07243807, -2.527928, 1, 1, 1, 1, 1,
-0.4820939, 0.4301272, -2.116374, 1, 1, 1, 1, 1,
-0.4706277, 0.4558045, -0.4806694, 1, 1, 1, 1, 1,
-0.4689832, -0.1087925, -2.7025, 1, 1, 1, 1, 1,
-0.4625978, 1.003479, -1.321055, 1, 1, 1, 1, 1,
-0.4611557, 1.609655, 0.7464216, 1, 1, 1, 1, 1,
-0.4590065, -1.355922, -4.109206, 1, 1, 1, 1, 1,
-0.4563747, 0.3866134, -1.174209, 1, 1, 1, 1, 1,
-0.4507793, -0.1021018, -2.101595, 1, 1, 1, 1, 1,
-0.4499998, 1.063964, -2.231897, 1, 1, 1, 1, 1,
-0.4493695, 0.9318179, -1.260351, 1, 1, 1, 1, 1,
-0.4467131, 0.3995504, -0.003634403, 1, 1, 1, 1, 1,
-0.4450153, -0.6346481, -2.307095, 1, 1, 1, 1, 1,
-0.4378895, 0.09510062, -2.845577, 1, 1, 1, 1, 1,
-0.4372679, 1.301065, -0.9769486, 0, 0, 1, 1, 1,
-0.4370842, -0.7146473, -1.858793, 1, 0, 0, 1, 1,
-0.4312774, 0.09770714, -1.113931, 1, 0, 0, 1, 1,
-0.4253063, -0.5484939, -2.465215, 1, 0, 0, 1, 1,
-0.4247729, -1.148226, -1.852898, 1, 0, 0, 1, 1,
-0.420622, 0.5891443, -0.1763062, 1, 0, 0, 1, 1,
-0.4164963, 0.08999965, -0.6047328, 0, 0, 0, 1, 1,
-0.4141508, 1.158662, 1.333174, 0, 0, 0, 1, 1,
-0.4139979, -0.6072506, -2.378939, 0, 0, 0, 1, 1,
-0.4135058, -0.07337243, -1.802704, 0, 0, 0, 1, 1,
-0.4131214, 0.1479384, -1.477049, 0, 0, 0, 1, 1,
-0.4118547, 0.2481795, -1.177509, 0, 0, 0, 1, 1,
-0.4014096, 0.5767277, -0.6526841, 0, 0, 0, 1, 1,
-0.3965595, 0.9846081, 0.2681087, 1, 1, 1, 1, 1,
-0.3805162, -1.985235, -4.223953, 1, 1, 1, 1, 1,
-0.3804867, -1.959955, -1.665411, 1, 1, 1, 1, 1,
-0.379535, -0.650649, -2.484905, 1, 1, 1, 1, 1,
-0.3782555, 2.014856, -1.789456, 1, 1, 1, 1, 1,
-0.3659323, -0.1351795, -2.40166, 1, 1, 1, 1, 1,
-0.3590932, -0.617729, -3.092767, 1, 1, 1, 1, 1,
-0.3518277, -1.145688, -2.43268, 1, 1, 1, 1, 1,
-0.3501635, -0.851423, -3.363341, 1, 1, 1, 1, 1,
-0.3474749, 0.2000847, -1.713856, 1, 1, 1, 1, 1,
-0.3471711, 0.8416039, -0.1044744, 1, 1, 1, 1, 1,
-0.3414876, 0.1761103, -0.5829665, 1, 1, 1, 1, 1,
-0.3385893, -1.207798, -1.544139, 1, 1, 1, 1, 1,
-0.3383478, 0.7120605, 0.2385183, 1, 1, 1, 1, 1,
-0.3378742, 0.1318601, 0.3944381, 1, 1, 1, 1, 1,
-0.3376735, -0.262599, -4.098053, 0, 0, 1, 1, 1,
-0.3348688, 1.008796, 0.8570911, 1, 0, 0, 1, 1,
-0.3320358, 1.026571, -0.6078777, 1, 0, 0, 1, 1,
-0.3317537, 1.046988, -0.6979169, 1, 0, 0, 1, 1,
-0.3287205, 0.7911437, 1.202392, 1, 0, 0, 1, 1,
-0.327405, 1.076661, 0.6891978, 1, 0, 0, 1, 1,
-0.3267532, 0.2975042, -0.9571245, 0, 0, 0, 1, 1,
-0.3266787, 0.6395708, 0.6854851, 0, 0, 0, 1, 1,
-0.3195172, -1.761598, -0.8386589, 0, 0, 0, 1, 1,
-0.3176821, 0.5986583, -2.04868, 0, 0, 0, 1, 1,
-0.3165473, -0.3966585, -3.898318, 0, 0, 0, 1, 1,
-0.3152308, 0.3427791, 0.01499652, 0, 0, 0, 1, 1,
-0.3139395, 0.9352373, 0.5953598, 0, 0, 0, 1, 1,
-0.3134839, -0.7788403, -4.295912, 1, 1, 1, 1, 1,
-0.306497, 0.224522, -0.2912464, 1, 1, 1, 1, 1,
-0.3053259, 1.881732, -0.02596574, 1, 1, 1, 1, 1,
-0.2988326, 0.6111118, 0.3263767, 1, 1, 1, 1, 1,
-0.2979608, -1.072682, -2.069916, 1, 1, 1, 1, 1,
-0.2977185, 0.09572215, -2.611562, 1, 1, 1, 1, 1,
-0.2946702, 0.3640015, -0.7873923, 1, 1, 1, 1, 1,
-0.2890101, 0.8143644, 0.08153099, 1, 1, 1, 1, 1,
-0.2886482, -0.1021443, -1.272018, 1, 1, 1, 1, 1,
-0.2868997, 0.1587076, -2.620775, 1, 1, 1, 1, 1,
-0.2834519, 0.9233361, -0.9124729, 1, 1, 1, 1, 1,
-0.2827088, 0.4684364, -1.445056, 1, 1, 1, 1, 1,
-0.2811135, -0.3185388, -1.04178, 1, 1, 1, 1, 1,
-0.2807027, -1.21898, -3.043815, 1, 1, 1, 1, 1,
-0.2744214, 2.855751, 0.4136499, 1, 1, 1, 1, 1,
-0.2726225, 0.8505022, -2.03074, 0, 0, 1, 1, 1,
-0.2706645, -1.093886, -2.775476, 1, 0, 0, 1, 1,
-0.2703544, -0.3415038, -4.092814, 1, 0, 0, 1, 1,
-0.2677427, 0.2111354, -0.3043418, 1, 0, 0, 1, 1,
-0.2670649, -0.008545018, -0.885824, 1, 0, 0, 1, 1,
-0.2637915, -0.9364606, -2.351984, 1, 0, 0, 1, 1,
-0.2618297, -1.335567, -1.866896, 0, 0, 0, 1, 1,
-0.2599908, 0.3314111, 0.7666738, 0, 0, 0, 1, 1,
-0.2562097, -0.1660397, -2.172751, 0, 0, 0, 1, 1,
-0.2560518, 0.9101818, -1.536453, 0, 0, 0, 1, 1,
-0.2535779, -0.1045315, -2.316212, 0, 0, 0, 1, 1,
-0.2528906, 0.4246351, -1.261337, 0, 0, 0, 1, 1,
-0.2523913, -0.7634763, -3.956851, 0, 0, 0, 1, 1,
-0.250475, 2.384378, 0.8538761, 1, 1, 1, 1, 1,
-0.2446735, 0.4649643, -0.4254537, 1, 1, 1, 1, 1,
-0.2420369, -1.694751, -1.932645, 1, 1, 1, 1, 1,
-0.2401293, 0.3327253, 1.099079, 1, 1, 1, 1, 1,
-0.2377641, -0.5751495, -4.690853, 1, 1, 1, 1, 1,
-0.2369341, -1.396462, -2.401704, 1, 1, 1, 1, 1,
-0.2313001, -0.7511484, -1.53379, 1, 1, 1, 1, 1,
-0.2245295, -0.7256336, -2.804733, 1, 1, 1, 1, 1,
-0.2230618, 1.271909, -2.002155, 1, 1, 1, 1, 1,
-0.2208171, -0.9642726, -4.416447, 1, 1, 1, 1, 1,
-0.2200663, -0.6933173, -2.45306, 1, 1, 1, 1, 1,
-0.2120003, -0.431518, -2.975613, 1, 1, 1, 1, 1,
-0.2118951, 1.207847, -2.562888, 1, 1, 1, 1, 1,
-0.2100186, -0.2919749, -3.199538, 1, 1, 1, 1, 1,
-0.2088801, 2.18207, 0.4009038, 1, 1, 1, 1, 1,
-0.2085641, -1.356758, -2.638944, 0, 0, 1, 1, 1,
-0.2073899, -1.984984, -5.0327, 1, 0, 0, 1, 1,
-0.2042087, 0.02435264, -2.431793, 1, 0, 0, 1, 1,
-0.2041921, 0.2095402, -1.474235, 1, 0, 0, 1, 1,
-0.2038278, 0.2086853, 1.351015, 1, 0, 0, 1, 1,
-0.1974469, -1.391095, -3.23343, 1, 0, 0, 1, 1,
-0.1936551, -0.6511157, -1.928636, 0, 0, 0, 1, 1,
-0.1911932, -0.3988307, -2.122584, 0, 0, 0, 1, 1,
-0.1877008, 0.04619444, 1.1259, 0, 0, 0, 1, 1,
-0.1872884, 1.456971, -0.6946483, 0, 0, 0, 1, 1,
-0.1872042, -0.01637225, -0.12981, 0, 0, 0, 1, 1,
-0.1862667, 1.78224, -1.224, 0, 0, 0, 1, 1,
-0.1845481, 1.434234, 0.7145812, 0, 0, 0, 1, 1,
-0.181007, 0.01411735, -2.073756, 1, 1, 1, 1, 1,
-0.1787304, 0.3098962, 0.02547695, 1, 1, 1, 1, 1,
-0.1761452, 0.1027054, -1.479619, 1, 1, 1, 1, 1,
-0.1759689, -1.229855, -0.6311308, 1, 1, 1, 1, 1,
-0.1757693, 0.6498235, -0.10186, 1, 1, 1, 1, 1,
-0.1751607, -0.5404339, -1.971985, 1, 1, 1, 1, 1,
-0.1695711, -0.865311, -2.745456, 1, 1, 1, 1, 1,
-0.1639862, 0.348702, 1.49053, 1, 1, 1, 1, 1,
-0.1636862, -1.621314, -2.510382, 1, 1, 1, 1, 1,
-0.163326, 0.1888126, 0.04424272, 1, 1, 1, 1, 1,
-0.1603683, -0.7316296, -1.788821, 1, 1, 1, 1, 1,
-0.1600472, -0.9429013, -2.735534, 1, 1, 1, 1, 1,
-0.1593039, -0.1063257, -0.134656, 1, 1, 1, 1, 1,
-0.1531782, 0.4449775, -0.2789488, 1, 1, 1, 1, 1,
-0.1501112, -0.6202427, -2.921093, 1, 1, 1, 1, 1,
-0.1499716, 0.02626084, -1.571923, 0, 0, 1, 1, 1,
-0.1476765, -0.008975312, -2.334144, 1, 0, 0, 1, 1,
-0.1474697, 0.3511113, -2.261479, 1, 0, 0, 1, 1,
-0.1464576, 0.4917161, -0.4957426, 1, 0, 0, 1, 1,
-0.1450931, 0.8100151, 0.6013932, 1, 0, 0, 1, 1,
-0.1439066, -2.735256, -5.86248, 1, 0, 0, 1, 1,
-0.1386403, -0.230807, -3.631551, 0, 0, 0, 1, 1,
-0.1338114, -1.365316, -3.413252, 0, 0, 0, 1, 1,
-0.1299941, 0.2085329, -1.821863, 0, 0, 0, 1, 1,
-0.1290705, 0.6509643, -1.157041, 0, 0, 0, 1, 1,
-0.1241834, -0.3573989, -3.069201, 0, 0, 0, 1, 1,
-0.1214642, 1.933337, -0.4438337, 0, 0, 0, 1, 1,
-0.1214197, -0.06808329, -2.103628, 0, 0, 0, 1, 1,
-0.1211216, -1.488621, -4.113338, 1, 1, 1, 1, 1,
-0.1170122, 1.488037, 1.744568, 1, 1, 1, 1, 1,
-0.1165534, 0.3919252, -0.004727726, 1, 1, 1, 1, 1,
-0.116402, -1.141222, -3.849279, 1, 1, 1, 1, 1,
-0.115935, 0.1046849, -0.985412, 1, 1, 1, 1, 1,
-0.1155516, 0.8196939, -2.77536, 1, 1, 1, 1, 1,
-0.1153566, -0.9398875, -2.045702, 1, 1, 1, 1, 1,
-0.1141286, -0.1118724, -2.463221, 1, 1, 1, 1, 1,
-0.1094156, -0.7328784, -1.915528, 1, 1, 1, 1, 1,
-0.108071, -0.2652325, -2.524467, 1, 1, 1, 1, 1,
-0.1072699, -0.6222754, -4.201731, 1, 1, 1, 1, 1,
-0.1044388, -0.2919345, -3.797263, 1, 1, 1, 1, 1,
-0.09985168, -0.2405604, -3.623063, 1, 1, 1, 1, 1,
-0.09695984, 1.290738, 0.9548184, 1, 1, 1, 1, 1,
-0.09641489, -1.572413, -2.788522, 1, 1, 1, 1, 1,
-0.09619961, 1.559463, 1.824347, 0, 0, 1, 1, 1,
-0.09213392, 0.268469, 0.3509385, 1, 0, 0, 1, 1,
-0.09005564, 0.6003982, -0.7020455, 1, 0, 0, 1, 1,
-0.08736081, 1.518778, -1.184536, 1, 0, 0, 1, 1,
-0.08429505, 0.1394378, -0.5629509, 1, 0, 0, 1, 1,
-0.08111922, 0.7457902, -0.1320782, 1, 0, 0, 1, 1,
-0.07372592, -0.2045494, -3.294746, 0, 0, 0, 1, 1,
-0.07323004, -0.1535115, -1.558694, 0, 0, 0, 1, 1,
-0.0611327, -0.7665864, -4.239499, 0, 0, 0, 1, 1,
-0.06111408, -0.327505, -3.820912, 0, 0, 0, 1, 1,
-0.05690857, 1.777057, -1.035577, 0, 0, 0, 1, 1,
-0.05387887, 1.267581, -0.04715358, 0, 0, 0, 1, 1,
-0.04410754, -0.5714766, -3.558584, 0, 0, 0, 1, 1,
-0.04381903, -0.6531563, -3.003071, 1, 1, 1, 1, 1,
-0.04336105, 0.1027494, -0.450649, 1, 1, 1, 1, 1,
-0.0408858, -1.941452, -1.492664, 1, 1, 1, 1, 1,
-0.03968839, -1.093225, -3.137876, 1, 1, 1, 1, 1,
-0.03752864, -0.658682, -2.882663, 1, 1, 1, 1, 1,
-0.03584492, 1.986239, -1.159368, 1, 1, 1, 1, 1,
-0.03515279, 0.1556458, -0.5158052, 1, 1, 1, 1, 1,
-0.03420894, 0.5679815, 1.98223, 1, 1, 1, 1, 1,
-0.03420201, -0.06210554, -3.142867, 1, 1, 1, 1, 1,
-0.02791258, 0.3729219, 0.6042743, 1, 1, 1, 1, 1,
-0.02732807, 1.030014, 0.473369, 1, 1, 1, 1, 1,
-0.02637963, 1.996785, 0.1633702, 1, 1, 1, 1, 1,
-0.02351196, -2.261292, -1.946758, 1, 1, 1, 1, 1,
-0.02251233, -0.8555101, -3.852649, 1, 1, 1, 1, 1,
-0.02182265, -0.1058122, -2.203861, 1, 1, 1, 1, 1,
-0.01901069, 0.4278583, -1.477803, 0, 0, 1, 1, 1,
-0.01574168, 0.1358592, -0.8105258, 1, 0, 0, 1, 1,
-0.01436932, -1.526531, -3.638431, 1, 0, 0, 1, 1,
-0.01107352, 0.9217798, -0.8695631, 1, 0, 0, 1, 1,
-0.006570915, -0.3428629, -2.767263, 1, 0, 0, 1, 1,
-0.004707739, -2.064105, -2.68155, 1, 0, 0, 1, 1,
0.001736361, 0.9498907, 0.3816808, 0, 0, 0, 1, 1,
0.001798071, -0.2540197, 3.111735, 0, 0, 0, 1, 1,
0.004018292, -0.5434316, 1.162691, 0, 0, 0, 1, 1,
0.007311057, 1.091833, 0.2081213, 0, 0, 0, 1, 1,
0.01042627, -0.9285628, 1.194484, 0, 0, 0, 1, 1,
0.0127093, -0.0189265, 2.112324, 0, 0, 0, 1, 1,
0.01359637, -0.2570529, 4.485237, 0, 0, 0, 1, 1,
0.01564154, -0.3806723, 1.813566, 1, 1, 1, 1, 1,
0.01901834, 1.37445, 0.3535707, 1, 1, 1, 1, 1,
0.02479432, 0.2374094, 1.215683, 1, 1, 1, 1, 1,
0.02524573, 2.4268, 0.7823173, 1, 1, 1, 1, 1,
0.02603769, 1.434119, -1.982975, 1, 1, 1, 1, 1,
0.03094357, -0.0923735, 4.01892, 1, 1, 1, 1, 1,
0.03480555, -1.091129, 2.188443, 1, 1, 1, 1, 1,
0.0353716, 0.38894, 0.7109973, 1, 1, 1, 1, 1,
0.03665717, 0.9816886, -1.568327, 1, 1, 1, 1, 1,
0.0374421, 0.05386799, 2.195032, 1, 1, 1, 1, 1,
0.041396, 2.097475, 1.445735, 1, 1, 1, 1, 1,
0.04195578, 1.370507, 0.7038522, 1, 1, 1, 1, 1,
0.04771508, 0.9323121, -2.321992, 1, 1, 1, 1, 1,
0.04942052, 0.5412086, 0.6838079, 1, 1, 1, 1, 1,
0.05111687, -0.3987212, 3.348205, 1, 1, 1, 1, 1,
0.0530536, 0.6097004, -0.2446631, 0, 0, 1, 1, 1,
0.05597037, 1.784236, 1.632932, 1, 0, 0, 1, 1,
0.05613983, 2.227313, 0.005751859, 1, 0, 0, 1, 1,
0.06149722, -0.08030754, 3.782396, 1, 0, 0, 1, 1,
0.06599185, 0.0163711, 1.344367, 1, 0, 0, 1, 1,
0.06818557, -1.081516, 4.787894, 1, 0, 0, 1, 1,
0.07324802, 0.4692465, 1.14681, 0, 0, 0, 1, 1,
0.07414751, 0.04147556, -0.3996132, 0, 0, 0, 1, 1,
0.07577795, -1.816523, 3.283617, 0, 0, 0, 1, 1,
0.07645857, -0.3446168, 4.025046, 0, 0, 0, 1, 1,
0.08264274, -0.7629523, 2.339568, 0, 0, 0, 1, 1,
0.09162803, -0.4002788, 3.807275, 0, 0, 0, 1, 1,
0.09710988, 0.693066, -0.9957286, 0, 0, 0, 1, 1,
0.09853286, -0.3195474, 3.317048, 1, 1, 1, 1, 1,
0.09950107, 0.6013097, 0.743463, 1, 1, 1, 1, 1,
0.1050788, 0.9150532, -1.284867, 1, 1, 1, 1, 1,
0.1069256, 0.3594122, 1.785797, 1, 1, 1, 1, 1,
0.1075995, -1.135612, 3.291472, 1, 1, 1, 1, 1,
0.1084796, 2.330349, 0.5879369, 1, 1, 1, 1, 1,
0.108554, 0.06586669, -0.5276943, 1, 1, 1, 1, 1,
0.1106233, 1.876553, 0.519255, 1, 1, 1, 1, 1,
0.11207, -0.3977163, 3.414823, 1, 1, 1, 1, 1,
0.1142531, -0.05952107, 2.089605, 1, 1, 1, 1, 1,
0.1154348, -0.01153476, 0.4090344, 1, 1, 1, 1, 1,
0.1180418, -0.9895918, 4.655114, 1, 1, 1, 1, 1,
0.119339, -0.1168299, 1.641893, 1, 1, 1, 1, 1,
0.1211223, 0.2656075, -2.329291, 1, 1, 1, 1, 1,
0.1221958, -0.3889602, 1.706785, 1, 1, 1, 1, 1,
0.1227388, 1.325844, 0.4240632, 0, 0, 1, 1, 1,
0.1233804, -1.391676, 3.83223, 1, 0, 0, 1, 1,
0.1252539, -0.1365537, 4.126525, 1, 0, 0, 1, 1,
0.1292793, -1.457167, 2.448408, 1, 0, 0, 1, 1,
0.1320655, 1.693754, 0.7613581, 1, 0, 0, 1, 1,
0.1325049, -0.8917258, 4.908816, 1, 0, 0, 1, 1,
0.1337787, -1.449878, 3.231166, 0, 0, 0, 1, 1,
0.133986, -0.1299471, 1.325587, 0, 0, 0, 1, 1,
0.1400837, -0.2430831, 1.714603, 0, 0, 0, 1, 1,
0.1416933, 0.5229281, -0.5242256, 0, 0, 0, 1, 1,
0.1439115, -0.7528819, 4.138455, 0, 0, 0, 1, 1,
0.1471642, 0.1207354, 0.3431643, 0, 0, 0, 1, 1,
0.1475147, -1.369938, 2.770901, 0, 0, 0, 1, 1,
0.1511893, 0.3186174, -1.957657, 1, 1, 1, 1, 1,
0.152182, 0.06085737, 0.3944108, 1, 1, 1, 1, 1,
0.1523479, 0.0607668, 1.837048, 1, 1, 1, 1, 1,
0.1566123, 2.25627, -0.363323, 1, 1, 1, 1, 1,
0.1608559, -0.5038586, 2.768158, 1, 1, 1, 1, 1,
0.1613994, -1.661367, 2.277827, 1, 1, 1, 1, 1,
0.1702351, 0.4232785, -0.09639804, 1, 1, 1, 1, 1,
0.1731981, -1.349764, 4.128232, 1, 1, 1, 1, 1,
0.1746565, 0.5580302, 1.319373, 1, 1, 1, 1, 1,
0.1833085, 0.4922788, -0.2330744, 1, 1, 1, 1, 1,
0.1837139, -0.1964966, 2.461493, 1, 1, 1, 1, 1,
0.1856226, -0.854516, 3.571868, 1, 1, 1, 1, 1,
0.1863014, 0.1291147, 2.077875, 1, 1, 1, 1, 1,
0.1874696, 1.000804, 0.7226386, 1, 1, 1, 1, 1,
0.1900587, 0.3407376, -0.4036418, 1, 1, 1, 1, 1,
0.1902303, -0.1291561, 1.690048, 0, 0, 1, 1, 1,
0.1909788, 0.4506661, -0.631114, 1, 0, 0, 1, 1,
0.1962056, -0.397274, 3.018324, 1, 0, 0, 1, 1,
0.1990882, -1.114698, 3.311931, 1, 0, 0, 1, 1,
0.1996132, -0.3863048, 2.01505, 1, 0, 0, 1, 1,
0.2012089, -0.4396552, 2.481657, 1, 0, 0, 1, 1,
0.2020309, 0.1416536, -0.2828897, 0, 0, 0, 1, 1,
0.2039102, -0.047163, 2.078604, 0, 0, 0, 1, 1,
0.2065964, 0.4701518, 1.000538, 0, 0, 0, 1, 1,
0.2133996, 0.2477275, -0.7176746, 0, 0, 0, 1, 1,
0.2138717, -0.03551673, 0.9478003, 0, 0, 0, 1, 1,
0.2139034, -0.06199224, 2.882776, 0, 0, 0, 1, 1,
0.2139416, -0.9008382, 2.491946, 0, 0, 0, 1, 1,
0.222898, -0.4052901, 0.6203007, 1, 1, 1, 1, 1,
0.2314228, 0.002961932, 1.955532, 1, 1, 1, 1, 1,
0.2319006, 0.6553769, 1.485932, 1, 1, 1, 1, 1,
0.2369406, 0.6663412, -0.4698255, 1, 1, 1, 1, 1,
0.2376595, 0.06263892, 3.481829, 1, 1, 1, 1, 1,
0.2383716, -0.6114731, 2.323042, 1, 1, 1, 1, 1,
0.2395126, -0.3919206, 1.539725, 1, 1, 1, 1, 1,
0.2409684, 1.966097, -0.6706099, 1, 1, 1, 1, 1,
0.2423248, -1.287274, 1.616618, 1, 1, 1, 1, 1,
0.2487132, 1.020695, -1.873622, 1, 1, 1, 1, 1,
0.2490494, 0.1704418, 0.4879175, 1, 1, 1, 1, 1,
0.2514501, -0.6661019, 2.529019, 1, 1, 1, 1, 1,
0.254193, -0.2614456, 1.946028, 1, 1, 1, 1, 1,
0.2550488, -0.7861792, 2.005228, 1, 1, 1, 1, 1,
0.2600527, 0.7507985, -0.270457, 1, 1, 1, 1, 1,
0.262776, -0.3244248, 1.572912, 0, 0, 1, 1, 1,
0.266528, 1.516266, -0.8837885, 1, 0, 0, 1, 1,
0.2669443, -0.6935987, 2.799096, 1, 0, 0, 1, 1,
0.268352, 0.2948782, 2.753735, 1, 0, 0, 1, 1,
0.2701601, 0.003338149, 2.786236, 1, 0, 0, 1, 1,
0.277654, 0.5265688, 0.8822214, 1, 0, 0, 1, 1,
0.2798295, 0.007243661, 2.887259, 0, 0, 0, 1, 1,
0.2809882, -1.509923, 3.114983, 0, 0, 0, 1, 1,
0.2834671, 1.460453, -0.920787, 0, 0, 0, 1, 1,
0.2837633, 3.86851, -1.097511, 0, 0, 0, 1, 1,
0.2849415, 0.5035265, 0.03713117, 0, 0, 0, 1, 1,
0.2857642, 0.02343108, 1.619357, 0, 0, 0, 1, 1,
0.2858486, -0.1240359, 1.657692, 0, 0, 0, 1, 1,
0.2879894, 0.2888711, 0.9745997, 1, 1, 1, 1, 1,
0.2895881, -0.5605144, 3.581738, 1, 1, 1, 1, 1,
0.2920794, 0.9874871, 1.875974, 1, 1, 1, 1, 1,
0.2934361, -0.4915074, 2.142362, 1, 1, 1, 1, 1,
0.2947994, 0.265276, 0.5162363, 1, 1, 1, 1, 1,
0.2981072, -0.9103035, 1.74966, 1, 1, 1, 1, 1,
0.3013265, -1.310201, 3.50196, 1, 1, 1, 1, 1,
0.3042569, 0.8769804, -0.8081709, 1, 1, 1, 1, 1,
0.3070233, -0.8134697, 3.153163, 1, 1, 1, 1, 1,
0.313208, -1.946578, 2.362185, 1, 1, 1, 1, 1,
0.3134159, -0.4173037, 1.331144, 1, 1, 1, 1, 1,
0.3158146, -2.094815, 3.111783, 1, 1, 1, 1, 1,
0.3165046, 0.3928123, 1.559098, 1, 1, 1, 1, 1,
0.3219435, -1.015418, 1.468196, 1, 1, 1, 1, 1,
0.3260001, 1.278085, -0.4818445, 1, 1, 1, 1, 1,
0.3271039, -0.7945571, 2.521039, 0, 0, 1, 1, 1,
0.3271145, 1.284404, 0.06999454, 1, 0, 0, 1, 1,
0.3293808, -0.466269, 2.64659, 1, 0, 0, 1, 1,
0.3363472, -0.1400203, 2.318663, 1, 0, 0, 1, 1,
0.3403105, -0.95309, 5.303411, 1, 0, 0, 1, 1,
0.3444935, 0.2725089, 0.2921566, 1, 0, 0, 1, 1,
0.344754, -0.2755674, 1.818675, 0, 0, 0, 1, 1,
0.3491386, -0.2273087, 2.286274, 0, 0, 0, 1, 1,
0.3501631, -1.426065, 2.725407, 0, 0, 0, 1, 1,
0.3510429, -1.721347, 5.40909, 0, 0, 0, 1, 1,
0.3555562, -0.3188331, 1.353483, 0, 0, 0, 1, 1,
0.357724, -0.1627811, 0.457964, 0, 0, 0, 1, 1,
0.3654005, 0.3479279, 1.099292, 0, 0, 0, 1, 1,
0.3662469, 0.09439086, 2.502521, 1, 1, 1, 1, 1,
0.3684987, 0.7656312, 0.6958554, 1, 1, 1, 1, 1,
0.3710975, -0.4188294, 3.007025, 1, 1, 1, 1, 1,
0.3730821, -1.267189, 2.660883, 1, 1, 1, 1, 1,
0.3731823, -0.03614175, 2.462817, 1, 1, 1, 1, 1,
0.3814575, -0.6048959, 3.978099, 1, 1, 1, 1, 1,
0.3820548, 0.01515215, 1.710138, 1, 1, 1, 1, 1,
0.3851775, 0.5838892, 1.214194, 1, 1, 1, 1, 1,
0.3862456, 0.1998431, 1.570474, 1, 1, 1, 1, 1,
0.3875196, 2.016153, -0.3459065, 1, 1, 1, 1, 1,
0.391083, -0.4795386, 2.481174, 1, 1, 1, 1, 1,
0.3916208, 0.747271, -0.09274403, 1, 1, 1, 1, 1,
0.3927305, -0.4507972, 3.184059, 1, 1, 1, 1, 1,
0.3928735, 0.7566625, -1.524389, 1, 1, 1, 1, 1,
0.3956159, -0.1149154, 1.966598, 1, 1, 1, 1, 1,
0.4001507, 0.1581025, 0.2180597, 0, 0, 1, 1, 1,
0.4032892, -1.075848, 2.173092, 1, 0, 0, 1, 1,
0.4069053, -0.449025, 2.141398, 1, 0, 0, 1, 1,
0.411189, 0.6011028, 1.656152, 1, 0, 0, 1, 1,
0.41219, -0.5618435, 1.827421, 1, 0, 0, 1, 1,
0.4189741, 1.037651, 1.838675, 1, 0, 0, 1, 1,
0.4195875, 0.4380997, -0.1375791, 0, 0, 0, 1, 1,
0.4274761, -1.575128, 3.635247, 0, 0, 0, 1, 1,
0.4276195, 0.6116053, -0.3226587, 0, 0, 0, 1, 1,
0.4286712, 1.425428, -0.8515227, 0, 0, 0, 1, 1,
0.434983, -0.9948991, 1.887332, 0, 0, 0, 1, 1,
0.4374898, -1.886013, 2.80087, 0, 0, 0, 1, 1,
0.4392239, 0.3876073, 0.9246124, 0, 0, 0, 1, 1,
0.4393589, -0.1452265, 1.622197, 1, 1, 1, 1, 1,
0.4393821, -1.629704, 3.181411, 1, 1, 1, 1, 1,
0.4404755, -0.6149368, 2.644751, 1, 1, 1, 1, 1,
0.4527358, 1.941924, 1.571601, 1, 1, 1, 1, 1,
0.455495, 0.9562975, -1.618831, 1, 1, 1, 1, 1,
0.4563179, -0.1888788, 1.941218, 1, 1, 1, 1, 1,
0.4596541, -1.78182, 1.591661, 1, 1, 1, 1, 1,
0.4634053, -0.1150019, 2.220645, 1, 1, 1, 1, 1,
0.4670842, -1.139914, 1.776662, 1, 1, 1, 1, 1,
0.4704973, -0.4924647, 0.08176687, 1, 1, 1, 1, 1,
0.4832934, 0.4681692, 1.928165, 1, 1, 1, 1, 1,
0.4835172, 0.285992, 0.7356643, 1, 1, 1, 1, 1,
0.4871384, -1.403004, 2.1778, 1, 1, 1, 1, 1,
0.4895437, 0.731162, 0.6922207, 1, 1, 1, 1, 1,
0.4903103, 0.8038806, -0.5697974, 1, 1, 1, 1, 1,
0.4936383, -0.823688, 2.469058, 0, 0, 1, 1, 1,
0.4938949, -0.5342484, 3.284497, 1, 0, 0, 1, 1,
0.4990398, 1.582161, 0.4193954, 1, 0, 0, 1, 1,
0.4997188, -0.7603514, 1.548687, 1, 0, 0, 1, 1,
0.5044358, -0.7406989, 2.963127, 1, 0, 0, 1, 1,
0.5076229, 0.8007935, -1.089454, 1, 0, 0, 1, 1,
0.5079594, 0.6364203, 0.6623707, 0, 0, 0, 1, 1,
0.5080056, 1.369522, 0.8438488, 0, 0, 0, 1, 1,
0.5141085, -0.3324226, 0.9855464, 0, 0, 0, 1, 1,
0.5159771, 2.151644, -0.4204546, 0, 0, 0, 1, 1,
0.5179803, -0.9378432, 0.5452488, 0, 0, 0, 1, 1,
0.5193491, -0.9777058, 3.465518, 0, 0, 0, 1, 1,
0.5226029, 1.235916, 0.09032508, 0, 0, 0, 1, 1,
0.52455, 1.460501, -0.8435391, 1, 1, 1, 1, 1,
0.5246027, -0.6707358, 3.459308, 1, 1, 1, 1, 1,
0.5248618, -0.02290813, 1.425883, 1, 1, 1, 1, 1,
0.5409334, -0.6146956, 1.201247, 1, 1, 1, 1, 1,
0.543054, 1.367725, -0.6719809, 1, 1, 1, 1, 1,
0.5461868, -1.030433, 1.933624, 1, 1, 1, 1, 1,
0.5539191, 1.560504, 0.606278, 1, 1, 1, 1, 1,
0.5571876, 0.3808067, 1.656534, 1, 1, 1, 1, 1,
0.558621, -0.8694239, 3.026281, 1, 1, 1, 1, 1,
0.5607625, 1.104784, -0.5546529, 1, 1, 1, 1, 1,
0.5672978, -1.077896, 2.98326, 1, 1, 1, 1, 1,
0.5693263, 0.4541461, 1.394713, 1, 1, 1, 1, 1,
0.5711897, -1.140842, 2.681649, 1, 1, 1, 1, 1,
0.5718635, 0.2152782, 2.535506, 1, 1, 1, 1, 1,
0.5731068, 0.3250927, -1.201864, 1, 1, 1, 1, 1,
0.5785776, -0.8768563, 3.905785, 0, 0, 1, 1, 1,
0.5869095, 2.669738, -0.2287811, 1, 0, 0, 1, 1,
0.6004252, 1.129616, -0.2988024, 1, 0, 0, 1, 1,
0.6042647, 0.4967617, 1.041134, 1, 0, 0, 1, 1,
0.6075621, -1.157565, 1.597625, 1, 0, 0, 1, 1,
0.6088595, -1.144334, 3.059267, 1, 0, 0, 1, 1,
0.6101255, 0.1420692, 1.658036, 0, 0, 0, 1, 1,
0.6111966, 0.5487988, 2.301983, 0, 0, 0, 1, 1,
0.6120256, 0.4769941, 0.7480868, 0, 0, 0, 1, 1,
0.6126697, 0.8855404, -1.027708, 0, 0, 0, 1, 1,
0.6157262, -0.2319785, 1.62252, 0, 0, 0, 1, 1,
0.6168978, -0.07070866, 3.021488, 0, 0, 0, 1, 1,
0.6184742, 0.4939055, -1.765955, 0, 0, 0, 1, 1,
0.619734, -1.245437, 2.312928, 1, 1, 1, 1, 1,
0.6199167, -0.3610755, 1.998642, 1, 1, 1, 1, 1,
0.6230171, 0.5312359, 1.803067, 1, 1, 1, 1, 1,
0.628327, 0.4616091, 1.425478, 1, 1, 1, 1, 1,
0.6311482, -0.4635915, 4.022818, 1, 1, 1, 1, 1,
0.6313967, -1.112541, 1.200822, 1, 1, 1, 1, 1,
0.6323732, -0.03252518, 2.079134, 1, 1, 1, 1, 1,
0.6328892, 0.5138636, 0.7650335, 1, 1, 1, 1, 1,
0.6351458, -0.3601961, 3.048166, 1, 1, 1, 1, 1,
0.6351753, 0.1657667, 0.2512982, 1, 1, 1, 1, 1,
0.6365342, 0.09535024, 0.2603097, 1, 1, 1, 1, 1,
0.6414195, -0.5493668, 1.885411, 1, 1, 1, 1, 1,
0.6437073, -0.01472327, 2.117428, 1, 1, 1, 1, 1,
0.645614, -0.398441, 3.544575, 1, 1, 1, 1, 1,
0.6468388, -0.2210552, 0.9225821, 1, 1, 1, 1, 1,
0.6536998, -0.1634285, 2.614312, 0, 0, 1, 1, 1,
0.6557791, 0.4730014, 2.683419, 1, 0, 0, 1, 1,
0.6578742, 0.6023485, 1.134236, 1, 0, 0, 1, 1,
0.6587489, 1.710375, 0.3938427, 1, 0, 0, 1, 1,
0.658825, -2.186003, 3.071944, 1, 0, 0, 1, 1,
0.6633922, 1.241262, 0.6627054, 1, 0, 0, 1, 1,
0.6645637, 0.5812342, 1.581572, 0, 0, 0, 1, 1,
0.6668027, -1.552621, 3.296459, 0, 0, 0, 1, 1,
0.6694639, 0.4442064, 0.02523718, 0, 0, 0, 1, 1,
0.6726503, -0.009429905, 1.87481, 0, 0, 0, 1, 1,
0.6765024, 0.2093949, 1.157716, 0, 0, 0, 1, 1,
0.6798372, 0.02202264, -0.6774492, 0, 0, 0, 1, 1,
0.6799724, 0.5285253, 1.086529, 0, 0, 0, 1, 1,
0.6844147, -1.277579, 1.849737, 1, 1, 1, 1, 1,
0.686518, -0.290703, 1.503146, 1, 1, 1, 1, 1,
0.6877185, -0.6535982, 4.427578, 1, 1, 1, 1, 1,
0.6986804, 0.8627908, 2.127984, 1, 1, 1, 1, 1,
0.6994082, -0.8750581, 4.569843, 1, 1, 1, 1, 1,
0.7022073, -0.4789727, 1.819524, 1, 1, 1, 1, 1,
0.7032245, 0.4186424, 3.291175, 1, 1, 1, 1, 1,
0.7138001, -1.367453, 2.605935, 1, 1, 1, 1, 1,
0.7140863, -0.07472143, 1.450283, 1, 1, 1, 1, 1,
0.7154374, 0.7937433, -0.3710287, 1, 1, 1, 1, 1,
0.7162598, 1.004915, 0.02003271, 1, 1, 1, 1, 1,
0.7300094, 0.9312761, -0.03652161, 1, 1, 1, 1, 1,
0.7301558, -0.5369822, 1.902779, 1, 1, 1, 1, 1,
0.7321056, -1.119518, 1.811433, 1, 1, 1, 1, 1,
0.7376738, -0.4872536, 2.132711, 1, 1, 1, 1, 1,
0.7389609, 0.1656379, 2.272283, 0, 0, 1, 1, 1,
0.7427298, 0.2578443, 1.193277, 1, 0, 0, 1, 1,
0.7448145, -0.2559294, 2.408909, 1, 0, 0, 1, 1,
0.7666237, 0.2069998, 2.872925, 1, 0, 0, 1, 1,
0.7807364, -0.5578716, 3.043892, 1, 0, 0, 1, 1,
0.7930288, 0.1298987, 2.264913, 1, 0, 0, 1, 1,
0.7932773, 0.7741433, 1.106505, 0, 0, 0, 1, 1,
0.797522, -0.6534917, 1.775859, 0, 0, 0, 1, 1,
0.8033047, -0.2792408, 3.004458, 0, 0, 0, 1, 1,
0.8102134, -1.376886, 2.625651, 0, 0, 0, 1, 1,
0.817347, -0.767433, 3.403923, 0, 0, 0, 1, 1,
0.8179805, 0.09118091, 0.3002211, 0, 0, 0, 1, 1,
0.8183669, -1.479494, 1.597877, 0, 0, 0, 1, 1,
0.8210195, -0.967703, 0.8583304, 1, 1, 1, 1, 1,
0.8239664, -0.961033, 1.657394, 1, 1, 1, 1, 1,
0.8249229, 1.641103, -0.07348254, 1, 1, 1, 1, 1,
0.8252853, -1.273252, 3.288464, 1, 1, 1, 1, 1,
0.8265634, -1.88719, 3.296722, 1, 1, 1, 1, 1,
0.8266908, 1.65985, 0.8761241, 1, 1, 1, 1, 1,
0.827395, -1.474035, 3.131857, 1, 1, 1, 1, 1,
0.8282179, -0.3869016, 3.83231, 1, 1, 1, 1, 1,
0.8321152, -0.2370705, 1.016019, 1, 1, 1, 1, 1,
0.8366514, -0.8901795, 2.219199, 1, 1, 1, 1, 1,
0.8385006, 1.227959, 0.2069786, 1, 1, 1, 1, 1,
0.842513, 0.3226009, -0.03183204, 1, 1, 1, 1, 1,
0.8432339, 1.340586, 0.8143287, 1, 1, 1, 1, 1,
0.843621, -0.1554597, 2.977162, 1, 1, 1, 1, 1,
0.8501274, -0.9394204, 2.351433, 1, 1, 1, 1, 1,
0.8548136, -1.95723, 2.127521, 0, 0, 1, 1, 1,
0.8580853, -0.5458859, 3.836884, 1, 0, 0, 1, 1,
0.8598154, 0.01808175, 2.664835, 1, 0, 0, 1, 1,
0.8660405, 1.657681, 1.088206, 1, 0, 0, 1, 1,
0.8664929, -0.2214236, 2.838378, 1, 0, 0, 1, 1,
0.8805888, 1.032334, 0.6500056, 1, 0, 0, 1, 1,
0.8805952, -0.2928464, -0.7963507, 0, 0, 0, 1, 1,
0.884885, 0.8955469, 0.7271698, 0, 0, 0, 1, 1,
0.8887486, -1.552576, 2.883303, 0, 0, 0, 1, 1,
0.8907212, 0.6304671, 1.283049, 0, 0, 0, 1, 1,
0.8999623, -0.2563606, 0.2771278, 0, 0, 0, 1, 1,
0.9003084, -0.06363749, 0.04279538, 0, 0, 0, 1, 1,
0.9042418, -1.30266, 4.336925, 0, 0, 0, 1, 1,
0.9056733, 0.02742923, 3.08598, 1, 1, 1, 1, 1,
0.9058651, 0.7968617, -0.1080089, 1, 1, 1, 1, 1,
0.9077271, 0.2142722, 2.22009, 1, 1, 1, 1, 1,
0.9091157, 1.313123, -0.5066208, 1, 1, 1, 1, 1,
0.9110256, 0.6360235, 1.573534, 1, 1, 1, 1, 1,
0.9120365, -1.139698, 4.140332, 1, 1, 1, 1, 1,
0.9142486, -0.6340138, 3.380997, 1, 1, 1, 1, 1,
0.9292333, 0.0822366, 2.806807, 1, 1, 1, 1, 1,
0.9296343, -0.768927, 2.820155, 1, 1, 1, 1, 1,
0.9313888, 0.5182517, 0.8265281, 1, 1, 1, 1, 1,
0.9328588, -0.9634897, 2.197758, 1, 1, 1, 1, 1,
0.9341673, -1.831985, 1.619683, 1, 1, 1, 1, 1,
0.9347117, 1.430159, 1.690768, 1, 1, 1, 1, 1,
0.9352056, -0.005369166, 1.974252, 1, 1, 1, 1, 1,
0.9400197, 0.3090181, 3.190337, 1, 1, 1, 1, 1,
0.9445819, -1.703118, 3.040503, 0, 0, 1, 1, 1,
0.9450439, -0.0432287, 1.537928, 1, 0, 0, 1, 1,
0.9460235, -0.7911209, 0.4603039, 1, 0, 0, 1, 1,
0.9460256, 1.307932, 0.01274882, 1, 0, 0, 1, 1,
0.9486062, 0.7230293, 1.171627, 1, 0, 0, 1, 1,
0.9527313, 0.8387542, 0.3686028, 1, 0, 0, 1, 1,
0.9600851, 0.6304445, 1.536322, 0, 0, 0, 1, 1,
0.9603501, 1.523065, 1.19338, 0, 0, 0, 1, 1,
0.9618037, 0.04280992, 1.763122, 0, 0, 0, 1, 1,
0.9669331, 0.7409576, 0.08987072, 0, 0, 0, 1, 1,
0.968922, -1.055477, 1.673637, 0, 0, 0, 1, 1,
0.9727416, -0.2418608, 1.782622, 0, 0, 0, 1, 1,
0.9736148, -0.9493886, 2.143051, 0, 0, 0, 1, 1,
0.9762103, 0.9065254, -2.403209, 1, 1, 1, 1, 1,
0.977125, -1.355767, 1.742718, 1, 1, 1, 1, 1,
0.9774162, 0.4547316, 2.829941, 1, 1, 1, 1, 1,
0.9778727, 0.05958623, 0.4893555, 1, 1, 1, 1, 1,
0.9820531, 0.3635842, 1.135876, 1, 1, 1, 1, 1,
0.9821702, -0.07365047, 1.372066, 1, 1, 1, 1, 1,
0.9842989, 1.018914, 1.607541, 1, 1, 1, 1, 1,
0.9868508, 0.3058966, 1.160307, 1, 1, 1, 1, 1,
0.9882958, -1.444401, 3.328872, 1, 1, 1, 1, 1,
0.9897138, -0.1458607, 2.590218, 1, 1, 1, 1, 1,
0.9947205, -0.5746965, 2.964545, 1, 1, 1, 1, 1,
0.9956827, 0.476895, 1.404991, 1, 1, 1, 1, 1,
1.005973, -0.3741175, 0.3618827, 1, 1, 1, 1, 1,
1.009629, -0.1257942, 1.619723, 1, 1, 1, 1, 1,
1.012563, 0.7668698, 1.040572, 1, 1, 1, 1, 1,
1.015122, 1.386428, 1.663104, 0, 0, 1, 1, 1,
1.02008, 0.4786395, 2.489669, 1, 0, 0, 1, 1,
1.028849, 1.167877, 1.415611, 1, 0, 0, 1, 1,
1.031961, 0.9483658, 1.159381, 1, 0, 0, 1, 1,
1.036712, 0.3458704, 1.875759, 1, 0, 0, 1, 1,
1.038641, -1.009884, 1.786366, 1, 0, 0, 1, 1,
1.040604, -0.815956, 3.140486, 0, 0, 0, 1, 1,
1.058208, 0.7239632, 2.386596, 0, 0, 0, 1, 1,
1.063512, 1.136938, 0.2578835, 0, 0, 0, 1, 1,
1.073053, 0.4902906, 0.4045205, 0, 0, 0, 1, 1,
1.075878, 0.7458777, 1.588017, 0, 0, 0, 1, 1,
1.079648, -1.344506, 3.298413, 0, 0, 0, 1, 1,
1.081741, -0.6989369, 2.279698, 0, 0, 0, 1, 1,
1.086333, -0.2862092, 1.539853, 1, 1, 1, 1, 1,
1.088244, 0.04047483, 1.383853, 1, 1, 1, 1, 1,
1.09323, -0.02855691, 2.69512, 1, 1, 1, 1, 1,
1.094858, 1.630065, -0.171708, 1, 1, 1, 1, 1,
1.106111, -1.360913, 2.196997, 1, 1, 1, 1, 1,
1.106269, 1.010404, 1.489982, 1, 1, 1, 1, 1,
1.107322, -0.5232075, 2.285245, 1, 1, 1, 1, 1,
1.114144, 1.744172, 0.3381989, 1, 1, 1, 1, 1,
1.11494, 1.010362, -0.9529629, 1, 1, 1, 1, 1,
1.120228, -0.9830716, 1.973274, 1, 1, 1, 1, 1,
1.12092, -2.890759, 1.623572, 1, 1, 1, 1, 1,
1.123892, 0.235878, -0.707404, 1, 1, 1, 1, 1,
1.124091, -0.7272821, 2.540766, 1, 1, 1, 1, 1,
1.12811, 1.420751, -0.4055537, 1, 1, 1, 1, 1,
1.137182, 0.1098107, -0.633746, 1, 1, 1, 1, 1,
1.145596, 0.5700627, 0.8531174, 0, 0, 1, 1, 1,
1.14853, 1.511246, -2.194735, 1, 0, 0, 1, 1,
1.1529, -0.5434474, 1.919204, 1, 0, 0, 1, 1,
1.154741, 1.032526, 0.6035997, 1, 0, 0, 1, 1,
1.159808, -0.9895004, 3.059284, 1, 0, 0, 1, 1,
1.169898, 0.2911198, 0.8963383, 1, 0, 0, 1, 1,
1.170046, -0.9391277, 3.080498, 0, 0, 0, 1, 1,
1.176925, 0.05352156, 2.877037, 0, 0, 0, 1, 1,
1.183651, -0.424505, 2.354259, 0, 0, 0, 1, 1,
1.209116, 0.0259067, 2.801663, 0, 0, 0, 1, 1,
1.210378, 0.5688506, 1.520517, 0, 0, 0, 1, 1,
1.222666, 0.1146328, -0.006274217, 0, 0, 0, 1, 1,
1.224737, -0.9553555, 1.231158, 0, 0, 0, 1, 1,
1.232677, 1.088606, -1.020982, 1, 1, 1, 1, 1,
1.244131, 0.8124755, 1.352307, 1, 1, 1, 1, 1,
1.26195, 0.1833007, 0.8688607, 1, 1, 1, 1, 1,
1.262542, 0.2096351, 1.84821, 1, 1, 1, 1, 1,
1.26445, 1.26233, 1.127226, 1, 1, 1, 1, 1,
1.268999, 1.377204, 1.272441, 1, 1, 1, 1, 1,
1.277327, 0.9894068, -0.04678319, 1, 1, 1, 1, 1,
1.278462, 0.2238274, 0.08777497, 1, 1, 1, 1, 1,
1.282699, -0.9362756, 2.150761, 1, 1, 1, 1, 1,
1.296626, 0.1798743, 2.196027, 1, 1, 1, 1, 1,
1.300173, -0.6541119, 1.509951, 1, 1, 1, 1, 1,
1.305484, 0.761579, 2.813397, 1, 1, 1, 1, 1,
1.306344, 1.851826, 1.092894, 1, 1, 1, 1, 1,
1.311706, -1.055933, 3.976716, 1, 1, 1, 1, 1,
1.32914, -1.092083, 4.859412, 1, 1, 1, 1, 1,
1.34006, -2.44356, 1.963905, 0, 0, 1, 1, 1,
1.346015, 0.3740067, -1.2579, 1, 0, 0, 1, 1,
1.35231, 0.1461485, 1.055144, 1, 0, 0, 1, 1,
1.355397, -0.2487107, 1.459187, 1, 0, 0, 1, 1,
1.355543, -0.5957767, 2.915377, 1, 0, 0, 1, 1,
1.37287, 1.350055, 0.8684223, 1, 0, 0, 1, 1,
1.37388, 0.1734371, 1.300821, 0, 0, 0, 1, 1,
1.375038, -3.196146, 2.886474, 0, 0, 0, 1, 1,
1.390096, 0.3014939, 0.9849468, 0, 0, 0, 1, 1,
1.392364, -0.3573008, 0.5654562, 0, 0, 0, 1, 1,
1.398653, 1.623888, -0.08344159, 0, 0, 0, 1, 1,
1.418814, -0.8378727, 2.263297, 0, 0, 0, 1, 1,
1.431617, -0.9905625, 0.3786749, 0, 0, 0, 1, 1,
1.432512, -1.37547, 3.395327, 1, 1, 1, 1, 1,
1.443512, 0.4327352, 0.5404927, 1, 1, 1, 1, 1,
1.444544, 0.1679726, 0.5254382, 1, 1, 1, 1, 1,
1.450015, 1.038376, 2.652889, 1, 1, 1, 1, 1,
1.451326, -0.630859, 2.117625, 1, 1, 1, 1, 1,
1.459867, 0.2962943, 0.08138372, 1, 1, 1, 1, 1,
1.460042, 0.1594751, 2.159435, 1, 1, 1, 1, 1,
1.460856, 0.6905843, 1.925423, 1, 1, 1, 1, 1,
1.463882, -0.6050515, 1.757835, 1, 1, 1, 1, 1,
1.468246, -2.22006, 2.232761, 1, 1, 1, 1, 1,
1.46946, 2.464027, 1.026386, 1, 1, 1, 1, 1,
1.474552, 1.241445, 1.637115, 1, 1, 1, 1, 1,
1.476042, -0.9348201, 2.004677, 1, 1, 1, 1, 1,
1.481048, 0.1813128, -0.2017818, 1, 1, 1, 1, 1,
1.489921, 1.19503, 1.529661, 1, 1, 1, 1, 1,
1.495308, -1.014261, 3.524024, 0, 0, 1, 1, 1,
1.499768, 0.8131572, 1.219629, 1, 0, 0, 1, 1,
1.509162, -1.648408, 3.066039, 1, 0, 0, 1, 1,
1.509428, 0.2293118, 1.854756, 1, 0, 0, 1, 1,
1.519027, -0.4447774, 2.27046, 1, 0, 0, 1, 1,
1.520956, -0.3340494, 2.393597, 1, 0, 0, 1, 1,
1.524259, 1.332863, 0.8388809, 0, 0, 0, 1, 1,
1.536849, 1.627454, 0.2267086, 0, 0, 0, 1, 1,
1.541116, -0.006379728, -0.2281863, 0, 0, 0, 1, 1,
1.542414, 0.9058318, 1.366311, 0, 0, 0, 1, 1,
1.543974, -0.2779712, 1.256211, 0, 0, 0, 1, 1,
1.551077, -0.3906095, 1.183335, 0, 0, 0, 1, 1,
1.553556, -0.5409813, -1.514341, 0, 0, 0, 1, 1,
1.555218, -0.004687324, 1.19447, 1, 1, 1, 1, 1,
1.56724, -0.1999125, 1.616115, 1, 1, 1, 1, 1,
1.573356, -0.5441118, 1.877051, 1, 1, 1, 1, 1,
1.59576, 1.713333, -0.7767413, 1, 1, 1, 1, 1,
1.611841, 0.2474635, -0.1749662, 1, 1, 1, 1, 1,
1.621964, -0.1673819, 0.6693105, 1, 1, 1, 1, 1,
1.622946, -0.4691918, 2.073966, 1, 1, 1, 1, 1,
1.635373, 0.002694424, 2.371058, 1, 1, 1, 1, 1,
1.643442, -0.2430867, 2.037533, 1, 1, 1, 1, 1,
1.64541, -0.2153428, 2.842088, 1, 1, 1, 1, 1,
1.650154, -0.4015021, 3.267139, 1, 1, 1, 1, 1,
1.650263, -0.1707916, 2.267852, 1, 1, 1, 1, 1,
1.651109, 1.393852, -0.10233, 1, 1, 1, 1, 1,
1.668364, 0.4206346, 1.653999, 1, 1, 1, 1, 1,
1.683809, -1.376491, 3.830666, 1, 1, 1, 1, 1,
1.683811, -0.2128779, 2.264633, 0, 0, 1, 1, 1,
1.690638, 1.952785, 0.6826409, 1, 0, 0, 1, 1,
1.706234, -1.676261, 2.438097, 1, 0, 0, 1, 1,
1.715407, -0.2103305, 1.28429, 1, 0, 0, 1, 1,
1.741739, 1.023541, -0.2865812, 1, 0, 0, 1, 1,
1.756415, -0.6139547, 2.357597, 1, 0, 0, 1, 1,
1.797222, -1.508137, 0.5429929, 0, 0, 0, 1, 1,
1.801092, 0.5114067, 0.6392551, 0, 0, 0, 1, 1,
1.803263, -0.6828519, 3.192705, 0, 0, 0, 1, 1,
1.830543, -0.2639679, 2.114359, 0, 0, 0, 1, 1,
1.830879, -0.8018876, 0.7394682, 0, 0, 0, 1, 1,
1.840541, -2.089618, 2.716243, 0, 0, 0, 1, 1,
1.854299, -0.6400166, 1.717895, 0, 0, 0, 1, 1,
1.865573, 0.5776139, 1.474157, 1, 1, 1, 1, 1,
1.875757, 0.05549373, 2.136823, 1, 1, 1, 1, 1,
1.878267, -0.247425, 2.288718, 1, 1, 1, 1, 1,
1.885773, 0.2950948, 2.242766, 1, 1, 1, 1, 1,
1.899302, -0.6731256, 2.200576, 1, 1, 1, 1, 1,
1.931824, 0.1151698, 2.395643, 1, 1, 1, 1, 1,
1.936831, 0.03297554, 0.6942762, 1, 1, 1, 1, 1,
1.967871, -1.175604, 3.301517, 1, 1, 1, 1, 1,
1.98752, 2.652844, -0.1654609, 1, 1, 1, 1, 1,
1.988885, 0.001834215, 2.143972, 1, 1, 1, 1, 1,
2.002625, -2.164631, 2.154711, 1, 1, 1, 1, 1,
2.015698, -0.06251676, 1.237424, 1, 1, 1, 1, 1,
2.046448, 0.1646818, 3.716749, 1, 1, 1, 1, 1,
2.049078, 0.6868447, 0.2897301, 1, 1, 1, 1, 1,
2.08928, 0.3507099, 0.2233042, 1, 1, 1, 1, 1,
2.106031, 0.4274691, 2.059099, 0, 0, 1, 1, 1,
2.119619, 1.040963, 2.562312, 1, 0, 0, 1, 1,
2.13923, -2.174631, 2.353894, 1, 0, 0, 1, 1,
2.164396, 0.2496732, 1.242033, 1, 0, 0, 1, 1,
2.170198, -1.144799, 3.90228, 1, 0, 0, 1, 1,
2.191391, 1.068075, 3.164176, 1, 0, 0, 1, 1,
2.239708, -0.1213057, 3.412405, 0, 0, 0, 1, 1,
2.279179, -0.03106401, 2.612364, 0, 0, 0, 1, 1,
2.282566, -0.1330086, 0.8394742, 0, 0, 0, 1, 1,
2.339243, 0.3862747, 0.8892123, 0, 0, 0, 1, 1,
2.444979, 0.5573472, 1.558192, 0, 0, 0, 1, 1,
2.525983, -0.8442576, 4.125362, 0, 0, 0, 1, 1,
2.648025, 0.5439706, 1.745271, 0, 0, 0, 1, 1,
2.727782, -0.6355217, 0.9768742, 1, 1, 1, 1, 1,
2.752478, 0.006427503, 3.002544, 1, 1, 1, 1, 1,
2.761579, 1.06988, 3.519331, 1, 1, 1, 1, 1,
2.838389, 1.463561, 0.3306692, 1, 1, 1, 1, 1,
2.947356, -0.6851422, 1.856957, 1, 1, 1, 1, 1,
2.952329, -0.924811, 1.692296, 1, 1, 1, 1, 1,
3.059395, 0.9277197, 1.69506, 1, 1, 1, 1, 1
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
var radius = 9.871392;
var distance = 34.67284;
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
mvMatrix.translate( -0.06478548, -0.3361814, 0.2266953 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.67284);
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