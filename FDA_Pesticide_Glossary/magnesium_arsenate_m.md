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
-2.942597, 1.906318, -2.545652, 1, 0, 0, 1,
-2.831327, 2.14869, -0.8135079, 1, 0.007843138, 0, 1,
-2.71903, -0.005273554, 0.5285731, 1, 0.01176471, 0, 1,
-2.711092, -1.658555, -4.000857, 1, 0.01960784, 0, 1,
-2.427009, -2.185582, -1.713982, 1, 0.02352941, 0, 1,
-2.40048, -1.902871, -3.254659, 1, 0.03137255, 0, 1,
-2.356132, -0.2559238, -3.154079, 1, 0.03529412, 0, 1,
-2.346024, -0.09195678, -0.816272, 1, 0.04313726, 0, 1,
-2.310918, -1.612089, -2.013565, 1, 0.04705882, 0, 1,
-2.296791, 1.197474, 0.02340309, 1, 0.05490196, 0, 1,
-2.248067, 1.175783, -2.125298, 1, 0.05882353, 0, 1,
-2.138629, 0.9349798, -0.2465844, 1, 0.06666667, 0, 1,
-2.137426, 1.188858, -0.9071047, 1, 0.07058824, 0, 1,
-2.131377, 1.117345, 0.7088751, 1, 0.07843138, 0, 1,
-2.131213, 0.494465, -4.372101, 1, 0.08235294, 0, 1,
-2.111468, 0.3390432, -1.466573, 1, 0.09019608, 0, 1,
-2.076004, -0.1651208, -2.079854, 1, 0.09411765, 0, 1,
-2.070274, 1.047673, -0.0829446, 1, 0.1019608, 0, 1,
-2.041079, -0.1462315, -1.282391, 1, 0.1098039, 0, 1,
-1.976714, 1.091365, -0.8805082, 1, 0.1137255, 0, 1,
-1.957467, -0.2608452, -2.923122, 1, 0.1215686, 0, 1,
-1.905039, 1.567957, -2.07343, 1, 0.1254902, 0, 1,
-1.902158, -0.3449323, -1.724414, 1, 0.1333333, 0, 1,
-1.852347, 0.3665122, -0.837365, 1, 0.1372549, 0, 1,
-1.849976, 2.406482, -0.001793428, 1, 0.145098, 0, 1,
-1.843905, 0.2107527, -2.459952, 1, 0.1490196, 0, 1,
-1.833999, 0.1029038, -3.400951, 1, 0.1568628, 0, 1,
-1.825565, 1.14702, -0.8501008, 1, 0.1607843, 0, 1,
-1.812876, -0.9720005, 0.2491746, 1, 0.1686275, 0, 1,
-1.792571, 0.7281326, 0.4248533, 1, 0.172549, 0, 1,
-1.787936, -1.286495, -2.849681, 1, 0.1803922, 0, 1,
-1.784566, 0.1578604, -2.828683, 1, 0.1843137, 0, 1,
-1.773256, -0.001529351, -1.087204, 1, 0.1921569, 0, 1,
-1.766201, 0.4416688, -0.7063752, 1, 0.1960784, 0, 1,
-1.752308, 1.799087, 0.3499803, 1, 0.2039216, 0, 1,
-1.748044, -0.1127197, -1.21414, 1, 0.2117647, 0, 1,
-1.729907, -0.4580087, -1.424587, 1, 0.2156863, 0, 1,
-1.726403, 0.5620994, -1.31948, 1, 0.2235294, 0, 1,
-1.725686, 0.5292273, -0.8560582, 1, 0.227451, 0, 1,
-1.694556, 1.124727, -0.8304281, 1, 0.2352941, 0, 1,
-1.681478, -0.694976, -2.085798, 1, 0.2392157, 0, 1,
-1.679644, -1.061121, -2.973588, 1, 0.2470588, 0, 1,
-1.664911, -0.3022283, -3.042242, 1, 0.2509804, 0, 1,
-1.65379, -1.883142, -2.955292, 1, 0.2588235, 0, 1,
-1.651002, 0.3089643, -0.4792528, 1, 0.2627451, 0, 1,
-1.623038, -0.2006863, -0.6505935, 1, 0.2705882, 0, 1,
-1.605158, -1.571511, -1.528683, 1, 0.2745098, 0, 1,
-1.601564, 0.663364, -1.810814, 1, 0.282353, 0, 1,
-1.594916, 0.37386, -0.2617927, 1, 0.2862745, 0, 1,
-1.593667, 0.5158449, -1.7485, 1, 0.2941177, 0, 1,
-1.57843, 0.02654721, -1.533603, 1, 0.3019608, 0, 1,
-1.572567, -1.73872, -2.827333, 1, 0.3058824, 0, 1,
-1.564826, -1.823699, -2.753305, 1, 0.3137255, 0, 1,
-1.556117, -0.3975546, -1.662945, 1, 0.3176471, 0, 1,
-1.551904, 0.001766592, -2.650997, 1, 0.3254902, 0, 1,
-1.537935, -0.8807468, -2.317862, 1, 0.3294118, 0, 1,
-1.532552, -2.087528, -2.213623, 1, 0.3372549, 0, 1,
-1.527384, -1.10638, -2.784657, 1, 0.3411765, 0, 1,
-1.520166, -1.323959, -1.483676, 1, 0.3490196, 0, 1,
-1.504492, -0.3961252, -2.847412, 1, 0.3529412, 0, 1,
-1.493593, -0.1326907, -2.339195, 1, 0.3607843, 0, 1,
-1.491826, 0.1402635, -3.576627, 1, 0.3647059, 0, 1,
-1.489179, -0.4286707, -2.201247, 1, 0.372549, 0, 1,
-1.482888, -1.122101, -1.230459, 1, 0.3764706, 0, 1,
-1.482242, 1.564955, -1.580144, 1, 0.3843137, 0, 1,
-1.475069, -1.028418, -1.426398, 1, 0.3882353, 0, 1,
-1.472855, -0.6984445, -1.772221, 1, 0.3960784, 0, 1,
-1.471562, -1.217427, -0.8070363, 1, 0.4039216, 0, 1,
-1.463608, -1.361796, -2.859512, 1, 0.4078431, 0, 1,
-1.463347, -0.5911406, -2.511528, 1, 0.4156863, 0, 1,
-1.462451, 0.3098326, -2.159948, 1, 0.4196078, 0, 1,
-1.457417, -0.04722939, -2.371162, 1, 0.427451, 0, 1,
-1.447056, 0.9701312, -1.061309, 1, 0.4313726, 0, 1,
-1.439563, -0.08136737, -0.4655949, 1, 0.4392157, 0, 1,
-1.430094, 0.1264612, -1.922884, 1, 0.4431373, 0, 1,
-1.428504, 1.007046, -2.211177, 1, 0.4509804, 0, 1,
-1.417181, -0.1009431, -1.060543, 1, 0.454902, 0, 1,
-1.410085, 0.7763171, -2.117926, 1, 0.4627451, 0, 1,
-1.406399, -0.9025263, -1.848144, 1, 0.4666667, 0, 1,
-1.406223, -1.238919, -2.386552, 1, 0.4745098, 0, 1,
-1.394854, 0.8756024, -0.8359465, 1, 0.4784314, 0, 1,
-1.38911, -0.5383185, -1.784609, 1, 0.4862745, 0, 1,
-1.385076, 0.1926633, -2.574677, 1, 0.4901961, 0, 1,
-1.377624, -0.263521, -0.9008849, 1, 0.4980392, 0, 1,
-1.371633, 0.2228647, 1.06466, 1, 0.5058824, 0, 1,
-1.362788, -1.629944, -3.111369, 1, 0.509804, 0, 1,
-1.359157, -0.07961353, -1.343803, 1, 0.5176471, 0, 1,
-1.356074, -0.5831104, -0.8870037, 1, 0.5215687, 0, 1,
-1.353808, -1.731269, -0.6786537, 1, 0.5294118, 0, 1,
-1.351514, 1.34812, -1.773713, 1, 0.5333334, 0, 1,
-1.344026, 0.5415344, -0.9390359, 1, 0.5411765, 0, 1,
-1.342734, -0.1245842, -2.223429, 1, 0.5450981, 0, 1,
-1.308902, -0.4511328, -3.484822, 1, 0.5529412, 0, 1,
-1.293624, -0.2146098, -1.573841, 1, 0.5568628, 0, 1,
-1.292679, -1.24373, -3.491521, 1, 0.5647059, 0, 1,
-1.270255, 1.368012, -1.346294, 1, 0.5686275, 0, 1,
-1.265494, -1.034297, -1.663078, 1, 0.5764706, 0, 1,
-1.262432, 0.1020518, -0.2532195, 1, 0.5803922, 0, 1,
-1.261379, -0.1623112, 0.131569, 1, 0.5882353, 0, 1,
-1.260899, -1.331616, -2.751421, 1, 0.5921569, 0, 1,
-1.255265, -1.066737, -0.9668503, 1, 0.6, 0, 1,
-1.251958, 1.260639, -1.486013, 1, 0.6078432, 0, 1,
-1.250564, -1.058604, -1.847616, 1, 0.6117647, 0, 1,
-1.246742, 0.3740469, -0.2659827, 1, 0.6196079, 0, 1,
-1.243979, 0.8763438, -0.6092388, 1, 0.6235294, 0, 1,
-1.237791, -0.3851201, -2.28118, 1, 0.6313726, 0, 1,
-1.209096, -0.03834986, -0.9324893, 1, 0.6352941, 0, 1,
-1.208951, -0.08886405, -1.682493, 1, 0.6431373, 0, 1,
-1.207271, -1.150511, -2.33605, 1, 0.6470588, 0, 1,
-1.205384, -1.134726, 0.1501607, 1, 0.654902, 0, 1,
-1.205146, -0.6313456, -3.578376, 1, 0.6588235, 0, 1,
-1.200514, 0.8713948, -0.37487, 1, 0.6666667, 0, 1,
-1.190046, -0.2860562, -1.905462, 1, 0.6705883, 0, 1,
-1.188526, 1.715005, 0.02998301, 1, 0.6784314, 0, 1,
-1.179662, 0.6529741, -0.1532281, 1, 0.682353, 0, 1,
-1.179572, -0.9914052, -4.105728, 1, 0.6901961, 0, 1,
-1.175162, 0.06743243, 0.2219258, 1, 0.6941177, 0, 1,
-1.173101, 0.4596552, -2.442501, 1, 0.7019608, 0, 1,
-1.169645, 0.5278434, -3.000813, 1, 0.7098039, 0, 1,
-1.169009, -0.006710897, -0.9268011, 1, 0.7137255, 0, 1,
-1.167348, 0.6789191, -1.714713, 1, 0.7215686, 0, 1,
-1.166864, -0.7650377, -0.4535621, 1, 0.7254902, 0, 1,
-1.164575, -0.1218755, -1.235254, 1, 0.7333333, 0, 1,
-1.162908, 0.7895168, -0.2128141, 1, 0.7372549, 0, 1,
-1.149204, 0.4475245, -1.750712, 1, 0.7450981, 0, 1,
-1.147854, 0.5651278, -1.548182, 1, 0.7490196, 0, 1,
-1.147291, -0.1532886, -1.415746, 1, 0.7568628, 0, 1,
-1.145754, -2.136599, -3.773664, 1, 0.7607843, 0, 1,
-1.142488, 0.4734034, -1.712427, 1, 0.7686275, 0, 1,
-1.135782, -0.3920428, -2.502892, 1, 0.772549, 0, 1,
-1.129153, 1.22091, -2.324445, 1, 0.7803922, 0, 1,
-1.124592, -0.577447, -2.287388, 1, 0.7843137, 0, 1,
-1.123132, 1.310319, 0.7204086, 1, 0.7921569, 0, 1,
-1.118757, -0.04194015, -1.252122, 1, 0.7960784, 0, 1,
-1.113733, 0.4540623, -1.367319, 1, 0.8039216, 0, 1,
-1.113667, 0.6730303, -1.394717, 1, 0.8117647, 0, 1,
-1.097527, -0.4914529, -2.225905, 1, 0.8156863, 0, 1,
-1.094393, -0.3252358, -3.649376, 1, 0.8235294, 0, 1,
-1.092421, 0.218704, -2.203959, 1, 0.827451, 0, 1,
-1.079727, -0.1891073, -2.680414, 1, 0.8352941, 0, 1,
-1.052291, 0.7861284, -1.740058, 1, 0.8392157, 0, 1,
-1.047253, -0.1596523, -1.292422, 1, 0.8470588, 0, 1,
-1.037481, -0.5532485, -1.961383, 1, 0.8509804, 0, 1,
-1.036373, 0.6672253, -1.864485, 1, 0.8588235, 0, 1,
-1.032447, 0.2274843, 0.9473515, 1, 0.8627451, 0, 1,
-1.031478, -1.246617, -2.744262, 1, 0.8705882, 0, 1,
-1.030915, -1.665232, -2.755751, 1, 0.8745098, 0, 1,
-1.029158, -0.323493, -2.664035, 1, 0.8823529, 0, 1,
-1.028245, -0.2955433, -1.111213, 1, 0.8862745, 0, 1,
-1.025473, 0.6509461, 0.5193531, 1, 0.8941177, 0, 1,
-1.023602, -0.4899929, -1.130926, 1, 0.8980392, 0, 1,
-1.019862, 1.541909, -1.736005, 1, 0.9058824, 0, 1,
-1.016339, -1.60147, -2.41873, 1, 0.9137255, 0, 1,
-1.007797, -1.322603, -4.158868, 1, 0.9176471, 0, 1,
-1.007574, -0.891821, -2.390395, 1, 0.9254902, 0, 1,
-1.003373, 0.1468344, -0.3213582, 1, 0.9294118, 0, 1,
-0.9990613, 0.4746751, -0.780036, 1, 0.9372549, 0, 1,
-0.9979475, -1.682836, -2.059457, 1, 0.9411765, 0, 1,
-0.9942206, 0.5725884, -0.9068135, 1, 0.9490196, 0, 1,
-0.9914204, -0.2217278, -2.707263, 1, 0.9529412, 0, 1,
-0.9903239, 0.7377838, -1.227007, 1, 0.9607843, 0, 1,
-0.9856509, -1.294343, -3.418815, 1, 0.9647059, 0, 1,
-0.9795997, -0.871442, -3.362225, 1, 0.972549, 0, 1,
-0.9785661, -0.1579661, -1.34982, 1, 0.9764706, 0, 1,
-0.9730859, 0.8647733, -0.1721022, 1, 0.9843137, 0, 1,
-0.9724218, -0.5850802, -0.592155, 1, 0.9882353, 0, 1,
-0.9688974, 2.092535, -1.491934, 1, 0.9960784, 0, 1,
-0.9625086, -0.8938205, -1.916441, 0.9960784, 1, 0, 1,
-0.9603724, -0.6439631, -3.708934, 0.9921569, 1, 0, 1,
-0.9480875, 1.888937, -2.024359, 0.9843137, 1, 0, 1,
-0.9361315, 0.2462262, -1.789257, 0.9803922, 1, 0, 1,
-0.9327198, -0.739122, -1.820978, 0.972549, 1, 0, 1,
-0.9290622, -0.3561533, -1.698093, 0.9686275, 1, 0, 1,
-0.9283259, -0.1682878, -1.252865, 0.9607843, 1, 0, 1,
-0.9216772, 0.3865023, -1.2784, 0.9568627, 1, 0, 1,
-0.9123998, -0.9734426, -3.278176, 0.9490196, 1, 0, 1,
-0.9099711, -0.7663637, -2.238725, 0.945098, 1, 0, 1,
-0.9090782, 0.3305327, -0.2925148, 0.9372549, 1, 0, 1,
-0.9081294, 0.6702618, -1.280891, 0.9333333, 1, 0, 1,
-0.9071437, -0.2945967, -3.07764, 0.9254902, 1, 0, 1,
-0.9009652, 0.2983542, -0.7366046, 0.9215686, 1, 0, 1,
-0.8994136, -1.370327, -3.141006, 0.9137255, 1, 0, 1,
-0.89929, 0.2011179, 0.5894523, 0.9098039, 1, 0, 1,
-0.8958333, -0.5350193, -2.234442, 0.9019608, 1, 0, 1,
-0.8893129, 1.538184, -2.28141, 0.8941177, 1, 0, 1,
-0.8875871, 1.156564, -0.945232, 0.8901961, 1, 0, 1,
-0.8851084, -0.657212, -2.085671, 0.8823529, 1, 0, 1,
-0.8788918, 1.626628, -0.6934437, 0.8784314, 1, 0, 1,
-0.8743128, 1.943878, -1.361986, 0.8705882, 1, 0, 1,
-0.8726925, -0.09788099, -0.6626984, 0.8666667, 1, 0, 1,
-0.8724937, -1.396946, -1.511112, 0.8588235, 1, 0, 1,
-0.8713872, 1.293243, 1.463462, 0.854902, 1, 0, 1,
-0.8654097, 0.8874813, -0.5249107, 0.8470588, 1, 0, 1,
-0.862427, -0.7431228, -2.409656, 0.8431373, 1, 0, 1,
-0.8611323, 1.429801, -0.3062958, 0.8352941, 1, 0, 1,
-0.8587007, 0.5003883, 0.3129565, 0.8313726, 1, 0, 1,
-0.8572168, 1.319186, -0.4485818, 0.8235294, 1, 0, 1,
-0.8570808, 0.2216064, -2.908367, 0.8196079, 1, 0, 1,
-0.8554882, -0.2432441, -0.381768, 0.8117647, 1, 0, 1,
-0.846526, 0.003904452, -1.161189, 0.8078431, 1, 0, 1,
-0.8446681, -0.9151441, -3.066636, 0.8, 1, 0, 1,
-0.8365701, 0.2224828, 0.4780026, 0.7921569, 1, 0, 1,
-0.8340961, 1.491274, 0.3327676, 0.7882353, 1, 0, 1,
-0.8263276, 0.1425404, -1.914786, 0.7803922, 1, 0, 1,
-0.8204244, -0.4171332, -2.314147, 0.7764706, 1, 0, 1,
-0.82, -0.90432, -2.857128, 0.7686275, 1, 0, 1,
-0.8194866, -1.04664, -2.499543, 0.7647059, 1, 0, 1,
-0.810426, -0.735027, 0.5202336, 0.7568628, 1, 0, 1,
-0.8059604, -2.825869, -2.947098, 0.7529412, 1, 0, 1,
-0.8025193, -0.08092453, -1.032426, 0.7450981, 1, 0, 1,
-0.7972355, -0.8488446, -1.124699, 0.7411765, 1, 0, 1,
-0.794647, 0.4011425, -0.8275919, 0.7333333, 1, 0, 1,
-0.7930631, 0.1795237, -0.813765, 0.7294118, 1, 0, 1,
-0.7879717, 0.7963846, -0.6118672, 0.7215686, 1, 0, 1,
-0.7879332, 0.558721, -3.207957, 0.7176471, 1, 0, 1,
-0.77544, -0.1425118, -2.094439, 0.7098039, 1, 0, 1,
-0.7726519, 0.3471383, -1.757965, 0.7058824, 1, 0, 1,
-0.7718602, 0.5976345, -2.222788, 0.6980392, 1, 0, 1,
-0.7714683, -0.5216804, -2.878852, 0.6901961, 1, 0, 1,
-0.7691287, 0.231702, -2.434513, 0.6862745, 1, 0, 1,
-0.7528718, 0.4202545, -0.5073832, 0.6784314, 1, 0, 1,
-0.7517313, -1.079041, -1.839459, 0.6745098, 1, 0, 1,
-0.7475894, -1.301144, -4.605715, 0.6666667, 1, 0, 1,
-0.7468899, 0.150907, -1.64315, 0.6627451, 1, 0, 1,
-0.7464702, -1.050699, -1.612898, 0.654902, 1, 0, 1,
-0.7461843, 1.230213, -1.101156, 0.6509804, 1, 0, 1,
-0.7374806, -0.300723, -3.01877, 0.6431373, 1, 0, 1,
-0.7359951, -1.44095, -4.265023, 0.6392157, 1, 0, 1,
-0.733255, 0.01336873, -0.7852729, 0.6313726, 1, 0, 1,
-0.7301964, -0.01654091, 0.05201958, 0.627451, 1, 0, 1,
-0.7277622, 0.4220961, -0.3494999, 0.6196079, 1, 0, 1,
-0.7102395, -0.9529667, -1.99488, 0.6156863, 1, 0, 1,
-0.7080531, 1.65757, 0.7422364, 0.6078432, 1, 0, 1,
-0.7064145, -0.9989227, -2.325999, 0.6039216, 1, 0, 1,
-0.7051715, -1.787407, -2.503943, 0.5960785, 1, 0, 1,
-0.7037818, 2.956256, 0.1529366, 0.5882353, 1, 0, 1,
-0.7010734, 0.4030924, -1.307691, 0.5843138, 1, 0, 1,
-0.692978, -1.725088, -2.886487, 0.5764706, 1, 0, 1,
-0.6858045, -0.3713876, -2.494181, 0.572549, 1, 0, 1,
-0.6838059, -0.1427701, -2.374662, 0.5647059, 1, 0, 1,
-0.6810066, -1.12697, -3.883104, 0.5607843, 1, 0, 1,
-0.6808006, 0.990097, -0.9257354, 0.5529412, 1, 0, 1,
-0.67933, -1.095378, -1.537592, 0.5490196, 1, 0, 1,
-0.6775927, 0.5004788, -2.011567, 0.5411765, 1, 0, 1,
-0.6774476, -1.150386, 0.673113, 0.5372549, 1, 0, 1,
-0.6695613, 1.989403, -0.1205978, 0.5294118, 1, 0, 1,
-0.6694902, -1.091545, -2.992836, 0.5254902, 1, 0, 1,
-0.6666202, -0.1788576, -2.38173, 0.5176471, 1, 0, 1,
-0.6649725, 1.241338, -1.364897, 0.5137255, 1, 0, 1,
-0.6613371, 0.1904073, -3.784591, 0.5058824, 1, 0, 1,
-0.6523659, -0.8425192, -2.42387, 0.5019608, 1, 0, 1,
-0.6413708, -1.664561, -2.338402, 0.4941176, 1, 0, 1,
-0.6412922, 0.3205005, -0.03185154, 0.4862745, 1, 0, 1,
-0.6409532, 1.95138, 0.1124003, 0.4823529, 1, 0, 1,
-0.6399352, 0.4175016, 1.015879, 0.4745098, 1, 0, 1,
-0.635762, -1.186232, -2.058798, 0.4705882, 1, 0, 1,
-0.6348019, 0.1646736, -1.895537, 0.4627451, 1, 0, 1,
-0.6238173, -0.6486967, -2.12038, 0.4588235, 1, 0, 1,
-0.6209524, -0.6268561, -2.737444, 0.4509804, 1, 0, 1,
-0.6202728, -0.5085844, -1.935744, 0.4470588, 1, 0, 1,
-0.6168569, 0.1939719, -3.184696, 0.4392157, 1, 0, 1,
-0.6118863, 0.04206749, -0.840745, 0.4352941, 1, 0, 1,
-0.6113529, 0.6710097, 1.604471, 0.427451, 1, 0, 1,
-0.6105677, -0.2382217, -1.200483, 0.4235294, 1, 0, 1,
-0.6071436, -0.8021631, -2.064287, 0.4156863, 1, 0, 1,
-0.6050765, 0.3219032, -0.4592806, 0.4117647, 1, 0, 1,
-0.6046346, 2.24047, -0.7728251, 0.4039216, 1, 0, 1,
-0.6038628, -1.977916, -2.362795, 0.3960784, 1, 0, 1,
-0.6021973, -0.3963786, -2.465659, 0.3921569, 1, 0, 1,
-0.6011876, 1.281948, 2.245138, 0.3843137, 1, 0, 1,
-0.6001314, 1.239574, -0.5251477, 0.3803922, 1, 0, 1,
-0.5970811, 0.2566136, -0.6734365, 0.372549, 1, 0, 1,
-0.5963255, 1.407091, 0.8311394, 0.3686275, 1, 0, 1,
-0.5935575, -1.105591, -2.485686, 0.3607843, 1, 0, 1,
-0.59166, 0.944948, -2.303709, 0.3568628, 1, 0, 1,
-0.58968, -1.130605, -2.507269, 0.3490196, 1, 0, 1,
-0.5878237, 2.838165, 0.3855638, 0.345098, 1, 0, 1,
-0.5875191, -1.319698, -2.052619, 0.3372549, 1, 0, 1,
-0.5861057, 0.003563002, -1.09928, 0.3333333, 1, 0, 1,
-0.5835493, -0.3609496, -2.567428, 0.3254902, 1, 0, 1,
-0.5830448, -0.09964599, -2.80493, 0.3215686, 1, 0, 1,
-0.5824808, 0.4034057, -0.01210038, 0.3137255, 1, 0, 1,
-0.5813592, 0.1654975, -3.172094, 0.3098039, 1, 0, 1,
-0.5801476, -0.4091073, -3.363518, 0.3019608, 1, 0, 1,
-0.5770234, 0.7966211, 1.191597, 0.2941177, 1, 0, 1,
-0.5704732, 1.516308, -1.284752, 0.2901961, 1, 0, 1,
-0.569742, -1.250712, -2.153038, 0.282353, 1, 0, 1,
-0.5694722, 0.3428868, -0.9388797, 0.2784314, 1, 0, 1,
-0.5660678, 1.562446, 1.501329, 0.2705882, 1, 0, 1,
-0.5595793, -0.115054, -1.939515, 0.2666667, 1, 0, 1,
-0.558324, -1.75595, -3.671274, 0.2588235, 1, 0, 1,
-0.5534369, 1.274899, 0.5488492, 0.254902, 1, 0, 1,
-0.5508745, -0.7824418, -3.472057, 0.2470588, 1, 0, 1,
-0.5499884, 1.16414, 2.108564, 0.2431373, 1, 0, 1,
-0.5495, 1.090318, -0.6715521, 0.2352941, 1, 0, 1,
-0.5452209, -0.7897935, -2.077812, 0.2313726, 1, 0, 1,
-0.5401645, 1.596038, -1.599553, 0.2235294, 1, 0, 1,
-0.5383171, 0.9063848, -2.270011, 0.2196078, 1, 0, 1,
-0.5382414, 0.7275371, -2.137547, 0.2117647, 1, 0, 1,
-0.5366042, 1.153766, 0.8179023, 0.2078431, 1, 0, 1,
-0.5344988, 2.129642, 0.3315488, 0.2, 1, 0, 1,
-0.534333, 0.5988194, -0.5801366, 0.1921569, 1, 0, 1,
-0.531327, 0.2187204, 1.367432, 0.1882353, 1, 0, 1,
-0.5312086, 1.556724, 0.0003170697, 0.1803922, 1, 0, 1,
-0.525668, 1.26845, 0.6346746, 0.1764706, 1, 0, 1,
-0.5219206, 0.1134539, -2.671386, 0.1686275, 1, 0, 1,
-0.5206829, -0.9959863, -3.929898, 0.1647059, 1, 0, 1,
-0.518087, 0.8944666, -1.473001, 0.1568628, 1, 0, 1,
-0.5131916, 0.685851, -1.908292, 0.1529412, 1, 0, 1,
-0.5080289, 0.6472281, -1.528341, 0.145098, 1, 0, 1,
-0.507653, 0.4127416, -0.6655986, 0.1411765, 1, 0, 1,
-0.5051215, 0.8684705, 0.2758593, 0.1333333, 1, 0, 1,
-0.4992535, 0.4721325, -0.8241484, 0.1294118, 1, 0, 1,
-0.4988056, 0.1647526, -2.795863, 0.1215686, 1, 0, 1,
-0.4897152, 0.03021066, -0.4757036, 0.1176471, 1, 0, 1,
-0.487644, -0.7071096, -2.516796, 0.1098039, 1, 0, 1,
-0.4844893, 0.3483944, -1.38346, 0.1058824, 1, 0, 1,
-0.4770739, 1.613092, -1.342625, 0.09803922, 1, 0, 1,
-0.4698275, -0.1520189, -2.853616, 0.09019608, 1, 0, 1,
-0.4690959, -0.4536009, -1.788771, 0.08627451, 1, 0, 1,
-0.4673022, 0.5256522, 0.9067552, 0.07843138, 1, 0, 1,
-0.4595232, -0.4591286, -3.511406, 0.07450981, 1, 0, 1,
-0.4585602, 1.987799, 0.3120733, 0.06666667, 1, 0, 1,
-0.4547779, 2.080932, -1.961604, 0.0627451, 1, 0, 1,
-0.4546157, -0.583695, -2.372553, 0.05490196, 1, 0, 1,
-0.4537853, 0.983034, 1.252631, 0.05098039, 1, 0, 1,
-0.451181, -0.5801461, -2.940418, 0.04313726, 1, 0, 1,
-0.4438909, 0.01860506, -0.7076702, 0.03921569, 1, 0, 1,
-0.4409856, -0.789292, -1.877487, 0.03137255, 1, 0, 1,
-0.4393432, -0.1214764, -1.080344, 0.02745098, 1, 0, 1,
-0.4359816, 1.573823, 0.2725625, 0.01960784, 1, 0, 1,
-0.4353903, -0.7889231, -3.216497, 0.01568628, 1, 0, 1,
-0.430406, 0.03458836, 0.2702496, 0.007843138, 1, 0, 1,
-0.4234892, 1.933491, -0.6475046, 0.003921569, 1, 0, 1,
-0.4229055, -0.1846871, -1.36715, 0, 1, 0.003921569, 1,
-0.4220766, 0.4050441, -0.1530093, 0, 1, 0.01176471, 1,
-0.4178017, 0.07125103, -0.5881542, 0, 1, 0.01568628, 1,
-0.4147739, 1.737598, -0.8435965, 0, 1, 0.02352941, 1,
-0.4127312, 0.5892306, -0.5859296, 0, 1, 0.02745098, 1,
-0.4121853, 1.771753, -1.655004, 0, 1, 0.03529412, 1,
-0.4111275, 0.04802797, -1.075835, 0, 1, 0.03921569, 1,
-0.410657, 1.376305, 1.15954, 0, 1, 0.04705882, 1,
-0.4035226, -1.261191, -1.820459, 0, 1, 0.05098039, 1,
-0.4021096, 1.558817, -1.674452, 0, 1, 0.05882353, 1,
-0.4018281, -0.6504176, -3.026369, 0, 1, 0.0627451, 1,
-0.4002879, -0.6109467, -3.556415, 0, 1, 0.07058824, 1,
-0.3993319, 0.2759261, -2.333898, 0, 1, 0.07450981, 1,
-0.3949966, -2.221517, -2.819516, 0, 1, 0.08235294, 1,
-0.3887388, -1.234333, -2.332628, 0, 1, 0.08627451, 1,
-0.3887359, -0.7378062, -3.923086, 0, 1, 0.09411765, 1,
-0.3825403, -0.6461073, 1.149036, 0, 1, 0.1019608, 1,
-0.3810772, 0.6343102, -1.050869, 0, 1, 0.1058824, 1,
-0.3790453, -1.234854, -3.11685, 0, 1, 0.1137255, 1,
-0.377151, 1.295252, -1.636694, 0, 1, 0.1176471, 1,
-0.3737603, -1.520167, -2.857972, 0, 1, 0.1254902, 1,
-0.3736943, 1.436895, -0.08374864, 0, 1, 0.1294118, 1,
-0.3655142, 0.6341487, -0.9851279, 0, 1, 0.1372549, 1,
-0.3640036, -3.065403, -3.349648, 0, 1, 0.1411765, 1,
-0.3606816, -0.2825043, -1.193034, 0, 1, 0.1490196, 1,
-0.3576449, -0.03507464, -1.76378, 0, 1, 0.1529412, 1,
-0.3538082, 0.0343362, -2.155796, 0, 1, 0.1607843, 1,
-0.3521089, 0.891706, -1.210714, 0, 1, 0.1647059, 1,
-0.3516909, -1.040207, -3.859007, 0, 1, 0.172549, 1,
-0.3505065, 1.162024, -0.364533, 0, 1, 0.1764706, 1,
-0.3468572, -1.520443, -2.188619, 0, 1, 0.1843137, 1,
-0.346286, 0.4725286, -0.7108985, 0, 1, 0.1882353, 1,
-0.3444976, -0.4518879, -3.034353, 0, 1, 0.1960784, 1,
-0.3432007, -0.7660731, -2.456307, 0, 1, 0.2039216, 1,
-0.3409196, 1.087018, 0.04418807, 0, 1, 0.2078431, 1,
-0.3402461, 0.6649031, 1.138444, 0, 1, 0.2156863, 1,
-0.3378289, -0.3807615, -2.16282, 0, 1, 0.2196078, 1,
-0.3357728, -1.79041, -0.02247982, 0, 1, 0.227451, 1,
-0.335193, 0.466702, 0.373798, 0, 1, 0.2313726, 1,
-0.3351777, 1.599521, -0.1903255, 0, 1, 0.2392157, 1,
-0.3348224, -0.8573149, -2.774649, 0, 1, 0.2431373, 1,
-0.3296753, -0.6338194, -2.591433, 0, 1, 0.2509804, 1,
-0.321269, 0.02742173, -4.442836, 0, 1, 0.254902, 1,
-0.313964, -0.5182235, -2.725327, 0, 1, 0.2627451, 1,
-0.311443, -1.530017, -4.215495, 0, 1, 0.2666667, 1,
-0.307021, -0.5251818, -4.684567, 0, 1, 0.2745098, 1,
-0.2991022, 0.2205769, -1.955013, 0, 1, 0.2784314, 1,
-0.2946115, 0.08056079, -0.7247304, 0, 1, 0.2862745, 1,
-0.2907374, 1.137081, -0.834936, 0, 1, 0.2901961, 1,
-0.2900448, 0.3676698, -1.297563, 0, 1, 0.2980392, 1,
-0.2879854, 0.5995169, -0.5969486, 0, 1, 0.3058824, 1,
-0.2872356, 0.07477497, -0.3639198, 0, 1, 0.3098039, 1,
-0.2871124, -1.362454, -2.522659, 0, 1, 0.3176471, 1,
-0.2870079, -1.94172, -3.238865, 0, 1, 0.3215686, 1,
-0.2869723, 0.02975166, -0.8356915, 0, 1, 0.3294118, 1,
-0.2852875, -0.5407958, -3.392988, 0, 1, 0.3333333, 1,
-0.2851945, 0.8036551, -0.6710573, 0, 1, 0.3411765, 1,
-0.2791442, -0.1020903, -1.491421, 0, 1, 0.345098, 1,
-0.2791014, 0.2283737, -1.653264, 0, 1, 0.3529412, 1,
-0.2784277, 0.5648368, 0.2963787, 0, 1, 0.3568628, 1,
-0.2782094, -0.09194684, -0.6842213, 0, 1, 0.3647059, 1,
-0.2720059, 1.057468, 0.1723568, 0, 1, 0.3686275, 1,
-0.2719073, -2.157933, -1.77023, 0, 1, 0.3764706, 1,
-0.2672605, -1.410501, -2.796132, 0, 1, 0.3803922, 1,
-0.2643007, 0.4341634, -1.202385, 0, 1, 0.3882353, 1,
-0.2622768, -0.292662, -3.750781, 0, 1, 0.3921569, 1,
-0.2621719, -0.3779937, -4.717983, 0, 1, 0.4, 1,
-0.2560603, 0.01885663, -2.149086, 0, 1, 0.4078431, 1,
-0.2533488, 0.6943031, -0.6013805, 0, 1, 0.4117647, 1,
-0.2521678, 0.2216021, -1.538684, 0, 1, 0.4196078, 1,
-0.249274, 0.09116085, -1.44916, 0, 1, 0.4235294, 1,
-0.2448967, 0.1295936, -0.2634388, 0, 1, 0.4313726, 1,
-0.2431695, -0.4585612, -3.063996, 0, 1, 0.4352941, 1,
-0.2429158, 0.4984681, 0.3105107, 0, 1, 0.4431373, 1,
-0.2394368, 1.559156, -1.384186, 0, 1, 0.4470588, 1,
-0.2393981, 0.2533637, -1.831764, 0, 1, 0.454902, 1,
-0.2389267, 0.4561757, -0.6999035, 0, 1, 0.4588235, 1,
-0.2387636, -1.30304, -3.422827, 0, 1, 0.4666667, 1,
-0.2379336, -0.8793129, -3.161796, 0, 1, 0.4705882, 1,
-0.2373569, 0.5524388, -0.9868276, 0, 1, 0.4784314, 1,
-0.2373343, 0.373339, 0.4653865, 0, 1, 0.4823529, 1,
-0.2371156, -0.2126396, -1.315356, 0, 1, 0.4901961, 1,
-0.2363599, -0.03548524, -2.619848, 0, 1, 0.4941176, 1,
-0.2349601, -0.3605777, -2.962694, 0, 1, 0.5019608, 1,
-0.2329949, -1.799746, -2.627364, 0, 1, 0.509804, 1,
-0.2304956, -0.5170276, -3.457452, 0, 1, 0.5137255, 1,
-0.2285798, -1.280518, -3.073882, 0, 1, 0.5215687, 1,
-0.2233157, 0.5955335, -0.09395273, 0, 1, 0.5254902, 1,
-0.2229821, 0.4187437, -0.3801675, 0, 1, 0.5333334, 1,
-0.2210606, 0.8133306, 0.3560379, 0, 1, 0.5372549, 1,
-0.2152291, 1.027396, -2.144252, 0, 1, 0.5450981, 1,
-0.2147159, -1.701294, -2.650431, 0, 1, 0.5490196, 1,
-0.2141116, -0.9353652, -2.378849, 0, 1, 0.5568628, 1,
-0.2124785, 0.3596258, -2.499181, 0, 1, 0.5607843, 1,
-0.2082942, 0.4837945, -1.232217, 0, 1, 0.5686275, 1,
-0.2077933, 0.1881101, 0.4770103, 0, 1, 0.572549, 1,
-0.2044837, 1.115759, -2.22179, 0, 1, 0.5803922, 1,
-0.2026174, -0.4255589, -2.659703, 0, 1, 0.5843138, 1,
-0.2021063, -1.014723, -2.238843, 0, 1, 0.5921569, 1,
-0.1995973, 0.8865238, -0.6043348, 0, 1, 0.5960785, 1,
-0.1984568, 2.304554, -1.350813, 0, 1, 0.6039216, 1,
-0.1933118, 0.05715264, -1.836204, 0, 1, 0.6117647, 1,
-0.1912871, -0.9555953, -1.220728, 0, 1, 0.6156863, 1,
-0.191214, 2.091828, 0.6286557, 0, 1, 0.6235294, 1,
-0.1894619, 0.3739111, -0.9169814, 0, 1, 0.627451, 1,
-0.1894576, 0.09793458, -1.948992, 0, 1, 0.6352941, 1,
-0.1872728, 0.05942926, -0.7380912, 0, 1, 0.6392157, 1,
-0.1848948, 0.6369399, 1.562811, 0, 1, 0.6470588, 1,
-0.1766883, 1.42418, -0.5511314, 0, 1, 0.6509804, 1,
-0.1755868, -0.7064353, -4.703399, 0, 1, 0.6588235, 1,
-0.1722241, -0.9754876, -4.403543, 0, 1, 0.6627451, 1,
-0.1717483, -0.7415706, -1.266912, 0, 1, 0.6705883, 1,
-0.1666625, 0.2609186, -0.7611611, 0, 1, 0.6745098, 1,
-0.1630819, 0.1452267, -1.482869, 0, 1, 0.682353, 1,
-0.162713, -0.9637225, -4.490216, 0, 1, 0.6862745, 1,
-0.1597746, 1.6283, 1.197598, 0, 1, 0.6941177, 1,
-0.1582798, -1.137498, -3.837029, 0, 1, 0.7019608, 1,
-0.1567667, 0.1280935, -2.007079, 0, 1, 0.7058824, 1,
-0.1567523, -0.133902, -0.4504961, 0, 1, 0.7137255, 1,
-0.1509819, -0.2770489, -2.74085, 0, 1, 0.7176471, 1,
-0.1477502, 2.001338, -1.502947, 0, 1, 0.7254902, 1,
-0.1455352, 0.8966026, 0.3251998, 0, 1, 0.7294118, 1,
-0.1359818, 0.6730079, -1.343138, 0, 1, 0.7372549, 1,
-0.1330194, -1.401335, -3.089108, 0, 1, 0.7411765, 1,
-0.1327338, -0.5974709, -2.040284, 0, 1, 0.7490196, 1,
-0.1298401, 0.5166889, -1.294577, 0, 1, 0.7529412, 1,
-0.1265435, -2.699374, -2.039937, 0, 1, 0.7607843, 1,
-0.1217423, -0.2057403, -3.381939, 0, 1, 0.7647059, 1,
-0.1215183, 0.1579482, 1.786329, 0, 1, 0.772549, 1,
-0.1195125, 1.221184, 0.453129, 0, 1, 0.7764706, 1,
-0.1147956, 0.3564237, -0.4888335, 0, 1, 0.7843137, 1,
-0.1143666, 0.2845426, -0.173253, 0, 1, 0.7882353, 1,
-0.1131228, 1.441754, -0.01863136, 0, 1, 0.7960784, 1,
-0.1126626, 0.6758097, 0.8269846, 0, 1, 0.8039216, 1,
-0.1099912, 0.6427228, 0.2641111, 0, 1, 0.8078431, 1,
-0.1090543, 0.917538, -1.39728, 0, 1, 0.8156863, 1,
-0.1086594, -0.4064672, -4.646932, 0, 1, 0.8196079, 1,
-0.1059178, -0.8087433, -3.869065, 0, 1, 0.827451, 1,
-0.104958, -1.324392, -4.100252, 0, 1, 0.8313726, 1,
-0.09888942, -1.844667, -2.854217, 0, 1, 0.8392157, 1,
-0.09479045, -0.4598582, -3.73314, 0, 1, 0.8431373, 1,
-0.09270586, -0.6375147, -4.52981, 0, 1, 0.8509804, 1,
-0.0920907, -0.2077175, -2.901556, 0, 1, 0.854902, 1,
-0.08955343, 1.948807, 0.02259106, 0, 1, 0.8627451, 1,
-0.08759768, 0.03001132, 0.2249316, 0, 1, 0.8666667, 1,
-0.08294721, 0.1043905, -0.5212168, 0, 1, 0.8745098, 1,
-0.07483051, 0.2377384, 0.5683014, 0, 1, 0.8784314, 1,
-0.07074855, 0.1426395, 1.044714, 0, 1, 0.8862745, 1,
-0.07066446, 0.6757877, -1.989241, 0, 1, 0.8901961, 1,
-0.06670213, -1.926447, -3.804084, 0, 1, 0.8980392, 1,
-0.06281487, 0.1155658, -0.1793249, 0, 1, 0.9058824, 1,
-0.06192748, 2.026105, 0.02751223, 0, 1, 0.9098039, 1,
-0.05805788, 0.6523588, -0.4030665, 0, 1, 0.9176471, 1,
-0.04770376, 0.006517746, -0.6726316, 0, 1, 0.9215686, 1,
-0.0378225, 0.05696361, 0.1991154, 0, 1, 0.9294118, 1,
-0.03403985, -0.1274002, -4.405313, 0, 1, 0.9333333, 1,
-0.02658332, -0.3205983, -2.484025, 0, 1, 0.9411765, 1,
-0.02401914, 0.6009879, 0.0117033, 0, 1, 0.945098, 1,
-0.02218177, -0.1354204, -2.314087, 0, 1, 0.9529412, 1,
-0.01856284, 0.09715279, -0.07585581, 0, 1, 0.9568627, 1,
-0.01855246, -0.0043152, -1.710802, 0, 1, 0.9647059, 1,
-0.01803624, -1.340504, -3.883498, 0, 1, 0.9686275, 1,
-0.0164374, 1.403291, 2.444629, 0, 1, 0.9764706, 1,
-0.01320622, -0.8880566, -3.594365, 0, 1, 0.9803922, 1,
-0.01103775, -0.1545445, -2.046516, 0, 1, 0.9882353, 1,
-0.01080733, -1.400751, -2.748644, 0, 1, 0.9921569, 1,
-0.003283892, 0.09726053, -0.03927067, 0, 1, 1, 1,
-0.002912835, -0.73317, 0.4239805, 0, 0.9921569, 1, 1,
-0.002782068, -1.592363, -4.069095, 0, 0.9882353, 1, 1,
-0.001926828, 0.5013502, -0.5602089, 0, 0.9803922, 1, 1,
0.0005108239, -0.3801416, 3.492928, 0, 0.9764706, 1, 1,
0.0007342793, -1.953849, 1.643953, 0, 0.9686275, 1, 1,
0.001626266, 1.052008, -0.8888676, 0, 0.9647059, 1, 1,
0.005757927, -1.595574, 4.377436, 0, 0.9568627, 1, 1,
0.006542324, -0.9414867, 4.171206, 0, 0.9529412, 1, 1,
0.01207358, 2.697608, 0.006114105, 0, 0.945098, 1, 1,
0.0124566, -1.895479, 3.612527, 0, 0.9411765, 1, 1,
0.01552726, 0.2272096, 0.5063425, 0, 0.9333333, 1, 1,
0.01603273, 0.7088345, 0.07964906, 0, 0.9294118, 1, 1,
0.01961685, 0.4056586, 0.3408189, 0, 0.9215686, 1, 1,
0.02004334, -1.213976, 3.659326, 0, 0.9176471, 1, 1,
0.02612548, -1.034842, 2.13322, 0, 0.9098039, 1, 1,
0.02979711, 0.5528814, 0.7207093, 0, 0.9058824, 1, 1,
0.03264111, 0.4741035, -0.2790439, 0, 0.8980392, 1, 1,
0.03274085, 0.6900647, -1.265294, 0, 0.8901961, 1, 1,
0.03283792, 0.203627, -0.008667796, 0, 0.8862745, 1, 1,
0.03472441, -0.5716707, 3.210782, 0, 0.8784314, 1, 1,
0.0390412, -1.296044, 3.95536, 0, 0.8745098, 1, 1,
0.04076232, 0.3935049, 0.9021674, 0, 0.8666667, 1, 1,
0.04506062, -0.3707733, 3.346586, 0, 0.8627451, 1, 1,
0.05031849, 0.8718199, 0.4933622, 0, 0.854902, 1, 1,
0.05179755, -1.232483, 2.437085, 0, 0.8509804, 1, 1,
0.05882143, -0.6222345, 2.369829, 0, 0.8431373, 1, 1,
0.06301061, 0.4450468, -1.177249, 0, 0.8392157, 1, 1,
0.06816017, 2.481322, -0.2695603, 0, 0.8313726, 1, 1,
0.06923523, 1.239008, -1.435867, 0, 0.827451, 1, 1,
0.06942915, 0.6424671, -1.039891, 0, 0.8196079, 1, 1,
0.0731062, -0.05372946, 4.425131, 0, 0.8156863, 1, 1,
0.08272209, -0.2697108, 3.84216, 0, 0.8078431, 1, 1,
0.08325133, -0.0290123, 2.211154, 0, 0.8039216, 1, 1,
0.08616272, -0.8222114, 3.294252, 0, 0.7960784, 1, 1,
0.09234418, 0.726758, 0.4049062, 0, 0.7882353, 1, 1,
0.0938379, -1.026421, 4.873062, 0, 0.7843137, 1, 1,
0.09579518, 0.6240883, 0.4719673, 0, 0.7764706, 1, 1,
0.09607034, 0.4276628, 0.5684456, 0, 0.772549, 1, 1,
0.09682758, 0.2142794, -0.2533097, 0, 0.7647059, 1, 1,
0.1039754, -0.2328263, 2.576939, 0, 0.7607843, 1, 1,
0.1054826, -0.8202004, 1.675012, 0, 0.7529412, 1, 1,
0.1064765, -0.8949111, 2.075787, 0, 0.7490196, 1, 1,
0.1103844, -1.466198, 2.42979, 0, 0.7411765, 1, 1,
0.1159092, 1.103992, 1.710714, 0, 0.7372549, 1, 1,
0.116349, -0.3388776, 3.045907, 0, 0.7294118, 1, 1,
0.119837, -0.9795463, 2.002198, 0, 0.7254902, 1, 1,
0.1230582, -1.075187, 2.014965, 0, 0.7176471, 1, 1,
0.1232259, 0.2520745, 1.313936, 0, 0.7137255, 1, 1,
0.1245349, -1.490749, 1.457334, 0, 0.7058824, 1, 1,
0.1263407, -0.9705597, 3.816111, 0, 0.6980392, 1, 1,
0.1284427, 0.1739427, 0.9214163, 0, 0.6941177, 1, 1,
0.1334117, 0.9891341, 0.1472332, 0, 0.6862745, 1, 1,
0.1337065, 0.6978136, 1.155336, 0, 0.682353, 1, 1,
0.1405676, 0.9674821, 1.00495, 0, 0.6745098, 1, 1,
0.1411195, -0.04672503, 2.871178, 0, 0.6705883, 1, 1,
0.141296, -0.3228287, 3.482059, 0, 0.6627451, 1, 1,
0.147827, -0.5713208, 2.277265, 0, 0.6588235, 1, 1,
0.1531262, -0.6708955, 3.534437, 0, 0.6509804, 1, 1,
0.1534386, -0.9063509, 2.450765, 0, 0.6470588, 1, 1,
0.1550094, -0.1397497, 2.16775, 0, 0.6392157, 1, 1,
0.1552771, -1.877086, 2.816274, 0, 0.6352941, 1, 1,
0.1568152, -0.4369275, 3.485967, 0, 0.627451, 1, 1,
0.1599314, 0.1937345, 1.136977, 0, 0.6235294, 1, 1,
0.1610273, 0.4079579, 1.081495, 0, 0.6156863, 1, 1,
0.1618863, 0.1027181, 0.3782431, 0, 0.6117647, 1, 1,
0.1621524, 0.7780123, 1.005457, 0, 0.6039216, 1, 1,
0.1626993, -0.9313036, 4.414907, 0, 0.5960785, 1, 1,
0.1728568, -0.7084235, 3.68064, 0, 0.5921569, 1, 1,
0.1732433, -0.349625, 3.293924, 0, 0.5843138, 1, 1,
0.1742832, 0.5166681, 0.9231251, 0, 0.5803922, 1, 1,
0.1795889, -0.4887361, 3.561789, 0, 0.572549, 1, 1,
0.1815374, 0.1346111, 0.4637268, 0, 0.5686275, 1, 1,
0.1821758, -0.1136347, 3.505872, 0, 0.5607843, 1, 1,
0.188861, 0.2586973, 1.241204, 0, 0.5568628, 1, 1,
0.1901338, 0.8828341, 0.726964, 0, 0.5490196, 1, 1,
0.191283, -0.7090583, 2.48694, 0, 0.5450981, 1, 1,
0.1916774, -0.2834504, 3.000301, 0, 0.5372549, 1, 1,
0.1945863, -1.781347, 2.306911, 0, 0.5333334, 1, 1,
0.207008, -0.4869388, 2.726858, 0, 0.5254902, 1, 1,
0.2095646, 1.272455, -0.6482913, 0, 0.5215687, 1, 1,
0.210479, -0.1802898, 0.0911577, 0, 0.5137255, 1, 1,
0.2114119, -0.3878482, 3.010121, 0, 0.509804, 1, 1,
0.2117727, -0.164388, 2.909143, 0, 0.5019608, 1, 1,
0.2135094, 0.3614309, 0.7997147, 0, 0.4941176, 1, 1,
0.21365, -1.671616, 5.261519, 0, 0.4901961, 1, 1,
0.2182657, 0.2689958, -0.0647357, 0, 0.4823529, 1, 1,
0.2189994, 0.423364, 0.8931464, 0, 0.4784314, 1, 1,
0.2218, -0.459307, 2.628763, 0, 0.4705882, 1, 1,
0.2229239, 0.7460371, -1.021827, 0, 0.4666667, 1, 1,
0.2260885, -0.3339543, 2.774998, 0, 0.4588235, 1, 1,
0.226451, 0.7645819, -0.6238427, 0, 0.454902, 1, 1,
0.2279339, -0.09660175, 1.746673, 0, 0.4470588, 1, 1,
0.2303258, -0.04361534, 1.781519, 0, 0.4431373, 1, 1,
0.2305529, -1.242865, 2.126773, 0, 0.4352941, 1, 1,
0.2362143, 1.47118, -0.7738388, 0, 0.4313726, 1, 1,
0.2378709, 0.3874375, 0.9565083, 0, 0.4235294, 1, 1,
0.2399065, 2.263692, 0.09780682, 0, 0.4196078, 1, 1,
0.2453556, -0.9393775, 3.313798, 0, 0.4117647, 1, 1,
0.2493642, 0.7270551, 1.626116, 0, 0.4078431, 1, 1,
0.2546041, -1.851403, 4.683493, 0, 0.4, 1, 1,
0.2579374, 0.5289421, 1.463762, 0, 0.3921569, 1, 1,
0.2601223, 0.9362167, 2.056918, 0, 0.3882353, 1, 1,
0.2621502, -0.7337857, 2.021723, 0, 0.3803922, 1, 1,
0.264714, -1.75427, 3.209033, 0, 0.3764706, 1, 1,
0.2670303, 0.4017785, 0.9407149, 0, 0.3686275, 1, 1,
0.2673962, -0.2234835, 3.578844, 0, 0.3647059, 1, 1,
0.2708578, -0.07856534, 3.618183, 0, 0.3568628, 1, 1,
0.2711177, -0.3987988, 2.605574, 0, 0.3529412, 1, 1,
0.27557, 0.5451357, 1.060068, 0, 0.345098, 1, 1,
0.276186, 0.3344222, -0.03522913, 0, 0.3411765, 1, 1,
0.2763166, 0.3388121, 1.426695, 0, 0.3333333, 1, 1,
0.2791311, 0.7095715, 2.634528, 0, 0.3294118, 1, 1,
0.2792799, -1.454448, 2.860252, 0, 0.3215686, 1, 1,
0.2794094, -0.2959578, 2.042799, 0, 0.3176471, 1, 1,
0.2908382, -0.1923825, 1.428505, 0, 0.3098039, 1, 1,
0.2927748, -0.07069243, 0.7377541, 0, 0.3058824, 1, 1,
0.2948219, 1.885347, 0.003427343, 0, 0.2980392, 1, 1,
0.2956797, -1.843789, 3.451502, 0, 0.2901961, 1, 1,
0.2985793, -0.2903427, 2.333649, 0, 0.2862745, 1, 1,
0.3002031, 0.694664, 0.2111884, 0, 0.2784314, 1, 1,
0.3003432, 0.1951941, 1.345639, 0, 0.2745098, 1, 1,
0.3033551, -0.4409861, 3.09737, 0, 0.2666667, 1, 1,
0.3040806, 1.966697, -1.508207, 0, 0.2627451, 1, 1,
0.3091123, -0.7383034, 3.445328, 0, 0.254902, 1, 1,
0.3124455, -1.255139, 3.4589, 0, 0.2509804, 1, 1,
0.3137853, -1.083312, 1.95689, 0, 0.2431373, 1, 1,
0.3171837, 0.1403621, 1.623099, 0, 0.2392157, 1, 1,
0.3175141, 0.6348014, -0.360856, 0, 0.2313726, 1, 1,
0.3205492, 0.6795069, 0.2892285, 0, 0.227451, 1, 1,
0.3219596, 0.4662977, -2.13372, 0, 0.2196078, 1, 1,
0.3223982, 0.07795603, 0.7208151, 0, 0.2156863, 1, 1,
0.3228028, -0.7675795, 3.832406, 0, 0.2078431, 1, 1,
0.3228133, 0.8222957, 0.3595579, 0, 0.2039216, 1, 1,
0.3349236, -0.6008306, 1.789122, 0, 0.1960784, 1, 1,
0.3404926, 0.8083162, -1.447892, 0, 0.1882353, 1, 1,
0.344393, -0.6512405, 2.970173, 0, 0.1843137, 1, 1,
0.3499467, -0.7380632, 2.578902, 0, 0.1764706, 1, 1,
0.357522, -0.09156812, 3.142713, 0, 0.172549, 1, 1,
0.360064, 0.06733174, 0.03180844, 0, 0.1647059, 1, 1,
0.3660588, 1.393354, 0.3863005, 0, 0.1607843, 1, 1,
0.3725334, -1.35718, 2.273975, 0, 0.1529412, 1, 1,
0.3740385, -0.2573344, 1.688899, 0, 0.1490196, 1, 1,
0.3786774, 0.5153498, 1.211758, 0, 0.1411765, 1, 1,
0.3789602, -1.220833, 0.983776, 0, 0.1372549, 1, 1,
0.3792096, -0.6170922, 2.122421, 0, 0.1294118, 1, 1,
0.3827916, -0.931022, 4.38065, 0, 0.1254902, 1, 1,
0.3842637, -0.3320189, -0.4452121, 0, 0.1176471, 1, 1,
0.3871281, -2.008688, 2.298903, 0, 0.1137255, 1, 1,
0.3882923, -2.107012, 2.729549, 0, 0.1058824, 1, 1,
0.3892922, -0.3342669, 2.961622, 0, 0.09803922, 1, 1,
0.3952403, -1.682553, 2.657273, 0, 0.09411765, 1, 1,
0.395687, 0.09724179, -0.4014085, 0, 0.08627451, 1, 1,
0.4037884, 1.28661, 2.638976, 0, 0.08235294, 1, 1,
0.4043229, 0.03520299, 3.932702, 0, 0.07450981, 1, 1,
0.4115646, 1.512765, 0.3293352, 0, 0.07058824, 1, 1,
0.4142582, 0.7962332, -0.5374255, 0, 0.0627451, 1, 1,
0.4167534, -1.209571, 4.338938, 0, 0.05882353, 1, 1,
0.4177658, -1.888791, 3.119876, 0, 0.05098039, 1, 1,
0.424372, 0.7418671, -1.088358, 0, 0.04705882, 1, 1,
0.4250119, -1.949018, 2.291106, 0, 0.03921569, 1, 1,
0.4254759, 2.367754, 1.018808, 0, 0.03529412, 1, 1,
0.4309196, -0.8735342, 2.773042, 0, 0.02745098, 1, 1,
0.4335252, -0.2184101, 2.522754, 0, 0.02352941, 1, 1,
0.4338116, -0.1215386, 1.756614, 0, 0.01568628, 1, 1,
0.4366185, -0.4839718, 2.388227, 0, 0.01176471, 1, 1,
0.4403182, -0.945573, 2.564225, 0, 0.003921569, 1, 1,
0.4424466, -0.1403134, 0.6528609, 0.003921569, 0, 1, 1,
0.4432608, -0.3192496, 2.825247, 0.007843138, 0, 1, 1,
0.4477599, -1.066125, 3.964762, 0.01568628, 0, 1, 1,
0.4493329, -0.08284881, 0.2761491, 0.01960784, 0, 1, 1,
0.4506594, 0.8828356, 1.60989, 0.02745098, 0, 1, 1,
0.4585625, 1.032358, -1.044152, 0.03137255, 0, 1, 1,
0.458625, 0.05077428, 1.169623, 0.03921569, 0, 1, 1,
0.4648747, 0.2667081, 2.187184, 0.04313726, 0, 1, 1,
0.471574, -1.170809, 3.481574, 0.05098039, 0, 1, 1,
0.4761618, -1.682567, 3.452013, 0.05490196, 0, 1, 1,
0.4798015, -0.6256022, 3.3047, 0.0627451, 0, 1, 1,
0.4805808, -0.1934928, 3.484432, 0.06666667, 0, 1, 1,
0.4818525, 0.2182001, 2.924062, 0.07450981, 0, 1, 1,
0.4849181, -1.404119, 3.115386, 0.07843138, 0, 1, 1,
0.4862542, 0.4840634, 1.26606, 0.08627451, 0, 1, 1,
0.4919671, 0.1772754, 2.554138, 0.09019608, 0, 1, 1,
0.5033126, -0.9846603, 3.635822, 0.09803922, 0, 1, 1,
0.5037202, 1.062605, 0.8736895, 0.1058824, 0, 1, 1,
0.5038239, 0.3607161, -0.6896244, 0.1098039, 0, 1, 1,
0.5077898, 1.392207, 0.6910093, 0.1176471, 0, 1, 1,
0.5104203, -0.8555534, 2.906282, 0.1215686, 0, 1, 1,
0.5121732, 0.6542873, 0.9512079, 0.1294118, 0, 1, 1,
0.5127683, -0.06537969, 2.238928, 0.1333333, 0, 1, 1,
0.5155897, -0.6798785, 1.376404, 0.1411765, 0, 1, 1,
0.5206295, -0.03807057, 1.800932, 0.145098, 0, 1, 1,
0.5230731, -0.4440922, 1.294078, 0.1529412, 0, 1, 1,
0.5232164, -0.4778901, 2.187516, 0.1568628, 0, 1, 1,
0.5277139, 1.676576, 0.8256681, 0.1647059, 0, 1, 1,
0.5333977, 0.1681257, -0.1523023, 0.1686275, 0, 1, 1,
0.5347207, -0.2776472, 3.718825, 0.1764706, 0, 1, 1,
0.536746, -0.482362, 1.548353, 0.1803922, 0, 1, 1,
0.5381868, 1.315068, -0.5303511, 0.1882353, 0, 1, 1,
0.5392799, 0.3917484, 3.217467, 0.1921569, 0, 1, 1,
0.5428966, -0.7978317, 2.29674, 0.2, 0, 1, 1,
0.5472221, 0.4210186, 0.6165785, 0.2078431, 0, 1, 1,
0.5488337, 1.546573, -1.435505, 0.2117647, 0, 1, 1,
0.550181, -0.790584, 2.199314, 0.2196078, 0, 1, 1,
0.5504508, 1.470618, 0.8100246, 0.2235294, 0, 1, 1,
0.5511466, 1.503115, 0.2577522, 0.2313726, 0, 1, 1,
0.5521641, -1.441398, 2.699093, 0.2352941, 0, 1, 1,
0.5604172, -0.04388671, 1.229936, 0.2431373, 0, 1, 1,
0.5681483, 0.9306664, 0.2704325, 0.2470588, 0, 1, 1,
0.57397, 0.4757463, -0.5429628, 0.254902, 0, 1, 1,
0.5802291, -2.005366, 4.202267, 0.2588235, 0, 1, 1,
0.581206, -0.5271007, 3.341023, 0.2666667, 0, 1, 1,
0.5847191, 0.8560805, -0.02883, 0.2705882, 0, 1, 1,
0.5853286, -0.3464426, 1.790713, 0.2784314, 0, 1, 1,
0.5854812, 0.8033011, -0.1453288, 0.282353, 0, 1, 1,
0.5885493, 1.581812, 0.1281283, 0.2901961, 0, 1, 1,
0.5916642, 0.3098127, 0.2181769, 0.2941177, 0, 1, 1,
0.5938134, 0.06858318, 1.423421, 0.3019608, 0, 1, 1,
0.5939317, -1.394123, 4.088852, 0.3098039, 0, 1, 1,
0.5999607, -0.631954, 0.2388052, 0.3137255, 0, 1, 1,
0.6037796, -0.7614624, 1.736826, 0.3215686, 0, 1, 1,
0.6124291, 0.3787904, 1.245757, 0.3254902, 0, 1, 1,
0.6276404, 0.2508065, 0.1264875, 0.3333333, 0, 1, 1,
0.6298763, 0.6222763, 1.203612, 0.3372549, 0, 1, 1,
0.6332909, 0.8041893, 2.326327, 0.345098, 0, 1, 1,
0.6337599, -0.1643022, 2.147891, 0.3490196, 0, 1, 1,
0.6355489, 0.1498989, 1.848997, 0.3568628, 0, 1, 1,
0.6366095, 2.035657, 1.455822, 0.3607843, 0, 1, 1,
0.637861, -0.2235538, -0.0497069, 0.3686275, 0, 1, 1,
0.6423458, 0.09989643, 1.228095, 0.372549, 0, 1, 1,
0.6459689, -1.316956, 3.159528, 0.3803922, 0, 1, 1,
0.6465803, 0.6061909, -0.03050438, 0.3843137, 0, 1, 1,
0.6522982, -1.559094, 1.476989, 0.3921569, 0, 1, 1,
0.6527259, -0.9654597, 2.471205, 0.3960784, 0, 1, 1,
0.6551558, -1.373057, 4.011861, 0.4039216, 0, 1, 1,
0.6559055, 0.8118182, 0.8245061, 0.4117647, 0, 1, 1,
0.6573975, 1.173717, 1.244052, 0.4156863, 0, 1, 1,
0.6589047, 0.7286919, 0.3276694, 0.4235294, 0, 1, 1,
0.6589363, 1.234545, 0.4826268, 0.427451, 0, 1, 1,
0.6600413, -0.371909, 0.706483, 0.4352941, 0, 1, 1,
0.6610742, 2.301392, -0.6544683, 0.4392157, 0, 1, 1,
0.6625182, -2.165318, 2.80726, 0.4470588, 0, 1, 1,
0.665377, -0.4694372, 1.671067, 0.4509804, 0, 1, 1,
0.6785157, -0.3034462, 2.610139, 0.4588235, 0, 1, 1,
0.6903704, -0.07239262, 1.885402, 0.4627451, 0, 1, 1,
0.6929993, 0.4160852, 0.9329833, 0.4705882, 0, 1, 1,
0.6957088, -0.1872508, 3.405432, 0.4745098, 0, 1, 1,
0.6964319, -0.8233901, 2.395087, 0.4823529, 0, 1, 1,
0.7056074, 1.277616, 0.8820598, 0.4862745, 0, 1, 1,
0.7060718, -1.231566, 2.584848, 0.4941176, 0, 1, 1,
0.7065046, 0.2273808, 1.045927, 0.5019608, 0, 1, 1,
0.7086267, 0.4272596, 1.257719, 0.5058824, 0, 1, 1,
0.7111576, -0.006275718, 1.893121, 0.5137255, 0, 1, 1,
0.7145002, 0.01760146, 0.5466641, 0.5176471, 0, 1, 1,
0.7150371, 0.2506994, 0.8365916, 0.5254902, 0, 1, 1,
0.719231, 0.7256864, 1.950923, 0.5294118, 0, 1, 1,
0.7226368, -0.3569835, 1.588297, 0.5372549, 0, 1, 1,
0.7260789, 0.005701981, -0.6215235, 0.5411765, 0, 1, 1,
0.7281856, -0.1175283, 2.336017, 0.5490196, 0, 1, 1,
0.7300925, -0.5123686, 3.724407, 0.5529412, 0, 1, 1,
0.7333362, -0.9634791, 2.417769, 0.5607843, 0, 1, 1,
0.7377836, -1.518606, 2.935707, 0.5647059, 0, 1, 1,
0.7396504, -1.83388, 2.477727, 0.572549, 0, 1, 1,
0.7417707, -0.2619179, 1.532083, 0.5764706, 0, 1, 1,
0.7430963, -0.009791383, 0.6820574, 0.5843138, 0, 1, 1,
0.7478427, 0.9458285, 0.03432313, 0.5882353, 0, 1, 1,
0.74928, -0.2234389, 1.74369, 0.5960785, 0, 1, 1,
0.7503878, -0.5955885, 2.25634, 0.6039216, 0, 1, 1,
0.7525908, -0.176751, 3.23402, 0.6078432, 0, 1, 1,
0.763532, 1.284537, 1.020216, 0.6156863, 0, 1, 1,
0.7685144, -1.332598, 2.99089, 0.6196079, 0, 1, 1,
0.7786819, -0.6100848, 1.307062, 0.627451, 0, 1, 1,
0.7842022, -0.1612672, 2.269245, 0.6313726, 0, 1, 1,
0.7902847, -0.3926714, 0.6115463, 0.6392157, 0, 1, 1,
0.7909352, 0.08957969, 1.628518, 0.6431373, 0, 1, 1,
0.7941187, -0.07115996, 0.5906556, 0.6509804, 0, 1, 1,
0.7957622, -0.547811, 1.87002, 0.654902, 0, 1, 1,
0.8015319, 0.5317942, 1.109962, 0.6627451, 0, 1, 1,
0.8033768, -1.209413, 1.359443, 0.6666667, 0, 1, 1,
0.8053448, -0.7060733, 2.287753, 0.6745098, 0, 1, 1,
0.8088242, 0.9967216, -0.1516565, 0.6784314, 0, 1, 1,
0.8138674, -0.2175893, 1.640514, 0.6862745, 0, 1, 1,
0.815348, -0.750074, 2.405747, 0.6901961, 0, 1, 1,
0.8183342, 0.0728777, 1.090292, 0.6980392, 0, 1, 1,
0.8208539, 0.7339994, 0.8258705, 0.7058824, 0, 1, 1,
0.8209031, 0.4335216, 0.1620205, 0.7098039, 0, 1, 1,
0.8231449, -0.04125369, 0.9967908, 0.7176471, 0, 1, 1,
0.8235332, 0.3347343, 0.9467041, 0.7215686, 0, 1, 1,
0.823759, 1.072039, 0.2464977, 0.7294118, 0, 1, 1,
0.8307952, -0.4116217, 3.153236, 0.7333333, 0, 1, 1,
0.8322194, -0.2386879, 1.387773, 0.7411765, 0, 1, 1,
0.8323808, 0.4266911, -0.1130642, 0.7450981, 0, 1, 1,
0.833214, -1.247481, 4.985922, 0.7529412, 0, 1, 1,
0.8369066, -1.858983, 2.626586, 0.7568628, 0, 1, 1,
0.8379809, -1.304434, 2.036724, 0.7647059, 0, 1, 1,
0.8393063, -0.9656261, 0.5732639, 0.7686275, 0, 1, 1,
0.8452302, 0.833498, -0.2046179, 0.7764706, 0, 1, 1,
0.8457984, -0.6660503, 2.684735, 0.7803922, 0, 1, 1,
0.8511685, -0.8745783, 4.099365, 0.7882353, 0, 1, 1,
0.8579269, 0.1453175, 1.113055, 0.7921569, 0, 1, 1,
0.8584197, -1.120536, 3.374704, 0.8, 0, 1, 1,
0.8615687, 1.036611, -0.2716185, 0.8078431, 0, 1, 1,
0.8648523, 0.6876518, 0.524592, 0.8117647, 0, 1, 1,
0.8697444, 0.6121278, 0.4486702, 0.8196079, 0, 1, 1,
0.8703147, -0.5070787, 3.881472, 0.8235294, 0, 1, 1,
0.8776993, 0.9078723, 0.7400697, 0.8313726, 0, 1, 1,
0.8854794, 0.113482, 1.354501, 0.8352941, 0, 1, 1,
0.8885415, 0.5380571, 0.9184516, 0.8431373, 0, 1, 1,
0.8929041, 0.9688504, -0.6745424, 0.8470588, 0, 1, 1,
0.8951245, -0.0287122, 1.883544, 0.854902, 0, 1, 1,
0.8989589, 0.04710816, 1.90448, 0.8588235, 0, 1, 1,
0.8991923, -0.8576759, 4.39687, 0.8666667, 0, 1, 1,
0.9002843, 0.1195261, 1.366186, 0.8705882, 0, 1, 1,
0.9029164, -1.291078, 3.717795, 0.8784314, 0, 1, 1,
0.9062817, 1.073635, 0.727042, 0.8823529, 0, 1, 1,
0.9092747, -0.5839345, 1.643034, 0.8901961, 0, 1, 1,
0.9102819, -1.297649, 1.862149, 0.8941177, 0, 1, 1,
0.9151352, 0.4763818, -0.3702852, 0.9019608, 0, 1, 1,
0.9183273, 0.4138007, 1.090362, 0.9098039, 0, 1, 1,
0.9200389, 0.9070815, -0.1153052, 0.9137255, 0, 1, 1,
0.9215561, -0.3634907, 1.794679, 0.9215686, 0, 1, 1,
0.9259908, -0.1446771, 1.942431, 0.9254902, 0, 1, 1,
0.9265386, -0.5145261, 3.602235, 0.9333333, 0, 1, 1,
0.9272454, -0.4868638, 2.877906, 0.9372549, 0, 1, 1,
0.9278973, -0.4287262, 2.638874, 0.945098, 0, 1, 1,
0.9282876, 0.3745089, 0.6821501, 0.9490196, 0, 1, 1,
0.933645, 0.8141959, 1.514317, 0.9568627, 0, 1, 1,
0.9338992, 0.6106629, 1.849841, 0.9607843, 0, 1, 1,
0.9462941, -1.337788, 2.324172, 0.9686275, 0, 1, 1,
0.9477881, -1.286246, 2.07469, 0.972549, 0, 1, 1,
0.9481835, 0.8074585, 0.750079, 0.9803922, 0, 1, 1,
0.9496242, -1.429313, 2.435983, 0.9843137, 0, 1, 1,
0.9516711, -0.1064958, 2.67918, 0.9921569, 0, 1, 1,
0.9529237, -0.3911273, 1.779145, 0.9960784, 0, 1, 1,
0.9655579, 1.488092, -0.1388527, 1, 0, 0.9960784, 1,
0.9710842, 0.3959259, 2.256788, 1, 0, 0.9882353, 1,
0.9761253, 0.718861, 2.637712, 1, 0, 0.9843137, 1,
0.979126, 0.4895916, 1.058483, 1, 0, 0.9764706, 1,
0.9807466, -1.144679, 2.449568, 1, 0, 0.972549, 1,
0.9897947, -0.2939472, 2.061882, 1, 0, 0.9647059, 1,
0.9918, 0.6501448, 1.555699, 1, 0, 0.9607843, 1,
0.994015, 0.6222398, 2.572698, 1, 0, 0.9529412, 1,
0.9940285, -1.656376, 4.587005, 1, 0, 0.9490196, 1,
0.9988955, 1.35334, 0.352831, 1, 0, 0.9411765, 1,
1.001097, -0.3590593, 4.048043, 1, 0, 0.9372549, 1,
1.001473, 0.9967366, -0.6257991, 1, 0, 0.9294118, 1,
1.01617, -1.344273, 2.463705, 1, 0, 0.9254902, 1,
1.018122, -0.06954545, 1.364679, 1, 0, 0.9176471, 1,
1.024247, 0.989746, 1.511852, 1, 0, 0.9137255, 1,
1.026554, 0.175433, 1.384338, 1, 0, 0.9058824, 1,
1.028251, 0.04085813, -0.3733422, 1, 0, 0.9019608, 1,
1.02831, 1.129766, 0.5216665, 1, 0, 0.8941177, 1,
1.02848, -0.7295607, 2.558877, 1, 0, 0.8862745, 1,
1.030954, -0.2190448, 2.910293, 1, 0, 0.8823529, 1,
1.035735, 0.5965832, 2.139997, 1, 0, 0.8745098, 1,
1.035773, -1.541812, 1.912113, 1, 0, 0.8705882, 1,
1.040208, 0.6770594, 2.450855, 1, 0, 0.8627451, 1,
1.041287, -0.8946555, 2.456744, 1, 0, 0.8588235, 1,
1.042735, 0.5991927, 1.406374, 1, 0, 0.8509804, 1,
1.049357, -0.6299987, 1.390995, 1, 0, 0.8470588, 1,
1.04978, -0.4834976, 1.253578, 1, 0, 0.8392157, 1,
1.073991, -0.1199084, 0.7993264, 1, 0, 0.8352941, 1,
1.091701, -0.151805, 2.015198, 1, 0, 0.827451, 1,
1.097465, 0.2053208, 1.544245, 1, 0, 0.8235294, 1,
1.107553, -0.4703425, 1.490602, 1, 0, 0.8156863, 1,
1.112493, 0.03914531, 0.6853188, 1, 0, 0.8117647, 1,
1.114191, 1.465432, 0.6856712, 1, 0, 0.8039216, 1,
1.11442, -2.93641, 1.693254, 1, 0, 0.7960784, 1,
1.122626, -0.8098672, 2.9556, 1, 0, 0.7921569, 1,
1.136822, 0.3149444, 3.322585, 1, 0, 0.7843137, 1,
1.137086, 0.2375471, 0.5379008, 1, 0, 0.7803922, 1,
1.14247, -0.348705, 1.612104, 1, 0, 0.772549, 1,
1.142792, 2.53658, -0.2249832, 1, 0, 0.7686275, 1,
1.14528, -0.5690624, 1.373179, 1, 0, 0.7607843, 1,
1.1453, -0.005266002, 1.596723, 1, 0, 0.7568628, 1,
1.153568, -0.308335, 2.350969, 1, 0, 0.7490196, 1,
1.154029, 1.6121, 1.385491, 1, 0, 0.7450981, 1,
1.15812, -0.5497912, 0.6209875, 1, 0, 0.7372549, 1,
1.161326, -0.8179038, 2.618982, 1, 0, 0.7333333, 1,
1.161993, -0.006872686, 0.8810884, 1, 0, 0.7254902, 1,
1.166239, -0.2711999, 2.011907, 1, 0, 0.7215686, 1,
1.167215, 0.4862365, 2.124204, 1, 0, 0.7137255, 1,
1.178177, -0.2720782, 1.733231, 1, 0, 0.7098039, 1,
1.18009, 1.083809, -0.2255647, 1, 0, 0.7019608, 1,
1.180831, 0.06891479, 2.250875, 1, 0, 0.6941177, 1,
1.186983, -1.685419, 3.093533, 1, 0, 0.6901961, 1,
1.1918, 3.08974, -0.8555084, 1, 0, 0.682353, 1,
1.193097, 0.4654263, 0.1126894, 1, 0, 0.6784314, 1,
1.193944, 0.8714989, 1.521918, 1, 0, 0.6705883, 1,
1.196663, 0.5194638, 1.276715, 1, 0, 0.6666667, 1,
1.212388, 0.1458347, 0.7469795, 1, 0, 0.6588235, 1,
1.215111, 0.1853518, 3.243491, 1, 0, 0.654902, 1,
1.218066, 0.2020878, -0.2745932, 1, 0, 0.6470588, 1,
1.219502, 0.2731283, 2.483869, 1, 0, 0.6431373, 1,
1.224041, -0.4053652, 0.8835845, 1, 0, 0.6352941, 1,
1.235309, 0.7834864, 1.242491, 1, 0, 0.6313726, 1,
1.236458, -0.4427366, 2.252042, 1, 0, 0.6235294, 1,
1.240607, 1.103705, 0.6348093, 1, 0, 0.6196079, 1,
1.240857, -0.4170098, 1.702297, 1, 0, 0.6117647, 1,
1.24147, 1.554144, 1.414392, 1, 0, 0.6078432, 1,
1.247482, 1.289469, -0.0272036, 1, 0, 0.6, 1,
1.257326, 0.5203491, 1.048452, 1, 0, 0.5921569, 1,
1.272668, -1.156463, 1.07892, 1, 0, 0.5882353, 1,
1.274315, -0.4647289, 2.964336, 1, 0, 0.5803922, 1,
1.283425, -0.6732147, 0.9692379, 1, 0, 0.5764706, 1,
1.287793, -0.9362053, 1.722746, 1, 0, 0.5686275, 1,
1.292725, 0.8087856, 1.051877, 1, 0, 0.5647059, 1,
1.305283, -0.3186769, 2.609625, 1, 0, 0.5568628, 1,
1.324186, -0.4451286, 2.597934, 1, 0, 0.5529412, 1,
1.328241, 2.576503, 0.158413, 1, 0, 0.5450981, 1,
1.328573, 0.4345592, 2.13042, 1, 0, 0.5411765, 1,
1.337123, 1.416867, 0.222085, 1, 0, 0.5333334, 1,
1.339834, -0.251082, 2.556074, 1, 0, 0.5294118, 1,
1.356078, -0.02556276, 1.36568, 1, 0, 0.5215687, 1,
1.362869, -0.809567, 1.393312, 1, 0, 0.5176471, 1,
1.372648, 0.09862135, 3.6164, 1, 0, 0.509804, 1,
1.382544, -0.1562659, 3.120955, 1, 0, 0.5058824, 1,
1.392787, 0.2947181, 1.163531, 1, 0, 0.4980392, 1,
1.405829, -0.3049263, 0.78756, 1, 0, 0.4901961, 1,
1.408915, -1.207044, 1.909652, 1, 0, 0.4862745, 1,
1.415719, 0.7240064, -0.7009569, 1, 0, 0.4784314, 1,
1.419171, -0.6334279, 1.977614, 1, 0, 0.4745098, 1,
1.422984, 0.4799864, 1.538467, 1, 0, 0.4666667, 1,
1.425273, -1.49279, 3.773827, 1, 0, 0.4627451, 1,
1.447254, -0.9841689, 1.89029, 1, 0, 0.454902, 1,
1.453745, 0.3969471, 2.039161, 1, 0, 0.4509804, 1,
1.460956, 0.01919713, 1.230079, 1, 0, 0.4431373, 1,
1.47357, -0.2739936, 1.398887, 1, 0, 0.4392157, 1,
1.48016, 1.767277, -0.1304994, 1, 0, 0.4313726, 1,
1.484262, 1.129959, 0.05186994, 1, 0, 0.427451, 1,
1.491659, 0.6469819, 2.266171, 1, 0, 0.4196078, 1,
1.513704, -0.02526367, 2.165107, 1, 0, 0.4156863, 1,
1.517143, -0.0001951803, 2.306674, 1, 0, 0.4078431, 1,
1.518747, -1.037823, 1.423287, 1, 0, 0.4039216, 1,
1.521808, 1.790499, -0.6397136, 1, 0, 0.3960784, 1,
1.523103, 0.8795633, 1.884672, 1, 0, 0.3882353, 1,
1.523343, 0.193765, -0.02361422, 1, 0, 0.3843137, 1,
1.524858, -0.4244473, 1.447191, 1, 0, 0.3764706, 1,
1.525483, -1.025946, 1.786085, 1, 0, 0.372549, 1,
1.52888, -0.3534684, 2.085241, 1, 0, 0.3647059, 1,
1.538419, -0.4400082, 3.254748, 1, 0, 0.3607843, 1,
1.539248, 0.9606479, -0.332927, 1, 0, 0.3529412, 1,
1.539676, -0.239878, 1.515314, 1, 0, 0.3490196, 1,
1.544939, -0.01994705, 1.213429, 1, 0, 0.3411765, 1,
1.550584, -0.2855414, -1.032941, 1, 0, 0.3372549, 1,
1.551964, -0.6322512, 2.614554, 1, 0, 0.3294118, 1,
1.558481, 1.091049, 0.0603134, 1, 0, 0.3254902, 1,
1.573401, -0.05381717, 3.189554, 1, 0, 0.3176471, 1,
1.586969, -0.08304326, 3.338593, 1, 0, 0.3137255, 1,
1.589107, -0.8895862, 0.8020946, 1, 0, 0.3058824, 1,
1.594885, 0.5257506, 0.8556709, 1, 0, 0.2980392, 1,
1.61369, 0.975616, 0.351478, 1, 0, 0.2941177, 1,
1.64122, -1.546336, 2.8626, 1, 0, 0.2862745, 1,
1.642981, -2.346462, 4.520209, 1, 0, 0.282353, 1,
1.653316, 0.4048452, 0.7940127, 1, 0, 0.2745098, 1,
1.680847, -0.02629376, 0.6755239, 1, 0, 0.2705882, 1,
1.688748, -0.02502985, 1.40685, 1, 0, 0.2627451, 1,
1.692099, -0.5750796, 2.330733, 1, 0, 0.2588235, 1,
1.708563, 2.095686, 0.7939803, 1, 0, 0.2509804, 1,
1.725934, 0.6747747, 0.9066827, 1, 0, 0.2470588, 1,
1.759897, -1.806558, 2.257468, 1, 0, 0.2392157, 1,
1.764105, 1.172235, 0.349661, 1, 0, 0.2352941, 1,
1.773418, -1.306536, -0.06651992, 1, 0, 0.227451, 1,
1.784268, 0.4228982, 3.072423, 1, 0, 0.2235294, 1,
1.811444, 0.799479, 1.070299, 1, 0, 0.2156863, 1,
1.841648, -0.9818307, 1.248037, 1, 0, 0.2117647, 1,
1.848144, 0.7322723, 0.1312776, 1, 0, 0.2039216, 1,
1.850322, 1.088884, -0.3058248, 1, 0, 0.1960784, 1,
1.870846, -0.3185009, 0.02065351, 1, 0, 0.1921569, 1,
1.899538, 1.257148, 0.8224115, 1, 0, 0.1843137, 1,
1.960047, 1.302209, 3.196952, 1, 0, 0.1803922, 1,
1.965963, -0.7796979, 2.935667, 1, 0, 0.172549, 1,
1.987306, -1.374297, 1.132356, 1, 0, 0.1686275, 1,
2.016291, -1.238176, 2.694839, 1, 0, 0.1607843, 1,
2.048748, -0.3465797, 2.830897, 1, 0, 0.1568628, 1,
2.051463, -0.7222893, 1.816912, 1, 0, 0.1490196, 1,
2.061164, -1.547091, 1.822248, 1, 0, 0.145098, 1,
2.08179, 1.735498, 1.495728, 1, 0, 0.1372549, 1,
2.137942, -1.060766, 3.775184, 1, 0, 0.1333333, 1,
2.150261, 1.305731, 0.6810375, 1, 0, 0.1254902, 1,
2.191223, 0.3304795, 1.517187, 1, 0, 0.1215686, 1,
2.192388, -1.680654, 3.081192, 1, 0, 0.1137255, 1,
2.193769, -0.9610102, 1.451919, 1, 0, 0.1098039, 1,
2.209012, 0.4519568, 1.710929, 1, 0, 0.1019608, 1,
2.224272, -0.2398206, 2.234936, 1, 0, 0.09411765, 1,
2.263161, 0.8400128, 2.650652, 1, 0, 0.09019608, 1,
2.333324, -1.324138, 0.1434359, 1, 0, 0.08235294, 1,
2.422767, -1.3363, 0.9696621, 1, 0, 0.07843138, 1,
2.496541, -0.9323168, 2.543431, 1, 0, 0.07058824, 1,
2.563941, 1.552432, 0.910499, 1, 0, 0.06666667, 1,
2.617169, -0.3716505, 2.537727, 1, 0, 0.05882353, 1,
2.773889, -0.7916546, 2.450264, 1, 0, 0.05490196, 1,
2.814617, 0.01150198, 2.286314, 1, 0, 0.04705882, 1,
2.8355, -0.05319008, 1.134605, 1, 0, 0.04313726, 1,
2.837103, 0.0462266, 2.662173, 1, 0, 0.03529412, 1,
2.87672, 1.026316, 1.753778, 1, 0, 0.03137255, 1,
2.902874, 0.5504199, 0.5263509, 1, 0, 0.02352941, 1,
3.253495, -0.5568914, 2.522355, 1, 0, 0.01960784, 1,
3.283458, 0.5584318, -1.010637, 1, 0, 0.01176471, 1,
3.43516, 1.035806, 0.2450097, 1, 0, 0.007843138, 1
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
0.2462811, -4.108699, -6.409508, 0, -0.5, 0.5, 0.5,
0.2462811, -4.108699, -6.409508, 1, -0.5, 0.5, 0.5,
0.2462811, -4.108699, -6.409508, 1, 1.5, 0.5, 0.5,
0.2462811, -4.108699, -6.409508, 0, 1.5, 0.5, 0.5
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
-4.023627, 0.01216865, -6.409508, 0, -0.5, 0.5, 0.5,
-4.023627, 0.01216865, -6.409508, 1, -0.5, 0.5, 0.5,
-4.023627, 0.01216865, -6.409508, 1, 1.5, 0.5, 0.5,
-4.023627, 0.01216865, -6.409508, 0, 1.5, 0.5, 0.5
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
-4.023627, -4.108699, 0.2717683, 0, -0.5, 0.5, 0.5,
-4.023627, -4.108699, 0.2717683, 1, -0.5, 0.5, 0.5,
-4.023627, -4.108699, 0.2717683, 1, 1.5, 0.5, 0.5,
-4.023627, -4.108699, 0.2717683, 0, 1.5, 0.5, 0.5
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
-2, -3.15773, -4.867675,
3, -3.15773, -4.867675,
-2, -3.15773, -4.867675,
-2, -3.316225, -5.124648,
-1, -3.15773, -4.867675,
-1, -3.316225, -5.124648,
0, -3.15773, -4.867675,
0, -3.316225, -5.124648,
1, -3.15773, -4.867675,
1, -3.316225, -5.124648,
2, -3.15773, -4.867675,
2, -3.316225, -5.124648,
3, -3.15773, -4.867675,
3, -3.316225, -5.124648
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
-2, -3.633214, -5.638592, 0, -0.5, 0.5, 0.5,
-2, -3.633214, -5.638592, 1, -0.5, 0.5, 0.5,
-2, -3.633214, -5.638592, 1, 1.5, 0.5, 0.5,
-2, -3.633214, -5.638592, 0, 1.5, 0.5, 0.5,
-1, -3.633214, -5.638592, 0, -0.5, 0.5, 0.5,
-1, -3.633214, -5.638592, 1, -0.5, 0.5, 0.5,
-1, -3.633214, -5.638592, 1, 1.5, 0.5, 0.5,
-1, -3.633214, -5.638592, 0, 1.5, 0.5, 0.5,
0, -3.633214, -5.638592, 0, -0.5, 0.5, 0.5,
0, -3.633214, -5.638592, 1, -0.5, 0.5, 0.5,
0, -3.633214, -5.638592, 1, 1.5, 0.5, 0.5,
0, -3.633214, -5.638592, 0, 1.5, 0.5, 0.5,
1, -3.633214, -5.638592, 0, -0.5, 0.5, 0.5,
1, -3.633214, -5.638592, 1, -0.5, 0.5, 0.5,
1, -3.633214, -5.638592, 1, 1.5, 0.5, 0.5,
1, -3.633214, -5.638592, 0, 1.5, 0.5, 0.5,
2, -3.633214, -5.638592, 0, -0.5, 0.5, 0.5,
2, -3.633214, -5.638592, 1, -0.5, 0.5, 0.5,
2, -3.633214, -5.638592, 1, 1.5, 0.5, 0.5,
2, -3.633214, -5.638592, 0, 1.5, 0.5, 0.5,
3, -3.633214, -5.638592, 0, -0.5, 0.5, 0.5,
3, -3.633214, -5.638592, 1, -0.5, 0.5, 0.5,
3, -3.633214, -5.638592, 1, 1.5, 0.5, 0.5,
3, -3.633214, -5.638592, 0, 1.5, 0.5, 0.5
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
-3.038264, -3, -4.867675,
-3.038264, 3, -4.867675,
-3.038264, -3, -4.867675,
-3.202491, -3, -5.124648,
-3.038264, -2, -4.867675,
-3.202491, -2, -5.124648,
-3.038264, -1, -4.867675,
-3.202491, -1, -5.124648,
-3.038264, 0, -4.867675,
-3.202491, 0, -5.124648,
-3.038264, 1, -4.867675,
-3.202491, 1, -5.124648,
-3.038264, 2, -4.867675,
-3.202491, 2, -5.124648,
-3.038264, 3, -4.867675,
-3.202491, 3, -5.124648
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
-3.530946, -3, -5.638592, 0, -0.5, 0.5, 0.5,
-3.530946, -3, -5.638592, 1, -0.5, 0.5, 0.5,
-3.530946, -3, -5.638592, 1, 1.5, 0.5, 0.5,
-3.530946, -3, -5.638592, 0, 1.5, 0.5, 0.5,
-3.530946, -2, -5.638592, 0, -0.5, 0.5, 0.5,
-3.530946, -2, -5.638592, 1, -0.5, 0.5, 0.5,
-3.530946, -2, -5.638592, 1, 1.5, 0.5, 0.5,
-3.530946, -2, -5.638592, 0, 1.5, 0.5, 0.5,
-3.530946, -1, -5.638592, 0, -0.5, 0.5, 0.5,
-3.530946, -1, -5.638592, 1, -0.5, 0.5, 0.5,
-3.530946, -1, -5.638592, 1, 1.5, 0.5, 0.5,
-3.530946, -1, -5.638592, 0, 1.5, 0.5, 0.5,
-3.530946, 0, -5.638592, 0, -0.5, 0.5, 0.5,
-3.530946, 0, -5.638592, 1, -0.5, 0.5, 0.5,
-3.530946, 0, -5.638592, 1, 1.5, 0.5, 0.5,
-3.530946, 0, -5.638592, 0, 1.5, 0.5, 0.5,
-3.530946, 1, -5.638592, 0, -0.5, 0.5, 0.5,
-3.530946, 1, -5.638592, 1, -0.5, 0.5, 0.5,
-3.530946, 1, -5.638592, 1, 1.5, 0.5, 0.5,
-3.530946, 1, -5.638592, 0, 1.5, 0.5, 0.5,
-3.530946, 2, -5.638592, 0, -0.5, 0.5, 0.5,
-3.530946, 2, -5.638592, 1, -0.5, 0.5, 0.5,
-3.530946, 2, -5.638592, 1, 1.5, 0.5, 0.5,
-3.530946, 2, -5.638592, 0, 1.5, 0.5, 0.5,
-3.530946, 3, -5.638592, 0, -0.5, 0.5, 0.5,
-3.530946, 3, -5.638592, 1, -0.5, 0.5, 0.5,
-3.530946, 3, -5.638592, 1, 1.5, 0.5, 0.5,
-3.530946, 3, -5.638592, 0, 1.5, 0.5, 0.5
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
-3.038264, -3.15773, -4,
-3.038264, -3.15773, 4,
-3.038264, -3.15773, -4,
-3.202491, -3.316225, -4,
-3.038264, -3.15773, -2,
-3.202491, -3.316225, -2,
-3.038264, -3.15773, 0,
-3.202491, -3.316225, 0,
-3.038264, -3.15773, 2,
-3.202491, -3.316225, 2,
-3.038264, -3.15773, 4,
-3.202491, -3.316225, 4
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
-3.530946, -3.633214, -4, 0, -0.5, 0.5, 0.5,
-3.530946, -3.633214, -4, 1, -0.5, 0.5, 0.5,
-3.530946, -3.633214, -4, 1, 1.5, 0.5, 0.5,
-3.530946, -3.633214, -4, 0, 1.5, 0.5, 0.5,
-3.530946, -3.633214, -2, 0, -0.5, 0.5, 0.5,
-3.530946, -3.633214, -2, 1, -0.5, 0.5, 0.5,
-3.530946, -3.633214, -2, 1, 1.5, 0.5, 0.5,
-3.530946, -3.633214, -2, 0, 1.5, 0.5, 0.5,
-3.530946, -3.633214, 0, 0, -0.5, 0.5, 0.5,
-3.530946, -3.633214, 0, 1, -0.5, 0.5, 0.5,
-3.530946, -3.633214, 0, 1, 1.5, 0.5, 0.5,
-3.530946, -3.633214, 0, 0, 1.5, 0.5, 0.5,
-3.530946, -3.633214, 2, 0, -0.5, 0.5, 0.5,
-3.530946, -3.633214, 2, 1, -0.5, 0.5, 0.5,
-3.530946, -3.633214, 2, 1, 1.5, 0.5, 0.5,
-3.530946, -3.633214, 2, 0, 1.5, 0.5, 0.5,
-3.530946, -3.633214, 4, 0, -0.5, 0.5, 0.5,
-3.530946, -3.633214, 4, 1, -0.5, 0.5, 0.5,
-3.530946, -3.633214, 4, 1, 1.5, 0.5, 0.5,
-3.530946, -3.633214, 4, 0, 1.5, 0.5, 0.5
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
-3.038264, -3.15773, -4.867675,
-3.038264, 3.182067, -4.867675,
-3.038264, -3.15773, 5.411212,
-3.038264, 3.182067, 5.411212,
-3.038264, -3.15773, -4.867675,
-3.038264, -3.15773, 5.411212,
-3.038264, 3.182067, -4.867675,
-3.038264, 3.182067, 5.411212,
-3.038264, -3.15773, -4.867675,
3.530826, -3.15773, -4.867675,
-3.038264, -3.15773, 5.411212,
3.530826, -3.15773, 5.411212,
-3.038264, 3.182067, -4.867675,
3.530826, 3.182067, -4.867675,
-3.038264, 3.182067, 5.411212,
3.530826, 3.182067, 5.411212,
3.530826, -3.15773, -4.867675,
3.530826, 3.182067, -4.867675,
3.530826, -3.15773, 5.411212,
3.530826, 3.182067, 5.411212,
3.530826, -3.15773, -4.867675,
3.530826, -3.15773, 5.411212,
3.530826, 3.182067, -4.867675,
3.530826, 3.182067, 5.411212
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
var radius = 7.341048;
var distance = 32.66115;
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
mvMatrix.translate( -0.2462811, -0.01216865, -0.2717683 );
mvMatrix.scale( 1.208278, 1.251978, 0.772193 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.66115);
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
magnesium_arsenate_m<-read.table("magnesium_arsenate_m.xyz")
```

```
## Error in read.table("magnesium_arsenate_m.xyz"): no lines available in input
```

```r
x<-magnesium_arsenate_m$V2
```

```
## Error in eval(expr, envir, enclos): object 'magnesium_arsenate_m' not found
```

```r
y<-magnesium_arsenate_m$V3
```

```
## Error in eval(expr, envir, enclos): object 'magnesium_arsenate_m' not found
```

```r
z<-magnesium_arsenate_m$V4
```

```
## Error in eval(expr, envir, enclos): object 'magnesium_arsenate_m' not found
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
-2.942597, 1.906318, -2.545652, 0, 0, 1, 1, 1,
-2.831327, 2.14869, -0.8135079, 1, 0, 0, 1, 1,
-2.71903, -0.005273554, 0.5285731, 1, 0, 0, 1, 1,
-2.711092, -1.658555, -4.000857, 1, 0, 0, 1, 1,
-2.427009, -2.185582, -1.713982, 1, 0, 0, 1, 1,
-2.40048, -1.902871, -3.254659, 1, 0, 0, 1, 1,
-2.356132, -0.2559238, -3.154079, 0, 0, 0, 1, 1,
-2.346024, -0.09195678, -0.816272, 0, 0, 0, 1, 1,
-2.310918, -1.612089, -2.013565, 0, 0, 0, 1, 1,
-2.296791, 1.197474, 0.02340309, 0, 0, 0, 1, 1,
-2.248067, 1.175783, -2.125298, 0, 0, 0, 1, 1,
-2.138629, 0.9349798, -0.2465844, 0, 0, 0, 1, 1,
-2.137426, 1.188858, -0.9071047, 0, 0, 0, 1, 1,
-2.131377, 1.117345, 0.7088751, 1, 1, 1, 1, 1,
-2.131213, 0.494465, -4.372101, 1, 1, 1, 1, 1,
-2.111468, 0.3390432, -1.466573, 1, 1, 1, 1, 1,
-2.076004, -0.1651208, -2.079854, 1, 1, 1, 1, 1,
-2.070274, 1.047673, -0.0829446, 1, 1, 1, 1, 1,
-2.041079, -0.1462315, -1.282391, 1, 1, 1, 1, 1,
-1.976714, 1.091365, -0.8805082, 1, 1, 1, 1, 1,
-1.957467, -0.2608452, -2.923122, 1, 1, 1, 1, 1,
-1.905039, 1.567957, -2.07343, 1, 1, 1, 1, 1,
-1.902158, -0.3449323, -1.724414, 1, 1, 1, 1, 1,
-1.852347, 0.3665122, -0.837365, 1, 1, 1, 1, 1,
-1.849976, 2.406482, -0.001793428, 1, 1, 1, 1, 1,
-1.843905, 0.2107527, -2.459952, 1, 1, 1, 1, 1,
-1.833999, 0.1029038, -3.400951, 1, 1, 1, 1, 1,
-1.825565, 1.14702, -0.8501008, 1, 1, 1, 1, 1,
-1.812876, -0.9720005, 0.2491746, 0, 0, 1, 1, 1,
-1.792571, 0.7281326, 0.4248533, 1, 0, 0, 1, 1,
-1.787936, -1.286495, -2.849681, 1, 0, 0, 1, 1,
-1.784566, 0.1578604, -2.828683, 1, 0, 0, 1, 1,
-1.773256, -0.001529351, -1.087204, 1, 0, 0, 1, 1,
-1.766201, 0.4416688, -0.7063752, 1, 0, 0, 1, 1,
-1.752308, 1.799087, 0.3499803, 0, 0, 0, 1, 1,
-1.748044, -0.1127197, -1.21414, 0, 0, 0, 1, 1,
-1.729907, -0.4580087, -1.424587, 0, 0, 0, 1, 1,
-1.726403, 0.5620994, -1.31948, 0, 0, 0, 1, 1,
-1.725686, 0.5292273, -0.8560582, 0, 0, 0, 1, 1,
-1.694556, 1.124727, -0.8304281, 0, 0, 0, 1, 1,
-1.681478, -0.694976, -2.085798, 0, 0, 0, 1, 1,
-1.679644, -1.061121, -2.973588, 1, 1, 1, 1, 1,
-1.664911, -0.3022283, -3.042242, 1, 1, 1, 1, 1,
-1.65379, -1.883142, -2.955292, 1, 1, 1, 1, 1,
-1.651002, 0.3089643, -0.4792528, 1, 1, 1, 1, 1,
-1.623038, -0.2006863, -0.6505935, 1, 1, 1, 1, 1,
-1.605158, -1.571511, -1.528683, 1, 1, 1, 1, 1,
-1.601564, 0.663364, -1.810814, 1, 1, 1, 1, 1,
-1.594916, 0.37386, -0.2617927, 1, 1, 1, 1, 1,
-1.593667, 0.5158449, -1.7485, 1, 1, 1, 1, 1,
-1.57843, 0.02654721, -1.533603, 1, 1, 1, 1, 1,
-1.572567, -1.73872, -2.827333, 1, 1, 1, 1, 1,
-1.564826, -1.823699, -2.753305, 1, 1, 1, 1, 1,
-1.556117, -0.3975546, -1.662945, 1, 1, 1, 1, 1,
-1.551904, 0.001766592, -2.650997, 1, 1, 1, 1, 1,
-1.537935, -0.8807468, -2.317862, 1, 1, 1, 1, 1,
-1.532552, -2.087528, -2.213623, 0, 0, 1, 1, 1,
-1.527384, -1.10638, -2.784657, 1, 0, 0, 1, 1,
-1.520166, -1.323959, -1.483676, 1, 0, 0, 1, 1,
-1.504492, -0.3961252, -2.847412, 1, 0, 0, 1, 1,
-1.493593, -0.1326907, -2.339195, 1, 0, 0, 1, 1,
-1.491826, 0.1402635, -3.576627, 1, 0, 0, 1, 1,
-1.489179, -0.4286707, -2.201247, 0, 0, 0, 1, 1,
-1.482888, -1.122101, -1.230459, 0, 0, 0, 1, 1,
-1.482242, 1.564955, -1.580144, 0, 0, 0, 1, 1,
-1.475069, -1.028418, -1.426398, 0, 0, 0, 1, 1,
-1.472855, -0.6984445, -1.772221, 0, 0, 0, 1, 1,
-1.471562, -1.217427, -0.8070363, 0, 0, 0, 1, 1,
-1.463608, -1.361796, -2.859512, 0, 0, 0, 1, 1,
-1.463347, -0.5911406, -2.511528, 1, 1, 1, 1, 1,
-1.462451, 0.3098326, -2.159948, 1, 1, 1, 1, 1,
-1.457417, -0.04722939, -2.371162, 1, 1, 1, 1, 1,
-1.447056, 0.9701312, -1.061309, 1, 1, 1, 1, 1,
-1.439563, -0.08136737, -0.4655949, 1, 1, 1, 1, 1,
-1.430094, 0.1264612, -1.922884, 1, 1, 1, 1, 1,
-1.428504, 1.007046, -2.211177, 1, 1, 1, 1, 1,
-1.417181, -0.1009431, -1.060543, 1, 1, 1, 1, 1,
-1.410085, 0.7763171, -2.117926, 1, 1, 1, 1, 1,
-1.406399, -0.9025263, -1.848144, 1, 1, 1, 1, 1,
-1.406223, -1.238919, -2.386552, 1, 1, 1, 1, 1,
-1.394854, 0.8756024, -0.8359465, 1, 1, 1, 1, 1,
-1.38911, -0.5383185, -1.784609, 1, 1, 1, 1, 1,
-1.385076, 0.1926633, -2.574677, 1, 1, 1, 1, 1,
-1.377624, -0.263521, -0.9008849, 1, 1, 1, 1, 1,
-1.371633, 0.2228647, 1.06466, 0, 0, 1, 1, 1,
-1.362788, -1.629944, -3.111369, 1, 0, 0, 1, 1,
-1.359157, -0.07961353, -1.343803, 1, 0, 0, 1, 1,
-1.356074, -0.5831104, -0.8870037, 1, 0, 0, 1, 1,
-1.353808, -1.731269, -0.6786537, 1, 0, 0, 1, 1,
-1.351514, 1.34812, -1.773713, 1, 0, 0, 1, 1,
-1.344026, 0.5415344, -0.9390359, 0, 0, 0, 1, 1,
-1.342734, -0.1245842, -2.223429, 0, 0, 0, 1, 1,
-1.308902, -0.4511328, -3.484822, 0, 0, 0, 1, 1,
-1.293624, -0.2146098, -1.573841, 0, 0, 0, 1, 1,
-1.292679, -1.24373, -3.491521, 0, 0, 0, 1, 1,
-1.270255, 1.368012, -1.346294, 0, 0, 0, 1, 1,
-1.265494, -1.034297, -1.663078, 0, 0, 0, 1, 1,
-1.262432, 0.1020518, -0.2532195, 1, 1, 1, 1, 1,
-1.261379, -0.1623112, 0.131569, 1, 1, 1, 1, 1,
-1.260899, -1.331616, -2.751421, 1, 1, 1, 1, 1,
-1.255265, -1.066737, -0.9668503, 1, 1, 1, 1, 1,
-1.251958, 1.260639, -1.486013, 1, 1, 1, 1, 1,
-1.250564, -1.058604, -1.847616, 1, 1, 1, 1, 1,
-1.246742, 0.3740469, -0.2659827, 1, 1, 1, 1, 1,
-1.243979, 0.8763438, -0.6092388, 1, 1, 1, 1, 1,
-1.237791, -0.3851201, -2.28118, 1, 1, 1, 1, 1,
-1.209096, -0.03834986, -0.9324893, 1, 1, 1, 1, 1,
-1.208951, -0.08886405, -1.682493, 1, 1, 1, 1, 1,
-1.207271, -1.150511, -2.33605, 1, 1, 1, 1, 1,
-1.205384, -1.134726, 0.1501607, 1, 1, 1, 1, 1,
-1.205146, -0.6313456, -3.578376, 1, 1, 1, 1, 1,
-1.200514, 0.8713948, -0.37487, 1, 1, 1, 1, 1,
-1.190046, -0.2860562, -1.905462, 0, 0, 1, 1, 1,
-1.188526, 1.715005, 0.02998301, 1, 0, 0, 1, 1,
-1.179662, 0.6529741, -0.1532281, 1, 0, 0, 1, 1,
-1.179572, -0.9914052, -4.105728, 1, 0, 0, 1, 1,
-1.175162, 0.06743243, 0.2219258, 1, 0, 0, 1, 1,
-1.173101, 0.4596552, -2.442501, 1, 0, 0, 1, 1,
-1.169645, 0.5278434, -3.000813, 0, 0, 0, 1, 1,
-1.169009, -0.006710897, -0.9268011, 0, 0, 0, 1, 1,
-1.167348, 0.6789191, -1.714713, 0, 0, 0, 1, 1,
-1.166864, -0.7650377, -0.4535621, 0, 0, 0, 1, 1,
-1.164575, -0.1218755, -1.235254, 0, 0, 0, 1, 1,
-1.162908, 0.7895168, -0.2128141, 0, 0, 0, 1, 1,
-1.149204, 0.4475245, -1.750712, 0, 0, 0, 1, 1,
-1.147854, 0.5651278, -1.548182, 1, 1, 1, 1, 1,
-1.147291, -0.1532886, -1.415746, 1, 1, 1, 1, 1,
-1.145754, -2.136599, -3.773664, 1, 1, 1, 1, 1,
-1.142488, 0.4734034, -1.712427, 1, 1, 1, 1, 1,
-1.135782, -0.3920428, -2.502892, 1, 1, 1, 1, 1,
-1.129153, 1.22091, -2.324445, 1, 1, 1, 1, 1,
-1.124592, -0.577447, -2.287388, 1, 1, 1, 1, 1,
-1.123132, 1.310319, 0.7204086, 1, 1, 1, 1, 1,
-1.118757, -0.04194015, -1.252122, 1, 1, 1, 1, 1,
-1.113733, 0.4540623, -1.367319, 1, 1, 1, 1, 1,
-1.113667, 0.6730303, -1.394717, 1, 1, 1, 1, 1,
-1.097527, -0.4914529, -2.225905, 1, 1, 1, 1, 1,
-1.094393, -0.3252358, -3.649376, 1, 1, 1, 1, 1,
-1.092421, 0.218704, -2.203959, 1, 1, 1, 1, 1,
-1.079727, -0.1891073, -2.680414, 1, 1, 1, 1, 1,
-1.052291, 0.7861284, -1.740058, 0, 0, 1, 1, 1,
-1.047253, -0.1596523, -1.292422, 1, 0, 0, 1, 1,
-1.037481, -0.5532485, -1.961383, 1, 0, 0, 1, 1,
-1.036373, 0.6672253, -1.864485, 1, 0, 0, 1, 1,
-1.032447, 0.2274843, 0.9473515, 1, 0, 0, 1, 1,
-1.031478, -1.246617, -2.744262, 1, 0, 0, 1, 1,
-1.030915, -1.665232, -2.755751, 0, 0, 0, 1, 1,
-1.029158, -0.323493, -2.664035, 0, 0, 0, 1, 1,
-1.028245, -0.2955433, -1.111213, 0, 0, 0, 1, 1,
-1.025473, 0.6509461, 0.5193531, 0, 0, 0, 1, 1,
-1.023602, -0.4899929, -1.130926, 0, 0, 0, 1, 1,
-1.019862, 1.541909, -1.736005, 0, 0, 0, 1, 1,
-1.016339, -1.60147, -2.41873, 0, 0, 0, 1, 1,
-1.007797, -1.322603, -4.158868, 1, 1, 1, 1, 1,
-1.007574, -0.891821, -2.390395, 1, 1, 1, 1, 1,
-1.003373, 0.1468344, -0.3213582, 1, 1, 1, 1, 1,
-0.9990613, 0.4746751, -0.780036, 1, 1, 1, 1, 1,
-0.9979475, -1.682836, -2.059457, 1, 1, 1, 1, 1,
-0.9942206, 0.5725884, -0.9068135, 1, 1, 1, 1, 1,
-0.9914204, -0.2217278, -2.707263, 1, 1, 1, 1, 1,
-0.9903239, 0.7377838, -1.227007, 1, 1, 1, 1, 1,
-0.9856509, -1.294343, -3.418815, 1, 1, 1, 1, 1,
-0.9795997, -0.871442, -3.362225, 1, 1, 1, 1, 1,
-0.9785661, -0.1579661, -1.34982, 1, 1, 1, 1, 1,
-0.9730859, 0.8647733, -0.1721022, 1, 1, 1, 1, 1,
-0.9724218, -0.5850802, -0.592155, 1, 1, 1, 1, 1,
-0.9688974, 2.092535, -1.491934, 1, 1, 1, 1, 1,
-0.9625086, -0.8938205, -1.916441, 1, 1, 1, 1, 1,
-0.9603724, -0.6439631, -3.708934, 0, 0, 1, 1, 1,
-0.9480875, 1.888937, -2.024359, 1, 0, 0, 1, 1,
-0.9361315, 0.2462262, -1.789257, 1, 0, 0, 1, 1,
-0.9327198, -0.739122, -1.820978, 1, 0, 0, 1, 1,
-0.9290622, -0.3561533, -1.698093, 1, 0, 0, 1, 1,
-0.9283259, -0.1682878, -1.252865, 1, 0, 0, 1, 1,
-0.9216772, 0.3865023, -1.2784, 0, 0, 0, 1, 1,
-0.9123998, -0.9734426, -3.278176, 0, 0, 0, 1, 1,
-0.9099711, -0.7663637, -2.238725, 0, 0, 0, 1, 1,
-0.9090782, 0.3305327, -0.2925148, 0, 0, 0, 1, 1,
-0.9081294, 0.6702618, -1.280891, 0, 0, 0, 1, 1,
-0.9071437, -0.2945967, -3.07764, 0, 0, 0, 1, 1,
-0.9009652, 0.2983542, -0.7366046, 0, 0, 0, 1, 1,
-0.8994136, -1.370327, -3.141006, 1, 1, 1, 1, 1,
-0.89929, 0.2011179, 0.5894523, 1, 1, 1, 1, 1,
-0.8958333, -0.5350193, -2.234442, 1, 1, 1, 1, 1,
-0.8893129, 1.538184, -2.28141, 1, 1, 1, 1, 1,
-0.8875871, 1.156564, -0.945232, 1, 1, 1, 1, 1,
-0.8851084, -0.657212, -2.085671, 1, 1, 1, 1, 1,
-0.8788918, 1.626628, -0.6934437, 1, 1, 1, 1, 1,
-0.8743128, 1.943878, -1.361986, 1, 1, 1, 1, 1,
-0.8726925, -0.09788099, -0.6626984, 1, 1, 1, 1, 1,
-0.8724937, -1.396946, -1.511112, 1, 1, 1, 1, 1,
-0.8713872, 1.293243, 1.463462, 1, 1, 1, 1, 1,
-0.8654097, 0.8874813, -0.5249107, 1, 1, 1, 1, 1,
-0.862427, -0.7431228, -2.409656, 1, 1, 1, 1, 1,
-0.8611323, 1.429801, -0.3062958, 1, 1, 1, 1, 1,
-0.8587007, 0.5003883, 0.3129565, 1, 1, 1, 1, 1,
-0.8572168, 1.319186, -0.4485818, 0, 0, 1, 1, 1,
-0.8570808, 0.2216064, -2.908367, 1, 0, 0, 1, 1,
-0.8554882, -0.2432441, -0.381768, 1, 0, 0, 1, 1,
-0.846526, 0.003904452, -1.161189, 1, 0, 0, 1, 1,
-0.8446681, -0.9151441, -3.066636, 1, 0, 0, 1, 1,
-0.8365701, 0.2224828, 0.4780026, 1, 0, 0, 1, 1,
-0.8340961, 1.491274, 0.3327676, 0, 0, 0, 1, 1,
-0.8263276, 0.1425404, -1.914786, 0, 0, 0, 1, 1,
-0.8204244, -0.4171332, -2.314147, 0, 0, 0, 1, 1,
-0.82, -0.90432, -2.857128, 0, 0, 0, 1, 1,
-0.8194866, -1.04664, -2.499543, 0, 0, 0, 1, 1,
-0.810426, -0.735027, 0.5202336, 0, 0, 0, 1, 1,
-0.8059604, -2.825869, -2.947098, 0, 0, 0, 1, 1,
-0.8025193, -0.08092453, -1.032426, 1, 1, 1, 1, 1,
-0.7972355, -0.8488446, -1.124699, 1, 1, 1, 1, 1,
-0.794647, 0.4011425, -0.8275919, 1, 1, 1, 1, 1,
-0.7930631, 0.1795237, -0.813765, 1, 1, 1, 1, 1,
-0.7879717, 0.7963846, -0.6118672, 1, 1, 1, 1, 1,
-0.7879332, 0.558721, -3.207957, 1, 1, 1, 1, 1,
-0.77544, -0.1425118, -2.094439, 1, 1, 1, 1, 1,
-0.7726519, 0.3471383, -1.757965, 1, 1, 1, 1, 1,
-0.7718602, 0.5976345, -2.222788, 1, 1, 1, 1, 1,
-0.7714683, -0.5216804, -2.878852, 1, 1, 1, 1, 1,
-0.7691287, 0.231702, -2.434513, 1, 1, 1, 1, 1,
-0.7528718, 0.4202545, -0.5073832, 1, 1, 1, 1, 1,
-0.7517313, -1.079041, -1.839459, 1, 1, 1, 1, 1,
-0.7475894, -1.301144, -4.605715, 1, 1, 1, 1, 1,
-0.7468899, 0.150907, -1.64315, 1, 1, 1, 1, 1,
-0.7464702, -1.050699, -1.612898, 0, 0, 1, 1, 1,
-0.7461843, 1.230213, -1.101156, 1, 0, 0, 1, 1,
-0.7374806, -0.300723, -3.01877, 1, 0, 0, 1, 1,
-0.7359951, -1.44095, -4.265023, 1, 0, 0, 1, 1,
-0.733255, 0.01336873, -0.7852729, 1, 0, 0, 1, 1,
-0.7301964, -0.01654091, 0.05201958, 1, 0, 0, 1, 1,
-0.7277622, 0.4220961, -0.3494999, 0, 0, 0, 1, 1,
-0.7102395, -0.9529667, -1.99488, 0, 0, 0, 1, 1,
-0.7080531, 1.65757, 0.7422364, 0, 0, 0, 1, 1,
-0.7064145, -0.9989227, -2.325999, 0, 0, 0, 1, 1,
-0.7051715, -1.787407, -2.503943, 0, 0, 0, 1, 1,
-0.7037818, 2.956256, 0.1529366, 0, 0, 0, 1, 1,
-0.7010734, 0.4030924, -1.307691, 0, 0, 0, 1, 1,
-0.692978, -1.725088, -2.886487, 1, 1, 1, 1, 1,
-0.6858045, -0.3713876, -2.494181, 1, 1, 1, 1, 1,
-0.6838059, -0.1427701, -2.374662, 1, 1, 1, 1, 1,
-0.6810066, -1.12697, -3.883104, 1, 1, 1, 1, 1,
-0.6808006, 0.990097, -0.9257354, 1, 1, 1, 1, 1,
-0.67933, -1.095378, -1.537592, 1, 1, 1, 1, 1,
-0.6775927, 0.5004788, -2.011567, 1, 1, 1, 1, 1,
-0.6774476, -1.150386, 0.673113, 1, 1, 1, 1, 1,
-0.6695613, 1.989403, -0.1205978, 1, 1, 1, 1, 1,
-0.6694902, -1.091545, -2.992836, 1, 1, 1, 1, 1,
-0.6666202, -0.1788576, -2.38173, 1, 1, 1, 1, 1,
-0.6649725, 1.241338, -1.364897, 1, 1, 1, 1, 1,
-0.6613371, 0.1904073, -3.784591, 1, 1, 1, 1, 1,
-0.6523659, -0.8425192, -2.42387, 1, 1, 1, 1, 1,
-0.6413708, -1.664561, -2.338402, 1, 1, 1, 1, 1,
-0.6412922, 0.3205005, -0.03185154, 0, 0, 1, 1, 1,
-0.6409532, 1.95138, 0.1124003, 1, 0, 0, 1, 1,
-0.6399352, 0.4175016, 1.015879, 1, 0, 0, 1, 1,
-0.635762, -1.186232, -2.058798, 1, 0, 0, 1, 1,
-0.6348019, 0.1646736, -1.895537, 1, 0, 0, 1, 1,
-0.6238173, -0.6486967, -2.12038, 1, 0, 0, 1, 1,
-0.6209524, -0.6268561, -2.737444, 0, 0, 0, 1, 1,
-0.6202728, -0.5085844, -1.935744, 0, 0, 0, 1, 1,
-0.6168569, 0.1939719, -3.184696, 0, 0, 0, 1, 1,
-0.6118863, 0.04206749, -0.840745, 0, 0, 0, 1, 1,
-0.6113529, 0.6710097, 1.604471, 0, 0, 0, 1, 1,
-0.6105677, -0.2382217, -1.200483, 0, 0, 0, 1, 1,
-0.6071436, -0.8021631, -2.064287, 0, 0, 0, 1, 1,
-0.6050765, 0.3219032, -0.4592806, 1, 1, 1, 1, 1,
-0.6046346, 2.24047, -0.7728251, 1, 1, 1, 1, 1,
-0.6038628, -1.977916, -2.362795, 1, 1, 1, 1, 1,
-0.6021973, -0.3963786, -2.465659, 1, 1, 1, 1, 1,
-0.6011876, 1.281948, 2.245138, 1, 1, 1, 1, 1,
-0.6001314, 1.239574, -0.5251477, 1, 1, 1, 1, 1,
-0.5970811, 0.2566136, -0.6734365, 1, 1, 1, 1, 1,
-0.5963255, 1.407091, 0.8311394, 1, 1, 1, 1, 1,
-0.5935575, -1.105591, -2.485686, 1, 1, 1, 1, 1,
-0.59166, 0.944948, -2.303709, 1, 1, 1, 1, 1,
-0.58968, -1.130605, -2.507269, 1, 1, 1, 1, 1,
-0.5878237, 2.838165, 0.3855638, 1, 1, 1, 1, 1,
-0.5875191, -1.319698, -2.052619, 1, 1, 1, 1, 1,
-0.5861057, 0.003563002, -1.09928, 1, 1, 1, 1, 1,
-0.5835493, -0.3609496, -2.567428, 1, 1, 1, 1, 1,
-0.5830448, -0.09964599, -2.80493, 0, 0, 1, 1, 1,
-0.5824808, 0.4034057, -0.01210038, 1, 0, 0, 1, 1,
-0.5813592, 0.1654975, -3.172094, 1, 0, 0, 1, 1,
-0.5801476, -0.4091073, -3.363518, 1, 0, 0, 1, 1,
-0.5770234, 0.7966211, 1.191597, 1, 0, 0, 1, 1,
-0.5704732, 1.516308, -1.284752, 1, 0, 0, 1, 1,
-0.569742, -1.250712, -2.153038, 0, 0, 0, 1, 1,
-0.5694722, 0.3428868, -0.9388797, 0, 0, 0, 1, 1,
-0.5660678, 1.562446, 1.501329, 0, 0, 0, 1, 1,
-0.5595793, -0.115054, -1.939515, 0, 0, 0, 1, 1,
-0.558324, -1.75595, -3.671274, 0, 0, 0, 1, 1,
-0.5534369, 1.274899, 0.5488492, 0, 0, 0, 1, 1,
-0.5508745, -0.7824418, -3.472057, 0, 0, 0, 1, 1,
-0.5499884, 1.16414, 2.108564, 1, 1, 1, 1, 1,
-0.5495, 1.090318, -0.6715521, 1, 1, 1, 1, 1,
-0.5452209, -0.7897935, -2.077812, 1, 1, 1, 1, 1,
-0.5401645, 1.596038, -1.599553, 1, 1, 1, 1, 1,
-0.5383171, 0.9063848, -2.270011, 1, 1, 1, 1, 1,
-0.5382414, 0.7275371, -2.137547, 1, 1, 1, 1, 1,
-0.5366042, 1.153766, 0.8179023, 1, 1, 1, 1, 1,
-0.5344988, 2.129642, 0.3315488, 1, 1, 1, 1, 1,
-0.534333, 0.5988194, -0.5801366, 1, 1, 1, 1, 1,
-0.531327, 0.2187204, 1.367432, 1, 1, 1, 1, 1,
-0.5312086, 1.556724, 0.0003170697, 1, 1, 1, 1, 1,
-0.525668, 1.26845, 0.6346746, 1, 1, 1, 1, 1,
-0.5219206, 0.1134539, -2.671386, 1, 1, 1, 1, 1,
-0.5206829, -0.9959863, -3.929898, 1, 1, 1, 1, 1,
-0.518087, 0.8944666, -1.473001, 1, 1, 1, 1, 1,
-0.5131916, 0.685851, -1.908292, 0, 0, 1, 1, 1,
-0.5080289, 0.6472281, -1.528341, 1, 0, 0, 1, 1,
-0.507653, 0.4127416, -0.6655986, 1, 0, 0, 1, 1,
-0.5051215, 0.8684705, 0.2758593, 1, 0, 0, 1, 1,
-0.4992535, 0.4721325, -0.8241484, 1, 0, 0, 1, 1,
-0.4988056, 0.1647526, -2.795863, 1, 0, 0, 1, 1,
-0.4897152, 0.03021066, -0.4757036, 0, 0, 0, 1, 1,
-0.487644, -0.7071096, -2.516796, 0, 0, 0, 1, 1,
-0.4844893, 0.3483944, -1.38346, 0, 0, 0, 1, 1,
-0.4770739, 1.613092, -1.342625, 0, 0, 0, 1, 1,
-0.4698275, -0.1520189, -2.853616, 0, 0, 0, 1, 1,
-0.4690959, -0.4536009, -1.788771, 0, 0, 0, 1, 1,
-0.4673022, 0.5256522, 0.9067552, 0, 0, 0, 1, 1,
-0.4595232, -0.4591286, -3.511406, 1, 1, 1, 1, 1,
-0.4585602, 1.987799, 0.3120733, 1, 1, 1, 1, 1,
-0.4547779, 2.080932, -1.961604, 1, 1, 1, 1, 1,
-0.4546157, -0.583695, -2.372553, 1, 1, 1, 1, 1,
-0.4537853, 0.983034, 1.252631, 1, 1, 1, 1, 1,
-0.451181, -0.5801461, -2.940418, 1, 1, 1, 1, 1,
-0.4438909, 0.01860506, -0.7076702, 1, 1, 1, 1, 1,
-0.4409856, -0.789292, -1.877487, 1, 1, 1, 1, 1,
-0.4393432, -0.1214764, -1.080344, 1, 1, 1, 1, 1,
-0.4359816, 1.573823, 0.2725625, 1, 1, 1, 1, 1,
-0.4353903, -0.7889231, -3.216497, 1, 1, 1, 1, 1,
-0.430406, 0.03458836, 0.2702496, 1, 1, 1, 1, 1,
-0.4234892, 1.933491, -0.6475046, 1, 1, 1, 1, 1,
-0.4229055, -0.1846871, -1.36715, 1, 1, 1, 1, 1,
-0.4220766, 0.4050441, -0.1530093, 1, 1, 1, 1, 1,
-0.4178017, 0.07125103, -0.5881542, 0, 0, 1, 1, 1,
-0.4147739, 1.737598, -0.8435965, 1, 0, 0, 1, 1,
-0.4127312, 0.5892306, -0.5859296, 1, 0, 0, 1, 1,
-0.4121853, 1.771753, -1.655004, 1, 0, 0, 1, 1,
-0.4111275, 0.04802797, -1.075835, 1, 0, 0, 1, 1,
-0.410657, 1.376305, 1.15954, 1, 0, 0, 1, 1,
-0.4035226, -1.261191, -1.820459, 0, 0, 0, 1, 1,
-0.4021096, 1.558817, -1.674452, 0, 0, 0, 1, 1,
-0.4018281, -0.6504176, -3.026369, 0, 0, 0, 1, 1,
-0.4002879, -0.6109467, -3.556415, 0, 0, 0, 1, 1,
-0.3993319, 0.2759261, -2.333898, 0, 0, 0, 1, 1,
-0.3949966, -2.221517, -2.819516, 0, 0, 0, 1, 1,
-0.3887388, -1.234333, -2.332628, 0, 0, 0, 1, 1,
-0.3887359, -0.7378062, -3.923086, 1, 1, 1, 1, 1,
-0.3825403, -0.6461073, 1.149036, 1, 1, 1, 1, 1,
-0.3810772, 0.6343102, -1.050869, 1, 1, 1, 1, 1,
-0.3790453, -1.234854, -3.11685, 1, 1, 1, 1, 1,
-0.377151, 1.295252, -1.636694, 1, 1, 1, 1, 1,
-0.3737603, -1.520167, -2.857972, 1, 1, 1, 1, 1,
-0.3736943, 1.436895, -0.08374864, 1, 1, 1, 1, 1,
-0.3655142, 0.6341487, -0.9851279, 1, 1, 1, 1, 1,
-0.3640036, -3.065403, -3.349648, 1, 1, 1, 1, 1,
-0.3606816, -0.2825043, -1.193034, 1, 1, 1, 1, 1,
-0.3576449, -0.03507464, -1.76378, 1, 1, 1, 1, 1,
-0.3538082, 0.0343362, -2.155796, 1, 1, 1, 1, 1,
-0.3521089, 0.891706, -1.210714, 1, 1, 1, 1, 1,
-0.3516909, -1.040207, -3.859007, 1, 1, 1, 1, 1,
-0.3505065, 1.162024, -0.364533, 1, 1, 1, 1, 1,
-0.3468572, -1.520443, -2.188619, 0, 0, 1, 1, 1,
-0.346286, 0.4725286, -0.7108985, 1, 0, 0, 1, 1,
-0.3444976, -0.4518879, -3.034353, 1, 0, 0, 1, 1,
-0.3432007, -0.7660731, -2.456307, 1, 0, 0, 1, 1,
-0.3409196, 1.087018, 0.04418807, 1, 0, 0, 1, 1,
-0.3402461, 0.6649031, 1.138444, 1, 0, 0, 1, 1,
-0.3378289, -0.3807615, -2.16282, 0, 0, 0, 1, 1,
-0.3357728, -1.79041, -0.02247982, 0, 0, 0, 1, 1,
-0.335193, 0.466702, 0.373798, 0, 0, 0, 1, 1,
-0.3351777, 1.599521, -0.1903255, 0, 0, 0, 1, 1,
-0.3348224, -0.8573149, -2.774649, 0, 0, 0, 1, 1,
-0.3296753, -0.6338194, -2.591433, 0, 0, 0, 1, 1,
-0.321269, 0.02742173, -4.442836, 0, 0, 0, 1, 1,
-0.313964, -0.5182235, -2.725327, 1, 1, 1, 1, 1,
-0.311443, -1.530017, -4.215495, 1, 1, 1, 1, 1,
-0.307021, -0.5251818, -4.684567, 1, 1, 1, 1, 1,
-0.2991022, 0.2205769, -1.955013, 1, 1, 1, 1, 1,
-0.2946115, 0.08056079, -0.7247304, 1, 1, 1, 1, 1,
-0.2907374, 1.137081, -0.834936, 1, 1, 1, 1, 1,
-0.2900448, 0.3676698, -1.297563, 1, 1, 1, 1, 1,
-0.2879854, 0.5995169, -0.5969486, 1, 1, 1, 1, 1,
-0.2872356, 0.07477497, -0.3639198, 1, 1, 1, 1, 1,
-0.2871124, -1.362454, -2.522659, 1, 1, 1, 1, 1,
-0.2870079, -1.94172, -3.238865, 1, 1, 1, 1, 1,
-0.2869723, 0.02975166, -0.8356915, 1, 1, 1, 1, 1,
-0.2852875, -0.5407958, -3.392988, 1, 1, 1, 1, 1,
-0.2851945, 0.8036551, -0.6710573, 1, 1, 1, 1, 1,
-0.2791442, -0.1020903, -1.491421, 1, 1, 1, 1, 1,
-0.2791014, 0.2283737, -1.653264, 0, 0, 1, 1, 1,
-0.2784277, 0.5648368, 0.2963787, 1, 0, 0, 1, 1,
-0.2782094, -0.09194684, -0.6842213, 1, 0, 0, 1, 1,
-0.2720059, 1.057468, 0.1723568, 1, 0, 0, 1, 1,
-0.2719073, -2.157933, -1.77023, 1, 0, 0, 1, 1,
-0.2672605, -1.410501, -2.796132, 1, 0, 0, 1, 1,
-0.2643007, 0.4341634, -1.202385, 0, 0, 0, 1, 1,
-0.2622768, -0.292662, -3.750781, 0, 0, 0, 1, 1,
-0.2621719, -0.3779937, -4.717983, 0, 0, 0, 1, 1,
-0.2560603, 0.01885663, -2.149086, 0, 0, 0, 1, 1,
-0.2533488, 0.6943031, -0.6013805, 0, 0, 0, 1, 1,
-0.2521678, 0.2216021, -1.538684, 0, 0, 0, 1, 1,
-0.249274, 0.09116085, -1.44916, 0, 0, 0, 1, 1,
-0.2448967, 0.1295936, -0.2634388, 1, 1, 1, 1, 1,
-0.2431695, -0.4585612, -3.063996, 1, 1, 1, 1, 1,
-0.2429158, 0.4984681, 0.3105107, 1, 1, 1, 1, 1,
-0.2394368, 1.559156, -1.384186, 1, 1, 1, 1, 1,
-0.2393981, 0.2533637, -1.831764, 1, 1, 1, 1, 1,
-0.2389267, 0.4561757, -0.6999035, 1, 1, 1, 1, 1,
-0.2387636, -1.30304, -3.422827, 1, 1, 1, 1, 1,
-0.2379336, -0.8793129, -3.161796, 1, 1, 1, 1, 1,
-0.2373569, 0.5524388, -0.9868276, 1, 1, 1, 1, 1,
-0.2373343, 0.373339, 0.4653865, 1, 1, 1, 1, 1,
-0.2371156, -0.2126396, -1.315356, 1, 1, 1, 1, 1,
-0.2363599, -0.03548524, -2.619848, 1, 1, 1, 1, 1,
-0.2349601, -0.3605777, -2.962694, 1, 1, 1, 1, 1,
-0.2329949, -1.799746, -2.627364, 1, 1, 1, 1, 1,
-0.2304956, -0.5170276, -3.457452, 1, 1, 1, 1, 1,
-0.2285798, -1.280518, -3.073882, 0, 0, 1, 1, 1,
-0.2233157, 0.5955335, -0.09395273, 1, 0, 0, 1, 1,
-0.2229821, 0.4187437, -0.3801675, 1, 0, 0, 1, 1,
-0.2210606, 0.8133306, 0.3560379, 1, 0, 0, 1, 1,
-0.2152291, 1.027396, -2.144252, 1, 0, 0, 1, 1,
-0.2147159, -1.701294, -2.650431, 1, 0, 0, 1, 1,
-0.2141116, -0.9353652, -2.378849, 0, 0, 0, 1, 1,
-0.2124785, 0.3596258, -2.499181, 0, 0, 0, 1, 1,
-0.2082942, 0.4837945, -1.232217, 0, 0, 0, 1, 1,
-0.2077933, 0.1881101, 0.4770103, 0, 0, 0, 1, 1,
-0.2044837, 1.115759, -2.22179, 0, 0, 0, 1, 1,
-0.2026174, -0.4255589, -2.659703, 0, 0, 0, 1, 1,
-0.2021063, -1.014723, -2.238843, 0, 0, 0, 1, 1,
-0.1995973, 0.8865238, -0.6043348, 1, 1, 1, 1, 1,
-0.1984568, 2.304554, -1.350813, 1, 1, 1, 1, 1,
-0.1933118, 0.05715264, -1.836204, 1, 1, 1, 1, 1,
-0.1912871, -0.9555953, -1.220728, 1, 1, 1, 1, 1,
-0.191214, 2.091828, 0.6286557, 1, 1, 1, 1, 1,
-0.1894619, 0.3739111, -0.9169814, 1, 1, 1, 1, 1,
-0.1894576, 0.09793458, -1.948992, 1, 1, 1, 1, 1,
-0.1872728, 0.05942926, -0.7380912, 1, 1, 1, 1, 1,
-0.1848948, 0.6369399, 1.562811, 1, 1, 1, 1, 1,
-0.1766883, 1.42418, -0.5511314, 1, 1, 1, 1, 1,
-0.1755868, -0.7064353, -4.703399, 1, 1, 1, 1, 1,
-0.1722241, -0.9754876, -4.403543, 1, 1, 1, 1, 1,
-0.1717483, -0.7415706, -1.266912, 1, 1, 1, 1, 1,
-0.1666625, 0.2609186, -0.7611611, 1, 1, 1, 1, 1,
-0.1630819, 0.1452267, -1.482869, 1, 1, 1, 1, 1,
-0.162713, -0.9637225, -4.490216, 0, 0, 1, 1, 1,
-0.1597746, 1.6283, 1.197598, 1, 0, 0, 1, 1,
-0.1582798, -1.137498, -3.837029, 1, 0, 0, 1, 1,
-0.1567667, 0.1280935, -2.007079, 1, 0, 0, 1, 1,
-0.1567523, -0.133902, -0.4504961, 1, 0, 0, 1, 1,
-0.1509819, -0.2770489, -2.74085, 1, 0, 0, 1, 1,
-0.1477502, 2.001338, -1.502947, 0, 0, 0, 1, 1,
-0.1455352, 0.8966026, 0.3251998, 0, 0, 0, 1, 1,
-0.1359818, 0.6730079, -1.343138, 0, 0, 0, 1, 1,
-0.1330194, -1.401335, -3.089108, 0, 0, 0, 1, 1,
-0.1327338, -0.5974709, -2.040284, 0, 0, 0, 1, 1,
-0.1298401, 0.5166889, -1.294577, 0, 0, 0, 1, 1,
-0.1265435, -2.699374, -2.039937, 0, 0, 0, 1, 1,
-0.1217423, -0.2057403, -3.381939, 1, 1, 1, 1, 1,
-0.1215183, 0.1579482, 1.786329, 1, 1, 1, 1, 1,
-0.1195125, 1.221184, 0.453129, 1, 1, 1, 1, 1,
-0.1147956, 0.3564237, -0.4888335, 1, 1, 1, 1, 1,
-0.1143666, 0.2845426, -0.173253, 1, 1, 1, 1, 1,
-0.1131228, 1.441754, -0.01863136, 1, 1, 1, 1, 1,
-0.1126626, 0.6758097, 0.8269846, 1, 1, 1, 1, 1,
-0.1099912, 0.6427228, 0.2641111, 1, 1, 1, 1, 1,
-0.1090543, 0.917538, -1.39728, 1, 1, 1, 1, 1,
-0.1086594, -0.4064672, -4.646932, 1, 1, 1, 1, 1,
-0.1059178, -0.8087433, -3.869065, 1, 1, 1, 1, 1,
-0.104958, -1.324392, -4.100252, 1, 1, 1, 1, 1,
-0.09888942, -1.844667, -2.854217, 1, 1, 1, 1, 1,
-0.09479045, -0.4598582, -3.73314, 1, 1, 1, 1, 1,
-0.09270586, -0.6375147, -4.52981, 1, 1, 1, 1, 1,
-0.0920907, -0.2077175, -2.901556, 0, 0, 1, 1, 1,
-0.08955343, 1.948807, 0.02259106, 1, 0, 0, 1, 1,
-0.08759768, 0.03001132, 0.2249316, 1, 0, 0, 1, 1,
-0.08294721, 0.1043905, -0.5212168, 1, 0, 0, 1, 1,
-0.07483051, 0.2377384, 0.5683014, 1, 0, 0, 1, 1,
-0.07074855, 0.1426395, 1.044714, 1, 0, 0, 1, 1,
-0.07066446, 0.6757877, -1.989241, 0, 0, 0, 1, 1,
-0.06670213, -1.926447, -3.804084, 0, 0, 0, 1, 1,
-0.06281487, 0.1155658, -0.1793249, 0, 0, 0, 1, 1,
-0.06192748, 2.026105, 0.02751223, 0, 0, 0, 1, 1,
-0.05805788, 0.6523588, -0.4030665, 0, 0, 0, 1, 1,
-0.04770376, 0.006517746, -0.6726316, 0, 0, 0, 1, 1,
-0.0378225, 0.05696361, 0.1991154, 0, 0, 0, 1, 1,
-0.03403985, -0.1274002, -4.405313, 1, 1, 1, 1, 1,
-0.02658332, -0.3205983, -2.484025, 1, 1, 1, 1, 1,
-0.02401914, 0.6009879, 0.0117033, 1, 1, 1, 1, 1,
-0.02218177, -0.1354204, -2.314087, 1, 1, 1, 1, 1,
-0.01856284, 0.09715279, -0.07585581, 1, 1, 1, 1, 1,
-0.01855246, -0.0043152, -1.710802, 1, 1, 1, 1, 1,
-0.01803624, -1.340504, -3.883498, 1, 1, 1, 1, 1,
-0.0164374, 1.403291, 2.444629, 1, 1, 1, 1, 1,
-0.01320622, -0.8880566, -3.594365, 1, 1, 1, 1, 1,
-0.01103775, -0.1545445, -2.046516, 1, 1, 1, 1, 1,
-0.01080733, -1.400751, -2.748644, 1, 1, 1, 1, 1,
-0.003283892, 0.09726053, -0.03927067, 1, 1, 1, 1, 1,
-0.002912835, -0.73317, 0.4239805, 1, 1, 1, 1, 1,
-0.002782068, -1.592363, -4.069095, 1, 1, 1, 1, 1,
-0.001926828, 0.5013502, -0.5602089, 1, 1, 1, 1, 1,
0.0005108239, -0.3801416, 3.492928, 0, 0, 1, 1, 1,
0.0007342793, -1.953849, 1.643953, 1, 0, 0, 1, 1,
0.001626266, 1.052008, -0.8888676, 1, 0, 0, 1, 1,
0.005757927, -1.595574, 4.377436, 1, 0, 0, 1, 1,
0.006542324, -0.9414867, 4.171206, 1, 0, 0, 1, 1,
0.01207358, 2.697608, 0.006114105, 1, 0, 0, 1, 1,
0.0124566, -1.895479, 3.612527, 0, 0, 0, 1, 1,
0.01552726, 0.2272096, 0.5063425, 0, 0, 0, 1, 1,
0.01603273, 0.7088345, 0.07964906, 0, 0, 0, 1, 1,
0.01961685, 0.4056586, 0.3408189, 0, 0, 0, 1, 1,
0.02004334, -1.213976, 3.659326, 0, 0, 0, 1, 1,
0.02612548, -1.034842, 2.13322, 0, 0, 0, 1, 1,
0.02979711, 0.5528814, 0.7207093, 0, 0, 0, 1, 1,
0.03264111, 0.4741035, -0.2790439, 1, 1, 1, 1, 1,
0.03274085, 0.6900647, -1.265294, 1, 1, 1, 1, 1,
0.03283792, 0.203627, -0.008667796, 1, 1, 1, 1, 1,
0.03472441, -0.5716707, 3.210782, 1, 1, 1, 1, 1,
0.0390412, -1.296044, 3.95536, 1, 1, 1, 1, 1,
0.04076232, 0.3935049, 0.9021674, 1, 1, 1, 1, 1,
0.04506062, -0.3707733, 3.346586, 1, 1, 1, 1, 1,
0.05031849, 0.8718199, 0.4933622, 1, 1, 1, 1, 1,
0.05179755, -1.232483, 2.437085, 1, 1, 1, 1, 1,
0.05882143, -0.6222345, 2.369829, 1, 1, 1, 1, 1,
0.06301061, 0.4450468, -1.177249, 1, 1, 1, 1, 1,
0.06816017, 2.481322, -0.2695603, 1, 1, 1, 1, 1,
0.06923523, 1.239008, -1.435867, 1, 1, 1, 1, 1,
0.06942915, 0.6424671, -1.039891, 1, 1, 1, 1, 1,
0.0731062, -0.05372946, 4.425131, 1, 1, 1, 1, 1,
0.08272209, -0.2697108, 3.84216, 0, 0, 1, 1, 1,
0.08325133, -0.0290123, 2.211154, 1, 0, 0, 1, 1,
0.08616272, -0.8222114, 3.294252, 1, 0, 0, 1, 1,
0.09234418, 0.726758, 0.4049062, 1, 0, 0, 1, 1,
0.0938379, -1.026421, 4.873062, 1, 0, 0, 1, 1,
0.09579518, 0.6240883, 0.4719673, 1, 0, 0, 1, 1,
0.09607034, 0.4276628, 0.5684456, 0, 0, 0, 1, 1,
0.09682758, 0.2142794, -0.2533097, 0, 0, 0, 1, 1,
0.1039754, -0.2328263, 2.576939, 0, 0, 0, 1, 1,
0.1054826, -0.8202004, 1.675012, 0, 0, 0, 1, 1,
0.1064765, -0.8949111, 2.075787, 0, 0, 0, 1, 1,
0.1103844, -1.466198, 2.42979, 0, 0, 0, 1, 1,
0.1159092, 1.103992, 1.710714, 0, 0, 0, 1, 1,
0.116349, -0.3388776, 3.045907, 1, 1, 1, 1, 1,
0.119837, -0.9795463, 2.002198, 1, 1, 1, 1, 1,
0.1230582, -1.075187, 2.014965, 1, 1, 1, 1, 1,
0.1232259, 0.2520745, 1.313936, 1, 1, 1, 1, 1,
0.1245349, -1.490749, 1.457334, 1, 1, 1, 1, 1,
0.1263407, -0.9705597, 3.816111, 1, 1, 1, 1, 1,
0.1284427, 0.1739427, 0.9214163, 1, 1, 1, 1, 1,
0.1334117, 0.9891341, 0.1472332, 1, 1, 1, 1, 1,
0.1337065, 0.6978136, 1.155336, 1, 1, 1, 1, 1,
0.1405676, 0.9674821, 1.00495, 1, 1, 1, 1, 1,
0.1411195, -0.04672503, 2.871178, 1, 1, 1, 1, 1,
0.141296, -0.3228287, 3.482059, 1, 1, 1, 1, 1,
0.147827, -0.5713208, 2.277265, 1, 1, 1, 1, 1,
0.1531262, -0.6708955, 3.534437, 1, 1, 1, 1, 1,
0.1534386, -0.9063509, 2.450765, 1, 1, 1, 1, 1,
0.1550094, -0.1397497, 2.16775, 0, 0, 1, 1, 1,
0.1552771, -1.877086, 2.816274, 1, 0, 0, 1, 1,
0.1568152, -0.4369275, 3.485967, 1, 0, 0, 1, 1,
0.1599314, 0.1937345, 1.136977, 1, 0, 0, 1, 1,
0.1610273, 0.4079579, 1.081495, 1, 0, 0, 1, 1,
0.1618863, 0.1027181, 0.3782431, 1, 0, 0, 1, 1,
0.1621524, 0.7780123, 1.005457, 0, 0, 0, 1, 1,
0.1626993, -0.9313036, 4.414907, 0, 0, 0, 1, 1,
0.1728568, -0.7084235, 3.68064, 0, 0, 0, 1, 1,
0.1732433, -0.349625, 3.293924, 0, 0, 0, 1, 1,
0.1742832, 0.5166681, 0.9231251, 0, 0, 0, 1, 1,
0.1795889, -0.4887361, 3.561789, 0, 0, 0, 1, 1,
0.1815374, 0.1346111, 0.4637268, 0, 0, 0, 1, 1,
0.1821758, -0.1136347, 3.505872, 1, 1, 1, 1, 1,
0.188861, 0.2586973, 1.241204, 1, 1, 1, 1, 1,
0.1901338, 0.8828341, 0.726964, 1, 1, 1, 1, 1,
0.191283, -0.7090583, 2.48694, 1, 1, 1, 1, 1,
0.1916774, -0.2834504, 3.000301, 1, 1, 1, 1, 1,
0.1945863, -1.781347, 2.306911, 1, 1, 1, 1, 1,
0.207008, -0.4869388, 2.726858, 1, 1, 1, 1, 1,
0.2095646, 1.272455, -0.6482913, 1, 1, 1, 1, 1,
0.210479, -0.1802898, 0.0911577, 1, 1, 1, 1, 1,
0.2114119, -0.3878482, 3.010121, 1, 1, 1, 1, 1,
0.2117727, -0.164388, 2.909143, 1, 1, 1, 1, 1,
0.2135094, 0.3614309, 0.7997147, 1, 1, 1, 1, 1,
0.21365, -1.671616, 5.261519, 1, 1, 1, 1, 1,
0.2182657, 0.2689958, -0.0647357, 1, 1, 1, 1, 1,
0.2189994, 0.423364, 0.8931464, 1, 1, 1, 1, 1,
0.2218, -0.459307, 2.628763, 0, 0, 1, 1, 1,
0.2229239, 0.7460371, -1.021827, 1, 0, 0, 1, 1,
0.2260885, -0.3339543, 2.774998, 1, 0, 0, 1, 1,
0.226451, 0.7645819, -0.6238427, 1, 0, 0, 1, 1,
0.2279339, -0.09660175, 1.746673, 1, 0, 0, 1, 1,
0.2303258, -0.04361534, 1.781519, 1, 0, 0, 1, 1,
0.2305529, -1.242865, 2.126773, 0, 0, 0, 1, 1,
0.2362143, 1.47118, -0.7738388, 0, 0, 0, 1, 1,
0.2378709, 0.3874375, 0.9565083, 0, 0, 0, 1, 1,
0.2399065, 2.263692, 0.09780682, 0, 0, 0, 1, 1,
0.2453556, -0.9393775, 3.313798, 0, 0, 0, 1, 1,
0.2493642, 0.7270551, 1.626116, 0, 0, 0, 1, 1,
0.2546041, -1.851403, 4.683493, 0, 0, 0, 1, 1,
0.2579374, 0.5289421, 1.463762, 1, 1, 1, 1, 1,
0.2601223, 0.9362167, 2.056918, 1, 1, 1, 1, 1,
0.2621502, -0.7337857, 2.021723, 1, 1, 1, 1, 1,
0.264714, -1.75427, 3.209033, 1, 1, 1, 1, 1,
0.2670303, 0.4017785, 0.9407149, 1, 1, 1, 1, 1,
0.2673962, -0.2234835, 3.578844, 1, 1, 1, 1, 1,
0.2708578, -0.07856534, 3.618183, 1, 1, 1, 1, 1,
0.2711177, -0.3987988, 2.605574, 1, 1, 1, 1, 1,
0.27557, 0.5451357, 1.060068, 1, 1, 1, 1, 1,
0.276186, 0.3344222, -0.03522913, 1, 1, 1, 1, 1,
0.2763166, 0.3388121, 1.426695, 1, 1, 1, 1, 1,
0.2791311, 0.7095715, 2.634528, 1, 1, 1, 1, 1,
0.2792799, -1.454448, 2.860252, 1, 1, 1, 1, 1,
0.2794094, -0.2959578, 2.042799, 1, 1, 1, 1, 1,
0.2908382, -0.1923825, 1.428505, 1, 1, 1, 1, 1,
0.2927748, -0.07069243, 0.7377541, 0, 0, 1, 1, 1,
0.2948219, 1.885347, 0.003427343, 1, 0, 0, 1, 1,
0.2956797, -1.843789, 3.451502, 1, 0, 0, 1, 1,
0.2985793, -0.2903427, 2.333649, 1, 0, 0, 1, 1,
0.3002031, 0.694664, 0.2111884, 1, 0, 0, 1, 1,
0.3003432, 0.1951941, 1.345639, 1, 0, 0, 1, 1,
0.3033551, -0.4409861, 3.09737, 0, 0, 0, 1, 1,
0.3040806, 1.966697, -1.508207, 0, 0, 0, 1, 1,
0.3091123, -0.7383034, 3.445328, 0, 0, 0, 1, 1,
0.3124455, -1.255139, 3.4589, 0, 0, 0, 1, 1,
0.3137853, -1.083312, 1.95689, 0, 0, 0, 1, 1,
0.3171837, 0.1403621, 1.623099, 0, 0, 0, 1, 1,
0.3175141, 0.6348014, -0.360856, 0, 0, 0, 1, 1,
0.3205492, 0.6795069, 0.2892285, 1, 1, 1, 1, 1,
0.3219596, 0.4662977, -2.13372, 1, 1, 1, 1, 1,
0.3223982, 0.07795603, 0.7208151, 1, 1, 1, 1, 1,
0.3228028, -0.7675795, 3.832406, 1, 1, 1, 1, 1,
0.3228133, 0.8222957, 0.3595579, 1, 1, 1, 1, 1,
0.3349236, -0.6008306, 1.789122, 1, 1, 1, 1, 1,
0.3404926, 0.8083162, -1.447892, 1, 1, 1, 1, 1,
0.344393, -0.6512405, 2.970173, 1, 1, 1, 1, 1,
0.3499467, -0.7380632, 2.578902, 1, 1, 1, 1, 1,
0.357522, -0.09156812, 3.142713, 1, 1, 1, 1, 1,
0.360064, 0.06733174, 0.03180844, 1, 1, 1, 1, 1,
0.3660588, 1.393354, 0.3863005, 1, 1, 1, 1, 1,
0.3725334, -1.35718, 2.273975, 1, 1, 1, 1, 1,
0.3740385, -0.2573344, 1.688899, 1, 1, 1, 1, 1,
0.3786774, 0.5153498, 1.211758, 1, 1, 1, 1, 1,
0.3789602, -1.220833, 0.983776, 0, 0, 1, 1, 1,
0.3792096, -0.6170922, 2.122421, 1, 0, 0, 1, 1,
0.3827916, -0.931022, 4.38065, 1, 0, 0, 1, 1,
0.3842637, -0.3320189, -0.4452121, 1, 0, 0, 1, 1,
0.3871281, -2.008688, 2.298903, 1, 0, 0, 1, 1,
0.3882923, -2.107012, 2.729549, 1, 0, 0, 1, 1,
0.3892922, -0.3342669, 2.961622, 0, 0, 0, 1, 1,
0.3952403, -1.682553, 2.657273, 0, 0, 0, 1, 1,
0.395687, 0.09724179, -0.4014085, 0, 0, 0, 1, 1,
0.4037884, 1.28661, 2.638976, 0, 0, 0, 1, 1,
0.4043229, 0.03520299, 3.932702, 0, 0, 0, 1, 1,
0.4115646, 1.512765, 0.3293352, 0, 0, 0, 1, 1,
0.4142582, 0.7962332, -0.5374255, 0, 0, 0, 1, 1,
0.4167534, -1.209571, 4.338938, 1, 1, 1, 1, 1,
0.4177658, -1.888791, 3.119876, 1, 1, 1, 1, 1,
0.424372, 0.7418671, -1.088358, 1, 1, 1, 1, 1,
0.4250119, -1.949018, 2.291106, 1, 1, 1, 1, 1,
0.4254759, 2.367754, 1.018808, 1, 1, 1, 1, 1,
0.4309196, -0.8735342, 2.773042, 1, 1, 1, 1, 1,
0.4335252, -0.2184101, 2.522754, 1, 1, 1, 1, 1,
0.4338116, -0.1215386, 1.756614, 1, 1, 1, 1, 1,
0.4366185, -0.4839718, 2.388227, 1, 1, 1, 1, 1,
0.4403182, -0.945573, 2.564225, 1, 1, 1, 1, 1,
0.4424466, -0.1403134, 0.6528609, 1, 1, 1, 1, 1,
0.4432608, -0.3192496, 2.825247, 1, 1, 1, 1, 1,
0.4477599, -1.066125, 3.964762, 1, 1, 1, 1, 1,
0.4493329, -0.08284881, 0.2761491, 1, 1, 1, 1, 1,
0.4506594, 0.8828356, 1.60989, 1, 1, 1, 1, 1,
0.4585625, 1.032358, -1.044152, 0, 0, 1, 1, 1,
0.458625, 0.05077428, 1.169623, 1, 0, 0, 1, 1,
0.4648747, 0.2667081, 2.187184, 1, 0, 0, 1, 1,
0.471574, -1.170809, 3.481574, 1, 0, 0, 1, 1,
0.4761618, -1.682567, 3.452013, 1, 0, 0, 1, 1,
0.4798015, -0.6256022, 3.3047, 1, 0, 0, 1, 1,
0.4805808, -0.1934928, 3.484432, 0, 0, 0, 1, 1,
0.4818525, 0.2182001, 2.924062, 0, 0, 0, 1, 1,
0.4849181, -1.404119, 3.115386, 0, 0, 0, 1, 1,
0.4862542, 0.4840634, 1.26606, 0, 0, 0, 1, 1,
0.4919671, 0.1772754, 2.554138, 0, 0, 0, 1, 1,
0.5033126, -0.9846603, 3.635822, 0, 0, 0, 1, 1,
0.5037202, 1.062605, 0.8736895, 0, 0, 0, 1, 1,
0.5038239, 0.3607161, -0.6896244, 1, 1, 1, 1, 1,
0.5077898, 1.392207, 0.6910093, 1, 1, 1, 1, 1,
0.5104203, -0.8555534, 2.906282, 1, 1, 1, 1, 1,
0.5121732, 0.6542873, 0.9512079, 1, 1, 1, 1, 1,
0.5127683, -0.06537969, 2.238928, 1, 1, 1, 1, 1,
0.5155897, -0.6798785, 1.376404, 1, 1, 1, 1, 1,
0.5206295, -0.03807057, 1.800932, 1, 1, 1, 1, 1,
0.5230731, -0.4440922, 1.294078, 1, 1, 1, 1, 1,
0.5232164, -0.4778901, 2.187516, 1, 1, 1, 1, 1,
0.5277139, 1.676576, 0.8256681, 1, 1, 1, 1, 1,
0.5333977, 0.1681257, -0.1523023, 1, 1, 1, 1, 1,
0.5347207, -0.2776472, 3.718825, 1, 1, 1, 1, 1,
0.536746, -0.482362, 1.548353, 1, 1, 1, 1, 1,
0.5381868, 1.315068, -0.5303511, 1, 1, 1, 1, 1,
0.5392799, 0.3917484, 3.217467, 1, 1, 1, 1, 1,
0.5428966, -0.7978317, 2.29674, 0, 0, 1, 1, 1,
0.5472221, 0.4210186, 0.6165785, 1, 0, 0, 1, 1,
0.5488337, 1.546573, -1.435505, 1, 0, 0, 1, 1,
0.550181, -0.790584, 2.199314, 1, 0, 0, 1, 1,
0.5504508, 1.470618, 0.8100246, 1, 0, 0, 1, 1,
0.5511466, 1.503115, 0.2577522, 1, 0, 0, 1, 1,
0.5521641, -1.441398, 2.699093, 0, 0, 0, 1, 1,
0.5604172, -0.04388671, 1.229936, 0, 0, 0, 1, 1,
0.5681483, 0.9306664, 0.2704325, 0, 0, 0, 1, 1,
0.57397, 0.4757463, -0.5429628, 0, 0, 0, 1, 1,
0.5802291, -2.005366, 4.202267, 0, 0, 0, 1, 1,
0.581206, -0.5271007, 3.341023, 0, 0, 0, 1, 1,
0.5847191, 0.8560805, -0.02883, 0, 0, 0, 1, 1,
0.5853286, -0.3464426, 1.790713, 1, 1, 1, 1, 1,
0.5854812, 0.8033011, -0.1453288, 1, 1, 1, 1, 1,
0.5885493, 1.581812, 0.1281283, 1, 1, 1, 1, 1,
0.5916642, 0.3098127, 0.2181769, 1, 1, 1, 1, 1,
0.5938134, 0.06858318, 1.423421, 1, 1, 1, 1, 1,
0.5939317, -1.394123, 4.088852, 1, 1, 1, 1, 1,
0.5999607, -0.631954, 0.2388052, 1, 1, 1, 1, 1,
0.6037796, -0.7614624, 1.736826, 1, 1, 1, 1, 1,
0.6124291, 0.3787904, 1.245757, 1, 1, 1, 1, 1,
0.6276404, 0.2508065, 0.1264875, 1, 1, 1, 1, 1,
0.6298763, 0.6222763, 1.203612, 1, 1, 1, 1, 1,
0.6332909, 0.8041893, 2.326327, 1, 1, 1, 1, 1,
0.6337599, -0.1643022, 2.147891, 1, 1, 1, 1, 1,
0.6355489, 0.1498989, 1.848997, 1, 1, 1, 1, 1,
0.6366095, 2.035657, 1.455822, 1, 1, 1, 1, 1,
0.637861, -0.2235538, -0.0497069, 0, 0, 1, 1, 1,
0.6423458, 0.09989643, 1.228095, 1, 0, 0, 1, 1,
0.6459689, -1.316956, 3.159528, 1, 0, 0, 1, 1,
0.6465803, 0.6061909, -0.03050438, 1, 0, 0, 1, 1,
0.6522982, -1.559094, 1.476989, 1, 0, 0, 1, 1,
0.6527259, -0.9654597, 2.471205, 1, 0, 0, 1, 1,
0.6551558, -1.373057, 4.011861, 0, 0, 0, 1, 1,
0.6559055, 0.8118182, 0.8245061, 0, 0, 0, 1, 1,
0.6573975, 1.173717, 1.244052, 0, 0, 0, 1, 1,
0.6589047, 0.7286919, 0.3276694, 0, 0, 0, 1, 1,
0.6589363, 1.234545, 0.4826268, 0, 0, 0, 1, 1,
0.6600413, -0.371909, 0.706483, 0, 0, 0, 1, 1,
0.6610742, 2.301392, -0.6544683, 0, 0, 0, 1, 1,
0.6625182, -2.165318, 2.80726, 1, 1, 1, 1, 1,
0.665377, -0.4694372, 1.671067, 1, 1, 1, 1, 1,
0.6785157, -0.3034462, 2.610139, 1, 1, 1, 1, 1,
0.6903704, -0.07239262, 1.885402, 1, 1, 1, 1, 1,
0.6929993, 0.4160852, 0.9329833, 1, 1, 1, 1, 1,
0.6957088, -0.1872508, 3.405432, 1, 1, 1, 1, 1,
0.6964319, -0.8233901, 2.395087, 1, 1, 1, 1, 1,
0.7056074, 1.277616, 0.8820598, 1, 1, 1, 1, 1,
0.7060718, -1.231566, 2.584848, 1, 1, 1, 1, 1,
0.7065046, 0.2273808, 1.045927, 1, 1, 1, 1, 1,
0.7086267, 0.4272596, 1.257719, 1, 1, 1, 1, 1,
0.7111576, -0.006275718, 1.893121, 1, 1, 1, 1, 1,
0.7145002, 0.01760146, 0.5466641, 1, 1, 1, 1, 1,
0.7150371, 0.2506994, 0.8365916, 1, 1, 1, 1, 1,
0.719231, 0.7256864, 1.950923, 1, 1, 1, 1, 1,
0.7226368, -0.3569835, 1.588297, 0, 0, 1, 1, 1,
0.7260789, 0.005701981, -0.6215235, 1, 0, 0, 1, 1,
0.7281856, -0.1175283, 2.336017, 1, 0, 0, 1, 1,
0.7300925, -0.5123686, 3.724407, 1, 0, 0, 1, 1,
0.7333362, -0.9634791, 2.417769, 1, 0, 0, 1, 1,
0.7377836, -1.518606, 2.935707, 1, 0, 0, 1, 1,
0.7396504, -1.83388, 2.477727, 0, 0, 0, 1, 1,
0.7417707, -0.2619179, 1.532083, 0, 0, 0, 1, 1,
0.7430963, -0.009791383, 0.6820574, 0, 0, 0, 1, 1,
0.7478427, 0.9458285, 0.03432313, 0, 0, 0, 1, 1,
0.74928, -0.2234389, 1.74369, 0, 0, 0, 1, 1,
0.7503878, -0.5955885, 2.25634, 0, 0, 0, 1, 1,
0.7525908, -0.176751, 3.23402, 0, 0, 0, 1, 1,
0.763532, 1.284537, 1.020216, 1, 1, 1, 1, 1,
0.7685144, -1.332598, 2.99089, 1, 1, 1, 1, 1,
0.7786819, -0.6100848, 1.307062, 1, 1, 1, 1, 1,
0.7842022, -0.1612672, 2.269245, 1, 1, 1, 1, 1,
0.7902847, -0.3926714, 0.6115463, 1, 1, 1, 1, 1,
0.7909352, 0.08957969, 1.628518, 1, 1, 1, 1, 1,
0.7941187, -0.07115996, 0.5906556, 1, 1, 1, 1, 1,
0.7957622, -0.547811, 1.87002, 1, 1, 1, 1, 1,
0.8015319, 0.5317942, 1.109962, 1, 1, 1, 1, 1,
0.8033768, -1.209413, 1.359443, 1, 1, 1, 1, 1,
0.8053448, -0.7060733, 2.287753, 1, 1, 1, 1, 1,
0.8088242, 0.9967216, -0.1516565, 1, 1, 1, 1, 1,
0.8138674, -0.2175893, 1.640514, 1, 1, 1, 1, 1,
0.815348, -0.750074, 2.405747, 1, 1, 1, 1, 1,
0.8183342, 0.0728777, 1.090292, 1, 1, 1, 1, 1,
0.8208539, 0.7339994, 0.8258705, 0, 0, 1, 1, 1,
0.8209031, 0.4335216, 0.1620205, 1, 0, 0, 1, 1,
0.8231449, -0.04125369, 0.9967908, 1, 0, 0, 1, 1,
0.8235332, 0.3347343, 0.9467041, 1, 0, 0, 1, 1,
0.823759, 1.072039, 0.2464977, 1, 0, 0, 1, 1,
0.8307952, -0.4116217, 3.153236, 1, 0, 0, 1, 1,
0.8322194, -0.2386879, 1.387773, 0, 0, 0, 1, 1,
0.8323808, 0.4266911, -0.1130642, 0, 0, 0, 1, 1,
0.833214, -1.247481, 4.985922, 0, 0, 0, 1, 1,
0.8369066, -1.858983, 2.626586, 0, 0, 0, 1, 1,
0.8379809, -1.304434, 2.036724, 0, 0, 0, 1, 1,
0.8393063, -0.9656261, 0.5732639, 0, 0, 0, 1, 1,
0.8452302, 0.833498, -0.2046179, 0, 0, 0, 1, 1,
0.8457984, -0.6660503, 2.684735, 1, 1, 1, 1, 1,
0.8511685, -0.8745783, 4.099365, 1, 1, 1, 1, 1,
0.8579269, 0.1453175, 1.113055, 1, 1, 1, 1, 1,
0.8584197, -1.120536, 3.374704, 1, 1, 1, 1, 1,
0.8615687, 1.036611, -0.2716185, 1, 1, 1, 1, 1,
0.8648523, 0.6876518, 0.524592, 1, 1, 1, 1, 1,
0.8697444, 0.6121278, 0.4486702, 1, 1, 1, 1, 1,
0.8703147, -0.5070787, 3.881472, 1, 1, 1, 1, 1,
0.8776993, 0.9078723, 0.7400697, 1, 1, 1, 1, 1,
0.8854794, 0.113482, 1.354501, 1, 1, 1, 1, 1,
0.8885415, 0.5380571, 0.9184516, 1, 1, 1, 1, 1,
0.8929041, 0.9688504, -0.6745424, 1, 1, 1, 1, 1,
0.8951245, -0.0287122, 1.883544, 1, 1, 1, 1, 1,
0.8989589, 0.04710816, 1.90448, 1, 1, 1, 1, 1,
0.8991923, -0.8576759, 4.39687, 1, 1, 1, 1, 1,
0.9002843, 0.1195261, 1.366186, 0, 0, 1, 1, 1,
0.9029164, -1.291078, 3.717795, 1, 0, 0, 1, 1,
0.9062817, 1.073635, 0.727042, 1, 0, 0, 1, 1,
0.9092747, -0.5839345, 1.643034, 1, 0, 0, 1, 1,
0.9102819, -1.297649, 1.862149, 1, 0, 0, 1, 1,
0.9151352, 0.4763818, -0.3702852, 1, 0, 0, 1, 1,
0.9183273, 0.4138007, 1.090362, 0, 0, 0, 1, 1,
0.9200389, 0.9070815, -0.1153052, 0, 0, 0, 1, 1,
0.9215561, -0.3634907, 1.794679, 0, 0, 0, 1, 1,
0.9259908, -0.1446771, 1.942431, 0, 0, 0, 1, 1,
0.9265386, -0.5145261, 3.602235, 0, 0, 0, 1, 1,
0.9272454, -0.4868638, 2.877906, 0, 0, 0, 1, 1,
0.9278973, -0.4287262, 2.638874, 0, 0, 0, 1, 1,
0.9282876, 0.3745089, 0.6821501, 1, 1, 1, 1, 1,
0.933645, 0.8141959, 1.514317, 1, 1, 1, 1, 1,
0.9338992, 0.6106629, 1.849841, 1, 1, 1, 1, 1,
0.9462941, -1.337788, 2.324172, 1, 1, 1, 1, 1,
0.9477881, -1.286246, 2.07469, 1, 1, 1, 1, 1,
0.9481835, 0.8074585, 0.750079, 1, 1, 1, 1, 1,
0.9496242, -1.429313, 2.435983, 1, 1, 1, 1, 1,
0.9516711, -0.1064958, 2.67918, 1, 1, 1, 1, 1,
0.9529237, -0.3911273, 1.779145, 1, 1, 1, 1, 1,
0.9655579, 1.488092, -0.1388527, 1, 1, 1, 1, 1,
0.9710842, 0.3959259, 2.256788, 1, 1, 1, 1, 1,
0.9761253, 0.718861, 2.637712, 1, 1, 1, 1, 1,
0.979126, 0.4895916, 1.058483, 1, 1, 1, 1, 1,
0.9807466, -1.144679, 2.449568, 1, 1, 1, 1, 1,
0.9897947, -0.2939472, 2.061882, 1, 1, 1, 1, 1,
0.9918, 0.6501448, 1.555699, 0, 0, 1, 1, 1,
0.994015, 0.6222398, 2.572698, 1, 0, 0, 1, 1,
0.9940285, -1.656376, 4.587005, 1, 0, 0, 1, 1,
0.9988955, 1.35334, 0.352831, 1, 0, 0, 1, 1,
1.001097, -0.3590593, 4.048043, 1, 0, 0, 1, 1,
1.001473, 0.9967366, -0.6257991, 1, 0, 0, 1, 1,
1.01617, -1.344273, 2.463705, 0, 0, 0, 1, 1,
1.018122, -0.06954545, 1.364679, 0, 0, 0, 1, 1,
1.024247, 0.989746, 1.511852, 0, 0, 0, 1, 1,
1.026554, 0.175433, 1.384338, 0, 0, 0, 1, 1,
1.028251, 0.04085813, -0.3733422, 0, 0, 0, 1, 1,
1.02831, 1.129766, 0.5216665, 0, 0, 0, 1, 1,
1.02848, -0.7295607, 2.558877, 0, 0, 0, 1, 1,
1.030954, -0.2190448, 2.910293, 1, 1, 1, 1, 1,
1.035735, 0.5965832, 2.139997, 1, 1, 1, 1, 1,
1.035773, -1.541812, 1.912113, 1, 1, 1, 1, 1,
1.040208, 0.6770594, 2.450855, 1, 1, 1, 1, 1,
1.041287, -0.8946555, 2.456744, 1, 1, 1, 1, 1,
1.042735, 0.5991927, 1.406374, 1, 1, 1, 1, 1,
1.049357, -0.6299987, 1.390995, 1, 1, 1, 1, 1,
1.04978, -0.4834976, 1.253578, 1, 1, 1, 1, 1,
1.073991, -0.1199084, 0.7993264, 1, 1, 1, 1, 1,
1.091701, -0.151805, 2.015198, 1, 1, 1, 1, 1,
1.097465, 0.2053208, 1.544245, 1, 1, 1, 1, 1,
1.107553, -0.4703425, 1.490602, 1, 1, 1, 1, 1,
1.112493, 0.03914531, 0.6853188, 1, 1, 1, 1, 1,
1.114191, 1.465432, 0.6856712, 1, 1, 1, 1, 1,
1.11442, -2.93641, 1.693254, 1, 1, 1, 1, 1,
1.122626, -0.8098672, 2.9556, 0, 0, 1, 1, 1,
1.136822, 0.3149444, 3.322585, 1, 0, 0, 1, 1,
1.137086, 0.2375471, 0.5379008, 1, 0, 0, 1, 1,
1.14247, -0.348705, 1.612104, 1, 0, 0, 1, 1,
1.142792, 2.53658, -0.2249832, 1, 0, 0, 1, 1,
1.14528, -0.5690624, 1.373179, 1, 0, 0, 1, 1,
1.1453, -0.005266002, 1.596723, 0, 0, 0, 1, 1,
1.153568, -0.308335, 2.350969, 0, 0, 0, 1, 1,
1.154029, 1.6121, 1.385491, 0, 0, 0, 1, 1,
1.15812, -0.5497912, 0.6209875, 0, 0, 0, 1, 1,
1.161326, -0.8179038, 2.618982, 0, 0, 0, 1, 1,
1.161993, -0.006872686, 0.8810884, 0, 0, 0, 1, 1,
1.166239, -0.2711999, 2.011907, 0, 0, 0, 1, 1,
1.167215, 0.4862365, 2.124204, 1, 1, 1, 1, 1,
1.178177, -0.2720782, 1.733231, 1, 1, 1, 1, 1,
1.18009, 1.083809, -0.2255647, 1, 1, 1, 1, 1,
1.180831, 0.06891479, 2.250875, 1, 1, 1, 1, 1,
1.186983, -1.685419, 3.093533, 1, 1, 1, 1, 1,
1.1918, 3.08974, -0.8555084, 1, 1, 1, 1, 1,
1.193097, 0.4654263, 0.1126894, 1, 1, 1, 1, 1,
1.193944, 0.8714989, 1.521918, 1, 1, 1, 1, 1,
1.196663, 0.5194638, 1.276715, 1, 1, 1, 1, 1,
1.212388, 0.1458347, 0.7469795, 1, 1, 1, 1, 1,
1.215111, 0.1853518, 3.243491, 1, 1, 1, 1, 1,
1.218066, 0.2020878, -0.2745932, 1, 1, 1, 1, 1,
1.219502, 0.2731283, 2.483869, 1, 1, 1, 1, 1,
1.224041, -0.4053652, 0.8835845, 1, 1, 1, 1, 1,
1.235309, 0.7834864, 1.242491, 1, 1, 1, 1, 1,
1.236458, -0.4427366, 2.252042, 0, 0, 1, 1, 1,
1.240607, 1.103705, 0.6348093, 1, 0, 0, 1, 1,
1.240857, -0.4170098, 1.702297, 1, 0, 0, 1, 1,
1.24147, 1.554144, 1.414392, 1, 0, 0, 1, 1,
1.247482, 1.289469, -0.0272036, 1, 0, 0, 1, 1,
1.257326, 0.5203491, 1.048452, 1, 0, 0, 1, 1,
1.272668, -1.156463, 1.07892, 0, 0, 0, 1, 1,
1.274315, -0.4647289, 2.964336, 0, 0, 0, 1, 1,
1.283425, -0.6732147, 0.9692379, 0, 0, 0, 1, 1,
1.287793, -0.9362053, 1.722746, 0, 0, 0, 1, 1,
1.292725, 0.8087856, 1.051877, 0, 0, 0, 1, 1,
1.305283, -0.3186769, 2.609625, 0, 0, 0, 1, 1,
1.324186, -0.4451286, 2.597934, 0, 0, 0, 1, 1,
1.328241, 2.576503, 0.158413, 1, 1, 1, 1, 1,
1.328573, 0.4345592, 2.13042, 1, 1, 1, 1, 1,
1.337123, 1.416867, 0.222085, 1, 1, 1, 1, 1,
1.339834, -0.251082, 2.556074, 1, 1, 1, 1, 1,
1.356078, -0.02556276, 1.36568, 1, 1, 1, 1, 1,
1.362869, -0.809567, 1.393312, 1, 1, 1, 1, 1,
1.372648, 0.09862135, 3.6164, 1, 1, 1, 1, 1,
1.382544, -0.1562659, 3.120955, 1, 1, 1, 1, 1,
1.392787, 0.2947181, 1.163531, 1, 1, 1, 1, 1,
1.405829, -0.3049263, 0.78756, 1, 1, 1, 1, 1,
1.408915, -1.207044, 1.909652, 1, 1, 1, 1, 1,
1.415719, 0.7240064, -0.7009569, 1, 1, 1, 1, 1,
1.419171, -0.6334279, 1.977614, 1, 1, 1, 1, 1,
1.422984, 0.4799864, 1.538467, 1, 1, 1, 1, 1,
1.425273, -1.49279, 3.773827, 1, 1, 1, 1, 1,
1.447254, -0.9841689, 1.89029, 0, 0, 1, 1, 1,
1.453745, 0.3969471, 2.039161, 1, 0, 0, 1, 1,
1.460956, 0.01919713, 1.230079, 1, 0, 0, 1, 1,
1.47357, -0.2739936, 1.398887, 1, 0, 0, 1, 1,
1.48016, 1.767277, -0.1304994, 1, 0, 0, 1, 1,
1.484262, 1.129959, 0.05186994, 1, 0, 0, 1, 1,
1.491659, 0.6469819, 2.266171, 0, 0, 0, 1, 1,
1.513704, -0.02526367, 2.165107, 0, 0, 0, 1, 1,
1.517143, -0.0001951803, 2.306674, 0, 0, 0, 1, 1,
1.518747, -1.037823, 1.423287, 0, 0, 0, 1, 1,
1.521808, 1.790499, -0.6397136, 0, 0, 0, 1, 1,
1.523103, 0.8795633, 1.884672, 0, 0, 0, 1, 1,
1.523343, 0.193765, -0.02361422, 0, 0, 0, 1, 1,
1.524858, -0.4244473, 1.447191, 1, 1, 1, 1, 1,
1.525483, -1.025946, 1.786085, 1, 1, 1, 1, 1,
1.52888, -0.3534684, 2.085241, 1, 1, 1, 1, 1,
1.538419, -0.4400082, 3.254748, 1, 1, 1, 1, 1,
1.539248, 0.9606479, -0.332927, 1, 1, 1, 1, 1,
1.539676, -0.239878, 1.515314, 1, 1, 1, 1, 1,
1.544939, -0.01994705, 1.213429, 1, 1, 1, 1, 1,
1.550584, -0.2855414, -1.032941, 1, 1, 1, 1, 1,
1.551964, -0.6322512, 2.614554, 1, 1, 1, 1, 1,
1.558481, 1.091049, 0.0603134, 1, 1, 1, 1, 1,
1.573401, -0.05381717, 3.189554, 1, 1, 1, 1, 1,
1.586969, -0.08304326, 3.338593, 1, 1, 1, 1, 1,
1.589107, -0.8895862, 0.8020946, 1, 1, 1, 1, 1,
1.594885, 0.5257506, 0.8556709, 1, 1, 1, 1, 1,
1.61369, 0.975616, 0.351478, 1, 1, 1, 1, 1,
1.64122, -1.546336, 2.8626, 0, 0, 1, 1, 1,
1.642981, -2.346462, 4.520209, 1, 0, 0, 1, 1,
1.653316, 0.4048452, 0.7940127, 1, 0, 0, 1, 1,
1.680847, -0.02629376, 0.6755239, 1, 0, 0, 1, 1,
1.688748, -0.02502985, 1.40685, 1, 0, 0, 1, 1,
1.692099, -0.5750796, 2.330733, 1, 0, 0, 1, 1,
1.708563, 2.095686, 0.7939803, 0, 0, 0, 1, 1,
1.725934, 0.6747747, 0.9066827, 0, 0, 0, 1, 1,
1.759897, -1.806558, 2.257468, 0, 0, 0, 1, 1,
1.764105, 1.172235, 0.349661, 0, 0, 0, 1, 1,
1.773418, -1.306536, -0.06651992, 0, 0, 0, 1, 1,
1.784268, 0.4228982, 3.072423, 0, 0, 0, 1, 1,
1.811444, 0.799479, 1.070299, 0, 0, 0, 1, 1,
1.841648, -0.9818307, 1.248037, 1, 1, 1, 1, 1,
1.848144, 0.7322723, 0.1312776, 1, 1, 1, 1, 1,
1.850322, 1.088884, -0.3058248, 1, 1, 1, 1, 1,
1.870846, -0.3185009, 0.02065351, 1, 1, 1, 1, 1,
1.899538, 1.257148, 0.8224115, 1, 1, 1, 1, 1,
1.960047, 1.302209, 3.196952, 1, 1, 1, 1, 1,
1.965963, -0.7796979, 2.935667, 1, 1, 1, 1, 1,
1.987306, -1.374297, 1.132356, 1, 1, 1, 1, 1,
2.016291, -1.238176, 2.694839, 1, 1, 1, 1, 1,
2.048748, -0.3465797, 2.830897, 1, 1, 1, 1, 1,
2.051463, -0.7222893, 1.816912, 1, 1, 1, 1, 1,
2.061164, -1.547091, 1.822248, 1, 1, 1, 1, 1,
2.08179, 1.735498, 1.495728, 1, 1, 1, 1, 1,
2.137942, -1.060766, 3.775184, 1, 1, 1, 1, 1,
2.150261, 1.305731, 0.6810375, 1, 1, 1, 1, 1,
2.191223, 0.3304795, 1.517187, 0, 0, 1, 1, 1,
2.192388, -1.680654, 3.081192, 1, 0, 0, 1, 1,
2.193769, -0.9610102, 1.451919, 1, 0, 0, 1, 1,
2.209012, 0.4519568, 1.710929, 1, 0, 0, 1, 1,
2.224272, -0.2398206, 2.234936, 1, 0, 0, 1, 1,
2.263161, 0.8400128, 2.650652, 1, 0, 0, 1, 1,
2.333324, -1.324138, 0.1434359, 0, 0, 0, 1, 1,
2.422767, -1.3363, 0.9696621, 0, 0, 0, 1, 1,
2.496541, -0.9323168, 2.543431, 0, 0, 0, 1, 1,
2.563941, 1.552432, 0.910499, 0, 0, 0, 1, 1,
2.617169, -0.3716505, 2.537727, 0, 0, 0, 1, 1,
2.773889, -0.7916546, 2.450264, 0, 0, 0, 1, 1,
2.814617, 0.01150198, 2.286314, 0, 0, 0, 1, 1,
2.8355, -0.05319008, 1.134605, 1, 1, 1, 1, 1,
2.837103, 0.0462266, 2.662173, 1, 1, 1, 1, 1,
2.87672, 1.026316, 1.753778, 1, 1, 1, 1, 1,
2.902874, 0.5504199, 0.5263509, 1, 1, 1, 1, 1,
3.253495, -0.5568914, 2.522355, 1, 1, 1, 1, 1,
3.283458, 0.5584318, -1.010637, 1, 1, 1, 1, 1,
3.43516, 1.035806, 0.2450097, 1, 1, 1, 1, 1
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
var radius = 9.206573;
var distance = 32.3377;
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
mvMatrix.translate( -0.2462811, -0.01216865, -0.2717683 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.3377);
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
