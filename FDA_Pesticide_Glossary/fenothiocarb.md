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
-3.769171, 1.073055, -1.949294, 1, 0, 0, 1,
-3.398133, 1.456138, -0.3114025, 1, 0.007843138, 0, 1,
-3.273776, 0.1814846, -0.8573726, 1, 0.01176471, 0, 1,
-3.251618, -0.930875, -1.89297, 1, 0.01960784, 0, 1,
-3.165989, -0.01240444, -0.8903773, 1, 0.02352941, 0, 1,
-2.870791, 0.874252, -1.071485, 1, 0.03137255, 0, 1,
-2.832966, -0.3599212, 0.6253954, 1, 0.03529412, 0, 1,
-2.804251, 1.287224, -0.9927638, 1, 0.04313726, 0, 1,
-2.723954, 1.55104, -1.795699, 1, 0.04705882, 0, 1,
-2.662759, 0.3337978, -2.34546, 1, 0.05490196, 0, 1,
-2.654474, 0.180523, -1.802204, 1, 0.05882353, 0, 1,
-2.591199, 0.5477501, -1.633821, 1, 0.06666667, 0, 1,
-2.552324, 0.2063673, -1.286052, 1, 0.07058824, 0, 1,
-2.416619, -0.009596306, 0.9799249, 1, 0.07843138, 0, 1,
-2.301067, -0.6679108, 0.1224401, 1, 0.08235294, 0, 1,
-2.242107, 0.5732546, -0.369306, 1, 0.09019608, 0, 1,
-2.239147, 0.1276468, -0.9287745, 1, 0.09411765, 0, 1,
-2.211882, 0.3325065, -1.090718, 1, 0.1019608, 0, 1,
-2.196742, -0.738214, 0.175465, 1, 0.1098039, 0, 1,
-2.115533, -1.364692, -1.282442, 1, 0.1137255, 0, 1,
-2.109816, 1.123122, -0.6807861, 1, 0.1215686, 0, 1,
-2.079179, -2.144432, -2.205683, 1, 0.1254902, 0, 1,
-2.076066, -0.1916424, -0.7473314, 1, 0.1333333, 0, 1,
-2.031468, 0.09250983, -2.31361, 1, 0.1372549, 0, 1,
-2.017729, 0.2152163, -0.4029802, 1, 0.145098, 0, 1,
-1.98057, -0.4605322, -2.167729, 1, 0.1490196, 0, 1,
-1.949364, 0.3867417, -0.8776686, 1, 0.1568628, 0, 1,
-1.908388, -0.1198605, -1.978559, 1, 0.1607843, 0, 1,
-1.903709, 0.9867291, -1.687872, 1, 0.1686275, 0, 1,
-1.894648, 0.5153826, -1.841006, 1, 0.172549, 0, 1,
-1.887904, 1.088367, 0.3462086, 1, 0.1803922, 0, 1,
-1.881884, -2.77595, -3.872311, 1, 0.1843137, 0, 1,
-1.87443, 0.7095519, 0.2294559, 1, 0.1921569, 0, 1,
-1.873075, 1.12316, -0.1917641, 1, 0.1960784, 0, 1,
-1.862052, 0.4546353, -0.4541868, 1, 0.2039216, 0, 1,
-1.831824, -0.4661716, -0.8022533, 1, 0.2117647, 0, 1,
-1.825234, 1.296066, -0.6331611, 1, 0.2156863, 0, 1,
-1.81396, 1.088127, 1.106641, 1, 0.2235294, 0, 1,
-1.812393, 1.248196, 0.106896, 1, 0.227451, 0, 1,
-1.783651, 0.05775335, -1.16554, 1, 0.2352941, 0, 1,
-1.783209, 0.3821987, -0.2959193, 1, 0.2392157, 0, 1,
-1.767821, 0.643459, -1.837829, 1, 0.2470588, 0, 1,
-1.758385, -1.227002, -0.7234623, 1, 0.2509804, 0, 1,
-1.752371, 0.156885, -3.034986, 1, 0.2588235, 0, 1,
-1.751371, -0.5126594, -2.543644, 1, 0.2627451, 0, 1,
-1.748961, 1.290724, -0.3172028, 1, 0.2705882, 0, 1,
-1.746646, 1.380719, -2.269497, 1, 0.2745098, 0, 1,
-1.733123, -0.6775925, -1.891622, 1, 0.282353, 0, 1,
-1.717131, 0.101025, -0.7496627, 1, 0.2862745, 0, 1,
-1.707927, -1.060297, -2.962758, 1, 0.2941177, 0, 1,
-1.682957, -0.72849, -2.963015, 1, 0.3019608, 0, 1,
-1.680446, 1.203551, -1.996076, 1, 0.3058824, 0, 1,
-1.675797, -0.6681069, -0.7392516, 1, 0.3137255, 0, 1,
-1.623972, 0.07231966, -3.106716, 1, 0.3176471, 0, 1,
-1.618959, 0.09132214, -0.7147495, 1, 0.3254902, 0, 1,
-1.618049, -0.6557013, -1.107841, 1, 0.3294118, 0, 1,
-1.597365, 0.3876214, -0.2911127, 1, 0.3372549, 0, 1,
-1.577366, -0.4888145, -2.326408, 1, 0.3411765, 0, 1,
-1.566666, 1.015081, -0.8823745, 1, 0.3490196, 0, 1,
-1.5575, 1.222996, -0.3459764, 1, 0.3529412, 0, 1,
-1.529009, 0.2657505, -0.5752225, 1, 0.3607843, 0, 1,
-1.507257, 0.06625487, -1.968039, 1, 0.3647059, 0, 1,
-1.505274, -0.5679072, -0.8780727, 1, 0.372549, 0, 1,
-1.498493, 0.9736244, -1.935252, 1, 0.3764706, 0, 1,
-1.496601, 0.894676, -0.4798104, 1, 0.3843137, 0, 1,
-1.481457, -1.851414, -2.124877, 1, 0.3882353, 0, 1,
-1.476247, -0.1295936, -1.481258, 1, 0.3960784, 0, 1,
-1.44574, -1.571495, -1.830704, 1, 0.4039216, 0, 1,
-1.445332, -2.213462, -3.995705, 1, 0.4078431, 0, 1,
-1.436697, 1.019204, -2.313521, 1, 0.4156863, 0, 1,
-1.429818, 1.248962, 0.5930933, 1, 0.4196078, 0, 1,
-1.423612, 0.7741447, -0.7943159, 1, 0.427451, 0, 1,
-1.423529, -0.2569738, -2.430468, 1, 0.4313726, 0, 1,
-1.408247, -0.2225708, -0.4485546, 1, 0.4392157, 0, 1,
-1.406222, -1.76751, -4.691878, 1, 0.4431373, 0, 1,
-1.395701, 0.1718958, -2.708257, 1, 0.4509804, 0, 1,
-1.39169, 1.431811, -1.360536, 1, 0.454902, 0, 1,
-1.385982, -0.2320148, -1.076728, 1, 0.4627451, 0, 1,
-1.38277, -0.4945295, -3.093795, 1, 0.4666667, 0, 1,
-1.375933, -0.1546703, 0.1645024, 1, 0.4745098, 0, 1,
-1.374135, 0.05074646, -1.399015, 1, 0.4784314, 0, 1,
-1.373292, 0.188709, -0.6015456, 1, 0.4862745, 0, 1,
-1.372954, -0.9288684, -4.101424, 1, 0.4901961, 0, 1,
-1.372324, -3.161665, -2.356507, 1, 0.4980392, 0, 1,
-1.362353, -0.8442404, -1.262678, 1, 0.5058824, 0, 1,
-1.357327, -0.6623319, -1.898031, 1, 0.509804, 0, 1,
-1.356976, 0.418985, -0.8540739, 1, 0.5176471, 0, 1,
-1.353905, -0.1654409, -4.072383, 1, 0.5215687, 0, 1,
-1.347738, -0.02166629, -0.7993833, 1, 0.5294118, 0, 1,
-1.343217, -0.9013866, -3.118495, 1, 0.5333334, 0, 1,
-1.339116, -1.833279, -3.348973, 1, 0.5411765, 0, 1,
-1.337127, -2.561885, -1.497004, 1, 0.5450981, 0, 1,
-1.321538, 0.03189466, -1.438865, 1, 0.5529412, 0, 1,
-1.298967, 0.6055588, -0.9891627, 1, 0.5568628, 0, 1,
-1.297674, -0.1744666, -1.791076, 1, 0.5647059, 0, 1,
-1.297567, -0.3885733, -2.196298, 1, 0.5686275, 0, 1,
-1.297231, -1.702704, -1.301373, 1, 0.5764706, 0, 1,
-1.291873, 1.044771, -0.3783519, 1, 0.5803922, 0, 1,
-1.290151, 1.493172, 0.2333258, 1, 0.5882353, 0, 1,
-1.282746, 0.351875, -0.7508428, 1, 0.5921569, 0, 1,
-1.280018, 0.6284155, -1.539237, 1, 0.6, 0, 1,
-1.27505, -0.6864271, -2.004355, 1, 0.6078432, 0, 1,
-1.274998, 0.7974421, 0.7970477, 1, 0.6117647, 0, 1,
-1.264404, -1.666, -1.851657, 1, 0.6196079, 0, 1,
-1.262061, 1.34653, 0.1531159, 1, 0.6235294, 0, 1,
-1.259768, 1.453734, -0.2137066, 1, 0.6313726, 0, 1,
-1.258418, 1.741376, -0.2966104, 1, 0.6352941, 0, 1,
-1.252395, -1.026475, -2.294849, 1, 0.6431373, 0, 1,
-1.250839, 0.7698485, -1.365827, 1, 0.6470588, 0, 1,
-1.242434, -0.4983451, -3.053707, 1, 0.654902, 0, 1,
-1.239727, 1.713643, -2.109052, 1, 0.6588235, 0, 1,
-1.235952, -0.6568609, -1.847822, 1, 0.6666667, 0, 1,
-1.233067, 0.9646339, -0.5315528, 1, 0.6705883, 0, 1,
-1.228668, 0.7350652, -0.5151871, 1, 0.6784314, 0, 1,
-1.221248, 0.4811528, -0.01888357, 1, 0.682353, 0, 1,
-1.218436, 2.470411, 0.6918995, 1, 0.6901961, 0, 1,
-1.205254, 1.374554, -0.14695, 1, 0.6941177, 0, 1,
-1.203847, 0.4892862, 0.4293138, 1, 0.7019608, 0, 1,
-1.201527, -0.4696386, -1.982802, 1, 0.7098039, 0, 1,
-1.199292, 0.96447, 1.53968, 1, 0.7137255, 0, 1,
-1.194073, -0.7638987, -1.805576, 1, 0.7215686, 0, 1,
-1.192165, -0.947, -3.815806, 1, 0.7254902, 0, 1,
-1.189605, -0.6491993, -2.366453, 1, 0.7333333, 0, 1,
-1.182279, 0.6727858, 0.05971484, 1, 0.7372549, 0, 1,
-1.181967, 0.0982668, -0.1243788, 1, 0.7450981, 0, 1,
-1.181238, -0.8693087, -2.159292, 1, 0.7490196, 0, 1,
-1.17912, 0.1814579, -1.103793, 1, 0.7568628, 0, 1,
-1.177389, 2.195377, -0.1122322, 1, 0.7607843, 0, 1,
-1.167524, -1.849638, -4.060308, 1, 0.7686275, 0, 1,
-1.162107, 0.4150622, 0.2280363, 1, 0.772549, 0, 1,
-1.161733, 0.2441161, -2.980438, 1, 0.7803922, 0, 1,
-1.154101, 1.267517, -2.377418, 1, 0.7843137, 0, 1,
-1.148326, 0.8752891, -0.1655776, 1, 0.7921569, 0, 1,
-1.142117, 2.00681, -1.030515, 1, 0.7960784, 0, 1,
-1.142089, 0.1499308, -0.6389831, 1, 0.8039216, 0, 1,
-1.142079, 0.370611, -1.181995, 1, 0.8117647, 0, 1,
-1.139536, 0.09761319, -2.923486, 1, 0.8156863, 0, 1,
-1.120311, -0.7663944, -1.255698, 1, 0.8235294, 0, 1,
-1.119833, 1.998444, 1.073638, 1, 0.827451, 0, 1,
-1.111286, -1.323228, -2.267342, 1, 0.8352941, 0, 1,
-1.106159, -0.0233752, -0.7028962, 1, 0.8392157, 0, 1,
-1.105971, -0.6401584, -3.284904, 1, 0.8470588, 0, 1,
-1.103768, 0.09717161, -2.226107, 1, 0.8509804, 0, 1,
-1.097023, -1.223519, -2.554592, 1, 0.8588235, 0, 1,
-1.092744, -0.06970122, -0.7064859, 1, 0.8627451, 0, 1,
-1.089733, -1.529917, -2.623603, 1, 0.8705882, 0, 1,
-1.086054, -2.359921, -2.065366, 1, 0.8745098, 0, 1,
-1.077014, 0.3905555, -1.449996, 1, 0.8823529, 0, 1,
-1.074651, -0.9296175, -0.3025337, 1, 0.8862745, 0, 1,
-1.064603, 1.28173, -0.7552216, 1, 0.8941177, 0, 1,
-1.064397, -1.264415, -4.403261, 1, 0.8980392, 0, 1,
-1.059668, -1.747128, -1.4495, 1, 0.9058824, 0, 1,
-1.050534, -0.9422129, -2.245816, 1, 0.9137255, 0, 1,
-1.045622, -0.6387159, -1.910241, 1, 0.9176471, 0, 1,
-1.037411, 0.6010404, 1.281738, 1, 0.9254902, 0, 1,
-1.029756, -0.06562161, -1.28775, 1, 0.9294118, 0, 1,
-1.026361, 0.6848319, -0.3255277, 1, 0.9372549, 0, 1,
-1.02459, 0.669803, -0.2539862, 1, 0.9411765, 0, 1,
-1.016565, 0.8360484, 0.6261203, 1, 0.9490196, 0, 1,
-1.00604, 0.405433, -0.6388029, 1, 0.9529412, 0, 1,
-0.9997292, 1.927306, -2.063556, 1, 0.9607843, 0, 1,
-0.9931201, 0.3280726, -1.76949, 1, 0.9647059, 0, 1,
-0.9922065, -1.4088, -3.352511, 1, 0.972549, 0, 1,
-0.9854775, 1.487166, -0.1648587, 1, 0.9764706, 0, 1,
-0.984388, -2.549241, -3.376442, 1, 0.9843137, 0, 1,
-0.9692946, 0.7583257, 0.5830345, 1, 0.9882353, 0, 1,
-0.9647441, 0.07644616, -2.176507, 1, 0.9960784, 0, 1,
-0.9640076, -0.4107294, -2.931055, 0.9960784, 1, 0, 1,
-0.9584761, 0.6332506, 1.126732, 0.9921569, 1, 0, 1,
-0.9511083, 1.241496, -1.4063, 0.9843137, 1, 0, 1,
-0.9505973, 0.4098869, -2.19115, 0.9803922, 1, 0, 1,
-0.9480051, -1.097066, -3.105907, 0.972549, 1, 0, 1,
-0.9469428, 0.2098552, -2.740588, 0.9686275, 1, 0, 1,
-0.9464024, 0.2704233, -0.9997334, 0.9607843, 1, 0, 1,
-0.9422882, 0.2325291, -1.580024, 0.9568627, 1, 0, 1,
-0.9355056, 0.4018372, -1.006041, 0.9490196, 1, 0, 1,
-0.9300236, -0.2151102, -1.484648, 0.945098, 1, 0, 1,
-0.9287419, -0.8656501, -3.862819, 0.9372549, 1, 0, 1,
-0.9191776, 0.8617871, -0.9241186, 0.9333333, 1, 0, 1,
-0.912255, 0.2737104, -1.686791, 0.9254902, 1, 0, 1,
-0.9052592, 1.222615, -0.3000031, 0.9215686, 1, 0, 1,
-0.9048844, 1.363103, 0.03479289, 0.9137255, 1, 0, 1,
-0.9044469, 0.06002345, -0.6554118, 0.9098039, 1, 0, 1,
-0.9028465, -1.856089, -2.511003, 0.9019608, 1, 0, 1,
-0.9026925, -0.7849464, -2.700263, 0.8941177, 1, 0, 1,
-0.9005277, -0.604227, -1.960005, 0.8901961, 1, 0, 1,
-0.8928508, 0.4264981, -1.49679, 0.8823529, 1, 0, 1,
-0.8925221, 0.4448653, -0.3333126, 0.8784314, 1, 0, 1,
-0.8860567, 1.050416, 0.1619172, 0.8705882, 1, 0, 1,
-0.885194, -0.7237462, -3.182021, 0.8666667, 1, 0, 1,
-0.8532171, 0.3936317, -1.142694, 0.8588235, 1, 0, 1,
-0.8485309, -0.7747096, -3.578572, 0.854902, 1, 0, 1,
-0.8465263, -0.6982907, -1.312542, 0.8470588, 1, 0, 1,
-0.8464279, 0.3242867, -1.764176, 0.8431373, 1, 0, 1,
-0.8446246, -0.2981594, -1.21695, 0.8352941, 1, 0, 1,
-0.8331208, 0.5960222, -0.588681, 0.8313726, 1, 0, 1,
-0.8291477, 0.4467869, -1.107302, 0.8235294, 1, 0, 1,
-0.8259329, -0.0552185, -2.211739, 0.8196079, 1, 0, 1,
-0.8228917, -0.2795674, -1.552838, 0.8117647, 1, 0, 1,
-0.8217635, -0.737932, -0.6889861, 0.8078431, 1, 0, 1,
-0.8117287, 0.6941164, 0.8248637, 0.8, 1, 0, 1,
-0.8024312, 0.08469812, 0.376694, 0.7921569, 1, 0, 1,
-0.8017886, -0.2704591, -1.583521, 0.7882353, 1, 0, 1,
-0.7976418, -1.187668, -2.164627, 0.7803922, 1, 0, 1,
-0.7962902, 1.905103, -0.4728547, 0.7764706, 1, 0, 1,
-0.7910993, -1.09066, -0.9213896, 0.7686275, 1, 0, 1,
-0.7902786, 0.003501476, -1.575284, 0.7647059, 1, 0, 1,
-0.7858583, -1.515454, -2.734515, 0.7568628, 1, 0, 1,
-0.7818241, -0.002695936, -2.528485, 0.7529412, 1, 0, 1,
-0.7809085, 0.01714982, -0.7645129, 0.7450981, 1, 0, 1,
-0.7706091, -1.545925, -2.612554, 0.7411765, 1, 0, 1,
-0.768451, 0.2881975, -2.380136, 0.7333333, 1, 0, 1,
-0.7669576, -0.6526471, -3.773168, 0.7294118, 1, 0, 1,
-0.7627393, -0.3125661, -1.137368, 0.7215686, 1, 0, 1,
-0.755532, -0.2934842, -3.436846, 0.7176471, 1, 0, 1,
-0.7555125, -0.3449229, -1.458179, 0.7098039, 1, 0, 1,
-0.7525024, -2.227507, -3.453339, 0.7058824, 1, 0, 1,
-0.7500917, -0.01839927, -1.772036, 0.6980392, 1, 0, 1,
-0.7471542, 1.905068, 0.3803684, 0.6901961, 1, 0, 1,
-0.7449449, 0.2776965, -0.7430589, 0.6862745, 1, 0, 1,
-0.744492, 0.3179206, -2.141562, 0.6784314, 1, 0, 1,
-0.7400631, -1.275718, -3.855417, 0.6745098, 1, 0, 1,
-0.7370628, -0.2094993, -4.733782, 0.6666667, 1, 0, 1,
-0.7370201, 0.3712557, -2.325671, 0.6627451, 1, 0, 1,
-0.7325661, 0.02934681, -2.088654, 0.654902, 1, 0, 1,
-0.7277311, 2.391827, 1.802814, 0.6509804, 1, 0, 1,
-0.7274067, 0.1847334, -1.550733, 0.6431373, 1, 0, 1,
-0.7248645, 0.3822701, -1.902721, 0.6392157, 1, 0, 1,
-0.7232582, -0.2686789, -3.043034, 0.6313726, 1, 0, 1,
-0.7201, -2.115575, -2.790293, 0.627451, 1, 0, 1,
-0.7197246, -1.663285, -2.377836, 0.6196079, 1, 0, 1,
-0.7120575, -0.4761256, -2.839937, 0.6156863, 1, 0, 1,
-0.7104825, -0.3465605, -1.756711, 0.6078432, 1, 0, 1,
-0.7080114, 0.8880798, -1.701617, 0.6039216, 1, 0, 1,
-0.7076152, 0.3691874, -0.7182293, 0.5960785, 1, 0, 1,
-0.7072703, -0.526373, -2.012022, 0.5882353, 1, 0, 1,
-0.6995972, 2.102221, 0.8402041, 0.5843138, 1, 0, 1,
-0.6943963, 1.151028, -1.232599, 0.5764706, 1, 0, 1,
-0.6921766, 1.511264, -1.527312, 0.572549, 1, 0, 1,
-0.6884272, 1.088789, 0.2856935, 0.5647059, 1, 0, 1,
-0.6820042, -0.507324, -2.982224, 0.5607843, 1, 0, 1,
-0.6790329, 0.08063262, -0.2076399, 0.5529412, 1, 0, 1,
-0.6778415, 0.4612509, -1.472509, 0.5490196, 1, 0, 1,
-0.6757813, -1.588113, -1.959122, 0.5411765, 1, 0, 1,
-0.6699533, -0.03104508, -2.931425, 0.5372549, 1, 0, 1,
-0.6694854, 1.181351, 1.044337, 0.5294118, 1, 0, 1,
-0.6644172, -0.9811954, -4.275667, 0.5254902, 1, 0, 1,
-0.6620256, -0.9631253, -1.066873, 0.5176471, 1, 0, 1,
-0.6576562, 0.4123694, -1.057055, 0.5137255, 1, 0, 1,
-0.6520183, -0.5388368, -4.031799, 0.5058824, 1, 0, 1,
-0.6482448, 1.563264, -0.6892024, 0.5019608, 1, 0, 1,
-0.6443942, -0.3722389, -3.202184, 0.4941176, 1, 0, 1,
-0.6438456, -1.189377, -2.904118, 0.4862745, 1, 0, 1,
-0.6390624, 1.549907, -0.5656902, 0.4823529, 1, 0, 1,
-0.6379904, 0.6560906, -0.7927467, 0.4745098, 1, 0, 1,
-0.637198, -0.2867474, -1.327398, 0.4705882, 1, 0, 1,
-0.6358095, -0.1871531, -3.240766, 0.4627451, 1, 0, 1,
-0.6358075, 0.7066843, -0.09273499, 0.4588235, 1, 0, 1,
-0.6334087, 1.219388, 0.3842965, 0.4509804, 1, 0, 1,
-0.6285079, -1.412254, -0.254405, 0.4470588, 1, 0, 1,
-0.6232122, -0.7652821, -2.570584, 0.4392157, 1, 0, 1,
-0.6197876, -0.1871343, -2.326669, 0.4352941, 1, 0, 1,
-0.6196091, -1.76994, -3.231972, 0.427451, 1, 0, 1,
-0.6156427, -1.544073, -2.576296, 0.4235294, 1, 0, 1,
-0.613202, -0.6427035, -3.333687, 0.4156863, 1, 0, 1,
-0.6069025, 0.9062198, 0.04376361, 0.4117647, 1, 0, 1,
-0.6028465, 1.268524, 0.4162515, 0.4039216, 1, 0, 1,
-0.6018568, 0.4461944, -0.6804569, 0.3960784, 1, 0, 1,
-0.5990563, 1.476862, -0.4153574, 0.3921569, 1, 0, 1,
-0.5918483, 0.2275075, -2.434409, 0.3843137, 1, 0, 1,
-0.5685149, 2.035018, 0.07739666, 0.3803922, 1, 0, 1,
-0.5654499, 1.872118, -1.837587, 0.372549, 1, 0, 1,
-0.5651501, 0.09490549, -1.745109, 0.3686275, 1, 0, 1,
-0.5645023, -1.250154, -3.260836, 0.3607843, 1, 0, 1,
-0.5640182, -0.3634496, -2.577201, 0.3568628, 1, 0, 1,
-0.5587553, -0.2502355, -2.887682, 0.3490196, 1, 0, 1,
-0.5584333, -0.91299, -1.675769, 0.345098, 1, 0, 1,
-0.5562909, 1.25903, 1.683313, 0.3372549, 1, 0, 1,
-0.5544112, -1.182409, -1.938681, 0.3333333, 1, 0, 1,
-0.5542215, 0.5577301, -3.885048, 0.3254902, 1, 0, 1,
-0.5540881, 1.545496, -1.146527, 0.3215686, 1, 0, 1,
-0.5531058, -0.394751, -1.756799, 0.3137255, 1, 0, 1,
-0.5522522, 0.4287513, 1.413003, 0.3098039, 1, 0, 1,
-0.5497877, 0.2899334, -2.891842, 0.3019608, 1, 0, 1,
-0.5394999, 0.5191117, -1.248869, 0.2941177, 1, 0, 1,
-0.5389409, 0.7890388, -0.2314002, 0.2901961, 1, 0, 1,
-0.5380432, -0.454613, -3.253283, 0.282353, 1, 0, 1,
-0.5336838, 0.1077748, -1.057167, 0.2784314, 1, 0, 1,
-0.5304774, 0.4246047, -0.7466356, 0.2705882, 1, 0, 1,
-0.5250565, -0.3286488, -2.206177, 0.2666667, 1, 0, 1,
-0.5239175, 0.1114973, 0.0161022, 0.2588235, 1, 0, 1,
-0.5195847, 0.5717663, -1.829574, 0.254902, 1, 0, 1,
-0.5181774, -0.2127316, -3.126263, 0.2470588, 1, 0, 1,
-0.5150816, 0.6683145, -0.1897744, 0.2431373, 1, 0, 1,
-0.5116127, 0.6448298, -2.731584, 0.2352941, 1, 0, 1,
-0.5096114, 0.9640647, -0.3813545, 0.2313726, 1, 0, 1,
-0.5076134, -2.433657, -1.873703, 0.2235294, 1, 0, 1,
-0.506637, 0.2496459, -1.60933, 0.2196078, 1, 0, 1,
-0.5058082, 0.240518, -0.865917, 0.2117647, 1, 0, 1,
-0.5050809, -0.908175, -1.796142, 0.2078431, 1, 0, 1,
-0.5015768, -0.7078207, -2.582884, 0.2, 1, 0, 1,
-0.5005984, 1.080102, -0.5301347, 0.1921569, 1, 0, 1,
-0.4992113, 0.7863201, -0.5936965, 0.1882353, 1, 0, 1,
-0.4937756, -0.9617188, -3.254477, 0.1803922, 1, 0, 1,
-0.4917212, -0.3307955, -2.766925, 0.1764706, 1, 0, 1,
-0.4836016, 1.063443, -1.39887, 0.1686275, 1, 0, 1,
-0.4823237, 0.1288409, -2.272518, 0.1647059, 1, 0, 1,
-0.4804467, 2.269866, -0.8064158, 0.1568628, 1, 0, 1,
-0.4802742, -0.4915679, -2.040588, 0.1529412, 1, 0, 1,
-0.4791118, 0.3723693, 0.719089, 0.145098, 1, 0, 1,
-0.4772766, 0.8328223, 0.1322949, 0.1411765, 1, 0, 1,
-0.4725954, -1.794002, -2.67903, 0.1333333, 1, 0, 1,
-0.4670544, 1.041162, 0.01834716, 0.1294118, 1, 0, 1,
-0.4666942, -0.01555953, -1.241846, 0.1215686, 1, 0, 1,
-0.4642276, 0.9583409, -1.971184, 0.1176471, 1, 0, 1,
-0.4619793, 0.4734169, 1.444004, 0.1098039, 1, 0, 1,
-0.4595822, -0.6310002, -2.282491, 0.1058824, 1, 0, 1,
-0.4555735, -0.7580312, -1.859567, 0.09803922, 1, 0, 1,
-0.4537538, -1.034423, -2.276989, 0.09019608, 1, 0, 1,
-0.453072, -0.1800561, -1.694827, 0.08627451, 1, 0, 1,
-0.4526652, -0.4900009, -2.794346, 0.07843138, 1, 0, 1,
-0.4514453, -1.471046, -3.338681, 0.07450981, 1, 0, 1,
-0.4509219, 2.11982, -0.1009563, 0.06666667, 1, 0, 1,
-0.4508029, 0.04568077, -3.356827, 0.0627451, 1, 0, 1,
-0.4444802, -0.1913701, -0.4205584, 0.05490196, 1, 0, 1,
-0.444051, -0.09018338, -1.268657, 0.05098039, 1, 0, 1,
-0.4367838, 1.034635, -0.5099676, 0.04313726, 1, 0, 1,
-0.4367313, -1.363755, -1.950059, 0.03921569, 1, 0, 1,
-0.4362432, -0.8492827, -2.925657, 0.03137255, 1, 0, 1,
-0.4341212, 0.2026614, 1.632803, 0.02745098, 1, 0, 1,
-0.43254, -0.1404286, -1.267309, 0.01960784, 1, 0, 1,
-0.4311844, -1.700442, -1.895267, 0.01568628, 1, 0, 1,
-0.4227517, 1.160694, -0.5825601, 0.007843138, 1, 0, 1,
-0.4226172, 0.8950366, 0.764232, 0.003921569, 1, 0, 1,
-0.4222715, 0.04073251, 0.5178458, 0, 1, 0.003921569, 1,
-0.4192065, -0.08839885, -0.7344249, 0, 1, 0.01176471, 1,
-0.4166082, 1.288583, -2.075743, 0, 1, 0.01568628, 1,
-0.4161947, -2.4592, -3.7975, 0, 1, 0.02352941, 1,
-0.4154467, 1.617579, -0.02674289, 0, 1, 0.02745098, 1,
-0.4104445, 2.990437, 0.8815619, 0, 1, 0.03529412, 1,
-0.4032186, -2.814416, -5.519802, 0, 1, 0.03921569, 1,
-0.402888, 1.28151, -0.2927887, 0, 1, 0.04705882, 1,
-0.4000324, -0.4124841, -1.445156, 0, 1, 0.05098039, 1,
-0.3953384, 0.1439385, -2.365898, 0, 1, 0.05882353, 1,
-0.3901468, 1.362275, 0.2693624, 0, 1, 0.0627451, 1,
-0.3860665, 0.9025227, 1.467268, 0, 1, 0.07058824, 1,
-0.3858025, -0.9896303, -2.358955, 0, 1, 0.07450981, 1,
-0.3802409, 1.760352, -1.757658, 0, 1, 0.08235294, 1,
-0.380075, -0.6480864, -1.620599, 0, 1, 0.08627451, 1,
-0.3781413, -0.7124279, -1.055787, 0, 1, 0.09411765, 1,
-0.3775231, 0.3560711, -1.52268, 0, 1, 0.1019608, 1,
-0.3746649, -1.270238, -0.7111986, 0, 1, 0.1058824, 1,
-0.3739559, -1.844836, -2.815544, 0, 1, 0.1137255, 1,
-0.36663, -2.151452, -2.1697, 0, 1, 0.1176471, 1,
-0.364178, 0.5088092, -0.530092, 0, 1, 0.1254902, 1,
-0.3609357, 0.1192047, -1.36936, 0, 1, 0.1294118, 1,
-0.360611, 1.011671, -0.03467623, 0, 1, 0.1372549, 1,
-0.3543225, 0.5971259, -2.229861, 0, 1, 0.1411765, 1,
-0.3463746, -1.608331, -1.853455, 0, 1, 0.1490196, 1,
-0.3442687, -2.086302, -3.244655, 0, 1, 0.1529412, 1,
-0.3379764, -0.2203097, -2.608876, 0, 1, 0.1607843, 1,
-0.3359161, -1.88837, -2.360327, 0, 1, 0.1647059, 1,
-0.3344717, -1.542166, -2.573895, 0, 1, 0.172549, 1,
-0.3315495, 1.249366, -0.3275403, 0, 1, 0.1764706, 1,
-0.3289276, 0.08185558, -2.402746, 0, 1, 0.1843137, 1,
-0.3257326, 0.3555907, -1.916277, 0, 1, 0.1882353, 1,
-0.3244624, -0.3618249, 0.05489582, 0, 1, 0.1960784, 1,
-0.3242772, 0.1073641, -1.237883, 0, 1, 0.2039216, 1,
-0.3224643, -0.7914481, -2.654773, 0, 1, 0.2078431, 1,
-0.3209483, -0.6386189, -2.137217, 0, 1, 0.2156863, 1,
-0.3137813, -2.192163, -2.475455, 0, 1, 0.2196078, 1,
-0.3102307, 0.009524457, -1.706203, 0, 1, 0.227451, 1,
-0.3090952, -1.30376, -4.068178, 0, 1, 0.2313726, 1,
-0.3067667, -1.222714, -1.98745, 0, 1, 0.2392157, 1,
-0.3029843, 0.3819835, -2.073839, 0, 1, 0.2431373, 1,
-0.3020004, -1.290308, -2.145232, 0, 1, 0.2509804, 1,
-0.2947347, -0.2015492, -0.9577582, 0, 1, 0.254902, 1,
-0.2897633, 0.7265441, 0.4641238, 0, 1, 0.2627451, 1,
-0.2868452, -0.268564, -0.8803422, 0, 1, 0.2666667, 1,
-0.2861216, 0.1132148, -2.299704, 0, 1, 0.2745098, 1,
-0.2845685, 0.01977757, -1.892529, 0, 1, 0.2784314, 1,
-0.2844332, 1.210417, 0.7566586, 0, 1, 0.2862745, 1,
-0.2840971, 0.4655228, -0.3007878, 0, 1, 0.2901961, 1,
-0.2686636, 1.282595, -1.140359, 0, 1, 0.2980392, 1,
-0.267036, 1.197198, -0.6450533, 0, 1, 0.3058824, 1,
-0.265909, -0.4082287, -2.787799, 0, 1, 0.3098039, 1,
-0.263616, -0.5550698, -2.568237, 0, 1, 0.3176471, 1,
-0.263335, -1.11034, -3.65173, 0, 1, 0.3215686, 1,
-0.2609679, -1.144557, -1.173563, 0, 1, 0.3294118, 1,
-0.2577027, 0.4795647, -1.38456, 0, 1, 0.3333333, 1,
-0.2566676, 0.8253978, -2.582913, 0, 1, 0.3411765, 1,
-0.2537741, -1.011572, -2.081415, 0, 1, 0.345098, 1,
-0.2521573, 0.5806937, 1.191986, 0, 1, 0.3529412, 1,
-0.247744, 2.759366, -1.080757, 0, 1, 0.3568628, 1,
-0.246283, 0.5800007, -0.5448478, 0, 1, 0.3647059, 1,
-0.234662, -1.036858, -2.609738, 0, 1, 0.3686275, 1,
-0.2335118, -0.6401962, -2.640347, 0, 1, 0.3764706, 1,
-0.229954, 1.300317, 0.6116754, 0, 1, 0.3803922, 1,
-0.2281475, -3.006309, -2.680272, 0, 1, 0.3882353, 1,
-0.2277992, 0.2352763, -1.791058, 0, 1, 0.3921569, 1,
-0.2255962, 1.011907, -0.1152533, 0, 1, 0.4, 1,
-0.2226796, 0.4459651, -1.159601, 0, 1, 0.4078431, 1,
-0.2137935, 0.3799745, -0.5916084, 0, 1, 0.4117647, 1,
-0.2110151, -1.009761, -2.644124, 0, 1, 0.4196078, 1,
-0.2105763, 0.3817957, -1.414733, 0, 1, 0.4235294, 1,
-0.210531, 0.58821, -1.364378, 0, 1, 0.4313726, 1,
-0.210182, 0.3040602, -1.664365, 0, 1, 0.4352941, 1,
-0.2091119, 1.563019, -0.04472222, 0, 1, 0.4431373, 1,
-0.2077636, 0.7776714, 0.3161581, 0, 1, 0.4470588, 1,
-0.2076301, -0.9659048, -3.260037, 0, 1, 0.454902, 1,
-0.2022074, 0.4454308, -0.088108, 0, 1, 0.4588235, 1,
-0.2000544, 1.956236, 1.423928, 0, 1, 0.4666667, 1,
-0.1948557, 0.3672386, -0.8431301, 0, 1, 0.4705882, 1,
-0.1936745, 0.2476756, -0.7903214, 0, 1, 0.4784314, 1,
-0.1925214, -3.474699, -3.037297, 0, 1, 0.4823529, 1,
-0.1916777, 0.1490284, -2.195211, 0, 1, 0.4901961, 1,
-0.1890962, 0.4218256, -0.1170491, 0, 1, 0.4941176, 1,
-0.1875839, 1.696992, -0.6514696, 0, 1, 0.5019608, 1,
-0.1865938, -1.045171, -3.467207, 0, 1, 0.509804, 1,
-0.1847155, -1.105176, -6.405873, 0, 1, 0.5137255, 1,
-0.183447, -1.572164, -3.175084, 0, 1, 0.5215687, 1,
-0.1824426, 0.9260657, 0.2477067, 0, 1, 0.5254902, 1,
-0.1781506, -0.8706246, -3.991573, 0, 1, 0.5333334, 1,
-0.1765667, 0.3489475, 0.5490122, 0, 1, 0.5372549, 1,
-0.1744324, 0.1303855, -1.686966, 0, 1, 0.5450981, 1,
-0.1731082, -1.021694, -1.945059, 0, 1, 0.5490196, 1,
-0.1685646, 0.5320617, 0.1017148, 0, 1, 0.5568628, 1,
-0.1685421, 0.294953, 0.4952234, 0, 1, 0.5607843, 1,
-0.1660629, 0.9037475, -0.1046709, 0, 1, 0.5686275, 1,
-0.1632453, -1.906266, -3.009508, 0, 1, 0.572549, 1,
-0.1627999, -0.3126059, -3.696461, 0, 1, 0.5803922, 1,
-0.1555518, 0.814034, -1.603979, 0, 1, 0.5843138, 1,
-0.1429418, 0.8568281, -0.6482222, 0, 1, 0.5921569, 1,
-0.1404038, 0.332566, 1.457609, 0, 1, 0.5960785, 1,
-0.1402843, 0.5330055, -1.864756, 0, 1, 0.6039216, 1,
-0.1371896, 0.2579561, 0.6288784, 0, 1, 0.6117647, 1,
-0.1355755, -1.279095, -3.065154, 0, 1, 0.6156863, 1,
-0.1310901, 0.3680046, -0.810331, 0, 1, 0.6235294, 1,
-0.1262122, -1.049191, -5.095205, 0, 1, 0.627451, 1,
-0.1239288, -0.8462943, -3.311582, 0, 1, 0.6352941, 1,
-0.115625, -0.2962915, -1.517899, 0, 1, 0.6392157, 1,
-0.1137148, -0.6772452, -4.665134, 0, 1, 0.6470588, 1,
-0.1133921, 0.9824297, -0.7523147, 0, 1, 0.6509804, 1,
-0.1092565, 0.1039562, -1.003049, 0, 1, 0.6588235, 1,
-0.1090776, 1.707372, -0.2980424, 0, 1, 0.6627451, 1,
-0.09920226, -0.4548023, -3.6701, 0, 1, 0.6705883, 1,
-0.09916995, -1.293118, -3.685107, 0, 1, 0.6745098, 1,
-0.09760968, 0.9533622, 2.074191, 0, 1, 0.682353, 1,
-0.09757613, -1.239427, -3.39573, 0, 1, 0.6862745, 1,
-0.09598403, 0.1957816, -0.7379509, 0, 1, 0.6941177, 1,
-0.09262393, -0.5530471, -2.041252, 0, 1, 0.7019608, 1,
-0.0912682, -1.352001, -4.803902, 0, 1, 0.7058824, 1,
-0.08545362, 0.3505145, 0.01918306, 0, 1, 0.7137255, 1,
-0.08013473, -0.3771126, -3.788557, 0, 1, 0.7176471, 1,
-0.07626658, -0.987044, -2.728461, 0, 1, 0.7254902, 1,
-0.07552082, 1.78313, -0.06149281, 0, 1, 0.7294118, 1,
-0.07469783, 1.090575, -0.005048256, 0, 1, 0.7372549, 1,
-0.07119276, -0.8506027, -3.309573, 0, 1, 0.7411765, 1,
-0.06972606, -2.991916, -3.023433, 0, 1, 0.7490196, 1,
-0.0681779, 0.3030848, -1.208835, 0, 1, 0.7529412, 1,
-0.06692915, -1.014398, -2.858567, 0, 1, 0.7607843, 1,
-0.06469726, 0.2748053, -0.1408782, 0, 1, 0.7647059, 1,
-0.05739119, 2.398246, -1.360225, 0, 1, 0.772549, 1,
-0.05284208, -1.654772, -3.50259, 0, 1, 0.7764706, 1,
-0.05200924, 0.1789471, -3.331565, 0, 1, 0.7843137, 1,
-0.05196734, 0.9974104, 1.123077, 0, 1, 0.7882353, 1,
-0.0492909, 1.024013, -2.654175, 0, 1, 0.7960784, 1,
-0.04422993, -0.2221978, -2.044004, 0, 1, 0.8039216, 1,
-0.0438229, -1.618047, -1.971575, 0, 1, 0.8078431, 1,
-0.04177767, 0.544049, -2.431328, 0, 1, 0.8156863, 1,
-0.04175998, -0.2860934, -4.178275, 0, 1, 0.8196079, 1,
-0.04145685, -0.05735678, -1.402073, 0, 1, 0.827451, 1,
-0.04054265, 0.6085474, -1.102362, 0, 1, 0.8313726, 1,
-0.03903857, -1.5041, -2.977239, 0, 1, 0.8392157, 1,
-0.03711547, 0.4281856, 0.60419, 0, 1, 0.8431373, 1,
-0.03660752, -1.182684, -2.979895, 0, 1, 0.8509804, 1,
-0.03333088, 2.239463, 0.7417446, 0, 1, 0.854902, 1,
-0.02957128, -2.341374, -2.623764, 0, 1, 0.8627451, 1,
-0.02895135, -0.5863377, -3.238689, 0, 1, 0.8666667, 1,
-0.02808372, -0.9131179, -1.556375, 0, 1, 0.8745098, 1,
-0.02654115, -1.647853, -3.391216, 0, 1, 0.8784314, 1,
-0.02430002, -1.734149, -2.895092, 0, 1, 0.8862745, 1,
-0.02131997, -1.732188, -4.240743, 0, 1, 0.8901961, 1,
-0.01890372, -2.526167, -3.564805, 0, 1, 0.8980392, 1,
-0.01757735, -1.022761, -2.60801, 0, 1, 0.9058824, 1,
-0.01432152, -1.816046, -4.756845, 0, 1, 0.9098039, 1,
-0.01228943, 0.7108663, 0.08382526, 0, 1, 0.9176471, 1,
-0.01133461, -1.193101, -4.868896, 0, 1, 0.9215686, 1,
-0.01022704, 0.8186479, 0.2140802, 0, 1, 0.9294118, 1,
-0.008892701, -1.198933, -4.984539, 0, 1, 0.9333333, 1,
-0.007991711, -1.049042, -4.194858, 0, 1, 0.9411765, 1,
-0.007443896, -1.265053, -1.977062, 0, 1, 0.945098, 1,
-0.00434949, -0.4280334, -4.093407, 0, 1, 0.9529412, 1,
-0.003147746, 0.4404544, 2.279415, 0, 1, 0.9568627, 1,
-0.0005773398, -0.2442784, -2.433817, 0, 1, 0.9647059, 1,
0.002275708, 1.043331, -1.743801, 0, 1, 0.9686275, 1,
0.002586239, -0.4526082, 2.322846, 0, 1, 0.9764706, 1,
0.002931236, 0.04516353, 0.3988062, 0, 1, 0.9803922, 1,
0.003502618, -0.3519707, 3.094087, 0, 1, 0.9882353, 1,
0.01436663, 0.5953665, 1.793638, 0, 1, 0.9921569, 1,
0.01766633, -0.1513, 4.53914, 0, 1, 1, 1,
0.01878182, -0.6181718, 3.773551, 0, 0.9921569, 1, 1,
0.02028898, 0.1311178, -1.568236, 0, 0.9882353, 1, 1,
0.0204583, 2.000941, 0.8817437, 0, 0.9803922, 1, 1,
0.02510582, -0.3321662, 4.070769, 0, 0.9764706, 1, 1,
0.02908172, 0.7008002, 0.3138621, 0, 0.9686275, 1, 1,
0.03015272, -0.1092199, 3.20711, 0, 0.9647059, 1, 1,
0.03770375, -0.163369, 2.869316, 0, 0.9568627, 1, 1,
0.03946155, 2.05569, -1.557914, 0, 0.9529412, 1, 1,
0.04153169, 0.2290734, 0.7670858, 0, 0.945098, 1, 1,
0.04236718, -1.147285, 2.728564, 0, 0.9411765, 1, 1,
0.04393091, 0.02888408, 0.4661397, 0, 0.9333333, 1, 1,
0.04901776, 0.5205159, -0.1308611, 0, 0.9294118, 1, 1,
0.05075962, -2.185494, 2.963145, 0, 0.9215686, 1, 1,
0.05307754, -0.3197158, 3.181507, 0, 0.9176471, 1, 1,
0.05476273, 2.646963, -1.167823, 0, 0.9098039, 1, 1,
0.05746933, -2.423162, 2.915857, 0, 0.9058824, 1, 1,
0.0577269, 0.2158338, -0.4048445, 0, 0.8980392, 1, 1,
0.05969314, 1.04509, -0.6184421, 0, 0.8901961, 1, 1,
0.06044393, -2.340331, 3.013156, 0, 0.8862745, 1, 1,
0.06428521, -1.863963, 2.86439, 0, 0.8784314, 1, 1,
0.06448431, -1.879221, 3.080589, 0, 0.8745098, 1, 1,
0.06731188, 0.4233779, 0.2772825, 0, 0.8666667, 1, 1,
0.06746893, -1.092846, 2.602761, 0, 0.8627451, 1, 1,
0.06783184, 0.09729685, 0.8257555, 0, 0.854902, 1, 1,
0.06810277, 1.226317, 1.798903, 0, 0.8509804, 1, 1,
0.06933827, -1.435938, 4.473512, 0, 0.8431373, 1, 1,
0.06997172, -0.719033, 3.987159, 0, 0.8392157, 1, 1,
0.07210296, -1.291228, 1.528263, 0, 0.8313726, 1, 1,
0.0750831, 0.1778128, -0.8465233, 0, 0.827451, 1, 1,
0.07511459, 1.42995, -0.8865727, 0, 0.8196079, 1, 1,
0.07841892, -0.6121089, 1.88982, 0, 0.8156863, 1, 1,
0.07969491, 0.2809134, -0.6199412, 0, 0.8078431, 1, 1,
0.07971313, -0.5201577, 1.842085, 0, 0.8039216, 1, 1,
0.08197367, -0.5788609, 2.821412, 0, 0.7960784, 1, 1,
0.0838451, -0.6462108, 2.53774, 0, 0.7882353, 1, 1,
0.08558239, 1.694385, 0.3111434, 0, 0.7843137, 1, 1,
0.08583041, 0.2900363, 0.7847188, 0, 0.7764706, 1, 1,
0.08595496, -0.4336393, 3.813086, 0, 0.772549, 1, 1,
0.09120015, 0.1428269, 0.5260162, 0, 0.7647059, 1, 1,
0.0940095, 1.527201, -0.8623895, 0, 0.7607843, 1, 1,
0.1020926, 0.697209, -0.7102171, 0, 0.7529412, 1, 1,
0.1023452, 0.06766951, -0.2432501, 0, 0.7490196, 1, 1,
0.1032779, -0.8745559, 3.021235, 0, 0.7411765, 1, 1,
0.1037588, -1.600328, 2.791634, 0, 0.7372549, 1, 1,
0.1073337, -1.365426, 2.455644, 0, 0.7294118, 1, 1,
0.1182, 0.2226593, 1.81403, 0, 0.7254902, 1, 1,
0.1216185, 0.5969939, 0.4342481, 0, 0.7176471, 1, 1,
0.123032, -0.4870176, 2.481765, 0, 0.7137255, 1, 1,
0.123266, -0.697814, 3.87332, 0, 0.7058824, 1, 1,
0.1250551, -0.2484101, 0.4947793, 0, 0.6980392, 1, 1,
0.1254977, 0.2379994, -0.1595186, 0, 0.6941177, 1, 1,
0.1259339, -0.3738073, 3.205098, 0, 0.6862745, 1, 1,
0.1259975, -1.153941, 2.705425, 0, 0.682353, 1, 1,
0.1269394, -0.6165134, 3.914907, 0, 0.6745098, 1, 1,
0.1280638, -0.9611699, 4.121799, 0, 0.6705883, 1, 1,
0.1384479, -0.235999, 0.8205689, 0, 0.6627451, 1, 1,
0.1389383, 0.9555967, -0.1165152, 0, 0.6588235, 1, 1,
0.1406155, 0.568194, -2.021967, 0, 0.6509804, 1, 1,
0.1416367, -0.4975463, 2.689045, 0, 0.6470588, 1, 1,
0.1448508, -0.430768, 3.42736, 0, 0.6392157, 1, 1,
0.1489051, -1.139383, 4.171416, 0, 0.6352941, 1, 1,
0.1559146, 0.6997873, 0.4222617, 0, 0.627451, 1, 1,
0.1568504, 1.156445, 1.254488, 0, 0.6235294, 1, 1,
0.1574051, 0.2384225, -0.03454874, 0, 0.6156863, 1, 1,
0.1583162, 0.477937, -1.662549, 0, 0.6117647, 1, 1,
0.1585273, -0.2447833, 2.173256, 0, 0.6039216, 1, 1,
0.1598217, -0.7586792, 3.13369, 0, 0.5960785, 1, 1,
0.1636386, -1.845179, 3.647152, 0, 0.5921569, 1, 1,
0.1653403, -0.2400768, 2.503846, 0, 0.5843138, 1, 1,
0.1683205, 0.1582806, -0.2063728, 0, 0.5803922, 1, 1,
0.1686193, 0.4047073, 0.6082706, 0, 0.572549, 1, 1,
0.1722231, -0.6065822, 4.11623, 0, 0.5686275, 1, 1,
0.1771362, 0.6229933, -1.023995, 0, 0.5607843, 1, 1,
0.1827285, 1.061931, 0.4235664, 0, 0.5568628, 1, 1,
0.1840506, 1.405937, 0.8009693, 0, 0.5490196, 1, 1,
0.1841432, 0.02973216, 0.9307973, 0, 0.5450981, 1, 1,
0.1861525, -0.3110777, 2.378576, 0, 0.5372549, 1, 1,
0.1862034, -0.1568324, 4.909543, 0, 0.5333334, 1, 1,
0.1865972, -0.09206587, 3.141193, 0, 0.5254902, 1, 1,
0.1899234, 1.054117, -0.9892249, 0, 0.5215687, 1, 1,
0.1918226, 1.861596, -0.7032002, 0, 0.5137255, 1, 1,
0.195116, -0.9797935, 3.493509, 0, 0.509804, 1, 1,
0.195871, -1.183962, 3.173288, 0, 0.5019608, 1, 1,
0.2031655, -0.5519866, 3.446459, 0, 0.4941176, 1, 1,
0.2039128, -0.06586934, 2.346902, 0, 0.4901961, 1, 1,
0.2087858, 0.4325753, 0.281165, 0, 0.4823529, 1, 1,
0.2130072, -0.8729461, 3.541664, 0, 0.4784314, 1, 1,
0.2142391, 0.7532913, -0.9658198, 0, 0.4705882, 1, 1,
0.2153893, -0.581349, 1.244275, 0, 0.4666667, 1, 1,
0.2184418, -2.126346, 3.626306, 0, 0.4588235, 1, 1,
0.2195814, 0.7049866, -0.2848974, 0, 0.454902, 1, 1,
0.2206612, -0.7528576, 1.522848, 0, 0.4470588, 1, 1,
0.2231053, 0.5455917, 0.9012667, 0, 0.4431373, 1, 1,
0.2290836, -0.2397121, 2.519147, 0, 0.4352941, 1, 1,
0.2297588, -0.004778634, 1.770188, 0, 0.4313726, 1, 1,
0.2298426, -0.353043, 3.153004, 0, 0.4235294, 1, 1,
0.2298706, -0.7444864, 3.786754, 0, 0.4196078, 1, 1,
0.2309283, -0.8211007, 2.636974, 0, 0.4117647, 1, 1,
0.2318161, 0.1833607, 2.170601, 0, 0.4078431, 1, 1,
0.2358116, -0.1527343, 2.168879, 0, 0.4, 1, 1,
0.2388347, -0.04558944, 2.718865, 0, 0.3921569, 1, 1,
0.2436011, -0.6901696, 2.692785, 0, 0.3882353, 1, 1,
0.2453968, 0.9606748, 0.5095367, 0, 0.3803922, 1, 1,
0.2461704, -0.2435985, 2.197515, 0, 0.3764706, 1, 1,
0.2526614, 2.790454, 0.6236139, 0, 0.3686275, 1, 1,
0.2527838, 0.03516199, 2.765723, 0, 0.3647059, 1, 1,
0.2542477, -0.4894121, 3.407504, 0, 0.3568628, 1, 1,
0.2545767, 1.060774, -1.199018, 0, 0.3529412, 1, 1,
0.2631839, 1.188651, 0.04407975, 0, 0.345098, 1, 1,
0.2670959, 0.04712356, 0.7709658, 0, 0.3411765, 1, 1,
0.271859, 0.6771901, -0.7912967, 0, 0.3333333, 1, 1,
0.2746736, 0.8729721, 2.719959, 0, 0.3294118, 1, 1,
0.2751284, 0.7951618, 1.417272, 0, 0.3215686, 1, 1,
0.2786407, 0.4111286, 1.670241, 0, 0.3176471, 1, 1,
0.2805126, 0.2275463, 1.401014, 0, 0.3098039, 1, 1,
0.2832271, -0.01908037, 1.26245, 0, 0.3058824, 1, 1,
0.2842351, 0.3961482, 2.407233, 0, 0.2980392, 1, 1,
0.2925167, -1.055984, 1.701969, 0, 0.2901961, 1, 1,
0.2938254, 1.871294, -0.8004155, 0, 0.2862745, 1, 1,
0.2945873, -2.288939, 3.893519, 0, 0.2784314, 1, 1,
0.2957056, -0.06135854, 1.960199, 0, 0.2745098, 1, 1,
0.2957895, -1.590629, 2.921386, 0, 0.2666667, 1, 1,
0.2982388, 0.1280903, -0.8448093, 0, 0.2627451, 1, 1,
0.2994142, -1.021955, 2.961138, 0, 0.254902, 1, 1,
0.3050239, -1.432342, 1.308404, 0, 0.2509804, 1, 1,
0.30842, 0.7383797, 0.3593222, 0, 0.2431373, 1, 1,
0.3105401, 0.2329414, 1.913532, 0, 0.2392157, 1, 1,
0.3115101, -0.4626436, 1.014573, 0, 0.2313726, 1, 1,
0.3119008, -0.3167484, 1.165505, 0, 0.227451, 1, 1,
0.3172612, -0.2901614, 1.13859, 0, 0.2196078, 1, 1,
0.3176161, 0.1712532, 1.718689, 0, 0.2156863, 1, 1,
0.3204713, -0.05651408, 3.369349, 0, 0.2078431, 1, 1,
0.3204855, 1.619229, 1.52051, 0, 0.2039216, 1, 1,
0.3212887, -0.9425357, 0.9007813, 0, 0.1960784, 1, 1,
0.3221398, 0.7591504, -0.4646133, 0, 0.1882353, 1, 1,
0.3241296, 0.9741647, 0.6725174, 0, 0.1843137, 1, 1,
0.3273898, 0.7018968, -0.8215691, 0, 0.1764706, 1, 1,
0.3283136, 0.4594899, -0.5839077, 0, 0.172549, 1, 1,
0.3346959, -0.3460704, 1.683356, 0, 0.1647059, 1, 1,
0.3379283, 1.076479, -0.2450772, 0, 0.1607843, 1, 1,
0.3383194, 2.163735, 1.300628, 0, 0.1529412, 1, 1,
0.340229, -0.2295889, 2.711732, 0, 0.1490196, 1, 1,
0.3406272, -0.2758937, 4.326333, 0, 0.1411765, 1, 1,
0.3447151, 0.6039026, -0.537453, 0, 0.1372549, 1, 1,
0.3464618, 0.7612835, 0.6003017, 0, 0.1294118, 1, 1,
0.3472082, 0.592913, 0.6127835, 0, 0.1254902, 1, 1,
0.3488974, -0.2126228, 1.679956, 0, 0.1176471, 1, 1,
0.3489072, -0.6645631, 4.335469, 0, 0.1137255, 1, 1,
0.3494732, 0.6104639, 0.6472781, 0, 0.1058824, 1, 1,
0.3538032, -0.7020127, 3.371128, 0, 0.09803922, 1, 1,
0.3568362, -0.533252, 2.611578, 0, 0.09411765, 1, 1,
0.3587419, -0.03544009, 1.348128, 0, 0.08627451, 1, 1,
0.3593346, -0.2099502, 2.312765, 0, 0.08235294, 1, 1,
0.3649201, 0.007924235, -1.162714, 0, 0.07450981, 1, 1,
0.3649899, -0.9381166, 2.665168, 0, 0.07058824, 1, 1,
0.3689206, 0.7580227, 0.7925435, 0, 0.0627451, 1, 1,
0.3698134, 1.278803, 0.3204158, 0, 0.05882353, 1, 1,
0.3718574, 0.03758884, 0.5503438, 0, 0.05098039, 1, 1,
0.3723613, -1.34145, 2.549857, 0, 0.04705882, 1, 1,
0.3785191, 0.3725885, -0.1058408, 0, 0.03921569, 1, 1,
0.3809126, 0.1310282, 1.92349, 0, 0.03529412, 1, 1,
0.3821714, -0.30711, 0.5033149, 0, 0.02745098, 1, 1,
0.3860288, -0.827271, 3.684601, 0, 0.02352941, 1, 1,
0.3875164, 0.8882652, 1.988264, 0, 0.01568628, 1, 1,
0.3906261, -1.513905, 3.236012, 0, 0.01176471, 1, 1,
0.3912634, 0.9182194, 1.736209, 0, 0.003921569, 1, 1,
0.3926159, 0.3270063, 1.822164, 0.003921569, 0, 1, 1,
0.3954199, 0.7343519, 1.751504, 0.007843138, 0, 1, 1,
0.3983875, -0.3581981, 1.921636, 0.01568628, 0, 1, 1,
0.4030225, 1.118542, 0.4784452, 0.01960784, 0, 1, 1,
0.4062352, 2.020463, -1.427693, 0.02745098, 0, 1, 1,
0.4075605, -0.7106279, 2.369826, 0.03137255, 0, 1, 1,
0.4078276, 1.118343, -0.3907269, 0.03921569, 0, 1, 1,
0.4091373, 2.197245, -1.093595, 0.04313726, 0, 1, 1,
0.4092295, -0.5249497, 2.479741, 0.05098039, 0, 1, 1,
0.4097431, 0.5970772, 0.3498501, 0.05490196, 0, 1, 1,
0.4099018, 0.9387282, -0.899687, 0.0627451, 0, 1, 1,
0.4102655, -0.5884508, 3.023594, 0.06666667, 0, 1, 1,
0.4113665, 1.42051, 1.283844, 0.07450981, 0, 1, 1,
0.4127118, 0.4510098, 0.5333688, 0.07843138, 0, 1, 1,
0.4210007, -0.4563438, 2.962631, 0.08627451, 0, 1, 1,
0.4210094, 0.898939, 0.3961276, 0.09019608, 0, 1, 1,
0.4266424, 0.6064749, -0.2566828, 0.09803922, 0, 1, 1,
0.4285565, -0.4977515, 2.607395, 0.1058824, 0, 1, 1,
0.4320679, -0.553039, 2.585616, 0.1098039, 0, 1, 1,
0.4367888, 0.7540567, 0.2987639, 0.1176471, 0, 1, 1,
0.4416835, -0.1944499, 0.295249, 0.1215686, 0, 1, 1,
0.4422269, 1.164708, 1.234386, 0.1294118, 0, 1, 1,
0.4502183, 0.8368559, 1.077366, 0.1333333, 0, 1, 1,
0.4516615, -1.159527, 4.947177, 0.1411765, 0, 1, 1,
0.4516867, 1.011417, -1.086023, 0.145098, 0, 1, 1,
0.451824, -1.226655, 3.228266, 0.1529412, 0, 1, 1,
0.4528465, 0.3638829, 1.575655, 0.1568628, 0, 1, 1,
0.4536789, -0.2581272, 2.224806, 0.1647059, 0, 1, 1,
0.4573055, -0.02983876, 1.736928, 0.1686275, 0, 1, 1,
0.4584762, 0.241629, 2.65693, 0.1764706, 0, 1, 1,
0.4586849, 2.013318, 0.8471563, 0.1803922, 0, 1, 1,
0.4643036, -0.4093153, 3.494112, 0.1882353, 0, 1, 1,
0.4648964, -0.389101, 2.645179, 0.1921569, 0, 1, 1,
0.4653932, -0.7122272, 2.432159, 0.2, 0, 1, 1,
0.4668048, -1.025057, 4.338522, 0.2078431, 0, 1, 1,
0.4740802, -1.193032, 2.77681, 0.2117647, 0, 1, 1,
0.4769057, -1.010384, 2.682272, 0.2196078, 0, 1, 1,
0.478231, 0.2142237, 1.146108, 0.2235294, 0, 1, 1,
0.4832791, -0.6594324, 1.681355, 0.2313726, 0, 1, 1,
0.4862329, -1.875855, 3.699708, 0.2352941, 0, 1, 1,
0.4863921, 1.418962, -0.2788782, 0.2431373, 0, 1, 1,
0.4881612, -0.4248853, 4.463294, 0.2470588, 0, 1, 1,
0.495255, -0.9942486, 1.773391, 0.254902, 0, 1, 1,
0.4974225, 0.2287021, 1.307036, 0.2588235, 0, 1, 1,
0.5004363, 0.3420282, 3.257077, 0.2666667, 0, 1, 1,
0.5054264, 0.3041696, 0.5401158, 0.2705882, 0, 1, 1,
0.5072078, -0.5708868, 1.894153, 0.2784314, 0, 1, 1,
0.5134404, -1.778428, 2.825878, 0.282353, 0, 1, 1,
0.5150822, 1.401791, -1.557042, 0.2901961, 0, 1, 1,
0.5152469, 0.5166191, -0.572745, 0.2941177, 0, 1, 1,
0.5154651, 0.2947152, -0.3113837, 0.3019608, 0, 1, 1,
0.5157409, -0.6287785, 1.991176, 0.3098039, 0, 1, 1,
0.5180365, 0.04122014, 0.5708029, 0.3137255, 0, 1, 1,
0.5188433, -1.793252, 0.9617304, 0.3215686, 0, 1, 1,
0.5204522, 0.2294261, -1.227458, 0.3254902, 0, 1, 1,
0.5249045, 0.6032286, 1.749427, 0.3333333, 0, 1, 1,
0.5254949, 0.03398028, -0.01096378, 0.3372549, 0, 1, 1,
0.5288963, -0.09746293, 1.083041, 0.345098, 0, 1, 1,
0.5290083, -0.008456919, 0.2397346, 0.3490196, 0, 1, 1,
0.5311985, -0.01170346, 2.043807, 0.3568628, 0, 1, 1,
0.5354223, -0.2326318, 2.463736, 0.3607843, 0, 1, 1,
0.5399383, 1.037833, -0.02465906, 0.3686275, 0, 1, 1,
0.5495734, 1.536511, 0.7546719, 0.372549, 0, 1, 1,
0.5498643, -0.5488338, 0.7660837, 0.3803922, 0, 1, 1,
0.5509096, 1.593376, 3.078897, 0.3843137, 0, 1, 1,
0.5524964, 1.242641, -0.8375825, 0.3921569, 0, 1, 1,
0.5527384, -1.044459, 3.171014, 0.3960784, 0, 1, 1,
0.5541542, -0.4728846, 2.260959, 0.4039216, 0, 1, 1,
0.5546913, -0.1983209, 0.6974982, 0.4117647, 0, 1, 1,
0.560988, -0.9250595, 2.01428, 0.4156863, 0, 1, 1,
0.5681346, 1.134624, 1.95672, 0.4235294, 0, 1, 1,
0.574785, 0.1201468, 0.05587829, 0.427451, 0, 1, 1,
0.5748184, 1.087451, 1.088912, 0.4352941, 0, 1, 1,
0.58064, -0.02253875, 2.054104, 0.4392157, 0, 1, 1,
0.5816749, 0.5826631, 0.3692211, 0.4470588, 0, 1, 1,
0.5882773, 0.04581384, 1.552452, 0.4509804, 0, 1, 1,
0.5916458, 1.238569, 1.448104, 0.4588235, 0, 1, 1,
0.5998318, -1.106252, 1.755594, 0.4627451, 0, 1, 1,
0.615636, -2.259831, 3.206393, 0.4705882, 0, 1, 1,
0.6160585, 0.872205, 2.292205, 0.4745098, 0, 1, 1,
0.6164867, -0.3173713, 0.3481539, 0.4823529, 0, 1, 1,
0.6201816, -1.968859, 1.786256, 0.4862745, 0, 1, 1,
0.6215519, 1.038153, -0.5146384, 0.4941176, 0, 1, 1,
0.6231118, -0.1526137, 2.397575, 0.5019608, 0, 1, 1,
0.6231272, 1.566497, 1.924585, 0.5058824, 0, 1, 1,
0.6271292, 0.7346048, -0.02822281, 0.5137255, 0, 1, 1,
0.6297268, 1.183852, 1.741332, 0.5176471, 0, 1, 1,
0.6302856, 0.3067699, 1.45196, 0.5254902, 0, 1, 1,
0.6315231, 1.1646, 2.332287, 0.5294118, 0, 1, 1,
0.6319386, -0.9649291, 2.686435, 0.5372549, 0, 1, 1,
0.6361485, -0.1090228, 0.5468127, 0.5411765, 0, 1, 1,
0.6370338, 1.15694, 0.4908294, 0.5490196, 0, 1, 1,
0.6526162, 1.341423, 0.1743156, 0.5529412, 0, 1, 1,
0.6607436, 1.476285, 2.0325, 0.5607843, 0, 1, 1,
0.6629248, 1.085867, 1.470378, 0.5647059, 0, 1, 1,
0.6672447, -0.9012377, 1.28463, 0.572549, 0, 1, 1,
0.6681397, -0.8963924, 2.22232, 0.5764706, 0, 1, 1,
0.6732879, 2.215294, 0.641754, 0.5843138, 0, 1, 1,
0.6758445, 0.8831953, -0.2686989, 0.5882353, 0, 1, 1,
0.6901224, -1.760908, 3.685462, 0.5960785, 0, 1, 1,
0.6918216, -1.310231, 1.085132, 0.6039216, 0, 1, 1,
0.69384, 0.09941803, 1.564744, 0.6078432, 0, 1, 1,
0.6958039, -0.9433038, 3.232556, 0.6156863, 0, 1, 1,
0.6975748, 0.183679, 0.6718312, 0.6196079, 0, 1, 1,
0.6996054, -0.3014093, 1.322799, 0.627451, 0, 1, 1,
0.7003044, 0.09733704, 2.9203, 0.6313726, 0, 1, 1,
0.7007887, 0.3188219, 1.329, 0.6392157, 0, 1, 1,
0.7022872, -0.5458971, 0.3778925, 0.6431373, 0, 1, 1,
0.7039568, 2.336664, 0.864736, 0.6509804, 0, 1, 1,
0.7056593, 0.2979345, 0.9187579, 0.654902, 0, 1, 1,
0.7128739, 0.7227392, 0.04540945, 0.6627451, 0, 1, 1,
0.7195688, -0.01936324, 4.108124, 0.6666667, 0, 1, 1,
0.7233108, 0.1659967, 2.085835, 0.6745098, 0, 1, 1,
0.7247769, -1.712404, 4.723688, 0.6784314, 0, 1, 1,
0.7253997, -1.532524, 3.599391, 0.6862745, 0, 1, 1,
0.7284561, 0.654896, 1.341962, 0.6901961, 0, 1, 1,
0.728757, 0.3032528, 0.8907487, 0.6980392, 0, 1, 1,
0.7292264, -1.033764, 2.812224, 0.7058824, 0, 1, 1,
0.7384518, -1.609966, 4.799694, 0.7098039, 0, 1, 1,
0.7428118, -0.2563317, 2.415303, 0.7176471, 0, 1, 1,
0.7452703, 1.492482, -0.4967654, 0.7215686, 0, 1, 1,
0.7595969, -0.57911, 2.193737, 0.7294118, 0, 1, 1,
0.7598552, -0.2670113, 0.9435943, 0.7333333, 0, 1, 1,
0.7783134, 0.836183, 1.51377, 0.7411765, 0, 1, 1,
0.78186, -1.029013, 3.149771, 0.7450981, 0, 1, 1,
0.7844972, -0.6020584, 1.491113, 0.7529412, 0, 1, 1,
0.7876416, -1.117107, 1.241667, 0.7568628, 0, 1, 1,
0.7885218, -0.2794346, 2.680662, 0.7647059, 0, 1, 1,
0.7960475, -0.00124418, 1.908911, 0.7686275, 0, 1, 1,
0.7984567, 0.9915001, 0.5767956, 0.7764706, 0, 1, 1,
0.8029216, 0.6861085, 1.441907, 0.7803922, 0, 1, 1,
0.8035153, 0.09440097, 1.651452, 0.7882353, 0, 1, 1,
0.8047687, 1.08227, 0.02428553, 0.7921569, 0, 1, 1,
0.8056276, -0.670024, 0.3684883, 0.8, 0, 1, 1,
0.8072309, -1.265692, 4.731655, 0.8078431, 0, 1, 1,
0.8124617, -1.221186, 1.914041, 0.8117647, 0, 1, 1,
0.8161079, -0.01543801, 0.7094303, 0.8196079, 0, 1, 1,
0.8187218, -0.2097131, 1.343155, 0.8235294, 0, 1, 1,
0.820149, 1.334455, -0.8448918, 0.8313726, 0, 1, 1,
0.8245098, -0.03297927, 2.564428, 0.8352941, 0, 1, 1,
0.8291426, 0.3240719, 1.569199, 0.8431373, 0, 1, 1,
0.8340932, 0.1354302, 1.450484, 0.8470588, 0, 1, 1,
0.8374799, 1.004136, 2.521233, 0.854902, 0, 1, 1,
0.8413325, 0.9359126, -0.6604245, 0.8588235, 0, 1, 1,
0.8424456, -1.575933, 4.231551, 0.8666667, 0, 1, 1,
0.8483321, 1.165652, 1.798467, 0.8705882, 0, 1, 1,
0.85311, -0.2744847, 1.055932, 0.8784314, 0, 1, 1,
0.8544531, 0.9392419, 0.8444062, 0.8823529, 0, 1, 1,
0.8569503, -0.4539951, 2.780387, 0.8901961, 0, 1, 1,
0.8679733, 0.2282786, 0.9179047, 0.8941177, 0, 1, 1,
0.8684007, -0.2541482, 3.413898, 0.9019608, 0, 1, 1,
0.8722887, -0.1571159, 0.5570214, 0.9098039, 0, 1, 1,
0.8723167, -1.347297, 0.5285097, 0.9137255, 0, 1, 1,
0.8765402, 0.6038982, 0.4272931, 0.9215686, 0, 1, 1,
0.8792732, 0.04851312, 0.9998824, 0.9254902, 0, 1, 1,
0.8837714, -0.6884435, 2.24818, 0.9333333, 0, 1, 1,
0.8885798, -0.644182, 1.498427, 0.9372549, 0, 1, 1,
0.8957345, 0.2197921, 2.869481, 0.945098, 0, 1, 1,
0.8957626, -1.773175, 2.021836, 0.9490196, 0, 1, 1,
0.896538, -0.5191695, 1.762832, 0.9568627, 0, 1, 1,
0.9034353, -0.4217311, 2.279169, 0.9607843, 0, 1, 1,
0.9074028, -1.915712, 1.906756, 0.9686275, 0, 1, 1,
0.9102964, -1.112923, 3.737403, 0.972549, 0, 1, 1,
0.9126211, 0.1822924, 2.93858, 0.9803922, 0, 1, 1,
0.9142112, -0.6978205, 2.24089, 0.9843137, 0, 1, 1,
0.9149176, -0.5494441, 0.9445348, 0.9921569, 0, 1, 1,
0.9198417, 0.2252845, 2.62202, 0.9960784, 0, 1, 1,
0.9229035, -0.2384034, 4.415573, 1, 0, 0.9960784, 1,
0.9232566, -0.3162391, 2.344543, 1, 0, 0.9882353, 1,
0.9264697, 0.2013484, 0.7804356, 1, 0, 0.9843137, 1,
0.9264934, 1.253252, 1.894836, 1, 0, 0.9764706, 1,
0.9278039, 0.6220242, 1.804516, 1, 0, 0.972549, 1,
0.9316362, -0.9106582, 1.778461, 1, 0, 0.9647059, 1,
0.93284, -0.6286898, 0.5616394, 1, 0, 0.9607843, 1,
0.9377679, 1.276883, 0.5332604, 1, 0, 0.9529412, 1,
0.9431102, 1.419891, 0.01135471, 1, 0, 0.9490196, 1,
0.943262, 0.8677023, 0.3159397, 1, 0, 0.9411765, 1,
0.9455398, 2.883835, -0.3064461, 1, 0, 0.9372549, 1,
0.9472107, -0.9169799, 2.605594, 1, 0, 0.9294118, 1,
0.951748, -1.177799, 2.341178, 1, 0, 0.9254902, 1,
0.9545756, -1.385994, 3.573701, 1, 0, 0.9176471, 1,
0.9546335, 0.2179099, 0.7733467, 1, 0, 0.9137255, 1,
0.9552042, -1.429137, 3.908016, 1, 0, 0.9058824, 1,
0.9592056, 0.7107632, 0.6744349, 1, 0, 0.9019608, 1,
0.9676872, 1.028573, 2.461821, 1, 0, 0.8941177, 1,
0.9681813, 0.3626707, 1.875367, 1, 0, 0.8862745, 1,
0.9753388, -0.9351358, 2.362306, 1, 0, 0.8823529, 1,
0.9796402, -1.499499, 1.614715, 1, 0, 0.8745098, 1,
0.9897071, 0.440436, 3.07304, 1, 0, 0.8705882, 1,
0.993251, 0.5236964, 1.179398, 1, 0, 0.8627451, 1,
0.9975406, 0.576173, 0.5069044, 1, 0, 0.8588235, 1,
1.01018, 0.2433873, 2.271646, 1, 0, 0.8509804, 1,
1.012863, 0.4064797, 2.103563, 1, 0, 0.8470588, 1,
1.019111, -0.7275065, 0.8774555, 1, 0, 0.8392157, 1,
1.02234, 0.6969088, 0.321665, 1, 0, 0.8352941, 1,
1.031467, -0.7325602, 1.26286, 1, 0, 0.827451, 1,
1.040173, 0.2863677, 0.651936, 1, 0, 0.8235294, 1,
1.040635, -0.0692291, -0.3553591, 1, 0, 0.8156863, 1,
1.044837, 0.5332738, 1.330274, 1, 0, 0.8117647, 1,
1.048378, 0.7666264, 0.3609428, 1, 0, 0.8039216, 1,
1.056289, -0.2094771, -0.01325421, 1, 0, 0.7960784, 1,
1.057125, 1.208817, -1.019959, 1, 0, 0.7921569, 1,
1.076579, 0.8930513, 1.746114, 1, 0, 0.7843137, 1,
1.079595, -0.184285, 2.664156, 1, 0, 0.7803922, 1,
1.080171, 0.01295183, 2.078791, 1, 0, 0.772549, 1,
1.082524, 0.5061873, 1.547652, 1, 0, 0.7686275, 1,
1.084813, 0.08316574, 2.624516, 1, 0, 0.7607843, 1,
1.092564, 0.4046897, 1.600953, 1, 0, 0.7568628, 1,
1.097111, -0.6706712, 1.973043, 1, 0, 0.7490196, 1,
1.100128, 0.7197807, 1.672062, 1, 0, 0.7450981, 1,
1.105259, -0.4406879, 2.283832, 1, 0, 0.7372549, 1,
1.107441, -0.1975764, 1.922146, 1, 0, 0.7333333, 1,
1.117666, 0.1349432, 2.969776, 1, 0, 0.7254902, 1,
1.12204, 0.5143617, 1.265693, 1, 0, 0.7215686, 1,
1.126801, -0.1538893, 0.6585376, 1, 0, 0.7137255, 1,
1.135431, 1.215459, 0.370609, 1, 0, 0.7098039, 1,
1.143538, 0.2594338, 1.423163, 1, 0, 0.7019608, 1,
1.147601, 1.152622, 0.01092129, 1, 0, 0.6941177, 1,
1.162387, 0.9729834, -0.144978, 1, 0, 0.6901961, 1,
1.168402, 0.3982898, 2.097524, 1, 0, 0.682353, 1,
1.170573, 0.7898368, 2.365268, 1, 0, 0.6784314, 1,
1.17303, -1.273268, 3.974962, 1, 0, 0.6705883, 1,
1.175977, 0.3673215, 1.962361, 1, 0, 0.6666667, 1,
1.183966, 0.6933913, -1.229063, 1, 0, 0.6588235, 1,
1.191979, -1.078907, 3.110328, 1, 0, 0.654902, 1,
1.194148, 1.119229, 0.4432984, 1, 0, 0.6470588, 1,
1.19758, -0.118816, 0.3201529, 1, 0, 0.6431373, 1,
1.201048, -1.200846, 3.601303, 1, 0, 0.6352941, 1,
1.209571, 3.187062, -0.8968411, 1, 0, 0.6313726, 1,
1.216005, -0.09101007, 0.7942576, 1, 0, 0.6235294, 1,
1.218348, -0.5685449, 1.814537, 1, 0, 0.6196079, 1,
1.223185, 0.6699671, 1.169813, 1, 0, 0.6117647, 1,
1.23042, 1.854949, -0.2565233, 1, 0, 0.6078432, 1,
1.232656, 0.8562111, 1.123706, 1, 0, 0.6, 1,
1.235455, 1.30535, 0.7115597, 1, 0, 0.5921569, 1,
1.240679, -0.08273374, 1.961235, 1, 0, 0.5882353, 1,
1.241246, 0.1897857, 1.631519, 1, 0, 0.5803922, 1,
1.24256, 0.3233997, 1.201255, 1, 0, 0.5764706, 1,
1.244975, 1.084085, 2.403057, 1, 0, 0.5686275, 1,
1.263116, -0.8369663, 1.299652, 1, 0, 0.5647059, 1,
1.264636, -0.2695265, 0.5426032, 1, 0, 0.5568628, 1,
1.275829, -0.8520077, 2.927598, 1, 0, 0.5529412, 1,
1.276287, -0.4365483, 1.276661, 1, 0, 0.5450981, 1,
1.280571, 0.9788339, 0.4388993, 1, 0, 0.5411765, 1,
1.30523, -0.9463776, 1.760878, 1, 0, 0.5333334, 1,
1.308174, -0.1362926, 2.53977, 1, 0, 0.5294118, 1,
1.31176, 0.2786905, 0.9673738, 1, 0, 0.5215687, 1,
1.311839, 0.5856665, 1.87721, 1, 0, 0.5176471, 1,
1.314104, -1.965573, 4.558372, 1, 0, 0.509804, 1,
1.323984, -1.412562, 2.392607, 1, 0, 0.5058824, 1,
1.324961, 0.1014517, -0.6673695, 1, 0, 0.4980392, 1,
1.326456, -1.688086, 2.261987, 1, 0, 0.4901961, 1,
1.331217, 1.348348, 3.108612, 1, 0, 0.4862745, 1,
1.334924, 1.85431, 2.146773, 1, 0, 0.4784314, 1,
1.337833, 0.1444809, 1.71205, 1, 0, 0.4745098, 1,
1.341723, -0.1781559, 0.8645577, 1, 0, 0.4666667, 1,
1.348771, -1.22119, 2.166, 1, 0, 0.4627451, 1,
1.36284, -1.131502, 2.169917, 1, 0, 0.454902, 1,
1.365242, -0.3296203, 0.3770967, 1, 0, 0.4509804, 1,
1.385373, -0.2451507, 1.471088, 1, 0, 0.4431373, 1,
1.3871, 0.7119607, -0.4980211, 1, 0, 0.4392157, 1,
1.387437, -2.067176, 3.34557, 1, 0, 0.4313726, 1,
1.395442, -1.609105, 3.448584, 1, 0, 0.427451, 1,
1.405615, -1.819194, 2.021767, 1, 0, 0.4196078, 1,
1.413597, -0.342849, 0.9415942, 1, 0, 0.4156863, 1,
1.41435, -1.267604, 3.340178, 1, 0, 0.4078431, 1,
1.420326, -1.816564, 1.591713, 1, 0, 0.4039216, 1,
1.420641, 0.4290637, 1.178501, 1, 0, 0.3960784, 1,
1.423005, -1.697145, -0.7079784, 1, 0, 0.3882353, 1,
1.427249, -0.2960035, 2.684054, 1, 0, 0.3843137, 1,
1.443947, 1.447004, -0.7313278, 1, 0, 0.3764706, 1,
1.446765, -0.6756675, 0.7946977, 1, 0, 0.372549, 1,
1.450772, -0.6020578, 1.861376, 1, 0, 0.3647059, 1,
1.451242, 0.7228026, 2.43841, 1, 0, 0.3607843, 1,
1.461372, -1.525239, 4.239367, 1, 0, 0.3529412, 1,
1.463954, 1.614482, 1.454157, 1, 0, 0.3490196, 1,
1.477038, 1.147919, 0.01336584, 1, 0, 0.3411765, 1,
1.488633, -0.1560885, 1.45176, 1, 0, 0.3372549, 1,
1.500778, -1.57415, 3.172404, 1, 0, 0.3294118, 1,
1.508301, -0.4187189, 1.282014, 1, 0, 0.3254902, 1,
1.515695, 0.3062724, 0.3085971, 1, 0, 0.3176471, 1,
1.52188, 2.457211, 1.469396, 1, 0, 0.3137255, 1,
1.543328, 1.780556, -0.008860078, 1, 0, 0.3058824, 1,
1.550333, 0.2789911, 2.227989, 1, 0, 0.2980392, 1,
1.592969, -0.7933995, 3.122581, 1, 0, 0.2941177, 1,
1.601924, -2.1192, 3.304396, 1, 0, 0.2862745, 1,
1.6323, -1.299216, 2.052941, 1, 0, 0.282353, 1,
1.633608, -1.103999, 2.179819, 1, 0, 0.2745098, 1,
1.63937, 0.6826043, 1.859671, 1, 0, 0.2705882, 1,
1.66728, -0.08213615, 2.648755, 1, 0, 0.2627451, 1,
1.683458, 1.11827, 1.029393, 1, 0, 0.2588235, 1,
1.696644, 1.89941, 2.116741, 1, 0, 0.2509804, 1,
1.701388, -0.1497295, 1.366304, 1, 0, 0.2470588, 1,
1.733298, -0.1560675, 1.646775, 1, 0, 0.2392157, 1,
1.742224, 0.3933343, 1.708063, 1, 0, 0.2352941, 1,
1.75483, -1.011531, 2.574626, 1, 0, 0.227451, 1,
1.779892, 0.6027103, 1.550255, 1, 0, 0.2235294, 1,
1.784286, 1.505183, 0.8104835, 1, 0, 0.2156863, 1,
1.787046, -0.7606353, 3.006142, 1, 0, 0.2117647, 1,
1.788274, -2.020936, 3.807978, 1, 0, 0.2039216, 1,
1.796125, 0.3038645, -0.06665385, 1, 0, 0.1960784, 1,
1.799131, 0.004527739, 1.319218, 1, 0, 0.1921569, 1,
1.807874, -0.2308551, 1.247125, 1, 0, 0.1843137, 1,
1.832874, 2.109091, 1.775526, 1, 0, 0.1803922, 1,
1.838608, -0.3214719, 1.915094, 1, 0, 0.172549, 1,
1.856347, 0.2995236, 2.606301, 1, 0, 0.1686275, 1,
1.860249, 0.899596, 1.922097, 1, 0, 0.1607843, 1,
1.871219, -0.8448695, -0.4559151, 1, 0, 0.1568628, 1,
1.874697, 0.4338422, 1.179052, 1, 0, 0.1490196, 1,
1.886082, -2.042099, 3.145349, 1, 0, 0.145098, 1,
1.975814, 0.5367935, 2.175122, 1, 0, 0.1372549, 1,
1.990555, 1.893021, 0.6240448, 1, 0, 0.1333333, 1,
1.9992, 0.7907017, 1.707044, 1, 0, 0.1254902, 1,
2.000833, 0.8950641, 2.468516, 1, 0, 0.1215686, 1,
2.015539, -0.3380726, 1.055467, 1, 0, 0.1137255, 1,
2.043803, -0.5389325, 0.2947298, 1, 0, 0.1098039, 1,
2.063582, -0.704836, 1.82854, 1, 0, 0.1019608, 1,
2.119723, -0.3541749, 2.335283, 1, 0, 0.09411765, 1,
2.152361, 1.408881, 1.165866, 1, 0, 0.09019608, 1,
2.157176, -1.19609, 4.041422, 1, 0, 0.08235294, 1,
2.181823, 1.390548, 0.4006763, 1, 0, 0.07843138, 1,
2.208237, 0.1202644, 0.6287793, 1, 0, 0.07058824, 1,
2.228499, -1.194132, 1.260518, 1, 0, 0.06666667, 1,
2.235245, 1.225512, -0.4780544, 1, 0, 0.05882353, 1,
2.285712, -0.8991359, 1.105958, 1, 0, 0.05490196, 1,
2.290411, -2.174391, 3.05964, 1, 0, 0.04705882, 1,
2.313017, -0.00610951, 2.623036, 1, 0, 0.04313726, 1,
2.379137, -0.6808526, 2.327266, 1, 0, 0.03529412, 1,
2.420997, 1.467882, 1.305506, 1, 0, 0.03137255, 1,
2.580124, -0.1176833, -0.3340123, 1, 0, 0.02352941, 1,
2.584146, -0.3194006, 1.062589, 1, 0, 0.01960784, 1,
2.672365, -2.001309, 3.82334, 1, 0, 0.01176471, 1,
2.965659, -0.8389621, 3.920641, 1, 0, 0.007843138, 1
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
-0.4017558, -4.603868, -8.330215, 0, -0.5, 0.5, 0.5,
-0.4017558, -4.603868, -8.330215, 1, -0.5, 0.5, 0.5,
-0.4017558, -4.603868, -8.330215, 1, 1.5, 0.5, 0.5,
-0.4017558, -4.603868, -8.330215, 0, 1.5, 0.5, 0.5
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
-4.910724, -0.1438186, -8.330215, 0, -0.5, 0.5, 0.5,
-4.910724, -0.1438186, -8.330215, 1, -0.5, 0.5, 0.5,
-4.910724, -0.1438186, -8.330215, 1, 1.5, 0.5, 0.5,
-4.910724, -0.1438186, -8.330215, 0, 1.5, 0.5, 0.5
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
-4.910724, -4.603868, -0.7293482, 0, -0.5, 0.5, 0.5,
-4.910724, -4.603868, -0.7293482, 1, -0.5, 0.5, 0.5,
-4.910724, -4.603868, -0.7293482, 1, 1.5, 0.5, 0.5,
-4.910724, -4.603868, -0.7293482, 0, 1.5, 0.5, 0.5
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
-3, -3.574626, -6.576169,
2, -3.574626, -6.576169,
-3, -3.574626, -6.576169,
-3, -3.746166, -6.86851,
-2, -3.574626, -6.576169,
-2, -3.746166, -6.86851,
-1, -3.574626, -6.576169,
-1, -3.746166, -6.86851,
0, -3.574626, -6.576169,
0, -3.746166, -6.86851,
1, -3.574626, -6.576169,
1, -3.746166, -6.86851,
2, -3.574626, -6.576169,
2, -3.746166, -6.86851
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
-3, -4.089247, -7.453192, 0, -0.5, 0.5, 0.5,
-3, -4.089247, -7.453192, 1, -0.5, 0.5, 0.5,
-3, -4.089247, -7.453192, 1, 1.5, 0.5, 0.5,
-3, -4.089247, -7.453192, 0, 1.5, 0.5, 0.5,
-2, -4.089247, -7.453192, 0, -0.5, 0.5, 0.5,
-2, -4.089247, -7.453192, 1, -0.5, 0.5, 0.5,
-2, -4.089247, -7.453192, 1, 1.5, 0.5, 0.5,
-2, -4.089247, -7.453192, 0, 1.5, 0.5, 0.5,
-1, -4.089247, -7.453192, 0, -0.5, 0.5, 0.5,
-1, -4.089247, -7.453192, 1, -0.5, 0.5, 0.5,
-1, -4.089247, -7.453192, 1, 1.5, 0.5, 0.5,
-1, -4.089247, -7.453192, 0, 1.5, 0.5, 0.5,
0, -4.089247, -7.453192, 0, -0.5, 0.5, 0.5,
0, -4.089247, -7.453192, 1, -0.5, 0.5, 0.5,
0, -4.089247, -7.453192, 1, 1.5, 0.5, 0.5,
0, -4.089247, -7.453192, 0, 1.5, 0.5, 0.5,
1, -4.089247, -7.453192, 0, -0.5, 0.5, 0.5,
1, -4.089247, -7.453192, 1, -0.5, 0.5, 0.5,
1, -4.089247, -7.453192, 1, 1.5, 0.5, 0.5,
1, -4.089247, -7.453192, 0, 1.5, 0.5, 0.5,
2, -4.089247, -7.453192, 0, -0.5, 0.5, 0.5,
2, -4.089247, -7.453192, 1, -0.5, 0.5, 0.5,
2, -4.089247, -7.453192, 1, 1.5, 0.5, 0.5,
2, -4.089247, -7.453192, 0, 1.5, 0.5, 0.5
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
-3.870193, -3, -6.576169,
-3.870193, 3, -6.576169,
-3.870193, -3, -6.576169,
-4.043615, -3, -6.86851,
-3.870193, -2, -6.576169,
-4.043615, -2, -6.86851,
-3.870193, -1, -6.576169,
-4.043615, -1, -6.86851,
-3.870193, 0, -6.576169,
-4.043615, 0, -6.86851,
-3.870193, 1, -6.576169,
-4.043615, 1, -6.86851,
-3.870193, 2, -6.576169,
-4.043615, 2, -6.86851,
-3.870193, 3, -6.576169,
-4.043615, 3, -6.86851
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
-4.390459, -3, -7.453192, 0, -0.5, 0.5, 0.5,
-4.390459, -3, -7.453192, 1, -0.5, 0.5, 0.5,
-4.390459, -3, -7.453192, 1, 1.5, 0.5, 0.5,
-4.390459, -3, -7.453192, 0, 1.5, 0.5, 0.5,
-4.390459, -2, -7.453192, 0, -0.5, 0.5, 0.5,
-4.390459, -2, -7.453192, 1, -0.5, 0.5, 0.5,
-4.390459, -2, -7.453192, 1, 1.5, 0.5, 0.5,
-4.390459, -2, -7.453192, 0, 1.5, 0.5, 0.5,
-4.390459, -1, -7.453192, 0, -0.5, 0.5, 0.5,
-4.390459, -1, -7.453192, 1, -0.5, 0.5, 0.5,
-4.390459, -1, -7.453192, 1, 1.5, 0.5, 0.5,
-4.390459, -1, -7.453192, 0, 1.5, 0.5, 0.5,
-4.390459, 0, -7.453192, 0, -0.5, 0.5, 0.5,
-4.390459, 0, -7.453192, 1, -0.5, 0.5, 0.5,
-4.390459, 0, -7.453192, 1, 1.5, 0.5, 0.5,
-4.390459, 0, -7.453192, 0, 1.5, 0.5, 0.5,
-4.390459, 1, -7.453192, 0, -0.5, 0.5, 0.5,
-4.390459, 1, -7.453192, 1, -0.5, 0.5, 0.5,
-4.390459, 1, -7.453192, 1, 1.5, 0.5, 0.5,
-4.390459, 1, -7.453192, 0, 1.5, 0.5, 0.5,
-4.390459, 2, -7.453192, 0, -0.5, 0.5, 0.5,
-4.390459, 2, -7.453192, 1, -0.5, 0.5, 0.5,
-4.390459, 2, -7.453192, 1, 1.5, 0.5, 0.5,
-4.390459, 2, -7.453192, 0, 1.5, 0.5, 0.5,
-4.390459, 3, -7.453192, 0, -0.5, 0.5, 0.5,
-4.390459, 3, -7.453192, 1, -0.5, 0.5, 0.5,
-4.390459, 3, -7.453192, 1, 1.5, 0.5, 0.5,
-4.390459, 3, -7.453192, 0, 1.5, 0.5, 0.5
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
-3.870193, -3.574626, -6,
-3.870193, -3.574626, 4,
-3.870193, -3.574626, -6,
-4.043615, -3.746166, -6,
-3.870193, -3.574626, -4,
-4.043615, -3.746166, -4,
-3.870193, -3.574626, -2,
-4.043615, -3.746166, -2,
-3.870193, -3.574626, 0,
-4.043615, -3.746166, 0,
-3.870193, -3.574626, 2,
-4.043615, -3.746166, 2,
-3.870193, -3.574626, 4,
-4.043615, -3.746166, 4
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
-4.390459, -4.089247, -6, 0, -0.5, 0.5, 0.5,
-4.390459, -4.089247, -6, 1, -0.5, 0.5, 0.5,
-4.390459, -4.089247, -6, 1, 1.5, 0.5, 0.5,
-4.390459, -4.089247, -6, 0, 1.5, 0.5, 0.5,
-4.390459, -4.089247, -4, 0, -0.5, 0.5, 0.5,
-4.390459, -4.089247, -4, 1, -0.5, 0.5, 0.5,
-4.390459, -4.089247, -4, 1, 1.5, 0.5, 0.5,
-4.390459, -4.089247, -4, 0, 1.5, 0.5, 0.5,
-4.390459, -4.089247, -2, 0, -0.5, 0.5, 0.5,
-4.390459, -4.089247, -2, 1, -0.5, 0.5, 0.5,
-4.390459, -4.089247, -2, 1, 1.5, 0.5, 0.5,
-4.390459, -4.089247, -2, 0, 1.5, 0.5, 0.5,
-4.390459, -4.089247, 0, 0, -0.5, 0.5, 0.5,
-4.390459, -4.089247, 0, 1, -0.5, 0.5, 0.5,
-4.390459, -4.089247, 0, 1, 1.5, 0.5, 0.5,
-4.390459, -4.089247, 0, 0, 1.5, 0.5, 0.5,
-4.390459, -4.089247, 2, 0, -0.5, 0.5, 0.5,
-4.390459, -4.089247, 2, 1, -0.5, 0.5, 0.5,
-4.390459, -4.089247, 2, 1, 1.5, 0.5, 0.5,
-4.390459, -4.089247, 2, 0, 1.5, 0.5, 0.5,
-4.390459, -4.089247, 4, 0, -0.5, 0.5, 0.5,
-4.390459, -4.089247, 4, 1, -0.5, 0.5, 0.5,
-4.390459, -4.089247, 4, 1, 1.5, 0.5, 0.5,
-4.390459, -4.089247, 4, 0, 1.5, 0.5, 0.5
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
-3.870193, -3.574626, -6.576169,
-3.870193, 3.286988, -6.576169,
-3.870193, -3.574626, 5.117473,
-3.870193, 3.286988, 5.117473,
-3.870193, -3.574626, -6.576169,
-3.870193, -3.574626, 5.117473,
-3.870193, 3.286988, -6.576169,
-3.870193, 3.286988, 5.117473,
-3.870193, -3.574626, -6.576169,
3.066681, -3.574626, -6.576169,
-3.870193, -3.574626, 5.117473,
3.066681, -3.574626, 5.117473,
-3.870193, 3.286988, -6.576169,
3.066681, 3.286988, -6.576169,
-3.870193, 3.286988, 5.117473,
3.066681, 3.286988, 5.117473,
3.066681, -3.574626, -6.576169,
3.066681, 3.286988, -6.576169,
3.066681, -3.574626, 5.117473,
3.066681, 3.286988, 5.117473,
3.066681, -3.574626, -6.576169,
3.066681, -3.574626, 5.117473,
3.066681, 3.286988, -6.576169,
3.066681, 3.286988, 5.117473
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
var radius = 8.132355;
var distance = 36.18176;
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
mvMatrix.translate( 0.4017558, 0.1438186, 0.7293482 );
mvMatrix.scale( 1.267554, 1.281457, 0.7519352 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.18176);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
fenothiocarb<-read.table("fenothiocarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenothiocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenothiocarb' not found
```

```r
y<-fenothiocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenothiocarb' not found
```

```r
z<-fenothiocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenothiocarb' not found
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
-3.769171, 1.073055, -1.949294, 0, 0, 1, 1, 1,
-3.398133, 1.456138, -0.3114025, 1, 0, 0, 1, 1,
-3.273776, 0.1814846, -0.8573726, 1, 0, 0, 1, 1,
-3.251618, -0.930875, -1.89297, 1, 0, 0, 1, 1,
-3.165989, -0.01240444, -0.8903773, 1, 0, 0, 1, 1,
-2.870791, 0.874252, -1.071485, 1, 0, 0, 1, 1,
-2.832966, -0.3599212, 0.6253954, 0, 0, 0, 1, 1,
-2.804251, 1.287224, -0.9927638, 0, 0, 0, 1, 1,
-2.723954, 1.55104, -1.795699, 0, 0, 0, 1, 1,
-2.662759, 0.3337978, -2.34546, 0, 0, 0, 1, 1,
-2.654474, 0.180523, -1.802204, 0, 0, 0, 1, 1,
-2.591199, 0.5477501, -1.633821, 0, 0, 0, 1, 1,
-2.552324, 0.2063673, -1.286052, 0, 0, 0, 1, 1,
-2.416619, -0.009596306, 0.9799249, 1, 1, 1, 1, 1,
-2.301067, -0.6679108, 0.1224401, 1, 1, 1, 1, 1,
-2.242107, 0.5732546, -0.369306, 1, 1, 1, 1, 1,
-2.239147, 0.1276468, -0.9287745, 1, 1, 1, 1, 1,
-2.211882, 0.3325065, -1.090718, 1, 1, 1, 1, 1,
-2.196742, -0.738214, 0.175465, 1, 1, 1, 1, 1,
-2.115533, -1.364692, -1.282442, 1, 1, 1, 1, 1,
-2.109816, 1.123122, -0.6807861, 1, 1, 1, 1, 1,
-2.079179, -2.144432, -2.205683, 1, 1, 1, 1, 1,
-2.076066, -0.1916424, -0.7473314, 1, 1, 1, 1, 1,
-2.031468, 0.09250983, -2.31361, 1, 1, 1, 1, 1,
-2.017729, 0.2152163, -0.4029802, 1, 1, 1, 1, 1,
-1.98057, -0.4605322, -2.167729, 1, 1, 1, 1, 1,
-1.949364, 0.3867417, -0.8776686, 1, 1, 1, 1, 1,
-1.908388, -0.1198605, -1.978559, 1, 1, 1, 1, 1,
-1.903709, 0.9867291, -1.687872, 0, 0, 1, 1, 1,
-1.894648, 0.5153826, -1.841006, 1, 0, 0, 1, 1,
-1.887904, 1.088367, 0.3462086, 1, 0, 0, 1, 1,
-1.881884, -2.77595, -3.872311, 1, 0, 0, 1, 1,
-1.87443, 0.7095519, 0.2294559, 1, 0, 0, 1, 1,
-1.873075, 1.12316, -0.1917641, 1, 0, 0, 1, 1,
-1.862052, 0.4546353, -0.4541868, 0, 0, 0, 1, 1,
-1.831824, -0.4661716, -0.8022533, 0, 0, 0, 1, 1,
-1.825234, 1.296066, -0.6331611, 0, 0, 0, 1, 1,
-1.81396, 1.088127, 1.106641, 0, 0, 0, 1, 1,
-1.812393, 1.248196, 0.106896, 0, 0, 0, 1, 1,
-1.783651, 0.05775335, -1.16554, 0, 0, 0, 1, 1,
-1.783209, 0.3821987, -0.2959193, 0, 0, 0, 1, 1,
-1.767821, 0.643459, -1.837829, 1, 1, 1, 1, 1,
-1.758385, -1.227002, -0.7234623, 1, 1, 1, 1, 1,
-1.752371, 0.156885, -3.034986, 1, 1, 1, 1, 1,
-1.751371, -0.5126594, -2.543644, 1, 1, 1, 1, 1,
-1.748961, 1.290724, -0.3172028, 1, 1, 1, 1, 1,
-1.746646, 1.380719, -2.269497, 1, 1, 1, 1, 1,
-1.733123, -0.6775925, -1.891622, 1, 1, 1, 1, 1,
-1.717131, 0.101025, -0.7496627, 1, 1, 1, 1, 1,
-1.707927, -1.060297, -2.962758, 1, 1, 1, 1, 1,
-1.682957, -0.72849, -2.963015, 1, 1, 1, 1, 1,
-1.680446, 1.203551, -1.996076, 1, 1, 1, 1, 1,
-1.675797, -0.6681069, -0.7392516, 1, 1, 1, 1, 1,
-1.623972, 0.07231966, -3.106716, 1, 1, 1, 1, 1,
-1.618959, 0.09132214, -0.7147495, 1, 1, 1, 1, 1,
-1.618049, -0.6557013, -1.107841, 1, 1, 1, 1, 1,
-1.597365, 0.3876214, -0.2911127, 0, 0, 1, 1, 1,
-1.577366, -0.4888145, -2.326408, 1, 0, 0, 1, 1,
-1.566666, 1.015081, -0.8823745, 1, 0, 0, 1, 1,
-1.5575, 1.222996, -0.3459764, 1, 0, 0, 1, 1,
-1.529009, 0.2657505, -0.5752225, 1, 0, 0, 1, 1,
-1.507257, 0.06625487, -1.968039, 1, 0, 0, 1, 1,
-1.505274, -0.5679072, -0.8780727, 0, 0, 0, 1, 1,
-1.498493, 0.9736244, -1.935252, 0, 0, 0, 1, 1,
-1.496601, 0.894676, -0.4798104, 0, 0, 0, 1, 1,
-1.481457, -1.851414, -2.124877, 0, 0, 0, 1, 1,
-1.476247, -0.1295936, -1.481258, 0, 0, 0, 1, 1,
-1.44574, -1.571495, -1.830704, 0, 0, 0, 1, 1,
-1.445332, -2.213462, -3.995705, 0, 0, 0, 1, 1,
-1.436697, 1.019204, -2.313521, 1, 1, 1, 1, 1,
-1.429818, 1.248962, 0.5930933, 1, 1, 1, 1, 1,
-1.423612, 0.7741447, -0.7943159, 1, 1, 1, 1, 1,
-1.423529, -0.2569738, -2.430468, 1, 1, 1, 1, 1,
-1.408247, -0.2225708, -0.4485546, 1, 1, 1, 1, 1,
-1.406222, -1.76751, -4.691878, 1, 1, 1, 1, 1,
-1.395701, 0.1718958, -2.708257, 1, 1, 1, 1, 1,
-1.39169, 1.431811, -1.360536, 1, 1, 1, 1, 1,
-1.385982, -0.2320148, -1.076728, 1, 1, 1, 1, 1,
-1.38277, -0.4945295, -3.093795, 1, 1, 1, 1, 1,
-1.375933, -0.1546703, 0.1645024, 1, 1, 1, 1, 1,
-1.374135, 0.05074646, -1.399015, 1, 1, 1, 1, 1,
-1.373292, 0.188709, -0.6015456, 1, 1, 1, 1, 1,
-1.372954, -0.9288684, -4.101424, 1, 1, 1, 1, 1,
-1.372324, -3.161665, -2.356507, 1, 1, 1, 1, 1,
-1.362353, -0.8442404, -1.262678, 0, 0, 1, 1, 1,
-1.357327, -0.6623319, -1.898031, 1, 0, 0, 1, 1,
-1.356976, 0.418985, -0.8540739, 1, 0, 0, 1, 1,
-1.353905, -0.1654409, -4.072383, 1, 0, 0, 1, 1,
-1.347738, -0.02166629, -0.7993833, 1, 0, 0, 1, 1,
-1.343217, -0.9013866, -3.118495, 1, 0, 0, 1, 1,
-1.339116, -1.833279, -3.348973, 0, 0, 0, 1, 1,
-1.337127, -2.561885, -1.497004, 0, 0, 0, 1, 1,
-1.321538, 0.03189466, -1.438865, 0, 0, 0, 1, 1,
-1.298967, 0.6055588, -0.9891627, 0, 0, 0, 1, 1,
-1.297674, -0.1744666, -1.791076, 0, 0, 0, 1, 1,
-1.297567, -0.3885733, -2.196298, 0, 0, 0, 1, 1,
-1.297231, -1.702704, -1.301373, 0, 0, 0, 1, 1,
-1.291873, 1.044771, -0.3783519, 1, 1, 1, 1, 1,
-1.290151, 1.493172, 0.2333258, 1, 1, 1, 1, 1,
-1.282746, 0.351875, -0.7508428, 1, 1, 1, 1, 1,
-1.280018, 0.6284155, -1.539237, 1, 1, 1, 1, 1,
-1.27505, -0.6864271, -2.004355, 1, 1, 1, 1, 1,
-1.274998, 0.7974421, 0.7970477, 1, 1, 1, 1, 1,
-1.264404, -1.666, -1.851657, 1, 1, 1, 1, 1,
-1.262061, 1.34653, 0.1531159, 1, 1, 1, 1, 1,
-1.259768, 1.453734, -0.2137066, 1, 1, 1, 1, 1,
-1.258418, 1.741376, -0.2966104, 1, 1, 1, 1, 1,
-1.252395, -1.026475, -2.294849, 1, 1, 1, 1, 1,
-1.250839, 0.7698485, -1.365827, 1, 1, 1, 1, 1,
-1.242434, -0.4983451, -3.053707, 1, 1, 1, 1, 1,
-1.239727, 1.713643, -2.109052, 1, 1, 1, 1, 1,
-1.235952, -0.6568609, -1.847822, 1, 1, 1, 1, 1,
-1.233067, 0.9646339, -0.5315528, 0, 0, 1, 1, 1,
-1.228668, 0.7350652, -0.5151871, 1, 0, 0, 1, 1,
-1.221248, 0.4811528, -0.01888357, 1, 0, 0, 1, 1,
-1.218436, 2.470411, 0.6918995, 1, 0, 0, 1, 1,
-1.205254, 1.374554, -0.14695, 1, 0, 0, 1, 1,
-1.203847, 0.4892862, 0.4293138, 1, 0, 0, 1, 1,
-1.201527, -0.4696386, -1.982802, 0, 0, 0, 1, 1,
-1.199292, 0.96447, 1.53968, 0, 0, 0, 1, 1,
-1.194073, -0.7638987, -1.805576, 0, 0, 0, 1, 1,
-1.192165, -0.947, -3.815806, 0, 0, 0, 1, 1,
-1.189605, -0.6491993, -2.366453, 0, 0, 0, 1, 1,
-1.182279, 0.6727858, 0.05971484, 0, 0, 0, 1, 1,
-1.181967, 0.0982668, -0.1243788, 0, 0, 0, 1, 1,
-1.181238, -0.8693087, -2.159292, 1, 1, 1, 1, 1,
-1.17912, 0.1814579, -1.103793, 1, 1, 1, 1, 1,
-1.177389, 2.195377, -0.1122322, 1, 1, 1, 1, 1,
-1.167524, -1.849638, -4.060308, 1, 1, 1, 1, 1,
-1.162107, 0.4150622, 0.2280363, 1, 1, 1, 1, 1,
-1.161733, 0.2441161, -2.980438, 1, 1, 1, 1, 1,
-1.154101, 1.267517, -2.377418, 1, 1, 1, 1, 1,
-1.148326, 0.8752891, -0.1655776, 1, 1, 1, 1, 1,
-1.142117, 2.00681, -1.030515, 1, 1, 1, 1, 1,
-1.142089, 0.1499308, -0.6389831, 1, 1, 1, 1, 1,
-1.142079, 0.370611, -1.181995, 1, 1, 1, 1, 1,
-1.139536, 0.09761319, -2.923486, 1, 1, 1, 1, 1,
-1.120311, -0.7663944, -1.255698, 1, 1, 1, 1, 1,
-1.119833, 1.998444, 1.073638, 1, 1, 1, 1, 1,
-1.111286, -1.323228, -2.267342, 1, 1, 1, 1, 1,
-1.106159, -0.0233752, -0.7028962, 0, 0, 1, 1, 1,
-1.105971, -0.6401584, -3.284904, 1, 0, 0, 1, 1,
-1.103768, 0.09717161, -2.226107, 1, 0, 0, 1, 1,
-1.097023, -1.223519, -2.554592, 1, 0, 0, 1, 1,
-1.092744, -0.06970122, -0.7064859, 1, 0, 0, 1, 1,
-1.089733, -1.529917, -2.623603, 1, 0, 0, 1, 1,
-1.086054, -2.359921, -2.065366, 0, 0, 0, 1, 1,
-1.077014, 0.3905555, -1.449996, 0, 0, 0, 1, 1,
-1.074651, -0.9296175, -0.3025337, 0, 0, 0, 1, 1,
-1.064603, 1.28173, -0.7552216, 0, 0, 0, 1, 1,
-1.064397, -1.264415, -4.403261, 0, 0, 0, 1, 1,
-1.059668, -1.747128, -1.4495, 0, 0, 0, 1, 1,
-1.050534, -0.9422129, -2.245816, 0, 0, 0, 1, 1,
-1.045622, -0.6387159, -1.910241, 1, 1, 1, 1, 1,
-1.037411, 0.6010404, 1.281738, 1, 1, 1, 1, 1,
-1.029756, -0.06562161, -1.28775, 1, 1, 1, 1, 1,
-1.026361, 0.6848319, -0.3255277, 1, 1, 1, 1, 1,
-1.02459, 0.669803, -0.2539862, 1, 1, 1, 1, 1,
-1.016565, 0.8360484, 0.6261203, 1, 1, 1, 1, 1,
-1.00604, 0.405433, -0.6388029, 1, 1, 1, 1, 1,
-0.9997292, 1.927306, -2.063556, 1, 1, 1, 1, 1,
-0.9931201, 0.3280726, -1.76949, 1, 1, 1, 1, 1,
-0.9922065, -1.4088, -3.352511, 1, 1, 1, 1, 1,
-0.9854775, 1.487166, -0.1648587, 1, 1, 1, 1, 1,
-0.984388, -2.549241, -3.376442, 1, 1, 1, 1, 1,
-0.9692946, 0.7583257, 0.5830345, 1, 1, 1, 1, 1,
-0.9647441, 0.07644616, -2.176507, 1, 1, 1, 1, 1,
-0.9640076, -0.4107294, -2.931055, 1, 1, 1, 1, 1,
-0.9584761, 0.6332506, 1.126732, 0, 0, 1, 1, 1,
-0.9511083, 1.241496, -1.4063, 1, 0, 0, 1, 1,
-0.9505973, 0.4098869, -2.19115, 1, 0, 0, 1, 1,
-0.9480051, -1.097066, -3.105907, 1, 0, 0, 1, 1,
-0.9469428, 0.2098552, -2.740588, 1, 0, 0, 1, 1,
-0.9464024, 0.2704233, -0.9997334, 1, 0, 0, 1, 1,
-0.9422882, 0.2325291, -1.580024, 0, 0, 0, 1, 1,
-0.9355056, 0.4018372, -1.006041, 0, 0, 0, 1, 1,
-0.9300236, -0.2151102, -1.484648, 0, 0, 0, 1, 1,
-0.9287419, -0.8656501, -3.862819, 0, 0, 0, 1, 1,
-0.9191776, 0.8617871, -0.9241186, 0, 0, 0, 1, 1,
-0.912255, 0.2737104, -1.686791, 0, 0, 0, 1, 1,
-0.9052592, 1.222615, -0.3000031, 0, 0, 0, 1, 1,
-0.9048844, 1.363103, 0.03479289, 1, 1, 1, 1, 1,
-0.9044469, 0.06002345, -0.6554118, 1, 1, 1, 1, 1,
-0.9028465, -1.856089, -2.511003, 1, 1, 1, 1, 1,
-0.9026925, -0.7849464, -2.700263, 1, 1, 1, 1, 1,
-0.9005277, -0.604227, -1.960005, 1, 1, 1, 1, 1,
-0.8928508, 0.4264981, -1.49679, 1, 1, 1, 1, 1,
-0.8925221, 0.4448653, -0.3333126, 1, 1, 1, 1, 1,
-0.8860567, 1.050416, 0.1619172, 1, 1, 1, 1, 1,
-0.885194, -0.7237462, -3.182021, 1, 1, 1, 1, 1,
-0.8532171, 0.3936317, -1.142694, 1, 1, 1, 1, 1,
-0.8485309, -0.7747096, -3.578572, 1, 1, 1, 1, 1,
-0.8465263, -0.6982907, -1.312542, 1, 1, 1, 1, 1,
-0.8464279, 0.3242867, -1.764176, 1, 1, 1, 1, 1,
-0.8446246, -0.2981594, -1.21695, 1, 1, 1, 1, 1,
-0.8331208, 0.5960222, -0.588681, 1, 1, 1, 1, 1,
-0.8291477, 0.4467869, -1.107302, 0, 0, 1, 1, 1,
-0.8259329, -0.0552185, -2.211739, 1, 0, 0, 1, 1,
-0.8228917, -0.2795674, -1.552838, 1, 0, 0, 1, 1,
-0.8217635, -0.737932, -0.6889861, 1, 0, 0, 1, 1,
-0.8117287, 0.6941164, 0.8248637, 1, 0, 0, 1, 1,
-0.8024312, 0.08469812, 0.376694, 1, 0, 0, 1, 1,
-0.8017886, -0.2704591, -1.583521, 0, 0, 0, 1, 1,
-0.7976418, -1.187668, -2.164627, 0, 0, 0, 1, 1,
-0.7962902, 1.905103, -0.4728547, 0, 0, 0, 1, 1,
-0.7910993, -1.09066, -0.9213896, 0, 0, 0, 1, 1,
-0.7902786, 0.003501476, -1.575284, 0, 0, 0, 1, 1,
-0.7858583, -1.515454, -2.734515, 0, 0, 0, 1, 1,
-0.7818241, -0.002695936, -2.528485, 0, 0, 0, 1, 1,
-0.7809085, 0.01714982, -0.7645129, 1, 1, 1, 1, 1,
-0.7706091, -1.545925, -2.612554, 1, 1, 1, 1, 1,
-0.768451, 0.2881975, -2.380136, 1, 1, 1, 1, 1,
-0.7669576, -0.6526471, -3.773168, 1, 1, 1, 1, 1,
-0.7627393, -0.3125661, -1.137368, 1, 1, 1, 1, 1,
-0.755532, -0.2934842, -3.436846, 1, 1, 1, 1, 1,
-0.7555125, -0.3449229, -1.458179, 1, 1, 1, 1, 1,
-0.7525024, -2.227507, -3.453339, 1, 1, 1, 1, 1,
-0.7500917, -0.01839927, -1.772036, 1, 1, 1, 1, 1,
-0.7471542, 1.905068, 0.3803684, 1, 1, 1, 1, 1,
-0.7449449, 0.2776965, -0.7430589, 1, 1, 1, 1, 1,
-0.744492, 0.3179206, -2.141562, 1, 1, 1, 1, 1,
-0.7400631, -1.275718, -3.855417, 1, 1, 1, 1, 1,
-0.7370628, -0.2094993, -4.733782, 1, 1, 1, 1, 1,
-0.7370201, 0.3712557, -2.325671, 1, 1, 1, 1, 1,
-0.7325661, 0.02934681, -2.088654, 0, 0, 1, 1, 1,
-0.7277311, 2.391827, 1.802814, 1, 0, 0, 1, 1,
-0.7274067, 0.1847334, -1.550733, 1, 0, 0, 1, 1,
-0.7248645, 0.3822701, -1.902721, 1, 0, 0, 1, 1,
-0.7232582, -0.2686789, -3.043034, 1, 0, 0, 1, 1,
-0.7201, -2.115575, -2.790293, 1, 0, 0, 1, 1,
-0.7197246, -1.663285, -2.377836, 0, 0, 0, 1, 1,
-0.7120575, -0.4761256, -2.839937, 0, 0, 0, 1, 1,
-0.7104825, -0.3465605, -1.756711, 0, 0, 0, 1, 1,
-0.7080114, 0.8880798, -1.701617, 0, 0, 0, 1, 1,
-0.7076152, 0.3691874, -0.7182293, 0, 0, 0, 1, 1,
-0.7072703, -0.526373, -2.012022, 0, 0, 0, 1, 1,
-0.6995972, 2.102221, 0.8402041, 0, 0, 0, 1, 1,
-0.6943963, 1.151028, -1.232599, 1, 1, 1, 1, 1,
-0.6921766, 1.511264, -1.527312, 1, 1, 1, 1, 1,
-0.6884272, 1.088789, 0.2856935, 1, 1, 1, 1, 1,
-0.6820042, -0.507324, -2.982224, 1, 1, 1, 1, 1,
-0.6790329, 0.08063262, -0.2076399, 1, 1, 1, 1, 1,
-0.6778415, 0.4612509, -1.472509, 1, 1, 1, 1, 1,
-0.6757813, -1.588113, -1.959122, 1, 1, 1, 1, 1,
-0.6699533, -0.03104508, -2.931425, 1, 1, 1, 1, 1,
-0.6694854, 1.181351, 1.044337, 1, 1, 1, 1, 1,
-0.6644172, -0.9811954, -4.275667, 1, 1, 1, 1, 1,
-0.6620256, -0.9631253, -1.066873, 1, 1, 1, 1, 1,
-0.6576562, 0.4123694, -1.057055, 1, 1, 1, 1, 1,
-0.6520183, -0.5388368, -4.031799, 1, 1, 1, 1, 1,
-0.6482448, 1.563264, -0.6892024, 1, 1, 1, 1, 1,
-0.6443942, -0.3722389, -3.202184, 1, 1, 1, 1, 1,
-0.6438456, -1.189377, -2.904118, 0, 0, 1, 1, 1,
-0.6390624, 1.549907, -0.5656902, 1, 0, 0, 1, 1,
-0.6379904, 0.6560906, -0.7927467, 1, 0, 0, 1, 1,
-0.637198, -0.2867474, -1.327398, 1, 0, 0, 1, 1,
-0.6358095, -0.1871531, -3.240766, 1, 0, 0, 1, 1,
-0.6358075, 0.7066843, -0.09273499, 1, 0, 0, 1, 1,
-0.6334087, 1.219388, 0.3842965, 0, 0, 0, 1, 1,
-0.6285079, -1.412254, -0.254405, 0, 0, 0, 1, 1,
-0.6232122, -0.7652821, -2.570584, 0, 0, 0, 1, 1,
-0.6197876, -0.1871343, -2.326669, 0, 0, 0, 1, 1,
-0.6196091, -1.76994, -3.231972, 0, 0, 0, 1, 1,
-0.6156427, -1.544073, -2.576296, 0, 0, 0, 1, 1,
-0.613202, -0.6427035, -3.333687, 0, 0, 0, 1, 1,
-0.6069025, 0.9062198, 0.04376361, 1, 1, 1, 1, 1,
-0.6028465, 1.268524, 0.4162515, 1, 1, 1, 1, 1,
-0.6018568, 0.4461944, -0.6804569, 1, 1, 1, 1, 1,
-0.5990563, 1.476862, -0.4153574, 1, 1, 1, 1, 1,
-0.5918483, 0.2275075, -2.434409, 1, 1, 1, 1, 1,
-0.5685149, 2.035018, 0.07739666, 1, 1, 1, 1, 1,
-0.5654499, 1.872118, -1.837587, 1, 1, 1, 1, 1,
-0.5651501, 0.09490549, -1.745109, 1, 1, 1, 1, 1,
-0.5645023, -1.250154, -3.260836, 1, 1, 1, 1, 1,
-0.5640182, -0.3634496, -2.577201, 1, 1, 1, 1, 1,
-0.5587553, -0.2502355, -2.887682, 1, 1, 1, 1, 1,
-0.5584333, -0.91299, -1.675769, 1, 1, 1, 1, 1,
-0.5562909, 1.25903, 1.683313, 1, 1, 1, 1, 1,
-0.5544112, -1.182409, -1.938681, 1, 1, 1, 1, 1,
-0.5542215, 0.5577301, -3.885048, 1, 1, 1, 1, 1,
-0.5540881, 1.545496, -1.146527, 0, 0, 1, 1, 1,
-0.5531058, -0.394751, -1.756799, 1, 0, 0, 1, 1,
-0.5522522, 0.4287513, 1.413003, 1, 0, 0, 1, 1,
-0.5497877, 0.2899334, -2.891842, 1, 0, 0, 1, 1,
-0.5394999, 0.5191117, -1.248869, 1, 0, 0, 1, 1,
-0.5389409, 0.7890388, -0.2314002, 1, 0, 0, 1, 1,
-0.5380432, -0.454613, -3.253283, 0, 0, 0, 1, 1,
-0.5336838, 0.1077748, -1.057167, 0, 0, 0, 1, 1,
-0.5304774, 0.4246047, -0.7466356, 0, 0, 0, 1, 1,
-0.5250565, -0.3286488, -2.206177, 0, 0, 0, 1, 1,
-0.5239175, 0.1114973, 0.0161022, 0, 0, 0, 1, 1,
-0.5195847, 0.5717663, -1.829574, 0, 0, 0, 1, 1,
-0.5181774, -0.2127316, -3.126263, 0, 0, 0, 1, 1,
-0.5150816, 0.6683145, -0.1897744, 1, 1, 1, 1, 1,
-0.5116127, 0.6448298, -2.731584, 1, 1, 1, 1, 1,
-0.5096114, 0.9640647, -0.3813545, 1, 1, 1, 1, 1,
-0.5076134, -2.433657, -1.873703, 1, 1, 1, 1, 1,
-0.506637, 0.2496459, -1.60933, 1, 1, 1, 1, 1,
-0.5058082, 0.240518, -0.865917, 1, 1, 1, 1, 1,
-0.5050809, -0.908175, -1.796142, 1, 1, 1, 1, 1,
-0.5015768, -0.7078207, -2.582884, 1, 1, 1, 1, 1,
-0.5005984, 1.080102, -0.5301347, 1, 1, 1, 1, 1,
-0.4992113, 0.7863201, -0.5936965, 1, 1, 1, 1, 1,
-0.4937756, -0.9617188, -3.254477, 1, 1, 1, 1, 1,
-0.4917212, -0.3307955, -2.766925, 1, 1, 1, 1, 1,
-0.4836016, 1.063443, -1.39887, 1, 1, 1, 1, 1,
-0.4823237, 0.1288409, -2.272518, 1, 1, 1, 1, 1,
-0.4804467, 2.269866, -0.8064158, 1, 1, 1, 1, 1,
-0.4802742, -0.4915679, -2.040588, 0, 0, 1, 1, 1,
-0.4791118, 0.3723693, 0.719089, 1, 0, 0, 1, 1,
-0.4772766, 0.8328223, 0.1322949, 1, 0, 0, 1, 1,
-0.4725954, -1.794002, -2.67903, 1, 0, 0, 1, 1,
-0.4670544, 1.041162, 0.01834716, 1, 0, 0, 1, 1,
-0.4666942, -0.01555953, -1.241846, 1, 0, 0, 1, 1,
-0.4642276, 0.9583409, -1.971184, 0, 0, 0, 1, 1,
-0.4619793, 0.4734169, 1.444004, 0, 0, 0, 1, 1,
-0.4595822, -0.6310002, -2.282491, 0, 0, 0, 1, 1,
-0.4555735, -0.7580312, -1.859567, 0, 0, 0, 1, 1,
-0.4537538, -1.034423, -2.276989, 0, 0, 0, 1, 1,
-0.453072, -0.1800561, -1.694827, 0, 0, 0, 1, 1,
-0.4526652, -0.4900009, -2.794346, 0, 0, 0, 1, 1,
-0.4514453, -1.471046, -3.338681, 1, 1, 1, 1, 1,
-0.4509219, 2.11982, -0.1009563, 1, 1, 1, 1, 1,
-0.4508029, 0.04568077, -3.356827, 1, 1, 1, 1, 1,
-0.4444802, -0.1913701, -0.4205584, 1, 1, 1, 1, 1,
-0.444051, -0.09018338, -1.268657, 1, 1, 1, 1, 1,
-0.4367838, 1.034635, -0.5099676, 1, 1, 1, 1, 1,
-0.4367313, -1.363755, -1.950059, 1, 1, 1, 1, 1,
-0.4362432, -0.8492827, -2.925657, 1, 1, 1, 1, 1,
-0.4341212, 0.2026614, 1.632803, 1, 1, 1, 1, 1,
-0.43254, -0.1404286, -1.267309, 1, 1, 1, 1, 1,
-0.4311844, -1.700442, -1.895267, 1, 1, 1, 1, 1,
-0.4227517, 1.160694, -0.5825601, 1, 1, 1, 1, 1,
-0.4226172, 0.8950366, 0.764232, 1, 1, 1, 1, 1,
-0.4222715, 0.04073251, 0.5178458, 1, 1, 1, 1, 1,
-0.4192065, -0.08839885, -0.7344249, 1, 1, 1, 1, 1,
-0.4166082, 1.288583, -2.075743, 0, 0, 1, 1, 1,
-0.4161947, -2.4592, -3.7975, 1, 0, 0, 1, 1,
-0.4154467, 1.617579, -0.02674289, 1, 0, 0, 1, 1,
-0.4104445, 2.990437, 0.8815619, 1, 0, 0, 1, 1,
-0.4032186, -2.814416, -5.519802, 1, 0, 0, 1, 1,
-0.402888, 1.28151, -0.2927887, 1, 0, 0, 1, 1,
-0.4000324, -0.4124841, -1.445156, 0, 0, 0, 1, 1,
-0.3953384, 0.1439385, -2.365898, 0, 0, 0, 1, 1,
-0.3901468, 1.362275, 0.2693624, 0, 0, 0, 1, 1,
-0.3860665, 0.9025227, 1.467268, 0, 0, 0, 1, 1,
-0.3858025, -0.9896303, -2.358955, 0, 0, 0, 1, 1,
-0.3802409, 1.760352, -1.757658, 0, 0, 0, 1, 1,
-0.380075, -0.6480864, -1.620599, 0, 0, 0, 1, 1,
-0.3781413, -0.7124279, -1.055787, 1, 1, 1, 1, 1,
-0.3775231, 0.3560711, -1.52268, 1, 1, 1, 1, 1,
-0.3746649, -1.270238, -0.7111986, 1, 1, 1, 1, 1,
-0.3739559, -1.844836, -2.815544, 1, 1, 1, 1, 1,
-0.36663, -2.151452, -2.1697, 1, 1, 1, 1, 1,
-0.364178, 0.5088092, -0.530092, 1, 1, 1, 1, 1,
-0.3609357, 0.1192047, -1.36936, 1, 1, 1, 1, 1,
-0.360611, 1.011671, -0.03467623, 1, 1, 1, 1, 1,
-0.3543225, 0.5971259, -2.229861, 1, 1, 1, 1, 1,
-0.3463746, -1.608331, -1.853455, 1, 1, 1, 1, 1,
-0.3442687, -2.086302, -3.244655, 1, 1, 1, 1, 1,
-0.3379764, -0.2203097, -2.608876, 1, 1, 1, 1, 1,
-0.3359161, -1.88837, -2.360327, 1, 1, 1, 1, 1,
-0.3344717, -1.542166, -2.573895, 1, 1, 1, 1, 1,
-0.3315495, 1.249366, -0.3275403, 1, 1, 1, 1, 1,
-0.3289276, 0.08185558, -2.402746, 0, 0, 1, 1, 1,
-0.3257326, 0.3555907, -1.916277, 1, 0, 0, 1, 1,
-0.3244624, -0.3618249, 0.05489582, 1, 0, 0, 1, 1,
-0.3242772, 0.1073641, -1.237883, 1, 0, 0, 1, 1,
-0.3224643, -0.7914481, -2.654773, 1, 0, 0, 1, 1,
-0.3209483, -0.6386189, -2.137217, 1, 0, 0, 1, 1,
-0.3137813, -2.192163, -2.475455, 0, 0, 0, 1, 1,
-0.3102307, 0.009524457, -1.706203, 0, 0, 0, 1, 1,
-0.3090952, -1.30376, -4.068178, 0, 0, 0, 1, 1,
-0.3067667, -1.222714, -1.98745, 0, 0, 0, 1, 1,
-0.3029843, 0.3819835, -2.073839, 0, 0, 0, 1, 1,
-0.3020004, -1.290308, -2.145232, 0, 0, 0, 1, 1,
-0.2947347, -0.2015492, -0.9577582, 0, 0, 0, 1, 1,
-0.2897633, 0.7265441, 0.4641238, 1, 1, 1, 1, 1,
-0.2868452, -0.268564, -0.8803422, 1, 1, 1, 1, 1,
-0.2861216, 0.1132148, -2.299704, 1, 1, 1, 1, 1,
-0.2845685, 0.01977757, -1.892529, 1, 1, 1, 1, 1,
-0.2844332, 1.210417, 0.7566586, 1, 1, 1, 1, 1,
-0.2840971, 0.4655228, -0.3007878, 1, 1, 1, 1, 1,
-0.2686636, 1.282595, -1.140359, 1, 1, 1, 1, 1,
-0.267036, 1.197198, -0.6450533, 1, 1, 1, 1, 1,
-0.265909, -0.4082287, -2.787799, 1, 1, 1, 1, 1,
-0.263616, -0.5550698, -2.568237, 1, 1, 1, 1, 1,
-0.263335, -1.11034, -3.65173, 1, 1, 1, 1, 1,
-0.2609679, -1.144557, -1.173563, 1, 1, 1, 1, 1,
-0.2577027, 0.4795647, -1.38456, 1, 1, 1, 1, 1,
-0.2566676, 0.8253978, -2.582913, 1, 1, 1, 1, 1,
-0.2537741, -1.011572, -2.081415, 1, 1, 1, 1, 1,
-0.2521573, 0.5806937, 1.191986, 0, 0, 1, 1, 1,
-0.247744, 2.759366, -1.080757, 1, 0, 0, 1, 1,
-0.246283, 0.5800007, -0.5448478, 1, 0, 0, 1, 1,
-0.234662, -1.036858, -2.609738, 1, 0, 0, 1, 1,
-0.2335118, -0.6401962, -2.640347, 1, 0, 0, 1, 1,
-0.229954, 1.300317, 0.6116754, 1, 0, 0, 1, 1,
-0.2281475, -3.006309, -2.680272, 0, 0, 0, 1, 1,
-0.2277992, 0.2352763, -1.791058, 0, 0, 0, 1, 1,
-0.2255962, 1.011907, -0.1152533, 0, 0, 0, 1, 1,
-0.2226796, 0.4459651, -1.159601, 0, 0, 0, 1, 1,
-0.2137935, 0.3799745, -0.5916084, 0, 0, 0, 1, 1,
-0.2110151, -1.009761, -2.644124, 0, 0, 0, 1, 1,
-0.2105763, 0.3817957, -1.414733, 0, 0, 0, 1, 1,
-0.210531, 0.58821, -1.364378, 1, 1, 1, 1, 1,
-0.210182, 0.3040602, -1.664365, 1, 1, 1, 1, 1,
-0.2091119, 1.563019, -0.04472222, 1, 1, 1, 1, 1,
-0.2077636, 0.7776714, 0.3161581, 1, 1, 1, 1, 1,
-0.2076301, -0.9659048, -3.260037, 1, 1, 1, 1, 1,
-0.2022074, 0.4454308, -0.088108, 1, 1, 1, 1, 1,
-0.2000544, 1.956236, 1.423928, 1, 1, 1, 1, 1,
-0.1948557, 0.3672386, -0.8431301, 1, 1, 1, 1, 1,
-0.1936745, 0.2476756, -0.7903214, 1, 1, 1, 1, 1,
-0.1925214, -3.474699, -3.037297, 1, 1, 1, 1, 1,
-0.1916777, 0.1490284, -2.195211, 1, 1, 1, 1, 1,
-0.1890962, 0.4218256, -0.1170491, 1, 1, 1, 1, 1,
-0.1875839, 1.696992, -0.6514696, 1, 1, 1, 1, 1,
-0.1865938, -1.045171, -3.467207, 1, 1, 1, 1, 1,
-0.1847155, -1.105176, -6.405873, 1, 1, 1, 1, 1,
-0.183447, -1.572164, -3.175084, 0, 0, 1, 1, 1,
-0.1824426, 0.9260657, 0.2477067, 1, 0, 0, 1, 1,
-0.1781506, -0.8706246, -3.991573, 1, 0, 0, 1, 1,
-0.1765667, 0.3489475, 0.5490122, 1, 0, 0, 1, 1,
-0.1744324, 0.1303855, -1.686966, 1, 0, 0, 1, 1,
-0.1731082, -1.021694, -1.945059, 1, 0, 0, 1, 1,
-0.1685646, 0.5320617, 0.1017148, 0, 0, 0, 1, 1,
-0.1685421, 0.294953, 0.4952234, 0, 0, 0, 1, 1,
-0.1660629, 0.9037475, -0.1046709, 0, 0, 0, 1, 1,
-0.1632453, -1.906266, -3.009508, 0, 0, 0, 1, 1,
-0.1627999, -0.3126059, -3.696461, 0, 0, 0, 1, 1,
-0.1555518, 0.814034, -1.603979, 0, 0, 0, 1, 1,
-0.1429418, 0.8568281, -0.6482222, 0, 0, 0, 1, 1,
-0.1404038, 0.332566, 1.457609, 1, 1, 1, 1, 1,
-0.1402843, 0.5330055, -1.864756, 1, 1, 1, 1, 1,
-0.1371896, 0.2579561, 0.6288784, 1, 1, 1, 1, 1,
-0.1355755, -1.279095, -3.065154, 1, 1, 1, 1, 1,
-0.1310901, 0.3680046, -0.810331, 1, 1, 1, 1, 1,
-0.1262122, -1.049191, -5.095205, 1, 1, 1, 1, 1,
-0.1239288, -0.8462943, -3.311582, 1, 1, 1, 1, 1,
-0.115625, -0.2962915, -1.517899, 1, 1, 1, 1, 1,
-0.1137148, -0.6772452, -4.665134, 1, 1, 1, 1, 1,
-0.1133921, 0.9824297, -0.7523147, 1, 1, 1, 1, 1,
-0.1092565, 0.1039562, -1.003049, 1, 1, 1, 1, 1,
-0.1090776, 1.707372, -0.2980424, 1, 1, 1, 1, 1,
-0.09920226, -0.4548023, -3.6701, 1, 1, 1, 1, 1,
-0.09916995, -1.293118, -3.685107, 1, 1, 1, 1, 1,
-0.09760968, 0.9533622, 2.074191, 1, 1, 1, 1, 1,
-0.09757613, -1.239427, -3.39573, 0, 0, 1, 1, 1,
-0.09598403, 0.1957816, -0.7379509, 1, 0, 0, 1, 1,
-0.09262393, -0.5530471, -2.041252, 1, 0, 0, 1, 1,
-0.0912682, -1.352001, -4.803902, 1, 0, 0, 1, 1,
-0.08545362, 0.3505145, 0.01918306, 1, 0, 0, 1, 1,
-0.08013473, -0.3771126, -3.788557, 1, 0, 0, 1, 1,
-0.07626658, -0.987044, -2.728461, 0, 0, 0, 1, 1,
-0.07552082, 1.78313, -0.06149281, 0, 0, 0, 1, 1,
-0.07469783, 1.090575, -0.005048256, 0, 0, 0, 1, 1,
-0.07119276, -0.8506027, -3.309573, 0, 0, 0, 1, 1,
-0.06972606, -2.991916, -3.023433, 0, 0, 0, 1, 1,
-0.0681779, 0.3030848, -1.208835, 0, 0, 0, 1, 1,
-0.06692915, -1.014398, -2.858567, 0, 0, 0, 1, 1,
-0.06469726, 0.2748053, -0.1408782, 1, 1, 1, 1, 1,
-0.05739119, 2.398246, -1.360225, 1, 1, 1, 1, 1,
-0.05284208, -1.654772, -3.50259, 1, 1, 1, 1, 1,
-0.05200924, 0.1789471, -3.331565, 1, 1, 1, 1, 1,
-0.05196734, 0.9974104, 1.123077, 1, 1, 1, 1, 1,
-0.0492909, 1.024013, -2.654175, 1, 1, 1, 1, 1,
-0.04422993, -0.2221978, -2.044004, 1, 1, 1, 1, 1,
-0.0438229, -1.618047, -1.971575, 1, 1, 1, 1, 1,
-0.04177767, 0.544049, -2.431328, 1, 1, 1, 1, 1,
-0.04175998, -0.2860934, -4.178275, 1, 1, 1, 1, 1,
-0.04145685, -0.05735678, -1.402073, 1, 1, 1, 1, 1,
-0.04054265, 0.6085474, -1.102362, 1, 1, 1, 1, 1,
-0.03903857, -1.5041, -2.977239, 1, 1, 1, 1, 1,
-0.03711547, 0.4281856, 0.60419, 1, 1, 1, 1, 1,
-0.03660752, -1.182684, -2.979895, 1, 1, 1, 1, 1,
-0.03333088, 2.239463, 0.7417446, 0, 0, 1, 1, 1,
-0.02957128, -2.341374, -2.623764, 1, 0, 0, 1, 1,
-0.02895135, -0.5863377, -3.238689, 1, 0, 0, 1, 1,
-0.02808372, -0.9131179, -1.556375, 1, 0, 0, 1, 1,
-0.02654115, -1.647853, -3.391216, 1, 0, 0, 1, 1,
-0.02430002, -1.734149, -2.895092, 1, 0, 0, 1, 1,
-0.02131997, -1.732188, -4.240743, 0, 0, 0, 1, 1,
-0.01890372, -2.526167, -3.564805, 0, 0, 0, 1, 1,
-0.01757735, -1.022761, -2.60801, 0, 0, 0, 1, 1,
-0.01432152, -1.816046, -4.756845, 0, 0, 0, 1, 1,
-0.01228943, 0.7108663, 0.08382526, 0, 0, 0, 1, 1,
-0.01133461, -1.193101, -4.868896, 0, 0, 0, 1, 1,
-0.01022704, 0.8186479, 0.2140802, 0, 0, 0, 1, 1,
-0.008892701, -1.198933, -4.984539, 1, 1, 1, 1, 1,
-0.007991711, -1.049042, -4.194858, 1, 1, 1, 1, 1,
-0.007443896, -1.265053, -1.977062, 1, 1, 1, 1, 1,
-0.00434949, -0.4280334, -4.093407, 1, 1, 1, 1, 1,
-0.003147746, 0.4404544, 2.279415, 1, 1, 1, 1, 1,
-0.0005773398, -0.2442784, -2.433817, 1, 1, 1, 1, 1,
0.002275708, 1.043331, -1.743801, 1, 1, 1, 1, 1,
0.002586239, -0.4526082, 2.322846, 1, 1, 1, 1, 1,
0.002931236, 0.04516353, 0.3988062, 1, 1, 1, 1, 1,
0.003502618, -0.3519707, 3.094087, 1, 1, 1, 1, 1,
0.01436663, 0.5953665, 1.793638, 1, 1, 1, 1, 1,
0.01766633, -0.1513, 4.53914, 1, 1, 1, 1, 1,
0.01878182, -0.6181718, 3.773551, 1, 1, 1, 1, 1,
0.02028898, 0.1311178, -1.568236, 1, 1, 1, 1, 1,
0.0204583, 2.000941, 0.8817437, 1, 1, 1, 1, 1,
0.02510582, -0.3321662, 4.070769, 0, 0, 1, 1, 1,
0.02908172, 0.7008002, 0.3138621, 1, 0, 0, 1, 1,
0.03015272, -0.1092199, 3.20711, 1, 0, 0, 1, 1,
0.03770375, -0.163369, 2.869316, 1, 0, 0, 1, 1,
0.03946155, 2.05569, -1.557914, 1, 0, 0, 1, 1,
0.04153169, 0.2290734, 0.7670858, 1, 0, 0, 1, 1,
0.04236718, -1.147285, 2.728564, 0, 0, 0, 1, 1,
0.04393091, 0.02888408, 0.4661397, 0, 0, 0, 1, 1,
0.04901776, 0.5205159, -0.1308611, 0, 0, 0, 1, 1,
0.05075962, -2.185494, 2.963145, 0, 0, 0, 1, 1,
0.05307754, -0.3197158, 3.181507, 0, 0, 0, 1, 1,
0.05476273, 2.646963, -1.167823, 0, 0, 0, 1, 1,
0.05746933, -2.423162, 2.915857, 0, 0, 0, 1, 1,
0.0577269, 0.2158338, -0.4048445, 1, 1, 1, 1, 1,
0.05969314, 1.04509, -0.6184421, 1, 1, 1, 1, 1,
0.06044393, -2.340331, 3.013156, 1, 1, 1, 1, 1,
0.06428521, -1.863963, 2.86439, 1, 1, 1, 1, 1,
0.06448431, -1.879221, 3.080589, 1, 1, 1, 1, 1,
0.06731188, 0.4233779, 0.2772825, 1, 1, 1, 1, 1,
0.06746893, -1.092846, 2.602761, 1, 1, 1, 1, 1,
0.06783184, 0.09729685, 0.8257555, 1, 1, 1, 1, 1,
0.06810277, 1.226317, 1.798903, 1, 1, 1, 1, 1,
0.06933827, -1.435938, 4.473512, 1, 1, 1, 1, 1,
0.06997172, -0.719033, 3.987159, 1, 1, 1, 1, 1,
0.07210296, -1.291228, 1.528263, 1, 1, 1, 1, 1,
0.0750831, 0.1778128, -0.8465233, 1, 1, 1, 1, 1,
0.07511459, 1.42995, -0.8865727, 1, 1, 1, 1, 1,
0.07841892, -0.6121089, 1.88982, 1, 1, 1, 1, 1,
0.07969491, 0.2809134, -0.6199412, 0, 0, 1, 1, 1,
0.07971313, -0.5201577, 1.842085, 1, 0, 0, 1, 1,
0.08197367, -0.5788609, 2.821412, 1, 0, 0, 1, 1,
0.0838451, -0.6462108, 2.53774, 1, 0, 0, 1, 1,
0.08558239, 1.694385, 0.3111434, 1, 0, 0, 1, 1,
0.08583041, 0.2900363, 0.7847188, 1, 0, 0, 1, 1,
0.08595496, -0.4336393, 3.813086, 0, 0, 0, 1, 1,
0.09120015, 0.1428269, 0.5260162, 0, 0, 0, 1, 1,
0.0940095, 1.527201, -0.8623895, 0, 0, 0, 1, 1,
0.1020926, 0.697209, -0.7102171, 0, 0, 0, 1, 1,
0.1023452, 0.06766951, -0.2432501, 0, 0, 0, 1, 1,
0.1032779, -0.8745559, 3.021235, 0, 0, 0, 1, 1,
0.1037588, -1.600328, 2.791634, 0, 0, 0, 1, 1,
0.1073337, -1.365426, 2.455644, 1, 1, 1, 1, 1,
0.1182, 0.2226593, 1.81403, 1, 1, 1, 1, 1,
0.1216185, 0.5969939, 0.4342481, 1, 1, 1, 1, 1,
0.123032, -0.4870176, 2.481765, 1, 1, 1, 1, 1,
0.123266, -0.697814, 3.87332, 1, 1, 1, 1, 1,
0.1250551, -0.2484101, 0.4947793, 1, 1, 1, 1, 1,
0.1254977, 0.2379994, -0.1595186, 1, 1, 1, 1, 1,
0.1259339, -0.3738073, 3.205098, 1, 1, 1, 1, 1,
0.1259975, -1.153941, 2.705425, 1, 1, 1, 1, 1,
0.1269394, -0.6165134, 3.914907, 1, 1, 1, 1, 1,
0.1280638, -0.9611699, 4.121799, 1, 1, 1, 1, 1,
0.1384479, -0.235999, 0.8205689, 1, 1, 1, 1, 1,
0.1389383, 0.9555967, -0.1165152, 1, 1, 1, 1, 1,
0.1406155, 0.568194, -2.021967, 1, 1, 1, 1, 1,
0.1416367, -0.4975463, 2.689045, 1, 1, 1, 1, 1,
0.1448508, -0.430768, 3.42736, 0, 0, 1, 1, 1,
0.1489051, -1.139383, 4.171416, 1, 0, 0, 1, 1,
0.1559146, 0.6997873, 0.4222617, 1, 0, 0, 1, 1,
0.1568504, 1.156445, 1.254488, 1, 0, 0, 1, 1,
0.1574051, 0.2384225, -0.03454874, 1, 0, 0, 1, 1,
0.1583162, 0.477937, -1.662549, 1, 0, 0, 1, 1,
0.1585273, -0.2447833, 2.173256, 0, 0, 0, 1, 1,
0.1598217, -0.7586792, 3.13369, 0, 0, 0, 1, 1,
0.1636386, -1.845179, 3.647152, 0, 0, 0, 1, 1,
0.1653403, -0.2400768, 2.503846, 0, 0, 0, 1, 1,
0.1683205, 0.1582806, -0.2063728, 0, 0, 0, 1, 1,
0.1686193, 0.4047073, 0.6082706, 0, 0, 0, 1, 1,
0.1722231, -0.6065822, 4.11623, 0, 0, 0, 1, 1,
0.1771362, 0.6229933, -1.023995, 1, 1, 1, 1, 1,
0.1827285, 1.061931, 0.4235664, 1, 1, 1, 1, 1,
0.1840506, 1.405937, 0.8009693, 1, 1, 1, 1, 1,
0.1841432, 0.02973216, 0.9307973, 1, 1, 1, 1, 1,
0.1861525, -0.3110777, 2.378576, 1, 1, 1, 1, 1,
0.1862034, -0.1568324, 4.909543, 1, 1, 1, 1, 1,
0.1865972, -0.09206587, 3.141193, 1, 1, 1, 1, 1,
0.1899234, 1.054117, -0.9892249, 1, 1, 1, 1, 1,
0.1918226, 1.861596, -0.7032002, 1, 1, 1, 1, 1,
0.195116, -0.9797935, 3.493509, 1, 1, 1, 1, 1,
0.195871, -1.183962, 3.173288, 1, 1, 1, 1, 1,
0.2031655, -0.5519866, 3.446459, 1, 1, 1, 1, 1,
0.2039128, -0.06586934, 2.346902, 1, 1, 1, 1, 1,
0.2087858, 0.4325753, 0.281165, 1, 1, 1, 1, 1,
0.2130072, -0.8729461, 3.541664, 1, 1, 1, 1, 1,
0.2142391, 0.7532913, -0.9658198, 0, 0, 1, 1, 1,
0.2153893, -0.581349, 1.244275, 1, 0, 0, 1, 1,
0.2184418, -2.126346, 3.626306, 1, 0, 0, 1, 1,
0.2195814, 0.7049866, -0.2848974, 1, 0, 0, 1, 1,
0.2206612, -0.7528576, 1.522848, 1, 0, 0, 1, 1,
0.2231053, 0.5455917, 0.9012667, 1, 0, 0, 1, 1,
0.2290836, -0.2397121, 2.519147, 0, 0, 0, 1, 1,
0.2297588, -0.004778634, 1.770188, 0, 0, 0, 1, 1,
0.2298426, -0.353043, 3.153004, 0, 0, 0, 1, 1,
0.2298706, -0.7444864, 3.786754, 0, 0, 0, 1, 1,
0.2309283, -0.8211007, 2.636974, 0, 0, 0, 1, 1,
0.2318161, 0.1833607, 2.170601, 0, 0, 0, 1, 1,
0.2358116, -0.1527343, 2.168879, 0, 0, 0, 1, 1,
0.2388347, -0.04558944, 2.718865, 1, 1, 1, 1, 1,
0.2436011, -0.6901696, 2.692785, 1, 1, 1, 1, 1,
0.2453968, 0.9606748, 0.5095367, 1, 1, 1, 1, 1,
0.2461704, -0.2435985, 2.197515, 1, 1, 1, 1, 1,
0.2526614, 2.790454, 0.6236139, 1, 1, 1, 1, 1,
0.2527838, 0.03516199, 2.765723, 1, 1, 1, 1, 1,
0.2542477, -0.4894121, 3.407504, 1, 1, 1, 1, 1,
0.2545767, 1.060774, -1.199018, 1, 1, 1, 1, 1,
0.2631839, 1.188651, 0.04407975, 1, 1, 1, 1, 1,
0.2670959, 0.04712356, 0.7709658, 1, 1, 1, 1, 1,
0.271859, 0.6771901, -0.7912967, 1, 1, 1, 1, 1,
0.2746736, 0.8729721, 2.719959, 1, 1, 1, 1, 1,
0.2751284, 0.7951618, 1.417272, 1, 1, 1, 1, 1,
0.2786407, 0.4111286, 1.670241, 1, 1, 1, 1, 1,
0.2805126, 0.2275463, 1.401014, 1, 1, 1, 1, 1,
0.2832271, -0.01908037, 1.26245, 0, 0, 1, 1, 1,
0.2842351, 0.3961482, 2.407233, 1, 0, 0, 1, 1,
0.2925167, -1.055984, 1.701969, 1, 0, 0, 1, 1,
0.2938254, 1.871294, -0.8004155, 1, 0, 0, 1, 1,
0.2945873, -2.288939, 3.893519, 1, 0, 0, 1, 1,
0.2957056, -0.06135854, 1.960199, 1, 0, 0, 1, 1,
0.2957895, -1.590629, 2.921386, 0, 0, 0, 1, 1,
0.2982388, 0.1280903, -0.8448093, 0, 0, 0, 1, 1,
0.2994142, -1.021955, 2.961138, 0, 0, 0, 1, 1,
0.3050239, -1.432342, 1.308404, 0, 0, 0, 1, 1,
0.30842, 0.7383797, 0.3593222, 0, 0, 0, 1, 1,
0.3105401, 0.2329414, 1.913532, 0, 0, 0, 1, 1,
0.3115101, -0.4626436, 1.014573, 0, 0, 0, 1, 1,
0.3119008, -0.3167484, 1.165505, 1, 1, 1, 1, 1,
0.3172612, -0.2901614, 1.13859, 1, 1, 1, 1, 1,
0.3176161, 0.1712532, 1.718689, 1, 1, 1, 1, 1,
0.3204713, -0.05651408, 3.369349, 1, 1, 1, 1, 1,
0.3204855, 1.619229, 1.52051, 1, 1, 1, 1, 1,
0.3212887, -0.9425357, 0.9007813, 1, 1, 1, 1, 1,
0.3221398, 0.7591504, -0.4646133, 1, 1, 1, 1, 1,
0.3241296, 0.9741647, 0.6725174, 1, 1, 1, 1, 1,
0.3273898, 0.7018968, -0.8215691, 1, 1, 1, 1, 1,
0.3283136, 0.4594899, -0.5839077, 1, 1, 1, 1, 1,
0.3346959, -0.3460704, 1.683356, 1, 1, 1, 1, 1,
0.3379283, 1.076479, -0.2450772, 1, 1, 1, 1, 1,
0.3383194, 2.163735, 1.300628, 1, 1, 1, 1, 1,
0.340229, -0.2295889, 2.711732, 1, 1, 1, 1, 1,
0.3406272, -0.2758937, 4.326333, 1, 1, 1, 1, 1,
0.3447151, 0.6039026, -0.537453, 0, 0, 1, 1, 1,
0.3464618, 0.7612835, 0.6003017, 1, 0, 0, 1, 1,
0.3472082, 0.592913, 0.6127835, 1, 0, 0, 1, 1,
0.3488974, -0.2126228, 1.679956, 1, 0, 0, 1, 1,
0.3489072, -0.6645631, 4.335469, 1, 0, 0, 1, 1,
0.3494732, 0.6104639, 0.6472781, 1, 0, 0, 1, 1,
0.3538032, -0.7020127, 3.371128, 0, 0, 0, 1, 1,
0.3568362, -0.533252, 2.611578, 0, 0, 0, 1, 1,
0.3587419, -0.03544009, 1.348128, 0, 0, 0, 1, 1,
0.3593346, -0.2099502, 2.312765, 0, 0, 0, 1, 1,
0.3649201, 0.007924235, -1.162714, 0, 0, 0, 1, 1,
0.3649899, -0.9381166, 2.665168, 0, 0, 0, 1, 1,
0.3689206, 0.7580227, 0.7925435, 0, 0, 0, 1, 1,
0.3698134, 1.278803, 0.3204158, 1, 1, 1, 1, 1,
0.3718574, 0.03758884, 0.5503438, 1, 1, 1, 1, 1,
0.3723613, -1.34145, 2.549857, 1, 1, 1, 1, 1,
0.3785191, 0.3725885, -0.1058408, 1, 1, 1, 1, 1,
0.3809126, 0.1310282, 1.92349, 1, 1, 1, 1, 1,
0.3821714, -0.30711, 0.5033149, 1, 1, 1, 1, 1,
0.3860288, -0.827271, 3.684601, 1, 1, 1, 1, 1,
0.3875164, 0.8882652, 1.988264, 1, 1, 1, 1, 1,
0.3906261, -1.513905, 3.236012, 1, 1, 1, 1, 1,
0.3912634, 0.9182194, 1.736209, 1, 1, 1, 1, 1,
0.3926159, 0.3270063, 1.822164, 1, 1, 1, 1, 1,
0.3954199, 0.7343519, 1.751504, 1, 1, 1, 1, 1,
0.3983875, -0.3581981, 1.921636, 1, 1, 1, 1, 1,
0.4030225, 1.118542, 0.4784452, 1, 1, 1, 1, 1,
0.4062352, 2.020463, -1.427693, 1, 1, 1, 1, 1,
0.4075605, -0.7106279, 2.369826, 0, 0, 1, 1, 1,
0.4078276, 1.118343, -0.3907269, 1, 0, 0, 1, 1,
0.4091373, 2.197245, -1.093595, 1, 0, 0, 1, 1,
0.4092295, -0.5249497, 2.479741, 1, 0, 0, 1, 1,
0.4097431, 0.5970772, 0.3498501, 1, 0, 0, 1, 1,
0.4099018, 0.9387282, -0.899687, 1, 0, 0, 1, 1,
0.4102655, -0.5884508, 3.023594, 0, 0, 0, 1, 1,
0.4113665, 1.42051, 1.283844, 0, 0, 0, 1, 1,
0.4127118, 0.4510098, 0.5333688, 0, 0, 0, 1, 1,
0.4210007, -0.4563438, 2.962631, 0, 0, 0, 1, 1,
0.4210094, 0.898939, 0.3961276, 0, 0, 0, 1, 1,
0.4266424, 0.6064749, -0.2566828, 0, 0, 0, 1, 1,
0.4285565, -0.4977515, 2.607395, 0, 0, 0, 1, 1,
0.4320679, -0.553039, 2.585616, 1, 1, 1, 1, 1,
0.4367888, 0.7540567, 0.2987639, 1, 1, 1, 1, 1,
0.4416835, -0.1944499, 0.295249, 1, 1, 1, 1, 1,
0.4422269, 1.164708, 1.234386, 1, 1, 1, 1, 1,
0.4502183, 0.8368559, 1.077366, 1, 1, 1, 1, 1,
0.4516615, -1.159527, 4.947177, 1, 1, 1, 1, 1,
0.4516867, 1.011417, -1.086023, 1, 1, 1, 1, 1,
0.451824, -1.226655, 3.228266, 1, 1, 1, 1, 1,
0.4528465, 0.3638829, 1.575655, 1, 1, 1, 1, 1,
0.4536789, -0.2581272, 2.224806, 1, 1, 1, 1, 1,
0.4573055, -0.02983876, 1.736928, 1, 1, 1, 1, 1,
0.4584762, 0.241629, 2.65693, 1, 1, 1, 1, 1,
0.4586849, 2.013318, 0.8471563, 1, 1, 1, 1, 1,
0.4643036, -0.4093153, 3.494112, 1, 1, 1, 1, 1,
0.4648964, -0.389101, 2.645179, 1, 1, 1, 1, 1,
0.4653932, -0.7122272, 2.432159, 0, 0, 1, 1, 1,
0.4668048, -1.025057, 4.338522, 1, 0, 0, 1, 1,
0.4740802, -1.193032, 2.77681, 1, 0, 0, 1, 1,
0.4769057, -1.010384, 2.682272, 1, 0, 0, 1, 1,
0.478231, 0.2142237, 1.146108, 1, 0, 0, 1, 1,
0.4832791, -0.6594324, 1.681355, 1, 0, 0, 1, 1,
0.4862329, -1.875855, 3.699708, 0, 0, 0, 1, 1,
0.4863921, 1.418962, -0.2788782, 0, 0, 0, 1, 1,
0.4881612, -0.4248853, 4.463294, 0, 0, 0, 1, 1,
0.495255, -0.9942486, 1.773391, 0, 0, 0, 1, 1,
0.4974225, 0.2287021, 1.307036, 0, 0, 0, 1, 1,
0.5004363, 0.3420282, 3.257077, 0, 0, 0, 1, 1,
0.5054264, 0.3041696, 0.5401158, 0, 0, 0, 1, 1,
0.5072078, -0.5708868, 1.894153, 1, 1, 1, 1, 1,
0.5134404, -1.778428, 2.825878, 1, 1, 1, 1, 1,
0.5150822, 1.401791, -1.557042, 1, 1, 1, 1, 1,
0.5152469, 0.5166191, -0.572745, 1, 1, 1, 1, 1,
0.5154651, 0.2947152, -0.3113837, 1, 1, 1, 1, 1,
0.5157409, -0.6287785, 1.991176, 1, 1, 1, 1, 1,
0.5180365, 0.04122014, 0.5708029, 1, 1, 1, 1, 1,
0.5188433, -1.793252, 0.9617304, 1, 1, 1, 1, 1,
0.5204522, 0.2294261, -1.227458, 1, 1, 1, 1, 1,
0.5249045, 0.6032286, 1.749427, 1, 1, 1, 1, 1,
0.5254949, 0.03398028, -0.01096378, 1, 1, 1, 1, 1,
0.5288963, -0.09746293, 1.083041, 1, 1, 1, 1, 1,
0.5290083, -0.008456919, 0.2397346, 1, 1, 1, 1, 1,
0.5311985, -0.01170346, 2.043807, 1, 1, 1, 1, 1,
0.5354223, -0.2326318, 2.463736, 1, 1, 1, 1, 1,
0.5399383, 1.037833, -0.02465906, 0, 0, 1, 1, 1,
0.5495734, 1.536511, 0.7546719, 1, 0, 0, 1, 1,
0.5498643, -0.5488338, 0.7660837, 1, 0, 0, 1, 1,
0.5509096, 1.593376, 3.078897, 1, 0, 0, 1, 1,
0.5524964, 1.242641, -0.8375825, 1, 0, 0, 1, 1,
0.5527384, -1.044459, 3.171014, 1, 0, 0, 1, 1,
0.5541542, -0.4728846, 2.260959, 0, 0, 0, 1, 1,
0.5546913, -0.1983209, 0.6974982, 0, 0, 0, 1, 1,
0.560988, -0.9250595, 2.01428, 0, 0, 0, 1, 1,
0.5681346, 1.134624, 1.95672, 0, 0, 0, 1, 1,
0.574785, 0.1201468, 0.05587829, 0, 0, 0, 1, 1,
0.5748184, 1.087451, 1.088912, 0, 0, 0, 1, 1,
0.58064, -0.02253875, 2.054104, 0, 0, 0, 1, 1,
0.5816749, 0.5826631, 0.3692211, 1, 1, 1, 1, 1,
0.5882773, 0.04581384, 1.552452, 1, 1, 1, 1, 1,
0.5916458, 1.238569, 1.448104, 1, 1, 1, 1, 1,
0.5998318, -1.106252, 1.755594, 1, 1, 1, 1, 1,
0.615636, -2.259831, 3.206393, 1, 1, 1, 1, 1,
0.6160585, 0.872205, 2.292205, 1, 1, 1, 1, 1,
0.6164867, -0.3173713, 0.3481539, 1, 1, 1, 1, 1,
0.6201816, -1.968859, 1.786256, 1, 1, 1, 1, 1,
0.6215519, 1.038153, -0.5146384, 1, 1, 1, 1, 1,
0.6231118, -0.1526137, 2.397575, 1, 1, 1, 1, 1,
0.6231272, 1.566497, 1.924585, 1, 1, 1, 1, 1,
0.6271292, 0.7346048, -0.02822281, 1, 1, 1, 1, 1,
0.6297268, 1.183852, 1.741332, 1, 1, 1, 1, 1,
0.6302856, 0.3067699, 1.45196, 1, 1, 1, 1, 1,
0.6315231, 1.1646, 2.332287, 1, 1, 1, 1, 1,
0.6319386, -0.9649291, 2.686435, 0, 0, 1, 1, 1,
0.6361485, -0.1090228, 0.5468127, 1, 0, 0, 1, 1,
0.6370338, 1.15694, 0.4908294, 1, 0, 0, 1, 1,
0.6526162, 1.341423, 0.1743156, 1, 0, 0, 1, 1,
0.6607436, 1.476285, 2.0325, 1, 0, 0, 1, 1,
0.6629248, 1.085867, 1.470378, 1, 0, 0, 1, 1,
0.6672447, -0.9012377, 1.28463, 0, 0, 0, 1, 1,
0.6681397, -0.8963924, 2.22232, 0, 0, 0, 1, 1,
0.6732879, 2.215294, 0.641754, 0, 0, 0, 1, 1,
0.6758445, 0.8831953, -0.2686989, 0, 0, 0, 1, 1,
0.6901224, -1.760908, 3.685462, 0, 0, 0, 1, 1,
0.6918216, -1.310231, 1.085132, 0, 0, 0, 1, 1,
0.69384, 0.09941803, 1.564744, 0, 0, 0, 1, 1,
0.6958039, -0.9433038, 3.232556, 1, 1, 1, 1, 1,
0.6975748, 0.183679, 0.6718312, 1, 1, 1, 1, 1,
0.6996054, -0.3014093, 1.322799, 1, 1, 1, 1, 1,
0.7003044, 0.09733704, 2.9203, 1, 1, 1, 1, 1,
0.7007887, 0.3188219, 1.329, 1, 1, 1, 1, 1,
0.7022872, -0.5458971, 0.3778925, 1, 1, 1, 1, 1,
0.7039568, 2.336664, 0.864736, 1, 1, 1, 1, 1,
0.7056593, 0.2979345, 0.9187579, 1, 1, 1, 1, 1,
0.7128739, 0.7227392, 0.04540945, 1, 1, 1, 1, 1,
0.7195688, -0.01936324, 4.108124, 1, 1, 1, 1, 1,
0.7233108, 0.1659967, 2.085835, 1, 1, 1, 1, 1,
0.7247769, -1.712404, 4.723688, 1, 1, 1, 1, 1,
0.7253997, -1.532524, 3.599391, 1, 1, 1, 1, 1,
0.7284561, 0.654896, 1.341962, 1, 1, 1, 1, 1,
0.728757, 0.3032528, 0.8907487, 1, 1, 1, 1, 1,
0.7292264, -1.033764, 2.812224, 0, 0, 1, 1, 1,
0.7384518, -1.609966, 4.799694, 1, 0, 0, 1, 1,
0.7428118, -0.2563317, 2.415303, 1, 0, 0, 1, 1,
0.7452703, 1.492482, -0.4967654, 1, 0, 0, 1, 1,
0.7595969, -0.57911, 2.193737, 1, 0, 0, 1, 1,
0.7598552, -0.2670113, 0.9435943, 1, 0, 0, 1, 1,
0.7783134, 0.836183, 1.51377, 0, 0, 0, 1, 1,
0.78186, -1.029013, 3.149771, 0, 0, 0, 1, 1,
0.7844972, -0.6020584, 1.491113, 0, 0, 0, 1, 1,
0.7876416, -1.117107, 1.241667, 0, 0, 0, 1, 1,
0.7885218, -0.2794346, 2.680662, 0, 0, 0, 1, 1,
0.7960475, -0.00124418, 1.908911, 0, 0, 0, 1, 1,
0.7984567, 0.9915001, 0.5767956, 0, 0, 0, 1, 1,
0.8029216, 0.6861085, 1.441907, 1, 1, 1, 1, 1,
0.8035153, 0.09440097, 1.651452, 1, 1, 1, 1, 1,
0.8047687, 1.08227, 0.02428553, 1, 1, 1, 1, 1,
0.8056276, -0.670024, 0.3684883, 1, 1, 1, 1, 1,
0.8072309, -1.265692, 4.731655, 1, 1, 1, 1, 1,
0.8124617, -1.221186, 1.914041, 1, 1, 1, 1, 1,
0.8161079, -0.01543801, 0.7094303, 1, 1, 1, 1, 1,
0.8187218, -0.2097131, 1.343155, 1, 1, 1, 1, 1,
0.820149, 1.334455, -0.8448918, 1, 1, 1, 1, 1,
0.8245098, -0.03297927, 2.564428, 1, 1, 1, 1, 1,
0.8291426, 0.3240719, 1.569199, 1, 1, 1, 1, 1,
0.8340932, 0.1354302, 1.450484, 1, 1, 1, 1, 1,
0.8374799, 1.004136, 2.521233, 1, 1, 1, 1, 1,
0.8413325, 0.9359126, -0.6604245, 1, 1, 1, 1, 1,
0.8424456, -1.575933, 4.231551, 1, 1, 1, 1, 1,
0.8483321, 1.165652, 1.798467, 0, 0, 1, 1, 1,
0.85311, -0.2744847, 1.055932, 1, 0, 0, 1, 1,
0.8544531, 0.9392419, 0.8444062, 1, 0, 0, 1, 1,
0.8569503, -0.4539951, 2.780387, 1, 0, 0, 1, 1,
0.8679733, 0.2282786, 0.9179047, 1, 0, 0, 1, 1,
0.8684007, -0.2541482, 3.413898, 1, 0, 0, 1, 1,
0.8722887, -0.1571159, 0.5570214, 0, 0, 0, 1, 1,
0.8723167, -1.347297, 0.5285097, 0, 0, 0, 1, 1,
0.8765402, 0.6038982, 0.4272931, 0, 0, 0, 1, 1,
0.8792732, 0.04851312, 0.9998824, 0, 0, 0, 1, 1,
0.8837714, -0.6884435, 2.24818, 0, 0, 0, 1, 1,
0.8885798, -0.644182, 1.498427, 0, 0, 0, 1, 1,
0.8957345, 0.2197921, 2.869481, 0, 0, 0, 1, 1,
0.8957626, -1.773175, 2.021836, 1, 1, 1, 1, 1,
0.896538, -0.5191695, 1.762832, 1, 1, 1, 1, 1,
0.9034353, -0.4217311, 2.279169, 1, 1, 1, 1, 1,
0.9074028, -1.915712, 1.906756, 1, 1, 1, 1, 1,
0.9102964, -1.112923, 3.737403, 1, 1, 1, 1, 1,
0.9126211, 0.1822924, 2.93858, 1, 1, 1, 1, 1,
0.9142112, -0.6978205, 2.24089, 1, 1, 1, 1, 1,
0.9149176, -0.5494441, 0.9445348, 1, 1, 1, 1, 1,
0.9198417, 0.2252845, 2.62202, 1, 1, 1, 1, 1,
0.9229035, -0.2384034, 4.415573, 1, 1, 1, 1, 1,
0.9232566, -0.3162391, 2.344543, 1, 1, 1, 1, 1,
0.9264697, 0.2013484, 0.7804356, 1, 1, 1, 1, 1,
0.9264934, 1.253252, 1.894836, 1, 1, 1, 1, 1,
0.9278039, 0.6220242, 1.804516, 1, 1, 1, 1, 1,
0.9316362, -0.9106582, 1.778461, 1, 1, 1, 1, 1,
0.93284, -0.6286898, 0.5616394, 0, 0, 1, 1, 1,
0.9377679, 1.276883, 0.5332604, 1, 0, 0, 1, 1,
0.9431102, 1.419891, 0.01135471, 1, 0, 0, 1, 1,
0.943262, 0.8677023, 0.3159397, 1, 0, 0, 1, 1,
0.9455398, 2.883835, -0.3064461, 1, 0, 0, 1, 1,
0.9472107, -0.9169799, 2.605594, 1, 0, 0, 1, 1,
0.951748, -1.177799, 2.341178, 0, 0, 0, 1, 1,
0.9545756, -1.385994, 3.573701, 0, 0, 0, 1, 1,
0.9546335, 0.2179099, 0.7733467, 0, 0, 0, 1, 1,
0.9552042, -1.429137, 3.908016, 0, 0, 0, 1, 1,
0.9592056, 0.7107632, 0.6744349, 0, 0, 0, 1, 1,
0.9676872, 1.028573, 2.461821, 0, 0, 0, 1, 1,
0.9681813, 0.3626707, 1.875367, 0, 0, 0, 1, 1,
0.9753388, -0.9351358, 2.362306, 1, 1, 1, 1, 1,
0.9796402, -1.499499, 1.614715, 1, 1, 1, 1, 1,
0.9897071, 0.440436, 3.07304, 1, 1, 1, 1, 1,
0.993251, 0.5236964, 1.179398, 1, 1, 1, 1, 1,
0.9975406, 0.576173, 0.5069044, 1, 1, 1, 1, 1,
1.01018, 0.2433873, 2.271646, 1, 1, 1, 1, 1,
1.012863, 0.4064797, 2.103563, 1, 1, 1, 1, 1,
1.019111, -0.7275065, 0.8774555, 1, 1, 1, 1, 1,
1.02234, 0.6969088, 0.321665, 1, 1, 1, 1, 1,
1.031467, -0.7325602, 1.26286, 1, 1, 1, 1, 1,
1.040173, 0.2863677, 0.651936, 1, 1, 1, 1, 1,
1.040635, -0.0692291, -0.3553591, 1, 1, 1, 1, 1,
1.044837, 0.5332738, 1.330274, 1, 1, 1, 1, 1,
1.048378, 0.7666264, 0.3609428, 1, 1, 1, 1, 1,
1.056289, -0.2094771, -0.01325421, 1, 1, 1, 1, 1,
1.057125, 1.208817, -1.019959, 0, 0, 1, 1, 1,
1.076579, 0.8930513, 1.746114, 1, 0, 0, 1, 1,
1.079595, -0.184285, 2.664156, 1, 0, 0, 1, 1,
1.080171, 0.01295183, 2.078791, 1, 0, 0, 1, 1,
1.082524, 0.5061873, 1.547652, 1, 0, 0, 1, 1,
1.084813, 0.08316574, 2.624516, 1, 0, 0, 1, 1,
1.092564, 0.4046897, 1.600953, 0, 0, 0, 1, 1,
1.097111, -0.6706712, 1.973043, 0, 0, 0, 1, 1,
1.100128, 0.7197807, 1.672062, 0, 0, 0, 1, 1,
1.105259, -0.4406879, 2.283832, 0, 0, 0, 1, 1,
1.107441, -0.1975764, 1.922146, 0, 0, 0, 1, 1,
1.117666, 0.1349432, 2.969776, 0, 0, 0, 1, 1,
1.12204, 0.5143617, 1.265693, 0, 0, 0, 1, 1,
1.126801, -0.1538893, 0.6585376, 1, 1, 1, 1, 1,
1.135431, 1.215459, 0.370609, 1, 1, 1, 1, 1,
1.143538, 0.2594338, 1.423163, 1, 1, 1, 1, 1,
1.147601, 1.152622, 0.01092129, 1, 1, 1, 1, 1,
1.162387, 0.9729834, -0.144978, 1, 1, 1, 1, 1,
1.168402, 0.3982898, 2.097524, 1, 1, 1, 1, 1,
1.170573, 0.7898368, 2.365268, 1, 1, 1, 1, 1,
1.17303, -1.273268, 3.974962, 1, 1, 1, 1, 1,
1.175977, 0.3673215, 1.962361, 1, 1, 1, 1, 1,
1.183966, 0.6933913, -1.229063, 1, 1, 1, 1, 1,
1.191979, -1.078907, 3.110328, 1, 1, 1, 1, 1,
1.194148, 1.119229, 0.4432984, 1, 1, 1, 1, 1,
1.19758, -0.118816, 0.3201529, 1, 1, 1, 1, 1,
1.201048, -1.200846, 3.601303, 1, 1, 1, 1, 1,
1.209571, 3.187062, -0.8968411, 1, 1, 1, 1, 1,
1.216005, -0.09101007, 0.7942576, 0, 0, 1, 1, 1,
1.218348, -0.5685449, 1.814537, 1, 0, 0, 1, 1,
1.223185, 0.6699671, 1.169813, 1, 0, 0, 1, 1,
1.23042, 1.854949, -0.2565233, 1, 0, 0, 1, 1,
1.232656, 0.8562111, 1.123706, 1, 0, 0, 1, 1,
1.235455, 1.30535, 0.7115597, 1, 0, 0, 1, 1,
1.240679, -0.08273374, 1.961235, 0, 0, 0, 1, 1,
1.241246, 0.1897857, 1.631519, 0, 0, 0, 1, 1,
1.24256, 0.3233997, 1.201255, 0, 0, 0, 1, 1,
1.244975, 1.084085, 2.403057, 0, 0, 0, 1, 1,
1.263116, -0.8369663, 1.299652, 0, 0, 0, 1, 1,
1.264636, -0.2695265, 0.5426032, 0, 0, 0, 1, 1,
1.275829, -0.8520077, 2.927598, 0, 0, 0, 1, 1,
1.276287, -0.4365483, 1.276661, 1, 1, 1, 1, 1,
1.280571, 0.9788339, 0.4388993, 1, 1, 1, 1, 1,
1.30523, -0.9463776, 1.760878, 1, 1, 1, 1, 1,
1.308174, -0.1362926, 2.53977, 1, 1, 1, 1, 1,
1.31176, 0.2786905, 0.9673738, 1, 1, 1, 1, 1,
1.311839, 0.5856665, 1.87721, 1, 1, 1, 1, 1,
1.314104, -1.965573, 4.558372, 1, 1, 1, 1, 1,
1.323984, -1.412562, 2.392607, 1, 1, 1, 1, 1,
1.324961, 0.1014517, -0.6673695, 1, 1, 1, 1, 1,
1.326456, -1.688086, 2.261987, 1, 1, 1, 1, 1,
1.331217, 1.348348, 3.108612, 1, 1, 1, 1, 1,
1.334924, 1.85431, 2.146773, 1, 1, 1, 1, 1,
1.337833, 0.1444809, 1.71205, 1, 1, 1, 1, 1,
1.341723, -0.1781559, 0.8645577, 1, 1, 1, 1, 1,
1.348771, -1.22119, 2.166, 1, 1, 1, 1, 1,
1.36284, -1.131502, 2.169917, 0, 0, 1, 1, 1,
1.365242, -0.3296203, 0.3770967, 1, 0, 0, 1, 1,
1.385373, -0.2451507, 1.471088, 1, 0, 0, 1, 1,
1.3871, 0.7119607, -0.4980211, 1, 0, 0, 1, 1,
1.387437, -2.067176, 3.34557, 1, 0, 0, 1, 1,
1.395442, -1.609105, 3.448584, 1, 0, 0, 1, 1,
1.405615, -1.819194, 2.021767, 0, 0, 0, 1, 1,
1.413597, -0.342849, 0.9415942, 0, 0, 0, 1, 1,
1.41435, -1.267604, 3.340178, 0, 0, 0, 1, 1,
1.420326, -1.816564, 1.591713, 0, 0, 0, 1, 1,
1.420641, 0.4290637, 1.178501, 0, 0, 0, 1, 1,
1.423005, -1.697145, -0.7079784, 0, 0, 0, 1, 1,
1.427249, -0.2960035, 2.684054, 0, 0, 0, 1, 1,
1.443947, 1.447004, -0.7313278, 1, 1, 1, 1, 1,
1.446765, -0.6756675, 0.7946977, 1, 1, 1, 1, 1,
1.450772, -0.6020578, 1.861376, 1, 1, 1, 1, 1,
1.451242, 0.7228026, 2.43841, 1, 1, 1, 1, 1,
1.461372, -1.525239, 4.239367, 1, 1, 1, 1, 1,
1.463954, 1.614482, 1.454157, 1, 1, 1, 1, 1,
1.477038, 1.147919, 0.01336584, 1, 1, 1, 1, 1,
1.488633, -0.1560885, 1.45176, 1, 1, 1, 1, 1,
1.500778, -1.57415, 3.172404, 1, 1, 1, 1, 1,
1.508301, -0.4187189, 1.282014, 1, 1, 1, 1, 1,
1.515695, 0.3062724, 0.3085971, 1, 1, 1, 1, 1,
1.52188, 2.457211, 1.469396, 1, 1, 1, 1, 1,
1.543328, 1.780556, -0.008860078, 1, 1, 1, 1, 1,
1.550333, 0.2789911, 2.227989, 1, 1, 1, 1, 1,
1.592969, -0.7933995, 3.122581, 1, 1, 1, 1, 1,
1.601924, -2.1192, 3.304396, 0, 0, 1, 1, 1,
1.6323, -1.299216, 2.052941, 1, 0, 0, 1, 1,
1.633608, -1.103999, 2.179819, 1, 0, 0, 1, 1,
1.63937, 0.6826043, 1.859671, 1, 0, 0, 1, 1,
1.66728, -0.08213615, 2.648755, 1, 0, 0, 1, 1,
1.683458, 1.11827, 1.029393, 1, 0, 0, 1, 1,
1.696644, 1.89941, 2.116741, 0, 0, 0, 1, 1,
1.701388, -0.1497295, 1.366304, 0, 0, 0, 1, 1,
1.733298, -0.1560675, 1.646775, 0, 0, 0, 1, 1,
1.742224, 0.3933343, 1.708063, 0, 0, 0, 1, 1,
1.75483, -1.011531, 2.574626, 0, 0, 0, 1, 1,
1.779892, 0.6027103, 1.550255, 0, 0, 0, 1, 1,
1.784286, 1.505183, 0.8104835, 0, 0, 0, 1, 1,
1.787046, -0.7606353, 3.006142, 1, 1, 1, 1, 1,
1.788274, -2.020936, 3.807978, 1, 1, 1, 1, 1,
1.796125, 0.3038645, -0.06665385, 1, 1, 1, 1, 1,
1.799131, 0.004527739, 1.319218, 1, 1, 1, 1, 1,
1.807874, -0.2308551, 1.247125, 1, 1, 1, 1, 1,
1.832874, 2.109091, 1.775526, 1, 1, 1, 1, 1,
1.838608, -0.3214719, 1.915094, 1, 1, 1, 1, 1,
1.856347, 0.2995236, 2.606301, 1, 1, 1, 1, 1,
1.860249, 0.899596, 1.922097, 1, 1, 1, 1, 1,
1.871219, -0.8448695, -0.4559151, 1, 1, 1, 1, 1,
1.874697, 0.4338422, 1.179052, 1, 1, 1, 1, 1,
1.886082, -2.042099, 3.145349, 1, 1, 1, 1, 1,
1.975814, 0.5367935, 2.175122, 1, 1, 1, 1, 1,
1.990555, 1.893021, 0.6240448, 1, 1, 1, 1, 1,
1.9992, 0.7907017, 1.707044, 1, 1, 1, 1, 1,
2.000833, 0.8950641, 2.468516, 0, 0, 1, 1, 1,
2.015539, -0.3380726, 1.055467, 1, 0, 0, 1, 1,
2.043803, -0.5389325, 0.2947298, 1, 0, 0, 1, 1,
2.063582, -0.704836, 1.82854, 1, 0, 0, 1, 1,
2.119723, -0.3541749, 2.335283, 1, 0, 0, 1, 1,
2.152361, 1.408881, 1.165866, 1, 0, 0, 1, 1,
2.157176, -1.19609, 4.041422, 0, 0, 0, 1, 1,
2.181823, 1.390548, 0.4006763, 0, 0, 0, 1, 1,
2.208237, 0.1202644, 0.6287793, 0, 0, 0, 1, 1,
2.228499, -1.194132, 1.260518, 0, 0, 0, 1, 1,
2.235245, 1.225512, -0.4780544, 0, 0, 0, 1, 1,
2.285712, -0.8991359, 1.105958, 0, 0, 0, 1, 1,
2.290411, -2.174391, 3.05964, 0, 0, 0, 1, 1,
2.313017, -0.00610951, 2.623036, 1, 1, 1, 1, 1,
2.379137, -0.6808526, 2.327266, 1, 1, 1, 1, 1,
2.420997, 1.467882, 1.305506, 1, 1, 1, 1, 1,
2.580124, -0.1176833, -0.3340123, 1, 1, 1, 1, 1,
2.584146, -0.3194006, 1.062589, 1, 1, 1, 1, 1,
2.672365, -2.001309, 3.82334, 1, 1, 1, 1, 1,
2.965659, -0.8389621, 3.920641, 1, 1, 1, 1, 1
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
var radius = 9.985603;
var distance = 35.07401;
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
mvMatrix.translate( 0.4017559, 0.1438184, 0.7293482 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.07401);
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