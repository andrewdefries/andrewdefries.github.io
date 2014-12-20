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
-3.502102, -1.45588, -0.9825247, 1, 0, 0, 1,
-3.416096, 0.9171641, -1.675027, 1, 0.007843138, 0, 1,
-3.184181, 0.8660843, -2.262072, 1, 0.01176471, 0, 1,
-2.924835, -0.8309438, -1.007267, 1, 0.01960784, 0, 1,
-2.71363, -0.5066668, -2.622365, 1, 0.02352941, 0, 1,
-2.54919, -0.9071948, -1.73968, 1, 0.03137255, 0, 1,
-2.543944, -0.0857622, -2.439108, 1, 0.03529412, 0, 1,
-2.46824, 1.156995, -0.2878956, 1, 0.04313726, 0, 1,
-2.458796, 1.021117, -1.955541, 1, 0.04705882, 0, 1,
-2.427661, -0.2561725, -1.248629, 1, 0.05490196, 0, 1,
-2.267208, -0.7641481, -2.881342, 1, 0.05882353, 0, 1,
-2.123291, 0.6421451, -1.16553, 1, 0.06666667, 0, 1,
-2.111351, -0.912174, -1.410188, 1, 0.07058824, 0, 1,
-2.101813, -1.772888, -0.7158783, 1, 0.07843138, 0, 1,
-1.995295, 0.4624931, -3.455471, 1, 0.08235294, 0, 1,
-1.970957, -1.128871, -0.8282952, 1, 0.09019608, 0, 1,
-1.944678, 0.7996828, -0.009084434, 1, 0.09411765, 0, 1,
-1.939502, -0.8628612, -2.029381, 1, 0.1019608, 0, 1,
-1.937488, -0.4656754, -1.172196, 1, 0.1098039, 0, 1,
-1.905373, 0.7637774, -0.1534759, 1, 0.1137255, 0, 1,
-1.903544, -0.08273102, -0.3877536, 1, 0.1215686, 0, 1,
-1.891714, 2.14908, -1.690713, 1, 0.1254902, 0, 1,
-1.891673, -0.7434963, -2.064053, 1, 0.1333333, 0, 1,
-1.861832, -0.7243947, -1.768473, 1, 0.1372549, 0, 1,
-1.851037, -0.1008556, 0.05126174, 1, 0.145098, 0, 1,
-1.836885, -1.302612, -1.774587, 1, 0.1490196, 0, 1,
-1.835965, 0.1478933, -0.01828052, 1, 0.1568628, 0, 1,
-1.818342, 0.1823594, -1.589992, 1, 0.1607843, 0, 1,
-1.804491, -0.2158767, -2.078763, 1, 0.1686275, 0, 1,
-1.773457, -0.7024151, -3.329834, 1, 0.172549, 0, 1,
-1.772441, 0.2905111, -2.250855, 1, 0.1803922, 0, 1,
-1.766584, -0.2337304, -1.210508, 1, 0.1843137, 0, 1,
-1.757166, -0.09792503, -1.27853, 1, 0.1921569, 0, 1,
-1.752126, 1.656525, -0.9012307, 1, 0.1960784, 0, 1,
-1.750278, 0.007201893, -0.1352428, 1, 0.2039216, 0, 1,
-1.749064, 2.183144, -0.4963609, 1, 0.2117647, 0, 1,
-1.736997, -0.01694129, -1.053788, 1, 0.2156863, 0, 1,
-1.715271, 1.556285, -1.180963, 1, 0.2235294, 0, 1,
-1.705838, 0.9237388, -0.9159034, 1, 0.227451, 0, 1,
-1.705342, -0.8307803, -2.588659, 1, 0.2352941, 0, 1,
-1.703707, -0.2537462, -1.809598, 1, 0.2392157, 0, 1,
-1.688419, 1.20777, -1.310963, 1, 0.2470588, 0, 1,
-1.685369, -1.352774, -3.005319, 1, 0.2509804, 0, 1,
-1.676621, 0.3345516, -2.341071, 1, 0.2588235, 0, 1,
-1.672986, 0.1706043, -3.179839, 1, 0.2627451, 0, 1,
-1.669244, 1.727228, 0.7664516, 1, 0.2705882, 0, 1,
-1.64937, 0.1491691, -1.018714, 1, 0.2745098, 0, 1,
-1.640408, 0.5242099, -0.1935271, 1, 0.282353, 0, 1,
-1.638234, -1.26372, -2.857879, 1, 0.2862745, 0, 1,
-1.631034, 1.354195, -0.7218257, 1, 0.2941177, 0, 1,
-1.613068, -0.5622184, -1.719242, 1, 0.3019608, 0, 1,
-1.612473, 0.1347991, -0.7598368, 1, 0.3058824, 0, 1,
-1.605661, -0.554369, -2.004993, 1, 0.3137255, 0, 1,
-1.601214, 0.4229254, -1.294751, 1, 0.3176471, 0, 1,
-1.600212, 0.8355491, -0.6092071, 1, 0.3254902, 0, 1,
-1.598429, 0.4848098, -1.155995, 1, 0.3294118, 0, 1,
-1.59028, 0.7146909, -0.794162, 1, 0.3372549, 0, 1,
-1.573968, -0.7760351, -1.476449, 1, 0.3411765, 0, 1,
-1.573278, 0.1466689, -1.646929, 1, 0.3490196, 0, 1,
-1.561679, -0.1112341, -3.026365, 1, 0.3529412, 0, 1,
-1.552745, -1.125011, -2.373873, 1, 0.3607843, 0, 1,
-1.539092, 0.4394735, 1.241695, 1, 0.3647059, 0, 1,
-1.516703, 0.07052662, -2.636099, 1, 0.372549, 0, 1,
-1.500292, -0.591503, -1.461057, 1, 0.3764706, 0, 1,
-1.489503, 3.747848, 0.8877615, 1, 0.3843137, 0, 1,
-1.48938, 0.8338902, 0.8517563, 1, 0.3882353, 0, 1,
-1.486113, 1.108132, -0.516268, 1, 0.3960784, 0, 1,
-1.483355, -1.278616, -3.629964, 1, 0.4039216, 0, 1,
-1.483009, 0.04744627, -2.364324, 1, 0.4078431, 0, 1,
-1.470568, 0.3729763, -1.661918, 1, 0.4156863, 0, 1,
-1.468084, -0.268777, -0.5705185, 1, 0.4196078, 0, 1,
-1.462035, -2.413154, -3.583386, 1, 0.427451, 0, 1,
-1.445772, 1.125699, -2.303677, 1, 0.4313726, 0, 1,
-1.44175, 0.4517075, -3.436807, 1, 0.4392157, 0, 1,
-1.435321, 1.181796, -2.775996, 1, 0.4431373, 0, 1,
-1.432114, -0.467084, -1.258375, 1, 0.4509804, 0, 1,
-1.429905, -0.8338284, -1.931227, 1, 0.454902, 0, 1,
-1.42767, -0.2139393, -3.282548, 1, 0.4627451, 0, 1,
-1.421212, -2.454864, -3.121908, 1, 0.4666667, 0, 1,
-1.410598, -0.7388148, -1.118277, 1, 0.4745098, 0, 1,
-1.408659, -0.8831645, -2.02044, 1, 0.4784314, 0, 1,
-1.406161, 0.2847079, -0.9058823, 1, 0.4862745, 0, 1,
-1.404588, -2.011078, -3.623915, 1, 0.4901961, 0, 1,
-1.392495, -0.1131735, -0.8746594, 1, 0.4980392, 0, 1,
-1.379359, 1.011591, -0.8043556, 1, 0.5058824, 0, 1,
-1.379219, 1.210021, -1.21454, 1, 0.509804, 0, 1,
-1.375008, -0.9623894, -1.119174, 1, 0.5176471, 0, 1,
-1.36186, -0.08613123, -2.413082, 1, 0.5215687, 0, 1,
-1.343987, -0.1266551, -1.903357, 1, 0.5294118, 0, 1,
-1.331888, 2.017414, 1.581531, 1, 0.5333334, 0, 1,
-1.330761, -0.4442803, -2.729128, 1, 0.5411765, 0, 1,
-1.301738, 0.126616, -3.449257, 1, 0.5450981, 0, 1,
-1.285742, 1.025012, 0.0505509, 1, 0.5529412, 0, 1,
-1.28301, 0.3252732, -0.3537803, 1, 0.5568628, 0, 1,
-1.282643, 1.406006, -0.4276353, 1, 0.5647059, 0, 1,
-1.272179, -1.547273, -1.848808, 1, 0.5686275, 0, 1,
-1.271102, -0.3848048, -1.815209, 1, 0.5764706, 0, 1,
-1.269621, 0.1739626, -0.9692048, 1, 0.5803922, 0, 1,
-1.264216, -1.205413, -1.604276, 1, 0.5882353, 0, 1,
-1.260394, -1.000176, -1.806846, 1, 0.5921569, 0, 1,
-1.256099, -2.260401, -2.449046, 1, 0.6, 0, 1,
-1.251185, 1.126834, -0.9471136, 1, 0.6078432, 0, 1,
-1.250138, 0.9183266, -1.162592, 1, 0.6117647, 0, 1,
-1.247969, 0.2656478, -2.524872, 1, 0.6196079, 0, 1,
-1.245568, -0.06727961, -1.483287, 1, 0.6235294, 0, 1,
-1.242896, 0.8656391, 0.6474585, 1, 0.6313726, 0, 1,
-1.234017, 0.5406474, 0.03760706, 1, 0.6352941, 0, 1,
-1.224006, 0.07213993, -1.114388, 1, 0.6431373, 0, 1,
-1.207366, -1.090485, -2.374084, 1, 0.6470588, 0, 1,
-1.195838, -1.191568, -3.780098, 1, 0.654902, 0, 1,
-1.189124, 2.110523, -1.953132, 1, 0.6588235, 0, 1,
-1.186483, -0.6944806, -2.761592, 1, 0.6666667, 0, 1,
-1.179485, -0.5241147, -1.499119, 1, 0.6705883, 0, 1,
-1.177452, -1.209023, -1.79508, 1, 0.6784314, 0, 1,
-1.171957, 0.7458474, -0.2968922, 1, 0.682353, 0, 1,
-1.17138, -2.504511, -1.679204, 1, 0.6901961, 0, 1,
-1.164391, -0.5338843, -0.21027, 1, 0.6941177, 0, 1,
-1.153171, -0.1160866, -2.575735, 1, 0.7019608, 0, 1,
-1.15315, -2.121224, -1.552357, 1, 0.7098039, 0, 1,
-1.151842, -2.732203, -3.101525, 1, 0.7137255, 0, 1,
-1.151795, -2.220467, -2.517802, 1, 0.7215686, 0, 1,
-1.15139, 1.075017, -0.7444193, 1, 0.7254902, 0, 1,
-1.151079, 0.1646088, -0.8165994, 1, 0.7333333, 0, 1,
-1.139375, -0.6396671, -0.6778327, 1, 0.7372549, 0, 1,
-1.137451, -1.042778, -2.452183, 1, 0.7450981, 0, 1,
-1.132795, 0.1185827, -2.936325, 1, 0.7490196, 0, 1,
-1.131157, 0.3716763, -2.136469, 1, 0.7568628, 0, 1,
-1.129118, 1.264389, 0.1638508, 1, 0.7607843, 0, 1,
-1.119879, -0.5460305, -0.6074325, 1, 0.7686275, 0, 1,
-1.118414, 0.3083689, -0.6996835, 1, 0.772549, 0, 1,
-1.116772, -0.8290278, 0.2532647, 1, 0.7803922, 0, 1,
-1.108927, -1.763924, -1.673219, 1, 0.7843137, 0, 1,
-1.104689, -0.2373184, -1.966395, 1, 0.7921569, 0, 1,
-1.094709, 1.096073, -0.9006086, 1, 0.7960784, 0, 1,
-1.093309, -1.050696, -2.883137, 1, 0.8039216, 0, 1,
-1.089902, 1.198903, -1.889597, 1, 0.8117647, 0, 1,
-1.082752, 0.7054732, -3.891767, 1, 0.8156863, 0, 1,
-1.080215, 0.4070545, -1.349657, 1, 0.8235294, 0, 1,
-1.079403, 1.372076, 0.02024952, 1, 0.827451, 0, 1,
-1.077573, -1.624296, -2.832352, 1, 0.8352941, 0, 1,
-1.069124, 0.8709814, -1.777782, 1, 0.8392157, 0, 1,
-1.067118, 1.486114, -1.126048, 1, 0.8470588, 0, 1,
-1.066304, 0.01647807, -1.29987, 1, 0.8509804, 0, 1,
-1.066012, -0.105676, -1.635695, 1, 0.8588235, 0, 1,
-1.063337, -0.04899743, -2.259787, 1, 0.8627451, 0, 1,
-1.059772, -0.5099377, -2.598141, 1, 0.8705882, 0, 1,
-1.055537, -1.040152, -0.7512808, 1, 0.8745098, 0, 1,
-1.045549, 0.9089693, -1.328929, 1, 0.8823529, 0, 1,
-1.040569, 0.6333576, -1.277511, 1, 0.8862745, 0, 1,
-1.02806, 0.6972758, -0.6147113, 1, 0.8941177, 0, 1,
-1.026282, 0.4015107, -1.136338, 1, 0.8980392, 0, 1,
-1.024545, -0.9927624, -3.407498, 1, 0.9058824, 0, 1,
-1.021567, 2.220345, 0.249498, 1, 0.9137255, 0, 1,
-1.016729, 0.4576391, -1.081327, 1, 0.9176471, 0, 1,
-1.01054, 0.458884, -1.283438, 1, 0.9254902, 0, 1,
-0.9996708, 2.339658, -0.9967741, 1, 0.9294118, 0, 1,
-0.9981515, -0.2858325, -2.498671, 1, 0.9372549, 0, 1,
-0.9970438, -0.6707876, -1.644372, 1, 0.9411765, 0, 1,
-0.9922568, 0.3314348, -1.698564, 1, 0.9490196, 0, 1,
-0.9881766, -0.3189044, -0.2963422, 1, 0.9529412, 0, 1,
-0.9834306, -0.2005692, -2.060883, 1, 0.9607843, 0, 1,
-0.9761527, 0.1223948, -1.694355, 1, 0.9647059, 0, 1,
-0.9759498, -0.2559768, -1.519681, 1, 0.972549, 0, 1,
-0.9703733, 0.1950642, -0.1607554, 1, 0.9764706, 0, 1,
-0.9657421, 0.5154003, -0.9289215, 1, 0.9843137, 0, 1,
-0.9634981, -1.167804, -2.016825, 1, 0.9882353, 0, 1,
-0.9617338, -1.51386, -3.894923, 1, 0.9960784, 0, 1,
-0.9603415, 1.052799, -2.454444, 0.9960784, 1, 0, 1,
-0.9560536, 0.5749268, -1.692418, 0.9921569, 1, 0, 1,
-0.9524816, 1.427703, -2.287592, 0.9843137, 1, 0, 1,
-0.9520105, 1.369349, -1.359857, 0.9803922, 1, 0, 1,
-0.9506332, -1.928828, -2.776425, 0.972549, 1, 0, 1,
-0.9490966, -1.876978, -3.053734, 0.9686275, 1, 0, 1,
-0.9477587, 0.5083423, -2.465972, 0.9607843, 1, 0, 1,
-0.9477103, 0.878202, -0.5009118, 0.9568627, 1, 0, 1,
-0.9447606, -1.987742, -3.301322, 0.9490196, 1, 0, 1,
-0.9430269, 0.4748181, -1.488754, 0.945098, 1, 0, 1,
-0.9404143, 0.1741918, -2.517964, 0.9372549, 1, 0, 1,
-0.9390331, -0.9299173, -0.8180196, 0.9333333, 1, 0, 1,
-0.9334986, 0.9879889, -1.170393, 0.9254902, 1, 0, 1,
-0.9306557, -1.30223, -3.698386, 0.9215686, 1, 0, 1,
-0.9247496, -1.360297, -1.814784, 0.9137255, 1, 0, 1,
-0.9241248, -0.7570246, -3.037187, 0.9098039, 1, 0, 1,
-0.9238153, 2.117661, 1.686275, 0.9019608, 1, 0, 1,
-0.9103214, 1.480979, 0.6480931, 0.8941177, 1, 0, 1,
-0.9037572, -0.9148427, -1.03704, 0.8901961, 1, 0, 1,
-0.9021883, 0.4616082, 0.3354952, 0.8823529, 1, 0, 1,
-0.8952938, 2.46114, 0.2515652, 0.8784314, 1, 0, 1,
-0.8948398, -0.3571468, -3.467696, 0.8705882, 1, 0, 1,
-0.8848122, -0.8277248, -2.580456, 0.8666667, 1, 0, 1,
-0.8728848, -0.03495955, -1.123474, 0.8588235, 1, 0, 1,
-0.87209, 0.5516653, -1.507111, 0.854902, 1, 0, 1,
-0.8614669, -0.9779824, -2.051565, 0.8470588, 1, 0, 1,
-0.8580094, -3.012931, -4.44995, 0.8431373, 1, 0, 1,
-0.8567126, -1.184533, -4.033927, 0.8352941, 1, 0, 1,
-0.8522812, -0.6483384, -3.982769, 0.8313726, 1, 0, 1,
-0.8515758, -0.1956476, -2.844422, 0.8235294, 1, 0, 1,
-0.8482526, -0.1657378, -2.017433, 0.8196079, 1, 0, 1,
-0.8481615, -0.4417532, -1.654496, 0.8117647, 1, 0, 1,
-0.8368886, -0.3091669, -4.033978, 0.8078431, 1, 0, 1,
-0.8337559, -1.568595, -2.654343, 0.8, 1, 0, 1,
-0.8304314, -0.5980251, -2.805997, 0.7921569, 1, 0, 1,
-0.8277858, -0.5985509, -2.480067, 0.7882353, 1, 0, 1,
-0.8248776, 1.245381, 1.103794, 0.7803922, 1, 0, 1,
-0.8236099, -0.4980636, -2.017, 0.7764706, 1, 0, 1,
-0.8213792, -1.053669, -0.7934911, 0.7686275, 1, 0, 1,
-0.8067163, 0.8073912, -1.434546, 0.7647059, 1, 0, 1,
-0.8048783, -2.022177, -3.04707, 0.7568628, 1, 0, 1,
-0.7998665, 2.362953, 0.7626536, 0.7529412, 1, 0, 1,
-0.7991647, 0.2333869, -1.47095, 0.7450981, 1, 0, 1,
-0.7867568, -1.267825, -1.662215, 0.7411765, 1, 0, 1,
-0.7862282, 1.441485, -0.01690048, 0.7333333, 1, 0, 1,
-0.7768162, 0.5616369, -1.484494, 0.7294118, 1, 0, 1,
-0.7731912, -1.469036, -3.323046, 0.7215686, 1, 0, 1,
-0.7704775, -0.3894983, -1.46811, 0.7176471, 1, 0, 1,
-0.770477, 0.04974866, 0.9229099, 0.7098039, 1, 0, 1,
-0.7704012, -0.1261498, -2.758473, 0.7058824, 1, 0, 1,
-0.7684234, -1.867465, -2.048133, 0.6980392, 1, 0, 1,
-0.7652875, 0.7251898, -1.676413, 0.6901961, 1, 0, 1,
-0.7604516, 0.6670034, -0.1693405, 0.6862745, 1, 0, 1,
-0.7589195, 0.701516, -0.100291, 0.6784314, 1, 0, 1,
-0.7561846, 1.423355, -0.6024334, 0.6745098, 1, 0, 1,
-0.753915, -0.9571456, -1.949266, 0.6666667, 1, 0, 1,
-0.7484112, 0.07803033, -2.969566, 0.6627451, 1, 0, 1,
-0.7480248, -1.086379, -2.684783, 0.654902, 1, 0, 1,
-0.7427059, 0.0416941, 0.2247887, 0.6509804, 1, 0, 1,
-0.7285019, -1.330493, -3.079836, 0.6431373, 1, 0, 1,
-0.7244906, -0.430445, -1.897467, 0.6392157, 1, 0, 1,
-0.7232791, -1.03044, -3.374519, 0.6313726, 1, 0, 1,
-0.721598, 1.160784, -1.197948, 0.627451, 1, 0, 1,
-0.7188809, -1.351608, -3.825426, 0.6196079, 1, 0, 1,
-0.7181269, 0.5552948, -0.376766, 0.6156863, 1, 0, 1,
-0.7133679, -0.3340951, -1.444065, 0.6078432, 1, 0, 1,
-0.7023386, 0.04225933, -0.1358163, 0.6039216, 1, 0, 1,
-0.7010782, -0.3313748, -1.775057, 0.5960785, 1, 0, 1,
-0.7003817, 0.179907, -2.648217, 0.5882353, 1, 0, 1,
-0.6896996, 0.7477822, -0.73111, 0.5843138, 1, 0, 1,
-0.6850091, -1.082451, -3.232873, 0.5764706, 1, 0, 1,
-0.6829304, -0.7195458, -3.272537, 0.572549, 1, 0, 1,
-0.6812926, -0.4714458, -2.091533, 0.5647059, 1, 0, 1,
-0.680381, 1.370403, 0.4826051, 0.5607843, 1, 0, 1,
-0.6790968, -2.328686, -1.739688, 0.5529412, 1, 0, 1,
-0.6763471, -0.7684235, -1.269714, 0.5490196, 1, 0, 1,
-0.6760596, 0.2900878, -1.122342, 0.5411765, 1, 0, 1,
-0.6696764, -1.598123, -2.76764, 0.5372549, 1, 0, 1,
-0.6659207, -0.7428131, -2.506175, 0.5294118, 1, 0, 1,
-0.6641186, -1.679677, -2.351888, 0.5254902, 1, 0, 1,
-0.6629043, -0.5185958, -0.3024422, 0.5176471, 1, 0, 1,
-0.6620306, 1.743824, 0.7267913, 0.5137255, 1, 0, 1,
-0.6619698, 1.260458, -2.166096, 0.5058824, 1, 0, 1,
-0.6593671, -1.588064, -2.364585, 0.5019608, 1, 0, 1,
-0.6575875, -1.271229, -3.748446, 0.4941176, 1, 0, 1,
-0.6477654, 1.309978, 1.128197, 0.4862745, 1, 0, 1,
-0.6474755, -0.3497967, -1.613449, 0.4823529, 1, 0, 1,
-0.6442699, 0.8638343, 0.6201909, 0.4745098, 1, 0, 1,
-0.6414931, -1.750267, -2.741326, 0.4705882, 1, 0, 1,
-0.6355244, -0.6307283, -2.437957, 0.4627451, 1, 0, 1,
-0.6317675, -0.8991438, -2.883544, 0.4588235, 1, 0, 1,
-0.631681, 1.646836, 0.06183566, 0.4509804, 1, 0, 1,
-0.6249524, -0.8071194, -2.85809, 0.4470588, 1, 0, 1,
-0.6233964, -0.4170443, -2.744694, 0.4392157, 1, 0, 1,
-0.6218972, 1.152093, 1.051578, 0.4352941, 1, 0, 1,
-0.6204708, -2.011089, -3.744527, 0.427451, 1, 0, 1,
-0.6130608, -0.3762017, -1.530635, 0.4235294, 1, 0, 1,
-0.6118136, -1.023457, -3.036715, 0.4156863, 1, 0, 1,
-0.6043426, -0.740777, -3.74078, 0.4117647, 1, 0, 1,
-0.6041169, 1.045976, -0.8944467, 0.4039216, 1, 0, 1,
-0.6029871, 0.5276493, 0.3737448, 0.3960784, 1, 0, 1,
-0.5958126, -0.5870063, -2.438302, 0.3921569, 1, 0, 1,
-0.5953313, 0.9312761, -0.3534012, 0.3843137, 1, 0, 1,
-0.5935117, 0.9495558, -1.901545, 0.3803922, 1, 0, 1,
-0.5863348, -1.087019, -2.689831, 0.372549, 1, 0, 1,
-0.5807438, -1.543329, -3.620882, 0.3686275, 1, 0, 1,
-0.5803516, -0.2933412, -2.050995, 0.3607843, 1, 0, 1,
-0.5796981, -0.03694839, -0.7358049, 0.3568628, 1, 0, 1,
-0.578977, -1.221709, -1.348634, 0.3490196, 1, 0, 1,
-0.5778493, 0.1491698, -1.376545, 0.345098, 1, 0, 1,
-0.574026, -0.4303412, -2.659069, 0.3372549, 1, 0, 1,
-0.5739734, -1.097063, -2.269038, 0.3333333, 1, 0, 1,
-0.5721356, 1.318919, -1.186413, 0.3254902, 1, 0, 1,
-0.5696653, 0.1400734, -0.3677727, 0.3215686, 1, 0, 1,
-0.5679616, 0.6983912, -1.156929, 0.3137255, 1, 0, 1,
-0.5667155, -0.2632454, -3.393245, 0.3098039, 1, 0, 1,
-0.5648908, -0.1988953, -2.995287, 0.3019608, 1, 0, 1,
-0.562328, -0.1821803, -3.174557, 0.2941177, 1, 0, 1,
-0.5614855, -0.4970204, -1.653845, 0.2901961, 1, 0, 1,
-0.5523227, 0.2337247, -0.4087088, 0.282353, 1, 0, 1,
-0.5490336, -0.6516553, -3.553805, 0.2784314, 1, 0, 1,
-0.5486475, -0.611464, -3.036346, 0.2705882, 1, 0, 1,
-0.5480083, 1.683103, -0.8170609, 0.2666667, 1, 0, 1,
-0.5479991, 0.7106451, 0.02160834, 0.2588235, 1, 0, 1,
-0.5470024, -0.3253779, -2.848729, 0.254902, 1, 0, 1,
-0.5455363, -2.28971, -2.109095, 0.2470588, 1, 0, 1,
-0.5441481, 0.9184589, 0.1287327, 0.2431373, 1, 0, 1,
-0.5416684, 0.1658687, 0.2702251, 0.2352941, 1, 0, 1,
-0.5416023, -0.1313901, -3.305032, 0.2313726, 1, 0, 1,
-0.5388877, -1.360022, -2.050714, 0.2235294, 1, 0, 1,
-0.5380359, -0.447365, -3.345368, 0.2196078, 1, 0, 1,
-0.5379046, -1.489157, -1.261428, 0.2117647, 1, 0, 1,
-0.534911, -0.3876404, -1.039017, 0.2078431, 1, 0, 1,
-0.5338113, 0.09204115, -3.706902, 0.2, 1, 0, 1,
-0.5336204, -0.5449747, -1.689646, 0.1921569, 1, 0, 1,
-0.5318272, -0.09344943, -1.909811, 0.1882353, 1, 0, 1,
-0.530958, 1.33464, -1.036644, 0.1803922, 1, 0, 1,
-0.5256295, 0.8502429, 0.1714617, 0.1764706, 1, 0, 1,
-0.5253493, -0.3255966, -1.552015, 0.1686275, 1, 0, 1,
-0.5239947, 0.05190117, -0.5760309, 0.1647059, 1, 0, 1,
-0.5232989, -1.257814, -3.215426, 0.1568628, 1, 0, 1,
-0.5217234, -0.1736429, -0.6258479, 0.1529412, 1, 0, 1,
-0.5214667, 0.5102106, -1.391042, 0.145098, 1, 0, 1,
-0.5192969, 0.6428346, -1.961674, 0.1411765, 1, 0, 1,
-0.5190388, -0.2861387, -2.95755, 0.1333333, 1, 0, 1,
-0.5149356, 1.071968, 2.089333, 0.1294118, 1, 0, 1,
-0.5135795, 0.5077192, 0.04158247, 0.1215686, 1, 0, 1,
-0.512058, -1.675833, -2.83077, 0.1176471, 1, 0, 1,
-0.5089617, 1.136012, -1.195862, 0.1098039, 1, 0, 1,
-0.504299, -1.180655, -3.115095, 0.1058824, 1, 0, 1,
-0.503749, -0.05820667, -1.651161, 0.09803922, 1, 0, 1,
-0.5032145, 2.07932, 1.124154, 0.09019608, 1, 0, 1,
-0.5013336, 0.5610896, 0.01687456, 0.08627451, 1, 0, 1,
-0.4999799, 0.1690475, -1.768413, 0.07843138, 1, 0, 1,
-0.498814, 0.162906, -2.963116, 0.07450981, 1, 0, 1,
-0.4955888, 0.7075446, -0.05783549, 0.06666667, 1, 0, 1,
-0.4897719, -1.525148, -2.51789, 0.0627451, 1, 0, 1,
-0.4887369, 2.598576, -0.4110854, 0.05490196, 1, 0, 1,
-0.4772356, -1.351042, -3.396159, 0.05098039, 1, 0, 1,
-0.476736, 1.423096, -1.554746, 0.04313726, 1, 0, 1,
-0.4765156, -0.1395924, -0.7249964, 0.03921569, 1, 0, 1,
-0.4712359, 0.8282285, 1.179281, 0.03137255, 1, 0, 1,
-0.4679231, -0.4862037, -1.608597, 0.02745098, 1, 0, 1,
-0.465107, 0.3197589, -1.004281, 0.01960784, 1, 0, 1,
-0.4566551, 0.6765103, -0.07825913, 0.01568628, 1, 0, 1,
-0.4558105, 0.4497901, -0.3304526, 0.007843138, 1, 0, 1,
-0.4542132, 0.543817, -1.568947, 0.003921569, 1, 0, 1,
-0.4470132, -0.7745855, -3.512185, 0, 1, 0.003921569, 1,
-0.4467611, 0.7753928, -0.7240506, 0, 1, 0.01176471, 1,
-0.4459632, 0.7248681, 1.047045, 0, 1, 0.01568628, 1,
-0.4429444, -1.01659, -0.3567245, 0, 1, 0.02352941, 1,
-0.4418172, -0.8429725, -2.473378, 0, 1, 0.02745098, 1,
-0.4412882, 0.7777967, 0.6741815, 0, 1, 0.03529412, 1,
-0.440415, 0.02135923, -2.382297, 0, 1, 0.03921569, 1,
-0.4371752, 2.049857, -0.4967777, 0, 1, 0.04705882, 1,
-0.4359487, -0.009787924, -1.586917, 0, 1, 0.05098039, 1,
-0.4349552, 1.260201, -0.6847081, 0, 1, 0.05882353, 1,
-0.4337779, -1.660229, -3.491934, 0, 1, 0.0627451, 1,
-0.4329179, -0.3545016, -0.5281922, 0, 1, 0.07058824, 1,
-0.432687, 0.3080881, -1.901435, 0, 1, 0.07450981, 1,
-0.4287508, -0.1410116, -3.131939, 0, 1, 0.08235294, 1,
-0.4274187, -0.07104549, -0.7133625, 0, 1, 0.08627451, 1,
-0.4273425, -0.8356802, -3.222695, 0, 1, 0.09411765, 1,
-0.4246588, -0.7311651, -1.599699, 0, 1, 0.1019608, 1,
-0.4226859, -0.5865855, -2.3881, 0, 1, 0.1058824, 1,
-0.421046, -0.6026356, -1.106812, 0, 1, 0.1137255, 1,
-0.4173919, -1.323499, -3.48174, 0, 1, 0.1176471, 1,
-0.416713, -1.254421, -3.773471, 0, 1, 0.1254902, 1,
-0.4160258, -0.2707824, -1.874791, 0, 1, 0.1294118, 1,
-0.41447, -1.03362, -1.39156, 0, 1, 0.1372549, 1,
-0.4141743, 1.148586, -0.007031034, 0, 1, 0.1411765, 1,
-0.4102318, -0.6147914, -2.425431, 0, 1, 0.1490196, 1,
-0.4075696, -1.653574, -2.768277, 0, 1, 0.1529412, 1,
-0.4046595, -0.789475, -3.590891, 0, 1, 0.1607843, 1,
-0.3990686, 0.637366, -1.036129, 0, 1, 0.1647059, 1,
-0.3983795, -0.7135549, -3.508718, 0, 1, 0.172549, 1,
-0.3912398, -0.465734, -3.854192, 0, 1, 0.1764706, 1,
-0.381916, 0.381339, -1.194714, 0, 1, 0.1843137, 1,
-0.3811535, -0.9875253, -2.249378, 0, 1, 0.1882353, 1,
-0.3805974, -0.200038, -3.087935, 0, 1, 0.1960784, 1,
-0.3802962, 1.036829, -1.841815, 0, 1, 0.2039216, 1,
-0.3786265, 0.884274, 0.7312341, 0, 1, 0.2078431, 1,
-0.3784851, -1.262581, -2.808058, 0, 1, 0.2156863, 1,
-0.3728155, 1.036256, -0.1725617, 0, 1, 0.2196078, 1,
-0.372452, -0.5909385, -3.799488, 0, 1, 0.227451, 1,
-0.3694663, 0.5385159, -0.3773338, 0, 1, 0.2313726, 1,
-0.3687503, -1.761514, -1.733238, 0, 1, 0.2392157, 1,
-0.3663955, 1.298899, -0.4561466, 0, 1, 0.2431373, 1,
-0.3657749, 1.007816, -1.552167, 0, 1, 0.2509804, 1,
-0.3592963, -0.05625011, -2.281395, 0, 1, 0.254902, 1,
-0.3591955, -0.3794132, -2.871063, 0, 1, 0.2627451, 1,
-0.3572958, 0.8235452, -1.458822, 0, 1, 0.2666667, 1,
-0.3548689, 1.909298, -2.241869, 0, 1, 0.2745098, 1,
-0.3535319, -1.595431, -4.658597, 0, 1, 0.2784314, 1,
-0.3513197, -0.06314161, -0.9453073, 0, 1, 0.2862745, 1,
-0.3503334, 1.714123, -2.280994, 0, 1, 0.2901961, 1,
-0.3502963, 1.029549, 1.319022, 0, 1, 0.2980392, 1,
-0.349459, -0.08624715, -2.689821, 0, 1, 0.3058824, 1,
-0.3470918, -2.210367, -3.582889, 0, 1, 0.3098039, 1,
-0.3452455, 1.878268, -0.0501754, 0, 1, 0.3176471, 1,
-0.3435813, 0.1310041, -1.215554, 0, 1, 0.3215686, 1,
-0.3428821, -0.05930037, -1.428328, 0, 1, 0.3294118, 1,
-0.3335246, 0.1584554, -1.933483, 0, 1, 0.3333333, 1,
-0.3321978, 0.009581933, -0.675299, 0, 1, 0.3411765, 1,
-0.3265782, -0.03994788, -1.96119, 0, 1, 0.345098, 1,
-0.3258109, 0.4262746, 0.6272511, 0, 1, 0.3529412, 1,
-0.3248269, 1.220191, -2.021137, 0, 1, 0.3568628, 1,
-0.3224086, 0.7126027, 1.309393, 0, 1, 0.3647059, 1,
-0.3223883, -0.324391, -3.552431, 0, 1, 0.3686275, 1,
-0.3101454, 0.3295387, 0.449627, 0, 1, 0.3764706, 1,
-0.3095434, 0.8383376, -2.283306, 0, 1, 0.3803922, 1,
-0.30829, 0.6035375, 0.182824, 0, 1, 0.3882353, 1,
-0.3070654, -1.108315, -3.508121, 0, 1, 0.3921569, 1,
-0.3032642, -0.8228801, -3.019004, 0, 1, 0.4, 1,
-0.3018119, 0.3156648, -1.116841, 0, 1, 0.4078431, 1,
-0.2996646, -1.585277, -1.564732, 0, 1, 0.4117647, 1,
-0.2960707, -0.08317476, -2.044392, 0, 1, 0.4196078, 1,
-0.2928075, 0.2823399, -0.1984418, 0, 1, 0.4235294, 1,
-0.2890269, -0.522505, -2.845111, 0, 1, 0.4313726, 1,
-0.2877554, 0.1468985, -2.487426, 0, 1, 0.4352941, 1,
-0.2860489, 1.334017, -0.3548392, 0, 1, 0.4431373, 1,
-0.277143, 0.1595439, -0.5524434, 0, 1, 0.4470588, 1,
-0.2735345, -0.1377964, -0.887556, 0, 1, 0.454902, 1,
-0.270858, -1.31393, -2.777973, 0, 1, 0.4588235, 1,
-0.2652079, 1.894186, 1.592355, 0, 1, 0.4666667, 1,
-0.2602273, 0.5292319, -0.2053078, 0, 1, 0.4705882, 1,
-0.2575279, 0.4815935, -1.415126, 0, 1, 0.4784314, 1,
-0.2543016, -0.9840643, -3.484056, 0, 1, 0.4823529, 1,
-0.2524411, 0.09572764, -2.254723, 0, 1, 0.4901961, 1,
-0.2523883, 1.421043, 0.04071935, 0, 1, 0.4941176, 1,
-0.2497837, 1.452879, 1.947681, 0, 1, 0.5019608, 1,
-0.2483621, 0.8249666, 0.02996447, 0, 1, 0.509804, 1,
-0.2479979, 0.2432908, -1.514647, 0, 1, 0.5137255, 1,
-0.2476748, -0.1328677, -2.471908, 0, 1, 0.5215687, 1,
-0.2467137, 2.986718, -0.5573683, 0, 1, 0.5254902, 1,
-0.245325, 0.657378, -1.278216, 0, 1, 0.5333334, 1,
-0.2443831, -0.3726348, -4.019706, 0, 1, 0.5372549, 1,
-0.2407048, -1.069343, -1.498857, 0, 1, 0.5450981, 1,
-0.2368222, 1.405781, 0.6057172, 0, 1, 0.5490196, 1,
-0.2326856, 1.491238, -0.05104905, 0, 1, 0.5568628, 1,
-0.2312353, -0.2471188, -2.26649, 0, 1, 0.5607843, 1,
-0.2280469, -0.5515363, -3.452856, 0, 1, 0.5686275, 1,
-0.226391, 0.8723509, -0.8499653, 0, 1, 0.572549, 1,
-0.225902, 0.604409, -0.20285, 0, 1, 0.5803922, 1,
-0.2220924, 0.06957478, 0.2725721, 0, 1, 0.5843138, 1,
-0.2203886, 1.985145, 0.9272826, 0, 1, 0.5921569, 1,
-0.2170604, -0.2105907, -2.638611, 0, 1, 0.5960785, 1,
-0.2166055, -0.01389381, -1.896789, 0, 1, 0.6039216, 1,
-0.2163805, 1.122855, 0.08348466, 0, 1, 0.6117647, 1,
-0.2163304, -0.242156, -0.4930525, 0, 1, 0.6156863, 1,
-0.2159516, 1.163285, 0.6747697, 0, 1, 0.6235294, 1,
-0.2155192, 1.09625, 0.5991726, 0, 1, 0.627451, 1,
-0.2134628, -0.7572818, -2.937563, 0, 1, 0.6352941, 1,
-0.2115367, 2.544173, -0.9386962, 0, 1, 0.6392157, 1,
-0.2087476, 1.101108, -0.3192234, 0, 1, 0.6470588, 1,
-0.2064831, 0.5867468, -1.262255, 0, 1, 0.6509804, 1,
-0.1990321, 0.6980312, 0.7653472, 0, 1, 0.6588235, 1,
-0.1978727, -0.5406104, -3.716459, 0, 1, 0.6627451, 1,
-0.1937471, -0.8765035, -4.116591, 0, 1, 0.6705883, 1,
-0.1788552, -0.08540367, -2.1978, 0, 1, 0.6745098, 1,
-0.1731639, 0.720289, -0.9243599, 0, 1, 0.682353, 1,
-0.1715584, -0.06567694, -2.070268, 0, 1, 0.6862745, 1,
-0.166377, 0.3761106, -0.721856, 0, 1, 0.6941177, 1,
-0.1648963, 1.008974, 1.204312, 0, 1, 0.7019608, 1,
-0.1647638, 1.212089, -0.4337485, 0, 1, 0.7058824, 1,
-0.1585385, 1.576393, -0.9388283, 0, 1, 0.7137255, 1,
-0.1571645, 0.3675854, 0.7830079, 0, 1, 0.7176471, 1,
-0.1566739, -0.3515952, -3.617347, 0, 1, 0.7254902, 1,
-0.155482, 0.8192751, -0.8806609, 0, 1, 0.7294118, 1,
-0.1539898, 0.0894791, -1.734724, 0, 1, 0.7372549, 1,
-0.1466991, -0.1019299, -2.323135, 0, 1, 0.7411765, 1,
-0.1409533, 1.363035, -0.03311625, 0, 1, 0.7490196, 1,
-0.1379164, 1.724787, -2.355417, 0, 1, 0.7529412, 1,
-0.1344035, 0.7876683, -1.57073, 0, 1, 0.7607843, 1,
-0.1339284, -0.02806758, -1.703379, 0, 1, 0.7647059, 1,
-0.1291676, 1.575667, 0.6539157, 0, 1, 0.772549, 1,
-0.1267338, -0.9768437, -2.149143, 0, 1, 0.7764706, 1,
-0.1232416, 0.1993385, -0.8187439, 0, 1, 0.7843137, 1,
-0.1195984, 0.3144162, -0.3727219, 0, 1, 0.7882353, 1,
-0.117298, -0.4117142, -1.611012, 0, 1, 0.7960784, 1,
-0.1140041, 1.209867, -0.7883097, 0, 1, 0.8039216, 1,
-0.1106347, -0.5394664, -2.947184, 0, 1, 0.8078431, 1,
-0.1099411, -2.866262, -1.023475, 0, 1, 0.8156863, 1,
-0.1069276, -2.305543, -3.260174, 0, 1, 0.8196079, 1,
-0.1006037, 0.534638, -1.218523, 0, 1, 0.827451, 1,
-0.1005098, 0.2998523, 1.350161, 0, 1, 0.8313726, 1,
-0.1004281, 0.4589493, -0.06317493, 0, 1, 0.8392157, 1,
-0.1003844, -0.1569736, -2.792231, 0, 1, 0.8431373, 1,
-0.09699995, 0.3707001, -0.6145365, 0, 1, 0.8509804, 1,
-0.09645911, -0.2847922, -3.844846, 0, 1, 0.854902, 1,
-0.09618722, 0.1082942, 0.4805724, 0, 1, 0.8627451, 1,
-0.09150982, 0.507684, 0.6577215, 0, 1, 0.8666667, 1,
-0.09113121, 0.3777782, 0.5548936, 0, 1, 0.8745098, 1,
-0.09058395, -0.2860221, -2.07137, 0, 1, 0.8784314, 1,
-0.0880649, 0.2046693, 0.08898756, 0, 1, 0.8862745, 1,
-0.08529132, -0.4778035, -5.252449, 0, 1, 0.8901961, 1,
-0.08094299, 0.4425224, -0.7567633, 0, 1, 0.8980392, 1,
-0.0797369, -0.1478884, -3.044316, 0, 1, 0.9058824, 1,
-0.07677051, -0.6342272, -3.214154, 0, 1, 0.9098039, 1,
-0.07547369, -1.32322, -2.928006, 0, 1, 0.9176471, 1,
-0.07532364, -0.2528443, -3.484918, 0, 1, 0.9215686, 1,
-0.07253192, -0.7629424, -3.530117, 0, 1, 0.9294118, 1,
-0.06720848, 1.319512, 0.9992915, 0, 1, 0.9333333, 1,
-0.0581981, 0.8566856, 0.8589144, 0, 1, 0.9411765, 1,
-0.05557271, 1.634259, -1.070629, 0, 1, 0.945098, 1,
-0.05489342, 0.00543202, -3.711693, 0, 1, 0.9529412, 1,
-0.04791259, -0.8558142, -2.588022, 0, 1, 0.9568627, 1,
-0.04469469, -1.056248, -1.740195, 0, 1, 0.9647059, 1,
-0.04429522, -0.3324283, -3.316371, 0, 1, 0.9686275, 1,
-0.04339848, 1.416311, -0.1398485, 0, 1, 0.9764706, 1,
-0.03726595, 0.9683409, 0.5668572, 0, 1, 0.9803922, 1,
-0.03243084, 0.3474783, -1.396494, 0, 1, 0.9882353, 1,
-0.03145441, 0.5342188, -0.6506366, 0, 1, 0.9921569, 1,
-0.02671124, 0.01492645, 0.9709641, 0, 1, 1, 1,
-0.0181606, -0.607084, -2.404343, 0, 0.9921569, 1, 1,
-0.01549761, -0.3881437, -2.12411, 0, 0.9882353, 1, 1,
-0.01514877, -1.218231, -3.205176, 0, 0.9803922, 1, 1,
-0.01105579, 0.06333008, 0.7062805, 0, 0.9764706, 1, 1,
-0.0105737, -1.007995, -2.6625, 0, 0.9686275, 1, 1,
-0.006295993, 1.043992, -0.3871267, 0, 0.9647059, 1, 1,
-0.00321753, 1.223345, 0.8452217, 0, 0.9568627, 1, 1,
-0.002953772, -0.3869234, -2.964425, 0, 0.9529412, 1, 1,
0.004680339, -1.316738, 1.534798, 0, 0.945098, 1, 1,
0.004997412, -0.4735397, 4.506899, 0, 0.9411765, 1, 1,
0.007907731, 0.5395614, -0.7242936, 0, 0.9333333, 1, 1,
0.009287982, -1.071979, 3.605523, 0, 0.9294118, 1, 1,
0.01454909, -0.8630933, 3.409832, 0, 0.9215686, 1, 1,
0.01529421, 0.6368715, -0.03434921, 0, 0.9176471, 1, 1,
0.01637797, -0.7455447, 4.260058, 0, 0.9098039, 1, 1,
0.01846487, -1.61435, 1.744011, 0, 0.9058824, 1, 1,
0.01964886, -0.6806987, 1.146688, 0, 0.8980392, 1, 1,
0.02200292, -0.7341612, 4.186767, 0, 0.8901961, 1, 1,
0.02313593, 0.01419455, 1.632832, 0, 0.8862745, 1, 1,
0.02624833, -0.7444733, 1.280263, 0, 0.8784314, 1, 1,
0.03008492, -0.9583726, 3.069621, 0, 0.8745098, 1, 1,
0.03010781, 0.5296898, 1.010911, 0, 0.8666667, 1, 1,
0.04060965, -0.293004, 3.905603, 0, 0.8627451, 1, 1,
0.04440239, -0.2994835, 4.697315, 0, 0.854902, 1, 1,
0.04639494, -1.923126, 2.251451, 0, 0.8509804, 1, 1,
0.04923777, -0.18907, 3.418358, 0, 0.8431373, 1, 1,
0.05397206, 0.5191638, -0.2580139, 0, 0.8392157, 1, 1,
0.05460512, 0.4360306, 0.3125699, 0, 0.8313726, 1, 1,
0.05646221, -1.577103, 3.582955, 0, 0.827451, 1, 1,
0.05705201, -0.09477835, 2.364865, 0, 0.8196079, 1, 1,
0.05873436, -0.8918099, 2.984998, 0, 0.8156863, 1, 1,
0.06030737, 1.080355, -0.2550448, 0, 0.8078431, 1, 1,
0.06654302, 0.7639861, -0.6384417, 0, 0.8039216, 1, 1,
0.07344753, -0.7271838, 4.681733, 0, 0.7960784, 1, 1,
0.07549034, -0.6519915, 3.062324, 0, 0.7882353, 1, 1,
0.07728793, -0.04794401, 1.628945, 0, 0.7843137, 1, 1,
0.07749856, -0.5631344, 3.094317, 0, 0.7764706, 1, 1,
0.08737699, 0.6168647, 0.8776796, 0, 0.772549, 1, 1,
0.09085897, 0.2498145, -1.814558, 0, 0.7647059, 1, 1,
0.0924424, -0.3440092, 1.638452, 0, 0.7607843, 1, 1,
0.09477954, 0.4175518, 1.515279, 0, 0.7529412, 1, 1,
0.09479562, 0.6038342, 0.6522237, 0, 0.7490196, 1, 1,
0.09537528, 0.5701131, -0.8304626, 0, 0.7411765, 1, 1,
0.09860744, 0.2860696, -0.6379506, 0, 0.7372549, 1, 1,
0.09909249, -0.5618597, 2.208259, 0, 0.7294118, 1, 1,
0.0991756, -0.7417511, 3.958915, 0, 0.7254902, 1, 1,
0.1008747, 1.378573, -0.5488567, 0, 0.7176471, 1, 1,
0.1043459, 2.022675, 0.8734866, 0, 0.7137255, 1, 1,
0.1053961, 0.827913, 1.80993, 0, 0.7058824, 1, 1,
0.1148758, 0.7325177, -0.3721353, 0, 0.6980392, 1, 1,
0.1150936, -1.179254, 2.47709, 0, 0.6941177, 1, 1,
0.1178175, 1.568165, -0.7429447, 0, 0.6862745, 1, 1,
0.1183135, -1.509355, 3.405461, 0, 0.682353, 1, 1,
0.1183358, 0.03730145, 0.5515194, 0, 0.6745098, 1, 1,
0.1183956, 0.06952556, 1.238692, 0, 0.6705883, 1, 1,
0.1233457, -0.167526, 4.018029, 0, 0.6627451, 1, 1,
0.1250331, -0.4537193, 3.539696, 0, 0.6588235, 1, 1,
0.1254092, 1.729836, 2.336743, 0, 0.6509804, 1, 1,
0.1267896, -0.2533744, 2.09195, 0, 0.6470588, 1, 1,
0.128258, 1.585444, -0.01484582, 0, 0.6392157, 1, 1,
0.1285897, -0.5248474, 3.328028, 0, 0.6352941, 1, 1,
0.1322681, 1.279435, -1.154858, 0, 0.627451, 1, 1,
0.1330096, -1.909176, 4.086162, 0, 0.6235294, 1, 1,
0.1336845, -0.06613045, 2.612928, 0, 0.6156863, 1, 1,
0.1394274, 0.7503783, 1.024175, 0, 0.6117647, 1, 1,
0.1408225, 0.6244198, 0.6995314, 0, 0.6039216, 1, 1,
0.1467653, -1.113399, 3.60424, 0, 0.5960785, 1, 1,
0.1504034, 1.373565, -0.7367286, 0, 0.5921569, 1, 1,
0.1511401, 0.7115241, 0.6332774, 0, 0.5843138, 1, 1,
0.1520958, -0.0952164, 1.771819, 0, 0.5803922, 1, 1,
0.1522431, -2.902491, 3.382843, 0, 0.572549, 1, 1,
0.1546486, -1.542867, 3.281195, 0, 0.5686275, 1, 1,
0.155858, -0.1167676, 2.719581, 0, 0.5607843, 1, 1,
0.1566007, -0.6751197, 4.817489, 0, 0.5568628, 1, 1,
0.1573106, 1.059506, 0.4697901, 0, 0.5490196, 1, 1,
0.1583097, -0.6448034, 1.984085, 0, 0.5450981, 1, 1,
0.1631754, 0.1461408, 2.109487, 0, 0.5372549, 1, 1,
0.1656754, -0.7820836, 3.268719, 0, 0.5333334, 1, 1,
0.1691616, 1.743259, 1.243791, 0, 0.5254902, 1, 1,
0.1702826, -1.947716, 2.104898, 0, 0.5215687, 1, 1,
0.1707034, -0.3901565, 3.441463, 0, 0.5137255, 1, 1,
0.1766555, 1.831223, 1.475229, 0, 0.509804, 1, 1,
0.1767751, 0.2779452, -0.4015602, 0, 0.5019608, 1, 1,
0.1816749, 1.334446, -0.09642323, 0, 0.4941176, 1, 1,
0.1859509, -0.6397763, 3.610873, 0, 0.4901961, 1, 1,
0.1866567, -0.08001419, 2.821348, 0, 0.4823529, 1, 1,
0.1883772, 0.7231014, 0.4532573, 0, 0.4784314, 1, 1,
0.1924192, 0.2026623, -0.002200869, 0, 0.4705882, 1, 1,
0.1925404, 0.4530534, 0.01076118, 0, 0.4666667, 1, 1,
0.1946728, 0.738938, 0.5558857, 0, 0.4588235, 1, 1,
0.1994788, -1.753818, 1.637989, 0, 0.454902, 1, 1,
0.2086933, 2.309059, -0.06067852, 0, 0.4470588, 1, 1,
0.209189, 1.487717, 2.164253, 0, 0.4431373, 1, 1,
0.2112818, -2.911533, 1.687864, 0, 0.4352941, 1, 1,
0.2176198, -0.8736362, 3.153288, 0, 0.4313726, 1, 1,
0.217728, 0.4661698, 0.2853, 0, 0.4235294, 1, 1,
0.2197786, -0.01711063, 1.502868, 0, 0.4196078, 1, 1,
0.220463, -0.1628692, 2.101187, 0, 0.4117647, 1, 1,
0.2258959, -0.4618358, 1.354481, 0, 0.4078431, 1, 1,
0.2321943, -0.1976812, 3.278828, 0, 0.4, 1, 1,
0.2331873, 1.414735, 1.536337, 0, 0.3921569, 1, 1,
0.236118, -0.6746694, 2.766545, 0, 0.3882353, 1, 1,
0.2392868, -0.2998314, 2.197177, 0, 0.3803922, 1, 1,
0.2413981, -0.06931406, 1.582376, 0, 0.3764706, 1, 1,
0.2516693, 0.194296, 2.553697, 0, 0.3686275, 1, 1,
0.2529057, -1.042098, 1.146791, 0, 0.3647059, 1, 1,
0.2533953, 0.2323224, 0.4551798, 0, 0.3568628, 1, 1,
0.2538868, -1.023239, 4.432711, 0, 0.3529412, 1, 1,
0.2546809, -0.2336793, 3.253312, 0, 0.345098, 1, 1,
0.2599664, 0.5761331, 0.3574845, 0, 0.3411765, 1, 1,
0.264983, 0.6928539, 0.1883649, 0, 0.3333333, 1, 1,
0.2668667, 0.5075807, 0.5186574, 0, 0.3294118, 1, 1,
0.2686768, 1.002621, 0.6690461, 0, 0.3215686, 1, 1,
0.2697115, 0.4857792, 1.545597, 0, 0.3176471, 1, 1,
0.2767485, -0.09553402, 1.242602, 0, 0.3098039, 1, 1,
0.2809539, 0.7579854, -0.5581711, 0, 0.3058824, 1, 1,
0.2819951, -0.6600565, 1.773296, 0, 0.2980392, 1, 1,
0.2840289, -0.7975442, 0.5201429, 0, 0.2901961, 1, 1,
0.2885384, -0.5997474, 4.665122, 0, 0.2862745, 1, 1,
0.2892555, -0.2178999, 2.470675, 0, 0.2784314, 1, 1,
0.2917463, 1.103878, 1.810346, 0, 0.2745098, 1, 1,
0.2921348, -0.4019501, 1.835793, 0, 0.2666667, 1, 1,
0.2928607, 0.5210887, 1.953348, 0, 0.2627451, 1, 1,
0.2973294, 0.2038943, 1.677888, 0, 0.254902, 1, 1,
0.2979726, -0.344985, 2.770256, 0, 0.2509804, 1, 1,
0.2983034, -0.4050932, 2.106334, 0, 0.2431373, 1, 1,
0.2988182, 0.3173222, -0.593984, 0, 0.2392157, 1, 1,
0.3005831, 0.5050423, -0.3706782, 0, 0.2313726, 1, 1,
0.3028294, 0.2411744, 1.653152, 0, 0.227451, 1, 1,
0.3034835, 0.2665998, 1.765384, 0, 0.2196078, 1, 1,
0.3040962, -0.4244903, 2.766404, 0, 0.2156863, 1, 1,
0.3084869, -2.252133, 2.918425, 0, 0.2078431, 1, 1,
0.31045, 0.04608113, 2.064243, 0, 0.2039216, 1, 1,
0.3131961, 0.5222409, 1.943843, 0, 0.1960784, 1, 1,
0.3132783, 0.3601471, 2.003983, 0, 0.1882353, 1, 1,
0.3152879, 0.9873512, -0.6785303, 0, 0.1843137, 1, 1,
0.3169215, 0.8756326, -0.5458483, 0, 0.1764706, 1, 1,
0.3246045, -0.7794586, 2.508656, 0, 0.172549, 1, 1,
0.3265337, -1.011234, 3.328242, 0, 0.1647059, 1, 1,
0.3277026, 0.8697207, 0.6874028, 0, 0.1607843, 1, 1,
0.3338938, -0.1061085, 1.944711, 0, 0.1529412, 1, 1,
0.3341859, -1.146221, 2.97142, 0, 0.1490196, 1, 1,
0.3350657, 0.5458601, 1.082906, 0, 0.1411765, 1, 1,
0.3387716, 1.917856, -0.1336939, 0, 0.1372549, 1, 1,
0.3523259, 0.9936431, -1.093185, 0, 0.1294118, 1, 1,
0.3535988, 1.016362, 1.834381, 0, 0.1254902, 1, 1,
0.3559112, 1.05704, 1.302432, 0, 0.1176471, 1, 1,
0.3599471, 1.685189, 1.855334, 0, 0.1137255, 1, 1,
0.3649077, 0.524204, 2.396791, 0, 0.1058824, 1, 1,
0.3651719, 0.1084374, -0.3913972, 0, 0.09803922, 1, 1,
0.3655525, 1.063822, 0.4302965, 0, 0.09411765, 1, 1,
0.3673382, 1.015988, -0.7619517, 0, 0.08627451, 1, 1,
0.3678554, -0.720207, 4.329714, 0, 0.08235294, 1, 1,
0.3760602, -0.02896146, 3.177727, 0, 0.07450981, 1, 1,
0.3769772, 0.640821, 1.325782, 0, 0.07058824, 1, 1,
0.3783532, -0.2653603, 3.013743, 0, 0.0627451, 1, 1,
0.3791291, 0.04620963, 2.176558, 0, 0.05882353, 1, 1,
0.3817378, 1.29914, 1.392042, 0, 0.05098039, 1, 1,
0.3852435, 0.6116801, 2.134353, 0, 0.04705882, 1, 1,
0.3862045, 0.5026506, 1.10155, 0, 0.03921569, 1, 1,
0.3973234, -0.6660627, 3.107953, 0, 0.03529412, 1, 1,
0.4010784, -0.8774638, 3.001623, 0, 0.02745098, 1, 1,
0.4022286, 0.2105155, 0.8244662, 0, 0.02352941, 1, 1,
0.402787, -0.5927541, -0.507278, 0, 0.01568628, 1, 1,
0.4045788, 1.873027, -0.1057489, 0, 0.01176471, 1, 1,
0.4077181, 0.002009534, 2.131249, 0, 0.003921569, 1, 1,
0.4084173, 0.1571522, 2.878338, 0.003921569, 0, 1, 1,
0.4109882, 1.634993, 0.2795751, 0.007843138, 0, 1, 1,
0.4117506, -0.8624184, 1.748777, 0.01568628, 0, 1, 1,
0.4122587, -0.3299248, 3.170325, 0.01960784, 0, 1, 1,
0.4125825, 0.1397327, 0.5107241, 0.02745098, 0, 1, 1,
0.4160646, -0.5945198, 1.186354, 0.03137255, 0, 1, 1,
0.4249272, 0.2877151, 2.600515, 0.03921569, 0, 1, 1,
0.4321866, 1.35034, 0.0650965, 0.04313726, 0, 1, 1,
0.4340617, 0.9383864, 0.4253682, 0.05098039, 0, 1, 1,
0.43471, -0.2345242, 3.552734, 0.05490196, 0, 1, 1,
0.4374874, -0.5517896, 2.905127, 0.0627451, 0, 1, 1,
0.4386033, 0.6992344, 2.150579, 0.06666667, 0, 1, 1,
0.4386724, 2.051823, 0.01413483, 0.07450981, 0, 1, 1,
0.4427881, -1.105492, 2.675954, 0.07843138, 0, 1, 1,
0.4461934, 0.01895873, -0.2800792, 0.08627451, 0, 1, 1,
0.4487938, -0.1896853, 0.2786046, 0.09019608, 0, 1, 1,
0.4524955, 0.3095471, 0.9319941, 0.09803922, 0, 1, 1,
0.4554898, -1.195071, 3.746494, 0.1058824, 0, 1, 1,
0.4561146, 1.406605, 0.7862159, 0.1098039, 0, 1, 1,
0.4564705, 0.7619582, -0.2720322, 0.1176471, 0, 1, 1,
0.4568865, 0.4491993, 1.636017, 0.1215686, 0, 1, 1,
0.4582982, 0.2973712, -0.2546234, 0.1294118, 0, 1, 1,
0.4647701, -0.85484, 2.46805, 0.1333333, 0, 1, 1,
0.4650991, 2.266065, 0.9527785, 0.1411765, 0, 1, 1,
0.470481, -0.1991812, 3.577901, 0.145098, 0, 1, 1,
0.4760722, 0.0744569, 0.1569008, 0.1529412, 0, 1, 1,
0.4807998, -1.151345, 3.148972, 0.1568628, 0, 1, 1,
0.484311, -0.007782312, 1.49991, 0.1647059, 0, 1, 1,
0.4861536, 0.1066599, -0.1955551, 0.1686275, 0, 1, 1,
0.4888293, -0.08496325, 1.946469, 0.1764706, 0, 1, 1,
0.4911208, 0.1577204, 1.457389, 0.1803922, 0, 1, 1,
0.496378, -1.731553, 1.001667, 0.1882353, 0, 1, 1,
0.4965415, -1.528486, 3.747007, 0.1921569, 0, 1, 1,
0.5003322, -1.632837, 2.050105, 0.2, 0, 1, 1,
0.5106338, 0.1308711, 1.576218, 0.2078431, 0, 1, 1,
0.5125453, 0.3391873, 1.301479, 0.2117647, 0, 1, 1,
0.5136188, -0.6593544, 0.8541856, 0.2196078, 0, 1, 1,
0.5209052, -0.1342541, 1.768266, 0.2235294, 0, 1, 1,
0.5231796, 0.4196655, 0.8503757, 0.2313726, 0, 1, 1,
0.5257728, -0.7917801, 1.377253, 0.2352941, 0, 1, 1,
0.5281147, -0.1689989, 1.871667, 0.2431373, 0, 1, 1,
0.5284789, -0.1192823, 1.352849, 0.2470588, 0, 1, 1,
0.5349331, -0.8850174, 1.53084, 0.254902, 0, 1, 1,
0.5385336, -0.3734865, 1.38613, 0.2588235, 0, 1, 1,
0.5468284, 1.71262, 2.464954, 0.2666667, 0, 1, 1,
0.5479878, 0.9430169, 1.746782, 0.2705882, 0, 1, 1,
0.5508489, 2.127849, 1.440874, 0.2784314, 0, 1, 1,
0.5511458, 0.680426, -2.17645, 0.282353, 0, 1, 1,
0.5515453, -1.237054, 1.580808, 0.2901961, 0, 1, 1,
0.5531011, 1.250057, 0.2175036, 0.2941177, 0, 1, 1,
0.5580607, 1.328056, -0.9425262, 0.3019608, 0, 1, 1,
0.5584022, 1.823882, 0.2530288, 0.3098039, 0, 1, 1,
0.5659431, -1.021832, 2.367787, 0.3137255, 0, 1, 1,
0.5666213, 0.6427859, -0.2808847, 0.3215686, 0, 1, 1,
0.5673056, 0.02437198, 0.7371337, 0.3254902, 0, 1, 1,
0.5737077, 1.920219, 0.4321985, 0.3333333, 0, 1, 1,
0.5743389, -0.4665855, 1.780355, 0.3372549, 0, 1, 1,
0.5789558, -0.09264192, 0.9564579, 0.345098, 0, 1, 1,
0.5847116, -1.517467, 3.096348, 0.3490196, 0, 1, 1,
0.5864249, -1.840119, 2.789908, 0.3568628, 0, 1, 1,
0.5897592, 0.7035455, 0.5776129, 0.3607843, 0, 1, 1,
0.5911537, 0.5345539, 1.627717, 0.3686275, 0, 1, 1,
0.6037397, 0.6488422, -2.128962, 0.372549, 0, 1, 1,
0.603954, 0.4291095, 2.134026, 0.3803922, 0, 1, 1,
0.6104015, -1.353317, 2.517267, 0.3843137, 0, 1, 1,
0.610931, 0.5297817, 1.83221, 0.3921569, 0, 1, 1,
0.6129108, 0.1710215, 2.403676, 0.3960784, 0, 1, 1,
0.6129762, -0.1314042, -0.9050683, 0.4039216, 0, 1, 1,
0.6211984, 0.3116461, 0.1753537, 0.4117647, 0, 1, 1,
0.6216244, 2.627008, 0.2743954, 0.4156863, 0, 1, 1,
0.621752, 2.071086, 0.09489333, 0.4235294, 0, 1, 1,
0.6227946, -0.1480692, 0.7314232, 0.427451, 0, 1, 1,
0.6261393, -0.4738829, 2.124714, 0.4352941, 0, 1, 1,
0.6286888, -1.531529, 3.692184, 0.4392157, 0, 1, 1,
0.6398326, 0.4519821, 1.942975, 0.4470588, 0, 1, 1,
0.6400999, -0.1712346, 2.834179, 0.4509804, 0, 1, 1,
0.6412406, -1.680074, 4.178684, 0.4588235, 0, 1, 1,
0.6426564, -1.14046, 3.068858, 0.4627451, 0, 1, 1,
0.6427851, 0.0100544, 2.273194, 0.4705882, 0, 1, 1,
0.6431888, 0.03660906, 1.641765, 0.4745098, 0, 1, 1,
0.6436583, 0.5528066, 0.1723716, 0.4823529, 0, 1, 1,
0.6457049, 0.5307904, 0.6270123, 0.4862745, 0, 1, 1,
0.6465019, 0.5794622, 1.649323, 0.4941176, 0, 1, 1,
0.6509688, 1.144465, -0.4685102, 0.5019608, 0, 1, 1,
0.6516492, -0.7546775, 4.275434, 0.5058824, 0, 1, 1,
0.6529827, 0.5316827, 3.373046, 0.5137255, 0, 1, 1,
0.660697, 0.3484174, 1.828122, 0.5176471, 0, 1, 1,
0.6637686, 0.623347, -0.5483317, 0.5254902, 0, 1, 1,
0.66563, -0.7328795, 2.729336, 0.5294118, 0, 1, 1,
0.666593, 1.214625, 1.366227, 0.5372549, 0, 1, 1,
0.6670522, -0.42342, 1.267844, 0.5411765, 0, 1, 1,
0.6680164, 0.7444852, 0.9432068, 0.5490196, 0, 1, 1,
0.6701812, -0.3765206, 1.528736, 0.5529412, 0, 1, 1,
0.6788765, 0.5792673, 0.06505796, 0.5607843, 0, 1, 1,
0.6812143, 1.733649, 1.407403, 0.5647059, 0, 1, 1,
0.6812797, 0.3623533, 1.403162, 0.572549, 0, 1, 1,
0.6824718, 0.2631479, 1.630967, 0.5764706, 0, 1, 1,
0.686084, -0.6078059, 1.734201, 0.5843138, 0, 1, 1,
0.688122, -0.8868671, 1.34003, 0.5882353, 0, 1, 1,
0.6891769, -0.1602083, 2.43681, 0.5960785, 0, 1, 1,
0.6977642, -0.1746838, 0.03448112, 0.6039216, 0, 1, 1,
0.7016746, 0.3597788, 0.9236537, 0.6078432, 0, 1, 1,
0.7021043, 0.02803314, -0.8547326, 0.6156863, 0, 1, 1,
0.7036576, -1.364148, 2.640296, 0.6196079, 0, 1, 1,
0.7039641, -0.9231335, 2.965096, 0.627451, 0, 1, 1,
0.7050947, -0.2235381, 1.348751, 0.6313726, 0, 1, 1,
0.7073947, -0.3018008, 1.326235, 0.6392157, 0, 1, 1,
0.709061, -0.7221378, 3.980983, 0.6431373, 0, 1, 1,
0.7091205, -0.7301527, 2.275885, 0.6509804, 0, 1, 1,
0.713174, 1.538959, 1.874212, 0.654902, 0, 1, 1,
0.7223004, 1.833691, -0.3232584, 0.6627451, 0, 1, 1,
0.723815, 0.08547689, 1.135674, 0.6666667, 0, 1, 1,
0.724233, 0.9030232, 1.176239, 0.6745098, 0, 1, 1,
0.7244558, -0.9846486, 2.087155, 0.6784314, 0, 1, 1,
0.7301734, -1.058812, 1.909284, 0.6862745, 0, 1, 1,
0.7373178, 0.1034381, 2.612275, 0.6901961, 0, 1, 1,
0.73813, 0.9308594, 3.289526, 0.6980392, 0, 1, 1,
0.7384155, 1.039625, -0.4703377, 0.7058824, 0, 1, 1,
0.7399614, -0.402439, 0.4979551, 0.7098039, 0, 1, 1,
0.7469465, 0.6677532, 1.456017, 0.7176471, 0, 1, 1,
0.7515411, 0.6674725, 0.9487447, 0.7215686, 0, 1, 1,
0.7524, -0.2043687, 1.655761, 0.7294118, 0, 1, 1,
0.7540088, -1.455412, 3.755092, 0.7333333, 0, 1, 1,
0.7541777, -1.188628, 2.850623, 0.7411765, 0, 1, 1,
0.7581503, 1.724133, -0.7471606, 0.7450981, 0, 1, 1,
0.7582568, 0.9391258, -0.7925447, 0.7529412, 0, 1, 1,
0.7612877, -0.5219784, 1.632015, 0.7568628, 0, 1, 1,
0.7617296, 0.2411536, 0.5357807, 0.7647059, 0, 1, 1,
0.7717974, -0.05609404, 0.7710082, 0.7686275, 0, 1, 1,
0.7785995, 0.7989811, 1.089848, 0.7764706, 0, 1, 1,
0.7817377, 1.663275, 1.567905, 0.7803922, 0, 1, 1,
0.7850648, -1.136312, 2.894814, 0.7882353, 0, 1, 1,
0.7879719, 1.166871, 0.6615536, 0.7921569, 0, 1, 1,
0.7884746, -0.1352412, 2.718229, 0.8, 0, 1, 1,
0.7943715, -0.4980699, 2.920597, 0.8078431, 0, 1, 1,
0.7982141, 0.2813214, -1.269471, 0.8117647, 0, 1, 1,
0.8002715, 0.5986425, -0.2007067, 0.8196079, 0, 1, 1,
0.8014691, 1.598323, -0.5453787, 0.8235294, 0, 1, 1,
0.8034264, -0.08788888, 2.387994, 0.8313726, 0, 1, 1,
0.8059847, -0.2222712, 0.752819, 0.8352941, 0, 1, 1,
0.8117269, -1.14501, 2.449188, 0.8431373, 0, 1, 1,
0.8124404, -0.3824714, 0.9566041, 0.8470588, 0, 1, 1,
0.8139649, -0.3559874, 0.9632285, 0.854902, 0, 1, 1,
0.8141708, 0.173924, 4.240488, 0.8588235, 0, 1, 1,
0.8171316, -0.823263, 1.987223, 0.8666667, 0, 1, 1,
0.819467, 1.401232, 2.445409, 0.8705882, 0, 1, 1,
0.8215715, -0.8817109, 2.751154, 0.8784314, 0, 1, 1,
0.8222283, 1.880007, 2.315495, 0.8823529, 0, 1, 1,
0.823587, -1.833394, 2.169415, 0.8901961, 0, 1, 1,
0.8252414, -0.6778546, 2.536381, 0.8941177, 0, 1, 1,
0.8268331, 0.6952712, 1.915647, 0.9019608, 0, 1, 1,
0.8334782, -0.8514821, 2.733728, 0.9098039, 0, 1, 1,
0.8340138, -0.1068881, 0.6461763, 0.9137255, 0, 1, 1,
0.8376813, 0.5774261, 1.352908, 0.9215686, 0, 1, 1,
0.8440698, -0.9089684, 1.90578, 0.9254902, 0, 1, 1,
0.8511794, -0.2677417, 1.959656, 0.9333333, 0, 1, 1,
0.8582584, -0.7957597, 2.281621, 0.9372549, 0, 1, 1,
0.8603775, -1.076369, 1.65272, 0.945098, 0, 1, 1,
0.8630769, -1.634225, 3.51933, 0.9490196, 0, 1, 1,
0.8683888, -1.431143, 2.661914, 0.9568627, 0, 1, 1,
0.8761011, -0.6915597, 2.39113, 0.9607843, 0, 1, 1,
0.8792969, 0.8298317, -1.120387, 0.9686275, 0, 1, 1,
0.8805694, -0.5069623, 2.025238, 0.972549, 0, 1, 1,
0.8810499, -1.641866, 1.711908, 0.9803922, 0, 1, 1,
0.882678, -0.01261901, -0.002370495, 0.9843137, 0, 1, 1,
0.8841605, -0.7208258, 0.9641843, 0.9921569, 0, 1, 1,
0.8882694, 1.794946, 0.4892682, 0.9960784, 0, 1, 1,
0.8890362, -0.7269288, 3.071629, 1, 0, 0.9960784, 1,
0.8890487, -0.7639201, 4.0439, 1, 0, 0.9882353, 1,
0.8892747, 1.014023, 2.846725, 1, 0, 0.9843137, 1,
0.8964587, -0.8921425, 1.66867, 1, 0, 0.9764706, 1,
0.9133618, -0.2103671, 1.925566, 1, 0, 0.972549, 1,
0.9196321, -1.33267, 3.956933, 1, 0, 0.9647059, 1,
0.9239046, 0.05883995, 2.78858, 1, 0, 0.9607843, 1,
0.9289071, -0.6750706, 0.9694165, 1, 0, 0.9529412, 1,
0.9320098, -1.412341, 3.455344, 1, 0, 0.9490196, 1,
0.9349411, 0.3109397, 1.655535, 1, 0, 0.9411765, 1,
0.9442229, 1.467216, 0.02166384, 1, 0, 0.9372549, 1,
0.9445433, -0.7798446, 2.332978, 1, 0, 0.9294118, 1,
0.9496821, 1.050502, 0.4555438, 1, 0, 0.9254902, 1,
0.9582683, 1.123688, 2.020845, 1, 0, 0.9176471, 1,
0.9591593, 1.812677, 1.135652, 1, 0, 0.9137255, 1,
0.9609103, -0.9328685, 2.892706, 1, 0, 0.9058824, 1,
0.9727352, 1.237903, 0.6657377, 1, 0, 0.9019608, 1,
0.9747261, 0.9544517, 1.33103, 1, 0, 0.8941177, 1,
0.9764724, 0.4425442, 1.624331, 1, 0, 0.8862745, 1,
0.9789541, 0.3037741, 1.254397, 1, 0, 0.8823529, 1,
0.9829295, 0.4026985, 2.177064, 1, 0, 0.8745098, 1,
0.9886836, 0.2678953, 0.5365325, 1, 0, 0.8705882, 1,
0.9910781, -1.213231, 4.024696, 1, 0, 0.8627451, 1,
1.001841, 0.7563245, 1.680039, 1, 0, 0.8588235, 1,
1.006399, -2.414418, 1.811756, 1, 0, 0.8509804, 1,
1.01482, -1.635345, 3.26501, 1, 0, 0.8470588, 1,
1.025683, -0.1570366, 0.6167621, 1, 0, 0.8392157, 1,
1.035542, -0.1891063, 1.177212, 1, 0, 0.8352941, 1,
1.03854, -0.4611759, 0.5993888, 1, 0, 0.827451, 1,
1.04118, -0.3682023, -0.1142664, 1, 0, 0.8235294, 1,
1.045884, 0.7699648, -1.158596, 1, 0, 0.8156863, 1,
1.048385, -0.003449573, 3.309869, 1, 0, 0.8117647, 1,
1.060776, -0.8741161, 1.437081, 1, 0, 0.8039216, 1,
1.065953, -1.317968, 3.065359, 1, 0, 0.7960784, 1,
1.066569, 0.07687131, 0.729327, 1, 0, 0.7921569, 1,
1.081347, 0.06434441, 3.094656, 1, 0, 0.7843137, 1,
1.083018, -1.784363, 1.180148, 1, 0, 0.7803922, 1,
1.090765, 0.09252936, -0.29304, 1, 0, 0.772549, 1,
1.097303, -1.299039, 3.287437, 1, 0, 0.7686275, 1,
1.101889, 0.2283531, 2.926562, 1, 0, 0.7607843, 1,
1.103177, -0.05274295, 1.373011, 1, 0, 0.7568628, 1,
1.134732, 1.692165, 0.6341609, 1, 0, 0.7490196, 1,
1.142689, 1.350695, 0.8671245, 1, 0, 0.7450981, 1,
1.146188, -0.9369738, 1.111659, 1, 0, 0.7372549, 1,
1.148648, 0.7013001, 0.5403512, 1, 0, 0.7333333, 1,
1.14914, 0.4035473, 0.1858277, 1, 0, 0.7254902, 1,
1.163203, -0.2629435, 3.131864, 1, 0, 0.7215686, 1,
1.177424, -0.3359087, 2.755085, 1, 0, 0.7137255, 1,
1.179411, -0.01319176, 2.217008, 1, 0, 0.7098039, 1,
1.185904, 0.04101557, 1.403284, 1, 0, 0.7019608, 1,
1.189398, 0.5158308, 0.744709, 1, 0, 0.6941177, 1,
1.196778, 0.312107, 1.893222, 1, 0, 0.6901961, 1,
1.197644, 1.296895, 0.8807198, 1, 0, 0.682353, 1,
1.202975, 0.4643666, 2.900819, 1, 0, 0.6784314, 1,
1.216071, 0.239737, -0.5907509, 1, 0, 0.6705883, 1,
1.228858, 0.1902051, 1.465289, 1, 0, 0.6666667, 1,
1.25387, 0.928381, 1.256187, 1, 0, 0.6588235, 1,
1.26735, -0.07542707, 3.051729, 1, 0, 0.654902, 1,
1.268597, -1.834901, 1.550134, 1, 0, 0.6470588, 1,
1.271121, -1.345406, 1.873522, 1, 0, 0.6431373, 1,
1.271174, 0.5177438, 1.289132, 1, 0, 0.6352941, 1,
1.281561, -0.3313861, 3.789116, 1, 0, 0.6313726, 1,
1.285671, 0.5396821, 1.309822, 1, 0, 0.6235294, 1,
1.286002, 0.5902802, 2.242271, 1, 0, 0.6196079, 1,
1.286051, -0.3708682, 2.308269, 1, 0, 0.6117647, 1,
1.302361, -1.420551, 1.170738, 1, 0, 0.6078432, 1,
1.312793, 0.4813968, 0.7190481, 1, 0, 0.6, 1,
1.318537, 0.1944121, 2.19225, 1, 0, 0.5921569, 1,
1.320653, 1.509321, -0.5475149, 1, 0, 0.5882353, 1,
1.324336, 0.05507568, 1.921051, 1, 0, 0.5803922, 1,
1.32451, -0.685043, 2.204859, 1, 0, 0.5764706, 1,
1.328148, -0.3562861, -0.5234778, 1, 0, 0.5686275, 1,
1.335698, 0.1352359, 0.4400431, 1, 0, 0.5647059, 1,
1.336472, -0.8505181, 1.671693, 1, 0, 0.5568628, 1,
1.346619, 0.455844, 1.214562, 1, 0, 0.5529412, 1,
1.352045, 1.131498, 0.6475836, 1, 0, 0.5450981, 1,
1.367264, -0.3251129, 0.9355564, 1, 0, 0.5411765, 1,
1.373514, -0.6782901, 3.216866, 1, 0, 0.5333334, 1,
1.374493, -0.8414133, 2.137022, 1, 0, 0.5294118, 1,
1.381004, 0.2174737, 0.7233812, 1, 0, 0.5215687, 1,
1.385981, 0.5455041, 1.366329, 1, 0, 0.5176471, 1,
1.390616, -0.3178528, 0.6315696, 1, 0, 0.509804, 1,
1.391199, -0.3811497, 2.386244, 1, 0, 0.5058824, 1,
1.395431, 0.3433058, 2.491566, 1, 0, 0.4980392, 1,
1.399571, 0.2263976, 0.5820277, 1, 0, 0.4901961, 1,
1.400319, -1.220849, 1.07638, 1, 0, 0.4862745, 1,
1.40315, 0.1147913, 3.231974, 1, 0, 0.4784314, 1,
1.409047, -0.1901211, 0.04555049, 1, 0, 0.4745098, 1,
1.423931, -1.233759, 1.642043, 1, 0, 0.4666667, 1,
1.429983, -0.3112398, 1.46217, 1, 0, 0.4627451, 1,
1.430916, -0.6810921, 1.89895, 1, 0, 0.454902, 1,
1.432369, -0.126109, 0.2389969, 1, 0, 0.4509804, 1,
1.433025, 1.178544, 1.461772, 1, 0, 0.4431373, 1,
1.434242, -0.786189, 2.203301, 1, 0, 0.4392157, 1,
1.453417, 0.3202446, 3.296619, 1, 0, 0.4313726, 1,
1.456735, -0.04352913, 1.816138, 1, 0, 0.427451, 1,
1.465396, 1.178508, 0.3398621, 1, 0, 0.4196078, 1,
1.474934, -0.5620351, 1.008036, 1, 0, 0.4156863, 1,
1.477919, 0.7505196, 1.094458, 1, 0, 0.4078431, 1,
1.478077, 1.320905, 0.4406835, 1, 0, 0.4039216, 1,
1.482964, 0.4170639, 0.6940894, 1, 0, 0.3960784, 1,
1.492677, -0.470218, 1.692553, 1, 0, 0.3882353, 1,
1.508824, 0.3212021, 0.06700933, 1, 0, 0.3843137, 1,
1.539433, -0.1283024, 1.733466, 1, 0, 0.3764706, 1,
1.553163, -2.298658, 0.3968273, 1, 0, 0.372549, 1,
1.559436, 1.497626, 1.882455, 1, 0, 0.3647059, 1,
1.562572, -0.9346514, 3.227005, 1, 0, 0.3607843, 1,
1.568965, 0.5620709, 0.6237066, 1, 0, 0.3529412, 1,
1.574947, -0.8564242, 2.080774, 1, 0, 0.3490196, 1,
1.631312, 0.07189146, 2.109293, 1, 0, 0.3411765, 1,
1.633433, 0.3491918, 0.7754956, 1, 0, 0.3372549, 1,
1.639846, 0.3758593, 1.207129, 1, 0, 0.3294118, 1,
1.639924, -0.06146461, 2.827266, 1, 0, 0.3254902, 1,
1.641902, -0.7843306, 2.54577, 1, 0, 0.3176471, 1,
1.643132, 0.5248355, 1.573722, 1, 0, 0.3137255, 1,
1.649956, 0.1659226, 1.624842, 1, 0, 0.3058824, 1,
1.650397, 0.1316254, 2.833349, 1, 0, 0.2980392, 1,
1.656884, -1.352526, 4.314412, 1, 0, 0.2941177, 1,
1.660883, -1.008519, 1.64626, 1, 0, 0.2862745, 1,
1.6801, -0.3266491, 2.931201, 1, 0, 0.282353, 1,
1.683702, 1.261001, 1.207134, 1, 0, 0.2745098, 1,
1.710586, 0.3733824, 3.075308, 1, 0, 0.2705882, 1,
1.710809, 0.3999099, 1.819482, 1, 0, 0.2627451, 1,
1.717571, 1.550257, 2.218395, 1, 0, 0.2588235, 1,
1.71764, -1.66652, 1.747699, 1, 0, 0.2509804, 1,
1.736928, 0.7422644, 0.6708106, 1, 0, 0.2470588, 1,
1.745119, -1.003584, -0.2766309, 1, 0, 0.2392157, 1,
1.74536, 0.1410271, 2.571401, 1, 0, 0.2352941, 1,
1.770763, -0.1825104, 0.9431143, 1, 0, 0.227451, 1,
1.772079, -0.2538846, 2.494717, 1, 0, 0.2235294, 1,
1.784567, -0.4521684, 2.938969, 1, 0, 0.2156863, 1,
1.795154, -0.07059343, 2.287686, 1, 0, 0.2117647, 1,
1.805344, 0.2039269, -0.05849947, 1, 0, 0.2039216, 1,
1.809399, -1.39929, 1.528474, 1, 0, 0.1960784, 1,
1.831689, 0.9557427, 0.7580122, 1, 0, 0.1921569, 1,
1.833579, -0.632848, 3.301928, 1, 0, 0.1843137, 1,
1.851257, 1.066603, -0.09543972, 1, 0, 0.1803922, 1,
1.858355, -2.356368, 2.415689, 1, 0, 0.172549, 1,
1.872959, -1.599367, 3.894693, 1, 0, 0.1686275, 1,
1.897215, -1.151467, 2.325451, 1, 0, 0.1607843, 1,
1.898262, -0.5399563, 2.681263, 1, 0, 0.1568628, 1,
1.900539, -0.1738372, 2.546194, 1, 0, 0.1490196, 1,
1.925686, 0.7886995, 2.207762, 1, 0, 0.145098, 1,
1.931039, -0.4313523, 1.643352, 1, 0, 0.1372549, 1,
1.947378, -0.1091214, 0.8349525, 1, 0, 0.1333333, 1,
1.95233, -0.2457997, 2.461834, 1, 0, 0.1254902, 1,
2.014386, 0.7991729, 0.4812714, 1, 0, 0.1215686, 1,
2.048584, -0.4330793, 3.676518, 1, 0, 0.1137255, 1,
2.075437, -0.2746067, 1.060478, 1, 0, 0.1098039, 1,
2.202465, 0.5864615, 1.212947, 1, 0, 0.1019608, 1,
2.206459, -0.5531188, 0.8256314, 1, 0, 0.09411765, 1,
2.243383, 0.3873723, 1.854364, 1, 0, 0.09019608, 1,
2.274891, 0.7006763, 1.760795, 1, 0, 0.08235294, 1,
2.322432, 0.7329693, 2.808539, 1, 0, 0.07843138, 1,
2.327375, -0.5672675, 1.481594, 1, 0, 0.07058824, 1,
2.402615, 1.851047, 1.95098, 1, 0, 0.06666667, 1,
2.429906, -0.2572485, 1.296945, 1, 0, 0.05882353, 1,
2.512034, -0.5099643, 1.111307, 1, 0, 0.05490196, 1,
2.544793, 1.416706, 0.1089437, 1, 0, 0.04705882, 1,
2.639864, -0.331833, 0.9643479, 1, 0, 0.04313726, 1,
2.754643, 0.2009788, 1.595711, 1, 0, 0.03529412, 1,
2.812482, -0.5892285, 1.151002, 1, 0, 0.03137255, 1,
2.895914, 0.9252641, 0.2349395, 1, 0, 0.02352941, 1,
2.896828, 1.944547, 1.233717, 1, 0, 0.01960784, 1,
3.023226, 0.2440276, 0.7315113, 1, 0, 0.01176471, 1,
3.030254, 0.6880381, 1.822825, 1, 0, 0.007843138, 1
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
-0.2359241, -4.158883, -6.959303, 0, -0.5, 0.5, 0.5,
-0.2359241, -4.158883, -6.959303, 1, -0.5, 0.5, 0.5,
-0.2359241, -4.158883, -6.959303, 1, 1.5, 0.5, 0.5,
-0.2359241, -4.158883, -6.959303, 0, 1.5, 0.5, 0.5
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
-4.609336, 0.3674586, -6.959303, 0, -0.5, 0.5, 0.5,
-4.609336, 0.3674586, -6.959303, 1, -0.5, 0.5, 0.5,
-4.609336, 0.3674586, -6.959303, 1, 1.5, 0.5, 0.5,
-4.609336, 0.3674586, -6.959303, 0, 1.5, 0.5, 0.5
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
-4.609336, -4.158883, -0.2174802, 0, -0.5, 0.5, 0.5,
-4.609336, -4.158883, -0.2174802, 1, -0.5, 0.5, 0.5,
-4.609336, -4.158883, -0.2174802, 1, 1.5, 0.5, 0.5,
-4.609336, -4.158883, -0.2174802, 0, 1.5, 0.5, 0.5
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
-3, -3.114342, -5.403498,
3, -3.114342, -5.403498,
-3, -3.114342, -5.403498,
-3, -3.288433, -5.662799,
-2, -3.114342, -5.403498,
-2, -3.288433, -5.662799,
-1, -3.114342, -5.403498,
-1, -3.288433, -5.662799,
0, -3.114342, -5.403498,
0, -3.288433, -5.662799,
1, -3.114342, -5.403498,
1, -3.288433, -5.662799,
2, -3.114342, -5.403498,
2, -3.288433, -5.662799,
3, -3.114342, -5.403498,
3, -3.288433, -5.662799
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
-3, -3.636613, -6.181401, 0, -0.5, 0.5, 0.5,
-3, -3.636613, -6.181401, 1, -0.5, 0.5, 0.5,
-3, -3.636613, -6.181401, 1, 1.5, 0.5, 0.5,
-3, -3.636613, -6.181401, 0, 1.5, 0.5, 0.5,
-2, -3.636613, -6.181401, 0, -0.5, 0.5, 0.5,
-2, -3.636613, -6.181401, 1, -0.5, 0.5, 0.5,
-2, -3.636613, -6.181401, 1, 1.5, 0.5, 0.5,
-2, -3.636613, -6.181401, 0, 1.5, 0.5, 0.5,
-1, -3.636613, -6.181401, 0, -0.5, 0.5, 0.5,
-1, -3.636613, -6.181401, 1, -0.5, 0.5, 0.5,
-1, -3.636613, -6.181401, 1, 1.5, 0.5, 0.5,
-1, -3.636613, -6.181401, 0, 1.5, 0.5, 0.5,
0, -3.636613, -6.181401, 0, -0.5, 0.5, 0.5,
0, -3.636613, -6.181401, 1, -0.5, 0.5, 0.5,
0, -3.636613, -6.181401, 1, 1.5, 0.5, 0.5,
0, -3.636613, -6.181401, 0, 1.5, 0.5, 0.5,
1, -3.636613, -6.181401, 0, -0.5, 0.5, 0.5,
1, -3.636613, -6.181401, 1, -0.5, 0.5, 0.5,
1, -3.636613, -6.181401, 1, 1.5, 0.5, 0.5,
1, -3.636613, -6.181401, 0, 1.5, 0.5, 0.5,
2, -3.636613, -6.181401, 0, -0.5, 0.5, 0.5,
2, -3.636613, -6.181401, 1, -0.5, 0.5, 0.5,
2, -3.636613, -6.181401, 1, 1.5, 0.5, 0.5,
2, -3.636613, -6.181401, 0, 1.5, 0.5, 0.5,
3, -3.636613, -6.181401, 0, -0.5, 0.5, 0.5,
3, -3.636613, -6.181401, 1, -0.5, 0.5, 0.5,
3, -3.636613, -6.181401, 1, 1.5, 0.5, 0.5,
3, -3.636613, -6.181401, 0, 1.5, 0.5, 0.5
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
-3.600087, -3, -5.403498,
-3.600087, 3, -5.403498,
-3.600087, -3, -5.403498,
-3.768295, -3, -5.662799,
-3.600087, -2, -5.403498,
-3.768295, -2, -5.662799,
-3.600087, -1, -5.403498,
-3.768295, -1, -5.662799,
-3.600087, 0, -5.403498,
-3.768295, 0, -5.662799,
-3.600087, 1, -5.403498,
-3.768295, 1, -5.662799,
-3.600087, 2, -5.403498,
-3.768295, 2, -5.662799,
-3.600087, 3, -5.403498,
-3.768295, 3, -5.662799
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
-4.104712, -3, -6.181401, 0, -0.5, 0.5, 0.5,
-4.104712, -3, -6.181401, 1, -0.5, 0.5, 0.5,
-4.104712, -3, -6.181401, 1, 1.5, 0.5, 0.5,
-4.104712, -3, -6.181401, 0, 1.5, 0.5, 0.5,
-4.104712, -2, -6.181401, 0, -0.5, 0.5, 0.5,
-4.104712, -2, -6.181401, 1, -0.5, 0.5, 0.5,
-4.104712, -2, -6.181401, 1, 1.5, 0.5, 0.5,
-4.104712, -2, -6.181401, 0, 1.5, 0.5, 0.5,
-4.104712, -1, -6.181401, 0, -0.5, 0.5, 0.5,
-4.104712, -1, -6.181401, 1, -0.5, 0.5, 0.5,
-4.104712, -1, -6.181401, 1, 1.5, 0.5, 0.5,
-4.104712, -1, -6.181401, 0, 1.5, 0.5, 0.5,
-4.104712, 0, -6.181401, 0, -0.5, 0.5, 0.5,
-4.104712, 0, -6.181401, 1, -0.5, 0.5, 0.5,
-4.104712, 0, -6.181401, 1, 1.5, 0.5, 0.5,
-4.104712, 0, -6.181401, 0, 1.5, 0.5, 0.5,
-4.104712, 1, -6.181401, 0, -0.5, 0.5, 0.5,
-4.104712, 1, -6.181401, 1, -0.5, 0.5, 0.5,
-4.104712, 1, -6.181401, 1, 1.5, 0.5, 0.5,
-4.104712, 1, -6.181401, 0, 1.5, 0.5, 0.5,
-4.104712, 2, -6.181401, 0, -0.5, 0.5, 0.5,
-4.104712, 2, -6.181401, 1, -0.5, 0.5, 0.5,
-4.104712, 2, -6.181401, 1, 1.5, 0.5, 0.5,
-4.104712, 2, -6.181401, 0, 1.5, 0.5, 0.5,
-4.104712, 3, -6.181401, 0, -0.5, 0.5, 0.5,
-4.104712, 3, -6.181401, 1, -0.5, 0.5, 0.5,
-4.104712, 3, -6.181401, 1, 1.5, 0.5, 0.5,
-4.104712, 3, -6.181401, 0, 1.5, 0.5, 0.5
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
-3.600087, -3.114342, -4,
-3.600087, -3.114342, 4,
-3.600087, -3.114342, -4,
-3.768295, -3.288433, -4,
-3.600087, -3.114342, -2,
-3.768295, -3.288433, -2,
-3.600087, -3.114342, 0,
-3.768295, -3.288433, 0,
-3.600087, -3.114342, 2,
-3.768295, -3.288433, 2,
-3.600087, -3.114342, 4,
-3.768295, -3.288433, 4
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
-4.104712, -3.636613, -4, 0, -0.5, 0.5, 0.5,
-4.104712, -3.636613, -4, 1, -0.5, 0.5, 0.5,
-4.104712, -3.636613, -4, 1, 1.5, 0.5, 0.5,
-4.104712, -3.636613, -4, 0, 1.5, 0.5, 0.5,
-4.104712, -3.636613, -2, 0, -0.5, 0.5, 0.5,
-4.104712, -3.636613, -2, 1, -0.5, 0.5, 0.5,
-4.104712, -3.636613, -2, 1, 1.5, 0.5, 0.5,
-4.104712, -3.636613, -2, 0, 1.5, 0.5, 0.5,
-4.104712, -3.636613, 0, 0, -0.5, 0.5, 0.5,
-4.104712, -3.636613, 0, 1, -0.5, 0.5, 0.5,
-4.104712, -3.636613, 0, 1, 1.5, 0.5, 0.5,
-4.104712, -3.636613, 0, 0, 1.5, 0.5, 0.5,
-4.104712, -3.636613, 2, 0, -0.5, 0.5, 0.5,
-4.104712, -3.636613, 2, 1, -0.5, 0.5, 0.5,
-4.104712, -3.636613, 2, 1, 1.5, 0.5, 0.5,
-4.104712, -3.636613, 2, 0, 1.5, 0.5, 0.5,
-4.104712, -3.636613, 4, 0, -0.5, 0.5, 0.5,
-4.104712, -3.636613, 4, 1, -0.5, 0.5, 0.5,
-4.104712, -3.636613, 4, 1, 1.5, 0.5, 0.5,
-4.104712, -3.636613, 4, 0, 1.5, 0.5, 0.5
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
-3.600087, -3.114342, -5.403498,
-3.600087, 3.84926, -5.403498,
-3.600087, -3.114342, 4.968538,
-3.600087, 3.84926, 4.968538,
-3.600087, -3.114342, -5.403498,
-3.600087, -3.114342, 4.968538,
-3.600087, 3.84926, -5.403498,
-3.600087, 3.84926, 4.968538,
-3.600087, -3.114342, -5.403498,
3.128239, -3.114342, -5.403498,
-3.600087, -3.114342, 4.968538,
3.128239, -3.114342, 4.968538,
-3.600087, 3.84926, -5.403498,
3.128239, 3.84926, -5.403498,
-3.600087, 3.84926, 4.968538,
3.128239, 3.84926, 4.968538,
3.128239, -3.114342, -5.403498,
3.128239, 3.84926, -5.403498,
3.128239, -3.114342, 4.968538,
3.128239, 3.84926, 4.968538,
3.128239, -3.114342, -5.403498,
3.128239, -3.114342, 4.968538,
3.128239, 3.84926, -5.403498,
3.128239, 3.84926, 4.968538
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
var radius = 7.576905;
var distance = 33.71051;
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
mvMatrix.translate( 0.2359241, -0.3674586, 0.2174802 );
mvMatrix.scale( 1.217583, 1.176445, 0.7898448 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.71051);
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
drazoxolon<-read.table("drazoxolon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-drazoxolon$V2
```

```
## Error in eval(expr, envir, enclos): object 'drazoxolon' not found
```

```r
y<-drazoxolon$V3
```

```
## Error in eval(expr, envir, enclos): object 'drazoxolon' not found
```

```r
z<-drazoxolon$V4
```

```
## Error in eval(expr, envir, enclos): object 'drazoxolon' not found
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
-3.502102, -1.45588, -0.9825247, 0, 0, 1, 1, 1,
-3.416096, 0.9171641, -1.675027, 1, 0, 0, 1, 1,
-3.184181, 0.8660843, -2.262072, 1, 0, 0, 1, 1,
-2.924835, -0.8309438, -1.007267, 1, 0, 0, 1, 1,
-2.71363, -0.5066668, -2.622365, 1, 0, 0, 1, 1,
-2.54919, -0.9071948, -1.73968, 1, 0, 0, 1, 1,
-2.543944, -0.0857622, -2.439108, 0, 0, 0, 1, 1,
-2.46824, 1.156995, -0.2878956, 0, 0, 0, 1, 1,
-2.458796, 1.021117, -1.955541, 0, 0, 0, 1, 1,
-2.427661, -0.2561725, -1.248629, 0, 0, 0, 1, 1,
-2.267208, -0.7641481, -2.881342, 0, 0, 0, 1, 1,
-2.123291, 0.6421451, -1.16553, 0, 0, 0, 1, 1,
-2.111351, -0.912174, -1.410188, 0, 0, 0, 1, 1,
-2.101813, -1.772888, -0.7158783, 1, 1, 1, 1, 1,
-1.995295, 0.4624931, -3.455471, 1, 1, 1, 1, 1,
-1.970957, -1.128871, -0.8282952, 1, 1, 1, 1, 1,
-1.944678, 0.7996828, -0.009084434, 1, 1, 1, 1, 1,
-1.939502, -0.8628612, -2.029381, 1, 1, 1, 1, 1,
-1.937488, -0.4656754, -1.172196, 1, 1, 1, 1, 1,
-1.905373, 0.7637774, -0.1534759, 1, 1, 1, 1, 1,
-1.903544, -0.08273102, -0.3877536, 1, 1, 1, 1, 1,
-1.891714, 2.14908, -1.690713, 1, 1, 1, 1, 1,
-1.891673, -0.7434963, -2.064053, 1, 1, 1, 1, 1,
-1.861832, -0.7243947, -1.768473, 1, 1, 1, 1, 1,
-1.851037, -0.1008556, 0.05126174, 1, 1, 1, 1, 1,
-1.836885, -1.302612, -1.774587, 1, 1, 1, 1, 1,
-1.835965, 0.1478933, -0.01828052, 1, 1, 1, 1, 1,
-1.818342, 0.1823594, -1.589992, 1, 1, 1, 1, 1,
-1.804491, -0.2158767, -2.078763, 0, 0, 1, 1, 1,
-1.773457, -0.7024151, -3.329834, 1, 0, 0, 1, 1,
-1.772441, 0.2905111, -2.250855, 1, 0, 0, 1, 1,
-1.766584, -0.2337304, -1.210508, 1, 0, 0, 1, 1,
-1.757166, -0.09792503, -1.27853, 1, 0, 0, 1, 1,
-1.752126, 1.656525, -0.9012307, 1, 0, 0, 1, 1,
-1.750278, 0.007201893, -0.1352428, 0, 0, 0, 1, 1,
-1.749064, 2.183144, -0.4963609, 0, 0, 0, 1, 1,
-1.736997, -0.01694129, -1.053788, 0, 0, 0, 1, 1,
-1.715271, 1.556285, -1.180963, 0, 0, 0, 1, 1,
-1.705838, 0.9237388, -0.9159034, 0, 0, 0, 1, 1,
-1.705342, -0.8307803, -2.588659, 0, 0, 0, 1, 1,
-1.703707, -0.2537462, -1.809598, 0, 0, 0, 1, 1,
-1.688419, 1.20777, -1.310963, 1, 1, 1, 1, 1,
-1.685369, -1.352774, -3.005319, 1, 1, 1, 1, 1,
-1.676621, 0.3345516, -2.341071, 1, 1, 1, 1, 1,
-1.672986, 0.1706043, -3.179839, 1, 1, 1, 1, 1,
-1.669244, 1.727228, 0.7664516, 1, 1, 1, 1, 1,
-1.64937, 0.1491691, -1.018714, 1, 1, 1, 1, 1,
-1.640408, 0.5242099, -0.1935271, 1, 1, 1, 1, 1,
-1.638234, -1.26372, -2.857879, 1, 1, 1, 1, 1,
-1.631034, 1.354195, -0.7218257, 1, 1, 1, 1, 1,
-1.613068, -0.5622184, -1.719242, 1, 1, 1, 1, 1,
-1.612473, 0.1347991, -0.7598368, 1, 1, 1, 1, 1,
-1.605661, -0.554369, -2.004993, 1, 1, 1, 1, 1,
-1.601214, 0.4229254, -1.294751, 1, 1, 1, 1, 1,
-1.600212, 0.8355491, -0.6092071, 1, 1, 1, 1, 1,
-1.598429, 0.4848098, -1.155995, 1, 1, 1, 1, 1,
-1.59028, 0.7146909, -0.794162, 0, 0, 1, 1, 1,
-1.573968, -0.7760351, -1.476449, 1, 0, 0, 1, 1,
-1.573278, 0.1466689, -1.646929, 1, 0, 0, 1, 1,
-1.561679, -0.1112341, -3.026365, 1, 0, 0, 1, 1,
-1.552745, -1.125011, -2.373873, 1, 0, 0, 1, 1,
-1.539092, 0.4394735, 1.241695, 1, 0, 0, 1, 1,
-1.516703, 0.07052662, -2.636099, 0, 0, 0, 1, 1,
-1.500292, -0.591503, -1.461057, 0, 0, 0, 1, 1,
-1.489503, 3.747848, 0.8877615, 0, 0, 0, 1, 1,
-1.48938, 0.8338902, 0.8517563, 0, 0, 0, 1, 1,
-1.486113, 1.108132, -0.516268, 0, 0, 0, 1, 1,
-1.483355, -1.278616, -3.629964, 0, 0, 0, 1, 1,
-1.483009, 0.04744627, -2.364324, 0, 0, 0, 1, 1,
-1.470568, 0.3729763, -1.661918, 1, 1, 1, 1, 1,
-1.468084, -0.268777, -0.5705185, 1, 1, 1, 1, 1,
-1.462035, -2.413154, -3.583386, 1, 1, 1, 1, 1,
-1.445772, 1.125699, -2.303677, 1, 1, 1, 1, 1,
-1.44175, 0.4517075, -3.436807, 1, 1, 1, 1, 1,
-1.435321, 1.181796, -2.775996, 1, 1, 1, 1, 1,
-1.432114, -0.467084, -1.258375, 1, 1, 1, 1, 1,
-1.429905, -0.8338284, -1.931227, 1, 1, 1, 1, 1,
-1.42767, -0.2139393, -3.282548, 1, 1, 1, 1, 1,
-1.421212, -2.454864, -3.121908, 1, 1, 1, 1, 1,
-1.410598, -0.7388148, -1.118277, 1, 1, 1, 1, 1,
-1.408659, -0.8831645, -2.02044, 1, 1, 1, 1, 1,
-1.406161, 0.2847079, -0.9058823, 1, 1, 1, 1, 1,
-1.404588, -2.011078, -3.623915, 1, 1, 1, 1, 1,
-1.392495, -0.1131735, -0.8746594, 1, 1, 1, 1, 1,
-1.379359, 1.011591, -0.8043556, 0, 0, 1, 1, 1,
-1.379219, 1.210021, -1.21454, 1, 0, 0, 1, 1,
-1.375008, -0.9623894, -1.119174, 1, 0, 0, 1, 1,
-1.36186, -0.08613123, -2.413082, 1, 0, 0, 1, 1,
-1.343987, -0.1266551, -1.903357, 1, 0, 0, 1, 1,
-1.331888, 2.017414, 1.581531, 1, 0, 0, 1, 1,
-1.330761, -0.4442803, -2.729128, 0, 0, 0, 1, 1,
-1.301738, 0.126616, -3.449257, 0, 0, 0, 1, 1,
-1.285742, 1.025012, 0.0505509, 0, 0, 0, 1, 1,
-1.28301, 0.3252732, -0.3537803, 0, 0, 0, 1, 1,
-1.282643, 1.406006, -0.4276353, 0, 0, 0, 1, 1,
-1.272179, -1.547273, -1.848808, 0, 0, 0, 1, 1,
-1.271102, -0.3848048, -1.815209, 0, 0, 0, 1, 1,
-1.269621, 0.1739626, -0.9692048, 1, 1, 1, 1, 1,
-1.264216, -1.205413, -1.604276, 1, 1, 1, 1, 1,
-1.260394, -1.000176, -1.806846, 1, 1, 1, 1, 1,
-1.256099, -2.260401, -2.449046, 1, 1, 1, 1, 1,
-1.251185, 1.126834, -0.9471136, 1, 1, 1, 1, 1,
-1.250138, 0.9183266, -1.162592, 1, 1, 1, 1, 1,
-1.247969, 0.2656478, -2.524872, 1, 1, 1, 1, 1,
-1.245568, -0.06727961, -1.483287, 1, 1, 1, 1, 1,
-1.242896, 0.8656391, 0.6474585, 1, 1, 1, 1, 1,
-1.234017, 0.5406474, 0.03760706, 1, 1, 1, 1, 1,
-1.224006, 0.07213993, -1.114388, 1, 1, 1, 1, 1,
-1.207366, -1.090485, -2.374084, 1, 1, 1, 1, 1,
-1.195838, -1.191568, -3.780098, 1, 1, 1, 1, 1,
-1.189124, 2.110523, -1.953132, 1, 1, 1, 1, 1,
-1.186483, -0.6944806, -2.761592, 1, 1, 1, 1, 1,
-1.179485, -0.5241147, -1.499119, 0, 0, 1, 1, 1,
-1.177452, -1.209023, -1.79508, 1, 0, 0, 1, 1,
-1.171957, 0.7458474, -0.2968922, 1, 0, 0, 1, 1,
-1.17138, -2.504511, -1.679204, 1, 0, 0, 1, 1,
-1.164391, -0.5338843, -0.21027, 1, 0, 0, 1, 1,
-1.153171, -0.1160866, -2.575735, 1, 0, 0, 1, 1,
-1.15315, -2.121224, -1.552357, 0, 0, 0, 1, 1,
-1.151842, -2.732203, -3.101525, 0, 0, 0, 1, 1,
-1.151795, -2.220467, -2.517802, 0, 0, 0, 1, 1,
-1.15139, 1.075017, -0.7444193, 0, 0, 0, 1, 1,
-1.151079, 0.1646088, -0.8165994, 0, 0, 0, 1, 1,
-1.139375, -0.6396671, -0.6778327, 0, 0, 0, 1, 1,
-1.137451, -1.042778, -2.452183, 0, 0, 0, 1, 1,
-1.132795, 0.1185827, -2.936325, 1, 1, 1, 1, 1,
-1.131157, 0.3716763, -2.136469, 1, 1, 1, 1, 1,
-1.129118, 1.264389, 0.1638508, 1, 1, 1, 1, 1,
-1.119879, -0.5460305, -0.6074325, 1, 1, 1, 1, 1,
-1.118414, 0.3083689, -0.6996835, 1, 1, 1, 1, 1,
-1.116772, -0.8290278, 0.2532647, 1, 1, 1, 1, 1,
-1.108927, -1.763924, -1.673219, 1, 1, 1, 1, 1,
-1.104689, -0.2373184, -1.966395, 1, 1, 1, 1, 1,
-1.094709, 1.096073, -0.9006086, 1, 1, 1, 1, 1,
-1.093309, -1.050696, -2.883137, 1, 1, 1, 1, 1,
-1.089902, 1.198903, -1.889597, 1, 1, 1, 1, 1,
-1.082752, 0.7054732, -3.891767, 1, 1, 1, 1, 1,
-1.080215, 0.4070545, -1.349657, 1, 1, 1, 1, 1,
-1.079403, 1.372076, 0.02024952, 1, 1, 1, 1, 1,
-1.077573, -1.624296, -2.832352, 1, 1, 1, 1, 1,
-1.069124, 0.8709814, -1.777782, 0, 0, 1, 1, 1,
-1.067118, 1.486114, -1.126048, 1, 0, 0, 1, 1,
-1.066304, 0.01647807, -1.29987, 1, 0, 0, 1, 1,
-1.066012, -0.105676, -1.635695, 1, 0, 0, 1, 1,
-1.063337, -0.04899743, -2.259787, 1, 0, 0, 1, 1,
-1.059772, -0.5099377, -2.598141, 1, 0, 0, 1, 1,
-1.055537, -1.040152, -0.7512808, 0, 0, 0, 1, 1,
-1.045549, 0.9089693, -1.328929, 0, 0, 0, 1, 1,
-1.040569, 0.6333576, -1.277511, 0, 0, 0, 1, 1,
-1.02806, 0.6972758, -0.6147113, 0, 0, 0, 1, 1,
-1.026282, 0.4015107, -1.136338, 0, 0, 0, 1, 1,
-1.024545, -0.9927624, -3.407498, 0, 0, 0, 1, 1,
-1.021567, 2.220345, 0.249498, 0, 0, 0, 1, 1,
-1.016729, 0.4576391, -1.081327, 1, 1, 1, 1, 1,
-1.01054, 0.458884, -1.283438, 1, 1, 1, 1, 1,
-0.9996708, 2.339658, -0.9967741, 1, 1, 1, 1, 1,
-0.9981515, -0.2858325, -2.498671, 1, 1, 1, 1, 1,
-0.9970438, -0.6707876, -1.644372, 1, 1, 1, 1, 1,
-0.9922568, 0.3314348, -1.698564, 1, 1, 1, 1, 1,
-0.9881766, -0.3189044, -0.2963422, 1, 1, 1, 1, 1,
-0.9834306, -0.2005692, -2.060883, 1, 1, 1, 1, 1,
-0.9761527, 0.1223948, -1.694355, 1, 1, 1, 1, 1,
-0.9759498, -0.2559768, -1.519681, 1, 1, 1, 1, 1,
-0.9703733, 0.1950642, -0.1607554, 1, 1, 1, 1, 1,
-0.9657421, 0.5154003, -0.9289215, 1, 1, 1, 1, 1,
-0.9634981, -1.167804, -2.016825, 1, 1, 1, 1, 1,
-0.9617338, -1.51386, -3.894923, 1, 1, 1, 1, 1,
-0.9603415, 1.052799, -2.454444, 1, 1, 1, 1, 1,
-0.9560536, 0.5749268, -1.692418, 0, 0, 1, 1, 1,
-0.9524816, 1.427703, -2.287592, 1, 0, 0, 1, 1,
-0.9520105, 1.369349, -1.359857, 1, 0, 0, 1, 1,
-0.9506332, -1.928828, -2.776425, 1, 0, 0, 1, 1,
-0.9490966, -1.876978, -3.053734, 1, 0, 0, 1, 1,
-0.9477587, 0.5083423, -2.465972, 1, 0, 0, 1, 1,
-0.9477103, 0.878202, -0.5009118, 0, 0, 0, 1, 1,
-0.9447606, -1.987742, -3.301322, 0, 0, 0, 1, 1,
-0.9430269, 0.4748181, -1.488754, 0, 0, 0, 1, 1,
-0.9404143, 0.1741918, -2.517964, 0, 0, 0, 1, 1,
-0.9390331, -0.9299173, -0.8180196, 0, 0, 0, 1, 1,
-0.9334986, 0.9879889, -1.170393, 0, 0, 0, 1, 1,
-0.9306557, -1.30223, -3.698386, 0, 0, 0, 1, 1,
-0.9247496, -1.360297, -1.814784, 1, 1, 1, 1, 1,
-0.9241248, -0.7570246, -3.037187, 1, 1, 1, 1, 1,
-0.9238153, 2.117661, 1.686275, 1, 1, 1, 1, 1,
-0.9103214, 1.480979, 0.6480931, 1, 1, 1, 1, 1,
-0.9037572, -0.9148427, -1.03704, 1, 1, 1, 1, 1,
-0.9021883, 0.4616082, 0.3354952, 1, 1, 1, 1, 1,
-0.8952938, 2.46114, 0.2515652, 1, 1, 1, 1, 1,
-0.8948398, -0.3571468, -3.467696, 1, 1, 1, 1, 1,
-0.8848122, -0.8277248, -2.580456, 1, 1, 1, 1, 1,
-0.8728848, -0.03495955, -1.123474, 1, 1, 1, 1, 1,
-0.87209, 0.5516653, -1.507111, 1, 1, 1, 1, 1,
-0.8614669, -0.9779824, -2.051565, 1, 1, 1, 1, 1,
-0.8580094, -3.012931, -4.44995, 1, 1, 1, 1, 1,
-0.8567126, -1.184533, -4.033927, 1, 1, 1, 1, 1,
-0.8522812, -0.6483384, -3.982769, 1, 1, 1, 1, 1,
-0.8515758, -0.1956476, -2.844422, 0, 0, 1, 1, 1,
-0.8482526, -0.1657378, -2.017433, 1, 0, 0, 1, 1,
-0.8481615, -0.4417532, -1.654496, 1, 0, 0, 1, 1,
-0.8368886, -0.3091669, -4.033978, 1, 0, 0, 1, 1,
-0.8337559, -1.568595, -2.654343, 1, 0, 0, 1, 1,
-0.8304314, -0.5980251, -2.805997, 1, 0, 0, 1, 1,
-0.8277858, -0.5985509, -2.480067, 0, 0, 0, 1, 1,
-0.8248776, 1.245381, 1.103794, 0, 0, 0, 1, 1,
-0.8236099, -0.4980636, -2.017, 0, 0, 0, 1, 1,
-0.8213792, -1.053669, -0.7934911, 0, 0, 0, 1, 1,
-0.8067163, 0.8073912, -1.434546, 0, 0, 0, 1, 1,
-0.8048783, -2.022177, -3.04707, 0, 0, 0, 1, 1,
-0.7998665, 2.362953, 0.7626536, 0, 0, 0, 1, 1,
-0.7991647, 0.2333869, -1.47095, 1, 1, 1, 1, 1,
-0.7867568, -1.267825, -1.662215, 1, 1, 1, 1, 1,
-0.7862282, 1.441485, -0.01690048, 1, 1, 1, 1, 1,
-0.7768162, 0.5616369, -1.484494, 1, 1, 1, 1, 1,
-0.7731912, -1.469036, -3.323046, 1, 1, 1, 1, 1,
-0.7704775, -0.3894983, -1.46811, 1, 1, 1, 1, 1,
-0.770477, 0.04974866, 0.9229099, 1, 1, 1, 1, 1,
-0.7704012, -0.1261498, -2.758473, 1, 1, 1, 1, 1,
-0.7684234, -1.867465, -2.048133, 1, 1, 1, 1, 1,
-0.7652875, 0.7251898, -1.676413, 1, 1, 1, 1, 1,
-0.7604516, 0.6670034, -0.1693405, 1, 1, 1, 1, 1,
-0.7589195, 0.701516, -0.100291, 1, 1, 1, 1, 1,
-0.7561846, 1.423355, -0.6024334, 1, 1, 1, 1, 1,
-0.753915, -0.9571456, -1.949266, 1, 1, 1, 1, 1,
-0.7484112, 0.07803033, -2.969566, 1, 1, 1, 1, 1,
-0.7480248, -1.086379, -2.684783, 0, 0, 1, 1, 1,
-0.7427059, 0.0416941, 0.2247887, 1, 0, 0, 1, 1,
-0.7285019, -1.330493, -3.079836, 1, 0, 0, 1, 1,
-0.7244906, -0.430445, -1.897467, 1, 0, 0, 1, 1,
-0.7232791, -1.03044, -3.374519, 1, 0, 0, 1, 1,
-0.721598, 1.160784, -1.197948, 1, 0, 0, 1, 1,
-0.7188809, -1.351608, -3.825426, 0, 0, 0, 1, 1,
-0.7181269, 0.5552948, -0.376766, 0, 0, 0, 1, 1,
-0.7133679, -0.3340951, -1.444065, 0, 0, 0, 1, 1,
-0.7023386, 0.04225933, -0.1358163, 0, 0, 0, 1, 1,
-0.7010782, -0.3313748, -1.775057, 0, 0, 0, 1, 1,
-0.7003817, 0.179907, -2.648217, 0, 0, 0, 1, 1,
-0.6896996, 0.7477822, -0.73111, 0, 0, 0, 1, 1,
-0.6850091, -1.082451, -3.232873, 1, 1, 1, 1, 1,
-0.6829304, -0.7195458, -3.272537, 1, 1, 1, 1, 1,
-0.6812926, -0.4714458, -2.091533, 1, 1, 1, 1, 1,
-0.680381, 1.370403, 0.4826051, 1, 1, 1, 1, 1,
-0.6790968, -2.328686, -1.739688, 1, 1, 1, 1, 1,
-0.6763471, -0.7684235, -1.269714, 1, 1, 1, 1, 1,
-0.6760596, 0.2900878, -1.122342, 1, 1, 1, 1, 1,
-0.6696764, -1.598123, -2.76764, 1, 1, 1, 1, 1,
-0.6659207, -0.7428131, -2.506175, 1, 1, 1, 1, 1,
-0.6641186, -1.679677, -2.351888, 1, 1, 1, 1, 1,
-0.6629043, -0.5185958, -0.3024422, 1, 1, 1, 1, 1,
-0.6620306, 1.743824, 0.7267913, 1, 1, 1, 1, 1,
-0.6619698, 1.260458, -2.166096, 1, 1, 1, 1, 1,
-0.6593671, -1.588064, -2.364585, 1, 1, 1, 1, 1,
-0.6575875, -1.271229, -3.748446, 1, 1, 1, 1, 1,
-0.6477654, 1.309978, 1.128197, 0, 0, 1, 1, 1,
-0.6474755, -0.3497967, -1.613449, 1, 0, 0, 1, 1,
-0.6442699, 0.8638343, 0.6201909, 1, 0, 0, 1, 1,
-0.6414931, -1.750267, -2.741326, 1, 0, 0, 1, 1,
-0.6355244, -0.6307283, -2.437957, 1, 0, 0, 1, 1,
-0.6317675, -0.8991438, -2.883544, 1, 0, 0, 1, 1,
-0.631681, 1.646836, 0.06183566, 0, 0, 0, 1, 1,
-0.6249524, -0.8071194, -2.85809, 0, 0, 0, 1, 1,
-0.6233964, -0.4170443, -2.744694, 0, 0, 0, 1, 1,
-0.6218972, 1.152093, 1.051578, 0, 0, 0, 1, 1,
-0.6204708, -2.011089, -3.744527, 0, 0, 0, 1, 1,
-0.6130608, -0.3762017, -1.530635, 0, 0, 0, 1, 1,
-0.6118136, -1.023457, -3.036715, 0, 0, 0, 1, 1,
-0.6043426, -0.740777, -3.74078, 1, 1, 1, 1, 1,
-0.6041169, 1.045976, -0.8944467, 1, 1, 1, 1, 1,
-0.6029871, 0.5276493, 0.3737448, 1, 1, 1, 1, 1,
-0.5958126, -0.5870063, -2.438302, 1, 1, 1, 1, 1,
-0.5953313, 0.9312761, -0.3534012, 1, 1, 1, 1, 1,
-0.5935117, 0.9495558, -1.901545, 1, 1, 1, 1, 1,
-0.5863348, -1.087019, -2.689831, 1, 1, 1, 1, 1,
-0.5807438, -1.543329, -3.620882, 1, 1, 1, 1, 1,
-0.5803516, -0.2933412, -2.050995, 1, 1, 1, 1, 1,
-0.5796981, -0.03694839, -0.7358049, 1, 1, 1, 1, 1,
-0.578977, -1.221709, -1.348634, 1, 1, 1, 1, 1,
-0.5778493, 0.1491698, -1.376545, 1, 1, 1, 1, 1,
-0.574026, -0.4303412, -2.659069, 1, 1, 1, 1, 1,
-0.5739734, -1.097063, -2.269038, 1, 1, 1, 1, 1,
-0.5721356, 1.318919, -1.186413, 1, 1, 1, 1, 1,
-0.5696653, 0.1400734, -0.3677727, 0, 0, 1, 1, 1,
-0.5679616, 0.6983912, -1.156929, 1, 0, 0, 1, 1,
-0.5667155, -0.2632454, -3.393245, 1, 0, 0, 1, 1,
-0.5648908, -0.1988953, -2.995287, 1, 0, 0, 1, 1,
-0.562328, -0.1821803, -3.174557, 1, 0, 0, 1, 1,
-0.5614855, -0.4970204, -1.653845, 1, 0, 0, 1, 1,
-0.5523227, 0.2337247, -0.4087088, 0, 0, 0, 1, 1,
-0.5490336, -0.6516553, -3.553805, 0, 0, 0, 1, 1,
-0.5486475, -0.611464, -3.036346, 0, 0, 0, 1, 1,
-0.5480083, 1.683103, -0.8170609, 0, 0, 0, 1, 1,
-0.5479991, 0.7106451, 0.02160834, 0, 0, 0, 1, 1,
-0.5470024, -0.3253779, -2.848729, 0, 0, 0, 1, 1,
-0.5455363, -2.28971, -2.109095, 0, 0, 0, 1, 1,
-0.5441481, 0.9184589, 0.1287327, 1, 1, 1, 1, 1,
-0.5416684, 0.1658687, 0.2702251, 1, 1, 1, 1, 1,
-0.5416023, -0.1313901, -3.305032, 1, 1, 1, 1, 1,
-0.5388877, -1.360022, -2.050714, 1, 1, 1, 1, 1,
-0.5380359, -0.447365, -3.345368, 1, 1, 1, 1, 1,
-0.5379046, -1.489157, -1.261428, 1, 1, 1, 1, 1,
-0.534911, -0.3876404, -1.039017, 1, 1, 1, 1, 1,
-0.5338113, 0.09204115, -3.706902, 1, 1, 1, 1, 1,
-0.5336204, -0.5449747, -1.689646, 1, 1, 1, 1, 1,
-0.5318272, -0.09344943, -1.909811, 1, 1, 1, 1, 1,
-0.530958, 1.33464, -1.036644, 1, 1, 1, 1, 1,
-0.5256295, 0.8502429, 0.1714617, 1, 1, 1, 1, 1,
-0.5253493, -0.3255966, -1.552015, 1, 1, 1, 1, 1,
-0.5239947, 0.05190117, -0.5760309, 1, 1, 1, 1, 1,
-0.5232989, -1.257814, -3.215426, 1, 1, 1, 1, 1,
-0.5217234, -0.1736429, -0.6258479, 0, 0, 1, 1, 1,
-0.5214667, 0.5102106, -1.391042, 1, 0, 0, 1, 1,
-0.5192969, 0.6428346, -1.961674, 1, 0, 0, 1, 1,
-0.5190388, -0.2861387, -2.95755, 1, 0, 0, 1, 1,
-0.5149356, 1.071968, 2.089333, 1, 0, 0, 1, 1,
-0.5135795, 0.5077192, 0.04158247, 1, 0, 0, 1, 1,
-0.512058, -1.675833, -2.83077, 0, 0, 0, 1, 1,
-0.5089617, 1.136012, -1.195862, 0, 0, 0, 1, 1,
-0.504299, -1.180655, -3.115095, 0, 0, 0, 1, 1,
-0.503749, -0.05820667, -1.651161, 0, 0, 0, 1, 1,
-0.5032145, 2.07932, 1.124154, 0, 0, 0, 1, 1,
-0.5013336, 0.5610896, 0.01687456, 0, 0, 0, 1, 1,
-0.4999799, 0.1690475, -1.768413, 0, 0, 0, 1, 1,
-0.498814, 0.162906, -2.963116, 1, 1, 1, 1, 1,
-0.4955888, 0.7075446, -0.05783549, 1, 1, 1, 1, 1,
-0.4897719, -1.525148, -2.51789, 1, 1, 1, 1, 1,
-0.4887369, 2.598576, -0.4110854, 1, 1, 1, 1, 1,
-0.4772356, -1.351042, -3.396159, 1, 1, 1, 1, 1,
-0.476736, 1.423096, -1.554746, 1, 1, 1, 1, 1,
-0.4765156, -0.1395924, -0.7249964, 1, 1, 1, 1, 1,
-0.4712359, 0.8282285, 1.179281, 1, 1, 1, 1, 1,
-0.4679231, -0.4862037, -1.608597, 1, 1, 1, 1, 1,
-0.465107, 0.3197589, -1.004281, 1, 1, 1, 1, 1,
-0.4566551, 0.6765103, -0.07825913, 1, 1, 1, 1, 1,
-0.4558105, 0.4497901, -0.3304526, 1, 1, 1, 1, 1,
-0.4542132, 0.543817, -1.568947, 1, 1, 1, 1, 1,
-0.4470132, -0.7745855, -3.512185, 1, 1, 1, 1, 1,
-0.4467611, 0.7753928, -0.7240506, 1, 1, 1, 1, 1,
-0.4459632, 0.7248681, 1.047045, 0, 0, 1, 1, 1,
-0.4429444, -1.01659, -0.3567245, 1, 0, 0, 1, 1,
-0.4418172, -0.8429725, -2.473378, 1, 0, 0, 1, 1,
-0.4412882, 0.7777967, 0.6741815, 1, 0, 0, 1, 1,
-0.440415, 0.02135923, -2.382297, 1, 0, 0, 1, 1,
-0.4371752, 2.049857, -0.4967777, 1, 0, 0, 1, 1,
-0.4359487, -0.009787924, -1.586917, 0, 0, 0, 1, 1,
-0.4349552, 1.260201, -0.6847081, 0, 0, 0, 1, 1,
-0.4337779, -1.660229, -3.491934, 0, 0, 0, 1, 1,
-0.4329179, -0.3545016, -0.5281922, 0, 0, 0, 1, 1,
-0.432687, 0.3080881, -1.901435, 0, 0, 0, 1, 1,
-0.4287508, -0.1410116, -3.131939, 0, 0, 0, 1, 1,
-0.4274187, -0.07104549, -0.7133625, 0, 0, 0, 1, 1,
-0.4273425, -0.8356802, -3.222695, 1, 1, 1, 1, 1,
-0.4246588, -0.7311651, -1.599699, 1, 1, 1, 1, 1,
-0.4226859, -0.5865855, -2.3881, 1, 1, 1, 1, 1,
-0.421046, -0.6026356, -1.106812, 1, 1, 1, 1, 1,
-0.4173919, -1.323499, -3.48174, 1, 1, 1, 1, 1,
-0.416713, -1.254421, -3.773471, 1, 1, 1, 1, 1,
-0.4160258, -0.2707824, -1.874791, 1, 1, 1, 1, 1,
-0.41447, -1.03362, -1.39156, 1, 1, 1, 1, 1,
-0.4141743, 1.148586, -0.007031034, 1, 1, 1, 1, 1,
-0.4102318, -0.6147914, -2.425431, 1, 1, 1, 1, 1,
-0.4075696, -1.653574, -2.768277, 1, 1, 1, 1, 1,
-0.4046595, -0.789475, -3.590891, 1, 1, 1, 1, 1,
-0.3990686, 0.637366, -1.036129, 1, 1, 1, 1, 1,
-0.3983795, -0.7135549, -3.508718, 1, 1, 1, 1, 1,
-0.3912398, -0.465734, -3.854192, 1, 1, 1, 1, 1,
-0.381916, 0.381339, -1.194714, 0, 0, 1, 1, 1,
-0.3811535, -0.9875253, -2.249378, 1, 0, 0, 1, 1,
-0.3805974, -0.200038, -3.087935, 1, 0, 0, 1, 1,
-0.3802962, 1.036829, -1.841815, 1, 0, 0, 1, 1,
-0.3786265, 0.884274, 0.7312341, 1, 0, 0, 1, 1,
-0.3784851, -1.262581, -2.808058, 1, 0, 0, 1, 1,
-0.3728155, 1.036256, -0.1725617, 0, 0, 0, 1, 1,
-0.372452, -0.5909385, -3.799488, 0, 0, 0, 1, 1,
-0.3694663, 0.5385159, -0.3773338, 0, 0, 0, 1, 1,
-0.3687503, -1.761514, -1.733238, 0, 0, 0, 1, 1,
-0.3663955, 1.298899, -0.4561466, 0, 0, 0, 1, 1,
-0.3657749, 1.007816, -1.552167, 0, 0, 0, 1, 1,
-0.3592963, -0.05625011, -2.281395, 0, 0, 0, 1, 1,
-0.3591955, -0.3794132, -2.871063, 1, 1, 1, 1, 1,
-0.3572958, 0.8235452, -1.458822, 1, 1, 1, 1, 1,
-0.3548689, 1.909298, -2.241869, 1, 1, 1, 1, 1,
-0.3535319, -1.595431, -4.658597, 1, 1, 1, 1, 1,
-0.3513197, -0.06314161, -0.9453073, 1, 1, 1, 1, 1,
-0.3503334, 1.714123, -2.280994, 1, 1, 1, 1, 1,
-0.3502963, 1.029549, 1.319022, 1, 1, 1, 1, 1,
-0.349459, -0.08624715, -2.689821, 1, 1, 1, 1, 1,
-0.3470918, -2.210367, -3.582889, 1, 1, 1, 1, 1,
-0.3452455, 1.878268, -0.0501754, 1, 1, 1, 1, 1,
-0.3435813, 0.1310041, -1.215554, 1, 1, 1, 1, 1,
-0.3428821, -0.05930037, -1.428328, 1, 1, 1, 1, 1,
-0.3335246, 0.1584554, -1.933483, 1, 1, 1, 1, 1,
-0.3321978, 0.009581933, -0.675299, 1, 1, 1, 1, 1,
-0.3265782, -0.03994788, -1.96119, 1, 1, 1, 1, 1,
-0.3258109, 0.4262746, 0.6272511, 0, 0, 1, 1, 1,
-0.3248269, 1.220191, -2.021137, 1, 0, 0, 1, 1,
-0.3224086, 0.7126027, 1.309393, 1, 0, 0, 1, 1,
-0.3223883, -0.324391, -3.552431, 1, 0, 0, 1, 1,
-0.3101454, 0.3295387, 0.449627, 1, 0, 0, 1, 1,
-0.3095434, 0.8383376, -2.283306, 1, 0, 0, 1, 1,
-0.30829, 0.6035375, 0.182824, 0, 0, 0, 1, 1,
-0.3070654, -1.108315, -3.508121, 0, 0, 0, 1, 1,
-0.3032642, -0.8228801, -3.019004, 0, 0, 0, 1, 1,
-0.3018119, 0.3156648, -1.116841, 0, 0, 0, 1, 1,
-0.2996646, -1.585277, -1.564732, 0, 0, 0, 1, 1,
-0.2960707, -0.08317476, -2.044392, 0, 0, 0, 1, 1,
-0.2928075, 0.2823399, -0.1984418, 0, 0, 0, 1, 1,
-0.2890269, -0.522505, -2.845111, 1, 1, 1, 1, 1,
-0.2877554, 0.1468985, -2.487426, 1, 1, 1, 1, 1,
-0.2860489, 1.334017, -0.3548392, 1, 1, 1, 1, 1,
-0.277143, 0.1595439, -0.5524434, 1, 1, 1, 1, 1,
-0.2735345, -0.1377964, -0.887556, 1, 1, 1, 1, 1,
-0.270858, -1.31393, -2.777973, 1, 1, 1, 1, 1,
-0.2652079, 1.894186, 1.592355, 1, 1, 1, 1, 1,
-0.2602273, 0.5292319, -0.2053078, 1, 1, 1, 1, 1,
-0.2575279, 0.4815935, -1.415126, 1, 1, 1, 1, 1,
-0.2543016, -0.9840643, -3.484056, 1, 1, 1, 1, 1,
-0.2524411, 0.09572764, -2.254723, 1, 1, 1, 1, 1,
-0.2523883, 1.421043, 0.04071935, 1, 1, 1, 1, 1,
-0.2497837, 1.452879, 1.947681, 1, 1, 1, 1, 1,
-0.2483621, 0.8249666, 0.02996447, 1, 1, 1, 1, 1,
-0.2479979, 0.2432908, -1.514647, 1, 1, 1, 1, 1,
-0.2476748, -0.1328677, -2.471908, 0, 0, 1, 1, 1,
-0.2467137, 2.986718, -0.5573683, 1, 0, 0, 1, 1,
-0.245325, 0.657378, -1.278216, 1, 0, 0, 1, 1,
-0.2443831, -0.3726348, -4.019706, 1, 0, 0, 1, 1,
-0.2407048, -1.069343, -1.498857, 1, 0, 0, 1, 1,
-0.2368222, 1.405781, 0.6057172, 1, 0, 0, 1, 1,
-0.2326856, 1.491238, -0.05104905, 0, 0, 0, 1, 1,
-0.2312353, -0.2471188, -2.26649, 0, 0, 0, 1, 1,
-0.2280469, -0.5515363, -3.452856, 0, 0, 0, 1, 1,
-0.226391, 0.8723509, -0.8499653, 0, 0, 0, 1, 1,
-0.225902, 0.604409, -0.20285, 0, 0, 0, 1, 1,
-0.2220924, 0.06957478, 0.2725721, 0, 0, 0, 1, 1,
-0.2203886, 1.985145, 0.9272826, 0, 0, 0, 1, 1,
-0.2170604, -0.2105907, -2.638611, 1, 1, 1, 1, 1,
-0.2166055, -0.01389381, -1.896789, 1, 1, 1, 1, 1,
-0.2163805, 1.122855, 0.08348466, 1, 1, 1, 1, 1,
-0.2163304, -0.242156, -0.4930525, 1, 1, 1, 1, 1,
-0.2159516, 1.163285, 0.6747697, 1, 1, 1, 1, 1,
-0.2155192, 1.09625, 0.5991726, 1, 1, 1, 1, 1,
-0.2134628, -0.7572818, -2.937563, 1, 1, 1, 1, 1,
-0.2115367, 2.544173, -0.9386962, 1, 1, 1, 1, 1,
-0.2087476, 1.101108, -0.3192234, 1, 1, 1, 1, 1,
-0.2064831, 0.5867468, -1.262255, 1, 1, 1, 1, 1,
-0.1990321, 0.6980312, 0.7653472, 1, 1, 1, 1, 1,
-0.1978727, -0.5406104, -3.716459, 1, 1, 1, 1, 1,
-0.1937471, -0.8765035, -4.116591, 1, 1, 1, 1, 1,
-0.1788552, -0.08540367, -2.1978, 1, 1, 1, 1, 1,
-0.1731639, 0.720289, -0.9243599, 1, 1, 1, 1, 1,
-0.1715584, -0.06567694, -2.070268, 0, 0, 1, 1, 1,
-0.166377, 0.3761106, -0.721856, 1, 0, 0, 1, 1,
-0.1648963, 1.008974, 1.204312, 1, 0, 0, 1, 1,
-0.1647638, 1.212089, -0.4337485, 1, 0, 0, 1, 1,
-0.1585385, 1.576393, -0.9388283, 1, 0, 0, 1, 1,
-0.1571645, 0.3675854, 0.7830079, 1, 0, 0, 1, 1,
-0.1566739, -0.3515952, -3.617347, 0, 0, 0, 1, 1,
-0.155482, 0.8192751, -0.8806609, 0, 0, 0, 1, 1,
-0.1539898, 0.0894791, -1.734724, 0, 0, 0, 1, 1,
-0.1466991, -0.1019299, -2.323135, 0, 0, 0, 1, 1,
-0.1409533, 1.363035, -0.03311625, 0, 0, 0, 1, 1,
-0.1379164, 1.724787, -2.355417, 0, 0, 0, 1, 1,
-0.1344035, 0.7876683, -1.57073, 0, 0, 0, 1, 1,
-0.1339284, -0.02806758, -1.703379, 1, 1, 1, 1, 1,
-0.1291676, 1.575667, 0.6539157, 1, 1, 1, 1, 1,
-0.1267338, -0.9768437, -2.149143, 1, 1, 1, 1, 1,
-0.1232416, 0.1993385, -0.8187439, 1, 1, 1, 1, 1,
-0.1195984, 0.3144162, -0.3727219, 1, 1, 1, 1, 1,
-0.117298, -0.4117142, -1.611012, 1, 1, 1, 1, 1,
-0.1140041, 1.209867, -0.7883097, 1, 1, 1, 1, 1,
-0.1106347, -0.5394664, -2.947184, 1, 1, 1, 1, 1,
-0.1099411, -2.866262, -1.023475, 1, 1, 1, 1, 1,
-0.1069276, -2.305543, -3.260174, 1, 1, 1, 1, 1,
-0.1006037, 0.534638, -1.218523, 1, 1, 1, 1, 1,
-0.1005098, 0.2998523, 1.350161, 1, 1, 1, 1, 1,
-0.1004281, 0.4589493, -0.06317493, 1, 1, 1, 1, 1,
-0.1003844, -0.1569736, -2.792231, 1, 1, 1, 1, 1,
-0.09699995, 0.3707001, -0.6145365, 1, 1, 1, 1, 1,
-0.09645911, -0.2847922, -3.844846, 0, 0, 1, 1, 1,
-0.09618722, 0.1082942, 0.4805724, 1, 0, 0, 1, 1,
-0.09150982, 0.507684, 0.6577215, 1, 0, 0, 1, 1,
-0.09113121, 0.3777782, 0.5548936, 1, 0, 0, 1, 1,
-0.09058395, -0.2860221, -2.07137, 1, 0, 0, 1, 1,
-0.0880649, 0.2046693, 0.08898756, 1, 0, 0, 1, 1,
-0.08529132, -0.4778035, -5.252449, 0, 0, 0, 1, 1,
-0.08094299, 0.4425224, -0.7567633, 0, 0, 0, 1, 1,
-0.0797369, -0.1478884, -3.044316, 0, 0, 0, 1, 1,
-0.07677051, -0.6342272, -3.214154, 0, 0, 0, 1, 1,
-0.07547369, -1.32322, -2.928006, 0, 0, 0, 1, 1,
-0.07532364, -0.2528443, -3.484918, 0, 0, 0, 1, 1,
-0.07253192, -0.7629424, -3.530117, 0, 0, 0, 1, 1,
-0.06720848, 1.319512, 0.9992915, 1, 1, 1, 1, 1,
-0.0581981, 0.8566856, 0.8589144, 1, 1, 1, 1, 1,
-0.05557271, 1.634259, -1.070629, 1, 1, 1, 1, 1,
-0.05489342, 0.00543202, -3.711693, 1, 1, 1, 1, 1,
-0.04791259, -0.8558142, -2.588022, 1, 1, 1, 1, 1,
-0.04469469, -1.056248, -1.740195, 1, 1, 1, 1, 1,
-0.04429522, -0.3324283, -3.316371, 1, 1, 1, 1, 1,
-0.04339848, 1.416311, -0.1398485, 1, 1, 1, 1, 1,
-0.03726595, 0.9683409, 0.5668572, 1, 1, 1, 1, 1,
-0.03243084, 0.3474783, -1.396494, 1, 1, 1, 1, 1,
-0.03145441, 0.5342188, -0.6506366, 1, 1, 1, 1, 1,
-0.02671124, 0.01492645, 0.9709641, 1, 1, 1, 1, 1,
-0.0181606, -0.607084, -2.404343, 1, 1, 1, 1, 1,
-0.01549761, -0.3881437, -2.12411, 1, 1, 1, 1, 1,
-0.01514877, -1.218231, -3.205176, 1, 1, 1, 1, 1,
-0.01105579, 0.06333008, 0.7062805, 0, 0, 1, 1, 1,
-0.0105737, -1.007995, -2.6625, 1, 0, 0, 1, 1,
-0.006295993, 1.043992, -0.3871267, 1, 0, 0, 1, 1,
-0.00321753, 1.223345, 0.8452217, 1, 0, 0, 1, 1,
-0.002953772, -0.3869234, -2.964425, 1, 0, 0, 1, 1,
0.004680339, -1.316738, 1.534798, 1, 0, 0, 1, 1,
0.004997412, -0.4735397, 4.506899, 0, 0, 0, 1, 1,
0.007907731, 0.5395614, -0.7242936, 0, 0, 0, 1, 1,
0.009287982, -1.071979, 3.605523, 0, 0, 0, 1, 1,
0.01454909, -0.8630933, 3.409832, 0, 0, 0, 1, 1,
0.01529421, 0.6368715, -0.03434921, 0, 0, 0, 1, 1,
0.01637797, -0.7455447, 4.260058, 0, 0, 0, 1, 1,
0.01846487, -1.61435, 1.744011, 0, 0, 0, 1, 1,
0.01964886, -0.6806987, 1.146688, 1, 1, 1, 1, 1,
0.02200292, -0.7341612, 4.186767, 1, 1, 1, 1, 1,
0.02313593, 0.01419455, 1.632832, 1, 1, 1, 1, 1,
0.02624833, -0.7444733, 1.280263, 1, 1, 1, 1, 1,
0.03008492, -0.9583726, 3.069621, 1, 1, 1, 1, 1,
0.03010781, 0.5296898, 1.010911, 1, 1, 1, 1, 1,
0.04060965, -0.293004, 3.905603, 1, 1, 1, 1, 1,
0.04440239, -0.2994835, 4.697315, 1, 1, 1, 1, 1,
0.04639494, -1.923126, 2.251451, 1, 1, 1, 1, 1,
0.04923777, -0.18907, 3.418358, 1, 1, 1, 1, 1,
0.05397206, 0.5191638, -0.2580139, 1, 1, 1, 1, 1,
0.05460512, 0.4360306, 0.3125699, 1, 1, 1, 1, 1,
0.05646221, -1.577103, 3.582955, 1, 1, 1, 1, 1,
0.05705201, -0.09477835, 2.364865, 1, 1, 1, 1, 1,
0.05873436, -0.8918099, 2.984998, 1, 1, 1, 1, 1,
0.06030737, 1.080355, -0.2550448, 0, 0, 1, 1, 1,
0.06654302, 0.7639861, -0.6384417, 1, 0, 0, 1, 1,
0.07344753, -0.7271838, 4.681733, 1, 0, 0, 1, 1,
0.07549034, -0.6519915, 3.062324, 1, 0, 0, 1, 1,
0.07728793, -0.04794401, 1.628945, 1, 0, 0, 1, 1,
0.07749856, -0.5631344, 3.094317, 1, 0, 0, 1, 1,
0.08737699, 0.6168647, 0.8776796, 0, 0, 0, 1, 1,
0.09085897, 0.2498145, -1.814558, 0, 0, 0, 1, 1,
0.0924424, -0.3440092, 1.638452, 0, 0, 0, 1, 1,
0.09477954, 0.4175518, 1.515279, 0, 0, 0, 1, 1,
0.09479562, 0.6038342, 0.6522237, 0, 0, 0, 1, 1,
0.09537528, 0.5701131, -0.8304626, 0, 0, 0, 1, 1,
0.09860744, 0.2860696, -0.6379506, 0, 0, 0, 1, 1,
0.09909249, -0.5618597, 2.208259, 1, 1, 1, 1, 1,
0.0991756, -0.7417511, 3.958915, 1, 1, 1, 1, 1,
0.1008747, 1.378573, -0.5488567, 1, 1, 1, 1, 1,
0.1043459, 2.022675, 0.8734866, 1, 1, 1, 1, 1,
0.1053961, 0.827913, 1.80993, 1, 1, 1, 1, 1,
0.1148758, 0.7325177, -0.3721353, 1, 1, 1, 1, 1,
0.1150936, -1.179254, 2.47709, 1, 1, 1, 1, 1,
0.1178175, 1.568165, -0.7429447, 1, 1, 1, 1, 1,
0.1183135, -1.509355, 3.405461, 1, 1, 1, 1, 1,
0.1183358, 0.03730145, 0.5515194, 1, 1, 1, 1, 1,
0.1183956, 0.06952556, 1.238692, 1, 1, 1, 1, 1,
0.1233457, -0.167526, 4.018029, 1, 1, 1, 1, 1,
0.1250331, -0.4537193, 3.539696, 1, 1, 1, 1, 1,
0.1254092, 1.729836, 2.336743, 1, 1, 1, 1, 1,
0.1267896, -0.2533744, 2.09195, 1, 1, 1, 1, 1,
0.128258, 1.585444, -0.01484582, 0, 0, 1, 1, 1,
0.1285897, -0.5248474, 3.328028, 1, 0, 0, 1, 1,
0.1322681, 1.279435, -1.154858, 1, 0, 0, 1, 1,
0.1330096, -1.909176, 4.086162, 1, 0, 0, 1, 1,
0.1336845, -0.06613045, 2.612928, 1, 0, 0, 1, 1,
0.1394274, 0.7503783, 1.024175, 1, 0, 0, 1, 1,
0.1408225, 0.6244198, 0.6995314, 0, 0, 0, 1, 1,
0.1467653, -1.113399, 3.60424, 0, 0, 0, 1, 1,
0.1504034, 1.373565, -0.7367286, 0, 0, 0, 1, 1,
0.1511401, 0.7115241, 0.6332774, 0, 0, 0, 1, 1,
0.1520958, -0.0952164, 1.771819, 0, 0, 0, 1, 1,
0.1522431, -2.902491, 3.382843, 0, 0, 0, 1, 1,
0.1546486, -1.542867, 3.281195, 0, 0, 0, 1, 1,
0.155858, -0.1167676, 2.719581, 1, 1, 1, 1, 1,
0.1566007, -0.6751197, 4.817489, 1, 1, 1, 1, 1,
0.1573106, 1.059506, 0.4697901, 1, 1, 1, 1, 1,
0.1583097, -0.6448034, 1.984085, 1, 1, 1, 1, 1,
0.1631754, 0.1461408, 2.109487, 1, 1, 1, 1, 1,
0.1656754, -0.7820836, 3.268719, 1, 1, 1, 1, 1,
0.1691616, 1.743259, 1.243791, 1, 1, 1, 1, 1,
0.1702826, -1.947716, 2.104898, 1, 1, 1, 1, 1,
0.1707034, -0.3901565, 3.441463, 1, 1, 1, 1, 1,
0.1766555, 1.831223, 1.475229, 1, 1, 1, 1, 1,
0.1767751, 0.2779452, -0.4015602, 1, 1, 1, 1, 1,
0.1816749, 1.334446, -0.09642323, 1, 1, 1, 1, 1,
0.1859509, -0.6397763, 3.610873, 1, 1, 1, 1, 1,
0.1866567, -0.08001419, 2.821348, 1, 1, 1, 1, 1,
0.1883772, 0.7231014, 0.4532573, 1, 1, 1, 1, 1,
0.1924192, 0.2026623, -0.002200869, 0, 0, 1, 1, 1,
0.1925404, 0.4530534, 0.01076118, 1, 0, 0, 1, 1,
0.1946728, 0.738938, 0.5558857, 1, 0, 0, 1, 1,
0.1994788, -1.753818, 1.637989, 1, 0, 0, 1, 1,
0.2086933, 2.309059, -0.06067852, 1, 0, 0, 1, 1,
0.209189, 1.487717, 2.164253, 1, 0, 0, 1, 1,
0.2112818, -2.911533, 1.687864, 0, 0, 0, 1, 1,
0.2176198, -0.8736362, 3.153288, 0, 0, 0, 1, 1,
0.217728, 0.4661698, 0.2853, 0, 0, 0, 1, 1,
0.2197786, -0.01711063, 1.502868, 0, 0, 0, 1, 1,
0.220463, -0.1628692, 2.101187, 0, 0, 0, 1, 1,
0.2258959, -0.4618358, 1.354481, 0, 0, 0, 1, 1,
0.2321943, -0.1976812, 3.278828, 0, 0, 0, 1, 1,
0.2331873, 1.414735, 1.536337, 1, 1, 1, 1, 1,
0.236118, -0.6746694, 2.766545, 1, 1, 1, 1, 1,
0.2392868, -0.2998314, 2.197177, 1, 1, 1, 1, 1,
0.2413981, -0.06931406, 1.582376, 1, 1, 1, 1, 1,
0.2516693, 0.194296, 2.553697, 1, 1, 1, 1, 1,
0.2529057, -1.042098, 1.146791, 1, 1, 1, 1, 1,
0.2533953, 0.2323224, 0.4551798, 1, 1, 1, 1, 1,
0.2538868, -1.023239, 4.432711, 1, 1, 1, 1, 1,
0.2546809, -0.2336793, 3.253312, 1, 1, 1, 1, 1,
0.2599664, 0.5761331, 0.3574845, 1, 1, 1, 1, 1,
0.264983, 0.6928539, 0.1883649, 1, 1, 1, 1, 1,
0.2668667, 0.5075807, 0.5186574, 1, 1, 1, 1, 1,
0.2686768, 1.002621, 0.6690461, 1, 1, 1, 1, 1,
0.2697115, 0.4857792, 1.545597, 1, 1, 1, 1, 1,
0.2767485, -0.09553402, 1.242602, 1, 1, 1, 1, 1,
0.2809539, 0.7579854, -0.5581711, 0, 0, 1, 1, 1,
0.2819951, -0.6600565, 1.773296, 1, 0, 0, 1, 1,
0.2840289, -0.7975442, 0.5201429, 1, 0, 0, 1, 1,
0.2885384, -0.5997474, 4.665122, 1, 0, 0, 1, 1,
0.2892555, -0.2178999, 2.470675, 1, 0, 0, 1, 1,
0.2917463, 1.103878, 1.810346, 1, 0, 0, 1, 1,
0.2921348, -0.4019501, 1.835793, 0, 0, 0, 1, 1,
0.2928607, 0.5210887, 1.953348, 0, 0, 0, 1, 1,
0.2973294, 0.2038943, 1.677888, 0, 0, 0, 1, 1,
0.2979726, -0.344985, 2.770256, 0, 0, 0, 1, 1,
0.2983034, -0.4050932, 2.106334, 0, 0, 0, 1, 1,
0.2988182, 0.3173222, -0.593984, 0, 0, 0, 1, 1,
0.3005831, 0.5050423, -0.3706782, 0, 0, 0, 1, 1,
0.3028294, 0.2411744, 1.653152, 1, 1, 1, 1, 1,
0.3034835, 0.2665998, 1.765384, 1, 1, 1, 1, 1,
0.3040962, -0.4244903, 2.766404, 1, 1, 1, 1, 1,
0.3084869, -2.252133, 2.918425, 1, 1, 1, 1, 1,
0.31045, 0.04608113, 2.064243, 1, 1, 1, 1, 1,
0.3131961, 0.5222409, 1.943843, 1, 1, 1, 1, 1,
0.3132783, 0.3601471, 2.003983, 1, 1, 1, 1, 1,
0.3152879, 0.9873512, -0.6785303, 1, 1, 1, 1, 1,
0.3169215, 0.8756326, -0.5458483, 1, 1, 1, 1, 1,
0.3246045, -0.7794586, 2.508656, 1, 1, 1, 1, 1,
0.3265337, -1.011234, 3.328242, 1, 1, 1, 1, 1,
0.3277026, 0.8697207, 0.6874028, 1, 1, 1, 1, 1,
0.3338938, -0.1061085, 1.944711, 1, 1, 1, 1, 1,
0.3341859, -1.146221, 2.97142, 1, 1, 1, 1, 1,
0.3350657, 0.5458601, 1.082906, 1, 1, 1, 1, 1,
0.3387716, 1.917856, -0.1336939, 0, 0, 1, 1, 1,
0.3523259, 0.9936431, -1.093185, 1, 0, 0, 1, 1,
0.3535988, 1.016362, 1.834381, 1, 0, 0, 1, 1,
0.3559112, 1.05704, 1.302432, 1, 0, 0, 1, 1,
0.3599471, 1.685189, 1.855334, 1, 0, 0, 1, 1,
0.3649077, 0.524204, 2.396791, 1, 0, 0, 1, 1,
0.3651719, 0.1084374, -0.3913972, 0, 0, 0, 1, 1,
0.3655525, 1.063822, 0.4302965, 0, 0, 0, 1, 1,
0.3673382, 1.015988, -0.7619517, 0, 0, 0, 1, 1,
0.3678554, -0.720207, 4.329714, 0, 0, 0, 1, 1,
0.3760602, -0.02896146, 3.177727, 0, 0, 0, 1, 1,
0.3769772, 0.640821, 1.325782, 0, 0, 0, 1, 1,
0.3783532, -0.2653603, 3.013743, 0, 0, 0, 1, 1,
0.3791291, 0.04620963, 2.176558, 1, 1, 1, 1, 1,
0.3817378, 1.29914, 1.392042, 1, 1, 1, 1, 1,
0.3852435, 0.6116801, 2.134353, 1, 1, 1, 1, 1,
0.3862045, 0.5026506, 1.10155, 1, 1, 1, 1, 1,
0.3973234, -0.6660627, 3.107953, 1, 1, 1, 1, 1,
0.4010784, -0.8774638, 3.001623, 1, 1, 1, 1, 1,
0.4022286, 0.2105155, 0.8244662, 1, 1, 1, 1, 1,
0.402787, -0.5927541, -0.507278, 1, 1, 1, 1, 1,
0.4045788, 1.873027, -0.1057489, 1, 1, 1, 1, 1,
0.4077181, 0.002009534, 2.131249, 1, 1, 1, 1, 1,
0.4084173, 0.1571522, 2.878338, 1, 1, 1, 1, 1,
0.4109882, 1.634993, 0.2795751, 1, 1, 1, 1, 1,
0.4117506, -0.8624184, 1.748777, 1, 1, 1, 1, 1,
0.4122587, -0.3299248, 3.170325, 1, 1, 1, 1, 1,
0.4125825, 0.1397327, 0.5107241, 1, 1, 1, 1, 1,
0.4160646, -0.5945198, 1.186354, 0, 0, 1, 1, 1,
0.4249272, 0.2877151, 2.600515, 1, 0, 0, 1, 1,
0.4321866, 1.35034, 0.0650965, 1, 0, 0, 1, 1,
0.4340617, 0.9383864, 0.4253682, 1, 0, 0, 1, 1,
0.43471, -0.2345242, 3.552734, 1, 0, 0, 1, 1,
0.4374874, -0.5517896, 2.905127, 1, 0, 0, 1, 1,
0.4386033, 0.6992344, 2.150579, 0, 0, 0, 1, 1,
0.4386724, 2.051823, 0.01413483, 0, 0, 0, 1, 1,
0.4427881, -1.105492, 2.675954, 0, 0, 0, 1, 1,
0.4461934, 0.01895873, -0.2800792, 0, 0, 0, 1, 1,
0.4487938, -0.1896853, 0.2786046, 0, 0, 0, 1, 1,
0.4524955, 0.3095471, 0.9319941, 0, 0, 0, 1, 1,
0.4554898, -1.195071, 3.746494, 0, 0, 0, 1, 1,
0.4561146, 1.406605, 0.7862159, 1, 1, 1, 1, 1,
0.4564705, 0.7619582, -0.2720322, 1, 1, 1, 1, 1,
0.4568865, 0.4491993, 1.636017, 1, 1, 1, 1, 1,
0.4582982, 0.2973712, -0.2546234, 1, 1, 1, 1, 1,
0.4647701, -0.85484, 2.46805, 1, 1, 1, 1, 1,
0.4650991, 2.266065, 0.9527785, 1, 1, 1, 1, 1,
0.470481, -0.1991812, 3.577901, 1, 1, 1, 1, 1,
0.4760722, 0.0744569, 0.1569008, 1, 1, 1, 1, 1,
0.4807998, -1.151345, 3.148972, 1, 1, 1, 1, 1,
0.484311, -0.007782312, 1.49991, 1, 1, 1, 1, 1,
0.4861536, 0.1066599, -0.1955551, 1, 1, 1, 1, 1,
0.4888293, -0.08496325, 1.946469, 1, 1, 1, 1, 1,
0.4911208, 0.1577204, 1.457389, 1, 1, 1, 1, 1,
0.496378, -1.731553, 1.001667, 1, 1, 1, 1, 1,
0.4965415, -1.528486, 3.747007, 1, 1, 1, 1, 1,
0.5003322, -1.632837, 2.050105, 0, 0, 1, 1, 1,
0.5106338, 0.1308711, 1.576218, 1, 0, 0, 1, 1,
0.5125453, 0.3391873, 1.301479, 1, 0, 0, 1, 1,
0.5136188, -0.6593544, 0.8541856, 1, 0, 0, 1, 1,
0.5209052, -0.1342541, 1.768266, 1, 0, 0, 1, 1,
0.5231796, 0.4196655, 0.8503757, 1, 0, 0, 1, 1,
0.5257728, -0.7917801, 1.377253, 0, 0, 0, 1, 1,
0.5281147, -0.1689989, 1.871667, 0, 0, 0, 1, 1,
0.5284789, -0.1192823, 1.352849, 0, 0, 0, 1, 1,
0.5349331, -0.8850174, 1.53084, 0, 0, 0, 1, 1,
0.5385336, -0.3734865, 1.38613, 0, 0, 0, 1, 1,
0.5468284, 1.71262, 2.464954, 0, 0, 0, 1, 1,
0.5479878, 0.9430169, 1.746782, 0, 0, 0, 1, 1,
0.5508489, 2.127849, 1.440874, 1, 1, 1, 1, 1,
0.5511458, 0.680426, -2.17645, 1, 1, 1, 1, 1,
0.5515453, -1.237054, 1.580808, 1, 1, 1, 1, 1,
0.5531011, 1.250057, 0.2175036, 1, 1, 1, 1, 1,
0.5580607, 1.328056, -0.9425262, 1, 1, 1, 1, 1,
0.5584022, 1.823882, 0.2530288, 1, 1, 1, 1, 1,
0.5659431, -1.021832, 2.367787, 1, 1, 1, 1, 1,
0.5666213, 0.6427859, -0.2808847, 1, 1, 1, 1, 1,
0.5673056, 0.02437198, 0.7371337, 1, 1, 1, 1, 1,
0.5737077, 1.920219, 0.4321985, 1, 1, 1, 1, 1,
0.5743389, -0.4665855, 1.780355, 1, 1, 1, 1, 1,
0.5789558, -0.09264192, 0.9564579, 1, 1, 1, 1, 1,
0.5847116, -1.517467, 3.096348, 1, 1, 1, 1, 1,
0.5864249, -1.840119, 2.789908, 1, 1, 1, 1, 1,
0.5897592, 0.7035455, 0.5776129, 1, 1, 1, 1, 1,
0.5911537, 0.5345539, 1.627717, 0, 0, 1, 1, 1,
0.6037397, 0.6488422, -2.128962, 1, 0, 0, 1, 1,
0.603954, 0.4291095, 2.134026, 1, 0, 0, 1, 1,
0.6104015, -1.353317, 2.517267, 1, 0, 0, 1, 1,
0.610931, 0.5297817, 1.83221, 1, 0, 0, 1, 1,
0.6129108, 0.1710215, 2.403676, 1, 0, 0, 1, 1,
0.6129762, -0.1314042, -0.9050683, 0, 0, 0, 1, 1,
0.6211984, 0.3116461, 0.1753537, 0, 0, 0, 1, 1,
0.6216244, 2.627008, 0.2743954, 0, 0, 0, 1, 1,
0.621752, 2.071086, 0.09489333, 0, 0, 0, 1, 1,
0.6227946, -0.1480692, 0.7314232, 0, 0, 0, 1, 1,
0.6261393, -0.4738829, 2.124714, 0, 0, 0, 1, 1,
0.6286888, -1.531529, 3.692184, 0, 0, 0, 1, 1,
0.6398326, 0.4519821, 1.942975, 1, 1, 1, 1, 1,
0.6400999, -0.1712346, 2.834179, 1, 1, 1, 1, 1,
0.6412406, -1.680074, 4.178684, 1, 1, 1, 1, 1,
0.6426564, -1.14046, 3.068858, 1, 1, 1, 1, 1,
0.6427851, 0.0100544, 2.273194, 1, 1, 1, 1, 1,
0.6431888, 0.03660906, 1.641765, 1, 1, 1, 1, 1,
0.6436583, 0.5528066, 0.1723716, 1, 1, 1, 1, 1,
0.6457049, 0.5307904, 0.6270123, 1, 1, 1, 1, 1,
0.6465019, 0.5794622, 1.649323, 1, 1, 1, 1, 1,
0.6509688, 1.144465, -0.4685102, 1, 1, 1, 1, 1,
0.6516492, -0.7546775, 4.275434, 1, 1, 1, 1, 1,
0.6529827, 0.5316827, 3.373046, 1, 1, 1, 1, 1,
0.660697, 0.3484174, 1.828122, 1, 1, 1, 1, 1,
0.6637686, 0.623347, -0.5483317, 1, 1, 1, 1, 1,
0.66563, -0.7328795, 2.729336, 1, 1, 1, 1, 1,
0.666593, 1.214625, 1.366227, 0, 0, 1, 1, 1,
0.6670522, -0.42342, 1.267844, 1, 0, 0, 1, 1,
0.6680164, 0.7444852, 0.9432068, 1, 0, 0, 1, 1,
0.6701812, -0.3765206, 1.528736, 1, 0, 0, 1, 1,
0.6788765, 0.5792673, 0.06505796, 1, 0, 0, 1, 1,
0.6812143, 1.733649, 1.407403, 1, 0, 0, 1, 1,
0.6812797, 0.3623533, 1.403162, 0, 0, 0, 1, 1,
0.6824718, 0.2631479, 1.630967, 0, 0, 0, 1, 1,
0.686084, -0.6078059, 1.734201, 0, 0, 0, 1, 1,
0.688122, -0.8868671, 1.34003, 0, 0, 0, 1, 1,
0.6891769, -0.1602083, 2.43681, 0, 0, 0, 1, 1,
0.6977642, -0.1746838, 0.03448112, 0, 0, 0, 1, 1,
0.7016746, 0.3597788, 0.9236537, 0, 0, 0, 1, 1,
0.7021043, 0.02803314, -0.8547326, 1, 1, 1, 1, 1,
0.7036576, -1.364148, 2.640296, 1, 1, 1, 1, 1,
0.7039641, -0.9231335, 2.965096, 1, 1, 1, 1, 1,
0.7050947, -0.2235381, 1.348751, 1, 1, 1, 1, 1,
0.7073947, -0.3018008, 1.326235, 1, 1, 1, 1, 1,
0.709061, -0.7221378, 3.980983, 1, 1, 1, 1, 1,
0.7091205, -0.7301527, 2.275885, 1, 1, 1, 1, 1,
0.713174, 1.538959, 1.874212, 1, 1, 1, 1, 1,
0.7223004, 1.833691, -0.3232584, 1, 1, 1, 1, 1,
0.723815, 0.08547689, 1.135674, 1, 1, 1, 1, 1,
0.724233, 0.9030232, 1.176239, 1, 1, 1, 1, 1,
0.7244558, -0.9846486, 2.087155, 1, 1, 1, 1, 1,
0.7301734, -1.058812, 1.909284, 1, 1, 1, 1, 1,
0.7373178, 0.1034381, 2.612275, 1, 1, 1, 1, 1,
0.73813, 0.9308594, 3.289526, 1, 1, 1, 1, 1,
0.7384155, 1.039625, -0.4703377, 0, 0, 1, 1, 1,
0.7399614, -0.402439, 0.4979551, 1, 0, 0, 1, 1,
0.7469465, 0.6677532, 1.456017, 1, 0, 0, 1, 1,
0.7515411, 0.6674725, 0.9487447, 1, 0, 0, 1, 1,
0.7524, -0.2043687, 1.655761, 1, 0, 0, 1, 1,
0.7540088, -1.455412, 3.755092, 1, 0, 0, 1, 1,
0.7541777, -1.188628, 2.850623, 0, 0, 0, 1, 1,
0.7581503, 1.724133, -0.7471606, 0, 0, 0, 1, 1,
0.7582568, 0.9391258, -0.7925447, 0, 0, 0, 1, 1,
0.7612877, -0.5219784, 1.632015, 0, 0, 0, 1, 1,
0.7617296, 0.2411536, 0.5357807, 0, 0, 0, 1, 1,
0.7717974, -0.05609404, 0.7710082, 0, 0, 0, 1, 1,
0.7785995, 0.7989811, 1.089848, 0, 0, 0, 1, 1,
0.7817377, 1.663275, 1.567905, 1, 1, 1, 1, 1,
0.7850648, -1.136312, 2.894814, 1, 1, 1, 1, 1,
0.7879719, 1.166871, 0.6615536, 1, 1, 1, 1, 1,
0.7884746, -0.1352412, 2.718229, 1, 1, 1, 1, 1,
0.7943715, -0.4980699, 2.920597, 1, 1, 1, 1, 1,
0.7982141, 0.2813214, -1.269471, 1, 1, 1, 1, 1,
0.8002715, 0.5986425, -0.2007067, 1, 1, 1, 1, 1,
0.8014691, 1.598323, -0.5453787, 1, 1, 1, 1, 1,
0.8034264, -0.08788888, 2.387994, 1, 1, 1, 1, 1,
0.8059847, -0.2222712, 0.752819, 1, 1, 1, 1, 1,
0.8117269, -1.14501, 2.449188, 1, 1, 1, 1, 1,
0.8124404, -0.3824714, 0.9566041, 1, 1, 1, 1, 1,
0.8139649, -0.3559874, 0.9632285, 1, 1, 1, 1, 1,
0.8141708, 0.173924, 4.240488, 1, 1, 1, 1, 1,
0.8171316, -0.823263, 1.987223, 1, 1, 1, 1, 1,
0.819467, 1.401232, 2.445409, 0, 0, 1, 1, 1,
0.8215715, -0.8817109, 2.751154, 1, 0, 0, 1, 1,
0.8222283, 1.880007, 2.315495, 1, 0, 0, 1, 1,
0.823587, -1.833394, 2.169415, 1, 0, 0, 1, 1,
0.8252414, -0.6778546, 2.536381, 1, 0, 0, 1, 1,
0.8268331, 0.6952712, 1.915647, 1, 0, 0, 1, 1,
0.8334782, -0.8514821, 2.733728, 0, 0, 0, 1, 1,
0.8340138, -0.1068881, 0.6461763, 0, 0, 0, 1, 1,
0.8376813, 0.5774261, 1.352908, 0, 0, 0, 1, 1,
0.8440698, -0.9089684, 1.90578, 0, 0, 0, 1, 1,
0.8511794, -0.2677417, 1.959656, 0, 0, 0, 1, 1,
0.8582584, -0.7957597, 2.281621, 0, 0, 0, 1, 1,
0.8603775, -1.076369, 1.65272, 0, 0, 0, 1, 1,
0.8630769, -1.634225, 3.51933, 1, 1, 1, 1, 1,
0.8683888, -1.431143, 2.661914, 1, 1, 1, 1, 1,
0.8761011, -0.6915597, 2.39113, 1, 1, 1, 1, 1,
0.8792969, 0.8298317, -1.120387, 1, 1, 1, 1, 1,
0.8805694, -0.5069623, 2.025238, 1, 1, 1, 1, 1,
0.8810499, -1.641866, 1.711908, 1, 1, 1, 1, 1,
0.882678, -0.01261901, -0.002370495, 1, 1, 1, 1, 1,
0.8841605, -0.7208258, 0.9641843, 1, 1, 1, 1, 1,
0.8882694, 1.794946, 0.4892682, 1, 1, 1, 1, 1,
0.8890362, -0.7269288, 3.071629, 1, 1, 1, 1, 1,
0.8890487, -0.7639201, 4.0439, 1, 1, 1, 1, 1,
0.8892747, 1.014023, 2.846725, 1, 1, 1, 1, 1,
0.8964587, -0.8921425, 1.66867, 1, 1, 1, 1, 1,
0.9133618, -0.2103671, 1.925566, 1, 1, 1, 1, 1,
0.9196321, -1.33267, 3.956933, 1, 1, 1, 1, 1,
0.9239046, 0.05883995, 2.78858, 0, 0, 1, 1, 1,
0.9289071, -0.6750706, 0.9694165, 1, 0, 0, 1, 1,
0.9320098, -1.412341, 3.455344, 1, 0, 0, 1, 1,
0.9349411, 0.3109397, 1.655535, 1, 0, 0, 1, 1,
0.9442229, 1.467216, 0.02166384, 1, 0, 0, 1, 1,
0.9445433, -0.7798446, 2.332978, 1, 0, 0, 1, 1,
0.9496821, 1.050502, 0.4555438, 0, 0, 0, 1, 1,
0.9582683, 1.123688, 2.020845, 0, 0, 0, 1, 1,
0.9591593, 1.812677, 1.135652, 0, 0, 0, 1, 1,
0.9609103, -0.9328685, 2.892706, 0, 0, 0, 1, 1,
0.9727352, 1.237903, 0.6657377, 0, 0, 0, 1, 1,
0.9747261, 0.9544517, 1.33103, 0, 0, 0, 1, 1,
0.9764724, 0.4425442, 1.624331, 0, 0, 0, 1, 1,
0.9789541, 0.3037741, 1.254397, 1, 1, 1, 1, 1,
0.9829295, 0.4026985, 2.177064, 1, 1, 1, 1, 1,
0.9886836, 0.2678953, 0.5365325, 1, 1, 1, 1, 1,
0.9910781, -1.213231, 4.024696, 1, 1, 1, 1, 1,
1.001841, 0.7563245, 1.680039, 1, 1, 1, 1, 1,
1.006399, -2.414418, 1.811756, 1, 1, 1, 1, 1,
1.01482, -1.635345, 3.26501, 1, 1, 1, 1, 1,
1.025683, -0.1570366, 0.6167621, 1, 1, 1, 1, 1,
1.035542, -0.1891063, 1.177212, 1, 1, 1, 1, 1,
1.03854, -0.4611759, 0.5993888, 1, 1, 1, 1, 1,
1.04118, -0.3682023, -0.1142664, 1, 1, 1, 1, 1,
1.045884, 0.7699648, -1.158596, 1, 1, 1, 1, 1,
1.048385, -0.003449573, 3.309869, 1, 1, 1, 1, 1,
1.060776, -0.8741161, 1.437081, 1, 1, 1, 1, 1,
1.065953, -1.317968, 3.065359, 1, 1, 1, 1, 1,
1.066569, 0.07687131, 0.729327, 0, 0, 1, 1, 1,
1.081347, 0.06434441, 3.094656, 1, 0, 0, 1, 1,
1.083018, -1.784363, 1.180148, 1, 0, 0, 1, 1,
1.090765, 0.09252936, -0.29304, 1, 0, 0, 1, 1,
1.097303, -1.299039, 3.287437, 1, 0, 0, 1, 1,
1.101889, 0.2283531, 2.926562, 1, 0, 0, 1, 1,
1.103177, -0.05274295, 1.373011, 0, 0, 0, 1, 1,
1.134732, 1.692165, 0.6341609, 0, 0, 0, 1, 1,
1.142689, 1.350695, 0.8671245, 0, 0, 0, 1, 1,
1.146188, -0.9369738, 1.111659, 0, 0, 0, 1, 1,
1.148648, 0.7013001, 0.5403512, 0, 0, 0, 1, 1,
1.14914, 0.4035473, 0.1858277, 0, 0, 0, 1, 1,
1.163203, -0.2629435, 3.131864, 0, 0, 0, 1, 1,
1.177424, -0.3359087, 2.755085, 1, 1, 1, 1, 1,
1.179411, -0.01319176, 2.217008, 1, 1, 1, 1, 1,
1.185904, 0.04101557, 1.403284, 1, 1, 1, 1, 1,
1.189398, 0.5158308, 0.744709, 1, 1, 1, 1, 1,
1.196778, 0.312107, 1.893222, 1, 1, 1, 1, 1,
1.197644, 1.296895, 0.8807198, 1, 1, 1, 1, 1,
1.202975, 0.4643666, 2.900819, 1, 1, 1, 1, 1,
1.216071, 0.239737, -0.5907509, 1, 1, 1, 1, 1,
1.228858, 0.1902051, 1.465289, 1, 1, 1, 1, 1,
1.25387, 0.928381, 1.256187, 1, 1, 1, 1, 1,
1.26735, -0.07542707, 3.051729, 1, 1, 1, 1, 1,
1.268597, -1.834901, 1.550134, 1, 1, 1, 1, 1,
1.271121, -1.345406, 1.873522, 1, 1, 1, 1, 1,
1.271174, 0.5177438, 1.289132, 1, 1, 1, 1, 1,
1.281561, -0.3313861, 3.789116, 1, 1, 1, 1, 1,
1.285671, 0.5396821, 1.309822, 0, 0, 1, 1, 1,
1.286002, 0.5902802, 2.242271, 1, 0, 0, 1, 1,
1.286051, -0.3708682, 2.308269, 1, 0, 0, 1, 1,
1.302361, -1.420551, 1.170738, 1, 0, 0, 1, 1,
1.312793, 0.4813968, 0.7190481, 1, 0, 0, 1, 1,
1.318537, 0.1944121, 2.19225, 1, 0, 0, 1, 1,
1.320653, 1.509321, -0.5475149, 0, 0, 0, 1, 1,
1.324336, 0.05507568, 1.921051, 0, 0, 0, 1, 1,
1.32451, -0.685043, 2.204859, 0, 0, 0, 1, 1,
1.328148, -0.3562861, -0.5234778, 0, 0, 0, 1, 1,
1.335698, 0.1352359, 0.4400431, 0, 0, 0, 1, 1,
1.336472, -0.8505181, 1.671693, 0, 0, 0, 1, 1,
1.346619, 0.455844, 1.214562, 0, 0, 0, 1, 1,
1.352045, 1.131498, 0.6475836, 1, 1, 1, 1, 1,
1.367264, -0.3251129, 0.9355564, 1, 1, 1, 1, 1,
1.373514, -0.6782901, 3.216866, 1, 1, 1, 1, 1,
1.374493, -0.8414133, 2.137022, 1, 1, 1, 1, 1,
1.381004, 0.2174737, 0.7233812, 1, 1, 1, 1, 1,
1.385981, 0.5455041, 1.366329, 1, 1, 1, 1, 1,
1.390616, -0.3178528, 0.6315696, 1, 1, 1, 1, 1,
1.391199, -0.3811497, 2.386244, 1, 1, 1, 1, 1,
1.395431, 0.3433058, 2.491566, 1, 1, 1, 1, 1,
1.399571, 0.2263976, 0.5820277, 1, 1, 1, 1, 1,
1.400319, -1.220849, 1.07638, 1, 1, 1, 1, 1,
1.40315, 0.1147913, 3.231974, 1, 1, 1, 1, 1,
1.409047, -0.1901211, 0.04555049, 1, 1, 1, 1, 1,
1.423931, -1.233759, 1.642043, 1, 1, 1, 1, 1,
1.429983, -0.3112398, 1.46217, 1, 1, 1, 1, 1,
1.430916, -0.6810921, 1.89895, 0, 0, 1, 1, 1,
1.432369, -0.126109, 0.2389969, 1, 0, 0, 1, 1,
1.433025, 1.178544, 1.461772, 1, 0, 0, 1, 1,
1.434242, -0.786189, 2.203301, 1, 0, 0, 1, 1,
1.453417, 0.3202446, 3.296619, 1, 0, 0, 1, 1,
1.456735, -0.04352913, 1.816138, 1, 0, 0, 1, 1,
1.465396, 1.178508, 0.3398621, 0, 0, 0, 1, 1,
1.474934, -0.5620351, 1.008036, 0, 0, 0, 1, 1,
1.477919, 0.7505196, 1.094458, 0, 0, 0, 1, 1,
1.478077, 1.320905, 0.4406835, 0, 0, 0, 1, 1,
1.482964, 0.4170639, 0.6940894, 0, 0, 0, 1, 1,
1.492677, -0.470218, 1.692553, 0, 0, 0, 1, 1,
1.508824, 0.3212021, 0.06700933, 0, 0, 0, 1, 1,
1.539433, -0.1283024, 1.733466, 1, 1, 1, 1, 1,
1.553163, -2.298658, 0.3968273, 1, 1, 1, 1, 1,
1.559436, 1.497626, 1.882455, 1, 1, 1, 1, 1,
1.562572, -0.9346514, 3.227005, 1, 1, 1, 1, 1,
1.568965, 0.5620709, 0.6237066, 1, 1, 1, 1, 1,
1.574947, -0.8564242, 2.080774, 1, 1, 1, 1, 1,
1.631312, 0.07189146, 2.109293, 1, 1, 1, 1, 1,
1.633433, 0.3491918, 0.7754956, 1, 1, 1, 1, 1,
1.639846, 0.3758593, 1.207129, 1, 1, 1, 1, 1,
1.639924, -0.06146461, 2.827266, 1, 1, 1, 1, 1,
1.641902, -0.7843306, 2.54577, 1, 1, 1, 1, 1,
1.643132, 0.5248355, 1.573722, 1, 1, 1, 1, 1,
1.649956, 0.1659226, 1.624842, 1, 1, 1, 1, 1,
1.650397, 0.1316254, 2.833349, 1, 1, 1, 1, 1,
1.656884, -1.352526, 4.314412, 1, 1, 1, 1, 1,
1.660883, -1.008519, 1.64626, 0, 0, 1, 1, 1,
1.6801, -0.3266491, 2.931201, 1, 0, 0, 1, 1,
1.683702, 1.261001, 1.207134, 1, 0, 0, 1, 1,
1.710586, 0.3733824, 3.075308, 1, 0, 0, 1, 1,
1.710809, 0.3999099, 1.819482, 1, 0, 0, 1, 1,
1.717571, 1.550257, 2.218395, 1, 0, 0, 1, 1,
1.71764, -1.66652, 1.747699, 0, 0, 0, 1, 1,
1.736928, 0.7422644, 0.6708106, 0, 0, 0, 1, 1,
1.745119, -1.003584, -0.2766309, 0, 0, 0, 1, 1,
1.74536, 0.1410271, 2.571401, 0, 0, 0, 1, 1,
1.770763, -0.1825104, 0.9431143, 0, 0, 0, 1, 1,
1.772079, -0.2538846, 2.494717, 0, 0, 0, 1, 1,
1.784567, -0.4521684, 2.938969, 0, 0, 0, 1, 1,
1.795154, -0.07059343, 2.287686, 1, 1, 1, 1, 1,
1.805344, 0.2039269, -0.05849947, 1, 1, 1, 1, 1,
1.809399, -1.39929, 1.528474, 1, 1, 1, 1, 1,
1.831689, 0.9557427, 0.7580122, 1, 1, 1, 1, 1,
1.833579, -0.632848, 3.301928, 1, 1, 1, 1, 1,
1.851257, 1.066603, -0.09543972, 1, 1, 1, 1, 1,
1.858355, -2.356368, 2.415689, 1, 1, 1, 1, 1,
1.872959, -1.599367, 3.894693, 1, 1, 1, 1, 1,
1.897215, -1.151467, 2.325451, 1, 1, 1, 1, 1,
1.898262, -0.5399563, 2.681263, 1, 1, 1, 1, 1,
1.900539, -0.1738372, 2.546194, 1, 1, 1, 1, 1,
1.925686, 0.7886995, 2.207762, 1, 1, 1, 1, 1,
1.931039, -0.4313523, 1.643352, 1, 1, 1, 1, 1,
1.947378, -0.1091214, 0.8349525, 1, 1, 1, 1, 1,
1.95233, -0.2457997, 2.461834, 1, 1, 1, 1, 1,
2.014386, 0.7991729, 0.4812714, 0, 0, 1, 1, 1,
2.048584, -0.4330793, 3.676518, 1, 0, 0, 1, 1,
2.075437, -0.2746067, 1.060478, 1, 0, 0, 1, 1,
2.202465, 0.5864615, 1.212947, 1, 0, 0, 1, 1,
2.206459, -0.5531188, 0.8256314, 1, 0, 0, 1, 1,
2.243383, 0.3873723, 1.854364, 1, 0, 0, 1, 1,
2.274891, 0.7006763, 1.760795, 0, 0, 0, 1, 1,
2.322432, 0.7329693, 2.808539, 0, 0, 0, 1, 1,
2.327375, -0.5672675, 1.481594, 0, 0, 0, 1, 1,
2.402615, 1.851047, 1.95098, 0, 0, 0, 1, 1,
2.429906, -0.2572485, 1.296945, 0, 0, 0, 1, 1,
2.512034, -0.5099643, 1.111307, 0, 0, 0, 1, 1,
2.544793, 1.416706, 0.1089437, 0, 0, 0, 1, 1,
2.639864, -0.331833, 0.9643479, 1, 1, 1, 1, 1,
2.754643, 0.2009788, 1.595711, 1, 1, 1, 1, 1,
2.812482, -0.5892285, 1.151002, 1, 1, 1, 1, 1,
2.895914, 0.9252641, 0.2349395, 1, 1, 1, 1, 1,
2.896828, 1.944547, 1.233717, 1, 1, 1, 1, 1,
3.023226, 0.2440276, 0.7315113, 1, 1, 1, 1, 1,
3.030254, 0.6880381, 1.822825, 1, 1, 1, 1, 1
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
var radius = 9.450334;
var distance = 33.1939;
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
mvMatrix.translate( 0.2359242, -0.3674586, 0.2174802 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.1939);
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
