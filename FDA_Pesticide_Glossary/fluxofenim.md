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
-2.872281, 1.796558, 0.214123, 1, 0, 0, 1,
-2.824944, -0.07007769, -1.974108, 1, 0.007843138, 0, 1,
-2.480496, 0.8554759, -1.752499, 1, 0.01176471, 0, 1,
-2.450752, -0.3632208, -2.438645, 1, 0.01960784, 0, 1,
-2.450612, 0.1076926, -1.828838, 1, 0.02352941, 0, 1,
-2.440889, -1.074371, -3.490453, 1, 0.03137255, 0, 1,
-2.414742, 0.6444689, -1.276355, 1, 0.03529412, 0, 1,
-2.332666, 0.4275726, -0.1708072, 1, 0.04313726, 0, 1,
-2.331368, -1.101383, -0.5956446, 1, 0.04705882, 0, 1,
-2.163329, 0.6776888, -2.423697, 1, 0.05490196, 0, 1,
-2.126467, -1.71795, -4.494207, 1, 0.05882353, 0, 1,
-2.093204, 0.8658926, -1.007901, 1, 0.06666667, 0, 1,
-2.06669, -1.417165, -1.506633, 1, 0.07058824, 0, 1,
-2.048516, -0.274297, -0.7918566, 1, 0.07843138, 0, 1,
-2.00132, -1.176415, -3.557442, 1, 0.08235294, 0, 1,
-1.975386, -0.2567085, -2.185256, 1, 0.09019608, 0, 1,
-1.970669, -0.723632, -1.201264, 1, 0.09411765, 0, 1,
-1.970361, -0.1214502, -0.4031033, 1, 0.1019608, 0, 1,
-1.967372, -0.2080358, -1.791781, 1, 0.1098039, 0, 1,
-1.961365, -0.479691, -1.941385, 1, 0.1137255, 0, 1,
-1.961263, 1.140173, -2.167357, 1, 0.1215686, 0, 1,
-1.955549, -1.246957, -3.071199, 1, 0.1254902, 0, 1,
-1.951068, 0.6361722, -2.082066, 1, 0.1333333, 0, 1,
-1.944109, -0.4246389, -0.5160863, 1, 0.1372549, 0, 1,
-1.93332, -0.2417904, -2.513292, 1, 0.145098, 0, 1,
-1.883098, 0.5927259, -1.844551, 1, 0.1490196, 0, 1,
-1.874861, 1.36113, -1.388487, 1, 0.1568628, 0, 1,
-1.872245, -0.9054886, -2.297732, 1, 0.1607843, 0, 1,
-1.846253, -1.145736, -0.6548603, 1, 0.1686275, 0, 1,
-1.842795, 0.2442119, -2.130521, 1, 0.172549, 0, 1,
-1.819976, -0.4556721, -1.967005, 1, 0.1803922, 0, 1,
-1.819129, 0.1303468, -1.164953, 1, 0.1843137, 0, 1,
-1.810276, -0.4202316, -1.955322, 1, 0.1921569, 0, 1,
-1.797558, -1.11403, -2.3377, 1, 0.1960784, 0, 1,
-1.792083, 0.8724946, -0.1135477, 1, 0.2039216, 0, 1,
-1.787764, 0.199312, -1.552746, 1, 0.2117647, 0, 1,
-1.786176, 0.6538393, -2.222593, 1, 0.2156863, 0, 1,
-1.763871, 0.05040505, -1.155851, 1, 0.2235294, 0, 1,
-1.754125, 1.78456, -1.941019, 1, 0.227451, 0, 1,
-1.750958, -0.239188, -1.751331, 1, 0.2352941, 0, 1,
-1.721211, -0.6253908, -2.50876, 1, 0.2392157, 0, 1,
-1.718992, 1.553383, -0.642836, 1, 0.2470588, 0, 1,
-1.714197, 0.7713092, -0.763391, 1, 0.2509804, 0, 1,
-1.713729, 0.9596408, -1.533771, 1, 0.2588235, 0, 1,
-1.700665, 0.2164729, -2.001508, 1, 0.2627451, 0, 1,
-1.697004, -0.5740742, -3.442219, 1, 0.2705882, 0, 1,
-1.686144, 0.5169761, -0.9421399, 1, 0.2745098, 0, 1,
-1.685839, 0.6089346, -0.7910532, 1, 0.282353, 0, 1,
-1.68398, -0.7824689, -3.074457, 1, 0.2862745, 0, 1,
-1.676872, 0.858735, -0.4994077, 1, 0.2941177, 0, 1,
-1.665776, 0.4279691, -3.6241, 1, 0.3019608, 0, 1,
-1.661005, 1.431378, -0.07941124, 1, 0.3058824, 0, 1,
-1.646868, -1.347953, -2.740649, 1, 0.3137255, 0, 1,
-1.643684, -1.95772, -2.636642, 1, 0.3176471, 0, 1,
-1.621195, -0.4550492, -1.399812, 1, 0.3254902, 0, 1,
-1.609417, -0.548443, -1.908562, 1, 0.3294118, 0, 1,
-1.603969, 0.7341782, -1.424663, 1, 0.3372549, 0, 1,
-1.573572, -1.30259, -1.74609, 1, 0.3411765, 0, 1,
-1.570047, -1.099126, -2.415105, 1, 0.3490196, 0, 1,
-1.56197, 0.1091584, -0.6023014, 1, 0.3529412, 0, 1,
-1.551504, -1.916825, -2.057768, 1, 0.3607843, 0, 1,
-1.527205, -1.44467, -3.154865, 1, 0.3647059, 0, 1,
-1.517552, 0.08370516, -2.353049, 1, 0.372549, 0, 1,
-1.502955, 0.7144215, -1.469076, 1, 0.3764706, 0, 1,
-1.498279, 1.40592, -0.8980209, 1, 0.3843137, 0, 1,
-1.486409, 0.112876, -1.243246, 1, 0.3882353, 0, 1,
-1.477137, -1.618772, -2.751243, 1, 0.3960784, 0, 1,
-1.470319, -1.765521, -2.431598, 1, 0.4039216, 0, 1,
-1.461321, -0.5621507, -0.5080397, 1, 0.4078431, 0, 1,
-1.443951, 0.7095972, -1.088446, 1, 0.4156863, 0, 1,
-1.439665, 1.593977, -1.279123, 1, 0.4196078, 0, 1,
-1.411829, -1.657205, -2.367001, 1, 0.427451, 0, 1,
-1.410904, -0.9444852, -1.904466, 1, 0.4313726, 0, 1,
-1.389399, 1.473424, -1.022336, 1, 0.4392157, 0, 1,
-1.383208, -1.811304, -0.9994956, 1, 0.4431373, 0, 1,
-1.379945, -0.2893334, -3.514522, 1, 0.4509804, 0, 1,
-1.376005, 1.508377, -0.835533, 1, 0.454902, 0, 1,
-1.362089, 0.5048763, -1.159637, 1, 0.4627451, 0, 1,
-1.361896, 0.4281607, -2.274019, 1, 0.4666667, 0, 1,
-1.359908, 1.174146, -1.116433, 1, 0.4745098, 0, 1,
-1.348933, 0.1683529, -0.5779239, 1, 0.4784314, 0, 1,
-1.343443, 0.5112844, -1.324773, 1, 0.4862745, 0, 1,
-1.326038, -0.3810467, -2.467482, 1, 0.4901961, 0, 1,
-1.32389, 1.924274, -1.046423, 1, 0.4980392, 0, 1,
-1.323756, 0.03108454, -1.657934, 1, 0.5058824, 0, 1,
-1.314435, 0.9762821, 0.2647013, 1, 0.509804, 0, 1,
-1.313989, 0.9379704, 0.01904964, 1, 0.5176471, 0, 1,
-1.313557, -0.3601279, -0.325032, 1, 0.5215687, 0, 1,
-1.310877, -0.8466102, -2.338049, 1, 0.5294118, 0, 1,
-1.309, -1.751799, -2.608847, 1, 0.5333334, 0, 1,
-1.306334, -1.163222, -3.091633, 1, 0.5411765, 0, 1,
-1.306155, -0.7241884, -1.124046, 1, 0.5450981, 0, 1,
-1.296457, -0.07094521, -0.6553709, 1, 0.5529412, 0, 1,
-1.293827, 1.705806, -1.977731, 1, 0.5568628, 0, 1,
-1.283629, 1.415264, 0.04411415, 1, 0.5647059, 0, 1,
-1.272901, 1.299353, -1.163121, 1, 0.5686275, 0, 1,
-1.269291, 1.908765, 0.5012628, 1, 0.5764706, 0, 1,
-1.263696, 0.2743731, -2.28367, 1, 0.5803922, 0, 1,
-1.258429, -0.4031654, -1.806647, 1, 0.5882353, 0, 1,
-1.254751, 0.03508724, -1.218837, 1, 0.5921569, 0, 1,
-1.253018, -0.9545935, -1.904836, 1, 0.6, 0, 1,
-1.252398, 0.9631762, -0.4127579, 1, 0.6078432, 0, 1,
-1.251523, -1.258557, -1.860451, 1, 0.6117647, 0, 1,
-1.24572, -1.366918, -2.885655, 1, 0.6196079, 0, 1,
-1.236747, 0.5206742, -0.9992057, 1, 0.6235294, 0, 1,
-1.224987, -0.4075252, -2.628654, 1, 0.6313726, 0, 1,
-1.224791, 0.1049882, -2.452371, 1, 0.6352941, 0, 1,
-1.210133, 0.7720816, -0.1121835, 1, 0.6431373, 0, 1,
-1.207857, -0.8145977, -1.750925, 1, 0.6470588, 0, 1,
-1.207643, -0.3722773, -2.623431, 1, 0.654902, 0, 1,
-1.206533, -0.1704462, -0.157046, 1, 0.6588235, 0, 1,
-1.202562, 0.3258556, -2.631944, 1, 0.6666667, 0, 1,
-1.190822, 2.319098, -0.7584036, 1, 0.6705883, 0, 1,
-1.167304, -1.671137, -0.9566295, 1, 0.6784314, 0, 1,
-1.163259, -1.158711, -1.166214, 1, 0.682353, 0, 1,
-1.16308, 1.769643, -1.176224, 1, 0.6901961, 0, 1,
-1.151701, 0.01269077, -1.882591, 1, 0.6941177, 0, 1,
-1.149981, -1.360866, -2.030194, 1, 0.7019608, 0, 1,
-1.148609, -0.8652998, -2.909206, 1, 0.7098039, 0, 1,
-1.146718, -0.687129, -2.413572, 1, 0.7137255, 0, 1,
-1.146137, 1.047843, -1.954644, 1, 0.7215686, 0, 1,
-1.146105, 0.1117933, -0.9436561, 1, 0.7254902, 0, 1,
-1.144968, -1.394703, -2.686805, 1, 0.7333333, 0, 1,
-1.140929, -0.04127397, -0.8130735, 1, 0.7372549, 0, 1,
-1.138176, -0.1975397, -0.6397858, 1, 0.7450981, 0, 1,
-1.136825, 0.1175165, 0.02883901, 1, 0.7490196, 0, 1,
-1.136706, 0.7121111, -1.004198, 1, 0.7568628, 0, 1,
-1.134907, -0.4284835, -1.368443, 1, 0.7607843, 0, 1,
-1.110908, 0.3271096, -1.105394, 1, 0.7686275, 0, 1,
-1.105807, -0.1049009, -1.084638, 1, 0.772549, 0, 1,
-1.09563, 0.5816306, -0.4934161, 1, 0.7803922, 0, 1,
-1.090993, 1.615996, -0.5973563, 1, 0.7843137, 0, 1,
-1.086163, 1.126677, -1.92913, 1, 0.7921569, 0, 1,
-1.085793, -0.7756543, -2.543096, 1, 0.7960784, 0, 1,
-1.081877, -0.09690542, -2.304765, 1, 0.8039216, 0, 1,
-1.073839, 0.720408, -0.72066, 1, 0.8117647, 0, 1,
-1.072616, 0.2700028, -0.07944395, 1, 0.8156863, 0, 1,
-1.066746, -0.2626088, -2.285077, 1, 0.8235294, 0, 1,
-1.065562, -0.3907652, -2.901637, 1, 0.827451, 0, 1,
-1.045992, 0.1849794, -1.506416, 1, 0.8352941, 0, 1,
-1.043129, -0.2097353, -0.9785255, 1, 0.8392157, 0, 1,
-1.042538, 1.946359, -0.4707664, 1, 0.8470588, 0, 1,
-1.042345, 0.2670708, -1.298125, 1, 0.8509804, 0, 1,
-1.042172, -1.113876, -3.190754, 1, 0.8588235, 0, 1,
-1.037952, 0.6544883, -1.417426, 1, 0.8627451, 0, 1,
-1.033756, -1.876051, -1.622819, 1, 0.8705882, 0, 1,
-1.029625, -1.767387, -2.382012, 1, 0.8745098, 0, 1,
-1.025521, -0.8184781, -0.446426, 1, 0.8823529, 0, 1,
-1.022191, 0.1173259, -1.842961, 1, 0.8862745, 0, 1,
-1.021789, -1.123158, -1.019668, 1, 0.8941177, 0, 1,
-1.020875, 1.814365, -0.5092029, 1, 0.8980392, 0, 1,
-1.019506, 0.1749755, -1.317183, 1, 0.9058824, 0, 1,
-1.015639, -1.859546, -2.886115, 1, 0.9137255, 0, 1,
-1.01431, 0.1405187, -1.366322, 1, 0.9176471, 0, 1,
-1.007394, 0.2759986, -1.114926, 1, 0.9254902, 0, 1,
-1.005345, 1.505373, -0.9208233, 1, 0.9294118, 0, 1,
-1.002033, -2.726878, -3.291713, 1, 0.9372549, 0, 1,
-1.001328, -1.121803, -3.260289, 1, 0.9411765, 0, 1,
-0.9993419, 0.3582231, -2.070497, 1, 0.9490196, 0, 1,
-0.9939572, 0.1366629, -1.9571, 1, 0.9529412, 0, 1,
-0.9925674, -1.208815, -3.03727, 1, 0.9607843, 0, 1,
-0.9906424, 0.2452718, -1.403641, 1, 0.9647059, 0, 1,
-0.9844404, 0.9924451, -2.189647, 1, 0.972549, 0, 1,
-0.9816459, -0.1430676, -0.01619386, 1, 0.9764706, 0, 1,
-0.980701, 0.2538475, -1.014658, 1, 0.9843137, 0, 1,
-0.9805775, -0.08759731, -0.8231838, 1, 0.9882353, 0, 1,
-0.9678572, 1.02927, 0.7385873, 1, 0.9960784, 0, 1,
-0.9656118, 1.12488, 0.8587498, 0.9960784, 1, 0, 1,
-0.9641472, 0.8631848, -1.365276, 0.9921569, 1, 0, 1,
-0.959264, -0.5584496, -1.534223, 0.9843137, 1, 0, 1,
-0.9514996, 0.198613, -1.141607, 0.9803922, 1, 0, 1,
-0.9476034, 0.6917232, -2.614767, 0.972549, 1, 0, 1,
-0.9472473, -0.5156131, -2.465878, 0.9686275, 1, 0, 1,
-0.9471216, -0.9574841, -3.114236, 0.9607843, 1, 0, 1,
-0.9423673, -0.4968241, -3.930185, 0.9568627, 1, 0, 1,
-0.9330035, -0.7767456, -2.337342, 0.9490196, 1, 0, 1,
-0.924398, 0.6845292, -1.778182, 0.945098, 1, 0, 1,
-0.9191432, 0.07702561, -0.7505992, 0.9372549, 1, 0, 1,
-0.9188675, 2.476455, -1.648984, 0.9333333, 1, 0, 1,
-0.9148522, 0.321314, 0.2756331, 0.9254902, 1, 0, 1,
-0.9126344, 0.8421255, -1.898739, 0.9215686, 1, 0, 1,
-0.9088724, -0.4597383, -1.696967, 0.9137255, 1, 0, 1,
-0.9086339, 0.6921235, -0.8295034, 0.9098039, 1, 0, 1,
-0.9077952, 0.4740809, -2.42903, 0.9019608, 1, 0, 1,
-0.9066812, -0.5083948, -3.557308, 0.8941177, 1, 0, 1,
-0.9014532, -1.001502, -1.537881, 0.8901961, 1, 0, 1,
-0.8979753, 0.5772308, -0.1592749, 0.8823529, 1, 0, 1,
-0.8968566, -0.2378649, -3.335112, 0.8784314, 1, 0, 1,
-0.8952523, -0.9885284, -1.510588, 0.8705882, 1, 0, 1,
-0.8922279, 0.6657261, -1.950896, 0.8666667, 1, 0, 1,
-0.887626, -0.3127593, -2.126937, 0.8588235, 1, 0, 1,
-0.8851892, 0.5559388, -0.8589771, 0.854902, 1, 0, 1,
-0.8814885, 2.375035, -0.7730306, 0.8470588, 1, 0, 1,
-0.8765088, -1.399922, -1.490704, 0.8431373, 1, 0, 1,
-0.8741441, -1.048269, -1.619146, 0.8352941, 1, 0, 1,
-0.8705862, 1.550252, 0.6324531, 0.8313726, 1, 0, 1,
-0.8666644, 0.3669701, -1.960827, 0.8235294, 1, 0, 1,
-0.8632582, -0.9509391, -3.226825, 0.8196079, 1, 0, 1,
-0.8610247, 0.8108895, -1.970194, 0.8117647, 1, 0, 1,
-0.8518627, -0.05046189, -1.06792, 0.8078431, 1, 0, 1,
-0.8500037, 0.4539351, 1.790256, 0.8, 1, 0, 1,
-0.8426908, -1.09651, -0.7280346, 0.7921569, 1, 0, 1,
-0.8410744, 1.162673, 0.4100688, 0.7882353, 1, 0, 1,
-0.8379288, -0.5469677, -2.868932, 0.7803922, 1, 0, 1,
-0.8378649, 0.7655583, -0.6267083, 0.7764706, 1, 0, 1,
-0.837148, 0.1356457, -2.377754, 0.7686275, 1, 0, 1,
-0.8352082, 0.1697288, -1.144933, 0.7647059, 1, 0, 1,
-0.8325149, -1.474126, -2.108971, 0.7568628, 1, 0, 1,
-0.8271565, -1.328444, -1.99368, 0.7529412, 1, 0, 1,
-0.8240452, -1.473768, -0.3188347, 0.7450981, 1, 0, 1,
-0.8229477, 0.4737488, -0.816703, 0.7411765, 1, 0, 1,
-0.8227491, 1.37728, 0.004460067, 0.7333333, 1, 0, 1,
-0.8224421, 1.115255, -2.404865, 0.7294118, 1, 0, 1,
-0.8215708, 0.9956296, -0.480327, 0.7215686, 1, 0, 1,
-0.8173006, 0.6834152, -1.324077, 0.7176471, 1, 0, 1,
-0.8149784, 0.5147437, -1.280933, 0.7098039, 1, 0, 1,
-0.8090901, -0.2445346, -0.4675192, 0.7058824, 1, 0, 1,
-0.8080382, -1.545045, -2.659239, 0.6980392, 1, 0, 1,
-0.806236, 0.5596365, 0.159319, 0.6901961, 1, 0, 1,
-0.8016966, 1.078124, -0.5278473, 0.6862745, 1, 0, 1,
-0.7997807, 0.6022363, -1.483462, 0.6784314, 1, 0, 1,
-0.7954862, -0.2922505, -2.625882, 0.6745098, 1, 0, 1,
-0.7950413, -0.6013216, -1.150006, 0.6666667, 1, 0, 1,
-0.7804537, -0.08137724, -2.412148, 0.6627451, 1, 0, 1,
-0.7788831, -0.3839376, -0.8275953, 0.654902, 1, 0, 1,
-0.7780721, -2.029893, -0.6246781, 0.6509804, 1, 0, 1,
-0.7714082, 0.4611721, -1.431905, 0.6431373, 1, 0, 1,
-0.7671702, 0.4461055, 0.1573183, 0.6392157, 1, 0, 1,
-0.7661093, -0.4233247, -0.810804, 0.6313726, 1, 0, 1,
-0.7626054, -0.3648682, -1.424266, 0.627451, 1, 0, 1,
-0.7619863, -0.2874614, -1.438439, 0.6196079, 1, 0, 1,
-0.7547413, 0.3114626, -1.77231, 0.6156863, 1, 0, 1,
-0.7527095, -1.831453, -2.090194, 0.6078432, 1, 0, 1,
-0.748746, -0.3145456, -1.575967, 0.6039216, 1, 0, 1,
-0.7447203, -0.2796771, -1.780693, 0.5960785, 1, 0, 1,
-0.7419636, 0.0991206, -2.06204, 0.5882353, 1, 0, 1,
-0.7412929, -0.3104675, -2.164178, 0.5843138, 1, 0, 1,
-0.7217113, -0.606243, -2.00421, 0.5764706, 1, 0, 1,
-0.7195661, -0.1550092, -5.003688, 0.572549, 1, 0, 1,
-0.7155626, -1.259243, -3.107487, 0.5647059, 1, 0, 1,
-0.7123142, 0.803188, 0.1796276, 0.5607843, 1, 0, 1,
-0.710584, -0.2111743, -0.1293784, 0.5529412, 1, 0, 1,
-0.7002662, -1.092704, -3.499926, 0.5490196, 1, 0, 1,
-0.6997651, -1.519338, -3.31097, 0.5411765, 1, 0, 1,
-0.6993384, -0.3212796, -2.076127, 0.5372549, 1, 0, 1,
-0.699075, -0.04533902, -1.199405, 0.5294118, 1, 0, 1,
-0.6943686, -0.2011752, -0.7560439, 0.5254902, 1, 0, 1,
-0.6857997, 1.265263, -0.7082232, 0.5176471, 1, 0, 1,
-0.6793917, 0.3832253, -1.750412, 0.5137255, 1, 0, 1,
-0.67787, 0.8148788, -1.45179, 0.5058824, 1, 0, 1,
-0.6776612, 0.5325484, -0.6771286, 0.5019608, 1, 0, 1,
-0.673973, -0.5951211, -1.216101, 0.4941176, 1, 0, 1,
-0.6730854, 1.181323, -2.206903, 0.4862745, 1, 0, 1,
-0.6691657, 0.702584, -1.362617, 0.4823529, 1, 0, 1,
-0.6665462, 0.7627514, -1.651401, 0.4745098, 1, 0, 1,
-0.6646087, 0.7737113, -1.563737, 0.4705882, 1, 0, 1,
-0.6595583, -1.595849, -4.575382, 0.4627451, 1, 0, 1,
-0.6526091, -1.46404, -2.038978, 0.4588235, 1, 0, 1,
-0.6494595, -0.3910519, -0.9993511, 0.4509804, 1, 0, 1,
-0.6461632, -0.7442647, -3.599418, 0.4470588, 1, 0, 1,
-0.6457784, -0.290282, -2.489054, 0.4392157, 1, 0, 1,
-0.6422601, 2.447563, -0.1157731, 0.4352941, 1, 0, 1,
-0.6410164, -0.6610879, -1.354872, 0.427451, 1, 0, 1,
-0.6394243, 1.007044, -0.9612134, 0.4235294, 1, 0, 1,
-0.6382844, -0.4670188, -2.825463, 0.4156863, 1, 0, 1,
-0.6382341, -1.491439, -2.956218, 0.4117647, 1, 0, 1,
-0.6347017, 2.263553, -0.831597, 0.4039216, 1, 0, 1,
-0.63415, -1.150276, -1.194672, 0.3960784, 1, 0, 1,
-0.6314888, -0.07305292, 0.03183307, 0.3921569, 1, 0, 1,
-0.6282187, -2.860285, -3.604609, 0.3843137, 1, 0, 1,
-0.6275832, 1.09342, 1.11149, 0.3803922, 1, 0, 1,
-0.6272475, 0.8042719, -1.277179, 0.372549, 1, 0, 1,
-0.606748, 0.7126736, -0.6812837, 0.3686275, 1, 0, 1,
-0.6009578, -1.316383, -5.451728, 0.3607843, 1, 0, 1,
-0.5988523, 1.056418, -0.2188034, 0.3568628, 1, 0, 1,
-0.5936033, -1.148444, -4.468999, 0.3490196, 1, 0, 1,
-0.5925684, 0.7256421, -0.9574685, 0.345098, 1, 0, 1,
-0.590778, 1.616752, -0.4704491, 0.3372549, 1, 0, 1,
-0.5853893, -1.0438, -2.441099, 0.3333333, 1, 0, 1,
-0.5841508, 0.9390382, -2.172073, 0.3254902, 1, 0, 1,
-0.5795668, -1.079806, -3.610479, 0.3215686, 1, 0, 1,
-0.5779898, 1.089711, -0.7865233, 0.3137255, 1, 0, 1,
-0.5764751, -0.8883122, -2.695892, 0.3098039, 1, 0, 1,
-0.575864, -0.3093386, -1.106735, 0.3019608, 1, 0, 1,
-0.574017, -0.9869776, -0.9522614, 0.2941177, 1, 0, 1,
-0.5727265, -0.2844188, -2.445714, 0.2901961, 1, 0, 1,
-0.5711834, 0.3392007, -1.793134, 0.282353, 1, 0, 1,
-0.5689681, -1.275637, -4.392352, 0.2784314, 1, 0, 1,
-0.5683554, 1.080663, -0.8332778, 0.2705882, 1, 0, 1,
-0.5682864, 0.05490054, -0.4577898, 0.2666667, 1, 0, 1,
-0.5637934, -1.137426, -1.816898, 0.2588235, 1, 0, 1,
-0.5532507, 0.3749984, -1.10403, 0.254902, 1, 0, 1,
-0.5477093, 1.319529, -2.012308, 0.2470588, 1, 0, 1,
-0.5387049, 0.1070021, -1.880764, 0.2431373, 1, 0, 1,
-0.53583, 0.09814389, -2.376702, 0.2352941, 1, 0, 1,
-0.5348927, -0.4127818, -3.881139, 0.2313726, 1, 0, 1,
-0.5337484, -0.4459511, -4.375957, 0.2235294, 1, 0, 1,
-0.5259678, -0.3488138, -2.114086, 0.2196078, 1, 0, 1,
-0.5225248, 1.920453, -0.48224, 0.2117647, 1, 0, 1,
-0.5220821, 0.4582327, -1.622437, 0.2078431, 1, 0, 1,
-0.5207926, 0.009792445, -0.6417821, 0.2, 1, 0, 1,
-0.5204912, -1.154502, -2.905174, 0.1921569, 1, 0, 1,
-0.5147339, -0.06588603, -2.469744, 0.1882353, 1, 0, 1,
-0.5137821, 1.348721, -1.336582, 0.1803922, 1, 0, 1,
-0.5084531, -0.438402, -3.693138, 0.1764706, 1, 0, 1,
-0.4995224, 0.545551, -1.314875, 0.1686275, 1, 0, 1,
-0.497215, -0.1977095, -1.259528, 0.1647059, 1, 0, 1,
-0.4902612, 1.508474, 0.2968483, 0.1568628, 1, 0, 1,
-0.4877279, -0.6401001, -3.421825, 0.1529412, 1, 0, 1,
-0.4872142, 1.501835, -0.3072447, 0.145098, 1, 0, 1,
-0.4862357, 1.003194, 0.8931751, 0.1411765, 1, 0, 1,
-0.4854507, 0.7350941, -0.7005551, 0.1333333, 1, 0, 1,
-0.4854168, 1.430647, 1.116554, 0.1294118, 1, 0, 1,
-0.4826166, -0.5079247, -2.969371, 0.1215686, 1, 0, 1,
-0.4757646, 0.3734054, -1.690151, 0.1176471, 1, 0, 1,
-0.4752789, 0.2351765, 1.280812, 0.1098039, 1, 0, 1,
-0.4745455, -1.444238, -2.38131, 0.1058824, 1, 0, 1,
-0.471848, -0.6208589, -1.385538, 0.09803922, 1, 0, 1,
-0.4717309, -1.499057, -3.415031, 0.09019608, 1, 0, 1,
-0.4708256, -0.3583131, -1.794576, 0.08627451, 1, 0, 1,
-0.4692636, 0.1702264, -2.367682, 0.07843138, 1, 0, 1,
-0.4644522, -1.546413, -3.935103, 0.07450981, 1, 0, 1,
-0.4631284, -0.4036719, -0.9913028, 0.06666667, 1, 0, 1,
-0.4608284, 1.503461, 0.8314194, 0.0627451, 1, 0, 1,
-0.4607406, 0.324527, -0.2802359, 0.05490196, 1, 0, 1,
-0.4599583, 0.6300265, -0.4229462, 0.05098039, 1, 0, 1,
-0.456498, -0.4112647, -2.183946, 0.04313726, 1, 0, 1,
-0.4520183, -1.765926, -2.798939, 0.03921569, 1, 0, 1,
-0.4516765, 0.1953339, -2.135719, 0.03137255, 1, 0, 1,
-0.4506064, 0.6831419, 0.6152796, 0.02745098, 1, 0, 1,
-0.4497009, -0.09658668, -0.735862, 0.01960784, 1, 0, 1,
-0.4446909, -0.5301398, -3.02453, 0.01568628, 1, 0, 1,
-0.4441155, -1.259002, -3.645157, 0.007843138, 1, 0, 1,
-0.4435597, -0.7391634, -3.191317, 0.003921569, 1, 0, 1,
-0.4364441, -0.4889185, -1.790056, 0, 1, 0.003921569, 1,
-0.4339803, 1.071833, -0.9572429, 0, 1, 0.01176471, 1,
-0.4329675, -0.9256777, -3.70685, 0, 1, 0.01568628, 1,
-0.4181408, -1.590404, -2.412244, 0, 1, 0.02352941, 1,
-0.409763, -0.4543728, -2.174743, 0, 1, 0.02745098, 1,
-0.4073944, -0.4976799, -2.476977, 0, 1, 0.03529412, 1,
-0.4052869, -0.1225996, -1.972, 0, 1, 0.03921569, 1,
-0.4034189, -0.7054699, -1.275892, 0, 1, 0.04705882, 1,
-0.403136, -1.983225, -2.394429, 0, 1, 0.05098039, 1,
-0.4027294, 0.2019715, -1.4418, 0, 1, 0.05882353, 1,
-0.4006993, -1.373292, -2.478877, 0, 1, 0.0627451, 1,
-0.3983385, -0.7714916, -2.411994, 0, 1, 0.07058824, 1,
-0.3979435, 2.183563, -1.251809, 0, 1, 0.07450981, 1,
-0.3960055, 0.1137382, -1.138444, 0, 1, 0.08235294, 1,
-0.3932007, -0.9126045, -2.350799, 0, 1, 0.08627451, 1,
-0.3931409, 0.5860813, 0.2163738, 0, 1, 0.09411765, 1,
-0.3908227, -0.7110744, -3.19011, 0, 1, 0.1019608, 1,
-0.3896076, -1.583878, -3.898719, 0, 1, 0.1058824, 1,
-0.3720005, -0.4146563, -1.715315, 0, 1, 0.1137255, 1,
-0.3710696, 0.1440611, 0.5066356, 0, 1, 0.1176471, 1,
-0.3702837, 1.864745, -0.2072276, 0, 1, 0.1254902, 1,
-0.3674164, 1.516593, -2.607685, 0, 1, 0.1294118, 1,
-0.3667535, 1.34957, -1.702641, 0, 1, 0.1372549, 1,
-0.3658693, -0.7593035, -1.651427, 0, 1, 0.1411765, 1,
-0.3647889, -0.7587062, -2.397785, 0, 1, 0.1490196, 1,
-0.3569486, -1.637237, -1.682802, 0, 1, 0.1529412, 1,
-0.3557616, -0.05746349, -1.312356, 0, 1, 0.1607843, 1,
-0.3550959, 0.2302652, -0.05774414, 0, 1, 0.1647059, 1,
-0.3542442, -1.826781, -3.070929, 0, 1, 0.172549, 1,
-0.3525111, 0.3630392, 0.0213077, 0, 1, 0.1764706, 1,
-0.349715, 0.3314677, -1.704321, 0, 1, 0.1843137, 1,
-0.3490627, -0.5874829, -2.21616, 0, 1, 0.1882353, 1,
-0.3475165, 1.140441, -0.2177036, 0, 1, 0.1960784, 1,
-0.3429814, -1.203532, -3.010991, 0, 1, 0.2039216, 1,
-0.3403804, -0.4342925, -2.312821, 0, 1, 0.2078431, 1,
-0.3394738, 0.8196424, -1.123253, 0, 1, 0.2156863, 1,
-0.3391176, -0.9560727, -2.074385, 0, 1, 0.2196078, 1,
-0.3379765, 0.05858112, 0.5449695, 0, 1, 0.227451, 1,
-0.3370449, 0.08094523, -2.508919, 0, 1, 0.2313726, 1,
-0.3368299, 0.3641195, -1.622547, 0, 1, 0.2392157, 1,
-0.3362032, -1.365145, -4.918223, 0, 1, 0.2431373, 1,
-0.3345737, -0.05239406, -3.245478, 0, 1, 0.2509804, 1,
-0.3340333, 0.9338962, -1.581118, 0, 1, 0.254902, 1,
-0.3284278, 0.5351598, -1.581618, 0, 1, 0.2627451, 1,
-0.3279374, -0.803957, -3.384997, 0, 1, 0.2666667, 1,
-0.3269367, 0.956546, -0.9677563, 0, 1, 0.2745098, 1,
-0.3242882, 2.067505, -0.6181575, 0, 1, 0.2784314, 1,
-0.3236995, -0.6018405, -2.418044, 0, 1, 0.2862745, 1,
-0.3208721, 0.03172662, -2.955076, 0, 1, 0.2901961, 1,
-0.3194025, -0.525671, -2.985744, 0, 1, 0.2980392, 1,
-0.3181496, -0.4644853, -3.610236, 0, 1, 0.3058824, 1,
-0.3158857, 0.6656072, -0.05159886, 0, 1, 0.3098039, 1,
-0.3158783, 0.5230515, -0.4802107, 0, 1, 0.3176471, 1,
-0.3074152, -1.316019, -2.899856, 0, 1, 0.3215686, 1,
-0.3047966, -1.179217, -2.235015, 0, 1, 0.3294118, 1,
-0.3023015, 0.8591908, -0.2998118, 0, 1, 0.3333333, 1,
-0.2958563, -1.454401, -2.8036, 0, 1, 0.3411765, 1,
-0.2927596, -0.05401072, -0.869365, 0, 1, 0.345098, 1,
-0.2927334, -0.2634707, -0.6386763, 0, 1, 0.3529412, 1,
-0.2908277, 0.8927748, 0.2447104, 0, 1, 0.3568628, 1,
-0.2906049, 0.4142047, 2.124002, 0, 1, 0.3647059, 1,
-0.2885731, 1.610179, 0.08836565, 0, 1, 0.3686275, 1,
-0.28236, 1.417667, 0.7303649, 0, 1, 0.3764706, 1,
-0.2765968, -0.2473854, -1.735569, 0, 1, 0.3803922, 1,
-0.2748932, -1.845206, -2.912278, 0, 1, 0.3882353, 1,
-0.2702906, 2.430743, 1.978722, 0, 1, 0.3921569, 1,
-0.2673576, -0.7202479, -1.960451, 0, 1, 0.4, 1,
-0.2672716, 0.944257, 0.184294, 0, 1, 0.4078431, 1,
-0.2642886, 2.476022, -1.366957, 0, 1, 0.4117647, 1,
-0.2641492, 1.371133, -1.344744, 0, 1, 0.4196078, 1,
-0.25661, 0.2658778, 1.577111, 0, 1, 0.4235294, 1,
-0.2564096, 1.918025, -1.36203, 0, 1, 0.4313726, 1,
-0.2535965, 0.6186659, -2.722794, 0, 1, 0.4352941, 1,
-0.2523448, 2.015161, 1.795033, 0, 1, 0.4431373, 1,
-0.2468966, -0.2452101, -1.568955, 0, 1, 0.4470588, 1,
-0.2448906, 0.9008389, 0.9847852, 0, 1, 0.454902, 1,
-0.240394, -1.376049, -1.782727, 0, 1, 0.4588235, 1,
-0.2401588, 1.007443, -1.126867, 0, 1, 0.4666667, 1,
-0.2359382, -0.1726389, -3.447543, 0, 1, 0.4705882, 1,
-0.2279948, -0.9612328, -2.517953, 0, 1, 0.4784314, 1,
-0.2236465, -0.6112991, -3.099893, 0, 1, 0.4823529, 1,
-0.2226747, 0.7162817, -1.155095, 0, 1, 0.4901961, 1,
-0.2214866, 0.6724316, -1.324052, 0, 1, 0.4941176, 1,
-0.2205883, 2.072265, 0.06007581, 0, 1, 0.5019608, 1,
-0.2197028, -0.3864925, -2.198343, 0, 1, 0.509804, 1,
-0.2191171, -0.9395228, -2.863537, 0, 1, 0.5137255, 1,
-0.2185457, -1.424703, -2.86222, 0, 1, 0.5215687, 1,
-0.2146535, -0.08668947, -0.9447357, 0, 1, 0.5254902, 1,
-0.2071649, -0.3559287, -2.999212, 0, 1, 0.5333334, 1,
-0.2059704, -0.5069625, -2.509909, 0, 1, 0.5372549, 1,
-0.2046527, -0.6018844, -3.806006, 0, 1, 0.5450981, 1,
-0.2041264, 0.7423036, -0.5036044, 0, 1, 0.5490196, 1,
-0.202764, 0.74779, -0.651317, 0, 1, 0.5568628, 1,
-0.2019928, 0.9366253, -0.2539385, 0, 1, 0.5607843, 1,
-0.2016604, -0.459842, -4.310607, 0, 1, 0.5686275, 1,
-0.200991, -0.1452494, -0.7929136, 0, 1, 0.572549, 1,
-0.1975736, 0.7188676, -1.78091, 0, 1, 0.5803922, 1,
-0.1958281, 0.7690166, -0.6287783, 0, 1, 0.5843138, 1,
-0.1957546, -0.305495, -3.943614, 0, 1, 0.5921569, 1,
-0.1944226, 1.832547, -1.119994, 0, 1, 0.5960785, 1,
-0.1943362, -0.8296835, -2.744694, 0, 1, 0.6039216, 1,
-0.1936317, -0.1923845, -0.7793677, 0, 1, 0.6117647, 1,
-0.1934942, 1.384652, -0.7116029, 0, 1, 0.6156863, 1,
-0.1880647, 0.3590593, -0.9225904, 0, 1, 0.6235294, 1,
-0.1846415, -0.2369507, -3.758517, 0, 1, 0.627451, 1,
-0.182757, -0.8617278, -4.452925, 0, 1, 0.6352941, 1,
-0.182642, -0.5193805, -2.334437, 0, 1, 0.6392157, 1,
-0.1820025, -1.300715, -2.892742, 0, 1, 0.6470588, 1,
-0.1792544, 0.4522012, 0.931334, 0, 1, 0.6509804, 1,
-0.172416, 1.269791, -1.177922, 0, 1, 0.6588235, 1,
-0.1724036, -0.05022281, -2.185568, 0, 1, 0.6627451, 1,
-0.1723349, 1.40271, -0.007968417, 0, 1, 0.6705883, 1,
-0.1665667, 0.4853773, 0.1853624, 0, 1, 0.6745098, 1,
-0.166259, 1.294328, -0.7685016, 0, 1, 0.682353, 1,
-0.1653832, -0.3521816, -2.43628, 0, 1, 0.6862745, 1,
-0.1648546, 1.233134, -0.9313803, 0, 1, 0.6941177, 1,
-0.1604438, -0.9761426, -3.934097, 0, 1, 0.7019608, 1,
-0.156997, -2.003778, -1.797865, 0, 1, 0.7058824, 1,
-0.1558741, -0.2132402, -1.463148, 0, 1, 0.7137255, 1,
-0.1557797, 0.8324332, 1.020133, 0, 1, 0.7176471, 1,
-0.1541157, -1.105691, -3.91186, 0, 1, 0.7254902, 1,
-0.1538566, -0.8903479, -2.639674, 0, 1, 0.7294118, 1,
-0.1526544, -0.309269, -3.463515, 0, 1, 0.7372549, 1,
-0.1472024, 1.360049, 1.151102, 0, 1, 0.7411765, 1,
-0.1380499, 0.8068869, -1.567267, 0, 1, 0.7490196, 1,
-0.1339926, -1.92282, -2.881399, 0, 1, 0.7529412, 1,
-0.1339795, 0.8256519, -0.5655067, 0, 1, 0.7607843, 1,
-0.1333067, 1.805096, -1.099689, 0, 1, 0.7647059, 1,
-0.128916, 1.511395, -1.48846, 0, 1, 0.772549, 1,
-0.1287046, 1.04402, -2.943036, 0, 1, 0.7764706, 1,
-0.1284511, -0.4528118, -2.00239, 0, 1, 0.7843137, 1,
-0.1271242, -0.6277886, -3.134872, 0, 1, 0.7882353, 1,
-0.1238486, -0.6996661, -1.875742, 0, 1, 0.7960784, 1,
-0.123805, 1.773381, 1.587098, 0, 1, 0.8039216, 1,
-0.1219908, -1.27252, -2.317229, 0, 1, 0.8078431, 1,
-0.1194651, 1.379997, 0.4100039, 0, 1, 0.8156863, 1,
-0.1146294, 2.113812, 0.6413636, 0, 1, 0.8196079, 1,
-0.1081581, 1.202191, -0.9365546, 0, 1, 0.827451, 1,
-0.1076084, 1.326275, 1.649657, 0, 1, 0.8313726, 1,
-0.09846624, -1.403355, -4.104881, 0, 1, 0.8392157, 1,
-0.09818105, -0.0899857, -3.482208, 0, 1, 0.8431373, 1,
-0.09655908, -0.5137208, -2.021314, 0, 1, 0.8509804, 1,
-0.08724146, 0.3874866, -2.423709, 0, 1, 0.854902, 1,
-0.0847929, 0.3680446, -1.041422, 0, 1, 0.8627451, 1,
-0.08106175, -0.8657231, -3.741651, 0, 1, 0.8666667, 1,
-0.08027714, -1.83568, -1.862535, 0, 1, 0.8745098, 1,
-0.07929368, -1.469578, -3.586877, 0, 1, 0.8784314, 1,
-0.0792463, 0.07315588, -0.4560344, 0, 1, 0.8862745, 1,
-0.07913349, -1.347231, -4.66657, 0, 1, 0.8901961, 1,
-0.07790841, -1.512028, -4.467724, 0, 1, 0.8980392, 1,
-0.07639768, 0.02493632, -1.032487, 0, 1, 0.9058824, 1,
-0.07627399, -0.5201253, -3.004226, 0, 1, 0.9098039, 1,
-0.07181349, 0.5619684, -1.969389, 0, 1, 0.9176471, 1,
-0.06897154, -0.5466291, -2.603346, 0, 1, 0.9215686, 1,
-0.06607738, -0.8047799, -3.752627, 0, 1, 0.9294118, 1,
-0.06476378, 0.5511369, -0.2416328, 0, 1, 0.9333333, 1,
-0.06416765, 1.262448, 0.4486078, 0, 1, 0.9411765, 1,
-0.05786063, -1.404811, -3.189652, 0, 1, 0.945098, 1,
-0.05343437, -0.7765979, -4.323574, 0, 1, 0.9529412, 1,
-0.0515903, -1.193942, -4.491879, 0, 1, 0.9568627, 1,
-0.04512626, -0.3011509, -2.216048, 0, 1, 0.9647059, 1,
-0.04293294, 2.156366, -0.0004130636, 0, 1, 0.9686275, 1,
-0.04150607, 1.398555, 1.009109, 0, 1, 0.9764706, 1,
-0.04142282, -1.162063, -2.624945, 0, 1, 0.9803922, 1,
-0.03953548, 1.564218, -0.2667037, 0, 1, 0.9882353, 1,
-0.03883941, 0.08924334, -0.9091747, 0, 1, 0.9921569, 1,
-0.03536436, 1.286669, 0.6099674, 0, 1, 1, 1,
-0.03369371, -0.06148548, -2.677052, 0, 0.9921569, 1, 1,
-0.03189299, 0.397758, 0.6705114, 0, 0.9882353, 1, 1,
-0.02400038, -2.272174, -4.552852, 0, 0.9803922, 1, 1,
-0.01980038, -0.4518298, -2.845734, 0, 0.9764706, 1, 1,
-0.0160085, -2.044072, -3.491853, 0, 0.9686275, 1, 1,
-0.01347815, -0.3408979, -4.543231, 0, 0.9647059, 1, 1,
-0.01258751, 1.107629, 0.9880975, 0, 0.9568627, 1, 1,
-0.005611768, -1.111978, -2.06243, 0, 0.9529412, 1, 1,
-0.005541756, 0.7961687, 1.586838, 0, 0.945098, 1, 1,
-0.00544339, -0.2332865, -2.643467, 0, 0.9411765, 1, 1,
-0.004238495, -0.9046478, -3.622327, 0, 0.9333333, 1, 1,
-0.001995859, 0.544879, -0.3110165, 0, 0.9294118, 1, 1,
-0.001956033, -0.1965988, -1.729142, 0, 0.9215686, 1, 1,
0.0001452117, 0.4757764, 1.190929, 0, 0.9176471, 1, 1,
0.003113013, -1.859624, 1.465747, 0, 0.9098039, 1, 1,
0.00779041, -0.4064777, 4.962059, 0, 0.9058824, 1, 1,
0.01529319, 0.1100836, 1.75134, 0, 0.8980392, 1, 1,
0.01720455, 1.862758, 1.113468, 0, 0.8901961, 1, 1,
0.01754476, -1.656764, 5.444707, 0, 0.8862745, 1, 1,
0.01862115, 0.5266602, -0.02668983, 0, 0.8784314, 1, 1,
0.02033122, 0.7915537, 0.168665, 0, 0.8745098, 1, 1,
0.02681374, -0.5376574, 4.353536, 0, 0.8666667, 1, 1,
0.0348961, -1.223184, 3.921404, 0, 0.8627451, 1, 1,
0.03641639, -0.2654449, 3.754634, 0, 0.854902, 1, 1,
0.04335985, 0.586886, 2.1659, 0, 0.8509804, 1, 1,
0.04548789, 0.331377, 1.556446, 0, 0.8431373, 1, 1,
0.04583916, -0.307974, 2.50758, 0, 0.8392157, 1, 1,
0.05480247, -0.06184227, 1.007275, 0, 0.8313726, 1, 1,
0.06091463, -1.426086, 2.589186, 0, 0.827451, 1, 1,
0.06395267, 2.927051, 0.9205363, 0, 0.8196079, 1, 1,
0.0640212, -0.8876649, 2.066215, 0, 0.8156863, 1, 1,
0.06621577, 0.3458129, -0.4536477, 0, 0.8078431, 1, 1,
0.07026684, 0.9364385, 0.2986868, 0, 0.8039216, 1, 1,
0.07067993, -0.3957034, 2.392275, 0, 0.7960784, 1, 1,
0.07094435, 0.6614584, -0.5184082, 0, 0.7882353, 1, 1,
0.07144145, -0.3055257, 1.93625, 0, 0.7843137, 1, 1,
0.07689579, 1.915393, -2.381602, 0, 0.7764706, 1, 1,
0.07799568, -0.1054337, 2.691613, 0, 0.772549, 1, 1,
0.08136651, 0.6458774, -0.6118684, 0, 0.7647059, 1, 1,
0.08270875, -1.129188, 2.79652, 0, 0.7607843, 1, 1,
0.0868953, 0.9581107, 1.363742, 0, 0.7529412, 1, 1,
0.09133295, 1.74546, 2.693862, 0, 0.7490196, 1, 1,
0.09172246, 0.2769911, 1.02323, 0, 0.7411765, 1, 1,
0.09215292, -1.441183, 4.070193, 0, 0.7372549, 1, 1,
0.09777956, 0.6889465, 1.114812, 0, 0.7294118, 1, 1,
0.09834185, 2.782293, 1.10287, 0, 0.7254902, 1, 1,
0.09839568, 0.7420291, 0.8565484, 0, 0.7176471, 1, 1,
0.09868655, 0.8635277, 0.01918427, 0, 0.7137255, 1, 1,
0.1003258, -0.2673745, 2.866839, 0, 0.7058824, 1, 1,
0.1029248, -0.7514915, 3.338313, 0, 0.6980392, 1, 1,
0.1036303, 0.08830509, 1.080664, 0, 0.6941177, 1, 1,
0.1049527, -0.4045578, 1.684451, 0, 0.6862745, 1, 1,
0.1077716, 0.6917244, 0.5336024, 0, 0.682353, 1, 1,
0.1097404, 1.652647, -1.015889, 0, 0.6745098, 1, 1,
0.1116505, -0.6067098, 2.253526, 0, 0.6705883, 1, 1,
0.1122495, -0.8949874, 2.726862, 0, 0.6627451, 1, 1,
0.1147377, -1.659907, 2.387417, 0, 0.6588235, 1, 1,
0.1168888, -0.09310428, 2.497179, 0, 0.6509804, 1, 1,
0.1175203, 0.7438972, 0.4180116, 0, 0.6470588, 1, 1,
0.1179223, -0.04033933, 1.589432, 0, 0.6392157, 1, 1,
0.1194784, 1.442207, 0.8118764, 0, 0.6352941, 1, 1,
0.1218482, 1.763283, -0.4275764, 0, 0.627451, 1, 1,
0.1273369, 0.7829102, 2.128175, 0, 0.6235294, 1, 1,
0.1275601, -0.9546354, 3.636843, 0, 0.6156863, 1, 1,
0.1287821, 0.5333196, 0.3715871, 0, 0.6117647, 1, 1,
0.130331, -0.1124742, -0.2324976, 0, 0.6039216, 1, 1,
0.1305468, -0.9792275, 2.320809, 0, 0.5960785, 1, 1,
0.1308905, -1.408686, 4.240463, 0, 0.5921569, 1, 1,
0.1341405, -0.5855117, 1.191174, 0, 0.5843138, 1, 1,
0.1460223, -0.1737527, 1.325807, 0, 0.5803922, 1, 1,
0.1481637, -0.5715029, 2.671585, 0, 0.572549, 1, 1,
0.1544719, 1.525944, -0.02539654, 0, 0.5686275, 1, 1,
0.1555304, 1.503266, 0.139857, 0, 0.5607843, 1, 1,
0.1557609, -0.3249196, 4.475751, 0, 0.5568628, 1, 1,
0.1571065, -0.6717504, 3.157565, 0, 0.5490196, 1, 1,
0.1640012, -0.5025031, 4.282776, 0, 0.5450981, 1, 1,
0.1662097, 0.1354601, 0.02971328, 0, 0.5372549, 1, 1,
0.1677584, -0.29566, 4.163799, 0, 0.5333334, 1, 1,
0.1691549, -0.2151673, 2.543516, 0, 0.5254902, 1, 1,
0.1764329, 0.1578804, 0.5670779, 0, 0.5215687, 1, 1,
0.1766201, 1.869689, 0.1629469, 0, 0.5137255, 1, 1,
0.1823783, -2.517156, 2.172141, 0, 0.509804, 1, 1,
0.1831087, 0.2807497, -0.0992491, 0, 0.5019608, 1, 1,
0.187727, -0.1175546, 1.351818, 0, 0.4941176, 1, 1,
0.1971286, -0.8678145, 2.80536, 0, 0.4901961, 1, 1,
0.198249, 0.9087167, 0.8807009, 0, 0.4823529, 1, 1,
0.2075574, -1.534459, 2.974105, 0, 0.4784314, 1, 1,
0.2143203, 1.176394, 1.212233, 0, 0.4705882, 1, 1,
0.2182702, 0.7621275, -0.2142909, 0, 0.4666667, 1, 1,
0.2201871, -1.511296, 4.733288, 0, 0.4588235, 1, 1,
0.2210938, 0.2713123, 0.3347642, 0, 0.454902, 1, 1,
0.2241445, -1.769942, 2.442864, 0, 0.4470588, 1, 1,
0.2290069, 1.1703, -1.85565, 0, 0.4431373, 1, 1,
0.2298238, 0.6679281, 2.760511, 0, 0.4352941, 1, 1,
0.2308113, 1.634567, -0.378445, 0, 0.4313726, 1, 1,
0.2400495, 1.038183, 1.008578, 0, 0.4235294, 1, 1,
0.2416315, 0.5046763, -0.8304394, 0, 0.4196078, 1, 1,
0.2494286, -0.2422886, 2.592919, 0, 0.4117647, 1, 1,
0.252498, -0.8544015, 2.309279, 0, 0.4078431, 1, 1,
0.2543864, 2.60898, 0.8139839, 0, 0.4, 1, 1,
0.258146, 1.961298, -0.5333269, 0, 0.3921569, 1, 1,
0.2608246, 0.4961426, -0.3634275, 0, 0.3882353, 1, 1,
0.2643176, -0.2809613, 2.35733, 0, 0.3803922, 1, 1,
0.2644678, 0.2498793, 2.249654, 0, 0.3764706, 1, 1,
0.2673436, -0.4970026, 1.791704, 0, 0.3686275, 1, 1,
0.2678698, 1.501625, -0.3051853, 0, 0.3647059, 1, 1,
0.2688028, 0.4653916, 1.589162, 0, 0.3568628, 1, 1,
0.273717, 0.6923214, 0.5992753, 0, 0.3529412, 1, 1,
0.2762257, 0.5210891, 1.667668, 0, 0.345098, 1, 1,
0.2776676, -0.8420782, 2.716439, 0, 0.3411765, 1, 1,
0.2803586, -0.104169, 1.161312, 0, 0.3333333, 1, 1,
0.2812833, -1.46291, 2.16482, 0, 0.3294118, 1, 1,
0.281578, 0.2745828, 0.314119, 0, 0.3215686, 1, 1,
0.2930404, -0.07948063, 2.047137, 0, 0.3176471, 1, 1,
0.293165, 1.625265, 0.3623007, 0, 0.3098039, 1, 1,
0.2948235, -1.302856, 3.361742, 0, 0.3058824, 1, 1,
0.295032, -0.6222975, 2.797888, 0, 0.2980392, 1, 1,
0.2991887, -1.758223, 2.266363, 0, 0.2901961, 1, 1,
0.3028465, 1.766148, 1.828167, 0, 0.2862745, 1, 1,
0.3128923, 1.221357, -1.561212, 0, 0.2784314, 1, 1,
0.3142911, -1.84377, 3.262097, 0, 0.2745098, 1, 1,
0.3180643, -1.252003, 4.162047, 0, 0.2666667, 1, 1,
0.3296263, 0.08756822, 1.64019, 0, 0.2627451, 1, 1,
0.3298909, 1.114674, -1.337231, 0, 0.254902, 1, 1,
0.3305774, -0.02576914, 0.3769259, 0, 0.2509804, 1, 1,
0.3332899, -0.9681413, 3.416723, 0, 0.2431373, 1, 1,
0.3376053, 2.455165, 0.3577606, 0, 0.2392157, 1, 1,
0.33776, -0.1345448, 2.855141, 0, 0.2313726, 1, 1,
0.3395222, -2.411071, 2.211162, 0, 0.227451, 1, 1,
0.3447944, -1.788665, 4.142952, 0, 0.2196078, 1, 1,
0.3462498, -1.562272, 2.261155, 0, 0.2156863, 1, 1,
0.3504173, -2.232211, 2.859108, 0, 0.2078431, 1, 1,
0.3516926, 1.437998, 0.728389, 0, 0.2039216, 1, 1,
0.3534861, -0.852066, 3.039559, 0, 0.1960784, 1, 1,
0.3567563, 0.5357041, 1.098951, 0, 0.1882353, 1, 1,
0.3571029, 1.657797, -1.337674, 0, 0.1843137, 1, 1,
0.3581534, 1.421979, 1.678484, 0, 0.1764706, 1, 1,
0.363559, -0.4084757, 2.316752, 0, 0.172549, 1, 1,
0.3659573, 0.6253387, 0.5233765, 0, 0.1647059, 1, 1,
0.366143, 2.305145, -0.5426924, 0, 0.1607843, 1, 1,
0.3719382, -0.5847055, 2.570555, 0, 0.1529412, 1, 1,
0.372894, 0.3625447, -0.1348053, 0, 0.1490196, 1, 1,
0.3767948, 0.3238705, -0.6860108, 0, 0.1411765, 1, 1,
0.3804214, -0.3305807, 2.122745, 0, 0.1372549, 1, 1,
0.3806149, -0.9122136, 3.560968, 0, 0.1294118, 1, 1,
0.3850633, 1.254992, -0.2574564, 0, 0.1254902, 1, 1,
0.3853977, 0.3308201, 2.335459, 0, 0.1176471, 1, 1,
0.3884238, -0.5191601, 1.992589, 0, 0.1137255, 1, 1,
0.3889883, 0.2393577, 1.833258, 0, 0.1058824, 1, 1,
0.392983, -0.3166806, 0.9874424, 0, 0.09803922, 1, 1,
0.3976569, 0.8955373, 1.187667, 0, 0.09411765, 1, 1,
0.4013133, 0.1813146, 0.6023177, 0, 0.08627451, 1, 1,
0.4021846, 0.07888696, 4.092944, 0, 0.08235294, 1, 1,
0.4036281, 1.504207, -2.790232, 0, 0.07450981, 1, 1,
0.4091642, 0.9335714, 1.437251, 0, 0.07058824, 1, 1,
0.4126528, 0.4857246, 0.8282351, 0, 0.0627451, 1, 1,
0.4160207, -0.2936311, 2.346709, 0, 0.05882353, 1, 1,
0.4177445, 0.7954543, -0.6863161, 0, 0.05098039, 1, 1,
0.4227864, 0.4375205, -0.001229909, 0, 0.04705882, 1, 1,
0.4235433, 1.777104, -0.7166659, 0, 0.03921569, 1, 1,
0.4240961, 1.425595, 1.65995, 0, 0.03529412, 1, 1,
0.4243194, 0.764249, -0.05801902, 0, 0.02745098, 1, 1,
0.4290713, 0.3244192, -0.1480073, 0, 0.02352941, 1, 1,
0.4328897, 0.4412037, -0.6908068, 0, 0.01568628, 1, 1,
0.4381548, -1.136664, 3.762512, 0, 0.01176471, 1, 1,
0.4398357, 0.6541418, -0.3520654, 0, 0.003921569, 1, 1,
0.4402362, 0.5963748, 0.4645666, 0.003921569, 0, 1, 1,
0.4429253, -0.01506574, 1.579956, 0.007843138, 0, 1, 1,
0.4502945, 1.349316, 0.2529912, 0.01568628, 0, 1, 1,
0.4520003, -0.2937672, 2.090149, 0.01960784, 0, 1, 1,
0.4659046, -0.5262047, 1.916438, 0.02745098, 0, 1, 1,
0.4667195, -0.4092844, 0.8996884, 0.03137255, 0, 1, 1,
0.4705246, 0.2706302, -1.427101, 0.03921569, 0, 1, 1,
0.4713972, 1.061945, 0.3770728, 0.04313726, 0, 1, 1,
0.4737478, -1.001538, 3.0273, 0.05098039, 0, 1, 1,
0.4770189, 1.764304, 1.488815, 0.05490196, 0, 1, 1,
0.4834141, -2.655154, 2.00172, 0.0627451, 0, 1, 1,
0.4847449, -0.04659398, 1.428056, 0.06666667, 0, 1, 1,
0.485407, -0.9332659, 2.299607, 0.07450981, 0, 1, 1,
0.4868863, -1.049817, 2.052611, 0.07843138, 0, 1, 1,
0.4916663, 1.282479, 0.7203016, 0.08627451, 0, 1, 1,
0.4935702, -0.04010939, 3.554669, 0.09019608, 0, 1, 1,
0.4987874, 0.1382661, 0.9578686, 0.09803922, 0, 1, 1,
0.5066351, -1.52415, 2.119393, 0.1058824, 0, 1, 1,
0.5113235, -0.6819161, 3.005974, 0.1098039, 0, 1, 1,
0.5115905, 0.6785946, 0.7813249, 0.1176471, 0, 1, 1,
0.5127364, -0.7343002, 2.567309, 0.1215686, 0, 1, 1,
0.5138226, -0.3277745, 1.805574, 0.1294118, 0, 1, 1,
0.5169581, -0.4146909, 1.648863, 0.1333333, 0, 1, 1,
0.517391, 1.154858, 1.316901, 0.1411765, 0, 1, 1,
0.5178127, -0.6977419, 4.087818, 0.145098, 0, 1, 1,
0.5181696, -2.241974, 4.251006, 0.1529412, 0, 1, 1,
0.5200725, -1.112021, 2.065211, 0.1568628, 0, 1, 1,
0.5219108, 0.4828869, 1.08357, 0.1647059, 0, 1, 1,
0.5238412, -1.594086, 3.519583, 0.1686275, 0, 1, 1,
0.5327523, -0.01981797, 1.174577, 0.1764706, 0, 1, 1,
0.5363014, 0.2455506, 1.135249, 0.1803922, 0, 1, 1,
0.537119, 1.020287, 0.3661926, 0.1882353, 0, 1, 1,
0.5389123, 0.004634479, 1.847727, 0.1921569, 0, 1, 1,
0.5464994, 0.7817752, 0.487244, 0.2, 0, 1, 1,
0.5478963, 0.5693488, 0.839482, 0.2078431, 0, 1, 1,
0.548589, -0.2456339, 1.924015, 0.2117647, 0, 1, 1,
0.5492916, -0.3692486, 1.717761, 0.2196078, 0, 1, 1,
0.558287, -0.9523281, 3.594886, 0.2235294, 0, 1, 1,
0.5605716, 0.1193627, 0.7131599, 0.2313726, 0, 1, 1,
0.5625253, -0.2554576, 2.178444, 0.2352941, 0, 1, 1,
0.5626363, -0.4070736, 0.750012, 0.2431373, 0, 1, 1,
0.5647104, 0.6834989, 0.1145954, 0.2470588, 0, 1, 1,
0.5656434, -1.498466, 2.036286, 0.254902, 0, 1, 1,
0.5695699, 0.8431125, 0.6826115, 0.2588235, 0, 1, 1,
0.5705326, 0.3494395, 0.9795831, 0.2666667, 0, 1, 1,
0.5746164, -0.7663981, 1.35614, 0.2705882, 0, 1, 1,
0.5791484, 0.8318499, -0.4405083, 0.2784314, 0, 1, 1,
0.5807404, 0.4055401, 0.4537463, 0.282353, 0, 1, 1,
0.5824413, 0.6087557, 2.507163, 0.2901961, 0, 1, 1,
0.5846241, -2.655404, 2.981421, 0.2941177, 0, 1, 1,
0.5876697, -0.6312997, 4.277888, 0.3019608, 0, 1, 1,
0.5907611, 0.2252173, 2.295014, 0.3098039, 0, 1, 1,
0.5920123, 0.7737594, 0.9413925, 0.3137255, 0, 1, 1,
0.5933403, 0.7853651, -0.3104543, 0.3215686, 0, 1, 1,
0.5968744, 0.09357838, 2.621001, 0.3254902, 0, 1, 1,
0.6017988, -0.3012101, 1.934507, 0.3333333, 0, 1, 1,
0.6051817, 1.36916, 0.1400294, 0.3372549, 0, 1, 1,
0.6123971, -1.117992, 3.027301, 0.345098, 0, 1, 1,
0.61269, -0.2125261, 1.412808, 0.3490196, 0, 1, 1,
0.6204988, -0.7651662, 1.989613, 0.3568628, 0, 1, 1,
0.621691, 1.608986, -0.7784514, 0.3607843, 0, 1, 1,
0.621913, -0.01866329, 0.888144, 0.3686275, 0, 1, 1,
0.6222526, -0.8604305, 1.992363, 0.372549, 0, 1, 1,
0.6233253, 1.705792, 1.343157, 0.3803922, 0, 1, 1,
0.6312956, 0.791664, 2.072678, 0.3843137, 0, 1, 1,
0.6344958, -0.1183489, 0.6007795, 0.3921569, 0, 1, 1,
0.6383028, 0.3791931, 1.867772, 0.3960784, 0, 1, 1,
0.6409605, -0.5119548, -0.5347079, 0.4039216, 0, 1, 1,
0.6437717, -1.887984, 1.514971, 0.4117647, 0, 1, 1,
0.6445951, -0.1998009, 1.766836, 0.4156863, 0, 1, 1,
0.650992, 0.1966844, 1.577041, 0.4235294, 0, 1, 1,
0.6514848, -0.9985526, 2.930404, 0.427451, 0, 1, 1,
0.6604611, -0.6969401, 1.581156, 0.4352941, 0, 1, 1,
0.6658762, 0.03382453, 1.299803, 0.4392157, 0, 1, 1,
0.6663785, -1.354279, 3.510977, 0.4470588, 0, 1, 1,
0.6694683, -0.09781004, 2.927857, 0.4509804, 0, 1, 1,
0.6763836, 0.08261972, 1.461901, 0.4588235, 0, 1, 1,
0.6778373, 0.02582905, 2.182225, 0.4627451, 0, 1, 1,
0.6783876, -1.813531, 2.228583, 0.4705882, 0, 1, 1,
0.6819834, 1.148919, 1.112641, 0.4745098, 0, 1, 1,
0.6853631, 0.1757275, 1.946514, 0.4823529, 0, 1, 1,
0.6903896, 0.6353226, 2.114225, 0.4862745, 0, 1, 1,
0.6918864, -0.007788952, 1.576681, 0.4941176, 0, 1, 1,
0.6923848, 0.6096956, 1.616004, 0.5019608, 0, 1, 1,
0.6936007, 0.5915443, 0.8663127, 0.5058824, 0, 1, 1,
0.6998895, 0.4339694, 2.138675, 0.5137255, 0, 1, 1,
0.705552, -0.1361489, 2.915623, 0.5176471, 0, 1, 1,
0.7066831, 0.7713408, 0.3722069, 0.5254902, 0, 1, 1,
0.7077208, -1.195044, 1.929608, 0.5294118, 0, 1, 1,
0.7155858, -1.079408, 3.876439, 0.5372549, 0, 1, 1,
0.7163369, 0.5906308, 1.366923, 0.5411765, 0, 1, 1,
0.7164805, 0.1407658, 1.773097, 0.5490196, 0, 1, 1,
0.7189733, -0.4162762, 2.268172, 0.5529412, 0, 1, 1,
0.7234889, -0.6713479, 2.237215, 0.5607843, 0, 1, 1,
0.7309671, 0.594675, 2.176066, 0.5647059, 0, 1, 1,
0.7354022, -1.127506, 1.575224, 0.572549, 0, 1, 1,
0.7356899, 0.1856614, 2.877182, 0.5764706, 0, 1, 1,
0.7396975, 1.05566, -0.3146403, 0.5843138, 0, 1, 1,
0.748283, 0.2546049, -0.8793353, 0.5882353, 0, 1, 1,
0.7491997, -0.8283328, 1.035136, 0.5960785, 0, 1, 1,
0.757543, -0.7579246, 2.440198, 0.6039216, 0, 1, 1,
0.759699, -0.03617916, 3.275731, 0.6078432, 0, 1, 1,
0.7623261, 0.5055669, 1.553256, 0.6156863, 0, 1, 1,
0.7657025, 0.4859451, 0.9623585, 0.6196079, 0, 1, 1,
0.7715983, -0.549023, 3.491161, 0.627451, 0, 1, 1,
0.7758811, -0.1439538, 1.181785, 0.6313726, 0, 1, 1,
0.7814687, -0.854939, 1.654585, 0.6392157, 0, 1, 1,
0.7919396, 0.02058122, 1.81075, 0.6431373, 0, 1, 1,
0.7960618, -0.5311272, 0.5386006, 0.6509804, 0, 1, 1,
0.7973578, -1.761884, 2.118592, 0.654902, 0, 1, 1,
0.8068372, -0.09856037, 2.919419, 0.6627451, 0, 1, 1,
0.8158139, -0.8143609, 4.060457, 0.6666667, 0, 1, 1,
0.8224292, 0.372318, 1.046386, 0.6745098, 0, 1, 1,
0.8235211, -1.370578, 3.29154, 0.6784314, 0, 1, 1,
0.824771, 1.674155, 0.3601491, 0.6862745, 0, 1, 1,
0.8291895, -0.5170963, 2.726319, 0.6901961, 0, 1, 1,
0.8410802, 2.103892, -0.794487, 0.6980392, 0, 1, 1,
0.8483794, -1.031243, 2.500059, 0.7058824, 0, 1, 1,
0.8492685, -0.1711501, 2.824357, 0.7098039, 0, 1, 1,
0.8496051, -1.039345, 2.39239, 0.7176471, 0, 1, 1,
0.8502154, 0.7496174, 0.7340151, 0.7215686, 0, 1, 1,
0.8591658, -1.189409, 2.417343, 0.7294118, 0, 1, 1,
0.8594899, -0.07503854, 0.3221683, 0.7333333, 0, 1, 1,
0.8687326, -0.4464363, 0.8737532, 0.7411765, 0, 1, 1,
0.8692579, 0.1423515, -0.02407528, 0.7450981, 0, 1, 1,
0.8745266, 0.6133472, -0.05020079, 0.7529412, 0, 1, 1,
0.8791601, -2.393236, 2.921785, 0.7568628, 0, 1, 1,
0.8799146, 0.03750949, 1.6411, 0.7647059, 0, 1, 1,
0.8830083, 0.6532255, 2.112385, 0.7686275, 0, 1, 1,
0.8865736, -0.2595713, 2.582674, 0.7764706, 0, 1, 1,
0.8931707, -0.1100584, -0.04237815, 0.7803922, 0, 1, 1,
0.8941139, -1.162633, 3.104739, 0.7882353, 0, 1, 1,
0.8970496, 0.1296297, 0.2588681, 0.7921569, 0, 1, 1,
0.8978704, 0.7257872, 0.976427, 0.8, 0, 1, 1,
0.8984662, -0.2239902, 2.640008, 0.8078431, 0, 1, 1,
0.9041359, -0.1311227, 1.759961, 0.8117647, 0, 1, 1,
0.9061577, -1.999616, 4.028721, 0.8196079, 0, 1, 1,
0.9078695, -1.072013, 2.941704, 0.8235294, 0, 1, 1,
0.9089763, -0.2164976, 1.440399, 0.8313726, 0, 1, 1,
0.9130237, 0.7053437, -0.6446075, 0.8352941, 0, 1, 1,
0.9141183, -0.328189, 2.549867, 0.8431373, 0, 1, 1,
0.9151884, -0.8516764, 3.604744, 0.8470588, 0, 1, 1,
0.9208959, -0.08741796, 2.637848, 0.854902, 0, 1, 1,
0.9245703, -1.707445, 2.743721, 0.8588235, 0, 1, 1,
0.9358036, 1.862325, 0.5168586, 0.8666667, 0, 1, 1,
0.9397671, -0.3551737, 1.377099, 0.8705882, 0, 1, 1,
0.9506061, -0.09183081, 1.483421, 0.8784314, 0, 1, 1,
0.9524536, 0.8714966, 1.998634, 0.8823529, 0, 1, 1,
0.9556698, 0.6125168, -0.08094725, 0.8901961, 0, 1, 1,
0.9584842, 0.3812872, 1.029816, 0.8941177, 0, 1, 1,
0.9639925, 1.284302, -1.115511, 0.9019608, 0, 1, 1,
0.9743584, -0.03419755, 0.4650506, 0.9098039, 0, 1, 1,
0.9840098, -0.6908687, 2.196685, 0.9137255, 0, 1, 1,
0.9842061, -1.41907, 2.750829, 0.9215686, 0, 1, 1,
0.9929221, 1.677998, -0.6159714, 0.9254902, 0, 1, 1,
0.9969376, 0.9812088, 0.07675923, 0.9333333, 0, 1, 1,
1.009642, -0.2739342, 1.437919, 0.9372549, 0, 1, 1,
1.013102, -0.5150254, 1.204265, 0.945098, 0, 1, 1,
1.017992, 0.4707909, 1.987509, 0.9490196, 0, 1, 1,
1.022445, 1.157792, -0.7837268, 0.9568627, 0, 1, 1,
1.024524, 0.3092862, 0.7932997, 0.9607843, 0, 1, 1,
1.024748, 0.4073569, 2.865649, 0.9686275, 0, 1, 1,
1.025965, -2.690622, 3.106304, 0.972549, 0, 1, 1,
1.027338, -0.3372126, 2.36506, 0.9803922, 0, 1, 1,
1.030876, -1.5032, 4.146314, 0.9843137, 0, 1, 1,
1.036369, -0.346813, 2.870803, 0.9921569, 0, 1, 1,
1.036947, 0.2066708, 2.622777, 0.9960784, 0, 1, 1,
1.038437, 0.5461389, -0.0495777, 1, 0, 0.9960784, 1,
1.039758, -0.7386835, 1.692013, 1, 0, 0.9882353, 1,
1.041398, 0.1715513, 0.2075808, 1, 0, 0.9843137, 1,
1.044805, 0.5320828, -0.1927516, 1, 0, 0.9764706, 1,
1.045742, -1.421347, 3.715667, 1, 0, 0.972549, 1,
1.047177, -0.416575, 0.887246, 1, 0, 0.9647059, 1,
1.048008, -1.153669, 1.42714, 1, 0, 0.9607843, 1,
1.053403, -0.4494272, 1.920479, 1, 0, 0.9529412, 1,
1.054593, -1.028463, 2.499599, 1, 0, 0.9490196, 1,
1.056953, -1.725063, 1.838644, 1, 0, 0.9411765, 1,
1.058026, 0.3190708, 0.7423435, 1, 0, 0.9372549, 1,
1.08241, 0.5056646, 2.295865, 1, 0, 0.9294118, 1,
1.087491, -0.3187043, 0.689679, 1, 0, 0.9254902, 1,
1.091125, 0.2730358, 2.925063, 1, 0, 0.9176471, 1,
1.093528, -1.270508, 3.783885, 1, 0, 0.9137255, 1,
1.095246, -1.067629, 1.617991, 1, 0, 0.9058824, 1,
1.096155, 0.4235218, -0.7702891, 1, 0, 0.9019608, 1,
1.097262, 1.643015, 0.6911663, 1, 0, 0.8941177, 1,
1.099021, 1.480306, 0.1600268, 1, 0, 0.8862745, 1,
1.099662, -0.05229648, 3.788583, 1, 0, 0.8823529, 1,
1.099687, -0.3334129, 3.052567, 1, 0, 0.8745098, 1,
1.102998, -0.7056422, 2.821148, 1, 0, 0.8705882, 1,
1.107298, -0.1667656, 0.6208779, 1, 0, 0.8627451, 1,
1.110437, -1.407065, 3.22564, 1, 0, 0.8588235, 1,
1.111369, -0.9851163, 1.438899, 1, 0, 0.8509804, 1,
1.111703, 0.3661282, 1.607619, 1, 0, 0.8470588, 1,
1.117257, 0.04531497, 2.94773, 1, 0, 0.8392157, 1,
1.123831, 0.8197246, -0.2174273, 1, 0, 0.8352941, 1,
1.124289, -0.532923, 0.2218764, 1, 0, 0.827451, 1,
1.125573, -0.04040409, 2.785036, 1, 0, 0.8235294, 1,
1.130686, -2.484051, 4.338074, 1, 0, 0.8156863, 1,
1.131263, -0.1228266, 2.174388, 1, 0, 0.8117647, 1,
1.136363, 0.5332543, 2.230155, 1, 0, 0.8039216, 1,
1.136425, -1.154446, 2.779099, 1, 0, 0.7960784, 1,
1.137084, -0.5823287, 3.346156, 1, 0, 0.7921569, 1,
1.145069, -1.131096, 2.191406, 1, 0, 0.7843137, 1,
1.14905, 0.6861529, 1.640014, 1, 0, 0.7803922, 1,
1.150021, -1.608813, 4.101089, 1, 0, 0.772549, 1,
1.158317, -0.1376104, 2.33359, 1, 0, 0.7686275, 1,
1.164113, 1.039339, 2.1411, 1, 0, 0.7607843, 1,
1.177193, 0.1283053, 0.5607358, 1, 0, 0.7568628, 1,
1.180672, -1.533522, 3.431941, 1, 0, 0.7490196, 1,
1.184737, 1.301944, -1.445498, 1, 0, 0.7450981, 1,
1.188276, 0.7764261, -0.02138039, 1, 0, 0.7372549, 1,
1.189473, 0.3392351, 3.227486, 1, 0, 0.7333333, 1,
1.190149, -0.4871732, 0.8369564, 1, 0, 0.7254902, 1,
1.198318, 0.2080201, 1.378289, 1, 0, 0.7215686, 1,
1.204398, 0.2228068, 2.729474, 1, 0, 0.7137255, 1,
1.213515, -0.07828123, 2.803034, 1, 0, 0.7098039, 1,
1.214022, 0.8410327, 0.2105341, 1, 0, 0.7019608, 1,
1.222614, 0.1106537, 0.5783417, 1, 0, 0.6941177, 1,
1.231532, 0.4103565, 1.054008, 1, 0, 0.6901961, 1,
1.232167, -1.668814, 3.12186, 1, 0, 0.682353, 1,
1.242692, -1.640007, 1.773248, 1, 0, 0.6784314, 1,
1.243694, 0.2587244, 1.357992, 1, 0, 0.6705883, 1,
1.262361, -0.1336548, 0.4718682, 1, 0, 0.6666667, 1,
1.276673, 0.9599851, 2.216804, 1, 0, 0.6588235, 1,
1.277397, -0.3773655, 2.010263, 1, 0, 0.654902, 1,
1.292174, 0.02314678, 1.523378, 1, 0, 0.6470588, 1,
1.294341, -1.197755, 2.888235, 1, 0, 0.6431373, 1,
1.294681, 0.05790703, 1.512248, 1, 0, 0.6352941, 1,
1.295378, 0.1285649, 1.943676, 1, 0, 0.6313726, 1,
1.29567, -0.8338195, 1.516904, 1, 0, 0.6235294, 1,
1.299683, -0.2124265, 1.929588, 1, 0, 0.6196079, 1,
1.300649, 1.072584, 3.070495, 1, 0, 0.6117647, 1,
1.302558, 0.912664, 2.189424, 1, 0, 0.6078432, 1,
1.309888, 0.01725504, 1.906507, 1, 0, 0.6, 1,
1.333504, 0.6207575, 1.984548, 1, 0, 0.5921569, 1,
1.340333, -0.03292755, 0.1606278, 1, 0, 0.5882353, 1,
1.348676, 0.7897334, -0.401864, 1, 0, 0.5803922, 1,
1.354372, 0.1271783, 2.388642, 1, 0, 0.5764706, 1,
1.354909, -0.6799986, 1.824611, 1, 0, 0.5686275, 1,
1.35531, -0.6213062, 1.523736, 1, 0, 0.5647059, 1,
1.35665, 0.849007, 0.9683918, 1, 0, 0.5568628, 1,
1.358461, -0.05660432, 1.500044, 1, 0, 0.5529412, 1,
1.362837, -0.2460211, 1.82607, 1, 0, 0.5450981, 1,
1.362856, 0.39572, 1.758817, 1, 0, 0.5411765, 1,
1.366696, -2.183047, 3.935907, 1, 0, 0.5333334, 1,
1.374948, 0.2601911, 1.501745, 1, 0, 0.5294118, 1,
1.37989, -0.757162, -0.07098459, 1, 0, 0.5215687, 1,
1.380975, 0.5671331, 1.10616, 1, 0, 0.5176471, 1,
1.381309, -0.4062569, 0.3062676, 1, 0, 0.509804, 1,
1.388305, -0.2804542, 2.135525, 1, 0, 0.5058824, 1,
1.392374, -0.2882221, 1.499882, 1, 0, 0.4980392, 1,
1.414834, 0.3581637, 1.095604, 1, 0, 0.4901961, 1,
1.416893, 1.142043, -0.08101726, 1, 0, 0.4862745, 1,
1.422819, 0.2105847, 3.428918, 1, 0, 0.4784314, 1,
1.426751, 0.07715577, 1.913289, 1, 0, 0.4745098, 1,
1.432964, 1.562457, 0.669515, 1, 0, 0.4666667, 1,
1.472425, -1.340577, 3.075589, 1, 0, 0.4627451, 1,
1.498172, 0.1902213, 1.817634, 1, 0, 0.454902, 1,
1.502211, 2.011694, -0.01571642, 1, 0, 0.4509804, 1,
1.507849, 0.1198775, 2.721915, 1, 0, 0.4431373, 1,
1.514455, 1.853523, 3.161544, 1, 0, 0.4392157, 1,
1.527465, 0.1426509, 1.289336, 1, 0, 0.4313726, 1,
1.527866, -0.6849756, 2.172136, 1, 0, 0.427451, 1,
1.531334, -1.959174, 2.679969, 1, 0, 0.4196078, 1,
1.535394, 0.03883107, 3.899407, 1, 0, 0.4156863, 1,
1.542265, 1.205221, 0.2440631, 1, 0, 0.4078431, 1,
1.549166, 1.419309, -0.08175698, 1, 0, 0.4039216, 1,
1.552363, 0.6617146, 2.732986, 1, 0, 0.3960784, 1,
1.555823, 0.07776748, 1.358075, 1, 0, 0.3882353, 1,
1.557006, 0.04661504, 2.151775, 1, 0, 0.3843137, 1,
1.570266, 0.5738264, 0.1607526, 1, 0, 0.3764706, 1,
1.575509, 1.33108, 1.71441, 1, 0, 0.372549, 1,
1.578386, 0.6595294, 0.3610774, 1, 0, 0.3647059, 1,
1.62954, -2.40925, 3.378814, 1, 0, 0.3607843, 1,
1.643212, 0.3836057, 1.612708, 1, 0, 0.3529412, 1,
1.655077, 0.4506557, 1.764525, 1, 0, 0.3490196, 1,
1.681502, 0.01623505, 1.99025, 1, 0, 0.3411765, 1,
1.697101, 1.84224, -0.124044, 1, 0, 0.3372549, 1,
1.702462, 0.1814767, 0.6403231, 1, 0, 0.3294118, 1,
1.712612, 0.9770793, 1.125663, 1, 0, 0.3254902, 1,
1.712844, 0.7412773, 0.861256, 1, 0, 0.3176471, 1,
1.723565, 0.2695057, 1.815055, 1, 0, 0.3137255, 1,
1.735624, 0.9928715, 2.531469, 1, 0, 0.3058824, 1,
1.801867, -0.2849921, 0.4297326, 1, 0, 0.2980392, 1,
1.805551, 1.37618, 1.087944, 1, 0, 0.2941177, 1,
1.813368, 0.8384085, 2.102942, 1, 0, 0.2862745, 1,
1.813764, 0.88842, 1.458697, 1, 0, 0.282353, 1,
1.815692, 0.5806151, 0.4910583, 1, 0, 0.2745098, 1,
1.825367, 0.1737528, 2.208951, 1, 0, 0.2705882, 1,
1.860859, 0.5696042, 1.783008, 1, 0, 0.2627451, 1,
1.874075, 0.1307143, -0.2865325, 1, 0, 0.2588235, 1,
1.877616, 0.02547311, 1.137615, 1, 0, 0.2509804, 1,
1.892149, 1.05795, 1.530316, 1, 0, 0.2470588, 1,
1.90389, -0.2344632, -0.003336158, 1, 0, 0.2392157, 1,
1.916299, 0.09709549, 3.061809, 1, 0, 0.2352941, 1,
1.918777, -0.4826922, 1.894291, 1, 0, 0.227451, 1,
1.922152, 1.656011, 0.5796748, 1, 0, 0.2235294, 1,
1.943898, -0.5012597, 1.749338, 1, 0, 0.2156863, 1,
1.944196, 0.08408727, 2.360384, 1, 0, 0.2117647, 1,
1.945115, -1.967654, 2.599719, 1, 0, 0.2039216, 1,
1.957068, -0.3832917, 1.239511, 1, 0, 0.1960784, 1,
1.976583, 0.6694708, 0.9346954, 1, 0, 0.1921569, 1,
1.978887, -0.0994751, 3.055775, 1, 0, 0.1843137, 1,
1.999467, 0.4222868, 1.930824, 1, 0, 0.1803922, 1,
2.000507, 0.9811097, -0.6404055, 1, 0, 0.172549, 1,
2.003956, 0.6064539, 1.182618, 1, 0, 0.1686275, 1,
2.021318, 0.5567105, 1.592064, 1, 0, 0.1607843, 1,
2.021457, 1.761647, 1.180782, 1, 0, 0.1568628, 1,
2.055264, -0.759308, 2.007629, 1, 0, 0.1490196, 1,
2.097055, 1.60177, 1.112725, 1, 0, 0.145098, 1,
2.108038, 0.9501374, 0.5841516, 1, 0, 0.1372549, 1,
2.131589, 0.06800322, -1.037625, 1, 0, 0.1333333, 1,
2.165892, 1.357508, 0.02980706, 1, 0, 0.1254902, 1,
2.171645, -0.5968282, 2.457883, 1, 0, 0.1215686, 1,
2.207803, 0.9846395, 0.2140265, 1, 0, 0.1137255, 1,
2.224477, -0.1123401, 0.4784129, 1, 0, 0.1098039, 1,
2.285868, -0.2055575, 1.728563, 1, 0, 0.1019608, 1,
2.313195, 1.812, 0.9090402, 1, 0, 0.09411765, 1,
2.354033, -0.1575581, 0.6371436, 1, 0, 0.09019608, 1,
2.375125, -0.648594, 1.74921, 1, 0, 0.08235294, 1,
2.387845, 0.651699, 2.450732, 1, 0, 0.07843138, 1,
2.471434, 0.6302448, 0.4662798, 1, 0, 0.07058824, 1,
2.472013, -0.5187258, 0.5468405, 1, 0, 0.06666667, 1,
2.516393, -2.131721, 1.213989, 1, 0, 0.05882353, 1,
2.516489, -0.713773, 0.1616383, 1, 0, 0.05490196, 1,
2.564886, 1.399717, 2.581061, 1, 0, 0.04705882, 1,
2.602332, -0.223142, 0.9929489, 1, 0, 0.04313726, 1,
2.662894, -0.3375617, 3.195584, 1, 0, 0.03529412, 1,
2.735808, 0.7469451, 0.8070383, 1, 0, 0.03137255, 1,
2.812383, 0.4969302, 1.201431, 1, 0, 0.02352941, 1,
2.971974, 0.6888186, 2.299902, 1, 0, 0.01960784, 1,
3.356605, -1.046275, 1.195328, 1, 0, 0.01176471, 1,
3.880983, 1.208407, -0.3500505, 1, 0, 0.007843138, 1
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
0.5043509, -3.841238, -7.298674, 0, -0.5, 0.5, 0.5,
0.5043509, -3.841238, -7.298674, 1, -0.5, 0.5, 0.5,
0.5043509, -3.841238, -7.298674, 1, 1.5, 0.5, 0.5,
0.5043509, -3.841238, -7.298674, 0, 1.5, 0.5, 0.5
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
-4.016959, 0.03338301, -7.298674, 0, -0.5, 0.5, 0.5,
-4.016959, 0.03338301, -7.298674, 1, -0.5, 0.5, 0.5,
-4.016959, 0.03338301, -7.298674, 1, 1.5, 0.5, 0.5,
-4.016959, 0.03338301, -7.298674, 0, 1.5, 0.5, 0.5
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
-4.016959, -3.841238, -0.003510237, 0, -0.5, 0.5, 0.5,
-4.016959, -3.841238, -0.003510237, 1, -0.5, 0.5, 0.5,
-4.016959, -3.841238, -0.003510237, 1, 1.5, 0.5, 0.5,
-4.016959, -3.841238, -0.003510237, 0, 1.5, 0.5, 0.5
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
-2, -2.947095, -5.615174,
3, -2.947095, -5.615174,
-2, -2.947095, -5.615174,
-2, -3.096119, -5.895758,
-1, -2.947095, -5.615174,
-1, -3.096119, -5.895758,
0, -2.947095, -5.615174,
0, -3.096119, -5.895758,
1, -2.947095, -5.615174,
1, -3.096119, -5.895758,
2, -2.947095, -5.615174,
2, -3.096119, -5.895758,
3, -2.947095, -5.615174,
3, -3.096119, -5.895758
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
-2, -3.394167, -6.456924, 0, -0.5, 0.5, 0.5,
-2, -3.394167, -6.456924, 1, -0.5, 0.5, 0.5,
-2, -3.394167, -6.456924, 1, 1.5, 0.5, 0.5,
-2, -3.394167, -6.456924, 0, 1.5, 0.5, 0.5,
-1, -3.394167, -6.456924, 0, -0.5, 0.5, 0.5,
-1, -3.394167, -6.456924, 1, -0.5, 0.5, 0.5,
-1, -3.394167, -6.456924, 1, 1.5, 0.5, 0.5,
-1, -3.394167, -6.456924, 0, 1.5, 0.5, 0.5,
0, -3.394167, -6.456924, 0, -0.5, 0.5, 0.5,
0, -3.394167, -6.456924, 1, -0.5, 0.5, 0.5,
0, -3.394167, -6.456924, 1, 1.5, 0.5, 0.5,
0, -3.394167, -6.456924, 0, 1.5, 0.5, 0.5,
1, -3.394167, -6.456924, 0, -0.5, 0.5, 0.5,
1, -3.394167, -6.456924, 1, -0.5, 0.5, 0.5,
1, -3.394167, -6.456924, 1, 1.5, 0.5, 0.5,
1, -3.394167, -6.456924, 0, 1.5, 0.5, 0.5,
2, -3.394167, -6.456924, 0, -0.5, 0.5, 0.5,
2, -3.394167, -6.456924, 1, -0.5, 0.5, 0.5,
2, -3.394167, -6.456924, 1, 1.5, 0.5, 0.5,
2, -3.394167, -6.456924, 0, 1.5, 0.5, 0.5,
3, -3.394167, -6.456924, 0, -0.5, 0.5, 0.5,
3, -3.394167, -6.456924, 1, -0.5, 0.5, 0.5,
3, -3.394167, -6.456924, 1, 1.5, 0.5, 0.5,
3, -3.394167, -6.456924, 0, 1.5, 0.5, 0.5
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
-2.97358, -2, -5.615174,
-2.97358, 2, -5.615174,
-2.97358, -2, -5.615174,
-3.147476, -2, -5.895758,
-2.97358, -1, -5.615174,
-3.147476, -1, -5.895758,
-2.97358, 0, -5.615174,
-3.147476, 0, -5.895758,
-2.97358, 1, -5.615174,
-3.147476, 1, -5.895758,
-2.97358, 2, -5.615174,
-3.147476, 2, -5.895758
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
-3.495269, -2, -6.456924, 0, -0.5, 0.5, 0.5,
-3.495269, -2, -6.456924, 1, -0.5, 0.5, 0.5,
-3.495269, -2, -6.456924, 1, 1.5, 0.5, 0.5,
-3.495269, -2, -6.456924, 0, 1.5, 0.5, 0.5,
-3.495269, -1, -6.456924, 0, -0.5, 0.5, 0.5,
-3.495269, -1, -6.456924, 1, -0.5, 0.5, 0.5,
-3.495269, -1, -6.456924, 1, 1.5, 0.5, 0.5,
-3.495269, -1, -6.456924, 0, 1.5, 0.5, 0.5,
-3.495269, 0, -6.456924, 0, -0.5, 0.5, 0.5,
-3.495269, 0, -6.456924, 1, -0.5, 0.5, 0.5,
-3.495269, 0, -6.456924, 1, 1.5, 0.5, 0.5,
-3.495269, 0, -6.456924, 0, 1.5, 0.5, 0.5,
-3.495269, 1, -6.456924, 0, -0.5, 0.5, 0.5,
-3.495269, 1, -6.456924, 1, -0.5, 0.5, 0.5,
-3.495269, 1, -6.456924, 1, 1.5, 0.5, 0.5,
-3.495269, 1, -6.456924, 0, 1.5, 0.5, 0.5,
-3.495269, 2, -6.456924, 0, -0.5, 0.5, 0.5,
-3.495269, 2, -6.456924, 1, -0.5, 0.5, 0.5,
-3.495269, 2, -6.456924, 1, 1.5, 0.5, 0.5,
-3.495269, 2, -6.456924, 0, 1.5, 0.5, 0.5
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
-2.97358, -2.947095, -4,
-2.97358, -2.947095, 4,
-2.97358, -2.947095, -4,
-3.147476, -3.096119, -4,
-2.97358, -2.947095, -2,
-3.147476, -3.096119, -2,
-2.97358, -2.947095, 0,
-3.147476, -3.096119, 0,
-2.97358, -2.947095, 2,
-3.147476, -3.096119, 2,
-2.97358, -2.947095, 4,
-3.147476, -3.096119, 4
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
-3.495269, -3.394167, -4, 0, -0.5, 0.5, 0.5,
-3.495269, -3.394167, -4, 1, -0.5, 0.5, 0.5,
-3.495269, -3.394167, -4, 1, 1.5, 0.5, 0.5,
-3.495269, -3.394167, -4, 0, 1.5, 0.5, 0.5,
-3.495269, -3.394167, -2, 0, -0.5, 0.5, 0.5,
-3.495269, -3.394167, -2, 1, -0.5, 0.5, 0.5,
-3.495269, -3.394167, -2, 1, 1.5, 0.5, 0.5,
-3.495269, -3.394167, -2, 0, 1.5, 0.5, 0.5,
-3.495269, -3.394167, 0, 0, -0.5, 0.5, 0.5,
-3.495269, -3.394167, 0, 1, -0.5, 0.5, 0.5,
-3.495269, -3.394167, 0, 1, 1.5, 0.5, 0.5,
-3.495269, -3.394167, 0, 0, 1.5, 0.5, 0.5,
-3.495269, -3.394167, 2, 0, -0.5, 0.5, 0.5,
-3.495269, -3.394167, 2, 1, -0.5, 0.5, 0.5,
-3.495269, -3.394167, 2, 1, 1.5, 0.5, 0.5,
-3.495269, -3.394167, 2, 0, 1.5, 0.5, 0.5,
-3.495269, -3.394167, 4, 0, -0.5, 0.5, 0.5,
-3.495269, -3.394167, 4, 1, -0.5, 0.5, 0.5,
-3.495269, -3.394167, 4, 1, 1.5, 0.5, 0.5,
-3.495269, -3.394167, 4, 0, 1.5, 0.5, 0.5
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
-2.97358, -2.947095, -5.615174,
-2.97358, 3.013861, -5.615174,
-2.97358, -2.947095, 5.608154,
-2.97358, 3.013861, 5.608154,
-2.97358, -2.947095, -5.615174,
-2.97358, -2.947095, 5.608154,
-2.97358, 3.013861, -5.615174,
-2.97358, 3.013861, 5.608154,
-2.97358, -2.947095, -5.615174,
3.982282, -2.947095, -5.615174,
-2.97358, -2.947095, 5.608154,
3.982282, -2.947095, 5.608154,
-2.97358, 3.013861, -5.615174,
3.982282, 3.013861, -5.615174,
-2.97358, 3.013861, 5.608154,
3.982282, 3.013861, 5.608154,
3.982282, -2.947095, -5.615174,
3.982282, 3.013861, -5.615174,
3.982282, -2.947095, 5.608154,
3.982282, 3.013861, 5.608154,
3.982282, -2.947095, -5.615174,
3.982282, -2.947095, 5.608154,
3.982282, 3.013861, -5.615174,
3.982282, 3.013861, 5.608154
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
var radius = 7.735904;
var distance = 34.41791;
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
mvMatrix.translate( -0.5043509, -0.03338301, 0.003510237 );
mvMatrix.scale( 1.20247, 1.403166, 0.7452523 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.41791);
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
fluxofenim<-read.table("fluxofenim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluxofenim$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluxofenim' not found
```

```r
y<-fluxofenim$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluxofenim' not found
```

```r
z<-fluxofenim$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluxofenim' not found
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
-2.872281, 1.796558, 0.214123, 0, 0, 1, 1, 1,
-2.824944, -0.07007769, -1.974108, 1, 0, 0, 1, 1,
-2.480496, 0.8554759, -1.752499, 1, 0, 0, 1, 1,
-2.450752, -0.3632208, -2.438645, 1, 0, 0, 1, 1,
-2.450612, 0.1076926, -1.828838, 1, 0, 0, 1, 1,
-2.440889, -1.074371, -3.490453, 1, 0, 0, 1, 1,
-2.414742, 0.6444689, -1.276355, 0, 0, 0, 1, 1,
-2.332666, 0.4275726, -0.1708072, 0, 0, 0, 1, 1,
-2.331368, -1.101383, -0.5956446, 0, 0, 0, 1, 1,
-2.163329, 0.6776888, -2.423697, 0, 0, 0, 1, 1,
-2.126467, -1.71795, -4.494207, 0, 0, 0, 1, 1,
-2.093204, 0.8658926, -1.007901, 0, 0, 0, 1, 1,
-2.06669, -1.417165, -1.506633, 0, 0, 0, 1, 1,
-2.048516, -0.274297, -0.7918566, 1, 1, 1, 1, 1,
-2.00132, -1.176415, -3.557442, 1, 1, 1, 1, 1,
-1.975386, -0.2567085, -2.185256, 1, 1, 1, 1, 1,
-1.970669, -0.723632, -1.201264, 1, 1, 1, 1, 1,
-1.970361, -0.1214502, -0.4031033, 1, 1, 1, 1, 1,
-1.967372, -0.2080358, -1.791781, 1, 1, 1, 1, 1,
-1.961365, -0.479691, -1.941385, 1, 1, 1, 1, 1,
-1.961263, 1.140173, -2.167357, 1, 1, 1, 1, 1,
-1.955549, -1.246957, -3.071199, 1, 1, 1, 1, 1,
-1.951068, 0.6361722, -2.082066, 1, 1, 1, 1, 1,
-1.944109, -0.4246389, -0.5160863, 1, 1, 1, 1, 1,
-1.93332, -0.2417904, -2.513292, 1, 1, 1, 1, 1,
-1.883098, 0.5927259, -1.844551, 1, 1, 1, 1, 1,
-1.874861, 1.36113, -1.388487, 1, 1, 1, 1, 1,
-1.872245, -0.9054886, -2.297732, 1, 1, 1, 1, 1,
-1.846253, -1.145736, -0.6548603, 0, 0, 1, 1, 1,
-1.842795, 0.2442119, -2.130521, 1, 0, 0, 1, 1,
-1.819976, -0.4556721, -1.967005, 1, 0, 0, 1, 1,
-1.819129, 0.1303468, -1.164953, 1, 0, 0, 1, 1,
-1.810276, -0.4202316, -1.955322, 1, 0, 0, 1, 1,
-1.797558, -1.11403, -2.3377, 1, 0, 0, 1, 1,
-1.792083, 0.8724946, -0.1135477, 0, 0, 0, 1, 1,
-1.787764, 0.199312, -1.552746, 0, 0, 0, 1, 1,
-1.786176, 0.6538393, -2.222593, 0, 0, 0, 1, 1,
-1.763871, 0.05040505, -1.155851, 0, 0, 0, 1, 1,
-1.754125, 1.78456, -1.941019, 0, 0, 0, 1, 1,
-1.750958, -0.239188, -1.751331, 0, 0, 0, 1, 1,
-1.721211, -0.6253908, -2.50876, 0, 0, 0, 1, 1,
-1.718992, 1.553383, -0.642836, 1, 1, 1, 1, 1,
-1.714197, 0.7713092, -0.763391, 1, 1, 1, 1, 1,
-1.713729, 0.9596408, -1.533771, 1, 1, 1, 1, 1,
-1.700665, 0.2164729, -2.001508, 1, 1, 1, 1, 1,
-1.697004, -0.5740742, -3.442219, 1, 1, 1, 1, 1,
-1.686144, 0.5169761, -0.9421399, 1, 1, 1, 1, 1,
-1.685839, 0.6089346, -0.7910532, 1, 1, 1, 1, 1,
-1.68398, -0.7824689, -3.074457, 1, 1, 1, 1, 1,
-1.676872, 0.858735, -0.4994077, 1, 1, 1, 1, 1,
-1.665776, 0.4279691, -3.6241, 1, 1, 1, 1, 1,
-1.661005, 1.431378, -0.07941124, 1, 1, 1, 1, 1,
-1.646868, -1.347953, -2.740649, 1, 1, 1, 1, 1,
-1.643684, -1.95772, -2.636642, 1, 1, 1, 1, 1,
-1.621195, -0.4550492, -1.399812, 1, 1, 1, 1, 1,
-1.609417, -0.548443, -1.908562, 1, 1, 1, 1, 1,
-1.603969, 0.7341782, -1.424663, 0, 0, 1, 1, 1,
-1.573572, -1.30259, -1.74609, 1, 0, 0, 1, 1,
-1.570047, -1.099126, -2.415105, 1, 0, 0, 1, 1,
-1.56197, 0.1091584, -0.6023014, 1, 0, 0, 1, 1,
-1.551504, -1.916825, -2.057768, 1, 0, 0, 1, 1,
-1.527205, -1.44467, -3.154865, 1, 0, 0, 1, 1,
-1.517552, 0.08370516, -2.353049, 0, 0, 0, 1, 1,
-1.502955, 0.7144215, -1.469076, 0, 0, 0, 1, 1,
-1.498279, 1.40592, -0.8980209, 0, 0, 0, 1, 1,
-1.486409, 0.112876, -1.243246, 0, 0, 0, 1, 1,
-1.477137, -1.618772, -2.751243, 0, 0, 0, 1, 1,
-1.470319, -1.765521, -2.431598, 0, 0, 0, 1, 1,
-1.461321, -0.5621507, -0.5080397, 0, 0, 0, 1, 1,
-1.443951, 0.7095972, -1.088446, 1, 1, 1, 1, 1,
-1.439665, 1.593977, -1.279123, 1, 1, 1, 1, 1,
-1.411829, -1.657205, -2.367001, 1, 1, 1, 1, 1,
-1.410904, -0.9444852, -1.904466, 1, 1, 1, 1, 1,
-1.389399, 1.473424, -1.022336, 1, 1, 1, 1, 1,
-1.383208, -1.811304, -0.9994956, 1, 1, 1, 1, 1,
-1.379945, -0.2893334, -3.514522, 1, 1, 1, 1, 1,
-1.376005, 1.508377, -0.835533, 1, 1, 1, 1, 1,
-1.362089, 0.5048763, -1.159637, 1, 1, 1, 1, 1,
-1.361896, 0.4281607, -2.274019, 1, 1, 1, 1, 1,
-1.359908, 1.174146, -1.116433, 1, 1, 1, 1, 1,
-1.348933, 0.1683529, -0.5779239, 1, 1, 1, 1, 1,
-1.343443, 0.5112844, -1.324773, 1, 1, 1, 1, 1,
-1.326038, -0.3810467, -2.467482, 1, 1, 1, 1, 1,
-1.32389, 1.924274, -1.046423, 1, 1, 1, 1, 1,
-1.323756, 0.03108454, -1.657934, 0, 0, 1, 1, 1,
-1.314435, 0.9762821, 0.2647013, 1, 0, 0, 1, 1,
-1.313989, 0.9379704, 0.01904964, 1, 0, 0, 1, 1,
-1.313557, -0.3601279, -0.325032, 1, 0, 0, 1, 1,
-1.310877, -0.8466102, -2.338049, 1, 0, 0, 1, 1,
-1.309, -1.751799, -2.608847, 1, 0, 0, 1, 1,
-1.306334, -1.163222, -3.091633, 0, 0, 0, 1, 1,
-1.306155, -0.7241884, -1.124046, 0, 0, 0, 1, 1,
-1.296457, -0.07094521, -0.6553709, 0, 0, 0, 1, 1,
-1.293827, 1.705806, -1.977731, 0, 0, 0, 1, 1,
-1.283629, 1.415264, 0.04411415, 0, 0, 0, 1, 1,
-1.272901, 1.299353, -1.163121, 0, 0, 0, 1, 1,
-1.269291, 1.908765, 0.5012628, 0, 0, 0, 1, 1,
-1.263696, 0.2743731, -2.28367, 1, 1, 1, 1, 1,
-1.258429, -0.4031654, -1.806647, 1, 1, 1, 1, 1,
-1.254751, 0.03508724, -1.218837, 1, 1, 1, 1, 1,
-1.253018, -0.9545935, -1.904836, 1, 1, 1, 1, 1,
-1.252398, 0.9631762, -0.4127579, 1, 1, 1, 1, 1,
-1.251523, -1.258557, -1.860451, 1, 1, 1, 1, 1,
-1.24572, -1.366918, -2.885655, 1, 1, 1, 1, 1,
-1.236747, 0.5206742, -0.9992057, 1, 1, 1, 1, 1,
-1.224987, -0.4075252, -2.628654, 1, 1, 1, 1, 1,
-1.224791, 0.1049882, -2.452371, 1, 1, 1, 1, 1,
-1.210133, 0.7720816, -0.1121835, 1, 1, 1, 1, 1,
-1.207857, -0.8145977, -1.750925, 1, 1, 1, 1, 1,
-1.207643, -0.3722773, -2.623431, 1, 1, 1, 1, 1,
-1.206533, -0.1704462, -0.157046, 1, 1, 1, 1, 1,
-1.202562, 0.3258556, -2.631944, 1, 1, 1, 1, 1,
-1.190822, 2.319098, -0.7584036, 0, 0, 1, 1, 1,
-1.167304, -1.671137, -0.9566295, 1, 0, 0, 1, 1,
-1.163259, -1.158711, -1.166214, 1, 0, 0, 1, 1,
-1.16308, 1.769643, -1.176224, 1, 0, 0, 1, 1,
-1.151701, 0.01269077, -1.882591, 1, 0, 0, 1, 1,
-1.149981, -1.360866, -2.030194, 1, 0, 0, 1, 1,
-1.148609, -0.8652998, -2.909206, 0, 0, 0, 1, 1,
-1.146718, -0.687129, -2.413572, 0, 0, 0, 1, 1,
-1.146137, 1.047843, -1.954644, 0, 0, 0, 1, 1,
-1.146105, 0.1117933, -0.9436561, 0, 0, 0, 1, 1,
-1.144968, -1.394703, -2.686805, 0, 0, 0, 1, 1,
-1.140929, -0.04127397, -0.8130735, 0, 0, 0, 1, 1,
-1.138176, -0.1975397, -0.6397858, 0, 0, 0, 1, 1,
-1.136825, 0.1175165, 0.02883901, 1, 1, 1, 1, 1,
-1.136706, 0.7121111, -1.004198, 1, 1, 1, 1, 1,
-1.134907, -0.4284835, -1.368443, 1, 1, 1, 1, 1,
-1.110908, 0.3271096, -1.105394, 1, 1, 1, 1, 1,
-1.105807, -0.1049009, -1.084638, 1, 1, 1, 1, 1,
-1.09563, 0.5816306, -0.4934161, 1, 1, 1, 1, 1,
-1.090993, 1.615996, -0.5973563, 1, 1, 1, 1, 1,
-1.086163, 1.126677, -1.92913, 1, 1, 1, 1, 1,
-1.085793, -0.7756543, -2.543096, 1, 1, 1, 1, 1,
-1.081877, -0.09690542, -2.304765, 1, 1, 1, 1, 1,
-1.073839, 0.720408, -0.72066, 1, 1, 1, 1, 1,
-1.072616, 0.2700028, -0.07944395, 1, 1, 1, 1, 1,
-1.066746, -0.2626088, -2.285077, 1, 1, 1, 1, 1,
-1.065562, -0.3907652, -2.901637, 1, 1, 1, 1, 1,
-1.045992, 0.1849794, -1.506416, 1, 1, 1, 1, 1,
-1.043129, -0.2097353, -0.9785255, 0, 0, 1, 1, 1,
-1.042538, 1.946359, -0.4707664, 1, 0, 0, 1, 1,
-1.042345, 0.2670708, -1.298125, 1, 0, 0, 1, 1,
-1.042172, -1.113876, -3.190754, 1, 0, 0, 1, 1,
-1.037952, 0.6544883, -1.417426, 1, 0, 0, 1, 1,
-1.033756, -1.876051, -1.622819, 1, 0, 0, 1, 1,
-1.029625, -1.767387, -2.382012, 0, 0, 0, 1, 1,
-1.025521, -0.8184781, -0.446426, 0, 0, 0, 1, 1,
-1.022191, 0.1173259, -1.842961, 0, 0, 0, 1, 1,
-1.021789, -1.123158, -1.019668, 0, 0, 0, 1, 1,
-1.020875, 1.814365, -0.5092029, 0, 0, 0, 1, 1,
-1.019506, 0.1749755, -1.317183, 0, 0, 0, 1, 1,
-1.015639, -1.859546, -2.886115, 0, 0, 0, 1, 1,
-1.01431, 0.1405187, -1.366322, 1, 1, 1, 1, 1,
-1.007394, 0.2759986, -1.114926, 1, 1, 1, 1, 1,
-1.005345, 1.505373, -0.9208233, 1, 1, 1, 1, 1,
-1.002033, -2.726878, -3.291713, 1, 1, 1, 1, 1,
-1.001328, -1.121803, -3.260289, 1, 1, 1, 1, 1,
-0.9993419, 0.3582231, -2.070497, 1, 1, 1, 1, 1,
-0.9939572, 0.1366629, -1.9571, 1, 1, 1, 1, 1,
-0.9925674, -1.208815, -3.03727, 1, 1, 1, 1, 1,
-0.9906424, 0.2452718, -1.403641, 1, 1, 1, 1, 1,
-0.9844404, 0.9924451, -2.189647, 1, 1, 1, 1, 1,
-0.9816459, -0.1430676, -0.01619386, 1, 1, 1, 1, 1,
-0.980701, 0.2538475, -1.014658, 1, 1, 1, 1, 1,
-0.9805775, -0.08759731, -0.8231838, 1, 1, 1, 1, 1,
-0.9678572, 1.02927, 0.7385873, 1, 1, 1, 1, 1,
-0.9656118, 1.12488, 0.8587498, 1, 1, 1, 1, 1,
-0.9641472, 0.8631848, -1.365276, 0, 0, 1, 1, 1,
-0.959264, -0.5584496, -1.534223, 1, 0, 0, 1, 1,
-0.9514996, 0.198613, -1.141607, 1, 0, 0, 1, 1,
-0.9476034, 0.6917232, -2.614767, 1, 0, 0, 1, 1,
-0.9472473, -0.5156131, -2.465878, 1, 0, 0, 1, 1,
-0.9471216, -0.9574841, -3.114236, 1, 0, 0, 1, 1,
-0.9423673, -0.4968241, -3.930185, 0, 0, 0, 1, 1,
-0.9330035, -0.7767456, -2.337342, 0, 0, 0, 1, 1,
-0.924398, 0.6845292, -1.778182, 0, 0, 0, 1, 1,
-0.9191432, 0.07702561, -0.7505992, 0, 0, 0, 1, 1,
-0.9188675, 2.476455, -1.648984, 0, 0, 0, 1, 1,
-0.9148522, 0.321314, 0.2756331, 0, 0, 0, 1, 1,
-0.9126344, 0.8421255, -1.898739, 0, 0, 0, 1, 1,
-0.9088724, -0.4597383, -1.696967, 1, 1, 1, 1, 1,
-0.9086339, 0.6921235, -0.8295034, 1, 1, 1, 1, 1,
-0.9077952, 0.4740809, -2.42903, 1, 1, 1, 1, 1,
-0.9066812, -0.5083948, -3.557308, 1, 1, 1, 1, 1,
-0.9014532, -1.001502, -1.537881, 1, 1, 1, 1, 1,
-0.8979753, 0.5772308, -0.1592749, 1, 1, 1, 1, 1,
-0.8968566, -0.2378649, -3.335112, 1, 1, 1, 1, 1,
-0.8952523, -0.9885284, -1.510588, 1, 1, 1, 1, 1,
-0.8922279, 0.6657261, -1.950896, 1, 1, 1, 1, 1,
-0.887626, -0.3127593, -2.126937, 1, 1, 1, 1, 1,
-0.8851892, 0.5559388, -0.8589771, 1, 1, 1, 1, 1,
-0.8814885, 2.375035, -0.7730306, 1, 1, 1, 1, 1,
-0.8765088, -1.399922, -1.490704, 1, 1, 1, 1, 1,
-0.8741441, -1.048269, -1.619146, 1, 1, 1, 1, 1,
-0.8705862, 1.550252, 0.6324531, 1, 1, 1, 1, 1,
-0.8666644, 0.3669701, -1.960827, 0, 0, 1, 1, 1,
-0.8632582, -0.9509391, -3.226825, 1, 0, 0, 1, 1,
-0.8610247, 0.8108895, -1.970194, 1, 0, 0, 1, 1,
-0.8518627, -0.05046189, -1.06792, 1, 0, 0, 1, 1,
-0.8500037, 0.4539351, 1.790256, 1, 0, 0, 1, 1,
-0.8426908, -1.09651, -0.7280346, 1, 0, 0, 1, 1,
-0.8410744, 1.162673, 0.4100688, 0, 0, 0, 1, 1,
-0.8379288, -0.5469677, -2.868932, 0, 0, 0, 1, 1,
-0.8378649, 0.7655583, -0.6267083, 0, 0, 0, 1, 1,
-0.837148, 0.1356457, -2.377754, 0, 0, 0, 1, 1,
-0.8352082, 0.1697288, -1.144933, 0, 0, 0, 1, 1,
-0.8325149, -1.474126, -2.108971, 0, 0, 0, 1, 1,
-0.8271565, -1.328444, -1.99368, 0, 0, 0, 1, 1,
-0.8240452, -1.473768, -0.3188347, 1, 1, 1, 1, 1,
-0.8229477, 0.4737488, -0.816703, 1, 1, 1, 1, 1,
-0.8227491, 1.37728, 0.004460067, 1, 1, 1, 1, 1,
-0.8224421, 1.115255, -2.404865, 1, 1, 1, 1, 1,
-0.8215708, 0.9956296, -0.480327, 1, 1, 1, 1, 1,
-0.8173006, 0.6834152, -1.324077, 1, 1, 1, 1, 1,
-0.8149784, 0.5147437, -1.280933, 1, 1, 1, 1, 1,
-0.8090901, -0.2445346, -0.4675192, 1, 1, 1, 1, 1,
-0.8080382, -1.545045, -2.659239, 1, 1, 1, 1, 1,
-0.806236, 0.5596365, 0.159319, 1, 1, 1, 1, 1,
-0.8016966, 1.078124, -0.5278473, 1, 1, 1, 1, 1,
-0.7997807, 0.6022363, -1.483462, 1, 1, 1, 1, 1,
-0.7954862, -0.2922505, -2.625882, 1, 1, 1, 1, 1,
-0.7950413, -0.6013216, -1.150006, 1, 1, 1, 1, 1,
-0.7804537, -0.08137724, -2.412148, 1, 1, 1, 1, 1,
-0.7788831, -0.3839376, -0.8275953, 0, 0, 1, 1, 1,
-0.7780721, -2.029893, -0.6246781, 1, 0, 0, 1, 1,
-0.7714082, 0.4611721, -1.431905, 1, 0, 0, 1, 1,
-0.7671702, 0.4461055, 0.1573183, 1, 0, 0, 1, 1,
-0.7661093, -0.4233247, -0.810804, 1, 0, 0, 1, 1,
-0.7626054, -0.3648682, -1.424266, 1, 0, 0, 1, 1,
-0.7619863, -0.2874614, -1.438439, 0, 0, 0, 1, 1,
-0.7547413, 0.3114626, -1.77231, 0, 0, 0, 1, 1,
-0.7527095, -1.831453, -2.090194, 0, 0, 0, 1, 1,
-0.748746, -0.3145456, -1.575967, 0, 0, 0, 1, 1,
-0.7447203, -0.2796771, -1.780693, 0, 0, 0, 1, 1,
-0.7419636, 0.0991206, -2.06204, 0, 0, 0, 1, 1,
-0.7412929, -0.3104675, -2.164178, 0, 0, 0, 1, 1,
-0.7217113, -0.606243, -2.00421, 1, 1, 1, 1, 1,
-0.7195661, -0.1550092, -5.003688, 1, 1, 1, 1, 1,
-0.7155626, -1.259243, -3.107487, 1, 1, 1, 1, 1,
-0.7123142, 0.803188, 0.1796276, 1, 1, 1, 1, 1,
-0.710584, -0.2111743, -0.1293784, 1, 1, 1, 1, 1,
-0.7002662, -1.092704, -3.499926, 1, 1, 1, 1, 1,
-0.6997651, -1.519338, -3.31097, 1, 1, 1, 1, 1,
-0.6993384, -0.3212796, -2.076127, 1, 1, 1, 1, 1,
-0.699075, -0.04533902, -1.199405, 1, 1, 1, 1, 1,
-0.6943686, -0.2011752, -0.7560439, 1, 1, 1, 1, 1,
-0.6857997, 1.265263, -0.7082232, 1, 1, 1, 1, 1,
-0.6793917, 0.3832253, -1.750412, 1, 1, 1, 1, 1,
-0.67787, 0.8148788, -1.45179, 1, 1, 1, 1, 1,
-0.6776612, 0.5325484, -0.6771286, 1, 1, 1, 1, 1,
-0.673973, -0.5951211, -1.216101, 1, 1, 1, 1, 1,
-0.6730854, 1.181323, -2.206903, 0, 0, 1, 1, 1,
-0.6691657, 0.702584, -1.362617, 1, 0, 0, 1, 1,
-0.6665462, 0.7627514, -1.651401, 1, 0, 0, 1, 1,
-0.6646087, 0.7737113, -1.563737, 1, 0, 0, 1, 1,
-0.6595583, -1.595849, -4.575382, 1, 0, 0, 1, 1,
-0.6526091, -1.46404, -2.038978, 1, 0, 0, 1, 1,
-0.6494595, -0.3910519, -0.9993511, 0, 0, 0, 1, 1,
-0.6461632, -0.7442647, -3.599418, 0, 0, 0, 1, 1,
-0.6457784, -0.290282, -2.489054, 0, 0, 0, 1, 1,
-0.6422601, 2.447563, -0.1157731, 0, 0, 0, 1, 1,
-0.6410164, -0.6610879, -1.354872, 0, 0, 0, 1, 1,
-0.6394243, 1.007044, -0.9612134, 0, 0, 0, 1, 1,
-0.6382844, -0.4670188, -2.825463, 0, 0, 0, 1, 1,
-0.6382341, -1.491439, -2.956218, 1, 1, 1, 1, 1,
-0.6347017, 2.263553, -0.831597, 1, 1, 1, 1, 1,
-0.63415, -1.150276, -1.194672, 1, 1, 1, 1, 1,
-0.6314888, -0.07305292, 0.03183307, 1, 1, 1, 1, 1,
-0.6282187, -2.860285, -3.604609, 1, 1, 1, 1, 1,
-0.6275832, 1.09342, 1.11149, 1, 1, 1, 1, 1,
-0.6272475, 0.8042719, -1.277179, 1, 1, 1, 1, 1,
-0.606748, 0.7126736, -0.6812837, 1, 1, 1, 1, 1,
-0.6009578, -1.316383, -5.451728, 1, 1, 1, 1, 1,
-0.5988523, 1.056418, -0.2188034, 1, 1, 1, 1, 1,
-0.5936033, -1.148444, -4.468999, 1, 1, 1, 1, 1,
-0.5925684, 0.7256421, -0.9574685, 1, 1, 1, 1, 1,
-0.590778, 1.616752, -0.4704491, 1, 1, 1, 1, 1,
-0.5853893, -1.0438, -2.441099, 1, 1, 1, 1, 1,
-0.5841508, 0.9390382, -2.172073, 1, 1, 1, 1, 1,
-0.5795668, -1.079806, -3.610479, 0, 0, 1, 1, 1,
-0.5779898, 1.089711, -0.7865233, 1, 0, 0, 1, 1,
-0.5764751, -0.8883122, -2.695892, 1, 0, 0, 1, 1,
-0.575864, -0.3093386, -1.106735, 1, 0, 0, 1, 1,
-0.574017, -0.9869776, -0.9522614, 1, 0, 0, 1, 1,
-0.5727265, -0.2844188, -2.445714, 1, 0, 0, 1, 1,
-0.5711834, 0.3392007, -1.793134, 0, 0, 0, 1, 1,
-0.5689681, -1.275637, -4.392352, 0, 0, 0, 1, 1,
-0.5683554, 1.080663, -0.8332778, 0, 0, 0, 1, 1,
-0.5682864, 0.05490054, -0.4577898, 0, 0, 0, 1, 1,
-0.5637934, -1.137426, -1.816898, 0, 0, 0, 1, 1,
-0.5532507, 0.3749984, -1.10403, 0, 0, 0, 1, 1,
-0.5477093, 1.319529, -2.012308, 0, 0, 0, 1, 1,
-0.5387049, 0.1070021, -1.880764, 1, 1, 1, 1, 1,
-0.53583, 0.09814389, -2.376702, 1, 1, 1, 1, 1,
-0.5348927, -0.4127818, -3.881139, 1, 1, 1, 1, 1,
-0.5337484, -0.4459511, -4.375957, 1, 1, 1, 1, 1,
-0.5259678, -0.3488138, -2.114086, 1, 1, 1, 1, 1,
-0.5225248, 1.920453, -0.48224, 1, 1, 1, 1, 1,
-0.5220821, 0.4582327, -1.622437, 1, 1, 1, 1, 1,
-0.5207926, 0.009792445, -0.6417821, 1, 1, 1, 1, 1,
-0.5204912, -1.154502, -2.905174, 1, 1, 1, 1, 1,
-0.5147339, -0.06588603, -2.469744, 1, 1, 1, 1, 1,
-0.5137821, 1.348721, -1.336582, 1, 1, 1, 1, 1,
-0.5084531, -0.438402, -3.693138, 1, 1, 1, 1, 1,
-0.4995224, 0.545551, -1.314875, 1, 1, 1, 1, 1,
-0.497215, -0.1977095, -1.259528, 1, 1, 1, 1, 1,
-0.4902612, 1.508474, 0.2968483, 1, 1, 1, 1, 1,
-0.4877279, -0.6401001, -3.421825, 0, 0, 1, 1, 1,
-0.4872142, 1.501835, -0.3072447, 1, 0, 0, 1, 1,
-0.4862357, 1.003194, 0.8931751, 1, 0, 0, 1, 1,
-0.4854507, 0.7350941, -0.7005551, 1, 0, 0, 1, 1,
-0.4854168, 1.430647, 1.116554, 1, 0, 0, 1, 1,
-0.4826166, -0.5079247, -2.969371, 1, 0, 0, 1, 1,
-0.4757646, 0.3734054, -1.690151, 0, 0, 0, 1, 1,
-0.4752789, 0.2351765, 1.280812, 0, 0, 0, 1, 1,
-0.4745455, -1.444238, -2.38131, 0, 0, 0, 1, 1,
-0.471848, -0.6208589, -1.385538, 0, 0, 0, 1, 1,
-0.4717309, -1.499057, -3.415031, 0, 0, 0, 1, 1,
-0.4708256, -0.3583131, -1.794576, 0, 0, 0, 1, 1,
-0.4692636, 0.1702264, -2.367682, 0, 0, 0, 1, 1,
-0.4644522, -1.546413, -3.935103, 1, 1, 1, 1, 1,
-0.4631284, -0.4036719, -0.9913028, 1, 1, 1, 1, 1,
-0.4608284, 1.503461, 0.8314194, 1, 1, 1, 1, 1,
-0.4607406, 0.324527, -0.2802359, 1, 1, 1, 1, 1,
-0.4599583, 0.6300265, -0.4229462, 1, 1, 1, 1, 1,
-0.456498, -0.4112647, -2.183946, 1, 1, 1, 1, 1,
-0.4520183, -1.765926, -2.798939, 1, 1, 1, 1, 1,
-0.4516765, 0.1953339, -2.135719, 1, 1, 1, 1, 1,
-0.4506064, 0.6831419, 0.6152796, 1, 1, 1, 1, 1,
-0.4497009, -0.09658668, -0.735862, 1, 1, 1, 1, 1,
-0.4446909, -0.5301398, -3.02453, 1, 1, 1, 1, 1,
-0.4441155, -1.259002, -3.645157, 1, 1, 1, 1, 1,
-0.4435597, -0.7391634, -3.191317, 1, 1, 1, 1, 1,
-0.4364441, -0.4889185, -1.790056, 1, 1, 1, 1, 1,
-0.4339803, 1.071833, -0.9572429, 1, 1, 1, 1, 1,
-0.4329675, -0.9256777, -3.70685, 0, 0, 1, 1, 1,
-0.4181408, -1.590404, -2.412244, 1, 0, 0, 1, 1,
-0.409763, -0.4543728, -2.174743, 1, 0, 0, 1, 1,
-0.4073944, -0.4976799, -2.476977, 1, 0, 0, 1, 1,
-0.4052869, -0.1225996, -1.972, 1, 0, 0, 1, 1,
-0.4034189, -0.7054699, -1.275892, 1, 0, 0, 1, 1,
-0.403136, -1.983225, -2.394429, 0, 0, 0, 1, 1,
-0.4027294, 0.2019715, -1.4418, 0, 0, 0, 1, 1,
-0.4006993, -1.373292, -2.478877, 0, 0, 0, 1, 1,
-0.3983385, -0.7714916, -2.411994, 0, 0, 0, 1, 1,
-0.3979435, 2.183563, -1.251809, 0, 0, 0, 1, 1,
-0.3960055, 0.1137382, -1.138444, 0, 0, 0, 1, 1,
-0.3932007, -0.9126045, -2.350799, 0, 0, 0, 1, 1,
-0.3931409, 0.5860813, 0.2163738, 1, 1, 1, 1, 1,
-0.3908227, -0.7110744, -3.19011, 1, 1, 1, 1, 1,
-0.3896076, -1.583878, -3.898719, 1, 1, 1, 1, 1,
-0.3720005, -0.4146563, -1.715315, 1, 1, 1, 1, 1,
-0.3710696, 0.1440611, 0.5066356, 1, 1, 1, 1, 1,
-0.3702837, 1.864745, -0.2072276, 1, 1, 1, 1, 1,
-0.3674164, 1.516593, -2.607685, 1, 1, 1, 1, 1,
-0.3667535, 1.34957, -1.702641, 1, 1, 1, 1, 1,
-0.3658693, -0.7593035, -1.651427, 1, 1, 1, 1, 1,
-0.3647889, -0.7587062, -2.397785, 1, 1, 1, 1, 1,
-0.3569486, -1.637237, -1.682802, 1, 1, 1, 1, 1,
-0.3557616, -0.05746349, -1.312356, 1, 1, 1, 1, 1,
-0.3550959, 0.2302652, -0.05774414, 1, 1, 1, 1, 1,
-0.3542442, -1.826781, -3.070929, 1, 1, 1, 1, 1,
-0.3525111, 0.3630392, 0.0213077, 1, 1, 1, 1, 1,
-0.349715, 0.3314677, -1.704321, 0, 0, 1, 1, 1,
-0.3490627, -0.5874829, -2.21616, 1, 0, 0, 1, 1,
-0.3475165, 1.140441, -0.2177036, 1, 0, 0, 1, 1,
-0.3429814, -1.203532, -3.010991, 1, 0, 0, 1, 1,
-0.3403804, -0.4342925, -2.312821, 1, 0, 0, 1, 1,
-0.3394738, 0.8196424, -1.123253, 1, 0, 0, 1, 1,
-0.3391176, -0.9560727, -2.074385, 0, 0, 0, 1, 1,
-0.3379765, 0.05858112, 0.5449695, 0, 0, 0, 1, 1,
-0.3370449, 0.08094523, -2.508919, 0, 0, 0, 1, 1,
-0.3368299, 0.3641195, -1.622547, 0, 0, 0, 1, 1,
-0.3362032, -1.365145, -4.918223, 0, 0, 0, 1, 1,
-0.3345737, -0.05239406, -3.245478, 0, 0, 0, 1, 1,
-0.3340333, 0.9338962, -1.581118, 0, 0, 0, 1, 1,
-0.3284278, 0.5351598, -1.581618, 1, 1, 1, 1, 1,
-0.3279374, -0.803957, -3.384997, 1, 1, 1, 1, 1,
-0.3269367, 0.956546, -0.9677563, 1, 1, 1, 1, 1,
-0.3242882, 2.067505, -0.6181575, 1, 1, 1, 1, 1,
-0.3236995, -0.6018405, -2.418044, 1, 1, 1, 1, 1,
-0.3208721, 0.03172662, -2.955076, 1, 1, 1, 1, 1,
-0.3194025, -0.525671, -2.985744, 1, 1, 1, 1, 1,
-0.3181496, -0.4644853, -3.610236, 1, 1, 1, 1, 1,
-0.3158857, 0.6656072, -0.05159886, 1, 1, 1, 1, 1,
-0.3158783, 0.5230515, -0.4802107, 1, 1, 1, 1, 1,
-0.3074152, -1.316019, -2.899856, 1, 1, 1, 1, 1,
-0.3047966, -1.179217, -2.235015, 1, 1, 1, 1, 1,
-0.3023015, 0.8591908, -0.2998118, 1, 1, 1, 1, 1,
-0.2958563, -1.454401, -2.8036, 1, 1, 1, 1, 1,
-0.2927596, -0.05401072, -0.869365, 1, 1, 1, 1, 1,
-0.2927334, -0.2634707, -0.6386763, 0, 0, 1, 1, 1,
-0.2908277, 0.8927748, 0.2447104, 1, 0, 0, 1, 1,
-0.2906049, 0.4142047, 2.124002, 1, 0, 0, 1, 1,
-0.2885731, 1.610179, 0.08836565, 1, 0, 0, 1, 1,
-0.28236, 1.417667, 0.7303649, 1, 0, 0, 1, 1,
-0.2765968, -0.2473854, -1.735569, 1, 0, 0, 1, 1,
-0.2748932, -1.845206, -2.912278, 0, 0, 0, 1, 1,
-0.2702906, 2.430743, 1.978722, 0, 0, 0, 1, 1,
-0.2673576, -0.7202479, -1.960451, 0, 0, 0, 1, 1,
-0.2672716, 0.944257, 0.184294, 0, 0, 0, 1, 1,
-0.2642886, 2.476022, -1.366957, 0, 0, 0, 1, 1,
-0.2641492, 1.371133, -1.344744, 0, 0, 0, 1, 1,
-0.25661, 0.2658778, 1.577111, 0, 0, 0, 1, 1,
-0.2564096, 1.918025, -1.36203, 1, 1, 1, 1, 1,
-0.2535965, 0.6186659, -2.722794, 1, 1, 1, 1, 1,
-0.2523448, 2.015161, 1.795033, 1, 1, 1, 1, 1,
-0.2468966, -0.2452101, -1.568955, 1, 1, 1, 1, 1,
-0.2448906, 0.9008389, 0.9847852, 1, 1, 1, 1, 1,
-0.240394, -1.376049, -1.782727, 1, 1, 1, 1, 1,
-0.2401588, 1.007443, -1.126867, 1, 1, 1, 1, 1,
-0.2359382, -0.1726389, -3.447543, 1, 1, 1, 1, 1,
-0.2279948, -0.9612328, -2.517953, 1, 1, 1, 1, 1,
-0.2236465, -0.6112991, -3.099893, 1, 1, 1, 1, 1,
-0.2226747, 0.7162817, -1.155095, 1, 1, 1, 1, 1,
-0.2214866, 0.6724316, -1.324052, 1, 1, 1, 1, 1,
-0.2205883, 2.072265, 0.06007581, 1, 1, 1, 1, 1,
-0.2197028, -0.3864925, -2.198343, 1, 1, 1, 1, 1,
-0.2191171, -0.9395228, -2.863537, 1, 1, 1, 1, 1,
-0.2185457, -1.424703, -2.86222, 0, 0, 1, 1, 1,
-0.2146535, -0.08668947, -0.9447357, 1, 0, 0, 1, 1,
-0.2071649, -0.3559287, -2.999212, 1, 0, 0, 1, 1,
-0.2059704, -0.5069625, -2.509909, 1, 0, 0, 1, 1,
-0.2046527, -0.6018844, -3.806006, 1, 0, 0, 1, 1,
-0.2041264, 0.7423036, -0.5036044, 1, 0, 0, 1, 1,
-0.202764, 0.74779, -0.651317, 0, 0, 0, 1, 1,
-0.2019928, 0.9366253, -0.2539385, 0, 0, 0, 1, 1,
-0.2016604, -0.459842, -4.310607, 0, 0, 0, 1, 1,
-0.200991, -0.1452494, -0.7929136, 0, 0, 0, 1, 1,
-0.1975736, 0.7188676, -1.78091, 0, 0, 0, 1, 1,
-0.1958281, 0.7690166, -0.6287783, 0, 0, 0, 1, 1,
-0.1957546, -0.305495, -3.943614, 0, 0, 0, 1, 1,
-0.1944226, 1.832547, -1.119994, 1, 1, 1, 1, 1,
-0.1943362, -0.8296835, -2.744694, 1, 1, 1, 1, 1,
-0.1936317, -0.1923845, -0.7793677, 1, 1, 1, 1, 1,
-0.1934942, 1.384652, -0.7116029, 1, 1, 1, 1, 1,
-0.1880647, 0.3590593, -0.9225904, 1, 1, 1, 1, 1,
-0.1846415, -0.2369507, -3.758517, 1, 1, 1, 1, 1,
-0.182757, -0.8617278, -4.452925, 1, 1, 1, 1, 1,
-0.182642, -0.5193805, -2.334437, 1, 1, 1, 1, 1,
-0.1820025, -1.300715, -2.892742, 1, 1, 1, 1, 1,
-0.1792544, 0.4522012, 0.931334, 1, 1, 1, 1, 1,
-0.172416, 1.269791, -1.177922, 1, 1, 1, 1, 1,
-0.1724036, -0.05022281, -2.185568, 1, 1, 1, 1, 1,
-0.1723349, 1.40271, -0.007968417, 1, 1, 1, 1, 1,
-0.1665667, 0.4853773, 0.1853624, 1, 1, 1, 1, 1,
-0.166259, 1.294328, -0.7685016, 1, 1, 1, 1, 1,
-0.1653832, -0.3521816, -2.43628, 0, 0, 1, 1, 1,
-0.1648546, 1.233134, -0.9313803, 1, 0, 0, 1, 1,
-0.1604438, -0.9761426, -3.934097, 1, 0, 0, 1, 1,
-0.156997, -2.003778, -1.797865, 1, 0, 0, 1, 1,
-0.1558741, -0.2132402, -1.463148, 1, 0, 0, 1, 1,
-0.1557797, 0.8324332, 1.020133, 1, 0, 0, 1, 1,
-0.1541157, -1.105691, -3.91186, 0, 0, 0, 1, 1,
-0.1538566, -0.8903479, -2.639674, 0, 0, 0, 1, 1,
-0.1526544, -0.309269, -3.463515, 0, 0, 0, 1, 1,
-0.1472024, 1.360049, 1.151102, 0, 0, 0, 1, 1,
-0.1380499, 0.8068869, -1.567267, 0, 0, 0, 1, 1,
-0.1339926, -1.92282, -2.881399, 0, 0, 0, 1, 1,
-0.1339795, 0.8256519, -0.5655067, 0, 0, 0, 1, 1,
-0.1333067, 1.805096, -1.099689, 1, 1, 1, 1, 1,
-0.128916, 1.511395, -1.48846, 1, 1, 1, 1, 1,
-0.1287046, 1.04402, -2.943036, 1, 1, 1, 1, 1,
-0.1284511, -0.4528118, -2.00239, 1, 1, 1, 1, 1,
-0.1271242, -0.6277886, -3.134872, 1, 1, 1, 1, 1,
-0.1238486, -0.6996661, -1.875742, 1, 1, 1, 1, 1,
-0.123805, 1.773381, 1.587098, 1, 1, 1, 1, 1,
-0.1219908, -1.27252, -2.317229, 1, 1, 1, 1, 1,
-0.1194651, 1.379997, 0.4100039, 1, 1, 1, 1, 1,
-0.1146294, 2.113812, 0.6413636, 1, 1, 1, 1, 1,
-0.1081581, 1.202191, -0.9365546, 1, 1, 1, 1, 1,
-0.1076084, 1.326275, 1.649657, 1, 1, 1, 1, 1,
-0.09846624, -1.403355, -4.104881, 1, 1, 1, 1, 1,
-0.09818105, -0.0899857, -3.482208, 1, 1, 1, 1, 1,
-0.09655908, -0.5137208, -2.021314, 1, 1, 1, 1, 1,
-0.08724146, 0.3874866, -2.423709, 0, 0, 1, 1, 1,
-0.0847929, 0.3680446, -1.041422, 1, 0, 0, 1, 1,
-0.08106175, -0.8657231, -3.741651, 1, 0, 0, 1, 1,
-0.08027714, -1.83568, -1.862535, 1, 0, 0, 1, 1,
-0.07929368, -1.469578, -3.586877, 1, 0, 0, 1, 1,
-0.0792463, 0.07315588, -0.4560344, 1, 0, 0, 1, 1,
-0.07913349, -1.347231, -4.66657, 0, 0, 0, 1, 1,
-0.07790841, -1.512028, -4.467724, 0, 0, 0, 1, 1,
-0.07639768, 0.02493632, -1.032487, 0, 0, 0, 1, 1,
-0.07627399, -0.5201253, -3.004226, 0, 0, 0, 1, 1,
-0.07181349, 0.5619684, -1.969389, 0, 0, 0, 1, 1,
-0.06897154, -0.5466291, -2.603346, 0, 0, 0, 1, 1,
-0.06607738, -0.8047799, -3.752627, 0, 0, 0, 1, 1,
-0.06476378, 0.5511369, -0.2416328, 1, 1, 1, 1, 1,
-0.06416765, 1.262448, 0.4486078, 1, 1, 1, 1, 1,
-0.05786063, -1.404811, -3.189652, 1, 1, 1, 1, 1,
-0.05343437, -0.7765979, -4.323574, 1, 1, 1, 1, 1,
-0.0515903, -1.193942, -4.491879, 1, 1, 1, 1, 1,
-0.04512626, -0.3011509, -2.216048, 1, 1, 1, 1, 1,
-0.04293294, 2.156366, -0.0004130636, 1, 1, 1, 1, 1,
-0.04150607, 1.398555, 1.009109, 1, 1, 1, 1, 1,
-0.04142282, -1.162063, -2.624945, 1, 1, 1, 1, 1,
-0.03953548, 1.564218, -0.2667037, 1, 1, 1, 1, 1,
-0.03883941, 0.08924334, -0.9091747, 1, 1, 1, 1, 1,
-0.03536436, 1.286669, 0.6099674, 1, 1, 1, 1, 1,
-0.03369371, -0.06148548, -2.677052, 1, 1, 1, 1, 1,
-0.03189299, 0.397758, 0.6705114, 1, 1, 1, 1, 1,
-0.02400038, -2.272174, -4.552852, 1, 1, 1, 1, 1,
-0.01980038, -0.4518298, -2.845734, 0, 0, 1, 1, 1,
-0.0160085, -2.044072, -3.491853, 1, 0, 0, 1, 1,
-0.01347815, -0.3408979, -4.543231, 1, 0, 0, 1, 1,
-0.01258751, 1.107629, 0.9880975, 1, 0, 0, 1, 1,
-0.005611768, -1.111978, -2.06243, 1, 0, 0, 1, 1,
-0.005541756, 0.7961687, 1.586838, 1, 0, 0, 1, 1,
-0.00544339, -0.2332865, -2.643467, 0, 0, 0, 1, 1,
-0.004238495, -0.9046478, -3.622327, 0, 0, 0, 1, 1,
-0.001995859, 0.544879, -0.3110165, 0, 0, 0, 1, 1,
-0.001956033, -0.1965988, -1.729142, 0, 0, 0, 1, 1,
0.0001452117, 0.4757764, 1.190929, 0, 0, 0, 1, 1,
0.003113013, -1.859624, 1.465747, 0, 0, 0, 1, 1,
0.00779041, -0.4064777, 4.962059, 0, 0, 0, 1, 1,
0.01529319, 0.1100836, 1.75134, 1, 1, 1, 1, 1,
0.01720455, 1.862758, 1.113468, 1, 1, 1, 1, 1,
0.01754476, -1.656764, 5.444707, 1, 1, 1, 1, 1,
0.01862115, 0.5266602, -0.02668983, 1, 1, 1, 1, 1,
0.02033122, 0.7915537, 0.168665, 1, 1, 1, 1, 1,
0.02681374, -0.5376574, 4.353536, 1, 1, 1, 1, 1,
0.0348961, -1.223184, 3.921404, 1, 1, 1, 1, 1,
0.03641639, -0.2654449, 3.754634, 1, 1, 1, 1, 1,
0.04335985, 0.586886, 2.1659, 1, 1, 1, 1, 1,
0.04548789, 0.331377, 1.556446, 1, 1, 1, 1, 1,
0.04583916, -0.307974, 2.50758, 1, 1, 1, 1, 1,
0.05480247, -0.06184227, 1.007275, 1, 1, 1, 1, 1,
0.06091463, -1.426086, 2.589186, 1, 1, 1, 1, 1,
0.06395267, 2.927051, 0.9205363, 1, 1, 1, 1, 1,
0.0640212, -0.8876649, 2.066215, 1, 1, 1, 1, 1,
0.06621577, 0.3458129, -0.4536477, 0, 0, 1, 1, 1,
0.07026684, 0.9364385, 0.2986868, 1, 0, 0, 1, 1,
0.07067993, -0.3957034, 2.392275, 1, 0, 0, 1, 1,
0.07094435, 0.6614584, -0.5184082, 1, 0, 0, 1, 1,
0.07144145, -0.3055257, 1.93625, 1, 0, 0, 1, 1,
0.07689579, 1.915393, -2.381602, 1, 0, 0, 1, 1,
0.07799568, -0.1054337, 2.691613, 0, 0, 0, 1, 1,
0.08136651, 0.6458774, -0.6118684, 0, 0, 0, 1, 1,
0.08270875, -1.129188, 2.79652, 0, 0, 0, 1, 1,
0.0868953, 0.9581107, 1.363742, 0, 0, 0, 1, 1,
0.09133295, 1.74546, 2.693862, 0, 0, 0, 1, 1,
0.09172246, 0.2769911, 1.02323, 0, 0, 0, 1, 1,
0.09215292, -1.441183, 4.070193, 0, 0, 0, 1, 1,
0.09777956, 0.6889465, 1.114812, 1, 1, 1, 1, 1,
0.09834185, 2.782293, 1.10287, 1, 1, 1, 1, 1,
0.09839568, 0.7420291, 0.8565484, 1, 1, 1, 1, 1,
0.09868655, 0.8635277, 0.01918427, 1, 1, 1, 1, 1,
0.1003258, -0.2673745, 2.866839, 1, 1, 1, 1, 1,
0.1029248, -0.7514915, 3.338313, 1, 1, 1, 1, 1,
0.1036303, 0.08830509, 1.080664, 1, 1, 1, 1, 1,
0.1049527, -0.4045578, 1.684451, 1, 1, 1, 1, 1,
0.1077716, 0.6917244, 0.5336024, 1, 1, 1, 1, 1,
0.1097404, 1.652647, -1.015889, 1, 1, 1, 1, 1,
0.1116505, -0.6067098, 2.253526, 1, 1, 1, 1, 1,
0.1122495, -0.8949874, 2.726862, 1, 1, 1, 1, 1,
0.1147377, -1.659907, 2.387417, 1, 1, 1, 1, 1,
0.1168888, -0.09310428, 2.497179, 1, 1, 1, 1, 1,
0.1175203, 0.7438972, 0.4180116, 1, 1, 1, 1, 1,
0.1179223, -0.04033933, 1.589432, 0, 0, 1, 1, 1,
0.1194784, 1.442207, 0.8118764, 1, 0, 0, 1, 1,
0.1218482, 1.763283, -0.4275764, 1, 0, 0, 1, 1,
0.1273369, 0.7829102, 2.128175, 1, 0, 0, 1, 1,
0.1275601, -0.9546354, 3.636843, 1, 0, 0, 1, 1,
0.1287821, 0.5333196, 0.3715871, 1, 0, 0, 1, 1,
0.130331, -0.1124742, -0.2324976, 0, 0, 0, 1, 1,
0.1305468, -0.9792275, 2.320809, 0, 0, 0, 1, 1,
0.1308905, -1.408686, 4.240463, 0, 0, 0, 1, 1,
0.1341405, -0.5855117, 1.191174, 0, 0, 0, 1, 1,
0.1460223, -0.1737527, 1.325807, 0, 0, 0, 1, 1,
0.1481637, -0.5715029, 2.671585, 0, 0, 0, 1, 1,
0.1544719, 1.525944, -0.02539654, 0, 0, 0, 1, 1,
0.1555304, 1.503266, 0.139857, 1, 1, 1, 1, 1,
0.1557609, -0.3249196, 4.475751, 1, 1, 1, 1, 1,
0.1571065, -0.6717504, 3.157565, 1, 1, 1, 1, 1,
0.1640012, -0.5025031, 4.282776, 1, 1, 1, 1, 1,
0.1662097, 0.1354601, 0.02971328, 1, 1, 1, 1, 1,
0.1677584, -0.29566, 4.163799, 1, 1, 1, 1, 1,
0.1691549, -0.2151673, 2.543516, 1, 1, 1, 1, 1,
0.1764329, 0.1578804, 0.5670779, 1, 1, 1, 1, 1,
0.1766201, 1.869689, 0.1629469, 1, 1, 1, 1, 1,
0.1823783, -2.517156, 2.172141, 1, 1, 1, 1, 1,
0.1831087, 0.2807497, -0.0992491, 1, 1, 1, 1, 1,
0.187727, -0.1175546, 1.351818, 1, 1, 1, 1, 1,
0.1971286, -0.8678145, 2.80536, 1, 1, 1, 1, 1,
0.198249, 0.9087167, 0.8807009, 1, 1, 1, 1, 1,
0.2075574, -1.534459, 2.974105, 1, 1, 1, 1, 1,
0.2143203, 1.176394, 1.212233, 0, 0, 1, 1, 1,
0.2182702, 0.7621275, -0.2142909, 1, 0, 0, 1, 1,
0.2201871, -1.511296, 4.733288, 1, 0, 0, 1, 1,
0.2210938, 0.2713123, 0.3347642, 1, 0, 0, 1, 1,
0.2241445, -1.769942, 2.442864, 1, 0, 0, 1, 1,
0.2290069, 1.1703, -1.85565, 1, 0, 0, 1, 1,
0.2298238, 0.6679281, 2.760511, 0, 0, 0, 1, 1,
0.2308113, 1.634567, -0.378445, 0, 0, 0, 1, 1,
0.2400495, 1.038183, 1.008578, 0, 0, 0, 1, 1,
0.2416315, 0.5046763, -0.8304394, 0, 0, 0, 1, 1,
0.2494286, -0.2422886, 2.592919, 0, 0, 0, 1, 1,
0.252498, -0.8544015, 2.309279, 0, 0, 0, 1, 1,
0.2543864, 2.60898, 0.8139839, 0, 0, 0, 1, 1,
0.258146, 1.961298, -0.5333269, 1, 1, 1, 1, 1,
0.2608246, 0.4961426, -0.3634275, 1, 1, 1, 1, 1,
0.2643176, -0.2809613, 2.35733, 1, 1, 1, 1, 1,
0.2644678, 0.2498793, 2.249654, 1, 1, 1, 1, 1,
0.2673436, -0.4970026, 1.791704, 1, 1, 1, 1, 1,
0.2678698, 1.501625, -0.3051853, 1, 1, 1, 1, 1,
0.2688028, 0.4653916, 1.589162, 1, 1, 1, 1, 1,
0.273717, 0.6923214, 0.5992753, 1, 1, 1, 1, 1,
0.2762257, 0.5210891, 1.667668, 1, 1, 1, 1, 1,
0.2776676, -0.8420782, 2.716439, 1, 1, 1, 1, 1,
0.2803586, -0.104169, 1.161312, 1, 1, 1, 1, 1,
0.2812833, -1.46291, 2.16482, 1, 1, 1, 1, 1,
0.281578, 0.2745828, 0.314119, 1, 1, 1, 1, 1,
0.2930404, -0.07948063, 2.047137, 1, 1, 1, 1, 1,
0.293165, 1.625265, 0.3623007, 1, 1, 1, 1, 1,
0.2948235, -1.302856, 3.361742, 0, 0, 1, 1, 1,
0.295032, -0.6222975, 2.797888, 1, 0, 0, 1, 1,
0.2991887, -1.758223, 2.266363, 1, 0, 0, 1, 1,
0.3028465, 1.766148, 1.828167, 1, 0, 0, 1, 1,
0.3128923, 1.221357, -1.561212, 1, 0, 0, 1, 1,
0.3142911, -1.84377, 3.262097, 1, 0, 0, 1, 1,
0.3180643, -1.252003, 4.162047, 0, 0, 0, 1, 1,
0.3296263, 0.08756822, 1.64019, 0, 0, 0, 1, 1,
0.3298909, 1.114674, -1.337231, 0, 0, 0, 1, 1,
0.3305774, -0.02576914, 0.3769259, 0, 0, 0, 1, 1,
0.3332899, -0.9681413, 3.416723, 0, 0, 0, 1, 1,
0.3376053, 2.455165, 0.3577606, 0, 0, 0, 1, 1,
0.33776, -0.1345448, 2.855141, 0, 0, 0, 1, 1,
0.3395222, -2.411071, 2.211162, 1, 1, 1, 1, 1,
0.3447944, -1.788665, 4.142952, 1, 1, 1, 1, 1,
0.3462498, -1.562272, 2.261155, 1, 1, 1, 1, 1,
0.3504173, -2.232211, 2.859108, 1, 1, 1, 1, 1,
0.3516926, 1.437998, 0.728389, 1, 1, 1, 1, 1,
0.3534861, -0.852066, 3.039559, 1, 1, 1, 1, 1,
0.3567563, 0.5357041, 1.098951, 1, 1, 1, 1, 1,
0.3571029, 1.657797, -1.337674, 1, 1, 1, 1, 1,
0.3581534, 1.421979, 1.678484, 1, 1, 1, 1, 1,
0.363559, -0.4084757, 2.316752, 1, 1, 1, 1, 1,
0.3659573, 0.6253387, 0.5233765, 1, 1, 1, 1, 1,
0.366143, 2.305145, -0.5426924, 1, 1, 1, 1, 1,
0.3719382, -0.5847055, 2.570555, 1, 1, 1, 1, 1,
0.372894, 0.3625447, -0.1348053, 1, 1, 1, 1, 1,
0.3767948, 0.3238705, -0.6860108, 1, 1, 1, 1, 1,
0.3804214, -0.3305807, 2.122745, 0, 0, 1, 1, 1,
0.3806149, -0.9122136, 3.560968, 1, 0, 0, 1, 1,
0.3850633, 1.254992, -0.2574564, 1, 0, 0, 1, 1,
0.3853977, 0.3308201, 2.335459, 1, 0, 0, 1, 1,
0.3884238, -0.5191601, 1.992589, 1, 0, 0, 1, 1,
0.3889883, 0.2393577, 1.833258, 1, 0, 0, 1, 1,
0.392983, -0.3166806, 0.9874424, 0, 0, 0, 1, 1,
0.3976569, 0.8955373, 1.187667, 0, 0, 0, 1, 1,
0.4013133, 0.1813146, 0.6023177, 0, 0, 0, 1, 1,
0.4021846, 0.07888696, 4.092944, 0, 0, 0, 1, 1,
0.4036281, 1.504207, -2.790232, 0, 0, 0, 1, 1,
0.4091642, 0.9335714, 1.437251, 0, 0, 0, 1, 1,
0.4126528, 0.4857246, 0.8282351, 0, 0, 0, 1, 1,
0.4160207, -0.2936311, 2.346709, 1, 1, 1, 1, 1,
0.4177445, 0.7954543, -0.6863161, 1, 1, 1, 1, 1,
0.4227864, 0.4375205, -0.001229909, 1, 1, 1, 1, 1,
0.4235433, 1.777104, -0.7166659, 1, 1, 1, 1, 1,
0.4240961, 1.425595, 1.65995, 1, 1, 1, 1, 1,
0.4243194, 0.764249, -0.05801902, 1, 1, 1, 1, 1,
0.4290713, 0.3244192, -0.1480073, 1, 1, 1, 1, 1,
0.4328897, 0.4412037, -0.6908068, 1, 1, 1, 1, 1,
0.4381548, -1.136664, 3.762512, 1, 1, 1, 1, 1,
0.4398357, 0.6541418, -0.3520654, 1, 1, 1, 1, 1,
0.4402362, 0.5963748, 0.4645666, 1, 1, 1, 1, 1,
0.4429253, -0.01506574, 1.579956, 1, 1, 1, 1, 1,
0.4502945, 1.349316, 0.2529912, 1, 1, 1, 1, 1,
0.4520003, -0.2937672, 2.090149, 1, 1, 1, 1, 1,
0.4659046, -0.5262047, 1.916438, 1, 1, 1, 1, 1,
0.4667195, -0.4092844, 0.8996884, 0, 0, 1, 1, 1,
0.4705246, 0.2706302, -1.427101, 1, 0, 0, 1, 1,
0.4713972, 1.061945, 0.3770728, 1, 0, 0, 1, 1,
0.4737478, -1.001538, 3.0273, 1, 0, 0, 1, 1,
0.4770189, 1.764304, 1.488815, 1, 0, 0, 1, 1,
0.4834141, -2.655154, 2.00172, 1, 0, 0, 1, 1,
0.4847449, -0.04659398, 1.428056, 0, 0, 0, 1, 1,
0.485407, -0.9332659, 2.299607, 0, 0, 0, 1, 1,
0.4868863, -1.049817, 2.052611, 0, 0, 0, 1, 1,
0.4916663, 1.282479, 0.7203016, 0, 0, 0, 1, 1,
0.4935702, -0.04010939, 3.554669, 0, 0, 0, 1, 1,
0.4987874, 0.1382661, 0.9578686, 0, 0, 0, 1, 1,
0.5066351, -1.52415, 2.119393, 0, 0, 0, 1, 1,
0.5113235, -0.6819161, 3.005974, 1, 1, 1, 1, 1,
0.5115905, 0.6785946, 0.7813249, 1, 1, 1, 1, 1,
0.5127364, -0.7343002, 2.567309, 1, 1, 1, 1, 1,
0.5138226, -0.3277745, 1.805574, 1, 1, 1, 1, 1,
0.5169581, -0.4146909, 1.648863, 1, 1, 1, 1, 1,
0.517391, 1.154858, 1.316901, 1, 1, 1, 1, 1,
0.5178127, -0.6977419, 4.087818, 1, 1, 1, 1, 1,
0.5181696, -2.241974, 4.251006, 1, 1, 1, 1, 1,
0.5200725, -1.112021, 2.065211, 1, 1, 1, 1, 1,
0.5219108, 0.4828869, 1.08357, 1, 1, 1, 1, 1,
0.5238412, -1.594086, 3.519583, 1, 1, 1, 1, 1,
0.5327523, -0.01981797, 1.174577, 1, 1, 1, 1, 1,
0.5363014, 0.2455506, 1.135249, 1, 1, 1, 1, 1,
0.537119, 1.020287, 0.3661926, 1, 1, 1, 1, 1,
0.5389123, 0.004634479, 1.847727, 1, 1, 1, 1, 1,
0.5464994, 0.7817752, 0.487244, 0, 0, 1, 1, 1,
0.5478963, 0.5693488, 0.839482, 1, 0, 0, 1, 1,
0.548589, -0.2456339, 1.924015, 1, 0, 0, 1, 1,
0.5492916, -0.3692486, 1.717761, 1, 0, 0, 1, 1,
0.558287, -0.9523281, 3.594886, 1, 0, 0, 1, 1,
0.5605716, 0.1193627, 0.7131599, 1, 0, 0, 1, 1,
0.5625253, -0.2554576, 2.178444, 0, 0, 0, 1, 1,
0.5626363, -0.4070736, 0.750012, 0, 0, 0, 1, 1,
0.5647104, 0.6834989, 0.1145954, 0, 0, 0, 1, 1,
0.5656434, -1.498466, 2.036286, 0, 0, 0, 1, 1,
0.5695699, 0.8431125, 0.6826115, 0, 0, 0, 1, 1,
0.5705326, 0.3494395, 0.9795831, 0, 0, 0, 1, 1,
0.5746164, -0.7663981, 1.35614, 0, 0, 0, 1, 1,
0.5791484, 0.8318499, -0.4405083, 1, 1, 1, 1, 1,
0.5807404, 0.4055401, 0.4537463, 1, 1, 1, 1, 1,
0.5824413, 0.6087557, 2.507163, 1, 1, 1, 1, 1,
0.5846241, -2.655404, 2.981421, 1, 1, 1, 1, 1,
0.5876697, -0.6312997, 4.277888, 1, 1, 1, 1, 1,
0.5907611, 0.2252173, 2.295014, 1, 1, 1, 1, 1,
0.5920123, 0.7737594, 0.9413925, 1, 1, 1, 1, 1,
0.5933403, 0.7853651, -0.3104543, 1, 1, 1, 1, 1,
0.5968744, 0.09357838, 2.621001, 1, 1, 1, 1, 1,
0.6017988, -0.3012101, 1.934507, 1, 1, 1, 1, 1,
0.6051817, 1.36916, 0.1400294, 1, 1, 1, 1, 1,
0.6123971, -1.117992, 3.027301, 1, 1, 1, 1, 1,
0.61269, -0.2125261, 1.412808, 1, 1, 1, 1, 1,
0.6204988, -0.7651662, 1.989613, 1, 1, 1, 1, 1,
0.621691, 1.608986, -0.7784514, 1, 1, 1, 1, 1,
0.621913, -0.01866329, 0.888144, 0, 0, 1, 1, 1,
0.6222526, -0.8604305, 1.992363, 1, 0, 0, 1, 1,
0.6233253, 1.705792, 1.343157, 1, 0, 0, 1, 1,
0.6312956, 0.791664, 2.072678, 1, 0, 0, 1, 1,
0.6344958, -0.1183489, 0.6007795, 1, 0, 0, 1, 1,
0.6383028, 0.3791931, 1.867772, 1, 0, 0, 1, 1,
0.6409605, -0.5119548, -0.5347079, 0, 0, 0, 1, 1,
0.6437717, -1.887984, 1.514971, 0, 0, 0, 1, 1,
0.6445951, -0.1998009, 1.766836, 0, 0, 0, 1, 1,
0.650992, 0.1966844, 1.577041, 0, 0, 0, 1, 1,
0.6514848, -0.9985526, 2.930404, 0, 0, 0, 1, 1,
0.6604611, -0.6969401, 1.581156, 0, 0, 0, 1, 1,
0.6658762, 0.03382453, 1.299803, 0, 0, 0, 1, 1,
0.6663785, -1.354279, 3.510977, 1, 1, 1, 1, 1,
0.6694683, -0.09781004, 2.927857, 1, 1, 1, 1, 1,
0.6763836, 0.08261972, 1.461901, 1, 1, 1, 1, 1,
0.6778373, 0.02582905, 2.182225, 1, 1, 1, 1, 1,
0.6783876, -1.813531, 2.228583, 1, 1, 1, 1, 1,
0.6819834, 1.148919, 1.112641, 1, 1, 1, 1, 1,
0.6853631, 0.1757275, 1.946514, 1, 1, 1, 1, 1,
0.6903896, 0.6353226, 2.114225, 1, 1, 1, 1, 1,
0.6918864, -0.007788952, 1.576681, 1, 1, 1, 1, 1,
0.6923848, 0.6096956, 1.616004, 1, 1, 1, 1, 1,
0.6936007, 0.5915443, 0.8663127, 1, 1, 1, 1, 1,
0.6998895, 0.4339694, 2.138675, 1, 1, 1, 1, 1,
0.705552, -0.1361489, 2.915623, 1, 1, 1, 1, 1,
0.7066831, 0.7713408, 0.3722069, 1, 1, 1, 1, 1,
0.7077208, -1.195044, 1.929608, 1, 1, 1, 1, 1,
0.7155858, -1.079408, 3.876439, 0, 0, 1, 1, 1,
0.7163369, 0.5906308, 1.366923, 1, 0, 0, 1, 1,
0.7164805, 0.1407658, 1.773097, 1, 0, 0, 1, 1,
0.7189733, -0.4162762, 2.268172, 1, 0, 0, 1, 1,
0.7234889, -0.6713479, 2.237215, 1, 0, 0, 1, 1,
0.7309671, 0.594675, 2.176066, 1, 0, 0, 1, 1,
0.7354022, -1.127506, 1.575224, 0, 0, 0, 1, 1,
0.7356899, 0.1856614, 2.877182, 0, 0, 0, 1, 1,
0.7396975, 1.05566, -0.3146403, 0, 0, 0, 1, 1,
0.748283, 0.2546049, -0.8793353, 0, 0, 0, 1, 1,
0.7491997, -0.8283328, 1.035136, 0, 0, 0, 1, 1,
0.757543, -0.7579246, 2.440198, 0, 0, 0, 1, 1,
0.759699, -0.03617916, 3.275731, 0, 0, 0, 1, 1,
0.7623261, 0.5055669, 1.553256, 1, 1, 1, 1, 1,
0.7657025, 0.4859451, 0.9623585, 1, 1, 1, 1, 1,
0.7715983, -0.549023, 3.491161, 1, 1, 1, 1, 1,
0.7758811, -0.1439538, 1.181785, 1, 1, 1, 1, 1,
0.7814687, -0.854939, 1.654585, 1, 1, 1, 1, 1,
0.7919396, 0.02058122, 1.81075, 1, 1, 1, 1, 1,
0.7960618, -0.5311272, 0.5386006, 1, 1, 1, 1, 1,
0.7973578, -1.761884, 2.118592, 1, 1, 1, 1, 1,
0.8068372, -0.09856037, 2.919419, 1, 1, 1, 1, 1,
0.8158139, -0.8143609, 4.060457, 1, 1, 1, 1, 1,
0.8224292, 0.372318, 1.046386, 1, 1, 1, 1, 1,
0.8235211, -1.370578, 3.29154, 1, 1, 1, 1, 1,
0.824771, 1.674155, 0.3601491, 1, 1, 1, 1, 1,
0.8291895, -0.5170963, 2.726319, 1, 1, 1, 1, 1,
0.8410802, 2.103892, -0.794487, 1, 1, 1, 1, 1,
0.8483794, -1.031243, 2.500059, 0, 0, 1, 1, 1,
0.8492685, -0.1711501, 2.824357, 1, 0, 0, 1, 1,
0.8496051, -1.039345, 2.39239, 1, 0, 0, 1, 1,
0.8502154, 0.7496174, 0.7340151, 1, 0, 0, 1, 1,
0.8591658, -1.189409, 2.417343, 1, 0, 0, 1, 1,
0.8594899, -0.07503854, 0.3221683, 1, 0, 0, 1, 1,
0.8687326, -0.4464363, 0.8737532, 0, 0, 0, 1, 1,
0.8692579, 0.1423515, -0.02407528, 0, 0, 0, 1, 1,
0.8745266, 0.6133472, -0.05020079, 0, 0, 0, 1, 1,
0.8791601, -2.393236, 2.921785, 0, 0, 0, 1, 1,
0.8799146, 0.03750949, 1.6411, 0, 0, 0, 1, 1,
0.8830083, 0.6532255, 2.112385, 0, 0, 0, 1, 1,
0.8865736, -0.2595713, 2.582674, 0, 0, 0, 1, 1,
0.8931707, -0.1100584, -0.04237815, 1, 1, 1, 1, 1,
0.8941139, -1.162633, 3.104739, 1, 1, 1, 1, 1,
0.8970496, 0.1296297, 0.2588681, 1, 1, 1, 1, 1,
0.8978704, 0.7257872, 0.976427, 1, 1, 1, 1, 1,
0.8984662, -0.2239902, 2.640008, 1, 1, 1, 1, 1,
0.9041359, -0.1311227, 1.759961, 1, 1, 1, 1, 1,
0.9061577, -1.999616, 4.028721, 1, 1, 1, 1, 1,
0.9078695, -1.072013, 2.941704, 1, 1, 1, 1, 1,
0.9089763, -0.2164976, 1.440399, 1, 1, 1, 1, 1,
0.9130237, 0.7053437, -0.6446075, 1, 1, 1, 1, 1,
0.9141183, -0.328189, 2.549867, 1, 1, 1, 1, 1,
0.9151884, -0.8516764, 3.604744, 1, 1, 1, 1, 1,
0.9208959, -0.08741796, 2.637848, 1, 1, 1, 1, 1,
0.9245703, -1.707445, 2.743721, 1, 1, 1, 1, 1,
0.9358036, 1.862325, 0.5168586, 1, 1, 1, 1, 1,
0.9397671, -0.3551737, 1.377099, 0, 0, 1, 1, 1,
0.9506061, -0.09183081, 1.483421, 1, 0, 0, 1, 1,
0.9524536, 0.8714966, 1.998634, 1, 0, 0, 1, 1,
0.9556698, 0.6125168, -0.08094725, 1, 0, 0, 1, 1,
0.9584842, 0.3812872, 1.029816, 1, 0, 0, 1, 1,
0.9639925, 1.284302, -1.115511, 1, 0, 0, 1, 1,
0.9743584, -0.03419755, 0.4650506, 0, 0, 0, 1, 1,
0.9840098, -0.6908687, 2.196685, 0, 0, 0, 1, 1,
0.9842061, -1.41907, 2.750829, 0, 0, 0, 1, 1,
0.9929221, 1.677998, -0.6159714, 0, 0, 0, 1, 1,
0.9969376, 0.9812088, 0.07675923, 0, 0, 0, 1, 1,
1.009642, -0.2739342, 1.437919, 0, 0, 0, 1, 1,
1.013102, -0.5150254, 1.204265, 0, 0, 0, 1, 1,
1.017992, 0.4707909, 1.987509, 1, 1, 1, 1, 1,
1.022445, 1.157792, -0.7837268, 1, 1, 1, 1, 1,
1.024524, 0.3092862, 0.7932997, 1, 1, 1, 1, 1,
1.024748, 0.4073569, 2.865649, 1, 1, 1, 1, 1,
1.025965, -2.690622, 3.106304, 1, 1, 1, 1, 1,
1.027338, -0.3372126, 2.36506, 1, 1, 1, 1, 1,
1.030876, -1.5032, 4.146314, 1, 1, 1, 1, 1,
1.036369, -0.346813, 2.870803, 1, 1, 1, 1, 1,
1.036947, 0.2066708, 2.622777, 1, 1, 1, 1, 1,
1.038437, 0.5461389, -0.0495777, 1, 1, 1, 1, 1,
1.039758, -0.7386835, 1.692013, 1, 1, 1, 1, 1,
1.041398, 0.1715513, 0.2075808, 1, 1, 1, 1, 1,
1.044805, 0.5320828, -0.1927516, 1, 1, 1, 1, 1,
1.045742, -1.421347, 3.715667, 1, 1, 1, 1, 1,
1.047177, -0.416575, 0.887246, 1, 1, 1, 1, 1,
1.048008, -1.153669, 1.42714, 0, 0, 1, 1, 1,
1.053403, -0.4494272, 1.920479, 1, 0, 0, 1, 1,
1.054593, -1.028463, 2.499599, 1, 0, 0, 1, 1,
1.056953, -1.725063, 1.838644, 1, 0, 0, 1, 1,
1.058026, 0.3190708, 0.7423435, 1, 0, 0, 1, 1,
1.08241, 0.5056646, 2.295865, 1, 0, 0, 1, 1,
1.087491, -0.3187043, 0.689679, 0, 0, 0, 1, 1,
1.091125, 0.2730358, 2.925063, 0, 0, 0, 1, 1,
1.093528, -1.270508, 3.783885, 0, 0, 0, 1, 1,
1.095246, -1.067629, 1.617991, 0, 0, 0, 1, 1,
1.096155, 0.4235218, -0.7702891, 0, 0, 0, 1, 1,
1.097262, 1.643015, 0.6911663, 0, 0, 0, 1, 1,
1.099021, 1.480306, 0.1600268, 0, 0, 0, 1, 1,
1.099662, -0.05229648, 3.788583, 1, 1, 1, 1, 1,
1.099687, -0.3334129, 3.052567, 1, 1, 1, 1, 1,
1.102998, -0.7056422, 2.821148, 1, 1, 1, 1, 1,
1.107298, -0.1667656, 0.6208779, 1, 1, 1, 1, 1,
1.110437, -1.407065, 3.22564, 1, 1, 1, 1, 1,
1.111369, -0.9851163, 1.438899, 1, 1, 1, 1, 1,
1.111703, 0.3661282, 1.607619, 1, 1, 1, 1, 1,
1.117257, 0.04531497, 2.94773, 1, 1, 1, 1, 1,
1.123831, 0.8197246, -0.2174273, 1, 1, 1, 1, 1,
1.124289, -0.532923, 0.2218764, 1, 1, 1, 1, 1,
1.125573, -0.04040409, 2.785036, 1, 1, 1, 1, 1,
1.130686, -2.484051, 4.338074, 1, 1, 1, 1, 1,
1.131263, -0.1228266, 2.174388, 1, 1, 1, 1, 1,
1.136363, 0.5332543, 2.230155, 1, 1, 1, 1, 1,
1.136425, -1.154446, 2.779099, 1, 1, 1, 1, 1,
1.137084, -0.5823287, 3.346156, 0, 0, 1, 1, 1,
1.145069, -1.131096, 2.191406, 1, 0, 0, 1, 1,
1.14905, 0.6861529, 1.640014, 1, 0, 0, 1, 1,
1.150021, -1.608813, 4.101089, 1, 0, 0, 1, 1,
1.158317, -0.1376104, 2.33359, 1, 0, 0, 1, 1,
1.164113, 1.039339, 2.1411, 1, 0, 0, 1, 1,
1.177193, 0.1283053, 0.5607358, 0, 0, 0, 1, 1,
1.180672, -1.533522, 3.431941, 0, 0, 0, 1, 1,
1.184737, 1.301944, -1.445498, 0, 0, 0, 1, 1,
1.188276, 0.7764261, -0.02138039, 0, 0, 0, 1, 1,
1.189473, 0.3392351, 3.227486, 0, 0, 0, 1, 1,
1.190149, -0.4871732, 0.8369564, 0, 0, 0, 1, 1,
1.198318, 0.2080201, 1.378289, 0, 0, 0, 1, 1,
1.204398, 0.2228068, 2.729474, 1, 1, 1, 1, 1,
1.213515, -0.07828123, 2.803034, 1, 1, 1, 1, 1,
1.214022, 0.8410327, 0.2105341, 1, 1, 1, 1, 1,
1.222614, 0.1106537, 0.5783417, 1, 1, 1, 1, 1,
1.231532, 0.4103565, 1.054008, 1, 1, 1, 1, 1,
1.232167, -1.668814, 3.12186, 1, 1, 1, 1, 1,
1.242692, -1.640007, 1.773248, 1, 1, 1, 1, 1,
1.243694, 0.2587244, 1.357992, 1, 1, 1, 1, 1,
1.262361, -0.1336548, 0.4718682, 1, 1, 1, 1, 1,
1.276673, 0.9599851, 2.216804, 1, 1, 1, 1, 1,
1.277397, -0.3773655, 2.010263, 1, 1, 1, 1, 1,
1.292174, 0.02314678, 1.523378, 1, 1, 1, 1, 1,
1.294341, -1.197755, 2.888235, 1, 1, 1, 1, 1,
1.294681, 0.05790703, 1.512248, 1, 1, 1, 1, 1,
1.295378, 0.1285649, 1.943676, 1, 1, 1, 1, 1,
1.29567, -0.8338195, 1.516904, 0, 0, 1, 1, 1,
1.299683, -0.2124265, 1.929588, 1, 0, 0, 1, 1,
1.300649, 1.072584, 3.070495, 1, 0, 0, 1, 1,
1.302558, 0.912664, 2.189424, 1, 0, 0, 1, 1,
1.309888, 0.01725504, 1.906507, 1, 0, 0, 1, 1,
1.333504, 0.6207575, 1.984548, 1, 0, 0, 1, 1,
1.340333, -0.03292755, 0.1606278, 0, 0, 0, 1, 1,
1.348676, 0.7897334, -0.401864, 0, 0, 0, 1, 1,
1.354372, 0.1271783, 2.388642, 0, 0, 0, 1, 1,
1.354909, -0.6799986, 1.824611, 0, 0, 0, 1, 1,
1.35531, -0.6213062, 1.523736, 0, 0, 0, 1, 1,
1.35665, 0.849007, 0.9683918, 0, 0, 0, 1, 1,
1.358461, -0.05660432, 1.500044, 0, 0, 0, 1, 1,
1.362837, -0.2460211, 1.82607, 1, 1, 1, 1, 1,
1.362856, 0.39572, 1.758817, 1, 1, 1, 1, 1,
1.366696, -2.183047, 3.935907, 1, 1, 1, 1, 1,
1.374948, 0.2601911, 1.501745, 1, 1, 1, 1, 1,
1.37989, -0.757162, -0.07098459, 1, 1, 1, 1, 1,
1.380975, 0.5671331, 1.10616, 1, 1, 1, 1, 1,
1.381309, -0.4062569, 0.3062676, 1, 1, 1, 1, 1,
1.388305, -0.2804542, 2.135525, 1, 1, 1, 1, 1,
1.392374, -0.2882221, 1.499882, 1, 1, 1, 1, 1,
1.414834, 0.3581637, 1.095604, 1, 1, 1, 1, 1,
1.416893, 1.142043, -0.08101726, 1, 1, 1, 1, 1,
1.422819, 0.2105847, 3.428918, 1, 1, 1, 1, 1,
1.426751, 0.07715577, 1.913289, 1, 1, 1, 1, 1,
1.432964, 1.562457, 0.669515, 1, 1, 1, 1, 1,
1.472425, -1.340577, 3.075589, 1, 1, 1, 1, 1,
1.498172, 0.1902213, 1.817634, 0, 0, 1, 1, 1,
1.502211, 2.011694, -0.01571642, 1, 0, 0, 1, 1,
1.507849, 0.1198775, 2.721915, 1, 0, 0, 1, 1,
1.514455, 1.853523, 3.161544, 1, 0, 0, 1, 1,
1.527465, 0.1426509, 1.289336, 1, 0, 0, 1, 1,
1.527866, -0.6849756, 2.172136, 1, 0, 0, 1, 1,
1.531334, -1.959174, 2.679969, 0, 0, 0, 1, 1,
1.535394, 0.03883107, 3.899407, 0, 0, 0, 1, 1,
1.542265, 1.205221, 0.2440631, 0, 0, 0, 1, 1,
1.549166, 1.419309, -0.08175698, 0, 0, 0, 1, 1,
1.552363, 0.6617146, 2.732986, 0, 0, 0, 1, 1,
1.555823, 0.07776748, 1.358075, 0, 0, 0, 1, 1,
1.557006, 0.04661504, 2.151775, 0, 0, 0, 1, 1,
1.570266, 0.5738264, 0.1607526, 1, 1, 1, 1, 1,
1.575509, 1.33108, 1.71441, 1, 1, 1, 1, 1,
1.578386, 0.6595294, 0.3610774, 1, 1, 1, 1, 1,
1.62954, -2.40925, 3.378814, 1, 1, 1, 1, 1,
1.643212, 0.3836057, 1.612708, 1, 1, 1, 1, 1,
1.655077, 0.4506557, 1.764525, 1, 1, 1, 1, 1,
1.681502, 0.01623505, 1.99025, 1, 1, 1, 1, 1,
1.697101, 1.84224, -0.124044, 1, 1, 1, 1, 1,
1.702462, 0.1814767, 0.6403231, 1, 1, 1, 1, 1,
1.712612, 0.9770793, 1.125663, 1, 1, 1, 1, 1,
1.712844, 0.7412773, 0.861256, 1, 1, 1, 1, 1,
1.723565, 0.2695057, 1.815055, 1, 1, 1, 1, 1,
1.735624, 0.9928715, 2.531469, 1, 1, 1, 1, 1,
1.801867, -0.2849921, 0.4297326, 1, 1, 1, 1, 1,
1.805551, 1.37618, 1.087944, 1, 1, 1, 1, 1,
1.813368, 0.8384085, 2.102942, 0, 0, 1, 1, 1,
1.813764, 0.88842, 1.458697, 1, 0, 0, 1, 1,
1.815692, 0.5806151, 0.4910583, 1, 0, 0, 1, 1,
1.825367, 0.1737528, 2.208951, 1, 0, 0, 1, 1,
1.860859, 0.5696042, 1.783008, 1, 0, 0, 1, 1,
1.874075, 0.1307143, -0.2865325, 1, 0, 0, 1, 1,
1.877616, 0.02547311, 1.137615, 0, 0, 0, 1, 1,
1.892149, 1.05795, 1.530316, 0, 0, 0, 1, 1,
1.90389, -0.2344632, -0.003336158, 0, 0, 0, 1, 1,
1.916299, 0.09709549, 3.061809, 0, 0, 0, 1, 1,
1.918777, -0.4826922, 1.894291, 0, 0, 0, 1, 1,
1.922152, 1.656011, 0.5796748, 0, 0, 0, 1, 1,
1.943898, -0.5012597, 1.749338, 0, 0, 0, 1, 1,
1.944196, 0.08408727, 2.360384, 1, 1, 1, 1, 1,
1.945115, -1.967654, 2.599719, 1, 1, 1, 1, 1,
1.957068, -0.3832917, 1.239511, 1, 1, 1, 1, 1,
1.976583, 0.6694708, 0.9346954, 1, 1, 1, 1, 1,
1.978887, -0.0994751, 3.055775, 1, 1, 1, 1, 1,
1.999467, 0.4222868, 1.930824, 1, 1, 1, 1, 1,
2.000507, 0.9811097, -0.6404055, 1, 1, 1, 1, 1,
2.003956, 0.6064539, 1.182618, 1, 1, 1, 1, 1,
2.021318, 0.5567105, 1.592064, 1, 1, 1, 1, 1,
2.021457, 1.761647, 1.180782, 1, 1, 1, 1, 1,
2.055264, -0.759308, 2.007629, 1, 1, 1, 1, 1,
2.097055, 1.60177, 1.112725, 1, 1, 1, 1, 1,
2.108038, 0.9501374, 0.5841516, 1, 1, 1, 1, 1,
2.131589, 0.06800322, -1.037625, 1, 1, 1, 1, 1,
2.165892, 1.357508, 0.02980706, 1, 1, 1, 1, 1,
2.171645, -0.5968282, 2.457883, 0, 0, 1, 1, 1,
2.207803, 0.9846395, 0.2140265, 1, 0, 0, 1, 1,
2.224477, -0.1123401, 0.4784129, 1, 0, 0, 1, 1,
2.285868, -0.2055575, 1.728563, 1, 0, 0, 1, 1,
2.313195, 1.812, 0.9090402, 1, 0, 0, 1, 1,
2.354033, -0.1575581, 0.6371436, 1, 0, 0, 1, 1,
2.375125, -0.648594, 1.74921, 0, 0, 0, 1, 1,
2.387845, 0.651699, 2.450732, 0, 0, 0, 1, 1,
2.471434, 0.6302448, 0.4662798, 0, 0, 0, 1, 1,
2.472013, -0.5187258, 0.5468405, 0, 0, 0, 1, 1,
2.516393, -2.131721, 1.213989, 0, 0, 0, 1, 1,
2.516489, -0.713773, 0.1616383, 0, 0, 0, 1, 1,
2.564886, 1.399717, 2.581061, 0, 0, 0, 1, 1,
2.602332, -0.223142, 0.9929489, 1, 1, 1, 1, 1,
2.662894, -0.3375617, 3.195584, 1, 1, 1, 1, 1,
2.735808, 0.7469451, 0.8070383, 1, 1, 1, 1, 1,
2.812383, 0.4969302, 1.201431, 1, 1, 1, 1, 1,
2.971974, 0.6888186, 2.299902, 1, 1, 1, 1, 1,
3.356605, -1.046275, 1.195328, 1, 1, 1, 1, 1,
3.880983, 1.208407, -0.3500505, 1, 1, 1, 1, 1
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
var radius = 9.582955;
var distance = 33.65973;
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
mvMatrix.translate( -0.5043508, -0.03338301, 0.003510237 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.65973);
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
