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
-3.680337, 1.742805, -3.01124, 1, 0, 0, 1,
-2.991549, -0.286651, -1.446935, 1, 0.007843138, 0, 1,
-2.863022, 0.819811, -1.229885, 1, 0.01176471, 0, 1,
-2.782401, 1.419836, -0.3261251, 1, 0.01960784, 0, 1,
-2.653039, 0.0003218688, -2.694028, 1, 0.02352941, 0, 1,
-2.63412, 0.6802452, -0.9457858, 1, 0.03137255, 0, 1,
-2.619097, 0.8329988, -0.7834319, 1, 0.03529412, 0, 1,
-2.615177, 1.093837, -1.472628, 1, 0.04313726, 0, 1,
-2.599013, 1.872248, -1.12075, 1, 0.04705882, 0, 1,
-2.564903, -0.6558832, -0.9861731, 1, 0.05490196, 0, 1,
-2.498814, -0.2773679, -1.83374, 1, 0.05882353, 0, 1,
-2.445755, 0.3631908, -0.986271, 1, 0.06666667, 0, 1,
-2.400464, -0.03631629, -0.4540734, 1, 0.07058824, 0, 1,
-2.344691, 0.6443774, -1.028114, 1, 0.07843138, 0, 1,
-2.179073, 7.566356e-05, -1.268113, 1, 0.08235294, 0, 1,
-2.176711, 1.065995, -1.921084, 1, 0.09019608, 0, 1,
-2.152406, 0.4517157, -1.921316, 1, 0.09411765, 0, 1,
-2.115021, -0.7983184, -2.699845, 1, 0.1019608, 0, 1,
-2.07508, 0.4912424, -0.6732928, 1, 0.1098039, 0, 1,
-2.074646, -1.780739, -1.307781, 1, 0.1137255, 0, 1,
-2.06371, 0.4152679, -1.063931, 1, 0.1215686, 0, 1,
-2.061763, 0.3584632, -0.615872, 1, 0.1254902, 0, 1,
-2.04737, 0.1973588, -1.001201, 1, 0.1333333, 0, 1,
-2.038476, -1.224411, -2.04317, 1, 0.1372549, 0, 1,
-1.99257, -0.8603817, -1.70767, 1, 0.145098, 0, 1,
-1.977484, 1.766858, 0.2782913, 1, 0.1490196, 0, 1,
-1.968242, 0.1592368, 0.02208122, 1, 0.1568628, 0, 1,
-1.954741, -0.8541203, -1.691912, 1, 0.1607843, 0, 1,
-1.94584, -1.2812, -1.884025, 1, 0.1686275, 0, 1,
-1.917154, -1.356001, -2.901872, 1, 0.172549, 0, 1,
-1.886523, 0.2678361, -2.02828, 1, 0.1803922, 0, 1,
-1.885072, 0.1298498, -1.992729, 1, 0.1843137, 0, 1,
-1.869303, 1.060355, -2.309911, 1, 0.1921569, 0, 1,
-1.858259, 0.5237723, -2.847986, 1, 0.1960784, 0, 1,
-1.856253, -0.4831688, -1.083349, 1, 0.2039216, 0, 1,
-1.854759, -1.279991, -0.4765259, 1, 0.2117647, 0, 1,
-1.85334, -0.09094261, -1.596317, 1, 0.2156863, 0, 1,
-1.809052, 1.021674, -2.913049, 1, 0.2235294, 0, 1,
-1.798668, 0.9098759, -4.327281, 1, 0.227451, 0, 1,
-1.741323, -0.1450931, -1.426336, 1, 0.2352941, 0, 1,
-1.736189, -0.09814642, -2.393648, 1, 0.2392157, 0, 1,
-1.733198, -0.270011, -3.645195, 1, 0.2470588, 0, 1,
-1.728186, -0.2373671, -0.7673605, 1, 0.2509804, 0, 1,
-1.723484, -0.8407632, -2.496868, 1, 0.2588235, 0, 1,
-1.682881, -0.3158231, -2.815572, 1, 0.2627451, 0, 1,
-1.678854, -0.7460892, -1.093032, 1, 0.2705882, 0, 1,
-1.66306, 0.3652313, -2.311119, 1, 0.2745098, 0, 1,
-1.649581, -0.3213186, -2.977365, 1, 0.282353, 0, 1,
-1.623648, -1.171921, -3.484969, 1, 0.2862745, 0, 1,
-1.601123, 0.7125784, -0.3015296, 1, 0.2941177, 0, 1,
-1.598021, 2.36623, -0.8993139, 1, 0.3019608, 0, 1,
-1.589107, -1.242371, -4.065672, 1, 0.3058824, 0, 1,
-1.579676, -0.1003333, 0.06796464, 1, 0.3137255, 0, 1,
-1.571072, 1.638283, -1.007364, 1, 0.3176471, 0, 1,
-1.567877, -0.6112837, -2.835949, 1, 0.3254902, 0, 1,
-1.56677, 0.7235806, -1.701241, 1, 0.3294118, 0, 1,
-1.566047, -0.9714031, -3.491642, 1, 0.3372549, 0, 1,
-1.558104, 2.276083, -0.8154513, 1, 0.3411765, 0, 1,
-1.552849, 0.73559, -1.593124, 1, 0.3490196, 0, 1,
-1.532708, -0.8901278, -1.485708, 1, 0.3529412, 0, 1,
-1.51289, -0.7056695, -0.864091, 1, 0.3607843, 0, 1,
-1.511991, -1.225369, -1.598221, 1, 0.3647059, 0, 1,
-1.504017, 1.257776, -0.4745608, 1, 0.372549, 0, 1,
-1.502021, 0.7285379, -1.34106, 1, 0.3764706, 0, 1,
-1.491204, 1.359103, -0.7446995, 1, 0.3843137, 0, 1,
-1.486431, -0.4314884, -2.042164, 1, 0.3882353, 0, 1,
-1.483055, -0.783069, -2.390953, 1, 0.3960784, 0, 1,
-1.479073, 0.7990788, -1.255467, 1, 0.4039216, 0, 1,
-1.477657, 1.23547, -3.266422, 1, 0.4078431, 0, 1,
-1.467164, 2.007678, -2.019213, 1, 0.4156863, 0, 1,
-1.456473, 0.7084234, -2.081872, 1, 0.4196078, 0, 1,
-1.446127, -1.201242, -0.9994629, 1, 0.427451, 0, 1,
-1.442701, -0.4205865, -1.595494, 1, 0.4313726, 0, 1,
-1.440835, 1.602372, -0.9159871, 1, 0.4392157, 0, 1,
-1.425196, 0.6484234, -2.610914, 1, 0.4431373, 0, 1,
-1.415999, -1.929201, -1.842996, 1, 0.4509804, 0, 1,
-1.415491, -0.3503141, -1.275883, 1, 0.454902, 0, 1,
-1.411177, -0.8030046, -0.5847816, 1, 0.4627451, 0, 1,
-1.410374, 0.5836176, -2.610696, 1, 0.4666667, 0, 1,
-1.408218, -0.3603151, -1.703228, 1, 0.4745098, 0, 1,
-1.395905, -1.44612, -1.986966, 1, 0.4784314, 0, 1,
-1.381641, -0.3279045, -1.627482, 1, 0.4862745, 0, 1,
-1.366125, -1.012344, -3.060155, 1, 0.4901961, 0, 1,
-1.364861, -0.2384616, -0.8339238, 1, 0.4980392, 0, 1,
-1.350027, 0.09276634, -0.0272793, 1, 0.5058824, 0, 1,
-1.334258, 0.2375011, -0.3705064, 1, 0.509804, 0, 1,
-1.329129, -0.05901659, -3.479449, 1, 0.5176471, 0, 1,
-1.321787, 1.115251, -0.8563951, 1, 0.5215687, 0, 1,
-1.316333, -0.3018489, -1.444462, 1, 0.5294118, 0, 1,
-1.294631, 2.17341, -2.216452, 1, 0.5333334, 0, 1,
-1.271068, -0.8112574, -2.074736, 1, 0.5411765, 0, 1,
-1.270846, 0.5938299, -2.650913, 1, 0.5450981, 0, 1,
-1.268352, -1.109487, -2.762302, 1, 0.5529412, 0, 1,
-1.267217, 0.2833071, -0.4831841, 1, 0.5568628, 0, 1,
-1.266706, 1.043631, -0.2200189, 1, 0.5647059, 0, 1,
-1.264808, -0.04502281, -3.118735, 1, 0.5686275, 0, 1,
-1.243954, -1.801249, -1.570121, 1, 0.5764706, 0, 1,
-1.239086, -0.1441925, -3.429903, 1, 0.5803922, 0, 1,
-1.227544, 0.4323549, -2.780474, 1, 0.5882353, 0, 1,
-1.224605, -1.611631, -1.077344, 1, 0.5921569, 0, 1,
-1.221845, -1.539554, -2.366301, 1, 0.6, 0, 1,
-1.216227, -1.754973, -1.157673, 1, 0.6078432, 0, 1,
-1.207255, -1.886593, -3.485473, 1, 0.6117647, 0, 1,
-1.206711, 1.764054, -0.7128544, 1, 0.6196079, 0, 1,
-1.175977, -0.3288741, -2.231831, 1, 0.6235294, 0, 1,
-1.152805, -0.4236136, -2.559647, 1, 0.6313726, 0, 1,
-1.148546, 2.437773, -1.376436, 1, 0.6352941, 0, 1,
-1.138645, 1.496205, -0.4408005, 1, 0.6431373, 0, 1,
-1.136591, -0.4441667, -1.898175, 1, 0.6470588, 0, 1,
-1.133731, -1.177246, -1.775723, 1, 0.654902, 0, 1,
-1.131754, 0.2221431, -0.3536179, 1, 0.6588235, 0, 1,
-1.129467, 0.3210461, -2.210705, 1, 0.6666667, 0, 1,
-1.119813, -1.368181, -4.873346, 1, 0.6705883, 0, 1,
-1.118714, -1.597103, -1.808515, 1, 0.6784314, 0, 1,
-1.107651, -2.003474, -2.768209, 1, 0.682353, 0, 1,
-1.107315, -0.03387229, -0.5739536, 1, 0.6901961, 0, 1,
-1.098338, -0.7900569, -1.574809, 1, 0.6941177, 0, 1,
-1.096139, 0.2883809, -2.393914, 1, 0.7019608, 0, 1,
-1.094228, -1.656079, -0.6877717, 1, 0.7098039, 0, 1,
-1.092315, 0.3162962, -1.848909, 1, 0.7137255, 0, 1,
-1.088823, 0.1138465, -0.752941, 1, 0.7215686, 0, 1,
-1.087518, 1.20438, 0.009221068, 1, 0.7254902, 0, 1,
-1.074202, 0.01273311, -2.606264, 1, 0.7333333, 0, 1,
-1.068119, -2.584901, -1.947075, 1, 0.7372549, 0, 1,
-1.06677, -0.1204973, -1.181431, 1, 0.7450981, 0, 1,
-1.064279, 0.716165, -1.393281, 1, 0.7490196, 0, 1,
-1.063046, -1.196886, -1.633023, 1, 0.7568628, 0, 1,
-1.06081, -0.3752071, -2.368957, 1, 0.7607843, 0, 1,
-1.053505, -1.786445, -2.351866, 1, 0.7686275, 0, 1,
-1.052036, 0.6271061, -0.9379586, 1, 0.772549, 0, 1,
-1.039179, 0.8319946, -0.03154795, 1, 0.7803922, 0, 1,
-1.034623, -2.24971, -1.940913, 1, 0.7843137, 0, 1,
-1.031889, 0.9619776, -0.6353042, 1, 0.7921569, 0, 1,
-1.027459, 0.253325, -2.047639, 1, 0.7960784, 0, 1,
-1.025364, -1.50193, -4.124719, 1, 0.8039216, 0, 1,
-1.025117, -1.70223, -2.384903, 1, 0.8117647, 0, 1,
-1.008118, 2.38287, -2.142655, 1, 0.8156863, 0, 1,
-0.9989634, 1.609615, -0.7896351, 1, 0.8235294, 0, 1,
-0.9974399, 0.3273395, -2.231603, 1, 0.827451, 0, 1,
-0.9940824, -1.800366, -5.291513, 1, 0.8352941, 0, 1,
-0.9799663, 0.5748863, -3.05563, 1, 0.8392157, 0, 1,
-0.9793625, -0.3650129, -0.4142946, 1, 0.8470588, 0, 1,
-0.975595, 1.829394, 0.1268712, 1, 0.8509804, 0, 1,
-0.9704242, 0.3339593, -0.642908, 1, 0.8588235, 0, 1,
-0.9680893, 1.10476, -0.8498701, 1, 0.8627451, 0, 1,
-0.9670491, 1.091484, -0.7652754, 1, 0.8705882, 0, 1,
-0.9611492, -0.08646654, -2.095298, 1, 0.8745098, 0, 1,
-0.9606999, 0.2596356, -0.5810572, 1, 0.8823529, 0, 1,
-0.9587529, 1.24494, -0.01829387, 1, 0.8862745, 0, 1,
-0.9584627, 0.1407641, -1.455791, 1, 0.8941177, 0, 1,
-0.949703, -0.7964076, -4.794625, 1, 0.8980392, 0, 1,
-0.949525, -0.8322342, -3.787262, 1, 0.9058824, 0, 1,
-0.9495125, -0.7723936, -2.490294, 1, 0.9137255, 0, 1,
-0.9421663, -0.9015666, -2.222185, 1, 0.9176471, 0, 1,
-0.9391558, -0.47843, -0.8905383, 1, 0.9254902, 0, 1,
-0.9390886, -0.9590642, -2.872381, 1, 0.9294118, 0, 1,
-0.9362611, -1.486112, -3.631324, 1, 0.9372549, 0, 1,
-0.9297498, -1.2037, -2.189313, 1, 0.9411765, 0, 1,
-0.9267563, 1.177204, -1.931928, 1, 0.9490196, 0, 1,
-0.9258749, -1.737997, -1.855059, 1, 0.9529412, 0, 1,
-0.9216537, 0.07583179, -0.2605632, 1, 0.9607843, 0, 1,
-0.9181693, -2.214558, -3.503554, 1, 0.9647059, 0, 1,
-0.9134856, 0.469778, 0.2085359, 1, 0.972549, 0, 1,
-0.9062012, 0.911611, -0.1244108, 1, 0.9764706, 0, 1,
-0.9058052, 2.057017, -1.343527, 1, 0.9843137, 0, 1,
-0.9042174, -1.025619, -2.282039, 1, 0.9882353, 0, 1,
-0.9015607, 1.795258, 1.035429, 1, 0.9960784, 0, 1,
-0.8897185, 0.8008543, 0.4083498, 0.9960784, 1, 0, 1,
-0.8886607, -0.5053974, -2.080363, 0.9921569, 1, 0, 1,
-0.8843758, -0.4664185, -2.387117, 0.9843137, 1, 0, 1,
-0.8841405, 1.859203, 0.7670676, 0.9803922, 1, 0, 1,
-0.8836244, -0.08917919, -2.258903, 0.972549, 1, 0, 1,
-0.8830541, 0.939818, -1.366158, 0.9686275, 1, 0, 1,
-0.8812768, 0.5317766, 1.450378, 0.9607843, 1, 0, 1,
-0.8803402, 0.7096066, -1.708212, 0.9568627, 1, 0, 1,
-0.8666401, -0.02481311, -2.032311, 0.9490196, 1, 0, 1,
-0.8628094, -0.976522, -2.171778, 0.945098, 1, 0, 1,
-0.8625365, 1.376454, -2.646624, 0.9372549, 1, 0, 1,
-0.8616678, -0.1097404, -2.376637, 0.9333333, 1, 0, 1,
-0.8581237, 1.172722, -2.33072, 0.9254902, 1, 0, 1,
-0.8545619, -0.2097742, -1.61208, 0.9215686, 1, 0, 1,
-0.853006, -0.3689029, -0.9530358, 0.9137255, 1, 0, 1,
-0.8489925, 1.708818, -1.342242, 0.9098039, 1, 0, 1,
-0.8483383, 0.1621113, -2.227646, 0.9019608, 1, 0, 1,
-0.8359393, -0.2424819, -2.717896, 0.8941177, 1, 0, 1,
-0.8338208, 0.1001811, -1.891457, 0.8901961, 1, 0, 1,
-0.8332274, 1.473062, -0.06484134, 0.8823529, 1, 0, 1,
-0.824748, -0.02910352, -1.614445, 0.8784314, 1, 0, 1,
-0.8234212, 1.297531, 0.1376951, 0.8705882, 1, 0, 1,
-0.8203313, -0.5249275, -1.858919, 0.8666667, 1, 0, 1,
-0.8201324, 2.331611, -0.2948293, 0.8588235, 1, 0, 1,
-0.8135225, 0.1024001, -2.001993, 0.854902, 1, 0, 1,
-0.81319, -2.218565, -1.280228, 0.8470588, 1, 0, 1,
-0.8097396, -0.4756103, -2.960041, 0.8431373, 1, 0, 1,
-0.802695, -0.6163862, -4.24984, 0.8352941, 1, 0, 1,
-0.801337, -0.5086367, -2.139233, 0.8313726, 1, 0, 1,
-0.801156, 0.7401491, -1.531739, 0.8235294, 1, 0, 1,
-0.7930443, 1.610745, -1.540857, 0.8196079, 1, 0, 1,
-0.7893956, -0.5957715, -2.431208, 0.8117647, 1, 0, 1,
-0.7860407, -0.07135037, -2.570796, 0.8078431, 1, 0, 1,
-0.7834114, -0.1362815, -1.494804, 0.8, 1, 0, 1,
-0.7831825, -1.721874, -3.03766, 0.7921569, 1, 0, 1,
-0.779115, 2.0418, -0.2905912, 0.7882353, 1, 0, 1,
-0.778412, -1.353556, -3.176157, 0.7803922, 1, 0, 1,
-0.7773508, 1.603827, 0.4796053, 0.7764706, 1, 0, 1,
-0.77654, -0.9860338, -2.032823, 0.7686275, 1, 0, 1,
-0.7758586, 0.1521937, -2.085861, 0.7647059, 1, 0, 1,
-0.7754406, 0.2162742, -0.3405824, 0.7568628, 1, 0, 1,
-0.7726683, 0.709682, 0.5954619, 0.7529412, 1, 0, 1,
-0.7722796, -0.4097086, -2.893421, 0.7450981, 1, 0, 1,
-0.769688, 0.3137837, -0.3249628, 0.7411765, 1, 0, 1,
-0.7444896, -0.1323228, -0.6373895, 0.7333333, 1, 0, 1,
-0.7426894, 0.3419897, -1.241996, 0.7294118, 1, 0, 1,
-0.7422302, -1.055028, -1.35537, 0.7215686, 1, 0, 1,
-0.7389225, -0.7276568, -2.608639, 0.7176471, 1, 0, 1,
-0.7374465, -0.9050963, -1.729807, 0.7098039, 1, 0, 1,
-0.7365118, -1.467031, -2.10785, 0.7058824, 1, 0, 1,
-0.7364518, 2.067463, -0.7215966, 0.6980392, 1, 0, 1,
-0.7330357, 0.7005551, -0.3826464, 0.6901961, 1, 0, 1,
-0.7314138, -1.159572, -1.794056, 0.6862745, 1, 0, 1,
-0.7266646, -0.2068342, -2.0048, 0.6784314, 1, 0, 1,
-0.7173761, -1.381973, -3.623002, 0.6745098, 1, 0, 1,
-0.7133163, -0.9870753, -2.145182, 0.6666667, 1, 0, 1,
-0.7100317, 1.190988, 1.176024, 0.6627451, 1, 0, 1,
-0.6999415, -0.396037, 0.01636104, 0.654902, 1, 0, 1,
-0.6993992, 1.316696, -0.02142984, 0.6509804, 1, 0, 1,
-0.6990913, 1.546806, -0.798803, 0.6431373, 1, 0, 1,
-0.6955869, 0.1654986, -1.522972, 0.6392157, 1, 0, 1,
-0.6926455, -0.5552297, -3.842489, 0.6313726, 1, 0, 1,
-0.6919543, -0.470387, -2.54146, 0.627451, 1, 0, 1,
-0.6883629, 0.1994255, 0.02785783, 0.6196079, 1, 0, 1,
-0.6859362, 1.859864, -0.6078472, 0.6156863, 1, 0, 1,
-0.6852394, 1.596084, -0.5666814, 0.6078432, 1, 0, 1,
-0.6826945, 0.04366092, -1.783669, 0.6039216, 1, 0, 1,
-0.6767519, 1.429739, -0.3284593, 0.5960785, 1, 0, 1,
-0.6747909, 0.06781332, -2.041086, 0.5882353, 1, 0, 1,
-0.667536, -0.4611259, -3.309318, 0.5843138, 1, 0, 1,
-0.6650493, 0.6157307, 1.153078, 0.5764706, 1, 0, 1,
-0.6580522, 1.42752, 0.4210037, 0.572549, 1, 0, 1,
-0.6546254, -0.07002391, -2.130129, 0.5647059, 1, 0, 1,
-0.6538855, -1.711979, -2.207247, 0.5607843, 1, 0, 1,
-0.6523648, -0.05410732, -0.5627515, 0.5529412, 1, 0, 1,
-0.6473958, -0.4330862, -1.809858, 0.5490196, 1, 0, 1,
-0.6330647, 0.5905292, -0.9413203, 0.5411765, 1, 0, 1,
-0.6330121, 1.812144, -2.529223, 0.5372549, 1, 0, 1,
-0.6278592, 0.1893326, 0.2797349, 0.5294118, 1, 0, 1,
-0.6277669, 0.8806317, -0.2056009, 0.5254902, 1, 0, 1,
-0.6236619, 0.8403919, -1.268025, 0.5176471, 1, 0, 1,
-0.6217601, 0.2122561, -1.594695, 0.5137255, 1, 0, 1,
-0.6143791, -0.9522955, -4.354144, 0.5058824, 1, 0, 1,
-0.603923, 0.560101, -0.7668531, 0.5019608, 1, 0, 1,
-0.601231, 1.253835, 0.1720369, 0.4941176, 1, 0, 1,
-0.600585, 0.2415772, -1.078351, 0.4862745, 1, 0, 1,
-0.5998589, 0.1323028, -0.08171347, 0.4823529, 1, 0, 1,
-0.5996993, 0.7690542, -0.06995269, 0.4745098, 1, 0, 1,
-0.598103, -0.4971023, -2.330474, 0.4705882, 1, 0, 1,
-0.5964721, 1.764735, -1.304851, 0.4627451, 1, 0, 1,
-0.5916281, -1.429177, -1.419628, 0.4588235, 1, 0, 1,
-0.5876641, 0.5115754, -0.52605, 0.4509804, 1, 0, 1,
-0.5855259, 0.219774, -1.234031, 0.4470588, 1, 0, 1,
-0.5827436, 0.4465132, -1.935163, 0.4392157, 1, 0, 1,
-0.5817958, -0.2010147, -2.058386, 0.4352941, 1, 0, 1,
-0.5812312, -0.2666609, -1.892927, 0.427451, 1, 0, 1,
-0.5741922, -0.3615241, -1.193316, 0.4235294, 1, 0, 1,
-0.5741443, -1.488881, -3.538558, 0.4156863, 1, 0, 1,
-0.5710959, -1.163562, -0.6122735, 0.4117647, 1, 0, 1,
-0.569379, -2.272303, -3.005444, 0.4039216, 1, 0, 1,
-0.5651166, 2.284079, -1.784967, 0.3960784, 1, 0, 1,
-0.5564588, 1.372685, -1.190574, 0.3921569, 1, 0, 1,
-0.5563408, 0.7516931, -1.164518, 0.3843137, 1, 0, 1,
-0.5505394, -0.5748452, -4.279128, 0.3803922, 1, 0, 1,
-0.5492027, -0.2938063, -3.367661, 0.372549, 1, 0, 1,
-0.5461358, -0.1986533, -3.32998, 0.3686275, 1, 0, 1,
-0.5455511, -1.440433, -1.706533, 0.3607843, 1, 0, 1,
-0.5444037, 0.4678257, 0.1764397, 0.3568628, 1, 0, 1,
-0.5436468, 0.4999718, -0.6764588, 0.3490196, 1, 0, 1,
-0.5428935, 0.2360208, -1.276536, 0.345098, 1, 0, 1,
-0.538744, 1.101128, 1.561443, 0.3372549, 1, 0, 1,
-0.5340829, -0.3684665, -2.626662, 0.3333333, 1, 0, 1,
-0.5267344, 0.294282, -1.762475, 0.3254902, 1, 0, 1,
-0.5224969, -0.7499273, -1.466286, 0.3215686, 1, 0, 1,
-0.5214527, 0.8251098, -1.794386, 0.3137255, 1, 0, 1,
-0.520555, 1.037799, -0.5509174, 0.3098039, 1, 0, 1,
-0.5158778, 2.015928, -0.9171778, 0.3019608, 1, 0, 1,
-0.515415, 0.03147301, -1.776454, 0.2941177, 1, 0, 1,
-0.5121563, 0.1668492, -0.7740669, 0.2901961, 1, 0, 1,
-0.5111536, -1.354808, -3.130431, 0.282353, 1, 0, 1,
-0.5031285, 1.305774, -0.9023273, 0.2784314, 1, 0, 1,
-0.5012639, -0.9444161, -0.523581, 0.2705882, 1, 0, 1,
-0.4998384, 1.319191, 0.01804096, 0.2666667, 1, 0, 1,
-0.4914887, 0.1443952, -1.864211, 0.2588235, 1, 0, 1,
-0.4860192, -1.000917, -1.975359, 0.254902, 1, 0, 1,
-0.4737036, 0.8926531, -0.8343819, 0.2470588, 1, 0, 1,
-0.4670005, 0.1302311, -0.3007002, 0.2431373, 1, 0, 1,
-0.4632888, -0.1961173, -2.189468, 0.2352941, 1, 0, 1,
-0.4560887, -2.087965, -2.730961, 0.2313726, 1, 0, 1,
-0.4494241, -0.1681793, -2.277947, 0.2235294, 1, 0, 1,
-0.4471768, 0.429161, 0.5542, 0.2196078, 1, 0, 1,
-0.4444406, -0.1219027, -2.577353, 0.2117647, 1, 0, 1,
-0.440922, 1.420168, 1.248736, 0.2078431, 1, 0, 1,
-0.4380907, -2.104269, -3.962357, 0.2, 1, 0, 1,
-0.4380637, -0.4522254, -2.011074, 0.1921569, 1, 0, 1,
-0.4335942, -0.9029193, -3.159373, 0.1882353, 1, 0, 1,
-0.4309655, 1.377008, 0.8052143, 0.1803922, 1, 0, 1,
-0.430743, 0.9360367, -0.1462907, 0.1764706, 1, 0, 1,
-0.4269649, 0.5436218, -0.3840061, 0.1686275, 1, 0, 1,
-0.426311, 0.65929, 0.7242069, 0.1647059, 1, 0, 1,
-0.4197806, -0.8873944, -3.035825, 0.1568628, 1, 0, 1,
-0.4191497, 1.547084, -2.237194, 0.1529412, 1, 0, 1,
-0.4184005, 0.2258642, -1.590416, 0.145098, 1, 0, 1,
-0.4175647, -0.3983326, -3.045308, 0.1411765, 1, 0, 1,
-0.4171646, -0.1367555, -2.020989, 0.1333333, 1, 0, 1,
-0.4147869, 0.5629321, -0.8363185, 0.1294118, 1, 0, 1,
-0.4131921, -0.05884223, -1.1082, 0.1215686, 1, 0, 1,
-0.4110008, 1.021286, 0.3339017, 0.1176471, 1, 0, 1,
-0.4090579, -0.4606341, -2.724681, 0.1098039, 1, 0, 1,
-0.4075747, -0.4458668, -1.367334, 0.1058824, 1, 0, 1,
-0.4037784, -0.2834973, -4.099885, 0.09803922, 1, 0, 1,
-0.4035286, -1.818523, -1.367751, 0.09019608, 1, 0, 1,
-0.4017553, -0.01026908, 0.2677874, 0.08627451, 1, 0, 1,
-0.395517, 0.4335872, 0.3987817, 0.07843138, 1, 0, 1,
-0.3949068, -0.5271068, -2.399521, 0.07450981, 1, 0, 1,
-0.3905133, -1.786541, -3.708641, 0.06666667, 1, 0, 1,
-0.3858692, -0.6432058, -2.0328, 0.0627451, 1, 0, 1,
-0.3851465, 4.311839, 1.279775, 0.05490196, 1, 0, 1,
-0.3849322, -1.815895, -3.597296, 0.05098039, 1, 0, 1,
-0.3847057, -0.6994491, -2.440751, 0.04313726, 1, 0, 1,
-0.3830226, 1.707609, -1.623593, 0.03921569, 1, 0, 1,
-0.382155, 1.239391, -0.269875, 0.03137255, 1, 0, 1,
-0.379109, 0.9353891, -0.257611, 0.02745098, 1, 0, 1,
-0.3785916, 1.407693, -1.58519, 0.01960784, 1, 0, 1,
-0.3680808, 1.016178, -1.693015, 0.01568628, 1, 0, 1,
-0.3678932, 0.6651222, -1.327644, 0.007843138, 1, 0, 1,
-0.3672616, 0.06203451, -2.875316, 0.003921569, 1, 0, 1,
-0.3660795, -0.3552805, -1.060305, 0, 1, 0.003921569, 1,
-0.3584826, 0.2703702, 1.403375, 0, 1, 0.01176471, 1,
-0.3566419, -1.16727, -3.051733, 0, 1, 0.01568628, 1,
-0.3565252, 0.349248, -1.205225, 0, 1, 0.02352941, 1,
-0.3548984, -0.174703, -3.778131, 0, 1, 0.02745098, 1,
-0.3533596, 0.1656601, 0.827181, 0, 1, 0.03529412, 1,
-0.3511563, -0.5603216, -2.629658, 0, 1, 0.03921569, 1,
-0.3503823, 0.3455463, -0.3402343, 0, 1, 0.04705882, 1,
-0.3414346, 0.6561195, -2.065333, 0, 1, 0.05098039, 1,
-0.3372039, -1.873243, -1.613457, 0, 1, 0.05882353, 1,
-0.3358801, -0.03363591, -2.678314, 0, 1, 0.0627451, 1,
-0.3296502, 1.488018, -0.6078501, 0, 1, 0.07058824, 1,
-0.3284883, 0.9815761, -1.233001, 0, 1, 0.07450981, 1,
-0.3250928, -0.002402482, -1.400653, 0, 1, 0.08235294, 1,
-0.32476, 0.02685325, -2.002551, 0, 1, 0.08627451, 1,
-0.321099, -1.755351, -3.502414, 0, 1, 0.09411765, 1,
-0.3193175, -0.3959341, -2.102503, 0, 1, 0.1019608, 1,
-0.3173101, -1.483929, -2.103928, 0, 1, 0.1058824, 1,
-0.317191, 0.07831313, -1.574988, 0, 1, 0.1137255, 1,
-0.3167192, 0.8128414, -0.5818918, 0, 1, 0.1176471, 1,
-0.31657, 2.009733, -1.436944, 0, 1, 0.1254902, 1,
-0.3152814, 0.8093655, -1.899076, 0, 1, 0.1294118, 1,
-0.3152447, -1.731545, -1.103778, 0, 1, 0.1372549, 1,
-0.3152258, 1.26292, -1.688995, 0, 1, 0.1411765, 1,
-0.3116275, 0.110703, -2.513067, 0, 1, 0.1490196, 1,
-0.3103825, -0.04291402, -2.04672, 0, 1, 0.1529412, 1,
-0.3102652, -0.02176719, -1.450015, 0, 1, 0.1607843, 1,
-0.3083518, -1.511301, -3.52122, 0, 1, 0.1647059, 1,
-0.3073631, 1.454761, 0.0561077, 0, 1, 0.172549, 1,
-0.3046218, 1.502243, -0.3026225, 0, 1, 0.1764706, 1,
-0.3008974, 0.1545176, -0.7615331, 0, 1, 0.1843137, 1,
-0.2960052, 0.812961, -0.4518358, 0, 1, 0.1882353, 1,
-0.2951908, 0.8184874, 0.4150874, 0, 1, 0.1960784, 1,
-0.2913814, 0.9861348, 0.1667984, 0, 1, 0.2039216, 1,
-0.2911383, -0.4297391, -4.895016, 0, 1, 0.2078431, 1,
-0.2892939, -0.7837481, -3.922363, 0, 1, 0.2156863, 1,
-0.2889984, 1.358842, -0.4105298, 0, 1, 0.2196078, 1,
-0.2804286, 0.1984878, 0.3009078, 0, 1, 0.227451, 1,
-0.280134, 0.8074073, 1.045078, 0, 1, 0.2313726, 1,
-0.2757252, 0.5765817, -0.4177825, 0, 1, 0.2392157, 1,
-0.2740441, 1.681198, -0.4209523, 0, 1, 0.2431373, 1,
-0.2731644, -0.3687201, -3.109679, 0, 1, 0.2509804, 1,
-0.2719241, 1.103865, 0.3431461, 0, 1, 0.254902, 1,
-0.2710461, 0.3438898, 0.2784318, 0, 1, 0.2627451, 1,
-0.2696814, -0.5164495, -2.215215, 0, 1, 0.2666667, 1,
-0.2670656, 0.2317049, 0.03079903, 0, 1, 0.2745098, 1,
-0.2650273, 1.822722, 0.5648797, 0, 1, 0.2784314, 1,
-0.2618698, 0.39004, -0.6463893, 0, 1, 0.2862745, 1,
-0.2533555, -2.796737, -3.02926, 0, 1, 0.2901961, 1,
-0.2520714, -0.936569, -1.651133, 0, 1, 0.2980392, 1,
-0.2487559, 1.716757, -0.7349278, 0, 1, 0.3058824, 1,
-0.2478489, -0.7125114, -2.967377, 0, 1, 0.3098039, 1,
-0.2478107, 0.2302696, -1.794284, 0, 1, 0.3176471, 1,
-0.2452433, -1.054668, -3.556471, 0, 1, 0.3215686, 1,
-0.2446239, 1.538022, 0.2112196, 0, 1, 0.3294118, 1,
-0.23821, 1.825525, -0.2609243, 0, 1, 0.3333333, 1,
-0.2339795, -0.5608945, -2.740876, 0, 1, 0.3411765, 1,
-0.2328453, -1.231092, -4.164547, 0, 1, 0.345098, 1,
-0.2323291, 1.193413, -0.3354673, 0, 1, 0.3529412, 1,
-0.2311115, 2.107847, 1.703813, 0, 1, 0.3568628, 1,
-0.2255101, -0.8459326, -2.77708, 0, 1, 0.3647059, 1,
-0.2249998, -1.182113, -2.695405, 0, 1, 0.3686275, 1,
-0.2216176, 1.486735, 1.369415, 0, 1, 0.3764706, 1,
-0.2194556, -1.654978, -2.203601, 0, 1, 0.3803922, 1,
-0.2162583, 0.5099432, -1.140014, 0, 1, 0.3882353, 1,
-0.2160389, 0.3739215, 0.2195948, 0, 1, 0.3921569, 1,
-0.2147981, -0.3177581, -2.100091, 0, 1, 0.4, 1,
-0.2135043, 0.029766, -0.9062556, 0, 1, 0.4078431, 1,
-0.2117964, 0.3608256, 1.160443, 0, 1, 0.4117647, 1,
-0.2109182, 0.9892076, -0.3715966, 0, 1, 0.4196078, 1,
-0.2055999, -1.249557, -3.272913, 0, 1, 0.4235294, 1,
-0.2032777, -1.569898, -2.5851, 0, 1, 0.4313726, 1,
-0.2027782, -1.76179, -3.587891, 0, 1, 0.4352941, 1,
-0.202114, -0.912245, -4.885964, 0, 1, 0.4431373, 1,
-0.2015256, -0.8403893, -0.2645785, 0, 1, 0.4470588, 1,
-0.1991427, -0.2742441, -2.748902, 0, 1, 0.454902, 1,
-0.1970991, 0.3881765, -2.23356, 0, 1, 0.4588235, 1,
-0.1956784, 1.209946, 0.6186439, 0, 1, 0.4666667, 1,
-0.1907727, -0.8656491, -3.994037, 0, 1, 0.4705882, 1,
-0.1904603, -1.288609, -3.697834, 0, 1, 0.4784314, 1,
-0.1903271, -1.135359, -2.989903, 0, 1, 0.4823529, 1,
-0.1896114, -0.48617, -2.911496, 0, 1, 0.4901961, 1,
-0.1868697, 2.038697, 0.009347859, 0, 1, 0.4941176, 1,
-0.1838131, 0.7742596, 0.4547683, 0, 1, 0.5019608, 1,
-0.1836799, -0.3010495, -2.222037, 0, 1, 0.509804, 1,
-0.1792915, -1.042266, -3.170316, 0, 1, 0.5137255, 1,
-0.1770366, 0.4682722, -1.543256, 0, 1, 0.5215687, 1,
-0.1765267, -1.107411, -3.833862, 0, 1, 0.5254902, 1,
-0.1752153, 0.05794647, -1.147201, 0, 1, 0.5333334, 1,
-0.1745723, -1.365507, -4.226621, 0, 1, 0.5372549, 1,
-0.1742038, -0.5338782, -4.748547, 0, 1, 0.5450981, 1,
-0.1730728, -0.7999008, -2.332426, 0, 1, 0.5490196, 1,
-0.1695886, -0.1557748, -4.126893, 0, 1, 0.5568628, 1,
-0.1691944, -1.062466, -3.352396, 0, 1, 0.5607843, 1,
-0.1683842, 1.25207, 0.8186933, 0, 1, 0.5686275, 1,
-0.1682935, -0.8400322, -3.072888, 0, 1, 0.572549, 1,
-0.1674084, -1.813018, -2.73032, 0, 1, 0.5803922, 1,
-0.1662363, -0.7551603, -4.542574, 0, 1, 0.5843138, 1,
-0.1657566, 0.5368978, -0.8546761, 0, 1, 0.5921569, 1,
-0.1649854, 1.332896, -0.6706752, 0, 1, 0.5960785, 1,
-0.1606324, 1.728194, 1.60361, 0, 1, 0.6039216, 1,
-0.1589483, 0.8614627, -1.549509, 0, 1, 0.6117647, 1,
-0.157425, -0.4741908, -2.409806, 0, 1, 0.6156863, 1,
-0.1573604, -1.09096, -2.983094, 0, 1, 0.6235294, 1,
-0.1553945, -1.694466, -2.503823, 0, 1, 0.627451, 1,
-0.1544883, -0.4145363, -3.028267, 0, 1, 0.6352941, 1,
-0.1509118, 0.3542614, 0.1911419, 0, 1, 0.6392157, 1,
-0.1492936, -0.3577617, -3.752611, 0, 1, 0.6470588, 1,
-0.142674, 0.3985278, 0.7964239, 0, 1, 0.6509804, 1,
-0.1408003, -1.490042, -2.386023, 0, 1, 0.6588235, 1,
-0.1369762, 0.3609517, -2.034518, 0, 1, 0.6627451, 1,
-0.1302387, -0.4112796, -3.599046, 0, 1, 0.6705883, 1,
-0.1291484, -0.5913737, -2.858715, 0, 1, 0.6745098, 1,
-0.1282367, -1.507592, -3.797027, 0, 1, 0.682353, 1,
-0.1220732, 0.07456063, -0.324137, 0, 1, 0.6862745, 1,
-0.1219568, 0.4906168, -0.8134754, 0, 1, 0.6941177, 1,
-0.119536, -1.430648, -3.543638, 0, 1, 0.7019608, 1,
-0.1191652, -0.5274357, -2.866722, 0, 1, 0.7058824, 1,
-0.1158779, 1.310186, -0.1635158, 0, 1, 0.7137255, 1,
-0.1134531, 2.232817, 1.53028, 0, 1, 0.7176471, 1,
-0.1047944, 0.2861543, 0.5006977, 0, 1, 0.7254902, 1,
-0.09911026, -1.062853, -3.440777, 0, 1, 0.7294118, 1,
-0.09555083, -0.8426031, -4.778973, 0, 1, 0.7372549, 1,
-0.09330241, 1.138843, -1.376852, 0, 1, 0.7411765, 1,
-0.09306122, -1.382817, -3.15519, 0, 1, 0.7490196, 1,
-0.09246721, 0.007971128, -2.363654, 0, 1, 0.7529412, 1,
-0.09041089, -1.038676, -2.54336, 0, 1, 0.7607843, 1,
-0.08851097, 0.440174, -2.074828, 0, 1, 0.7647059, 1,
-0.08568199, -0.03367585, 0.06460173, 0, 1, 0.772549, 1,
-0.08269284, 0.08177405, 0.3398669, 0, 1, 0.7764706, 1,
-0.08158842, -0.4252664, -2.034254, 0, 1, 0.7843137, 1,
-0.07685215, 1.098999, 0.3331233, 0, 1, 0.7882353, 1,
-0.07209706, 1.94513, 1.121597, 0, 1, 0.7960784, 1,
-0.06983989, 0.7123363, -0.5988217, 0, 1, 0.8039216, 1,
-0.06869041, -0.1261753, -2.702098, 0, 1, 0.8078431, 1,
-0.0613209, 1.651541, -0.4547803, 0, 1, 0.8156863, 1,
-0.05775081, -1.780519, -4.050329, 0, 1, 0.8196079, 1,
-0.05513555, -0.06111725, -2.17758, 0, 1, 0.827451, 1,
-0.05140429, -0.3617486, -3.972414, 0, 1, 0.8313726, 1,
-0.04861792, 1.881259, 0.8909484, 0, 1, 0.8392157, 1,
-0.04103811, -0.5312479, -5.590733, 0, 1, 0.8431373, 1,
-0.03837069, -0.1109463, -4.243293, 0, 1, 0.8509804, 1,
-0.03512649, -0.2179929, -2.987984, 0, 1, 0.854902, 1,
-0.03292122, -0.3661392, -2.705009, 0, 1, 0.8627451, 1,
-0.03260807, -0.2406348, -2.628347, 0, 1, 0.8666667, 1,
-0.02767481, -1.590668, -4.334834, 0, 1, 0.8745098, 1,
-0.02764935, -0.1853957, -4.230539, 0, 1, 0.8784314, 1,
-0.02196625, 0.3508651, 0.02783274, 0, 1, 0.8862745, 1,
-0.02161214, 0.5987594, 0.7868443, 0, 1, 0.8901961, 1,
-0.02039663, -1.205069, -2.432039, 0, 1, 0.8980392, 1,
-0.01803802, 0.820971, -0.3388107, 0, 1, 0.9058824, 1,
-0.01696328, 2.937328, -1.197237, 0, 1, 0.9098039, 1,
-0.01627032, 0.1656412, -0.4964705, 0, 1, 0.9176471, 1,
-0.01149539, 2.03484, -0.5671755, 0, 1, 0.9215686, 1,
-0.01052354, 1.569034, -0.8916208, 0, 1, 0.9294118, 1,
-0.007484928, 0.1466844, -1.232197, 0, 1, 0.9333333, 1,
-0.005628195, -0.7331478, -3.706138, 0, 1, 0.9411765, 1,
0.000536494, -1.311294, 2.365237, 0, 1, 0.945098, 1,
0.00198563, 0.51078, 0.9417988, 0, 1, 0.9529412, 1,
0.002620989, -0.09727672, 5.196496, 0, 1, 0.9568627, 1,
0.002717831, 0.7160299, -0.1229469, 0, 1, 0.9647059, 1,
0.003807746, -0.4299775, 5.197425, 0, 1, 0.9686275, 1,
0.005465141, 1.212148, -1.282516, 0, 1, 0.9764706, 1,
0.005496275, 0.2561951, -0.3001108, 0, 1, 0.9803922, 1,
0.006163673, -0.4939238, 1.220888, 0, 1, 0.9882353, 1,
0.008438521, -0.4518035, 2.972093, 0, 1, 0.9921569, 1,
0.01044554, 0.4054793, -0.9215167, 0, 1, 1, 1,
0.01057653, 0.6584813, -0.8887517, 0, 0.9921569, 1, 1,
0.01073431, 0.6601708, 0.9839271, 0, 0.9882353, 1, 1,
0.01720784, 0.9838936, 1.641034, 0, 0.9803922, 1, 1,
0.01730364, -2.305684, 1.643165, 0, 0.9764706, 1, 1,
0.01849673, -0.8297558, 2.352976, 0, 0.9686275, 1, 1,
0.0189683, 0.8729663, 0.6127132, 0, 0.9647059, 1, 1,
0.02087997, -0.1101186, 2.738214, 0, 0.9568627, 1, 1,
0.02162242, -0.02962782, 3.491898, 0, 0.9529412, 1, 1,
0.03044888, 0.4744809, -0.1741869, 0, 0.945098, 1, 1,
0.03085965, 0.8987034, -0.747495, 0, 0.9411765, 1, 1,
0.03512375, -0.3715896, 3.686339, 0, 0.9333333, 1, 1,
0.0400675, -0.5056185, 3.005121, 0, 0.9294118, 1, 1,
0.04098227, 1.183856, 0.2299949, 0, 0.9215686, 1, 1,
0.04406495, 0.4072228, 0.6872177, 0, 0.9176471, 1, 1,
0.04839266, -0.3468188, 3.291504, 0, 0.9098039, 1, 1,
0.04970014, -0.0238962, 3.345519, 0, 0.9058824, 1, 1,
0.05183694, 0.8946246, -0.7138301, 0, 0.8980392, 1, 1,
0.05206037, -1.434921, 1.532765, 0, 0.8901961, 1, 1,
0.05962875, -0.9692751, 2.226842, 0, 0.8862745, 1, 1,
0.07183272, 0.8067083, 0.6850961, 0, 0.8784314, 1, 1,
0.07310668, -0.5422017, 2.198151, 0, 0.8745098, 1, 1,
0.07918321, 0.4933725, -1.069652, 0, 0.8666667, 1, 1,
0.08132186, 1.434919, 0.6275514, 0, 0.8627451, 1, 1,
0.08309036, 0.9276367, -0.5195717, 0, 0.854902, 1, 1,
0.08629557, -0.2381335, 1.234274, 0, 0.8509804, 1, 1,
0.09427814, -0.0511658, 2.661975, 0, 0.8431373, 1, 1,
0.09812763, -2.568038, 4.324215, 0, 0.8392157, 1, 1,
0.09957045, -0.5459359, 0.8123861, 0, 0.8313726, 1, 1,
0.1022783, 1.29144, 0.9581974, 0, 0.827451, 1, 1,
0.1023794, 1.027128, 0.5981165, 0, 0.8196079, 1, 1,
0.1025863, -0.1511745, 0.3238464, 0, 0.8156863, 1, 1,
0.1033823, 1.057218, -0.7947495, 0, 0.8078431, 1, 1,
0.1039913, 0.3504087, 0.8010934, 0, 0.8039216, 1, 1,
0.104825, -0.1880353, 1.660818, 0, 0.7960784, 1, 1,
0.1053745, -1.21938, 3.978316, 0, 0.7882353, 1, 1,
0.1095704, -1.421682, 2.668963, 0, 0.7843137, 1, 1,
0.1103728, 0.3150009, -0.6213991, 0, 0.7764706, 1, 1,
0.1111751, 1.739115, 0.7275636, 0, 0.772549, 1, 1,
0.1136589, -0.6657878, 2.160364, 0, 0.7647059, 1, 1,
0.113671, -1.636958, 3.445444, 0, 0.7607843, 1, 1,
0.1148613, -0.61408, 3.014339, 0, 0.7529412, 1, 1,
0.1182629, -1.597011, 3.065259, 0, 0.7490196, 1, 1,
0.1197369, -1.185045, 3.768349, 0, 0.7411765, 1, 1,
0.1200552, -1.097513, 4.14761, 0, 0.7372549, 1, 1,
0.1285634, -1.223734, 4.671259, 0, 0.7294118, 1, 1,
0.1287667, -0.4086491, 1.531814, 0, 0.7254902, 1, 1,
0.1315459, -0.04428856, 1.124896, 0, 0.7176471, 1, 1,
0.1326077, 0.7863587, -0.2772595, 0, 0.7137255, 1, 1,
0.1381194, 1.442102, 2.03202, 0, 0.7058824, 1, 1,
0.1387347, 0.03101225, 2.060605, 0, 0.6980392, 1, 1,
0.1505843, 0.6773041, -1.694265, 0, 0.6941177, 1, 1,
0.1550261, -0.5167573, 2.349721, 0, 0.6862745, 1, 1,
0.1556928, 0.294538, 0.7228364, 0, 0.682353, 1, 1,
0.1654882, 0.8734888, 0.04838156, 0, 0.6745098, 1, 1,
0.1664089, -1.468465, 2.4788, 0, 0.6705883, 1, 1,
0.1683458, -0.6483659, 2.577172, 0, 0.6627451, 1, 1,
0.1719711, 2.463072, 1.502628, 0, 0.6588235, 1, 1,
0.1737129, -0.8070203, 2.972505, 0, 0.6509804, 1, 1,
0.174016, -0.7851024, 3.880977, 0, 0.6470588, 1, 1,
0.1749097, 0.4331622, 0.1942295, 0, 0.6392157, 1, 1,
0.1751912, 0.3492444, -0.368714, 0, 0.6352941, 1, 1,
0.1773929, -1.650381, 2.176779, 0, 0.627451, 1, 1,
0.1793236, 0.6902039, 0.2549232, 0, 0.6235294, 1, 1,
0.1796052, -0.2811297, 1.929528, 0, 0.6156863, 1, 1,
0.1807681, 0.1512466, -0.2793174, 0, 0.6117647, 1, 1,
0.1826548, -0.4950224, 3.668062, 0, 0.6039216, 1, 1,
0.1827067, -0.6676077, 3.196314, 0, 0.5960785, 1, 1,
0.1849703, -0.0656605, 3.108904, 0, 0.5921569, 1, 1,
0.1927331, 1.901601, -0.04178809, 0, 0.5843138, 1, 1,
0.1940853, 0.5777547, 1.065491, 0, 0.5803922, 1, 1,
0.1943619, 0.4662338, -2.166912, 0, 0.572549, 1, 1,
0.1951797, -0.1723429, 2.898553, 0, 0.5686275, 1, 1,
0.1981968, 1.03614, 0.9110816, 0, 0.5607843, 1, 1,
0.2014707, -0.4338529, 3.251959, 0, 0.5568628, 1, 1,
0.2051824, 0.6626923, 0.7851725, 0, 0.5490196, 1, 1,
0.2054168, 0.5953804, 0.5396118, 0, 0.5450981, 1, 1,
0.2084178, 1.738015, 1.019411, 0, 0.5372549, 1, 1,
0.2119157, 0.2267693, -0.02942023, 0, 0.5333334, 1, 1,
0.2144123, 0.9754375, 1.748096, 0, 0.5254902, 1, 1,
0.217336, 0.9978307, 0.986591, 0, 0.5215687, 1, 1,
0.2207471, 1.557405, -0.6487516, 0, 0.5137255, 1, 1,
0.2245865, 0.6972317, 0.5340527, 0, 0.509804, 1, 1,
0.2261962, 1.838209, 1.046929, 0, 0.5019608, 1, 1,
0.2273291, 0.392485, 1.855978, 0, 0.4941176, 1, 1,
0.2284447, 0.1055869, 0.773734, 0, 0.4901961, 1, 1,
0.2292161, 0.7138252, 1.759385, 0, 0.4823529, 1, 1,
0.2300387, 1.302488, 0.2528752, 0, 0.4784314, 1, 1,
0.2329046, -1.916388, 3.261614, 0, 0.4705882, 1, 1,
0.2368551, -0.5145385, 3.267196, 0, 0.4666667, 1, 1,
0.2372228, -0.6202786, 2.864583, 0, 0.4588235, 1, 1,
0.2404278, 1.173418, -0.9710724, 0, 0.454902, 1, 1,
0.242171, -0.3751103, 3.747344, 0, 0.4470588, 1, 1,
0.2450209, -0.3540067, 3.878023, 0, 0.4431373, 1, 1,
0.2456799, 0.3331932, -0.4658226, 0, 0.4352941, 1, 1,
0.245772, 0.2256989, -0.3731333, 0, 0.4313726, 1, 1,
0.2481733, 2.314075, 1.18193, 0, 0.4235294, 1, 1,
0.2498424, -0.69745, 1.601282, 0, 0.4196078, 1, 1,
0.2514043, -0.5553956, 2.0656, 0, 0.4117647, 1, 1,
0.2522268, -1.534227, 2.498273, 0, 0.4078431, 1, 1,
0.2558443, -0.5270557, 3.280895, 0, 0.4, 1, 1,
0.2609873, 0.3416992, 0.8444316, 0, 0.3921569, 1, 1,
0.2614518, -0.2206201, 2.586741, 0, 0.3882353, 1, 1,
0.2635555, -1.302476, 4.366574, 0, 0.3803922, 1, 1,
0.2670783, -1.020989, 2.742888, 0, 0.3764706, 1, 1,
0.2688629, -1.390725, 4.86253, 0, 0.3686275, 1, 1,
0.2745684, -0.7302342, 2.659065, 0, 0.3647059, 1, 1,
0.2817347, -1.798052, 3.87196, 0, 0.3568628, 1, 1,
0.2870165, 0.3482171, 0.8125651, 0, 0.3529412, 1, 1,
0.2877291, 0.9712421, 0.07252933, 0, 0.345098, 1, 1,
0.2915435, 0.7929144, -0.1057087, 0, 0.3411765, 1, 1,
0.2921122, -0.3293601, 2.796493, 0, 0.3333333, 1, 1,
0.2932883, 0.2175081, 0.9519093, 0, 0.3294118, 1, 1,
0.295144, 0.6229569, -1.164457, 0, 0.3215686, 1, 1,
0.2963047, -0.7754045, 0.9530198, 0, 0.3176471, 1, 1,
0.2963356, -0.007726677, 2.417091, 0, 0.3098039, 1, 1,
0.2968014, 1.465003, 0.05043714, 0, 0.3058824, 1, 1,
0.3039781, -0.2139674, 1.605301, 0, 0.2980392, 1, 1,
0.3044406, 0.3627136, 2.10708, 0, 0.2901961, 1, 1,
0.3052767, -1.332851, 4.19429, 0, 0.2862745, 1, 1,
0.3076093, -0.02440723, 0.5891224, 0, 0.2784314, 1, 1,
0.3083926, -0.4770817, 3.11046, 0, 0.2745098, 1, 1,
0.3090583, 0.5093278, -0.513611, 0, 0.2666667, 1, 1,
0.312914, 0.8105162, 0.6279292, 0, 0.2627451, 1, 1,
0.312923, -0.1113568, 3.872069, 0, 0.254902, 1, 1,
0.3138754, 0.09920535, 1.352809, 0, 0.2509804, 1, 1,
0.3190692, 0.7229626, -1.641229, 0, 0.2431373, 1, 1,
0.3225446, -0.6142707, 2.663119, 0, 0.2392157, 1, 1,
0.3239353, 1.167484, 0.6533769, 0, 0.2313726, 1, 1,
0.3251049, -0.6397491, 2.438348, 0, 0.227451, 1, 1,
0.3266786, -1.670318, 2.500026, 0, 0.2196078, 1, 1,
0.3275234, 0.07995606, 1.210413, 0, 0.2156863, 1, 1,
0.3289671, 0.5661516, 1.10116, 0, 0.2078431, 1, 1,
0.3304496, 0.4065731, 1.239507, 0, 0.2039216, 1, 1,
0.3365774, -0.2025202, -0.1019909, 0, 0.1960784, 1, 1,
0.336601, -0.9502953, 1.466563, 0, 0.1882353, 1, 1,
0.3410265, 1.888637, 1.281111, 0, 0.1843137, 1, 1,
0.3442616, -0.4556912, 1.212845, 0, 0.1764706, 1, 1,
0.3486416, 0.9844954, -1.085141, 0, 0.172549, 1, 1,
0.3514943, -0.8968015, 2.849523, 0, 0.1647059, 1, 1,
0.3551888, -0.6469533, 3.494527, 0, 0.1607843, 1, 1,
0.3581991, -1.759434, 1.615027, 0, 0.1529412, 1, 1,
0.3594298, 0.9277711, 0.7852868, 0, 0.1490196, 1, 1,
0.3597929, -0.3006672, 3.501006, 0, 0.1411765, 1, 1,
0.3611607, -1.061801, 3.575105, 0, 0.1372549, 1, 1,
0.3673854, -0.8711889, 3.485436, 0, 0.1294118, 1, 1,
0.3827554, -1.121417, 1.799854, 0, 0.1254902, 1, 1,
0.3846003, 0.6727768, 1.252392, 0, 0.1176471, 1, 1,
0.3854276, 0.6572542, 0.6260163, 0, 0.1137255, 1, 1,
0.3949225, 0.6448829, 1.231327, 0, 0.1058824, 1, 1,
0.3984733, -2.037727, 1.926615, 0, 0.09803922, 1, 1,
0.400262, 1.053124, -0.411323, 0, 0.09411765, 1, 1,
0.4014184, 0.3611828, -0.6932704, 0, 0.08627451, 1, 1,
0.4062226, 0.204602, 1.719987, 0, 0.08235294, 1, 1,
0.4072342, -0.3021481, 1.049873, 0, 0.07450981, 1, 1,
0.4099325, -0.1518922, 3.149475, 0, 0.07058824, 1, 1,
0.4112768, -1.295517, 2.71144, 0, 0.0627451, 1, 1,
0.4182484, -0.8721854, 2.298201, 0, 0.05882353, 1, 1,
0.4218648, -0.4989095, 2.180346, 0, 0.05098039, 1, 1,
0.4270836, -0.4024942, 1.166669, 0, 0.04705882, 1, 1,
0.4339662, -0.5005536, 4.307173, 0, 0.03921569, 1, 1,
0.4366032, 0.5353613, -0.1956008, 0, 0.03529412, 1, 1,
0.4373931, -1.091594, 1.943486, 0, 0.02745098, 1, 1,
0.4382922, -0.124964, 2.215199, 0, 0.02352941, 1, 1,
0.4395163, 0.4856981, 2.214663, 0, 0.01568628, 1, 1,
0.4426652, -0.4542111, 3.518763, 0, 0.01176471, 1, 1,
0.4452392, 0.3184263, 0.649385, 0, 0.003921569, 1, 1,
0.4463709, -0.3738064, 2.276973, 0.003921569, 0, 1, 1,
0.450744, 1.715314, 0.6135936, 0.007843138, 0, 1, 1,
0.4534303, 1.457334, -0.515174, 0.01568628, 0, 1, 1,
0.4606227, 0.9879754, 0.1209058, 0.01960784, 0, 1, 1,
0.4636486, 2.419751, 0.957523, 0.02745098, 0, 1, 1,
0.4655763, 1.89643, 1.024068, 0.03137255, 0, 1, 1,
0.4689958, -1.114972, 2.077782, 0.03921569, 0, 1, 1,
0.4731253, -2.014676, 0.1370586, 0.04313726, 0, 1, 1,
0.4768303, 1.390214, 0.2113386, 0.05098039, 0, 1, 1,
0.4769354, 0.8169028, -0.7314957, 0.05490196, 0, 1, 1,
0.483084, -1.984372, 3.404937, 0.0627451, 0, 1, 1,
0.483156, -0.5914161, 3.183435, 0.06666667, 0, 1, 1,
0.484063, 0.145339, 0.6306334, 0.07450981, 0, 1, 1,
0.4853054, 2.196696, 0.6938959, 0.07843138, 0, 1, 1,
0.4861308, -1.135106, 1.240932, 0.08627451, 0, 1, 1,
0.4876215, -2.11279, 2.845551, 0.09019608, 0, 1, 1,
0.4877791, -0.8485982, 3.363776, 0.09803922, 0, 1, 1,
0.4912929, 1.339035, -1.021552, 0.1058824, 0, 1, 1,
0.4912989, 0.4351557, 0.009935363, 0.1098039, 0, 1, 1,
0.4960261, 0.1035252, 1.82068, 0.1176471, 0, 1, 1,
0.4966106, 0.4838334, 1.611356, 0.1215686, 0, 1, 1,
0.5005919, 1.345302, -0.7666546, 0.1294118, 0, 1, 1,
0.5054227, -1.513026, 1.853927, 0.1333333, 0, 1, 1,
0.5078288, -0.635983, 2.478742, 0.1411765, 0, 1, 1,
0.509129, -0.8683331, 2.246381, 0.145098, 0, 1, 1,
0.5127513, -0.3140305, 1.741411, 0.1529412, 0, 1, 1,
0.5151399, 0.1962751, 0.6607051, 0.1568628, 0, 1, 1,
0.516265, -0.8971149, 1.483276, 0.1647059, 0, 1, 1,
0.5170368, -1.383558, 1.75411, 0.1686275, 0, 1, 1,
0.522136, -0.3689329, 2.256814, 0.1764706, 0, 1, 1,
0.5228733, 2.172081, 1.642693, 0.1803922, 0, 1, 1,
0.5309452, 0.989786, 0.3754421, 0.1882353, 0, 1, 1,
0.53544, 1.204534, 1.175678, 0.1921569, 0, 1, 1,
0.5382524, -0.009542561, 0.8499665, 0.2, 0, 1, 1,
0.5406384, 0.6159635, 1.12539, 0.2078431, 0, 1, 1,
0.5422784, 0.6012615, 0.9874243, 0.2117647, 0, 1, 1,
0.5496262, 0.02307875, 2.66285, 0.2196078, 0, 1, 1,
0.5496695, -1.069707, 2.959146, 0.2235294, 0, 1, 1,
0.5514727, -0.1553257, 1.834603, 0.2313726, 0, 1, 1,
0.5539573, -1.550727, 2.666945, 0.2352941, 0, 1, 1,
0.5557224, -0.07182024, 0.1703564, 0.2431373, 0, 1, 1,
0.5585074, -0.6770957, 0.8722451, 0.2470588, 0, 1, 1,
0.5595931, 0.7409874, 1.490629, 0.254902, 0, 1, 1,
0.5628529, -0.4446483, 2.579846, 0.2588235, 0, 1, 1,
0.5631607, -0.9230161, 3.863541, 0.2666667, 0, 1, 1,
0.5643315, -0.7729757, 2.768802, 0.2705882, 0, 1, 1,
0.5666893, 1.69697, 1.343806, 0.2784314, 0, 1, 1,
0.5673974, 1.520883, 0.8049207, 0.282353, 0, 1, 1,
0.5772131, 0.439536, 0.1124299, 0.2901961, 0, 1, 1,
0.5788545, 0.3980792, 1.466764, 0.2941177, 0, 1, 1,
0.5800042, 0.9062327, 0.4168345, 0.3019608, 0, 1, 1,
0.5839835, -0.3629836, 2.917004, 0.3098039, 0, 1, 1,
0.5949336, 0.4969123, 0.531231, 0.3137255, 0, 1, 1,
0.5958207, -1.57279, 1.028596, 0.3215686, 0, 1, 1,
0.5964618, -1.199827, 1.789668, 0.3254902, 0, 1, 1,
0.5975561, -2.114408, 2.60307, 0.3333333, 0, 1, 1,
0.6068248, 1.110754, 0.9788691, 0.3372549, 0, 1, 1,
0.619792, 0.8838612, -0.2691973, 0.345098, 0, 1, 1,
0.6219376, 1.282741, 1.400822, 0.3490196, 0, 1, 1,
0.6280356, -1.11656, 3.134183, 0.3568628, 0, 1, 1,
0.635813, 0.08761764, 1.099335, 0.3607843, 0, 1, 1,
0.6373044, -1.33722, 3.321903, 0.3686275, 0, 1, 1,
0.6422334, -1.210651, 0.4517091, 0.372549, 0, 1, 1,
0.6473424, -1.086972, 2.729572, 0.3803922, 0, 1, 1,
0.6482177, -0.971866, 4.389949, 0.3843137, 0, 1, 1,
0.6519751, -0.282293, 0.7171898, 0.3921569, 0, 1, 1,
0.6544391, -0.5587463, 1.716038, 0.3960784, 0, 1, 1,
0.6563092, -1.121009, 1.950667, 0.4039216, 0, 1, 1,
0.6605921, 0.0776251, 0.8440414, 0.4117647, 0, 1, 1,
0.6646581, -0.5844626, 2.125617, 0.4156863, 0, 1, 1,
0.6649706, 0.4827044, 1.185869, 0.4235294, 0, 1, 1,
0.6682382, 1.053136, 0.2050367, 0.427451, 0, 1, 1,
0.669318, -0.01177241, -0.4249661, 0.4352941, 0, 1, 1,
0.6704181, -0.9176877, 2.948348, 0.4392157, 0, 1, 1,
0.6718539, -0.4314502, 0.5560493, 0.4470588, 0, 1, 1,
0.673026, 0.2245139, 2.211192, 0.4509804, 0, 1, 1,
0.6733889, 0.3301258, 0.8453029, 0.4588235, 0, 1, 1,
0.6769437, 1.511013, -0.1593451, 0.4627451, 0, 1, 1,
0.677373, -0.4941937, 2.552919, 0.4705882, 0, 1, 1,
0.6791247, -0.0142185, 1.953097, 0.4745098, 0, 1, 1,
0.6805407, 0.161504, 1.064854, 0.4823529, 0, 1, 1,
0.6891229, 0.255657, 0.5299886, 0.4862745, 0, 1, 1,
0.6895246, 0.05638576, 0.4941031, 0.4941176, 0, 1, 1,
0.69473, 0.5688814, 1.151879, 0.5019608, 0, 1, 1,
0.695675, 1.213875, 1.618478, 0.5058824, 0, 1, 1,
0.6957, 1.185973, 0.6333692, 0.5137255, 0, 1, 1,
0.6963064, -1.191162, 2.685878, 0.5176471, 0, 1, 1,
0.6963466, -1.462093, 1.407732, 0.5254902, 0, 1, 1,
0.6991118, -1.684679, 3.070862, 0.5294118, 0, 1, 1,
0.699991, 1.168357, 0.8433217, 0.5372549, 0, 1, 1,
0.7022566, 2.284073, 2.03959, 0.5411765, 0, 1, 1,
0.7080632, 0.7850344, 0.3097514, 0.5490196, 0, 1, 1,
0.7131624, 0.4523983, 2.710639, 0.5529412, 0, 1, 1,
0.7177704, -0.8129382, 2.460915, 0.5607843, 0, 1, 1,
0.7177763, -2.021977, 2.683362, 0.5647059, 0, 1, 1,
0.727384, 0.4967198, -0.7735254, 0.572549, 0, 1, 1,
0.7279742, -0.2038353, 1.435401, 0.5764706, 0, 1, 1,
0.729086, 0.1746165, -1.57226, 0.5843138, 0, 1, 1,
0.7385264, -0.3991959, 1.264557, 0.5882353, 0, 1, 1,
0.738781, -0.3513921, 1.850774, 0.5960785, 0, 1, 1,
0.7409589, 0.2367148, -0.1420725, 0.6039216, 0, 1, 1,
0.7482381, 1.07742, 0.5301707, 0.6078432, 0, 1, 1,
0.7495041, 0.7814295, 1.571216, 0.6156863, 0, 1, 1,
0.7517606, 0.4192142, -0.4278593, 0.6196079, 0, 1, 1,
0.7537163, -1.708136, 3.420512, 0.627451, 0, 1, 1,
0.7546991, -1.428591, 2.604674, 0.6313726, 0, 1, 1,
0.7579601, 2.026479, 0.6469635, 0.6392157, 0, 1, 1,
0.758329, -1.043672, 1.170976, 0.6431373, 0, 1, 1,
0.7643628, 0.9636815, 0.2178415, 0.6509804, 0, 1, 1,
0.7706617, -0.6465467, 0.6663634, 0.654902, 0, 1, 1,
0.7730666, -2.513559, 2.399481, 0.6627451, 0, 1, 1,
0.7744738, -0.3319882, 2.839409, 0.6666667, 0, 1, 1,
0.7744994, -0.5578071, 1.600569, 0.6745098, 0, 1, 1,
0.7783176, 1.820841, 0.3100137, 0.6784314, 0, 1, 1,
0.7876285, 0.9666728, 0.006730629, 0.6862745, 0, 1, 1,
0.7954047, 0.5561624, 1.072629, 0.6901961, 0, 1, 1,
0.7961928, 0.4884436, 0.9161042, 0.6980392, 0, 1, 1,
0.7970588, -0.4949117, 3.292201, 0.7058824, 0, 1, 1,
0.7972565, -1.844739, 0.9326012, 0.7098039, 0, 1, 1,
0.7976274, -0.002370844, 1.00127, 0.7176471, 0, 1, 1,
0.7977554, 1.053081, -0.1495095, 0.7215686, 0, 1, 1,
0.8007393, 0.8229957, 1.795205, 0.7294118, 0, 1, 1,
0.8010218, -0.3882763, 1.512908, 0.7333333, 0, 1, 1,
0.8014591, -1.202811, 2.453399, 0.7411765, 0, 1, 1,
0.8017432, -0.3986595, 1.812008, 0.7450981, 0, 1, 1,
0.803384, -0.8990285, 3.331375, 0.7529412, 0, 1, 1,
0.8087847, -0.9436787, 2.29569, 0.7568628, 0, 1, 1,
0.8209423, 0.4457105, 0.4797711, 0.7647059, 0, 1, 1,
0.8257784, -0.287034, 3.079985, 0.7686275, 0, 1, 1,
0.8307157, -1.116884, 1.535411, 0.7764706, 0, 1, 1,
0.8355793, 0.002712842, 2.168238, 0.7803922, 0, 1, 1,
0.8361735, 0.0624301, 1.785995, 0.7882353, 0, 1, 1,
0.8398088, 0.2702308, 0.536593, 0.7921569, 0, 1, 1,
0.8399642, -1.066876, 2.999713, 0.8, 0, 1, 1,
0.8412296, -0.9162211, 3.411535, 0.8078431, 0, 1, 1,
0.8414053, 0.110107, 1.31886, 0.8117647, 0, 1, 1,
0.8422289, -1.028091, 1.540265, 0.8196079, 0, 1, 1,
0.8432478, 1.779082, 1.299139, 0.8235294, 0, 1, 1,
0.8447837, -0.7184235, 0.7231258, 0.8313726, 0, 1, 1,
0.8472011, 1.797433, 1.481342, 0.8352941, 0, 1, 1,
0.8491526, -0.4010791, 1.606509, 0.8431373, 0, 1, 1,
0.8497538, -1.527205, 2.235466, 0.8470588, 0, 1, 1,
0.8523014, -0.2050111, 2.452528, 0.854902, 0, 1, 1,
0.8525141, -0.6867641, 1.409698, 0.8588235, 0, 1, 1,
0.8574424, 0.5410905, 0.4503867, 0.8666667, 0, 1, 1,
0.8588431, 0.477816, 1.852748, 0.8705882, 0, 1, 1,
0.8610833, -0.3284753, 1.447748, 0.8784314, 0, 1, 1,
0.8685922, 1.450154, -0.1150129, 0.8823529, 0, 1, 1,
0.8758078, -0.2574936, 3.013372, 0.8901961, 0, 1, 1,
0.876892, 0.9274914, -0.03720447, 0.8941177, 0, 1, 1,
0.8788274, -0.3152682, 2.040456, 0.9019608, 0, 1, 1,
0.883794, 0.5431291, -0.905088, 0.9098039, 0, 1, 1,
0.891347, -1.28467, 2.806005, 0.9137255, 0, 1, 1,
0.8969694, -0.5995316, 0.7269149, 0.9215686, 0, 1, 1,
0.8991339, -1.008414, 2.197645, 0.9254902, 0, 1, 1,
0.9004303, 0.2225797, 0.2898864, 0.9333333, 0, 1, 1,
0.9033987, 1.249741, 0.9886928, 0.9372549, 0, 1, 1,
0.9061912, 3.124953, 0.8735743, 0.945098, 0, 1, 1,
0.9111459, -0.03290223, 0.648388, 0.9490196, 0, 1, 1,
0.9128208, 0.6212496, 0.6154323, 0.9568627, 0, 1, 1,
0.9232364, 0.1278532, 3.29365, 0.9607843, 0, 1, 1,
0.9314178, -2.490513, 4.265838, 0.9686275, 0, 1, 1,
0.9321474, -0.2540839, 1.184171, 0.972549, 0, 1, 1,
0.9383007, -0.7210367, 0.09133219, 0.9803922, 0, 1, 1,
0.9425865, 0.8322795, 1.679227, 0.9843137, 0, 1, 1,
0.9488199, 0.5382288, 0.4355686, 0.9921569, 0, 1, 1,
0.9706094, 0.7337368, 0.4602413, 0.9960784, 0, 1, 1,
0.978139, -1.063069, 3.105958, 1, 0, 0.9960784, 1,
0.9828287, 0.1001821, -0.9875688, 1, 0, 0.9882353, 1,
0.9861219, -0.8929605, 0.8760942, 1, 0, 0.9843137, 1,
0.9875797, -0.8962012, 2.004287, 1, 0, 0.9764706, 1,
0.9931837, -1.317945, 1.538675, 1, 0, 0.972549, 1,
0.9935992, -0.6022429, -0.02095418, 1, 0, 0.9647059, 1,
0.9956162, -0.7837417, 1.144772, 1, 0, 0.9607843, 1,
0.9965717, -0.08082326, 0.3931122, 1, 0, 0.9529412, 1,
0.9978397, -1.265809, 2.847135, 1, 0, 0.9490196, 1,
0.9991571, -1.157025, 0.5076749, 1, 0, 0.9411765, 1,
1.00374, -0.8373563, 1.714128, 1, 0, 0.9372549, 1,
1.019915, 0.3922193, 1.723172, 1, 0, 0.9294118, 1,
1.031082, 0.3396719, 1.357884, 1, 0, 0.9254902, 1,
1.031337, -0.5483655, 3.158127, 1, 0, 0.9176471, 1,
1.032338, 1.313113, -0.09243567, 1, 0, 0.9137255, 1,
1.036887, -0.6683268, 3.460686, 1, 0, 0.9058824, 1,
1.037795, -1.460831, 1.685813, 1, 0, 0.9019608, 1,
1.039737, -0.6260163, 1.454128, 1, 0, 0.8941177, 1,
1.040555, 0.6854231, -0.1741597, 1, 0, 0.8862745, 1,
1.04065, -0.6435705, 2.724062, 1, 0, 0.8823529, 1,
1.043773, -1.414302, 1.097692, 1, 0, 0.8745098, 1,
1.043885, -0.2386465, 2.405946, 1, 0, 0.8705882, 1,
1.060054, -1.118452, 1.43918, 1, 0, 0.8627451, 1,
1.06674, -0.3725644, 3.208956, 1, 0, 0.8588235, 1,
1.069831, -0.03743508, 1.301518, 1, 0, 0.8509804, 1,
1.080106, 0.2511128, 0.5277746, 1, 0, 0.8470588, 1,
1.088441, -1.882812, 2.046897, 1, 0, 0.8392157, 1,
1.089478, 0.9216588, 1.157481, 1, 0, 0.8352941, 1,
1.093625, 0.7928219, 0.823676, 1, 0, 0.827451, 1,
1.093995, -1.185047, 3.765423, 1, 0, 0.8235294, 1,
1.095558, -0.07415561, 0.3510606, 1, 0, 0.8156863, 1,
1.098174, 0.6168665, -0.8854445, 1, 0, 0.8117647, 1,
1.108339, -1.612386, 2.788737, 1, 0, 0.8039216, 1,
1.108787, 0.06815343, 1.876968, 1, 0, 0.7960784, 1,
1.123335, 0.3364325, 0.0709819, 1, 0, 0.7921569, 1,
1.145608, -0.6641236, 1.428287, 1, 0, 0.7843137, 1,
1.146313, 1.776406, 0.5749263, 1, 0, 0.7803922, 1,
1.148843, 0.5266258, -0.2845251, 1, 0, 0.772549, 1,
1.159904, 0.317004, 0.9580235, 1, 0, 0.7686275, 1,
1.173916, 2.376216, -0.5660755, 1, 0, 0.7607843, 1,
1.175512, -1.031628, 4.068693, 1, 0, 0.7568628, 1,
1.178691, -0.5621016, 1.460257, 1, 0, 0.7490196, 1,
1.17889, 0.1908929, 1.462961, 1, 0, 0.7450981, 1,
1.180512, -0.3940035, 1.178292, 1, 0, 0.7372549, 1,
1.182486, -0.3751166, 0.837825, 1, 0, 0.7333333, 1,
1.183405, 1.562999, 1.354089, 1, 0, 0.7254902, 1,
1.188886, 0.4476218, 2.381299, 1, 0, 0.7215686, 1,
1.194182, -0.1123492, 1.050883, 1, 0, 0.7137255, 1,
1.200364, 0.676729, 0.6531533, 1, 0, 0.7098039, 1,
1.201031, 0.3705449, 1.39521, 1, 0, 0.7019608, 1,
1.210418, 0.654702, 1.217507, 1, 0, 0.6941177, 1,
1.216611, 0.01679012, 1.489048, 1, 0, 0.6901961, 1,
1.225648, 0.6448025, 0.6738815, 1, 0, 0.682353, 1,
1.235633, -0.1905601, 2.051498, 1, 0, 0.6784314, 1,
1.235997, -0.929718, 2.298046, 1, 0, 0.6705883, 1,
1.24999, 2.121938, 0.4927455, 1, 0, 0.6666667, 1,
1.251889, -1.544934, 1.143507, 1, 0, 0.6588235, 1,
1.252108, -1.457196, 1.09583, 1, 0, 0.654902, 1,
1.257439, -0.158643, 0.8540832, 1, 0, 0.6470588, 1,
1.260558, -0.6376572, 1.319026, 1, 0, 0.6431373, 1,
1.282014, 0.3677879, -0.06743956, 1, 0, 0.6352941, 1,
1.283243, 0.7791921, 2.530354, 1, 0, 0.6313726, 1,
1.28459, -1.578768, 1.806294, 1, 0, 0.6235294, 1,
1.28598, -1.893944, 3.189673, 1, 0, 0.6196079, 1,
1.286447, 1.850357, 0.3326873, 1, 0, 0.6117647, 1,
1.29161, 0.1176549, 1.878317, 1, 0, 0.6078432, 1,
1.292076, -0.2508916, 1.411199, 1, 0, 0.6, 1,
1.310333, 0.8899381, 1.280286, 1, 0, 0.5921569, 1,
1.321129, -0.2669852, 1.359995, 1, 0, 0.5882353, 1,
1.321486, 0.09751299, 1.187817, 1, 0, 0.5803922, 1,
1.342107, 0.5411581, 2.369272, 1, 0, 0.5764706, 1,
1.355685, 0.61156, 1.30751, 1, 0, 0.5686275, 1,
1.361858, -0.706306, 2.417276, 1, 0, 0.5647059, 1,
1.366045, -1.306111, 2.974377, 1, 0, 0.5568628, 1,
1.392986, 1.361798, 2.552909, 1, 0, 0.5529412, 1,
1.393754, -0.5988569, 1.149463, 1, 0, 0.5450981, 1,
1.414683, -1.184392, 2.855058, 1, 0, 0.5411765, 1,
1.417241, -0.267004, 0.2923756, 1, 0, 0.5333334, 1,
1.418903, 1.351536, 1.610737, 1, 0, 0.5294118, 1,
1.432524, 0.404035, 2.38878, 1, 0, 0.5215687, 1,
1.440847, -1.099012, 1.724709, 1, 0, 0.5176471, 1,
1.448356, -1.541972, 2.051319, 1, 0, 0.509804, 1,
1.448458, 0.4595194, 1.11586, 1, 0, 0.5058824, 1,
1.461006, 0.9440214, -0.3312271, 1, 0, 0.4980392, 1,
1.464708, 0.4043949, 1.741338, 1, 0, 0.4901961, 1,
1.48828, 1.596934, -0.5292293, 1, 0, 0.4862745, 1,
1.49398, 0.1316767, 1.784522, 1, 0, 0.4784314, 1,
1.495352, 2.192897, 1.387149, 1, 0, 0.4745098, 1,
1.495356, 0.2216223, 1.174784, 1, 0, 0.4666667, 1,
1.501511, 0.3548091, 2.446833, 1, 0, 0.4627451, 1,
1.52214, 0.5456975, 0.6047141, 1, 0, 0.454902, 1,
1.524147, 1.95816, 1.925456, 1, 0, 0.4509804, 1,
1.524556, 1.120085, 0.7624727, 1, 0, 0.4431373, 1,
1.538461, 0.9957813, 1.886354, 1, 0, 0.4392157, 1,
1.544619, -0.6601661, 2.021877, 1, 0, 0.4313726, 1,
1.548574, 0.07028132, -0.2224259, 1, 0, 0.427451, 1,
1.558804, -0.8456818, 3.163474, 1, 0, 0.4196078, 1,
1.560173, 1.499215, 1.440854, 1, 0, 0.4156863, 1,
1.565656, -1.570151, 1.181972, 1, 0, 0.4078431, 1,
1.566536, -0.4192414, 3.361367, 1, 0, 0.4039216, 1,
1.567809, -0.8210867, 2.509322, 1, 0, 0.3960784, 1,
1.570125, 1.153724, 0.5223979, 1, 0, 0.3882353, 1,
1.590091, -0.6460865, 0.4291217, 1, 0, 0.3843137, 1,
1.621608, -0.2171338, 1.396648, 1, 0, 0.3764706, 1,
1.625631, -0.8632752, 3.516887, 1, 0, 0.372549, 1,
1.625751, 0.7741474, 1.692386, 1, 0, 0.3647059, 1,
1.642868, 0.8785198, 2.028549, 1, 0, 0.3607843, 1,
1.647297, -1.099469, 1.875676, 1, 0, 0.3529412, 1,
1.656037, -0.8646107, 1.738034, 1, 0, 0.3490196, 1,
1.660697, 0.489095, 0.5378437, 1, 0, 0.3411765, 1,
1.661653, 0.09662617, 1.851413, 1, 0, 0.3372549, 1,
1.66973, 0.4930797, 0.3606932, 1, 0, 0.3294118, 1,
1.686399, 0.6476137, 0.9016577, 1, 0, 0.3254902, 1,
1.687518, -0.1190146, 0.5188309, 1, 0, 0.3176471, 1,
1.690217, -0.4139175, 1.816729, 1, 0, 0.3137255, 1,
1.702415, -0.3675271, 2.276831, 1, 0, 0.3058824, 1,
1.704566, 1.231358, 1.9733, 1, 0, 0.2980392, 1,
1.707123, -1.355484, 3.85914, 1, 0, 0.2941177, 1,
1.711845, 0.483889, 1.813432, 1, 0, 0.2862745, 1,
1.729609, -0.8006867, 3.215155, 1, 0, 0.282353, 1,
1.731968, -0.395135, 2.176619, 1, 0, 0.2745098, 1,
1.741979, 0.7657638, 1.997361, 1, 0, 0.2705882, 1,
1.755278, -0.3401526, 1.656841, 1, 0, 0.2627451, 1,
1.757261, 2.759093, -0.09370668, 1, 0, 0.2588235, 1,
1.771529, 0.3426801, 1.809106, 1, 0, 0.2509804, 1,
1.794178, -0.8367382, 2.749113, 1, 0, 0.2470588, 1,
1.815666, -1.677777, 1.294246, 1, 0, 0.2392157, 1,
1.827546, 0.6420941, 1.433536, 1, 0, 0.2352941, 1,
1.832263, 0.3758831, 2.038513, 1, 0, 0.227451, 1,
1.875891, -0.8687004, 1.555214, 1, 0, 0.2235294, 1,
1.87651, 0.2489062, 1.140454, 1, 0, 0.2156863, 1,
1.886183, 1.453004, 0.7034091, 1, 0, 0.2117647, 1,
1.902596, 0.2781177, 0.3343033, 1, 0, 0.2039216, 1,
1.903041, 0.463714, 2.809011, 1, 0, 0.1960784, 1,
1.907282, 1.376263, 3.290447, 1, 0, 0.1921569, 1,
1.944287, -0.109554, 0.663646, 1, 0, 0.1843137, 1,
1.962931, -0.3407581, 2.962967, 1, 0, 0.1803922, 1,
1.972575, 0.2180201, 2.050826, 1, 0, 0.172549, 1,
1.996126, -1.141431, 2.271129, 1, 0, 0.1686275, 1,
2.013357, 2.167573, 0.8722768, 1, 0, 0.1607843, 1,
2.039791, -0.6963705, 1.413749, 1, 0, 0.1568628, 1,
2.055536, 0.394406, 0.2095487, 1, 0, 0.1490196, 1,
2.07671, 1.254587, 0.7793918, 1, 0, 0.145098, 1,
2.094745, 2.578076, -0.2388238, 1, 0, 0.1372549, 1,
2.104141, 0.3088676, -0.1122186, 1, 0, 0.1333333, 1,
2.106972, -1.291868, 3.770815, 1, 0, 0.1254902, 1,
2.138637, -0.1346473, 1.558961, 1, 0, 0.1215686, 1,
2.14756, 0.935907, 2.790562, 1, 0, 0.1137255, 1,
2.154822, -0.7155542, 1.560605, 1, 0, 0.1098039, 1,
2.170923, -0.1039388, -0.9071649, 1, 0, 0.1019608, 1,
2.176498, -0.2082754, 1.998222, 1, 0, 0.09411765, 1,
2.182325, -0.1635161, 2.164699, 1, 0, 0.09019608, 1,
2.195206, -2.457028, 4.362324, 1, 0, 0.08235294, 1,
2.2043, 0.7216267, 1.170315, 1, 0, 0.07843138, 1,
2.222532, 1.212937, 1.361062, 1, 0, 0.07058824, 1,
2.239309, -0.6366342, 2.929415, 1, 0, 0.06666667, 1,
2.284818, -0.5652426, 0.8440845, 1, 0, 0.05882353, 1,
2.469523, 1.054655, 0.7913476, 1, 0, 0.05490196, 1,
2.572096, 0.9681917, 2.361508, 1, 0, 0.04705882, 1,
2.65892, -2.181625, 1.209876, 1, 0, 0.04313726, 1,
2.712959, 1.123234, 0.9397556, 1, 0, 0.03529412, 1,
2.719914, 0.4283313, 1.086629, 1, 0, 0.03137255, 1,
2.768885, -0.1320271, 2.572184, 1, 0, 0.02352941, 1,
2.775444, -0.3047411, 2.616105, 1, 0, 0.01960784, 1,
2.947283, -0.01262395, 0.3304599, 1, 0, 0.01176471, 1,
3.391035, 1.645386, 1.2931, 1, 0, 0.007843138, 1
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
-0.1446509, -4.00164, -7.419325, 0, -0.5, 0.5, 0.5,
-0.1446509, -4.00164, -7.419325, 1, -0.5, 0.5, 0.5,
-0.1446509, -4.00164, -7.419325, 1, 1.5, 0.5, 0.5,
-0.1446509, -4.00164, -7.419325, 0, 1.5, 0.5, 0.5
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
-4.878934, 0.7575508, -7.419325, 0, -0.5, 0.5, 0.5,
-4.878934, 0.7575508, -7.419325, 1, -0.5, 0.5, 0.5,
-4.878934, 0.7575508, -7.419325, 1, 1.5, 0.5, 0.5,
-4.878934, 0.7575508, -7.419325, 0, 1.5, 0.5, 0.5
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
-4.878934, -4.00164, -0.1966538, 0, -0.5, 0.5, 0.5,
-4.878934, -4.00164, -0.1966538, 1, -0.5, 0.5, 0.5,
-4.878934, -4.00164, -0.1966538, 1, 1.5, 0.5, 0.5,
-4.878934, -4.00164, -0.1966538, 0, 1.5, 0.5, 0.5
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
-2, -2.903366, -5.752555,
2, -2.903366, -5.752555,
-2, -2.903366, -5.752555,
-2, -3.086411, -6.03035,
0, -2.903366, -5.752555,
0, -3.086411, -6.03035,
2, -2.903366, -5.752555,
2, -3.086411, -6.03035
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
-2, -3.452503, -6.58594, 0, -0.5, 0.5, 0.5,
-2, -3.452503, -6.58594, 1, -0.5, 0.5, 0.5,
-2, -3.452503, -6.58594, 1, 1.5, 0.5, 0.5,
-2, -3.452503, -6.58594, 0, 1.5, 0.5, 0.5,
0, -3.452503, -6.58594, 0, -0.5, 0.5, 0.5,
0, -3.452503, -6.58594, 1, -0.5, 0.5, 0.5,
0, -3.452503, -6.58594, 1, 1.5, 0.5, 0.5,
0, -3.452503, -6.58594, 0, 1.5, 0.5, 0.5,
2, -3.452503, -6.58594, 0, -0.5, 0.5, 0.5,
2, -3.452503, -6.58594, 1, -0.5, 0.5, 0.5,
2, -3.452503, -6.58594, 1, 1.5, 0.5, 0.5,
2, -3.452503, -6.58594, 0, 1.5, 0.5, 0.5
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
-3.786407, -2, -5.752555,
-3.786407, 4, -5.752555,
-3.786407, -2, -5.752555,
-3.968495, -2, -6.03035,
-3.786407, 0, -5.752555,
-3.968495, 0, -6.03035,
-3.786407, 2, -5.752555,
-3.968495, 2, -6.03035,
-3.786407, 4, -5.752555,
-3.968495, 4, -6.03035
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
"2",
"4"
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
-4.332671, -2, -6.58594, 0, -0.5, 0.5, 0.5,
-4.332671, -2, -6.58594, 1, -0.5, 0.5, 0.5,
-4.332671, -2, -6.58594, 1, 1.5, 0.5, 0.5,
-4.332671, -2, -6.58594, 0, 1.5, 0.5, 0.5,
-4.332671, 0, -6.58594, 0, -0.5, 0.5, 0.5,
-4.332671, 0, -6.58594, 1, -0.5, 0.5, 0.5,
-4.332671, 0, -6.58594, 1, 1.5, 0.5, 0.5,
-4.332671, 0, -6.58594, 0, 1.5, 0.5, 0.5,
-4.332671, 2, -6.58594, 0, -0.5, 0.5, 0.5,
-4.332671, 2, -6.58594, 1, -0.5, 0.5, 0.5,
-4.332671, 2, -6.58594, 1, 1.5, 0.5, 0.5,
-4.332671, 2, -6.58594, 0, 1.5, 0.5, 0.5,
-4.332671, 4, -6.58594, 0, -0.5, 0.5, 0.5,
-4.332671, 4, -6.58594, 1, -0.5, 0.5, 0.5,
-4.332671, 4, -6.58594, 1, 1.5, 0.5, 0.5,
-4.332671, 4, -6.58594, 0, 1.5, 0.5, 0.5
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
-3.786407, -2.903366, -4,
-3.786407, -2.903366, 4,
-3.786407, -2.903366, -4,
-3.968495, -3.086411, -4,
-3.786407, -2.903366, -2,
-3.968495, -3.086411, -2,
-3.786407, -2.903366, 0,
-3.968495, -3.086411, 0,
-3.786407, -2.903366, 2,
-3.968495, -3.086411, 2,
-3.786407, -2.903366, 4,
-3.968495, -3.086411, 4
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
-4.332671, -3.452503, -4, 0, -0.5, 0.5, 0.5,
-4.332671, -3.452503, -4, 1, -0.5, 0.5, 0.5,
-4.332671, -3.452503, -4, 1, 1.5, 0.5, 0.5,
-4.332671, -3.452503, -4, 0, 1.5, 0.5, 0.5,
-4.332671, -3.452503, -2, 0, -0.5, 0.5, 0.5,
-4.332671, -3.452503, -2, 1, -0.5, 0.5, 0.5,
-4.332671, -3.452503, -2, 1, 1.5, 0.5, 0.5,
-4.332671, -3.452503, -2, 0, 1.5, 0.5, 0.5,
-4.332671, -3.452503, 0, 0, -0.5, 0.5, 0.5,
-4.332671, -3.452503, 0, 1, -0.5, 0.5, 0.5,
-4.332671, -3.452503, 0, 1, 1.5, 0.5, 0.5,
-4.332671, -3.452503, 0, 0, 1.5, 0.5, 0.5,
-4.332671, -3.452503, 2, 0, -0.5, 0.5, 0.5,
-4.332671, -3.452503, 2, 1, -0.5, 0.5, 0.5,
-4.332671, -3.452503, 2, 1, 1.5, 0.5, 0.5,
-4.332671, -3.452503, 2, 0, 1.5, 0.5, 0.5,
-4.332671, -3.452503, 4, 0, -0.5, 0.5, 0.5,
-4.332671, -3.452503, 4, 1, -0.5, 0.5, 0.5,
-4.332671, -3.452503, 4, 1, 1.5, 0.5, 0.5,
-4.332671, -3.452503, 4, 0, 1.5, 0.5, 0.5
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
-3.786407, -2.903366, -5.752555,
-3.786407, 4.418467, -5.752555,
-3.786407, -2.903366, 5.359247,
-3.786407, 4.418467, 5.359247,
-3.786407, -2.903366, -5.752555,
-3.786407, -2.903366, 5.359247,
-3.786407, 4.418467, -5.752555,
-3.786407, 4.418467, 5.359247,
-3.786407, -2.903366, -5.752555,
3.497105, -2.903366, -5.752555,
-3.786407, -2.903366, 5.359247,
3.497105, -2.903366, 5.359247,
-3.786407, 4.418467, -5.752555,
3.497105, 4.418467, -5.752555,
-3.786407, 4.418467, 5.359247,
3.497105, 4.418467, 5.359247,
3.497105, -2.903366, -5.752555,
3.497105, 4.418467, -5.752555,
3.497105, -2.903366, 5.359247,
3.497105, 4.418467, 5.359247,
3.497105, -2.903366, -5.752555,
3.497105, -2.903366, 5.359247,
3.497105, 4.418467, -5.752555,
3.497105, 4.418467, 5.359247
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
var radius = 8.100521;
var distance = 36.04013;
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
mvMatrix.translate( 0.1446509, -0.7575508, 0.1966538 );
mvMatrix.scale( 1.202502, 1.196209, 0.7882108 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.04013);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
flamprop-M-methyl<-read.table("flamprop-M-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flamprop-M-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
```

```r
y<-flamprop-M-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
```

```r
z<-flamprop-M-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
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
-3.680337, 1.742805, -3.01124, 0, 0, 1, 1, 1,
-2.991549, -0.286651, -1.446935, 1, 0, 0, 1, 1,
-2.863022, 0.819811, -1.229885, 1, 0, 0, 1, 1,
-2.782401, 1.419836, -0.3261251, 1, 0, 0, 1, 1,
-2.653039, 0.0003218688, -2.694028, 1, 0, 0, 1, 1,
-2.63412, 0.6802452, -0.9457858, 1, 0, 0, 1, 1,
-2.619097, 0.8329988, -0.7834319, 0, 0, 0, 1, 1,
-2.615177, 1.093837, -1.472628, 0, 0, 0, 1, 1,
-2.599013, 1.872248, -1.12075, 0, 0, 0, 1, 1,
-2.564903, -0.6558832, -0.9861731, 0, 0, 0, 1, 1,
-2.498814, -0.2773679, -1.83374, 0, 0, 0, 1, 1,
-2.445755, 0.3631908, -0.986271, 0, 0, 0, 1, 1,
-2.400464, -0.03631629, -0.4540734, 0, 0, 0, 1, 1,
-2.344691, 0.6443774, -1.028114, 1, 1, 1, 1, 1,
-2.179073, 7.566356e-05, -1.268113, 1, 1, 1, 1, 1,
-2.176711, 1.065995, -1.921084, 1, 1, 1, 1, 1,
-2.152406, 0.4517157, -1.921316, 1, 1, 1, 1, 1,
-2.115021, -0.7983184, -2.699845, 1, 1, 1, 1, 1,
-2.07508, 0.4912424, -0.6732928, 1, 1, 1, 1, 1,
-2.074646, -1.780739, -1.307781, 1, 1, 1, 1, 1,
-2.06371, 0.4152679, -1.063931, 1, 1, 1, 1, 1,
-2.061763, 0.3584632, -0.615872, 1, 1, 1, 1, 1,
-2.04737, 0.1973588, -1.001201, 1, 1, 1, 1, 1,
-2.038476, -1.224411, -2.04317, 1, 1, 1, 1, 1,
-1.99257, -0.8603817, -1.70767, 1, 1, 1, 1, 1,
-1.977484, 1.766858, 0.2782913, 1, 1, 1, 1, 1,
-1.968242, 0.1592368, 0.02208122, 1, 1, 1, 1, 1,
-1.954741, -0.8541203, -1.691912, 1, 1, 1, 1, 1,
-1.94584, -1.2812, -1.884025, 0, 0, 1, 1, 1,
-1.917154, -1.356001, -2.901872, 1, 0, 0, 1, 1,
-1.886523, 0.2678361, -2.02828, 1, 0, 0, 1, 1,
-1.885072, 0.1298498, -1.992729, 1, 0, 0, 1, 1,
-1.869303, 1.060355, -2.309911, 1, 0, 0, 1, 1,
-1.858259, 0.5237723, -2.847986, 1, 0, 0, 1, 1,
-1.856253, -0.4831688, -1.083349, 0, 0, 0, 1, 1,
-1.854759, -1.279991, -0.4765259, 0, 0, 0, 1, 1,
-1.85334, -0.09094261, -1.596317, 0, 0, 0, 1, 1,
-1.809052, 1.021674, -2.913049, 0, 0, 0, 1, 1,
-1.798668, 0.9098759, -4.327281, 0, 0, 0, 1, 1,
-1.741323, -0.1450931, -1.426336, 0, 0, 0, 1, 1,
-1.736189, -0.09814642, -2.393648, 0, 0, 0, 1, 1,
-1.733198, -0.270011, -3.645195, 1, 1, 1, 1, 1,
-1.728186, -0.2373671, -0.7673605, 1, 1, 1, 1, 1,
-1.723484, -0.8407632, -2.496868, 1, 1, 1, 1, 1,
-1.682881, -0.3158231, -2.815572, 1, 1, 1, 1, 1,
-1.678854, -0.7460892, -1.093032, 1, 1, 1, 1, 1,
-1.66306, 0.3652313, -2.311119, 1, 1, 1, 1, 1,
-1.649581, -0.3213186, -2.977365, 1, 1, 1, 1, 1,
-1.623648, -1.171921, -3.484969, 1, 1, 1, 1, 1,
-1.601123, 0.7125784, -0.3015296, 1, 1, 1, 1, 1,
-1.598021, 2.36623, -0.8993139, 1, 1, 1, 1, 1,
-1.589107, -1.242371, -4.065672, 1, 1, 1, 1, 1,
-1.579676, -0.1003333, 0.06796464, 1, 1, 1, 1, 1,
-1.571072, 1.638283, -1.007364, 1, 1, 1, 1, 1,
-1.567877, -0.6112837, -2.835949, 1, 1, 1, 1, 1,
-1.56677, 0.7235806, -1.701241, 1, 1, 1, 1, 1,
-1.566047, -0.9714031, -3.491642, 0, 0, 1, 1, 1,
-1.558104, 2.276083, -0.8154513, 1, 0, 0, 1, 1,
-1.552849, 0.73559, -1.593124, 1, 0, 0, 1, 1,
-1.532708, -0.8901278, -1.485708, 1, 0, 0, 1, 1,
-1.51289, -0.7056695, -0.864091, 1, 0, 0, 1, 1,
-1.511991, -1.225369, -1.598221, 1, 0, 0, 1, 1,
-1.504017, 1.257776, -0.4745608, 0, 0, 0, 1, 1,
-1.502021, 0.7285379, -1.34106, 0, 0, 0, 1, 1,
-1.491204, 1.359103, -0.7446995, 0, 0, 0, 1, 1,
-1.486431, -0.4314884, -2.042164, 0, 0, 0, 1, 1,
-1.483055, -0.783069, -2.390953, 0, 0, 0, 1, 1,
-1.479073, 0.7990788, -1.255467, 0, 0, 0, 1, 1,
-1.477657, 1.23547, -3.266422, 0, 0, 0, 1, 1,
-1.467164, 2.007678, -2.019213, 1, 1, 1, 1, 1,
-1.456473, 0.7084234, -2.081872, 1, 1, 1, 1, 1,
-1.446127, -1.201242, -0.9994629, 1, 1, 1, 1, 1,
-1.442701, -0.4205865, -1.595494, 1, 1, 1, 1, 1,
-1.440835, 1.602372, -0.9159871, 1, 1, 1, 1, 1,
-1.425196, 0.6484234, -2.610914, 1, 1, 1, 1, 1,
-1.415999, -1.929201, -1.842996, 1, 1, 1, 1, 1,
-1.415491, -0.3503141, -1.275883, 1, 1, 1, 1, 1,
-1.411177, -0.8030046, -0.5847816, 1, 1, 1, 1, 1,
-1.410374, 0.5836176, -2.610696, 1, 1, 1, 1, 1,
-1.408218, -0.3603151, -1.703228, 1, 1, 1, 1, 1,
-1.395905, -1.44612, -1.986966, 1, 1, 1, 1, 1,
-1.381641, -0.3279045, -1.627482, 1, 1, 1, 1, 1,
-1.366125, -1.012344, -3.060155, 1, 1, 1, 1, 1,
-1.364861, -0.2384616, -0.8339238, 1, 1, 1, 1, 1,
-1.350027, 0.09276634, -0.0272793, 0, 0, 1, 1, 1,
-1.334258, 0.2375011, -0.3705064, 1, 0, 0, 1, 1,
-1.329129, -0.05901659, -3.479449, 1, 0, 0, 1, 1,
-1.321787, 1.115251, -0.8563951, 1, 0, 0, 1, 1,
-1.316333, -0.3018489, -1.444462, 1, 0, 0, 1, 1,
-1.294631, 2.17341, -2.216452, 1, 0, 0, 1, 1,
-1.271068, -0.8112574, -2.074736, 0, 0, 0, 1, 1,
-1.270846, 0.5938299, -2.650913, 0, 0, 0, 1, 1,
-1.268352, -1.109487, -2.762302, 0, 0, 0, 1, 1,
-1.267217, 0.2833071, -0.4831841, 0, 0, 0, 1, 1,
-1.266706, 1.043631, -0.2200189, 0, 0, 0, 1, 1,
-1.264808, -0.04502281, -3.118735, 0, 0, 0, 1, 1,
-1.243954, -1.801249, -1.570121, 0, 0, 0, 1, 1,
-1.239086, -0.1441925, -3.429903, 1, 1, 1, 1, 1,
-1.227544, 0.4323549, -2.780474, 1, 1, 1, 1, 1,
-1.224605, -1.611631, -1.077344, 1, 1, 1, 1, 1,
-1.221845, -1.539554, -2.366301, 1, 1, 1, 1, 1,
-1.216227, -1.754973, -1.157673, 1, 1, 1, 1, 1,
-1.207255, -1.886593, -3.485473, 1, 1, 1, 1, 1,
-1.206711, 1.764054, -0.7128544, 1, 1, 1, 1, 1,
-1.175977, -0.3288741, -2.231831, 1, 1, 1, 1, 1,
-1.152805, -0.4236136, -2.559647, 1, 1, 1, 1, 1,
-1.148546, 2.437773, -1.376436, 1, 1, 1, 1, 1,
-1.138645, 1.496205, -0.4408005, 1, 1, 1, 1, 1,
-1.136591, -0.4441667, -1.898175, 1, 1, 1, 1, 1,
-1.133731, -1.177246, -1.775723, 1, 1, 1, 1, 1,
-1.131754, 0.2221431, -0.3536179, 1, 1, 1, 1, 1,
-1.129467, 0.3210461, -2.210705, 1, 1, 1, 1, 1,
-1.119813, -1.368181, -4.873346, 0, 0, 1, 1, 1,
-1.118714, -1.597103, -1.808515, 1, 0, 0, 1, 1,
-1.107651, -2.003474, -2.768209, 1, 0, 0, 1, 1,
-1.107315, -0.03387229, -0.5739536, 1, 0, 0, 1, 1,
-1.098338, -0.7900569, -1.574809, 1, 0, 0, 1, 1,
-1.096139, 0.2883809, -2.393914, 1, 0, 0, 1, 1,
-1.094228, -1.656079, -0.6877717, 0, 0, 0, 1, 1,
-1.092315, 0.3162962, -1.848909, 0, 0, 0, 1, 1,
-1.088823, 0.1138465, -0.752941, 0, 0, 0, 1, 1,
-1.087518, 1.20438, 0.009221068, 0, 0, 0, 1, 1,
-1.074202, 0.01273311, -2.606264, 0, 0, 0, 1, 1,
-1.068119, -2.584901, -1.947075, 0, 0, 0, 1, 1,
-1.06677, -0.1204973, -1.181431, 0, 0, 0, 1, 1,
-1.064279, 0.716165, -1.393281, 1, 1, 1, 1, 1,
-1.063046, -1.196886, -1.633023, 1, 1, 1, 1, 1,
-1.06081, -0.3752071, -2.368957, 1, 1, 1, 1, 1,
-1.053505, -1.786445, -2.351866, 1, 1, 1, 1, 1,
-1.052036, 0.6271061, -0.9379586, 1, 1, 1, 1, 1,
-1.039179, 0.8319946, -0.03154795, 1, 1, 1, 1, 1,
-1.034623, -2.24971, -1.940913, 1, 1, 1, 1, 1,
-1.031889, 0.9619776, -0.6353042, 1, 1, 1, 1, 1,
-1.027459, 0.253325, -2.047639, 1, 1, 1, 1, 1,
-1.025364, -1.50193, -4.124719, 1, 1, 1, 1, 1,
-1.025117, -1.70223, -2.384903, 1, 1, 1, 1, 1,
-1.008118, 2.38287, -2.142655, 1, 1, 1, 1, 1,
-0.9989634, 1.609615, -0.7896351, 1, 1, 1, 1, 1,
-0.9974399, 0.3273395, -2.231603, 1, 1, 1, 1, 1,
-0.9940824, -1.800366, -5.291513, 1, 1, 1, 1, 1,
-0.9799663, 0.5748863, -3.05563, 0, 0, 1, 1, 1,
-0.9793625, -0.3650129, -0.4142946, 1, 0, 0, 1, 1,
-0.975595, 1.829394, 0.1268712, 1, 0, 0, 1, 1,
-0.9704242, 0.3339593, -0.642908, 1, 0, 0, 1, 1,
-0.9680893, 1.10476, -0.8498701, 1, 0, 0, 1, 1,
-0.9670491, 1.091484, -0.7652754, 1, 0, 0, 1, 1,
-0.9611492, -0.08646654, -2.095298, 0, 0, 0, 1, 1,
-0.9606999, 0.2596356, -0.5810572, 0, 0, 0, 1, 1,
-0.9587529, 1.24494, -0.01829387, 0, 0, 0, 1, 1,
-0.9584627, 0.1407641, -1.455791, 0, 0, 0, 1, 1,
-0.949703, -0.7964076, -4.794625, 0, 0, 0, 1, 1,
-0.949525, -0.8322342, -3.787262, 0, 0, 0, 1, 1,
-0.9495125, -0.7723936, -2.490294, 0, 0, 0, 1, 1,
-0.9421663, -0.9015666, -2.222185, 1, 1, 1, 1, 1,
-0.9391558, -0.47843, -0.8905383, 1, 1, 1, 1, 1,
-0.9390886, -0.9590642, -2.872381, 1, 1, 1, 1, 1,
-0.9362611, -1.486112, -3.631324, 1, 1, 1, 1, 1,
-0.9297498, -1.2037, -2.189313, 1, 1, 1, 1, 1,
-0.9267563, 1.177204, -1.931928, 1, 1, 1, 1, 1,
-0.9258749, -1.737997, -1.855059, 1, 1, 1, 1, 1,
-0.9216537, 0.07583179, -0.2605632, 1, 1, 1, 1, 1,
-0.9181693, -2.214558, -3.503554, 1, 1, 1, 1, 1,
-0.9134856, 0.469778, 0.2085359, 1, 1, 1, 1, 1,
-0.9062012, 0.911611, -0.1244108, 1, 1, 1, 1, 1,
-0.9058052, 2.057017, -1.343527, 1, 1, 1, 1, 1,
-0.9042174, -1.025619, -2.282039, 1, 1, 1, 1, 1,
-0.9015607, 1.795258, 1.035429, 1, 1, 1, 1, 1,
-0.8897185, 0.8008543, 0.4083498, 1, 1, 1, 1, 1,
-0.8886607, -0.5053974, -2.080363, 0, 0, 1, 1, 1,
-0.8843758, -0.4664185, -2.387117, 1, 0, 0, 1, 1,
-0.8841405, 1.859203, 0.7670676, 1, 0, 0, 1, 1,
-0.8836244, -0.08917919, -2.258903, 1, 0, 0, 1, 1,
-0.8830541, 0.939818, -1.366158, 1, 0, 0, 1, 1,
-0.8812768, 0.5317766, 1.450378, 1, 0, 0, 1, 1,
-0.8803402, 0.7096066, -1.708212, 0, 0, 0, 1, 1,
-0.8666401, -0.02481311, -2.032311, 0, 0, 0, 1, 1,
-0.8628094, -0.976522, -2.171778, 0, 0, 0, 1, 1,
-0.8625365, 1.376454, -2.646624, 0, 0, 0, 1, 1,
-0.8616678, -0.1097404, -2.376637, 0, 0, 0, 1, 1,
-0.8581237, 1.172722, -2.33072, 0, 0, 0, 1, 1,
-0.8545619, -0.2097742, -1.61208, 0, 0, 0, 1, 1,
-0.853006, -0.3689029, -0.9530358, 1, 1, 1, 1, 1,
-0.8489925, 1.708818, -1.342242, 1, 1, 1, 1, 1,
-0.8483383, 0.1621113, -2.227646, 1, 1, 1, 1, 1,
-0.8359393, -0.2424819, -2.717896, 1, 1, 1, 1, 1,
-0.8338208, 0.1001811, -1.891457, 1, 1, 1, 1, 1,
-0.8332274, 1.473062, -0.06484134, 1, 1, 1, 1, 1,
-0.824748, -0.02910352, -1.614445, 1, 1, 1, 1, 1,
-0.8234212, 1.297531, 0.1376951, 1, 1, 1, 1, 1,
-0.8203313, -0.5249275, -1.858919, 1, 1, 1, 1, 1,
-0.8201324, 2.331611, -0.2948293, 1, 1, 1, 1, 1,
-0.8135225, 0.1024001, -2.001993, 1, 1, 1, 1, 1,
-0.81319, -2.218565, -1.280228, 1, 1, 1, 1, 1,
-0.8097396, -0.4756103, -2.960041, 1, 1, 1, 1, 1,
-0.802695, -0.6163862, -4.24984, 1, 1, 1, 1, 1,
-0.801337, -0.5086367, -2.139233, 1, 1, 1, 1, 1,
-0.801156, 0.7401491, -1.531739, 0, 0, 1, 1, 1,
-0.7930443, 1.610745, -1.540857, 1, 0, 0, 1, 1,
-0.7893956, -0.5957715, -2.431208, 1, 0, 0, 1, 1,
-0.7860407, -0.07135037, -2.570796, 1, 0, 0, 1, 1,
-0.7834114, -0.1362815, -1.494804, 1, 0, 0, 1, 1,
-0.7831825, -1.721874, -3.03766, 1, 0, 0, 1, 1,
-0.779115, 2.0418, -0.2905912, 0, 0, 0, 1, 1,
-0.778412, -1.353556, -3.176157, 0, 0, 0, 1, 1,
-0.7773508, 1.603827, 0.4796053, 0, 0, 0, 1, 1,
-0.77654, -0.9860338, -2.032823, 0, 0, 0, 1, 1,
-0.7758586, 0.1521937, -2.085861, 0, 0, 0, 1, 1,
-0.7754406, 0.2162742, -0.3405824, 0, 0, 0, 1, 1,
-0.7726683, 0.709682, 0.5954619, 0, 0, 0, 1, 1,
-0.7722796, -0.4097086, -2.893421, 1, 1, 1, 1, 1,
-0.769688, 0.3137837, -0.3249628, 1, 1, 1, 1, 1,
-0.7444896, -0.1323228, -0.6373895, 1, 1, 1, 1, 1,
-0.7426894, 0.3419897, -1.241996, 1, 1, 1, 1, 1,
-0.7422302, -1.055028, -1.35537, 1, 1, 1, 1, 1,
-0.7389225, -0.7276568, -2.608639, 1, 1, 1, 1, 1,
-0.7374465, -0.9050963, -1.729807, 1, 1, 1, 1, 1,
-0.7365118, -1.467031, -2.10785, 1, 1, 1, 1, 1,
-0.7364518, 2.067463, -0.7215966, 1, 1, 1, 1, 1,
-0.7330357, 0.7005551, -0.3826464, 1, 1, 1, 1, 1,
-0.7314138, -1.159572, -1.794056, 1, 1, 1, 1, 1,
-0.7266646, -0.2068342, -2.0048, 1, 1, 1, 1, 1,
-0.7173761, -1.381973, -3.623002, 1, 1, 1, 1, 1,
-0.7133163, -0.9870753, -2.145182, 1, 1, 1, 1, 1,
-0.7100317, 1.190988, 1.176024, 1, 1, 1, 1, 1,
-0.6999415, -0.396037, 0.01636104, 0, 0, 1, 1, 1,
-0.6993992, 1.316696, -0.02142984, 1, 0, 0, 1, 1,
-0.6990913, 1.546806, -0.798803, 1, 0, 0, 1, 1,
-0.6955869, 0.1654986, -1.522972, 1, 0, 0, 1, 1,
-0.6926455, -0.5552297, -3.842489, 1, 0, 0, 1, 1,
-0.6919543, -0.470387, -2.54146, 1, 0, 0, 1, 1,
-0.6883629, 0.1994255, 0.02785783, 0, 0, 0, 1, 1,
-0.6859362, 1.859864, -0.6078472, 0, 0, 0, 1, 1,
-0.6852394, 1.596084, -0.5666814, 0, 0, 0, 1, 1,
-0.6826945, 0.04366092, -1.783669, 0, 0, 0, 1, 1,
-0.6767519, 1.429739, -0.3284593, 0, 0, 0, 1, 1,
-0.6747909, 0.06781332, -2.041086, 0, 0, 0, 1, 1,
-0.667536, -0.4611259, -3.309318, 0, 0, 0, 1, 1,
-0.6650493, 0.6157307, 1.153078, 1, 1, 1, 1, 1,
-0.6580522, 1.42752, 0.4210037, 1, 1, 1, 1, 1,
-0.6546254, -0.07002391, -2.130129, 1, 1, 1, 1, 1,
-0.6538855, -1.711979, -2.207247, 1, 1, 1, 1, 1,
-0.6523648, -0.05410732, -0.5627515, 1, 1, 1, 1, 1,
-0.6473958, -0.4330862, -1.809858, 1, 1, 1, 1, 1,
-0.6330647, 0.5905292, -0.9413203, 1, 1, 1, 1, 1,
-0.6330121, 1.812144, -2.529223, 1, 1, 1, 1, 1,
-0.6278592, 0.1893326, 0.2797349, 1, 1, 1, 1, 1,
-0.6277669, 0.8806317, -0.2056009, 1, 1, 1, 1, 1,
-0.6236619, 0.8403919, -1.268025, 1, 1, 1, 1, 1,
-0.6217601, 0.2122561, -1.594695, 1, 1, 1, 1, 1,
-0.6143791, -0.9522955, -4.354144, 1, 1, 1, 1, 1,
-0.603923, 0.560101, -0.7668531, 1, 1, 1, 1, 1,
-0.601231, 1.253835, 0.1720369, 1, 1, 1, 1, 1,
-0.600585, 0.2415772, -1.078351, 0, 0, 1, 1, 1,
-0.5998589, 0.1323028, -0.08171347, 1, 0, 0, 1, 1,
-0.5996993, 0.7690542, -0.06995269, 1, 0, 0, 1, 1,
-0.598103, -0.4971023, -2.330474, 1, 0, 0, 1, 1,
-0.5964721, 1.764735, -1.304851, 1, 0, 0, 1, 1,
-0.5916281, -1.429177, -1.419628, 1, 0, 0, 1, 1,
-0.5876641, 0.5115754, -0.52605, 0, 0, 0, 1, 1,
-0.5855259, 0.219774, -1.234031, 0, 0, 0, 1, 1,
-0.5827436, 0.4465132, -1.935163, 0, 0, 0, 1, 1,
-0.5817958, -0.2010147, -2.058386, 0, 0, 0, 1, 1,
-0.5812312, -0.2666609, -1.892927, 0, 0, 0, 1, 1,
-0.5741922, -0.3615241, -1.193316, 0, 0, 0, 1, 1,
-0.5741443, -1.488881, -3.538558, 0, 0, 0, 1, 1,
-0.5710959, -1.163562, -0.6122735, 1, 1, 1, 1, 1,
-0.569379, -2.272303, -3.005444, 1, 1, 1, 1, 1,
-0.5651166, 2.284079, -1.784967, 1, 1, 1, 1, 1,
-0.5564588, 1.372685, -1.190574, 1, 1, 1, 1, 1,
-0.5563408, 0.7516931, -1.164518, 1, 1, 1, 1, 1,
-0.5505394, -0.5748452, -4.279128, 1, 1, 1, 1, 1,
-0.5492027, -0.2938063, -3.367661, 1, 1, 1, 1, 1,
-0.5461358, -0.1986533, -3.32998, 1, 1, 1, 1, 1,
-0.5455511, -1.440433, -1.706533, 1, 1, 1, 1, 1,
-0.5444037, 0.4678257, 0.1764397, 1, 1, 1, 1, 1,
-0.5436468, 0.4999718, -0.6764588, 1, 1, 1, 1, 1,
-0.5428935, 0.2360208, -1.276536, 1, 1, 1, 1, 1,
-0.538744, 1.101128, 1.561443, 1, 1, 1, 1, 1,
-0.5340829, -0.3684665, -2.626662, 1, 1, 1, 1, 1,
-0.5267344, 0.294282, -1.762475, 1, 1, 1, 1, 1,
-0.5224969, -0.7499273, -1.466286, 0, 0, 1, 1, 1,
-0.5214527, 0.8251098, -1.794386, 1, 0, 0, 1, 1,
-0.520555, 1.037799, -0.5509174, 1, 0, 0, 1, 1,
-0.5158778, 2.015928, -0.9171778, 1, 0, 0, 1, 1,
-0.515415, 0.03147301, -1.776454, 1, 0, 0, 1, 1,
-0.5121563, 0.1668492, -0.7740669, 1, 0, 0, 1, 1,
-0.5111536, -1.354808, -3.130431, 0, 0, 0, 1, 1,
-0.5031285, 1.305774, -0.9023273, 0, 0, 0, 1, 1,
-0.5012639, -0.9444161, -0.523581, 0, 0, 0, 1, 1,
-0.4998384, 1.319191, 0.01804096, 0, 0, 0, 1, 1,
-0.4914887, 0.1443952, -1.864211, 0, 0, 0, 1, 1,
-0.4860192, -1.000917, -1.975359, 0, 0, 0, 1, 1,
-0.4737036, 0.8926531, -0.8343819, 0, 0, 0, 1, 1,
-0.4670005, 0.1302311, -0.3007002, 1, 1, 1, 1, 1,
-0.4632888, -0.1961173, -2.189468, 1, 1, 1, 1, 1,
-0.4560887, -2.087965, -2.730961, 1, 1, 1, 1, 1,
-0.4494241, -0.1681793, -2.277947, 1, 1, 1, 1, 1,
-0.4471768, 0.429161, 0.5542, 1, 1, 1, 1, 1,
-0.4444406, -0.1219027, -2.577353, 1, 1, 1, 1, 1,
-0.440922, 1.420168, 1.248736, 1, 1, 1, 1, 1,
-0.4380907, -2.104269, -3.962357, 1, 1, 1, 1, 1,
-0.4380637, -0.4522254, -2.011074, 1, 1, 1, 1, 1,
-0.4335942, -0.9029193, -3.159373, 1, 1, 1, 1, 1,
-0.4309655, 1.377008, 0.8052143, 1, 1, 1, 1, 1,
-0.430743, 0.9360367, -0.1462907, 1, 1, 1, 1, 1,
-0.4269649, 0.5436218, -0.3840061, 1, 1, 1, 1, 1,
-0.426311, 0.65929, 0.7242069, 1, 1, 1, 1, 1,
-0.4197806, -0.8873944, -3.035825, 1, 1, 1, 1, 1,
-0.4191497, 1.547084, -2.237194, 0, 0, 1, 1, 1,
-0.4184005, 0.2258642, -1.590416, 1, 0, 0, 1, 1,
-0.4175647, -0.3983326, -3.045308, 1, 0, 0, 1, 1,
-0.4171646, -0.1367555, -2.020989, 1, 0, 0, 1, 1,
-0.4147869, 0.5629321, -0.8363185, 1, 0, 0, 1, 1,
-0.4131921, -0.05884223, -1.1082, 1, 0, 0, 1, 1,
-0.4110008, 1.021286, 0.3339017, 0, 0, 0, 1, 1,
-0.4090579, -0.4606341, -2.724681, 0, 0, 0, 1, 1,
-0.4075747, -0.4458668, -1.367334, 0, 0, 0, 1, 1,
-0.4037784, -0.2834973, -4.099885, 0, 0, 0, 1, 1,
-0.4035286, -1.818523, -1.367751, 0, 0, 0, 1, 1,
-0.4017553, -0.01026908, 0.2677874, 0, 0, 0, 1, 1,
-0.395517, 0.4335872, 0.3987817, 0, 0, 0, 1, 1,
-0.3949068, -0.5271068, -2.399521, 1, 1, 1, 1, 1,
-0.3905133, -1.786541, -3.708641, 1, 1, 1, 1, 1,
-0.3858692, -0.6432058, -2.0328, 1, 1, 1, 1, 1,
-0.3851465, 4.311839, 1.279775, 1, 1, 1, 1, 1,
-0.3849322, -1.815895, -3.597296, 1, 1, 1, 1, 1,
-0.3847057, -0.6994491, -2.440751, 1, 1, 1, 1, 1,
-0.3830226, 1.707609, -1.623593, 1, 1, 1, 1, 1,
-0.382155, 1.239391, -0.269875, 1, 1, 1, 1, 1,
-0.379109, 0.9353891, -0.257611, 1, 1, 1, 1, 1,
-0.3785916, 1.407693, -1.58519, 1, 1, 1, 1, 1,
-0.3680808, 1.016178, -1.693015, 1, 1, 1, 1, 1,
-0.3678932, 0.6651222, -1.327644, 1, 1, 1, 1, 1,
-0.3672616, 0.06203451, -2.875316, 1, 1, 1, 1, 1,
-0.3660795, -0.3552805, -1.060305, 1, 1, 1, 1, 1,
-0.3584826, 0.2703702, 1.403375, 1, 1, 1, 1, 1,
-0.3566419, -1.16727, -3.051733, 0, 0, 1, 1, 1,
-0.3565252, 0.349248, -1.205225, 1, 0, 0, 1, 1,
-0.3548984, -0.174703, -3.778131, 1, 0, 0, 1, 1,
-0.3533596, 0.1656601, 0.827181, 1, 0, 0, 1, 1,
-0.3511563, -0.5603216, -2.629658, 1, 0, 0, 1, 1,
-0.3503823, 0.3455463, -0.3402343, 1, 0, 0, 1, 1,
-0.3414346, 0.6561195, -2.065333, 0, 0, 0, 1, 1,
-0.3372039, -1.873243, -1.613457, 0, 0, 0, 1, 1,
-0.3358801, -0.03363591, -2.678314, 0, 0, 0, 1, 1,
-0.3296502, 1.488018, -0.6078501, 0, 0, 0, 1, 1,
-0.3284883, 0.9815761, -1.233001, 0, 0, 0, 1, 1,
-0.3250928, -0.002402482, -1.400653, 0, 0, 0, 1, 1,
-0.32476, 0.02685325, -2.002551, 0, 0, 0, 1, 1,
-0.321099, -1.755351, -3.502414, 1, 1, 1, 1, 1,
-0.3193175, -0.3959341, -2.102503, 1, 1, 1, 1, 1,
-0.3173101, -1.483929, -2.103928, 1, 1, 1, 1, 1,
-0.317191, 0.07831313, -1.574988, 1, 1, 1, 1, 1,
-0.3167192, 0.8128414, -0.5818918, 1, 1, 1, 1, 1,
-0.31657, 2.009733, -1.436944, 1, 1, 1, 1, 1,
-0.3152814, 0.8093655, -1.899076, 1, 1, 1, 1, 1,
-0.3152447, -1.731545, -1.103778, 1, 1, 1, 1, 1,
-0.3152258, 1.26292, -1.688995, 1, 1, 1, 1, 1,
-0.3116275, 0.110703, -2.513067, 1, 1, 1, 1, 1,
-0.3103825, -0.04291402, -2.04672, 1, 1, 1, 1, 1,
-0.3102652, -0.02176719, -1.450015, 1, 1, 1, 1, 1,
-0.3083518, -1.511301, -3.52122, 1, 1, 1, 1, 1,
-0.3073631, 1.454761, 0.0561077, 1, 1, 1, 1, 1,
-0.3046218, 1.502243, -0.3026225, 1, 1, 1, 1, 1,
-0.3008974, 0.1545176, -0.7615331, 0, 0, 1, 1, 1,
-0.2960052, 0.812961, -0.4518358, 1, 0, 0, 1, 1,
-0.2951908, 0.8184874, 0.4150874, 1, 0, 0, 1, 1,
-0.2913814, 0.9861348, 0.1667984, 1, 0, 0, 1, 1,
-0.2911383, -0.4297391, -4.895016, 1, 0, 0, 1, 1,
-0.2892939, -0.7837481, -3.922363, 1, 0, 0, 1, 1,
-0.2889984, 1.358842, -0.4105298, 0, 0, 0, 1, 1,
-0.2804286, 0.1984878, 0.3009078, 0, 0, 0, 1, 1,
-0.280134, 0.8074073, 1.045078, 0, 0, 0, 1, 1,
-0.2757252, 0.5765817, -0.4177825, 0, 0, 0, 1, 1,
-0.2740441, 1.681198, -0.4209523, 0, 0, 0, 1, 1,
-0.2731644, -0.3687201, -3.109679, 0, 0, 0, 1, 1,
-0.2719241, 1.103865, 0.3431461, 0, 0, 0, 1, 1,
-0.2710461, 0.3438898, 0.2784318, 1, 1, 1, 1, 1,
-0.2696814, -0.5164495, -2.215215, 1, 1, 1, 1, 1,
-0.2670656, 0.2317049, 0.03079903, 1, 1, 1, 1, 1,
-0.2650273, 1.822722, 0.5648797, 1, 1, 1, 1, 1,
-0.2618698, 0.39004, -0.6463893, 1, 1, 1, 1, 1,
-0.2533555, -2.796737, -3.02926, 1, 1, 1, 1, 1,
-0.2520714, -0.936569, -1.651133, 1, 1, 1, 1, 1,
-0.2487559, 1.716757, -0.7349278, 1, 1, 1, 1, 1,
-0.2478489, -0.7125114, -2.967377, 1, 1, 1, 1, 1,
-0.2478107, 0.2302696, -1.794284, 1, 1, 1, 1, 1,
-0.2452433, -1.054668, -3.556471, 1, 1, 1, 1, 1,
-0.2446239, 1.538022, 0.2112196, 1, 1, 1, 1, 1,
-0.23821, 1.825525, -0.2609243, 1, 1, 1, 1, 1,
-0.2339795, -0.5608945, -2.740876, 1, 1, 1, 1, 1,
-0.2328453, -1.231092, -4.164547, 1, 1, 1, 1, 1,
-0.2323291, 1.193413, -0.3354673, 0, 0, 1, 1, 1,
-0.2311115, 2.107847, 1.703813, 1, 0, 0, 1, 1,
-0.2255101, -0.8459326, -2.77708, 1, 0, 0, 1, 1,
-0.2249998, -1.182113, -2.695405, 1, 0, 0, 1, 1,
-0.2216176, 1.486735, 1.369415, 1, 0, 0, 1, 1,
-0.2194556, -1.654978, -2.203601, 1, 0, 0, 1, 1,
-0.2162583, 0.5099432, -1.140014, 0, 0, 0, 1, 1,
-0.2160389, 0.3739215, 0.2195948, 0, 0, 0, 1, 1,
-0.2147981, -0.3177581, -2.100091, 0, 0, 0, 1, 1,
-0.2135043, 0.029766, -0.9062556, 0, 0, 0, 1, 1,
-0.2117964, 0.3608256, 1.160443, 0, 0, 0, 1, 1,
-0.2109182, 0.9892076, -0.3715966, 0, 0, 0, 1, 1,
-0.2055999, -1.249557, -3.272913, 0, 0, 0, 1, 1,
-0.2032777, -1.569898, -2.5851, 1, 1, 1, 1, 1,
-0.2027782, -1.76179, -3.587891, 1, 1, 1, 1, 1,
-0.202114, -0.912245, -4.885964, 1, 1, 1, 1, 1,
-0.2015256, -0.8403893, -0.2645785, 1, 1, 1, 1, 1,
-0.1991427, -0.2742441, -2.748902, 1, 1, 1, 1, 1,
-0.1970991, 0.3881765, -2.23356, 1, 1, 1, 1, 1,
-0.1956784, 1.209946, 0.6186439, 1, 1, 1, 1, 1,
-0.1907727, -0.8656491, -3.994037, 1, 1, 1, 1, 1,
-0.1904603, -1.288609, -3.697834, 1, 1, 1, 1, 1,
-0.1903271, -1.135359, -2.989903, 1, 1, 1, 1, 1,
-0.1896114, -0.48617, -2.911496, 1, 1, 1, 1, 1,
-0.1868697, 2.038697, 0.009347859, 1, 1, 1, 1, 1,
-0.1838131, 0.7742596, 0.4547683, 1, 1, 1, 1, 1,
-0.1836799, -0.3010495, -2.222037, 1, 1, 1, 1, 1,
-0.1792915, -1.042266, -3.170316, 1, 1, 1, 1, 1,
-0.1770366, 0.4682722, -1.543256, 0, 0, 1, 1, 1,
-0.1765267, -1.107411, -3.833862, 1, 0, 0, 1, 1,
-0.1752153, 0.05794647, -1.147201, 1, 0, 0, 1, 1,
-0.1745723, -1.365507, -4.226621, 1, 0, 0, 1, 1,
-0.1742038, -0.5338782, -4.748547, 1, 0, 0, 1, 1,
-0.1730728, -0.7999008, -2.332426, 1, 0, 0, 1, 1,
-0.1695886, -0.1557748, -4.126893, 0, 0, 0, 1, 1,
-0.1691944, -1.062466, -3.352396, 0, 0, 0, 1, 1,
-0.1683842, 1.25207, 0.8186933, 0, 0, 0, 1, 1,
-0.1682935, -0.8400322, -3.072888, 0, 0, 0, 1, 1,
-0.1674084, -1.813018, -2.73032, 0, 0, 0, 1, 1,
-0.1662363, -0.7551603, -4.542574, 0, 0, 0, 1, 1,
-0.1657566, 0.5368978, -0.8546761, 0, 0, 0, 1, 1,
-0.1649854, 1.332896, -0.6706752, 1, 1, 1, 1, 1,
-0.1606324, 1.728194, 1.60361, 1, 1, 1, 1, 1,
-0.1589483, 0.8614627, -1.549509, 1, 1, 1, 1, 1,
-0.157425, -0.4741908, -2.409806, 1, 1, 1, 1, 1,
-0.1573604, -1.09096, -2.983094, 1, 1, 1, 1, 1,
-0.1553945, -1.694466, -2.503823, 1, 1, 1, 1, 1,
-0.1544883, -0.4145363, -3.028267, 1, 1, 1, 1, 1,
-0.1509118, 0.3542614, 0.1911419, 1, 1, 1, 1, 1,
-0.1492936, -0.3577617, -3.752611, 1, 1, 1, 1, 1,
-0.142674, 0.3985278, 0.7964239, 1, 1, 1, 1, 1,
-0.1408003, -1.490042, -2.386023, 1, 1, 1, 1, 1,
-0.1369762, 0.3609517, -2.034518, 1, 1, 1, 1, 1,
-0.1302387, -0.4112796, -3.599046, 1, 1, 1, 1, 1,
-0.1291484, -0.5913737, -2.858715, 1, 1, 1, 1, 1,
-0.1282367, -1.507592, -3.797027, 1, 1, 1, 1, 1,
-0.1220732, 0.07456063, -0.324137, 0, 0, 1, 1, 1,
-0.1219568, 0.4906168, -0.8134754, 1, 0, 0, 1, 1,
-0.119536, -1.430648, -3.543638, 1, 0, 0, 1, 1,
-0.1191652, -0.5274357, -2.866722, 1, 0, 0, 1, 1,
-0.1158779, 1.310186, -0.1635158, 1, 0, 0, 1, 1,
-0.1134531, 2.232817, 1.53028, 1, 0, 0, 1, 1,
-0.1047944, 0.2861543, 0.5006977, 0, 0, 0, 1, 1,
-0.09911026, -1.062853, -3.440777, 0, 0, 0, 1, 1,
-0.09555083, -0.8426031, -4.778973, 0, 0, 0, 1, 1,
-0.09330241, 1.138843, -1.376852, 0, 0, 0, 1, 1,
-0.09306122, -1.382817, -3.15519, 0, 0, 0, 1, 1,
-0.09246721, 0.007971128, -2.363654, 0, 0, 0, 1, 1,
-0.09041089, -1.038676, -2.54336, 0, 0, 0, 1, 1,
-0.08851097, 0.440174, -2.074828, 1, 1, 1, 1, 1,
-0.08568199, -0.03367585, 0.06460173, 1, 1, 1, 1, 1,
-0.08269284, 0.08177405, 0.3398669, 1, 1, 1, 1, 1,
-0.08158842, -0.4252664, -2.034254, 1, 1, 1, 1, 1,
-0.07685215, 1.098999, 0.3331233, 1, 1, 1, 1, 1,
-0.07209706, 1.94513, 1.121597, 1, 1, 1, 1, 1,
-0.06983989, 0.7123363, -0.5988217, 1, 1, 1, 1, 1,
-0.06869041, -0.1261753, -2.702098, 1, 1, 1, 1, 1,
-0.0613209, 1.651541, -0.4547803, 1, 1, 1, 1, 1,
-0.05775081, -1.780519, -4.050329, 1, 1, 1, 1, 1,
-0.05513555, -0.06111725, -2.17758, 1, 1, 1, 1, 1,
-0.05140429, -0.3617486, -3.972414, 1, 1, 1, 1, 1,
-0.04861792, 1.881259, 0.8909484, 1, 1, 1, 1, 1,
-0.04103811, -0.5312479, -5.590733, 1, 1, 1, 1, 1,
-0.03837069, -0.1109463, -4.243293, 1, 1, 1, 1, 1,
-0.03512649, -0.2179929, -2.987984, 0, 0, 1, 1, 1,
-0.03292122, -0.3661392, -2.705009, 1, 0, 0, 1, 1,
-0.03260807, -0.2406348, -2.628347, 1, 0, 0, 1, 1,
-0.02767481, -1.590668, -4.334834, 1, 0, 0, 1, 1,
-0.02764935, -0.1853957, -4.230539, 1, 0, 0, 1, 1,
-0.02196625, 0.3508651, 0.02783274, 1, 0, 0, 1, 1,
-0.02161214, 0.5987594, 0.7868443, 0, 0, 0, 1, 1,
-0.02039663, -1.205069, -2.432039, 0, 0, 0, 1, 1,
-0.01803802, 0.820971, -0.3388107, 0, 0, 0, 1, 1,
-0.01696328, 2.937328, -1.197237, 0, 0, 0, 1, 1,
-0.01627032, 0.1656412, -0.4964705, 0, 0, 0, 1, 1,
-0.01149539, 2.03484, -0.5671755, 0, 0, 0, 1, 1,
-0.01052354, 1.569034, -0.8916208, 0, 0, 0, 1, 1,
-0.007484928, 0.1466844, -1.232197, 1, 1, 1, 1, 1,
-0.005628195, -0.7331478, -3.706138, 1, 1, 1, 1, 1,
0.000536494, -1.311294, 2.365237, 1, 1, 1, 1, 1,
0.00198563, 0.51078, 0.9417988, 1, 1, 1, 1, 1,
0.002620989, -0.09727672, 5.196496, 1, 1, 1, 1, 1,
0.002717831, 0.7160299, -0.1229469, 1, 1, 1, 1, 1,
0.003807746, -0.4299775, 5.197425, 1, 1, 1, 1, 1,
0.005465141, 1.212148, -1.282516, 1, 1, 1, 1, 1,
0.005496275, 0.2561951, -0.3001108, 1, 1, 1, 1, 1,
0.006163673, -0.4939238, 1.220888, 1, 1, 1, 1, 1,
0.008438521, -0.4518035, 2.972093, 1, 1, 1, 1, 1,
0.01044554, 0.4054793, -0.9215167, 1, 1, 1, 1, 1,
0.01057653, 0.6584813, -0.8887517, 1, 1, 1, 1, 1,
0.01073431, 0.6601708, 0.9839271, 1, 1, 1, 1, 1,
0.01720784, 0.9838936, 1.641034, 1, 1, 1, 1, 1,
0.01730364, -2.305684, 1.643165, 0, 0, 1, 1, 1,
0.01849673, -0.8297558, 2.352976, 1, 0, 0, 1, 1,
0.0189683, 0.8729663, 0.6127132, 1, 0, 0, 1, 1,
0.02087997, -0.1101186, 2.738214, 1, 0, 0, 1, 1,
0.02162242, -0.02962782, 3.491898, 1, 0, 0, 1, 1,
0.03044888, 0.4744809, -0.1741869, 1, 0, 0, 1, 1,
0.03085965, 0.8987034, -0.747495, 0, 0, 0, 1, 1,
0.03512375, -0.3715896, 3.686339, 0, 0, 0, 1, 1,
0.0400675, -0.5056185, 3.005121, 0, 0, 0, 1, 1,
0.04098227, 1.183856, 0.2299949, 0, 0, 0, 1, 1,
0.04406495, 0.4072228, 0.6872177, 0, 0, 0, 1, 1,
0.04839266, -0.3468188, 3.291504, 0, 0, 0, 1, 1,
0.04970014, -0.0238962, 3.345519, 0, 0, 0, 1, 1,
0.05183694, 0.8946246, -0.7138301, 1, 1, 1, 1, 1,
0.05206037, -1.434921, 1.532765, 1, 1, 1, 1, 1,
0.05962875, -0.9692751, 2.226842, 1, 1, 1, 1, 1,
0.07183272, 0.8067083, 0.6850961, 1, 1, 1, 1, 1,
0.07310668, -0.5422017, 2.198151, 1, 1, 1, 1, 1,
0.07918321, 0.4933725, -1.069652, 1, 1, 1, 1, 1,
0.08132186, 1.434919, 0.6275514, 1, 1, 1, 1, 1,
0.08309036, 0.9276367, -0.5195717, 1, 1, 1, 1, 1,
0.08629557, -0.2381335, 1.234274, 1, 1, 1, 1, 1,
0.09427814, -0.0511658, 2.661975, 1, 1, 1, 1, 1,
0.09812763, -2.568038, 4.324215, 1, 1, 1, 1, 1,
0.09957045, -0.5459359, 0.8123861, 1, 1, 1, 1, 1,
0.1022783, 1.29144, 0.9581974, 1, 1, 1, 1, 1,
0.1023794, 1.027128, 0.5981165, 1, 1, 1, 1, 1,
0.1025863, -0.1511745, 0.3238464, 1, 1, 1, 1, 1,
0.1033823, 1.057218, -0.7947495, 0, 0, 1, 1, 1,
0.1039913, 0.3504087, 0.8010934, 1, 0, 0, 1, 1,
0.104825, -0.1880353, 1.660818, 1, 0, 0, 1, 1,
0.1053745, -1.21938, 3.978316, 1, 0, 0, 1, 1,
0.1095704, -1.421682, 2.668963, 1, 0, 0, 1, 1,
0.1103728, 0.3150009, -0.6213991, 1, 0, 0, 1, 1,
0.1111751, 1.739115, 0.7275636, 0, 0, 0, 1, 1,
0.1136589, -0.6657878, 2.160364, 0, 0, 0, 1, 1,
0.113671, -1.636958, 3.445444, 0, 0, 0, 1, 1,
0.1148613, -0.61408, 3.014339, 0, 0, 0, 1, 1,
0.1182629, -1.597011, 3.065259, 0, 0, 0, 1, 1,
0.1197369, -1.185045, 3.768349, 0, 0, 0, 1, 1,
0.1200552, -1.097513, 4.14761, 0, 0, 0, 1, 1,
0.1285634, -1.223734, 4.671259, 1, 1, 1, 1, 1,
0.1287667, -0.4086491, 1.531814, 1, 1, 1, 1, 1,
0.1315459, -0.04428856, 1.124896, 1, 1, 1, 1, 1,
0.1326077, 0.7863587, -0.2772595, 1, 1, 1, 1, 1,
0.1381194, 1.442102, 2.03202, 1, 1, 1, 1, 1,
0.1387347, 0.03101225, 2.060605, 1, 1, 1, 1, 1,
0.1505843, 0.6773041, -1.694265, 1, 1, 1, 1, 1,
0.1550261, -0.5167573, 2.349721, 1, 1, 1, 1, 1,
0.1556928, 0.294538, 0.7228364, 1, 1, 1, 1, 1,
0.1654882, 0.8734888, 0.04838156, 1, 1, 1, 1, 1,
0.1664089, -1.468465, 2.4788, 1, 1, 1, 1, 1,
0.1683458, -0.6483659, 2.577172, 1, 1, 1, 1, 1,
0.1719711, 2.463072, 1.502628, 1, 1, 1, 1, 1,
0.1737129, -0.8070203, 2.972505, 1, 1, 1, 1, 1,
0.174016, -0.7851024, 3.880977, 1, 1, 1, 1, 1,
0.1749097, 0.4331622, 0.1942295, 0, 0, 1, 1, 1,
0.1751912, 0.3492444, -0.368714, 1, 0, 0, 1, 1,
0.1773929, -1.650381, 2.176779, 1, 0, 0, 1, 1,
0.1793236, 0.6902039, 0.2549232, 1, 0, 0, 1, 1,
0.1796052, -0.2811297, 1.929528, 1, 0, 0, 1, 1,
0.1807681, 0.1512466, -0.2793174, 1, 0, 0, 1, 1,
0.1826548, -0.4950224, 3.668062, 0, 0, 0, 1, 1,
0.1827067, -0.6676077, 3.196314, 0, 0, 0, 1, 1,
0.1849703, -0.0656605, 3.108904, 0, 0, 0, 1, 1,
0.1927331, 1.901601, -0.04178809, 0, 0, 0, 1, 1,
0.1940853, 0.5777547, 1.065491, 0, 0, 0, 1, 1,
0.1943619, 0.4662338, -2.166912, 0, 0, 0, 1, 1,
0.1951797, -0.1723429, 2.898553, 0, 0, 0, 1, 1,
0.1981968, 1.03614, 0.9110816, 1, 1, 1, 1, 1,
0.2014707, -0.4338529, 3.251959, 1, 1, 1, 1, 1,
0.2051824, 0.6626923, 0.7851725, 1, 1, 1, 1, 1,
0.2054168, 0.5953804, 0.5396118, 1, 1, 1, 1, 1,
0.2084178, 1.738015, 1.019411, 1, 1, 1, 1, 1,
0.2119157, 0.2267693, -0.02942023, 1, 1, 1, 1, 1,
0.2144123, 0.9754375, 1.748096, 1, 1, 1, 1, 1,
0.217336, 0.9978307, 0.986591, 1, 1, 1, 1, 1,
0.2207471, 1.557405, -0.6487516, 1, 1, 1, 1, 1,
0.2245865, 0.6972317, 0.5340527, 1, 1, 1, 1, 1,
0.2261962, 1.838209, 1.046929, 1, 1, 1, 1, 1,
0.2273291, 0.392485, 1.855978, 1, 1, 1, 1, 1,
0.2284447, 0.1055869, 0.773734, 1, 1, 1, 1, 1,
0.2292161, 0.7138252, 1.759385, 1, 1, 1, 1, 1,
0.2300387, 1.302488, 0.2528752, 1, 1, 1, 1, 1,
0.2329046, -1.916388, 3.261614, 0, 0, 1, 1, 1,
0.2368551, -0.5145385, 3.267196, 1, 0, 0, 1, 1,
0.2372228, -0.6202786, 2.864583, 1, 0, 0, 1, 1,
0.2404278, 1.173418, -0.9710724, 1, 0, 0, 1, 1,
0.242171, -0.3751103, 3.747344, 1, 0, 0, 1, 1,
0.2450209, -0.3540067, 3.878023, 1, 0, 0, 1, 1,
0.2456799, 0.3331932, -0.4658226, 0, 0, 0, 1, 1,
0.245772, 0.2256989, -0.3731333, 0, 0, 0, 1, 1,
0.2481733, 2.314075, 1.18193, 0, 0, 0, 1, 1,
0.2498424, -0.69745, 1.601282, 0, 0, 0, 1, 1,
0.2514043, -0.5553956, 2.0656, 0, 0, 0, 1, 1,
0.2522268, -1.534227, 2.498273, 0, 0, 0, 1, 1,
0.2558443, -0.5270557, 3.280895, 0, 0, 0, 1, 1,
0.2609873, 0.3416992, 0.8444316, 1, 1, 1, 1, 1,
0.2614518, -0.2206201, 2.586741, 1, 1, 1, 1, 1,
0.2635555, -1.302476, 4.366574, 1, 1, 1, 1, 1,
0.2670783, -1.020989, 2.742888, 1, 1, 1, 1, 1,
0.2688629, -1.390725, 4.86253, 1, 1, 1, 1, 1,
0.2745684, -0.7302342, 2.659065, 1, 1, 1, 1, 1,
0.2817347, -1.798052, 3.87196, 1, 1, 1, 1, 1,
0.2870165, 0.3482171, 0.8125651, 1, 1, 1, 1, 1,
0.2877291, 0.9712421, 0.07252933, 1, 1, 1, 1, 1,
0.2915435, 0.7929144, -0.1057087, 1, 1, 1, 1, 1,
0.2921122, -0.3293601, 2.796493, 1, 1, 1, 1, 1,
0.2932883, 0.2175081, 0.9519093, 1, 1, 1, 1, 1,
0.295144, 0.6229569, -1.164457, 1, 1, 1, 1, 1,
0.2963047, -0.7754045, 0.9530198, 1, 1, 1, 1, 1,
0.2963356, -0.007726677, 2.417091, 1, 1, 1, 1, 1,
0.2968014, 1.465003, 0.05043714, 0, 0, 1, 1, 1,
0.3039781, -0.2139674, 1.605301, 1, 0, 0, 1, 1,
0.3044406, 0.3627136, 2.10708, 1, 0, 0, 1, 1,
0.3052767, -1.332851, 4.19429, 1, 0, 0, 1, 1,
0.3076093, -0.02440723, 0.5891224, 1, 0, 0, 1, 1,
0.3083926, -0.4770817, 3.11046, 1, 0, 0, 1, 1,
0.3090583, 0.5093278, -0.513611, 0, 0, 0, 1, 1,
0.312914, 0.8105162, 0.6279292, 0, 0, 0, 1, 1,
0.312923, -0.1113568, 3.872069, 0, 0, 0, 1, 1,
0.3138754, 0.09920535, 1.352809, 0, 0, 0, 1, 1,
0.3190692, 0.7229626, -1.641229, 0, 0, 0, 1, 1,
0.3225446, -0.6142707, 2.663119, 0, 0, 0, 1, 1,
0.3239353, 1.167484, 0.6533769, 0, 0, 0, 1, 1,
0.3251049, -0.6397491, 2.438348, 1, 1, 1, 1, 1,
0.3266786, -1.670318, 2.500026, 1, 1, 1, 1, 1,
0.3275234, 0.07995606, 1.210413, 1, 1, 1, 1, 1,
0.3289671, 0.5661516, 1.10116, 1, 1, 1, 1, 1,
0.3304496, 0.4065731, 1.239507, 1, 1, 1, 1, 1,
0.3365774, -0.2025202, -0.1019909, 1, 1, 1, 1, 1,
0.336601, -0.9502953, 1.466563, 1, 1, 1, 1, 1,
0.3410265, 1.888637, 1.281111, 1, 1, 1, 1, 1,
0.3442616, -0.4556912, 1.212845, 1, 1, 1, 1, 1,
0.3486416, 0.9844954, -1.085141, 1, 1, 1, 1, 1,
0.3514943, -0.8968015, 2.849523, 1, 1, 1, 1, 1,
0.3551888, -0.6469533, 3.494527, 1, 1, 1, 1, 1,
0.3581991, -1.759434, 1.615027, 1, 1, 1, 1, 1,
0.3594298, 0.9277711, 0.7852868, 1, 1, 1, 1, 1,
0.3597929, -0.3006672, 3.501006, 1, 1, 1, 1, 1,
0.3611607, -1.061801, 3.575105, 0, 0, 1, 1, 1,
0.3673854, -0.8711889, 3.485436, 1, 0, 0, 1, 1,
0.3827554, -1.121417, 1.799854, 1, 0, 0, 1, 1,
0.3846003, 0.6727768, 1.252392, 1, 0, 0, 1, 1,
0.3854276, 0.6572542, 0.6260163, 1, 0, 0, 1, 1,
0.3949225, 0.6448829, 1.231327, 1, 0, 0, 1, 1,
0.3984733, -2.037727, 1.926615, 0, 0, 0, 1, 1,
0.400262, 1.053124, -0.411323, 0, 0, 0, 1, 1,
0.4014184, 0.3611828, -0.6932704, 0, 0, 0, 1, 1,
0.4062226, 0.204602, 1.719987, 0, 0, 0, 1, 1,
0.4072342, -0.3021481, 1.049873, 0, 0, 0, 1, 1,
0.4099325, -0.1518922, 3.149475, 0, 0, 0, 1, 1,
0.4112768, -1.295517, 2.71144, 0, 0, 0, 1, 1,
0.4182484, -0.8721854, 2.298201, 1, 1, 1, 1, 1,
0.4218648, -0.4989095, 2.180346, 1, 1, 1, 1, 1,
0.4270836, -0.4024942, 1.166669, 1, 1, 1, 1, 1,
0.4339662, -0.5005536, 4.307173, 1, 1, 1, 1, 1,
0.4366032, 0.5353613, -0.1956008, 1, 1, 1, 1, 1,
0.4373931, -1.091594, 1.943486, 1, 1, 1, 1, 1,
0.4382922, -0.124964, 2.215199, 1, 1, 1, 1, 1,
0.4395163, 0.4856981, 2.214663, 1, 1, 1, 1, 1,
0.4426652, -0.4542111, 3.518763, 1, 1, 1, 1, 1,
0.4452392, 0.3184263, 0.649385, 1, 1, 1, 1, 1,
0.4463709, -0.3738064, 2.276973, 1, 1, 1, 1, 1,
0.450744, 1.715314, 0.6135936, 1, 1, 1, 1, 1,
0.4534303, 1.457334, -0.515174, 1, 1, 1, 1, 1,
0.4606227, 0.9879754, 0.1209058, 1, 1, 1, 1, 1,
0.4636486, 2.419751, 0.957523, 1, 1, 1, 1, 1,
0.4655763, 1.89643, 1.024068, 0, 0, 1, 1, 1,
0.4689958, -1.114972, 2.077782, 1, 0, 0, 1, 1,
0.4731253, -2.014676, 0.1370586, 1, 0, 0, 1, 1,
0.4768303, 1.390214, 0.2113386, 1, 0, 0, 1, 1,
0.4769354, 0.8169028, -0.7314957, 1, 0, 0, 1, 1,
0.483084, -1.984372, 3.404937, 1, 0, 0, 1, 1,
0.483156, -0.5914161, 3.183435, 0, 0, 0, 1, 1,
0.484063, 0.145339, 0.6306334, 0, 0, 0, 1, 1,
0.4853054, 2.196696, 0.6938959, 0, 0, 0, 1, 1,
0.4861308, -1.135106, 1.240932, 0, 0, 0, 1, 1,
0.4876215, -2.11279, 2.845551, 0, 0, 0, 1, 1,
0.4877791, -0.8485982, 3.363776, 0, 0, 0, 1, 1,
0.4912929, 1.339035, -1.021552, 0, 0, 0, 1, 1,
0.4912989, 0.4351557, 0.009935363, 1, 1, 1, 1, 1,
0.4960261, 0.1035252, 1.82068, 1, 1, 1, 1, 1,
0.4966106, 0.4838334, 1.611356, 1, 1, 1, 1, 1,
0.5005919, 1.345302, -0.7666546, 1, 1, 1, 1, 1,
0.5054227, -1.513026, 1.853927, 1, 1, 1, 1, 1,
0.5078288, -0.635983, 2.478742, 1, 1, 1, 1, 1,
0.509129, -0.8683331, 2.246381, 1, 1, 1, 1, 1,
0.5127513, -0.3140305, 1.741411, 1, 1, 1, 1, 1,
0.5151399, 0.1962751, 0.6607051, 1, 1, 1, 1, 1,
0.516265, -0.8971149, 1.483276, 1, 1, 1, 1, 1,
0.5170368, -1.383558, 1.75411, 1, 1, 1, 1, 1,
0.522136, -0.3689329, 2.256814, 1, 1, 1, 1, 1,
0.5228733, 2.172081, 1.642693, 1, 1, 1, 1, 1,
0.5309452, 0.989786, 0.3754421, 1, 1, 1, 1, 1,
0.53544, 1.204534, 1.175678, 1, 1, 1, 1, 1,
0.5382524, -0.009542561, 0.8499665, 0, 0, 1, 1, 1,
0.5406384, 0.6159635, 1.12539, 1, 0, 0, 1, 1,
0.5422784, 0.6012615, 0.9874243, 1, 0, 0, 1, 1,
0.5496262, 0.02307875, 2.66285, 1, 0, 0, 1, 1,
0.5496695, -1.069707, 2.959146, 1, 0, 0, 1, 1,
0.5514727, -0.1553257, 1.834603, 1, 0, 0, 1, 1,
0.5539573, -1.550727, 2.666945, 0, 0, 0, 1, 1,
0.5557224, -0.07182024, 0.1703564, 0, 0, 0, 1, 1,
0.5585074, -0.6770957, 0.8722451, 0, 0, 0, 1, 1,
0.5595931, 0.7409874, 1.490629, 0, 0, 0, 1, 1,
0.5628529, -0.4446483, 2.579846, 0, 0, 0, 1, 1,
0.5631607, -0.9230161, 3.863541, 0, 0, 0, 1, 1,
0.5643315, -0.7729757, 2.768802, 0, 0, 0, 1, 1,
0.5666893, 1.69697, 1.343806, 1, 1, 1, 1, 1,
0.5673974, 1.520883, 0.8049207, 1, 1, 1, 1, 1,
0.5772131, 0.439536, 0.1124299, 1, 1, 1, 1, 1,
0.5788545, 0.3980792, 1.466764, 1, 1, 1, 1, 1,
0.5800042, 0.9062327, 0.4168345, 1, 1, 1, 1, 1,
0.5839835, -0.3629836, 2.917004, 1, 1, 1, 1, 1,
0.5949336, 0.4969123, 0.531231, 1, 1, 1, 1, 1,
0.5958207, -1.57279, 1.028596, 1, 1, 1, 1, 1,
0.5964618, -1.199827, 1.789668, 1, 1, 1, 1, 1,
0.5975561, -2.114408, 2.60307, 1, 1, 1, 1, 1,
0.6068248, 1.110754, 0.9788691, 1, 1, 1, 1, 1,
0.619792, 0.8838612, -0.2691973, 1, 1, 1, 1, 1,
0.6219376, 1.282741, 1.400822, 1, 1, 1, 1, 1,
0.6280356, -1.11656, 3.134183, 1, 1, 1, 1, 1,
0.635813, 0.08761764, 1.099335, 1, 1, 1, 1, 1,
0.6373044, -1.33722, 3.321903, 0, 0, 1, 1, 1,
0.6422334, -1.210651, 0.4517091, 1, 0, 0, 1, 1,
0.6473424, -1.086972, 2.729572, 1, 0, 0, 1, 1,
0.6482177, -0.971866, 4.389949, 1, 0, 0, 1, 1,
0.6519751, -0.282293, 0.7171898, 1, 0, 0, 1, 1,
0.6544391, -0.5587463, 1.716038, 1, 0, 0, 1, 1,
0.6563092, -1.121009, 1.950667, 0, 0, 0, 1, 1,
0.6605921, 0.0776251, 0.8440414, 0, 0, 0, 1, 1,
0.6646581, -0.5844626, 2.125617, 0, 0, 0, 1, 1,
0.6649706, 0.4827044, 1.185869, 0, 0, 0, 1, 1,
0.6682382, 1.053136, 0.2050367, 0, 0, 0, 1, 1,
0.669318, -0.01177241, -0.4249661, 0, 0, 0, 1, 1,
0.6704181, -0.9176877, 2.948348, 0, 0, 0, 1, 1,
0.6718539, -0.4314502, 0.5560493, 1, 1, 1, 1, 1,
0.673026, 0.2245139, 2.211192, 1, 1, 1, 1, 1,
0.6733889, 0.3301258, 0.8453029, 1, 1, 1, 1, 1,
0.6769437, 1.511013, -0.1593451, 1, 1, 1, 1, 1,
0.677373, -0.4941937, 2.552919, 1, 1, 1, 1, 1,
0.6791247, -0.0142185, 1.953097, 1, 1, 1, 1, 1,
0.6805407, 0.161504, 1.064854, 1, 1, 1, 1, 1,
0.6891229, 0.255657, 0.5299886, 1, 1, 1, 1, 1,
0.6895246, 0.05638576, 0.4941031, 1, 1, 1, 1, 1,
0.69473, 0.5688814, 1.151879, 1, 1, 1, 1, 1,
0.695675, 1.213875, 1.618478, 1, 1, 1, 1, 1,
0.6957, 1.185973, 0.6333692, 1, 1, 1, 1, 1,
0.6963064, -1.191162, 2.685878, 1, 1, 1, 1, 1,
0.6963466, -1.462093, 1.407732, 1, 1, 1, 1, 1,
0.6991118, -1.684679, 3.070862, 1, 1, 1, 1, 1,
0.699991, 1.168357, 0.8433217, 0, 0, 1, 1, 1,
0.7022566, 2.284073, 2.03959, 1, 0, 0, 1, 1,
0.7080632, 0.7850344, 0.3097514, 1, 0, 0, 1, 1,
0.7131624, 0.4523983, 2.710639, 1, 0, 0, 1, 1,
0.7177704, -0.8129382, 2.460915, 1, 0, 0, 1, 1,
0.7177763, -2.021977, 2.683362, 1, 0, 0, 1, 1,
0.727384, 0.4967198, -0.7735254, 0, 0, 0, 1, 1,
0.7279742, -0.2038353, 1.435401, 0, 0, 0, 1, 1,
0.729086, 0.1746165, -1.57226, 0, 0, 0, 1, 1,
0.7385264, -0.3991959, 1.264557, 0, 0, 0, 1, 1,
0.738781, -0.3513921, 1.850774, 0, 0, 0, 1, 1,
0.7409589, 0.2367148, -0.1420725, 0, 0, 0, 1, 1,
0.7482381, 1.07742, 0.5301707, 0, 0, 0, 1, 1,
0.7495041, 0.7814295, 1.571216, 1, 1, 1, 1, 1,
0.7517606, 0.4192142, -0.4278593, 1, 1, 1, 1, 1,
0.7537163, -1.708136, 3.420512, 1, 1, 1, 1, 1,
0.7546991, -1.428591, 2.604674, 1, 1, 1, 1, 1,
0.7579601, 2.026479, 0.6469635, 1, 1, 1, 1, 1,
0.758329, -1.043672, 1.170976, 1, 1, 1, 1, 1,
0.7643628, 0.9636815, 0.2178415, 1, 1, 1, 1, 1,
0.7706617, -0.6465467, 0.6663634, 1, 1, 1, 1, 1,
0.7730666, -2.513559, 2.399481, 1, 1, 1, 1, 1,
0.7744738, -0.3319882, 2.839409, 1, 1, 1, 1, 1,
0.7744994, -0.5578071, 1.600569, 1, 1, 1, 1, 1,
0.7783176, 1.820841, 0.3100137, 1, 1, 1, 1, 1,
0.7876285, 0.9666728, 0.006730629, 1, 1, 1, 1, 1,
0.7954047, 0.5561624, 1.072629, 1, 1, 1, 1, 1,
0.7961928, 0.4884436, 0.9161042, 1, 1, 1, 1, 1,
0.7970588, -0.4949117, 3.292201, 0, 0, 1, 1, 1,
0.7972565, -1.844739, 0.9326012, 1, 0, 0, 1, 1,
0.7976274, -0.002370844, 1.00127, 1, 0, 0, 1, 1,
0.7977554, 1.053081, -0.1495095, 1, 0, 0, 1, 1,
0.8007393, 0.8229957, 1.795205, 1, 0, 0, 1, 1,
0.8010218, -0.3882763, 1.512908, 1, 0, 0, 1, 1,
0.8014591, -1.202811, 2.453399, 0, 0, 0, 1, 1,
0.8017432, -0.3986595, 1.812008, 0, 0, 0, 1, 1,
0.803384, -0.8990285, 3.331375, 0, 0, 0, 1, 1,
0.8087847, -0.9436787, 2.29569, 0, 0, 0, 1, 1,
0.8209423, 0.4457105, 0.4797711, 0, 0, 0, 1, 1,
0.8257784, -0.287034, 3.079985, 0, 0, 0, 1, 1,
0.8307157, -1.116884, 1.535411, 0, 0, 0, 1, 1,
0.8355793, 0.002712842, 2.168238, 1, 1, 1, 1, 1,
0.8361735, 0.0624301, 1.785995, 1, 1, 1, 1, 1,
0.8398088, 0.2702308, 0.536593, 1, 1, 1, 1, 1,
0.8399642, -1.066876, 2.999713, 1, 1, 1, 1, 1,
0.8412296, -0.9162211, 3.411535, 1, 1, 1, 1, 1,
0.8414053, 0.110107, 1.31886, 1, 1, 1, 1, 1,
0.8422289, -1.028091, 1.540265, 1, 1, 1, 1, 1,
0.8432478, 1.779082, 1.299139, 1, 1, 1, 1, 1,
0.8447837, -0.7184235, 0.7231258, 1, 1, 1, 1, 1,
0.8472011, 1.797433, 1.481342, 1, 1, 1, 1, 1,
0.8491526, -0.4010791, 1.606509, 1, 1, 1, 1, 1,
0.8497538, -1.527205, 2.235466, 1, 1, 1, 1, 1,
0.8523014, -0.2050111, 2.452528, 1, 1, 1, 1, 1,
0.8525141, -0.6867641, 1.409698, 1, 1, 1, 1, 1,
0.8574424, 0.5410905, 0.4503867, 1, 1, 1, 1, 1,
0.8588431, 0.477816, 1.852748, 0, 0, 1, 1, 1,
0.8610833, -0.3284753, 1.447748, 1, 0, 0, 1, 1,
0.8685922, 1.450154, -0.1150129, 1, 0, 0, 1, 1,
0.8758078, -0.2574936, 3.013372, 1, 0, 0, 1, 1,
0.876892, 0.9274914, -0.03720447, 1, 0, 0, 1, 1,
0.8788274, -0.3152682, 2.040456, 1, 0, 0, 1, 1,
0.883794, 0.5431291, -0.905088, 0, 0, 0, 1, 1,
0.891347, -1.28467, 2.806005, 0, 0, 0, 1, 1,
0.8969694, -0.5995316, 0.7269149, 0, 0, 0, 1, 1,
0.8991339, -1.008414, 2.197645, 0, 0, 0, 1, 1,
0.9004303, 0.2225797, 0.2898864, 0, 0, 0, 1, 1,
0.9033987, 1.249741, 0.9886928, 0, 0, 0, 1, 1,
0.9061912, 3.124953, 0.8735743, 0, 0, 0, 1, 1,
0.9111459, -0.03290223, 0.648388, 1, 1, 1, 1, 1,
0.9128208, 0.6212496, 0.6154323, 1, 1, 1, 1, 1,
0.9232364, 0.1278532, 3.29365, 1, 1, 1, 1, 1,
0.9314178, -2.490513, 4.265838, 1, 1, 1, 1, 1,
0.9321474, -0.2540839, 1.184171, 1, 1, 1, 1, 1,
0.9383007, -0.7210367, 0.09133219, 1, 1, 1, 1, 1,
0.9425865, 0.8322795, 1.679227, 1, 1, 1, 1, 1,
0.9488199, 0.5382288, 0.4355686, 1, 1, 1, 1, 1,
0.9706094, 0.7337368, 0.4602413, 1, 1, 1, 1, 1,
0.978139, -1.063069, 3.105958, 1, 1, 1, 1, 1,
0.9828287, 0.1001821, -0.9875688, 1, 1, 1, 1, 1,
0.9861219, -0.8929605, 0.8760942, 1, 1, 1, 1, 1,
0.9875797, -0.8962012, 2.004287, 1, 1, 1, 1, 1,
0.9931837, -1.317945, 1.538675, 1, 1, 1, 1, 1,
0.9935992, -0.6022429, -0.02095418, 1, 1, 1, 1, 1,
0.9956162, -0.7837417, 1.144772, 0, 0, 1, 1, 1,
0.9965717, -0.08082326, 0.3931122, 1, 0, 0, 1, 1,
0.9978397, -1.265809, 2.847135, 1, 0, 0, 1, 1,
0.9991571, -1.157025, 0.5076749, 1, 0, 0, 1, 1,
1.00374, -0.8373563, 1.714128, 1, 0, 0, 1, 1,
1.019915, 0.3922193, 1.723172, 1, 0, 0, 1, 1,
1.031082, 0.3396719, 1.357884, 0, 0, 0, 1, 1,
1.031337, -0.5483655, 3.158127, 0, 0, 0, 1, 1,
1.032338, 1.313113, -0.09243567, 0, 0, 0, 1, 1,
1.036887, -0.6683268, 3.460686, 0, 0, 0, 1, 1,
1.037795, -1.460831, 1.685813, 0, 0, 0, 1, 1,
1.039737, -0.6260163, 1.454128, 0, 0, 0, 1, 1,
1.040555, 0.6854231, -0.1741597, 0, 0, 0, 1, 1,
1.04065, -0.6435705, 2.724062, 1, 1, 1, 1, 1,
1.043773, -1.414302, 1.097692, 1, 1, 1, 1, 1,
1.043885, -0.2386465, 2.405946, 1, 1, 1, 1, 1,
1.060054, -1.118452, 1.43918, 1, 1, 1, 1, 1,
1.06674, -0.3725644, 3.208956, 1, 1, 1, 1, 1,
1.069831, -0.03743508, 1.301518, 1, 1, 1, 1, 1,
1.080106, 0.2511128, 0.5277746, 1, 1, 1, 1, 1,
1.088441, -1.882812, 2.046897, 1, 1, 1, 1, 1,
1.089478, 0.9216588, 1.157481, 1, 1, 1, 1, 1,
1.093625, 0.7928219, 0.823676, 1, 1, 1, 1, 1,
1.093995, -1.185047, 3.765423, 1, 1, 1, 1, 1,
1.095558, -0.07415561, 0.3510606, 1, 1, 1, 1, 1,
1.098174, 0.6168665, -0.8854445, 1, 1, 1, 1, 1,
1.108339, -1.612386, 2.788737, 1, 1, 1, 1, 1,
1.108787, 0.06815343, 1.876968, 1, 1, 1, 1, 1,
1.123335, 0.3364325, 0.0709819, 0, 0, 1, 1, 1,
1.145608, -0.6641236, 1.428287, 1, 0, 0, 1, 1,
1.146313, 1.776406, 0.5749263, 1, 0, 0, 1, 1,
1.148843, 0.5266258, -0.2845251, 1, 0, 0, 1, 1,
1.159904, 0.317004, 0.9580235, 1, 0, 0, 1, 1,
1.173916, 2.376216, -0.5660755, 1, 0, 0, 1, 1,
1.175512, -1.031628, 4.068693, 0, 0, 0, 1, 1,
1.178691, -0.5621016, 1.460257, 0, 0, 0, 1, 1,
1.17889, 0.1908929, 1.462961, 0, 0, 0, 1, 1,
1.180512, -0.3940035, 1.178292, 0, 0, 0, 1, 1,
1.182486, -0.3751166, 0.837825, 0, 0, 0, 1, 1,
1.183405, 1.562999, 1.354089, 0, 0, 0, 1, 1,
1.188886, 0.4476218, 2.381299, 0, 0, 0, 1, 1,
1.194182, -0.1123492, 1.050883, 1, 1, 1, 1, 1,
1.200364, 0.676729, 0.6531533, 1, 1, 1, 1, 1,
1.201031, 0.3705449, 1.39521, 1, 1, 1, 1, 1,
1.210418, 0.654702, 1.217507, 1, 1, 1, 1, 1,
1.216611, 0.01679012, 1.489048, 1, 1, 1, 1, 1,
1.225648, 0.6448025, 0.6738815, 1, 1, 1, 1, 1,
1.235633, -0.1905601, 2.051498, 1, 1, 1, 1, 1,
1.235997, -0.929718, 2.298046, 1, 1, 1, 1, 1,
1.24999, 2.121938, 0.4927455, 1, 1, 1, 1, 1,
1.251889, -1.544934, 1.143507, 1, 1, 1, 1, 1,
1.252108, -1.457196, 1.09583, 1, 1, 1, 1, 1,
1.257439, -0.158643, 0.8540832, 1, 1, 1, 1, 1,
1.260558, -0.6376572, 1.319026, 1, 1, 1, 1, 1,
1.282014, 0.3677879, -0.06743956, 1, 1, 1, 1, 1,
1.283243, 0.7791921, 2.530354, 1, 1, 1, 1, 1,
1.28459, -1.578768, 1.806294, 0, 0, 1, 1, 1,
1.28598, -1.893944, 3.189673, 1, 0, 0, 1, 1,
1.286447, 1.850357, 0.3326873, 1, 0, 0, 1, 1,
1.29161, 0.1176549, 1.878317, 1, 0, 0, 1, 1,
1.292076, -0.2508916, 1.411199, 1, 0, 0, 1, 1,
1.310333, 0.8899381, 1.280286, 1, 0, 0, 1, 1,
1.321129, -0.2669852, 1.359995, 0, 0, 0, 1, 1,
1.321486, 0.09751299, 1.187817, 0, 0, 0, 1, 1,
1.342107, 0.5411581, 2.369272, 0, 0, 0, 1, 1,
1.355685, 0.61156, 1.30751, 0, 0, 0, 1, 1,
1.361858, -0.706306, 2.417276, 0, 0, 0, 1, 1,
1.366045, -1.306111, 2.974377, 0, 0, 0, 1, 1,
1.392986, 1.361798, 2.552909, 0, 0, 0, 1, 1,
1.393754, -0.5988569, 1.149463, 1, 1, 1, 1, 1,
1.414683, -1.184392, 2.855058, 1, 1, 1, 1, 1,
1.417241, -0.267004, 0.2923756, 1, 1, 1, 1, 1,
1.418903, 1.351536, 1.610737, 1, 1, 1, 1, 1,
1.432524, 0.404035, 2.38878, 1, 1, 1, 1, 1,
1.440847, -1.099012, 1.724709, 1, 1, 1, 1, 1,
1.448356, -1.541972, 2.051319, 1, 1, 1, 1, 1,
1.448458, 0.4595194, 1.11586, 1, 1, 1, 1, 1,
1.461006, 0.9440214, -0.3312271, 1, 1, 1, 1, 1,
1.464708, 0.4043949, 1.741338, 1, 1, 1, 1, 1,
1.48828, 1.596934, -0.5292293, 1, 1, 1, 1, 1,
1.49398, 0.1316767, 1.784522, 1, 1, 1, 1, 1,
1.495352, 2.192897, 1.387149, 1, 1, 1, 1, 1,
1.495356, 0.2216223, 1.174784, 1, 1, 1, 1, 1,
1.501511, 0.3548091, 2.446833, 1, 1, 1, 1, 1,
1.52214, 0.5456975, 0.6047141, 0, 0, 1, 1, 1,
1.524147, 1.95816, 1.925456, 1, 0, 0, 1, 1,
1.524556, 1.120085, 0.7624727, 1, 0, 0, 1, 1,
1.538461, 0.9957813, 1.886354, 1, 0, 0, 1, 1,
1.544619, -0.6601661, 2.021877, 1, 0, 0, 1, 1,
1.548574, 0.07028132, -0.2224259, 1, 0, 0, 1, 1,
1.558804, -0.8456818, 3.163474, 0, 0, 0, 1, 1,
1.560173, 1.499215, 1.440854, 0, 0, 0, 1, 1,
1.565656, -1.570151, 1.181972, 0, 0, 0, 1, 1,
1.566536, -0.4192414, 3.361367, 0, 0, 0, 1, 1,
1.567809, -0.8210867, 2.509322, 0, 0, 0, 1, 1,
1.570125, 1.153724, 0.5223979, 0, 0, 0, 1, 1,
1.590091, -0.6460865, 0.4291217, 0, 0, 0, 1, 1,
1.621608, -0.2171338, 1.396648, 1, 1, 1, 1, 1,
1.625631, -0.8632752, 3.516887, 1, 1, 1, 1, 1,
1.625751, 0.7741474, 1.692386, 1, 1, 1, 1, 1,
1.642868, 0.8785198, 2.028549, 1, 1, 1, 1, 1,
1.647297, -1.099469, 1.875676, 1, 1, 1, 1, 1,
1.656037, -0.8646107, 1.738034, 1, 1, 1, 1, 1,
1.660697, 0.489095, 0.5378437, 1, 1, 1, 1, 1,
1.661653, 0.09662617, 1.851413, 1, 1, 1, 1, 1,
1.66973, 0.4930797, 0.3606932, 1, 1, 1, 1, 1,
1.686399, 0.6476137, 0.9016577, 1, 1, 1, 1, 1,
1.687518, -0.1190146, 0.5188309, 1, 1, 1, 1, 1,
1.690217, -0.4139175, 1.816729, 1, 1, 1, 1, 1,
1.702415, -0.3675271, 2.276831, 1, 1, 1, 1, 1,
1.704566, 1.231358, 1.9733, 1, 1, 1, 1, 1,
1.707123, -1.355484, 3.85914, 1, 1, 1, 1, 1,
1.711845, 0.483889, 1.813432, 0, 0, 1, 1, 1,
1.729609, -0.8006867, 3.215155, 1, 0, 0, 1, 1,
1.731968, -0.395135, 2.176619, 1, 0, 0, 1, 1,
1.741979, 0.7657638, 1.997361, 1, 0, 0, 1, 1,
1.755278, -0.3401526, 1.656841, 1, 0, 0, 1, 1,
1.757261, 2.759093, -0.09370668, 1, 0, 0, 1, 1,
1.771529, 0.3426801, 1.809106, 0, 0, 0, 1, 1,
1.794178, -0.8367382, 2.749113, 0, 0, 0, 1, 1,
1.815666, -1.677777, 1.294246, 0, 0, 0, 1, 1,
1.827546, 0.6420941, 1.433536, 0, 0, 0, 1, 1,
1.832263, 0.3758831, 2.038513, 0, 0, 0, 1, 1,
1.875891, -0.8687004, 1.555214, 0, 0, 0, 1, 1,
1.87651, 0.2489062, 1.140454, 0, 0, 0, 1, 1,
1.886183, 1.453004, 0.7034091, 1, 1, 1, 1, 1,
1.902596, 0.2781177, 0.3343033, 1, 1, 1, 1, 1,
1.903041, 0.463714, 2.809011, 1, 1, 1, 1, 1,
1.907282, 1.376263, 3.290447, 1, 1, 1, 1, 1,
1.944287, -0.109554, 0.663646, 1, 1, 1, 1, 1,
1.962931, -0.3407581, 2.962967, 1, 1, 1, 1, 1,
1.972575, 0.2180201, 2.050826, 1, 1, 1, 1, 1,
1.996126, -1.141431, 2.271129, 1, 1, 1, 1, 1,
2.013357, 2.167573, 0.8722768, 1, 1, 1, 1, 1,
2.039791, -0.6963705, 1.413749, 1, 1, 1, 1, 1,
2.055536, 0.394406, 0.2095487, 1, 1, 1, 1, 1,
2.07671, 1.254587, 0.7793918, 1, 1, 1, 1, 1,
2.094745, 2.578076, -0.2388238, 1, 1, 1, 1, 1,
2.104141, 0.3088676, -0.1122186, 1, 1, 1, 1, 1,
2.106972, -1.291868, 3.770815, 1, 1, 1, 1, 1,
2.138637, -0.1346473, 1.558961, 0, 0, 1, 1, 1,
2.14756, 0.935907, 2.790562, 1, 0, 0, 1, 1,
2.154822, -0.7155542, 1.560605, 1, 0, 0, 1, 1,
2.170923, -0.1039388, -0.9071649, 1, 0, 0, 1, 1,
2.176498, -0.2082754, 1.998222, 1, 0, 0, 1, 1,
2.182325, -0.1635161, 2.164699, 1, 0, 0, 1, 1,
2.195206, -2.457028, 4.362324, 0, 0, 0, 1, 1,
2.2043, 0.7216267, 1.170315, 0, 0, 0, 1, 1,
2.222532, 1.212937, 1.361062, 0, 0, 0, 1, 1,
2.239309, -0.6366342, 2.929415, 0, 0, 0, 1, 1,
2.284818, -0.5652426, 0.8440845, 0, 0, 0, 1, 1,
2.469523, 1.054655, 0.7913476, 0, 0, 0, 1, 1,
2.572096, 0.9681917, 2.361508, 0, 0, 0, 1, 1,
2.65892, -2.181625, 1.209876, 1, 1, 1, 1, 1,
2.712959, 1.123234, 0.9397556, 1, 1, 1, 1, 1,
2.719914, 0.4283313, 1.086629, 1, 1, 1, 1, 1,
2.768885, -0.1320271, 2.572184, 1, 1, 1, 1, 1,
2.775444, -0.3047411, 2.616105, 1, 1, 1, 1, 1,
2.947283, -0.01262395, 0.3304599, 1, 1, 1, 1, 1,
3.391035, 1.645386, 1.2931, 1, 1, 1, 1, 1
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
var radius = 9.972956;
var distance = 35.02959;
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
mvMatrix.translate( 0.1446509, -0.7575508, 0.1966538 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.02959);
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
