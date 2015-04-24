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
-2.951464, -0.3000757, -2.528214, 1, 0, 0, 1,
-2.861287, -0.3656216, -1.783018, 1, 0.007843138, 0, 1,
-2.791179, 0.8912831, -1.361962, 1, 0.01176471, 0, 1,
-2.742934, 0.005653721, -0.3820263, 1, 0.01960784, 0, 1,
-2.733478, 0.6830101, -1.978185, 1, 0.02352941, 0, 1,
-2.720811, 0.1402092, -1.371744, 1, 0.03137255, 0, 1,
-2.57148, 0.1540356, -1.966414, 1, 0.03529412, 0, 1,
-2.567268, 0.01886643, -1.207225, 1, 0.04313726, 0, 1,
-2.532472, -0.1932552, -0.9474731, 1, 0.04705882, 0, 1,
-2.446926, -0.1818063, -1.356525, 1, 0.05490196, 0, 1,
-2.392783, -0.8890556, -2.503956, 1, 0.05882353, 0, 1,
-2.391119, 1.714929, -0.2679217, 1, 0.06666667, 0, 1,
-2.311473, 0.3261397, -1.843896, 1, 0.07058824, 0, 1,
-2.278589, -0.4792088, -1.258756, 1, 0.07843138, 0, 1,
-2.274826, 0.003943808, -1.118886, 1, 0.08235294, 0, 1,
-2.191783, 0.2165019, 0.6387346, 1, 0.09019608, 0, 1,
-2.141805, -1.72005, -1.996117, 1, 0.09411765, 0, 1,
-2.136142, 0.3152809, -2.14083, 1, 0.1019608, 0, 1,
-2.13508, 1.244945, 0.5832713, 1, 0.1098039, 0, 1,
-2.133441, -0.5469965, -1.766346, 1, 0.1137255, 0, 1,
-2.113314, -0.698, -0.5522048, 1, 0.1215686, 0, 1,
-2.088672, 0.3488233, -2.398647, 1, 0.1254902, 0, 1,
-2.079669, -0.2950254, -0.5810363, 1, 0.1333333, 0, 1,
-2.021381, -0.4769066, -3.010119, 1, 0.1372549, 0, 1,
-1.961985, -0.05590162, -1.972027, 1, 0.145098, 0, 1,
-1.960428, -0.8099746, -0.9199373, 1, 0.1490196, 0, 1,
-1.908561, -0.5874901, -1.491605, 1, 0.1568628, 0, 1,
-1.897101, -1.565483, -2.863314, 1, 0.1607843, 0, 1,
-1.879373, 0.3697586, -2.66269, 1, 0.1686275, 0, 1,
-1.867566, 0.631772, -0.6665602, 1, 0.172549, 0, 1,
-1.857307, 1.452625, -1.311675, 1, 0.1803922, 0, 1,
-1.838205, -0.3696941, -1.690692, 1, 0.1843137, 0, 1,
-1.799974, 0.8793913, -1.354026, 1, 0.1921569, 0, 1,
-1.797256, 0.8967576, -1.808527, 1, 0.1960784, 0, 1,
-1.795672, -1.30194, -1.885273, 1, 0.2039216, 0, 1,
-1.789003, 1.124302, -2.016664, 1, 0.2117647, 0, 1,
-1.779849, 0.4289538, -1.181066, 1, 0.2156863, 0, 1,
-1.778029, -0.03850212, 0.02394717, 1, 0.2235294, 0, 1,
-1.721807, -0.2515815, -3.58637, 1, 0.227451, 0, 1,
-1.718438, -1.235429, -1.778715, 1, 0.2352941, 0, 1,
-1.706913, -0.6646802, -1.832681, 1, 0.2392157, 0, 1,
-1.706416, -0.5317066, -0.4610015, 1, 0.2470588, 0, 1,
-1.69745, -0.1692153, 0.5405653, 1, 0.2509804, 0, 1,
-1.690778, -1.598363, -3.565931, 1, 0.2588235, 0, 1,
-1.688236, 0.1717599, -3.151017, 1, 0.2627451, 0, 1,
-1.68173, 1.803695, -2.434541, 1, 0.2705882, 0, 1,
-1.664822, 1.167237, -0.3900788, 1, 0.2745098, 0, 1,
-1.664734, -0.5303034, -2.741211, 1, 0.282353, 0, 1,
-1.658094, -0.4404625, -2.297561, 1, 0.2862745, 0, 1,
-1.654762, 0.3091048, -2.450336, 1, 0.2941177, 0, 1,
-1.642539, -2.488065, -4.06479, 1, 0.3019608, 0, 1,
-1.637155, 0.3528875, -0.4412926, 1, 0.3058824, 0, 1,
-1.636011, 0.8190963, 0.1618678, 1, 0.3137255, 0, 1,
-1.633299, 0.08486547, -1.914566, 1, 0.3176471, 0, 1,
-1.629731, 0.1698438, -2.478655, 1, 0.3254902, 0, 1,
-1.621994, 0.6046464, -1.09749, 1, 0.3294118, 0, 1,
-1.613895, -1.216025, -1.974717, 1, 0.3372549, 0, 1,
-1.606035, 0.5004894, -1.655535, 1, 0.3411765, 0, 1,
-1.596424, -1.033096, -2.178178, 1, 0.3490196, 0, 1,
-1.577098, -0.8741376, -1.281697, 1, 0.3529412, 0, 1,
-1.567628, -0.8742577, -2.914135, 1, 0.3607843, 0, 1,
-1.560421, -0.2553608, -2.289868, 1, 0.3647059, 0, 1,
-1.555477, 1.209711, -2.228414, 1, 0.372549, 0, 1,
-1.549992, -1.066896, -2.595733, 1, 0.3764706, 0, 1,
-1.546234, -0.01120628, -1.804942, 1, 0.3843137, 0, 1,
-1.545137, -0.0548871, -2.225702, 1, 0.3882353, 0, 1,
-1.531917, 0.6134968, -0.9412322, 1, 0.3960784, 0, 1,
-1.527944, 0.6905118, -0.3380004, 1, 0.4039216, 0, 1,
-1.521618, -0.09806459, -0.3903224, 1, 0.4078431, 0, 1,
-1.507744, -0.5033955, -1.46716, 1, 0.4156863, 0, 1,
-1.500729, 0.08128449, 0.02615054, 1, 0.4196078, 0, 1,
-1.489262, 0.5837113, -2.641345, 1, 0.427451, 0, 1,
-1.484537, -1.446349, -2.83575, 1, 0.4313726, 0, 1,
-1.481687, -0.8038626, -1.320645, 1, 0.4392157, 0, 1,
-1.478755, -0.929237, -2.337233, 1, 0.4431373, 0, 1,
-1.472913, -0.5337425, -2.067042, 1, 0.4509804, 0, 1,
-1.467683, -0.6910787, -1.670685, 1, 0.454902, 0, 1,
-1.466573, 1.773112, -0.8164869, 1, 0.4627451, 0, 1,
-1.459566, 0.919823, -0.4076871, 1, 0.4666667, 0, 1,
-1.455096, 2.299071, 0.5993793, 1, 0.4745098, 0, 1,
-1.453461, -1.428445, -2.329117, 1, 0.4784314, 0, 1,
-1.449983, 0.3935724, -1.498907, 1, 0.4862745, 0, 1,
-1.447396, 0.4907845, -1.207676, 1, 0.4901961, 0, 1,
-1.436451, -1.876009, -0.8748752, 1, 0.4980392, 0, 1,
-1.429872, -1.292506, -2.548172, 1, 0.5058824, 0, 1,
-1.419503, 0.5467046, -1.193943, 1, 0.509804, 0, 1,
-1.406996, -0.5911818, -2.103513, 1, 0.5176471, 0, 1,
-1.403264, -1.859261, -3.660033, 1, 0.5215687, 0, 1,
-1.401591, 0.2016852, -1.657528, 1, 0.5294118, 0, 1,
-1.394306, -0.4861522, -2.189038, 1, 0.5333334, 0, 1,
-1.386964, -0.5635993, -2.32916, 1, 0.5411765, 0, 1,
-1.382767, -0.214962, -1.941161, 1, 0.5450981, 0, 1,
-1.381381, 0.08445265, -1.763209, 1, 0.5529412, 0, 1,
-1.379301, -0.2982957, 0.4794313, 1, 0.5568628, 0, 1,
-1.374865, -0.4272137, -2.371667, 1, 0.5647059, 0, 1,
-1.370329, -1.708206, -1.737089, 1, 0.5686275, 0, 1,
-1.368469, 0.01677923, -1.500607, 1, 0.5764706, 0, 1,
-1.362943, 0.370496, -2.112458, 1, 0.5803922, 0, 1,
-1.361588, -0.2948508, -1.540374, 1, 0.5882353, 0, 1,
-1.352263, -1.317291, -1.627254, 1, 0.5921569, 0, 1,
-1.3431, 0.6429338, -1.833994, 1, 0.6, 0, 1,
-1.337496, 0.7276853, -0.05625473, 1, 0.6078432, 0, 1,
-1.335866, 0.1133232, -2.627918, 1, 0.6117647, 0, 1,
-1.303382, -0.002674731, -1.564056, 1, 0.6196079, 0, 1,
-1.301277, 0.8233589, 0.3900413, 1, 0.6235294, 0, 1,
-1.295576, -0.1591784, -0.2102281, 1, 0.6313726, 0, 1,
-1.253357, 0.4851095, -1.634211, 1, 0.6352941, 0, 1,
-1.248052, 1.217129, -1.829897, 1, 0.6431373, 0, 1,
-1.245514, 1.253724, -1.17612, 1, 0.6470588, 0, 1,
-1.244403, -0.6002664, -0.2179691, 1, 0.654902, 0, 1,
-1.232182, 0.3669313, -2.858729, 1, 0.6588235, 0, 1,
-1.230844, 1.553056, -1.343197, 1, 0.6666667, 0, 1,
-1.223282, -0.9167612, -2.231444, 1, 0.6705883, 0, 1,
-1.223038, -0.1256815, -1.512775, 1, 0.6784314, 0, 1,
-1.206243, 0.4121869, -2.082722, 1, 0.682353, 0, 1,
-1.203473, 1.397292, -1.505152, 1, 0.6901961, 0, 1,
-1.203043, -1.73219, -2.126025, 1, 0.6941177, 0, 1,
-1.196919, -0.6526011, 0.1416543, 1, 0.7019608, 0, 1,
-1.186784, 0.5758309, -0.7103725, 1, 0.7098039, 0, 1,
-1.183079, 0.2320745, -0.7959984, 1, 0.7137255, 0, 1,
-1.18032, -1.401021, -0.885999, 1, 0.7215686, 0, 1,
-1.172132, 0.2120443, -0.6645988, 1, 0.7254902, 0, 1,
-1.162389, -0.452663, -2.403291, 1, 0.7333333, 0, 1,
-1.157933, -0.2897967, -2.62485, 1, 0.7372549, 0, 1,
-1.157296, 0.2154396, -1.261956, 1, 0.7450981, 0, 1,
-1.156768, 0.5172951, -1.58897, 1, 0.7490196, 0, 1,
-1.154717, -0.1820259, -4.02661, 1, 0.7568628, 0, 1,
-1.152084, -1.170788, -1.371378, 1, 0.7607843, 0, 1,
-1.14164, -0.1743274, -4.449462, 1, 0.7686275, 0, 1,
-1.139639, 0.480341, 0.748928, 1, 0.772549, 0, 1,
-1.13298, 0.9425627, -0.2676803, 1, 0.7803922, 0, 1,
-1.130681, -2.667604, -1.673035, 1, 0.7843137, 0, 1,
-1.130065, -0.9697509, -0.8142918, 1, 0.7921569, 0, 1,
-1.123114, -1.151014, -2.492438, 1, 0.7960784, 0, 1,
-1.122766, 0.3873497, -1.717238, 1, 0.8039216, 0, 1,
-1.119155, 1.106834, -1.071514, 1, 0.8117647, 0, 1,
-1.119112, 0.3511332, 0.8632857, 1, 0.8156863, 0, 1,
-1.115448, -1.893762, -3.179092, 1, 0.8235294, 0, 1,
-1.112612, -1.902563, -4.699414, 1, 0.827451, 0, 1,
-1.112547, -2.550912, -4.596048, 1, 0.8352941, 0, 1,
-1.111789, -0.8367063, -3.193517, 1, 0.8392157, 0, 1,
-1.109051, -1.941859, -2.566994, 1, 0.8470588, 0, 1,
-1.108437, 0.9588464, 0.7201331, 1, 0.8509804, 0, 1,
-1.106099, -2.38612, -3.122523, 1, 0.8588235, 0, 1,
-1.096413, -0.4753717, -1.636399, 1, 0.8627451, 0, 1,
-1.090436, 0.01188252, -2.579927, 1, 0.8705882, 0, 1,
-1.088695, 1.177365, 1.70332, 1, 0.8745098, 0, 1,
-1.086449, 1.028892, -2.171568, 1, 0.8823529, 0, 1,
-1.08494, -0.1430398, -0.4209402, 1, 0.8862745, 0, 1,
-1.084269, -0.1860303, -0.3049504, 1, 0.8941177, 0, 1,
-1.082014, -0.7711098, -1.146926, 1, 0.8980392, 0, 1,
-1.081987, 2.514423, -0.1588527, 1, 0.9058824, 0, 1,
-1.081103, 0.8373899, -1.473394, 1, 0.9137255, 0, 1,
-1.080253, 0.08764011, -1.434444, 1, 0.9176471, 0, 1,
-1.080056, 0.4598593, -2.328984, 1, 0.9254902, 0, 1,
-1.078733, -1.016349, -2.240535, 1, 0.9294118, 0, 1,
-1.075048, -0.9656034, -2.673136, 1, 0.9372549, 0, 1,
-1.053074, 0.2057265, -1.247955, 1, 0.9411765, 0, 1,
-1.049142, -0.4789777, -3.091167, 1, 0.9490196, 0, 1,
-1.047333, -1.544952, -2.80389, 1, 0.9529412, 0, 1,
-1.042588, 0.6004571, -2.191736, 1, 0.9607843, 0, 1,
-1.040785, 0.5021282, 0.7918273, 1, 0.9647059, 0, 1,
-1.034013, 0.2610305, -1.087846, 1, 0.972549, 0, 1,
-1.032815, -1.602479, -3.516742, 1, 0.9764706, 0, 1,
-1.031331, -0.9841756, -2.748129, 1, 0.9843137, 0, 1,
-1.021458, -0.005713815, -0.4389362, 1, 0.9882353, 0, 1,
-1.02042, -0.1157059, -3.73998, 1, 0.9960784, 0, 1,
-1.013007, 1.114361, -1.678285, 0.9960784, 1, 0, 1,
-1.007879, -0.4916413, -0.4423359, 0.9921569, 1, 0, 1,
-1.002763, 1.311579, 0.3299045, 0.9843137, 1, 0, 1,
-1.001329, -0.7108288, -3.214813, 0.9803922, 1, 0, 1,
-0.9817507, -0.4409865, -1.948412, 0.972549, 1, 0, 1,
-0.9798428, 0.9980314, -0.1454466, 0.9686275, 1, 0, 1,
-0.9796459, -0.7147825, -0.8047219, 0.9607843, 1, 0, 1,
-0.9747834, 0.687319, -0.5675056, 0.9568627, 1, 0, 1,
-0.96975, -0.9147674, -3.945451, 0.9490196, 1, 0, 1,
-0.9691793, -0.9903548, -2.383507, 0.945098, 1, 0, 1,
-0.9658938, -1.397795, -1.89518, 0.9372549, 1, 0, 1,
-0.9644583, -0.9904567, -2.606939, 0.9333333, 1, 0, 1,
-0.9641232, -1.471145, -1.142156, 0.9254902, 1, 0, 1,
-0.9447304, 0.3694643, -1.416873, 0.9215686, 1, 0, 1,
-0.9434719, -1.292937, -3.047834, 0.9137255, 1, 0, 1,
-0.9430327, 0.3273346, -0.5679972, 0.9098039, 1, 0, 1,
-0.9428222, -0.6330013, -0.7360631, 0.9019608, 1, 0, 1,
-0.9420722, -1.495684, -3.31317, 0.8941177, 1, 0, 1,
-0.9416113, -0.3547683, -1.43462, 0.8901961, 1, 0, 1,
-0.9374493, 0.1103536, -1.651479, 0.8823529, 1, 0, 1,
-0.928627, -0.2386131, -0.2796382, 0.8784314, 1, 0, 1,
-0.9190347, 0.1895842, -1.772574, 0.8705882, 1, 0, 1,
-0.9174384, -0.6585337, -4.097702, 0.8666667, 1, 0, 1,
-0.9156197, 0.2376357, -0.9076225, 0.8588235, 1, 0, 1,
-0.9124346, -0.5427359, -3.203213, 0.854902, 1, 0, 1,
-0.9111857, -0.8333027, -1.641679, 0.8470588, 1, 0, 1,
-0.9111611, -1.563119, -3.590004, 0.8431373, 1, 0, 1,
-0.9077771, -0.2792894, -2.635629, 0.8352941, 1, 0, 1,
-0.9062136, 1.317195, 0.0309671, 0.8313726, 1, 0, 1,
-0.8998261, 1.151246, 0.276628, 0.8235294, 1, 0, 1,
-0.8957193, 2.061558, -1.015216, 0.8196079, 1, 0, 1,
-0.8950747, 0.9030361, -1.414516, 0.8117647, 1, 0, 1,
-0.8925726, -0.7378096, -3.948739, 0.8078431, 1, 0, 1,
-0.8897298, -1.222914, -3.379757, 0.8, 1, 0, 1,
-0.8884846, 1.804147, -1.383246, 0.7921569, 1, 0, 1,
-0.8855218, 0.9864226, -1.027676, 0.7882353, 1, 0, 1,
-0.8845232, 1.132557, -1.224951, 0.7803922, 1, 0, 1,
-0.8844055, -0.6420444, -2.628737, 0.7764706, 1, 0, 1,
-0.8834445, -0.7843933, -3.938845, 0.7686275, 1, 0, 1,
-0.8813774, -0.6143237, -2.301053, 0.7647059, 1, 0, 1,
-0.8765599, -1.000276, -3.227679, 0.7568628, 1, 0, 1,
-0.8763933, 0.05009693, -2.254122, 0.7529412, 1, 0, 1,
-0.8596482, -0.2360431, -1.855781, 0.7450981, 1, 0, 1,
-0.8563697, 1.812008, -0.4899496, 0.7411765, 1, 0, 1,
-0.8509551, -0.4361184, -0.1955102, 0.7333333, 1, 0, 1,
-0.8499895, 2.325162, -0.05140786, 0.7294118, 1, 0, 1,
-0.8457643, -1.306069, -1.599081, 0.7215686, 1, 0, 1,
-0.8367255, 1.155623, 0.5223206, 0.7176471, 1, 0, 1,
-0.8359848, -0.648918, -2.844016, 0.7098039, 1, 0, 1,
-0.8337753, 1.637714, -0.3495266, 0.7058824, 1, 0, 1,
-0.8273675, -0.2866038, -0.3189915, 0.6980392, 1, 0, 1,
-0.8231651, -0.3341048, -1.68927, 0.6901961, 1, 0, 1,
-0.8225767, 0.1603784, -1.93954, 0.6862745, 1, 0, 1,
-0.8215953, 0.3417476, -2.042688, 0.6784314, 1, 0, 1,
-0.8193855, -0.06646175, -1.804439, 0.6745098, 1, 0, 1,
-0.819033, -0.1022709, -1.015742, 0.6666667, 1, 0, 1,
-0.8188704, -0.9843317, -1.898993, 0.6627451, 1, 0, 1,
-0.8130497, -0.4761502, -1.805161, 0.654902, 1, 0, 1,
-0.8125063, 0.7245634, -1.812282, 0.6509804, 1, 0, 1,
-0.8121511, -0.723094, -2.984275, 0.6431373, 1, 0, 1,
-0.80788, -2.314202, -3.106315, 0.6392157, 1, 0, 1,
-0.7919952, 1.437693, 0.01328414, 0.6313726, 1, 0, 1,
-0.7863973, -0.05081492, -2.498575, 0.627451, 1, 0, 1,
-0.7845743, -0.579959, -2.524261, 0.6196079, 1, 0, 1,
-0.7839942, -0.06910446, -0.6895828, 0.6156863, 1, 0, 1,
-0.779312, 0.452125, -2.549695, 0.6078432, 1, 0, 1,
-0.7735028, 1.04711, -0.7199243, 0.6039216, 1, 0, 1,
-0.7734168, 0.1242112, -1.996183, 0.5960785, 1, 0, 1,
-0.7724851, -1.625278, -3.31359, 0.5882353, 1, 0, 1,
-0.7719399, -0.4310594, -1.129948, 0.5843138, 1, 0, 1,
-0.7683229, -0.2146494, -0.8885012, 0.5764706, 1, 0, 1,
-0.761721, 0.5753489, -2.528922, 0.572549, 1, 0, 1,
-0.7589951, -0.5513539, -2.971736, 0.5647059, 1, 0, 1,
-0.7588992, -0.235578, -2.390679, 0.5607843, 1, 0, 1,
-0.7546884, -1.974469, -2.931444, 0.5529412, 1, 0, 1,
-0.7512419, -0.08529456, -1.140591, 0.5490196, 1, 0, 1,
-0.7388644, -0.607046, 0.09696135, 0.5411765, 1, 0, 1,
-0.7344183, 0.0379011, -2.894451, 0.5372549, 1, 0, 1,
-0.7343084, 0.609, -1.328885, 0.5294118, 1, 0, 1,
-0.7260631, 1.714068, 0.5291064, 0.5254902, 1, 0, 1,
-0.7247368, 1.877969, 0.01544192, 0.5176471, 1, 0, 1,
-0.7232547, 1.131409, -0.9898596, 0.5137255, 1, 0, 1,
-0.7208705, 2.245806, -0.5563135, 0.5058824, 1, 0, 1,
-0.7155437, 0.5116802, -0.7106204, 0.5019608, 1, 0, 1,
-0.7150987, 1.028617, -1.177616, 0.4941176, 1, 0, 1,
-0.7120356, 0.3857936, -1.740325, 0.4862745, 1, 0, 1,
-0.7117632, -2.143684, -3.9283, 0.4823529, 1, 0, 1,
-0.711646, -0.3466159, -1.463047, 0.4745098, 1, 0, 1,
-0.7102351, -0.3732642, -2.172145, 0.4705882, 1, 0, 1,
-0.6934304, -0.02331459, -2.595739, 0.4627451, 1, 0, 1,
-0.6926178, 0.7539951, -1.815269, 0.4588235, 1, 0, 1,
-0.6889269, 0.5332997, -1.309334, 0.4509804, 1, 0, 1,
-0.6879618, 1.785411, 0.1298178, 0.4470588, 1, 0, 1,
-0.6862984, 0.767996, -1.168691, 0.4392157, 1, 0, 1,
-0.6833993, -0.8020746, -1.812173, 0.4352941, 1, 0, 1,
-0.6772135, -0.8202245, -0.8806, 0.427451, 1, 0, 1,
-0.6740799, -0.136568, -1.58523, 0.4235294, 1, 0, 1,
-0.6710312, 0.172773, -1.258572, 0.4156863, 1, 0, 1,
-0.6682369, -1.058797, -3.312287, 0.4117647, 1, 0, 1,
-0.6625152, -0.3030038, -2.08386, 0.4039216, 1, 0, 1,
-0.6586984, -1.533314, -1.174023, 0.3960784, 1, 0, 1,
-0.657705, 0.2699662, -0.738667, 0.3921569, 1, 0, 1,
-0.6546547, -0.25283, -1.501675, 0.3843137, 1, 0, 1,
-0.6534498, 0.8290691, 0.08741195, 0.3803922, 1, 0, 1,
-0.6473213, -2.127094, -3.746188, 0.372549, 1, 0, 1,
-0.6453341, -0.245013, -1.971844, 0.3686275, 1, 0, 1,
-0.64144, -0.1189135, -1.81463, 0.3607843, 1, 0, 1,
-0.6375155, -0.5299528, -2.467393, 0.3568628, 1, 0, 1,
-0.6375043, 0.3315733, -0.6146832, 0.3490196, 1, 0, 1,
-0.6348523, 1.780441, -0.5348684, 0.345098, 1, 0, 1,
-0.6328283, 0.03405671, -1.557629, 0.3372549, 1, 0, 1,
-0.6299266, 1.822416, 0.5218161, 0.3333333, 1, 0, 1,
-0.6284176, 1.430187, 0.8508204, 0.3254902, 1, 0, 1,
-0.6279472, -1.483479, -3.4046, 0.3215686, 1, 0, 1,
-0.6262872, 1.427237, -0.2685436, 0.3137255, 1, 0, 1,
-0.6261552, -0.1933163, -2.541139, 0.3098039, 1, 0, 1,
-0.6196957, -0.1886244, -2.814711, 0.3019608, 1, 0, 1,
-0.6153218, -0.3749796, -1.70238, 0.2941177, 1, 0, 1,
-0.6121299, 1.040987, -0.5629481, 0.2901961, 1, 0, 1,
-0.6068182, -0.5429757, -1.439251, 0.282353, 1, 0, 1,
-0.6012795, -0.2727878, -1.369058, 0.2784314, 1, 0, 1,
-0.6008719, -1.19622, -0.4197289, 0.2705882, 1, 0, 1,
-0.5984513, -0.6596486, -2.016353, 0.2666667, 1, 0, 1,
-0.5977914, 0.8600469, -2.178993, 0.2588235, 1, 0, 1,
-0.5977514, 0.8900669, -1.664727, 0.254902, 1, 0, 1,
-0.5971661, -1.012625, -3.183593, 0.2470588, 1, 0, 1,
-0.5903068, 0.4029713, -1.909037, 0.2431373, 1, 0, 1,
-0.586446, -1.041821, -2.764711, 0.2352941, 1, 0, 1,
-0.5814679, -0.5825646, -1.788304, 0.2313726, 1, 0, 1,
-0.5810628, 0.5753897, -0.9646987, 0.2235294, 1, 0, 1,
-0.5716021, -1.8377, -2.729164, 0.2196078, 1, 0, 1,
-0.565918, 1.062328, -1.688595, 0.2117647, 1, 0, 1,
-0.5655517, -0.6498451, -2.47776, 0.2078431, 1, 0, 1,
-0.5623702, 0.4216334, -0.1930212, 0.2, 1, 0, 1,
-0.5592381, -0.6237786, -3.629271, 0.1921569, 1, 0, 1,
-0.5588847, 0.6904127, -1.725416, 0.1882353, 1, 0, 1,
-0.5542266, -0.5048279, -2.536101, 0.1803922, 1, 0, 1,
-0.5499385, -1.363428, -2.941214, 0.1764706, 1, 0, 1,
-0.5455002, -0.4640326, -1.297035, 0.1686275, 1, 0, 1,
-0.5429411, 1.348336, 0.7244972, 0.1647059, 1, 0, 1,
-0.5424849, 1.9074, 1.204323, 0.1568628, 1, 0, 1,
-0.5359563, -0.628715, -1.94748, 0.1529412, 1, 0, 1,
-0.5349268, -3.149129, -2.47463, 0.145098, 1, 0, 1,
-0.5298105, -1.072395, -3.550386, 0.1411765, 1, 0, 1,
-0.529451, 0.857683, -0.643738, 0.1333333, 1, 0, 1,
-0.5230309, -0.2176794, -1.108751, 0.1294118, 1, 0, 1,
-0.5153667, 1.926687, 0.9297833, 0.1215686, 1, 0, 1,
-0.5056029, -1.332144, -2.899681, 0.1176471, 1, 0, 1,
-0.5017977, 0.4187301, -1.031682, 0.1098039, 1, 0, 1,
-0.5013822, -0.6898044, -1.512338, 0.1058824, 1, 0, 1,
-0.4949644, -1.004631, -2.726995, 0.09803922, 1, 0, 1,
-0.49104, 1.352313, -2.25427, 0.09019608, 1, 0, 1,
-0.4874646, 0.242544, -1.590606, 0.08627451, 1, 0, 1,
-0.4839334, -1.808791, -2.445196, 0.07843138, 1, 0, 1,
-0.4760831, -0.4460065, -2.348208, 0.07450981, 1, 0, 1,
-0.472924, -1.605294, 1.335609, 0.06666667, 1, 0, 1,
-0.4674962, -1.583284, -2.574673, 0.0627451, 1, 0, 1,
-0.467027, 0.7478399, -0.02389328, 0.05490196, 1, 0, 1,
-0.4595767, -0.8342548, -2.071862, 0.05098039, 1, 0, 1,
-0.4547869, 0.400918, -0.07612911, 0.04313726, 1, 0, 1,
-0.4545403, -1.6756, -3.007668, 0.03921569, 1, 0, 1,
-0.4506354, -0.8192528, -2.101061, 0.03137255, 1, 0, 1,
-0.4423739, -1.653484, -1.931365, 0.02745098, 1, 0, 1,
-0.4373823, 0.56543, -1.074124, 0.01960784, 1, 0, 1,
-0.4274764, -0.7973053, -3.638981, 0.01568628, 1, 0, 1,
-0.4265068, 0.3150136, -3.608826, 0.007843138, 1, 0, 1,
-0.4213917, 1.337592, 0.6996322, 0.003921569, 1, 0, 1,
-0.4201965, 0.3140402, -1.401733, 0, 1, 0.003921569, 1,
-0.4072872, -1.129166, -2.990461, 0, 1, 0.01176471, 1,
-0.4045886, -0.6891788, -1.240365, 0, 1, 0.01568628, 1,
-0.4007917, -1.364943, -2.67199, 0, 1, 0.02352941, 1,
-0.3968483, 2.448751, -1.313055, 0, 1, 0.02745098, 1,
-0.3954437, 1.063292, -0.7896797, 0, 1, 0.03529412, 1,
-0.3944586, -0.5176364, -3.895345, 0, 1, 0.03921569, 1,
-0.3940154, -0.4532083, -1.984319, 0, 1, 0.04705882, 1,
-0.3908979, 1.030667, -0.03947475, 0, 1, 0.05098039, 1,
-0.3882335, -0.2530636, 0.8641163, 0, 1, 0.05882353, 1,
-0.386736, -0.8109601, -3.747886, 0, 1, 0.0627451, 1,
-0.38455, -0.08883078, -0.157843, 0, 1, 0.07058824, 1,
-0.3844715, -1.254268, -2.717141, 0, 1, 0.07450981, 1,
-0.382298, 2.455729, -2.409329, 0, 1, 0.08235294, 1,
-0.3810489, 0.1837729, -1.973644, 0, 1, 0.08627451, 1,
-0.3807074, 1.498644, 0.2319195, 0, 1, 0.09411765, 1,
-0.3792631, -0.7495211, -2.937221, 0, 1, 0.1019608, 1,
-0.3775197, -1.150236, -0.7291172, 0, 1, 0.1058824, 1,
-0.3741002, 0.6529067, -0.5563679, 0, 1, 0.1137255, 1,
-0.3726631, 1.012739, -1.197303, 0, 1, 0.1176471, 1,
-0.3719337, -0.3418067, -2.988354, 0, 1, 0.1254902, 1,
-0.3677034, 0.9734683, -0.1401735, 0, 1, 0.1294118, 1,
-0.3673971, 0.17726, -2.193152, 0, 1, 0.1372549, 1,
-0.3646134, 0.1572219, -0.1304776, 0, 1, 0.1411765, 1,
-0.362775, 0.7384958, 0.9223419, 0, 1, 0.1490196, 1,
-0.3626154, 1.795181, 0.3025243, 0, 1, 0.1529412, 1,
-0.3613597, -0.3031884, -0.9005778, 0, 1, 0.1607843, 1,
-0.3601348, -0.387373, -1.692713, 0, 1, 0.1647059, 1,
-0.354268, 0.2988667, -1.289159, 0, 1, 0.172549, 1,
-0.3531927, -0.1106863, -1.462357, 0, 1, 0.1764706, 1,
-0.3526881, 0.2061085, -1.361748, 0, 1, 0.1843137, 1,
-0.3306136, -0.5798621, -1.944601, 0, 1, 0.1882353, 1,
-0.3305655, 0.09894066, -1.405231, 0, 1, 0.1960784, 1,
-0.3290795, 0.2654607, -0.4417616, 0, 1, 0.2039216, 1,
-0.328613, -1.409619, -2.786035, 0, 1, 0.2078431, 1,
-0.3232171, 1.201434, 0.5337747, 0, 1, 0.2156863, 1,
-0.3231481, 1.221848, -0.9094392, 0, 1, 0.2196078, 1,
-0.322671, -0.7616435, -2.421143, 0, 1, 0.227451, 1,
-0.3214552, 0.3383985, -0.801937, 0, 1, 0.2313726, 1,
-0.3201105, 0.7327092, -0.9306967, 0, 1, 0.2392157, 1,
-0.3142599, 1.856815, 0.7155709, 0, 1, 0.2431373, 1,
-0.3090618, -0.205956, 0.1892014, 0, 1, 0.2509804, 1,
-0.3063747, -2.816491, -3.26615, 0, 1, 0.254902, 1,
-0.3062245, 0.6913534, -1.895449, 0, 1, 0.2627451, 1,
-0.3061534, 1.163127, 0.6228681, 0, 1, 0.2666667, 1,
-0.3033828, -1.500427, -0.5596208, 0, 1, 0.2745098, 1,
-0.3024027, -0.02319203, -3.123152, 0, 1, 0.2784314, 1,
-0.2997121, -0.6553165, -4.189626, 0, 1, 0.2862745, 1,
-0.2899287, 0.6473931, -0.9238377, 0, 1, 0.2901961, 1,
-0.2776856, 0.3738883, -0.8941426, 0, 1, 0.2980392, 1,
-0.2721766, 1.568612, -1.500802, 0, 1, 0.3058824, 1,
-0.2716635, 1.285045, -0.3887542, 0, 1, 0.3098039, 1,
-0.2696927, 0.09750964, -0.08905237, 0, 1, 0.3176471, 1,
-0.2672448, 0.1129961, 0.01231106, 0, 1, 0.3215686, 1,
-0.2562956, -0.6266803, -3.115997, 0, 1, 0.3294118, 1,
-0.2534733, 0.5754824, -0.1242134, 0, 1, 0.3333333, 1,
-0.2505245, -0.2300769, -2.763211, 0, 1, 0.3411765, 1,
-0.2321273, 0.4640983, 0.6153708, 0, 1, 0.345098, 1,
-0.2311422, 0.7745436, 1.246167, 0, 1, 0.3529412, 1,
-0.2193998, 0.6890763, -0.05651483, 0, 1, 0.3568628, 1,
-0.2149758, -0.4756938, -4.401948, 0, 1, 0.3647059, 1,
-0.2145042, 0.755697, 0.2925134, 0, 1, 0.3686275, 1,
-0.2068391, -0.1289892, -3.66808, 0, 1, 0.3764706, 1,
-0.1977389, -1.208881, -4.046991, 0, 1, 0.3803922, 1,
-0.1949551, -1.213205, -3.260458, 0, 1, 0.3882353, 1,
-0.1930705, 0.7486742, -1.683862, 0, 1, 0.3921569, 1,
-0.1795583, -0.549328, -2.769016, 0, 1, 0.4, 1,
-0.1790818, -0.7679569, -4.731168, 0, 1, 0.4078431, 1,
-0.1741457, 0.4386561, 0.05177486, 0, 1, 0.4117647, 1,
-0.1718935, 0.8195292, -0.4679879, 0, 1, 0.4196078, 1,
-0.1716596, 0.8961359, -0.09704883, 0, 1, 0.4235294, 1,
-0.1703083, -0.2243108, -1.444109, 0, 1, 0.4313726, 1,
-0.1664123, -0.8251712, -4.442003, 0, 1, 0.4352941, 1,
-0.1655689, -0.8002498, -3.107719, 0, 1, 0.4431373, 1,
-0.1651929, 0.1732544, -0.6298762, 0, 1, 0.4470588, 1,
-0.1634007, -0.7354951, -2.949895, 0, 1, 0.454902, 1,
-0.1606577, 1.412917, 0.1518409, 0, 1, 0.4588235, 1,
-0.1582233, -0.05936262, -2.345253, 0, 1, 0.4666667, 1,
-0.1571983, 0.0843842, -0.8573499, 0, 1, 0.4705882, 1,
-0.1563536, 1.727273, 1.491329, 0, 1, 0.4784314, 1,
-0.1561213, 0.09482022, -1.005847, 0, 1, 0.4823529, 1,
-0.1550021, -0.610957, -2.465565, 0, 1, 0.4901961, 1,
-0.1544127, 2.22201, -0.7463847, 0, 1, 0.4941176, 1,
-0.1535598, 1.426008, -1.559048, 0, 1, 0.5019608, 1,
-0.1521989, 0.5056199, -0.9623607, 0, 1, 0.509804, 1,
-0.1518202, 1.375348, 0.1872169, 0, 1, 0.5137255, 1,
-0.1443443, 0.08784085, -0.7191438, 0, 1, 0.5215687, 1,
-0.1389412, -0.3309129, -1.689205, 0, 1, 0.5254902, 1,
-0.137526, -0.4074067, -2.129329, 0, 1, 0.5333334, 1,
-0.1349121, 0.3626459, 1.576956, 0, 1, 0.5372549, 1,
-0.1332274, -1.12906, -3.65944, 0, 1, 0.5450981, 1,
-0.1306689, -1.592391, -1.196767, 0, 1, 0.5490196, 1,
-0.1293935, 0.8529097, -2.32248, 0, 1, 0.5568628, 1,
-0.1234758, -1.075989, -2.613412, 0, 1, 0.5607843, 1,
-0.123311, -0.6149254, -4.049207, 0, 1, 0.5686275, 1,
-0.1226356, 1.914155, -0.5162492, 0, 1, 0.572549, 1,
-0.1218681, 2.089623, -0.5460275, 0, 1, 0.5803922, 1,
-0.1205002, -0.7112914, -1.565451, 0, 1, 0.5843138, 1,
-0.1191065, -0.8327413, -3.474642, 0, 1, 0.5921569, 1,
-0.1190353, 0.231359, -1.832458, 0, 1, 0.5960785, 1,
-0.1163297, -0.2830714, -2.53894, 0, 1, 0.6039216, 1,
-0.1159444, 1.464361, -1.305723, 0, 1, 0.6117647, 1,
-0.1147562, 0.009529386, -1.964193, 0, 1, 0.6156863, 1,
-0.1117825, 1.038327, 1.028041, 0, 1, 0.6235294, 1,
-0.1116453, 0.008587241, -3.047989, 0, 1, 0.627451, 1,
-0.1115941, 0.8033071, 0.857677, 0, 1, 0.6352941, 1,
-0.1091001, 1.028695, -1.378382, 0, 1, 0.6392157, 1,
-0.1060723, 0.3820689, -1.583149, 0, 1, 0.6470588, 1,
-0.1055436, 0.7462013, 0.2080148, 0, 1, 0.6509804, 1,
-0.0984801, -0.4207309, -3.529262, 0, 1, 0.6588235, 1,
-0.0953946, 0.8883541, -0.3288046, 0, 1, 0.6627451, 1,
-0.09402131, 0.09330254, -1.141142, 0, 1, 0.6705883, 1,
-0.09393506, 1.040462, -0.1022119, 0, 1, 0.6745098, 1,
-0.09316742, 0.05542428, -1.078219, 0, 1, 0.682353, 1,
-0.09297619, 1.209127, 0.8828704, 0, 1, 0.6862745, 1,
-0.09296692, 1.172132, -1.505882, 0, 1, 0.6941177, 1,
-0.09243856, 1.057902, -2.005061, 0, 1, 0.7019608, 1,
-0.09090335, 1.347631, -0.3158585, 0, 1, 0.7058824, 1,
-0.08047374, -0.8727829, -2.388666, 0, 1, 0.7137255, 1,
-0.07701228, -0.1375881, -3.276273, 0, 1, 0.7176471, 1,
-0.07474895, -0.8125116, -2.466218, 0, 1, 0.7254902, 1,
-0.07405505, 0.6823212, 1.012371, 0, 1, 0.7294118, 1,
-0.07261929, 0.5955109, -0.8245289, 0, 1, 0.7372549, 1,
-0.07251505, -1.885805, -2.954979, 0, 1, 0.7411765, 1,
-0.07131852, 1.011479, 0.2526747, 0, 1, 0.7490196, 1,
-0.07086347, 0.6405668, 0.551078, 0, 1, 0.7529412, 1,
-0.07026569, 0.721947, -0.703254, 0, 1, 0.7607843, 1,
-0.06958047, 0.533673, -0.7914685, 0, 1, 0.7647059, 1,
-0.06534604, 1.490386, -0.1433445, 0, 1, 0.772549, 1,
-0.06452794, -1.402876, -3.842514, 0, 1, 0.7764706, 1,
-0.0618677, -1.229014, -2.801571, 0, 1, 0.7843137, 1,
-0.06069064, 0.8063985, 0.2397604, 0, 1, 0.7882353, 1,
-0.06056335, 0.06540404, -1.728405, 0, 1, 0.7960784, 1,
-0.05874614, 0.1674122, 0.4822832, 0, 1, 0.8039216, 1,
-0.04705165, 0.2251181, -1.002111, 0, 1, 0.8078431, 1,
-0.0453424, -0.7328107, -3.016237, 0, 1, 0.8156863, 1,
-0.04524266, -0.330514, -2.085223, 0, 1, 0.8196079, 1,
-0.03794273, 1.101128, -0.2718703, 0, 1, 0.827451, 1,
-0.03247311, 1.251512, -0.3893504, 0, 1, 0.8313726, 1,
-0.03219758, 0.6609956, -0.4607299, 0, 1, 0.8392157, 1,
-0.03016273, -0.6168382, -4.413819, 0, 1, 0.8431373, 1,
-0.02883519, -0.3101975, -3.156706, 0, 1, 0.8509804, 1,
-0.02626641, -1.018305, -3.593417, 0, 1, 0.854902, 1,
-0.02569473, -1.199413, -4.260589, 0, 1, 0.8627451, 1,
-0.02450221, 1.021649, 1.36246, 0, 1, 0.8666667, 1,
-0.02227972, -0.6580392, -3.204564, 0, 1, 0.8745098, 1,
-0.01891351, 0.6922802, -1.770414, 0, 1, 0.8784314, 1,
-0.01769156, -0.1750377, -1.852838, 0, 1, 0.8862745, 1,
-0.01721801, -0.04899109, -2.871874, 0, 1, 0.8901961, 1,
-0.01534331, -1.683328, -1.968668, 0, 1, 0.8980392, 1,
-0.01399776, 0.3624144, -0.2843823, 0, 1, 0.9058824, 1,
-0.01183874, 2.013682, 0.01265363, 0, 1, 0.9098039, 1,
-0.01109937, -0.2524469, -1.777393, 0, 1, 0.9176471, 1,
-0.009151232, -2.50958, -1.161256, 0, 1, 0.9215686, 1,
-0.00808411, 0.4762802, -0.02563311, 0, 1, 0.9294118, 1,
0.000819044, -0.4786213, 3.02562, 0, 1, 0.9333333, 1,
0.00234999, 0.7552668, 0.5153422, 0, 1, 0.9411765, 1,
0.002439589, 0.1938428, 1.656565, 0, 1, 0.945098, 1,
0.003434044, 0.515547, 1.243952, 0, 1, 0.9529412, 1,
0.004306194, 0.2895836, 0.2328264, 0, 1, 0.9568627, 1,
0.00998449, 0.1904965, 1.298328, 0, 1, 0.9647059, 1,
0.01472181, 1.023611, 0.3277627, 0, 1, 0.9686275, 1,
0.01601581, 1.714442, -0.2027578, 0, 1, 0.9764706, 1,
0.01660912, -0.2576104, 4.469582, 0, 1, 0.9803922, 1,
0.01902745, -1.261804, 4.072461, 0, 1, 0.9882353, 1,
0.02052757, -1.102276, 4.065023, 0, 1, 0.9921569, 1,
0.02099755, -0.5012917, 3.376247, 0, 1, 1, 1,
0.02339964, 0.1446138, 2.311913, 0, 0.9921569, 1, 1,
0.02505159, -0.2662828, 3.131348, 0, 0.9882353, 1, 1,
0.02956717, -0.09041071, 3.259538, 0, 0.9803922, 1, 1,
0.03229462, 1.771915, 1.203702, 0, 0.9764706, 1, 1,
0.03379307, -0.9075675, 2.391193, 0, 0.9686275, 1, 1,
0.04215601, -0.3320956, 1.952124, 0, 0.9647059, 1, 1,
0.04984744, -0.5094441, 4.305575, 0, 0.9568627, 1, 1,
0.05593297, 0.8470104, -1.040728, 0, 0.9529412, 1, 1,
0.05703417, -1.552123, 4.66079, 0, 0.945098, 1, 1,
0.05750031, 1.387267, -1.149845, 0, 0.9411765, 1, 1,
0.05934066, -2.07411, 2.590705, 0, 0.9333333, 1, 1,
0.06949757, -2.163299, 2.895336, 0, 0.9294118, 1, 1,
0.07037313, 0.9649765, -0.6172237, 0, 0.9215686, 1, 1,
0.07192368, -2.017199, 2.741999, 0, 0.9176471, 1, 1,
0.08084329, 1.833665, -0.2331522, 0, 0.9098039, 1, 1,
0.0860341, -0.5875311, 2.645324, 0, 0.9058824, 1, 1,
0.08741385, 0.1101837, 0.8029022, 0, 0.8980392, 1, 1,
0.08915281, -0.1747236, 3.326009, 0, 0.8901961, 1, 1,
0.08937395, 0.5809495, 0.2562505, 0, 0.8862745, 1, 1,
0.08996416, -1.286497, 2.8994, 0, 0.8784314, 1, 1,
0.09431253, -1.26484, 3.995924, 0, 0.8745098, 1, 1,
0.1038425, -0.4091671, 2.417458, 0, 0.8666667, 1, 1,
0.1052965, -2.256476, 3.865075, 0, 0.8627451, 1, 1,
0.1057346, -0.4295579, 5.096663, 0, 0.854902, 1, 1,
0.1080861, 0.834166, 1.465068, 0, 0.8509804, 1, 1,
0.1091055, -0.8996909, 4.355487, 0, 0.8431373, 1, 1,
0.1148133, -0.6385126, 1.445905, 0, 0.8392157, 1, 1,
0.1152553, 1.037015, 0.3371621, 0, 0.8313726, 1, 1,
0.1167386, 0.4061792, -1.152742, 0, 0.827451, 1, 1,
0.118169, -0.01088905, 2.703681, 0, 0.8196079, 1, 1,
0.1195125, 0.7070442, -0.2149834, 0, 0.8156863, 1, 1,
0.1233711, 1.838684, -1.236138, 0, 0.8078431, 1, 1,
0.1239916, -0.4154183, 3.901741, 0, 0.8039216, 1, 1,
0.1276601, -1.470681, 2.573352, 0, 0.7960784, 1, 1,
0.1294252, 1.593024, 1.016319, 0, 0.7882353, 1, 1,
0.1316088, 0.5353279, 2.445892, 0, 0.7843137, 1, 1,
0.1367151, -0.187865, 4.511741, 0, 0.7764706, 1, 1,
0.1371816, 1.303812, 2.308087, 0, 0.772549, 1, 1,
0.137577, 1.714399, 0.2327055, 0, 0.7647059, 1, 1,
0.1388886, 1.496782, -0.9426817, 0, 0.7607843, 1, 1,
0.1422389, -0.5104248, 3.91118, 0, 0.7529412, 1, 1,
0.1435603, -2.000855, 3.863233, 0, 0.7490196, 1, 1,
0.1447386, -1.232273, 2.637796, 0, 0.7411765, 1, 1,
0.1490133, -0.7096511, 3.017473, 0, 0.7372549, 1, 1,
0.150339, 0.4755636, -0.3592617, 0, 0.7294118, 1, 1,
0.1558786, 1.007524, -1.157034, 0, 0.7254902, 1, 1,
0.1637282, -0.3731242, 3.854728, 0, 0.7176471, 1, 1,
0.1650994, 1.038148, 1.242701, 0, 0.7137255, 1, 1,
0.1700376, -0.2068846, 1.860991, 0, 0.7058824, 1, 1,
0.170349, 1.065696, 1.034681, 0, 0.6980392, 1, 1,
0.1818775, 0.8022769, 0.04422963, 0, 0.6941177, 1, 1,
0.1875387, 0.2196634, 0.9681683, 0, 0.6862745, 1, 1,
0.191192, -0.1438309, 3.125713, 0, 0.682353, 1, 1,
0.1935346, 0.7758976, -0.4841266, 0, 0.6745098, 1, 1,
0.1987621, 1.239279, -0.03709223, 0, 0.6705883, 1, 1,
0.1993665, -0.9606184, 1.417658, 0, 0.6627451, 1, 1,
0.1996759, -0.06363035, 2.820068, 0, 0.6588235, 1, 1,
0.2012281, 0.5182815, 0.4283455, 0, 0.6509804, 1, 1,
0.2047509, 1.101748, 2.018062, 0, 0.6470588, 1, 1,
0.2053266, -2.437403, 2.102349, 0, 0.6392157, 1, 1,
0.2054653, -1.661511, 2.879288, 0, 0.6352941, 1, 1,
0.2089158, 0.1223099, 0.6015606, 0, 0.627451, 1, 1,
0.2117674, -1.289233, 2.471673, 0, 0.6235294, 1, 1,
0.2124661, -0.04505047, 2.490788, 0, 0.6156863, 1, 1,
0.214821, -0.4585932, 1.666474, 0, 0.6117647, 1, 1,
0.221529, 0.8660587, 2.472481, 0, 0.6039216, 1, 1,
0.2216396, 0.7510657, 0.8407929, 0, 0.5960785, 1, 1,
0.2226078, 0.249447, -0.7615404, 0, 0.5921569, 1, 1,
0.2276241, -0.05349787, 2.929498, 0, 0.5843138, 1, 1,
0.227633, -0.3017992, 2.543367, 0, 0.5803922, 1, 1,
0.2473545, 0.1324612, 0.9673923, 0, 0.572549, 1, 1,
0.2515667, 0.9698494, -0.9587195, 0, 0.5686275, 1, 1,
0.2547557, -0.7696766, 2.875017, 0, 0.5607843, 1, 1,
0.2586105, 1.395588, 2.184356, 0, 0.5568628, 1, 1,
0.2593334, 0.7466778, -0.3505991, 0, 0.5490196, 1, 1,
0.2602768, 1.195165, 0.05518151, 0, 0.5450981, 1, 1,
0.260674, 0.3805024, 0.3625454, 0, 0.5372549, 1, 1,
0.2623754, 0.591392, -0.7107058, 0, 0.5333334, 1, 1,
0.2626516, 1.301929, 0.1007625, 0, 0.5254902, 1, 1,
0.2645504, 0.2804462, -0.6379322, 0, 0.5215687, 1, 1,
0.2648661, -0.315393, 1.566889, 0, 0.5137255, 1, 1,
0.2681528, 0.3245123, 2.566511, 0, 0.509804, 1, 1,
0.2690175, -0.6817024, 2.569929, 0, 0.5019608, 1, 1,
0.2695188, 0.005928051, 1.923986, 0, 0.4941176, 1, 1,
0.2700326, 0.01456423, 1.6618, 0, 0.4901961, 1, 1,
0.2707587, 0.1197655, 2.812042, 0, 0.4823529, 1, 1,
0.2773897, -2.291216, 2.1577, 0, 0.4784314, 1, 1,
0.2805437, -0.897364, 2.572286, 0, 0.4705882, 1, 1,
0.2809223, -0.2900511, 2.459565, 0, 0.4666667, 1, 1,
0.2844689, -0.2910397, -0.7859505, 0, 0.4588235, 1, 1,
0.2864125, -0.9007959, 1.555761, 0, 0.454902, 1, 1,
0.2910321, 0.2518625, -0.3213416, 0, 0.4470588, 1, 1,
0.2915709, 0.1961293, 0.6879796, 0, 0.4431373, 1, 1,
0.2918598, -0.7835857, 4.30154, 0, 0.4352941, 1, 1,
0.2928391, 2.196508, 0.2460129, 0, 0.4313726, 1, 1,
0.2947449, 0.9717221, 2.034962, 0, 0.4235294, 1, 1,
0.3014377, -0.5656072, 2.995555, 0, 0.4196078, 1, 1,
0.3020809, -0.187942, 3.137973, 0, 0.4117647, 1, 1,
0.3021519, -0.433152, 3.074413, 0, 0.4078431, 1, 1,
0.3051627, -0.3902778, 1.255049, 0, 0.4, 1, 1,
0.3059915, 0.01645335, 1.870119, 0, 0.3921569, 1, 1,
0.3082321, 0.2159643, 1.30809, 0, 0.3882353, 1, 1,
0.3086802, 0.2861263, 3.925307, 0, 0.3803922, 1, 1,
0.3174181, 0.8871382, -0.735642, 0, 0.3764706, 1, 1,
0.3194272, 0.4111144, -0.03081156, 0, 0.3686275, 1, 1,
0.3217036, -0.4191615, 1.881832, 0, 0.3647059, 1, 1,
0.3247424, 1.031585, -0.01487238, 0, 0.3568628, 1, 1,
0.3250436, -0.5830551, 3.546704, 0, 0.3529412, 1, 1,
0.3267248, -1.177209, 4.200572, 0, 0.345098, 1, 1,
0.3270617, 0.4685924, -0.1227211, 0, 0.3411765, 1, 1,
0.3330565, -0.4020567, 2.664695, 0, 0.3333333, 1, 1,
0.3394815, -1.24099, 3.528939, 0, 0.3294118, 1, 1,
0.3405299, -1.465723, 2.623555, 0, 0.3215686, 1, 1,
0.3414907, -0.06601134, 1.936436, 0, 0.3176471, 1, 1,
0.3481736, 1.417368, -0.3203146, 0, 0.3098039, 1, 1,
0.3507963, 0.0710402, 1.366996, 0, 0.3058824, 1, 1,
0.3546176, 0.08518858, 0.5636087, 0, 0.2980392, 1, 1,
0.354878, 1.541216, -0.3071875, 0, 0.2901961, 1, 1,
0.3577419, 0.2539566, 0.2681092, 0, 0.2862745, 1, 1,
0.3592801, -0.6360403, 1.931337, 0, 0.2784314, 1, 1,
0.3648066, -0.1953034, 1.402191, 0, 0.2745098, 1, 1,
0.3676193, -0.2642988, 4.167665, 0, 0.2666667, 1, 1,
0.3763867, 1.078639, -0.9667349, 0, 0.2627451, 1, 1,
0.3776959, 0.9194467, 1.247728, 0, 0.254902, 1, 1,
0.3779188, 0.6847129, 0.4952332, 0, 0.2509804, 1, 1,
0.3795909, -1.693165, 3.080855, 0, 0.2431373, 1, 1,
0.3894672, 0.143124, 2.642573, 0, 0.2392157, 1, 1,
0.3900158, -1.176446, 2.592837, 0, 0.2313726, 1, 1,
0.3924749, 0.1694181, 2.021011, 0, 0.227451, 1, 1,
0.3954219, 0.5765425, 1.033564, 0, 0.2196078, 1, 1,
0.3956645, 2.407424, -1.819888, 0, 0.2156863, 1, 1,
0.4014405, 0.4662338, 0.5881446, 0, 0.2078431, 1, 1,
0.4015129, -0.1047703, 1.527833, 0, 0.2039216, 1, 1,
0.4063083, 1.065841, 0.7481149, 0, 0.1960784, 1, 1,
0.4091944, -0.1760691, 3.048343, 0, 0.1882353, 1, 1,
0.4099791, -0.04499277, 2.432195, 0, 0.1843137, 1, 1,
0.4104603, 0.3815429, 1.367113, 0, 0.1764706, 1, 1,
0.4109433, -1.040994, 3.039572, 0, 0.172549, 1, 1,
0.4114833, 0.2323883, 1.402369, 0, 0.1647059, 1, 1,
0.4128748, 0.3753664, 2.173482, 0, 0.1607843, 1, 1,
0.4160193, 0.1272116, -0.3100882, 0, 0.1529412, 1, 1,
0.4275799, -0.54921, 3.92116, 0, 0.1490196, 1, 1,
0.4281234, -1.480129, 3.313232, 0, 0.1411765, 1, 1,
0.4305568, 0.1535593, 1.762361, 0, 0.1372549, 1, 1,
0.4334162, 0.2295303, -0.9625431, 0, 0.1294118, 1, 1,
0.4361537, -0.03092813, 1.524444, 0, 0.1254902, 1, 1,
0.4436347, -1.024856, 3.1863, 0, 0.1176471, 1, 1,
0.4441161, 0.9263839, 0.7628733, 0, 0.1137255, 1, 1,
0.4452338, 0.4777186, 0.4108623, 0, 0.1058824, 1, 1,
0.4464071, 0.1232633, 1.042801, 0, 0.09803922, 1, 1,
0.4477777, -0.9575083, 4.219814, 0, 0.09411765, 1, 1,
0.4495549, -0.5104612, 3.4926, 0, 0.08627451, 1, 1,
0.4505544, -1.503775, 4.691311, 0, 0.08235294, 1, 1,
0.4550175, 0.9833369, 1.79829, 0, 0.07450981, 1, 1,
0.4559067, -0.6323069, 3.019097, 0, 0.07058824, 1, 1,
0.4566462, -0.4427957, 3.490726, 0, 0.0627451, 1, 1,
0.4570082, 0.1551693, 1.246656, 0, 0.05882353, 1, 1,
0.458362, -0.771111, 1.015736, 0, 0.05098039, 1, 1,
0.4586914, 0.7062609, 0.2385689, 0, 0.04705882, 1, 1,
0.46069, 0.5755482, -0.174022, 0, 0.03921569, 1, 1,
0.4633855, -0.250562, 5.231305, 0, 0.03529412, 1, 1,
0.4646432, -0.3296621, 3.483135, 0, 0.02745098, 1, 1,
0.4661666, -0.09230205, 1.08216, 0, 0.02352941, 1, 1,
0.4667193, -0.5635282, 2.82275, 0, 0.01568628, 1, 1,
0.4687492, -0.412937, 3.414273, 0, 0.01176471, 1, 1,
0.4731176, -2.777996, 3.703323, 0, 0.003921569, 1, 1,
0.4749157, 0.1805838, 2.718057, 0.003921569, 0, 1, 1,
0.4778967, 0.7778696, -0.8623944, 0.007843138, 0, 1, 1,
0.4795251, -0.204925, 2.533514, 0.01568628, 0, 1, 1,
0.4838601, 0.2773242, 1.631955, 0.01960784, 0, 1, 1,
0.4851938, 0.5390021, 0.3493753, 0.02745098, 0, 1, 1,
0.4883116, 0.8291156, 1.046375, 0.03137255, 0, 1, 1,
0.5040923, -0.7958217, 3.783579, 0.03921569, 0, 1, 1,
0.5068234, 0.4054502, 2.014438, 0.04313726, 0, 1, 1,
0.5080736, 0.5442421, 0.5259511, 0.05098039, 0, 1, 1,
0.5094268, -1.307859, 2.797272, 0.05490196, 0, 1, 1,
0.5184573, 0.09754846, 1.308057, 0.0627451, 0, 1, 1,
0.5263038, -2.108802, 1.32088, 0.06666667, 0, 1, 1,
0.5306643, -0.6595524, 3.08443, 0.07450981, 0, 1, 1,
0.5356506, 0.7587456, 1.278492, 0.07843138, 0, 1, 1,
0.5467623, -0.5912133, 1.747062, 0.08627451, 0, 1, 1,
0.5485514, -0.4318435, 2.659268, 0.09019608, 0, 1, 1,
0.5504014, 0.08286446, 0.9146269, 0.09803922, 0, 1, 1,
0.5519853, -0.759993, 1.715349, 0.1058824, 0, 1, 1,
0.55281, 0.5136449, 0.820464, 0.1098039, 0, 1, 1,
0.5535149, 1.442561, -0.6837587, 0.1176471, 0, 1, 1,
0.5567793, 0.6757074, -0.1207871, 0.1215686, 0, 1, 1,
0.5598918, -0.200698, 4.180132, 0.1294118, 0, 1, 1,
0.56327, -0.7419803, 3.226007, 0.1333333, 0, 1, 1,
0.5715665, 0.4280385, 0.02692185, 0.1411765, 0, 1, 1,
0.5796653, -0.716607, 3.41043, 0.145098, 0, 1, 1,
0.5820243, 1.000123, 0.09695602, 0.1529412, 0, 1, 1,
0.5826301, 0.02460393, 0.9851077, 0.1568628, 0, 1, 1,
0.5845888, 0.3058865, -0.4704704, 0.1647059, 0, 1, 1,
0.601905, -0.349768, 2.630899, 0.1686275, 0, 1, 1,
0.604548, 0.09865642, 1.126212, 0.1764706, 0, 1, 1,
0.6091269, 0.6699763, 0.4118718, 0.1803922, 0, 1, 1,
0.6124, 2.311844, 1.126254, 0.1882353, 0, 1, 1,
0.613144, 0.7035331, 1.09294, 0.1921569, 0, 1, 1,
0.6145931, -2.736065, 2.423561, 0.2, 0, 1, 1,
0.6149768, -2.153167, 2.685648, 0.2078431, 0, 1, 1,
0.6153546, 0.3890241, 0.2698661, 0.2117647, 0, 1, 1,
0.6177438, -0.8766965, 3.094426, 0.2196078, 0, 1, 1,
0.617774, -0.9578574, 3.20003, 0.2235294, 0, 1, 1,
0.6188185, -0.4401132, 2.084508, 0.2313726, 0, 1, 1,
0.6197739, 2.194497, -0.4358226, 0.2352941, 0, 1, 1,
0.6199506, 0.6177587, 0.6720698, 0.2431373, 0, 1, 1,
0.6232105, -1.082166, 1.500507, 0.2470588, 0, 1, 1,
0.6350762, 1.490288, -0.2861029, 0.254902, 0, 1, 1,
0.6413694, -1.653081, 1.907551, 0.2588235, 0, 1, 1,
0.6443799, -0.2730176, 2.992057, 0.2666667, 0, 1, 1,
0.6497004, 1.391486, -1.571481, 0.2705882, 0, 1, 1,
0.6510862, -0.4534262, 3.608838, 0.2784314, 0, 1, 1,
0.6513209, -0.1441715, 2.122156, 0.282353, 0, 1, 1,
0.6518151, -1.172247, 3.364514, 0.2901961, 0, 1, 1,
0.653868, 0.565744, 2.219496, 0.2941177, 0, 1, 1,
0.6557572, 1.08606, 0.1728654, 0.3019608, 0, 1, 1,
0.6593375, 0.8390449, -2.406908, 0.3098039, 0, 1, 1,
0.6598027, -1.707249, 3.859522, 0.3137255, 0, 1, 1,
0.6638579, 0.3498863, 0.2760785, 0.3215686, 0, 1, 1,
0.6663906, 0.5098698, 0.03786038, 0.3254902, 0, 1, 1,
0.6671836, -0.07363282, 1.656974, 0.3333333, 0, 1, 1,
0.6672521, 0.9691886, -0.5037426, 0.3372549, 0, 1, 1,
0.6696681, -1.041812, -0.5652668, 0.345098, 0, 1, 1,
0.6717235, -0.5766179, 2.013956, 0.3490196, 0, 1, 1,
0.6735676, -0.1172373, 0.8546323, 0.3568628, 0, 1, 1,
0.6757675, 0.1685308, 0.466861, 0.3607843, 0, 1, 1,
0.6810057, -0.3716522, 0.9333161, 0.3686275, 0, 1, 1,
0.681159, -0.3002812, 1.4427, 0.372549, 0, 1, 1,
0.683318, 0.8956048, 0.8675658, 0.3803922, 0, 1, 1,
0.6868877, -0.8946419, 2.524685, 0.3843137, 0, 1, 1,
0.6901875, 1.167955, -0.3081162, 0.3921569, 0, 1, 1,
0.6921862, -0.8642188, 2.276984, 0.3960784, 0, 1, 1,
0.6927882, 1.895087, -1.829093, 0.4039216, 0, 1, 1,
0.6965006, 0.6980707, 0.2346821, 0.4117647, 0, 1, 1,
0.6981013, 0.2562159, 1.893726, 0.4156863, 0, 1, 1,
0.6991145, 1.88586, -1.237397, 0.4235294, 0, 1, 1,
0.7010989, 0.7136486, 2.258867, 0.427451, 0, 1, 1,
0.7043496, -1.124465, 3.259804, 0.4352941, 0, 1, 1,
0.7044589, -0.531208, 2.16477, 0.4392157, 0, 1, 1,
0.7045776, -1.676199, 2.375045, 0.4470588, 0, 1, 1,
0.7074897, -1.587855, 2.529208, 0.4509804, 0, 1, 1,
0.708183, 1.013625, 1.784951, 0.4588235, 0, 1, 1,
0.7112401, -0.300306, 2.617085, 0.4627451, 0, 1, 1,
0.7175829, -0.2929409, 2.109994, 0.4705882, 0, 1, 1,
0.7246162, 0.729736, 0.106913, 0.4745098, 0, 1, 1,
0.7295634, 0.08089752, 1.143298, 0.4823529, 0, 1, 1,
0.7318158, -0.7696652, 4.221009, 0.4862745, 0, 1, 1,
0.7377638, 0.8148986, 1.510027, 0.4941176, 0, 1, 1,
0.7510353, -1.940989, 3.397977, 0.5019608, 0, 1, 1,
0.754465, 0.1097849, 2.167861, 0.5058824, 0, 1, 1,
0.7548631, -0.01755586, 0.8991438, 0.5137255, 0, 1, 1,
0.7667027, 0.03366584, -0.02236013, 0.5176471, 0, 1, 1,
0.7687404, 2.16795, 0.4250123, 0.5254902, 0, 1, 1,
0.7704001, 0.8265805, 1.147155, 0.5294118, 0, 1, 1,
0.7724977, 0.04425679, 1.237696, 0.5372549, 0, 1, 1,
0.7745478, -1.508997, 2.401731, 0.5411765, 0, 1, 1,
0.7751136, -0.4360322, 4.117611, 0.5490196, 0, 1, 1,
0.7761971, 0.4281769, 1.516889, 0.5529412, 0, 1, 1,
0.7766261, -1.337898, 0.0501042, 0.5607843, 0, 1, 1,
0.7770282, 0.7095248, -1.745028, 0.5647059, 0, 1, 1,
0.7806587, 0.5963219, -0.4603791, 0.572549, 0, 1, 1,
0.7836044, -1.003062, 2.601254, 0.5764706, 0, 1, 1,
0.787137, 0.7257165, 1.083445, 0.5843138, 0, 1, 1,
0.7906778, 1.346298, 0.5489692, 0.5882353, 0, 1, 1,
0.7949535, -0.321805, 1.219904, 0.5960785, 0, 1, 1,
0.7954612, -0.1596192, 1.592344, 0.6039216, 0, 1, 1,
0.7961454, 0.01340159, 1.472152, 0.6078432, 0, 1, 1,
0.800988, -0.02878252, 1.590556, 0.6156863, 0, 1, 1,
0.8038566, 0.4724153, 1.722219, 0.6196079, 0, 1, 1,
0.8196266, -0.4447456, 1.524924, 0.627451, 0, 1, 1,
0.8202192, 2.023336, -1.306599, 0.6313726, 0, 1, 1,
0.8314002, 1.11229, 1.413786, 0.6392157, 0, 1, 1,
0.8349316, -2.520271, 3.766877, 0.6431373, 0, 1, 1,
0.8399714, -0.6995665, 0.5663382, 0.6509804, 0, 1, 1,
0.844171, 0.8175217, 0.227021, 0.654902, 0, 1, 1,
0.8450634, 0.8769016, -0.567347, 0.6627451, 0, 1, 1,
0.8463116, 0.02589789, 1.986044, 0.6666667, 0, 1, 1,
0.8469139, -0.6852183, 0.5710196, 0.6745098, 0, 1, 1,
0.846953, -0.1720445, 1.375561, 0.6784314, 0, 1, 1,
0.8482196, -0.5121279, 3.797273, 0.6862745, 0, 1, 1,
0.8495305, 0.09591997, 1.405842, 0.6901961, 0, 1, 1,
0.8505118, -1.242334, 2.682363, 0.6980392, 0, 1, 1,
0.8506685, 0.09529877, 2.909711, 0.7058824, 0, 1, 1,
0.8680532, 1.534304, -1.082469, 0.7098039, 0, 1, 1,
0.8682624, 0.6794984, 0.9097981, 0.7176471, 0, 1, 1,
0.8689405, 1.067701, 0.2718627, 0.7215686, 0, 1, 1,
0.8726001, 2.674794, 0.7288011, 0.7294118, 0, 1, 1,
0.8807027, 0.04529965, 0.9174662, 0.7333333, 0, 1, 1,
0.8819773, 0.1301274, 1.42903, 0.7411765, 0, 1, 1,
0.8851448, -0.1453859, 1.704353, 0.7450981, 0, 1, 1,
0.8869911, -0.9504359, 2.672408, 0.7529412, 0, 1, 1,
0.8886813, 0.6424329, 1.874961, 0.7568628, 0, 1, 1,
0.8909331, -1.06321, 2.74971, 0.7647059, 0, 1, 1,
0.8928089, 0.1249023, 0.3206255, 0.7686275, 0, 1, 1,
0.8958588, -0.5917557, 1.839791, 0.7764706, 0, 1, 1,
0.8975277, 0.6122559, 0.4478489, 0.7803922, 0, 1, 1,
0.9026895, -1.139483, 3.826585, 0.7882353, 0, 1, 1,
0.908214, -0.6633565, 2.450767, 0.7921569, 0, 1, 1,
0.9149317, 0.8677111, 1.078352, 0.8, 0, 1, 1,
0.9159352, -0.8404878, 2.76116, 0.8078431, 0, 1, 1,
0.9172716, 0.3534704, 1.113671, 0.8117647, 0, 1, 1,
0.9249839, 0.5938292, 1.459584, 0.8196079, 0, 1, 1,
0.9281452, -0.5645913, 2.10252, 0.8235294, 0, 1, 1,
0.9304421, 0.6122435, 0.5498933, 0.8313726, 0, 1, 1,
0.9305345, 0.9097263, 1.445066, 0.8352941, 0, 1, 1,
0.936752, 0.5966731, 1.552091, 0.8431373, 0, 1, 1,
0.9374597, -0.8680171, 2.814772, 0.8470588, 0, 1, 1,
0.9374968, -0.5470302, 2.883769, 0.854902, 0, 1, 1,
0.9394549, -1.381142, 3.263181, 0.8588235, 0, 1, 1,
0.940724, 0.7401494, -0.6944256, 0.8666667, 0, 1, 1,
0.9414178, 0.7445932, 2.030205, 0.8705882, 0, 1, 1,
0.9420542, -0.3070146, 1.70394, 0.8784314, 0, 1, 1,
0.9422559, 1.562778, 0.133388, 0.8823529, 0, 1, 1,
0.9447891, -1.750487, 2.621968, 0.8901961, 0, 1, 1,
0.9490148, 1.564084, 1.789562, 0.8941177, 0, 1, 1,
0.9538442, 0.4190654, 1.258378, 0.9019608, 0, 1, 1,
0.9581873, 0.4451014, 0.05929341, 0.9098039, 0, 1, 1,
0.9597757, 1.337057, -1.756632, 0.9137255, 0, 1, 1,
0.9606899, 0.3599699, 3.34705, 0.9215686, 0, 1, 1,
0.9614497, 0.5758885, 1.612966, 0.9254902, 0, 1, 1,
0.9631147, 1.344198, 1.017729, 0.9333333, 0, 1, 1,
0.9663308, -0.6669935, 1.506062, 0.9372549, 0, 1, 1,
0.9687024, -2.785548, 4.533963, 0.945098, 0, 1, 1,
0.970311, -1.97319, 1.436238, 0.9490196, 0, 1, 1,
0.9705689, 0.2791921, 1.802001, 0.9568627, 0, 1, 1,
0.977476, -0.7054803, 2.788145, 0.9607843, 0, 1, 1,
0.9821289, 1.104328, -1.245261, 0.9686275, 0, 1, 1,
0.9874087, 0.9490933, 0.4877127, 0.972549, 0, 1, 1,
0.9875012, -1.173311, 2.738357, 0.9803922, 0, 1, 1,
0.9894836, -0.7357755, 0.8304895, 0.9843137, 0, 1, 1,
1.003071, -0.0415535, 3.060632, 0.9921569, 0, 1, 1,
1.004812, 0.8347752, 1.150647, 0.9960784, 0, 1, 1,
1.010708, -0.5597244, 1.292122, 1, 0, 0.9960784, 1,
1.012522, -0.7451194, 1.637349, 1, 0, 0.9882353, 1,
1.013601, -1.289984, 2.211225, 1, 0, 0.9843137, 1,
1.013794, -0.7108101, 2.75348, 1, 0, 0.9764706, 1,
1.020497, -0.5006559, 1.723027, 1, 0, 0.972549, 1,
1.027848, 2.593386, 0.5433551, 1, 0, 0.9647059, 1,
1.029979, 0.05858948, 1.04871, 1, 0, 0.9607843, 1,
1.032151, -0.279308, 1.135555, 1, 0, 0.9529412, 1,
1.035816, 0.2176215, 1.956084, 1, 0, 0.9490196, 1,
1.044449, 1.090631, 0.1894262, 1, 0, 0.9411765, 1,
1.054428, 0.5038166, 1.305203, 1, 0, 0.9372549, 1,
1.056277, 2.0391, 0.1646911, 1, 0, 0.9294118, 1,
1.060314, 0.7979991, 0.1047117, 1, 0, 0.9254902, 1,
1.062788, 2.479003, 0.3622758, 1, 0, 0.9176471, 1,
1.065957, 0.6310187, -0.1470138, 1, 0, 0.9137255, 1,
1.072597, 1.437828, 0.9195116, 1, 0, 0.9058824, 1,
1.073371, -0.1635792, 3.503294, 1, 0, 0.9019608, 1,
1.076056, -0.9356866, 2.08354, 1, 0, 0.8941177, 1,
1.079023, -0.04686803, 1.597425, 1, 0, 0.8862745, 1,
1.080621, 1.133581, 0.5432485, 1, 0, 0.8823529, 1,
1.087748, 1.108969, 1.879834, 1, 0, 0.8745098, 1,
1.089425, -0.3960278, 1.510817, 1, 0, 0.8705882, 1,
1.094609, 1.124974, 0.8202065, 1, 0, 0.8627451, 1,
1.094704, -0.4692648, 1.437875, 1, 0, 0.8588235, 1,
1.09653, -0.1337802, -0.2532519, 1, 0, 0.8509804, 1,
1.099159, -0.03475277, 1.264579, 1, 0, 0.8470588, 1,
1.108588, -0.45531, 0.497544, 1, 0, 0.8392157, 1,
1.108895, 1.084742, 1.098162, 1, 0, 0.8352941, 1,
1.109815, -0.3316008, 1.491592, 1, 0, 0.827451, 1,
1.111216, 0.7876102, -0.3778553, 1, 0, 0.8235294, 1,
1.125845, -2.249117, 4.250894, 1, 0, 0.8156863, 1,
1.129683, 1.46064, 0.5235927, 1, 0, 0.8117647, 1,
1.13414, -0.4777282, 1.239506, 1, 0, 0.8039216, 1,
1.141014, 0.1993093, 0.6086942, 1, 0, 0.7960784, 1,
1.149171, -0.6442558, 1.163168, 1, 0, 0.7921569, 1,
1.149855, 0.1478419, 1.65512, 1, 0, 0.7843137, 1,
1.177354, 1.537524, 1.955867, 1, 0, 0.7803922, 1,
1.179785, -0.884725, 2.233578, 1, 0, 0.772549, 1,
1.189102, -0.7824499, 2.06105, 1, 0, 0.7686275, 1,
1.189879, -0.3979388, 3.042659, 1, 0, 0.7607843, 1,
1.196898, 0.2448444, 0.1079772, 1, 0, 0.7568628, 1,
1.19932, -0.8821906, 1.080603, 1, 0, 0.7490196, 1,
1.208858, 0.625683, 1.612185, 1, 0, 0.7450981, 1,
1.215188, 0.4914807, 0.9301704, 1, 0, 0.7372549, 1,
1.218987, -0.2629924, 1.207852, 1, 0, 0.7333333, 1,
1.233616, -0.577737, 2.284245, 1, 0, 0.7254902, 1,
1.236114, -1.840016, 2.563614, 1, 0, 0.7215686, 1,
1.238325, 2.538316, 1.027367, 1, 0, 0.7137255, 1,
1.241657, -1.055152, 3.607181, 1, 0, 0.7098039, 1,
1.24655, -0.1157324, 1.85217, 1, 0, 0.7019608, 1,
1.254107, -0.253078, 2.399991, 1, 0, 0.6941177, 1,
1.257629, 0.167682, 1.655172, 1, 0, 0.6901961, 1,
1.259286, -1.19649, 2.095285, 1, 0, 0.682353, 1,
1.260013, -1.330522, 1.249561, 1, 0, 0.6784314, 1,
1.2631, 0.3860965, 2.652127, 1, 0, 0.6705883, 1,
1.265952, -1.444451, 2.432625, 1, 0, 0.6666667, 1,
1.283994, 0.1478086, 1.983828, 1, 0, 0.6588235, 1,
1.28722, -0.4730054, 3.546816, 1, 0, 0.654902, 1,
1.287787, -0.1614253, 1.355177, 1, 0, 0.6470588, 1,
1.297155, 0.151467, -0.8025837, 1, 0, 0.6431373, 1,
1.297766, -0.3259901, 2.422533, 1, 0, 0.6352941, 1,
1.301177, 0.9201314, 1.066166, 1, 0, 0.6313726, 1,
1.302753, 1.803452, 2.07604, 1, 0, 0.6235294, 1,
1.307737, 0.5110895, 1.414913, 1, 0, 0.6196079, 1,
1.308624, -0.2774536, 1.815696, 1, 0, 0.6117647, 1,
1.316282, 1.040125, 1.973094, 1, 0, 0.6078432, 1,
1.319025, 1.564078, 1.275519, 1, 0, 0.6, 1,
1.320138, -0.5017124, 0.630727, 1, 0, 0.5921569, 1,
1.331188, 0.2949072, 2.532026, 1, 0, 0.5882353, 1,
1.336385, -0.6781647, 3.043104, 1, 0, 0.5803922, 1,
1.33736, -1.917231, 3.593591, 1, 0, 0.5764706, 1,
1.340819, 0.4883752, 1.160018, 1, 0, 0.5686275, 1,
1.353564, 1.197493, -0.1708601, 1, 0, 0.5647059, 1,
1.359368, -0.1876453, 0.8582767, 1, 0, 0.5568628, 1,
1.359873, -0.2415796, 1.790667, 1, 0, 0.5529412, 1,
1.379408, 0.3272812, -0.4700807, 1, 0, 0.5450981, 1,
1.392829, 0.8804663, 0.1842922, 1, 0, 0.5411765, 1,
1.4033, -0.9454922, 2.748785, 1, 0, 0.5333334, 1,
1.40637, -1.033445, 0.9882987, 1, 0, 0.5294118, 1,
1.424567, 0.1475115, 2.048476, 1, 0, 0.5215687, 1,
1.429714, 0.3008837, 0.9174027, 1, 0, 0.5176471, 1,
1.441115, 1.063471, 1.629914, 1, 0, 0.509804, 1,
1.441267, -0.2789041, 4.192995, 1, 0, 0.5058824, 1,
1.445425, -1.65284, 1.670673, 1, 0, 0.4980392, 1,
1.452406, -1.47574, 3.149237, 1, 0, 0.4901961, 1,
1.453948, -1.375606, 2.395872, 1, 0, 0.4862745, 1,
1.461967, -1.41753, 2.457146, 1, 0, 0.4784314, 1,
1.470002, -1.316763, 2.912259, 1, 0, 0.4745098, 1,
1.47067, 0.4885041, 1.51136, 1, 0, 0.4666667, 1,
1.494059, -0.4570195, 4.103458, 1, 0, 0.4627451, 1,
1.494463, 0.5499963, 1.039067, 1, 0, 0.454902, 1,
1.508658, 0.5269377, 1.581234, 1, 0, 0.4509804, 1,
1.520633, -0.8033518, 3.701828, 1, 0, 0.4431373, 1,
1.529236, -0.4216905, 2.197131, 1, 0, 0.4392157, 1,
1.540943, 0.5874524, 3.124665, 1, 0, 0.4313726, 1,
1.560816, 0.5389155, 1.868046, 1, 0, 0.427451, 1,
1.575192, 0.6873659, -0.5898899, 1, 0, 0.4196078, 1,
1.580424, 1.401425, 1.681956, 1, 0, 0.4156863, 1,
1.594067, 0.5063254, 1.37067, 1, 0, 0.4078431, 1,
1.597003, 1.505345, 0.7952911, 1, 0, 0.4039216, 1,
1.598894, 0.7336217, 0.2228479, 1, 0, 0.3960784, 1,
1.601399, -0.02328965, 2.019908, 1, 0, 0.3882353, 1,
1.609161, 0.2256428, 1.940696, 1, 0, 0.3843137, 1,
1.617751, -0.5847123, 2.525429, 1, 0, 0.3764706, 1,
1.620867, -2.218874, 2.923504, 1, 0, 0.372549, 1,
1.640602, -0.6281615, 1.524479, 1, 0, 0.3647059, 1,
1.666054, -0.9060526, 4.224896, 1, 0, 0.3607843, 1,
1.669711, -0.3658052, 1.470197, 1, 0, 0.3529412, 1,
1.689529, -0.3999026, 0.6461673, 1, 0, 0.3490196, 1,
1.706145, -1.839534, 3.826163, 1, 0, 0.3411765, 1,
1.707328, -0.08663335, 1.279482, 1, 0, 0.3372549, 1,
1.716882, 0.5887325, 0.3430687, 1, 0, 0.3294118, 1,
1.71798, -0.8760937, 1.758312, 1, 0, 0.3254902, 1,
1.731087, 0.5653939, 0.858472, 1, 0, 0.3176471, 1,
1.735906, -0.2267103, 2.881699, 1, 0, 0.3137255, 1,
1.736495, 0.5729954, 1.591475, 1, 0, 0.3058824, 1,
1.740858, -0.6770688, 1.535708, 1, 0, 0.2980392, 1,
1.745748, -0.9058611, 1.189654, 1, 0, 0.2941177, 1,
1.760368, 0.85999, 0.5598041, 1, 0, 0.2862745, 1,
1.767146, -0.4464938, 2.459682, 1, 0, 0.282353, 1,
1.770434, -0.9443292, 1.652967, 1, 0, 0.2745098, 1,
1.775749, -2.009633, 1.005755, 1, 0, 0.2705882, 1,
1.780415, 2.12219, -0.09033331, 1, 0, 0.2627451, 1,
1.803622, 0.3648832, 1.466177, 1, 0, 0.2588235, 1,
1.842927, 0.1157967, 2.263605, 1, 0, 0.2509804, 1,
1.851919, -1.17609, 2.141375, 1, 0, 0.2470588, 1,
1.862154, 0.135172, 4.480735, 1, 0, 0.2392157, 1,
1.887796, -0.8752642, 3.015268, 1, 0, 0.2352941, 1,
1.900242, 0.4326697, 3.757789, 1, 0, 0.227451, 1,
1.903958, -1.399276, 2.649503, 1, 0, 0.2235294, 1,
1.918693, 0.88019, 3.207312, 1, 0, 0.2156863, 1,
1.922054, -0.2062477, 1.432271, 1, 0, 0.2117647, 1,
1.945117, -0.02186939, 2.150542, 1, 0, 0.2039216, 1,
1.950502, 0.2411771, 2.264146, 1, 0, 0.1960784, 1,
1.982303, -1.269319, 1.207558, 1, 0, 0.1921569, 1,
2.006214, 0.1305927, 2.574841, 1, 0, 0.1843137, 1,
2.033207, 0.170535, 1.494709, 1, 0, 0.1803922, 1,
2.036244, -1.51453, 1.986198, 1, 0, 0.172549, 1,
2.040394, -0.2869962, 0.6992548, 1, 0, 0.1686275, 1,
2.051023, -0.8015306, 2.050305, 1, 0, 0.1607843, 1,
2.052526, -1.912091, 1.634487, 1, 0, 0.1568628, 1,
2.054589, -0.3579261, 2.242342, 1, 0, 0.1490196, 1,
2.072184, -0.4074302, 1.638975, 1, 0, 0.145098, 1,
2.073776, 1.376342, 0.6437786, 1, 0, 0.1372549, 1,
2.087274, 1.163201, 1.087647, 1, 0, 0.1333333, 1,
2.103142, 0.9882655, 1.428932, 1, 0, 0.1254902, 1,
2.117737, -1.22094, 5.251824, 1, 0, 0.1215686, 1,
2.149908, 1.801836, -0.6640133, 1, 0, 0.1137255, 1,
2.153133, 0.2169327, 1.29634, 1, 0, 0.1098039, 1,
2.172925, 0.5629187, 0.2431268, 1, 0, 0.1019608, 1,
2.189002, -0.2532891, 0.5573094, 1, 0, 0.09411765, 1,
2.209905, -0.3297725, 1.888466, 1, 0, 0.09019608, 1,
2.245916, 0.8631498, 0.01817978, 1, 0, 0.08235294, 1,
2.266279, 0.09644751, 3.213836, 1, 0, 0.07843138, 1,
2.290703, -0.6736176, 2.667626, 1, 0, 0.07058824, 1,
2.335922, 1.633942, 1.562192, 1, 0, 0.06666667, 1,
2.39603, 0.2550213, 3.679951, 1, 0, 0.05882353, 1,
2.407, 2.553819, -0.7011795, 1, 0, 0.05490196, 1,
2.417177, -0.3427494, 1.245992, 1, 0, 0.04705882, 1,
2.532864, 1.366739, 1.245582, 1, 0, 0.04313726, 1,
2.619975, 0.3028187, 0.9028032, 1, 0, 0.03529412, 1,
2.685466, 0.1226226, 0.6522677, 1, 0, 0.03137255, 1,
2.764282, 1.495674, -0.7247383, 1, 0, 0.02352941, 1,
2.818769, -0.8718458, 0.9215009, 1, 0, 0.01960784, 1,
2.840723, -0.2905814, 1.11326, 1, 0, 0.01176471, 1,
2.885865, -0.1648822, 3.489204, 1, 0, 0.007843138, 1
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
-0.0327996, -4.136284, -6.423285, 0, -0.5, 0.5, 0.5,
-0.0327996, -4.136284, -6.423285, 1, -0.5, 0.5, 0.5,
-0.0327996, -4.136284, -6.423285, 1, 1.5, 0.5, 0.5,
-0.0327996, -4.136284, -6.423285, 0, 1.5, 0.5, 0.5
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
-3.940892, -0.2371675, -6.423285, 0, -0.5, 0.5, 0.5,
-3.940892, -0.2371675, -6.423285, 1, -0.5, 0.5, 0.5,
-3.940892, -0.2371675, -6.423285, 1, 1.5, 0.5, 0.5,
-3.940892, -0.2371675, -6.423285, 0, 1.5, 0.5, 0.5
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
-3.940892, -4.136284, 0.2603283, 0, -0.5, 0.5, 0.5,
-3.940892, -4.136284, 0.2603283, 1, -0.5, 0.5, 0.5,
-3.940892, -4.136284, 0.2603283, 1, 1.5, 0.5, 0.5,
-3.940892, -4.136284, 0.2603283, 0, 1.5, 0.5, 0.5
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
-2, -3.236488, -4.880913,
2, -3.236488, -4.880913,
-2, -3.236488, -4.880913,
-2, -3.386454, -5.137975,
-1, -3.236488, -4.880913,
-1, -3.386454, -5.137975,
0, -3.236488, -4.880913,
0, -3.386454, -5.137975,
1, -3.236488, -4.880913,
1, -3.386454, -5.137975,
2, -3.236488, -4.880913,
2, -3.386454, -5.137975
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
-2, -3.686386, -5.652099, 0, -0.5, 0.5, 0.5,
-2, -3.686386, -5.652099, 1, -0.5, 0.5, 0.5,
-2, -3.686386, -5.652099, 1, 1.5, 0.5, 0.5,
-2, -3.686386, -5.652099, 0, 1.5, 0.5, 0.5,
-1, -3.686386, -5.652099, 0, -0.5, 0.5, 0.5,
-1, -3.686386, -5.652099, 1, -0.5, 0.5, 0.5,
-1, -3.686386, -5.652099, 1, 1.5, 0.5, 0.5,
-1, -3.686386, -5.652099, 0, 1.5, 0.5, 0.5,
0, -3.686386, -5.652099, 0, -0.5, 0.5, 0.5,
0, -3.686386, -5.652099, 1, -0.5, 0.5, 0.5,
0, -3.686386, -5.652099, 1, 1.5, 0.5, 0.5,
0, -3.686386, -5.652099, 0, 1.5, 0.5, 0.5,
1, -3.686386, -5.652099, 0, -0.5, 0.5, 0.5,
1, -3.686386, -5.652099, 1, -0.5, 0.5, 0.5,
1, -3.686386, -5.652099, 1, 1.5, 0.5, 0.5,
1, -3.686386, -5.652099, 0, 1.5, 0.5, 0.5,
2, -3.686386, -5.652099, 0, -0.5, 0.5, 0.5,
2, -3.686386, -5.652099, 1, -0.5, 0.5, 0.5,
2, -3.686386, -5.652099, 1, 1.5, 0.5, 0.5,
2, -3.686386, -5.652099, 0, 1.5, 0.5, 0.5
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
-3.039024, -3, -4.880913,
-3.039024, 2, -4.880913,
-3.039024, -3, -4.880913,
-3.189336, -3, -5.137975,
-3.039024, -2, -4.880913,
-3.189336, -2, -5.137975,
-3.039024, -1, -4.880913,
-3.189336, -1, -5.137975,
-3.039024, 0, -4.880913,
-3.189336, 0, -5.137975,
-3.039024, 1, -4.880913,
-3.189336, 1, -5.137975,
-3.039024, 2, -4.880913,
-3.189336, 2, -5.137975
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
-3.489958, -3, -5.652099, 0, -0.5, 0.5, 0.5,
-3.489958, -3, -5.652099, 1, -0.5, 0.5, 0.5,
-3.489958, -3, -5.652099, 1, 1.5, 0.5, 0.5,
-3.489958, -3, -5.652099, 0, 1.5, 0.5, 0.5,
-3.489958, -2, -5.652099, 0, -0.5, 0.5, 0.5,
-3.489958, -2, -5.652099, 1, -0.5, 0.5, 0.5,
-3.489958, -2, -5.652099, 1, 1.5, 0.5, 0.5,
-3.489958, -2, -5.652099, 0, 1.5, 0.5, 0.5,
-3.489958, -1, -5.652099, 0, -0.5, 0.5, 0.5,
-3.489958, -1, -5.652099, 1, -0.5, 0.5, 0.5,
-3.489958, -1, -5.652099, 1, 1.5, 0.5, 0.5,
-3.489958, -1, -5.652099, 0, 1.5, 0.5, 0.5,
-3.489958, 0, -5.652099, 0, -0.5, 0.5, 0.5,
-3.489958, 0, -5.652099, 1, -0.5, 0.5, 0.5,
-3.489958, 0, -5.652099, 1, 1.5, 0.5, 0.5,
-3.489958, 0, -5.652099, 0, 1.5, 0.5, 0.5,
-3.489958, 1, -5.652099, 0, -0.5, 0.5, 0.5,
-3.489958, 1, -5.652099, 1, -0.5, 0.5, 0.5,
-3.489958, 1, -5.652099, 1, 1.5, 0.5, 0.5,
-3.489958, 1, -5.652099, 0, 1.5, 0.5, 0.5,
-3.489958, 2, -5.652099, 0, -0.5, 0.5, 0.5,
-3.489958, 2, -5.652099, 1, -0.5, 0.5, 0.5,
-3.489958, 2, -5.652099, 1, 1.5, 0.5, 0.5,
-3.489958, 2, -5.652099, 0, 1.5, 0.5, 0.5
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
-3.039024, -3.236488, -4,
-3.039024, -3.236488, 4,
-3.039024, -3.236488, -4,
-3.189336, -3.386454, -4,
-3.039024, -3.236488, -2,
-3.189336, -3.386454, -2,
-3.039024, -3.236488, 0,
-3.189336, -3.386454, 0,
-3.039024, -3.236488, 2,
-3.189336, -3.386454, 2,
-3.039024, -3.236488, 4,
-3.189336, -3.386454, 4
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
-3.489958, -3.686386, -4, 0, -0.5, 0.5, 0.5,
-3.489958, -3.686386, -4, 1, -0.5, 0.5, 0.5,
-3.489958, -3.686386, -4, 1, 1.5, 0.5, 0.5,
-3.489958, -3.686386, -4, 0, 1.5, 0.5, 0.5,
-3.489958, -3.686386, -2, 0, -0.5, 0.5, 0.5,
-3.489958, -3.686386, -2, 1, -0.5, 0.5, 0.5,
-3.489958, -3.686386, -2, 1, 1.5, 0.5, 0.5,
-3.489958, -3.686386, -2, 0, 1.5, 0.5, 0.5,
-3.489958, -3.686386, 0, 0, -0.5, 0.5, 0.5,
-3.489958, -3.686386, 0, 1, -0.5, 0.5, 0.5,
-3.489958, -3.686386, 0, 1, 1.5, 0.5, 0.5,
-3.489958, -3.686386, 0, 0, 1.5, 0.5, 0.5,
-3.489958, -3.686386, 2, 0, -0.5, 0.5, 0.5,
-3.489958, -3.686386, 2, 1, -0.5, 0.5, 0.5,
-3.489958, -3.686386, 2, 1, 1.5, 0.5, 0.5,
-3.489958, -3.686386, 2, 0, 1.5, 0.5, 0.5,
-3.489958, -3.686386, 4, 0, -0.5, 0.5, 0.5,
-3.489958, -3.686386, 4, 1, -0.5, 0.5, 0.5,
-3.489958, -3.686386, 4, 1, 1.5, 0.5, 0.5,
-3.489958, -3.686386, 4, 0, 1.5, 0.5, 0.5
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
-3.039024, -3.236488, -4.880913,
-3.039024, 2.762153, -4.880913,
-3.039024, -3.236488, 5.401569,
-3.039024, 2.762153, 5.401569,
-3.039024, -3.236488, -4.880913,
-3.039024, -3.236488, 5.401569,
-3.039024, 2.762153, -4.880913,
-3.039024, 2.762153, 5.401569,
-3.039024, -3.236488, -4.880913,
2.973425, -3.236488, -4.880913,
-3.039024, -3.236488, 5.401569,
2.973425, -3.236488, 5.401569,
-3.039024, 2.762153, -4.880913,
2.973425, 2.762153, -4.880913,
-3.039024, 2.762153, 5.401569,
2.973425, 2.762153, 5.401569,
2.973425, -3.236488, -4.880913,
2.973425, 2.762153, -4.880913,
2.973425, -3.236488, 5.401569,
2.973425, 2.762153, 5.401569,
2.973425, -3.236488, -4.880913,
2.973425, -3.236488, 5.401569,
2.973425, 2.762153, -4.880913,
2.973425, 2.762153, 5.401569
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
var radius = 7.121441;
var distance = 31.6841;
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
mvMatrix.translate( 0.0327996, 0.2371675, -0.2603283 );
mvMatrix.scale( 1.28065, 1.283598, 0.748831 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.6841);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
ipconazole<-read.table("ipconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ipconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'ipconazole' not found
```

```r
y<-ipconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'ipconazole' not found
```

```r
z<-ipconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'ipconazole' not found
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
-2.951464, -0.3000757, -2.528214, 0, 0, 1, 1, 1,
-2.861287, -0.3656216, -1.783018, 1, 0, 0, 1, 1,
-2.791179, 0.8912831, -1.361962, 1, 0, 0, 1, 1,
-2.742934, 0.005653721, -0.3820263, 1, 0, 0, 1, 1,
-2.733478, 0.6830101, -1.978185, 1, 0, 0, 1, 1,
-2.720811, 0.1402092, -1.371744, 1, 0, 0, 1, 1,
-2.57148, 0.1540356, -1.966414, 0, 0, 0, 1, 1,
-2.567268, 0.01886643, -1.207225, 0, 0, 0, 1, 1,
-2.532472, -0.1932552, -0.9474731, 0, 0, 0, 1, 1,
-2.446926, -0.1818063, -1.356525, 0, 0, 0, 1, 1,
-2.392783, -0.8890556, -2.503956, 0, 0, 0, 1, 1,
-2.391119, 1.714929, -0.2679217, 0, 0, 0, 1, 1,
-2.311473, 0.3261397, -1.843896, 0, 0, 0, 1, 1,
-2.278589, -0.4792088, -1.258756, 1, 1, 1, 1, 1,
-2.274826, 0.003943808, -1.118886, 1, 1, 1, 1, 1,
-2.191783, 0.2165019, 0.6387346, 1, 1, 1, 1, 1,
-2.141805, -1.72005, -1.996117, 1, 1, 1, 1, 1,
-2.136142, 0.3152809, -2.14083, 1, 1, 1, 1, 1,
-2.13508, 1.244945, 0.5832713, 1, 1, 1, 1, 1,
-2.133441, -0.5469965, -1.766346, 1, 1, 1, 1, 1,
-2.113314, -0.698, -0.5522048, 1, 1, 1, 1, 1,
-2.088672, 0.3488233, -2.398647, 1, 1, 1, 1, 1,
-2.079669, -0.2950254, -0.5810363, 1, 1, 1, 1, 1,
-2.021381, -0.4769066, -3.010119, 1, 1, 1, 1, 1,
-1.961985, -0.05590162, -1.972027, 1, 1, 1, 1, 1,
-1.960428, -0.8099746, -0.9199373, 1, 1, 1, 1, 1,
-1.908561, -0.5874901, -1.491605, 1, 1, 1, 1, 1,
-1.897101, -1.565483, -2.863314, 1, 1, 1, 1, 1,
-1.879373, 0.3697586, -2.66269, 0, 0, 1, 1, 1,
-1.867566, 0.631772, -0.6665602, 1, 0, 0, 1, 1,
-1.857307, 1.452625, -1.311675, 1, 0, 0, 1, 1,
-1.838205, -0.3696941, -1.690692, 1, 0, 0, 1, 1,
-1.799974, 0.8793913, -1.354026, 1, 0, 0, 1, 1,
-1.797256, 0.8967576, -1.808527, 1, 0, 0, 1, 1,
-1.795672, -1.30194, -1.885273, 0, 0, 0, 1, 1,
-1.789003, 1.124302, -2.016664, 0, 0, 0, 1, 1,
-1.779849, 0.4289538, -1.181066, 0, 0, 0, 1, 1,
-1.778029, -0.03850212, 0.02394717, 0, 0, 0, 1, 1,
-1.721807, -0.2515815, -3.58637, 0, 0, 0, 1, 1,
-1.718438, -1.235429, -1.778715, 0, 0, 0, 1, 1,
-1.706913, -0.6646802, -1.832681, 0, 0, 0, 1, 1,
-1.706416, -0.5317066, -0.4610015, 1, 1, 1, 1, 1,
-1.69745, -0.1692153, 0.5405653, 1, 1, 1, 1, 1,
-1.690778, -1.598363, -3.565931, 1, 1, 1, 1, 1,
-1.688236, 0.1717599, -3.151017, 1, 1, 1, 1, 1,
-1.68173, 1.803695, -2.434541, 1, 1, 1, 1, 1,
-1.664822, 1.167237, -0.3900788, 1, 1, 1, 1, 1,
-1.664734, -0.5303034, -2.741211, 1, 1, 1, 1, 1,
-1.658094, -0.4404625, -2.297561, 1, 1, 1, 1, 1,
-1.654762, 0.3091048, -2.450336, 1, 1, 1, 1, 1,
-1.642539, -2.488065, -4.06479, 1, 1, 1, 1, 1,
-1.637155, 0.3528875, -0.4412926, 1, 1, 1, 1, 1,
-1.636011, 0.8190963, 0.1618678, 1, 1, 1, 1, 1,
-1.633299, 0.08486547, -1.914566, 1, 1, 1, 1, 1,
-1.629731, 0.1698438, -2.478655, 1, 1, 1, 1, 1,
-1.621994, 0.6046464, -1.09749, 1, 1, 1, 1, 1,
-1.613895, -1.216025, -1.974717, 0, 0, 1, 1, 1,
-1.606035, 0.5004894, -1.655535, 1, 0, 0, 1, 1,
-1.596424, -1.033096, -2.178178, 1, 0, 0, 1, 1,
-1.577098, -0.8741376, -1.281697, 1, 0, 0, 1, 1,
-1.567628, -0.8742577, -2.914135, 1, 0, 0, 1, 1,
-1.560421, -0.2553608, -2.289868, 1, 0, 0, 1, 1,
-1.555477, 1.209711, -2.228414, 0, 0, 0, 1, 1,
-1.549992, -1.066896, -2.595733, 0, 0, 0, 1, 1,
-1.546234, -0.01120628, -1.804942, 0, 0, 0, 1, 1,
-1.545137, -0.0548871, -2.225702, 0, 0, 0, 1, 1,
-1.531917, 0.6134968, -0.9412322, 0, 0, 0, 1, 1,
-1.527944, 0.6905118, -0.3380004, 0, 0, 0, 1, 1,
-1.521618, -0.09806459, -0.3903224, 0, 0, 0, 1, 1,
-1.507744, -0.5033955, -1.46716, 1, 1, 1, 1, 1,
-1.500729, 0.08128449, 0.02615054, 1, 1, 1, 1, 1,
-1.489262, 0.5837113, -2.641345, 1, 1, 1, 1, 1,
-1.484537, -1.446349, -2.83575, 1, 1, 1, 1, 1,
-1.481687, -0.8038626, -1.320645, 1, 1, 1, 1, 1,
-1.478755, -0.929237, -2.337233, 1, 1, 1, 1, 1,
-1.472913, -0.5337425, -2.067042, 1, 1, 1, 1, 1,
-1.467683, -0.6910787, -1.670685, 1, 1, 1, 1, 1,
-1.466573, 1.773112, -0.8164869, 1, 1, 1, 1, 1,
-1.459566, 0.919823, -0.4076871, 1, 1, 1, 1, 1,
-1.455096, 2.299071, 0.5993793, 1, 1, 1, 1, 1,
-1.453461, -1.428445, -2.329117, 1, 1, 1, 1, 1,
-1.449983, 0.3935724, -1.498907, 1, 1, 1, 1, 1,
-1.447396, 0.4907845, -1.207676, 1, 1, 1, 1, 1,
-1.436451, -1.876009, -0.8748752, 1, 1, 1, 1, 1,
-1.429872, -1.292506, -2.548172, 0, 0, 1, 1, 1,
-1.419503, 0.5467046, -1.193943, 1, 0, 0, 1, 1,
-1.406996, -0.5911818, -2.103513, 1, 0, 0, 1, 1,
-1.403264, -1.859261, -3.660033, 1, 0, 0, 1, 1,
-1.401591, 0.2016852, -1.657528, 1, 0, 0, 1, 1,
-1.394306, -0.4861522, -2.189038, 1, 0, 0, 1, 1,
-1.386964, -0.5635993, -2.32916, 0, 0, 0, 1, 1,
-1.382767, -0.214962, -1.941161, 0, 0, 0, 1, 1,
-1.381381, 0.08445265, -1.763209, 0, 0, 0, 1, 1,
-1.379301, -0.2982957, 0.4794313, 0, 0, 0, 1, 1,
-1.374865, -0.4272137, -2.371667, 0, 0, 0, 1, 1,
-1.370329, -1.708206, -1.737089, 0, 0, 0, 1, 1,
-1.368469, 0.01677923, -1.500607, 0, 0, 0, 1, 1,
-1.362943, 0.370496, -2.112458, 1, 1, 1, 1, 1,
-1.361588, -0.2948508, -1.540374, 1, 1, 1, 1, 1,
-1.352263, -1.317291, -1.627254, 1, 1, 1, 1, 1,
-1.3431, 0.6429338, -1.833994, 1, 1, 1, 1, 1,
-1.337496, 0.7276853, -0.05625473, 1, 1, 1, 1, 1,
-1.335866, 0.1133232, -2.627918, 1, 1, 1, 1, 1,
-1.303382, -0.002674731, -1.564056, 1, 1, 1, 1, 1,
-1.301277, 0.8233589, 0.3900413, 1, 1, 1, 1, 1,
-1.295576, -0.1591784, -0.2102281, 1, 1, 1, 1, 1,
-1.253357, 0.4851095, -1.634211, 1, 1, 1, 1, 1,
-1.248052, 1.217129, -1.829897, 1, 1, 1, 1, 1,
-1.245514, 1.253724, -1.17612, 1, 1, 1, 1, 1,
-1.244403, -0.6002664, -0.2179691, 1, 1, 1, 1, 1,
-1.232182, 0.3669313, -2.858729, 1, 1, 1, 1, 1,
-1.230844, 1.553056, -1.343197, 1, 1, 1, 1, 1,
-1.223282, -0.9167612, -2.231444, 0, 0, 1, 1, 1,
-1.223038, -0.1256815, -1.512775, 1, 0, 0, 1, 1,
-1.206243, 0.4121869, -2.082722, 1, 0, 0, 1, 1,
-1.203473, 1.397292, -1.505152, 1, 0, 0, 1, 1,
-1.203043, -1.73219, -2.126025, 1, 0, 0, 1, 1,
-1.196919, -0.6526011, 0.1416543, 1, 0, 0, 1, 1,
-1.186784, 0.5758309, -0.7103725, 0, 0, 0, 1, 1,
-1.183079, 0.2320745, -0.7959984, 0, 0, 0, 1, 1,
-1.18032, -1.401021, -0.885999, 0, 0, 0, 1, 1,
-1.172132, 0.2120443, -0.6645988, 0, 0, 0, 1, 1,
-1.162389, -0.452663, -2.403291, 0, 0, 0, 1, 1,
-1.157933, -0.2897967, -2.62485, 0, 0, 0, 1, 1,
-1.157296, 0.2154396, -1.261956, 0, 0, 0, 1, 1,
-1.156768, 0.5172951, -1.58897, 1, 1, 1, 1, 1,
-1.154717, -0.1820259, -4.02661, 1, 1, 1, 1, 1,
-1.152084, -1.170788, -1.371378, 1, 1, 1, 1, 1,
-1.14164, -0.1743274, -4.449462, 1, 1, 1, 1, 1,
-1.139639, 0.480341, 0.748928, 1, 1, 1, 1, 1,
-1.13298, 0.9425627, -0.2676803, 1, 1, 1, 1, 1,
-1.130681, -2.667604, -1.673035, 1, 1, 1, 1, 1,
-1.130065, -0.9697509, -0.8142918, 1, 1, 1, 1, 1,
-1.123114, -1.151014, -2.492438, 1, 1, 1, 1, 1,
-1.122766, 0.3873497, -1.717238, 1, 1, 1, 1, 1,
-1.119155, 1.106834, -1.071514, 1, 1, 1, 1, 1,
-1.119112, 0.3511332, 0.8632857, 1, 1, 1, 1, 1,
-1.115448, -1.893762, -3.179092, 1, 1, 1, 1, 1,
-1.112612, -1.902563, -4.699414, 1, 1, 1, 1, 1,
-1.112547, -2.550912, -4.596048, 1, 1, 1, 1, 1,
-1.111789, -0.8367063, -3.193517, 0, 0, 1, 1, 1,
-1.109051, -1.941859, -2.566994, 1, 0, 0, 1, 1,
-1.108437, 0.9588464, 0.7201331, 1, 0, 0, 1, 1,
-1.106099, -2.38612, -3.122523, 1, 0, 0, 1, 1,
-1.096413, -0.4753717, -1.636399, 1, 0, 0, 1, 1,
-1.090436, 0.01188252, -2.579927, 1, 0, 0, 1, 1,
-1.088695, 1.177365, 1.70332, 0, 0, 0, 1, 1,
-1.086449, 1.028892, -2.171568, 0, 0, 0, 1, 1,
-1.08494, -0.1430398, -0.4209402, 0, 0, 0, 1, 1,
-1.084269, -0.1860303, -0.3049504, 0, 0, 0, 1, 1,
-1.082014, -0.7711098, -1.146926, 0, 0, 0, 1, 1,
-1.081987, 2.514423, -0.1588527, 0, 0, 0, 1, 1,
-1.081103, 0.8373899, -1.473394, 0, 0, 0, 1, 1,
-1.080253, 0.08764011, -1.434444, 1, 1, 1, 1, 1,
-1.080056, 0.4598593, -2.328984, 1, 1, 1, 1, 1,
-1.078733, -1.016349, -2.240535, 1, 1, 1, 1, 1,
-1.075048, -0.9656034, -2.673136, 1, 1, 1, 1, 1,
-1.053074, 0.2057265, -1.247955, 1, 1, 1, 1, 1,
-1.049142, -0.4789777, -3.091167, 1, 1, 1, 1, 1,
-1.047333, -1.544952, -2.80389, 1, 1, 1, 1, 1,
-1.042588, 0.6004571, -2.191736, 1, 1, 1, 1, 1,
-1.040785, 0.5021282, 0.7918273, 1, 1, 1, 1, 1,
-1.034013, 0.2610305, -1.087846, 1, 1, 1, 1, 1,
-1.032815, -1.602479, -3.516742, 1, 1, 1, 1, 1,
-1.031331, -0.9841756, -2.748129, 1, 1, 1, 1, 1,
-1.021458, -0.005713815, -0.4389362, 1, 1, 1, 1, 1,
-1.02042, -0.1157059, -3.73998, 1, 1, 1, 1, 1,
-1.013007, 1.114361, -1.678285, 1, 1, 1, 1, 1,
-1.007879, -0.4916413, -0.4423359, 0, 0, 1, 1, 1,
-1.002763, 1.311579, 0.3299045, 1, 0, 0, 1, 1,
-1.001329, -0.7108288, -3.214813, 1, 0, 0, 1, 1,
-0.9817507, -0.4409865, -1.948412, 1, 0, 0, 1, 1,
-0.9798428, 0.9980314, -0.1454466, 1, 0, 0, 1, 1,
-0.9796459, -0.7147825, -0.8047219, 1, 0, 0, 1, 1,
-0.9747834, 0.687319, -0.5675056, 0, 0, 0, 1, 1,
-0.96975, -0.9147674, -3.945451, 0, 0, 0, 1, 1,
-0.9691793, -0.9903548, -2.383507, 0, 0, 0, 1, 1,
-0.9658938, -1.397795, -1.89518, 0, 0, 0, 1, 1,
-0.9644583, -0.9904567, -2.606939, 0, 0, 0, 1, 1,
-0.9641232, -1.471145, -1.142156, 0, 0, 0, 1, 1,
-0.9447304, 0.3694643, -1.416873, 0, 0, 0, 1, 1,
-0.9434719, -1.292937, -3.047834, 1, 1, 1, 1, 1,
-0.9430327, 0.3273346, -0.5679972, 1, 1, 1, 1, 1,
-0.9428222, -0.6330013, -0.7360631, 1, 1, 1, 1, 1,
-0.9420722, -1.495684, -3.31317, 1, 1, 1, 1, 1,
-0.9416113, -0.3547683, -1.43462, 1, 1, 1, 1, 1,
-0.9374493, 0.1103536, -1.651479, 1, 1, 1, 1, 1,
-0.928627, -0.2386131, -0.2796382, 1, 1, 1, 1, 1,
-0.9190347, 0.1895842, -1.772574, 1, 1, 1, 1, 1,
-0.9174384, -0.6585337, -4.097702, 1, 1, 1, 1, 1,
-0.9156197, 0.2376357, -0.9076225, 1, 1, 1, 1, 1,
-0.9124346, -0.5427359, -3.203213, 1, 1, 1, 1, 1,
-0.9111857, -0.8333027, -1.641679, 1, 1, 1, 1, 1,
-0.9111611, -1.563119, -3.590004, 1, 1, 1, 1, 1,
-0.9077771, -0.2792894, -2.635629, 1, 1, 1, 1, 1,
-0.9062136, 1.317195, 0.0309671, 1, 1, 1, 1, 1,
-0.8998261, 1.151246, 0.276628, 0, 0, 1, 1, 1,
-0.8957193, 2.061558, -1.015216, 1, 0, 0, 1, 1,
-0.8950747, 0.9030361, -1.414516, 1, 0, 0, 1, 1,
-0.8925726, -0.7378096, -3.948739, 1, 0, 0, 1, 1,
-0.8897298, -1.222914, -3.379757, 1, 0, 0, 1, 1,
-0.8884846, 1.804147, -1.383246, 1, 0, 0, 1, 1,
-0.8855218, 0.9864226, -1.027676, 0, 0, 0, 1, 1,
-0.8845232, 1.132557, -1.224951, 0, 0, 0, 1, 1,
-0.8844055, -0.6420444, -2.628737, 0, 0, 0, 1, 1,
-0.8834445, -0.7843933, -3.938845, 0, 0, 0, 1, 1,
-0.8813774, -0.6143237, -2.301053, 0, 0, 0, 1, 1,
-0.8765599, -1.000276, -3.227679, 0, 0, 0, 1, 1,
-0.8763933, 0.05009693, -2.254122, 0, 0, 0, 1, 1,
-0.8596482, -0.2360431, -1.855781, 1, 1, 1, 1, 1,
-0.8563697, 1.812008, -0.4899496, 1, 1, 1, 1, 1,
-0.8509551, -0.4361184, -0.1955102, 1, 1, 1, 1, 1,
-0.8499895, 2.325162, -0.05140786, 1, 1, 1, 1, 1,
-0.8457643, -1.306069, -1.599081, 1, 1, 1, 1, 1,
-0.8367255, 1.155623, 0.5223206, 1, 1, 1, 1, 1,
-0.8359848, -0.648918, -2.844016, 1, 1, 1, 1, 1,
-0.8337753, 1.637714, -0.3495266, 1, 1, 1, 1, 1,
-0.8273675, -0.2866038, -0.3189915, 1, 1, 1, 1, 1,
-0.8231651, -0.3341048, -1.68927, 1, 1, 1, 1, 1,
-0.8225767, 0.1603784, -1.93954, 1, 1, 1, 1, 1,
-0.8215953, 0.3417476, -2.042688, 1, 1, 1, 1, 1,
-0.8193855, -0.06646175, -1.804439, 1, 1, 1, 1, 1,
-0.819033, -0.1022709, -1.015742, 1, 1, 1, 1, 1,
-0.8188704, -0.9843317, -1.898993, 1, 1, 1, 1, 1,
-0.8130497, -0.4761502, -1.805161, 0, 0, 1, 1, 1,
-0.8125063, 0.7245634, -1.812282, 1, 0, 0, 1, 1,
-0.8121511, -0.723094, -2.984275, 1, 0, 0, 1, 1,
-0.80788, -2.314202, -3.106315, 1, 0, 0, 1, 1,
-0.7919952, 1.437693, 0.01328414, 1, 0, 0, 1, 1,
-0.7863973, -0.05081492, -2.498575, 1, 0, 0, 1, 1,
-0.7845743, -0.579959, -2.524261, 0, 0, 0, 1, 1,
-0.7839942, -0.06910446, -0.6895828, 0, 0, 0, 1, 1,
-0.779312, 0.452125, -2.549695, 0, 0, 0, 1, 1,
-0.7735028, 1.04711, -0.7199243, 0, 0, 0, 1, 1,
-0.7734168, 0.1242112, -1.996183, 0, 0, 0, 1, 1,
-0.7724851, -1.625278, -3.31359, 0, 0, 0, 1, 1,
-0.7719399, -0.4310594, -1.129948, 0, 0, 0, 1, 1,
-0.7683229, -0.2146494, -0.8885012, 1, 1, 1, 1, 1,
-0.761721, 0.5753489, -2.528922, 1, 1, 1, 1, 1,
-0.7589951, -0.5513539, -2.971736, 1, 1, 1, 1, 1,
-0.7588992, -0.235578, -2.390679, 1, 1, 1, 1, 1,
-0.7546884, -1.974469, -2.931444, 1, 1, 1, 1, 1,
-0.7512419, -0.08529456, -1.140591, 1, 1, 1, 1, 1,
-0.7388644, -0.607046, 0.09696135, 1, 1, 1, 1, 1,
-0.7344183, 0.0379011, -2.894451, 1, 1, 1, 1, 1,
-0.7343084, 0.609, -1.328885, 1, 1, 1, 1, 1,
-0.7260631, 1.714068, 0.5291064, 1, 1, 1, 1, 1,
-0.7247368, 1.877969, 0.01544192, 1, 1, 1, 1, 1,
-0.7232547, 1.131409, -0.9898596, 1, 1, 1, 1, 1,
-0.7208705, 2.245806, -0.5563135, 1, 1, 1, 1, 1,
-0.7155437, 0.5116802, -0.7106204, 1, 1, 1, 1, 1,
-0.7150987, 1.028617, -1.177616, 1, 1, 1, 1, 1,
-0.7120356, 0.3857936, -1.740325, 0, 0, 1, 1, 1,
-0.7117632, -2.143684, -3.9283, 1, 0, 0, 1, 1,
-0.711646, -0.3466159, -1.463047, 1, 0, 0, 1, 1,
-0.7102351, -0.3732642, -2.172145, 1, 0, 0, 1, 1,
-0.6934304, -0.02331459, -2.595739, 1, 0, 0, 1, 1,
-0.6926178, 0.7539951, -1.815269, 1, 0, 0, 1, 1,
-0.6889269, 0.5332997, -1.309334, 0, 0, 0, 1, 1,
-0.6879618, 1.785411, 0.1298178, 0, 0, 0, 1, 1,
-0.6862984, 0.767996, -1.168691, 0, 0, 0, 1, 1,
-0.6833993, -0.8020746, -1.812173, 0, 0, 0, 1, 1,
-0.6772135, -0.8202245, -0.8806, 0, 0, 0, 1, 1,
-0.6740799, -0.136568, -1.58523, 0, 0, 0, 1, 1,
-0.6710312, 0.172773, -1.258572, 0, 0, 0, 1, 1,
-0.6682369, -1.058797, -3.312287, 1, 1, 1, 1, 1,
-0.6625152, -0.3030038, -2.08386, 1, 1, 1, 1, 1,
-0.6586984, -1.533314, -1.174023, 1, 1, 1, 1, 1,
-0.657705, 0.2699662, -0.738667, 1, 1, 1, 1, 1,
-0.6546547, -0.25283, -1.501675, 1, 1, 1, 1, 1,
-0.6534498, 0.8290691, 0.08741195, 1, 1, 1, 1, 1,
-0.6473213, -2.127094, -3.746188, 1, 1, 1, 1, 1,
-0.6453341, -0.245013, -1.971844, 1, 1, 1, 1, 1,
-0.64144, -0.1189135, -1.81463, 1, 1, 1, 1, 1,
-0.6375155, -0.5299528, -2.467393, 1, 1, 1, 1, 1,
-0.6375043, 0.3315733, -0.6146832, 1, 1, 1, 1, 1,
-0.6348523, 1.780441, -0.5348684, 1, 1, 1, 1, 1,
-0.6328283, 0.03405671, -1.557629, 1, 1, 1, 1, 1,
-0.6299266, 1.822416, 0.5218161, 1, 1, 1, 1, 1,
-0.6284176, 1.430187, 0.8508204, 1, 1, 1, 1, 1,
-0.6279472, -1.483479, -3.4046, 0, 0, 1, 1, 1,
-0.6262872, 1.427237, -0.2685436, 1, 0, 0, 1, 1,
-0.6261552, -0.1933163, -2.541139, 1, 0, 0, 1, 1,
-0.6196957, -0.1886244, -2.814711, 1, 0, 0, 1, 1,
-0.6153218, -0.3749796, -1.70238, 1, 0, 0, 1, 1,
-0.6121299, 1.040987, -0.5629481, 1, 0, 0, 1, 1,
-0.6068182, -0.5429757, -1.439251, 0, 0, 0, 1, 1,
-0.6012795, -0.2727878, -1.369058, 0, 0, 0, 1, 1,
-0.6008719, -1.19622, -0.4197289, 0, 0, 0, 1, 1,
-0.5984513, -0.6596486, -2.016353, 0, 0, 0, 1, 1,
-0.5977914, 0.8600469, -2.178993, 0, 0, 0, 1, 1,
-0.5977514, 0.8900669, -1.664727, 0, 0, 0, 1, 1,
-0.5971661, -1.012625, -3.183593, 0, 0, 0, 1, 1,
-0.5903068, 0.4029713, -1.909037, 1, 1, 1, 1, 1,
-0.586446, -1.041821, -2.764711, 1, 1, 1, 1, 1,
-0.5814679, -0.5825646, -1.788304, 1, 1, 1, 1, 1,
-0.5810628, 0.5753897, -0.9646987, 1, 1, 1, 1, 1,
-0.5716021, -1.8377, -2.729164, 1, 1, 1, 1, 1,
-0.565918, 1.062328, -1.688595, 1, 1, 1, 1, 1,
-0.5655517, -0.6498451, -2.47776, 1, 1, 1, 1, 1,
-0.5623702, 0.4216334, -0.1930212, 1, 1, 1, 1, 1,
-0.5592381, -0.6237786, -3.629271, 1, 1, 1, 1, 1,
-0.5588847, 0.6904127, -1.725416, 1, 1, 1, 1, 1,
-0.5542266, -0.5048279, -2.536101, 1, 1, 1, 1, 1,
-0.5499385, -1.363428, -2.941214, 1, 1, 1, 1, 1,
-0.5455002, -0.4640326, -1.297035, 1, 1, 1, 1, 1,
-0.5429411, 1.348336, 0.7244972, 1, 1, 1, 1, 1,
-0.5424849, 1.9074, 1.204323, 1, 1, 1, 1, 1,
-0.5359563, -0.628715, -1.94748, 0, 0, 1, 1, 1,
-0.5349268, -3.149129, -2.47463, 1, 0, 0, 1, 1,
-0.5298105, -1.072395, -3.550386, 1, 0, 0, 1, 1,
-0.529451, 0.857683, -0.643738, 1, 0, 0, 1, 1,
-0.5230309, -0.2176794, -1.108751, 1, 0, 0, 1, 1,
-0.5153667, 1.926687, 0.9297833, 1, 0, 0, 1, 1,
-0.5056029, -1.332144, -2.899681, 0, 0, 0, 1, 1,
-0.5017977, 0.4187301, -1.031682, 0, 0, 0, 1, 1,
-0.5013822, -0.6898044, -1.512338, 0, 0, 0, 1, 1,
-0.4949644, -1.004631, -2.726995, 0, 0, 0, 1, 1,
-0.49104, 1.352313, -2.25427, 0, 0, 0, 1, 1,
-0.4874646, 0.242544, -1.590606, 0, 0, 0, 1, 1,
-0.4839334, -1.808791, -2.445196, 0, 0, 0, 1, 1,
-0.4760831, -0.4460065, -2.348208, 1, 1, 1, 1, 1,
-0.472924, -1.605294, 1.335609, 1, 1, 1, 1, 1,
-0.4674962, -1.583284, -2.574673, 1, 1, 1, 1, 1,
-0.467027, 0.7478399, -0.02389328, 1, 1, 1, 1, 1,
-0.4595767, -0.8342548, -2.071862, 1, 1, 1, 1, 1,
-0.4547869, 0.400918, -0.07612911, 1, 1, 1, 1, 1,
-0.4545403, -1.6756, -3.007668, 1, 1, 1, 1, 1,
-0.4506354, -0.8192528, -2.101061, 1, 1, 1, 1, 1,
-0.4423739, -1.653484, -1.931365, 1, 1, 1, 1, 1,
-0.4373823, 0.56543, -1.074124, 1, 1, 1, 1, 1,
-0.4274764, -0.7973053, -3.638981, 1, 1, 1, 1, 1,
-0.4265068, 0.3150136, -3.608826, 1, 1, 1, 1, 1,
-0.4213917, 1.337592, 0.6996322, 1, 1, 1, 1, 1,
-0.4201965, 0.3140402, -1.401733, 1, 1, 1, 1, 1,
-0.4072872, -1.129166, -2.990461, 1, 1, 1, 1, 1,
-0.4045886, -0.6891788, -1.240365, 0, 0, 1, 1, 1,
-0.4007917, -1.364943, -2.67199, 1, 0, 0, 1, 1,
-0.3968483, 2.448751, -1.313055, 1, 0, 0, 1, 1,
-0.3954437, 1.063292, -0.7896797, 1, 0, 0, 1, 1,
-0.3944586, -0.5176364, -3.895345, 1, 0, 0, 1, 1,
-0.3940154, -0.4532083, -1.984319, 1, 0, 0, 1, 1,
-0.3908979, 1.030667, -0.03947475, 0, 0, 0, 1, 1,
-0.3882335, -0.2530636, 0.8641163, 0, 0, 0, 1, 1,
-0.386736, -0.8109601, -3.747886, 0, 0, 0, 1, 1,
-0.38455, -0.08883078, -0.157843, 0, 0, 0, 1, 1,
-0.3844715, -1.254268, -2.717141, 0, 0, 0, 1, 1,
-0.382298, 2.455729, -2.409329, 0, 0, 0, 1, 1,
-0.3810489, 0.1837729, -1.973644, 0, 0, 0, 1, 1,
-0.3807074, 1.498644, 0.2319195, 1, 1, 1, 1, 1,
-0.3792631, -0.7495211, -2.937221, 1, 1, 1, 1, 1,
-0.3775197, -1.150236, -0.7291172, 1, 1, 1, 1, 1,
-0.3741002, 0.6529067, -0.5563679, 1, 1, 1, 1, 1,
-0.3726631, 1.012739, -1.197303, 1, 1, 1, 1, 1,
-0.3719337, -0.3418067, -2.988354, 1, 1, 1, 1, 1,
-0.3677034, 0.9734683, -0.1401735, 1, 1, 1, 1, 1,
-0.3673971, 0.17726, -2.193152, 1, 1, 1, 1, 1,
-0.3646134, 0.1572219, -0.1304776, 1, 1, 1, 1, 1,
-0.362775, 0.7384958, 0.9223419, 1, 1, 1, 1, 1,
-0.3626154, 1.795181, 0.3025243, 1, 1, 1, 1, 1,
-0.3613597, -0.3031884, -0.9005778, 1, 1, 1, 1, 1,
-0.3601348, -0.387373, -1.692713, 1, 1, 1, 1, 1,
-0.354268, 0.2988667, -1.289159, 1, 1, 1, 1, 1,
-0.3531927, -0.1106863, -1.462357, 1, 1, 1, 1, 1,
-0.3526881, 0.2061085, -1.361748, 0, 0, 1, 1, 1,
-0.3306136, -0.5798621, -1.944601, 1, 0, 0, 1, 1,
-0.3305655, 0.09894066, -1.405231, 1, 0, 0, 1, 1,
-0.3290795, 0.2654607, -0.4417616, 1, 0, 0, 1, 1,
-0.328613, -1.409619, -2.786035, 1, 0, 0, 1, 1,
-0.3232171, 1.201434, 0.5337747, 1, 0, 0, 1, 1,
-0.3231481, 1.221848, -0.9094392, 0, 0, 0, 1, 1,
-0.322671, -0.7616435, -2.421143, 0, 0, 0, 1, 1,
-0.3214552, 0.3383985, -0.801937, 0, 0, 0, 1, 1,
-0.3201105, 0.7327092, -0.9306967, 0, 0, 0, 1, 1,
-0.3142599, 1.856815, 0.7155709, 0, 0, 0, 1, 1,
-0.3090618, -0.205956, 0.1892014, 0, 0, 0, 1, 1,
-0.3063747, -2.816491, -3.26615, 0, 0, 0, 1, 1,
-0.3062245, 0.6913534, -1.895449, 1, 1, 1, 1, 1,
-0.3061534, 1.163127, 0.6228681, 1, 1, 1, 1, 1,
-0.3033828, -1.500427, -0.5596208, 1, 1, 1, 1, 1,
-0.3024027, -0.02319203, -3.123152, 1, 1, 1, 1, 1,
-0.2997121, -0.6553165, -4.189626, 1, 1, 1, 1, 1,
-0.2899287, 0.6473931, -0.9238377, 1, 1, 1, 1, 1,
-0.2776856, 0.3738883, -0.8941426, 1, 1, 1, 1, 1,
-0.2721766, 1.568612, -1.500802, 1, 1, 1, 1, 1,
-0.2716635, 1.285045, -0.3887542, 1, 1, 1, 1, 1,
-0.2696927, 0.09750964, -0.08905237, 1, 1, 1, 1, 1,
-0.2672448, 0.1129961, 0.01231106, 1, 1, 1, 1, 1,
-0.2562956, -0.6266803, -3.115997, 1, 1, 1, 1, 1,
-0.2534733, 0.5754824, -0.1242134, 1, 1, 1, 1, 1,
-0.2505245, -0.2300769, -2.763211, 1, 1, 1, 1, 1,
-0.2321273, 0.4640983, 0.6153708, 1, 1, 1, 1, 1,
-0.2311422, 0.7745436, 1.246167, 0, 0, 1, 1, 1,
-0.2193998, 0.6890763, -0.05651483, 1, 0, 0, 1, 1,
-0.2149758, -0.4756938, -4.401948, 1, 0, 0, 1, 1,
-0.2145042, 0.755697, 0.2925134, 1, 0, 0, 1, 1,
-0.2068391, -0.1289892, -3.66808, 1, 0, 0, 1, 1,
-0.1977389, -1.208881, -4.046991, 1, 0, 0, 1, 1,
-0.1949551, -1.213205, -3.260458, 0, 0, 0, 1, 1,
-0.1930705, 0.7486742, -1.683862, 0, 0, 0, 1, 1,
-0.1795583, -0.549328, -2.769016, 0, 0, 0, 1, 1,
-0.1790818, -0.7679569, -4.731168, 0, 0, 0, 1, 1,
-0.1741457, 0.4386561, 0.05177486, 0, 0, 0, 1, 1,
-0.1718935, 0.8195292, -0.4679879, 0, 0, 0, 1, 1,
-0.1716596, 0.8961359, -0.09704883, 0, 0, 0, 1, 1,
-0.1703083, -0.2243108, -1.444109, 1, 1, 1, 1, 1,
-0.1664123, -0.8251712, -4.442003, 1, 1, 1, 1, 1,
-0.1655689, -0.8002498, -3.107719, 1, 1, 1, 1, 1,
-0.1651929, 0.1732544, -0.6298762, 1, 1, 1, 1, 1,
-0.1634007, -0.7354951, -2.949895, 1, 1, 1, 1, 1,
-0.1606577, 1.412917, 0.1518409, 1, 1, 1, 1, 1,
-0.1582233, -0.05936262, -2.345253, 1, 1, 1, 1, 1,
-0.1571983, 0.0843842, -0.8573499, 1, 1, 1, 1, 1,
-0.1563536, 1.727273, 1.491329, 1, 1, 1, 1, 1,
-0.1561213, 0.09482022, -1.005847, 1, 1, 1, 1, 1,
-0.1550021, -0.610957, -2.465565, 1, 1, 1, 1, 1,
-0.1544127, 2.22201, -0.7463847, 1, 1, 1, 1, 1,
-0.1535598, 1.426008, -1.559048, 1, 1, 1, 1, 1,
-0.1521989, 0.5056199, -0.9623607, 1, 1, 1, 1, 1,
-0.1518202, 1.375348, 0.1872169, 1, 1, 1, 1, 1,
-0.1443443, 0.08784085, -0.7191438, 0, 0, 1, 1, 1,
-0.1389412, -0.3309129, -1.689205, 1, 0, 0, 1, 1,
-0.137526, -0.4074067, -2.129329, 1, 0, 0, 1, 1,
-0.1349121, 0.3626459, 1.576956, 1, 0, 0, 1, 1,
-0.1332274, -1.12906, -3.65944, 1, 0, 0, 1, 1,
-0.1306689, -1.592391, -1.196767, 1, 0, 0, 1, 1,
-0.1293935, 0.8529097, -2.32248, 0, 0, 0, 1, 1,
-0.1234758, -1.075989, -2.613412, 0, 0, 0, 1, 1,
-0.123311, -0.6149254, -4.049207, 0, 0, 0, 1, 1,
-0.1226356, 1.914155, -0.5162492, 0, 0, 0, 1, 1,
-0.1218681, 2.089623, -0.5460275, 0, 0, 0, 1, 1,
-0.1205002, -0.7112914, -1.565451, 0, 0, 0, 1, 1,
-0.1191065, -0.8327413, -3.474642, 0, 0, 0, 1, 1,
-0.1190353, 0.231359, -1.832458, 1, 1, 1, 1, 1,
-0.1163297, -0.2830714, -2.53894, 1, 1, 1, 1, 1,
-0.1159444, 1.464361, -1.305723, 1, 1, 1, 1, 1,
-0.1147562, 0.009529386, -1.964193, 1, 1, 1, 1, 1,
-0.1117825, 1.038327, 1.028041, 1, 1, 1, 1, 1,
-0.1116453, 0.008587241, -3.047989, 1, 1, 1, 1, 1,
-0.1115941, 0.8033071, 0.857677, 1, 1, 1, 1, 1,
-0.1091001, 1.028695, -1.378382, 1, 1, 1, 1, 1,
-0.1060723, 0.3820689, -1.583149, 1, 1, 1, 1, 1,
-0.1055436, 0.7462013, 0.2080148, 1, 1, 1, 1, 1,
-0.0984801, -0.4207309, -3.529262, 1, 1, 1, 1, 1,
-0.0953946, 0.8883541, -0.3288046, 1, 1, 1, 1, 1,
-0.09402131, 0.09330254, -1.141142, 1, 1, 1, 1, 1,
-0.09393506, 1.040462, -0.1022119, 1, 1, 1, 1, 1,
-0.09316742, 0.05542428, -1.078219, 1, 1, 1, 1, 1,
-0.09297619, 1.209127, 0.8828704, 0, 0, 1, 1, 1,
-0.09296692, 1.172132, -1.505882, 1, 0, 0, 1, 1,
-0.09243856, 1.057902, -2.005061, 1, 0, 0, 1, 1,
-0.09090335, 1.347631, -0.3158585, 1, 0, 0, 1, 1,
-0.08047374, -0.8727829, -2.388666, 1, 0, 0, 1, 1,
-0.07701228, -0.1375881, -3.276273, 1, 0, 0, 1, 1,
-0.07474895, -0.8125116, -2.466218, 0, 0, 0, 1, 1,
-0.07405505, 0.6823212, 1.012371, 0, 0, 0, 1, 1,
-0.07261929, 0.5955109, -0.8245289, 0, 0, 0, 1, 1,
-0.07251505, -1.885805, -2.954979, 0, 0, 0, 1, 1,
-0.07131852, 1.011479, 0.2526747, 0, 0, 0, 1, 1,
-0.07086347, 0.6405668, 0.551078, 0, 0, 0, 1, 1,
-0.07026569, 0.721947, -0.703254, 0, 0, 0, 1, 1,
-0.06958047, 0.533673, -0.7914685, 1, 1, 1, 1, 1,
-0.06534604, 1.490386, -0.1433445, 1, 1, 1, 1, 1,
-0.06452794, -1.402876, -3.842514, 1, 1, 1, 1, 1,
-0.0618677, -1.229014, -2.801571, 1, 1, 1, 1, 1,
-0.06069064, 0.8063985, 0.2397604, 1, 1, 1, 1, 1,
-0.06056335, 0.06540404, -1.728405, 1, 1, 1, 1, 1,
-0.05874614, 0.1674122, 0.4822832, 1, 1, 1, 1, 1,
-0.04705165, 0.2251181, -1.002111, 1, 1, 1, 1, 1,
-0.0453424, -0.7328107, -3.016237, 1, 1, 1, 1, 1,
-0.04524266, -0.330514, -2.085223, 1, 1, 1, 1, 1,
-0.03794273, 1.101128, -0.2718703, 1, 1, 1, 1, 1,
-0.03247311, 1.251512, -0.3893504, 1, 1, 1, 1, 1,
-0.03219758, 0.6609956, -0.4607299, 1, 1, 1, 1, 1,
-0.03016273, -0.6168382, -4.413819, 1, 1, 1, 1, 1,
-0.02883519, -0.3101975, -3.156706, 1, 1, 1, 1, 1,
-0.02626641, -1.018305, -3.593417, 0, 0, 1, 1, 1,
-0.02569473, -1.199413, -4.260589, 1, 0, 0, 1, 1,
-0.02450221, 1.021649, 1.36246, 1, 0, 0, 1, 1,
-0.02227972, -0.6580392, -3.204564, 1, 0, 0, 1, 1,
-0.01891351, 0.6922802, -1.770414, 1, 0, 0, 1, 1,
-0.01769156, -0.1750377, -1.852838, 1, 0, 0, 1, 1,
-0.01721801, -0.04899109, -2.871874, 0, 0, 0, 1, 1,
-0.01534331, -1.683328, -1.968668, 0, 0, 0, 1, 1,
-0.01399776, 0.3624144, -0.2843823, 0, 0, 0, 1, 1,
-0.01183874, 2.013682, 0.01265363, 0, 0, 0, 1, 1,
-0.01109937, -0.2524469, -1.777393, 0, 0, 0, 1, 1,
-0.009151232, -2.50958, -1.161256, 0, 0, 0, 1, 1,
-0.00808411, 0.4762802, -0.02563311, 0, 0, 0, 1, 1,
0.000819044, -0.4786213, 3.02562, 1, 1, 1, 1, 1,
0.00234999, 0.7552668, 0.5153422, 1, 1, 1, 1, 1,
0.002439589, 0.1938428, 1.656565, 1, 1, 1, 1, 1,
0.003434044, 0.515547, 1.243952, 1, 1, 1, 1, 1,
0.004306194, 0.2895836, 0.2328264, 1, 1, 1, 1, 1,
0.00998449, 0.1904965, 1.298328, 1, 1, 1, 1, 1,
0.01472181, 1.023611, 0.3277627, 1, 1, 1, 1, 1,
0.01601581, 1.714442, -0.2027578, 1, 1, 1, 1, 1,
0.01660912, -0.2576104, 4.469582, 1, 1, 1, 1, 1,
0.01902745, -1.261804, 4.072461, 1, 1, 1, 1, 1,
0.02052757, -1.102276, 4.065023, 1, 1, 1, 1, 1,
0.02099755, -0.5012917, 3.376247, 1, 1, 1, 1, 1,
0.02339964, 0.1446138, 2.311913, 1, 1, 1, 1, 1,
0.02505159, -0.2662828, 3.131348, 1, 1, 1, 1, 1,
0.02956717, -0.09041071, 3.259538, 1, 1, 1, 1, 1,
0.03229462, 1.771915, 1.203702, 0, 0, 1, 1, 1,
0.03379307, -0.9075675, 2.391193, 1, 0, 0, 1, 1,
0.04215601, -0.3320956, 1.952124, 1, 0, 0, 1, 1,
0.04984744, -0.5094441, 4.305575, 1, 0, 0, 1, 1,
0.05593297, 0.8470104, -1.040728, 1, 0, 0, 1, 1,
0.05703417, -1.552123, 4.66079, 1, 0, 0, 1, 1,
0.05750031, 1.387267, -1.149845, 0, 0, 0, 1, 1,
0.05934066, -2.07411, 2.590705, 0, 0, 0, 1, 1,
0.06949757, -2.163299, 2.895336, 0, 0, 0, 1, 1,
0.07037313, 0.9649765, -0.6172237, 0, 0, 0, 1, 1,
0.07192368, -2.017199, 2.741999, 0, 0, 0, 1, 1,
0.08084329, 1.833665, -0.2331522, 0, 0, 0, 1, 1,
0.0860341, -0.5875311, 2.645324, 0, 0, 0, 1, 1,
0.08741385, 0.1101837, 0.8029022, 1, 1, 1, 1, 1,
0.08915281, -0.1747236, 3.326009, 1, 1, 1, 1, 1,
0.08937395, 0.5809495, 0.2562505, 1, 1, 1, 1, 1,
0.08996416, -1.286497, 2.8994, 1, 1, 1, 1, 1,
0.09431253, -1.26484, 3.995924, 1, 1, 1, 1, 1,
0.1038425, -0.4091671, 2.417458, 1, 1, 1, 1, 1,
0.1052965, -2.256476, 3.865075, 1, 1, 1, 1, 1,
0.1057346, -0.4295579, 5.096663, 1, 1, 1, 1, 1,
0.1080861, 0.834166, 1.465068, 1, 1, 1, 1, 1,
0.1091055, -0.8996909, 4.355487, 1, 1, 1, 1, 1,
0.1148133, -0.6385126, 1.445905, 1, 1, 1, 1, 1,
0.1152553, 1.037015, 0.3371621, 1, 1, 1, 1, 1,
0.1167386, 0.4061792, -1.152742, 1, 1, 1, 1, 1,
0.118169, -0.01088905, 2.703681, 1, 1, 1, 1, 1,
0.1195125, 0.7070442, -0.2149834, 1, 1, 1, 1, 1,
0.1233711, 1.838684, -1.236138, 0, 0, 1, 1, 1,
0.1239916, -0.4154183, 3.901741, 1, 0, 0, 1, 1,
0.1276601, -1.470681, 2.573352, 1, 0, 0, 1, 1,
0.1294252, 1.593024, 1.016319, 1, 0, 0, 1, 1,
0.1316088, 0.5353279, 2.445892, 1, 0, 0, 1, 1,
0.1367151, -0.187865, 4.511741, 1, 0, 0, 1, 1,
0.1371816, 1.303812, 2.308087, 0, 0, 0, 1, 1,
0.137577, 1.714399, 0.2327055, 0, 0, 0, 1, 1,
0.1388886, 1.496782, -0.9426817, 0, 0, 0, 1, 1,
0.1422389, -0.5104248, 3.91118, 0, 0, 0, 1, 1,
0.1435603, -2.000855, 3.863233, 0, 0, 0, 1, 1,
0.1447386, -1.232273, 2.637796, 0, 0, 0, 1, 1,
0.1490133, -0.7096511, 3.017473, 0, 0, 0, 1, 1,
0.150339, 0.4755636, -0.3592617, 1, 1, 1, 1, 1,
0.1558786, 1.007524, -1.157034, 1, 1, 1, 1, 1,
0.1637282, -0.3731242, 3.854728, 1, 1, 1, 1, 1,
0.1650994, 1.038148, 1.242701, 1, 1, 1, 1, 1,
0.1700376, -0.2068846, 1.860991, 1, 1, 1, 1, 1,
0.170349, 1.065696, 1.034681, 1, 1, 1, 1, 1,
0.1818775, 0.8022769, 0.04422963, 1, 1, 1, 1, 1,
0.1875387, 0.2196634, 0.9681683, 1, 1, 1, 1, 1,
0.191192, -0.1438309, 3.125713, 1, 1, 1, 1, 1,
0.1935346, 0.7758976, -0.4841266, 1, 1, 1, 1, 1,
0.1987621, 1.239279, -0.03709223, 1, 1, 1, 1, 1,
0.1993665, -0.9606184, 1.417658, 1, 1, 1, 1, 1,
0.1996759, -0.06363035, 2.820068, 1, 1, 1, 1, 1,
0.2012281, 0.5182815, 0.4283455, 1, 1, 1, 1, 1,
0.2047509, 1.101748, 2.018062, 1, 1, 1, 1, 1,
0.2053266, -2.437403, 2.102349, 0, 0, 1, 1, 1,
0.2054653, -1.661511, 2.879288, 1, 0, 0, 1, 1,
0.2089158, 0.1223099, 0.6015606, 1, 0, 0, 1, 1,
0.2117674, -1.289233, 2.471673, 1, 0, 0, 1, 1,
0.2124661, -0.04505047, 2.490788, 1, 0, 0, 1, 1,
0.214821, -0.4585932, 1.666474, 1, 0, 0, 1, 1,
0.221529, 0.8660587, 2.472481, 0, 0, 0, 1, 1,
0.2216396, 0.7510657, 0.8407929, 0, 0, 0, 1, 1,
0.2226078, 0.249447, -0.7615404, 0, 0, 0, 1, 1,
0.2276241, -0.05349787, 2.929498, 0, 0, 0, 1, 1,
0.227633, -0.3017992, 2.543367, 0, 0, 0, 1, 1,
0.2473545, 0.1324612, 0.9673923, 0, 0, 0, 1, 1,
0.2515667, 0.9698494, -0.9587195, 0, 0, 0, 1, 1,
0.2547557, -0.7696766, 2.875017, 1, 1, 1, 1, 1,
0.2586105, 1.395588, 2.184356, 1, 1, 1, 1, 1,
0.2593334, 0.7466778, -0.3505991, 1, 1, 1, 1, 1,
0.2602768, 1.195165, 0.05518151, 1, 1, 1, 1, 1,
0.260674, 0.3805024, 0.3625454, 1, 1, 1, 1, 1,
0.2623754, 0.591392, -0.7107058, 1, 1, 1, 1, 1,
0.2626516, 1.301929, 0.1007625, 1, 1, 1, 1, 1,
0.2645504, 0.2804462, -0.6379322, 1, 1, 1, 1, 1,
0.2648661, -0.315393, 1.566889, 1, 1, 1, 1, 1,
0.2681528, 0.3245123, 2.566511, 1, 1, 1, 1, 1,
0.2690175, -0.6817024, 2.569929, 1, 1, 1, 1, 1,
0.2695188, 0.005928051, 1.923986, 1, 1, 1, 1, 1,
0.2700326, 0.01456423, 1.6618, 1, 1, 1, 1, 1,
0.2707587, 0.1197655, 2.812042, 1, 1, 1, 1, 1,
0.2773897, -2.291216, 2.1577, 1, 1, 1, 1, 1,
0.2805437, -0.897364, 2.572286, 0, 0, 1, 1, 1,
0.2809223, -0.2900511, 2.459565, 1, 0, 0, 1, 1,
0.2844689, -0.2910397, -0.7859505, 1, 0, 0, 1, 1,
0.2864125, -0.9007959, 1.555761, 1, 0, 0, 1, 1,
0.2910321, 0.2518625, -0.3213416, 1, 0, 0, 1, 1,
0.2915709, 0.1961293, 0.6879796, 1, 0, 0, 1, 1,
0.2918598, -0.7835857, 4.30154, 0, 0, 0, 1, 1,
0.2928391, 2.196508, 0.2460129, 0, 0, 0, 1, 1,
0.2947449, 0.9717221, 2.034962, 0, 0, 0, 1, 1,
0.3014377, -0.5656072, 2.995555, 0, 0, 0, 1, 1,
0.3020809, -0.187942, 3.137973, 0, 0, 0, 1, 1,
0.3021519, -0.433152, 3.074413, 0, 0, 0, 1, 1,
0.3051627, -0.3902778, 1.255049, 0, 0, 0, 1, 1,
0.3059915, 0.01645335, 1.870119, 1, 1, 1, 1, 1,
0.3082321, 0.2159643, 1.30809, 1, 1, 1, 1, 1,
0.3086802, 0.2861263, 3.925307, 1, 1, 1, 1, 1,
0.3174181, 0.8871382, -0.735642, 1, 1, 1, 1, 1,
0.3194272, 0.4111144, -0.03081156, 1, 1, 1, 1, 1,
0.3217036, -0.4191615, 1.881832, 1, 1, 1, 1, 1,
0.3247424, 1.031585, -0.01487238, 1, 1, 1, 1, 1,
0.3250436, -0.5830551, 3.546704, 1, 1, 1, 1, 1,
0.3267248, -1.177209, 4.200572, 1, 1, 1, 1, 1,
0.3270617, 0.4685924, -0.1227211, 1, 1, 1, 1, 1,
0.3330565, -0.4020567, 2.664695, 1, 1, 1, 1, 1,
0.3394815, -1.24099, 3.528939, 1, 1, 1, 1, 1,
0.3405299, -1.465723, 2.623555, 1, 1, 1, 1, 1,
0.3414907, -0.06601134, 1.936436, 1, 1, 1, 1, 1,
0.3481736, 1.417368, -0.3203146, 1, 1, 1, 1, 1,
0.3507963, 0.0710402, 1.366996, 0, 0, 1, 1, 1,
0.3546176, 0.08518858, 0.5636087, 1, 0, 0, 1, 1,
0.354878, 1.541216, -0.3071875, 1, 0, 0, 1, 1,
0.3577419, 0.2539566, 0.2681092, 1, 0, 0, 1, 1,
0.3592801, -0.6360403, 1.931337, 1, 0, 0, 1, 1,
0.3648066, -0.1953034, 1.402191, 1, 0, 0, 1, 1,
0.3676193, -0.2642988, 4.167665, 0, 0, 0, 1, 1,
0.3763867, 1.078639, -0.9667349, 0, 0, 0, 1, 1,
0.3776959, 0.9194467, 1.247728, 0, 0, 0, 1, 1,
0.3779188, 0.6847129, 0.4952332, 0, 0, 0, 1, 1,
0.3795909, -1.693165, 3.080855, 0, 0, 0, 1, 1,
0.3894672, 0.143124, 2.642573, 0, 0, 0, 1, 1,
0.3900158, -1.176446, 2.592837, 0, 0, 0, 1, 1,
0.3924749, 0.1694181, 2.021011, 1, 1, 1, 1, 1,
0.3954219, 0.5765425, 1.033564, 1, 1, 1, 1, 1,
0.3956645, 2.407424, -1.819888, 1, 1, 1, 1, 1,
0.4014405, 0.4662338, 0.5881446, 1, 1, 1, 1, 1,
0.4015129, -0.1047703, 1.527833, 1, 1, 1, 1, 1,
0.4063083, 1.065841, 0.7481149, 1, 1, 1, 1, 1,
0.4091944, -0.1760691, 3.048343, 1, 1, 1, 1, 1,
0.4099791, -0.04499277, 2.432195, 1, 1, 1, 1, 1,
0.4104603, 0.3815429, 1.367113, 1, 1, 1, 1, 1,
0.4109433, -1.040994, 3.039572, 1, 1, 1, 1, 1,
0.4114833, 0.2323883, 1.402369, 1, 1, 1, 1, 1,
0.4128748, 0.3753664, 2.173482, 1, 1, 1, 1, 1,
0.4160193, 0.1272116, -0.3100882, 1, 1, 1, 1, 1,
0.4275799, -0.54921, 3.92116, 1, 1, 1, 1, 1,
0.4281234, -1.480129, 3.313232, 1, 1, 1, 1, 1,
0.4305568, 0.1535593, 1.762361, 0, 0, 1, 1, 1,
0.4334162, 0.2295303, -0.9625431, 1, 0, 0, 1, 1,
0.4361537, -0.03092813, 1.524444, 1, 0, 0, 1, 1,
0.4436347, -1.024856, 3.1863, 1, 0, 0, 1, 1,
0.4441161, 0.9263839, 0.7628733, 1, 0, 0, 1, 1,
0.4452338, 0.4777186, 0.4108623, 1, 0, 0, 1, 1,
0.4464071, 0.1232633, 1.042801, 0, 0, 0, 1, 1,
0.4477777, -0.9575083, 4.219814, 0, 0, 0, 1, 1,
0.4495549, -0.5104612, 3.4926, 0, 0, 0, 1, 1,
0.4505544, -1.503775, 4.691311, 0, 0, 0, 1, 1,
0.4550175, 0.9833369, 1.79829, 0, 0, 0, 1, 1,
0.4559067, -0.6323069, 3.019097, 0, 0, 0, 1, 1,
0.4566462, -0.4427957, 3.490726, 0, 0, 0, 1, 1,
0.4570082, 0.1551693, 1.246656, 1, 1, 1, 1, 1,
0.458362, -0.771111, 1.015736, 1, 1, 1, 1, 1,
0.4586914, 0.7062609, 0.2385689, 1, 1, 1, 1, 1,
0.46069, 0.5755482, -0.174022, 1, 1, 1, 1, 1,
0.4633855, -0.250562, 5.231305, 1, 1, 1, 1, 1,
0.4646432, -0.3296621, 3.483135, 1, 1, 1, 1, 1,
0.4661666, -0.09230205, 1.08216, 1, 1, 1, 1, 1,
0.4667193, -0.5635282, 2.82275, 1, 1, 1, 1, 1,
0.4687492, -0.412937, 3.414273, 1, 1, 1, 1, 1,
0.4731176, -2.777996, 3.703323, 1, 1, 1, 1, 1,
0.4749157, 0.1805838, 2.718057, 1, 1, 1, 1, 1,
0.4778967, 0.7778696, -0.8623944, 1, 1, 1, 1, 1,
0.4795251, -0.204925, 2.533514, 1, 1, 1, 1, 1,
0.4838601, 0.2773242, 1.631955, 1, 1, 1, 1, 1,
0.4851938, 0.5390021, 0.3493753, 1, 1, 1, 1, 1,
0.4883116, 0.8291156, 1.046375, 0, 0, 1, 1, 1,
0.5040923, -0.7958217, 3.783579, 1, 0, 0, 1, 1,
0.5068234, 0.4054502, 2.014438, 1, 0, 0, 1, 1,
0.5080736, 0.5442421, 0.5259511, 1, 0, 0, 1, 1,
0.5094268, -1.307859, 2.797272, 1, 0, 0, 1, 1,
0.5184573, 0.09754846, 1.308057, 1, 0, 0, 1, 1,
0.5263038, -2.108802, 1.32088, 0, 0, 0, 1, 1,
0.5306643, -0.6595524, 3.08443, 0, 0, 0, 1, 1,
0.5356506, 0.7587456, 1.278492, 0, 0, 0, 1, 1,
0.5467623, -0.5912133, 1.747062, 0, 0, 0, 1, 1,
0.5485514, -0.4318435, 2.659268, 0, 0, 0, 1, 1,
0.5504014, 0.08286446, 0.9146269, 0, 0, 0, 1, 1,
0.5519853, -0.759993, 1.715349, 0, 0, 0, 1, 1,
0.55281, 0.5136449, 0.820464, 1, 1, 1, 1, 1,
0.5535149, 1.442561, -0.6837587, 1, 1, 1, 1, 1,
0.5567793, 0.6757074, -0.1207871, 1, 1, 1, 1, 1,
0.5598918, -0.200698, 4.180132, 1, 1, 1, 1, 1,
0.56327, -0.7419803, 3.226007, 1, 1, 1, 1, 1,
0.5715665, 0.4280385, 0.02692185, 1, 1, 1, 1, 1,
0.5796653, -0.716607, 3.41043, 1, 1, 1, 1, 1,
0.5820243, 1.000123, 0.09695602, 1, 1, 1, 1, 1,
0.5826301, 0.02460393, 0.9851077, 1, 1, 1, 1, 1,
0.5845888, 0.3058865, -0.4704704, 1, 1, 1, 1, 1,
0.601905, -0.349768, 2.630899, 1, 1, 1, 1, 1,
0.604548, 0.09865642, 1.126212, 1, 1, 1, 1, 1,
0.6091269, 0.6699763, 0.4118718, 1, 1, 1, 1, 1,
0.6124, 2.311844, 1.126254, 1, 1, 1, 1, 1,
0.613144, 0.7035331, 1.09294, 1, 1, 1, 1, 1,
0.6145931, -2.736065, 2.423561, 0, 0, 1, 1, 1,
0.6149768, -2.153167, 2.685648, 1, 0, 0, 1, 1,
0.6153546, 0.3890241, 0.2698661, 1, 0, 0, 1, 1,
0.6177438, -0.8766965, 3.094426, 1, 0, 0, 1, 1,
0.617774, -0.9578574, 3.20003, 1, 0, 0, 1, 1,
0.6188185, -0.4401132, 2.084508, 1, 0, 0, 1, 1,
0.6197739, 2.194497, -0.4358226, 0, 0, 0, 1, 1,
0.6199506, 0.6177587, 0.6720698, 0, 0, 0, 1, 1,
0.6232105, -1.082166, 1.500507, 0, 0, 0, 1, 1,
0.6350762, 1.490288, -0.2861029, 0, 0, 0, 1, 1,
0.6413694, -1.653081, 1.907551, 0, 0, 0, 1, 1,
0.6443799, -0.2730176, 2.992057, 0, 0, 0, 1, 1,
0.6497004, 1.391486, -1.571481, 0, 0, 0, 1, 1,
0.6510862, -0.4534262, 3.608838, 1, 1, 1, 1, 1,
0.6513209, -0.1441715, 2.122156, 1, 1, 1, 1, 1,
0.6518151, -1.172247, 3.364514, 1, 1, 1, 1, 1,
0.653868, 0.565744, 2.219496, 1, 1, 1, 1, 1,
0.6557572, 1.08606, 0.1728654, 1, 1, 1, 1, 1,
0.6593375, 0.8390449, -2.406908, 1, 1, 1, 1, 1,
0.6598027, -1.707249, 3.859522, 1, 1, 1, 1, 1,
0.6638579, 0.3498863, 0.2760785, 1, 1, 1, 1, 1,
0.6663906, 0.5098698, 0.03786038, 1, 1, 1, 1, 1,
0.6671836, -0.07363282, 1.656974, 1, 1, 1, 1, 1,
0.6672521, 0.9691886, -0.5037426, 1, 1, 1, 1, 1,
0.6696681, -1.041812, -0.5652668, 1, 1, 1, 1, 1,
0.6717235, -0.5766179, 2.013956, 1, 1, 1, 1, 1,
0.6735676, -0.1172373, 0.8546323, 1, 1, 1, 1, 1,
0.6757675, 0.1685308, 0.466861, 1, 1, 1, 1, 1,
0.6810057, -0.3716522, 0.9333161, 0, 0, 1, 1, 1,
0.681159, -0.3002812, 1.4427, 1, 0, 0, 1, 1,
0.683318, 0.8956048, 0.8675658, 1, 0, 0, 1, 1,
0.6868877, -0.8946419, 2.524685, 1, 0, 0, 1, 1,
0.6901875, 1.167955, -0.3081162, 1, 0, 0, 1, 1,
0.6921862, -0.8642188, 2.276984, 1, 0, 0, 1, 1,
0.6927882, 1.895087, -1.829093, 0, 0, 0, 1, 1,
0.6965006, 0.6980707, 0.2346821, 0, 0, 0, 1, 1,
0.6981013, 0.2562159, 1.893726, 0, 0, 0, 1, 1,
0.6991145, 1.88586, -1.237397, 0, 0, 0, 1, 1,
0.7010989, 0.7136486, 2.258867, 0, 0, 0, 1, 1,
0.7043496, -1.124465, 3.259804, 0, 0, 0, 1, 1,
0.7044589, -0.531208, 2.16477, 0, 0, 0, 1, 1,
0.7045776, -1.676199, 2.375045, 1, 1, 1, 1, 1,
0.7074897, -1.587855, 2.529208, 1, 1, 1, 1, 1,
0.708183, 1.013625, 1.784951, 1, 1, 1, 1, 1,
0.7112401, -0.300306, 2.617085, 1, 1, 1, 1, 1,
0.7175829, -0.2929409, 2.109994, 1, 1, 1, 1, 1,
0.7246162, 0.729736, 0.106913, 1, 1, 1, 1, 1,
0.7295634, 0.08089752, 1.143298, 1, 1, 1, 1, 1,
0.7318158, -0.7696652, 4.221009, 1, 1, 1, 1, 1,
0.7377638, 0.8148986, 1.510027, 1, 1, 1, 1, 1,
0.7510353, -1.940989, 3.397977, 1, 1, 1, 1, 1,
0.754465, 0.1097849, 2.167861, 1, 1, 1, 1, 1,
0.7548631, -0.01755586, 0.8991438, 1, 1, 1, 1, 1,
0.7667027, 0.03366584, -0.02236013, 1, 1, 1, 1, 1,
0.7687404, 2.16795, 0.4250123, 1, 1, 1, 1, 1,
0.7704001, 0.8265805, 1.147155, 1, 1, 1, 1, 1,
0.7724977, 0.04425679, 1.237696, 0, 0, 1, 1, 1,
0.7745478, -1.508997, 2.401731, 1, 0, 0, 1, 1,
0.7751136, -0.4360322, 4.117611, 1, 0, 0, 1, 1,
0.7761971, 0.4281769, 1.516889, 1, 0, 0, 1, 1,
0.7766261, -1.337898, 0.0501042, 1, 0, 0, 1, 1,
0.7770282, 0.7095248, -1.745028, 1, 0, 0, 1, 1,
0.7806587, 0.5963219, -0.4603791, 0, 0, 0, 1, 1,
0.7836044, -1.003062, 2.601254, 0, 0, 0, 1, 1,
0.787137, 0.7257165, 1.083445, 0, 0, 0, 1, 1,
0.7906778, 1.346298, 0.5489692, 0, 0, 0, 1, 1,
0.7949535, -0.321805, 1.219904, 0, 0, 0, 1, 1,
0.7954612, -0.1596192, 1.592344, 0, 0, 0, 1, 1,
0.7961454, 0.01340159, 1.472152, 0, 0, 0, 1, 1,
0.800988, -0.02878252, 1.590556, 1, 1, 1, 1, 1,
0.8038566, 0.4724153, 1.722219, 1, 1, 1, 1, 1,
0.8196266, -0.4447456, 1.524924, 1, 1, 1, 1, 1,
0.8202192, 2.023336, -1.306599, 1, 1, 1, 1, 1,
0.8314002, 1.11229, 1.413786, 1, 1, 1, 1, 1,
0.8349316, -2.520271, 3.766877, 1, 1, 1, 1, 1,
0.8399714, -0.6995665, 0.5663382, 1, 1, 1, 1, 1,
0.844171, 0.8175217, 0.227021, 1, 1, 1, 1, 1,
0.8450634, 0.8769016, -0.567347, 1, 1, 1, 1, 1,
0.8463116, 0.02589789, 1.986044, 1, 1, 1, 1, 1,
0.8469139, -0.6852183, 0.5710196, 1, 1, 1, 1, 1,
0.846953, -0.1720445, 1.375561, 1, 1, 1, 1, 1,
0.8482196, -0.5121279, 3.797273, 1, 1, 1, 1, 1,
0.8495305, 0.09591997, 1.405842, 1, 1, 1, 1, 1,
0.8505118, -1.242334, 2.682363, 1, 1, 1, 1, 1,
0.8506685, 0.09529877, 2.909711, 0, 0, 1, 1, 1,
0.8680532, 1.534304, -1.082469, 1, 0, 0, 1, 1,
0.8682624, 0.6794984, 0.9097981, 1, 0, 0, 1, 1,
0.8689405, 1.067701, 0.2718627, 1, 0, 0, 1, 1,
0.8726001, 2.674794, 0.7288011, 1, 0, 0, 1, 1,
0.8807027, 0.04529965, 0.9174662, 1, 0, 0, 1, 1,
0.8819773, 0.1301274, 1.42903, 0, 0, 0, 1, 1,
0.8851448, -0.1453859, 1.704353, 0, 0, 0, 1, 1,
0.8869911, -0.9504359, 2.672408, 0, 0, 0, 1, 1,
0.8886813, 0.6424329, 1.874961, 0, 0, 0, 1, 1,
0.8909331, -1.06321, 2.74971, 0, 0, 0, 1, 1,
0.8928089, 0.1249023, 0.3206255, 0, 0, 0, 1, 1,
0.8958588, -0.5917557, 1.839791, 0, 0, 0, 1, 1,
0.8975277, 0.6122559, 0.4478489, 1, 1, 1, 1, 1,
0.9026895, -1.139483, 3.826585, 1, 1, 1, 1, 1,
0.908214, -0.6633565, 2.450767, 1, 1, 1, 1, 1,
0.9149317, 0.8677111, 1.078352, 1, 1, 1, 1, 1,
0.9159352, -0.8404878, 2.76116, 1, 1, 1, 1, 1,
0.9172716, 0.3534704, 1.113671, 1, 1, 1, 1, 1,
0.9249839, 0.5938292, 1.459584, 1, 1, 1, 1, 1,
0.9281452, -0.5645913, 2.10252, 1, 1, 1, 1, 1,
0.9304421, 0.6122435, 0.5498933, 1, 1, 1, 1, 1,
0.9305345, 0.9097263, 1.445066, 1, 1, 1, 1, 1,
0.936752, 0.5966731, 1.552091, 1, 1, 1, 1, 1,
0.9374597, -0.8680171, 2.814772, 1, 1, 1, 1, 1,
0.9374968, -0.5470302, 2.883769, 1, 1, 1, 1, 1,
0.9394549, -1.381142, 3.263181, 1, 1, 1, 1, 1,
0.940724, 0.7401494, -0.6944256, 1, 1, 1, 1, 1,
0.9414178, 0.7445932, 2.030205, 0, 0, 1, 1, 1,
0.9420542, -0.3070146, 1.70394, 1, 0, 0, 1, 1,
0.9422559, 1.562778, 0.133388, 1, 0, 0, 1, 1,
0.9447891, -1.750487, 2.621968, 1, 0, 0, 1, 1,
0.9490148, 1.564084, 1.789562, 1, 0, 0, 1, 1,
0.9538442, 0.4190654, 1.258378, 1, 0, 0, 1, 1,
0.9581873, 0.4451014, 0.05929341, 0, 0, 0, 1, 1,
0.9597757, 1.337057, -1.756632, 0, 0, 0, 1, 1,
0.9606899, 0.3599699, 3.34705, 0, 0, 0, 1, 1,
0.9614497, 0.5758885, 1.612966, 0, 0, 0, 1, 1,
0.9631147, 1.344198, 1.017729, 0, 0, 0, 1, 1,
0.9663308, -0.6669935, 1.506062, 0, 0, 0, 1, 1,
0.9687024, -2.785548, 4.533963, 0, 0, 0, 1, 1,
0.970311, -1.97319, 1.436238, 1, 1, 1, 1, 1,
0.9705689, 0.2791921, 1.802001, 1, 1, 1, 1, 1,
0.977476, -0.7054803, 2.788145, 1, 1, 1, 1, 1,
0.9821289, 1.104328, -1.245261, 1, 1, 1, 1, 1,
0.9874087, 0.9490933, 0.4877127, 1, 1, 1, 1, 1,
0.9875012, -1.173311, 2.738357, 1, 1, 1, 1, 1,
0.9894836, -0.7357755, 0.8304895, 1, 1, 1, 1, 1,
1.003071, -0.0415535, 3.060632, 1, 1, 1, 1, 1,
1.004812, 0.8347752, 1.150647, 1, 1, 1, 1, 1,
1.010708, -0.5597244, 1.292122, 1, 1, 1, 1, 1,
1.012522, -0.7451194, 1.637349, 1, 1, 1, 1, 1,
1.013601, -1.289984, 2.211225, 1, 1, 1, 1, 1,
1.013794, -0.7108101, 2.75348, 1, 1, 1, 1, 1,
1.020497, -0.5006559, 1.723027, 1, 1, 1, 1, 1,
1.027848, 2.593386, 0.5433551, 1, 1, 1, 1, 1,
1.029979, 0.05858948, 1.04871, 0, 0, 1, 1, 1,
1.032151, -0.279308, 1.135555, 1, 0, 0, 1, 1,
1.035816, 0.2176215, 1.956084, 1, 0, 0, 1, 1,
1.044449, 1.090631, 0.1894262, 1, 0, 0, 1, 1,
1.054428, 0.5038166, 1.305203, 1, 0, 0, 1, 1,
1.056277, 2.0391, 0.1646911, 1, 0, 0, 1, 1,
1.060314, 0.7979991, 0.1047117, 0, 0, 0, 1, 1,
1.062788, 2.479003, 0.3622758, 0, 0, 0, 1, 1,
1.065957, 0.6310187, -0.1470138, 0, 0, 0, 1, 1,
1.072597, 1.437828, 0.9195116, 0, 0, 0, 1, 1,
1.073371, -0.1635792, 3.503294, 0, 0, 0, 1, 1,
1.076056, -0.9356866, 2.08354, 0, 0, 0, 1, 1,
1.079023, -0.04686803, 1.597425, 0, 0, 0, 1, 1,
1.080621, 1.133581, 0.5432485, 1, 1, 1, 1, 1,
1.087748, 1.108969, 1.879834, 1, 1, 1, 1, 1,
1.089425, -0.3960278, 1.510817, 1, 1, 1, 1, 1,
1.094609, 1.124974, 0.8202065, 1, 1, 1, 1, 1,
1.094704, -0.4692648, 1.437875, 1, 1, 1, 1, 1,
1.09653, -0.1337802, -0.2532519, 1, 1, 1, 1, 1,
1.099159, -0.03475277, 1.264579, 1, 1, 1, 1, 1,
1.108588, -0.45531, 0.497544, 1, 1, 1, 1, 1,
1.108895, 1.084742, 1.098162, 1, 1, 1, 1, 1,
1.109815, -0.3316008, 1.491592, 1, 1, 1, 1, 1,
1.111216, 0.7876102, -0.3778553, 1, 1, 1, 1, 1,
1.125845, -2.249117, 4.250894, 1, 1, 1, 1, 1,
1.129683, 1.46064, 0.5235927, 1, 1, 1, 1, 1,
1.13414, -0.4777282, 1.239506, 1, 1, 1, 1, 1,
1.141014, 0.1993093, 0.6086942, 1, 1, 1, 1, 1,
1.149171, -0.6442558, 1.163168, 0, 0, 1, 1, 1,
1.149855, 0.1478419, 1.65512, 1, 0, 0, 1, 1,
1.177354, 1.537524, 1.955867, 1, 0, 0, 1, 1,
1.179785, -0.884725, 2.233578, 1, 0, 0, 1, 1,
1.189102, -0.7824499, 2.06105, 1, 0, 0, 1, 1,
1.189879, -0.3979388, 3.042659, 1, 0, 0, 1, 1,
1.196898, 0.2448444, 0.1079772, 0, 0, 0, 1, 1,
1.19932, -0.8821906, 1.080603, 0, 0, 0, 1, 1,
1.208858, 0.625683, 1.612185, 0, 0, 0, 1, 1,
1.215188, 0.4914807, 0.9301704, 0, 0, 0, 1, 1,
1.218987, -0.2629924, 1.207852, 0, 0, 0, 1, 1,
1.233616, -0.577737, 2.284245, 0, 0, 0, 1, 1,
1.236114, -1.840016, 2.563614, 0, 0, 0, 1, 1,
1.238325, 2.538316, 1.027367, 1, 1, 1, 1, 1,
1.241657, -1.055152, 3.607181, 1, 1, 1, 1, 1,
1.24655, -0.1157324, 1.85217, 1, 1, 1, 1, 1,
1.254107, -0.253078, 2.399991, 1, 1, 1, 1, 1,
1.257629, 0.167682, 1.655172, 1, 1, 1, 1, 1,
1.259286, -1.19649, 2.095285, 1, 1, 1, 1, 1,
1.260013, -1.330522, 1.249561, 1, 1, 1, 1, 1,
1.2631, 0.3860965, 2.652127, 1, 1, 1, 1, 1,
1.265952, -1.444451, 2.432625, 1, 1, 1, 1, 1,
1.283994, 0.1478086, 1.983828, 1, 1, 1, 1, 1,
1.28722, -0.4730054, 3.546816, 1, 1, 1, 1, 1,
1.287787, -0.1614253, 1.355177, 1, 1, 1, 1, 1,
1.297155, 0.151467, -0.8025837, 1, 1, 1, 1, 1,
1.297766, -0.3259901, 2.422533, 1, 1, 1, 1, 1,
1.301177, 0.9201314, 1.066166, 1, 1, 1, 1, 1,
1.302753, 1.803452, 2.07604, 0, 0, 1, 1, 1,
1.307737, 0.5110895, 1.414913, 1, 0, 0, 1, 1,
1.308624, -0.2774536, 1.815696, 1, 0, 0, 1, 1,
1.316282, 1.040125, 1.973094, 1, 0, 0, 1, 1,
1.319025, 1.564078, 1.275519, 1, 0, 0, 1, 1,
1.320138, -0.5017124, 0.630727, 1, 0, 0, 1, 1,
1.331188, 0.2949072, 2.532026, 0, 0, 0, 1, 1,
1.336385, -0.6781647, 3.043104, 0, 0, 0, 1, 1,
1.33736, -1.917231, 3.593591, 0, 0, 0, 1, 1,
1.340819, 0.4883752, 1.160018, 0, 0, 0, 1, 1,
1.353564, 1.197493, -0.1708601, 0, 0, 0, 1, 1,
1.359368, -0.1876453, 0.8582767, 0, 0, 0, 1, 1,
1.359873, -0.2415796, 1.790667, 0, 0, 0, 1, 1,
1.379408, 0.3272812, -0.4700807, 1, 1, 1, 1, 1,
1.392829, 0.8804663, 0.1842922, 1, 1, 1, 1, 1,
1.4033, -0.9454922, 2.748785, 1, 1, 1, 1, 1,
1.40637, -1.033445, 0.9882987, 1, 1, 1, 1, 1,
1.424567, 0.1475115, 2.048476, 1, 1, 1, 1, 1,
1.429714, 0.3008837, 0.9174027, 1, 1, 1, 1, 1,
1.441115, 1.063471, 1.629914, 1, 1, 1, 1, 1,
1.441267, -0.2789041, 4.192995, 1, 1, 1, 1, 1,
1.445425, -1.65284, 1.670673, 1, 1, 1, 1, 1,
1.452406, -1.47574, 3.149237, 1, 1, 1, 1, 1,
1.453948, -1.375606, 2.395872, 1, 1, 1, 1, 1,
1.461967, -1.41753, 2.457146, 1, 1, 1, 1, 1,
1.470002, -1.316763, 2.912259, 1, 1, 1, 1, 1,
1.47067, 0.4885041, 1.51136, 1, 1, 1, 1, 1,
1.494059, -0.4570195, 4.103458, 1, 1, 1, 1, 1,
1.494463, 0.5499963, 1.039067, 0, 0, 1, 1, 1,
1.508658, 0.5269377, 1.581234, 1, 0, 0, 1, 1,
1.520633, -0.8033518, 3.701828, 1, 0, 0, 1, 1,
1.529236, -0.4216905, 2.197131, 1, 0, 0, 1, 1,
1.540943, 0.5874524, 3.124665, 1, 0, 0, 1, 1,
1.560816, 0.5389155, 1.868046, 1, 0, 0, 1, 1,
1.575192, 0.6873659, -0.5898899, 0, 0, 0, 1, 1,
1.580424, 1.401425, 1.681956, 0, 0, 0, 1, 1,
1.594067, 0.5063254, 1.37067, 0, 0, 0, 1, 1,
1.597003, 1.505345, 0.7952911, 0, 0, 0, 1, 1,
1.598894, 0.7336217, 0.2228479, 0, 0, 0, 1, 1,
1.601399, -0.02328965, 2.019908, 0, 0, 0, 1, 1,
1.609161, 0.2256428, 1.940696, 0, 0, 0, 1, 1,
1.617751, -0.5847123, 2.525429, 1, 1, 1, 1, 1,
1.620867, -2.218874, 2.923504, 1, 1, 1, 1, 1,
1.640602, -0.6281615, 1.524479, 1, 1, 1, 1, 1,
1.666054, -0.9060526, 4.224896, 1, 1, 1, 1, 1,
1.669711, -0.3658052, 1.470197, 1, 1, 1, 1, 1,
1.689529, -0.3999026, 0.6461673, 1, 1, 1, 1, 1,
1.706145, -1.839534, 3.826163, 1, 1, 1, 1, 1,
1.707328, -0.08663335, 1.279482, 1, 1, 1, 1, 1,
1.716882, 0.5887325, 0.3430687, 1, 1, 1, 1, 1,
1.71798, -0.8760937, 1.758312, 1, 1, 1, 1, 1,
1.731087, 0.5653939, 0.858472, 1, 1, 1, 1, 1,
1.735906, -0.2267103, 2.881699, 1, 1, 1, 1, 1,
1.736495, 0.5729954, 1.591475, 1, 1, 1, 1, 1,
1.740858, -0.6770688, 1.535708, 1, 1, 1, 1, 1,
1.745748, -0.9058611, 1.189654, 1, 1, 1, 1, 1,
1.760368, 0.85999, 0.5598041, 0, 0, 1, 1, 1,
1.767146, -0.4464938, 2.459682, 1, 0, 0, 1, 1,
1.770434, -0.9443292, 1.652967, 1, 0, 0, 1, 1,
1.775749, -2.009633, 1.005755, 1, 0, 0, 1, 1,
1.780415, 2.12219, -0.09033331, 1, 0, 0, 1, 1,
1.803622, 0.3648832, 1.466177, 1, 0, 0, 1, 1,
1.842927, 0.1157967, 2.263605, 0, 0, 0, 1, 1,
1.851919, -1.17609, 2.141375, 0, 0, 0, 1, 1,
1.862154, 0.135172, 4.480735, 0, 0, 0, 1, 1,
1.887796, -0.8752642, 3.015268, 0, 0, 0, 1, 1,
1.900242, 0.4326697, 3.757789, 0, 0, 0, 1, 1,
1.903958, -1.399276, 2.649503, 0, 0, 0, 1, 1,
1.918693, 0.88019, 3.207312, 0, 0, 0, 1, 1,
1.922054, -0.2062477, 1.432271, 1, 1, 1, 1, 1,
1.945117, -0.02186939, 2.150542, 1, 1, 1, 1, 1,
1.950502, 0.2411771, 2.264146, 1, 1, 1, 1, 1,
1.982303, -1.269319, 1.207558, 1, 1, 1, 1, 1,
2.006214, 0.1305927, 2.574841, 1, 1, 1, 1, 1,
2.033207, 0.170535, 1.494709, 1, 1, 1, 1, 1,
2.036244, -1.51453, 1.986198, 1, 1, 1, 1, 1,
2.040394, -0.2869962, 0.6992548, 1, 1, 1, 1, 1,
2.051023, -0.8015306, 2.050305, 1, 1, 1, 1, 1,
2.052526, -1.912091, 1.634487, 1, 1, 1, 1, 1,
2.054589, -0.3579261, 2.242342, 1, 1, 1, 1, 1,
2.072184, -0.4074302, 1.638975, 1, 1, 1, 1, 1,
2.073776, 1.376342, 0.6437786, 1, 1, 1, 1, 1,
2.087274, 1.163201, 1.087647, 1, 1, 1, 1, 1,
2.103142, 0.9882655, 1.428932, 1, 1, 1, 1, 1,
2.117737, -1.22094, 5.251824, 0, 0, 1, 1, 1,
2.149908, 1.801836, -0.6640133, 1, 0, 0, 1, 1,
2.153133, 0.2169327, 1.29634, 1, 0, 0, 1, 1,
2.172925, 0.5629187, 0.2431268, 1, 0, 0, 1, 1,
2.189002, -0.2532891, 0.5573094, 1, 0, 0, 1, 1,
2.209905, -0.3297725, 1.888466, 1, 0, 0, 1, 1,
2.245916, 0.8631498, 0.01817978, 0, 0, 0, 1, 1,
2.266279, 0.09644751, 3.213836, 0, 0, 0, 1, 1,
2.290703, -0.6736176, 2.667626, 0, 0, 0, 1, 1,
2.335922, 1.633942, 1.562192, 0, 0, 0, 1, 1,
2.39603, 0.2550213, 3.679951, 0, 0, 0, 1, 1,
2.407, 2.553819, -0.7011795, 0, 0, 0, 1, 1,
2.417177, -0.3427494, 1.245992, 0, 0, 0, 1, 1,
2.532864, 1.366739, 1.245582, 1, 1, 1, 1, 1,
2.619975, 0.3028187, 0.9028032, 1, 1, 1, 1, 1,
2.685466, 0.1226226, 0.6522677, 1, 1, 1, 1, 1,
2.764282, 1.495674, -0.7247383, 1, 1, 1, 1, 1,
2.818769, -0.8718458, 0.9215009, 1, 1, 1, 1, 1,
2.840723, -0.2905814, 1.11326, 1, 1, 1, 1, 1,
2.885865, -0.1648822, 3.489204, 1, 1, 1, 1, 1
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
var radius = 8.974099;
var distance = 31.52114;
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
mvMatrix.translate( 0.0327996, 0.2371675, -0.2603283 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.52114);
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