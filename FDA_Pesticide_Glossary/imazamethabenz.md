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
-2.906761, -1.632143, -3.435207, 1, 0, 0, 1,
-2.821829, 0.1309992, -1.305126, 1, 0.007843138, 0, 1,
-2.78815, 0.7164865, -2.32658, 1, 0.01176471, 0, 1,
-2.613184, -1.479589, -3.600848, 1, 0.01960784, 0, 1,
-2.55004, 0.1831859, -1.699087, 1, 0.02352941, 0, 1,
-2.370196, -0.4710811, -1.236489, 1, 0.03137255, 0, 1,
-2.331042, 1.025907, 0.8086123, 1, 0.03529412, 0, 1,
-2.28217, -0.2632257, -2.261397, 1, 0.04313726, 0, 1,
-2.270803, -1.319301, -2.165582, 1, 0.04705882, 0, 1,
-2.25585, 0.1533763, -2.899625, 1, 0.05490196, 0, 1,
-2.13653, 0.06616977, -2.515151, 1, 0.05882353, 0, 1,
-2.097361, 0.3876473, -3.06891, 1, 0.06666667, 0, 1,
-2.067412, 0.5244936, -2.37924, 1, 0.07058824, 0, 1,
-2.061505, -1.425832, -1.949545, 1, 0.07843138, 0, 1,
-2.035017, -1.086914, -1.0028, 1, 0.08235294, 0, 1,
-2.026656, -0.03960688, -1.845811, 1, 0.09019608, 0, 1,
-1.998679, 0.8571077, -1.302752, 1, 0.09411765, 0, 1,
-1.98728, -0.7566524, -0.765632, 1, 0.1019608, 0, 1,
-1.966368, 0.6447719, -0.3986547, 1, 0.1098039, 0, 1,
-1.954367, 0.1819821, -3.218543, 1, 0.1137255, 0, 1,
-1.934532, -0.2604434, -1.851628, 1, 0.1215686, 0, 1,
-1.89631, -0.6828904, -1.795225, 1, 0.1254902, 0, 1,
-1.868777, -0.07516538, -0.4980171, 1, 0.1333333, 0, 1,
-1.854386, -1.111212, -2.193801, 1, 0.1372549, 0, 1,
-1.834714, -0.7507263, -1.678128, 1, 0.145098, 0, 1,
-1.832887, 0.1191286, -1.950832, 1, 0.1490196, 0, 1,
-1.825629, 0.894962, -1.229248, 1, 0.1568628, 0, 1,
-1.813425, 1.73716, 1.730437, 1, 0.1607843, 0, 1,
-1.802139, -2.769617, -1.983844, 1, 0.1686275, 0, 1,
-1.791718, -0.1223239, -2.247346, 1, 0.172549, 0, 1,
-1.785006, -0.3830833, -2.104945, 1, 0.1803922, 0, 1,
-1.784372, -0.7811126, -2.254756, 1, 0.1843137, 0, 1,
-1.773221, -0.1332599, -1.123404, 1, 0.1921569, 0, 1,
-1.769077, 1.103369, -0.8355736, 1, 0.1960784, 0, 1,
-1.766481, 0.07023361, -1.401758, 1, 0.2039216, 0, 1,
-1.761621, 0.7028696, -1.113827, 1, 0.2117647, 0, 1,
-1.747356, 0.6102899, -0.490341, 1, 0.2156863, 0, 1,
-1.740497, 0.6494471, -0.6663588, 1, 0.2235294, 0, 1,
-1.733436, 0.1258196, -0.2742113, 1, 0.227451, 0, 1,
-1.692699, 0.5952109, -1.869882, 1, 0.2352941, 0, 1,
-1.689257, 0.07147167, -0.3489233, 1, 0.2392157, 0, 1,
-1.657607, -2.113581, -2.849388, 1, 0.2470588, 0, 1,
-1.645751, -2.439435, -2.071384, 1, 0.2509804, 0, 1,
-1.644985, -1.699214, -1.630788, 1, 0.2588235, 0, 1,
-1.626958, -0.5726022, -1.98465, 1, 0.2627451, 0, 1,
-1.617814, 0.1301956, -1.879638, 1, 0.2705882, 0, 1,
-1.600715, -1.228965, -1.750871, 1, 0.2745098, 0, 1,
-1.586269, -0.4440321, -3.208918, 1, 0.282353, 0, 1,
-1.582805, -0.04726012, -0.7434667, 1, 0.2862745, 0, 1,
-1.577016, -0.3558479, 0.1957488, 1, 0.2941177, 0, 1,
-1.565098, 0.5915482, -1.456502, 1, 0.3019608, 0, 1,
-1.564858, -0.5461589, -2.440322, 1, 0.3058824, 0, 1,
-1.558237, -0.2701919, -2.50178, 1, 0.3137255, 0, 1,
-1.539564, 0.1408211, -2.158128, 1, 0.3176471, 0, 1,
-1.524647, -0.7477785, -1.70772, 1, 0.3254902, 0, 1,
-1.524382, -0.3707555, -1.677123, 1, 0.3294118, 0, 1,
-1.51013, 1.903249, 0.9680838, 1, 0.3372549, 0, 1,
-1.48242, 0.2286682, -0.8778096, 1, 0.3411765, 0, 1,
-1.474396, 0.8442692, 0.02009403, 1, 0.3490196, 0, 1,
-1.4698, 0.129832, -2.967802, 1, 0.3529412, 0, 1,
-1.458009, 1.397831, -1.072965, 1, 0.3607843, 0, 1,
-1.447425, 1.155484, -0.1552808, 1, 0.3647059, 0, 1,
-1.431179, 1.412683, -1.485955, 1, 0.372549, 0, 1,
-1.422553, 0.9848907, -0.4108812, 1, 0.3764706, 0, 1,
-1.4195, -0.04475802, -1.841504, 1, 0.3843137, 0, 1,
-1.400863, 1.911827, -0.796021, 1, 0.3882353, 0, 1,
-1.395488, 1.155667, -0.7670707, 1, 0.3960784, 0, 1,
-1.381242, 0.4051999, -0.7881462, 1, 0.4039216, 0, 1,
-1.376458, -0.1179883, -2.122179, 1, 0.4078431, 0, 1,
-1.374638, -1.326577, -1.915016, 1, 0.4156863, 0, 1,
-1.373921, 1.101334, -0.7451704, 1, 0.4196078, 0, 1,
-1.352225, -0.4579171, -1.240759, 1, 0.427451, 0, 1,
-1.34528, -1.027216, -2.650465, 1, 0.4313726, 0, 1,
-1.330057, -1.115653, -0.8470895, 1, 0.4392157, 0, 1,
-1.323142, -0.7153199, -3.308786, 1, 0.4431373, 0, 1,
-1.314047, -0.9492272, -1.878576, 1, 0.4509804, 0, 1,
-1.299521, 0.1309471, -2.058576, 1, 0.454902, 0, 1,
-1.296248, 1.342782, -0.617422, 1, 0.4627451, 0, 1,
-1.285434, -2.438716, -3.058006, 1, 0.4666667, 0, 1,
-1.27299, 0.3638872, -1.149416, 1, 0.4745098, 0, 1,
-1.266125, 0.917685, 0.391201, 1, 0.4784314, 0, 1,
-1.263851, 0.006901504, -0.7654, 1, 0.4862745, 0, 1,
-1.262324, -0.384358, -1.102752, 1, 0.4901961, 0, 1,
-1.258198, -0.4632017, -2.809201, 1, 0.4980392, 0, 1,
-1.254482, 0.1802054, -1.66024, 1, 0.5058824, 0, 1,
-1.253922, 0.6271306, 1.190814, 1, 0.509804, 0, 1,
-1.242478, 0.8862113, -1.672101, 1, 0.5176471, 0, 1,
-1.242026, -0.6782594, -2.452065, 1, 0.5215687, 0, 1,
-1.23954, -0.2237276, -1.802318, 1, 0.5294118, 0, 1,
-1.238379, 1.292428, 0.09218947, 1, 0.5333334, 0, 1,
-1.237577, 0.4740134, -2.616149, 1, 0.5411765, 0, 1,
-1.228863, 1.417372, -0.8773286, 1, 0.5450981, 0, 1,
-1.22871, 1.348432, 0.0126814, 1, 0.5529412, 0, 1,
-1.227937, -2.043395, -1.487649, 1, 0.5568628, 0, 1,
-1.22786, -0.05902292, -2.288316, 1, 0.5647059, 0, 1,
-1.225057, -0.5561416, -2.461084, 1, 0.5686275, 0, 1,
-1.219519, 0.6578891, -1.710996, 1, 0.5764706, 0, 1,
-1.21077, -0.537065, -1.646202, 1, 0.5803922, 0, 1,
-1.210205, 0.5193985, -1.094557, 1, 0.5882353, 0, 1,
-1.209363, 0.2388878, -2.804538, 1, 0.5921569, 0, 1,
-1.202881, 1.014768, -1.921295, 1, 0.6, 0, 1,
-1.185162, 1.084878, -0.4452287, 1, 0.6078432, 0, 1,
-1.156606, 1.362903, 0.2811581, 1, 0.6117647, 0, 1,
-1.1557, 1.455755, 0.6387816, 1, 0.6196079, 0, 1,
-1.141072, -0.6827309, -2.226938, 1, 0.6235294, 0, 1,
-1.138681, 1.09658, -1.671866, 1, 0.6313726, 0, 1,
-1.137656, 0.1541169, -2.580698, 1, 0.6352941, 0, 1,
-1.133855, 0.48092, 0.326957, 1, 0.6431373, 0, 1,
-1.133343, 0.8197851, -2.480173, 1, 0.6470588, 0, 1,
-1.129267, 0.2970518, -0.1650044, 1, 0.654902, 0, 1,
-1.125318, -1.144316, -2.895107, 1, 0.6588235, 0, 1,
-1.124082, -0.0229711, -1.186921, 1, 0.6666667, 0, 1,
-1.120903, -0.6188689, -3.051142, 1, 0.6705883, 0, 1,
-1.117748, -1.432454, -2.142398, 1, 0.6784314, 0, 1,
-1.117445, 1.65618, -1.354465, 1, 0.682353, 0, 1,
-1.114667, -0.3842681, -1.850615, 1, 0.6901961, 0, 1,
-1.113081, 2.754391, 0.07511988, 1, 0.6941177, 0, 1,
-1.106044, -0.5362418, -1.059219, 1, 0.7019608, 0, 1,
-1.10018, 0.2733913, -2.365872, 1, 0.7098039, 0, 1,
-1.097139, 0.5273431, 1.504147, 1, 0.7137255, 0, 1,
-1.090595, -1.732244, -2.67883, 1, 0.7215686, 0, 1,
-1.078818, 0.4998618, -1.932096, 1, 0.7254902, 0, 1,
-1.077267, -0.3915626, -3.25742, 1, 0.7333333, 0, 1,
-1.076986, 0.8976973, -0.59907, 1, 0.7372549, 0, 1,
-1.067761, -0.7542469, -3.822648, 1, 0.7450981, 0, 1,
-1.066281, 0.01997587, -1.542279, 1, 0.7490196, 0, 1,
-1.065152, -0.7428225, -2.57803, 1, 0.7568628, 0, 1,
-1.064445, 0.2968542, -1.06269, 1, 0.7607843, 0, 1,
-1.062926, -0.309686, -2.287049, 1, 0.7686275, 0, 1,
-1.062524, -0.8860552, -2.92973, 1, 0.772549, 0, 1,
-1.061552, 1.137339, 1.051314, 1, 0.7803922, 0, 1,
-1.060702, -0.3976242, -1.99954, 1, 0.7843137, 0, 1,
-1.055343, 0.1147586, -1.892281, 1, 0.7921569, 0, 1,
-1.048529, -0.2164861, -2.812575, 1, 0.7960784, 0, 1,
-1.047193, -0.2995479, -0.02774972, 1, 0.8039216, 0, 1,
-1.045209, 0.5389514, -1.199401, 1, 0.8117647, 0, 1,
-1.037743, -0.7399527, -2.667658, 1, 0.8156863, 0, 1,
-1.037437, -0.7760162, -5.307782, 1, 0.8235294, 0, 1,
-1.035718, 3.23763, -0.768723, 1, 0.827451, 0, 1,
-1.03549, 0.7109504, -1.23216, 1, 0.8352941, 0, 1,
-1.03001, 1.079459, -2.716063, 1, 0.8392157, 0, 1,
-1.028004, -1.333464, -1.742207, 1, 0.8470588, 0, 1,
-1.025832, 1.289997, -1.967673, 1, 0.8509804, 0, 1,
-1.022841, -1.805754, -1.698014, 1, 0.8588235, 0, 1,
-1.019842, 0.2671909, -2.560256, 1, 0.8627451, 0, 1,
-1.017844, 1.172757, -0.8152838, 1, 0.8705882, 0, 1,
-1.016009, -0.2602162, -1.543074, 1, 0.8745098, 0, 1,
-1.007095, 0.912177, -0.1919422, 1, 0.8823529, 0, 1,
-1.003177, 0.09681129, -0.367433, 1, 0.8862745, 0, 1,
-0.9934872, -0.4768634, -2.164118, 1, 0.8941177, 0, 1,
-0.9917997, -0.08058684, -1.68175, 1, 0.8980392, 0, 1,
-0.988858, -0.8586622, -2.667879, 1, 0.9058824, 0, 1,
-0.9876403, 0.917794, -0.0697877, 1, 0.9137255, 0, 1,
-0.9854557, 1.522528, 0.143909, 1, 0.9176471, 0, 1,
-0.984983, -0.5856742, -0.4869241, 1, 0.9254902, 0, 1,
-0.9820042, -0.2049017, -3.073537, 1, 0.9294118, 0, 1,
-0.9795913, -0.5806197, -3.595091, 1, 0.9372549, 0, 1,
-0.9765713, 0.1724243, -2.322639, 1, 0.9411765, 0, 1,
-0.9760948, -1.179846, -2.323324, 1, 0.9490196, 0, 1,
-0.9672542, -0.7572505, -2.06624, 1, 0.9529412, 0, 1,
-0.9656327, -0.9570684, -2.224561, 1, 0.9607843, 0, 1,
-0.9635822, 1.898111, -1.682331, 1, 0.9647059, 0, 1,
-0.9595367, 0.9513631, -1.749321, 1, 0.972549, 0, 1,
-0.941232, 0.0431046, -2.211614, 1, 0.9764706, 0, 1,
-0.9392509, -0.1222949, -0.08629257, 1, 0.9843137, 0, 1,
-0.9271066, -1.061118, -4.502288, 1, 0.9882353, 0, 1,
-0.9255953, 0.7384527, -0.3107338, 1, 0.9960784, 0, 1,
-0.9248362, 0.09263341, -1.186822, 0.9960784, 1, 0, 1,
-0.9237387, -0.3340003, -2.655285, 0.9921569, 1, 0, 1,
-0.9222142, 1.884734, -0.9803325, 0.9843137, 1, 0, 1,
-0.9179462, -0.8566208, -2.591129, 0.9803922, 1, 0, 1,
-0.9126133, -0.3463483, -2.273782, 0.972549, 1, 0, 1,
-0.9073489, 1.503343, 0.3695672, 0.9686275, 1, 0, 1,
-0.9067389, 1.952809, -0.4541207, 0.9607843, 1, 0, 1,
-0.9036802, -0.1488042, -0.214044, 0.9568627, 1, 0, 1,
-0.8955278, 1.656455, 0.01275483, 0.9490196, 1, 0, 1,
-0.8938262, 1.058167, -1.229865, 0.945098, 1, 0, 1,
-0.8905176, 0.07849354, -2.489545, 0.9372549, 1, 0, 1,
-0.8898476, -0.6364236, -2.035869, 0.9333333, 1, 0, 1,
-0.8881576, 0.4798077, -0.2634889, 0.9254902, 1, 0, 1,
-0.887116, -0.5996839, -2.575047, 0.9215686, 1, 0, 1,
-0.8857136, -0.2573919, -1.390268, 0.9137255, 1, 0, 1,
-0.8827484, -0.08283518, -1.785411, 0.9098039, 1, 0, 1,
-0.8806407, 1.733968, -0.613494, 0.9019608, 1, 0, 1,
-0.8744689, 0.05607785, -0.7369829, 0.8941177, 1, 0, 1,
-0.8723587, -2.006507, -2.138258, 0.8901961, 1, 0, 1,
-0.8688183, 0.5919642, -0.7082283, 0.8823529, 1, 0, 1,
-0.8669104, 1.969003, -2.512564, 0.8784314, 1, 0, 1,
-0.8666568, -0.6800856, -2.356673, 0.8705882, 1, 0, 1,
-0.8651668, -0.7978783, -0.7372956, 0.8666667, 1, 0, 1,
-0.8596752, 0.4431885, -0.663425, 0.8588235, 1, 0, 1,
-0.858146, 0.7822366, -0.7032257, 0.854902, 1, 0, 1,
-0.8567755, 0.7877454, -0.2419433, 0.8470588, 1, 0, 1,
-0.8560127, 0.8054069, -0.3368027, 0.8431373, 1, 0, 1,
-0.8552865, -1.083989, -2.88978, 0.8352941, 1, 0, 1,
-0.8481166, 0.451092, -1.71919, 0.8313726, 1, 0, 1,
-0.8454746, -1.206688, -2.065391, 0.8235294, 1, 0, 1,
-0.8425418, 0.1685686, -0.9775493, 0.8196079, 1, 0, 1,
-0.8416615, 0.4827762, 0.4817171, 0.8117647, 1, 0, 1,
-0.8396578, 0.8630077, 0.1085934, 0.8078431, 1, 0, 1,
-0.8328314, 2.404492, 0.4142056, 0.8, 1, 0, 1,
-0.8295853, 0.1372021, -2.626079, 0.7921569, 1, 0, 1,
-0.8293874, 0.4168988, -1.983326, 0.7882353, 1, 0, 1,
-0.8272905, -0.9889631, -2.662058, 0.7803922, 1, 0, 1,
-0.8268069, -1.3827, -1.172554, 0.7764706, 1, 0, 1,
-0.8239476, 0.1032085, -2.339782, 0.7686275, 1, 0, 1,
-0.8231751, -1.148294, -2.304041, 0.7647059, 1, 0, 1,
-0.8203982, 0.8347753, -0.748313, 0.7568628, 1, 0, 1,
-0.8152093, 0.7151469, 0.7194244, 0.7529412, 1, 0, 1,
-0.8087605, -0.05247042, -1.965566, 0.7450981, 1, 0, 1,
-0.8081351, 0.547287, -0.1322089, 0.7411765, 1, 0, 1,
-0.8068235, -0.4838629, -2.615386, 0.7333333, 1, 0, 1,
-0.8051633, 0.7370737, -0.2774752, 0.7294118, 1, 0, 1,
-0.8050632, -0.8179962, -2.787716, 0.7215686, 1, 0, 1,
-0.7976726, -0.6274886, -4.848431, 0.7176471, 1, 0, 1,
-0.7946521, -1.171585, -2.434324, 0.7098039, 1, 0, 1,
-0.794261, 1.018067, -0.5748078, 0.7058824, 1, 0, 1,
-0.7940109, 2.423162, -1.020743, 0.6980392, 1, 0, 1,
-0.7811316, -1.422361, -2.269653, 0.6901961, 1, 0, 1,
-0.7780353, 0.08303071, -2.94101, 0.6862745, 1, 0, 1,
-0.7756021, 1.645502, -0.8858766, 0.6784314, 1, 0, 1,
-0.7685837, 1.089183, -1.486108, 0.6745098, 1, 0, 1,
-0.7683968, -1.450203, -3.351466, 0.6666667, 1, 0, 1,
-0.7633442, 0.07491757, -2.970628, 0.6627451, 1, 0, 1,
-0.7620003, 1.059947, 0.649031, 0.654902, 1, 0, 1,
-0.7619552, 0.6094692, 0.6932652, 0.6509804, 1, 0, 1,
-0.7607349, 2.481173, 2.670223, 0.6431373, 1, 0, 1,
-0.7516524, 0.9730121, -0.4621454, 0.6392157, 1, 0, 1,
-0.7497419, -0.01712033, -2.833898, 0.6313726, 1, 0, 1,
-0.7484979, -1.113206, -2.611931, 0.627451, 1, 0, 1,
-0.7479348, 1.152515, -0.502256, 0.6196079, 1, 0, 1,
-0.7420869, 1.530724, 0.5722849, 0.6156863, 1, 0, 1,
-0.7403841, 1.044623, -1.143846, 0.6078432, 1, 0, 1,
-0.7373253, 1.920256, -0.3370219, 0.6039216, 1, 0, 1,
-0.7361575, 0.7796751, 1.041371, 0.5960785, 1, 0, 1,
-0.73533, 0.06780924, -1.74288, 0.5882353, 1, 0, 1,
-0.7346889, -0.4770243, -1.351216, 0.5843138, 1, 0, 1,
-0.734678, 1.336597, 0.1564409, 0.5764706, 1, 0, 1,
-0.7297476, 0.5616255, -1.029505, 0.572549, 1, 0, 1,
-0.7293172, -0.07321663, -0.6127259, 0.5647059, 1, 0, 1,
-0.7282207, -0.8893251, -3.104213, 0.5607843, 1, 0, 1,
-0.7274613, -0.1314243, -0.8174952, 0.5529412, 1, 0, 1,
-0.7259413, 1.714275, -1.322112, 0.5490196, 1, 0, 1,
-0.724259, 0.3245066, -0.5995751, 0.5411765, 1, 0, 1,
-0.7207864, 0.8124704, 0.4227457, 0.5372549, 1, 0, 1,
-0.7190483, -0.2895759, -2.019378, 0.5294118, 1, 0, 1,
-0.7079211, -0.9695103, -3.067245, 0.5254902, 1, 0, 1,
-0.7065638, -1.524756, -1.711533, 0.5176471, 1, 0, 1,
-0.7054547, 0.475458, -0.9746351, 0.5137255, 1, 0, 1,
-0.7045173, 0.8684452, -0.9253323, 0.5058824, 1, 0, 1,
-0.7036917, -1.0449, -1.353791, 0.5019608, 1, 0, 1,
-0.7032689, 1.213964, 1.51977, 0.4941176, 1, 0, 1,
-0.6962323, 0.6811939, -0.2424724, 0.4862745, 1, 0, 1,
-0.6907341, -0.6284655, -2.504811, 0.4823529, 1, 0, 1,
-0.6785032, -1.090231, -2.08301, 0.4745098, 1, 0, 1,
-0.6776889, 1.125771, -0.7866284, 0.4705882, 1, 0, 1,
-0.6774808, -0.4279764, -1.303943, 0.4627451, 1, 0, 1,
-0.6773738, -0.2820932, -2.603125, 0.4588235, 1, 0, 1,
-0.6750621, -0.3659956, -1.688087, 0.4509804, 1, 0, 1,
-0.6730853, 0.9132783, -1.074448, 0.4470588, 1, 0, 1,
-0.6717217, -1.06585, -3.163304, 0.4392157, 1, 0, 1,
-0.6693881, -1.173924, -2.512799, 0.4352941, 1, 0, 1,
-0.6680279, 1.351529, -1.372795, 0.427451, 1, 0, 1,
-0.661391, 1.411993, 1.017211, 0.4235294, 1, 0, 1,
-0.6496605, -1.621726, -1.220071, 0.4156863, 1, 0, 1,
-0.6471154, -0.5071194, -1.744029, 0.4117647, 1, 0, 1,
-0.6451128, 1.323054, -1.07856, 0.4039216, 1, 0, 1,
-0.6400612, -0.6987009, -2.606548, 0.3960784, 1, 0, 1,
-0.631611, -0.690531, -1.99292, 0.3921569, 1, 0, 1,
-0.6261393, -0.3156141, -1.871827, 0.3843137, 1, 0, 1,
-0.6253337, -0.4423065, -3.054364, 0.3803922, 1, 0, 1,
-0.6239747, -0.5287836, -0.08171257, 0.372549, 1, 0, 1,
-0.6192664, 0.06611913, 0.4067123, 0.3686275, 1, 0, 1,
-0.6174564, -0.0306461, -1.158093, 0.3607843, 1, 0, 1,
-0.6070648, 0.5002308, 0.03620239, 0.3568628, 1, 0, 1,
-0.6037044, -0.863494, -0.728803, 0.3490196, 1, 0, 1,
-0.600212, 0.2131387, -1.489152, 0.345098, 1, 0, 1,
-0.5995536, 1.110682, -0.7583824, 0.3372549, 1, 0, 1,
-0.5972383, 0.3605037, -1.373786, 0.3333333, 1, 0, 1,
-0.5895948, 1.301118, -0.5850797, 0.3254902, 1, 0, 1,
-0.5853978, -1.213566, -0.5543703, 0.3215686, 1, 0, 1,
-0.585361, -0.5636418, -2.433596, 0.3137255, 1, 0, 1,
-0.5845111, 0.1852964, -2.08506, 0.3098039, 1, 0, 1,
-0.5779318, 0.6768118, -2.090066, 0.3019608, 1, 0, 1,
-0.5773138, -0.6940682, -2.981846, 0.2941177, 1, 0, 1,
-0.5710052, 1.106212, -1.751554, 0.2901961, 1, 0, 1,
-0.5642968, 1.369828, -1.073389, 0.282353, 1, 0, 1,
-0.5613728, 0.4603168, -0.6182484, 0.2784314, 1, 0, 1,
-0.556486, 0.9211425, 0.8814842, 0.2705882, 1, 0, 1,
-0.5544123, -0.6297005, -0.4163186, 0.2666667, 1, 0, 1,
-0.5540227, 0.9235157, -0.3890295, 0.2588235, 1, 0, 1,
-0.5523319, 1.01217, -0.7665411, 0.254902, 1, 0, 1,
-0.5522318, 0.8885366, -1.772296, 0.2470588, 1, 0, 1,
-0.551054, 0.1825966, 0.1856561, 0.2431373, 1, 0, 1,
-0.5471637, 0.5891504, -0.6984212, 0.2352941, 1, 0, 1,
-0.5404977, 0.2446805, -0.2028309, 0.2313726, 1, 0, 1,
-0.5388414, -1.406804, -2.631127, 0.2235294, 1, 0, 1,
-0.5385448, -0.5919887, -1.410446, 0.2196078, 1, 0, 1,
-0.53808, -2.128506, -3.041565, 0.2117647, 1, 0, 1,
-0.5366362, -1.456766, -4.643138, 0.2078431, 1, 0, 1,
-0.5338377, 1.090705, -1.313546, 0.2, 1, 0, 1,
-0.5282609, 0.9426355, 0.4001325, 0.1921569, 1, 0, 1,
-0.5263515, -0.04687059, -2.401584, 0.1882353, 1, 0, 1,
-0.5245575, 0.4505911, -0.4048988, 0.1803922, 1, 0, 1,
-0.5240552, 1.332752, 0.6618943, 0.1764706, 1, 0, 1,
-0.5217143, 2.075586, -0.2643997, 0.1686275, 1, 0, 1,
-0.5172847, 1.16258, -0.1502769, 0.1647059, 1, 0, 1,
-0.5138167, 0.2307775, -0.6441464, 0.1568628, 1, 0, 1,
-0.510617, 0.1896803, 0.8698686, 0.1529412, 1, 0, 1,
-0.5065514, 0.7862127, -2.450421, 0.145098, 1, 0, 1,
-0.5046716, 1.53586, 0.3492348, 0.1411765, 1, 0, 1,
-0.501628, -0.1973248, -3.502289, 0.1333333, 1, 0, 1,
-0.5007611, -0.3146251, -1.397258, 0.1294118, 1, 0, 1,
-0.4964137, 0.5652532, -1.704478, 0.1215686, 1, 0, 1,
-0.4945997, 1.209048, -0.3899969, 0.1176471, 1, 0, 1,
-0.489318, 0.6432388, 0.08824688, 0.1098039, 1, 0, 1,
-0.4848502, -0.7350647, -1.934012, 0.1058824, 1, 0, 1,
-0.4825748, -0.8833954, -3.917744, 0.09803922, 1, 0, 1,
-0.4791197, 1.079393, 0.08171778, 0.09019608, 1, 0, 1,
-0.47366, -0.1631084, -1.196697, 0.08627451, 1, 0, 1,
-0.4715721, 0.0690679, -3.16541, 0.07843138, 1, 0, 1,
-0.4698238, 0.2010855, -1.636712, 0.07450981, 1, 0, 1,
-0.4678854, -1.678021, -3.478078, 0.06666667, 1, 0, 1,
-0.4671967, 0.7234658, -1.304632, 0.0627451, 1, 0, 1,
-0.4624607, -0.5511296, -3.486768, 0.05490196, 1, 0, 1,
-0.4619281, 0.731509, 0.4943792, 0.05098039, 1, 0, 1,
-0.4602265, 0.7219167, -0.3345576, 0.04313726, 1, 0, 1,
-0.4590085, 1.064231, -0.361253, 0.03921569, 1, 0, 1,
-0.4548281, -1.298725, -4.132836, 0.03137255, 1, 0, 1,
-0.4508392, 0.719219, -0.116636, 0.02745098, 1, 0, 1,
-0.4487985, 1.214226, 0.8533739, 0.01960784, 1, 0, 1,
-0.4461093, -0.7022477, -2.926928, 0.01568628, 1, 0, 1,
-0.4408239, 1.619996, -0.7429488, 0.007843138, 1, 0, 1,
-0.4401047, 0.5018927, -1.197511, 0.003921569, 1, 0, 1,
-0.4363565, 0.932867, -1.147274, 0, 1, 0.003921569, 1,
-0.4355802, -0.926461, -3.135207, 0, 1, 0.01176471, 1,
-0.4335833, 0.6209918, -1.290144, 0, 1, 0.01568628, 1,
-0.4331816, 0.6758633, 0.5064207, 0, 1, 0.02352941, 1,
-0.4323875, 0.2042385, -0.5065808, 0, 1, 0.02745098, 1,
-0.4307922, 0.7483042, 0.8978258, 0, 1, 0.03529412, 1,
-0.4306663, -1.433311, -2.209069, 0, 1, 0.03921569, 1,
-0.4252691, 1.21347, 0.2067102, 0, 1, 0.04705882, 1,
-0.4241024, -0.9883054, -2.168717, 0, 1, 0.05098039, 1,
-0.4199499, 0.6293917, -0.4119442, 0, 1, 0.05882353, 1,
-0.4198931, 0.3779374, -1.42328, 0, 1, 0.0627451, 1,
-0.4149539, -0.4009377, -1.896839, 0, 1, 0.07058824, 1,
-0.4114454, -1.194087, -3.534316, 0, 1, 0.07450981, 1,
-0.4106948, -0.8272136, -1.893315, 0, 1, 0.08235294, 1,
-0.4079047, -0.6189224, -2.066965, 0, 1, 0.08627451, 1,
-0.4040128, -0.2583665, -1.121885, 0, 1, 0.09411765, 1,
-0.4035103, 0.1762869, 0.1194358, 0, 1, 0.1019608, 1,
-0.3983759, -1.169893, -3.794007, 0, 1, 0.1058824, 1,
-0.3947304, -1.567426, -2.141104, 0, 1, 0.1137255, 1,
-0.3917939, -0.242158, -3.420558, 0, 1, 0.1176471, 1,
-0.3916385, 1.623538, 2.27072, 0, 1, 0.1254902, 1,
-0.3876581, -0.6277647, -2.42359, 0, 1, 0.1294118, 1,
-0.3871392, 0.6561898, -0.1544022, 0, 1, 0.1372549, 1,
-0.3838574, 0.860451, 0.2699215, 0, 1, 0.1411765, 1,
-0.383849, 0.6152357, -1.823826, 0, 1, 0.1490196, 1,
-0.3772103, 0.730765, 0.09024712, 0, 1, 0.1529412, 1,
-0.3743118, 1.090875, 0.5589306, 0, 1, 0.1607843, 1,
-0.3665146, -0.546302, -1.733585, 0, 1, 0.1647059, 1,
-0.3645431, 0.1258088, -2.619459, 0, 1, 0.172549, 1,
-0.3641993, -1.489602, -1.599634, 0, 1, 0.1764706, 1,
-0.3626556, 0.2540904, -1.307604, 0, 1, 0.1843137, 1,
-0.3613546, 0.7323465, 1.130811, 0, 1, 0.1882353, 1,
-0.3583776, 0.6117684, -1.839771, 0, 1, 0.1960784, 1,
-0.3582734, -0.4545626, 0.0424659, 0, 1, 0.2039216, 1,
-0.3580662, 0.9922575, -1.11606, 0, 1, 0.2078431, 1,
-0.3577409, -0.5907011, -1.788268, 0, 1, 0.2156863, 1,
-0.3561932, -2.532399, -1.752547, 0, 1, 0.2196078, 1,
-0.3508739, 2.344689, -1.021971, 0, 1, 0.227451, 1,
-0.3504538, -0.643159, -2.926599, 0, 1, 0.2313726, 1,
-0.3469515, 0.1524413, -1.938551, 0, 1, 0.2392157, 1,
-0.3463686, 1.543765, -0.820297, 0, 1, 0.2431373, 1,
-0.3458482, 0.3942552, 0.1530748, 0, 1, 0.2509804, 1,
-0.3456154, -0.3791466, -3.304296, 0, 1, 0.254902, 1,
-0.3440218, -0.06853361, -2.270696, 0, 1, 0.2627451, 1,
-0.3436428, -0.1379436, -2.306142, 0, 1, 0.2666667, 1,
-0.3426169, 1.901244, 1.278253, 0, 1, 0.2745098, 1,
-0.3374119, 1.136698, -0.7810072, 0, 1, 0.2784314, 1,
-0.337298, -0.7128034, -3.808068, 0, 1, 0.2862745, 1,
-0.3366437, 0.02732365, -2.103187, 0, 1, 0.2901961, 1,
-0.3334107, -0.2483072, -1.533071, 0, 1, 0.2980392, 1,
-0.331303, 2.975803, -1.919525, 0, 1, 0.3058824, 1,
-0.3312118, -0.4877402, -2.476723, 0, 1, 0.3098039, 1,
-0.3250997, 1.063179, -1.823858, 0, 1, 0.3176471, 1,
-0.3248518, -0.2526305, -1.63154, 0, 1, 0.3215686, 1,
-0.3241231, -1.019903, -2.643074, 0, 1, 0.3294118, 1,
-0.32348, -1.3389, -4.449632, 0, 1, 0.3333333, 1,
-0.3220127, 0.2254698, -2.458605, 0, 1, 0.3411765, 1,
-0.3197433, -0.5211582, -1.392377, 0, 1, 0.345098, 1,
-0.319088, 0.02498814, -1.074421, 0, 1, 0.3529412, 1,
-0.3165488, 0.5033658, -0.9250242, 0, 1, 0.3568628, 1,
-0.313971, 0.6910903, -1.501958, 0, 1, 0.3647059, 1,
-0.3136468, 0.2601488, -0.2071865, 0, 1, 0.3686275, 1,
-0.3131614, -0.408728, -2.572553, 0, 1, 0.3764706, 1,
-0.3113784, -1.375493, -2.701866, 0, 1, 0.3803922, 1,
-0.308455, 1.098897, -0.4145469, 0, 1, 0.3882353, 1,
-0.3040917, 1.161827, 1.269392, 0, 1, 0.3921569, 1,
-0.2910335, -0.02741999, -1.928343, 0, 1, 0.4, 1,
-0.2905237, 0.3223885, 0.13456, 0, 1, 0.4078431, 1,
-0.2890834, -0.6962546, -2.17615, 0, 1, 0.4117647, 1,
-0.2882934, 0.3953987, -1.288414, 0, 1, 0.4196078, 1,
-0.2805252, -0.1990562, -2.317236, 0, 1, 0.4235294, 1,
-0.2777742, -0.06788428, -2.24381, 0, 1, 0.4313726, 1,
-0.2769949, 0.7353411, -1.394664, 0, 1, 0.4352941, 1,
-0.2766739, -1.22029, -4.297169, 0, 1, 0.4431373, 1,
-0.2757223, 0.1199769, -0.724741, 0, 1, 0.4470588, 1,
-0.2751231, 0.7674913, -0.9191607, 0, 1, 0.454902, 1,
-0.2748388, 2.06031, 0.5401961, 0, 1, 0.4588235, 1,
-0.2727627, -2.304826, -3.187782, 0, 1, 0.4666667, 1,
-0.2697575, 0.549334, 0.09224635, 0, 1, 0.4705882, 1,
-0.2687487, -0.9266603, -3.910072, 0, 1, 0.4784314, 1,
-0.2662492, 0.370359, -1.454561, 0, 1, 0.4823529, 1,
-0.2655853, 0.2301722, -0.296531, 0, 1, 0.4901961, 1,
-0.2652034, -0.4598145, -2.260729, 0, 1, 0.4941176, 1,
-0.2631019, -0.7391216, -1.830224, 0, 1, 0.5019608, 1,
-0.2589902, -0.2936528, -2.026856, 0, 1, 0.509804, 1,
-0.2572152, 0.06972404, -2.881741, 0, 1, 0.5137255, 1,
-0.2561747, -1.125802, -3.426268, 0, 1, 0.5215687, 1,
-0.2561615, -0.4319262, -4.6809, 0, 1, 0.5254902, 1,
-0.2546744, 1.186751, -0.7352867, 0, 1, 0.5333334, 1,
-0.2537383, -1.948181, -3.524947, 0, 1, 0.5372549, 1,
-0.2507372, 0.7706661, -1.160391, 0, 1, 0.5450981, 1,
-0.2497424, 1.96786, -1.103812, 0, 1, 0.5490196, 1,
-0.2457377, 0.9405214, 0.2417425, 0, 1, 0.5568628, 1,
-0.2453423, 0.3200364, -0.3314426, 0, 1, 0.5607843, 1,
-0.2448734, -1.097512, -0.8769621, 0, 1, 0.5686275, 1,
-0.2444166, 0.8098514, -0.7552135, 0, 1, 0.572549, 1,
-0.2392909, 0.1169988, -1.983597, 0, 1, 0.5803922, 1,
-0.2391769, -0.7420354, -2.276948, 0, 1, 0.5843138, 1,
-0.2389382, -2.974023, -4.49387, 0, 1, 0.5921569, 1,
-0.2324753, 0.3214446, -0.245126, 0, 1, 0.5960785, 1,
-0.2312623, -1.33042, -2.961896, 0, 1, 0.6039216, 1,
-0.231217, 0.5596572, -1.462271, 0, 1, 0.6117647, 1,
-0.231142, 1.071818, -0.9367834, 0, 1, 0.6156863, 1,
-0.2309348, -0.1577027, -1.676807, 0, 1, 0.6235294, 1,
-0.2273307, -1.533794, -2.702023, 0, 1, 0.627451, 1,
-0.2267103, 1.520329, -1.779862, 0, 1, 0.6352941, 1,
-0.2262863, 0.6632121, -0.4999641, 0, 1, 0.6392157, 1,
-0.225587, -0.7575525, -3.518934, 0, 1, 0.6470588, 1,
-0.2238273, 0.9904854, -0.08243826, 0, 1, 0.6509804, 1,
-0.2207631, -0.5739412, -1.861268, 0, 1, 0.6588235, 1,
-0.2185089, -0.32049, -3.711719, 0, 1, 0.6627451, 1,
-0.2168369, 1.221154, -0.9801223, 0, 1, 0.6705883, 1,
-0.2136141, -0.5438013, -4.212929, 0, 1, 0.6745098, 1,
-0.2046019, 0.1069136, -2.290576, 0, 1, 0.682353, 1,
-0.2029, -0.7409628, -2.93985, 0, 1, 0.6862745, 1,
-0.1975987, -0.827409, -1.224983, 0, 1, 0.6941177, 1,
-0.1900611, -0.2791675, -3.788912, 0, 1, 0.7019608, 1,
-0.1834106, -0.9158539, -3.641893, 0, 1, 0.7058824, 1,
-0.1773791, 0.3839794, -0.4269639, 0, 1, 0.7137255, 1,
-0.1744429, 1.088445, -0.3341657, 0, 1, 0.7176471, 1,
-0.1741405, 1.290172, -0.4927991, 0, 1, 0.7254902, 1,
-0.1731537, -1.118589, -3.583815, 0, 1, 0.7294118, 1,
-0.1707069, 0.2278977, -0.325068, 0, 1, 0.7372549, 1,
-0.1636052, -0.5378525, -1.177017, 0, 1, 0.7411765, 1,
-0.1635364, 0.9522058, -1.814768, 0, 1, 0.7490196, 1,
-0.1614087, -0.6970884, -3.393158, 0, 1, 0.7529412, 1,
-0.1612587, 0.8992649, -1.811308, 0, 1, 0.7607843, 1,
-0.154984, -0.9561141, -0.3475001, 0, 1, 0.7647059, 1,
-0.1541387, -0.8169619, -4.170142, 0, 1, 0.772549, 1,
-0.14864, 1.572111, 1.894908, 0, 1, 0.7764706, 1,
-0.1449264, -0.6353161, -1.810788, 0, 1, 0.7843137, 1,
-0.1437437, -0.6356217, -3.908989, 0, 1, 0.7882353, 1,
-0.1361752, 0.04814727, -0.5321541, 0, 1, 0.7960784, 1,
-0.1347736, -1.189294, -2.823573, 0, 1, 0.8039216, 1,
-0.1335332, 0.4621527, -1.247526, 0, 1, 0.8078431, 1,
-0.1291739, 0.9697408, 0.2145682, 0, 1, 0.8156863, 1,
-0.1268749, -0.02392079, -1.27371, 0, 1, 0.8196079, 1,
-0.1250407, -0.8116208, -3.74402, 0, 1, 0.827451, 1,
-0.1242982, 0.2641781, -1.045762, 0, 1, 0.8313726, 1,
-0.1240422, 0.5403215, -0.9096465, 0, 1, 0.8392157, 1,
-0.1214131, -0.8926302, -3.337494, 0, 1, 0.8431373, 1,
-0.1207284, 0.6561068, -0.1810758, 0, 1, 0.8509804, 1,
-0.1200743, 0.130607, -0.5367686, 0, 1, 0.854902, 1,
-0.1131119, -1.094732, -3.961242, 0, 1, 0.8627451, 1,
-0.109343, -2.014206, -2.143579, 0, 1, 0.8666667, 1,
-0.1091554, 0.996971, -1.436257, 0, 1, 0.8745098, 1,
-0.1057894, -1.455517, -4.630686, 0, 1, 0.8784314, 1,
-0.1029937, 0.9753088, 0.7636699, 0, 1, 0.8862745, 1,
-0.1020451, -0.5691808, -1.988503, 0, 1, 0.8901961, 1,
-0.1007496, -0.05896708, -2.823982, 0, 1, 0.8980392, 1,
-0.1001909, 1.35513, -0.3878386, 0, 1, 0.9058824, 1,
-0.09882667, -1.060279, -3.4359, 0, 1, 0.9098039, 1,
-0.09741218, 0.4039872, -0.9461987, 0, 1, 0.9176471, 1,
-0.09513011, 0.2167311, 0.005495408, 0, 1, 0.9215686, 1,
-0.09507484, 1.910174, -0.5814922, 0, 1, 0.9294118, 1,
-0.09266779, 2.831245, -0.3036243, 0, 1, 0.9333333, 1,
-0.09021457, -0.9278824, -3.135998, 0, 1, 0.9411765, 1,
-0.08936387, -0.4380015, -2.061248, 0, 1, 0.945098, 1,
-0.0857629, 0.6941807, 0.9084648, 0, 1, 0.9529412, 1,
-0.08246986, 0.6321588, -1.468675, 0, 1, 0.9568627, 1,
-0.08198123, 0.2829088, 0.4976397, 0, 1, 0.9647059, 1,
-0.08128756, -0.118324, -2.780157, 0, 1, 0.9686275, 1,
-0.07932769, -1.345413, -1.893854, 0, 1, 0.9764706, 1,
-0.07796318, -0.08503775, -2.410628, 0, 1, 0.9803922, 1,
-0.07534249, -0.8941123, -2.019599, 0, 1, 0.9882353, 1,
-0.07116306, 0.3876048, -1.574308, 0, 1, 0.9921569, 1,
-0.06858175, -0.643604, -4.164671, 0, 1, 1, 1,
-0.06559408, -1.818814, -4.559333, 0, 0.9921569, 1, 1,
-0.06076641, 2.450693, 0.7144139, 0, 0.9882353, 1, 1,
-0.05822606, 1.083662, 1.031547, 0, 0.9803922, 1, 1,
-0.05235129, 0.4445435, 0.2445937, 0, 0.9764706, 1, 1,
-0.05168817, -0.5727475, -4.039834, 0, 0.9686275, 1, 1,
-0.05110299, -0.2351291, -2.699199, 0, 0.9647059, 1, 1,
-0.05002902, 1.11278, 0.1994385, 0, 0.9568627, 1, 1,
-0.04948334, -1.444767, -1.715528, 0, 0.9529412, 1, 1,
-0.04924259, -0.749976, -3.988772, 0, 0.945098, 1, 1,
-0.04863207, -0.9144578, -3.152752, 0, 0.9411765, 1, 1,
-0.04392134, 0.2647606, 0.5666129, 0, 0.9333333, 1, 1,
-0.03994371, -0.009609067, -0.1030587, 0, 0.9294118, 1, 1,
-0.03888105, -0.4989741, -2.50925, 0, 0.9215686, 1, 1,
-0.03762809, 0.639846, 0.7737272, 0, 0.9176471, 1, 1,
-0.03271636, -2.13701, -4.78194, 0, 0.9098039, 1, 1,
-0.02529843, -0.1212788, -3.298342, 0, 0.9058824, 1, 1,
-0.02523074, -0.5703503, -3.534457, 0, 0.8980392, 1, 1,
-0.02376124, -1.526439, -2.966873, 0, 0.8901961, 1, 1,
-0.02319778, -0.6613477, -1.136549, 0, 0.8862745, 1, 1,
-0.02154806, -1.507433, -4.6092, 0, 0.8784314, 1, 1,
-0.01700208, 0.08105744, -0.5415493, 0, 0.8745098, 1, 1,
-0.01473985, -1.285292, -2.648248, 0, 0.8666667, 1, 1,
-0.01393261, -0.120008, -3.83059, 0, 0.8627451, 1, 1,
-0.01076845, -0.1136175, -2.57309, 0, 0.854902, 1, 1,
-0.007664307, 1.879, 1.844624, 0, 0.8509804, 1, 1,
-0.006804439, 1.391329, -0.5096262, 0, 0.8431373, 1, 1,
-0.001668099, -0.3555764, -5.297684, 0, 0.8392157, 1, 1,
0.004532646, -0.9555771, 4.403961, 0, 0.8313726, 1, 1,
0.00577134, 0.83802, -0.1254542, 0, 0.827451, 1, 1,
0.006589532, 1.016856, 0.1540432, 0, 0.8196079, 1, 1,
0.0120249, 0.4364268, 0.196252, 0, 0.8156863, 1, 1,
0.01438169, -1.325182, 2.114973, 0, 0.8078431, 1, 1,
0.0170262, 1.684908, -0.1225019, 0, 0.8039216, 1, 1,
0.01736871, -0.152758, 4.023795, 0, 0.7960784, 1, 1,
0.01823665, -0.5535567, 2.560955, 0, 0.7882353, 1, 1,
0.02518029, 0.1200097, 0.8469791, 0, 0.7843137, 1, 1,
0.02685014, 0.3160095, -0.6088408, 0, 0.7764706, 1, 1,
0.02912432, 1.252416, 0.6533211, 0, 0.772549, 1, 1,
0.02951441, -0.4876476, 4.475283, 0, 0.7647059, 1, 1,
0.03133902, -0.4017695, 4.189442, 0, 0.7607843, 1, 1,
0.03179334, -0.0854169, 2.662657, 0, 0.7529412, 1, 1,
0.03211036, -0.6291466, 2.969174, 0, 0.7490196, 1, 1,
0.03285778, -1.640985, 3.088902, 0, 0.7411765, 1, 1,
0.03461752, -0.4409261, 3.203483, 0, 0.7372549, 1, 1,
0.03723517, -0.3649932, 2.157453, 0, 0.7294118, 1, 1,
0.03807298, -1.944725, 3.061242, 0, 0.7254902, 1, 1,
0.04194409, -0.9087667, 4.968358, 0, 0.7176471, 1, 1,
0.04195014, 0.736045, 0.1000424, 0, 0.7137255, 1, 1,
0.04281616, 1.936468, 0.1880335, 0, 0.7058824, 1, 1,
0.04508801, -0.7181411, 3.359487, 0, 0.6980392, 1, 1,
0.04701176, -1.248343, 1.675175, 0, 0.6941177, 1, 1,
0.0482854, 0.08280734, -0.4095313, 0, 0.6862745, 1, 1,
0.04830797, -0.2926345, 2.989472, 0, 0.682353, 1, 1,
0.04986825, 1.870343, 1.491831, 0, 0.6745098, 1, 1,
0.04999746, 1.742148, 1.111773, 0, 0.6705883, 1, 1,
0.05006912, -0.8516338, 2.156554, 0, 0.6627451, 1, 1,
0.05707717, -1.099841, 3.647318, 0, 0.6588235, 1, 1,
0.05782019, -0.946597, 3.561302, 0, 0.6509804, 1, 1,
0.05815415, -0.2963495, 2.874254, 0, 0.6470588, 1, 1,
0.05939535, -1.260047, 3.713924, 0, 0.6392157, 1, 1,
0.06016179, -1.356269, 3.527394, 0, 0.6352941, 1, 1,
0.06289469, -0.2094557, 2.928862, 0, 0.627451, 1, 1,
0.06470734, 1.018515, 0.793236, 0, 0.6235294, 1, 1,
0.06763397, 0.2265373, 0.607325, 0, 0.6156863, 1, 1,
0.06775843, -0.5398303, 4.697156, 0, 0.6117647, 1, 1,
0.06781416, -0.7097743, 4.525925, 0, 0.6039216, 1, 1,
0.06840371, -0.2518288, 2.958716, 0, 0.5960785, 1, 1,
0.06940705, 0.5057235, 0.6555241, 0, 0.5921569, 1, 1,
0.07094067, -0.5138862, 3.077321, 0, 0.5843138, 1, 1,
0.07112511, 1.890988, -0.6113501, 0, 0.5803922, 1, 1,
0.07699367, -1.281684, 3.819175, 0, 0.572549, 1, 1,
0.07751335, -2.506438, 4.352572, 0, 0.5686275, 1, 1,
0.0777417, 2.155674, 0.2313755, 0, 0.5607843, 1, 1,
0.08113559, 1.223298, 1.589609, 0, 0.5568628, 1, 1,
0.08215164, 2.417082, 0.7295784, 0, 0.5490196, 1, 1,
0.08462504, -1.147902, 3.808037, 0, 0.5450981, 1, 1,
0.0853003, -0.1149126, 1.925708, 0, 0.5372549, 1, 1,
0.08620729, -0.9836668, 3.809995, 0, 0.5333334, 1, 1,
0.08620889, 0.3173159, 0.07372293, 0, 0.5254902, 1, 1,
0.08657602, 0.2828957, -1.181541, 0, 0.5215687, 1, 1,
0.08669624, 0.3198932, -1.332271, 0, 0.5137255, 1, 1,
0.08743307, 0.8235012, -0.4727258, 0, 0.509804, 1, 1,
0.09128205, -1.364159, 2.801648, 0, 0.5019608, 1, 1,
0.1032603, 0.8909986, -1.785001, 0, 0.4941176, 1, 1,
0.1080368, 0.3267344, 0.8407271, 0, 0.4901961, 1, 1,
0.1122386, -0.4634818, 2.800056, 0, 0.4823529, 1, 1,
0.1178186, -0.3056569, 2.285782, 0, 0.4784314, 1, 1,
0.1178974, -0.6322814, 4.339228, 0, 0.4705882, 1, 1,
0.1245983, 1.322876, -1.203926, 0, 0.4666667, 1, 1,
0.1324443, -0.6051171, 4.027065, 0, 0.4588235, 1, 1,
0.1387443, 1.024241, 1.346309, 0, 0.454902, 1, 1,
0.1417674, -0.4391762, 1.969774, 0, 0.4470588, 1, 1,
0.1508021, -0.007767067, 1.31335, 0, 0.4431373, 1, 1,
0.1509084, -0.6073696, 3.055804, 0, 0.4352941, 1, 1,
0.1521554, 1.071227, 1.470085, 0, 0.4313726, 1, 1,
0.1522296, -0.3997313, 4.447393, 0, 0.4235294, 1, 1,
0.1542834, -0.321145, 2.92647, 0, 0.4196078, 1, 1,
0.1551078, -0.9042432, 4.072945, 0, 0.4117647, 1, 1,
0.1561746, 0.2506699, -0.4384327, 0, 0.4078431, 1, 1,
0.1607033, -1.15181, 2.245202, 0, 0.4, 1, 1,
0.1675152, 1.300944, 1.18148, 0, 0.3921569, 1, 1,
0.1708464, -1.042466, 3.349881, 0, 0.3882353, 1, 1,
0.1748717, 1.558168, -1.376894, 0, 0.3803922, 1, 1,
0.1755805, -0.1380711, 3.596666, 0, 0.3764706, 1, 1,
0.1771039, -1.949666, 2.893532, 0, 0.3686275, 1, 1,
0.1848065, 0.04626305, 3.766055, 0, 0.3647059, 1, 1,
0.1854982, -0.5187751, 4.640184, 0, 0.3568628, 1, 1,
0.1869272, -1.581285, 2.946183, 0, 0.3529412, 1, 1,
0.1878217, -0.5646771, 3.07979, 0, 0.345098, 1, 1,
0.1897791, -0.7320747, 2.189188, 0, 0.3411765, 1, 1,
0.197153, 0.5553232, -0.1291046, 0, 0.3333333, 1, 1,
0.1999807, 0.121475, -0.5501188, 0, 0.3294118, 1, 1,
0.2032694, 0.4050055, 0.5617014, 0, 0.3215686, 1, 1,
0.2039823, -0.1436082, 3.711544, 0, 0.3176471, 1, 1,
0.2078365, -0.3603114, 4.236315, 0, 0.3098039, 1, 1,
0.2135281, 0.8441306, 0.6375065, 0, 0.3058824, 1, 1,
0.2142014, -0.894882, 4.04538, 0, 0.2980392, 1, 1,
0.2193616, 1.894766, -1.166328, 0, 0.2901961, 1, 1,
0.2298505, 0.8282681, 1.100237, 0, 0.2862745, 1, 1,
0.2299888, 1.498742, -0.7507306, 0, 0.2784314, 1, 1,
0.2300827, 0.7159082, 0.3577273, 0, 0.2745098, 1, 1,
0.2315482, -0.3280331, 2.814609, 0, 0.2666667, 1, 1,
0.2320834, 1.066193, 1.478407, 0, 0.2627451, 1, 1,
0.2331253, -0.3777534, 3.801847, 0, 0.254902, 1, 1,
0.2339341, 0.459501, 0.2027882, 0, 0.2509804, 1, 1,
0.23559, 1.415011, 0.4210653, 0, 0.2431373, 1, 1,
0.247337, -0.5753336, 1.823134, 0, 0.2392157, 1, 1,
0.2489011, -0.7642131, 1.978943, 0, 0.2313726, 1, 1,
0.2505085, -2.463225, 2.517657, 0, 0.227451, 1, 1,
0.2513056, 0.7429245, 1.181976, 0, 0.2196078, 1, 1,
0.2535723, -2.466057, 3.129656, 0, 0.2156863, 1, 1,
0.258884, -0.8999839, 3.609724, 0, 0.2078431, 1, 1,
0.2641563, 1.878777, -0.2269361, 0, 0.2039216, 1, 1,
0.2682129, 0.7495897, 0.9439475, 0, 0.1960784, 1, 1,
0.2693429, 0.8730899, -0.0257439, 0, 0.1882353, 1, 1,
0.2724599, -1.256222, 3.892883, 0, 0.1843137, 1, 1,
0.2735534, 0.5062174, 0.9066512, 0, 0.1764706, 1, 1,
0.2758817, 1.006301, 0.3968541, 0, 0.172549, 1, 1,
0.2833976, 0.08025482, 1.113902, 0, 0.1647059, 1, 1,
0.2836526, 0.2689995, 0.9087495, 0, 0.1607843, 1, 1,
0.2875011, 0.8545427, 0.3819345, 0, 0.1529412, 1, 1,
0.2902337, -0.347681, 2.049628, 0, 0.1490196, 1, 1,
0.2939664, -0.6101441, 3.917075, 0, 0.1411765, 1, 1,
0.3051152, 0.4215215, -0.1722842, 0, 0.1372549, 1, 1,
0.3096029, 0.1549231, -0.05851869, 0, 0.1294118, 1, 1,
0.3112723, -0.5692996, 3.943885, 0, 0.1254902, 1, 1,
0.3166363, 1.022491, -0.2337449, 0, 0.1176471, 1, 1,
0.3206764, 0.4782319, 2.646605, 0, 0.1137255, 1, 1,
0.3214169, 0.3523572, 2.624048, 0, 0.1058824, 1, 1,
0.3257476, 0.8668312, 0.6617095, 0, 0.09803922, 1, 1,
0.329708, 0.4616727, 1.060282, 0, 0.09411765, 1, 1,
0.3431505, 0.191697, 1.100061, 0, 0.08627451, 1, 1,
0.3461305, 1.363224, 0.200369, 0, 0.08235294, 1, 1,
0.3480594, -2.047289, 2.19445, 0, 0.07450981, 1, 1,
0.3522103, 0.2034949, 0.9172113, 0, 0.07058824, 1, 1,
0.3552412, -1.51409, 1.62941, 0, 0.0627451, 1, 1,
0.3611015, 1.42619, 1.523182, 0, 0.05882353, 1, 1,
0.3620526, 0.0909977, 1.246603, 0, 0.05098039, 1, 1,
0.3631487, -0.3413484, 1.741664, 0, 0.04705882, 1, 1,
0.3646441, -1.129438, 3.387121, 0, 0.03921569, 1, 1,
0.3665622, -1.043864, 2.432451, 0, 0.03529412, 1, 1,
0.37473, -1.074233, 3.527624, 0, 0.02745098, 1, 1,
0.3772551, -0.7100187, 2.814253, 0, 0.02352941, 1, 1,
0.3823088, 1.284048, 1.456699, 0, 0.01568628, 1, 1,
0.3846636, 1.122214, -1.068521, 0, 0.01176471, 1, 1,
0.386502, -0.2662974, 3.338408, 0, 0.003921569, 1, 1,
0.3875043, -0.5200241, 0.4434172, 0.003921569, 0, 1, 1,
0.3954715, 1.058603, -0.04381493, 0.007843138, 0, 1, 1,
0.3960166, -0.7522646, 3.419805, 0.01568628, 0, 1, 1,
0.3975675, 1.671873, 0.2597292, 0.01960784, 0, 1, 1,
0.3988474, 0.4614285, -0.6706171, 0.02745098, 0, 1, 1,
0.4083716, -0.3545477, 3.504537, 0.03137255, 0, 1, 1,
0.4108548, -1.826962, 1.077979, 0.03921569, 0, 1, 1,
0.4119888, 0.976917, -0.6657601, 0.04313726, 0, 1, 1,
0.4135574, -1.552477, 4.138775, 0.05098039, 0, 1, 1,
0.4141144, 0.4169374, 0.3959849, 0.05490196, 0, 1, 1,
0.4186933, 1.652373, 1.662115, 0.0627451, 0, 1, 1,
0.4192708, 0.04636284, 1.380303, 0.06666667, 0, 1, 1,
0.4233726, 0.1438266, -0.4658893, 0.07450981, 0, 1, 1,
0.4248937, -1.81747, 2.061692, 0.07843138, 0, 1, 1,
0.4276562, -0.6932969, 2.388335, 0.08627451, 0, 1, 1,
0.4278725, -0.8382213, 2.413026, 0.09019608, 0, 1, 1,
0.428409, 0.4593733, 1.160508, 0.09803922, 0, 1, 1,
0.4287298, 0.9090433, 1.223927, 0.1058824, 0, 1, 1,
0.4334461, -2.394509, 2.889961, 0.1098039, 0, 1, 1,
0.4367424, -0.8236706, 3.215227, 0.1176471, 0, 1, 1,
0.4393388, 0.480038, -0.2939213, 0.1215686, 0, 1, 1,
0.440556, -1.298029, 3.778581, 0.1294118, 0, 1, 1,
0.4460252, 0.2559044, 1.677435, 0.1333333, 0, 1, 1,
0.447098, -1.66039, 2.965313, 0.1411765, 0, 1, 1,
0.448037, 0.7777053, -0.4916697, 0.145098, 0, 1, 1,
0.4482417, -0.01673342, 0.6376703, 0.1529412, 0, 1, 1,
0.4545993, 0.884784, -1.037365, 0.1568628, 0, 1, 1,
0.4568697, -0.3500026, 1.618732, 0.1647059, 0, 1, 1,
0.4578278, -0.3663062, 2.043254, 0.1686275, 0, 1, 1,
0.4606611, -0.8690832, 2.441951, 0.1764706, 0, 1, 1,
0.4624538, 0.9110814, 0.4792522, 0.1803922, 0, 1, 1,
0.4686466, -0.6054393, 1.498122, 0.1882353, 0, 1, 1,
0.4731593, 0.7448081, 1.331848, 0.1921569, 0, 1, 1,
0.4761024, 0.03834934, 2.346467, 0.2, 0, 1, 1,
0.4769379, 0.6464611, -0.5650469, 0.2078431, 0, 1, 1,
0.4790115, 0.6441326, 1.778113, 0.2117647, 0, 1, 1,
0.4833552, -0.3883669, 2.280893, 0.2196078, 0, 1, 1,
0.485048, -0.1647645, 2.716558, 0.2235294, 0, 1, 1,
0.4850513, 1.786616, -1.312036, 0.2313726, 0, 1, 1,
0.4881495, -1.047443, 4.032036, 0.2352941, 0, 1, 1,
0.4896829, 0.8671212, -0.0847284, 0.2431373, 0, 1, 1,
0.4909377, -0.8879236, 2.408499, 0.2470588, 0, 1, 1,
0.4934739, -0.88303, 2.764328, 0.254902, 0, 1, 1,
0.4939552, 0.9651742, 0.8910965, 0.2588235, 0, 1, 1,
0.496727, -0.4931708, 2.431729, 0.2666667, 0, 1, 1,
0.5065287, 0.3985935, 0.2910359, 0.2705882, 0, 1, 1,
0.5115829, -1.696316, 4.246871, 0.2784314, 0, 1, 1,
0.5122402, -0.6496936, 1.604411, 0.282353, 0, 1, 1,
0.5143898, 1.115561, -0.7517055, 0.2901961, 0, 1, 1,
0.5160254, -0.2102255, 1.997122, 0.2941177, 0, 1, 1,
0.5169564, -0.1537464, 1.794558, 0.3019608, 0, 1, 1,
0.5172734, -0.9847271, 4.502763, 0.3098039, 0, 1, 1,
0.5218985, -2.546865, 2.197889, 0.3137255, 0, 1, 1,
0.5261294, -0.9498519, 2.138226, 0.3215686, 0, 1, 1,
0.5280761, 1.180463, 2.133992, 0.3254902, 0, 1, 1,
0.5294262, -1.313976, 2.24588, 0.3333333, 0, 1, 1,
0.5316398, -0.07457975, 1.455685, 0.3372549, 0, 1, 1,
0.5320091, 0.9198493, 0.7779985, 0.345098, 0, 1, 1,
0.5379217, 0.6111883, 0.4177029, 0.3490196, 0, 1, 1,
0.5384219, 0.7139588, 1.064018, 0.3568628, 0, 1, 1,
0.5413637, 0.3378239, 0.8272081, 0.3607843, 0, 1, 1,
0.5416227, -1.036784, 3.212603, 0.3686275, 0, 1, 1,
0.5520456, 1.749727, 0.1277941, 0.372549, 0, 1, 1,
0.5632104, -0.9289641, 4.008481, 0.3803922, 0, 1, 1,
0.5655807, -0.6137228, 1.830209, 0.3843137, 0, 1, 1,
0.5708966, 1.12965, 0.1767472, 0.3921569, 0, 1, 1,
0.5711992, 1.650356, -0.9674875, 0.3960784, 0, 1, 1,
0.5748571, 0.9739563, 1.500811, 0.4039216, 0, 1, 1,
0.5757465, 2.32886, 0.5363014, 0.4117647, 0, 1, 1,
0.5766175, 0.1392338, 0.7885955, 0.4156863, 0, 1, 1,
0.5774726, -0.4168365, 4.143796, 0.4235294, 0, 1, 1,
0.5837524, 0.7980344, 1.444847, 0.427451, 0, 1, 1,
0.5853754, 1.869702, 1.091857, 0.4352941, 0, 1, 1,
0.5879198, 1.642237, 1.213286, 0.4392157, 0, 1, 1,
0.589709, -0.3096628, 0.8112022, 0.4470588, 0, 1, 1,
0.5910533, -0.7165698, 1.549533, 0.4509804, 0, 1, 1,
0.5911292, -0.7396198, 2.9541, 0.4588235, 0, 1, 1,
0.5985829, -0.1901376, 2.743421, 0.4627451, 0, 1, 1,
0.5990676, -0.07060649, 2.186612, 0.4705882, 0, 1, 1,
0.6000894, 1.418321, -0.1000723, 0.4745098, 0, 1, 1,
0.6073868, -0.6169017, 1.020773, 0.4823529, 0, 1, 1,
0.6127173, 0.6503257, 2.843679, 0.4862745, 0, 1, 1,
0.614553, 0.1674755, 2.529901, 0.4941176, 0, 1, 1,
0.6168855, 2.328413, -0.7790247, 0.5019608, 0, 1, 1,
0.6184547, -0.4349785, 0.3183019, 0.5058824, 0, 1, 1,
0.6205674, 1.06384, 0.7860451, 0.5137255, 0, 1, 1,
0.6221024, 0.0345888, 0.9352303, 0.5176471, 0, 1, 1,
0.6249807, 0.9542445, 1.30378, 0.5254902, 0, 1, 1,
0.6282, -0.859006, 3.529133, 0.5294118, 0, 1, 1,
0.6300959, -0.05906394, 1.432559, 0.5372549, 0, 1, 1,
0.6317372, 1.153141, -1.562123, 0.5411765, 0, 1, 1,
0.6323192, 0.1653927, 1.657794, 0.5490196, 0, 1, 1,
0.6330423, -1.335379, 2.730851, 0.5529412, 0, 1, 1,
0.6363586, -0.9622247, 2.179242, 0.5607843, 0, 1, 1,
0.6371109, 0.4625967, 1.011327, 0.5647059, 0, 1, 1,
0.641028, -0.2379716, 1.830079, 0.572549, 0, 1, 1,
0.6439573, 1.287363, -0.2971157, 0.5764706, 0, 1, 1,
0.6513351, -0.1025525, 0.8302188, 0.5843138, 0, 1, 1,
0.6637678, -0.9078627, 4.512594, 0.5882353, 0, 1, 1,
0.6644439, -0.3679406, 2.825613, 0.5960785, 0, 1, 1,
0.669471, 1.524176, -0.891499, 0.6039216, 0, 1, 1,
0.6711016, 0.2641241, 2.161018, 0.6078432, 0, 1, 1,
0.6890002, -0.1420154, 1.196147, 0.6156863, 0, 1, 1,
0.6959325, 0.06488901, 2.386996, 0.6196079, 0, 1, 1,
0.699344, -0.6243506, 3.384403, 0.627451, 0, 1, 1,
0.6996435, 0.01702377, 1.82878, 0.6313726, 0, 1, 1,
0.7095931, 0.3287991, 0.8570749, 0.6392157, 0, 1, 1,
0.7106884, 1.192118, 0.362917, 0.6431373, 0, 1, 1,
0.7159996, 0.615258, 0.03931598, 0.6509804, 0, 1, 1,
0.718857, 0.3569165, 0.1322874, 0.654902, 0, 1, 1,
0.7281091, -0.820999, 0.8405062, 0.6627451, 0, 1, 1,
0.7298164, -0.5808115, 2.849052, 0.6666667, 0, 1, 1,
0.7332858, 2.848369, 0.1631076, 0.6745098, 0, 1, 1,
0.7335801, 0.5239568, 0.08603804, 0.6784314, 0, 1, 1,
0.7358945, -0.1720686, 0.5565306, 0.6862745, 0, 1, 1,
0.7372726, 1.45043, -1.382043, 0.6901961, 0, 1, 1,
0.7375203, -0.6826383, 4.110823, 0.6980392, 0, 1, 1,
0.7409005, 0.09308876, 1.820637, 0.7058824, 0, 1, 1,
0.7438704, 0.5145166, 1.278912, 0.7098039, 0, 1, 1,
0.749291, 0.236181, 1.404406, 0.7176471, 0, 1, 1,
0.7517866, 0.7177826, 0.9449318, 0.7215686, 0, 1, 1,
0.7525261, -0.2943744, 1.768975, 0.7294118, 0, 1, 1,
0.7617747, 0.3351623, -0.5205637, 0.7333333, 0, 1, 1,
0.7697117, 1.095518, -0.7343624, 0.7411765, 0, 1, 1,
0.7703115, -1.863294, 2.729063, 0.7450981, 0, 1, 1,
0.7713748, 0.9116374, 0.7859777, 0.7529412, 0, 1, 1,
0.7732726, -0.09381437, 2.300498, 0.7568628, 0, 1, 1,
0.7738813, -0.7844266, 4.084633, 0.7647059, 0, 1, 1,
0.7795216, 0.151218, 2.736276, 0.7686275, 0, 1, 1,
0.7818447, -0.8920875, 2.168605, 0.7764706, 0, 1, 1,
0.7844756, 0.1768609, 2.746516, 0.7803922, 0, 1, 1,
0.7920014, 0.8239975, -1.282315, 0.7882353, 0, 1, 1,
0.8047633, -0.9884598, 1.180924, 0.7921569, 0, 1, 1,
0.8050799, 0.9773153, 0.8227017, 0.8, 0, 1, 1,
0.8097862, -1.83029, 3.484417, 0.8078431, 0, 1, 1,
0.8101973, -0.445236, 1.296779, 0.8117647, 0, 1, 1,
0.8163748, 0.3343702, 0.6060497, 0.8196079, 0, 1, 1,
0.8208692, 0.1109851, 1.687413, 0.8235294, 0, 1, 1,
0.8290624, 0.1443334, 1.670032, 0.8313726, 0, 1, 1,
0.8303986, -0.7803531, 3.530256, 0.8352941, 0, 1, 1,
0.8357606, 0.3023255, 1.109192, 0.8431373, 0, 1, 1,
0.8383114, 2.376878, -0.5059035, 0.8470588, 0, 1, 1,
0.8425755, 0.2528664, 1.785758, 0.854902, 0, 1, 1,
0.8432472, -0.5860454, 1.312069, 0.8588235, 0, 1, 1,
0.8446276, -0.5075585, 1.505602, 0.8666667, 0, 1, 1,
0.8519682, 2.241366, 0.105832, 0.8705882, 0, 1, 1,
0.8612517, -1.495824, 4.061898, 0.8784314, 0, 1, 1,
0.8637112, 0.6494501, 1.226883, 0.8823529, 0, 1, 1,
0.865534, -0.4018152, 2.152804, 0.8901961, 0, 1, 1,
0.8677269, 1.818702, -0.6840728, 0.8941177, 0, 1, 1,
0.868724, -0.5201448, 1.18947, 0.9019608, 0, 1, 1,
0.8711026, -1.846561, 2.133571, 0.9098039, 0, 1, 1,
0.8846417, -1.230241, 1.411568, 0.9137255, 0, 1, 1,
0.8849175, -0.5309143, 1.608048, 0.9215686, 0, 1, 1,
0.8861187, 1.890037, 1.120517, 0.9254902, 0, 1, 1,
0.8900086, -1.21675, 4.148098, 0.9333333, 0, 1, 1,
0.8912115, 1.973131, 1.405392, 0.9372549, 0, 1, 1,
0.8919815, -1.261612, 2.17351, 0.945098, 0, 1, 1,
0.9022769, 0.07557542, -0.02390629, 0.9490196, 0, 1, 1,
0.9079885, -0.2031738, 1.831463, 0.9568627, 0, 1, 1,
0.9080737, 1.52399, 2.002494, 0.9607843, 0, 1, 1,
0.9175259, 0.3341435, 1.120482, 0.9686275, 0, 1, 1,
0.9195153, 1.203882, 1.77861, 0.972549, 0, 1, 1,
0.9219043, -3.346558, 3.560657, 0.9803922, 0, 1, 1,
0.9233621, 0.1705826, 1.775496, 0.9843137, 0, 1, 1,
0.9317653, -0.3661325, 2.576972, 0.9921569, 0, 1, 1,
0.9369357, -0.4235551, 1.453202, 0.9960784, 0, 1, 1,
0.9396495, -1.297602, 3.839839, 1, 0, 0.9960784, 1,
0.9402878, 0.6569467, 1.818196, 1, 0, 0.9882353, 1,
0.9485744, -0.002723107, 0.492421, 1, 0, 0.9843137, 1,
0.9508933, 0.7354115, 1.273297, 1, 0, 0.9764706, 1,
0.9527754, -0.2649169, 0.5799737, 1, 0, 0.972549, 1,
0.9549793, 2.287523, 3.161891, 1, 0, 0.9647059, 1,
0.957682, 0.7295724, 1.070095, 1, 0, 0.9607843, 1,
0.9625532, 0.3281213, 2.234233, 1, 0, 0.9529412, 1,
0.9635146, -1.646963, 3.156951, 1, 0, 0.9490196, 1,
0.9655185, 0.2974518, -0.04500722, 1, 0, 0.9411765, 1,
0.9655725, -0.02600463, 0.8696001, 1, 0, 0.9372549, 1,
0.9665711, 1.145804, 0.2094721, 1, 0, 0.9294118, 1,
0.9770623, 0.02385206, 1.596162, 1, 0, 0.9254902, 1,
0.9850378, -0.5362523, -0.2110161, 1, 0, 0.9176471, 1,
0.9924746, 3.613117, 0.9048153, 1, 0, 0.9137255, 1,
0.9950529, 0.1706807, 0.6095191, 1, 0, 0.9058824, 1,
0.9986433, -1.529039, 2.886644, 1, 0, 0.9019608, 1,
1.002652, 1.216319, 0.4252446, 1, 0, 0.8941177, 1,
1.003527, 0.8628783, 0.3842377, 1, 0, 0.8862745, 1,
1.006932, -1.282305, 3.111894, 1, 0, 0.8823529, 1,
1.006953, -0.3817858, 1.748728, 1, 0, 0.8745098, 1,
1.009847, -0.1657526, 1.850964, 1, 0, 0.8705882, 1,
1.011928, -0.02903806, 1.801906, 1, 0, 0.8627451, 1,
1.013123, 1.144483, -0.3834531, 1, 0, 0.8588235, 1,
1.013701, 0.6833872, 0.6204894, 1, 0, 0.8509804, 1,
1.015491, 0.5296177, -1.229384, 1, 0, 0.8470588, 1,
1.022614, 0.03103885, -0.4887055, 1, 0, 0.8392157, 1,
1.025363, 1.70687, -1.218188, 1, 0, 0.8352941, 1,
1.029335, -2.041476, 1.627092, 1, 0, 0.827451, 1,
1.031495, -0.7409934, 2.807904, 1, 0, 0.8235294, 1,
1.038911, -0.1998318, 3.093087, 1, 0, 0.8156863, 1,
1.039616, 0.218299, 1.783015, 1, 0, 0.8117647, 1,
1.046321, 0.08979979, 1.756997, 1, 0, 0.8039216, 1,
1.051145, -0.5459225, 1.769062, 1, 0, 0.7960784, 1,
1.059674, 0.5008907, 1.748852, 1, 0, 0.7921569, 1,
1.0624, 0.9933954, -0.3038996, 1, 0, 0.7843137, 1,
1.066425, 0.2064941, 3.521855, 1, 0, 0.7803922, 1,
1.069608, -0.759045, 1.512352, 1, 0, 0.772549, 1,
1.075586, -0.2031714, 0.6965735, 1, 0, 0.7686275, 1,
1.080041, 0.7501206, 0.175825, 1, 0, 0.7607843, 1,
1.08115, -0.1336156, 0.2233784, 1, 0, 0.7568628, 1,
1.082936, 0.7815849, 0.1627042, 1, 0, 0.7490196, 1,
1.086475, 1.149448, 1.498075, 1, 0, 0.7450981, 1,
1.099082, 0.9231837, 0.8238604, 1, 0, 0.7372549, 1,
1.104912, -0.5144726, 1.628774, 1, 0, 0.7333333, 1,
1.109904, -0.0597456, 1.123877, 1, 0, 0.7254902, 1,
1.115344, -0.6110299, 2.515515, 1, 0, 0.7215686, 1,
1.117022, 0.09973226, 2.002505, 1, 0, 0.7137255, 1,
1.120101, 0.1589505, -0.03848726, 1, 0, 0.7098039, 1,
1.142597, 0.1010303, 0.8046685, 1, 0, 0.7019608, 1,
1.14941, -0.5630372, 3.710692, 1, 0, 0.6941177, 1,
1.152434, -0.3080196, 2.857967, 1, 0, 0.6901961, 1,
1.154049, 0.5767868, 0.4694765, 1, 0, 0.682353, 1,
1.175619, 1.963931, -1.05102, 1, 0, 0.6784314, 1,
1.176565, 0.007331571, 2.029885, 1, 0, 0.6705883, 1,
1.181551, -0.3081815, 0.09754199, 1, 0, 0.6666667, 1,
1.193348, -0.9469087, 4.214841, 1, 0, 0.6588235, 1,
1.196843, 1.613203, -0.266291, 1, 0, 0.654902, 1,
1.199377, 0.6908841, 1.55568, 1, 0, 0.6470588, 1,
1.201645, -1.022518, 4.092067, 1, 0, 0.6431373, 1,
1.20365, 0.2861523, -0.06647329, 1, 0, 0.6352941, 1,
1.207403, -1.591332, 2.007579, 1, 0, 0.6313726, 1,
1.209231, 1.344764, -0.8533362, 1, 0, 0.6235294, 1,
1.211901, -0.3009657, 1.066682, 1, 0, 0.6196079, 1,
1.214808, 0.8724864, 0.6512076, 1, 0, 0.6117647, 1,
1.218606, 0.6070876, 1.03825, 1, 0, 0.6078432, 1,
1.22047, 0.9769472, -0.1074263, 1, 0, 0.6, 1,
1.227222, -1.174821, 0.9644604, 1, 0, 0.5921569, 1,
1.229074, 0.20235, 1.226813, 1, 0, 0.5882353, 1,
1.231146, 0.003556418, 2.581112, 1, 0, 0.5803922, 1,
1.242606, -0.5520577, 0.884183, 1, 0, 0.5764706, 1,
1.243577, -0.4185079, 2.083322, 1, 0, 0.5686275, 1,
1.254959, 0.4020498, 0.5987785, 1, 0, 0.5647059, 1,
1.256656, 0.02279712, 1.711113, 1, 0, 0.5568628, 1,
1.260334, -2.16445, 2.988378, 1, 0, 0.5529412, 1,
1.263342, -0.1925915, 2.116755, 1, 0, 0.5450981, 1,
1.27055, 0.4505271, 0.1263968, 1, 0, 0.5411765, 1,
1.273392, 0.5243043, 2.42631, 1, 0, 0.5333334, 1,
1.278097, 0.6676659, 2.504345, 1, 0, 0.5294118, 1,
1.286738, 0.9421188, 0.6733778, 1, 0, 0.5215687, 1,
1.290242, 0.1589711, 1.205323, 1, 0, 0.5176471, 1,
1.297725, 1.410601, 1.494671, 1, 0, 0.509804, 1,
1.297874, -0.3239609, 2.899661, 1, 0, 0.5058824, 1,
1.298304, 0.2008844, 1.173148, 1, 0, 0.4980392, 1,
1.313382, 0.1474039, 2.106337, 1, 0, 0.4901961, 1,
1.314192, 0.630683, 1.423735, 1, 0, 0.4862745, 1,
1.318225, 0.3760263, 2.426926, 1, 0, 0.4784314, 1,
1.31922, -0.7457101, 3.595808, 1, 0, 0.4745098, 1,
1.323856, 0.8639945, 3.143443, 1, 0, 0.4666667, 1,
1.353719, -0.1790325, 1.250089, 1, 0, 0.4627451, 1,
1.356984, 0.5438026, 0.1203625, 1, 0, 0.454902, 1,
1.361375, -2.65964, 0.4430122, 1, 0, 0.4509804, 1,
1.3714, 0.08054766, 0.8819295, 1, 0, 0.4431373, 1,
1.377887, -0.1363535, 1.696767, 1, 0, 0.4392157, 1,
1.381985, 0.6990898, 0.9261592, 1, 0, 0.4313726, 1,
1.391071, 0.2059567, 2.341739, 1, 0, 0.427451, 1,
1.397253, -0.3075079, 2.089656, 1, 0, 0.4196078, 1,
1.398, -0.1613645, 1.611442, 1, 0, 0.4156863, 1,
1.399455, -1.013267, 1.169294, 1, 0, 0.4078431, 1,
1.402384, 0.2139461, 2.189072, 1, 0, 0.4039216, 1,
1.4108, 0.822165, 0.1777045, 1, 0, 0.3960784, 1,
1.417065, -0.8621695, 1.762677, 1, 0, 0.3882353, 1,
1.419962, -1.537597, 2.577914, 1, 0, 0.3843137, 1,
1.425016, 0.9021398, 1.481975, 1, 0, 0.3764706, 1,
1.425283, 1.330658, -0.1975944, 1, 0, 0.372549, 1,
1.432143, 0.9083188, 1.719482, 1, 0, 0.3647059, 1,
1.433612, -0.2667179, 3.193185, 1, 0, 0.3607843, 1,
1.447692, 1.224906, 0.3209167, 1, 0, 0.3529412, 1,
1.478703, 1.346306, 1.371222, 1, 0, 0.3490196, 1,
1.479498, -1.58224, 2.299286, 1, 0, 0.3411765, 1,
1.484015, 0.5330553, 2.377176, 1, 0, 0.3372549, 1,
1.489763, 0.5932221, 1.589182, 1, 0, 0.3294118, 1,
1.490088, 0.9945449, 3.371773, 1, 0, 0.3254902, 1,
1.4953, -0.2923388, 1.198014, 1, 0, 0.3176471, 1,
1.507708, 0.5590956, 0.8710571, 1, 0, 0.3137255, 1,
1.527313, -0.2365918, 2.100889, 1, 0, 0.3058824, 1,
1.537156, 0.6030958, 0.4364228, 1, 0, 0.2980392, 1,
1.571029, 0.4237209, 2.929139, 1, 0, 0.2941177, 1,
1.588575, -0.2671757, 0.9098793, 1, 0, 0.2862745, 1,
1.610645, -1.132043, 2.633092, 1, 0, 0.282353, 1,
1.618021, 0.4445716, 3.002546, 1, 0, 0.2745098, 1,
1.618281, -1.680752, 1.637132, 1, 0, 0.2705882, 1,
1.620046, -0.8009512, 1.126479, 1, 0, 0.2627451, 1,
1.634028, -1.069856, 3.842052, 1, 0, 0.2588235, 1,
1.634974, -0.5346052, 1.989761, 1, 0, 0.2509804, 1,
1.645455, -0.9740791, 1.959891, 1, 0, 0.2470588, 1,
1.6592, 1.439235, 1.347286, 1, 0, 0.2392157, 1,
1.661135, -0.6474755, 0.6111159, 1, 0, 0.2352941, 1,
1.676999, -0.1151728, 3.085631, 1, 0, 0.227451, 1,
1.683933, -0.5272914, 2.700123, 1, 0, 0.2235294, 1,
1.705405, 1.908514, -0.6546338, 1, 0, 0.2156863, 1,
1.712424, 0.08717196, 3.969602, 1, 0, 0.2117647, 1,
1.751256, 0.469941, 0.3836513, 1, 0, 0.2039216, 1,
1.75232, -0.2833541, 0.8633451, 1, 0, 0.1960784, 1,
1.756826, -0.4925708, 0.6385818, 1, 0, 0.1921569, 1,
1.762147, -0.5037538, 1.94669, 1, 0, 0.1843137, 1,
1.780018, 0.4068504, 2.644413, 1, 0, 0.1803922, 1,
1.801104, -0.6076802, 2.468002, 1, 0, 0.172549, 1,
1.812908, 2.101198, -0.001554491, 1, 0, 0.1686275, 1,
1.862224, 0.117098, 1.603616, 1, 0, 0.1607843, 1,
1.867014, 0.07652512, 1.959566, 1, 0, 0.1568628, 1,
1.86798, 0.3428074, 1.743692, 1, 0, 0.1490196, 1,
1.911777, -0.2308092, 0.9725096, 1, 0, 0.145098, 1,
1.912675, 0.8554533, 0.2845088, 1, 0, 0.1372549, 1,
1.91806, -0.2302972, 3.529642, 1, 0, 0.1333333, 1,
1.927448, -0.08495605, 1.042286, 1, 0, 0.1254902, 1,
1.930288, -0.3117879, 0.5434541, 1, 0, 0.1215686, 1,
1.93084, 0.1386935, 3.010956, 1, 0, 0.1137255, 1,
1.97763, -2.169387, 1.070912, 1, 0, 0.1098039, 1,
2.020421, -0.8421133, 2.697433, 1, 0, 0.1019608, 1,
2.039667, -0.4464251, 3.019943, 1, 0, 0.09411765, 1,
2.058413, -1.673904, 2.664217, 1, 0, 0.09019608, 1,
2.068696, -0.2809046, 2.260249, 1, 0, 0.08235294, 1,
2.099306, -0.8319168, 1.206292, 1, 0, 0.07843138, 1,
2.17661, -0.7539633, 3.035197, 1, 0, 0.07058824, 1,
2.253718, -1.280057, 3.255841, 1, 0, 0.06666667, 1,
2.271875, 1.793494, 1.843632, 1, 0, 0.05882353, 1,
2.28592, -1.534597, 2.523245, 1, 0, 0.05490196, 1,
2.343707, -0.4338917, 3.794416, 1, 0, 0.04705882, 1,
2.428644, -0.4330942, 0.5830226, 1, 0, 0.04313726, 1,
2.440798, -0.1837845, 0.932032, 1, 0, 0.03529412, 1,
2.448812, -0.8189053, 0.6728928, 1, 0, 0.03137255, 1,
2.501959, -0.9760495, 0.4012522, 1, 0, 0.02352941, 1,
2.563835, 0.677629, 2.301195, 1, 0, 0.01960784, 1,
2.584695, 0.4688428, 0.6330132, 1, 0, 0.01176471, 1,
2.803429, -2.198201, 2.824114, 1, 0, 0.007843138, 1
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
-0.05166602, -4.526223, -7.049588, 0, -0.5, 0.5, 0.5,
-0.05166602, -4.526223, -7.049588, 1, -0.5, 0.5, 0.5,
-0.05166602, -4.526223, -7.049588, 1, 1.5, 0.5, 0.5,
-0.05166602, -4.526223, -7.049588, 0, 1.5, 0.5, 0.5
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
-3.874638, 0.1332797, -7.049588, 0, -0.5, 0.5, 0.5,
-3.874638, 0.1332797, -7.049588, 1, -0.5, 0.5, 0.5,
-3.874638, 0.1332797, -7.049588, 1, 1.5, 0.5, 0.5,
-3.874638, 0.1332797, -7.049588, 0, 1.5, 0.5, 0.5
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
-3.874638, -4.526223, -0.1697123, 0, -0.5, 0.5, 0.5,
-3.874638, -4.526223, -0.1697123, 1, -0.5, 0.5, 0.5,
-3.874638, -4.526223, -0.1697123, 1, 1.5, 0.5, 0.5,
-3.874638, -4.526223, -0.1697123, 0, 1.5, 0.5, 0.5
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
-2, -3.450953, -5.461924,
2, -3.450953, -5.461924,
-2, -3.450953, -5.461924,
-2, -3.630165, -5.726535,
-1, -3.450953, -5.461924,
-1, -3.630165, -5.726535,
0, -3.450953, -5.461924,
0, -3.630165, -5.726535,
1, -3.450953, -5.461924,
1, -3.630165, -5.726535,
2, -3.450953, -5.461924,
2, -3.630165, -5.726535
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
-2, -3.988588, -6.255756, 0, -0.5, 0.5, 0.5,
-2, -3.988588, -6.255756, 1, -0.5, 0.5, 0.5,
-2, -3.988588, -6.255756, 1, 1.5, 0.5, 0.5,
-2, -3.988588, -6.255756, 0, 1.5, 0.5, 0.5,
-1, -3.988588, -6.255756, 0, -0.5, 0.5, 0.5,
-1, -3.988588, -6.255756, 1, -0.5, 0.5, 0.5,
-1, -3.988588, -6.255756, 1, 1.5, 0.5, 0.5,
-1, -3.988588, -6.255756, 0, 1.5, 0.5, 0.5,
0, -3.988588, -6.255756, 0, -0.5, 0.5, 0.5,
0, -3.988588, -6.255756, 1, -0.5, 0.5, 0.5,
0, -3.988588, -6.255756, 1, 1.5, 0.5, 0.5,
0, -3.988588, -6.255756, 0, 1.5, 0.5, 0.5,
1, -3.988588, -6.255756, 0, -0.5, 0.5, 0.5,
1, -3.988588, -6.255756, 1, -0.5, 0.5, 0.5,
1, -3.988588, -6.255756, 1, 1.5, 0.5, 0.5,
1, -3.988588, -6.255756, 0, 1.5, 0.5, 0.5,
2, -3.988588, -6.255756, 0, -0.5, 0.5, 0.5,
2, -3.988588, -6.255756, 1, -0.5, 0.5, 0.5,
2, -3.988588, -6.255756, 1, 1.5, 0.5, 0.5,
2, -3.988588, -6.255756, 0, 1.5, 0.5, 0.5
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
-2.992414, -3, -5.461924,
-2.992414, 3, -5.461924,
-2.992414, -3, -5.461924,
-3.139451, -3, -5.726535,
-2.992414, -2, -5.461924,
-3.139451, -2, -5.726535,
-2.992414, -1, -5.461924,
-3.139451, -1, -5.726535,
-2.992414, 0, -5.461924,
-3.139451, 0, -5.726535,
-2.992414, 1, -5.461924,
-3.139451, 1, -5.726535,
-2.992414, 2, -5.461924,
-3.139451, 2, -5.726535,
-2.992414, 3, -5.461924,
-3.139451, 3, -5.726535
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
-3.433526, -3, -6.255756, 0, -0.5, 0.5, 0.5,
-3.433526, -3, -6.255756, 1, -0.5, 0.5, 0.5,
-3.433526, -3, -6.255756, 1, 1.5, 0.5, 0.5,
-3.433526, -3, -6.255756, 0, 1.5, 0.5, 0.5,
-3.433526, -2, -6.255756, 0, -0.5, 0.5, 0.5,
-3.433526, -2, -6.255756, 1, -0.5, 0.5, 0.5,
-3.433526, -2, -6.255756, 1, 1.5, 0.5, 0.5,
-3.433526, -2, -6.255756, 0, 1.5, 0.5, 0.5,
-3.433526, -1, -6.255756, 0, -0.5, 0.5, 0.5,
-3.433526, -1, -6.255756, 1, -0.5, 0.5, 0.5,
-3.433526, -1, -6.255756, 1, 1.5, 0.5, 0.5,
-3.433526, -1, -6.255756, 0, 1.5, 0.5, 0.5,
-3.433526, 0, -6.255756, 0, -0.5, 0.5, 0.5,
-3.433526, 0, -6.255756, 1, -0.5, 0.5, 0.5,
-3.433526, 0, -6.255756, 1, 1.5, 0.5, 0.5,
-3.433526, 0, -6.255756, 0, 1.5, 0.5, 0.5,
-3.433526, 1, -6.255756, 0, -0.5, 0.5, 0.5,
-3.433526, 1, -6.255756, 1, -0.5, 0.5, 0.5,
-3.433526, 1, -6.255756, 1, 1.5, 0.5, 0.5,
-3.433526, 1, -6.255756, 0, 1.5, 0.5, 0.5,
-3.433526, 2, -6.255756, 0, -0.5, 0.5, 0.5,
-3.433526, 2, -6.255756, 1, -0.5, 0.5, 0.5,
-3.433526, 2, -6.255756, 1, 1.5, 0.5, 0.5,
-3.433526, 2, -6.255756, 0, 1.5, 0.5, 0.5,
-3.433526, 3, -6.255756, 0, -0.5, 0.5, 0.5,
-3.433526, 3, -6.255756, 1, -0.5, 0.5, 0.5,
-3.433526, 3, -6.255756, 1, 1.5, 0.5, 0.5,
-3.433526, 3, -6.255756, 0, 1.5, 0.5, 0.5
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
-2.992414, -3.450953, -4,
-2.992414, -3.450953, 4,
-2.992414, -3.450953, -4,
-3.139451, -3.630165, -4,
-2.992414, -3.450953, -2,
-3.139451, -3.630165, -2,
-2.992414, -3.450953, 0,
-3.139451, -3.630165, 0,
-2.992414, -3.450953, 2,
-3.139451, -3.630165, 2,
-2.992414, -3.450953, 4,
-3.139451, -3.630165, 4
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
-3.433526, -3.988588, -4, 0, -0.5, 0.5, 0.5,
-3.433526, -3.988588, -4, 1, -0.5, 0.5, 0.5,
-3.433526, -3.988588, -4, 1, 1.5, 0.5, 0.5,
-3.433526, -3.988588, -4, 0, 1.5, 0.5, 0.5,
-3.433526, -3.988588, -2, 0, -0.5, 0.5, 0.5,
-3.433526, -3.988588, -2, 1, -0.5, 0.5, 0.5,
-3.433526, -3.988588, -2, 1, 1.5, 0.5, 0.5,
-3.433526, -3.988588, -2, 0, 1.5, 0.5, 0.5,
-3.433526, -3.988588, 0, 0, -0.5, 0.5, 0.5,
-3.433526, -3.988588, 0, 1, -0.5, 0.5, 0.5,
-3.433526, -3.988588, 0, 1, 1.5, 0.5, 0.5,
-3.433526, -3.988588, 0, 0, 1.5, 0.5, 0.5,
-3.433526, -3.988588, 2, 0, -0.5, 0.5, 0.5,
-3.433526, -3.988588, 2, 1, -0.5, 0.5, 0.5,
-3.433526, -3.988588, 2, 1, 1.5, 0.5, 0.5,
-3.433526, -3.988588, 2, 0, 1.5, 0.5, 0.5,
-3.433526, -3.988588, 4, 0, -0.5, 0.5, 0.5,
-3.433526, -3.988588, 4, 1, -0.5, 0.5, 0.5,
-3.433526, -3.988588, 4, 1, 1.5, 0.5, 0.5,
-3.433526, -3.988588, 4, 0, 1.5, 0.5, 0.5
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
-2.992414, -3.450953, -5.461924,
-2.992414, 3.717512, -5.461924,
-2.992414, -3.450953, 5.122499,
-2.992414, 3.717512, 5.122499,
-2.992414, -3.450953, -5.461924,
-2.992414, -3.450953, 5.122499,
-2.992414, 3.717512, -5.461924,
-2.992414, 3.717512, 5.122499,
-2.992414, -3.450953, -5.461924,
2.889082, -3.450953, -5.461924,
-2.992414, -3.450953, 5.122499,
2.889082, -3.450953, 5.122499,
-2.992414, 3.717512, -5.461924,
2.889082, 3.717512, -5.461924,
-2.992414, 3.717512, 5.122499,
2.889082, 3.717512, 5.122499,
2.889082, -3.450953, -5.461924,
2.889082, 3.717512, -5.461924,
2.889082, -3.450953, 5.122499,
2.889082, 3.717512, 5.122499,
2.889082, -3.450953, -5.461924,
2.889082, -3.450953, 5.122499,
2.889082, 3.717512, -5.461924,
2.889082, 3.717512, 5.122499
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
var radius = 7.513942;
var distance = 33.43038;
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
mvMatrix.translate( 0.05166602, -0.1332797, 0.1697123 );
mvMatrix.scale( 1.381319, 1.133328, 0.7675639 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.43038);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
imazamethabenz<-read.table("imazamethabenz.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imazamethabenz$V2
```

```
## Error in eval(expr, envir, enclos): object 'imazamethabenz' not found
```

```r
y<-imazamethabenz$V3
```

```
## Error in eval(expr, envir, enclos): object 'imazamethabenz' not found
```

```r
z<-imazamethabenz$V4
```

```
## Error in eval(expr, envir, enclos): object 'imazamethabenz' not found
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
-2.906761, -1.632143, -3.435207, 0, 0, 1, 1, 1,
-2.821829, 0.1309992, -1.305126, 1, 0, 0, 1, 1,
-2.78815, 0.7164865, -2.32658, 1, 0, 0, 1, 1,
-2.613184, -1.479589, -3.600848, 1, 0, 0, 1, 1,
-2.55004, 0.1831859, -1.699087, 1, 0, 0, 1, 1,
-2.370196, -0.4710811, -1.236489, 1, 0, 0, 1, 1,
-2.331042, 1.025907, 0.8086123, 0, 0, 0, 1, 1,
-2.28217, -0.2632257, -2.261397, 0, 0, 0, 1, 1,
-2.270803, -1.319301, -2.165582, 0, 0, 0, 1, 1,
-2.25585, 0.1533763, -2.899625, 0, 0, 0, 1, 1,
-2.13653, 0.06616977, -2.515151, 0, 0, 0, 1, 1,
-2.097361, 0.3876473, -3.06891, 0, 0, 0, 1, 1,
-2.067412, 0.5244936, -2.37924, 0, 0, 0, 1, 1,
-2.061505, -1.425832, -1.949545, 1, 1, 1, 1, 1,
-2.035017, -1.086914, -1.0028, 1, 1, 1, 1, 1,
-2.026656, -0.03960688, -1.845811, 1, 1, 1, 1, 1,
-1.998679, 0.8571077, -1.302752, 1, 1, 1, 1, 1,
-1.98728, -0.7566524, -0.765632, 1, 1, 1, 1, 1,
-1.966368, 0.6447719, -0.3986547, 1, 1, 1, 1, 1,
-1.954367, 0.1819821, -3.218543, 1, 1, 1, 1, 1,
-1.934532, -0.2604434, -1.851628, 1, 1, 1, 1, 1,
-1.89631, -0.6828904, -1.795225, 1, 1, 1, 1, 1,
-1.868777, -0.07516538, -0.4980171, 1, 1, 1, 1, 1,
-1.854386, -1.111212, -2.193801, 1, 1, 1, 1, 1,
-1.834714, -0.7507263, -1.678128, 1, 1, 1, 1, 1,
-1.832887, 0.1191286, -1.950832, 1, 1, 1, 1, 1,
-1.825629, 0.894962, -1.229248, 1, 1, 1, 1, 1,
-1.813425, 1.73716, 1.730437, 1, 1, 1, 1, 1,
-1.802139, -2.769617, -1.983844, 0, 0, 1, 1, 1,
-1.791718, -0.1223239, -2.247346, 1, 0, 0, 1, 1,
-1.785006, -0.3830833, -2.104945, 1, 0, 0, 1, 1,
-1.784372, -0.7811126, -2.254756, 1, 0, 0, 1, 1,
-1.773221, -0.1332599, -1.123404, 1, 0, 0, 1, 1,
-1.769077, 1.103369, -0.8355736, 1, 0, 0, 1, 1,
-1.766481, 0.07023361, -1.401758, 0, 0, 0, 1, 1,
-1.761621, 0.7028696, -1.113827, 0, 0, 0, 1, 1,
-1.747356, 0.6102899, -0.490341, 0, 0, 0, 1, 1,
-1.740497, 0.6494471, -0.6663588, 0, 0, 0, 1, 1,
-1.733436, 0.1258196, -0.2742113, 0, 0, 0, 1, 1,
-1.692699, 0.5952109, -1.869882, 0, 0, 0, 1, 1,
-1.689257, 0.07147167, -0.3489233, 0, 0, 0, 1, 1,
-1.657607, -2.113581, -2.849388, 1, 1, 1, 1, 1,
-1.645751, -2.439435, -2.071384, 1, 1, 1, 1, 1,
-1.644985, -1.699214, -1.630788, 1, 1, 1, 1, 1,
-1.626958, -0.5726022, -1.98465, 1, 1, 1, 1, 1,
-1.617814, 0.1301956, -1.879638, 1, 1, 1, 1, 1,
-1.600715, -1.228965, -1.750871, 1, 1, 1, 1, 1,
-1.586269, -0.4440321, -3.208918, 1, 1, 1, 1, 1,
-1.582805, -0.04726012, -0.7434667, 1, 1, 1, 1, 1,
-1.577016, -0.3558479, 0.1957488, 1, 1, 1, 1, 1,
-1.565098, 0.5915482, -1.456502, 1, 1, 1, 1, 1,
-1.564858, -0.5461589, -2.440322, 1, 1, 1, 1, 1,
-1.558237, -0.2701919, -2.50178, 1, 1, 1, 1, 1,
-1.539564, 0.1408211, -2.158128, 1, 1, 1, 1, 1,
-1.524647, -0.7477785, -1.70772, 1, 1, 1, 1, 1,
-1.524382, -0.3707555, -1.677123, 1, 1, 1, 1, 1,
-1.51013, 1.903249, 0.9680838, 0, 0, 1, 1, 1,
-1.48242, 0.2286682, -0.8778096, 1, 0, 0, 1, 1,
-1.474396, 0.8442692, 0.02009403, 1, 0, 0, 1, 1,
-1.4698, 0.129832, -2.967802, 1, 0, 0, 1, 1,
-1.458009, 1.397831, -1.072965, 1, 0, 0, 1, 1,
-1.447425, 1.155484, -0.1552808, 1, 0, 0, 1, 1,
-1.431179, 1.412683, -1.485955, 0, 0, 0, 1, 1,
-1.422553, 0.9848907, -0.4108812, 0, 0, 0, 1, 1,
-1.4195, -0.04475802, -1.841504, 0, 0, 0, 1, 1,
-1.400863, 1.911827, -0.796021, 0, 0, 0, 1, 1,
-1.395488, 1.155667, -0.7670707, 0, 0, 0, 1, 1,
-1.381242, 0.4051999, -0.7881462, 0, 0, 0, 1, 1,
-1.376458, -0.1179883, -2.122179, 0, 0, 0, 1, 1,
-1.374638, -1.326577, -1.915016, 1, 1, 1, 1, 1,
-1.373921, 1.101334, -0.7451704, 1, 1, 1, 1, 1,
-1.352225, -0.4579171, -1.240759, 1, 1, 1, 1, 1,
-1.34528, -1.027216, -2.650465, 1, 1, 1, 1, 1,
-1.330057, -1.115653, -0.8470895, 1, 1, 1, 1, 1,
-1.323142, -0.7153199, -3.308786, 1, 1, 1, 1, 1,
-1.314047, -0.9492272, -1.878576, 1, 1, 1, 1, 1,
-1.299521, 0.1309471, -2.058576, 1, 1, 1, 1, 1,
-1.296248, 1.342782, -0.617422, 1, 1, 1, 1, 1,
-1.285434, -2.438716, -3.058006, 1, 1, 1, 1, 1,
-1.27299, 0.3638872, -1.149416, 1, 1, 1, 1, 1,
-1.266125, 0.917685, 0.391201, 1, 1, 1, 1, 1,
-1.263851, 0.006901504, -0.7654, 1, 1, 1, 1, 1,
-1.262324, -0.384358, -1.102752, 1, 1, 1, 1, 1,
-1.258198, -0.4632017, -2.809201, 1, 1, 1, 1, 1,
-1.254482, 0.1802054, -1.66024, 0, 0, 1, 1, 1,
-1.253922, 0.6271306, 1.190814, 1, 0, 0, 1, 1,
-1.242478, 0.8862113, -1.672101, 1, 0, 0, 1, 1,
-1.242026, -0.6782594, -2.452065, 1, 0, 0, 1, 1,
-1.23954, -0.2237276, -1.802318, 1, 0, 0, 1, 1,
-1.238379, 1.292428, 0.09218947, 1, 0, 0, 1, 1,
-1.237577, 0.4740134, -2.616149, 0, 0, 0, 1, 1,
-1.228863, 1.417372, -0.8773286, 0, 0, 0, 1, 1,
-1.22871, 1.348432, 0.0126814, 0, 0, 0, 1, 1,
-1.227937, -2.043395, -1.487649, 0, 0, 0, 1, 1,
-1.22786, -0.05902292, -2.288316, 0, 0, 0, 1, 1,
-1.225057, -0.5561416, -2.461084, 0, 0, 0, 1, 1,
-1.219519, 0.6578891, -1.710996, 0, 0, 0, 1, 1,
-1.21077, -0.537065, -1.646202, 1, 1, 1, 1, 1,
-1.210205, 0.5193985, -1.094557, 1, 1, 1, 1, 1,
-1.209363, 0.2388878, -2.804538, 1, 1, 1, 1, 1,
-1.202881, 1.014768, -1.921295, 1, 1, 1, 1, 1,
-1.185162, 1.084878, -0.4452287, 1, 1, 1, 1, 1,
-1.156606, 1.362903, 0.2811581, 1, 1, 1, 1, 1,
-1.1557, 1.455755, 0.6387816, 1, 1, 1, 1, 1,
-1.141072, -0.6827309, -2.226938, 1, 1, 1, 1, 1,
-1.138681, 1.09658, -1.671866, 1, 1, 1, 1, 1,
-1.137656, 0.1541169, -2.580698, 1, 1, 1, 1, 1,
-1.133855, 0.48092, 0.326957, 1, 1, 1, 1, 1,
-1.133343, 0.8197851, -2.480173, 1, 1, 1, 1, 1,
-1.129267, 0.2970518, -0.1650044, 1, 1, 1, 1, 1,
-1.125318, -1.144316, -2.895107, 1, 1, 1, 1, 1,
-1.124082, -0.0229711, -1.186921, 1, 1, 1, 1, 1,
-1.120903, -0.6188689, -3.051142, 0, 0, 1, 1, 1,
-1.117748, -1.432454, -2.142398, 1, 0, 0, 1, 1,
-1.117445, 1.65618, -1.354465, 1, 0, 0, 1, 1,
-1.114667, -0.3842681, -1.850615, 1, 0, 0, 1, 1,
-1.113081, 2.754391, 0.07511988, 1, 0, 0, 1, 1,
-1.106044, -0.5362418, -1.059219, 1, 0, 0, 1, 1,
-1.10018, 0.2733913, -2.365872, 0, 0, 0, 1, 1,
-1.097139, 0.5273431, 1.504147, 0, 0, 0, 1, 1,
-1.090595, -1.732244, -2.67883, 0, 0, 0, 1, 1,
-1.078818, 0.4998618, -1.932096, 0, 0, 0, 1, 1,
-1.077267, -0.3915626, -3.25742, 0, 0, 0, 1, 1,
-1.076986, 0.8976973, -0.59907, 0, 0, 0, 1, 1,
-1.067761, -0.7542469, -3.822648, 0, 0, 0, 1, 1,
-1.066281, 0.01997587, -1.542279, 1, 1, 1, 1, 1,
-1.065152, -0.7428225, -2.57803, 1, 1, 1, 1, 1,
-1.064445, 0.2968542, -1.06269, 1, 1, 1, 1, 1,
-1.062926, -0.309686, -2.287049, 1, 1, 1, 1, 1,
-1.062524, -0.8860552, -2.92973, 1, 1, 1, 1, 1,
-1.061552, 1.137339, 1.051314, 1, 1, 1, 1, 1,
-1.060702, -0.3976242, -1.99954, 1, 1, 1, 1, 1,
-1.055343, 0.1147586, -1.892281, 1, 1, 1, 1, 1,
-1.048529, -0.2164861, -2.812575, 1, 1, 1, 1, 1,
-1.047193, -0.2995479, -0.02774972, 1, 1, 1, 1, 1,
-1.045209, 0.5389514, -1.199401, 1, 1, 1, 1, 1,
-1.037743, -0.7399527, -2.667658, 1, 1, 1, 1, 1,
-1.037437, -0.7760162, -5.307782, 1, 1, 1, 1, 1,
-1.035718, 3.23763, -0.768723, 1, 1, 1, 1, 1,
-1.03549, 0.7109504, -1.23216, 1, 1, 1, 1, 1,
-1.03001, 1.079459, -2.716063, 0, 0, 1, 1, 1,
-1.028004, -1.333464, -1.742207, 1, 0, 0, 1, 1,
-1.025832, 1.289997, -1.967673, 1, 0, 0, 1, 1,
-1.022841, -1.805754, -1.698014, 1, 0, 0, 1, 1,
-1.019842, 0.2671909, -2.560256, 1, 0, 0, 1, 1,
-1.017844, 1.172757, -0.8152838, 1, 0, 0, 1, 1,
-1.016009, -0.2602162, -1.543074, 0, 0, 0, 1, 1,
-1.007095, 0.912177, -0.1919422, 0, 0, 0, 1, 1,
-1.003177, 0.09681129, -0.367433, 0, 0, 0, 1, 1,
-0.9934872, -0.4768634, -2.164118, 0, 0, 0, 1, 1,
-0.9917997, -0.08058684, -1.68175, 0, 0, 0, 1, 1,
-0.988858, -0.8586622, -2.667879, 0, 0, 0, 1, 1,
-0.9876403, 0.917794, -0.0697877, 0, 0, 0, 1, 1,
-0.9854557, 1.522528, 0.143909, 1, 1, 1, 1, 1,
-0.984983, -0.5856742, -0.4869241, 1, 1, 1, 1, 1,
-0.9820042, -0.2049017, -3.073537, 1, 1, 1, 1, 1,
-0.9795913, -0.5806197, -3.595091, 1, 1, 1, 1, 1,
-0.9765713, 0.1724243, -2.322639, 1, 1, 1, 1, 1,
-0.9760948, -1.179846, -2.323324, 1, 1, 1, 1, 1,
-0.9672542, -0.7572505, -2.06624, 1, 1, 1, 1, 1,
-0.9656327, -0.9570684, -2.224561, 1, 1, 1, 1, 1,
-0.9635822, 1.898111, -1.682331, 1, 1, 1, 1, 1,
-0.9595367, 0.9513631, -1.749321, 1, 1, 1, 1, 1,
-0.941232, 0.0431046, -2.211614, 1, 1, 1, 1, 1,
-0.9392509, -0.1222949, -0.08629257, 1, 1, 1, 1, 1,
-0.9271066, -1.061118, -4.502288, 1, 1, 1, 1, 1,
-0.9255953, 0.7384527, -0.3107338, 1, 1, 1, 1, 1,
-0.9248362, 0.09263341, -1.186822, 1, 1, 1, 1, 1,
-0.9237387, -0.3340003, -2.655285, 0, 0, 1, 1, 1,
-0.9222142, 1.884734, -0.9803325, 1, 0, 0, 1, 1,
-0.9179462, -0.8566208, -2.591129, 1, 0, 0, 1, 1,
-0.9126133, -0.3463483, -2.273782, 1, 0, 0, 1, 1,
-0.9073489, 1.503343, 0.3695672, 1, 0, 0, 1, 1,
-0.9067389, 1.952809, -0.4541207, 1, 0, 0, 1, 1,
-0.9036802, -0.1488042, -0.214044, 0, 0, 0, 1, 1,
-0.8955278, 1.656455, 0.01275483, 0, 0, 0, 1, 1,
-0.8938262, 1.058167, -1.229865, 0, 0, 0, 1, 1,
-0.8905176, 0.07849354, -2.489545, 0, 0, 0, 1, 1,
-0.8898476, -0.6364236, -2.035869, 0, 0, 0, 1, 1,
-0.8881576, 0.4798077, -0.2634889, 0, 0, 0, 1, 1,
-0.887116, -0.5996839, -2.575047, 0, 0, 0, 1, 1,
-0.8857136, -0.2573919, -1.390268, 1, 1, 1, 1, 1,
-0.8827484, -0.08283518, -1.785411, 1, 1, 1, 1, 1,
-0.8806407, 1.733968, -0.613494, 1, 1, 1, 1, 1,
-0.8744689, 0.05607785, -0.7369829, 1, 1, 1, 1, 1,
-0.8723587, -2.006507, -2.138258, 1, 1, 1, 1, 1,
-0.8688183, 0.5919642, -0.7082283, 1, 1, 1, 1, 1,
-0.8669104, 1.969003, -2.512564, 1, 1, 1, 1, 1,
-0.8666568, -0.6800856, -2.356673, 1, 1, 1, 1, 1,
-0.8651668, -0.7978783, -0.7372956, 1, 1, 1, 1, 1,
-0.8596752, 0.4431885, -0.663425, 1, 1, 1, 1, 1,
-0.858146, 0.7822366, -0.7032257, 1, 1, 1, 1, 1,
-0.8567755, 0.7877454, -0.2419433, 1, 1, 1, 1, 1,
-0.8560127, 0.8054069, -0.3368027, 1, 1, 1, 1, 1,
-0.8552865, -1.083989, -2.88978, 1, 1, 1, 1, 1,
-0.8481166, 0.451092, -1.71919, 1, 1, 1, 1, 1,
-0.8454746, -1.206688, -2.065391, 0, 0, 1, 1, 1,
-0.8425418, 0.1685686, -0.9775493, 1, 0, 0, 1, 1,
-0.8416615, 0.4827762, 0.4817171, 1, 0, 0, 1, 1,
-0.8396578, 0.8630077, 0.1085934, 1, 0, 0, 1, 1,
-0.8328314, 2.404492, 0.4142056, 1, 0, 0, 1, 1,
-0.8295853, 0.1372021, -2.626079, 1, 0, 0, 1, 1,
-0.8293874, 0.4168988, -1.983326, 0, 0, 0, 1, 1,
-0.8272905, -0.9889631, -2.662058, 0, 0, 0, 1, 1,
-0.8268069, -1.3827, -1.172554, 0, 0, 0, 1, 1,
-0.8239476, 0.1032085, -2.339782, 0, 0, 0, 1, 1,
-0.8231751, -1.148294, -2.304041, 0, 0, 0, 1, 1,
-0.8203982, 0.8347753, -0.748313, 0, 0, 0, 1, 1,
-0.8152093, 0.7151469, 0.7194244, 0, 0, 0, 1, 1,
-0.8087605, -0.05247042, -1.965566, 1, 1, 1, 1, 1,
-0.8081351, 0.547287, -0.1322089, 1, 1, 1, 1, 1,
-0.8068235, -0.4838629, -2.615386, 1, 1, 1, 1, 1,
-0.8051633, 0.7370737, -0.2774752, 1, 1, 1, 1, 1,
-0.8050632, -0.8179962, -2.787716, 1, 1, 1, 1, 1,
-0.7976726, -0.6274886, -4.848431, 1, 1, 1, 1, 1,
-0.7946521, -1.171585, -2.434324, 1, 1, 1, 1, 1,
-0.794261, 1.018067, -0.5748078, 1, 1, 1, 1, 1,
-0.7940109, 2.423162, -1.020743, 1, 1, 1, 1, 1,
-0.7811316, -1.422361, -2.269653, 1, 1, 1, 1, 1,
-0.7780353, 0.08303071, -2.94101, 1, 1, 1, 1, 1,
-0.7756021, 1.645502, -0.8858766, 1, 1, 1, 1, 1,
-0.7685837, 1.089183, -1.486108, 1, 1, 1, 1, 1,
-0.7683968, -1.450203, -3.351466, 1, 1, 1, 1, 1,
-0.7633442, 0.07491757, -2.970628, 1, 1, 1, 1, 1,
-0.7620003, 1.059947, 0.649031, 0, 0, 1, 1, 1,
-0.7619552, 0.6094692, 0.6932652, 1, 0, 0, 1, 1,
-0.7607349, 2.481173, 2.670223, 1, 0, 0, 1, 1,
-0.7516524, 0.9730121, -0.4621454, 1, 0, 0, 1, 1,
-0.7497419, -0.01712033, -2.833898, 1, 0, 0, 1, 1,
-0.7484979, -1.113206, -2.611931, 1, 0, 0, 1, 1,
-0.7479348, 1.152515, -0.502256, 0, 0, 0, 1, 1,
-0.7420869, 1.530724, 0.5722849, 0, 0, 0, 1, 1,
-0.7403841, 1.044623, -1.143846, 0, 0, 0, 1, 1,
-0.7373253, 1.920256, -0.3370219, 0, 0, 0, 1, 1,
-0.7361575, 0.7796751, 1.041371, 0, 0, 0, 1, 1,
-0.73533, 0.06780924, -1.74288, 0, 0, 0, 1, 1,
-0.7346889, -0.4770243, -1.351216, 0, 0, 0, 1, 1,
-0.734678, 1.336597, 0.1564409, 1, 1, 1, 1, 1,
-0.7297476, 0.5616255, -1.029505, 1, 1, 1, 1, 1,
-0.7293172, -0.07321663, -0.6127259, 1, 1, 1, 1, 1,
-0.7282207, -0.8893251, -3.104213, 1, 1, 1, 1, 1,
-0.7274613, -0.1314243, -0.8174952, 1, 1, 1, 1, 1,
-0.7259413, 1.714275, -1.322112, 1, 1, 1, 1, 1,
-0.724259, 0.3245066, -0.5995751, 1, 1, 1, 1, 1,
-0.7207864, 0.8124704, 0.4227457, 1, 1, 1, 1, 1,
-0.7190483, -0.2895759, -2.019378, 1, 1, 1, 1, 1,
-0.7079211, -0.9695103, -3.067245, 1, 1, 1, 1, 1,
-0.7065638, -1.524756, -1.711533, 1, 1, 1, 1, 1,
-0.7054547, 0.475458, -0.9746351, 1, 1, 1, 1, 1,
-0.7045173, 0.8684452, -0.9253323, 1, 1, 1, 1, 1,
-0.7036917, -1.0449, -1.353791, 1, 1, 1, 1, 1,
-0.7032689, 1.213964, 1.51977, 1, 1, 1, 1, 1,
-0.6962323, 0.6811939, -0.2424724, 0, 0, 1, 1, 1,
-0.6907341, -0.6284655, -2.504811, 1, 0, 0, 1, 1,
-0.6785032, -1.090231, -2.08301, 1, 0, 0, 1, 1,
-0.6776889, 1.125771, -0.7866284, 1, 0, 0, 1, 1,
-0.6774808, -0.4279764, -1.303943, 1, 0, 0, 1, 1,
-0.6773738, -0.2820932, -2.603125, 1, 0, 0, 1, 1,
-0.6750621, -0.3659956, -1.688087, 0, 0, 0, 1, 1,
-0.6730853, 0.9132783, -1.074448, 0, 0, 0, 1, 1,
-0.6717217, -1.06585, -3.163304, 0, 0, 0, 1, 1,
-0.6693881, -1.173924, -2.512799, 0, 0, 0, 1, 1,
-0.6680279, 1.351529, -1.372795, 0, 0, 0, 1, 1,
-0.661391, 1.411993, 1.017211, 0, 0, 0, 1, 1,
-0.6496605, -1.621726, -1.220071, 0, 0, 0, 1, 1,
-0.6471154, -0.5071194, -1.744029, 1, 1, 1, 1, 1,
-0.6451128, 1.323054, -1.07856, 1, 1, 1, 1, 1,
-0.6400612, -0.6987009, -2.606548, 1, 1, 1, 1, 1,
-0.631611, -0.690531, -1.99292, 1, 1, 1, 1, 1,
-0.6261393, -0.3156141, -1.871827, 1, 1, 1, 1, 1,
-0.6253337, -0.4423065, -3.054364, 1, 1, 1, 1, 1,
-0.6239747, -0.5287836, -0.08171257, 1, 1, 1, 1, 1,
-0.6192664, 0.06611913, 0.4067123, 1, 1, 1, 1, 1,
-0.6174564, -0.0306461, -1.158093, 1, 1, 1, 1, 1,
-0.6070648, 0.5002308, 0.03620239, 1, 1, 1, 1, 1,
-0.6037044, -0.863494, -0.728803, 1, 1, 1, 1, 1,
-0.600212, 0.2131387, -1.489152, 1, 1, 1, 1, 1,
-0.5995536, 1.110682, -0.7583824, 1, 1, 1, 1, 1,
-0.5972383, 0.3605037, -1.373786, 1, 1, 1, 1, 1,
-0.5895948, 1.301118, -0.5850797, 1, 1, 1, 1, 1,
-0.5853978, -1.213566, -0.5543703, 0, 0, 1, 1, 1,
-0.585361, -0.5636418, -2.433596, 1, 0, 0, 1, 1,
-0.5845111, 0.1852964, -2.08506, 1, 0, 0, 1, 1,
-0.5779318, 0.6768118, -2.090066, 1, 0, 0, 1, 1,
-0.5773138, -0.6940682, -2.981846, 1, 0, 0, 1, 1,
-0.5710052, 1.106212, -1.751554, 1, 0, 0, 1, 1,
-0.5642968, 1.369828, -1.073389, 0, 0, 0, 1, 1,
-0.5613728, 0.4603168, -0.6182484, 0, 0, 0, 1, 1,
-0.556486, 0.9211425, 0.8814842, 0, 0, 0, 1, 1,
-0.5544123, -0.6297005, -0.4163186, 0, 0, 0, 1, 1,
-0.5540227, 0.9235157, -0.3890295, 0, 0, 0, 1, 1,
-0.5523319, 1.01217, -0.7665411, 0, 0, 0, 1, 1,
-0.5522318, 0.8885366, -1.772296, 0, 0, 0, 1, 1,
-0.551054, 0.1825966, 0.1856561, 1, 1, 1, 1, 1,
-0.5471637, 0.5891504, -0.6984212, 1, 1, 1, 1, 1,
-0.5404977, 0.2446805, -0.2028309, 1, 1, 1, 1, 1,
-0.5388414, -1.406804, -2.631127, 1, 1, 1, 1, 1,
-0.5385448, -0.5919887, -1.410446, 1, 1, 1, 1, 1,
-0.53808, -2.128506, -3.041565, 1, 1, 1, 1, 1,
-0.5366362, -1.456766, -4.643138, 1, 1, 1, 1, 1,
-0.5338377, 1.090705, -1.313546, 1, 1, 1, 1, 1,
-0.5282609, 0.9426355, 0.4001325, 1, 1, 1, 1, 1,
-0.5263515, -0.04687059, -2.401584, 1, 1, 1, 1, 1,
-0.5245575, 0.4505911, -0.4048988, 1, 1, 1, 1, 1,
-0.5240552, 1.332752, 0.6618943, 1, 1, 1, 1, 1,
-0.5217143, 2.075586, -0.2643997, 1, 1, 1, 1, 1,
-0.5172847, 1.16258, -0.1502769, 1, 1, 1, 1, 1,
-0.5138167, 0.2307775, -0.6441464, 1, 1, 1, 1, 1,
-0.510617, 0.1896803, 0.8698686, 0, 0, 1, 1, 1,
-0.5065514, 0.7862127, -2.450421, 1, 0, 0, 1, 1,
-0.5046716, 1.53586, 0.3492348, 1, 0, 0, 1, 1,
-0.501628, -0.1973248, -3.502289, 1, 0, 0, 1, 1,
-0.5007611, -0.3146251, -1.397258, 1, 0, 0, 1, 1,
-0.4964137, 0.5652532, -1.704478, 1, 0, 0, 1, 1,
-0.4945997, 1.209048, -0.3899969, 0, 0, 0, 1, 1,
-0.489318, 0.6432388, 0.08824688, 0, 0, 0, 1, 1,
-0.4848502, -0.7350647, -1.934012, 0, 0, 0, 1, 1,
-0.4825748, -0.8833954, -3.917744, 0, 0, 0, 1, 1,
-0.4791197, 1.079393, 0.08171778, 0, 0, 0, 1, 1,
-0.47366, -0.1631084, -1.196697, 0, 0, 0, 1, 1,
-0.4715721, 0.0690679, -3.16541, 0, 0, 0, 1, 1,
-0.4698238, 0.2010855, -1.636712, 1, 1, 1, 1, 1,
-0.4678854, -1.678021, -3.478078, 1, 1, 1, 1, 1,
-0.4671967, 0.7234658, -1.304632, 1, 1, 1, 1, 1,
-0.4624607, -0.5511296, -3.486768, 1, 1, 1, 1, 1,
-0.4619281, 0.731509, 0.4943792, 1, 1, 1, 1, 1,
-0.4602265, 0.7219167, -0.3345576, 1, 1, 1, 1, 1,
-0.4590085, 1.064231, -0.361253, 1, 1, 1, 1, 1,
-0.4548281, -1.298725, -4.132836, 1, 1, 1, 1, 1,
-0.4508392, 0.719219, -0.116636, 1, 1, 1, 1, 1,
-0.4487985, 1.214226, 0.8533739, 1, 1, 1, 1, 1,
-0.4461093, -0.7022477, -2.926928, 1, 1, 1, 1, 1,
-0.4408239, 1.619996, -0.7429488, 1, 1, 1, 1, 1,
-0.4401047, 0.5018927, -1.197511, 1, 1, 1, 1, 1,
-0.4363565, 0.932867, -1.147274, 1, 1, 1, 1, 1,
-0.4355802, -0.926461, -3.135207, 1, 1, 1, 1, 1,
-0.4335833, 0.6209918, -1.290144, 0, 0, 1, 1, 1,
-0.4331816, 0.6758633, 0.5064207, 1, 0, 0, 1, 1,
-0.4323875, 0.2042385, -0.5065808, 1, 0, 0, 1, 1,
-0.4307922, 0.7483042, 0.8978258, 1, 0, 0, 1, 1,
-0.4306663, -1.433311, -2.209069, 1, 0, 0, 1, 1,
-0.4252691, 1.21347, 0.2067102, 1, 0, 0, 1, 1,
-0.4241024, -0.9883054, -2.168717, 0, 0, 0, 1, 1,
-0.4199499, 0.6293917, -0.4119442, 0, 0, 0, 1, 1,
-0.4198931, 0.3779374, -1.42328, 0, 0, 0, 1, 1,
-0.4149539, -0.4009377, -1.896839, 0, 0, 0, 1, 1,
-0.4114454, -1.194087, -3.534316, 0, 0, 0, 1, 1,
-0.4106948, -0.8272136, -1.893315, 0, 0, 0, 1, 1,
-0.4079047, -0.6189224, -2.066965, 0, 0, 0, 1, 1,
-0.4040128, -0.2583665, -1.121885, 1, 1, 1, 1, 1,
-0.4035103, 0.1762869, 0.1194358, 1, 1, 1, 1, 1,
-0.3983759, -1.169893, -3.794007, 1, 1, 1, 1, 1,
-0.3947304, -1.567426, -2.141104, 1, 1, 1, 1, 1,
-0.3917939, -0.242158, -3.420558, 1, 1, 1, 1, 1,
-0.3916385, 1.623538, 2.27072, 1, 1, 1, 1, 1,
-0.3876581, -0.6277647, -2.42359, 1, 1, 1, 1, 1,
-0.3871392, 0.6561898, -0.1544022, 1, 1, 1, 1, 1,
-0.3838574, 0.860451, 0.2699215, 1, 1, 1, 1, 1,
-0.383849, 0.6152357, -1.823826, 1, 1, 1, 1, 1,
-0.3772103, 0.730765, 0.09024712, 1, 1, 1, 1, 1,
-0.3743118, 1.090875, 0.5589306, 1, 1, 1, 1, 1,
-0.3665146, -0.546302, -1.733585, 1, 1, 1, 1, 1,
-0.3645431, 0.1258088, -2.619459, 1, 1, 1, 1, 1,
-0.3641993, -1.489602, -1.599634, 1, 1, 1, 1, 1,
-0.3626556, 0.2540904, -1.307604, 0, 0, 1, 1, 1,
-0.3613546, 0.7323465, 1.130811, 1, 0, 0, 1, 1,
-0.3583776, 0.6117684, -1.839771, 1, 0, 0, 1, 1,
-0.3582734, -0.4545626, 0.0424659, 1, 0, 0, 1, 1,
-0.3580662, 0.9922575, -1.11606, 1, 0, 0, 1, 1,
-0.3577409, -0.5907011, -1.788268, 1, 0, 0, 1, 1,
-0.3561932, -2.532399, -1.752547, 0, 0, 0, 1, 1,
-0.3508739, 2.344689, -1.021971, 0, 0, 0, 1, 1,
-0.3504538, -0.643159, -2.926599, 0, 0, 0, 1, 1,
-0.3469515, 0.1524413, -1.938551, 0, 0, 0, 1, 1,
-0.3463686, 1.543765, -0.820297, 0, 0, 0, 1, 1,
-0.3458482, 0.3942552, 0.1530748, 0, 0, 0, 1, 1,
-0.3456154, -0.3791466, -3.304296, 0, 0, 0, 1, 1,
-0.3440218, -0.06853361, -2.270696, 1, 1, 1, 1, 1,
-0.3436428, -0.1379436, -2.306142, 1, 1, 1, 1, 1,
-0.3426169, 1.901244, 1.278253, 1, 1, 1, 1, 1,
-0.3374119, 1.136698, -0.7810072, 1, 1, 1, 1, 1,
-0.337298, -0.7128034, -3.808068, 1, 1, 1, 1, 1,
-0.3366437, 0.02732365, -2.103187, 1, 1, 1, 1, 1,
-0.3334107, -0.2483072, -1.533071, 1, 1, 1, 1, 1,
-0.331303, 2.975803, -1.919525, 1, 1, 1, 1, 1,
-0.3312118, -0.4877402, -2.476723, 1, 1, 1, 1, 1,
-0.3250997, 1.063179, -1.823858, 1, 1, 1, 1, 1,
-0.3248518, -0.2526305, -1.63154, 1, 1, 1, 1, 1,
-0.3241231, -1.019903, -2.643074, 1, 1, 1, 1, 1,
-0.32348, -1.3389, -4.449632, 1, 1, 1, 1, 1,
-0.3220127, 0.2254698, -2.458605, 1, 1, 1, 1, 1,
-0.3197433, -0.5211582, -1.392377, 1, 1, 1, 1, 1,
-0.319088, 0.02498814, -1.074421, 0, 0, 1, 1, 1,
-0.3165488, 0.5033658, -0.9250242, 1, 0, 0, 1, 1,
-0.313971, 0.6910903, -1.501958, 1, 0, 0, 1, 1,
-0.3136468, 0.2601488, -0.2071865, 1, 0, 0, 1, 1,
-0.3131614, -0.408728, -2.572553, 1, 0, 0, 1, 1,
-0.3113784, -1.375493, -2.701866, 1, 0, 0, 1, 1,
-0.308455, 1.098897, -0.4145469, 0, 0, 0, 1, 1,
-0.3040917, 1.161827, 1.269392, 0, 0, 0, 1, 1,
-0.2910335, -0.02741999, -1.928343, 0, 0, 0, 1, 1,
-0.2905237, 0.3223885, 0.13456, 0, 0, 0, 1, 1,
-0.2890834, -0.6962546, -2.17615, 0, 0, 0, 1, 1,
-0.2882934, 0.3953987, -1.288414, 0, 0, 0, 1, 1,
-0.2805252, -0.1990562, -2.317236, 0, 0, 0, 1, 1,
-0.2777742, -0.06788428, -2.24381, 1, 1, 1, 1, 1,
-0.2769949, 0.7353411, -1.394664, 1, 1, 1, 1, 1,
-0.2766739, -1.22029, -4.297169, 1, 1, 1, 1, 1,
-0.2757223, 0.1199769, -0.724741, 1, 1, 1, 1, 1,
-0.2751231, 0.7674913, -0.9191607, 1, 1, 1, 1, 1,
-0.2748388, 2.06031, 0.5401961, 1, 1, 1, 1, 1,
-0.2727627, -2.304826, -3.187782, 1, 1, 1, 1, 1,
-0.2697575, 0.549334, 0.09224635, 1, 1, 1, 1, 1,
-0.2687487, -0.9266603, -3.910072, 1, 1, 1, 1, 1,
-0.2662492, 0.370359, -1.454561, 1, 1, 1, 1, 1,
-0.2655853, 0.2301722, -0.296531, 1, 1, 1, 1, 1,
-0.2652034, -0.4598145, -2.260729, 1, 1, 1, 1, 1,
-0.2631019, -0.7391216, -1.830224, 1, 1, 1, 1, 1,
-0.2589902, -0.2936528, -2.026856, 1, 1, 1, 1, 1,
-0.2572152, 0.06972404, -2.881741, 1, 1, 1, 1, 1,
-0.2561747, -1.125802, -3.426268, 0, 0, 1, 1, 1,
-0.2561615, -0.4319262, -4.6809, 1, 0, 0, 1, 1,
-0.2546744, 1.186751, -0.7352867, 1, 0, 0, 1, 1,
-0.2537383, -1.948181, -3.524947, 1, 0, 0, 1, 1,
-0.2507372, 0.7706661, -1.160391, 1, 0, 0, 1, 1,
-0.2497424, 1.96786, -1.103812, 1, 0, 0, 1, 1,
-0.2457377, 0.9405214, 0.2417425, 0, 0, 0, 1, 1,
-0.2453423, 0.3200364, -0.3314426, 0, 0, 0, 1, 1,
-0.2448734, -1.097512, -0.8769621, 0, 0, 0, 1, 1,
-0.2444166, 0.8098514, -0.7552135, 0, 0, 0, 1, 1,
-0.2392909, 0.1169988, -1.983597, 0, 0, 0, 1, 1,
-0.2391769, -0.7420354, -2.276948, 0, 0, 0, 1, 1,
-0.2389382, -2.974023, -4.49387, 0, 0, 0, 1, 1,
-0.2324753, 0.3214446, -0.245126, 1, 1, 1, 1, 1,
-0.2312623, -1.33042, -2.961896, 1, 1, 1, 1, 1,
-0.231217, 0.5596572, -1.462271, 1, 1, 1, 1, 1,
-0.231142, 1.071818, -0.9367834, 1, 1, 1, 1, 1,
-0.2309348, -0.1577027, -1.676807, 1, 1, 1, 1, 1,
-0.2273307, -1.533794, -2.702023, 1, 1, 1, 1, 1,
-0.2267103, 1.520329, -1.779862, 1, 1, 1, 1, 1,
-0.2262863, 0.6632121, -0.4999641, 1, 1, 1, 1, 1,
-0.225587, -0.7575525, -3.518934, 1, 1, 1, 1, 1,
-0.2238273, 0.9904854, -0.08243826, 1, 1, 1, 1, 1,
-0.2207631, -0.5739412, -1.861268, 1, 1, 1, 1, 1,
-0.2185089, -0.32049, -3.711719, 1, 1, 1, 1, 1,
-0.2168369, 1.221154, -0.9801223, 1, 1, 1, 1, 1,
-0.2136141, -0.5438013, -4.212929, 1, 1, 1, 1, 1,
-0.2046019, 0.1069136, -2.290576, 1, 1, 1, 1, 1,
-0.2029, -0.7409628, -2.93985, 0, 0, 1, 1, 1,
-0.1975987, -0.827409, -1.224983, 1, 0, 0, 1, 1,
-0.1900611, -0.2791675, -3.788912, 1, 0, 0, 1, 1,
-0.1834106, -0.9158539, -3.641893, 1, 0, 0, 1, 1,
-0.1773791, 0.3839794, -0.4269639, 1, 0, 0, 1, 1,
-0.1744429, 1.088445, -0.3341657, 1, 0, 0, 1, 1,
-0.1741405, 1.290172, -0.4927991, 0, 0, 0, 1, 1,
-0.1731537, -1.118589, -3.583815, 0, 0, 0, 1, 1,
-0.1707069, 0.2278977, -0.325068, 0, 0, 0, 1, 1,
-0.1636052, -0.5378525, -1.177017, 0, 0, 0, 1, 1,
-0.1635364, 0.9522058, -1.814768, 0, 0, 0, 1, 1,
-0.1614087, -0.6970884, -3.393158, 0, 0, 0, 1, 1,
-0.1612587, 0.8992649, -1.811308, 0, 0, 0, 1, 1,
-0.154984, -0.9561141, -0.3475001, 1, 1, 1, 1, 1,
-0.1541387, -0.8169619, -4.170142, 1, 1, 1, 1, 1,
-0.14864, 1.572111, 1.894908, 1, 1, 1, 1, 1,
-0.1449264, -0.6353161, -1.810788, 1, 1, 1, 1, 1,
-0.1437437, -0.6356217, -3.908989, 1, 1, 1, 1, 1,
-0.1361752, 0.04814727, -0.5321541, 1, 1, 1, 1, 1,
-0.1347736, -1.189294, -2.823573, 1, 1, 1, 1, 1,
-0.1335332, 0.4621527, -1.247526, 1, 1, 1, 1, 1,
-0.1291739, 0.9697408, 0.2145682, 1, 1, 1, 1, 1,
-0.1268749, -0.02392079, -1.27371, 1, 1, 1, 1, 1,
-0.1250407, -0.8116208, -3.74402, 1, 1, 1, 1, 1,
-0.1242982, 0.2641781, -1.045762, 1, 1, 1, 1, 1,
-0.1240422, 0.5403215, -0.9096465, 1, 1, 1, 1, 1,
-0.1214131, -0.8926302, -3.337494, 1, 1, 1, 1, 1,
-0.1207284, 0.6561068, -0.1810758, 1, 1, 1, 1, 1,
-0.1200743, 0.130607, -0.5367686, 0, 0, 1, 1, 1,
-0.1131119, -1.094732, -3.961242, 1, 0, 0, 1, 1,
-0.109343, -2.014206, -2.143579, 1, 0, 0, 1, 1,
-0.1091554, 0.996971, -1.436257, 1, 0, 0, 1, 1,
-0.1057894, -1.455517, -4.630686, 1, 0, 0, 1, 1,
-0.1029937, 0.9753088, 0.7636699, 1, 0, 0, 1, 1,
-0.1020451, -0.5691808, -1.988503, 0, 0, 0, 1, 1,
-0.1007496, -0.05896708, -2.823982, 0, 0, 0, 1, 1,
-0.1001909, 1.35513, -0.3878386, 0, 0, 0, 1, 1,
-0.09882667, -1.060279, -3.4359, 0, 0, 0, 1, 1,
-0.09741218, 0.4039872, -0.9461987, 0, 0, 0, 1, 1,
-0.09513011, 0.2167311, 0.005495408, 0, 0, 0, 1, 1,
-0.09507484, 1.910174, -0.5814922, 0, 0, 0, 1, 1,
-0.09266779, 2.831245, -0.3036243, 1, 1, 1, 1, 1,
-0.09021457, -0.9278824, -3.135998, 1, 1, 1, 1, 1,
-0.08936387, -0.4380015, -2.061248, 1, 1, 1, 1, 1,
-0.0857629, 0.6941807, 0.9084648, 1, 1, 1, 1, 1,
-0.08246986, 0.6321588, -1.468675, 1, 1, 1, 1, 1,
-0.08198123, 0.2829088, 0.4976397, 1, 1, 1, 1, 1,
-0.08128756, -0.118324, -2.780157, 1, 1, 1, 1, 1,
-0.07932769, -1.345413, -1.893854, 1, 1, 1, 1, 1,
-0.07796318, -0.08503775, -2.410628, 1, 1, 1, 1, 1,
-0.07534249, -0.8941123, -2.019599, 1, 1, 1, 1, 1,
-0.07116306, 0.3876048, -1.574308, 1, 1, 1, 1, 1,
-0.06858175, -0.643604, -4.164671, 1, 1, 1, 1, 1,
-0.06559408, -1.818814, -4.559333, 1, 1, 1, 1, 1,
-0.06076641, 2.450693, 0.7144139, 1, 1, 1, 1, 1,
-0.05822606, 1.083662, 1.031547, 1, 1, 1, 1, 1,
-0.05235129, 0.4445435, 0.2445937, 0, 0, 1, 1, 1,
-0.05168817, -0.5727475, -4.039834, 1, 0, 0, 1, 1,
-0.05110299, -0.2351291, -2.699199, 1, 0, 0, 1, 1,
-0.05002902, 1.11278, 0.1994385, 1, 0, 0, 1, 1,
-0.04948334, -1.444767, -1.715528, 1, 0, 0, 1, 1,
-0.04924259, -0.749976, -3.988772, 1, 0, 0, 1, 1,
-0.04863207, -0.9144578, -3.152752, 0, 0, 0, 1, 1,
-0.04392134, 0.2647606, 0.5666129, 0, 0, 0, 1, 1,
-0.03994371, -0.009609067, -0.1030587, 0, 0, 0, 1, 1,
-0.03888105, -0.4989741, -2.50925, 0, 0, 0, 1, 1,
-0.03762809, 0.639846, 0.7737272, 0, 0, 0, 1, 1,
-0.03271636, -2.13701, -4.78194, 0, 0, 0, 1, 1,
-0.02529843, -0.1212788, -3.298342, 0, 0, 0, 1, 1,
-0.02523074, -0.5703503, -3.534457, 1, 1, 1, 1, 1,
-0.02376124, -1.526439, -2.966873, 1, 1, 1, 1, 1,
-0.02319778, -0.6613477, -1.136549, 1, 1, 1, 1, 1,
-0.02154806, -1.507433, -4.6092, 1, 1, 1, 1, 1,
-0.01700208, 0.08105744, -0.5415493, 1, 1, 1, 1, 1,
-0.01473985, -1.285292, -2.648248, 1, 1, 1, 1, 1,
-0.01393261, -0.120008, -3.83059, 1, 1, 1, 1, 1,
-0.01076845, -0.1136175, -2.57309, 1, 1, 1, 1, 1,
-0.007664307, 1.879, 1.844624, 1, 1, 1, 1, 1,
-0.006804439, 1.391329, -0.5096262, 1, 1, 1, 1, 1,
-0.001668099, -0.3555764, -5.297684, 1, 1, 1, 1, 1,
0.004532646, -0.9555771, 4.403961, 1, 1, 1, 1, 1,
0.00577134, 0.83802, -0.1254542, 1, 1, 1, 1, 1,
0.006589532, 1.016856, 0.1540432, 1, 1, 1, 1, 1,
0.0120249, 0.4364268, 0.196252, 1, 1, 1, 1, 1,
0.01438169, -1.325182, 2.114973, 0, 0, 1, 1, 1,
0.0170262, 1.684908, -0.1225019, 1, 0, 0, 1, 1,
0.01736871, -0.152758, 4.023795, 1, 0, 0, 1, 1,
0.01823665, -0.5535567, 2.560955, 1, 0, 0, 1, 1,
0.02518029, 0.1200097, 0.8469791, 1, 0, 0, 1, 1,
0.02685014, 0.3160095, -0.6088408, 1, 0, 0, 1, 1,
0.02912432, 1.252416, 0.6533211, 0, 0, 0, 1, 1,
0.02951441, -0.4876476, 4.475283, 0, 0, 0, 1, 1,
0.03133902, -0.4017695, 4.189442, 0, 0, 0, 1, 1,
0.03179334, -0.0854169, 2.662657, 0, 0, 0, 1, 1,
0.03211036, -0.6291466, 2.969174, 0, 0, 0, 1, 1,
0.03285778, -1.640985, 3.088902, 0, 0, 0, 1, 1,
0.03461752, -0.4409261, 3.203483, 0, 0, 0, 1, 1,
0.03723517, -0.3649932, 2.157453, 1, 1, 1, 1, 1,
0.03807298, -1.944725, 3.061242, 1, 1, 1, 1, 1,
0.04194409, -0.9087667, 4.968358, 1, 1, 1, 1, 1,
0.04195014, 0.736045, 0.1000424, 1, 1, 1, 1, 1,
0.04281616, 1.936468, 0.1880335, 1, 1, 1, 1, 1,
0.04508801, -0.7181411, 3.359487, 1, 1, 1, 1, 1,
0.04701176, -1.248343, 1.675175, 1, 1, 1, 1, 1,
0.0482854, 0.08280734, -0.4095313, 1, 1, 1, 1, 1,
0.04830797, -0.2926345, 2.989472, 1, 1, 1, 1, 1,
0.04986825, 1.870343, 1.491831, 1, 1, 1, 1, 1,
0.04999746, 1.742148, 1.111773, 1, 1, 1, 1, 1,
0.05006912, -0.8516338, 2.156554, 1, 1, 1, 1, 1,
0.05707717, -1.099841, 3.647318, 1, 1, 1, 1, 1,
0.05782019, -0.946597, 3.561302, 1, 1, 1, 1, 1,
0.05815415, -0.2963495, 2.874254, 1, 1, 1, 1, 1,
0.05939535, -1.260047, 3.713924, 0, 0, 1, 1, 1,
0.06016179, -1.356269, 3.527394, 1, 0, 0, 1, 1,
0.06289469, -0.2094557, 2.928862, 1, 0, 0, 1, 1,
0.06470734, 1.018515, 0.793236, 1, 0, 0, 1, 1,
0.06763397, 0.2265373, 0.607325, 1, 0, 0, 1, 1,
0.06775843, -0.5398303, 4.697156, 1, 0, 0, 1, 1,
0.06781416, -0.7097743, 4.525925, 0, 0, 0, 1, 1,
0.06840371, -0.2518288, 2.958716, 0, 0, 0, 1, 1,
0.06940705, 0.5057235, 0.6555241, 0, 0, 0, 1, 1,
0.07094067, -0.5138862, 3.077321, 0, 0, 0, 1, 1,
0.07112511, 1.890988, -0.6113501, 0, 0, 0, 1, 1,
0.07699367, -1.281684, 3.819175, 0, 0, 0, 1, 1,
0.07751335, -2.506438, 4.352572, 0, 0, 0, 1, 1,
0.0777417, 2.155674, 0.2313755, 1, 1, 1, 1, 1,
0.08113559, 1.223298, 1.589609, 1, 1, 1, 1, 1,
0.08215164, 2.417082, 0.7295784, 1, 1, 1, 1, 1,
0.08462504, -1.147902, 3.808037, 1, 1, 1, 1, 1,
0.0853003, -0.1149126, 1.925708, 1, 1, 1, 1, 1,
0.08620729, -0.9836668, 3.809995, 1, 1, 1, 1, 1,
0.08620889, 0.3173159, 0.07372293, 1, 1, 1, 1, 1,
0.08657602, 0.2828957, -1.181541, 1, 1, 1, 1, 1,
0.08669624, 0.3198932, -1.332271, 1, 1, 1, 1, 1,
0.08743307, 0.8235012, -0.4727258, 1, 1, 1, 1, 1,
0.09128205, -1.364159, 2.801648, 1, 1, 1, 1, 1,
0.1032603, 0.8909986, -1.785001, 1, 1, 1, 1, 1,
0.1080368, 0.3267344, 0.8407271, 1, 1, 1, 1, 1,
0.1122386, -0.4634818, 2.800056, 1, 1, 1, 1, 1,
0.1178186, -0.3056569, 2.285782, 1, 1, 1, 1, 1,
0.1178974, -0.6322814, 4.339228, 0, 0, 1, 1, 1,
0.1245983, 1.322876, -1.203926, 1, 0, 0, 1, 1,
0.1324443, -0.6051171, 4.027065, 1, 0, 0, 1, 1,
0.1387443, 1.024241, 1.346309, 1, 0, 0, 1, 1,
0.1417674, -0.4391762, 1.969774, 1, 0, 0, 1, 1,
0.1508021, -0.007767067, 1.31335, 1, 0, 0, 1, 1,
0.1509084, -0.6073696, 3.055804, 0, 0, 0, 1, 1,
0.1521554, 1.071227, 1.470085, 0, 0, 0, 1, 1,
0.1522296, -0.3997313, 4.447393, 0, 0, 0, 1, 1,
0.1542834, -0.321145, 2.92647, 0, 0, 0, 1, 1,
0.1551078, -0.9042432, 4.072945, 0, 0, 0, 1, 1,
0.1561746, 0.2506699, -0.4384327, 0, 0, 0, 1, 1,
0.1607033, -1.15181, 2.245202, 0, 0, 0, 1, 1,
0.1675152, 1.300944, 1.18148, 1, 1, 1, 1, 1,
0.1708464, -1.042466, 3.349881, 1, 1, 1, 1, 1,
0.1748717, 1.558168, -1.376894, 1, 1, 1, 1, 1,
0.1755805, -0.1380711, 3.596666, 1, 1, 1, 1, 1,
0.1771039, -1.949666, 2.893532, 1, 1, 1, 1, 1,
0.1848065, 0.04626305, 3.766055, 1, 1, 1, 1, 1,
0.1854982, -0.5187751, 4.640184, 1, 1, 1, 1, 1,
0.1869272, -1.581285, 2.946183, 1, 1, 1, 1, 1,
0.1878217, -0.5646771, 3.07979, 1, 1, 1, 1, 1,
0.1897791, -0.7320747, 2.189188, 1, 1, 1, 1, 1,
0.197153, 0.5553232, -0.1291046, 1, 1, 1, 1, 1,
0.1999807, 0.121475, -0.5501188, 1, 1, 1, 1, 1,
0.2032694, 0.4050055, 0.5617014, 1, 1, 1, 1, 1,
0.2039823, -0.1436082, 3.711544, 1, 1, 1, 1, 1,
0.2078365, -0.3603114, 4.236315, 1, 1, 1, 1, 1,
0.2135281, 0.8441306, 0.6375065, 0, 0, 1, 1, 1,
0.2142014, -0.894882, 4.04538, 1, 0, 0, 1, 1,
0.2193616, 1.894766, -1.166328, 1, 0, 0, 1, 1,
0.2298505, 0.8282681, 1.100237, 1, 0, 0, 1, 1,
0.2299888, 1.498742, -0.7507306, 1, 0, 0, 1, 1,
0.2300827, 0.7159082, 0.3577273, 1, 0, 0, 1, 1,
0.2315482, -0.3280331, 2.814609, 0, 0, 0, 1, 1,
0.2320834, 1.066193, 1.478407, 0, 0, 0, 1, 1,
0.2331253, -0.3777534, 3.801847, 0, 0, 0, 1, 1,
0.2339341, 0.459501, 0.2027882, 0, 0, 0, 1, 1,
0.23559, 1.415011, 0.4210653, 0, 0, 0, 1, 1,
0.247337, -0.5753336, 1.823134, 0, 0, 0, 1, 1,
0.2489011, -0.7642131, 1.978943, 0, 0, 0, 1, 1,
0.2505085, -2.463225, 2.517657, 1, 1, 1, 1, 1,
0.2513056, 0.7429245, 1.181976, 1, 1, 1, 1, 1,
0.2535723, -2.466057, 3.129656, 1, 1, 1, 1, 1,
0.258884, -0.8999839, 3.609724, 1, 1, 1, 1, 1,
0.2641563, 1.878777, -0.2269361, 1, 1, 1, 1, 1,
0.2682129, 0.7495897, 0.9439475, 1, 1, 1, 1, 1,
0.2693429, 0.8730899, -0.0257439, 1, 1, 1, 1, 1,
0.2724599, -1.256222, 3.892883, 1, 1, 1, 1, 1,
0.2735534, 0.5062174, 0.9066512, 1, 1, 1, 1, 1,
0.2758817, 1.006301, 0.3968541, 1, 1, 1, 1, 1,
0.2833976, 0.08025482, 1.113902, 1, 1, 1, 1, 1,
0.2836526, 0.2689995, 0.9087495, 1, 1, 1, 1, 1,
0.2875011, 0.8545427, 0.3819345, 1, 1, 1, 1, 1,
0.2902337, -0.347681, 2.049628, 1, 1, 1, 1, 1,
0.2939664, -0.6101441, 3.917075, 1, 1, 1, 1, 1,
0.3051152, 0.4215215, -0.1722842, 0, 0, 1, 1, 1,
0.3096029, 0.1549231, -0.05851869, 1, 0, 0, 1, 1,
0.3112723, -0.5692996, 3.943885, 1, 0, 0, 1, 1,
0.3166363, 1.022491, -0.2337449, 1, 0, 0, 1, 1,
0.3206764, 0.4782319, 2.646605, 1, 0, 0, 1, 1,
0.3214169, 0.3523572, 2.624048, 1, 0, 0, 1, 1,
0.3257476, 0.8668312, 0.6617095, 0, 0, 0, 1, 1,
0.329708, 0.4616727, 1.060282, 0, 0, 0, 1, 1,
0.3431505, 0.191697, 1.100061, 0, 0, 0, 1, 1,
0.3461305, 1.363224, 0.200369, 0, 0, 0, 1, 1,
0.3480594, -2.047289, 2.19445, 0, 0, 0, 1, 1,
0.3522103, 0.2034949, 0.9172113, 0, 0, 0, 1, 1,
0.3552412, -1.51409, 1.62941, 0, 0, 0, 1, 1,
0.3611015, 1.42619, 1.523182, 1, 1, 1, 1, 1,
0.3620526, 0.0909977, 1.246603, 1, 1, 1, 1, 1,
0.3631487, -0.3413484, 1.741664, 1, 1, 1, 1, 1,
0.3646441, -1.129438, 3.387121, 1, 1, 1, 1, 1,
0.3665622, -1.043864, 2.432451, 1, 1, 1, 1, 1,
0.37473, -1.074233, 3.527624, 1, 1, 1, 1, 1,
0.3772551, -0.7100187, 2.814253, 1, 1, 1, 1, 1,
0.3823088, 1.284048, 1.456699, 1, 1, 1, 1, 1,
0.3846636, 1.122214, -1.068521, 1, 1, 1, 1, 1,
0.386502, -0.2662974, 3.338408, 1, 1, 1, 1, 1,
0.3875043, -0.5200241, 0.4434172, 1, 1, 1, 1, 1,
0.3954715, 1.058603, -0.04381493, 1, 1, 1, 1, 1,
0.3960166, -0.7522646, 3.419805, 1, 1, 1, 1, 1,
0.3975675, 1.671873, 0.2597292, 1, 1, 1, 1, 1,
0.3988474, 0.4614285, -0.6706171, 1, 1, 1, 1, 1,
0.4083716, -0.3545477, 3.504537, 0, 0, 1, 1, 1,
0.4108548, -1.826962, 1.077979, 1, 0, 0, 1, 1,
0.4119888, 0.976917, -0.6657601, 1, 0, 0, 1, 1,
0.4135574, -1.552477, 4.138775, 1, 0, 0, 1, 1,
0.4141144, 0.4169374, 0.3959849, 1, 0, 0, 1, 1,
0.4186933, 1.652373, 1.662115, 1, 0, 0, 1, 1,
0.4192708, 0.04636284, 1.380303, 0, 0, 0, 1, 1,
0.4233726, 0.1438266, -0.4658893, 0, 0, 0, 1, 1,
0.4248937, -1.81747, 2.061692, 0, 0, 0, 1, 1,
0.4276562, -0.6932969, 2.388335, 0, 0, 0, 1, 1,
0.4278725, -0.8382213, 2.413026, 0, 0, 0, 1, 1,
0.428409, 0.4593733, 1.160508, 0, 0, 0, 1, 1,
0.4287298, 0.9090433, 1.223927, 0, 0, 0, 1, 1,
0.4334461, -2.394509, 2.889961, 1, 1, 1, 1, 1,
0.4367424, -0.8236706, 3.215227, 1, 1, 1, 1, 1,
0.4393388, 0.480038, -0.2939213, 1, 1, 1, 1, 1,
0.440556, -1.298029, 3.778581, 1, 1, 1, 1, 1,
0.4460252, 0.2559044, 1.677435, 1, 1, 1, 1, 1,
0.447098, -1.66039, 2.965313, 1, 1, 1, 1, 1,
0.448037, 0.7777053, -0.4916697, 1, 1, 1, 1, 1,
0.4482417, -0.01673342, 0.6376703, 1, 1, 1, 1, 1,
0.4545993, 0.884784, -1.037365, 1, 1, 1, 1, 1,
0.4568697, -0.3500026, 1.618732, 1, 1, 1, 1, 1,
0.4578278, -0.3663062, 2.043254, 1, 1, 1, 1, 1,
0.4606611, -0.8690832, 2.441951, 1, 1, 1, 1, 1,
0.4624538, 0.9110814, 0.4792522, 1, 1, 1, 1, 1,
0.4686466, -0.6054393, 1.498122, 1, 1, 1, 1, 1,
0.4731593, 0.7448081, 1.331848, 1, 1, 1, 1, 1,
0.4761024, 0.03834934, 2.346467, 0, 0, 1, 1, 1,
0.4769379, 0.6464611, -0.5650469, 1, 0, 0, 1, 1,
0.4790115, 0.6441326, 1.778113, 1, 0, 0, 1, 1,
0.4833552, -0.3883669, 2.280893, 1, 0, 0, 1, 1,
0.485048, -0.1647645, 2.716558, 1, 0, 0, 1, 1,
0.4850513, 1.786616, -1.312036, 1, 0, 0, 1, 1,
0.4881495, -1.047443, 4.032036, 0, 0, 0, 1, 1,
0.4896829, 0.8671212, -0.0847284, 0, 0, 0, 1, 1,
0.4909377, -0.8879236, 2.408499, 0, 0, 0, 1, 1,
0.4934739, -0.88303, 2.764328, 0, 0, 0, 1, 1,
0.4939552, 0.9651742, 0.8910965, 0, 0, 0, 1, 1,
0.496727, -0.4931708, 2.431729, 0, 0, 0, 1, 1,
0.5065287, 0.3985935, 0.2910359, 0, 0, 0, 1, 1,
0.5115829, -1.696316, 4.246871, 1, 1, 1, 1, 1,
0.5122402, -0.6496936, 1.604411, 1, 1, 1, 1, 1,
0.5143898, 1.115561, -0.7517055, 1, 1, 1, 1, 1,
0.5160254, -0.2102255, 1.997122, 1, 1, 1, 1, 1,
0.5169564, -0.1537464, 1.794558, 1, 1, 1, 1, 1,
0.5172734, -0.9847271, 4.502763, 1, 1, 1, 1, 1,
0.5218985, -2.546865, 2.197889, 1, 1, 1, 1, 1,
0.5261294, -0.9498519, 2.138226, 1, 1, 1, 1, 1,
0.5280761, 1.180463, 2.133992, 1, 1, 1, 1, 1,
0.5294262, -1.313976, 2.24588, 1, 1, 1, 1, 1,
0.5316398, -0.07457975, 1.455685, 1, 1, 1, 1, 1,
0.5320091, 0.9198493, 0.7779985, 1, 1, 1, 1, 1,
0.5379217, 0.6111883, 0.4177029, 1, 1, 1, 1, 1,
0.5384219, 0.7139588, 1.064018, 1, 1, 1, 1, 1,
0.5413637, 0.3378239, 0.8272081, 1, 1, 1, 1, 1,
0.5416227, -1.036784, 3.212603, 0, 0, 1, 1, 1,
0.5520456, 1.749727, 0.1277941, 1, 0, 0, 1, 1,
0.5632104, -0.9289641, 4.008481, 1, 0, 0, 1, 1,
0.5655807, -0.6137228, 1.830209, 1, 0, 0, 1, 1,
0.5708966, 1.12965, 0.1767472, 1, 0, 0, 1, 1,
0.5711992, 1.650356, -0.9674875, 1, 0, 0, 1, 1,
0.5748571, 0.9739563, 1.500811, 0, 0, 0, 1, 1,
0.5757465, 2.32886, 0.5363014, 0, 0, 0, 1, 1,
0.5766175, 0.1392338, 0.7885955, 0, 0, 0, 1, 1,
0.5774726, -0.4168365, 4.143796, 0, 0, 0, 1, 1,
0.5837524, 0.7980344, 1.444847, 0, 0, 0, 1, 1,
0.5853754, 1.869702, 1.091857, 0, 0, 0, 1, 1,
0.5879198, 1.642237, 1.213286, 0, 0, 0, 1, 1,
0.589709, -0.3096628, 0.8112022, 1, 1, 1, 1, 1,
0.5910533, -0.7165698, 1.549533, 1, 1, 1, 1, 1,
0.5911292, -0.7396198, 2.9541, 1, 1, 1, 1, 1,
0.5985829, -0.1901376, 2.743421, 1, 1, 1, 1, 1,
0.5990676, -0.07060649, 2.186612, 1, 1, 1, 1, 1,
0.6000894, 1.418321, -0.1000723, 1, 1, 1, 1, 1,
0.6073868, -0.6169017, 1.020773, 1, 1, 1, 1, 1,
0.6127173, 0.6503257, 2.843679, 1, 1, 1, 1, 1,
0.614553, 0.1674755, 2.529901, 1, 1, 1, 1, 1,
0.6168855, 2.328413, -0.7790247, 1, 1, 1, 1, 1,
0.6184547, -0.4349785, 0.3183019, 1, 1, 1, 1, 1,
0.6205674, 1.06384, 0.7860451, 1, 1, 1, 1, 1,
0.6221024, 0.0345888, 0.9352303, 1, 1, 1, 1, 1,
0.6249807, 0.9542445, 1.30378, 1, 1, 1, 1, 1,
0.6282, -0.859006, 3.529133, 1, 1, 1, 1, 1,
0.6300959, -0.05906394, 1.432559, 0, 0, 1, 1, 1,
0.6317372, 1.153141, -1.562123, 1, 0, 0, 1, 1,
0.6323192, 0.1653927, 1.657794, 1, 0, 0, 1, 1,
0.6330423, -1.335379, 2.730851, 1, 0, 0, 1, 1,
0.6363586, -0.9622247, 2.179242, 1, 0, 0, 1, 1,
0.6371109, 0.4625967, 1.011327, 1, 0, 0, 1, 1,
0.641028, -0.2379716, 1.830079, 0, 0, 0, 1, 1,
0.6439573, 1.287363, -0.2971157, 0, 0, 0, 1, 1,
0.6513351, -0.1025525, 0.8302188, 0, 0, 0, 1, 1,
0.6637678, -0.9078627, 4.512594, 0, 0, 0, 1, 1,
0.6644439, -0.3679406, 2.825613, 0, 0, 0, 1, 1,
0.669471, 1.524176, -0.891499, 0, 0, 0, 1, 1,
0.6711016, 0.2641241, 2.161018, 0, 0, 0, 1, 1,
0.6890002, -0.1420154, 1.196147, 1, 1, 1, 1, 1,
0.6959325, 0.06488901, 2.386996, 1, 1, 1, 1, 1,
0.699344, -0.6243506, 3.384403, 1, 1, 1, 1, 1,
0.6996435, 0.01702377, 1.82878, 1, 1, 1, 1, 1,
0.7095931, 0.3287991, 0.8570749, 1, 1, 1, 1, 1,
0.7106884, 1.192118, 0.362917, 1, 1, 1, 1, 1,
0.7159996, 0.615258, 0.03931598, 1, 1, 1, 1, 1,
0.718857, 0.3569165, 0.1322874, 1, 1, 1, 1, 1,
0.7281091, -0.820999, 0.8405062, 1, 1, 1, 1, 1,
0.7298164, -0.5808115, 2.849052, 1, 1, 1, 1, 1,
0.7332858, 2.848369, 0.1631076, 1, 1, 1, 1, 1,
0.7335801, 0.5239568, 0.08603804, 1, 1, 1, 1, 1,
0.7358945, -0.1720686, 0.5565306, 1, 1, 1, 1, 1,
0.7372726, 1.45043, -1.382043, 1, 1, 1, 1, 1,
0.7375203, -0.6826383, 4.110823, 1, 1, 1, 1, 1,
0.7409005, 0.09308876, 1.820637, 0, 0, 1, 1, 1,
0.7438704, 0.5145166, 1.278912, 1, 0, 0, 1, 1,
0.749291, 0.236181, 1.404406, 1, 0, 0, 1, 1,
0.7517866, 0.7177826, 0.9449318, 1, 0, 0, 1, 1,
0.7525261, -0.2943744, 1.768975, 1, 0, 0, 1, 1,
0.7617747, 0.3351623, -0.5205637, 1, 0, 0, 1, 1,
0.7697117, 1.095518, -0.7343624, 0, 0, 0, 1, 1,
0.7703115, -1.863294, 2.729063, 0, 0, 0, 1, 1,
0.7713748, 0.9116374, 0.7859777, 0, 0, 0, 1, 1,
0.7732726, -0.09381437, 2.300498, 0, 0, 0, 1, 1,
0.7738813, -0.7844266, 4.084633, 0, 0, 0, 1, 1,
0.7795216, 0.151218, 2.736276, 0, 0, 0, 1, 1,
0.7818447, -0.8920875, 2.168605, 0, 0, 0, 1, 1,
0.7844756, 0.1768609, 2.746516, 1, 1, 1, 1, 1,
0.7920014, 0.8239975, -1.282315, 1, 1, 1, 1, 1,
0.8047633, -0.9884598, 1.180924, 1, 1, 1, 1, 1,
0.8050799, 0.9773153, 0.8227017, 1, 1, 1, 1, 1,
0.8097862, -1.83029, 3.484417, 1, 1, 1, 1, 1,
0.8101973, -0.445236, 1.296779, 1, 1, 1, 1, 1,
0.8163748, 0.3343702, 0.6060497, 1, 1, 1, 1, 1,
0.8208692, 0.1109851, 1.687413, 1, 1, 1, 1, 1,
0.8290624, 0.1443334, 1.670032, 1, 1, 1, 1, 1,
0.8303986, -0.7803531, 3.530256, 1, 1, 1, 1, 1,
0.8357606, 0.3023255, 1.109192, 1, 1, 1, 1, 1,
0.8383114, 2.376878, -0.5059035, 1, 1, 1, 1, 1,
0.8425755, 0.2528664, 1.785758, 1, 1, 1, 1, 1,
0.8432472, -0.5860454, 1.312069, 1, 1, 1, 1, 1,
0.8446276, -0.5075585, 1.505602, 1, 1, 1, 1, 1,
0.8519682, 2.241366, 0.105832, 0, 0, 1, 1, 1,
0.8612517, -1.495824, 4.061898, 1, 0, 0, 1, 1,
0.8637112, 0.6494501, 1.226883, 1, 0, 0, 1, 1,
0.865534, -0.4018152, 2.152804, 1, 0, 0, 1, 1,
0.8677269, 1.818702, -0.6840728, 1, 0, 0, 1, 1,
0.868724, -0.5201448, 1.18947, 1, 0, 0, 1, 1,
0.8711026, -1.846561, 2.133571, 0, 0, 0, 1, 1,
0.8846417, -1.230241, 1.411568, 0, 0, 0, 1, 1,
0.8849175, -0.5309143, 1.608048, 0, 0, 0, 1, 1,
0.8861187, 1.890037, 1.120517, 0, 0, 0, 1, 1,
0.8900086, -1.21675, 4.148098, 0, 0, 0, 1, 1,
0.8912115, 1.973131, 1.405392, 0, 0, 0, 1, 1,
0.8919815, -1.261612, 2.17351, 0, 0, 0, 1, 1,
0.9022769, 0.07557542, -0.02390629, 1, 1, 1, 1, 1,
0.9079885, -0.2031738, 1.831463, 1, 1, 1, 1, 1,
0.9080737, 1.52399, 2.002494, 1, 1, 1, 1, 1,
0.9175259, 0.3341435, 1.120482, 1, 1, 1, 1, 1,
0.9195153, 1.203882, 1.77861, 1, 1, 1, 1, 1,
0.9219043, -3.346558, 3.560657, 1, 1, 1, 1, 1,
0.9233621, 0.1705826, 1.775496, 1, 1, 1, 1, 1,
0.9317653, -0.3661325, 2.576972, 1, 1, 1, 1, 1,
0.9369357, -0.4235551, 1.453202, 1, 1, 1, 1, 1,
0.9396495, -1.297602, 3.839839, 1, 1, 1, 1, 1,
0.9402878, 0.6569467, 1.818196, 1, 1, 1, 1, 1,
0.9485744, -0.002723107, 0.492421, 1, 1, 1, 1, 1,
0.9508933, 0.7354115, 1.273297, 1, 1, 1, 1, 1,
0.9527754, -0.2649169, 0.5799737, 1, 1, 1, 1, 1,
0.9549793, 2.287523, 3.161891, 1, 1, 1, 1, 1,
0.957682, 0.7295724, 1.070095, 0, 0, 1, 1, 1,
0.9625532, 0.3281213, 2.234233, 1, 0, 0, 1, 1,
0.9635146, -1.646963, 3.156951, 1, 0, 0, 1, 1,
0.9655185, 0.2974518, -0.04500722, 1, 0, 0, 1, 1,
0.9655725, -0.02600463, 0.8696001, 1, 0, 0, 1, 1,
0.9665711, 1.145804, 0.2094721, 1, 0, 0, 1, 1,
0.9770623, 0.02385206, 1.596162, 0, 0, 0, 1, 1,
0.9850378, -0.5362523, -0.2110161, 0, 0, 0, 1, 1,
0.9924746, 3.613117, 0.9048153, 0, 0, 0, 1, 1,
0.9950529, 0.1706807, 0.6095191, 0, 0, 0, 1, 1,
0.9986433, -1.529039, 2.886644, 0, 0, 0, 1, 1,
1.002652, 1.216319, 0.4252446, 0, 0, 0, 1, 1,
1.003527, 0.8628783, 0.3842377, 0, 0, 0, 1, 1,
1.006932, -1.282305, 3.111894, 1, 1, 1, 1, 1,
1.006953, -0.3817858, 1.748728, 1, 1, 1, 1, 1,
1.009847, -0.1657526, 1.850964, 1, 1, 1, 1, 1,
1.011928, -0.02903806, 1.801906, 1, 1, 1, 1, 1,
1.013123, 1.144483, -0.3834531, 1, 1, 1, 1, 1,
1.013701, 0.6833872, 0.6204894, 1, 1, 1, 1, 1,
1.015491, 0.5296177, -1.229384, 1, 1, 1, 1, 1,
1.022614, 0.03103885, -0.4887055, 1, 1, 1, 1, 1,
1.025363, 1.70687, -1.218188, 1, 1, 1, 1, 1,
1.029335, -2.041476, 1.627092, 1, 1, 1, 1, 1,
1.031495, -0.7409934, 2.807904, 1, 1, 1, 1, 1,
1.038911, -0.1998318, 3.093087, 1, 1, 1, 1, 1,
1.039616, 0.218299, 1.783015, 1, 1, 1, 1, 1,
1.046321, 0.08979979, 1.756997, 1, 1, 1, 1, 1,
1.051145, -0.5459225, 1.769062, 1, 1, 1, 1, 1,
1.059674, 0.5008907, 1.748852, 0, 0, 1, 1, 1,
1.0624, 0.9933954, -0.3038996, 1, 0, 0, 1, 1,
1.066425, 0.2064941, 3.521855, 1, 0, 0, 1, 1,
1.069608, -0.759045, 1.512352, 1, 0, 0, 1, 1,
1.075586, -0.2031714, 0.6965735, 1, 0, 0, 1, 1,
1.080041, 0.7501206, 0.175825, 1, 0, 0, 1, 1,
1.08115, -0.1336156, 0.2233784, 0, 0, 0, 1, 1,
1.082936, 0.7815849, 0.1627042, 0, 0, 0, 1, 1,
1.086475, 1.149448, 1.498075, 0, 0, 0, 1, 1,
1.099082, 0.9231837, 0.8238604, 0, 0, 0, 1, 1,
1.104912, -0.5144726, 1.628774, 0, 0, 0, 1, 1,
1.109904, -0.0597456, 1.123877, 0, 0, 0, 1, 1,
1.115344, -0.6110299, 2.515515, 0, 0, 0, 1, 1,
1.117022, 0.09973226, 2.002505, 1, 1, 1, 1, 1,
1.120101, 0.1589505, -0.03848726, 1, 1, 1, 1, 1,
1.142597, 0.1010303, 0.8046685, 1, 1, 1, 1, 1,
1.14941, -0.5630372, 3.710692, 1, 1, 1, 1, 1,
1.152434, -0.3080196, 2.857967, 1, 1, 1, 1, 1,
1.154049, 0.5767868, 0.4694765, 1, 1, 1, 1, 1,
1.175619, 1.963931, -1.05102, 1, 1, 1, 1, 1,
1.176565, 0.007331571, 2.029885, 1, 1, 1, 1, 1,
1.181551, -0.3081815, 0.09754199, 1, 1, 1, 1, 1,
1.193348, -0.9469087, 4.214841, 1, 1, 1, 1, 1,
1.196843, 1.613203, -0.266291, 1, 1, 1, 1, 1,
1.199377, 0.6908841, 1.55568, 1, 1, 1, 1, 1,
1.201645, -1.022518, 4.092067, 1, 1, 1, 1, 1,
1.20365, 0.2861523, -0.06647329, 1, 1, 1, 1, 1,
1.207403, -1.591332, 2.007579, 1, 1, 1, 1, 1,
1.209231, 1.344764, -0.8533362, 0, 0, 1, 1, 1,
1.211901, -0.3009657, 1.066682, 1, 0, 0, 1, 1,
1.214808, 0.8724864, 0.6512076, 1, 0, 0, 1, 1,
1.218606, 0.6070876, 1.03825, 1, 0, 0, 1, 1,
1.22047, 0.9769472, -0.1074263, 1, 0, 0, 1, 1,
1.227222, -1.174821, 0.9644604, 1, 0, 0, 1, 1,
1.229074, 0.20235, 1.226813, 0, 0, 0, 1, 1,
1.231146, 0.003556418, 2.581112, 0, 0, 0, 1, 1,
1.242606, -0.5520577, 0.884183, 0, 0, 0, 1, 1,
1.243577, -0.4185079, 2.083322, 0, 0, 0, 1, 1,
1.254959, 0.4020498, 0.5987785, 0, 0, 0, 1, 1,
1.256656, 0.02279712, 1.711113, 0, 0, 0, 1, 1,
1.260334, -2.16445, 2.988378, 0, 0, 0, 1, 1,
1.263342, -0.1925915, 2.116755, 1, 1, 1, 1, 1,
1.27055, 0.4505271, 0.1263968, 1, 1, 1, 1, 1,
1.273392, 0.5243043, 2.42631, 1, 1, 1, 1, 1,
1.278097, 0.6676659, 2.504345, 1, 1, 1, 1, 1,
1.286738, 0.9421188, 0.6733778, 1, 1, 1, 1, 1,
1.290242, 0.1589711, 1.205323, 1, 1, 1, 1, 1,
1.297725, 1.410601, 1.494671, 1, 1, 1, 1, 1,
1.297874, -0.3239609, 2.899661, 1, 1, 1, 1, 1,
1.298304, 0.2008844, 1.173148, 1, 1, 1, 1, 1,
1.313382, 0.1474039, 2.106337, 1, 1, 1, 1, 1,
1.314192, 0.630683, 1.423735, 1, 1, 1, 1, 1,
1.318225, 0.3760263, 2.426926, 1, 1, 1, 1, 1,
1.31922, -0.7457101, 3.595808, 1, 1, 1, 1, 1,
1.323856, 0.8639945, 3.143443, 1, 1, 1, 1, 1,
1.353719, -0.1790325, 1.250089, 1, 1, 1, 1, 1,
1.356984, 0.5438026, 0.1203625, 0, 0, 1, 1, 1,
1.361375, -2.65964, 0.4430122, 1, 0, 0, 1, 1,
1.3714, 0.08054766, 0.8819295, 1, 0, 0, 1, 1,
1.377887, -0.1363535, 1.696767, 1, 0, 0, 1, 1,
1.381985, 0.6990898, 0.9261592, 1, 0, 0, 1, 1,
1.391071, 0.2059567, 2.341739, 1, 0, 0, 1, 1,
1.397253, -0.3075079, 2.089656, 0, 0, 0, 1, 1,
1.398, -0.1613645, 1.611442, 0, 0, 0, 1, 1,
1.399455, -1.013267, 1.169294, 0, 0, 0, 1, 1,
1.402384, 0.2139461, 2.189072, 0, 0, 0, 1, 1,
1.4108, 0.822165, 0.1777045, 0, 0, 0, 1, 1,
1.417065, -0.8621695, 1.762677, 0, 0, 0, 1, 1,
1.419962, -1.537597, 2.577914, 0, 0, 0, 1, 1,
1.425016, 0.9021398, 1.481975, 1, 1, 1, 1, 1,
1.425283, 1.330658, -0.1975944, 1, 1, 1, 1, 1,
1.432143, 0.9083188, 1.719482, 1, 1, 1, 1, 1,
1.433612, -0.2667179, 3.193185, 1, 1, 1, 1, 1,
1.447692, 1.224906, 0.3209167, 1, 1, 1, 1, 1,
1.478703, 1.346306, 1.371222, 1, 1, 1, 1, 1,
1.479498, -1.58224, 2.299286, 1, 1, 1, 1, 1,
1.484015, 0.5330553, 2.377176, 1, 1, 1, 1, 1,
1.489763, 0.5932221, 1.589182, 1, 1, 1, 1, 1,
1.490088, 0.9945449, 3.371773, 1, 1, 1, 1, 1,
1.4953, -0.2923388, 1.198014, 1, 1, 1, 1, 1,
1.507708, 0.5590956, 0.8710571, 1, 1, 1, 1, 1,
1.527313, -0.2365918, 2.100889, 1, 1, 1, 1, 1,
1.537156, 0.6030958, 0.4364228, 1, 1, 1, 1, 1,
1.571029, 0.4237209, 2.929139, 1, 1, 1, 1, 1,
1.588575, -0.2671757, 0.9098793, 0, 0, 1, 1, 1,
1.610645, -1.132043, 2.633092, 1, 0, 0, 1, 1,
1.618021, 0.4445716, 3.002546, 1, 0, 0, 1, 1,
1.618281, -1.680752, 1.637132, 1, 0, 0, 1, 1,
1.620046, -0.8009512, 1.126479, 1, 0, 0, 1, 1,
1.634028, -1.069856, 3.842052, 1, 0, 0, 1, 1,
1.634974, -0.5346052, 1.989761, 0, 0, 0, 1, 1,
1.645455, -0.9740791, 1.959891, 0, 0, 0, 1, 1,
1.6592, 1.439235, 1.347286, 0, 0, 0, 1, 1,
1.661135, -0.6474755, 0.6111159, 0, 0, 0, 1, 1,
1.676999, -0.1151728, 3.085631, 0, 0, 0, 1, 1,
1.683933, -0.5272914, 2.700123, 0, 0, 0, 1, 1,
1.705405, 1.908514, -0.6546338, 0, 0, 0, 1, 1,
1.712424, 0.08717196, 3.969602, 1, 1, 1, 1, 1,
1.751256, 0.469941, 0.3836513, 1, 1, 1, 1, 1,
1.75232, -0.2833541, 0.8633451, 1, 1, 1, 1, 1,
1.756826, -0.4925708, 0.6385818, 1, 1, 1, 1, 1,
1.762147, -0.5037538, 1.94669, 1, 1, 1, 1, 1,
1.780018, 0.4068504, 2.644413, 1, 1, 1, 1, 1,
1.801104, -0.6076802, 2.468002, 1, 1, 1, 1, 1,
1.812908, 2.101198, -0.001554491, 1, 1, 1, 1, 1,
1.862224, 0.117098, 1.603616, 1, 1, 1, 1, 1,
1.867014, 0.07652512, 1.959566, 1, 1, 1, 1, 1,
1.86798, 0.3428074, 1.743692, 1, 1, 1, 1, 1,
1.911777, -0.2308092, 0.9725096, 1, 1, 1, 1, 1,
1.912675, 0.8554533, 0.2845088, 1, 1, 1, 1, 1,
1.91806, -0.2302972, 3.529642, 1, 1, 1, 1, 1,
1.927448, -0.08495605, 1.042286, 1, 1, 1, 1, 1,
1.930288, -0.3117879, 0.5434541, 0, 0, 1, 1, 1,
1.93084, 0.1386935, 3.010956, 1, 0, 0, 1, 1,
1.97763, -2.169387, 1.070912, 1, 0, 0, 1, 1,
2.020421, -0.8421133, 2.697433, 1, 0, 0, 1, 1,
2.039667, -0.4464251, 3.019943, 1, 0, 0, 1, 1,
2.058413, -1.673904, 2.664217, 1, 0, 0, 1, 1,
2.068696, -0.2809046, 2.260249, 0, 0, 0, 1, 1,
2.099306, -0.8319168, 1.206292, 0, 0, 0, 1, 1,
2.17661, -0.7539633, 3.035197, 0, 0, 0, 1, 1,
2.253718, -1.280057, 3.255841, 0, 0, 0, 1, 1,
2.271875, 1.793494, 1.843632, 0, 0, 0, 1, 1,
2.28592, -1.534597, 2.523245, 0, 0, 0, 1, 1,
2.343707, -0.4338917, 3.794416, 0, 0, 0, 1, 1,
2.428644, -0.4330942, 0.5830226, 1, 1, 1, 1, 1,
2.440798, -0.1837845, 0.932032, 1, 1, 1, 1, 1,
2.448812, -0.8189053, 0.6728928, 1, 1, 1, 1, 1,
2.501959, -0.9760495, 0.4012522, 1, 1, 1, 1, 1,
2.563835, 0.677629, 2.301195, 1, 1, 1, 1, 1,
2.584695, 0.4688428, 0.6330132, 1, 1, 1, 1, 1,
2.803429, -2.198201, 2.824114, 1, 1, 1, 1, 1
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
var radius = 9.373046;
var distance = 32.92242;
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
mvMatrix.translate( 0.05166602, -0.1332798, 0.1697123 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.92242);
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
