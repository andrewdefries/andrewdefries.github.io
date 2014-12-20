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
-3.309092, -1.537432, -3.183462, 1, 0, 0, 1,
-3.212734, 0.7789957, 0.2414791, 1, 0.007843138, 0, 1,
-2.79291, 0.4064597, -1.079625, 1, 0.01176471, 0, 1,
-2.57743, -0.5539593, -1.854879, 1, 0.01960784, 0, 1,
-2.47272, 0.7560346, -1.39729, 1, 0.02352941, 0, 1,
-2.412048, 2.490278, -2.633054, 1, 0.03137255, 0, 1,
-2.380545, 2.25566, -1.437526, 1, 0.03529412, 0, 1,
-2.350698, -2.012504, -3.229317, 1, 0.04313726, 0, 1,
-2.306651, -0.9409524, -1.865501, 1, 0.04705882, 0, 1,
-2.275959, -1.196142, -3.991094, 1, 0.05490196, 0, 1,
-2.268569, 0.9579327, -2.746492, 1, 0.05882353, 0, 1,
-2.226277, 1.36697, -2.19945, 1, 0.06666667, 0, 1,
-2.223951, -0.9343866, -1.779701, 1, 0.07058824, 0, 1,
-2.186646, 1.579918, -1.751248, 1, 0.07843138, 0, 1,
-2.159372, -0.460318, -2.222764, 1, 0.08235294, 0, 1,
-2.158085, -1.084321, -1.55799, 1, 0.09019608, 0, 1,
-2.103207, 0.5021313, -2.02367, 1, 0.09411765, 0, 1,
-2.077512, 0.9785962, -0.9760237, 1, 0.1019608, 0, 1,
-2.069589, 1.120702, -2.940005, 1, 0.1098039, 0, 1,
-2.065851, 0.9071351, -1.555196, 1, 0.1137255, 0, 1,
-2.054782, 1.559911, 0.09359036, 1, 0.1215686, 0, 1,
-1.970534, -1.423762, -1.408374, 1, 0.1254902, 0, 1,
-1.966789, 0.05719757, -0.8374295, 1, 0.1333333, 0, 1,
-1.949948, 1.158951, -0.05371364, 1, 0.1372549, 0, 1,
-1.911624, 1.418594, -1.855526, 1, 0.145098, 0, 1,
-1.905853, 0.4835342, -1.507311, 1, 0.1490196, 0, 1,
-1.891776, 0.1990751, -2.249804, 1, 0.1568628, 0, 1,
-1.882089, -2.063833, -0.7564454, 1, 0.1607843, 0, 1,
-1.861815, 0.7115133, -0.953798, 1, 0.1686275, 0, 1,
-1.840993, 0.03193286, -2.132589, 1, 0.172549, 0, 1,
-1.840495, -0.5617508, -1.46579, 1, 0.1803922, 0, 1,
-1.813804, -1.400321, -3.32327, 1, 0.1843137, 0, 1,
-1.80455, 0.5569471, -1.596214, 1, 0.1921569, 0, 1,
-1.781922, -0.8907695, -2.15045, 1, 0.1960784, 0, 1,
-1.771434, -1.325282, -1.735007, 1, 0.2039216, 0, 1,
-1.741589, -1.142339, -0.7188253, 1, 0.2117647, 0, 1,
-1.739215, 0.4452657, -2.132222, 1, 0.2156863, 0, 1,
-1.738022, 0.2532065, -1.354694, 1, 0.2235294, 0, 1,
-1.732588, 1.372259, 1.558911, 1, 0.227451, 0, 1,
-1.727009, 1.301757, -0.8505457, 1, 0.2352941, 0, 1,
-1.716801, -1.055245, -2.853097, 1, 0.2392157, 0, 1,
-1.703215, -0.6117478, -1.86765, 1, 0.2470588, 0, 1,
-1.689844, 1.178459, -0.7128232, 1, 0.2509804, 0, 1,
-1.680233, -0.596742, -1.015612, 1, 0.2588235, 0, 1,
-1.680178, 1.073195, -0.266097, 1, 0.2627451, 0, 1,
-1.672117, -0.8610673, -2.485632, 1, 0.2705882, 0, 1,
-1.663606, 1.373251, 0.1545577, 1, 0.2745098, 0, 1,
-1.656109, -0.0002515922, -2.788199, 1, 0.282353, 0, 1,
-1.655321, 0.5314019, -1.515112, 1, 0.2862745, 0, 1,
-1.654748, 1.368351, -2.42515, 1, 0.2941177, 0, 1,
-1.653558, -1.048045, -1.723686, 1, 0.3019608, 0, 1,
-1.646759, -0.02167711, -2.348294, 1, 0.3058824, 0, 1,
-1.621282, 0.7468625, -1.043347, 1, 0.3137255, 0, 1,
-1.611863, 0.7540647, -0.8825039, 1, 0.3176471, 0, 1,
-1.604761, -0.847743, -2.038719, 1, 0.3254902, 0, 1,
-1.604728, -1.597816, -1.09186, 1, 0.3294118, 0, 1,
-1.596824, 1.362206, -1.926905, 1, 0.3372549, 0, 1,
-1.589058, -1.916227, -4.366152, 1, 0.3411765, 0, 1,
-1.571912, -5.801221e-05, 0.304664, 1, 0.3490196, 0, 1,
-1.567696, -0.3807704, -2.666429, 1, 0.3529412, 0, 1,
-1.566014, -1.098389, -2.848107, 1, 0.3607843, 0, 1,
-1.552516, -1.888859, -4.809297, 1, 0.3647059, 0, 1,
-1.550637, 1.732186, -1.137694, 1, 0.372549, 0, 1,
-1.546804, -0.1041452, -3.796665, 1, 0.3764706, 0, 1,
-1.542144, -0.7750037, -2.31727, 1, 0.3843137, 0, 1,
-1.523896, 1.426249, -2.131077, 1, 0.3882353, 0, 1,
-1.522518, 1.986691, 0.490933, 1, 0.3960784, 0, 1,
-1.52218, 0.6746545, -1.094081, 1, 0.4039216, 0, 1,
-1.521178, 0.5383372, -1.718511, 1, 0.4078431, 0, 1,
-1.516088, -0.7540326, -2.060989, 1, 0.4156863, 0, 1,
-1.513381, 0.2745552, -0.5758678, 1, 0.4196078, 0, 1,
-1.4979, -0.2879137, -0.8869172, 1, 0.427451, 0, 1,
-1.491915, 0.8987104, -1.417469, 1, 0.4313726, 0, 1,
-1.491173, -0.0568933, -3.379871, 1, 0.4392157, 0, 1,
-1.488796, -0.1296222, -0.9349294, 1, 0.4431373, 0, 1,
-1.488423, -0.01206374, -3.115688, 1, 0.4509804, 0, 1,
-1.48436, -1.29969, -2.805041, 1, 0.454902, 0, 1,
-1.477784, -0.2373406, -2.503245, 1, 0.4627451, 0, 1,
-1.463554, 0.1518087, 0.05210892, 1, 0.4666667, 0, 1,
-1.452096, 0.8246707, -0.7533443, 1, 0.4745098, 0, 1,
-1.447175, 1.573446, -1.187987, 1, 0.4784314, 0, 1,
-1.424573, -0.7038499, 0.2011615, 1, 0.4862745, 0, 1,
-1.42107, 0.2701825, -1.095079, 1, 0.4901961, 0, 1,
-1.376229, 0.540188, -1.062208, 1, 0.4980392, 0, 1,
-1.374372, 0.3042583, -1.77748, 1, 0.5058824, 0, 1,
-1.371526, 0.6371884, -3.311038, 1, 0.509804, 0, 1,
-1.365302, 0.8592123, -2.232745, 1, 0.5176471, 0, 1,
-1.364133, 0.5548738, -1.88912, 1, 0.5215687, 0, 1,
-1.363128, 0.5597389, -1.203756, 1, 0.5294118, 0, 1,
-1.355377, 1.827307, -0.3266093, 1, 0.5333334, 0, 1,
-1.3501, -0.5783288, -0.9862874, 1, 0.5411765, 0, 1,
-1.349905, -0.9995505, -0.7522861, 1, 0.5450981, 0, 1,
-1.343299, -1.847049, -1.823149, 1, 0.5529412, 0, 1,
-1.339613, -0.4781589, -2.31773, 1, 0.5568628, 0, 1,
-1.335387, -0.494159, -2.861519, 1, 0.5647059, 0, 1,
-1.325511, 1.86964, -1.307601, 1, 0.5686275, 0, 1,
-1.317215, -0.4974172, -1.328818, 1, 0.5764706, 0, 1,
-1.313787, -0.6660036, -4.671948, 1, 0.5803922, 0, 1,
-1.310219, 0.554972, -0.0796937, 1, 0.5882353, 0, 1,
-1.307594, -0.4443564, -1.567223, 1, 0.5921569, 0, 1,
-1.29204, 0.05033629, -3.093111, 1, 0.6, 0, 1,
-1.288494, 1.016528, -1.70902, 1, 0.6078432, 0, 1,
-1.286635, -1.41913, -2.945184, 1, 0.6117647, 0, 1,
-1.285747, 0.473498, -0.5259868, 1, 0.6196079, 0, 1,
-1.284272, 1.253232, -0.9590374, 1, 0.6235294, 0, 1,
-1.267708, -1.219719, -3.013937, 1, 0.6313726, 0, 1,
-1.262526, -0.7892833, -1.181011, 1, 0.6352941, 0, 1,
-1.257802, 1.932614, -1.425438, 1, 0.6431373, 0, 1,
-1.252181, -1.037642, -1.552979, 1, 0.6470588, 0, 1,
-1.23495, -0.6515948, -1.095423, 1, 0.654902, 0, 1,
-1.232704, -0.2779127, -1.280256, 1, 0.6588235, 0, 1,
-1.225103, -0.2611594, -3.919914, 1, 0.6666667, 0, 1,
-1.221477, -3.028825, -2.172759, 1, 0.6705883, 0, 1,
-1.219518, 1.451974, -1.211513, 1, 0.6784314, 0, 1,
-1.207872, -1.026004, -0.2178492, 1, 0.682353, 0, 1,
-1.2046, -0.1790277, -1.93564, 1, 0.6901961, 0, 1,
-1.194199, -0.77746, -0.9615149, 1, 0.6941177, 0, 1,
-1.183325, 0.3112327, -2.805399, 1, 0.7019608, 0, 1,
-1.177963, -1.259766, -3.679493, 1, 0.7098039, 0, 1,
-1.177162, -0.1783579, -2.693019, 1, 0.7137255, 0, 1,
-1.174694, -0.01183908, -2.359799, 1, 0.7215686, 0, 1,
-1.171454, -1.923404, -4.475436, 1, 0.7254902, 0, 1,
-1.155023, 0.5037086, -0.8728479, 1, 0.7333333, 0, 1,
-1.14971, -0.8301383, -2.389171, 1, 0.7372549, 0, 1,
-1.148243, -0.6394467, -3.630869, 1, 0.7450981, 0, 1,
-1.147932, 0.1757655, -0.9545634, 1, 0.7490196, 0, 1,
-1.147302, -0.1281028, -2.598371, 1, 0.7568628, 0, 1,
-1.14523, 1.214889, -0.17089, 1, 0.7607843, 0, 1,
-1.142568, -1.322928, -1.144593, 1, 0.7686275, 0, 1,
-1.137339, 0.5098057, -2.43205, 1, 0.772549, 0, 1,
-1.136713, 0.4874721, -1.162709, 1, 0.7803922, 0, 1,
-1.123157, -0.511551, -2.60545, 1, 0.7843137, 0, 1,
-1.123018, -0.1806632, -1.991035, 1, 0.7921569, 0, 1,
-1.122557, -0.1127878, -1.237904, 1, 0.7960784, 0, 1,
-1.121571, 0.05207876, -0.7478295, 1, 0.8039216, 0, 1,
-1.120209, 0.3620845, -0.786825, 1, 0.8117647, 0, 1,
-1.108056, 0.08109394, -0.3321156, 1, 0.8156863, 0, 1,
-1.107612, 0.07230873, -1.930814, 1, 0.8235294, 0, 1,
-1.097972, -1.116273, -1.447284, 1, 0.827451, 0, 1,
-1.093649, -0.1209732, -1.342515, 1, 0.8352941, 0, 1,
-1.092541, -0.3537459, -2.184828, 1, 0.8392157, 0, 1,
-1.087926, 0.2099708, -0.8593335, 1, 0.8470588, 0, 1,
-1.087322, 1.098032, 1.195028, 1, 0.8509804, 0, 1,
-1.079908, 0.1558338, -1.834298, 1, 0.8588235, 0, 1,
-1.069983, -0.9167033, -1.497453, 1, 0.8627451, 0, 1,
-1.057254, 0.9867793, -0.4948235, 1, 0.8705882, 0, 1,
-1.055661, -1.133389, -0.8535725, 1, 0.8745098, 0, 1,
-1.055501, 0.6705508, -1.363794, 1, 0.8823529, 0, 1,
-1.037287, 0.2519894, -2.003597, 1, 0.8862745, 0, 1,
-1.036413, 0.1322761, -0.9060731, 1, 0.8941177, 0, 1,
-1.025209, -0.5891046, -2.275445, 1, 0.8980392, 0, 1,
-1.017597, -1.380103, -3.535617, 1, 0.9058824, 0, 1,
-1.01659, 0.6226618, -2.241702, 1, 0.9137255, 0, 1,
-1.013321, -1.676906, -2.417783, 1, 0.9176471, 0, 1,
-0.996913, 0.2784396, 0.4152392, 1, 0.9254902, 0, 1,
-0.9899164, 0.779919, 0.005675041, 1, 0.9294118, 0, 1,
-0.9888301, 0.1290719, 1.248896, 1, 0.9372549, 0, 1,
-0.9844004, 0.005422606, -0.4005598, 1, 0.9411765, 0, 1,
-0.9766573, -1.421012, -3.706046, 1, 0.9490196, 0, 1,
-0.9723383, 0.1109469, -1.650851, 1, 0.9529412, 0, 1,
-0.9719322, 0.5801514, 0.9318457, 1, 0.9607843, 0, 1,
-0.9585722, 1.443553, -1.349651, 1, 0.9647059, 0, 1,
-0.9575593, -0.2352189, -0.6607503, 1, 0.972549, 0, 1,
-0.9575543, -0.8828769, -2.246622, 1, 0.9764706, 0, 1,
-0.9490767, -0.04780954, -3.384973, 1, 0.9843137, 0, 1,
-0.9442554, 0.6480877, -1.252872, 1, 0.9882353, 0, 1,
-0.9425244, -0.7172573, -3.564491, 1, 0.9960784, 0, 1,
-0.9284254, 0.06605092, -1.225012, 0.9960784, 1, 0, 1,
-0.9266867, 0.4995836, 0.52964, 0.9921569, 1, 0, 1,
-0.9243249, -0.5538768, 0.4063687, 0.9843137, 1, 0, 1,
-0.9237412, 1.376196, -0.9183111, 0.9803922, 1, 0, 1,
-0.922099, 0.5851241, -1.435788, 0.972549, 1, 0, 1,
-0.9125339, 1.266863, -0.9758469, 0.9686275, 1, 0, 1,
-0.910018, -0.1123814, -2.87217, 0.9607843, 1, 0, 1,
-0.9082841, 0.7460089, -2.077551, 0.9568627, 1, 0, 1,
-0.9061192, 0.7295004, 0.5568475, 0.9490196, 1, 0, 1,
-0.9060593, -0.1478217, -3.436103, 0.945098, 1, 0, 1,
-0.9024596, -0.7216827, -1.950029, 0.9372549, 1, 0, 1,
-0.898625, -0.4650872, -0.8492934, 0.9333333, 1, 0, 1,
-0.8941313, 0.7624028, 0.9723425, 0.9254902, 1, 0, 1,
-0.8939362, 1.263528, -0.3542667, 0.9215686, 1, 0, 1,
-0.8932821, 0.4857059, 0.824816, 0.9137255, 1, 0, 1,
-0.8885473, -0.5749537, -2.141656, 0.9098039, 1, 0, 1,
-0.8872167, -0.7949377, -2.375057, 0.9019608, 1, 0, 1,
-0.8862257, 0.543286, -1.774603, 0.8941177, 1, 0, 1,
-0.8842577, 1.893447, -0.9440894, 0.8901961, 1, 0, 1,
-0.8818102, -0.8073276, -1.546157, 0.8823529, 1, 0, 1,
-0.8812151, -1.566304, -3.485325, 0.8784314, 1, 0, 1,
-0.8738568, 0.2027181, -3.689745, 0.8705882, 1, 0, 1,
-0.871084, 0.4672563, -2.271651, 0.8666667, 1, 0, 1,
-0.8672355, 0.9136325, -1.371345, 0.8588235, 1, 0, 1,
-0.8647182, 1.262381, 0.1724256, 0.854902, 1, 0, 1,
-0.8618919, -0.5428977, -2.29762, 0.8470588, 1, 0, 1,
-0.8586679, -0.4782585, -2.333538, 0.8431373, 1, 0, 1,
-0.8554359, -1.755069, -3.705465, 0.8352941, 1, 0, 1,
-0.8500992, -0.7970469, -1.15485, 0.8313726, 1, 0, 1,
-0.8480539, -2.29507, -2.994635, 0.8235294, 1, 0, 1,
-0.8393499, 2.684518, 0.481327, 0.8196079, 1, 0, 1,
-0.8358387, 2.567717, 0.7955962, 0.8117647, 1, 0, 1,
-0.8249593, -1.984242, -0.8374565, 0.8078431, 1, 0, 1,
-0.8225299, 1.284044, -1.147666, 0.8, 1, 0, 1,
-0.8212535, 0.3217383, -2.392376, 0.7921569, 1, 0, 1,
-0.8196529, -1.056132, -3.326676, 0.7882353, 1, 0, 1,
-0.8178225, 0.046953, -1.219543, 0.7803922, 1, 0, 1,
-0.8159117, -1.01112, -3.886923, 0.7764706, 1, 0, 1,
-0.8143111, -0.2437839, -1.099556, 0.7686275, 1, 0, 1,
-0.8142522, 0.1371313, -2.373635, 0.7647059, 1, 0, 1,
-0.8123322, 0.6122196, -0.605181, 0.7568628, 1, 0, 1,
-0.8087553, -0.9062542, -3.163089, 0.7529412, 1, 0, 1,
-0.8084255, 0.03131359, -1.957445, 0.7450981, 1, 0, 1,
-0.8049021, 0.362461, -1.763345, 0.7411765, 1, 0, 1,
-0.80311, -0.3532449, -1.718985, 0.7333333, 1, 0, 1,
-0.800981, 0.1119841, -1.910024, 0.7294118, 1, 0, 1,
-0.7970086, 0.9341613, 0.2399049, 0.7215686, 1, 0, 1,
-0.7872982, -0.3102293, -2.558107, 0.7176471, 1, 0, 1,
-0.7806237, -0.4808125, -1.581602, 0.7098039, 1, 0, 1,
-0.777586, -0.1942722, -0.02361517, 0.7058824, 1, 0, 1,
-0.7694494, -1.012853, -3.977317, 0.6980392, 1, 0, 1,
-0.7687755, 0.1174642, 0.09960294, 0.6901961, 1, 0, 1,
-0.7679408, -0.6268768, -3.46546, 0.6862745, 1, 0, 1,
-0.7662247, 0.8880908, -0.4800926, 0.6784314, 1, 0, 1,
-0.7658018, 0.8094321, 0.5748556, 0.6745098, 1, 0, 1,
-0.7644325, 2.008289, 0.148897, 0.6666667, 1, 0, 1,
-0.7632256, -1.632022, -2.443608, 0.6627451, 1, 0, 1,
-0.7611492, 0.6857225, 0.3249708, 0.654902, 1, 0, 1,
-0.7570384, -1.152737, -2.825883, 0.6509804, 1, 0, 1,
-0.7536129, 1.056744, -0.4024868, 0.6431373, 1, 0, 1,
-0.752717, 1.546364, -3.083416, 0.6392157, 1, 0, 1,
-0.7523478, -0.1807212, -0.8562853, 0.6313726, 1, 0, 1,
-0.7398607, -1.661988, -2.741126, 0.627451, 1, 0, 1,
-0.7369902, 1.788029, 1.256056, 0.6196079, 1, 0, 1,
-0.7362264, 0.4300316, -0.04249453, 0.6156863, 1, 0, 1,
-0.7352945, -0.4938363, -0.7800497, 0.6078432, 1, 0, 1,
-0.7314463, 2.612925, -0.3404272, 0.6039216, 1, 0, 1,
-0.72251, -0.31007, -1.767573, 0.5960785, 1, 0, 1,
-0.7109018, -0.7752472, -1.073713, 0.5882353, 1, 0, 1,
-0.7105969, -0.2875121, -1.132616, 0.5843138, 1, 0, 1,
-0.7101527, -1.707804, -1.774279, 0.5764706, 1, 0, 1,
-0.7024367, -2.422363, -2.06339, 0.572549, 1, 0, 1,
-0.701771, 0.193125, -2.085279, 0.5647059, 1, 0, 1,
-0.6902799, -0.9327376, 0.2461635, 0.5607843, 1, 0, 1,
-0.6879318, 0.5556717, -0.103119, 0.5529412, 1, 0, 1,
-0.6851533, 1.120048, -2.049881, 0.5490196, 1, 0, 1,
-0.6785157, 1.077538, -2.747109, 0.5411765, 1, 0, 1,
-0.6772918, -0.3918439, -1.564762, 0.5372549, 1, 0, 1,
-0.6658434, -0.09463827, -0.4500011, 0.5294118, 1, 0, 1,
-0.6619961, -1.546839, -2.482848, 0.5254902, 1, 0, 1,
-0.6600225, 0.4630024, -2.284207, 0.5176471, 1, 0, 1,
-0.6593612, -1.303943, -0.7707725, 0.5137255, 1, 0, 1,
-0.6576407, 0.7177855, -2.140213, 0.5058824, 1, 0, 1,
-0.655993, -0.308522, -0.8620745, 0.5019608, 1, 0, 1,
-0.6497862, -0.5978929, -2.26518, 0.4941176, 1, 0, 1,
-0.6454003, 0.492284, -1.193755, 0.4862745, 1, 0, 1,
-0.6410323, -0.9981946, -2.607414, 0.4823529, 1, 0, 1,
-0.6369497, -0.619299, -3.426934, 0.4745098, 1, 0, 1,
-0.6349656, -0.5068486, -1.550135, 0.4705882, 1, 0, 1,
-0.6316162, 0.4304616, -1.068683, 0.4627451, 1, 0, 1,
-0.6281177, -0.2957037, -1.232194, 0.4588235, 1, 0, 1,
-0.6267385, -0.1152857, -1.903211, 0.4509804, 1, 0, 1,
-0.6267236, 0.325892, 0.9208707, 0.4470588, 1, 0, 1,
-0.6231709, 0.8898621, -0.4453031, 0.4392157, 1, 0, 1,
-0.6222694, -0.681321, -1.546539, 0.4352941, 1, 0, 1,
-0.6219421, -1.394658, -2.803016, 0.427451, 1, 0, 1,
-0.6174499, -1.534073, -2.828464, 0.4235294, 1, 0, 1,
-0.615656, -0.07530639, -1.223895, 0.4156863, 1, 0, 1,
-0.6137439, -0.7133371, -2.579896, 0.4117647, 1, 0, 1,
-0.6135829, -1.552351, -2.680367, 0.4039216, 1, 0, 1,
-0.6126179, -1.487901, -3.777319, 0.3960784, 1, 0, 1,
-0.6072525, -0.03810484, -0.08732454, 0.3921569, 1, 0, 1,
-0.6063244, 1.025547, 0.2786278, 0.3843137, 1, 0, 1,
-0.6058559, 0.4350246, -1.621771, 0.3803922, 1, 0, 1,
-0.5992233, -1.629139, -2.331429, 0.372549, 1, 0, 1,
-0.5981101, -0.1687389, -1.349179, 0.3686275, 1, 0, 1,
-0.5975543, -1.385554, -1.893947, 0.3607843, 1, 0, 1,
-0.5947042, 0.5307736, -0.981618, 0.3568628, 1, 0, 1,
-0.5911759, 1.209416, -0.2999108, 0.3490196, 1, 0, 1,
-0.5874897, 0.7005741, 1.098463, 0.345098, 1, 0, 1,
-0.5804707, -0.2542039, -0.9113113, 0.3372549, 1, 0, 1,
-0.5754287, -0.05416933, -1.751928, 0.3333333, 1, 0, 1,
-0.5738274, 0.878323, 1.120655, 0.3254902, 1, 0, 1,
-0.5718299, -0.9684506, -3.704454, 0.3215686, 1, 0, 1,
-0.5705113, -1.303471, -2.689253, 0.3137255, 1, 0, 1,
-0.5680982, -1.049985, -0.8678312, 0.3098039, 1, 0, 1,
-0.5637883, -0.2893941, -1.668922, 0.3019608, 1, 0, 1,
-0.5633656, -1.024644, -3.621687, 0.2941177, 1, 0, 1,
-0.5614942, -1.823536, -3.550007, 0.2901961, 1, 0, 1,
-0.5552518, 0.2913811, -1.374422, 0.282353, 1, 0, 1,
-0.5535458, 0.6589052, -3.202024, 0.2784314, 1, 0, 1,
-0.5531123, 0.1179569, 0.4519705, 0.2705882, 1, 0, 1,
-0.552514, -0.5074275, -2.0223, 0.2666667, 1, 0, 1,
-0.5511349, -1.50108, -2.812876, 0.2588235, 1, 0, 1,
-0.5490301, 1.767301, 0.3803852, 0.254902, 1, 0, 1,
-0.5457144, -1.030584, -1.432465, 0.2470588, 1, 0, 1,
-0.5448335, 0.01515825, -2.108782, 0.2431373, 1, 0, 1,
-0.5399337, 2.408775, -0.3717145, 0.2352941, 1, 0, 1,
-0.5331464, 0.4214043, -1.276777, 0.2313726, 1, 0, 1,
-0.5287455, 0.7409555, -1.151702, 0.2235294, 1, 0, 1,
-0.5268181, -0.4183127, -2.177456, 0.2196078, 1, 0, 1,
-0.5260723, -0.02772913, -1.057128, 0.2117647, 1, 0, 1,
-0.5258635, -1.082948, -1.240668, 0.2078431, 1, 0, 1,
-0.5129067, -1.931063, -2.320396, 0.2, 1, 0, 1,
-0.5123036, 0.03085498, -2.771664, 0.1921569, 1, 0, 1,
-0.5097309, -0.08896086, -2.167602, 0.1882353, 1, 0, 1,
-0.5061581, -1.218658, -1.850842, 0.1803922, 1, 0, 1,
-0.5041131, 1.472934, 1.654248, 0.1764706, 1, 0, 1,
-0.5040359, 1.024519, -0.9517572, 0.1686275, 1, 0, 1,
-0.5006182, 0.8650414, -1.682842, 0.1647059, 1, 0, 1,
-0.49608, 0.00276783, -2.800273, 0.1568628, 1, 0, 1,
-0.4955436, -0.6526199, -1.641759, 0.1529412, 1, 0, 1,
-0.4878672, -0.3526995, -2.112163, 0.145098, 1, 0, 1,
-0.4830484, -0.6280908, -2.387138, 0.1411765, 1, 0, 1,
-0.4794416, 0.3794139, -1.297482, 0.1333333, 1, 0, 1,
-0.4772948, 0.9987557, -1.384448, 0.1294118, 1, 0, 1,
-0.4707024, 0.2469845, -1.745242, 0.1215686, 1, 0, 1,
-0.4702219, -0.3129799, -1.333443, 0.1176471, 1, 0, 1,
-0.4698393, 0.08946495, -1.207494, 0.1098039, 1, 0, 1,
-0.4691657, -0.08554847, -1.462547, 0.1058824, 1, 0, 1,
-0.4688489, 0.4704303, -1.072709, 0.09803922, 1, 0, 1,
-0.4519438, 0.06622956, -0.6058833, 0.09019608, 1, 0, 1,
-0.4426054, -0.86007, -2.219225, 0.08627451, 1, 0, 1,
-0.4419071, -0.1162374, -1.707729, 0.07843138, 1, 0, 1,
-0.4408397, -1.384246, -1.761254, 0.07450981, 1, 0, 1,
-0.4391337, -0.6229475, -2.006083, 0.06666667, 1, 0, 1,
-0.4362324, 0.6059773, 0.773681, 0.0627451, 1, 0, 1,
-0.4340631, -0.09706615, -0.1005031, 0.05490196, 1, 0, 1,
-0.4295039, -0.5376157, -3.392944, 0.05098039, 1, 0, 1,
-0.4266776, 1.506183, -0.1165359, 0.04313726, 1, 0, 1,
-0.4261531, 1.076447, 1.349888, 0.03921569, 1, 0, 1,
-0.4239914, -0.62159, -2.285726, 0.03137255, 1, 0, 1,
-0.4171167, 0.2461954, -2.211879, 0.02745098, 1, 0, 1,
-0.4158788, -0.4469817, -0.9315277, 0.01960784, 1, 0, 1,
-0.4158773, 0.61875, -2.046835, 0.01568628, 1, 0, 1,
-0.4136629, -0.4082289, -3.802035, 0.007843138, 1, 0, 1,
-0.4129995, 1.426039, -0.7331101, 0.003921569, 1, 0, 1,
-0.4122395, 1.19399, -1.009003, 0, 1, 0.003921569, 1,
-0.4108445, 1.191434, -0.7864574, 0, 1, 0.01176471, 1,
-0.4104885, -0.8774875, -4.249943, 0, 1, 0.01568628, 1,
-0.4043067, 0.04318628, -2.111853, 0, 1, 0.02352941, 1,
-0.401534, 0.3398794, -2.674183, 0, 1, 0.02745098, 1,
-0.4013978, 0.07843166, -1.119243, 0, 1, 0.03529412, 1,
-0.3996769, 0.1906533, -0.6610297, 0, 1, 0.03921569, 1,
-0.399577, 0.4334667, -0.9264413, 0, 1, 0.04705882, 1,
-0.3953559, 0.2449826, -2.839408, 0, 1, 0.05098039, 1,
-0.3948372, 1.387435, 0.4447663, 0, 1, 0.05882353, 1,
-0.3943707, -0.3531232, -4.133125, 0, 1, 0.0627451, 1,
-0.3888292, 0.8304518, -0.3648866, 0, 1, 0.07058824, 1,
-0.3880838, -0.6871306, -2.871501, 0, 1, 0.07450981, 1,
-0.3860129, 0.5950519, 0.8165063, 0, 1, 0.08235294, 1,
-0.3854826, 0.07159927, -0.6986177, 0, 1, 0.08627451, 1,
-0.3848701, -1.09625, -1.633868, 0, 1, 0.09411765, 1,
-0.3848082, 0.8007112, -2.775542, 0, 1, 0.1019608, 1,
-0.3832195, 0.7420304, -0.8967611, 0, 1, 0.1058824, 1,
-0.3792602, -0.02428673, -2.037171, 0, 1, 0.1137255, 1,
-0.3715495, -0.9240689, -0.8779711, 0, 1, 0.1176471, 1,
-0.3655773, 0.5920616, -0.8355265, 0, 1, 0.1254902, 1,
-0.3630828, -0.4801972, -2.326152, 0, 1, 0.1294118, 1,
-0.3589872, 0.9851535, -0.5523648, 0, 1, 0.1372549, 1,
-0.356945, -0.03641115, -2.032492, 0, 1, 0.1411765, 1,
-0.3568971, -0.3850486, -2.712697, 0, 1, 0.1490196, 1,
-0.3565207, 1.357269, 1.167517, 0, 1, 0.1529412, 1,
-0.354187, -0.6377864, -4.713422, 0, 1, 0.1607843, 1,
-0.3469934, 0.8687925, -0.6436056, 0, 1, 0.1647059, 1,
-0.3442167, 1.827579, -0.4723074, 0, 1, 0.172549, 1,
-0.3431102, -1.316907, -1.439885, 0, 1, 0.1764706, 1,
-0.3388709, 0.288139, 0.4253491, 0, 1, 0.1843137, 1,
-0.3378499, 0.7456597, -3.024859, 0, 1, 0.1882353, 1,
-0.3372927, 0.784269, 0.6901078, 0, 1, 0.1960784, 1,
-0.3357725, 0.3549887, -2.66956, 0, 1, 0.2039216, 1,
-0.3293434, -0.6771913, -3.475293, 0, 1, 0.2078431, 1,
-0.3282158, -0.1402217, -2.892142, 0, 1, 0.2156863, 1,
-0.3280169, -0.004300994, -1.751521, 0, 1, 0.2196078, 1,
-0.3245784, -0.145557, -1.771956, 0, 1, 0.227451, 1,
-0.324431, 0.2485952, 0.8934633, 0, 1, 0.2313726, 1,
-0.3235653, -0.2382055, -2.506594, 0, 1, 0.2392157, 1,
-0.322593, 0.2678986, -0.2953315, 0, 1, 0.2431373, 1,
-0.3118311, -0.5241622, -2.727393, 0, 1, 0.2509804, 1,
-0.3113918, -1.26133, -1.540391, 0, 1, 0.254902, 1,
-0.3095252, 1.13438, 0.9468476, 0, 1, 0.2627451, 1,
-0.308249, -0.6927614, -2.147112, 0, 1, 0.2666667, 1,
-0.3081479, 1.253634, -1.907187, 0, 1, 0.2745098, 1,
-0.3063177, 0.2192524, -0.9207609, 0, 1, 0.2784314, 1,
-0.3047545, 0.4253056, 0.7365661, 0, 1, 0.2862745, 1,
-0.3027466, -1.373692, -3.822918, 0, 1, 0.2901961, 1,
-0.3011392, 0.04198255, -1.456899, 0, 1, 0.2980392, 1,
-0.3006365, 0.4169642, -1.79833, 0, 1, 0.3058824, 1,
-0.2918632, 1.28037, -0.5060835, 0, 1, 0.3098039, 1,
-0.2846391, 0.5142272, -1.715901, 0, 1, 0.3176471, 1,
-0.2836896, 1.177375, 0.1721576, 0, 1, 0.3215686, 1,
-0.282786, 0.5552813, -0.6957182, 0, 1, 0.3294118, 1,
-0.2768335, 1.255776, 0.9678364, 0, 1, 0.3333333, 1,
-0.2697173, 0.747592, -0.9014689, 0, 1, 0.3411765, 1,
-0.2669991, -0.4854631, -4.023346, 0, 1, 0.345098, 1,
-0.266548, 0.3486217, -0.2717595, 0, 1, 0.3529412, 1,
-0.266237, 0.5113731, -0.6982182, 0, 1, 0.3568628, 1,
-0.2635132, -1.547504, -2.725929, 0, 1, 0.3647059, 1,
-0.2625341, 1.047892, 0.9396095, 0, 1, 0.3686275, 1,
-0.2601524, 1.090873, 0.5465777, 0, 1, 0.3764706, 1,
-0.2589202, 0.9108043, -1.163175, 0, 1, 0.3803922, 1,
-0.2524123, -1.088269, -1.793215, 0, 1, 0.3882353, 1,
-0.2468454, -0.4835506, -2.816786, 0, 1, 0.3921569, 1,
-0.2465674, -1.13137, -2.674041, 0, 1, 0.4, 1,
-0.2460382, -1.985521, -4.607244, 0, 1, 0.4078431, 1,
-0.242166, -1.850337, -1.783237, 0, 1, 0.4117647, 1,
-0.2377811, -0.7644952, -3.305171, 0, 1, 0.4196078, 1,
-0.2358914, -0.3211948, -3.12554, 0, 1, 0.4235294, 1,
-0.2332082, 0.7368238, 0.272738, 0, 1, 0.4313726, 1,
-0.2290235, 0.6106862, 0.8056675, 0, 1, 0.4352941, 1,
-0.2245782, 2.06615, -0.7344959, 0, 1, 0.4431373, 1,
-0.2140758, 0.1784847, -0.4827326, 0, 1, 0.4470588, 1,
-0.2107117, 1.187097, -1.229729, 0, 1, 0.454902, 1,
-0.2060446, 0.9733713, 0.7598494, 0, 1, 0.4588235, 1,
-0.2060317, 1.226503, 0.5078231, 0, 1, 0.4666667, 1,
-0.2055323, -2.197827, -2.415115, 0, 1, 0.4705882, 1,
-0.2048113, 0.8434554, -0.7622601, 0, 1, 0.4784314, 1,
-0.2034474, -1.155263, -1.496756, 0, 1, 0.4823529, 1,
-0.2020125, -1.155665, -4.067338, 0, 1, 0.4901961, 1,
-0.200711, 0.7236854, 2.315202, 0, 1, 0.4941176, 1,
-0.2006416, -0.12362, -2.270721, 0, 1, 0.5019608, 1,
-0.2002862, -0.4181947, -1.291988, 0, 1, 0.509804, 1,
-0.1972581, -0.5124548, -2.284214, 0, 1, 0.5137255, 1,
-0.1965874, -0.1721983, -3.839216, 0, 1, 0.5215687, 1,
-0.1915659, -0.8926275, -2.621336, 0, 1, 0.5254902, 1,
-0.1906882, 1.467517, -0.2139742, 0, 1, 0.5333334, 1,
-0.1873222, -1.346879, -2.059512, 0, 1, 0.5372549, 1,
-0.1865727, -0.02938626, -1.330807, 0, 1, 0.5450981, 1,
-0.1861414, 1.704411, 0.07343753, 0, 1, 0.5490196, 1,
-0.1847701, -2.10982, -3.615421, 0, 1, 0.5568628, 1,
-0.1844521, 0.330604, 1.878401, 0, 1, 0.5607843, 1,
-0.1840032, 1.603767, -2.206824, 0, 1, 0.5686275, 1,
-0.1836274, 1.046068, -1.08989, 0, 1, 0.572549, 1,
-0.1804834, -0.192232, -1.681343, 0, 1, 0.5803922, 1,
-0.1781835, -0.01318822, 0.02790108, 0, 1, 0.5843138, 1,
-0.1770635, -1.277636, -5.247488, 0, 1, 0.5921569, 1,
-0.1725144, 1.589689, -0.9831213, 0, 1, 0.5960785, 1,
-0.171545, 1.075197, -1.030644, 0, 1, 0.6039216, 1,
-0.1701594, -0.1344959, -1.938043, 0, 1, 0.6117647, 1,
-0.1697927, -1.002164, -2.941781, 0, 1, 0.6156863, 1,
-0.1684435, 0.8739743, -2.047263, 0, 1, 0.6235294, 1,
-0.1666464, 1.185029, -2.215124, 0, 1, 0.627451, 1,
-0.1660348, 0.7854317, 0.2133567, 0, 1, 0.6352941, 1,
-0.1622619, -0.3905855, -2.407843, 0, 1, 0.6392157, 1,
-0.1503844, 0.2011116, 1.895164, 0, 1, 0.6470588, 1,
-0.1501893, -0.3413575, -2.628621, 0, 1, 0.6509804, 1,
-0.1497091, 0.9480749, -0.02992208, 0, 1, 0.6588235, 1,
-0.1452502, 0.3857737, -2.146205, 0, 1, 0.6627451, 1,
-0.1364894, -1.147524, -5.572772, 0, 1, 0.6705883, 1,
-0.1357011, 2.424799, -1.230091, 0, 1, 0.6745098, 1,
-0.1355486, 0.4431049, -0.6517447, 0, 1, 0.682353, 1,
-0.1349067, 0.1842735, -0.05903409, 0, 1, 0.6862745, 1,
-0.1347709, -1.592918, -3.419047, 0, 1, 0.6941177, 1,
-0.1319977, 0.1945237, -0.07990535, 0, 1, 0.7019608, 1,
-0.1312296, -0.1150321, -3.402173, 0, 1, 0.7058824, 1,
-0.1263105, -0.8468096, -3.342483, 0, 1, 0.7137255, 1,
-0.1237297, -0.9248174, -2.298193, 0, 1, 0.7176471, 1,
-0.1226043, -0.6139492, -1.187882, 0, 1, 0.7254902, 1,
-0.1132813, 1.229539, 1.657165, 0, 1, 0.7294118, 1,
-0.1118151, 1.035156, -0.457951, 0, 1, 0.7372549, 1,
-0.1087002, 1.399812, 0.7696723, 0, 1, 0.7411765, 1,
-0.1084993, 0.5789037, 1.617206, 0, 1, 0.7490196, 1,
-0.1083506, -0.1675281, -3.322211, 0, 1, 0.7529412, 1,
-0.1043099, 0.9974948, -0.4575389, 0, 1, 0.7607843, 1,
-0.09890604, -2.071878, -3.534822, 0, 1, 0.7647059, 1,
-0.09820107, 1.288456, -2.24339, 0, 1, 0.772549, 1,
-0.09607112, -1.029781, -3.625469, 0, 1, 0.7764706, 1,
-0.09098233, -1.822203, -4.259802, 0, 1, 0.7843137, 1,
-0.08937573, -1.282911, -2.804431, 0, 1, 0.7882353, 1,
-0.08908499, 0.3855372, 0.4055006, 0, 1, 0.7960784, 1,
-0.08905392, -1.09189, -1.445565, 0, 1, 0.8039216, 1,
-0.0882626, -0.8896807, -1.556808, 0, 1, 0.8078431, 1,
-0.08730014, -0.1921442, -1.158212, 0, 1, 0.8156863, 1,
-0.08606488, -0.8318468, -5.065963, 0, 1, 0.8196079, 1,
-0.08371063, -1.257216, -2.443273, 0, 1, 0.827451, 1,
-0.08313642, -2.355976, -3.627256, 0, 1, 0.8313726, 1,
-0.08127175, 2.364165, 1.218378, 0, 1, 0.8392157, 1,
-0.08053719, -0.1899361, -2.564996, 0, 1, 0.8431373, 1,
-0.07839824, 1.032835, -0.6724861, 0, 1, 0.8509804, 1,
-0.07796603, 2.12289, 0.5676382, 0, 1, 0.854902, 1,
-0.07692779, -0.8139635, -2.767487, 0, 1, 0.8627451, 1,
-0.07239207, 0.8692733, -0.7384808, 0, 1, 0.8666667, 1,
-0.06794494, 1.425249, 0.2074127, 0, 1, 0.8745098, 1,
-0.06523239, -1.366761, -2.287108, 0, 1, 0.8784314, 1,
-0.06491694, -1.542635, -3.817618, 0, 1, 0.8862745, 1,
-0.05979263, -0.3069654, -4.662454, 0, 1, 0.8901961, 1,
-0.05841816, -0.010568, -1.146153, 0, 1, 0.8980392, 1,
-0.0563535, 0.6370396, 0.2080153, 0, 1, 0.9058824, 1,
-0.05549562, -0.4961104, -4.934769, 0, 1, 0.9098039, 1,
-0.0536982, 3.181266, 1.783766, 0, 1, 0.9176471, 1,
-0.05072214, -0.264107, -3.450459, 0, 1, 0.9215686, 1,
-0.04818417, 1.263636, 0.8679875, 0, 1, 0.9294118, 1,
-0.04719162, -0.1697287, -3.252131, 0, 1, 0.9333333, 1,
-0.03636369, 0.6810486, -3.060873, 0, 1, 0.9411765, 1,
-0.03156172, -1.280473, -3.952605, 0, 1, 0.945098, 1,
-0.02888265, 1.004433, -1.583108, 0, 1, 0.9529412, 1,
-0.02710456, 0.7764179, -0.228783, 0, 1, 0.9568627, 1,
-0.02491131, -0.1584654, -3.807759, 0, 1, 0.9647059, 1,
-0.02462809, 0.3301177, 1.751746, 0, 1, 0.9686275, 1,
-0.02361131, 0.9350271, 1.071738, 0, 1, 0.9764706, 1,
-0.01886065, 0.2499894, 0.8288544, 0, 1, 0.9803922, 1,
-0.0180332, 1.07873, -1.215567, 0, 1, 0.9882353, 1,
-0.01527373, -0.01159618, -2.123629, 0, 1, 0.9921569, 1,
-0.01512457, 0.5524318, -0.05249433, 0, 1, 1, 1,
-0.01250768, -0.1130317, -2.590289, 0, 0.9921569, 1, 1,
-0.007075124, 0.01636896, 0.1390226, 0, 0.9882353, 1, 1,
-0.003778488, 0.7965691, 1.58009, 0, 0.9803922, 1, 1,
-0.003150179, 0.9599528, 1.15527, 0, 0.9764706, 1, 1,
-0.0008091446, 0.04108365, -1.209158, 0, 0.9686275, 1, 1,
0.008767778, 0.1681262, 0.238247, 0, 0.9647059, 1, 1,
0.01202004, -0.7386198, 2.72697, 0, 0.9568627, 1, 1,
0.01311151, -0.8333507, 5.600552, 0, 0.9529412, 1, 1,
0.01446493, -0.1989868, 2.949019, 0, 0.945098, 1, 1,
0.01712337, 1.150326, -0.2418091, 0, 0.9411765, 1, 1,
0.01752364, -1.289481, 2.746133, 0, 0.9333333, 1, 1,
0.01752845, 0.8570562, 1.022383, 0, 0.9294118, 1, 1,
0.02248756, -0.8857507, 1.572016, 0, 0.9215686, 1, 1,
0.02268704, -1.221763, 3.852703, 0, 0.9176471, 1, 1,
0.02608396, 0.009493, 1.194258, 0, 0.9098039, 1, 1,
0.03000821, 0.3116592, -1.552555, 0, 0.9058824, 1, 1,
0.03695653, 0.70487, -0.6309707, 0, 0.8980392, 1, 1,
0.04057232, 0.3773193, 1.401194, 0, 0.8901961, 1, 1,
0.0484823, 0.2765744, -0.378334, 0, 0.8862745, 1, 1,
0.04995658, 1.591168, 0.6329729, 0, 0.8784314, 1, 1,
0.05314999, -0.4719289, 4.640093, 0, 0.8745098, 1, 1,
0.05367967, 0.2919511, 2.21386, 0, 0.8666667, 1, 1,
0.05616706, -0.5784503, 4.587339, 0, 0.8627451, 1, 1,
0.05846238, -0.4167428, 2.824919, 0, 0.854902, 1, 1,
0.06331455, 0.268761, -0.5368845, 0, 0.8509804, 1, 1,
0.06857073, 0.5552253, -1.835514, 0, 0.8431373, 1, 1,
0.06996574, -1.655323, 3.010618, 0, 0.8392157, 1, 1,
0.07398426, -1.315886, 3.224035, 0, 0.8313726, 1, 1,
0.07729187, 0.2109181, 0.8441672, 0, 0.827451, 1, 1,
0.07750849, 2.032719, 0.03884555, 0, 0.8196079, 1, 1,
0.08292992, -0.1127422, 3.217577, 0, 0.8156863, 1, 1,
0.08411019, -1.227378, 3.638987, 0, 0.8078431, 1, 1,
0.08587626, -0.7252653, 2.110705, 0, 0.8039216, 1, 1,
0.08987375, -0.4246349, 4.380126, 0, 0.7960784, 1, 1,
0.09483667, -1.074922, 3.845124, 0, 0.7882353, 1, 1,
0.1027484, -0.9298759, 2.662088, 0, 0.7843137, 1, 1,
0.1049155, -0.1982286, 4.006847, 0, 0.7764706, 1, 1,
0.1049958, 0.1760371, 2.523695, 0, 0.772549, 1, 1,
0.109043, 1.223353, -1.562298, 0, 0.7647059, 1, 1,
0.1113872, -2.460846, 4.498769, 0, 0.7607843, 1, 1,
0.111666, -0.1947193, 3.233339, 0, 0.7529412, 1, 1,
0.1125998, -1.588943, 2.264759, 0, 0.7490196, 1, 1,
0.1135088, 1.234988, -0.8929774, 0, 0.7411765, 1, 1,
0.1199489, -1.418399, 4.88602, 0, 0.7372549, 1, 1,
0.1219829, -1.348023, 3.233302, 0, 0.7294118, 1, 1,
0.1254588, -0.4271198, 1.656541, 0, 0.7254902, 1, 1,
0.1262767, 0.2558364, 0.5160523, 0, 0.7176471, 1, 1,
0.1294421, -0.7885553, 3.130755, 0, 0.7137255, 1, 1,
0.1310776, 0.1456046, 0.5024768, 0, 0.7058824, 1, 1,
0.1338637, -1.155954, 4.594833, 0, 0.6980392, 1, 1,
0.1344962, 1.058197, -0.7004565, 0, 0.6941177, 1, 1,
0.1390528, 0.325985, 0.1090544, 0, 0.6862745, 1, 1,
0.1423677, -0.4000897, 3.322721, 0, 0.682353, 1, 1,
0.1446009, 0.6207192, -1.047061, 0, 0.6745098, 1, 1,
0.1455618, -0.5093336, 5.578444, 0, 0.6705883, 1, 1,
0.160258, -0.5266814, 5.591914, 0, 0.6627451, 1, 1,
0.1632663, 0.2736996, -0.5510192, 0, 0.6588235, 1, 1,
0.1681849, -0.4299743, 1.665696, 0, 0.6509804, 1, 1,
0.1716633, 0.134062, 1.919912, 0, 0.6470588, 1, 1,
0.1717145, 0.08477427, -0.2167305, 0, 0.6392157, 1, 1,
0.1721693, -0.1610213, 1.959534, 0, 0.6352941, 1, 1,
0.1726897, 0.4579985, 0.093241, 0, 0.627451, 1, 1,
0.1762182, -1.059615, 1.788531, 0, 0.6235294, 1, 1,
0.1800474, -0.6605651, 3.368627, 0, 0.6156863, 1, 1,
0.1810466, -0.9559283, 4.521916, 0, 0.6117647, 1, 1,
0.1828703, 1.850371, -0.8310479, 0, 0.6039216, 1, 1,
0.1839923, 1.228805, -0.9966854, 0, 0.5960785, 1, 1,
0.1931451, 0.5614406, 0.9638696, 0, 0.5921569, 1, 1,
0.1993873, -0.3959506, 3.886136, 0, 0.5843138, 1, 1,
0.2001561, 1.679053, -2.139472, 0, 0.5803922, 1, 1,
0.2004107, -0.1421694, 3.153161, 0, 0.572549, 1, 1,
0.2006795, 0.95056, 1.065, 0, 0.5686275, 1, 1,
0.2076063, 0.972765, 0.9208459, 0, 0.5607843, 1, 1,
0.2087226, 0.6839414, -0.1636208, 0, 0.5568628, 1, 1,
0.2162389, 2.369839, -1.550931, 0, 0.5490196, 1, 1,
0.2200253, 0.0380959, -0.3664962, 0, 0.5450981, 1, 1,
0.2203873, 0.2564829, 0.4821038, 0, 0.5372549, 1, 1,
0.22303, -0.01229579, 2.216362, 0, 0.5333334, 1, 1,
0.227419, 0.1844764, 1.620886, 0, 0.5254902, 1, 1,
0.2289119, -0.1256601, 2.212928, 0, 0.5215687, 1, 1,
0.2289369, 1.319609, 0.8296341, 0, 0.5137255, 1, 1,
0.2322074, 0.02376337, 0.2554227, 0, 0.509804, 1, 1,
0.2342199, 0.05428512, 1.170544, 0, 0.5019608, 1, 1,
0.2342594, -0.9526203, 4.199645, 0, 0.4941176, 1, 1,
0.237551, -2.188257, 4.594997, 0, 0.4901961, 1, 1,
0.2383177, -0.250292, 2.668644, 0, 0.4823529, 1, 1,
0.2383822, 1.19898, -0.9176129, 0, 0.4784314, 1, 1,
0.2385342, -0.435829, 2.617064, 0, 0.4705882, 1, 1,
0.2396822, -1.030679, 2.036027, 0, 0.4666667, 1, 1,
0.2455328, -0.05466921, 0.9322205, 0, 0.4588235, 1, 1,
0.2456824, -0.01271306, 1.548867, 0, 0.454902, 1, 1,
0.2457517, 0.02143958, 1.231273, 0, 0.4470588, 1, 1,
0.2507979, -0.9173927, 3.169187, 0, 0.4431373, 1, 1,
0.2545033, -0.647781, 2.698852, 0, 0.4352941, 1, 1,
0.2554149, 0.6308187, -0.1491244, 0, 0.4313726, 1, 1,
0.2597944, 0.4808231, -1.13853, 0, 0.4235294, 1, 1,
0.262008, 0.2357302, 3.080411, 0, 0.4196078, 1, 1,
0.263181, 1.03644, 0.7629542, 0, 0.4117647, 1, 1,
0.2642036, 0.06980309, 1.188946, 0, 0.4078431, 1, 1,
0.2643009, 0.4659289, -1.193779, 0, 0.4, 1, 1,
0.2704828, 0.1216608, 2.659391, 0, 0.3921569, 1, 1,
0.2714091, -1.762325, 3.156359, 0, 0.3882353, 1, 1,
0.2726722, 0.0404129, 1.557926, 0, 0.3803922, 1, 1,
0.27861, -0.8333124, 3.16369, 0, 0.3764706, 1, 1,
0.2791588, -2.084393, 1.68185, 0, 0.3686275, 1, 1,
0.287877, 0.2684195, 1.265785, 0, 0.3647059, 1, 1,
0.2913536, 0.04900276, 1.133168, 0, 0.3568628, 1, 1,
0.2913713, 0.3002707, 0.7757279, 0, 0.3529412, 1, 1,
0.2946858, -0.49257, 1.665283, 0, 0.345098, 1, 1,
0.2985961, 0.4073508, 0.03898859, 0, 0.3411765, 1, 1,
0.299683, -0.7348535, 4.570785, 0, 0.3333333, 1, 1,
0.2999536, -1.865877, 4.351562, 0, 0.3294118, 1, 1,
0.3008778, -0.1387556, 1.197567, 0, 0.3215686, 1, 1,
0.3020968, 2.23212, -0.1584416, 0, 0.3176471, 1, 1,
0.3032411, -1.560947, 1.81188, 0, 0.3098039, 1, 1,
0.3050783, 0.1028601, -0.432967, 0, 0.3058824, 1, 1,
0.3052255, 0.8200418, -0.5982764, 0, 0.2980392, 1, 1,
0.3057041, -0.2442773, 2.679699, 0, 0.2901961, 1, 1,
0.3074627, -0.6477674, 2.206383, 0, 0.2862745, 1, 1,
0.307908, 0.5379292, 2.110859, 0, 0.2784314, 1, 1,
0.3099516, -1.149246, 4.093559, 0, 0.2745098, 1, 1,
0.3099721, -0.7157423, 3.223625, 0, 0.2666667, 1, 1,
0.3123923, 0.4209964, 0.5137417, 0, 0.2627451, 1, 1,
0.3150203, -0.4041697, 2.303488, 0, 0.254902, 1, 1,
0.316288, 0.3728203, 1.523388, 0, 0.2509804, 1, 1,
0.3163915, -0.3051051, 1.932964, 0, 0.2431373, 1, 1,
0.3185742, -1.135161, 4.850173, 0, 0.2392157, 1, 1,
0.3208368, 1.596033, 1.57668, 0, 0.2313726, 1, 1,
0.3259245, 0.09959409, 1.417446, 0, 0.227451, 1, 1,
0.3268414, 0.8608848, -0.1572859, 0, 0.2196078, 1, 1,
0.328379, 0.04454734, 3.092112, 0, 0.2156863, 1, 1,
0.3297474, -0.841397, 2.217771, 0, 0.2078431, 1, 1,
0.3327159, 0.278703, 0.8434907, 0, 0.2039216, 1, 1,
0.3328111, -0.7344638, 1.465371, 0, 0.1960784, 1, 1,
0.3381141, 1.10258, 0.1200898, 0, 0.1882353, 1, 1,
0.3381968, -0.8674264, 3.129263, 0, 0.1843137, 1, 1,
0.3389488, -0.9737294, 2.953437, 0, 0.1764706, 1, 1,
0.3417262, -0.2097455, 1.792725, 0, 0.172549, 1, 1,
0.3457042, 0.1947077, 1.264692, 0, 0.1647059, 1, 1,
0.3486758, -2.677547, 2.868685, 0, 0.1607843, 1, 1,
0.3524866, 0.3199904, 1.057874, 0, 0.1529412, 1, 1,
0.3526997, -0.02491044, 0.4634192, 0, 0.1490196, 1, 1,
0.359534, 1.0871, 0.6988883, 0, 0.1411765, 1, 1,
0.3615149, -1.509949, 2.022566, 0, 0.1372549, 1, 1,
0.3635387, 2.013765, 0.2147033, 0, 0.1294118, 1, 1,
0.3641134, -0.2855263, 2.328091, 0, 0.1254902, 1, 1,
0.3663882, 0.5198472, 2.038038, 0, 0.1176471, 1, 1,
0.3702891, 1.326895, 0.9459171, 0, 0.1137255, 1, 1,
0.3743174, 1.216043, 0.2649729, 0, 0.1058824, 1, 1,
0.3743655, -0.1543652, 0.5655299, 0, 0.09803922, 1, 1,
0.3770242, 0.9787245, 0.4792262, 0, 0.09411765, 1, 1,
0.3771783, 0.5760735, -0.6584438, 0, 0.08627451, 1, 1,
0.3789228, -0.551734, 2.803433, 0, 0.08235294, 1, 1,
0.3808402, 0.4393083, 0.9632024, 0, 0.07450981, 1, 1,
0.3820773, -1.713355, 2.582464, 0, 0.07058824, 1, 1,
0.3827829, -1.844731, 2.703171, 0, 0.0627451, 1, 1,
0.383551, 0.3291716, 0.8063689, 0, 0.05882353, 1, 1,
0.3842403, 0.5709597, 0.83998, 0, 0.05098039, 1, 1,
0.3857635, -0.04067143, 2.708882, 0, 0.04705882, 1, 1,
0.3886772, 0.6433156, -0.2078227, 0, 0.03921569, 1, 1,
0.389628, 0.5699664, 1.089704, 0, 0.03529412, 1, 1,
0.3909472, 1.790591, -0.3512069, 0, 0.02745098, 1, 1,
0.3962766, 0.007152736, -0.8238313, 0, 0.02352941, 1, 1,
0.4012257, -0.5596282, 3.08023, 0, 0.01568628, 1, 1,
0.4022092, -0.06116943, 0.573659, 0, 0.01176471, 1, 1,
0.4051596, -2.237281, 0.6117921, 0, 0.003921569, 1, 1,
0.4087219, -2.234233, 1.882575, 0.003921569, 0, 1, 1,
0.4115514, -2.239186, 2.078728, 0.007843138, 0, 1, 1,
0.415397, -1.71305, 4.912049, 0.01568628, 0, 1, 1,
0.4172001, 1.334347, 0.04128925, 0.01960784, 0, 1, 1,
0.4180736, -1.657251, 0.9561866, 0.02745098, 0, 1, 1,
0.4201086, -0.8207554, 2.030454, 0.03137255, 0, 1, 1,
0.4206443, 0.3589269, 1.653396, 0.03921569, 0, 1, 1,
0.421716, -0.4038814, 4.484256, 0.04313726, 0, 1, 1,
0.4232123, 0.2214995, 2.867531, 0.05098039, 0, 1, 1,
0.4263997, 0.259886, -1.844953, 0.05490196, 0, 1, 1,
0.4276179, 0.6903108, 2.910428, 0.0627451, 0, 1, 1,
0.4325216, -0.4460438, 2.953056, 0.06666667, 0, 1, 1,
0.4379285, -1.446939, 3.061985, 0.07450981, 0, 1, 1,
0.4404125, -0.291243, 1.478976, 0.07843138, 0, 1, 1,
0.4414887, 0.2769606, 1.249536, 0.08627451, 0, 1, 1,
0.4430377, 0.3197079, 1.693395, 0.09019608, 0, 1, 1,
0.4430682, 1.825008, 1.022748, 0.09803922, 0, 1, 1,
0.4481783, -1.393165, 3.816311, 0.1058824, 0, 1, 1,
0.4514755, 0.3747026, 1.5481, 0.1098039, 0, 1, 1,
0.4516239, -0.78826, 1.754868, 0.1176471, 0, 1, 1,
0.4519585, 0.2147023, -0.1383615, 0.1215686, 0, 1, 1,
0.4532437, -1.586468, 3.933942, 0.1294118, 0, 1, 1,
0.4591542, -0.7807976, 3.184417, 0.1333333, 0, 1, 1,
0.4601708, -0.2660139, 1.972478, 0.1411765, 0, 1, 1,
0.4640241, 0.699598, 0.07538841, 0.145098, 0, 1, 1,
0.4644012, -0.3710037, 1.540341, 0.1529412, 0, 1, 1,
0.4678155, 1.045129, 0.1591084, 0.1568628, 0, 1, 1,
0.4678688, 1.644771, 0.9175903, 0.1647059, 0, 1, 1,
0.4707392, -0.2429833, 1.749923, 0.1686275, 0, 1, 1,
0.4722277, -1.2008, 2.321474, 0.1764706, 0, 1, 1,
0.472891, 0.1528844, -0.5692653, 0.1803922, 0, 1, 1,
0.4795996, -0.4089558, 2.585981, 0.1882353, 0, 1, 1,
0.4822983, -0.4765898, 1.103456, 0.1921569, 0, 1, 1,
0.4823015, 1.423336, 0.3395013, 0.2, 0, 1, 1,
0.4829021, -0.4342906, 2.234468, 0.2078431, 0, 1, 1,
0.4833885, 0.5913861, 0.5287336, 0.2117647, 0, 1, 1,
0.4872628, 0.7156452, -0.8915226, 0.2196078, 0, 1, 1,
0.4900134, -0.6408407, 2.991224, 0.2235294, 0, 1, 1,
0.4932992, -0.4700602, 3.051427, 0.2313726, 0, 1, 1,
0.4983588, -0.5040901, 3.152051, 0.2352941, 0, 1, 1,
0.4997149, -0.2830224, 0.8199219, 0.2431373, 0, 1, 1,
0.5002337, -1.759682, 3.73998, 0.2470588, 0, 1, 1,
0.5005642, -2.457325, 2.9357, 0.254902, 0, 1, 1,
0.5020876, -0.04205618, 1.386634, 0.2588235, 0, 1, 1,
0.5044152, -1.061958, 3.784708, 0.2666667, 0, 1, 1,
0.5047722, 0.3613994, 0.9221855, 0.2705882, 0, 1, 1,
0.5049041, 1.171551, 2.162119, 0.2784314, 0, 1, 1,
0.5078795, -1.204952, 3.443077, 0.282353, 0, 1, 1,
0.5111576, -1.706623, 0.9922121, 0.2901961, 0, 1, 1,
0.5136998, 1.423357, 1.071637, 0.2941177, 0, 1, 1,
0.5138162, 0.5989245, 0.3471447, 0.3019608, 0, 1, 1,
0.5164964, -1.911533, 3.174602, 0.3098039, 0, 1, 1,
0.5166456, 0.1038464, 2.317116, 0.3137255, 0, 1, 1,
0.5193318, 0.6490948, -0.1193561, 0.3215686, 0, 1, 1,
0.5230664, -0.6479723, 1.513996, 0.3254902, 0, 1, 1,
0.5343114, 0.5400837, 0.6833888, 0.3333333, 0, 1, 1,
0.5363857, -2.588405, 2.149413, 0.3372549, 0, 1, 1,
0.5465372, -0.1202676, 2.947124, 0.345098, 0, 1, 1,
0.5503849, 1.017157, -0.04271149, 0.3490196, 0, 1, 1,
0.5507753, -0.2219057, 3.360669, 0.3568628, 0, 1, 1,
0.5529138, 0.4668926, 0.7805493, 0.3607843, 0, 1, 1,
0.5549888, -0.8223539, 2.887416, 0.3686275, 0, 1, 1,
0.5555765, -0.4876085, 3.106495, 0.372549, 0, 1, 1,
0.5616913, 1.7809, 0.9171535, 0.3803922, 0, 1, 1,
0.5623339, -0.2847007, 3.67408, 0.3843137, 0, 1, 1,
0.5667938, 0.5883322, 1.482088, 0.3921569, 0, 1, 1,
0.5736796, -0.6140392, 2.632849, 0.3960784, 0, 1, 1,
0.574054, -0.2121671, 1.481622, 0.4039216, 0, 1, 1,
0.5748262, -0.8040449, 2.560636, 0.4117647, 0, 1, 1,
0.5759076, 0.7279497, 0.8262462, 0.4156863, 0, 1, 1,
0.5764496, -0.3871694, 1.241238, 0.4235294, 0, 1, 1,
0.5792974, 0.3195703, 1.330083, 0.427451, 0, 1, 1,
0.581296, -0.04430027, 1.218968, 0.4352941, 0, 1, 1,
0.5840539, 0.002358001, 2.6514, 0.4392157, 0, 1, 1,
0.5919729, 0.2067634, 1.633545, 0.4470588, 0, 1, 1,
0.5920157, -0.2595288, 2.110633, 0.4509804, 0, 1, 1,
0.5930632, -0.9100721, 0.7033417, 0.4588235, 0, 1, 1,
0.5951176, -0.825905, 4.535161, 0.4627451, 0, 1, 1,
0.5958018, 0.2413005, 1.322542, 0.4705882, 0, 1, 1,
0.5959973, 2.030894, 1.466612, 0.4745098, 0, 1, 1,
0.5985991, -0.1942662, 2.272125, 0.4823529, 0, 1, 1,
0.6022037, 0.005016381, 0.8903397, 0.4862745, 0, 1, 1,
0.6046183, 1.57704, -0.7323078, 0.4941176, 0, 1, 1,
0.6065159, 0.480017, 1.612359, 0.5019608, 0, 1, 1,
0.6076416, -0.9278605, 2.579614, 0.5058824, 0, 1, 1,
0.6102954, -0.6205754, 1.941405, 0.5137255, 0, 1, 1,
0.6133885, 1.012486, 0.1553064, 0.5176471, 0, 1, 1,
0.6151323, -0.5037984, 3.282147, 0.5254902, 0, 1, 1,
0.6169583, 1.043882, -1.330825, 0.5294118, 0, 1, 1,
0.6180234, -0.3831657, 3.293235, 0.5372549, 0, 1, 1,
0.6292241, -0.2889654, 0.8055819, 0.5411765, 0, 1, 1,
0.6340533, 1.507503, 0.4994959, 0.5490196, 0, 1, 1,
0.6379845, 0.1397984, 0.8942412, 0.5529412, 0, 1, 1,
0.64211, -0.5380514, 2.460863, 0.5607843, 0, 1, 1,
0.6454092, -0.8032492, 2.855532, 0.5647059, 0, 1, 1,
0.6559114, 0.8859859, 0.7510124, 0.572549, 0, 1, 1,
0.6574441, 0.860037, 0.9599919, 0.5764706, 0, 1, 1,
0.6597458, -0.08135857, 2.646386, 0.5843138, 0, 1, 1,
0.6619556, -0.4271215, 1.725428, 0.5882353, 0, 1, 1,
0.6622509, -1.682238, 2.764694, 0.5960785, 0, 1, 1,
0.6640826, -0.5441704, 0.3949549, 0.6039216, 0, 1, 1,
0.6645404, 0.6915861, -0.9050884, 0.6078432, 0, 1, 1,
0.6668985, -0.1279372, 1.938354, 0.6156863, 0, 1, 1,
0.6694365, 0.171052, 0.3575161, 0.6196079, 0, 1, 1,
0.6731979, -2.356409, 2.393562, 0.627451, 0, 1, 1,
0.674937, 0.7921047, 2.440325, 0.6313726, 0, 1, 1,
0.6757609, -2.490059, 4.84911, 0.6392157, 0, 1, 1,
0.676488, 0.01507365, -0.7295309, 0.6431373, 0, 1, 1,
0.6811771, 0.9549006, -0.4907385, 0.6509804, 0, 1, 1,
0.6859497, -0.4870251, 2.529805, 0.654902, 0, 1, 1,
0.6905047, -1.115196, 2.982494, 0.6627451, 0, 1, 1,
0.6991401, 0.9106218, 0.006440937, 0.6666667, 0, 1, 1,
0.7007942, 0.4938515, 0.184285, 0.6745098, 0, 1, 1,
0.7038806, -2.192441, 3.576496, 0.6784314, 0, 1, 1,
0.707388, 1.464075, -1.27304, 0.6862745, 0, 1, 1,
0.7098342, -1.570249, 2.324872, 0.6901961, 0, 1, 1,
0.7169815, 1.23473, -1.328048, 0.6980392, 0, 1, 1,
0.719835, 0.2501092, 0.9074199, 0.7058824, 0, 1, 1,
0.7239599, 0.001069249, 1.571392, 0.7098039, 0, 1, 1,
0.725433, -1.195262, 2.979701, 0.7176471, 0, 1, 1,
0.7265821, -1.158098, 2.333127, 0.7215686, 0, 1, 1,
0.7343768, 0.2172947, 1.818968, 0.7294118, 0, 1, 1,
0.7441474, -0.3675871, 1.999966, 0.7333333, 0, 1, 1,
0.7445232, -0.22516, 2.278902, 0.7411765, 0, 1, 1,
0.755125, -0.03495401, 1.357846, 0.7450981, 0, 1, 1,
0.7811088, 0.01074269, 1.093982, 0.7529412, 0, 1, 1,
0.7827263, -1.151636, 3.334754, 0.7568628, 0, 1, 1,
0.788626, -1.918639, 3.34771, 0.7647059, 0, 1, 1,
0.7972233, -0.9039624, 3.671813, 0.7686275, 0, 1, 1,
0.8031166, 0.1902515, 0.02002104, 0.7764706, 0, 1, 1,
0.8082645, 1.790673, 0.5369478, 0.7803922, 0, 1, 1,
0.8165054, -0.7200613, 1.873069, 0.7882353, 0, 1, 1,
0.8187426, -1.606433, 2.623922, 0.7921569, 0, 1, 1,
0.8227533, -1.073244, 1.572335, 0.8, 0, 1, 1,
0.8232803, -2.274459, 2.63207, 0.8078431, 0, 1, 1,
0.8282447, -0.4286555, 2.153576, 0.8117647, 0, 1, 1,
0.8298311, 0.4183084, 0.1575139, 0.8196079, 0, 1, 1,
0.8309037, -1.173107, 2.060778, 0.8235294, 0, 1, 1,
0.8343862, -2.957883, 3.11504, 0.8313726, 0, 1, 1,
0.8368173, 0.3119628, -0.4966518, 0.8352941, 0, 1, 1,
0.8378342, 0.4418392, 0.8907063, 0.8431373, 0, 1, 1,
0.8381836, -1.557745, 2.535812, 0.8470588, 0, 1, 1,
0.8404812, -0.371443, 1.672004, 0.854902, 0, 1, 1,
0.8414346, 0.9821634, 2.498662, 0.8588235, 0, 1, 1,
0.8455084, -0.2762794, 1.29755, 0.8666667, 0, 1, 1,
0.8486261, -0.08376286, 1.680066, 0.8705882, 0, 1, 1,
0.85049, 0.3504787, 0.6243331, 0.8784314, 0, 1, 1,
0.8548384, 0.7554469, 0.2173613, 0.8823529, 0, 1, 1,
0.8567645, -1.033144, 2.77031, 0.8901961, 0, 1, 1,
0.8576579, -0.7866916, 2.194651, 0.8941177, 0, 1, 1,
0.8594782, 1.003354, 1.466428, 0.9019608, 0, 1, 1,
0.8607699, -0.06680947, 3.174967, 0.9098039, 0, 1, 1,
0.8798521, 0.07714232, 2.208633, 0.9137255, 0, 1, 1,
0.8810581, 0.6671132, 2.027759, 0.9215686, 0, 1, 1,
0.8825771, -0.1822182, 2.084503, 0.9254902, 0, 1, 1,
0.884702, 0.4955529, 1.527223, 0.9333333, 0, 1, 1,
0.8851228, 0.4790508, 1.350697, 0.9372549, 0, 1, 1,
0.8853769, -0.5737015, 3.507245, 0.945098, 0, 1, 1,
0.8909612, -0.2271101, 1.361611, 0.9490196, 0, 1, 1,
0.9005514, -1.348074, 0.7229313, 0.9568627, 0, 1, 1,
0.9020842, 0.9041072, 0.834274, 0.9607843, 0, 1, 1,
0.9082484, 0.6068456, -0.4369913, 0.9686275, 0, 1, 1,
0.9166005, -0.6978341, 1.267612, 0.972549, 0, 1, 1,
0.9234914, -0.1855527, 2.563082, 0.9803922, 0, 1, 1,
0.9242293, -0.931191, 2.553211, 0.9843137, 0, 1, 1,
0.9279456, 0.2699246, 0.4354112, 0.9921569, 0, 1, 1,
0.9358302, 1.354353, 0.4053147, 0.9960784, 0, 1, 1,
0.9364344, -2.217539, 2.786363, 1, 0, 0.9960784, 1,
0.9394563, -1.535875, 1.493961, 1, 0, 0.9882353, 1,
0.9417428, -1.922219, 3.254509, 1, 0, 0.9843137, 1,
0.9430725, -0.06234981, 0.4082884, 1, 0, 0.9764706, 1,
0.9464595, -0.326455, 2.367523, 1, 0, 0.972549, 1,
0.9524722, -0.174685, 4.04661, 1, 0, 0.9647059, 1,
0.9575959, 1.407316, 0.4597816, 1, 0, 0.9607843, 1,
0.973636, -0.7995731, 1.825178, 1, 0, 0.9529412, 1,
0.9753269, -0.9916009, 1.344457, 1, 0, 0.9490196, 1,
0.9916224, -0.7778149, 2.564901, 1, 0, 0.9411765, 1,
0.9949184, 0.8953174, -0.6184918, 1, 0, 0.9372549, 1,
0.9963166, 0.7224258, -0.854818, 1, 0, 0.9294118, 1,
1.000976, -0.3636646, 1.459687, 1, 0, 0.9254902, 1,
1.001804, 0.2022789, 1.71881, 1, 0, 0.9176471, 1,
1.009807, -0.7605768, 0.8070853, 1, 0, 0.9137255, 1,
1.012101, -0.3618412, 2.153417, 1, 0, 0.9058824, 1,
1.017739, 1.851982, 0.5458892, 1, 0, 0.9019608, 1,
1.018594, -3.85204, 2.22117, 1, 0, 0.8941177, 1,
1.026683, 1.174044, -0.3908814, 1, 0, 0.8862745, 1,
1.028321, 0.2558147, 0.6490372, 1, 0, 0.8823529, 1,
1.034276, 0.4360682, 2.772611, 1, 0, 0.8745098, 1,
1.038616, -0.284677, 0.02474401, 1, 0, 0.8705882, 1,
1.040547, 0.5490692, 1.785619, 1, 0, 0.8627451, 1,
1.04637, 0.8437371, 0.9260812, 1, 0, 0.8588235, 1,
1.054928, -0.6291911, 3.556665, 1, 0, 0.8509804, 1,
1.063367, 0.6076583, 2.400173, 1, 0, 0.8470588, 1,
1.06979, -0.07004433, 4.163591, 1, 0, 0.8392157, 1,
1.070058, 1.162743, 0.534355, 1, 0, 0.8352941, 1,
1.076651, -1.922227, 3.390484, 1, 0, 0.827451, 1,
1.079241, -0.2161893, 1.607805, 1, 0, 0.8235294, 1,
1.082395, 0.436465, 0.9216843, 1, 0, 0.8156863, 1,
1.090349, -0.4350305, 2.979066, 1, 0, 0.8117647, 1,
1.103118, -0.1049996, 1.049962, 1, 0, 0.8039216, 1,
1.125281, 0.9254059, 1.340527, 1, 0, 0.7960784, 1,
1.134571, 0.6702521, -0.8393997, 1, 0, 0.7921569, 1,
1.138569, -0.0843756, 1.382561, 1, 0, 0.7843137, 1,
1.13858, 1.882525, -0.3241962, 1, 0, 0.7803922, 1,
1.142706, -0.2160764, 0.3210452, 1, 0, 0.772549, 1,
1.142825, 1.067931, 2.190682, 1, 0, 0.7686275, 1,
1.147377, 0.7284238, 1.316421, 1, 0, 0.7607843, 1,
1.150888, 1.215344, 0.1903132, 1, 0, 0.7568628, 1,
1.163417, -2.116474, 2.841944, 1, 0, 0.7490196, 1,
1.164885, 0.4247375, 0.55058, 1, 0, 0.7450981, 1,
1.166661, 2.246584, -0.7646314, 1, 0, 0.7372549, 1,
1.166727, -0.0554238, 3.238601, 1, 0, 0.7333333, 1,
1.174769, -0.7489626, 2.153773, 1, 0, 0.7254902, 1,
1.18043, 0.6421567, 1.290007, 1, 0, 0.7215686, 1,
1.182298, 0.3060555, 1.121507, 1, 0, 0.7137255, 1,
1.184606, -0.02024076, -0.2262008, 1, 0, 0.7098039, 1,
1.187055, 1.513838, -0.2750395, 1, 0, 0.7019608, 1,
1.199666, 2.99928, -0.9723128, 1, 0, 0.6941177, 1,
1.201741, 1.751544, 1.3309, 1, 0, 0.6901961, 1,
1.209193, -0.7861975, 0.7333214, 1, 0, 0.682353, 1,
1.218112, 0.3739274, 3.343591, 1, 0, 0.6784314, 1,
1.237044, -1.074733, 2.40959, 1, 0, 0.6705883, 1,
1.239262, -0.8140534, 0.8424675, 1, 0, 0.6666667, 1,
1.244382, 0.7612456, 2.139255, 1, 0, 0.6588235, 1,
1.245232, 1.921488, 1.281896, 1, 0, 0.654902, 1,
1.258059, -0.3322742, 2.384929, 1, 0, 0.6470588, 1,
1.263489, -2.577591, 2.357964, 1, 0, 0.6431373, 1,
1.269089, -1.437507, 1.269085, 1, 0, 0.6352941, 1,
1.27381, 0.0384208, -0.01280395, 1, 0, 0.6313726, 1,
1.275351, 0.9110126, -0.4202842, 1, 0, 0.6235294, 1,
1.281015, -2.422212, 2.173684, 1, 0, 0.6196079, 1,
1.287318, 1.161302, 1.009797, 1, 0, 0.6117647, 1,
1.291474, 1.020725, 1.181173, 1, 0, 0.6078432, 1,
1.297665, -0.2769351, 2.254415, 1, 0, 0.6, 1,
1.298982, -0.1626995, 2.590967, 1, 0, 0.5921569, 1,
1.299018, 0.1717583, 0.7698432, 1, 0, 0.5882353, 1,
1.330438, 0.4710048, 1.82155, 1, 0, 0.5803922, 1,
1.333006, 0.9583536, -0.4508264, 1, 0, 0.5764706, 1,
1.333013, 0.3623598, 2.160973, 1, 0, 0.5686275, 1,
1.334244, 0.1066921, 0.5848054, 1, 0, 0.5647059, 1,
1.339515, 1.556773, 0.8532364, 1, 0, 0.5568628, 1,
1.34257, 0.3530704, 1.315016, 1, 0, 0.5529412, 1,
1.347058, -0.1658823, 0.8361366, 1, 0, 0.5450981, 1,
1.357028, 0.005963591, 1.151279, 1, 0, 0.5411765, 1,
1.357366, 0.6453636, 1.549369, 1, 0, 0.5333334, 1,
1.363444, -0.4731012, 1.383091, 1, 0, 0.5294118, 1,
1.364029, -0.2807099, 3.11113, 1, 0, 0.5215687, 1,
1.36795, 0.6311918, 2.13307, 1, 0, 0.5176471, 1,
1.368578, 1.023989, 1.846648, 1, 0, 0.509804, 1,
1.376765, -1.944368, 2.391361, 1, 0, 0.5058824, 1,
1.396844, -1.14199, 2.521712, 1, 0, 0.4980392, 1,
1.399723, -1.166338, 2.000596, 1, 0, 0.4901961, 1,
1.402707, -0.617168, 1.363941, 1, 0, 0.4862745, 1,
1.403466, 0.8048146, 1.318241, 1, 0, 0.4784314, 1,
1.408209, 1.538121, -0.6259839, 1, 0, 0.4745098, 1,
1.411694, 0.3871982, 2.546653, 1, 0, 0.4666667, 1,
1.412902, -0.7982163, 3.192999, 1, 0, 0.4627451, 1,
1.413224, 0.9593779, 0.4923899, 1, 0, 0.454902, 1,
1.417154, -0.2446592, 1.441293, 1, 0, 0.4509804, 1,
1.425501, -1.578331, 1.152061, 1, 0, 0.4431373, 1,
1.426532, -0.3989875, 1.303503, 1, 0, 0.4392157, 1,
1.436563, 0.4730758, -1.932919, 1, 0, 0.4313726, 1,
1.441236, 0.3427937, 1.75997, 1, 0, 0.427451, 1,
1.442519, -0.3357305, 2.200322, 1, 0, 0.4196078, 1,
1.442866, 1.304469, 0.4102308, 1, 0, 0.4156863, 1,
1.450136, 0.3418986, 1.22244, 1, 0, 0.4078431, 1,
1.456499, 0.5711293, 1.243585, 1, 0, 0.4039216, 1,
1.459318, -1.62373, 2.247746, 1, 0, 0.3960784, 1,
1.493455, 0.03421373, 1.813752, 1, 0, 0.3882353, 1,
1.505327, 0.003854805, 1.517852, 1, 0, 0.3843137, 1,
1.507112, -0.5545352, 1.932939, 1, 0, 0.3764706, 1,
1.512169, -1.42045, 1.596324, 1, 0, 0.372549, 1,
1.521502, 0.974341, 1.060524, 1, 0, 0.3647059, 1,
1.527136, -1.505457, 2.519147, 1, 0, 0.3607843, 1,
1.541106, -1.055047, 2.186661, 1, 0, 0.3529412, 1,
1.54244, 0.7183714, 0.5789135, 1, 0, 0.3490196, 1,
1.545836, 1.193314, 1.20736, 1, 0, 0.3411765, 1,
1.546409, -1.055495, 2.577995, 1, 0, 0.3372549, 1,
1.573448, -0.3341689, 2.731327, 1, 0, 0.3294118, 1,
1.5778, -1.029129, 2.399535, 1, 0, 0.3254902, 1,
1.580074, 1.39073, 1.489182, 1, 0, 0.3176471, 1,
1.605188, 1.323285, 1.281476, 1, 0, 0.3137255, 1,
1.620845, -0.5397348, 0.9996217, 1, 0, 0.3058824, 1,
1.635709, -0.6804098, 1.079201, 1, 0, 0.2980392, 1,
1.642846, 1.557427, 1.431302, 1, 0, 0.2941177, 1,
1.644768, 0.4705122, 1.552231, 1, 0, 0.2862745, 1,
1.646555, -0.00312254, 0.2060519, 1, 0, 0.282353, 1,
1.649607, 0.233779, 2.28111, 1, 0, 0.2745098, 1,
1.664799, -0.06706896, 1.884605, 1, 0, 0.2705882, 1,
1.709293, -0.9471691, 3.037078, 1, 0, 0.2627451, 1,
1.733672, -0.7080274, 2.843202, 1, 0, 0.2588235, 1,
1.738143, 0.5913536, -0.5143129, 1, 0, 0.2509804, 1,
1.750533, 0.306751, 2.269807, 1, 0, 0.2470588, 1,
1.77178, 0.4233108, -1.04712, 1, 0, 0.2392157, 1,
1.813065, -1.050553, 3.072496, 1, 0, 0.2352941, 1,
1.845358, -0.03578753, 1.361631, 1, 0, 0.227451, 1,
1.856256, 0.3450629, 2.187057, 1, 0, 0.2235294, 1,
1.880247, 0.9468256, 1.138267, 1, 0, 0.2156863, 1,
1.889356, -1.330083, 2.090156, 1, 0, 0.2117647, 1,
1.902949, -0.02780282, 1.40258, 1, 0, 0.2039216, 1,
1.918839, 0.1365307, 2.543295, 1, 0, 0.1960784, 1,
1.96702, -0.7448664, 2.659268, 1, 0, 0.1921569, 1,
1.978579, 0.1678847, 1.452697, 1, 0, 0.1843137, 1,
1.981371, 0.8044288, 0.1638062, 1, 0, 0.1803922, 1,
2.001266, 0.4130597, 0.5770856, 1, 0, 0.172549, 1,
2.029096, -2.040305, 1.596579, 1, 0, 0.1686275, 1,
2.045566, 1.5889, -1.248, 1, 0, 0.1607843, 1,
2.072104, 0.5485021, 1.215045, 1, 0, 0.1568628, 1,
2.09242, -0.165893, 1.200202, 1, 0, 0.1490196, 1,
2.116076, -0.662295, 0.2623642, 1, 0, 0.145098, 1,
2.134776, -1.183744, 0.7675154, 1, 0, 0.1372549, 1,
2.141078, 0.9668179, 0.1364933, 1, 0, 0.1333333, 1,
2.145094, 0.02065558, 0.463045, 1, 0, 0.1254902, 1,
2.169254, 1.831969, 0.4192005, 1, 0, 0.1215686, 1,
2.207488, -0.07348827, 1.459511, 1, 0, 0.1137255, 1,
2.256375, -1.114567, 1.248259, 1, 0, 0.1098039, 1,
2.275489, -1.001706, 2.053366, 1, 0, 0.1019608, 1,
2.327313, 0.5518674, -1.121791, 1, 0, 0.09411765, 1,
2.33655, -0.966212, 1.205248, 1, 0, 0.09019608, 1,
2.346476, 1.98651, 1.137536, 1, 0, 0.08235294, 1,
2.36456, -1.28425, 4.335828, 1, 0, 0.07843138, 1,
2.40734, 1.553489, -0.07466225, 1, 0, 0.07058824, 1,
2.453944, 0.1593193, 1.137784, 1, 0, 0.06666667, 1,
2.456807, -0.10478, -0.6120206, 1, 0, 0.05882353, 1,
2.508415, -0.4988858, 2.044089, 1, 0, 0.05490196, 1,
2.56422, 0.04248756, 1.299533, 1, 0, 0.04705882, 1,
2.675626, 0.6704301, 0.1531003, 1, 0, 0.04313726, 1,
2.720783, -2.09115, 2.759277, 1, 0, 0.03529412, 1,
2.767614, 1.48029, 1.126387, 1, 0, 0.03137255, 1,
2.769282, 0.3567039, 0.7069778, 1, 0, 0.02352941, 1,
2.933309, 0.264564, 0.2364297, 1, 0, 0.01960784, 1,
2.989129, -1.754999, 1.159882, 1, 0, 0.01176471, 1,
3.500119, -0.5911693, 0.1058716, 1, 0, 0.007843138, 1
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
0.09551394, -5.044185, -7.46665, 0, -0.5, 0.5, 0.5,
0.09551394, -5.044185, -7.46665, 1, -0.5, 0.5, 0.5,
0.09551394, -5.044185, -7.46665, 1, 1.5, 0.5, 0.5,
0.09551394, -5.044185, -7.46665, 0, 1.5, 0.5, 0.5
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
-4.463253, -0.3353871, -7.46665, 0, -0.5, 0.5, 0.5,
-4.463253, -0.3353871, -7.46665, 1, -0.5, 0.5, 0.5,
-4.463253, -0.3353871, -7.46665, 1, 1.5, 0.5, 0.5,
-4.463253, -0.3353871, -7.46665, 0, 1.5, 0.5, 0.5
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
-4.463253, -5.044185, 0.01389003, 0, -0.5, 0.5, 0.5,
-4.463253, -5.044185, 0.01389003, 1, -0.5, 0.5, 0.5,
-4.463253, -5.044185, 0.01389003, 1, 1.5, 0.5, 0.5,
-4.463253, -5.044185, 0.01389003, 0, 1.5, 0.5, 0.5
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
-3, -3.95754, -5.740371,
3, -3.95754, -5.740371,
-3, -3.95754, -5.740371,
-3, -4.138647, -6.028084,
-2, -3.95754, -5.740371,
-2, -4.138647, -6.028084,
-1, -3.95754, -5.740371,
-1, -4.138647, -6.028084,
0, -3.95754, -5.740371,
0, -4.138647, -6.028084,
1, -3.95754, -5.740371,
1, -4.138647, -6.028084,
2, -3.95754, -5.740371,
2, -4.138647, -6.028084,
3, -3.95754, -5.740371,
3, -4.138647, -6.028084
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
-3, -4.500863, -6.60351, 0, -0.5, 0.5, 0.5,
-3, -4.500863, -6.60351, 1, -0.5, 0.5, 0.5,
-3, -4.500863, -6.60351, 1, 1.5, 0.5, 0.5,
-3, -4.500863, -6.60351, 0, 1.5, 0.5, 0.5,
-2, -4.500863, -6.60351, 0, -0.5, 0.5, 0.5,
-2, -4.500863, -6.60351, 1, -0.5, 0.5, 0.5,
-2, -4.500863, -6.60351, 1, 1.5, 0.5, 0.5,
-2, -4.500863, -6.60351, 0, 1.5, 0.5, 0.5,
-1, -4.500863, -6.60351, 0, -0.5, 0.5, 0.5,
-1, -4.500863, -6.60351, 1, -0.5, 0.5, 0.5,
-1, -4.500863, -6.60351, 1, 1.5, 0.5, 0.5,
-1, -4.500863, -6.60351, 0, 1.5, 0.5, 0.5,
0, -4.500863, -6.60351, 0, -0.5, 0.5, 0.5,
0, -4.500863, -6.60351, 1, -0.5, 0.5, 0.5,
0, -4.500863, -6.60351, 1, 1.5, 0.5, 0.5,
0, -4.500863, -6.60351, 0, 1.5, 0.5, 0.5,
1, -4.500863, -6.60351, 0, -0.5, 0.5, 0.5,
1, -4.500863, -6.60351, 1, -0.5, 0.5, 0.5,
1, -4.500863, -6.60351, 1, 1.5, 0.5, 0.5,
1, -4.500863, -6.60351, 0, 1.5, 0.5, 0.5,
2, -4.500863, -6.60351, 0, -0.5, 0.5, 0.5,
2, -4.500863, -6.60351, 1, -0.5, 0.5, 0.5,
2, -4.500863, -6.60351, 1, 1.5, 0.5, 0.5,
2, -4.500863, -6.60351, 0, 1.5, 0.5, 0.5,
3, -4.500863, -6.60351, 0, -0.5, 0.5, 0.5,
3, -4.500863, -6.60351, 1, -0.5, 0.5, 0.5,
3, -4.500863, -6.60351, 1, 1.5, 0.5, 0.5,
3, -4.500863, -6.60351, 0, 1.5, 0.5, 0.5
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
-3.41123, -2, -5.740371,
-3.41123, 2, -5.740371,
-3.41123, -2, -5.740371,
-3.586567, -2, -6.028084,
-3.41123, 0, -5.740371,
-3.586567, 0, -6.028084,
-3.41123, 2, -5.740371,
-3.586567, 2, -6.028084
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
-3.937241, -2, -6.60351, 0, -0.5, 0.5, 0.5,
-3.937241, -2, -6.60351, 1, -0.5, 0.5, 0.5,
-3.937241, -2, -6.60351, 1, 1.5, 0.5, 0.5,
-3.937241, -2, -6.60351, 0, 1.5, 0.5, 0.5,
-3.937241, 0, -6.60351, 0, -0.5, 0.5, 0.5,
-3.937241, 0, -6.60351, 1, -0.5, 0.5, 0.5,
-3.937241, 0, -6.60351, 1, 1.5, 0.5, 0.5,
-3.937241, 0, -6.60351, 0, 1.5, 0.5, 0.5,
-3.937241, 2, -6.60351, 0, -0.5, 0.5, 0.5,
-3.937241, 2, -6.60351, 1, -0.5, 0.5, 0.5,
-3.937241, 2, -6.60351, 1, 1.5, 0.5, 0.5,
-3.937241, 2, -6.60351, 0, 1.5, 0.5, 0.5
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
-3.41123, -3.95754, -4,
-3.41123, -3.95754, 4,
-3.41123, -3.95754, -4,
-3.586567, -4.138647, -4,
-3.41123, -3.95754, -2,
-3.586567, -4.138647, -2,
-3.41123, -3.95754, 0,
-3.586567, -4.138647, 0,
-3.41123, -3.95754, 2,
-3.586567, -4.138647, 2,
-3.41123, -3.95754, 4,
-3.586567, -4.138647, 4
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
-3.937241, -4.500863, -4, 0, -0.5, 0.5, 0.5,
-3.937241, -4.500863, -4, 1, -0.5, 0.5, 0.5,
-3.937241, -4.500863, -4, 1, 1.5, 0.5, 0.5,
-3.937241, -4.500863, -4, 0, 1.5, 0.5, 0.5,
-3.937241, -4.500863, -2, 0, -0.5, 0.5, 0.5,
-3.937241, -4.500863, -2, 1, -0.5, 0.5, 0.5,
-3.937241, -4.500863, -2, 1, 1.5, 0.5, 0.5,
-3.937241, -4.500863, -2, 0, 1.5, 0.5, 0.5,
-3.937241, -4.500863, 0, 0, -0.5, 0.5, 0.5,
-3.937241, -4.500863, 0, 1, -0.5, 0.5, 0.5,
-3.937241, -4.500863, 0, 1, 1.5, 0.5, 0.5,
-3.937241, -4.500863, 0, 0, 1.5, 0.5, 0.5,
-3.937241, -4.500863, 2, 0, -0.5, 0.5, 0.5,
-3.937241, -4.500863, 2, 1, -0.5, 0.5, 0.5,
-3.937241, -4.500863, 2, 1, 1.5, 0.5, 0.5,
-3.937241, -4.500863, 2, 0, 1.5, 0.5, 0.5,
-3.937241, -4.500863, 4, 0, -0.5, 0.5, 0.5,
-3.937241, -4.500863, 4, 1, -0.5, 0.5, 0.5,
-3.937241, -4.500863, 4, 1, 1.5, 0.5, 0.5,
-3.937241, -4.500863, 4, 0, 1.5, 0.5, 0.5
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
-3.41123, -3.95754, -5.740371,
-3.41123, 3.286765, -5.740371,
-3.41123, -3.95754, 5.768151,
-3.41123, 3.286765, 5.768151,
-3.41123, -3.95754, -5.740371,
-3.41123, -3.95754, 5.768151,
-3.41123, 3.286765, -5.740371,
-3.41123, 3.286765, 5.768151,
-3.41123, -3.95754, -5.740371,
3.602258, -3.95754, -5.740371,
-3.41123, -3.95754, 5.768151,
3.602258, -3.95754, 5.768151,
-3.41123, 3.286765, -5.740371,
3.602258, 3.286765, -5.740371,
-3.41123, 3.286765, 5.768151,
3.602258, 3.286765, 5.768151,
3.602258, -3.95754, -5.740371,
3.602258, 3.286765, -5.740371,
3.602258, -3.95754, 5.768151,
3.602258, 3.286765, 5.768151,
3.602258, -3.95754, -5.740371,
3.602258, -3.95754, 5.768151,
3.602258, 3.286765, -5.740371,
3.602258, 3.286765, 5.768151
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
var radius = 8.17034;
var distance = 36.35077;
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
mvMatrix.translate( -0.09551394, 0.3353871, -0.01389003 );
mvMatrix.scale( 1.259563, 1.219431, 0.7675991 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.35077);
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
ethychlozate<-read.table("ethychlozate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethychlozate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethychlozate' not found
```

```r
y<-ethychlozate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethychlozate' not found
```

```r
z<-ethychlozate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethychlozate' not found
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
-3.309092, -1.537432, -3.183462, 0, 0, 1, 1, 1,
-3.212734, 0.7789957, 0.2414791, 1, 0, 0, 1, 1,
-2.79291, 0.4064597, -1.079625, 1, 0, 0, 1, 1,
-2.57743, -0.5539593, -1.854879, 1, 0, 0, 1, 1,
-2.47272, 0.7560346, -1.39729, 1, 0, 0, 1, 1,
-2.412048, 2.490278, -2.633054, 1, 0, 0, 1, 1,
-2.380545, 2.25566, -1.437526, 0, 0, 0, 1, 1,
-2.350698, -2.012504, -3.229317, 0, 0, 0, 1, 1,
-2.306651, -0.9409524, -1.865501, 0, 0, 0, 1, 1,
-2.275959, -1.196142, -3.991094, 0, 0, 0, 1, 1,
-2.268569, 0.9579327, -2.746492, 0, 0, 0, 1, 1,
-2.226277, 1.36697, -2.19945, 0, 0, 0, 1, 1,
-2.223951, -0.9343866, -1.779701, 0, 0, 0, 1, 1,
-2.186646, 1.579918, -1.751248, 1, 1, 1, 1, 1,
-2.159372, -0.460318, -2.222764, 1, 1, 1, 1, 1,
-2.158085, -1.084321, -1.55799, 1, 1, 1, 1, 1,
-2.103207, 0.5021313, -2.02367, 1, 1, 1, 1, 1,
-2.077512, 0.9785962, -0.9760237, 1, 1, 1, 1, 1,
-2.069589, 1.120702, -2.940005, 1, 1, 1, 1, 1,
-2.065851, 0.9071351, -1.555196, 1, 1, 1, 1, 1,
-2.054782, 1.559911, 0.09359036, 1, 1, 1, 1, 1,
-1.970534, -1.423762, -1.408374, 1, 1, 1, 1, 1,
-1.966789, 0.05719757, -0.8374295, 1, 1, 1, 1, 1,
-1.949948, 1.158951, -0.05371364, 1, 1, 1, 1, 1,
-1.911624, 1.418594, -1.855526, 1, 1, 1, 1, 1,
-1.905853, 0.4835342, -1.507311, 1, 1, 1, 1, 1,
-1.891776, 0.1990751, -2.249804, 1, 1, 1, 1, 1,
-1.882089, -2.063833, -0.7564454, 1, 1, 1, 1, 1,
-1.861815, 0.7115133, -0.953798, 0, 0, 1, 1, 1,
-1.840993, 0.03193286, -2.132589, 1, 0, 0, 1, 1,
-1.840495, -0.5617508, -1.46579, 1, 0, 0, 1, 1,
-1.813804, -1.400321, -3.32327, 1, 0, 0, 1, 1,
-1.80455, 0.5569471, -1.596214, 1, 0, 0, 1, 1,
-1.781922, -0.8907695, -2.15045, 1, 0, 0, 1, 1,
-1.771434, -1.325282, -1.735007, 0, 0, 0, 1, 1,
-1.741589, -1.142339, -0.7188253, 0, 0, 0, 1, 1,
-1.739215, 0.4452657, -2.132222, 0, 0, 0, 1, 1,
-1.738022, 0.2532065, -1.354694, 0, 0, 0, 1, 1,
-1.732588, 1.372259, 1.558911, 0, 0, 0, 1, 1,
-1.727009, 1.301757, -0.8505457, 0, 0, 0, 1, 1,
-1.716801, -1.055245, -2.853097, 0, 0, 0, 1, 1,
-1.703215, -0.6117478, -1.86765, 1, 1, 1, 1, 1,
-1.689844, 1.178459, -0.7128232, 1, 1, 1, 1, 1,
-1.680233, -0.596742, -1.015612, 1, 1, 1, 1, 1,
-1.680178, 1.073195, -0.266097, 1, 1, 1, 1, 1,
-1.672117, -0.8610673, -2.485632, 1, 1, 1, 1, 1,
-1.663606, 1.373251, 0.1545577, 1, 1, 1, 1, 1,
-1.656109, -0.0002515922, -2.788199, 1, 1, 1, 1, 1,
-1.655321, 0.5314019, -1.515112, 1, 1, 1, 1, 1,
-1.654748, 1.368351, -2.42515, 1, 1, 1, 1, 1,
-1.653558, -1.048045, -1.723686, 1, 1, 1, 1, 1,
-1.646759, -0.02167711, -2.348294, 1, 1, 1, 1, 1,
-1.621282, 0.7468625, -1.043347, 1, 1, 1, 1, 1,
-1.611863, 0.7540647, -0.8825039, 1, 1, 1, 1, 1,
-1.604761, -0.847743, -2.038719, 1, 1, 1, 1, 1,
-1.604728, -1.597816, -1.09186, 1, 1, 1, 1, 1,
-1.596824, 1.362206, -1.926905, 0, 0, 1, 1, 1,
-1.589058, -1.916227, -4.366152, 1, 0, 0, 1, 1,
-1.571912, -5.801221e-05, 0.304664, 1, 0, 0, 1, 1,
-1.567696, -0.3807704, -2.666429, 1, 0, 0, 1, 1,
-1.566014, -1.098389, -2.848107, 1, 0, 0, 1, 1,
-1.552516, -1.888859, -4.809297, 1, 0, 0, 1, 1,
-1.550637, 1.732186, -1.137694, 0, 0, 0, 1, 1,
-1.546804, -0.1041452, -3.796665, 0, 0, 0, 1, 1,
-1.542144, -0.7750037, -2.31727, 0, 0, 0, 1, 1,
-1.523896, 1.426249, -2.131077, 0, 0, 0, 1, 1,
-1.522518, 1.986691, 0.490933, 0, 0, 0, 1, 1,
-1.52218, 0.6746545, -1.094081, 0, 0, 0, 1, 1,
-1.521178, 0.5383372, -1.718511, 0, 0, 0, 1, 1,
-1.516088, -0.7540326, -2.060989, 1, 1, 1, 1, 1,
-1.513381, 0.2745552, -0.5758678, 1, 1, 1, 1, 1,
-1.4979, -0.2879137, -0.8869172, 1, 1, 1, 1, 1,
-1.491915, 0.8987104, -1.417469, 1, 1, 1, 1, 1,
-1.491173, -0.0568933, -3.379871, 1, 1, 1, 1, 1,
-1.488796, -0.1296222, -0.9349294, 1, 1, 1, 1, 1,
-1.488423, -0.01206374, -3.115688, 1, 1, 1, 1, 1,
-1.48436, -1.29969, -2.805041, 1, 1, 1, 1, 1,
-1.477784, -0.2373406, -2.503245, 1, 1, 1, 1, 1,
-1.463554, 0.1518087, 0.05210892, 1, 1, 1, 1, 1,
-1.452096, 0.8246707, -0.7533443, 1, 1, 1, 1, 1,
-1.447175, 1.573446, -1.187987, 1, 1, 1, 1, 1,
-1.424573, -0.7038499, 0.2011615, 1, 1, 1, 1, 1,
-1.42107, 0.2701825, -1.095079, 1, 1, 1, 1, 1,
-1.376229, 0.540188, -1.062208, 1, 1, 1, 1, 1,
-1.374372, 0.3042583, -1.77748, 0, 0, 1, 1, 1,
-1.371526, 0.6371884, -3.311038, 1, 0, 0, 1, 1,
-1.365302, 0.8592123, -2.232745, 1, 0, 0, 1, 1,
-1.364133, 0.5548738, -1.88912, 1, 0, 0, 1, 1,
-1.363128, 0.5597389, -1.203756, 1, 0, 0, 1, 1,
-1.355377, 1.827307, -0.3266093, 1, 0, 0, 1, 1,
-1.3501, -0.5783288, -0.9862874, 0, 0, 0, 1, 1,
-1.349905, -0.9995505, -0.7522861, 0, 0, 0, 1, 1,
-1.343299, -1.847049, -1.823149, 0, 0, 0, 1, 1,
-1.339613, -0.4781589, -2.31773, 0, 0, 0, 1, 1,
-1.335387, -0.494159, -2.861519, 0, 0, 0, 1, 1,
-1.325511, 1.86964, -1.307601, 0, 0, 0, 1, 1,
-1.317215, -0.4974172, -1.328818, 0, 0, 0, 1, 1,
-1.313787, -0.6660036, -4.671948, 1, 1, 1, 1, 1,
-1.310219, 0.554972, -0.0796937, 1, 1, 1, 1, 1,
-1.307594, -0.4443564, -1.567223, 1, 1, 1, 1, 1,
-1.29204, 0.05033629, -3.093111, 1, 1, 1, 1, 1,
-1.288494, 1.016528, -1.70902, 1, 1, 1, 1, 1,
-1.286635, -1.41913, -2.945184, 1, 1, 1, 1, 1,
-1.285747, 0.473498, -0.5259868, 1, 1, 1, 1, 1,
-1.284272, 1.253232, -0.9590374, 1, 1, 1, 1, 1,
-1.267708, -1.219719, -3.013937, 1, 1, 1, 1, 1,
-1.262526, -0.7892833, -1.181011, 1, 1, 1, 1, 1,
-1.257802, 1.932614, -1.425438, 1, 1, 1, 1, 1,
-1.252181, -1.037642, -1.552979, 1, 1, 1, 1, 1,
-1.23495, -0.6515948, -1.095423, 1, 1, 1, 1, 1,
-1.232704, -0.2779127, -1.280256, 1, 1, 1, 1, 1,
-1.225103, -0.2611594, -3.919914, 1, 1, 1, 1, 1,
-1.221477, -3.028825, -2.172759, 0, 0, 1, 1, 1,
-1.219518, 1.451974, -1.211513, 1, 0, 0, 1, 1,
-1.207872, -1.026004, -0.2178492, 1, 0, 0, 1, 1,
-1.2046, -0.1790277, -1.93564, 1, 0, 0, 1, 1,
-1.194199, -0.77746, -0.9615149, 1, 0, 0, 1, 1,
-1.183325, 0.3112327, -2.805399, 1, 0, 0, 1, 1,
-1.177963, -1.259766, -3.679493, 0, 0, 0, 1, 1,
-1.177162, -0.1783579, -2.693019, 0, 0, 0, 1, 1,
-1.174694, -0.01183908, -2.359799, 0, 0, 0, 1, 1,
-1.171454, -1.923404, -4.475436, 0, 0, 0, 1, 1,
-1.155023, 0.5037086, -0.8728479, 0, 0, 0, 1, 1,
-1.14971, -0.8301383, -2.389171, 0, 0, 0, 1, 1,
-1.148243, -0.6394467, -3.630869, 0, 0, 0, 1, 1,
-1.147932, 0.1757655, -0.9545634, 1, 1, 1, 1, 1,
-1.147302, -0.1281028, -2.598371, 1, 1, 1, 1, 1,
-1.14523, 1.214889, -0.17089, 1, 1, 1, 1, 1,
-1.142568, -1.322928, -1.144593, 1, 1, 1, 1, 1,
-1.137339, 0.5098057, -2.43205, 1, 1, 1, 1, 1,
-1.136713, 0.4874721, -1.162709, 1, 1, 1, 1, 1,
-1.123157, -0.511551, -2.60545, 1, 1, 1, 1, 1,
-1.123018, -0.1806632, -1.991035, 1, 1, 1, 1, 1,
-1.122557, -0.1127878, -1.237904, 1, 1, 1, 1, 1,
-1.121571, 0.05207876, -0.7478295, 1, 1, 1, 1, 1,
-1.120209, 0.3620845, -0.786825, 1, 1, 1, 1, 1,
-1.108056, 0.08109394, -0.3321156, 1, 1, 1, 1, 1,
-1.107612, 0.07230873, -1.930814, 1, 1, 1, 1, 1,
-1.097972, -1.116273, -1.447284, 1, 1, 1, 1, 1,
-1.093649, -0.1209732, -1.342515, 1, 1, 1, 1, 1,
-1.092541, -0.3537459, -2.184828, 0, 0, 1, 1, 1,
-1.087926, 0.2099708, -0.8593335, 1, 0, 0, 1, 1,
-1.087322, 1.098032, 1.195028, 1, 0, 0, 1, 1,
-1.079908, 0.1558338, -1.834298, 1, 0, 0, 1, 1,
-1.069983, -0.9167033, -1.497453, 1, 0, 0, 1, 1,
-1.057254, 0.9867793, -0.4948235, 1, 0, 0, 1, 1,
-1.055661, -1.133389, -0.8535725, 0, 0, 0, 1, 1,
-1.055501, 0.6705508, -1.363794, 0, 0, 0, 1, 1,
-1.037287, 0.2519894, -2.003597, 0, 0, 0, 1, 1,
-1.036413, 0.1322761, -0.9060731, 0, 0, 0, 1, 1,
-1.025209, -0.5891046, -2.275445, 0, 0, 0, 1, 1,
-1.017597, -1.380103, -3.535617, 0, 0, 0, 1, 1,
-1.01659, 0.6226618, -2.241702, 0, 0, 0, 1, 1,
-1.013321, -1.676906, -2.417783, 1, 1, 1, 1, 1,
-0.996913, 0.2784396, 0.4152392, 1, 1, 1, 1, 1,
-0.9899164, 0.779919, 0.005675041, 1, 1, 1, 1, 1,
-0.9888301, 0.1290719, 1.248896, 1, 1, 1, 1, 1,
-0.9844004, 0.005422606, -0.4005598, 1, 1, 1, 1, 1,
-0.9766573, -1.421012, -3.706046, 1, 1, 1, 1, 1,
-0.9723383, 0.1109469, -1.650851, 1, 1, 1, 1, 1,
-0.9719322, 0.5801514, 0.9318457, 1, 1, 1, 1, 1,
-0.9585722, 1.443553, -1.349651, 1, 1, 1, 1, 1,
-0.9575593, -0.2352189, -0.6607503, 1, 1, 1, 1, 1,
-0.9575543, -0.8828769, -2.246622, 1, 1, 1, 1, 1,
-0.9490767, -0.04780954, -3.384973, 1, 1, 1, 1, 1,
-0.9442554, 0.6480877, -1.252872, 1, 1, 1, 1, 1,
-0.9425244, -0.7172573, -3.564491, 1, 1, 1, 1, 1,
-0.9284254, 0.06605092, -1.225012, 1, 1, 1, 1, 1,
-0.9266867, 0.4995836, 0.52964, 0, 0, 1, 1, 1,
-0.9243249, -0.5538768, 0.4063687, 1, 0, 0, 1, 1,
-0.9237412, 1.376196, -0.9183111, 1, 0, 0, 1, 1,
-0.922099, 0.5851241, -1.435788, 1, 0, 0, 1, 1,
-0.9125339, 1.266863, -0.9758469, 1, 0, 0, 1, 1,
-0.910018, -0.1123814, -2.87217, 1, 0, 0, 1, 1,
-0.9082841, 0.7460089, -2.077551, 0, 0, 0, 1, 1,
-0.9061192, 0.7295004, 0.5568475, 0, 0, 0, 1, 1,
-0.9060593, -0.1478217, -3.436103, 0, 0, 0, 1, 1,
-0.9024596, -0.7216827, -1.950029, 0, 0, 0, 1, 1,
-0.898625, -0.4650872, -0.8492934, 0, 0, 0, 1, 1,
-0.8941313, 0.7624028, 0.9723425, 0, 0, 0, 1, 1,
-0.8939362, 1.263528, -0.3542667, 0, 0, 0, 1, 1,
-0.8932821, 0.4857059, 0.824816, 1, 1, 1, 1, 1,
-0.8885473, -0.5749537, -2.141656, 1, 1, 1, 1, 1,
-0.8872167, -0.7949377, -2.375057, 1, 1, 1, 1, 1,
-0.8862257, 0.543286, -1.774603, 1, 1, 1, 1, 1,
-0.8842577, 1.893447, -0.9440894, 1, 1, 1, 1, 1,
-0.8818102, -0.8073276, -1.546157, 1, 1, 1, 1, 1,
-0.8812151, -1.566304, -3.485325, 1, 1, 1, 1, 1,
-0.8738568, 0.2027181, -3.689745, 1, 1, 1, 1, 1,
-0.871084, 0.4672563, -2.271651, 1, 1, 1, 1, 1,
-0.8672355, 0.9136325, -1.371345, 1, 1, 1, 1, 1,
-0.8647182, 1.262381, 0.1724256, 1, 1, 1, 1, 1,
-0.8618919, -0.5428977, -2.29762, 1, 1, 1, 1, 1,
-0.8586679, -0.4782585, -2.333538, 1, 1, 1, 1, 1,
-0.8554359, -1.755069, -3.705465, 1, 1, 1, 1, 1,
-0.8500992, -0.7970469, -1.15485, 1, 1, 1, 1, 1,
-0.8480539, -2.29507, -2.994635, 0, 0, 1, 1, 1,
-0.8393499, 2.684518, 0.481327, 1, 0, 0, 1, 1,
-0.8358387, 2.567717, 0.7955962, 1, 0, 0, 1, 1,
-0.8249593, -1.984242, -0.8374565, 1, 0, 0, 1, 1,
-0.8225299, 1.284044, -1.147666, 1, 0, 0, 1, 1,
-0.8212535, 0.3217383, -2.392376, 1, 0, 0, 1, 1,
-0.8196529, -1.056132, -3.326676, 0, 0, 0, 1, 1,
-0.8178225, 0.046953, -1.219543, 0, 0, 0, 1, 1,
-0.8159117, -1.01112, -3.886923, 0, 0, 0, 1, 1,
-0.8143111, -0.2437839, -1.099556, 0, 0, 0, 1, 1,
-0.8142522, 0.1371313, -2.373635, 0, 0, 0, 1, 1,
-0.8123322, 0.6122196, -0.605181, 0, 0, 0, 1, 1,
-0.8087553, -0.9062542, -3.163089, 0, 0, 0, 1, 1,
-0.8084255, 0.03131359, -1.957445, 1, 1, 1, 1, 1,
-0.8049021, 0.362461, -1.763345, 1, 1, 1, 1, 1,
-0.80311, -0.3532449, -1.718985, 1, 1, 1, 1, 1,
-0.800981, 0.1119841, -1.910024, 1, 1, 1, 1, 1,
-0.7970086, 0.9341613, 0.2399049, 1, 1, 1, 1, 1,
-0.7872982, -0.3102293, -2.558107, 1, 1, 1, 1, 1,
-0.7806237, -0.4808125, -1.581602, 1, 1, 1, 1, 1,
-0.777586, -0.1942722, -0.02361517, 1, 1, 1, 1, 1,
-0.7694494, -1.012853, -3.977317, 1, 1, 1, 1, 1,
-0.7687755, 0.1174642, 0.09960294, 1, 1, 1, 1, 1,
-0.7679408, -0.6268768, -3.46546, 1, 1, 1, 1, 1,
-0.7662247, 0.8880908, -0.4800926, 1, 1, 1, 1, 1,
-0.7658018, 0.8094321, 0.5748556, 1, 1, 1, 1, 1,
-0.7644325, 2.008289, 0.148897, 1, 1, 1, 1, 1,
-0.7632256, -1.632022, -2.443608, 1, 1, 1, 1, 1,
-0.7611492, 0.6857225, 0.3249708, 0, 0, 1, 1, 1,
-0.7570384, -1.152737, -2.825883, 1, 0, 0, 1, 1,
-0.7536129, 1.056744, -0.4024868, 1, 0, 0, 1, 1,
-0.752717, 1.546364, -3.083416, 1, 0, 0, 1, 1,
-0.7523478, -0.1807212, -0.8562853, 1, 0, 0, 1, 1,
-0.7398607, -1.661988, -2.741126, 1, 0, 0, 1, 1,
-0.7369902, 1.788029, 1.256056, 0, 0, 0, 1, 1,
-0.7362264, 0.4300316, -0.04249453, 0, 0, 0, 1, 1,
-0.7352945, -0.4938363, -0.7800497, 0, 0, 0, 1, 1,
-0.7314463, 2.612925, -0.3404272, 0, 0, 0, 1, 1,
-0.72251, -0.31007, -1.767573, 0, 0, 0, 1, 1,
-0.7109018, -0.7752472, -1.073713, 0, 0, 0, 1, 1,
-0.7105969, -0.2875121, -1.132616, 0, 0, 0, 1, 1,
-0.7101527, -1.707804, -1.774279, 1, 1, 1, 1, 1,
-0.7024367, -2.422363, -2.06339, 1, 1, 1, 1, 1,
-0.701771, 0.193125, -2.085279, 1, 1, 1, 1, 1,
-0.6902799, -0.9327376, 0.2461635, 1, 1, 1, 1, 1,
-0.6879318, 0.5556717, -0.103119, 1, 1, 1, 1, 1,
-0.6851533, 1.120048, -2.049881, 1, 1, 1, 1, 1,
-0.6785157, 1.077538, -2.747109, 1, 1, 1, 1, 1,
-0.6772918, -0.3918439, -1.564762, 1, 1, 1, 1, 1,
-0.6658434, -0.09463827, -0.4500011, 1, 1, 1, 1, 1,
-0.6619961, -1.546839, -2.482848, 1, 1, 1, 1, 1,
-0.6600225, 0.4630024, -2.284207, 1, 1, 1, 1, 1,
-0.6593612, -1.303943, -0.7707725, 1, 1, 1, 1, 1,
-0.6576407, 0.7177855, -2.140213, 1, 1, 1, 1, 1,
-0.655993, -0.308522, -0.8620745, 1, 1, 1, 1, 1,
-0.6497862, -0.5978929, -2.26518, 1, 1, 1, 1, 1,
-0.6454003, 0.492284, -1.193755, 0, 0, 1, 1, 1,
-0.6410323, -0.9981946, -2.607414, 1, 0, 0, 1, 1,
-0.6369497, -0.619299, -3.426934, 1, 0, 0, 1, 1,
-0.6349656, -0.5068486, -1.550135, 1, 0, 0, 1, 1,
-0.6316162, 0.4304616, -1.068683, 1, 0, 0, 1, 1,
-0.6281177, -0.2957037, -1.232194, 1, 0, 0, 1, 1,
-0.6267385, -0.1152857, -1.903211, 0, 0, 0, 1, 1,
-0.6267236, 0.325892, 0.9208707, 0, 0, 0, 1, 1,
-0.6231709, 0.8898621, -0.4453031, 0, 0, 0, 1, 1,
-0.6222694, -0.681321, -1.546539, 0, 0, 0, 1, 1,
-0.6219421, -1.394658, -2.803016, 0, 0, 0, 1, 1,
-0.6174499, -1.534073, -2.828464, 0, 0, 0, 1, 1,
-0.615656, -0.07530639, -1.223895, 0, 0, 0, 1, 1,
-0.6137439, -0.7133371, -2.579896, 1, 1, 1, 1, 1,
-0.6135829, -1.552351, -2.680367, 1, 1, 1, 1, 1,
-0.6126179, -1.487901, -3.777319, 1, 1, 1, 1, 1,
-0.6072525, -0.03810484, -0.08732454, 1, 1, 1, 1, 1,
-0.6063244, 1.025547, 0.2786278, 1, 1, 1, 1, 1,
-0.6058559, 0.4350246, -1.621771, 1, 1, 1, 1, 1,
-0.5992233, -1.629139, -2.331429, 1, 1, 1, 1, 1,
-0.5981101, -0.1687389, -1.349179, 1, 1, 1, 1, 1,
-0.5975543, -1.385554, -1.893947, 1, 1, 1, 1, 1,
-0.5947042, 0.5307736, -0.981618, 1, 1, 1, 1, 1,
-0.5911759, 1.209416, -0.2999108, 1, 1, 1, 1, 1,
-0.5874897, 0.7005741, 1.098463, 1, 1, 1, 1, 1,
-0.5804707, -0.2542039, -0.9113113, 1, 1, 1, 1, 1,
-0.5754287, -0.05416933, -1.751928, 1, 1, 1, 1, 1,
-0.5738274, 0.878323, 1.120655, 1, 1, 1, 1, 1,
-0.5718299, -0.9684506, -3.704454, 0, 0, 1, 1, 1,
-0.5705113, -1.303471, -2.689253, 1, 0, 0, 1, 1,
-0.5680982, -1.049985, -0.8678312, 1, 0, 0, 1, 1,
-0.5637883, -0.2893941, -1.668922, 1, 0, 0, 1, 1,
-0.5633656, -1.024644, -3.621687, 1, 0, 0, 1, 1,
-0.5614942, -1.823536, -3.550007, 1, 0, 0, 1, 1,
-0.5552518, 0.2913811, -1.374422, 0, 0, 0, 1, 1,
-0.5535458, 0.6589052, -3.202024, 0, 0, 0, 1, 1,
-0.5531123, 0.1179569, 0.4519705, 0, 0, 0, 1, 1,
-0.552514, -0.5074275, -2.0223, 0, 0, 0, 1, 1,
-0.5511349, -1.50108, -2.812876, 0, 0, 0, 1, 1,
-0.5490301, 1.767301, 0.3803852, 0, 0, 0, 1, 1,
-0.5457144, -1.030584, -1.432465, 0, 0, 0, 1, 1,
-0.5448335, 0.01515825, -2.108782, 1, 1, 1, 1, 1,
-0.5399337, 2.408775, -0.3717145, 1, 1, 1, 1, 1,
-0.5331464, 0.4214043, -1.276777, 1, 1, 1, 1, 1,
-0.5287455, 0.7409555, -1.151702, 1, 1, 1, 1, 1,
-0.5268181, -0.4183127, -2.177456, 1, 1, 1, 1, 1,
-0.5260723, -0.02772913, -1.057128, 1, 1, 1, 1, 1,
-0.5258635, -1.082948, -1.240668, 1, 1, 1, 1, 1,
-0.5129067, -1.931063, -2.320396, 1, 1, 1, 1, 1,
-0.5123036, 0.03085498, -2.771664, 1, 1, 1, 1, 1,
-0.5097309, -0.08896086, -2.167602, 1, 1, 1, 1, 1,
-0.5061581, -1.218658, -1.850842, 1, 1, 1, 1, 1,
-0.5041131, 1.472934, 1.654248, 1, 1, 1, 1, 1,
-0.5040359, 1.024519, -0.9517572, 1, 1, 1, 1, 1,
-0.5006182, 0.8650414, -1.682842, 1, 1, 1, 1, 1,
-0.49608, 0.00276783, -2.800273, 1, 1, 1, 1, 1,
-0.4955436, -0.6526199, -1.641759, 0, 0, 1, 1, 1,
-0.4878672, -0.3526995, -2.112163, 1, 0, 0, 1, 1,
-0.4830484, -0.6280908, -2.387138, 1, 0, 0, 1, 1,
-0.4794416, 0.3794139, -1.297482, 1, 0, 0, 1, 1,
-0.4772948, 0.9987557, -1.384448, 1, 0, 0, 1, 1,
-0.4707024, 0.2469845, -1.745242, 1, 0, 0, 1, 1,
-0.4702219, -0.3129799, -1.333443, 0, 0, 0, 1, 1,
-0.4698393, 0.08946495, -1.207494, 0, 0, 0, 1, 1,
-0.4691657, -0.08554847, -1.462547, 0, 0, 0, 1, 1,
-0.4688489, 0.4704303, -1.072709, 0, 0, 0, 1, 1,
-0.4519438, 0.06622956, -0.6058833, 0, 0, 0, 1, 1,
-0.4426054, -0.86007, -2.219225, 0, 0, 0, 1, 1,
-0.4419071, -0.1162374, -1.707729, 0, 0, 0, 1, 1,
-0.4408397, -1.384246, -1.761254, 1, 1, 1, 1, 1,
-0.4391337, -0.6229475, -2.006083, 1, 1, 1, 1, 1,
-0.4362324, 0.6059773, 0.773681, 1, 1, 1, 1, 1,
-0.4340631, -0.09706615, -0.1005031, 1, 1, 1, 1, 1,
-0.4295039, -0.5376157, -3.392944, 1, 1, 1, 1, 1,
-0.4266776, 1.506183, -0.1165359, 1, 1, 1, 1, 1,
-0.4261531, 1.076447, 1.349888, 1, 1, 1, 1, 1,
-0.4239914, -0.62159, -2.285726, 1, 1, 1, 1, 1,
-0.4171167, 0.2461954, -2.211879, 1, 1, 1, 1, 1,
-0.4158788, -0.4469817, -0.9315277, 1, 1, 1, 1, 1,
-0.4158773, 0.61875, -2.046835, 1, 1, 1, 1, 1,
-0.4136629, -0.4082289, -3.802035, 1, 1, 1, 1, 1,
-0.4129995, 1.426039, -0.7331101, 1, 1, 1, 1, 1,
-0.4122395, 1.19399, -1.009003, 1, 1, 1, 1, 1,
-0.4108445, 1.191434, -0.7864574, 1, 1, 1, 1, 1,
-0.4104885, -0.8774875, -4.249943, 0, 0, 1, 1, 1,
-0.4043067, 0.04318628, -2.111853, 1, 0, 0, 1, 1,
-0.401534, 0.3398794, -2.674183, 1, 0, 0, 1, 1,
-0.4013978, 0.07843166, -1.119243, 1, 0, 0, 1, 1,
-0.3996769, 0.1906533, -0.6610297, 1, 0, 0, 1, 1,
-0.399577, 0.4334667, -0.9264413, 1, 0, 0, 1, 1,
-0.3953559, 0.2449826, -2.839408, 0, 0, 0, 1, 1,
-0.3948372, 1.387435, 0.4447663, 0, 0, 0, 1, 1,
-0.3943707, -0.3531232, -4.133125, 0, 0, 0, 1, 1,
-0.3888292, 0.8304518, -0.3648866, 0, 0, 0, 1, 1,
-0.3880838, -0.6871306, -2.871501, 0, 0, 0, 1, 1,
-0.3860129, 0.5950519, 0.8165063, 0, 0, 0, 1, 1,
-0.3854826, 0.07159927, -0.6986177, 0, 0, 0, 1, 1,
-0.3848701, -1.09625, -1.633868, 1, 1, 1, 1, 1,
-0.3848082, 0.8007112, -2.775542, 1, 1, 1, 1, 1,
-0.3832195, 0.7420304, -0.8967611, 1, 1, 1, 1, 1,
-0.3792602, -0.02428673, -2.037171, 1, 1, 1, 1, 1,
-0.3715495, -0.9240689, -0.8779711, 1, 1, 1, 1, 1,
-0.3655773, 0.5920616, -0.8355265, 1, 1, 1, 1, 1,
-0.3630828, -0.4801972, -2.326152, 1, 1, 1, 1, 1,
-0.3589872, 0.9851535, -0.5523648, 1, 1, 1, 1, 1,
-0.356945, -0.03641115, -2.032492, 1, 1, 1, 1, 1,
-0.3568971, -0.3850486, -2.712697, 1, 1, 1, 1, 1,
-0.3565207, 1.357269, 1.167517, 1, 1, 1, 1, 1,
-0.354187, -0.6377864, -4.713422, 1, 1, 1, 1, 1,
-0.3469934, 0.8687925, -0.6436056, 1, 1, 1, 1, 1,
-0.3442167, 1.827579, -0.4723074, 1, 1, 1, 1, 1,
-0.3431102, -1.316907, -1.439885, 1, 1, 1, 1, 1,
-0.3388709, 0.288139, 0.4253491, 0, 0, 1, 1, 1,
-0.3378499, 0.7456597, -3.024859, 1, 0, 0, 1, 1,
-0.3372927, 0.784269, 0.6901078, 1, 0, 0, 1, 1,
-0.3357725, 0.3549887, -2.66956, 1, 0, 0, 1, 1,
-0.3293434, -0.6771913, -3.475293, 1, 0, 0, 1, 1,
-0.3282158, -0.1402217, -2.892142, 1, 0, 0, 1, 1,
-0.3280169, -0.004300994, -1.751521, 0, 0, 0, 1, 1,
-0.3245784, -0.145557, -1.771956, 0, 0, 0, 1, 1,
-0.324431, 0.2485952, 0.8934633, 0, 0, 0, 1, 1,
-0.3235653, -0.2382055, -2.506594, 0, 0, 0, 1, 1,
-0.322593, 0.2678986, -0.2953315, 0, 0, 0, 1, 1,
-0.3118311, -0.5241622, -2.727393, 0, 0, 0, 1, 1,
-0.3113918, -1.26133, -1.540391, 0, 0, 0, 1, 1,
-0.3095252, 1.13438, 0.9468476, 1, 1, 1, 1, 1,
-0.308249, -0.6927614, -2.147112, 1, 1, 1, 1, 1,
-0.3081479, 1.253634, -1.907187, 1, 1, 1, 1, 1,
-0.3063177, 0.2192524, -0.9207609, 1, 1, 1, 1, 1,
-0.3047545, 0.4253056, 0.7365661, 1, 1, 1, 1, 1,
-0.3027466, -1.373692, -3.822918, 1, 1, 1, 1, 1,
-0.3011392, 0.04198255, -1.456899, 1, 1, 1, 1, 1,
-0.3006365, 0.4169642, -1.79833, 1, 1, 1, 1, 1,
-0.2918632, 1.28037, -0.5060835, 1, 1, 1, 1, 1,
-0.2846391, 0.5142272, -1.715901, 1, 1, 1, 1, 1,
-0.2836896, 1.177375, 0.1721576, 1, 1, 1, 1, 1,
-0.282786, 0.5552813, -0.6957182, 1, 1, 1, 1, 1,
-0.2768335, 1.255776, 0.9678364, 1, 1, 1, 1, 1,
-0.2697173, 0.747592, -0.9014689, 1, 1, 1, 1, 1,
-0.2669991, -0.4854631, -4.023346, 1, 1, 1, 1, 1,
-0.266548, 0.3486217, -0.2717595, 0, 0, 1, 1, 1,
-0.266237, 0.5113731, -0.6982182, 1, 0, 0, 1, 1,
-0.2635132, -1.547504, -2.725929, 1, 0, 0, 1, 1,
-0.2625341, 1.047892, 0.9396095, 1, 0, 0, 1, 1,
-0.2601524, 1.090873, 0.5465777, 1, 0, 0, 1, 1,
-0.2589202, 0.9108043, -1.163175, 1, 0, 0, 1, 1,
-0.2524123, -1.088269, -1.793215, 0, 0, 0, 1, 1,
-0.2468454, -0.4835506, -2.816786, 0, 0, 0, 1, 1,
-0.2465674, -1.13137, -2.674041, 0, 0, 0, 1, 1,
-0.2460382, -1.985521, -4.607244, 0, 0, 0, 1, 1,
-0.242166, -1.850337, -1.783237, 0, 0, 0, 1, 1,
-0.2377811, -0.7644952, -3.305171, 0, 0, 0, 1, 1,
-0.2358914, -0.3211948, -3.12554, 0, 0, 0, 1, 1,
-0.2332082, 0.7368238, 0.272738, 1, 1, 1, 1, 1,
-0.2290235, 0.6106862, 0.8056675, 1, 1, 1, 1, 1,
-0.2245782, 2.06615, -0.7344959, 1, 1, 1, 1, 1,
-0.2140758, 0.1784847, -0.4827326, 1, 1, 1, 1, 1,
-0.2107117, 1.187097, -1.229729, 1, 1, 1, 1, 1,
-0.2060446, 0.9733713, 0.7598494, 1, 1, 1, 1, 1,
-0.2060317, 1.226503, 0.5078231, 1, 1, 1, 1, 1,
-0.2055323, -2.197827, -2.415115, 1, 1, 1, 1, 1,
-0.2048113, 0.8434554, -0.7622601, 1, 1, 1, 1, 1,
-0.2034474, -1.155263, -1.496756, 1, 1, 1, 1, 1,
-0.2020125, -1.155665, -4.067338, 1, 1, 1, 1, 1,
-0.200711, 0.7236854, 2.315202, 1, 1, 1, 1, 1,
-0.2006416, -0.12362, -2.270721, 1, 1, 1, 1, 1,
-0.2002862, -0.4181947, -1.291988, 1, 1, 1, 1, 1,
-0.1972581, -0.5124548, -2.284214, 1, 1, 1, 1, 1,
-0.1965874, -0.1721983, -3.839216, 0, 0, 1, 1, 1,
-0.1915659, -0.8926275, -2.621336, 1, 0, 0, 1, 1,
-0.1906882, 1.467517, -0.2139742, 1, 0, 0, 1, 1,
-0.1873222, -1.346879, -2.059512, 1, 0, 0, 1, 1,
-0.1865727, -0.02938626, -1.330807, 1, 0, 0, 1, 1,
-0.1861414, 1.704411, 0.07343753, 1, 0, 0, 1, 1,
-0.1847701, -2.10982, -3.615421, 0, 0, 0, 1, 1,
-0.1844521, 0.330604, 1.878401, 0, 0, 0, 1, 1,
-0.1840032, 1.603767, -2.206824, 0, 0, 0, 1, 1,
-0.1836274, 1.046068, -1.08989, 0, 0, 0, 1, 1,
-0.1804834, -0.192232, -1.681343, 0, 0, 0, 1, 1,
-0.1781835, -0.01318822, 0.02790108, 0, 0, 0, 1, 1,
-0.1770635, -1.277636, -5.247488, 0, 0, 0, 1, 1,
-0.1725144, 1.589689, -0.9831213, 1, 1, 1, 1, 1,
-0.171545, 1.075197, -1.030644, 1, 1, 1, 1, 1,
-0.1701594, -0.1344959, -1.938043, 1, 1, 1, 1, 1,
-0.1697927, -1.002164, -2.941781, 1, 1, 1, 1, 1,
-0.1684435, 0.8739743, -2.047263, 1, 1, 1, 1, 1,
-0.1666464, 1.185029, -2.215124, 1, 1, 1, 1, 1,
-0.1660348, 0.7854317, 0.2133567, 1, 1, 1, 1, 1,
-0.1622619, -0.3905855, -2.407843, 1, 1, 1, 1, 1,
-0.1503844, 0.2011116, 1.895164, 1, 1, 1, 1, 1,
-0.1501893, -0.3413575, -2.628621, 1, 1, 1, 1, 1,
-0.1497091, 0.9480749, -0.02992208, 1, 1, 1, 1, 1,
-0.1452502, 0.3857737, -2.146205, 1, 1, 1, 1, 1,
-0.1364894, -1.147524, -5.572772, 1, 1, 1, 1, 1,
-0.1357011, 2.424799, -1.230091, 1, 1, 1, 1, 1,
-0.1355486, 0.4431049, -0.6517447, 1, 1, 1, 1, 1,
-0.1349067, 0.1842735, -0.05903409, 0, 0, 1, 1, 1,
-0.1347709, -1.592918, -3.419047, 1, 0, 0, 1, 1,
-0.1319977, 0.1945237, -0.07990535, 1, 0, 0, 1, 1,
-0.1312296, -0.1150321, -3.402173, 1, 0, 0, 1, 1,
-0.1263105, -0.8468096, -3.342483, 1, 0, 0, 1, 1,
-0.1237297, -0.9248174, -2.298193, 1, 0, 0, 1, 1,
-0.1226043, -0.6139492, -1.187882, 0, 0, 0, 1, 1,
-0.1132813, 1.229539, 1.657165, 0, 0, 0, 1, 1,
-0.1118151, 1.035156, -0.457951, 0, 0, 0, 1, 1,
-0.1087002, 1.399812, 0.7696723, 0, 0, 0, 1, 1,
-0.1084993, 0.5789037, 1.617206, 0, 0, 0, 1, 1,
-0.1083506, -0.1675281, -3.322211, 0, 0, 0, 1, 1,
-0.1043099, 0.9974948, -0.4575389, 0, 0, 0, 1, 1,
-0.09890604, -2.071878, -3.534822, 1, 1, 1, 1, 1,
-0.09820107, 1.288456, -2.24339, 1, 1, 1, 1, 1,
-0.09607112, -1.029781, -3.625469, 1, 1, 1, 1, 1,
-0.09098233, -1.822203, -4.259802, 1, 1, 1, 1, 1,
-0.08937573, -1.282911, -2.804431, 1, 1, 1, 1, 1,
-0.08908499, 0.3855372, 0.4055006, 1, 1, 1, 1, 1,
-0.08905392, -1.09189, -1.445565, 1, 1, 1, 1, 1,
-0.0882626, -0.8896807, -1.556808, 1, 1, 1, 1, 1,
-0.08730014, -0.1921442, -1.158212, 1, 1, 1, 1, 1,
-0.08606488, -0.8318468, -5.065963, 1, 1, 1, 1, 1,
-0.08371063, -1.257216, -2.443273, 1, 1, 1, 1, 1,
-0.08313642, -2.355976, -3.627256, 1, 1, 1, 1, 1,
-0.08127175, 2.364165, 1.218378, 1, 1, 1, 1, 1,
-0.08053719, -0.1899361, -2.564996, 1, 1, 1, 1, 1,
-0.07839824, 1.032835, -0.6724861, 1, 1, 1, 1, 1,
-0.07796603, 2.12289, 0.5676382, 0, 0, 1, 1, 1,
-0.07692779, -0.8139635, -2.767487, 1, 0, 0, 1, 1,
-0.07239207, 0.8692733, -0.7384808, 1, 0, 0, 1, 1,
-0.06794494, 1.425249, 0.2074127, 1, 0, 0, 1, 1,
-0.06523239, -1.366761, -2.287108, 1, 0, 0, 1, 1,
-0.06491694, -1.542635, -3.817618, 1, 0, 0, 1, 1,
-0.05979263, -0.3069654, -4.662454, 0, 0, 0, 1, 1,
-0.05841816, -0.010568, -1.146153, 0, 0, 0, 1, 1,
-0.0563535, 0.6370396, 0.2080153, 0, 0, 0, 1, 1,
-0.05549562, -0.4961104, -4.934769, 0, 0, 0, 1, 1,
-0.0536982, 3.181266, 1.783766, 0, 0, 0, 1, 1,
-0.05072214, -0.264107, -3.450459, 0, 0, 0, 1, 1,
-0.04818417, 1.263636, 0.8679875, 0, 0, 0, 1, 1,
-0.04719162, -0.1697287, -3.252131, 1, 1, 1, 1, 1,
-0.03636369, 0.6810486, -3.060873, 1, 1, 1, 1, 1,
-0.03156172, -1.280473, -3.952605, 1, 1, 1, 1, 1,
-0.02888265, 1.004433, -1.583108, 1, 1, 1, 1, 1,
-0.02710456, 0.7764179, -0.228783, 1, 1, 1, 1, 1,
-0.02491131, -0.1584654, -3.807759, 1, 1, 1, 1, 1,
-0.02462809, 0.3301177, 1.751746, 1, 1, 1, 1, 1,
-0.02361131, 0.9350271, 1.071738, 1, 1, 1, 1, 1,
-0.01886065, 0.2499894, 0.8288544, 1, 1, 1, 1, 1,
-0.0180332, 1.07873, -1.215567, 1, 1, 1, 1, 1,
-0.01527373, -0.01159618, -2.123629, 1, 1, 1, 1, 1,
-0.01512457, 0.5524318, -0.05249433, 1, 1, 1, 1, 1,
-0.01250768, -0.1130317, -2.590289, 1, 1, 1, 1, 1,
-0.007075124, 0.01636896, 0.1390226, 1, 1, 1, 1, 1,
-0.003778488, 0.7965691, 1.58009, 1, 1, 1, 1, 1,
-0.003150179, 0.9599528, 1.15527, 0, 0, 1, 1, 1,
-0.0008091446, 0.04108365, -1.209158, 1, 0, 0, 1, 1,
0.008767778, 0.1681262, 0.238247, 1, 0, 0, 1, 1,
0.01202004, -0.7386198, 2.72697, 1, 0, 0, 1, 1,
0.01311151, -0.8333507, 5.600552, 1, 0, 0, 1, 1,
0.01446493, -0.1989868, 2.949019, 1, 0, 0, 1, 1,
0.01712337, 1.150326, -0.2418091, 0, 0, 0, 1, 1,
0.01752364, -1.289481, 2.746133, 0, 0, 0, 1, 1,
0.01752845, 0.8570562, 1.022383, 0, 0, 0, 1, 1,
0.02248756, -0.8857507, 1.572016, 0, 0, 0, 1, 1,
0.02268704, -1.221763, 3.852703, 0, 0, 0, 1, 1,
0.02608396, 0.009493, 1.194258, 0, 0, 0, 1, 1,
0.03000821, 0.3116592, -1.552555, 0, 0, 0, 1, 1,
0.03695653, 0.70487, -0.6309707, 1, 1, 1, 1, 1,
0.04057232, 0.3773193, 1.401194, 1, 1, 1, 1, 1,
0.0484823, 0.2765744, -0.378334, 1, 1, 1, 1, 1,
0.04995658, 1.591168, 0.6329729, 1, 1, 1, 1, 1,
0.05314999, -0.4719289, 4.640093, 1, 1, 1, 1, 1,
0.05367967, 0.2919511, 2.21386, 1, 1, 1, 1, 1,
0.05616706, -0.5784503, 4.587339, 1, 1, 1, 1, 1,
0.05846238, -0.4167428, 2.824919, 1, 1, 1, 1, 1,
0.06331455, 0.268761, -0.5368845, 1, 1, 1, 1, 1,
0.06857073, 0.5552253, -1.835514, 1, 1, 1, 1, 1,
0.06996574, -1.655323, 3.010618, 1, 1, 1, 1, 1,
0.07398426, -1.315886, 3.224035, 1, 1, 1, 1, 1,
0.07729187, 0.2109181, 0.8441672, 1, 1, 1, 1, 1,
0.07750849, 2.032719, 0.03884555, 1, 1, 1, 1, 1,
0.08292992, -0.1127422, 3.217577, 1, 1, 1, 1, 1,
0.08411019, -1.227378, 3.638987, 0, 0, 1, 1, 1,
0.08587626, -0.7252653, 2.110705, 1, 0, 0, 1, 1,
0.08987375, -0.4246349, 4.380126, 1, 0, 0, 1, 1,
0.09483667, -1.074922, 3.845124, 1, 0, 0, 1, 1,
0.1027484, -0.9298759, 2.662088, 1, 0, 0, 1, 1,
0.1049155, -0.1982286, 4.006847, 1, 0, 0, 1, 1,
0.1049958, 0.1760371, 2.523695, 0, 0, 0, 1, 1,
0.109043, 1.223353, -1.562298, 0, 0, 0, 1, 1,
0.1113872, -2.460846, 4.498769, 0, 0, 0, 1, 1,
0.111666, -0.1947193, 3.233339, 0, 0, 0, 1, 1,
0.1125998, -1.588943, 2.264759, 0, 0, 0, 1, 1,
0.1135088, 1.234988, -0.8929774, 0, 0, 0, 1, 1,
0.1199489, -1.418399, 4.88602, 0, 0, 0, 1, 1,
0.1219829, -1.348023, 3.233302, 1, 1, 1, 1, 1,
0.1254588, -0.4271198, 1.656541, 1, 1, 1, 1, 1,
0.1262767, 0.2558364, 0.5160523, 1, 1, 1, 1, 1,
0.1294421, -0.7885553, 3.130755, 1, 1, 1, 1, 1,
0.1310776, 0.1456046, 0.5024768, 1, 1, 1, 1, 1,
0.1338637, -1.155954, 4.594833, 1, 1, 1, 1, 1,
0.1344962, 1.058197, -0.7004565, 1, 1, 1, 1, 1,
0.1390528, 0.325985, 0.1090544, 1, 1, 1, 1, 1,
0.1423677, -0.4000897, 3.322721, 1, 1, 1, 1, 1,
0.1446009, 0.6207192, -1.047061, 1, 1, 1, 1, 1,
0.1455618, -0.5093336, 5.578444, 1, 1, 1, 1, 1,
0.160258, -0.5266814, 5.591914, 1, 1, 1, 1, 1,
0.1632663, 0.2736996, -0.5510192, 1, 1, 1, 1, 1,
0.1681849, -0.4299743, 1.665696, 1, 1, 1, 1, 1,
0.1716633, 0.134062, 1.919912, 1, 1, 1, 1, 1,
0.1717145, 0.08477427, -0.2167305, 0, 0, 1, 1, 1,
0.1721693, -0.1610213, 1.959534, 1, 0, 0, 1, 1,
0.1726897, 0.4579985, 0.093241, 1, 0, 0, 1, 1,
0.1762182, -1.059615, 1.788531, 1, 0, 0, 1, 1,
0.1800474, -0.6605651, 3.368627, 1, 0, 0, 1, 1,
0.1810466, -0.9559283, 4.521916, 1, 0, 0, 1, 1,
0.1828703, 1.850371, -0.8310479, 0, 0, 0, 1, 1,
0.1839923, 1.228805, -0.9966854, 0, 0, 0, 1, 1,
0.1931451, 0.5614406, 0.9638696, 0, 0, 0, 1, 1,
0.1993873, -0.3959506, 3.886136, 0, 0, 0, 1, 1,
0.2001561, 1.679053, -2.139472, 0, 0, 0, 1, 1,
0.2004107, -0.1421694, 3.153161, 0, 0, 0, 1, 1,
0.2006795, 0.95056, 1.065, 0, 0, 0, 1, 1,
0.2076063, 0.972765, 0.9208459, 1, 1, 1, 1, 1,
0.2087226, 0.6839414, -0.1636208, 1, 1, 1, 1, 1,
0.2162389, 2.369839, -1.550931, 1, 1, 1, 1, 1,
0.2200253, 0.0380959, -0.3664962, 1, 1, 1, 1, 1,
0.2203873, 0.2564829, 0.4821038, 1, 1, 1, 1, 1,
0.22303, -0.01229579, 2.216362, 1, 1, 1, 1, 1,
0.227419, 0.1844764, 1.620886, 1, 1, 1, 1, 1,
0.2289119, -0.1256601, 2.212928, 1, 1, 1, 1, 1,
0.2289369, 1.319609, 0.8296341, 1, 1, 1, 1, 1,
0.2322074, 0.02376337, 0.2554227, 1, 1, 1, 1, 1,
0.2342199, 0.05428512, 1.170544, 1, 1, 1, 1, 1,
0.2342594, -0.9526203, 4.199645, 1, 1, 1, 1, 1,
0.237551, -2.188257, 4.594997, 1, 1, 1, 1, 1,
0.2383177, -0.250292, 2.668644, 1, 1, 1, 1, 1,
0.2383822, 1.19898, -0.9176129, 1, 1, 1, 1, 1,
0.2385342, -0.435829, 2.617064, 0, 0, 1, 1, 1,
0.2396822, -1.030679, 2.036027, 1, 0, 0, 1, 1,
0.2455328, -0.05466921, 0.9322205, 1, 0, 0, 1, 1,
0.2456824, -0.01271306, 1.548867, 1, 0, 0, 1, 1,
0.2457517, 0.02143958, 1.231273, 1, 0, 0, 1, 1,
0.2507979, -0.9173927, 3.169187, 1, 0, 0, 1, 1,
0.2545033, -0.647781, 2.698852, 0, 0, 0, 1, 1,
0.2554149, 0.6308187, -0.1491244, 0, 0, 0, 1, 1,
0.2597944, 0.4808231, -1.13853, 0, 0, 0, 1, 1,
0.262008, 0.2357302, 3.080411, 0, 0, 0, 1, 1,
0.263181, 1.03644, 0.7629542, 0, 0, 0, 1, 1,
0.2642036, 0.06980309, 1.188946, 0, 0, 0, 1, 1,
0.2643009, 0.4659289, -1.193779, 0, 0, 0, 1, 1,
0.2704828, 0.1216608, 2.659391, 1, 1, 1, 1, 1,
0.2714091, -1.762325, 3.156359, 1, 1, 1, 1, 1,
0.2726722, 0.0404129, 1.557926, 1, 1, 1, 1, 1,
0.27861, -0.8333124, 3.16369, 1, 1, 1, 1, 1,
0.2791588, -2.084393, 1.68185, 1, 1, 1, 1, 1,
0.287877, 0.2684195, 1.265785, 1, 1, 1, 1, 1,
0.2913536, 0.04900276, 1.133168, 1, 1, 1, 1, 1,
0.2913713, 0.3002707, 0.7757279, 1, 1, 1, 1, 1,
0.2946858, -0.49257, 1.665283, 1, 1, 1, 1, 1,
0.2985961, 0.4073508, 0.03898859, 1, 1, 1, 1, 1,
0.299683, -0.7348535, 4.570785, 1, 1, 1, 1, 1,
0.2999536, -1.865877, 4.351562, 1, 1, 1, 1, 1,
0.3008778, -0.1387556, 1.197567, 1, 1, 1, 1, 1,
0.3020968, 2.23212, -0.1584416, 1, 1, 1, 1, 1,
0.3032411, -1.560947, 1.81188, 1, 1, 1, 1, 1,
0.3050783, 0.1028601, -0.432967, 0, 0, 1, 1, 1,
0.3052255, 0.8200418, -0.5982764, 1, 0, 0, 1, 1,
0.3057041, -0.2442773, 2.679699, 1, 0, 0, 1, 1,
0.3074627, -0.6477674, 2.206383, 1, 0, 0, 1, 1,
0.307908, 0.5379292, 2.110859, 1, 0, 0, 1, 1,
0.3099516, -1.149246, 4.093559, 1, 0, 0, 1, 1,
0.3099721, -0.7157423, 3.223625, 0, 0, 0, 1, 1,
0.3123923, 0.4209964, 0.5137417, 0, 0, 0, 1, 1,
0.3150203, -0.4041697, 2.303488, 0, 0, 0, 1, 1,
0.316288, 0.3728203, 1.523388, 0, 0, 0, 1, 1,
0.3163915, -0.3051051, 1.932964, 0, 0, 0, 1, 1,
0.3185742, -1.135161, 4.850173, 0, 0, 0, 1, 1,
0.3208368, 1.596033, 1.57668, 0, 0, 0, 1, 1,
0.3259245, 0.09959409, 1.417446, 1, 1, 1, 1, 1,
0.3268414, 0.8608848, -0.1572859, 1, 1, 1, 1, 1,
0.328379, 0.04454734, 3.092112, 1, 1, 1, 1, 1,
0.3297474, -0.841397, 2.217771, 1, 1, 1, 1, 1,
0.3327159, 0.278703, 0.8434907, 1, 1, 1, 1, 1,
0.3328111, -0.7344638, 1.465371, 1, 1, 1, 1, 1,
0.3381141, 1.10258, 0.1200898, 1, 1, 1, 1, 1,
0.3381968, -0.8674264, 3.129263, 1, 1, 1, 1, 1,
0.3389488, -0.9737294, 2.953437, 1, 1, 1, 1, 1,
0.3417262, -0.2097455, 1.792725, 1, 1, 1, 1, 1,
0.3457042, 0.1947077, 1.264692, 1, 1, 1, 1, 1,
0.3486758, -2.677547, 2.868685, 1, 1, 1, 1, 1,
0.3524866, 0.3199904, 1.057874, 1, 1, 1, 1, 1,
0.3526997, -0.02491044, 0.4634192, 1, 1, 1, 1, 1,
0.359534, 1.0871, 0.6988883, 1, 1, 1, 1, 1,
0.3615149, -1.509949, 2.022566, 0, 0, 1, 1, 1,
0.3635387, 2.013765, 0.2147033, 1, 0, 0, 1, 1,
0.3641134, -0.2855263, 2.328091, 1, 0, 0, 1, 1,
0.3663882, 0.5198472, 2.038038, 1, 0, 0, 1, 1,
0.3702891, 1.326895, 0.9459171, 1, 0, 0, 1, 1,
0.3743174, 1.216043, 0.2649729, 1, 0, 0, 1, 1,
0.3743655, -0.1543652, 0.5655299, 0, 0, 0, 1, 1,
0.3770242, 0.9787245, 0.4792262, 0, 0, 0, 1, 1,
0.3771783, 0.5760735, -0.6584438, 0, 0, 0, 1, 1,
0.3789228, -0.551734, 2.803433, 0, 0, 0, 1, 1,
0.3808402, 0.4393083, 0.9632024, 0, 0, 0, 1, 1,
0.3820773, -1.713355, 2.582464, 0, 0, 0, 1, 1,
0.3827829, -1.844731, 2.703171, 0, 0, 0, 1, 1,
0.383551, 0.3291716, 0.8063689, 1, 1, 1, 1, 1,
0.3842403, 0.5709597, 0.83998, 1, 1, 1, 1, 1,
0.3857635, -0.04067143, 2.708882, 1, 1, 1, 1, 1,
0.3886772, 0.6433156, -0.2078227, 1, 1, 1, 1, 1,
0.389628, 0.5699664, 1.089704, 1, 1, 1, 1, 1,
0.3909472, 1.790591, -0.3512069, 1, 1, 1, 1, 1,
0.3962766, 0.007152736, -0.8238313, 1, 1, 1, 1, 1,
0.4012257, -0.5596282, 3.08023, 1, 1, 1, 1, 1,
0.4022092, -0.06116943, 0.573659, 1, 1, 1, 1, 1,
0.4051596, -2.237281, 0.6117921, 1, 1, 1, 1, 1,
0.4087219, -2.234233, 1.882575, 1, 1, 1, 1, 1,
0.4115514, -2.239186, 2.078728, 1, 1, 1, 1, 1,
0.415397, -1.71305, 4.912049, 1, 1, 1, 1, 1,
0.4172001, 1.334347, 0.04128925, 1, 1, 1, 1, 1,
0.4180736, -1.657251, 0.9561866, 1, 1, 1, 1, 1,
0.4201086, -0.8207554, 2.030454, 0, 0, 1, 1, 1,
0.4206443, 0.3589269, 1.653396, 1, 0, 0, 1, 1,
0.421716, -0.4038814, 4.484256, 1, 0, 0, 1, 1,
0.4232123, 0.2214995, 2.867531, 1, 0, 0, 1, 1,
0.4263997, 0.259886, -1.844953, 1, 0, 0, 1, 1,
0.4276179, 0.6903108, 2.910428, 1, 0, 0, 1, 1,
0.4325216, -0.4460438, 2.953056, 0, 0, 0, 1, 1,
0.4379285, -1.446939, 3.061985, 0, 0, 0, 1, 1,
0.4404125, -0.291243, 1.478976, 0, 0, 0, 1, 1,
0.4414887, 0.2769606, 1.249536, 0, 0, 0, 1, 1,
0.4430377, 0.3197079, 1.693395, 0, 0, 0, 1, 1,
0.4430682, 1.825008, 1.022748, 0, 0, 0, 1, 1,
0.4481783, -1.393165, 3.816311, 0, 0, 0, 1, 1,
0.4514755, 0.3747026, 1.5481, 1, 1, 1, 1, 1,
0.4516239, -0.78826, 1.754868, 1, 1, 1, 1, 1,
0.4519585, 0.2147023, -0.1383615, 1, 1, 1, 1, 1,
0.4532437, -1.586468, 3.933942, 1, 1, 1, 1, 1,
0.4591542, -0.7807976, 3.184417, 1, 1, 1, 1, 1,
0.4601708, -0.2660139, 1.972478, 1, 1, 1, 1, 1,
0.4640241, 0.699598, 0.07538841, 1, 1, 1, 1, 1,
0.4644012, -0.3710037, 1.540341, 1, 1, 1, 1, 1,
0.4678155, 1.045129, 0.1591084, 1, 1, 1, 1, 1,
0.4678688, 1.644771, 0.9175903, 1, 1, 1, 1, 1,
0.4707392, -0.2429833, 1.749923, 1, 1, 1, 1, 1,
0.4722277, -1.2008, 2.321474, 1, 1, 1, 1, 1,
0.472891, 0.1528844, -0.5692653, 1, 1, 1, 1, 1,
0.4795996, -0.4089558, 2.585981, 1, 1, 1, 1, 1,
0.4822983, -0.4765898, 1.103456, 1, 1, 1, 1, 1,
0.4823015, 1.423336, 0.3395013, 0, 0, 1, 1, 1,
0.4829021, -0.4342906, 2.234468, 1, 0, 0, 1, 1,
0.4833885, 0.5913861, 0.5287336, 1, 0, 0, 1, 1,
0.4872628, 0.7156452, -0.8915226, 1, 0, 0, 1, 1,
0.4900134, -0.6408407, 2.991224, 1, 0, 0, 1, 1,
0.4932992, -0.4700602, 3.051427, 1, 0, 0, 1, 1,
0.4983588, -0.5040901, 3.152051, 0, 0, 0, 1, 1,
0.4997149, -0.2830224, 0.8199219, 0, 0, 0, 1, 1,
0.5002337, -1.759682, 3.73998, 0, 0, 0, 1, 1,
0.5005642, -2.457325, 2.9357, 0, 0, 0, 1, 1,
0.5020876, -0.04205618, 1.386634, 0, 0, 0, 1, 1,
0.5044152, -1.061958, 3.784708, 0, 0, 0, 1, 1,
0.5047722, 0.3613994, 0.9221855, 0, 0, 0, 1, 1,
0.5049041, 1.171551, 2.162119, 1, 1, 1, 1, 1,
0.5078795, -1.204952, 3.443077, 1, 1, 1, 1, 1,
0.5111576, -1.706623, 0.9922121, 1, 1, 1, 1, 1,
0.5136998, 1.423357, 1.071637, 1, 1, 1, 1, 1,
0.5138162, 0.5989245, 0.3471447, 1, 1, 1, 1, 1,
0.5164964, -1.911533, 3.174602, 1, 1, 1, 1, 1,
0.5166456, 0.1038464, 2.317116, 1, 1, 1, 1, 1,
0.5193318, 0.6490948, -0.1193561, 1, 1, 1, 1, 1,
0.5230664, -0.6479723, 1.513996, 1, 1, 1, 1, 1,
0.5343114, 0.5400837, 0.6833888, 1, 1, 1, 1, 1,
0.5363857, -2.588405, 2.149413, 1, 1, 1, 1, 1,
0.5465372, -0.1202676, 2.947124, 1, 1, 1, 1, 1,
0.5503849, 1.017157, -0.04271149, 1, 1, 1, 1, 1,
0.5507753, -0.2219057, 3.360669, 1, 1, 1, 1, 1,
0.5529138, 0.4668926, 0.7805493, 1, 1, 1, 1, 1,
0.5549888, -0.8223539, 2.887416, 0, 0, 1, 1, 1,
0.5555765, -0.4876085, 3.106495, 1, 0, 0, 1, 1,
0.5616913, 1.7809, 0.9171535, 1, 0, 0, 1, 1,
0.5623339, -0.2847007, 3.67408, 1, 0, 0, 1, 1,
0.5667938, 0.5883322, 1.482088, 1, 0, 0, 1, 1,
0.5736796, -0.6140392, 2.632849, 1, 0, 0, 1, 1,
0.574054, -0.2121671, 1.481622, 0, 0, 0, 1, 1,
0.5748262, -0.8040449, 2.560636, 0, 0, 0, 1, 1,
0.5759076, 0.7279497, 0.8262462, 0, 0, 0, 1, 1,
0.5764496, -0.3871694, 1.241238, 0, 0, 0, 1, 1,
0.5792974, 0.3195703, 1.330083, 0, 0, 0, 1, 1,
0.581296, -0.04430027, 1.218968, 0, 0, 0, 1, 1,
0.5840539, 0.002358001, 2.6514, 0, 0, 0, 1, 1,
0.5919729, 0.2067634, 1.633545, 1, 1, 1, 1, 1,
0.5920157, -0.2595288, 2.110633, 1, 1, 1, 1, 1,
0.5930632, -0.9100721, 0.7033417, 1, 1, 1, 1, 1,
0.5951176, -0.825905, 4.535161, 1, 1, 1, 1, 1,
0.5958018, 0.2413005, 1.322542, 1, 1, 1, 1, 1,
0.5959973, 2.030894, 1.466612, 1, 1, 1, 1, 1,
0.5985991, -0.1942662, 2.272125, 1, 1, 1, 1, 1,
0.6022037, 0.005016381, 0.8903397, 1, 1, 1, 1, 1,
0.6046183, 1.57704, -0.7323078, 1, 1, 1, 1, 1,
0.6065159, 0.480017, 1.612359, 1, 1, 1, 1, 1,
0.6076416, -0.9278605, 2.579614, 1, 1, 1, 1, 1,
0.6102954, -0.6205754, 1.941405, 1, 1, 1, 1, 1,
0.6133885, 1.012486, 0.1553064, 1, 1, 1, 1, 1,
0.6151323, -0.5037984, 3.282147, 1, 1, 1, 1, 1,
0.6169583, 1.043882, -1.330825, 1, 1, 1, 1, 1,
0.6180234, -0.3831657, 3.293235, 0, 0, 1, 1, 1,
0.6292241, -0.2889654, 0.8055819, 1, 0, 0, 1, 1,
0.6340533, 1.507503, 0.4994959, 1, 0, 0, 1, 1,
0.6379845, 0.1397984, 0.8942412, 1, 0, 0, 1, 1,
0.64211, -0.5380514, 2.460863, 1, 0, 0, 1, 1,
0.6454092, -0.8032492, 2.855532, 1, 0, 0, 1, 1,
0.6559114, 0.8859859, 0.7510124, 0, 0, 0, 1, 1,
0.6574441, 0.860037, 0.9599919, 0, 0, 0, 1, 1,
0.6597458, -0.08135857, 2.646386, 0, 0, 0, 1, 1,
0.6619556, -0.4271215, 1.725428, 0, 0, 0, 1, 1,
0.6622509, -1.682238, 2.764694, 0, 0, 0, 1, 1,
0.6640826, -0.5441704, 0.3949549, 0, 0, 0, 1, 1,
0.6645404, 0.6915861, -0.9050884, 0, 0, 0, 1, 1,
0.6668985, -0.1279372, 1.938354, 1, 1, 1, 1, 1,
0.6694365, 0.171052, 0.3575161, 1, 1, 1, 1, 1,
0.6731979, -2.356409, 2.393562, 1, 1, 1, 1, 1,
0.674937, 0.7921047, 2.440325, 1, 1, 1, 1, 1,
0.6757609, -2.490059, 4.84911, 1, 1, 1, 1, 1,
0.676488, 0.01507365, -0.7295309, 1, 1, 1, 1, 1,
0.6811771, 0.9549006, -0.4907385, 1, 1, 1, 1, 1,
0.6859497, -0.4870251, 2.529805, 1, 1, 1, 1, 1,
0.6905047, -1.115196, 2.982494, 1, 1, 1, 1, 1,
0.6991401, 0.9106218, 0.006440937, 1, 1, 1, 1, 1,
0.7007942, 0.4938515, 0.184285, 1, 1, 1, 1, 1,
0.7038806, -2.192441, 3.576496, 1, 1, 1, 1, 1,
0.707388, 1.464075, -1.27304, 1, 1, 1, 1, 1,
0.7098342, -1.570249, 2.324872, 1, 1, 1, 1, 1,
0.7169815, 1.23473, -1.328048, 1, 1, 1, 1, 1,
0.719835, 0.2501092, 0.9074199, 0, 0, 1, 1, 1,
0.7239599, 0.001069249, 1.571392, 1, 0, 0, 1, 1,
0.725433, -1.195262, 2.979701, 1, 0, 0, 1, 1,
0.7265821, -1.158098, 2.333127, 1, 0, 0, 1, 1,
0.7343768, 0.2172947, 1.818968, 1, 0, 0, 1, 1,
0.7441474, -0.3675871, 1.999966, 1, 0, 0, 1, 1,
0.7445232, -0.22516, 2.278902, 0, 0, 0, 1, 1,
0.755125, -0.03495401, 1.357846, 0, 0, 0, 1, 1,
0.7811088, 0.01074269, 1.093982, 0, 0, 0, 1, 1,
0.7827263, -1.151636, 3.334754, 0, 0, 0, 1, 1,
0.788626, -1.918639, 3.34771, 0, 0, 0, 1, 1,
0.7972233, -0.9039624, 3.671813, 0, 0, 0, 1, 1,
0.8031166, 0.1902515, 0.02002104, 0, 0, 0, 1, 1,
0.8082645, 1.790673, 0.5369478, 1, 1, 1, 1, 1,
0.8165054, -0.7200613, 1.873069, 1, 1, 1, 1, 1,
0.8187426, -1.606433, 2.623922, 1, 1, 1, 1, 1,
0.8227533, -1.073244, 1.572335, 1, 1, 1, 1, 1,
0.8232803, -2.274459, 2.63207, 1, 1, 1, 1, 1,
0.8282447, -0.4286555, 2.153576, 1, 1, 1, 1, 1,
0.8298311, 0.4183084, 0.1575139, 1, 1, 1, 1, 1,
0.8309037, -1.173107, 2.060778, 1, 1, 1, 1, 1,
0.8343862, -2.957883, 3.11504, 1, 1, 1, 1, 1,
0.8368173, 0.3119628, -0.4966518, 1, 1, 1, 1, 1,
0.8378342, 0.4418392, 0.8907063, 1, 1, 1, 1, 1,
0.8381836, -1.557745, 2.535812, 1, 1, 1, 1, 1,
0.8404812, -0.371443, 1.672004, 1, 1, 1, 1, 1,
0.8414346, 0.9821634, 2.498662, 1, 1, 1, 1, 1,
0.8455084, -0.2762794, 1.29755, 1, 1, 1, 1, 1,
0.8486261, -0.08376286, 1.680066, 0, 0, 1, 1, 1,
0.85049, 0.3504787, 0.6243331, 1, 0, 0, 1, 1,
0.8548384, 0.7554469, 0.2173613, 1, 0, 0, 1, 1,
0.8567645, -1.033144, 2.77031, 1, 0, 0, 1, 1,
0.8576579, -0.7866916, 2.194651, 1, 0, 0, 1, 1,
0.8594782, 1.003354, 1.466428, 1, 0, 0, 1, 1,
0.8607699, -0.06680947, 3.174967, 0, 0, 0, 1, 1,
0.8798521, 0.07714232, 2.208633, 0, 0, 0, 1, 1,
0.8810581, 0.6671132, 2.027759, 0, 0, 0, 1, 1,
0.8825771, -0.1822182, 2.084503, 0, 0, 0, 1, 1,
0.884702, 0.4955529, 1.527223, 0, 0, 0, 1, 1,
0.8851228, 0.4790508, 1.350697, 0, 0, 0, 1, 1,
0.8853769, -0.5737015, 3.507245, 0, 0, 0, 1, 1,
0.8909612, -0.2271101, 1.361611, 1, 1, 1, 1, 1,
0.9005514, -1.348074, 0.7229313, 1, 1, 1, 1, 1,
0.9020842, 0.9041072, 0.834274, 1, 1, 1, 1, 1,
0.9082484, 0.6068456, -0.4369913, 1, 1, 1, 1, 1,
0.9166005, -0.6978341, 1.267612, 1, 1, 1, 1, 1,
0.9234914, -0.1855527, 2.563082, 1, 1, 1, 1, 1,
0.9242293, -0.931191, 2.553211, 1, 1, 1, 1, 1,
0.9279456, 0.2699246, 0.4354112, 1, 1, 1, 1, 1,
0.9358302, 1.354353, 0.4053147, 1, 1, 1, 1, 1,
0.9364344, -2.217539, 2.786363, 1, 1, 1, 1, 1,
0.9394563, -1.535875, 1.493961, 1, 1, 1, 1, 1,
0.9417428, -1.922219, 3.254509, 1, 1, 1, 1, 1,
0.9430725, -0.06234981, 0.4082884, 1, 1, 1, 1, 1,
0.9464595, -0.326455, 2.367523, 1, 1, 1, 1, 1,
0.9524722, -0.174685, 4.04661, 1, 1, 1, 1, 1,
0.9575959, 1.407316, 0.4597816, 0, 0, 1, 1, 1,
0.973636, -0.7995731, 1.825178, 1, 0, 0, 1, 1,
0.9753269, -0.9916009, 1.344457, 1, 0, 0, 1, 1,
0.9916224, -0.7778149, 2.564901, 1, 0, 0, 1, 1,
0.9949184, 0.8953174, -0.6184918, 1, 0, 0, 1, 1,
0.9963166, 0.7224258, -0.854818, 1, 0, 0, 1, 1,
1.000976, -0.3636646, 1.459687, 0, 0, 0, 1, 1,
1.001804, 0.2022789, 1.71881, 0, 0, 0, 1, 1,
1.009807, -0.7605768, 0.8070853, 0, 0, 0, 1, 1,
1.012101, -0.3618412, 2.153417, 0, 0, 0, 1, 1,
1.017739, 1.851982, 0.5458892, 0, 0, 0, 1, 1,
1.018594, -3.85204, 2.22117, 0, 0, 0, 1, 1,
1.026683, 1.174044, -0.3908814, 0, 0, 0, 1, 1,
1.028321, 0.2558147, 0.6490372, 1, 1, 1, 1, 1,
1.034276, 0.4360682, 2.772611, 1, 1, 1, 1, 1,
1.038616, -0.284677, 0.02474401, 1, 1, 1, 1, 1,
1.040547, 0.5490692, 1.785619, 1, 1, 1, 1, 1,
1.04637, 0.8437371, 0.9260812, 1, 1, 1, 1, 1,
1.054928, -0.6291911, 3.556665, 1, 1, 1, 1, 1,
1.063367, 0.6076583, 2.400173, 1, 1, 1, 1, 1,
1.06979, -0.07004433, 4.163591, 1, 1, 1, 1, 1,
1.070058, 1.162743, 0.534355, 1, 1, 1, 1, 1,
1.076651, -1.922227, 3.390484, 1, 1, 1, 1, 1,
1.079241, -0.2161893, 1.607805, 1, 1, 1, 1, 1,
1.082395, 0.436465, 0.9216843, 1, 1, 1, 1, 1,
1.090349, -0.4350305, 2.979066, 1, 1, 1, 1, 1,
1.103118, -0.1049996, 1.049962, 1, 1, 1, 1, 1,
1.125281, 0.9254059, 1.340527, 1, 1, 1, 1, 1,
1.134571, 0.6702521, -0.8393997, 0, 0, 1, 1, 1,
1.138569, -0.0843756, 1.382561, 1, 0, 0, 1, 1,
1.13858, 1.882525, -0.3241962, 1, 0, 0, 1, 1,
1.142706, -0.2160764, 0.3210452, 1, 0, 0, 1, 1,
1.142825, 1.067931, 2.190682, 1, 0, 0, 1, 1,
1.147377, 0.7284238, 1.316421, 1, 0, 0, 1, 1,
1.150888, 1.215344, 0.1903132, 0, 0, 0, 1, 1,
1.163417, -2.116474, 2.841944, 0, 0, 0, 1, 1,
1.164885, 0.4247375, 0.55058, 0, 0, 0, 1, 1,
1.166661, 2.246584, -0.7646314, 0, 0, 0, 1, 1,
1.166727, -0.0554238, 3.238601, 0, 0, 0, 1, 1,
1.174769, -0.7489626, 2.153773, 0, 0, 0, 1, 1,
1.18043, 0.6421567, 1.290007, 0, 0, 0, 1, 1,
1.182298, 0.3060555, 1.121507, 1, 1, 1, 1, 1,
1.184606, -0.02024076, -0.2262008, 1, 1, 1, 1, 1,
1.187055, 1.513838, -0.2750395, 1, 1, 1, 1, 1,
1.199666, 2.99928, -0.9723128, 1, 1, 1, 1, 1,
1.201741, 1.751544, 1.3309, 1, 1, 1, 1, 1,
1.209193, -0.7861975, 0.7333214, 1, 1, 1, 1, 1,
1.218112, 0.3739274, 3.343591, 1, 1, 1, 1, 1,
1.237044, -1.074733, 2.40959, 1, 1, 1, 1, 1,
1.239262, -0.8140534, 0.8424675, 1, 1, 1, 1, 1,
1.244382, 0.7612456, 2.139255, 1, 1, 1, 1, 1,
1.245232, 1.921488, 1.281896, 1, 1, 1, 1, 1,
1.258059, -0.3322742, 2.384929, 1, 1, 1, 1, 1,
1.263489, -2.577591, 2.357964, 1, 1, 1, 1, 1,
1.269089, -1.437507, 1.269085, 1, 1, 1, 1, 1,
1.27381, 0.0384208, -0.01280395, 1, 1, 1, 1, 1,
1.275351, 0.9110126, -0.4202842, 0, 0, 1, 1, 1,
1.281015, -2.422212, 2.173684, 1, 0, 0, 1, 1,
1.287318, 1.161302, 1.009797, 1, 0, 0, 1, 1,
1.291474, 1.020725, 1.181173, 1, 0, 0, 1, 1,
1.297665, -0.2769351, 2.254415, 1, 0, 0, 1, 1,
1.298982, -0.1626995, 2.590967, 1, 0, 0, 1, 1,
1.299018, 0.1717583, 0.7698432, 0, 0, 0, 1, 1,
1.330438, 0.4710048, 1.82155, 0, 0, 0, 1, 1,
1.333006, 0.9583536, -0.4508264, 0, 0, 0, 1, 1,
1.333013, 0.3623598, 2.160973, 0, 0, 0, 1, 1,
1.334244, 0.1066921, 0.5848054, 0, 0, 0, 1, 1,
1.339515, 1.556773, 0.8532364, 0, 0, 0, 1, 1,
1.34257, 0.3530704, 1.315016, 0, 0, 0, 1, 1,
1.347058, -0.1658823, 0.8361366, 1, 1, 1, 1, 1,
1.357028, 0.005963591, 1.151279, 1, 1, 1, 1, 1,
1.357366, 0.6453636, 1.549369, 1, 1, 1, 1, 1,
1.363444, -0.4731012, 1.383091, 1, 1, 1, 1, 1,
1.364029, -0.2807099, 3.11113, 1, 1, 1, 1, 1,
1.36795, 0.6311918, 2.13307, 1, 1, 1, 1, 1,
1.368578, 1.023989, 1.846648, 1, 1, 1, 1, 1,
1.376765, -1.944368, 2.391361, 1, 1, 1, 1, 1,
1.396844, -1.14199, 2.521712, 1, 1, 1, 1, 1,
1.399723, -1.166338, 2.000596, 1, 1, 1, 1, 1,
1.402707, -0.617168, 1.363941, 1, 1, 1, 1, 1,
1.403466, 0.8048146, 1.318241, 1, 1, 1, 1, 1,
1.408209, 1.538121, -0.6259839, 1, 1, 1, 1, 1,
1.411694, 0.3871982, 2.546653, 1, 1, 1, 1, 1,
1.412902, -0.7982163, 3.192999, 1, 1, 1, 1, 1,
1.413224, 0.9593779, 0.4923899, 0, 0, 1, 1, 1,
1.417154, -0.2446592, 1.441293, 1, 0, 0, 1, 1,
1.425501, -1.578331, 1.152061, 1, 0, 0, 1, 1,
1.426532, -0.3989875, 1.303503, 1, 0, 0, 1, 1,
1.436563, 0.4730758, -1.932919, 1, 0, 0, 1, 1,
1.441236, 0.3427937, 1.75997, 1, 0, 0, 1, 1,
1.442519, -0.3357305, 2.200322, 0, 0, 0, 1, 1,
1.442866, 1.304469, 0.4102308, 0, 0, 0, 1, 1,
1.450136, 0.3418986, 1.22244, 0, 0, 0, 1, 1,
1.456499, 0.5711293, 1.243585, 0, 0, 0, 1, 1,
1.459318, -1.62373, 2.247746, 0, 0, 0, 1, 1,
1.493455, 0.03421373, 1.813752, 0, 0, 0, 1, 1,
1.505327, 0.003854805, 1.517852, 0, 0, 0, 1, 1,
1.507112, -0.5545352, 1.932939, 1, 1, 1, 1, 1,
1.512169, -1.42045, 1.596324, 1, 1, 1, 1, 1,
1.521502, 0.974341, 1.060524, 1, 1, 1, 1, 1,
1.527136, -1.505457, 2.519147, 1, 1, 1, 1, 1,
1.541106, -1.055047, 2.186661, 1, 1, 1, 1, 1,
1.54244, 0.7183714, 0.5789135, 1, 1, 1, 1, 1,
1.545836, 1.193314, 1.20736, 1, 1, 1, 1, 1,
1.546409, -1.055495, 2.577995, 1, 1, 1, 1, 1,
1.573448, -0.3341689, 2.731327, 1, 1, 1, 1, 1,
1.5778, -1.029129, 2.399535, 1, 1, 1, 1, 1,
1.580074, 1.39073, 1.489182, 1, 1, 1, 1, 1,
1.605188, 1.323285, 1.281476, 1, 1, 1, 1, 1,
1.620845, -0.5397348, 0.9996217, 1, 1, 1, 1, 1,
1.635709, -0.6804098, 1.079201, 1, 1, 1, 1, 1,
1.642846, 1.557427, 1.431302, 1, 1, 1, 1, 1,
1.644768, 0.4705122, 1.552231, 0, 0, 1, 1, 1,
1.646555, -0.00312254, 0.2060519, 1, 0, 0, 1, 1,
1.649607, 0.233779, 2.28111, 1, 0, 0, 1, 1,
1.664799, -0.06706896, 1.884605, 1, 0, 0, 1, 1,
1.709293, -0.9471691, 3.037078, 1, 0, 0, 1, 1,
1.733672, -0.7080274, 2.843202, 1, 0, 0, 1, 1,
1.738143, 0.5913536, -0.5143129, 0, 0, 0, 1, 1,
1.750533, 0.306751, 2.269807, 0, 0, 0, 1, 1,
1.77178, 0.4233108, -1.04712, 0, 0, 0, 1, 1,
1.813065, -1.050553, 3.072496, 0, 0, 0, 1, 1,
1.845358, -0.03578753, 1.361631, 0, 0, 0, 1, 1,
1.856256, 0.3450629, 2.187057, 0, 0, 0, 1, 1,
1.880247, 0.9468256, 1.138267, 0, 0, 0, 1, 1,
1.889356, -1.330083, 2.090156, 1, 1, 1, 1, 1,
1.902949, -0.02780282, 1.40258, 1, 1, 1, 1, 1,
1.918839, 0.1365307, 2.543295, 1, 1, 1, 1, 1,
1.96702, -0.7448664, 2.659268, 1, 1, 1, 1, 1,
1.978579, 0.1678847, 1.452697, 1, 1, 1, 1, 1,
1.981371, 0.8044288, 0.1638062, 1, 1, 1, 1, 1,
2.001266, 0.4130597, 0.5770856, 1, 1, 1, 1, 1,
2.029096, -2.040305, 1.596579, 1, 1, 1, 1, 1,
2.045566, 1.5889, -1.248, 1, 1, 1, 1, 1,
2.072104, 0.5485021, 1.215045, 1, 1, 1, 1, 1,
2.09242, -0.165893, 1.200202, 1, 1, 1, 1, 1,
2.116076, -0.662295, 0.2623642, 1, 1, 1, 1, 1,
2.134776, -1.183744, 0.7675154, 1, 1, 1, 1, 1,
2.141078, 0.9668179, 0.1364933, 1, 1, 1, 1, 1,
2.145094, 0.02065558, 0.463045, 1, 1, 1, 1, 1,
2.169254, 1.831969, 0.4192005, 0, 0, 1, 1, 1,
2.207488, -0.07348827, 1.459511, 1, 0, 0, 1, 1,
2.256375, -1.114567, 1.248259, 1, 0, 0, 1, 1,
2.275489, -1.001706, 2.053366, 1, 0, 0, 1, 1,
2.327313, 0.5518674, -1.121791, 1, 0, 0, 1, 1,
2.33655, -0.966212, 1.205248, 1, 0, 0, 1, 1,
2.346476, 1.98651, 1.137536, 0, 0, 0, 1, 1,
2.36456, -1.28425, 4.335828, 0, 0, 0, 1, 1,
2.40734, 1.553489, -0.07466225, 0, 0, 0, 1, 1,
2.453944, 0.1593193, 1.137784, 0, 0, 0, 1, 1,
2.456807, -0.10478, -0.6120206, 0, 0, 0, 1, 1,
2.508415, -0.4988858, 2.044089, 0, 0, 0, 1, 1,
2.56422, 0.04248756, 1.299533, 0, 0, 0, 1, 1,
2.675626, 0.6704301, 0.1531003, 1, 1, 1, 1, 1,
2.720783, -2.09115, 2.759277, 1, 1, 1, 1, 1,
2.767614, 1.48029, 1.126387, 1, 1, 1, 1, 1,
2.769282, 0.3567039, 0.7069778, 1, 1, 1, 1, 1,
2.933309, 0.264564, 0.2364297, 1, 1, 1, 1, 1,
2.989129, -1.754999, 1.159882, 1, 1, 1, 1, 1,
3.500119, -0.5911693, 0.1058716, 1, 1, 1, 1, 1
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
var radius = 10.03263;
var distance = 35.23918;
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
mvMatrix.translate( -0.09551382, 0.3353872, -0.01389003 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.23918);
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
