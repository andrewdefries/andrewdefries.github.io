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
-3.059733, 0.003075557, -3.885582, 1, 0, 0, 1,
-3.032073, 0.8326284, -0.03872116, 1, 0.007843138, 0, 1,
-2.992439, 0.6035035, -0.358537, 1, 0.01176471, 0, 1,
-2.864906, -1.153061, -3.101537, 1, 0.01960784, 0, 1,
-2.741438, -0.8268381, -3.079236, 1, 0.02352941, 0, 1,
-2.729212, 0.6314583, -1.479983, 1, 0.03137255, 0, 1,
-2.701163, 0.2899567, -3.31635, 1, 0.03529412, 0, 1,
-2.603975, 0.5077421, -1.43276, 1, 0.04313726, 0, 1,
-2.470167, 0.544624, -1.393225, 1, 0.04705882, 0, 1,
-2.463845, -1.192193, -3.187246, 1, 0.05490196, 0, 1,
-2.45472, -0.08245695, -0.7735079, 1, 0.05882353, 0, 1,
-2.422538, -0.2728107, -2.133851, 1, 0.06666667, 0, 1,
-2.349531, 0.4127039, -1.854355, 1, 0.07058824, 0, 1,
-2.348847, -1.096407, -4.093401, 1, 0.07843138, 0, 1,
-2.341903, -0.1294535, -3.584534, 1, 0.08235294, 0, 1,
-2.337071, 0.01198981, -1.53757, 1, 0.09019608, 0, 1,
-2.283963, -0.4874808, -1.544927, 1, 0.09411765, 0, 1,
-2.247682, -0.6631252, -2.170585, 1, 0.1019608, 0, 1,
-2.228497, -0.2347242, 0.1713662, 1, 0.1098039, 0, 1,
-2.218369, 0.9179868, -1.868442, 1, 0.1137255, 0, 1,
-2.204195, 0.08390209, -1.184942, 1, 0.1215686, 0, 1,
-2.193032, 1.982351, -1.489967, 1, 0.1254902, 0, 1,
-2.160805, -0.4338228, -3.489053, 1, 0.1333333, 0, 1,
-2.149181, -0.6748426, -1.529908, 1, 0.1372549, 0, 1,
-2.10643, -0.2097089, -0.1739297, 1, 0.145098, 0, 1,
-2.102166, 1.653788, -0.5224026, 1, 0.1490196, 0, 1,
-2.03049, 0.7266257, -2.313302, 1, 0.1568628, 0, 1,
-1.992854, 0.1412488, -0.9709734, 1, 0.1607843, 0, 1,
-1.977334, -0.8557225, -2.604356, 1, 0.1686275, 0, 1,
-1.964042, -0.3148435, -1.897689, 1, 0.172549, 0, 1,
-1.95137, 0.8961367, -1.346343, 1, 0.1803922, 0, 1,
-1.929993, 0.7943743, -1.443039, 1, 0.1843137, 0, 1,
-1.877681, -0.003974742, -1.176732, 1, 0.1921569, 0, 1,
-1.867791, 1.257827, -2.194653, 1, 0.1960784, 0, 1,
-1.861283, 0.9000411, 1.003441, 1, 0.2039216, 0, 1,
-1.843735, 1.047454, 0.2395506, 1, 0.2117647, 0, 1,
-1.841762, 1.551356, -0.9162942, 1, 0.2156863, 0, 1,
-1.840039, -1.618623, -3.151109, 1, 0.2235294, 0, 1,
-1.835781, 0.6925878, -1.049788, 1, 0.227451, 0, 1,
-1.833676, -1.058784, -2.776669, 1, 0.2352941, 0, 1,
-1.829157, 0.9190161, 0.2549199, 1, 0.2392157, 0, 1,
-1.828015, -0.3326293, -2.524479, 1, 0.2470588, 0, 1,
-1.821512, -1.440423, -3.693354, 1, 0.2509804, 0, 1,
-1.807955, 0.9589097, -2.481266, 1, 0.2588235, 0, 1,
-1.804464, -1.098789, -0.8138978, 1, 0.2627451, 0, 1,
-1.772409, 0.6924092, -2.575215, 1, 0.2705882, 0, 1,
-1.768211, -0.6468535, -2.00822, 1, 0.2745098, 0, 1,
-1.752591, 1.856248, -0.0634416, 1, 0.282353, 0, 1,
-1.737276, 0.3709629, 0.02185218, 1, 0.2862745, 0, 1,
-1.731154, -0.2062696, -1.742319, 1, 0.2941177, 0, 1,
-1.721141, 0.3731772, -2.460438, 1, 0.3019608, 0, 1,
-1.71279, 0.5713568, -2.928746, 1, 0.3058824, 0, 1,
-1.699401, -1.270331, -2.185657, 1, 0.3137255, 0, 1,
-1.67903, 0.4339108, 0.3093077, 1, 0.3176471, 0, 1,
-1.657348, -2.583641, -3.244464, 1, 0.3254902, 0, 1,
-1.641123, 0.6438085, -3.808713, 1, 0.3294118, 0, 1,
-1.63766, -0.07387521, -2.121136, 1, 0.3372549, 0, 1,
-1.634137, 0.9826943, -1.011368, 1, 0.3411765, 0, 1,
-1.62087, 0.5873984, -1.802914, 1, 0.3490196, 0, 1,
-1.605257, -1.062212, -0.07706199, 1, 0.3529412, 0, 1,
-1.588249, -0.02923554, -4.477313, 1, 0.3607843, 0, 1,
-1.560768, -0.4779384, -0.7406043, 1, 0.3647059, 0, 1,
-1.536152, -0.3042643, -1.6093, 1, 0.372549, 0, 1,
-1.53534, 0.9789379, -1.772846, 1, 0.3764706, 0, 1,
-1.533876, -0.8167133, -0.1135053, 1, 0.3843137, 0, 1,
-1.528282, 1.149611, -1.436933, 1, 0.3882353, 0, 1,
-1.527097, 0.5039123, -1.360862, 1, 0.3960784, 0, 1,
-1.526752, 0.9885739, -0.7367836, 1, 0.4039216, 0, 1,
-1.520793, -1.281425, -2.347091, 1, 0.4078431, 0, 1,
-1.50812, -1.149044, -1.909958, 1, 0.4156863, 0, 1,
-1.504373, 1.219198, -2.648469, 1, 0.4196078, 0, 1,
-1.499368, 0.5152681, -0.8682377, 1, 0.427451, 0, 1,
-1.496345, 0.8717866, -2.00379, 1, 0.4313726, 0, 1,
-1.489748, -0.6047555, -0.2633247, 1, 0.4392157, 0, 1,
-1.489369, 2.331488, 0.08927773, 1, 0.4431373, 0, 1,
-1.4874, -0.5343101, -1.811358, 1, 0.4509804, 0, 1,
-1.47558, -0.4927436, -1.81219, 1, 0.454902, 0, 1,
-1.473689, 0.3667354, -2.679346, 1, 0.4627451, 0, 1,
-1.468915, 2.121465, -1.203393, 1, 0.4666667, 0, 1,
-1.467864, -0.2708693, -2.231362, 1, 0.4745098, 0, 1,
-1.461914, 0.603908, -0.1078419, 1, 0.4784314, 0, 1,
-1.459248, -1.81447, -3.003421, 1, 0.4862745, 0, 1,
-1.458399, 0.6410699, -1.423756, 1, 0.4901961, 0, 1,
-1.433295, -0.4182776, -0.9039508, 1, 0.4980392, 0, 1,
-1.419509, 0.04431469, -3.087358, 1, 0.5058824, 0, 1,
-1.417277, -1.847027, -2.149886, 1, 0.509804, 0, 1,
-1.415271, -0.477307, -3.201242, 1, 0.5176471, 0, 1,
-1.414774, 0.0988994, -2.352445, 1, 0.5215687, 0, 1,
-1.406752, 0.986605, -1.093408, 1, 0.5294118, 0, 1,
-1.394094, 1.730211, 0.4324185, 1, 0.5333334, 0, 1,
-1.381524, 1.174389, 0.525065, 1, 0.5411765, 0, 1,
-1.37205, -0.5817631, -0.780315, 1, 0.5450981, 0, 1,
-1.367136, 0.1909141, 0.1445521, 1, 0.5529412, 0, 1,
-1.36703, 1.532315, -1.385815, 1, 0.5568628, 0, 1,
-1.363717, -0.2378988, -2.112607, 1, 0.5647059, 0, 1,
-1.362711, -0.2854615, -3.205829, 1, 0.5686275, 0, 1,
-1.349387, -1.058476, -2.607796, 1, 0.5764706, 0, 1,
-1.347328, -0.1875845, -1.318209, 1, 0.5803922, 0, 1,
-1.345087, -0.3279441, -2.546272, 1, 0.5882353, 0, 1,
-1.340481, -0.93014, -3.20481, 1, 0.5921569, 0, 1,
-1.334908, -2.220229, -3.682278, 1, 0.6, 0, 1,
-1.321841, -0.4714156, -2.12384, 1, 0.6078432, 0, 1,
-1.319478, -1.334748, -0.9717134, 1, 0.6117647, 0, 1,
-1.309513, -0.4223806, -1.115325, 1, 0.6196079, 0, 1,
-1.306003, -0.4075452, -1.772782, 1, 0.6235294, 0, 1,
-1.302259, 0.8030897, -1.793315, 1, 0.6313726, 0, 1,
-1.295966, -0.2029604, -1.786652, 1, 0.6352941, 0, 1,
-1.293547, -0.04676693, -1.732796, 1, 0.6431373, 0, 1,
-1.284615, 1.893709, -0.4541169, 1, 0.6470588, 0, 1,
-1.283328, 0.04264596, -1.963102, 1, 0.654902, 0, 1,
-1.27287, 1.562316, 0.8518609, 1, 0.6588235, 0, 1,
-1.267695, -0.003261424, -2.663826, 1, 0.6666667, 0, 1,
-1.259009, -0.4350827, 0.5631456, 1, 0.6705883, 0, 1,
-1.253399, 0.01333367, -0.8252989, 1, 0.6784314, 0, 1,
-1.226016, -0.4699253, -1.418754, 1, 0.682353, 0, 1,
-1.221377, -0.08701262, -1.722276, 1, 0.6901961, 0, 1,
-1.212189, -1.59373, -2.00372, 1, 0.6941177, 0, 1,
-1.20679, -0.5223333, -2.224715, 1, 0.7019608, 0, 1,
-1.201658, 0.4699055, -0.1406109, 1, 0.7098039, 0, 1,
-1.199413, 0.03243165, 0.5738141, 1, 0.7137255, 0, 1,
-1.194098, -0.7505612, -1.6752, 1, 0.7215686, 0, 1,
-1.19264, -0.3513999, -0.3495735, 1, 0.7254902, 0, 1,
-1.186877, -1.790035, -2.260235, 1, 0.7333333, 0, 1,
-1.17089, 0.9618887, -0.6437235, 1, 0.7372549, 0, 1,
-1.161237, -1.830858, -2.533496, 1, 0.7450981, 0, 1,
-1.155865, -1.429758, -1.147302, 1, 0.7490196, 0, 1,
-1.153157, -1.50217, -2.271511, 1, 0.7568628, 0, 1,
-1.146586, 0.4980626, -1.744826, 1, 0.7607843, 0, 1,
-1.141027, 0.9370405, -1.790733, 1, 0.7686275, 0, 1,
-1.138219, -0.4146043, -1.883966, 1, 0.772549, 0, 1,
-1.135522, -0.4182202, -2.28508, 1, 0.7803922, 0, 1,
-1.134822, -0.6084331, -3.078186, 1, 0.7843137, 0, 1,
-1.134512, -1.219317, -3.231856, 1, 0.7921569, 0, 1,
-1.118555, 1.370703, -0.4748273, 1, 0.7960784, 0, 1,
-1.10765, -0.8501366, -1.941931, 1, 0.8039216, 0, 1,
-1.10594, 1.064067, -0.7153344, 1, 0.8117647, 0, 1,
-1.099828, -0.1330056, 0.07796934, 1, 0.8156863, 0, 1,
-1.099263, -1.033905, -4.618302, 1, 0.8235294, 0, 1,
-1.095079, 0.4806412, -0.7746975, 1, 0.827451, 0, 1,
-1.09271, 0.6622074, -1.549378, 1, 0.8352941, 0, 1,
-1.080645, 0.9159502, -0.8322701, 1, 0.8392157, 0, 1,
-1.075864, -0.6970357, -2.736221, 1, 0.8470588, 0, 1,
-1.069928, 0.5136664, -1.862867, 1, 0.8509804, 0, 1,
-1.058447, -0.3874987, -2.869026, 1, 0.8588235, 0, 1,
-1.056633, 1.687857, -0.9611896, 1, 0.8627451, 0, 1,
-1.046255, 1.55618, 0.7969405, 1, 0.8705882, 0, 1,
-1.039001, 1.183589, -2.344977, 1, 0.8745098, 0, 1,
-1.037802, 0.1477576, -0.1506315, 1, 0.8823529, 0, 1,
-1.036027, -1.219483, -4.151263, 1, 0.8862745, 0, 1,
-1.033006, 0.3230309, 0.5631356, 1, 0.8941177, 0, 1,
-1.032088, 1.726327, -0.1838064, 1, 0.8980392, 0, 1,
-1.030672, -0.1743692, -0.9262953, 1, 0.9058824, 0, 1,
-1.022918, -0.7198261, -2.546088, 1, 0.9137255, 0, 1,
-1.015681, 0.03232908, -1.253022, 1, 0.9176471, 0, 1,
-1.007875, -1.657612, -2.125363, 1, 0.9254902, 0, 1,
-1.000608, -0.2280919, -2.312365, 1, 0.9294118, 0, 1,
-0.9974304, -0.9113411, -1.716063, 1, 0.9372549, 0, 1,
-0.9971251, -0.9867463, -1.422906, 1, 0.9411765, 0, 1,
-0.9916394, 0.9551554, -1.320606, 1, 0.9490196, 0, 1,
-0.9904836, 1.330178, -1.442395, 1, 0.9529412, 0, 1,
-0.9851862, -0.2318492, -0.6649657, 1, 0.9607843, 0, 1,
-0.9827165, 0.5093459, -0.6794268, 1, 0.9647059, 0, 1,
-0.9811297, 0.06738681, -0.7784349, 1, 0.972549, 0, 1,
-0.972766, -0.3738684, -0.8939957, 1, 0.9764706, 0, 1,
-0.9702871, 0.217253, -0.3937734, 1, 0.9843137, 0, 1,
-0.9673274, 0.545236, -1.306327, 1, 0.9882353, 0, 1,
-0.9642757, -0.6147354, -4.096014, 1, 0.9960784, 0, 1,
-0.9520402, 0.4078241, -3.132466, 0.9960784, 1, 0, 1,
-0.9420287, 0.2992062, -1.058308, 0.9921569, 1, 0, 1,
-0.9403774, 3.208015, -2.072607, 0.9843137, 1, 0, 1,
-0.934048, 0.1212793, -1.935166, 0.9803922, 1, 0, 1,
-0.932898, -0.5478103, -1.880518, 0.972549, 1, 0, 1,
-0.9311578, -0.8236936, -2.574208, 0.9686275, 1, 0, 1,
-0.9266508, 0.2473344, -1.684808, 0.9607843, 1, 0, 1,
-0.9185136, 0.8831987, -1.376869, 0.9568627, 1, 0, 1,
-0.9116668, 0.8458718, -2.483665, 0.9490196, 1, 0, 1,
-0.9079288, -1.810602, -2.472466, 0.945098, 1, 0, 1,
-0.9027961, 1.041363, -0.06158969, 0.9372549, 1, 0, 1,
-0.8979492, 0.4467907, -0.6683553, 0.9333333, 1, 0, 1,
-0.8973459, -0.102509, -1.548295, 0.9254902, 1, 0, 1,
-0.8860763, 1.267892, -1.084036, 0.9215686, 1, 0, 1,
-0.8845108, 1.418127, -1.250894, 0.9137255, 1, 0, 1,
-0.8779659, -0.9423552, -4.523209, 0.9098039, 1, 0, 1,
-0.8744882, -0.007276868, -1.654307, 0.9019608, 1, 0, 1,
-0.8724327, 1.384209, -0.2048018, 0.8941177, 1, 0, 1,
-0.8704029, -0.5062048, -0.5227888, 0.8901961, 1, 0, 1,
-0.854864, -0.4909378, -3.312828, 0.8823529, 1, 0, 1,
-0.849929, 0.4473463, -1.463556, 0.8784314, 1, 0, 1,
-0.8432155, 1.919131, -1.431923, 0.8705882, 1, 0, 1,
-0.8406966, -2.001774, -2.64669, 0.8666667, 1, 0, 1,
-0.8348247, -0.02149644, -1.215494, 0.8588235, 1, 0, 1,
-0.8343611, -0.2780487, -0.7738252, 0.854902, 1, 0, 1,
-0.8323735, -0.2187215, -1.605644, 0.8470588, 1, 0, 1,
-0.8231788, 0.06693564, -1.358248, 0.8431373, 1, 0, 1,
-0.8165644, -0.3395807, -0.1023713, 0.8352941, 1, 0, 1,
-0.8021576, -0.1558084, -2.049577, 0.8313726, 1, 0, 1,
-0.8015576, -1.290835, -1.380104, 0.8235294, 1, 0, 1,
-0.7948427, 0.5454322, -1.790889, 0.8196079, 1, 0, 1,
-0.7932464, -1.302905, -1.694516, 0.8117647, 1, 0, 1,
-0.78447, -1.489619, -1.733447, 0.8078431, 1, 0, 1,
-0.7842529, 0.05273468, -2.39162, 0.8, 1, 0, 1,
-0.7803678, 0.06090885, 0.7444426, 0.7921569, 1, 0, 1,
-0.7793874, -0.0568319, -1.292362, 0.7882353, 1, 0, 1,
-0.7789848, -1.110418, -3.826707, 0.7803922, 1, 0, 1,
-0.7748718, -1.886875, -1.123164, 0.7764706, 1, 0, 1,
-0.7624766, 0.8868006, -0.6722267, 0.7686275, 1, 0, 1,
-0.7613274, -0.4587223, -1.374745, 0.7647059, 1, 0, 1,
-0.7592616, -0.7249511, -1.567597, 0.7568628, 1, 0, 1,
-0.7565143, 0.9731372, 0.88211, 0.7529412, 1, 0, 1,
-0.7504297, -0.1023562, -2.086718, 0.7450981, 1, 0, 1,
-0.7488108, 0.2393912, -1.463104, 0.7411765, 1, 0, 1,
-0.7486774, -0.176875, -1.271304, 0.7333333, 1, 0, 1,
-0.7483851, -1.181274, -2.578999, 0.7294118, 1, 0, 1,
-0.7427587, 0.6788655, 0.9757291, 0.7215686, 1, 0, 1,
-0.7330416, 0.7091884, 0.5093424, 0.7176471, 1, 0, 1,
-0.732567, 0.3272853, -1.968512, 0.7098039, 1, 0, 1,
-0.7296015, -0.1964283, -2.495458, 0.7058824, 1, 0, 1,
-0.7261481, -0.217858, -0.3773114, 0.6980392, 1, 0, 1,
-0.7178403, 0.4894613, -1.037259, 0.6901961, 1, 0, 1,
-0.7166879, -0.6488465, -2.039478, 0.6862745, 1, 0, 1,
-0.7128886, -1.18269, -2.126342, 0.6784314, 1, 0, 1,
-0.7084247, -0.4350059, -3.530834, 0.6745098, 1, 0, 1,
-0.7074706, 1.05738, -2.244071, 0.6666667, 1, 0, 1,
-0.7046193, -0.5785502, -2.851528, 0.6627451, 1, 0, 1,
-0.7031936, 0.2382463, -3.536094, 0.654902, 1, 0, 1,
-0.7009585, 1.220382, 0.2531953, 0.6509804, 1, 0, 1,
-0.6994771, -0.2467163, -0.4799822, 0.6431373, 1, 0, 1,
-0.6983545, 1.044702, 0.5955018, 0.6392157, 1, 0, 1,
-0.6930014, -1.043994, -1.721467, 0.6313726, 1, 0, 1,
-0.6919666, 0.7129171, -0.1336222, 0.627451, 1, 0, 1,
-0.6918492, 0.1712013, -1.835268, 0.6196079, 1, 0, 1,
-0.6917679, 0.2030179, -1.717896, 0.6156863, 1, 0, 1,
-0.6896652, 0.3558634, 0.3804526, 0.6078432, 1, 0, 1,
-0.681619, -0.1830627, -1.751765, 0.6039216, 1, 0, 1,
-0.6778862, 0.01402757, -2.509697, 0.5960785, 1, 0, 1,
-0.6776168, 1.225392, -1.159389, 0.5882353, 1, 0, 1,
-0.6745559, 0.01494652, -0.7934147, 0.5843138, 1, 0, 1,
-0.6742749, 0.3142962, -1.527205, 0.5764706, 1, 0, 1,
-0.6715771, -1.179295, -3.411657, 0.572549, 1, 0, 1,
-0.6663517, 0.6876003, -0.08130674, 0.5647059, 1, 0, 1,
-0.6658806, -0.7922095, -1.264775, 0.5607843, 1, 0, 1,
-0.6640464, -0.9434833, -3.872837, 0.5529412, 1, 0, 1,
-0.663581, -0.9122452, -2.899505, 0.5490196, 1, 0, 1,
-0.6628169, -1.29559, -1.599661, 0.5411765, 1, 0, 1,
-0.6594859, 1.114934, -1.646154, 0.5372549, 1, 0, 1,
-0.6591641, -0.7959066, -3.707928, 0.5294118, 1, 0, 1,
-0.656486, 0.08267469, -2.674182, 0.5254902, 1, 0, 1,
-0.6496828, -0.3413268, -2.863944, 0.5176471, 1, 0, 1,
-0.6487342, -0.08434959, -1.476693, 0.5137255, 1, 0, 1,
-0.6452382, -0.3593421, -1.655051, 0.5058824, 1, 0, 1,
-0.6440309, -0.108571, -1.77506, 0.5019608, 1, 0, 1,
-0.6424546, -0.7361762, -1.01315, 0.4941176, 1, 0, 1,
-0.6358692, 1.155359, -0.003747491, 0.4862745, 1, 0, 1,
-0.631087, -0.8002926, -3.653828, 0.4823529, 1, 0, 1,
-0.6294253, 1.512097, 0.1596337, 0.4745098, 1, 0, 1,
-0.6266374, 1.307314, -0.2561232, 0.4705882, 1, 0, 1,
-0.622807, -0.987958, -3.442283, 0.4627451, 1, 0, 1,
-0.6111109, 0.8496448, -1.777916, 0.4588235, 1, 0, 1,
-0.6096688, -1.316473, -2.988149, 0.4509804, 1, 0, 1,
-0.6051868, 1.137937, -0.08047354, 0.4470588, 1, 0, 1,
-0.6051648, -0.6768155, -3.314554, 0.4392157, 1, 0, 1,
-0.6043058, -0.2873026, -2.198496, 0.4352941, 1, 0, 1,
-0.6026904, -0.03789774, -2.043539, 0.427451, 1, 0, 1,
-0.5964552, 0.148797, 0.2575969, 0.4235294, 1, 0, 1,
-0.5949918, -0.6922643, -2.414204, 0.4156863, 1, 0, 1,
-0.5929368, 0.569832, -0.5976202, 0.4117647, 1, 0, 1,
-0.586239, -0.06347417, -1.225347, 0.4039216, 1, 0, 1,
-0.5856935, -0.652734, -1.276813, 0.3960784, 1, 0, 1,
-0.5856689, -0.08357575, -3.737682, 0.3921569, 1, 0, 1,
-0.5856585, -1.284104, -4.227519, 0.3843137, 1, 0, 1,
-0.5850016, 0.6083198, -0.3764618, 0.3803922, 1, 0, 1,
-0.5803834, -0.2273097, -1.853569, 0.372549, 1, 0, 1,
-0.5754418, -0.3830816, -2.610235, 0.3686275, 1, 0, 1,
-0.5715392, -0.616221, -2.424975, 0.3607843, 1, 0, 1,
-0.5704275, 0.157859, -1.873918, 0.3568628, 1, 0, 1,
-0.5681742, -2.397135, -4.050517, 0.3490196, 1, 0, 1,
-0.5679464, -0.4039163, -3.551829, 0.345098, 1, 0, 1,
-0.5664794, 1.064118, -0.5380001, 0.3372549, 1, 0, 1,
-0.5556599, -1.092148, -2.127963, 0.3333333, 1, 0, 1,
-0.5537735, 1.615626, -3.595803, 0.3254902, 1, 0, 1,
-0.5517249, 1.10535, -1.774733, 0.3215686, 1, 0, 1,
-0.5512667, -0.8184902, -2.55794, 0.3137255, 1, 0, 1,
-0.5495338, -0.9838744, -2.997476, 0.3098039, 1, 0, 1,
-0.5465868, -0.1449072, -3.326501, 0.3019608, 1, 0, 1,
-0.5446419, -0.04221981, -0.266556, 0.2941177, 1, 0, 1,
-0.5431957, 1.365286, -1.317662, 0.2901961, 1, 0, 1,
-0.5423652, 2.233617, -0.2204267, 0.282353, 1, 0, 1,
-0.5335793, -1.130738, -1.424576, 0.2784314, 1, 0, 1,
-0.5320607, 0.2191678, -2.231045, 0.2705882, 1, 0, 1,
-0.5304312, -1.236767, -3.649231, 0.2666667, 1, 0, 1,
-0.5303411, -0.2974055, -1.092756, 0.2588235, 1, 0, 1,
-0.5291941, -0.2920834, -1.667523, 0.254902, 1, 0, 1,
-0.5287432, -0.8336176, -4.161785, 0.2470588, 1, 0, 1,
-0.5266844, -0.6876888, -3.122439, 0.2431373, 1, 0, 1,
-0.5220356, -1.337062, -1.495891, 0.2352941, 1, 0, 1,
-0.5205916, 0.3770018, -0.6694713, 0.2313726, 1, 0, 1,
-0.5181935, -0.09827232, -2.323742, 0.2235294, 1, 0, 1,
-0.5168754, -1.496702, -2.028829, 0.2196078, 1, 0, 1,
-0.5118763, 0.3551816, -1.04271, 0.2117647, 1, 0, 1,
-0.5076924, -1.242439, -3.283865, 0.2078431, 1, 0, 1,
-0.5061423, 0.4518928, 0.4249428, 0.2, 1, 0, 1,
-0.5012254, 0.3653113, -0.8081949, 0.1921569, 1, 0, 1,
-0.5002474, 0.7450646, -1.048408, 0.1882353, 1, 0, 1,
-0.4969294, 0.3819484, -0.9867418, 0.1803922, 1, 0, 1,
-0.4938977, -1.398962, -2.119614, 0.1764706, 1, 0, 1,
-0.4922951, 2.438129, 0.3097881, 0.1686275, 1, 0, 1,
-0.489188, 0.4051291, -1.694837, 0.1647059, 1, 0, 1,
-0.4888946, -0.1175957, -0.5362591, 0.1568628, 1, 0, 1,
-0.4887843, 0.3359676, -0.767574, 0.1529412, 1, 0, 1,
-0.4886235, -0.7969978, -3.021644, 0.145098, 1, 0, 1,
-0.4875411, 2.009246, -1.73875, 0.1411765, 1, 0, 1,
-0.4865823, 0.001528813, -2.293848, 0.1333333, 1, 0, 1,
-0.4854162, -0.714543, -2.250654, 0.1294118, 1, 0, 1,
-0.4841639, 0.7079735, -1.813622, 0.1215686, 1, 0, 1,
-0.483738, -0.8043004, -1.280746, 0.1176471, 1, 0, 1,
-0.4789986, -0.1574583, -0.8087046, 0.1098039, 1, 0, 1,
-0.4716661, -0.3285851, -2.855689, 0.1058824, 1, 0, 1,
-0.4697571, 0.9198802, -1.0825, 0.09803922, 1, 0, 1,
-0.4650068, -1.31956, -2.337684, 0.09019608, 1, 0, 1,
-0.4639589, 0.264109, -0.4813772, 0.08627451, 1, 0, 1,
-0.463788, -1.038443, -2.989968, 0.07843138, 1, 0, 1,
-0.4610296, 1.480969, -0.2191221, 0.07450981, 1, 0, 1,
-0.4589834, 0.8629335, 2.388807, 0.06666667, 1, 0, 1,
-0.4564056, -1.655518, -3.301017, 0.0627451, 1, 0, 1,
-0.4519712, -1.000884, -1.589406, 0.05490196, 1, 0, 1,
-0.449797, 0.6541508, -0.1386441, 0.05098039, 1, 0, 1,
-0.4491603, 2.281383, -1.491097, 0.04313726, 1, 0, 1,
-0.4488861, -0.1515041, -1.436888, 0.03921569, 1, 0, 1,
-0.4392093, -1.160843, -4.60171, 0.03137255, 1, 0, 1,
-0.4378225, 0.1105454, -1.869515, 0.02745098, 1, 0, 1,
-0.4344404, 0.05965086, -1.738204, 0.01960784, 1, 0, 1,
-0.4334671, 0.4069861, -1.856629, 0.01568628, 1, 0, 1,
-0.4325358, 1.919668, -0.9796078, 0.007843138, 1, 0, 1,
-0.4309276, 1.576272, 0.9392143, 0.003921569, 1, 0, 1,
-0.4277187, -1.372734, -2.625475, 0, 1, 0.003921569, 1,
-0.4259892, 1.061084, 0.2252236, 0, 1, 0.01176471, 1,
-0.4214585, -1.154059, -3.032668, 0, 1, 0.01568628, 1,
-0.421009, -0.3737146, -1.824364, 0, 1, 0.02352941, 1,
-0.4164833, 0.9347496, 0.1134467, 0, 1, 0.02745098, 1,
-0.4154918, 0.4224693, -0.5484259, 0, 1, 0.03529412, 1,
-0.4114238, 0.2063081, -2.328619, 0, 1, 0.03921569, 1,
-0.4113855, -0.8903439, -1.196104, 0, 1, 0.04705882, 1,
-0.4038204, 0.5549263, -1.379117, 0, 1, 0.05098039, 1,
-0.40163, -1.516668, -1.765556, 0, 1, 0.05882353, 1,
-0.4009856, -1.108358, -3.575697, 0, 1, 0.0627451, 1,
-0.399269, 0.9039285, -1.615046, 0, 1, 0.07058824, 1,
-0.3966216, 1.846949, -1.557817, 0, 1, 0.07450981, 1,
-0.3956875, 0.4606099, 0.2706473, 0, 1, 0.08235294, 1,
-0.392524, 0.5788623, 0.0781771, 0, 1, 0.08627451, 1,
-0.390842, -1.025193, -2.371488, 0, 1, 0.09411765, 1,
-0.3903143, -0.09116794, -0.4180394, 0, 1, 0.1019608, 1,
-0.3860134, 1.255289, -0.3944524, 0, 1, 0.1058824, 1,
-0.3838248, 1.691124, -0.3291182, 0, 1, 0.1137255, 1,
-0.381879, 0.3567244, -1.961471, 0, 1, 0.1176471, 1,
-0.3728197, 0.3786767, -2.223723, 0, 1, 0.1254902, 1,
-0.3725173, -1.706951, -2.244869, 0, 1, 0.1294118, 1,
-0.3714721, 0.7442732, -0.2211839, 0, 1, 0.1372549, 1,
-0.3697504, -1.855012, -1.461412, 0, 1, 0.1411765, 1,
-0.3586556, -0.03368711, -2.592319, 0, 1, 0.1490196, 1,
-0.3576294, 0.2209131, -0.2531137, 0, 1, 0.1529412, 1,
-0.3574418, -1.079844, -2.569509, 0, 1, 0.1607843, 1,
-0.3573961, -0.3304717, -2.052987, 0, 1, 0.1647059, 1,
-0.3553202, 0.6187792, -0.352724, 0, 1, 0.172549, 1,
-0.3545461, -0.4557954, -3.022462, 0, 1, 0.1764706, 1,
-0.3506665, -1.265225, -3.02829, 0, 1, 0.1843137, 1,
-0.3483583, 0.2303228, -0.835875, 0, 1, 0.1882353, 1,
-0.3483041, 0.02520837, 0.7714436, 0, 1, 0.1960784, 1,
-0.3465543, 1.154258, 0.5190525, 0, 1, 0.2039216, 1,
-0.345066, 2.528934, -0.008966656, 0, 1, 0.2078431, 1,
-0.3362109, -0.5675819, -1.21601, 0, 1, 0.2156863, 1,
-0.3339201, 1.803117, -0.1526574, 0, 1, 0.2196078, 1,
-0.3332558, -0.8801214, -3.014842, 0, 1, 0.227451, 1,
-0.3331087, 0.154117, -0.1259769, 0, 1, 0.2313726, 1,
-0.3298054, -0.9614573, -3.266085, 0, 1, 0.2392157, 1,
-0.3254542, -1.279131, -2.623062, 0, 1, 0.2431373, 1,
-0.3249522, 0.6521782, 0.2935727, 0, 1, 0.2509804, 1,
-0.3234246, -0.395645, -3.838641, 0, 1, 0.254902, 1,
-0.322049, -0.7375688, -2.49575, 0, 1, 0.2627451, 1,
-0.3197534, -0.5514686, -2.602688, 0, 1, 0.2666667, 1,
-0.3193108, -1.50695, -2.191803, 0, 1, 0.2745098, 1,
-0.3171599, -0.9712698, -1.157194, 0, 1, 0.2784314, 1,
-0.31645, 1.117305, -0.01277246, 0, 1, 0.2862745, 1,
-0.3134135, 0.621905, 0.2311122, 0, 1, 0.2901961, 1,
-0.3124447, -1.105336, -1.815653, 0, 1, 0.2980392, 1,
-0.3108714, -1.400887, -1.252227, 0, 1, 0.3058824, 1,
-0.3035813, -0.08580543, -2.712977, 0, 1, 0.3098039, 1,
-0.3014417, -0.7570734, -2.974625, 0, 1, 0.3176471, 1,
-0.2979518, 0.02480805, -0.2309416, 0, 1, 0.3215686, 1,
-0.2911634, 0.8129963, -1.582249, 0, 1, 0.3294118, 1,
-0.2859544, 0.1790617, -0.1133871, 0, 1, 0.3333333, 1,
-0.2841836, 1.594437, -1.532043, 0, 1, 0.3411765, 1,
-0.2824682, 0.1039275, -1.88846, 0, 1, 0.345098, 1,
-0.2762671, -0.4120231, -1.193491, 0, 1, 0.3529412, 1,
-0.2746336, 0.545932, -0.5695872, 0, 1, 0.3568628, 1,
-0.2739392, 0.9881615, -0.3847156, 0, 1, 0.3647059, 1,
-0.2734347, -1.288622, -3.187343, 0, 1, 0.3686275, 1,
-0.2688984, -0.4348144, -1.498567, 0, 1, 0.3764706, 1,
-0.2685031, -0.1689005, -2.017658, 0, 1, 0.3803922, 1,
-0.267669, -1.464905, -3.884763, 0, 1, 0.3882353, 1,
-0.2644129, 1.226375, -0.3689788, 0, 1, 0.3921569, 1,
-0.2596787, -1.136303, -3.313352, 0, 1, 0.4, 1,
-0.2586999, 0.1260095, -2.161265, 0, 1, 0.4078431, 1,
-0.2501333, 0.3250188, 1.452611, 0, 1, 0.4117647, 1,
-0.2483568, -1.306098, -2.883417, 0, 1, 0.4196078, 1,
-0.245118, -0.1007195, -2.240602, 0, 1, 0.4235294, 1,
-0.2448416, -2.071589, -4.101028, 0, 1, 0.4313726, 1,
-0.2438349, -0.955259, -1.956437, 0, 1, 0.4352941, 1,
-0.2437068, 2.143046, 0.4165879, 0, 1, 0.4431373, 1,
-0.2428974, -0.1395352, -0.5716299, 0, 1, 0.4470588, 1,
-0.2401072, -0.2241078, -4.063667, 0, 1, 0.454902, 1,
-0.2388869, 0.7072395, 1.041089, 0, 1, 0.4588235, 1,
-0.2373592, 0.7600341, -1.180522, 0, 1, 0.4666667, 1,
-0.2351839, 0.8208668, -0.250516, 0, 1, 0.4705882, 1,
-0.231873, -1.713256, -2.973391, 0, 1, 0.4784314, 1,
-0.2270524, -0.3954572, -1.9228, 0, 1, 0.4823529, 1,
-0.226978, -1.404052, -2.975121, 0, 1, 0.4901961, 1,
-0.2263093, -1.134266, -2.917487, 0, 1, 0.4941176, 1,
-0.2257391, -0.693309, -1.841555, 0, 1, 0.5019608, 1,
-0.2238327, 0.3843109, -1.00301, 0, 1, 0.509804, 1,
-0.2228778, -1.294149, -3.132403, 0, 1, 0.5137255, 1,
-0.2214511, 1.338714, 0.5748116, 0, 1, 0.5215687, 1,
-0.2198898, -1.440594, -3.847285, 0, 1, 0.5254902, 1,
-0.2187748, 0.1029032, -0.8389828, 0, 1, 0.5333334, 1,
-0.2111502, -0.7270746, -2.726393, 0, 1, 0.5372549, 1,
-0.2089424, 0.6632892, -1.835423, 0, 1, 0.5450981, 1,
-0.2041663, -2.490135, -3.948428, 0, 1, 0.5490196, 1,
-0.202892, -1.853263, -2.920531, 0, 1, 0.5568628, 1,
-0.2000028, 0.291164, 0.5063019, 0, 1, 0.5607843, 1,
-0.1978453, 1.042671, -0.3194787, 0, 1, 0.5686275, 1,
-0.1970717, -0.9567717, -4.278015, 0, 1, 0.572549, 1,
-0.195436, -0.6925214, -3.759089, 0, 1, 0.5803922, 1,
-0.1890751, -0.8749503, -3.48439, 0, 1, 0.5843138, 1,
-0.1835617, 1.364507, 0.1367627, 0, 1, 0.5921569, 1,
-0.1828412, 0.3162979, -2.014236, 0, 1, 0.5960785, 1,
-0.1784644, 0.7984667, -0.05215918, 0, 1, 0.6039216, 1,
-0.1733629, -0.9708869, -2.594011, 0, 1, 0.6117647, 1,
-0.1724689, 1.235063, -0.20099, 0, 1, 0.6156863, 1,
-0.1705677, 0.2022222, -1.606655, 0, 1, 0.6235294, 1,
-0.1704194, -1.986513, -0.7177374, 0, 1, 0.627451, 1,
-0.170081, 1.243133, -1.163814, 0, 1, 0.6352941, 1,
-0.1669568, -2.168589, -2.444921, 0, 1, 0.6392157, 1,
-0.1669257, 0.07887694, -0.507683, 0, 1, 0.6470588, 1,
-0.1588927, -2.851691, -4.018817, 0, 1, 0.6509804, 1,
-0.1454169, -1.144158, -2.201755, 0, 1, 0.6588235, 1,
-0.1419297, -0.495666, -2.91734, 0, 1, 0.6627451, 1,
-0.1384034, -2.840924, -4.8038, 0, 1, 0.6705883, 1,
-0.1368997, -1.535501, -2.100547, 0, 1, 0.6745098, 1,
-0.1334969, 0.3729241, 0.7354808, 0, 1, 0.682353, 1,
-0.1333717, 0.9838607, -0.3929445, 0, 1, 0.6862745, 1,
-0.1325949, -0.4656316, -2.776557, 0, 1, 0.6941177, 1,
-0.1303622, 1.463789, -0.5238836, 0, 1, 0.7019608, 1,
-0.1297317, 0.6913086, 0.3116685, 0, 1, 0.7058824, 1,
-0.1275791, -0.737635, -3.131773, 0, 1, 0.7137255, 1,
-0.1271121, -0.6165895, -2.608231, 0, 1, 0.7176471, 1,
-0.1264676, 1.463098, 0.29335, 0, 1, 0.7254902, 1,
-0.1231072, -0.2848403, -2.800253, 0, 1, 0.7294118, 1,
-0.1224321, 0.9956953, 1.611017, 0, 1, 0.7372549, 1,
-0.1222306, 0.2287666, 1.227633, 0, 1, 0.7411765, 1,
-0.1217007, 0.9759983, 0.9622037, 0, 1, 0.7490196, 1,
-0.119839, -0.4084752, -4.202135, 0, 1, 0.7529412, 1,
-0.1195213, 0.06986242, -2.503453, 0, 1, 0.7607843, 1,
-0.1184288, 1.084866, -0.1360674, 0, 1, 0.7647059, 1,
-0.1181963, -0.2539768, -3.678229, 0, 1, 0.772549, 1,
-0.1163968, -0.2865984, -5.275128, 0, 1, 0.7764706, 1,
-0.1159694, -0.5392519, -3.8074, 0, 1, 0.7843137, 1,
-0.1098076, -0.1289394, -0.4645271, 0, 1, 0.7882353, 1,
-0.1095665, 1.284495, -1.895222, 0, 1, 0.7960784, 1,
-0.104546, -1.005444, -3.307213, 0, 1, 0.8039216, 1,
-0.09844257, 0.4507094, 2.284683, 0, 1, 0.8078431, 1,
-0.09678545, 3.17571, -0.6479581, 0, 1, 0.8156863, 1,
-0.08956298, -0.9372818, -1.486148, 0, 1, 0.8196079, 1,
-0.08862508, -0.8029749, -1.568464, 0, 1, 0.827451, 1,
-0.08552376, 0.6882143, 0.5599704, 0, 1, 0.8313726, 1,
-0.08479557, 0.6656686, 0.9408184, 0, 1, 0.8392157, 1,
-0.08277248, -0.2810125, -2.932934, 0, 1, 0.8431373, 1,
-0.08098637, 0.7444153, -0.3623265, 0, 1, 0.8509804, 1,
-0.07628848, -0.152014, -3.186057, 0, 1, 0.854902, 1,
-0.07489585, 0.1214823, -0.2963821, 0, 1, 0.8627451, 1,
-0.07221036, -0.4316814, -1.158286, 0, 1, 0.8666667, 1,
-0.07217523, -0.4406254, -3.362498, 0, 1, 0.8745098, 1,
-0.06117033, -0.598595, -3.602707, 0, 1, 0.8784314, 1,
-0.0555754, 0.9557037, -0.3834425, 0, 1, 0.8862745, 1,
-0.05343848, 0.1050286, -0.8304982, 0, 1, 0.8901961, 1,
-0.05195501, -0.5932731, -1.877011, 0, 1, 0.8980392, 1,
-0.05071485, -0.1460761, -2.030252, 0, 1, 0.9058824, 1,
-0.04812375, -1.419565, -2.706818, 0, 1, 0.9098039, 1,
-0.04499916, 0.7511364, 2.645682, 0, 1, 0.9176471, 1,
-0.0389222, 0.9482074, -0.3749353, 0, 1, 0.9215686, 1,
-0.03488721, 0.05936438, -1.793977, 0, 1, 0.9294118, 1,
-0.03445433, 0.5959823, 0.07459871, 0, 1, 0.9333333, 1,
-0.02998847, -0.5185964, -2.24252, 0, 1, 0.9411765, 1,
-0.02869253, 0.06186975, -0.3494297, 0, 1, 0.945098, 1,
-0.02836019, -0.5379557, -4.734171, 0, 1, 0.9529412, 1,
-0.0263348, -0.1738929, -6.649672, 0, 1, 0.9568627, 1,
-0.02180915, -0.09378351, -3.067223, 0, 1, 0.9647059, 1,
-0.02135446, 2.540391, -0.6992515, 0, 1, 0.9686275, 1,
-0.01611228, 0.6835242, 0.412943, 0, 1, 0.9764706, 1,
-0.01338635, 1.643341, -0.8950371, 0, 1, 0.9803922, 1,
-0.003035501, 0.1573858, -2.455774, 0, 1, 0.9882353, 1,
-0.002536745, -2.166003, -3.074347, 0, 1, 0.9921569, 1,
2.149362e-05, -3.655037, 3.652583, 0, 1, 1, 1,
0.005138896, -2.371454, 2.748677, 0, 0.9921569, 1, 1,
0.008518251, -0.8788076, 4.89588, 0, 0.9882353, 1, 1,
0.01747497, 0.5239116, 0.7497675, 0, 0.9803922, 1, 1,
0.01810478, -1.160332, 2.715022, 0, 0.9764706, 1, 1,
0.02266348, 0.4978552, 0.6409818, 0, 0.9686275, 1, 1,
0.03163308, 0.7104954, 1.301684, 0, 0.9647059, 1, 1,
0.03443156, 1.90068, 0.5368117, 0, 0.9568627, 1, 1,
0.04995533, -2.2434, 2.159215, 0, 0.9529412, 1, 1,
0.05628928, -0.3533585, 1.191969, 0, 0.945098, 1, 1,
0.05780336, -0.4487617, 5.113487, 0, 0.9411765, 1, 1,
0.05783112, -1.113225, 0.01032952, 0, 0.9333333, 1, 1,
0.0582288, 0.4043967, -0.5880173, 0, 0.9294118, 1, 1,
0.05864894, 0.3152928, 0.3863096, 0, 0.9215686, 1, 1,
0.05911467, -1.094291, 4.526921, 0, 0.9176471, 1, 1,
0.06073396, 0.2849225, 0.3799862, 0, 0.9098039, 1, 1,
0.06312463, 0.07612864, 0.8948387, 0, 0.9058824, 1, 1,
0.06487673, -0.4543189, 1.765447, 0, 0.8980392, 1, 1,
0.0676606, -0.6642778, 1.697649, 0, 0.8901961, 1, 1,
0.07135747, -1.177701, 3.345393, 0, 0.8862745, 1, 1,
0.0713975, -0.2073127, 2.217872, 0, 0.8784314, 1, 1,
0.0748456, -0.02475416, 2.703549, 0, 0.8745098, 1, 1,
0.07624726, 0.9071831, 0.8837482, 0, 0.8666667, 1, 1,
0.07719826, 1.620614, 0.3494609, 0, 0.8627451, 1, 1,
0.08124827, -0.2080826, 4.961556, 0, 0.854902, 1, 1,
0.08164237, 2.000214, 1.612435, 0, 0.8509804, 1, 1,
0.08302529, 1.537244, -0.5970623, 0, 0.8431373, 1, 1,
0.0865737, 0.2993822, 0.1158222, 0, 0.8392157, 1, 1,
0.08902523, 0.593573, 0.5063945, 0, 0.8313726, 1, 1,
0.09013806, -1.41827, 3.682248, 0, 0.827451, 1, 1,
0.09062106, 2.333762, 1.177472, 0, 0.8196079, 1, 1,
0.09319966, -0.01558681, 0.8619233, 0, 0.8156863, 1, 1,
0.09326421, 0.6393713, 0.6196642, 0, 0.8078431, 1, 1,
0.1018899, -0.6417801, 2.246738, 0, 0.8039216, 1, 1,
0.1028823, -0.3317582, 1.487192, 0, 0.7960784, 1, 1,
0.108853, 0.5114313, -0.6091894, 0, 0.7882353, 1, 1,
0.1116988, 1.185989, 1.273376, 0, 0.7843137, 1, 1,
0.1121846, -2.108994, 4.418458, 0, 0.7764706, 1, 1,
0.1136894, -2.080547, 2.81795, 0, 0.772549, 1, 1,
0.1218084, 0.562197, -0.3232288, 0, 0.7647059, 1, 1,
0.122221, -0.6815317, 3.129171, 0, 0.7607843, 1, 1,
0.1263257, 1.152619, -1.233643, 0, 0.7529412, 1, 1,
0.1305289, -2.156027, 2.90197, 0, 0.7490196, 1, 1,
0.1321154, -0.7499073, 3.190955, 0, 0.7411765, 1, 1,
0.1325978, 0.1124303, -0.2431405, 0, 0.7372549, 1, 1,
0.133661, -0.9231011, 2.270002, 0, 0.7294118, 1, 1,
0.1348668, 0.2852057, -1.284411, 0, 0.7254902, 1, 1,
0.1359411, -0.6049471, 3.150933, 0, 0.7176471, 1, 1,
0.1414248, -1.193247, 3.261412, 0, 0.7137255, 1, 1,
0.1415845, -0.8559569, 3.997861, 0, 0.7058824, 1, 1,
0.1435265, 0.5448492, -0.764046, 0, 0.6980392, 1, 1,
0.1457836, -0.1642618, 2.061807, 0, 0.6941177, 1, 1,
0.1488702, -1.314666, 3.278229, 0, 0.6862745, 1, 1,
0.1544259, 2.204692, 0.9017487, 0, 0.682353, 1, 1,
0.1552265, -0.6684533, 3.83872, 0, 0.6745098, 1, 1,
0.1554256, -1.157524, 4.163184, 0, 0.6705883, 1, 1,
0.1577743, -0.5847697, 1.384434, 0, 0.6627451, 1, 1,
0.1654608, -0.143481, 2.988952, 0, 0.6588235, 1, 1,
0.1662922, -1.13645, 3.671825, 0, 0.6509804, 1, 1,
0.168253, -0.3934096, 1.863244, 0, 0.6470588, 1, 1,
0.1694335, 1.559969, 0.49428, 0, 0.6392157, 1, 1,
0.1712704, -0.04535185, 3.151577, 0, 0.6352941, 1, 1,
0.1717893, -1.277233, 1.492293, 0, 0.627451, 1, 1,
0.1726699, 0.396595, 0.4161526, 0, 0.6235294, 1, 1,
0.1752313, -0.194452, 1.321259, 0, 0.6156863, 1, 1,
0.1756718, 0.120295, 0.5753632, 0, 0.6117647, 1, 1,
0.1759289, 0.7606104, 0.6300085, 0, 0.6039216, 1, 1,
0.1764755, -0.4661627, 6.074466, 0, 0.5960785, 1, 1,
0.1785262, 0.8365597, 0.1403056, 0, 0.5921569, 1, 1,
0.1801247, 0.3122435, -0.2439213, 0, 0.5843138, 1, 1,
0.1817242, 0.5165, 0.4348262, 0, 0.5803922, 1, 1,
0.1833446, 0.6349449, 0.3632776, 0, 0.572549, 1, 1,
0.1857516, 0.2417104, 0.09416724, 0, 0.5686275, 1, 1,
0.186419, 0.7521515, 1.648792, 0, 0.5607843, 1, 1,
0.1886244, -0.3615137, 3.03459, 0, 0.5568628, 1, 1,
0.191003, 1.690981, 0.7947637, 0, 0.5490196, 1, 1,
0.1950133, -0.7964131, 3.094265, 0, 0.5450981, 1, 1,
0.1951624, 0.5116964, 1.113851, 0, 0.5372549, 1, 1,
0.2006398, -2.456029, 4.662353, 0, 0.5333334, 1, 1,
0.2008105, -0.2087802, 1.595566, 0, 0.5254902, 1, 1,
0.2074194, 1.467747, -0.03599589, 0, 0.5215687, 1, 1,
0.2094974, 0.1108762, 0.866841, 0, 0.5137255, 1, 1,
0.2147078, -1.610332, 2.278916, 0, 0.509804, 1, 1,
0.2162783, -0.5467131, 3.854206, 0, 0.5019608, 1, 1,
0.2180619, -0.234345, 1.242958, 0, 0.4941176, 1, 1,
0.2295547, -0.868225, 3.750158, 0, 0.4901961, 1, 1,
0.2320077, 0.008165532, 1.852071, 0, 0.4823529, 1, 1,
0.2330864, -3.488198, 2.36914, 0, 0.4784314, 1, 1,
0.2364605, -1.968957, 3.072569, 0, 0.4705882, 1, 1,
0.2373598, -0.2619565, 1.185788, 0, 0.4666667, 1, 1,
0.241311, 0.3266906, 0.1665058, 0, 0.4588235, 1, 1,
0.2422461, -0.9042077, 1.998652, 0, 0.454902, 1, 1,
0.2430517, -0.1093365, 1.836179, 0, 0.4470588, 1, 1,
0.2450382, -0.005300273, 2.916429, 0, 0.4431373, 1, 1,
0.2450563, 0.3298326, 1.331418, 0, 0.4352941, 1, 1,
0.2477164, -1.215517, 4.421287, 0, 0.4313726, 1, 1,
0.2520639, 1.150789, 0.9028901, 0, 0.4235294, 1, 1,
0.2542881, 0.8073781, -0.4554448, 0, 0.4196078, 1, 1,
0.2591412, -0.603896, 2.892689, 0, 0.4117647, 1, 1,
0.2625704, 1.21427, -0.6832392, 0, 0.4078431, 1, 1,
0.2638337, -0.1577801, 2.534811, 0, 0.4, 1, 1,
0.2646193, -0.6911862, 2.692633, 0, 0.3921569, 1, 1,
0.265243, 0.9221203, -1.130235, 0, 0.3882353, 1, 1,
0.2690043, 0.1959102, 0.9534675, 0, 0.3803922, 1, 1,
0.2704085, 0.7732227, 0.4569019, 0, 0.3764706, 1, 1,
0.2752579, -0.5443416, 2.33354, 0, 0.3686275, 1, 1,
0.2795039, 0.3792831, 0.7569783, 0, 0.3647059, 1, 1,
0.2801279, -0.2825527, 1.887363, 0, 0.3568628, 1, 1,
0.2804186, 0.0324573, 1.36667, 0, 0.3529412, 1, 1,
0.2813735, 0.1280476, 0.3058035, 0, 0.345098, 1, 1,
0.2846814, -1.280041, 2.608594, 0, 0.3411765, 1, 1,
0.2853461, -2.557472, 2.861073, 0, 0.3333333, 1, 1,
0.2881482, 0.2380856, 1.915137, 0, 0.3294118, 1, 1,
0.2927434, 0.2792857, 0.5110855, 0, 0.3215686, 1, 1,
0.2928826, -1.289248, 2.230656, 0, 0.3176471, 1, 1,
0.2946458, 1.471705, -0.3804388, 0, 0.3098039, 1, 1,
0.2985069, 0.342708, 1.545727, 0, 0.3058824, 1, 1,
0.2989044, 0.5839325, 2.10205, 0, 0.2980392, 1, 1,
0.2997542, -0.4501551, 3.149194, 0, 0.2901961, 1, 1,
0.304717, 2.282793, -0.4164988, 0, 0.2862745, 1, 1,
0.3048856, -0.2640396, 1.966915, 0, 0.2784314, 1, 1,
0.3054621, 0.6537206, 0.7534968, 0, 0.2745098, 1, 1,
0.3096431, -2.188083, 3.586154, 0, 0.2666667, 1, 1,
0.3097025, -0.1696719, 0.6661637, 0, 0.2627451, 1, 1,
0.3102918, -0.8010814, 2.822421, 0, 0.254902, 1, 1,
0.3124673, -1.864198, 4.071204, 0, 0.2509804, 1, 1,
0.3155931, 0.1527999, 1.007445, 0, 0.2431373, 1, 1,
0.315619, 0.06494964, 1.051231, 0, 0.2392157, 1, 1,
0.3158205, 0.6233736, 2.008675, 0, 0.2313726, 1, 1,
0.3186968, 0.1156451, 1.55254, 0, 0.227451, 1, 1,
0.3226289, 0.9358193, -0.9562916, 0, 0.2196078, 1, 1,
0.3231973, 0.2598971, 0.5769606, 0, 0.2156863, 1, 1,
0.3236018, 0.7504619, -0.4143728, 0, 0.2078431, 1, 1,
0.3252034, -0.3060069, 2.296843, 0, 0.2039216, 1, 1,
0.3286766, 1.187515, 0.50222, 0, 0.1960784, 1, 1,
0.3288398, -0.6476111, 2.423506, 0, 0.1882353, 1, 1,
0.3324857, 0.1751648, -0.5451928, 0, 0.1843137, 1, 1,
0.3330729, 2.674144, -0.4078222, 0, 0.1764706, 1, 1,
0.333791, 0.7235879, 0.7628193, 0, 0.172549, 1, 1,
0.3369694, -0.2906398, 1.998724, 0, 0.1647059, 1, 1,
0.3372655, 0.7331455, 1.586861, 0, 0.1607843, 1, 1,
0.3404645, -0.9629349, 1.503457, 0, 0.1529412, 1, 1,
0.3429107, -0.465047, 2.167424, 0, 0.1490196, 1, 1,
0.3434962, 0.4641832, 0.1458216, 0, 0.1411765, 1, 1,
0.3450048, 0.4751549, 0.1365665, 0, 0.1372549, 1, 1,
0.3474996, -0.05531759, 1.885147, 0, 0.1294118, 1, 1,
0.3481053, 0.5510647, 0.9376286, 0, 0.1254902, 1, 1,
0.3483929, -0.02242509, 1.527324, 0, 0.1176471, 1, 1,
0.3492177, -1.998057, 4.201921, 0, 0.1137255, 1, 1,
0.3515781, -1.910735, 4.004478, 0, 0.1058824, 1, 1,
0.351714, 0.6833056, -0.3698668, 0, 0.09803922, 1, 1,
0.3545265, 1.617181, 0.3102272, 0, 0.09411765, 1, 1,
0.355839, -1.228586, 2.623587, 0, 0.08627451, 1, 1,
0.3571878, -0.4910642, 1.253652, 0, 0.08235294, 1, 1,
0.3620887, -0.03320426, 3.395336, 0, 0.07450981, 1, 1,
0.3621438, -3.147647, 3.195463, 0, 0.07058824, 1, 1,
0.3673711, 0.7848533, 1.805467, 0, 0.0627451, 1, 1,
0.3728922, -0.5939175, 2.126719, 0, 0.05882353, 1, 1,
0.3758408, 0.377014, 0.6227548, 0, 0.05098039, 1, 1,
0.3772846, 2.366371, 0.3380485, 0, 0.04705882, 1, 1,
0.3831109, 1.003351, 0.5855486, 0, 0.03921569, 1, 1,
0.3848159, -0.2818893, 2.158369, 0, 0.03529412, 1, 1,
0.3858839, -0.5824039, 2.240016, 0, 0.02745098, 1, 1,
0.3872893, 0.8435, 1.341751, 0, 0.02352941, 1, 1,
0.388534, -1.072526, 3.073282, 0, 0.01568628, 1, 1,
0.3887093, -0.6949232, 3.207212, 0, 0.01176471, 1, 1,
0.3920229, 2.205755, -0.8265216, 0, 0.003921569, 1, 1,
0.3995526, 0.1381388, 2.559459, 0.003921569, 0, 1, 1,
0.4000341, -2.890949, 2.262142, 0.007843138, 0, 1, 1,
0.4033635, -0.4163248, 2.650518, 0.01568628, 0, 1, 1,
0.409579, 0.2322194, 1.920994, 0.01960784, 0, 1, 1,
0.4122038, -0.6023407, 2.514256, 0.02745098, 0, 1, 1,
0.4140621, 0.7012995, 1.790758, 0.03137255, 0, 1, 1,
0.4143869, -1.078026, 2.10047, 0.03921569, 0, 1, 1,
0.4176123, -0.1038285, 1.963879, 0.04313726, 0, 1, 1,
0.4192771, -1.735121, 2.848881, 0.05098039, 0, 1, 1,
0.4238036, 0.6635732, 0.4285156, 0.05490196, 0, 1, 1,
0.4243961, 0.3731966, 1.043281, 0.0627451, 0, 1, 1,
0.4245317, 0.6903642, 0.5588528, 0.06666667, 0, 1, 1,
0.4251603, 0.4403193, 1.738006, 0.07450981, 0, 1, 1,
0.4287382, -0.06777537, 0.2339542, 0.07843138, 0, 1, 1,
0.4299604, 0.7503418, 0.1684858, 0.08627451, 0, 1, 1,
0.4305582, -0.1616924, 2.021324, 0.09019608, 0, 1, 1,
0.430811, 0.9396681, -0.2342472, 0.09803922, 0, 1, 1,
0.4343881, 0.5859334, 0.5987018, 0.1058824, 0, 1, 1,
0.4360836, 0.23658, 0.244036, 0.1098039, 0, 1, 1,
0.4367245, -0.3630233, 3.141651, 0.1176471, 0, 1, 1,
0.4393466, 1.360076, 1.926239, 0.1215686, 0, 1, 1,
0.4417369, -0.3770612, 0.4586023, 0.1294118, 0, 1, 1,
0.4457882, 0.6859005, 0.3021197, 0.1333333, 0, 1, 1,
0.4481985, -0.6511833, 2.926501, 0.1411765, 0, 1, 1,
0.4486904, 0.2445675, 0.5921119, 0.145098, 0, 1, 1,
0.4512189, 1.423666, -0.09950104, 0.1529412, 0, 1, 1,
0.4556747, -1.893555, 1.891371, 0.1568628, 0, 1, 1,
0.456395, 1.332094, -0.08800373, 0.1647059, 0, 1, 1,
0.45774, -0.05734492, 0.7524168, 0.1686275, 0, 1, 1,
0.4591886, 0.8620777, 0.2622515, 0.1764706, 0, 1, 1,
0.4635335, 0.2115107, 1.153638, 0.1803922, 0, 1, 1,
0.4674373, 0.7250309, 1.739745, 0.1882353, 0, 1, 1,
0.4683452, 0.6308382, 1.031122, 0.1921569, 0, 1, 1,
0.4686899, -1.085883, 3.25174, 0.2, 0, 1, 1,
0.4701316, -0.094661, 1.42089, 0.2078431, 0, 1, 1,
0.4720365, 0.892246, -0.3578351, 0.2117647, 0, 1, 1,
0.4725603, 0.08244404, 1.886222, 0.2196078, 0, 1, 1,
0.4760251, -0.2563333, 1.828673, 0.2235294, 0, 1, 1,
0.4780259, 1.042463, -0.6175908, 0.2313726, 0, 1, 1,
0.4780653, 1.723767, -0.2287971, 0.2352941, 0, 1, 1,
0.4839637, -1.417879, 3.619328, 0.2431373, 0, 1, 1,
0.4850158, 0.3362717, 1.462469, 0.2470588, 0, 1, 1,
0.4851324, -0.7540867, 2.133775, 0.254902, 0, 1, 1,
0.4869418, 2.686612, -1.381723, 0.2588235, 0, 1, 1,
0.4876864, 0.3527547, 0.6700656, 0.2666667, 0, 1, 1,
0.4901311, -0.6774843, 3.661944, 0.2705882, 0, 1, 1,
0.4931089, 0.2351489, 0.06359694, 0.2784314, 0, 1, 1,
0.4946724, 1.373359, 1.259116, 0.282353, 0, 1, 1,
0.4952848, -0.5506419, 1.402114, 0.2901961, 0, 1, 1,
0.4967757, -0.313602, 2.244081, 0.2941177, 0, 1, 1,
0.5030066, 0.07803476, 2.357541, 0.3019608, 0, 1, 1,
0.5039291, -1.346665, 3.329313, 0.3098039, 0, 1, 1,
0.5049334, -0.1515892, 0.463119, 0.3137255, 0, 1, 1,
0.5063646, 1.840163, 1.018067, 0.3215686, 0, 1, 1,
0.5070357, 0.8198614, 0.4423525, 0.3254902, 0, 1, 1,
0.5139062, -0.17781, 1.935967, 0.3333333, 0, 1, 1,
0.515534, 0.04610792, 1.267425, 0.3372549, 0, 1, 1,
0.5157755, 0.8280948, -1.563109, 0.345098, 0, 1, 1,
0.5194194, -0.2160297, 2.059335, 0.3490196, 0, 1, 1,
0.519747, -0.7908889, 0.7462148, 0.3568628, 0, 1, 1,
0.5225843, -0.0201121, 1.931071, 0.3607843, 0, 1, 1,
0.5268564, 1.741707, -1.586349, 0.3686275, 0, 1, 1,
0.5292103, -1.793733, 2.83919, 0.372549, 0, 1, 1,
0.531289, -1.636286, 3.710422, 0.3803922, 0, 1, 1,
0.5316984, -0.6015565, 2.486782, 0.3843137, 0, 1, 1,
0.5347137, -0.08852699, 2.05476, 0.3921569, 0, 1, 1,
0.5392798, 0.4162199, 0.9780864, 0.3960784, 0, 1, 1,
0.53985, 0.4086357, 0.7094917, 0.4039216, 0, 1, 1,
0.5421643, 0.1921456, 0.4123739, 0.4117647, 0, 1, 1,
0.5478203, -0.6684649, 2.723752, 0.4156863, 0, 1, 1,
0.5485552, -0.2737965, 1.139152, 0.4235294, 0, 1, 1,
0.5558227, 0.4084474, 1.415188, 0.427451, 0, 1, 1,
0.5594047, 0.08283112, 1.581919, 0.4352941, 0, 1, 1,
0.5704842, -1.392796, 2.109647, 0.4392157, 0, 1, 1,
0.5762943, 1.065019, 0.9116628, 0.4470588, 0, 1, 1,
0.5800973, -0.4256822, 2.874282, 0.4509804, 0, 1, 1,
0.5820395, -0.5430784, 2.984282, 0.4588235, 0, 1, 1,
0.5858775, 0.7912247, -0.3612413, 0.4627451, 0, 1, 1,
0.5914355, 1.367678, -1.066383, 0.4705882, 0, 1, 1,
0.591486, 0.9204634, -0.3261175, 0.4745098, 0, 1, 1,
0.5931972, 1.86932, 1.470774, 0.4823529, 0, 1, 1,
0.5933207, -0.9495403, 1.496595, 0.4862745, 0, 1, 1,
0.5942158, -1.116, 3.20843, 0.4941176, 0, 1, 1,
0.5947071, -0.8978915, 2.636029, 0.5019608, 0, 1, 1,
0.5960713, 0.4794225, 1.786011, 0.5058824, 0, 1, 1,
0.5985849, -1.894305, 2.64461, 0.5137255, 0, 1, 1,
0.5989591, -1.038954, 2.04337, 0.5176471, 0, 1, 1,
0.6010056, 1.491586, 1.300385, 0.5254902, 0, 1, 1,
0.6051908, -1.335062, 2.243272, 0.5294118, 0, 1, 1,
0.6076013, -0.4327573, 4.197851, 0.5372549, 0, 1, 1,
0.6108672, -1.306299, 3.538611, 0.5411765, 0, 1, 1,
0.614302, 2.663219, 2.105505, 0.5490196, 0, 1, 1,
0.6152121, 0.6538405, 2.454412, 0.5529412, 0, 1, 1,
0.6223178, -1.108199, 2.302151, 0.5607843, 0, 1, 1,
0.6284299, 0.7562709, 1.371892, 0.5647059, 0, 1, 1,
0.6293835, 1.690713, 1.738566, 0.572549, 0, 1, 1,
0.6305476, 1.269569, 2.327199, 0.5764706, 0, 1, 1,
0.6359385, -0.9150723, 2.863052, 0.5843138, 0, 1, 1,
0.6598052, 0.3289356, 1.654834, 0.5882353, 0, 1, 1,
0.6612011, 0.113994, 1.458675, 0.5960785, 0, 1, 1,
0.6643733, 1.896039, 1.407237, 0.6039216, 0, 1, 1,
0.6663343, 1.369237, 1.937206, 0.6078432, 0, 1, 1,
0.6764005, 0.9360241, -1.251429, 0.6156863, 0, 1, 1,
0.6775851, 0.4019871, -0.9991567, 0.6196079, 0, 1, 1,
0.6811885, 1.200279, -1.196474, 0.627451, 0, 1, 1,
0.6818935, -0.5306788, 2.90952, 0.6313726, 0, 1, 1,
0.6823979, -0.2346658, 1.174015, 0.6392157, 0, 1, 1,
0.6845803, 2.108051, 0.380134, 0.6431373, 0, 1, 1,
0.6867886, 0.6661947, -0.2202545, 0.6509804, 0, 1, 1,
0.6933221, -1.210428, 1.946637, 0.654902, 0, 1, 1,
0.6935474, 1.594187, -1.060332, 0.6627451, 0, 1, 1,
0.6970023, -2.153808, 2.508136, 0.6666667, 0, 1, 1,
0.7005674, -0.3881381, 2.597171, 0.6745098, 0, 1, 1,
0.7015429, 0.4668308, 0.0868323, 0.6784314, 0, 1, 1,
0.7043897, -0.638752, 2.801611, 0.6862745, 0, 1, 1,
0.7049075, 0.012858, 1.473316, 0.6901961, 0, 1, 1,
0.7088961, 1.357499, -0.2411512, 0.6980392, 0, 1, 1,
0.7148508, 1.997595, -2.467482, 0.7058824, 0, 1, 1,
0.7149639, -1.700559, 1.458181, 0.7098039, 0, 1, 1,
0.7179852, -0.6707723, 2.273207, 0.7176471, 0, 1, 1,
0.7190056, 1.588022, 2.490282, 0.7215686, 0, 1, 1,
0.7231562, 0.1071879, 1.844305, 0.7294118, 0, 1, 1,
0.7243981, 0.5824715, 2.107818, 0.7333333, 0, 1, 1,
0.7265432, -0.696779, 1.396272, 0.7411765, 0, 1, 1,
0.726882, -0.7037657, 1.01545, 0.7450981, 0, 1, 1,
0.727075, 0.8612699, 2.319408, 0.7529412, 0, 1, 1,
0.7294618, -0.05524119, 1.185982, 0.7568628, 0, 1, 1,
0.7295176, 0.8408314, 0.05257118, 0.7647059, 0, 1, 1,
0.7344708, 1.08975, 0.7183242, 0.7686275, 0, 1, 1,
0.7439326, 1.324157, -0.05782829, 0.7764706, 0, 1, 1,
0.7465513, -1.183432, 1.127976, 0.7803922, 0, 1, 1,
0.7482934, 0.922651, 1.11506, 0.7882353, 0, 1, 1,
0.7501639, 0.1685921, 1.827334, 0.7921569, 0, 1, 1,
0.7559541, 1.564, -1.937957, 0.8, 0, 1, 1,
0.7580841, -1.01433, 3.449246, 0.8078431, 0, 1, 1,
0.7607552, 0.5046995, -0.3133838, 0.8117647, 0, 1, 1,
0.7638142, -0.3834248, 4.166991, 0.8196079, 0, 1, 1,
0.7642412, 0.07245848, 1.141727, 0.8235294, 0, 1, 1,
0.7659552, 0.3218992, 1.173427, 0.8313726, 0, 1, 1,
0.7729855, -0.3112546, 1.006202, 0.8352941, 0, 1, 1,
0.7764304, -1.33548, 5.337518, 0.8431373, 0, 1, 1,
0.7771349, 0.413232, 0.003603774, 0.8470588, 0, 1, 1,
0.7785816, 0.2456333, 1.073225, 0.854902, 0, 1, 1,
0.7793261, -0.7287658, 3.628836, 0.8588235, 0, 1, 1,
0.786271, 0.9961368, 0.1466821, 0.8666667, 0, 1, 1,
0.7888586, 0.2332802, 1.634822, 0.8705882, 0, 1, 1,
0.7894714, 0.452965, 0.9579778, 0.8784314, 0, 1, 1,
0.7940573, 1.422801, 1.097691, 0.8823529, 0, 1, 1,
0.8101343, -0.345378, 0.8817166, 0.8901961, 0, 1, 1,
0.8126344, 1.92038, 0.2730033, 0.8941177, 0, 1, 1,
0.8136893, -0.3732947, 2.320068, 0.9019608, 0, 1, 1,
0.8174098, -1.908978, 1.901147, 0.9098039, 0, 1, 1,
0.8330459, -1.137213, 2.855994, 0.9137255, 0, 1, 1,
0.8361576, -1.118427, 4.689979, 0.9215686, 0, 1, 1,
0.8373522, -1.255999, 3.396915, 0.9254902, 0, 1, 1,
0.8431972, 0.06519022, 2.499617, 0.9333333, 0, 1, 1,
0.8440815, -0.7827709, 2.142777, 0.9372549, 0, 1, 1,
0.8457242, 1.814353, 0.5431877, 0.945098, 0, 1, 1,
0.8553762, -0.2219717, 2.317741, 0.9490196, 0, 1, 1,
0.8643187, 0.8810883, -1.258496, 0.9568627, 0, 1, 1,
0.8755302, -1.169691, 1.882246, 0.9607843, 0, 1, 1,
0.8757758, -0.3496054, 4.329107, 0.9686275, 0, 1, 1,
0.8804161, 0.5942615, 0.05485242, 0.972549, 0, 1, 1,
0.8812602, 0.507616, 1.189838, 0.9803922, 0, 1, 1,
0.8814136, 1.199775, -0.5835885, 0.9843137, 0, 1, 1,
0.8896875, -1.05087, 3.704824, 0.9921569, 0, 1, 1,
0.8936712, -1.839036, 1.453683, 0.9960784, 0, 1, 1,
0.8965648, 1.111939, 1.258233, 1, 0, 0.9960784, 1,
0.8994349, -0.5123134, 2.543777, 1, 0, 0.9882353, 1,
0.9002613, -0.3521983, 0.8284513, 1, 0, 0.9843137, 1,
0.9056277, 1.224339, 1.947725, 1, 0, 0.9764706, 1,
0.9092926, -0.04081126, 3.617342, 1, 0, 0.972549, 1,
0.911853, -1.242584, 2.224287, 1, 0, 0.9647059, 1,
0.9218634, -0.6345856, 0.5697802, 1, 0, 0.9607843, 1,
0.9278707, 0.4419131, 2.934087, 1, 0, 0.9529412, 1,
0.9328789, 0.5977497, -0.9767271, 1, 0, 0.9490196, 1,
0.9332336, 0.3173803, -0.8973401, 1, 0, 0.9411765, 1,
0.9350756, -0.9478562, 1.487175, 1, 0, 0.9372549, 1,
0.9382712, 0.4829979, 2.454305, 1, 0, 0.9294118, 1,
0.9520289, 1.33925, 0.277052, 1, 0, 0.9254902, 1,
0.9577855, -0.8592489, -0.5934213, 1, 0, 0.9176471, 1,
0.9579163, 0.9380156, 1.047537, 1, 0, 0.9137255, 1,
0.958215, 0.8394686, 0.001966665, 1, 0, 0.9058824, 1,
0.9619191, -0.5881175, 2.435354, 1, 0, 0.9019608, 1,
0.9634928, 0.1551061, 1.131014, 1, 0, 0.8941177, 1,
0.9650407, 1.327887, -0.0170444, 1, 0, 0.8862745, 1,
0.9650444, -0.3141031, 0.9613009, 1, 0, 0.8823529, 1,
0.9698706, 0.9130903, 2.275312, 1, 0, 0.8745098, 1,
0.9748442, -1.344159, 1.121708, 1, 0, 0.8705882, 1,
0.9766265, -0.3189341, 1.689365, 1, 0, 0.8627451, 1,
0.9769195, -1.048812, 3.270938, 1, 0, 0.8588235, 1,
0.9794639, 1.242118, 0.4610669, 1, 0, 0.8509804, 1,
0.9880854, -1.620413, 0.6167482, 1, 0, 0.8470588, 1,
0.9923837, 0.07061868, 1.427854, 1, 0, 0.8392157, 1,
0.993481, -2.113377, 0.7391757, 1, 0, 0.8352941, 1,
0.9968218, -1.649921, 3.66218, 1, 0, 0.827451, 1,
0.9994751, -0.7483079, 3.696793, 1, 0, 0.8235294, 1,
1.02099, -0.7650494, 2.261579, 1, 0, 0.8156863, 1,
1.021859, 0.1279769, 0.4304518, 1, 0, 0.8117647, 1,
1.024927, -1.200588, 2.414133, 1, 0, 0.8039216, 1,
1.027752, -0.2647644, 2.25106, 1, 0, 0.7960784, 1,
1.035052, 1.574347, 0.2248346, 1, 0, 0.7921569, 1,
1.037713, 2.090257, 1.735492, 1, 0, 0.7843137, 1,
1.039047, -1.04597, 0.3668052, 1, 0, 0.7803922, 1,
1.042849, -0.0880148, 2.706787, 1, 0, 0.772549, 1,
1.043214, 0.7343259, 0.2798157, 1, 0, 0.7686275, 1,
1.047005, -1.507626, 1.592876, 1, 0, 0.7607843, 1,
1.04777, 1.090841, 0.60872, 1, 0, 0.7568628, 1,
1.051276, 0.1825612, 1.853961, 1, 0, 0.7490196, 1,
1.053922, 1.030754, 1.052438, 1, 0, 0.7450981, 1,
1.063031, -0.6691238, 4.365815, 1, 0, 0.7372549, 1,
1.068991, -0.3108195, 2.795767, 1, 0, 0.7333333, 1,
1.069117, -0.8304959, 2.263972, 1, 0, 0.7254902, 1,
1.069325, 0.5344872, 1.434252, 1, 0, 0.7215686, 1,
1.077778, 0.3461594, 2.897487, 1, 0, 0.7137255, 1,
1.084004, -1.336781, 2.226576, 1, 0, 0.7098039, 1,
1.085661, -0.5665311, 1.776614, 1, 0, 0.7019608, 1,
1.088887, 0.2287253, 0.811114, 1, 0, 0.6941177, 1,
1.104518, -0.235293, 2.185255, 1, 0, 0.6901961, 1,
1.107876, 0.4944334, 0.2126595, 1, 0, 0.682353, 1,
1.10975, -1.273016, 2.853975, 1, 0, 0.6784314, 1,
1.111957, -0.6408439, 2.368723, 1, 0, 0.6705883, 1,
1.118005, -1.138323, 1.962107, 1, 0, 0.6666667, 1,
1.119585, -0.1894011, 1.359559, 1, 0, 0.6588235, 1,
1.126595, -0.8591257, -0.3068478, 1, 0, 0.654902, 1,
1.138327, 0.03073149, 4.208504, 1, 0, 0.6470588, 1,
1.140118, 1.21334, 0.2563817, 1, 0, 0.6431373, 1,
1.142587, -1.846198, 3.439015, 1, 0, 0.6352941, 1,
1.149947, 0.3058738, -0.5805989, 1, 0, 0.6313726, 1,
1.15113, 1.800301, -0.02186012, 1, 0, 0.6235294, 1,
1.154761, 0.3171819, 0.414582, 1, 0, 0.6196079, 1,
1.160474, 0.1648941, 1.274782, 1, 0, 0.6117647, 1,
1.160736, 1.927172, 1.181092, 1, 0, 0.6078432, 1,
1.173884, 0.5300881, 1.840616, 1, 0, 0.6, 1,
1.182112, 2.131956, 1.491763, 1, 0, 0.5921569, 1,
1.185661, -0.7986321, 1.015995, 1, 0, 0.5882353, 1,
1.192625, 0.6201454, 1.678878, 1, 0, 0.5803922, 1,
1.219816, 0.153375, 1.223615, 1, 0, 0.5764706, 1,
1.221763, -0.2790934, 2.846292, 1, 0, 0.5686275, 1,
1.226201, -0.7347326, 2.355045, 1, 0, 0.5647059, 1,
1.234484, 0.4292518, 0.5928183, 1, 0, 0.5568628, 1,
1.24029, -0.2662815, 2.212392, 1, 0, 0.5529412, 1,
1.2406, 2.003061, -0.9018989, 1, 0, 0.5450981, 1,
1.25362, 0.5727515, 0.5699813, 1, 0, 0.5411765, 1,
1.271996, 0.2479513, 1.880753, 1, 0, 0.5333334, 1,
1.272075, -0.8189179, 0.6906507, 1, 0, 0.5294118, 1,
1.2768, 0.05370945, 1.417208, 1, 0, 0.5215687, 1,
1.291669, -1.197192, 1.068731, 1, 0, 0.5176471, 1,
1.295814, -1.150012, 0.672785, 1, 0, 0.509804, 1,
1.301237, 0.7006131, 0.8875895, 1, 0, 0.5058824, 1,
1.302785, -0.8301966, 3.129365, 1, 0, 0.4980392, 1,
1.306092, 0.1437546, 2.012661, 1, 0, 0.4901961, 1,
1.313809, -1.03779, 1.705005, 1, 0, 0.4862745, 1,
1.318456, 0.8003979, 0.3470229, 1, 0, 0.4784314, 1,
1.325333, 0.5661074, 2.136735, 1, 0, 0.4745098, 1,
1.325938, 0.9524593, 1.364655, 1, 0, 0.4666667, 1,
1.329866, 1.444615, 2.236599, 1, 0, 0.4627451, 1,
1.330234, -0.2212858, 2.197515, 1, 0, 0.454902, 1,
1.332907, -2.063126, 3.055393, 1, 0, 0.4509804, 1,
1.336894, 0.2112122, 1.360106, 1, 0, 0.4431373, 1,
1.34817, -1.486702, 4.01019, 1, 0, 0.4392157, 1,
1.348234, 0.3305286, -0.5418996, 1, 0, 0.4313726, 1,
1.356498, -0.4393353, 1.487851, 1, 0, 0.427451, 1,
1.35813, -0.9170154, 2.711858, 1, 0, 0.4196078, 1,
1.366384, -0.744069, 1.347832, 1, 0, 0.4156863, 1,
1.367102, -1.591394, 3.280585, 1, 0, 0.4078431, 1,
1.379717, 0.1815671, 2.354284, 1, 0, 0.4039216, 1,
1.382377, -0.4252599, 3.007286, 1, 0, 0.3960784, 1,
1.385055, -2.33259, 3.125959, 1, 0, 0.3882353, 1,
1.387077, 1.559266, 0.09301654, 1, 0, 0.3843137, 1,
1.397803, 1.021077, 1.235308, 1, 0, 0.3764706, 1,
1.404557, -1.252837, 1.359396, 1, 0, 0.372549, 1,
1.423334, 0.1190345, 1.569139, 1, 0, 0.3647059, 1,
1.424165, -1.179796, 2.604941, 1, 0, 0.3607843, 1,
1.425536, 1.134439, 0.1682939, 1, 0, 0.3529412, 1,
1.429247, 1.5299, 1.523304, 1, 0, 0.3490196, 1,
1.439279, -0.3133723, 1.532298, 1, 0, 0.3411765, 1,
1.451988, 0.123918, 0.3534791, 1, 0, 0.3372549, 1,
1.455573, 0.1598861, 1.319377, 1, 0, 0.3294118, 1,
1.457704, 0.6397666, 2.527935, 1, 0, 0.3254902, 1,
1.485211, 1.07428, 0.6549017, 1, 0, 0.3176471, 1,
1.514151, 0.5586064, 0.9138637, 1, 0, 0.3137255, 1,
1.52603, 0.5185754, 1.259236, 1, 0, 0.3058824, 1,
1.536531, -0.784254, 0.8356364, 1, 0, 0.2980392, 1,
1.558433, 0.5993193, 0.4663724, 1, 0, 0.2941177, 1,
1.584122, -1.521403, 2.77769, 1, 0, 0.2862745, 1,
1.594073, 1.475596, 1.406967, 1, 0, 0.282353, 1,
1.650392, -1.180758, 2.012438, 1, 0, 0.2745098, 1,
1.676131, 1.679415, -0.8266351, 1, 0, 0.2705882, 1,
1.679101, 0.7002904, -0.517667, 1, 0, 0.2627451, 1,
1.691759, 1.766915, 3.467752, 1, 0, 0.2588235, 1,
1.698787, 0.3195075, 1.6273, 1, 0, 0.2509804, 1,
1.708602, -0.6147082, 1.585433, 1, 0, 0.2470588, 1,
1.713343, 0.3663923, 1.199808, 1, 0, 0.2392157, 1,
1.716675, -0.4393283, 1.563484, 1, 0, 0.2352941, 1,
1.726396, -1.485651, 1.995089, 1, 0, 0.227451, 1,
1.786024, 1.148959, 1.092942, 1, 0, 0.2235294, 1,
1.809986, 1.997545, -0.9907082, 1, 0, 0.2156863, 1,
1.831206, -0.04125362, 0.6798289, 1, 0, 0.2117647, 1,
1.875757, -0.4972792, 1.497744, 1, 0, 0.2039216, 1,
1.884437, -1.13333, 1.323002, 1, 0, 0.1960784, 1,
1.90089, -2.154957, 2.786613, 1, 0, 0.1921569, 1,
1.970632, -0.3675574, 0.6367909, 1, 0, 0.1843137, 1,
1.979458, -0.5710767, 1.34912, 1, 0, 0.1803922, 1,
1.991614, -0.4443438, 2.861681, 1, 0, 0.172549, 1,
2.065725, -0.1209624, 3.10264, 1, 0, 0.1686275, 1,
2.082736, 0.2152911, 0.5379701, 1, 0, 0.1607843, 1,
2.094734, 1.649195, 1.299014, 1, 0, 0.1568628, 1,
2.101313, -0.08707053, 2.204026, 1, 0, 0.1490196, 1,
2.140041, -0.08528585, 2.826003, 1, 0, 0.145098, 1,
2.143221, -0.5977347, 0.7321788, 1, 0, 0.1372549, 1,
2.1754, 0.3076401, 1.054605, 1, 0, 0.1333333, 1,
2.184942, 0.7500578, 0.2337936, 1, 0, 0.1254902, 1,
2.199584, 1.009715, 2.400995, 1, 0, 0.1215686, 1,
2.20444, 0.8606487, 1.131288, 1, 0, 0.1137255, 1,
2.217825, 0.6709393, 3.150055, 1, 0, 0.1098039, 1,
2.236887, 1.508116, 0.07414756, 1, 0, 0.1019608, 1,
2.276949, -0.7593892, -0.4661248, 1, 0, 0.09411765, 1,
2.299022, 0.1863444, 2.685865, 1, 0, 0.09019608, 1,
2.35248, -0.7971102, 1.073217, 1, 0, 0.08235294, 1,
2.365654, -0.8895184, 1.88206, 1, 0, 0.07843138, 1,
2.402307, 0.4468395, 2.082545, 1, 0, 0.07058824, 1,
2.434316, 2.098405, -0.03567046, 1, 0, 0.06666667, 1,
2.50292, -1.139845, 1.875524, 1, 0, 0.05882353, 1,
2.512679, -0.3953826, 2.139916, 1, 0, 0.05490196, 1,
2.635014, -0.4863408, 2.124664, 1, 0, 0.04705882, 1,
2.656346, 0.717616, 2.650061, 1, 0, 0.04313726, 1,
2.755877, 0.1929535, 1.843835, 1, 0, 0.03529412, 1,
2.950071, 0.5680876, 2.271514, 1, 0, 0.03137255, 1,
2.986602, -0.07659473, 2.391363, 1, 0, 0.02352941, 1,
3.003858, 0.7083827, 1.93439, 1, 0, 0.01960784, 1,
3.220085, 0.7984933, 0.989442, 1, 0, 0.01176471, 1,
4.656998, 0.3253605, 0.9778158, 1, 0, 0.007843138, 1
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
0.7986327, -4.818324, -8.806414, 0, -0.5, 0.5, 0.5,
0.7986327, -4.818324, -8.806414, 1, -0.5, 0.5, 0.5,
0.7986327, -4.818324, -8.806414, 1, 1.5, 0.5, 0.5,
0.7986327, -4.818324, -8.806414, 0, 1.5, 0.5, 0.5
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
-4.367719, -0.2235107, -8.806414, 0, -0.5, 0.5, 0.5,
-4.367719, -0.2235107, -8.806414, 1, -0.5, 0.5, 0.5,
-4.367719, -0.2235107, -8.806414, 1, 1.5, 0.5, 0.5,
-4.367719, -0.2235107, -8.806414, 0, 1.5, 0.5, 0.5
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
-4.367719, -4.818324, -0.2876029, 0, -0.5, 0.5, 0.5,
-4.367719, -4.818324, -0.2876029, 1, -0.5, 0.5, 0.5,
-4.367719, -4.818324, -0.2876029, 1, 1.5, 0.5, 0.5,
-4.367719, -4.818324, -0.2876029, 0, 1.5, 0.5, 0.5
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
-2, -3.757982, -6.840534,
4, -3.757982, -6.840534,
-2, -3.757982, -6.840534,
-2, -3.934706, -7.16818,
0, -3.757982, -6.840534,
0, -3.934706, -7.16818,
2, -3.757982, -6.840534,
2, -3.934706, -7.16818,
4, -3.757982, -6.840534,
4, -3.934706, -7.16818
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
"0",
"2",
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
-2, -4.288153, -7.823474, 0, -0.5, 0.5, 0.5,
-2, -4.288153, -7.823474, 1, -0.5, 0.5, 0.5,
-2, -4.288153, -7.823474, 1, 1.5, 0.5, 0.5,
-2, -4.288153, -7.823474, 0, 1.5, 0.5, 0.5,
0, -4.288153, -7.823474, 0, -0.5, 0.5, 0.5,
0, -4.288153, -7.823474, 1, -0.5, 0.5, 0.5,
0, -4.288153, -7.823474, 1, 1.5, 0.5, 0.5,
0, -4.288153, -7.823474, 0, 1.5, 0.5, 0.5,
2, -4.288153, -7.823474, 0, -0.5, 0.5, 0.5,
2, -4.288153, -7.823474, 1, -0.5, 0.5, 0.5,
2, -4.288153, -7.823474, 1, 1.5, 0.5, 0.5,
2, -4.288153, -7.823474, 0, 1.5, 0.5, 0.5,
4, -4.288153, -7.823474, 0, -0.5, 0.5, 0.5,
4, -4.288153, -7.823474, 1, -0.5, 0.5, 0.5,
4, -4.288153, -7.823474, 1, 1.5, 0.5, 0.5,
4, -4.288153, -7.823474, 0, 1.5, 0.5, 0.5
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
-3.175484, -3, -6.840534,
-3.175484, 3, -6.840534,
-3.175484, -3, -6.840534,
-3.374189, -3, -7.16818,
-3.175484, -2, -6.840534,
-3.374189, -2, -7.16818,
-3.175484, -1, -6.840534,
-3.374189, -1, -7.16818,
-3.175484, 0, -6.840534,
-3.374189, 0, -7.16818,
-3.175484, 1, -6.840534,
-3.374189, 1, -7.16818,
-3.175484, 2, -6.840534,
-3.374189, 2, -7.16818,
-3.175484, 3, -6.840534,
-3.374189, 3, -7.16818
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
-3.771601, -3, -7.823474, 0, -0.5, 0.5, 0.5,
-3.771601, -3, -7.823474, 1, -0.5, 0.5, 0.5,
-3.771601, -3, -7.823474, 1, 1.5, 0.5, 0.5,
-3.771601, -3, -7.823474, 0, 1.5, 0.5, 0.5,
-3.771601, -2, -7.823474, 0, -0.5, 0.5, 0.5,
-3.771601, -2, -7.823474, 1, -0.5, 0.5, 0.5,
-3.771601, -2, -7.823474, 1, 1.5, 0.5, 0.5,
-3.771601, -2, -7.823474, 0, 1.5, 0.5, 0.5,
-3.771601, -1, -7.823474, 0, -0.5, 0.5, 0.5,
-3.771601, -1, -7.823474, 1, -0.5, 0.5, 0.5,
-3.771601, -1, -7.823474, 1, 1.5, 0.5, 0.5,
-3.771601, -1, -7.823474, 0, 1.5, 0.5, 0.5,
-3.771601, 0, -7.823474, 0, -0.5, 0.5, 0.5,
-3.771601, 0, -7.823474, 1, -0.5, 0.5, 0.5,
-3.771601, 0, -7.823474, 1, 1.5, 0.5, 0.5,
-3.771601, 0, -7.823474, 0, 1.5, 0.5, 0.5,
-3.771601, 1, -7.823474, 0, -0.5, 0.5, 0.5,
-3.771601, 1, -7.823474, 1, -0.5, 0.5, 0.5,
-3.771601, 1, -7.823474, 1, 1.5, 0.5, 0.5,
-3.771601, 1, -7.823474, 0, 1.5, 0.5, 0.5,
-3.771601, 2, -7.823474, 0, -0.5, 0.5, 0.5,
-3.771601, 2, -7.823474, 1, -0.5, 0.5, 0.5,
-3.771601, 2, -7.823474, 1, 1.5, 0.5, 0.5,
-3.771601, 2, -7.823474, 0, 1.5, 0.5, 0.5,
-3.771601, 3, -7.823474, 0, -0.5, 0.5, 0.5,
-3.771601, 3, -7.823474, 1, -0.5, 0.5, 0.5,
-3.771601, 3, -7.823474, 1, 1.5, 0.5, 0.5,
-3.771601, 3, -7.823474, 0, 1.5, 0.5, 0.5
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
-3.175484, -3.757982, -6,
-3.175484, -3.757982, 6,
-3.175484, -3.757982, -6,
-3.374189, -3.934706, -6,
-3.175484, -3.757982, -4,
-3.374189, -3.934706, -4,
-3.175484, -3.757982, -2,
-3.374189, -3.934706, -2,
-3.175484, -3.757982, 0,
-3.374189, -3.934706, 0,
-3.175484, -3.757982, 2,
-3.374189, -3.934706, 2,
-3.175484, -3.757982, 4,
-3.374189, -3.934706, 4,
-3.175484, -3.757982, 6,
-3.374189, -3.934706, 6
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
-3.771601, -4.288153, -6, 0, -0.5, 0.5, 0.5,
-3.771601, -4.288153, -6, 1, -0.5, 0.5, 0.5,
-3.771601, -4.288153, -6, 1, 1.5, 0.5, 0.5,
-3.771601, -4.288153, -6, 0, 1.5, 0.5, 0.5,
-3.771601, -4.288153, -4, 0, -0.5, 0.5, 0.5,
-3.771601, -4.288153, -4, 1, -0.5, 0.5, 0.5,
-3.771601, -4.288153, -4, 1, 1.5, 0.5, 0.5,
-3.771601, -4.288153, -4, 0, 1.5, 0.5, 0.5,
-3.771601, -4.288153, -2, 0, -0.5, 0.5, 0.5,
-3.771601, -4.288153, -2, 1, -0.5, 0.5, 0.5,
-3.771601, -4.288153, -2, 1, 1.5, 0.5, 0.5,
-3.771601, -4.288153, -2, 0, 1.5, 0.5, 0.5,
-3.771601, -4.288153, 0, 0, -0.5, 0.5, 0.5,
-3.771601, -4.288153, 0, 1, -0.5, 0.5, 0.5,
-3.771601, -4.288153, 0, 1, 1.5, 0.5, 0.5,
-3.771601, -4.288153, 0, 0, 1.5, 0.5, 0.5,
-3.771601, -4.288153, 2, 0, -0.5, 0.5, 0.5,
-3.771601, -4.288153, 2, 1, -0.5, 0.5, 0.5,
-3.771601, -4.288153, 2, 1, 1.5, 0.5, 0.5,
-3.771601, -4.288153, 2, 0, 1.5, 0.5, 0.5,
-3.771601, -4.288153, 4, 0, -0.5, 0.5, 0.5,
-3.771601, -4.288153, 4, 1, -0.5, 0.5, 0.5,
-3.771601, -4.288153, 4, 1, 1.5, 0.5, 0.5,
-3.771601, -4.288153, 4, 0, 1.5, 0.5, 0.5,
-3.771601, -4.288153, 6, 0, -0.5, 0.5, 0.5,
-3.771601, -4.288153, 6, 1, -0.5, 0.5, 0.5,
-3.771601, -4.288153, 6, 1, 1.5, 0.5, 0.5,
-3.771601, -4.288153, 6, 0, 1.5, 0.5, 0.5
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
-3.175484, -3.757982, -6.840534,
-3.175484, 3.310961, -6.840534,
-3.175484, -3.757982, 6.265328,
-3.175484, 3.310961, 6.265328,
-3.175484, -3.757982, -6.840534,
-3.175484, -3.757982, 6.265328,
-3.175484, 3.310961, -6.840534,
-3.175484, 3.310961, 6.265328,
-3.175484, -3.757982, -6.840534,
4.772749, -3.757982, -6.840534,
-3.175484, -3.757982, 6.265328,
4.772749, -3.757982, 6.265328,
-3.175484, 3.310961, -6.840534,
4.772749, 3.310961, -6.840534,
-3.175484, 3.310961, 6.265328,
4.772749, 3.310961, 6.265328,
4.772749, -3.757982, -6.840534,
4.772749, 3.310961, -6.840534,
4.772749, -3.757982, 6.265328,
4.772749, 3.310961, 6.265328,
4.772749, -3.757982, -6.840534,
4.772749, -3.757982, 6.265328,
4.772749, 3.310961, -6.840534,
4.772749, 3.310961, 6.265328
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
var radius = 9.013175;
var distance = 40.10063;
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
mvMatrix.translate( -0.7986327, 0.2235107, 0.2876029 );
mvMatrix.scale( 1.226086, 1.378597, 0.7435772 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -40.10063);
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
difenzoquat<-read.table("difenzoquat.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-difenzoquat$V2
```

```
## Error in eval(expr, envir, enclos): object 'difenzoquat' not found
```

```r
y<-difenzoquat$V3
```

```
## Error in eval(expr, envir, enclos): object 'difenzoquat' not found
```

```r
z<-difenzoquat$V4
```

```
## Error in eval(expr, envir, enclos): object 'difenzoquat' not found
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
-3.059733, 0.003075557, -3.885582, 0, 0, 1, 1, 1,
-3.032073, 0.8326284, -0.03872116, 1, 0, 0, 1, 1,
-2.992439, 0.6035035, -0.358537, 1, 0, 0, 1, 1,
-2.864906, -1.153061, -3.101537, 1, 0, 0, 1, 1,
-2.741438, -0.8268381, -3.079236, 1, 0, 0, 1, 1,
-2.729212, 0.6314583, -1.479983, 1, 0, 0, 1, 1,
-2.701163, 0.2899567, -3.31635, 0, 0, 0, 1, 1,
-2.603975, 0.5077421, -1.43276, 0, 0, 0, 1, 1,
-2.470167, 0.544624, -1.393225, 0, 0, 0, 1, 1,
-2.463845, -1.192193, -3.187246, 0, 0, 0, 1, 1,
-2.45472, -0.08245695, -0.7735079, 0, 0, 0, 1, 1,
-2.422538, -0.2728107, -2.133851, 0, 0, 0, 1, 1,
-2.349531, 0.4127039, -1.854355, 0, 0, 0, 1, 1,
-2.348847, -1.096407, -4.093401, 1, 1, 1, 1, 1,
-2.341903, -0.1294535, -3.584534, 1, 1, 1, 1, 1,
-2.337071, 0.01198981, -1.53757, 1, 1, 1, 1, 1,
-2.283963, -0.4874808, -1.544927, 1, 1, 1, 1, 1,
-2.247682, -0.6631252, -2.170585, 1, 1, 1, 1, 1,
-2.228497, -0.2347242, 0.1713662, 1, 1, 1, 1, 1,
-2.218369, 0.9179868, -1.868442, 1, 1, 1, 1, 1,
-2.204195, 0.08390209, -1.184942, 1, 1, 1, 1, 1,
-2.193032, 1.982351, -1.489967, 1, 1, 1, 1, 1,
-2.160805, -0.4338228, -3.489053, 1, 1, 1, 1, 1,
-2.149181, -0.6748426, -1.529908, 1, 1, 1, 1, 1,
-2.10643, -0.2097089, -0.1739297, 1, 1, 1, 1, 1,
-2.102166, 1.653788, -0.5224026, 1, 1, 1, 1, 1,
-2.03049, 0.7266257, -2.313302, 1, 1, 1, 1, 1,
-1.992854, 0.1412488, -0.9709734, 1, 1, 1, 1, 1,
-1.977334, -0.8557225, -2.604356, 0, 0, 1, 1, 1,
-1.964042, -0.3148435, -1.897689, 1, 0, 0, 1, 1,
-1.95137, 0.8961367, -1.346343, 1, 0, 0, 1, 1,
-1.929993, 0.7943743, -1.443039, 1, 0, 0, 1, 1,
-1.877681, -0.003974742, -1.176732, 1, 0, 0, 1, 1,
-1.867791, 1.257827, -2.194653, 1, 0, 0, 1, 1,
-1.861283, 0.9000411, 1.003441, 0, 0, 0, 1, 1,
-1.843735, 1.047454, 0.2395506, 0, 0, 0, 1, 1,
-1.841762, 1.551356, -0.9162942, 0, 0, 0, 1, 1,
-1.840039, -1.618623, -3.151109, 0, 0, 0, 1, 1,
-1.835781, 0.6925878, -1.049788, 0, 0, 0, 1, 1,
-1.833676, -1.058784, -2.776669, 0, 0, 0, 1, 1,
-1.829157, 0.9190161, 0.2549199, 0, 0, 0, 1, 1,
-1.828015, -0.3326293, -2.524479, 1, 1, 1, 1, 1,
-1.821512, -1.440423, -3.693354, 1, 1, 1, 1, 1,
-1.807955, 0.9589097, -2.481266, 1, 1, 1, 1, 1,
-1.804464, -1.098789, -0.8138978, 1, 1, 1, 1, 1,
-1.772409, 0.6924092, -2.575215, 1, 1, 1, 1, 1,
-1.768211, -0.6468535, -2.00822, 1, 1, 1, 1, 1,
-1.752591, 1.856248, -0.0634416, 1, 1, 1, 1, 1,
-1.737276, 0.3709629, 0.02185218, 1, 1, 1, 1, 1,
-1.731154, -0.2062696, -1.742319, 1, 1, 1, 1, 1,
-1.721141, 0.3731772, -2.460438, 1, 1, 1, 1, 1,
-1.71279, 0.5713568, -2.928746, 1, 1, 1, 1, 1,
-1.699401, -1.270331, -2.185657, 1, 1, 1, 1, 1,
-1.67903, 0.4339108, 0.3093077, 1, 1, 1, 1, 1,
-1.657348, -2.583641, -3.244464, 1, 1, 1, 1, 1,
-1.641123, 0.6438085, -3.808713, 1, 1, 1, 1, 1,
-1.63766, -0.07387521, -2.121136, 0, 0, 1, 1, 1,
-1.634137, 0.9826943, -1.011368, 1, 0, 0, 1, 1,
-1.62087, 0.5873984, -1.802914, 1, 0, 0, 1, 1,
-1.605257, -1.062212, -0.07706199, 1, 0, 0, 1, 1,
-1.588249, -0.02923554, -4.477313, 1, 0, 0, 1, 1,
-1.560768, -0.4779384, -0.7406043, 1, 0, 0, 1, 1,
-1.536152, -0.3042643, -1.6093, 0, 0, 0, 1, 1,
-1.53534, 0.9789379, -1.772846, 0, 0, 0, 1, 1,
-1.533876, -0.8167133, -0.1135053, 0, 0, 0, 1, 1,
-1.528282, 1.149611, -1.436933, 0, 0, 0, 1, 1,
-1.527097, 0.5039123, -1.360862, 0, 0, 0, 1, 1,
-1.526752, 0.9885739, -0.7367836, 0, 0, 0, 1, 1,
-1.520793, -1.281425, -2.347091, 0, 0, 0, 1, 1,
-1.50812, -1.149044, -1.909958, 1, 1, 1, 1, 1,
-1.504373, 1.219198, -2.648469, 1, 1, 1, 1, 1,
-1.499368, 0.5152681, -0.8682377, 1, 1, 1, 1, 1,
-1.496345, 0.8717866, -2.00379, 1, 1, 1, 1, 1,
-1.489748, -0.6047555, -0.2633247, 1, 1, 1, 1, 1,
-1.489369, 2.331488, 0.08927773, 1, 1, 1, 1, 1,
-1.4874, -0.5343101, -1.811358, 1, 1, 1, 1, 1,
-1.47558, -0.4927436, -1.81219, 1, 1, 1, 1, 1,
-1.473689, 0.3667354, -2.679346, 1, 1, 1, 1, 1,
-1.468915, 2.121465, -1.203393, 1, 1, 1, 1, 1,
-1.467864, -0.2708693, -2.231362, 1, 1, 1, 1, 1,
-1.461914, 0.603908, -0.1078419, 1, 1, 1, 1, 1,
-1.459248, -1.81447, -3.003421, 1, 1, 1, 1, 1,
-1.458399, 0.6410699, -1.423756, 1, 1, 1, 1, 1,
-1.433295, -0.4182776, -0.9039508, 1, 1, 1, 1, 1,
-1.419509, 0.04431469, -3.087358, 0, 0, 1, 1, 1,
-1.417277, -1.847027, -2.149886, 1, 0, 0, 1, 1,
-1.415271, -0.477307, -3.201242, 1, 0, 0, 1, 1,
-1.414774, 0.0988994, -2.352445, 1, 0, 0, 1, 1,
-1.406752, 0.986605, -1.093408, 1, 0, 0, 1, 1,
-1.394094, 1.730211, 0.4324185, 1, 0, 0, 1, 1,
-1.381524, 1.174389, 0.525065, 0, 0, 0, 1, 1,
-1.37205, -0.5817631, -0.780315, 0, 0, 0, 1, 1,
-1.367136, 0.1909141, 0.1445521, 0, 0, 0, 1, 1,
-1.36703, 1.532315, -1.385815, 0, 0, 0, 1, 1,
-1.363717, -0.2378988, -2.112607, 0, 0, 0, 1, 1,
-1.362711, -0.2854615, -3.205829, 0, 0, 0, 1, 1,
-1.349387, -1.058476, -2.607796, 0, 0, 0, 1, 1,
-1.347328, -0.1875845, -1.318209, 1, 1, 1, 1, 1,
-1.345087, -0.3279441, -2.546272, 1, 1, 1, 1, 1,
-1.340481, -0.93014, -3.20481, 1, 1, 1, 1, 1,
-1.334908, -2.220229, -3.682278, 1, 1, 1, 1, 1,
-1.321841, -0.4714156, -2.12384, 1, 1, 1, 1, 1,
-1.319478, -1.334748, -0.9717134, 1, 1, 1, 1, 1,
-1.309513, -0.4223806, -1.115325, 1, 1, 1, 1, 1,
-1.306003, -0.4075452, -1.772782, 1, 1, 1, 1, 1,
-1.302259, 0.8030897, -1.793315, 1, 1, 1, 1, 1,
-1.295966, -0.2029604, -1.786652, 1, 1, 1, 1, 1,
-1.293547, -0.04676693, -1.732796, 1, 1, 1, 1, 1,
-1.284615, 1.893709, -0.4541169, 1, 1, 1, 1, 1,
-1.283328, 0.04264596, -1.963102, 1, 1, 1, 1, 1,
-1.27287, 1.562316, 0.8518609, 1, 1, 1, 1, 1,
-1.267695, -0.003261424, -2.663826, 1, 1, 1, 1, 1,
-1.259009, -0.4350827, 0.5631456, 0, 0, 1, 1, 1,
-1.253399, 0.01333367, -0.8252989, 1, 0, 0, 1, 1,
-1.226016, -0.4699253, -1.418754, 1, 0, 0, 1, 1,
-1.221377, -0.08701262, -1.722276, 1, 0, 0, 1, 1,
-1.212189, -1.59373, -2.00372, 1, 0, 0, 1, 1,
-1.20679, -0.5223333, -2.224715, 1, 0, 0, 1, 1,
-1.201658, 0.4699055, -0.1406109, 0, 0, 0, 1, 1,
-1.199413, 0.03243165, 0.5738141, 0, 0, 0, 1, 1,
-1.194098, -0.7505612, -1.6752, 0, 0, 0, 1, 1,
-1.19264, -0.3513999, -0.3495735, 0, 0, 0, 1, 1,
-1.186877, -1.790035, -2.260235, 0, 0, 0, 1, 1,
-1.17089, 0.9618887, -0.6437235, 0, 0, 0, 1, 1,
-1.161237, -1.830858, -2.533496, 0, 0, 0, 1, 1,
-1.155865, -1.429758, -1.147302, 1, 1, 1, 1, 1,
-1.153157, -1.50217, -2.271511, 1, 1, 1, 1, 1,
-1.146586, 0.4980626, -1.744826, 1, 1, 1, 1, 1,
-1.141027, 0.9370405, -1.790733, 1, 1, 1, 1, 1,
-1.138219, -0.4146043, -1.883966, 1, 1, 1, 1, 1,
-1.135522, -0.4182202, -2.28508, 1, 1, 1, 1, 1,
-1.134822, -0.6084331, -3.078186, 1, 1, 1, 1, 1,
-1.134512, -1.219317, -3.231856, 1, 1, 1, 1, 1,
-1.118555, 1.370703, -0.4748273, 1, 1, 1, 1, 1,
-1.10765, -0.8501366, -1.941931, 1, 1, 1, 1, 1,
-1.10594, 1.064067, -0.7153344, 1, 1, 1, 1, 1,
-1.099828, -0.1330056, 0.07796934, 1, 1, 1, 1, 1,
-1.099263, -1.033905, -4.618302, 1, 1, 1, 1, 1,
-1.095079, 0.4806412, -0.7746975, 1, 1, 1, 1, 1,
-1.09271, 0.6622074, -1.549378, 1, 1, 1, 1, 1,
-1.080645, 0.9159502, -0.8322701, 0, 0, 1, 1, 1,
-1.075864, -0.6970357, -2.736221, 1, 0, 0, 1, 1,
-1.069928, 0.5136664, -1.862867, 1, 0, 0, 1, 1,
-1.058447, -0.3874987, -2.869026, 1, 0, 0, 1, 1,
-1.056633, 1.687857, -0.9611896, 1, 0, 0, 1, 1,
-1.046255, 1.55618, 0.7969405, 1, 0, 0, 1, 1,
-1.039001, 1.183589, -2.344977, 0, 0, 0, 1, 1,
-1.037802, 0.1477576, -0.1506315, 0, 0, 0, 1, 1,
-1.036027, -1.219483, -4.151263, 0, 0, 0, 1, 1,
-1.033006, 0.3230309, 0.5631356, 0, 0, 0, 1, 1,
-1.032088, 1.726327, -0.1838064, 0, 0, 0, 1, 1,
-1.030672, -0.1743692, -0.9262953, 0, 0, 0, 1, 1,
-1.022918, -0.7198261, -2.546088, 0, 0, 0, 1, 1,
-1.015681, 0.03232908, -1.253022, 1, 1, 1, 1, 1,
-1.007875, -1.657612, -2.125363, 1, 1, 1, 1, 1,
-1.000608, -0.2280919, -2.312365, 1, 1, 1, 1, 1,
-0.9974304, -0.9113411, -1.716063, 1, 1, 1, 1, 1,
-0.9971251, -0.9867463, -1.422906, 1, 1, 1, 1, 1,
-0.9916394, 0.9551554, -1.320606, 1, 1, 1, 1, 1,
-0.9904836, 1.330178, -1.442395, 1, 1, 1, 1, 1,
-0.9851862, -0.2318492, -0.6649657, 1, 1, 1, 1, 1,
-0.9827165, 0.5093459, -0.6794268, 1, 1, 1, 1, 1,
-0.9811297, 0.06738681, -0.7784349, 1, 1, 1, 1, 1,
-0.972766, -0.3738684, -0.8939957, 1, 1, 1, 1, 1,
-0.9702871, 0.217253, -0.3937734, 1, 1, 1, 1, 1,
-0.9673274, 0.545236, -1.306327, 1, 1, 1, 1, 1,
-0.9642757, -0.6147354, -4.096014, 1, 1, 1, 1, 1,
-0.9520402, 0.4078241, -3.132466, 1, 1, 1, 1, 1,
-0.9420287, 0.2992062, -1.058308, 0, 0, 1, 1, 1,
-0.9403774, 3.208015, -2.072607, 1, 0, 0, 1, 1,
-0.934048, 0.1212793, -1.935166, 1, 0, 0, 1, 1,
-0.932898, -0.5478103, -1.880518, 1, 0, 0, 1, 1,
-0.9311578, -0.8236936, -2.574208, 1, 0, 0, 1, 1,
-0.9266508, 0.2473344, -1.684808, 1, 0, 0, 1, 1,
-0.9185136, 0.8831987, -1.376869, 0, 0, 0, 1, 1,
-0.9116668, 0.8458718, -2.483665, 0, 0, 0, 1, 1,
-0.9079288, -1.810602, -2.472466, 0, 0, 0, 1, 1,
-0.9027961, 1.041363, -0.06158969, 0, 0, 0, 1, 1,
-0.8979492, 0.4467907, -0.6683553, 0, 0, 0, 1, 1,
-0.8973459, -0.102509, -1.548295, 0, 0, 0, 1, 1,
-0.8860763, 1.267892, -1.084036, 0, 0, 0, 1, 1,
-0.8845108, 1.418127, -1.250894, 1, 1, 1, 1, 1,
-0.8779659, -0.9423552, -4.523209, 1, 1, 1, 1, 1,
-0.8744882, -0.007276868, -1.654307, 1, 1, 1, 1, 1,
-0.8724327, 1.384209, -0.2048018, 1, 1, 1, 1, 1,
-0.8704029, -0.5062048, -0.5227888, 1, 1, 1, 1, 1,
-0.854864, -0.4909378, -3.312828, 1, 1, 1, 1, 1,
-0.849929, 0.4473463, -1.463556, 1, 1, 1, 1, 1,
-0.8432155, 1.919131, -1.431923, 1, 1, 1, 1, 1,
-0.8406966, -2.001774, -2.64669, 1, 1, 1, 1, 1,
-0.8348247, -0.02149644, -1.215494, 1, 1, 1, 1, 1,
-0.8343611, -0.2780487, -0.7738252, 1, 1, 1, 1, 1,
-0.8323735, -0.2187215, -1.605644, 1, 1, 1, 1, 1,
-0.8231788, 0.06693564, -1.358248, 1, 1, 1, 1, 1,
-0.8165644, -0.3395807, -0.1023713, 1, 1, 1, 1, 1,
-0.8021576, -0.1558084, -2.049577, 1, 1, 1, 1, 1,
-0.8015576, -1.290835, -1.380104, 0, 0, 1, 1, 1,
-0.7948427, 0.5454322, -1.790889, 1, 0, 0, 1, 1,
-0.7932464, -1.302905, -1.694516, 1, 0, 0, 1, 1,
-0.78447, -1.489619, -1.733447, 1, 0, 0, 1, 1,
-0.7842529, 0.05273468, -2.39162, 1, 0, 0, 1, 1,
-0.7803678, 0.06090885, 0.7444426, 1, 0, 0, 1, 1,
-0.7793874, -0.0568319, -1.292362, 0, 0, 0, 1, 1,
-0.7789848, -1.110418, -3.826707, 0, 0, 0, 1, 1,
-0.7748718, -1.886875, -1.123164, 0, 0, 0, 1, 1,
-0.7624766, 0.8868006, -0.6722267, 0, 0, 0, 1, 1,
-0.7613274, -0.4587223, -1.374745, 0, 0, 0, 1, 1,
-0.7592616, -0.7249511, -1.567597, 0, 0, 0, 1, 1,
-0.7565143, 0.9731372, 0.88211, 0, 0, 0, 1, 1,
-0.7504297, -0.1023562, -2.086718, 1, 1, 1, 1, 1,
-0.7488108, 0.2393912, -1.463104, 1, 1, 1, 1, 1,
-0.7486774, -0.176875, -1.271304, 1, 1, 1, 1, 1,
-0.7483851, -1.181274, -2.578999, 1, 1, 1, 1, 1,
-0.7427587, 0.6788655, 0.9757291, 1, 1, 1, 1, 1,
-0.7330416, 0.7091884, 0.5093424, 1, 1, 1, 1, 1,
-0.732567, 0.3272853, -1.968512, 1, 1, 1, 1, 1,
-0.7296015, -0.1964283, -2.495458, 1, 1, 1, 1, 1,
-0.7261481, -0.217858, -0.3773114, 1, 1, 1, 1, 1,
-0.7178403, 0.4894613, -1.037259, 1, 1, 1, 1, 1,
-0.7166879, -0.6488465, -2.039478, 1, 1, 1, 1, 1,
-0.7128886, -1.18269, -2.126342, 1, 1, 1, 1, 1,
-0.7084247, -0.4350059, -3.530834, 1, 1, 1, 1, 1,
-0.7074706, 1.05738, -2.244071, 1, 1, 1, 1, 1,
-0.7046193, -0.5785502, -2.851528, 1, 1, 1, 1, 1,
-0.7031936, 0.2382463, -3.536094, 0, 0, 1, 1, 1,
-0.7009585, 1.220382, 0.2531953, 1, 0, 0, 1, 1,
-0.6994771, -0.2467163, -0.4799822, 1, 0, 0, 1, 1,
-0.6983545, 1.044702, 0.5955018, 1, 0, 0, 1, 1,
-0.6930014, -1.043994, -1.721467, 1, 0, 0, 1, 1,
-0.6919666, 0.7129171, -0.1336222, 1, 0, 0, 1, 1,
-0.6918492, 0.1712013, -1.835268, 0, 0, 0, 1, 1,
-0.6917679, 0.2030179, -1.717896, 0, 0, 0, 1, 1,
-0.6896652, 0.3558634, 0.3804526, 0, 0, 0, 1, 1,
-0.681619, -0.1830627, -1.751765, 0, 0, 0, 1, 1,
-0.6778862, 0.01402757, -2.509697, 0, 0, 0, 1, 1,
-0.6776168, 1.225392, -1.159389, 0, 0, 0, 1, 1,
-0.6745559, 0.01494652, -0.7934147, 0, 0, 0, 1, 1,
-0.6742749, 0.3142962, -1.527205, 1, 1, 1, 1, 1,
-0.6715771, -1.179295, -3.411657, 1, 1, 1, 1, 1,
-0.6663517, 0.6876003, -0.08130674, 1, 1, 1, 1, 1,
-0.6658806, -0.7922095, -1.264775, 1, 1, 1, 1, 1,
-0.6640464, -0.9434833, -3.872837, 1, 1, 1, 1, 1,
-0.663581, -0.9122452, -2.899505, 1, 1, 1, 1, 1,
-0.6628169, -1.29559, -1.599661, 1, 1, 1, 1, 1,
-0.6594859, 1.114934, -1.646154, 1, 1, 1, 1, 1,
-0.6591641, -0.7959066, -3.707928, 1, 1, 1, 1, 1,
-0.656486, 0.08267469, -2.674182, 1, 1, 1, 1, 1,
-0.6496828, -0.3413268, -2.863944, 1, 1, 1, 1, 1,
-0.6487342, -0.08434959, -1.476693, 1, 1, 1, 1, 1,
-0.6452382, -0.3593421, -1.655051, 1, 1, 1, 1, 1,
-0.6440309, -0.108571, -1.77506, 1, 1, 1, 1, 1,
-0.6424546, -0.7361762, -1.01315, 1, 1, 1, 1, 1,
-0.6358692, 1.155359, -0.003747491, 0, 0, 1, 1, 1,
-0.631087, -0.8002926, -3.653828, 1, 0, 0, 1, 1,
-0.6294253, 1.512097, 0.1596337, 1, 0, 0, 1, 1,
-0.6266374, 1.307314, -0.2561232, 1, 0, 0, 1, 1,
-0.622807, -0.987958, -3.442283, 1, 0, 0, 1, 1,
-0.6111109, 0.8496448, -1.777916, 1, 0, 0, 1, 1,
-0.6096688, -1.316473, -2.988149, 0, 0, 0, 1, 1,
-0.6051868, 1.137937, -0.08047354, 0, 0, 0, 1, 1,
-0.6051648, -0.6768155, -3.314554, 0, 0, 0, 1, 1,
-0.6043058, -0.2873026, -2.198496, 0, 0, 0, 1, 1,
-0.6026904, -0.03789774, -2.043539, 0, 0, 0, 1, 1,
-0.5964552, 0.148797, 0.2575969, 0, 0, 0, 1, 1,
-0.5949918, -0.6922643, -2.414204, 0, 0, 0, 1, 1,
-0.5929368, 0.569832, -0.5976202, 1, 1, 1, 1, 1,
-0.586239, -0.06347417, -1.225347, 1, 1, 1, 1, 1,
-0.5856935, -0.652734, -1.276813, 1, 1, 1, 1, 1,
-0.5856689, -0.08357575, -3.737682, 1, 1, 1, 1, 1,
-0.5856585, -1.284104, -4.227519, 1, 1, 1, 1, 1,
-0.5850016, 0.6083198, -0.3764618, 1, 1, 1, 1, 1,
-0.5803834, -0.2273097, -1.853569, 1, 1, 1, 1, 1,
-0.5754418, -0.3830816, -2.610235, 1, 1, 1, 1, 1,
-0.5715392, -0.616221, -2.424975, 1, 1, 1, 1, 1,
-0.5704275, 0.157859, -1.873918, 1, 1, 1, 1, 1,
-0.5681742, -2.397135, -4.050517, 1, 1, 1, 1, 1,
-0.5679464, -0.4039163, -3.551829, 1, 1, 1, 1, 1,
-0.5664794, 1.064118, -0.5380001, 1, 1, 1, 1, 1,
-0.5556599, -1.092148, -2.127963, 1, 1, 1, 1, 1,
-0.5537735, 1.615626, -3.595803, 1, 1, 1, 1, 1,
-0.5517249, 1.10535, -1.774733, 0, 0, 1, 1, 1,
-0.5512667, -0.8184902, -2.55794, 1, 0, 0, 1, 1,
-0.5495338, -0.9838744, -2.997476, 1, 0, 0, 1, 1,
-0.5465868, -0.1449072, -3.326501, 1, 0, 0, 1, 1,
-0.5446419, -0.04221981, -0.266556, 1, 0, 0, 1, 1,
-0.5431957, 1.365286, -1.317662, 1, 0, 0, 1, 1,
-0.5423652, 2.233617, -0.2204267, 0, 0, 0, 1, 1,
-0.5335793, -1.130738, -1.424576, 0, 0, 0, 1, 1,
-0.5320607, 0.2191678, -2.231045, 0, 0, 0, 1, 1,
-0.5304312, -1.236767, -3.649231, 0, 0, 0, 1, 1,
-0.5303411, -0.2974055, -1.092756, 0, 0, 0, 1, 1,
-0.5291941, -0.2920834, -1.667523, 0, 0, 0, 1, 1,
-0.5287432, -0.8336176, -4.161785, 0, 0, 0, 1, 1,
-0.5266844, -0.6876888, -3.122439, 1, 1, 1, 1, 1,
-0.5220356, -1.337062, -1.495891, 1, 1, 1, 1, 1,
-0.5205916, 0.3770018, -0.6694713, 1, 1, 1, 1, 1,
-0.5181935, -0.09827232, -2.323742, 1, 1, 1, 1, 1,
-0.5168754, -1.496702, -2.028829, 1, 1, 1, 1, 1,
-0.5118763, 0.3551816, -1.04271, 1, 1, 1, 1, 1,
-0.5076924, -1.242439, -3.283865, 1, 1, 1, 1, 1,
-0.5061423, 0.4518928, 0.4249428, 1, 1, 1, 1, 1,
-0.5012254, 0.3653113, -0.8081949, 1, 1, 1, 1, 1,
-0.5002474, 0.7450646, -1.048408, 1, 1, 1, 1, 1,
-0.4969294, 0.3819484, -0.9867418, 1, 1, 1, 1, 1,
-0.4938977, -1.398962, -2.119614, 1, 1, 1, 1, 1,
-0.4922951, 2.438129, 0.3097881, 1, 1, 1, 1, 1,
-0.489188, 0.4051291, -1.694837, 1, 1, 1, 1, 1,
-0.4888946, -0.1175957, -0.5362591, 1, 1, 1, 1, 1,
-0.4887843, 0.3359676, -0.767574, 0, 0, 1, 1, 1,
-0.4886235, -0.7969978, -3.021644, 1, 0, 0, 1, 1,
-0.4875411, 2.009246, -1.73875, 1, 0, 0, 1, 1,
-0.4865823, 0.001528813, -2.293848, 1, 0, 0, 1, 1,
-0.4854162, -0.714543, -2.250654, 1, 0, 0, 1, 1,
-0.4841639, 0.7079735, -1.813622, 1, 0, 0, 1, 1,
-0.483738, -0.8043004, -1.280746, 0, 0, 0, 1, 1,
-0.4789986, -0.1574583, -0.8087046, 0, 0, 0, 1, 1,
-0.4716661, -0.3285851, -2.855689, 0, 0, 0, 1, 1,
-0.4697571, 0.9198802, -1.0825, 0, 0, 0, 1, 1,
-0.4650068, -1.31956, -2.337684, 0, 0, 0, 1, 1,
-0.4639589, 0.264109, -0.4813772, 0, 0, 0, 1, 1,
-0.463788, -1.038443, -2.989968, 0, 0, 0, 1, 1,
-0.4610296, 1.480969, -0.2191221, 1, 1, 1, 1, 1,
-0.4589834, 0.8629335, 2.388807, 1, 1, 1, 1, 1,
-0.4564056, -1.655518, -3.301017, 1, 1, 1, 1, 1,
-0.4519712, -1.000884, -1.589406, 1, 1, 1, 1, 1,
-0.449797, 0.6541508, -0.1386441, 1, 1, 1, 1, 1,
-0.4491603, 2.281383, -1.491097, 1, 1, 1, 1, 1,
-0.4488861, -0.1515041, -1.436888, 1, 1, 1, 1, 1,
-0.4392093, -1.160843, -4.60171, 1, 1, 1, 1, 1,
-0.4378225, 0.1105454, -1.869515, 1, 1, 1, 1, 1,
-0.4344404, 0.05965086, -1.738204, 1, 1, 1, 1, 1,
-0.4334671, 0.4069861, -1.856629, 1, 1, 1, 1, 1,
-0.4325358, 1.919668, -0.9796078, 1, 1, 1, 1, 1,
-0.4309276, 1.576272, 0.9392143, 1, 1, 1, 1, 1,
-0.4277187, -1.372734, -2.625475, 1, 1, 1, 1, 1,
-0.4259892, 1.061084, 0.2252236, 1, 1, 1, 1, 1,
-0.4214585, -1.154059, -3.032668, 0, 0, 1, 1, 1,
-0.421009, -0.3737146, -1.824364, 1, 0, 0, 1, 1,
-0.4164833, 0.9347496, 0.1134467, 1, 0, 0, 1, 1,
-0.4154918, 0.4224693, -0.5484259, 1, 0, 0, 1, 1,
-0.4114238, 0.2063081, -2.328619, 1, 0, 0, 1, 1,
-0.4113855, -0.8903439, -1.196104, 1, 0, 0, 1, 1,
-0.4038204, 0.5549263, -1.379117, 0, 0, 0, 1, 1,
-0.40163, -1.516668, -1.765556, 0, 0, 0, 1, 1,
-0.4009856, -1.108358, -3.575697, 0, 0, 0, 1, 1,
-0.399269, 0.9039285, -1.615046, 0, 0, 0, 1, 1,
-0.3966216, 1.846949, -1.557817, 0, 0, 0, 1, 1,
-0.3956875, 0.4606099, 0.2706473, 0, 0, 0, 1, 1,
-0.392524, 0.5788623, 0.0781771, 0, 0, 0, 1, 1,
-0.390842, -1.025193, -2.371488, 1, 1, 1, 1, 1,
-0.3903143, -0.09116794, -0.4180394, 1, 1, 1, 1, 1,
-0.3860134, 1.255289, -0.3944524, 1, 1, 1, 1, 1,
-0.3838248, 1.691124, -0.3291182, 1, 1, 1, 1, 1,
-0.381879, 0.3567244, -1.961471, 1, 1, 1, 1, 1,
-0.3728197, 0.3786767, -2.223723, 1, 1, 1, 1, 1,
-0.3725173, -1.706951, -2.244869, 1, 1, 1, 1, 1,
-0.3714721, 0.7442732, -0.2211839, 1, 1, 1, 1, 1,
-0.3697504, -1.855012, -1.461412, 1, 1, 1, 1, 1,
-0.3586556, -0.03368711, -2.592319, 1, 1, 1, 1, 1,
-0.3576294, 0.2209131, -0.2531137, 1, 1, 1, 1, 1,
-0.3574418, -1.079844, -2.569509, 1, 1, 1, 1, 1,
-0.3573961, -0.3304717, -2.052987, 1, 1, 1, 1, 1,
-0.3553202, 0.6187792, -0.352724, 1, 1, 1, 1, 1,
-0.3545461, -0.4557954, -3.022462, 1, 1, 1, 1, 1,
-0.3506665, -1.265225, -3.02829, 0, 0, 1, 1, 1,
-0.3483583, 0.2303228, -0.835875, 1, 0, 0, 1, 1,
-0.3483041, 0.02520837, 0.7714436, 1, 0, 0, 1, 1,
-0.3465543, 1.154258, 0.5190525, 1, 0, 0, 1, 1,
-0.345066, 2.528934, -0.008966656, 1, 0, 0, 1, 1,
-0.3362109, -0.5675819, -1.21601, 1, 0, 0, 1, 1,
-0.3339201, 1.803117, -0.1526574, 0, 0, 0, 1, 1,
-0.3332558, -0.8801214, -3.014842, 0, 0, 0, 1, 1,
-0.3331087, 0.154117, -0.1259769, 0, 0, 0, 1, 1,
-0.3298054, -0.9614573, -3.266085, 0, 0, 0, 1, 1,
-0.3254542, -1.279131, -2.623062, 0, 0, 0, 1, 1,
-0.3249522, 0.6521782, 0.2935727, 0, 0, 0, 1, 1,
-0.3234246, -0.395645, -3.838641, 0, 0, 0, 1, 1,
-0.322049, -0.7375688, -2.49575, 1, 1, 1, 1, 1,
-0.3197534, -0.5514686, -2.602688, 1, 1, 1, 1, 1,
-0.3193108, -1.50695, -2.191803, 1, 1, 1, 1, 1,
-0.3171599, -0.9712698, -1.157194, 1, 1, 1, 1, 1,
-0.31645, 1.117305, -0.01277246, 1, 1, 1, 1, 1,
-0.3134135, 0.621905, 0.2311122, 1, 1, 1, 1, 1,
-0.3124447, -1.105336, -1.815653, 1, 1, 1, 1, 1,
-0.3108714, -1.400887, -1.252227, 1, 1, 1, 1, 1,
-0.3035813, -0.08580543, -2.712977, 1, 1, 1, 1, 1,
-0.3014417, -0.7570734, -2.974625, 1, 1, 1, 1, 1,
-0.2979518, 0.02480805, -0.2309416, 1, 1, 1, 1, 1,
-0.2911634, 0.8129963, -1.582249, 1, 1, 1, 1, 1,
-0.2859544, 0.1790617, -0.1133871, 1, 1, 1, 1, 1,
-0.2841836, 1.594437, -1.532043, 1, 1, 1, 1, 1,
-0.2824682, 0.1039275, -1.88846, 1, 1, 1, 1, 1,
-0.2762671, -0.4120231, -1.193491, 0, 0, 1, 1, 1,
-0.2746336, 0.545932, -0.5695872, 1, 0, 0, 1, 1,
-0.2739392, 0.9881615, -0.3847156, 1, 0, 0, 1, 1,
-0.2734347, -1.288622, -3.187343, 1, 0, 0, 1, 1,
-0.2688984, -0.4348144, -1.498567, 1, 0, 0, 1, 1,
-0.2685031, -0.1689005, -2.017658, 1, 0, 0, 1, 1,
-0.267669, -1.464905, -3.884763, 0, 0, 0, 1, 1,
-0.2644129, 1.226375, -0.3689788, 0, 0, 0, 1, 1,
-0.2596787, -1.136303, -3.313352, 0, 0, 0, 1, 1,
-0.2586999, 0.1260095, -2.161265, 0, 0, 0, 1, 1,
-0.2501333, 0.3250188, 1.452611, 0, 0, 0, 1, 1,
-0.2483568, -1.306098, -2.883417, 0, 0, 0, 1, 1,
-0.245118, -0.1007195, -2.240602, 0, 0, 0, 1, 1,
-0.2448416, -2.071589, -4.101028, 1, 1, 1, 1, 1,
-0.2438349, -0.955259, -1.956437, 1, 1, 1, 1, 1,
-0.2437068, 2.143046, 0.4165879, 1, 1, 1, 1, 1,
-0.2428974, -0.1395352, -0.5716299, 1, 1, 1, 1, 1,
-0.2401072, -0.2241078, -4.063667, 1, 1, 1, 1, 1,
-0.2388869, 0.7072395, 1.041089, 1, 1, 1, 1, 1,
-0.2373592, 0.7600341, -1.180522, 1, 1, 1, 1, 1,
-0.2351839, 0.8208668, -0.250516, 1, 1, 1, 1, 1,
-0.231873, -1.713256, -2.973391, 1, 1, 1, 1, 1,
-0.2270524, -0.3954572, -1.9228, 1, 1, 1, 1, 1,
-0.226978, -1.404052, -2.975121, 1, 1, 1, 1, 1,
-0.2263093, -1.134266, -2.917487, 1, 1, 1, 1, 1,
-0.2257391, -0.693309, -1.841555, 1, 1, 1, 1, 1,
-0.2238327, 0.3843109, -1.00301, 1, 1, 1, 1, 1,
-0.2228778, -1.294149, -3.132403, 1, 1, 1, 1, 1,
-0.2214511, 1.338714, 0.5748116, 0, 0, 1, 1, 1,
-0.2198898, -1.440594, -3.847285, 1, 0, 0, 1, 1,
-0.2187748, 0.1029032, -0.8389828, 1, 0, 0, 1, 1,
-0.2111502, -0.7270746, -2.726393, 1, 0, 0, 1, 1,
-0.2089424, 0.6632892, -1.835423, 1, 0, 0, 1, 1,
-0.2041663, -2.490135, -3.948428, 1, 0, 0, 1, 1,
-0.202892, -1.853263, -2.920531, 0, 0, 0, 1, 1,
-0.2000028, 0.291164, 0.5063019, 0, 0, 0, 1, 1,
-0.1978453, 1.042671, -0.3194787, 0, 0, 0, 1, 1,
-0.1970717, -0.9567717, -4.278015, 0, 0, 0, 1, 1,
-0.195436, -0.6925214, -3.759089, 0, 0, 0, 1, 1,
-0.1890751, -0.8749503, -3.48439, 0, 0, 0, 1, 1,
-0.1835617, 1.364507, 0.1367627, 0, 0, 0, 1, 1,
-0.1828412, 0.3162979, -2.014236, 1, 1, 1, 1, 1,
-0.1784644, 0.7984667, -0.05215918, 1, 1, 1, 1, 1,
-0.1733629, -0.9708869, -2.594011, 1, 1, 1, 1, 1,
-0.1724689, 1.235063, -0.20099, 1, 1, 1, 1, 1,
-0.1705677, 0.2022222, -1.606655, 1, 1, 1, 1, 1,
-0.1704194, -1.986513, -0.7177374, 1, 1, 1, 1, 1,
-0.170081, 1.243133, -1.163814, 1, 1, 1, 1, 1,
-0.1669568, -2.168589, -2.444921, 1, 1, 1, 1, 1,
-0.1669257, 0.07887694, -0.507683, 1, 1, 1, 1, 1,
-0.1588927, -2.851691, -4.018817, 1, 1, 1, 1, 1,
-0.1454169, -1.144158, -2.201755, 1, 1, 1, 1, 1,
-0.1419297, -0.495666, -2.91734, 1, 1, 1, 1, 1,
-0.1384034, -2.840924, -4.8038, 1, 1, 1, 1, 1,
-0.1368997, -1.535501, -2.100547, 1, 1, 1, 1, 1,
-0.1334969, 0.3729241, 0.7354808, 1, 1, 1, 1, 1,
-0.1333717, 0.9838607, -0.3929445, 0, 0, 1, 1, 1,
-0.1325949, -0.4656316, -2.776557, 1, 0, 0, 1, 1,
-0.1303622, 1.463789, -0.5238836, 1, 0, 0, 1, 1,
-0.1297317, 0.6913086, 0.3116685, 1, 0, 0, 1, 1,
-0.1275791, -0.737635, -3.131773, 1, 0, 0, 1, 1,
-0.1271121, -0.6165895, -2.608231, 1, 0, 0, 1, 1,
-0.1264676, 1.463098, 0.29335, 0, 0, 0, 1, 1,
-0.1231072, -0.2848403, -2.800253, 0, 0, 0, 1, 1,
-0.1224321, 0.9956953, 1.611017, 0, 0, 0, 1, 1,
-0.1222306, 0.2287666, 1.227633, 0, 0, 0, 1, 1,
-0.1217007, 0.9759983, 0.9622037, 0, 0, 0, 1, 1,
-0.119839, -0.4084752, -4.202135, 0, 0, 0, 1, 1,
-0.1195213, 0.06986242, -2.503453, 0, 0, 0, 1, 1,
-0.1184288, 1.084866, -0.1360674, 1, 1, 1, 1, 1,
-0.1181963, -0.2539768, -3.678229, 1, 1, 1, 1, 1,
-0.1163968, -0.2865984, -5.275128, 1, 1, 1, 1, 1,
-0.1159694, -0.5392519, -3.8074, 1, 1, 1, 1, 1,
-0.1098076, -0.1289394, -0.4645271, 1, 1, 1, 1, 1,
-0.1095665, 1.284495, -1.895222, 1, 1, 1, 1, 1,
-0.104546, -1.005444, -3.307213, 1, 1, 1, 1, 1,
-0.09844257, 0.4507094, 2.284683, 1, 1, 1, 1, 1,
-0.09678545, 3.17571, -0.6479581, 1, 1, 1, 1, 1,
-0.08956298, -0.9372818, -1.486148, 1, 1, 1, 1, 1,
-0.08862508, -0.8029749, -1.568464, 1, 1, 1, 1, 1,
-0.08552376, 0.6882143, 0.5599704, 1, 1, 1, 1, 1,
-0.08479557, 0.6656686, 0.9408184, 1, 1, 1, 1, 1,
-0.08277248, -0.2810125, -2.932934, 1, 1, 1, 1, 1,
-0.08098637, 0.7444153, -0.3623265, 1, 1, 1, 1, 1,
-0.07628848, -0.152014, -3.186057, 0, 0, 1, 1, 1,
-0.07489585, 0.1214823, -0.2963821, 1, 0, 0, 1, 1,
-0.07221036, -0.4316814, -1.158286, 1, 0, 0, 1, 1,
-0.07217523, -0.4406254, -3.362498, 1, 0, 0, 1, 1,
-0.06117033, -0.598595, -3.602707, 1, 0, 0, 1, 1,
-0.0555754, 0.9557037, -0.3834425, 1, 0, 0, 1, 1,
-0.05343848, 0.1050286, -0.8304982, 0, 0, 0, 1, 1,
-0.05195501, -0.5932731, -1.877011, 0, 0, 0, 1, 1,
-0.05071485, -0.1460761, -2.030252, 0, 0, 0, 1, 1,
-0.04812375, -1.419565, -2.706818, 0, 0, 0, 1, 1,
-0.04499916, 0.7511364, 2.645682, 0, 0, 0, 1, 1,
-0.0389222, 0.9482074, -0.3749353, 0, 0, 0, 1, 1,
-0.03488721, 0.05936438, -1.793977, 0, 0, 0, 1, 1,
-0.03445433, 0.5959823, 0.07459871, 1, 1, 1, 1, 1,
-0.02998847, -0.5185964, -2.24252, 1, 1, 1, 1, 1,
-0.02869253, 0.06186975, -0.3494297, 1, 1, 1, 1, 1,
-0.02836019, -0.5379557, -4.734171, 1, 1, 1, 1, 1,
-0.0263348, -0.1738929, -6.649672, 1, 1, 1, 1, 1,
-0.02180915, -0.09378351, -3.067223, 1, 1, 1, 1, 1,
-0.02135446, 2.540391, -0.6992515, 1, 1, 1, 1, 1,
-0.01611228, 0.6835242, 0.412943, 1, 1, 1, 1, 1,
-0.01338635, 1.643341, -0.8950371, 1, 1, 1, 1, 1,
-0.003035501, 0.1573858, -2.455774, 1, 1, 1, 1, 1,
-0.002536745, -2.166003, -3.074347, 1, 1, 1, 1, 1,
2.149362e-05, -3.655037, 3.652583, 1, 1, 1, 1, 1,
0.005138896, -2.371454, 2.748677, 1, 1, 1, 1, 1,
0.008518251, -0.8788076, 4.89588, 1, 1, 1, 1, 1,
0.01747497, 0.5239116, 0.7497675, 1, 1, 1, 1, 1,
0.01810478, -1.160332, 2.715022, 0, 0, 1, 1, 1,
0.02266348, 0.4978552, 0.6409818, 1, 0, 0, 1, 1,
0.03163308, 0.7104954, 1.301684, 1, 0, 0, 1, 1,
0.03443156, 1.90068, 0.5368117, 1, 0, 0, 1, 1,
0.04995533, -2.2434, 2.159215, 1, 0, 0, 1, 1,
0.05628928, -0.3533585, 1.191969, 1, 0, 0, 1, 1,
0.05780336, -0.4487617, 5.113487, 0, 0, 0, 1, 1,
0.05783112, -1.113225, 0.01032952, 0, 0, 0, 1, 1,
0.0582288, 0.4043967, -0.5880173, 0, 0, 0, 1, 1,
0.05864894, 0.3152928, 0.3863096, 0, 0, 0, 1, 1,
0.05911467, -1.094291, 4.526921, 0, 0, 0, 1, 1,
0.06073396, 0.2849225, 0.3799862, 0, 0, 0, 1, 1,
0.06312463, 0.07612864, 0.8948387, 0, 0, 0, 1, 1,
0.06487673, -0.4543189, 1.765447, 1, 1, 1, 1, 1,
0.0676606, -0.6642778, 1.697649, 1, 1, 1, 1, 1,
0.07135747, -1.177701, 3.345393, 1, 1, 1, 1, 1,
0.0713975, -0.2073127, 2.217872, 1, 1, 1, 1, 1,
0.0748456, -0.02475416, 2.703549, 1, 1, 1, 1, 1,
0.07624726, 0.9071831, 0.8837482, 1, 1, 1, 1, 1,
0.07719826, 1.620614, 0.3494609, 1, 1, 1, 1, 1,
0.08124827, -0.2080826, 4.961556, 1, 1, 1, 1, 1,
0.08164237, 2.000214, 1.612435, 1, 1, 1, 1, 1,
0.08302529, 1.537244, -0.5970623, 1, 1, 1, 1, 1,
0.0865737, 0.2993822, 0.1158222, 1, 1, 1, 1, 1,
0.08902523, 0.593573, 0.5063945, 1, 1, 1, 1, 1,
0.09013806, -1.41827, 3.682248, 1, 1, 1, 1, 1,
0.09062106, 2.333762, 1.177472, 1, 1, 1, 1, 1,
0.09319966, -0.01558681, 0.8619233, 1, 1, 1, 1, 1,
0.09326421, 0.6393713, 0.6196642, 0, 0, 1, 1, 1,
0.1018899, -0.6417801, 2.246738, 1, 0, 0, 1, 1,
0.1028823, -0.3317582, 1.487192, 1, 0, 0, 1, 1,
0.108853, 0.5114313, -0.6091894, 1, 0, 0, 1, 1,
0.1116988, 1.185989, 1.273376, 1, 0, 0, 1, 1,
0.1121846, -2.108994, 4.418458, 1, 0, 0, 1, 1,
0.1136894, -2.080547, 2.81795, 0, 0, 0, 1, 1,
0.1218084, 0.562197, -0.3232288, 0, 0, 0, 1, 1,
0.122221, -0.6815317, 3.129171, 0, 0, 0, 1, 1,
0.1263257, 1.152619, -1.233643, 0, 0, 0, 1, 1,
0.1305289, -2.156027, 2.90197, 0, 0, 0, 1, 1,
0.1321154, -0.7499073, 3.190955, 0, 0, 0, 1, 1,
0.1325978, 0.1124303, -0.2431405, 0, 0, 0, 1, 1,
0.133661, -0.9231011, 2.270002, 1, 1, 1, 1, 1,
0.1348668, 0.2852057, -1.284411, 1, 1, 1, 1, 1,
0.1359411, -0.6049471, 3.150933, 1, 1, 1, 1, 1,
0.1414248, -1.193247, 3.261412, 1, 1, 1, 1, 1,
0.1415845, -0.8559569, 3.997861, 1, 1, 1, 1, 1,
0.1435265, 0.5448492, -0.764046, 1, 1, 1, 1, 1,
0.1457836, -0.1642618, 2.061807, 1, 1, 1, 1, 1,
0.1488702, -1.314666, 3.278229, 1, 1, 1, 1, 1,
0.1544259, 2.204692, 0.9017487, 1, 1, 1, 1, 1,
0.1552265, -0.6684533, 3.83872, 1, 1, 1, 1, 1,
0.1554256, -1.157524, 4.163184, 1, 1, 1, 1, 1,
0.1577743, -0.5847697, 1.384434, 1, 1, 1, 1, 1,
0.1654608, -0.143481, 2.988952, 1, 1, 1, 1, 1,
0.1662922, -1.13645, 3.671825, 1, 1, 1, 1, 1,
0.168253, -0.3934096, 1.863244, 1, 1, 1, 1, 1,
0.1694335, 1.559969, 0.49428, 0, 0, 1, 1, 1,
0.1712704, -0.04535185, 3.151577, 1, 0, 0, 1, 1,
0.1717893, -1.277233, 1.492293, 1, 0, 0, 1, 1,
0.1726699, 0.396595, 0.4161526, 1, 0, 0, 1, 1,
0.1752313, -0.194452, 1.321259, 1, 0, 0, 1, 1,
0.1756718, 0.120295, 0.5753632, 1, 0, 0, 1, 1,
0.1759289, 0.7606104, 0.6300085, 0, 0, 0, 1, 1,
0.1764755, -0.4661627, 6.074466, 0, 0, 0, 1, 1,
0.1785262, 0.8365597, 0.1403056, 0, 0, 0, 1, 1,
0.1801247, 0.3122435, -0.2439213, 0, 0, 0, 1, 1,
0.1817242, 0.5165, 0.4348262, 0, 0, 0, 1, 1,
0.1833446, 0.6349449, 0.3632776, 0, 0, 0, 1, 1,
0.1857516, 0.2417104, 0.09416724, 0, 0, 0, 1, 1,
0.186419, 0.7521515, 1.648792, 1, 1, 1, 1, 1,
0.1886244, -0.3615137, 3.03459, 1, 1, 1, 1, 1,
0.191003, 1.690981, 0.7947637, 1, 1, 1, 1, 1,
0.1950133, -0.7964131, 3.094265, 1, 1, 1, 1, 1,
0.1951624, 0.5116964, 1.113851, 1, 1, 1, 1, 1,
0.2006398, -2.456029, 4.662353, 1, 1, 1, 1, 1,
0.2008105, -0.2087802, 1.595566, 1, 1, 1, 1, 1,
0.2074194, 1.467747, -0.03599589, 1, 1, 1, 1, 1,
0.2094974, 0.1108762, 0.866841, 1, 1, 1, 1, 1,
0.2147078, -1.610332, 2.278916, 1, 1, 1, 1, 1,
0.2162783, -0.5467131, 3.854206, 1, 1, 1, 1, 1,
0.2180619, -0.234345, 1.242958, 1, 1, 1, 1, 1,
0.2295547, -0.868225, 3.750158, 1, 1, 1, 1, 1,
0.2320077, 0.008165532, 1.852071, 1, 1, 1, 1, 1,
0.2330864, -3.488198, 2.36914, 1, 1, 1, 1, 1,
0.2364605, -1.968957, 3.072569, 0, 0, 1, 1, 1,
0.2373598, -0.2619565, 1.185788, 1, 0, 0, 1, 1,
0.241311, 0.3266906, 0.1665058, 1, 0, 0, 1, 1,
0.2422461, -0.9042077, 1.998652, 1, 0, 0, 1, 1,
0.2430517, -0.1093365, 1.836179, 1, 0, 0, 1, 1,
0.2450382, -0.005300273, 2.916429, 1, 0, 0, 1, 1,
0.2450563, 0.3298326, 1.331418, 0, 0, 0, 1, 1,
0.2477164, -1.215517, 4.421287, 0, 0, 0, 1, 1,
0.2520639, 1.150789, 0.9028901, 0, 0, 0, 1, 1,
0.2542881, 0.8073781, -0.4554448, 0, 0, 0, 1, 1,
0.2591412, -0.603896, 2.892689, 0, 0, 0, 1, 1,
0.2625704, 1.21427, -0.6832392, 0, 0, 0, 1, 1,
0.2638337, -0.1577801, 2.534811, 0, 0, 0, 1, 1,
0.2646193, -0.6911862, 2.692633, 1, 1, 1, 1, 1,
0.265243, 0.9221203, -1.130235, 1, 1, 1, 1, 1,
0.2690043, 0.1959102, 0.9534675, 1, 1, 1, 1, 1,
0.2704085, 0.7732227, 0.4569019, 1, 1, 1, 1, 1,
0.2752579, -0.5443416, 2.33354, 1, 1, 1, 1, 1,
0.2795039, 0.3792831, 0.7569783, 1, 1, 1, 1, 1,
0.2801279, -0.2825527, 1.887363, 1, 1, 1, 1, 1,
0.2804186, 0.0324573, 1.36667, 1, 1, 1, 1, 1,
0.2813735, 0.1280476, 0.3058035, 1, 1, 1, 1, 1,
0.2846814, -1.280041, 2.608594, 1, 1, 1, 1, 1,
0.2853461, -2.557472, 2.861073, 1, 1, 1, 1, 1,
0.2881482, 0.2380856, 1.915137, 1, 1, 1, 1, 1,
0.2927434, 0.2792857, 0.5110855, 1, 1, 1, 1, 1,
0.2928826, -1.289248, 2.230656, 1, 1, 1, 1, 1,
0.2946458, 1.471705, -0.3804388, 1, 1, 1, 1, 1,
0.2985069, 0.342708, 1.545727, 0, 0, 1, 1, 1,
0.2989044, 0.5839325, 2.10205, 1, 0, 0, 1, 1,
0.2997542, -0.4501551, 3.149194, 1, 0, 0, 1, 1,
0.304717, 2.282793, -0.4164988, 1, 0, 0, 1, 1,
0.3048856, -0.2640396, 1.966915, 1, 0, 0, 1, 1,
0.3054621, 0.6537206, 0.7534968, 1, 0, 0, 1, 1,
0.3096431, -2.188083, 3.586154, 0, 0, 0, 1, 1,
0.3097025, -0.1696719, 0.6661637, 0, 0, 0, 1, 1,
0.3102918, -0.8010814, 2.822421, 0, 0, 0, 1, 1,
0.3124673, -1.864198, 4.071204, 0, 0, 0, 1, 1,
0.3155931, 0.1527999, 1.007445, 0, 0, 0, 1, 1,
0.315619, 0.06494964, 1.051231, 0, 0, 0, 1, 1,
0.3158205, 0.6233736, 2.008675, 0, 0, 0, 1, 1,
0.3186968, 0.1156451, 1.55254, 1, 1, 1, 1, 1,
0.3226289, 0.9358193, -0.9562916, 1, 1, 1, 1, 1,
0.3231973, 0.2598971, 0.5769606, 1, 1, 1, 1, 1,
0.3236018, 0.7504619, -0.4143728, 1, 1, 1, 1, 1,
0.3252034, -0.3060069, 2.296843, 1, 1, 1, 1, 1,
0.3286766, 1.187515, 0.50222, 1, 1, 1, 1, 1,
0.3288398, -0.6476111, 2.423506, 1, 1, 1, 1, 1,
0.3324857, 0.1751648, -0.5451928, 1, 1, 1, 1, 1,
0.3330729, 2.674144, -0.4078222, 1, 1, 1, 1, 1,
0.333791, 0.7235879, 0.7628193, 1, 1, 1, 1, 1,
0.3369694, -0.2906398, 1.998724, 1, 1, 1, 1, 1,
0.3372655, 0.7331455, 1.586861, 1, 1, 1, 1, 1,
0.3404645, -0.9629349, 1.503457, 1, 1, 1, 1, 1,
0.3429107, -0.465047, 2.167424, 1, 1, 1, 1, 1,
0.3434962, 0.4641832, 0.1458216, 1, 1, 1, 1, 1,
0.3450048, 0.4751549, 0.1365665, 0, 0, 1, 1, 1,
0.3474996, -0.05531759, 1.885147, 1, 0, 0, 1, 1,
0.3481053, 0.5510647, 0.9376286, 1, 0, 0, 1, 1,
0.3483929, -0.02242509, 1.527324, 1, 0, 0, 1, 1,
0.3492177, -1.998057, 4.201921, 1, 0, 0, 1, 1,
0.3515781, -1.910735, 4.004478, 1, 0, 0, 1, 1,
0.351714, 0.6833056, -0.3698668, 0, 0, 0, 1, 1,
0.3545265, 1.617181, 0.3102272, 0, 0, 0, 1, 1,
0.355839, -1.228586, 2.623587, 0, 0, 0, 1, 1,
0.3571878, -0.4910642, 1.253652, 0, 0, 0, 1, 1,
0.3620887, -0.03320426, 3.395336, 0, 0, 0, 1, 1,
0.3621438, -3.147647, 3.195463, 0, 0, 0, 1, 1,
0.3673711, 0.7848533, 1.805467, 0, 0, 0, 1, 1,
0.3728922, -0.5939175, 2.126719, 1, 1, 1, 1, 1,
0.3758408, 0.377014, 0.6227548, 1, 1, 1, 1, 1,
0.3772846, 2.366371, 0.3380485, 1, 1, 1, 1, 1,
0.3831109, 1.003351, 0.5855486, 1, 1, 1, 1, 1,
0.3848159, -0.2818893, 2.158369, 1, 1, 1, 1, 1,
0.3858839, -0.5824039, 2.240016, 1, 1, 1, 1, 1,
0.3872893, 0.8435, 1.341751, 1, 1, 1, 1, 1,
0.388534, -1.072526, 3.073282, 1, 1, 1, 1, 1,
0.3887093, -0.6949232, 3.207212, 1, 1, 1, 1, 1,
0.3920229, 2.205755, -0.8265216, 1, 1, 1, 1, 1,
0.3995526, 0.1381388, 2.559459, 1, 1, 1, 1, 1,
0.4000341, -2.890949, 2.262142, 1, 1, 1, 1, 1,
0.4033635, -0.4163248, 2.650518, 1, 1, 1, 1, 1,
0.409579, 0.2322194, 1.920994, 1, 1, 1, 1, 1,
0.4122038, -0.6023407, 2.514256, 1, 1, 1, 1, 1,
0.4140621, 0.7012995, 1.790758, 0, 0, 1, 1, 1,
0.4143869, -1.078026, 2.10047, 1, 0, 0, 1, 1,
0.4176123, -0.1038285, 1.963879, 1, 0, 0, 1, 1,
0.4192771, -1.735121, 2.848881, 1, 0, 0, 1, 1,
0.4238036, 0.6635732, 0.4285156, 1, 0, 0, 1, 1,
0.4243961, 0.3731966, 1.043281, 1, 0, 0, 1, 1,
0.4245317, 0.6903642, 0.5588528, 0, 0, 0, 1, 1,
0.4251603, 0.4403193, 1.738006, 0, 0, 0, 1, 1,
0.4287382, -0.06777537, 0.2339542, 0, 0, 0, 1, 1,
0.4299604, 0.7503418, 0.1684858, 0, 0, 0, 1, 1,
0.4305582, -0.1616924, 2.021324, 0, 0, 0, 1, 1,
0.430811, 0.9396681, -0.2342472, 0, 0, 0, 1, 1,
0.4343881, 0.5859334, 0.5987018, 0, 0, 0, 1, 1,
0.4360836, 0.23658, 0.244036, 1, 1, 1, 1, 1,
0.4367245, -0.3630233, 3.141651, 1, 1, 1, 1, 1,
0.4393466, 1.360076, 1.926239, 1, 1, 1, 1, 1,
0.4417369, -0.3770612, 0.4586023, 1, 1, 1, 1, 1,
0.4457882, 0.6859005, 0.3021197, 1, 1, 1, 1, 1,
0.4481985, -0.6511833, 2.926501, 1, 1, 1, 1, 1,
0.4486904, 0.2445675, 0.5921119, 1, 1, 1, 1, 1,
0.4512189, 1.423666, -0.09950104, 1, 1, 1, 1, 1,
0.4556747, -1.893555, 1.891371, 1, 1, 1, 1, 1,
0.456395, 1.332094, -0.08800373, 1, 1, 1, 1, 1,
0.45774, -0.05734492, 0.7524168, 1, 1, 1, 1, 1,
0.4591886, 0.8620777, 0.2622515, 1, 1, 1, 1, 1,
0.4635335, 0.2115107, 1.153638, 1, 1, 1, 1, 1,
0.4674373, 0.7250309, 1.739745, 1, 1, 1, 1, 1,
0.4683452, 0.6308382, 1.031122, 1, 1, 1, 1, 1,
0.4686899, -1.085883, 3.25174, 0, 0, 1, 1, 1,
0.4701316, -0.094661, 1.42089, 1, 0, 0, 1, 1,
0.4720365, 0.892246, -0.3578351, 1, 0, 0, 1, 1,
0.4725603, 0.08244404, 1.886222, 1, 0, 0, 1, 1,
0.4760251, -0.2563333, 1.828673, 1, 0, 0, 1, 1,
0.4780259, 1.042463, -0.6175908, 1, 0, 0, 1, 1,
0.4780653, 1.723767, -0.2287971, 0, 0, 0, 1, 1,
0.4839637, -1.417879, 3.619328, 0, 0, 0, 1, 1,
0.4850158, 0.3362717, 1.462469, 0, 0, 0, 1, 1,
0.4851324, -0.7540867, 2.133775, 0, 0, 0, 1, 1,
0.4869418, 2.686612, -1.381723, 0, 0, 0, 1, 1,
0.4876864, 0.3527547, 0.6700656, 0, 0, 0, 1, 1,
0.4901311, -0.6774843, 3.661944, 0, 0, 0, 1, 1,
0.4931089, 0.2351489, 0.06359694, 1, 1, 1, 1, 1,
0.4946724, 1.373359, 1.259116, 1, 1, 1, 1, 1,
0.4952848, -0.5506419, 1.402114, 1, 1, 1, 1, 1,
0.4967757, -0.313602, 2.244081, 1, 1, 1, 1, 1,
0.5030066, 0.07803476, 2.357541, 1, 1, 1, 1, 1,
0.5039291, -1.346665, 3.329313, 1, 1, 1, 1, 1,
0.5049334, -0.1515892, 0.463119, 1, 1, 1, 1, 1,
0.5063646, 1.840163, 1.018067, 1, 1, 1, 1, 1,
0.5070357, 0.8198614, 0.4423525, 1, 1, 1, 1, 1,
0.5139062, -0.17781, 1.935967, 1, 1, 1, 1, 1,
0.515534, 0.04610792, 1.267425, 1, 1, 1, 1, 1,
0.5157755, 0.8280948, -1.563109, 1, 1, 1, 1, 1,
0.5194194, -0.2160297, 2.059335, 1, 1, 1, 1, 1,
0.519747, -0.7908889, 0.7462148, 1, 1, 1, 1, 1,
0.5225843, -0.0201121, 1.931071, 1, 1, 1, 1, 1,
0.5268564, 1.741707, -1.586349, 0, 0, 1, 1, 1,
0.5292103, -1.793733, 2.83919, 1, 0, 0, 1, 1,
0.531289, -1.636286, 3.710422, 1, 0, 0, 1, 1,
0.5316984, -0.6015565, 2.486782, 1, 0, 0, 1, 1,
0.5347137, -0.08852699, 2.05476, 1, 0, 0, 1, 1,
0.5392798, 0.4162199, 0.9780864, 1, 0, 0, 1, 1,
0.53985, 0.4086357, 0.7094917, 0, 0, 0, 1, 1,
0.5421643, 0.1921456, 0.4123739, 0, 0, 0, 1, 1,
0.5478203, -0.6684649, 2.723752, 0, 0, 0, 1, 1,
0.5485552, -0.2737965, 1.139152, 0, 0, 0, 1, 1,
0.5558227, 0.4084474, 1.415188, 0, 0, 0, 1, 1,
0.5594047, 0.08283112, 1.581919, 0, 0, 0, 1, 1,
0.5704842, -1.392796, 2.109647, 0, 0, 0, 1, 1,
0.5762943, 1.065019, 0.9116628, 1, 1, 1, 1, 1,
0.5800973, -0.4256822, 2.874282, 1, 1, 1, 1, 1,
0.5820395, -0.5430784, 2.984282, 1, 1, 1, 1, 1,
0.5858775, 0.7912247, -0.3612413, 1, 1, 1, 1, 1,
0.5914355, 1.367678, -1.066383, 1, 1, 1, 1, 1,
0.591486, 0.9204634, -0.3261175, 1, 1, 1, 1, 1,
0.5931972, 1.86932, 1.470774, 1, 1, 1, 1, 1,
0.5933207, -0.9495403, 1.496595, 1, 1, 1, 1, 1,
0.5942158, -1.116, 3.20843, 1, 1, 1, 1, 1,
0.5947071, -0.8978915, 2.636029, 1, 1, 1, 1, 1,
0.5960713, 0.4794225, 1.786011, 1, 1, 1, 1, 1,
0.5985849, -1.894305, 2.64461, 1, 1, 1, 1, 1,
0.5989591, -1.038954, 2.04337, 1, 1, 1, 1, 1,
0.6010056, 1.491586, 1.300385, 1, 1, 1, 1, 1,
0.6051908, -1.335062, 2.243272, 1, 1, 1, 1, 1,
0.6076013, -0.4327573, 4.197851, 0, 0, 1, 1, 1,
0.6108672, -1.306299, 3.538611, 1, 0, 0, 1, 1,
0.614302, 2.663219, 2.105505, 1, 0, 0, 1, 1,
0.6152121, 0.6538405, 2.454412, 1, 0, 0, 1, 1,
0.6223178, -1.108199, 2.302151, 1, 0, 0, 1, 1,
0.6284299, 0.7562709, 1.371892, 1, 0, 0, 1, 1,
0.6293835, 1.690713, 1.738566, 0, 0, 0, 1, 1,
0.6305476, 1.269569, 2.327199, 0, 0, 0, 1, 1,
0.6359385, -0.9150723, 2.863052, 0, 0, 0, 1, 1,
0.6598052, 0.3289356, 1.654834, 0, 0, 0, 1, 1,
0.6612011, 0.113994, 1.458675, 0, 0, 0, 1, 1,
0.6643733, 1.896039, 1.407237, 0, 0, 0, 1, 1,
0.6663343, 1.369237, 1.937206, 0, 0, 0, 1, 1,
0.6764005, 0.9360241, -1.251429, 1, 1, 1, 1, 1,
0.6775851, 0.4019871, -0.9991567, 1, 1, 1, 1, 1,
0.6811885, 1.200279, -1.196474, 1, 1, 1, 1, 1,
0.6818935, -0.5306788, 2.90952, 1, 1, 1, 1, 1,
0.6823979, -0.2346658, 1.174015, 1, 1, 1, 1, 1,
0.6845803, 2.108051, 0.380134, 1, 1, 1, 1, 1,
0.6867886, 0.6661947, -0.2202545, 1, 1, 1, 1, 1,
0.6933221, -1.210428, 1.946637, 1, 1, 1, 1, 1,
0.6935474, 1.594187, -1.060332, 1, 1, 1, 1, 1,
0.6970023, -2.153808, 2.508136, 1, 1, 1, 1, 1,
0.7005674, -0.3881381, 2.597171, 1, 1, 1, 1, 1,
0.7015429, 0.4668308, 0.0868323, 1, 1, 1, 1, 1,
0.7043897, -0.638752, 2.801611, 1, 1, 1, 1, 1,
0.7049075, 0.012858, 1.473316, 1, 1, 1, 1, 1,
0.7088961, 1.357499, -0.2411512, 1, 1, 1, 1, 1,
0.7148508, 1.997595, -2.467482, 0, 0, 1, 1, 1,
0.7149639, -1.700559, 1.458181, 1, 0, 0, 1, 1,
0.7179852, -0.6707723, 2.273207, 1, 0, 0, 1, 1,
0.7190056, 1.588022, 2.490282, 1, 0, 0, 1, 1,
0.7231562, 0.1071879, 1.844305, 1, 0, 0, 1, 1,
0.7243981, 0.5824715, 2.107818, 1, 0, 0, 1, 1,
0.7265432, -0.696779, 1.396272, 0, 0, 0, 1, 1,
0.726882, -0.7037657, 1.01545, 0, 0, 0, 1, 1,
0.727075, 0.8612699, 2.319408, 0, 0, 0, 1, 1,
0.7294618, -0.05524119, 1.185982, 0, 0, 0, 1, 1,
0.7295176, 0.8408314, 0.05257118, 0, 0, 0, 1, 1,
0.7344708, 1.08975, 0.7183242, 0, 0, 0, 1, 1,
0.7439326, 1.324157, -0.05782829, 0, 0, 0, 1, 1,
0.7465513, -1.183432, 1.127976, 1, 1, 1, 1, 1,
0.7482934, 0.922651, 1.11506, 1, 1, 1, 1, 1,
0.7501639, 0.1685921, 1.827334, 1, 1, 1, 1, 1,
0.7559541, 1.564, -1.937957, 1, 1, 1, 1, 1,
0.7580841, -1.01433, 3.449246, 1, 1, 1, 1, 1,
0.7607552, 0.5046995, -0.3133838, 1, 1, 1, 1, 1,
0.7638142, -0.3834248, 4.166991, 1, 1, 1, 1, 1,
0.7642412, 0.07245848, 1.141727, 1, 1, 1, 1, 1,
0.7659552, 0.3218992, 1.173427, 1, 1, 1, 1, 1,
0.7729855, -0.3112546, 1.006202, 1, 1, 1, 1, 1,
0.7764304, -1.33548, 5.337518, 1, 1, 1, 1, 1,
0.7771349, 0.413232, 0.003603774, 1, 1, 1, 1, 1,
0.7785816, 0.2456333, 1.073225, 1, 1, 1, 1, 1,
0.7793261, -0.7287658, 3.628836, 1, 1, 1, 1, 1,
0.786271, 0.9961368, 0.1466821, 1, 1, 1, 1, 1,
0.7888586, 0.2332802, 1.634822, 0, 0, 1, 1, 1,
0.7894714, 0.452965, 0.9579778, 1, 0, 0, 1, 1,
0.7940573, 1.422801, 1.097691, 1, 0, 0, 1, 1,
0.8101343, -0.345378, 0.8817166, 1, 0, 0, 1, 1,
0.8126344, 1.92038, 0.2730033, 1, 0, 0, 1, 1,
0.8136893, -0.3732947, 2.320068, 1, 0, 0, 1, 1,
0.8174098, -1.908978, 1.901147, 0, 0, 0, 1, 1,
0.8330459, -1.137213, 2.855994, 0, 0, 0, 1, 1,
0.8361576, -1.118427, 4.689979, 0, 0, 0, 1, 1,
0.8373522, -1.255999, 3.396915, 0, 0, 0, 1, 1,
0.8431972, 0.06519022, 2.499617, 0, 0, 0, 1, 1,
0.8440815, -0.7827709, 2.142777, 0, 0, 0, 1, 1,
0.8457242, 1.814353, 0.5431877, 0, 0, 0, 1, 1,
0.8553762, -0.2219717, 2.317741, 1, 1, 1, 1, 1,
0.8643187, 0.8810883, -1.258496, 1, 1, 1, 1, 1,
0.8755302, -1.169691, 1.882246, 1, 1, 1, 1, 1,
0.8757758, -0.3496054, 4.329107, 1, 1, 1, 1, 1,
0.8804161, 0.5942615, 0.05485242, 1, 1, 1, 1, 1,
0.8812602, 0.507616, 1.189838, 1, 1, 1, 1, 1,
0.8814136, 1.199775, -0.5835885, 1, 1, 1, 1, 1,
0.8896875, -1.05087, 3.704824, 1, 1, 1, 1, 1,
0.8936712, -1.839036, 1.453683, 1, 1, 1, 1, 1,
0.8965648, 1.111939, 1.258233, 1, 1, 1, 1, 1,
0.8994349, -0.5123134, 2.543777, 1, 1, 1, 1, 1,
0.9002613, -0.3521983, 0.8284513, 1, 1, 1, 1, 1,
0.9056277, 1.224339, 1.947725, 1, 1, 1, 1, 1,
0.9092926, -0.04081126, 3.617342, 1, 1, 1, 1, 1,
0.911853, -1.242584, 2.224287, 1, 1, 1, 1, 1,
0.9218634, -0.6345856, 0.5697802, 0, 0, 1, 1, 1,
0.9278707, 0.4419131, 2.934087, 1, 0, 0, 1, 1,
0.9328789, 0.5977497, -0.9767271, 1, 0, 0, 1, 1,
0.9332336, 0.3173803, -0.8973401, 1, 0, 0, 1, 1,
0.9350756, -0.9478562, 1.487175, 1, 0, 0, 1, 1,
0.9382712, 0.4829979, 2.454305, 1, 0, 0, 1, 1,
0.9520289, 1.33925, 0.277052, 0, 0, 0, 1, 1,
0.9577855, -0.8592489, -0.5934213, 0, 0, 0, 1, 1,
0.9579163, 0.9380156, 1.047537, 0, 0, 0, 1, 1,
0.958215, 0.8394686, 0.001966665, 0, 0, 0, 1, 1,
0.9619191, -0.5881175, 2.435354, 0, 0, 0, 1, 1,
0.9634928, 0.1551061, 1.131014, 0, 0, 0, 1, 1,
0.9650407, 1.327887, -0.0170444, 0, 0, 0, 1, 1,
0.9650444, -0.3141031, 0.9613009, 1, 1, 1, 1, 1,
0.9698706, 0.9130903, 2.275312, 1, 1, 1, 1, 1,
0.9748442, -1.344159, 1.121708, 1, 1, 1, 1, 1,
0.9766265, -0.3189341, 1.689365, 1, 1, 1, 1, 1,
0.9769195, -1.048812, 3.270938, 1, 1, 1, 1, 1,
0.9794639, 1.242118, 0.4610669, 1, 1, 1, 1, 1,
0.9880854, -1.620413, 0.6167482, 1, 1, 1, 1, 1,
0.9923837, 0.07061868, 1.427854, 1, 1, 1, 1, 1,
0.993481, -2.113377, 0.7391757, 1, 1, 1, 1, 1,
0.9968218, -1.649921, 3.66218, 1, 1, 1, 1, 1,
0.9994751, -0.7483079, 3.696793, 1, 1, 1, 1, 1,
1.02099, -0.7650494, 2.261579, 1, 1, 1, 1, 1,
1.021859, 0.1279769, 0.4304518, 1, 1, 1, 1, 1,
1.024927, -1.200588, 2.414133, 1, 1, 1, 1, 1,
1.027752, -0.2647644, 2.25106, 1, 1, 1, 1, 1,
1.035052, 1.574347, 0.2248346, 0, 0, 1, 1, 1,
1.037713, 2.090257, 1.735492, 1, 0, 0, 1, 1,
1.039047, -1.04597, 0.3668052, 1, 0, 0, 1, 1,
1.042849, -0.0880148, 2.706787, 1, 0, 0, 1, 1,
1.043214, 0.7343259, 0.2798157, 1, 0, 0, 1, 1,
1.047005, -1.507626, 1.592876, 1, 0, 0, 1, 1,
1.04777, 1.090841, 0.60872, 0, 0, 0, 1, 1,
1.051276, 0.1825612, 1.853961, 0, 0, 0, 1, 1,
1.053922, 1.030754, 1.052438, 0, 0, 0, 1, 1,
1.063031, -0.6691238, 4.365815, 0, 0, 0, 1, 1,
1.068991, -0.3108195, 2.795767, 0, 0, 0, 1, 1,
1.069117, -0.8304959, 2.263972, 0, 0, 0, 1, 1,
1.069325, 0.5344872, 1.434252, 0, 0, 0, 1, 1,
1.077778, 0.3461594, 2.897487, 1, 1, 1, 1, 1,
1.084004, -1.336781, 2.226576, 1, 1, 1, 1, 1,
1.085661, -0.5665311, 1.776614, 1, 1, 1, 1, 1,
1.088887, 0.2287253, 0.811114, 1, 1, 1, 1, 1,
1.104518, -0.235293, 2.185255, 1, 1, 1, 1, 1,
1.107876, 0.4944334, 0.2126595, 1, 1, 1, 1, 1,
1.10975, -1.273016, 2.853975, 1, 1, 1, 1, 1,
1.111957, -0.6408439, 2.368723, 1, 1, 1, 1, 1,
1.118005, -1.138323, 1.962107, 1, 1, 1, 1, 1,
1.119585, -0.1894011, 1.359559, 1, 1, 1, 1, 1,
1.126595, -0.8591257, -0.3068478, 1, 1, 1, 1, 1,
1.138327, 0.03073149, 4.208504, 1, 1, 1, 1, 1,
1.140118, 1.21334, 0.2563817, 1, 1, 1, 1, 1,
1.142587, -1.846198, 3.439015, 1, 1, 1, 1, 1,
1.149947, 0.3058738, -0.5805989, 1, 1, 1, 1, 1,
1.15113, 1.800301, -0.02186012, 0, 0, 1, 1, 1,
1.154761, 0.3171819, 0.414582, 1, 0, 0, 1, 1,
1.160474, 0.1648941, 1.274782, 1, 0, 0, 1, 1,
1.160736, 1.927172, 1.181092, 1, 0, 0, 1, 1,
1.173884, 0.5300881, 1.840616, 1, 0, 0, 1, 1,
1.182112, 2.131956, 1.491763, 1, 0, 0, 1, 1,
1.185661, -0.7986321, 1.015995, 0, 0, 0, 1, 1,
1.192625, 0.6201454, 1.678878, 0, 0, 0, 1, 1,
1.219816, 0.153375, 1.223615, 0, 0, 0, 1, 1,
1.221763, -0.2790934, 2.846292, 0, 0, 0, 1, 1,
1.226201, -0.7347326, 2.355045, 0, 0, 0, 1, 1,
1.234484, 0.4292518, 0.5928183, 0, 0, 0, 1, 1,
1.24029, -0.2662815, 2.212392, 0, 0, 0, 1, 1,
1.2406, 2.003061, -0.9018989, 1, 1, 1, 1, 1,
1.25362, 0.5727515, 0.5699813, 1, 1, 1, 1, 1,
1.271996, 0.2479513, 1.880753, 1, 1, 1, 1, 1,
1.272075, -0.8189179, 0.6906507, 1, 1, 1, 1, 1,
1.2768, 0.05370945, 1.417208, 1, 1, 1, 1, 1,
1.291669, -1.197192, 1.068731, 1, 1, 1, 1, 1,
1.295814, -1.150012, 0.672785, 1, 1, 1, 1, 1,
1.301237, 0.7006131, 0.8875895, 1, 1, 1, 1, 1,
1.302785, -0.8301966, 3.129365, 1, 1, 1, 1, 1,
1.306092, 0.1437546, 2.012661, 1, 1, 1, 1, 1,
1.313809, -1.03779, 1.705005, 1, 1, 1, 1, 1,
1.318456, 0.8003979, 0.3470229, 1, 1, 1, 1, 1,
1.325333, 0.5661074, 2.136735, 1, 1, 1, 1, 1,
1.325938, 0.9524593, 1.364655, 1, 1, 1, 1, 1,
1.329866, 1.444615, 2.236599, 1, 1, 1, 1, 1,
1.330234, -0.2212858, 2.197515, 0, 0, 1, 1, 1,
1.332907, -2.063126, 3.055393, 1, 0, 0, 1, 1,
1.336894, 0.2112122, 1.360106, 1, 0, 0, 1, 1,
1.34817, -1.486702, 4.01019, 1, 0, 0, 1, 1,
1.348234, 0.3305286, -0.5418996, 1, 0, 0, 1, 1,
1.356498, -0.4393353, 1.487851, 1, 0, 0, 1, 1,
1.35813, -0.9170154, 2.711858, 0, 0, 0, 1, 1,
1.366384, -0.744069, 1.347832, 0, 0, 0, 1, 1,
1.367102, -1.591394, 3.280585, 0, 0, 0, 1, 1,
1.379717, 0.1815671, 2.354284, 0, 0, 0, 1, 1,
1.382377, -0.4252599, 3.007286, 0, 0, 0, 1, 1,
1.385055, -2.33259, 3.125959, 0, 0, 0, 1, 1,
1.387077, 1.559266, 0.09301654, 0, 0, 0, 1, 1,
1.397803, 1.021077, 1.235308, 1, 1, 1, 1, 1,
1.404557, -1.252837, 1.359396, 1, 1, 1, 1, 1,
1.423334, 0.1190345, 1.569139, 1, 1, 1, 1, 1,
1.424165, -1.179796, 2.604941, 1, 1, 1, 1, 1,
1.425536, 1.134439, 0.1682939, 1, 1, 1, 1, 1,
1.429247, 1.5299, 1.523304, 1, 1, 1, 1, 1,
1.439279, -0.3133723, 1.532298, 1, 1, 1, 1, 1,
1.451988, 0.123918, 0.3534791, 1, 1, 1, 1, 1,
1.455573, 0.1598861, 1.319377, 1, 1, 1, 1, 1,
1.457704, 0.6397666, 2.527935, 1, 1, 1, 1, 1,
1.485211, 1.07428, 0.6549017, 1, 1, 1, 1, 1,
1.514151, 0.5586064, 0.9138637, 1, 1, 1, 1, 1,
1.52603, 0.5185754, 1.259236, 1, 1, 1, 1, 1,
1.536531, -0.784254, 0.8356364, 1, 1, 1, 1, 1,
1.558433, 0.5993193, 0.4663724, 1, 1, 1, 1, 1,
1.584122, -1.521403, 2.77769, 0, 0, 1, 1, 1,
1.594073, 1.475596, 1.406967, 1, 0, 0, 1, 1,
1.650392, -1.180758, 2.012438, 1, 0, 0, 1, 1,
1.676131, 1.679415, -0.8266351, 1, 0, 0, 1, 1,
1.679101, 0.7002904, -0.517667, 1, 0, 0, 1, 1,
1.691759, 1.766915, 3.467752, 1, 0, 0, 1, 1,
1.698787, 0.3195075, 1.6273, 0, 0, 0, 1, 1,
1.708602, -0.6147082, 1.585433, 0, 0, 0, 1, 1,
1.713343, 0.3663923, 1.199808, 0, 0, 0, 1, 1,
1.716675, -0.4393283, 1.563484, 0, 0, 0, 1, 1,
1.726396, -1.485651, 1.995089, 0, 0, 0, 1, 1,
1.786024, 1.148959, 1.092942, 0, 0, 0, 1, 1,
1.809986, 1.997545, -0.9907082, 0, 0, 0, 1, 1,
1.831206, -0.04125362, 0.6798289, 1, 1, 1, 1, 1,
1.875757, -0.4972792, 1.497744, 1, 1, 1, 1, 1,
1.884437, -1.13333, 1.323002, 1, 1, 1, 1, 1,
1.90089, -2.154957, 2.786613, 1, 1, 1, 1, 1,
1.970632, -0.3675574, 0.6367909, 1, 1, 1, 1, 1,
1.979458, -0.5710767, 1.34912, 1, 1, 1, 1, 1,
1.991614, -0.4443438, 2.861681, 1, 1, 1, 1, 1,
2.065725, -0.1209624, 3.10264, 1, 1, 1, 1, 1,
2.082736, 0.2152911, 0.5379701, 1, 1, 1, 1, 1,
2.094734, 1.649195, 1.299014, 1, 1, 1, 1, 1,
2.101313, -0.08707053, 2.204026, 1, 1, 1, 1, 1,
2.140041, -0.08528585, 2.826003, 1, 1, 1, 1, 1,
2.143221, -0.5977347, 0.7321788, 1, 1, 1, 1, 1,
2.1754, 0.3076401, 1.054605, 1, 1, 1, 1, 1,
2.184942, 0.7500578, 0.2337936, 1, 1, 1, 1, 1,
2.199584, 1.009715, 2.400995, 0, 0, 1, 1, 1,
2.20444, 0.8606487, 1.131288, 1, 0, 0, 1, 1,
2.217825, 0.6709393, 3.150055, 1, 0, 0, 1, 1,
2.236887, 1.508116, 0.07414756, 1, 0, 0, 1, 1,
2.276949, -0.7593892, -0.4661248, 1, 0, 0, 1, 1,
2.299022, 0.1863444, 2.685865, 1, 0, 0, 1, 1,
2.35248, -0.7971102, 1.073217, 0, 0, 0, 1, 1,
2.365654, -0.8895184, 1.88206, 0, 0, 0, 1, 1,
2.402307, 0.4468395, 2.082545, 0, 0, 0, 1, 1,
2.434316, 2.098405, -0.03567046, 0, 0, 0, 1, 1,
2.50292, -1.139845, 1.875524, 0, 0, 0, 1, 1,
2.512679, -0.3953826, 2.139916, 0, 0, 0, 1, 1,
2.635014, -0.4863408, 2.124664, 0, 0, 0, 1, 1,
2.656346, 0.717616, 2.650061, 1, 1, 1, 1, 1,
2.755877, 0.1929535, 1.843835, 1, 1, 1, 1, 1,
2.950071, 0.5680876, 2.271514, 1, 1, 1, 1, 1,
2.986602, -0.07659473, 2.391363, 1, 1, 1, 1, 1,
3.003858, 0.7083827, 1.93439, 1, 1, 1, 1, 1,
3.220085, 0.7984933, 0.989442, 1, 1, 1, 1, 1,
4.656998, 0.3253605, 0.9778158, 1, 1, 1, 1, 1
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
var radius = 10.85841;
var distance = 38.1397;
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
mvMatrix.translate( -0.7986329, 0.2235107, 0.2876029 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -38.1397);
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
