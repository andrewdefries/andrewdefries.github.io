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
-3.422351, -0.08937269, -0.9238544, 1, 0, 0, 1,
-2.955774, 0.2313077, 0.01245448, 1, 0.007843138, 0, 1,
-2.710001, 0.9566358, -2.434798, 1, 0.01176471, 0, 1,
-2.552466, 0.7725974, 0.1300126, 1, 0.01960784, 0, 1,
-2.55092, -0.9876678, -2.061682, 1, 0.02352941, 0, 1,
-2.512788, -0.856125, -0.8971574, 1, 0.03137255, 0, 1,
-2.498838, 0.7800449, -3.996991, 1, 0.03529412, 0, 1,
-2.469076, 0.2614367, -1.765066, 1, 0.04313726, 0, 1,
-2.445132, 0.3643791, -1.081735, 1, 0.04705882, 0, 1,
-2.434024, 1.262507, -0.6997707, 1, 0.05490196, 0, 1,
-2.418364, -0.6955138, -1.723552, 1, 0.05882353, 0, 1,
-2.389229, -1.326011, -3.216232, 1, 0.06666667, 0, 1,
-2.313026, 0.1072124, -2.139579, 1, 0.07058824, 0, 1,
-2.294295, 0.452561, -0.4667534, 1, 0.07843138, 0, 1,
-2.285828, -0.98943, -3.099741, 1, 0.08235294, 0, 1,
-2.21716, -2.41968, -1.387535, 1, 0.09019608, 0, 1,
-2.206557, -1.550004, -2.414008, 1, 0.09411765, 0, 1,
-2.189959, -0.113445, -1.104125, 1, 0.1019608, 0, 1,
-2.171003, -1.305002, -1.807515, 1, 0.1098039, 0, 1,
-2.153465, -0.8429856, -1.714088, 1, 0.1137255, 0, 1,
-2.151509, -2.621079, -1.661284, 1, 0.1215686, 0, 1,
-2.150566, -1.184743, -1.508402, 1, 0.1254902, 0, 1,
-2.149483, 0.2441887, -1.050294, 1, 0.1333333, 0, 1,
-2.109717, -1.688709, -2.613396, 1, 0.1372549, 0, 1,
-2.10161, -2.375907, -1.959757, 1, 0.145098, 0, 1,
-2.100391, 0.3664924, -3.281403, 1, 0.1490196, 0, 1,
-2.07241, 0.4197636, -1.786885, 1, 0.1568628, 0, 1,
-2.043643, -0.4007581, -2.880425, 1, 0.1607843, 0, 1,
-2.015872, -0.8990108, -1.723795, 1, 0.1686275, 0, 1,
-2.000792, -0.4889801, -0.7956083, 1, 0.172549, 0, 1,
-2.000055, -1.118736, 0.8850108, 1, 0.1803922, 0, 1,
-1.966377, -1.045933, -1.943141, 1, 0.1843137, 0, 1,
-1.953398, -0.1886328, -3.02035, 1, 0.1921569, 0, 1,
-1.935316, 1.39468, -0.6947624, 1, 0.1960784, 0, 1,
-1.909004, -0.1620176, -1.884002, 1, 0.2039216, 0, 1,
-1.90039, -0.01723869, -0.4405421, 1, 0.2117647, 0, 1,
-1.875528, 1.012084, -0.6473955, 1, 0.2156863, 0, 1,
-1.874985, -0.02228205, 0.1315023, 1, 0.2235294, 0, 1,
-1.867765, 1.050472, -0.8079374, 1, 0.227451, 0, 1,
-1.863357, -0.6471131, -3.340666, 1, 0.2352941, 0, 1,
-1.844658, 0.01413301, -0.0698926, 1, 0.2392157, 0, 1,
-1.834876, -0.4707625, -1.145214, 1, 0.2470588, 0, 1,
-1.801459, 0.2362913, -1.222293, 1, 0.2509804, 0, 1,
-1.795299, -0.9899514, -1.903874, 1, 0.2588235, 0, 1,
-1.784332, -1.140731, -1.493485, 1, 0.2627451, 0, 1,
-1.740151, 0.689314, -1.11767, 1, 0.2705882, 0, 1,
-1.735636, -0.1739597, -1.297409, 1, 0.2745098, 0, 1,
-1.730799, 0.02391347, -3.032952, 1, 0.282353, 0, 1,
-1.729393, 0.9852507, -0.9508099, 1, 0.2862745, 0, 1,
-1.707507, 0.08034889, -1.903218, 1, 0.2941177, 0, 1,
-1.703681, 0.329372, -0.06356074, 1, 0.3019608, 0, 1,
-1.700311, -0.3180733, -2.794212, 1, 0.3058824, 0, 1,
-1.698483, -1.887356, -0.8780843, 1, 0.3137255, 0, 1,
-1.652784, 0.7673283, -2.198697, 1, 0.3176471, 0, 1,
-1.643514, 0.6009169, -2.47712, 1, 0.3254902, 0, 1,
-1.628241, -1.038987, -0.6532069, 1, 0.3294118, 0, 1,
-1.622941, 0.4856644, -0.3976839, 1, 0.3372549, 0, 1,
-1.618211, -0.05728181, -2.142096, 1, 0.3411765, 0, 1,
-1.611691, 0.1376216, -2.186062, 1, 0.3490196, 0, 1,
-1.599291, -0.3752972, -2.343558, 1, 0.3529412, 0, 1,
-1.596972, -0.2889079, -1.187836, 1, 0.3607843, 0, 1,
-1.596496, 0.3493749, -0.512485, 1, 0.3647059, 0, 1,
-1.58647, -1.354778, -1.725154, 1, 0.372549, 0, 1,
-1.563078, -1.07047, -1.454412, 1, 0.3764706, 0, 1,
-1.531547, 0.3364421, -0.5908168, 1, 0.3843137, 0, 1,
-1.530812, 1.957514, 0.1260774, 1, 0.3882353, 0, 1,
-1.520046, -0.4393665, -1.695127, 1, 0.3960784, 0, 1,
-1.51953, -0.740949, -1.372241, 1, 0.4039216, 0, 1,
-1.472543, -0.8689546, -1.508532, 1, 0.4078431, 0, 1,
-1.447533, -0.6584732, -0.5718296, 1, 0.4156863, 0, 1,
-1.436392, 0.02520973, -2.39315, 1, 0.4196078, 0, 1,
-1.398971, 0.08943515, 0.151778, 1, 0.427451, 0, 1,
-1.398883, 0.4163077, -0.34745, 1, 0.4313726, 0, 1,
-1.389314, 0.1652879, -1.869379, 1, 0.4392157, 0, 1,
-1.388564, 0.8426476, -1.796357, 1, 0.4431373, 0, 1,
-1.370612, 0.2860202, -0.9395689, 1, 0.4509804, 0, 1,
-1.364856, 0.9707888, -2.904347, 1, 0.454902, 0, 1,
-1.36475, 0.2906509, -2.246161, 1, 0.4627451, 0, 1,
-1.355032, 1.110671, -2.135128, 1, 0.4666667, 0, 1,
-1.353249, 0.05886177, 0.1385234, 1, 0.4745098, 0, 1,
-1.35075, 1.246582, -1.482084, 1, 0.4784314, 0, 1,
-1.349013, 1.475659, -0.9091805, 1, 0.4862745, 0, 1,
-1.340433, -1.16613, -3.994158, 1, 0.4901961, 0, 1,
-1.332577, -0.635167, -1.880283, 1, 0.4980392, 0, 1,
-1.329944, -0.5379163, -0.4976474, 1, 0.5058824, 0, 1,
-1.328017, 0.4559765, -0.5811772, 1, 0.509804, 0, 1,
-1.312457, -0.2430429, -1.053592, 1, 0.5176471, 0, 1,
-1.305093, 0.2231347, -1.940514, 1, 0.5215687, 0, 1,
-1.303908, 0.5981736, -1.111361, 1, 0.5294118, 0, 1,
-1.288255, -0.5298124, -2.401386, 1, 0.5333334, 0, 1,
-1.286872, -1.474135, -3.481444, 1, 0.5411765, 0, 1,
-1.285638, -0.8980262, -3.263557, 1, 0.5450981, 0, 1,
-1.285202, 0.378336, -1.298926, 1, 0.5529412, 0, 1,
-1.282394, -1.50083, -0.3188877, 1, 0.5568628, 0, 1,
-1.275013, -0.5086069, -2.44609, 1, 0.5647059, 0, 1,
-1.264787, 1.413976, -0.3162271, 1, 0.5686275, 0, 1,
-1.264755, -1.310233, -3.741677, 1, 0.5764706, 0, 1,
-1.259527, -0.7682153, -2.047805, 1, 0.5803922, 0, 1,
-1.256101, -0.4875013, -2.940273, 1, 0.5882353, 0, 1,
-1.243313, 0.8692093, -1.683628, 1, 0.5921569, 0, 1,
-1.224687, -0.1238977, -1.99257, 1, 0.6, 0, 1,
-1.211758, -0.4207924, -4.380395, 1, 0.6078432, 0, 1,
-1.211079, -0.6024056, -1.447358, 1, 0.6117647, 0, 1,
-1.196207, -0.2616012, -1.70689, 1, 0.6196079, 0, 1,
-1.192645, 0.9285158, -0.2138122, 1, 0.6235294, 0, 1,
-1.189589, -0.8221985, -2.961772, 1, 0.6313726, 0, 1,
-1.188969, -0.2688055, -2.633523, 1, 0.6352941, 0, 1,
-1.178507, 1.684417, -0.08139569, 1, 0.6431373, 0, 1,
-1.176841, -0.08479065, -1.858406, 1, 0.6470588, 0, 1,
-1.174844, -0.8729025, -1.275801, 1, 0.654902, 0, 1,
-1.173522, -0.1449194, -1.277029, 1, 0.6588235, 0, 1,
-1.17219, 1.529183, -1.64077, 1, 0.6666667, 0, 1,
-1.163106, 1.060437, -0.6491375, 1, 0.6705883, 0, 1,
-1.156409, 0.8490172, -2.404309, 1, 0.6784314, 0, 1,
-1.147455, 2.234601, -0.5426617, 1, 0.682353, 0, 1,
-1.141312, -1.659407, -2.566632, 1, 0.6901961, 0, 1,
-1.123535, 0.7978919, -0.1569288, 1, 0.6941177, 0, 1,
-1.120606, 0.4759431, -1.072837, 1, 0.7019608, 0, 1,
-1.119758, 2.070557, 0.06261343, 1, 0.7098039, 0, 1,
-1.117504, 1.435549, -0.484802, 1, 0.7137255, 0, 1,
-1.109326, -0.2950142, -1.373855, 1, 0.7215686, 0, 1,
-1.108427, -0.3938552, -1.997323, 1, 0.7254902, 0, 1,
-1.105273, -0.02546557, -1.455396, 1, 0.7333333, 0, 1,
-1.104079, 1.139706, -0.3125846, 1, 0.7372549, 0, 1,
-1.102977, -1.835242, -2.984191, 1, 0.7450981, 0, 1,
-1.099956, -1.809832, -3.243188, 1, 0.7490196, 0, 1,
-1.090667, 0.769645, -3.341639, 1, 0.7568628, 0, 1,
-1.090382, -1.028973, -2.476404, 1, 0.7607843, 0, 1,
-1.087392, 0.1375993, -0.5475281, 1, 0.7686275, 0, 1,
-1.069866, -0.005005487, 0.4363288, 1, 0.772549, 0, 1,
-1.068233, 0.5117224, -1.597914, 1, 0.7803922, 0, 1,
-1.060385, 0.5096509, -1.411794, 1, 0.7843137, 0, 1,
-1.050611, -0.0958793, -0.9000709, 1, 0.7921569, 0, 1,
-1.049386, 0.6910443, 0.1735308, 1, 0.7960784, 0, 1,
-1.039589, 1.462149, -0.4269634, 1, 0.8039216, 0, 1,
-1.037332, 0.07865957, -0.04034142, 1, 0.8117647, 0, 1,
-1.034694, -0.7428889, -2.627344, 1, 0.8156863, 0, 1,
-1.032013, -0.6544597, -1.38131, 1, 0.8235294, 0, 1,
-1.030395, 2.213462, -1.320408, 1, 0.827451, 0, 1,
-1.027973, -0.7879366, -2.577312, 1, 0.8352941, 0, 1,
-1.024544, -0.8877326, -2.207741, 1, 0.8392157, 0, 1,
-1.011441, -0.7866331, -3.188166, 1, 0.8470588, 0, 1,
-1.009192, 1.982532, 0.3353186, 1, 0.8509804, 0, 1,
-1.007992, 0.4090762, -0.4851395, 1, 0.8588235, 0, 1,
-1.007238, -1.462911, -2.120203, 1, 0.8627451, 0, 1,
-1.00608, 0.476306, -2.229375, 1, 0.8705882, 0, 1,
-1.004741, -1.089761, -1.355306, 1, 0.8745098, 0, 1,
-1.003851, -0.2799829, -0.1461017, 1, 0.8823529, 0, 1,
-1.003565, -0.7052756, -2.51856, 1, 0.8862745, 0, 1,
-0.9999421, 2.032283, 0.3284636, 1, 0.8941177, 0, 1,
-0.9977477, 1.170113, -0.7069646, 1, 0.8980392, 0, 1,
-0.9935302, 0.7063686, -1.095964, 1, 0.9058824, 0, 1,
-0.9934623, 0.5535646, -0.9842005, 1, 0.9137255, 0, 1,
-0.9830589, 0.07128967, -0.5960608, 1, 0.9176471, 0, 1,
-0.98233, 0.9339288, -1.428265, 1, 0.9254902, 0, 1,
-0.9793687, 0.07163717, -2.882704, 1, 0.9294118, 0, 1,
-0.9693848, -0.9197956, -2.830143, 1, 0.9372549, 0, 1,
-0.9690915, 0.7383086, -1.118839, 1, 0.9411765, 0, 1,
-0.9663561, 1.496277, -1.458231, 1, 0.9490196, 0, 1,
-0.9656011, 0.2479807, 1.135665, 1, 0.9529412, 0, 1,
-0.9532387, -0.1111638, -1.669405, 1, 0.9607843, 0, 1,
-0.9496956, 0.4627249, -0.009419547, 1, 0.9647059, 0, 1,
-0.9455305, 0.6717765, -3.869771, 1, 0.972549, 0, 1,
-0.937014, -0.5062775, -2.94658, 1, 0.9764706, 0, 1,
-0.9358927, 0.8894792, -1.682597, 1, 0.9843137, 0, 1,
-0.9336633, -1.221085, -2.620193, 1, 0.9882353, 0, 1,
-0.9334452, 1.821386, -0.5382093, 1, 0.9960784, 0, 1,
-0.932664, -0.4017062, -2.063128, 0.9960784, 1, 0, 1,
-0.9286347, 1.037691, -1.391811, 0.9921569, 1, 0, 1,
-0.9267008, -0.1181087, -1.303823, 0.9843137, 1, 0, 1,
-0.9228105, -1.328245, -3.387891, 0.9803922, 1, 0, 1,
-0.920481, 0.02434509, -2.659666, 0.972549, 1, 0, 1,
-0.9203874, 0.5284981, -1.394859, 0.9686275, 1, 0, 1,
-0.9148445, -1.314472, -2.244642, 0.9607843, 1, 0, 1,
-0.9132842, -1.394665, -2.395023, 0.9568627, 1, 0, 1,
-0.9087325, -1.914545, -2.604411, 0.9490196, 1, 0, 1,
-0.8998863, 1.495906, 1.531217, 0.945098, 1, 0, 1,
-0.8942887, -0.3497851, -2.003623, 0.9372549, 1, 0, 1,
-0.8870071, 0.4076931, -1.091617, 0.9333333, 1, 0, 1,
-0.8814473, 2.321923, -0.6082319, 0.9254902, 1, 0, 1,
-0.8714635, -0.1678356, -0.720296, 0.9215686, 1, 0, 1,
-0.8641367, 0.8996071, -0.08541383, 0.9137255, 1, 0, 1,
-0.8620126, 1.262769, 0.255553, 0.9098039, 1, 0, 1,
-0.8532544, 1.250331, 0.556587, 0.9019608, 1, 0, 1,
-0.8466449, -0.04909269, -0.8246184, 0.8941177, 1, 0, 1,
-0.8449739, -1.511094, -4.85811, 0.8901961, 1, 0, 1,
-0.8439822, -0.5877733, -2.421324, 0.8823529, 1, 0, 1,
-0.8414335, -0.9257751, -3.325868, 0.8784314, 1, 0, 1,
-0.8394627, -1.445997, -1.578709, 0.8705882, 1, 0, 1,
-0.8387291, 0.3036025, -1.053691, 0.8666667, 1, 0, 1,
-0.8358865, 0.8820584, -0.3314201, 0.8588235, 1, 0, 1,
-0.832697, 0.3090085, -1.861772, 0.854902, 1, 0, 1,
-0.8192665, 1.587319, 1.6452, 0.8470588, 1, 0, 1,
-0.8121516, 0.2300415, -2.165031, 0.8431373, 1, 0, 1,
-0.8101402, 0.5728122, 0.2832251, 0.8352941, 1, 0, 1,
-0.8076989, 0.2804417, -2.707721, 0.8313726, 1, 0, 1,
-0.8005024, 0.1305683, -1.438592, 0.8235294, 1, 0, 1,
-0.7985815, 0.07675473, -2.149421, 0.8196079, 1, 0, 1,
-0.7906911, -0.7730609, -3.381582, 0.8117647, 1, 0, 1,
-0.7890234, 2.239527, 1.603728, 0.8078431, 1, 0, 1,
-0.788589, -0.8564256, -4.341723, 0.8, 1, 0, 1,
-0.7871224, 1.955992, -0.556509, 0.7921569, 1, 0, 1,
-0.7789581, 1.039958, 1.062798, 0.7882353, 1, 0, 1,
-0.778533, 0.1660901, -2.817024, 0.7803922, 1, 0, 1,
-0.778372, -1.341431, -3.148294, 0.7764706, 1, 0, 1,
-0.7783467, -0.8505734, -2.255613, 0.7686275, 1, 0, 1,
-0.7774301, 0.4720529, -0.4126175, 0.7647059, 1, 0, 1,
-0.7759366, 0.3162503, -2.253437, 0.7568628, 1, 0, 1,
-0.7736641, -0.5454448, -1.920278, 0.7529412, 1, 0, 1,
-0.7724253, 0.380965, -0.2274232, 0.7450981, 1, 0, 1,
-0.7705445, -1.944969, -4.126558, 0.7411765, 1, 0, 1,
-0.7635643, 1.152762, -1.634902, 0.7333333, 1, 0, 1,
-0.7599375, 1.110802, -1.278735, 0.7294118, 1, 0, 1,
-0.758751, 0.7743332, -0.4257514, 0.7215686, 1, 0, 1,
-0.7573248, -0.8383522, -3.068871, 0.7176471, 1, 0, 1,
-0.7543148, -0.9551299, -3.063781, 0.7098039, 1, 0, 1,
-0.7519154, -1.383421, -3.121706, 0.7058824, 1, 0, 1,
-0.7448562, -0.2661912, -0.6104849, 0.6980392, 1, 0, 1,
-0.744427, 0.6696349, -2.207481, 0.6901961, 1, 0, 1,
-0.7399344, -0.6403539, -1.81328, 0.6862745, 1, 0, 1,
-0.7353978, 1.237014, -0.8525683, 0.6784314, 1, 0, 1,
-0.7256897, -0.2590185, -0.6363925, 0.6745098, 1, 0, 1,
-0.7233514, -0.130252, -1.596758, 0.6666667, 1, 0, 1,
-0.7205735, 0.1751761, -2.342477, 0.6627451, 1, 0, 1,
-0.7189422, 1.617939, -0.641988, 0.654902, 1, 0, 1,
-0.7188094, 0.9412969, -0.7861061, 0.6509804, 1, 0, 1,
-0.7177765, 0.3219162, -2.084843, 0.6431373, 1, 0, 1,
-0.7135175, 1.316905, 0.1300075, 0.6392157, 1, 0, 1,
-0.7091939, 1.746575, -1.575712, 0.6313726, 1, 0, 1,
-0.7051764, -0.7901147, -4.567535, 0.627451, 1, 0, 1,
-0.7001625, 1.906725, -1.092156, 0.6196079, 1, 0, 1,
-0.6950399, 1.454964, -0.7662007, 0.6156863, 1, 0, 1,
-0.6846118, -1.866217, -2.701046, 0.6078432, 1, 0, 1,
-0.6743605, -1.005727, -1.985232, 0.6039216, 1, 0, 1,
-0.673661, 0.7128586, -1.495583, 0.5960785, 1, 0, 1,
-0.6622038, 0.4827996, -1.673777, 0.5882353, 1, 0, 1,
-0.6619573, 0.6058734, -0.62406, 0.5843138, 1, 0, 1,
-0.6618844, 0.02819546, -0.2207436, 0.5764706, 1, 0, 1,
-0.6608196, 0.7724378, 1.783867, 0.572549, 1, 0, 1,
-0.658051, -1.158178, -2.28428, 0.5647059, 1, 0, 1,
-0.6488339, -0.4671496, -3.053681, 0.5607843, 1, 0, 1,
-0.6459465, -0.6871678, -2.485176, 0.5529412, 1, 0, 1,
-0.6454533, -0.9449426, -2.411308, 0.5490196, 1, 0, 1,
-0.6420849, 1.405766, -1.361409, 0.5411765, 1, 0, 1,
-0.6369419, -1.550555, -2.049516, 0.5372549, 1, 0, 1,
-0.6344568, -0.2479763, -2.045378, 0.5294118, 1, 0, 1,
-0.6337892, 0.7774674, 1.331529, 0.5254902, 1, 0, 1,
-0.6311787, -0.4153123, -2.156421, 0.5176471, 1, 0, 1,
-0.6272108, 0.6318854, -1.285942, 0.5137255, 1, 0, 1,
-0.6244181, 2.464603, 0.4403547, 0.5058824, 1, 0, 1,
-0.6217157, 1.327588, -0.9211205, 0.5019608, 1, 0, 1,
-0.612859, 0.3007935, -0.7446618, 0.4941176, 1, 0, 1,
-0.6084431, 1.31915, -0.3043919, 0.4862745, 1, 0, 1,
-0.6049247, -0.4391959, -2.830024, 0.4823529, 1, 0, 1,
-0.6037464, -1.022388, -5.509253, 0.4745098, 1, 0, 1,
-0.602562, -0.5641115, -0.6463597, 0.4705882, 1, 0, 1,
-0.6000872, 0.5871447, -0.3568222, 0.4627451, 1, 0, 1,
-0.5993032, 0.3450252, -3.182147, 0.4588235, 1, 0, 1,
-0.5986934, 1.177218, -1.98444, 0.4509804, 1, 0, 1,
-0.5950019, -1.244405, -3.507315, 0.4470588, 1, 0, 1,
-0.5903037, -0.7724221, -1.997596, 0.4392157, 1, 0, 1,
-0.5843192, 0.398192, -3.005959, 0.4352941, 1, 0, 1,
-0.5797682, -0.1450315, -1.669379, 0.427451, 1, 0, 1,
-0.5795919, 0.1266882, -1.85201, 0.4235294, 1, 0, 1,
-0.5789403, 0.3123978, 1.745363, 0.4156863, 1, 0, 1,
-0.5785387, -0.06288141, -0.4247785, 0.4117647, 1, 0, 1,
-0.5782262, 0.7845588, -0.04282538, 0.4039216, 1, 0, 1,
-0.5744705, 0.4967311, -0.5895887, 0.3960784, 1, 0, 1,
-0.5724518, 0.845486, -0.6154285, 0.3921569, 1, 0, 1,
-0.5705571, 2.325922, 1.652417, 0.3843137, 1, 0, 1,
-0.5650213, 1.30934, 0.3233889, 0.3803922, 1, 0, 1,
-0.5647012, 0.9096732, -0.7094289, 0.372549, 1, 0, 1,
-0.5646969, -1.004556, -2.738466, 0.3686275, 1, 0, 1,
-0.5620491, -1.00385, -1.825435, 0.3607843, 1, 0, 1,
-0.5608614, 0.6098984, -0.6690083, 0.3568628, 1, 0, 1,
-0.5600775, 0.9512599, -0.2450943, 0.3490196, 1, 0, 1,
-0.5530941, -0.8137793, -3.935962, 0.345098, 1, 0, 1,
-0.553004, 1.114256, -1.478258, 0.3372549, 1, 0, 1,
-0.5527429, 1.043746, 0.5009316, 0.3333333, 1, 0, 1,
-0.5499072, 0.06696562, -0.7459214, 0.3254902, 1, 0, 1,
-0.547987, 0.2999367, -2.300794, 0.3215686, 1, 0, 1,
-0.547583, 0.2616733, -0.8787933, 0.3137255, 1, 0, 1,
-0.5451283, -0.06346155, -3.372187, 0.3098039, 1, 0, 1,
-0.5447395, 0.7131957, -1.27853, 0.3019608, 1, 0, 1,
-0.5436541, 1.45758, -1.000475, 0.2941177, 1, 0, 1,
-0.5418287, 1.250086, -1.565862, 0.2901961, 1, 0, 1,
-0.5306712, -0.5422304, -2.909308, 0.282353, 1, 0, 1,
-0.5305856, 0.1869882, -1.375347, 0.2784314, 1, 0, 1,
-0.5300953, 0.2303318, -0.9594099, 0.2705882, 1, 0, 1,
-0.5260585, -0.4435984, -1.401924, 0.2666667, 1, 0, 1,
-0.5254756, -0.7610102, -1.595866, 0.2588235, 1, 0, 1,
-0.5206666, 0.9530535, 0.4887732, 0.254902, 1, 0, 1,
-0.5195123, 1.258067, 0.117276, 0.2470588, 1, 0, 1,
-0.5193503, -0.1849772, -0.6384709, 0.2431373, 1, 0, 1,
-0.5136724, -0.3309739, -4.070679, 0.2352941, 1, 0, 1,
-0.5126886, -1.295215, -3.320125, 0.2313726, 1, 0, 1,
-0.5115135, 0.2748676, -0.83439, 0.2235294, 1, 0, 1,
-0.5099819, -0.1899005, 0.1842006, 0.2196078, 1, 0, 1,
-0.5053467, 1.844602, 0.7561615, 0.2117647, 1, 0, 1,
-0.497982, -0.5034629, -2.9267, 0.2078431, 1, 0, 1,
-0.4972967, -1.612026, -2.197299, 0.2, 1, 0, 1,
-0.4964986, -2.214409, -2.848162, 0.1921569, 1, 0, 1,
-0.4959092, -0.2044812, -1.389274, 0.1882353, 1, 0, 1,
-0.4938988, -0.8472854, -2.637789, 0.1803922, 1, 0, 1,
-0.4918153, -0.4996017, -1.471256, 0.1764706, 1, 0, 1,
-0.4889196, -1.726328, -3.944181, 0.1686275, 1, 0, 1,
-0.488636, 1.273097, -0.2324948, 0.1647059, 1, 0, 1,
-0.4862376, -1.812229, -3.837429, 0.1568628, 1, 0, 1,
-0.4860835, -1.308583, -2.671528, 0.1529412, 1, 0, 1,
-0.4851516, 0.4992016, 0.3666892, 0.145098, 1, 0, 1,
-0.4828739, -0.9173025, -2.093947, 0.1411765, 1, 0, 1,
-0.4827211, -1.258355, -2.651096, 0.1333333, 1, 0, 1,
-0.4709674, -0.07558269, -2.303588, 0.1294118, 1, 0, 1,
-0.4695044, 0.8474295, 0.6326663, 0.1215686, 1, 0, 1,
-0.4689582, -1.940753, -2.856973, 0.1176471, 1, 0, 1,
-0.4669042, 0.7207193, -1.828188, 0.1098039, 1, 0, 1,
-0.4647892, 1.130837, 0.05481752, 0.1058824, 1, 0, 1,
-0.4602613, 0.8928788, -0.1239701, 0.09803922, 1, 0, 1,
-0.4597852, -0.5092833, -3.754055, 0.09019608, 1, 0, 1,
-0.4590951, 1.6967, -1.953765, 0.08627451, 1, 0, 1,
-0.4550606, 0.6103932, -1.814781, 0.07843138, 1, 0, 1,
-0.4511006, -0.4635203, -1.882723, 0.07450981, 1, 0, 1,
-0.4445499, -0.1311326, -2.679933, 0.06666667, 1, 0, 1,
-0.4431865, -0.2775446, -2.445925, 0.0627451, 1, 0, 1,
-0.4379476, 1.099098, 0.6571441, 0.05490196, 1, 0, 1,
-0.4322074, 3.081357, 0.05471049, 0.05098039, 1, 0, 1,
-0.428837, -0.3149661, -1.516739, 0.04313726, 1, 0, 1,
-0.4278718, 0.7220902, -1.298545, 0.03921569, 1, 0, 1,
-0.4271506, 0.5215614, -1.376934, 0.03137255, 1, 0, 1,
-0.4256922, -0.7215925, -4.170292, 0.02745098, 1, 0, 1,
-0.4221692, 2.036299, 0.1697556, 0.01960784, 1, 0, 1,
-0.421055, -0.4135657, -3.929191, 0.01568628, 1, 0, 1,
-0.4201981, -0.6094713, -2.393644, 0.007843138, 1, 0, 1,
-0.4196077, -0.5555028, -2.145849, 0.003921569, 1, 0, 1,
-0.4147075, -1.054855, -3.511668, 0, 1, 0.003921569, 1,
-0.4130132, 0.179472, -1.219897, 0, 1, 0.01176471, 1,
-0.4118986, -0.5847335, -1.657978, 0, 1, 0.01568628, 1,
-0.4118368, -1.298324, -5.759462, 0, 1, 0.02352941, 1,
-0.3979366, 0.658691, -1.331236, 0, 1, 0.02745098, 1,
-0.3878362, -0.7986248, -3.0014, 0, 1, 0.03529412, 1,
-0.3835187, -0.941468, -2.03743, 0, 1, 0.03921569, 1,
-0.3793862, 0.1694015, -0.7300814, 0, 1, 0.04705882, 1,
-0.3784454, -0.3104692, -3.403311, 0, 1, 0.05098039, 1,
-0.376606, 0.1343597, -0.1535167, 0, 1, 0.05882353, 1,
-0.375001, -0.06163465, -1.476179, 0, 1, 0.0627451, 1,
-0.3746623, 1.342997, 1.710253, 0, 1, 0.07058824, 1,
-0.3742695, -0.8450009, -0.7009804, 0, 1, 0.07450981, 1,
-0.3703298, 0.8962913, -0.6650928, 0, 1, 0.08235294, 1,
-0.3666662, 1.273229, -1.205529, 0, 1, 0.08627451, 1,
-0.3658815, -0.09396488, -1.245272, 0, 1, 0.09411765, 1,
-0.3627318, 0.116375, -0.713966, 0, 1, 0.1019608, 1,
-0.3618717, -1.262912, -3.439839, 0, 1, 0.1058824, 1,
-0.36017, -0.2839083, -0.8581532, 0, 1, 0.1137255, 1,
-0.3585353, 0.3052672, -1.106326, 0, 1, 0.1176471, 1,
-0.3547977, -1.552495, -3.448811, 0, 1, 0.1254902, 1,
-0.3531445, -0.03381709, -2.21318, 0, 1, 0.1294118, 1,
-0.3520877, 0.2201966, 0.08363301, 0, 1, 0.1372549, 1,
-0.3502685, 1.07314, 0.337532, 0, 1, 0.1411765, 1,
-0.3432698, -0.9430405, -3.128133, 0, 1, 0.1490196, 1,
-0.3403676, 0.3113248, -1.581571, 0, 1, 0.1529412, 1,
-0.339937, 0.5656528, 0.01298006, 0, 1, 0.1607843, 1,
-0.3356445, -1.414192, -2.184378, 0, 1, 0.1647059, 1,
-0.3334873, -0.5851657, -3.573196, 0, 1, 0.172549, 1,
-0.327965, -0.9337708, -2.114588, 0, 1, 0.1764706, 1,
-0.3259698, -1.185209, -2.123015, 0, 1, 0.1843137, 1,
-0.324856, 0.2451809, -0.4811135, 0, 1, 0.1882353, 1,
-0.323357, 2.168141, 0.9870146, 0, 1, 0.1960784, 1,
-0.3225289, -0.1405455, -0.7519505, 0, 1, 0.2039216, 1,
-0.3222394, 1.624195, 0.2379131, 0, 1, 0.2078431, 1,
-0.3205077, 0.4951805, -0.1155881, 0, 1, 0.2156863, 1,
-0.3187812, -0.06155612, -2.119315, 0, 1, 0.2196078, 1,
-0.3185517, 0.3017911, -3.216287, 0, 1, 0.227451, 1,
-0.3151892, 1.523677, -0.8681292, 0, 1, 0.2313726, 1,
-0.3126003, -1.151789, -3.359091, 0, 1, 0.2392157, 1,
-0.3122411, -0.1189596, -1.722144, 0, 1, 0.2431373, 1,
-0.3086578, 0.1341716, -1.559181, 0, 1, 0.2509804, 1,
-0.3077648, -0.100028, -2.170449, 0, 1, 0.254902, 1,
-0.3040259, 1.410766, -1.145259, 0, 1, 0.2627451, 1,
-0.3032194, -0.2558164, -1.999233, 0, 1, 0.2666667, 1,
-0.3030304, -1.87495, -2.557212, 0, 1, 0.2745098, 1,
-0.3009485, -1.156027, -2.012143, 0, 1, 0.2784314, 1,
-0.2995322, -0.3190099, -4.259783, 0, 1, 0.2862745, 1,
-0.2994057, -1.057748, -2.280757, 0, 1, 0.2901961, 1,
-0.2977759, -0.4204663, -2.946499, 0, 1, 0.2980392, 1,
-0.2906947, 1.018243, 0.2739188, 0, 1, 0.3058824, 1,
-0.2906626, 0.8143977, -0.173377, 0, 1, 0.3098039, 1,
-0.2874773, -1.49423, -1.812917, 0, 1, 0.3176471, 1,
-0.2869666, -1.320249, -2.875304, 0, 1, 0.3215686, 1,
-0.2864425, -0.7140021, -4.192711, 0, 1, 0.3294118, 1,
-0.2827602, -0.02767032, -1.821822, 0, 1, 0.3333333, 1,
-0.2822341, 0.1360261, -1.527535, 0, 1, 0.3411765, 1,
-0.2787361, -0.7387407, -3.170149, 0, 1, 0.345098, 1,
-0.2764522, -0.9998933, -2.591905, 0, 1, 0.3529412, 1,
-0.2735394, 2.304777, 0.6973469, 0, 1, 0.3568628, 1,
-0.2686839, 0.0325496, -1.383628, 0, 1, 0.3647059, 1,
-0.2677343, -0.3605447, -1.519456, 0, 1, 0.3686275, 1,
-0.2645899, 0.3032523, 1.835361, 0, 1, 0.3764706, 1,
-0.2590931, -1.785043, -3.12608, 0, 1, 0.3803922, 1,
-0.2589065, 0.5468086, -0.9076576, 0, 1, 0.3882353, 1,
-0.2474187, -0.5194637, -3.227789, 0, 1, 0.3921569, 1,
-0.2473239, 0.6680183, 0.7609666, 0, 1, 0.4, 1,
-0.2444806, 0.8993776, -1.462735, 0, 1, 0.4078431, 1,
-0.2423424, 1.229284, 0.2223102, 0, 1, 0.4117647, 1,
-0.2373897, 1.055976, 1.32341, 0, 1, 0.4196078, 1,
-0.2287992, -1.348906, -3.577837, 0, 1, 0.4235294, 1,
-0.2237787, -0.0350696, -0.8051773, 0, 1, 0.4313726, 1,
-0.2229398, 0.8517584, -0.1599208, 0, 1, 0.4352941, 1,
-0.2158988, -1.550886, -3.622452, 0, 1, 0.4431373, 1,
-0.215525, -0.4970877, -3.162417, 0, 1, 0.4470588, 1,
-0.214211, 0.5159412, -3.083072, 0, 1, 0.454902, 1,
-0.209601, -1.933685, -2.393934, 0, 1, 0.4588235, 1,
-0.2094025, -0.7663772, -2.57095, 0, 1, 0.4666667, 1,
-0.2071113, -0.8960229, -3.051255, 0, 1, 0.4705882, 1,
-0.2064528, 0.3038962, -1.655728, 0, 1, 0.4784314, 1,
-0.2047523, 1.781869, 0.2782224, 0, 1, 0.4823529, 1,
-0.1991236, -0.0249804, -1.350034, 0, 1, 0.4901961, 1,
-0.1974436, -0.4456727, -1.832373, 0, 1, 0.4941176, 1,
-0.1962311, -0.8274798, -2.869646, 0, 1, 0.5019608, 1,
-0.1899144, 1.855533, -0.5531694, 0, 1, 0.509804, 1,
-0.1891137, -0.01060684, -3.46756, 0, 1, 0.5137255, 1,
-0.1863009, 0.7484741, 0.6644514, 0, 1, 0.5215687, 1,
-0.1860285, 0.1235563, -0.008500068, 0, 1, 0.5254902, 1,
-0.1813187, -0.7857042, -2.279412, 0, 1, 0.5333334, 1,
-0.1797635, 0.3702624, -1.461155, 0, 1, 0.5372549, 1,
-0.1774251, 1.63241, -0.02835308, 0, 1, 0.5450981, 1,
-0.1762044, -1.212914, -1.526488, 0, 1, 0.5490196, 1,
-0.1689886, -0.9210185, -2.551126, 0, 1, 0.5568628, 1,
-0.1686082, -1.119075, -3.797133, 0, 1, 0.5607843, 1,
-0.167895, 0.1665646, -0.2019473, 0, 1, 0.5686275, 1,
-0.1666047, -0.9854178, -0.8267726, 0, 1, 0.572549, 1,
-0.1656604, 0.7138179, -2.212315, 0, 1, 0.5803922, 1,
-0.1621982, 0.369275, -1.330722, 0, 1, 0.5843138, 1,
-0.1589435, -0.3839213, -1.663579, 0, 1, 0.5921569, 1,
-0.1569958, 0.5098831, 0.9543361, 0, 1, 0.5960785, 1,
-0.1555546, 0.3026651, -0.2008683, 0, 1, 0.6039216, 1,
-0.1507699, 1.009635, -1.132221, 0, 1, 0.6117647, 1,
-0.1482144, 0.3412082, 0.528729, 0, 1, 0.6156863, 1,
-0.1456465, -1.158264, -3.908208, 0, 1, 0.6235294, 1,
-0.1402022, 0.2679841, -1.304082, 0, 1, 0.627451, 1,
-0.1330461, 0.03788944, -0.390971, 0, 1, 0.6352941, 1,
-0.1328314, -0.0498968, -2.244123, 0, 1, 0.6392157, 1,
-0.1313726, 0.04746228, 0.3644844, 0, 1, 0.6470588, 1,
-0.1271779, 2.959337, -1.888284, 0, 1, 0.6509804, 1,
-0.1252379, -0.41036, -2.413682, 0, 1, 0.6588235, 1,
-0.1244332, -0.9325393, -2.14333, 0, 1, 0.6627451, 1,
-0.1212512, 0.004351233, -3.124657, 0, 1, 0.6705883, 1,
-0.1161518, 0.8749729, 0.2933823, 0, 1, 0.6745098, 1,
-0.1119632, -0.06943985, -1.182492, 0, 1, 0.682353, 1,
-0.1116371, -1.586034, -3.091517, 0, 1, 0.6862745, 1,
-0.1113792, -0.2063629, -1.457279, 0, 1, 0.6941177, 1,
-0.1113543, 1.506734, 0.2652875, 0, 1, 0.7019608, 1,
-0.1071748, 0.288472, -1.57006, 0, 1, 0.7058824, 1,
-0.1044511, 0.2962416, -1.289425, 0, 1, 0.7137255, 1,
-0.1013812, -0.6841284, -3.670283, 0, 1, 0.7176471, 1,
-0.09218426, 0.5662498, -0.4184461, 0, 1, 0.7254902, 1,
-0.08748364, -0.7831833, -2.69829, 0, 1, 0.7294118, 1,
-0.08014703, 0.04533046, -3.881712, 0, 1, 0.7372549, 1,
-0.08001142, 0.1242666, -1.491776, 0, 1, 0.7411765, 1,
-0.07426111, 0.006173213, -1.370139, 0, 1, 0.7490196, 1,
-0.07248274, 0.04094478, -0.6721417, 0, 1, 0.7529412, 1,
-0.07118754, 1.418752, 2.693374, 0, 1, 0.7607843, 1,
-0.06978986, -0.7942205, -2.591207, 0, 1, 0.7647059, 1,
-0.06936973, -0.7960793, -3.391384, 0, 1, 0.772549, 1,
-0.06630947, 0.8572104, -0.327736, 0, 1, 0.7764706, 1,
-0.06364387, -0.6791124, -3.572838, 0, 1, 0.7843137, 1,
-0.06237981, 0.3610142, -1.211202, 0, 1, 0.7882353, 1,
-0.0596413, 0.6901977, -0.9340367, 0, 1, 0.7960784, 1,
-0.0590019, 0.1191805, 0.5872266, 0, 1, 0.8039216, 1,
-0.05679785, 0.09604161, 0.5662052, 0, 1, 0.8078431, 1,
-0.05559668, -0.7575223, -5.048044, 0, 1, 0.8156863, 1,
-0.05277097, 0.1144555, -1.242618, 0, 1, 0.8196079, 1,
-0.0508816, 0.5795158, 0.1537773, 0, 1, 0.827451, 1,
-0.04994692, -2.260538, -1.858936, 0, 1, 0.8313726, 1,
-0.04911146, 0.442041, 0.7576007, 0, 1, 0.8392157, 1,
-0.04636708, -0.4184613, -3.813917, 0, 1, 0.8431373, 1,
-0.0418126, -0.1150103, -3.766008, 0, 1, 0.8509804, 1,
-0.03671998, -1.691404, -2.043661, 0, 1, 0.854902, 1,
-0.03619538, 1.421384, -0.9490141, 0, 1, 0.8627451, 1,
-0.03460281, 0.1928863, 0.2593843, 0, 1, 0.8666667, 1,
-0.02247235, 0.4249157, -0.02629874, 0, 1, 0.8745098, 1,
-0.01932466, 2.498897, 0.2103275, 0, 1, 0.8784314, 1,
-0.01793803, -0.7837668, -2.919165, 0, 1, 0.8862745, 1,
-0.01685236, -2.314404, -2.615038, 0, 1, 0.8901961, 1,
-0.01611386, -0.2395786, -2.642452, 0, 1, 0.8980392, 1,
-0.01415469, 0.5353532, 1.364862, 0, 1, 0.9058824, 1,
-0.01128881, -0.9383083, -2.582141, 0, 1, 0.9098039, 1,
-0.009101558, 0.345678, -0.2683172, 0, 1, 0.9176471, 1,
-0.008897354, -1.132059, -4.436386, 0, 1, 0.9215686, 1,
-0.008730645, 0.8980314, -1.055758, 0, 1, 0.9294118, 1,
-0.004321627, -1.041018, -3.971647, 0, 1, 0.9333333, 1,
-0.001148843, 0.5260431, -1.358392, 0, 1, 0.9411765, 1,
0.002125367, -0.3831366, 2.285021, 0, 1, 0.945098, 1,
0.004451379, 0.4665716, -1.382434, 0, 1, 0.9529412, 1,
0.004559244, -0.08977004, 4.173222, 0, 1, 0.9568627, 1,
0.005181815, -0.03301109, 2.603789, 0, 1, 0.9647059, 1,
0.01060025, 1.942026, -0.6751316, 0, 1, 0.9686275, 1,
0.01148173, -0.9998131, 2.606431, 0, 1, 0.9764706, 1,
0.01344535, -0.872336, 4.803095, 0, 1, 0.9803922, 1,
0.01827892, 1.493751, -0.2113982, 0, 1, 0.9882353, 1,
0.02184186, -0.4917204, 3.794919, 0, 1, 0.9921569, 1,
0.02434076, 0.2290774, -0.6393924, 0, 1, 1, 1,
0.02596196, 1.118086, 0.112968, 0, 0.9921569, 1, 1,
0.02819796, 0.1847072, 0.9658878, 0, 0.9882353, 1, 1,
0.03198308, -0.5051333, 3.298971, 0, 0.9803922, 1, 1,
0.037103, -0.2351687, 3.643853, 0, 0.9764706, 1, 1,
0.03828471, 1.22394, -0.4648729, 0, 0.9686275, 1, 1,
0.04930609, 2.120144, 1.260247, 0, 0.9647059, 1, 1,
0.05021911, -0.1065861, 3.872544, 0, 0.9568627, 1, 1,
0.05736776, -0.8808779, 2.477969, 0, 0.9529412, 1, 1,
0.05811893, -0.1126896, 5.152165, 0, 0.945098, 1, 1,
0.05826246, -0.462997, 3.176656, 0, 0.9411765, 1, 1,
0.06095759, 0.09485527, 0.3218008, 0, 0.9333333, 1, 1,
0.06359947, -0.1759442, 2.128184, 0, 0.9294118, 1, 1,
0.06859849, -0.1021336, 2.241076, 0, 0.9215686, 1, 1,
0.06937232, 0.9954023, 0.6511282, 0, 0.9176471, 1, 1,
0.07088932, 0.8761455, -0.05364787, 0, 0.9098039, 1, 1,
0.07194421, 0.133751, 1.06401, 0, 0.9058824, 1, 1,
0.07455445, 1.405579, -1.202824, 0, 0.8980392, 1, 1,
0.07786825, -0.8446693, 2.744012, 0, 0.8901961, 1, 1,
0.08015408, 0.1757448, 0.2755772, 0, 0.8862745, 1, 1,
0.08304296, -0.4506194, 2.294043, 0, 0.8784314, 1, 1,
0.08336074, 1.20145, 2.320579, 0, 0.8745098, 1, 1,
0.08576535, -0.3634414, 2.248631, 0, 0.8666667, 1, 1,
0.08804005, -0.5088524, 4.352916, 0, 0.8627451, 1, 1,
0.08942788, 0.5345899, 0.5913479, 0, 0.854902, 1, 1,
0.09247745, -1.05716, 3.912972, 0, 0.8509804, 1, 1,
0.1043303, 0.9342569, 0.6865849, 0, 0.8431373, 1, 1,
0.1062509, -0.005534206, 4.09178, 0, 0.8392157, 1, 1,
0.1105611, 1.6243, -1.287182, 0, 0.8313726, 1, 1,
0.1105737, -0.24619, 1.119202, 0, 0.827451, 1, 1,
0.1113346, -0.2033081, 2.169674, 0, 0.8196079, 1, 1,
0.1125088, -0.3139591, 3.398283, 0, 0.8156863, 1, 1,
0.1140269, 0.4719014, 1.536435, 0, 0.8078431, 1, 1,
0.1178695, -0.7759644, 2.821846, 0, 0.8039216, 1, 1,
0.1209845, -0.4236625, 1.16301, 0, 0.7960784, 1, 1,
0.1214282, 0.9472943, 0.3647932, 0, 0.7882353, 1, 1,
0.1226477, -0.3542432, 1.628383, 0, 0.7843137, 1, 1,
0.1229168, -0.3508181, 1.428417, 0, 0.7764706, 1, 1,
0.1229656, 1.430521, -0.5987581, 0, 0.772549, 1, 1,
0.1230548, -0.4919036, 3.158501, 0, 0.7647059, 1, 1,
0.1231306, 0.7139349, -0.6471092, 0, 0.7607843, 1, 1,
0.1250309, 1.440674, 0.1567456, 0, 0.7529412, 1, 1,
0.1250752, 0.6998527, 0.5351611, 0, 0.7490196, 1, 1,
0.1253596, 0.2960926, -0.6667049, 0, 0.7411765, 1, 1,
0.1273189, 0.5794791, -0.1002116, 0, 0.7372549, 1, 1,
0.1283794, -2.035186, 2.262276, 0, 0.7294118, 1, 1,
0.1303186, 0.06579248, 2.438042, 0, 0.7254902, 1, 1,
0.1308845, -1.814453, 2.281031, 0, 0.7176471, 1, 1,
0.1311808, -0.9395303, 3.151575, 0, 0.7137255, 1, 1,
0.1315036, 0.8385556, -1.041459, 0, 0.7058824, 1, 1,
0.1379875, -0.05133876, 2.198592, 0, 0.6980392, 1, 1,
0.1396606, 1.86358, 0.09615879, 0, 0.6941177, 1, 1,
0.1399975, 0.8513845, -0.7170083, 0, 0.6862745, 1, 1,
0.1412023, 2.356173, -0.4764835, 0, 0.682353, 1, 1,
0.1412289, 0.40287, -0.8697729, 0, 0.6745098, 1, 1,
0.1421698, -0.6831796, 1.318841, 0, 0.6705883, 1, 1,
0.1427033, -0.7082346, 1.547933, 0, 0.6627451, 1, 1,
0.1432129, 0.04392609, 2.626678, 0, 0.6588235, 1, 1,
0.1449059, 0.5281464, 0.3064777, 0, 0.6509804, 1, 1,
0.1470691, -1.387558, 0.2833828, 0, 0.6470588, 1, 1,
0.1473648, -0.1172019, 2.442851, 0, 0.6392157, 1, 1,
0.149309, -1.047354, 4.981922, 0, 0.6352941, 1, 1,
0.1509502, 0.7351639, 0.5824237, 0, 0.627451, 1, 1,
0.1514383, -1.390333, 2.731789, 0, 0.6235294, 1, 1,
0.1516745, -0.01458894, 2.238473, 0, 0.6156863, 1, 1,
0.1558887, -1.100139, 1.688068, 0, 0.6117647, 1, 1,
0.1576837, -0.8868381, 3.727834, 0, 0.6039216, 1, 1,
0.1589252, 1.896016, 1.82674, 0, 0.5960785, 1, 1,
0.1612048, -1.067685, 1.288132, 0, 0.5921569, 1, 1,
0.161779, 1.283916, -0.9627126, 0, 0.5843138, 1, 1,
0.1623179, -2.781905, 3.743519, 0, 0.5803922, 1, 1,
0.1644343, -0.1220624, 2.843753, 0, 0.572549, 1, 1,
0.1686066, 0.7823268, 0.7301927, 0, 0.5686275, 1, 1,
0.1694607, -0.5971117, 4.335544, 0, 0.5607843, 1, 1,
0.1703963, 0.4442479, 0.367809, 0, 0.5568628, 1, 1,
0.1781919, -0.6515383, 1.965951, 0, 0.5490196, 1, 1,
0.181419, -0.01948678, 1.109895, 0, 0.5450981, 1, 1,
0.1818741, 0.5226735, 0.7698426, 0, 0.5372549, 1, 1,
0.1851045, -0.8217949, 3.636137, 0, 0.5333334, 1, 1,
0.1851992, -0.01477499, 1.259131, 0, 0.5254902, 1, 1,
0.1867354, 1.147104, -0.1695058, 0, 0.5215687, 1, 1,
0.1925903, -0.1078472, 1.73536, 0, 0.5137255, 1, 1,
0.1957368, -2.092529, 2.849119, 0, 0.509804, 1, 1,
0.1973844, -0.121126, 1.887794, 0, 0.5019608, 1, 1,
0.2016619, -1.305027, 4.521271, 0, 0.4941176, 1, 1,
0.2022457, 0.5910801, 1.7967, 0, 0.4901961, 1, 1,
0.2089083, -0.2836016, 0.6366054, 0, 0.4823529, 1, 1,
0.2137536, -0.3351279, 1.628874, 0, 0.4784314, 1, 1,
0.2227577, -0.2665537, 3.171889, 0, 0.4705882, 1, 1,
0.225571, -2.241536, 3.432706, 0, 0.4666667, 1, 1,
0.2263483, 1.682616, 0.7167876, 0, 0.4588235, 1, 1,
0.2307231, 1.306367, 0.3486556, 0, 0.454902, 1, 1,
0.2310813, 0.2032007, -0.2127248, 0, 0.4470588, 1, 1,
0.2325501, -0.7291934, 1.582072, 0, 0.4431373, 1, 1,
0.2335263, -0.03330438, 3.702782, 0, 0.4352941, 1, 1,
0.2397329, -0.9178706, 1.989361, 0, 0.4313726, 1, 1,
0.2434658, -0.511161, 1.153423, 0, 0.4235294, 1, 1,
0.2437876, 0.4739821, -0.6036601, 0, 0.4196078, 1, 1,
0.2462175, 0.6275233, 0.2590641, 0, 0.4117647, 1, 1,
0.2497782, -1.556618, 2.082156, 0, 0.4078431, 1, 1,
0.2540973, -1.570254, 0.4881806, 0, 0.4, 1, 1,
0.2541072, -0.8652952, 1.401376, 0, 0.3921569, 1, 1,
0.2543219, -0.6760178, 3.511448, 0, 0.3882353, 1, 1,
0.2555652, -0.007034196, 0.06884438, 0, 0.3803922, 1, 1,
0.2641788, -0.4019476, 1.042693, 0, 0.3764706, 1, 1,
0.26599, 0.1419723, 1.033473, 0, 0.3686275, 1, 1,
0.2677112, 0.1611133, -1.419123, 0, 0.3647059, 1, 1,
0.2719987, -0.005416919, 1.884581, 0, 0.3568628, 1, 1,
0.2729163, -0.9284554, 3.164806, 0, 0.3529412, 1, 1,
0.2739618, -0.3771034, 2.777842, 0, 0.345098, 1, 1,
0.274699, -1.23674, 3.548542, 0, 0.3411765, 1, 1,
0.2777697, 0.7919586, 0.2668771, 0, 0.3333333, 1, 1,
0.2799506, 0.9453517, 0.7792122, 0, 0.3294118, 1, 1,
0.280066, 0.151416, -1.029705, 0, 0.3215686, 1, 1,
0.2843813, -0.6404231, 3.24809, 0, 0.3176471, 1, 1,
0.2882765, 1.183998, 1.289192, 0, 0.3098039, 1, 1,
0.2898187, 0.2498224, 0.9282464, 0, 0.3058824, 1, 1,
0.2940509, -0.1918073, 1.937453, 0, 0.2980392, 1, 1,
0.2955134, 1.750878, 1.789145, 0, 0.2901961, 1, 1,
0.2960733, -0.1963605, 2.142751, 0, 0.2862745, 1, 1,
0.2965412, 0.1449128, 1.801894, 0, 0.2784314, 1, 1,
0.3032002, -0.2834063, 2.178385, 0, 0.2745098, 1, 1,
0.3037959, 0.7378761, 1.971253, 0, 0.2666667, 1, 1,
0.3042113, -0.1274123, -0.2614382, 0, 0.2627451, 1, 1,
0.3042759, -0.002068725, 2.268513, 0, 0.254902, 1, 1,
0.3067956, -0.9453743, 3.853452, 0, 0.2509804, 1, 1,
0.3071971, 0.7617895, 1.099298, 0, 0.2431373, 1, 1,
0.3092208, -0.01946668, 1.972222, 0, 0.2392157, 1, 1,
0.3111532, 2.161388, -1.627164, 0, 0.2313726, 1, 1,
0.3119105, -0.2229072, 3.262761, 0, 0.227451, 1, 1,
0.3143664, 0.06930232, 1.26365, 0, 0.2196078, 1, 1,
0.3143897, -1.30487, 2.664264, 0, 0.2156863, 1, 1,
0.3157822, 1.592874, 1.922716, 0, 0.2078431, 1, 1,
0.3168286, -0.9553589, 3.43575, 0, 0.2039216, 1, 1,
0.3255231, -0.2301967, 3.514621, 0, 0.1960784, 1, 1,
0.3267955, 0.2962683, 0.3965096, 0, 0.1882353, 1, 1,
0.329169, 0.4690361, -0.2162046, 0, 0.1843137, 1, 1,
0.3293787, -0.3666371, 2.903071, 0, 0.1764706, 1, 1,
0.3406691, 0.002130301, 1.842197, 0, 0.172549, 1, 1,
0.3418027, -0.5558179, 2.21518, 0, 0.1647059, 1, 1,
0.3423306, -0.7741109, 3.625838, 0, 0.1607843, 1, 1,
0.3464375, 0.5563861, 1.505123, 0, 0.1529412, 1, 1,
0.3466552, -0.6688396, 2.262513, 0, 0.1490196, 1, 1,
0.3511658, 0.2269552, 0.7189756, 0, 0.1411765, 1, 1,
0.3529842, 0.4560621, -0.9268342, 0, 0.1372549, 1, 1,
0.35843, -0.9911935, 2.347452, 0, 0.1294118, 1, 1,
0.3607435, -1.725726, 2.07801, 0, 0.1254902, 1, 1,
0.3637594, 0.06234244, 1.862066, 0, 0.1176471, 1, 1,
0.3663801, -0.5914458, 3.225991, 0, 0.1137255, 1, 1,
0.3677866, 0.08459328, 2.350225, 0, 0.1058824, 1, 1,
0.3692087, -1.514737, 3.657743, 0, 0.09803922, 1, 1,
0.3692883, 0.6274077, 1.531695, 0, 0.09411765, 1, 1,
0.3696508, 0.9398311, 0.2442548, 0, 0.08627451, 1, 1,
0.3708717, -0.9697676, 2.253896, 0, 0.08235294, 1, 1,
0.3716161, 0.7224078, -0.6883997, 0, 0.07450981, 1, 1,
0.3732886, 1.093496, 0.3476402, 0, 0.07058824, 1, 1,
0.3740301, 0.693298, 1.91635, 0, 0.0627451, 1, 1,
0.3831305, 2.109843, -0.09961151, 0, 0.05882353, 1, 1,
0.3853531, -0.1784679, 1.111331, 0, 0.05098039, 1, 1,
0.3858011, -0.6542097, 2.655288, 0, 0.04705882, 1, 1,
0.3901266, 1.106919, 1.182992, 0, 0.03921569, 1, 1,
0.3926195, -0.01869413, 1.457602, 0, 0.03529412, 1, 1,
0.3945391, 0.03756372, 0.9601373, 0, 0.02745098, 1, 1,
0.3968782, 1.092718, 0.6696935, 0, 0.02352941, 1, 1,
0.3977032, 0.688512, 3.056993, 0, 0.01568628, 1, 1,
0.4012661, -1.507343, 0.987047, 0, 0.01176471, 1, 1,
0.4053755, -0.7204843, 1.095905, 0, 0.003921569, 1, 1,
0.4063786, 0.8064552, -1.669616, 0.003921569, 0, 1, 1,
0.4100624, -0.5970984, 1.566981, 0.007843138, 0, 1, 1,
0.4123711, 0.0907674, 1.814553, 0.01568628, 0, 1, 1,
0.4135506, 0.5987797, 0.7605945, 0.01960784, 0, 1, 1,
0.4201682, 0.418279, 0.0283008, 0.02745098, 0, 1, 1,
0.4206766, 0.6944742, -0.3813428, 0.03137255, 0, 1, 1,
0.4253073, 1.325489, 0.54533, 0.03921569, 0, 1, 1,
0.4257964, -2.204954, 3.303095, 0.04313726, 0, 1, 1,
0.4269486, -0.5204992, 2.497009, 0.05098039, 0, 1, 1,
0.427106, 0.1310021, -2.024022, 0.05490196, 0, 1, 1,
0.4315982, -0.7243753, 2.92751, 0.0627451, 0, 1, 1,
0.4319561, 0.5711042, 1.292802, 0.06666667, 0, 1, 1,
0.4323901, -0.8464276, 1.267525, 0.07450981, 0, 1, 1,
0.4338467, -0.2318971, 2.187154, 0.07843138, 0, 1, 1,
0.4368129, 0.8512649, 0.6399536, 0.08627451, 0, 1, 1,
0.4420713, -1.516479, 1.52537, 0.09019608, 0, 1, 1,
0.4457388, -0.3966172, 1.903231, 0.09803922, 0, 1, 1,
0.4484738, -1.265143, 1.37264, 0.1058824, 0, 1, 1,
0.4546579, 0.5649737, -0.5921043, 0.1098039, 0, 1, 1,
0.4568073, 0.03159779, 0.0493474, 0.1176471, 0, 1, 1,
0.4601359, 1.021344, 1.257041, 0.1215686, 0, 1, 1,
0.4738356, -0.2388869, 1.015326, 0.1294118, 0, 1, 1,
0.4766897, 1.081313, 0.4684828, 0.1333333, 0, 1, 1,
0.4830005, 0.1703216, 1.811309, 0.1411765, 0, 1, 1,
0.4835992, 1.06466, 0.7217007, 0.145098, 0, 1, 1,
0.4911126, -1.161307, 3.277706, 0.1529412, 0, 1, 1,
0.5006444, 0.007531457, 1.026611, 0.1568628, 0, 1, 1,
0.5028129, -0.04636499, 1.382122, 0.1647059, 0, 1, 1,
0.5050021, 0.7619307, 0.2704709, 0.1686275, 0, 1, 1,
0.5058197, -0.5016785, 1.558416, 0.1764706, 0, 1, 1,
0.5058636, 1.645099, -0.8447846, 0.1803922, 0, 1, 1,
0.5191773, -1.998983, 3.02734, 0.1882353, 0, 1, 1,
0.5219651, 0.06169847, 2.575672, 0.1921569, 0, 1, 1,
0.5265226, 0.01022278, -0.3459559, 0.2, 0, 1, 1,
0.5287628, 1.302269, 0.8240245, 0.2078431, 0, 1, 1,
0.5307156, 0.01106799, 0.9447554, 0.2117647, 0, 1, 1,
0.5313675, 0.06187327, 1.965448, 0.2196078, 0, 1, 1,
0.5349696, 1.584337, -0.507764, 0.2235294, 0, 1, 1,
0.5361779, -0.5589473, 1.879422, 0.2313726, 0, 1, 1,
0.537153, -1.709415, 3.062868, 0.2352941, 0, 1, 1,
0.540256, 2.320261, -0.7673723, 0.2431373, 0, 1, 1,
0.5424908, -2.113082, 3.783128, 0.2470588, 0, 1, 1,
0.5437436, -1.152062, 2.157782, 0.254902, 0, 1, 1,
0.546575, -0.5593332, 1.70189, 0.2588235, 0, 1, 1,
0.5487663, -2.008738, 2.930138, 0.2666667, 0, 1, 1,
0.556922, -0.2511519, 2.82387, 0.2705882, 0, 1, 1,
0.5588163, 0.6734083, 0.180613, 0.2784314, 0, 1, 1,
0.5600229, -1.100824, 1.623675, 0.282353, 0, 1, 1,
0.5664281, -1.289725, 2.67734, 0.2901961, 0, 1, 1,
0.56852, 0.8029047, 0.6898776, 0.2941177, 0, 1, 1,
0.5692847, 0.5668983, 1.094369, 0.3019608, 0, 1, 1,
0.5701365, 0.6483099, 1.84462, 0.3098039, 0, 1, 1,
0.5714808, -1.509606, 2.851395, 0.3137255, 0, 1, 1,
0.5746994, -1.985011, 2.782862, 0.3215686, 0, 1, 1,
0.5780043, 0.3674774, 2.072938, 0.3254902, 0, 1, 1,
0.584567, 1.019455, -0.4792819, 0.3333333, 0, 1, 1,
0.5855083, 2.112517, 0.3770049, 0.3372549, 0, 1, 1,
0.5871561, -0.5281683, 3.291583, 0.345098, 0, 1, 1,
0.5886649, 0.3145091, 1.723324, 0.3490196, 0, 1, 1,
0.5888776, 0.258695, 1.203336, 0.3568628, 0, 1, 1,
0.5893342, 0.1870282, 1.553267, 0.3607843, 0, 1, 1,
0.5925227, -0.0002954493, 1.667655, 0.3686275, 0, 1, 1,
0.5945613, 0.0278629, 0.4670271, 0.372549, 0, 1, 1,
0.5992543, -0.6464649, 3.641052, 0.3803922, 0, 1, 1,
0.6027644, -0.5555764, 4.278503, 0.3843137, 0, 1, 1,
0.6126025, -0.370667, 1.307529, 0.3921569, 0, 1, 1,
0.6170245, 1.709067, 0.3821914, 0.3960784, 0, 1, 1,
0.6173817, 0.6592209, 1.080619, 0.4039216, 0, 1, 1,
0.6221844, 0.7633418, 0.8118915, 0.4117647, 0, 1, 1,
0.6241003, 0.5591245, 0.6225904, 0.4156863, 0, 1, 1,
0.6272851, 0.8456108, 0.2808244, 0.4235294, 0, 1, 1,
0.6353863, 0.330127, 3.569586, 0.427451, 0, 1, 1,
0.6355114, 0.2063541, 0.9654667, 0.4352941, 0, 1, 1,
0.6431465, 2.203483, 0.3138139, 0.4392157, 0, 1, 1,
0.6457511, 0.9650464, 0.1754481, 0.4470588, 0, 1, 1,
0.6480746, -0.510554, 0.9318406, 0.4509804, 0, 1, 1,
0.6489493, 1.530387, 0.2217821, 0.4588235, 0, 1, 1,
0.6513357, 0.9157951, 1.072746, 0.4627451, 0, 1, 1,
0.6640975, -0.7806888, 4.090596, 0.4705882, 0, 1, 1,
0.6650808, 0.3556522, 2.211884, 0.4745098, 0, 1, 1,
0.6674695, 1.721223, 0.02190438, 0.4823529, 0, 1, 1,
0.6677247, 1.033284, 1.095327, 0.4862745, 0, 1, 1,
0.6687146, 1.035312, -1.106542, 0.4941176, 0, 1, 1,
0.6715404, 0.8136519, 1.209931, 0.5019608, 0, 1, 1,
0.681361, -0.6655155, 2.408306, 0.5058824, 0, 1, 1,
0.6821506, -0.8241412, 2.396047, 0.5137255, 0, 1, 1,
0.6861572, -0.7453265, 1.51054, 0.5176471, 0, 1, 1,
0.7017762, 0.7584136, 0.8257698, 0.5254902, 0, 1, 1,
0.7023006, -0.4426271, 2.62541, 0.5294118, 0, 1, 1,
0.703674, -0.557022, 2.046634, 0.5372549, 0, 1, 1,
0.7044019, -0.249288, 0.8272735, 0.5411765, 0, 1, 1,
0.7051088, -0.4577813, 0.4507909, 0.5490196, 0, 1, 1,
0.7083155, -1.081941, 2.362529, 0.5529412, 0, 1, 1,
0.7242044, -0.2279309, 1.41896, 0.5607843, 0, 1, 1,
0.7316705, 0.5858843, 0.800043, 0.5647059, 0, 1, 1,
0.7355427, -0.1816628, 1.897858, 0.572549, 0, 1, 1,
0.7367293, 0.3315409, 0.8267031, 0.5764706, 0, 1, 1,
0.7385342, -0.2823924, 0.03795014, 0.5843138, 0, 1, 1,
0.7395499, 1.537136, 0.1063113, 0.5882353, 0, 1, 1,
0.7432428, 0.3275355, 1.869836, 0.5960785, 0, 1, 1,
0.7450394, -1.068793, 2.263696, 0.6039216, 0, 1, 1,
0.7491271, 0.6670429, -0.004915465, 0.6078432, 0, 1, 1,
0.7507786, -0.940198, -0.09878417, 0.6156863, 0, 1, 1,
0.7518906, -0.3693665, 2.446479, 0.6196079, 0, 1, 1,
0.7520194, -1.279525, 2.86899, 0.627451, 0, 1, 1,
0.7542405, 1.182779, 0.07550721, 0.6313726, 0, 1, 1,
0.7610281, 1.14767, 2.077636, 0.6392157, 0, 1, 1,
0.7696895, -1.116392, 2.74059, 0.6431373, 0, 1, 1,
0.7702013, 0.7757901, 2.452627, 0.6509804, 0, 1, 1,
0.77093, -1.054938, 3.697306, 0.654902, 0, 1, 1,
0.7718115, 0.6119673, 0.827301, 0.6627451, 0, 1, 1,
0.7754319, 0.5527089, 1.00579, 0.6666667, 0, 1, 1,
0.7788991, -0.1364998, 2.013107, 0.6745098, 0, 1, 1,
0.7793585, 1.879125, 0.6688197, 0.6784314, 0, 1, 1,
0.7810843, -0.5186154, 2.257583, 0.6862745, 0, 1, 1,
0.7821236, 0.1500869, 1.539928, 0.6901961, 0, 1, 1,
0.7823065, -1.105482, 2.296674, 0.6980392, 0, 1, 1,
0.7840265, -0.2519509, 3.432855, 0.7058824, 0, 1, 1,
0.7851548, -0.3712692, -0.01157605, 0.7098039, 0, 1, 1,
0.7880269, -0.6331815, 1.268179, 0.7176471, 0, 1, 1,
0.790038, 0.3242317, 1.205502, 0.7215686, 0, 1, 1,
0.7933245, -1.632938, 3.21575, 0.7294118, 0, 1, 1,
0.7934047, -0.596221, 1.492336, 0.7333333, 0, 1, 1,
0.7943964, -0.123415, 1.593349, 0.7411765, 0, 1, 1,
0.7950765, 0.8954542, 1.96522, 0.7450981, 0, 1, 1,
0.7958997, 0.8892975, 0.5668651, 0.7529412, 0, 1, 1,
0.8141121, 0.6403592, 1.130105, 0.7568628, 0, 1, 1,
0.8176049, -0.1309241, 1.077111, 0.7647059, 0, 1, 1,
0.8177818, 0.8041884, -0.05721303, 0.7686275, 0, 1, 1,
0.8182524, 1.108225, 0.9429541, 0.7764706, 0, 1, 1,
0.82328, -0.1940367, 1.51242, 0.7803922, 0, 1, 1,
0.824602, 0.9736152, 0.8928464, 0.7882353, 0, 1, 1,
0.834668, -1.704847, 2.251277, 0.7921569, 0, 1, 1,
0.8368284, 0.6689441, 1.452587, 0.8, 0, 1, 1,
0.8387083, 0.3945647, 1.223927, 0.8078431, 0, 1, 1,
0.840681, -0.7177179, 1.756214, 0.8117647, 0, 1, 1,
0.8410812, -0.254861, 1.017508, 0.8196079, 0, 1, 1,
0.8463216, -1.086009, 1.953253, 0.8235294, 0, 1, 1,
0.8491154, -0.5426119, 1.304714, 0.8313726, 0, 1, 1,
0.8506353, 0.6972713, 0.8036761, 0.8352941, 0, 1, 1,
0.8510849, 0.6173297, -0.3279905, 0.8431373, 0, 1, 1,
0.8579887, -1.455151, 2.469246, 0.8470588, 0, 1, 1,
0.8656617, -0.3513902, 0.9484187, 0.854902, 0, 1, 1,
0.8693789, 0.5247225, 1.45762, 0.8588235, 0, 1, 1,
0.8736293, 0.8514426, 1.302831, 0.8666667, 0, 1, 1,
0.8757354, -0.4303941, 1.473572, 0.8705882, 0, 1, 1,
0.8828162, -0.9978708, 2.04394, 0.8784314, 0, 1, 1,
0.8852963, 0.5543467, 1.310572, 0.8823529, 0, 1, 1,
0.8959966, -1.8805, 3.030993, 0.8901961, 0, 1, 1,
0.8998636, -1.076301, 2.271415, 0.8941177, 0, 1, 1,
0.9093303, 0.2511913, 0.9542849, 0.9019608, 0, 1, 1,
0.9107112, -0.4564151, 3.057328, 0.9098039, 0, 1, 1,
0.9111634, -0.6485943, 1.048304, 0.9137255, 0, 1, 1,
0.9197141, 1.005876, 0.89331, 0.9215686, 0, 1, 1,
0.9198515, 0.1194558, 0.5448257, 0.9254902, 0, 1, 1,
0.9203916, 0.9700601, 2.574959, 0.9333333, 0, 1, 1,
0.9270068, -0.0227174, 0.1912046, 0.9372549, 0, 1, 1,
0.9306086, 0.3396183, 0.8871701, 0.945098, 0, 1, 1,
0.93301, -0.1433015, 2.041009, 0.9490196, 0, 1, 1,
0.9330295, -0.5051602, 1.802601, 0.9568627, 0, 1, 1,
0.9343217, 0.7238386, 1.072182, 0.9607843, 0, 1, 1,
0.9404223, -0.8312606, 3.073714, 0.9686275, 0, 1, 1,
0.9420283, -2.850274, 2.77748, 0.972549, 0, 1, 1,
0.9429334, -0.7003135, 2.872279, 0.9803922, 0, 1, 1,
0.9600581, 0.5972578, 0.4436446, 0.9843137, 0, 1, 1,
0.9610533, 0.7320093, 1.360539, 0.9921569, 0, 1, 1,
0.9643456, -1.151112, 1.074634, 0.9960784, 0, 1, 1,
0.9663798, -0.5258223, 3.384141, 1, 0, 0.9960784, 1,
0.9667854, -0.4395658, 2.849677, 1, 0, 0.9882353, 1,
0.9687762, -0.7023725, 1.074958, 1, 0, 0.9843137, 1,
0.9693364, -1.046827, 2.969416, 1, 0, 0.9764706, 1,
0.9708338, 0.1073153, 0.5278414, 1, 0, 0.972549, 1,
0.9714541, -0.1861839, 2.765802, 1, 0, 0.9647059, 1,
0.9724023, 1.505894, 1.529325, 1, 0, 0.9607843, 1,
0.9851442, 0.4478754, 1.539687, 1, 0, 0.9529412, 1,
0.9860936, -0.5544831, 2.157016, 1, 0, 0.9490196, 1,
0.9904082, -1.437573, 3.959696, 1, 0, 0.9411765, 1,
0.9905258, -0.8774991, 2.775385, 1, 0, 0.9372549, 1,
1.005211, -0.7243251, 1.702405, 1, 0, 0.9294118, 1,
1.006516, -0.1613482, 2.869173, 1, 0, 0.9254902, 1,
1.007239, -0.3390605, 2.637278, 1, 0, 0.9176471, 1,
1.017567, 0.6849079, 0.8485364, 1, 0, 0.9137255, 1,
1.019347, -0.6075241, 2.683037, 1, 0, 0.9058824, 1,
1.022351, -1.186172, 2.923076, 1, 0, 0.9019608, 1,
1.022469, -0.0233249, 2.723471, 1, 0, 0.8941177, 1,
1.022904, 1.670062, 1.131306, 1, 0, 0.8862745, 1,
1.027189, -0.8072466, 2.262901, 1, 0, 0.8823529, 1,
1.027882, -0.06179909, 2.564935, 1, 0, 0.8745098, 1,
1.032682, -1.458554, 1.818186, 1, 0, 0.8705882, 1,
1.035196, -1.585092, 1.790853, 1, 0, 0.8627451, 1,
1.036702, -0.4642078, 1.336785, 1, 0, 0.8588235, 1,
1.037345, -0.3757487, 3.399675, 1, 0, 0.8509804, 1,
1.042693, 1.372847, 0.01264012, 1, 0, 0.8470588, 1,
1.042953, -0.2139639, 3.641986, 1, 0, 0.8392157, 1,
1.044038, -0.0952277, 0.9644292, 1, 0, 0.8352941, 1,
1.050304, -0.133417, 1.060365, 1, 0, 0.827451, 1,
1.051863, -0.01388649, 2.025533, 1, 0, 0.8235294, 1,
1.06952, 0.9242743, 1.387084, 1, 0, 0.8156863, 1,
1.073673, 1.347632, 0.7341859, 1, 0, 0.8117647, 1,
1.079239, -1.430046, 2.254834, 1, 0, 0.8039216, 1,
1.085772, -0.1243897, 0.6312267, 1, 0, 0.7960784, 1,
1.092752, -0.9672978, 3.839026, 1, 0, 0.7921569, 1,
1.096333, -1.118655, 4.136019, 1, 0, 0.7843137, 1,
1.098695, 0.2756349, 1.302693, 1, 0, 0.7803922, 1,
1.101517, 1.175438, 2.020789, 1, 0, 0.772549, 1,
1.103635, -1.8585, 1.063512, 1, 0, 0.7686275, 1,
1.107495, -1.034316, 1.906304, 1, 0, 0.7607843, 1,
1.117046, -0.1620049, 1.939379, 1, 0, 0.7568628, 1,
1.121873, 1.270606, 0.7543951, 1, 0, 0.7490196, 1,
1.123264, 1.765638, 0.9813875, 1, 0, 0.7450981, 1,
1.125697, 2.186244, -0.09542172, 1, 0, 0.7372549, 1,
1.129449, -0.3932739, 3.315372, 1, 0, 0.7333333, 1,
1.131719, -0.2514078, 3.413789, 1, 0, 0.7254902, 1,
1.136763, -1.147337, 3.307941, 1, 0, 0.7215686, 1,
1.138673, -0.5477595, 1.918366, 1, 0, 0.7137255, 1,
1.149536, -1.675292, 3.256641, 1, 0, 0.7098039, 1,
1.153571, 0.2413518, -0.2243397, 1, 0, 0.7019608, 1,
1.164115, -0.308289, 2.189296, 1, 0, 0.6941177, 1,
1.166676, -0.4518903, 0.7625315, 1, 0, 0.6901961, 1,
1.177487, 1.270216, 2.944771, 1, 0, 0.682353, 1,
1.182087, 1.47799, 1.055472, 1, 0, 0.6784314, 1,
1.186549, -0.5951468, 0.897182, 1, 0, 0.6705883, 1,
1.189081, 0.4227413, 1.173293, 1, 0, 0.6666667, 1,
1.191916, 0.7871712, 0.1162473, 1, 0, 0.6588235, 1,
1.19679, -1.616144, 1.896321, 1, 0, 0.654902, 1,
1.199521, 0.7426917, 0.9513859, 1, 0, 0.6470588, 1,
1.201047, -1.009006, 2.770844, 1, 0, 0.6431373, 1,
1.225184, -0.1623405, 2.741604, 1, 0, 0.6352941, 1,
1.226423, 0.1988102, 1.059445, 1, 0, 0.6313726, 1,
1.235054, -0.2336487, 2.403805, 1, 0, 0.6235294, 1,
1.235454, -1.995811, 2.742224, 1, 0, 0.6196079, 1,
1.243097, -0.311196, 0.8164598, 1, 0, 0.6117647, 1,
1.246437, 0.0005162266, 0.6080229, 1, 0, 0.6078432, 1,
1.247982, 0.3711284, 2.044495, 1, 0, 0.6, 1,
1.252024, -0.263643, 1.617793, 1, 0, 0.5921569, 1,
1.264873, 0.3979616, 0.7315245, 1, 0, 0.5882353, 1,
1.269719, 0.3132595, 0.4624757, 1, 0, 0.5803922, 1,
1.276946, -0.19662, 1.267171, 1, 0, 0.5764706, 1,
1.283681, 1.495951, 0.5206817, 1, 0, 0.5686275, 1,
1.294773, -0.8431218, 1.640236, 1, 0, 0.5647059, 1,
1.296632, -0.8331528, 2.731576, 1, 0, 0.5568628, 1,
1.298002, 0.02418762, 1.362938, 1, 0, 0.5529412, 1,
1.301593, -0.4837371, 1.697864, 1, 0, 0.5450981, 1,
1.306106, 2.006321, -0.1648692, 1, 0, 0.5411765, 1,
1.307675, -0.5016584, 2.188683, 1, 0, 0.5333334, 1,
1.311811, -1.440838, 1.160683, 1, 0, 0.5294118, 1,
1.312002, -1.160097, 2.70035, 1, 0, 0.5215687, 1,
1.312181, -0.6450555, 1.412506, 1, 0, 0.5176471, 1,
1.313957, -0.7411402, 2.568823, 1, 0, 0.509804, 1,
1.314206, 0.1827767, 2.366407, 1, 0, 0.5058824, 1,
1.321434, -0.7476188, 1.685225, 1, 0, 0.4980392, 1,
1.333977, 1.343196, 1.113977, 1, 0, 0.4901961, 1,
1.341086, -1.526384, 2.628762, 1, 0, 0.4862745, 1,
1.359946, -1.01919, 2.271856, 1, 0, 0.4784314, 1,
1.38195, 0.0764033, 0.9665712, 1, 0, 0.4745098, 1,
1.386595, -1.896146, 1.591921, 1, 0, 0.4666667, 1,
1.387381, 2.315573, 1.113838, 1, 0, 0.4627451, 1,
1.394697, 0.1055229, 1.798428, 1, 0, 0.454902, 1,
1.395542, -0.06796332, 1.074773, 1, 0, 0.4509804, 1,
1.402139, -0.9954597, 3.10123, 1, 0, 0.4431373, 1,
1.40901, -0.2396413, 2.319629, 1, 0, 0.4392157, 1,
1.417058, -0.4926691, 2.627955, 1, 0, 0.4313726, 1,
1.417105, -0.3392097, 1.090679, 1, 0, 0.427451, 1,
1.425706, 0.7608495, 1.101538, 1, 0, 0.4196078, 1,
1.42804, -0.5312714, 1.591499, 1, 0, 0.4156863, 1,
1.445536, -0.6635196, 2.746628, 1, 0, 0.4078431, 1,
1.460532, -0.3707905, 1.487368, 1, 0, 0.4039216, 1,
1.483504, -0.8428141, 3.155978, 1, 0, 0.3960784, 1,
1.49005, -2.015878, 2.296364, 1, 0, 0.3882353, 1,
1.499264, -1.71691, 2.071524, 1, 0, 0.3843137, 1,
1.500117, -0.5681541, 3.3284, 1, 0, 0.3764706, 1,
1.50332, 0.06079914, 0.3457145, 1, 0, 0.372549, 1,
1.519929, 0.2107552, 2.088488, 1, 0, 0.3647059, 1,
1.524251, 1.21629, -0.4178528, 1, 0, 0.3607843, 1,
1.526027, 0.8389788, 3.0202, 1, 0, 0.3529412, 1,
1.54566, -1.478157, 0.9565459, 1, 0, 0.3490196, 1,
1.54636, 0.8219847, 0.4580778, 1, 0, 0.3411765, 1,
1.55109, -0.2974589, 1.994831, 1, 0, 0.3372549, 1,
1.554125, 0.6816902, 2.175094, 1, 0, 0.3294118, 1,
1.568198, -1.86579, 1.636626, 1, 0, 0.3254902, 1,
1.583378, -0.6635761, 1.491067, 1, 0, 0.3176471, 1,
1.590409, 1.281874, 0.005175097, 1, 0, 0.3137255, 1,
1.609079, -1.373993, 2.618807, 1, 0, 0.3058824, 1,
1.623405, -0.1432616, 1.631075, 1, 0, 0.2980392, 1,
1.634296, 0.7707935, 1.518992, 1, 0, 0.2941177, 1,
1.635247, 0.9213239, 1.124829, 1, 0, 0.2862745, 1,
1.672544, -1.464504, 2.856535, 1, 0, 0.282353, 1,
1.688153, 0.3560166, 1.027963, 1, 0, 0.2745098, 1,
1.702629, 0.3057672, 0.6297182, 1, 0, 0.2705882, 1,
1.703287, -1.34578, 1.460327, 1, 0, 0.2627451, 1,
1.707141, 0.783347, 2.268031, 1, 0, 0.2588235, 1,
1.716611, 0.6308023, 0.4193122, 1, 0, 0.2509804, 1,
1.716727, -0.4242753, 2.156292, 1, 0, 0.2470588, 1,
1.726816, -0.5679268, 1.264292, 1, 0, 0.2392157, 1,
1.731791, 0.2556931, 0.6697289, 1, 0, 0.2352941, 1,
1.733308, 1.333297, 0.8667735, 1, 0, 0.227451, 1,
1.746971, -1.705639, 2.839988, 1, 0, 0.2235294, 1,
1.763307, -0.7344366, 1.800297, 1, 0, 0.2156863, 1,
1.764372, 0.3641521, 0.4597444, 1, 0, 0.2117647, 1,
1.774241, 0.5475796, 0.4840775, 1, 0, 0.2039216, 1,
1.790824, 0.6282784, 1.040962, 1, 0, 0.1960784, 1,
1.800848, -0.999504, 1.723251, 1, 0, 0.1921569, 1,
1.809192, -0.3255615, -0.5145208, 1, 0, 0.1843137, 1,
1.822367, 0.7595474, 0.268305, 1, 0, 0.1803922, 1,
1.846089, 0.09385066, 0.9741664, 1, 0, 0.172549, 1,
1.872717, 0.9026759, 1.657622, 1, 0, 0.1686275, 1,
1.873709, -0.04118953, 1.42033, 1, 0, 0.1607843, 1,
1.876512, 0.9250988, 1.695485, 1, 0, 0.1568628, 1,
1.889246, -0.1188411, 1.040054, 1, 0, 0.1490196, 1,
1.901585, -1.111494, 2.691431, 1, 0, 0.145098, 1,
1.939701, 0.1548618, 1.516964, 1, 0, 0.1372549, 1,
1.95961, 0.1923189, 0.7397195, 1, 0, 0.1333333, 1,
1.965095, -1.96331, 2.286564, 1, 0, 0.1254902, 1,
1.978173, -1.128077, 2.884586, 1, 0, 0.1215686, 1,
1.986982, -0.7849018, 1.255489, 1, 0, 0.1137255, 1,
1.993485, -1.196422, 3.789116, 1, 0, 0.1098039, 1,
1.993759, 0.9496429, 1.80644, 1, 0, 0.1019608, 1,
1.998233, 0.6032137, 1.793034, 1, 0, 0.09411765, 1,
2.007165, 1.408448, 1.74341, 1, 0, 0.09019608, 1,
2.058019, 1.585586, 2.27775, 1, 0, 0.08235294, 1,
2.079591, -0.8141793, 2.798172, 1, 0, 0.07843138, 1,
2.105827, 1.480626, 2.059902, 1, 0, 0.07058824, 1,
2.136572, -1.517982, 2.539367, 1, 0, 0.06666667, 1,
2.14179, 0.3615951, 2.055857, 1, 0, 0.05882353, 1,
2.146602, 0.02669765, 2.377689, 1, 0, 0.05490196, 1,
2.175925, -1.628393, 2.519071, 1, 0, 0.04705882, 1,
2.182107, -1.301699, 0.5619503, 1, 0, 0.04313726, 1,
2.37823, 1.097087, 0.7736492, 1, 0, 0.03529412, 1,
2.385931, -0.6905581, 2.535568, 1, 0, 0.03137255, 1,
2.474627, -1.443312, 0.9201511, 1, 0, 0.02352941, 1,
2.893169, -0.7802114, 1.825478, 1, 0, 0.01960784, 1,
3.123251, -1.050586, 1.20244, 1, 0, 0.01176471, 1,
3.388467, 0.6252092, 0.2630231, 1, 0, 0.007843138, 1
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
-0.01694167, -3.855685, -7.608983, 0, -0.5, 0.5, 0.5,
-0.01694167, -3.855685, -7.608983, 1, -0.5, 0.5, 0.5,
-0.01694167, -3.855685, -7.608983, 1, 1.5, 0.5, 0.5,
-0.01694167, -3.855685, -7.608983, 0, 1.5, 0.5, 0.5
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
-4.576784, 0.1155419, -7.608983, 0, -0.5, 0.5, 0.5,
-4.576784, 0.1155419, -7.608983, 1, -0.5, 0.5, 0.5,
-4.576784, 0.1155419, -7.608983, 1, 1.5, 0.5, 0.5,
-4.576784, 0.1155419, -7.608983, 0, 1.5, 0.5, 0.5
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
-4.576784, -3.855685, -0.3036482, 0, -0.5, 0.5, 0.5,
-4.576784, -3.855685, -0.3036482, 1, -0.5, 0.5, 0.5,
-4.576784, -3.855685, -0.3036482, 1, 1.5, 0.5, 0.5,
-4.576784, -3.855685, -0.3036482, 0, 1.5, 0.5, 0.5
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
-3, -2.939248, -5.923136,
3, -2.939248, -5.923136,
-3, -2.939248, -5.923136,
-3, -3.091988, -6.204111,
-2, -2.939248, -5.923136,
-2, -3.091988, -6.204111,
-1, -2.939248, -5.923136,
-1, -3.091988, -6.204111,
0, -2.939248, -5.923136,
0, -3.091988, -6.204111,
1, -2.939248, -5.923136,
1, -3.091988, -6.204111,
2, -2.939248, -5.923136,
2, -3.091988, -6.204111,
3, -2.939248, -5.923136,
3, -3.091988, -6.204111
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
-3, -3.397467, -6.766059, 0, -0.5, 0.5, 0.5,
-3, -3.397467, -6.766059, 1, -0.5, 0.5, 0.5,
-3, -3.397467, -6.766059, 1, 1.5, 0.5, 0.5,
-3, -3.397467, -6.766059, 0, 1.5, 0.5, 0.5,
-2, -3.397467, -6.766059, 0, -0.5, 0.5, 0.5,
-2, -3.397467, -6.766059, 1, -0.5, 0.5, 0.5,
-2, -3.397467, -6.766059, 1, 1.5, 0.5, 0.5,
-2, -3.397467, -6.766059, 0, 1.5, 0.5, 0.5,
-1, -3.397467, -6.766059, 0, -0.5, 0.5, 0.5,
-1, -3.397467, -6.766059, 1, -0.5, 0.5, 0.5,
-1, -3.397467, -6.766059, 1, 1.5, 0.5, 0.5,
-1, -3.397467, -6.766059, 0, 1.5, 0.5, 0.5,
0, -3.397467, -6.766059, 0, -0.5, 0.5, 0.5,
0, -3.397467, -6.766059, 1, -0.5, 0.5, 0.5,
0, -3.397467, -6.766059, 1, 1.5, 0.5, 0.5,
0, -3.397467, -6.766059, 0, 1.5, 0.5, 0.5,
1, -3.397467, -6.766059, 0, -0.5, 0.5, 0.5,
1, -3.397467, -6.766059, 1, -0.5, 0.5, 0.5,
1, -3.397467, -6.766059, 1, 1.5, 0.5, 0.5,
1, -3.397467, -6.766059, 0, 1.5, 0.5, 0.5,
2, -3.397467, -6.766059, 0, -0.5, 0.5, 0.5,
2, -3.397467, -6.766059, 1, -0.5, 0.5, 0.5,
2, -3.397467, -6.766059, 1, 1.5, 0.5, 0.5,
2, -3.397467, -6.766059, 0, 1.5, 0.5, 0.5,
3, -3.397467, -6.766059, 0, -0.5, 0.5, 0.5,
3, -3.397467, -6.766059, 1, -0.5, 0.5, 0.5,
3, -3.397467, -6.766059, 1, 1.5, 0.5, 0.5,
3, -3.397467, -6.766059, 0, 1.5, 0.5, 0.5
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
-3.524513, -2, -5.923136,
-3.524513, 3, -5.923136,
-3.524513, -2, -5.923136,
-3.699892, -2, -6.204111,
-3.524513, -1, -5.923136,
-3.699892, -1, -6.204111,
-3.524513, 0, -5.923136,
-3.699892, 0, -6.204111,
-3.524513, 1, -5.923136,
-3.699892, 1, -6.204111,
-3.524513, 2, -5.923136,
-3.699892, 2, -6.204111,
-3.524513, 3, -5.923136,
-3.699892, 3, -6.204111
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
-4.050649, -2, -6.766059, 0, -0.5, 0.5, 0.5,
-4.050649, -2, -6.766059, 1, -0.5, 0.5, 0.5,
-4.050649, -2, -6.766059, 1, 1.5, 0.5, 0.5,
-4.050649, -2, -6.766059, 0, 1.5, 0.5, 0.5,
-4.050649, -1, -6.766059, 0, -0.5, 0.5, 0.5,
-4.050649, -1, -6.766059, 1, -0.5, 0.5, 0.5,
-4.050649, -1, -6.766059, 1, 1.5, 0.5, 0.5,
-4.050649, -1, -6.766059, 0, 1.5, 0.5, 0.5,
-4.050649, 0, -6.766059, 0, -0.5, 0.5, 0.5,
-4.050649, 0, -6.766059, 1, -0.5, 0.5, 0.5,
-4.050649, 0, -6.766059, 1, 1.5, 0.5, 0.5,
-4.050649, 0, -6.766059, 0, 1.5, 0.5, 0.5,
-4.050649, 1, -6.766059, 0, -0.5, 0.5, 0.5,
-4.050649, 1, -6.766059, 1, -0.5, 0.5, 0.5,
-4.050649, 1, -6.766059, 1, 1.5, 0.5, 0.5,
-4.050649, 1, -6.766059, 0, 1.5, 0.5, 0.5,
-4.050649, 2, -6.766059, 0, -0.5, 0.5, 0.5,
-4.050649, 2, -6.766059, 1, -0.5, 0.5, 0.5,
-4.050649, 2, -6.766059, 1, 1.5, 0.5, 0.5,
-4.050649, 2, -6.766059, 0, 1.5, 0.5, 0.5,
-4.050649, 3, -6.766059, 0, -0.5, 0.5, 0.5,
-4.050649, 3, -6.766059, 1, -0.5, 0.5, 0.5,
-4.050649, 3, -6.766059, 1, 1.5, 0.5, 0.5,
-4.050649, 3, -6.766059, 0, 1.5, 0.5, 0.5
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
-3.524513, -2.939248, -4,
-3.524513, -2.939248, 4,
-3.524513, -2.939248, -4,
-3.699892, -3.091988, -4,
-3.524513, -2.939248, -2,
-3.699892, -3.091988, -2,
-3.524513, -2.939248, 0,
-3.699892, -3.091988, 0,
-3.524513, -2.939248, 2,
-3.699892, -3.091988, 2,
-3.524513, -2.939248, 4,
-3.699892, -3.091988, 4
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
-4.050649, -3.397467, -4, 0, -0.5, 0.5, 0.5,
-4.050649, -3.397467, -4, 1, -0.5, 0.5, 0.5,
-4.050649, -3.397467, -4, 1, 1.5, 0.5, 0.5,
-4.050649, -3.397467, -4, 0, 1.5, 0.5, 0.5,
-4.050649, -3.397467, -2, 0, -0.5, 0.5, 0.5,
-4.050649, -3.397467, -2, 1, -0.5, 0.5, 0.5,
-4.050649, -3.397467, -2, 1, 1.5, 0.5, 0.5,
-4.050649, -3.397467, -2, 0, 1.5, 0.5, 0.5,
-4.050649, -3.397467, 0, 0, -0.5, 0.5, 0.5,
-4.050649, -3.397467, 0, 1, -0.5, 0.5, 0.5,
-4.050649, -3.397467, 0, 1, 1.5, 0.5, 0.5,
-4.050649, -3.397467, 0, 0, 1.5, 0.5, 0.5,
-4.050649, -3.397467, 2, 0, -0.5, 0.5, 0.5,
-4.050649, -3.397467, 2, 1, -0.5, 0.5, 0.5,
-4.050649, -3.397467, 2, 1, 1.5, 0.5, 0.5,
-4.050649, -3.397467, 2, 0, 1.5, 0.5, 0.5,
-4.050649, -3.397467, 4, 0, -0.5, 0.5, 0.5,
-4.050649, -3.397467, 4, 1, -0.5, 0.5, 0.5,
-4.050649, -3.397467, 4, 1, 1.5, 0.5, 0.5,
-4.050649, -3.397467, 4, 0, 1.5, 0.5, 0.5
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
-3.524513, -2.939248, -5.923136,
-3.524513, 3.170332, -5.923136,
-3.524513, -2.939248, 5.31584,
-3.524513, 3.170332, 5.31584,
-3.524513, -2.939248, -5.923136,
-3.524513, -2.939248, 5.31584,
-3.524513, 3.170332, -5.923136,
-3.524513, 3.170332, 5.31584,
-3.524513, -2.939248, -5.923136,
3.49063, -2.939248, -5.923136,
-3.524513, -2.939248, 5.31584,
3.49063, -2.939248, 5.31584,
-3.524513, 3.170332, -5.923136,
3.49063, 3.170332, -5.923136,
-3.524513, 3.170332, 5.31584,
3.49063, 3.170332, 5.31584,
3.49063, -2.939248, -5.923136,
3.49063, 3.170332, -5.923136,
3.49063, -2.939248, 5.31584,
3.49063, 3.170332, 5.31584,
3.49063, -2.939248, -5.923136,
3.49063, -2.939248, 5.31584,
3.49063, 3.170332, -5.923136,
3.49063, 3.170332, 5.31584
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
var radius = 7.790515;
var distance = 34.66088;
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
mvMatrix.translate( 0.01694167, -0.1155419, 0.3036482 );
mvMatrix.scale( 1.200725, 1.378697, 0.7494684 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.66088);
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
isoxaflutole<-read.table("isoxaflutole.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoxaflutole$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxaflutole' not found
```

```r
y<-isoxaflutole$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxaflutole' not found
```

```r
z<-isoxaflutole$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxaflutole' not found
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
-3.422351, -0.08937269, -0.9238544, 0, 0, 1, 1, 1,
-2.955774, 0.2313077, 0.01245448, 1, 0, 0, 1, 1,
-2.710001, 0.9566358, -2.434798, 1, 0, 0, 1, 1,
-2.552466, 0.7725974, 0.1300126, 1, 0, 0, 1, 1,
-2.55092, -0.9876678, -2.061682, 1, 0, 0, 1, 1,
-2.512788, -0.856125, -0.8971574, 1, 0, 0, 1, 1,
-2.498838, 0.7800449, -3.996991, 0, 0, 0, 1, 1,
-2.469076, 0.2614367, -1.765066, 0, 0, 0, 1, 1,
-2.445132, 0.3643791, -1.081735, 0, 0, 0, 1, 1,
-2.434024, 1.262507, -0.6997707, 0, 0, 0, 1, 1,
-2.418364, -0.6955138, -1.723552, 0, 0, 0, 1, 1,
-2.389229, -1.326011, -3.216232, 0, 0, 0, 1, 1,
-2.313026, 0.1072124, -2.139579, 0, 0, 0, 1, 1,
-2.294295, 0.452561, -0.4667534, 1, 1, 1, 1, 1,
-2.285828, -0.98943, -3.099741, 1, 1, 1, 1, 1,
-2.21716, -2.41968, -1.387535, 1, 1, 1, 1, 1,
-2.206557, -1.550004, -2.414008, 1, 1, 1, 1, 1,
-2.189959, -0.113445, -1.104125, 1, 1, 1, 1, 1,
-2.171003, -1.305002, -1.807515, 1, 1, 1, 1, 1,
-2.153465, -0.8429856, -1.714088, 1, 1, 1, 1, 1,
-2.151509, -2.621079, -1.661284, 1, 1, 1, 1, 1,
-2.150566, -1.184743, -1.508402, 1, 1, 1, 1, 1,
-2.149483, 0.2441887, -1.050294, 1, 1, 1, 1, 1,
-2.109717, -1.688709, -2.613396, 1, 1, 1, 1, 1,
-2.10161, -2.375907, -1.959757, 1, 1, 1, 1, 1,
-2.100391, 0.3664924, -3.281403, 1, 1, 1, 1, 1,
-2.07241, 0.4197636, -1.786885, 1, 1, 1, 1, 1,
-2.043643, -0.4007581, -2.880425, 1, 1, 1, 1, 1,
-2.015872, -0.8990108, -1.723795, 0, 0, 1, 1, 1,
-2.000792, -0.4889801, -0.7956083, 1, 0, 0, 1, 1,
-2.000055, -1.118736, 0.8850108, 1, 0, 0, 1, 1,
-1.966377, -1.045933, -1.943141, 1, 0, 0, 1, 1,
-1.953398, -0.1886328, -3.02035, 1, 0, 0, 1, 1,
-1.935316, 1.39468, -0.6947624, 1, 0, 0, 1, 1,
-1.909004, -0.1620176, -1.884002, 0, 0, 0, 1, 1,
-1.90039, -0.01723869, -0.4405421, 0, 0, 0, 1, 1,
-1.875528, 1.012084, -0.6473955, 0, 0, 0, 1, 1,
-1.874985, -0.02228205, 0.1315023, 0, 0, 0, 1, 1,
-1.867765, 1.050472, -0.8079374, 0, 0, 0, 1, 1,
-1.863357, -0.6471131, -3.340666, 0, 0, 0, 1, 1,
-1.844658, 0.01413301, -0.0698926, 0, 0, 0, 1, 1,
-1.834876, -0.4707625, -1.145214, 1, 1, 1, 1, 1,
-1.801459, 0.2362913, -1.222293, 1, 1, 1, 1, 1,
-1.795299, -0.9899514, -1.903874, 1, 1, 1, 1, 1,
-1.784332, -1.140731, -1.493485, 1, 1, 1, 1, 1,
-1.740151, 0.689314, -1.11767, 1, 1, 1, 1, 1,
-1.735636, -0.1739597, -1.297409, 1, 1, 1, 1, 1,
-1.730799, 0.02391347, -3.032952, 1, 1, 1, 1, 1,
-1.729393, 0.9852507, -0.9508099, 1, 1, 1, 1, 1,
-1.707507, 0.08034889, -1.903218, 1, 1, 1, 1, 1,
-1.703681, 0.329372, -0.06356074, 1, 1, 1, 1, 1,
-1.700311, -0.3180733, -2.794212, 1, 1, 1, 1, 1,
-1.698483, -1.887356, -0.8780843, 1, 1, 1, 1, 1,
-1.652784, 0.7673283, -2.198697, 1, 1, 1, 1, 1,
-1.643514, 0.6009169, -2.47712, 1, 1, 1, 1, 1,
-1.628241, -1.038987, -0.6532069, 1, 1, 1, 1, 1,
-1.622941, 0.4856644, -0.3976839, 0, 0, 1, 1, 1,
-1.618211, -0.05728181, -2.142096, 1, 0, 0, 1, 1,
-1.611691, 0.1376216, -2.186062, 1, 0, 0, 1, 1,
-1.599291, -0.3752972, -2.343558, 1, 0, 0, 1, 1,
-1.596972, -0.2889079, -1.187836, 1, 0, 0, 1, 1,
-1.596496, 0.3493749, -0.512485, 1, 0, 0, 1, 1,
-1.58647, -1.354778, -1.725154, 0, 0, 0, 1, 1,
-1.563078, -1.07047, -1.454412, 0, 0, 0, 1, 1,
-1.531547, 0.3364421, -0.5908168, 0, 0, 0, 1, 1,
-1.530812, 1.957514, 0.1260774, 0, 0, 0, 1, 1,
-1.520046, -0.4393665, -1.695127, 0, 0, 0, 1, 1,
-1.51953, -0.740949, -1.372241, 0, 0, 0, 1, 1,
-1.472543, -0.8689546, -1.508532, 0, 0, 0, 1, 1,
-1.447533, -0.6584732, -0.5718296, 1, 1, 1, 1, 1,
-1.436392, 0.02520973, -2.39315, 1, 1, 1, 1, 1,
-1.398971, 0.08943515, 0.151778, 1, 1, 1, 1, 1,
-1.398883, 0.4163077, -0.34745, 1, 1, 1, 1, 1,
-1.389314, 0.1652879, -1.869379, 1, 1, 1, 1, 1,
-1.388564, 0.8426476, -1.796357, 1, 1, 1, 1, 1,
-1.370612, 0.2860202, -0.9395689, 1, 1, 1, 1, 1,
-1.364856, 0.9707888, -2.904347, 1, 1, 1, 1, 1,
-1.36475, 0.2906509, -2.246161, 1, 1, 1, 1, 1,
-1.355032, 1.110671, -2.135128, 1, 1, 1, 1, 1,
-1.353249, 0.05886177, 0.1385234, 1, 1, 1, 1, 1,
-1.35075, 1.246582, -1.482084, 1, 1, 1, 1, 1,
-1.349013, 1.475659, -0.9091805, 1, 1, 1, 1, 1,
-1.340433, -1.16613, -3.994158, 1, 1, 1, 1, 1,
-1.332577, -0.635167, -1.880283, 1, 1, 1, 1, 1,
-1.329944, -0.5379163, -0.4976474, 0, 0, 1, 1, 1,
-1.328017, 0.4559765, -0.5811772, 1, 0, 0, 1, 1,
-1.312457, -0.2430429, -1.053592, 1, 0, 0, 1, 1,
-1.305093, 0.2231347, -1.940514, 1, 0, 0, 1, 1,
-1.303908, 0.5981736, -1.111361, 1, 0, 0, 1, 1,
-1.288255, -0.5298124, -2.401386, 1, 0, 0, 1, 1,
-1.286872, -1.474135, -3.481444, 0, 0, 0, 1, 1,
-1.285638, -0.8980262, -3.263557, 0, 0, 0, 1, 1,
-1.285202, 0.378336, -1.298926, 0, 0, 0, 1, 1,
-1.282394, -1.50083, -0.3188877, 0, 0, 0, 1, 1,
-1.275013, -0.5086069, -2.44609, 0, 0, 0, 1, 1,
-1.264787, 1.413976, -0.3162271, 0, 0, 0, 1, 1,
-1.264755, -1.310233, -3.741677, 0, 0, 0, 1, 1,
-1.259527, -0.7682153, -2.047805, 1, 1, 1, 1, 1,
-1.256101, -0.4875013, -2.940273, 1, 1, 1, 1, 1,
-1.243313, 0.8692093, -1.683628, 1, 1, 1, 1, 1,
-1.224687, -0.1238977, -1.99257, 1, 1, 1, 1, 1,
-1.211758, -0.4207924, -4.380395, 1, 1, 1, 1, 1,
-1.211079, -0.6024056, -1.447358, 1, 1, 1, 1, 1,
-1.196207, -0.2616012, -1.70689, 1, 1, 1, 1, 1,
-1.192645, 0.9285158, -0.2138122, 1, 1, 1, 1, 1,
-1.189589, -0.8221985, -2.961772, 1, 1, 1, 1, 1,
-1.188969, -0.2688055, -2.633523, 1, 1, 1, 1, 1,
-1.178507, 1.684417, -0.08139569, 1, 1, 1, 1, 1,
-1.176841, -0.08479065, -1.858406, 1, 1, 1, 1, 1,
-1.174844, -0.8729025, -1.275801, 1, 1, 1, 1, 1,
-1.173522, -0.1449194, -1.277029, 1, 1, 1, 1, 1,
-1.17219, 1.529183, -1.64077, 1, 1, 1, 1, 1,
-1.163106, 1.060437, -0.6491375, 0, 0, 1, 1, 1,
-1.156409, 0.8490172, -2.404309, 1, 0, 0, 1, 1,
-1.147455, 2.234601, -0.5426617, 1, 0, 0, 1, 1,
-1.141312, -1.659407, -2.566632, 1, 0, 0, 1, 1,
-1.123535, 0.7978919, -0.1569288, 1, 0, 0, 1, 1,
-1.120606, 0.4759431, -1.072837, 1, 0, 0, 1, 1,
-1.119758, 2.070557, 0.06261343, 0, 0, 0, 1, 1,
-1.117504, 1.435549, -0.484802, 0, 0, 0, 1, 1,
-1.109326, -0.2950142, -1.373855, 0, 0, 0, 1, 1,
-1.108427, -0.3938552, -1.997323, 0, 0, 0, 1, 1,
-1.105273, -0.02546557, -1.455396, 0, 0, 0, 1, 1,
-1.104079, 1.139706, -0.3125846, 0, 0, 0, 1, 1,
-1.102977, -1.835242, -2.984191, 0, 0, 0, 1, 1,
-1.099956, -1.809832, -3.243188, 1, 1, 1, 1, 1,
-1.090667, 0.769645, -3.341639, 1, 1, 1, 1, 1,
-1.090382, -1.028973, -2.476404, 1, 1, 1, 1, 1,
-1.087392, 0.1375993, -0.5475281, 1, 1, 1, 1, 1,
-1.069866, -0.005005487, 0.4363288, 1, 1, 1, 1, 1,
-1.068233, 0.5117224, -1.597914, 1, 1, 1, 1, 1,
-1.060385, 0.5096509, -1.411794, 1, 1, 1, 1, 1,
-1.050611, -0.0958793, -0.9000709, 1, 1, 1, 1, 1,
-1.049386, 0.6910443, 0.1735308, 1, 1, 1, 1, 1,
-1.039589, 1.462149, -0.4269634, 1, 1, 1, 1, 1,
-1.037332, 0.07865957, -0.04034142, 1, 1, 1, 1, 1,
-1.034694, -0.7428889, -2.627344, 1, 1, 1, 1, 1,
-1.032013, -0.6544597, -1.38131, 1, 1, 1, 1, 1,
-1.030395, 2.213462, -1.320408, 1, 1, 1, 1, 1,
-1.027973, -0.7879366, -2.577312, 1, 1, 1, 1, 1,
-1.024544, -0.8877326, -2.207741, 0, 0, 1, 1, 1,
-1.011441, -0.7866331, -3.188166, 1, 0, 0, 1, 1,
-1.009192, 1.982532, 0.3353186, 1, 0, 0, 1, 1,
-1.007992, 0.4090762, -0.4851395, 1, 0, 0, 1, 1,
-1.007238, -1.462911, -2.120203, 1, 0, 0, 1, 1,
-1.00608, 0.476306, -2.229375, 1, 0, 0, 1, 1,
-1.004741, -1.089761, -1.355306, 0, 0, 0, 1, 1,
-1.003851, -0.2799829, -0.1461017, 0, 0, 0, 1, 1,
-1.003565, -0.7052756, -2.51856, 0, 0, 0, 1, 1,
-0.9999421, 2.032283, 0.3284636, 0, 0, 0, 1, 1,
-0.9977477, 1.170113, -0.7069646, 0, 0, 0, 1, 1,
-0.9935302, 0.7063686, -1.095964, 0, 0, 0, 1, 1,
-0.9934623, 0.5535646, -0.9842005, 0, 0, 0, 1, 1,
-0.9830589, 0.07128967, -0.5960608, 1, 1, 1, 1, 1,
-0.98233, 0.9339288, -1.428265, 1, 1, 1, 1, 1,
-0.9793687, 0.07163717, -2.882704, 1, 1, 1, 1, 1,
-0.9693848, -0.9197956, -2.830143, 1, 1, 1, 1, 1,
-0.9690915, 0.7383086, -1.118839, 1, 1, 1, 1, 1,
-0.9663561, 1.496277, -1.458231, 1, 1, 1, 1, 1,
-0.9656011, 0.2479807, 1.135665, 1, 1, 1, 1, 1,
-0.9532387, -0.1111638, -1.669405, 1, 1, 1, 1, 1,
-0.9496956, 0.4627249, -0.009419547, 1, 1, 1, 1, 1,
-0.9455305, 0.6717765, -3.869771, 1, 1, 1, 1, 1,
-0.937014, -0.5062775, -2.94658, 1, 1, 1, 1, 1,
-0.9358927, 0.8894792, -1.682597, 1, 1, 1, 1, 1,
-0.9336633, -1.221085, -2.620193, 1, 1, 1, 1, 1,
-0.9334452, 1.821386, -0.5382093, 1, 1, 1, 1, 1,
-0.932664, -0.4017062, -2.063128, 1, 1, 1, 1, 1,
-0.9286347, 1.037691, -1.391811, 0, 0, 1, 1, 1,
-0.9267008, -0.1181087, -1.303823, 1, 0, 0, 1, 1,
-0.9228105, -1.328245, -3.387891, 1, 0, 0, 1, 1,
-0.920481, 0.02434509, -2.659666, 1, 0, 0, 1, 1,
-0.9203874, 0.5284981, -1.394859, 1, 0, 0, 1, 1,
-0.9148445, -1.314472, -2.244642, 1, 0, 0, 1, 1,
-0.9132842, -1.394665, -2.395023, 0, 0, 0, 1, 1,
-0.9087325, -1.914545, -2.604411, 0, 0, 0, 1, 1,
-0.8998863, 1.495906, 1.531217, 0, 0, 0, 1, 1,
-0.8942887, -0.3497851, -2.003623, 0, 0, 0, 1, 1,
-0.8870071, 0.4076931, -1.091617, 0, 0, 0, 1, 1,
-0.8814473, 2.321923, -0.6082319, 0, 0, 0, 1, 1,
-0.8714635, -0.1678356, -0.720296, 0, 0, 0, 1, 1,
-0.8641367, 0.8996071, -0.08541383, 1, 1, 1, 1, 1,
-0.8620126, 1.262769, 0.255553, 1, 1, 1, 1, 1,
-0.8532544, 1.250331, 0.556587, 1, 1, 1, 1, 1,
-0.8466449, -0.04909269, -0.8246184, 1, 1, 1, 1, 1,
-0.8449739, -1.511094, -4.85811, 1, 1, 1, 1, 1,
-0.8439822, -0.5877733, -2.421324, 1, 1, 1, 1, 1,
-0.8414335, -0.9257751, -3.325868, 1, 1, 1, 1, 1,
-0.8394627, -1.445997, -1.578709, 1, 1, 1, 1, 1,
-0.8387291, 0.3036025, -1.053691, 1, 1, 1, 1, 1,
-0.8358865, 0.8820584, -0.3314201, 1, 1, 1, 1, 1,
-0.832697, 0.3090085, -1.861772, 1, 1, 1, 1, 1,
-0.8192665, 1.587319, 1.6452, 1, 1, 1, 1, 1,
-0.8121516, 0.2300415, -2.165031, 1, 1, 1, 1, 1,
-0.8101402, 0.5728122, 0.2832251, 1, 1, 1, 1, 1,
-0.8076989, 0.2804417, -2.707721, 1, 1, 1, 1, 1,
-0.8005024, 0.1305683, -1.438592, 0, 0, 1, 1, 1,
-0.7985815, 0.07675473, -2.149421, 1, 0, 0, 1, 1,
-0.7906911, -0.7730609, -3.381582, 1, 0, 0, 1, 1,
-0.7890234, 2.239527, 1.603728, 1, 0, 0, 1, 1,
-0.788589, -0.8564256, -4.341723, 1, 0, 0, 1, 1,
-0.7871224, 1.955992, -0.556509, 1, 0, 0, 1, 1,
-0.7789581, 1.039958, 1.062798, 0, 0, 0, 1, 1,
-0.778533, 0.1660901, -2.817024, 0, 0, 0, 1, 1,
-0.778372, -1.341431, -3.148294, 0, 0, 0, 1, 1,
-0.7783467, -0.8505734, -2.255613, 0, 0, 0, 1, 1,
-0.7774301, 0.4720529, -0.4126175, 0, 0, 0, 1, 1,
-0.7759366, 0.3162503, -2.253437, 0, 0, 0, 1, 1,
-0.7736641, -0.5454448, -1.920278, 0, 0, 0, 1, 1,
-0.7724253, 0.380965, -0.2274232, 1, 1, 1, 1, 1,
-0.7705445, -1.944969, -4.126558, 1, 1, 1, 1, 1,
-0.7635643, 1.152762, -1.634902, 1, 1, 1, 1, 1,
-0.7599375, 1.110802, -1.278735, 1, 1, 1, 1, 1,
-0.758751, 0.7743332, -0.4257514, 1, 1, 1, 1, 1,
-0.7573248, -0.8383522, -3.068871, 1, 1, 1, 1, 1,
-0.7543148, -0.9551299, -3.063781, 1, 1, 1, 1, 1,
-0.7519154, -1.383421, -3.121706, 1, 1, 1, 1, 1,
-0.7448562, -0.2661912, -0.6104849, 1, 1, 1, 1, 1,
-0.744427, 0.6696349, -2.207481, 1, 1, 1, 1, 1,
-0.7399344, -0.6403539, -1.81328, 1, 1, 1, 1, 1,
-0.7353978, 1.237014, -0.8525683, 1, 1, 1, 1, 1,
-0.7256897, -0.2590185, -0.6363925, 1, 1, 1, 1, 1,
-0.7233514, -0.130252, -1.596758, 1, 1, 1, 1, 1,
-0.7205735, 0.1751761, -2.342477, 1, 1, 1, 1, 1,
-0.7189422, 1.617939, -0.641988, 0, 0, 1, 1, 1,
-0.7188094, 0.9412969, -0.7861061, 1, 0, 0, 1, 1,
-0.7177765, 0.3219162, -2.084843, 1, 0, 0, 1, 1,
-0.7135175, 1.316905, 0.1300075, 1, 0, 0, 1, 1,
-0.7091939, 1.746575, -1.575712, 1, 0, 0, 1, 1,
-0.7051764, -0.7901147, -4.567535, 1, 0, 0, 1, 1,
-0.7001625, 1.906725, -1.092156, 0, 0, 0, 1, 1,
-0.6950399, 1.454964, -0.7662007, 0, 0, 0, 1, 1,
-0.6846118, -1.866217, -2.701046, 0, 0, 0, 1, 1,
-0.6743605, -1.005727, -1.985232, 0, 0, 0, 1, 1,
-0.673661, 0.7128586, -1.495583, 0, 0, 0, 1, 1,
-0.6622038, 0.4827996, -1.673777, 0, 0, 0, 1, 1,
-0.6619573, 0.6058734, -0.62406, 0, 0, 0, 1, 1,
-0.6618844, 0.02819546, -0.2207436, 1, 1, 1, 1, 1,
-0.6608196, 0.7724378, 1.783867, 1, 1, 1, 1, 1,
-0.658051, -1.158178, -2.28428, 1, 1, 1, 1, 1,
-0.6488339, -0.4671496, -3.053681, 1, 1, 1, 1, 1,
-0.6459465, -0.6871678, -2.485176, 1, 1, 1, 1, 1,
-0.6454533, -0.9449426, -2.411308, 1, 1, 1, 1, 1,
-0.6420849, 1.405766, -1.361409, 1, 1, 1, 1, 1,
-0.6369419, -1.550555, -2.049516, 1, 1, 1, 1, 1,
-0.6344568, -0.2479763, -2.045378, 1, 1, 1, 1, 1,
-0.6337892, 0.7774674, 1.331529, 1, 1, 1, 1, 1,
-0.6311787, -0.4153123, -2.156421, 1, 1, 1, 1, 1,
-0.6272108, 0.6318854, -1.285942, 1, 1, 1, 1, 1,
-0.6244181, 2.464603, 0.4403547, 1, 1, 1, 1, 1,
-0.6217157, 1.327588, -0.9211205, 1, 1, 1, 1, 1,
-0.612859, 0.3007935, -0.7446618, 1, 1, 1, 1, 1,
-0.6084431, 1.31915, -0.3043919, 0, 0, 1, 1, 1,
-0.6049247, -0.4391959, -2.830024, 1, 0, 0, 1, 1,
-0.6037464, -1.022388, -5.509253, 1, 0, 0, 1, 1,
-0.602562, -0.5641115, -0.6463597, 1, 0, 0, 1, 1,
-0.6000872, 0.5871447, -0.3568222, 1, 0, 0, 1, 1,
-0.5993032, 0.3450252, -3.182147, 1, 0, 0, 1, 1,
-0.5986934, 1.177218, -1.98444, 0, 0, 0, 1, 1,
-0.5950019, -1.244405, -3.507315, 0, 0, 0, 1, 1,
-0.5903037, -0.7724221, -1.997596, 0, 0, 0, 1, 1,
-0.5843192, 0.398192, -3.005959, 0, 0, 0, 1, 1,
-0.5797682, -0.1450315, -1.669379, 0, 0, 0, 1, 1,
-0.5795919, 0.1266882, -1.85201, 0, 0, 0, 1, 1,
-0.5789403, 0.3123978, 1.745363, 0, 0, 0, 1, 1,
-0.5785387, -0.06288141, -0.4247785, 1, 1, 1, 1, 1,
-0.5782262, 0.7845588, -0.04282538, 1, 1, 1, 1, 1,
-0.5744705, 0.4967311, -0.5895887, 1, 1, 1, 1, 1,
-0.5724518, 0.845486, -0.6154285, 1, 1, 1, 1, 1,
-0.5705571, 2.325922, 1.652417, 1, 1, 1, 1, 1,
-0.5650213, 1.30934, 0.3233889, 1, 1, 1, 1, 1,
-0.5647012, 0.9096732, -0.7094289, 1, 1, 1, 1, 1,
-0.5646969, -1.004556, -2.738466, 1, 1, 1, 1, 1,
-0.5620491, -1.00385, -1.825435, 1, 1, 1, 1, 1,
-0.5608614, 0.6098984, -0.6690083, 1, 1, 1, 1, 1,
-0.5600775, 0.9512599, -0.2450943, 1, 1, 1, 1, 1,
-0.5530941, -0.8137793, -3.935962, 1, 1, 1, 1, 1,
-0.553004, 1.114256, -1.478258, 1, 1, 1, 1, 1,
-0.5527429, 1.043746, 0.5009316, 1, 1, 1, 1, 1,
-0.5499072, 0.06696562, -0.7459214, 1, 1, 1, 1, 1,
-0.547987, 0.2999367, -2.300794, 0, 0, 1, 1, 1,
-0.547583, 0.2616733, -0.8787933, 1, 0, 0, 1, 1,
-0.5451283, -0.06346155, -3.372187, 1, 0, 0, 1, 1,
-0.5447395, 0.7131957, -1.27853, 1, 0, 0, 1, 1,
-0.5436541, 1.45758, -1.000475, 1, 0, 0, 1, 1,
-0.5418287, 1.250086, -1.565862, 1, 0, 0, 1, 1,
-0.5306712, -0.5422304, -2.909308, 0, 0, 0, 1, 1,
-0.5305856, 0.1869882, -1.375347, 0, 0, 0, 1, 1,
-0.5300953, 0.2303318, -0.9594099, 0, 0, 0, 1, 1,
-0.5260585, -0.4435984, -1.401924, 0, 0, 0, 1, 1,
-0.5254756, -0.7610102, -1.595866, 0, 0, 0, 1, 1,
-0.5206666, 0.9530535, 0.4887732, 0, 0, 0, 1, 1,
-0.5195123, 1.258067, 0.117276, 0, 0, 0, 1, 1,
-0.5193503, -0.1849772, -0.6384709, 1, 1, 1, 1, 1,
-0.5136724, -0.3309739, -4.070679, 1, 1, 1, 1, 1,
-0.5126886, -1.295215, -3.320125, 1, 1, 1, 1, 1,
-0.5115135, 0.2748676, -0.83439, 1, 1, 1, 1, 1,
-0.5099819, -0.1899005, 0.1842006, 1, 1, 1, 1, 1,
-0.5053467, 1.844602, 0.7561615, 1, 1, 1, 1, 1,
-0.497982, -0.5034629, -2.9267, 1, 1, 1, 1, 1,
-0.4972967, -1.612026, -2.197299, 1, 1, 1, 1, 1,
-0.4964986, -2.214409, -2.848162, 1, 1, 1, 1, 1,
-0.4959092, -0.2044812, -1.389274, 1, 1, 1, 1, 1,
-0.4938988, -0.8472854, -2.637789, 1, 1, 1, 1, 1,
-0.4918153, -0.4996017, -1.471256, 1, 1, 1, 1, 1,
-0.4889196, -1.726328, -3.944181, 1, 1, 1, 1, 1,
-0.488636, 1.273097, -0.2324948, 1, 1, 1, 1, 1,
-0.4862376, -1.812229, -3.837429, 1, 1, 1, 1, 1,
-0.4860835, -1.308583, -2.671528, 0, 0, 1, 1, 1,
-0.4851516, 0.4992016, 0.3666892, 1, 0, 0, 1, 1,
-0.4828739, -0.9173025, -2.093947, 1, 0, 0, 1, 1,
-0.4827211, -1.258355, -2.651096, 1, 0, 0, 1, 1,
-0.4709674, -0.07558269, -2.303588, 1, 0, 0, 1, 1,
-0.4695044, 0.8474295, 0.6326663, 1, 0, 0, 1, 1,
-0.4689582, -1.940753, -2.856973, 0, 0, 0, 1, 1,
-0.4669042, 0.7207193, -1.828188, 0, 0, 0, 1, 1,
-0.4647892, 1.130837, 0.05481752, 0, 0, 0, 1, 1,
-0.4602613, 0.8928788, -0.1239701, 0, 0, 0, 1, 1,
-0.4597852, -0.5092833, -3.754055, 0, 0, 0, 1, 1,
-0.4590951, 1.6967, -1.953765, 0, 0, 0, 1, 1,
-0.4550606, 0.6103932, -1.814781, 0, 0, 0, 1, 1,
-0.4511006, -0.4635203, -1.882723, 1, 1, 1, 1, 1,
-0.4445499, -0.1311326, -2.679933, 1, 1, 1, 1, 1,
-0.4431865, -0.2775446, -2.445925, 1, 1, 1, 1, 1,
-0.4379476, 1.099098, 0.6571441, 1, 1, 1, 1, 1,
-0.4322074, 3.081357, 0.05471049, 1, 1, 1, 1, 1,
-0.428837, -0.3149661, -1.516739, 1, 1, 1, 1, 1,
-0.4278718, 0.7220902, -1.298545, 1, 1, 1, 1, 1,
-0.4271506, 0.5215614, -1.376934, 1, 1, 1, 1, 1,
-0.4256922, -0.7215925, -4.170292, 1, 1, 1, 1, 1,
-0.4221692, 2.036299, 0.1697556, 1, 1, 1, 1, 1,
-0.421055, -0.4135657, -3.929191, 1, 1, 1, 1, 1,
-0.4201981, -0.6094713, -2.393644, 1, 1, 1, 1, 1,
-0.4196077, -0.5555028, -2.145849, 1, 1, 1, 1, 1,
-0.4147075, -1.054855, -3.511668, 1, 1, 1, 1, 1,
-0.4130132, 0.179472, -1.219897, 1, 1, 1, 1, 1,
-0.4118986, -0.5847335, -1.657978, 0, 0, 1, 1, 1,
-0.4118368, -1.298324, -5.759462, 1, 0, 0, 1, 1,
-0.3979366, 0.658691, -1.331236, 1, 0, 0, 1, 1,
-0.3878362, -0.7986248, -3.0014, 1, 0, 0, 1, 1,
-0.3835187, -0.941468, -2.03743, 1, 0, 0, 1, 1,
-0.3793862, 0.1694015, -0.7300814, 1, 0, 0, 1, 1,
-0.3784454, -0.3104692, -3.403311, 0, 0, 0, 1, 1,
-0.376606, 0.1343597, -0.1535167, 0, 0, 0, 1, 1,
-0.375001, -0.06163465, -1.476179, 0, 0, 0, 1, 1,
-0.3746623, 1.342997, 1.710253, 0, 0, 0, 1, 1,
-0.3742695, -0.8450009, -0.7009804, 0, 0, 0, 1, 1,
-0.3703298, 0.8962913, -0.6650928, 0, 0, 0, 1, 1,
-0.3666662, 1.273229, -1.205529, 0, 0, 0, 1, 1,
-0.3658815, -0.09396488, -1.245272, 1, 1, 1, 1, 1,
-0.3627318, 0.116375, -0.713966, 1, 1, 1, 1, 1,
-0.3618717, -1.262912, -3.439839, 1, 1, 1, 1, 1,
-0.36017, -0.2839083, -0.8581532, 1, 1, 1, 1, 1,
-0.3585353, 0.3052672, -1.106326, 1, 1, 1, 1, 1,
-0.3547977, -1.552495, -3.448811, 1, 1, 1, 1, 1,
-0.3531445, -0.03381709, -2.21318, 1, 1, 1, 1, 1,
-0.3520877, 0.2201966, 0.08363301, 1, 1, 1, 1, 1,
-0.3502685, 1.07314, 0.337532, 1, 1, 1, 1, 1,
-0.3432698, -0.9430405, -3.128133, 1, 1, 1, 1, 1,
-0.3403676, 0.3113248, -1.581571, 1, 1, 1, 1, 1,
-0.339937, 0.5656528, 0.01298006, 1, 1, 1, 1, 1,
-0.3356445, -1.414192, -2.184378, 1, 1, 1, 1, 1,
-0.3334873, -0.5851657, -3.573196, 1, 1, 1, 1, 1,
-0.327965, -0.9337708, -2.114588, 1, 1, 1, 1, 1,
-0.3259698, -1.185209, -2.123015, 0, 0, 1, 1, 1,
-0.324856, 0.2451809, -0.4811135, 1, 0, 0, 1, 1,
-0.323357, 2.168141, 0.9870146, 1, 0, 0, 1, 1,
-0.3225289, -0.1405455, -0.7519505, 1, 0, 0, 1, 1,
-0.3222394, 1.624195, 0.2379131, 1, 0, 0, 1, 1,
-0.3205077, 0.4951805, -0.1155881, 1, 0, 0, 1, 1,
-0.3187812, -0.06155612, -2.119315, 0, 0, 0, 1, 1,
-0.3185517, 0.3017911, -3.216287, 0, 0, 0, 1, 1,
-0.3151892, 1.523677, -0.8681292, 0, 0, 0, 1, 1,
-0.3126003, -1.151789, -3.359091, 0, 0, 0, 1, 1,
-0.3122411, -0.1189596, -1.722144, 0, 0, 0, 1, 1,
-0.3086578, 0.1341716, -1.559181, 0, 0, 0, 1, 1,
-0.3077648, -0.100028, -2.170449, 0, 0, 0, 1, 1,
-0.3040259, 1.410766, -1.145259, 1, 1, 1, 1, 1,
-0.3032194, -0.2558164, -1.999233, 1, 1, 1, 1, 1,
-0.3030304, -1.87495, -2.557212, 1, 1, 1, 1, 1,
-0.3009485, -1.156027, -2.012143, 1, 1, 1, 1, 1,
-0.2995322, -0.3190099, -4.259783, 1, 1, 1, 1, 1,
-0.2994057, -1.057748, -2.280757, 1, 1, 1, 1, 1,
-0.2977759, -0.4204663, -2.946499, 1, 1, 1, 1, 1,
-0.2906947, 1.018243, 0.2739188, 1, 1, 1, 1, 1,
-0.2906626, 0.8143977, -0.173377, 1, 1, 1, 1, 1,
-0.2874773, -1.49423, -1.812917, 1, 1, 1, 1, 1,
-0.2869666, -1.320249, -2.875304, 1, 1, 1, 1, 1,
-0.2864425, -0.7140021, -4.192711, 1, 1, 1, 1, 1,
-0.2827602, -0.02767032, -1.821822, 1, 1, 1, 1, 1,
-0.2822341, 0.1360261, -1.527535, 1, 1, 1, 1, 1,
-0.2787361, -0.7387407, -3.170149, 1, 1, 1, 1, 1,
-0.2764522, -0.9998933, -2.591905, 0, 0, 1, 1, 1,
-0.2735394, 2.304777, 0.6973469, 1, 0, 0, 1, 1,
-0.2686839, 0.0325496, -1.383628, 1, 0, 0, 1, 1,
-0.2677343, -0.3605447, -1.519456, 1, 0, 0, 1, 1,
-0.2645899, 0.3032523, 1.835361, 1, 0, 0, 1, 1,
-0.2590931, -1.785043, -3.12608, 1, 0, 0, 1, 1,
-0.2589065, 0.5468086, -0.9076576, 0, 0, 0, 1, 1,
-0.2474187, -0.5194637, -3.227789, 0, 0, 0, 1, 1,
-0.2473239, 0.6680183, 0.7609666, 0, 0, 0, 1, 1,
-0.2444806, 0.8993776, -1.462735, 0, 0, 0, 1, 1,
-0.2423424, 1.229284, 0.2223102, 0, 0, 0, 1, 1,
-0.2373897, 1.055976, 1.32341, 0, 0, 0, 1, 1,
-0.2287992, -1.348906, -3.577837, 0, 0, 0, 1, 1,
-0.2237787, -0.0350696, -0.8051773, 1, 1, 1, 1, 1,
-0.2229398, 0.8517584, -0.1599208, 1, 1, 1, 1, 1,
-0.2158988, -1.550886, -3.622452, 1, 1, 1, 1, 1,
-0.215525, -0.4970877, -3.162417, 1, 1, 1, 1, 1,
-0.214211, 0.5159412, -3.083072, 1, 1, 1, 1, 1,
-0.209601, -1.933685, -2.393934, 1, 1, 1, 1, 1,
-0.2094025, -0.7663772, -2.57095, 1, 1, 1, 1, 1,
-0.2071113, -0.8960229, -3.051255, 1, 1, 1, 1, 1,
-0.2064528, 0.3038962, -1.655728, 1, 1, 1, 1, 1,
-0.2047523, 1.781869, 0.2782224, 1, 1, 1, 1, 1,
-0.1991236, -0.0249804, -1.350034, 1, 1, 1, 1, 1,
-0.1974436, -0.4456727, -1.832373, 1, 1, 1, 1, 1,
-0.1962311, -0.8274798, -2.869646, 1, 1, 1, 1, 1,
-0.1899144, 1.855533, -0.5531694, 1, 1, 1, 1, 1,
-0.1891137, -0.01060684, -3.46756, 1, 1, 1, 1, 1,
-0.1863009, 0.7484741, 0.6644514, 0, 0, 1, 1, 1,
-0.1860285, 0.1235563, -0.008500068, 1, 0, 0, 1, 1,
-0.1813187, -0.7857042, -2.279412, 1, 0, 0, 1, 1,
-0.1797635, 0.3702624, -1.461155, 1, 0, 0, 1, 1,
-0.1774251, 1.63241, -0.02835308, 1, 0, 0, 1, 1,
-0.1762044, -1.212914, -1.526488, 1, 0, 0, 1, 1,
-0.1689886, -0.9210185, -2.551126, 0, 0, 0, 1, 1,
-0.1686082, -1.119075, -3.797133, 0, 0, 0, 1, 1,
-0.167895, 0.1665646, -0.2019473, 0, 0, 0, 1, 1,
-0.1666047, -0.9854178, -0.8267726, 0, 0, 0, 1, 1,
-0.1656604, 0.7138179, -2.212315, 0, 0, 0, 1, 1,
-0.1621982, 0.369275, -1.330722, 0, 0, 0, 1, 1,
-0.1589435, -0.3839213, -1.663579, 0, 0, 0, 1, 1,
-0.1569958, 0.5098831, 0.9543361, 1, 1, 1, 1, 1,
-0.1555546, 0.3026651, -0.2008683, 1, 1, 1, 1, 1,
-0.1507699, 1.009635, -1.132221, 1, 1, 1, 1, 1,
-0.1482144, 0.3412082, 0.528729, 1, 1, 1, 1, 1,
-0.1456465, -1.158264, -3.908208, 1, 1, 1, 1, 1,
-0.1402022, 0.2679841, -1.304082, 1, 1, 1, 1, 1,
-0.1330461, 0.03788944, -0.390971, 1, 1, 1, 1, 1,
-0.1328314, -0.0498968, -2.244123, 1, 1, 1, 1, 1,
-0.1313726, 0.04746228, 0.3644844, 1, 1, 1, 1, 1,
-0.1271779, 2.959337, -1.888284, 1, 1, 1, 1, 1,
-0.1252379, -0.41036, -2.413682, 1, 1, 1, 1, 1,
-0.1244332, -0.9325393, -2.14333, 1, 1, 1, 1, 1,
-0.1212512, 0.004351233, -3.124657, 1, 1, 1, 1, 1,
-0.1161518, 0.8749729, 0.2933823, 1, 1, 1, 1, 1,
-0.1119632, -0.06943985, -1.182492, 1, 1, 1, 1, 1,
-0.1116371, -1.586034, -3.091517, 0, 0, 1, 1, 1,
-0.1113792, -0.2063629, -1.457279, 1, 0, 0, 1, 1,
-0.1113543, 1.506734, 0.2652875, 1, 0, 0, 1, 1,
-0.1071748, 0.288472, -1.57006, 1, 0, 0, 1, 1,
-0.1044511, 0.2962416, -1.289425, 1, 0, 0, 1, 1,
-0.1013812, -0.6841284, -3.670283, 1, 0, 0, 1, 1,
-0.09218426, 0.5662498, -0.4184461, 0, 0, 0, 1, 1,
-0.08748364, -0.7831833, -2.69829, 0, 0, 0, 1, 1,
-0.08014703, 0.04533046, -3.881712, 0, 0, 0, 1, 1,
-0.08001142, 0.1242666, -1.491776, 0, 0, 0, 1, 1,
-0.07426111, 0.006173213, -1.370139, 0, 0, 0, 1, 1,
-0.07248274, 0.04094478, -0.6721417, 0, 0, 0, 1, 1,
-0.07118754, 1.418752, 2.693374, 0, 0, 0, 1, 1,
-0.06978986, -0.7942205, -2.591207, 1, 1, 1, 1, 1,
-0.06936973, -0.7960793, -3.391384, 1, 1, 1, 1, 1,
-0.06630947, 0.8572104, -0.327736, 1, 1, 1, 1, 1,
-0.06364387, -0.6791124, -3.572838, 1, 1, 1, 1, 1,
-0.06237981, 0.3610142, -1.211202, 1, 1, 1, 1, 1,
-0.0596413, 0.6901977, -0.9340367, 1, 1, 1, 1, 1,
-0.0590019, 0.1191805, 0.5872266, 1, 1, 1, 1, 1,
-0.05679785, 0.09604161, 0.5662052, 1, 1, 1, 1, 1,
-0.05559668, -0.7575223, -5.048044, 1, 1, 1, 1, 1,
-0.05277097, 0.1144555, -1.242618, 1, 1, 1, 1, 1,
-0.0508816, 0.5795158, 0.1537773, 1, 1, 1, 1, 1,
-0.04994692, -2.260538, -1.858936, 1, 1, 1, 1, 1,
-0.04911146, 0.442041, 0.7576007, 1, 1, 1, 1, 1,
-0.04636708, -0.4184613, -3.813917, 1, 1, 1, 1, 1,
-0.0418126, -0.1150103, -3.766008, 1, 1, 1, 1, 1,
-0.03671998, -1.691404, -2.043661, 0, 0, 1, 1, 1,
-0.03619538, 1.421384, -0.9490141, 1, 0, 0, 1, 1,
-0.03460281, 0.1928863, 0.2593843, 1, 0, 0, 1, 1,
-0.02247235, 0.4249157, -0.02629874, 1, 0, 0, 1, 1,
-0.01932466, 2.498897, 0.2103275, 1, 0, 0, 1, 1,
-0.01793803, -0.7837668, -2.919165, 1, 0, 0, 1, 1,
-0.01685236, -2.314404, -2.615038, 0, 0, 0, 1, 1,
-0.01611386, -0.2395786, -2.642452, 0, 0, 0, 1, 1,
-0.01415469, 0.5353532, 1.364862, 0, 0, 0, 1, 1,
-0.01128881, -0.9383083, -2.582141, 0, 0, 0, 1, 1,
-0.009101558, 0.345678, -0.2683172, 0, 0, 0, 1, 1,
-0.008897354, -1.132059, -4.436386, 0, 0, 0, 1, 1,
-0.008730645, 0.8980314, -1.055758, 0, 0, 0, 1, 1,
-0.004321627, -1.041018, -3.971647, 1, 1, 1, 1, 1,
-0.001148843, 0.5260431, -1.358392, 1, 1, 1, 1, 1,
0.002125367, -0.3831366, 2.285021, 1, 1, 1, 1, 1,
0.004451379, 0.4665716, -1.382434, 1, 1, 1, 1, 1,
0.004559244, -0.08977004, 4.173222, 1, 1, 1, 1, 1,
0.005181815, -0.03301109, 2.603789, 1, 1, 1, 1, 1,
0.01060025, 1.942026, -0.6751316, 1, 1, 1, 1, 1,
0.01148173, -0.9998131, 2.606431, 1, 1, 1, 1, 1,
0.01344535, -0.872336, 4.803095, 1, 1, 1, 1, 1,
0.01827892, 1.493751, -0.2113982, 1, 1, 1, 1, 1,
0.02184186, -0.4917204, 3.794919, 1, 1, 1, 1, 1,
0.02434076, 0.2290774, -0.6393924, 1, 1, 1, 1, 1,
0.02596196, 1.118086, 0.112968, 1, 1, 1, 1, 1,
0.02819796, 0.1847072, 0.9658878, 1, 1, 1, 1, 1,
0.03198308, -0.5051333, 3.298971, 1, 1, 1, 1, 1,
0.037103, -0.2351687, 3.643853, 0, 0, 1, 1, 1,
0.03828471, 1.22394, -0.4648729, 1, 0, 0, 1, 1,
0.04930609, 2.120144, 1.260247, 1, 0, 0, 1, 1,
0.05021911, -0.1065861, 3.872544, 1, 0, 0, 1, 1,
0.05736776, -0.8808779, 2.477969, 1, 0, 0, 1, 1,
0.05811893, -0.1126896, 5.152165, 1, 0, 0, 1, 1,
0.05826246, -0.462997, 3.176656, 0, 0, 0, 1, 1,
0.06095759, 0.09485527, 0.3218008, 0, 0, 0, 1, 1,
0.06359947, -0.1759442, 2.128184, 0, 0, 0, 1, 1,
0.06859849, -0.1021336, 2.241076, 0, 0, 0, 1, 1,
0.06937232, 0.9954023, 0.6511282, 0, 0, 0, 1, 1,
0.07088932, 0.8761455, -0.05364787, 0, 0, 0, 1, 1,
0.07194421, 0.133751, 1.06401, 0, 0, 0, 1, 1,
0.07455445, 1.405579, -1.202824, 1, 1, 1, 1, 1,
0.07786825, -0.8446693, 2.744012, 1, 1, 1, 1, 1,
0.08015408, 0.1757448, 0.2755772, 1, 1, 1, 1, 1,
0.08304296, -0.4506194, 2.294043, 1, 1, 1, 1, 1,
0.08336074, 1.20145, 2.320579, 1, 1, 1, 1, 1,
0.08576535, -0.3634414, 2.248631, 1, 1, 1, 1, 1,
0.08804005, -0.5088524, 4.352916, 1, 1, 1, 1, 1,
0.08942788, 0.5345899, 0.5913479, 1, 1, 1, 1, 1,
0.09247745, -1.05716, 3.912972, 1, 1, 1, 1, 1,
0.1043303, 0.9342569, 0.6865849, 1, 1, 1, 1, 1,
0.1062509, -0.005534206, 4.09178, 1, 1, 1, 1, 1,
0.1105611, 1.6243, -1.287182, 1, 1, 1, 1, 1,
0.1105737, -0.24619, 1.119202, 1, 1, 1, 1, 1,
0.1113346, -0.2033081, 2.169674, 1, 1, 1, 1, 1,
0.1125088, -0.3139591, 3.398283, 1, 1, 1, 1, 1,
0.1140269, 0.4719014, 1.536435, 0, 0, 1, 1, 1,
0.1178695, -0.7759644, 2.821846, 1, 0, 0, 1, 1,
0.1209845, -0.4236625, 1.16301, 1, 0, 0, 1, 1,
0.1214282, 0.9472943, 0.3647932, 1, 0, 0, 1, 1,
0.1226477, -0.3542432, 1.628383, 1, 0, 0, 1, 1,
0.1229168, -0.3508181, 1.428417, 1, 0, 0, 1, 1,
0.1229656, 1.430521, -0.5987581, 0, 0, 0, 1, 1,
0.1230548, -0.4919036, 3.158501, 0, 0, 0, 1, 1,
0.1231306, 0.7139349, -0.6471092, 0, 0, 0, 1, 1,
0.1250309, 1.440674, 0.1567456, 0, 0, 0, 1, 1,
0.1250752, 0.6998527, 0.5351611, 0, 0, 0, 1, 1,
0.1253596, 0.2960926, -0.6667049, 0, 0, 0, 1, 1,
0.1273189, 0.5794791, -0.1002116, 0, 0, 0, 1, 1,
0.1283794, -2.035186, 2.262276, 1, 1, 1, 1, 1,
0.1303186, 0.06579248, 2.438042, 1, 1, 1, 1, 1,
0.1308845, -1.814453, 2.281031, 1, 1, 1, 1, 1,
0.1311808, -0.9395303, 3.151575, 1, 1, 1, 1, 1,
0.1315036, 0.8385556, -1.041459, 1, 1, 1, 1, 1,
0.1379875, -0.05133876, 2.198592, 1, 1, 1, 1, 1,
0.1396606, 1.86358, 0.09615879, 1, 1, 1, 1, 1,
0.1399975, 0.8513845, -0.7170083, 1, 1, 1, 1, 1,
0.1412023, 2.356173, -0.4764835, 1, 1, 1, 1, 1,
0.1412289, 0.40287, -0.8697729, 1, 1, 1, 1, 1,
0.1421698, -0.6831796, 1.318841, 1, 1, 1, 1, 1,
0.1427033, -0.7082346, 1.547933, 1, 1, 1, 1, 1,
0.1432129, 0.04392609, 2.626678, 1, 1, 1, 1, 1,
0.1449059, 0.5281464, 0.3064777, 1, 1, 1, 1, 1,
0.1470691, -1.387558, 0.2833828, 1, 1, 1, 1, 1,
0.1473648, -0.1172019, 2.442851, 0, 0, 1, 1, 1,
0.149309, -1.047354, 4.981922, 1, 0, 0, 1, 1,
0.1509502, 0.7351639, 0.5824237, 1, 0, 0, 1, 1,
0.1514383, -1.390333, 2.731789, 1, 0, 0, 1, 1,
0.1516745, -0.01458894, 2.238473, 1, 0, 0, 1, 1,
0.1558887, -1.100139, 1.688068, 1, 0, 0, 1, 1,
0.1576837, -0.8868381, 3.727834, 0, 0, 0, 1, 1,
0.1589252, 1.896016, 1.82674, 0, 0, 0, 1, 1,
0.1612048, -1.067685, 1.288132, 0, 0, 0, 1, 1,
0.161779, 1.283916, -0.9627126, 0, 0, 0, 1, 1,
0.1623179, -2.781905, 3.743519, 0, 0, 0, 1, 1,
0.1644343, -0.1220624, 2.843753, 0, 0, 0, 1, 1,
0.1686066, 0.7823268, 0.7301927, 0, 0, 0, 1, 1,
0.1694607, -0.5971117, 4.335544, 1, 1, 1, 1, 1,
0.1703963, 0.4442479, 0.367809, 1, 1, 1, 1, 1,
0.1781919, -0.6515383, 1.965951, 1, 1, 1, 1, 1,
0.181419, -0.01948678, 1.109895, 1, 1, 1, 1, 1,
0.1818741, 0.5226735, 0.7698426, 1, 1, 1, 1, 1,
0.1851045, -0.8217949, 3.636137, 1, 1, 1, 1, 1,
0.1851992, -0.01477499, 1.259131, 1, 1, 1, 1, 1,
0.1867354, 1.147104, -0.1695058, 1, 1, 1, 1, 1,
0.1925903, -0.1078472, 1.73536, 1, 1, 1, 1, 1,
0.1957368, -2.092529, 2.849119, 1, 1, 1, 1, 1,
0.1973844, -0.121126, 1.887794, 1, 1, 1, 1, 1,
0.2016619, -1.305027, 4.521271, 1, 1, 1, 1, 1,
0.2022457, 0.5910801, 1.7967, 1, 1, 1, 1, 1,
0.2089083, -0.2836016, 0.6366054, 1, 1, 1, 1, 1,
0.2137536, -0.3351279, 1.628874, 1, 1, 1, 1, 1,
0.2227577, -0.2665537, 3.171889, 0, 0, 1, 1, 1,
0.225571, -2.241536, 3.432706, 1, 0, 0, 1, 1,
0.2263483, 1.682616, 0.7167876, 1, 0, 0, 1, 1,
0.2307231, 1.306367, 0.3486556, 1, 0, 0, 1, 1,
0.2310813, 0.2032007, -0.2127248, 1, 0, 0, 1, 1,
0.2325501, -0.7291934, 1.582072, 1, 0, 0, 1, 1,
0.2335263, -0.03330438, 3.702782, 0, 0, 0, 1, 1,
0.2397329, -0.9178706, 1.989361, 0, 0, 0, 1, 1,
0.2434658, -0.511161, 1.153423, 0, 0, 0, 1, 1,
0.2437876, 0.4739821, -0.6036601, 0, 0, 0, 1, 1,
0.2462175, 0.6275233, 0.2590641, 0, 0, 0, 1, 1,
0.2497782, -1.556618, 2.082156, 0, 0, 0, 1, 1,
0.2540973, -1.570254, 0.4881806, 0, 0, 0, 1, 1,
0.2541072, -0.8652952, 1.401376, 1, 1, 1, 1, 1,
0.2543219, -0.6760178, 3.511448, 1, 1, 1, 1, 1,
0.2555652, -0.007034196, 0.06884438, 1, 1, 1, 1, 1,
0.2641788, -0.4019476, 1.042693, 1, 1, 1, 1, 1,
0.26599, 0.1419723, 1.033473, 1, 1, 1, 1, 1,
0.2677112, 0.1611133, -1.419123, 1, 1, 1, 1, 1,
0.2719987, -0.005416919, 1.884581, 1, 1, 1, 1, 1,
0.2729163, -0.9284554, 3.164806, 1, 1, 1, 1, 1,
0.2739618, -0.3771034, 2.777842, 1, 1, 1, 1, 1,
0.274699, -1.23674, 3.548542, 1, 1, 1, 1, 1,
0.2777697, 0.7919586, 0.2668771, 1, 1, 1, 1, 1,
0.2799506, 0.9453517, 0.7792122, 1, 1, 1, 1, 1,
0.280066, 0.151416, -1.029705, 1, 1, 1, 1, 1,
0.2843813, -0.6404231, 3.24809, 1, 1, 1, 1, 1,
0.2882765, 1.183998, 1.289192, 1, 1, 1, 1, 1,
0.2898187, 0.2498224, 0.9282464, 0, 0, 1, 1, 1,
0.2940509, -0.1918073, 1.937453, 1, 0, 0, 1, 1,
0.2955134, 1.750878, 1.789145, 1, 0, 0, 1, 1,
0.2960733, -0.1963605, 2.142751, 1, 0, 0, 1, 1,
0.2965412, 0.1449128, 1.801894, 1, 0, 0, 1, 1,
0.3032002, -0.2834063, 2.178385, 1, 0, 0, 1, 1,
0.3037959, 0.7378761, 1.971253, 0, 0, 0, 1, 1,
0.3042113, -0.1274123, -0.2614382, 0, 0, 0, 1, 1,
0.3042759, -0.002068725, 2.268513, 0, 0, 0, 1, 1,
0.3067956, -0.9453743, 3.853452, 0, 0, 0, 1, 1,
0.3071971, 0.7617895, 1.099298, 0, 0, 0, 1, 1,
0.3092208, -0.01946668, 1.972222, 0, 0, 0, 1, 1,
0.3111532, 2.161388, -1.627164, 0, 0, 0, 1, 1,
0.3119105, -0.2229072, 3.262761, 1, 1, 1, 1, 1,
0.3143664, 0.06930232, 1.26365, 1, 1, 1, 1, 1,
0.3143897, -1.30487, 2.664264, 1, 1, 1, 1, 1,
0.3157822, 1.592874, 1.922716, 1, 1, 1, 1, 1,
0.3168286, -0.9553589, 3.43575, 1, 1, 1, 1, 1,
0.3255231, -0.2301967, 3.514621, 1, 1, 1, 1, 1,
0.3267955, 0.2962683, 0.3965096, 1, 1, 1, 1, 1,
0.329169, 0.4690361, -0.2162046, 1, 1, 1, 1, 1,
0.3293787, -0.3666371, 2.903071, 1, 1, 1, 1, 1,
0.3406691, 0.002130301, 1.842197, 1, 1, 1, 1, 1,
0.3418027, -0.5558179, 2.21518, 1, 1, 1, 1, 1,
0.3423306, -0.7741109, 3.625838, 1, 1, 1, 1, 1,
0.3464375, 0.5563861, 1.505123, 1, 1, 1, 1, 1,
0.3466552, -0.6688396, 2.262513, 1, 1, 1, 1, 1,
0.3511658, 0.2269552, 0.7189756, 1, 1, 1, 1, 1,
0.3529842, 0.4560621, -0.9268342, 0, 0, 1, 1, 1,
0.35843, -0.9911935, 2.347452, 1, 0, 0, 1, 1,
0.3607435, -1.725726, 2.07801, 1, 0, 0, 1, 1,
0.3637594, 0.06234244, 1.862066, 1, 0, 0, 1, 1,
0.3663801, -0.5914458, 3.225991, 1, 0, 0, 1, 1,
0.3677866, 0.08459328, 2.350225, 1, 0, 0, 1, 1,
0.3692087, -1.514737, 3.657743, 0, 0, 0, 1, 1,
0.3692883, 0.6274077, 1.531695, 0, 0, 0, 1, 1,
0.3696508, 0.9398311, 0.2442548, 0, 0, 0, 1, 1,
0.3708717, -0.9697676, 2.253896, 0, 0, 0, 1, 1,
0.3716161, 0.7224078, -0.6883997, 0, 0, 0, 1, 1,
0.3732886, 1.093496, 0.3476402, 0, 0, 0, 1, 1,
0.3740301, 0.693298, 1.91635, 0, 0, 0, 1, 1,
0.3831305, 2.109843, -0.09961151, 1, 1, 1, 1, 1,
0.3853531, -0.1784679, 1.111331, 1, 1, 1, 1, 1,
0.3858011, -0.6542097, 2.655288, 1, 1, 1, 1, 1,
0.3901266, 1.106919, 1.182992, 1, 1, 1, 1, 1,
0.3926195, -0.01869413, 1.457602, 1, 1, 1, 1, 1,
0.3945391, 0.03756372, 0.9601373, 1, 1, 1, 1, 1,
0.3968782, 1.092718, 0.6696935, 1, 1, 1, 1, 1,
0.3977032, 0.688512, 3.056993, 1, 1, 1, 1, 1,
0.4012661, -1.507343, 0.987047, 1, 1, 1, 1, 1,
0.4053755, -0.7204843, 1.095905, 1, 1, 1, 1, 1,
0.4063786, 0.8064552, -1.669616, 1, 1, 1, 1, 1,
0.4100624, -0.5970984, 1.566981, 1, 1, 1, 1, 1,
0.4123711, 0.0907674, 1.814553, 1, 1, 1, 1, 1,
0.4135506, 0.5987797, 0.7605945, 1, 1, 1, 1, 1,
0.4201682, 0.418279, 0.0283008, 1, 1, 1, 1, 1,
0.4206766, 0.6944742, -0.3813428, 0, 0, 1, 1, 1,
0.4253073, 1.325489, 0.54533, 1, 0, 0, 1, 1,
0.4257964, -2.204954, 3.303095, 1, 0, 0, 1, 1,
0.4269486, -0.5204992, 2.497009, 1, 0, 0, 1, 1,
0.427106, 0.1310021, -2.024022, 1, 0, 0, 1, 1,
0.4315982, -0.7243753, 2.92751, 1, 0, 0, 1, 1,
0.4319561, 0.5711042, 1.292802, 0, 0, 0, 1, 1,
0.4323901, -0.8464276, 1.267525, 0, 0, 0, 1, 1,
0.4338467, -0.2318971, 2.187154, 0, 0, 0, 1, 1,
0.4368129, 0.8512649, 0.6399536, 0, 0, 0, 1, 1,
0.4420713, -1.516479, 1.52537, 0, 0, 0, 1, 1,
0.4457388, -0.3966172, 1.903231, 0, 0, 0, 1, 1,
0.4484738, -1.265143, 1.37264, 0, 0, 0, 1, 1,
0.4546579, 0.5649737, -0.5921043, 1, 1, 1, 1, 1,
0.4568073, 0.03159779, 0.0493474, 1, 1, 1, 1, 1,
0.4601359, 1.021344, 1.257041, 1, 1, 1, 1, 1,
0.4738356, -0.2388869, 1.015326, 1, 1, 1, 1, 1,
0.4766897, 1.081313, 0.4684828, 1, 1, 1, 1, 1,
0.4830005, 0.1703216, 1.811309, 1, 1, 1, 1, 1,
0.4835992, 1.06466, 0.7217007, 1, 1, 1, 1, 1,
0.4911126, -1.161307, 3.277706, 1, 1, 1, 1, 1,
0.5006444, 0.007531457, 1.026611, 1, 1, 1, 1, 1,
0.5028129, -0.04636499, 1.382122, 1, 1, 1, 1, 1,
0.5050021, 0.7619307, 0.2704709, 1, 1, 1, 1, 1,
0.5058197, -0.5016785, 1.558416, 1, 1, 1, 1, 1,
0.5058636, 1.645099, -0.8447846, 1, 1, 1, 1, 1,
0.5191773, -1.998983, 3.02734, 1, 1, 1, 1, 1,
0.5219651, 0.06169847, 2.575672, 1, 1, 1, 1, 1,
0.5265226, 0.01022278, -0.3459559, 0, 0, 1, 1, 1,
0.5287628, 1.302269, 0.8240245, 1, 0, 0, 1, 1,
0.5307156, 0.01106799, 0.9447554, 1, 0, 0, 1, 1,
0.5313675, 0.06187327, 1.965448, 1, 0, 0, 1, 1,
0.5349696, 1.584337, -0.507764, 1, 0, 0, 1, 1,
0.5361779, -0.5589473, 1.879422, 1, 0, 0, 1, 1,
0.537153, -1.709415, 3.062868, 0, 0, 0, 1, 1,
0.540256, 2.320261, -0.7673723, 0, 0, 0, 1, 1,
0.5424908, -2.113082, 3.783128, 0, 0, 0, 1, 1,
0.5437436, -1.152062, 2.157782, 0, 0, 0, 1, 1,
0.546575, -0.5593332, 1.70189, 0, 0, 0, 1, 1,
0.5487663, -2.008738, 2.930138, 0, 0, 0, 1, 1,
0.556922, -0.2511519, 2.82387, 0, 0, 0, 1, 1,
0.5588163, 0.6734083, 0.180613, 1, 1, 1, 1, 1,
0.5600229, -1.100824, 1.623675, 1, 1, 1, 1, 1,
0.5664281, -1.289725, 2.67734, 1, 1, 1, 1, 1,
0.56852, 0.8029047, 0.6898776, 1, 1, 1, 1, 1,
0.5692847, 0.5668983, 1.094369, 1, 1, 1, 1, 1,
0.5701365, 0.6483099, 1.84462, 1, 1, 1, 1, 1,
0.5714808, -1.509606, 2.851395, 1, 1, 1, 1, 1,
0.5746994, -1.985011, 2.782862, 1, 1, 1, 1, 1,
0.5780043, 0.3674774, 2.072938, 1, 1, 1, 1, 1,
0.584567, 1.019455, -0.4792819, 1, 1, 1, 1, 1,
0.5855083, 2.112517, 0.3770049, 1, 1, 1, 1, 1,
0.5871561, -0.5281683, 3.291583, 1, 1, 1, 1, 1,
0.5886649, 0.3145091, 1.723324, 1, 1, 1, 1, 1,
0.5888776, 0.258695, 1.203336, 1, 1, 1, 1, 1,
0.5893342, 0.1870282, 1.553267, 1, 1, 1, 1, 1,
0.5925227, -0.0002954493, 1.667655, 0, 0, 1, 1, 1,
0.5945613, 0.0278629, 0.4670271, 1, 0, 0, 1, 1,
0.5992543, -0.6464649, 3.641052, 1, 0, 0, 1, 1,
0.6027644, -0.5555764, 4.278503, 1, 0, 0, 1, 1,
0.6126025, -0.370667, 1.307529, 1, 0, 0, 1, 1,
0.6170245, 1.709067, 0.3821914, 1, 0, 0, 1, 1,
0.6173817, 0.6592209, 1.080619, 0, 0, 0, 1, 1,
0.6221844, 0.7633418, 0.8118915, 0, 0, 0, 1, 1,
0.6241003, 0.5591245, 0.6225904, 0, 0, 0, 1, 1,
0.6272851, 0.8456108, 0.2808244, 0, 0, 0, 1, 1,
0.6353863, 0.330127, 3.569586, 0, 0, 0, 1, 1,
0.6355114, 0.2063541, 0.9654667, 0, 0, 0, 1, 1,
0.6431465, 2.203483, 0.3138139, 0, 0, 0, 1, 1,
0.6457511, 0.9650464, 0.1754481, 1, 1, 1, 1, 1,
0.6480746, -0.510554, 0.9318406, 1, 1, 1, 1, 1,
0.6489493, 1.530387, 0.2217821, 1, 1, 1, 1, 1,
0.6513357, 0.9157951, 1.072746, 1, 1, 1, 1, 1,
0.6640975, -0.7806888, 4.090596, 1, 1, 1, 1, 1,
0.6650808, 0.3556522, 2.211884, 1, 1, 1, 1, 1,
0.6674695, 1.721223, 0.02190438, 1, 1, 1, 1, 1,
0.6677247, 1.033284, 1.095327, 1, 1, 1, 1, 1,
0.6687146, 1.035312, -1.106542, 1, 1, 1, 1, 1,
0.6715404, 0.8136519, 1.209931, 1, 1, 1, 1, 1,
0.681361, -0.6655155, 2.408306, 1, 1, 1, 1, 1,
0.6821506, -0.8241412, 2.396047, 1, 1, 1, 1, 1,
0.6861572, -0.7453265, 1.51054, 1, 1, 1, 1, 1,
0.7017762, 0.7584136, 0.8257698, 1, 1, 1, 1, 1,
0.7023006, -0.4426271, 2.62541, 1, 1, 1, 1, 1,
0.703674, -0.557022, 2.046634, 0, 0, 1, 1, 1,
0.7044019, -0.249288, 0.8272735, 1, 0, 0, 1, 1,
0.7051088, -0.4577813, 0.4507909, 1, 0, 0, 1, 1,
0.7083155, -1.081941, 2.362529, 1, 0, 0, 1, 1,
0.7242044, -0.2279309, 1.41896, 1, 0, 0, 1, 1,
0.7316705, 0.5858843, 0.800043, 1, 0, 0, 1, 1,
0.7355427, -0.1816628, 1.897858, 0, 0, 0, 1, 1,
0.7367293, 0.3315409, 0.8267031, 0, 0, 0, 1, 1,
0.7385342, -0.2823924, 0.03795014, 0, 0, 0, 1, 1,
0.7395499, 1.537136, 0.1063113, 0, 0, 0, 1, 1,
0.7432428, 0.3275355, 1.869836, 0, 0, 0, 1, 1,
0.7450394, -1.068793, 2.263696, 0, 0, 0, 1, 1,
0.7491271, 0.6670429, -0.004915465, 0, 0, 0, 1, 1,
0.7507786, -0.940198, -0.09878417, 1, 1, 1, 1, 1,
0.7518906, -0.3693665, 2.446479, 1, 1, 1, 1, 1,
0.7520194, -1.279525, 2.86899, 1, 1, 1, 1, 1,
0.7542405, 1.182779, 0.07550721, 1, 1, 1, 1, 1,
0.7610281, 1.14767, 2.077636, 1, 1, 1, 1, 1,
0.7696895, -1.116392, 2.74059, 1, 1, 1, 1, 1,
0.7702013, 0.7757901, 2.452627, 1, 1, 1, 1, 1,
0.77093, -1.054938, 3.697306, 1, 1, 1, 1, 1,
0.7718115, 0.6119673, 0.827301, 1, 1, 1, 1, 1,
0.7754319, 0.5527089, 1.00579, 1, 1, 1, 1, 1,
0.7788991, -0.1364998, 2.013107, 1, 1, 1, 1, 1,
0.7793585, 1.879125, 0.6688197, 1, 1, 1, 1, 1,
0.7810843, -0.5186154, 2.257583, 1, 1, 1, 1, 1,
0.7821236, 0.1500869, 1.539928, 1, 1, 1, 1, 1,
0.7823065, -1.105482, 2.296674, 1, 1, 1, 1, 1,
0.7840265, -0.2519509, 3.432855, 0, 0, 1, 1, 1,
0.7851548, -0.3712692, -0.01157605, 1, 0, 0, 1, 1,
0.7880269, -0.6331815, 1.268179, 1, 0, 0, 1, 1,
0.790038, 0.3242317, 1.205502, 1, 0, 0, 1, 1,
0.7933245, -1.632938, 3.21575, 1, 0, 0, 1, 1,
0.7934047, -0.596221, 1.492336, 1, 0, 0, 1, 1,
0.7943964, -0.123415, 1.593349, 0, 0, 0, 1, 1,
0.7950765, 0.8954542, 1.96522, 0, 0, 0, 1, 1,
0.7958997, 0.8892975, 0.5668651, 0, 0, 0, 1, 1,
0.8141121, 0.6403592, 1.130105, 0, 0, 0, 1, 1,
0.8176049, -0.1309241, 1.077111, 0, 0, 0, 1, 1,
0.8177818, 0.8041884, -0.05721303, 0, 0, 0, 1, 1,
0.8182524, 1.108225, 0.9429541, 0, 0, 0, 1, 1,
0.82328, -0.1940367, 1.51242, 1, 1, 1, 1, 1,
0.824602, 0.9736152, 0.8928464, 1, 1, 1, 1, 1,
0.834668, -1.704847, 2.251277, 1, 1, 1, 1, 1,
0.8368284, 0.6689441, 1.452587, 1, 1, 1, 1, 1,
0.8387083, 0.3945647, 1.223927, 1, 1, 1, 1, 1,
0.840681, -0.7177179, 1.756214, 1, 1, 1, 1, 1,
0.8410812, -0.254861, 1.017508, 1, 1, 1, 1, 1,
0.8463216, -1.086009, 1.953253, 1, 1, 1, 1, 1,
0.8491154, -0.5426119, 1.304714, 1, 1, 1, 1, 1,
0.8506353, 0.6972713, 0.8036761, 1, 1, 1, 1, 1,
0.8510849, 0.6173297, -0.3279905, 1, 1, 1, 1, 1,
0.8579887, -1.455151, 2.469246, 1, 1, 1, 1, 1,
0.8656617, -0.3513902, 0.9484187, 1, 1, 1, 1, 1,
0.8693789, 0.5247225, 1.45762, 1, 1, 1, 1, 1,
0.8736293, 0.8514426, 1.302831, 1, 1, 1, 1, 1,
0.8757354, -0.4303941, 1.473572, 0, 0, 1, 1, 1,
0.8828162, -0.9978708, 2.04394, 1, 0, 0, 1, 1,
0.8852963, 0.5543467, 1.310572, 1, 0, 0, 1, 1,
0.8959966, -1.8805, 3.030993, 1, 0, 0, 1, 1,
0.8998636, -1.076301, 2.271415, 1, 0, 0, 1, 1,
0.9093303, 0.2511913, 0.9542849, 1, 0, 0, 1, 1,
0.9107112, -0.4564151, 3.057328, 0, 0, 0, 1, 1,
0.9111634, -0.6485943, 1.048304, 0, 0, 0, 1, 1,
0.9197141, 1.005876, 0.89331, 0, 0, 0, 1, 1,
0.9198515, 0.1194558, 0.5448257, 0, 0, 0, 1, 1,
0.9203916, 0.9700601, 2.574959, 0, 0, 0, 1, 1,
0.9270068, -0.0227174, 0.1912046, 0, 0, 0, 1, 1,
0.9306086, 0.3396183, 0.8871701, 0, 0, 0, 1, 1,
0.93301, -0.1433015, 2.041009, 1, 1, 1, 1, 1,
0.9330295, -0.5051602, 1.802601, 1, 1, 1, 1, 1,
0.9343217, 0.7238386, 1.072182, 1, 1, 1, 1, 1,
0.9404223, -0.8312606, 3.073714, 1, 1, 1, 1, 1,
0.9420283, -2.850274, 2.77748, 1, 1, 1, 1, 1,
0.9429334, -0.7003135, 2.872279, 1, 1, 1, 1, 1,
0.9600581, 0.5972578, 0.4436446, 1, 1, 1, 1, 1,
0.9610533, 0.7320093, 1.360539, 1, 1, 1, 1, 1,
0.9643456, -1.151112, 1.074634, 1, 1, 1, 1, 1,
0.9663798, -0.5258223, 3.384141, 1, 1, 1, 1, 1,
0.9667854, -0.4395658, 2.849677, 1, 1, 1, 1, 1,
0.9687762, -0.7023725, 1.074958, 1, 1, 1, 1, 1,
0.9693364, -1.046827, 2.969416, 1, 1, 1, 1, 1,
0.9708338, 0.1073153, 0.5278414, 1, 1, 1, 1, 1,
0.9714541, -0.1861839, 2.765802, 1, 1, 1, 1, 1,
0.9724023, 1.505894, 1.529325, 0, 0, 1, 1, 1,
0.9851442, 0.4478754, 1.539687, 1, 0, 0, 1, 1,
0.9860936, -0.5544831, 2.157016, 1, 0, 0, 1, 1,
0.9904082, -1.437573, 3.959696, 1, 0, 0, 1, 1,
0.9905258, -0.8774991, 2.775385, 1, 0, 0, 1, 1,
1.005211, -0.7243251, 1.702405, 1, 0, 0, 1, 1,
1.006516, -0.1613482, 2.869173, 0, 0, 0, 1, 1,
1.007239, -0.3390605, 2.637278, 0, 0, 0, 1, 1,
1.017567, 0.6849079, 0.8485364, 0, 0, 0, 1, 1,
1.019347, -0.6075241, 2.683037, 0, 0, 0, 1, 1,
1.022351, -1.186172, 2.923076, 0, 0, 0, 1, 1,
1.022469, -0.0233249, 2.723471, 0, 0, 0, 1, 1,
1.022904, 1.670062, 1.131306, 0, 0, 0, 1, 1,
1.027189, -0.8072466, 2.262901, 1, 1, 1, 1, 1,
1.027882, -0.06179909, 2.564935, 1, 1, 1, 1, 1,
1.032682, -1.458554, 1.818186, 1, 1, 1, 1, 1,
1.035196, -1.585092, 1.790853, 1, 1, 1, 1, 1,
1.036702, -0.4642078, 1.336785, 1, 1, 1, 1, 1,
1.037345, -0.3757487, 3.399675, 1, 1, 1, 1, 1,
1.042693, 1.372847, 0.01264012, 1, 1, 1, 1, 1,
1.042953, -0.2139639, 3.641986, 1, 1, 1, 1, 1,
1.044038, -0.0952277, 0.9644292, 1, 1, 1, 1, 1,
1.050304, -0.133417, 1.060365, 1, 1, 1, 1, 1,
1.051863, -0.01388649, 2.025533, 1, 1, 1, 1, 1,
1.06952, 0.9242743, 1.387084, 1, 1, 1, 1, 1,
1.073673, 1.347632, 0.7341859, 1, 1, 1, 1, 1,
1.079239, -1.430046, 2.254834, 1, 1, 1, 1, 1,
1.085772, -0.1243897, 0.6312267, 1, 1, 1, 1, 1,
1.092752, -0.9672978, 3.839026, 0, 0, 1, 1, 1,
1.096333, -1.118655, 4.136019, 1, 0, 0, 1, 1,
1.098695, 0.2756349, 1.302693, 1, 0, 0, 1, 1,
1.101517, 1.175438, 2.020789, 1, 0, 0, 1, 1,
1.103635, -1.8585, 1.063512, 1, 0, 0, 1, 1,
1.107495, -1.034316, 1.906304, 1, 0, 0, 1, 1,
1.117046, -0.1620049, 1.939379, 0, 0, 0, 1, 1,
1.121873, 1.270606, 0.7543951, 0, 0, 0, 1, 1,
1.123264, 1.765638, 0.9813875, 0, 0, 0, 1, 1,
1.125697, 2.186244, -0.09542172, 0, 0, 0, 1, 1,
1.129449, -0.3932739, 3.315372, 0, 0, 0, 1, 1,
1.131719, -0.2514078, 3.413789, 0, 0, 0, 1, 1,
1.136763, -1.147337, 3.307941, 0, 0, 0, 1, 1,
1.138673, -0.5477595, 1.918366, 1, 1, 1, 1, 1,
1.149536, -1.675292, 3.256641, 1, 1, 1, 1, 1,
1.153571, 0.2413518, -0.2243397, 1, 1, 1, 1, 1,
1.164115, -0.308289, 2.189296, 1, 1, 1, 1, 1,
1.166676, -0.4518903, 0.7625315, 1, 1, 1, 1, 1,
1.177487, 1.270216, 2.944771, 1, 1, 1, 1, 1,
1.182087, 1.47799, 1.055472, 1, 1, 1, 1, 1,
1.186549, -0.5951468, 0.897182, 1, 1, 1, 1, 1,
1.189081, 0.4227413, 1.173293, 1, 1, 1, 1, 1,
1.191916, 0.7871712, 0.1162473, 1, 1, 1, 1, 1,
1.19679, -1.616144, 1.896321, 1, 1, 1, 1, 1,
1.199521, 0.7426917, 0.9513859, 1, 1, 1, 1, 1,
1.201047, -1.009006, 2.770844, 1, 1, 1, 1, 1,
1.225184, -0.1623405, 2.741604, 1, 1, 1, 1, 1,
1.226423, 0.1988102, 1.059445, 1, 1, 1, 1, 1,
1.235054, -0.2336487, 2.403805, 0, 0, 1, 1, 1,
1.235454, -1.995811, 2.742224, 1, 0, 0, 1, 1,
1.243097, -0.311196, 0.8164598, 1, 0, 0, 1, 1,
1.246437, 0.0005162266, 0.6080229, 1, 0, 0, 1, 1,
1.247982, 0.3711284, 2.044495, 1, 0, 0, 1, 1,
1.252024, -0.263643, 1.617793, 1, 0, 0, 1, 1,
1.264873, 0.3979616, 0.7315245, 0, 0, 0, 1, 1,
1.269719, 0.3132595, 0.4624757, 0, 0, 0, 1, 1,
1.276946, -0.19662, 1.267171, 0, 0, 0, 1, 1,
1.283681, 1.495951, 0.5206817, 0, 0, 0, 1, 1,
1.294773, -0.8431218, 1.640236, 0, 0, 0, 1, 1,
1.296632, -0.8331528, 2.731576, 0, 0, 0, 1, 1,
1.298002, 0.02418762, 1.362938, 0, 0, 0, 1, 1,
1.301593, -0.4837371, 1.697864, 1, 1, 1, 1, 1,
1.306106, 2.006321, -0.1648692, 1, 1, 1, 1, 1,
1.307675, -0.5016584, 2.188683, 1, 1, 1, 1, 1,
1.311811, -1.440838, 1.160683, 1, 1, 1, 1, 1,
1.312002, -1.160097, 2.70035, 1, 1, 1, 1, 1,
1.312181, -0.6450555, 1.412506, 1, 1, 1, 1, 1,
1.313957, -0.7411402, 2.568823, 1, 1, 1, 1, 1,
1.314206, 0.1827767, 2.366407, 1, 1, 1, 1, 1,
1.321434, -0.7476188, 1.685225, 1, 1, 1, 1, 1,
1.333977, 1.343196, 1.113977, 1, 1, 1, 1, 1,
1.341086, -1.526384, 2.628762, 1, 1, 1, 1, 1,
1.359946, -1.01919, 2.271856, 1, 1, 1, 1, 1,
1.38195, 0.0764033, 0.9665712, 1, 1, 1, 1, 1,
1.386595, -1.896146, 1.591921, 1, 1, 1, 1, 1,
1.387381, 2.315573, 1.113838, 1, 1, 1, 1, 1,
1.394697, 0.1055229, 1.798428, 0, 0, 1, 1, 1,
1.395542, -0.06796332, 1.074773, 1, 0, 0, 1, 1,
1.402139, -0.9954597, 3.10123, 1, 0, 0, 1, 1,
1.40901, -0.2396413, 2.319629, 1, 0, 0, 1, 1,
1.417058, -0.4926691, 2.627955, 1, 0, 0, 1, 1,
1.417105, -0.3392097, 1.090679, 1, 0, 0, 1, 1,
1.425706, 0.7608495, 1.101538, 0, 0, 0, 1, 1,
1.42804, -0.5312714, 1.591499, 0, 0, 0, 1, 1,
1.445536, -0.6635196, 2.746628, 0, 0, 0, 1, 1,
1.460532, -0.3707905, 1.487368, 0, 0, 0, 1, 1,
1.483504, -0.8428141, 3.155978, 0, 0, 0, 1, 1,
1.49005, -2.015878, 2.296364, 0, 0, 0, 1, 1,
1.499264, -1.71691, 2.071524, 0, 0, 0, 1, 1,
1.500117, -0.5681541, 3.3284, 1, 1, 1, 1, 1,
1.50332, 0.06079914, 0.3457145, 1, 1, 1, 1, 1,
1.519929, 0.2107552, 2.088488, 1, 1, 1, 1, 1,
1.524251, 1.21629, -0.4178528, 1, 1, 1, 1, 1,
1.526027, 0.8389788, 3.0202, 1, 1, 1, 1, 1,
1.54566, -1.478157, 0.9565459, 1, 1, 1, 1, 1,
1.54636, 0.8219847, 0.4580778, 1, 1, 1, 1, 1,
1.55109, -0.2974589, 1.994831, 1, 1, 1, 1, 1,
1.554125, 0.6816902, 2.175094, 1, 1, 1, 1, 1,
1.568198, -1.86579, 1.636626, 1, 1, 1, 1, 1,
1.583378, -0.6635761, 1.491067, 1, 1, 1, 1, 1,
1.590409, 1.281874, 0.005175097, 1, 1, 1, 1, 1,
1.609079, -1.373993, 2.618807, 1, 1, 1, 1, 1,
1.623405, -0.1432616, 1.631075, 1, 1, 1, 1, 1,
1.634296, 0.7707935, 1.518992, 1, 1, 1, 1, 1,
1.635247, 0.9213239, 1.124829, 0, 0, 1, 1, 1,
1.672544, -1.464504, 2.856535, 1, 0, 0, 1, 1,
1.688153, 0.3560166, 1.027963, 1, 0, 0, 1, 1,
1.702629, 0.3057672, 0.6297182, 1, 0, 0, 1, 1,
1.703287, -1.34578, 1.460327, 1, 0, 0, 1, 1,
1.707141, 0.783347, 2.268031, 1, 0, 0, 1, 1,
1.716611, 0.6308023, 0.4193122, 0, 0, 0, 1, 1,
1.716727, -0.4242753, 2.156292, 0, 0, 0, 1, 1,
1.726816, -0.5679268, 1.264292, 0, 0, 0, 1, 1,
1.731791, 0.2556931, 0.6697289, 0, 0, 0, 1, 1,
1.733308, 1.333297, 0.8667735, 0, 0, 0, 1, 1,
1.746971, -1.705639, 2.839988, 0, 0, 0, 1, 1,
1.763307, -0.7344366, 1.800297, 0, 0, 0, 1, 1,
1.764372, 0.3641521, 0.4597444, 1, 1, 1, 1, 1,
1.774241, 0.5475796, 0.4840775, 1, 1, 1, 1, 1,
1.790824, 0.6282784, 1.040962, 1, 1, 1, 1, 1,
1.800848, -0.999504, 1.723251, 1, 1, 1, 1, 1,
1.809192, -0.3255615, -0.5145208, 1, 1, 1, 1, 1,
1.822367, 0.7595474, 0.268305, 1, 1, 1, 1, 1,
1.846089, 0.09385066, 0.9741664, 1, 1, 1, 1, 1,
1.872717, 0.9026759, 1.657622, 1, 1, 1, 1, 1,
1.873709, -0.04118953, 1.42033, 1, 1, 1, 1, 1,
1.876512, 0.9250988, 1.695485, 1, 1, 1, 1, 1,
1.889246, -0.1188411, 1.040054, 1, 1, 1, 1, 1,
1.901585, -1.111494, 2.691431, 1, 1, 1, 1, 1,
1.939701, 0.1548618, 1.516964, 1, 1, 1, 1, 1,
1.95961, 0.1923189, 0.7397195, 1, 1, 1, 1, 1,
1.965095, -1.96331, 2.286564, 1, 1, 1, 1, 1,
1.978173, -1.128077, 2.884586, 0, 0, 1, 1, 1,
1.986982, -0.7849018, 1.255489, 1, 0, 0, 1, 1,
1.993485, -1.196422, 3.789116, 1, 0, 0, 1, 1,
1.993759, 0.9496429, 1.80644, 1, 0, 0, 1, 1,
1.998233, 0.6032137, 1.793034, 1, 0, 0, 1, 1,
2.007165, 1.408448, 1.74341, 1, 0, 0, 1, 1,
2.058019, 1.585586, 2.27775, 0, 0, 0, 1, 1,
2.079591, -0.8141793, 2.798172, 0, 0, 0, 1, 1,
2.105827, 1.480626, 2.059902, 0, 0, 0, 1, 1,
2.136572, -1.517982, 2.539367, 0, 0, 0, 1, 1,
2.14179, 0.3615951, 2.055857, 0, 0, 0, 1, 1,
2.146602, 0.02669765, 2.377689, 0, 0, 0, 1, 1,
2.175925, -1.628393, 2.519071, 0, 0, 0, 1, 1,
2.182107, -1.301699, 0.5619503, 1, 1, 1, 1, 1,
2.37823, 1.097087, 0.7736492, 1, 1, 1, 1, 1,
2.385931, -0.6905581, 2.535568, 1, 1, 1, 1, 1,
2.474627, -1.443312, 0.9201511, 1, 1, 1, 1, 1,
2.893169, -0.7802114, 1.825478, 1, 1, 1, 1, 1,
3.123251, -1.050586, 1.20244, 1, 1, 1, 1, 1,
3.388467, 0.6252092, 0.2630231, 1, 1, 1, 1, 1
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
var radius = 9.640724;
var distance = 33.86263;
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
mvMatrix.translate( 0.01694179, -0.1155419, 0.3036482 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.86263);
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
