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
-3.3658, 0.5961097, -2.425925, 1, 0, 0, 1,
-2.822113, -0.7314476, -1.683257, 1, 0.007843138, 0, 1,
-2.742648, 0.9378279, -1.938621, 1, 0.01176471, 0, 1,
-2.610679, -1.236581, -0.5251699, 1, 0.01960784, 0, 1,
-2.474252, -0.203454, -2.135648, 1, 0.02352941, 0, 1,
-2.464809, 0.3247589, 0.4605876, 1, 0.03137255, 0, 1,
-2.446404, -0.7259871, -4.250793, 1, 0.03529412, 0, 1,
-2.370679, 0.3962154, -0.7598844, 1, 0.04313726, 0, 1,
-2.369397, -0.2938792, -2.494495, 1, 0.04705882, 0, 1,
-2.335012, 1.525498, -1.092167, 1, 0.05490196, 0, 1,
-2.308895, -0.8534144, -3.327722, 1, 0.05882353, 0, 1,
-2.278597, 0.7056434, -2.112615, 1, 0.06666667, 0, 1,
-2.277045, 0.197596, -1.679029, 1, 0.07058824, 0, 1,
-2.212566, -1.078441, -4.027788, 1, 0.07843138, 0, 1,
-2.178555, 0.1623098, -1.902287, 1, 0.08235294, 0, 1,
-2.177709, -1.187412, -1.402254, 1, 0.09019608, 0, 1,
-2.161438, 0.5537152, 0.5023357, 1, 0.09411765, 0, 1,
-2.150272, -0.738133, 0.1192436, 1, 0.1019608, 0, 1,
-2.148052, 0.174961, -1.95473, 1, 0.1098039, 0, 1,
-2.144275, -0.007243912, -2.043765, 1, 0.1137255, 0, 1,
-2.125686, 0.5197083, -1.439899, 1, 0.1215686, 0, 1,
-2.116441, -0.5074646, -2.113736, 1, 0.1254902, 0, 1,
-2.103911, 0.943376, -0.3413173, 1, 0.1333333, 0, 1,
-2.093503, -0.1636979, -0.3058959, 1, 0.1372549, 0, 1,
-2.071546, -0.7448909, -2.301752, 1, 0.145098, 0, 1,
-2.061105, 0.7611918, -1.559673, 1, 0.1490196, 0, 1,
-2.020156, 0.05002393, -3.150748, 1, 0.1568628, 0, 1,
-2.009423, -0.2921733, -2.947549, 1, 0.1607843, 0, 1,
-1.975338, -0.5855179, -0.9542685, 1, 0.1686275, 0, 1,
-1.960802, 0.918232, -1.010945, 1, 0.172549, 0, 1,
-1.946845, 1.019285, -0.3699672, 1, 0.1803922, 0, 1,
-1.942893, 0.6232228, -0.274562, 1, 0.1843137, 0, 1,
-1.933546, 0.7736843, -2.175368, 1, 0.1921569, 0, 1,
-1.931138, -1.613595, -0.218168, 1, 0.1960784, 0, 1,
-1.912424, -1.279695, -2.332354, 1, 0.2039216, 0, 1,
-1.910245, 1.976001, -0.4021325, 1, 0.2117647, 0, 1,
-1.885605, -0.3698656, -2.715219, 1, 0.2156863, 0, 1,
-1.881845, 0.4093693, -1.555973, 1, 0.2235294, 0, 1,
-1.87205, -1.9547, -2.105858, 1, 0.227451, 0, 1,
-1.861085, -0.1868971, -0.04727087, 1, 0.2352941, 0, 1,
-1.848477, -1.390127, -3.26098, 1, 0.2392157, 0, 1,
-1.836564, -0.1951505, 0.4325878, 1, 0.2470588, 0, 1,
-1.763596, 1.486896, -2.060166, 1, 0.2509804, 0, 1,
-1.755596, -1.606858, -2.440376, 1, 0.2588235, 0, 1,
-1.743661, 2.211967, -2.5897, 1, 0.2627451, 0, 1,
-1.740684, 0.2572722, -3.958182, 1, 0.2705882, 0, 1,
-1.729871, -2.119064, -2.705558, 1, 0.2745098, 0, 1,
-1.720643, 0.776774, -1.411567, 1, 0.282353, 0, 1,
-1.717776, -1.002891, -1.720465, 1, 0.2862745, 0, 1,
-1.717713, -0.1145548, -0.3252041, 1, 0.2941177, 0, 1,
-1.71471, -0.1730541, -1.181396, 1, 0.3019608, 0, 1,
-1.709093, -0.5434704, -1.626573, 1, 0.3058824, 0, 1,
-1.692181, 0.2797869, -3.80545, 1, 0.3137255, 0, 1,
-1.687767, -0.8896997, -2.714574, 1, 0.3176471, 0, 1,
-1.677084, 0.2546609, -2.396503, 1, 0.3254902, 0, 1,
-1.67353, -1.647456, -2.428433, 1, 0.3294118, 0, 1,
-1.66949, 0.4019918, -1.153212, 1, 0.3372549, 0, 1,
-1.66251, 1.11501, 0.1221653, 1, 0.3411765, 0, 1,
-1.659877, -0.6701965, -0.5027629, 1, 0.3490196, 0, 1,
-1.646193, -0.2059006, -3.015235, 1, 0.3529412, 0, 1,
-1.643921, 0.4469069, -1.537231, 1, 0.3607843, 0, 1,
-1.641219, -0.3975942, -2.888562, 1, 0.3647059, 0, 1,
-1.63959, 1.593232, -0.4974157, 1, 0.372549, 0, 1,
-1.631126, 0.5495118, -0.2736618, 1, 0.3764706, 0, 1,
-1.610484, -0.5406922, -1.110064, 1, 0.3843137, 0, 1,
-1.608799, 1.048516, -0.9142125, 1, 0.3882353, 0, 1,
-1.603044, -0.4400187, -2.411615, 1, 0.3960784, 0, 1,
-1.593054, -0.4177675, -3.45515, 1, 0.4039216, 0, 1,
-1.591739, -0.4180206, -1.433974, 1, 0.4078431, 0, 1,
-1.584937, -0.2570179, -1.728208, 1, 0.4156863, 0, 1,
-1.584454, 0.9730971, -1.685009, 1, 0.4196078, 0, 1,
-1.567371, 1.680068, -0.3987103, 1, 0.427451, 0, 1,
-1.545952, 0.4406787, -3.66428, 1, 0.4313726, 0, 1,
-1.542636, 1.285398, -1.374186, 1, 0.4392157, 0, 1,
-1.529641, 0.7735058, -1.329776, 1, 0.4431373, 0, 1,
-1.514392, -0.5250868, -2.79504, 1, 0.4509804, 0, 1,
-1.501276, 0.9628847, -0.3612096, 1, 0.454902, 0, 1,
-1.500575, 0.8768814, -1.903924, 1, 0.4627451, 0, 1,
-1.497211, 1.498749, 1.472014, 1, 0.4666667, 0, 1,
-1.472509, 0.6321383, -1.036311, 1, 0.4745098, 0, 1,
-1.467725, 1.089575, 0.4963079, 1, 0.4784314, 0, 1,
-1.46468, -0.8689776, -2.107177, 1, 0.4862745, 0, 1,
-1.464284, 0.02953605, -1.27913, 1, 0.4901961, 0, 1,
-1.45993, -0.5900441, -3.645336, 1, 0.4980392, 0, 1,
-1.455366, -1.297808, -3.118042, 1, 0.5058824, 0, 1,
-1.442503, 2.16557, -1.241852, 1, 0.509804, 0, 1,
-1.429221, -0.1430812, -0.8033774, 1, 0.5176471, 0, 1,
-1.427665, -0.8309529, -2.531988, 1, 0.5215687, 0, 1,
-1.421373, -0.1383529, -1.33775, 1, 0.5294118, 0, 1,
-1.419807, 1.197218, -0.1042822, 1, 0.5333334, 0, 1,
-1.401337, -0.6821708, -0.2831879, 1, 0.5411765, 0, 1,
-1.388087, -0.01978465, -1.709332, 1, 0.5450981, 0, 1,
-1.373543, -0.7901061, -3.154509, 1, 0.5529412, 0, 1,
-1.365859, -0.401117, -1.34985, 1, 0.5568628, 0, 1,
-1.355142, 1.569784, -0.1471394, 1, 0.5647059, 0, 1,
-1.350614, -0.3727038, -3.935506, 1, 0.5686275, 0, 1,
-1.333931, 0.5612625, -1.309314, 1, 0.5764706, 0, 1,
-1.329867, 0.5407704, -2.331052, 1, 0.5803922, 0, 1,
-1.327378, 0.8637397, -0.2122112, 1, 0.5882353, 0, 1,
-1.325694, 0.6511272, -0.1670425, 1, 0.5921569, 0, 1,
-1.32313, -1.031237, -2.832328, 1, 0.6, 0, 1,
-1.309749, -0.05955382, -2.300138, 1, 0.6078432, 0, 1,
-1.308981, 0.8939592, -1.186777, 1, 0.6117647, 0, 1,
-1.29232, 1.170256, 0.7218038, 1, 0.6196079, 0, 1,
-1.282976, -0.46927, -1.931731, 1, 0.6235294, 0, 1,
-1.282084, 3.819473, -1.030367, 1, 0.6313726, 0, 1,
-1.281658, 0.9692322, -2.452307, 1, 0.6352941, 0, 1,
-1.28132, -0.8026217, -1.455403, 1, 0.6431373, 0, 1,
-1.279151, 0.5467989, -1.05748, 1, 0.6470588, 0, 1,
-1.271529, -0.587793, -2.453235, 1, 0.654902, 0, 1,
-1.264271, -1.226302, -3.035451, 1, 0.6588235, 0, 1,
-1.255637, -1.370417, -1.999349, 1, 0.6666667, 0, 1,
-1.249748, 0.4608741, 0.251595, 1, 0.6705883, 0, 1,
-1.245852, -1.188917, -1.375036, 1, 0.6784314, 0, 1,
-1.236006, 0.6318407, -0.6525031, 1, 0.682353, 0, 1,
-1.227468, -0.4201064, -2.270647, 1, 0.6901961, 0, 1,
-1.221583, 0.5637873, -0.6802452, 1, 0.6941177, 0, 1,
-1.221516, -1.021209, -3.087071, 1, 0.7019608, 0, 1,
-1.219638, 1.623301, -0.3477244, 1, 0.7098039, 0, 1,
-1.218967, 1.265185, -0.3013358, 1, 0.7137255, 0, 1,
-1.216035, -0.9371437, -0.7675703, 1, 0.7215686, 0, 1,
-1.209265, 0.4232729, -1.373193, 1, 0.7254902, 0, 1,
-1.190285, 0.7463015, -0.9254031, 1, 0.7333333, 0, 1,
-1.18717, 0.2806314, -1.517394, 1, 0.7372549, 0, 1,
-1.186735, -0.9615302, -1.71097, 1, 0.7450981, 0, 1,
-1.185982, -0.625773, -0.07135585, 1, 0.7490196, 0, 1,
-1.184127, 0.7045942, 0.4580399, 1, 0.7568628, 0, 1,
-1.182637, -0.06992912, -1.573098, 1, 0.7607843, 0, 1,
-1.177113, 1.758164, 0.7374014, 1, 0.7686275, 0, 1,
-1.173004, -0.1672251, -0.741401, 1, 0.772549, 0, 1,
-1.169637, -1.187284, -2.173422, 1, 0.7803922, 0, 1,
-1.165702, -0.2205041, -2.677567, 1, 0.7843137, 0, 1,
-1.159951, -1.586314, -4.140522, 1, 0.7921569, 0, 1,
-1.1559, -0.4478576, -4.233808, 1, 0.7960784, 0, 1,
-1.149599, 0.522839, -1.75081, 1, 0.8039216, 0, 1,
-1.142318, 1.746068, -0.07495007, 1, 0.8117647, 0, 1,
-1.136874, 0.3368872, -1.601323, 1, 0.8156863, 0, 1,
-1.135992, 1.254827, 0.1254506, 1, 0.8235294, 0, 1,
-1.134529, 0.6017218, -2.05472, 1, 0.827451, 0, 1,
-1.132275, -0.1975167, -2.224654, 1, 0.8352941, 0, 1,
-1.120451, 0.8479114, 0.4699864, 1, 0.8392157, 0, 1,
-1.120234, 0.9895843, 0.3966376, 1, 0.8470588, 0, 1,
-1.119192, 0.1864363, -0.6173474, 1, 0.8509804, 0, 1,
-1.116835, 0.4112206, -2.64409, 1, 0.8588235, 0, 1,
-1.102565, 0.7676114, -0.4241808, 1, 0.8627451, 0, 1,
-1.099883, -1.152427, -3.723852, 1, 0.8705882, 0, 1,
-1.088022, -1.190081, -1.959751, 1, 0.8745098, 0, 1,
-1.07742, 0.215142, -0.1925094, 1, 0.8823529, 0, 1,
-1.073161, 1.080701, -0.833329, 1, 0.8862745, 0, 1,
-1.072204, 0.8583931, -2.013542, 1, 0.8941177, 0, 1,
-1.06969, -0.2990199, -1.909144, 1, 0.8980392, 0, 1,
-1.069241, -0.0224961, 0.6704206, 1, 0.9058824, 0, 1,
-1.067773, 2.021382, 0.4572343, 1, 0.9137255, 0, 1,
-1.066167, -0.1591563, -2.681668, 1, 0.9176471, 0, 1,
-1.065816, 0.2188715, -2.037354, 1, 0.9254902, 0, 1,
-1.060959, -0.07521681, -1.60492, 1, 0.9294118, 0, 1,
-1.059757, 1.720812, -2.09197, 1, 0.9372549, 0, 1,
-1.039309, 0.2712649, -1.896685, 1, 0.9411765, 0, 1,
-1.034097, -1.559536, -2.714734, 1, 0.9490196, 0, 1,
-1.029509, 1.013938, -0.3787974, 1, 0.9529412, 0, 1,
-1.027645, 0.2142334, -0.6372169, 1, 0.9607843, 0, 1,
-1.024593, -0.348137, -1.773835, 1, 0.9647059, 0, 1,
-1.013923, -0.3029092, -1.321567, 1, 0.972549, 0, 1,
-1.01018, 0.4572547, -0.8344205, 1, 0.9764706, 0, 1,
-1.006982, -1.015141, -1.044136, 1, 0.9843137, 0, 1,
-1.006946, -1.43038, -3.571164, 1, 0.9882353, 0, 1,
-1.000629, 0.5661782, -1.30773, 1, 0.9960784, 0, 1,
-1.000373, -0.4412065, -1.36269, 0.9960784, 1, 0, 1,
-0.9998911, 0.6594828, -1.411804, 0.9921569, 1, 0, 1,
-0.9946266, -0.4943378, -1.143826, 0.9843137, 1, 0, 1,
-0.9906279, -0.1036236, -1.263902, 0.9803922, 1, 0, 1,
-0.9855012, 0.3919895, -1.767746, 0.972549, 1, 0, 1,
-0.9849436, 1.503332, -0.9727124, 0.9686275, 1, 0, 1,
-0.9818702, 2.583659, -0.2672448, 0.9607843, 1, 0, 1,
-0.9797183, -0.2194167, -3.25391, 0.9568627, 1, 0, 1,
-0.9753931, -0.4932089, -2.458093, 0.9490196, 1, 0, 1,
-0.97509, -0.04623412, 0.3343849, 0.945098, 1, 0, 1,
-0.9723232, 0.05444061, -1.512599, 0.9372549, 1, 0, 1,
-0.9697897, 0.1432504, -1.718718, 0.9333333, 1, 0, 1,
-0.9677604, -0.1157542, -2.275648, 0.9254902, 1, 0, 1,
-0.965273, 0.09217086, -2.930141, 0.9215686, 1, 0, 1,
-0.9609718, 0.0687108, -1.115171, 0.9137255, 1, 0, 1,
-0.9572276, -0.2086965, -1.346846, 0.9098039, 1, 0, 1,
-0.9481978, 0.5446153, -1.499241, 0.9019608, 1, 0, 1,
-0.9478545, -0.677632, -2.165617, 0.8941177, 1, 0, 1,
-0.930836, 0.41832, 0.8462059, 0.8901961, 1, 0, 1,
-0.9308239, -0.7564455, -2.226449, 0.8823529, 1, 0, 1,
-0.9283918, 0.2645559, -0.5622806, 0.8784314, 1, 0, 1,
-0.9273775, -1.74039, -1.268729, 0.8705882, 1, 0, 1,
-0.9268278, 0.9321747, 0.005640349, 0.8666667, 1, 0, 1,
-0.9265828, 0.1193115, -1.743511, 0.8588235, 1, 0, 1,
-0.9166747, 1.277701, -2.011211, 0.854902, 1, 0, 1,
-0.9063398, 0.6965011, -0.7655485, 0.8470588, 1, 0, 1,
-0.903, -0.00132132, -1.889071, 0.8431373, 1, 0, 1,
-0.8975782, -0.7462534, -2.654689, 0.8352941, 1, 0, 1,
-0.891917, 0.3310405, 0.2706402, 0.8313726, 1, 0, 1,
-0.8830138, 0.4234915, -1.355031, 0.8235294, 1, 0, 1,
-0.8692229, 0.2740977, -1.60538, 0.8196079, 1, 0, 1,
-0.8672383, -0.8810285, -2.5668, 0.8117647, 1, 0, 1,
-0.8577015, -0.1735767, -2.529506, 0.8078431, 1, 0, 1,
-0.8561919, -1.125517, -2.510485, 0.8, 1, 0, 1,
-0.849768, -0.497386, -3.03122, 0.7921569, 1, 0, 1,
-0.8429932, -0.6262016, -1.906033, 0.7882353, 1, 0, 1,
-0.8378586, -0.7539572, -1.189582, 0.7803922, 1, 0, 1,
-0.8315334, 0.6738732, -0.2149047, 0.7764706, 1, 0, 1,
-0.8302425, -0.08499634, -1.333815, 0.7686275, 1, 0, 1,
-0.8255485, 0.8096097, -0.2192991, 0.7647059, 1, 0, 1,
-0.8218068, -0.4011554, -2.223544, 0.7568628, 1, 0, 1,
-0.8209299, 0.9857238, 0.2473344, 0.7529412, 1, 0, 1,
-0.8207694, -1.034224, -2.553066, 0.7450981, 1, 0, 1,
-0.8179288, -0.1796871, -0.5291188, 0.7411765, 1, 0, 1,
-0.8129048, 0.7435883, -0.8215669, 0.7333333, 1, 0, 1,
-0.8095106, -0.7690882, -2.367018, 0.7294118, 1, 0, 1,
-0.8059031, -0.4666996, -1.353115, 0.7215686, 1, 0, 1,
-0.7978034, -1.06203, -1.904884, 0.7176471, 1, 0, 1,
-0.7920371, -0.3422494, -2.716685, 0.7098039, 1, 0, 1,
-0.7757996, 0.4571854, -0.1244234, 0.7058824, 1, 0, 1,
-0.7704402, -0.9544687, -2.584637, 0.6980392, 1, 0, 1,
-0.7698672, -0.9172814, -2.854333, 0.6901961, 1, 0, 1,
-0.7696352, -0.6070691, -2.618032, 0.6862745, 1, 0, 1,
-0.7648309, 0.5029556, 0.8624873, 0.6784314, 1, 0, 1,
-0.7635075, -0.9138062, -3.618267, 0.6745098, 1, 0, 1,
-0.75942, 0.3304265, -0.6507768, 0.6666667, 1, 0, 1,
-0.7548226, -0.5368613, -2.504816, 0.6627451, 1, 0, 1,
-0.7530857, 1.069786, -1.426954, 0.654902, 1, 0, 1,
-0.7530513, 0.3667535, -0.3691966, 0.6509804, 1, 0, 1,
-0.7505131, -1.21125, -0.4349911, 0.6431373, 1, 0, 1,
-0.7482471, -0.6238506, -2.566066, 0.6392157, 1, 0, 1,
-0.7472388, 0.5211399, -0.05071861, 0.6313726, 1, 0, 1,
-0.7454466, -0.8066739, -2.132563, 0.627451, 1, 0, 1,
-0.7436495, -0.3036238, -1.32631, 0.6196079, 1, 0, 1,
-0.734143, -0.44783, -3.294109, 0.6156863, 1, 0, 1,
-0.7311649, -0.5723265, -1.099252, 0.6078432, 1, 0, 1,
-0.7257614, 0.4445647, -0.1278409, 0.6039216, 1, 0, 1,
-0.7236306, -1.214683, -3.284816, 0.5960785, 1, 0, 1,
-0.7217742, -0.4912077, -2.015481, 0.5882353, 1, 0, 1,
-0.7187331, -1.926968, -2.567777, 0.5843138, 1, 0, 1,
-0.716185, 0.3548053, -3.227351, 0.5764706, 1, 0, 1,
-0.706162, -0.376334, -2.700623, 0.572549, 1, 0, 1,
-0.6996429, -0.7991319, -4.692715, 0.5647059, 1, 0, 1,
-0.6931797, 0.3118236, -0.6666755, 0.5607843, 1, 0, 1,
-0.6919942, -0.2629478, -2.233749, 0.5529412, 1, 0, 1,
-0.6915904, -0.4124055, -0.6511142, 0.5490196, 1, 0, 1,
-0.6885766, 0.3164982, -1.28397, 0.5411765, 1, 0, 1,
-0.681656, 1.633382, -0.6390185, 0.5372549, 1, 0, 1,
-0.6808202, -0.5265951, -0.5655544, 0.5294118, 1, 0, 1,
-0.6799407, 1.600222, 0.227429, 0.5254902, 1, 0, 1,
-0.677098, -2.215442, -3.692106, 0.5176471, 1, 0, 1,
-0.6668297, 1.522873, -1.521786, 0.5137255, 1, 0, 1,
-0.6577517, 0.09292777, -3.43696, 0.5058824, 1, 0, 1,
-0.6550772, 1.397718, -0.3723025, 0.5019608, 1, 0, 1,
-0.6539535, -0.7779484, -0.8832097, 0.4941176, 1, 0, 1,
-0.6438732, 1.325441, 0.1564167, 0.4862745, 1, 0, 1,
-0.6420421, -0.851859, -3.028857, 0.4823529, 1, 0, 1,
-0.6397898, 1.780334, 0.7480085, 0.4745098, 1, 0, 1,
-0.6379451, 0.8280099, -0.9452164, 0.4705882, 1, 0, 1,
-0.6365592, -0.2645365, -3.376809, 0.4627451, 1, 0, 1,
-0.6363592, 0.4167868, -2.148113, 0.4588235, 1, 0, 1,
-0.6348825, -0.29943, -2.918566, 0.4509804, 1, 0, 1,
-0.6321247, -1.252992, -2.348831, 0.4470588, 1, 0, 1,
-0.6293763, 0.6363383, 0.458731, 0.4392157, 1, 0, 1,
-0.6292573, -1.103185, -2.464009, 0.4352941, 1, 0, 1,
-0.6282776, 0.5223432, -0.2883766, 0.427451, 1, 0, 1,
-0.6247337, -1.088124, -3.334757, 0.4235294, 1, 0, 1,
-0.6234022, -2.101526, -2.385765, 0.4156863, 1, 0, 1,
-0.622915, -0.6300021, -2.019564, 0.4117647, 1, 0, 1,
-0.6185265, 0.2940557, -0.2253799, 0.4039216, 1, 0, 1,
-0.6156843, -2.007489, -3.423609, 0.3960784, 1, 0, 1,
-0.6098654, -0.9399349, -0.4342739, 0.3921569, 1, 0, 1,
-0.6092916, -0.9431019, -2.352262, 0.3843137, 1, 0, 1,
-0.6084068, -1.196461, -3.104519, 0.3803922, 1, 0, 1,
-0.6072425, -2.106277, -2.375841, 0.372549, 1, 0, 1,
-0.6070204, 0.6999524, -0.290637, 0.3686275, 1, 0, 1,
-0.6044858, 0.8837422, -0.6079264, 0.3607843, 1, 0, 1,
-0.5997896, -0.04594316, -1.974839, 0.3568628, 1, 0, 1,
-0.5982838, -1.465513, -3.704794, 0.3490196, 1, 0, 1,
-0.5974598, 0.2242339, -1.290545, 0.345098, 1, 0, 1,
-0.5939331, 1.181487, 0.1868589, 0.3372549, 1, 0, 1,
-0.5908477, 1.06353, -1.310818, 0.3333333, 1, 0, 1,
-0.5895868, 1.101712, -2.075897, 0.3254902, 1, 0, 1,
-0.5886025, -2.176764, -4.095004, 0.3215686, 1, 0, 1,
-0.587573, 0.8380596, -0.3622391, 0.3137255, 1, 0, 1,
-0.5828571, 0.212522, -0.2196222, 0.3098039, 1, 0, 1,
-0.5825128, -1.418668, -4.109705, 0.3019608, 1, 0, 1,
-0.5786515, 1.423719, 1.005135, 0.2941177, 1, 0, 1,
-0.5740432, 0.2197096, -2.389515, 0.2901961, 1, 0, 1,
-0.5739107, -0.6438194, -3.767754, 0.282353, 1, 0, 1,
-0.5708656, -1.740251, -3.998557, 0.2784314, 1, 0, 1,
-0.5668644, -0.2269125, -2.006785, 0.2705882, 1, 0, 1,
-0.566438, 0.6816224, -0.7418963, 0.2666667, 1, 0, 1,
-0.5646935, 1.727833, -2.132421, 0.2588235, 1, 0, 1,
-0.5643772, 0.4126687, -0.04911037, 0.254902, 1, 0, 1,
-0.5637049, -0.0285758, -1.040443, 0.2470588, 1, 0, 1,
-0.5530727, 0.3519289, -2.494004, 0.2431373, 1, 0, 1,
-0.5496691, -0.6398709, -1.852217, 0.2352941, 1, 0, 1,
-0.5455148, -1.82225, -2.739081, 0.2313726, 1, 0, 1,
-0.5453088, -1.804245, -3.140491, 0.2235294, 1, 0, 1,
-0.5347439, 0.4242179, -0.8490505, 0.2196078, 1, 0, 1,
-0.5299578, 0.01973121, -0.8685487, 0.2117647, 1, 0, 1,
-0.5277058, -0.5231794, -0.4644963, 0.2078431, 1, 0, 1,
-0.5269136, 0.1503948, -2.13594, 0.2, 1, 0, 1,
-0.5256019, 0.9205008, -1.389774, 0.1921569, 1, 0, 1,
-0.5231756, -1.42212, -3.197189, 0.1882353, 1, 0, 1,
-0.5225765, 0.6390743, -1.03729, 0.1803922, 1, 0, 1,
-0.5208787, 1.643412, 1.899637, 0.1764706, 1, 0, 1,
-0.5167656, -0.05831956, -1.529835, 0.1686275, 1, 0, 1,
-0.5118708, -0.2475299, -2.692822, 0.1647059, 1, 0, 1,
-0.5096785, -0.3487906, -1.418832, 0.1568628, 1, 0, 1,
-0.5078991, -1.443423, -2.712971, 0.1529412, 1, 0, 1,
-0.4947149, 0.2206646, -0.8206415, 0.145098, 1, 0, 1,
-0.4901376, 0.01981972, -1.072477, 0.1411765, 1, 0, 1,
-0.4891748, -1.365882, -4.691831, 0.1333333, 1, 0, 1,
-0.4841762, -0.3628764, -3.305793, 0.1294118, 1, 0, 1,
-0.4825257, -0.3386762, -1.546245, 0.1215686, 1, 0, 1,
-0.4770308, -0.00830769, -1.457581, 0.1176471, 1, 0, 1,
-0.4698391, -1.260229, -2.812083, 0.1098039, 1, 0, 1,
-0.4689342, 0.05513886, -2.125191, 0.1058824, 1, 0, 1,
-0.467989, 0.4005066, -0.6943752, 0.09803922, 1, 0, 1,
-0.4622346, 1.210479, -2.943321, 0.09019608, 1, 0, 1,
-0.4603894, -0.1314116, -2.094374, 0.08627451, 1, 0, 1,
-0.4594764, -0.4792485, -1.276676, 0.07843138, 1, 0, 1,
-0.4583032, -0.4324667, -4.370337, 0.07450981, 1, 0, 1,
-0.4557889, 0.6479802, -1.165714, 0.06666667, 1, 0, 1,
-0.4542675, 0.7265591, -1.29504, 0.0627451, 1, 0, 1,
-0.4493644, 1.739431, -0.2930943, 0.05490196, 1, 0, 1,
-0.4445294, 1.253782, -0.6808718, 0.05098039, 1, 0, 1,
-0.4409615, -1.868324, -2.694046, 0.04313726, 1, 0, 1,
-0.4376068, -0.4778636, -1.313688, 0.03921569, 1, 0, 1,
-0.4351057, 0.829472, -0.2908624, 0.03137255, 1, 0, 1,
-0.435044, -0.1041362, -3.384939, 0.02745098, 1, 0, 1,
-0.4328659, 0.05165863, -1.643233, 0.01960784, 1, 0, 1,
-0.4303099, 1.172267, -1.489834, 0.01568628, 1, 0, 1,
-0.4302701, -0.2637612, -0.002407712, 0.007843138, 1, 0, 1,
-0.4277213, -0.02230019, -0.434529, 0.003921569, 1, 0, 1,
-0.424686, -1.104712, -1.739238, 0, 1, 0.003921569, 1,
-0.4241905, 1.405257, 1.447225, 0, 1, 0.01176471, 1,
-0.423941, -0.02977785, -1.659858, 0, 1, 0.01568628, 1,
-0.4237351, 2.024118, -0.2240965, 0, 1, 0.02352941, 1,
-0.4226567, -1.432585, -2.879758, 0, 1, 0.02745098, 1,
-0.4197107, -2.614192, -5.711721, 0, 1, 0.03529412, 1,
-0.4188921, 0.2032089, -0.4974532, 0, 1, 0.03921569, 1,
-0.4165395, -1.85711, -1.351099, 0, 1, 0.04705882, 1,
-0.4158379, 3.22729, 0.4440404, 0, 1, 0.05098039, 1,
-0.4137199, -0.08778952, -1.843767, 0, 1, 0.05882353, 1,
-0.4130076, -2.535362, -2.944523, 0, 1, 0.0627451, 1,
-0.4112439, 1.4325, 0.5824306, 0, 1, 0.07058824, 1,
-0.4109657, 1.616014, -0.04572975, 0, 1, 0.07450981, 1,
-0.4076524, 0.01640613, -0.4383911, 0, 1, 0.08235294, 1,
-0.4043858, 1.08534, 1.124148, 0, 1, 0.08627451, 1,
-0.3995632, 2.449697, 1.013363, 0, 1, 0.09411765, 1,
-0.3964835, -0.3734803, -2.478679, 0, 1, 0.1019608, 1,
-0.3948441, -0.0210156, -2.274357, 0, 1, 0.1058824, 1,
-0.3939699, -0.281186, -2.967319, 0, 1, 0.1137255, 1,
-0.3909822, -0.1676757, -1.445551, 0, 1, 0.1176471, 1,
-0.3856821, 0.06888238, -1.157242, 0, 1, 0.1254902, 1,
-0.3758396, 1.048479, 0.178652, 0, 1, 0.1294118, 1,
-0.3746513, 0.08972673, -2.783418, 0, 1, 0.1372549, 1,
-0.3728192, 0.7779697, 3.313658, 0, 1, 0.1411765, 1,
-0.3723116, 0.3370356, -1.574017, 0, 1, 0.1490196, 1,
-0.3702254, 2.496893, -0.9724168, 0, 1, 0.1529412, 1,
-0.3700537, -0.3274856, -1.168281, 0, 1, 0.1607843, 1,
-0.3684473, 1.360906, 0.1171588, 0, 1, 0.1647059, 1,
-0.3669459, 0.0416492, -0.5352184, 0, 1, 0.172549, 1,
-0.3635817, 1.338515, -0.817884, 0, 1, 0.1764706, 1,
-0.3632739, -0.5286394, -1.019011, 0, 1, 0.1843137, 1,
-0.3631558, -0.7685857, -0.4488302, 0, 1, 0.1882353, 1,
-0.3614507, -0.180521, -2.3894, 0, 1, 0.1960784, 1,
-0.3588859, -0.9569553, -1.927028, 0, 1, 0.2039216, 1,
-0.3575544, 1.443845, -0.736168, 0, 1, 0.2078431, 1,
-0.3490284, -0.6104217, -1.541905, 0, 1, 0.2156863, 1,
-0.3489551, -1.210677, -3.0879, 0, 1, 0.2196078, 1,
-0.3461603, 0.1982613, -1.24963, 0, 1, 0.227451, 1,
-0.3456674, -0.1180595, -2.441106, 0, 1, 0.2313726, 1,
-0.345336, -0.2173818, -1.352193, 0, 1, 0.2392157, 1,
-0.3449969, 0.5394195, -0.1239845, 0, 1, 0.2431373, 1,
-0.3386526, 0.794431, -0.8767236, 0, 1, 0.2509804, 1,
-0.3376409, 0.6199516, -2.183722, 0, 1, 0.254902, 1,
-0.3361715, 0.2067559, 0.5086719, 0, 1, 0.2627451, 1,
-0.3354976, -2.647771, -1.1939, 0, 1, 0.2666667, 1,
-0.3349726, -1.477287, -1.957324, 0, 1, 0.2745098, 1,
-0.3297725, 0.4383506, -0.1917446, 0, 1, 0.2784314, 1,
-0.3283722, -1.734409, -3.200144, 0, 1, 0.2862745, 1,
-0.3281958, -1.333814, -2.422308, 0, 1, 0.2901961, 1,
-0.3267931, -0.8418059, -3.302007, 0, 1, 0.2980392, 1,
-0.326685, -0.2845935, -1.258453, 0, 1, 0.3058824, 1,
-0.3211237, -1.870459, -3.433545, 0, 1, 0.3098039, 1,
-0.3209682, -0.6523461, -2.574438, 0, 1, 0.3176471, 1,
-0.3156169, 0.4616962, -1.57241, 0, 1, 0.3215686, 1,
-0.3130498, 1.085523, -0.4128227, 0, 1, 0.3294118, 1,
-0.3104375, 0.7085729, 0.2546376, 0, 1, 0.3333333, 1,
-0.3036651, -0.9459628, -2.475526, 0, 1, 0.3411765, 1,
-0.2977758, 2.15465, 0.02640124, 0, 1, 0.345098, 1,
-0.2948735, 0.2014792, -1.698284, 0, 1, 0.3529412, 1,
-0.2902058, -0.08788196, -0.6652409, 0, 1, 0.3568628, 1,
-0.2875188, 0.452774, -0.6903811, 0, 1, 0.3647059, 1,
-0.2854534, 1.905737, -1.127598, 0, 1, 0.3686275, 1,
-0.283069, 0.3568723, 0.4017846, 0, 1, 0.3764706, 1,
-0.2826417, 0.6415779, -0.400199, 0, 1, 0.3803922, 1,
-0.2817374, 0.7488168, -0.8991587, 0, 1, 0.3882353, 1,
-0.278206, 1.441599, -1.488093, 0, 1, 0.3921569, 1,
-0.2770314, 1.83843, -0.9892258, 0, 1, 0.4, 1,
-0.276511, 1.001346, -0.1142248, 0, 1, 0.4078431, 1,
-0.2744259, -0.07270085, -3.499633, 0, 1, 0.4117647, 1,
-0.2729738, -1.289092, -4.254642, 0, 1, 0.4196078, 1,
-0.2727542, -0.8356345, -2.508084, 0, 1, 0.4235294, 1,
-0.270887, 0.5682672, -1.307001, 0, 1, 0.4313726, 1,
-0.2703187, -0.3140768, -1.503965, 0, 1, 0.4352941, 1,
-0.2686336, 0.9438695, 1.758525, 0, 1, 0.4431373, 1,
-0.2672909, 0.2936105, -0.912809, 0, 1, 0.4470588, 1,
-0.2659978, -2.270628, -2.965205, 0, 1, 0.454902, 1,
-0.2630697, -3.108211, -2.612214, 0, 1, 0.4588235, 1,
-0.2606593, 0.3428488, 1.686396, 0, 1, 0.4666667, 1,
-0.2515907, -1.011054, -1.995426, 0, 1, 0.4705882, 1,
-0.2503425, 1.021585, -1.345928, 0, 1, 0.4784314, 1,
-0.2501224, 0.8434525, 1.044839, 0, 1, 0.4823529, 1,
-0.2487329, -0.3096913, -3.010735, 0, 1, 0.4901961, 1,
-0.2442654, 0.7891601, -0.6906211, 0, 1, 0.4941176, 1,
-0.243345, -2.110945, -3.138658, 0, 1, 0.5019608, 1,
-0.2422664, 2.02009, -1.105425, 0, 1, 0.509804, 1,
-0.2333085, 0.2261255, -1.549079, 0, 1, 0.5137255, 1,
-0.2330056, -0.4469149, -2.557833, 0, 1, 0.5215687, 1,
-0.2319673, -1.481539, -1.985245, 0, 1, 0.5254902, 1,
-0.2275365, 0.4366149, 0.3464802, 0, 1, 0.5333334, 1,
-0.221765, -0.1499947, -0.771956, 0, 1, 0.5372549, 1,
-0.2193489, -0.6181475, -2.362537, 0, 1, 0.5450981, 1,
-0.2166643, 0.2150789, 0.9665163, 0, 1, 0.5490196, 1,
-0.2141914, -1.042071, -2.79379, 0, 1, 0.5568628, 1,
-0.2125406, 0.6979653, -1.416229, 0, 1, 0.5607843, 1,
-0.2124926, -1.123977, -4.476166, 0, 1, 0.5686275, 1,
-0.2115599, 0.2342131, 0.1932158, 0, 1, 0.572549, 1,
-0.2069308, 0.8964297, 0.04871882, 0, 1, 0.5803922, 1,
-0.2031775, -0.7750384, -1.897592, 0, 1, 0.5843138, 1,
-0.2011691, 1.555916, 0.5498624, 0, 1, 0.5921569, 1,
-0.1996536, -0.374733, -3.654323, 0, 1, 0.5960785, 1,
-0.1977994, 0.2197631, -1.028441, 0, 1, 0.6039216, 1,
-0.1976771, 1.420147, -1.225271, 0, 1, 0.6117647, 1,
-0.1948991, 0.2604115, -2.019412, 0, 1, 0.6156863, 1,
-0.1902869, 0.6585936, -1.492529, 0, 1, 0.6235294, 1,
-0.1899697, 0.6685343, -1.308786, 0, 1, 0.627451, 1,
-0.1812137, 0.8814619, -2.163327, 0, 1, 0.6352941, 1,
-0.1801622, 0.548354, -0.804324, 0, 1, 0.6392157, 1,
-0.1800197, -1.037507, -2.785125, 0, 1, 0.6470588, 1,
-0.1772668, 0.7513565, -0.930553, 0, 1, 0.6509804, 1,
-0.1764003, 0.167748, -0.5735415, 0, 1, 0.6588235, 1,
-0.1739507, -1.184346, -3.760503, 0, 1, 0.6627451, 1,
-0.1707884, 0.8627049, 1.009648, 0, 1, 0.6705883, 1,
-0.1691601, 1.379813, 1.03704, 0, 1, 0.6745098, 1,
-0.1689192, 0.7030773, -1.378032, 0, 1, 0.682353, 1,
-0.164606, -0.6080602, -2.950393, 0, 1, 0.6862745, 1,
-0.162069, 0.02272358, -0.3976061, 0, 1, 0.6941177, 1,
-0.1610507, -1.089352, -1.051943, 0, 1, 0.7019608, 1,
-0.1590846, -0.1006378, -0.9728208, 0, 1, 0.7058824, 1,
-0.1583576, 0.4962883, -1.625916, 0, 1, 0.7137255, 1,
-0.1501276, -0.8429742, -2.365791, 0, 1, 0.7176471, 1,
-0.1488125, 0.1801793, -0.4777385, 0, 1, 0.7254902, 1,
-0.1486785, 0.03076988, -1.333556, 0, 1, 0.7294118, 1,
-0.1428523, 0.1981325, 0.5606255, 0, 1, 0.7372549, 1,
-0.142029, 1.071862, -0.05183228, 0, 1, 0.7411765, 1,
-0.1416238, 0.7860897, 1.390284, 0, 1, 0.7490196, 1,
-0.1400236, 0.3604855, 0.1321812, 0, 1, 0.7529412, 1,
-0.131017, 1.464187, -0.08396047, 0, 1, 0.7607843, 1,
-0.1295721, -0.1377671, -2.546267, 0, 1, 0.7647059, 1,
-0.1278548, 0.5005561, 1.163376, 0, 1, 0.772549, 1,
-0.1261632, 0.4333021, 0.5704736, 0, 1, 0.7764706, 1,
-0.1252059, 1.681568, 0.4929714, 0, 1, 0.7843137, 1,
-0.1249655, 0.3286902, 0.1968102, 0, 1, 0.7882353, 1,
-0.1247403, 1.406967, -0.3952623, 0, 1, 0.7960784, 1,
-0.1240649, -2.383169, -3.397978, 0, 1, 0.8039216, 1,
-0.1226011, 0.6704512, 1.282716, 0, 1, 0.8078431, 1,
-0.1214314, 1.188048, -0.983261, 0, 1, 0.8156863, 1,
-0.1198662, 0.03475481, -1.073804, 0, 1, 0.8196079, 1,
-0.115184, -0.6405019, -1.443827, 0, 1, 0.827451, 1,
-0.1129559, -0.4796169, -5.92563, 0, 1, 0.8313726, 1,
-0.1121051, 0.2455849, -1.054211, 0, 1, 0.8392157, 1,
-0.1110014, -2.054523, -4.970334, 0, 1, 0.8431373, 1,
-0.1048104, -1.030822, -4.454593, 0, 1, 0.8509804, 1,
-0.1046139, -1.238236, -2.153986, 0, 1, 0.854902, 1,
-0.1020203, 0.2133605, -0.9830709, 0, 1, 0.8627451, 1,
-0.09738897, -0.04074581, -1.726921, 0, 1, 0.8666667, 1,
-0.09679171, 0.07247094, -0.3768786, 0, 1, 0.8745098, 1,
-0.09670599, -1.776245, -4.519031, 0, 1, 0.8784314, 1,
-0.09115247, 2.207133, 0.2835774, 0, 1, 0.8862745, 1,
-0.08534241, -0.08748624, -2.089401, 0, 1, 0.8901961, 1,
-0.08270839, 0.4472823, -1.687922, 0, 1, 0.8980392, 1,
-0.08051278, -0.3622592, -4.687407, 0, 1, 0.9058824, 1,
-0.07887188, 0.6621606, -1.060997, 0, 1, 0.9098039, 1,
-0.0769503, -0.2105684, -4.337711, 0, 1, 0.9176471, 1,
-0.07644527, 1.22206, -0.683605, 0, 1, 0.9215686, 1,
-0.07511852, 1.060848, -1.131589, 0, 1, 0.9294118, 1,
-0.07412796, -0.3724777, -0.8186855, 0, 1, 0.9333333, 1,
-0.07178132, 1.092516, 0.4381084, 0, 1, 0.9411765, 1,
-0.07046902, 0.8359169, 2.781689, 0, 1, 0.945098, 1,
-0.06538278, -0.9360564, -2.487621, 0, 1, 0.9529412, 1,
-0.06411348, 1.172182, -1.885945, 0, 1, 0.9568627, 1,
-0.06240059, 1.441282, 1.036349, 0, 1, 0.9647059, 1,
-0.06064705, 1.075542, -0.2991476, 0, 1, 0.9686275, 1,
-0.05688553, -0.1310381, -0.9857206, 0, 1, 0.9764706, 1,
-0.05572684, -0.8759366, -0.9896788, 0, 1, 0.9803922, 1,
-0.05472095, -0.1414915, -4.450771, 0, 1, 0.9882353, 1,
-0.05356853, 1.217148, -0.01661391, 0, 1, 0.9921569, 1,
-0.05231269, -0.02158119, -2.345197, 0, 1, 1, 1,
-0.04994943, -0.004581903, -1.892961, 0, 0.9921569, 1, 1,
-0.04496128, -0.6913666, -3.871485, 0, 0.9882353, 1, 1,
-0.04291949, -0.9531271, -3.964269, 0, 0.9803922, 1, 1,
-0.03353434, 1.712406, 0.442794, 0, 0.9764706, 1, 1,
-0.03336748, -1.002569, -4.003597, 0, 0.9686275, 1, 1,
-0.03119916, -1.162505, -3.351002, 0, 0.9647059, 1, 1,
-0.01936502, 1.321823, -0.5974272, 0, 0.9568627, 1, 1,
-0.01543608, 0.2037001, 0.9562191, 0, 0.9529412, 1, 1,
-0.01377226, 0.6023957, -0.143862, 0, 0.945098, 1, 1,
-0.008609292, 0.5811478, -1.073849, 0, 0.9411765, 1, 1,
-0.0085713, -1.955309, -3.567885, 0, 0.9333333, 1, 1,
-0.006102122, -2.433421, -2.622311, 0, 0.9294118, 1, 1,
-0.002093245, -1.107059, -4.724445, 0, 0.9215686, 1, 1,
0.002520103, -0.6576586, 3.824801, 0, 0.9176471, 1, 1,
0.005308395, 1.278855, 1.22056, 0, 0.9098039, 1, 1,
0.01006318, 0.8824707, 1.143434, 0, 0.9058824, 1, 1,
0.01236006, -1.00583, 3.274141, 0, 0.8980392, 1, 1,
0.01418198, -1.914025, 3.832327, 0, 0.8901961, 1, 1,
0.01701133, 0.510164, -0.3272703, 0, 0.8862745, 1, 1,
0.01893424, 0.5237107, -0.4188845, 0, 0.8784314, 1, 1,
0.02479675, -1.616883, 3.178106, 0, 0.8745098, 1, 1,
0.02796061, 1.095762, 1.261465, 0, 0.8666667, 1, 1,
0.02796271, 2.305716, -0.08181512, 0, 0.8627451, 1, 1,
0.02818956, 0.7708037, 1.301602, 0, 0.854902, 1, 1,
0.03274225, -1.77861, 1.620081, 0, 0.8509804, 1, 1,
0.04035526, 1.516808, -0.7868956, 0, 0.8431373, 1, 1,
0.042034, 2.035473, -0.7973893, 0, 0.8392157, 1, 1,
0.04579838, 0.8464941, 3.059144, 0, 0.8313726, 1, 1,
0.04953575, 0.01394065, 1.760346, 0, 0.827451, 1, 1,
0.0594112, 0.9887357, 2.403596, 0, 0.8196079, 1, 1,
0.06434318, 0.1640963, -0.5786201, 0, 0.8156863, 1, 1,
0.06816971, 0.3164083, 1.619383, 0, 0.8078431, 1, 1,
0.06855354, -1.048177, 3.983833, 0, 0.8039216, 1, 1,
0.07856434, -0.7168428, 3.94594, 0, 0.7960784, 1, 1,
0.0819185, 1.503483, -1.528678, 0, 0.7882353, 1, 1,
0.08207738, -0.4968787, 3.212585, 0, 0.7843137, 1, 1,
0.08313008, 0.1201556, 1.380194, 0, 0.7764706, 1, 1,
0.08472332, 1.470999, -0.1871522, 0, 0.772549, 1, 1,
0.0886229, 0.9363559, -0.4359999, 0, 0.7647059, 1, 1,
0.09011605, 0.5162029, -0.5139177, 0, 0.7607843, 1, 1,
0.09783819, -0.5045582, 3.684268, 0, 0.7529412, 1, 1,
0.09911702, -1.238938, 3.104345, 0, 0.7490196, 1, 1,
0.1004671, 2.320425, 1.972933, 0, 0.7411765, 1, 1,
0.1042966, 0.6794533, 0.0546889, 0, 0.7372549, 1, 1,
0.1051336, -1.476217, 3.829915, 0, 0.7294118, 1, 1,
0.1062504, 1.056563, -0.5810617, 0, 0.7254902, 1, 1,
0.1142477, 0.7181003, 1.149402, 0, 0.7176471, 1, 1,
0.1145778, 0.3103171, -0.5247412, 0, 0.7137255, 1, 1,
0.1189372, 1.155691, 0.2570475, 0, 0.7058824, 1, 1,
0.1191921, 0.1424173, 1.771061, 0, 0.6980392, 1, 1,
0.1192636, 0.6572627, -0.858034, 0, 0.6941177, 1, 1,
0.1205092, -0.9017732, 4.495177, 0, 0.6862745, 1, 1,
0.1224333, 0.150173, 0.8196803, 0, 0.682353, 1, 1,
0.1287129, 0.7757779, 0.8521648, 0, 0.6745098, 1, 1,
0.1322131, -1.406294, 4.094109, 0, 0.6705883, 1, 1,
0.1355718, 0.3133489, 1.704855, 0, 0.6627451, 1, 1,
0.1417668, -0.9985119, 3.352053, 0, 0.6588235, 1, 1,
0.1444513, 0.9090446, -1.380715, 0, 0.6509804, 1, 1,
0.1459074, 0.1864303, 1.249355, 0, 0.6470588, 1, 1,
0.1485405, 0.4205493, 1.367357, 0, 0.6392157, 1, 1,
0.1517074, -1.25398, 4.469524, 0, 0.6352941, 1, 1,
0.1523276, -0.4321336, 1.99519, 0, 0.627451, 1, 1,
0.1591696, 0.04743855, 1.607252, 0, 0.6235294, 1, 1,
0.161125, 1.634048, -1.397744, 0, 0.6156863, 1, 1,
0.1641684, 0.2365545, -0.5580103, 0, 0.6117647, 1, 1,
0.1661444, 0.9434742, -1.093048, 0, 0.6039216, 1, 1,
0.166223, 1.195234, 2.005171, 0, 0.5960785, 1, 1,
0.1663584, -0.2646993, 2.946804, 0, 0.5921569, 1, 1,
0.1684434, 0.3480488, 0.8262698, 0, 0.5843138, 1, 1,
0.16927, 0.1037304, 0.04827808, 0, 0.5803922, 1, 1,
0.1726821, 1.410783, 0.3860361, 0, 0.572549, 1, 1,
0.1749626, -0.000466681, 2.513841, 0, 0.5686275, 1, 1,
0.179487, 0.8620033, 1.011969, 0, 0.5607843, 1, 1,
0.1800368, 1.182416, 2.476796, 0, 0.5568628, 1, 1,
0.1817506, -1.553853, 2.89598, 0, 0.5490196, 1, 1,
0.1839993, -1.404526, 2.280889, 0, 0.5450981, 1, 1,
0.1860535, 1.85012, 1.931364, 0, 0.5372549, 1, 1,
0.1913686, -0.7789099, 2.994083, 0, 0.5333334, 1, 1,
0.193263, 2.183495, 0.1431823, 0, 0.5254902, 1, 1,
0.1934802, 0.5020302, -0.2746231, 0, 0.5215687, 1, 1,
0.2010064, -0.6158329, 1.751418, 0, 0.5137255, 1, 1,
0.2028248, -0.2958215, 1.764028, 0, 0.509804, 1, 1,
0.2036121, -1.013048, 2.889077, 0, 0.5019608, 1, 1,
0.2046193, 1.126425, 1.379467, 0, 0.4941176, 1, 1,
0.2051418, 1.648684, 0.3838056, 0, 0.4901961, 1, 1,
0.2056509, 1.452835, -2.494285, 0, 0.4823529, 1, 1,
0.2080871, 0.4937549, 2.012458, 0, 0.4784314, 1, 1,
0.2125429, 1.735723, 1.777468, 0, 0.4705882, 1, 1,
0.2192253, 0.8378398, -0.08134778, 0, 0.4666667, 1, 1,
0.2222772, -0.8964591, 2.558752, 0, 0.4588235, 1, 1,
0.2246899, -0.1134235, 2.042428, 0, 0.454902, 1, 1,
0.2287578, -0.4606908, 3.90316, 0, 0.4470588, 1, 1,
0.2322764, -1.487948, 3.768426, 0, 0.4431373, 1, 1,
0.234775, 0.06234949, -0.7496862, 0, 0.4352941, 1, 1,
0.2353607, -0.08131969, 2.133725, 0, 0.4313726, 1, 1,
0.2362722, 0.06505046, 1.06708, 0, 0.4235294, 1, 1,
0.2381187, 0.2650983, -0.2147064, 0, 0.4196078, 1, 1,
0.2471927, -1.131763, 3.031265, 0, 0.4117647, 1, 1,
0.2495136, -0.2401872, 2.594992, 0, 0.4078431, 1, 1,
0.2526729, -0.2392729, 1.412897, 0, 0.4, 1, 1,
0.254758, 1.491934, -1.3373, 0, 0.3921569, 1, 1,
0.2555265, -0.2834801, 1.992416, 0, 0.3882353, 1, 1,
0.2568878, 0.4108616, 1.199629, 0, 0.3803922, 1, 1,
0.2615589, -0.3479697, 1.50829, 0, 0.3764706, 1, 1,
0.2620631, -0.5614072, 2.954511, 0, 0.3686275, 1, 1,
0.2653396, -1.181289, 1.254503, 0, 0.3647059, 1, 1,
0.2685194, 0.3304121, 0.1780691, 0, 0.3568628, 1, 1,
0.2693834, -0.3855912, 1.037637, 0, 0.3529412, 1, 1,
0.2749629, 0.4374717, -0.4055471, 0, 0.345098, 1, 1,
0.2777858, 0.1735068, -1.615571, 0, 0.3411765, 1, 1,
0.2779029, 0.4685954, -0.4845275, 0, 0.3333333, 1, 1,
0.2826216, -1.917518, 2.534504, 0, 0.3294118, 1, 1,
0.2846975, 1.400936, 2.216035, 0, 0.3215686, 1, 1,
0.2856512, 1.6162, 1.715395, 0, 0.3176471, 1, 1,
0.2871607, 1.267579, 1.745283, 0, 0.3098039, 1, 1,
0.2872602, -0.7132167, 2.17913, 0, 0.3058824, 1, 1,
0.2876312, -1.446848, 2.398826, 0, 0.2980392, 1, 1,
0.2943887, 2.097645, -0.8303859, 0, 0.2901961, 1, 1,
0.2960807, -1.273867, 2.561329, 0, 0.2862745, 1, 1,
0.2969973, -1.152632, 3.531683, 0, 0.2784314, 1, 1,
0.2974093, 0.4416241, 1.876804, 0, 0.2745098, 1, 1,
0.2988646, 0.2947813, 0.9828106, 0, 0.2666667, 1, 1,
0.3043059, 1.126506, -0.3793167, 0, 0.2627451, 1, 1,
0.304471, 0.1025087, 0.7538326, 0, 0.254902, 1, 1,
0.3121961, -3.293313, 3.345777, 0, 0.2509804, 1, 1,
0.3124627, -0.7892602, 1.825248, 0, 0.2431373, 1, 1,
0.3151526, 0.1642888, 1.012394, 0, 0.2392157, 1, 1,
0.317719, 0.5322232, -0.214441, 0, 0.2313726, 1, 1,
0.3180508, 0.7657795, 1.089285, 0, 0.227451, 1, 1,
0.3235402, 0.9038947, -0.4746143, 0, 0.2196078, 1, 1,
0.3254323, -0.538787, 2.996304, 0, 0.2156863, 1, 1,
0.328151, -0.0008715512, 1.8892, 0, 0.2078431, 1, 1,
0.3284041, 1.01612, 0.1796605, 0, 0.2039216, 1, 1,
0.3401905, -0.1898109, 1.953434, 0, 0.1960784, 1, 1,
0.3421237, -0.0512896, 1.211272, 0, 0.1882353, 1, 1,
0.3427289, -0.9545235, 2.94073, 0, 0.1843137, 1, 1,
0.3431473, -2.067646, 4.407717, 0, 0.1764706, 1, 1,
0.3480721, -1.645327, 1.372943, 0, 0.172549, 1, 1,
0.3482744, -0.2791343, 3.972092, 0, 0.1647059, 1, 1,
0.3518917, -0.8324394, 1.738554, 0, 0.1607843, 1, 1,
0.3542438, -2.984999, 3.220142, 0, 0.1529412, 1, 1,
0.3542442, 2.366382, -1.400022, 0, 0.1490196, 1, 1,
0.356032, 1.688601, 0.4407796, 0, 0.1411765, 1, 1,
0.3573226, -2.043578, 2.306833, 0, 0.1372549, 1, 1,
0.3625172, 0.1483683, -0.2145492, 0, 0.1294118, 1, 1,
0.3648735, -0.2177936, 1.356741, 0, 0.1254902, 1, 1,
0.3708167, -0.01509372, 0.2255624, 0, 0.1176471, 1, 1,
0.3730861, -0.4438055, 3.737213, 0, 0.1137255, 1, 1,
0.3783678, -0.3607257, 2.927167, 0, 0.1058824, 1, 1,
0.3808059, -0.3972768, 1.680543, 0, 0.09803922, 1, 1,
0.3814805, 1.397578, 1.667673, 0, 0.09411765, 1, 1,
0.3840458, -1.512854, 1.677034, 0, 0.08627451, 1, 1,
0.3866525, 0.8807569, 0.3493148, 0, 0.08235294, 1, 1,
0.3919048, 0.5543997, 0.80984, 0, 0.07450981, 1, 1,
0.3934221, 1.30723, 1.024274, 0, 0.07058824, 1, 1,
0.3953504, 0.5791904, 2.000482, 0, 0.0627451, 1, 1,
0.4010206, -0.5891671, 2.692521, 0, 0.05882353, 1, 1,
0.4045807, -2.088827, 2.810462, 0, 0.05098039, 1, 1,
0.4072197, 0.9979265, 1.582636, 0, 0.04705882, 1, 1,
0.410695, -1.041667, 2.830713, 0, 0.03921569, 1, 1,
0.4135254, -1.088301, 2.454008, 0, 0.03529412, 1, 1,
0.4178875, 0.1438039, 1.314283, 0, 0.02745098, 1, 1,
0.4232898, -0.1845802, 0.5852274, 0, 0.02352941, 1, 1,
0.4270944, 0.6845657, 0.60447, 0, 0.01568628, 1, 1,
0.4272856, 1.257031, -0.8036636, 0, 0.01176471, 1, 1,
0.4302188, 0.6778834, 0.2340527, 0, 0.003921569, 1, 1,
0.4344172, 0.1723467, 1.617897, 0.003921569, 0, 1, 1,
0.4371597, 0.4861724, 0.9881018, 0.007843138, 0, 1, 1,
0.443271, -1.650205, 2.797665, 0.01568628, 0, 1, 1,
0.4442358, -0.5536708, 1.753328, 0.01960784, 0, 1, 1,
0.4533943, -2.225644, 3.144265, 0.02745098, 0, 1, 1,
0.4534466, -0.6211715, 5.184055, 0.03137255, 0, 1, 1,
0.4550868, -0.8582975, 2.877589, 0.03921569, 0, 1, 1,
0.4560135, -0.9416513, 3.805305, 0.04313726, 0, 1, 1,
0.464668, -0.2164653, 0.4372496, 0.05098039, 0, 1, 1,
0.4648543, -0.8372727, 2.659286, 0.05490196, 0, 1, 1,
0.4653769, -0.349366, 3.472496, 0.0627451, 0, 1, 1,
0.465404, 0.3234611, 0.4337002, 0.06666667, 0, 1, 1,
0.4679244, 0.8381957, -0.4468947, 0.07450981, 0, 1, 1,
0.4689675, 1.32713, 0.2252918, 0.07843138, 0, 1, 1,
0.4693441, 0.7201101, 1.773021, 0.08627451, 0, 1, 1,
0.4735608, -0.02054675, 1.838069, 0.09019608, 0, 1, 1,
0.475993, -1.867523, 1.86482, 0.09803922, 0, 1, 1,
0.477893, -0.2702753, 1.69349, 0.1058824, 0, 1, 1,
0.4779834, -0.007117673, -0.9006864, 0.1098039, 0, 1, 1,
0.4787004, 0.3248466, -1.046727, 0.1176471, 0, 1, 1,
0.48044, 0.8444631, 2.256813, 0.1215686, 0, 1, 1,
0.4819524, 0.7400959, -1.438588, 0.1294118, 0, 1, 1,
0.4822455, -0.6820719, 1.597894, 0.1333333, 0, 1, 1,
0.485316, 0.06198863, 1.408392, 0.1411765, 0, 1, 1,
0.4855558, -0.128845, 1.195592, 0.145098, 0, 1, 1,
0.4875885, 1.756133, 0.5729612, 0.1529412, 0, 1, 1,
0.4897451, 0.1687876, 1.262528, 0.1568628, 0, 1, 1,
0.5021634, -1.176847, 2.531887, 0.1647059, 0, 1, 1,
0.5029909, 0.3476597, 1.631516, 0.1686275, 0, 1, 1,
0.5033051, -2.34841, 1.25257, 0.1764706, 0, 1, 1,
0.5058865, -0.3658391, 1.849128, 0.1803922, 0, 1, 1,
0.5085447, 0.8442733, 0.1311638, 0.1882353, 0, 1, 1,
0.5091787, -1.863422, 1.919737, 0.1921569, 0, 1, 1,
0.5126538, 0.3226479, -0.1651076, 0.2, 0, 1, 1,
0.5158442, 0.7893416, 1.29851, 0.2078431, 0, 1, 1,
0.5218387, -0.3498321, 2.918729, 0.2117647, 0, 1, 1,
0.5259598, 2.454759, 0.7056648, 0.2196078, 0, 1, 1,
0.5293465, 1.382865, 0.2965983, 0.2235294, 0, 1, 1,
0.5327833, 0.1875453, 0.2991886, 0.2313726, 0, 1, 1,
0.5334125, 2.115957, -0.1392075, 0.2352941, 0, 1, 1,
0.5335433, -0.8666168, 2.621635, 0.2431373, 0, 1, 1,
0.5336731, -0.4870943, 2.504826, 0.2470588, 0, 1, 1,
0.5362192, 0.06126815, 0.5300036, 0.254902, 0, 1, 1,
0.5380183, -0.8222287, 3.241744, 0.2588235, 0, 1, 1,
0.5397386, -0.3106595, 1.294627, 0.2666667, 0, 1, 1,
0.5480382, -0.8676568, 1.94312, 0.2705882, 0, 1, 1,
0.55745, 0.6621486, 1.101768, 0.2784314, 0, 1, 1,
0.5622163, -0.07962056, 2.513793, 0.282353, 0, 1, 1,
0.5653934, -0.9451731, 2.575301, 0.2901961, 0, 1, 1,
0.5725968, -1.341355, 1.319374, 0.2941177, 0, 1, 1,
0.5747929, -1.176488, 2.425176, 0.3019608, 0, 1, 1,
0.577991, 1.014845, 0.3524147, 0.3098039, 0, 1, 1,
0.5793221, 0.3247152, 0.7474313, 0.3137255, 0, 1, 1,
0.5817006, 0.8889552, 0.06154492, 0.3215686, 0, 1, 1,
0.5840667, 0.08431837, -0.1188728, 0.3254902, 0, 1, 1,
0.5843708, 0.1395103, 2.172676, 0.3333333, 0, 1, 1,
0.5909072, -0.6985384, 2.23318, 0.3372549, 0, 1, 1,
0.593983, -0.9915568, 2.811805, 0.345098, 0, 1, 1,
0.5963368, -1.581824, 2.49565, 0.3490196, 0, 1, 1,
0.5965365, -1.351409, 1.527907, 0.3568628, 0, 1, 1,
0.5970392, 0.2869258, 1.084739, 0.3607843, 0, 1, 1,
0.6007712, 0.5214179, 1.975935, 0.3686275, 0, 1, 1,
0.6010861, 0.3727809, 1.156261, 0.372549, 0, 1, 1,
0.6026255, -0.4336163, 1.260005, 0.3803922, 0, 1, 1,
0.6039822, -0.9749509, 1.482983, 0.3843137, 0, 1, 1,
0.6043544, -0.2607694, 2.632235, 0.3921569, 0, 1, 1,
0.6068349, -0.3930976, 2.357397, 0.3960784, 0, 1, 1,
0.6070694, -0.8274912, 0.464269, 0.4039216, 0, 1, 1,
0.6071917, 0.3601257, 0.1979746, 0.4117647, 0, 1, 1,
0.6126829, -1.329198, 1.9172, 0.4156863, 0, 1, 1,
0.6127819, 0.6122708, 0.1253261, 0.4235294, 0, 1, 1,
0.6161864, 0.2118639, 0.4394501, 0.427451, 0, 1, 1,
0.6260852, -1.214122, 2.53243, 0.4352941, 0, 1, 1,
0.6273053, 0.3202307, 3.207904, 0.4392157, 0, 1, 1,
0.6280491, 0.1818577, 2.308763, 0.4470588, 0, 1, 1,
0.6299586, -0.4779361, 2.498769, 0.4509804, 0, 1, 1,
0.6302015, -0.296281, 1.863317, 0.4588235, 0, 1, 1,
0.6305353, -0.344723, 1.662145, 0.4627451, 0, 1, 1,
0.6406376, -0.6236066, 2.696582, 0.4705882, 0, 1, 1,
0.6434186, -0.3866083, 3.720398, 0.4745098, 0, 1, 1,
0.6487845, 0.9016036, -1.379845, 0.4823529, 0, 1, 1,
0.6520457, 0.4620244, -0.2912537, 0.4862745, 0, 1, 1,
0.6529335, -0.2103427, 3.024315, 0.4941176, 0, 1, 1,
0.6637959, 0.2775803, 0.9946379, 0.5019608, 0, 1, 1,
0.668076, 1.585117, 0.6134498, 0.5058824, 0, 1, 1,
0.6688251, -0.1345205, 1.889531, 0.5137255, 0, 1, 1,
0.6701353, -1.19241, 2.67701, 0.5176471, 0, 1, 1,
0.6701992, 0.1589373, 0.88821, 0.5254902, 0, 1, 1,
0.6784431, 0.5571589, 0.8914194, 0.5294118, 0, 1, 1,
0.6803474, 0.4046404, 0.5947362, 0.5372549, 0, 1, 1,
0.6832229, -0.296048, 1.577843, 0.5411765, 0, 1, 1,
0.6835319, 1.963205, 1.286425, 0.5490196, 0, 1, 1,
0.6836041, 0.2886502, -0.415166, 0.5529412, 0, 1, 1,
0.6836272, -1.601079, 3.075, 0.5607843, 0, 1, 1,
0.6902581, -2.016537, 2.688777, 0.5647059, 0, 1, 1,
0.6906765, 1.393921, -0.3601656, 0.572549, 0, 1, 1,
0.6919597, -0.551597, 2.499056, 0.5764706, 0, 1, 1,
0.6928217, 1.072923, 1.518225, 0.5843138, 0, 1, 1,
0.6933686, -0.8676839, 3.295394, 0.5882353, 0, 1, 1,
0.6938713, -0.9171667, 1.956764, 0.5960785, 0, 1, 1,
0.6942155, 1.344949, 0.5570828, 0.6039216, 0, 1, 1,
0.6969001, 0.2199523, 0.3328221, 0.6078432, 0, 1, 1,
0.6972766, 0.6933551, 1.712749, 0.6156863, 0, 1, 1,
0.6990679, 0.6849242, 0.9486567, 0.6196079, 0, 1, 1,
0.7012522, 1.653623, 1.579207, 0.627451, 0, 1, 1,
0.7079924, 0.002692193, 1.623344, 0.6313726, 0, 1, 1,
0.7111582, -0.1672676, 1.225617, 0.6392157, 0, 1, 1,
0.711781, -2.093227, 2.144399, 0.6431373, 0, 1, 1,
0.7185827, -0.9739529, 2.02524, 0.6509804, 0, 1, 1,
0.7188798, -0.423777, 2.900654, 0.654902, 0, 1, 1,
0.7214713, 0.2542696, 0.3573674, 0.6627451, 0, 1, 1,
0.7241141, 0.1353284, 3.112347, 0.6666667, 0, 1, 1,
0.7341706, -0.9277832, 2.864199, 0.6745098, 0, 1, 1,
0.7360059, -0.03897573, -0.2960323, 0.6784314, 0, 1, 1,
0.7423921, -0.2177848, 3.708454, 0.6862745, 0, 1, 1,
0.7427346, -1.959015, 2.963185, 0.6901961, 0, 1, 1,
0.7428169, -0.2814408, 3.930954, 0.6980392, 0, 1, 1,
0.744536, -1.068188, 4.845296, 0.7058824, 0, 1, 1,
0.750961, -0.9003134, 2.545734, 0.7098039, 0, 1, 1,
0.7582299, -1.198542, 2.81424, 0.7176471, 0, 1, 1,
0.7589844, 0.4797705, 0.2587928, 0.7215686, 0, 1, 1,
0.7603679, -0.7487397, 2.072025, 0.7294118, 0, 1, 1,
0.761368, -1.406759, -0.4745637, 0.7333333, 0, 1, 1,
0.7628728, -0.8343821, 1.934662, 0.7411765, 0, 1, 1,
0.7630095, 0.3324177, 2.360471, 0.7450981, 0, 1, 1,
0.7634963, 1.068001, 0.2506375, 0.7529412, 0, 1, 1,
0.7650006, -1.060388, 3.346202, 0.7568628, 0, 1, 1,
0.7670585, 0.1303978, 1.97299, 0.7647059, 0, 1, 1,
0.7713872, -0.9051126, 1.296382, 0.7686275, 0, 1, 1,
0.7735225, -1.200209, 3.849735, 0.7764706, 0, 1, 1,
0.7788237, -0.1829509, 1.970589, 0.7803922, 0, 1, 1,
0.7858152, 0.1568273, 2.125245, 0.7882353, 0, 1, 1,
0.7925738, 1.909379, 0.7671002, 0.7921569, 0, 1, 1,
0.7979343, -1.423697, 3.296612, 0.8, 0, 1, 1,
0.8071386, -0.6952876, 1.408084, 0.8078431, 0, 1, 1,
0.8084232, 0.3538505, 1.210766, 0.8117647, 0, 1, 1,
0.8100362, -0.6762118, 2.530402, 0.8196079, 0, 1, 1,
0.8110998, -1.157696, 1.872075, 0.8235294, 0, 1, 1,
0.8117495, -0.02172524, 3.860927, 0.8313726, 0, 1, 1,
0.8162987, 0.3579964, 2.672971, 0.8352941, 0, 1, 1,
0.8182178, 0.8797572, 0.6289538, 0.8431373, 0, 1, 1,
0.8197743, 0.510986, 1.735909, 0.8470588, 0, 1, 1,
0.8394491, -0.3960443, -0.5545308, 0.854902, 0, 1, 1,
0.8424824, 0.5571307, 1.960526, 0.8588235, 0, 1, 1,
0.842822, -0.004169571, 0.540312, 0.8666667, 0, 1, 1,
0.8496633, 1.220169, -0.5852122, 0.8705882, 0, 1, 1,
0.8564056, 0.6785059, 0.08264759, 0.8784314, 0, 1, 1,
0.857263, -1.822993, 5.485627, 0.8823529, 0, 1, 1,
0.8580758, 1.228216, 0.9157362, 0.8901961, 0, 1, 1,
0.859421, 0.4324945, 1.301637, 0.8941177, 0, 1, 1,
0.8602758, -2.15782, 1.19791, 0.9019608, 0, 1, 1,
0.8687228, 0.5830222, 1.28484, 0.9098039, 0, 1, 1,
0.8709612, -0.179688, 1.57764, 0.9137255, 0, 1, 1,
0.8724251, 1.085756, 0.7762939, 0.9215686, 0, 1, 1,
0.8744205, 0.4011746, -0.5919532, 0.9254902, 0, 1, 1,
0.8812278, 0.105357, 0.7619427, 0.9333333, 0, 1, 1,
0.8820366, -1.552484, 3.09918, 0.9372549, 0, 1, 1,
0.8827097, -1.549057, 3.921649, 0.945098, 0, 1, 1,
0.8948943, -0.03279398, 2.181828, 0.9490196, 0, 1, 1,
0.8951338, -1.488075, 1.550429, 0.9568627, 0, 1, 1,
0.9010364, 0.028801, 1.329756, 0.9607843, 0, 1, 1,
0.9041957, 0.7673032, 2.106545, 0.9686275, 0, 1, 1,
0.9059209, -0.6603772, 1.510419, 0.972549, 0, 1, 1,
0.9127873, -0.9160835, 1.40943, 0.9803922, 0, 1, 1,
0.916616, 0.8730463, 2.270687, 0.9843137, 0, 1, 1,
0.9191094, -1.824679, 2.085588, 0.9921569, 0, 1, 1,
0.9245145, -1.138527, 2.820922, 0.9960784, 0, 1, 1,
0.9313123, -0.6093192, 1.580864, 1, 0, 0.9960784, 1,
0.9342731, 0.1768756, -1.336689, 1, 0, 0.9882353, 1,
0.9465884, -1.339565, 1.348845, 1, 0, 0.9843137, 1,
0.9552807, 0.06566151, 2.49011, 1, 0, 0.9764706, 1,
0.9571149, -1.415879, 2.165316, 1, 0, 0.972549, 1,
0.9606291, 0.4292321, 0.1262771, 1, 0, 0.9647059, 1,
0.9635509, -1.577299, 2.999285, 1, 0, 0.9607843, 1,
0.9640809, -0.243809, 1.149844, 1, 0, 0.9529412, 1,
0.9664583, -0.6304584, 1.668121, 1, 0, 0.9490196, 1,
0.9705836, -0.8287096, 2.258807, 1, 0, 0.9411765, 1,
0.9874679, 1.272313, 0.8032574, 1, 0, 0.9372549, 1,
0.9877437, -0.4273097, 1.79401, 1, 0, 0.9294118, 1,
0.9880239, -0.3827183, 0.8993238, 1, 0, 0.9254902, 1,
0.9890503, 0.5249045, 0.9112539, 1, 0, 0.9176471, 1,
0.9967175, 0.825229, 2.392883, 1, 0, 0.9137255, 1,
1.012462, -1.035002, 2.363131, 1, 0, 0.9058824, 1,
1.013196, -0.08170199, 3.455142, 1, 0, 0.9019608, 1,
1.024703, 0.7193909, -0.588352, 1, 0, 0.8941177, 1,
1.025622, -0.1107615, 3.01486, 1, 0, 0.8862745, 1,
1.025761, -0.6265116, 2.835067, 1, 0, 0.8823529, 1,
1.028274, -0.6266049, 2.364176, 1, 0, 0.8745098, 1,
1.029893, 0.3773321, 1.870633, 1, 0, 0.8705882, 1,
1.034017, -1.207723, 1.883364, 1, 0, 0.8627451, 1,
1.035624, -0.5494441, 2.326356, 1, 0, 0.8588235, 1,
1.035965, -0.5398328, 2.512715, 1, 0, 0.8509804, 1,
1.038927, -0.09093221, 2.007022, 1, 0, 0.8470588, 1,
1.056041, 0.3889206, 1.160618, 1, 0, 0.8392157, 1,
1.064876, -1.135752, 4.075702, 1, 0, 0.8352941, 1,
1.070653, 0.1272639, -0.1998871, 1, 0, 0.827451, 1,
1.071939, -1.836601, 3.346346, 1, 0, 0.8235294, 1,
1.079121, -0.4301003, 2.688316, 1, 0, 0.8156863, 1,
1.081015, 0.9289397, -0.4397253, 1, 0, 0.8117647, 1,
1.09592, 0.7770367, 1.825936, 1, 0, 0.8039216, 1,
1.097743, 0.8080009, 1.232886, 1, 0, 0.7960784, 1,
1.099846, -0.9467618, 1.232333, 1, 0, 0.7921569, 1,
1.109197, -0.3913105, 3.89707, 1, 0, 0.7843137, 1,
1.120307, -0.8917525, 4.138017, 1, 0, 0.7803922, 1,
1.146402, 0.4284059, 0.6741261, 1, 0, 0.772549, 1,
1.155838, -0.488925, 0.479421, 1, 0, 0.7686275, 1,
1.158193, 0.6299089, 1.950725, 1, 0, 0.7607843, 1,
1.163197, -1.305, 1.286905, 1, 0, 0.7568628, 1,
1.175352, 0.3420258, 0.2813986, 1, 0, 0.7490196, 1,
1.185485, -0.7849354, 2.241183, 1, 0, 0.7450981, 1,
1.19388, 0.199264, 1.756586, 1, 0, 0.7372549, 1,
1.196654, 0.1724251, 0.1828797, 1, 0, 0.7333333, 1,
1.199762, 0.6205423, 1.885231, 1, 0, 0.7254902, 1,
1.204734, -0.4096932, 3.167345, 1, 0, 0.7215686, 1,
1.205803, 0.02339706, 1.14532, 1, 0, 0.7137255, 1,
1.207368, 0.4342646, 3.391465, 1, 0, 0.7098039, 1,
1.209195, -3.238445, 1.78012, 1, 0, 0.7019608, 1,
1.210352, -0.4066637, 2.173537, 1, 0, 0.6941177, 1,
1.214629, 1.098858, 0.5786499, 1, 0, 0.6901961, 1,
1.218066, 0.4793701, 1.749954, 1, 0, 0.682353, 1,
1.222045, -1.595945, 1.303128, 1, 0, 0.6784314, 1,
1.226, 1.601454, 1.518798, 1, 0, 0.6705883, 1,
1.231913, -0.603133, 2.937237, 1, 0, 0.6666667, 1,
1.235731, -0.9161335, 0.5759125, 1, 0, 0.6588235, 1,
1.257059, 2.644496, 1.206339, 1, 0, 0.654902, 1,
1.265593, 0.421186, 1.377935, 1, 0, 0.6470588, 1,
1.266929, -0.3672319, 2.114519, 1, 0, 0.6431373, 1,
1.269743, 0.2698754, 2.137952, 1, 0, 0.6352941, 1,
1.271327, -0.2829975, 3.212276, 1, 0, 0.6313726, 1,
1.276656, -0.2587224, 2.649639, 1, 0, 0.6235294, 1,
1.282345, -0.5107324, 1.788582, 1, 0, 0.6196079, 1,
1.288903, 1.161705, 1.103688, 1, 0, 0.6117647, 1,
1.296358, -1.050824, 3.558925, 1, 0, 0.6078432, 1,
1.322729, -1.161271, 2.137291, 1, 0, 0.6, 1,
1.330669, 1.257581, 1.373903, 1, 0, 0.5921569, 1,
1.336146, -1.024056, 2.035378, 1, 0, 0.5882353, 1,
1.338586, 0.7997146, 2.268116, 1, 0, 0.5803922, 1,
1.346953, 0.3871273, 3.079734, 1, 0, 0.5764706, 1,
1.347854, 0.113198, 1.334668, 1, 0, 0.5686275, 1,
1.354995, -0.6804526, 2.249237, 1, 0, 0.5647059, 1,
1.357182, -2.263712, 0.8613446, 1, 0, 0.5568628, 1,
1.363657, 1.597439, 0.8466529, 1, 0, 0.5529412, 1,
1.363664, 0.003546992, 1.826753, 1, 0, 0.5450981, 1,
1.371652, 0.5391396, 2.257038, 1, 0, 0.5411765, 1,
1.375602, -0.4338227, 0.8729835, 1, 0, 0.5333334, 1,
1.384947, -0.005617313, 0.6512762, 1, 0, 0.5294118, 1,
1.392253, -0.4125653, 2.238867, 1, 0, 0.5215687, 1,
1.395542, 1.352455, -0.7829763, 1, 0, 0.5176471, 1,
1.395904, 0.3973573, 1.555663, 1, 0, 0.509804, 1,
1.396773, -0.3316725, 0.4997303, 1, 0, 0.5058824, 1,
1.400643, -0.1605325, -0.08959484, 1, 0, 0.4980392, 1,
1.404086, 0.3722143, 0.9890317, 1, 0, 0.4901961, 1,
1.404091, -1.094851, 3.375171, 1, 0, 0.4862745, 1,
1.406478, 0.2650227, 2.924611, 1, 0, 0.4784314, 1,
1.413536, -1.656662, 3.905667, 1, 0, 0.4745098, 1,
1.418095, -0.7474549, 2.588172, 1, 0, 0.4666667, 1,
1.423675, 0.7858661, 1.696091, 1, 0, 0.4627451, 1,
1.425125, 0.1748643, 1.462512, 1, 0, 0.454902, 1,
1.43865, 1.896645, -1.464402, 1, 0, 0.4509804, 1,
1.450396, -0.2558548, 3.11085, 1, 0, 0.4431373, 1,
1.456093, 1.863065, 1.73631, 1, 0, 0.4392157, 1,
1.456467, 0.7285698, 1.263081, 1, 0, 0.4313726, 1,
1.47314, 1.716395, 0.7366994, 1, 0, 0.427451, 1,
1.479713, -0.07656582, 1.786579, 1, 0, 0.4196078, 1,
1.480716, 0.1045911, 1.980588, 1, 0, 0.4156863, 1,
1.481665, 0.4832532, 1.308275, 1, 0, 0.4078431, 1,
1.485979, 0.06864221, 1.89957, 1, 0, 0.4039216, 1,
1.492623, 0.9799403, 2.636838, 1, 0, 0.3960784, 1,
1.495018, 0.1835886, 4.382777, 1, 0, 0.3882353, 1,
1.502479, -1.271186, 2.74227, 1, 0, 0.3843137, 1,
1.505067, 0.3920867, 1.524852, 1, 0, 0.3764706, 1,
1.509294, -0.1296668, 1.152401, 1, 0, 0.372549, 1,
1.526787, 0.860482, 0.6889178, 1, 0, 0.3647059, 1,
1.527237, 0.354893, 1.42261, 1, 0, 0.3607843, 1,
1.541446, -0.1893904, 3.47137, 1, 0, 0.3529412, 1,
1.548648, 1.937301, -1.433653, 1, 0, 0.3490196, 1,
1.548865, 0.3183004, 2.395192, 1, 0, 0.3411765, 1,
1.552691, 1.916578, -0.3454386, 1, 0, 0.3372549, 1,
1.568105, -1.298133, 3.649493, 1, 0, 0.3294118, 1,
1.579274, 1.609229, 2.770844, 1, 0, 0.3254902, 1,
1.5812, -1.26794, 4.580824, 1, 0, 0.3176471, 1,
1.581421, -0.04529953, 0.000740217, 1, 0, 0.3137255, 1,
1.602554, 0.4000505, 1.490694, 1, 0, 0.3058824, 1,
1.608761, -0.5745375, 2.275623, 1, 0, 0.2980392, 1,
1.64257, -0.7915336, 1.477766, 1, 0, 0.2941177, 1,
1.65116, 0.0453051, 1.102205, 1, 0, 0.2862745, 1,
1.670545, -1.014832, 0.2930021, 1, 0, 0.282353, 1,
1.692732, 0.9022799, 2.302742, 1, 0, 0.2745098, 1,
1.701608, 1.041822, 2.837111, 1, 0, 0.2705882, 1,
1.735727, -2.296154, 3.335157, 1, 0, 0.2627451, 1,
1.754213, -0.7312219, 2.76743, 1, 0, 0.2588235, 1,
1.75851, 2.387795, -1.593117, 1, 0, 0.2509804, 1,
1.771138, -1.14436, 3.408609, 1, 0, 0.2470588, 1,
1.771972, -1.314453, 1.931618, 1, 0, 0.2392157, 1,
1.781414, -1.204103, 1.859774, 1, 0, 0.2352941, 1,
1.798725, -0.2144814, 2.05445, 1, 0, 0.227451, 1,
1.802189, 0.4473852, 3.260431, 1, 0, 0.2235294, 1,
1.81279, -0.4043358, 1.180193, 1, 0, 0.2156863, 1,
1.818819, 1.246953, 0.2513514, 1, 0, 0.2117647, 1,
1.837173, -1.767722, 2.371413, 1, 0, 0.2039216, 1,
1.90243, 1.482994, 1.554399, 1, 0, 0.1960784, 1,
1.918853, 1.112469, 0.7729045, 1, 0, 0.1921569, 1,
1.921378, -0.234043, 0.8123006, 1, 0, 0.1843137, 1,
1.93958, -1.064316, 0.8631704, 1, 0, 0.1803922, 1,
1.940071, -1.099561, 0.9410387, 1, 0, 0.172549, 1,
1.964745, -0.6480956, 3.37921, 1, 0, 0.1686275, 1,
1.970354, -0.06550874, 1.414325, 1, 0, 0.1607843, 1,
2.023776, -1.513819, 2.788238, 1, 0, 0.1568628, 1,
2.025151, 1.919989, 0.5552148, 1, 0, 0.1490196, 1,
2.096112, 0.982664, -0.008223202, 1, 0, 0.145098, 1,
2.100118, -0.591571, 3.124938, 1, 0, 0.1372549, 1,
2.111585, -0.4205179, 0.2881385, 1, 0, 0.1333333, 1,
2.138497, 0.1320366, 0.9622229, 1, 0, 0.1254902, 1,
2.150129, -0.6825033, 3.043847, 1, 0, 0.1215686, 1,
2.190447, 2.418118, 0.7296324, 1, 0, 0.1137255, 1,
2.19215, 2.753783, -0.4308519, 1, 0, 0.1098039, 1,
2.205613, 0.6136658, 0.3194711, 1, 0, 0.1019608, 1,
2.230207, 1.529644, -0.9798018, 1, 0, 0.09411765, 1,
2.284305, 1.134869, -0.3560944, 1, 0, 0.09019608, 1,
2.33963, -0.2019957, 1.151664, 1, 0, 0.08235294, 1,
2.355254, 2.060982, 1.557325, 1, 0, 0.07843138, 1,
2.39475, -1.006337, 0.7713624, 1, 0, 0.07058824, 1,
2.397953, -0.2704944, 0.9084417, 1, 0, 0.06666667, 1,
2.405918, -0.07025494, 3.63374, 1, 0, 0.05882353, 1,
2.430914, 1.68947, -0.07835091, 1, 0, 0.05490196, 1,
2.478159, 1.324261, 2.747234, 1, 0, 0.04705882, 1,
2.537746, 0.2633443, 1.836691, 1, 0, 0.04313726, 1,
2.607133, -1.48904, 1.95923, 1, 0, 0.03529412, 1,
2.720905, -0.1255804, 0.1042403, 1, 0, 0.03137255, 1,
2.72846, 1.161141, 1.132593, 1, 0, 0.02352941, 1,
2.821595, 0.7879396, 0.9734169, 1, 0, 0.01960784, 1,
2.832613, -1.745546, 1.630262, 1, 0, 0.01176471, 1,
3.190736, -0.4912999, 1.022191, 1, 0, 0.007843138, 1
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
-0.08753204, -4.49893, -7.859838, 0, -0.5, 0.5, 0.5,
-0.08753204, -4.49893, -7.859838, 1, -0.5, 0.5, 0.5,
-0.08753204, -4.49893, -7.859838, 1, 1.5, 0.5, 0.5,
-0.08753204, -4.49893, -7.859838, 0, 1.5, 0.5, 0.5
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
-4.477133, 0.2630802, -7.859838, 0, -0.5, 0.5, 0.5,
-4.477133, 0.2630802, -7.859838, 1, -0.5, 0.5, 0.5,
-4.477133, 0.2630802, -7.859838, 1, 1.5, 0.5, 0.5,
-4.477133, 0.2630802, -7.859838, 0, 1.5, 0.5, 0.5
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
-4.477133, -4.49893, -0.2200015, 0, -0.5, 0.5, 0.5,
-4.477133, -4.49893, -0.2200015, 1, -0.5, 0.5, 0.5,
-4.477133, -4.49893, -0.2200015, 1, 1.5, 0.5, 0.5,
-4.477133, -4.49893, -0.2200015, 0, 1.5, 0.5, 0.5
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
-3, -3.400004, -6.096798,
3, -3.400004, -6.096798,
-3, -3.400004, -6.096798,
-3, -3.583158, -6.390638,
-2, -3.400004, -6.096798,
-2, -3.583158, -6.390638,
-1, -3.400004, -6.096798,
-1, -3.583158, -6.390638,
0, -3.400004, -6.096798,
0, -3.583158, -6.390638,
1, -3.400004, -6.096798,
1, -3.583158, -6.390638,
2, -3.400004, -6.096798,
2, -3.583158, -6.390638,
3, -3.400004, -6.096798,
3, -3.583158, -6.390638
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
-3, -3.949467, -6.978318, 0, -0.5, 0.5, 0.5,
-3, -3.949467, -6.978318, 1, -0.5, 0.5, 0.5,
-3, -3.949467, -6.978318, 1, 1.5, 0.5, 0.5,
-3, -3.949467, -6.978318, 0, 1.5, 0.5, 0.5,
-2, -3.949467, -6.978318, 0, -0.5, 0.5, 0.5,
-2, -3.949467, -6.978318, 1, -0.5, 0.5, 0.5,
-2, -3.949467, -6.978318, 1, 1.5, 0.5, 0.5,
-2, -3.949467, -6.978318, 0, 1.5, 0.5, 0.5,
-1, -3.949467, -6.978318, 0, -0.5, 0.5, 0.5,
-1, -3.949467, -6.978318, 1, -0.5, 0.5, 0.5,
-1, -3.949467, -6.978318, 1, 1.5, 0.5, 0.5,
-1, -3.949467, -6.978318, 0, 1.5, 0.5, 0.5,
0, -3.949467, -6.978318, 0, -0.5, 0.5, 0.5,
0, -3.949467, -6.978318, 1, -0.5, 0.5, 0.5,
0, -3.949467, -6.978318, 1, 1.5, 0.5, 0.5,
0, -3.949467, -6.978318, 0, 1.5, 0.5, 0.5,
1, -3.949467, -6.978318, 0, -0.5, 0.5, 0.5,
1, -3.949467, -6.978318, 1, -0.5, 0.5, 0.5,
1, -3.949467, -6.978318, 1, 1.5, 0.5, 0.5,
1, -3.949467, -6.978318, 0, 1.5, 0.5, 0.5,
2, -3.949467, -6.978318, 0, -0.5, 0.5, 0.5,
2, -3.949467, -6.978318, 1, -0.5, 0.5, 0.5,
2, -3.949467, -6.978318, 1, 1.5, 0.5, 0.5,
2, -3.949467, -6.978318, 0, 1.5, 0.5, 0.5,
3, -3.949467, -6.978318, 0, -0.5, 0.5, 0.5,
3, -3.949467, -6.978318, 1, -0.5, 0.5, 0.5,
3, -3.949467, -6.978318, 1, 1.5, 0.5, 0.5,
3, -3.949467, -6.978318, 0, 1.5, 0.5, 0.5
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
-3.464149, -2, -6.096798,
-3.464149, 2, -6.096798,
-3.464149, -2, -6.096798,
-3.632979, -2, -6.390638,
-3.464149, 0, -6.096798,
-3.632979, 0, -6.390638,
-3.464149, 2, -6.096798,
-3.632979, 2, -6.390638
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
-3.970641, -2, -6.978318, 0, -0.5, 0.5, 0.5,
-3.970641, -2, -6.978318, 1, -0.5, 0.5, 0.5,
-3.970641, -2, -6.978318, 1, 1.5, 0.5, 0.5,
-3.970641, -2, -6.978318, 0, 1.5, 0.5, 0.5,
-3.970641, 0, -6.978318, 0, -0.5, 0.5, 0.5,
-3.970641, 0, -6.978318, 1, -0.5, 0.5, 0.5,
-3.970641, 0, -6.978318, 1, 1.5, 0.5, 0.5,
-3.970641, 0, -6.978318, 0, 1.5, 0.5, 0.5,
-3.970641, 2, -6.978318, 0, -0.5, 0.5, 0.5,
-3.970641, 2, -6.978318, 1, -0.5, 0.5, 0.5,
-3.970641, 2, -6.978318, 1, 1.5, 0.5, 0.5,
-3.970641, 2, -6.978318, 0, 1.5, 0.5, 0.5
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
-3.464149, -3.400004, -4,
-3.464149, -3.400004, 4,
-3.464149, -3.400004, -4,
-3.632979, -3.583158, -4,
-3.464149, -3.400004, -2,
-3.632979, -3.583158, -2,
-3.464149, -3.400004, 0,
-3.632979, -3.583158, 0,
-3.464149, -3.400004, 2,
-3.632979, -3.583158, 2,
-3.464149, -3.400004, 4,
-3.632979, -3.583158, 4
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
-3.970641, -3.949467, -4, 0, -0.5, 0.5, 0.5,
-3.970641, -3.949467, -4, 1, -0.5, 0.5, 0.5,
-3.970641, -3.949467, -4, 1, 1.5, 0.5, 0.5,
-3.970641, -3.949467, -4, 0, 1.5, 0.5, 0.5,
-3.970641, -3.949467, -2, 0, -0.5, 0.5, 0.5,
-3.970641, -3.949467, -2, 1, -0.5, 0.5, 0.5,
-3.970641, -3.949467, -2, 1, 1.5, 0.5, 0.5,
-3.970641, -3.949467, -2, 0, 1.5, 0.5, 0.5,
-3.970641, -3.949467, 0, 0, -0.5, 0.5, 0.5,
-3.970641, -3.949467, 0, 1, -0.5, 0.5, 0.5,
-3.970641, -3.949467, 0, 1, 1.5, 0.5, 0.5,
-3.970641, -3.949467, 0, 0, 1.5, 0.5, 0.5,
-3.970641, -3.949467, 2, 0, -0.5, 0.5, 0.5,
-3.970641, -3.949467, 2, 1, -0.5, 0.5, 0.5,
-3.970641, -3.949467, 2, 1, 1.5, 0.5, 0.5,
-3.970641, -3.949467, 2, 0, 1.5, 0.5, 0.5,
-3.970641, -3.949467, 4, 0, -0.5, 0.5, 0.5,
-3.970641, -3.949467, 4, 1, -0.5, 0.5, 0.5,
-3.970641, -3.949467, 4, 1, 1.5, 0.5, 0.5,
-3.970641, -3.949467, 4, 0, 1.5, 0.5, 0.5
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
-3.464149, -3.400004, -6.096798,
-3.464149, 3.926165, -6.096798,
-3.464149, -3.400004, 5.656796,
-3.464149, 3.926165, 5.656796,
-3.464149, -3.400004, -6.096798,
-3.464149, -3.400004, 5.656796,
-3.464149, 3.926165, -6.096798,
-3.464149, 3.926165, 5.656796,
-3.464149, -3.400004, -6.096798,
3.289084, -3.400004, -6.096798,
-3.464149, -3.400004, 5.656796,
3.289084, -3.400004, 5.656796,
-3.464149, 3.926165, -6.096798,
3.289084, 3.926165, -6.096798,
-3.464149, 3.926165, 5.656796,
3.289084, 3.926165, 5.656796,
3.289084, -3.400004, -6.096798,
3.289084, 3.926165, -6.096798,
3.289084, -3.400004, 5.656796,
3.289084, 3.926165, 5.656796,
3.289084, -3.400004, -6.096798,
3.289084, -3.400004, 5.656796,
3.289084, 3.926165, -6.096798,
3.289084, 3.926165, 5.656796
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
var radius = 8.227909;
var distance = 36.6069;
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
mvMatrix.translate( 0.08753204, -0.2630802, 0.2200015 );
mvMatrix.scale( 1.317321, 1.214301, 0.7568899 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.6069);
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
dichloromethane<-read.table("dichloromethane.xyz")
```

```
## Error in read.table("dichloromethane.xyz"): no lines available in input
```

```r
x<-dichloromethane$V2
```

```
## Error in eval(expr, envir, enclos): object 'dichloromethane' not found
```

```r
y<-dichloromethane$V3
```

```
## Error in eval(expr, envir, enclos): object 'dichloromethane' not found
```

```r
z<-dichloromethane$V4
```

```
## Error in eval(expr, envir, enclos): object 'dichloromethane' not found
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
-3.3658, 0.5961097, -2.425925, 0, 0, 1, 1, 1,
-2.822113, -0.7314476, -1.683257, 1, 0, 0, 1, 1,
-2.742648, 0.9378279, -1.938621, 1, 0, 0, 1, 1,
-2.610679, -1.236581, -0.5251699, 1, 0, 0, 1, 1,
-2.474252, -0.203454, -2.135648, 1, 0, 0, 1, 1,
-2.464809, 0.3247589, 0.4605876, 1, 0, 0, 1, 1,
-2.446404, -0.7259871, -4.250793, 0, 0, 0, 1, 1,
-2.370679, 0.3962154, -0.7598844, 0, 0, 0, 1, 1,
-2.369397, -0.2938792, -2.494495, 0, 0, 0, 1, 1,
-2.335012, 1.525498, -1.092167, 0, 0, 0, 1, 1,
-2.308895, -0.8534144, -3.327722, 0, 0, 0, 1, 1,
-2.278597, 0.7056434, -2.112615, 0, 0, 0, 1, 1,
-2.277045, 0.197596, -1.679029, 0, 0, 0, 1, 1,
-2.212566, -1.078441, -4.027788, 1, 1, 1, 1, 1,
-2.178555, 0.1623098, -1.902287, 1, 1, 1, 1, 1,
-2.177709, -1.187412, -1.402254, 1, 1, 1, 1, 1,
-2.161438, 0.5537152, 0.5023357, 1, 1, 1, 1, 1,
-2.150272, -0.738133, 0.1192436, 1, 1, 1, 1, 1,
-2.148052, 0.174961, -1.95473, 1, 1, 1, 1, 1,
-2.144275, -0.007243912, -2.043765, 1, 1, 1, 1, 1,
-2.125686, 0.5197083, -1.439899, 1, 1, 1, 1, 1,
-2.116441, -0.5074646, -2.113736, 1, 1, 1, 1, 1,
-2.103911, 0.943376, -0.3413173, 1, 1, 1, 1, 1,
-2.093503, -0.1636979, -0.3058959, 1, 1, 1, 1, 1,
-2.071546, -0.7448909, -2.301752, 1, 1, 1, 1, 1,
-2.061105, 0.7611918, -1.559673, 1, 1, 1, 1, 1,
-2.020156, 0.05002393, -3.150748, 1, 1, 1, 1, 1,
-2.009423, -0.2921733, -2.947549, 1, 1, 1, 1, 1,
-1.975338, -0.5855179, -0.9542685, 0, 0, 1, 1, 1,
-1.960802, 0.918232, -1.010945, 1, 0, 0, 1, 1,
-1.946845, 1.019285, -0.3699672, 1, 0, 0, 1, 1,
-1.942893, 0.6232228, -0.274562, 1, 0, 0, 1, 1,
-1.933546, 0.7736843, -2.175368, 1, 0, 0, 1, 1,
-1.931138, -1.613595, -0.218168, 1, 0, 0, 1, 1,
-1.912424, -1.279695, -2.332354, 0, 0, 0, 1, 1,
-1.910245, 1.976001, -0.4021325, 0, 0, 0, 1, 1,
-1.885605, -0.3698656, -2.715219, 0, 0, 0, 1, 1,
-1.881845, 0.4093693, -1.555973, 0, 0, 0, 1, 1,
-1.87205, -1.9547, -2.105858, 0, 0, 0, 1, 1,
-1.861085, -0.1868971, -0.04727087, 0, 0, 0, 1, 1,
-1.848477, -1.390127, -3.26098, 0, 0, 0, 1, 1,
-1.836564, -0.1951505, 0.4325878, 1, 1, 1, 1, 1,
-1.763596, 1.486896, -2.060166, 1, 1, 1, 1, 1,
-1.755596, -1.606858, -2.440376, 1, 1, 1, 1, 1,
-1.743661, 2.211967, -2.5897, 1, 1, 1, 1, 1,
-1.740684, 0.2572722, -3.958182, 1, 1, 1, 1, 1,
-1.729871, -2.119064, -2.705558, 1, 1, 1, 1, 1,
-1.720643, 0.776774, -1.411567, 1, 1, 1, 1, 1,
-1.717776, -1.002891, -1.720465, 1, 1, 1, 1, 1,
-1.717713, -0.1145548, -0.3252041, 1, 1, 1, 1, 1,
-1.71471, -0.1730541, -1.181396, 1, 1, 1, 1, 1,
-1.709093, -0.5434704, -1.626573, 1, 1, 1, 1, 1,
-1.692181, 0.2797869, -3.80545, 1, 1, 1, 1, 1,
-1.687767, -0.8896997, -2.714574, 1, 1, 1, 1, 1,
-1.677084, 0.2546609, -2.396503, 1, 1, 1, 1, 1,
-1.67353, -1.647456, -2.428433, 1, 1, 1, 1, 1,
-1.66949, 0.4019918, -1.153212, 0, 0, 1, 1, 1,
-1.66251, 1.11501, 0.1221653, 1, 0, 0, 1, 1,
-1.659877, -0.6701965, -0.5027629, 1, 0, 0, 1, 1,
-1.646193, -0.2059006, -3.015235, 1, 0, 0, 1, 1,
-1.643921, 0.4469069, -1.537231, 1, 0, 0, 1, 1,
-1.641219, -0.3975942, -2.888562, 1, 0, 0, 1, 1,
-1.63959, 1.593232, -0.4974157, 0, 0, 0, 1, 1,
-1.631126, 0.5495118, -0.2736618, 0, 0, 0, 1, 1,
-1.610484, -0.5406922, -1.110064, 0, 0, 0, 1, 1,
-1.608799, 1.048516, -0.9142125, 0, 0, 0, 1, 1,
-1.603044, -0.4400187, -2.411615, 0, 0, 0, 1, 1,
-1.593054, -0.4177675, -3.45515, 0, 0, 0, 1, 1,
-1.591739, -0.4180206, -1.433974, 0, 0, 0, 1, 1,
-1.584937, -0.2570179, -1.728208, 1, 1, 1, 1, 1,
-1.584454, 0.9730971, -1.685009, 1, 1, 1, 1, 1,
-1.567371, 1.680068, -0.3987103, 1, 1, 1, 1, 1,
-1.545952, 0.4406787, -3.66428, 1, 1, 1, 1, 1,
-1.542636, 1.285398, -1.374186, 1, 1, 1, 1, 1,
-1.529641, 0.7735058, -1.329776, 1, 1, 1, 1, 1,
-1.514392, -0.5250868, -2.79504, 1, 1, 1, 1, 1,
-1.501276, 0.9628847, -0.3612096, 1, 1, 1, 1, 1,
-1.500575, 0.8768814, -1.903924, 1, 1, 1, 1, 1,
-1.497211, 1.498749, 1.472014, 1, 1, 1, 1, 1,
-1.472509, 0.6321383, -1.036311, 1, 1, 1, 1, 1,
-1.467725, 1.089575, 0.4963079, 1, 1, 1, 1, 1,
-1.46468, -0.8689776, -2.107177, 1, 1, 1, 1, 1,
-1.464284, 0.02953605, -1.27913, 1, 1, 1, 1, 1,
-1.45993, -0.5900441, -3.645336, 1, 1, 1, 1, 1,
-1.455366, -1.297808, -3.118042, 0, 0, 1, 1, 1,
-1.442503, 2.16557, -1.241852, 1, 0, 0, 1, 1,
-1.429221, -0.1430812, -0.8033774, 1, 0, 0, 1, 1,
-1.427665, -0.8309529, -2.531988, 1, 0, 0, 1, 1,
-1.421373, -0.1383529, -1.33775, 1, 0, 0, 1, 1,
-1.419807, 1.197218, -0.1042822, 1, 0, 0, 1, 1,
-1.401337, -0.6821708, -0.2831879, 0, 0, 0, 1, 1,
-1.388087, -0.01978465, -1.709332, 0, 0, 0, 1, 1,
-1.373543, -0.7901061, -3.154509, 0, 0, 0, 1, 1,
-1.365859, -0.401117, -1.34985, 0, 0, 0, 1, 1,
-1.355142, 1.569784, -0.1471394, 0, 0, 0, 1, 1,
-1.350614, -0.3727038, -3.935506, 0, 0, 0, 1, 1,
-1.333931, 0.5612625, -1.309314, 0, 0, 0, 1, 1,
-1.329867, 0.5407704, -2.331052, 1, 1, 1, 1, 1,
-1.327378, 0.8637397, -0.2122112, 1, 1, 1, 1, 1,
-1.325694, 0.6511272, -0.1670425, 1, 1, 1, 1, 1,
-1.32313, -1.031237, -2.832328, 1, 1, 1, 1, 1,
-1.309749, -0.05955382, -2.300138, 1, 1, 1, 1, 1,
-1.308981, 0.8939592, -1.186777, 1, 1, 1, 1, 1,
-1.29232, 1.170256, 0.7218038, 1, 1, 1, 1, 1,
-1.282976, -0.46927, -1.931731, 1, 1, 1, 1, 1,
-1.282084, 3.819473, -1.030367, 1, 1, 1, 1, 1,
-1.281658, 0.9692322, -2.452307, 1, 1, 1, 1, 1,
-1.28132, -0.8026217, -1.455403, 1, 1, 1, 1, 1,
-1.279151, 0.5467989, -1.05748, 1, 1, 1, 1, 1,
-1.271529, -0.587793, -2.453235, 1, 1, 1, 1, 1,
-1.264271, -1.226302, -3.035451, 1, 1, 1, 1, 1,
-1.255637, -1.370417, -1.999349, 1, 1, 1, 1, 1,
-1.249748, 0.4608741, 0.251595, 0, 0, 1, 1, 1,
-1.245852, -1.188917, -1.375036, 1, 0, 0, 1, 1,
-1.236006, 0.6318407, -0.6525031, 1, 0, 0, 1, 1,
-1.227468, -0.4201064, -2.270647, 1, 0, 0, 1, 1,
-1.221583, 0.5637873, -0.6802452, 1, 0, 0, 1, 1,
-1.221516, -1.021209, -3.087071, 1, 0, 0, 1, 1,
-1.219638, 1.623301, -0.3477244, 0, 0, 0, 1, 1,
-1.218967, 1.265185, -0.3013358, 0, 0, 0, 1, 1,
-1.216035, -0.9371437, -0.7675703, 0, 0, 0, 1, 1,
-1.209265, 0.4232729, -1.373193, 0, 0, 0, 1, 1,
-1.190285, 0.7463015, -0.9254031, 0, 0, 0, 1, 1,
-1.18717, 0.2806314, -1.517394, 0, 0, 0, 1, 1,
-1.186735, -0.9615302, -1.71097, 0, 0, 0, 1, 1,
-1.185982, -0.625773, -0.07135585, 1, 1, 1, 1, 1,
-1.184127, 0.7045942, 0.4580399, 1, 1, 1, 1, 1,
-1.182637, -0.06992912, -1.573098, 1, 1, 1, 1, 1,
-1.177113, 1.758164, 0.7374014, 1, 1, 1, 1, 1,
-1.173004, -0.1672251, -0.741401, 1, 1, 1, 1, 1,
-1.169637, -1.187284, -2.173422, 1, 1, 1, 1, 1,
-1.165702, -0.2205041, -2.677567, 1, 1, 1, 1, 1,
-1.159951, -1.586314, -4.140522, 1, 1, 1, 1, 1,
-1.1559, -0.4478576, -4.233808, 1, 1, 1, 1, 1,
-1.149599, 0.522839, -1.75081, 1, 1, 1, 1, 1,
-1.142318, 1.746068, -0.07495007, 1, 1, 1, 1, 1,
-1.136874, 0.3368872, -1.601323, 1, 1, 1, 1, 1,
-1.135992, 1.254827, 0.1254506, 1, 1, 1, 1, 1,
-1.134529, 0.6017218, -2.05472, 1, 1, 1, 1, 1,
-1.132275, -0.1975167, -2.224654, 1, 1, 1, 1, 1,
-1.120451, 0.8479114, 0.4699864, 0, 0, 1, 1, 1,
-1.120234, 0.9895843, 0.3966376, 1, 0, 0, 1, 1,
-1.119192, 0.1864363, -0.6173474, 1, 0, 0, 1, 1,
-1.116835, 0.4112206, -2.64409, 1, 0, 0, 1, 1,
-1.102565, 0.7676114, -0.4241808, 1, 0, 0, 1, 1,
-1.099883, -1.152427, -3.723852, 1, 0, 0, 1, 1,
-1.088022, -1.190081, -1.959751, 0, 0, 0, 1, 1,
-1.07742, 0.215142, -0.1925094, 0, 0, 0, 1, 1,
-1.073161, 1.080701, -0.833329, 0, 0, 0, 1, 1,
-1.072204, 0.8583931, -2.013542, 0, 0, 0, 1, 1,
-1.06969, -0.2990199, -1.909144, 0, 0, 0, 1, 1,
-1.069241, -0.0224961, 0.6704206, 0, 0, 0, 1, 1,
-1.067773, 2.021382, 0.4572343, 0, 0, 0, 1, 1,
-1.066167, -0.1591563, -2.681668, 1, 1, 1, 1, 1,
-1.065816, 0.2188715, -2.037354, 1, 1, 1, 1, 1,
-1.060959, -0.07521681, -1.60492, 1, 1, 1, 1, 1,
-1.059757, 1.720812, -2.09197, 1, 1, 1, 1, 1,
-1.039309, 0.2712649, -1.896685, 1, 1, 1, 1, 1,
-1.034097, -1.559536, -2.714734, 1, 1, 1, 1, 1,
-1.029509, 1.013938, -0.3787974, 1, 1, 1, 1, 1,
-1.027645, 0.2142334, -0.6372169, 1, 1, 1, 1, 1,
-1.024593, -0.348137, -1.773835, 1, 1, 1, 1, 1,
-1.013923, -0.3029092, -1.321567, 1, 1, 1, 1, 1,
-1.01018, 0.4572547, -0.8344205, 1, 1, 1, 1, 1,
-1.006982, -1.015141, -1.044136, 1, 1, 1, 1, 1,
-1.006946, -1.43038, -3.571164, 1, 1, 1, 1, 1,
-1.000629, 0.5661782, -1.30773, 1, 1, 1, 1, 1,
-1.000373, -0.4412065, -1.36269, 1, 1, 1, 1, 1,
-0.9998911, 0.6594828, -1.411804, 0, 0, 1, 1, 1,
-0.9946266, -0.4943378, -1.143826, 1, 0, 0, 1, 1,
-0.9906279, -0.1036236, -1.263902, 1, 0, 0, 1, 1,
-0.9855012, 0.3919895, -1.767746, 1, 0, 0, 1, 1,
-0.9849436, 1.503332, -0.9727124, 1, 0, 0, 1, 1,
-0.9818702, 2.583659, -0.2672448, 1, 0, 0, 1, 1,
-0.9797183, -0.2194167, -3.25391, 0, 0, 0, 1, 1,
-0.9753931, -0.4932089, -2.458093, 0, 0, 0, 1, 1,
-0.97509, -0.04623412, 0.3343849, 0, 0, 0, 1, 1,
-0.9723232, 0.05444061, -1.512599, 0, 0, 0, 1, 1,
-0.9697897, 0.1432504, -1.718718, 0, 0, 0, 1, 1,
-0.9677604, -0.1157542, -2.275648, 0, 0, 0, 1, 1,
-0.965273, 0.09217086, -2.930141, 0, 0, 0, 1, 1,
-0.9609718, 0.0687108, -1.115171, 1, 1, 1, 1, 1,
-0.9572276, -0.2086965, -1.346846, 1, 1, 1, 1, 1,
-0.9481978, 0.5446153, -1.499241, 1, 1, 1, 1, 1,
-0.9478545, -0.677632, -2.165617, 1, 1, 1, 1, 1,
-0.930836, 0.41832, 0.8462059, 1, 1, 1, 1, 1,
-0.9308239, -0.7564455, -2.226449, 1, 1, 1, 1, 1,
-0.9283918, 0.2645559, -0.5622806, 1, 1, 1, 1, 1,
-0.9273775, -1.74039, -1.268729, 1, 1, 1, 1, 1,
-0.9268278, 0.9321747, 0.005640349, 1, 1, 1, 1, 1,
-0.9265828, 0.1193115, -1.743511, 1, 1, 1, 1, 1,
-0.9166747, 1.277701, -2.011211, 1, 1, 1, 1, 1,
-0.9063398, 0.6965011, -0.7655485, 1, 1, 1, 1, 1,
-0.903, -0.00132132, -1.889071, 1, 1, 1, 1, 1,
-0.8975782, -0.7462534, -2.654689, 1, 1, 1, 1, 1,
-0.891917, 0.3310405, 0.2706402, 1, 1, 1, 1, 1,
-0.8830138, 0.4234915, -1.355031, 0, 0, 1, 1, 1,
-0.8692229, 0.2740977, -1.60538, 1, 0, 0, 1, 1,
-0.8672383, -0.8810285, -2.5668, 1, 0, 0, 1, 1,
-0.8577015, -0.1735767, -2.529506, 1, 0, 0, 1, 1,
-0.8561919, -1.125517, -2.510485, 1, 0, 0, 1, 1,
-0.849768, -0.497386, -3.03122, 1, 0, 0, 1, 1,
-0.8429932, -0.6262016, -1.906033, 0, 0, 0, 1, 1,
-0.8378586, -0.7539572, -1.189582, 0, 0, 0, 1, 1,
-0.8315334, 0.6738732, -0.2149047, 0, 0, 0, 1, 1,
-0.8302425, -0.08499634, -1.333815, 0, 0, 0, 1, 1,
-0.8255485, 0.8096097, -0.2192991, 0, 0, 0, 1, 1,
-0.8218068, -0.4011554, -2.223544, 0, 0, 0, 1, 1,
-0.8209299, 0.9857238, 0.2473344, 0, 0, 0, 1, 1,
-0.8207694, -1.034224, -2.553066, 1, 1, 1, 1, 1,
-0.8179288, -0.1796871, -0.5291188, 1, 1, 1, 1, 1,
-0.8129048, 0.7435883, -0.8215669, 1, 1, 1, 1, 1,
-0.8095106, -0.7690882, -2.367018, 1, 1, 1, 1, 1,
-0.8059031, -0.4666996, -1.353115, 1, 1, 1, 1, 1,
-0.7978034, -1.06203, -1.904884, 1, 1, 1, 1, 1,
-0.7920371, -0.3422494, -2.716685, 1, 1, 1, 1, 1,
-0.7757996, 0.4571854, -0.1244234, 1, 1, 1, 1, 1,
-0.7704402, -0.9544687, -2.584637, 1, 1, 1, 1, 1,
-0.7698672, -0.9172814, -2.854333, 1, 1, 1, 1, 1,
-0.7696352, -0.6070691, -2.618032, 1, 1, 1, 1, 1,
-0.7648309, 0.5029556, 0.8624873, 1, 1, 1, 1, 1,
-0.7635075, -0.9138062, -3.618267, 1, 1, 1, 1, 1,
-0.75942, 0.3304265, -0.6507768, 1, 1, 1, 1, 1,
-0.7548226, -0.5368613, -2.504816, 1, 1, 1, 1, 1,
-0.7530857, 1.069786, -1.426954, 0, 0, 1, 1, 1,
-0.7530513, 0.3667535, -0.3691966, 1, 0, 0, 1, 1,
-0.7505131, -1.21125, -0.4349911, 1, 0, 0, 1, 1,
-0.7482471, -0.6238506, -2.566066, 1, 0, 0, 1, 1,
-0.7472388, 0.5211399, -0.05071861, 1, 0, 0, 1, 1,
-0.7454466, -0.8066739, -2.132563, 1, 0, 0, 1, 1,
-0.7436495, -0.3036238, -1.32631, 0, 0, 0, 1, 1,
-0.734143, -0.44783, -3.294109, 0, 0, 0, 1, 1,
-0.7311649, -0.5723265, -1.099252, 0, 0, 0, 1, 1,
-0.7257614, 0.4445647, -0.1278409, 0, 0, 0, 1, 1,
-0.7236306, -1.214683, -3.284816, 0, 0, 0, 1, 1,
-0.7217742, -0.4912077, -2.015481, 0, 0, 0, 1, 1,
-0.7187331, -1.926968, -2.567777, 0, 0, 0, 1, 1,
-0.716185, 0.3548053, -3.227351, 1, 1, 1, 1, 1,
-0.706162, -0.376334, -2.700623, 1, 1, 1, 1, 1,
-0.6996429, -0.7991319, -4.692715, 1, 1, 1, 1, 1,
-0.6931797, 0.3118236, -0.6666755, 1, 1, 1, 1, 1,
-0.6919942, -0.2629478, -2.233749, 1, 1, 1, 1, 1,
-0.6915904, -0.4124055, -0.6511142, 1, 1, 1, 1, 1,
-0.6885766, 0.3164982, -1.28397, 1, 1, 1, 1, 1,
-0.681656, 1.633382, -0.6390185, 1, 1, 1, 1, 1,
-0.6808202, -0.5265951, -0.5655544, 1, 1, 1, 1, 1,
-0.6799407, 1.600222, 0.227429, 1, 1, 1, 1, 1,
-0.677098, -2.215442, -3.692106, 1, 1, 1, 1, 1,
-0.6668297, 1.522873, -1.521786, 1, 1, 1, 1, 1,
-0.6577517, 0.09292777, -3.43696, 1, 1, 1, 1, 1,
-0.6550772, 1.397718, -0.3723025, 1, 1, 1, 1, 1,
-0.6539535, -0.7779484, -0.8832097, 1, 1, 1, 1, 1,
-0.6438732, 1.325441, 0.1564167, 0, 0, 1, 1, 1,
-0.6420421, -0.851859, -3.028857, 1, 0, 0, 1, 1,
-0.6397898, 1.780334, 0.7480085, 1, 0, 0, 1, 1,
-0.6379451, 0.8280099, -0.9452164, 1, 0, 0, 1, 1,
-0.6365592, -0.2645365, -3.376809, 1, 0, 0, 1, 1,
-0.6363592, 0.4167868, -2.148113, 1, 0, 0, 1, 1,
-0.6348825, -0.29943, -2.918566, 0, 0, 0, 1, 1,
-0.6321247, -1.252992, -2.348831, 0, 0, 0, 1, 1,
-0.6293763, 0.6363383, 0.458731, 0, 0, 0, 1, 1,
-0.6292573, -1.103185, -2.464009, 0, 0, 0, 1, 1,
-0.6282776, 0.5223432, -0.2883766, 0, 0, 0, 1, 1,
-0.6247337, -1.088124, -3.334757, 0, 0, 0, 1, 1,
-0.6234022, -2.101526, -2.385765, 0, 0, 0, 1, 1,
-0.622915, -0.6300021, -2.019564, 1, 1, 1, 1, 1,
-0.6185265, 0.2940557, -0.2253799, 1, 1, 1, 1, 1,
-0.6156843, -2.007489, -3.423609, 1, 1, 1, 1, 1,
-0.6098654, -0.9399349, -0.4342739, 1, 1, 1, 1, 1,
-0.6092916, -0.9431019, -2.352262, 1, 1, 1, 1, 1,
-0.6084068, -1.196461, -3.104519, 1, 1, 1, 1, 1,
-0.6072425, -2.106277, -2.375841, 1, 1, 1, 1, 1,
-0.6070204, 0.6999524, -0.290637, 1, 1, 1, 1, 1,
-0.6044858, 0.8837422, -0.6079264, 1, 1, 1, 1, 1,
-0.5997896, -0.04594316, -1.974839, 1, 1, 1, 1, 1,
-0.5982838, -1.465513, -3.704794, 1, 1, 1, 1, 1,
-0.5974598, 0.2242339, -1.290545, 1, 1, 1, 1, 1,
-0.5939331, 1.181487, 0.1868589, 1, 1, 1, 1, 1,
-0.5908477, 1.06353, -1.310818, 1, 1, 1, 1, 1,
-0.5895868, 1.101712, -2.075897, 1, 1, 1, 1, 1,
-0.5886025, -2.176764, -4.095004, 0, 0, 1, 1, 1,
-0.587573, 0.8380596, -0.3622391, 1, 0, 0, 1, 1,
-0.5828571, 0.212522, -0.2196222, 1, 0, 0, 1, 1,
-0.5825128, -1.418668, -4.109705, 1, 0, 0, 1, 1,
-0.5786515, 1.423719, 1.005135, 1, 0, 0, 1, 1,
-0.5740432, 0.2197096, -2.389515, 1, 0, 0, 1, 1,
-0.5739107, -0.6438194, -3.767754, 0, 0, 0, 1, 1,
-0.5708656, -1.740251, -3.998557, 0, 0, 0, 1, 1,
-0.5668644, -0.2269125, -2.006785, 0, 0, 0, 1, 1,
-0.566438, 0.6816224, -0.7418963, 0, 0, 0, 1, 1,
-0.5646935, 1.727833, -2.132421, 0, 0, 0, 1, 1,
-0.5643772, 0.4126687, -0.04911037, 0, 0, 0, 1, 1,
-0.5637049, -0.0285758, -1.040443, 0, 0, 0, 1, 1,
-0.5530727, 0.3519289, -2.494004, 1, 1, 1, 1, 1,
-0.5496691, -0.6398709, -1.852217, 1, 1, 1, 1, 1,
-0.5455148, -1.82225, -2.739081, 1, 1, 1, 1, 1,
-0.5453088, -1.804245, -3.140491, 1, 1, 1, 1, 1,
-0.5347439, 0.4242179, -0.8490505, 1, 1, 1, 1, 1,
-0.5299578, 0.01973121, -0.8685487, 1, 1, 1, 1, 1,
-0.5277058, -0.5231794, -0.4644963, 1, 1, 1, 1, 1,
-0.5269136, 0.1503948, -2.13594, 1, 1, 1, 1, 1,
-0.5256019, 0.9205008, -1.389774, 1, 1, 1, 1, 1,
-0.5231756, -1.42212, -3.197189, 1, 1, 1, 1, 1,
-0.5225765, 0.6390743, -1.03729, 1, 1, 1, 1, 1,
-0.5208787, 1.643412, 1.899637, 1, 1, 1, 1, 1,
-0.5167656, -0.05831956, -1.529835, 1, 1, 1, 1, 1,
-0.5118708, -0.2475299, -2.692822, 1, 1, 1, 1, 1,
-0.5096785, -0.3487906, -1.418832, 1, 1, 1, 1, 1,
-0.5078991, -1.443423, -2.712971, 0, 0, 1, 1, 1,
-0.4947149, 0.2206646, -0.8206415, 1, 0, 0, 1, 1,
-0.4901376, 0.01981972, -1.072477, 1, 0, 0, 1, 1,
-0.4891748, -1.365882, -4.691831, 1, 0, 0, 1, 1,
-0.4841762, -0.3628764, -3.305793, 1, 0, 0, 1, 1,
-0.4825257, -0.3386762, -1.546245, 1, 0, 0, 1, 1,
-0.4770308, -0.00830769, -1.457581, 0, 0, 0, 1, 1,
-0.4698391, -1.260229, -2.812083, 0, 0, 0, 1, 1,
-0.4689342, 0.05513886, -2.125191, 0, 0, 0, 1, 1,
-0.467989, 0.4005066, -0.6943752, 0, 0, 0, 1, 1,
-0.4622346, 1.210479, -2.943321, 0, 0, 0, 1, 1,
-0.4603894, -0.1314116, -2.094374, 0, 0, 0, 1, 1,
-0.4594764, -0.4792485, -1.276676, 0, 0, 0, 1, 1,
-0.4583032, -0.4324667, -4.370337, 1, 1, 1, 1, 1,
-0.4557889, 0.6479802, -1.165714, 1, 1, 1, 1, 1,
-0.4542675, 0.7265591, -1.29504, 1, 1, 1, 1, 1,
-0.4493644, 1.739431, -0.2930943, 1, 1, 1, 1, 1,
-0.4445294, 1.253782, -0.6808718, 1, 1, 1, 1, 1,
-0.4409615, -1.868324, -2.694046, 1, 1, 1, 1, 1,
-0.4376068, -0.4778636, -1.313688, 1, 1, 1, 1, 1,
-0.4351057, 0.829472, -0.2908624, 1, 1, 1, 1, 1,
-0.435044, -0.1041362, -3.384939, 1, 1, 1, 1, 1,
-0.4328659, 0.05165863, -1.643233, 1, 1, 1, 1, 1,
-0.4303099, 1.172267, -1.489834, 1, 1, 1, 1, 1,
-0.4302701, -0.2637612, -0.002407712, 1, 1, 1, 1, 1,
-0.4277213, -0.02230019, -0.434529, 1, 1, 1, 1, 1,
-0.424686, -1.104712, -1.739238, 1, 1, 1, 1, 1,
-0.4241905, 1.405257, 1.447225, 1, 1, 1, 1, 1,
-0.423941, -0.02977785, -1.659858, 0, 0, 1, 1, 1,
-0.4237351, 2.024118, -0.2240965, 1, 0, 0, 1, 1,
-0.4226567, -1.432585, -2.879758, 1, 0, 0, 1, 1,
-0.4197107, -2.614192, -5.711721, 1, 0, 0, 1, 1,
-0.4188921, 0.2032089, -0.4974532, 1, 0, 0, 1, 1,
-0.4165395, -1.85711, -1.351099, 1, 0, 0, 1, 1,
-0.4158379, 3.22729, 0.4440404, 0, 0, 0, 1, 1,
-0.4137199, -0.08778952, -1.843767, 0, 0, 0, 1, 1,
-0.4130076, -2.535362, -2.944523, 0, 0, 0, 1, 1,
-0.4112439, 1.4325, 0.5824306, 0, 0, 0, 1, 1,
-0.4109657, 1.616014, -0.04572975, 0, 0, 0, 1, 1,
-0.4076524, 0.01640613, -0.4383911, 0, 0, 0, 1, 1,
-0.4043858, 1.08534, 1.124148, 0, 0, 0, 1, 1,
-0.3995632, 2.449697, 1.013363, 1, 1, 1, 1, 1,
-0.3964835, -0.3734803, -2.478679, 1, 1, 1, 1, 1,
-0.3948441, -0.0210156, -2.274357, 1, 1, 1, 1, 1,
-0.3939699, -0.281186, -2.967319, 1, 1, 1, 1, 1,
-0.3909822, -0.1676757, -1.445551, 1, 1, 1, 1, 1,
-0.3856821, 0.06888238, -1.157242, 1, 1, 1, 1, 1,
-0.3758396, 1.048479, 0.178652, 1, 1, 1, 1, 1,
-0.3746513, 0.08972673, -2.783418, 1, 1, 1, 1, 1,
-0.3728192, 0.7779697, 3.313658, 1, 1, 1, 1, 1,
-0.3723116, 0.3370356, -1.574017, 1, 1, 1, 1, 1,
-0.3702254, 2.496893, -0.9724168, 1, 1, 1, 1, 1,
-0.3700537, -0.3274856, -1.168281, 1, 1, 1, 1, 1,
-0.3684473, 1.360906, 0.1171588, 1, 1, 1, 1, 1,
-0.3669459, 0.0416492, -0.5352184, 1, 1, 1, 1, 1,
-0.3635817, 1.338515, -0.817884, 1, 1, 1, 1, 1,
-0.3632739, -0.5286394, -1.019011, 0, 0, 1, 1, 1,
-0.3631558, -0.7685857, -0.4488302, 1, 0, 0, 1, 1,
-0.3614507, -0.180521, -2.3894, 1, 0, 0, 1, 1,
-0.3588859, -0.9569553, -1.927028, 1, 0, 0, 1, 1,
-0.3575544, 1.443845, -0.736168, 1, 0, 0, 1, 1,
-0.3490284, -0.6104217, -1.541905, 1, 0, 0, 1, 1,
-0.3489551, -1.210677, -3.0879, 0, 0, 0, 1, 1,
-0.3461603, 0.1982613, -1.24963, 0, 0, 0, 1, 1,
-0.3456674, -0.1180595, -2.441106, 0, 0, 0, 1, 1,
-0.345336, -0.2173818, -1.352193, 0, 0, 0, 1, 1,
-0.3449969, 0.5394195, -0.1239845, 0, 0, 0, 1, 1,
-0.3386526, 0.794431, -0.8767236, 0, 0, 0, 1, 1,
-0.3376409, 0.6199516, -2.183722, 0, 0, 0, 1, 1,
-0.3361715, 0.2067559, 0.5086719, 1, 1, 1, 1, 1,
-0.3354976, -2.647771, -1.1939, 1, 1, 1, 1, 1,
-0.3349726, -1.477287, -1.957324, 1, 1, 1, 1, 1,
-0.3297725, 0.4383506, -0.1917446, 1, 1, 1, 1, 1,
-0.3283722, -1.734409, -3.200144, 1, 1, 1, 1, 1,
-0.3281958, -1.333814, -2.422308, 1, 1, 1, 1, 1,
-0.3267931, -0.8418059, -3.302007, 1, 1, 1, 1, 1,
-0.326685, -0.2845935, -1.258453, 1, 1, 1, 1, 1,
-0.3211237, -1.870459, -3.433545, 1, 1, 1, 1, 1,
-0.3209682, -0.6523461, -2.574438, 1, 1, 1, 1, 1,
-0.3156169, 0.4616962, -1.57241, 1, 1, 1, 1, 1,
-0.3130498, 1.085523, -0.4128227, 1, 1, 1, 1, 1,
-0.3104375, 0.7085729, 0.2546376, 1, 1, 1, 1, 1,
-0.3036651, -0.9459628, -2.475526, 1, 1, 1, 1, 1,
-0.2977758, 2.15465, 0.02640124, 1, 1, 1, 1, 1,
-0.2948735, 0.2014792, -1.698284, 0, 0, 1, 1, 1,
-0.2902058, -0.08788196, -0.6652409, 1, 0, 0, 1, 1,
-0.2875188, 0.452774, -0.6903811, 1, 0, 0, 1, 1,
-0.2854534, 1.905737, -1.127598, 1, 0, 0, 1, 1,
-0.283069, 0.3568723, 0.4017846, 1, 0, 0, 1, 1,
-0.2826417, 0.6415779, -0.400199, 1, 0, 0, 1, 1,
-0.2817374, 0.7488168, -0.8991587, 0, 0, 0, 1, 1,
-0.278206, 1.441599, -1.488093, 0, 0, 0, 1, 1,
-0.2770314, 1.83843, -0.9892258, 0, 0, 0, 1, 1,
-0.276511, 1.001346, -0.1142248, 0, 0, 0, 1, 1,
-0.2744259, -0.07270085, -3.499633, 0, 0, 0, 1, 1,
-0.2729738, -1.289092, -4.254642, 0, 0, 0, 1, 1,
-0.2727542, -0.8356345, -2.508084, 0, 0, 0, 1, 1,
-0.270887, 0.5682672, -1.307001, 1, 1, 1, 1, 1,
-0.2703187, -0.3140768, -1.503965, 1, 1, 1, 1, 1,
-0.2686336, 0.9438695, 1.758525, 1, 1, 1, 1, 1,
-0.2672909, 0.2936105, -0.912809, 1, 1, 1, 1, 1,
-0.2659978, -2.270628, -2.965205, 1, 1, 1, 1, 1,
-0.2630697, -3.108211, -2.612214, 1, 1, 1, 1, 1,
-0.2606593, 0.3428488, 1.686396, 1, 1, 1, 1, 1,
-0.2515907, -1.011054, -1.995426, 1, 1, 1, 1, 1,
-0.2503425, 1.021585, -1.345928, 1, 1, 1, 1, 1,
-0.2501224, 0.8434525, 1.044839, 1, 1, 1, 1, 1,
-0.2487329, -0.3096913, -3.010735, 1, 1, 1, 1, 1,
-0.2442654, 0.7891601, -0.6906211, 1, 1, 1, 1, 1,
-0.243345, -2.110945, -3.138658, 1, 1, 1, 1, 1,
-0.2422664, 2.02009, -1.105425, 1, 1, 1, 1, 1,
-0.2333085, 0.2261255, -1.549079, 1, 1, 1, 1, 1,
-0.2330056, -0.4469149, -2.557833, 0, 0, 1, 1, 1,
-0.2319673, -1.481539, -1.985245, 1, 0, 0, 1, 1,
-0.2275365, 0.4366149, 0.3464802, 1, 0, 0, 1, 1,
-0.221765, -0.1499947, -0.771956, 1, 0, 0, 1, 1,
-0.2193489, -0.6181475, -2.362537, 1, 0, 0, 1, 1,
-0.2166643, 0.2150789, 0.9665163, 1, 0, 0, 1, 1,
-0.2141914, -1.042071, -2.79379, 0, 0, 0, 1, 1,
-0.2125406, 0.6979653, -1.416229, 0, 0, 0, 1, 1,
-0.2124926, -1.123977, -4.476166, 0, 0, 0, 1, 1,
-0.2115599, 0.2342131, 0.1932158, 0, 0, 0, 1, 1,
-0.2069308, 0.8964297, 0.04871882, 0, 0, 0, 1, 1,
-0.2031775, -0.7750384, -1.897592, 0, 0, 0, 1, 1,
-0.2011691, 1.555916, 0.5498624, 0, 0, 0, 1, 1,
-0.1996536, -0.374733, -3.654323, 1, 1, 1, 1, 1,
-0.1977994, 0.2197631, -1.028441, 1, 1, 1, 1, 1,
-0.1976771, 1.420147, -1.225271, 1, 1, 1, 1, 1,
-0.1948991, 0.2604115, -2.019412, 1, 1, 1, 1, 1,
-0.1902869, 0.6585936, -1.492529, 1, 1, 1, 1, 1,
-0.1899697, 0.6685343, -1.308786, 1, 1, 1, 1, 1,
-0.1812137, 0.8814619, -2.163327, 1, 1, 1, 1, 1,
-0.1801622, 0.548354, -0.804324, 1, 1, 1, 1, 1,
-0.1800197, -1.037507, -2.785125, 1, 1, 1, 1, 1,
-0.1772668, 0.7513565, -0.930553, 1, 1, 1, 1, 1,
-0.1764003, 0.167748, -0.5735415, 1, 1, 1, 1, 1,
-0.1739507, -1.184346, -3.760503, 1, 1, 1, 1, 1,
-0.1707884, 0.8627049, 1.009648, 1, 1, 1, 1, 1,
-0.1691601, 1.379813, 1.03704, 1, 1, 1, 1, 1,
-0.1689192, 0.7030773, -1.378032, 1, 1, 1, 1, 1,
-0.164606, -0.6080602, -2.950393, 0, 0, 1, 1, 1,
-0.162069, 0.02272358, -0.3976061, 1, 0, 0, 1, 1,
-0.1610507, -1.089352, -1.051943, 1, 0, 0, 1, 1,
-0.1590846, -0.1006378, -0.9728208, 1, 0, 0, 1, 1,
-0.1583576, 0.4962883, -1.625916, 1, 0, 0, 1, 1,
-0.1501276, -0.8429742, -2.365791, 1, 0, 0, 1, 1,
-0.1488125, 0.1801793, -0.4777385, 0, 0, 0, 1, 1,
-0.1486785, 0.03076988, -1.333556, 0, 0, 0, 1, 1,
-0.1428523, 0.1981325, 0.5606255, 0, 0, 0, 1, 1,
-0.142029, 1.071862, -0.05183228, 0, 0, 0, 1, 1,
-0.1416238, 0.7860897, 1.390284, 0, 0, 0, 1, 1,
-0.1400236, 0.3604855, 0.1321812, 0, 0, 0, 1, 1,
-0.131017, 1.464187, -0.08396047, 0, 0, 0, 1, 1,
-0.1295721, -0.1377671, -2.546267, 1, 1, 1, 1, 1,
-0.1278548, 0.5005561, 1.163376, 1, 1, 1, 1, 1,
-0.1261632, 0.4333021, 0.5704736, 1, 1, 1, 1, 1,
-0.1252059, 1.681568, 0.4929714, 1, 1, 1, 1, 1,
-0.1249655, 0.3286902, 0.1968102, 1, 1, 1, 1, 1,
-0.1247403, 1.406967, -0.3952623, 1, 1, 1, 1, 1,
-0.1240649, -2.383169, -3.397978, 1, 1, 1, 1, 1,
-0.1226011, 0.6704512, 1.282716, 1, 1, 1, 1, 1,
-0.1214314, 1.188048, -0.983261, 1, 1, 1, 1, 1,
-0.1198662, 0.03475481, -1.073804, 1, 1, 1, 1, 1,
-0.115184, -0.6405019, -1.443827, 1, 1, 1, 1, 1,
-0.1129559, -0.4796169, -5.92563, 1, 1, 1, 1, 1,
-0.1121051, 0.2455849, -1.054211, 1, 1, 1, 1, 1,
-0.1110014, -2.054523, -4.970334, 1, 1, 1, 1, 1,
-0.1048104, -1.030822, -4.454593, 1, 1, 1, 1, 1,
-0.1046139, -1.238236, -2.153986, 0, 0, 1, 1, 1,
-0.1020203, 0.2133605, -0.9830709, 1, 0, 0, 1, 1,
-0.09738897, -0.04074581, -1.726921, 1, 0, 0, 1, 1,
-0.09679171, 0.07247094, -0.3768786, 1, 0, 0, 1, 1,
-0.09670599, -1.776245, -4.519031, 1, 0, 0, 1, 1,
-0.09115247, 2.207133, 0.2835774, 1, 0, 0, 1, 1,
-0.08534241, -0.08748624, -2.089401, 0, 0, 0, 1, 1,
-0.08270839, 0.4472823, -1.687922, 0, 0, 0, 1, 1,
-0.08051278, -0.3622592, -4.687407, 0, 0, 0, 1, 1,
-0.07887188, 0.6621606, -1.060997, 0, 0, 0, 1, 1,
-0.0769503, -0.2105684, -4.337711, 0, 0, 0, 1, 1,
-0.07644527, 1.22206, -0.683605, 0, 0, 0, 1, 1,
-0.07511852, 1.060848, -1.131589, 0, 0, 0, 1, 1,
-0.07412796, -0.3724777, -0.8186855, 1, 1, 1, 1, 1,
-0.07178132, 1.092516, 0.4381084, 1, 1, 1, 1, 1,
-0.07046902, 0.8359169, 2.781689, 1, 1, 1, 1, 1,
-0.06538278, -0.9360564, -2.487621, 1, 1, 1, 1, 1,
-0.06411348, 1.172182, -1.885945, 1, 1, 1, 1, 1,
-0.06240059, 1.441282, 1.036349, 1, 1, 1, 1, 1,
-0.06064705, 1.075542, -0.2991476, 1, 1, 1, 1, 1,
-0.05688553, -0.1310381, -0.9857206, 1, 1, 1, 1, 1,
-0.05572684, -0.8759366, -0.9896788, 1, 1, 1, 1, 1,
-0.05472095, -0.1414915, -4.450771, 1, 1, 1, 1, 1,
-0.05356853, 1.217148, -0.01661391, 1, 1, 1, 1, 1,
-0.05231269, -0.02158119, -2.345197, 1, 1, 1, 1, 1,
-0.04994943, -0.004581903, -1.892961, 1, 1, 1, 1, 1,
-0.04496128, -0.6913666, -3.871485, 1, 1, 1, 1, 1,
-0.04291949, -0.9531271, -3.964269, 1, 1, 1, 1, 1,
-0.03353434, 1.712406, 0.442794, 0, 0, 1, 1, 1,
-0.03336748, -1.002569, -4.003597, 1, 0, 0, 1, 1,
-0.03119916, -1.162505, -3.351002, 1, 0, 0, 1, 1,
-0.01936502, 1.321823, -0.5974272, 1, 0, 0, 1, 1,
-0.01543608, 0.2037001, 0.9562191, 1, 0, 0, 1, 1,
-0.01377226, 0.6023957, -0.143862, 1, 0, 0, 1, 1,
-0.008609292, 0.5811478, -1.073849, 0, 0, 0, 1, 1,
-0.0085713, -1.955309, -3.567885, 0, 0, 0, 1, 1,
-0.006102122, -2.433421, -2.622311, 0, 0, 0, 1, 1,
-0.002093245, -1.107059, -4.724445, 0, 0, 0, 1, 1,
0.002520103, -0.6576586, 3.824801, 0, 0, 0, 1, 1,
0.005308395, 1.278855, 1.22056, 0, 0, 0, 1, 1,
0.01006318, 0.8824707, 1.143434, 0, 0, 0, 1, 1,
0.01236006, -1.00583, 3.274141, 1, 1, 1, 1, 1,
0.01418198, -1.914025, 3.832327, 1, 1, 1, 1, 1,
0.01701133, 0.510164, -0.3272703, 1, 1, 1, 1, 1,
0.01893424, 0.5237107, -0.4188845, 1, 1, 1, 1, 1,
0.02479675, -1.616883, 3.178106, 1, 1, 1, 1, 1,
0.02796061, 1.095762, 1.261465, 1, 1, 1, 1, 1,
0.02796271, 2.305716, -0.08181512, 1, 1, 1, 1, 1,
0.02818956, 0.7708037, 1.301602, 1, 1, 1, 1, 1,
0.03274225, -1.77861, 1.620081, 1, 1, 1, 1, 1,
0.04035526, 1.516808, -0.7868956, 1, 1, 1, 1, 1,
0.042034, 2.035473, -0.7973893, 1, 1, 1, 1, 1,
0.04579838, 0.8464941, 3.059144, 1, 1, 1, 1, 1,
0.04953575, 0.01394065, 1.760346, 1, 1, 1, 1, 1,
0.0594112, 0.9887357, 2.403596, 1, 1, 1, 1, 1,
0.06434318, 0.1640963, -0.5786201, 1, 1, 1, 1, 1,
0.06816971, 0.3164083, 1.619383, 0, 0, 1, 1, 1,
0.06855354, -1.048177, 3.983833, 1, 0, 0, 1, 1,
0.07856434, -0.7168428, 3.94594, 1, 0, 0, 1, 1,
0.0819185, 1.503483, -1.528678, 1, 0, 0, 1, 1,
0.08207738, -0.4968787, 3.212585, 1, 0, 0, 1, 1,
0.08313008, 0.1201556, 1.380194, 1, 0, 0, 1, 1,
0.08472332, 1.470999, -0.1871522, 0, 0, 0, 1, 1,
0.0886229, 0.9363559, -0.4359999, 0, 0, 0, 1, 1,
0.09011605, 0.5162029, -0.5139177, 0, 0, 0, 1, 1,
0.09783819, -0.5045582, 3.684268, 0, 0, 0, 1, 1,
0.09911702, -1.238938, 3.104345, 0, 0, 0, 1, 1,
0.1004671, 2.320425, 1.972933, 0, 0, 0, 1, 1,
0.1042966, 0.6794533, 0.0546889, 0, 0, 0, 1, 1,
0.1051336, -1.476217, 3.829915, 1, 1, 1, 1, 1,
0.1062504, 1.056563, -0.5810617, 1, 1, 1, 1, 1,
0.1142477, 0.7181003, 1.149402, 1, 1, 1, 1, 1,
0.1145778, 0.3103171, -0.5247412, 1, 1, 1, 1, 1,
0.1189372, 1.155691, 0.2570475, 1, 1, 1, 1, 1,
0.1191921, 0.1424173, 1.771061, 1, 1, 1, 1, 1,
0.1192636, 0.6572627, -0.858034, 1, 1, 1, 1, 1,
0.1205092, -0.9017732, 4.495177, 1, 1, 1, 1, 1,
0.1224333, 0.150173, 0.8196803, 1, 1, 1, 1, 1,
0.1287129, 0.7757779, 0.8521648, 1, 1, 1, 1, 1,
0.1322131, -1.406294, 4.094109, 1, 1, 1, 1, 1,
0.1355718, 0.3133489, 1.704855, 1, 1, 1, 1, 1,
0.1417668, -0.9985119, 3.352053, 1, 1, 1, 1, 1,
0.1444513, 0.9090446, -1.380715, 1, 1, 1, 1, 1,
0.1459074, 0.1864303, 1.249355, 1, 1, 1, 1, 1,
0.1485405, 0.4205493, 1.367357, 0, 0, 1, 1, 1,
0.1517074, -1.25398, 4.469524, 1, 0, 0, 1, 1,
0.1523276, -0.4321336, 1.99519, 1, 0, 0, 1, 1,
0.1591696, 0.04743855, 1.607252, 1, 0, 0, 1, 1,
0.161125, 1.634048, -1.397744, 1, 0, 0, 1, 1,
0.1641684, 0.2365545, -0.5580103, 1, 0, 0, 1, 1,
0.1661444, 0.9434742, -1.093048, 0, 0, 0, 1, 1,
0.166223, 1.195234, 2.005171, 0, 0, 0, 1, 1,
0.1663584, -0.2646993, 2.946804, 0, 0, 0, 1, 1,
0.1684434, 0.3480488, 0.8262698, 0, 0, 0, 1, 1,
0.16927, 0.1037304, 0.04827808, 0, 0, 0, 1, 1,
0.1726821, 1.410783, 0.3860361, 0, 0, 0, 1, 1,
0.1749626, -0.000466681, 2.513841, 0, 0, 0, 1, 1,
0.179487, 0.8620033, 1.011969, 1, 1, 1, 1, 1,
0.1800368, 1.182416, 2.476796, 1, 1, 1, 1, 1,
0.1817506, -1.553853, 2.89598, 1, 1, 1, 1, 1,
0.1839993, -1.404526, 2.280889, 1, 1, 1, 1, 1,
0.1860535, 1.85012, 1.931364, 1, 1, 1, 1, 1,
0.1913686, -0.7789099, 2.994083, 1, 1, 1, 1, 1,
0.193263, 2.183495, 0.1431823, 1, 1, 1, 1, 1,
0.1934802, 0.5020302, -0.2746231, 1, 1, 1, 1, 1,
0.2010064, -0.6158329, 1.751418, 1, 1, 1, 1, 1,
0.2028248, -0.2958215, 1.764028, 1, 1, 1, 1, 1,
0.2036121, -1.013048, 2.889077, 1, 1, 1, 1, 1,
0.2046193, 1.126425, 1.379467, 1, 1, 1, 1, 1,
0.2051418, 1.648684, 0.3838056, 1, 1, 1, 1, 1,
0.2056509, 1.452835, -2.494285, 1, 1, 1, 1, 1,
0.2080871, 0.4937549, 2.012458, 1, 1, 1, 1, 1,
0.2125429, 1.735723, 1.777468, 0, 0, 1, 1, 1,
0.2192253, 0.8378398, -0.08134778, 1, 0, 0, 1, 1,
0.2222772, -0.8964591, 2.558752, 1, 0, 0, 1, 1,
0.2246899, -0.1134235, 2.042428, 1, 0, 0, 1, 1,
0.2287578, -0.4606908, 3.90316, 1, 0, 0, 1, 1,
0.2322764, -1.487948, 3.768426, 1, 0, 0, 1, 1,
0.234775, 0.06234949, -0.7496862, 0, 0, 0, 1, 1,
0.2353607, -0.08131969, 2.133725, 0, 0, 0, 1, 1,
0.2362722, 0.06505046, 1.06708, 0, 0, 0, 1, 1,
0.2381187, 0.2650983, -0.2147064, 0, 0, 0, 1, 1,
0.2471927, -1.131763, 3.031265, 0, 0, 0, 1, 1,
0.2495136, -0.2401872, 2.594992, 0, 0, 0, 1, 1,
0.2526729, -0.2392729, 1.412897, 0, 0, 0, 1, 1,
0.254758, 1.491934, -1.3373, 1, 1, 1, 1, 1,
0.2555265, -0.2834801, 1.992416, 1, 1, 1, 1, 1,
0.2568878, 0.4108616, 1.199629, 1, 1, 1, 1, 1,
0.2615589, -0.3479697, 1.50829, 1, 1, 1, 1, 1,
0.2620631, -0.5614072, 2.954511, 1, 1, 1, 1, 1,
0.2653396, -1.181289, 1.254503, 1, 1, 1, 1, 1,
0.2685194, 0.3304121, 0.1780691, 1, 1, 1, 1, 1,
0.2693834, -0.3855912, 1.037637, 1, 1, 1, 1, 1,
0.2749629, 0.4374717, -0.4055471, 1, 1, 1, 1, 1,
0.2777858, 0.1735068, -1.615571, 1, 1, 1, 1, 1,
0.2779029, 0.4685954, -0.4845275, 1, 1, 1, 1, 1,
0.2826216, -1.917518, 2.534504, 1, 1, 1, 1, 1,
0.2846975, 1.400936, 2.216035, 1, 1, 1, 1, 1,
0.2856512, 1.6162, 1.715395, 1, 1, 1, 1, 1,
0.2871607, 1.267579, 1.745283, 1, 1, 1, 1, 1,
0.2872602, -0.7132167, 2.17913, 0, 0, 1, 1, 1,
0.2876312, -1.446848, 2.398826, 1, 0, 0, 1, 1,
0.2943887, 2.097645, -0.8303859, 1, 0, 0, 1, 1,
0.2960807, -1.273867, 2.561329, 1, 0, 0, 1, 1,
0.2969973, -1.152632, 3.531683, 1, 0, 0, 1, 1,
0.2974093, 0.4416241, 1.876804, 1, 0, 0, 1, 1,
0.2988646, 0.2947813, 0.9828106, 0, 0, 0, 1, 1,
0.3043059, 1.126506, -0.3793167, 0, 0, 0, 1, 1,
0.304471, 0.1025087, 0.7538326, 0, 0, 0, 1, 1,
0.3121961, -3.293313, 3.345777, 0, 0, 0, 1, 1,
0.3124627, -0.7892602, 1.825248, 0, 0, 0, 1, 1,
0.3151526, 0.1642888, 1.012394, 0, 0, 0, 1, 1,
0.317719, 0.5322232, -0.214441, 0, 0, 0, 1, 1,
0.3180508, 0.7657795, 1.089285, 1, 1, 1, 1, 1,
0.3235402, 0.9038947, -0.4746143, 1, 1, 1, 1, 1,
0.3254323, -0.538787, 2.996304, 1, 1, 1, 1, 1,
0.328151, -0.0008715512, 1.8892, 1, 1, 1, 1, 1,
0.3284041, 1.01612, 0.1796605, 1, 1, 1, 1, 1,
0.3401905, -0.1898109, 1.953434, 1, 1, 1, 1, 1,
0.3421237, -0.0512896, 1.211272, 1, 1, 1, 1, 1,
0.3427289, -0.9545235, 2.94073, 1, 1, 1, 1, 1,
0.3431473, -2.067646, 4.407717, 1, 1, 1, 1, 1,
0.3480721, -1.645327, 1.372943, 1, 1, 1, 1, 1,
0.3482744, -0.2791343, 3.972092, 1, 1, 1, 1, 1,
0.3518917, -0.8324394, 1.738554, 1, 1, 1, 1, 1,
0.3542438, -2.984999, 3.220142, 1, 1, 1, 1, 1,
0.3542442, 2.366382, -1.400022, 1, 1, 1, 1, 1,
0.356032, 1.688601, 0.4407796, 1, 1, 1, 1, 1,
0.3573226, -2.043578, 2.306833, 0, 0, 1, 1, 1,
0.3625172, 0.1483683, -0.2145492, 1, 0, 0, 1, 1,
0.3648735, -0.2177936, 1.356741, 1, 0, 0, 1, 1,
0.3708167, -0.01509372, 0.2255624, 1, 0, 0, 1, 1,
0.3730861, -0.4438055, 3.737213, 1, 0, 0, 1, 1,
0.3783678, -0.3607257, 2.927167, 1, 0, 0, 1, 1,
0.3808059, -0.3972768, 1.680543, 0, 0, 0, 1, 1,
0.3814805, 1.397578, 1.667673, 0, 0, 0, 1, 1,
0.3840458, -1.512854, 1.677034, 0, 0, 0, 1, 1,
0.3866525, 0.8807569, 0.3493148, 0, 0, 0, 1, 1,
0.3919048, 0.5543997, 0.80984, 0, 0, 0, 1, 1,
0.3934221, 1.30723, 1.024274, 0, 0, 0, 1, 1,
0.3953504, 0.5791904, 2.000482, 0, 0, 0, 1, 1,
0.4010206, -0.5891671, 2.692521, 1, 1, 1, 1, 1,
0.4045807, -2.088827, 2.810462, 1, 1, 1, 1, 1,
0.4072197, 0.9979265, 1.582636, 1, 1, 1, 1, 1,
0.410695, -1.041667, 2.830713, 1, 1, 1, 1, 1,
0.4135254, -1.088301, 2.454008, 1, 1, 1, 1, 1,
0.4178875, 0.1438039, 1.314283, 1, 1, 1, 1, 1,
0.4232898, -0.1845802, 0.5852274, 1, 1, 1, 1, 1,
0.4270944, 0.6845657, 0.60447, 1, 1, 1, 1, 1,
0.4272856, 1.257031, -0.8036636, 1, 1, 1, 1, 1,
0.4302188, 0.6778834, 0.2340527, 1, 1, 1, 1, 1,
0.4344172, 0.1723467, 1.617897, 1, 1, 1, 1, 1,
0.4371597, 0.4861724, 0.9881018, 1, 1, 1, 1, 1,
0.443271, -1.650205, 2.797665, 1, 1, 1, 1, 1,
0.4442358, -0.5536708, 1.753328, 1, 1, 1, 1, 1,
0.4533943, -2.225644, 3.144265, 1, 1, 1, 1, 1,
0.4534466, -0.6211715, 5.184055, 0, 0, 1, 1, 1,
0.4550868, -0.8582975, 2.877589, 1, 0, 0, 1, 1,
0.4560135, -0.9416513, 3.805305, 1, 0, 0, 1, 1,
0.464668, -0.2164653, 0.4372496, 1, 0, 0, 1, 1,
0.4648543, -0.8372727, 2.659286, 1, 0, 0, 1, 1,
0.4653769, -0.349366, 3.472496, 1, 0, 0, 1, 1,
0.465404, 0.3234611, 0.4337002, 0, 0, 0, 1, 1,
0.4679244, 0.8381957, -0.4468947, 0, 0, 0, 1, 1,
0.4689675, 1.32713, 0.2252918, 0, 0, 0, 1, 1,
0.4693441, 0.7201101, 1.773021, 0, 0, 0, 1, 1,
0.4735608, -0.02054675, 1.838069, 0, 0, 0, 1, 1,
0.475993, -1.867523, 1.86482, 0, 0, 0, 1, 1,
0.477893, -0.2702753, 1.69349, 0, 0, 0, 1, 1,
0.4779834, -0.007117673, -0.9006864, 1, 1, 1, 1, 1,
0.4787004, 0.3248466, -1.046727, 1, 1, 1, 1, 1,
0.48044, 0.8444631, 2.256813, 1, 1, 1, 1, 1,
0.4819524, 0.7400959, -1.438588, 1, 1, 1, 1, 1,
0.4822455, -0.6820719, 1.597894, 1, 1, 1, 1, 1,
0.485316, 0.06198863, 1.408392, 1, 1, 1, 1, 1,
0.4855558, -0.128845, 1.195592, 1, 1, 1, 1, 1,
0.4875885, 1.756133, 0.5729612, 1, 1, 1, 1, 1,
0.4897451, 0.1687876, 1.262528, 1, 1, 1, 1, 1,
0.5021634, -1.176847, 2.531887, 1, 1, 1, 1, 1,
0.5029909, 0.3476597, 1.631516, 1, 1, 1, 1, 1,
0.5033051, -2.34841, 1.25257, 1, 1, 1, 1, 1,
0.5058865, -0.3658391, 1.849128, 1, 1, 1, 1, 1,
0.5085447, 0.8442733, 0.1311638, 1, 1, 1, 1, 1,
0.5091787, -1.863422, 1.919737, 1, 1, 1, 1, 1,
0.5126538, 0.3226479, -0.1651076, 0, 0, 1, 1, 1,
0.5158442, 0.7893416, 1.29851, 1, 0, 0, 1, 1,
0.5218387, -0.3498321, 2.918729, 1, 0, 0, 1, 1,
0.5259598, 2.454759, 0.7056648, 1, 0, 0, 1, 1,
0.5293465, 1.382865, 0.2965983, 1, 0, 0, 1, 1,
0.5327833, 0.1875453, 0.2991886, 1, 0, 0, 1, 1,
0.5334125, 2.115957, -0.1392075, 0, 0, 0, 1, 1,
0.5335433, -0.8666168, 2.621635, 0, 0, 0, 1, 1,
0.5336731, -0.4870943, 2.504826, 0, 0, 0, 1, 1,
0.5362192, 0.06126815, 0.5300036, 0, 0, 0, 1, 1,
0.5380183, -0.8222287, 3.241744, 0, 0, 0, 1, 1,
0.5397386, -0.3106595, 1.294627, 0, 0, 0, 1, 1,
0.5480382, -0.8676568, 1.94312, 0, 0, 0, 1, 1,
0.55745, 0.6621486, 1.101768, 1, 1, 1, 1, 1,
0.5622163, -0.07962056, 2.513793, 1, 1, 1, 1, 1,
0.5653934, -0.9451731, 2.575301, 1, 1, 1, 1, 1,
0.5725968, -1.341355, 1.319374, 1, 1, 1, 1, 1,
0.5747929, -1.176488, 2.425176, 1, 1, 1, 1, 1,
0.577991, 1.014845, 0.3524147, 1, 1, 1, 1, 1,
0.5793221, 0.3247152, 0.7474313, 1, 1, 1, 1, 1,
0.5817006, 0.8889552, 0.06154492, 1, 1, 1, 1, 1,
0.5840667, 0.08431837, -0.1188728, 1, 1, 1, 1, 1,
0.5843708, 0.1395103, 2.172676, 1, 1, 1, 1, 1,
0.5909072, -0.6985384, 2.23318, 1, 1, 1, 1, 1,
0.593983, -0.9915568, 2.811805, 1, 1, 1, 1, 1,
0.5963368, -1.581824, 2.49565, 1, 1, 1, 1, 1,
0.5965365, -1.351409, 1.527907, 1, 1, 1, 1, 1,
0.5970392, 0.2869258, 1.084739, 1, 1, 1, 1, 1,
0.6007712, 0.5214179, 1.975935, 0, 0, 1, 1, 1,
0.6010861, 0.3727809, 1.156261, 1, 0, 0, 1, 1,
0.6026255, -0.4336163, 1.260005, 1, 0, 0, 1, 1,
0.6039822, -0.9749509, 1.482983, 1, 0, 0, 1, 1,
0.6043544, -0.2607694, 2.632235, 1, 0, 0, 1, 1,
0.6068349, -0.3930976, 2.357397, 1, 0, 0, 1, 1,
0.6070694, -0.8274912, 0.464269, 0, 0, 0, 1, 1,
0.6071917, 0.3601257, 0.1979746, 0, 0, 0, 1, 1,
0.6126829, -1.329198, 1.9172, 0, 0, 0, 1, 1,
0.6127819, 0.6122708, 0.1253261, 0, 0, 0, 1, 1,
0.6161864, 0.2118639, 0.4394501, 0, 0, 0, 1, 1,
0.6260852, -1.214122, 2.53243, 0, 0, 0, 1, 1,
0.6273053, 0.3202307, 3.207904, 0, 0, 0, 1, 1,
0.6280491, 0.1818577, 2.308763, 1, 1, 1, 1, 1,
0.6299586, -0.4779361, 2.498769, 1, 1, 1, 1, 1,
0.6302015, -0.296281, 1.863317, 1, 1, 1, 1, 1,
0.6305353, -0.344723, 1.662145, 1, 1, 1, 1, 1,
0.6406376, -0.6236066, 2.696582, 1, 1, 1, 1, 1,
0.6434186, -0.3866083, 3.720398, 1, 1, 1, 1, 1,
0.6487845, 0.9016036, -1.379845, 1, 1, 1, 1, 1,
0.6520457, 0.4620244, -0.2912537, 1, 1, 1, 1, 1,
0.6529335, -0.2103427, 3.024315, 1, 1, 1, 1, 1,
0.6637959, 0.2775803, 0.9946379, 1, 1, 1, 1, 1,
0.668076, 1.585117, 0.6134498, 1, 1, 1, 1, 1,
0.6688251, -0.1345205, 1.889531, 1, 1, 1, 1, 1,
0.6701353, -1.19241, 2.67701, 1, 1, 1, 1, 1,
0.6701992, 0.1589373, 0.88821, 1, 1, 1, 1, 1,
0.6784431, 0.5571589, 0.8914194, 1, 1, 1, 1, 1,
0.6803474, 0.4046404, 0.5947362, 0, 0, 1, 1, 1,
0.6832229, -0.296048, 1.577843, 1, 0, 0, 1, 1,
0.6835319, 1.963205, 1.286425, 1, 0, 0, 1, 1,
0.6836041, 0.2886502, -0.415166, 1, 0, 0, 1, 1,
0.6836272, -1.601079, 3.075, 1, 0, 0, 1, 1,
0.6902581, -2.016537, 2.688777, 1, 0, 0, 1, 1,
0.6906765, 1.393921, -0.3601656, 0, 0, 0, 1, 1,
0.6919597, -0.551597, 2.499056, 0, 0, 0, 1, 1,
0.6928217, 1.072923, 1.518225, 0, 0, 0, 1, 1,
0.6933686, -0.8676839, 3.295394, 0, 0, 0, 1, 1,
0.6938713, -0.9171667, 1.956764, 0, 0, 0, 1, 1,
0.6942155, 1.344949, 0.5570828, 0, 0, 0, 1, 1,
0.6969001, 0.2199523, 0.3328221, 0, 0, 0, 1, 1,
0.6972766, 0.6933551, 1.712749, 1, 1, 1, 1, 1,
0.6990679, 0.6849242, 0.9486567, 1, 1, 1, 1, 1,
0.7012522, 1.653623, 1.579207, 1, 1, 1, 1, 1,
0.7079924, 0.002692193, 1.623344, 1, 1, 1, 1, 1,
0.7111582, -0.1672676, 1.225617, 1, 1, 1, 1, 1,
0.711781, -2.093227, 2.144399, 1, 1, 1, 1, 1,
0.7185827, -0.9739529, 2.02524, 1, 1, 1, 1, 1,
0.7188798, -0.423777, 2.900654, 1, 1, 1, 1, 1,
0.7214713, 0.2542696, 0.3573674, 1, 1, 1, 1, 1,
0.7241141, 0.1353284, 3.112347, 1, 1, 1, 1, 1,
0.7341706, -0.9277832, 2.864199, 1, 1, 1, 1, 1,
0.7360059, -0.03897573, -0.2960323, 1, 1, 1, 1, 1,
0.7423921, -0.2177848, 3.708454, 1, 1, 1, 1, 1,
0.7427346, -1.959015, 2.963185, 1, 1, 1, 1, 1,
0.7428169, -0.2814408, 3.930954, 1, 1, 1, 1, 1,
0.744536, -1.068188, 4.845296, 0, 0, 1, 1, 1,
0.750961, -0.9003134, 2.545734, 1, 0, 0, 1, 1,
0.7582299, -1.198542, 2.81424, 1, 0, 0, 1, 1,
0.7589844, 0.4797705, 0.2587928, 1, 0, 0, 1, 1,
0.7603679, -0.7487397, 2.072025, 1, 0, 0, 1, 1,
0.761368, -1.406759, -0.4745637, 1, 0, 0, 1, 1,
0.7628728, -0.8343821, 1.934662, 0, 0, 0, 1, 1,
0.7630095, 0.3324177, 2.360471, 0, 0, 0, 1, 1,
0.7634963, 1.068001, 0.2506375, 0, 0, 0, 1, 1,
0.7650006, -1.060388, 3.346202, 0, 0, 0, 1, 1,
0.7670585, 0.1303978, 1.97299, 0, 0, 0, 1, 1,
0.7713872, -0.9051126, 1.296382, 0, 0, 0, 1, 1,
0.7735225, -1.200209, 3.849735, 0, 0, 0, 1, 1,
0.7788237, -0.1829509, 1.970589, 1, 1, 1, 1, 1,
0.7858152, 0.1568273, 2.125245, 1, 1, 1, 1, 1,
0.7925738, 1.909379, 0.7671002, 1, 1, 1, 1, 1,
0.7979343, -1.423697, 3.296612, 1, 1, 1, 1, 1,
0.8071386, -0.6952876, 1.408084, 1, 1, 1, 1, 1,
0.8084232, 0.3538505, 1.210766, 1, 1, 1, 1, 1,
0.8100362, -0.6762118, 2.530402, 1, 1, 1, 1, 1,
0.8110998, -1.157696, 1.872075, 1, 1, 1, 1, 1,
0.8117495, -0.02172524, 3.860927, 1, 1, 1, 1, 1,
0.8162987, 0.3579964, 2.672971, 1, 1, 1, 1, 1,
0.8182178, 0.8797572, 0.6289538, 1, 1, 1, 1, 1,
0.8197743, 0.510986, 1.735909, 1, 1, 1, 1, 1,
0.8394491, -0.3960443, -0.5545308, 1, 1, 1, 1, 1,
0.8424824, 0.5571307, 1.960526, 1, 1, 1, 1, 1,
0.842822, -0.004169571, 0.540312, 1, 1, 1, 1, 1,
0.8496633, 1.220169, -0.5852122, 0, 0, 1, 1, 1,
0.8564056, 0.6785059, 0.08264759, 1, 0, 0, 1, 1,
0.857263, -1.822993, 5.485627, 1, 0, 0, 1, 1,
0.8580758, 1.228216, 0.9157362, 1, 0, 0, 1, 1,
0.859421, 0.4324945, 1.301637, 1, 0, 0, 1, 1,
0.8602758, -2.15782, 1.19791, 1, 0, 0, 1, 1,
0.8687228, 0.5830222, 1.28484, 0, 0, 0, 1, 1,
0.8709612, -0.179688, 1.57764, 0, 0, 0, 1, 1,
0.8724251, 1.085756, 0.7762939, 0, 0, 0, 1, 1,
0.8744205, 0.4011746, -0.5919532, 0, 0, 0, 1, 1,
0.8812278, 0.105357, 0.7619427, 0, 0, 0, 1, 1,
0.8820366, -1.552484, 3.09918, 0, 0, 0, 1, 1,
0.8827097, -1.549057, 3.921649, 0, 0, 0, 1, 1,
0.8948943, -0.03279398, 2.181828, 1, 1, 1, 1, 1,
0.8951338, -1.488075, 1.550429, 1, 1, 1, 1, 1,
0.9010364, 0.028801, 1.329756, 1, 1, 1, 1, 1,
0.9041957, 0.7673032, 2.106545, 1, 1, 1, 1, 1,
0.9059209, -0.6603772, 1.510419, 1, 1, 1, 1, 1,
0.9127873, -0.9160835, 1.40943, 1, 1, 1, 1, 1,
0.916616, 0.8730463, 2.270687, 1, 1, 1, 1, 1,
0.9191094, -1.824679, 2.085588, 1, 1, 1, 1, 1,
0.9245145, -1.138527, 2.820922, 1, 1, 1, 1, 1,
0.9313123, -0.6093192, 1.580864, 1, 1, 1, 1, 1,
0.9342731, 0.1768756, -1.336689, 1, 1, 1, 1, 1,
0.9465884, -1.339565, 1.348845, 1, 1, 1, 1, 1,
0.9552807, 0.06566151, 2.49011, 1, 1, 1, 1, 1,
0.9571149, -1.415879, 2.165316, 1, 1, 1, 1, 1,
0.9606291, 0.4292321, 0.1262771, 1, 1, 1, 1, 1,
0.9635509, -1.577299, 2.999285, 0, 0, 1, 1, 1,
0.9640809, -0.243809, 1.149844, 1, 0, 0, 1, 1,
0.9664583, -0.6304584, 1.668121, 1, 0, 0, 1, 1,
0.9705836, -0.8287096, 2.258807, 1, 0, 0, 1, 1,
0.9874679, 1.272313, 0.8032574, 1, 0, 0, 1, 1,
0.9877437, -0.4273097, 1.79401, 1, 0, 0, 1, 1,
0.9880239, -0.3827183, 0.8993238, 0, 0, 0, 1, 1,
0.9890503, 0.5249045, 0.9112539, 0, 0, 0, 1, 1,
0.9967175, 0.825229, 2.392883, 0, 0, 0, 1, 1,
1.012462, -1.035002, 2.363131, 0, 0, 0, 1, 1,
1.013196, -0.08170199, 3.455142, 0, 0, 0, 1, 1,
1.024703, 0.7193909, -0.588352, 0, 0, 0, 1, 1,
1.025622, -0.1107615, 3.01486, 0, 0, 0, 1, 1,
1.025761, -0.6265116, 2.835067, 1, 1, 1, 1, 1,
1.028274, -0.6266049, 2.364176, 1, 1, 1, 1, 1,
1.029893, 0.3773321, 1.870633, 1, 1, 1, 1, 1,
1.034017, -1.207723, 1.883364, 1, 1, 1, 1, 1,
1.035624, -0.5494441, 2.326356, 1, 1, 1, 1, 1,
1.035965, -0.5398328, 2.512715, 1, 1, 1, 1, 1,
1.038927, -0.09093221, 2.007022, 1, 1, 1, 1, 1,
1.056041, 0.3889206, 1.160618, 1, 1, 1, 1, 1,
1.064876, -1.135752, 4.075702, 1, 1, 1, 1, 1,
1.070653, 0.1272639, -0.1998871, 1, 1, 1, 1, 1,
1.071939, -1.836601, 3.346346, 1, 1, 1, 1, 1,
1.079121, -0.4301003, 2.688316, 1, 1, 1, 1, 1,
1.081015, 0.9289397, -0.4397253, 1, 1, 1, 1, 1,
1.09592, 0.7770367, 1.825936, 1, 1, 1, 1, 1,
1.097743, 0.8080009, 1.232886, 1, 1, 1, 1, 1,
1.099846, -0.9467618, 1.232333, 0, 0, 1, 1, 1,
1.109197, -0.3913105, 3.89707, 1, 0, 0, 1, 1,
1.120307, -0.8917525, 4.138017, 1, 0, 0, 1, 1,
1.146402, 0.4284059, 0.6741261, 1, 0, 0, 1, 1,
1.155838, -0.488925, 0.479421, 1, 0, 0, 1, 1,
1.158193, 0.6299089, 1.950725, 1, 0, 0, 1, 1,
1.163197, -1.305, 1.286905, 0, 0, 0, 1, 1,
1.175352, 0.3420258, 0.2813986, 0, 0, 0, 1, 1,
1.185485, -0.7849354, 2.241183, 0, 0, 0, 1, 1,
1.19388, 0.199264, 1.756586, 0, 0, 0, 1, 1,
1.196654, 0.1724251, 0.1828797, 0, 0, 0, 1, 1,
1.199762, 0.6205423, 1.885231, 0, 0, 0, 1, 1,
1.204734, -0.4096932, 3.167345, 0, 0, 0, 1, 1,
1.205803, 0.02339706, 1.14532, 1, 1, 1, 1, 1,
1.207368, 0.4342646, 3.391465, 1, 1, 1, 1, 1,
1.209195, -3.238445, 1.78012, 1, 1, 1, 1, 1,
1.210352, -0.4066637, 2.173537, 1, 1, 1, 1, 1,
1.214629, 1.098858, 0.5786499, 1, 1, 1, 1, 1,
1.218066, 0.4793701, 1.749954, 1, 1, 1, 1, 1,
1.222045, -1.595945, 1.303128, 1, 1, 1, 1, 1,
1.226, 1.601454, 1.518798, 1, 1, 1, 1, 1,
1.231913, -0.603133, 2.937237, 1, 1, 1, 1, 1,
1.235731, -0.9161335, 0.5759125, 1, 1, 1, 1, 1,
1.257059, 2.644496, 1.206339, 1, 1, 1, 1, 1,
1.265593, 0.421186, 1.377935, 1, 1, 1, 1, 1,
1.266929, -0.3672319, 2.114519, 1, 1, 1, 1, 1,
1.269743, 0.2698754, 2.137952, 1, 1, 1, 1, 1,
1.271327, -0.2829975, 3.212276, 1, 1, 1, 1, 1,
1.276656, -0.2587224, 2.649639, 0, 0, 1, 1, 1,
1.282345, -0.5107324, 1.788582, 1, 0, 0, 1, 1,
1.288903, 1.161705, 1.103688, 1, 0, 0, 1, 1,
1.296358, -1.050824, 3.558925, 1, 0, 0, 1, 1,
1.322729, -1.161271, 2.137291, 1, 0, 0, 1, 1,
1.330669, 1.257581, 1.373903, 1, 0, 0, 1, 1,
1.336146, -1.024056, 2.035378, 0, 0, 0, 1, 1,
1.338586, 0.7997146, 2.268116, 0, 0, 0, 1, 1,
1.346953, 0.3871273, 3.079734, 0, 0, 0, 1, 1,
1.347854, 0.113198, 1.334668, 0, 0, 0, 1, 1,
1.354995, -0.6804526, 2.249237, 0, 0, 0, 1, 1,
1.357182, -2.263712, 0.8613446, 0, 0, 0, 1, 1,
1.363657, 1.597439, 0.8466529, 0, 0, 0, 1, 1,
1.363664, 0.003546992, 1.826753, 1, 1, 1, 1, 1,
1.371652, 0.5391396, 2.257038, 1, 1, 1, 1, 1,
1.375602, -0.4338227, 0.8729835, 1, 1, 1, 1, 1,
1.384947, -0.005617313, 0.6512762, 1, 1, 1, 1, 1,
1.392253, -0.4125653, 2.238867, 1, 1, 1, 1, 1,
1.395542, 1.352455, -0.7829763, 1, 1, 1, 1, 1,
1.395904, 0.3973573, 1.555663, 1, 1, 1, 1, 1,
1.396773, -0.3316725, 0.4997303, 1, 1, 1, 1, 1,
1.400643, -0.1605325, -0.08959484, 1, 1, 1, 1, 1,
1.404086, 0.3722143, 0.9890317, 1, 1, 1, 1, 1,
1.404091, -1.094851, 3.375171, 1, 1, 1, 1, 1,
1.406478, 0.2650227, 2.924611, 1, 1, 1, 1, 1,
1.413536, -1.656662, 3.905667, 1, 1, 1, 1, 1,
1.418095, -0.7474549, 2.588172, 1, 1, 1, 1, 1,
1.423675, 0.7858661, 1.696091, 1, 1, 1, 1, 1,
1.425125, 0.1748643, 1.462512, 0, 0, 1, 1, 1,
1.43865, 1.896645, -1.464402, 1, 0, 0, 1, 1,
1.450396, -0.2558548, 3.11085, 1, 0, 0, 1, 1,
1.456093, 1.863065, 1.73631, 1, 0, 0, 1, 1,
1.456467, 0.7285698, 1.263081, 1, 0, 0, 1, 1,
1.47314, 1.716395, 0.7366994, 1, 0, 0, 1, 1,
1.479713, -0.07656582, 1.786579, 0, 0, 0, 1, 1,
1.480716, 0.1045911, 1.980588, 0, 0, 0, 1, 1,
1.481665, 0.4832532, 1.308275, 0, 0, 0, 1, 1,
1.485979, 0.06864221, 1.89957, 0, 0, 0, 1, 1,
1.492623, 0.9799403, 2.636838, 0, 0, 0, 1, 1,
1.495018, 0.1835886, 4.382777, 0, 0, 0, 1, 1,
1.502479, -1.271186, 2.74227, 0, 0, 0, 1, 1,
1.505067, 0.3920867, 1.524852, 1, 1, 1, 1, 1,
1.509294, -0.1296668, 1.152401, 1, 1, 1, 1, 1,
1.526787, 0.860482, 0.6889178, 1, 1, 1, 1, 1,
1.527237, 0.354893, 1.42261, 1, 1, 1, 1, 1,
1.541446, -0.1893904, 3.47137, 1, 1, 1, 1, 1,
1.548648, 1.937301, -1.433653, 1, 1, 1, 1, 1,
1.548865, 0.3183004, 2.395192, 1, 1, 1, 1, 1,
1.552691, 1.916578, -0.3454386, 1, 1, 1, 1, 1,
1.568105, -1.298133, 3.649493, 1, 1, 1, 1, 1,
1.579274, 1.609229, 2.770844, 1, 1, 1, 1, 1,
1.5812, -1.26794, 4.580824, 1, 1, 1, 1, 1,
1.581421, -0.04529953, 0.000740217, 1, 1, 1, 1, 1,
1.602554, 0.4000505, 1.490694, 1, 1, 1, 1, 1,
1.608761, -0.5745375, 2.275623, 1, 1, 1, 1, 1,
1.64257, -0.7915336, 1.477766, 1, 1, 1, 1, 1,
1.65116, 0.0453051, 1.102205, 0, 0, 1, 1, 1,
1.670545, -1.014832, 0.2930021, 1, 0, 0, 1, 1,
1.692732, 0.9022799, 2.302742, 1, 0, 0, 1, 1,
1.701608, 1.041822, 2.837111, 1, 0, 0, 1, 1,
1.735727, -2.296154, 3.335157, 1, 0, 0, 1, 1,
1.754213, -0.7312219, 2.76743, 1, 0, 0, 1, 1,
1.75851, 2.387795, -1.593117, 0, 0, 0, 1, 1,
1.771138, -1.14436, 3.408609, 0, 0, 0, 1, 1,
1.771972, -1.314453, 1.931618, 0, 0, 0, 1, 1,
1.781414, -1.204103, 1.859774, 0, 0, 0, 1, 1,
1.798725, -0.2144814, 2.05445, 0, 0, 0, 1, 1,
1.802189, 0.4473852, 3.260431, 0, 0, 0, 1, 1,
1.81279, -0.4043358, 1.180193, 0, 0, 0, 1, 1,
1.818819, 1.246953, 0.2513514, 1, 1, 1, 1, 1,
1.837173, -1.767722, 2.371413, 1, 1, 1, 1, 1,
1.90243, 1.482994, 1.554399, 1, 1, 1, 1, 1,
1.918853, 1.112469, 0.7729045, 1, 1, 1, 1, 1,
1.921378, -0.234043, 0.8123006, 1, 1, 1, 1, 1,
1.93958, -1.064316, 0.8631704, 1, 1, 1, 1, 1,
1.940071, -1.099561, 0.9410387, 1, 1, 1, 1, 1,
1.964745, -0.6480956, 3.37921, 1, 1, 1, 1, 1,
1.970354, -0.06550874, 1.414325, 1, 1, 1, 1, 1,
2.023776, -1.513819, 2.788238, 1, 1, 1, 1, 1,
2.025151, 1.919989, 0.5552148, 1, 1, 1, 1, 1,
2.096112, 0.982664, -0.008223202, 1, 1, 1, 1, 1,
2.100118, -0.591571, 3.124938, 1, 1, 1, 1, 1,
2.111585, -0.4205179, 0.2881385, 1, 1, 1, 1, 1,
2.138497, 0.1320366, 0.9622229, 1, 1, 1, 1, 1,
2.150129, -0.6825033, 3.043847, 0, 0, 1, 1, 1,
2.190447, 2.418118, 0.7296324, 1, 0, 0, 1, 1,
2.19215, 2.753783, -0.4308519, 1, 0, 0, 1, 1,
2.205613, 0.6136658, 0.3194711, 1, 0, 0, 1, 1,
2.230207, 1.529644, -0.9798018, 1, 0, 0, 1, 1,
2.284305, 1.134869, -0.3560944, 1, 0, 0, 1, 1,
2.33963, -0.2019957, 1.151664, 0, 0, 0, 1, 1,
2.355254, 2.060982, 1.557325, 0, 0, 0, 1, 1,
2.39475, -1.006337, 0.7713624, 0, 0, 0, 1, 1,
2.397953, -0.2704944, 0.9084417, 0, 0, 0, 1, 1,
2.405918, -0.07025494, 3.63374, 0, 0, 0, 1, 1,
2.430914, 1.68947, -0.07835091, 0, 0, 0, 1, 1,
2.478159, 1.324261, 2.747234, 0, 0, 0, 1, 1,
2.537746, 0.2633443, 1.836691, 1, 1, 1, 1, 1,
2.607133, -1.48904, 1.95923, 1, 1, 1, 1, 1,
2.720905, -0.1255804, 0.1042403, 1, 1, 1, 1, 1,
2.72846, 1.161141, 1.132593, 1, 1, 1, 1, 1,
2.821595, 0.7879396, 0.9734169, 1, 1, 1, 1, 1,
2.832613, -1.745546, 1.630262, 1, 1, 1, 1, 1,
3.190736, -0.4912999, 1.022191, 1, 1, 1, 1, 1
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
var radius = 10.08345;
var distance = 35.41769;
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
mvMatrix.translate( 0.08753204, -0.2630804, 0.2200015 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.41769);
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
