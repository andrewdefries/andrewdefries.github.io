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
-3.331862, -0.4324597, -1.137119, 1, 0, 0, 1,
-3.235873, 1.187186, -2.191371, 1, 0.007843138, 0, 1,
-3.006175, -1.141748, -1.565351, 1, 0.01176471, 0, 1,
-2.997264, 0.9573249, 0.3815012, 1, 0.01960784, 0, 1,
-2.929447, -0.779416, -3.563038, 1, 0.02352941, 0, 1,
-2.629685, -0.6288559, -2.116664, 1, 0.03137255, 0, 1,
-2.320809, 1.309412, -1.355555, 1, 0.03529412, 0, 1,
-2.273001, 0.08514786, -0.8364094, 1, 0.04313726, 0, 1,
-2.271175, 1.326848, -1.735518, 1, 0.04705882, 0, 1,
-2.211373, 1.176138, -1.892365, 1, 0.05490196, 0, 1,
-2.1683, 0.8929437, -0.3874818, 1, 0.05882353, 0, 1,
-2.157881, -0.6977074, -0.4423134, 1, 0.06666667, 0, 1,
-2.133372, -0.06177158, -0.9438505, 1, 0.07058824, 0, 1,
-2.085127, 0.8393223, -0.8097426, 1, 0.07843138, 0, 1,
-2.078208, -0.2655478, -0.5876577, 1, 0.08235294, 0, 1,
-2.070629, 0.2195835, -1.059052, 1, 0.09019608, 0, 1,
-2.069649, 0.5645364, -1.461616, 1, 0.09411765, 0, 1,
-2.020827, -0.1245423, -2.589291, 1, 0.1019608, 0, 1,
-2.012224, -0.6841291, -1.718684, 1, 0.1098039, 0, 1,
-2.010328, -1.945949, -1.87179, 1, 0.1137255, 0, 1,
-1.973209, 0.6033272, -0.7024431, 1, 0.1215686, 0, 1,
-1.965322, -0.01902456, -3.193978, 1, 0.1254902, 0, 1,
-1.9611, -0.8160905, -2.100684, 1, 0.1333333, 0, 1,
-1.941451, -0.3093747, -2.765351, 1, 0.1372549, 0, 1,
-1.93875, 0.3031552, -1.505698, 1, 0.145098, 0, 1,
-1.935298, -0.7223569, 0.02051461, 1, 0.1490196, 0, 1,
-1.914893, 0.4050292, -2.732668, 1, 0.1568628, 0, 1,
-1.88077, -0.119562, -3.223879, 1, 0.1607843, 0, 1,
-1.866354, 1.012984, -0.3949905, 1, 0.1686275, 0, 1,
-1.844725, 0.2921208, -0.8556553, 1, 0.172549, 0, 1,
-1.769609, -0.6394265, -3.562175, 1, 0.1803922, 0, 1,
-1.737789, -0.7536083, -2.413897, 1, 0.1843137, 0, 1,
-1.709001, -0.487782, -3.419336, 1, 0.1921569, 0, 1,
-1.708883, -0.5247474, -2.173444, 1, 0.1960784, 0, 1,
-1.684381, 0.3993195, -1.386285, 1, 0.2039216, 0, 1,
-1.682652, 0.3568737, -2.168318, 1, 0.2117647, 0, 1,
-1.681334, 0.4180052, -0.6936548, 1, 0.2156863, 0, 1,
-1.645415, 0.8502749, -1.499901, 1, 0.2235294, 0, 1,
-1.638916, 0.4047561, -0.2684961, 1, 0.227451, 0, 1,
-1.629926, 0.04831343, -3.100507, 1, 0.2352941, 0, 1,
-1.625486, 1.410634, -0.3649698, 1, 0.2392157, 0, 1,
-1.618028, -0.02790217, -2.325265, 1, 0.2470588, 0, 1,
-1.615525, 1.363148, -1.182755, 1, 0.2509804, 0, 1,
-1.612735, -0.669787, -2.877864, 1, 0.2588235, 0, 1,
-1.586606, 0.6993102, -2.143911, 1, 0.2627451, 0, 1,
-1.581257, 0.7435969, -1.621961, 1, 0.2705882, 0, 1,
-1.573495, 0.8311207, -0.9679475, 1, 0.2745098, 0, 1,
-1.570976, 0.3359727, -0.8634514, 1, 0.282353, 0, 1,
-1.569048, -0.9282084, -0.2474252, 1, 0.2862745, 0, 1,
-1.567437, 0.2307833, -2.3621, 1, 0.2941177, 0, 1,
-1.558312, -0.3023455, -3.199346, 1, 0.3019608, 0, 1,
-1.537683, 0.9610366, -1.628865, 1, 0.3058824, 0, 1,
-1.525789, -0.07022195, -1.25095, 1, 0.3137255, 0, 1,
-1.521022, 1.678849, 0.4783973, 1, 0.3176471, 0, 1,
-1.516692, 0.004620305, -0.1753377, 1, 0.3254902, 0, 1,
-1.506042, 1.251761, -0.5849926, 1, 0.3294118, 0, 1,
-1.502866, -0.5215862, -1.610037, 1, 0.3372549, 0, 1,
-1.499851, 0.1452063, -2.305476, 1, 0.3411765, 0, 1,
-1.491819, -0.03219775, -1.556119, 1, 0.3490196, 0, 1,
-1.472985, -1.517149, -0.2463559, 1, 0.3529412, 0, 1,
-1.469015, -0.8470019, -3.179525, 1, 0.3607843, 0, 1,
-1.467208, -0.9066607, -2.095488, 1, 0.3647059, 0, 1,
-1.451744, -0.4249267, -1.767547, 1, 0.372549, 0, 1,
-1.444162, -0.698144, -1.698932, 1, 0.3764706, 0, 1,
-1.441647, 1.527036, 0.5237354, 1, 0.3843137, 0, 1,
-1.428901, -1.434246, -2.242736, 1, 0.3882353, 0, 1,
-1.425544, -0.008342929, -2.509969, 1, 0.3960784, 0, 1,
-1.423342, -1.616859, -1.820738, 1, 0.4039216, 0, 1,
-1.422032, 0.5617041, -1.421111, 1, 0.4078431, 0, 1,
-1.415477, 1.395408, -1.339848, 1, 0.4156863, 0, 1,
-1.387249, -1.489634, -3.844492, 1, 0.4196078, 0, 1,
-1.385228, 0.61471, -0.7127502, 1, 0.427451, 0, 1,
-1.377425, -1.033968, -0.3875901, 1, 0.4313726, 0, 1,
-1.374472, -0.9626734, -1.878926, 1, 0.4392157, 0, 1,
-1.367681, 1.441223, 0.4654474, 1, 0.4431373, 0, 1,
-1.366305, -0.1222162, -0.4659425, 1, 0.4509804, 0, 1,
-1.359501, 1.295032, -0.7587025, 1, 0.454902, 0, 1,
-1.356473, 0.2948692, 0.2223476, 1, 0.4627451, 0, 1,
-1.355967, 0.1273817, -1.602016, 1, 0.4666667, 0, 1,
-1.348346, 0.6841269, 0.7224188, 1, 0.4745098, 0, 1,
-1.343877, -0.4186804, -1.878108, 1, 0.4784314, 0, 1,
-1.333181, -1.598608, -2.83208, 1, 0.4862745, 0, 1,
-1.323937, -0.3985106, 0.6339383, 1, 0.4901961, 0, 1,
-1.311134, 3.027715, -0.6350898, 1, 0.4980392, 0, 1,
-1.307623, -0.30925, -1.813359, 1, 0.5058824, 0, 1,
-1.301825, 0.3548175, -2.496537, 1, 0.509804, 0, 1,
-1.290073, -0.1710224, -2.13233, 1, 0.5176471, 0, 1,
-1.28527, 0.0137911, -2.233578, 1, 0.5215687, 0, 1,
-1.277907, 1.372911, -0.5790241, 1, 0.5294118, 0, 1,
-1.276044, 0.8308214, -3.035093, 1, 0.5333334, 0, 1,
-1.267864, 1.037593, -1.880197, 1, 0.5411765, 0, 1,
-1.267161, 0.4973313, -0.6197361, 1, 0.5450981, 0, 1,
-1.259762, 0.4053149, -0.9356385, 1, 0.5529412, 0, 1,
-1.259587, -0.5712437, -1.587565, 1, 0.5568628, 0, 1,
-1.250503, -0.1430122, -2.618797, 1, 0.5647059, 0, 1,
-1.246539, 2.495663, -0.1812946, 1, 0.5686275, 0, 1,
-1.239955, -0.2591462, -2.537101, 1, 0.5764706, 0, 1,
-1.223441, 0.6881599, 2.401436, 1, 0.5803922, 0, 1,
-1.208526, -0.5787224, -0.7939027, 1, 0.5882353, 0, 1,
-1.202692, -0.2921585, -1.590162, 1, 0.5921569, 0, 1,
-1.195127, 1.191194, -2.399758, 1, 0.6, 0, 1,
-1.194875, -0.6039331, -2.053943, 1, 0.6078432, 0, 1,
-1.194533, 1.51161, 0.0252489, 1, 0.6117647, 0, 1,
-1.191219, -0.6429764, -3.782856, 1, 0.6196079, 0, 1,
-1.185627, 1.158052, -2.05858, 1, 0.6235294, 0, 1,
-1.146832, 1.511758, -0.6046556, 1, 0.6313726, 0, 1,
-1.140281, 0.04825905, -1.529819, 1, 0.6352941, 0, 1,
-1.123306, 0.07685668, -2.089232, 1, 0.6431373, 0, 1,
-1.119804, -0.7830473, -1.123782, 1, 0.6470588, 0, 1,
-1.118136, -0.1527875, -2.457858, 1, 0.654902, 0, 1,
-1.116125, 0.04021641, -1.604591, 1, 0.6588235, 0, 1,
-1.11463, 2.055037, 0.9593329, 1, 0.6666667, 0, 1,
-1.113496, 0.3494339, -2.960417, 1, 0.6705883, 0, 1,
-1.110065, -1.024658, -2.168725, 1, 0.6784314, 0, 1,
-1.107883, 0.87839, -1.823211, 1, 0.682353, 0, 1,
-1.10692, -2.024582, -1.643313, 1, 0.6901961, 0, 1,
-1.095574, -0.8109467, -2.516545, 1, 0.6941177, 0, 1,
-1.090881, -0.008576615, -3.442248, 1, 0.7019608, 0, 1,
-1.089606, 1.152846, -1.70298, 1, 0.7098039, 0, 1,
-1.089277, 0.2135246, -3.102274, 1, 0.7137255, 0, 1,
-1.081312, 0.4196039, -1.721499, 1, 0.7215686, 0, 1,
-1.079077, 1.678873, -0.3748533, 1, 0.7254902, 0, 1,
-1.078929, -1.250754, -1.49125, 1, 0.7333333, 0, 1,
-1.078719, -1.176108, -3.304177, 1, 0.7372549, 0, 1,
-1.077919, 0.2587466, -2.332502, 1, 0.7450981, 0, 1,
-1.072968, 0.2147929, -1.037476, 1, 0.7490196, 0, 1,
-1.072857, 0.1694753, -2.721437, 1, 0.7568628, 0, 1,
-1.061868, -0.03786995, -2.316026, 1, 0.7607843, 0, 1,
-1.05468, -0.2184938, -2.52115, 1, 0.7686275, 0, 1,
-1.04874, -0.2082682, -3.311643, 1, 0.772549, 0, 1,
-1.04722, 0.5406036, -1.85717, 1, 0.7803922, 0, 1,
-1.04238, 0.0004469806, -2.042305, 1, 0.7843137, 0, 1,
-1.030344, -0.5827902, -3.200084, 1, 0.7921569, 0, 1,
-1.029246, -0.06694887, -3.294196, 1, 0.7960784, 0, 1,
-1.018793, 1.251007, -0.2485183, 1, 0.8039216, 0, 1,
-1.016042, 0.3333057, -0.3403036, 1, 0.8117647, 0, 1,
-1.015391, 1.074825, -0.08864903, 1, 0.8156863, 0, 1,
-1.012929, 1.232285, -1.673208, 1, 0.8235294, 0, 1,
-1.010901, 0.5535107, -1.124415, 1, 0.827451, 0, 1,
-1.010254, 0.296937, -1.866286, 1, 0.8352941, 0, 1,
-1.009181, 0.8450008, -0.8212788, 1, 0.8392157, 0, 1,
-1.008632, -0.2589374, -0.3752899, 1, 0.8470588, 0, 1,
-1.007553, 0.8099241, -0.7362646, 1, 0.8509804, 0, 1,
-1.000407, -0.9432908, -3.147881, 1, 0.8588235, 0, 1,
-0.9993663, 1.101326, -2.556172, 1, 0.8627451, 0, 1,
-0.9948366, -0.8474201, -2.849233, 1, 0.8705882, 0, 1,
-0.9916031, 0.1153227, -1.602409, 1, 0.8745098, 0, 1,
-0.9884903, -0.8400084, -1.340568, 1, 0.8823529, 0, 1,
-0.9838461, 2.800654, -0.2588392, 1, 0.8862745, 0, 1,
-0.9768132, -0.1835408, -0.9703099, 1, 0.8941177, 0, 1,
-0.9695454, 0.1907119, -2.508013, 1, 0.8980392, 0, 1,
-0.9688451, -0.02211354, -1.586375, 1, 0.9058824, 0, 1,
-0.9652038, -1.293654, -3.077483, 1, 0.9137255, 0, 1,
-0.9632544, -0.09649454, -1.429625, 1, 0.9176471, 0, 1,
-0.9626843, -0.3939457, -1.42102, 1, 0.9254902, 0, 1,
-0.9612757, 0.1733813, 0.02555083, 1, 0.9294118, 0, 1,
-0.9605885, 1.942204, -1.759244, 1, 0.9372549, 0, 1,
-0.9598565, 1.170813, 1.462403, 1, 0.9411765, 0, 1,
-0.9562257, 1.363022, 0.1710545, 1, 0.9490196, 0, 1,
-0.950883, -0.3810914, -1.643595, 1, 0.9529412, 0, 1,
-0.9449584, 0.5013643, -1.982755, 1, 0.9607843, 0, 1,
-0.9400793, 0.3332027, 0.07675847, 1, 0.9647059, 0, 1,
-0.934106, 0.2039108, -0.326641, 1, 0.972549, 0, 1,
-0.9254467, 1.905674, -0.5491914, 1, 0.9764706, 0, 1,
-0.9178642, 1.473226, -2.088603, 1, 0.9843137, 0, 1,
-0.9154583, 1.462864, -0.3985777, 1, 0.9882353, 0, 1,
-0.9154537, -0.600733, -0.2776093, 1, 0.9960784, 0, 1,
-0.9083546, -0.46528, -0.8048618, 0.9960784, 1, 0, 1,
-0.8997949, 1.156538, -0.140169, 0.9921569, 1, 0, 1,
-0.8914578, -0.1329551, -3.04893, 0.9843137, 1, 0, 1,
-0.8843064, -0.6505488, -1.084471, 0.9803922, 1, 0, 1,
-0.8830426, 0.884711, -3.715413, 0.972549, 1, 0, 1,
-0.8777143, -0.1535697, -1.629917, 0.9686275, 1, 0, 1,
-0.877303, 0.1820306, -0.4425257, 0.9607843, 1, 0, 1,
-0.875589, -0.105586, -1.136805, 0.9568627, 1, 0, 1,
-0.8747955, 1.465125, -0.2975049, 0.9490196, 1, 0, 1,
-0.8725055, -1.184412, -3.05333, 0.945098, 1, 0, 1,
-0.8701919, -2.055222, -2.807844, 0.9372549, 1, 0, 1,
-0.8602247, 0.9455643, -1.818346, 0.9333333, 1, 0, 1,
-0.8593218, 1.073671, -0.4909989, 0.9254902, 1, 0, 1,
-0.8492191, -0.6452466, -2.487558, 0.9215686, 1, 0, 1,
-0.8474783, -1.813798, -3.014328, 0.9137255, 1, 0, 1,
-0.84633, 0.5380913, -1.070992, 0.9098039, 1, 0, 1,
-0.8385007, -0.915722, -0.05274549, 0.9019608, 1, 0, 1,
-0.8347203, -1.578101, -3.110537, 0.8941177, 1, 0, 1,
-0.8339186, 0.4589559, -0.06546177, 0.8901961, 1, 0, 1,
-0.8310271, -0.4804686, -1.184527, 0.8823529, 1, 0, 1,
-0.8263515, 2.235263, -0.03297945, 0.8784314, 1, 0, 1,
-0.8247092, 1.346266, 0.4013085, 0.8705882, 1, 0, 1,
-0.8233161, 0.6429783, -1.043816, 0.8666667, 1, 0, 1,
-0.8202447, 0.5533522, -2.351503, 0.8588235, 1, 0, 1,
-0.8183202, -0.07743056, 0.0268991, 0.854902, 1, 0, 1,
-0.8178689, 0.3361358, -1.270069, 0.8470588, 1, 0, 1,
-0.8177839, 0.7726097, -2.202809, 0.8431373, 1, 0, 1,
-0.8165883, -1.934122, -2.525807, 0.8352941, 1, 0, 1,
-0.8047565, -0.5352004, -0.5882841, 0.8313726, 1, 0, 1,
-0.8034747, -0.07487486, -1.6312, 0.8235294, 1, 0, 1,
-0.8033186, -0.8363823, -2.221188, 0.8196079, 1, 0, 1,
-0.8022308, -0.605785, -0.3586187, 0.8117647, 1, 0, 1,
-0.7998535, 1.153645, -0.8410174, 0.8078431, 1, 0, 1,
-0.7946938, 0.9927323, 0.1542389, 0.8, 1, 0, 1,
-0.7879879, 0.09441169, -0.9111063, 0.7921569, 1, 0, 1,
-0.7830904, 1.964115, -0.6614541, 0.7882353, 1, 0, 1,
-0.7823704, -0.7593533, -3.385839, 0.7803922, 1, 0, 1,
-0.7774712, 0.6244025, -1.058808, 0.7764706, 1, 0, 1,
-0.7725112, -0.2742347, -1.114387, 0.7686275, 1, 0, 1,
-0.7709267, 1.571379, -0.3199592, 0.7647059, 1, 0, 1,
-0.7705835, 0.2954791, -0.2566157, 0.7568628, 1, 0, 1,
-0.7674217, -0.718665, -1.832486, 0.7529412, 1, 0, 1,
-0.7670501, 0.6873081, -1.885771, 0.7450981, 1, 0, 1,
-0.7640313, -0.03007662, -1.419812, 0.7411765, 1, 0, 1,
-0.7614876, 0.04407867, -1.550656, 0.7333333, 1, 0, 1,
-0.7611361, 2.015672, -1.033838, 0.7294118, 1, 0, 1,
-0.7540951, 0.3784753, -1.011032, 0.7215686, 1, 0, 1,
-0.7535427, 0.8088261, -2.796388, 0.7176471, 1, 0, 1,
-0.7517174, 0.5496573, -1.003155, 0.7098039, 1, 0, 1,
-0.7449305, 0.3706662, -0.3060316, 0.7058824, 1, 0, 1,
-0.7433788, -0.76015, -2.043735, 0.6980392, 1, 0, 1,
-0.7390403, 0.05872285, -1.085365, 0.6901961, 1, 0, 1,
-0.7259501, 1.12433, -0.7500713, 0.6862745, 1, 0, 1,
-0.7247087, -0.1758632, -1.998244, 0.6784314, 1, 0, 1,
-0.7236518, -0.102929, -2.099753, 0.6745098, 1, 0, 1,
-0.7234893, 0.1620063, -1.307083, 0.6666667, 1, 0, 1,
-0.7164006, 0.4793957, -0.1485212, 0.6627451, 1, 0, 1,
-0.7137986, -0.5227975, -2.733547, 0.654902, 1, 0, 1,
-0.7118511, 1.605387, 1.474654, 0.6509804, 1, 0, 1,
-0.7098523, -0.6134751, -2.331089, 0.6431373, 1, 0, 1,
-0.706687, -0.03989031, -2.958064, 0.6392157, 1, 0, 1,
-0.6943232, 0.2423758, -0.8896126, 0.6313726, 1, 0, 1,
-0.6889114, 0.8210996, -2.148182, 0.627451, 1, 0, 1,
-0.6881756, 0.1431149, -1.777038, 0.6196079, 1, 0, 1,
-0.6829422, 1.568871, 0.8354136, 0.6156863, 1, 0, 1,
-0.677403, 0.2786043, -2.613902, 0.6078432, 1, 0, 1,
-0.6690422, -1.106189, -4.005271, 0.6039216, 1, 0, 1,
-0.6673058, 0.5437405, -0.9256157, 0.5960785, 1, 0, 1,
-0.6579052, -0.6157264, -1.949879, 0.5882353, 1, 0, 1,
-0.6557186, 0.1354338, -1.495574, 0.5843138, 1, 0, 1,
-0.6551935, 0.353375, -0.785679, 0.5764706, 1, 0, 1,
-0.6539082, -0.1885172, -2.024447, 0.572549, 1, 0, 1,
-0.6471294, 1.832477, -1.446575, 0.5647059, 1, 0, 1,
-0.6441525, 0.5287166, 0.512368, 0.5607843, 1, 0, 1,
-0.6417933, 1.598702, -0.0181319, 0.5529412, 1, 0, 1,
-0.6406593, -0.0326509, -3.095192, 0.5490196, 1, 0, 1,
-0.6326993, -0.6142141, -2.456822, 0.5411765, 1, 0, 1,
-0.6314406, 2.170978, 2.122639, 0.5372549, 1, 0, 1,
-0.6296398, -0.3779511, -2.812274, 0.5294118, 1, 0, 1,
-0.6283198, 0.4611931, -1.800014, 0.5254902, 1, 0, 1,
-0.6259653, -0.2224509, -1.289821, 0.5176471, 1, 0, 1,
-0.622748, -1.531931, -4.102759, 0.5137255, 1, 0, 1,
-0.6134297, -2.479125, -3.554852, 0.5058824, 1, 0, 1,
-0.6125493, -1.32196, -3.264838, 0.5019608, 1, 0, 1,
-0.6086184, 0.01602774, -1.948786, 0.4941176, 1, 0, 1,
-0.6086116, -0.582584, -1.575313, 0.4862745, 1, 0, 1,
-0.6085811, 0.2689869, 0.5072556, 0.4823529, 1, 0, 1,
-0.6084884, -0.8426765, -1.903177, 0.4745098, 1, 0, 1,
-0.5994657, -1.270443, -3.534873, 0.4705882, 1, 0, 1,
-0.5991955, -0.8394279, -1.983665, 0.4627451, 1, 0, 1,
-0.5986568, 0.265339, -1.340187, 0.4588235, 1, 0, 1,
-0.5979397, -1.39716, -2.210358, 0.4509804, 1, 0, 1,
-0.596759, 0.2513456, -1.6019, 0.4470588, 1, 0, 1,
-0.5874681, 0.1621419, -1.452979, 0.4392157, 1, 0, 1,
-0.5816641, 0.06751592, -1.53831, 0.4352941, 1, 0, 1,
-0.5800036, 1.292207, -0.386418, 0.427451, 1, 0, 1,
-0.5780644, 0.5900939, 1.359555, 0.4235294, 1, 0, 1,
-0.5729315, -0.9127311, -2.041223, 0.4156863, 1, 0, 1,
-0.5693547, 0.07640339, 0.7585827, 0.4117647, 1, 0, 1,
-0.5684902, 0.3973571, -1.053771, 0.4039216, 1, 0, 1,
-0.566823, 0.1641633, -2.294559, 0.3960784, 1, 0, 1,
-0.5661973, 1.27527, -0.6565451, 0.3921569, 1, 0, 1,
-0.5621058, 1.064878, 0.3039781, 0.3843137, 1, 0, 1,
-0.5587581, 0.7477994, -1.087716, 0.3803922, 1, 0, 1,
-0.5551471, -0.8023914, -3.168854, 0.372549, 1, 0, 1,
-0.5530799, -0.9126974, -2.808209, 0.3686275, 1, 0, 1,
-0.5527059, -0.4090068, -3.102097, 0.3607843, 1, 0, 1,
-0.550378, 1.075055, -0.4617073, 0.3568628, 1, 0, 1,
-0.5499052, 1.341775, -0.7521542, 0.3490196, 1, 0, 1,
-0.5465461, 0.1929841, -1.565805, 0.345098, 1, 0, 1,
-0.544044, 0.04277064, -0.5263894, 0.3372549, 1, 0, 1,
-0.5408232, -0.02912087, -2.182329, 0.3333333, 1, 0, 1,
-0.5321823, -0.4696641, -2.164942, 0.3254902, 1, 0, 1,
-0.5223053, -0.5632224, -2.869615, 0.3215686, 1, 0, 1,
-0.5186998, 0.4736192, 1.045267, 0.3137255, 1, 0, 1,
-0.5148823, -1.262903, -2.167553, 0.3098039, 1, 0, 1,
-0.4998657, -1.215377, -3.531233, 0.3019608, 1, 0, 1,
-0.4981202, -0.889334, -2.132189, 0.2941177, 1, 0, 1,
-0.4967853, -0.8847435, -2.517867, 0.2901961, 1, 0, 1,
-0.4955471, 0.4868177, -0.2648772, 0.282353, 1, 0, 1,
-0.4938571, 1.563887, -2.650365, 0.2784314, 1, 0, 1,
-0.4937586, -0.7596766, -3.21029, 0.2705882, 1, 0, 1,
-0.4909371, 1.237176, 1.023747, 0.2666667, 1, 0, 1,
-0.4859821, -0.2302663, -1.777416, 0.2588235, 1, 0, 1,
-0.4858954, 2.302955, -0.4646077, 0.254902, 1, 0, 1,
-0.4770795, -0.8025525, -1.065369, 0.2470588, 1, 0, 1,
-0.4758642, -0.3592281, -1.864588, 0.2431373, 1, 0, 1,
-0.4754265, -0.2342763, -2.153315, 0.2352941, 1, 0, 1,
-0.4724371, -0.009714912, -2.356667, 0.2313726, 1, 0, 1,
-0.470952, 0.9886203, -0.08064871, 0.2235294, 1, 0, 1,
-0.4689265, 0.7333021, 1.999602, 0.2196078, 1, 0, 1,
-0.467949, 1.377026, 1.554156, 0.2117647, 1, 0, 1,
-0.46691, 1.632839, -1.0868, 0.2078431, 1, 0, 1,
-0.4663995, -0.9725611, -1.951756, 0.2, 1, 0, 1,
-0.4596241, -0.6482155, -1.648348, 0.1921569, 1, 0, 1,
-0.4589161, 0.1053858, 0.3169381, 0.1882353, 1, 0, 1,
-0.4516495, 0.2198462, -1.505668, 0.1803922, 1, 0, 1,
-0.4513609, 0.149106, -0.2886477, 0.1764706, 1, 0, 1,
-0.4434368, -0.2267689, -2.427884, 0.1686275, 1, 0, 1,
-0.4429985, -0.2165364, -0.2666579, 0.1647059, 1, 0, 1,
-0.4312174, 0.5459551, -0.4761693, 0.1568628, 1, 0, 1,
-0.4270269, -0.6494846, -3.503874, 0.1529412, 1, 0, 1,
-0.4234494, -1.136946, -2.748024, 0.145098, 1, 0, 1,
-0.422588, -1.489625, -2.435644, 0.1411765, 1, 0, 1,
-0.4224949, 0.4975536, -1.2592, 0.1333333, 1, 0, 1,
-0.4196265, 0.3501391, -1.050829, 0.1294118, 1, 0, 1,
-0.4145617, 0.5230755, 0.672241, 0.1215686, 1, 0, 1,
-0.413754, 1.290822, 0.1044826, 0.1176471, 1, 0, 1,
-0.4129249, 1.075565, 0.0004130816, 0.1098039, 1, 0, 1,
-0.4103077, 0.6974754, 0.4707212, 0.1058824, 1, 0, 1,
-0.4073833, -0.1650624, -1.745842, 0.09803922, 1, 0, 1,
-0.4041843, 1.550146, 0.353924, 0.09019608, 1, 0, 1,
-0.4019934, 2.41642, -1.509528, 0.08627451, 1, 0, 1,
-0.4008519, -0.5088984, -2.704289, 0.07843138, 1, 0, 1,
-0.400645, 0.0855262, -0.9788419, 0.07450981, 1, 0, 1,
-0.3980177, 0.4665584, -0.6558852, 0.06666667, 1, 0, 1,
-0.3978894, 0.3066321, -0.3252366, 0.0627451, 1, 0, 1,
-0.3964629, -0.2033625, -1.168291, 0.05490196, 1, 0, 1,
-0.3924934, 0.2107778, -1.436131, 0.05098039, 1, 0, 1,
-0.3921277, -0.2273003, -0.7939375, 0.04313726, 1, 0, 1,
-0.3854328, -0.3554088, -1.656471, 0.03921569, 1, 0, 1,
-0.3844136, -1.395898, -1.58336, 0.03137255, 1, 0, 1,
-0.3827594, -1.163947, -3.732868, 0.02745098, 1, 0, 1,
-0.3808148, 0.9277192, -0.6257603, 0.01960784, 1, 0, 1,
-0.3800269, 1.522188, 0.1772378, 0.01568628, 1, 0, 1,
-0.3780431, -0.6441008, -3.109821, 0.007843138, 1, 0, 1,
-0.3758579, 0.8171469, -1.093781, 0.003921569, 1, 0, 1,
-0.3742077, -0.01574575, -1.709029, 0, 1, 0.003921569, 1,
-0.3741825, 0.3441991, -0.1426432, 0, 1, 0.01176471, 1,
-0.373278, -1.602624, -4.053689, 0, 1, 0.01568628, 1,
-0.3724045, 0.441174, -1.980899, 0, 1, 0.02352941, 1,
-0.3718023, 0.7388414, -2.250937, 0, 1, 0.02745098, 1,
-0.3695667, 2.343694, 1.05737, 0, 1, 0.03529412, 1,
-0.3504597, -0.4413313, -3.034864, 0, 1, 0.03921569, 1,
-0.3488856, -1.194293, -2.268298, 0, 1, 0.04705882, 1,
-0.3460198, -1.053707, -4.348573, 0, 1, 0.05098039, 1,
-0.3459376, -0.4754666, -1.827566, 0, 1, 0.05882353, 1,
-0.343513, 0.7317777, -0.8243837, 0, 1, 0.0627451, 1,
-0.3367033, -0.7142669, -3.069183, 0, 1, 0.07058824, 1,
-0.3355316, 0.4585109, 0.1206672, 0, 1, 0.07450981, 1,
-0.330972, 0.1433018, -2.476346, 0, 1, 0.08235294, 1,
-0.3265392, 0.2363695, -2.116693, 0, 1, 0.08627451, 1,
-0.3232658, 0.2439103, 1.029122, 0, 1, 0.09411765, 1,
-0.3216034, 0.5596086, -0.2195328, 0, 1, 0.1019608, 1,
-0.3212573, 1.327176, 0.1407953, 0, 1, 0.1058824, 1,
-0.318871, -0.04018218, -3.046681, 0, 1, 0.1137255, 1,
-0.3177099, -1.393842, -2.676526, 0, 1, 0.1176471, 1,
-0.3158624, -0.8608646, -3.753044, 0, 1, 0.1254902, 1,
-0.3155362, -0.09117384, -3.23812, 0, 1, 0.1294118, 1,
-0.3130938, 1.459606, 0.5919087, 0, 1, 0.1372549, 1,
-0.3130718, -0.8055421, -2.3625, 0, 1, 0.1411765, 1,
-0.312674, -1.351309, -1.459556, 0, 1, 0.1490196, 1,
-0.3120483, 0.1298856, -0.9778177, 0, 1, 0.1529412, 1,
-0.3115648, -0.08885446, -2.091352, 0, 1, 0.1607843, 1,
-0.3083661, -0.8814234, -2.281964, 0, 1, 0.1647059, 1,
-0.3070165, -0.2371227, -3.653354, 0, 1, 0.172549, 1,
-0.3059269, -0.8960406, -3.474145, 0, 1, 0.1764706, 1,
-0.3012117, 0.4528916, 0.1224725, 0, 1, 0.1843137, 1,
-0.2987143, 0.4879988, 0.5644459, 0, 1, 0.1882353, 1,
-0.2963477, -0.6998113, -2.758628, 0, 1, 0.1960784, 1,
-0.2956527, 0.175265, -0.9020143, 0, 1, 0.2039216, 1,
-0.2955571, -0.8893259, -2.457464, 0, 1, 0.2078431, 1,
-0.2938039, -0.03911039, -0.9084103, 0, 1, 0.2156863, 1,
-0.2919824, -2.084237, -2.300614, 0, 1, 0.2196078, 1,
-0.2910401, -0.1797446, -1.970082, 0, 1, 0.227451, 1,
-0.2890732, -0.6471479, -2.079919, 0, 1, 0.2313726, 1,
-0.2887719, -1.013373, -4.27626, 0, 1, 0.2392157, 1,
-0.282803, 0.1290478, -1.051027, 0, 1, 0.2431373, 1,
-0.2798316, 1.242749, 1.272715, 0, 1, 0.2509804, 1,
-0.2797873, 0.4493345, -0.27055, 0, 1, 0.254902, 1,
-0.2795409, -0.2302416, -2.783994, 0, 1, 0.2627451, 1,
-0.2775667, 0.3273287, -0.8511279, 0, 1, 0.2666667, 1,
-0.2715013, 1.918889, -0.2852852, 0, 1, 0.2745098, 1,
-0.2706052, 1.188023, 0.1787155, 0, 1, 0.2784314, 1,
-0.264181, 0.8490716, -0.314411, 0, 1, 0.2862745, 1,
-0.2641565, -1.195316, -4.466931, 0, 1, 0.2901961, 1,
-0.2585701, -0.7939036, -0.8527762, 0, 1, 0.2980392, 1,
-0.2543963, -0.512824, -2.221052, 0, 1, 0.3058824, 1,
-0.251233, 0.1766164, -2.417965, 0, 1, 0.3098039, 1,
-0.2508927, 1.147843, 1.045443, 0, 1, 0.3176471, 1,
-0.246861, 0.382229, -1.505105, 0, 1, 0.3215686, 1,
-0.2459054, 0.166188, -1.915514, 0, 1, 0.3294118, 1,
-0.2420961, 2.062022, -0.2893945, 0, 1, 0.3333333, 1,
-0.2381146, 0.9927954, 0.286552, 0, 1, 0.3411765, 1,
-0.2350008, 1.578478, 1.232692, 0, 1, 0.345098, 1,
-0.2344713, 1.54394, -1.150607, 0, 1, 0.3529412, 1,
-0.230716, 0.04913988, -1.162452, 0, 1, 0.3568628, 1,
-0.2276609, 0.7817959, -0.2605718, 0, 1, 0.3647059, 1,
-0.2246022, -1.475237, -4.883284, 0, 1, 0.3686275, 1,
-0.22413, 1.265816, -0.9405352, 0, 1, 0.3764706, 1,
-0.2234811, 0.2707234, 0.3683512, 0, 1, 0.3803922, 1,
-0.2233114, 0.3257892, -0.5083994, 0, 1, 0.3882353, 1,
-0.2220385, 2.365519, -0.9569212, 0, 1, 0.3921569, 1,
-0.2210977, -1.361346, -1.897043, 0, 1, 0.4, 1,
-0.2155791, -0.5247375, -3.801568, 0, 1, 0.4078431, 1,
-0.2146179, -0.7734986, -2.345555, 0, 1, 0.4117647, 1,
-0.2125713, -0.02399917, -2.202656, 0, 1, 0.4196078, 1,
-0.2117525, -0.2738863, -3.151151, 0, 1, 0.4235294, 1,
-0.208278, -1.517021, -3.377778, 0, 1, 0.4313726, 1,
-0.2004023, -0.6428664, -2.423312, 0, 1, 0.4352941, 1,
-0.2002614, -1.83076, -3.821097, 0, 1, 0.4431373, 1,
-0.1984716, -0.7408589, -2.63643, 0, 1, 0.4470588, 1,
-0.1968353, -0.5987253, -2.381739, 0, 1, 0.454902, 1,
-0.1938588, 1.108423, 0.367843, 0, 1, 0.4588235, 1,
-0.1931913, -0.7436289, -3.626679, 0, 1, 0.4666667, 1,
-0.1900878, -0.8969461, -1.576374, 0, 1, 0.4705882, 1,
-0.187862, 1.604349, -0.1359666, 0, 1, 0.4784314, 1,
-0.1791316, -0.3220549, -3.085048, 0, 1, 0.4823529, 1,
-0.1788357, 1.749109, -0.8819416, 0, 1, 0.4901961, 1,
-0.1755989, -1.691197, -2.2442, 0, 1, 0.4941176, 1,
-0.1728508, -0.4043323, -2.471632, 0, 1, 0.5019608, 1,
-0.1688136, -0.250716, -1.800789, 0, 1, 0.509804, 1,
-0.1640204, -0.153165, -1.342081, 0, 1, 0.5137255, 1,
-0.162678, 0.5523825, -1.983225, 0, 1, 0.5215687, 1,
-0.1623104, -0.4252677, -3.128096, 0, 1, 0.5254902, 1,
-0.1604702, -0.7217843, -2.23941, 0, 1, 0.5333334, 1,
-0.156938, 0.04441601, -3.48973, 0, 1, 0.5372549, 1,
-0.1551175, 0.4135395, -1.472585, 0, 1, 0.5450981, 1,
-0.151416, -1.424927, -1.246606, 0, 1, 0.5490196, 1,
-0.1481933, 0.08877656, -0.6427578, 0, 1, 0.5568628, 1,
-0.1458067, -0.001144501, -3.859607, 0, 1, 0.5607843, 1,
-0.1446128, 0.06275204, -1.229527, 0, 1, 0.5686275, 1,
-0.1427428, -0.7248812, -3.502164, 0, 1, 0.572549, 1,
-0.1385966, -0.9700488, -3.149087, 0, 1, 0.5803922, 1,
-0.1374823, -0.8373351, -2.27117, 0, 1, 0.5843138, 1,
-0.1337871, -0.07058459, -1.834232, 0, 1, 0.5921569, 1,
-0.1335399, -0.08269093, -1.93766, 0, 1, 0.5960785, 1,
-0.1322552, -0.7211737, -2.0184, 0, 1, 0.6039216, 1,
-0.1288162, 1.200551, -1.96278, 0, 1, 0.6117647, 1,
-0.1281336, -0.7558798, -4.131564, 0, 1, 0.6156863, 1,
-0.1280765, 2.388972, -0.308468, 0, 1, 0.6235294, 1,
-0.1272668, 0.8443959, -0.5300703, 0, 1, 0.627451, 1,
-0.1250076, -0.01068398, -1.434001, 0, 1, 0.6352941, 1,
-0.1238635, -1.564946, -3.192326, 0, 1, 0.6392157, 1,
-0.1218799, 0.2134688, 0.1079981, 0, 1, 0.6470588, 1,
-0.1182481, 0.4232226, 0.22395, 0, 1, 0.6509804, 1,
-0.1173264, -1.039969, -1.863662, 0, 1, 0.6588235, 1,
-0.1169958, 0.3352292, 1.132122, 0, 1, 0.6627451, 1,
-0.1168874, 0.4649383, -0.6947826, 0, 1, 0.6705883, 1,
-0.1134188, 0.2984097, 0.3922416, 0, 1, 0.6745098, 1,
-0.1106762, 0.7325145, 0.4114019, 0, 1, 0.682353, 1,
-0.1073155, -1.33704, -3.39464, 0, 1, 0.6862745, 1,
-0.1053308, -0.3268107, -1.067837, 0, 1, 0.6941177, 1,
-0.1029842, -1.300588, -2.746907, 0, 1, 0.7019608, 1,
-0.1024149, 0.08528294, -1.299227, 0, 1, 0.7058824, 1,
-0.09822569, -1.089214, -0.5456359, 0, 1, 0.7137255, 1,
-0.09763315, 0.3040935, -0.6456811, 0, 1, 0.7176471, 1,
-0.09198442, -0.451489, -5.198816, 0, 1, 0.7254902, 1,
-0.09109057, -0.2277735, -1.992716, 0, 1, 0.7294118, 1,
-0.09012741, -0.5044121, -3.6617, 0, 1, 0.7372549, 1,
-0.08869356, -0.4069976, -3.312289, 0, 1, 0.7411765, 1,
-0.08809646, -0.8133297, -3.608878, 0, 1, 0.7490196, 1,
-0.08655452, -0.5514861, -1.852764, 0, 1, 0.7529412, 1,
-0.08498438, 1.117514, -0.3636681, 0, 1, 0.7607843, 1,
-0.08497794, -1.171844, -4.155951, 0, 1, 0.7647059, 1,
-0.08492085, 0.1233496, -0.4785996, 0, 1, 0.772549, 1,
-0.08267367, 0.3506894, -0.4995699, 0, 1, 0.7764706, 1,
-0.07937407, 1.448929, -0.5701672, 0, 1, 0.7843137, 1,
-0.07581876, -0.2031347, -2.970294, 0, 1, 0.7882353, 1,
-0.07512998, -1.828228, -2.750381, 0, 1, 0.7960784, 1,
-0.07454676, 0.5052809, -0.168369, 0, 1, 0.8039216, 1,
-0.07347296, 1.423055, 0.2966309, 0, 1, 0.8078431, 1,
-0.07264055, -1.932147, -3.994378, 0, 1, 0.8156863, 1,
-0.0611062, -1.927356, -3.633629, 0, 1, 0.8196079, 1,
-0.05204647, 1.392559, -1.521292, 0, 1, 0.827451, 1,
-0.04975194, -0.03938911, -3.300422, 0, 1, 0.8313726, 1,
-0.04870831, -0.5318111, -3.777854, 0, 1, 0.8392157, 1,
-0.04803431, 2.339955, 1.247285, 0, 1, 0.8431373, 1,
-0.04782945, 0.02906147, -1.555039, 0, 1, 0.8509804, 1,
-0.04660828, -0.1214322, -2.844989, 0, 1, 0.854902, 1,
-0.0464484, 0.8690939, 0.5092221, 0, 1, 0.8627451, 1,
-0.04620755, -0.3660505, -1.423803, 0, 1, 0.8666667, 1,
-0.04597947, 0.6687528, 1.518972, 0, 1, 0.8745098, 1,
-0.04378208, -0.5792009, -2.014903, 0, 1, 0.8784314, 1,
-0.04111709, 0.6509099, 0.5551831, 0, 1, 0.8862745, 1,
-0.0404707, -0.2011057, -2.411384, 0, 1, 0.8901961, 1,
-0.03828362, -0.4752384, -3.16018, 0, 1, 0.8980392, 1,
-0.03790827, -2.731797, -2.897503, 0, 1, 0.9058824, 1,
-0.03378502, -0.4397819, -1.423514, 0, 1, 0.9098039, 1,
-0.03356832, 0.3884249, 1.240948, 0, 1, 0.9176471, 1,
-0.02560851, 0.374118, 1.746488, 0, 1, 0.9215686, 1,
-0.02443729, 0.01230222, -1.430093, 0, 1, 0.9294118, 1,
-0.02367511, -0.2452566, -2.479403, 0, 1, 0.9333333, 1,
-0.02346262, 0.3116027, 1.775976, 0, 1, 0.9411765, 1,
-0.01794553, -0.4485054, -5.257837, 0, 1, 0.945098, 1,
-0.01486761, 0.2016961, 0.3021562, 0, 1, 0.9529412, 1,
-0.01295329, -0.1111329, -2.275344, 0, 1, 0.9568627, 1,
-0.008262794, -0.6155232, -3.691439, 0, 1, 0.9647059, 1,
-0.003943273, -0.5486528, -2.897152, 0, 1, 0.9686275, 1,
-0.002651675, -0.6997606, -2.53866, 0, 1, 0.9764706, 1,
-0.000118959, 0.6728114, -0.002745733, 0, 1, 0.9803922, 1,
0.0131624, -1.45702, 2.6412, 0, 1, 0.9882353, 1,
0.01317354, 0.09668158, 0.5230129, 0, 1, 0.9921569, 1,
0.01386523, 1.581634, -0.2838652, 0, 1, 1, 1,
0.01507713, 1.935207, 0.7740607, 0, 0.9921569, 1, 1,
0.01702814, 0.3643036, 0.2747879, 0, 0.9882353, 1, 1,
0.01903755, -2.337348, 4.204807, 0, 0.9803922, 1, 1,
0.02978116, -0.8657169, 2.694762, 0, 0.9764706, 1, 1,
0.03289476, -0.7508917, 4.748666, 0, 0.9686275, 1, 1,
0.03505864, -0.8392726, 3.441301, 0, 0.9647059, 1, 1,
0.03688557, 1.093999, 0.8478588, 0, 0.9568627, 1, 1,
0.03791748, -0.327278, 2.71939, 0, 0.9529412, 1, 1,
0.04130489, 0.6361952, -0.02035017, 0, 0.945098, 1, 1,
0.04477755, 0.5490273, -0.4516829, 0, 0.9411765, 1, 1,
0.05040544, 0.8373508, 0.8208728, 0, 0.9333333, 1, 1,
0.05199459, -1.682896, 3.997843, 0, 0.9294118, 1, 1,
0.05262757, -0.4991318, 1.195339, 0, 0.9215686, 1, 1,
0.05346318, 0.5145512, -0.7149975, 0, 0.9176471, 1, 1,
0.05561729, 1.487932, 1.528366, 0, 0.9098039, 1, 1,
0.05776982, -1.019399, 2.136152, 0, 0.9058824, 1, 1,
0.05990206, 0.6759666, 0.7033116, 0, 0.8980392, 1, 1,
0.06128238, -1.013804, 3.038435, 0, 0.8901961, 1, 1,
0.06362813, -0.5893599, 2.451107, 0, 0.8862745, 1, 1,
0.06488566, 0.3927645, -1.673338, 0, 0.8784314, 1, 1,
0.06624233, -0.4417527, 2.674705, 0, 0.8745098, 1, 1,
0.06643724, 0.03732888, 1.743939, 0, 0.8666667, 1, 1,
0.06785028, -0.6547899, 2.446663, 0, 0.8627451, 1, 1,
0.06853373, -0.6691314, 2.9645, 0, 0.854902, 1, 1,
0.07596973, -0.5333385, 3.628929, 0, 0.8509804, 1, 1,
0.0761219, 0.1870008, 0.2782036, 0, 0.8431373, 1, 1,
0.08212934, 1.74782, -0.1236174, 0, 0.8392157, 1, 1,
0.09092607, -1.321652, 3.51874, 0, 0.8313726, 1, 1,
0.09349839, -1.240086, 3.513437, 0, 0.827451, 1, 1,
0.09380456, -1.369044, 3.461011, 0, 0.8196079, 1, 1,
0.09889954, -0.1114093, 2.334362, 0, 0.8156863, 1, 1,
0.1034251, -0.8554453, 3.567855, 0, 0.8078431, 1, 1,
0.1045964, 1.167741, -0.6705385, 0, 0.8039216, 1, 1,
0.1052619, -0.9176498, 2.605233, 0, 0.7960784, 1, 1,
0.1089186, 0.02726543, -0.3150575, 0, 0.7882353, 1, 1,
0.1128686, 0.6667146, 2.096098, 0, 0.7843137, 1, 1,
0.114108, -0.9692707, 4.171095, 0, 0.7764706, 1, 1,
0.1144186, -0.8744695, 3.215216, 0, 0.772549, 1, 1,
0.115026, 0.6346359, 0.8520067, 0, 0.7647059, 1, 1,
0.1168174, -0.2192023, 3.149684, 0, 0.7607843, 1, 1,
0.1173299, -1.017386, 3.34066, 0, 0.7529412, 1, 1,
0.125196, 0.05133408, 1.189266, 0, 0.7490196, 1, 1,
0.1264328, 0.6296033, 0.1049965, 0, 0.7411765, 1, 1,
0.133276, 1.279287, 0.6293179, 0, 0.7372549, 1, 1,
0.1336435, -0.009095233, 1.271725, 0, 0.7294118, 1, 1,
0.1470768, -0.7293836, 2.606302, 0, 0.7254902, 1, 1,
0.1526422, 0.287796, 1.762935, 0, 0.7176471, 1, 1,
0.1589221, 1.783287, 1.066492, 0, 0.7137255, 1, 1,
0.1607321, 1.911001, 1.095858, 0, 0.7058824, 1, 1,
0.1668109, -0.8923225, 4.219817, 0, 0.6980392, 1, 1,
0.170156, 0.1501585, 0.2422258, 0, 0.6941177, 1, 1,
0.173853, 0.7954805, 0.9572269, 0, 0.6862745, 1, 1,
0.178365, -1.137959, 3.775281, 0, 0.682353, 1, 1,
0.1792261, 0.1401972, 1.74112, 0, 0.6745098, 1, 1,
0.1801979, -0.1516055, 2.635899, 0, 0.6705883, 1, 1,
0.186437, -0.624561, 3.23355, 0, 0.6627451, 1, 1,
0.1926317, -0.565773, 3.862456, 0, 0.6588235, 1, 1,
0.195722, -1.183206, 3.085729, 0, 0.6509804, 1, 1,
0.200834, -0.1028208, 2.575574, 0, 0.6470588, 1, 1,
0.2020026, 1.12598, 0.9294259, 0, 0.6392157, 1, 1,
0.2080493, -0.5563082, 1.049698, 0, 0.6352941, 1, 1,
0.2083867, 0.6452228, 0.9439929, 0, 0.627451, 1, 1,
0.209909, -1.227671, 3.028704, 0, 0.6235294, 1, 1,
0.2103069, -1.093108, 2.237453, 0, 0.6156863, 1, 1,
0.2120678, -0.6345221, 3.132769, 0, 0.6117647, 1, 1,
0.2123332, -0.9908492, 4.323116, 0, 0.6039216, 1, 1,
0.2128063, -0.09263093, 0.4485194, 0, 0.5960785, 1, 1,
0.2140386, -0.6385438, 3.876922, 0, 0.5921569, 1, 1,
0.2163176, -1.025839, 3.374312, 0, 0.5843138, 1, 1,
0.2172629, -1.597853, 3.646101, 0, 0.5803922, 1, 1,
0.2194049, 0.64161, -1.3379, 0, 0.572549, 1, 1,
0.221304, 0.006285773, 1.132971, 0, 0.5686275, 1, 1,
0.2220367, -0.4684092, 4.366498, 0, 0.5607843, 1, 1,
0.2282046, 1.005221, 1.652403, 0, 0.5568628, 1, 1,
0.2284259, 0.7411958, 0.8390824, 0, 0.5490196, 1, 1,
0.2304824, -2.759228, 3.835906, 0, 0.5450981, 1, 1,
0.2339854, -0.07560817, 2.588092, 0, 0.5372549, 1, 1,
0.2352688, -0.7673407, 1.871132, 0, 0.5333334, 1, 1,
0.242968, 0.2441512, 1.237338, 0, 0.5254902, 1, 1,
0.2429809, -1.471105, 2.069206, 0, 0.5215687, 1, 1,
0.2463036, 0.7406335, 0.07152162, 0, 0.5137255, 1, 1,
0.2502091, -1.213498, 3.092735, 0, 0.509804, 1, 1,
0.2556616, 0.6490704, -0.4489346, 0, 0.5019608, 1, 1,
0.2564953, -0.3947453, 3.067064, 0, 0.4941176, 1, 1,
0.2568128, -1.884605, 2.7162, 0, 0.4901961, 1, 1,
0.2691854, 0.8179306, 1.395972, 0, 0.4823529, 1, 1,
0.2748584, 0.3037291, 0.3134483, 0, 0.4784314, 1, 1,
0.2789207, -0.1158695, 3.167321, 0, 0.4705882, 1, 1,
0.2802245, 0.9252732, -0.1509008, 0, 0.4666667, 1, 1,
0.2883916, 0.6664121, 0.4471687, 0, 0.4588235, 1, 1,
0.293835, 0.3783656, -0.8195309, 0, 0.454902, 1, 1,
0.2947672, 0.3367871, 1.63739, 0, 0.4470588, 1, 1,
0.2977475, -0.2829776, 3.325329, 0, 0.4431373, 1, 1,
0.3002225, 0.6037132, 0.6574097, 0, 0.4352941, 1, 1,
0.3026127, -0.005515077, 1.686024, 0, 0.4313726, 1, 1,
0.3058715, -0.3770911, 2.141254, 0, 0.4235294, 1, 1,
0.3065274, 1.121443, -1.255868, 0, 0.4196078, 1, 1,
0.3103373, 1.68625, -1.456194, 0, 0.4117647, 1, 1,
0.3113098, -0.2359436, 2.292956, 0, 0.4078431, 1, 1,
0.3149034, -0.1891267, 2.31165, 0, 0.4, 1, 1,
0.3150656, 0.6798498, -0.2422499, 0, 0.3921569, 1, 1,
0.317961, 1.948936, 0.8610785, 0, 0.3882353, 1, 1,
0.3190793, -0.05154924, 3.606198, 0, 0.3803922, 1, 1,
0.3251093, 1.052579, 0.4543201, 0, 0.3764706, 1, 1,
0.32603, -0.8236539, 3.374977, 0, 0.3686275, 1, 1,
0.3289152, -0.959258, 3.074411, 0, 0.3647059, 1, 1,
0.3427958, 0.2727986, 1.264156, 0, 0.3568628, 1, 1,
0.3438343, -0.6874093, 3.136939, 0, 0.3529412, 1, 1,
0.3441432, 0.4814429, 1.118577, 0, 0.345098, 1, 1,
0.3483555, -0.2204874, 1.538029, 0, 0.3411765, 1, 1,
0.3488428, -0.2183446, 1.242039, 0, 0.3333333, 1, 1,
0.3524263, -0.1380733, 0.745363, 0, 0.3294118, 1, 1,
0.3529278, 1.520766, -0.7061202, 0, 0.3215686, 1, 1,
0.3581462, 1.439782, -0.1640316, 0, 0.3176471, 1, 1,
0.361416, -0.0509134, 2.082061, 0, 0.3098039, 1, 1,
0.363038, -0.8456848, 2.18657, 0, 0.3058824, 1, 1,
0.3649563, 0.6974815, -0.02267925, 0, 0.2980392, 1, 1,
0.3658675, -0.2258855, 3.545201, 0, 0.2901961, 1, 1,
0.3701174, 1.355134, -0.2149547, 0, 0.2862745, 1, 1,
0.3735433, -0.1676818, 2.248774, 0, 0.2784314, 1, 1,
0.3738306, 1.765975, 1.176146, 0, 0.2745098, 1, 1,
0.3769503, -1.970699, 3.617612, 0, 0.2666667, 1, 1,
0.3796665, -0.2509689, 0.4944387, 0, 0.2627451, 1, 1,
0.3812749, 1.264006, 0.07689457, 0, 0.254902, 1, 1,
0.3837875, 1.47543, 2.065353, 0, 0.2509804, 1, 1,
0.3846757, 1.905901, 0.1641886, 0, 0.2431373, 1, 1,
0.3894742, 2.353274, 1.468788, 0, 0.2392157, 1, 1,
0.3918335, 0.5428948, 0.0008035239, 0, 0.2313726, 1, 1,
0.3956216, -0.06356976, 1.894509, 0, 0.227451, 1, 1,
0.404217, -0.8312004, 3.274763, 0, 0.2196078, 1, 1,
0.4047578, 1.476318, 0.9137688, 0, 0.2156863, 1, 1,
0.406196, 0.1217172, 2.350506, 0, 0.2078431, 1, 1,
0.4078204, -0.3273879, 2.706227, 0, 0.2039216, 1, 1,
0.4123423, -0.6609558, 1.734711, 0, 0.1960784, 1, 1,
0.4188431, 0.6986461, -0.4673952, 0, 0.1882353, 1, 1,
0.4193652, 1.242055, 0.5401766, 0, 0.1843137, 1, 1,
0.4291638, -1.733471, 1.810687, 0, 0.1764706, 1, 1,
0.4309202, 0.8175665, -0.8695373, 0, 0.172549, 1, 1,
0.4331905, -0.2694115, 1.701916, 0, 0.1647059, 1, 1,
0.4397591, 2.060613, -0.249104, 0, 0.1607843, 1, 1,
0.4397679, 0.3777958, -0.1426511, 0, 0.1529412, 1, 1,
0.4415607, 1.720638, 0.2041731, 0, 0.1490196, 1, 1,
0.4425651, -0.5388405, 2.024639, 0, 0.1411765, 1, 1,
0.442608, -1.205503, 0.9012576, 0, 0.1372549, 1, 1,
0.4435655, -2.361618, 2.408339, 0, 0.1294118, 1, 1,
0.4436632, 0.5288325, 1.922061, 0, 0.1254902, 1, 1,
0.4459045, -1.810534, 1.965432, 0, 0.1176471, 1, 1,
0.4462928, -0.2211109, 0.9717414, 0, 0.1137255, 1, 1,
0.4498803, 0.2291331, 0.2320559, 0, 0.1058824, 1, 1,
0.4502854, 0.2477845, 1.120359, 0, 0.09803922, 1, 1,
0.4530989, -0.2738832, 3.655007, 0, 0.09411765, 1, 1,
0.455835, -0.4039715, 1.961288, 0, 0.08627451, 1, 1,
0.4570986, 0.725877, 0.1466608, 0, 0.08235294, 1, 1,
0.4571505, 1.413099, -0.3493455, 0, 0.07450981, 1, 1,
0.4615165, 0.2138594, 1.884785, 0, 0.07058824, 1, 1,
0.4632456, -0.09178126, 1.369551, 0, 0.0627451, 1, 1,
0.4657915, 0.7286144, 0.9757036, 0, 0.05882353, 1, 1,
0.4686829, -0.08969168, 1.490581, 0, 0.05098039, 1, 1,
0.469929, 2.031717, 0.7115725, 0, 0.04705882, 1, 1,
0.478272, 0.6891655, -0.1710821, 0, 0.03921569, 1, 1,
0.4842132, 0.4704804, 2.140145, 0, 0.03529412, 1, 1,
0.4882432, -0.4643272, 2.778864, 0, 0.02745098, 1, 1,
0.4920827, 0.1692026, 0.05131766, 0, 0.02352941, 1, 1,
0.4977639, -0.2268369, 4.746701, 0, 0.01568628, 1, 1,
0.5060793, 0.5259759, 1.14628, 0, 0.01176471, 1, 1,
0.5097005, -0.7319997, 3.273034, 0, 0.003921569, 1, 1,
0.5113217, 0.08480309, 3.491509, 0.003921569, 0, 1, 1,
0.5113459, -0.5991877, 3.440519, 0.007843138, 0, 1, 1,
0.5139801, 1.525034, 0.6550751, 0.01568628, 0, 1, 1,
0.5185798, -1.015959, 0.8542933, 0.01960784, 0, 1, 1,
0.5199819, 0.7391515, -0.9377064, 0.02745098, 0, 1, 1,
0.520331, 0.9549133, 0.3159541, 0.03137255, 0, 1, 1,
0.5219374, 0.03711341, 1.912408, 0.03921569, 0, 1, 1,
0.5241923, -0.0662908, 2.698148, 0.04313726, 0, 1, 1,
0.5337832, 0.9060541, 0.5347933, 0.05098039, 0, 1, 1,
0.5345353, -1.327776, 4.591621, 0.05490196, 0, 1, 1,
0.5347828, -2.325595, 1.601453, 0.0627451, 0, 1, 1,
0.5382075, 0.4524805, 0.0849468, 0.06666667, 0, 1, 1,
0.5444718, -0.274462, 0.4372852, 0.07450981, 0, 1, 1,
0.5450488, 0.6138483, 1.629754, 0.07843138, 0, 1, 1,
0.5522671, -0.2739526, 2.683286, 0.08627451, 0, 1, 1,
0.5600311, 0.1666872, 2.568016, 0.09019608, 0, 1, 1,
0.5620762, -1.204104, 4.419687, 0.09803922, 0, 1, 1,
0.5629054, 0.09353437, 1.822846, 0.1058824, 0, 1, 1,
0.5636548, -0.3406351, 2.505091, 0.1098039, 0, 1, 1,
0.5655716, 0.6404562, 0.005902305, 0.1176471, 0, 1, 1,
0.567887, 0.5732338, 2.371058, 0.1215686, 0, 1, 1,
0.5728642, 0.1179007, 1.473875, 0.1294118, 0, 1, 1,
0.5753379, 0.3634043, -0.5571193, 0.1333333, 0, 1, 1,
0.5769888, 0.544692, 2.570321, 0.1411765, 0, 1, 1,
0.581363, 0.2977544, 2.188768, 0.145098, 0, 1, 1,
0.5817351, -0.0406651, 1.085732, 0.1529412, 0, 1, 1,
0.5863047, 0.2190577, 2.591666, 0.1568628, 0, 1, 1,
0.5897422, -0.2900467, 2.385791, 0.1647059, 0, 1, 1,
0.5929117, -0.5995856, 1.054179, 0.1686275, 0, 1, 1,
0.6033008, -1.319871, 3.061222, 0.1764706, 0, 1, 1,
0.6134547, -0.8239653, 2.281099, 0.1803922, 0, 1, 1,
0.6190771, 0.02824072, 0.8265296, 0.1882353, 0, 1, 1,
0.6236467, 2.2695, 0.2274014, 0.1921569, 0, 1, 1,
0.6261288, 0.1116921, 2.90873, 0.2, 0, 1, 1,
0.6290308, -1.60488, 3.710787, 0.2078431, 0, 1, 1,
0.6292303, 0.4144687, 1.386976, 0.2117647, 0, 1, 1,
0.6321488, 1.21984, 0.2269057, 0.2196078, 0, 1, 1,
0.634458, 0.9091625, 2.025352, 0.2235294, 0, 1, 1,
0.6360388, 0.8676975, 0.04341112, 0.2313726, 0, 1, 1,
0.6369421, -1.550871, 2.55692, 0.2352941, 0, 1, 1,
0.6371027, 0.5126078, 0.9963924, 0.2431373, 0, 1, 1,
0.638322, 2.552396, 2.230329, 0.2470588, 0, 1, 1,
0.642673, -0.4588511, 1.259502, 0.254902, 0, 1, 1,
0.6534907, -1.115966, 2.518745, 0.2588235, 0, 1, 1,
0.6549223, 0.8855129, 0.2058535, 0.2666667, 0, 1, 1,
0.6597001, -2.662676, 2.163749, 0.2705882, 0, 1, 1,
0.6604819, -3.151369, 2.844715, 0.2784314, 0, 1, 1,
0.6611006, 0.3171292, -0.5788427, 0.282353, 0, 1, 1,
0.6624835, -1.73171, 3.603337, 0.2901961, 0, 1, 1,
0.6654723, 0.07803703, 1.330218, 0.2941177, 0, 1, 1,
0.6725766, -1.231596, 0.4955773, 0.3019608, 0, 1, 1,
0.6733022, -0.5009102, 1.825534, 0.3098039, 0, 1, 1,
0.6793036, 0.4706421, 0.2226114, 0.3137255, 0, 1, 1,
0.6855816, 0.7687422, -0.3267609, 0.3215686, 0, 1, 1,
0.6858301, -0.8298568, 2.655606, 0.3254902, 0, 1, 1,
0.689506, 0.008577148, 1.718047, 0.3333333, 0, 1, 1,
0.6911078, -0.3660339, 2.463664, 0.3372549, 0, 1, 1,
0.6914667, 0.4046757, 2.108621, 0.345098, 0, 1, 1,
0.6923609, -0.4243868, 2.939795, 0.3490196, 0, 1, 1,
0.6923609, 0.2547679, -0.04612517, 0.3568628, 0, 1, 1,
0.6930346, 0.2483748, 0.2224247, 0.3607843, 0, 1, 1,
0.6938827, -2.025502, 3.514844, 0.3686275, 0, 1, 1,
0.6992017, -2.26111, 1.249197, 0.372549, 0, 1, 1,
0.7010434, -0.5571199, 1.772661, 0.3803922, 0, 1, 1,
0.7059815, 0.5980371, 1.584782, 0.3843137, 0, 1, 1,
0.7073286, 1.842144, -0.4613289, 0.3921569, 0, 1, 1,
0.7138532, -0.3910017, 3.752992, 0.3960784, 0, 1, 1,
0.715856, -0.3069851, 2.267061, 0.4039216, 0, 1, 1,
0.7178075, 0.1460101, 0.8209928, 0.4117647, 0, 1, 1,
0.7248428, -1.17153, 2.31877, 0.4156863, 0, 1, 1,
0.7255759, 1.199296, 0.7778551, 0.4235294, 0, 1, 1,
0.7295769, -0.5350552, 1.98871, 0.427451, 0, 1, 1,
0.7344931, 1.274739, 1.749336, 0.4352941, 0, 1, 1,
0.7400604, 1.143893, -0.850982, 0.4392157, 0, 1, 1,
0.7406925, -1.089662, 2.0346, 0.4470588, 0, 1, 1,
0.7439819, 0.1498155, 1.246917, 0.4509804, 0, 1, 1,
0.7444346, -0.4591889, 1.849814, 0.4588235, 0, 1, 1,
0.7469777, 0.6694818, -0.1317423, 0.4627451, 0, 1, 1,
0.7578477, 2.36954, 0.803316, 0.4705882, 0, 1, 1,
0.7586779, -1.272234, 2.476896, 0.4745098, 0, 1, 1,
0.7634325, 0.4415631, 0.6980343, 0.4823529, 0, 1, 1,
0.7650052, -0.2684952, 2.409059, 0.4862745, 0, 1, 1,
0.7669542, 0.3129623, -0.1748571, 0.4941176, 0, 1, 1,
0.7713502, 1.615937, -0.03258616, 0.5019608, 0, 1, 1,
0.7729405, -0.2871952, 1.704728, 0.5058824, 0, 1, 1,
0.777453, 0.535441, 0.2270298, 0.5137255, 0, 1, 1,
0.7778002, -1.403945, 2.614437, 0.5176471, 0, 1, 1,
0.7785488, 0.07693169, 0.9669164, 0.5254902, 0, 1, 1,
0.7908661, -1.536526, 3.257228, 0.5294118, 0, 1, 1,
0.7918268, -1.478986, 3.02447, 0.5372549, 0, 1, 1,
0.7923271, 0.6881753, 0.03153187, 0.5411765, 0, 1, 1,
0.8004085, 0.06348436, 0.6451172, 0.5490196, 0, 1, 1,
0.8011774, 1.664799, -0.9222973, 0.5529412, 0, 1, 1,
0.8093402, -1.260626, 2.623736, 0.5607843, 0, 1, 1,
0.8123526, 1.254198, -0.03088131, 0.5647059, 0, 1, 1,
0.8168451, 0.6539231, 0.7800914, 0.572549, 0, 1, 1,
0.8189437, 0.9607824, 1.555068, 0.5764706, 0, 1, 1,
0.8190795, -1.085677, 2.050657, 0.5843138, 0, 1, 1,
0.8232794, -0.7780567, 2.283345, 0.5882353, 0, 1, 1,
0.8254462, 0.3850018, -0.9860917, 0.5960785, 0, 1, 1,
0.8340414, -0.5258844, 0.9314872, 0.6039216, 0, 1, 1,
0.8352813, 1.347878, 1.700901, 0.6078432, 0, 1, 1,
0.8354583, -0.1023032, 1.206375, 0.6156863, 0, 1, 1,
0.8376414, 0.7157808, -0.933226, 0.6196079, 0, 1, 1,
0.838442, -1.421384, 2.060658, 0.627451, 0, 1, 1,
0.8384917, 2.820921, 1.101828, 0.6313726, 0, 1, 1,
0.8413722, -0.7445213, 3.19729, 0.6392157, 0, 1, 1,
0.8414211, 0.261456, 1.201065, 0.6431373, 0, 1, 1,
0.8466785, -0.1022227, 1.636444, 0.6509804, 0, 1, 1,
0.8488145, -0.9308436, 2.987043, 0.654902, 0, 1, 1,
0.8505976, 1.44612, 0.3183774, 0.6627451, 0, 1, 1,
0.8524106, -0.5644225, 1.80295, 0.6666667, 0, 1, 1,
0.8531154, -1.23835, 3.70048, 0.6745098, 0, 1, 1,
0.8542976, 1.015024, -0.01489069, 0.6784314, 0, 1, 1,
0.8565768, 0.3266263, 0.5922448, 0.6862745, 0, 1, 1,
0.8568364, -1.861454, 3.845328, 0.6901961, 0, 1, 1,
0.8575213, -1.045977, 2.292416, 0.6980392, 0, 1, 1,
0.8588495, -0.756901, 1.199435, 0.7058824, 0, 1, 1,
0.8602863, 0.4002733, 0.5606874, 0.7098039, 0, 1, 1,
0.8645929, -1.592224, 2.598488, 0.7176471, 0, 1, 1,
0.8757998, -0.3888407, 1.422098, 0.7215686, 0, 1, 1,
0.8758036, 0.2753111, 1.831612, 0.7294118, 0, 1, 1,
0.8779012, -0.3421091, 0.6476027, 0.7333333, 0, 1, 1,
0.8842776, 0.7556893, 1.789421, 0.7411765, 0, 1, 1,
0.8913786, -1.159981, 2.803923, 0.7450981, 0, 1, 1,
0.8937705, 0.6068864, 0.9144216, 0.7529412, 0, 1, 1,
0.8939505, -2.442767, 1.861838, 0.7568628, 0, 1, 1,
0.897301, -0.4943926, 3.331144, 0.7647059, 0, 1, 1,
0.9067873, 1.225677, 1.250394, 0.7686275, 0, 1, 1,
0.9068949, -1.71938, 1.724129, 0.7764706, 0, 1, 1,
0.9078059, 0.6380733, 2.483097, 0.7803922, 0, 1, 1,
0.9081109, 0.004259001, 2.217514, 0.7882353, 0, 1, 1,
0.9101446, -0.5842524, -0.354691, 0.7921569, 0, 1, 1,
0.9102235, -1.649245, 1.180078, 0.8, 0, 1, 1,
0.9103763, 0.3122425, 0.7330478, 0.8078431, 0, 1, 1,
0.9150118, 0.6709433, 1.413428, 0.8117647, 0, 1, 1,
0.9153547, 0.04989066, 2.181706, 0.8196079, 0, 1, 1,
0.9166126, 1.715998, -0.3472555, 0.8235294, 0, 1, 1,
0.9170004, -1.962348, 2.022283, 0.8313726, 0, 1, 1,
0.9270136, 0.453534, -0.6263489, 0.8352941, 0, 1, 1,
0.9284562, 0.2428134, 1.034388, 0.8431373, 0, 1, 1,
0.9329544, -0.03270862, 0.1819064, 0.8470588, 0, 1, 1,
0.9456595, 0.4808383, 0.08108341, 0.854902, 0, 1, 1,
0.9569986, 0.2954215, 2.392616, 0.8588235, 0, 1, 1,
0.9570994, -0.232987, 1.573085, 0.8666667, 0, 1, 1,
0.9584504, 0.3909536, 1.817551, 0.8705882, 0, 1, 1,
0.963598, -0.7897493, 1.056165, 0.8784314, 0, 1, 1,
0.9644227, -0.4379595, 2.010165, 0.8823529, 0, 1, 1,
0.9672586, 0.3181288, 1.759295, 0.8901961, 0, 1, 1,
0.9676251, -0.767425, 4.218418, 0.8941177, 0, 1, 1,
0.9724035, -0.8387837, 3.127681, 0.9019608, 0, 1, 1,
0.9729647, 0.1659149, 0.8727339, 0.9098039, 0, 1, 1,
0.9761435, -0.08392813, 1.301207, 0.9137255, 0, 1, 1,
0.9776523, -0.4233791, 1.837022, 0.9215686, 0, 1, 1,
0.9781351, -0.4649083, 2.947057, 0.9254902, 0, 1, 1,
0.9799227, 0.8130451, 1.55202, 0.9333333, 0, 1, 1,
0.9822354, -0.1641492, 1.746711, 0.9372549, 0, 1, 1,
0.984145, -0.5195801, 2.057159, 0.945098, 0, 1, 1,
1.013579, 0.5346154, 0.2683534, 0.9490196, 0, 1, 1,
1.01684, 0.06951793, 2.370441, 0.9568627, 0, 1, 1,
1.017169, -0.2289395, 1.220978, 0.9607843, 0, 1, 1,
1.018735, 1.392196, 1.040021, 0.9686275, 0, 1, 1,
1.01963, 0.7474334, 0.886582, 0.972549, 0, 1, 1,
1.023492, -1.319784, 4.080482, 0.9803922, 0, 1, 1,
1.024207, -0.5606425, 1.61651, 0.9843137, 0, 1, 1,
1.028981, -0.3084469, 0.7871147, 0.9921569, 0, 1, 1,
1.04001, -1.077533, 2.414798, 0.9960784, 0, 1, 1,
1.040419, -0.5486014, 2.207296, 1, 0, 0.9960784, 1,
1.052479, 0.6835818, 1.982384, 1, 0, 0.9882353, 1,
1.054592, 0.2489426, 1.211059, 1, 0, 0.9843137, 1,
1.06266, 0.8466659, 1.405567, 1, 0, 0.9764706, 1,
1.06296, 0.5831609, 1.128783, 1, 0, 0.972549, 1,
1.065993, 0.2517302, 2.16987, 1, 0, 0.9647059, 1,
1.067606, 2.251391, 1.82628, 1, 0, 0.9607843, 1,
1.070225, -0.03374149, 2.187123, 1, 0, 0.9529412, 1,
1.082912, 1.557649, 0.3222592, 1, 0, 0.9490196, 1,
1.085713, -0.7307495, 2.471887, 1, 0, 0.9411765, 1,
1.086495, -0.5225233, 0.4408758, 1, 0, 0.9372549, 1,
1.087079, 0.2816078, 0.6289989, 1, 0, 0.9294118, 1,
1.09316, 0.2171331, 2.066605, 1, 0, 0.9254902, 1,
1.095855, -0.1003499, 2.021315, 1, 0, 0.9176471, 1,
1.09726, -1.051062, 1.056231, 1, 0, 0.9137255, 1,
1.100467, -1.203344, 1.764237, 1, 0, 0.9058824, 1,
1.102673, 1.033488, -0.06630851, 1, 0, 0.9019608, 1,
1.103475, -0.5927578, -1.318191, 1, 0, 0.8941177, 1,
1.105115, 0.5280728, 2.471542, 1, 0, 0.8862745, 1,
1.109136, 0.8594573, 0.1599754, 1, 0, 0.8823529, 1,
1.111198, -0.6175034, 0.4461571, 1, 0, 0.8745098, 1,
1.115036, -0.9636651, 2.452356, 1, 0, 0.8705882, 1,
1.115685, 1.494588, 2.315877, 1, 0, 0.8627451, 1,
1.121799, -0.3592694, 1.784544, 1, 0, 0.8588235, 1,
1.139424, 1.7343, -0.09111004, 1, 0, 0.8509804, 1,
1.139426, -2.562781, 2.392049, 1, 0, 0.8470588, 1,
1.140177, 0.1408745, 1.464461, 1, 0, 0.8392157, 1,
1.14847, 0.4138078, 1.485106, 1, 0, 0.8352941, 1,
1.149167, 1.194566, 1.226756, 1, 0, 0.827451, 1,
1.150299, -0.9094962, 2.377301, 1, 0, 0.8235294, 1,
1.151207, -0.3811209, 0.9596301, 1, 0, 0.8156863, 1,
1.153335, 0.9192499, 3.729856, 1, 0, 0.8117647, 1,
1.157869, 1.041669, 0.6963292, 1, 0, 0.8039216, 1,
1.158193, 1.221662, -0.2599688, 1, 0, 0.7960784, 1,
1.17727, 0.687602, 1.612824, 1, 0, 0.7921569, 1,
1.180331, 0.9206339, 0.2579858, 1, 0, 0.7843137, 1,
1.180571, 1.437724, 1.038853, 1, 0, 0.7803922, 1,
1.185727, -1.41544, 3.804053, 1, 0, 0.772549, 1,
1.186521, -0.3530064, 2.411934, 1, 0, 0.7686275, 1,
1.200691, 0.6846798, 0.1847529, 1, 0, 0.7607843, 1,
1.22282, 0.9923478, -1.33513, 1, 0, 0.7568628, 1,
1.224302, 0.9967689, 2.582462, 1, 0, 0.7490196, 1,
1.234991, -0.2194994, 1.70335, 1, 0, 0.7450981, 1,
1.235491, -0.05052225, 2.781829, 1, 0, 0.7372549, 1,
1.237094, -1.109327, 1.81272, 1, 0, 0.7333333, 1,
1.237273, -0.1749161, 4.107468, 1, 0, 0.7254902, 1,
1.237649, -0.2792845, 2.360262, 1, 0, 0.7215686, 1,
1.248257, 0.4555192, 0.445175, 1, 0, 0.7137255, 1,
1.250495, 0.6391107, -0.4554808, 1, 0, 0.7098039, 1,
1.250557, 0.7911733, 1.786411, 1, 0, 0.7019608, 1,
1.251749, -0.204493, 1.318705, 1, 0, 0.6941177, 1,
1.253792, 0.09420539, 1.57702, 1, 0, 0.6901961, 1,
1.260954, 1.531449, -0.02604892, 1, 0, 0.682353, 1,
1.261366, -1.215019, 2.413112, 1, 0, 0.6784314, 1,
1.270176, 1.011029, 0.2061125, 1, 0, 0.6705883, 1,
1.270778, 0.6378267, 1.759429, 1, 0, 0.6666667, 1,
1.276779, -0.2613451, 1.722126, 1, 0, 0.6588235, 1,
1.296349, -1.290326, 2.378235, 1, 0, 0.654902, 1,
1.301573, -1.200918, 3.063503, 1, 0, 0.6470588, 1,
1.302698, -0.2358287, 0.1910189, 1, 0, 0.6431373, 1,
1.303978, 0.7861133, 1.961163, 1, 0, 0.6352941, 1,
1.312632, 0.7815156, 0.8449399, 1, 0, 0.6313726, 1,
1.312916, -1.750563, 5.352403, 1, 0, 0.6235294, 1,
1.326622, -1.703578, 2.328416, 1, 0, 0.6196079, 1,
1.337331, 0.8445769, 0.6705443, 1, 0, 0.6117647, 1,
1.356319, -0.0273076, 1.848777, 1, 0, 0.6078432, 1,
1.371093, 0.3384, 2.593546, 1, 0, 0.6, 1,
1.373871, -1.603914, 2.356169, 1, 0, 0.5921569, 1,
1.380818, -1.306922, 2.93893, 1, 0, 0.5882353, 1,
1.389122, 0.2367387, 2.747234, 1, 0, 0.5803922, 1,
1.389602, -0.2547394, 0.9422005, 1, 0, 0.5764706, 1,
1.390582, -0.8073108, 2.700449, 1, 0, 0.5686275, 1,
1.394183, -0.7608569, 2.187583, 1, 0, 0.5647059, 1,
1.39444, 0.2045618, 2.783142, 1, 0, 0.5568628, 1,
1.400904, 0.6406361, 1.261231, 1, 0, 0.5529412, 1,
1.414756, 0.1848126, 0.0102915, 1, 0, 0.5450981, 1,
1.425207, 2.880118, 0.03976351, 1, 0, 0.5411765, 1,
1.42931, -0.4816926, 2.228722, 1, 0, 0.5333334, 1,
1.433753, -1.058888, 1.997754, 1, 0, 0.5294118, 1,
1.442549, -0.6191657, 3.293217, 1, 0, 0.5215687, 1,
1.451301, 0.7962079, 1.842672, 1, 0, 0.5176471, 1,
1.464638, 0.6936824, 0.7286673, 1, 0, 0.509804, 1,
1.491559, 0.5998472, 1.030316, 1, 0, 0.5058824, 1,
1.510421, -0.1639304, 1.805569, 1, 0, 0.4980392, 1,
1.515479, 0.02035263, 2.338628, 1, 0, 0.4901961, 1,
1.523641, 0.3002943, 2.171115, 1, 0, 0.4862745, 1,
1.536361, -0.8066113, 1.191923, 1, 0, 0.4784314, 1,
1.540915, -0.467382, 2.171466, 1, 0, 0.4745098, 1,
1.552237, -0.8095619, -0.06937055, 1, 0, 0.4666667, 1,
1.566716, 1.203821, -1.170653, 1, 0, 0.4627451, 1,
1.567809, -0.1254392, 2.746676, 1, 0, 0.454902, 1,
1.568636, -0.1835877, 3.598784, 1, 0, 0.4509804, 1,
1.570399, 0.7372141, 1.645857, 1, 0, 0.4431373, 1,
1.595963, 0.8680215, -0.6454691, 1, 0, 0.4392157, 1,
1.597274, -0.4873868, 2.428644, 1, 0, 0.4313726, 1,
1.601527, 1.326515, -0.2622041, 1, 0, 0.427451, 1,
1.604419, -0.9917006, 0.7609037, 1, 0, 0.4196078, 1,
1.624829, 0.310282, 1.753295, 1, 0, 0.4156863, 1,
1.629167, 0.7358221, 0.6925021, 1, 0, 0.4078431, 1,
1.62952, -1.304667, 2.776221, 1, 0, 0.4039216, 1,
1.633317, 0.2994119, 1.732594, 1, 0, 0.3960784, 1,
1.687985, -0.315707, 2.475141, 1, 0, 0.3882353, 1,
1.69135, -0.8672268, 1.661507, 1, 0, 0.3843137, 1,
1.694217, 0.4274341, 2.138974, 1, 0, 0.3764706, 1,
1.694463, 1.283626, 0.9432529, 1, 0, 0.372549, 1,
1.702577, -1.997976, 1.641984, 1, 0, 0.3647059, 1,
1.749351, -0.1073387, 0.4985312, 1, 0, 0.3607843, 1,
1.755115, 1.215768, 2.81179, 1, 0, 0.3529412, 1,
1.757083, -1.383562, 2.201245, 1, 0, 0.3490196, 1,
1.764056, -0.4550289, 1.383188, 1, 0, 0.3411765, 1,
1.764873, 1.632607, -1.315934, 1, 0, 0.3372549, 1,
1.772553, 0.4088884, 0.7190334, 1, 0, 0.3294118, 1,
1.773029, -0.7490615, 2.97209, 1, 0, 0.3254902, 1,
1.780781, 0.3147914, 1.166024, 1, 0, 0.3176471, 1,
1.784768, -2.787552, 1.954956, 1, 0, 0.3137255, 1,
1.7946, 0.631087, -0.0683127, 1, 0, 0.3058824, 1,
1.799461, -1.275127, 1.314156, 1, 0, 0.2980392, 1,
1.815184, -2.104136, 0.572104, 1, 0, 0.2941177, 1,
1.81613, -0.9823285, 3.709731, 1, 0, 0.2862745, 1,
1.827507, 0.3894735, 2.95007, 1, 0, 0.282353, 1,
1.833092, 1.694422, 0.22624, 1, 0, 0.2745098, 1,
1.836206, 1.351102, -0.4628366, 1, 0, 0.2705882, 1,
1.839164, -1.682268, 3.097655, 1, 0, 0.2627451, 1,
1.843222, 1.268245, 2.451981, 1, 0, 0.2588235, 1,
1.849355, 0.1170027, 0.7045946, 1, 0, 0.2509804, 1,
1.852242, 0.4455245, 2.513728, 1, 0, 0.2470588, 1,
1.858122, 0.3001994, 2.715406, 1, 0, 0.2392157, 1,
1.858783, -0.3642343, 4.345676, 1, 0, 0.2352941, 1,
1.888673, 0.299388, 1.880962, 1, 0, 0.227451, 1,
1.894624, 1.417933, 1.388127, 1, 0, 0.2235294, 1,
1.897597, 1.585562, 1.584965, 1, 0, 0.2156863, 1,
1.901127, -0.3022097, 0.1601981, 1, 0, 0.2117647, 1,
1.902013, -0.2832828, 3.032632, 1, 0, 0.2039216, 1,
1.916333, 1.245654, 0.5676647, 1, 0, 0.1960784, 1,
1.962444, -1.714709, 2.318909, 1, 0, 0.1921569, 1,
1.981218, 1.914525, 1.546739, 1, 0, 0.1843137, 1,
2.040903, -0.6322657, 2.180582, 1, 0, 0.1803922, 1,
2.042054, -0.6245263, 1.929539, 1, 0, 0.172549, 1,
2.049593, -0.9000893, 2.912405, 1, 0, 0.1686275, 1,
2.051482, 1.04702, 1.023112, 1, 0, 0.1607843, 1,
2.055674, -0.4461099, 0.5796251, 1, 0, 0.1568628, 1,
2.138992, -0.2132935, 1.120291, 1, 0, 0.1490196, 1,
2.145927, 0.3641736, 3.391913, 1, 0, 0.145098, 1,
2.164851, 1.872393, 0.1864846, 1, 0, 0.1372549, 1,
2.167816, 0.8284166, 2.937764, 1, 0, 0.1333333, 1,
2.16788, -2.922749, 1.996247, 1, 0, 0.1254902, 1,
2.178417, 0.1083175, 2.215346, 1, 0, 0.1215686, 1,
2.222471, -0.4783657, 1.308313, 1, 0, 0.1137255, 1,
2.235985, 0.8515038, 2.351051, 1, 0, 0.1098039, 1,
2.26208, 0.289791, 2.547086, 1, 0, 0.1019608, 1,
2.268286, -0.6965827, 1.857181, 1, 0, 0.09411765, 1,
2.276677, 1.596979, -0.1460822, 1, 0, 0.09019608, 1,
2.321779, 0.5736669, 1.934309, 1, 0, 0.08235294, 1,
2.325443, 0.2609328, -0.07360402, 1, 0, 0.07843138, 1,
2.375986, 1.319049, 1.455642, 1, 0, 0.07058824, 1,
2.384758, -0.5500844, 1.170637, 1, 0, 0.06666667, 1,
2.401879, -0.1788886, 2.677608, 1, 0, 0.05882353, 1,
2.40294, -0.04366594, 1.488345, 1, 0, 0.05490196, 1,
2.406477, 0.06356083, 2.150839, 1, 0, 0.04705882, 1,
2.445457, 0.7757784, 1.53508, 1, 0, 0.04313726, 1,
2.496408, 0.177586, 0.9449146, 1, 0, 0.03529412, 1,
2.564082, -1.041469, 1.44702, 1, 0, 0.03137255, 1,
2.637186, -1.397116, 1.536212, 1, 0, 0.02352941, 1,
2.735554, 1.098925, 1.842222, 1, 0, 0.01960784, 1,
3.077225, -1.509563, 2.770339, 1, 0, 0.01176471, 1,
3.581552, 1.576298, 1.162362, 1, 0, 0.007843138, 1
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
0.1248449, -4.198724, -7.056273, 0, -0.5, 0.5, 0.5,
0.1248449, -4.198724, -7.056273, 1, -0.5, 0.5, 0.5,
0.1248449, -4.198724, -7.056273, 1, 1.5, 0.5, 0.5,
0.1248449, -4.198724, -7.056273, 0, 1.5, 0.5, 0.5
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
-4.503686, -0.06182683, -7.056273, 0, -0.5, 0.5, 0.5,
-4.503686, -0.06182683, -7.056273, 1, -0.5, 0.5, 0.5,
-4.503686, -0.06182683, -7.056273, 1, 1.5, 0.5, 0.5,
-4.503686, -0.06182683, -7.056273, 0, 1.5, 0.5, 0.5
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
-4.503686, -4.198724, 0.0472827, 0, -0.5, 0.5, 0.5,
-4.503686, -4.198724, 0.0472827, 1, -0.5, 0.5, 0.5,
-4.503686, -4.198724, 0.0472827, 1, 1.5, 0.5, 0.5,
-4.503686, -4.198724, 0.0472827, 0, 1.5, 0.5, 0.5
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
-3, -3.244055, -5.416991,
3, -3.244055, -5.416991,
-3, -3.244055, -5.416991,
-3, -3.403167, -5.690205,
-2, -3.244055, -5.416991,
-2, -3.403167, -5.690205,
-1, -3.244055, -5.416991,
-1, -3.403167, -5.690205,
0, -3.244055, -5.416991,
0, -3.403167, -5.690205,
1, -3.244055, -5.416991,
1, -3.403167, -5.690205,
2, -3.244055, -5.416991,
2, -3.403167, -5.690205,
3, -3.244055, -5.416991,
3, -3.403167, -5.690205
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
-3, -3.721389, -6.236632, 0, -0.5, 0.5, 0.5,
-3, -3.721389, -6.236632, 1, -0.5, 0.5, 0.5,
-3, -3.721389, -6.236632, 1, 1.5, 0.5, 0.5,
-3, -3.721389, -6.236632, 0, 1.5, 0.5, 0.5,
-2, -3.721389, -6.236632, 0, -0.5, 0.5, 0.5,
-2, -3.721389, -6.236632, 1, -0.5, 0.5, 0.5,
-2, -3.721389, -6.236632, 1, 1.5, 0.5, 0.5,
-2, -3.721389, -6.236632, 0, 1.5, 0.5, 0.5,
-1, -3.721389, -6.236632, 0, -0.5, 0.5, 0.5,
-1, -3.721389, -6.236632, 1, -0.5, 0.5, 0.5,
-1, -3.721389, -6.236632, 1, 1.5, 0.5, 0.5,
-1, -3.721389, -6.236632, 0, 1.5, 0.5, 0.5,
0, -3.721389, -6.236632, 0, -0.5, 0.5, 0.5,
0, -3.721389, -6.236632, 1, -0.5, 0.5, 0.5,
0, -3.721389, -6.236632, 1, 1.5, 0.5, 0.5,
0, -3.721389, -6.236632, 0, 1.5, 0.5, 0.5,
1, -3.721389, -6.236632, 0, -0.5, 0.5, 0.5,
1, -3.721389, -6.236632, 1, -0.5, 0.5, 0.5,
1, -3.721389, -6.236632, 1, 1.5, 0.5, 0.5,
1, -3.721389, -6.236632, 0, 1.5, 0.5, 0.5,
2, -3.721389, -6.236632, 0, -0.5, 0.5, 0.5,
2, -3.721389, -6.236632, 1, -0.5, 0.5, 0.5,
2, -3.721389, -6.236632, 1, 1.5, 0.5, 0.5,
2, -3.721389, -6.236632, 0, 1.5, 0.5, 0.5,
3, -3.721389, -6.236632, 0, -0.5, 0.5, 0.5,
3, -3.721389, -6.236632, 1, -0.5, 0.5, 0.5,
3, -3.721389, -6.236632, 1, 1.5, 0.5, 0.5,
3, -3.721389, -6.236632, 0, 1.5, 0.5, 0.5
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
-3.435564, -3, -5.416991,
-3.435564, 3, -5.416991,
-3.435564, -3, -5.416991,
-3.613584, -3, -5.690205,
-3.435564, -2, -5.416991,
-3.613584, -2, -5.690205,
-3.435564, -1, -5.416991,
-3.613584, -1, -5.690205,
-3.435564, 0, -5.416991,
-3.613584, 0, -5.690205,
-3.435564, 1, -5.416991,
-3.613584, 1, -5.690205,
-3.435564, 2, -5.416991,
-3.613584, 2, -5.690205,
-3.435564, 3, -5.416991,
-3.613584, 3, -5.690205
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
-3.969625, -3, -6.236632, 0, -0.5, 0.5, 0.5,
-3.969625, -3, -6.236632, 1, -0.5, 0.5, 0.5,
-3.969625, -3, -6.236632, 1, 1.5, 0.5, 0.5,
-3.969625, -3, -6.236632, 0, 1.5, 0.5, 0.5,
-3.969625, -2, -6.236632, 0, -0.5, 0.5, 0.5,
-3.969625, -2, -6.236632, 1, -0.5, 0.5, 0.5,
-3.969625, -2, -6.236632, 1, 1.5, 0.5, 0.5,
-3.969625, -2, -6.236632, 0, 1.5, 0.5, 0.5,
-3.969625, -1, -6.236632, 0, -0.5, 0.5, 0.5,
-3.969625, -1, -6.236632, 1, -0.5, 0.5, 0.5,
-3.969625, -1, -6.236632, 1, 1.5, 0.5, 0.5,
-3.969625, -1, -6.236632, 0, 1.5, 0.5, 0.5,
-3.969625, 0, -6.236632, 0, -0.5, 0.5, 0.5,
-3.969625, 0, -6.236632, 1, -0.5, 0.5, 0.5,
-3.969625, 0, -6.236632, 1, 1.5, 0.5, 0.5,
-3.969625, 0, -6.236632, 0, 1.5, 0.5, 0.5,
-3.969625, 1, -6.236632, 0, -0.5, 0.5, 0.5,
-3.969625, 1, -6.236632, 1, -0.5, 0.5, 0.5,
-3.969625, 1, -6.236632, 1, 1.5, 0.5, 0.5,
-3.969625, 1, -6.236632, 0, 1.5, 0.5, 0.5,
-3.969625, 2, -6.236632, 0, -0.5, 0.5, 0.5,
-3.969625, 2, -6.236632, 1, -0.5, 0.5, 0.5,
-3.969625, 2, -6.236632, 1, 1.5, 0.5, 0.5,
-3.969625, 2, -6.236632, 0, 1.5, 0.5, 0.5,
-3.969625, 3, -6.236632, 0, -0.5, 0.5, 0.5,
-3.969625, 3, -6.236632, 1, -0.5, 0.5, 0.5,
-3.969625, 3, -6.236632, 1, 1.5, 0.5, 0.5,
-3.969625, 3, -6.236632, 0, 1.5, 0.5, 0.5
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
-3.435564, -3.244055, -4,
-3.435564, -3.244055, 4,
-3.435564, -3.244055, -4,
-3.613584, -3.403167, -4,
-3.435564, -3.244055, -2,
-3.613584, -3.403167, -2,
-3.435564, -3.244055, 0,
-3.613584, -3.403167, 0,
-3.435564, -3.244055, 2,
-3.613584, -3.403167, 2,
-3.435564, -3.244055, 4,
-3.613584, -3.403167, 4
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
-3.969625, -3.721389, -4, 0, -0.5, 0.5, 0.5,
-3.969625, -3.721389, -4, 1, -0.5, 0.5, 0.5,
-3.969625, -3.721389, -4, 1, 1.5, 0.5, 0.5,
-3.969625, -3.721389, -4, 0, 1.5, 0.5, 0.5,
-3.969625, -3.721389, -2, 0, -0.5, 0.5, 0.5,
-3.969625, -3.721389, -2, 1, -0.5, 0.5, 0.5,
-3.969625, -3.721389, -2, 1, 1.5, 0.5, 0.5,
-3.969625, -3.721389, -2, 0, 1.5, 0.5, 0.5,
-3.969625, -3.721389, 0, 0, -0.5, 0.5, 0.5,
-3.969625, -3.721389, 0, 1, -0.5, 0.5, 0.5,
-3.969625, -3.721389, 0, 1, 1.5, 0.5, 0.5,
-3.969625, -3.721389, 0, 0, 1.5, 0.5, 0.5,
-3.969625, -3.721389, 2, 0, -0.5, 0.5, 0.5,
-3.969625, -3.721389, 2, 1, -0.5, 0.5, 0.5,
-3.969625, -3.721389, 2, 1, 1.5, 0.5, 0.5,
-3.969625, -3.721389, 2, 0, 1.5, 0.5, 0.5,
-3.969625, -3.721389, 4, 0, -0.5, 0.5, 0.5,
-3.969625, -3.721389, 4, 1, -0.5, 0.5, 0.5,
-3.969625, -3.721389, 4, 1, 1.5, 0.5, 0.5,
-3.969625, -3.721389, 4, 0, 1.5, 0.5, 0.5
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
-3.435564, -3.244055, -5.416991,
-3.435564, 3.120401, -5.416991,
-3.435564, -3.244055, 5.511556,
-3.435564, 3.120401, 5.511556,
-3.435564, -3.244055, -5.416991,
-3.435564, -3.244055, 5.511556,
-3.435564, 3.120401, -5.416991,
-3.435564, 3.120401, 5.511556,
-3.435564, -3.244055, -5.416991,
3.685253, -3.244055, -5.416991,
-3.435564, -3.244055, 5.511556,
3.685253, -3.244055, 5.511556,
-3.435564, 3.120401, -5.416991,
3.685253, 3.120401, -5.416991,
-3.435564, 3.120401, 5.511556,
3.685253, 3.120401, 5.511556,
3.685253, -3.244055, -5.416991,
3.685253, 3.120401, -5.416991,
3.685253, -3.244055, 5.511556,
3.685253, 3.120401, 5.511556,
3.685253, -3.244055, -5.416991,
3.685253, -3.244055, 5.511556,
3.685253, 3.120401, -5.416991,
3.685253, 3.120401, 5.511556
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
var radius = 7.749997;
var distance = 34.48061;
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
mvMatrix.translate( -0.1248449, 0.06182683, -0.0472827 );
mvMatrix.scale( 1.176754, 1.316601, 0.7667487 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.48061);
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
etiolate<-read.table("etiolate.xyz")
```

```
## Error in read.table("etiolate.xyz"): no lines available in input
```

```r
x<-etiolate$V2
```

```
## Error in eval(expr, envir, enclos): object 'etiolate' not found
```

```r
y<-etiolate$V3
```

```
## Error in eval(expr, envir, enclos): object 'etiolate' not found
```

```r
z<-etiolate$V4
```

```
## Error in eval(expr, envir, enclos): object 'etiolate' not found
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
-3.331862, -0.4324597, -1.137119, 0, 0, 1, 1, 1,
-3.235873, 1.187186, -2.191371, 1, 0, 0, 1, 1,
-3.006175, -1.141748, -1.565351, 1, 0, 0, 1, 1,
-2.997264, 0.9573249, 0.3815012, 1, 0, 0, 1, 1,
-2.929447, -0.779416, -3.563038, 1, 0, 0, 1, 1,
-2.629685, -0.6288559, -2.116664, 1, 0, 0, 1, 1,
-2.320809, 1.309412, -1.355555, 0, 0, 0, 1, 1,
-2.273001, 0.08514786, -0.8364094, 0, 0, 0, 1, 1,
-2.271175, 1.326848, -1.735518, 0, 0, 0, 1, 1,
-2.211373, 1.176138, -1.892365, 0, 0, 0, 1, 1,
-2.1683, 0.8929437, -0.3874818, 0, 0, 0, 1, 1,
-2.157881, -0.6977074, -0.4423134, 0, 0, 0, 1, 1,
-2.133372, -0.06177158, -0.9438505, 0, 0, 0, 1, 1,
-2.085127, 0.8393223, -0.8097426, 1, 1, 1, 1, 1,
-2.078208, -0.2655478, -0.5876577, 1, 1, 1, 1, 1,
-2.070629, 0.2195835, -1.059052, 1, 1, 1, 1, 1,
-2.069649, 0.5645364, -1.461616, 1, 1, 1, 1, 1,
-2.020827, -0.1245423, -2.589291, 1, 1, 1, 1, 1,
-2.012224, -0.6841291, -1.718684, 1, 1, 1, 1, 1,
-2.010328, -1.945949, -1.87179, 1, 1, 1, 1, 1,
-1.973209, 0.6033272, -0.7024431, 1, 1, 1, 1, 1,
-1.965322, -0.01902456, -3.193978, 1, 1, 1, 1, 1,
-1.9611, -0.8160905, -2.100684, 1, 1, 1, 1, 1,
-1.941451, -0.3093747, -2.765351, 1, 1, 1, 1, 1,
-1.93875, 0.3031552, -1.505698, 1, 1, 1, 1, 1,
-1.935298, -0.7223569, 0.02051461, 1, 1, 1, 1, 1,
-1.914893, 0.4050292, -2.732668, 1, 1, 1, 1, 1,
-1.88077, -0.119562, -3.223879, 1, 1, 1, 1, 1,
-1.866354, 1.012984, -0.3949905, 0, 0, 1, 1, 1,
-1.844725, 0.2921208, -0.8556553, 1, 0, 0, 1, 1,
-1.769609, -0.6394265, -3.562175, 1, 0, 0, 1, 1,
-1.737789, -0.7536083, -2.413897, 1, 0, 0, 1, 1,
-1.709001, -0.487782, -3.419336, 1, 0, 0, 1, 1,
-1.708883, -0.5247474, -2.173444, 1, 0, 0, 1, 1,
-1.684381, 0.3993195, -1.386285, 0, 0, 0, 1, 1,
-1.682652, 0.3568737, -2.168318, 0, 0, 0, 1, 1,
-1.681334, 0.4180052, -0.6936548, 0, 0, 0, 1, 1,
-1.645415, 0.8502749, -1.499901, 0, 0, 0, 1, 1,
-1.638916, 0.4047561, -0.2684961, 0, 0, 0, 1, 1,
-1.629926, 0.04831343, -3.100507, 0, 0, 0, 1, 1,
-1.625486, 1.410634, -0.3649698, 0, 0, 0, 1, 1,
-1.618028, -0.02790217, -2.325265, 1, 1, 1, 1, 1,
-1.615525, 1.363148, -1.182755, 1, 1, 1, 1, 1,
-1.612735, -0.669787, -2.877864, 1, 1, 1, 1, 1,
-1.586606, 0.6993102, -2.143911, 1, 1, 1, 1, 1,
-1.581257, 0.7435969, -1.621961, 1, 1, 1, 1, 1,
-1.573495, 0.8311207, -0.9679475, 1, 1, 1, 1, 1,
-1.570976, 0.3359727, -0.8634514, 1, 1, 1, 1, 1,
-1.569048, -0.9282084, -0.2474252, 1, 1, 1, 1, 1,
-1.567437, 0.2307833, -2.3621, 1, 1, 1, 1, 1,
-1.558312, -0.3023455, -3.199346, 1, 1, 1, 1, 1,
-1.537683, 0.9610366, -1.628865, 1, 1, 1, 1, 1,
-1.525789, -0.07022195, -1.25095, 1, 1, 1, 1, 1,
-1.521022, 1.678849, 0.4783973, 1, 1, 1, 1, 1,
-1.516692, 0.004620305, -0.1753377, 1, 1, 1, 1, 1,
-1.506042, 1.251761, -0.5849926, 1, 1, 1, 1, 1,
-1.502866, -0.5215862, -1.610037, 0, 0, 1, 1, 1,
-1.499851, 0.1452063, -2.305476, 1, 0, 0, 1, 1,
-1.491819, -0.03219775, -1.556119, 1, 0, 0, 1, 1,
-1.472985, -1.517149, -0.2463559, 1, 0, 0, 1, 1,
-1.469015, -0.8470019, -3.179525, 1, 0, 0, 1, 1,
-1.467208, -0.9066607, -2.095488, 1, 0, 0, 1, 1,
-1.451744, -0.4249267, -1.767547, 0, 0, 0, 1, 1,
-1.444162, -0.698144, -1.698932, 0, 0, 0, 1, 1,
-1.441647, 1.527036, 0.5237354, 0, 0, 0, 1, 1,
-1.428901, -1.434246, -2.242736, 0, 0, 0, 1, 1,
-1.425544, -0.008342929, -2.509969, 0, 0, 0, 1, 1,
-1.423342, -1.616859, -1.820738, 0, 0, 0, 1, 1,
-1.422032, 0.5617041, -1.421111, 0, 0, 0, 1, 1,
-1.415477, 1.395408, -1.339848, 1, 1, 1, 1, 1,
-1.387249, -1.489634, -3.844492, 1, 1, 1, 1, 1,
-1.385228, 0.61471, -0.7127502, 1, 1, 1, 1, 1,
-1.377425, -1.033968, -0.3875901, 1, 1, 1, 1, 1,
-1.374472, -0.9626734, -1.878926, 1, 1, 1, 1, 1,
-1.367681, 1.441223, 0.4654474, 1, 1, 1, 1, 1,
-1.366305, -0.1222162, -0.4659425, 1, 1, 1, 1, 1,
-1.359501, 1.295032, -0.7587025, 1, 1, 1, 1, 1,
-1.356473, 0.2948692, 0.2223476, 1, 1, 1, 1, 1,
-1.355967, 0.1273817, -1.602016, 1, 1, 1, 1, 1,
-1.348346, 0.6841269, 0.7224188, 1, 1, 1, 1, 1,
-1.343877, -0.4186804, -1.878108, 1, 1, 1, 1, 1,
-1.333181, -1.598608, -2.83208, 1, 1, 1, 1, 1,
-1.323937, -0.3985106, 0.6339383, 1, 1, 1, 1, 1,
-1.311134, 3.027715, -0.6350898, 1, 1, 1, 1, 1,
-1.307623, -0.30925, -1.813359, 0, 0, 1, 1, 1,
-1.301825, 0.3548175, -2.496537, 1, 0, 0, 1, 1,
-1.290073, -0.1710224, -2.13233, 1, 0, 0, 1, 1,
-1.28527, 0.0137911, -2.233578, 1, 0, 0, 1, 1,
-1.277907, 1.372911, -0.5790241, 1, 0, 0, 1, 1,
-1.276044, 0.8308214, -3.035093, 1, 0, 0, 1, 1,
-1.267864, 1.037593, -1.880197, 0, 0, 0, 1, 1,
-1.267161, 0.4973313, -0.6197361, 0, 0, 0, 1, 1,
-1.259762, 0.4053149, -0.9356385, 0, 0, 0, 1, 1,
-1.259587, -0.5712437, -1.587565, 0, 0, 0, 1, 1,
-1.250503, -0.1430122, -2.618797, 0, 0, 0, 1, 1,
-1.246539, 2.495663, -0.1812946, 0, 0, 0, 1, 1,
-1.239955, -0.2591462, -2.537101, 0, 0, 0, 1, 1,
-1.223441, 0.6881599, 2.401436, 1, 1, 1, 1, 1,
-1.208526, -0.5787224, -0.7939027, 1, 1, 1, 1, 1,
-1.202692, -0.2921585, -1.590162, 1, 1, 1, 1, 1,
-1.195127, 1.191194, -2.399758, 1, 1, 1, 1, 1,
-1.194875, -0.6039331, -2.053943, 1, 1, 1, 1, 1,
-1.194533, 1.51161, 0.0252489, 1, 1, 1, 1, 1,
-1.191219, -0.6429764, -3.782856, 1, 1, 1, 1, 1,
-1.185627, 1.158052, -2.05858, 1, 1, 1, 1, 1,
-1.146832, 1.511758, -0.6046556, 1, 1, 1, 1, 1,
-1.140281, 0.04825905, -1.529819, 1, 1, 1, 1, 1,
-1.123306, 0.07685668, -2.089232, 1, 1, 1, 1, 1,
-1.119804, -0.7830473, -1.123782, 1, 1, 1, 1, 1,
-1.118136, -0.1527875, -2.457858, 1, 1, 1, 1, 1,
-1.116125, 0.04021641, -1.604591, 1, 1, 1, 1, 1,
-1.11463, 2.055037, 0.9593329, 1, 1, 1, 1, 1,
-1.113496, 0.3494339, -2.960417, 0, 0, 1, 1, 1,
-1.110065, -1.024658, -2.168725, 1, 0, 0, 1, 1,
-1.107883, 0.87839, -1.823211, 1, 0, 0, 1, 1,
-1.10692, -2.024582, -1.643313, 1, 0, 0, 1, 1,
-1.095574, -0.8109467, -2.516545, 1, 0, 0, 1, 1,
-1.090881, -0.008576615, -3.442248, 1, 0, 0, 1, 1,
-1.089606, 1.152846, -1.70298, 0, 0, 0, 1, 1,
-1.089277, 0.2135246, -3.102274, 0, 0, 0, 1, 1,
-1.081312, 0.4196039, -1.721499, 0, 0, 0, 1, 1,
-1.079077, 1.678873, -0.3748533, 0, 0, 0, 1, 1,
-1.078929, -1.250754, -1.49125, 0, 0, 0, 1, 1,
-1.078719, -1.176108, -3.304177, 0, 0, 0, 1, 1,
-1.077919, 0.2587466, -2.332502, 0, 0, 0, 1, 1,
-1.072968, 0.2147929, -1.037476, 1, 1, 1, 1, 1,
-1.072857, 0.1694753, -2.721437, 1, 1, 1, 1, 1,
-1.061868, -0.03786995, -2.316026, 1, 1, 1, 1, 1,
-1.05468, -0.2184938, -2.52115, 1, 1, 1, 1, 1,
-1.04874, -0.2082682, -3.311643, 1, 1, 1, 1, 1,
-1.04722, 0.5406036, -1.85717, 1, 1, 1, 1, 1,
-1.04238, 0.0004469806, -2.042305, 1, 1, 1, 1, 1,
-1.030344, -0.5827902, -3.200084, 1, 1, 1, 1, 1,
-1.029246, -0.06694887, -3.294196, 1, 1, 1, 1, 1,
-1.018793, 1.251007, -0.2485183, 1, 1, 1, 1, 1,
-1.016042, 0.3333057, -0.3403036, 1, 1, 1, 1, 1,
-1.015391, 1.074825, -0.08864903, 1, 1, 1, 1, 1,
-1.012929, 1.232285, -1.673208, 1, 1, 1, 1, 1,
-1.010901, 0.5535107, -1.124415, 1, 1, 1, 1, 1,
-1.010254, 0.296937, -1.866286, 1, 1, 1, 1, 1,
-1.009181, 0.8450008, -0.8212788, 0, 0, 1, 1, 1,
-1.008632, -0.2589374, -0.3752899, 1, 0, 0, 1, 1,
-1.007553, 0.8099241, -0.7362646, 1, 0, 0, 1, 1,
-1.000407, -0.9432908, -3.147881, 1, 0, 0, 1, 1,
-0.9993663, 1.101326, -2.556172, 1, 0, 0, 1, 1,
-0.9948366, -0.8474201, -2.849233, 1, 0, 0, 1, 1,
-0.9916031, 0.1153227, -1.602409, 0, 0, 0, 1, 1,
-0.9884903, -0.8400084, -1.340568, 0, 0, 0, 1, 1,
-0.9838461, 2.800654, -0.2588392, 0, 0, 0, 1, 1,
-0.9768132, -0.1835408, -0.9703099, 0, 0, 0, 1, 1,
-0.9695454, 0.1907119, -2.508013, 0, 0, 0, 1, 1,
-0.9688451, -0.02211354, -1.586375, 0, 0, 0, 1, 1,
-0.9652038, -1.293654, -3.077483, 0, 0, 0, 1, 1,
-0.9632544, -0.09649454, -1.429625, 1, 1, 1, 1, 1,
-0.9626843, -0.3939457, -1.42102, 1, 1, 1, 1, 1,
-0.9612757, 0.1733813, 0.02555083, 1, 1, 1, 1, 1,
-0.9605885, 1.942204, -1.759244, 1, 1, 1, 1, 1,
-0.9598565, 1.170813, 1.462403, 1, 1, 1, 1, 1,
-0.9562257, 1.363022, 0.1710545, 1, 1, 1, 1, 1,
-0.950883, -0.3810914, -1.643595, 1, 1, 1, 1, 1,
-0.9449584, 0.5013643, -1.982755, 1, 1, 1, 1, 1,
-0.9400793, 0.3332027, 0.07675847, 1, 1, 1, 1, 1,
-0.934106, 0.2039108, -0.326641, 1, 1, 1, 1, 1,
-0.9254467, 1.905674, -0.5491914, 1, 1, 1, 1, 1,
-0.9178642, 1.473226, -2.088603, 1, 1, 1, 1, 1,
-0.9154583, 1.462864, -0.3985777, 1, 1, 1, 1, 1,
-0.9154537, -0.600733, -0.2776093, 1, 1, 1, 1, 1,
-0.9083546, -0.46528, -0.8048618, 1, 1, 1, 1, 1,
-0.8997949, 1.156538, -0.140169, 0, 0, 1, 1, 1,
-0.8914578, -0.1329551, -3.04893, 1, 0, 0, 1, 1,
-0.8843064, -0.6505488, -1.084471, 1, 0, 0, 1, 1,
-0.8830426, 0.884711, -3.715413, 1, 0, 0, 1, 1,
-0.8777143, -0.1535697, -1.629917, 1, 0, 0, 1, 1,
-0.877303, 0.1820306, -0.4425257, 1, 0, 0, 1, 1,
-0.875589, -0.105586, -1.136805, 0, 0, 0, 1, 1,
-0.8747955, 1.465125, -0.2975049, 0, 0, 0, 1, 1,
-0.8725055, -1.184412, -3.05333, 0, 0, 0, 1, 1,
-0.8701919, -2.055222, -2.807844, 0, 0, 0, 1, 1,
-0.8602247, 0.9455643, -1.818346, 0, 0, 0, 1, 1,
-0.8593218, 1.073671, -0.4909989, 0, 0, 0, 1, 1,
-0.8492191, -0.6452466, -2.487558, 0, 0, 0, 1, 1,
-0.8474783, -1.813798, -3.014328, 1, 1, 1, 1, 1,
-0.84633, 0.5380913, -1.070992, 1, 1, 1, 1, 1,
-0.8385007, -0.915722, -0.05274549, 1, 1, 1, 1, 1,
-0.8347203, -1.578101, -3.110537, 1, 1, 1, 1, 1,
-0.8339186, 0.4589559, -0.06546177, 1, 1, 1, 1, 1,
-0.8310271, -0.4804686, -1.184527, 1, 1, 1, 1, 1,
-0.8263515, 2.235263, -0.03297945, 1, 1, 1, 1, 1,
-0.8247092, 1.346266, 0.4013085, 1, 1, 1, 1, 1,
-0.8233161, 0.6429783, -1.043816, 1, 1, 1, 1, 1,
-0.8202447, 0.5533522, -2.351503, 1, 1, 1, 1, 1,
-0.8183202, -0.07743056, 0.0268991, 1, 1, 1, 1, 1,
-0.8178689, 0.3361358, -1.270069, 1, 1, 1, 1, 1,
-0.8177839, 0.7726097, -2.202809, 1, 1, 1, 1, 1,
-0.8165883, -1.934122, -2.525807, 1, 1, 1, 1, 1,
-0.8047565, -0.5352004, -0.5882841, 1, 1, 1, 1, 1,
-0.8034747, -0.07487486, -1.6312, 0, 0, 1, 1, 1,
-0.8033186, -0.8363823, -2.221188, 1, 0, 0, 1, 1,
-0.8022308, -0.605785, -0.3586187, 1, 0, 0, 1, 1,
-0.7998535, 1.153645, -0.8410174, 1, 0, 0, 1, 1,
-0.7946938, 0.9927323, 0.1542389, 1, 0, 0, 1, 1,
-0.7879879, 0.09441169, -0.9111063, 1, 0, 0, 1, 1,
-0.7830904, 1.964115, -0.6614541, 0, 0, 0, 1, 1,
-0.7823704, -0.7593533, -3.385839, 0, 0, 0, 1, 1,
-0.7774712, 0.6244025, -1.058808, 0, 0, 0, 1, 1,
-0.7725112, -0.2742347, -1.114387, 0, 0, 0, 1, 1,
-0.7709267, 1.571379, -0.3199592, 0, 0, 0, 1, 1,
-0.7705835, 0.2954791, -0.2566157, 0, 0, 0, 1, 1,
-0.7674217, -0.718665, -1.832486, 0, 0, 0, 1, 1,
-0.7670501, 0.6873081, -1.885771, 1, 1, 1, 1, 1,
-0.7640313, -0.03007662, -1.419812, 1, 1, 1, 1, 1,
-0.7614876, 0.04407867, -1.550656, 1, 1, 1, 1, 1,
-0.7611361, 2.015672, -1.033838, 1, 1, 1, 1, 1,
-0.7540951, 0.3784753, -1.011032, 1, 1, 1, 1, 1,
-0.7535427, 0.8088261, -2.796388, 1, 1, 1, 1, 1,
-0.7517174, 0.5496573, -1.003155, 1, 1, 1, 1, 1,
-0.7449305, 0.3706662, -0.3060316, 1, 1, 1, 1, 1,
-0.7433788, -0.76015, -2.043735, 1, 1, 1, 1, 1,
-0.7390403, 0.05872285, -1.085365, 1, 1, 1, 1, 1,
-0.7259501, 1.12433, -0.7500713, 1, 1, 1, 1, 1,
-0.7247087, -0.1758632, -1.998244, 1, 1, 1, 1, 1,
-0.7236518, -0.102929, -2.099753, 1, 1, 1, 1, 1,
-0.7234893, 0.1620063, -1.307083, 1, 1, 1, 1, 1,
-0.7164006, 0.4793957, -0.1485212, 1, 1, 1, 1, 1,
-0.7137986, -0.5227975, -2.733547, 0, 0, 1, 1, 1,
-0.7118511, 1.605387, 1.474654, 1, 0, 0, 1, 1,
-0.7098523, -0.6134751, -2.331089, 1, 0, 0, 1, 1,
-0.706687, -0.03989031, -2.958064, 1, 0, 0, 1, 1,
-0.6943232, 0.2423758, -0.8896126, 1, 0, 0, 1, 1,
-0.6889114, 0.8210996, -2.148182, 1, 0, 0, 1, 1,
-0.6881756, 0.1431149, -1.777038, 0, 0, 0, 1, 1,
-0.6829422, 1.568871, 0.8354136, 0, 0, 0, 1, 1,
-0.677403, 0.2786043, -2.613902, 0, 0, 0, 1, 1,
-0.6690422, -1.106189, -4.005271, 0, 0, 0, 1, 1,
-0.6673058, 0.5437405, -0.9256157, 0, 0, 0, 1, 1,
-0.6579052, -0.6157264, -1.949879, 0, 0, 0, 1, 1,
-0.6557186, 0.1354338, -1.495574, 0, 0, 0, 1, 1,
-0.6551935, 0.353375, -0.785679, 1, 1, 1, 1, 1,
-0.6539082, -0.1885172, -2.024447, 1, 1, 1, 1, 1,
-0.6471294, 1.832477, -1.446575, 1, 1, 1, 1, 1,
-0.6441525, 0.5287166, 0.512368, 1, 1, 1, 1, 1,
-0.6417933, 1.598702, -0.0181319, 1, 1, 1, 1, 1,
-0.6406593, -0.0326509, -3.095192, 1, 1, 1, 1, 1,
-0.6326993, -0.6142141, -2.456822, 1, 1, 1, 1, 1,
-0.6314406, 2.170978, 2.122639, 1, 1, 1, 1, 1,
-0.6296398, -0.3779511, -2.812274, 1, 1, 1, 1, 1,
-0.6283198, 0.4611931, -1.800014, 1, 1, 1, 1, 1,
-0.6259653, -0.2224509, -1.289821, 1, 1, 1, 1, 1,
-0.622748, -1.531931, -4.102759, 1, 1, 1, 1, 1,
-0.6134297, -2.479125, -3.554852, 1, 1, 1, 1, 1,
-0.6125493, -1.32196, -3.264838, 1, 1, 1, 1, 1,
-0.6086184, 0.01602774, -1.948786, 1, 1, 1, 1, 1,
-0.6086116, -0.582584, -1.575313, 0, 0, 1, 1, 1,
-0.6085811, 0.2689869, 0.5072556, 1, 0, 0, 1, 1,
-0.6084884, -0.8426765, -1.903177, 1, 0, 0, 1, 1,
-0.5994657, -1.270443, -3.534873, 1, 0, 0, 1, 1,
-0.5991955, -0.8394279, -1.983665, 1, 0, 0, 1, 1,
-0.5986568, 0.265339, -1.340187, 1, 0, 0, 1, 1,
-0.5979397, -1.39716, -2.210358, 0, 0, 0, 1, 1,
-0.596759, 0.2513456, -1.6019, 0, 0, 0, 1, 1,
-0.5874681, 0.1621419, -1.452979, 0, 0, 0, 1, 1,
-0.5816641, 0.06751592, -1.53831, 0, 0, 0, 1, 1,
-0.5800036, 1.292207, -0.386418, 0, 0, 0, 1, 1,
-0.5780644, 0.5900939, 1.359555, 0, 0, 0, 1, 1,
-0.5729315, -0.9127311, -2.041223, 0, 0, 0, 1, 1,
-0.5693547, 0.07640339, 0.7585827, 1, 1, 1, 1, 1,
-0.5684902, 0.3973571, -1.053771, 1, 1, 1, 1, 1,
-0.566823, 0.1641633, -2.294559, 1, 1, 1, 1, 1,
-0.5661973, 1.27527, -0.6565451, 1, 1, 1, 1, 1,
-0.5621058, 1.064878, 0.3039781, 1, 1, 1, 1, 1,
-0.5587581, 0.7477994, -1.087716, 1, 1, 1, 1, 1,
-0.5551471, -0.8023914, -3.168854, 1, 1, 1, 1, 1,
-0.5530799, -0.9126974, -2.808209, 1, 1, 1, 1, 1,
-0.5527059, -0.4090068, -3.102097, 1, 1, 1, 1, 1,
-0.550378, 1.075055, -0.4617073, 1, 1, 1, 1, 1,
-0.5499052, 1.341775, -0.7521542, 1, 1, 1, 1, 1,
-0.5465461, 0.1929841, -1.565805, 1, 1, 1, 1, 1,
-0.544044, 0.04277064, -0.5263894, 1, 1, 1, 1, 1,
-0.5408232, -0.02912087, -2.182329, 1, 1, 1, 1, 1,
-0.5321823, -0.4696641, -2.164942, 1, 1, 1, 1, 1,
-0.5223053, -0.5632224, -2.869615, 0, 0, 1, 1, 1,
-0.5186998, 0.4736192, 1.045267, 1, 0, 0, 1, 1,
-0.5148823, -1.262903, -2.167553, 1, 0, 0, 1, 1,
-0.4998657, -1.215377, -3.531233, 1, 0, 0, 1, 1,
-0.4981202, -0.889334, -2.132189, 1, 0, 0, 1, 1,
-0.4967853, -0.8847435, -2.517867, 1, 0, 0, 1, 1,
-0.4955471, 0.4868177, -0.2648772, 0, 0, 0, 1, 1,
-0.4938571, 1.563887, -2.650365, 0, 0, 0, 1, 1,
-0.4937586, -0.7596766, -3.21029, 0, 0, 0, 1, 1,
-0.4909371, 1.237176, 1.023747, 0, 0, 0, 1, 1,
-0.4859821, -0.2302663, -1.777416, 0, 0, 0, 1, 1,
-0.4858954, 2.302955, -0.4646077, 0, 0, 0, 1, 1,
-0.4770795, -0.8025525, -1.065369, 0, 0, 0, 1, 1,
-0.4758642, -0.3592281, -1.864588, 1, 1, 1, 1, 1,
-0.4754265, -0.2342763, -2.153315, 1, 1, 1, 1, 1,
-0.4724371, -0.009714912, -2.356667, 1, 1, 1, 1, 1,
-0.470952, 0.9886203, -0.08064871, 1, 1, 1, 1, 1,
-0.4689265, 0.7333021, 1.999602, 1, 1, 1, 1, 1,
-0.467949, 1.377026, 1.554156, 1, 1, 1, 1, 1,
-0.46691, 1.632839, -1.0868, 1, 1, 1, 1, 1,
-0.4663995, -0.9725611, -1.951756, 1, 1, 1, 1, 1,
-0.4596241, -0.6482155, -1.648348, 1, 1, 1, 1, 1,
-0.4589161, 0.1053858, 0.3169381, 1, 1, 1, 1, 1,
-0.4516495, 0.2198462, -1.505668, 1, 1, 1, 1, 1,
-0.4513609, 0.149106, -0.2886477, 1, 1, 1, 1, 1,
-0.4434368, -0.2267689, -2.427884, 1, 1, 1, 1, 1,
-0.4429985, -0.2165364, -0.2666579, 1, 1, 1, 1, 1,
-0.4312174, 0.5459551, -0.4761693, 1, 1, 1, 1, 1,
-0.4270269, -0.6494846, -3.503874, 0, 0, 1, 1, 1,
-0.4234494, -1.136946, -2.748024, 1, 0, 0, 1, 1,
-0.422588, -1.489625, -2.435644, 1, 0, 0, 1, 1,
-0.4224949, 0.4975536, -1.2592, 1, 0, 0, 1, 1,
-0.4196265, 0.3501391, -1.050829, 1, 0, 0, 1, 1,
-0.4145617, 0.5230755, 0.672241, 1, 0, 0, 1, 1,
-0.413754, 1.290822, 0.1044826, 0, 0, 0, 1, 1,
-0.4129249, 1.075565, 0.0004130816, 0, 0, 0, 1, 1,
-0.4103077, 0.6974754, 0.4707212, 0, 0, 0, 1, 1,
-0.4073833, -0.1650624, -1.745842, 0, 0, 0, 1, 1,
-0.4041843, 1.550146, 0.353924, 0, 0, 0, 1, 1,
-0.4019934, 2.41642, -1.509528, 0, 0, 0, 1, 1,
-0.4008519, -0.5088984, -2.704289, 0, 0, 0, 1, 1,
-0.400645, 0.0855262, -0.9788419, 1, 1, 1, 1, 1,
-0.3980177, 0.4665584, -0.6558852, 1, 1, 1, 1, 1,
-0.3978894, 0.3066321, -0.3252366, 1, 1, 1, 1, 1,
-0.3964629, -0.2033625, -1.168291, 1, 1, 1, 1, 1,
-0.3924934, 0.2107778, -1.436131, 1, 1, 1, 1, 1,
-0.3921277, -0.2273003, -0.7939375, 1, 1, 1, 1, 1,
-0.3854328, -0.3554088, -1.656471, 1, 1, 1, 1, 1,
-0.3844136, -1.395898, -1.58336, 1, 1, 1, 1, 1,
-0.3827594, -1.163947, -3.732868, 1, 1, 1, 1, 1,
-0.3808148, 0.9277192, -0.6257603, 1, 1, 1, 1, 1,
-0.3800269, 1.522188, 0.1772378, 1, 1, 1, 1, 1,
-0.3780431, -0.6441008, -3.109821, 1, 1, 1, 1, 1,
-0.3758579, 0.8171469, -1.093781, 1, 1, 1, 1, 1,
-0.3742077, -0.01574575, -1.709029, 1, 1, 1, 1, 1,
-0.3741825, 0.3441991, -0.1426432, 1, 1, 1, 1, 1,
-0.373278, -1.602624, -4.053689, 0, 0, 1, 1, 1,
-0.3724045, 0.441174, -1.980899, 1, 0, 0, 1, 1,
-0.3718023, 0.7388414, -2.250937, 1, 0, 0, 1, 1,
-0.3695667, 2.343694, 1.05737, 1, 0, 0, 1, 1,
-0.3504597, -0.4413313, -3.034864, 1, 0, 0, 1, 1,
-0.3488856, -1.194293, -2.268298, 1, 0, 0, 1, 1,
-0.3460198, -1.053707, -4.348573, 0, 0, 0, 1, 1,
-0.3459376, -0.4754666, -1.827566, 0, 0, 0, 1, 1,
-0.343513, 0.7317777, -0.8243837, 0, 0, 0, 1, 1,
-0.3367033, -0.7142669, -3.069183, 0, 0, 0, 1, 1,
-0.3355316, 0.4585109, 0.1206672, 0, 0, 0, 1, 1,
-0.330972, 0.1433018, -2.476346, 0, 0, 0, 1, 1,
-0.3265392, 0.2363695, -2.116693, 0, 0, 0, 1, 1,
-0.3232658, 0.2439103, 1.029122, 1, 1, 1, 1, 1,
-0.3216034, 0.5596086, -0.2195328, 1, 1, 1, 1, 1,
-0.3212573, 1.327176, 0.1407953, 1, 1, 1, 1, 1,
-0.318871, -0.04018218, -3.046681, 1, 1, 1, 1, 1,
-0.3177099, -1.393842, -2.676526, 1, 1, 1, 1, 1,
-0.3158624, -0.8608646, -3.753044, 1, 1, 1, 1, 1,
-0.3155362, -0.09117384, -3.23812, 1, 1, 1, 1, 1,
-0.3130938, 1.459606, 0.5919087, 1, 1, 1, 1, 1,
-0.3130718, -0.8055421, -2.3625, 1, 1, 1, 1, 1,
-0.312674, -1.351309, -1.459556, 1, 1, 1, 1, 1,
-0.3120483, 0.1298856, -0.9778177, 1, 1, 1, 1, 1,
-0.3115648, -0.08885446, -2.091352, 1, 1, 1, 1, 1,
-0.3083661, -0.8814234, -2.281964, 1, 1, 1, 1, 1,
-0.3070165, -0.2371227, -3.653354, 1, 1, 1, 1, 1,
-0.3059269, -0.8960406, -3.474145, 1, 1, 1, 1, 1,
-0.3012117, 0.4528916, 0.1224725, 0, 0, 1, 1, 1,
-0.2987143, 0.4879988, 0.5644459, 1, 0, 0, 1, 1,
-0.2963477, -0.6998113, -2.758628, 1, 0, 0, 1, 1,
-0.2956527, 0.175265, -0.9020143, 1, 0, 0, 1, 1,
-0.2955571, -0.8893259, -2.457464, 1, 0, 0, 1, 1,
-0.2938039, -0.03911039, -0.9084103, 1, 0, 0, 1, 1,
-0.2919824, -2.084237, -2.300614, 0, 0, 0, 1, 1,
-0.2910401, -0.1797446, -1.970082, 0, 0, 0, 1, 1,
-0.2890732, -0.6471479, -2.079919, 0, 0, 0, 1, 1,
-0.2887719, -1.013373, -4.27626, 0, 0, 0, 1, 1,
-0.282803, 0.1290478, -1.051027, 0, 0, 0, 1, 1,
-0.2798316, 1.242749, 1.272715, 0, 0, 0, 1, 1,
-0.2797873, 0.4493345, -0.27055, 0, 0, 0, 1, 1,
-0.2795409, -0.2302416, -2.783994, 1, 1, 1, 1, 1,
-0.2775667, 0.3273287, -0.8511279, 1, 1, 1, 1, 1,
-0.2715013, 1.918889, -0.2852852, 1, 1, 1, 1, 1,
-0.2706052, 1.188023, 0.1787155, 1, 1, 1, 1, 1,
-0.264181, 0.8490716, -0.314411, 1, 1, 1, 1, 1,
-0.2641565, -1.195316, -4.466931, 1, 1, 1, 1, 1,
-0.2585701, -0.7939036, -0.8527762, 1, 1, 1, 1, 1,
-0.2543963, -0.512824, -2.221052, 1, 1, 1, 1, 1,
-0.251233, 0.1766164, -2.417965, 1, 1, 1, 1, 1,
-0.2508927, 1.147843, 1.045443, 1, 1, 1, 1, 1,
-0.246861, 0.382229, -1.505105, 1, 1, 1, 1, 1,
-0.2459054, 0.166188, -1.915514, 1, 1, 1, 1, 1,
-0.2420961, 2.062022, -0.2893945, 1, 1, 1, 1, 1,
-0.2381146, 0.9927954, 0.286552, 1, 1, 1, 1, 1,
-0.2350008, 1.578478, 1.232692, 1, 1, 1, 1, 1,
-0.2344713, 1.54394, -1.150607, 0, 0, 1, 1, 1,
-0.230716, 0.04913988, -1.162452, 1, 0, 0, 1, 1,
-0.2276609, 0.7817959, -0.2605718, 1, 0, 0, 1, 1,
-0.2246022, -1.475237, -4.883284, 1, 0, 0, 1, 1,
-0.22413, 1.265816, -0.9405352, 1, 0, 0, 1, 1,
-0.2234811, 0.2707234, 0.3683512, 1, 0, 0, 1, 1,
-0.2233114, 0.3257892, -0.5083994, 0, 0, 0, 1, 1,
-0.2220385, 2.365519, -0.9569212, 0, 0, 0, 1, 1,
-0.2210977, -1.361346, -1.897043, 0, 0, 0, 1, 1,
-0.2155791, -0.5247375, -3.801568, 0, 0, 0, 1, 1,
-0.2146179, -0.7734986, -2.345555, 0, 0, 0, 1, 1,
-0.2125713, -0.02399917, -2.202656, 0, 0, 0, 1, 1,
-0.2117525, -0.2738863, -3.151151, 0, 0, 0, 1, 1,
-0.208278, -1.517021, -3.377778, 1, 1, 1, 1, 1,
-0.2004023, -0.6428664, -2.423312, 1, 1, 1, 1, 1,
-0.2002614, -1.83076, -3.821097, 1, 1, 1, 1, 1,
-0.1984716, -0.7408589, -2.63643, 1, 1, 1, 1, 1,
-0.1968353, -0.5987253, -2.381739, 1, 1, 1, 1, 1,
-0.1938588, 1.108423, 0.367843, 1, 1, 1, 1, 1,
-0.1931913, -0.7436289, -3.626679, 1, 1, 1, 1, 1,
-0.1900878, -0.8969461, -1.576374, 1, 1, 1, 1, 1,
-0.187862, 1.604349, -0.1359666, 1, 1, 1, 1, 1,
-0.1791316, -0.3220549, -3.085048, 1, 1, 1, 1, 1,
-0.1788357, 1.749109, -0.8819416, 1, 1, 1, 1, 1,
-0.1755989, -1.691197, -2.2442, 1, 1, 1, 1, 1,
-0.1728508, -0.4043323, -2.471632, 1, 1, 1, 1, 1,
-0.1688136, -0.250716, -1.800789, 1, 1, 1, 1, 1,
-0.1640204, -0.153165, -1.342081, 1, 1, 1, 1, 1,
-0.162678, 0.5523825, -1.983225, 0, 0, 1, 1, 1,
-0.1623104, -0.4252677, -3.128096, 1, 0, 0, 1, 1,
-0.1604702, -0.7217843, -2.23941, 1, 0, 0, 1, 1,
-0.156938, 0.04441601, -3.48973, 1, 0, 0, 1, 1,
-0.1551175, 0.4135395, -1.472585, 1, 0, 0, 1, 1,
-0.151416, -1.424927, -1.246606, 1, 0, 0, 1, 1,
-0.1481933, 0.08877656, -0.6427578, 0, 0, 0, 1, 1,
-0.1458067, -0.001144501, -3.859607, 0, 0, 0, 1, 1,
-0.1446128, 0.06275204, -1.229527, 0, 0, 0, 1, 1,
-0.1427428, -0.7248812, -3.502164, 0, 0, 0, 1, 1,
-0.1385966, -0.9700488, -3.149087, 0, 0, 0, 1, 1,
-0.1374823, -0.8373351, -2.27117, 0, 0, 0, 1, 1,
-0.1337871, -0.07058459, -1.834232, 0, 0, 0, 1, 1,
-0.1335399, -0.08269093, -1.93766, 1, 1, 1, 1, 1,
-0.1322552, -0.7211737, -2.0184, 1, 1, 1, 1, 1,
-0.1288162, 1.200551, -1.96278, 1, 1, 1, 1, 1,
-0.1281336, -0.7558798, -4.131564, 1, 1, 1, 1, 1,
-0.1280765, 2.388972, -0.308468, 1, 1, 1, 1, 1,
-0.1272668, 0.8443959, -0.5300703, 1, 1, 1, 1, 1,
-0.1250076, -0.01068398, -1.434001, 1, 1, 1, 1, 1,
-0.1238635, -1.564946, -3.192326, 1, 1, 1, 1, 1,
-0.1218799, 0.2134688, 0.1079981, 1, 1, 1, 1, 1,
-0.1182481, 0.4232226, 0.22395, 1, 1, 1, 1, 1,
-0.1173264, -1.039969, -1.863662, 1, 1, 1, 1, 1,
-0.1169958, 0.3352292, 1.132122, 1, 1, 1, 1, 1,
-0.1168874, 0.4649383, -0.6947826, 1, 1, 1, 1, 1,
-0.1134188, 0.2984097, 0.3922416, 1, 1, 1, 1, 1,
-0.1106762, 0.7325145, 0.4114019, 1, 1, 1, 1, 1,
-0.1073155, -1.33704, -3.39464, 0, 0, 1, 1, 1,
-0.1053308, -0.3268107, -1.067837, 1, 0, 0, 1, 1,
-0.1029842, -1.300588, -2.746907, 1, 0, 0, 1, 1,
-0.1024149, 0.08528294, -1.299227, 1, 0, 0, 1, 1,
-0.09822569, -1.089214, -0.5456359, 1, 0, 0, 1, 1,
-0.09763315, 0.3040935, -0.6456811, 1, 0, 0, 1, 1,
-0.09198442, -0.451489, -5.198816, 0, 0, 0, 1, 1,
-0.09109057, -0.2277735, -1.992716, 0, 0, 0, 1, 1,
-0.09012741, -0.5044121, -3.6617, 0, 0, 0, 1, 1,
-0.08869356, -0.4069976, -3.312289, 0, 0, 0, 1, 1,
-0.08809646, -0.8133297, -3.608878, 0, 0, 0, 1, 1,
-0.08655452, -0.5514861, -1.852764, 0, 0, 0, 1, 1,
-0.08498438, 1.117514, -0.3636681, 0, 0, 0, 1, 1,
-0.08497794, -1.171844, -4.155951, 1, 1, 1, 1, 1,
-0.08492085, 0.1233496, -0.4785996, 1, 1, 1, 1, 1,
-0.08267367, 0.3506894, -0.4995699, 1, 1, 1, 1, 1,
-0.07937407, 1.448929, -0.5701672, 1, 1, 1, 1, 1,
-0.07581876, -0.2031347, -2.970294, 1, 1, 1, 1, 1,
-0.07512998, -1.828228, -2.750381, 1, 1, 1, 1, 1,
-0.07454676, 0.5052809, -0.168369, 1, 1, 1, 1, 1,
-0.07347296, 1.423055, 0.2966309, 1, 1, 1, 1, 1,
-0.07264055, -1.932147, -3.994378, 1, 1, 1, 1, 1,
-0.0611062, -1.927356, -3.633629, 1, 1, 1, 1, 1,
-0.05204647, 1.392559, -1.521292, 1, 1, 1, 1, 1,
-0.04975194, -0.03938911, -3.300422, 1, 1, 1, 1, 1,
-0.04870831, -0.5318111, -3.777854, 1, 1, 1, 1, 1,
-0.04803431, 2.339955, 1.247285, 1, 1, 1, 1, 1,
-0.04782945, 0.02906147, -1.555039, 1, 1, 1, 1, 1,
-0.04660828, -0.1214322, -2.844989, 0, 0, 1, 1, 1,
-0.0464484, 0.8690939, 0.5092221, 1, 0, 0, 1, 1,
-0.04620755, -0.3660505, -1.423803, 1, 0, 0, 1, 1,
-0.04597947, 0.6687528, 1.518972, 1, 0, 0, 1, 1,
-0.04378208, -0.5792009, -2.014903, 1, 0, 0, 1, 1,
-0.04111709, 0.6509099, 0.5551831, 1, 0, 0, 1, 1,
-0.0404707, -0.2011057, -2.411384, 0, 0, 0, 1, 1,
-0.03828362, -0.4752384, -3.16018, 0, 0, 0, 1, 1,
-0.03790827, -2.731797, -2.897503, 0, 0, 0, 1, 1,
-0.03378502, -0.4397819, -1.423514, 0, 0, 0, 1, 1,
-0.03356832, 0.3884249, 1.240948, 0, 0, 0, 1, 1,
-0.02560851, 0.374118, 1.746488, 0, 0, 0, 1, 1,
-0.02443729, 0.01230222, -1.430093, 0, 0, 0, 1, 1,
-0.02367511, -0.2452566, -2.479403, 1, 1, 1, 1, 1,
-0.02346262, 0.3116027, 1.775976, 1, 1, 1, 1, 1,
-0.01794553, -0.4485054, -5.257837, 1, 1, 1, 1, 1,
-0.01486761, 0.2016961, 0.3021562, 1, 1, 1, 1, 1,
-0.01295329, -0.1111329, -2.275344, 1, 1, 1, 1, 1,
-0.008262794, -0.6155232, -3.691439, 1, 1, 1, 1, 1,
-0.003943273, -0.5486528, -2.897152, 1, 1, 1, 1, 1,
-0.002651675, -0.6997606, -2.53866, 1, 1, 1, 1, 1,
-0.000118959, 0.6728114, -0.002745733, 1, 1, 1, 1, 1,
0.0131624, -1.45702, 2.6412, 1, 1, 1, 1, 1,
0.01317354, 0.09668158, 0.5230129, 1, 1, 1, 1, 1,
0.01386523, 1.581634, -0.2838652, 1, 1, 1, 1, 1,
0.01507713, 1.935207, 0.7740607, 1, 1, 1, 1, 1,
0.01702814, 0.3643036, 0.2747879, 1, 1, 1, 1, 1,
0.01903755, -2.337348, 4.204807, 1, 1, 1, 1, 1,
0.02978116, -0.8657169, 2.694762, 0, 0, 1, 1, 1,
0.03289476, -0.7508917, 4.748666, 1, 0, 0, 1, 1,
0.03505864, -0.8392726, 3.441301, 1, 0, 0, 1, 1,
0.03688557, 1.093999, 0.8478588, 1, 0, 0, 1, 1,
0.03791748, -0.327278, 2.71939, 1, 0, 0, 1, 1,
0.04130489, 0.6361952, -0.02035017, 1, 0, 0, 1, 1,
0.04477755, 0.5490273, -0.4516829, 0, 0, 0, 1, 1,
0.05040544, 0.8373508, 0.8208728, 0, 0, 0, 1, 1,
0.05199459, -1.682896, 3.997843, 0, 0, 0, 1, 1,
0.05262757, -0.4991318, 1.195339, 0, 0, 0, 1, 1,
0.05346318, 0.5145512, -0.7149975, 0, 0, 0, 1, 1,
0.05561729, 1.487932, 1.528366, 0, 0, 0, 1, 1,
0.05776982, -1.019399, 2.136152, 0, 0, 0, 1, 1,
0.05990206, 0.6759666, 0.7033116, 1, 1, 1, 1, 1,
0.06128238, -1.013804, 3.038435, 1, 1, 1, 1, 1,
0.06362813, -0.5893599, 2.451107, 1, 1, 1, 1, 1,
0.06488566, 0.3927645, -1.673338, 1, 1, 1, 1, 1,
0.06624233, -0.4417527, 2.674705, 1, 1, 1, 1, 1,
0.06643724, 0.03732888, 1.743939, 1, 1, 1, 1, 1,
0.06785028, -0.6547899, 2.446663, 1, 1, 1, 1, 1,
0.06853373, -0.6691314, 2.9645, 1, 1, 1, 1, 1,
0.07596973, -0.5333385, 3.628929, 1, 1, 1, 1, 1,
0.0761219, 0.1870008, 0.2782036, 1, 1, 1, 1, 1,
0.08212934, 1.74782, -0.1236174, 1, 1, 1, 1, 1,
0.09092607, -1.321652, 3.51874, 1, 1, 1, 1, 1,
0.09349839, -1.240086, 3.513437, 1, 1, 1, 1, 1,
0.09380456, -1.369044, 3.461011, 1, 1, 1, 1, 1,
0.09889954, -0.1114093, 2.334362, 1, 1, 1, 1, 1,
0.1034251, -0.8554453, 3.567855, 0, 0, 1, 1, 1,
0.1045964, 1.167741, -0.6705385, 1, 0, 0, 1, 1,
0.1052619, -0.9176498, 2.605233, 1, 0, 0, 1, 1,
0.1089186, 0.02726543, -0.3150575, 1, 0, 0, 1, 1,
0.1128686, 0.6667146, 2.096098, 1, 0, 0, 1, 1,
0.114108, -0.9692707, 4.171095, 1, 0, 0, 1, 1,
0.1144186, -0.8744695, 3.215216, 0, 0, 0, 1, 1,
0.115026, 0.6346359, 0.8520067, 0, 0, 0, 1, 1,
0.1168174, -0.2192023, 3.149684, 0, 0, 0, 1, 1,
0.1173299, -1.017386, 3.34066, 0, 0, 0, 1, 1,
0.125196, 0.05133408, 1.189266, 0, 0, 0, 1, 1,
0.1264328, 0.6296033, 0.1049965, 0, 0, 0, 1, 1,
0.133276, 1.279287, 0.6293179, 0, 0, 0, 1, 1,
0.1336435, -0.009095233, 1.271725, 1, 1, 1, 1, 1,
0.1470768, -0.7293836, 2.606302, 1, 1, 1, 1, 1,
0.1526422, 0.287796, 1.762935, 1, 1, 1, 1, 1,
0.1589221, 1.783287, 1.066492, 1, 1, 1, 1, 1,
0.1607321, 1.911001, 1.095858, 1, 1, 1, 1, 1,
0.1668109, -0.8923225, 4.219817, 1, 1, 1, 1, 1,
0.170156, 0.1501585, 0.2422258, 1, 1, 1, 1, 1,
0.173853, 0.7954805, 0.9572269, 1, 1, 1, 1, 1,
0.178365, -1.137959, 3.775281, 1, 1, 1, 1, 1,
0.1792261, 0.1401972, 1.74112, 1, 1, 1, 1, 1,
0.1801979, -0.1516055, 2.635899, 1, 1, 1, 1, 1,
0.186437, -0.624561, 3.23355, 1, 1, 1, 1, 1,
0.1926317, -0.565773, 3.862456, 1, 1, 1, 1, 1,
0.195722, -1.183206, 3.085729, 1, 1, 1, 1, 1,
0.200834, -0.1028208, 2.575574, 1, 1, 1, 1, 1,
0.2020026, 1.12598, 0.9294259, 0, 0, 1, 1, 1,
0.2080493, -0.5563082, 1.049698, 1, 0, 0, 1, 1,
0.2083867, 0.6452228, 0.9439929, 1, 0, 0, 1, 1,
0.209909, -1.227671, 3.028704, 1, 0, 0, 1, 1,
0.2103069, -1.093108, 2.237453, 1, 0, 0, 1, 1,
0.2120678, -0.6345221, 3.132769, 1, 0, 0, 1, 1,
0.2123332, -0.9908492, 4.323116, 0, 0, 0, 1, 1,
0.2128063, -0.09263093, 0.4485194, 0, 0, 0, 1, 1,
0.2140386, -0.6385438, 3.876922, 0, 0, 0, 1, 1,
0.2163176, -1.025839, 3.374312, 0, 0, 0, 1, 1,
0.2172629, -1.597853, 3.646101, 0, 0, 0, 1, 1,
0.2194049, 0.64161, -1.3379, 0, 0, 0, 1, 1,
0.221304, 0.006285773, 1.132971, 0, 0, 0, 1, 1,
0.2220367, -0.4684092, 4.366498, 1, 1, 1, 1, 1,
0.2282046, 1.005221, 1.652403, 1, 1, 1, 1, 1,
0.2284259, 0.7411958, 0.8390824, 1, 1, 1, 1, 1,
0.2304824, -2.759228, 3.835906, 1, 1, 1, 1, 1,
0.2339854, -0.07560817, 2.588092, 1, 1, 1, 1, 1,
0.2352688, -0.7673407, 1.871132, 1, 1, 1, 1, 1,
0.242968, 0.2441512, 1.237338, 1, 1, 1, 1, 1,
0.2429809, -1.471105, 2.069206, 1, 1, 1, 1, 1,
0.2463036, 0.7406335, 0.07152162, 1, 1, 1, 1, 1,
0.2502091, -1.213498, 3.092735, 1, 1, 1, 1, 1,
0.2556616, 0.6490704, -0.4489346, 1, 1, 1, 1, 1,
0.2564953, -0.3947453, 3.067064, 1, 1, 1, 1, 1,
0.2568128, -1.884605, 2.7162, 1, 1, 1, 1, 1,
0.2691854, 0.8179306, 1.395972, 1, 1, 1, 1, 1,
0.2748584, 0.3037291, 0.3134483, 1, 1, 1, 1, 1,
0.2789207, -0.1158695, 3.167321, 0, 0, 1, 1, 1,
0.2802245, 0.9252732, -0.1509008, 1, 0, 0, 1, 1,
0.2883916, 0.6664121, 0.4471687, 1, 0, 0, 1, 1,
0.293835, 0.3783656, -0.8195309, 1, 0, 0, 1, 1,
0.2947672, 0.3367871, 1.63739, 1, 0, 0, 1, 1,
0.2977475, -0.2829776, 3.325329, 1, 0, 0, 1, 1,
0.3002225, 0.6037132, 0.6574097, 0, 0, 0, 1, 1,
0.3026127, -0.005515077, 1.686024, 0, 0, 0, 1, 1,
0.3058715, -0.3770911, 2.141254, 0, 0, 0, 1, 1,
0.3065274, 1.121443, -1.255868, 0, 0, 0, 1, 1,
0.3103373, 1.68625, -1.456194, 0, 0, 0, 1, 1,
0.3113098, -0.2359436, 2.292956, 0, 0, 0, 1, 1,
0.3149034, -0.1891267, 2.31165, 0, 0, 0, 1, 1,
0.3150656, 0.6798498, -0.2422499, 1, 1, 1, 1, 1,
0.317961, 1.948936, 0.8610785, 1, 1, 1, 1, 1,
0.3190793, -0.05154924, 3.606198, 1, 1, 1, 1, 1,
0.3251093, 1.052579, 0.4543201, 1, 1, 1, 1, 1,
0.32603, -0.8236539, 3.374977, 1, 1, 1, 1, 1,
0.3289152, -0.959258, 3.074411, 1, 1, 1, 1, 1,
0.3427958, 0.2727986, 1.264156, 1, 1, 1, 1, 1,
0.3438343, -0.6874093, 3.136939, 1, 1, 1, 1, 1,
0.3441432, 0.4814429, 1.118577, 1, 1, 1, 1, 1,
0.3483555, -0.2204874, 1.538029, 1, 1, 1, 1, 1,
0.3488428, -0.2183446, 1.242039, 1, 1, 1, 1, 1,
0.3524263, -0.1380733, 0.745363, 1, 1, 1, 1, 1,
0.3529278, 1.520766, -0.7061202, 1, 1, 1, 1, 1,
0.3581462, 1.439782, -0.1640316, 1, 1, 1, 1, 1,
0.361416, -0.0509134, 2.082061, 1, 1, 1, 1, 1,
0.363038, -0.8456848, 2.18657, 0, 0, 1, 1, 1,
0.3649563, 0.6974815, -0.02267925, 1, 0, 0, 1, 1,
0.3658675, -0.2258855, 3.545201, 1, 0, 0, 1, 1,
0.3701174, 1.355134, -0.2149547, 1, 0, 0, 1, 1,
0.3735433, -0.1676818, 2.248774, 1, 0, 0, 1, 1,
0.3738306, 1.765975, 1.176146, 1, 0, 0, 1, 1,
0.3769503, -1.970699, 3.617612, 0, 0, 0, 1, 1,
0.3796665, -0.2509689, 0.4944387, 0, 0, 0, 1, 1,
0.3812749, 1.264006, 0.07689457, 0, 0, 0, 1, 1,
0.3837875, 1.47543, 2.065353, 0, 0, 0, 1, 1,
0.3846757, 1.905901, 0.1641886, 0, 0, 0, 1, 1,
0.3894742, 2.353274, 1.468788, 0, 0, 0, 1, 1,
0.3918335, 0.5428948, 0.0008035239, 0, 0, 0, 1, 1,
0.3956216, -0.06356976, 1.894509, 1, 1, 1, 1, 1,
0.404217, -0.8312004, 3.274763, 1, 1, 1, 1, 1,
0.4047578, 1.476318, 0.9137688, 1, 1, 1, 1, 1,
0.406196, 0.1217172, 2.350506, 1, 1, 1, 1, 1,
0.4078204, -0.3273879, 2.706227, 1, 1, 1, 1, 1,
0.4123423, -0.6609558, 1.734711, 1, 1, 1, 1, 1,
0.4188431, 0.6986461, -0.4673952, 1, 1, 1, 1, 1,
0.4193652, 1.242055, 0.5401766, 1, 1, 1, 1, 1,
0.4291638, -1.733471, 1.810687, 1, 1, 1, 1, 1,
0.4309202, 0.8175665, -0.8695373, 1, 1, 1, 1, 1,
0.4331905, -0.2694115, 1.701916, 1, 1, 1, 1, 1,
0.4397591, 2.060613, -0.249104, 1, 1, 1, 1, 1,
0.4397679, 0.3777958, -0.1426511, 1, 1, 1, 1, 1,
0.4415607, 1.720638, 0.2041731, 1, 1, 1, 1, 1,
0.4425651, -0.5388405, 2.024639, 1, 1, 1, 1, 1,
0.442608, -1.205503, 0.9012576, 0, 0, 1, 1, 1,
0.4435655, -2.361618, 2.408339, 1, 0, 0, 1, 1,
0.4436632, 0.5288325, 1.922061, 1, 0, 0, 1, 1,
0.4459045, -1.810534, 1.965432, 1, 0, 0, 1, 1,
0.4462928, -0.2211109, 0.9717414, 1, 0, 0, 1, 1,
0.4498803, 0.2291331, 0.2320559, 1, 0, 0, 1, 1,
0.4502854, 0.2477845, 1.120359, 0, 0, 0, 1, 1,
0.4530989, -0.2738832, 3.655007, 0, 0, 0, 1, 1,
0.455835, -0.4039715, 1.961288, 0, 0, 0, 1, 1,
0.4570986, 0.725877, 0.1466608, 0, 0, 0, 1, 1,
0.4571505, 1.413099, -0.3493455, 0, 0, 0, 1, 1,
0.4615165, 0.2138594, 1.884785, 0, 0, 0, 1, 1,
0.4632456, -0.09178126, 1.369551, 0, 0, 0, 1, 1,
0.4657915, 0.7286144, 0.9757036, 1, 1, 1, 1, 1,
0.4686829, -0.08969168, 1.490581, 1, 1, 1, 1, 1,
0.469929, 2.031717, 0.7115725, 1, 1, 1, 1, 1,
0.478272, 0.6891655, -0.1710821, 1, 1, 1, 1, 1,
0.4842132, 0.4704804, 2.140145, 1, 1, 1, 1, 1,
0.4882432, -0.4643272, 2.778864, 1, 1, 1, 1, 1,
0.4920827, 0.1692026, 0.05131766, 1, 1, 1, 1, 1,
0.4977639, -0.2268369, 4.746701, 1, 1, 1, 1, 1,
0.5060793, 0.5259759, 1.14628, 1, 1, 1, 1, 1,
0.5097005, -0.7319997, 3.273034, 1, 1, 1, 1, 1,
0.5113217, 0.08480309, 3.491509, 1, 1, 1, 1, 1,
0.5113459, -0.5991877, 3.440519, 1, 1, 1, 1, 1,
0.5139801, 1.525034, 0.6550751, 1, 1, 1, 1, 1,
0.5185798, -1.015959, 0.8542933, 1, 1, 1, 1, 1,
0.5199819, 0.7391515, -0.9377064, 1, 1, 1, 1, 1,
0.520331, 0.9549133, 0.3159541, 0, 0, 1, 1, 1,
0.5219374, 0.03711341, 1.912408, 1, 0, 0, 1, 1,
0.5241923, -0.0662908, 2.698148, 1, 0, 0, 1, 1,
0.5337832, 0.9060541, 0.5347933, 1, 0, 0, 1, 1,
0.5345353, -1.327776, 4.591621, 1, 0, 0, 1, 1,
0.5347828, -2.325595, 1.601453, 1, 0, 0, 1, 1,
0.5382075, 0.4524805, 0.0849468, 0, 0, 0, 1, 1,
0.5444718, -0.274462, 0.4372852, 0, 0, 0, 1, 1,
0.5450488, 0.6138483, 1.629754, 0, 0, 0, 1, 1,
0.5522671, -0.2739526, 2.683286, 0, 0, 0, 1, 1,
0.5600311, 0.1666872, 2.568016, 0, 0, 0, 1, 1,
0.5620762, -1.204104, 4.419687, 0, 0, 0, 1, 1,
0.5629054, 0.09353437, 1.822846, 0, 0, 0, 1, 1,
0.5636548, -0.3406351, 2.505091, 1, 1, 1, 1, 1,
0.5655716, 0.6404562, 0.005902305, 1, 1, 1, 1, 1,
0.567887, 0.5732338, 2.371058, 1, 1, 1, 1, 1,
0.5728642, 0.1179007, 1.473875, 1, 1, 1, 1, 1,
0.5753379, 0.3634043, -0.5571193, 1, 1, 1, 1, 1,
0.5769888, 0.544692, 2.570321, 1, 1, 1, 1, 1,
0.581363, 0.2977544, 2.188768, 1, 1, 1, 1, 1,
0.5817351, -0.0406651, 1.085732, 1, 1, 1, 1, 1,
0.5863047, 0.2190577, 2.591666, 1, 1, 1, 1, 1,
0.5897422, -0.2900467, 2.385791, 1, 1, 1, 1, 1,
0.5929117, -0.5995856, 1.054179, 1, 1, 1, 1, 1,
0.6033008, -1.319871, 3.061222, 1, 1, 1, 1, 1,
0.6134547, -0.8239653, 2.281099, 1, 1, 1, 1, 1,
0.6190771, 0.02824072, 0.8265296, 1, 1, 1, 1, 1,
0.6236467, 2.2695, 0.2274014, 1, 1, 1, 1, 1,
0.6261288, 0.1116921, 2.90873, 0, 0, 1, 1, 1,
0.6290308, -1.60488, 3.710787, 1, 0, 0, 1, 1,
0.6292303, 0.4144687, 1.386976, 1, 0, 0, 1, 1,
0.6321488, 1.21984, 0.2269057, 1, 0, 0, 1, 1,
0.634458, 0.9091625, 2.025352, 1, 0, 0, 1, 1,
0.6360388, 0.8676975, 0.04341112, 1, 0, 0, 1, 1,
0.6369421, -1.550871, 2.55692, 0, 0, 0, 1, 1,
0.6371027, 0.5126078, 0.9963924, 0, 0, 0, 1, 1,
0.638322, 2.552396, 2.230329, 0, 0, 0, 1, 1,
0.642673, -0.4588511, 1.259502, 0, 0, 0, 1, 1,
0.6534907, -1.115966, 2.518745, 0, 0, 0, 1, 1,
0.6549223, 0.8855129, 0.2058535, 0, 0, 0, 1, 1,
0.6597001, -2.662676, 2.163749, 0, 0, 0, 1, 1,
0.6604819, -3.151369, 2.844715, 1, 1, 1, 1, 1,
0.6611006, 0.3171292, -0.5788427, 1, 1, 1, 1, 1,
0.6624835, -1.73171, 3.603337, 1, 1, 1, 1, 1,
0.6654723, 0.07803703, 1.330218, 1, 1, 1, 1, 1,
0.6725766, -1.231596, 0.4955773, 1, 1, 1, 1, 1,
0.6733022, -0.5009102, 1.825534, 1, 1, 1, 1, 1,
0.6793036, 0.4706421, 0.2226114, 1, 1, 1, 1, 1,
0.6855816, 0.7687422, -0.3267609, 1, 1, 1, 1, 1,
0.6858301, -0.8298568, 2.655606, 1, 1, 1, 1, 1,
0.689506, 0.008577148, 1.718047, 1, 1, 1, 1, 1,
0.6911078, -0.3660339, 2.463664, 1, 1, 1, 1, 1,
0.6914667, 0.4046757, 2.108621, 1, 1, 1, 1, 1,
0.6923609, -0.4243868, 2.939795, 1, 1, 1, 1, 1,
0.6923609, 0.2547679, -0.04612517, 1, 1, 1, 1, 1,
0.6930346, 0.2483748, 0.2224247, 1, 1, 1, 1, 1,
0.6938827, -2.025502, 3.514844, 0, 0, 1, 1, 1,
0.6992017, -2.26111, 1.249197, 1, 0, 0, 1, 1,
0.7010434, -0.5571199, 1.772661, 1, 0, 0, 1, 1,
0.7059815, 0.5980371, 1.584782, 1, 0, 0, 1, 1,
0.7073286, 1.842144, -0.4613289, 1, 0, 0, 1, 1,
0.7138532, -0.3910017, 3.752992, 1, 0, 0, 1, 1,
0.715856, -0.3069851, 2.267061, 0, 0, 0, 1, 1,
0.7178075, 0.1460101, 0.8209928, 0, 0, 0, 1, 1,
0.7248428, -1.17153, 2.31877, 0, 0, 0, 1, 1,
0.7255759, 1.199296, 0.7778551, 0, 0, 0, 1, 1,
0.7295769, -0.5350552, 1.98871, 0, 0, 0, 1, 1,
0.7344931, 1.274739, 1.749336, 0, 0, 0, 1, 1,
0.7400604, 1.143893, -0.850982, 0, 0, 0, 1, 1,
0.7406925, -1.089662, 2.0346, 1, 1, 1, 1, 1,
0.7439819, 0.1498155, 1.246917, 1, 1, 1, 1, 1,
0.7444346, -0.4591889, 1.849814, 1, 1, 1, 1, 1,
0.7469777, 0.6694818, -0.1317423, 1, 1, 1, 1, 1,
0.7578477, 2.36954, 0.803316, 1, 1, 1, 1, 1,
0.7586779, -1.272234, 2.476896, 1, 1, 1, 1, 1,
0.7634325, 0.4415631, 0.6980343, 1, 1, 1, 1, 1,
0.7650052, -0.2684952, 2.409059, 1, 1, 1, 1, 1,
0.7669542, 0.3129623, -0.1748571, 1, 1, 1, 1, 1,
0.7713502, 1.615937, -0.03258616, 1, 1, 1, 1, 1,
0.7729405, -0.2871952, 1.704728, 1, 1, 1, 1, 1,
0.777453, 0.535441, 0.2270298, 1, 1, 1, 1, 1,
0.7778002, -1.403945, 2.614437, 1, 1, 1, 1, 1,
0.7785488, 0.07693169, 0.9669164, 1, 1, 1, 1, 1,
0.7908661, -1.536526, 3.257228, 1, 1, 1, 1, 1,
0.7918268, -1.478986, 3.02447, 0, 0, 1, 1, 1,
0.7923271, 0.6881753, 0.03153187, 1, 0, 0, 1, 1,
0.8004085, 0.06348436, 0.6451172, 1, 0, 0, 1, 1,
0.8011774, 1.664799, -0.9222973, 1, 0, 0, 1, 1,
0.8093402, -1.260626, 2.623736, 1, 0, 0, 1, 1,
0.8123526, 1.254198, -0.03088131, 1, 0, 0, 1, 1,
0.8168451, 0.6539231, 0.7800914, 0, 0, 0, 1, 1,
0.8189437, 0.9607824, 1.555068, 0, 0, 0, 1, 1,
0.8190795, -1.085677, 2.050657, 0, 0, 0, 1, 1,
0.8232794, -0.7780567, 2.283345, 0, 0, 0, 1, 1,
0.8254462, 0.3850018, -0.9860917, 0, 0, 0, 1, 1,
0.8340414, -0.5258844, 0.9314872, 0, 0, 0, 1, 1,
0.8352813, 1.347878, 1.700901, 0, 0, 0, 1, 1,
0.8354583, -0.1023032, 1.206375, 1, 1, 1, 1, 1,
0.8376414, 0.7157808, -0.933226, 1, 1, 1, 1, 1,
0.838442, -1.421384, 2.060658, 1, 1, 1, 1, 1,
0.8384917, 2.820921, 1.101828, 1, 1, 1, 1, 1,
0.8413722, -0.7445213, 3.19729, 1, 1, 1, 1, 1,
0.8414211, 0.261456, 1.201065, 1, 1, 1, 1, 1,
0.8466785, -0.1022227, 1.636444, 1, 1, 1, 1, 1,
0.8488145, -0.9308436, 2.987043, 1, 1, 1, 1, 1,
0.8505976, 1.44612, 0.3183774, 1, 1, 1, 1, 1,
0.8524106, -0.5644225, 1.80295, 1, 1, 1, 1, 1,
0.8531154, -1.23835, 3.70048, 1, 1, 1, 1, 1,
0.8542976, 1.015024, -0.01489069, 1, 1, 1, 1, 1,
0.8565768, 0.3266263, 0.5922448, 1, 1, 1, 1, 1,
0.8568364, -1.861454, 3.845328, 1, 1, 1, 1, 1,
0.8575213, -1.045977, 2.292416, 1, 1, 1, 1, 1,
0.8588495, -0.756901, 1.199435, 0, 0, 1, 1, 1,
0.8602863, 0.4002733, 0.5606874, 1, 0, 0, 1, 1,
0.8645929, -1.592224, 2.598488, 1, 0, 0, 1, 1,
0.8757998, -0.3888407, 1.422098, 1, 0, 0, 1, 1,
0.8758036, 0.2753111, 1.831612, 1, 0, 0, 1, 1,
0.8779012, -0.3421091, 0.6476027, 1, 0, 0, 1, 1,
0.8842776, 0.7556893, 1.789421, 0, 0, 0, 1, 1,
0.8913786, -1.159981, 2.803923, 0, 0, 0, 1, 1,
0.8937705, 0.6068864, 0.9144216, 0, 0, 0, 1, 1,
0.8939505, -2.442767, 1.861838, 0, 0, 0, 1, 1,
0.897301, -0.4943926, 3.331144, 0, 0, 0, 1, 1,
0.9067873, 1.225677, 1.250394, 0, 0, 0, 1, 1,
0.9068949, -1.71938, 1.724129, 0, 0, 0, 1, 1,
0.9078059, 0.6380733, 2.483097, 1, 1, 1, 1, 1,
0.9081109, 0.004259001, 2.217514, 1, 1, 1, 1, 1,
0.9101446, -0.5842524, -0.354691, 1, 1, 1, 1, 1,
0.9102235, -1.649245, 1.180078, 1, 1, 1, 1, 1,
0.9103763, 0.3122425, 0.7330478, 1, 1, 1, 1, 1,
0.9150118, 0.6709433, 1.413428, 1, 1, 1, 1, 1,
0.9153547, 0.04989066, 2.181706, 1, 1, 1, 1, 1,
0.9166126, 1.715998, -0.3472555, 1, 1, 1, 1, 1,
0.9170004, -1.962348, 2.022283, 1, 1, 1, 1, 1,
0.9270136, 0.453534, -0.6263489, 1, 1, 1, 1, 1,
0.9284562, 0.2428134, 1.034388, 1, 1, 1, 1, 1,
0.9329544, -0.03270862, 0.1819064, 1, 1, 1, 1, 1,
0.9456595, 0.4808383, 0.08108341, 1, 1, 1, 1, 1,
0.9569986, 0.2954215, 2.392616, 1, 1, 1, 1, 1,
0.9570994, -0.232987, 1.573085, 1, 1, 1, 1, 1,
0.9584504, 0.3909536, 1.817551, 0, 0, 1, 1, 1,
0.963598, -0.7897493, 1.056165, 1, 0, 0, 1, 1,
0.9644227, -0.4379595, 2.010165, 1, 0, 0, 1, 1,
0.9672586, 0.3181288, 1.759295, 1, 0, 0, 1, 1,
0.9676251, -0.767425, 4.218418, 1, 0, 0, 1, 1,
0.9724035, -0.8387837, 3.127681, 1, 0, 0, 1, 1,
0.9729647, 0.1659149, 0.8727339, 0, 0, 0, 1, 1,
0.9761435, -0.08392813, 1.301207, 0, 0, 0, 1, 1,
0.9776523, -0.4233791, 1.837022, 0, 0, 0, 1, 1,
0.9781351, -0.4649083, 2.947057, 0, 0, 0, 1, 1,
0.9799227, 0.8130451, 1.55202, 0, 0, 0, 1, 1,
0.9822354, -0.1641492, 1.746711, 0, 0, 0, 1, 1,
0.984145, -0.5195801, 2.057159, 0, 0, 0, 1, 1,
1.013579, 0.5346154, 0.2683534, 1, 1, 1, 1, 1,
1.01684, 0.06951793, 2.370441, 1, 1, 1, 1, 1,
1.017169, -0.2289395, 1.220978, 1, 1, 1, 1, 1,
1.018735, 1.392196, 1.040021, 1, 1, 1, 1, 1,
1.01963, 0.7474334, 0.886582, 1, 1, 1, 1, 1,
1.023492, -1.319784, 4.080482, 1, 1, 1, 1, 1,
1.024207, -0.5606425, 1.61651, 1, 1, 1, 1, 1,
1.028981, -0.3084469, 0.7871147, 1, 1, 1, 1, 1,
1.04001, -1.077533, 2.414798, 1, 1, 1, 1, 1,
1.040419, -0.5486014, 2.207296, 1, 1, 1, 1, 1,
1.052479, 0.6835818, 1.982384, 1, 1, 1, 1, 1,
1.054592, 0.2489426, 1.211059, 1, 1, 1, 1, 1,
1.06266, 0.8466659, 1.405567, 1, 1, 1, 1, 1,
1.06296, 0.5831609, 1.128783, 1, 1, 1, 1, 1,
1.065993, 0.2517302, 2.16987, 1, 1, 1, 1, 1,
1.067606, 2.251391, 1.82628, 0, 0, 1, 1, 1,
1.070225, -0.03374149, 2.187123, 1, 0, 0, 1, 1,
1.082912, 1.557649, 0.3222592, 1, 0, 0, 1, 1,
1.085713, -0.7307495, 2.471887, 1, 0, 0, 1, 1,
1.086495, -0.5225233, 0.4408758, 1, 0, 0, 1, 1,
1.087079, 0.2816078, 0.6289989, 1, 0, 0, 1, 1,
1.09316, 0.2171331, 2.066605, 0, 0, 0, 1, 1,
1.095855, -0.1003499, 2.021315, 0, 0, 0, 1, 1,
1.09726, -1.051062, 1.056231, 0, 0, 0, 1, 1,
1.100467, -1.203344, 1.764237, 0, 0, 0, 1, 1,
1.102673, 1.033488, -0.06630851, 0, 0, 0, 1, 1,
1.103475, -0.5927578, -1.318191, 0, 0, 0, 1, 1,
1.105115, 0.5280728, 2.471542, 0, 0, 0, 1, 1,
1.109136, 0.8594573, 0.1599754, 1, 1, 1, 1, 1,
1.111198, -0.6175034, 0.4461571, 1, 1, 1, 1, 1,
1.115036, -0.9636651, 2.452356, 1, 1, 1, 1, 1,
1.115685, 1.494588, 2.315877, 1, 1, 1, 1, 1,
1.121799, -0.3592694, 1.784544, 1, 1, 1, 1, 1,
1.139424, 1.7343, -0.09111004, 1, 1, 1, 1, 1,
1.139426, -2.562781, 2.392049, 1, 1, 1, 1, 1,
1.140177, 0.1408745, 1.464461, 1, 1, 1, 1, 1,
1.14847, 0.4138078, 1.485106, 1, 1, 1, 1, 1,
1.149167, 1.194566, 1.226756, 1, 1, 1, 1, 1,
1.150299, -0.9094962, 2.377301, 1, 1, 1, 1, 1,
1.151207, -0.3811209, 0.9596301, 1, 1, 1, 1, 1,
1.153335, 0.9192499, 3.729856, 1, 1, 1, 1, 1,
1.157869, 1.041669, 0.6963292, 1, 1, 1, 1, 1,
1.158193, 1.221662, -0.2599688, 1, 1, 1, 1, 1,
1.17727, 0.687602, 1.612824, 0, 0, 1, 1, 1,
1.180331, 0.9206339, 0.2579858, 1, 0, 0, 1, 1,
1.180571, 1.437724, 1.038853, 1, 0, 0, 1, 1,
1.185727, -1.41544, 3.804053, 1, 0, 0, 1, 1,
1.186521, -0.3530064, 2.411934, 1, 0, 0, 1, 1,
1.200691, 0.6846798, 0.1847529, 1, 0, 0, 1, 1,
1.22282, 0.9923478, -1.33513, 0, 0, 0, 1, 1,
1.224302, 0.9967689, 2.582462, 0, 0, 0, 1, 1,
1.234991, -0.2194994, 1.70335, 0, 0, 0, 1, 1,
1.235491, -0.05052225, 2.781829, 0, 0, 0, 1, 1,
1.237094, -1.109327, 1.81272, 0, 0, 0, 1, 1,
1.237273, -0.1749161, 4.107468, 0, 0, 0, 1, 1,
1.237649, -0.2792845, 2.360262, 0, 0, 0, 1, 1,
1.248257, 0.4555192, 0.445175, 1, 1, 1, 1, 1,
1.250495, 0.6391107, -0.4554808, 1, 1, 1, 1, 1,
1.250557, 0.7911733, 1.786411, 1, 1, 1, 1, 1,
1.251749, -0.204493, 1.318705, 1, 1, 1, 1, 1,
1.253792, 0.09420539, 1.57702, 1, 1, 1, 1, 1,
1.260954, 1.531449, -0.02604892, 1, 1, 1, 1, 1,
1.261366, -1.215019, 2.413112, 1, 1, 1, 1, 1,
1.270176, 1.011029, 0.2061125, 1, 1, 1, 1, 1,
1.270778, 0.6378267, 1.759429, 1, 1, 1, 1, 1,
1.276779, -0.2613451, 1.722126, 1, 1, 1, 1, 1,
1.296349, -1.290326, 2.378235, 1, 1, 1, 1, 1,
1.301573, -1.200918, 3.063503, 1, 1, 1, 1, 1,
1.302698, -0.2358287, 0.1910189, 1, 1, 1, 1, 1,
1.303978, 0.7861133, 1.961163, 1, 1, 1, 1, 1,
1.312632, 0.7815156, 0.8449399, 1, 1, 1, 1, 1,
1.312916, -1.750563, 5.352403, 0, 0, 1, 1, 1,
1.326622, -1.703578, 2.328416, 1, 0, 0, 1, 1,
1.337331, 0.8445769, 0.6705443, 1, 0, 0, 1, 1,
1.356319, -0.0273076, 1.848777, 1, 0, 0, 1, 1,
1.371093, 0.3384, 2.593546, 1, 0, 0, 1, 1,
1.373871, -1.603914, 2.356169, 1, 0, 0, 1, 1,
1.380818, -1.306922, 2.93893, 0, 0, 0, 1, 1,
1.389122, 0.2367387, 2.747234, 0, 0, 0, 1, 1,
1.389602, -0.2547394, 0.9422005, 0, 0, 0, 1, 1,
1.390582, -0.8073108, 2.700449, 0, 0, 0, 1, 1,
1.394183, -0.7608569, 2.187583, 0, 0, 0, 1, 1,
1.39444, 0.2045618, 2.783142, 0, 0, 0, 1, 1,
1.400904, 0.6406361, 1.261231, 0, 0, 0, 1, 1,
1.414756, 0.1848126, 0.0102915, 1, 1, 1, 1, 1,
1.425207, 2.880118, 0.03976351, 1, 1, 1, 1, 1,
1.42931, -0.4816926, 2.228722, 1, 1, 1, 1, 1,
1.433753, -1.058888, 1.997754, 1, 1, 1, 1, 1,
1.442549, -0.6191657, 3.293217, 1, 1, 1, 1, 1,
1.451301, 0.7962079, 1.842672, 1, 1, 1, 1, 1,
1.464638, 0.6936824, 0.7286673, 1, 1, 1, 1, 1,
1.491559, 0.5998472, 1.030316, 1, 1, 1, 1, 1,
1.510421, -0.1639304, 1.805569, 1, 1, 1, 1, 1,
1.515479, 0.02035263, 2.338628, 1, 1, 1, 1, 1,
1.523641, 0.3002943, 2.171115, 1, 1, 1, 1, 1,
1.536361, -0.8066113, 1.191923, 1, 1, 1, 1, 1,
1.540915, -0.467382, 2.171466, 1, 1, 1, 1, 1,
1.552237, -0.8095619, -0.06937055, 1, 1, 1, 1, 1,
1.566716, 1.203821, -1.170653, 1, 1, 1, 1, 1,
1.567809, -0.1254392, 2.746676, 0, 0, 1, 1, 1,
1.568636, -0.1835877, 3.598784, 1, 0, 0, 1, 1,
1.570399, 0.7372141, 1.645857, 1, 0, 0, 1, 1,
1.595963, 0.8680215, -0.6454691, 1, 0, 0, 1, 1,
1.597274, -0.4873868, 2.428644, 1, 0, 0, 1, 1,
1.601527, 1.326515, -0.2622041, 1, 0, 0, 1, 1,
1.604419, -0.9917006, 0.7609037, 0, 0, 0, 1, 1,
1.624829, 0.310282, 1.753295, 0, 0, 0, 1, 1,
1.629167, 0.7358221, 0.6925021, 0, 0, 0, 1, 1,
1.62952, -1.304667, 2.776221, 0, 0, 0, 1, 1,
1.633317, 0.2994119, 1.732594, 0, 0, 0, 1, 1,
1.687985, -0.315707, 2.475141, 0, 0, 0, 1, 1,
1.69135, -0.8672268, 1.661507, 0, 0, 0, 1, 1,
1.694217, 0.4274341, 2.138974, 1, 1, 1, 1, 1,
1.694463, 1.283626, 0.9432529, 1, 1, 1, 1, 1,
1.702577, -1.997976, 1.641984, 1, 1, 1, 1, 1,
1.749351, -0.1073387, 0.4985312, 1, 1, 1, 1, 1,
1.755115, 1.215768, 2.81179, 1, 1, 1, 1, 1,
1.757083, -1.383562, 2.201245, 1, 1, 1, 1, 1,
1.764056, -0.4550289, 1.383188, 1, 1, 1, 1, 1,
1.764873, 1.632607, -1.315934, 1, 1, 1, 1, 1,
1.772553, 0.4088884, 0.7190334, 1, 1, 1, 1, 1,
1.773029, -0.7490615, 2.97209, 1, 1, 1, 1, 1,
1.780781, 0.3147914, 1.166024, 1, 1, 1, 1, 1,
1.784768, -2.787552, 1.954956, 1, 1, 1, 1, 1,
1.7946, 0.631087, -0.0683127, 1, 1, 1, 1, 1,
1.799461, -1.275127, 1.314156, 1, 1, 1, 1, 1,
1.815184, -2.104136, 0.572104, 1, 1, 1, 1, 1,
1.81613, -0.9823285, 3.709731, 0, 0, 1, 1, 1,
1.827507, 0.3894735, 2.95007, 1, 0, 0, 1, 1,
1.833092, 1.694422, 0.22624, 1, 0, 0, 1, 1,
1.836206, 1.351102, -0.4628366, 1, 0, 0, 1, 1,
1.839164, -1.682268, 3.097655, 1, 0, 0, 1, 1,
1.843222, 1.268245, 2.451981, 1, 0, 0, 1, 1,
1.849355, 0.1170027, 0.7045946, 0, 0, 0, 1, 1,
1.852242, 0.4455245, 2.513728, 0, 0, 0, 1, 1,
1.858122, 0.3001994, 2.715406, 0, 0, 0, 1, 1,
1.858783, -0.3642343, 4.345676, 0, 0, 0, 1, 1,
1.888673, 0.299388, 1.880962, 0, 0, 0, 1, 1,
1.894624, 1.417933, 1.388127, 0, 0, 0, 1, 1,
1.897597, 1.585562, 1.584965, 0, 0, 0, 1, 1,
1.901127, -0.3022097, 0.1601981, 1, 1, 1, 1, 1,
1.902013, -0.2832828, 3.032632, 1, 1, 1, 1, 1,
1.916333, 1.245654, 0.5676647, 1, 1, 1, 1, 1,
1.962444, -1.714709, 2.318909, 1, 1, 1, 1, 1,
1.981218, 1.914525, 1.546739, 1, 1, 1, 1, 1,
2.040903, -0.6322657, 2.180582, 1, 1, 1, 1, 1,
2.042054, -0.6245263, 1.929539, 1, 1, 1, 1, 1,
2.049593, -0.9000893, 2.912405, 1, 1, 1, 1, 1,
2.051482, 1.04702, 1.023112, 1, 1, 1, 1, 1,
2.055674, -0.4461099, 0.5796251, 1, 1, 1, 1, 1,
2.138992, -0.2132935, 1.120291, 1, 1, 1, 1, 1,
2.145927, 0.3641736, 3.391913, 1, 1, 1, 1, 1,
2.164851, 1.872393, 0.1864846, 1, 1, 1, 1, 1,
2.167816, 0.8284166, 2.937764, 1, 1, 1, 1, 1,
2.16788, -2.922749, 1.996247, 1, 1, 1, 1, 1,
2.178417, 0.1083175, 2.215346, 0, 0, 1, 1, 1,
2.222471, -0.4783657, 1.308313, 1, 0, 0, 1, 1,
2.235985, 0.8515038, 2.351051, 1, 0, 0, 1, 1,
2.26208, 0.289791, 2.547086, 1, 0, 0, 1, 1,
2.268286, -0.6965827, 1.857181, 1, 0, 0, 1, 1,
2.276677, 1.596979, -0.1460822, 1, 0, 0, 1, 1,
2.321779, 0.5736669, 1.934309, 0, 0, 0, 1, 1,
2.325443, 0.2609328, -0.07360402, 0, 0, 0, 1, 1,
2.375986, 1.319049, 1.455642, 0, 0, 0, 1, 1,
2.384758, -0.5500844, 1.170637, 0, 0, 0, 1, 1,
2.401879, -0.1788886, 2.677608, 0, 0, 0, 1, 1,
2.40294, -0.04366594, 1.488345, 0, 0, 0, 1, 1,
2.406477, 0.06356083, 2.150839, 0, 0, 0, 1, 1,
2.445457, 0.7757784, 1.53508, 1, 1, 1, 1, 1,
2.496408, 0.177586, 0.9449146, 1, 1, 1, 1, 1,
2.564082, -1.041469, 1.44702, 1, 1, 1, 1, 1,
2.637186, -1.397116, 1.536212, 1, 1, 1, 1, 1,
2.735554, 1.098925, 1.842222, 1, 1, 1, 1, 1,
3.077225, -1.509563, 2.770339, 1, 1, 1, 1, 1,
3.581552, 1.576298, 1.162362, 1, 1, 1, 1, 1
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
var radius = 9.611076;
var distance = 33.7585;
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
mvMatrix.translate( -0.124845, 0.06182694, -0.0472827 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.7585);
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
