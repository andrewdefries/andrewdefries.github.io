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
-3.564449, 0.4721879, -2.94215, 1, 0, 0, 1,
-3.174633, -0.7357057, -3.521205, 1, 0.007843138, 0, 1,
-2.825139, -1.039523, -2.119241, 1, 0.01176471, 0, 1,
-2.751025, -0.08167604, -0.5889883, 1, 0.01960784, 0, 1,
-2.656203, 1.333722, -1.709028, 1, 0.02352941, 0, 1,
-2.583472, -0.6919988, -0.2462372, 1, 0.03137255, 0, 1,
-2.556603, 0.9726398, -1.785669, 1, 0.03529412, 0, 1,
-2.515844, -0.5667045, -0.7137495, 1, 0.04313726, 0, 1,
-2.510752, 0.9507505, -1.260035, 1, 0.04705882, 0, 1,
-2.510322, 0.07944794, -1.627108, 1, 0.05490196, 0, 1,
-2.444947, -0.7258351, -2.570132, 1, 0.05882353, 0, 1,
-2.379314, -1.299422, -2.818262, 1, 0.06666667, 0, 1,
-2.376597, 0.2716179, -1.480062, 1, 0.07058824, 0, 1,
-2.367351, -1.873143, -3.65298, 1, 0.07843138, 0, 1,
-2.333821, 1.441017, -1.119798, 1, 0.08235294, 0, 1,
-2.143454, 0.9518601, -1.204907, 1, 0.09019608, 0, 1,
-2.125397, 1.045525, 1.273949, 1, 0.09411765, 0, 1,
-2.102249, 0.06556498, -2.019095, 1, 0.1019608, 0, 1,
-2.101075, 0.9732975, -0.6516861, 1, 0.1098039, 0, 1,
-2.028282, -0.5080389, -0.883896, 1, 0.1137255, 0, 1,
-2.011841, 0.713403, -0.5857249, 1, 0.1215686, 0, 1,
-2.007012, -0.8283107, -1.77451, 1, 0.1254902, 0, 1,
-1.992376, -0.2362635, -1.131082, 1, 0.1333333, 0, 1,
-1.991944, 1.604711, -0.6349925, 1, 0.1372549, 0, 1,
-1.944523, -1.726156, -2.938993, 1, 0.145098, 0, 1,
-1.940542, -1.105553, -0.2813141, 1, 0.1490196, 0, 1,
-1.910931, 0.4926724, -0.5077571, 1, 0.1568628, 0, 1,
-1.900093, 0.846919, -1.259439, 1, 0.1607843, 0, 1,
-1.895854, 0.8548464, -1.261024, 1, 0.1686275, 0, 1,
-1.889595, -0.553856, -1.552138, 1, 0.172549, 0, 1,
-1.88151, -0.5675972, -2.376357, 1, 0.1803922, 0, 1,
-1.880118, -0.1567421, -1.656761, 1, 0.1843137, 0, 1,
-1.872717, -0.3941993, -0.4215704, 1, 0.1921569, 0, 1,
-1.85996, -0.7626053, -2.373721, 1, 0.1960784, 0, 1,
-1.853927, -0.5267304, -3.169131, 1, 0.2039216, 0, 1,
-1.852268, 1.650076, -0.9171865, 1, 0.2117647, 0, 1,
-1.835476, -0.1994967, -0.3463718, 1, 0.2156863, 0, 1,
-1.832817, -0.05306505, -0.929374, 1, 0.2235294, 0, 1,
-1.820289, -0.4481283, -2.417247, 1, 0.227451, 0, 1,
-1.791407, 2.375571, 2.307573, 1, 0.2352941, 0, 1,
-1.78948, -0.2571912, -2.00208, 1, 0.2392157, 0, 1,
-1.788178, 0.8411469, -0.2218406, 1, 0.2470588, 0, 1,
-1.783601, 0.7083297, -2.209275, 1, 0.2509804, 0, 1,
-1.782806, 1.502442, -0.4235505, 1, 0.2588235, 0, 1,
-1.781232, -1.923724, -1.281937, 1, 0.2627451, 0, 1,
-1.772053, 1.455079, -0.08652804, 1, 0.2705882, 0, 1,
-1.765803, -0.452417, -1.424636, 1, 0.2745098, 0, 1,
-1.75287, -0.1427793, -2.715471, 1, 0.282353, 0, 1,
-1.750463, 1.109806, -1.320104, 1, 0.2862745, 0, 1,
-1.672637, -1.049991, -1.70943, 1, 0.2941177, 0, 1,
-1.665697, -0.3249888, 0.6363404, 1, 0.3019608, 0, 1,
-1.66043, 0.7333495, 0.1770142, 1, 0.3058824, 0, 1,
-1.647092, 0.4853967, -1.215737, 1, 0.3137255, 0, 1,
-1.645612, -0.1112496, -0.8642204, 1, 0.3176471, 0, 1,
-1.627691, -0.4840921, -2.725184, 1, 0.3254902, 0, 1,
-1.625533, 1.150975, -1.995874, 1, 0.3294118, 0, 1,
-1.613498, -1.34812, -2.757048, 1, 0.3372549, 0, 1,
-1.612367, -0.7922022, -1.087655, 1, 0.3411765, 0, 1,
-1.604457, 1.613559, -0.6757278, 1, 0.3490196, 0, 1,
-1.597265, -0.7804412, -3.302578, 1, 0.3529412, 0, 1,
-1.590849, 0.1389528, -2.037137, 1, 0.3607843, 0, 1,
-1.588391, 1.135595, -0.5604627, 1, 0.3647059, 0, 1,
-1.584783, 1.365234, -1.508728, 1, 0.372549, 0, 1,
-1.565035, -0.04413507, -2.148102, 1, 0.3764706, 0, 1,
-1.563827, 0.4463047, -1.398869, 1, 0.3843137, 0, 1,
-1.561132, -0.05824246, -1.113391, 1, 0.3882353, 0, 1,
-1.559389, 2.400591, -1.841242, 1, 0.3960784, 0, 1,
-1.558976, -0.5328839, -1.933428, 1, 0.4039216, 0, 1,
-1.549347, 1.926003, -0.7014158, 1, 0.4078431, 0, 1,
-1.543333, 0.2204858, -2.173736, 1, 0.4156863, 0, 1,
-1.524177, 1.070532, 0.8692245, 1, 0.4196078, 0, 1,
-1.498538, -0.1639822, -2.234816, 1, 0.427451, 0, 1,
-1.477632, 0.005904375, -4.836438, 1, 0.4313726, 0, 1,
-1.474737, 1.08062, -0.6696858, 1, 0.4392157, 0, 1,
-1.473682, -1.339507, -2.735902, 1, 0.4431373, 0, 1,
-1.471792, 0.6568341, -0.5954184, 1, 0.4509804, 0, 1,
-1.468158, 0.8568068, -0.2386002, 1, 0.454902, 0, 1,
-1.467406, -1.095972, -2.695403, 1, 0.4627451, 0, 1,
-1.458249, -0.1031654, -1.611086, 1, 0.4666667, 0, 1,
-1.438828, 1.320221, -1.23625, 1, 0.4745098, 0, 1,
-1.43575, 0.909144, -2.522545, 1, 0.4784314, 0, 1,
-1.43559, -0.2022091, -2.013989, 1, 0.4862745, 0, 1,
-1.431507, -0.9423148, -1.839097, 1, 0.4901961, 0, 1,
-1.424537, 0.8545352, -0.8406897, 1, 0.4980392, 0, 1,
-1.420676, 0.2177389, -0.05063297, 1, 0.5058824, 0, 1,
-1.419558, 1.69106, -1.059753, 1, 0.509804, 0, 1,
-1.416098, 0.2669207, -2.520612, 1, 0.5176471, 0, 1,
-1.410121, 0.485717, -2.303126, 1, 0.5215687, 0, 1,
-1.410107, 0.6611241, -1.930902, 1, 0.5294118, 0, 1,
-1.402927, 1.693993, -0.3812239, 1, 0.5333334, 0, 1,
-1.380075, 0.1980953, -1.918951, 1, 0.5411765, 0, 1,
-1.379828, -0.3520443, -2.084998, 1, 0.5450981, 0, 1,
-1.378624, -0.1731246, -2.351525, 1, 0.5529412, 0, 1,
-1.376829, 1.280407, -2.455817, 1, 0.5568628, 0, 1,
-1.374161, 0.8287533, -0.07311979, 1, 0.5647059, 0, 1,
-1.366537, -0.1028376, -3.275379, 1, 0.5686275, 0, 1,
-1.348478, -2.149913, -2.625706, 1, 0.5764706, 0, 1,
-1.344693, 0.6089937, -0.1251371, 1, 0.5803922, 0, 1,
-1.339011, -0.2209431, -2.121886, 1, 0.5882353, 0, 1,
-1.338784, 0.3533221, -2.720203, 1, 0.5921569, 0, 1,
-1.337787, 0.5712534, -3.348475, 1, 0.6, 0, 1,
-1.32912, 0.3439987, 0.5634938, 1, 0.6078432, 0, 1,
-1.328313, -0.0339621, -0.3972601, 1, 0.6117647, 0, 1,
-1.325952, 1.793083, -1.304124, 1, 0.6196079, 0, 1,
-1.321691, 0.1703964, -2.57124, 1, 0.6235294, 0, 1,
-1.289236, -1.401321, -1.788684, 1, 0.6313726, 0, 1,
-1.278763, -1.820054, -2.99857, 1, 0.6352941, 0, 1,
-1.266738, 0.7817731, -1.560796, 1, 0.6431373, 0, 1,
-1.263857, 0.003081069, -0.8023946, 1, 0.6470588, 0, 1,
-1.262811, 1.192613, -0.812548, 1, 0.654902, 0, 1,
-1.259763, -1.440049, -3.388721, 1, 0.6588235, 0, 1,
-1.255043, 1.50711, -2.153667, 1, 0.6666667, 0, 1,
-1.252372, -1.149955, -2.531865, 1, 0.6705883, 0, 1,
-1.241797, -0.9429878, -1.36943, 1, 0.6784314, 0, 1,
-1.237795, -0.8983701, -3.558025, 1, 0.682353, 0, 1,
-1.231247, -1.546063, -1.68747, 1, 0.6901961, 0, 1,
-1.229889, -1.500426, -2.417718, 1, 0.6941177, 0, 1,
-1.226496, -3.641681, -1.437435, 1, 0.7019608, 0, 1,
-1.219674, 0.335436, -0.8214099, 1, 0.7098039, 0, 1,
-1.209916, -0.7804891, -3.615097, 1, 0.7137255, 0, 1,
-1.20847, -0.8804083, -1.188388, 1, 0.7215686, 0, 1,
-1.200652, 0.6612009, -0.5336422, 1, 0.7254902, 0, 1,
-1.198852, 0.3448249, -2.999138, 1, 0.7333333, 0, 1,
-1.197768, -1.394965, -1.956761, 1, 0.7372549, 0, 1,
-1.197613, -0.7727053, -1.559831, 1, 0.7450981, 0, 1,
-1.191346, 2.196496, -0.6363612, 1, 0.7490196, 0, 1,
-1.182408, 1.45321, -2.189421, 1, 0.7568628, 0, 1,
-1.171941, 0.7199707, -2.465301, 1, 0.7607843, 0, 1,
-1.171014, 0.4480777, -1.915745, 1, 0.7686275, 0, 1,
-1.170603, -0.6931762, -1.437755, 1, 0.772549, 0, 1,
-1.169388, 0.9245498, 1.941084, 1, 0.7803922, 0, 1,
-1.168457, 0.9586568, 0.0550126, 1, 0.7843137, 0, 1,
-1.163783, -0.4607004, -2.358402, 1, 0.7921569, 0, 1,
-1.155946, -2.085326, -3.066312, 1, 0.7960784, 0, 1,
-1.155838, -0.3999591, -1.708848, 1, 0.8039216, 0, 1,
-1.151496, -1.114693, -2.401256, 1, 0.8117647, 0, 1,
-1.143139, 1.292256, -1.354126, 1, 0.8156863, 0, 1,
-1.132818, 1.846804, -0.2150531, 1, 0.8235294, 0, 1,
-1.132469, 3.633452, -0.4837971, 1, 0.827451, 0, 1,
-1.124623, 1.023813, -1.530331, 1, 0.8352941, 0, 1,
-1.1207, -0.311082, 0.6736735, 1, 0.8392157, 0, 1,
-1.114797, 1.763057, -0.1449081, 1, 0.8470588, 0, 1,
-1.113904, -0.4936262, -1.145129, 1, 0.8509804, 0, 1,
-1.111142, 1.42973, -0.9952244, 1, 0.8588235, 0, 1,
-1.104982, -0.624369, -3.117538, 1, 0.8627451, 0, 1,
-1.102051, -0.6245844, -1.480588, 1, 0.8705882, 0, 1,
-1.101019, 0.457239, -2.515671, 1, 0.8745098, 0, 1,
-1.094559, -0.6550571, -3.069212, 1, 0.8823529, 0, 1,
-1.093065, 1.12295, -1.386804, 1, 0.8862745, 0, 1,
-1.09085, -1.142951, -2.140982, 1, 0.8941177, 0, 1,
-1.089032, 1.283975, -0.8848805, 1, 0.8980392, 0, 1,
-1.08882, 0.9521004, -1.133723, 1, 0.9058824, 0, 1,
-1.088687, 0.5555307, -1.584465, 1, 0.9137255, 0, 1,
-1.084836, 0.1478067, -1.764049, 1, 0.9176471, 0, 1,
-1.084055, 1.728338, 1.202727, 1, 0.9254902, 0, 1,
-1.081362, -0.6319203, -2.324765, 1, 0.9294118, 0, 1,
-1.079146, 0.6952437, -1.000091, 1, 0.9372549, 0, 1,
-1.07323, 1.03956, -1.283343, 1, 0.9411765, 0, 1,
-1.072902, 1.521523, -1.221035, 1, 0.9490196, 0, 1,
-1.062437, 0.6967207, -0.9171628, 1, 0.9529412, 0, 1,
-1.059223, 0.3203954, -1.833079, 1, 0.9607843, 0, 1,
-1.057185, -0.2323198, -2.802977, 1, 0.9647059, 0, 1,
-1.057038, -1.495993, -2.634271, 1, 0.972549, 0, 1,
-1.054477, -0.3709653, -1.683555, 1, 0.9764706, 0, 1,
-1.051061, -0.8284941, -2.577259, 1, 0.9843137, 0, 1,
-1.047351, 0.956575, -0.6257081, 1, 0.9882353, 0, 1,
-1.045939, 0.7612268, -1.478318, 1, 0.9960784, 0, 1,
-1.042328, -1.552066, -1.829198, 0.9960784, 1, 0, 1,
-1.041051, 1.998651, -1.133976, 0.9921569, 1, 0, 1,
-1.040582, 1.190497, 1.096456, 0.9843137, 1, 0, 1,
-1.035927, 0.4798138, 1.131061, 0.9803922, 1, 0, 1,
-1.034261, -0.04786433, -1.703209, 0.972549, 1, 0, 1,
-1.032605, 0.300833, -0.834174, 0.9686275, 1, 0, 1,
-1.03073, 1.078049, 0.3938051, 0.9607843, 1, 0, 1,
-1.014996, 0.5753364, -1.490636, 0.9568627, 1, 0, 1,
-1.013018, -0.952841, -1.108728, 0.9490196, 1, 0, 1,
-1.012057, 2.404064, 0.2181235, 0.945098, 1, 0, 1,
-1.006892, -0.2477323, 0.5401527, 0.9372549, 1, 0, 1,
-1.005061, -1.462291, -3.291398, 0.9333333, 1, 0, 1,
-1.004387, 0.1269579, -0.645107, 0.9254902, 1, 0, 1,
-0.9968999, -0.2012593, -2.41023, 0.9215686, 1, 0, 1,
-0.9950787, 1.522257, 0.03177807, 0.9137255, 1, 0, 1,
-0.9867667, 0.08029833, -1.192006, 0.9098039, 1, 0, 1,
-0.9849071, 2.75546, 0.07508165, 0.9019608, 1, 0, 1,
-0.9846538, -0.05464378, -1.896746, 0.8941177, 1, 0, 1,
-0.9655142, -0.6047719, -1.939739, 0.8901961, 1, 0, 1,
-0.9574612, 0.4223154, -1.691087, 0.8823529, 1, 0, 1,
-0.9557361, -0.8438087, -3.410668, 0.8784314, 1, 0, 1,
-0.9550046, -0.5277774, -2.648055, 0.8705882, 1, 0, 1,
-0.9523184, -0.00623926, -0.7541077, 0.8666667, 1, 0, 1,
-0.9509079, 0.3540423, -1.289322, 0.8588235, 1, 0, 1,
-0.9499364, -0.1671475, 0.267861, 0.854902, 1, 0, 1,
-0.9491239, -0.3472801, -4.434301, 0.8470588, 1, 0, 1,
-0.9449886, 0.7810842, -0.9467849, 0.8431373, 1, 0, 1,
-0.9438257, -0.8074312, -1.442178, 0.8352941, 1, 0, 1,
-0.9434542, 1.008471, -1.17125, 0.8313726, 1, 0, 1,
-0.9426269, -0.8325559, -4.23877, 0.8235294, 1, 0, 1,
-0.9381703, -1.063466, -1.329825, 0.8196079, 1, 0, 1,
-0.9337089, -0.5982444, -1.864327, 0.8117647, 1, 0, 1,
-0.9278508, 0.235729, -1.516474, 0.8078431, 1, 0, 1,
-0.924345, -0.619419, -0.1184746, 0.8, 1, 0, 1,
-0.9230321, 0.5860879, -0.7381359, 0.7921569, 1, 0, 1,
-0.9181168, 0.2661581, -0.8143949, 0.7882353, 1, 0, 1,
-0.9139435, -0.1831611, -3.408882, 0.7803922, 1, 0, 1,
-0.9116619, -0.02786769, -0.5178194, 0.7764706, 1, 0, 1,
-0.9109367, -0.3038476, -3.734234, 0.7686275, 1, 0, 1,
-0.8981758, 0.9136437, -2.045876, 0.7647059, 1, 0, 1,
-0.8925449, 0.124326, -0.09009365, 0.7568628, 1, 0, 1,
-0.8830836, 1.204853, -0.9140244, 0.7529412, 1, 0, 1,
-0.8791389, 0.3794421, -1.526187, 0.7450981, 1, 0, 1,
-0.8774722, 0.06607594, -2.753703, 0.7411765, 1, 0, 1,
-0.8773455, -1.072382, -1.374154, 0.7333333, 1, 0, 1,
-0.8752232, 0.7127224, 0.2452935, 0.7294118, 1, 0, 1,
-0.8729798, 0.4841768, -1.188812, 0.7215686, 1, 0, 1,
-0.8625139, -0.1388106, -2.501652, 0.7176471, 1, 0, 1,
-0.8620895, 0.17801, -1.542252, 0.7098039, 1, 0, 1,
-0.8509005, -0.7177542, -2.363317, 0.7058824, 1, 0, 1,
-0.8457955, -1.183994, -2.250178, 0.6980392, 1, 0, 1,
-0.8322952, 0.6923278, -1.689638, 0.6901961, 1, 0, 1,
-0.8147631, -0.6932397, -2.34954, 0.6862745, 1, 0, 1,
-0.8127738, -0.5700529, -1.772, 0.6784314, 1, 0, 1,
-0.8078448, 1.245918, 1.223002, 0.6745098, 1, 0, 1,
-0.8056549, -1.835902, -3.196549, 0.6666667, 1, 0, 1,
-0.8016916, -0.7971073, -4.321195, 0.6627451, 1, 0, 1,
-0.8002205, -0.406147, -3.540355, 0.654902, 1, 0, 1,
-0.799367, 0.1333017, -2.547199, 0.6509804, 1, 0, 1,
-0.7982002, 0.5466892, 0.59951, 0.6431373, 1, 0, 1,
-0.7979163, 0.9208009, 1.043741, 0.6392157, 1, 0, 1,
-0.7937945, -0.322963, -2.527076, 0.6313726, 1, 0, 1,
-0.7799677, 1.032613, -0.1107365, 0.627451, 1, 0, 1,
-0.7750694, 1.176512, -0.9661594, 0.6196079, 1, 0, 1,
-0.7743149, 0.0842416, -1.485586, 0.6156863, 1, 0, 1,
-0.7723376, -1.956786, -3.109418, 0.6078432, 1, 0, 1,
-0.7703215, 0.5578286, -1.621892, 0.6039216, 1, 0, 1,
-0.7667429, -0.3276694, -1.614501, 0.5960785, 1, 0, 1,
-0.7623707, -0.8065646, -2.781386, 0.5882353, 1, 0, 1,
-0.7604387, 1.848141, 0.4390481, 0.5843138, 1, 0, 1,
-0.7590385, 0.7566147, -1.014464, 0.5764706, 1, 0, 1,
-0.7587189, -0.5368308, -2.827111, 0.572549, 1, 0, 1,
-0.74964, 0.8135483, -0.6510244, 0.5647059, 1, 0, 1,
-0.7489877, 0.3038476, -1.111963, 0.5607843, 1, 0, 1,
-0.7460225, -1.977033, -3.442959, 0.5529412, 1, 0, 1,
-0.744019, 1.286199, -1.316608, 0.5490196, 1, 0, 1,
-0.7432553, 0.3707883, -0.4876739, 0.5411765, 1, 0, 1,
-0.7322322, -0.0924376, -2.341377, 0.5372549, 1, 0, 1,
-0.730591, 0.664178, -0.03675552, 0.5294118, 1, 0, 1,
-0.7276217, 0.2651785, -0.2591909, 0.5254902, 1, 0, 1,
-0.7240585, 0.8240659, -2.149338, 0.5176471, 1, 0, 1,
-0.7234349, 0.6023217, -0.2165002, 0.5137255, 1, 0, 1,
-0.719601, 0.7117947, -2.894061, 0.5058824, 1, 0, 1,
-0.7180727, -1.239074, -3.36268, 0.5019608, 1, 0, 1,
-0.7170919, -1.469507, -0.9390626, 0.4941176, 1, 0, 1,
-0.7165813, -0.1674725, -3.041901, 0.4862745, 1, 0, 1,
-0.7158594, 0.8986339, -0.3938545, 0.4823529, 1, 0, 1,
-0.7137264, 2.109411, -1.297375, 0.4745098, 1, 0, 1,
-0.7064629, -1.331146, -0.7980703, 0.4705882, 1, 0, 1,
-0.7058353, -0.2305078, -1.631398, 0.4627451, 1, 0, 1,
-0.7017571, -0.7543351, -2.280867, 0.4588235, 1, 0, 1,
-0.6968317, 0.8207055, 0.4201362, 0.4509804, 1, 0, 1,
-0.6959662, 1.638315, -1.096326, 0.4470588, 1, 0, 1,
-0.6893322, 0.6996096, -0.2278159, 0.4392157, 1, 0, 1,
-0.6892083, 1.02876, 0.1633648, 0.4352941, 1, 0, 1,
-0.6862341, -1.603904, -4.828232, 0.427451, 1, 0, 1,
-0.6835171, -0.2070471, -0.9133135, 0.4235294, 1, 0, 1,
-0.6835093, 1.463774, -0.7740156, 0.4156863, 1, 0, 1,
-0.681496, -0.08253448, -2.372644, 0.4117647, 1, 0, 1,
-0.6805779, -0.2710187, -1.999523, 0.4039216, 1, 0, 1,
-0.6671318, -0.5549775, -1.706842, 0.3960784, 1, 0, 1,
-0.6624082, -0.8529133, -2.206854, 0.3921569, 1, 0, 1,
-0.6611274, 1.017199, -1.033608, 0.3843137, 1, 0, 1,
-0.6606468, -0.05719736, -0.8060847, 0.3803922, 1, 0, 1,
-0.6599748, 1.765433, 1.331709, 0.372549, 1, 0, 1,
-0.6581623, -0.08340976, -0.4859128, 0.3686275, 1, 0, 1,
-0.6565697, 0.1698419, -1.185709, 0.3607843, 1, 0, 1,
-0.6556383, -0.5384299, -2.840698, 0.3568628, 1, 0, 1,
-0.6551653, -1.338926, -3.515362, 0.3490196, 1, 0, 1,
-0.6520892, 0.8720772, 0.1406462, 0.345098, 1, 0, 1,
-0.6491646, 2.502961, -1.653185, 0.3372549, 1, 0, 1,
-0.6451971, 0.6274518, -0.280087, 0.3333333, 1, 0, 1,
-0.6451467, -1.307636, -1.785545, 0.3254902, 1, 0, 1,
-0.6426295, 0.5092157, 0.7125082, 0.3215686, 1, 0, 1,
-0.6395938, 1.128955, -0.764781, 0.3137255, 1, 0, 1,
-0.6394135, 0.3639736, -1.192259, 0.3098039, 1, 0, 1,
-0.6345835, -0.7260547, -3.025961, 0.3019608, 1, 0, 1,
-0.6322558, 0.6127893, -1.582921, 0.2941177, 1, 0, 1,
-0.6296525, 0.4516599, -0.9824545, 0.2901961, 1, 0, 1,
-0.623334, 2.188236, -0.6331152, 0.282353, 1, 0, 1,
-0.6227164, -2.074474, -3.665417, 0.2784314, 1, 0, 1,
-0.6221624, -0.8612925, -3.433988, 0.2705882, 1, 0, 1,
-0.6199902, 0.1055697, -0.7496865, 0.2666667, 1, 0, 1,
-0.6186324, -0.3528056, -1.579826, 0.2588235, 1, 0, 1,
-0.61045, -1.601237, -2.50667, 0.254902, 1, 0, 1,
-0.6049491, 0.6475844, -1.631532, 0.2470588, 1, 0, 1,
-0.6034164, 0.9507138, -0.8455061, 0.2431373, 1, 0, 1,
-0.6019042, -0.1716423, -2.983776, 0.2352941, 1, 0, 1,
-0.6005639, -0.8611861, -3.517697, 0.2313726, 1, 0, 1,
-0.5976287, 1.272389, -0.8290899, 0.2235294, 1, 0, 1,
-0.5962309, -1.739932, -3.16911, 0.2196078, 1, 0, 1,
-0.5946391, -2.653051, -2.552051, 0.2117647, 1, 0, 1,
-0.589072, 0.1893079, -1.79921, 0.2078431, 1, 0, 1,
-0.5890414, -1.118825, -1.817884, 0.2, 1, 0, 1,
-0.5869196, -0.4314847, 0.1048455, 0.1921569, 1, 0, 1,
-0.5790586, -0.003395289, -0.8917093, 0.1882353, 1, 0, 1,
-0.5789886, 0.3727328, -1.171553, 0.1803922, 1, 0, 1,
-0.5712873, -0.3114173, -2.885828, 0.1764706, 1, 0, 1,
-0.5696059, -0.2552775, -1.719404, 0.1686275, 1, 0, 1,
-0.5685403, -0.8375012, -0.6083677, 0.1647059, 1, 0, 1,
-0.5639514, -2.819952, -3.430575, 0.1568628, 1, 0, 1,
-0.5605398, 0.2704027, -3.029743, 0.1529412, 1, 0, 1,
-0.5561965, 0.09613368, -2.250879, 0.145098, 1, 0, 1,
-0.5551958, -1.323816, -3.76939, 0.1411765, 1, 0, 1,
-0.5531005, -0.6392972, -3.720993, 0.1333333, 1, 0, 1,
-0.551832, 0.2316906, -1.328043, 0.1294118, 1, 0, 1,
-0.5505062, -1.536854, -2.299917, 0.1215686, 1, 0, 1,
-0.5467671, 0.2213021, -0.073526, 0.1176471, 1, 0, 1,
-0.5442517, 0.2355124, -2.714516, 0.1098039, 1, 0, 1,
-0.5436762, 0.3835613, -2.604662, 0.1058824, 1, 0, 1,
-0.5435185, 1.175426, -0.441142, 0.09803922, 1, 0, 1,
-0.5424768, 0.5845937, -1.344349, 0.09019608, 1, 0, 1,
-0.5418692, 0.316891, -1.009584, 0.08627451, 1, 0, 1,
-0.5408028, -1.884129, -4.244665, 0.07843138, 1, 0, 1,
-0.5399593, 2.5076, 0.370654, 0.07450981, 1, 0, 1,
-0.5396759, -1.118253, -2.461094, 0.06666667, 1, 0, 1,
-0.5390766, 0.07700063, -0.4088168, 0.0627451, 1, 0, 1,
-0.5361046, 1.250583, -0.5931472, 0.05490196, 1, 0, 1,
-0.5351277, 0.9775069, -1.793283, 0.05098039, 1, 0, 1,
-0.534278, 0.07618883, 0.2453098, 0.04313726, 1, 0, 1,
-0.5320352, -1.097829, -1.031897, 0.03921569, 1, 0, 1,
-0.5303405, -0.588272, -1.910655, 0.03137255, 1, 0, 1,
-0.5289063, 0.2655231, -0.885368, 0.02745098, 1, 0, 1,
-0.5285085, -0.2827156, -2.025054, 0.01960784, 1, 0, 1,
-0.5268481, 0.6460464, 0.52305, 0.01568628, 1, 0, 1,
-0.5263361, 0.2711094, -0.03247742, 0.007843138, 1, 0, 1,
-0.5182862, 1.288522, -1.216643, 0.003921569, 1, 0, 1,
-0.5179883, -1.233046, -2.800977, 0, 1, 0.003921569, 1,
-0.5119268, 0.7541631, -0.3488729, 0, 1, 0.01176471, 1,
-0.50651, -0.3418433, -3.371314, 0, 1, 0.01568628, 1,
-0.5033621, 2.050761, 0.5874449, 0, 1, 0.02352941, 1,
-0.4999453, -0.4112973, -2.321927, 0, 1, 0.02745098, 1,
-0.4983338, 0.4748173, -0.9539462, 0, 1, 0.03529412, 1,
-0.4959562, 2.805705, -0.538044, 0, 1, 0.03921569, 1,
-0.4925508, 0.1910718, -2.828152, 0, 1, 0.04705882, 1,
-0.4887004, -1.651229, -2.753858, 0, 1, 0.05098039, 1,
-0.4867324, 1.901741, -0.3039064, 0, 1, 0.05882353, 1,
-0.4861849, -0.7965141, -1.633708, 0, 1, 0.0627451, 1,
-0.4838538, 0.4366619, -2.927965, 0, 1, 0.07058824, 1,
-0.4819684, 0.7353597, 0.02834677, 0, 1, 0.07450981, 1,
-0.4805543, 1.173725, -2.756137, 0, 1, 0.08235294, 1,
-0.4787592, -1.733244, -3.637541, 0, 1, 0.08627451, 1,
-0.4745119, -1.47029, -2.568717, 0, 1, 0.09411765, 1,
-0.4729967, -1.828287, -0.9306082, 0, 1, 0.1019608, 1,
-0.4717298, -0.6687033, -1.286484, 0, 1, 0.1058824, 1,
-0.469368, 0.6241925, -3.41617, 0, 1, 0.1137255, 1,
-0.465926, 0.4233544, 1.540783, 0, 1, 0.1176471, 1,
-0.4652493, 1.037913, -0.8307191, 0, 1, 0.1254902, 1,
-0.4534611, -0.09816848, -2.026875, 0, 1, 0.1294118, 1,
-0.4499491, 2.498629, -0.5601545, 0, 1, 0.1372549, 1,
-0.4484985, -0.5002906, -2.214272, 0, 1, 0.1411765, 1,
-0.4471181, -1.268472, -3.423388, 0, 1, 0.1490196, 1,
-0.4427986, -0.7209108, -2.604997, 0, 1, 0.1529412, 1,
-0.4412028, 0.1483742, -1.765091, 0, 1, 0.1607843, 1,
-0.4408462, 2.017032, -0.9577376, 0, 1, 0.1647059, 1,
-0.4397712, -0.7712362, -2.401509, 0, 1, 0.172549, 1,
-0.4306313, -0.2181401, -3.111907, 0, 1, 0.1764706, 1,
-0.4283288, -0.4151974, -2.290752, 0, 1, 0.1843137, 1,
-0.4269691, 0.3904911, -1.628564, 0, 1, 0.1882353, 1,
-0.4250658, -0.3769014, -1.472634, 0, 1, 0.1960784, 1,
-0.4234205, 0.05771637, -1.576404, 0, 1, 0.2039216, 1,
-0.4219898, 1.246867, -1.557072, 0, 1, 0.2078431, 1,
-0.4172699, -0.1325142, -2.439652, 0, 1, 0.2156863, 1,
-0.4132294, 1.960581, 1.302389, 0, 1, 0.2196078, 1,
-0.4130122, 0.3506073, -2.250662, 0, 1, 0.227451, 1,
-0.4092253, 0.1091805, -1.181052, 0, 1, 0.2313726, 1,
-0.4067382, 0.6031888, -0.9205948, 0, 1, 0.2392157, 1,
-0.4011138, -0.2551382, -2.540573, 0, 1, 0.2431373, 1,
-0.3958974, -0.6631308, -2.907591, 0, 1, 0.2509804, 1,
-0.3943191, -0.5821235, -2.29322, 0, 1, 0.254902, 1,
-0.3921584, -1.389553, -2.433494, 0, 1, 0.2627451, 1,
-0.3921027, 1.09606, -0.2749906, 0, 1, 0.2666667, 1,
-0.3879684, -0.2631931, -2.465902, 0, 1, 0.2745098, 1,
-0.3821449, 0.8221002, 0.1882374, 0, 1, 0.2784314, 1,
-0.3775784, -0.5139135, -2.10465, 0, 1, 0.2862745, 1,
-0.3749835, 0.6463354, -1.042693, 0, 1, 0.2901961, 1,
-0.3698093, 0.1104382, -1.4564, 0, 1, 0.2980392, 1,
-0.3675689, -0.651796, -2.83466, 0, 1, 0.3058824, 1,
-0.3672157, 1.257055, 0.1451592, 0, 1, 0.3098039, 1,
-0.367067, 1.088299, -0.03539603, 0, 1, 0.3176471, 1,
-0.3660069, -0.275739, -3.001282, 0, 1, 0.3215686, 1,
-0.3649926, -0.5350196, -2.938998, 0, 1, 0.3294118, 1,
-0.3621064, -0.9886255, -2.096145, 0, 1, 0.3333333, 1,
-0.360837, -1.001249, -4.329937, 0, 1, 0.3411765, 1,
-0.3584387, -0.7706121, -3.384101, 0, 1, 0.345098, 1,
-0.35757, -0.1724235, -3.490783, 0, 1, 0.3529412, 1,
-0.3534614, -1.056049, -0.5772254, 0, 1, 0.3568628, 1,
-0.3513159, -0.6376828, -3.671543, 0, 1, 0.3647059, 1,
-0.3444809, -0.1585934, -3.279923, 0, 1, 0.3686275, 1,
-0.3438374, 0.9832531, -1.752614, 0, 1, 0.3764706, 1,
-0.3359501, 0.7450453, -1.893477, 0, 1, 0.3803922, 1,
-0.3316811, 0.6157027, -2.230362, 0, 1, 0.3882353, 1,
-0.3296304, 0.1656774, -0.6484213, 0, 1, 0.3921569, 1,
-0.3240966, -0.8070778, -4.576587, 0, 1, 0.4, 1,
-0.3194115, 0.4402497, -1.571636, 0, 1, 0.4078431, 1,
-0.3167653, -0.8014155, -2.847796, 0, 1, 0.4117647, 1,
-0.3148216, -0.7879544, -2.580552, 0, 1, 0.4196078, 1,
-0.3138013, 0.7148833, -1.333518, 0, 1, 0.4235294, 1,
-0.3102103, 0.7049914, -1.082693, 0, 1, 0.4313726, 1,
-0.3097789, -0.4252211, -2.703735, 0, 1, 0.4352941, 1,
-0.3085686, -1.365783, -2.459103, 0, 1, 0.4431373, 1,
-0.3075406, -1.268854, -2.069224, 0, 1, 0.4470588, 1,
-0.3048751, -1.014337, -3.032963, 0, 1, 0.454902, 1,
-0.3048204, 1.091214, 1.094761, 0, 1, 0.4588235, 1,
-0.3040119, 0.1113464, -1.230736, 0, 1, 0.4666667, 1,
-0.3024568, 1.40891, -2.338029, 0, 1, 0.4705882, 1,
-0.2992803, 0.629849, -0.2078193, 0, 1, 0.4784314, 1,
-0.2972542, -0.9546543, -2.104833, 0, 1, 0.4823529, 1,
-0.2957805, 1.342556, 0.2232206, 0, 1, 0.4901961, 1,
-0.2929248, -1.889874, -2.082743, 0, 1, 0.4941176, 1,
-0.2899514, 1.172383, -0.1004029, 0, 1, 0.5019608, 1,
-0.2866028, -0.1361093, -1.102039, 0, 1, 0.509804, 1,
-0.2833627, -0.3240533, -0.8567478, 0, 1, 0.5137255, 1,
-0.2827828, -0.7684312, -3.018336, 0, 1, 0.5215687, 1,
-0.2818407, 1.058041, -1.277948, 0, 1, 0.5254902, 1,
-0.2732769, 1.584996, -1.270431, 0, 1, 0.5333334, 1,
-0.270094, -0.9472923, -2.00399, 0, 1, 0.5372549, 1,
-0.2667839, -0.01264404, -1.223786, 0, 1, 0.5450981, 1,
-0.2655966, -0.05733447, -2.055581, 0, 1, 0.5490196, 1,
-0.26522, 0.3678023, -1.658298, 0, 1, 0.5568628, 1,
-0.2646932, -0.4682535, -0.8140889, 0, 1, 0.5607843, 1,
-0.2629049, -0.8764378, -3.180933, 0, 1, 0.5686275, 1,
-0.2618839, -0.5425035, -3.009184, 0, 1, 0.572549, 1,
-0.261185, -0.488305, -3.202409, 0, 1, 0.5803922, 1,
-0.2600015, 1.167351, -1.50249, 0, 1, 0.5843138, 1,
-0.258426, -0.2216937, -2.655069, 0, 1, 0.5921569, 1,
-0.2558644, 0.7590352, -0.552281, 0, 1, 0.5960785, 1,
-0.2550942, -0.0111328, -1.594237, 0, 1, 0.6039216, 1,
-0.2531429, 0.1029431, -3.219687, 0, 1, 0.6117647, 1,
-0.2500844, -0.3749286, -2.026501, 0, 1, 0.6156863, 1,
-0.2499504, -1.14425, -3.70854, 0, 1, 0.6235294, 1,
-0.2471284, -0.05767195, -1.379193, 0, 1, 0.627451, 1,
-0.2454281, 0.1515108, -0.7058016, 0, 1, 0.6352941, 1,
-0.2427507, -1.35552, -1.99662, 0, 1, 0.6392157, 1,
-0.2427506, 0.07414155, -1.17983, 0, 1, 0.6470588, 1,
-0.2393598, -0.384092, -1.040326, 0, 1, 0.6509804, 1,
-0.2385149, 0.4206485, -0.3273234, 0, 1, 0.6588235, 1,
-0.2382571, 1.400707, -0.6221559, 0, 1, 0.6627451, 1,
-0.236296, -1.062841, -2.396162, 0, 1, 0.6705883, 1,
-0.236211, -0.3692457, -2.885539, 0, 1, 0.6745098, 1,
-0.2334694, 0.05518129, -0.5208169, 0, 1, 0.682353, 1,
-0.2329326, -1.002697, -1.846706, 0, 1, 0.6862745, 1,
-0.2310541, -0.2833351, -2.663776, 0, 1, 0.6941177, 1,
-0.2257919, 1.518983, -0.02696582, 0, 1, 0.7019608, 1,
-0.2140649, -0.9264506, -4.273194, 0, 1, 0.7058824, 1,
-0.2122681, -0.1577511, -3.306861, 0, 1, 0.7137255, 1,
-0.2019191, -1.856637, -1.50838, 0, 1, 0.7176471, 1,
-0.1983723, -0.4378751, -2.406611, 0, 1, 0.7254902, 1,
-0.1977477, -0.1043706, -2.064059, 0, 1, 0.7294118, 1,
-0.1972689, -0.5428959, -4.337657, 0, 1, 0.7372549, 1,
-0.1937467, 0.2509452, -0.05855584, 0, 1, 0.7411765, 1,
-0.1908839, -0.2373042, -1.912928, 0, 1, 0.7490196, 1,
-0.176807, 0.3234311, 1.190711, 0, 1, 0.7529412, 1,
-0.1716368, -0.9011084, -4.029797, 0, 1, 0.7607843, 1,
-0.170703, -1.563168, -3.889727, 0, 1, 0.7647059, 1,
-0.1645881, 0.5928194, -0.7145236, 0, 1, 0.772549, 1,
-0.162413, -1.53968, -3.548723, 0, 1, 0.7764706, 1,
-0.1543947, -1.385259, -3.074606, 0, 1, 0.7843137, 1,
-0.1477569, -0.8687745, -4.03926, 0, 1, 0.7882353, 1,
-0.1370151, 0.6243978, -0.2923812, 0, 1, 0.7960784, 1,
-0.1288519, 0.3864059, -0.2989109, 0, 1, 0.8039216, 1,
-0.1250513, 0.9038737, 0.193722, 0, 1, 0.8078431, 1,
-0.11464, 1.250274, -1.726878, 0, 1, 0.8156863, 1,
-0.1143127, -2.221526, -0.9464453, 0, 1, 0.8196079, 1,
-0.1127552, -0.2991734, -4.833459, 0, 1, 0.827451, 1,
-0.1110317, -0.07366613, -1.875702, 0, 1, 0.8313726, 1,
-0.10907, -1.130389, -4.035456, 0, 1, 0.8392157, 1,
-0.1059044, 0.4118907, 0.04544849, 0, 1, 0.8431373, 1,
-0.104238, 1.721546, -2.052752, 0, 1, 0.8509804, 1,
-0.1015383, -0.02959162, -1.906763, 0, 1, 0.854902, 1,
-0.1014906, -0.3430441, -2.554827, 0, 1, 0.8627451, 1,
-0.09862494, -0.3877946, -1.754614, 0, 1, 0.8666667, 1,
-0.09796129, 0.06787858, -0.9195585, 0, 1, 0.8745098, 1,
-0.09713931, 0.9375214, -0.06860904, 0, 1, 0.8784314, 1,
-0.09711736, -0.1172143, -2.293185, 0, 1, 0.8862745, 1,
-0.09204905, 0.1281717, -0.5649826, 0, 1, 0.8901961, 1,
-0.0896677, -0.4388402, -3.765649, 0, 1, 0.8980392, 1,
-0.08735276, 1.411303, -1.04403, 0, 1, 0.9058824, 1,
-0.08376185, 1.201929, -0.7972232, 0, 1, 0.9098039, 1,
-0.08176009, -1.833264, -3.62574, 0, 1, 0.9176471, 1,
-0.0813136, -1.937855, -0.8760604, 0, 1, 0.9215686, 1,
-0.07786693, 2.165357, 0.2231576, 0, 1, 0.9294118, 1,
-0.0749414, -1.65752, -2.296798, 0, 1, 0.9333333, 1,
-0.07425766, -0.126829, -3.659899, 0, 1, 0.9411765, 1,
-0.0740184, -1.269089, -4.367251, 0, 1, 0.945098, 1,
-0.06449263, 0.2123631, 0.7603111, 0, 1, 0.9529412, 1,
-0.06367139, 0.123134, -1.178317, 0, 1, 0.9568627, 1,
-0.05602669, 0.1060911, -2.026267, 0, 1, 0.9647059, 1,
-0.05543645, -0.1550516, -3.33099, 0, 1, 0.9686275, 1,
-0.05465936, -0.1085877, -4.218446, 0, 1, 0.9764706, 1,
-0.04855771, 1.698505, -0.2747793, 0, 1, 0.9803922, 1,
-0.04096078, 1.561761, -1.594252, 0, 1, 0.9882353, 1,
-0.03726717, 0.3558588, 0.3591142, 0, 1, 0.9921569, 1,
-0.03672311, 1.234662, 0.121903, 0, 1, 1, 1,
-0.02894241, -1.696867, -3.561858, 0, 0.9921569, 1, 1,
-0.02769392, 1.076958, 0.2133435, 0, 0.9882353, 1, 1,
-0.02727956, 0.04182859, 0.2320646, 0, 0.9803922, 1, 1,
-0.02107158, -0.1410418, -1.662141, 0, 0.9764706, 1, 1,
-0.02040284, 0.5726326, 0.1304625, 0, 0.9686275, 1, 1,
-0.0179204, -0.8791824, -4.513145, 0, 0.9647059, 1, 1,
-0.0175144, 0.2792597, 0.7274722, 0, 0.9568627, 1, 1,
-0.01685865, 0.1032069, 0.6812089, 0, 0.9529412, 1, 1,
-0.01421434, -1.144997, -3.322942, 0, 0.945098, 1, 1,
-0.01311721, -1.441631, -2.401609, 0, 0.9411765, 1, 1,
-0.008458536, -0.3692153, -2.708998, 0, 0.9333333, 1, 1,
-0.004334682, 1.006455, 1.089938, 0, 0.9294118, 1, 1,
-0.003654883, 0.5346844, -0.9695808, 0, 0.9215686, 1, 1,
0.0006271211, -0.3668207, 2.923083, 0, 0.9176471, 1, 1,
0.0008082098, 0.04086798, 0.1390618, 0, 0.9098039, 1, 1,
0.001043989, -0.5051036, 3.372244, 0, 0.9058824, 1, 1,
0.008530286, -0.5515916, 3.494412, 0, 0.8980392, 1, 1,
0.01047875, -0.5653232, 2.43138, 0, 0.8901961, 1, 1,
0.01120142, -0.2684712, 2.464324, 0, 0.8862745, 1, 1,
0.01248438, 0.1966819, 0.6499527, 0, 0.8784314, 1, 1,
0.01589182, -0.07139747, 3.819614, 0, 0.8745098, 1, 1,
0.02090852, -1.420825, 4.472187, 0, 0.8666667, 1, 1,
0.02198638, -0.01627762, 1.762321, 0, 0.8627451, 1, 1,
0.02446024, 0.1212618, -0.8340837, 0, 0.854902, 1, 1,
0.02715152, -2.092627, 4.432565, 0, 0.8509804, 1, 1,
0.02795387, 1.291083, 0.5334079, 0, 0.8431373, 1, 1,
0.03259531, 1.024849, 0.8908178, 0, 0.8392157, 1, 1,
0.0363013, -0.1973346, 1.049928, 0, 0.8313726, 1, 1,
0.03781787, 1.10595, 0.3135978, 0, 0.827451, 1, 1,
0.0406695, 0.769854, 2.791308, 0, 0.8196079, 1, 1,
0.04139117, -0.2314499, 2.181924, 0, 0.8156863, 1, 1,
0.04178002, -0.9905812, 2.713396, 0, 0.8078431, 1, 1,
0.04277288, 1.518796, -0.3586188, 0, 0.8039216, 1, 1,
0.0446096, 0.390225, -2.200492, 0, 0.7960784, 1, 1,
0.04539421, 0.514475, -0.5705104, 0, 0.7882353, 1, 1,
0.04834301, -0.3230065, 3.602163, 0, 0.7843137, 1, 1,
0.04936533, 2.753764, 0.2366539, 0, 0.7764706, 1, 1,
0.04939694, -0.3631199, 3.105628, 0, 0.772549, 1, 1,
0.0588312, -0.8777286, 1.423378, 0, 0.7647059, 1, 1,
0.05894258, 0.2090613, 1.200513, 0, 0.7607843, 1, 1,
0.06346034, 0.482246, 0.944243, 0, 0.7529412, 1, 1,
0.06447589, -1.624964, 2.032766, 0, 0.7490196, 1, 1,
0.06983269, 0.03508007, 1.360129, 0, 0.7411765, 1, 1,
0.07012046, -0.2214966, 1.614187, 0, 0.7372549, 1, 1,
0.0705124, -0.818134, 2.853031, 0, 0.7294118, 1, 1,
0.07163395, -0.34159, 3.231955, 0, 0.7254902, 1, 1,
0.07461688, -0.6515921, 3.907175, 0, 0.7176471, 1, 1,
0.07797498, -0.2987488, 2.158075, 0, 0.7137255, 1, 1,
0.07841636, 0.3432734, -0.4590586, 0, 0.7058824, 1, 1,
0.08308906, 2.130094, -0.2839919, 0, 0.6980392, 1, 1,
0.08362585, 1.365063, -0.9385228, 0, 0.6941177, 1, 1,
0.08456182, 1.087951, 0.1816596, 0, 0.6862745, 1, 1,
0.09361164, -0.5487298, 1.883747, 0, 0.682353, 1, 1,
0.09521379, 0.1594878, 1.15504, 0, 0.6745098, 1, 1,
0.1049833, 0.5843099, 0.2944789, 0, 0.6705883, 1, 1,
0.1095554, 1.312441, -1.652512, 0, 0.6627451, 1, 1,
0.1109702, 0.7333317, 1.30273, 0, 0.6588235, 1, 1,
0.1127531, -1.346946, 1.568937, 0, 0.6509804, 1, 1,
0.1141148, 0.9233546, 0.801351, 0, 0.6470588, 1, 1,
0.1161619, 0.2794715, 0.5259153, 0, 0.6392157, 1, 1,
0.1183852, -0.9517513, 1.565761, 0, 0.6352941, 1, 1,
0.1210868, -0.07852493, 2.126868, 0, 0.627451, 1, 1,
0.1220308, 0.5107173, 0.06532486, 0, 0.6235294, 1, 1,
0.1252669, -0.5483697, 2.376068, 0, 0.6156863, 1, 1,
0.1257381, -0.5718114, 1.83877, 0, 0.6117647, 1, 1,
0.1297706, 1.346522, 0.9328759, 0, 0.6039216, 1, 1,
0.1300344, -1.424267, 3.796698, 0, 0.5960785, 1, 1,
0.1324271, 0.3133596, 0.6472735, 0, 0.5921569, 1, 1,
0.1378326, -0.1570028, 3.131408, 0, 0.5843138, 1, 1,
0.1381589, 2.801033, 1.776489, 0, 0.5803922, 1, 1,
0.1403832, -0.9815696, 3.782682, 0, 0.572549, 1, 1,
0.140879, -2.78322, 5.041636, 0, 0.5686275, 1, 1,
0.1416826, -0.07920261, 0.657828, 0, 0.5607843, 1, 1,
0.1427314, -1.387075, 5.793581, 0, 0.5568628, 1, 1,
0.1428963, -0.6523154, 0.9174293, 0, 0.5490196, 1, 1,
0.1429969, -0.6205739, 3.777718, 0, 0.5450981, 1, 1,
0.1431863, -0.3568944, 2.02781, 0, 0.5372549, 1, 1,
0.1472046, 1.118515, -0.5186335, 0, 0.5333334, 1, 1,
0.1485336, 2.169214, -0.8955653, 0, 0.5254902, 1, 1,
0.148574, 2.73085, 1.535584, 0, 0.5215687, 1, 1,
0.1496616, -0.3733737, 1.957472, 0, 0.5137255, 1, 1,
0.1516901, -0.1076693, 1.421469, 0, 0.509804, 1, 1,
0.152393, 0.3649937, 1.785392, 0, 0.5019608, 1, 1,
0.1620177, 0.1918723, 0.08059203, 0, 0.4941176, 1, 1,
0.1651793, 0.7369587, -0.2495365, 0, 0.4901961, 1, 1,
0.1669347, 1.387681, -0.5143033, 0, 0.4823529, 1, 1,
0.179846, 0.4654557, -0.5964122, 0, 0.4784314, 1, 1,
0.1833636, 1.834648, -1.905754, 0, 0.4705882, 1, 1,
0.1848104, -1.023893, 3.217276, 0, 0.4666667, 1, 1,
0.1951142, 2.359177, 1.886367, 0, 0.4588235, 1, 1,
0.1981101, -0.9507779, 2.484032, 0, 0.454902, 1, 1,
0.2029457, -0.1188631, 1.882539, 0, 0.4470588, 1, 1,
0.2039737, -0.9535506, 2.56302, 0, 0.4431373, 1, 1,
0.2053055, 1.803606, 0.4784744, 0, 0.4352941, 1, 1,
0.2054146, -0.443835, 1.962156, 0, 0.4313726, 1, 1,
0.2055908, -0.2487283, 2.278003, 0, 0.4235294, 1, 1,
0.2056178, -1.081035, 2.500763, 0, 0.4196078, 1, 1,
0.2060219, -0.323366, 3.546546, 0, 0.4117647, 1, 1,
0.2177576, -0.603631, 3.315906, 0, 0.4078431, 1, 1,
0.2202105, -0.5227582, 2.028114, 0, 0.4, 1, 1,
0.2243774, -0.1927767, 4.224925, 0, 0.3921569, 1, 1,
0.2253612, -1.378043, 3.535522, 0, 0.3882353, 1, 1,
0.2280825, 0.1109174, 2.344654, 0, 0.3803922, 1, 1,
0.2331488, -1.904178, 3.131081, 0, 0.3764706, 1, 1,
0.2332211, -0.1763177, 2.265298, 0, 0.3686275, 1, 1,
0.2347062, -0.1854413, 2.257345, 0, 0.3647059, 1, 1,
0.2364983, 1.412891, 1.253859, 0, 0.3568628, 1, 1,
0.2395752, 1.909182, 0.02613227, 0, 0.3529412, 1, 1,
0.241373, -0.6938689, 1.690754, 0, 0.345098, 1, 1,
0.2421044, -1.515541, 1.789739, 0, 0.3411765, 1, 1,
0.2443323, -0.1736263, 2.775228, 0, 0.3333333, 1, 1,
0.2476215, 1.439972, -1.228051, 0, 0.3294118, 1, 1,
0.2532892, 1.813234, 0.3732075, 0, 0.3215686, 1, 1,
0.253365, -0.5462543, 1.206477, 0, 0.3176471, 1, 1,
0.2572377, 0.1394812, 2.558356, 0, 0.3098039, 1, 1,
0.2611535, -0.3496074, 1.476772, 0, 0.3058824, 1, 1,
0.2637277, 1.309578, 0.5138345, 0, 0.2980392, 1, 1,
0.2638397, 1.338786, -2.200627, 0, 0.2901961, 1, 1,
0.2657164, -0.1972247, 1.54305, 0, 0.2862745, 1, 1,
0.2672631, 0.5342115, -0.3105779, 0, 0.2784314, 1, 1,
0.2681679, 0.6389204, 1.215344, 0, 0.2745098, 1, 1,
0.2747853, 0.4720911, 1.741726, 0, 0.2666667, 1, 1,
0.2817508, 2.297154, -0.2552134, 0, 0.2627451, 1, 1,
0.2875659, 0.8227822, -0.8010194, 0, 0.254902, 1, 1,
0.2947909, -0.4838475, 4.457504, 0, 0.2509804, 1, 1,
0.2980365, 0.2199612, 2.345143, 0, 0.2431373, 1, 1,
0.3003898, 0.2049235, -1.340102, 0, 0.2392157, 1, 1,
0.3031092, -0.2827013, 2.591094, 0, 0.2313726, 1, 1,
0.3078028, 1.547263, -0.7305902, 0, 0.227451, 1, 1,
0.309301, -0.8079576, 1.087917, 0, 0.2196078, 1, 1,
0.3131277, -0.5091975, 2.729934, 0, 0.2156863, 1, 1,
0.3156324, -0.24628, 2.22285, 0, 0.2078431, 1, 1,
0.3217053, -0.4165607, 3.004027, 0, 0.2039216, 1, 1,
0.3247009, 1.038763, 1.028245, 0, 0.1960784, 1, 1,
0.332306, -0.3634436, 1.885614, 0, 0.1882353, 1, 1,
0.3333428, 0.2140653, 2.302391, 0, 0.1843137, 1, 1,
0.3349442, 1.843099, -1.158774, 0, 0.1764706, 1, 1,
0.335346, -0.8596945, 1.507986, 0, 0.172549, 1, 1,
0.3358568, -0.09934315, 1.518249, 0, 0.1647059, 1, 1,
0.3409635, -0.9902827, 0.1439101, 0, 0.1607843, 1, 1,
0.3430003, -0.7755893, 3.49341, 0, 0.1529412, 1, 1,
0.3440815, -0.6578822, 3.574076, 0, 0.1490196, 1, 1,
0.3513002, -0.1950301, 2.024373, 0, 0.1411765, 1, 1,
0.3518266, 0.1894558, 0.331269, 0, 0.1372549, 1, 1,
0.3563725, 0.4454259, 0.980533, 0, 0.1294118, 1, 1,
0.3573287, 0.4102905, -0.10623, 0, 0.1254902, 1, 1,
0.3590898, -0.3013938, 2.367301, 0, 0.1176471, 1, 1,
0.3609369, 1.960444, -0.6033452, 0, 0.1137255, 1, 1,
0.363278, -1.631235, 3.313886, 0, 0.1058824, 1, 1,
0.3675915, -0.1559045, 1.767394, 0, 0.09803922, 1, 1,
0.3679765, 0.05306863, 1.032215, 0, 0.09411765, 1, 1,
0.3719197, -0.2675804, 1.049119, 0, 0.08627451, 1, 1,
0.3723856, -1.727696, 1.451731, 0, 0.08235294, 1, 1,
0.3727053, -0.463835, 3.293731, 0, 0.07450981, 1, 1,
0.3779273, -0.8962489, 2.627864, 0, 0.07058824, 1, 1,
0.3823448, -1.292023, 2.13838, 0, 0.0627451, 1, 1,
0.3845942, 0.8909159, -0.1531594, 0, 0.05882353, 1, 1,
0.3857726, -1.503217, 3.902132, 0, 0.05098039, 1, 1,
0.3906709, -1.25644, 3.791449, 0, 0.04705882, 1, 1,
0.3945279, 0.46714, 3.474619, 0, 0.03921569, 1, 1,
0.3950042, 0.5396735, 0.9422235, 0, 0.03529412, 1, 1,
0.3971857, -0.5260205, 2.717141, 0, 0.02745098, 1, 1,
0.3973795, 1.139293, 1.078559, 0, 0.02352941, 1, 1,
0.4009623, -0.3140446, 3.626915, 0, 0.01568628, 1, 1,
0.4028016, 0.5043286, 0.9428532, 0, 0.01176471, 1, 1,
0.4039845, -0.7011026, 3.427294, 0, 0.003921569, 1, 1,
0.4085172, 1.469498, -0.9428124, 0.003921569, 0, 1, 1,
0.4113348, -0.03696348, 2.241006, 0.007843138, 0, 1, 1,
0.4119313, 0.5665211, -0.7196322, 0.01568628, 0, 1, 1,
0.4123375, -2.089736, 1.21031, 0.01960784, 0, 1, 1,
0.4132771, 0.07288468, 0.9105603, 0.02745098, 0, 1, 1,
0.4156406, 0.08524061, 1.273638, 0.03137255, 0, 1, 1,
0.4172001, 0.1010588, 0.6646465, 0.03921569, 0, 1, 1,
0.4205002, 0.4368236, 0.5148862, 0.04313726, 0, 1, 1,
0.4209782, -0.6991715, 1.876256, 0.05098039, 0, 1, 1,
0.4215294, -2.297593, 4.353926, 0.05490196, 0, 1, 1,
0.4254864, -0.4251302, 1.412427, 0.0627451, 0, 1, 1,
0.426458, -1.892143, 4.366413, 0.06666667, 0, 1, 1,
0.4264718, -0.6032794, 2.961461, 0.07450981, 0, 1, 1,
0.4282673, -0.01330438, 2.131192, 0.07843138, 0, 1, 1,
0.4286773, -0.5011941, 1.286271, 0.08627451, 0, 1, 1,
0.4321648, -1.691533, 2.602385, 0.09019608, 0, 1, 1,
0.4349112, -0.7195539, 2.140198, 0.09803922, 0, 1, 1,
0.440195, -0.3880994, 2.660941, 0.1058824, 0, 1, 1,
0.4403241, -1.746892, 3.448861, 0.1098039, 0, 1, 1,
0.442066, -1.055427, 4.567405, 0.1176471, 0, 1, 1,
0.4479752, 1.207981, -1.19054, 0.1215686, 0, 1, 1,
0.4495039, 0.9797475, 0.7460042, 0.1294118, 0, 1, 1,
0.4523217, -0.3056431, 2.814594, 0.1333333, 0, 1, 1,
0.4534167, 0.1249749, 2.484365, 0.1411765, 0, 1, 1,
0.4560555, -0.5565787, 2.751873, 0.145098, 0, 1, 1,
0.4586074, 0.3738463, 0.03988975, 0.1529412, 0, 1, 1,
0.4597679, -0.3199873, 1.673845, 0.1568628, 0, 1, 1,
0.461415, 0.5544746, 0.2306387, 0.1647059, 0, 1, 1,
0.4627744, -0.55071, 1.53982, 0.1686275, 0, 1, 1,
0.4634296, -2.289089, 3.651979, 0.1764706, 0, 1, 1,
0.4636148, 0.5741, 2.70748, 0.1803922, 0, 1, 1,
0.468321, -0.8607741, 2.441831, 0.1882353, 0, 1, 1,
0.4710867, -0.2260811, 0.2560069, 0.1921569, 0, 1, 1,
0.4737531, 0.6750473, -0.05274904, 0.2, 0, 1, 1,
0.479897, 0.1199551, 1.689378, 0.2078431, 0, 1, 1,
0.4807356, 1.328858, 0.1157695, 0.2117647, 0, 1, 1,
0.483366, 0.6576615, 1.718972, 0.2196078, 0, 1, 1,
0.4834814, -1.002713, 3.031229, 0.2235294, 0, 1, 1,
0.4837916, -0.4108857, 3.02862, 0.2313726, 0, 1, 1,
0.4872928, 0.5842065, 1.817573, 0.2352941, 0, 1, 1,
0.4899569, 2.38789, -0.1272808, 0.2431373, 0, 1, 1,
0.4900869, 0.7888612, -9.954499e-06, 0.2470588, 0, 1, 1,
0.4923189, 1.23229, 0.2508213, 0.254902, 0, 1, 1,
0.4938134, -0.8228177, 2.299616, 0.2588235, 0, 1, 1,
0.4972913, -1.17794, 1.714894, 0.2666667, 0, 1, 1,
0.4991848, -1.626616, 2.891395, 0.2705882, 0, 1, 1,
0.4994585, -1.317711, 1.501889, 0.2784314, 0, 1, 1,
0.5000424, -0.7871462, 2.020568, 0.282353, 0, 1, 1,
0.5016964, 1.964961, -0.5147231, 0.2901961, 0, 1, 1,
0.5028406, 0.5733138, 0.09998885, 0.2941177, 0, 1, 1,
0.507292, -1.392501, 2.114947, 0.3019608, 0, 1, 1,
0.5075285, -0.8719795, 2.777025, 0.3098039, 0, 1, 1,
0.5101601, 2.574491, 0.05642384, 0.3137255, 0, 1, 1,
0.5107961, -0.2773482, 1.642012, 0.3215686, 0, 1, 1,
0.5138059, -2.240227, 2.646028, 0.3254902, 0, 1, 1,
0.5160314, -0.83502, 3.037211, 0.3333333, 0, 1, 1,
0.5220826, -0.3915684, 1.333284, 0.3372549, 0, 1, 1,
0.5234857, -0.6357069, 3.514885, 0.345098, 0, 1, 1,
0.5293347, -0.6269184, 1.669539, 0.3490196, 0, 1, 1,
0.532356, -0.4528389, 2.230007, 0.3568628, 0, 1, 1,
0.5325424, 1.317913, 0.02756319, 0.3607843, 0, 1, 1,
0.532795, -0.04537974, 1.050403, 0.3686275, 0, 1, 1,
0.5347857, 0.6484503, -0.1329779, 0.372549, 0, 1, 1,
0.5375088, 0.2125676, 0.3349538, 0.3803922, 0, 1, 1,
0.5389412, 0.1262331, 1.725652, 0.3843137, 0, 1, 1,
0.5439479, 0.8253296, 0.6531247, 0.3921569, 0, 1, 1,
0.5466424, 1.355421, 0.04394877, 0.3960784, 0, 1, 1,
0.5488204, 1.538511, -0.3000839, 0.4039216, 0, 1, 1,
0.5492678, -1.150684, 1.090572, 0.4117647, 0, 1, 1,
0.5495766, 0.05353864, 1.706449, 0.4156863, 0, 1, 1,
0.549633, -2.139481, 1.974021, 0.4235294, 0, 1, 1,
0.5514303, -2.564468, 3.342532, 0.427451, 0, 1, 1,
0.5535267, 0.4314035, 2.25912, 0.4352941, 0, 1, 1,
0.5541086, -0.3221256, 2.429745, 0.4392157, 0, 1, 1,
0.5569481, 0.0896832, 0.4266417, 0.4470588, 0, 1, 1,
0.5578954, -0.4685511, 1.56098, 0.4509804, 0, 1, 1,
0.561119, 1.135142, -0.4063693, 0.4588235, 0, 1, 1,
0.564997, 0.07649477, 2.673321, 0.4627451, 0, 1, 1,
0.5659134, 0.1244172, 2.764491, 0.4705882, 0, 1, 1,
0.5761622, -1.270153, 4.090101, 0.4745098, 0, 1, 1,
0.5767861, -0.3748578, 2.059049, 0.4823529, 0, 1, 1,
0.5770431, -1.47112, 3.210648, 0.4862745, 0, 1, 1,
0.5827733, -0.5469401, 2.502619, 0.4941176, 0, 1, 1,
0.584376, 0.5236928, 1.543343, 0.5019608, 0, 1, 1,
0.5850702, -1.327721, 2.35182, 0.5058824, 0, 1, 1,
0.5851346, -1.035454, 1.553915, 0.5137255, 0, 1, 1,
0.5999413, -0.8152568, 3.933712, 0.5176471, 0, 1, 1,
0.6036213, -0.140287, 1.53398, 0.5254902, 0, 1, 1,
0.6037536, 1.623512, 1.678146, 0.5294118, 0, 1, 1,
0.6045394, -0.5650243, 2.546652, 0.5372549, 0, 1, 1,
0.6069378, 0.01372998, 2.576071, 0.5411765, 0, 1, 1,
0.6074895, -0.6536576, 0.05550246, 0.5490196, 0, 1, 1,
0.6080414, 1.106799, 0.5341487, 0.5529412, 0, 1, 1,
0.6121827, 0.4101259, -0.181272, 0.5607843, 0, 1, 1,
0.6250476, -0.4776962, 1.535579, 0.5647059, 0, 1, 1,
0.6260483, -0.4066664, 2.86015, 0.572549, 0, 1, 1,
0.6275644, -0.8570462, 2.396098, 0.5764706, 0, 1, 1,
0.633426, 1.000988, 0.01985606, 0.5843138, 0, 1, 1,
0.6363932, 1.088189, -0.874703, 0.5882353, 0, 1, 1,
0.6420193, 1.46346, -0.1395922, 0.5960785, 0, 1, 1,
0.6562078, -0.8505132, 2.809545, 0.6039216, 0, 1, 1,
0.6597009, -0.2294208, 2.968997, 0.6078432, 0, 1, 1,
0.6600424, -0.94486, 0.08795755, 0.6156863, 0, 1, 1,
0.6639232, -0.938238, 1.67413, 0.6196079, 0, 1, 1,
0.6648894, 0.2883278, -0.07028826, 0.627451, 0, 1, 1,
0.6685213, -0.6372002, 0.2042078, 0.6313726, 0, 1, 1,
0.6717174, -0.1372202, 1.385429, 0.6392157, 0, 1, 1,
0.6751466, -2.003343, 4.90541, 0.6431373, 0, 1, 1,
0.6752187, 0.5432173, 2.723115, 0.6509804, 0, 1, 1,
0.6765912, -1.371154, 2.702637, 0.654902, 0, 1, 1,
0.6820872, 0.4444945, -0.6016749, 0.6627451, 0, 1, 1,
0.6964449, 1.804033, 1.013366, 0.6666667, 0, 1, 1,
0.6974401, 0.1348598, 1.163164, 0.6745098, 0, 1, 1,
0.701131, 0.9562835, 1.165495, 0.6784314, 0, 1, 1,
0.7012416, 1.487854, 0.5456282, 0.6862745, 0, 1, 1,
0.7048621, -1.529982, 3.588121, 0.6901961, 0, 1, 1,
0.7072822, -0.5193445, 0.7698626, 0.6980392, 0, 1, 1,
0.7100549, -1.325958, 2.07623, 0.7058824, 0, 1, 1,
0.7106834, 1.278962, -0.1589691, 0.7098039, 0, 1, 1,
0.710977, 0.3391456, 1.361549, 0.7176471, 0, 1, 1,
0.7138668, 0.8128764, 0.9566195, 0.7215686, 0, 1, 1,
0.7150963, -0.9525272, 3.224994, 0.7294118, 0, 1, 1,
0.7186176, -0.8220717, 1.660647, 0.7333333, 0, 1, 1,
0.7190544, -0.650546, 1.173624, 0.7411765, 0, 1, 1,
0.7191015, -1.593679, 1.138182, 0.7450981, 0, 1, 1,
0.7196875, -1.040366, 2.070185, 0.7529412, 0, 1, 1,
0.722623, -0.1463753, 2.401741, 0.7568628, 0, 1, 1,
0.7290353, 0.6754495, 0.03647875, 0.7647059, 0, 1, 1,
0.7296743, 0.6556041, 1.046449, 0.7686275, 0, 1, 1,
0.7298215, -0.9962894, 4.534605, 0.7764706, 0, 1, 1,
0.7329404, 0.6056141, -0.4842386, 0.7803922, 0, 1, 1,
0.7339323, -1.11033, 1.820145, 0.7882353, 0, 1, 1,
0.7347625, 1.15582, 1.74779, 0.7921569, 0, 1, 1,
0.7365127, -2.193945, 3.424411, 0.8, 0, 1, 1,
0.7403644, -1.116775, 1.592123, 0.8078431, 0, 1, 1,
0.743061, 1.005022, -0.9895626, 0.8117647, 0, 1, 1,
0.7538694, 1.059481, -0.1425434, 0.8196079, 0, 1, 1,
0.7543877, 0.1012251, 2.143544, 0.8235294, 0, 1, 1,
0.7580127, 0.862188, 0.9412398, 0.8313726, 0, 1, 1,
0.7603157, -0.7364246, 3.089201, 0.8352941, 0, 1, 1,
0.7636303, -0.9009565, 2.642377, 0.8431373, 0, 1, 1,
0.7641789, -0.8757626, 2.855269, 0.8470588, 0, 1, 1,
0.7781788, 0.9445978, 0.9359996, 0.854902, 0, 1, 1,
0.7836455, 0.6111794, 1.063097, 0.8588235, 0, 1, 1,
0.7844468, -0.1721891, 2.837093, 0.8666667, 0, 1, 1,
0.792434, -0.6284116, 1.990171, 0.8705882, 0, 1, 1,
0.7948568, -0.5487932, 1.037093, 0.8784314, 0, 1, 1,
0.7964558, 1.122549, -0.6122536, 0.8823529, 0, 1, 1,
0.8026013, 0.6758226, 0.6985281, 0.8901961, 0, 1, 1,
0.8030736, 1.986452, 2.155091, 0.8941177, 0, 1, 1,
0.8046337, 0.1432498, 1.560771, 0.9019608, 0, 1, 1,
0.821667, -2.384962, 2.82682, 0.9098039, 0, 1, 1,
0.8250573, 1.037048, 0.6877689, 0.9137255, 0, 1, 1,
0.8264989, -0.525116, 3.012005, 0.9215686, 0, 1, 1,
0.8324828, -0.7580122, 1.65426, 0.9254902, 0, 1, 1,
0.8420854, 0.7413953, 0.5914611, 0.9333333, 0, 1, 1,
0.8454193, -1.764966, 2.259849, 0.9372549, 0, 1, 1,
0.8498991, 1.336693, 0.7885007, 0.945098, 0, 1, 1,
0.853629, -0.5497991, 3.187125, 0.9490196, 0, 1, 1,
0.8552806, -0.2427302, 3.589848, 0.9568627, 0, 1, 1,
0.8567656, -0.7436694, 1.908635, 0.9607843, 0, 1, 1,
0.8582142, 1.222115, 0.01890511, 0.9686275, 0, 1, 1,
0.8583618, 1.281484, -0.5095761, 0.972549, 0, 1, 1,
0.859077, 3.361257, -0.06302848, 0.9803922, 0, 1, 1,
0.85988, 1.102994, 2.203092, 0.9843137, 0, 1, 1,
0.8611399, -0.940406, 3.363641, 0.9921569, 0, 1, 1,
0.8710437, -1.242456, 2.269795, 0.9960784, 0, 1, 1,
0.8714438, 0.4546362, 0.3683385, 1, 0, 0.9960784, 1,
0.8725729, -0.3431349, -0.8470373, 1, 0, 0.9882353, 1,
0.8743172, -0.2380372, 2.795913, 1, 0, 0.9843137, 1,
0.87692, 0.9184963, 1.647351, 1, 0, 0.9764706, 1,
0.8786883, -1.124613, 2.302243, 1, 0, 0.972549, 1,
0.8788832, -0.5035164, 2.382611, 1, 0, 0.9647059, 1,
0.8820825, 0.0415058, 0.243668, 1, 0, 0.9607843, 1,
0.8834839, -1.107958, 2.777455, 1, 0, 0.9529412, 1,
0.8909026, 0.04592409, 2.455686, 1, 0, 0.9490196, 1,
0.8912063, 1.412794, 0.6032906, 1, 0, 0.9411765, 1,
0.8927936, 0.8206246, 3.568341, 1, 0, 0.9372549, 1,
0.8949994, 0.5404426, 0.2524103, 1, 0, 0.9294118, 1,
0.8963566, 1.048409, -0.1021616, 1, 0, 0.9254902, 1,
0.8967192, 0.02884153, -0.5616598, 1, 0, 0.9176471, 1,
0.8970147, 0.09877378, 0.8195814, 1, 0, 0.9137255, 1,
0.9046712, 0.1280022, 1.26476, 1, 0, 0.9058824, 1,
0.9058687, -0.002784559, 1.583493, 1, 0, 0.9019608, 1,
0.9062858, 0.8779216, 2.370855, 1, 0, 0.8941177, 1,
0.9081639, 0.767463, 1.581451, 1, 0, 0.8862745, 1,
0.910635, 0.4320313, 1.220866, 1, 0, 0.8823529, 1,
0.9128891, -0.2421862, 1.432276, 1, 0, 0.8745098, 1,
0.9171579, 0.3816729, -0.007847573, 1, 0, 0.8705882, 1,
0.9186231, 0.4627374, 1.981909, 1, 0, 0.8627451, 1,
0.9257694, -0.3436737, 1.184354, 1, 0, 0.8588235, 1,
0.9362683, 0.8595829, 1.88988, 1, 0, 0.8509804, 1,
0.9469897, 1.71265, 1.958548, 1, 0, 0.8470588, 1,
0.9484049, 0.2598249, 1.935816, 1, 0, 0.8392157, 1,
0.9505612, 1.083429, -0.2995936, 1, 0, 0.8352941, 1,
0.9509683, -0.2366644, 2.890037, 1, 0, 0.827451, 1,
0.9536688, 1.899514, -1.174794, 1, 0, 0.8235294, 1,
0.9540237, -0.3315871, 2.969208, 1, 0, 0.8156863, 1,
0.9555832, -0.1315475, -0.2606266, 1, 0, 0.8117647, 1,
0.9558534, -2.80762, 2.001996, 1, 0, 0.8039216, 1,
0.9607577, -0.4741726, 2.539797, 1, 0, 0.7960784, 1,
0.9701368, 0.2080427, 1.19562, 1, 0, 0.7921569, 1,
0.9711877, -1.839978, 2.054758, 1, 0, 0.7843137, 1,
0.9747412, 1.273788, 2.428342, 1, 0, 0.7803922, 1,
0.9788883, 1.476092, -0.04971859, 1, 0, 0.772549, 1,
0.9942922, -0.6521979, 1.387996, 1, 0, 0.7686275, 1,
0.9948752, -0.6039852, 3.424028, 1, 0, 0.7607843, 1,
0.9965612, -0.2088538, 0.4093741, 1, 0, 0.7568628, 1,
1.001875, -1.104325, 3.440288, 1, 0, 0.7490196, 1,
1.002438, 0.3626193, 2.246965, 1, 0, 0.7450981, 1,
1.009054, -0.3613429, 2.289323, 1, 0, 0.7372549, 1,
1.014287, -0.4001712, 2.622638, 1, 0, 0.7333333, 1,
1.026899, -0.6681171, 1.063816, 1, 0, 0.7254902, 1,
1.02784, 1.873845, 0.6622345, 1, 0, 0.7215686, 1,
1.041743, -0.324427, 1.544326, 1, 0, 0.7137255, 1,
1.046738, -0.1424208, 1.983114, 1, 0, 0.7098039, 1,
1.055454, 0.793201, 0.1126917, 1, 0, 0.7019608, 1,
1.057644, -0.4109655, 1.205395, 1, 0, 0.6941177, 1,
1.057811, 0.4081749, 1.43382, 1, 0, 0.6901961, 1,
1.063514, -0.9178349, 3.951278, 1, 0, 0.682353, 1,
1.073174, 0.8951545, 1.590381, 1, 0, 0.6784314, 1,
1.083121, -0.1142628, 1.377777, 1, 0, 0.6705883, 1,
1.088661, -0.1622785, -0.001463058, 1, 0, 0.6666667, 1,
1.089679, -0.2453473, 2.3021, 1, 0, 0.6588235, 1,
1.095301, -1.20692, 4.970288, 1, 0, 0.654902, 1,
1.120741, 0.02340356, 1.074724, 1, 0, 0.6470588, 1,
1.121554, -0.3821612, 1.78826, 1, 0, 0.6431373, 1,
1.134705, 0.6566936, 1.959005, 1, 0, 0.6352941, 1,
1.145321, 1.46333, 1.558997, 1, 0, 0.6313726, 1,
1.152166, -1.284039, 3.676514, 1, 0, 0.6235294, 1,
1.152728, 0.4659406, -1.306176, 1, 0, 0.6196079, 1,
1.169818, 1.092614, 1.276978, 1, 0, 0.6117647, 1,
1.174133, -0.3539813, 1.47757, 1, 0, 0.6078432, 1,
1.17438, 0.09408531, 2.7541, 1, 0, 0.6, 1,
1.179266, 1.39884, 0.1321349, 1, 0, 0.5921569, 1,
1.179302, -1.102356, 3.027141, 1, 0, 0.5882353, 1,
1.182791, -0.1118612, 1.472352, 1, 0, 0.5803922, 1,
1.188346, -0.2426938, 1.655108, 1, 0, 0.5764706, 1,
1.19102, -0.7520404, 0.405903, 1, 0, 0.5686275, 1,
1.200155, 0.08269153, 0.3069421, 1, 0, 0.5647059, 1,
1.20856, -0.3523866, 1.267587, 1, 0, 0.5568628, 1,
1.210838, -1.985688, 3.527426, 1, 0, 0.5529412, 1,
1.225399, 0.9657396, 1.891739, 1, 0, 0.5450981, 1,
1.227576, -0.4687364, 2.6894, 1, 0, 0.5411765, 1,
1.231169, -0.1908083, 1.722819, 1, 0, 0.5333334, 1,
1.241541, 1.4764, 0.3437021, 1, 0, 0.5294118, 1,
1.249277, 0.137292, 1.453925, 1, 0, 0.5215687, 1,
1.253678, -0.08534635, 2.121233, 1, 0, 0.5176471, 1,
1.262591, 0.09426831, 1.182343, 1, 0, 0.509804, 1,
1.264512, -0.7755897, 2.349295, 1, 0, 0.5058824, 1,
1.27863, 0.624675, 0.5619339, 1, 0, 0.4980392, 1,
1.280799, 0.6517302, -0.4772908, 1, 0, 0.4901961, 1,
1.287838, 2.037272, -0.4015249, 1, 0, 0.4862745, 1,
1.292502, 0.08078384, 1.35014, 1, 0, 0.4784314, 1,
1.292692, -1.35756, 1.526152, 1, 0, 0.4745098, 1,
1.294023, 0.1165122, 0.2060567, 1, 0, 0.4666667, 1,
1.295606, -0.3001593, 3.542216, 1, 0, 0.4627451, 1,
1.299189, 0.3440363, 1.400919, 1, 0, 0.454902, 1,
1.310197, 0.4313944, -0.411163, 1, 0, 0.4509804, 1,
1.315865, 0.1717698, 0.7200423, 1, 0, 0.4431373, 1,
1.324245, -2.250614, 2.779027, 1, 0, 0.4392157, 1,
1.324665, -0.5287867, 3.089747, 1, 0, 0.4313726, 1,
1.331731, 0.9909251, 0.8471653, 1, 0, 0.427451, 1,
1.344567, 1.042783, 1.707689, 1, 0, 0.4196078, 1,
1.345955, 0.967007, 1.942688, 1, 0, 0.4156863, 1,
1.35661, 1.727449, 1.184638, 1, 0, 0.4078431, 1,
1.356773, 0.1013484, 1.571492, 1, 0, 0.4039216, 1,
1.363524, 2.031345, 0.7530289, 1, 0, 0.3960784, 1,
1.388655, -0.1413867, 1.393625, 1, 0, 0.3882353, 1,
1.391121, -1.169372, 1.397616, 1, 0, 0.3843137, 1,
1.395207, 0.6590742, 0.07188771, 1, 0, 0.3764706, 1,
1.402063, -1.153007, 1.911075, 1, 0, 0.372549, 1,
1.406578, -0.6451614, 3.057199, 1, 0, 0.3647059, 1,
1.441939, 1.249102, 0.9656332, 1, 0, 0.3607843, 1,
1.447873, 0.2898613, 1.502882, 1, 0, 0.3529412, 1,
1.453725, -0.7914417, 1.06766, 1, 0, 0.3490196, 1,
1.459339, 0.1121276, 1.493567, 1, 0, 0.3411765, 1,
1.468541, -2.052846, 2.396979, 1, 0, 0.3372549, 1,
1.468762, 0.2945535, 2.764356, 1, 0, 0.3294118, 1,
1.478824, 0.9904872, -0.7408271, 1, 0, 0.3254902, 1,
1.480522, -0.6030213, 0.6268753, 1, 0, 0.3176471, 1,
1.482967, -0.3888143, 1.299628, 1, 0, 0.3137255, 1,
1.484079, -1.566724, 2.85492, 1, 0, 0.3058824, 1,
1.525048, 0.05399399, 3.035451, 1, 0, 0.2980392, 1,
1.534122, 0.9758803, 1.130837, 1, 0, 0.2941177, 1,
1.534271, -0.2011099, 1.956334, 1, 0, 0.2862745, 1,
1.538769, 0.554195, 1.379781, 1, 0, 0.282353, 1,
1.541934, -0.9670137, 1.335892, 1, 0, 0.2745098, 1,
1.548272, 0.753621, 1.317585, 1, 0, 0.2705882, 1,
1.553311, -0.6583338, 3.827909, 1, 0, 0.2627451, 1,
1.590363, -0.7406524, 3.164939, 1, 0, 0.2588235, 1,
1.593316, -0.7171648, 2.799088, 1, 0, 0.2509804, 1,
1.601611, 0.2802151, 1.866628, 1, 0, 0.2470588, 1,
1.625379, -1.231401, 2.335301, 1, 0, 0.2392157, 1,
1.63754, 0.6046541, 2.613756, 1, 0, 0.2352941, 1,
1.644639, -1.188393, 4.212363, 1, 0, 0.227451, 1,
1.648669, -0.5336096, 1.116523, 1, 0, 0.2235294, 1,
1.658703, -0.9662673, 1.167631, 1, 0, 0.2156863, 1,
1.670685, -0.4834616, 2.788161, 1, 0, 0.2117647, 1,
1.67179, 0.319441, 1.830258, 1, 0, 0.2039216, 1,
1.683762, 0.06779209, 0.04158666, 1, 0, 0.1960784, 1,
1.700214, -1.475517, 0.9777492, 1, 0, 0.1921569, 1,
1.720034, 1.104328, 1.314815, 1, 0, 0.1843137, 1,
1.730409, -0.1830214, 3.511983, 1, 0, 0.1803922, 1,
1.730685, -1.142806, 1.613463, 1, 0, 0.172549, 1,
1.74264, 1.050455, 1.767798, 1, 0, 0.1686275, 1,
1.756077, -1.472433, 1.5867, 1, 0, 0.1607843, 1,
1.767192, -1.407531, 1.973017, 1, 0, 0.1568628, 1,
1.772422, -0.5480173, 2.346075, 1, 0, 0.1490196, 1,
1.787691, -0.4654398, 1.977298, 1, 0, 0.145098, 1,
1.838036, -0.5197288, 0.5252278, 1, 0, 0.1372549, 1,
1.862721, -1.15095, 1.166814, 1, 0, 0.1333333, 1,
1.87677, -0.2431492, -0.09547083, 1, 0, 0.1254902, 1,
1.898818, 0.3543139, 1.62117, 1, 0, 0.1215686, 1,
1.899518, 0.4822902, 0.4653944, 1, 0, 0.1137255, 1,
1.928454, -1.806924, 1.952475, 1, 0, 0.1098039, 1,
1.930657, -0.0843747, 1.479191, 1, 0, 0.1019608, 1,
1.957318, -0.8733813, 1.710932, 1, 0, 0.09411765, 1,
1.966551, -2.102619, 1.230152, 1, 0, 0.09019608, 1,
1.984726, 1.219678, 0.7725635, 1, 0, 0.08235294, 1,
1.998556, -1.240459, 0.6802845, 1, 0, 0.07843138, 1,
2.046819, 0.07852065, 1.854005, 1, 0, 0.07058824, 1,
2.098608, -1.632121, 3.124205, 1, 0, 0.06666667, 1,
2.123516, -0.1048155, 1.275288, 1, 0, 0.05882353, 1,
2.128834, -0.3226427, 1.827069, 1, 0, 0.05490196, 1,
2.289414, -1.242972, 1.039906, 1, 0, 0.04705882, 1,
2.356392, -1.39356, 4.177351, 1, 0, 0.04313726, 1,
2.386699, -0.8722669, 0.4628679, 1, 0, 0.03529412, 1,
2.482468, -0.378473, 0.9089348, 1, 0, 0.03137255, 1,
2.491906, -0.9859611, 1.491196, 1, 0, 0.02352941, 1,
2.754204, -2.580797, 2.863988, 1, 0, 0.01960784, 1,
2.93978, -0.7550206, 2.353064, 1, 0, 0.01176471, 1,
3.056381, 1.453072, 1.869234, 1, 0, 0.007843138, 1
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
-0.2540342, -4.874816, -6.638227, 0, -0.5, 0.5, 0.5,
-0.2540342, -4.874816, -6.638227, 1, -0.5, 0.5, 0.5,
-0.2540342, -4.874816, -6.638227, 1, 1.5, 0.5, 0.5,
-0.2540342, -4.874816, -6.638227, 0, 1.5, 0.5, 0.5
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
-4.68668, -0.004114628, -6.638227, 0, -0.5, 0.5, 0.5,
-4.68668, -0.004114628, -6.638227, 1, -0.5, 0.5, 0.5,
-4.68668, -0.004114628, -6.638227, 1, 1.5, 0.5, 0.5,
-4.68668, -0.004114628, -6.638227, 0, 1.5, 0.5, 0.5
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
-4.68668, -4.874816, 0.4785712, 0, -0.5, 0.5, 0.5,
-4.68668, -4.874816, 0.4785712, 1, -0.5, 0.5, 0.5,
-4.68668, -4.874816, 0.4785712, 1, 1.5, 0.5, 0.5,
-4.68668, -4.874816, 0.4785712, 0, 1.5, 0.5, 0.5
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
-3, -3.750808, -4.995888,
3, -3.750808, -4.995888,
-3, -3.750808, -4.995888,
-3, -3.938143, -5.269611,
-2, -3.750808, -4.995888,
-2, -3.938143, -5.269611,
-1, -3.750808, -4.995888,
-1, -3.938143, -5.269611,
0, -3.750808, -4.995888,
0, -3.938143, -5.269611,
1, -3.750808, -4.995888,
1, -3.938143, -5.269611,
2, -3.750808, -4.995888,
2, -3.938143, -5.269611,
3, -3.750808, -4.995888,
3, -3.938143, -5.269611
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
-3, -4.312812, -5.817058, 0, -0.5, 0.5, 0.5,
-3, -4.312812, -5.817058, 1, -0.5, 0.5, 0.5,
-3, -4.312812, -5.817058, 1, 1.5, 0.5, 0.5,
-3, -4.312812, -5.817058, 0, 1.5, 0.5, 0.5,
-2, -4.312812, -5.817058, 0, -0.5, 0.5, 0.5,
-2, -4.312812, -5.817058, 1, -0.5, 0.5, 0.5,
-2, -4.312812, -5.817058, 1, 1.5, 0.5, 0.5,
-2, -4.312812, -5.817058, 0, 1.5, 0.5, 0.5,
-1, -4.312812, -5.817058, 0, -0.5, 0.5, 0.5,
-1, -4.312812, -5.817058, 1, -0.5, 0.5, 0.5,
-1, -4.312812, -5.817058, 1, 1.5, 0.5, 0.5,
-1, -4.312812, -5.817058, 0, 1.5, 0.5, 0.5,
0, -4.312812, -5.817058, 0, -0.5, 0.5, 0.5,
0, -4.312812, -5.817058, 1, -0.5, 0.5, 0.5,
0, -4.312812, -5.817058, 1, 1.5, 0.5, 0.5,
0, -4.312812, -5.817058, 0, 1.5, 0.5, 0.5,
1, -4.312812, -5.817058, 0, -0.5, 0.5, 0.5,
1, -4.312812, -5.817058, 1, -0.5, 0.5, 0.5,
1, -4.312812, -5.817058, 1, 1.5, 0.5, 0.5,
1, -4.312812, -5.817058, 0, 1.5, 0.5, 0.5,
2, -4.312812, -5.817058, 0, -0.5, 0.5, 0.5,
2, -4.312812, -5.817058, 1, -0.5, 0.5, 0.5,
2, -4.312812, -5.817058, 1, 1.5, 0.5, 0.5,
2, -4.312812, -5.817058, 0, 1.5, 0.5, 0.5,
3, -4.312812, -5.817058, 0, -0.5, 0.5, 0.5,
3, -4.312812, -5.817058, 1, -0.5, 0.5, 0.5,
3, -4.312812, -5.817058, 1, 1.5, 0.5, 0.5,
3, -4.312812, -5.817058, 0, 1.5, 0.5, 0.5
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
-3.663762, -2, -4.995888,
-3.663762, 2, -4.995888,
-3.663762, -2, -4.995888,
-3.834248, -2, -5.269611,
-3.663762, 0, -4.995888,
-3.834248, 0, -5.269611,
-3.663762, 2, -4.995888,
-3.834248, 2, -5.269611
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
-4.17522, -2, -5.817058, 0, -0.5, 0.5, 0.5,
-4.17522, -2, -5.817058, 1, -0.5, 0.5, 0.5,
-4.17522, -2, -5.817058, 1, 1.5, 0.5, 0.5,
-4.17522, -2, -5.817058, 0, 1.5, 0.5, 0.5,
-4.17522, 0, -5.817058, 0, -0.5, 0.5, 0.5,
-4.17522, 0, -5.817058, 1, -0.5, 0.5, 0.5,
-4.17522, 0, -5.817058, 1, 1.5, 0.5, 0.5,
-4.17522, 0, -5.817058, 0, 1.5, 0.5, 0.5,
-4.17522, 2, -5.817058, 0, -0.5, 0.5, 0.5,
-4.17522, 2, -5.817058, 1, -0.5, 0.5, 0.5,
-4.17522, 2, -5.817058, 1, 1.5, 0.5, 0.5,
-4.17522, 2, -5.817058, 0, 1.5, 0.5, 0.5
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
-3.663762, -3.750808, -4,
-3.663762, -3.750808, 4,
-3.663762, -3.750808, -4,
-3.834248, -3.938143, -4,
-3.663762, -3.750808, -2,
-3.834248, -3.938143, -2,
-3.663762, -3.750808, 0,
-3.834248, -3.938143, 0,
-3.663762, -3.750808, 2,
-3.834248, -3.938143, 2,
-3.663762, -3.750808, 4,
-3.834248, -3.938143, 4
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
-4.17522, -4.312812, -4, 0, -0.5, 0.5, 0.5,
-4.17522, -4.312812, -4, 1, -0.5, 0.5, 0.5,
-4.17522, -4.312812, -4, 1, 1.5, 0.5, 0.5,
-4.17522, -4.312812, -4, 0, 1.5, 0.5, 0.5,
-4.17522, -4.312812, -2, 0, -0.5, 0.5, 0.5,
-4.17522, -4.312812, -2, 1, -0.5, 0.5, 0.5,
-4.17522, -4.312812, -2, 1, 1.5, 0.5, 0.5,
-4.17522, -4.312812, -2, 0, 1.5, 0.5, 0.5,
-4.17522, -4.312812, 0, 0, -0.5, 0.5, 0.5,
-4.17522, -4.312812, 0, 1, -0.5, 0.5, 0.5,
-4.17522, -4.312812, 0, 1, 1.5, 0.5, 0.5,
-4.17522, -4.312812, 0, 0, 1.5, 0.5, 0.5,
-4.17522, -4.312812, 2, 0, -0.5, 0.5, 0.5,
-4.17522, -4.312812, 2, 1, -0.5, 0.5, 0.5,
-4.17522, -4.312812, 2, 1, 1.5, 0.5, 0.5,
-4.17522, -4.312812, 2, 0, 1.5, 0.5, 0.5,
-4.17522, -4.312812, 4, 0, -0.5, 0.5, 0.5,
-4.17522, -4.312812, 4, 1, -0.5, 0.5, 0.5,
-4.17522, -4.312812, 4, 1, 1.5, 0.5, 0.5,
-4.17522, -4.312812, 4, 0, 1.5, 0.5, 0.5
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
-3.663762, -3.750808, -4.995888,
-3.663762, 3.742579, -4.995888,
-3.663762, -3.750808, 5.953031,
-3.663762, 3.742579, 5.953031,
-3.663762, -3.750808, -4.995888,
-3.663762, -3.750808, 5.953031,
-3.663762, 3.742579, -4.995888,
-3.663762, 3.742579, 5.953031,
-3.663762, -3.750808, -4.995888,
3.155693, -3.750808, -4.995888,
-3.663762, -3.750808, 5.953031,
3.155693, -3.750808, 5.953031,
-3.663762, 3.742579, -4.995888,
3.155693, 3.742579, -4.995888,
-3.663762, 3.742579, 5.953031,
3.155693, 3.742579, 5.953031,
3.155693, -3.750808, -4.995888,
3.155693, 3.742579, -4.995888,
3.155693, -3.750808, 5.953031,
3.155693, 3.742579, 5.953031,
3.155693, -3.750808, -4.995888,
3.155693, -3.750808, 5.953031,
3.155693, 3.742579, -4.995888,
3.155693, 3.742579, 5.953031
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
var radius = 7.965706;
var distance = 35.44033;
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
mvMatrix.translate( 0.2540342, 0.004114628, -0.4785712 );
mvMatrix.scale( 1.262957, 1.14937, 0.7866235 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.44033);
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
diniconazole<-read.table("diniconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diniconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'diniconazole' not found
```

```r
y<-diniconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'diniconazole' not found
```

```r
z<-diniconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'diniconazole' not found
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
-3.564449, 0.4721879, -2.94215, 0, 0, 1, 1, 1,
-3.174633, -0.7357057, -3.521205, 1, 0, 0, 1, 1,
-2.825139, -1.039523, -2.119241, 1, 0, 0, 1, 1,
-2.751025, -0.08167604, -0.5889883, 1, 0, 0, 1, 1,
-2.656203, 1.333722, -1.709028, 1, 0, 0, 1, 1,
-2.583472, -0.6919988, -0.2462372, 1, 0, 0, 1, 1,
-2.556603, 0.9726398, -1.785669, 0, 0, 0, 1, 1,
-2.515844, -0.5667045, -0.7137495, 0, 0, 0, 1, 1,
-2.510752, 0.9507505, -1.260035, 0, 0, 0, 1, 1,
-2.510322, 0.07944794, -1.627108, 0, 0, 0, 1, 1,
-2.444947, -0.7258351, -2.570132, 0, 0, 0, 1, 1,
-2.379314, -1.299422, -2.818262, 0, 0, 0, 1, 1,
-2.376597, 0.2716179, -1.480062, 0, 0, 0, 1, 1,
-2.367351, -1.873143, -3.65298, 1, 1, 1, 1, 1,
-2.333821, 1.441017, -1.119798, 1, 1, 1, 1, 1,
-2.143454, 0.9518601, -1.204907, 1, 1, 1, 1, 1,
-2.125397, 1.045525, 1.273949, 1, 1, 1, 1, 1,
-2.102249, 0.06556498, -2.019095, 1, 1, 1, 1, 1,
-2.101075, 0.9732975, -0.6516861, 1, 1, 1, 1, 1,
-2.028282, -0.5080389, -0.883896, 1, 1, 1, 1, 1,
-2.011841, 0.713403, -0.5857249, 1, 1, 1, 1, 1,
-2.007012, -0.8283107, -1.77451, 1, 1, 1, 1, 1,
-1.992376, -0.2362635, -1.131082, 1, 1, 1, 1, 1,
-1.991944, 1.604711, -0.6349925, 1, 1, 1, 1, 1,
-1.944523, -1.726156, -2.938993, 1, 1, 1, 1, 1,
-1.940542, -1.105553, -0.2813141, 1, 1, 1, 1, 1,
-1.910931, 0.4926724, -0.5077571, 1, 1, 1, 1, 1,
-1.900093, 0.846919, -1.259439, 1, 1, 1, 1, 1,
-1.895854, 0.8548464, -1.261024, 0, 0, 1, 1, 1,
-1.889595, -0.553856, -1.552138, 1, 0, 0, 1, 1,
-1.88151, -0.5675972, -2.376357, 1, 0, 0, 1, 1,
-1.880118, -0.1567421, -1.656761, 1, 0, 0, 1, 1,
-1.872717, -0.3941993, -0.4215704, 1, 0, 0, 1, 1,
-1.85996, -0.7626053, -2.373721, 1, 0, 0, 1, 1,
-1.853927, -0.5267304, -3.169131, 0, 0, 0, 1, 1,
-1.852268, 1.650076, -0.9171865, 0, 0, 0, 1, 1,
-1.835476, -0.1994967, -0.3463718, 0, 0, 0, 1, 1,
-1.832817, -0.05306505, -0.929374, 0, 0, 0, 1, 1,
-1.820289, -0.4481283, -2.417247, 0, 0, 0, 1, 1,
-1.791407, 2.375571, 2.307573, 0, 0, 0, 1, 1,
-1.78948, -0.2571912, -2.00208, 0, 0, 0, 1, 1,
-1.788178, 0.8411469, -0.2218406, 1, 1, 1, 1, 1,
-1.783601, 0.7083297, -2.209275, 1, 1, 1, 1, 1,
-1.782806, 1.502442, -0.4235505, 1, 1, 1, 1, 1,
-1.781232, -1.923724, -1.281937, 1, 1, 1, 1, 1,
-1.772053, 1.455079, -0.08652804, 1, 1, 1, 1, 1,
-1.765803, -0.452417, -1.424636, 1, 1, 1, 1, 1,
-1.75287, -0.1427793, -2.715471, 1, 1, 1, 1, 1,
-1.750463, 1.109806, -1.320104, 1, 1, 1, 1, 1,
-1.672637, -1.049991, -1.70943, 1, 1, 1, 1, 1,
-1.665697, -0.3249888, 0.6363404, 1, 1, 1, 1, 1,
-1.66043, 0.7333495, 0.1770142, 1, 1, 1, 1, 1,
-1.647092, 0.4853967, -1.215737, 1, 1, 1, 1, 1,
-1.645612, -0.1112496, -0.8642204, 1, 1, 1, 1, 1,
-1.627691, -0.4840921, -2.725184, 1, 1, 1, 1, 1,
-1.625533, 1.150975, -1.995874, 1, 1, 1, 1, 1,
-1.613498, -1.34812, -2.757048, 0, 0, 1, 1, 1,
-1.612367, -0.7922022, -1.087655, 1, 0, 0, 1, 1,
-1.604457, 1.613559, -0.6757278, 1, 0, 0, 1, 1,
-1.597265, -0.7804412, -3.302578, 1, 0, 0, 1, 1,
-1.590849, 0.1389528, -2.037137, 1, 0, 0, 1, 1,
-1.588391, 1.135595, -0.5604627, 1, 0, 0, 1, 1,
-1.584783, 1.365234, -1.508728, 0, 0, 0, 1, 1,
-1.565035, -0.04413507, -2.148102, 0, 0, 0, 1, 1,
-1.563827, 0.4463047, -1.398869, 0, 0, 0, 1, 1,
-1.561132, -0.05824246, -1.113391, 0, 0, 0, 1, 1,
-1.559389, 2.400591, -1.841242, 0, 0, 0, 1, 1,
-1.558976, -0.5328839, -1.933428, 0, 0, 0, 1, 1,
-1.549347, 1.926003, -0.7014158, 0, 0, 0, 1, 1,
-1.543333, 0.2204858, -2.173736, 1, 1, 1, 1, 1,
-1.524177, 1.070532, 0.8692245, 1, 1, 1, 1, 1,
-1.498538, -0.1639822, -2.234816, 1, 1, 1, 1, 1,
-1.477632, 0.005904375, -4.836438, 1, 1, 1, 1, 1,
-1.474737, 1.08062, -0.6696858, 1, 1, 1, 1, 1,
-1.473682, -1.339507, -2.735902, 1, 1, 1, 1, 1,
-1.471792, 0.6568341, -0.5954184, 1, 1, 1, 1, 1,
-1.468158, 0.8568068, -0.2386002, 1, 1, 1, 1, 1,
-1.467406, -1.095972, -2.695403, 1, 1, 1, 1, 1,
-1.458249, -0.1031654, -1.611086, 1, 1, 1, 1, 1,
-1.438828, 1.320221, -1.23625, 1, 1, 1, 1, 1,
-1.43575, 0.909144, -2.522545, 1, 1, 1, 1, 1,
-1.43559, -0.2022091, -2.013989, 1, 1, 1, 1, 1,
-1.431507, -0.9423148, -1.839097, 1, 1, 1, 1, 1,
-1.424537, 0.8545352, -0.8406897, 1, 1, 1, 1, 1,
-1.420676, 0.2177389, -0.05063297, 0, 0, 1, 1, 1,
-1.419558, 1.69106, -1.059753, 1, 0, 0, 1, 1,
-1.416098, 0.2669207, -2.520612, 1, 0, 0, 1, 1,
-1.410121, 0.485717, -2.303126, 1, 0, 0, 1, 1,
-1.410107, 0.6611241, -1.930902, 1, 0, 0, 1, 1,
-1.402927, 1.693993, -0.3812239, 1, 0, 0, 1, 1,
-1.380075, 0.1980953, -1.918951, 0, 0, 0, 1, 1,
-1.379828, -0.3520443, -2.084998, 0, 0, 0, 1, 1,
-1.378624, -0.1731246, -2.351525, 0, 0, 0, 1, 1,
-1.376829, 1.280407, -2.455817, 0, 0, 0, 1, 1,
-1.374161, 0.8287533, -0.07311979, 0, 0, 0, 1, 1,
-1.366537, -0.1028376, -3.275379, 0, 0, 0, 1, 1,
-1.348478, -2.149913, -2.625706, 0, 0, 0, 1, 1,
-1.344693, 0.6089937, -0.1251371, 1, 1, 1, 1, 1,
-1.339011, -0.2209431, -2.121886, 1, 1, 1, 1, 1,
-1.338784, 0.3533221, -2.720203, 1, 1, 1, 1, 1,
-1.337787, 0.5712534, -3.348475, 1, 1, 1, 1, 1,
-1.32912, 0.3439987, 0.5634938, 1, 1, 1, 1, 1,
-1.328313, -0.0339621, -0.3972601, 1, 1, 1, 1, 1,
-1.325952, 1.793083, -1.304124, 1, 1, 1, 1, 1,
-1.321691, 0.1703964, -2.57124, 1, 1, 1, 1, 1,
-1.289236, -1.401321, -1.788684, 1, 1, 1, 1, 1,
-1.278763, -1.820054, -2.99857, 1, 1, 1, 1, 1,
-1.266738, 0.7817731, -1.560796, 1, 1, 1, 1, 1,
-1.263857, 0.003081069, -0.8023946, 1, 1, 1, 1, 1,
-1.262811, 1.192613, -0.812548, 1, 1, 1, 1, 1,
-1.259763, -1.440049, -3.388721, 1, 1, 1, 1, 1,
-1.255043, 1.50711, -2.153667, 1, 1, 1, 1, 1,
-1.252372, -1.149955, -2.531865, 0, 0, 1, 1, 1,
-1.241797, -0.9429878, -1.36943, 1, 0, 0, 1, 1,
-1.237795, -0.8983701, -3.558025, 1, 0, 0, 1, 1,
-1.231247, -1.546063, -1.68747, 1, 0, 0, 1, 1,
-1.229889, -1.500426, -2.417718, 1, 0, 0, 1, 1,
-1.226496, -3.641681, -1.437435, 1, 0, 0, 1, 1,
-1.219674, 0.335436, -0.8214099, 0, 0, 0, 1, 1,
-1.209916, -0.7804891, -3.615097, 0, 0, 0, 1, 1,
-1.20847, -0.8804083, -1.188388, 0, 0, 0, 1, 1,
-1.200652, 0.6612009, -0.5336422, 0, 0, 0, 1, 1,
-1.198852, 0.3448249, -2.999138, 0, 0, 0, 1, 1,
-1.197768, -1.394965, -1.956761, 0, 0, 0, 1, 1,
-1.197613, -0.7727053, -1.559831, 0, 0, 0, 1, 1,
-1.191346, 2.196496, -0.6363612, 1, 1, 1, 1, 1,
-1.182408, 1.45321, -2.189421, 1, 1, 1, 1, 1,
-1.171941, 0.7199707, -2.465301, 1, 1, 1, 1, 1,
-1.171014, 0.4480777, -1.915745, 1, 1, 1, 1, 1,
-1.170603, -0.6931762, -1.437755, 1, 1, 1, 1, 1,
-1.169388, 0.9245498, 1.941084, 1, 1, 1, 1, 1,
-1.168457, 0.9586568, 0.0550126, 1, 1, 1, 1, 1,
-1.163783, -0.4607004, -2.358402, 1, 1, 1, 1, 1,
-1.155946, -2.085326, -3.066312, 1, 1, 1, 1, 1,
-1.155838, -0.3999591, -1.708848, 1, 1, 1, 1, 1,
-1.151496, -1.114693, -2.401256, 1, 1, 1, 1, 1,
-1.143139, 1.292256, -1.354126, 1, 1, 1, 1, 1,
-1.132818, 1.846804, -0.2150531, 1, 1, 1, 1, 1,
-1.132469, 3.633452, -0.4837971, 1, 1, 1, 1, 1,
-1.124623, 1.023813, -1.530331, 1, 1, 1, 1, 1,
-1.1207, -0.311082, 0.6736735, 0, 0, 1, 1, 1,
-1.114797, 1.763057, -0.1449081, 1, 0, 0, 1, 1,
-1.113904, -0.4936262, -1.145129, 1, 0, 0, 1, 1,
-1.111142, 1.42973, -0.9952244, 1, 0, 0, 1, 1,
-1.104982, -0.624369, -3.117538, 1, 0, 0, 1, 1,
-1.102051, -0.6245844, -1.480588, 1, 0, 0, 1, 1,
-1.101019, 0.457239, -2.515671, 0, 0, 0, 1, 1,
-1.094559, -0.6550571, -3.069212, 0, 0, 0, 1, 1,
-1.093065, 1.12295, -1.386804, 0, 0, 0, 1, 1,
-1.09085, -1.142951, -2.140982, 0, 0, 0, 1, 1,
-1.089032, 1.283975, -0.8848805, 0, 0, 0, 1, 1,
-1.08882, 0.9521004, -1.133723, 0, 0, 0, 1, 1,
-1.088687, 0.5555307, -1.584465, 0, 0, 0, 1, 1,
-1.084836, 0.1478067, -1.764049, 1, 1, 1, 1, 1,
-1.084055, 1.728338, 1.202727, 1, 1, 1, 1, 1,
-1.081362, -0.6319203, -2.324765, 1, 1, 1, 1, 1,
-1.079146, 0.6952437, -1.000091, 1, 1, 1, 1, 1,
-1.07323, 1.03956, -1.283343, 1, 1, 1, 1, 1,
-1.072902, 1.521523, -1.221035, 1, 1, 1, 1, 1,
-1.062437, 0.6967207, -0.9171628, 1, 1, 1, 1, 1,
-1.059223, 0.3203954, -1.833079, 1, 1, 1, 1, 1,
-1.057185, -0.2323198, -2.802977, 1, 1, 1, 1, 1,
-1.057038, -1.495993, -2.634271, 1, 1, 1, 1, 1,
-1.054477, -0.3709653, -1.683555, 1, 1, 1, 1, 1,
-1.051061, -0.8284941, -2.577259, 1, 1, 1, 1, 1,
-1.047351, 0.956575, -0.6257081, 1, 1, 1, 1, 1,
-1.045939, 0.7612268, -1.478318, 1, 1, 1, 1, 1,
-1.042328, -1.552066, -1.829198, 1, 1, 1, 1, 1,
-1.041051, 1.998651, -1.133976, 0, 0, 1, 1, 1,
-1.040582, 1.190497, 1.096456, 1, 0, 0, 1, 1,
-1.035927, 0.4798138, 1.131061, 1, 0, 0, 1, 1,
-1.034261, -0.04786433, -1.703209, 1, 0, 0, 1, 1,
-1.032605, 0.300833, -0.834174, 1, 0, 0, 1, 1,
-1.03073, 1.078049, 0.3938051, 1, 0, 0, 1, 1,
-1.014996, 0.5753364, -1.490636, 0, 0, 0, 1, 1,
-1.013018, -0.952841, -1.108728, 0, 0, 0, 1, 1,
-1.012057, 2.404064, 0.2181235, 0, 0, 0, 1, 1,
-1.006892, -0.2477323, 0.5401527, 0, 0, 0, 1, 1,
-1.005061, -1.462291, -3.291398, 0, 0, 0, 1, 1,
-1.004387, 0.1269579, -0.645107, 0, 0, 0, 1, 1,
-0.9968999, -0.2012593, -2.41023, 0, 0, 0, 1, 1,
-0.9950787, 1.522257, 0.03177807, 1, 1, 1, 1, 1,
-0.9867667, 0.08029833, -1.192006, 1, 1, 1, 1, 1,
-0.9849071, 2.75546, 0.07508165, 1, 1, 1, 1, 1,
-0.9846538, -0.05464378, -1.896746, 1, 1, 1, 1, 1,
-0.9655142, -0.6047719, -1.939739, 1, 1, 1, 1, 1,
-0.9574612, 0.4223154, -1.691087, 1, 1, 1, 1, 1,
-0.9557361, -0.8438087, -3.410668, 1, 1, 1, 1, 1,
-0.9550046, -0.5277774, -2.648055, 1, 1, 1, 1, 1,
-0.9523184, -0.00623926, -0.7541077, 1, 1, 1, 1, 1,
-0.9509079, 0.3540423, -1.289322, 1, 1, 1, 1, 1,
-0.9499364, -0.1671475, 0.267861, 1, 1, 1, 1, 1,
-0.9491239, -0.3472801, -4.434301, 1, 1, 1, 1, 1,
-0.9449886, 0.7810842, -0.9467849, 1, 1, 1, 1, 1,
-0.9438257, -0.8074312, -1.442178, 1, 1, 1, 1, 1,
-0.9434542, 1.008471, -1.17125, 1, 1, 1, 1, 1,
-0.9426269, -0.8325559, -4.23877, 0, 0, 1, 1, 1,
-0.9381703, -1.063466, -1.329825, 1, 0, 0, 1, 1,
-0.9337089, -0.5982444, -1.864327, 1, 0, 0, 1, 1,
-0.9278508, 0.235729, -1.516474, 1, 0, 0, 1, 1,
-0.924345, -0.619419, -0.1184746, 1, 0, 0, 1, 1,
-0.9230321, 0.5860879, -0.7381359, 1, 0, 0, 1, 1,
-0.9181168, 0.2661581, -0.8143949, 0, 0, 0, 1, 1,
-0.9139435, -0.1831611, -3.408882, 0, 0, 0, 1, 1,
-0.9116619, -0.02786769, -0.5178194, 0, 0, 0, 1, 1,
-0.9109367, -0.3038476, -3.734234, 0, 0, 0, 1, 1,
-0.8981758, 0.9136437, -2.045876, 0, 0, 0, 1, 1,
-0.8925449, 0.124326, -0.09009365, 0, 0, 0, 1, 1,
-0.8830836, 1.204853, -0.9140244, 0, 0, 0, 1, 1,
-0.8791389, 0.3794421, -1.526187, 1, 1, 1, 1, 1,
-0.8774722, 0.06607594, -2.753703, 1, 1, 1, 1, 1,
-0.8773455, -1.072382, -1.374154, 1, 1, 1, 1, 1,
-0.8752232, 0.7127224, 0.2452935, 1, 1, 1, 1, 1,
-0.8729798, 0.4841768, -1.188812, 1, 1, 1, 1, 1,
-0.8625139, -0.1388106, -2.501652, 1, 1, 1, 1, 1,
-0.8620895, 0.17801, -1.542252, 1, 1, 1, 1, 1,
-0.8509005, -0.7177542, -2.363317, 1, 1, 1, 1, 1,
-0.8457955, -1.183994, -2.250178, 1, 1, 1, 1, 1,
-0.8322952, 0.6923278, -1.689638, 1, 1, 1, 1, 1,
-0.8147631, -0.6932397, -2.34954, 1, 1, 1, 1, 1,
-0.8127738, -0.5700529, -1.772, 1, 1, 1, 1, 1,
-0.8078448, 1.245918, 1.223002, 1, 1, 1, 1, 1,
-0.8056549, -1.835902, -3.196549, 1, 1, 1, 1, 1,
-0.8016916, -0.7971073, -4.321195, 1, 1, 1, 1, 1,
-0.8002205, -0.406147, -3.540355, 0, 0, 1, 1, 1,
-0.799367, 0.1333017, -2.547199, 1, 0, 0, 1, 1,
-0.7982002, 0.5466892, 0.59951, 1, 0, 0, 1, 1,
-0.7979163, 0.9208009, 1.043741, 1, 0, 0, 1, 1,
-0.7937945, -0.322963, -2.527076, 1, 0, 0, 1, 1,
-0.7799677, 1.032613, -0.1107365, 1, 0, 0, 1, 1,
-0.7750694, 1.176512, -0.9661594, 0, 0, 0, 1, 1,
-0.7743149, 0.0842416, -1.485586, 0, 0, 0, 1, 1,
-0.7723376, -1.956786, -3.109418, 0, 0, 0, 1, 1,
-0.7703215, 0.5578286, -1.621892, 0, 0, 0, 1, 1,
-0.7667429, -0.3276694, -1.614501, 0, 0, 0, 1, 1,
-0.7623707, -0.8065646, -2.781386, 0, 0, 0, 1, 1,
-0.7604387, 1.848141, 0.4390481, 0, 0, 0, 1, 1,
-0.7590385, 0.7566147, -1.014464, 1, 1, 1, 1, 1,
-0.7587189, -0.5368308, -2.827111, 1, 1, 1, 1, 1,
-0.74964, 0.8135483, -0.6510244, 1, 1, 1, 1, 1,
-0.7489877, 0.3038476, -1.111963, 1, 1, 1, 1, 1,
-0.7460225, -1.977033, -3.442959, 1, 1, 1, 1, 1,
-0.744019, 1.286199, -1.316608, 1, 1, 1, 1, 1,
-0.7432553, 0.3707883, -0.4876739, 1, 1, 1, 1, 1,
-0.7322322, -0.0924376, -2.341377, 1, 1, 1, 1, 1,
-0.730591, 0.664178, -0.03675552, 1, 1, 1, 1, 1,
-0.7276217, 0.2651785, -0.2591909, 1, 1, 1, 1, 1,
-0.7240585, 0.8240659, -2.149338, 1, 1, 1, 1, 1,
-0.7234349, 0.6023217, -0.2165002, 1, 1, 1, 1, 1,
-0.719601, 0.7117947, -2.894061, 1, 1, 1, 1, 1,
-0.7180727, -1.239074, -3.36268, 1, 1, 1, 1, 1,
-0.7170919, -1.469507, -0.9390626, 1, 1, 1, 1, 1,
-0.7165813, -0.1674725, -3.041901, 0, 0, 1, 1, 1,
-0.7158594, 0.8986339, -0.3938545, 1, 0, 0, 1, 1,
-0.7137264, 2.109411, -1.297375, 1, 0, 0, 1, 1,
-0.7064629, -1.331146, -0.7980703, 1, 0, 0, 1, 1,
-0.7058353, -0.2305078, -1.631398, 1, 0, 0, 1, 1,
-0.7017571, -0.7543351, -2.280867, 1, 0, 0, 1, 1,
-0.6968317, 0.8207055, 0.4201362, 0, 0, 0, 1, 1,
-0.6959662, 1.638315, -1.096326, 0, 0, 0, 1, 1,
-0.6893322, 0.6996096, -0.2278159, 0, 0, 0, 1, 1,
-0.6892083, 1.02876, 0.1633648, 0, 0, 0, 1, 1,
-0.6862341, -1.603904, -4.828232, 0, 0, 0, 1, 1,
-0.6835171, -0.2070471, -0.9133135, 0, 0, 0, 1, 1,
-0.6835093, 1.463774, -0.7740156, 0, 0, 0, 1, 1,
-0.681496, -0.08253448, -2.372644, 1, 1, 1, 1, 1,
-0.6805779, -0.2710187, -1.999523, 1, 1, 1, 1, 1,
-0.6671318, -0.5549775, -1.706842, 1, 1, 1, 1, 1,
-0.6624082, -0.8529133, -2.206854, 1, 1, 1, 1, 1,
-0.6611274, 1.017199, -1.033608, 1, 1, 1, 1, 1,
-0.6606468, -0.05719736, -0.8060847, 1, 1, 1, 1, 1,
-0.6599748, 1.765433, 1.331709, 1, 1, 1, 1, 1,
-0.6581623, -0.08340976, -0.4859128, 1, 1, 1, 1, 1,
-0.6565697, 0.1698419, -1.185709, 1, 1, 1, 1, 1,
-0.6556383, -0.5384299, -2.840698, 1, 1, 1, 1, 1,
-0.6551653, -1.338926, -3.515362, 1, 1, 1, 1, 1,
-0.6520892, 0.8720772, 0.1406462, 1, 1, 1, 1, 1,
-0.6491646, 2.502961, -1.653185, 1, 1, 1, 1, 1,
-0.6451971, 0.6274518, -0.280087, 1, 1, 1, 1, 1,
-0.6451467, -1.307636, -1.785545, 1, 1, 1, 1, 1,
-0.6426295, 0.5092157, 0.7125082, 0, 0, 1, 1, 1,
-0.6395938, 1.128955, -0.764781, 1, 0, 0, 1, 1,
-0.6394135, 0.3639736, -1.192259, 1, 0, 0, 1, 1,
-0.6345835, -0.7260547, -3.025961, 1, 0, 0, 1, 1,
-0.6322558, 0.6127893, -1.582921, 1, 0, 0, 1, 1,
-0.6296525, 0.4516599, -0.9824545, 1, 0, 0, 1, 1,
-0.623334, 2.188236, -0.6331152, 0, 0, 0, 1, 1,
-0.6227164, -2.074474, -3.665417, 0, 0, 0, 1, 1,
-0.6221624, -0.8612925, -3.433988, 0, 0, 0, 1, 1,
-0.6199902, 0.1055697, -0.7496865, 0, 0, 0, 1, 1,
-0.6186324, -0.3528056, -1.579826, 0, 0, 0, 1, 1,
-0.61045, -1.601237, -2.50667, 0, 0, 0, 1, 1,
-0.6049491, 0.6475844, -1.631532, 0, 0, 0, 1, 1,
-0.6034164, 0.9507138, -0.8455061, 1, 1, 1, 1, 1,
-0.6019042, -0.1716423, -2.983776, 1, 1, 1, 1, 1,
-0.6005639, -0.8611861, -3.517697, 1, 1, 1, 1, 1,
-0.5976287, 1.272389, -0.8290899, 1, 1, 1, 1, 1,
-0.5962309, -1.739932, -3.16911, 1, 1, 1, 1, 1,
-0.5946391, -2.653051, -2.552051, 1, 1, 1, 1, 1,
-0.589072, 0.1893079, -1.79921, 1, 1, 1, 1, 1,
-0.5890414, -1.118825, -1.817884, 1, 1, 1, 1, 1,
-0.5869196, -0.4314847, 0.1048455, 1, 1, 1, 1, 1,
-0.5790586, -0.003395289, -0.8917093, 1, 1, 1, 1, 1,
-0.5789886, 0.3727328, -1.171553, 1, 1, 1, 1, 1,
-0.5712873, -0.3114173, -2.885828, 1, 1, 1, 1, 1,
-0.5696059, -0.2552775, -1.719404, 1, 1, 1, 1, 1,
-0.5685403, -0.8375012, -0.6083677, 1, 1, 1, 1, 1,
-0.5639514, -2.819952, -3.430575, 1, 1, 1, 1, 1,
-0.5605398, 0.2704027, -3.029743, 0, 0, 1, 1, 1,
-0.5561965, 0.09613368, -2.250879, 1, 0, 0, 1, 1,
-0.5551958, -1.323816, -3.76939, 1, 0, 0, 1, 1,
-0.5531005, -0.6392972, -3.720993, 1, 0, 0, 1, 1,
-0.551832, 0.2316906, -1.328043, 1, 0, 0, 1, 1,
-0.5505062, -1.536854, -2.299917, 1, 0, 0, 1, 1,
-0.5467671, 0.2213021, -0.073526, 0, 0, 0, 1, 1,
-0.5442517, 0.2355124, -2.714516, 0, 0, 0, 1, 1,
-0.5436762, 0.3835613, -2.604662, 0, 0, 0, 1, 1,
-0.5435185, 1.175426, -0.441142, 0, 0, 0, 1, 1,
-0.5424768, 0.5845937, -1.344349, 0, 0, 0, 1, 1,
-0.5418692, 0.316891, -1.009584, 0, 0, 0, 1, 1,
-0.5408028, -1.884129, -4.244665, 0, 0, 0, 1, 1,
-0.5399593, 2.5076, 0.370654, 1, 1, 1, 1, 1,
-0.5396759, -1.118253, -2.461094, 1, 1, 1, 1, 1,
-0.5390766, 0.07700063, -0.4088168, 1, 1, 1, 1, 1,
-0.5361046, 1.250583, -0.5931472, 1, 1, 1, 1, 1,
-0.5351277, 0.9775069, -1.793283, 1, 1, 1, 1, 1,
-0.534278, 0.07618883, 0.2453098, 1, 1, 1, 1, 1,
-0.5320352, -1.097829, -1.031897, 1, 1, 1, 1, 1,
-0.5303405, -0.588272, -1.910655, 1, 1, 1, 1, 1,
-0.5289063, 0.2655231, -0.885368, 1, 1, 1, 1, 1,
-0.5285085, -0.2827156, -2.025054, 1, 1, 1, 1, 1,
-0.5268481, 0.6460464, 0.52305, 1, 1, 1, 1, 1,
-0.5263361, 0.2711094, -0.03247742, 1, 1, 1, 1, 1,
-0.5182862, 1.288522, -1.216643, 1, 1, 1, 1, 1,
-0.5179883, -1.233046, -2.800977, 1, 1, 1, 1, 1,
-0.5119268, 0.7541631, -0.3488729, 1, 1, 1, 1, 1,
-0.50651, -0.3418433, -3.371314, 0, 0, 1, 1, 1,
-0.5033621, 2.050761, 0.5874449, 1, 0, 0, 1, 1,
-0.4999453, -0.4112973, -2.321927, 1, 0, 0, 1, 1,
-0.4983338, 0.4748173, -0.9539462, 1, 0, 0, 1, 1,
-0.4959562, 2.805705, -0.538044, 1, 0, 0, 1, 1,
-0.4925508, 0.1910718, -2.828152, 1, 0, 0, 1, 1,
-0.4887004, -1.651229, -2.753858, 0, 0, 0, 1, 1,
-0.4867324, 1.901741, -0.3039064, 0, 0, 0, 1, 1,
-0.4861849, -0.7965141, -1.633708, 0, 0, 0, 1, 1,
-0.4838538, 0.4366619, -2.927965, 0, 0, 0, 1, 1,
-0.4819684, 0.7353597, 0.02834677, 0, 0, 0, 1, 1,
-0.4805543, 1.173725, -2.756137, 0, 0, 0, 1, 1,
-0.4787592, -1.733244, -3.637541, 0, 0, 0, 1, 1,
-0.4745119, -1.47029, -2.568717, 1, 1, 1, 1, 1,
-0.4729967, -1.828287, -0.9306082, 1, 1, 1, 1, 1,
-0.4717298, -0.6687033, -1.286484, 1, 1, 1, 1, 1,
-0.469368, 0.6241925, -3.41617, 1, 1, 1, 1, 1,
-0.465926, 0.4233544, 1.540783, 1, 1, 1, 1, 1,
-0.4652493, 1.037913, -0.8307191, 1, 1, 1, 1, 1,
-0.4534611, -0.09816848, -2.026875, 1, 1, 1, 1, 1,
-0.4499491, 2.498629, -0.5601545, 1, 1, 1, 1, 1,
-0.4484985, -0.5002906, -2.214272, 1, 1, 1, 1, 1,
-0.4471181, -1.268472, -3.423388, 1, 1, 1, 1, 1,
-0.4427986, -0.7209108, -2.604997, 1, 1, 1, 1, 1,
-0.4412028, 0.1483742, -1.765091, 1, 1, 1, 1, 1,
-0.4408462, 2.017032, -0.9577376, 1, 1, 1, 1, 1,
-0.4397712, -0.7712362, -2.401509, 1, 1, 1, 1, 1,
-0.4306313, -0.2181401, -3.111907, 1, 1, 1, 1, 1,
-0.4283288, -0.4151974, -2.290752, 0, 0, 1, 1, 1,
-0.4269691, 0.3904911, -1.628564, 1, 0, 0, 1, 1,
-0.4250658, -0.3769014, -1.472634, 1, 0, 0, 1, 1,
-0.4234205, 0.05771637, -1.576404, 1, 0, 0, 1, 1,
-0.4219898, 1.246867, -1.557072, 1, 0, 0, 1, 1,
-0.4172699, -0.1325142, -2.439652, 1, 0, 0, 1, 1,
-0.4132294, 1.960581, 1.302389, 0, 0, 0, 1, 1,
-0.4130122, 0.3506073, -2.250662, 0, 0, 0, 1, 1,
-0.4092253, 0.1091805, -1.181052, 0, 0, 0, 1, 1,
-0.4067382, 0.6031888, -0.9205948, 0, 0, 0, 1, 1,
-0.4011138, -0.2551382, -2.540573, 0, 0, 0, 1, 1,
-0.3958974, -0.6631308, -2.907591, 0, 0, 0, 1, 1,
-0.3943191, -0.5821235, -2.29322, 0, 0, 0, 1, 1,
-0.3921584, -1.389553, -2.433494, 1, 1, 1, 1, 1,
-0.3921027, 1.09606, -0.2749906, 1, 1, 1, 1, 1,
-0.3879684, -0.2631931, -2.465902, 1, 1, 1, 1, 1,
-0.3821449, 0.8221002, 0.1882374, 1, 1, 1, 1, 1,
-0.3775784, -0.5139135, -2.10465, 1, 1, 1, 1, 1,
-0.3749835, 0.6463354, -1.042693, 1, 1, 1, 1, 1,
-0.3698093, 0.1104382, -1.4564, 1, 1, 1, 1, 1,
-0.3675689, -0.651796, -2.83466, 1, 1, 1, 1, 1,
-0.3672157, 1.257055, 0.1451592, 1, 1, 1, 1, 1,
-0.367067, 1.088299, -0.03539603, 1, 1, 1, 1, 1,
-0.3660069, -0.275739, -3.001282, 1, 1, 1, 1, 1,
-0.3649926, -0.5350196, -2.938998, 1, 1, 1, 1, 1,
-0.3621064, -0.9886255, -2.096145, 1, 1, 1, 1, 1,
-0.360837, -1.001249, -4.329937, 1, 1, 1, 1, 1,
-0.3584387, -0.7706121, -3.384101, 1, 1, 1, 1, 1,
-0.35757, -0.1724235, -3.490783, 0, 0, 1, 1, 1,
-0.3534614, -1.056049, -0.5772254, 1, 0, 0, 1, 1,
-0.3513159, -0.6376828, -3.671543, 1, 0, 0, 1, 1,
-0.3444809, -0.1585934, -3.279923, 1, 0, 0, 1, 1,
-0.3438374, 0.9832531, -1.752614, 1, 0, 0, 1, 1,
-0.3359501, 0.7450453, -1.893477, 1, 0, 0, 1, 1,
-0.3316811, 0.6157027, -2.230362, 0, 0, 0, 1, 1,
-0.3296304, 0.1656774, -0.6484213, 0, 0, 0, 1, 1,
-0.3240966, -0.8070778, -4.576587, 0, 0, 0, 1, 1,
-0.3194115, 0.4402497, -1.571636, 0, 0, 0, 1, 1,
-0.3167653, -0.8014155, -2.847796, 0, 0, 0, 1, 1,
-0.3148216, -0.7879544, -2.580552, 0, 0, 0, 1, 1,
-0.3138013, 0.7148833, -1.333518, 0, 0, 0, 1, 1,
-0.3102103, 0.7049914, -1.082693, 1, 1, 1, 1, 1,
-0.3097789, -0.4252211, -2.703735, 1, 1, 1, 1, 1,
-0.3085686, -1.365783, -2.459103, 1, 1, 1, 1, 1,
-0.3075406, -1.268854, -2.069224, 1, 1, 1, 1, 1,
-0.3048751, -1.014337, -3.032963, 1, 1, 1, 1, 1,
-0.3048204, 1.091214, 1.094761, 1, 1, 1, 1, 1,
-0.3040119, 0.1113464, -1.230736, 1, 1, 1, 1, 1,
-0.3024568, 1.40891, -2.338029, 1, 1, 1, 1, 1,
-0.2992803, 0.629849, -0.2078193, 1, 1, 1, 1, 1,
-0.2972542, -0.9546543, -2.104833, 1, 1, 1, 1, 1,
-0.2957805, 1.342556, 0.2232206, 1, 1, 1, 1, 1,
-0.2929248, -1.889874, -2.082743, 1, 1, 1, 1, 1,
-0.2899514, 1.172383, -0.1004029, 1, 1, 1, 1, 1,
-0.2866028, -0.1361093, -1.102039, 1, 1, 1, 1, 1,
-0.2833627, -0.3240533, -0.8567478, 1, 1, 1, 1, 1,
-0.2827828, -0.7684312, -3.018336, 0, 0, 1, 1, 1,
-0.2818407, 1.058041, -1.277948, 1, 0, 0, 1, 1,
-0.2732769, 1.584996, -1.270431, 1, 0, 0, 1, 1,
-0.270094, -0.9472923, -2.00399, 1, 0, 0, 1, 1,
-0.2667839, -0.01264404, -1.223786, 1, 0, 0, 1, 1,
-0.2655966, -0.05733447, -2.055581, 1, 0, 0, 1, 1,
-0.26522, 0.3678023, -1.658298, 0, 0, 0, 1, 1,
-0.2646932, -0.4682535, -0.8140889, 0, 0, 0, 1, 1,
-0.2629049, -0.8764378, -3.180933, 0, 0, 0, 1, 1,
-0.2618839, -0.5425035, -3.009184, 0, 0, 0, 1, 1,
-0.261185, -0.488305, -3.202409, 0, 0, 0, 1, 1,
-0.2600015, 1.167351, -1.50249, 0, 0, 0, 1, 1,
-0.258426, -0.2216937, -2.655069, 0, 0, 0, 1, 1,
-0.2558644, 0.7590352, -0.552281, 1, 1, 1, 1, 1,
-0.2550942, -0.0111328, -1.594237, 1, 1, 1, 1, 1,
-0.2531429, 0.1029431, -3.219687, 1, 1, 1, 1, 1,
-0.2500844, -0.3749286, -2.026501, 1, 1, 1, 1, 1,
-0.2499504, -1.14425, -3.70854, 1, 1, 1, 1, 1,
-0.2471284, -0.05767195, -1.379193, 1, 1, 1, 1, 1,
-0.2454281, 0.1515108, -0.7058016, 1, 1, 1, 1, 1,
-0.2427507, -1.35552, -1.99662, 1, 1, 1, 1, 1,
-0.2427506, 0.07414155, -1.17983, 1, 1, 1, 1, 1,
-0.2393598, -0.384092, -1.040326, 1, 1, 1, 1, 1,
-0.2385149, 0.4206485, -0.3273234, 1, 1, 1, 1, 1,
-0.2382571, 1.400707, -0.6221559, 1, 1, 1, 1, 1,
-0.236296, -1.062841, -2.396162, 1, 1, 1, 1, 1,
-0.236211, -0.3692457, -2.885539, 1, 1, 1, 1, 1,
-0.2334694, 0.05518129, -0.5208169, 1, 1, 1, 1, 1,
-0.2329326, -1.002697, -1.846706, 0, 0, 1, 1, 1,
-0.2310541, -0.2833351, -2.663776, 1, 0, 0, 1, 1,
-0.2257919, 1.518983, -0.02696582, 1, 0, 0, 1, 1,
-0.2140649, -0.9264506, -4.273194, 1, 0, 0, 1, 1,
-0.2122681, -0.1577511, -3.306861, 1, 0, 0, 1, 1,
-0.2019191, -1.856637, -1.50838, 1, 0, 0, 1, 1,
-0.1983723, -0.4378751, -2.406611, 0, 0, 0, 1, 1,
-0.1977477, -0.1043706, -2.064059, 0, 0, 0, 1, 1,
-0.1972689, -0.5428959, -4.337657, 0, 0, 0, 1, 1,
-0.1937467, 0.2509452, -0.05855584, 0, 0, 0, 1, 1,
-0.1908839, -0.2373042, -1.912928, 0, 0, 0, 1, 1,
-0.176807, 0.3234311, 1.190711, 0, 0, 0, 1, 1,
-0.1716368, -0.9011084, -4.029797, 0, 0, 0, 1, 1,
-0.170703, -1.563168, -3.889727, 1, 1, 1, 1, 1,
-0.1645881, 0.5928194, -0.7145236, 1, 1, 1, 1, 1,
-0.162413, -1.53968, -3.548723, 1, 1, 1, 1, 1,
-0.1543947, -1.385259, -3.074606, 1, 1, 1, 1, 1,
-0.1477569, -0.8687745, -4.03926, 1, 1, 1, 1, 1,
-0.1370151, 0.6243978, -0.2923812, 1, 1, 1, 1, 1,
-0.1288519, 0.3864059, -0.2989109, 1, 1, 1, 1, 1,
-0.1250513, 0.9038737, 0.193722, 1, 1, 1, 1, 1,
-0.11464, 1.250274, -1.726878, 1, 1, 1, 1, 1,
-0.1143127, -2.221526, -0.9464453, 1, 1, 1, 1, 1,
-0.1127552, -0.2991734, -4.833459, 1, 1, 1, 1, 1,
-0.1110317, -0.07366613, -1.875702, 1, 1, 1, 1, 1,
-0.10907, -1.130389, -4.035456, 1, 1, 1, 1, 1,
-0.1059044, 0.4118907, 0.04544849, 1, 1, 1, 1, 1,
-0.104238, 1.721546, -2.052752, 1, 1, 1, 1, 1,
-0.1015383, -0.02959162, -1.906763, 0, 0, 1, 1, 1,
-0.1014906, -0.3430441, -2.554827, 1, 0, 0, 1, 1,
-0.09862494, -0.3877946, -1.754614, 1, 0, 0, 1, 1,
-0.09796129, 0.06787858, -0.9195585, 1, 0, 0, 1, 1,
-0.09713931, 0.9375214, -0.06860904, 1, 0, 0, 1, 1,
-0.09711736, -0.1172143, -2.293185, 1, 0, 0, 1, 1,
-0.09204905, 0.1281717, -0.5649826, 0, 0, 0, 1, 1,
-0.0896677, -0.4388402, -3.765649, 0, 0, 0, 1, 1,
-0.08735276, 1.411303, -1.04403, 0, 0, 0, 1, 1,
-0.08376185, 1.201929, -0.7972232, 0, 0, 0, 1, 1,
-0.08176009, -1.833264, -3.62574, 0, 0, 0, 1, 1,
-0.0813136, -1.937855, -0.8760604, 0, 0, 0, 1, 1,
-0.07786693, 2.165357, 0.2231576, 0, 0, 0, 1, 1,
-0.0749414, -1.65752, -2.296798, 1, 1, 1, 1, 1,
-0.07425766, -0.126829, -3.659899, 1, 1, 1, 1, 1,
-0.0740184, -1.269089, -4.367251, 1, 1, 1, 1, 1,
-0.06449263, 0.2123631, 0.7603111, 1, 1, 1, 1, 1,
-0.06367139, 0.123134, -1.178317, 1, 1, 1, 1, 1,
-0.05602669, 0.1060911, -2.026267, 1, 1, 1, 1, 1,
-0.05543645, -0.1550516, -3.33099, 1, 1, 1, 1, 1,
-0.05465936, -0.1085877, -4.218446, 1, 1, 1, 1, 1,
-0.04855771, 1.698505, -0.2747793, 1, 1, 1, 1, 1,
-0.04096078, 1.561761, -1.594252, 1, 1, 1, 1, 1,
-0.03726717, 0.3558588, 0.3591142, 1, 1, 1, 1, 1,
-0.03672311, 1.234662, 0.121903, 1, 1, 1, 1, 1,
-0.02894241, -1.696867, -3.561858, 1, 1, 1, 1, 1,
-0.02769392, 1.076958, 0.2133435, 1, 1, 1, 1, 1,
-0.02727956, 0.04182859, 0.2320646, 1, 1, 1, 1, 1,
-0.02107158, -0.1410418, -1.662141, 0, 0, 1, 1, 1,
-0.02040284, 0.5726326, 0.1304625, 1, 0, 0, 1, 1,
-0.0179204, -0.8791824, -4.513145, 1, 0, 0, 1, 1,
-0.0175144, 0.2792597, 0.7274722, 1, 0, 0, 1, 1,
-0.01685865, 0.1032069, 0.6812089, 1, 0, 0, 1, 1,
-0.01421434, -1.144997, -3.322942, 1, 0, 0, 1, 1,
-0.01311721, -1.441631, -2.401609, 0, 0, 0, 1, 1,
-0.008458536, -0.3692153, -2.708998, 0, 0, 0, 1, 1,
-0.004334682, 1.006455, 1.089938, 0, 0, 0, 1, 1,
-0.003654883, 0.5346844, -0.9695808, 0, 0, 0, 1, 1,
0.0006271211, -0.3668207, 2.923083, 0, 0, 0, 1, 1,
0.0008082098, 0.04086798, 0.1390618, 0, 0, 0, 1, 1,
0.001043989, -0.5051036, 3.372244, 0, 0, 0, 1, 1,
0.008530286, -0.5515916, 3.494412, 1, 1, 1, 1, 1,
0.01047875, -0.5653232, 2.43138, 1, 1, 1, 1, 1,
0.01120142, -0.2684712, 2.464324, 1, 1, 1, 1, 1,
0.01248438, 0.1966819, 0.6499527, 1, 1, 1, 1, 1,
0.01589182, -0.07139747, 3.819614, 1, 1, 1, 1, 1,
0.02090852, -1.420825, 4.472187, 1, 1, 1, 1, 1,
0.02198638, -0.01627762, 1.762321, 1, 1, 1, 1, 1,
0.02446024, 0.1212618, -0.8340837, 1, 1, 1, 1, 1,
0.02715152, -2.092627, 4.432565, 1, 1, 1, 1, 1,
0.02795387, 1.291083, 0.5334079, 1, 1, 1, 1, 1,
0.03259531, 1.024849, 0.8908178, 1, 1, 1, 1, 1,
0.0363013, -0.1973346, 1.049928, 1, 1, 1, 1, 1,
0.03781787, 1.10595, 0.3135978, 1, 1, 1, 1, 1,
0.0406695, 0.769854, 2.791308, 1, 1, 1, 1, 1,
0.04139117, -0.2314499, 2.181924, 1, 1, 1, 1, 1,
0.04178002, -0.9905812, 2.713396, 0, 0, 1, 1, 1,
0.04277288, 1.518796, -0.3586188, 1, 0, 0, 1, 1,
0.0446096, 0.390225, -2.200492, 1, 0, 0, 1, 1,
0.04539421, 0.514475, -0.5705104, 1, 0, 0, 1, 1,
0.04834301, -0.3230065, 3.602163, 1, 0, 0, 1, 1,
0.04936533, 2.753764, 0.2366539, 1, 0, 0, 1, 1,
0.04939694, -0.3631199, 3.105628, 0, 0, 0, 1, 1,
0.0588312, -0.8777286, 1.423378, 0, 0, 0, 1, 1,
0.05894258, 0.2090613, 1.200513, 0, 0, 0, 1, 1,
0.06346034, 0.482246, 0.944243, 0, 0, 0, 1, 1,
0.06447589, -1.624964, 2.032766, 0, 0, 0, 1, 1,
0.06983269, 0.03508007, 1.360129, 0, 0, 0, 1, 1,
0.07012046, -0.2214966, 1.614187, 0, 0, 0, 1, 1,
0.0705124, -0.818134, 2.853031, 1, 1, 1, 1, 1,
0.07163395, -0.34159, 3.231955, 1, 1, 1, 1, 1,
0.07461688, -0.6515921, 3.907175, 1, 1, 1, 1, 1,
0.07797498, -0.2987488, 2.158075, 1, 1, 1, 1, 1,
0.07841636, 0.3432734, -0.4590586, 1, 1, 1, 1, 1,
0.08308906, 2.130094, -0.2839919, 1, 1, 1, 1, 1,
0.08362585, 1.365063, -0.9385228, 1, 1, 1, 1, 1,
0.08456182, 1.087951, 0.1816596, 1, 1, 1, 1, 1,
0.09361164, -0.5487298, 1.883747, 1, 1, 1, 1, 1,
0.09521379, 0.1594878, 1.15504, 1, 1, 1, 1, 1,
0.1049833, 0.5843099, 0.2944789, 1, 1, 1, 1, 1,
0.1095554, 1.312441, -1.652512, 1, 1, 1, 1, 1,
0.1109702, 0.7333317, 1.30273, 1, 1, 1, 1, 1,
0.1127531, -1.346946, 1.568937, 1, 1, 1, 1, 1,
0.1141148, 0.9233546, 0.801351, 1, 1, 1, 1, 1,
0.1161619, 0.2794715, 0.5259153, 0, 0, 1, 1, 1,
0.1183852, -0.9517513, 1.565761, 1, 0, 0, 1, 1,
0.1210868, -0.07852493, 2.126868, 1, 0, 0, 1, 1,
0.1220308, 0.5107173, 0.06532486, 1, 0, 0, 1, 1,
0.1252669, -0.5483697, 2.376068, 1, 0, 0, 1, 1,
0.1257381, -0.5718114, 1.83877, 1, 0, 0, 1, 1,
0.1297706, 1.346522, 0.9328759, 0, 0, 0, 1, 1,
0.1300344, -1.424267, 3.796698, 0, 0, 0, 1, 1,
0.1324271, 0.3133596, 0.6472735, 0, 0, 0, 1, 1,
0.1378326, -0.1570028, 3.131408, 0, 0, 0, 1, 1,
0.1381589, 2.801033, 1.776489, 0, 0, 0, 1, 1,
0.1403832, -0.9815696, 3.782682, 0, 0, 0, 1, 1,
0.140879, -2.78322, 5.041636, 0, 0, 0, 1, 1,
0.1416826, -0.07920261, 0.657828, 1, 1, 1, 1, 1,
0.1427314, -1.387075, 5.793581, 1, 1, 1, 1, 1,
0.1428963, -0.6523154, 0.9174293, 1, 1, 1, 1, 1,
0.1429969, -0.6205739, 3.777718, 1, 1, 1, 1, 1,
0.1431863, -0.3568944, 2.02781, 1, 1, 1, 1, 1,
0.1472046, 1.118515, -0.5186335, 1, 1, 1, 1, 1,
0.1485336, 2.169214, -0.8955653, 1, 1, 1, 1, 1,
0.148574, 2.73085, 1.535584, 1, 1, 1, 1, 1,
0.1496616, -0.3733737, 1.957472, 1, 1, 1, 1, 1,
0.1516901, -0.1076693, 1.421469, 1, 1, 1, 1, 1,
0.152393, 0.3649937, 1.785392, 1, 1, 1, 1, 1,
0.1620177, 0.1918723, 0.08059203, 1, 1, 1, 1, 1,
0.1651793, 0.7369587, -0.2495365, 1, 1, 1, 1, 1,
0.1669347, 1.387681, -0.5143033, 1, 1, 1, 1, 1,
0.179846, 0.4654557, -0.5964122, 1, 1, 1, 1, 1,
0.1833636, 1.834648, -1.905754, 0, 0, 1, 1, 1,
0.1848104, -1.023893, 3.217276, 1, 0, 0, 1, 1,
0.1951142, 2.359177, 1.886367, 1, 0, 0, 1, 1,
0.1981101, -0.9507779, 2.484032, 1, 0, 0, 1, 1,
0.2029457, -0.1188631, 1.882539, 1, 0, 0, 1, 1,
0.2039737, -0.9535506, 2.56302, 1, 0, 0, 1, 1,
0.2053055, 1.803606, 0.4784744, 0, 0, 0, 1, 1,
0.2054146, -0.443835, 1.962156, 0, 0, 0, 1, 1,
0.2055908, -0.2487283, 2.278003, 0, 0, 0, 1, 1,
0.2056178, -1.081035, 2.500763, 0, 0, 0, 1, 1,
0.2060219, -0.323366, 3.546546, 0, 0, 0, 1, 1,
0.2177576, -0.603631, 3.315906, 0, 0, 0, 1, 1,
0.2202105, -0.5227582, 2.028114, 0, 0, 0, 1, 1,
0.2243774, -0.1927767, 4.224925, 1, 1, 1, 1, 1,
0.2253612, -1.378043, 3.535522, 1, 1, 1, 1, 1,
0.2280825, 0.1109174, 2.344654, 1, 1, 1, 1, 1,
0.2331488, -1.904178, 3.131081, 1, 1, 1, 1, 1,
0.2332211, -0.1763177, 2.265298, 1, 1, 1, 1, 1,
0.2347062, -0.1854413, 2.257345, 1, 1, 1, 1, 1,
0.2364983, 1.412891, 1.253859, 1, 1, 1, 1, 1,
0.2395752, 1.909182, 0.02613227, 1, 1, 1, 1, 1,
0.241373, -0.6938689, 1.690754, 1, 1, 1, 1, 1,
0.2421044, -1.515541, 1.789739, 1, 1, 1, 1, 1,
0.2443323, -0.1736263, 2.775228, 1, 1, 1, 1, 1,
0.2476215, 1.439972, -1.228051, 1, 1, 1, 1, 1,
0.2532892, 1.813234, 0.3732075, 1, 1, 1, 1, 1,
0.253365, -0.5462543, 1.206477, 1, 1, 1, 1, 1,
0.2572377, 0.1394812, 2.558356, 1, 1, 1, 1, 1,
0.2611535, -0.3496074, 1.476772, 0, 0, 1, 1, 1,
0.2637277, 1.309578, 0.5138345, 1, 0, 0, 1, 1,
0.2638397, 1.338786, -2.200627, 1, 0, 0, 1, 1,
0.2657164, -0.1972247, 1.54305, 1, 0, 0, 1, 1,
0.2672631, 0.5342115, -0.3105779, 1, 0, 0, 1, 1,
0.2681679, 0.6389204, 1.215344, 1, 0, 0, 1, 1,
0.2747853, 0.4720911, 1.741726, 0, 0, 0, 1, 1,
0.2817508, 2.297154, -0.2552134, 0, 0, 0, 1, 1,
0.2875659, 0.8227822, -0.8010194, 0, 0, 0, 1, 1,
0.2947909, -0.4838475, 4.457504, 0, 0, 0, 1, 1,
0.2980365, 0.2199612, 2.345143, 0, 0, 0, 1, 1,
0.3003898, 0.2049235, -1.340102, 0, 0, 0, 1, 1,
0.3031092, -0.2827013, 2.591094, 0, 0, 0, 1, 1,
0.3078028, 1.547263, -0.7305902, 1, 1, 1, 1, 1,
0.309301, -0.8079576, 1.087917, 1, 1, 1, 1, 1,
0.3131277, -0.5091975, 2.729934, 1, 1, 1, 1, 1,
0.3156324, -0.24628, 2.22285, 1, 1, 1, 1, 1,
0.3217053, -0.4165607, 3.004027, 1, 1, 1, 1, 1,
0.3247009, 1.038763, 1.028245, 1, 1, 1, 1, 1,
0.332306, -0.3634436, 1.885614, 1, 1, 1, 1, 1,
0.3333428, 0.2140653, 2.302391, 1, 1, 1, 1, 1,
0.3349442, 1.843099, -1.158774, 1, 1, 1, 1, 1,
0.335346, -0.8596945, 1.507986, 1, 1, 1, 1, 1,
0.3358568, -0.09934315, 1.518249, 1, 1, 1, 1, 1,
0.3409635, -0.9902827, 0.1439101, 1, 1, 1, 1, 1,
0.3430003, -0.7755893, 3.49341, 1, 1, 1, 1, 1,
0.3440815, -0.6578822, 3.574076, 1, 1, 1, 1, 1,
0.3513002, -0.1950301, 2.024373, 1, 1, 1, 1, 1,
0.3518266, 0.1894558, 0.331269, 0, 0, 1, 1, 1,
0.3563725, 0.4454259, 0.980533, 1, 0, 0, 1, 1,
0.3573287, 0.4102905, -0.10623, 1, 0, 0, 1, 1,
0.3590898, -0.3013938, 2.367301, 1, 0, 0, 1, 1,
0.3609369, 1.960444, -0.6033452, 1, 0, 0, 1, 1,
0.363278, -1.631235, 3.313886, 1, 0, 0, 1, 1,
0.3675915, -0.1559045, 1.767394, 0, 0, 0, 1, 1,
0.3679765, 0.05306863, 1.032215, 0, 0, 0, 1, 1,
0.3719197, -0.2675804, 1.049119, 0, 0, 0, 1, 1,
0.3723856, -1.727696, 1.451731, 0, 0, 0, 1, 1,
0.3727053, -0.463835, 3.293731, 0, 0, 0, 1, 1,
0.3779273, -0.8962489, 2.627864, 0, 0, 0, 1, 1,
0.3823448, -1.292023, 2.13838, 0, 0, 0, 1, 1,
0.3845942, 0.8909159, -0.1531594, 1, 1, 1, 1, 1,
0.3857726, -1.503217, 3.902132, 1, 1, 1, 1, 1,
0.3906709, -1.25644, 3.791449, 1, 1, 1, 1, 1,
0.3945279, 0.46714, 3.474619, 1, 1, 1, 1, 1,
0.3950042, 0.5396735, 0.9422235, 1, 1, 1, 1, 1,
0.3971857, -0.5260205, 2.717141, 1, 1, 1, 1, 1,
0.3973795, 1.139293, 1.078559, 1, 1, 1, 1, 1,
0.4009623, -0.3140446, 3.626915, 1, 1, 1, 1, 1,
0.4028016, 0.5043286, 0.9428532, 1, 1, 1, 1, 1,
0.4039845, -0.7011026, 3.427294, 1, 1, 1, 1, 1,
0.4085172, 1.469498, -0.9428124, 1, 1, 1, 1, 1,
0.4113348, -0.03696348, 2.241006, 1, 1, 1, 1, 1,
0.4119313, 0.5665211, -0.7196322, 1, 1, 1, 1, 1,
0.4123375, -2.089736, 1.21031, 1, 1, 1, 1, 1,
0.4132771, 0.07288468, 0.9105603, 1, 1, 1, 1, 1,
0.4156406, 0.08524061, 1.273638, 0, 0, 1, 1, 1,
0.4172001, 0.1010588, 0.6646465, 1, 0, 0, 1, 1,
0.4205002, 0.4368236, 0.5148862, 1, 0, 0, 1, 1,
0.4209782, -0.6991715, 1.876256, 1, 0, 0, 1, 1,
0.4215294, -2.297593, 4.353926, 1, 0, 0, 1, 1,
0.4254864, -0.4251302, 1.412427, 1, 0, 0, 1, 1,
0.426458, -1.892143, 4.366413, 0, 0, 0, 1, 1,
0.4264718, -0.6032794, 2.961461, 0, 0, 0, 1, 1,
0.4282673, -0.01330438, 2.131192, 0, 0, 0, 1, 1,
0.4286773, -0.5011941, 1.286271, 0, 0, 0, 1, 1,
0.4321648, -1.691533, 2.602385, 0, 0, 0, 1, 1,
0.4349112, -0.7195539, 2.140198, 0, 0, 0, 1, 1,
0.440195, -0.3880994, 2.660941, 0, 0, 0, 1, 1,
0.4403241, -1.746892, 3.448861, 1, 1, 1, 1, 1,
0.442066, -1.055427, 4.567405, 1, 1, 1, 1, 1,
0.4479752, 1.207981, -1.19054, 1, 1, 1, 1, 1,
0.4495039, 0.9797475, 0.7460042, 1, 1, 1, 1, 1,
0.4523217, -0.3056431, 2.814594, 1, 1, 1, 1, 1,
0.4534167, 0.1249749, 2.484365, 1, 1, 1, 1, 1,
0.4560555, -0.5565787, 2.751873, 1, 1, 1, 1, 1,
0.4586074, 0.3738463, 0.03988975, 1, 1, 1, 1, 1,
0.4597679, -0.3199873, 1.673845, 1, 1, 1, 1, 1,
0.461415, 0.5544746, 0.2306387, 1, 1, 1, 1, 1,
0.4627744, -0.55071, 1.53982, 1, 1, 1, 1, 1,
0.4634296, -2.289089, 3.651979, 1, 1, 1, 1, 1,
0.4636148, 0.5741, 2.70748, 1, 1, 1, 1, 1,
0.468321, -0.8607741, 2.441831, 1, 1, 1, 1, 1,
0.4710867, -0.2260811, 0.2560069, 1, 1, 1, 1, 1,
0.4737531, 0.6750473, -0.05274904, 0, 0, 1, 1, 1,
0.479897, 0.1199551, 1.689378, 1, 0, 0, 1, 1,
0.4807356, 1.328858, 0.1157695, 1, 0, 0, 1, 1,
0.483366, 0.6576615, 1.718972, 1, 0, 0, 1, 1,
0.4834814, -1.002713, 3.031229, 1, 0, 0, 1, 1,
0.4837916, -0.4108857, 3.02862, 1, 0, 0, 1, 1,
0.4872928, 0.5842065, 1.817573, 0, 0, 0, 1, 1,
0.4899569, 2.38789, -0.1272808, 0, 0, 0, 1, 1,
0.4900869, 0.7888612, -9.954499e-06, 0, 0, 0, 1, 1,
0.4923189, 1.23229, 0.2508213, 0, 0, 0, 1, 1,
0.4938134, -0.8228177, 2.299616, 0, 0, 0, 1, 1,
0.4972913, -1.17794, 1.714894, 0, 0, 0, 1, 1,
0.4991848, -1.626616, 2.891395, 0, 0, 0, 1, 1,
0.4994585, -1.317711, 1.501889, 1, 1, 1, 1, 1,
0.5000424, -0.7871462, 2.020568, 1, 1, 1, 1, 1,
0.5016964, 1.964961, -0.5147231, 1, 1, 1, 1, 1,
0.5028406, 0.5733138, 0.09998885, 1, 1, 1, 1, 1,
0.507292, -1.392501, 2.114947, 1, 1, 1, 1, 1,
0.5075285, -0.8719795, 2.777025, 1, 1, 1, 1, 1,
0.5101601, 2.574491, 0.05642384, 1, 1, 1, 1, 1,
0.5107961, -0.2773482, 1.642012, 1, 1, 1, 1, 1,
0.5138059, -2.240227, 2.646028, 1, 1, 1, 1, 1,
0.5160314, -0.83502, 3.037211, 1, 1, 1, 1, 1,
0.5220826, -0.3915684, 1.333284, 1, 1, 1, 1, 1,
0.5234857, -0.6357069, 3.514885, 1, 1, 1, 1, 1,
0.5293347, -0.6269184, 1.669539, 1, 1, 1, 1, 1,
0.532356, -0.4528389, 2.230007, 1, 1, 1, 1, 1,
0.5325424, 1.317913, 0.02756319, 1, 1, 1, 1, 1,
0.532795, -0.04537974, 1.050403, 0, 0, 1, 1, 1,
0.5347857, 0.6484503, -0.1329779, 1, 0, 0, 1, 1,
0.5375088, 0.2125676, 0.3349538, 1, 0, 0, 1, 1,
0.5389412, 0.1262331, 1.725652, 1, 0, 0, 1, 1,
0.5439479, 0.8253296, 0.6531247, 1, 0, 0, 1, 1,
0.5466424, 1.355421, 0.04394877, 1, 0, 0, 1, 1,
0.5488204, 1.538511, -0.3000839, 0, 0, 0, 1, 1,
0.5492678, -1.150684, 1.090572, 0, 0, 0, 1, 1,
0.5495766, 0.05353864, 1.706449, 0, 0, 0, 1, 1,
0.549633, -2.139481, 1.974021, 0, 0, 0, 1, 1,
0.5514303, -2.564468, 3.342532, 0, 0, 0, 1, 1,
0.5535267, 0.4314035, 2.25912, 0, 0, 0, 1, 1,
0.5541086, -0.3221256, 2.429745, 0, 0, 0, 1, 1,
0.5569481, 0.0896832, 0.4266417, 1, 1, 1, 1, 1,
0.5578954, -0.4685511, 1.56098, 1, 1, 1, 1, 1,
0.561119, 1.135142, -0.4063693, 1, 1, 1, 1, 1,
0.564997, 0.07649477, 2.673321, 1, 1, 1, 1, 1,
0.5659134, 0.1244172, 2.764491, 1, 1, 1, 1, 1,
0.5761622, -1.270153, 4.090101, 1, 1, 1, 1, 1,
0.5767861, -0.3748578, 2.059049, 1, 1, 1, 1, 1,
0.5770431, -1.47112, 3.210648, 1, 1, 1, 1, 1,
0.5827733, -0.5469401, 2.502619, 1, 1, 1, 1, 1,
0.584376, 0.5236928, 1.543343, 1, 1, 1, 1, 1,
0.5850702, -1.327721, 2.35182, 1, 1, 1, 1, 1,
0.5851346, -1.035454, 1.553915, 1, 1, 1, 1, 1,
0.5999413, -0.8152568, 3.933712, 1, 1, 1, 1, 1,
0.6036213, -0.140287, 1.53398, 1, 1, 1, 1, 1,
0.6037536, 1.623512, 1.678146, 1, 1, 1, 1, 1,
0.6045394, -0.5650243, 2.546652, 0, 0, 1, 1, 1,
0.6069378, 0.01372998, 2.576071, 1, 0, 0, 1, 1,
0.6074895, -0.6536576, 0.05550246, 1, 0, 0, 1, 1,
0.6080414, 1.106799, 0.5341487, 1, 0, 0, 1, 1,
0.6121827, 0.4101259, -0.181272, 1, 0, 0, 1, 1,
0.6250476, -0.4776962, 1.535579, 1, 0, 0, 1, 1,
0.6260483, -0.4066664, 2.86015, 0, 0, 0, 1, 1,
0.6275644, -0.8570462, 2.396098, 0, 0, 0, 1, 1,
0.633426, 1.000988, 0.01985606, 0, 0, 0, 1, 1,
0.6363932, 1.088189, -0.874703, 0, 0, 0, 1, 1,
0.6420193, 1.46346, -0.1395922, 0, 0, 0, 1, 1,
0.6562078, -0.8505132, 2.809545, 0, 0, 0, 1, 1,
0.6597009, -0.2294208, 2.968997, 0, 0, 0, 1, 1,
0.6600424, -0.94486, 0.08795755, 1, 1, 1, 1, 1,
0.6639232, -0.938238, 1.67413, 1, 1, 1, 1, 1,
0.6648894, 0.2883278, -0.07028826, 1, 1, 1, 1, 1,
0.6685213, -0.6372002, 0.2042078, 1, 1, 1, 1, 1,
0.6717174, -0.1372202, 1.385429, 1, 1, 1, 1, 1,
0.6751466, -2.003343, 4.90541, 1, 1, 1, 1, 1,
0.6752187, 0.5432173, 2.723115, 1, 1, 1, 1, 1,
0.6765912, -1.371154, 2.702637, 1, 1, 1, 1, 1,
0.6820872, 0.4444945, -0.6016749, 1, 1, 1, 1, 1,
0.6964449, 1.804033, 1.013366, 1, 1, 1, 1, 1,
0.6974401, 0.1348598, 1.163164, 1, 1, 1, 1, 1,
0.701131, 0.9562835, 1.165495, 1, 1, 1, 1, 1,
0.7012416, 1.487854, 0.5456282, 1, 1, 1, 1, 1,
0.7048621, -1.529982, 3.588121, 1, 1, 1, 1, 1,
0.7072822, -0.5193445, 0.7698626, 1, 1, 1, 1, 1,
0.7100549, -1.325958, 2.07623, 0, 0, 1, 1, 1,
0.7106834, 1.278962, -0.1589691, 1, 0, 0, 1, 1,
0.710977, 0.3391456, 1.361549, 1, 0, 0, 1, 1,
0.7138668, 0.8128764, 0.9566195, 1, 0, 0, 1, 1,
0.7150963, -0.9525272, 3.224994, 1, 0, 0, 1, 1,
0.7186176, -0.8220717, 1.660647, 1, 0, 0, 1, 1,
0.7190544, -0.650546, 1.173624, 0, 0, 0, 1, 1,
0.7191015, -1.593679, 1.138182, 0, 0, 0, 1, 1,
0.7196875, -1.040366, 2.070185, 0, 0, 0, 1, 1,
0.722623, -0.1463753, 2.401741, 0, 0, 0, 1, 1,
0.7290353, 0.6754495, 0.03647875, 0, 0, 0, 1, 1,
0.7296743, 0.6556041, 1.046449, 0, 0, 0, 1, 1,
0.7298215, -0.9962894, 4.534605, 0, 0, 0, 1, 1,
0.7329404, 0.6056141, -0.4842386, 1, 1, 1, 1, 1,
0.7339323, -1.11033, 1.820145, 1, 1, 1, 1, 1,
0.7347625, 1.15582, 1.74779, 1, 1, 1, 1, 1,
0.7365127, -2.193945, 3.424411, 1, 1, 1, 1, 1,
0.7403644, -1.116775, 1.592123, 1, 1, 1, 1, 1,
0.743061, 1.005022, -0.9895626, 1, 1, 1, 1, 1,
0.7538694, 1.059481, -0.1425434, 1, 1, 1, 1, 1,
0.7543877, 0.1012251, 2.143544, 1, 1, 1, 1, 1,
0.7580127, 0.862188, 0.9412398, 1, 1, 1, 1, 1,
0.7603157, -0.7364246, 3.089201, 1, 1, 1, 1, 1,
0.7636303, -0.9009565, 2.642377, 1, 1, 1, 1, 1,
0.7641789, -0.8757626, 2.855269, 1, 1, 1, 1, 1,
0.7781788, 0.9445978, 0.9359996, 1, 1, 1, 1, 1,
0.7836455, 0.6111794, 1.063097, 1, 1, 1, 1, 1,
0.7844468, -0.1721891, 2.837093, 1, 1, 1, 1, 1,
0.792434, -0.6284116, 1.990171, 0, 0, 1, 1, 1,
0.7948568, -0.5487932, 1.037093, 1, 0, 0, 1, 1,
0.7964558, 1.122549, -0.6122536, 1, 0, 0, 1, 1,
0.8026013, 0.6758226, 0.6985281, 1, 0, 0, 1, 1,
0.8030736, 1.986452, 2.155091, 1, 0, 0, 1, 1,
0.8046337, 0.1432498, 1.560771, 1, 0, 0, 1, 1,
0.821667, -2.384962, 2.82682, 0, 0, 0, 1, 1,
0.8250573, 1.037048, 0.6877689, 0, 0, 0, 1, 1,
0.8264989, -0.525116, 3.012005, 0, 0, 0, 1, 1,
0.8324828, -0.7580122, 1.65426, 0, 0, 0, 1, 1,
0.8420854, 0.7413953, 0.5914611, 0, 0, 0, 1, 1,
0.8454193, -1.764966, 2.259849, 0, 0, 0, 1, 1,
0.8498991, 1.336693, 0.7885007, 0, 0, 0, 1, 1,
0.853629, -0.5497991, 3.187125, 1, 1, 1, 1, 1,
0.8552806, -0.2427302, 3.589848, 1, 1, 1, 1, 1,
0.8567656, -0.7436694, 1.908635, 1, 1, 1, 1, 1,
0.8582142, 1.222115, 0.01890511, 1, 1, 1, 1, 1,
0.8583618, 1.281484, -0.5095761, 1, 1, 1, 1, 1,
0.859077, 3.361257, -0.06302848, 1, 1, 1, 1, 1,
0.85988, 1.102994, 2.203092, 1, 1, 1, 1, 1,
0.8611399, -0.940406, 3.363641, 1, 1, 1, 1, 1,
0.8710437, -1.242456, 2.269795, 1, 1, 1, 1, 1,
0.8714438, 0.4546362, 0.3683385, 1, 1, 1, 1, 1,
0.8725729, -0.3431349, -0.8470373, 1, 1, 1, 1, 1,
0.8743172, -0.2380372, 2.795913, 1, 1, 1, 1, 1,
0.87692, 0.9184963, 1.647351, 1, 1, 1, 1, 1,
0.8786883, -1.124613, 2.302243, 1, 1, 1, 1, 1,
0.8788832, -0.5035164, 2.382611, 1, 1, 1, 1, 1,
0.8820825, 0.0415058, 0.243668, 0, 0, 1, 1, 1,
0.8834839, -1.107958, 2.777455, 1, 0, 0, 1, 1,
0.8909026, 0.04592409, 2.455686, 1, 0, 0, 1, 1,
0.8912063, 1.412794, 0.6032906, 1, 0, 0, 1, 1,
0.8927936, 0.8206246, 3.568341, 1, 0, 0, 1, 1,
0.8949994, 0.5404426, 0.2524103, 1, 0, 0, 1, 1,
0.8963566, 1.048409, -0.1021616, 0, 0, 0, 1, 1,
0.8967192, 0.02884153, -0.5616598, 0, 0, 0, 1, 1,
0.8970147, 0.09877378, 0.8195814, 0, 0, 0, 1, 1,
0.9046712, 0.1280022, 1.26476, 0, 0, 0, 1, 1,
0.9058687, -0.002784559, 1.583493, 0, 0, 0, 1, 1,
0.9062858, 0.8779216, 2.370855, 0, 0, 0, 1, 1,
0.9081639, 0.767463, 1.581451, 0, 0, 0, 1, 1,
0.910635, 0.4320313, 1.220866, 1, 1, 1, 1, 1,
0.9128891, -0.2421862, 1.432276, 1, 1, 1, 1, 1,
0.9171579, 0.3816729, -0.007847573, 1, 1, 1, 1, 1,
0.9186231, 0.4627374, 1.981909, 1, 1, 1, 1, 1,
0.9257694, -0.3436737, 1.184354, 1, 1, 1, 1, 1,
0.9362683, 0.8595829, 1.88988, 1, 1, 1, 1, 1,
0.9469897, 1.71265, 1.958548, 1, 1, 1, 1, 1,
0.9484049, 0.2598249, 1.935816, 1, 1, 1, 1, 1,
0.9505612, 1.083429, -0.2995936, 1, 1, 1, 1, 1,
0.9509683, -0.2366644, 2.890037, 1, 1, 1, 1, 1,
0.9536688, 1.899514, -1.174794, 1, 1, 1, 1, 1,
0.9540237, -0.3315871, 2.969208, 1, 1, 1, 1, 1,
0.9555832, -0.1315475, -0.2606266, 1, 1, 1, 1, 1,
0.9558534, -2.80762, 2.001996, 1, 1, 1, 1, 1,
0.9607577, -0.4741726, 2.539797, 1, 1, 1, 1, 1,
0.9701368, 0.2080427, 1.19562, 0, 0, 1, 1, 1,
0.9711877, -1.839978, 2.054758, 1, 0, 0, 1, 1,
0.9747412, 1.273788, 2.428342, 1, 0, 0, 1, 1,
0.9788883, 1.476092, -0.04971859, 1, 0, 0, 1, 1,
0.9942922, -0.6521979, 1.387996, 1, 0, 0, 1, 1,
0.9948752, -0.6039852, 3.424028, 1, 0, 0, 1, 1,
0.9965612, -0.2088538, 0.4093741, 0, 0, 0, 1, 1,
1.001875, -1.104325, 3.440288, 0, 0, 0, 1, 1,
1.002438, 0.3626193, 2.246965, 0, 0, 0, 1, 1,
1.009054, -0.3613429, 2.289323, 0, 0, 0, 1, 1,
1.014287, -0.4001712, 2.622638, 0, 0, 0, 1, 1,
1.026899, -0.6681171, 1.063816, 0, 0, 0, 1, 1,
1.02784, 1.873845, 0.6622345, 0, 0, 0, 1, 1,
1.041743, -0.324427, 1.544326, 1, 1, 1, 1, 1,
1.046738, -0.1424208, 1.983114, 1, 1, 1, 1, 1,
1.055454, 0.793201, 0.1126917, 1, 1, 1, 1, 1,
1.057644, -0.4109655, 1.205395, 1, 1, 1, 1, 1,
1.057811, 0.4081749, 1.43382, 1, 1, 1, 1, 1,
1.063514, -0.9178349, 3.951278, 1, 1, 1, 1, 1,
1.073174, 0.8951545, 1.590381, 1, 1, 1, 1, 1,
1.083121, -0.1142628, 1.377777, 1, 1, 1, 1, 1,
1.088661, -0.1622785, -0.001463058, 1, 1, 1, 1, 1,
1.089679, -0.2453473, 2.3021, 1, 1, 1, 1, 1,
1.095301, -1.20692, 4.970288, 1, 1, 1, 1, 1,
1.120741, 0.02340356, 1.074724, 1, 1, 1, 1, 1,
1.121554, -0.3821612, 1.78826, 1, 1, 1, 1, 1,
1.134705, 0.6566936, 1.959005, 1, 1, 1, 1, 1,
1.145321, 1.46333, 1.558997, 1, 1, 1, 1, 1,
1.152166, -1.284039, 3.676514, 0, 0, 1, 1, 1,
1.152728, 0.4659406, -1.306176, 1, 0, 0, 1, 1,
1.169818, 1.092614, 1.276978, 1, 0, 0, 1, 1,
1.174133, -0.3539813, 1.47757, 1, 0, 0, 1, 1,
1.17438, 0.09408531, 2.7541, 1, 0, 0, 1, 1,
1.179266, 1.39884, 0.1321349, 1, 0, 0, 1, 1,
1.179302, -1.102356, 3.027141, 0, 0, 0, 1, 1,
1.182791, -0.1118612, 1.472352, 0, 0, 0, 1, 1,
1.188346, -0.2426938, 1.655108, 0, 0, 0, 1, 1,
1.19102, -0.7520404, 0.405903, 0, 0, 0, 1, 1,
1.200155, 0.08269153, 0.3069421, 0, 0, 0, 1, 1,
1.20856, -0.3523866, 1.267587, 0, 0, 0, 1, 1,
1.210838, -1.985688, 3.527426, 0, 0, 0, 1, 1,
1.225399, 0.9657396, 1.891739, 1, 1, 1, 1, 1,
1.227576, -0.4687364, 2.6894, 1, 1, 1, 1, 1,
1.231169, -0.1908083, 1.722819, 1, 1, 1, 1, 1,
1.241541, 1.4764, 0.3437021, 1, 1, 1, 1, 1,
1.249277, 0.137292, 1.453925, 1, 1, 1, 1, 1,
1.253678, -0.08534635, 2.121233, 1, 1, 1, 1, 1,
1.262591, 0.09426831, 1.182343, 1, 1, 1, 1, 1,
1.264512, -0.7755897, 2.349295, 1, 1, 1, 1, 1,
1.27863, 0.624675, 0.5619339, 1, 1, 1, 1, 1,
1.280799, 0.6517302, -0.4772908, 1, 1, 1, 1, 1,
1.287838, 2.037272, -0.4015249, 1, 1, 1, 1, 1,
1.292502, 0.08078384, 1.35014, 1, 1, 1, 1, 1,
1.292692, -1.35756, 1.526152, 1, 1, 1, 1, 1,
1.294023, 0.1165122, 0.2060567, 1, 1, 1, 1, 1,
1.295606, -0.3001593, 3.542216, 1, 1, 1, 1, 1,
1.299189, 0.3440363, 1.400919, 0, 0, 1, 1, 1,
1.310197, 0.4313944, -0.411163, 1, 0, 0, 1, 1,
1.315865, 0.1717698, 0.7200423, 1, 0, 0, 1, 1,
1.324245, -2.250614, 2.779027, 1, 0, 0, 1, 1,
1.324665, -0.5287867, 3.089747, 1, 0, 0, 1, 1,
1.331731, 0.9909251, 0.8471653, 1, 0, 0, 1, 1,
1.344567, 1.042783, 1.707689, 0, 0, 0, 1, 1,
1.345955, 0.967007, 1.942688, 0, 0, 0, 1, 1,
1.35661, 1.727449, 1.184638, 0, 0, 0, 1, 1,
1.356773, 0.1013484, 1.571492, 0, 0, 0, 1, 1,
1.363524, 2.031345, 0.7530289, 0, 0, 0, 1, 1,
1.388655, -0.1413867, 1.393625, 0, 0, 0, 1, 1,
1.391121, -1.169372, 1.397616, 0, 0, 0, 1, 1,
1.395207, 0.6590742, 0.07188771, 1, 1, 1, 1, 1,
1.402063, -1.153007, 1.911075, 1, 1, 1, 1, 1,
1.406578, -0.6451614, 3.057199, 1, 1, 1, 1, 1,
1.441939, 1.249102, 0.9656332, 1, 1, 1, 1, 1,
1.447873, 0.2898613, 1.502882, 1, 1, 1, 1, 1,
1.453725, -0.7914417, 1.06766, 1, 1, 1, 1, 1,
1.459339, 0.1121276, 1.493567, 1, 1, 1, 1, 1,
1.468541, -2.052846, 2.396979, 1, 1, 1, 1, 1,
1.468762, 0.2945535, 2.764356, 1, 1, 1, 1, 1,
1.478824, 0.9904872, -0.7408271, 1, 1, 1, 1, 1,
1.480522, -0.6030213, 0.6268753, 1, 1, 1, 1, 1,
1.482967, -0.3888143, 1.299628, 1, 1, 1, 1, 1,
1.484079, -1.566724, 2.85492, 1, 1, 1, 1, 1,
1.525048, 0.05399399, 3.035451, 1, 1, 1, 1, 1,
1.534122, 0.9758803, 1.130837, 1, 1, 1, 1, 1,
1.534271, -0.2011099, 1.956334, 0, 0, 1, 1, 1,
1.538769, 0.554195, 1.379781, 1, 0, 0, 1, 1,
1.541934, -0.9670137, 1.335892, 1, 0, 0, 1, 1,
1.548272, 0.753621, 1.317585, 1, 0, 0, 1, 1,
1.553311, -0.6583338, 3.827909, 1, 0, 0, 1, 1,
1.590363, -0.7406524, 3.164939, 1, 0, 0, 1, 1,
1.593316, -0.7171648, 2.799088, 0, 0, 0, 1, 1,
1.601611, 0.2802151, 1.866628, 0, 0, 0, 1, 1,
1.625379, -1.231401, 2.335301, 0, 0, 0, 1, 1,
1.63754, 0.6046541, 2.613756, 0, 0, 0, 1, 1,
1.644639, -1.188393, 4.212363, 0, 0, 0, 1, 1,
1.648669, -0.5336096, 1.116523, 0, 0, 0, 1, 1,
1.658703, -0.9662673, 1.167631, 0, 0, 0, 1, 1,
1.670685, -0.4834616, 2.788161, 1, 1, 1, 1, 1,
1.67179, 0.319441, 1.830258, 1, 1, 1, 1, 1,
1.683762, 0.06779209, 0.04158666, 1, 1, 1, 1, 1,
1.700214, -1.475517, 0.9777492, 1, 1, 1, 1, 1,
1.720034, 1.104328, 1.314815, 1, 1, 1, 1, 1,
1.730409, -0.1830214, 3.511983, 1, 1, 1, 1, 1,
1.730685, -1.142806, 1.613463, 1, 1, 1, 1, 1,
1.74264, 1.050455, 1.767798, 1, 1, 1, 1, 1,
1.756077, -1.472433, 1.5867, 1, 1, 1, 1, 1,
1.767192, -1.407531, 1.973017, 1, 1, 1, 1, 1,
1.772422, -0.5480173, 2.346075, 1, 1, 1, 1, 1,
1.787691, -0.4654398, 1.977298, 1, 1, 1, 1, 1,
1.838036, -0.5197288, 0.5252278, 1, 1, 1, 1, 1,
1.862721, -1.15095, 1.166814, 1, 1, 1, 1, 1,
1.87677, -0.2431492, -0.09547083, 1, 1, 1, 1, 1,
1.898818, 0.3543139, 1.62117, 0, 0, 1, 1, 1,
1.899518, 0.4822902, 0.4653944, 1, 0, 0, 1, 1,
1.928454, -1.806924, 1.952475, 1, 0, 0, 1, 1,
1.930657, -0.0843747, 1.479191, 1, 0, 0, 1, 1,
1.957318, -0.8733813, 1.710932, 1, 0, 0, 1, 1,
1.966551, -2.102619, 1.230152, 1, 0, 0, 1, 1,
1.984726, 1.219678, 0.7725635, 0, 0, 0, 1, 1,
1.998556, -1.240459, 0.6802845, 0, 0, 0, 1, 1,
2.046819, 0.07852065, 1.854005, 0, 0, 0, 1, 1,
2.098608, -1.632121, 3.124205, 0, 0, 0, 1, 1,
2.123516, -0.1048155, 1.275288, 0, 0, 0, 1, 1,
2.128834, -0.3226427, 1.827069, 0, 0, 0, 1, 1,
2.289414, -1.242972, 1.039906, 0, 0, 0, 1, 1,
2.356392, -1.39356, 4.177351, 1, 1, 1, 1, 1,
2.386699, -0.8722669, 0.4628679, 1, 1, 1, 1, 1,
2.482468, -0.378473, 0.9089348, 1, 1, 1, 1, 1,
2.491906, -0.9859611, 1.491196, 1, 1, 1, 1, 1,
2.754204, -2.580797, 2.863988, 1, 1, 1, 1, 1,
2.93978, -0.7550206, 2.353064, 1, 1, 1, 1, 1,
3.056381, 1.453072, 1.869234, 1, 1, 1, 1, 1
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
var radius = 9.836611;
var distance = 34.55068;
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
mvMatrix.translate( 0.2540343, 0.004114628, -0.4785712 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.55068);
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