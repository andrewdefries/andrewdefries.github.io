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
-3.742265, 0.2316973, -2.331925, 1, 0, 0, 1,
-3.500542, -1.28636, -2.348427, 1, 0.007843138, 0, 1,
-3.482773, 0.06413259, -1.311729, 1, 0.01176471, 0, 1,
-3.360087, 0.5223825, -2.993344, 1, 0.01960784, 0, 1,
-2.841809, 1.707298, 0.4174092, 1, 0.02352941, 0, 1,
-2.617121, -0.4427482, -2.032569, 1, 0.03137255, 0, 1,
-2.570835, 2.867344, -0.06073362, 1, 0.03529412, 0, 1,
-2.520607, -1.488309, -2.000978, 1, 0.04313726, 0, 1,
-2.472242, -1.034406, -2.519793, 1, 0.04705882, 0, 1,
-2.456674, 0.5993954, -1.816226, 1, 0.05490196, 0, 1,
-2.41486, 0.6392049, 0.02035814, 1, 0.05882353, 0, 1,
-2.40935, -0.7308729, -3.646626, 1, 0.06666667, 0, 1,
-2.408684, -0.1147632, -0.6274535, 1, 0.07058824, 0, 1,
-2.3942, 0.1270807, -2.337118, 1, 0.07843138, 0, 1,
-2.381749, -0.4651615, -1.072784, 1, 0.08235294, 0, 1,
-2.31384, -0.07437275, -4.315653, 1, 0.09019608, 0, 1,
-2.313033, -0.4322394, -2.086794, 1, 0.09411765, 0, 1,
-2.265949, -2.63969, -1.822961, 1, 0.1019608, 0, 1,
-2.261769, 0.5682964, -2.170728, 1, 0.1098039, 0, 1,
-2.235978, 0.2200461, -0.8930163, 1, 0.1137255, 0, 1,
-2.202979, 1.222297, -2.232137, 1, 0.1215686, 0, 1,
-2.200101, 0.2149072, -3.997626, 1, 0.1254902, 0, 1,
-2.195984, 0.9780608, -0.3951888, 1, 0.1333333, 0, 1,
-2.192431, -0.1490229, -2.912627, 1, 0.1372549, 0, 1,
-2.154779, 2.375978, 0.111368, 1, 0.145098, 0, 1,
-2.146919, 1.301091, -1.974681, 1, 0.1490196, 0, 1,
-2.088417, -0.7903671, -1.787083, 1, 0.1568628, 0, 1,
-2.011897, 0.5192536, -0.2798213, 1, 0.1607843, 0, 1,
-2.011708, -1.048598, -2.088666, 1, 0.1686275, 0, 1,
-1.993518, -1.175226, -1.182287, 1, 0.172549, 0, 1,
-1.914369, 0.7609621, -2.65251, 1, 0.1803922, 0, 1,
-1.910301, 0.4312001, 0.1848715, 1, 0.1843137, 0, 1,
-1.907072, 0.8214387, 0.2228253, 1, 0.1921569, 0, 1,
-1.89376, -0.4193102, -0.7395747, 1, 0.1960784, 0, 1,
-1.893203, 0.07899828, -2.617186, 1, 0.2039216, 0, 1,
-1.892602, -0.08089058, -0.9977964, 1, 0.2117647, 0, 1,
-1.873904, -1.948844, -2.415168, 1, 0.2156863, 0, 1,
-1.859692, 0.991225, -2.67469, 1, 0.2235294, 0, 1,
-1.85223, -1.007876, -1.195796, 1, 0.227451, 0, 1,
-1.826101, 0.02329753, -1.680545, 1, 0.2352941, 0, 1,
-1.813753, -0.9832858, -0.7125214, 1, 0.2392157, 0, 1,
-1.804296, -1.151495, -2.168417, 1, 0.2470588, 0, 1,
-1.801782, 0.2649725, -2.331183, 1, 0.2509804, 0, 1,
-1.782325, -1.081519, -0.930554, 1, 0.2588235, 0, 1,
-1.754995, -1.436937, -2.858935, 1, 0.2627451, 0, 1,
-1.731807, 0.7785658, -1.167259, 1, 0.2705882, 0, 1,
-1.710082, -1.072032, -0.4909998, 1, 0.2745098, 0, 1,
-1.707466, -0.3350395, 1.014112, 1, 0.282353, 0, 1,
-1.698956, -2.256056, -1.416448, 1, 0.2862745, 0, 1,
-1.698717, -0.20822, -1.844929, 1, 0.2941177, 0, 1,
-1.670704, 0.4964387, -0.03234273, 1, 0.3019608, 0, 1,
-1.66808, 2.217174, 0.0472361, 1, 0.3058824, 0, 1,
-1.65148, 0.227145, -0.6742649, 1, 0.3137255, 0, 1,
-1.651316, -1.586549, -2.65075, 1, 0.3176471, 0, 1,
-1.646367, -0.3086745, -2.008769, 1, 0.3254902, 0, 1,
-1.645701, -1.623484, -2.271555, 1, 0.3294118, 0, 1,
-1.644767, -0.2644225, -4.052184, 1, 0.3372549, 0, 1,
-1.638477, 1.307697, -1.086856, 1, 0.3411765, 0, 1,
-1.626734, -0.03833082, -0.9114991, 1, 0.3490196, 0, 1,
-1.621809, -0.9975496, -2.458904, 1, 0.3529412, 0, 1,
-1.591955, -0.02219432, -1.795619, 1, 0.3607843, 0, 1,
-1.577734, 0.9629827, 1.136337, 1, 0.3647059, 0, 1,
-1.571068, 0.6518056, -0.8440203, 1, 0.372549, 0, 1,
-1.567324, 0.110187, -2.350063, 1, 0.3764706, 0, 1,
-1.536976, 0.6519544, -0.5507304, 1, 0.3843137, 0, 1,
-1.528654, -0.3862929, -1.33525, 1, 0.3882353, 0, 1,
-1.528562, -1.831009, -2.092725, 1, 0.3960784, 0, 1,
-1.51752, -0.5182685, -0.8384963, 1, 0.4039216, 0, 1,
-1.508091, 2.254339, -1.291651, 1, 0.4078431, 0, 1,
-1.48109, -1.537006, -2.880584, 1, 0.4156863, 0, 1,
-1.475982, -0.7485329, -1.439884, 1, 0.4196078, 0, 1,
-1.473836, 0.1483568, -1.0064, 1, 0.427451, 0, 1,
-1.46976, -0.3937389, -1.699581, 1, 0.4313726, 0, 1,
-1.46702, -2.861333, -3.821136, 1, 0.4392157, 0, 1,
-1.466899, 1.314081, -0.9550631, 1, 0.4431373, 0, 1,
-1.465639, 1.895283, -1.960182, 1, 0.4509804, 0, 1,
-1.465519, -0.6388179, -1.940893, 1, 0.454902, 0, 1,
-1.4648, 0.2361018, -0.511781, 1, 0.4627451, 0, 1,
-1.45426, -1.534247, -3.242782, 1, 0.4666667, 0, 1,
-1.453005, 2.003964, -0.2338302, 1, 0.4745098, 0, 1,
-1.448669, 0.9894419, -1.857983, 1, 0.4784314, 0, 1,
-1.438372, 1.519805, -0.6534315, 1, 0.4862745, 0, 1,
-1.435739, 0.4967866, -0.3374198, 1, 0.4901961, 0, 1,
-1.41877, 1.389589, -1.73126, 1, 0.4980392, 0, 1,
-1.403353, -1.431838, -2.128946, 1, 0.5058824, 0, 1,
-1.396716, 0.8291188, -1.745974, 1, 0.509804, 0, 1,
-1.392901, -0.3340912, -1.91294, 1, 0.5176471, 0, 1,
-1.391498, -0.3880598, -0.5581751, 1, 0.5215687, 0, 1,
-1.389475, 0.8290335, -1.745461, 1, 0.5294118, 0, 1,
-1.384805, -0.6436876, -2.815181, 1, 0.5333334, 0, 1,
-1.377961, -1.080973, -1.629864, 1, 0.5411765, 0, 1,
-1.365275, -0.6504175, -2.745428, 1, 0.5450981, 0, 1,
-1.361881, 2.275028, -1.566552, 1, 0.5529412, 0, 1,
-1.350431, 0.7349796, -0.7238228, 1, 0.5568628, 0, 1,
-1.344659, 1.714278, 0.5626035, 1, 0.5647059, 0, 1,
-1.329862, 0.9202438, 0.7040327, 1, 0.5686275, 0, 1,
-1.327035, -0.8268128, -0.9839025, 1, 0.5764706, 0, 1,
-1.321211, 1.544112, -0.6094903, 1, 0.5803922, 0, 1,
-1.317485, -1.079868, -1.114811, 1, 0.5882353, 0, 1,
-1.312339, 0.1756471, -3.086106, 1, 0.5921569, 0, 1,
-1.3117, 0.9676577, -0.2948033, 1, 0.6, 0, 1,
-1.305018, -0.1595281, -1.468377, 1, 0.6078432, 0, 1,
-1.300759, -1.429205, -0.6352735, 1, 0.6117647, 0, 1,
-1.287567, 0.06155407, 0.2573591, 1, 0.6196079, 0, 1,
-1.285935, 1.43786, -1.128321, 1, 0.6235294, 0, 1,
-1.285416, 0.1977763, -2.084965, 1, 0.6313726, 0, 1,
-1.280945, -1.595221, -1.178256, 1, 0.6352941, 0, 1,
-1.262367, 0.3308147, -2.910424, 1, 0.6431373, 0, 1,
-1.25426, -0.8738994, -1.767023, 1, 0.6470588, 0, 1,
-1.247212, -1.504513, -1.58475, 1, 0.654902, 0, 1,
-1.236886, 0.2284254, -0.5448245, 1, 0.6588235, 0, 1,
-1.235822, 0.5500456, 1.670993, 1, 0.6666667, 0, 1,
-1.232326, -0.6960135, -1.518191, 1, 0.6705883, 0, 1,
-1.225704, -0.5536533, -1.670949, 1, 0.6784314, 0, 1,
-1.22299, 0.4204374, -1.406821, 1, 0.682353, 0, 1,
-1.219891, 1.482008, -0.5216373, 1, 0.6901961, 0, 1,
-1.211244, -1.667445, -3.809582, 1, 0.6941177, 0, 1,
-1.20774, 1.343951, -1.196355, 1, 0.7019608, 0, 1,
-1.201604, -0.2034072, -2.954511, 1, 0.7098039, 0, 1,
-1.192384, -0.006271922, -0.7363488, 1, 0.7137255, 0, 1,
-1.191258, -1.438749, -1.283476, 1, 0.7215686, 0, 1,
-1.181673, 1.346902, -0.1721305, 1, 0.7254902, 0, 1,
-1.173804, 0.5944063, -1.440976, 1, 0.7333333, 0, 1,
-1.151709, 1.481617, -0.3333744, 1, 0.7372549, 0, 1,
-1.144219, 0.2915905, 1.414623, 1, 0.7450981, 0, 1,
-1.143244, 1.102826, -0.8515671, 1, 0.7490196, 0, 1,
-1.131819, -0.05178769, -2.667721, 1, 0.7568628, 0, 1,
-1.126408, 1.975709, -0.5296041, 1, 0.7607843, 0, 1,
-1.125923, -0.5643031, -4.289011, 1, 0.7686275, 0, 1,
-1.116128, -1.556372, -2.266121, 1, 0.772549, 0, 1,
-1.103898, 1.226009, -0.8741244, 1, 0.7803922, 0, 1,
-1.089557, 0.02553944, -0.3452862, 1, 0.7843137, 0, 1,
-1.084243, -0.2436416, -1.927043, 1, 0.7921569, 0, 1,
-1.07838, -1.028316, -1.671302, 1, 0.7960784, 0, 1,
-1.073075, 0.1622938, 1.282946, 1, 0.8039216, 0, 1,
-1.061815, 1.79398, -2.010058, 1, 0.8117647, 0, 1,
-1.059207, 0.8586767, -0.6751234, 1, 0.8156863, 0, 1,
-1.057834, 0.1397771, -0.4328007, 1, 0.8235294, 0, 1,
-1.055985, -1.656974, -2.8993, 1, 0.827451, 0, 1,
-1.054194, 0.2333294, -1.813231, 1, 0.8352941, 0, 1,
-1.045624, -0.537401, -2.216605, 1, 0.8392157, 0, 1,
-1.035899, -0.4862103, -2.474874, 1, 0.8470588, 0, 1,
-1.034019, 1.37995, 0.2014037, 1, 0.8509804, 0, 1,
-1.027621, 0.09174946, -0.68193, 1, 0.8588235, 0, 1,
-1.020532, 0.03112796, -2.394407, 1, 0.8627451, 0, 1,
-1.019227, -1.333212, -2.095514, 1, 0.8705882, 0, 1,
-1.016488, 0.204879, -1.836707, 1, 0.8745098, 0, 1,
-1.010234, -0.1841481, -1.353699, 1, 0.8823529, 0, 1,
-0.9895808, 0.3468415, -0.4662349, 1, 0.8862745, 0, 1,
-0.985634, -1.012031, -2.421071, 1, 0.8941177, 0, 1,
-0.9850339, -1.283937, -1.113793, 1, 0.8980392, 0, 1,
-0.984062, 1.182209, -2.42566, 1, 0.9058824, 0, 1,
-0.9784263, -0.3555793, -2.445531, 1, 0.9137255, 0, 1,
-0.9759337, 0.3453558, -2.891082, 1, 0.9176471, 0, 1,
-0.9663908, 0.4239205, -2.007723, 1, 0.9254902, 0, 1,
-0.9657514, 0.4416132, -1.833801, 1, 0.9294118, 0, 1,
-0.9648296, 0.5072594, -2.534947, 1, 0.9372549, 0, 1,
-0.9625619, -0.9876283, -2.287376, 1, 0.9411765, 0, 1,
-0.9583825, -0.5661845, -2.63337, 1, 0.9490196, 0, 1,
-0.9571801, -0.007605423, -0.2955249, 1, 0.9529412, 0, 1,
-0.9543946, 0.2633296, -0.6228711, 1, 0.9607843, 0, 1,
-0.9528691, 0.7158597, -1.840928, 1, 0.9647059, 0, 1,
-0.9525661, 0.9904767, -2.878254, 1, 0.972549, 0, 1,
-0.943478, -2.326159, -3.781193, 1, 0.9764706, 0, 1,
-0.9392403, 1.383933, 0.4538476, 1, 0.9843137, 0, 1,
-0.9380503, -0.1785383, -1.512732, 1, 0.9882353, 0, 1,
-0.9299549, 0.1821494, -1.696935, 1, 0.9960784, 0, 1,
-0.9290613, 2.014825, -0.3226138, 0.9960784, 1, 0, 1,
-0.9198558, -0.2826273, -2.082052, 0.9921569, 1, 0, 1,
-0.9160155, 2.749156, 0.3130809, 0.9843137, 1, 0, 1,
-0.9115088, 0.5350066, -1.30856, 0.9803922, 1, 0, 1,
-0.9074592, -0.3850921, -1.279573, 0.972549, 1, 0, 1,
-0.9026453, 0.5412127, -2.136969, 0.9686275, 1, 0, 1,
-0.9018353, 1.92325, -1.333265, 0.9607843, 1, 0, 1,
-0.8996676, 0.5324583, -0.7394204, 0.9568627, 1, 0, 1,
-0.8995107, -0.786347, -1.256118, 0.9490196, 1, 0, 1,
-0.8993111, -1.066264, -4.022619, 0.945098, 1, 0, 1,
-0.8969151, 0.2591099, -1.604636, 0.9372549, 1, 0, 1,
-0.8946897, 1.467106, -0.1800798, 0.9333333, 1, 0, 1,
-0.8918738, -0.7268059, -2.425528, 0.9254902, 1, 0, 1,
-0.8908589, 0.7590908, -1.699313, 0.9215686, 1, 0, 1,
-0.886008, -0.09509403, -1.998826, 0.9137255, 1, 0, 1,
-0.8837301, -0.8212071, -1.184659, 0.9098039, 1, 0, 1,
-0.8742719, -1.733613, -4.949761, 0.9019608, 1, 0, 1,
-0.8739576, -0.9890987, -1.345685, 0.8941177, 1, 0, 1,
-0.8711439, 0.09310874, -1.608227, 0.8901961, 1, 0, 1,
-0.8691369, 1.136583, 1.125519, 0.8823529, 1, 0, 1,
-0.8664182, -0.2777685, -0.613784, 0.8784314, 1, 0, 1,
-0.8660535, -0.1494434, -0.2564147, 0.8705882, 1, 0, 1,
-0.8651472, -1.091052, -4.003775, 0.8666667, 1, 0, 1,
-0.8556775, 0.6127523, -0.797581, 0.8588235, 1, 0, 1,
-0.8511288, 1.692906, -0.1765113, 0.854902, 1, 0, 1,
-0.8497081, 0.9716076, -1.467652, 0.8470588, 1, 0, 1,
-0.8469179, 1.289486, 0.1694554, 0.8431373, 1, 0, 1,
-0.8449615, -0.8938223, -3.87274, 0.8352941, 1, 0, 1,
-0.8316048, -1.466545, -1.645336, 0.8313726, 1, 0, 1,
-0.8281135, -0.2233105, -3.486485, 0.8235294, 1, 0, 1,
-0.8278727, 0.6689777, -0.6350961, 0.8196079, 1, 0, 1,
-0.8260338, -0.5688451, -1.690628, 0.8117647, 1, 0, 1,
-0.8244529, -0.2578092, -3.448011, 0.8078431, 1, 0, 1,
-0.8244439, 2.615428, -1.322198, 0.8, 1, 0, 1,
-0.8237944, 0.1713224, -1.656068, 0.7921569, 1, 0, 1,
-0.8230389, 1.010956, -0.9872057, 0.7882353, 1, 0, 1,
-0.8188919, -0.9678778, -1.523678, 0.7803922, 1, 0, 1,
-0.8180523, 0.3421441, -1.12517, 0.7764706, 1, 0, 1,
-0.8177122, -0.03849676, -2.414349, 0.7686275, 1, 0, 1,
-0.8169767, -0.295265, -3.114567, 0.7647059, 1, 0, 1,
-0.8164879, 0.148387, -1.791293, 0.7568628, 1, 0, 1,
-0.8149493, -0.7236143, -2.893013, 0.7529412, 1, 0, 1,
-0.8143576, -0.9400015, -1.858948, 0.7450981, 1, 0, 1,
-0.8133554, 0.489034, -2.826697, 0.7411765, 1, 0, 1,
-0.8131061, -2.251907, -2.881731, 0.7333333, 1, 0, 1,
-0.8112605, -2.006585, -2.540352, 0.7294118, 1, 0, 1,
-0.805404, -0.7293456, -2.717424, 0.7215686, 1, 0, 1,
-0.8032869, -3.058938, -4.082969, 0.7176471, 1, 0, 1,
-0.7991084, 0.4698946, -2.641169, 0.7098039, 1, 0, 1,
-0.7988993, 0.4140931, -0.1530813, 0.7058824, 1, 0, 1,
-0.7943347, -1.100888, -1.697772, 0.6980392, 1, 0, 1,
-0.7892302, 0.4647059, -0.9159354, 0.6901961, 1, 0, 1,
-0.782252, -1.109108, -2.037667, 0.6862745, 1, 0, 1,
-0.7766012, 1.174725, 1.800149, 0.6784314, 1, 0, 1,
-0.7701955, 2.714811, 1.055996, 0.6745098, 1, 0, 1,
-0.7646869, 1.772409, -2.088887, 0.6666667, 1, 0, 1,
-0.7592801, -0.484342, -0.4889081, 0.6627451, 1, 0, 1,
-0.7561128, -0.235661, -2.145118, 0.654902, 1, 0, 1,
-0.7514923, 1.10311, 0.6464365, 0.6509804, 1, 0, 1,
-0.7387876, -0.1657575, -1.763583, 0.6431373, 1, 0, 1,
-0.7377805, -0.5514721, -2.570276, 0.6392157, 1, 0, 1,
-0.7247981, 0.8129011, -0.2224626, 0.6313726, 1, 0, 1,
-0.7242846, -0.2166964, -1.90541, 0.627451, 1, 0, 1,
-0.7227547, 0.05806534, -1.93002, 0.6196079, 1, 0, 1,
-0.7176593, 1.9564, -0.8219395, 0.6156863, 1, 0, 1,
-0.716745, 0.6297672, -1.724202, 0.6078432, 1, 0, 1,
-0.7148756, 1.090994, 0.2166145, 0.6039216, 1, 0, 1,
-0.7139461, 0.3001423, -1.357608, 0.5960785, 1, 0, 1,
-0.7130463, -0.06215203, -0.8006403, 0.5882353, 1, 0, 1,
-0.7070259, -0.6200418, -2.353308, 0.5843138, 1, 0, 1,
-0.7045551, -1.982126, -1.98336, 0.5764706, 1, 0, 1,
-0.7021798, 0.5606112, -0.4006754, 0.572549, 1, 0, 1,
-0.695279, 0.4360311, -0.0398491, 0.5647059, 1, 0, 1,
-0.6942344, -0.3863665, -1.926902, 0.5607843, 1, 0, 1,
-0.6901148, -1.259699, -2.620597, 0.5529412, 1, 0, 1,
-0.6818002, -1.009924, -2.129368, 0.5490196, 1, 0, 1,
-0.6807594, 0.5249479, -1.449063, 0.5411765, 1, 0, 1,
-0.6720111, 1.657856, -1.267789, 0.5372549, 1, 0, 1,
-0.6667309, 0.3972494, -2.296703, 0.5294118, 1, 0, 1,
-0.6627353, -1.294073, -2.88199, 0.5254902, 1, 0, 1,
-0.6593423, -0.5563221, -1.143406, 0.5176471, 1, 0, 1,
-0.6577597, 0.5893085, -0.7547637, 0.5137255, 1, 0, 1,
-0.6517301, -1.526065, -1.803208, 0.5058824, 1, 0, 1,
-0.6495684, 0.5271978, -1.102241, 0.5019608, 1, 0, 1,
-0.6487423, 0.6541396, -2.22712, 0.4941176, 1, 0, 1,
-0.6428648, 0.4240969, -1.492718, 0.4862745, 1, 0, 1,
-0.6413401, 0.4811949, -3.497408, 0.4823529, 1, 0, 1,
-0.6409093, -0.2092793, -1.466666, 0.4745098, 1, 0, 1,
-0.6365103, -1.685623, -3.450136, 0.4705882, 1, 0, 1,
-0.6361856, -0.04236321, -2.900857, 0.4627451, 1, 0, 1,
-0.6306489, -1.680095, -3.820042, 0.4588235, 1, 0, 1,
-0.6269152, -0.988876, -4.270854, 0.4509804, 1, 0, 1,
-0.6208474, -0.9393643, -3.783638, 0.4470588, 1, 0, 1,
-0.6168305, -0.4584992, -1.532446, 0.4392157, 1, 0, 1,
-0.6120491, 1.974707, -2.813739, 0.4352941, 1, 0, 1,
-0.6114633, 0.7293277, -3.058435, 0.427451, 1, 0, 1,
-0.6105631, 0.4206743, -0.2439038, 0.4235294, 1, 0, 1,
-0.6083392, -0.7443815, -2.264817, 0.4156863, 1, 0, 1,
-0.6049217, 1.705764, -0.4933728, 0.4117647, 1, 0, 1,
-0.6040075, 0.5418112, 0.05262409, 0.4039216, 1, 0, 1,
-0.6021162, 0.4537907, -0.327242, 0.3960784, 1, 0, 1,
-0.5800471, 1.539064, -1.035309, 0.3921569, 1, 0, 1,
-0.5798345, -1.2784, -3.864506, 0.3843137, 1, 0, 1,
-0.5792683, -1.593775, -3.57162, 0.3803922, 1, 0, 1,
-0.5785313, -1.316422, -2.355126, 0.372549, 1, 0, 1,
-0.577172, 0.756819, -2.730557, 0.3686275, 1, 0, 1,
-0.5766841, 0.4881614, -0.2068512, 0.3607843, 1, 0, 1,
-0.5749991, -1.997603, -3.987239, 0.3568628, 1, 0, 1,
-0.5747355, -0.1824371, -2.270992, 0.3490196, 1, 0, 1,
-0.5694535, 0.6545624, -1.015509, 0.345098, 1, 0, 1,
-0.5672852, -0.5671271, -1.248439, 0.3372549, 1, 0, 1,
-0.5588406, 1.053571, -1.015122, 0.3333333, 1, 0, 1,
-0.5565461, -1.171516, -2.290027, 0.3254902, 1, 0, 1,
-0.5532801, -2.654667, -1.918013, 0.3215686, 1, 0, 1,
-0.5530998, -0.7818472, -2.662923, 0.3137255, 1, 0, 1,
-0.5519035, 0.4100267, -0.7142707, 0.3098039, 1, 0, 1,
-0.5506459, -0.3353686, -1.751033, 0.3019608, 1, 0, 1,
-0.5444691, -0.550639, -1.549061, 0.2941177, 1, 0, 1,
-0.5438215, -0.287089, -1.365139, 0.2901961, 1, 0, 1,
-0.5400447, -0.5332149, -0.5780079, 0.282353, 1, 0, 1,
-0.5379982, -0.1884829, -1.824324, 0.2784314, 1, 0, 1,
-0.5332187, 0.5877805, -2.028425, 0.2705882, 1, 0, 1,
-0.527181, 0.3162213, 0.1381153, 0.2666667, 1, 0, 1,
-0.5270594, -0.541818, -0.3246551, 0.2588235, 1, 0, 1,
-0.5264135, 0.1785767, -1.562513, 0.254902, 1, 0, 1,
-0.5232834, -0.2802811, -2.176269, 0.2470588, 1, 0, 1,
-0.5223291, -0.3312443, -1.083153, 0.2431373, 1, 0, 1,
-0.5187897, -0.002899741, 0.3458546, 0.2352941, 1, 0, 1,
-0.5119002, 1.428651, -1.909302, 0.2313726, 1, 0, 1,
-0.5057418, -0.8858499, -1.647277, 0.2235294, 1, 0, 1,
-0.4973705, -1.796367, -4.326669, 0.2196078, 1, 0, 1,
-0.4961128, -0.3004059, -3.368062, 0.2117647, 1, 0, 1,
-0.4938487, 0.2316461, -0.693308, 0.2078431, 1, 0, 1,
-0.4893199, -1.27958, -1.685323, 0.2, 1, 0, 1,
-0.483946, 0.3313741, -1.766786, 0.1921569, 1, 0, 1,
-0.4821565, -1.07566, -1.722768, 0.1882353, 1, 0, 1,
-0.4780409, -0.9841753, -0.9297671, 0.1803922, 1, 0, 1,
-0.4736747, -0.4524703, -3.57939, 0.1764706, 1, 0, 1,
-0.468976, -1.585683, -2.438401, 0.1686275, 1, 0, 1,
-0.468769, 1.277963, -2.222672, 0.1647059, 1, 0, 1,
-0.4663305, 0.9007095, 0.2001504, 0.1568628, 1, 0, 1,
-0.4652206, -0.1206877, -2.461351, 0.1529412, 1, 0, 1,
-0.4631097, 1.30926, 1.428358, 0.145098, 1, 0, 1,
-0.4621428, 0.2639061, -1.956496, 0.1411765, 1, 0, 1,
-0.4601084, 1.434552, -1.189659, 0.1333333, 1, 0, 1,
-0.4566889, -0.2188653, -2.154938, 0.1294118, 1, 0, 1,
-0.4553577, -0.8090045, -2.748008, 0.1215686, 1, 0, 1,
-0.4532607, 0.1420488, -0.300114, 0.1176471, 1, 0, 1,
-0.4530192, 0.1191368, 0.3139669, 0.1098039, 1, 0, 1,
-0.4526665, 1.726282, -0.2857654, 0.1058824, 1, 0, 1,
-0.4435244, 0.5897567, 0.9715998, 0.09803922, 1, 0, 1,
-0.4394304, 2.250434, -0.9447908, 0.09019608, 1, 0, 1,
-0.437577, -1.140618, -3.073315, 0.08627451, 1, 0, 1,
-0.4353014, -0.04356643, -4.049094, 0.07843138, 1, 0, 1,
-0.4278184, 1.289034, -0.3848731, 0.07450981, 1, 0, 1,
-0.4239058, 1.116773, 0.8533801, 0.06666667, 1, 0, 1,
-0.4236989, -0.1154734, -2.754071, 0.0627451, 1, 0, 1,
-0.4229859, -1.085427, -2.994727, 0.05490196, 1, 0, 1,
-0.4210646, 0.3962519, -0.4516214, 0.05098039, 1, 0, 1,
-0.4175719, 0.4641575, -0.939651, 0.04313726, 1, 0, 1,
-0.4172858, 0.5934387, -3.177745, 0.03921569, 1, 0, 1,
-0.4106879, -1.587875, -2.671487, 0.03137255, 1, 0, 1,
-0.4071909, 1.491438, -0.03777248, 0.02745098, 1, 0, 1,
-0.4013294, -0.02806623, -1.689221, 0.01960784, 1, 0, 1,
-0.3940119, -0.9922889, -3.265615, 0.01568628, 1, 0, 1,
-0.3932348, 1.4654, 1.396089, 0.007843138, 1, 0, 1,
-0.3911538, -0.3664403, -2.143513, 0.003921569, 1, 0, 1,
-0.3897061, -0.2695037, -1.92917, 0, 1, 0.003921569, 1,
-0.3887755, 1.731453, 0.2006924, 0, 1, 0.01176471, 1,
-0.3867796, 0.005214304, -0.395242, 0, 1, 0.01568628, 1,
-0.3865834, 0.4246967, -0.05684059, 0, 1, 0.02352941, 1,
-0.3780523, 1.922642, -1.130271, 0, 1, 0.02745098, 1,
-0.3750769, 0.2325036, -1.415396, 0, 1, 0.03529412, 1,
-0.3731727, 2.736998, 0.1455165, 0, 1, 0.03921569, 1,
-0.3722343, -0.5009305, -2.259219, 0, 1, 0.04705882, 1,
-0.3678319, -2.443435, -1.586314, 0, 1, 0.05098039, 1,
-0.3656298, 0.06995092, -2.654446, 0, 1, 0.05882353, 1,
-0.3621685, -2.544824, -2.01698, 0, 1, 0.0627451, 1,
-0.362015, -0.7293704, -5.065744, 0, 1, 0.07058824, 1,
-0.3609106, -0.6323683, -1.598912, 0, 1, 0.07450981, 1,
-0.3588063, 1.202347, -0.04498348, 0, 1, 0.08235294, 1,
-0.356944, -1.20631, -3.031191, 0, 1, 0.08627451, 1,
-0.3569038, -0.5079013, -2.023591, 0, 1, 0.09411765, 1,
-0.3485164, 0.3525453, -0.4309508, 0, 1, 0.1019608, 1,
-0.3453049, 1.693392, -1.081043, 0, 1, 0.1058824, 1,
-0.3444414, 0.6909744, 1.235216, 0, 1, 0.1137255, 1,
-0.3412155, -0.3600414, -2.474531, 0, 1, 0.1176471, 1,
-0.3386922, 0.2029689, -2.401784, 0, 1, 0.1254902, 1,
-0.3378107, -0.7111321, -2.735031, 0, 1, 0.1294118, 1,
-0.333863, 0.07609848, -2.077802, 0, 1, 0.1372549, 1,
-0.3318727, -0.4808894, -1.965829, 0, 1, 0.1411765, 1,
-0.329622, 0.06778032, -1.103816, 0, 1, 0.1490196, 1,
-0.32914, 0.2840464, -1.394937, 0, 1, 0.1529412, 1,
-0.3289141, -0.1364768, -3.629199, 0, 1, 0.1607843, 1,
-0.3268363, -0.5044932, -2.127126, 0, 1, 0.1647059, 1,
-0.3206741, -0.6780868, -1.645116, 0, 1, 0.172549, 1,
-0.3174166, -1.367302, -1.81922, 0, 1, 0.1764706, 1,
-0.3172934, 0.06675986, 0.3553837, 0, 1, 0.1843137, 1,
-0.3139033, 0.5541748, -0.8112804, 0, 1, 0.1882353, 1,
-0.3110744, 0.115477, -1.007325, 0, 1, 0.1960784, 1,
-0.3104575, -0.6647507, -1.908415, 0, 1, 0.2039216, 1,
-0.310068, -1.842265, -0.8231211, 0, 1, 0.2078431, 1,
-0.3084624, -1.070999, -2.800526, 0, 1, 0.2156863, 1,
-0.2967329, -0.2884451, -4.251181, 0, 1, 0.2196078, 1,
-0.2963889, -0.4484845, -2.656124, 0, 1, 0.227451, 1,
-0.2948384, 1.08974, -0.2780333, 0, 1, 0.2313726, 1,
-0.2930392, -2.085126, -4.124369, 0, 1, 0.2392157, 1,
-0.2860515, -0.8194284, -1.965072, 0, 1, 0.2431373, 1,
-0.2850631, -0.5128922, -2.341717, 0, 1, 0.2509804, 1,
-0.2850361, -0.8814406, -2.781782, 0, 1, 0.254902, 1,
-0.2831282, -0.3013193, -1.437916, 0, 1, 0.2627451, 1,
-0.2827011, 1.376397, -0.4436342, 0, 1, 0.2666667, 1,
-0.2787587, 0.1963893, -2.415837, 0, 1, 0.2745098, 1,
-0.2721084, -2.660465, -2.058196, 0, 1, 0.2784314, 1,
-0.2688688, -0.9167283, -2.975962, 0, 1, 0.2862745, 1,
-0.2673169, -0.2809206, -2.724028, 0, 1, 0.2901961, 1,
-0.2619427, -0.1464927, -1.154809, 0, 1, 0.2980392, 1,
-0.2611795, -0.8136887, -3.716319, 0, 1, 0.3058824, 1,
-0.2599036, -0.6520941, -2.659337, 0, 1, 0.3098039, 1,
-0.2526622, 0.1840362, -0.8832242, 0, 1, 0.3176471, 1,
-0.2508242, -0.820219, -3.342107, 0, 1, 0.3215686, 1,
-0.2495133, -0.6237805, -2.472827, 0, 1, 0.3294118, 1,
-0.2460456, 0.02723177, -2.939058, 0, 1, 0.3333333, 1,
-0.2398534, 0.5964566, 0.1146763, 0, 1, 0.3411765, 1,
-0.2397345, 1.337704, 0.8127396, 0, 1, 0.345098, 1,
-0.230794, 0.5843063, 0.8169432, 0, 1, 0.3529412, 1,
-0.2295891, -1.711488, -4.757204, 0, 1, 0.3568628, 1,
-0.2274627, -0.4086974, -3.71838, 0, 1, 0.3647059, 1,
-0.2263344, 1.530596, 0.5298865, 0, 1, 0.3686275, 1,
-0.2207098, 0.5226177, 1.603284, 0, 1, 0.3764706, 1,
-0.2151207, 2.198381, 1.802458, 0, 1, 0.3803922, 1,
-0.2135613, 1.085634, -1.629353, 0, 1, 0.3882353, 1,
-0.2127057, -0.4550007, -2.506816, 0, 1, 0.3921569, 1,
-0.2068421, 0.2179921, 1.004288, 0, 1, 0.4, 1,
-0.2061551, 0.4853903, -0.2180174, 0, 1, 0.4078431, 1,
-0.2042577, 0.005134039, -0.1759911, 0, 1, 0.4117647, 1,
-0.2028435, -0.8737088, -1.397946, 0, 1, 0.4196078, 1,
-0.1980531, 0.921465, -0.4945407, 0, 1, 0.4235294, 1,
-0.1932077, 0.01109148, -2.219554, 0, 1, 0.4313726, 1,
-0.1926681, 0.1472429, -1.694754, 0, 1, 0.4352941, 1,
-0.1909811, -0.6463584, -2.302937, 0, 1, 0.4431373, 1,
-0.1906514, -1.49982, -4.968783, 0, 1, 0.4470588, 1,
-0.1901978, 1.659176, -1.113759, 0, 1, 0.454902, 1,
-0.1900628, -0.7943457, -2.768517, 0, 1, 0.4588235, 1,
-0.1886964, -0.6566643, -4.002379, 0, 1, 0.4666667, 1,
-0.1836755, 1.075064, 0.2179532, 0, 1, 0.4705882, 1,
-0.1812962, 1.326396, -1.078389, 0, 1, 0.4784314, 1,
-0.1802081, 1.201614, -0.2032265, 0, 1, 0.4823529, 1,
-0.1787643, -0.4803425, -3.54577, 0, 1, 0.4901961, 1,
-0.1760547, 0.5103864, -0.7230628, 0, 1, 0.4941176, 1,
-0.1671859, 2.681265, -0.9574495, 0, 1, 0.5019608, 1,
-0.1659233, -0.2972685, -0.9216787, 0, 1, 0.509804, 1,
-0.1610839, 0.3617161, -0.02260992, 0, 1, 0.5137255, 1,
-0.1594476, -0.1958803, -0.9233353, 0, 1, 0.5215687, 1,
-0.1557791, -0.005326343, -2.806064, 0, 1, 0.5254902, 1,
-0.1438609, -0.6092349, -3.171816, 0, 1, 0.5333334, 1,
-0.1412134, 1.635628, -0.5458, 0, 1, 0.5372549, 1,
-0.1409365, -0.5390378, -1.427678, 0, 1, 0.5450981, 1,
-0.1405749, -0.6895242, -2.278546, 0, 1, 0.5490196, 1,
-0.1403601, 1.435697, -0.4916274, 0, 1, 0.5568628, 1,
-0.1400162, -1.781698, -2.331866, 0, 1, 0.5607843, 1,
-0.1393883, 0.4469788, 1.322349, 0, 1, 0.5686275, 1,
-0.1350812, 0.4874887, -1.083459, 0, 1, 0.572549, 1,
-0.1326247, -0.7402132, -3.612809, 0, 1, 0.5803922, 1,
-0.1299449, -0.5901828, -3.857885, 0, 1, 0.5843138, 1,
-0.1298699, 0.2106875, -1.159712, 0, 1, 0.5921569, 1,
-0.1249366, 0.1288075, -0.8355613, 0, 1, 0.5960785, 1,
-0.1240772, -0.6565554, -3.1192, 0, 1, 0.6039216, 1,
-0.1186586, -0.3425148, -2.369219, 0, 1, 0.6117647, 1,
-0.1146444, 0.8492453, 2.175939, 0, 1, 0.6156863, 1,
-0.1107426, 1.229157, -0.3666236, 0, 1, 0.6235294, 1,
-0.1103903, -0.02111778, -1.013439, 0, 1, 0.627451, 1,
-0.1095317, -0.1566471, -3.043129, 0, 1, 0.6352941, 1,
-0.1077549, 0.2058015, 0.2320753, 0, 1, 0.6392157, 1,
-0.1061974, -0.01358567, -2.985425, 0, 1, 0.6470588, 1,
-0.1007907, 0.2181688, 0.2656775, 0, 1, 0.6509804, 1,
-0.1004508, 0.09709673, 1.07789, 0, 1, 0.6588235, 1,
-0.1002418, 0.1264062, -0.8292438, 0, 1, 0.6627451, 1,
-0.09744352, 1.18543, 1.189646, 0, 1, 0.6705883, 1,
-0.095029, 0.8828855, 0.6096944, 0, 1, 0.6745098, 1,
-0.09491949, -1.412886, -3.59277, 0, 1, 0.682353, 1,
-0.09315325, -0.2791928, -2.056053, 0, 1, 0.6862745, 1,
-0.09314563, -2.108586, -3.363727, 0, 1, 0.6941177, 1,
-0.08553671, 2.289962, 0.3402227, 0, 1, 0.7019608, 1,
-0.08261015, 0.6238126, 0.06066916, 0, 1, 0.7058824, 1,
-0.07505088, 0.5634339, -0.1393361, 0, 1, 0.7137255, 1,
-0.07248179, -0.2583603, -1.713305, 0, 1, 0.7176471, 1,
-0.07070037, -0.006393832, -0.4396859, 0, 1, 0.7254902, 1,
-0.06669324, 0.5412229, 0.6123801, 0, 1, 0.7294118, 1,
-0.06180695, 1.631846, 0.128255, 0, 1, 0.7372549, 1,
-0.06000509, 0.7562624, -1.04403, 0, 1, 0.7411765, 1,
-0.05782215, -1.477141, -4.038183, 0, 1, 0.7490196, 1,
-0.05545014, -0.106577, -3.239881, 0, 1, 0.7529412, 1,
-0.0552266, 0.3749169, 0.4803981, 0, 1, 0.7607843, 1,
-0.05510633, -0.9167652, -2.271013, 0, 1, 0.7647059, 1,
-0.05485718, 0.4327412, -0.4780526, 0, 1, 0.772549, 1,
-0.05326464, -0.3796192, -0.3851543, 0, 1, 0.7764706, 1,
-0.05135635, 1.560055, 0.6084366, 0, 1, 0.7843137, 1,
-0.04825398, 0.03063059, -1.219612, 0, 1, 0.7882353, 1,
-0.04754597, 0.3335408, 0.4092512, 0, 1, 0.7960784, 1,
-0.04702001, 0.4440862, -0.9779565, 0, 1, 0.8039216, 1,
-0.04025595, -1.94781, -4.175911, 0, 1, 0.8078431, 1,
-0.04003519, 0.7044726, -1.65729, 0, 1, 0.8156863, 1,
-0.03801396, -0.7031894, -3.699035, 0, 1, 0.8196079, 1,
-0.03768854, -0.6993655, -2.330652, 0, 1, 0.827451, 1,
-0.0338039, 0.06813591, -1.645544, 0, 1, 0.8313726, 1,
-0.03339596, -0.1425938, -2.45244, 0, 1, 0.8392157, 1,
-0.03218747, -1.039651, -1.8333, 0, 1, 0.8431373, 1,
-0.03134323, 0.8915465, 1.740765, 0, 1, 0.8509804, 1,
-0.02792781, 1.374244, 0.3888539, 0, 1, 0.854902, 1,
-0.02229537, 0.0005628659, -2.505923, 0, 1, 0.8627451, 1,
-0.0199473, -0.8687212, -2.709339, 0, 1, 0.8666667, 1,
-0.01981742, 1.082341, -0.4844116, 0, 1, 0.8745098, 1,
-0.0192895, 0.03578065, -0.4114133, 0, 1, 0.8784314, 1,
-0.01126032, -1.118954, -2.880507, 0, 1, 0.8862745, 1,
-0.01060124, -0.6771371, -3.638755, 0, 1, 0.8901961, 1,
-0.00954987, 0.1454182, 0.1802315, 0, 1, 0.8980392, 1,
-0.005447928, -2.275083, -1.983885, 0, 1, 0.9058824, 1,
-0.003749179, 0.906772, 1.328144, 0, 1, 0.9098039, 1,
-6.055788e-05, -0.02578923, -4.75005, 0, 1, 0.9176471, 1,
0.002221076, 1.104692, 0.151312, 0, 1, 0.9215686, 1,
0.006549896, 1.192867, -0.4015616, 0, 1, 0.9294118, 1,
0.006568603, -0.1187133, 1.854144, 0, 1, 0.9333333, 1,
0.007301386, -1.615281, 2.326821, 0, 1, 0.9411765, 1,
0.008359779, -0.5121653, 3.307812, 0, 1, 0.945098, 1,
0.009693155, -0.318844, 1.529143, 0, 1, 0.9529412, 1,
0.02047963, -0.3127588, 3.787248, 0, 1, 0.9568627, 1,
0.02070262, -0.2161339, 4.343691, 0, 1, 0.9647059, 1,
0.02155889, -0.9227077, 2.912215, 0, 1, 0.9686275, 1,
0.02205401, -0.8661532, 3.930511, 0, 1, 0.9764706, 1,
0.02322611, -0.02640181, 1.572086, 0, 1, 0.9803922, 1,
0.0244967, 0.453873, 1.164653, 0, 1, 0.9882353, 1,
0.02519569, 1.353866, -0.3344496, 0, 1, 0.9921569, 1,
0.02636092, -0.4653165, 3.552233, 0, 1, 1, 1,
0.02753917, 2.262805, 1.379762, 0, 0.9921569, 1, 1,
0.02903233, 0.03886667, -1.251002, 0, 0.9882353, 1, 1,
0.03212706, 0.8882371, 0.8569518, 0, 0.9803922, 1, 1,
0.03313126, -0.9322919, 2.94057, 0, 0.9764706, 1, 1,
0.033956, -0.4817145, 3.776832, 0, 0.9686275, 1, 1,
0.03466873, 0.6656119, 1.072769, 0, 0.9647059, 1, 1,
0.03685873, -1.074082, 1.619361, 0, 0.9568627, 1, 1,
0.03691023, 1.355289, 1.150894, 0, 0.9529412, 1, 1,
0.03911462, -0.8834798, 1.569369, 0, 0.945098, 1, 1,
0.04107681, -1.469283, 3.223034, 0, 0.9411765, 1, 1,
0.04158393, -0.7905705, 2.69337, 0, 0.9333333, 1, 1,
0.04241949, 0.01890112, 1.728816, 0, 0.9294118, 1, 1,
0.04597739, -0.2850078, 1.678432, 0, 0.9215686, 1, 1,
0.04914926, 1.558356, 0.3765095, 0, 0.9176471, 1, 1,
0.05292624, -0.6449519, 4.603823, 0, 0.9098039, 1, 1,
0.05441654, -0.7470137, 2.283251, 0, 0.9058824, 1, 1,
0.05867627, -1.670841, 2.963479, 0, 0.8980392, 1, 1,
0.06459251, 1.637949, -1.074557, 0, 0.8901961, 1, 1,
0.06660407, -0.5930374, 1.962487, 0, 0.8862745, 1, 1,
0.06983186, 0.4668169, -0.7793697, 0, 0.8784314, 1, 1,
0.07283577, -1.970965, 4.27174, 0, 0.8745098, 1, 1,
0.07713971, 0.008297773, 0.857671, 0, 0.8666667, 1, 1,
0.07720399, -0.8397933, 3.375611, 0, 0.8627451, 1, 1,
0.08602887, 0.2895365, -0.09259637, 0, 0.854902, 1, 1,
0.0900544, 1.333636, -0.8791214, 0, 0.8509804, 1, 1,
0.09541866, 1.653654, -0.1370711, 0, 0.8431373, 1, 1,
0.09746613, -0.6997355, 3.274999, 0, 0.8392157, 1, 1,
0.1032108, -0.9629577, 3.600679, 0, 0.8313726, 1, 1,
0.1064068, 1.969209, -0.6757059, 0, 0.827451, 1, 1,
0.1099688, -0.905736, 2.437727, 0, 0.8196079, 1, 1,
0.1134803, 0.104434, 1.725868, 0, 0.8156863, 1, 1,
0.1135423, -0.0007052763, 0.4638889, 0, 0.8078431, 1, 1,
0.1135791, 0.1500263, 0.5901809, 0, 0.8039216, 1, 1,
0.1145054, 1.014644, 1.026456, 0, 0.7960784, 1, 1,
0.1172141, -0.8273231, 3.208524, 0, 0.7882353, 1, 1,
0.1190266, -0.2708991, 1.310451, 0, 0.7843137, 1, 1,
0.1223592, -0.7127877, 2.715505, 0, 0.7764706, 1, 1,
0.1231625, -0.5627695, 1.946882, 0, 0.772549, 1, 1,
0.1251959, 2.598954, -1.098516, 0, 0.7647059, 1, 1,
0.1302308, 1.561745, -0.3998696, 0, 0.7607843, 1, 1,
0.1310072, -0.6182573, 1.530671, 0, 0.7529412, 1, 1,
0.1327927, -0.9561654, 4.260486, 0, 0.7490196, 1, 1,
0.1329859, 1.152314, -0.5905823, 0, 0.7411765, 1, 1,
0.1330115, -1.133177, 3.492795, 0, 0.7372549, 1, 1,
0.1340399, -1.123486, 4.795139, 0, 0.7294118, 1, 1,
0.137809, -1.166898, 4.607557, 0, 0.7254902, 1, 1,
0.1462554, -0.2820343, 3.825042, 0, 0.7176471, 1, 1,
0.1604169, 0.4329423, -0.7312356, 0, 0.7137255, 1, 1,
0.1649045, -1.067528, 2.562886, 0, 0.7058824, 1, 1,
0.1735123, -1.378676, 2.863648, 0, 0.6980392, 1, 1,
0.1739882, -0.5638024, 1.498041, 0, 0.6941177, 1, 1,
0.17813, 1.19566, 0.2310246, 0, 0.6862745, 1, 1,
0.1787114, -1.807351, 3.312108, 0, 0.682353, 1, 1,
0.1805029, 0.3234363, 0.8633727, 0, 0.6745098, 1, 1,
0.1865594, 2.792112, -0.5544308, 0, 0.6705883, 1, 1,
0.1879114, -1.464139, 3.112354, 0, 0.6627451, 1, 1,
0.1917183, -0.1775528, 2.675515, 0, 0.6588235, 1, 1,
0.1937011, -0.8573341, 3.455946, 0, 0.6509804, 1, 1,
0.1949801, 0.01189403, 1.216584, 0, 0.6470588, 1, 1,
0.1986618, -0.0264728, 1.209794, 0, 0.6392157, 1, 1,
0.2014721, 0.5272784, -0.8509717, 0, 0.6352941, 1, 1,
0.2027256, -0.8786613, 3.010776, 0, 0.627451, 1, 1,
0.2058396, -0.1768074, 0.475625, 0, 0.6235294, 1, 1,
0.2099975, -0.6538939, 3.055565, 0, 0.6156863, 1, 1,
0.2100369, -0.6372609, 2.965582, 0, 0.6117647, 1, 1,
0.2104543, 0.8215167, 0.3983861, 0, 0.6039216, 1, 1,
0.2109365, 1.721513, 1.130421, 0, 0.5960785, 1, 1,
0.2122957, -1.18026, 1.76035, 0, 0.5921569, 1, 1,
0.2123836, -0.294374, 4.443836, 0, 0.5843138, 1, 1,
0.2134745, -1.50758, 1.489312, 0, 0.5803922, 1, 1,
0.2137649, 0.02280026, 0.751846, 0, 0.572549, 1, 1,
0.2139715, 0.5118383, -2.165519, 0, 0.5686275, 1, 1,
0.216069, -0.8490466, 2.582908, 0, 0.5607843, 1, 1,
0.2161206, 0.4323693, -0.03647375, 0, 0.5568628, 1, 1,
0.223129, -2.637663, 2.169248, 0, 0.5490196, 1, 1,
0.2239989, 0.7819844, -0.5040305, 0, 0.5450981, 1, 1,
0.2255784, 1.54486, 0.4747304, 0, 0.5372549, 1, 1,
0.2266511, -1.074927, 2.692989, 0, 0.5333334, 1, 1,
0.2270786, -0.7086465, 3.378789, 0, 0.5254902, 1, 1,
0.2272514, 0.6684471, 0.2113229, 0, 0.5215687, 1, 1,
0.2307111, 1.128002, -0.542473, 0, 0.5137255, 1, 1,
0.2310259, 0.551217, -0.3931276, 0, 0.509804, 1, 1,
0.2313995, -0.2810498, 2.233482, 0, 0.5019608, 1, 1,
0.2314699, 0.8989284, 1.131113, 0, 0.4941176, 1, 1,
0.2323255, -0.5239874, 4.901602, 0, 0.4901961, 1, 1,
0.2351916, -2.107655, 3.719334, 0, 0.4823529, 1, 1,
0.2355435, 0.3368958, -0.1385597, 0, 0.4784314, 1, 1,
0.2435455, 0.02576213, -0.7602502, 0, 0.4705882, 1, 1,
0.2467132, -0.3326392, 3.247881, 0, 0.4666667, 1, 1,
0.2515949, 1.042722, 0.1192449, 0, 0.4588235, 1, 1,
0.2521772, -0.5976602, 2.743686, 0, 0.454902, 1, 1,
0.2541152, 0.7085032, 0.3150421, 0, 0.4470588, 1, 1,
0.2585976, 0.5228453, 0.6219898, 0, 0.4431373, 1, 1,
0.2606888, -0.2399148, 1.846243, 0, 0.4352941, 1, 1,
0.2609335, -0.6499326, 2.569597, 0, 0.4313726, 1, 1,
0.2622482, -0.4438846, 2.526365, 0, 0.4235294, 1, 1,
0.2636713, 1.342068, -0.4844098, 0, 0.4196078, 1, 1,
0.2695729, 0.5255415, 0.02612072, 0, 0.4117647, 1, 1,
0.2724046, 1.05698, 0.02800285, 0, 0.4078431, 1, 1,
0.2767947, -1.681282, -0.1061515, 0, 0.4, 1, 1,
0.2825732, 0.470334, -0.2112885, 0, 0.3921569, 1, 1,
0.2831253, 0.2164323, 0.818622, 0, 0.3882353, 1, 1,
0.2896338, 1.046811, 1.512573, 0, 0.3803922, 1, 1,
0.2918288, -1.156682, 2.968201, 0, 0.3764706, 1, 1,
0.2974851, -0.8512439, 3.340075, 0, 0.3686275, 1, 1,
0.2995027, -0.1089466, 2.554039, 0, 0.3647059, 1, 1,
0.300941, -1.273522, 2.505077, 0, 0.3568628, 1, 1,
0.3017552, 0.130893, 1.729535, 0, 0.3529412, 1, 1,
0.3029754, 0.7130623, -0.6458659, 0, 0.345098, 1, 1,
0.3081709, -0.5266393, 2.092717, 0, 0.3411765, 1, 1,
0.3125253, 1.41834, 1.366486, 0, 0.3333333, 1, 1,
0.3232886, 0.6778067, 0.2299214, 0, 0.3294118, 1, 1,
0.328156, -0.2399741, 3.405324, 0, 0.3215686, 1, 1,
0.3333046, -2.107287, 3.220131, 0, 0.3176471, 1, 1,
0.3370178, 0.9477594, -0.3945706, 0, 0.3098039, 1, 1,
0.3374403, -0.01408112, 1.005117, 0, 0.3058824, 1, 1,
0.3383887, -1.298132, 2.835264, 0, 0.2980392, 1, 1,
0.3396904, 0.322735, -0.9720364, 0, 0.2901961, 1, 1,
0.3429798, -2.016924, 3.365978, 0, 0.2862745, 1, 1,
0.3453356, 1.407652, -0.7533983, 0, 0.2784314, 1, 1,
0.3532591, 0.2032999, 2.727862, 0, 0.2745098, 1, 1,
0.3619689, 2.810983, -0.1723715, 0, 0.2666667, 1, 1,
0.3640156, -0.8045719, 1.83665, 0, 0.2627451, 1, 1,
0.3692553, -0.4941931, 2.121556, 0, 0.254902, 1, 1,
0.3717262, -0.2605734, 2.45117, 0, 0.2509804, 1, 1,
0.3728922, 0.2838019, 0.9856994, 0, 0.2431373, 1, 1,
0.3748798, -0.01981787, 1.449533, 0, 0.2392157, 1, 1,
0.3764972, -1.812553, 3.249249, 0, 0.2313726, 1, 1,
0.37734, -1.048343, 1.902729, 0, 0.227451, 1, 1,
0.3794266, 0.500387, 0.9487491, 0, 0.2196078, 1, 1,
0.3885958, -0.7588252, 2.33974, 0, 0.2156863, 1, 1,
0.3887426, -0.006758182, 1.379664, 0, 0.2078431, 1, 1,
0.3894678, 0.5203231, -0.2634221, 0, 0.2039216, 1, 1,
0.3901182, -2.057747, 4.520564, 0, 0.1960784, 1, 1,
0.393904, -1.079117, 1.769094, 0, 0.1882353, 1, 1,
0.3985681, 0.3353114, 0.0601784, 0, 0.1843137, 1, 1,
0.4014264, -0.007853572, 3.464197, 0, 0.1764706, 1, 1,
0.405282, -2.282375, 2.950653, 0, 0.172549, 1, 1,
0.406137, -0.6392662, 3.089302, 0, 0.1647059, 1, 1,
0.4069999, 0.7718218, 0.3292764, 0, 0.1607843, 1, 1,
0.4082452, 2.811549, 1.051012, 0, 0.1529412, 1, 1,
0.4096047, 0.2928458, 0.5009416, 0, 0.1490196, 1, 1,
0.4108074, -0.06790891, 1.396259, 0, 0.1411765, 1, 1,
0.4127135, -1.06739, 2.647551, 0, 0.1372549, 1, 1,
0.4140086, -0.5053642, 2.830572, 0, 0.1294118, 1, 1,
0.4142485, 0.1754041, 1.505245, 0, 0.1254902, 1, 1,
0.4149956, 0.3112106, 2.32712, 0, 0.1176471, 1, 1,
0.4186755, 0.1757155, 2.304643, 0, 0.1137255, 1, 1,
0.4344159, -0.717562, 3.656404, 0, 0.1058824, 1, 1,
0.43793, 2.550433, 0.7181576, 0, 0.09803922, 1, 1,
0.4401914, 1.259494, 2.268136, 0, 0.09411765, 1, 1,
0.4427209, -0.1477173, 4.084718, 0, 0.08627451, 1, 1,
0.4513151, 1.411656, -0.3878476, 0, 0.08235294, 1, 1,
0.452765, -2.036843, 2.703296, 0, 0.07450981, 1, 1,
0.4552903, 0.4839011, 0.3871654, 0, 0.07058824, 1, 1,
0.45682, 0.1667508, 1.713794, 0, 0.0627451, 1, 1,
0.4577024, -1.330255, 2.482838, 0, 0.05882353, 1, 1,
0.457879, 0.4227823, 1.681248, 0, 0.05098039, 1, 1,
0.460607, 0.397916, -0.06219296, 0, 0.04705882, 1, 1,
0.4611791, -0.0432276, 2.414958, 0, 0.03921569, 1, 1,
0.4612919, 1.038743, 0.157726, 0, 0.03529412, 1, 1,
0.4618752, 3.284983, 0.9576172, 0, 0.02745098, 1, 1,
0.4622985, -1.432589, 0.6357401, 0, 0.02352941, 1, 1,
0.4643676, 0.3847609, 1.475454, 0, 0.01568628, 1, 1,
0.4722036, -0.5724022, 3.095154, 0, 0.01176471, 1, 1,
0.4748884, 1.125953, 0.8909327, 0, 0.003921569, 1, 1,
0.4760938, -0.1023193, 1.770736, 0.003921569, 0, 1, 1,
0.4762934, 1.284955, 0.755814, 0.007843138, 0, 1, 1,
0.4769851, -0.5269307, 3.324102, 0.01568628, 0, 1, 1,
0.4805922, -0.02928048, 1.647904, 0.01960784, 0, 1, 1,
0.4940281, 0.555432, 0.2797223, 0.02745098, 0, 1, 1,
0.4942673, -0.3689539, 2.420612, 0.03137255, 0, 1, 1,
0.4985895, -0.2960196, 2.885329, 0.03921569, 0, 1, 1,
0.5007125, -0.6718778, 3.602763, 0.04313726, 0, 1, 1,
0.5043079, 1.353913, -0.7444109, 0.05098039, 0, 1, 1,
0.5044155, 0.2245452, 2.202952, 0.05490196, 0, 1, 1,
0.5051379, 1.648507, 1.079232, 0.0627451, 0, 1, 1,
0.5077699, -0.4521454, 2.311036, 0.06666667, 0, 1, 1,
0.5099348, 1.260636, 0.7959493, 0.07450981, 0, 1, 1,
0.5120533, 1.247915, -0.192574, 0.07843138, 0, 1, 1,
0.5158479, -0.02387863, 2.717355, 0.08627451, 0, 1, 1,
0.5178708, 1.278241, 1.586214, 0.09019608, 0, 1, 1,
0.5183464, 2.023016, -0.1986532, 0.09803922, 0, 1, 1,
0.518864, 0.2028982, 1.208791, 0.1058824, 0, 1, 1,
0.5189067, -0.519448, 0.9376287, 0.1098039, 0, 1, 1,
0.5191278, 0.08433668, 3.486967, 0.1176471, 0, 1, 1,
0.519412, 1.29441, 1.25936, 0.1215686, 0, 1, 1,
0.520071, -0.2479322, 2.229529, 0.1294118, 0, 1, 1,
0.5207028, 0.07275576, 0.5314062, 0.1333333, 0, 1, 1,
0.5241234, 0.3085813, 0.6338899, 0.1411765, 0, 1, 1,
0.5245427, -1.154306, 2.007368, 0.145098, 0, 1, 1,
0.5247645, -0.0250659, -0.152722, 0.1529412, 0, 1, 1,
0.5279729, -0.03062228, 2.149007, 0.1568628, 0, 1, 1,
0.5359549, 0.7192609, 1.096328, 0.1647059, 0, 1, 1,
0.5393777, -0.5470123, 2.823098, 0.1686275, 0, 1, 1,
0.5395402, 0.6711696, 0.798896, 0.1764706, 0, 1, 1,
0.539984, -0.8209866, 1.953519, 0.1803922, 0, 1, 1,
0.5498316, 1.181509, 1.922327, 0.1882353, 0, 1, 1,
0.5503148, 0.9991058, 1.058865, 0.1921569, 0, 1, 1,
0.5512097, -0.716129, 3.217345, 0.2, 0, 1, 1,
0.5535533, 0.6192293, -0.3942251, 0.2078431, 0, 1, 1,
0.5585756, 0.1894318, 1.31209, 0.2117647, 0, 1, 1,
0.5670265, -0.06382998, 2.913699, 0.2196078, 0, 1, 1,
0.5696165, 1.336512, -0.2809932, 0.2235294, 0, 1, 1,
0.5700872, -2.077809, 2.831016, 0.2313726, 0, 1, 1,
0.5722279, 0.811043, 1.876499, 0.2352941, 0, 1, 1,
0.5749304, 1.93582, -1.382727, 0.2431373, 0, 1, 1,
0.5779077, -0.06148725, 2.197413, 0.2470588, 0, 1, 1,
0.57931, -1.062495, 1.897419, 0.254902, 0, 1, 1,
0.5804232, 0.1719212, 0.2731192, 0.2588235, 0, 1, 1,
0.5812929, -0.2309514, 2.339286, 0.2666667, 0, 1, 1,
0.5812972, -0.3101592, 0.7309594, 0.2705882, 0, 1, 1,
0.5832692, -0.371266, 1.159863, 0.2784314, 0, 1, 1,
0.5838808, -1.412412, 4.0078, 0.282353, 0, 1, 1,
0.5846214, 0.6189491, -0.3164396, 0.2901961, 0, 1, 1,
0.5852849, 0.4651957, -0.8943257, 0.2941177, 0, 1, 1,
0.5878159, 0.1008396, 0.8854564, 0.3019608, 0, 1, 1,
0.588733, 0.6029425, -0.06087003, 0.3098039, 0, 1, 1,
0.5892566, 0.786517, 0.185111, 0.3137255, 0, 1, 1,
0.5992283, 0.3191366, 1.421004, 0.3215686, 0, 1, 1,
0.6037163, -0.561828, 1.586293, 0.3254902, 0, 1, 1,
0.6086056, 0.6618623, 1.321253, 0.3333333, 0, 1, 1,
0.6145724, 0.5103855, 1.930077, 0.3372549, 0, 1, 1,
0.6162117, 0.9039013, 2.444592, 0.345098, 0, 1, 1,
0.61918, -0.4077418, 1.66348, 0.3490196, 0, 1, 1,
0.6217679, 1.228666, 1.660931, 0.3568628, 0, 1, 1,
0.6217958, -0.796765, 2.179204, 0.3607843, 0, 1, 1,
0.6245826, -1.881095, 5.298529, 0.3686275, 0, 1, 1,
0.6249828, -1.343004, 3.184961, 0.372549, 0, 1, 1,
0.6250478, 0.2146547, 0.7561408, 0.3803922, 0, 1, 1,
0.6304836, 0.6172863, 0.1007634, 0.3843137, 0, 1, 1,
0.6307796, -0.6949115, 1.588158, 0.3921569, 0, 1, 1,
0.6399722, -0.3714544, 1.306886, 0.3960784, 0, 1, 1,
0.6478128, 1.230214, 0.4644723, 0.4039216, 0, 1, 1,
0.6560993, -0.8791201, 2.414535, 0.4117647, 0, 1, 1,
0.6579802, 0.9862383, 1.545476, 0.4156863, 0, 1, 1,
0.6606571, -0.6098545, 3.875795, 0.4235294, 0, 1, 1,
0.6636156, -0.4518899, 2.2605, 0.427451, 0, 1, 1,
0.664474, -0.01724398, 1.447902, 0.4352941, 0, 1, 1,
0.6648783, -0.2256933, 1.556377, 0.4392157, 0, 1, 1,
0.6708261, -1.21264, 2.672184, 0.4470588, 0, 1, 1,
0.6758046, -0.6939875, 1.762793, 0.4509804, 0, 1, 1,
0.6829987, 0.7620108, 0.2470622, 0.4588235, 0, 1, 1,
0.685675, 0.1102827, 0.6576499, 0.4627451, 0, 1, 1,
0.6878288, -1.596516, 3.297849, 0.4705882, 0, 1, 1,
0.6880603, -1.659964, 2.206564, 0.4745098, 0, 1, 1,
0.6910702, -0.5408852, 2.880953, 0.4823529, 0, 1, 1,
0.6947799, 0.4200646, 1.775669, 0.4862745, 0, 1, 1,
0.6998833, 0.01979889, 0.8961678, 0.4941176, 0, 1, 1,
0.702012, -0.01509032, 2.941561, 0.5019608, 0, 1, 1,
0.7063429, 0.3136263, 1.768004, 0.5058824, 0, 1, 1,
0.7087706, 1.854939, 1.438615, 0.5137255, 0, 1, 1,
0.7142984, -2.213585, 3.129364, 0.5176471, 0, 1, 1,
0.7148122, -0.6810533, 2.199605, 0.5254902, 0, 1, 1,
0.7250902, 0.8858778, 0.6686844, 0.5294118, 0, 1, 1,
0.725172, 1.308622, 0.2073921, 0.5372549, 0, 1, 1,
0.7264904, 0.1324116, 1.245335, 0.5411765, 0, 1, 1,
0.7284318, -0.8218662, 1.938914, 0.5490196, 0, 1, 1,
0.731227, 1.511226, 1.028651, 0.5529412, 0, 1, 1,
0.732616, -0.06730811, 0.7308249, 0.5607843, 0, 1, 1,
0.7435997, -0.4697613, 2.469546, 0.5647059, 0, 1, 1,
0.7442313, 0.6350933, 1.605056, 0.572549, 0, 1, 1,
0.7450938, 0.5324878, 0.1924021, 0.5764706, 0, 1, 1,
0.7451439, 0.534286, -0.2439711, 0.5843138, 0, 1, 1,
0.7458123, 0.1172818, 1.905849, 0.5882353, 0, 1, 1,
0.7502337, 1.726497, 1.005508, 0.5960785, 0, 1, 1,
0.7520008, -1.421604, 3.835687, 0.6039216, 0, 1, 1,
0.7530956, 0.5580669, 2.088217, 0.6078432, 0, 1, 1,
0.7549953, 0.2029371, 1.076737, 0.6156863, 0, 1, 1,
0.7590458, -1.31617, 2.341092, 0.6196079, 0, 1, 1,
0.7601713, -2.119653, 4.553637, 0.627451, 0, 1, 1,
0.7632667, 1.238544, 1.160146, 0.6313726, 0, 1, 1,
0.7646368, -1.161253, 3.506872, 0.6392157, 0, 1, 1,
0.7662141, -0.05412278, 2.23131, 0.6431373, 0, 1, 1,
0.7714018, -0.5945128, 1.570295, 0.6509804, 0, 1, 1,
0.7725486, -1.355658, 3.521604, 0.654902, 0, 1, 1,
0.7761875, 0.06065963, 2.318044, 0.6627451, 0, 1, 1,
0.7831646, 1.302808, 0.03197708, 0.6666667, 0, 1, 1,
0.7907568, -1.818523, 2.851522, 0.6745098, 0, 1, 1,
0.7920328, 0.9844345, 0.6797209, 0.6784314, 0, 1, 1,
0.8073307, -1.408364, 2.924762, 0.6862745, 0, 1, 1,
0.8109417, -1.044206, 3.478678, 0.6901961, 0, 1, 1,
0.8179712, -1.024609, 2.501978, 0.6980392, 0, 1, 1,
0.8194141, 0.2114457, 1.378032, 0.7058824, 0, 1, 1,
0.8267938, 0.2082287, 2.803252, 0.7098039, 0, 1, 1,
0.8345746, -1.789756, 3.713835, 0.7176471, 0, 1, 1,
0.8352324, 0.6978949, 0.07409238, 0.7215686, 0, 1, 1,
0.8375235, 1.004707, 1.491738, 0.7294118, 0, 1, 1,
0.8424087, -0.3491563, 0.782698, 0.7333333, 0, 1, 1,
0.8431934, -0.5534185, 4.14376, 0.7411765, 0, 1, 1,
0.8437378, -1.218585, 2.778341, 0.7450981, 0, 1, 1,
0.8461208, -0.8408197, 3.146339, 0.7529412, 0, 1, 1,
0.8502976, 1.136435, 1.80322, 0.7568628, 0, 1, 1,
0.8542288, 0.03274768, 2.021945, 0.7647059, 0, 1, 1,
0.8571476, 1.133914, -0.1210278, 0.7686275, 0, 1, 1,
0.858108, -0.8216745, 2.982033, 0.7764706, 0, 1, 1,
0.8694614, -2.234335, 2.2061, 0.7803922, 0, 1, 1,
0.8798913, -0.4140749, 1.079743, 0.7882353, 0, 1, 1,
0.8813591, -0.3615743, 0.3148458, 0.7921569, 0, 1, 1,
0.8891126, 0.1285234, 1.402003, 0.8, 0, 1, 1,
0.8893242, 0.2502193, 2.243163, 0.8078431, 0, 1, 1,
0.8947546, -1.178019, 1.426778, 0.8117647, 0, 1, 1,
0.8978414, -0.6654979, 3.774138, 0.8196079, 0, 1, 1,
0.9051149, 1.605842, 2.032526, 0.8235294, 0, 1, 1,
0.9149715, 0.7484007, 0.6064985, 0.8313726, 0, 1, 1,
0.917238, 0.6976006, 1.115987, 0.8352941, 0, 1, 1,
0.9203038, 1.346551, -1.174514, 0.8431373, 0, 1, 1,
0.9256783, -0.9141886, 3.73914, 0.8470588, 0, 1, 1,
0.9262508, -0.3326553, 1.018616, 0.854902, 0, 1, 1,
0.9272771, -0.3545306, 1.446993, 0.8588235, 0, 1, 1,
0.9302365, -0.591206, 0.7760965, 0.8666667, 0, 1, 1,
0.9335215, -0.1042549, 1.803377, 0.8705882, 0, 1, 1,
0.9398473, 2.618208, -2.040598, 0.8784314, 0, 1, 1,
0.9406103, 0.7564914, -0.008607149, 0.8823529, 0, 1, 1,
0.9459416, 0.5652009, 1.662591, 0.8901961, 0, 1, 1,
0.9463058, -1.728886, 4.472544, 0.8941177, 0, 1, 1,
0.9511256, -1.244746, 2.529587, 0.9019608, 0, 1, 1,
0.9514788, 1.160519, -0.1924668, 0.9098039, 0, 1, 1,
0.9527448, 0.2420074, 1.261221, 0.9137255, 0, 1, 1,
0.9613379, 1.324016, 1.670529, 0.9215686, 0, 1, 1,
0.9629221, -0.06573638, 2.692451, 0.9254902, 0, 1, 1,
0.9635411, 0.7674738, 2.120655, 0.9333333, 0, 1, 1,
0.9660099, -0.0211779, 2.918032, 0.9372549, 0, 1, 1,
0.9671314, 1.163733, 0.7646391, 0.945098, 0, 1, 1,
0.9685367, -0.5392495, 0.9774655, 0.9490196, 0, 1, 1,
0.9738687, 0.6502569, 1.352488, 0.9568627, 0, 1, 1,
0.9759938, -0.7599079, 0.8851413, 0.9607843, 0, 1, 1,
0.9765657, 0.03154331, -0.392259, 0.9686275, 0, 1, 1,
0.9810019, -1.463652, 2.151646, 0.972549, 0, 1, 1,
0.9951223, -1.393969, 3.281024, 0.9803922, 0, 1, 1,
0.9990708, -0.8707608, 0.6490788, 0.9843137, 0, 1, 1,
1.0006, -0.1390911, 0.0464037, 0.9921569, 0, 1, 1,
1.001564, -0.9695342, 2.904851, 0.9960784, 0, 1, 1,
1.002188, 1.110577, -0.1055066, 1, 0, 0.9960784, 1,
1.008715, 0.09669986, 1.324333, 1, 0, 0.9882353, 1,
1.018228, -1.811419, 1.772478, 1, 0, 0.9843137, 1,
1.021717, -1.270511, 2.834963, 1, 0, 0.9764706, 1,
1.021752, 1.976002, -0.7200495, 1, 0, 0.972549, 1,
1.028217, -1.431614, 3.591636, 1, 0, 0.9647059, 1,
1.028334, 0.02004251, 0.778362, 1, 0, 0.9607843, 1,
1.032801, 0.6379405, 1.069521, 1, 0, 0.9529412, 1,
1.037011, 0.3242275, 2.653978, 1, 0, 0.9490196, 1,
1.039024, -1.307056, 3.394579, 1, 0, 0.9411765, 1,
1.039689, -0.506695, 2.305436, 1, 0, 0.9372549, 1,
1.044902, -0.6119828, 1.204601, 1, 0, 0.9294118, 1,
1.047456, -0.3638583, 3.068298, 1, 0, 0.9254902, 1,
1.063347, -0.2883976, 3.601345, 1, 0, 0.9176471, 1,
1.072511, 0.7382182, 0.6677923, 1, 0, 0.9137255, 1,
1.074712, -0.9408398, 0.7347943, 1, 0, 0.9058824, 1,
1.075109, 1.207011, 1.89678, 1, 0, 0.9019608, 1,
1.088482, -0.9873797, 2.180175, 1, 0, 0.8941177, 1,
1.091955, -1.704159, 2.912417, 1, 0, 0.8862745, 1,
1.093314, -0.6681559, 1.557031, 1, 0, 0.8823529, 1,
1.104187, -0.8663717, 2.254364, 1, 0, 0.8745098, 1,
1.106918, 1.105254, -0.4263342, 1, 0, 0.8705882, 1,
1.120916, -2.130203, 2.18651, 1, 0, 0.8627451, 1,
1.129182, -1.775813, 2.237974, 1, 0, 0.8588235, 1,
1.129769, 1.956505, 1.082509, 1, 0, 0.8509804, 1,
1.136657, 0.6910378, 1.665838, 1, 0, 0.8470588, 1,
1.139855, -0.9462728, 2.398145, 1, 0, 0.8392157, 1,
1.142124, -0.1210209, 3.160783, 1, 0, 0.8352941, 1,
1.148849, 1.436305, 0.09100606, 1, 0, 0.827451, 1,
1.15159, -0.2527297, 3.009295, 1, 0, 0.8235294, 1,
1.154037, -0.1285142, 2.501639, 1, 0, 0.8156863, 1,
1.155615, -1.504977, 2.112565, 1, 0, 0.8117647, 1,
1.158605, 0.963753, 0.7638518, 1, 0, 0.8039216, 1,
1.160943, -0.095787, 2.834203, 1, 0, 0.7960784, 1,
1.166665, 2.257044, 0.3241485, 1, 0, 0.7921569, 1,
1.170975, 0.1948673, 1.878076, 1, 0, 0.7843137, 1,
1.172844, -0.8647472, 3.163245, 1, 0, 0.7803922, 1,
1.196793, 0.6269542, 0.6597988, 1, 0, 0.772549, 1,
1.197742, 0.1380363, 0.3648156, 1, 0, 0.7686275, 1,
1.197983, -0.7585655, 1.199086, 1, 0, 0.7607843, 1,
1.203715, 0.2162739, 1.286358, 1, 0, 0.7568628, 1,
1.205383, -1.787493, 2.720863, 1, 0, 0.7490196, 1,
1.217726, -1.436852, 3.197232, 1, 0, 0.7450981, 1,
1.228907, -0.8904367, -0.7154295, 1, 0, 0.7372549, 1,
1.231644, -0.05404343, 0.1185196, 1, 0, 0.7333333, 1,
1.231947, -2.090885, 2.685519, 1, 0, 0.7254902, 1,
1.241103, -0.5109501, 1.615501, 1, 0, 0.7215686, 1,
1.247465, -1.135917, 3.461681, 1, 0, 0.7137255, 1,
1.251548, 0.322807, -0.1811372, 1, 0, 0.7098039, 1,
1.261519, 1.116469, 0.9734321, 1, 0, 0.7019608, 1,
1.263249, 1.006823, 1.138889, 1, 0, 0.6941177, 1,
1.267221, 0.2257666, 1.177175, 1, 0, 0.6901961, 1,
1.267473, 1.662961, 0.2049479, 1, 0, 0.682353, 1,
1.280069, 0.4701776, -0.8608586, 1, 0, 0.6784314, 1,
1.285549, 0.9139798, 3.141117, 1, 0, 0.6705883, 1,
1.286042, 0.1291018, -1.274308, 1, 0, 0.6666667, 1,
1.28687, 0.03337067, 3.133587, 1, 0, 0.6588235, 1,
1.287504, -0.188796, 2.680251, 1, 0, 0.654902, 1,
1.287736, -0.07380398, 3.166075, 1, 0, 0.6470588, 1,
1.294747, -0.9609984, 0.4485946, 1, 0, 0.6431373, 1,
1.303498, -0.4268485, 1.277723, 1, 0, 0.6352941, 1,
1.304262, 2.578781, 0.4233169, 1, 0, 0.6313726, 1,
1.310521, -1.106829, 3.62836, 1, 0, 0.6235294, 1,
1.312658, -0.5047433, 1.636932, 1, 0, 0.6196079, 1,
1.314314, -1.68777, 3.723759, 1, 0, 0.6117647, 1,
1.316397, -1.430511, 2.049809, 1, 0, 0.6078432, 1,
1.316461, -0.7414604, 1.744444, 1, 0, 0.6, 1,
1.324126, -0.4780438, 2.139838, 1, 0, 0.5921569, 1,
1.327656, 0.6816823, -0.6995063, 1, 0, 0.5882353, 1,
1.336231, -1.134911, 3.055812, 1, 0, 0.5803922, 1,
1.337674, -1.894, 2.172461, 1, 0, 0.5764706, 1,
1.338928, -0.09762791, 0.5120336, 1, 0, 0.5686275, 1,
1.34029, -0.131873, 2.41128, 1, 0, 0.5647059, 1,
1.346318, 0.3728079, 3.136948, 1, 0, 0.5568628, 1,
1.352238, 0.1838965, 3.081713, 1, 0, 0.5529412, 1,
1.355155, -0.9903863, 1.983537, 1, 0, 0.5450981, 1,
1.355503, 1.253645, -0.2577685, 1, 0, 0.5411765, 1,
1.35572, -0.1381597, 2.661645, 1, 0, 0.5333334, 1,
1.364534, 1.611405, -0.5072028, 1, 0, 0.5294118, 1,
1.365974, 0.005435574, 3.550729, 1, 0, 0.5215687, 1,
1.372376, -0.8782571, 3.441948, 1, 0, 0.5176471, 1,
1.389786, 1.726125, 1.421156, 1, 0, 0.509804, 1,
1.396305, 1.597658, 2.704993, 1, 0, 0.5058824, 1,
1.403554, -0.09137494, 2.211425, 1, 0, 0.4980392, 1,
1.404417, -0.1558599, 2.508076, 1, 0, 0.4901961, 1,
1.405673, 1.495803, 1.163271, 1, 0, 0.4862745, 1,
1.423144, -1.486683, 3.453715, 1, 0, 0.4784314, 1,
1.433353, 0.9900305, 1.666601, 1, 0, 0.4745098, 1,
1.443464, -0.07066348, 2.141522, 1, 0, 0.4666667, 1,
1.444078, 2.80842, -0.7438101, 1, 0, 0.4627451, 1,
1.449, 0.8115745, 1.347479, 1, 0, 0.454902, 1,
1.45207, 0.4012551, 1.386412, 1, 0, 0.4509804, 1,
1.457271, 0.2916423, 2.00591, 1, 0, 0.4431373, 1,
1.480566, 0.6218106, 0.7062781, 1, 0, 0.4392157, 1,
1.484313, -1.185556, 2.002268, 1, 0, 0.4313726, 1,
1.491146, -1.306536, 1.533593, 1, 0, 0.427451, 1,
1.498243, -2.385823, 2.215318, 1, 0, 0.4196078, 1,
1.510215, -0.3615378, 1.644167, 1, 0, 0.4156863, 1,
1.512993, -0.1725605, 2.960694, 1, 0, 0.4078431, 1,
1.515189, 0.5891178, 1.503539, 1, 0, 0.4039216, 1,
1.522578, -0.2693018, 1.919229, 1, 0, 0.3960784, 1,
1.53265, 1.241805, 0.5713522, 1, 0, 0.3882353, 1,
1.54566, 1.942575, 0.5707307, 1, 0, 0.3843137, 1,
1.550878, 0.2143788, 0.4261578, 1, 0, 0.3764706, 1,
1.554026, 1.572937, 0.8969659, 1, 0, 0.372549, 1,
1.561131, 0.7139172, -0.1182678, 1, 0, 0.3647059, 1,
1.564638, 2.310599, -0.7306923, 1, 0, 0.3607843, 1,
1.566336, -0.2826907, 1.021107, 1, 0, 0.3529412, 1,
1.579922, -2.572214, 3.603921, 1, 0, 0.3490196, 1,
1.585283, -0.4108647, 2.971411, 1, 0, 0.3411765, 1,
1.615445, -1.875452, 1.908521, 1, 0, 0.3372549, 1,
1.622875, 0.482547, 1.476459, 1, 0, 0.3294118, 1,
1.64182, 2.574985, -0.4434767, 1, 0, 0.3254902, 1,
1.641952, 1.065068, 2.585844, 1, 0, 0.3176471, 1,
1.647741, 0.7522476, 1.274586, 1, 0, 0.3137255, 1,
1.647826, 0.3941448, 0.145111, 1, 0, 0.3058824, 1,
1.652252, -2.576088, 2.436116, 1, 0, 0.2980392, 1,
1.683918, 0.6140274, 0.5234493, 1, 0, 0.2941177, 1,
1.691664, 0.1505338, 1.086769, 1, 0, 0.2862745, 1,
1.703055, 1.097002, 2.46189, 1, 0, 0.282353, 1,
1.713761, -1.038935, 2.452456, 1, 0, 0.2745098, 1,
1.722244, 0.7416326, 0.9306777, 1, 0, 0.2705882, 1,
1.730858, 2.284591, 2.439861, 1, 0, 0.2627451, 1,
1.746013, -0.6040826, 3.175931, 1, 0, 0.2588235, 1,
1.753629, -0.9318801, 1.938658, 1, 0, 0.2509804, 1,
1.776428, -0.2264373, 0.7353588, 1, 0, 0.2470588, 1,
1.797725, 0.3218007, 1.80792, 1, 0, 0.2392157, 1,
1.815195, -0.04355012, 1.622968, 1, 0, 0.2352941, 1,
1.817914, -0.2772212, 1.951503, 1, 0, 0.227451, 1,
1.826413, -0.06208199, 1.429633, 1, 0, 0.2235294, 1,
1.852797, -0.2970891, 2.504636, 1, 0, 0.2156863, 1,
1.889756, 0.4698336, 0.6093218, 1, 0, 0.2117647, 1,
1.902393, 0.6692077, 1.034818, 1, 0, 0.2039216, 1,
1.905788, 0.1253418, 1.361327, 1, 0, 0.1960784, 1,
1.927266, -0.4616311, 1.142552, 1, 0, 0.1921569, 1,
1.928085, -0.5599421, 1.815165, 1, 0, 0.1843137, 1,
1.948693, -1.062585, 1.882029, 1, 0, 0.1803922, 1,
1.95505, -0.2633718, 0.5753856, 1, 0, 0.172549, 1,
1.98152, 1.051767, 0.2262295, 1, 0, 0.1686275, 1,
1.982589, -0.1375113, 2.036381, 1, 0, 0.1607843, 1,
1.988373, 0.2090067, 1.792509, 1, 0, 0.1568628, 1,
2.033617, -1.52345, 1.191349, 1, 0, 0.1490196, 1,
2.052225, 1.703943, -0.6483946, 1, 0, 0.145098, 1,
2.064659, 0.3292758, 0.6105173, 1, 0, 0.1372549, 1,
2.084907, -0.3226476, 1.212202, 1, 0, 0.1333333, 1,
2.094885, 1.566393, 2.803751, 1, 0, 0.1254902, 1,
2.113873, -0.1707998, 1.948049, 1, 0, 0.1215686, 1,
2.173624, 0.1077536, -0.01454583, 1, 0, 0.1137255, 1,
2.217738, -0.3298212, 2.538197, 1, 0, 0.1098039, 1,
2.243581, 0.1110892, 3.263473, 1, 0, 0.1019608, 1,
2.255569, 1.52121, 0.4009524, 1, 0, 0.09411765, 1,
2.270625, 0.9951849, 2.888462, 1, 0, 0.09019608, 1,
2.307173, 1.131711, 3.330091, 1, 0, 0.08235294, 1,
2.328764, 1.531544, -0.06315929, 1, 0, 0.07843138, 1,
2.335049, -1.33503, 1.75947, 1, 0, 0.07058824, 1,
2.337575, -0.4600678, 2.404034, 1, 0, 0.06666667, 1,
2.42182, -0.8701885, 0.3016314, 1, 0, 0.05882353, 1,
2.433274, -0.8499081, -0.1291973, 1, 0, 0.05490196, 1,
2.459493, 1.504193, 1.531303, 1, 0, 0.04705882, 1,
2.489259, 0.0306185, -0.1153471, 1, 0, 0.04313726, 1,
2.523686, 0.1705273, 1.115152, 1, 0, 0.03529412, 1,
2.531451, 2.292205, 0.8516769, 1, 0, 0.03137255, 1,
2.640277, 0.9539031, 1.351991, 1, 0, 0.02352941, 1,
2.699228, -0.05459016, 1.419574, 1, 0, 0.01960784, 1,
2.798521, -1.364455, 3.340591, 1, 0, 0.01176471, 1,
3.752734, 0.9857625, 0.4989159, 1, 0, 0.007843138, 1
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
0.005234718, -4.134232, -6.822488, 0, -0.5, 0.5, 0.5,
0.005234718, -4.134232, -6.822488, 1, -0.5, 0.5, 0.5,
0.005234718, -4.134232, -6.822488, 1, 1.5, 0.5, 0.5,
0.005234718, -4.134232, -6.822488, 0, 1.5, 0.5, 0.5
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
-5.012667, 0.1130229, -6.822488, 0, -0.5, 0.5, 0.5,
-5.012667, 0.1130229, -6.822488, 1, -0.5, 0.5, 0.5,
-5.012667, 0.1130229, -6.822488, 1, 1.5, 0.5, 0.5,
-5.012667, 0.1130229, -6.822488, 0, 1.5, 0.5, 0.5
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
-5.012667, -4.134232, 0.1163924, 0, -0.5, 0.5, 0.5,
-5.012667, -4.134232, 0.1163924, 1, -0.5, 0.5, 0.5,
-5.012667, -4.134232, 0.1163924, 1, 1.5, 0.5, 0.5,
-5.012667, -4.134232, 0.1163924, 0, 1.5, 0.5, 0.5
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
-2, -3.154096, -5.221208,
2, -3.154096, -5.221208,
-2, -3.154096, -5.221208,
-2, -3.317452, -5.488088,
0, -3.154096, -5.221208,
0, -3.317452, -5.488088,
2, -3.154096, -5.221208,
2, -3.317452, -5.488088
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
-2, -3.644164, -6.021848, 0, -0.5, 0.5, 0.5,
-2, -3.644164, -6.021848, 1, -0.5, 0.5, 0.5,
-2, -3.644164, -6.021848, 1, 1.5, 0.5, 0.5,
-2, -3.644164, -6.021848, 0, 1.5, 0.5, 0.5,
0, -3.644164, -6.021848, 0, -0.5, 0.5, 0.5,
0, -3.644164, -6.021848, 1, -0.5, 0.5, 0.5,
0, -3.644164, -6.021848, 1, 1.5, 0.5, 0.5,
0, -3.644164, -6.021848, 0, 1.5, 0.5, 0.5,
2, -3.644164, -6.021848, 0, -0.5, 0.5, 0.5,
2, -3.644164, -6.021848, 1, -0.5, 0.5, 0.5,
2, -3.644164, -6.021848, 1, 1.5, 0.5, 0.5,
2, -3.644164, -6.021848, 0, 1.5, 0.5, 0.5
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
-3.85469, -3, -5.221208,
-3.85469, 3, -5.221208,
-3.85469, -3, -5.221208,
-4.047686, -3, -5.488088,
-3.85469, -2, -5.221208,
-4.047686, -2, -5.488088,
-3.85469, -1, -5.221208,
-4.047686, -1, -5.488088,
-3.85469, 0, -5.221208,
-4.047686, 0, -5.488088,
-3.85469, 1, -5.221208,
-4.047686, 1, -5.488088,
-3.85469, 2, -5.221208,
-4.047686, 2, -5.488088,
-3.85469, 3, -5.221208,
-4.047686, 3, -5.488088
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
-4.433679, -3, -6.021848, 0, -0.5, 0.5, 0.5,
-4.433679, -3, -6.021848, 1, -0.5, 0.5, 0.5,
-4.433679, -3, -6.021848, 1, 1.5, 0.5, 0.5,
-4.433679, -3, -6.021848, 0, 1.5, 0.5, 0.5,
-4.433679, -2, -6.021848, 0, -0.5, 0.5, 0.5,
-4.433679, -2, -6.021848, 1, -0.5, 0.5, 0.5,
-4.433679, -2, -6.021848, 1, 1.5, 0.5, 0.5,
-4.433679, -2, -6.021848, 0, 1.5, 0.5, 0.5,
-4.433679, -1, -6.021848, 0, -0.5, 0.5, 0.5,
-4.433679, -1, -6.021848, 1, -0.5, 0.5, 0.5,
-4.433679, -1, -6.021848, 1, 1.5, 0.5, 0.5,
-4.433679, -1, -6.021848, 0, 1.5, 0.5, 0.5,
-4.433679, 0, -6.021848, 0, -0.5, 0.5, 0.5,
-4.433679, 0, -6.021848, 1, -0.5, 0.5, 0.5,
-4.433679, 0, -6.021848, 1, 1.5, 0.5, 0.5,
-4.433679, 0, -6.021848, 0, 1.5, 0.5, 0.5,
-4.433679, 1, -6.021848, 0, -0.5, 0.5, 0.5,
-4.433679, 1, -6.021848, 1, -0.5, 0.5, 0.5,
-4.433679, 1, -6.021848, 1, 1.5, 0.5, 0.5,
-4.433679, 1, -6.021848, 0, 1.5, 0.5, 0.5,
-4.433679, 2, -6.021848, 0, -0.5, 0.5, 0.5,
-4.433679, 2, -6.021848, 1, -0.5, 0.5, 0.5,
-4.433679, 2, -6.021848, 1, 1.5, 0.5, 0.5,
-4.433679, 2, -6.021848, 0, 1.5, 0.5, 0.5,
-4.433679, 3, -6.021848, 0, -0.5, 0.5, 0.5,
-4.433679, 3, -6.021848, 1, -0.5, 0.5, 0.5,
-4.433679, 3, -6.021848, 1, 1.5, 0.5, 0.5,
-4.433679, 3, -6.021848, 0, 1.5, 0.5, 0.5
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
-3.85469, -3.154096, -4,
-3.85469, -3.154096, 4,
-3.85469, -3.154096, -4,
-4.047686, -3.317452, -4,
-3.85469, -3.154096, -2,
-4.047686, -3.317452, -2,
-3.85469, -3.154096, 0,
-4.047686, -3.317452, 0,
-3.85469, -3.154096, 2,
-4.047686, -3.317452, 2,
-3.85469, -3.154096, 4,
-4.047686, -3.317452, 4
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
-4.433679, -3.644164, -4, 0, -0.5, 0.5, 0.5,
-4.433679, -3.644164, -4, 1, -0.5, 0.5, 0.5,
-4.433679, -3.644164, -4, 1, 1.5, 0.5, 0.5,
-4.433679, -3.644164, -4, 0, 1.5, 0.5, 0.5,
-4.433679, -3.644164, -2, 0, -0.5, 0.5, 0.5,
-4.433679, -3.644164, -2, 1, -0.5, 0.5, 0.5,
-4.433679, -3.644164, -2, 1, 1.5, 0.5, 0.5,
-4.433679, -3.644164, -2, 0, 1.5, 0.5, 0.5,
-4.433679, -3.644164, 0, 0, -0.5, 0.5, 0.5,
-4.433679, -3.644164, 0, 1, -0.5, 0.5, 0.5,
-4.433679, -3.644164, 0, 1, 1.5, 0.5, 0.5,
-4.433679, -3.644164, 0, 0, 1.5, 0.5, 0.5,
-4.433679, -3.644164, 2, 0, -0.5, 0.5, 0.5,
-4.433679, -3.644164, 2, 1, -0.5, 0.5, 0.5,
-4.433679, -3.644164, 2, 1, 1.5, 0.5, 0.5,
-4.433679, -3.644164, 2, 0, 1.5, 0.5, 0.5,
-4.433679, -3.644164, 4, 0, -0.5, 0.5, 0.5,
-4.433679, -3.644164, 4, 1, -0.5, 0.5, 0.5,
-4.433679, -3.644164, 4, 1, 1.5, 0.5, 0.5,
-4.433679, -3.644164, 4, 0, 1.5, 0.5, 0.5
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
-3.85469, -3.154096, -5.221208,
-3.85469, 3.380142, -5.221208,
-3.85469, -3.154096, 5.453993,
-3.85469, 3.380142, 5.453993,
-3.85469, -3.154096, -5.221208,
-3.85469, -3.154096, 5.453993,
-3.85469, 3.380142, -5.221208,
-3.85469, 3.380142, 5.453993,
-3.85469, -3.154096, -5.221208,
3.865159, -3.154096, -5.221208,
-3.85469, -3.154096, 5.453993,
3.865159, -3.154096, 5.453993,
-3.85469, 3.380142, -5.221208,
3.865159, 3.380142, -5.221208,
-3.85469, 3.380142, 5.453993,
3.865159, 3.380142, 5.453993,
3.865159, -3.154096, -5.221208,
3.865159, 3.380142, -5.221208,
3.865159, -3.154096, 5.453993,
3.865159, 3.380142, 5.453993,
3.865159, -3.154096, -5.221208,
3.865159, -3.154096, 5.453993,
3.865159, 3.380142, -5.221208,
3.865159, 3.380142, 5.453993
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
var radius = 7.852461;
var distance = 34.93649;
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
mvMatrix.translate( -0.005234718, -0.1130229, -0.1163924 );
mvMatrix.scale( 1.099793, 1.299346, 0.7953232 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.93649);
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
halofenozide<-read.table("halofenozide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-halofenozide$V2
```

```
## Error in eval(expr, envir, enclos): object 'halofenozide' not found
```

```r
y<-halofenozide$V3
```

```
## Error in eval(expr, envir, enclos): object 'halofenozide' not found
```

```r
z<-halofenozide$V4
```

```
## Error in eval(expr, envir, enclos): object 'halofenozide' not found
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
-3.742265, 0.2316973, -2.331925, 0, 0, 1, 1, 1,
-3.500542, -1.28636, -2.348427, 1, 0, 0, 1, 1,
-3.482773, 0.06413259, -1.311729, 1, 0, 0, 1, 1,
-3.360087, 0.5223825, -2.993344, 1, 0, 0, 1, 1,
-2.841809, 1.707298, 0.4174092, 1, 0, 0, 1, 1,
-2.617121, -0.4427482, -2.032569, 1, 0, 0, 1, 1,
-2.570835, 2.867344, -0.06073362, 0, 0, 0, 1, 1,
-2.520607, -1.488309, -2.000978, 0, 0, 0, 1, 1,
-2.472242, -1.034406, -2.519793, 0, 0, 0, 1, 1,
-2.456674, 0.5993954, -1.816226, 0, 0, 0, 1, 1,
-2.41486, 0.6392049, 0.02035814, 0, 0, 0, 1, 1,
-2.40935, -0.7308729, -3.646626, 0, 0, 0, 1, 1,
-2.408684, -0.1147632, -0.6274535, 0, 0, 0, 1, 1,
-2.3942, 0.1270807, -2.337118, 1, 1, 1, 1, 1,
-2.381749, -0.4651615, -1.072784, 1, 1, 1, 1, 1,
-2.31384, -0.07437275, -4.315653, 1, 1, 1, 1, 1,
-2.313033, -0.4322394, -2.086794, 1, 1, 1, 1, 1,
-2.265949, -2.63969, -1.822961, 1, 1, 1, 1, 1,
-2.261769, 0.5682964, -2.170728, 1, 1, 1, 1, 1,
-2.235978, 0.2200461, -0.8930163, 1, 1, 1, 1, 1,
-2.202979, 1.222297, -2.232137, 1, 1, 1, 1, 1,
-2.200101, 0.2149072, -3.997626, 1, 1, 1, 1, 1,
-2.195984, 0.9780608, -0.3951888, 1, 1, 1, 1, 1,
-2.192431, -0.1490229, -2.912627, 1, 1, 1, 1, 1,
-2.154779, 2.375978, 0.111368, 1, 1, 1, 1, 1,
-2.146919, 1.301091, -1.974681, 1, 1, 1, 1, 1,
-2.088417, -0.7903671, -1.787083, 1, 1, 1, 1, 1,
-2.011897, 0.5192536, -0.2798213, 1, 1, 1, 1, 1,
-2.011708, -1.048598, -2.088666, 0, 0, 1, 1, 1,
-1.993518, -1.175226, -1.182287, 1, 0, 0, 1, 1,
-1.914369, 0.7609621, -2.65251, 1, 0, 0, 1, 1,
-1.910301, 0.4312001, 0.1848715, 1, 0, 0, 1, 1,
-1.907072, 0.8214387, 0.2228253, 1, 0, 0, 1, 1,
-1.89376, -0.4193102, -0.7395747, 1, 0, 0, 1, 1,
-1.893203, 0.07899828, -2.617186, 0, 0, 0, 1, 1,
-1.892602, -0.08089058, -0.9977964, 0, 0, 0, 1, 1,
-1.873904, -1.948844, -2.415168, 0, 0, 0, 1, 1,
-1.859692, 0.991225, -2.67469, 0, 0, 0, 1, 1,
-1.85223, -1.007876, -1.195796, 0, 0, 0, 1, 1,
-1.826101, 0.02329753, -1.680545, 0, 0, 0, 1, 1,
-1.813753, -0.9832858, -0.7125214, 0, 0, 0, 1, 1,
-1.804296, -1.151495, -2.168417, 1, 1, 1, 1, 1,
-1.801782, 0.2649725, -2.331183, 1, 1, 1, 1, 1,
-1.782325, -1.081519, -0.930554, 1, 1, 1, 1, 1,
-1.754995, -1.436937, -2.858935, 1, 1, 1, 1, 1,
-1.731807, 0.7785658, -1.167259, 1, 1, 1, 1, 1,
-1.710082, -1.072032, -0.4909998, 1, 1, 1, 1, 1,
-1.707466, -0.3350395, 1.014112, 1, 1, 1, 1, 1,
-1.698956, -2.256056, -1.416448, 1, 1, 1, 1, 1,
-1.698717, -0.20822, -1.844929, 1, 1, 1, 1, 1,
-1.670704, 0.4964387, -0.03234273, 1, 1, 1, 1, 1,
-1.66808, 2.217174, 0.0472361, 1, 1, 1, 1, 1,
-1.65148, 0.227145, -0.6742649, 1, 1, 1, 1, 1,
-1.651316, -1.586549, -2.65075, 1, 1, 1, 1, 1,
-1.646367, -0.3086745, -2.008769, 1, 1, 1, 1, 1,
-1.645701, -1.623484, -2.271555, 1, 1, 1, 1, 1,
-1.644767, -0.2644225, -4.052184, 0, 0, 1, 1, 1,
-1.638477, 1.307697, -1.086856, 1, 0, 0, 1, 1,
-1.626734, -0.03833082, -0.9114991, 1, 0, 0, 1, 1,
-1.621809, -0.9975496, -2.458904, 1, 0, 0, 1, 1,
-1.591955, -0.02219432, -1.795619, 1, 0, 0, 1, 1,
-1.577734, 0.9629827, 1.136337, 1, 0, 0, 1, 1,
-1.571068, 0.6518056, -0.8440203, 0, 0, 0, 1, 1,
-1.567324, 0.110187, -2.350063, 0, 0, 0, 1, 1,
-1.536976, 0.6519544, -0.5507304, 0, 0, 0, 1, 1,
-1.528654, -0.3862929, -1.33525, 0, 0, 0, 1, 1,
-1.528562, -1.831009, -2.092725, 0, 0, 0, 1, 1,
-1.51752, -0.5182685, -0.8384963, 0, 0, 0, 1, 1,
-1.508091, 2.254339, -1.291651, 0, 0, 0, 1, 1,
-1.48109, -1.537006, -2.880584, 1, 1, 1, 1, 1,
-1.475982, -0.7485329, -1.439884, 1, 1, 1, 1, 1,
-1.473836, 0.1483568, -1.0064, 1, 1, 1, 1, 1,
-1.46976, -0.3937389, -1.699581, 1, 1, 1, 1, 1,
-1.46702, -2.861333, -3.821136, 1, 1, 1, 1, 1,
-1.466899, 1.314081, -0.9550631, 1, 1, 1, 1, 1,
-1.465639, 1.895283, -1.960182, 1, 1, 1, 1, 1,
-1.465519, -0.6388179, -1.940893, 1, 1, 1, 1, 1,
-1.4648, 0.2361018, -0.511781, 1, 1, 1, 1, 1,
-1.45426, -1.534247, -3.242782, 1, 1, 1, 1, 1,
-1.453005, 2.003964, -0.2338302, 1, 1, 1, 1, 1,
-1.448669, 0.9894419, -1.857983, 1, 1, 1, 1, 1,
-1.438372, 1.519805, -0.6534315, 1, 1, 1, 1, 1,
-1.435739, 0.4967866, -0.3374198, 1, 1, 1, 1, 1,
-1.41877, 1.389589, -1.73126, 1, 1, 1, 1, 1,
-1.403353, -1.431838, -2.128946, 0, 0, 1, 1, 1,
-1.396716, 0.8291188, -1.745974, 1, 0, 0, 1, 1,
-1.392901, -0.3340912, -1.91294, 1, 0, 0, 1, 1,
-1.391498, -0.3880598, -0.5581751, 1, 0, 0, 1, 1,
-1.389475, 0.8290335, -1.745461, 1, 0, 0, 1, 1,
-1.384805, -0.6436876, -2.815181, 1, 0, 0, 1, 1,
-1.377961, -1.080973, -1.629864, 0, 0, 0, 1, 1,
-1.365275, -0.6504175, -2.745428, 0, 0, 0, 1, 1,
-1.361881, 2.275028, -1.566552, 0, 0, 0, 1, 1,
-1.350431, 0.7349796, -0.7238228, 0, 0, 0, 1, 1,
-1.344659, 1.714278, 0.5626035, 0, 0, 0, 1, 1,
-1.329862, 0.9202438, 0.7040327, 0, 0, 0, 1, 1,
-1.327035, -0.8268128, -0.9839025, 0, 0, 0, 1, 1,
-1.321211, 1.544112, -0.6094903, 1, 1, 1, 1, 1,
-1.317485, -1.079868, -1.114811, 1, 1, 1, 1, 1,
-1.312339, 0.1756471, -3.086106, 1, 1, 1, 1, 1,
-1.3117, 0.9676577, -0.2948033, 1, 1, 1, 1, 1,
-1.305018, -0.1595281, -1.468377, 1, 1, 1, 1, 1,
-1.300759, -1.429205, -0.6352735, 1, 1, 1, 1, 1,
-1.287567, 0.06155407, 0.2573591, 1, 1, 1, 1, 1,
-1.285935, 1.43786, -1.128321, 1, 1, 1, 1, 1,
-1.285416, 0.1977763, -2.084965, 1, 1, 1, 1, 1,
-1.280945, -1.595221, -1.178256, 1, 1, 1, 1, 1,
-1.262367, 0.3308147, -2.910424, 1, 1, 1, 1, 1,
-1.25426, -0.8738994, -1.767023, 1, 1, 1, 1, 1,
-1.247212, -1.504513, -1.58475, 1, 1, 1, 1, 1,
-1.236886, 0.2284254, -0.5448245, 1, 1, 1, 1, 1,
-1.235822, 0.5500456, 1.670993, 1, 1, 1, 1, 1,
-1.232326, -0.6960135, -1.518191, 0, 0, 1, 1, 1,
-1.225704, -0.5536533, -1.670949, 1, 0, 0, 1, 1,
-1.22299, 0.4204374, -1.406821, 1, 0, 0, 1, 1,
-1.219891, 1.482008, -0.5216373, 1, 0, 0, 1, 1,
-1.211244, -1.667445, -3.809582, 1, 0, 0, 1, 1,
-1.20774, 1.343951, -1.196355, 1, 0, 0, 1, 1,
-1.201604, -0.2034072, -2.954511, 0, 0, 0, 1, 1,
-1.192384, -0.006271922, -0.7363488, 0, 0, 0, 1, 1,
-1.191258, -1.438749, -1.283476, 0, 0, 0, 1, 1,
-1.181673, 1.346902, -0.1721305, 0, 0, 0, 1, 1,
-1.173804, 0.5944063, -1.440976, 0, 0, 0, 1, 1,
-1.151709, 1.481617, -0.3333744, 0, 0, 0, 1, 1,
-1.144219, 0.2915905, 1.414623, 0, 0, 0, 1, 1,
-1.143244, 1.102826, -0.8515671, 1, 1, 1, 1, 1,
-1.131819, -0.05178769, -2.667721, 1, 1, 1, 1, 1,
-1.126408, 1.975709, -0.5296041, 1, 1, 1, 1, 1,
-1.125923, -0.5643031, -4.289011, 1, 1, 1, 1, 1,
-1.116128, -1.556372, -2.266121, 1, 1, 1, 1, 1,
-1.103898, 1.226009, -0.8741244, 1, 1, 1, 1, 1,
-1.089557, 0.02553944, -0.3452862, 1, 1, 1, 1, 1,
-1.084243, -0.2436416, -1.927043, 1, 1, 1, 1, 1,
-1.07838, -1.028316, -1.671302, 1, 1, 1, 1, 1,
-1.073075, 0.1622938, 1.282946, 1, 1, 1, 1, 1,
-1.061815, 1.79398, -2.010058, 1, 1, 1, 1, 1,
-1.059207, 0.8586767, -0.6751234, 1, 1, 1, 1, 1,
-1.057834, 0.1397771, -0.4328007, 1, 1, 1, 1, 1,
-1.055985, -1.656974, -2.8993, 1, 1, 1, 1, 1,
-1.054194, 0.2333294, -1.813231, 1, 1, 1, 1, 1,
-1.045624, -0.537401, -2.216605, 0, 0, 1, 1, 1,
-1.035899, -0.4862103, -2.474874, 1, 0, 0, 1, 1,
-1.034019, 1.37995, 0.2014037, 1, 0, 0, 1, 1,
-1.027621, 0.09174946, -0.68193, 1, 0, 0, 1, 1,
-1.020532, 0.03112796, -2.394407, 1, 0, 0, 1, 1,
-1.019227, -1.333212, -2.095514, 1, 0, 0, 1, 1,
-1.016488, 0.204879, -1.836707, 0, 0, 0, 1, 1,
-1.010234, -0.1841481, -1.353699, 0, 0, 0, 1, 1,
-0.9895808, 0.3468415, -0.4662349, 0, 0, 0, 1, 1,
-0.985634, -1.012031, -2.421071, 0, 0, 0, 1, 1,
-0.9850339, -1.283937, -1.113793, 0, 0, 0, 1, 1,
-0.984062, 1.182209, -2.42566, 0, 0, 0, 1, 1,
-0.9784263, -0.3555793, -2.445531, 0, 0, 0, 1, 1,
-0.9759337, 0.3453558, -2.891082, 1, 1, 1, 1, 1,
-0.9663908, 0.4239205, -2.007723, 1, 1, 1, 1, 1,
-0.9657514, 0.4416132, -1.833801, 1, 1, 1, 1, 1,
-0.9648296, 0.5072594, -2.534947, 1, 1, 1, 1, 1,
-0.9625619, -0.9876283, -2.287376, 1, 1, 1, 1, 1,
-0.9583825, -0.5661845, -2.63337, 1, 1, 1, 1, 1,
-0.9571801, -0.007605423, -0.2955249, 1, 1, 1, 1, 1,
-0.9543946, 0.2633296, -0.6228711, 1, 1, 1, 1, 1,
-0.9528691, 0.7158597, -1.840928, 1, 1, 1, 1, 1,
-0.9525661, 0.9904767, -2.878254, 1, 1, 1, 1, 1,
-0.943478, -2.326159, -3.781193, 1, 1, 1, 1, 1,
-0.9392403, 1.383933, 0.4538476, 1, 1, 1, 1, 1,
-0.9380503, -0.1785383, -1.512732, 1, 1, 1, 1, 1,
-0.9299549, 0.1821494, -1.696935, 1, 1, 1, 1, 1,
-0.9290613, 2.014825, -0.3226138, 1, 1, 1, 1, 1,
-0.9198558, -0.2826273, -2.082052, 0, 0, 1, 1, 1,
-0.9160155, 2.749156, 0.3130809, 1, 0, 0, 1, 1,
-0.9115088, 0.5350066, -1.30856, 1, 0, 0, 1, 1,
-0.9074592, -0.3850921, -1.279573, 1, 0, 0, 1, 1,
-0.9026453, 0.5412127, -2.136969, 1, 0, 0, 1, 1,
-0.9018353, 1.92325, -1.333265, 1, 0, 0, 1, 1,
-0.8996676, 0.5324583, -0.7394204, 0, 0, 0, 1, 1,
-0.8995107, -0.786347, -1.256118, 0, 0, 0, 1, 1,
-0.8993111, -1.066264, -4.022619, 0, 0, 0, 1, 1,
-0.8969151, 0.2591099, -1.604636, 0, 0, 0, 1, 1,
-0.8946897, 1.467106, -0.1800798, 0, 0, 0, 1, 1,
-0.8918738, -0.7268059, -2.425528, 0, 0, 0, 1, 1,
-0.8908589, 0.7590908, -1.699313, 0, 0, 0, 1, 1,
-0.886008, -0.09509403, -1.998826, 1, 1, 1, 1, 1,
-0.8837301, -0.8212071, -1.184659, 1, 1, 1, 1, 1,
-0.8742719, -1.733613, -4.949761, 1, 1, 1, 1, 1,
-0.8739576, -0.9890987, -1.345685, 1, 1, 1, 1, 1,
-0.8711439, 0.09310874, -1.608227, 1, 1, 1, 1, 1,
-0.8691369, 1.136583, 1.125519, 1, 1, 1, 1, 1,
-0.8664182, -0.2777685, -0.613784, 1, 1, 1, 1, 1,
-0.8660535, -0.1494434, -0.2564147, 1, 1, 1, 1, 1,
-0.8651472, -1.091052, -4.003775, 1, 1, 1, 1, 1,
-0.8556775, 0.6127523, -0.797581, 1, 1, 1, 1, 1,
-0.8511288, 1.692906, -0.1765113, 1, 1, 1, 1, 1,
-0.8497081, 0.9716076, -1.467652, 1, 1, 1, 1, 1,
-0.8469179, 1.289486, 0.1694554, 1, 1, 1, 1, 1,
-0.8449615, -0.8938223, -3.87274, 1, 1, 1, 1, 1,
-0.8316048, -1.466545, -1.645336, 1, 1, 1, 1, 1,
-0.8281135, -0.2233105, -3.486485, 0, 0, 1, 1, 1,
-0.8278727, 0.6689777, -0.6350961, 1, 0, 0, 1, 1,
-0.8260338, -0.5688451, -1.690628, 1, 0, 0, 1, 1,
-0.8244529, -0.2578092, -3.448011, 1, 0, 0, 1, 1,
-0.8244439, 2.615428, -1.322198, 1, 0, 0, 1, 1,
-0.8237944, 0.1713224, -1.656068, 1, 0, 0, 1, 1,
-0.8230389, 1.010956, -0.9872057, 0, 0, 0, 1, 1,
-0.8188919, -0.9678778, -1.523678, 0, 0, 0, 1, 1,
-0.8180523, 0.3421441, -1.12517, 0, 0, 0, 1, 1,
-0.8177122, -0.03849676, -2.414349, 0, 0, 0, 1, 1,
-0.8169767, -0.295265, -3.114567, 0, 0, 0, 1, 1,
-0.8164879, 0.148387, -1.791293, 0, 0, 0, 1, 1,
-0.8149493, -0.7236143, -2.893013, 0, 0, 0, 1, 1,
-0.8143576, -0.9400015, -1.858948, 1, 1, 1, 1, 1,
-0.8133554, 0.489034, -2.826697, 1, 1, 1, 1, 1,
-0.8131061, -2.251907, -2.881731, 1, 1, 1, 1, 1,
-0.8112605, -2.006585, -2.540352, 1, 1, 1, 1, 1,
-0.805404, -0.7293456, -2.717424, 1, 1, 1, 1, 1,
-0.8032869, -3.058938, -4.082969, 1, 1, 1, 1, 1,
-0.7991084, 0.4698946, -2.641169, 1, 1, 1, 1, 1,
-0.7988993, 0.4140931, -0.1530813, 1, 1, 1, 1, 1,
-0.7943347, -1.100888, -1.697772, 1, 1, 1, 1, 1,
-0.7892302, 0.4647059, -0.9159354, 1, 1, 1, 1, 1,
-0.782252, -1.109108, -2.037667, 1, 1, 1, 1, 1,
-0.7766012, 1.174725, 1.800149, 1, 1, 1, 1, 1,
-0.7701955, 2.714811, 1.055996, 1, 1, 1, 1, 1,
-0.7646869, 1.772409, -2.088887, 1, 1, 1, 1, 1,
-0.7592801, -0.484342, -0.4889081, 1, 1, 1, 1, 1,
-0.7561128, -0.235661, -2.145118, 0, 0, 1, 1, 1,
-0.7514923, 1.10311, 0.6464365, 1, 0, 0, 1, 1,
-0.7387876, -0.1657575, -1.763583, 1, 0, 0, 1, 1,
-0.7377805, -0.5514721, -2.570276, 1, 0, 0, 1, 1,
-0.7247981, 0.8129011, -0.2224626, 1, 0, 0, 1, 1,
-0.7242846, -0.2166964, -1.90541, 1, 0, 0, 1, 1,
-0.7227547, 0.05806534, -1.93002, 0, 0, 0, 1, 1,
-0.7176593, 1.9564, -0.8219395, 0, 0, 0, 1, 1,
-0.716745, 0.6297672, -1.724202, 0, 0, 0, 1, 1,
-0.7148756, 1.090994, 0.2166145, 0, 0, 0, 1, 1,
-0.7139461, 0.3001423, -1.357608, 0, 0, 0, 1, 1,
-0.7130463, -0.06215203, -0.8006403, 0, 0, 0, 1, 1,
-0.7070259, -0.6200418, -2.353308, 0, 0, 0, 1, 1,
-0.7045551, -1.982126, -1.98336, 1, 1, 1, 1, 1,
-0.7021798, 0.5606112, -0.4006754, 1, 1, 1, 1, 1,
-0.695279, 0.4360311, -0.0398491, 1, 1, 1, 1, 1,
-0.6942344, -0.3863665, -1.926902, 1, 1, 1, 1, 1,
-0.6901148, -1.259699, -2.620597, 1, 1, 1, 1, 1,
-0.6818002, -1.009924, -2.129368, 1, 1, 1, 1, 1,
-0.6807594, 0.5249479, -1.449063, 1, 1, 1, 1, 1,
-0.6720111, 1.657856, -1.267789, 1, 1, 1, 1, 1,
-0.6667309, 0.3972494, -2.296703, 1, 1, 1, 1, 1,
-0.6627353, -1.294073, -2.88199, 1, 1, 1, 1, 1,
-0.6593423, -0.5563221, -1.143406, 1, 1, 1, 1, 1,
-0.6577597, 0.5893085, -0.7547637, 1, 1, 1, 1, 1,
-0.6517301, -1.526065, -1.803208, 1, 1, 1, 1, 1,
-0.6495684, 0.5271978, -1.102241, 1, 1, 1, 1, 1,
-0.6487423, 0.6541396, -2.22712, 1, 1, 1, 1, 1,
-0.6428648, 0.4240969, -1.492718, 0, 0, 1, 1, 1,
-0.6413401, 0.4811949, -3.497408, 1, 0, 0, 1, 1,
-0.6409093, -0.2092793, -1.466666, 1, 0, 0, 1, 1,
-0.6365103, -1.685623, -3.450136, 1, 0, 0, 1, 1,
-0.6361856, -0.04236321, -2.900857, 1, 0, 0, 1, 1,
-0.6306489, -1.680095, -3.820042, 1, 0, 0, 1, 1,
-0.6269152, -0.988876, -4.270854, 0, 0, 0, 1, 1,
-0.6208474, -0.9393643, -3.783638, 0, 0, 0, 1, 1,
-0.6168305, -0.4584992, -1.532446, 0, 0, 0, 1, 1,
-0.6120491, 1.974707, -2.813739, 0, 0, 0, 1, 1,
-0.6114633, 0.7293277, -3.058435, 0, 0, 0, 1, 1,
-0.6105631, 0.4206743, -0.2439038, 0, 0, 0, 1, 1,
-0.6083392, -0.7443815, -2.264817, 0, 0, 0, 1, 1,
-0.6049217, 1.705764, -0.4933728, 1, 1, 1, 1, 1,
-0.6040075, 0.5418112, 0.05262409, 1, 1, 1, 1, 1,
-0.6021162, 0.4537907, -0.327242, 1, 1, 1, 1, 1,
-0.5800471, 1.539064, -1.035309, 1, 1, 1, 1, 1,
-0.5798345, -1.2784, -3.864506, 1, 1, 1, 1, 1,
-0.5792683, -1.593775, -3.57162, 1, 1, 1, 1, 1,
-0.5785313, -1.316422, -2.355126, 1, 1, 1, 1, 1,
-0.577172, 0.756819, -2.730557, 1, 1, 1, 1, 1,
-0.5766841, 0.4881614, -0.2068512, 1, 1, 1, 1, 1,
-0.5749991, -1.997603, -3.987239, 1, 1, 1, 1, 1,
-0.5747355, -0.1824371, -2.270992, 1, 1, 1, 1, 1,
-0.5694535, 0.6545624, -1.015509, 1, 1, 1, 1, 1,
-0.5672852, -0.5671271, -1.248439, 1, 1, 1, 1, 1,
-0.5588406, 1.053571, -1.015122, 1, 1, 1, 1, 1,
-0.5565461, -1.171516, -2.290027, 1, 1, 1, 1, 1,
-0.5532801, -2.654667, -1.918013, 0, 0, 1, 1, 1,
-0.5530998, -0.7818472, -2.662923, 1, 0, 0, 1, 1,
-0.5519035, 0.4100267, -0.7142707, 1, 0, 0, 1, 1,
-0.5506459, -0.3353686, -1.751033, 1, 0, 0, 1, 1,
-0.5444691, -0.550639, -1.549061, 1, 0, 0, 1, 1,
-0.5438215, -0.287089, -1.365139, 1, 0, 0, 1, 1,
-0.5400447, -0.5332149, -0.5780079, 0, 0, 0, 1, 1,
-0.5379982, -0.1884829, -1.824324, 0, 0, 0, 1, 1,
-0.5332187, 0.5877805, -2.028425, 0, 0, 0, 1, 1,
-0.527181, 0.3162213, 0.1381153, 0, 0, 0, 1, 1,
-0.5270594, -0.541818, -0.3246551, 0, 0, 0, 1, 1,
-0.5264135, 0.1785767, -1.562513, 0, 0, 0, 1, 1,
-0.5232834, -0.2802811, -2.176269, 0, 0, 0, 1, 1,
-0.5223291, -0.3312443, -1.083153, 1, 1, 1, 1, 1,
-0.5187897, -0.002899741, 0.3458546, 1, 1, 1, 1, 1,
-0.5119002, 1.428651, -1.909302, 1, 1, 1, 1, 1,
-0.5057418, -0.8858499, -1.647277, 1, 1, 1, 1, 1,
-0.4973705, -1.796367, -4.326669, 1, 1, 1, 1, 1,
-0.4961128, -0.3004059, -3.368062, 1, 1, 1, 1, 1,
-0.4938487, 0.2316461, -0.693308, 1, 1, 1, 1, 1,
-0.4893199, -1.27958, -1.685323, 1, 1, 1, 1, 1,
-0.483946, 0.3313741, -1.766786, 1, 1, 1, 1, 1,
-0.4821565, -1.07566, -1.722768, 1, 1, 1, 1, 1,
-0.4780409, -0.9841753, -0.9297671, 1, 1, 1, 1, 1,
-0.4736747, -0.4524703, -3.57939, 1, 1, 1, 1, 1,
-0.468976, -1.585683, -2.438401, 1, 1, 1, 1, 1,
-0.468769, 1.277963, -2.222672, 1, 1, 1, 1, 1,
-0.4663305, 0.9007095, 0.2001504, 1, 1, 1, 1, 1,
-0.4652206, -0.1206877, -2.461351, 0, 0, 1, 1, 1,
-0.4631097, 1.30926, 1.428358, 1, 0, 0, 1, 1,
-0.4621428, 0.2639061, -1.956496, 1, 0, 0, 1, 1,
-0.4601084, 1.434552, -1.189659, 1, 0, 0, 1, 1,
-0.4566889, -0.2188653, -2.154938, 1, 0, 0, 1, 1,
-0.4553577, -0.8090045, -2.748008, 1, 0, 0, 1, 1,
-0.4532607, 0.1420488, -0.300114, 0, 0, 0, 1, 1,
-0.4530192, 0.1191368, 0.3139669, 0, 0, 0, 1, 1,
-0.4526665, 1.726282, -0.2857654, 0, 0, 0, 1, 1,
-0.4435244, 0.5897567, 0.9715998, 0, 0, 0, 1, 1,
-0.4394304, 2.250434, -0.9447908, 0, 0, 0, 1, 1,
-0.437577, -1.140618, -3.073315, 0, 0, 0, 1, 1,
-0.4353014, -0.04356643, -4.049094, 0, 0, 0, 1, 1,
-0.4278184, 1.289034, -0.3848731, 1, 1, 1, 1, 1,
-0.4239058, 1.116773, 0.8533801, 1, 1, 1, 1, 1,
-0.4236989, -0.1154734, -2.754071, 1, 1, 1, 1, 1,
-0.4229859, -1.085427, -2.994727, 1, 1, 1, 1, 1,
-0.4210646, 0.3962519, -0.4516214, 1, 1, 1, 1, 1,
-0.4175719, 0.4641575, -0.939651, 1, 1, 1, 1, 1,
-0.4172858, 0.5934387, -3.177745, 1, 1, 1, 1, 1,
-0.4106879, -1.587875, -2.671487, 1, 1, 1, 1, 1,
-0.4071909, 1.491438, -0.03777248, 1, 1, 1, 1, 1,
-0.4013294, -0.02806623, -1.689221, 1, 1, 1, 1, 1,
-0.3940119, -0.9922889, -3.265615, 1, 1, 1, 1, 1,
-0.3932348, 1.4654, 1.396089, 1, 1, 1, 1, 1,
-0.3911538, -0.3664403, -2.143513, 1, 1, 1, 1, 1,
-0.3897061, -0.2695037, -1.92917, 1, 1, 1, 1, 1,
-0.3887755, 1.731453, 0.2006924, 1, 1, 1, 1, 1,
-0.3867796, 0.005214304, -0.395242, 0, 0, 1, 1, 1,
-0.3865834, 0.4246967, -0.05684059, 1, 0, 0, 1, 1,
-0.3780523, 1.922642, -1.130271, 1, 0, 0, 1, 1,
-0.3750769, 0.2325036, -1.415396, 1, 0, 0, 1, 1,
-0.3731727, 2.736998, 0.1455165, 1, 0, 0, 1, 1,
-0.3722343, -0.5009305, -2.259219, 1, 0, 0, 1, 1,
-0.3678319, -2.443435, -1.586314, 0, 0, 0, 1, 1,
-0.3656298, 0.06995092, -2.654446, 0, 0, 0, 1, 1,
-0.3621685, -2.544824, -2.01698, 0, 0, 0, 1, 1,
-0.362015, -0.7293704, -5.065744, 0, 0, 0, 1, 1,
-0.3609106, -0.6323683, -1.598912, 0, 0, 0, 1, 1,
-0.3588063, 1.202347, -0.04498348, 0, 0, 0, 1, 1,
-0.356944, -1.20631, -3.031191, 0, 0, 0, 1, 1,
-0.3569038, -0.5079013, -2.023591, 1, 1, 1, 1, 1,
-0.3485164, 0.3525453, -0.4309508, 1, 1, 1, 1, 1,
-0.3453049, 1.693392, -1.081043, 1, 1, 1, 1, 1,
-0.3444414, 0.6909744, 1.235216, 1, 1, 1, 1, 1,
-0.3412155, -0.3600414, -2.474531, 1, 1, 1, 1, 1,
-0.3386922, 0.2029689, -2.401784, 1, 1, 1, 1, 1,
-0.3378107, -0.7111321, -2.735031, 1, 1, 1, 1, 1,
-0.333863, 0.07609848, -2.077802, 1, 1, 1, 1, 1,
-0.3318727, -0.4808894, -1.965829, 1, 1, 1, 1, 1,
-0.329622, 0.06778032, -1.103816, 1, 1, 1, 1, 1,
-0.32914, 0.2840464, -1.394937, 1, 1, 1, 1, 1,
-0.3289141, -0.1364768, -3.629199, 1, 1, 1, 1, 1,
-0.3268363, -0.5044932, -2.127126, 1, 1, 1, 1, 1,
-0.3206741, -0.6780868, -1.645116, 1, 1, 1, 1, 1,
-0.3174166, -1.367302, -1.81922, 1, 1, 1, 1, 1,
-0.3172934, 0.06675986, 0.3553837, 0, 0, 1, 1, 1,
-0.3139033, 0.5541748, -0.8112804, 1, 0, 0, 1, 1,
-0.3110744, 0.115477, -1.007325, 1, 0, 0, 1, 1,
-0.3104575, -0.6647507, -1.908415, 1, 0, 0, 1, 1,
-0.310068, -1.842265, -0.8231211, 1, 0, 0, 1, 1,
-0.3084624, -1.070999, -2.800526, 1, 0, 0, 1, 1,
-0.2967329, -0.2884451, -4.251181, 0, 0, 0, 1, 1,
-0.2963889, -0.4484845, -2.656124, 0, 0, 0, 1, 1,
-0.2948384, 1.08974, -0.2780333, 0, 0, 0, 1, 1,
-0.2930392, -2.085126, -4.124369, 0, 0, 0, 1, 1,
-0.2860515, -0.8194284, -1.965072, 0, 0, 0, 1, 1,
-0.2850631, -0.5128922, -2.341717, 0, 0, 0, 1, 1,
-0.2850361, -0.8814406, -2.781782, 0, 0, 0, 1, 1,
-0.2831282, -0.3013193, -1.437916, 1, 1, 1, 1, 1,
-0.2827011, 1.376397, -0.4436342, 1, 1, 1, 1, 1,
-0.2787587, 0.1963893, -2.415837, 1, 1, 1, 1, 1,
-0.2721084, -2.660465, -2.058196, 1, 1, 1, 1, 1,
-0.2688688, -0.9167283, -2.975962, 1, 1, 1, 1, 1,
-0.2673169, -0.2809206, -2.724028, 1, 1, 1, 1, 1,
-0.2619427, -0.1464927, -1.154809, 1, 1, 1, 1, 1,
-0.2611795, -0.8136887, -3.716319, 1, 1, 1, 1, 1,
-0.2599036, -0.6520941, -2.659337, 1, 1, 1, 1, 1,
-0.2526622, 0.1840362, -0.8832242, 1, 1, 1, 1, 1,
-0.2508242, -0.820219, -3.342107, 1, 1, 1, 1, 1,
-0.2495133, -0.6237805, -2.472827, 1, 1, 1, 1, 1,
-0.2460456, 0.02723177, -2.939058, 1, 1, 1, 1, 1,
-0.2398534, 0.5964566, 0.1146763, 1, 1, 1, 1, 1,
-0.2397345, 1.337704, 0.8127396, 1, 1, 1, 1, 1,
-0.230794, 0.5843063, 0.8169432, 0, 0, 1, 1, 1,
-0.2295891, -1.711488, -4.757204, 1, 0, 0, 1, 1,
-0.2274627, -0.4086974, -3.71838, 1, 0, 0, 1, 1,
-0.2263344, 1.530596, 0.5298865, 1, 0, 0, 1, 1,
-0.2207098, 0.5226177, 1.603284, 1, 0, 0, 1, 1,
-0.2151207, 2.198381, 1.802458, 1, 0, 0, 1, 1,
-0.2135613, 1.085634, -1.629353, 0, 0, 0, 1, 1,
-0.2127057, -0.4550007, -2.506816, 0, 0, 0, 1, 1,
-0.2068421, 0.2179921, 1.004288, 0, 0, 0, 1, 1,
-0.2061551, 0.4853903, -0.2180174, 0, 0, 0, 1, 1,
-0.2042577, 0.005134039, -0.1759911, 0, 0, 0, 1, 1,
-0.2028435, -0.8737088, -1.397946, 0, 0, 0, 1, 1,
-0.1980531, 0.921465, -0.4945407, 0, 0, 0, 1, 1,
-0.1932077, 0.01109148, -2.219554, 1, 1, 1, 1, 1,
-0.1926681, 0.1472429, -1.694754, 1, 1, 1, 1, 1,
-0.1909811, -0.6463584, -2.302937, 1, 1, 1, 1, 1,
-0.1906514, -1.49982, -4.968783, 1, 1, 1, 1, 1,
-0.1901978, 1.659176, -1.113759, 1, 1, 1, 1, 1,
-0.1900628, -0.7943457, -2.768517, 1, 1, 1, 1, 1,
-0.1886964, -0.6566643, -4.002379, 1, 1, 1, 1, 1,
-0.1836755, 1.075064, 0.2179532, 1, 1, 1, 1, 1,
-0.1812962, 1.326396, -1.078389, 1, 1, 1, 1, 1,
-0.1802081, 1.201614, -0.2032265, 1, 1, 1, 1, 1,
-0.1787643, -0.4803425, -3.54577, 1, 1, 1, 1, 1,
-0.1760547, 0.5103864, -0.7230628, 1, 1, 1, 1, 1,
-0.1671859, 2.681265, -0.9574495, 1, 1, 1, 1, 1,
-0.1659233, -0.2972685, -0.9216787, 1, 1, 1, 1, 1,
-0.1610839, 0.3617161, -0.02260992, 1, 1, 1, 1, 1,
-0.1594476, -0.1958803, -0.9233353, 0, 0, 1, 1, 1,
-0.1557791, -0.005326343, -2.806064, 1, 0, 0, 1, 1,
-0.1438609, -0.6092349, -3.171816, 1, 0, 0, 1, 1,
-0.1412134, 1.635628, -0.5458, 1, 0, 0, 1, 1,
-0.1409365, -0.5390378, -1.427678, 1, 0, 0, 1, 1,
-0.1405749, -0.6895242, -2.278546, 1, 0, 0, 1, 1,
-0.1403601, 1.435697, -0.4916274, 0, 0, 0, 1, 1,
-0.1400162, -1.781698, -2.331866, 0, 0, 0, 1, 1,
-0.1393883, 0.4469788, 1.322349, 0, 0, 0, 1, 1,
-0.1350812, 0.4874887, -1.083459, 0, 0, 0, 1, 1,
-0.1326247, -0.7402132, -3.612809, 0, 0, 0, 1, 1,
-0.1299449, -0.5901828, -3.857885, 0, 0, 0, 1, 1,
-0.1298699, 0.2106875, -1.159712, 0, 0, 0, 1, 1,
-0.1249366, 0.1288075, -0.8355613, 1, 1, 1, 1, 1,
-0.1240772, -0.6565554, -3.1192, 1, 1, 1, 1, 1,
-0.1186586, -0.3425148, -2.369219, 1, 1, 1, 1, 1,
-0.1146444, 0.8492453, 2.175939, 1, 1, 1, 1, 1,
-0.1107426, 1.229157, -0.3666236, 1, 1, 1, 1, 1,
-0.1103903, -0.02111778, -1.013439, 1, 1, 1, 1, 1,
-0.1095317, -0.1566471, -3.043129, 1, 1, 1, 1, 1,
-0.1077549, 0.2058015, 0.2320753, 1, 1, 1, 1, 1,
-0.1061974, -0.01358567, -2.985425, 1, 1, 1, 1, 1,
-0.1007907, 0.2181688, 0.2656775, 1, 1, 1, 1, 1,
-0.1004508, 0.09709673, 1.07789, 1, 1, 1, 1, 1,
-0.1002418, 0.1264062, -0.8292438, 1, 1, 1, 1, 1,
-0.09744352, 1.18543, 1.189646, 1, 1, 1, 1, 1,
-0.095029, 0.8828855, 0.6096944, 1, 1, 1, 1, 1,
-0.09491949, -1.412886, -3.59277, 1, 1, 1, 1, 1,
-0.09315325, -0.2791928, -2.056053, 0, 0, 1, 1, 1,
-0.09314563, -2.108586, -3.363727, 1, 0, 0, 1, 1,
-0.08553671, 2.289962, 0.3402227, 1, 0, 0, 1, 1,
-0.08261015, 0.6238126, 0.06066916, 1, 0, 0, 1, 1,
-0.07505088, 0.5634339, -0.1393361, 1, 0, 0, 1, 1,
-0.07248179, -0.2583603, -1.713305, 1, 0, 0, 1, 1,
-0.07070037, -0.006393832, -0.4396859, 0, 0, 0, 1, 1,
-0.06669324, 0.5412229, 0.6123801, 0, 0, 0, 1, 1,
-0.06180695, 1.631846, 0.128255, 0, 0, 0, 1, 1,
-0.06000509, 0.7562624, -1.04403, 0, 0, 0, 1, 1,
-0.05782215, -1.477141, -4.038183, 0, 0, 0, 1, 1,
-0.05545014, -0.106577, -3.239881, 0, 0, 0, 1, 1,
-0.0552266, 0.3749169, 0.4803981, 0, 0, 0, 1, 1,
-0.05510633, -0.9167652, -2.271013, 1, 1, 1, 1, 1,
-0.05485718, 0.4327412, -0.4780526, 1, 1, 1, 1, 1,
-0.05326464, -0.3796192, -0.3851543, 1, 1, 1, 1, 1,
-0.05135635, 1.560055, 0.6084366, 1, 1, 1, 1, 1,
-0.04825398, 0.03063059, -1.219612, 1, 1, 1, 1, 1,
-0.04754597, 0.3335408, 0.4092512, 1, 1, 1, 1, 1,
-0.04702001, 0.4440862, -0.9779565, 1, 1, 1, 1, 1,
-0.04025595, -1.94781, -4.175911, 1, 1, 1, 1, 1,
-0.04003519, 0.7044726, -1.65729, 1, 1, 1, 1, 1,
-0.03801396, -0.7031894, -3.699035, 1, 1, 1, 1, 1,
-0.03768854, -0.6993655, -2.330652, 1, 1, 1, 1, 1,
-0.0338039, 0.06813591, -1.645544, 1, 1, 1, 1, 1,
-0.03339596, -0.1425938, -2.45244, 1, 1, 1, 1, 1,
-0.03218747, -1.039651, -1.8333, 1, 1, 1, 1, 1,
-0.03134323, 0.8915465, 1.740765, 1, 1, 1, 1, 1,
-0.02792781, 1.374244, 0.3888539, 0, 0, 1, 1, 1,
-0.02229537, 0.0005628659, -2.505923, 1, 0, 0, 1, 1,
-0.0199473, -0.8687212, -2.709339, 1, 0, 0, 1, 1,
-0.01981742, 1.082341, -0.4844116, 1, 0, 0, 1, 1,
-0.0192895, 0.03578065, -0.4114133, 1, 0, 0, 1, 1,
-0.01126032, -1.118954, -2.880507, 1, 0, 0, 1, 1,
-0.01060124, -0.6771371, -3.638755, 0, 0, 0, 1, 1,
-0.00954987, 0.1454182, 0.1802315, 0, 0, 0, 1, 1,
-0.005447928, -2.275083, -1.983885, 0, 0, 0, 1, 1,
-0.003749179, 0.906772, 1.328144, 0, 0, 0, 1, 1,
-6.055788e-05, -0.02578923, -4.75005, 0, 0, 0, 1, 1,
0.002221076, 1.104692, 0.151312, 0, 0, 0, 1, 1,
0.006549896, 1.192867, -0.4015616, 0, 0, 0, 1, 1,
0.006568603, -0.1187133, 1.854144, 1, 1, 1, 1, 1,
0.007301386, -1.615281, 2.326821, 1, 1, 1, 1, 1,
0.008359779, -0.5121653, 3.307812, 1, 1, 1, 1, 1,
0.009693155, -0.318844, 1.529143, 1, 1, 1, 1, 1,
0.02047963, -0.3127588, 3.787248, 1, 1, 1, 1, 1,
0.02070262, -0.2161339, 4.343691, 1, 1, 1, 1, 1,
0.02155889, -0.9227077, 2.912215, 1, 1, 1, 1, 1,
0.02205401, -0.8661532, 3.930511, 1, 1, 1, 1, 1,
0.02322611, -0.02640181, 1.572086, 1, 1, 1, 1, 1,
0.0244967, 0.453873, 1.164653, 1, 1, 1, 1, 1,
0.02519569, 1.353866, -0.3344496, 1, 1, 1, 1, 1,
0.02636092, -0.4653165, 3.552233, 1, 1, 1, 1, 1,
0.02753917, 2.262805, 1.379762, 1, 1, 1, 1, 1,
0.02903233, 0.03886667, -1.251002, 1, 1, 1, 1, 1,
0.03212706, 0.8882371, 0.8569518, 1, 1, 1, 1, 1,
0.03313126, -0.9322919, 2.94057, 0, 0, 1, 1, 1,
0.033956, -0.4817145, 3.776832, 1, 0, 0, 1, 1,
0.03466873, 0.6656119, 1.072769, 1, 0, 0, 1, 1,
0.03685873, -1.074082, 1.619361, 1, 0, 0, 1, 1,
0.03691023, 1.355289, 1.150894, 1, 0, 0, 1, 1,
0.03911462, -0.8834798, 1.569369, 1, 0, 0, 1, 1,
0.04107681, -1.469283, 3.223034, 0, 0, 0, 1, 1,
0.04158393, -0.7905705, 2.69337, 0, 0, 0, 1, 1,
0.04241949, 0.01890112, 1.728816, 0, 0, 0, 1, 1,
0.04597739, -0.2850078, 1.678432, 0, 0, 0, 1, 1,
0.04914926, 1.558356, 0.3765095, 0, 0, 0, 1, 1,
0.05292624, -0.6449519, 4.603823, 0, 0, 0, 1, 1,
0.05441654, -0.7470137, 2.283251, 0, 0, 0, 1, 1,
0.05867627, -1.670841, 2.963479, 1, 1, 1, 1, 1,
0.06459251, 1.637949, -1.074557, 1, 1, 1, 1, 1,
0.06660407, -0.5930374, 1.962487, 1, 1, 1, 1, 1,
0.06983186, 0.4668169, -0.7793697, 1, 1, 1, 1, 1,
0.07283577, -1.970965, 4.27174, 1, 1, 1, 1, 1,
0.07713971, 0.008297773, 0.857671, 1, 1, 1, 1, 1,
0.07720399, -0.8397933, 3.375611, 1, 1, 1, 1, 1,
0.08602887, 0.2895365, -0.09259637, 1, 1, 1, 1, 1,
0.0900544, 1.333636, -0.8791214, 1, 1, 1, 1, 1,
0.09541866, 1.653654, -0.1370711, 1, 1, 1, 1, 1,
0.09746613, -0.6997355, 3.274999, 1, 1, 1, 1, 1,
0.1032108, -0.9629577, 3.600679, 1, 1, 1, 1, 1,
0.1064068, 1.969209, -0.6757059, 1, 1, 1, 1, 1,
0.1099688, -0.905736, 2.437727, 1, 1, 1, 1, 1,
0.1134803, 0.104434, 1.725868, 1, 1, 1, 1, 1,
0.1135423, -0.0007052763, 0.4638889, 0, 0, 1, 1, 1,
0.1135791, 0.1500263, 0.5901809, 1, 0, 0, 1, 1,
0.1145054, 1.014644, 1.026456, 1, 0, 0, 1, 1,
0.1172141, -0.8273231, 3.208524, 1, 0, 0, 1, 1,
0.1190266, -0.2708991, 1.310451, 1, 0, 0, 1, 1,
0.1223592, -0.7127877, 2.715505, 1, 0, 0, 1, 1,
0.1231625, -0.5627695, 1.946882, 0, 0, 0, 1, 1,
0.1251959, 2.598954, -1.098516, 0, 0, 0, 1, 1,
0.1302308, 1.561745, -0.3998696, 0, 0, 0, 1, 1,
0.1310072, -0.6182573, 1.530671, 0, 0, 0, 1, 1,
0.1327927, -0.9561654, 4.260486, 0, 0, 0, 1, 1,
0.1329859, 1.152314, -0.5905823, 0, 0, 0, 1, 1,
0.1330115, -1.133177, 3.492795, 0, 0, 0, 1, 1,
0.1340399, -1.123486, 4.795139, 1, 1, 1, 1, 1,
0.137809, -1.166898, 4.607557, 1, 1, 1, 1, 1,
0.1462554, -0.2820343, 3.825042, 1, 1, 1, 1, 1,
0.1604169, 0.4329423, -0.7312356, 1, 1, 1, 1, 1,
0.1649045, -1.067528, 2.562886, 1, 1, 1, 1, 1,
0.1735123, -1.378676, 2.863648, 1, 1, 1, 1, 1,
0.1739882, -0.5638024, 1.498041, 1, 1, 1, 1, 1,
0.17813, 1.19566, 0.2310246, 1, 1, 1, 1, 1,
0.1787114, -1.807351, 3.312108, 1, 1, 1, 1, 1,
0.1805029, 0.3234363, 0.8633727, 1, 1, 1, 1, 1,
0.1865594, 2.792112, -0.5544308, 1, 1, 1, 1, 1,
0.1879114, -1.464139, 3.112354, 1, 1, 1, 1, 1,
0.1917183, -0.1775528, 2.675515, 1, 1, 1, 1, 1,
0.1937011, -0.8573341, 3.455946, 1, 1, 1, 1, 1,
0.1949801, 0.01189403, 1.216584, 1, 1, 1, 1, 1,
0.1986618, -0.0264728, 1.209794, 0, 0, 1, 1, 1,
0.2014721, 0.5272784, -0.8509717, 1, 0, 0, 1, 1,
0.2027256, -0.8786613, 3.010776, 1, 0, 0, 1, 1,
0.2058396, -0.1768074, 0.475625, 1, 0, 0, 1, 1,
0.2099975, -0.6538939, 3.055565, 1, 0, 0, 1, 1,
0.2100369, -0.6372609, 2.965582, 1, 0, 0, 1, 1,
0.2104543, 0.8215167, 0.3983861, 0, 0, 0, 1, 1,
0.2109365, 1.721513, 1.130421, 0, 0, 0, 1, 1,
0.2122957, -1.18026, 1.76035, 0, 0, 0, 1, 1,
0.2123836, -0.294374, 4.443836, 0, 0, 0, 1, 1,
0.2134745, -1.50758, 1.489312, 0, 0, 0, 1, 1,
0.2137649, 0.02280026, 0.751846, 0, 0, 0, 1, 1,
0.2139715, 0.5118383, -2.165519, 0, 0, 0, 1, 1,
0.216069, -0.8490466, 2.582908, 1, 1, 1, 1, 1,
0.2161206, 0.4323693, -0.03647375, 1, 1, 1, 1, 1,
0.223129, -2.637663, 2.169248, 1, 1, 1, 1, 1,
0.2239989, 0.7819844, -0.5040305, 1, 1, 1, 1, 1,
0.2255784, 1.54486, 0.4747304, 1, 1, 1, 1, 1,
0.2266511, -1.074927, 2.692989, 1, 1, 1, 1, 1,
0.2270786, -0.7086465, 3.378789, 1, 1, 1, 1, 1,
0.2272514, 0.6684471, 0.2113229, 1, 1, 1, 1, 1,
0.2307111, 1.128002, -0.542473, 1, 1, 1, 1, 1,
0.2310259, 0.551217, -0.3931276, 1, 1, 1, 1, 1,
0.2313995, -0.2810498, 2.233482, 1, 1, 1, 1, 1,
0.2314699, 0.8989284, 1.131113, 1, 1, 1, 1, 1,
0.2323255, -0.5239874, 4.901602, 1, 1, 1, 1, 1,
0.2351916, -2.107655, 3.719334, 1, 1, 1, 1, 1,
0.2355435, 0.3368958, -0.1385597, 1, 1, 1, 1, 1,
0.2435455, 0.02576213, -0.7602502, 0, 0, 1, 1, 1,
0.2467132, -0.3326392, 3.247881, 1, 0, 0, 1, 1,
0.2515949, 1.042722, 0.1192449, 1, 0, 0, 1, 1,
0.2521772, -0.5976602, 2.743686, 1, 0, 0, 1, 1,
0.2541152, 0.7085032, 0.3150421, 1, 0, 0, 1, 1,
0.2585976, 0.5228453, 0.6219898, 1, 0, 0, 1, 1,
0.2606888, -0.2399148, 1.846243, 0, 0, 0, 1, 1,
0.2609335, -0.6499326, 2.569597, 0, 0, 0, 1, 1,
0.2622482, -0.4438846, 2.526365, 0, 0, 0, 1, 1,
0.2636713, 1.342068, -0.4844098, 0, 0, 0, 1, 1,
0.2695729, 0.5255415, 0.02612072, 0, 0, 0, 1, 1,
0.2724046, 1.05698, 0.02800285, 0, 0, 0, 1, 1,
0.2767947, -1.681282, -0.1061515, 0, 0, 0, 1, 1,
0.2825732, 0.470334, -0.2112885, 1, 1, 1, 1, 1,
0.2831253, 0.2164323, 0.818622, 1, 1, 1, 1, 1,
0.2896338, 1.046811, 1.512573, 1, 1, 1, 1, 1,
0.2918288, -1.156682, 2.968201, 1, 1, 1, 1, 1,
0.2974851, -0.8512439, 3.340075, 1, 1, 1, 1, 1,
0.2995027, -0.1089466, 2.554039, 1, 1, 1, 1, 1,
0.300941, -1.273522, 2.505077, 1, 1, 1, 1, 1,
0.3017552, 0.130893, 1.729535, 1, 1, 1, 1, 1,
0.3029754, 0.7130623, -0.6458659, 1, 1, 1, 1, 1,
0.3081709, -0.5266393, 2.092717, 1, 1, 1, 1, 1,
0.3125253, 1.41834, 1.366486, 1, 1, 1, 1, 1,
0.3232886, 0.6778067, 0.2299214, 1, 1, 1, 1, 1,
0.328156, -0.2399741, 3.405324, 1, 1, 1, 1, 1,
0.3333046, -2.107287, 3.220131, 1, 1, 1, 1, 1,
0.3370178, 0.9477594, -0.3945706, 1, 1, 1, 1, 1,
0.3374403, -0.01408112, 1.005117, 0, 0, 1, 1, 1,
0.3383887, -1.298132, 2.835264, 1, 0, 0, 1, 1,
0.3396904, 0.322735, -0.9720364, 1, 0, 0, 1, 1,
0.3429798, -2.016924, 3.365978, 1, 0, 0, 1, 1,
0.3453356, 1.407652, -0.7533983, 1, 0, 0, 1, 1,
0.3532591, 0.2032999, 2.727862, 1, 0, 0, 1, 1,
0.3619689, 2.810983, -0.1723715, 0, 0, 0, 1, 1,
0.3640156, -0.8045719, 1.83665, 0, 0, 0, 1, 1,
0.3692553, -0.4941931, 2.121556, 0, 0, 0, 1, 1,
0.3717262, -0.2605734, 2.45117, 0, 0, 0, 1, 1,
0.3728922, 0.2838019, 0.9856994, 0, 0, 0, 1, 1,
0.3748798, -0.01981787, 1.449533, 0, 0, 0, 1, 1,
0.3764972, -1.812553, 3.249249, 0, 0, 0, 1, 1,
0.37734, -1.048343, 1.902729, 1, 1, 1, 1, 1,
0.3794266, 0.500387, 0.9487491, 1, 1, 1, 1, 1,
0.3885958, -0.7588252, 2.33974, 1, 1, 1, 1, 1,
0.3887426, -0.006758182, 1.379664, 1, 1, 1, 1, 1,
0.3894678, 0.5203231, -0.2634221, 1, 1, 1, 1, 1,
0.3901182, -2.057747, 4.520564, 1, 1, 1, 1, 1,
0.393904, -1.079117, 1.769094, 1, 1, 1, 1, 1,
0.3985681, 0.3353114, 0.0601784, 1, 1, 1, 1, 1,
0.4014264, -0.007853572, 3.464197, 1, 1, 1, 1, 1,
0.405282, -2.282375, 2.950653, 1, 1, 1, 1, 1,
0.406137, -0.6392662, 3.089302, 1, 1, 1, 1, 1,
0.4069999, 0.7718218, 0.3292764, 1, 1, 1, 1, 1,
0.4082452, 2.811549, 1.051012, 1, 1, 1, 1, 1,
0.4096047, 0.2928458, 0.5009416, 1, 1, 1, 1, 1,
0.4108074, -0.06790891, 1.396259, 1, 1, 1, 1, 1,
0.4127135, -1.06739, 2.647551, 0, 0, 1, 1, 1,
0.4140086, -0.5053642, 2.830572, 1, 0, 0, 1, 1,
0.4142485, 0.1754041, 1.505245, 1, 0, 0, 1, 1,
0.4149956, 0.3112106, 2.32712, 1, 0, 0, 1, 1,
0.4186755, 0.1757155, 2.304643, 1, 0, 0, 1, 1,
0.4344159, -0.717562, 3.656404, 1, 0, 0, 1, 1,
0.43793, 2.550433, 0.7181576, 0, 0, 0, 1, 1,
0.4401914, 1.259494, 2.268136, 0, 0, 0, 1, 1,
0.4427209, -0.1477173, 4.084718, 0, 0, 0, 1, 1,
0.4513151, 1.411656, -0.3878476, 0, 0, 0, 1, 1,
0.452765, -2.036843, 2.703296, 0, 0, 0, 1, 1,
0.4552903, 0.4839011, 0.3871654, 0, 0, 0, 1, 1,
0.45682, 0.1667508, 1.713794, 0, 0, 0, 1, 1,
0.4577024, -1.330255, 2.482838, 1, 1, 1, 1, 1,
0.457879, 0.4227823, 1.681248, 1, 1, 1, 1, 1,
0.460607, 0.397916, -0.06219296, 1, 1, 1, 1, 1,
0.4611791, -0.0432276, 2.414958, 1, 1, 1, 1, 1,
0.4612919, 1.038743, 0.157726, 1, 1, 1, 1, 1,
0.4618752, 3.284983, 0.9576172, 1, 1, 1, 1, 1,
0.4622985, -1.432589, 0.6357401, 1, 1, 1, 1, 1,
0.4643676, 0.3847609, 1.475454, 1, 1, 1, 1, 1,
0.4722036, -0.5724022, 3.095154, 1, 1, 1, 1, 1,
0.4748884, 1.125953, 0.8909327, 1, 1, 1, 1, 1,
0.4760938, -0.1023193, 1.770736, 1, 1, 1, 1, 1,
0.4762934, 1.284955, 0.755814, 1, 1, 1, 1, 1,
0.4769851, -0.5269307, 3.324102, 1, 1, 1, 1, 1,
0.4805922, -0.02928048, 1.647904, 1, 1, 1, 1, 1,
0.4940281, 0.555432, 0.2797223, 1, 1, 1, 1, 1,
0.4942673, -0.3689539, 2.420612, 0, 0, 1, 1, 1,
0.4985895, -0.2960196, 2.885329, 1, 0, 0, 1, 1,
0.5007125, -0.6718778, 3.602763, 1, 0, 0, 1, 1,
0.5043079, 1.353913, -0.7444109, 1, 0, 0, 1, 1,
0.5044155, 0.2245452, 2.202952, 1, 0, 0, 1, 1,
0.5051379, 1.648507, 1.079232, 1, 0, 0, 1, 1,
0.5077699, -0.4521454, 2.311036, 0, 0, 0, 1, 1,
0.5099348, 1.260636, 0.7959493, 0, 0, 0, 1, 1,
0.5120533, 1.247915, -0.192574, 0, 0, 0, 1, 1,
0.5158479, -0.02387863, 2.717355, 0, 0, 0, 1, 1,
0.5178708, 1.278241, 1.586214, 0, 0, 0, 1, 1,
0.5183464, 2.023016, -0.1986532, 0, 0, 0, 1, 1,
0.518864, 0.2028982, 1.208791, 0, 0, 0, 1, 1,
0.5189067, -0.519448, 0.9376287, 1, 1, 1, 1, 1,
0.5191278, 0.08433668, 3.486967, 1, 1, 1, 1, 1,
0.519412, 1.29441, 1.25936, 1, 1, 1, 1, 1,
0.520071, -0.2479322, 2.229529, 1, 1, 1, 1, 1,
0.5207028, 0.07275576, 0.5314062, 1, 1, 1, 1, 1,
0.5241234, 0.3085813, 0.6338899, 1, 1, 1, 1, 1,
0.5245427, -1.154306, 2.007368, 1, 1, 1, 1, 1,
0.5247645, -0.0250659, -0.152722, 1, 1, 1, 1, 1,
0.5279729, -0.03062228, 2.149007, 1, 1, 1, 1, 1,
0.5359549, 0.7192609, 1.096328, 1, 1, 1, 1, 1,
0.5393777, -0.5470123, 2.823098, 1, 1, 1, 1, 1,
0.5395402, 0.6711696, 0.798896, 1, 1, 1, 1, 1,
0.539984, -0.8209866, 1.953519, 1, 1, 1, 1, 1,
0.5498316, 1.181509, 1.922327, 1, 1, 1, 1, 1,
0.5503148, 0.9991058, 1.058865, 1, 1, 1, 1, 1,
0.5512097, -0.716129, 3.217345, 0, 0, 1, 1, 1,
0.5535533, 0.6192293, -0.3942251, 1, 0, 0, 1, 1,
0.5585756, 0.1894318, 1.31209, 1, 0, 0, 1, 1,
0.5670265, -0.06382998, 2.913699, 1, 0, 0, 1, 1,
0.5696165, 1.336512, -0.2809932, 1, 0, 0, 1, 1,
0.5700872, -2.077809, 2.831016, 1, 0, 0, 1, 1,
0.5722279, 0.811043, 1.876499, 0, 0, 0, 1, 1,
0.5749304, 1.93582, -1.382727, 0, 0, 0, 1, 1,
0.5779077, -0.06148725, 2.197413, 0, 0, 0, 1, 1,
0.57931, -1.062495, 1.897419, 0, 0, 0, 1, 1,
0.5804232, 0.1719212, 0.2731192, 0, 0, 0, 1, 1,
0.5812929, -0.2309514, 2.339286, 0, 0, 0, 1, 1,
0.5812972, -0.3101592, 0.7309594, 0, 0, 0, 1, 1,
0.5832692, -0.371266, 1.159863, 1, 1, 1, 1, 1,
0.5838808, -1.412412, 4.0078, 1, 1, 1, 1, 1,
0.5846214, 0.6189491, -0.3164396, 1, 1, 1, 1, 1,
0.5852849, 0.4651957, -0.8943257, 1, 1, 1, 1, 1,
0.5878159, 0.1008396, 0.8854564, 1, 1, 1, 1, 1,
0.588733, 0.6029425, -0.06087003, 1, 1, 1, 1, 1,
0.5892566, 0.786517, 0.185111, 1, 1, 1, 1, 1,
0.5992283, 0.3191366, 1.421004, 1, 1, 1, 1, 1,
0.6037163, -0.561828, 1.586293, 1, 1, 1, 1, 1,
0.6086056, 0.6618623, 1.321253, 1, 1, 1, 1, 1,
0.6145724, 0.5103855, 1.930077, 1, 1, 1, 1, 1,
0.6162117, 0.9039013, 2.444592, 1, 1, 1, 1, 1,
0.61918, -0.4077418, 1.66348, 1, 1, 1, 1, 1,
0.6217679, 1.228666, 1.660931, 1, 1, 1, 1, 1,
0.6217958, -0.796765, 2.179204, 1, 1, 1, 1, 1,
0.6245826, -1.881095, 5.298529, 0, 0, 1, 1, 1,
0.6249828, -1.343004, 3.184961, 1, 0, 0, 1, 1,
0.6250478, 0.2146547, 0.7561408, 1, 0, 0, 1, 1,
0.6304836, 0.6172863, 0.1007634, 1, 0, 0, 1, 1,
0.6307796, -0.6949115, 1.588158, 1, 0, 0, 1, 1,
0.6399722, -0.3714544, 1.306886, 1, 0, 0, 1, 1,
0.6478128, 1.230214, 0.4644723, 0, 0, 0, 1, 1,
0.6560993, -0.8791201, 2.414535, 0, 0, 0, 1, 1,
0.6579802, 0.9862383, 1.545476, 0, 0, 0, 1, 1,
0.6606571, -0.6098545, 3.875795, 0, 0, 0, 1, 1,
0.6636156, -0.4518899, 2.2605, 0, 0, 0, 1, 1,
0.664474, -0.01724398, 1.447902, 0, 0, 0, 1, 1,
0.6648783, -0.2256933, 1.556377, 0, 0, 0, 1, 1,
0.6708261, -1.21264, 2.672184, 1, 1, 1, 1, 1,
0.6758046, -0.6939875, 1.762793, 1, 1, 1, 1, 1,
0.6829987, 0.7620108, 0.2470622, 1, 1, 1, 1, 1,
0.685675, 0.1102827, 0.6576499, 1, 1, 1, 1, 1,
0.6878288, -1.596516, 3.297849, 1, 1, 1, 1, 1,
0.6880603, -1.659964, 2.206564, 1, 1, 1, 1, 1,
0.6910702, -0.5408852, 2.880953, 1, 1, 1, 1, 1,
0.6947799, 0.4200646, 1.775669, 1, 1, 1, 1, 1,
0.6998833, 0.01979889, 0.8961678, 1, 1, 1, 1, 1,
0.702012, -0.01509032, 2.941561, 1, 1, 1, 1, 1,
0.7063429, 0.3136263, 1.768004, 1, 1, 1, 1, 1,
0.7087706, 1.854939, 1.438615, 1, 1, 1, 1, 1,
0.7142984, -2.213585, 3.129364, 1, 1, 1, 1, 1,
0.7148122, -0.6810533, 2.199605, 1, 1, 1, 1, 1,
0.7250902, 0.8858778, 0.6686844, 1, 1, 1, 1, 1,
0.725172, 1.308622, 0.2073921, 0, 0, 1, 1, 1,
0.7264904, 0.1324116, 1.245335, 1, 0, 0, 1, 1,
0.7284318, -0.8218662, 1.938914, 1, 0, 0, 1, 1,
0.731227, 1.511226, 1.028651, 1, 0, 0, 1, 1,
0.732616, -0.06730811, 0.7308249, 1, 0, 0, 1, 1,
0.7435997, -0.4697613, 2.469546, 1, 0, 0, 1, 1,
0.7442313, 0.6350933, 1.605056, 0, 0, 0, 1, 1,
0.7450938, 0.5324878, 0.1924021, 0, 0, 0, 1, 1,
0.7451439, 0.534286, -0.2439711, 0, 0, 0, 1, 1,
0.7458123, 0.1172818, 1.905849, 0, 0, 0, 1, 1,
0.7502337, 1.726497, 1.005508, 0, 0, 0, 1, 1,
0.7520008, -1.421604, 3.835687, 0, 0, 0, 1, 1,
0.7530956, 0.5580669, 2.088217, 0, 0, 0, 1, 1,
0.7549953, 0.2029371, 1.076737, 1, 1, 1, 1, 1,
0.7590458, -1.31617, 2.341092, 1, 1, 1, 1, 1,
0.7601713, -2.119653, 4.553637, 1, 1, 1, 1, 1,
0.7632667, 1.238544, 1.160146, 1, 1, 1, 1, 1,
0.7646368, -1.161253, 3.506872, 1, 1, 1, 1, 1,
0.7662141, -0.05412278, 2.23131, 1, 1, 1, 1, 1,
0.7714018, -0.5945128, 1.570295, 1, 1, 1, 1, 1,
0.7725486, -1.355658, 3.521604, 1, 1, 1, 1, 1,
0.7761875, 0.06065963, 2.318044, 1, 1, 1, 1, 1,
0.7831646, 1.302808, 0.03197708, 1, 1, 1, 1, 1,
0.7907568, -1.818523, 2.851522, 1, 1, 1, 1, 1,
0.7920328, 0.9844345, 0.6797209, 1, 1, 1, 1, 1,
0.8073307, -1.408364, 2.924762, 1, 1, 1, 1, 1,
0.8109417, -1.044206, 3.478678, 1, 1, 1, 1, 1,
0.8179712, -1.024609, 2.501978, 1, 1, 1, 1, 1,
0.8194141, 0.2114457, 1.378032, 0, 0, 1, 1, 1,
0.8267938, 0.2082287, 2.803252, 1, 0, 0, 1, 1,
0.8345746, -1.789756, 3.713835, 1, 0, 0, 1, 1,
0.8352324, 0.6978949, 0.07409238, 1, 0, 0, 1, 1,
0.8375235, 1.004707, 1.491738, 1, 0, 0, 1, 1,
0.8424087, -0.3491563, 0.782698, 1, 0, 0, 1, 1,
0.8431934, -0.5534185, 4.14376, 0, 0, 0, 1, 1,
0.8437378, -1.218585, 2.778341, 0, 0, 0, 1, 1,
0.8461208, -0.8408197, 3.146339, 0, 0, 0, 1, 1,
0.8502976, 1.136435, 1.80322, 0, 0, 0, 1, 1,
0.8542288, 0.03274768, 2.021945, 0, 0, 0, 1, 1,
0.8571476, 1.133914, -0.1210278, 0, 0, 0, 1, 1,
0.858108, -0.8216745, 2.982033, 0, 0, 0, 1, 1,
0.8694614, -2.234335, 2.2061, 1, 1, 1, 1, 1,
0.8798913, -0.4140749, 1.079743, 1, 1, 1, 1, 1,
0.8813591, -0.3615743, 0.3148458, 1, 1, 1, 1, 1,
0.8891126, 0.1285234, 1.402003, 1, 1, 1, 1, 1,
0.8893242, 0.2502193, 2.243163, 1, 1, 1, 1, 1,
0.8947546, -1.178019, 1.426778, 1, 1, 1, 1, 1,
0.8978414, -0.6654979, 3.774138, 1, 1, 1, 1, 1,
0.9051149, 1.605842, 2.032526, 1, 1, 1, 1, 1,
0.9149715, 0.7484007, 0.6064985, 1, 1, 1, 1, 1,
0.917238, 0.6976006, 1.115987, 1, 1, 1, 1, 1,
0.9203038, 1.346551, -1.174514, 1, 1, 1, 1, 1,
0.9256783, -0.9141886, 3.73914, 1, 1, 1, 1, 1,
0.9262508, -0.3326553, 1.018616, 1, 1, 1, 1, 1,
0.9272771, -0.3545306, 1.446993, 1, 1, 1, 1, 1,
0.9302365, -0.591206, 0.7760965, 1, 1, 1, 1, 1,
0.9335215, -0.1042549, 1.803377, 0, 0, 1, 1, 1,
0.9398473, 2.618208, -2.040598, 1, 0, 0, 1, 1,
0.9406103, 0.7564914, -0.008607149, 1, 0, 0, 1, 1,
0.9459416, 0.5652009, 1.662591, 1, 0, 0, 1, 1,
0.9463058, -1.728886, 4.472544, 1, 0, 0, 1, 1,
0.9511256, -1.244746, 2.529587, 1, 0, 0, 1, 1,
0.9514788, 1.160519, -0.1924668, 0, 0, 0, 1, 1,
0.9527448, 0.2420074, 1.261221, 0, 0, 0, 1, 1,
0.9613379, 1.324016, 1.670529, 0, 0, 0, 1, 1,
0.9629221, -0.06573638, 2.692451, 0, 0, 0, 1, 1,
0.9635411, 0.7674738, 2.120655, 0, 0, 0, 1, 1,
0.9660099, -0.0211779, 2.918032, 0, 0, 0, 1, 1,
0.9671314, 1.163733, 0.7646391, 0, 0, 0, 1, 1,
0.9685367, -0.5392495, 0.9774655, 1, 1, 1, 1, 1,
0.9738687, 0.6502569, 1.352488, 1, 1, 1, 1, 1,
0.9759938, -0.7599079, 0.8851413, 1, 1, 1, 1, 1,
0.9765657, 0.03154331, -0.392259, 1, 1, 1, 1, 1,
0.9810019, -1.463652, 2.151646, 1, 1, 1, 1, 1,
0.9951223, -1.393969, 3.281024, 1, 1, 1, 1, 1,
0.9990708, -0.8707608, 0.6490788, 1, 1, 1, 1, 1,
1.0006, -0.1390911, 0.0464037, 1, 1, 1, 1, 1,
1.001564, -0.9695342, 2.904851, 1, 1, 1, 1, 1,
1.002188, 1.110577, -0.1055066, 1, 1, 1, 1, 1,
1.008715, 0.09669986, 1.324333, 1, 1, 1, 1, 1,
1.018228, -1.811419, 1.772478, 1, 1, 1, 1, 1,
1.021717, -1.270511, 2.834963, 1, 1, 1, 1, 1,
1.021752, 1.976002, -0.7200495, 1, 1, 1, 1, 1,
1.028217, -1.431614, 3.591636, 1, 1, 1, 1, 1,
1.028334, 0.02004251, 0.778362, 0, 0, 1, 1, 1,
1.032801, 0.6379405, 1.069521, 1, 0, 0, 1, 1,
1.037011, 0.3242275, 2.653978, 1, 0, 0, 1, 1,
1.039024, -1.307056, 3.394579, 1, 0, 0, 1, 1,
1.039689, -0.506695, 2.305436, 1, 0, 0, 1, 1,
1.044902, -0.6119828, 1.204601, 1, 0, 0, 1, 1,
1.047456, -0.3638583, 3.068298, 0, 0, 0, 1, 1,
1.063347, -0.2883976, 3.601345, 0, 0, 0, 1, 1,
1.072511, 0.7382182, 0.6677923, 0, 0, 0, 1, 1,
1.074712, -0.9408398, 0.7347943, 0, 0, 0, 1, 1,
1.075109, 1.207011, 1.89678, 0, 0, 0, 1, 1,
1.088482, -0.9873797, 2.180175, 0, 0, 0, 1, 1,
1.091955, -1.704159, 2.912417, 0, 0, 0, 1, 1,
1.093314, -0.6681559, 1.557031, 1, 1, 1, 1, 1,
1.104187, -0.8663717, 2.254364, 1, 1, 1, 1, 1,
1.106918, 1.105254, -0.4263342, 1, 1, 1, 1, 1,
1.120916, -2.130203, 2.18651, 1, 1, 1, 1, 1,
1.129182, -1.775813, 2.237974, 1, 1, 1, 1, 1,
1.129769, 1.956505, 1.082509, 1, 1, 1, 1, 1,
1.136657, 0.6910378, 1.665838, 1, 1, 1, 1, 1,
1.139855, -0.9462728, 2.398145, 1, 1, 1, 1, 1,
1.142124, -0.1210209, 3.160783, 1, 1, 1, 1, 1,
1.148849, 1.436305, 0.09100606, 1, 1, 1, 1, 1,
1.15159, -0.2527297, 3.009295, 1, 1, 1, 1, 1,
1.154037, -0.1285142, 2.501639, 1, 1, 1, 1, 1,
1.155615, -1.504977, 2.112565, 1, 1, 1, 1, 1,
1.158605, 0.963753, 0.7638518, 1, 1, 1, 1, 1,
1.160943, -0.095787, 2.834203, 1, 1, 1, 1, 1,
1.166665, 2.257044, 0.3241485, 0, 0, 1, 1, 1,
1.170975, 0.1948673, 1.878076, 1, 0, 0, 1, 1,
1.172844, -0.8647472, 3.163245, 1, 0, 0, 1, 1,
1.196793, 0.6269542, 0.6597988, 1, 0, 0, 1, 1,
1.197742, 0.1380363, 0.3648156, 1, 0, 0, 1, 1,
1.197983, -0.7585655, 1.199086, 1, 0, 0, 1, 1,
1.203715, 0.2162739, 1.286358, 0, 0, 0, 1, 1,
1.205383, -1.787493, 2.720863, 0, 0, 0, 1, 1,
1.217726, -1.436852, 3.197232, 0, 0, 0, 1, 1,
1.228907, -0.8904367, -0.7154295, 0, 0, 0, 1, 1,
1.231644, -0.05404343, 0.1185196, 0, 0, 0, 1, 1,
1.231947, -2.090885, 2.685519, 0, 0, 0, 1, 1,
1.241103, -0.5109501, 1.615501, 0, 0, 0, 1, 1,
1.247465, -1.135917, 3.461681, 1, 1, 1, 1, 1,
1.251548, 0.322807, -0.1811372, 1, 1, 1, 1, 1,
1.261519, 1.116469, 0.9734321, 1, 1, 1, 1, 1,
1.263249, 1.006823, 1.138889, 1, 1, 1, 1, 1,
1.267221, 0.2257666, 1.177175, 1, 1, 1, 1, 1,
1.267473, 1.662961, 0.2049479, 1, 1, 1, 1, 1,
1.280069, 0.4701776, -0.8608586, 1, 1, 1, 1, 1,
1.285549, 0.9139798, 3.141117, 1, 1, 1, 1, 1,
1.286042, 0.1291018, -1.274308, 1, 1, 1, 1, 1,
1.28687, 0.03337067, 3.133587, 1, 1, 1, 1, 1,
1.287504, -0.188796, 2.680251, 1, 1, 1, 1, 1,
1.287736, -0.07380398, 3.166075, 1, 1, 1, 1, 1,
1.294747, -0.9609984, 0.4485946, 1, 1, 1, 1, 1,
1.303498, -0.4268485, 1.277723, 1, 1, 1, 1, 1,
1.304262, 2.578781, 0.4233169, 1, 1, 1, 1, 1,
1.310521, -1.106829, 3.62836, 0, 0, 1, 1, 1,
1.312658, -0.5047433, 1.636932, 1, 0, 0, 1, 1,
1.314314, -1.68777, 3.723759, 1, 0, 0, 1, 1,
1.316397, -1.430511, 2.049809, 1, 0, 0, 1, 1,
1.316461, -0.7414604, 1.744444, 1, 0, 0, 1, 1,
1.324126, -0.4780438, 2.139838, 1, 0, 0, 1, 1,
1.327656, 0.6816823, -0.6995063, 0, 0, 0, 1, 1,
1.336231, -1.134911, 3.055812, 0, 0, 0, 1, 1,
1.337674, -1.894, 2.172461, 0, 0, 0, 1, 1,
1.338928, -0.09762791, 0.5120336, 0, 0, 0, 1, 1,
1.34029, -0.131873, 2.41128, 0, 0, 0, 1, 1,
1.346318, 0.3728079, 3.136948, 0, 0, 0, 1, 1,
1.352238, 0.1838965, 3.081713, 0, 0, 0, 1, 1,
1.355155, -0.9903863, 1.983537, 1, 1, 1, 1, 1,
1.355503, 1.253645, -0.2577685, 1, 1, 1, 1, 1,
1.35572, -0.1381597, 2.661645, 1, 1, 1, 1, 1,
1.364534, 1.611405, -0.5072028, 1, 1, 1, 1, 1,
1.365974, 0.005435574, 3.550729, 1, 1, 1, 1, 1,
1.372376, -0.8782571, 3.441948, 1, 1, 1, 1, 1,
1.389786, 1.726125, 1.421156, 1, 1, 1, 1, 1,
1.396305, 1.597658, 2.704993, 1, 1, 1, 1, 1,
1.403554, -0.09137494, 2.211425, 1, 1, 1, 1, 1,
1.404417, -0.1558599, 2.508076, 1, 1, 1, 1, 1,
1.405673, 1.495803, 1.163271, 1, 1, 1, 1, 1,
1.423144, -1.486683, 3.453715, 1, 1, 1, 1, 1,
1.433353, 0.9900305, 1.666601, 1, 1, 1, 1, 1,
1.443464, -0.07066348, 2.141522, 1, 1, 1, 1, 1,
1.444078, 2.80842, -0.7438101, 1, 1, 1, 1, 1,
1.449, 0.8115745, 1.347479, 0, 0, 1, 1, 1,
1.45207, 0.4012551, 1.386412, 1, 0, 0, 1, 1,
1.457271, 0.2916423, 2.00591, 1, 0, 0, 1, 1,
1.480566, 0.6218106, 0.7062781, 1, 0, 0, 1, 1,
1.484313, -1.185556, 2.002268, 1, 0, 0, 1, 1,
1.491146, -1.306536, 1.533593, 1, 0, 0, 1, 1,
1.498243, -2.385823, 2.215318, 0, 0, 0, 1, 1,
1.510215, -0.3615378, 1.644167, 0, 0, 0, 1, 1,
1.512993, -0.1725605, 2.960694, 0, 0, 0, 1, 1,
1.515189, 0.5891178, 1.503539, 0, 0, 0, 1, 1,
1.522578, -0.2693018, 1.919229, 0, 0, 0, 1, 1,
1.53265, 1.241805, 0.5713522, 0, 0, 0, 1, 1,
1.54566, 1.942575, 0.5707307, 0, 0, 0, 1, 1,
1.550878, 0.2143788, 0.4261578, 1, 1, 1, 1, 1,
1.554026, 1.572937, 0.8969659, 1, 1, 1, 1, 1,
1.561131, 0.7139172, -0.1182678, 1, 1, 1, 1, 1,
1.564638, 2.310599, -0.7306923, 1, 1, 1, 1, 1,
1.566336, -0.2826907, 1.021107, 1, 1, 1, 1, 1,
1.579922, -2.572214, 3.603921, 1, 1, 1, 1, 1,
1.585283, -0.4108647, 2.971411, 1, 1, 1, 1, 1,
1.615445, -1.875452, 1.908521, 1, 1, 1, 1, 1,
1.622875, 0.482547, 1.476459, 1, 1, 1, 1, 1,
1.64182, 2.574985, -0.4434767, 1, 1, 1, 1, 1,
1.641952, 1.065068, 2.585844, 1, 1, 1, 1, 1,
1.647741, 0.7522476, 1.274586, 1, 1, 1, 1, 1,
1.647826, 0.3941448, 0.145111, 1, 1, 1, 1, 1,
1.652252, -2.576088, 2.436116, 1, 1, 1, 1, 1,
1.683918, 0.6140274, 0.5234493, 1, 1, 1, 1, 1,
1.691664, 0.1505338, 1.086769, 0, 0, 1, 1, 1,
1.703055, 1.097002, 2.46189, 1, 0, 0, 1, 1,
1.713761, -1.038935, 2.452456, 1, 0, 0, 1, 1,
1.722244, 0.7416326, 0.9306777, 1, 0, 0, 1, 1,
1.730858, 2.284591, 2.439861, 1, 0, 0, 1, 1,
1.746013, -0.6040826, 3.175931, 1, 0, 0, 1, 1,
1.753629, -0.9318801, 1.938658, 0, 0, 0, 1, 1,
1.776428, -0.2264373, 0.7353588, 0, 0, 0, 1, 1,
1.797725, 0.3218007, 1.80792, 0, 0, 0, 1, 1,
1.815195, -0.04355012, 1.622968, 0, 0, 0, 1, 1,
1.817914, -0.2772212, 1.951503, 0, 0, 0, 1, 1,
1.826413, -0.06208199, 1.429633, 0, 0, 0, 1, 1,
1.852797, -0.2970891, 2.504636, 0, 0, 0, 1, 1,
1.889756, 0.4698336, 0.6093218, 1, 1, 1, 1, 1,
1.902393, 0.6692077, 1.034818, 1, 1, 1, 1, 1,
1.905788, 0.1253418, 1.361327, 1, 1, 1, 1, 1,
1.927266, -0.4616311, 1.142552, 1, 1, 1, 1, 1,
1.928085, -0.5599421, 1.815165, 1, 1, 1, 1, 1,
1.948693, -1.062585, 1.882029, 1, 1, 1, 1, 1,
1.95505, -0.2633718, 0.5753856, 1, 1, 1, 1, 1,
1.98152, 1.051767, 0.2262295, 1, 1, 1, 1, 1,
1.982589, -0.1375113, 2.036381, 1, 1, 1, 1, 1,
1.988373, 0.2090067, 1.792509, 1, 1, 1, 1, 1,
2.033617, -1.52345, 1.191349, 1, 1, 1, 1, 1,
2.052225, 1.703943, -0.6483946, 1, 1, 1, 1, 1,
2.064659, 0.3292758, 0.6105173, 1, 1, 1, 1, 1,
2.084907, -0.3226476, 1.212202, 1, 1, 1, 1, 1,
2.094885, 1.566393, 2.803751, 1, 1, 1, 1, 1,
2.113873, -0.1707998, 1.948049, 0, 0, 1, 1, 1,
2.173624, 0.1077536, -0.01454583, 1, 0, 0, 1, 1,
2.217738, -0.3298212, 2.538197, 1, 0, 0, 1, 1,
2.243581, 0.1110892, 3.263473, 1, 0, 0, 1, 1,
2.255569, 1.52121, 0.4009524, 1, 0, 0, 1, 1,
2.270625, 0.9951849, 2.888462, 1, 0, 0, 1, 1,
2.307173, 1.131711, 3.330091, 0, 0, 0, 1, 1,
2.328764, 1.531544, -0.06315929, 0, 0, 0, 1, 1,
2.335049, -1.33503, 1.75947, 0, 0, 0, 1, 1,
2.337575, -0.4600678, 2.404034, 0, 0, 0, 1, 1,
2.42182, -0.8701885, 0.3016314, 0, 0, 0, 1, 1,
2.433274, -0.8499081, -0.1291973, 0, 0, 0, 1, 1,
2.459493, 1.504193, 1.531303, 0, 0, 0, 1, 1,
2.489259, 0.0306185, -0.1153471, 1, 1, 1, 1, 1,
2.523686, 0.1705273, 1.115152, 1, 1, 1, 1, 1,
2.531451, 2.292205, 0.8516769, 1, 1, 1, 1, 1,
2.640277, 0.9539031, 1.351991, 1, 1, 1, 1, 1,
2.699228, -0.05459016, 1.419574, 1, 1, 1, 1, 1,
2.798521, -1.364455, 3.340591, 1, 1, 1, 1, 1,
3.752734, 0.9857625, 0.4989159, 1, 1, 1, 1, 1
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
var radius = 9.725071;
var distance = 34.1589;
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
mvMatrix.translate( -0.005234718, -0.113023, -0.1163924 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.1589);
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
