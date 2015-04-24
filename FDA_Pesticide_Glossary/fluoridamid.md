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
-3.150991, -0.4211625, 0.07996061, 1, 0, 0, 1,
-3.065665, 0.03034111, -2.032639, 1, 0.007843138, 0, 1,
-2.885743, -0.291292, -0.230406, 1, 0.01176471, 0, 1,
-2.744199, 0.3849409, -1.457248, 1, 0.01960784, 0, 1,
-2.726344, -0.5782626, -1.318203, 1, 0.02352941, 0, 1,
-2.705409, -0.8249711, -2.355686, 1, 0.03137255, 0, 1,
-2.682622, -0.08025422, -1.002686, 1, 0.03529412, 0, 1,
-2.525251, 0.01596473, -1.117872, 1, 0.04313726, 0, 1,
-2.456686, 1.069356, 0.1316244, 1, 0.04705882, 0, 1,
-2.412952, 0.5736046, -3.377374, 1, 0.05490196, 0, 1,
-2.361029, -0.2848313, -2.087537, 1, 0.05882353, 0, 1,
-2.331933, -0.3813711, -0.4641897, 1, 0.06666667, 0, 1,
-2.33193, 1.033321, -1.26816, 1, 0.07058824, 0, 1,
-2.323872, -0.4373203, -0.9610907, 1, 0.07843138, 0, 1,
-2.286265, -1.074213, -2.41116, 1, 0.08235294, 0, 1,
-2.275141, 1.916049, -2.374529, 1, 0.09019608, 0, 1,
-2.250893, -0.1363285, -0.6114532, 1, 0.09411765, 0, 1,
-2.194386, -0.07057726, 1.041718, 1, 0.1019608, 0, 1,
-2.178849, -0.06153908, -1.972772, 1, 0.1098039, 0, 1,
-2.171662, 2.326357, -1.230459, 1, 0.1137255, 0, 1,
-2.123405, -1.447642, -1.955524, 1, 0.1215686, 0, 1,
-2.086846, -0.8010287, -1.538946, 1, 0.1254902, 0, 1,
-2.022352, -0.8852136, -2.934304, 1, 0.1333333, 0, 1,
-2.007659, -0.2596635, 0.02774562, 1, 0.1372549, 0, 1,
-1.942572, 0.3396404, -1.728275, 1, 0.145098, 0, 1,
-1.938204, 0.2169391, -1.473981, 1, 0.1490196, 0, 1,
-1.918509, 0.5582548, -1.72553, 1, 0.1568628, 0, 1,
-1.873713, 0.05845218, -0.02555017, 1, 0.1607843, 0, 1,
-1.864416, 0.1153126, -2.588525, 1, 0.1686275, 0, 1,
-1.853406, 1.04257, -1.349546, 1, 0.172549, 0, 1,
-1.849177, 1.048061, -0.739751, 1, 0.1803922, 0, 1,
-1.825462, -1.57298, -3.143632, 1, 0.1843137, 0, 1,
-1.823916, 0.6846209, -2.138591, 1, 0.1921569, 0, 1,
-1.820595, -0.3433355, -1.82772, 1, 0.1960784, 0, 1,
-1.814585, 0.9037033, -1.857845, 1, 0.2039216, 0, 1,
-1.812563, 1.443789, -3.024963, 1, 0.2117647, 0, 1,
-1.797897, 1.201312, -1.779164, 1, 0.2156863, 0, 1,
-1.796192, 1.769296, -0.2925614, 1, 0.2235294, 0, 1,
-1.78273, 0.913372, -0.4075014, 1, 0.227451, 0, 1,
-1.745082, 0.510675, -0.8668484, 1, 0.2352941, 0, 1,
-1.687362, 0.2510015, 0.8340192, 1, 0.2392157, 0, 1,
-1.659561, -0.1148663, -0.8908626, 1, 0.2470588, 0, 1,
-1.656233, 1.669469, -0.6025453, 1, 0.2509804, 0, 1,
-1.639793, 0.6057439, -2.441172, 1, 0.2588235, 0, 1,
-1.630705, -0.6610196, -0.5441043, 1, 0.2627451, 0, 1,
-1.626906, -0.803853, -2.409763, 1, 0.2705882, 0, 1,
-1.607226, -0.6778671, -1.129206, 1, 0.2745098, 0, 1,
-1.602552, 0.5245792, 0.1283063, 1, 0.282353, 0, 1,
-1.599448, -0.6407776, -3.156064, 1, 0.2862745, 0, 1,
-1.598704, -0.1948056, -1.749543, 1, 0.2941177, 0, 1,
-1.59782, 0.3759631, -2.392642, 1, 0.3019608, 0, 1,
-1.591738, -0.6474732, -3.178494, 1, 0.3058824, 0, 1,
-1.587942, -0.4198822, -1.121141, 1, 0.3137255, 0, 1,
-1.583902, -0.3425835, -1.80329, 1, 0.3176471, 0, 1,
-1.573585, 1.110107, -0.7358058, 1, 0.3254902, 0, 1,
-1.570681, 0.6085008, -1.759711, 1, 0.3294118, 0, 1,
-1.563111, -0.2590039, -2.905174, 1, 0.3372549, 0, 1,
-1.561741, 2.17238, 0.2969344, 1, 0.3411765, 0, 1,
-1.545341, -0.390139, -1.382212, 1, 0.3490196, 0, 1,
-1.540195, 0.4172236, -0.388619, 1, 0.3529412, 0, 1,
-1.524126, -0.1762295, -3.022895, 1, 0.3607843, 0, 1,
-1.510967, 1.197549, -1.387445, 1, 0.3647059, 0, 1,
-1.509242, 0.2344883, 0.09567139, 1, 0.372549, 0, 1,
-1.501846, 0.223181, 0.274352, 1, 0.3764706, 0, 1,
-1.492998, -0.737876, -1.332966, 1, 0.3843137, 0, 1,
-1.492245, 0.8298961, -1.026758, 1, 0.3882353, 0, 1,
-1.489254, -1.086282, -2.209514, 1, 0.3960784, 0, 1,
-1.483846, -0.1374059, -2.03004, 1, 0.4039216, 0, 1,
-1.459021, -0.3776031, -2.921597, 1, 0.4078431, 0, 1,
-1.454743, 0.6996899, -0.3232062, 1, 0.4156863, 0, 1,
-1.451521, 2.534063, -0.1761754, 1, 0.4196078, 0, 1,
-1.448648, 1.22374, -2.122706, 1, 0.427451, 0, 1,
-1.441455, 0.06588959, -3.991508, 1, 0.4313726, 0, 1,
-1.439534, 1.287152, -0.6048869, 1, 0.4392157, 0, 1,
-1.423594, -0.4615195, -1.725838, 1, 0.4431373, 0, 1,
-1.422458, -0.9303163, -0.4728709, 1, 0.4509804, 0, 1,
-1.418875, 0.2986307, -4.133558, 1, 0.454902, 0, 1,
-1.41498, -1.86805, -2.928203, 1, 0.4627451, 0, 1,
-1.411713, 1.012356, -1.355099, 1, 0.4666667, 0, 1,
-1.396821, -0.6607764, -2.863476, 1, 0.4745098, 0, 1,
-1.368616, -0.8102971, -3.147256, 1, 0.4784314, 0, 1,
-1.349109, -0.3949268, -1.554428, 1, 0.4862745, 0, 1,
-1.348979, -0.4561186, -1.181732, 1, 0.4901961, 0, 1,
-1.348278, -0.1990141, -2.578972, 1, 0.4980392, 0, 1,
-1.342366, -0.1730862, -0.04195875, 1, 0.5058824, 0, 1,
-1.340283, -0.6162566, -2.004041, 1, 0.509804, 0, 1,
-1.336667, 1.074425, -0.2504722, 1, 0.5176471, 0, 1,
-1.335134, -1.125671, -0.5607646, 1, 0.5215687, 0, 1,
-1.328581, 0.594921, -2.530679, 1, 0.5294118, 0, 1,
-1.321297, 1.130316, -1.067135, 1, 0.5333334, 0, 1,
-1.32063, 0.02578677, -2.133944, 1, 0.5411765, 0, 1,
-1.312861, -0.5587181, -1.065789, 1, 0.5450981, 0, 1,
-1.311304, -1.284873, -1.176162, 1, 0.5529412, 0, 1,
-1.297928, 0.3396544, -3.057639, 1, 0.5568628, 0, 1,
-1.291002, 2.163168, -3.358215, 1, 0.5647059, 0, 1,
-1.279657, 0.07324094, -1.96651, 1, 0.5686275, 0, 1,
-1.278581, -1.029646, -3.375564, 1, 0.5764706, 0, 1,
-1.277365, -0.6398276, -1.982216, 1, 0.5803922, 0, 1,
-1.269477, 1.07103, -0.9359411, 1, 0.5882353, 0, 1,
-1.263371, -1.037406, -0.4506854, 1, 0.5921569, 0, 1,
-1.258632, -0.8625334, -4.053451, 1, 0.6, 0, 1,
-1.256035, 1.314579, -0.3369649, 1, 0.6078432, 0, 1,
-1.24731, 0.9525818, -2.973987, 1, 0.6117647, 0, 1,
-1.238164, -1.625502, 1.010982, 1, 0.6196079, 0, 1,
-1.236792, 0.07919935, -1.301157, 1, 0.6235294, 0, 1,
-1.232564, -2.590551, -3.425186, 1, 0.6313726, 0, 1,
-1.231871, 2.190096, -2.250192, 1, 0.6352941, 0, 1,
-1.231244, -0.649923, -3.191391, 1, 0.6431373, 0, 1,
-1.231107, -0.2153012, -3.021384, 1, 0.6470588, 0, 1,
-1.228054, 0.2988394, -2.091289, 1, 0.654902, 0, 1,
-1.202172, 0.5079373, -0.5043205, 1, 0.6588235, 0, 1,
-1.194391, -0.5113678, -2.163611, 1, 0.6666667, 0, 1,
-1.187127, 1.170025, -0.7891973, 1, 0.6705883, 0, 1,
-1.166484, -0.3375693, 0.5589653, 1, 0.6784314, 0, 1,
-1.163558, 0.5502451, -0.5818881, 1, 0.682353, 0, 1,
-1.160565, 1.914885, -0.06124545, 1, 0.6901961, 0, 1,
-1.152416, 1.859769, -0.9767612, 1, 0.6941177, 0, 1,
-1.144218, -0.5554771, -3.836772, 1, 0.7019608, 0, 1,
-1.139543, -0.7479544, -2.46233, 1, 0.7098039, 0, 1,
-1.137308, -0.4788364, -2.521095, 1, 0.7137255, 0, 1,
-1.134742, 0.245502, -2.251336, 1, 0.7215686, 0, 1,
-1.134385, 0.8333046, -0.9531479, 1, 0.7254902, 0, 1,
-1.119095, 1.448132, 0.4003342, 1, 0.7333333, 0, 1,
-1.118273, -0.3342853, -3.081348, 1, 0.7372549, 0, 1,
-1.117436, -0.1466806, -2.873761, 1, 0.7450981, 0, 1,
-1.105114, 1.007231, -1.313372, 1, 0.7490196, 0, 1,
-1.102936, 0.210339, -0.06069699, 1, 0.7568628, 0, 1,
-1.102815, 0.6204066, 1.068849, 1, 0.7607843, 0, 1,
-1.097069, -0.7771028, -2.755745, 1, 0.7686275, 0, 1,
-1.095809, 0.01299359, -0.5072908, 1, 0.772549, 0, 1,
-1.094033, -0.2261013, -1.154626, 1, 0.7803922, 0, 1,
-1.087123, -1.160136, -1.834329, 1, 0.7843137, 0, 1,
-1.081073, -0.8370913, -1.747772, 1, 0.7921569, 0, 1,
-1.07944, 0.0775274, -1.640136, 1, 0.7960784, 0, 1,
-1.078624, -1.244244, -3.92014, 1, 0.8039216, 0, 1,
-1.074183, 1.282172, -2.472506, 1, 0.8117647, 0, 1,
-1.072805, -1.402151, -2.295966, 1, 0.8156863, 0, 1,
-1.058461, -0.2420961, -1.491748, 1, 0.8235294, 0, 1,
-1.056374, -0.185055, -2.036117, 1, 0.827451, 0, 1,
-1.049635, -0.5132366, -1.756645, 1, 0.8352941, 0, 1,
-1.037798, -0.4291816, -1.616226, 1, 0.8392157, 0, 1,
-1.035608, 0.1023496, 0.1241884, 1, 0.8470588, 0, 1,
-1.033732, -0.3405254, -1.688854, 1, 0.8509804, 0, 1,
-1.032095, 0.4700321, 0.5104511, 1, 0.8588235, 0, 1,
-1.022014, 1.251453, -0.5128842, 1, 0.8627451, 0, 1,
-1.020367, -0.1587265, -2.790766, 1, 0.8705882, 0, 1,
-1.018745, -0.4305272, -2.473759, 1, 0.8745098, 0, 1,
-1.012825, -0.8583091, -1.111151, 1, 0.8823529, 0, 1,
-1.011808, 1.802552, 0.1494441, 1, 0.8862745, 0, 1,
-1.006713, 0.305091, 0.2665626, 1, 0.8941177, 0, 1,
-0.9892352, -1.825709, -1.534326, 1, 0.8980392, 0, 1,
-0.9890811, 0.07276639, -0.3281673, 1, 0.9058824, 0, 1,
-0.9808188, -0.29904, -1.343117, 1, 0.9137255, 0, 1,
-0.9654562, -0.5551474, -2.799039, 1, 0.9176471, 0, 1,
-0.9643716, -0.4962268, -2.290808, 1, 0.9254902, 0, 1,
-0.9628732, 0.05238117, -1.509389, 1, 0.9294118, 0, 1,
-0.9607221, -0.788775, -1.460047, 1, 0.9372549, 0, 1,
-0.9596999, 0.3744502, -0.4928029, 1, 0.9411765, 0, 1,
-0.9578898, -0.1137287, -2.547312, 1, 0.9490196, 0, 1,
-0.9531482, -0.05287924, -2.145458, 1, 0.9529412, 0, 1,
-0.9431973, 0.8594253, -1.646132, 1, 0.9607843, 0, 1,
-0.939234, -0.3547417, -0.592994, 1, 0.9647059, 0, 1,
-0.9361929, -1.129194, -1.678244, 1, 0.972549, 0, 1,
-0.935452, 0.1131984, -0.09891789, 1, 0.9764706, 0, 1,
-0.9330679, 0.2392345, -0.2710288, 1, 0.9843137, 0, 1,
-0.9207893, 0.2947482, -0.8670226, 1, 0.9882353, 0, 1,
-0.9193886, -0.1894947, -2.78744, 1, 0.9960784, 0, 1,
-0.915989, -0.01372008, -1.413788, 0.9960784, 1, 0, 1,
-0.9147326, -1.856203, -2.301098, 0.9921569, 1, 0, 1,
-0.9130613, -1.526963, -3.364468, 0.9843137, 1, 0, 1,
-0.9085647, -0.93173, -2.361546, 0.9803922, 1, 0, 1,
-0.9077561, -0.9811334, -4.246685, 0.972549, 1, 0, 1,
-0.9060129, -0.2448921, -2.588625, 0.9686275, 1, 0, 1,
-0.9040008, -0.2647458, -1.996212, 0.9607843, 1, 0, 1,
-0.8870433, 0.5231518, -0.7933025, 0.9568627, 1, 0, 1,
-0.8858948, -1.256086, -2.179061, 0.9490196, 1, 0, 1,
-0.8853768, 2.93897, 0.513936, 0.945098, 1, 0, 1,
-0.8795285, -0.3743151, -3.597845, 0.9372549, 1, 0, 1,
-0.8770129, 0.8970737, -1.176689, 0.9333333, 1, 0, 1,
-0.8710413, -1.468768, -1.259, 0.9254902, 1, 0, 1,
-0.8694844, 0.449093, -2.555135, 0.9215686, 1, 0, 1,
-0.8690662, 0.4371152, -0.8897713, 0.9137255, 1, 0, 1,
-0.8650594, -0.1370365, -2.057722, 0.9098039, 1, 0, 1,
-0.8636246, 0.4124627, -0.1223603, 0.9019608, 1, 0, 1,
-0.8614478, -0.2532218, -2.799969, 0.8941177, 1, 0, 1,
-0.8527441, 0.3540122, -2.350541, 0.8901961, 1, 0, 1,
-0.8508288, -0.006181775, -1.615654, 0.8823529, 1, 0, 1,
-0.8485234, -0.602021, -3.018229, 0.8784314, 1, 0, 1,
-0.8480148, 0.06620715, -0.1832575, 0.8705882, 1, 0, 1,
-0.8463113, 0.2611278, -1.763595, 0.8666667, 1, 0, 1,
-0.8415301, -0.9233415, -1.820892, 0.8588235, 1, 0, 1,
-0.8342986, -1.521907, -2.637276, 0.854902, 1, 0, 1,
-0.8318549, -1.403659, -2.683143, 0.8470588, 1, 0, 1,
-0.8285445, -0.6256319, -1.988943, 0.8431373, 1, 0, 1,
-0.8243812, 0.02775552, -2.76415, 0.8352941, 1, 0, 1,
-0.8088151, -0.8161935, -2.446288, 0.8313726, 1, 0, 1,
-0.8001069, 0.6746517, -1.200213, 0.8235294, 1, 0, 1,
-0.7968404, 0.05792746, -2.157213, 0.8196079, 1, 0, 1,
-0.792573, 2.253227, 0.3280003, 0.8117647, 1, 0, 1,
-0.7917474, -0.364612, -3.898276, 0.8078431, 1, 0, 1,
-0.7883709, -0.9103057, -2.741638, 0.8, 1, 0, 1,
-0.7800059, -1.352152, -3.432341, 0.7921569, 1, 0, 1,
-0.7791892, -0.3155302, -1.714209, 0.7882353, 1, 0, 1,
-0.7660326, -0.3115794, -1.5705, 0.7803922, 1, 0, 1,
-0.7613028, 0.02433165, -2.410411, 0.7764706, 1, 0, 1,
-0.7600924, -0.04235941, -2.844763, 0.7686275, 1, 0, 1,
-0.757958, 0.5087162, -1.6793, 0.7647059, 1, 0, 1,
-0.7574565, 0.4371629, 0.8437448, 0.7568628, 1, 0, 1,
-0.7534832, -0.2283673, -1.20472, 0.7529412, 1, 0, 1,
-0.748306, -0.8301726, -2.379822, 0.7450981, 1, 0, 1,
-0.7460694, 1.023909, -3.142152, 0.7411765, 1, 0, 1,
-0.7460133, -1.182539, -1.827258, 0.7333333, 1, 0, 1,
-0.7448218, 0.1174928, -0.3400108, 0.7294118, 1, 0, 1,
-0.7254925, -0.3120236, -1.68621, 0.7215686, 1, 0, 1,
-0.7222669, -2.051244, -3.443361, 0.7176471, 1, 0, 1,
-0.7128703, -1.294906, -1.734756, 0.7098039, 1, 0, 1,
-0.7029959, -1.741511, -1.919611, 0.7058824, 1, 0, 1,
-0.6902577, -0.7784511, -1.899944, 0.6980392, 1, 0, 1,
-0.6870735, 1.194437, 0.03460591, 0.6901961, 1, 0, 1,
-0.686722, 1.06997, 1.450044, 0.6862745, 1, 0, 1,
-0.6860142, -0.3132857, -1.341584, 0.6784314, 1, 0, 1,
-0.6831135, -0.01521268, -3.246853, 0.6745098, 1, 0, 1,
-0.6818601, 0.3588938, 0.3146707, 0.6666667, 1, 0, 1,
-0.6812758, -0.9417996, -2.797898, 0.6627451, 1, 0, 1,
-0.6793671, -2.062511, -4.20628, 0.654902, 1, 0, 1,
-0.6770205, -1.323921, -0.3218899, 0.6509804, 1, 0, 1,
-0.6729255, 0.7924051, 1.173308, 0.6431373, 1, 0, 1,
-0.6705765, -0.2790587, -2.468351, 0.6392157, 1, 0, 1,
-0.6675535, -0.672528, -1.991765, 0.6313726, 1, 0, 1,
-0.6633544, 1.281293, -0.741174, 0.627451, 1, 0, 1,
-0.6622876, -0.2977975, -3.221226, 0.6196079, 1, 0, 1,
-0.6598758, 0.7822197, -1.939254, 0.6156863, 1, 0, 1,
-0.6582974, -0.8805402, -2.412982, 0.6078432, 1, 0, 1,
-0.6580469, 0.408146, -0.5937182, 0.6039216, 1, 0, 1,
-0.65789, -0.9440302, -2.282179, 0.5960785, 1, 0, 1,
-0.6532202, 2.187203, 0.214743, 0.5882353, 1, 0, 1,
-0.652813, -0.8349521, -2.022355, 0.5843138, 1, 0, 1,
-0.651279, -0.6115756, -2.800229, 0.5764706, 1, 0, 1,
-0.6505721, 2.103447, -0.07781179, 0.572549, 1, 0, 1,
-0.6492308, 0.1167817, -1.003829, 0.5647059, 1, 0, 1,
-0.6484261, -1.108423, -2.57043, 0.5607843, 1, 0, 1,
-0.646278, -0.07721359, -1.676615, 0.5529412, 1, 0, 1,
-0.6455541, -1.797112, -2.844295, 0.5490196, 1, 0, 1,
-0.6417769, -0.26816, -2.266978, 0.5411765, 1, 0, 1,
-0.6356657, 1.387455, -2.03829, 0.5372549, 1, 0, 1,
-0.6318336, -0.06761976, -1.342183, 0.5294118, 1, 0, 1,
-0.6260321, 0.895183, -1.293641, 0.5254902, 1, 0, 1,
-0.6250387, 0.6708145, 0.395052, 0.5176471, 1, 0, 1,
-0.6230026, 0.9796051, -0.4928739, 0.5137255, 1, 0, 1,
-0.6184896, -1.292679, -4.410387, 0.5058824, 1, 0, 1,
-0.6169617, 0.4003086, -0.1225572, 0.5019608, 1, 0, 1,
-0.6166233, -1.06262, -2.624474, 0.4941176, 1, 0, 1,
-0.6153876, 0.1302941, -2.639826, 0.4862745, 1, 0, 1,
-0.6151633, -0.8177897, -2.9347, 0.4823529, 1, 0, 1,
-0.6145985, 0.8023832, -0.7873054, 0.4745098, 1, 0, 1,
-0.6010449, -1.249555, -3.282707, 0.4705882, 1, 0, 1,
-0.599618, -0.1993984, -2.114051, 0.4627451, 1, 0, 1,
-0.5922202, -0.1861568, -3.164322, 0.4588235, 1, 0, 1,
-0.5888796, -0.1106308, -1.028188, 0.4509804, 1, 0, 1,
-0.5860664, 0.1466856, -2.423125, 0.4470588, 1, 0, 1,
-0.5854737, -0.2823921, -2.367726, 0.4392157, 1, 0, 1,
-0.5844593, -0.06254523, -2.572875, 0.4352941, 1, 0, 1,
-0.5832199, -2.687179, -2.208103, 0.427451, 1, 0, 1,
-0.5825487, -0.7198972, -2.047704, 0.4235294, 1, 0, 1,
-0.5801975, 1.138259, -0.4210668, 0.4156863, 1, 0, 1,
-0.5736924, -0.2765196, -2.128825, 0.4117647, 1, 0, 1,
-0.5722941, -0.3307735, -1.178275, 0.4039216, 1, 0, 1,
-0.5719941, -0.45049, -3.184022, 0.3960784, 1, 0, 1,
-0.5694045, 1.518216, -1.435604, 0.3921569, 1, 0, 1,
-0.5676999, -1.182791, -2.723846, 0.3843137, 1, 0, 1,
-0.5661619, -1.378338, -2.349292, 0.3803922, 1, 0, 1,
-0.5639597, -0.6643185, -1.912052, 0.372549, 1, 0, 1,
-0.563899, 0.1012504, -3.370563, 0.3686275, 1, 0, 1,
-0.5527183, 0.3343932, 0.09333935, 0.3607843, 1, 0, 1,
-0.5519164, 1.7807, -1.022648, 0.3568628, 1, 0, 1,
-0.547517, 1.012843, -1.26579, 0.3490196, 1, 0, 1,
-0.5474073, 1.156744, 0.4775223, 0.345098, 1, 0, 1,
-0.5468501, -0.4558732, -3.233779, 0.3372549, 1, 0, 1,
-0.5438305, 0.5973793, -1.498966, 0.3333333, 1, 0, 1,
-0.5432954, 0.2254265, -2.156903, 0.3254902, 1, 0, 1,
-0.5419257, 0.0005512386, -4.690029, 0.3215686, 1, 0, 1,
-0.539201, -0.2419638, -2.87458, 0.3137255, 1, 0, 1,
-0.5379201, -0.931514, -3.583921, 0.3098039, 1, 0, 1,
-0.5259624, 0.6663773, -0.884154, 0.3019608, 1, 0, 1,
-0.5226595, 0.5515755, -1.626056, 0.2941177, 1, 0, 1,
-0.52075, -1.10622, -3.874796, 0.2901961, 1, 0, 1,
-0.5151357, 0.1106835, -3.000446, 0.282353, 1, 0, 1,
-0.5122965, -1.494153, -1.289177, 0.2784314, 1, 0, 1,
-0.5114207, -0.4337813, -2.709774, 0.2705882, 1, 0, 1,
-0.5015501, -0.5705961, -2.951169, 0.2666667, 1, 0, 1,
-0.5006371, -0.3665138, -1.871675, 0.2588235, 1, 0, 1,
-0.4991138, 0.1299737, -1.618193, 0.254902, 1, 0, 1,
-0.4988427, -0.08319164, -2.050682, 0.2470588, 1, 0, 1,
-0.4983614, 0.5408974, -1.343638, 0.2431373, 1, 0, 1,
-0.4947453, -0.1954908, -1.690149, 0.2352941, 1, 0, 1,
-0.4931324, -1.383063, -2.497509, 0.2313726, 1, 0, 1,
-0.4894078, 0.7707956, -0.05751749, 0.2235294, 1, 0, 1,
-0.4868143, 0.814286, 0.9912024, 0.2196078, 1, 0, 1,
-0.4848854, -1.649837, -3.14022, 0.2117647, 1, 0, 1,
-0.4819743, 1.634397, 1.044387, 0.2078431, 1, 0, 1,
-0.4816464, -0.3167381, -3.036311, 0.2, 1, 0, 1,
-0.4805057, 1.269319, -0.3921043, 0.1921569, 1, 0, 1,
-0.4764232, 0.4282956, -2.141905, 0.1882353, 1, 0, 1,
-0.4731968, -1.297537, -3.202486, 0.1803922, 1, 0, 1,
-0.4660297, -0.819734, -3.18536, 0.1764706, 1, 0, 1,
-0.4652075, 0.5705661, -0.5655689, 0.1686275, 1, 0, 1,
-0.4588536, 0.05100693, -1.136301, 0.1647059, 1, 0, 1,
-0.4580108, 0.8059559, -0.3495767, 0.1568628, 1, 0, 1,
-0.4562705, -0.2161375, -1.131897, 0.1529412, 1, 0, 1,
-0.4556001, 0.4101509, -0.9824523, 0.145098, 1, 0, 1,
-0.4513852, -0.2693335, -3.050017, 0.1411765, 1, 0, 1,
-0.4501099, 1.363874, -0.1241963, 0.1333333, 1, 0, 1,
-0.449986, 1.286389, -0.08691726, 0.1294118, 1, 0, 1,
-0.4481148, -1.641636, -3.045018, 0.1215686, 1, 0, 1,
-0.4446978, -1.010793, -3.124866, 0.1176471, 1, 0, 1,
-0.4446577, -1.24031, -2.140489, 0.1098039, 1, 0, 1,
-0.4416588, -0.5867003, -2.418543, 0.1058824, 1, 0, 1,
-0.440116, -0.8994965, -1.638095, 0.09803922, 1, 0, 1,
-0.4383431, 0.8311664, -0.5678394, 0.09019608, 1, 0, 1,
-0.4382053, 1.433819, 1.95388, 0.08627451, 1, 0, 1,
-0.4373246, -0.1947493, -3.254115, 0.07843138, 1, 0, 1,
-0.4366164, -1.115671, -2.666092, 0.07450981, 1, 0, 1,
-0.4291003, 1.536706, 1.37432, 0.06666667, 1, 0, 1,
-0.4287568, -0.9613946, -0.9200389, 0.0627451, 1, 0, 1,
-0.4255501, -0.8456664, -2.745731, 0.05490196, 1, 0, 1,
-0.4247874, -0.4127655, -1.038797, 0.05098039, 1, 0, 1,
-0.4245511, -0.8453431, -3.29466, 0.04313726, 1, 0, 1,
-0.4234759, 0.4095342, -0.753396, 0.03921569, 1, 0, 1,
-0.4195376, 1.042373, -1.615214, 0.03137255, 1, 0, 1,
-0.4114488, -2.913436, -3.340886, 0.02745098, 1, 0, 1,
-0.4066551, -0.4387159, -0.822288, 0.01960784, 1, 0, 1,
-0.4057276, -0.1563874, -2.343359, 0.01568628, 1, 0, 1,
-0.4021334, 1.297728, -0.08858182, 0.007843138, 1, 0, 1,
-0.3942038, 0.4462752, -1.899869, 0.003921569, 1, 0, 1,
-0.3893901, -1.015746, -2.115569, 0, 1, 0.003921569, 1,
-0.3841625, 1.543832, 1.221723, 0, 1, 0.01176471, 1,
-0.3771147, -0.06961339, 0.6961883, 0, 1, 0.01568628, 1,
-0.3770728, -0.4615106, -0.4238618, 0, 1, 0.02352941, 1,
-0.3761624, -0.756026, -2.095318, 0, 1, 0.02745098, 1,
-0.3718229, 0.6777304, -1.302242, 0, 1, 0.03529412, 1,
-0.3655742, 2.329675, 0.8924022, 0, 1, 0.03921569, 1,
-0.3645111, 0.01403176, -2.59756, 0, 1, 0.04705882, 1,
-0.3528839, -0.4749154, -4.305295, 0, 1, 0.05098039, 1,
-0.3499684, 1.027437, -1.460604, 0, 1, 0.05882353, 1,
-0.3478265, 0.3775695, 0.115586, 0, 1, 0.0627451, 1,
-0.3449462, 0.5502471, -1.322301, 0, 1, 0.07058824, 1,
-0.3410907, -0.370098, -2.074756, 0, 1, 0.07450981, 1,
-0.3397744, -0.2075784, -2.293382, 0, 1, 0.08235294, 1,
-0.3367184, 1.080464, -2.065012, 0, 1, 0.08627451, 1,
-0.3346801, -1.095537, -4.015832, 0, 1, 0.09411765, 1,
-0.3325004, -0.1120254, -2.681192, 0, 1, 0.1019608, 1,
-0.3226359, 0.9482051, -1.010644, 0, 1, 0.1058824, 1,
-0.3150642, 1.543237, 1.063976, 0, 1, 0.1137255, 1,
-0.3132671, -0.07808952, -2.377213, 0, 1, 0.1176471, 1,
-0.3058795, -0.7387834, -3.229822, 0, 1, 0.1254902, 1,
-0.3035278, 0.11656, -1.045434, 0, 1, 0.1294118, 1,
-0.3029384, 0.2194147, -1.250398, 0, 1, 0.1372549, 1,
-0.3017816, 0.2952245, -0.3256187, 0, 1, 0.1411765, 1,
-0.3016915, 0.05032067, -3.643181, 0, 1, 0.1490196, 1,
-0.2976437, 0.2639204, -1.2632, 0, 1, 0.1529412, 1,
-0.2944963, 0.5462625, 0.9178982, 0, 1, 0.1607843, 1,
-0.2913697, -0.4867761, -2.990372, 0, 1, 0.1647059, 1,
-0.2905763, -1.325693, -2.570722, 0, 1, 0.172549, 1,
-0.2872438, -0.8391255, -2.260191, 0, 1, 0.1764706, 1,
-0.2803361, -0.3549906, -1.425937, 0, 1, 0.1843137, 1,
-0.2782925, 0.4949927, -2.408004, 0, 1, 0.1882353, 1,
-0.2677926, -1.609298, -3.924201, 0, 1, 0.1960784, 1,
-0.2597725, -0.9978648, -2.88318, 0, 1, 0.2039216, 1,
-0.2487728, -0.2817197, -2.59273, 0, 1, 0.2078431, 1,
-0.2435578, -1.177547, -3.506628, 0, 1, 0.2156863, 1,
-0.243143, -0.1339623, -2.071753, 0, 1, 0.2196078, 1,
-0.2404441, 0.1402115, -1.361322, 0, 1, 0.227451, 1,
-0.2360578, 1.205562, -0.4589289, 0, 1, 0.2313726, 1,
-0.2343156, -1.288503, -2.974673, 0, 1, 0.2392157, 1,
-0.231711, 1.195466, -0.340073, 0, 1, 0.2431373, 1,
-0.2308996, 1.941879, -1.133811, 0, 1, 0.2509804, 1,
-0.2191119, -0.4560781, -2.100182, 0, 1, 0.254902, 1,
-0.2103045, -0.4940102, -2.409328, 0, 1, 0.2627451, 1,
-0.2095062, 0.8712994, -0.4892644, 0, 1, 0.2666667, 1,
-0.2088892, 0.02128921, -1.089595, 0, 1, 0.2745098, 1,
-0.2088488, -1.221816, -2.022989, 0, 1, 0.2784314, 1,
-0.2066109, 0.1216463, -0.9107222, 0, 1, 0.2862745, 1,
-0.2053489, 1.406515, -2.092331, 0, 1, 0.2901961, 1,
-0.1974317, -0.713999, -2.467024, 0, 1, 0.2980392, 1,
-0.1967383, 0.3858426, 0.9186579, 0, 1, 0.3058824, 1,
-0.1935995, 0.8066004, -1.446656, 0, 1, 0.3098039, 1,
-0.1927566, -0.1654896, -2.409739, 0, 1, 0.3176471, 1,
-0.1922992, 0.1082417, -0.7106883, 0, 1, 0.3215686, 1,
-0.1916028, 1.185331, 2.216467, 0, 1, 0.3294118, 1,
-0.1893323, -0.7413642, -5.030167, 0, 1, 0.3333333, 1,
-0.1861632, 0.9400502, -0.4114963, 0, 1, 0.3411765, 1,
-0.1686517, -0.273487, -2.147216, 0, 1, 0.345098, 1,
-0.167262, -1.005434, -2.475666, 0, 1, 0.3529412, 1,
-0.1660751, -1.973697, -2.924517, 0, 1, 0.3568628, 1,
-0.1632778, -0.392896, -2.588197, 0, 1, 0.3647059, 1,
-0.1602561, -1.139637, -2.562719, 0, 1, 0.3686275, 1,
-0.1601204, -1.207915, -2.320169, 0, 1, 0.3764706, 1,
-0.1597956, -0.3242165, -4.205828, 0, 1, 0.3803922, 1,
-0.1567588, 0.09946201, -1.038622, 0, 1, 0.3882353, 1,
-0.1536534, -0.9329978, -4.024385, 0, 1, 0.3921569, 1,
-0.1501378, 0.1885209, -0.1418296, 0, 1, 0.4, 1,
-0.1460091, 0.09973615, 1.667977, 0, 1, 0.4078431, 1,
-0.1411816, -0.05070707, -1.860947, 0, 1, 0.4117647, 1,
-0.1397612, 0.8397483, -1.346495, 0, 1, 0.4196078, 1,
-0.1394372, 0.5085482, 0.3305548, 0, 1, 0.4235294, 1,
-0.138857, -0.589089, -2.773451, 0, 1, 0.4313726, 1,
-0.1385981, 0.9612405, 0.4898171, 0, 1, 0.4352941, 1,
-0.1345494, 0.6478283, 0.8416799, 0, 1, 0.4431373, 1,
-0.1341787, 0.1589434, 0.2849872, 0, 1, 0.4470588, 1,
-0.1242131, 0.0438114, -1.536289, 0, 1, 0.454902, 1,
-0.1192756, -1.280924, -1.871941, 0, 1, 0.4588235, 1,
-0.1112103, 0.612648, -1.458706, 0, 1, 0.4666667, 1,
-0.09878355, 1.445451, -0.4815607, 0, 1, 0.4705882, 1,
-0.09716031, -1.05266, -3.314605, 0, 1, 0.4784314, 1,
-0.09563724, 1.443611, 1.070269, 0, 1, 0.4823529, 1,
-0.09218304, 0.4746618, 0.2419751, 0, 1, 0.4901961, 1,
-0.09048348, 0.6264212, -2.053665, 0, 1, 0.4941176, 1,
-0.08744554, -1.545818, -3.454542, 0, 1, 0.5019608, 1,
-0.08733845, 1.194186, 1.74734, 0, 1, 0.509804, 1,
-0.08566198, -1.766093, -4.072799, 0, 1, 0.5137255, 1,
-0.07998889, 1.495386, -0.13878, 0, 1, 0.5215687, 1,
-0.07745943, 2.419058, 0.3436794, 0, 1, 0.5254902, 1,
-0.07702853, 0.9296401, -1.422387, 0, 1, 0.5333334, 1,
-0.07301676, -0.8605111, -2.993779, 0, 1, 0.5372549, 1,
-0.07153671, 0.1678437, 0.7143636, 0, 1, 0.5450981, 1,
-0.07044329, -0.583346, -2.582941, 0, 1, 0.5490196, 1,
-0.07003766, 0.2961786, -1.269244, 0, 1, 0.5568628, 1,
-0.06884219, 0.5432091, -0.4639441, 0, 1, 0.5607843, 1,
-0.06678006, -0.8842407, -4.365327, 0, 1, 0.5686275, 1,
-0.0585403, -0.2972435, -4.760209, 0, 1, 0.572549, 1,
-0.05687942, 0.547855, 0.2460219, 0, 1, 0.5803922, 1,
-0.05652605, -0.2290622, -2.015229, 0, 1, 0.5843138, 1,
-0.0529687, 0.524601, 1.444455, 0, 1, 0.5921569, 1,
-0.05295707, 0.2818724, 0.2130302, 0, 1, 0.5960785, 1,
-0.05226184, 1.319391, 0.7170668, 0, 1, 0.6039216, 1,
-0.05222411, 0.6425937, -1.325117, 0, 1, 0.6117647, 1,
-0.05043662, -0.006350761, -3.064629, 0, 1, 0.6156863, 1,
-0.04734193, -1.871218, -4.35533, 0, 1, 0.6235294, 1,
-0.03989795, -0.1709175, -4.247831, 0, 1, 0.627451, 1,
-0.03956439, 0.3829598, 1.158917, 0, 1, 0.6352941, 1,
-0.03588829, 0.1334182, -0.4034106, 0, 1, 0.6392157, 1,
-0.03562441, -0.180157, -2.966377, 0, 1, 0.6470588, 1,
-0.03382324, 0.6724539, -0.9547507, 0, 1, 0.6509804, 1,
-0.03362392, -1.968883, -3.721113, 0, 1, 0.6588235, 1,
-0.03236716, -0.4321683, -1.80528, 0, 1, 0.6627451, 1,
-0.03105124, 0.02569455, -0.6775522, 0, 1, 0.6705883, 1,
-0.02725498, -1.289291, -3.103356, 0, 1, 0.6745098, 1,
-0.02568892, -0.8306376, -2.667658, 0, 1, 0.682353, 1,
-0.02516281, 0.5115033, -1.270732, 0, 1, 0.6862745, 1,
-0.02507455, 2.904071, 1.000725, 0, 1, 0.6941177, 1,
-0.01813677, -0.4043225, -3.662908, 0, 1, 0.7019608, 1,
-0.01683737, -1.564305, -2.574064, 0, 1, 0.7058824, 1,
-0.01175982, -1.06719, -5.257329, 0, 1, 0.7137255, 1,
-0.009469952, 0.8851402, -0.2309166, 0, 1, 0.7176471, 1,
-0.003022698, 0.9674666, 0.3841861, 0, 1, 0.7254902, 1,
0.001346076, -0.1166308, 2.270849, 0, 1, 0.7294118, 1,
0.002284707, -0.04919671, 2.106729, 0, 1, 0.7372549, 1,
0.002632417, -1.667845, 2.882254, 0, 1, 0.7411765, 1,
0.003176854, -0.1236759, 3.44761, 0, 1, 0.7490196, 1,
0.005062378, 1.686622, -0.9236121, 0, 1, 0.7529412, 1,
0.007777406, 0.07169224, -0.3644361, 0, 1, 0.7607843, 1,
0.0079197, -1.403886, 2.063355, 0, 1, 0.7647059, 1,
0.009692771, 1.12231, -0.9804124, 0, 1, 0.772549, 1,
0.01083292, 0.4527287, 0.514583, 0, 1, 0.7764706, 1,
0.01120408, 0.9744002, 0.5643562, 0, 1, 0.7843137, 1,
0.01302295, 0.8582395, -0.4288491, 0, 1, 0.7882353, 1,
0.01640137, 2.640638, -1.350349, 0, 1, 0.7960784, 1,
0.01721301, 0.556742, 1.636575, 0, 1, 0.8039216, 1,
0.02320942, 0.3678256, 0.5317947, 0, 1, 0.8078431, 1,
0.0232883, -0.2043305, 1.948861, 0, 1, 0.8156863, 1,
0.02410561, 0.8652268, 0.6060215, 0, 1, 0.8196079, 1,
0.02414166, -0.4557196, 2.970968, 0, 1, 0.827451, 1,
0.02476539, -1.180831, 5.999828, 0, 1, 0.8313726, 1,
0.02858069, -0.3181866, 2.975814, 0, 1, 0.8392157, 1,
0.03153237, 0.08699741, 0.819502, 0, 1, 0.8431373, 1,
0.032683, -0.8255293, 4.166662, 0, 1, 0.8509804, 1,
0.03495485, 0.1850696, -0.4213348, 0, 1, 0.854902, 1,
0.04018686, -0.7488126, 3.251066, 0, 1, 0.8627451, 1,
0.04114444, 0.05622721, -0.4678091, 0, 1, 0.8666667, 1,
0.04166438, 0.1371284, 2.373373, 0, 1, 0.8745098, 1,
0.04179529, -0.05580338, 2.329846, 0, 1, 0.8784314, 1,
0.04307833, -1.779577, 1.498361, 0, 1, 0.8862745, 1,
0.04352878, -0.1570195, 2.155764, 0, 1, 0.8901961, 1,
0.04494414, 0.7545542, -1.516388, 0, 1, 0.8980392, 1,
0.04796105, -1.126682, 2.980006, 0, 1, 0.9058824, 1,
0.04817038, -0.0003387147, 0.7009549, 0, 1, 0.9098039, 1,
0.0499888, 0.9560437, 0.2700685, 0, 1, 0.9176471, 1,
0.05043409, -1.583693, 4.905157, 0, 1, 0.9215686, 1,
0.05166589, 1.083584, -0.3800139, 0, 1, 0.9294118, 1,
0.05301807, 1.223527, 1.106707, 0, 1, 0.9333333, 1,
0.05339438, -0.7848618, 2.495399, 0, 1, 0.9411765, 1,
0.05800338, -1.093264, 2.363733, 0, 1, 0.945098, 1,
0.05800719, 1.661821, -0.4793505, 0, 1, 0.9529412, 1,
0.05818078, 0.09300158, -0.524388, 0, 1, 0.9568627, 1,
0.05919037, -0.9376822, 1.919824, 0, 1, 0.9647059, 1,
0.05988012, 0.4980639, 0.1084347, 0, 1, 0.9686275, 1,
0.06008237, 0.5179222, -0.3122808, 0, 1, 0.9764706, 1,
0.06328735, 0.890924, -0.8048667, 0, 1, 0.9803922, 1,
0.06633472, 0.6755728, 0.6678789, 0, 1, 0.9882353, 1,
0.06644589, 0.127625, 0.1880216, 0, 1, 0.9921569, 1,
0.06650489, -1.600472, 3.525607, 0, 1, 1, 1,
0.06842469, 0.2822263, 0.148725, 0, 0.9921569, 1, 1,
0.07686971, 1.885989, 1.982693, 0, 0.9882353, 1, 1,
0.07845234, -1.393579, 3.166792, 0, 0.9803922, 1, 1,
0.07925042, 0.3164496, 0.9649022, 0, 0.9764706, 1, 1,
0.0873955, -0.03151109, 1.885462, 0, 0.9686275, 1, 1,
0.08910061, 0.5712083, 2.273724, 0, 0.9647059, 1, 1,
0.09343635, -1.068088, 2.082534, 0, 0.9568627, 1, 1,
0.09591741, 0.7307391, -0.9775062, 0, 0.9529412, 1, 1,
0.09620661, 1.798199, 1.114502, 0, 0.945098, 1, 1,
0.09788284, 0.3381311, -1.115556, 0, 0.9411765, 1, 1,
0.1002913, 0.6551624, 0.4388695, 0, 0.9333333, 1, 1,
0.1003078, -1.813966, 3.453626, 0, 0.9294118, 1, 1,
0.1011102, -1.1926, 2.734974, 0, 0.9215686, 1, 1,
0.1017252, 1.451315, 1.794574, 0, 0.9176471, 1, 1,
0.1022835, 1.059238, 0.8396025, 0, 0.9098039, 1, 1,
0.104011, 1.354259, 0.6447824, 0, 0.9058824, 1, 1,
0.105174, -0.07156456, 3.009233, 0, 0.8980392, 1, 1,
0.1130079, 2.339319, 1.047301, 0, 0.8901961, 1, 1,
0.1153946, 0.3545254, -0.7093578, 0, 0.8862745, 1, 1,
0.1205305, 0.0114319, 0.02423574, 0, 0.8784314, 1, 1,
0.1207763, -0.07496166, 0.2689709, 0, 0.8745098, 1, 1,
0.1217449, -1.468502, 2.325265, 0, 0.8666667, 1, 1,
0.1315339, -1.656263, 3.220472, 0, 0.8627451, 1, 1,
0.1328788, -1.055605, 3.741023, 0, 0.854902, 1, 1,
0.1349393, 0.2448128, 1.528478, 0, 0.8509804, 1, 1,
0.1365715, 1.150009, -0.3396189, 0, 0.8431373, 1, 1,
0.1380133, 0.6445373, -0.06300202, 0, 0.8392157, 1, 1,
0.1382885, -2.575765, 3.425301, 0, 0.8313726, 1, 1,
0.1385008, 1.118264, -0.2580766, 0, 0.827451, 1, 1,
0.1422058, -0.3717511, 3.622948, 0, 0.8196079, 1, 1,
0.1445731, -1.522143, 3.543031, 0, 0.8156863, 1, 1,
0.1488487, 0.1266542, 1.013031, 0, 0.8078431, 1, 1,
0.1543211, -0.3685744, 2.209419, 0, 0.8039216, 1, 1,
0.1604543, 0.6063838, -1.030532, 0, 0.7960784, 1, 1,
0.1608341, 1.441228, 0.4742918, 0, 0.7882353, 1, 1,
0.1634302, 0.5322801, -1.812238, 0, 0.7843137, 1, 1,
0.1651619, -0.3897004, 3.455901, 0, 0.7764706, 1, 1,
0.1685884, 0.8560923, 0.1855782, 0, 0.772549, 1, 1,
0.170575, 1.058723, -1.031384, 0, 0.7647059, 1, 1,
0.1730052, 0.6463643, -0.1322484, 0, 0.7607843, 1, 1,
0.1749624, -0.8958387, 3.146661, 0, 0.7529412, 1, 1,
0.1757878, 0.118624, 0.7533155, 0, 0.7490196, 1, 1,
0.1778229, 0.9508831, -0.0799461, 0, 0.7411765, 1, 1,
0.1780466, 0.6176546, -0.7069251, 0, 0.7372549, 1, 1,
0.1797128, 0.1425078, 2.020469, 0, 0.7294118, 1, 1,
0.1797204, 1.38268, -0.7916046, 0, 0.7254902, 1, 1,
0.1802735, -0.3749428, 2.4431, 0, 0.7176471, 1, 1,
0.1819906, -0.2742079, 1.280041, 0, 0.7137255, 1, 1,
0.1819923, -0.5028912, 4.446467, 0, 0.7058824, 1, 1,
0.1840872, -0.1514645, 2.452436, 0, 0.6980392, 1, 1,
0.184179, -1.033194, 1.940554, 0, 0.6941177, 1, 1,
0.1844969, 1.651694, -0.03176011, 0, 0.6862745, 1, 1,
0.1854193, -0.9950924, 1.106688, 0, 0.682353, 1, 1,
0.1877229, 1.673223, -0.05087839, 0, 0.6745098, 1, 1,
0.1888577, -0.3295372, 2.264503, 0, 0.6705883, 1, 1,
0.1923698, -0.8323807, 3.153494, 0, 0.6627451, 1, 1,
0.1935969, -0.4622992, 3.753324, 0, 0.6588235, 1, 1,
0.1938819, 0.7128498, 0.8204898, 0, 0.6509804, 1, 1,
0.1990305, -1.18234, 1.127322, 0, 0.6470588, 1, 1,
0.1998458, -0.2244091, 3.646022, 0, 0.6392157, 1, 1,
0.2011454, 1.238029, -0.4494414, 0, 0.6352941, 1, 1,
0.2049976, 0.6973995, -0.1689975, 0, 0.627451, 1, 1,
0.2051374, 1.748285, 1.482825, 0, 0.6235294, 1, 1,
0.2060697, 0.9732286, -0.07029744, 0, 0.6156863, 1, 1,
0.20813, 1.680728, -0.39696, 0, 0.6117647, 1, 1,
0.2087574, 0.691471, 1.150653, 0, 0.6039216, 1, 1,
0.2224492, 0.5207337, 0.7551752, 0, 0.5960785, 1, 1,
0.2260836, -0.2631887, 0.6497979, 0, 0.5921569, 1, 1,
0.2268853, -1.576791, 3.555579, 0, 0.5843138, 1, 1,
0.2269708, 1.07414, -0.3240101, 0, 0.5803922, 1, 1,
0.235688, 0.1628613, 1.071194, 0, 0.572549, 1, 1,
0.2430632, -1.915703, 2.895294, 0, 0.5686275, 1, 1,
0.2475831, 1.630606, 1.087757, 0, 0.5607843, 1, 1,
0.2530565, 0.0244847, 1.354539, 0, 0.5568628, 1, 1,
0.2557322, 0.0748142, 1.278911, 0, 0.5490196, 1, 1,
0.2559718, -1.022759, 0.7776278, 0, 0.5450981, 1, 1,
0.2616885, -0.06690088, 2.166961, 0, 0.5372549, 1, 1,
0.2654597, -1.936386, 4.656199, 0, 0.5333334, 1, 1,
0.270247, -1.444246, 2.658242, 0, 0.5254902, 1, 1,
0.2728278, -1.03386, 2.838751, 0, 0.5215687, 1, 1,
0.2729527, -0.5748707, 2.080796, 0, 0.5137255, 1, 1,
0.2767937, 0.07963451, 0.7217262, 0, 0.509804, 1, 1,
0.2772703, 1.497099, 0.6321442, 0, 0.5019608, 1, 1,
0.2807792, -0.09886852, 0.6951432, 0, 0.4941176, 1, 1,
0.282916, -0.7972521, 3.166402, 0, 0.4901961, 1, 1,
0.2866427, -0.9286461, 3.113619, 0, 0.4823529, 1, 1,
0.2885461, -0.5545279, 2.565594, 0, 0.4784314, 1, 1,
0.2913098, 0.01842161, 0.5046321, 0, 0.4705882, 1, 1,
0.2927184, -0.8853017, 2.537644, 0, 0.4666667, 1, 1,
0.3049321, 0.3541791, -0.2465547, 0, 0.4588235, 1, 1,
0.309296, -1.142025, 2.193018, 0, 0.454902, 1, 1,
0.3108075, -0.5744523, 0.3332555, 0, 0.4470588, 1, 1,
0.3119752, 0.2077882, 1.901789, 0, 0.4431373, 1, 1,
0.3142671, 0.925688, -0.669215, 0, 0.4352941, 1, 1,
0.3143244, -0.3770464, 1.384427, 0, 0.4313726, 1, 1,
0.3169307, -0.3866493, 1.469758, 0, 0.4235294, 1, 1,
0.3170343, -0.2223666, 2.361561, 0, 0.4196078, 1, 1,
0.3187377, 1.36126, -0.3318427, 0, 0.4117647, 1, 1,
0.3192524, -0.9936414, 2.882062, 0, 0.4078431, 1, 1,
0.3211643, -0.5495313, 3.787591, 0, 0.4, 1, 1,
0.321887, 0.5418351, -0.01554629, 0, 0.3921569, 1, 1,
0.3219195, 1.795988, -1.343599, 0, 0.3882353, 1, 1,
0.3274694, -1.229657, 2.327968, 0, 0.3803922, 1, 1,
0.3284272, 0.3896771, 0.9157219, 0, 0.3764706, 1, 1,
0.3339548, 0.850467, 1.313935, 0, 0.3686275, 1, 1,
0.3348252, -2.07909, 3.02096, 0, 0.3647059, 1, 1,
0.3371959, -1.731119, 2.031624, 0, 0.3568628, 1, 1,
0.3443869, -0.2762328, 2.793818, 0, 0.3529412, 1, 1,
0.3489734, 0.2142195, 2.023459, 0, 0.345098, 1, 1,
0.3513376, 0.2626225, 1.557944, 0, 0.3411765, 1, 1,
0.3541161, -0.876292, 3.866412, 0, 0.3333333, 1, 1,
0.3599018, -0.4411132, 2.485368, 0, 0.3294118, 1, 1,
0.3640223, -0.3679251, 2.480523, 0, 0.3215686, 1, 1,
0.3646531, 0.9727724, 2.359123, 0, 0.3176471, 1, 1,
0.3658194, 1.443494, 0.2752746, 0, 0.3098039, 1, 1,
0.36709, 0.2132173, -0.8471485, 0, 0.3058824, 1, 1,
0.3749285, -1.514698, 1.488654, 0, 0.2980392, 1, 1,
0.3768035, -0.2341327, 3.958929, 0, 0.2901961, 1, 1,
0.3774145, -1.226607, 2.457944, 0, 0.2862745, 1, 1,
0.3821791, 0.8900403, -0.6040149, 0, 0.2784314, 1, 1,
0.3832107, 0.414691, 0.5231759, 0, 0.2745098, 1, 1,
0.3843105, 1.237255, -1.096511, 0, 0.2666667, 1, 1,
0.3862688, -2.095409, 3.167892, 0, 0.2627451, 1, 1,
0.3886738, -0.5351925, 2.353262, 0, 0.254902, 1, 1,
0.3903756, -0.5494412, 0.8685269, 0, 0.2509804, 1, 1,
0.3951148, 0.5423945, -0.4170522, 0, 0.2431373, 1, 1,
0.395875, 1.967771, 0.7188357, 0, 0.2392157, 1, 1,
0.3964523, 0.74098, 0.7769555, 0, 0.2313726, 1, 1,
0.4006045, 0.2892819, 1.352374, 0, 0.227451, 1, 1,
0.4010056, -0.3246177, 2.769612, 0, 0.2196078, 1, 1,
0.4016356, 0.9000546, 1.090489, 0, 0.2156863, 1, 1,
0.4022959, 2.405704, 2.490766, 0, 0.2078431, 1, 1,
0.4060955, -0.4215648, 3.706658, 0, 0.2039216, 1, 1,
0.408446, -0.4507686, 0.633732, 0, 0.1960784, 1, 1,
0.4161351, -2.619914, 2.876815, 0, 0.1882353, 1, 1,
0.4216412, 0.08348791, 1.5279, 0, 0.1843137, 1, 1,
0.4222644, -0.8388007, 2.97094, 0, 0.1764706, 1, 1,
0.4227112, 1.370665, -0.705121, 0, 0.172549, 1, 1,
0.4241214, -1.191864, 4.340764, 0, 0.1647059, 1, 1,
0.426786, 0.7620605, 2.255807, 0, 0.1607843, 1, 1,
0.433718, 1.139505, 1.539567, 0, 0.1529412, 1, 1,
0.4350595, 2.199437, 0.144699, 0, 0.1490196, 1, 1,
0.4361565, 0.2031473, 0.3406181, 0, 0.1411765, 1, 1,
0.4377697, -0.4420621, 2.791483, 0, 0.1372549, 1, 1,
0.439483, -1.511834, 3.702517, 0, 0.1294118, 1, 1,
0.440805, -1.440587, 3.679887, 0, 0.1254902, 1, 1,
0.4428273, -0.529958, 1.469348, 0, 0.1176471, 1, 1,
0.4437094, -0.5204647, 2.485078, 0, 0.1137255, 1, 1,
0.4445941, -1.403395, 0.623239, 0, 0.1058824, 1, 1,
0.4453101, 0.6190823, 0.4384164, 0, 0.09803922, 1, 1,
0.446232, -0.8813509, 2.51775, 0, 0.09411765, 1, 1,
0.4479056, 0.8894609, 2.29723, 0, 0.08627451, 1, 1,
0.4510854, 0.1331453, 1.832683, 0, 0.08235294, 1, 1,
0.4520157, -0.1179142, 2.463595, 0, 0.07450981, 1, 1,
0.452848, -1.141699, 2.290007, 0, 0.07058824, 1, 1,
0.4572317, -1.24819, 3.578329, 0, 0.0627451, 1, 1,
0.4585274, 0.08072214, 2.571591, 0, 0.05882353, 1, 1,
0.4586828, -0.652833, 4.185268, 0, 0.05098039, 1, 1,
0.4590271, 0.08050367, 0.712754, 0, 0.04705882, 1, 1,
0.4603625, 0.1697663, 1.488125, 0, 0.03921569, 1, 1,
0.4638203, 0.2340734, -0.9927567, 0, 0.03529412, 1, 1,
0.468373, -0.6794637, 2.508737, 0, 0.02745098, 1, 1,
0.4736153, 0.8650337, -0.5342539, 0, 0.02352941, 1, 1,
0.478106, -1.000343, 1.809236, 0, 0.01568628, 1, 1,
0.4805566, -1.499253, 2.785753, 0, 0.01176471, 1, 1,
0.4806933, -0.9500582, 3.079132, 0, 0.003921569, 1, 1,
0.4846779, -0.9507133, 3.750892, 0.003921569, 0, 1, 1,
0.4902029, -0.1056776, 0.1481517, 0.007843138, 0, 1, 1,
0.4903563, 0.5511523, 1.035131, 0.01568628, 0, 1, 1,
0.5023766, 0.5360529, 0.1521603, 0.01960784, 0, 1, 1,
0.5059625, -0.3900817, 3.7086, 0.02745098, 0, 1, 1,
0.5077651, 1.341039, -1.280443, 0.03137255, 0, 1, 1,
0.5117769, 0.1172419, 4.576303, 0.03921569, 0, 1, 1,
0.5119891, -0.8364381, 1.612557, 0.04313726, 0, 1, 1,
0.5129361, -0.4775082, 3.368109, 0.05098039, 0, 1, 1,
0.520859, -0.6462873, 3.08127, 0.05490196, 0, 1, 1,
0.52306, -1.076726, 1.353477, 0.0627451, 0, 1, 1,
0.5248157, -0.6627295, 2.978935, 0.06666667, 0, 1, 1,
0.5250008, 0.3945738, 2.099342, 0.07450981, 0, 1, 1,
0.5250301, 0.2908324, 0.5491842, 0.07843138, 0, 1, 1,
0.5266242, 0.5485598, 0.722984, 0.08627451, 0, 1, 1,
0.5301324, 0.6394566, -0.03036042, 0.09019608, 0, 1, 1,
0.5304376, 0.6522623, 1.420615, 0.09803922, 0, 1, 1,
0.536671, 0.7953572, 1.156326, 0.1058824, 0, 1, 1,
0.5385729, 0.5780309, -0.0536832, 0.1098039, 0, 1, 1,
0.5391527, 0.9114304, 0.8953118, 0.1176471, 0, 1, 1,
0.5454144, -0.6107227, 1.383299, 0.1215686, 0, 1, 1,
0.5505248, -0.1825304, 1.997476, 0.1294118, 0, 1, 1,
0.550707, 1.493217, 1.0137, 0.1333333, 0, 1, 1,
0.5542256, 0.6087712, 0.5509713, 0.1411765, 0, 1, 1,
0.5560957, -1.174908, 0.9297856, 0.145098, 0, 1, 1,
0.5623791, -0.6999207, 2.157575, 0.1529412, 0, 1, 1,
0.564371, 0.6246182, 0.7723011, 0.1568628, 0, 1, 1,
0.5686536, 1.654544, -0.1704454, 0.1647059, 0, 1, 1,
0.5696651, -0.05701348, 1.726661, 0.1686275, 0, 1, 1,
0.5699936, -1.653197, 2.311985, 0.1764706, 0, 1, 1,
0.5718591, -0.5680602, 2.046278, 0.1803922, 0, 1, 1,
0.5727569, -0.6929225, 2.255299, 0.1882353, 0, 1, 1,
0.5730512, 0.5942086, 0.07729106, 0.1921569, 0, 1, 1,
0.5735103, -0.2174792, 3.416995, 0.2, 0, 1, 1,
0.5754058, -1.47915, 3.006838, 0.2078431, 0, 1, 1,
0.575559, -0.5589391, 1.196203, 0.2117647, 0, 1, 1,
0.5789538, 0.6104462, 0.3121595, 0.2196078, 0, 1, 1,
0.5789866, 1.303761, 0.3207821, 0.2235294, 0, 1, 1,
0.5809364, 0.8975687, 0.8876133, 0.2313726, 0, 1, 1,
0.5893132, 0.3466719, 0.8101586, 0.2352941, 0, 1, 1,
0.5900578, 0.911705, 0.8396913, 0.2431373, 0, 1, 1,
0.5918865, 1.539821, 1.703267, 0.2470588, 0, 1, 1,
0.5931687, 0.2897962, 1.388143, 0.254902, 0, 1, 1,
0.5935095, -1.81924, 4.542566, 0.2588235, 0, 1, 1,
0.597104, 0.2701781, 0.5310465, 0.2666667, 0, 1, 1,
0.5985096, -0.698256, 1.217748, 0.2705882, 0, 1, 1,
0.6010577, -1.275398, 2.672185, 0.2784314, 0, 1, 1,
0.6033763, 0.7656972, 1.598714, 0.282353, 0, 1, 1,
0.6174569, -0.3154294, 1.505432, 0.2901961, 0, 1, 1,
0.6178921, 0.2508744, 1.455761, 0.2941177, 0, 1, 1,
0.6228294, -0.8143581, 4.044365, 0.3019608, 0, 1, 1,
0.6263223, 0.1389009, 2.866362, 0.3098039, 0, 1, 1,
0.6348313, -0.4688559, 2.464715, 0.3137255, 0, 1, 1,
0.6419211, 2.702927, -0.03767961, 0.3215686, 0, 1, 1,
0.6457469, 0.518366, 1.720832, 0.3254902, 0, 1, 1,
0.6575559, 0.09289935, -0.02539784, 0.3333333, 0, 1, 1,
0.6588904, 0.2675148, 1.091738, 0.3372549, 0, 1, 1,
0.6619043, 0.2068491, 1.45216, 0.345098, 0, 1, 1,
0.6628916, -1.15912, 4.06463, 0.3490196, 0, 1, 1,
0.6649932, 0.4905341, 1.583332, 0.3568628, 0, 1, 1,
0.6657848, -0.1908106, 2.185176, 0.3607843, 0, 1, 1,
0.6693379, 0.2348005, 2.1106, 0.3686275, 0, 1, 1,
0.6735135, -1.584669, 3.279304, 0.372549, 0, 1, 1,
0.6784288, 1.725188, -0.290185, 0.3803922, 0, 1, 1,
0.6795579, -1.021365, 4.270627, 0.3843137, 0, 1, 1,
0.6848916, 2.28556, -0.2367358, 0.3921569, 0, 1, 1,
0.6943983, 1.433484, 0.1297797, 0.3960784, 0, 1, 1,
0.6977202, -0.6273508, 2.683274, 0.4039216, 0, 1, 1,
0.700342, -2.081211, 2.704747, 0.4117647, 0, 1, 1,
0.703789, 0.3854353, 2.048233, 0.4156863, 0, 1, 1,
0.7075139, 0.5981451, 1.044879, 0.4235294, 0, 1, 1,
0.7084507, 0.606786, 1.006167, 0.427451, 0, 1, 1,
0.7166568, -2.316867, 1.925014, 0.4352941, 0, 1, 1,
0.7189184, -0.2510154, 2.144423, 0.4392157, 0, 1, 1,
0.7329363, 0.1500642, 1.955307, 0.4470588, 0, 1, 1,
0.7361135, -0.1497635, 2.037797, 0.4509804, 0, 1, 1,
0.7365265, -0.1030823, 1.694254, 0.4588235, 0, 1, 1,
0.737133, -0.7503471, 2.254814, 0.4627451, 0, 1, 1,
0.7386389, -0.418112, 3.439954, 0.4705882, 0, 1, 1,
0.7395519, -0.1645285, 2.369913, 0.4745098, 0, 1, 1,
0.7453387, 0.04020474, 0.06907488, 0.4823529, 0, 1, 1,
0.7472503, -0.9745852, 1.568808, 0.4862745, 0, 1, 1,
0.7535783, -0.1776329, 1.065828, 0.4941176, 0, 1, 1,
0.758239, 1.875531, 0.9011881, 0.5019608, 0, 1, 1,
0.7601871, 0.08347128, 2.367706, 0.5058824, 0, 1, 1,
0.7618717, -0.7417729, 1.613844, 0.5137255, 0, 1, 1,
0.765275, -0.5205453, 2.276949, 0.5176471, 0, 1, 1,
0.7704988, -0.7070347, 1.654554, 0.5254902, 0, 1, 1,
0.7724195, 0.6475707, -0.427068, 0.5294118, 0, 1, 1,
0.7861621, -0.1656363, 0.9846302, 0.5372549, 0, 1, 1,
0.7876795, -0.7628817, 3.843445, 0.5411765, 0, 1, 1,
0.7888159, -1.512178, 4.331869, 0.5490196, 0, 1, 1,
0.7936651, -0.4465336, 1.873319, 0.5529412, 0, 1, 1,
0.7949281, -0.2017178, 1.019237, 0.5607843, 0, 1, 1,
0.7973451, -1.518971, 1.988629, 0.5647059, 0, 1, 1,
0.7983908, -0.9061405, 2.253067, 0.572549, 0, 1, 1,
0.8005214, 0.5652288, -0.5169702, 0.5764706, 0, 1, 1,
0.8010755, -0.3440742, 1.348316, 0.5843138, 0, 1, 1,
0.8073415, 0.8199174, 0.6850688, 0.5882353, 0, 1, 1,
0.8119433, 1.329705, 0.8613834, 0.5960785, 0, 1, 1,
0.8141093, 0.398972, 1.465906, 0.6039216, 0, 1, 1,
0.8177053, 0.8672796, 1.080328, 0.6078432, 0, 1, 1,
0.8190698, -0.355245, 3.342603, 0.6156863, 0, 1, 1,
0.8215123, -0.9949163, 1.312431, 0.6196079, 0, 1, 1,
0.824074, 0.7329746, 1.751954, 0.627451, 0, 1, 1,
0.8294957, -1.432147, 2.851851, 0.6313726, 0, 1, 1,
0.8320808, 1.183224, -0.2737051, 0.6392157, 0, 1, 1,
0.836158, -9.790684e-05, 1.148823, 0.6431373, 0, 1, 1,
0.8383338, -2.329232, -0.03623006, 0.6509804, 0, 1, 1,
0.8384015, -0.09897149, 3.763325, 0.654902, 0, 1, 1,
0.8413172, -0.2538561, 3.849888, 0.6627451, 0, 1, 1,
0.8413598, 1.463515, 0.3891667, 0.6666667, 0, 1, 1,
0.8478416, 0.7356825, 0.08304171, 0.6745098, 0, 1, 1,
0.8507743, -0.6936746, 0.7850657, 0.6784314, 0, 1, 1,
0.853195, -0.1918924, 2.723081, 0.6862745, 0, 1, 1,
0.859632, -0.5700884, 2.511707, 0.6901961, 0, 1, 1,
0.8617943, 0.6911862, 2.985087, 0.6980392, 0, 1, 1,
0.8636489, 0.6905206, 1.776852, 0.7058824, 0, 1, 1,
0.869384, -1.365233, 2.384534, 0.7098039, 0, 1, 1,
0.8708644, -1.169972, 2.75402, 0.7176471, 0, 1, 1,
0.8752959, -0.2154779, 1.710118, 0.7215686, 0, 1, 1,
0.8797327, 0.970478, 2.649756, 0.7294118, 0, 1, 1,
0.8821054, 0.05041081, 0.4037192, 0.7333333, 0, 1, 1,
0.8836672, 1.149584, 2.523717, 0.7411765, 0, 1, 1,
0.8877014, 2.355735, 0.3472044, 0.7450981, 0, 1, 1,
0.8887271, 0.1904066, 1.882167, 0.7529412, 0, 1, 1,
0.891849, 0.1235247, 0.7965616, 0.7568628, 0, 1, 1,
0.8920578, 0.2801524, 1.852556, 0.7647059, 0, 1, 1,
0.8964323, -0.1047364, 3.137, 0.7686275, 0, 1, 1,
0.8987465, -1.115918, 2.602093, 0.7764706, 0, 1, 1,
0.9012073, 1.133262, 1.198692, 0.7803922, 0, 1, 1,
0.9062409, -1.155613, 0.9578044, 0.7882353, 0, 1, 1,
0.9134259, 1.542209, -1.296304, 0.7921569, 0, 1, 1,
0.9137369, -0.3250277, 3.035632, 0.8, 0, 1, 1,
0.9234406, 0.1505989, 1.989419, 0.8078431, 0, 1, 1,
0.9294282, 0.4512507, 0.500283, 0.8117647, 0, 1, 1,
0.9296209, -0.9168516, 2.815078, 0.8196079, 0, 1, 1,
0.9301345, -1.202172, 2.816495, 0.8235294, 0, 1, 1,
0.9336399, 0.5271569, 1.595807, 0.8313726, 0, 1, 1,
0.9394007, -1.391947, 3.353096, 0.8352941, 0, 1, 1,
0.9394144, 1.453243, 0.2175489, 0.8431373, 0, 1, 1,
0.9403866, -1.388406, 2.760691, 0.8470588, 0, 1, 1,
0.9414086, 0.1229082, 0.2607953, 0.854902, 0, 1, 1,
0.9434194, 0.2878949, 0.264827, 0.8588235, 0, 1, 1,
0.9459135, 0.3672321, -0.4806545, 0.8666667, 0, 1, 1,
0.9532022, 0.1006138, 2.256432, 0.8705882, 0, 1, 1,
0.9566312, 1.122621, 0.7392877, 0.8784314, 0, 1, 1,
0.9570022, 1.064915, 1.414028, 0.8823529, 0, 1, 1,
0.9606118, -0.9704402, 3.345208, 0.8901961, 0, 1, 1,
0.9723995, -0.5046838, 1.818755, 0.8941177, 0, 1, 1,
0.9806342, -1.020072, 2.439443, 0.9019608, 0, 1, 1,
0.9824775, -1.235545, 3.845848, 0.9098039, 0, 1, 1,
0.9849321, -0.5120224, 2.971091, 0.9137255, 0, 1, 1,
0.988296, -0.8184869, 1.699197, 0.9215686, 0, 1, 1,
0.9913728, 0.2173652, 1.113641, 0.9254902, 0, 1, 1,
0.9938796, -0.2842546, 1.085493, 0.9333333, 0, 1, 1,
0.9957244, 1.540615, -0.1352995, 0.9372549, 0, 1, 1,
0.9975904, 2.201809, 0.4696563, 0.945098, 0, 1, 1,
1.000084, -0.7410327, 0.8512318, 0.9490196, 0, 1, 1,
1.006997, 1.384856, 0.6000845, 0.9568627, 0, 1, 1,
1.008092, -0.712068, 3.136204, 0.9607843, 0, 1, 1,
1.0132, -0.1925596, 1.908697, 0.9686275, 0, 1, 1,
1.016033, 1.112606, -0.3621145, 0.972549, 0, 1, 1,
1.01667, -0.2825925, 1.847684, 0.9803922, 0, 1, 1,
1.016865, 0.4191827, 2.047137, 0.9843137, 0, 1, 1,
1.020437, 1.62861, 0.4079731, 0.9921569, 0, 1, 1,
1.026064, 0.07059208, 1.207799, 0.9960784, 0, 1, 1,
1.028189, 0.4439569, 3.285319, 1, 0, 0.9960784, 1,
1.029214, 1.124184, 0.1577624, 1, 0, 0.9882353, 1,
1.031247, 0.7839943, 1.792475, 1, 0, 0.9843137, 1,
1.03262, 1.822351, -0.0422933, 1, 0, 0.9764706, 1,
1.035719, 0.7839152, 1.112502, 1, 0, 0.972549, 1,
1.036225, 0.1943474, 2.102876, 1, 0, 0.9647059, 1,
1.04301, -1.179433, 3.547298, 1, 0, 0.9607843, 1,
1.048054, -1.789193, 4.192225, 1, 0, 0.9529412, 1,
1.052232, -0.08938965, 0.6058932, 1, 0, 0.9490196, 1,
1.062963, 1.882657, -0.1505759, 1, 0, 0.9411765, 1,
1.073762, 0.7863274, 0.8834073, 1, 0, 0.9372549, 1,
1.084723, 0.049449, -1.034113, 1, 0, 0.9294118, 1,
1.084806, -1.083179, 1.270764, 1, 0, 0.9254902, 1,
1.087336, -2.14573, 2.275948, 1, 0, 0.9176471, 1,
1.088421, 1.366295, 2.998879, 1, 0, 0.9137255, 1,
1.09039, -0.7354538, 2.470144, 1, 0, 0.9058824, 1,
1.097637, 0.671676, 0.08931181, 1, 0, 0.9019608, 1,
1.098267, 0.1334926, 2.663471, 1, 0, 0.8941177, 1,
1.121162, -0.3023605, 0.114677, 1, 0, 0.8862745, 1,
1.12354, 0.5470257, 2.088502, 1, 0, 0.8823529, 1,
1.128231, 0.5885742, 1.432975, 1, 0, 0.8745098, 1,
1.129487, -1.337056, 2.920845, 1, 0, 0.8705882, 1,
1.130125, 0.2087693, 1.900167, 1, 0, 0.8627451, 1,
1.130155, -0.4422458, 1.716374, 1, 0, 0.8588235, 1,
1.135964, -0.5655825, 2.629611, 1, 0, 0.8509804, 1,
1.138146, -1.055639, 2.36906, 1, 0, 0.8470588, 1,
1.139152, 0.8036512, 1.011811, 1, 0, 0.8392157, 1,
1.142438, 0.01497028, 1.724697, 1, 0, 0.8352941, 1,
1.143468, -0.02366872, 2.969263, 1, 0, 0.827451, 1,
1.148061, -1.172917, 2.741104, 1, 0, 0.8235294, 1,
1.148378, -0.1257518, 1.376373, 1, 0, 0.8156863, 1,
1.155483, 0.1488551, 2.343997, 1, 0, 0.8117647, 1,
1.157346, -0.8253443, 1.976665, 1, 0, 0.8039216, 1,
1.15869, 0.8226479, 1.898664, 1, 0, 0.7960784, 1,
1.160352, -0.3528962, 2.351725, 1, 0, 0.7921569, 1,
1.169823, -0.5557352, 1.9801, 1, 0, 0.7843137, 1,
1.170289, -1.620765, 3.348268, 1, 0, 0.7803922, 1,
1.178958, 0.0430187, 1.68834, 1, 0, 0.772549, 1,
1.189074, 0.2739116, 0.9918315, 1, 0, 0.7686275, 1,
1.189101, 0.5512887, 1.463051, 1, 0, 0.7607843, 1,
1.190445, 1.842438, 0.5653936, 1, 0, 0.7568628, 1,
1.190864, -2.529403, 4.174549, 1, 0, 0.7490196, 1,
1.191186, 0.5234129, 0.6236811, 1, 0, 0.7450981, 1,
1.19463, 0.1059299, 0.7063299, 1, 0, 0.7372549, 1,
1.198276, 1.079382, 1.746317, 1, 0, 0.7333333, 1,
1.199502, 0.2473162, -0.1629182, 1, 0, 0.7254902, 1,
1.20249, -0.5296829, 2.00529, 1, 0, 0.7215686, 1,
1.217208, 0.1774889, -0.4406188, 1, 0, 0.7137255, 1,
1.233159, 2.185247, -1.383775, 1, 0, 0.7098039, 1,
1.234679, 0.05394788, 1.765448, 1, 0, 0.7019608, 1,
1.243412, -1.291941, 1.792603, 1, 0, 0.6941177, 1,
1.248223, 1.739492, -0.05487548, 1, 0, 0.6901961, 1,
1.250878, -1.449466, 1.943452, 1, 0, 0.682353, 1,
1.251443, 1.015396, 0.8818858, 1, 0, 0.6784314, 1,
1.261834, 0.9208255, 2.589293, 1, 0, 0.6705883, 1,
1.263734, 0.8009953, 0.888877, 1, 0, 0.6666667, 1,
1.266885, 0.1624541, 2.237471, 1, 0, 0.6588235, 1,
1.272693, -2.424389, 2.98841, 1, 0, 0.654902, 1,
1.27673, -0.1715264, 2.535666, 1, 0, 0.6470588, 1,
1.300507, 0.8479978, 0.4061971, 1, 0, 0.6431373, 1,
1.30543, -1.315702, 2.372877, 1, 0, 0.6352941, 1,
1.322848, -0.4673428, 2.912996, 1, 0, 0.6313726, 1,
1.324873, 0.2506503, 1.530977, 1, 0, 0.6235294, 1,
1.3322, 0.7714844, 2.681759, 1, 0, 0.6196079, 1,
1.337461, 0.03023797, 1.288544, 1, 0, 0.6117647, 1,
1.341043, -0.1491726, 2.088887, 1, 0, 0.6078432, 1,
1.356049, -0.8441159, 2.690365, 1, 0, 0.6, 1,
1.356742, -0.4653647, 1.789679, 1, 0, 0.5921569, 1,
1.367143, 0.2419293, 0.175985, 1, 0, 0.5882353, 1,
1.380728, -1.248286, 2.246638, 1, 0, 0.5803922, 1,
1.381687, 0.2437827, 0.5438082, 1, 0, 0.5764706, 1,
1.386705, 0.573744, 3.038033, 1, 0, 0.5686275, 1,
1.388422, -1.134864, 0.6786638, 1, 0, 0.5647059, 1,
1.393722, 0.2584531, 1.651189, 1, 0, 0.5568628, 1,
1.403499, -0.6391041, 1.546804, 1, 0, 0.5529412, 1,
1.408101, -0.4381073, 2.050662, 1, 0, 0.5450981, 1,
1.40817, -1.609463, 2.512713, 1, 0, 0.5411765, 1,
1.408984, 0.04761321, 1.472252, 1, 0, 0.5333334, 1,
1.409758, 0.02875654, 1.107772, 1, 0, 0.5294118, 1,
1.415878, -0.2197442, 1.297832, 1, 0, 0.5215687, 1,
1.426057, -0.5409434, 2.138299, 1, 0, 0.5176471, 1,
1.426613, -0.7611918, 2.946765, 1, 0, 0.509804, 1,
1.432918, 0.6514989, 1.463182, 1, 0, 0.5058824, 1,
1.435908, 0.398824, 1.426164, 1, 0, 0.4980392, 1,
1.439993, 0.9630443, 0.1050491, 1, 0, 0.4901961, 1,
1.443005, 1.620844, -0.6892116, 1, 0, 0.4862745, 1,
1.446845, -1.834539, 3.5, 1, 0, 0.4784314, 1,
1.459759, -0.9542714, 0.7761473, 1, 0, 0.4745098, 1,
1.474598, 1.051343, -0.3861599, 1, 0, 0.4666667, 1,
1.480036, 1.07153, 1.607117, 1, 0, 0.4627451, 1,
1.481605, -0.6626425, 0.5276288, 1, 0, 0.454902, 1,
1.482398, -1.417667, 2.146091, 1, 0, 0.4509804, 1,
1.484755, -0.3070887, 3.152487, 1, 0, 0.4431373, 1,
1.489543, 0.7101614, 0.4478206, 1, 0, 0.4392157, 1,
1.490694, 1.716047, 1.924598, 1, 0, 0.4313726, 1,
1.502253, 0.08860885, 1.588908, 1, 0, 0.427451, 1,
1.515991, -0.4564785, 0.9505439, 1, 0, 0.4196078, 1,
1.518894, 0.5952544, 1.843206, 1, 0, 0.4156863, 1,
1.521039, -0.5054047, 1.396557, 1, 0, 0.4078431, 1,
1.534117, 1.222552, 1.536182, 1, 0, 0.4039216, 1,
1.538453, 0.009253306, 2.906803, 1, 0, 0.3960784, 1,
1.552187, -1.250825, 5.018691, 1, 0, 0.3882353, 1,
1.567483, 0.1663963, 1.465215, 1, 0, 0.3843137, 1,
1.575052, -1.196396, 1.928618, 1, 0, 0.3764706, 1,
1.589748, 1.128098, -0.7984812, 1, 0, 0.372549, 1,
1.59165, -0.7126265, 0.02208414, 1, 0, 0.3647059, 1,
1.595642, -0.7135819, 1.266846, 1, 0, 0.3607843, 1,
1.60588, 0.2249336, 0.4653224, 1, 0, 0.3529412, 1,
1.62348, -1.031565, 1.677974, 1, 0, 0.3490196, 1,
1.632781, 0.06080369, 1.762747, 1, 0, 0.3411765, 1,
1.640042, -0.05702475, 1.70924, 1, 0, 0.3372549, 1,
1.640921, 1.3327, 1.284135, 1, 0, 0.3294118, 1,
1.641595, 0.239274, 2.428583, 1, 0, 0.3254902, 1,
1.646463, -0.7801011, 0.7551917, 1, 0, 0.3176471, 1,
1.658301, -2.548286, 1.850229, 1, 0, 0.3137255, 1,
1.665435, -0.6325924, 1.79871, 1, 0, 0.3058824, 1,
1.715096, 0.1331572, 1.461504, 1, 0, 0.2980392, 1,
1.716112, 1.955541, -0.6228271, 1, 0, 0.2941177, 1,
1.742431, -0.03997608, 1.529257, 1, 0, 0.2862745, 1,
1.743149, 0.6064118, 2.717369, 1, 0, 0.282353, 1,
1.744019, 0.352533, 2.103635, 1, 0, 0.2745098, 1,
1.744239, 0.5806966, 0.2679446, 1, 0, 0.2705882, 1,
1.756379, 0.4480513, 0.6339291, 1, 0, 0.2627451, 1,
1.764798, -0.04470697, 0.397293, 1, 0, 0.2588235, 1,
1.783197, 0.8484098, 1.516153, 1, 0, 0.2509804, 1,
1.801074, -0.02730816, 2.191801, 1, 0, 0.2470588, 1,
1.801382, 0.9112447, 3.129208, 1, 0, 0.2392157, 1,
1.809458, 1.445432, 2.058367, 1, 0, 0.2352941, 1,
1.827297, 0.4409279, 0.8431385, 1, 0, 0.227451, 1,
1.831721, -1.043747, 1.589604, 1, 0, 0.2235294, 1,
1.848416, 0.8155333, 0.8918341, 1, 0, 0.2156863, 1,
1.866028, 2.151771, 1.535849, 1, 0, 0.2117647, 1,
1.875519, 2.291727, 1.09117, 1, 0, 0.2039216, 1,
1.876861, -1.651019, 1.382139, 1, 0, 0.1960784, 1,
1.895571, -0.4000954, 3.052357, 1, 0, 0.1921569, 1,
1.908891, -1.57575, 2.267359, 1, 0, 0.1843137, 1,
1.914766, -1.842771, 2.429785, 1, 0, 0.1803922, 1,
1.935967, 0.07030445, 0.8965096, 1, 0, 0.172549, 1,
1.936026, -0.9639906, 2.34387, 1, 0, 0.1686275, 1,
1.943892, -1.768088, 0.9909965, 1, 0, 0.1607843, 1,
1.984545, -1.024519, 0.5728618, 1, 0, 0.1568628, 1,
1.990164, -0.1302589, 0.5342007, 1, 0, 0.1490196, 1,
2.017781, -0.3300067, 2.141674, 1, 0, 0.145098, 1,
2.028573, 0.6222179, 1.92625, 1, 0, 0.1372549, 1,
2.037429, 1.418393, 2.149936, 1, 0, 0.1333333, 1,
2.044316, -1.915819, 1.723351, 1, 0, 0.1254902, 1,
2.048552, -1.392367, 2.163425, 1, 0, 0.1215686, 1,
2.095755, 0.28029, 1.085523, 1, 0, 0.1137255, 1,
2.149804, -1.338731, 3.839349, 1, 0, 0.1098039, 1,
2.194163, 1.14272, 1.461628, 1, 0, 0.1019608, 1,
2.209508, 0.3261386, 1.012393, 1, 0, 0.09411765, 1,
2.21869, 1.071295, 0.5854084, 1, 0, 0.09019608, 1,
2.238401, 0.7268553, 2.893887, 1, 0, 0.08235294, 1,
2.259085, -0.6583109, 1.053914, 1, 0, 0.07843138, 1,
2.285064, -0.2264029, 4.722437, 1, 0, 0.07058824, 1,
2.294885, 0.9612445, 1.63968, 1, 0, 0.06666667, 1,
2.305253, 0.7797632, 2.047216, 1, 0, 0.05882353, 1,
2.309595, 1.697961, -0.9057022, 1, 0, 0.05490196, 1,
2.331302, -0.299033, 1.246517, 1, 0, 0.04705882, 1,
2.479345, -0.245214, 2.404146, 1, 0, 0.04313726, 1,
2.511092, -0.5526927, 1.518878, 1, 0, 0.03529412, 1,
2.619341, -0.4017059, 0.9243167, 1, 0, 0.03137255, 1,
2.672675, 0.3251387, -0.7050153, 1, 0, 0.02352941, 1,
2.676732, -0.4141705, 0.8506491, 1, 0, 0.01960784, 1,
2.748687, -1.77316, 0.9171932, 1, 0, 0.01176471, 1,
3.102957, -2.077736, 2.603641, 1, 0, 0.007843138, 1
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
-0.02401721, -3.905419, -7.165417, 0, -0.5, 0.5, 0.5,
-0.02401721, -3.905419, -7.165417, 1, -0.5, 0.5, 0.5,
-0.02401721, -3.905419, -7.165417, 1, 1.5, 0.5, 0.5,
-0.02401721, -3.905419, -7.165417, 0, 1.5, 0.5, 0.5
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
-4.211035, 0.01276696, -7.165417, 0, -0.5, 0.5, 0.5,
-4.211035, 0.01276696, -7.165417, 1, -0.5, 0.5, 0.5,
-4.211035, 0.01276696, -7.165417, 1, 1.5, 0.5, 0.5,
-4.211035, 0.01276696, -7.165417, 0, 1.5, 0.5, 0.5
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
-4.211035, -3.905419, 0.3712497, 0, -0.5, 0.5, 0.5,
-4.211035, -3.905419, 0.3712497, 1, -0.5, 0.5, 0.5,
-4.211035, -3.905419, 0.3712497, 1, 1.5, 0.5, 0.5,
-4.211035, -3.905419, 0.3712497, 0, 1.5, 0.5, 0.5
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
-3, -3.001222, -5.426187,
3, -3.001222, -5.426187,
-3, -3.001222, -5.426187,
-3, -3.151922, -5.716058,
-2, -3.001222, -5.426187,
-2, -3.151922, -5.716058,
-1, -3.001222, -5.426187,
-1, -3.151922, -5.716058,
0, -3.001222, -5.426187,
0, -3.151922, -5.716058,
1, -3.001222, -5.426187,
1, -3.151922, -5.716058,
2, -3.001222, -5.426187,
2, -3.151922, -5.716058,
3, -3.001222, -5.426187,
3, -3.151922, -5.716058
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
-3, -3.453321, -6.295802, 0, -0.5, 0.5, 0.5,
-3, -3.453321, -6.295802, 1, -0.5, 0.5, 0.5,
-3, -3.453321, -6.295802, 1, 1.5, 0.5, 0.5,
-3, -3.453321, -6.295802, 0, 1.5, 0.5, 0.5,
-2, -3.453321, -6.295802, 0, -0.5, 0.5, 0.5,
-2, -3.453321, -6.295802, 1, -0.5, 0.5, 0.5,
-2, -3.453321, -6.295802, 1, 1.5, 0.5, 0.5,
-2, -3.453321, -6.295802, 0, 1.5, 0.5, 0.5,
-1, -3.453321, -6.295802, 0, -0.5, 0.5, 0.5,
-1, -3.453321, -6.295802, 1, -0.5, 0.5, 0.5,
-1, -3.453321, -6.295802, 1, 1.5, 0.5, 0.5,
-1, -3.453321, -6.295802, 0, 1.5, 0.5, 0.5,
0, -3.453321, -6.295802, 0, -0.5, 0.5, 0.5,
0, -3.453321, -6.295802, 1, -0.5, 0.5, 0.5,
0, -3.453321, -6.295802, 1, 1.5, 0.5, 0.5,
0, -3.453321, -6.295802, 0, 1.5, 0.5, 0.5,
1, -3.453321, -6.295802, 0, -0.5, 0.5, 0.5,
1, -3.453321, -6.295802, 1, -0.5, 0.5, 0.5,
1, -3.453321, -6.295802, 1, 1.5, 0.5, 0.5,
1, -3.453321, -6.295802, 0, 1.5, 0.5, 0.5,
2, -3.453321, -6.295802, 0, -0.5, 0.5, 0.5,
2, -3.453321, -6.295802, 1, -0.5, 0.5, 0.5,
2, -3.453321, -6.295802, 1, 1.5, 0.5, 0.5,
2, -3.453321, -6.295802, 0, 1.5, 0.5, 0.5,
3, -3.453321, -6.295802, 0, -0.5, 0.5, 0.5,
3, -3.453321, -6.295802, 1, -0.5, 0.5, 0.5,
3, -3.453321, -6.295802, 1, 1.5, 0.5, 0.5,
3, -3.453321, -6.295802, 0, 1.5, 0.5, 0.5
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
-3.2448, -2, -5.426187,
-3.2448, 2, -5.426187,
-3.2448, -2, -5.426187,
-3.405839, -2, -5.716058,
-3.2448, -1, -5.426187,
-3.405839, -1, -5.716058,
-3.2448, 0, -5.426187,
-3.405839, 0, -5.716058,
-3.2448, 1, -5.426187,
-3.405839, 1, -5.716058,
-3.2448, 2, -5.426187,
-3.405839, 2, -5.716058
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
-3.727918, -2, -6.295802, 0, -0.5, 0.5, 0.5,
-3.727918, -2, -6.295802, 1, -0.5, 0.5, 0.5,
-3.727918, -2, -6.295802, 1, 1.5, 0.5, 0.5,
-3.727918, -2, -6.295802, 0, 1.5, 0.5, 0.5,
-3.727918, -1, -6.295802, 0, -0.5, 0.5, 0.5,
-3.727918, -1, -6.295802, 1, -0.5, 0.5, 0.5,
-3.727918, -1, -6.295802, 1, 1.5, 0.5, 0.5,
-3.727918, -1, -6.295802, 0, 1.5, 0.5, 0.5,
-3.727918, 0, -6.295802, 0, -0.5, 0.5, 0.5,
-3.727918, 0, -6.295802, 1, -0.5, 0.5, 0.5,
-3.727918, 0, -6.295802, 1, 1.5, 0.5, 0.5,
-3.727918, 0, -6.295802, 0, 1.5, 0.5, 0.5,
-3.727918, 1, -6.295802, 0, -0.5, 0.5, 0.5,
-3.727918, 1, -6.295802, 1, -0.5, 0.5, 0.5,
-3.727918, 1, -6.295802, 1, 1.5, 0.5, 0.5,
-3.727918, 1, -6.295802, 0, 1.5, 0.5, 0.5,
-3.727918, 2, -6.295802, 0, -0.5, 0.5, 0.5,
-3.727918, 2, -6.295802, 1, -0.5, 0.5, 0.5,
-3.727918, 2, -6.295802, 1, 1.5, 0.5, 0.5,
-3.727918, 2, -6.295802, 0, 1.5, 0.5, 0.5
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
-3.2448, -3.001222, -4,
-3.2448, -3.001222, 4,
-3.2448, -3.001222, -4,
-3.405839, -3.151922, -4,
-3.2448, -3.001222, -2,
-3.405839, -3.151922, -2,
-3.2448, -3.001222, 0,
-3.405839, -3.151922, 0,
-3.2448, -3.001222, 2,
-3.405839, -3.151922, 2,
-3.2448, -3.001222, 4,
-3.405839, -3.151922, 4
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
-3.727918, -3.453321, -4, 0, -0.5, 0.5, 0.5,
-3.727918, -3.453321, -4, 1, -0.5, 0.5, 0.5,
-3.727918, -3.453321, -4, 1, 1.5, 0.5, 0.5,
-3.727918, -3.453321, -4, 0, 1.5, 0.5, 0.5,
-3.727918, -3.453321, -2, 0, -0.5, 0.5, 0.5,
-3.727918, -3.453321, -2, 1, -0.5, 0.5, 0.5,
-3.727918, -3.453321, -2, 1, 1.5, 0.5, 0.5,
-3.727918, -3.453321, -2, 0, 1.5, 0.5, 0.5,
-3.727918, -3.453321, 0, 0, -0.5, 0.5, 0.5,
-3.727918, -3.453321, 0, 1, -0.5, 0.5, 0.5,
-3.727918, -3.453321, 0, 1, 1.5, 0.5, 0.5,
-3.727918, -3.453321, 0, 0, 1.5, 0.5, 0.5,
-3.727918, -3.453321, 2, 0, -0.5, 0.5, 0.5,
-3.727918, -3.453321, 2, 1, -0.5, 0.5, 0.5,
-3.727918, -3.453321, 2, 1, 1.5, 0.5, 0.5,
-3.727918, -3.453321, 2, 0, 1.5, 0.5, 0.5,
-3.727918, -3.453321, 4, 0, -0.5, 0.5, 0.5,
-3.727918, -3.453321, 4, 1, -0.5, 0.5, 0.5,
-3.727918, -3.453321, 4, 1, 1.5, 0.5, 0.5,
-3.727918, -3.453321, 4, 0, 1.5, 0.5, 0.5
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
-3.2448, -3.001222, -5.426187,
-3.2448, 3.026756, -5.426187,
-3.2448, -3.001222, 6.168686,
-3.2448, 3.026756, 6.168686,
-3.2448, -3.001222, -5.426187,
-3.2448, -3.001222, 6.168686,
-3.2448, 3.026756, -5.426187,
-3.2448, 3.026756, 6.168686,
-3.2448, -3.001222, -5.426187,
3.196766, -3.001222, -5.426187,
-3.2448, -3.001222, 6.168686,
3.196766, -3.001222, 6.168686,
-3.2448, 3.026756, -5.426187,
3.196766, 3.026756, -5.426187,
-3.2448, 3.026756, 6.168686,
3.196766, 3.026756, 6.168686,
3.196766, -3.001222, -5.426187,
3.196766, 3.026756, -5.426187,
3.196766, -3.001222, 6.168686,
3.196766, 3.026756, 6.168686,
3.196766, -3.001222, -5.426187,
3.196766, -3.001222, 6.168686,
3.196766, 3.026756, -5.426187,
3.196766, 3.026756, 6.168686
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
var radius = 7.779849;
var distance = 34.61343;
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
mvMatrix.translate( 0.02401721, -0.01276696, -0.3712497 );
mvMatrix.scale( 1.305851, 1.395447, 0.7254694 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.61343);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
fluoridamid<-read.table("fluoridamid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluoridamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluoridamid' not found
```

```r
y<-fluoridamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluoridamid' not found
```

```r
z<-fluoridamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluoridamid' not found
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
-3.150991, -0.4211625, 0.07996061, 0, 0, 1, 1, 1,
-3.065665, 0.03034111, -2.032639, 1, 0, 0, 1, 1,
-2.885743, -0.291292, -0.230406, 1, 0, 0, 1, 1,
-2.744199, 0.3849409, -1.457248, 1, 0, 0, 1, 1,
-2.726344, -0.5782626, -1.318203, 1, 0, 0, 1, 1,
-2.705409, -0.8249711, -2.355686, 1, 0, 0, 1, 1,
-2.682622, -0.08025422, -1.002686, 0, 0, 0, 1, 1,
-2.525251, 0.01596473, -1.117872, 0, 0, 0, 1, 1,
-2.456686, 1.069356, 0.1316244, 0, 0, 0, 1, 1,
-2.412952, 0.5736046, -3.377374, 0, 0, 0, 1, 1,
-2.361029, -0.2848313, -2.087537, 0, 0, 0, 1, 1,
-2.331933, -0.3813711, -0.4641897, 0, 0, 0, 1, 1,
-2.33193, 1.033321, -1.26816, 0, 0, 0, 1, 1,
-2.323872, -0.4373203, -0.9610907, 1, 1, 1, 1, 1,
-2.286265, -1.074213, -2.41116, 1, 1, 1, 1, 1,
-2.275141, 1.916049, -2.374529, 1, 1, 1, 1, 1,
-2.250893, -0.1363285, -0.6114532, 1, 1, 1, 1, 1,
-2.194386, -0.07057726, 1.041718, 1, 1, 1, 1, 1,
-2.178849, -0.06153908, -1.972772, 1, 1, 1, 1, 1,
-2.171662, 2.326357, -1.230459, 1, 1, 1, 1, 1,
-2.123405, -1.447642, -1.955524, 1, 1, 1, 1, 1,
-2.086846, -0.8010287, -1.538946, 1, 1, 1, 1, 1,
-2.022352, -0.8852136, -2.934304, 1, 1, 1, 1, 1,
-2.007659, -0.2596635, 0.02774562, 1, 1, 1, 1, 1,
-1.942572, 0.3396404, -1.728275, 1, 1, 1, 1, 1,
-1.938204, 0.2169391, -1.473981, 1, 1, 1, 1, 1,
-1.918509, 0.5582548, -1.72553, 1, 1, 1, 1, 1,
-1.873713, 0.05845218, -0.02555017, 1, 1, 1, 1, 1,
-1.864416, 0.1153126, -2.588525, 0, 0, 1, 1, 1,
-1.853406, 1.04257, -1.349546, 1, 0, 0, 1, 1,
-1.849177, 1.048061, -0.739751, 1, 0, 0, 1, 1,
-1.825462, -1.57298, -3.143632, 1, 0, 0, 1, 1,
-1.823916, 0.6846209, -2.138591, 1, 0, 0, 1, 1,
-1.820595, -0.3433355, -1.82772, 1, 0, 0, 1, 1,
-1.814585, 0.9037033, -1.857845, 0, 0, 0, 1, 1,
-1.812563, 1.443789, -3.024963, 0, 0, 0, 1, 1,
-1.797897, 1.201312, -1.779164, 0, 0, 0, 1, 1,
-1.796192, 1.769296, -0.2925614, 0, 0, 0, 1, 1,
-1.78273, 0.913372, -0.4075014, 0, 0, 0, 1, 1,
-1.745082, 0.510675, -0.8668484, 0, 0, 0, 1, 1,
-1.687362, 0.2510015, 0.8340192, 0, 0, 0, 1, 1,
-1.659561, -0.1148663, -0.8908626, 1, 1, 1, 1, 1,
-1.656233, 1.669469, -0.6025453, 1, 1, 1, 1, 1,
-1.639793, 0.6057439, -2.441172, 1, 1, 1, 1, 1,
-1.630705, -0.6610196, -0.5441043, 1, 1, 1, 1, 1,
-1.626906, -0.803853, -2.409763, 1, 1, 1, 1, 1,
-1.607226, -0.6778671, -1.129206, 1, 1, 1, 1, 1,
-1.602552, 0.5245792, 0.1283063, 1, 1, 1, 1, 1,
-1.599448, -0.6407776, -3.156064, 1, 1, 1, 1, 1,
-1.598704, -0.1948056, -1.749543, 1, 1, 1, 1, 1,
-1.59782, 0.3759631, -2.392642, 1, 1, 1, 1, 1,
-1.591738, -0.6474732, -3.178494, 1, 1, 1, 1, 1,
-1.587942, -0.4198822, -1.121141, 1, 1, 1, 1, 1,
-1.583902, -0.3425835, -1.80329, 1, 1, 1, 1, 1,
-1.573585, 1.110107, -0.7358058, 1, 1, 1, 1, 1,
-1.570681, 0.6085008, -1.759711, 1, 1, 1, 1, 1,
-1.563111, -0.2590039, -2.905174, 0, 0, 1, 1, 1,
-1.561741, 2.17238, 0.2969344, 1, 0, 0, 1, 1,
-1.545341, -0.390139, -1.382212, 1, 0, 0, 1, 1,
-1.540195, 0.4172236, -0.388619, 1, 0, 0, 1, 1,
-1.524126, -0.1762295, -3.022895, 1, 0, 0, 1, 1,
-1.510967, 1.197549, -1.387445, 1, 0, 0, 1, 1,
-1.509242, 0.2344883, 0.09567139, 0, 0, 0, 1, 1,
-1.501846, 0.223181, 0.274352, 0, 0, 0, 1, 1,
-1.492998, -0.737876, -1.332966, 0, 0, 0, 1, 1,
-1.492245, 0.8298961, -1.026758, 0, 0, 0, 1, 1,
-1.489254, -1.086282, -2.209514, 0, 0, 0, 1, 1,
-1.483846, -0.1374059, -2.03004, 0, 0, 0, 1, 1,
-1.459021, -0.3776031, -2.921597, 0, 0, 0, 1, 1,
-1.454743, 0.6996899, -0.3232062, 1, 1, 1, 1, 1,
-1.451521, 2.534063, -0.1761754, 1, 1, 1, 1, 1,
-1.448648, 1.22374, -2.122706, 1, 1, 1, 1, 1,
-1.441455, 0.06588959, -3.991508, 1, 1, 1, 1, 1,
-1.439534, 1.287152, -0.6048869, 1, 1, 1, 1, 1,
-1.423594, -0.4615195, -1.725838, 1, 1, 1, 1, 1,
-1.422458, -0.9303163, -0.4728709, 1, 1, 1, 1, 1,
-1.418875, 0.2986307, -4.133558, 1, 1, 1, 1, 1,
-1.41498, -1.86805, -2.928203, 1, 1, 1, 1, 1,
-1.411713, 1.012356, -1.355099, 1, 1, 1, 1, 1,
-1.396821, -0.6607764, -2.863476, 1, 1, 1, 1, 1,
-1.368616, -0.8102971, -3.147256, 1, 1, 1, 1, 1,
-1.349109, -0.3949268, -1.554428, 1, 1, 1, 1, 1,
-1.348979, -0.4561186, -1.181732, 1, 1, 1, 1, 1,
-1.348278, -0.1990141, -2.578972, 1, 1, 1, 1, 1,
-1.342366, -0.1730862, -0.04195875, 0, 0, 1, 1, 1,
-1.340283, -0.6162566, -2.004041, 1, 0, 0, 1, 1,
-1.336667, 1.074425, -0.2504722, 1, 0, 0, 1, 1,
-1.335134, -1.125671, -0.5607646, 1, 0, 0, 1, 1,
-1.328581, 0.594921, -2.530679, 1, 0, 0, 1, 1,
-1.321297, 1.130316, -1.067135, 1, 0, 0, 1, 1,
-1.32063, 0.02578677, -2.133944, 0, 0, 0, 1, 1,
-1.312861, -0.5587181, -1.065789, 0, 0, 0, 1, 1,
-1.311304, -1.284873, -1.176162, 0, 0, 0, 1, 1,
-1.297928, 0.3396544, -3.057639, 0, 0, 0, 1, 1,
-1.291002, 2.163168, -3.358215, 0, 0, 0, 1, 1,
-1.279657, 0.07324094, -1.96651, 0, 0, 0, 1, 1,
-1.278581, -1.029646, -3.375564, 0, 0, 0, 1, 1,
-1.277365, -0.6398276, -1.982216, 1, 1, 1, 1, 1,
-1.269477, 1.07103, -0.9359411, 1, 1, 1, 1, 1,
-1.263371, -1.037406, -0.4506854, 1, 1, 1, 1, 1,
-1.258632, -0.8625334, -4.053451, 1, 1, 1, 1, 1,
-1.256035, 1.314579, -0.3369649, 1, 1, 1, 1, 1,
-1.24731, 0.9525818, -2.973987, 1, 1, 1, 1, 1,
-1.238164, -1.625502, 1.010982, 1, 1, 1, 1, 1,
-1.236792, 0.07919935, -1.301157, 1, 1, 1, 1, 1,
-1.232564, -2.590551, -3.425186, 1, 1, 1, 1, 1,
-1.231871, 2.190096, -2.250192, 1, 1, 1, 1, 1,
-1.231244, -0.649923, -3.191391, 1, 1, 1, 1, 1,
-1.231107, -0.2153012, -3.021384, 1, 1, 1, 1, 1,
-1.228054, 0.2988394, -2.091289, 1, 1, 1, 1, 1,
-1.202172, 0.5079373, -0.5043205, 1, 1, 1, 1, 1,
-1.194391, -0.5113678, -2.163611, 1, 1, 1, 1, 1,
-1.187127, 1.170025, -0.7891973, 0, 0, 1, 1, 1,
-1.166484, -0.3375693, 0.5589653, 1, 0, 0, 1, 1,
-1.163558, 0.5502451, -0.5818881, 1, 0, 0, 1, 1,
-1.160565, 1.914885, -0.06124545, 1, 0, 0, 1, 1,
-1.152416, 1.859769, -0.9767612, 1, 0, 0, 1, 1,
-1.144218, -0.5554771, -3.836772, 1, 0, 0, 1, 1,
-1.139543, -0.7479544, -2.46233, 0, 0, 0, 1, 1,
-1.137308, -0.4788364, -2.521095, 0, 0, 0, 1, 1,
-1.134742, 0.245502, -2.251336, 0, 0, 0, 1, 1,
-1.134385, 0.8333046, -0.9531479, 0, 0, 0, 1, 1,
-1.119095, 1.448132, 0.4003342, 0, 0, 0, 1, 1,
-1.118273, -0.3342853, -3.081348, 0, 0, 0, 1, 1,
-1.117436, -0.1466806, -2.873761, 0, 0, 0, 1, 1,
-1.105114, 1.007231, -1.313372, 1, 1, 1, 1, 1,
-1.102936, 0.210339, -0.06069699, 1, 1, 1, 1, 1,
-1.102815, 0.6204066, 1.068849, 1, 1, 1, 1, 1,
-1.097069, -0.7771028, -2.755745, 1, 1, 1, 1, 1,
-1.095809, 0.01299359, -0.5072908, 1, 1, 1, 1, 1,
-1.094033, -0.2261013, -1.154626, 1, 1, 1, 1, 1,
-1.087123, -1.160136, -1.834329, 1, 1, 1, 1, 1,
-1.081073, -0.8370913, -1.747772, 1, 1, 1, 1, 1,
-1.07944, 0.0775274, -1.640136, 1, 1, 1, 1, 1,
-1.078624, -1.244244, -3.92014, 1, 1, 1, 1, 1,
-1.074183, 1.282172, -2.472506, 1, 1, 1, 1, 1,
-1.072805, -1.402151, -2.295966, 1, 1, 1, 1, 1,
-1.058461, -0.2420961, -1.491748, 1, 1, 1, 1, 1,
-1.056374, -0.185055, -2.036117, 1, 1, 1, 1, 1,
-1.049635, -0.5132366, -1.756645, 1, 1, 1, 1, 1,
-1.037798, -0.4291816, -1.616226, 0, 0, 1, 1, 1,
-1.035608, 0.1023496, 0.1241884, 1, 0, 0, 1, 1,
-1.033732, -0.3405254, -1.688854, 1, 0, 0, 1, 1,
-1.032095, 0.4700321, 0.5104511, 1, 0, 0, 1, 1,
-1.022014, 1.251453, -0.5128842, 1, 0, 0, 1, 1,
-1.020367, -0.1587265, -2.790766, 1, 0, 0, 1, 1,
-1.018745, -0.4305272, -2.473759, 0, 0, 0, 1, 1,
-1.012825, -0.8583091, -1.111151, 0, 0, 0, 1, 1,
-1.011808, 1.802552, 0.1494441, 0, 0, 0, 1, 1,
-1.006713, 0.305091, 0.2665626, 0, 0, 0, 1, 1,
-0.9892352, -1.825709, -1.534326, 0, 0, 0, 1, 1,
-0.9890811, 0.07276639, -0.3281673, 0, 0, 0, 1, 1,
-0.9808188, -0.29904, -1.343117, 0, 0, 0, 1, 1,
-0.9654562, -0.5551474, -2.799039, 1, 1, 1, 1, 1,
-0.9643716, -0.4962268, -2.290808, 1, 1, 1, 1, 1,
-0.9628732, 0.05238117, -1.509389, 1, 1, 1, 1, 1,
-0.9607221, -0.788775, -1.460047, 1, 1, 1, 1, 1,
-0.9596999, 0.3744502, -0.4928029, 1, 1, 1, 1, 1,
-0.9578898, -0.1137287, -2.547312, 1, 1, 1, 1, 1,
-0.9531482, -0.05287924, -2.145458, 1, 1, 1, 1, 1,
-0.9431973, 0.8594253, -1.646132, 1, 1, 1, 1, 1,
-0.939234, -0.3547417, -0.592994, 1, 1, 1, 1, 1,
-0.9361929, -1.129194, -1.678244, 1, 1, 1, 1, 1,
-0.935452, 0.1131984, -0.09891789, 1, 1, 1, 1, 1,
-0.9330679, 0.2392345, -0.2710288, 1, 1, 1, 1, 1,
-0.9207893, 0.2947482, -0.8670226, 1, 1, 1, 1, 1,
-0.9193886, -0.1894947, -2.78744, 1, 1, 1, 1, 1,
-0.915989, -0.01372008, -1.413788, 1, 1, 1, 1, 1,
-0.9147326, -1.856203, -2.301098, 0, 0, 1, 1, 1,
-0.9130613, -1.526963, -3.364468, 1, 0, 0, 1, 1,
-0.9085647, -0.93173, -2.361546, 1, 0, 0, 1, 1,
-0.9077561, -0.9811334, -4.246685, 1, 0, 0, 1, 1,
-0.9060129, -0.2448921, -2.588625, 1, 0, 0, 1, 1,
-0.9040008, -0.2647458, -1.996212, 1, 0, 0, 1, 1,
-0.8870433, 0.5231518, -0.7933025, 0, 0, 0, 1, 1,
-0.8858948, -1.256086, -2.179061, 0, 0, 0, 1, 1,
-0.8853768, 2.93897, 0.513936, 0, 0, 0, 1, 1,
-0.8795285, -0.3743151, -3.597845, 0, 0, 0, 1, 1,
-0.8770129, 0.8970737, -1.176689, 0, 0, 0, 1, 1,
-0.8710413, -1.468768, -1.259, 0, 0, 0, 1, 1,
-0.8694844, 0.449093, -2.555135, 0, 0, 0, 1, 1,
-0.8690662, 0.4371152, -0.8897713, 1, 1, 1, 1, 1,
-0.8650594, -0.1370365, -2.057722, 1, 1, 1, 1, 1,
-0.8636246, 0.4124627, -0.1223603, 1, 1, 1, 1, 1,
-0.8614478, -0.2532218, -2.799969, 1, 1, 1, 1, 1,
-0.8527441, 0.3540122, -2.350541, 1, 1, 1, 1, 1,
-0.8508288, -0.006181775, -1.615654, 1, 1, 1, 1, 1,
-0.8485234, -0.602021, -3.018229, 1, 1, 1, 1, 1,
-0.8480148, 0.06620715, -0.1832575, 1, 1, 1, 1, 1,
-0.8463113, 0.2611278, -1.763595, 1, 1, 1, 1, 1,
-0.8415301, -0.9233415, -1.820892, 1, 1, 1, 1, 1,
-0.8342986, -1.521907, -2.637276, 1, 1, 1, 1, 1,
-0.8318549, -1.403659, -2.683143, 1, 1, 1, 1, 1,
-0.8285445, -0.6256319, -1.988943, 1, 1, 1, 1, 1,
-0.8243812, 0.02775552, -2.76415, 1, 1, 1, 1, 1,
-0.8088151, -0.8161935, -2.446288, 1, 1, 1, 1, 1,
-0.8001069, 0.6746517, -1.200213, 0, 0, 1, 1, 1,
-0.7968404, 0.05792746, -2.157213, 1, 0, 0, 1, 1,
-0.792573, 2.253227, 0.3280003, 1, 0, 0, 1, 1,
-0.7917474, -0.364612, -3.898276, 1, 0, 0, 1, 1,
-0.7883709, -0.9103057, -2.741638, 1, 0, 0, 1, 1,
-0.7800059, -1.352152, -3.432341, 1, 0, 0, 1, 1,
-0.7791892, -0.3155302, -1.714209, 0, 0, 0, 1, 1,
-0.7660326, -0.3115794, -1.5705, 0, 0, 0, 1, 1,
-0.7613028, 0.02433165, -2.410411, 0, 0, 0, 1, 1,
-0.7600924, -0.04235941, -2.844763, 0, 0, 0, 1, 1,
-0.757958, 0.5087162, -1.6793, 0, 0, 0, 1, 1,
-0.7574565, 0.4371629, 0.8437448, 0, 0, 0, 1, 1,
-0.7534832, -0.2283673, -1.20472, 0, 0, 0, 1, 1,
-0.748306, -0.8301726, -2.379822, 1, 1, 1, 1, 1,
-0.7460694, 1.023909, -3.142152, 1, 1, 1, 1, 1,
-0.7460133, -1.182539, -1.827258, 1, 1, 1, 1, 1,
-0.7448218, 0.1174928, -0.3400108, 1, 1, 1, 1, 1,
-0.7254925, -0.3120236, -1.68621, 1, 1, 1, 1, 1,
-0.7222669, -2.051244, -3.443361, 1, 1, 1, 1, 1,
-0.7128703, -1.294906, -1.734756, 1, 1, 1, 1, 1,
-0.7029959, -1.741511, -1.919611, 1, 1, 1, 1, 1,
-0.6902577, -0.7784511, -1.899944, 1, 1, 1, 1, 1,
-0.6870735, 1.194437, 0.03460591, 1, 1, 1, 1, 1,
-0.686722, 1.06997, 1.450044, 1, 1, 1, 1, 1,
-0.6860142, -0.3132857, -1.341584, 1, 1, 1, 1, 1,
-0.6831135, -0.01521268, -3.246853, 1, 1, 1, 1, 1,
-0.6818601, 0.3588938, 0.3146707, 1, 1, 1, 1, 1,
-0.6812758, -0.9417996, -2.797898, 1, 1, 1, 1, 1,
-0.6793671, -2.062511, -4.20628, 0, 0, 1, 1, 1,
-0.6770205, -1.323921, -0.3218899, 1, 0, 0, 1, 1,
-0.6729255, 0.7924051, 1.173308, 1, 0, 0, 1, 1,
-0.6705765, -0.2790587, -2.468351, 1, 0, 0, 1, 1,
-0.6675535, -0.672528, -1.991765, 1, 0, 0, 1, 1,
-0.6633544, 1.281293, -0.741174, 1, 0, 0, 1, 1,
-0.6622876, -0.2977975, -3.221226, 0, 0, 0, 1, 1,
-0.6598758, 0.7822197, -1.939254, 0, 0, 0, 1, 1,
-0.6582974, -0.8805402, -2.412982, 0, 0, 0, 1, 1,
-0.6580469, 0.408146, -0.5937182, 0, 0, 0, 1, 1,
-0.65789, -0.9440302, -2.282179, 0, 0, 0, 1, 1,
-0.6532202, 2.187203, 0.214743, 0, 0, 0, 1, 1,
-0.652813, -0.8349521, -2.022355, 0, 0, 0, 1, 1,
-0.651279, -0.6115756, -2.800229, 1, 1, 1, 1, 1,
-0.6505721, 2.103447, -0.07781179, 1, 1, 1, 1, 1,
-0.6492308, 0.1167817, -1.003829, 1, 1, 1, 1, 1,
-0.6484261, -1.108423, -2.57043, 1, 1, 1, 1, 1,
-0.646278, -0.07721359, -1.676615, 1, 1, 1, 1, 1,
-0.6455541, -1.797112, -2.844295, 1, 1, 1, 1, 1,
-0.6417769, -0.26816, -2.266978, 1, 1, 1, 1, 1,
-0.6356657, 1.387455, -2.03829, 1, 1, 1, 1, 1,
-0.6318336, -0.06761976, -1.342183, 1, 1, 1, 1, 1,
-0.6260321, 0.895183, -1.293641, 1, 1, 1, 1, 1,
-0.6250387, 0.6708145, 0.395052, 1, 1, 1, 1, 1,
-0.6230026, 0.9796051, -0.4928739, 1, 1, 1, 1, 1,
-0.6184896, -1.292679, -4.410387, 1, 1, 1, 1, 1,
-0.6169617, 0.4003086, -0.1225572, 1, 1, 1, 1, 1,
-0.6166233, -1.06262, -2.624474, 1, 1, 1, 1, 1,
-0.6153876, 0.1302941, -2.639826, 0, 0, 1, 1, 1,
-0.6151633, -0.8177897, -2.9347, 1, 0, 0, 1, 1,
-0.6145985, 0.8023832, -0.7873054, 1, 0, 0, 1, 1,
-0.6010449, -1.249555, -3.282707, 1, 0, 0, 1, 1,
-0.599618, -0.1993984, -2.114051, 1, 0, 0, 1, 1,
-0.5922202, -0.1861568, -3.164322, 1, 0, 0, 1, 1,
-0.5888796, -0.1106308, -1.028188, 0, 0, 0, 1, 1,
-0.5860664, 0.1466856, -2.423125, 0, 0, 0, 1, 1,
-0.5854737, -0.2823921, -2.367726, 0, 0, 0, 1, 1,
-0.5844593, -0.06254523, -2.572875, 0, 0, 0, 1, 1,
-0.5832199, -2.687179, -2.208103, 0, 0, 0, 1, 1,
-0.5825487, -0.7198972, -2.047704, 0, 0, 0, 1, 1,
-0.5801975, 1.138259, -0.4210668, 0, 0, 0, 1, 1,
-0.5736924, -0.2765196, -2.128825, 1, 1, 1, 1, 1,
-0.5722941, -0.3307735, -1.178275, 1, 1, 1, 1, 1,
-0.5719941, -0.45049, -3.184022, 1, 1, 1, 1, 1,
-0.5694045, 1.518216, -1.435604, 1, 1, 1, 1, 1,
-0.5676999, -1.182791, -2.723846, 1, 1, 1, 1, 1,
-0.5661619, -1.378338, -2.349292, 1, 1, 1, 1, 1,
-0.5639597, -0.6643185, -1.912052, 1, 1, 1, 1, 1,
-0.563899, 0.1012504, -3.370563, 1, 1, 1, 1, 1,
-0.5527183, 0.3343932, 0.09333935, 1, 1, 1, 1, 1,
-0.5519164, 1.7807, -1.022648, 1, 1, 1, 1, 1,
-0.547517, 1.012843, -1.26579, 1, 1, 1, 1, 1,
-0.5474073, 1.156744, 0.4775223, 1, 1, 1, 1, 1,
-0.5468501, -0.4558732, -3.233779, 1, 1, 1, 1, 1,
-0.5438305, 0.5973793, -1.498966, 1, 1, 1, 1, 1,
-0.5432954, 0.2254265, -2.156903, 1, 1, 1, 1, 1,
-0.5419257, 0.0005512386, -4.690029, 0, 0, 1, 1, 1,
-0.539201, -0.2419638, -2.87458, 1, 0, 0, 1, 1,
-0.5379201, -0.931514, -3.583921, 1, 0, 0, 1, 1,
-0.5259624, 0.6663773, -0.884154, 1, 0, 0, 1, 1,
-0.5226595, 0.5515755, -1.626056, 1, 0, 0, 1, 1,
-0.52075, -1.10622, -3.874796, 1, 0, 0, 1, 1,
-0.5151357, 0.1106835, -3.000446, 0, 0, 0, 1, 1,
-0.5122965, -1.494153, -1.289177, 0, 0, 0, 1, 1,
-0.5114207, -0.4337813, -2.709774, 0, 0, 0, 1, 1,
-0.5015501, -0.5705961, -2.951169, 0, 0, 0, 1, 1,
-0.5006371, -0.3665138, -1.871675, 0, 0, 0, 1, 1,
-0.4991138, 0.1299737, -1.618193, 0, 0, 0, 1, 1,
-0.4988427, -0.08319164, -2.050682, 0, 0, 0, 1, 1,
-0.4983614, 0.5408974, -1.343638, 1, 1, 1, 1, 1,
-0.4947453, -0.1954908, -1.690149, 1, 1, 1, 1, 1,
-0.4931324, -1.383063, -2.497509, 1, 1, 1, 1, 1,
-0.4894078, 0.7707956, -0.05751749, 1, 1, 1, 1, 1,
-0.4868143, 0.814286, 0.9912024, 1, 1, 1, 1, 1,
-0.4848854, -1.649837, -3.14022, 1, 1, 1, 1, 1,
-0.4819743, 1.634397, 1.044387, 1, 1, 1, 1, 1,
-0.4816464, -0.3167381, -3.036311, 1, 1, 1, 1, 1,
-0.4805057, 1.269319, -0.3921043, 1, 1, 1, 1, 1,
-0.4764232, 0.4282956, -2.141905, 1, 1, 1, 1, 1,
-0.4731968, -1.297537, -3.202486, 1, 1, 1, 1, 1,
-0.4660297, -0.819734, -3.18536, 1, 1, 1, 1, 1,
-0.4652075, 0.5705661, -0.5655689, 1, 1, 1, 1, 1,
-0.4588536, 0.05100693, -1.136301, 1, 1, 1, 1, 1,
-0.4580108, 0.8059559, -0.3495767, 1, 1, 1, 1, 1,
-0.4562705, -0.2161375, -1.131897, 0, 0, 1, 1, 1,
-0.4556001, 0.4101509, -0.9824523, 1, 0, 0, 1, 1,
-0.4513852, -0.2693335, -3.050017, 1, 0, 0, 1, 1,
-0.4501099, 1.363874, -0.1241963, 1, 0, 0, 1, 1,
-0.449986, 1.286389, -0.08691726, 1, 0, 0, 1, 1,
-0.4481148, -1.641636, -3.045018, 1, 0, 0, 1, 1,
-0.4446978, -1.010793, -3.124866, 0, 0, 0, 1, 1,
-0.4446577, -1.24031, -2.140489, 0, 0, 0, 1, 1,
-0.4416588, -0.5867003, -2.418543, 0, 0, 0, 1, 1,
-0.440116, -0.8994965, -1.638095, 0, 0, 0, 1, 1,
-0.4383431, 0.8311664, -0.5678394, 0, 0, 0, 1, 1,
-0.4382053, 1.433819, 1.95388, 0, 0, 0, 1, 1,
-0.4373246, -0.1947493, -3.254115, 0, 0, 0, 1, 1,
-0.4366164, -1.115671, -2.666092, 1, 1, 1, 1, 1,
-0.4291003, 1.536706, 1.37432, 1, 1, 1, 1, 1,
-0.4287568, -0.9613946, -0.9200389, 1, 1, 1, 1, 1,
-0.4255501, -0.8456664, -2.745731, 1, 1, 1, 1, 1,
-0.4247874, -0.4127655, -1.038797, 1, 1, 1, 1, 1,
-0.4245511, -0.8453431, -3.29466, 1, 1, 1, 1, 1,
-0.4234759, 0.4095342, -0.753396, 1, 1, 1, 1, 1,
-0.4195376, 1.042373, -1.615214, 1, 1, 1, 1, 1,
-0.4114488, -2.913436, -3.340886, 1, 1, 1, 1, 1,
-0.4066551, -0.4387159, -0.822288, 1, 1, 1, 1, 1,
-0.4057276, -0.1563874, -2.343359, 1, 1, 1, 1, 1,
-0.4021334, 1.297728, -0.08858182, 1, 1, 1, 1, 1,
-0.3942038, 0.4462752, -1.899869, 1, 1, 1, 1, 1,
-0.3893901, -1.015746, -2.115569, 1, 1, 1, 1, 1,
-0.3841625, 1.543832, 1.221723, 1, 1, 1, 1, 1,
-0.3771147, -0.06961339, 0.6961883, 0, 0, 1, 1, 1,
-0.3770728, -0.4615106, -0.4238618, 1, 0, 0, 1, 1,
-0.3761624, -0.756026, -2.095318, 1, 0, 0, 1, 1,
-0.3718229, 0.6777304, -1.302242, 1, 0, 0, 1, 1,
-0.3655742, 2.329675, 0.8924022, 1, 0, 0, 1, 1,
-0.3645111, 0.01403176, -2.59756, 1, 0, 0, 1, 1,
-0.3528839, -0.4749154, -4.305295, 0, 0, 0, 1, 1,
-0.3499684, 1.027437, -1.460604, 0, 0, 0, 1, 1,
-0.3478265, 0.3775695, 0.115586, 0, 0, 0, 1, 1,
-0.3449462, 0.5502471, -1.322301, 0, 0, 0, 1, 1,
-0.3410907, -0.370098, -2.074756, 0, 0, 0, 1, 1,
-0.3397744, -0.2075784, -2.293382, 0, 0, 0, 1, 1,
-0.3367184, 1.080464, -2.065012, 0, 0, 0, 1, 1,
-0.3346801, -1.095537, -4.015832, 1, 1, 1, 1, 1,
-0.3325004, -0.1120254, -2.681192, 1, 1, 1, 1, 1,
-0.3226359, 0.9482051, -1.010644, 1, 1, 1, 1, 1,
-0.3150642, 1.543237, 1.063976, 1, 1, 1, 1, 1,
-0.3132671, -0.07808952, -2.377213, 1, 1, 1, 1, 1,
-0.3058795, -0.7387834, -3.229822, 1, 1, 1, 1, 1,
-0.3035278, 0.11656, -1.045434, 1, 1, 1, 1, 1,
-0.3029384, 0.2194147, -1.250398, 1, 1, 1, 1, 1,
-0.3017816, 0.2952245, -0.3256187, 1, 1, 1, 1, 1,
-0.3016915, 0.05032067, -3.643181, 1, 1, 1, 1, 1,
-0.2976437, 0.2639204, -1.2632, 1, 1, 1, 1, 1,
-0.2944963, 0.5462625, 0.9178982, 1, 1, 1, 1, 1,
-0.2913697, -0.4867761, -2.990372, 1, 1, 1, 1, 1,
-0.2905763, -1.325693, -2.570722, 1, 1, 1, 1, 1,
-0.2872438, -0.8391255, -2.260191, 1, 1, 1, 1, 1,
-0.2803361, -0.3549906, -1.425937, 0, 0, 1, 1, 1,
-0.2782925, 0.4949927, -2.408004, 1, 0, 0, 1, 1,
-0.2677926, -1.609298, -3.924201, 1, 0, 0, 1, 1,
-0.2597725, -0.9978648, -2.88318, 1, 0, 0, 1, 1,
-0.2487728, -0.2817197, -2.59273, 1, 0, 0, 1, 1,
-0.2435578, -1.177547, -3.506628, 1, 0, 0, 1, 1,
-0.243143, -0.1339623, -2.071753, 0, 0, 0, 1, 1,
-0.2404441, 0.1402115, -1.361322, 0, 0, 0, 1, 1,
-0.2360578, 1.205562, -0.4589289, 0, 0, 0, 1, 1,
-0.2343156, -1.288503, -2.974673, 0, 0, 0, 1, 1,
-0.231711, 1.195466, -0.340073, 0, 0, 0, 1, 1,
-0.2308996, 1.941879, -1.133811, 0, 0, 0, 1, 1,
-0.2191119, -0.4560781, -2.100182, 0, 0, 0, 1, 1,
-0.2103045, -0.4940102, -2.409328, 1, 1, 1, 1, 1,
-0.2095062, 0.8712994, -0.4892644, 1, 1, 1, 1, 1,
-0.2088892, 0.02128921, -1.089595, 1, 1, 1, 1, 1,
-0.2088488, -1.221816, -2.022989, 1, 1, 1, 1, 1,
-0.2066109, 0.1216463, -0.9107222, 1, 1, 1, 1, 1,
-0.2053489, 1.406515, -2.092331, 1, 1, 1, 1, 1,
-0.1974317, -0.713999, -2.467024, 1, 1, 1, 1, 1,
-0.1967383, 0.3858426, 0.9186579, 1, 1, 1, 1, 1,
-0.1935995, 0.8066004, -1.446656, 1, 1, 1, 1, 1,
-0.1927566, -0.1654896, -2.409739, 1, 1, 1, 1, 1,
-0.1922992, 0.1082417, -0.7106883, 1, 1, 1, 1, 1,
-0.1916028, 1.185331, 2.216467, 1, 1, 1, 1, 1,
-0.1893323, -0.7413642, -5.030167, 1, 1, 1, 1, 1,
-0.1861632, 0.9400502, -0.4114963, 1, 1, 1, 1, 1,
-0.1686517, -0.273487, -2.147216, 1, 1, 1, 1, 1,
-0.167262, -1.005434, -2.475666, 0, 0, 1, 1, 1,
-0.1660751, -1.973697, -2.924517, 1, 0, 0, 1, 1,
-0.1632778, -0.392896, -2.588197, 1, 0, 0, 1, 1,
-0.1602561, -1.139637, -2.562719, 1, 0, 0, 1, 1,
-0.1601204, -1.207915, -2.320169, 1, 0, 0, 1, 1,
-0.1597956, -0.3242165, -4.205828, 1, 0, 0, 1, 1,
-0.1567588, 0.09946201, -1.038622, 0, 0, 0, 1, 1,
-0.1536534, -0.9329978, -4.024385, 0, 0, 0, 1, 1,
-0.1501378, 0.1885209, -0.1418296, 0, 0, 0, 1, 1,
-0.1460091, 0.09973615, 1.667977, 0, 0, 0, 1, 1,
-0.1411816, -0.05070707, -1.860947, 0, 0, 0, 1, 1,
-0.1397612, 0.8397483, -1.346495, 0, 0, 0, 1, 1,
-0.1394372, 0.5085482, 0.3305548, 0, 0, 0, 1, 1,
-0.138857, -0.589089, -2.773451, 1, 1, 1, 1, 1,
-0.1385981, 0.9612405, 0.4898171, 1, 1, 1, 1, 1,
-0.1345494, 0.6478283, 0.8416799, 1, 1, 1, 1, 1,
-0.1341787, 0.1589434, 0.2849872, 1, 1, 1, 1, 1,
-0.1242131, 0.0438114, -1.536289, 1, 1, 1, 1, 1,
-0.1192756, -1.280924, -1.871941, 1, 1, 1, 1, 1,
-0.1112103, 0.612648, -1.458706, 1, 1, 1, 1, 1,
-0.09878355, 1.445451, -0.4815607, 1, 1, 1, 1, 1,
-0.09716031, -1.05266, -3.314605, 1, 1, 1, 1, 1,
-0.09563724, 1.443611, 1.070269, 1, 1, 1, 1, 1,
-0.09218304, 0.4746618, 0.2419751, 1, 1, 1, 1, 1,
-0.09048348, 0.6264212, -2.053665, 1, 1, 1, 1, 1,
-0.08744554, -1.545818, -3.454542, 1, 1, 1, 1, 1,
-0.08733845, 1.194186, 1.74734, 1, 1, 1, 1, 1,
-0.08566198, -1.766093, -4.072799, 1, 1, 1, 1, 1,
-0.07998889, 1.495386, -0.13878, 0, 0, 1, 1, 1,
-0.07745943, 2.419058, 0.3436794, 1, 0, 0, 1, 1,
-0.07702853, 0.9296401, -1.422387, 1, 0, 0, 1, 1,
-0.07301676, -0.8605111, -2.993779, 1, 0, 0, 1, 1,
-0.07153671, 0.1678437, 0.7143636, 1, 0, 0, 1, 1,
-0.07044329, -0.583346, -2.582941, 1, 0, 0, 1, 1,
-0.07003766, 0.2961786, -1.269244, 0, 0, 0, 1, 1,
-0.06884219, 0.5432091, -0.4639441, 0, 0, 0, 1, 1,
-0.06678006, -0.8842407, -4.365327, 0, 0, 0, 1, 1,
-0.0585403, -0.2972435, -4.760209, 0, 0, 0, 1, 1,
-0.05687942, 0.547855, 0.2460219, 0, 0, 0, 1, 1,
-0.05652605, -0.2290622, -2.015229, 0, 0, 0, 1, 1,
-0.0529687, 0.524601, 1.444455, 0, 0, 0, 1, 1,
-0.05295707, 0.2818724, 0.2130302, 1, 1, 1, 1, 1,
-0.05226184, 1.319391, 0.7170668, 1, 1, 1, 1, 1,
-0.05222411, 0.6425937, -1.325117, 1, 1, 1, 1, 1,
-0.05043662, -0.006350761, -3.064629, 1, 1, 1, 1, 1,
-0.04734193, -1.871218, -4.35533, 1, 1, 1, 1, 1,
-0.03989795, -0.1709175, -4.247831, 1, 1, 1, 1, 1,
-0.03956439, 0.3829598, 1.158917, 1, 1, 1, 1, 1,
-0.03588829, 0.1334182, -0.4034106, 1, 1, 1, 1, 1,
-0.03562441, -0.180157, -2.966377, 1, 1, 1, 1, 1,
-0.03382324, 0.6724539, -0.9547507, 1, 1, 1, 1, 1,
-0.03362392, -1.968883, -3.721113, 1, 1, 1, 1, 1,
-0.03236716, -0.4321683, -1.80528, 1, 1, 1, 1, 1,
-0.03105124, 0.02569455, -0.6775522, 1, 1, 1, 1, 1,
-0.02725498, -1.289291, -3.103356, 1, 1, 1, 1, 1,
-0.02568892, -0.8306376, -2.667658, 1, 1, 1, 1, 1,
-0.02516281, 0.5115033, -1.270732, 0, 0, 1, 1, 1,
-0.02507455, 2.904071, 1.000725, 1, 0, 0, 1, 1,
-0.01813677, -0.4043225, -3.662908, 1, 0, 0, 1, 1,
-0.01683737, -1.564305, -2.574064, 1, 0, 0, 1, 1,
-0.01175982, -1.06719, -5.257329, 1, 0, 0, 1, 1,
-0.009469952, 0.8851402, -0.2309166, 1, 0, 0, 1, 1,
-0.003022698, 0.9674666, 0.3841861, 0, 0, 0, 1, 1,
0.001346076, -0.1166308, 2.270849, 0, 0, 0, 1, 1,
0.002284707, -0.04919671, 2.106729, 0, 0, 0, 1, 1,
0.002632417, -1.667845, 2.882254, 0, 0, 0, 1, 1,
0.003176854, -0.1236759, 3.44761, 0, 0, 0, 1, 1,
0.005062378, 1.686622, -0.9236121, 0, 0, 0, 1, 1,
0.007777406, 0.07169224, -0.3644361, 0, 0, 0, 1, 1,
0.0079197, -1.403886, 2.063355, 1, 1, 1, 1, 1,
0.009692771, 1.12231, -0.9804124, 1, 1, 1, 1, 1,
0.01083292, 0.4527287, 0.514583, 1, 1, 1, 1, 1,
0.01120408, 0.9744002, 0.5643562, 1, 1, 1, 1, 1,
0.01302295, 0.8582395, -0.4288491, 1, 1, 1, 1, 1,
0.01640137, 2.640638, -1.350349, 1, 1, 1, 1, 1,
0.01721301, 0.556742, 1.636575, 1, 1, 1, 1, 1,
0.02320942, 0.3678256, 0.5317947, 1, 1, 1, 1, 1,
0.0232883, -0.2043305, 1.948861, 1, 1, 1, 1, 1,
0.02410561, 0.8652268, 0.6060215, 1, 1, 1, 1, 1,
0.02414166, -0.4557196, 2.970968, 1, 1, 1, 1, 1,
0.02476539, -1.180831, 5.999828, 1, 1, 1, 1, 1,
0.02858069, -0.3181866, 2.975814, 1, 1, 1, 1, 1,
0.03153237, 0.08699741, 0.819502, 1, 1, 1, 1, 1,
0.032683, -0.8255293, 4.166662, 1, 1, 1, 1, 1,
0.03495485, 0.1850696, -0.4213348, 0, 0, 1, 1, 1,
0.04018686, -0.7488126, 3.251066, 1, 0, 0, 1, 1,
0.04114444, 0.05622721, -0.4678091, 1, 0, 0, 1, 1,
0.04166438, 0.1371284, 2.373373, 1, 0, 0, 1, 1,
0.04179529, -0.05580338, 2.329846, 1, 0, 0, 1, 1,
0.04307833, -1.779577, 1.498361, 1, 0, 0, 1, 1,
0.04352878, -0.1570195, 2.155764, 0, 0, 0, 1, 1,
0.04494414, 0.7545542, -1.516388, 0, 0, 0, 1, 1,
0.04796105, -1.126682, 2.980006, 0, 0, 0, 1, 1,
0.04817038, -0.0003387147, 0.7009549, 0, 0, 0, 1, 1,
0.0499888, 0.9560437, 0.2700685, 0, 0, 0, 1, 1,
0.05043409, -1.583693, 4.905157, 0, 0, 0, 1, 1,
0.05166589, 1.083584, -0.3800139, 0, 0, 0, 1, 1,
0.05301807, 1.223527, 1.106707, 1, 1, 1, 1, 1,
0.05339438, -0.7848618, 2.495399, 1, 1, 1, 1, 1,
0.05800338, -1.093264, 2.363733, 1, 1, 1, 1, 1,
0.05800719, 1.661821, -0.4793505, 1, 1, 1, 1, 1,
0.05818078, 0.09300158, -0.524388, 1, 1, 1, 1, 1,
0.05919037, -0.9376822, 1.919824, 1, 1, 1, 1, 1,
0.05988012, 0.4980639, 0.1084347, 1, 1, 1, 1, 1,
0.06008237, 0.5179222, -0.3122808, 1, 1, 1, 1, 1,
0.06328735, 0.890924, -0.8048667, 1, 1, 1, 1, 1,
0.06633472, 0.6755728, 0.6678789, 1, 1, 1, 1, 1,
0.06644589, 0.127625, 0.1880216, 1, 1, 1, 1, 1,
0.06650489, -1.600472, 3.525607, 1, 1, 1, 1, 1,
0.06842469, 0.2822263, 0.148725, 1, 1, 1, 1, 1,
0.07686971, 1.885989, 1.982693, 1, 1, 1, 1, 1,
0.07845234, -1.393579, 3.166792, 1, 1, 1, 1, 1,
0.07925042, 0.3164496, 0.9649022, 0, 0, 1, 1, 1,
0.0873955, -0.03151109, 1.885462, 1, 0, 0, 1, 1,
0.08910061, 0.5712083, 2.273724, 1, 0, 0, 1, 1,
0.09343635, -1.068088, 2.082534, 1, 0, 0, 1, 1,
0.09591741, 0.7307391, -0.9775062, 1, 0, 0, 1, 1,
0.09620661, 1.798199, 1.114502, 1, 0, 0, 1, 1,
0.09788284, 0.3381311, -1.115556, 0, 0, 0, 1, 1,
0.1002913, 0.6551624, 0.4388695, 0, 0, 0, 1, 1,
0.1003078, -1.813966, 3.453626, 0, 0, 0, 1, 1,
0.1011102, -1.1926, 2.734974, 0, 0, 0, 1, 1,
0.1017252, 1.451315, 1.794574, 0, 0, 0, 1, 1,
0.1022835, 1.059238, 0.8396025, 0, 0, 0, 1, 1,
0.104011, 1.354259, 0.6447824, 0, 0, 0, 1, 1,
0.105174, -0.07156456, 3.009233, 1, 1, 1, 1, 1,
0.1130079, 2.339319, 1.047301, 1, 1, 1, 1, 1,
0.1153946, 0.3545254, -0.7093578, 1, 1, 1, 1, 1,
0.1205305, 0.0114319, 0.02423574, 1, 1, 1, 1, 1,
0.1207763, -0.07496166, 0.2689709, 1, 1, 1, 1, 1,
0.1217449, -1.468502, 2.325265, 1, 1, 1, 1, 1,
0.1315339, -1.656263, 3.220472, 1, 1, 1, 1, 1,
0.1328788, -1.055605, 3.741023, 1, 1, 1, 1, 1,
0.1349393, 0.2448128, 1.528478, 1, 1, 1, 1, 1,
0.1365715, 1.150009, -0.3396189, 1, 1, 1, 1, 1,
0.1380133, 0.6445373, -0.06300202, 1, 1, 1, 1, 1,
0.1382885, -2.575765, 3.425301, 1, 1, 1, 1, 1,
0.1385008, 1.118264, -0.2580766, 1, 1, 1, 1, 1,
0.1422058, -0.3717511, 3.622948, 1, 1, 1, 1, 1,
0.1445731, -1.522143, 3.543031, 1, 1, 1, 1, 1,
0.1488487, 0.1266542, 1.013031, 0, 0, 1, 1, 1,
0.1543211, -0.3685744, 2.209419, 1, 0, 0, 1, 1,
0.1604543, 0.6063838, -1.030532, 1, 0, 0, 1, 1,
0.1608341, 1.441228, 0.4742918, 1, 0, 0, 1, 1,
0.1634302, 0.5322801, -1.812238, 1, 0, 0, 1, 1,
0.1651619, -0.3897004, 3.455901, 1, 0, 0, 1, 1,
0.1685884, 0.8560923, 0.1855782, 0, 0, 0, 1, 1,
0.170575, 1.058723, -1.031384, 0, 0, 0, 1, 1,
0.1730052, 0.6463643, -0.1322484, 0, 0, 0, 1, 1,
0.1749624, -0.8958387, 3.146661, 0, 0, 0, 1, 1,
0.1757878, 0.118624, 0.7533155, 0, 0, 0, 1, 1,
0.1778229, 0.9508831, -0.0799461, 0, 0, 0, 1, 1,
0.1780466, 0.6176546, -0.7069251, 0, 0, 0, 1, 1,
0.1797128, 0.1425078, 2.020469, 1, 1, 1, 1, 1,
0.1797204, 1.38268, -0.7916046, 1, 1, 1, 1, 1,
0.1802735, -0.3749428, 2.4431, 1, 1, 1, 1, 1,
0.1819906, -0.2742079, 1.280041, 1, 1, 1, 1, 1,
0.1819923, -0.5028912, 4.446467, 1, 1, 1, 1, 1,
0.1840872, -0.1514645, 2.452436, 1, 1, 1, 1, 1,
0.184179, -1.033194, 1.940554, 1, 1, 1, 1, 1,
0.1844969, 1.651694, -0.03176011, 1, 1, 1, 1, 1,
0.1854193, -0.9950924, 1.106688, 1, 1, 1, 1, 1,
0.1877229, 1.673223, -0.05087839, 1, 1, 1, 1, 1,
0.1888577, -0.3295372, 2.264503, 1, 1, 1, 1, 1,
0.1923698, -0.8323807, 3.153494, 1, 1, 1, 1, 1,
0.1935969, -0.4622992, 3.753324, 1, 1, 1, 1, 1,
0.1938819, 0.7128498, 0.8204898, 1, 1, 1, 1, 1,
0.1990305, -1.18234, 1.127322, 1, 1, 1, 1, 1,
0.1998458, -0.2244091, 3.646022, 0, 0, 1, 1, 1,
0.2011454, 1.238029, -0.4494414, 1, 0, 0, 1, 1,
0.2049976, 0.6973995, -0.1689975, 1, 0, 0, 1, 1,
0.2051374, 1.748285, 1.482825, 1, 0, 0, 1, 1,
0.2060697, 0.9732286, -0.07029744, 1, 0, 0, 1, 1,
0.20813, 1.680728, -0.39696, 1, 0, 0, 1, 1,
0.2087574, 0.691471, 1.150653, 0, 0, 0, 1, 1,
0.2224492, 0.5207337, 0.7551752, 0, 0, 0, 1, 1,
0.2260836, -0.2631887, 0.6497979, 0, 0, 0, 1, 1,
0.2268853, -1.576791, 3.555579, 0, 0, 0, 1, 1,
0.2269708, 1.07414, -0.3240101, 0, 0, 0, 1, 1,
0.235688, 0.1628613, 1.071194, 0, 0, 0, 1, 1,
0.2430632, -1.915703, 2.895294, 0, 0, 0, 1, 1,
0.2475831, 1.630606, 1.087757, 1, 1, 1, 1, 1,
0.2530565, 0.0244847, 1.354539, 1, 1, 1, 1, 1,
0.2557322, 0.0748142, 1.278911, 1, 1, 1, 1, 1,
0.2559718, -1.022759, 0.7776278, 1, 1, 1, 1, 1,
0.2616885, -0.06690088, 2.166961, 1, 1, 1, 1, 1,
0.2654597, -1.936386, 4.656199, 1, 1, 1, 1, 1,
0.270247, -1.444246, 2.658242, 1, 1, 1, 1, 1,
0.2728278, -1.03386, 2.838751, 1, 1, 1, 1, 1,
0.2729527, -0.5748707, 2.080796, 1, 1, 1, 1, 1,
0.2767937, 0.07963451, 0.7217262, 1, 1, 1, 1, 1,
0.2772703, 1.497099, 0.6321442, 1, 1, 1, 1, 1,
0.2807792, -0.09886852, 0.6951432, 1, 1, 1, 1, 1,
0.282916, -0.7972521, 3.166402, 1, 1, 1, 1, 1,
0.2866427, -0.9286461, 3.113619, 1, 1, 1, 1, 1,
0.2885461, -0.5545279, 2.565594, 1, 1, 1, 1, 1,
0.2913098, 0.01842161, 0.5046321, 0, 0, 1, 1, 1,
0.2927184, -0.8853017, 2.537644, 1, 0, 0, 1, 1,
0.3049321, 0.3541791, -0.2465547, 1, 0, 0, 1, 1,
0.309296, -1.142025, 2.193018, 1, 0, 0, 1, 1,
0.3108075, -0.5744523, 0.3332555, 1, 0, 0, 1, 1,
0.3119752, 0.2077882, 1.901789, 1, 0, 0, 1, 1,
0.3142671, 0.925688, -0.669215, 0, 0, 0, 1, 1,
0.3143244, -0.3770464, 1.384427, 0, 0, 0, 1, 1,
0.3169307, -0.3866493, 1.469758, 0, 0, 0, 1, 1,
0.3170343, -0.2223666, 2.361561, 0, 0, 0, 1, 1,
0.3187377, 1.36126, -0.3318427, 0, 0, 0, 1, 1,
0.3192524, -0.9936414, 2.882062, 0, 0, 0, 1, 1,
0.3211643, -0.5495313, 3.787591, 0, 0, 0, 1, 1,
0.321887, 0.5418351, -0.01554629, 1, 1, 1, 1, 1,
0.3219195, 1.795988, -1.343599, 1, 1, 1, 1, 1,
0.3274694, -1.229657, 2.327968, 1, 1, 1, 1, 1,
0.3284272, 0.3896771, 0.9157219, 1, 1, 1, 1, 1,
0.3339548, 0.850467, 1.313935, 1, 1, 1, 1, 1,
0.3348252, -2.07909, 3.02096, 1, 1, 1, 1, 1,
0.3371959, -1.731119, 2.031624, 1, 1, 1, 1, 1,
0.3443869, -0.2762328, 2.793818, 1, 1, 1, 1, 1,
0.3489734, 0.2142195, 2.023459, 1, 1, 1, 1, 1,
0.3513376, 0.2626225, 1.557944, 1, 1, 1, 1, 1,
0.3541161, -0.876292, 3.866412, 1, 1, 1, 1, 1,
0.3599018, -0.4411132, 2.485368, 1, 1, 1, 1, 1,
0.3640223, -0.3679251, 2.480523, 1, 1, 1, 1, 1,
0.3646531, 0.9727724, 2.359123, 1, 1, 1, 1, 1,
0.3658194, 1.443494, 0.2752746, 1, 1, 1, 1, 1,
0.36709, 0.2132173, -0.8471485, 0, 0, 1, 1, 1,
0.3749285, -1.514698, 1.488654, 1, 0, 0, 1, 1,
0.3768035, -0.2341327, 3.958929, 1, 0, 0, 1, 1,
0.3774145, -1.226607, 2.457944, 1, 0, 0, 1, 1,
0.3821791, 0.8900403, -0.6040149, 1, 0, 0, 1, 1,
0.3832107, 0.414691, 0.5231759, 1, 0, 0, 1, 1,
0.3843105, 1.237255, -1.096511, 0, 0, 0, 1, 1,
0.3862688, -2.095409, 3.167892, 0, 0, 0, 1, 1,
0.3886738, -0.5351925, 2.353262, 0, 0, 0, 1, 1,
0.3903756, -0.5494412, 0.8685269, 0, 0, 0, 1, 1,
0.3951148, 0.5423945, -0.4170522, 0, 0, 0, 1, 1,
0.395875, 1.967771, 0.7188357, 0, 0, 0, 1, 1,
0.3964523, 0.74098, 0.7769555, 0, 0, 0, 1, 1,
0.4006045, 0.2892819, 1.352374, 1, 1, 1, 1, 1,
0.4010056, -0.3246177, 2.769612, 1, 1, 1, 1, 1,
0.4016356, 0.9000546, 1.090489, 1, 1, 1, 1, 1,
0.4022959, 2.405704, 2.490766, 1, 1, 1, 1, 1,
0.4060955, -0.4215648, 3.706658, 1, 1, 1, 1, 1,
0.408446, -0.4507686, 0.633732, 1, 1, 1, 1, 1,
0.4161351, -2.619914, 2.876815, 1, 1, 1, 1, 1,
0.4216412, 0.08348791, 1.5279, 1, 1, 1, 1, 1,
0.4222644, -0.8388007, 2.97094, 1, 1, 1, 1, 1,
0.4227112, 1.370665, -0.705121, 1, 1, 1, 1, 1,
0.4241214, -1.191864, 4.340764, 1, 1, 1, 1, 1,
0.426786, 0.7620605, 2.255807, 1, 1, 1, 1, 1,
0.433718, 1.139505, 1.539567, 1, 1, 1, 1, 1,
0.4350595, 2.199437, 0.144699, 1, 1, 1, 1, 1,
0.4361565, 0.2031473, 0.3406181, 1, 1, 1, 1, 1,
0.4377697, -0.4420621, 2.791483, 0, 0, 1, 1, 1,
0.439483, -1.511834, 3.702517, 1, 0, 0, 1, 1,
0.440805, -1.440587, 3.679887, 1, 0, 0, 1, 1,
0.4428273, -0.529958, 1.469348, 1, 0, 0, 1, 1,
0.4437094, -0.5204647, 2.485078, 1, 0, 0, 1, 1,
0.4445941, -1.403395, 0.623239, 1, 0, 0, 1, 1,
0.4453101, 0.6190823, 0.4384164, 0, 0, 0, 1, 1,
0.446232, -0.8813509, 2.51775, 0, 0, 0, 1, 1,
0.4479056, 0.8894609, 2.29723, 0, 0, 0, 1, 1,
0.4510854, 0.1331453, 1.832683, 0, 0, 0, 1, 1,
0.4520157, -0.1179142, 2.463595, 0, 0, 0, 1, 1,
0.452848, -1.141699, 2.290007, 0, 0, 0, 1, 1,
0.4572317, -1.24819, 3.578329, 0, 0, 0, 1, 1,
0.4585274, 0.08072214, 2.571591, 1, 1, 1, 1, 1,
0.4586828, -0.652833, 4.185268, 1, 1, 1, 1, 1,
0.4590271, 0.08050367, 0.712754, 1, 1, 1, 1, 1,
0.4603625, 0.1697663, 1.488125, 1, 1, 1, 1, 1,
0.4638203, 0.2340734, -0.9927567, 1, 1, 1, 1, 1,
0.468373, -0.6794637, 2.508737, 1, 1, 1, 1, 1,
0.4736153, 0.8650337, -0.5342539, 1, 1, 1, 1, 1,
0.478106, -1.000343, 1.809236, 1, 1, 1, 1, 1,
0.4805566, -1.499253, 2.785753, 1, 1, 1, 1, 1,
0.4806933, -0.9500582, 3.079132, 1, 1, 1, 1, 1,
0.4846779, -0.9507133, 3.750892, 1, 1, 1, 1, 1,
0.4902029, -0.1056776, 0.1481517, 1, 1, 1, 1, 1,
0.4903563, 0.5511523, 1.035131, 1, 1, 1, 1, 1,
0.5023766, 0.5360529, 0.1521603, 1, 1, 1, 1, 1,
0.5059625, -0.3900817, 3.7086, 1, 1, 1, 1, 1,
0.5077651, 1.341039, -1.280443, 0, 0, 1, 1, 1,
0.5117769, 0.1172419, 4.576303, 1, 0, 0, 1, 1,
0.5119891, -0.8364381, 1.612557, 1, 0, 0, 1, 1,
0.5129361, -0.4775082, 3.368109, 1, 0, 0, 1, 1,
0.520859, -0.6462873, 3.08127, 1, 0, 0, 1, 1,
0.52306, -1.076726, 1.353477, 1, 0, 0, 1, 1,
0.5248157, -0.6627295, 2.978935, 0, 0, 0, 1, 1,
0.5250008, 0.3945738, 2.099342, 0, 0, 0, 1, 1,
0.5250301, 0.2908324, 0.5491842, 0, 0, 0, 1, 1,
0.5266242, 0.5485598, 0.722984, 0, 0, 0, 1, 1,
0.5301324, 0.6394566, -0.03036042, 0, 0, 0, 1, 1,
0.5304376, 0.6522623, 1.420615, 0, 0, 0, 1, 1,
0.536671, 0.7953572, 1.156326, 0, 0, 0, 1, 1,
0.5385729, 0.5780309, -0.0536832, 1, 1, 1, 1, 1,
0.5391527, 0.9114304, 0.8953118, 1, 1, 1, 1, 1,
0.5454144, -0.6107227, 1.383299, 1, 1, 1, 1, 1,
0.5505248, -0.1825304, 1.997476, 1, 1, 1, 1, 1,
0.550707, 1.493217, 1.0137, 1, 1, 1, 1, 1,
0.5542256, 0.6087712, 0.5509713, 1, 1, 1, 1, 1,
0.5560957, -1.174908, 0.9297856, 1, 1, 1, 1, 1,
0.5623791, -0.6999207, 2.157575, 1, 1, 1, 1, 1,
0.564371, 0.6246182, 0.7723011, 1, 1, 1, 1, 1,
0.5686536, 1.654544, -0.1704454, 1, 1, 1, 1, 1,
0.5696651, -0.05701348, 1.726661, 1, 1, 1, 1, 1,
0.5699936, -1.653197, 2.311985, 1, 1, 1, 1, 1,
0.5718591, -0.5680602, 2.046278, 1, 1, 1, 1, 1,
0.5727569, -0.6929225, 2.255299, 1, 1, 1, 1, 1,
0.5730512, 0.5942086, 0.07729106, 1, 1, 1, 1, 1,
0.5735103, -0.2174792, 3.416995, 0, 0, 1, 1, 1,
0.5754058, -1.47915, 3.006838, 1, 0, 0, 1, 1,
0.575559, -0.5589391, 1.196203, 1, 0, 0, 1, 1,
0.5789538, 0.6104462, 0.3121595, 1, 0, 0, 1, 1,
0.5789866, 1.303761, 0.3207821, 1, 0, 0, 1, 1,
0.5809364, 0.8975687, 0.8876133, 1, 0, 0, 1, 1,
0.5893132, 0.3466719, 0.8101586, 0, 0, 0, 1, 1,
0.5900578, 0.911705, 0.8396913, 0, 0, 0, 1, 1,
0.5918865, 1.539821, 1.703267, 0, 0, 0, 1, 1,
0.5931687, 0.2897962, 1.388143, 0, 0, 0, 1, 1,
0.5935095, -1.81924, 4.542566, 0, 0, 0, 1, 1,
0.597104, 0.2701781, 0.5310465, 0, 0, 0, 1, 1,
0.5985096, -0.698256, 1.217748, 0, 0, 0, 1, 1,
0.6010577, -1.275398, 2.672185, 1, 1, 1, 1, 1,
0.6033763, 0.7656972, 1.598714, 1, 1, 1, 1, 1,
0.6174569, -0.3154294, 1.505432, 1, 1, 1, 1, 1,
0.6178921, 0.2508744, 1.455761, 1, 1, 1, 1, 1,
0.6228294, -0.8143581, 4.044365, 1, 1, 1, 1, 1,
0.6263223, 0.1389009, 2.866362, 1, 1, 1, 1, 1,
0.6348313, -0.4688559, 2.464715, 1, 1, 1, 1, 1,
0.6419211, 2.702927, -0.03767961, 1, 1, 1, 1, 1,
0.6457469, 0.518366, 1.720832, 1, 1, 1, 1, 1,
0.6575559, 0.09289935, -0.02539784, 1, 1, 1, 1, 1,
0.6588904, 0.2675148, 1.091738, 1, 1, 1, 1, 1,
0.6619043, 0.2068491, 1.45216, 1, 1, 1, 1, 1,
0.6628916, -1.15912, 4.06463, 1, 1, 1, 1, 1,
0.6649932, 0.4905341, 1.583332, 1, 1, 1, 1, 1,
0.6657848, -0.1908106, 2.185176, 1, 1, 1, 1, 1,
0.6693379, 0.2348005, 2.1106, 0, 0, 1, 1, 1,
0.6735135, -1.584669, 3.279304, 1, 0, 0, 1, 1,
0.6784288, 1.725188, -0.290185, 1, 0, 0, 1, 1,
0.6795579, -1.021365, 4.270627, 1, 0, 0, 1, 1,
0.6848916, 2.28556, -0.2367358, 1, 0, 0, 1, 1,
0.6943983, 1.433484, 0.1297797, 1, 0, 0, 1, 1,
0.6977202, -0.6273508, 2.683274, 0, 0, 0, 1, 1,
0.700342, -2.081211, 2.704747, 0, 0, 0, 1, 1,
0.703789, 0.3854353, 2.048233, 0, 0, 0, 1, 1,
0.7075139, 0.5981451, 1.044879, 0, 0, 0, 1, 1,
0.7084507, 0.606786, 1.006167, 0, 0, 0, 1, 1,
0.7166568, -2.316867, 1.925014, 0, 0, 0, 1, 1,
0.7189184, -0.2510154, 2.144423, 0, 0, 0, 1, 1,
0.7329363, 0.1500642, 1.955307, 1, 1, 1, 1, 1,
0.7361135, -0.1497635, 2.037797, 1, 1, 1, 1, 1,
0.7365265, -0.1030823, 1.694254, 1, 1, 1, 1, 1,
0.737133, -0.7503471, 2.254814, 1, 1, 1, 1, 1,
0.7386389, -0.418112, 3.439954, 1, 1, 1, 1, 1,
0.7395519, -0.1645285, 2.369913, 1, 1, 1, 1, 1,
0.7453387, 0.04020474, 0.06907488, 1, 1, 1, 1, 1,
0.7472503, -0.9745852, 1.568808, 1, 1, 1, 1, 1,
0.7535783, -0.1776329, 1.065828, 1, 1, 1, 1, 1,
0.758239, 1.875531, 0.9011881, 1, 1, 1, 1, 1,
0.7601871, 0.08347128, 2.367706, 1, 1, 1, 1, 1,
0.7618717, -0.7417729, 1.613844, 1, 1, 1, 1, 1,
0.765275, -0.5205453, 2.276949, 1, 1, 1, 1, 1,
0.7704988, -0.7070347, 1.654554, 1, 1, 1, 1, 1,
0.7724195, 0.6475707, -0.427068, 1, 1, 1, 1, 1,
0.7861621, -0.1656363, 0.9846302, 0, 0, 1, 1, 1,
0.7876795, -0.7628817, 3.843445, 1, 0, 0, 1, 1,
0.7888159, -1.512178, 4.331869, 1, 0, 0, 1, 1,
0.7936651, -0.4465336, 1.873319, 1, 0, 0, 1, 1,
0.7949281, -0.2017178, 1.019237, 1, 0, 0, 1, 1,
0.7973451, -1.518971, 1.988629, 1, 0, 0, 1, 1,
0.7983908, -0.9061405, 2.253067, 0, 0, 0, 1, 1,
0.8005214, 0.5652288, -0.5169702, 0, 0, 0, 1, 1,
0.8010755, -0.3440742, 1.348316, 0, 0, 0, 1, 1,
0.8073415, 0.8199174, 0.6850688, 0, 0, 0, 1, 1,
0.8119433, 1.329705, 0.8613834, 0, 0, 0, 1, 1,
0.8141093, 0.398972, 1.465906, 0, 0, 0, 1, 1,
0.8177053, 0.8672796, 1.080328, 0, 0, 0, 1, 1,
0.8190698, -0.355245, 3.342603, 1, 1, 1, 1, 1,
0.8215123, -0.9949163, 1.312431, 1, 1, 1, 1, 1,
0.824074, 0.7329746, 1.751954, 1, 1, 1, 1, 1,
0.8294957, -1.432147, 2.851851, 1, 1, 1, 1, 1,
0.8320808, 1.183224, -0.2737051, 1, 1, 1, 1, 1,
0.836158, -9.790684e-05, 1.148823, 1, 1, 1, 1, 1,
0.8383338, -2.329232, -0.03623006, 1, 1, 1, 1, 1,
0.8384015, -0.09897149, 3.763325, 1, 1, 1, 1, 1,
0.8413172, -0.2538561, 3.849888, 1, 1, 1, 1, 1,
0.8413598, 1.463515, 0.3891667, 1, 1, 1, 1, 1,
0.8478416, 0.7356825, 0.08304171, 1, 1, 1, 1, 1,
0.8507743, -0.6936746, 0.7850657, 1, 1, 1, 1, 1,
0.853195, -0.1918924, 2.723081, 1, 1, 1, 1, 1,
0.859632, -0.5700884, 2.511707, 1, 1, 1, 1, 1,
0.8617943, 0.6911862, 2.985087, 1, 1, 1, 1, 1,
0.8636489, 0.6905206, 1.776852, 0, 0, 1, 1, 1,
0.869384, -1.365233, 2.384534, 1, 0, 0, 1, 1,
0.8708644, -1.169972, 2.75402, 1, 0, 0, 1, 1,
0.8752959, -0.2154779, 1.710118, 1, 0, 0, 1, 1,
0.8797327, 0.970478, 2.649756, 1, 0, 0, 1, 1,
0.8821054, 0.05041081, 0.4037192, 1, 0, 0, 1, 1,
0.8836672, 1.149584, 2.523717, 0, 0, 0, 1, 1,
0.8877014, 2.355735, 0.3472044, 0, 0, 0, 1, 1,
0.8887271, 0.1904066, 1.882167, 0, 0, 0, 1, 1,
0.891849, 0.1235247, 0.7965616, 0, 0, 0, 1, 1,
0.8920578, 0.2801524, 1.852556, 0, 0, 0, 1, 1,
0.8964323, -0.1047364, 3.137, 0, 0, 0, 1, 1,
0.8987465, -1.115918, 2.602093, 0, 0, 0, 1, 1,
0.9012073, 1.133262, 1.198692, 1, 1, 1, 1, 1,
0.9062409, -1.155613, 0.9578044, 1, 1, 1, 1, 1,
0.9134259, 1.542209, -1.296304, 1, 1, 1, 1, 1,
0.9137369, -0.3250277, 3.035632, 1, 1, 1, 1, 1,
0.9234406, 0.1505989, 1.989419, 1, 1, 1, 1, 1,
0.9294282, 0.4512507, 0.500283, 1, 1, 1, 1, 1,
0.9296209, -0.9168516, 2.815078, 1, 1, 1, 1, 1,
0.9301345, -1.202172, 2.816495, 1, 1, 1, 1, 1,
0.9336399, 0.5271569, 1.595807, 1, 1, 1, 1, 1,
0.9394007, -1.391947, 3.353096, 1, 1, 1, 1, 1,
0.9394144, 1.453243, 0.2175489, 1, 1, 1, 1, 1,
0.9403866, -1.388406, 2.760691, 1, 1, 1, 1, 1,
0.9414086, 0.1229082, 0.2607953, 1, 1, 1, 1, 1,
0.9434194, 0.2878949, 0.264827, 1, 1, 1, 1, 1,
0.9459135, 0.3672321, -0.4806545, 1, 1, 1, 1, 1,
0.9532022, 0.1006138, 2.256432, 0, 0, 1, 1, 1,
0.9566312, 1.122621, 0.7392877, 1, 0, 0, 1, 1,
0.9570022, 1.064915, 1.414028, 1, 0, 0, 1, 1,
0.9606118, -0.9704402, 3.345208, 1, 0, 0, 1, 1,
0.9723995, -0.5046838, 1.818755, 1, 0, 0, 1, 1,
0.9806342, -1.020072, 2.439443, 1, 0, 0, 1, 1,
0.9824775, -1.235545, 3.845848, 0, 0, 0, 1, 1,
0.9849321, -0.5120224, 2.971091, 0, 0, 0, 1, 1,
0.988296, -0.8184869, 1.699197, 0, 0, 0, 1, 1,
0.9913728, 0.2173652, 1.113641, 0, 0, 0, 1, 1,
0.9938796, -0.2842546, 1.085493, 0, 0, 0, 1, 1,
0.9957244, 1.540615, -0.1352995, 0, 0, 0, 1, 1,
0.9975904, 2.201809, 0.4696563, 0, 0, 0, 1, 1,
1.000084, -0.7410327, 0.8512318, 1, 1, 1, 1, 1,
1.006997, 1.384856, 0.6000845, 1, 1, 1, 1, 1,
1.008092, -0.712068, 3.136204, 1, 1, 1, 1, 1,
1.0132, -0.1925596, 1.908697, 1, 1, 1, 1, 1,
1.016033, 1.112606, -0.3621145, 1, 1, 1, 1, 1,
1.01667, -0.2825925, 1.847684, 1, 1, 1, 1, 1,
1.016865, 0.4191827, 2.047137, 1, 1, 1, 1, 1,
1.020437, 1.62861, 0.4079731, 1, 1, 1, 1, 1,
1.026064, 0.07059208, 1.207799, 1, 1, 1, 1, 1,
1.028189, 0.4439569, 3.285319, 1, 1, 1, 1, 1,
1.029214, 1.124184, 0.1577624, 1, 1, 1, 1, 1,
1.031247, 0.7839943, 1.792475, 1, 1, 1, 1, 1,
1.03262, 1.822351, -0.0422933, 1, 1, 1, 1, 1,
1.035719, 0.7839152, 1.112502, 1, 1, 1, 1, 1,
1.036225, 0.1943474, 2.102876, 1, 1, 1, 1, 1,
1.04301, -1.179433, 3.547298, 0, 0, 1, 1, 1,
1.048054, -1.789193, 4.192225, 1, 0, 0, 1, 1,
1.052232, -0.08938965, 0.6058932, 1, 0, 0, 1, 1,
1.062963, 1.882657, -0.1505759, 1, 0, 0, 1, 1,
1.073762, 0.7863274, 0.8834073, 1, 0, 0, 1, 1,
1.084723, 0.049449, -1.034113, 1, 0, 0, 1, 1,
1.084806, -1.083179, 1.270764, 0, 0, 0, 1, 1,
1.087336, -2.14573, 2.275948, 0, 0, 0, 1, 1,
1.088421, 1.366295, 2.998879, 0, 0, 0, 1, 1,
1.09039, -0.7354538, 2.470144, 0, 0, 0, 1, 1,
1.097637, 0.671676, 0.08931181, 0, 0, 0, 1, 1,
1.098267, 0.1334926, 2.663471, 0, 0, 0, 1, 1,
1.121162, -0.3023605, 0.114677, 0, 0, 0, 1, 1,
1.12354, 0.5470257, 2.088502, 1, 1, 1, 1, 1,
1.128231, 0.5885742, 1.432975, 1, 1, 1, 1, 1,
1.129487, -1.337056, 2.920845, 1, 1, 1, 1, 1,
1.130125, 0.2087693, 1.900167, 1, 1, 1, 1, 1,
1.130155, -0.4422458, 1.716374, 1, 1, 1, 1, 1,
1.135964, -0.5655825, 2.629611, 1, 1, 1, 1, 1,
1.138146, -1.055639, 2.36906, 1, 1, 1, 1, 1,
1.139152, 0.8036512, 1.011811, 1, 1, 1, 1, 1,
1.142438, 0.01497028, 1.724697, 1, 1, 1, 1, 1,
1.143468, -0.02366872, 2.969263, 1, 1, 1, 1, 1,
1.148061, -1.172917, 2.741104, 1, 1, 1, 1, 1,
1.148378, -0.1257518, 1.376373, 1, 1, 1, 1, 1,
1.155483, 0.1488551, 2.343997, 1, 1, 1, 1, 1,
1.157346, -0.8253443, 1.976665, 1, 1, 1, 1, 1,
1.15869, 0.8226479, 1.898664, 1, 1, 1, 1, 1,
1.160352, -0.3528962, 2.351725, 0, 0, 1, 1, 1,
1.169823, -0.5557352, 1.9801, 1, 0, 0, 1, 1,
1.170289, -1.620765, 3.348268, 1, 0, 0, 1, 1,
1.178958, 0.0430187, 1.68834, 1, 0, 0, 1, 1,
1.189074, 0.2739116, 0.9918315, 1, 0, 0, 1, 1,
1.189101, 0.5512887, 1.463051, 1, 0, 0, 1, 1,
1.190445, 1.842438, 0.5653936, 0, 0, 0, 1, 1,
1.190864, -2.529403, 4.174549, 0, 0, 0, 1, 1,
1.191186, 0.5234129, 0.6236811, 0, 0, 0, 1, 1,
1.19463, 0.1059299, 0.7063299, 0, 0, 0, 1, 1,
1.198276, 1.079382, 1.746317, 0, 0, 0, 1, 1,
1.199502, 0.2473162, -0.1629182, 0, 0, 0, 1, 1,
1.20249, -0.5296829, 2.00529, 0, 0, 0, 1, 1,
1.217208, 0.1774889, -0.4406188, 1, 1, 1, 1, 1,
1.233159, 2.185247, -1.383775, 1, 1, 1, 1, 1,
1.234679, 0.05394788, 1.765448, 1, 1, 1, 1, 1,
1.243412, -1.291941, 1.792603, 1, 1, 1, 1, 1,
1.248223, 1.739492, -0.05487548, 1, 1, 1, 1, 1,
1.250878, -1.449466, 1.943452, 1, 1, 1, 1, 1,
1.251443, 1.015396, 0.8818858, 1, 1, 1, 1, 1,
1.261834, 0.9208255, 2.589293, 1, 1, 1, 1, 1,
1.263734, 0.8009953, 0.888877, 1, 1, 1, 1, 1,
1.266885, 0.1624541, 2.237471, 1, 1, 1, 1, 1,
1.272693, -2.424389, 2.98841, 1, 1, 1, 1, 1,
1.27673, -0.1715264, 2.535666, 1, 1, 1, 1, 1,
1.300507, 0.8479978, 0.4061971, 1, 1, 1, 1, 1,
1.30543, -1.315702, 2.372877, 1, 1, 1, 1, 1,
1.322848, -0.4673428, 2.912996, 1, 1, 1, 1, 1,
1.324873, 0.2506503, 1.530977, 0, 0, 1, 1, 1,
1.3322, 0.7714844, 2.681759, 1, 0, 0, 1, 1,
1.337461, 0.03023797, 1.288544, 1, 0, 0, 1, 1,
1.341043, -0.1491726, 2.088887, 1, 0, 0, 1, 1,
1.356049, -0.8441159, 2.690365, 1, 0, 0, 1, 1,
1.356742, -0.4653647, 1.789679, 1, 0, 0, 1, 1,
1.367143, 0.2419293, 0.175985, 0, 0, 0, 1, 1,
1.380728, -1.248286, 2.246638, 0, 0, 0, 1, 1,
1.381687, 0.2437827, 0.5438082, 0, 0, 0, 1, 1,
1.386705, 0.573744, 3.038033, 0, 0, 0, 1, 1,
1.388422, -1.134864, 0.6786638, 0, 0, 0, 1, 1,
1.393722, 0.2584531, 1.651189, 0, 0, 0, 1, 1,
1.403499, -0.6391041, 1.546804, 0, 0, 0, 1, 1,
1.408101, -0.4381073, 2.050662, 1, 1, 1, 1, 1,
1.40817, -1.609463, 2.512713, 1, 1, 1, 1, 1,
1.408984, 0.04761321, 1.472252, 1, 1, 1, 1, 1,
1.409758, 0.02875654, 1.107772, 1, 1, 1, 1, 1,
1.415878, -0.2197442, 1.297832, 1, 1, 1, 1, 1,
1.426057, -0.5409434, 2.138299, 1, 1, 1, 1, 1,
1.426613, -0.7611918, 2.946765, 1, 1, 1, 1, 1,
1.432918, 0.6514989, 1.463182, 1, 1, 1, 1, 1,
1.435908, 0.398824, 1.426164, 1, 1, 1, 1, 1,
1.439993, 0.9630443, 0.1050491, 1, 1, 1, 1, 1,
1.443005, 1.620844, -0.6892116, 1, 1, 1, 1, 1,
1.446845, -1.834539, 3.5, 1, 1, 1, 1, 1,
1.459759, -0.9542714, 0.7761473, 1, 1, 1, 1, 1,
1.474598, 1.051343, -0.3861599, 1, 1, 1, 1, 1,
1.480036, 1.07153, 1.607117, 1, 1, 1, 1, 1,
1.481605, -0.6626425, 0.5276288, 0, 0, 1, 1, 1,
1.482398, -1.417667, 2.146091, 1, 0, 0, 1, 1,
1.484755, -0.3070887, 3.152487, 1, 0, 0, 1, 1,
1.489543, 0.7101614, 0.4478206, 1, 0, 0, 1, 1,
1.490694, 1.716047, 1.924598, 1, 0, 0, 1, 1,
1.502253, 0.08860885, 1.588908, 1, 0, 0, 1, 1,
1.515991, -0.4564785, 0.9505439, 0, 0, 0, 1, 1,
1.518894, 0.5952544, 1.843206, 0, 0, 0, 1, 1,
1.521039, -0.5054047, 1.396557, 0, 0, 0, 1, 1,
1.534117, 1.222552, 1.536182, 0, 0, 0, 1, 1,
1.538453, 0.009253306, 2.906803, 0, 0, 0, 1, 1,
1.552187, -1.250825, 5.018691, 0, 0, 0, 1, 1,
1.567483, 0.1663963, 1.465215, 0, 0, 0, 1, 1,
1.575052, -1.196396, 1.928618, 1, 1, 1, 1, 1,
1.589748, 1.128098, -0.7984812, 1, 1, 1, 1, 1,
1.59165, -0.7126265, 0.02208414, 1, 1, 1, 1, 1,
1.595642, -0.7135819, 1.266846, 1, 1, 1, 1, 1,
1.60588, 0.2249336, 0.4653224, 1, 1, 1, 1, 1,
1.62348, -1.031565, 1.677974, 1, 1, 1, 1, 1,
1.632781, 0.06080369, 1.762747, 1, 1, 1, 1, 1,
1.640042, -0.05702475, 1.70924, 1, 1, 1, 1, 1,
1.640921, 1.3327, 1.284135, 1, 1, 1, 1, 1,
1.641595, 0.239274, 2.428583, 1, 1, 1, 1, 1,
1.646463, -0.7801011, 0.7551917, 1, 1, 1, 1, 1,
1.658301, -2.548286, 1.850229, 1, 1, 1, 1, 1,
1.665435, -0.6325924, 1.79871, 1, 1, 1, 1, 1,
1.715096, 0.1331572, 1.461504, 1, 1, 1, 1, 1,
1.716112, 1.955541, -0.6228271, 1, 1, 1, 1, 1,
1.742431, -0.03997608, 1.529257, 0, 0, 1, 1, 1,
1.743149, 0.6064118, 2.717369, 1, 0, 0, 1, 1,
1.744019, 0.352533, 2.103635, 1, 0, 0, 1, 1,
1.744239, 0.5806966, 0.2679446, 1, 0, 0, 1, 1,
1.756379, 0.4480513, 0.6339291, 1, 0, 0, 1, 1,
1.764798, -0.04470697, 0.397293, 1, 0, 0, 1, 1,
1.783197, 0.8484098, 1.516153, 0, 0, 0, 1, 1,
1.801074, -0.02730816, 2.191801, 0, 0, 0, 1, 1,
1.801382, 0.9112447, 3.129208, 0, 0, 0, 1, 1,
1.809458, 1.445432, 2.058367, 0, 0, 0, 1, 1,
1.827297, 0.4409279, 0.8431385, 0, 0, 0, 1, 1,
1.831721, -1.043747, 1.589604, 0, 0, 0, 1, 1,
1.848416, 0.8155333, 0.8918341, 0, 0, 0, 1, 1,
1.866028, 2.151771, 1.535849, 1, 1, 1, 1, 1,
1.875519, 2.291727, 1.09117, 1, 1, 1, 1, 1,
1.876861, -1.651019, 1.382139, 1, 1, 1, 1, 1,
1.895571, -0.4000954, 3.052357, 1, 1, 1, 1, 1,
1.908891, -1.57575, 2.267359, 1, 1, 1, 1, 1,
1.914766, -1.842771, 2.429785, 1, 1, 1, 1, 1,
1.935967, 0.07030445, 0.8965096, 1, 1, 1, 1, 1,
1.936026, -0.9639906, 2.34387, 1, 1, 1, 1, 1,
1.943892, -1.768088, 0.9909965, 1, 1, 1, 1, 1,
1.984545, -1.024519, 0.5728618, 1, 1, 1, 1, 1,
1.990164, -0.1302589, 0.5342007, 1, 1, 1, 1, 1,
2.017781, -0.3300067, 2.141674, 1, 1, 1, 1, 1,
2.028573, 0.6222179, 1.92625, 1, 1, 1, 1, 1,
2.037429, 1.418393, 2.149936, 1, 1, 1, 1, 1,
2.044316, -1.915819, 1.723351, 1, 1, 1, 1, 1,
2.048552, -1.392367, 2.163425, 0, 0, 1, 1, 1,
2.095755, 0.28029, 1.085523, 1, 0, 0, 1, 1,
2.149804, -1.338731, 3.839349, 1, 0, 0, 1, 1,
2.194163, 1.14272, 1.461628, 1, 0, 0, 1, 1,
2.209508, 0.3261386, 1.012393, 1, 0, 0, 1, 1,
2.21869, 1.071295, 0.5854084, 1, 0, 0, 1, 1,
2.238401, 0.7268553, 2.893887, 0, 0, 0, 1, 1,
2.259085, -0.6583109, 1.053914, 0, 0, 0, 1, 1,
2.285064, -0.2264029, 4.722437, 0, 0, 0, 1, 1,
2.294885, 0.9612445, 1.63968, 0, 0, 0, 1, 1,
2.305253, 0.7797632, 2.047216, 0, 0, 0, 1, 1,
2.309595, 1.697961, -0.9057022, 0, 0, 0, 1, 1,
2.331302, -0.299033, 1.246517, 0, 0, 0, 1, 1,
2.479345, -0.245214, 2.404146, 1, 1, 1, 1, 1,
2.511092, -0.5526927, 1.518878, 1, 1, 1, 1, 1,
2.619341, -0.4017059, 0.9243167, 1, 1, 1, 1, 1,
2.672675, 0.3251387, -0.7050153, 1, 1, 1, 1, 1,
2.676732, -0.4141705, 0.8506491, 1, 1, 1, 1, 1,
2.748687, -1.77316, 0.9171932, 1, 1, 1, 1, 1,
3.102957, -2.077736, 2.603641, 1, 1, 1, 1, 1
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
var radius = 9.613839;
var distance = 33.7682;
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
mvMatrix.translate( 0.0240171, -0.01276696, -0.3712497 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.7682);
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