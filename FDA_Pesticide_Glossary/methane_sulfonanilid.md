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
-3.432969, 0.01102973, -1.561515, 1, 0, 0, 1,
-3.219374, 1.058545, -0.7378011, 1, 0.007843138, 0, 1,
-3.043138, -0.7794806, -2.182353, 1, 0.01176471, 0, 1,
-3.023413, -1.272663, -2.140012, 1, 0.01960784, 0, 1,
-2.702385, 1.148152, -0.344186, 1, 0.02352941, 0, 1,
-2.699254, 0.8281952, -1.573689, 1, 0.03137255, 0, 1,
-2.61598, -0.03656916, -2.96265, 1, 0.03529412, 0, 1,
-2.602414, -0.7585192, -2.831278, 1, 0.04313726, 0, 1,
-2.521772, 0.5098377, -2.483766, 1, 0.04705882, 0, 1,
-2.515938, -1.994714, -1.828902, 1, 0.05490196, 0, 1,
-2.387734, 0.7696189, -1.029623, 1, 0.05882353, 0, 1,
-2.374311, -1.155719, -2.885175, 1, 0.06666667, 0, 1,
-2.36295, -0.1493971, -1.274636, 1, 0.07058824, 0, 1,
-2.352207, -1.328855, -2.915813, 1, 0.07843138, 0, 1,
-2.345269, 1.193149, 0.4410488, 1, 0.08235294, 0, 1,
-2.335501, 0.6740677, -1.909275, 1, 0.09019608, 0, 1,
-2.285526, -0.007179054, -1.540335, 1, 0.09411765, 0, 1,
-2.185484, 0.3986569, 0.4764762, 1, 0.1019608, 0, 1,
-2.141309, 0.675121, -0.4101438, 1, 0.1098039, 0, 1,
-2.105015, 1.480556, -0.2447113, 1, 0.1137255, 0, 1,
-2.093271, -1.324953, -1.321907, 1, 0.1215686, 0, 1,
-2.070212, 0.3253433, -1.031406, 1, 0.1254902, 0, 1,
-2.04229, -1.537743, -2.047537, 1, 0.1333333, 0, 1,
-2.028522, 0.8231114, -0.2743467, 1, 0.1372549, 0, 1,
-2.013459, 1.284449, 0.3316833, 1, 0.145098, 0, 1,
-1.965354, 0.8697333, -0.5249099, 1, 0.1490196, 0, 1,
-1.961537, -3.179976, -2.189608, 1, 0.1568628, 0, 1,
-1.937729, -0.09153824, -2.281862, 1, 0.1607843, 0, 1,
-1.937482, 0.6888242, -1.072472, 1, 0.1686275, 0, 1,
-1.934958, 0.8384938, -2.646734, 1, 0.172549, 0, 1,
-1.933601, 0.104687, -0.1277036, 1, 0.1803922, 0, 1,
-1.930249, -0.001639012, -1.537615, 1, 0.1843137, 0, 1,
-1.90212, 0.2470184, -1.745195, 1, 0.1921569, 0, 1,
-1.858475, -0.5153649, -1.599661, 1, 0.1960784, 0, 1,
-1.857744, 1.245371, -2.057011, 1, 0.2039216, 0, 1,
-1.809673, -1.046145, -1.131275, 1, 0.2117647, 0, 1,
-1.803661, -1.619421, -1.766526, 1, 0.2156863, 0, 1,
-1.799815, -0.04495351, -2.125356, 1, 0.2235294, 0, 1,
-1.797261, -0.9752173, -2.58729, 1, 0.227451, 0, 1,
-1.781734, -1.219707, -1.594263, 1, 0.2352941, 0, 1,
-1.774932, 1.000314, -1.79933, 1, 0.2392157, 0, 1,
-1.774822, -0.3219347, -0.5410358, 1, 0.2470588, 0, 1,
-1.773139, -0.2201196, -0.7958649, 1, 0.2509804, 0, 1,
-1.772528, -0.1411954, -2.86922, 1, 0.2588235, 0, 1,
-1.768354, -0.6444455, -0.3690123, 1, 0.2627451, 0, 1,
-1.756446, -1.215146, -1.821169, 1, 0.2705882, 0, 1,
-1.752891, -0.05548126, -0.3476053, 1, 0.2745098, 0, 1,
-1.719926, 0.5741021, 0.5362391, 1, 0.282353, 0, 1,
-1.702763, -0.2651531, -1.839045, 1, 0.2862745, 0, 1,
-1.692108, 0.9220296, -1.203979, 1, 0.2941177, 0, 1,
-1.681653, 2.217791, -0.4388563, 1, 0.3019608, 0, 1,
-1.680184, -0.0991366, -1.579961, 1, 0.3058824, 0, 1,
-1.674434, -2.326315, -2.024948, 1, 0.3137255, 0, 1,
-1.637986, -1.439248, -3.01546, 1, 0.3176471, 0, 1,
-1.617123, 0.9469436, 0.2196532, 1, 0.3254902, 0, 1,
-1.614653, 0.3920181, 1.228354, 1, 0.3294118, 0, 1,
-1.596736, 1.57876, -1.722525, 1, 0.3372549, 0, 1,
-1.593087, -0.7369092, -2.421852, 1, 0.3411765, 0, 1,
-1.592065, -1.316445, -1.027887, 1, 0.3490196, 0, 1,
-1.590809, 0.1113111, -1.175417, 1, 0.3529412, 0, 1,
-1.590653, -1.221459, -1.725556, 1, 0.3607843, 0, 1,
-1.58275, 1.579909, -2.70156, 1, 0.3647059, 0, 1,
-1.582489, -0.6087239, -2.478762, 1, 0.372549, 0, 1,
-1.578654, -0.1321765, -2.186905, 1, 0.3764706, 0, 1,
-1.575113, -1.400888, -3.551295, 1, 0.3843137, 0, 1,
-1.571756, -1.585292, -2.32971, 1, 0.3882353, 0, 1,
-1.570832, 1.603251, 0.4042368, 1, 0.3960784, 0, 1,
-1.567873, -0.9274446, -1.537276, 1, 0.4039216, 0, 1,
-1.553832, 0.004131766, -1.428413, 1, 0.4078431, 0, 1,
-1.544606, 1.349928, -3.45645, 1, 0.4156863, 0, 1,
-1.538805, 0.6334167, -0.1552219, 1, 0.4196078, 0, 1,
-1.524974, -1.001499, -2.071275, 1, 0.427451, 0, 1,
-1.521179, -1.426832, -0.3658747, 1, 0.4313726, 0, 1,
-1.517009, -0.2098745, -2.175809, 1, 0.4392157, 0, 1,
-1.50963, 0.1382382, -1.078484, 1, 0.4431373, 0, 1,
-1.498883, 1.817521, -0.2467793, 1, 0.4509804, 0, 1,
-1.491463, 2.394247, -1.276209, 1, 0.454902, 0, 1,
-1.489632, 0.7261328, -2.797462, 1, 0.4627451, 0, 1,
-1.489335, 1.152989, 0.5290357, 1, 0.4666667, 0, 1,
-1.488215, 0.1273561, -1.931579, 1, 0.4745098, 0, 1,
-1.479442, 0.6713217, -1.727028, 1, 0.4784314, 0, 1,
-1.477999, -0.5446092, -2.263727, 1, 0.4862745, 0, 1,
-1.473087, -1.569232, -3.071605, 1, 0.4901961, 0, 1,
-1.472158, -1.198893, -1.587576, 1, 0.4980392, 0, 1,
-1.469242, -0.09868465, -1.546576, 1, 0.5058824, 0, 1,
-1.440975, -1.958652, -2.812406, 1, 0.509804, 0, 1,
-1.4402, 0.08699714, -2.560457, 1, 0.5176471, 0, 1,
-1.435457, 1.989082, 1.14172, 1, 0.5215687, 0, 1,
-1.434066, -1.416609, -2.665244, 1, 0.5294118, 0, 1,
-1.425578, -0.2016102, -1.768811, 1, 0.5333334, 0, 1,
-1.40917, -0.5775055, -2.416687, 1, 0.5411765, 0, 1,
-1.405395, 1.157698, -1.05266, 1, 0.5450981, 0, 1,
-1.401228, -0.1429157, -2.35396, 1, 0.5529412, 0, 1,
-1.392856, 1.286177, -1.600676, 1, 0.5568628, 0, 1,
-1.391866, -1.501133, -2.570964, 1, 0.5647059, 0, 1,
-1.391464, -0.2004857, -1.787373, 1, 0.5686275, 0, 1,
-1.368877, -0.8161195, -2.567153, 1, 0.5764706, 0, 1,
-1.36065, 1.031733, -0.5003831, 1, 0.5803922, 0, 1,
-1.350031, 1.062433, -1.751194, 1, 0.5882353, 0, 1,
-1.349728, -0.8132021, -1.820162, 1, 0.5921569, 0, 1,
-1.349419, -0.9413823, -1.858288, 1, 0.6, 0, 1,
-1.339801, 0.3640836, -1.525884, 1, 0.6078432, 0, 1,
-1.339283, 0.5396984, -1.882985, 1, 0.6117647, 0, 1,
-1.33881, -0.5476515, -1.243095, 1, 0.6196079, 0, 1,
-1.337246, 0.01041328, -0.510551, 1, 0.6235294, 0, 1,
-1.33342, 0.1639303, -1.644259, 1, 0.6313726, 0, 1,
-1.328631, 0.1748441, 2.652471, 1, 0.6352941, 0, 1,
-1.317392, 0.4284868, -0.8011973, 1, 0.6431373, 0, 1,
-1.308181, -0.2781952, -1.931741, 1, 0.6470588, 0, 1,
-1.301558, -0.7231901, -1.33951, 1, 0.654902, 0, 1,
-1.296823, -0.6207556, -2.127731, 1, 0.6588235, 0, 1,
-1.27038, 1.160409, -1.587801, 1, 0.6666667, 0, 1,
-1.260456, 0.4232669, -0.3841892, 1, 0.6705883, 0, 1,
-1.25994, 1.341951, -0.06212563, 1, 0.6784314, 0, 1,
-1.247403, -0.2710996, -1.357795, 1, 0.682353, 0, 1,
-1.244219, -0.7255555, -2.985261, 1, 0.6901961, 0, 1,
-1.240921, 0.1493369, -2.093308, 1, 0.6941177, 0, 1,
-1.233895, 0.2210349, -1.083944, 1, 0.7019608, 0, 1,
-1.226718, 0.3687955, 0.07178029, 1, 0.7098039, 0, 1,
-1.224818, 2.09693, 0.0007474343, 1, 0.7137255, 0, 1,
-1.205353, 1.098855, -1.20615, 1, 0.7215686, 0, 1,
-1.197794, 0.01879891, -1.642032, 1, 0.7254902, 0, 1,
-1.194782, -0.9885464, -2.064768, 1, 0.7333333, 0, 1,
-1.193791, 0.7179738, -2.573041, 1, 0.7372549, 0, 1,
-1.191814, -0.8489115, -3.266202, 1, 0.7450981, 0, 1,
-1.187487, 0.8901963, -0.2784879, 1, 0.7490196, 0, 1,
-1.18101, 1.038852, -0.2082086, 1, 0.7568628, 0, 1,
-1.176426, -0.9272344, -3.350284, 1, 0.7607843, 0, 1,
-1.160313, -0.5967091, -2.79139, 1, 0.7686275, 0, 1,
-1.15708, 0.2752982, -1.521445, 1, 0.772549, 0, 1,
-1.141349, -0.6415306, -0.7859198, 1, 0.7803922, 0, 1,
-1.138458, 0.4373493, -0.8758743, 1, 0.7843137, 0, 1,
-1.134565, 0.6187278, -0.07292096, 1, 0.7921569, 0, 1,
-1.132793, -2.020953, -1.815154, 1, 0.7960784, 0, 1,
-1.127814, -1.838184, -3.154655, 1, 0.8039216, 0, 1,
-1.124139, 1.294281, 0.3839563, 1, 0.8117647, 0, 1,
-1.115764, -0.1793204, -2.412388, 1, 0.8156863, 0, 1,
-1.103968, -0.8424521, -1.851005, 1, 0.8235294, 0, 1,
-1.101099, 1.35133, 0.2931022, 1, 0.827451, 0, 1,
-1.086196, 1.264542, -0.6252691, 1, 0.8352941, 0, 1,
-1.076237, 1.165715, -1.43801, 1, 0.8392157, 0, 1,
-1.072531, 0.2088183, -2.477862, 1, 0.8470588, 0, 1,
-1.070683, 0.3069606, -2.655042, 1, 0.8509804, 0, 1,
-1.051347, -1.986871, -2.814613, 1, 0.8588235, 0, 1,
-1.048507, 0.1935757, -3.018345, 1, 0.8627451, 0, 1,
-1.048224, -1.6544, -1.247686, 1, 0.8705882, 0, 1,
-1.03961, 0.8315676, 0.6090625, 1, 0.8745098, 0, 1,
-1.037595, 0.6234304, -2.698922, 1, 0.8823529, 0, 1,
-1.035166, 0.9194294, -0.2939597, 1, 0.8862745, 0, 1,
-1.027491, -0.5094588, -1.45645, 1, 0.8941177, 0, 1,
-1.016685, -1.423444, -2.621578, 1, 0.8980392, 0, 1,
-1.014281, 0.5220892, 0.5666141, 1, 0.9058824, 0, 1,
-1.011173, -0.07414968, -1.208944, 1, 0.9137255, 0, 1,
-1.010759, 0.5951252, -1.216563, 1, 0.9176471, 0, 1,
-1.004904, -0.5122188, -2.335272, 1, 0.9254902, 0, 1,
-1.002305, -1.450084, -3.217745, 1, 0.9294118, 0, 1,
-0.9987943, -1.242515, 0.2776523, 1, 0.9372549, 0, 1,
-0.996375, 1.465517, 0.7522904, 1, 0.9411765, 0, 1,
-0.9951076, -0.2821766, -2.796273, 1, 0.9490196, 0, 1,
-0.9927158, 0.6223532, -1.826297, 1, 0.9529412, 0, 1,
-0.9883485, 0.1712456, -2.007719, 1, 0.9607843, 0, 1,
-0.9878172, -1.186324, -2.60084, 1, 0.9647059, 0, 1,
-0.9856344, 0.469825, -2.254992, 1, 0.972549, 0, 1,
-0.9828023, -0.6014506, -3.107527, 1, 0.9764706, 0, 1,
-0.9804368, 0.5024356, -1.7802, 1, 0.9843137, 0, 1,
-0.9793288, 1.092617, 0.3067801, 1, 0.9882353, 0, 1,
-0.9725554, -0.01021876, -1.769334, 1, 0.9960784, 0, 1,
-0.9697669, -0.4203381, -2.612267, 0.9960784, 1, 0, 1,
-0.9628569, -0.4226213, -0.2707544, 0.9921569, 1, 0, 1,
-0.962723, 0.4482866, 0.5543137, 0.9843137, 1, 0, 1,
-0.9576001, 0.4441424, -1.084755, 0.9803922, 1, 0, 1,
-0.9540546, 0.1057442, 0.2767067, 0.972549, 1, 0, 1,
-0.9510738, 0.5294361, -0.3756533, 0.9686275, 1, 0, 1,
-0.9482486, 0.03820611, -1.233106, 0.9607843, 1, 0, 1,
-0.9441674, 0.1371592, -0.9676558, 0.9568627, 1, 0, 1,
-0.9390104, -0.200816, -3.407197, 0.9490196, 1, 0, 1,
-0.9381097, 0.6740095, -0.389075, 0.945098, 1, 0, 1,
-0.9342564, 1.265756, -0.3321314, 0.9372549, 1, 0, 1,
-0.9275972, 0.2685367, -1.137112, 0.9333333, 1, 0, 1,
-0.9253563, -1.649696, -1.548236, 0.9254902, 1, 0, 1,
-0.9247019, 0.2898854, -0.8543497, 0.9215686, 1, 0, 1,
-0.9173505, -0.5711104, -1.617016, 0.9137255, 1, 0, 1,
-0.9162523, 1.469212, 1.115031, 0.9098039, 1, 0, 1,
-0.902926, 2.153261, -0.07604311, 0.9019608, 1, 0, 1,
-0.8986966, -0.1580338, 0.6876726, 0.8941177, 1, 0, 1,
-0.8965649, -0.2744201, -2.611638, 0.8901961, 1, 0, 1,
-0.8964922, -0.02820618, -1.749457, 0.8823529, 1, 0, 1,
-0.8913243, -1.532127, -1.884816, 0.8784314, 1, 0, 1,
-0.8903641, -0.3902626, -2.350338, 0.8705882, 1, 0, 1,
-0.8894863, 0.6690916, 0.03995137, 0.8666667, 1, 0, 1,
-0.8782831, -1.292019, -1.403673, 0.8588235, 1, 0, 1,
-0.877538, -0.0718036, -0.03631765, 0.854902, 1, 0, 1,
-0.8759257, -2.036283, -3.308356, 0.8470588, 1, 0, 1,
-0.8741763, 0.6959331, -0.8793136, 0.8431373, 1, 0, 1,
-0.8728288, -1.148987, -3.518272, 0.8352941, 1, 0, 1,
-0.8693683, 0.01670303, -1.659113, 0.8313726, 1, 0, 1,
-0.8662672, -1.105637, -1.469139, 0.8235294, 1, 0, 1,
-0.8650963, -0.1138597, -1.35202, 0.8196079, 1, 0, 1,
-0.8526196, -0.1777117, -1.853446, 0.8117647, 1, 0, 1,
-0.8501257, -0.1779591, -0.8380802, 0.8078431, 1, 0, 1,
-0.8483046, -0.6749151, -3.735109, 0.8, 1, 0, 1,
-0.8426976, 0.4304888, 0.6544765, 0.7921569, 1, 0, 1,
-0.8374867, 0.2424715, -1.238449, 0.7882353, 1, 0, 1,
-0.834008, -1.734991, -1.731953, 0.7803922, 1, 0, 1,
-0.8338693, 0.6035488, 0.1265962, 0.7764706, 1, 0, 1,
-0.8335804, -2.275615, -2.702682, 0.7686275, 1, 0, 1,
-0.8320461, 0.6285604, -0.2825885, 0.7647059, 1, 0, 1,
-0.8304599, -1.269632, -1.084661, 0.7568628, 1, 0, 1,
-0.8298368, 0.1894894, -0.7152787, 0.7529412, 1, 0, 1,
-0.8240879, -1.931738, -2.383281, 0.7450981, 1, 0, 1,
-0.8111242, 2.229443, -0.3224074, 0.7411765, 1, 0, 1,
-0.8074996, 0.8811216, 0.2865876, 0.7333333, 1, 0, 1,
-0.8073554, -0.9873784, -0.9561421, 0.7294118, 1, 0, 1,
-0.8057591, 0.327214, -2.690643, 0.7215686, 1, 0, 1,
-0.801518, 0.5095659, -1.102567, 0.7176471, 1, 0, 1,
-0.8001373, -0.9903055, -4.273447, 0.7098039, 1, 0, 1,
-0.7976326, 0.3580832, -1.738343, 0.7058824, 1, 0, 1,
-0.7940359, 1.540761, -3.803208, 0.6980392, 1, 0, 1,
-0.7883704, 1.434397, -1.468178, 0.6901961, 1, 0, 1,
-0.7867639, -0.7163514, -1.814541, 0.6862745, 1, 0, 1,
-0.7865099, 2.677844, -1.180123, 0.6784314, 1, 0, 1,
-0.7860571, -0.6863334, -1.323777, 0.6745098, 1, 0, 1,
-0.7858272, 0.2626102, -3.01682, 0.6666667, 1, 0, 1,
-0.7763512, 1.009412, 2.667342, 0.6627451, 1, 0, 1,
-0.7753854, -0.5522123, -2.864822, 0.654902, 1, 0, 1,
-0.7715451, 1.262076, -0.2498501, 0.6509804, 1, 0, 1,
-0.7685342, -1.578324, -2.658028, 0.6431373, 1, 0, 1,
-0.7665039, -0.02446237, -0.0940958, 0.6392157, 1, 0, 1,
-0.7622853, 1.174122, 0.04071792, 0.6313726, 1, 0, 1,
-0.7494628, 0.8189603, -1.364686, 0.627451, 1, 0, 1,
-0.747676, -0.2420672, -1.392475, 0.6196079, 1, 0, 1,
-0.744393, 2.035849, -1.092449, 0.6156863, 1, 0, 1,
-0.7422619, 1.356615, -2.110999, 0.6078432, 1, 0, 1,
-0.7362458, -1.972474, -5.112362, 0.6039216, 1, 0, 1,
-0.7338418, -1.383848, -2.861814, 0.5960785, 1, 0, 1,
-0.7304907, -0.2979878, -4.096191, 0.5882353, 1, 0, 1,
-0.7280684, -2.571436, -2.125166, 0.5843138, 1, 0, 1,
-0.7237251, 0.290696, -1.886884, 0.5764706, 1, 0, 1,
-0.7220866, 0.1908102, -1.754548, 0.572549, 1, 0, 1,
-0.7190318, 0.522123, -1.585033, 0.5647059, 1, 0, 1,
-0.7118716, -0.7751489, -0.01450188, 0.5607843, 1, 0, 1,
-0.7111017, 2.677553, -0.6765285, 0.5529412, 1, 0, 1,
-0.7062436, -0.5892689, -2.765633, 0.5490196, 1, 0, 1,
-0.7010236, -1.080469, -4.374209, 0.5411765, 1, 0, 1,
-0.697589, 0.2589585, -0.7844287, 0.5372549, 1, 0, 1,
-0.6940176, -0.3507446, -1.277784, 0.5294118, 1, 0, 1,
-0.6933923, -1.051088, -3.757123, 0.5254902, 1, 0, 1,
-0.6912918, 0.2893998, 0.7667145, 0.5176471, 1, 0, 1,
-0.6911669, 1.093691, -1.388273, 0.5137255, 1, 0, 1,
-0.6823868, -2.553622, -4.33106, 0.5058824, 1, 0, 1,
-0.6809456, 0.5099337, -0.695492, 0.5019608, 1, 0, 1,
-0.6784733, 1.503978, -0.3256746, 0.4941176, 1, 0, 1,
-0.6759073, 0.4505174, -0.2445417, 0.4862745, 1, 0, 1,
-0.6751356, 0.5848076, -1.073214, 0.4823529, 1, 0, 1,
-0.6721057, 0.7658059, -0.307444, 0.4745098, 1, 0, 1,
-0.6699128, 1.477415, -0.8149342, 0.4705882, 1, 0, 1,
-0.6663922, -0.074538, -0.5296137, 0.4627451, 1, 0, 1,
-0.6591821, 0.14943, 0.5352312, 0.4588235, 1, 0, 1,
-0.6591185, -0.4138953, -1.681438, 0.4509804, 1, 0, 1,
-0.6586183, -1.546021, -1.645607, 0.4470588, 1, 0, 1,
-0.6579431, -0.4172256, -3.575474, 0.4392157, 1, 0, 1,
-0.6566944, -0.1929435, -0.5553712, 0.4352941, 1, 0, 1,
-0.654446, 1.389114, -1.382328, 0.427451, 1, 0, 1,
-0.6489274, -1.01646, -2.86669, 0.4235294, 1, 0, 1,
-0.648805, 1.720872, 0.2957408, 0.4156863, 1, 0, 1,
-0.6469569, 2.265752, -0.1070335, 0.4117647, 1, 0, 1,
-0.640599, 1.187628, -1.934561, 0.4039216, 1, 0, 1,
-0.6404935, 0.8178399, -1.355548, 0.3960784, 1, 0, 1,
-0.6390862, 1.878166, -0.08744831, 0.3921569, 1, 0, 1,
-0.6379617, 1.655005, -0.9422842, 0.3843137, 1, 0, 1,
-0.6365204, -0.7109695, -3.610956, 0.3803922, 1, 0, 1,
-0.6351429, -0.2122646, -2.248652, 0.372549, 1, 0, 1,
-0.6343026, 0.1586853, -1.518446, 0.3686275, 1, 0, 1,
-0.6308373, 0.004379439, -0.2847288, 0.3607843, 1, 0, 1,
-0.6272103, 0.2633341, -0.08501918, 0.3568628, 1, 0, 1,
-0.6232014, 0.6813071, 1.104196, 0.3490196, 1, 0, 1,
-0.619377, 0.9012807, -0.672041, 0.345098, 1, 0, 1,
-0.6160012, 0.591023, -1.311466, 0.3372549, 1, 0, 1,
-0.6141682, 1.201071, -2.043239, 0.3333333, 1, 0, 1,
-0.6094687, -0.3194657, -3.564542, 0.3254902, 1, 0, 1,
-0.6094474, 1.62034, -1.004474, 0.3215686, 1, 0, 1,
-0.6070918, -0.3641264, -2.542505, 0.3137255, 1, 0, 1,
-0.6050166, 0.7817413, 0.03987252, 0.3098039, 1, 0, 1,
-0.592193, -1.222049, -2.616469, 0.3019608, 1, 0, 1,
-0.5921202, -0.9819899, -2.905005, 0.2941177, 1, 0, 1,
-0.5840657, -1.836057, -2.79463, 0.2901961, 1, 0, 1,
-0.5830593, -0.7883145, -2.002428, 0.282353, 1, 0, 1,
-0.5808599, 1.078944, -0.7371498, 0.2784314, 1, 0, 1,
-0.562126, 0.7838407, -2.48004, 0.2705882, 1, 0, 1,
-0.561727, -0.3646491, -2.823464, 0.2666667, 1, 0, 1,
-0.5569794, -1.64728, -2.83371, 0.2588235, 1, 0, 1,
-0.5526908, 0.3453902, 0.2338117, 0.254902, 1, 0, 1,
-0.5506374, 0.114914, -1.585778, 0.2470588, 1, 0, 1,
-0.5479755, 0.7421643, 0.5218467, 0.2431373, 1, 0, 1,
-0.5451953, -0.3262018, -2.430681, 0.2352941, 1, 0, 1,
-0.5366483, 0.2008596, -0.3749979, 0.2313726, 1, 0, 1,
-0.5325601, 0.1154547, -3.958118, 0.2235294, 1, 0, 1,
-0.5311395, -0.1643598, -3.611087, 0.2196078, 1, 0, 1,
-0.5310578, 0.04087594, -1.827035, 0.2117647, 1, 0, 1,
-0.5298586, 0.4760077, -0.5927715, 0.2078431, 1, 0, 1,
-0.5271428, 0.3542247, -1.052052, 0.2, 1, 0, 1,
-0.5269436, -0.4330681, -2.201138, 0.1921569, 1, 0, 1,
-0.5251034, -0.5124369, -4.174324, 0.1882353, 1, 0, 1,
-0.5208273, 1.825824, 0.4201271, 0.1803922, 1, 0, 1,
-0.5186164, 0.4466955, -1.478024, 0.1764706, 1, 0, 1,
-0.5172458, -0.3015397, -1.94463, 0.1686275, 1, 0, 1,
-0.51406, 0.6192494, 0.3405614, 0.1647059, 1, 0, 1,
-0.5120257, -0.1464312, -3.031977, 0.1568628, 1, 0, 1,
-0.5105195, 0.8320935, 0.2493244, 0.1529412, 1, 0, 1,
-0.5029862, -0.2390556, -1.522567, 0.145098, 1, 0, 1,
-0.4979303, -1.711293, -3.478963, 0.1411765, 1, 0, 1,
-0.4962915, -0.5275151, -2.967031, 0.1333333, 1, 0, 1,
-0.4961677, 1.151067, -0.773511, 0.1294118, 1, 0, 1,
-0.490119, 0.7465435, -0.8998151, 0.1215686, 1, 0, 1,
-0.4895824, -1.722157, -3.153163, 0.1176471, 1, 0, 1,
-0.4835854, -0.6931431, -2.160759, 0.1098039, 1, 0, 1,
-0.4822608, -0.6478896, -3.381629, 0.1058824, 1, 0, 1,
-0.4800876, 0.2312743, -0.2836986, 0.09803922, 1, 0, 1,
-0.4798723, 1.711789, -0.4852765, 0.09019608, 1, 0, 1,
-0.4796381, 0.8440216, 0.35946, 0.08627451, 1, 0, 1,
-0.4783496, 0.3966514, -0.7094514, 0.07843138, 1, 0, 1,
-0.4747692, -0.06396455, -2.742692, 0.07450981, 1, 0, 1,
-0.4704086, 1.895765, 0.590107, 0.06666667, 1, 0, 1,
-0.4660959, -1.040035, -2.769001, 0.0627451, 1, 0, 1,
-0.4658138, -1.014317, -3.642138, 0.05490196, 1, 0, 1,
-0.4597949, -0.6673987, -1.046747, 0.05098039, 1, 0, 1,
-0.4552294, 0.1059086, -0.8765705, 0.04313726, 1, 0, 1,
-0.4456432, -0.4795945, -0.6750172, 0.03921569, 1, 0, 1,
-0.4442622, -0.004637323, -2.672232, 0.03137255, 1, 0, 1,
-0.443731, 1.177389, -0.1269158, 0.02745098, 1, 0, 1,
-0.4430301, -0.4529215, -2.842054, 0.01960784, 1, 0, 1,
-0.4421371, -0.04756802, -2.218129, 0.01568628, 1, 0, 1,
-0.4390716, -0.2031376, -1.372872, 0.007843138, 1, 0, 1,
-0.4375384, 0.1519015, -0.4715008, 0.003921569, 1, 0, 1,
-0.431925, -2.683837, -3.109823, 0, 1, 0.003921569, 1,
-0.4238791, -0.5048131, -3.047539, 0, 1, 0.01176471, 1,
-0.42314, -0.2007626, -3.257129, 0, 1, 0.01568628, 1,
-0.4229676, -1.903067, -3.290079, 0, 1, 0.02352941, 1,
-0.4206274, 0.5840114, -0.3541557, 0, 1, 0.02745098, 1,
-0.4188779, -0.3897682, -2.113374, 0, 1, 0.03529412, 1,
-0.4182182, -0.1343583, -2.201867, 0, 1, 0.03921569, 1,
-0.4135554, -0.2791625, -1.789834, 0, 1, 0.04705882, 1,
-0.412217, -0.6539387, -1.101538, 0, 1, 0.05098039, 1,
-0.4067157, -0.5078868, -1.324673, 0, 1, 0.05882353, 1,
-0.4053192, -3.180721, -3.256649, 0, 1, 0.0627451, 1,
-0.4021401, -0.4708687, -4.888466, 0, 1, 0.07058824, 1,
-0.3965491, -0.4940274, -2.017668, 0, 1, 0.07450981, 1,
-0.3896783, -1.367955, -3.106575, 0, 1, 0.08235294, 1,
-0.3891969, -0.5878214, -3.98147, 0, 1, 0.08627451, 1,
-0.3870694, 0.1795408, -1.64689, 0, 1, 0.09411765, 1,
-0.3816939, 0.07153394, 0.2253515, 0, 1, 0.1019608, 1,
-0.381665, 0.3876498, -0.937887, 0, 1, 0.1058824, 1,
-0.3795706, 0.2006198, -0.2185594, 0, 1, 0.1137255, 1,
-0.3783927, -0.8729644, -3.526826, 0, 1, 0.1176471, 1,
-0.37331, -0.1257153, -3.534934, 0, 1, 0.1254902, 1,
-0.3725697, 0.8899519, -0.04880602, 0, 1, 0.1294118, 1,
-0.3692315, 1.099232, -0.1340892, 0, 1, 0.1372549, 1,
-0.3656273, -0.8065538, -1.949422, 0, 1, 0.1411765, 1,
-0.3624204, 0.8150438, -0.4019252, 0, 1, 0.1490196, 1,
-0.3623422, 1.515394, -0.3302436, 0, 1, 0.1529412, 1,
-0.360707, 0.02337598, -1.899865, 0, 1, 0.1607843, 1,
-0.3602574, 0.03970173, -0.4795801, 0, 1, 0.1647059, 1,
-0.3561391, -0.7665328, -2.075676, 0, 1, 0.172549, 1,
-0.3532348, -0.3489799, -2.69067, 0, 1, 0.1764706, 1,
-0.3437313, -0.1304964, -2.6086, 0, 1, 0.1843137, 1,
-0.3379946, -0.344661, -3.573179, 0, 1, 0.1882353, 1,
-0.3338163, -0.4922667, -3.986666, 0, 1, 0.1960784, 1,
-0.3277866, -0.2535684, -1.648759, 0, 1, 0.2039216, 1,
-0.3275378, 0.3911132, -1.624849, 0, 1, 0.2078431, 1,
-0.3257676, 0.5038609, 0.4279031, 0, 1, 0.2156863, 1,
-0.3244691, -0.9682975, -1.871054, 0, 1, 0.2196078, 1,
-0.3205778, 1.502021, 1.519203, 0, 1, 0.227451, 1,
-0.3204356, 0.8124304, 0.2119029, 0, 1, 0.2313726, 1,
-0.3194329, 0.6507, -1.53649, 0, 1, 0.2392157, 1,
-0.3191366, 1.214607, 0.07723514, 0, 1, 0.2431373, 1,
-0.3168002, -0.06660299, -3.085705, 0, 1, 0.2509804, 1,
-0.2995245, -0.1305752, -2.311044, 0, 1, 0.254902, 1,
-0.2942088, -0.3841053, -2.697582, 0, 1, 0.2627451, 1,
-0.2933429, -0.07996202, -1.686321, 0, 1, 0.2666667, 1,
-0.2926146, -1.177763, -2.66038, 0, 1, 0.2745098, 1,
-0.2925826, -0.5192826, -2.560098, 0, 1, 0.2784314, 1,
-0.2922582, 0.8746437, -0.1885312, 0, 1, 0.2862745, 1,
-0.2907115, 1.573464, 1.262082, 0, 1, 0.2901961, 1,
-0.2906618, -0.3305439, -3.728148, 0, 1, 0.2980392, 1,
-0.2901206, 1.310397, -0.9867532, 0, 1, 0.3058824, 1,
-0.2897622, 0.4957696, -0.9027066, 0, 1, 0.3098039, 1,
-0.2893648, 0.3081098, 0.009446761, 0, 1, 0.3176471, 1,
-0.2872497, -1.316301, -3.116459, 0, 1, 0.3215686, 1,
-0.2870925, 0.5958483, -1.530379, 0, 1, 0.3294118, 1,
-0.287057, -0.9593026, -1.191728, 0, 1, 0.3333333, 1,
-0.2842038, -1.15863, -4.335737, 0, 1, 0.3411765, 1,
-0.2819246, -0.8811359, -4.131993, 0, 1, 0.345098, 1,
-0.2777039, -0.03432456, -1.345906, 0, 1, 0.3529412, 1,
-0.277248, -1.145931, -3.046675, 0, 1, 0.3568628, 1,
-0.2751849, 1.582232, 0.3262282, 0, 1, 0.3647059, 1,
-0.2737895, 0.6767853, 0.6156176, 0, 1, 0.3686275, 1,
-0.2720303, 0.8906701, -2.717959, 0, 1, 0.3764706, 1,
-0.2714517, -0.1547271, -0.6803801, 0, 1, 0.3803922, 1,
-0.2694545, -0.403089, -3.323159, 0, 1, 0.3882353, 1,
-0.2670938, 1.140667, -0.3615878, 0, 1, 0.3921569, 1,
-0.2629172, 0.1179568, -1.626237, 0, 1, 0.4, 1,
-0.2619789, -1.272908, -3.362923, 0, 1, 0.4078431, 1,
-0.2613178, -1.871225, -3.994043, 0, 1, 0.4117647, 1,
-0.2613133, -0.08767692, -2.624499, 0, 1, 0.4196078, 1,
-0.2578901, -1.643438, -1.238335, 0, 1, 0.4235294, 1,
-0.2570703, -0.09319201, -2.554516, 0, 1, 0.4313726, 1,
-0.2556847, 1.893122, 1.003565, 0, 1, 0.4352941, 1,
-0.2542086, -0.4160813, -2.777387, 0, 1, 0.4431373, 1,
-0.2466129, -0.7682679, -0.8887383, 0, 1, 0.4470588, 1,
-0.2430841, 0.1024774, 0.05709837, 0, 1, 0.454902, 1,
-0.2381561, -1.659661, -3.069912, 0, 1, 0.4588235, 1,
-0.2359116, 0.5410445, -1.362453, 0, 1, 0.4666667, 1,
-0.2341295, -0.5032926, -2.298918, 0, 1, 0.4705882, 1,
-0.231352, -2.000314, -2.275293, 0, 1, 0.4784314, 1,
-0.2250907, 0.3626972, -1.049818, 0, 1, 0.4823529, 1,
-0.2227135, -1.025071, -2.769241, 0, 1, 0.4901961, 1,
-0.2217448, 1.293715, 0.862965, 0, 1, 0.4941176, 1,
-0.2187208, -0.02455201, -3.264913, 0, 1, 0.5019608, 1,
-0.2152638, 0.2289909, -0.1087405, 0, 1, 0.509804, 1,
-0.2147154, -0.6981339, -2.067199, 0, 1, 0.5137255, 1,
-0.2132557, -0.07017139, -1.382248, 0, 1, 0.5215687, 1,
-0.2119548, 0.1002906, 0.4418036, 0, 1, 0.5254902, 1,
-0.2067855, 1.488826, -0.8493212, 0, 1, 0.5333334, 1,
-0.2051208, 1.855267, 0.1717691, 0, 1, 0.5372549, 1,
-0.2049173, -0.6756786, -2.021499, 0, 1, 0.5450981, 1,
-0.2038186, -2.007763, -4.148096, 0, 1, 0.5490196, 1,
-0.2018546, 0.483999, -0.3678561, 0, 1, 0.5568628, 1,
-0.1991352, -1.710274, -2.615087, 0, 1, 0.5607843, 1,
-0.1978063, 0.2523654, -2.38232, 0, 1, 0.5686275, 1,
-0.1918979, -0.6894774, -2.205502, 0, 1, 0.572549, 1,
-0.1905302, 0.9131048, 0.7534934, 0, 1, 0.5803922, 1,
-0.1863489, 0.7951013, -1.306839, 0, 1, 0.5843138, 1,
-0.1841387, -2.099216, -3.413883, 0, 1, 0.5921569, 1,
-0.1789038, -1.268587, -3.178416, 0, 1, 0.5960785, 1,
-0.1777894, -0.3405265, -3.686507, 0, 1, 0.6039216, 1,
-0.1776671, 0.5838562, -0.0629601, 0, 1, 0.6117647, 1,
-0.1770679, 0.006357207, 0.9166057, 0, 1, 0.6156863, 1,
-0.1752062, -0.0250036, -2.472358, 0, 1, 0.6235294, 1,
-0.1726723, -1.5558, -3.828377, 0, 1, 0.627451, 1,
-0.1701154, 0.8257985, -0.04895101, 0, 1, 0.6352941, 1,
-0.1652942, -0.254826, -2.135869, 0, 1, 0.6392157, 1,
-0.1645448, -0.6769964, -2.151045, 0, 1, 0.6470588, 1,
-0.1618668, 1.106759, -1.412406, 0, 1, 0.6509804, 1,
-0.1582305, 1.311314, -0.6522446, 0, 1, 0.6588235, 1,
-0.1558043, 0.855427, -0.7762943, 0, 1, 0.6627451, 1,
-0.1557356, -1.532838, -3.977899, 0, 1, 0.6705883, 1,
-0.1521666, 0.2337128, -0.08139517, 0, 1, 0.6745098, 1,
-0.1509839, -1.391803, -2.453376, 0, 1, 0.682353, 1,
-0.149313, -1.055365, -2.644691, 0, 1, 0.6862745, 1,
-0.1479678, 0.5311637, -0.4883264, 0, 1, 0.6941177, 1,
-0.1423357, 1.82995, 1.361229, 0, 1, 0.7019608, 1,
-0.1412135, -2.082589, -2.410433, 0, 1, 0.7058824, 1,
-0.1405135, -0.8174787, -3.106839, 0, 1, 0.7137255, 1,
-0.1400358, -1.52545, -2.164095, 0, 1, 0.7176471, 1,
-0.1373895, 2.892503, -0.292066, 0, 1, 0.7254902, 1,
-0.1349725, 1.809892, 1.316444, 0, 1, 0.7294118, 1,
-0.1330516, -0.1182875, -3.76231, 0, 1, 0.7372549, 1,
-0.1327404, -2.995847, -5.018728, 0, 1, 0.7411765, 1,
-0.1300509, 0.1399656, -1.909394, 0, 1, 0.7490196, 1,
-0.1288576, 1.288301, -0.5622886, 0, 1, 0.7529412, 1,
-0.121673, -1.1584, -2.803244, 0, 1, 0.7607843, 1,
-0.1168027, -0.6561078, -3.511156, 0, 1, 0.7647059, 1,
-0.1136446, -0.957342, -3.313561, 0, 1, 0.772549, 1,
-0.1125847, 0.0822482, -1.138764, 0, 1, 0.7764706, 1,
-0.1117649, 1.146108, -0.4359514, 0, 1, 0.7843137, 1,
-0.1117066, 0.8118858, 0.8991439, 0, 1, 0.7882353, 1,
-0.1097435, -0.7552686, -2.66215, 0, 1, 0.7960784, 1,
-0.109711, -0.1030777, 0.299365, 0, 1, 0.8039216, 1,
-0.1078777, 0.06081365, -1.025732, 0, 1, 0.8078431, 1,
-0.1003245, 0.7315788, 1.023323, 0, 1, 0.8156863, 1,
-0.09857763, 0.781946, -1.467712, 0, 1, 0.8196079, 1,
-0.09747107, -0.09636544, -1.71686, 0, 1, 0.827451, 1,
-0.09345938, -0.6202244, -1.863137, 0, 1, 0.8313726, 1,
-0.09324737, 0.1188322, -0.708319, 0, 1, 0.8392157, 1,
-0.09089411, -0.2359583, -2.948003, 0, 1, 0.8431373, 1,
-0.08666798, -0.7764981, -2.391637, 0, 1, 0.8509804, 1,
-0.08500998, -1.373401, -3.527932, 0, 1, 0.854902, 1,
-0.08447891, -0.7983851, -3.953328, 0, 1, 0.8627451, 1,
-0.08371013, -0.06094675, -1.595813, 0, 1, 0.8666667, 1,
-0.08327892, -0.2814517, -1.472689, 0, 1, 0.8745098, 1,
-0.08176407, -1.016868, -3.9416, 0, 1, 0.8784314, 1,
-0.08150517, 1.355696, 0.3394705, 0, 1, 0.8862745, 1,
-0.07987643, 1.957936, -1.648737, 0, 1, 0.8901961, 1,
-0.07833251, -2.674656, -1.434341, 0, 1, 0.8980392, 1,
-0.07762927, 1.423351, 0.5878934, 0, 1, 0.9058824, 1,
-0.0721838, -0.749265, -2.410374, 0, 1, 0.9098039, 1,
-0.07171423, -2.006023, -2.842015, 0, 1, 0.9176471, 1,
-0.06638548, 0.7657821, -0.8766183, 0, 1, 0.9215686, 1,
-0.06121749, 0.2970816, 1.67698, 0, 1, 0.9294118, 1,
-0.06073243, 0.1706173, 1.583156, 0, 1, 0.9333333, 1,
-0.05962908, -0.4760203, -3.627558, 0, 1, 0.9411765, 1,
-0.05783691, 0.5476325, -0.08929615, 0, 1, 0.945098, 1,
-0.05471158, -0.7710325, -2.627217, 0, 1, 0.9529412, 1,
-0.05176117, 0.2737927, -0.3230833, 0, 1, 0.9568627, 1,
-0.0515668, -1.513664, -2.164102, 0, 1, 0.9647059, 1,
-0.05045701, -0.01899961, -1.354638, 0, 1, 0.9686275, 1,
-0.05003327, 0.6773399, -0.07534657, 0, 1, 0.9764706, 1,
-0.04700531, 0.566067, 0.4212257, 0, 1, 0.9803922, 1,
-0.04671783, 1.234231, -0.5216904, 0, 1, 0.9882353, 1,
-0.04281087, 1.317175, 1.415096, 0, 1, 0.9921569, 1,
-0.04196051, -1.571297, -2.957913, 0, 1, 1, 1,
-0.0399758, 0.11371, -0.6152807, 0, 0.9921569, 1, 1,
-0.03836387, -1.069438, -2.803051, 0, 0.9882353, 1, 1,
-0.03834444, -0.9174916, -2.771883, 0, 0.9803922, 1, 1,
-0.03605979, 0.4965964, 0.1287151, 0, 0.9764706, 1, 1,
-0.03078407, 0.4366617, -0.1505684, 0, 0.9686275, 1, 1,
-0.02932716, -0.6823276, -5.546651, 0, 0.9647059, 1, 1,
-0.02804035, -1.182177, -3.188179, 0, 0.9568627, 1, 1,
-0.02699749, 0.004462202, -1.411015, 0, 0.9529412, 1, 1,
-0.02534866, -1.12972, -1.494404, 0, 0.945098, 1, 1,
-0.02286628, 1.220155, -1.979643, 0, 0.9411765, 1, 1,
-0.02053277, 1.137103, -0.06085273, 0, 0.9333333, 1, 1,
-0.01992198, -1.043368, -2.270517, 0, 0.9294118, 1, 1,
-0.01706885, 0.2306051, 0.9532754, 0, 0.9215686, 1, 1,
-0.01698704, -0.3562186, -1.754169, 0, 0.9176471, 1, 1,
-0.01685303, 0.7968544, -0.323393, 0, 0.9098039, 1, 1,
-0.01667288, -1.562232, -3.866157, 0, 0.9058824, 1, 1,
-0.01554384, -0.07335727, -2.857768, 0, 0.8980392, 1, 1,
-0.01502634, 0.6153409, -0.3607303, 0, 0.8901961, 1, 1,
-0.01446575, 0.3534261, -1.349158, 0, 0.8862745, 1, 1,
-0.01111805, 0.007923049, -1.678778, 0, 0.8784314, 1, 1,
-0.009575624, -0.4903106, -3.625675, 0, 0.8745098, 1, 1,
-0.005666498, -0.112548, -4.109447, 0, 0.8666667, 1, 1,
-0.002121549, 0.3004032, 0.3177545, 0, 0.8627451, 1, 1,
0.001311899, 1.198593, -1.271816, 0, 0.854902, 1, 1,
0.007493704, 0.07783262, 0.6553003, 0, 0.8509804, 1, 1,
0.00843981, -0.9606982, 2.838315, 0, 0.8431373, 1, 1,
0.008891106, 0.3024339, -0.4635104, 0, 0.8392157, 1, 1,
0.01276188, 0.5728861, -0.6106808, 0, 0.8313726, 1, 1,
0.01312071, -0.001735771, 1.66075, 0, 0.827451, 1, 1,
0.02366682, 0.05908745, 0.3653361, 0, 0.8196079, 1, 1,
0.03029252, -1.4838, 4.21255, 0, 0.8156863, 1, 1,
0.03347942, 0.06117044, 0.9760534, 0, 0.8078431, 1, 1,
0.03469105, 0.7836167, 2.173361, 0, 0.8039216, 1, 1,
0.03546108, -0.7084309, 2.228421, 0, 0.7960784, 1, 1,
0.03718561, -1.049349, 3.726219, 0, 0.7882353, 1, 1,
0.04301682, 0.615065, -0.3095823, 0, 0.7843137, 1, 1,
0.04438726, 1.626865, 0.009751263, 0, 0.7764706, 1, 1,
0.04567044, 1.498461, 0.7856345, 0, 0.772549, 1, 1,
0.04700639, 2.37644, 0.6601118, 0, 0.7647059, 1, 1,
0.04819483, 0.5848034, 1.796446, 0, 0.7607843, 1, 1,
0.05352449, 1.18884, 0.09377117, 0, 0.7529412, 1, 1,
0.05607714, 0.2814177, 1.298284, 0, 0.7490196, 1, 1,
0.06047434, -0.4078121, 4.965906, 0, 0.7411765, 1, 1,
0.06354674, -0.6601119, 3.243135, 0, 0.7372549, 1, 1,
0.06920621, -0.1746965, 0.9072089, 0, 0.7294118, 1, 1,
0.07388479, -0.01660849, 0.09700287, 0, 0.7254902, 1, 1,
0.07449724, -0.1362553, 1.891597, 0, 0.7176471, 1, 1,
0.07916819, -0.6514718, 3.821452, 0, 0.7137255, 1, 1,
0.07930118, 0.03221435, 1.324385, 0, 0.7058824, 1, 1,
0.07948246, 0.1434965, -1.688193, 0, 0.6980392, 1, 1,
0.08382706, 1.062684, 1.312816, 0, 0.6941177, 1, 1,
0.0839809, 0.1468934, 0.09465186, 0, 0.6862745, 1, 1,
0.08968513, -1.059566, 3.829035, 0, 0.682353, 1, 1,
0.1022181, -1.106185, 2.849519, 0, 0.6745098, 1, 1,
0.1033246, -0.8174696, 4.195863, 0, 0.6705883, 1, 1,
0.1060675, -1.23656, 3.096602, 0, 0.6627451, 1, 1,
0.1091318, -0.03895946, 1.432667, 0, 0.6588235, 1, 1,
0.1102096, -1.315934, 2.500113, 0, 0.6509804, 1, 1,
0.1267937, -0.7663376, 1.933092, 0, 0.6470588, 1, 1,
0.1282917, 0.8185973, 0.007440761, 0, 0.6392157, 1, 1,
0.1286324, -0.4523795, 2.124488, 0, 0.6352941, 1, 1,
0.1310841, 0.8096716, -0.7038467, 0, 0.627451, 1, 1,
0.1311738, -2.157393, 2.278583, 0, 0.6235294, 1, 1,
0.1327402, 0.05572955, 0.5100496, 0, 0.6156863, 1, 1,
0.1359142, 1.968507, -0.973789, 0, 0.6117647, 1, 1,
0.137546, 0.482806, 1.586972, 0, 0.6039216, 1, 1,
0.1404716, -0.2551782, 2.462607, 0, 0.5960785, 1, 1,
0.1446466, -1.813878, 2.569665, 0, 0.5921569, 1, 1,
0.144966, -1.003824, 1.960657, 0, 0.5843138, 1, 1,
0.1471154, -0.5991794, 2.688174, 0, 0.5803922, 1, 1,
0.1478868, 1.740795, 1.36112, 0, 0.572549, 1, 1,
0.1548223, 0.5458711, -0.4015553, 0, 0.5686275, 1, 1,
0.1553049, 0.3641597, -0.727758, 0, 0.5607843, 1, 1,
0.1559907, -0.5484253, 4.418501, 0, 0.5568628, 1, 1,
0.1561866, 0.9845354, -0.7603786, 0, 0.5490196, 1, 1,
0.1578303, -1.205778, 1.920281, 0, 0.5450981, 1, 1,
0.1588681, 0.9661908, -0.2097555, 0, 0.5372549, 1, 1,
0.1644494, 0.00377001, 1.119101, 0, 0.5333334, 1, 1,
0.1659773, 0.6806451, -0.9965784, 0, 0.5254902, 1, 1,
0.1678757, 0.6904252, -1.046589, 0, 0.5215687, 1, 1,
0.1694873, 0.9512097, 1.626931, 0, 0.5137255, 1, 1,
0.1765665, 2.040118, -0.6390132, 0, 0.509804, 1, 1,
0.1766023, 1.033255, 2.392395, 0, 0.5019608, 1, 1,
0.1785284, -1.837443, 2.365211, 0, 0.4941176, 1, 1,
0.1797046, -0.09433386, 2.980398, 0, 0.4901961, 1, 1,
0.1799503, 0.4527034, -0.9179905, 0, 0.4823529, 1, 1,
0.1812623, 2.541832, -0.5351072, 0, 0.4784314, 1, 1,
0.1850702, -0.329606, 2.734272, 0, 0.4705882, 1, 1,
0.1856792, 1.420204, 1.108127, 0, 0.4666667, 1, 1,
0.1916338, 0.2973882, 1.358558, 0, 0.4588235, 1, 1,
0.1927679, 0.6512025, -0.09031148, 0, 0.454902, 1, 1,
0.1934404, 0.8266543, 0.07033049, 0, 0.4470588, 1, 1,
0.1950266, -1.608754, 3.462227, 0, 0.4431373, 1, 1,
0.2099347, 0.5080777, -1.258309, 0, 0.4352941, 1, 1,
0.2158491, -0.07143028, 5.200632, 0, 0.4313726, 1, 1,
0.2170991, 0.5023337, -1.090349, 0, 0.4235294, 1, 1,
0.2172459, -0.4651358, 1.756935, 0, 0.4196078, 1, 1,
0.2179929, 1.38406, -0.278055, 0, 0.4117647, 1, 1,
0.218037, -0.7416732, 4.395598, 0, 0.4078431, 1, 1,
0.2187855, 0.04467718, 0.0349251, 0, 0.4, 1, 1,
0.2203431, 0.5730364, -0.9447759, 0, 0.3921569, 1, 1,
0.2211687, -0.8332474, 3.19008, 0, 0.3882353, 1, 1,
0.2229664, 0.8810815, 0.803022, 0, 0.3803922, 1, 1,
0.2266798, 0.780871, -0.337135, 0, 0.3764706, 1, 1,
0.2272046, 0.2061023, 3.141806, 0, 0.3686275, 1, 1,
0.2298822, 0.7264637, 1.519944, 0, 0.3647059, 1, 1,
0.2358877, -1.379246, 3.170284, 0, 0.3568628, 1, 1,
0.2396852, 0.4505868, 0.8979819, 0, 0.3529412, 1, 1,
0.2398266, -0.3830525, 3.448611, 0, 0.345098, 1, 1,
0.2412069, 0.9388693, 0.9842626, 0, 0.3411765, 1, 1,
0.2492514, -0.9657326, 3.21365, 0, 0.3333333, 1, 1,
0.2570845, -1.249182, 1.680546, 0, 0.3294118, 1, 1,
0.2681952, 1.318129, 1.166504, 0, 0.3215686, 1, 1,
0.2713352, 0.4401202, -0.04230339, 0, 0.3176471, 1, 1,
0.2722661, 0.246251, 0.8101724, 0, 0.3098039, 1, 1,
0.2746154, 0.2272873, 1.179053, 0, 0.3058824, 1, 1,
0.2776114, 0.7956614, 1.391907, 0, 0.2980392, 1, 1,
0.2789978, 0.2257065, 1.259416, 0, 0.2901961, 1, 1,
0.2810509, 1.306013, 0.5374151, 0, 0.2862745, 1, 1,
0.2826351, -0.8951922, 2.319094, 0, 0.2784314, 1, 1,
0.2861849, 1.306017, -1.883204, 0, 0.2745098, 1, 1,
0.2889387, 0.06205463, 2.039527, 0, 0.2666667, 1, 1,
0.2908265, 0.9593124, 1.98957, 0, 0.2627451, 1, 1,
0.2934753, 1.630194, 2.353865, 0, 0.254902, 1, 1,
0.2954803, 1.939243, 0.798524, 0, 0.2509804, 1, 1,
0.2957673, 0.3002979, 0.4685307, 0, 0.2431373, 1, 1,
0.2958746, -1.085172, 1.978809, 0, 0.2392157, 1, 1,
0.2972733, 1.798974, 1.271054, 0, 0.2313726, 1, 1,
0.2990867, 0.0382021, 2.112814, 0, 0.227451, 1, 1,
0.3040588, -0.8278316, 3.298473, 0, 0.2196078, 1, 1,
0.3066033, -0.3127911, 3.747675, 0, 0.2156863, 1, 1,
0.3110673, -1.658971, 2.241933, 0, 0.2078431, 1, 1,
0.3181949, 0.02800481, 1.23077, 0, 0.2039216, 1, 1,
0.3187225, -0.1442535, 2.599445, 0, 0.1960784, 1, 1,
0.3195544, 1.435469, -1.325918, 0, 0.1882353, 1, 1,
0.3196057, 1.081292, -0.461239, 0, 0.1843137, 1, 1,
0.3367519, -0.1386952, 0.5831413, 0, 0.1764706, 1, 1,
0.3374814, 1.129493, 2.06403, 0, 0.172549, 1, 1,
0.3452455, 0.07790814, 0.08586901, 0, 0.1647059, 1, 1,
0.3483033, -1.301368, 2.729437, 0, 0.1607843, 1, 1,
0.350138, -0.2489218, 3.227337, 0, 0.1529412, 1, 1,
0.3527928, 0.570771, -0.83903, 0, 0.1490196, 1, 1,
0.3551494, -0.6396842, 2.482285, 0, 0.1411765, 1, 1,
0.3589275, 1.108959, 0.01643999, 0, 0.1372549, 1, 1,
0.3597935, 0.6586065, -1.34727, 0, 0.1294118, 1, 1,
0.3615726, 0.4218755, 1.829504, 0, 0.1254902, 1, 1,
0.3631606, -0.2931712, 2.416043, 0, 0.1176471, 1, 1,
0.3672421, 0.005274503, 0.2177353, 0, 0.1137255, 1, 1,
0.3672989, 0.03545627, 1.202424, 0, 0.1058824, 1, 1,
0.3695767, 1.034666, -0.1050043, 0, 0.09803922, 1, 1,
0.3743822, -0.9854679, 3.280546, 0, 0.09411765, 1, 1,
0.3747902, 0.8140354, -0.2604272, 0, 0.08627451, 1, 1,
0.3750472, 0.2746131, -0.9614182, 0, 0.08235294, 1, 1,
0.3832614, -0.9079024, 6.091167, 0, 0.07450981, 1, 1,
0.384973, 0.2845333, 1.270462, 0, 0.07058824, 1, 1,
0.3866928, -0.5106394, 1.403112, 0, 0.0627451, 1, 1,
0.3888382, 0.8239499, 1.644576, 0, 0.05882353, 1, 1,
0.390555, 0.6097919, 1.093373, 0, 0.05098039, 1, 1,
0.3909318, 0.7261009, -0.3085831, 0, 0.04705882, 1, 1,
0.3915856, -0.197636, 0.3525206, 0, 0.03921569, 1, 1,
0.3923869, -1.013988, -0.7387243, 0, 0.03529412, 1, 1,
0.402194, -1.203702, 4.080064, 0, 0.02745098, 1, 1,
0.4050161, 0.4679957, 2.147133, 0, 0.02352941, 1, 1,
0.4132555, 0.1560601, 0.5944203, 0, 0.01568628, 1, 1,
0.4136212, 1.295002, -0.9900436, 0, 0.01176471, 1, 1,
0.4140357, -0.1199732, 1.572326, 0, 0.003921569, 1, 1,
0.4142185, -0.7554787, 2.720805, 0.003921569, 0, 1, 1,
0.4182651, -0.7788747, 1.546302, 0.007843138, 0, 1, 1,
0.4195499, -0.09254754, 1.02457, 0.01568628, 0, 1, 1,
0.4362391, 0.1926579, 0.3409764, 0.01960784, 0, 1, 1,
0.4366864, 0.6136009, 2.107373, 0.02745098, 0, 1, 1,
0.4380555, 0.3646379, -0.3214695, 0.03137255, 0, 1, 1,
0.4458186, -0.8193209, 3.633302, 0.03921569, 0, 1, 1,
0.4473725, 1.254446, -0.8417133, 0.04313726, 0, 1, 1,
0.4622964, -0.483118, 2.320872, 0.05098039, 0, 1, 1,
0.463838, -0.8390578, 2.765033, 0.05490196, 0, 1, 1,
0.4640886, -1.055594, 3.251093, 0.0627451, 0, 1, 1,
0.464282, -0.5469578, 2.428276, 0.06666667, 0, 1, 1,
0.4690624, -1.092501, 1.334979, 0.07450981, 0, 1, 1,
0.4695423, -0.03016753, 1.603398, 0.07843138, 0, 1, 1,
0.4698879, -0.836105, 1.855628, 0.08627451, 0, 1, 1,
0.4731973, -0.05955566, 1.151737, 0.09019608, 0, 1, 1,
0.4764997, 0.6307043, 1.285331, 0.09803922, 0, 1, 1,
0.4778989, -1.121862, 2.263416, 0.1058824, 0, 1, 1,
0.4779039, -1.240803, 3.156664, 0.1098039, 0, 1, 1,
0.4796061, 0.7776827, 1.365913, 0.1176471, 0, 1, 1,
0.4813696, -0.1122632, 1.221813, 0.1215686, 0, 1, 1,
0.4878888, -0.001373513, 1.782617, 0.1294118, 0, 1, 1,
0.4897904, -1.590745, 2.716151, 0.1333333, 0, 1, 1,
0.4913893, -1.080922, 3.145648, 0.1411765, 0, 1, 1,
0.494515, -0.7768582, 3.184964, 0.145098, 0, 1, 1,
0.4956821, 1.062319, 1.028503, 0.1529412, 0, 1, 1,
0.4966199, -1.244819, 3.324701, 0.1568628, 0, 1, 1,
0.497867, 0.6302498, 0.6258661, 0.1647059, 0, 1, 1,
0.4994564, -0.5617207, 3.374068, 0.1686275, 0, 1, 1,
0.5010925, -0.266699, 0.9771623, 0.1764706, 0, 1, 1,
0.5020692, 0.8622042, 1.589501, 0.1803922, 0, 1, 1,
0.5028, 1.248209, 0.4601743, 0.1882353, 0, 1, 1,
0.5031963, -0.7844896, 2.057533, 0.1921569, 0, 1, 1,
0.5040445, 0.8096315, 0.5617946, 0.2, 0, 1, 1,
0.505563, 0.5616619, 1.930303, 0.2078431, 0, 1, 1,
0.5083572, -1.33935, 3.791147, 0.2117647, 0, 1, 1,
0.5144872, 0.634672, 1.173531, 0.2196078, 0, 1, 1,
0.5162524, 1.009262, 0.3506985, 0.2235294, 0, 1, 1,
0.5172457, 0.1464192, -0.02150224, 0.2313726, 0, 1, 1,
0.5191836, 1.147724, -0.07175611, 0.2352941, 0, 1, 1,
0.5211456, 0.4933548, 1.362985, 0.2431373, 0, 1, 1,
0.5252623, 0.8756931, 0.3205543, 0.2470588, 0, 1, 1,
0.5262879, -0.4776499, 3.122646, 0.254902, 0, 1, 1,
0.531262, 0.2361416, 1.560498, 0.2588235, 0, 1, 1,
0.5317267, -0.5042087, 3.01749, 0.2666667, 0, 1, 1,
0.538632, -0.4684096, 3.563017, 0.2705882, 0, 1, 1,
0.5400575, -0.9102047, 2.847544, 0.2784314, 0, 1, 1,
0.5402648, 0.4258533, 1.015546, 0.282353, 0, 1, 1,
0.5432662, 1.122173, -0.2601531, 0.2901961, 0, 1, 1,
0.5450539, -0.5070806, 2.996604, 0.2941177, 0, 1, 1,
0.5460636, 0.1518813, 2.179463, 0.3019608, 0, 1, 1,
0.5484506, -1.644619, 3.489791, 0.3098039, 0, 1, 1,
0.5535926, 0.6349798, 1.140248, 0.3137255, 0, 1, 1,
0.554438, -0.001570695, 0.3450028, 0.3215686, 0, 1, 1,
0.556031, 0.04928932, 2.623717, 0.3254902, 0, 1, 1,
0.5564827, 0.7268175, 0.2704993, 0.3333333, 0, 1, 1,
0.5570267, 0.08399101, 0.8052956, 0.3372549, 0, 1, 1,
0.5607581, 1.201902, 0.8549445, 0.345098, 0, 1, 1,
0.5618471, -0.0906674, 0.5049908, 0.3490196, 0, 1, 1,
0.5642473, -0.9157745, 3.293434, 0.3568628, 0, 1, 1,
0.5643119, -0.5141711, 0.7836406, 0.3607843, 0, 1, 1,
0.5661215, 0.9879194, 0.4864806, 0.3686275, 0, 1, 1,
0.5701261, 0.89369, 0.7071815, 0.372549, 0, 1, 1,
0.5708035, 1.322515, 0.5083916, 0.3803922, 0, 1, 1,
0.5734957, 0.3982973, 3.429775, 0.3843137, 0, 1, 1,
0.574149, -0.4835791, 3.945403, 0.3921569, 0, 1, 1,
0.5759722, 1.509801, 0.1086826, 0.3960784, 0, 1, 1,
0.5804577, 1.7667, 0.2968962, 0.4039216, 0, 1, 1,
0.5815772, 0.2762532, 1.152071, 0.4117647, 0, 1, 1,
0.5818014, 0.9745866, 2.357591, 0.4156863, 0, 1, 1,
0.5836796, -0.3780679, 3.433665, 0.4235294, 0, 1, 1,
0.5839264, -0.2746302, 1.824294, 0.427451, 0, 1, 1,
0.5857146, 1.466376, 0.6756707, 0.4352941, 0, 1, 1,
0.5873092, -0.1804724, 1.619861, 0.4392157, 0, 1, 1,
0.5905136, -0.7772169, 3.335649, 0.4470588, 0, 1, 1,
0.5905949, 0.8544058, 1.25874, 0.4509804, 0, 1, 1,
0.5912953, 0.8240908, 2.769218, 0.4588235, 0, 1, 1,
0.5930803, -0.6956196, 2.944614, 0.4627451, 0, 1, 1,
0.596907, 0.5700997, 0.9949037, 0.4705882, 0, 1, 1,
0.5975456, -0.6070446, 1.71176, 0.4745098, 0, 1, 1,
0.6000268, -1.069731, 2.221816, 0.4823529, 0, 1, 1,
0.6046861, 1.132838, -1.207288, 0.4862745, 0, 1, 1,
0.6048644, 0.7204832, 1.023381, 0.4941176, 0, 1, 1,
0.6078216, -0.194302, 2.530231, 0.5019608, 0, 1, 1,
0.6091676, 0.3223751, 1.541495, 0.5058824, 0, 1, 1,
0.613522, 0.9834505, 0.9832144, 0.5137255, 0, 1, 1,
0.6148649, 1.619023, -0.2360094, 0.5176471, 0, 1, 1,
0.6178616, 0.9819318, 1.33919, 0.5254902, 0, 1, 1,
0.6195017, -0.6067277, 1.459417, 0.5294118, 0, 1, 1,
0.6267651, 0.3398243, 1.639852, 0.5372549, 0, 1, 1,
0.6322854, 0.6748785, 0.5508995, 0.5411765, 0, 1, 1,
0.6359897, -0.6548422, 3.867236, 0.5490196, 0, 1, 1,
0.6434649, 1.053194, 0.4469637, 0.5529412, 0, 1, 1,
0.6457313, -0.6079568, 0.937176, 0.5607843, 0, 1, 1,
0.6458596, 0.928542, 0.353167, 0.5647059, 0, 1, 1,
0.6466316, -0.4361545, 2.474734, 0.572549, 0, 1, 1,
0.6501399, -1.112048, 3.245653, 0.5764706, 0, 1, 1,
0.650413, 1.575063, -0.9983077, 0.5843138, 0, 1, 1,
0.6549274, -0.2798434, 0.9281922, 0.5882353, 0, 1, 1,
0.659484, 1.541346, 0.3615282, 0.5960785, 0, 1, 1,
0.6597667, -1.121825, 2.432528, 0.6039216, 0, 1, 1,
0.6598687, 0.0305738, 2.839878, 0.6078432, 0, 1, 1,
0.6599349, 1.019917, 0.7872783, 0.6156863, 0, 1, 1,
0.6605655, -0.6255183, 2.059786, 0.6196079, 0, 1, 1,
0.6620321, -1.233336, 2.485796, 0.627451, 0, 1, 1,
0.6629578, 0.2313399, 1.378769, 0.6313726, 0, 1, 1,
0.6648645, 0.1265921, 0.2746336, 0.6392157, 0, 1, 1,
0.6710525, 1.382563, 0.2111576, 0.6431373, 0, 1, 1,
0.6727175, -0.5687679, 1.829709, 0.6509804, 0, 1, 1,
0.6770705, 0.5998924, -0.07032645, 0.654902, 0, 1, 1,
0.6794828, -0.03365168, 3.240134, 0.6627451, 0, 1, 1,
0.6809883, -0.2498604, 0.8052636, 0.6666667, 0, 1, 1,
0.6862783, 1.381555, -0.5107351, 0.6745098, 0, 1, 1,
0.6874217, -1.112026, 3.488858, 0.6784314, 0, 1, 1,
0.6966993, -0.3314791, 2.095812, 0.6862745, 0, 1, 1,
0.7067608, 0.9802842, 0.01005488, 0.6901961, 0, 1, 1,
0.7077062, -0.1719061, 0.1076468, 0.6980392, 0, 1, 1,
0.7124701, -0.1230768, 2.342537, 0.7058824, 0, 1, 1,
0.7170001, -0.1301968, 2.009678, 0.7098039, 0, 1, 1,
0.725261, 1.271354, -0.487096, 0.7176471, 0, 1, 1,
0.7307491, -1.281038, 2.472678, 0.7215686, 0, 1, 1,
0.7328676, -1.848382, 2.35122, 0.7294118, 0, 1, 1,
0.7335075, -0.6675662, 2.933249, 0.7333333, 0, 1, 1,
0.7390313, -0.7037355, 1.685879, 0.7411765, 0, 1, 1,
0.7397136, -1.191627, 2.065929, 0.7450981, 0, 1, 1,
0.7406205, 0.1109122, 1.91738, 0.7529412, 0, 1, 1,
0.7413449, 0.05001568, 2.304644, 0.7568628, 0, 1, 1,
0.7439897, -0.7707644, 4.331833, 0.7647059, 0, 1, 1,
0.7445116, 1.33771, -0.02246712, 0.7686275, 0, 1, 1,
0.7455881, 0.2625961, 1.661149, 0.7764706, 0, 1, 1,
0.7458054, -0.6373868, 2.29502, 0.7803922, 0, 1, 1,
0.74689, -0.2605097, -0.2064871, 0.7882353, 0, 1, 1,
0.7474446, 0.6452975, 1.906711, 0.7921569, 0, 1, 1,
0.7482165, -0.6412861, 3.736935, 0.8, 0, 1, 1,
0.7527899, -2.977959, 2.535748, 0.8078431, 0, 1, 1,
0.7529675, -0.1958955, 1.378237, 0.8117647, 0, 1, 1,
0.7535578, -0.8414848, 1.978433, 0.8196079, 0, 1, 1,
0.7561158, 0.6949313, 3.267729, 0.8235294, 0, 1, 1,
0.7690898, -0.6045954, 2.741791, 0.8313726, 0, 1, 1,
0.7739393, -1.571302, -0.320796, 0.8352941, 0, 1, 1,
0.7830289, 2.180852, 0.5550812, 0.8431373, 0, 1, 1,
0.7880752, 0.04964846, 1.250149, 0.8470588, 0, 1, 1,
0.7952762, 0.4081095, 1.282769, 0.854902, 0, 1, 1,
0.7958028, 0.8339844, 3.032251, 0.8588235, 0, 1, 1,
0.818065, 0.6556384, 1.486955, 0.8666667, 0, 1, 1,
0.8200464, 0.4657437, 2.987506, 0.8705882, 0, 1, 1,
0.8218559, 1.182024, 0.9261638, 0.8784314, 0, 1, 1,
0.822262, 0.3051238, 1.409635, 0.8823529, 0, 1, 1,
0.8269281, -1.945593, 4.634021, 0.8901961, 0, 1, 1,
0.82921, -1.335091, 1.937782, 0.8941177, 0, 1, 1,
0.8333641, -1.081276, 2.023072, 0.9019608, 0, 1, 1,
0.8341327, -1.687201, 2.80471, 0.9098039, 0, 1, 1,
0.8356296, -0.6973202, 1.457723, 0.9137255, 0, 1, 1,
0.8374123, 0.5510284, 0.7912434, 0.9215686, 0, 1, 1,
0.8420154, 0.3864465, 2.265117, 0.9254902, 0, 1, 1,
0.8472415, 0.584104, 1.508661, 0.9333333, 0, 1, 1,
0.850682, 0.1697244, 1.020984, 0.9372549, 0, 1, 1,
0.8528796, 0.05095376, 2.071231, 0.945098, 0, 1, 1,
0.8529593, -1.23271, 4.217267, 0.9490196, 0, 1, 1,
0.8557738, 1.156554, 0.05366589, 0.9568627, 0, 1, 1,
0.8603301, -1.224075, 2.44369, 0.9607843, 0, 1, 1,
0.8631671, 0.738905, 1.735687, 0.9686275, 0, 1, 1,
0.8645886, 0.5957646, 0.7952939, 0.972549, 0, 1, 1,
0.870183, -2.330345, 1.710451, 0.9803922, 0, 1, 1,
0.8774633, 0.5548666, 0.4262237, 0.9843137, 0, 1, 1,
0.8785477, 0.7445445, 0.1253676, 0.9921569, 0, 1, 1,
0.8788624, -1.093403, 0.8380011, 0.9960784, 0, 1, 1,
0.8820795, -0.409518, 1.666429, 1, 0, 0.9960784, 1,
0.8846163, 1.175096, -0.09526578, 1, 0, 0.9882353, 1,
0.8858888, -1.51985, 1.332961, 1, 0, 0.9843137, 1,
0.8889699, -1.682936, 2.617966, 1, 0, 0.9764706, 1,
0.8922209, 0.3182652, 1.211118, 1, 0, 0.972549, 1,
0.894099, -0.3326194, 2.636838, 1, 0, 0.9647059, 1,
0.9093993, -0.1164258, 2.234043, 1, 0, 0.9607843, 1,
0.9121191, -0.198521, 1.75716, 1, 0, 0.9529412, 1,
0.9153124, -1.422852, 1.626564, 1, 0, 0.9490196, 1,
0.9165913, 1.396058, 0.2180954, 1, 0, 0.9411765, 1,
0.9194267, 0.7163757, 1.697576, 1, 0, 0.9372549, 1,
0.9246197, 0.8540453, 1.541367, 1, 0, 0.9294118, 1,
0.9267105, 0.2549311, 0.536607, 1, 0, 0.9254902, 1,
0.9318571, 0.1846654, 2.691741, 1, 0, 0.9176471, 1,
0.9382897, 0.9418237, 2.04765, 1, 0, 0.9137255, 1,
0.946888, 0.5343744, 1.874258, 1, 0, 0.9058824, 1,
0.9477279, 1.520628, 0.2280604, 1, 0, 0.9019608, 1,
0.9551686, -1.261401, 3.138185, 1, 0, 0.8941177, 1,
0.9576327, -0.8101649, 1.115796, 1, 0, 0.8862745, 1,
0.9630881, 0.6457929, 0.708322, 1, 0, 0.8823529, 1,
0.9653934, -0.4258939, 2.861276, 1, 0, 0.8745098, 1,
0.97088, -0.357247, 0.3531995, 1, 0, 0.8705882, 1,
0.9791231, -0.7875383, 0.7658487, 1, 0, 0.8627451, 1,
0.9878485, 0.4469657, 1.443666, 1, 0, 0.8588235, 1,
0.9905701, 1.933392, 2.181022, 1, 0, 0.8509804, 1,
0.9967245, -0.851795, 3.873929, 1, 0, 0.8470588, 1,
1.002811, -0.7419544, 0.7413176, 1, 0, 0.8392157, 1,
1.005514, 0.7660999, -0.5861205, 1, 0, 0.8352941, 1,
1.01632, 1.559427, -1.313719, 1, 0, 0.827451, 1,
1.016548, -0.3870782, 2.140361, 1, 0, 0.8235294, 1,
1.016825, -0.3821208, 0.7993332, 1, 0, 0.8156863, 1,
1.019005, -0.1330142, -0.1112285, 1, 0, 0.8117647, 1,
1.023285, -0.4828155, 2.260901, 1, 0, 0.8039216, 1,
1.023758, -0.7364041, 1.875076, 1, 0, 0.7960784, 1,
1.025412, 0.6597931, -1.205772, 1, 0, 0.7921569, 1,
1.027047, -0.3626198, 0.3274993, 1, 0, 0.7843137, 1,
1.028056, 0.8974221, 0.2539097, 1, 0, 0.7803922, 1,
1.028081, -0.220503, 1.221995, 1, 0, 0.772549, 1,
1.036856, -0.4625723, 2.547673, 1, 0, 0.7686275, 1,
1.039893, 1.421388, 1.534686, 1, 0, 0.7607843, 1,
1.041425, 0.1026095, 2.030833, 1, 0, 0.7568628, 1,
1.041539, -0.7746131, 2.941246, 1, 0, 0.7490196, 1,
1.048547, -0.9342244, 1.898047, 1, 0, 0.7450981, 1,
1.059138, -1.31625, 3.954905, 1, 0, 0.7372549, 1,
1.060195, 0.2605694, 1.288516, 1, 0, 0.7333333, 1,
1.061831, 0.2472403, 1.05489, 1, 0, 0.7254902, 1,
1.071274, -1.933183, 3.083083, 1, 0, 0.7215686, 1,
1.080929, 1.629597, 1.40908, 1, 0, 0.7137255, 1,
1.082563, -1.674739, 2.087011, 1, 0, 0.7098039, 1,
1.086745, 0.03518121, 1.820704, 1, 0, 0.7019608, 1,
1.096405, 1.313291, -0.1841954, 1, 0, 0.6941177, 1,
1.096411, -1.392307, 2.854252, 1, 0, 0.6901961, 1,
1.098768, -0.2686991, 2.117748, 1, 0, 0.682353, 1,
1.101751, -0.4158133, 1.631445, 1, 0, 0.6784314, 1,
1.102009, 0.8085276, 1.847255, 1, 0, 0.6705883, 1,
1.108126, 1.027948, 0.07781629, 1, 0, 0.6666667, 1,
1.108271, 0.7187448, 0.997839, 1, 0, 0.6588235, 1,
1.119199, 0.6336607, 0.8956687, 1, 0, 0.654902, 1,
1.131611, 0.4111848, -0.4111889, 1, 0, 0.6470588, 1,
1.135814, 0.1853877, 1.167929, 1, 0, 0.6431373, 1,
1.140114, -0.1400184, 2.737286, 1, 0, 0.6352941, 1,
1.140447, -0.9442183, 2.362495, 1, 0, 0.6313726, 1,
1.142017, -1.77013, 1.766987, 1, 0, 0.6235294, 1,
1.151053, 0.4528305, 2.467582, 1, 0, 0.6196079, 1,
1.155385, -1.41381, 5.505571, 1, 0, 0.6117647, 1,
1.157029, -0.03820932, 2.404892, 1, 0, 0.6078432, 1,
1.164583, 0.2485078, 0.4736651, 1, 0, 0.6, 1,
1.170872, -0.3271795, 2.223676, 1, 0, 0.5921569, 1,
1.172748, 0.9305056, 0.4071504, 1, 0, 0.5882353, 1,
1.172774, 1.022424, 0.6298819, 1, 0, 0.5803922, 1,
1.176525, -2.42963, 3.554411, 1, 0, 0.5764706, 1,
1.180334, -0.6567982, 2.370327, 1, 0, 0.5686275, 1,
1.186275, 1.933292, 1.906305, 1, 0, 0.5647059, 1,
1.190576, 1.614835, 0.2200672, 1, 0, 0.5568628, 1,
1.205648, -0.04225173, 1.359252, 1, 0, 0.5529412, 1,
1.207237, 0.07758402, 2.323342, 1, 0, 0.5450981, 1,
1.212101, -0.03012219, 1.82324, 1, 0, 0.5411765, 1,
1.212316, 0.3002835, 2.704068, 1, 0, 0.5333334, 1,
1.213878, 0.04048559, 1.610945, 1, 0, 0.5294118, 1,
1.224346, 0.4777489, 0.5693768, 1, 0, 0.5215687, 1,
1.257402, 1.166682, 0.5909311, 1, 0, 0.5176471, 1,
1.26224, 0.8868504, 0.9565635, 1, 0, 0.509804, 1,
1.264258, -0.9161226, 2.009291, 1, 0, 0.5058824, 1,
1.288887, -0.4405961, 1.528733, 1, 0, 0.4980392, 1,
1.294956, -0.8083829, -0.3424175, 1, 0, 0.4901961, 1,
1.300138, -0.1913668, 1.343311, 1, 0, 0.4862745, 1,
1.306449, -0.5563221, 2.601035, 1, 0, 0.4784314, 1,
1.320362, -0.124947, 1.815253, 1, 0, 0.4745098, 1,
1.327406, 2.277749, 2.377816, 1, 0, 0.4666667, 1,
1.32875, 1.607046, -2.186154, 1, 0, 0.4627451, 1,
1.335502, 1.456744, 0.4442295, 1, 0, 0.454902, 1,
1.336755, -1.932653, 4.075963, 1, 0, 0.4509804, 1,
1.342441, 0.919847, 0.6958053, 1, 0, 0.4431373, 1,
1.363817, 0.06597316, 1.703867, 1, 0, 0.4392157, 1,
1.366135, -1.723419, 4.17998, 1, 0, 0.4313726, 1,
1.367378, -2.698256, 1.84881, 1, 0, 0.427451, 1,
1.37633, 0.3509233, 2.416689, 1, 0, 0.4196078, 1,
1.398744, 0.2164828, 2.240273, 1, 0, 0.4156863, 1,
1.416396, 1.451804, 0.7011688, 1, 0, 0.4078431, 1,
1.416924, -0.3407181, 1.866516, 1, 0, 0.4039216, 1,
1.417464, 0.5818232, 2.718408, 1, 0, 0.3960784, 1,
1.421833, -0.9833894, 2.420356, 1, 0, 0.3882353, 1,
1.423511, 0.6500283, 2.296017, 1, 0, 0.3843137, 1,
1.436597, 1.843437, -0.9102205, 1, 0, 0.3764706, 1,
1.43882, -0.3480361, 1.800629, 1, 0, 0.372549, 1,
1.438887, 0.871623, 0.6283714, 1, 0, 0.3647059, 1,
1.44189, 1.309047, 1.009134, 1, 0, 0.3607843, 1,
1.463225, -1.283577, 1.210767, 1, 0, 0.3529412, 1,
1.472727, -0.5027375, 2.682033, 1, 0, 0.3490196, 1,
1.476666, 0.6175809, 2.73746, 1, 0, 0.3411765, 1,
1.53352, 0.5488873, 2.163339, 1, 0, 0.3372549, 1,
1.535549, -0.06135909, 2.5284, 1, 0, 0.3294118, 1,
1.546251, -0.6521998, 3.932067, 1, 0, 0.3254902, 1,
1.552844, 2.630761, -0.1179838, 1, 0, 0.3176471, 1,
1.553704, -1.241524, 3.702503, 1, 0, 0.3137255, 1,
1.560595, -1.284884, 2.295845, 1, 0, 0.3058824, 1,
1.561185, -1.786944, 1.447467, 1, 0, 0.2980392, 1,
1.575993, 0.03244057, 2.598993, 1, 0, 0.2941177, 1,
1.577313, -2.05453, 1.196063, 1, 0, 0.2862745, 1,
1.58289, -2.006696, 2.539099, 1, 0, 0.282353, 1,
1.583544, 0.4017856, 0.08117604, 1, 0, 0.2745098, 1,
1.584986, 0.7830803, 0.1433603, 1, 0, 0.2705882, 1,
1.589282, -0.9519051, 1.78584, 1, 0, 0.2627451, 1,
1.590183, 0.2063446, 3.501562, 1, 0, 0.2588235, 1,
1.615942, -1.172963, 2.254818, 1, 0, 0.2509804, 1,
1.64695, 1.533262, 0.7837343, 1, 0, 0.2470588, 1,
1.673381, 0.4977601, 1.034624, 1, 0, 0.2392157, 1,
1.705798, -0.4207438, 3.118835, 1, 0, 0.2352941, 1,
1.708337, -2.001089, 1.946266, 1, 0, 0.227451, 1,
1.727876, -0.4910536, 3.067669, 1, 0, 0.2235294, 1,
1.733446, 1.975839, 3.334608, 1, 0, 0.2156863, 1,
1.736029, -2.214298, 1.90781, 1, 0, 0.2117647, 1,
1.738773, -0.04149791, 3.131696, 1, 0, 0.2039216, 1,
1.747876, -0.1268528, 0.1251106, 1, 0, 0.1960784, 1,
1.787437, -0.6943971, 2.147309, 1, 0, 0.1921569, 1,
1.814615, -0.1147007, 1.91351, 1, 0, 0.1843137, 1,
1.856068, 0.5360836, 1.359536, 1, 0, 0.1803922, 1,
1.858802, -0.9270678, 1.611887, 1, 0, 0.172549, 1,
1.876038, -1.478679, 2.099313, 1, 0, 0.1686275, 1,
1.880496, -0.1830195, 1.57122, 1, 0, 0.1607843, 1,
1.882199, -0.5907261, 1.377919, 1, 0, 0.1568628, 1,
1.889914, -0.4893346, -0.5083495, 1, 0, 0.1490196, 1,
1.89554, 0.8953956, 2.966502, 1, 0, 0.145098, 1,
1.901288, -0.01151071, 0.7624065, 1, 0, 0.1372549, 1,
1.906934, 2.099412, 1.295417, 1, 0, 0.1333333, 1,
1.953227, 0.1451762, -0.2520772, 1, 0, 0.1254902, 1,
1.955013, -0.6145894, 1.059232, 1, 0, 0.1215686, 1,
1.981639, -0.3295532, 1.430279, 1, 0, 0.1137255, 1,
2.001509, -0.005624762, 2.463809, 1, 0, 0.1098039, 1,
2.015826, -0.4001665, 2.03983, 1, 0, 0.1019608, 1,
2.025015, 0.8263015, 0.4670599, 1, 0, 0.09411765, 1,
2.035605, 0.170999, -0.3425557, 1, 0, 0.09019608, 1,
2.082701, -0.780995, 3.104103, 1, 0, 0.08235294, 1,
2.107637, 0.2332351, 1.54714, 1, 0, 0.07843138, 1,
2.108945, -0.8797201, 1.703915, 1, 0, 0.07058824, 1,
2.110681, 1.169256, 0.7658833, 1, 0, 0.06666667, 1,
2.357746, -0.05939436, -0.4229257, 1, 0, 0.05882353, 1,
2.397252, -0.5322623, 0.7826146, 1, 0, 0.05490196, 1,
2.397311, 1.402685, 0.0923406, 1, 0, 0.04705882, 1,
2.498641, 0.6764558, 0.9038959, 1, 0, 0.04313726, 1,
2.518085, 1.862827, 1.017237, 1, 0, 0.03529412, 1,
2.617853, 0.001999362, 0.592992, 1, 0, 0.03137255, 1,
2.624332, -0.7464266, 3.496237, 1, 0, 0.02352941, 1,
2.734589, 1.198508, 0.8419954, 1, 0, 0.01960784, 1,
2.858014, 0.1931291, 1.446339, 1, 0, 0.01176471, 1,
2.908222, 0.5516387, 1.446451, 1, 0, 0.007843138, 1
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
-0.2623737, -4.210132, -7.519261, 0, -0.5, 0.5, 0.5,
-0.2623737, -4.210132, -7.519261, 1, -0.5, 0.5, 0.5,
-0.2623737, -4.210132, -7.519261, 1, 1.5, 0.5, 0.5,
-0.2623737, -4.210132, -7.519261, 0, 1.5, 0.5, 0.5
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
-4.507801, -0.1441088, -7.519261, 0, -0.5, 0.5, 0.5,
-4.507801, -0.1441088, -7.519261, 1, -0.5, 0.5, 0.5,
-4.507801, -0.1441088, -7.519261, 1, 1.5, 0.5, 0.5,
-4.507801, -0.1441088, -7.519261, 0, 1.5, 0.5, 0.5
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
-4.507801, -4.210132, 0.2722583, 0, -0.5, 0.5, 0.5,
-4.507801, -4.210132, 0.2722583, 1, -0.5, 0.5, 0.5,
-4.507801, -4.210132, 0.2722583, 1, 1.5, 0.5, 0.5,
-4.507801, -4.210132, 0.2722583, 0, 1.5, 0.5, 0.5
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
-3, -3.271819, -5.721218,
2, -3.271819, -5.721218,
-3, -3.271819, -5.721218,
-3, -3.428205, -6.020892,
-2, -3.271819, -5.721218,
-2, -3.428205, -6.020892,
-1, -3.271819, -5.721218,
-1, -3.428205, -6.020892,
0, -3.271819, -5.721218,
0, -3.428205, -6.020892,
1, -3.271819, -5.721218,
1, -3.428205, -6.020892,
2, -3.271819, -5.721218,
2, -3.428205, -6.020892
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
-3, -3.740976, -6.62024, 0, -0.5, 0.5, 0.5,
-3, -3.740976, -6.62024, 1, -0.5, 0.5, 0.5,
-3, -3.740976, -6.62024, 1, 1.5, 0.5, 0.5,
-3, -3.740976, -6.62024, 0, 1.5, 0.5, 0.5,
-2, -3.740976, -6.62024, 0, -0.5, 0.5, 0.5,
-2, -3.740976, -6.62024, 1, -0.5, 0.5, 0.5,
-2, -3.740976, -6.62024, 1, 1.5, 0.5, 0.5,
-2, -3.740976, -6.62024, 0, 1.5, 0.5, 0.5,
-1, -3.740976, -6.62024, 0, -0.5, 0.5, 0.5,
-1, -3.740976, -6.62024, 1, -0.5, 0.5, 0.5,
-1, -3.740976, -6.62024, 1, 1.5, 0.5, 0.5,
-1, -3.740976, -6.62024, 0, 1.5, 0.5, 0.5,
0, -3.740976, -6.62024, 0, -0.5, 0.5, 0.5,
0, -3.740976, -6.62024, 1, -0.5, 0.5, 0.5,
0, -3.740976, -6.62024, 1, 1.5, 0.5, 0.5,
0, -3.740976, -6.62024, 0, 1.5, 0.5, 0.5,
1, -3.740976, -6.62024, 0, -0.5, 0.5, 0.5,
1, -3.740976, -6.62024, 1, -0.5, 0.5, 0.5,
1, -3.740976, -6.62024, 1, 1.5, 0.5, 0.5,
1, -3.740976, -6.62024, 0, 1.5, 0.5, 0.5,
2, -3.740976, -6.62024, 0, -0.5, 0.5, 0.5,
2, -3.740976, -6.62024, 1, -0.5, 0.5, 0.5,
2, -3.740976, -6.62024, 1, 1.5, 0.5, 0.5,
2, -3.740976, -6.62024, 0, 1.5, 0.5, 0.5
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
-3.528087, -3, -5.721218,
-3.528087, 2, -5.721218,
-3.528087, -3, -5.721218,
-3.691373, -3, -6.020892,
-3.528087, -2, -5.721218,
-3.691373, -2, -6.020892,
-3.528087, -1, -5.721218,
-3.691373, -1, -6.020892,
-3.528087, 0, -5.721218,
-3.691373, 0, -6.020892,
-3.528087, 1, -5.721218,
-3.691373, 1, -6.020892,
-3.528087, 2, -5.721218,
-3.691373, 2, -6.020892
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
-4.017944, -3, -6.62024, 0, -0.5, 0.5, 0.5,
-4.017944, -3, -6.62024, 1, -0.5, 0.5, 0.5,
-4.017944, -3, -6.62024, 1, 1.5, 0.5, 0.5,
-4.017944, -3, -6.62024, 0, 1.5, 0.5, 0.5,
-4.017944, -2, -6.62024, 0, -0.5, 0.5, 0.5,
-4.017944, -2, -6.62024, 1, -0.5, 0.5, 0.5,
-4.017944, -2, -6.62024, 1, 1.5, 0.5, 0.5,
-4.017944, -2, -6.62024, 0, 1.5, 0.5, 0.5,
-4.017944, -1, -6.62024, 0, -0.5, 0.5, 0.5,
-4.017944, -1, -6.62024, 1, -0.5, 0.5, 0.5,
-4.017944, -1, -6.62024, 1, 1.5, 0.5, 0.5,
-4.017944, -1, -6.62024, 0, 1.5, 0.5, 0.5,
-4.017944, 0, -6.62024, 0, -0.5, 0.5, 0.5,
-4.017944, 0, -6.62024, 1, -0.5, 0.5, 0.5,
-4.017944, 0, -6.62024, 1, 1.5, 0.5, 0.5,
-4.017944, 0, -6.62024, 0, 1.5, 0.5, 0.5,
-4.017944, 1, -6.62024, 0, -0.5, 0.5, 0.5,
-4.017944, 1, -6.62024, 1, -0.5, 0.5, 0.5,
-4.017944, 1, -6.62024, 1, 1.5, 0.5, 0.5,
-4.017944, 1, -6.62024, 0, 1.5, 0.5, 0.5,
-4.017944, 2, -6.62024, 0, -0.5, 0.5, 0.5,
-4.017944, 2, -6.62024, 1, -0.5, 0.5, 0.5,
-4.017944, 2, -6.62024, 1, 1.5, 0.5, 0.5,
-4.017944, 2, -6.62024, 0, 1.5, 0.5, 0.5
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
-3.528087, -3.271819, -4,
-3.528087, -3.271819, 6,
-3.528087, -3.271819, -4,
-3.691373, -3.428205, -4,
-3.528087, -3.271819, -2,
-3.691373, -3.428205, -2,
-3.528087, -3.271819, 0,
-3.691373, -3.428205, 0,
-3.528087, -3.271819, 2,
-3.691373, -3.428205, 2,
-3.528087, -3.271819, 4,
-3.691373, -3.428205, 4,
-3.528087, -3.271819, 6,
-3.691373, -3.428205, 6
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
"4",
"6"
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
-4.017944, -3.740976, -4, 0, -0.5, 0.5, 0.5,
-4.017944, -3.740976, -4, 1, -0.5, 0.5, 0.5,
-4.017944, -3.740976, -4, 1, 1.5, 0.5, 0.5,
-4.017944, -3.740976, -4, 0, 1.5, 0.5, 0.5,
-4.017944, -3.740976, -2, 0, -0.5, 0.5, 0.5,
-4.017944, -3.740976, -2, 1, -0.5, 0.5, 0.5,
-4.017944, -3.740976, -2, 1, 1.5, 0.5, 0.5,
-4.017944, -3.740976, -2, 0, 1.5, 0.5, 0.5,
-4.017944, -3.740976, 0, 0, -0.5, 0.5, 0.5,
-4.017944, -3.740976, 0, 1, -0.5, 0.5, 0.5,
-4.017944, -3.740976, 0, 1, 1.5, 0.5, 0.5,
-4.017944, -3.740976, 0, 0, 1.5, 0.5, 0.5,
-4.017944, -3.740976, 2, 0, -0.5, 0.5, 0.5,
-4.017944, -3.740976, 2, 1, -0.5, 0.5, 0.5,
-4.017944, -3.740976, 2, 1, 1.5, 0.5, 0.5,
-4.017944, -3.740976, 2, 0, 1.5, 0.5, 0.5,
-4.017944, -3.740976, 4, 0, -0.5, 0.5, 0.5,
-4.017944, -3.740976, 4, 1, -0.5, 0.5, 0.5,
-4.017944, -3.740976, 4, 1, 1.5, 0.5, 0.5,
-4.017944, -3.740976, 4, 0, 1.5, 0.5, 0.5,
-4.017944, -3.740976, 6, 0, -0.5, 0.5, 0.5,
-4.017944, -3.740976, 6, 1, -0.5, 0.5, 0.5,
-4.017944, -3.740976, 6, 1, 1.5, 0.5, 0.5,
-4.017944, -3.740976, 6, 0, 1.5, 0.5, 0.5
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
-3.528087, -3.271819, -5.721218,
-3.528087, 2.983602, -5.721218,
-3.528087, -3.271819, 6.265735,
-3.528087, 2.983602, 6.265735,
-3.528087, -3.271819, -5.721218,
-3.528087, -3.271819, 6.265735,
-3.528087, 2.983602, -5.721218,
-3.528087, 2.983602, 6.265735,
-3.528087, -3.271819, -5.721218,
3.00334, -3.271819, -5.721218,
-3.528087, -3.271819, 6.265735,
3.00334, -3.271819, 6.265735,
-3.528087, 2.983602, -5.721218,
3.00334, 2.983602, -5.721218,
-3.528087, 2.983602, 6.265735,
3.00334, 2.983602, 6.265735,
3.00334, -3.271819, -5.721218,
3.00334, 2.983602, -5.721218,
3.00334, -3.271819, 6.265735,
3.00334, 2.983602, 6.265735,
3.00334, -3.271819, -5.721218,
3.00334, -3.271819, 6.265735,
3.00334, 2.983602, -5.721218,
3.00334, 2.983602, 6.265735
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
var radius = 8.018192;
var distance = 35.67384;
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
mvMatrix.translate( 0.2623737, 0.1441088, -0.2722583 );
mvMatrix.scale( 1.32734, 1.385906, 0.7232385 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.67384);
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
methane_sulfonanilid<-read.table("methane_sulfonanilid.xyz")
```

```
## Error in read.table("methane_sulfonanilid.xyz"): no lines available in input
```

```r
x<-methane_sulfonanilid$V2
```

```
## Error in eval(expr, envir, enclos): object 'methane_sulfonanilid' not found
```

```r
y<-methane_sulfonanilid$V3
```

```
## Error in eval(expr, envir, enclos): object 'methane_sulfonanilid' not found
```

```r
z<-methane_sulfonanilid$V4
```

```
## Error in eval(expr, envir, enclos): object 'methane_sulfonanilid' not found
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
-3.432969, 0.01102973, -1.561515, 0, 0, 1, 1, 1,
-3.219374, 1.058545, -0.7378011, 1, 0, 0, 1, 1,
-3.043138, -0.7794806, -2.182353, 1, 0, 0, 1, 1,
-3.023413, -1.272663, -2.140012, 1, 0, 0, 1, 1,
-2.702385, 1.148152, -0.344186, 1, 0, 0, 1, 1,
-2.699254, 0.8281952, -1.573689, 1, 0, 0, 1, 1,
-2.61598, -0.03656916, -2.96265, 0, 0, 0, 1, 1,
-2.602414, -0.7585192, -2.831278, 0, 0, 0, 1, 1,
-2.521772, 0.5098377, -2.483766, 0, 0, 0, 1, 1,
-2.515938, -1.994714, -1.828902, 0, 0, 0, 1, 1,
-2.387734, 0.7696189, -1.029623, 0, 0, 0, 1, 1,
-2.374311, -1.155719, -2.885175, 0, 0, 0, 1, 1,
-2.36295, -0.1493971, -1.274636, 0, 0, 0, 1, 1,
-2.352207, -1.328855, -2.915813, 1, 1, 1, 1, 1,
-2.345269, 1.193149, 0.4410488, 1, 1, 1, 1, 1,
-2.335501, 0.6740677, -1.909275, 1, 1, 1, 1, 1,
-2.285526, -0.007179054, -1.540335, 1, 1, 1, 1, 1,
-2.185484, 0.3986569, 0.4764762, 1, 1, 1, 1, 1,
-2.141309, 0.675121, -0.4101438, 1, 1, 1, 1, 1,
-2.105015, 1.480556, -0.2447113, 1, 1, 1, 1, 1,
-2.093271, -1.324953, -1.321907, 1, 1, 1, 1, 1,
-2.070212, 0.3253433, -1.031406, 1, 1, 1, 1, 1,
-2.04229, -1.537743, -2.047537, 1, 1, 1, 1, 1,
-2.028522, 0.8231114, -0.2743467, 1, 1, 1, 1, 1,
-2.013459, 1.284449, 0.3316833, 1, 1, 1, 1, 1,
-1.965354, 0.8697333, -0.5249099, 1, 1, 1, 1, 1,
-1.961537, -3.179976, -2.189608, 1, 1, 1, 1, 1,
-1.937729, -0.09153824, -2.281862, 1, 1, 1, 1, 1,
-1.937482, 0.6888242, -1.072472, 0, 0, 1, 1, 1,
-1.934958, 0.8384938, -2.646734, 1, 0, 0, 1, 1,
-1.933601, 0.104687, -0.1277036, 1, 0, 0, 1, 1,
-1.930249, -0.001639012, -1.537615, 1, 0, 0, 1, 1,
-1.90212, 0.2470184, -1.745195, 1, 0, 0, 1, 1,
-1.858475, -0.5153649, -1.599661, 1, 0, 0, 1, 1,
-1.857744, 1.245371, -2.057011, 0, 0, 0, 1, 1,
-1.809673, -1.046145, -1.131275, 0, 0, 0, 1, 1,
-1.803661, -1.619421, -1.766526, 0, 0, 0, 1, 1,
-1.799815, -0.04495351, -2.125356, 0, 0, 0, 1, 1,
-1.797261, -0.9752173, -2.58729, 0, 0, 0, 1, 1,
-1.781734, -1.219707, -1.594263, 0, 0, 0, 1, 1,
-1.774932, 1.000314, -1.79933, 0, 0, 0, 1, 1,
-1.774822, -0.3219347, -0.5410358, 1, 1, 1, 1, 1,
-1.773139, -0.2201196, -0.7958649, 1, 1, 1, 1, 1,
-1.772528, -0.1411954, -2.86922, 1, 1, 1, 1, 1,
-1.768354, -0.6444455, -0.3690123, 1, 1, 1, 1, 1,
-1.756446, -1.215146, -1.821169, 1, 1, 1, 1, 1,
-1.752891, -0.05548126, -0.3476053, 1, 1, 1, 1, 1,
-1.719926, 0.5741021, 0.5362391, 1, 1, 1, 1, 1,
-1.702763, -0.2651531, -1.839045, 1, 1, 1, 1, 1,
-1.692108, 0.9220296, -1.203979, 1, 1, 1, 1, 1,
-1.681653, 2.217791, -0.4388563, 1, 1, 1, 1, 1,
-1.680184, -0.0991366, -1.579961, 1, 1, 1, 1, 1,
-1.674434, -2.326315, -2.024948, 1, 1, 1, 1, 1,
-1.637986, -1.439248, -3.01546, 1, 1, 1, 1, 1,
-1.617123, 0.9469436, 0.2196532, 1, 1, 1, 1, 1,
-1.614653, 0.3920181, 1.228354, 1, 1, 1, 1, 1,
-1.596736, 1.57876, -1.722525, 0, 0, 1, 1, 1,
-1.593087, -0.7369092, -2.421852, 1, 0, 0, 1, 1,
-1.592065, -1.316445, -1.027887, 1, 0, 0, 1, 1,
-1.590809, 0.1113111, -1.175417, 1, 0, 0, 1, 1,
-1.590653, -1.221459, -1.725556, 1, 0, 0, 1, 1,
-1.58275, 1.579909, -2.70156, 1, 0, 0, 1, 1,
-1.582489, -0.6087239, -2.478762, 0, 0, 0, 1, 1,
-1.578654, -0.1321765, -2.186905, 0, 0, 0, 1, 1,
-1.575113, -1.400888, -3.551295, 0, 0, 0, 1, 1,
-1.571756, -1.585292, -2.32971, 0, 0, 0, 1, 1,
-1.570832, 1.603251, 0.4042368, 0, 0, 0, 1, 1,
-1.567873, -0.9274446, -1.537276, 0, 0, 0, 1, 1,
-1.553832, 0.004131766, -1.428413, 0, 0, 0, 1, 1,
-1.544606, 1.349928, -3.45645, 1, 1, 1, 1, 1,
-1.538805, 0.6334167, -0.1552219, 1, 1, 1, 1, 1,
-1.524974, -1.001499, -2.071275, 1, 1, 1, 1, 1,
-1.521179, -1.426832, -0.3658747, 1, 1, 1, 1, 1,
-1.517009, -0.2098745, -2.175809, 1, 1, 1, 1, 1,
-1.50963, 0.1382382, -1.078484, 1, 1, 1, 1, 1,
-1.498883, 1.817521, -0.2467793, 1, 1, 1, 1, 1,
-1.491463, 2.394247, -1.276209, 1, 1, 1, 1, 1,
-1.489632, 0.7261328, -2.797462, 1, 1, 1, 1, 1,
-1.489335, 1.152989, 0.5290357, 1, 1, 1, 1, 1,
-1.488215, 0.1273561, -1.931579, 1, 1, 1, 1, 1,
-1.479442, 0.6713217, -1.727028, 1, 1, 1, 1, 1,
-1.477999, -0.5446092, -2.263727, 1, 1, 1, 1, 1,
-1.473087, -1.569232, -3.071605, 1, 1, 1, 1, 1,
-1.472158, -1.198893, -1.587576, 1, 1, 1, 1, 1,
-1.469242, -0.09868465, -1.546576, 0, 0, 1, 1, 1,
-1.440975, -1.958652, -2.812406, 1, 0, 0, 1, 1,
-1.4402, 0.08699714, -2.560457, 1, 0, 0, 1, 1,
-1.435457, 1.989082, 1.14172, 1, 0, 0, 1, 1,
-1.434066, -1.416609, -2.665244, 1, 0, 0, 1, 1,
-1.425578, -0.2016102, -1.768811, 1, 0, 0, 1, 1,
-1.40917, -0.5775055, -2.416687, 0, 0, 0, 1, 1,
-1.405395, 1.157698, -1.05266, 0, 0, 0, 1, 1,
-1.401228, -0.1429157, -2.35396, 0, 0, 0, 1, 1,
-1.392856, 1.286177, -1.600676, 0, 0, 0, 1, 1,
-1.391866, -1.501133, -2.570964, 0, 0, 0, 1, 1,
-1.391464, -0.2004857, -1.787373, 0, 0, 0, 1, 1,
-1.368877, -0.8161195, -2.567153, 0, 0, 0, 1, 1,
-1.36065, 1.031733, -0.5003831, 1, 1, 1, 1, 1,
-1.350031, 1.062433, -1.751194, 1, 1, 1, 1, 1,
-1.349728, -0.8132021, -1.820162, 1, 1, 1, 1, 1,
-1.349419, -0.9413823, -1.858288, 1, 1, 1, 1, 1,
-1.339801, 0.3640836, -1.525884, 1, 1, 1, 1, 1,
-1.339283, 0.5396984, -1.882985, 1, 1, 1, 1, 1,
-1.33881, -0.5476515, -1.243095, 1, 1, 1, 1, 1,
-1.337246, 0.01041328, -0.510551, 1, 1, 1, 1, 1,
-1.33342, 0.1639303, -1.644259, 1, 1, 1, 1, 1,
-1.328631, 0.1748441, 2.652471, 1, 1, 1, 1, 1,
-1.317392, 0.4284868, -0.8011973, 1, 1, 1, 1, 1,
-1.308181, -0.2781952, -1.931741, 1, 1, 1, 1, 1,
-1.301558, -0.7231901, -1.33951, 1, 1, 1, 1, 1,
-1.296823, -0.6207556, -2.127731, 1, 1, 1, 1, 1,
-1.27038, 1.160409, -1.587801, 1, 1, 1, 1, 1,
-1.260456, 0.4232669, -0.3841892, 0, 0, 1, 1, 1,
-1.25994, 1.341951, -0.06212563, 1, 0, 0, 1, 1,
-1.247403, -0.2710996, -1.357795, 1, 0, 0, 1, 1,
-1.244219, -0.7255555, -2.985261, 1, 0, 0, 1, 1,
-1.240921, 0.1493369, -2.093308, 1, 0, 0, 1, 1,
-1.233895, 0.2210349, -1.083944, 1, 0, 0, 1, 1,
-1.226718, 0.3687955, 0.07178029, 0, 0, 0, 1, 1,
-1.224818, 2.09693, 0.0007474343, 0, 0, 0, 1, 1,
-1.205353, 1.098855, -1.20615, 0, 0, 0, 1, 1,
-1.197794, 0.01879891, -1.642032, 0, 0, 0, 1, 1,
-1.194782, -0.9885464, -2.064768, 0, 0, 0, 1, 1,
-1.193791, 0.7179738, -2.573041, 0, 0, 0, 1, 1,
-1.191814, -0.8489115, -3.266202, 0, 0, 0, 1, 1,
-1.187487, 0.8901963, -0.2784879, 1, 1, 1, 1, 1,
-1.18101, 1.038852, -0.2082086, 1, 1, 1, 1, 1,
-1.176426, -0.9272344, -3.350284, 1, 1, 1, 1, 1,
-1.160313, -0.5967091, -2.79139, 1, 1, 1, 1, 1,
-1.15708, 0.2752982, -1.521445, 1, 1, 1, 1, 1,
-1.141349, -0.6415306, -0.7859198, 1, 1, 1, 1, 1,
-1.138458, 0.4373493, -0.8758743, 1, 1, 1, 1, 1,
-1.134565, 0.6187278, -0.07292096, 1, 1, 1, 1, 1,
-1.132793, -2.020953, -1.815154, 1, 1, 1, 1, 1,
-1.127814, -1.838184, -3.154655, 1, 1, 1, 1, 1,
-1.124139, 1.294281, 0.3839563, 1, 1, 1, 1, 1,
-1.115764, -0.1793204, -2.412388, 1, 1, 1, 1, 1,
-1.103968, -0.8424521, -1.851005, 1, 1, 1, 1, 1,
-1.101099, 1.35133, 0.2931022, 1, 1, 1, 1, 1,
-1.086196, 1.264542, -0.6252691, 1, 1, 1, 1, 1,
-1.076237, 1.165715, -1.43801, 0, 0, 1, 1, 1,
-1.072531, 0.2088183, -2.477862, 1, 0, 0, 1, 1,
-1.070683, 0.3069606, -2.655042, 1, 0, 0, 1, 1,
-1.051347, -1.986871, -2.814613, 1, 0, 0, 1, 1,
-1.048507, 0.1935757, -3.018345, 1, 0, 0, 1, 1,
-1.048224, -1.6544, -1.247686, 1, 0, 0, 1, 1,
-1.03961, 0.8315676, 0.6090625, 0, 0, 0, 1, 1,
-1.037595, 0.6234304, -2.698922, 0, 0, 0, 1, 1,
-1.035166, 0.9194294, -0.2939597, 0, 0, 0, 1, 1,
-1.027491, -0.5094588, -1.45645, 0, 0, 0, 1, 1,
-1.016685, -1.423444, -2.621578, 0, 0, 0, 1, 1,
-1.014281, 0.5220892, 0.5666141, 0, 0, 0, 1, 1,
-1.011173, -0.07414968, -1.208944, 0, 0, 0, 1, 1,
-1.010759, 0.5951252, -1.216563, 1, 1, 1, 1, 1,
-1.004904, -0.5122188, -2.335272, 1, 1, 1, 1, 1,
-1.002305, -1.450084, -3.217745, 1, 1, 1, 1, 1,
-0.9987943, -1.242515, 0.2776523, 1, 1, 1, 1, 1,
-0.996375, 1.465517, 0.7522904, 1, 1, 1, 1, 1,
-0.9951076, -0.2821766, -2.796273, 1, 1, 1, 1, 1,
-0.9927158, 0.6223532, -1.826297, 1, 1, 1, 1, 1,
-0.9883485, 0.1712456, -2.007719, 1, 1, 1, 1, 1,
-0.9878172, -1.186324, -2.60084, 1, 1, 1, 1, 1,
-0.9856344, 0.469825, -2.254992, 1, 1, 1, 1, 1,
-0.9828023, -0.6014506, -3.107527, 1, 1, 1, 1, 1,
-0.9804368, 0.5024356, -1.7802, 1, 1, 1, 1, 1,
-0.9793288, 1.092617, 0.3067801, 1, 1, 1, 1, 1,
-0.9725554, -0.01021876, -1.769334, 1, 1, 1, 1, 1,
-0.9697669, -0.4203381, -2.612267, 1, 1, 1, 1, 1,
-0.9628569, -0.4226213, -0.2707544, 0, 0, 1, 1, 1,
-0.962723, 0.4482866, 0.5543137, 1, 0, 0, 1, 1,
-0.9576001, 0.4441424, -1.084755, 1, 0, 0, 1, 1,
-0.9540546, 0.1057442, 0.2767067, 1, 0, 0, 1, 1,
-0.9510738, 0.5294361, -0.3756533, 1, 0, 0, 1, 1,
-0.9482486, 0.03820611, -1.233106, 1, 0, 0, 1, 1,
-0.9441674, 0.1371592, -0.9676558, 0, 0, 0, 1, 1,
-0.9390104, -0.200816, -3.407197, 0, 0, 0, 1, 1,
-0.9381097, 0.6740095, -0.389075, 0, 0, 0, 1, 1,
-0.9342564, 1.265756, -0.3321314, 0, 0, 0, 1, 1,
-0.9275972, 0.2685367, -1.137112, 0, 0, 0, 1, 1,
-0.9253563, -1.649696, -1.548236, 0, 0, 0, 1, 1,
-0.9247019, 0.2898854, -0.8543497, 0, 0, 0, 1, 1,
-0.9173505, -0.5711104, -1.617016, 1, 1, 1, 1, 1,
-0.9162523, 1.469212, 1.115031, 1, 1, 1, 1, 1,
-0.902926, 2.153261, -0.07604311, 1, 1, 1, 1, 1,
-0.8986966, -0.1580338, 0.6876726, 1, 1, 1, 1, 1,
-0.8965649, -0.2744201, -2.611638, 1, 1, 1, 1, 1,
-0.8964922, -0.02820618, -1.749457, 1, 1, 1, 1, 1,
-0.8913243, -1.532127, -1.884816, 1, 1, 1, 1, 1,
-0.8903641, -0.3902626, -2.350338, 1, 1, 1, 1, 1,
-0.8894863, 0.6690916, 0.03995137, 1, 1, 1, 1, 1,
-0.8782831, -1.292019, -1.403673, 1, 1, 1, 1, 1,
-0.877538, -0.0718036, -0.03631765, 1, 1, 1, 1, 1,
-0.8759257, -2.036283, -3.308356, 1, 1, 1, 1, 1,
-0.8741763, 0.6959331, -0.8793136, 1, 1, 1, 1, 1,
-0.8728288, -1.148987, -3.518272, 1, 1, 1, 1, 1,
-0.8693683, 0.01670303, -1.659113, 1, 1, 1, 1, 1,
-0.8662672, -1.105637, -1.469139, 0, 0, 1, 1, 1,
-0.8650963, -0.1138597, -1.35202, 1, 0, 0, 1, 1,
-0.8526196, -0.1777117, -1.853446, 1, 0, 0, 1, 1,
-0.8501257, -0.1779591, -0.8380802, 1, 0, 0, 1, 1,
-0.8483046, -0.6749151, -3.735109, 1, 0, 0, 1, 1,
-0.8426976, 0.4304888, 0.6544765, 1, 0, 0, 1, 1,
-0.8374867, 0.2424715, -1.238449, 0, 0, 0, 1, 1,
-0.834008, -1.734991, -1.731953, 0, 0, 0, 1, 1,
-0.8338693, 0.6035488, 0.1265962, 0, 0, 0, 1, 1,
-0.8335804, -2.275615, -2.702682, 0, 0, 0, 1, 1,
-0.8320461, 0.6285604, -0.2825885, 0, 0, 0, 1, 1,
-0.8304599, -1.269632, -1.084661, 0, 0, 0, 1, 1,
-0.8298368, 0.1894894, -0.7152787, 0, 0, 0, 1, 1,
-0.8240879, -1.931738, -2.383281, 1, 1, 1, 1, 1,
-0.8111242, 2.229443, -0.3224074, 1, 1, 1, 1, 1,
-0.8074996, 0.8811216, 0.2865876, 1, 1, 1, 1, 1,
-0.8073554, -0.9873784, -0.9561421, 1, 1, 1, 1, 1,
-0.8057591, 0.327214, -2.690643, 1, 1, 1, 1, 1,
-0.801518, 0.5095659, -1.102567, 1, 1, 1, 1, 1,
-0.8001373, -0.9903055, -4.273447, 1, 1, 1, 1, 1,
-0.7976326, 0.3580832, -1.738343, 1, 1, 1, 1, 1,
-0.7940359, 1.540761, -3.803208, 1, 1, 1, 1, 1,
-0.7883704, 1.434397, -1.468178, 1, 1, 1, 1, 1,
-0.7867639, -0.7163514, -1.814541, 1, 1, 1, 1, 1,
-0.7865099, 2.677844, -1.180123, 1, 1, 1, 1, 1,
-0.7860571, -0.6863334, -1.323777, 1, 1, 1, 1, 1,
-0.7858272, 0.2626102, -3.01682, 1, 1, 1, 1, 1,
-0.7763512, 1.009412, 2.667342, 1, 1, 1, 1, 1,
-0.7753854, -0.5522123, -2.864822, 0, 0, 1, 1, 1,
-0.7715451, 1.262076, -0.2498501, 1, 0, 0, 1, 1,
-0.7685342, -1.578324, -2.658028, 1, 0, 0, 1, 1,
-0.7665039, -0.02446237, -0.0940958, 1, 0, 0, 1, 1,
-0.7622853, 1.174122, 0.04071792, 1, 0, 0, 1, 1,
-0.7494628, 0.8189603, -1.364686, 1, 0, 0, 1, 1,
-0.747676, -0.2420672, -1.392475, 0, 0, 0, 1, 1,
-0.744393, 2.035849, -1.092449, 0, 0, 0, 1, 1,
-0.7422619, 1.356615, -2.110999, 0, 0, 0, 1, 1,
-0.7362458, -1.972474, -5.112362, 0, 0, 0, 1, 1,
-0.7338418, -1.383848, -2.861814, 0, 0, 0, 1, 1,
-0.7304907, -0.2979878, -4.096191, 0, 0, 0, 1, 1,
-0.7280684, -2.571436, -2.125166, 0, 0, 0, 1, 1,
-0.7237251, 0.290696, -1.886884, 1, 1, 1, 1, 1,
-0.7220866, 0.1908102, -1.754548, 1, 1, 1, 1, 1,
-0.7190318, 0.522123, -1.585033, 1, 1, 1, 1, 1,
-0.7118716, -0.7751489, -0.01450188, 1, 1, 1, 1, 1,
-0.7111017, 2.677553, -0.6765285, 1, 1, 1, 1, 1,
-0.7062436, -0.5892689, -2.765633, 1, 1, 1, 1, 1,
-0.7010236, -1.080469, -4.374209, 1, 1, 1, 1, 1,
-0.697589, 0.2589585, -0.7844287, 1, 1, 1, 1, 1,
-0.6940176, -0.3507446, -1.277784, 1, 1, 1, 1, 1,
-0.6933923, -1.051088, -3.757123, 1, 1, 1, 1, 1,
-0.6912918, 0.2893998, 0.7667145, 1, 1, 1, 1, 1,
-0.6911669, 1.093691, -1.388273, 1, 1, 1, 1, 1,
-0.6823868, -2.553622, -4.33106, 1, 1, 1, 1, 1,
-0.6809456, 0.5099337, -0.695492, 1, 1, 1, 1, 1,
-0.6784733, 1.503978, -0.3256746, 1, 1, 1, 1, 1,
-0.6759073, 0.4505174, -0.2445417, 0, 0, 1, 1, 1,
-0.6751356, 0.5848076, -1.073214, 1, 0, 0, 1, 1,
-0.6721057, 0.7658059, -0.307444, 1, 0, 0, 1, 1,
-0.6699128, 1.477415, -0.8149342, 1, 0, 0, 1, 1,
-0.6663922, -0.074538, -0.5296137, 1, 0, 0, 1, 1,
-0.6591821, 0.14943, 0.5352312, 1, 0, 0, 1, 1,
-0.6591185, -0.4138953, -1.681438, 0, 0, 0, 1, 1,
-0.6586183, -1.546021, -1.645607, 0, 0, 0, 1, 1,
-0.6579431, -0.4172256, -3.575474, 0, 0, 0, 1, 1,
-0.6566944, -0.1929435, -0.5553712, 0, 0, 0, 1, 1,
-0.654446, 1.389114, -1.382328, 0, 0, 0, 1, 1,
-0.6489274, -1.01646, -2.86669, 0, 0, 0, 1, 1,
-0.648805, 1.720872, 0.2957408, 0, 0, 0, 1, 1,
-0.6469569, 2.265752, -0.1070335, 1, 1, 1, 1, 1,
-0.640599, 1.187628, -1.934561, 1, 1, 1, 1, 1,
-0.6404935, 0.8178399, -1.355548, 1, 1, 1, 1, 1,
-0.6390862, 1.878166, -0.08744831, 1, 1, 1, 1, 1,
-0.6379617, 1.655005, -0.9422842, 1, 1, 1, 1, 1,
-0.6365204, -0.7109695, -3.610956, 1, 1, 1, 1, 1,
-0.6351429, -0.2122646, -2.248652, 1, 1, 1, 1, 1,
-0.6343026, 0.1586853, -1.518446, 1, 1, 1, 1, 1,
-0.6308373, 0.004379439, -0.2847288, 1, 1, 1, 1, 1,
-0.6272103, 0.2633341, -0.08501918, 1, 1, 1, 1, 1,
-0.6232014, 0.6813071, 1.104196, 1, 1, 1, 1, 1,
-0.619377, 0.9012807, -0.672041, 1, 1, 1, 1, 1,
-0.6160012, 0.591023, -1.311466, 1, 1, 1, 1, 1,
-0.6141682, 1.201071, -2.043239, 1, 1, 1, 1, 1,
-0.6094687, -0.3194657, -3.564542, 1, 1, 1, 1, 1,
-0.6094474, 1.62034, -1.004474, 0, 0, 1, 1, 1,
-0.6070918, -0.3641264, -2.542505, 1, 0, 0, 1, 1,
-0.6050166, 0.7817413, 0.03987252, 1, 0, 0, 1, 1,
-0.592193, -1.222049, -2.616469, 1, 0, 0, 1, 1,
-0.5921202, -0.9819899, -2.905005, 1, 0, 0, 1, 1,
-0.5840657, -1.836057, -2.79463, 1, 0, 0, 1, 1,
-0.5830593, -0.7883145, -2.002428, 0, 0, 0, 1, 1,
-0.5808599, 1.078944, -0.7371498, 0, 0, 0, 1, 1,
-0.562126, 0.7838407, -2.48004, 0, 0, 0, 1, 1,
-0.561727, -0.3646491, -2.823464, 0, 0, 0, 1, 1,
-0.5569794, -1.64728, -2.83371, 0, 0, 0, 1, 1,
-0.5526908, 0.3453902, 0.2338117, 0, 0, 0, 1, 1,
-0.5506374, 0.114914, -1.585778, 0, 0, 0, 1, 1,
-0.5479755, 0.7421643, 0.5218467, 1, 1, 1, 1, 1,
-0.5451953, -0.3262018, -2.430681, 1, 1, 1, 1, 1,
-0.5366483, 0.2008596, -0.3749979, 1, 1, 1, 1, 1,
-0.5325601, 0.1154547, -3.958118, 1, 1, 1, 1, 1,
-0.5311395, -0.1643598, -3.611087, 1, 1, 1, 1, 1,
-0.5310578, 0.04087594, -1.827035, 1, 1, 1, 1, 1,
-0.5298586, 0.4760077, -0.5927715, 1, 1, 1, 1, 1,
-0.5271428, 0.3542247, -1.052052, 1, 1, 1, 1, 1,
-0.5269436, -0.4330681, -2.201138, 1, 1, 1, 1, 1,
-0.5251034, -0.5124369, -4.174324, 1, 1, 1, 1, 1,
-0.5208273, 1.825824, 0.4201271, 1, 1, 1, 1, 1,
-0.5186164, 0.4466955, -1.478024, 1, 1, 1, 1, 1,
-0.5172458, -0.3015397, -1.94463, 1, 1, 1, 1, 1,
-0.51406, 0.6192494, 0.3405614, 1, 1, 1, 1, 1,
-0.5120257, -0.1464312, -3.031977, 1, 1, 1, 1, 1,
-0.5105195, 0.8320935, 0.2493244, 0, 0, 1, 1, 1,
-0.5029862, -0.2390556, -1.522567, 1, 0, 0, 1, 1,
-0.4979303, -1.711293, -3.478963, 1, 0, 0, 1, 1,
-0.4962915, -0.5275151, -2.967031, 1, 0, 0, 1, 1,
-0.4961677, 1.151067, -0.773511, 1, 0, 0, 1, 1,
-0.490119, 0.7465435, -0.8998151, 1, 0, 0, 1, 1,
-0.4895824, -1.722157, -3.153163, 0, 0, 0, 1, 1,
-0.4835854, -0.6931431, -2.160759, 0, 0, 0, 1, 1,
-0.4822608, -0.6478896, -3.381629, 0, 0, 0, 1, 1,
-0.4800876, 0.2312743, -0.2836986, 0, 0, 0, 1, 1,
-0.4798723, 1.711789, -0.4852765, 0, 0, 0, 1, 1,
-0.4796381, 0.8440216, 0.35946, 0, 0, 0, 1, 1,
-0.4783496, 0.3966514, -0.7094514, 0, 0, 0, 1, 1,
-0.4747692, -0.06396455, -2.742692, 1, 1, 1, 1, 1,
-0.4704086, 1.895765, 0.590107, 1, 1, 1, 1, 1,
-0.4660959, -1.040035, -2.769001, 1, 1, 1, 1, 1,
-0.4658138, -1.014317, -3.642138, 1, 1, 1, 1, 1,
-0.4597949, -0.6673987, -1.046747, 1, 1, 1, 1, 1,
-0.4552294, 0.1059086, -0.8765705, 1, 1, 1, 1, 1,
-0.4456432, -0.4795945, -0.6750172, 1, 1, 1, 1, 1,
-0.4442622, -0.004637323, -2.672232, 1, 1, 1, 1, 1,
-0.443731, 1.177389, -0.1269158, 1, 1, 1, 1, 1,
-0.4430301, -0.4529215, -2.842054, 1, 1, 1, 1, 1,
-0.4421371, -0.04756802, -2.218129, 1, 1, 1, 1, 1,
-0.4390716, -0.2031376, -1.372872, 1, 1, 1, 1, 1,
-0.4375384, 0.1519015, -0.4715008, 1, 1, 1, 1, 1,
-0.431925, -2.683837, -3.109823, 1, 1, 1, 1, 1,
-0.4238791, -0.5048131, -3.047539, 1, 1, 1, 1, 1,
-0.42314, -0.2007626, -3.257129, 0, 0, 1, 1, 1,
-0.4229676, -1.903067, -3.290079, 1, 0, 0, 1, 1,
-0.4206274, 0.5840114, -0.3541557, 1, 0, 0, 1, 1,
-0.4188779, -0.3897682, -2.113374, 1, 0, 0, 1, 1,
-0.4182182, -0.1343583, -2.201867, 1, 0, 0, 1, 1,
-0.4135554, -0.2791625, -1.789834, 1, 0, 0, 1, 1,
-0.412217, -0.6539387, -1.101538, 0, 0, 0, 1, 1,
-0.4067157, -0.5078868, -1.324673, 0, 0, 0, 1, 1,
-0.4053192, -3.180721, -3.256649, 0, 0, 0, 1, 1,
-0.4021401, -0.4708687, -4.888466, 0, 0, 0, 1, 1,
-0.3965491, -0.4940274, -2.017668, 0, 0, 0, 1, 1,
-0.3896783, -1.367955, -3.106575, 0, 0, 0, 1, 1,
-0.3891969, -0.5878214, -3.98147, 0, 0, 0, 1, 1,
-0.3870694, 0.1795408, -1.64689, 1, 1, 1, 1, 1,
-0.3816939, 0.07153394, 0.2253515, 1, 1, 1, 1, 1,
-0.381665, 0.3876498, -0.937887, 1, 1, 1, 1, 1,
-0.3795706, 0.2006198, -0.2185594, 1, 1, 1, 1, 1,
-0.3783927, -0.8729644, -3.526826, 1, 1, 1, 1, 1,
-0.37331, -0.1257153, -3.534934, 1, 1, 1, 1, 1,
-0.3725697, 0.8899519, -0.04880602, 1, 1, 1, 1, 1,
-0.3692315, 1.099232, -0.1340892, 1, 1, 1, 1, 1,
-0.3656273, -0.8065538, -1.949422, 1, 1, 1, 1, 1,
-0.3624204, 0.8150438, -0.4019252, 1, 1, 1, 1, 1,
-0.3623422, 1.515394, -0.3302436, 1, 1, 1, 1, 1,
-0.360707, 0.02337598, -1.899865, 1, 1, 1, 1, 1,
-0.3602574, 0.03970173, -0.4795801, 1, 1, 1, 1, 1,
-0.3561391, -0.7665328, -2.075676, 1, 1, 1, 1, 1,
-0.3532348, -0.3489799, -2.69067, 1, 1, 1, 1, 1,
-0.3437313, -0.1304964, -2.6086, 0, 0, 1, 1, 1,
-0.3379946, -0.344661, -3.573179, 1, 0, 0, 1, 1,
-0.3338163, -0.4922667, -3.986666, 1, 0, 0, 1, 1,
-0.3277866, -0.2535684, -1.648759, 1, 0, 0, 1, 1,
-0.3275378, 0.3911132, -1.624849, 1, 0, 0, 1, 1,
-0.3257676, 0.5038609, 0.4279031, 1, 0, 0, 1, 1,
-0.3244691, -0.9682975, -1.871054, 0, 0, 0, 1, 1,
-0.3205778, 1.502021, 1.519203, 0, 0, 0, 1, 1,
-0.3204356, 0.8124304, 0.2119029, 0, 0, 0, 1, 1,
-0.3194329, 0.6507, -1.53649, 0, 0, 0, 1, 1,
-0.3191366, 1.214607, 0.07723514, 0, 0, 0, 1, 1,
-0.3168002, -0.06660299, -3.085705, 0, 0, 0, 1, 1,
-0.2995245, -0.1305752, -2.311044, 0, 0, 0, 1, 1,
-0.2942088, -0.3841053, -2.697582, 1, 1, 1, 1, 1,
-0.2933429, -0.07996202, -1.686321, 1, 1, 1, 1, 1,
-0.2926146, -1.177763, -2.66038, 1, 1, 1, 1, 1,
-0.2925826, -0.5192826, -2.560098, 1, 1, 1, 1, 1,
-0.2922582, 0.8746437, -0.1885312, 1, 1, 1, 1, 1,
-0.2907115, 1.573464, 1.262082, 1, 1, 1, 1, 1,
-0.2906618, -0.3305439, -3.728148, 1, 1, 1, 1, 1,
-0.2901206, 1.310397, -0.9867532, 1, 1, 1, 1, 1,
-0.2897622, 0.4957696, -0.9027066, 1, 1, 1, 1, 1,
-0.2893648, 0.3081098, 0.009446761, 1, 1, 1, 1, 1,
-0.2872497, -1.316301, -3.116459, 1, 1, 1, 1, 1,
-0.2870925, 0.5958483, -1.530379, 1, 1, 1, 1, 1,
-0.287057, -0.9593026, -1.191728, 1, 1, 1, 1, 1,
-0.2842038, -1.15863, -4.335737, 1, 1, 1, 1, 1,
-0.2819246, -0.8811359, -4.131993, 1, 1, 1, 1, 1,
-0.2777039, -0.03432456, -1.345906, 0, 0, 1, 1, 1,
-0.277248, -1.145931, -3.046675, 1, 0, 0, 1, 1,
-0.2751849, 1.582232, 0.3262282, 1, 0, 0, 1, 1,
-0.2737895, 0.6767853, 0.6156176, 1, 0, 0, 1, 1,
-0.2720303, 0.8906701, -2.717959, 1, 0, 0, 1, 1,
-0.2714517, -0.1547271, -0.6803801, 1, 0, 0, 1, 1,
-0.2694545, -0.403089, -3.323159, 0, 0, 0, 1, 1,
-0.2670938, 1.140667, -0.3615878, 0, 0, 0, 1, 1,
-0.2629172, 0.1179568, -1.626237, 0, 0, 0, 1, 1,
-0.2619789, -1.272908, -3.362923, 0, 0, 0, 1, 1,
-0.2613178, -1.871225, -3.994043, 0, 0, 0, 1, 1,
-0.2613133, -0.08767692, -2.624499, 0, 0, 0, 1, 1,
-0.2578901, -1.643438, -1.238335, 0, 0, 0, 1, 1,
-0.2570703, -0.09319201, -2.554516, 1, 1, 1, 1, 1,
-0.2556847, 1.893122, 1.003565, 1, 1, 1, 1, 1,
-0.2542086, -0.4160813, -2.777387, 1, 1, 1, 1, 1,
-0.2466129, -0.7682679, -0.8887383, 1, 1, 1, 1, 1,
-0.2430841, 0.1024774, 0.05709837, 1, 1, 1, 1, 1,
-0.2381561, -1.659661, -3.069912, 1, 1, 1, 1, 1,
-0.2359116, 0.5410445, -1.362453, 1, 1, 1, 1, 1,
-0.2341295, -0.5032926, -2.298918, 1, 1, 1, 1, 1,
-0.231352, -2.000314, -2.275293, 1, 1, 1, 1, 1,
-0.2250907, 0.3626972, -1.049818, 1, 1, 1, 1, 1,
-0.2227135, -1.025071, -2.769241, 1, 1, 1, 1, 1,
-0.2217448, 1.293715, 0.862965, 1, 1, 1, 1, 1,
-0.2187208, -0.02455201, -3.264913, 1, 1, 1, 1, 1,
-0.2152638, 0.2289909, -0.1087405, 1, 1, 1, 1, 1,
-0.2147154, -0.6981339, -2.067199, 1, 1, 1, 1, 1,
-0.2132557, -0.07017139, -1.382248, 0, 0, 1, 1, 1,
-0.2119548, 0.1002906, 0.4418036, 1, 0, 0, 1, 1,
-0.2067855, 1.488826, -0.8493212, 1, 0, 0, 1, 1,
-0.2051208, 1.855267, 0.1717691, 1, 0, 0, 1, 1,
-0.2049173, -0.6756786, -2.021499, 1, 0, 0, 1, 1,
-0.2038186, -2.007763, -4.148096, 1, 0, 0, 1, 1,
-0.2018546, 0.483999, -0.3678561, 0, 0, 0, 1, 1,
-0.1991352, -1.710274, -2.615087, 0, 0, 0, 1, 1,
-0.1978063, 0.2523654, -2.38232, 0, 0, 0, 1, 1,
-0.1918979, -0.6894774, -2.205502, 0, 0, 0, 1, 1,
-0.1905302, 0.9131048, 0.7534934, 0, 0, 0, 1, 1,
-0.1863489, 0.7951013, -1.306839, 0, 0, 0, 1, 1,
-0.1841387, -2.099216, -3.413883, 0, 0, 0, 1, 1,
-0.1789038, -1.268587, -3.178416, 1, 1, 1, 1, 1,
-0.1777894, -0.3405265, -3.686507, 1, 1, 1, 1, 1,
-0.1776671, 0.5838562, -0.0629601, 1, 1, 1, 1, 1,
-0.1770679, 0.006357207, 0.9166057, 1, 1, 1, 1, 1,
-0.1752062, -0.0250036, -2.472358, 1, 1, 1, 1, 1,
-0.1726723, -1.5558, -3.828377, 1, 1, 1, 1, 1,
-0.1701154, 0.8257985, -0.04895101, 1, 1, 1, 1, 1,
-0.1652942, -0.254826, -2.135869, 1, 1, 1, 1, 1,
-0.1645448, -0.6769964, -2.151045, 1, 1, 1, 1, 1,
-0.1618668, 1.106759, -1.412406, 1, 1, 1, 1, 1,
-0.1582305, 1.311314, -0.6522446, 1, 1, 1, 1, 1,
-0.1558043, 0.855427, -0.7762943, 1, 1, 1, 1, 1,
-0.1557356, -1.532838, -3.977899, 1, 1, 1, 1, 1,
-0.1521666, 0.2337128, -0.08139517, 1, 1, 1, 1, 1,
-0.1509839, -1.391803, -2.453376, 1, 1, 1, 1, 1,
-0.149313, -1.055365, -2.644691, 0, 0, 1, 1, 1,
-0.1479678, 0.5311637, -0.4883264, 1, 0, 0, 1, 1,
-0.1423357, 1.82995, 1.361229, 1, 0, 0, 1, 1,
-0.1412135, -2.082589, -2.410433, 1, 0, 0, 1, 1,
-0.1405135, -0.8174787, -3.106839, 1, 0, 0, 1, 1,
-0.1400358, -1.52545, -2.164095, 1, 0, 0, 1, 1,
-0.1373895, 2.892503, -0.292066, 0, 0, 0, 1, 1,
-0.1349725, 1.809892, 1.316444, 0, 0, 0, 1, 1,
-0.1330516, -0.1182875, -3.76231, 0, 0, 0, 1, 1,
-0.1327404, -2.995847, -5.018728, 0, 0, 0, 1, 1,
-0.1300509, 0.1399656, -1.909394, 0, 0, 0, 1, 1,
-0.1288576, 1.288301, -0.5622886, 0, 0, 0, 1, 1,
-0.121673, -1.1584, -2.803244, 0, 0, 0, 1, 1,
-0.1168027, -0.6561078, -3.511156, 1, 1, 1, 1, 1,
-0.1136446, -0.957342, -3.313561, 1, 1, 1, 1, 1,
-0.1125847, 0.0822482, -1.138764, 1, 1, 1, 1, 1,
-0.1117649, 1.146108, -0.4359514, 1, 1, 1, 1, 1,
-0.1117066, 0.8118858, 0.8991439, 1, 1, 1, 1, 1,
-0.1097435, -0.7552686, -2.66215, 1, 1, 1, 1, 1,
-0.109711, -0.1030777, 0.299365, 1, 1, 1, 1, 1,
-0.1078777, 0.06081365, -1.025732, 1, 1, 1, 1, 1,
-0.1003245, 0.7315788, 1.023323, 1, 1, 1, 1, 1,
-0.09857763, 0.781946, -1.467712, 1, 1, 1, 1, 1,
-0.09747107, -0.09636544, -1.71686, 1, 1, 1, 1, 1,
-0.09345938, -0.6202244, -1.863137, 1, 1, 1, 1, 1,
-0.09324737, 0.1188322, -0.708319, 1, 1, 1, 1, 1,
-0.09089411, -0.2359583, -2.948003, 1, 1, 1, 1, 1,
-0.08666798, -0.7764981, -2.391637, 1, 1, 1, 1, 1,
-0.08500998, -1.373401, -3.527932, 0, 0, 1, 1, 1,
-0.08447891, -0.7983851, -3.953328, 1, 0, 0, 1, 1,
-0.08371013, -0.06094675, -1.595813, 1, 0, 0, 1, 1,
-0.08327892, -0.2814517, -1.472689, 1, 0, 0, 1, 1,
-0.08176407, -1.016868, -3.9416, 1, 0, 0, 1, 1,
-0.08150517, 1.355696, 0.3394705, 1, 0, 0, 1, 1,
-0.07987643, 1.957936, -1.648737, 0, 0, 0, 1, 1,
-0.07833251, -2.674656, -1.434341, 0, 0, 0, 1, 1,
-0.07762927, 1.423351, 0.5878934, 0, 0, 0, 1, 1,
-0.0721838, -0.749265, -2.410374, 0, 0, 0, 1, 1,
-0.07171423, -2.006023, -2.842015, 0, 0, 0, 1, 1,
-0.06638548, 0.7657821, -0.8766183, 0, 0, 0, 1, 1,
-0.06121749, 0.2970816, 1.67698, 0, 0, 0, 1, 1,
-0.06073243, 0.1706173, 1.583156, 1, 1, 1, 1, 1,
-0.05962908, -0.4760203, -3.627558, 1, 1, 1, 1, 1,
-0.05783691, 0.5476325, -0.08929615, 1, 1, 1, 1, 1,
-0.05471158, -0.7710325, -2.627217, 1, 1, 1, 1, 1,
-0.05176117, 0.2737927, -0.3230833, 1, 1, 1, 1, 1,
-0.0515668, -1.513664, -2.164102, 1, 1, 1, 1, 1,
-0.05045701, -0.01899961, -1.354638, 1, 1, 1, 1, 1,
-0.05003327, 0.6773399, -0.07534657, 1, 1, 1, 1, 1,
-0.04700531, 0.566067, 0.4212257, 1, 1, 1, 1, 1,
-0.04671783, 1.234231, -0.5216904, 1, 1, 1, 1, 1,
-0.04281087, 1.317175, 1.415096, 1, 1, 1, 1, 1,
-0.04196051, -1.571297, -2.957913, 1, 1, 1, 1, 1,
-0.0399758, 0.11371, -0.6152807, 1, 1, 1, 1, 1,
-0.03836387, -1.069438, -2.803051, 1, 1, 1, 1, 1,
-0.03834444, -0.9174916, -2.771883, 1, 1, 1, 1, 1,
-0.03605979, 0.4965964, 0.1287151, 0, 0, 1, 1, 1,
-0.03078407, 0.4366617, -0.1505684, 1, 0, 0, 1, 1,
-0.02932716, -0.6823276, -5.546651, 1, 0, 0, 1, 1,
-0.02804035, -1.182177, -3.188179, 1, 0, 0, 1, 1,
-0.02699749, 0.004462202, -1.411015, 1, 0, 0, 1, 1,
-0.02534866, -1.12972, -1.494404, 1, 0, 0, 1, 1,
-0.02286628, 1.220155, -1.979643, 0, 0, 0, 1, 1,
-0.02053277, 1.137103, -0.06085273, 0, 0, 0, 1, 1,
-0.01992198, -1.043368, -2.270517, 0, 0, 0, 1, 1,
-0.01706885, 0.2306051, 0.9532754, 0, 0, 0, 1, 1,
-0.01698704, -0.3562186, -1.754169, 0, 0, 0, 1, 1,
-0.01685303, 0.7968544, -0.323393, 0, 0, 0, 1, 1,
-0.01667288, -1.562232, -3.866157, 0, 0, 0, 1, 1,
-0.01554384, -0.07335727, -2.857768, 1, 1, 1, 1, 1,
-0.01502634, 0.6153409, -0.3607303, 1, 1, 1, 1, 1,
-0.01446575, 0.3534261, -1.349158, 1, 1, 1, 1, 1,
-0.01111805, 0.007923049, -1.678778, 1, 1, 1, 1, 1,
-0.009575624, -0.4903106, -3.625675, 1, 1, 1, 1, 1,
-0.005666498, -0.112548, -4.109447, 1, 1, 1, 1, 1,
-0.002121549, 0.3004032, 0.3177545, 1, 1, 1, 1, 1,
0.001311899, 1.198593, -1.271816, 1, 1, 1, 1, 1,
0.007493704, 0.07783262, 0.6553003, 1, 1, 1, 1, 1,
0.00843981, -0.9606982, 2.838315, 1, 1, 1, 1, 1,
0.008891106, 0.3024339, -0.4635104, 1, 1, 1, 1, 1,
0.01276188, 0.5728861, -0.6106808, 1, 1, 1, 1, 1,
0.01312071, -0.001735771, 1.66075, 1, 1, 1, 1, 1,
0.02366682, 0.05908745, 0.3653361, 1, 1, 1, 1, 1,
0.03029252, -1.4838, 4.21255, 1, 1, 1, 1, 1,
0.03347942, 0.06117044, 0.9760534, 0, 0, 1, 1, 1,
0.03469105, 0.7836167, 2.173361, 1, 0, 0, 1, 1,
0.03546108, -0.7084309, 2.228421, 1, 0, 0, 1, 1,
0.03718561, -1.049349, 3.726219, 1, 0, 0, 1, 1,
0.04301682, 0.615065, -0.3095823, 1, 0, 0, 1, 1,
0.04438726, 1.626865, 0.009751263, 1, 0, 0, 1, 1,
0.04567044, 1.498461, 0.7856345, 0, 0, 0, 1, 1,
0.04700639, 2.37644, 0.6601118, 0, 0, 0, 1, 1,
0.04819483, 0.5848034, 1.796446, 0, 0, 0, 1, 1,
0.05352449, 1.18884, 0.09377117, 0, 0, 0, 1, 1,
0.05607714, 0.2814177, 1.298284, 0, 0, 0, 1, 1,
0.06047434, -0.4078121, 4.965906, 0, 0, 0, 1, 1,
0.06354674, -0.6601119, 3.243135, 0, 0, 0, 1, 1,
0.06920621, -0.1746965, 0.9072089, 1, 1, 1, 1, 1,
0.07388479, -0.01660849, 0.09700287, 1, 1, 1, 1, 1,
0.07449724, -0.1362553, 1.891597, 1, 1, 1, 1, 1,
0.07916819, -0.6514718, 3.821452, 1, 1, 1, 1, 1,
0.07930118, 0.03221435, 1.324385, 1, 1, 1, 1, 1,
0.07948246, 0.1434965, -1.688193, 1, 1, 1, 1, 1,
0.08382706, 1.062684, 1.312816, 1, 1, 1, 1, 1,
0.0839809, 0.1468934, 0.09465186, 1, 1, 1, 1, 1,
0.08968513, -1.059566, 3.829035, 1, 1, 1, 1, 1,
0.1022181, -1.106185, 2.849519, 1, 1, 1, 1, 1,
0.1033246, -0.8174696, 4.195863, 1, 1, 1, 1, 1,
0.1060675, -1.23656, 3.096602, 1, 1, 1, 1, 1,
0.1091318, -0.03895946, 1.432667, 1, 1, 1, 1, 1,
0.1102096, -1.315934, 2.500113, 1, 1, 1, 1, 1,
0.1267937, -0.7663376, 1.933092, 1, 1, 1, 1, 1,
0.1282917, 0.8185973, 0.007440761, 0, 0, 1, 1, 1,
0.1286324, -0.4523795, 2.124488, 1, 0, 0, 1, 1,
0.1310841, 0.8096716, -0.7038467, 1, 0, 0, 1, 1,
0.1311738, -2.157393, 2.278583, 1, 0, 0, 1, 1,
0.1327402, 0.05572955, 0.5100496, 1, 0, 0, 1, 1,
0.1359142, 1.968507, -0.973789, 1, 0, 0, 1, 1,
0.137546, 0.482806, 1.586972, 0, 0, 0, 1, 1,
0.1404716, -0.2551782, 2.462607, 0, 0, 0, 1, 1,
0.1446466, -1.813878, 2.569665, 0, 0, 0, 1, 1,
0.144966, -1.003824, 1.960657, 0, 0, 0, 1, 1,
0.1471154, -0.5991794, 2.688174, 0, 0, 0, 1, 1,
0.1478868, 1.740795, 1.36112, 0, 0, 0, 1, 1,
0.1548223, 0.5458711, -0.4015553, 0, 0, 0, 1, 1,
0.1553049, 0.3641597, -0.727758, 1, 1, 1, 1, 1,
0.1559907, -0.5484253, 4.418501, 1, 1, 1, 1, 1,
0.1561866, 0.9845354, -0.7603786, 1, 1, 1, 1, 1,
0.1578303, -1.205778, 1.920281, 1, 1, 1, 1, 1,
0.1588681, 0.9661908, -0.2097555, 1, 1, 1, 1, 1,
0.1644494, 0.00377001, 1.119101, 1, 1, 1, 1, 1,
0.1659773, 0.6806451, -0.9965784, 1, 1, 1, 1, 1,
0.1678757, 0.6904252, -1.046589, 1, 1, 1, 1, 1,
0.1694873, 0.9512097, 1.626931, 1, 1, 1, 1, 1,
0.1765665, 2.040118, -0.6390132, 1, 1, 1, 1, 1,
0.1766023, 1.033255, 2.392395, 1, 1, 1, 1, 1,
0.1785284, -1.837443, 2.365211, 1, 1, 1, 1, 1,
0.1797046, -0.09433386, 2.980398, 1, 1, 1, 1, 1,
0.1799503, 0.4527034, -0.9179905, 1, 1, 1, 1, 1,
0.1812623, 2.541832, -0.5351072, 1, 1, 1, 1, 1,
0.1850702, -0.329606, 2.734272, 0, 0, 1, 1, 1,
0.1856792, 1.420204, 1.108127, 1, 0, 0, 1, 1,
0.1916338, 0.2973882, 1.358558, 1, 0, 0, 1, 1,
0.1927679, 0.6512025, -0.09031148, 1, 0, 0, 1, 1,
0.1934404, 0.8266543, 0.07033049, 1, 0, 0, 1, 1,
0.1950266, -1.608754, 3.462227, 1, 0, 0, 1, 1,
0.2099347, 0.5080777, -1.258309, 0, 0, 0, 1, 1,
0.2158491, -0.07143028, 5.200632, 0, 0, 0, 1, 1,
0.2170991, 0.5023337, -1.090349, 0, 0, 0, 1, 1,
0.2172459, -0.4651358, 1.756935, 0, 0, 0, 1, 1,
0.2179929, 1.38406, -0.278055, 0, 0, 0, 1, 1,
0.218037, -0.7416732, 4.395598, 0, 0, 0, 1, 1,
0.2187855, 0.04467718, 0.0349251, 0, 0, 0, 1, 1,
0.2203431, 0.5730364, -0.9447759, 1, 1, 1, 1, 1,
0.2211687, -0.8332474, 3.19008, 1, 1, 1, 1, 1,
0.2229664, 0.8810815, 0.803022, 1, 1, 1, 1, 1,
0.2266798, 0.780871, -0.337135, 1, 1, 1, 1, 1,
0.2272046, 0.2061023, 3.141806, 1, 1, 1, 1, 1,
0.2298822, 0.7264637, 1.519944, 1, 1, 1, 1, 1,
0.2358877, -1.379246, 3.170284, 1, 1, 1, 1, 1,
0.2396852, 0.4505868, 0.8979819, 1, 1, 1, 1, 1,
0.2398266, -0.3830525, 3.448611, 1, 1, 1, 1, 1,
0.2412069, 0.9388693, 0.9842626, 1, 1, 1, 1, 1,
0.2492514, -0.9657326, 3.21365, 1, 1, 1, 1, 1,
0.2570845, -1.249182, 1.680546, 1, 1, 1, 1, 1,
0.2681952, 1.318129, 1.166504, 1, 1, 1, 1, 1,
0.2713352, 0.4401202, -0.04230339, 1, 1, 1, 1, 1,
0.2722661, 0.246251, 0.8101724, 1, 1, 1, 1, 1,
0.2746154, 0.2272873, 1.179053, 0, 0, 1, 1, 1,
0.2776114, 0.7956614, 1.391907, 1, 0, 0, 1, 1,
0.2789978, 0.2257065, 1.259416, 1, 0, 0, 1, 1,
0.2810509, 1.306013, 0.5374151, 1, 0, 0, 1, 1,
0.2826351, -0.8951922, 2.319094, 1, 0, 0, 1, 1,
0.2861849, 1.306017, -1.883204, 1, 0, 0, 1, 1,
0.2889387, 0.06205463, 2.039527, 0, 0, 0, 1, 1,
0.2908265, 0.9593124, 1.98957, 0, 0, 0, 1, 1,
0.2934753, 1.630194, 2.353865, 0, 0, 0, 1, 1,
0.2954803, 1.939243, 0.798524, 0, 0, 0, 1, 1,
0.2957673, 0.3002979, 0.4685307, 0, 0, 0, 1, 1,
0.2958746, -1.085172, 1.978809, 0, 0, 0, 1, 1,
0.2972733, 1.798974, 1.271054, 0, 0, 0, 1, 1,
0.2990867, 0.0382021, 2.112814, 1, 1, 1, 1, 1,
0.3040588, -0.8278316, 3.298473, 1, 1, 1, 1, 1,
0.3066033, -0.3127911, 3.747675, 1, 1, 1, 1, 1,
0.3110673, -1.658971, 2.241933, 1, 1, 1, 1, 1,
0.3181949, 0.02800481, 1.23077, 1, 1, 1, 1, 1,
0.3187225, -0.1442535, 2.599445, 1, 1, 1, 1, 1,
0.3195544, 1.435469, -1.325918, 1, 1, 1, 1, 1,
0.3196057, 1.081292, -0.461239, 1, 1, 1, 1, 1,
0.3367519, -0.1386952, 0.5831413, 1, 1, 1, 1, 1,
0.3374814, 1.129493, 2.06403, 1, 1, 1, 1, 1,
0.3452455, 0.07790814, 0.08586901, 1, 1, 1, 1, 1,
0.3483033, -1.301368, 2.729437, 1, 1, 1, 1, 1,
0.350138, -0.2489218, 3.227337, 1, 1, 1, 1, 1,
0.3527928, 0.570771, -0.83903, 1, 1, 1, 1, 1,
0.3551494, -0.6396842, 2.482285, 1, 1, 1, 1, 1,
0.3589275, 1.108959, 0.01643999, 0, 0, 1, 1, 1,
0.3597935, 0.6586065, -1.34727, 1, 0, 0, 1, 1,
0.3615726, 0.4218755, 1.829504, 1, 0, 0, 1, 1,
0.3631606, -0.2931712, 2.416043, 1, 0, 0, 1, 1,
0.3672421, 0.005274503, 0.2177353, 1, 0, 0, 1, 1,
0.3672989, 0.03545627, 1.202424, 1, 0, 0, 1, 1,
0.3695767, 1.034666, -0.1050043, 0, 0, 0, 1, 1,
0.3743822, -0.9854679, 3.280546, 0, 0, 0, 1, 1,
0.3747902, 0.8140354, -0.2604272, 0, 0, 0, 1, 1,
0.3750472, 0.2746131, -0.9614182, 0, 0, 0, 1, 1,
0.3832614, -0.9079024, 6.091167, 0, 0, 0, 1, 1,
0.384973, 0.2845333, 1.270462, 0, 0, 0, 1, 1,
0.3866928, -0.5106394, 1.403112, 0, 0, 0, 1, 1,
0.3888382, 0.8239499, 1.644576, 1, 1, 1, 1, 1,
0.390555, 0.6097919, 1.093373, 1, 1, 1, 1, 1,
0.3909318, 0.7261009, -0.3085831, 1, 1, 1, 1, 1,
0.3915856, -0.197636, 0.3525206, 1, 1, 1, 1, 1,
0.3923869, -1.013988, -0.7387243, 1, 1, 1, 1, 1,
0.402194, -1.203702, 4.080064, 1, 1, 1, 1, 1,
0.4050161, 0.4679957, 2.147133, 1, 1, 1, 1, 1,
0.4132555, 0.1560601, 0.5944203, 1, 1, 1, 1, 1,
0.4136212, 1.295002, -0.9900436, 1, 1, 1, 1, 1,
0.4140357, -0.1199732, 1.572326, 1, 1, 1, 1, 1,
0.4142185, -0.7554787, 2.720805, 1, 1, 1, 1, 1,
0.4182651, -0.7788747, 1.546302, 1, 1, 1, 1, 1,
0.4195499, -0.09254754, 1.02457, 1, 1, 1, 1, 1,
0.4362391, 0.1926579, 0.3409764, 1, 1, 1, 1, 1,
0.4366864, 0.6136009, 2.107373, 1, 1, 1, 1, 1,
0.4380555, 0.3646379, -0.3214695, 0, 0, 1, 1, 1,
0.4458186, -0.8193209, 3.633302, 1, 0, 0, 1, 1,
0.4473725, 1.254446, -0.8417133, 1, 0, 0, 1, 1,
0.4622964, -0.483118, 2.320872, 1, 0, 0, 1, 1,
0.463838, -0.8390578, 2.765033, 1, 0, 0, 1, 1,
0.4640886, -1.055594, 3.251093, 1, 0, 0, 1, 1,
0.464282, -0.5469578, 2.428276, 0, 0, 0, 1, 1,
0.4690624, -1.092501, 1.334979, 0, 0, 0, 1, 1,
0.4695423, -0.03016753, 1.603398, 0, 0, 0, 1, 1,
0.4698879, -0.836105, 1.855628, 0, 0, 0, 1, 1,
0.4731973, -0.05955566, 1.151737, 0, 0, 0, 1, 1,
0.4764997, 0.6307043, 1.285331, 0, 0, 0, 1, 1,
0.4778989, -1.121862, 2.263416, 0, 0, 0, 1, 1,
0.4779039, -1.240803, 3.156664, 1, 1, 1, 1, 1,
0.4796061, 0.7776827, 1.365913, 1, 1, 1, 1, 1,
0.4813696, -0.1122632, 1.221813, 1, 1, 1, 1, 1,
0.4878888, -0.001373513, 1.782617, 1, 1, 1, 1, 1,
0.4897904, -1.590745, 2.716151, 1, 1, 1, 1, 1,
0.4913893, -1.080922, 3.145648, 1, 1, 1, 1, 1,
0.494515, -0.7768582, 3.184964, 1, 1, 1, 1, 1,
0.4956821, 1.062319, 1.028503, 1, 1, 1, 1, 1,
0.4966199, -1.244819, 3.324701, 1, 1, 1, 1, 1,
0.497867, 0.6302498, 0.6258661, 1, 1, 1, 1, 1,
0.4994564, -0.5617207, 3.374068, 1, 1, 1, 1, 1,
0.5010925, -0.266699, 0.9771623, 1, 1, 1, 1, 1,
0.5020692, 0.8622042, 1.589501, 1, 1, 1, 1, 1,
0.5028, 1.248209, 0.4601743, 1, 1, 1, 1, 1,
0.5031963, -0.7844896, 2.057533, 1, 1, 1, 1, 1,
0.5040445, 0.8096315, 0.5617946, 0, 0, 1, 1, 1,
0.505563, 0.5616619, 1.930303, 1, 0, 0, 1, 1,
0.5083572, -1.33935, 3.791147, 1, 0, 0, 1, 1,
0.5144872, 0.634672, 1.173531, 1, 0, 0, 1, 1,
0.5162524, 1.009262, 0.3506985, 1, 0, 0, 1, 1,
0.5172457, 0.1464192, -0.02150224, 1, 0, 0, 1, 1,
0.5191836, 1.147724, -0.07175611, 0, 0, 0, 1, 1,
0.5211456, 0.4933548, 1.362985, 0, 0, 0, 1, 1,
0.5252623, 0.8756931, 0.3205543, 0, 0, 0, 1, 1,
0.5262879, -0.4776499, 3.122646, 0, 0, 0, 1, 1,
0.531262, 0.2361416, 1.560498, 0, 0, 0, 1, 1,
0.5317267, -0.5042087, 3.01749, 0, 0, 0, 1, 1,
0.538632, -0.4684096, 3.563017, 0, 0, 0, 1, 1,
0.5400575, -0.9102047, 2.847544, 1, 1, 1, 1, 1,
0.5402648, 0.4258533, 1.015546, 1, 1, 1, 1, 1,
0.5432662, 1.122173, -0.2601531, 1, 1, 1, 1, 1,
0.5450539, -0.5070806, 2.996604, 1, 1, 1, 1, 1,
0.5460636, 0.1518813, 2.179463, 1, 1, 1, 1, 1,
0.5484506, -1.644619, 3.489791, 1, 1, 1, 1, 1,
0.5535926, 0.6349798, 1.140248, 1, 1, 1, 1, 1,
0.554438, -0.001570695, 0.3450028, 1, 1, 1, 1, 1,
0.556031, 0.04928932, 2.623717, 1, 1, 1, 1, 1,
0.5564827, 0.7268175, 0.2704993, 1, 1, 1, 1, 1,
0.5570267, 0.08399101, 0.8052956, 1, 1, 1, 1, 1,
0.5607581, 1.201902, 0.8549445, 1, 1, 1, 1, 1,
0.5618471, -0.0906674, 0.5049908, 1, 1, 1, 1, 1,
0.5642473, -0.9157745, 3.293434, 1, 1, 1, 1, 1,
0.5643119, -0.5141711, 0.7836406, 1, 1, 1, 1, 1,
0.5661215, 0.9879194, 0.4864806, 0, 0, 1, 1, 1,
0.5701261, 0.89369, 0.7071815, 1, 0, 0, 1, 1,
0.5708035, 1.322515, 0.5083916, 1, 0, 0, 1, 1,
0.5734957, 0.3982973, 3.429775, 1, 0, 0, 1, 1,
0.574149, -0.4835791, 3.945403, 1, 0, 0, 1, 1,
0.5759722, 1.509801, 0.1086826, 1, 0, 0, 1, 1,
0.5804577, 1.7667, 0.2968962, 0, 0, 0, 1, 1,
0.5815772, 0.2762532, 1.152071, 0, 0, 0, 1, 1,
0.5818014, 0.9745866, 2.357591, 0, 0, 0, 1, 1,
0.5836796, -0.3780679, 3.433665, 0, 0, 0, 1, 1,
0.5839264, -0.2746302, 1.824294, 0, 0, 0, 1, 1,
0.5857146, 1.466376, 0.6756707, 0, 0, 0, 1, 1,
0.5873092, -0.1804724, 1.619861, 0, 0, 0, 1, 1,
0.5905136, -0.7772169, 3.335649, 1, 1, 1, 1, 1,
0.5905949, 0.8544058, 1.25874, 1, 1, 1, 1, 1,
0.5912953, 0.8240908, 2.769218, 1, 1, 1, 1, 1,
0.5930803, -0.6956196, 2.944614, 1, 1, 1, 1, 1,
0.596907, 0.5700997, 0.9949037, 1, 1, 1, 1, 1,
0.5975456, -0.6070446, 1.71176, 1, 1, 1, 1, 1,
0.6000268, -1.069731, 2.221816, 1, 1, 1, 1, 1,
0.6046861, 1.132838, -1.207288, 1, 1, 1, 1, 1,
0.6048644, 0.7204832, 1.023381, 1, 1, 1, 1, 1,
0.6078216, -0.194302, 2.530231, 1, 1, 1, 1, 1,
0.6091676, 0.3223751, 1.541495, 1, 1, 1, 1, 1,
0.613522, 0.9834505, 0.9832144, 1, 1, 1, 1, 1,
0.6148649, 1.619023, -0.2360094, 1, 1, 1, 1, 1,
0.6178616, 0.9819318, 1.33919, 1, 1, 1, 1, 1,
0.6195017, -0.6067277, 1.459417, 1, 1, 1, 1, 1,
0.6267651, 0.3398243, 1.639852, 0, 0, 1, 1, 1,
0.6322854, 0.6748785, 0.5508995, 1, 0, 0, 1, 1,
0.6359897, -0.6548422, 3.867236, 1, 0, 0, 1, 1,
0.6434649, 1.053194, 0.4469637, 1, 0, 0, 1, 1,
0.6457313, -0.6079568, 0.937176, 1, 0, 0, 1, 1,
0.6458596, 0.928542, 0.353167, 1, 0, 0, 1, 1,
0.6466316, -0.4361545, 2.474734, 0, 0, 0, 1, 1,
0.6501399, -1.112048, 3.245653, 0, 0, 0, 1, 1,
0.650413, 1.575063, -0.9983077, 0, 0, 0, 1, 1,
0.6549274, -0.2798434, 0.9281922, 0, 0, 0, 1, 1,
0.659484, 1.541346, 0.3615282, 0, 0, 0, 1, 1,
0.6597667, -1.121825, 2.432528, 0, 0, 0, 1, 1,
0.6598687, 0.0305738, 2.839878, 0, 0, 0, 1, 1,
0.6599349, 1.019917, 0.7872783, 1, 1, 1, 1, 1,
0.6605655, -0.6255183, 2.059786, 1, 1, 1, 1, 1,
0.6620321, -1.233336, 2.485796, 1, 1, 1, 1, 1,
0.6629578, 0.2313399, 1.378769, 1, 1, 1, 1, 1,
0.6648645, 0.1265921, 0.2746336, 1, 1, 1, 1, 1,
0.6710525, 1.382563, 0.2111576, 1, 1, 1, 1, 1,
0.6727175, -0.5687679, 1.829709, 1, 1, 1, 1, 1,
0.6770705, 0.5998924, -0.07032645, 1, 1, 1, 1, 1,
0.6794828, -0.03365168, 3.240134, 1, 1, 1, 1, 1,
0.6809883, -0.2498604, 0.8052636, 1, 1, 1, 1, 1,
0.6862783, 1.381555, -0.5107351, 1, 1, 1, 1, 1,
0.6874217, -1.112026, 3.488858, 1, 1, 1, 1, 1,
0.6966993, -0.3314791, 2.095812, 1, 1, 1, 1, 1,
0.7067608, 0.9802842, 0.01005488, 1, 1, 1, 1, 1,
0.7077062, -0.1719061, 0.1076468, 1, 1, 1, 1, 1,
0.7124701, -0.1230768, 2.342537, 0, 0, 1, 1, 1,
0.7170001, -0.1301968, 2.009678, 1, 0, 0, 1, 1,
0.725261, 1.271354, -0.487096, 1, 0, 0, 1, 1,
0.7307491, -1.281038, 2.472678, 1, 0, 0, 1, 1,
0.7328676, -1.848382, 2.35122, 1, 0, 0, 1, 1,
0.7335075, -0.6675662, 2.933249, 1, 0, 0, 1, 1,
0.7390313, -0.7037355, 1.685879, 0, 0, 0, 1, 1,
0.7397136, -1.191627, 2.065929, 0, 0, 0, 1, 1,
0.7406205, 0.1109122, 1.91738, 0, 0, 0, 1, 1,
0.7413449, 0.05001568, 2.304644, 0, 0, 0, 1, 1,
0.7439897, -0.7707644, 4.331833, 0, 0, 0, 1, 1,
0.7445116, 1.33771, -0.02246712, 0, 0, 0, 1, 1,
0.7455881, 0.2625961, 1.661149, 0, 0, 0, 1, 1,
0.7458054, -0.6373868, 2.29502, 1, 1, 1, 1, 1,
0.74689, -0.2605097, -0.2064871, 1, 1, 1, 1, 1,
0.7474446, 0.6452975, 1.906711, 1, 1, 1, 1, 1,
0.7482165, -0.6412861, 3.736935, 1, 1, 1, 1, 1,
0.7527899, -2.977959, 2.535748, 1, 1, 1, 1, 1,
0.7529675, -0.1958955, 1.378237, 1, 1, 1, 1, 1,
0.7535578, -0.8414848, 1.978433, 1, 1, 1, 1, 1,
0.7561158, 0.6949313, 3.267729, 1, 1, 1, 1, 1,
0.7690898, -0.6045954, 2.741791, 1, 1, 1, 1, 1,
0.7739393, -1.571302, -0.320796, 1, 1, 1, 1, 1,
0.7830289, 2.180852, 0.5550812, 1, 1, 1, 1, 1,
0.7880752, 0.04964846, 1.250149, 1, 1, 1, 1, 1,
0.7952762, 0.4081095, 1.282769, 1, 1, 1, 1, 1,
0.7958028, 0.8339844, 3.032251, 1, 1, 1, 1, 1,
0.818065, 0.6556384, 1.486955, 1, 1, 1, 1, 1,
0.8200464, 0.4657437, 2.987506, 0, 0, 1, 1, 1,
0.8218559, 1.182024, 0.9261638, 1, 0, 0, 1, 1,
0.822262, 0.3051238, 1.409635, 1, 0, 0, 1, 1,
0.8269281, -1.945593, 4.634021, 1, 0, 0, 1, 1,
0.82921, -1.335091, 1.937782, 1, 0, 0, 1, 1,
0.8333641, -1.081276, 2.023072, 1, 0, 0, 1, 1,
0.8341327, -1.687201, 2.80471, 0, 0, 0, 1, 1,
0.8356296, -0.6973202, 1.457723, 0, 0, 0, 1, 1,
0.8374123, 0.5510284, 0.7912434, 0, 0, 0, 1, 1,
0.8420154, 0.3864465, 2.265117, 0, 0, 0, 1, 1,
0.8472415, 0.584104, 1.508661, 0, 0, 0, 1, 1,
0.850682, 0.1697244, 1.020984, 0, 0, 0, 1, 1,
0.8528796, 0.05095376, 2.071231, 0, 0, 0, 1, 1,
0.8529593, -1.23271, 4.217267, 1, 1, 1, 1, 1,
0.8557738, 1.156554, 0.05366589, 1, 1, 1, 1, 1,
0.8603301, -1.224075, 2.44369, 1, 1, 1, 1, 1,
0.8631671, 0.738905, 1.735687, 1, 1, 1, 1, 1,
0.8645886, 0.5957646, 0.7952939, 1, 1, 1, 1, 1,
0.870183, -2.330345, 1.710451, 1, 1, 1, 1, 1,
0.8774633, 0.5548666, 0.4262237, 1, 1, 1, 1, 1,
0.8785477, 0.7445445, 0.1253676, 1, 1, 1, 1, 1,
0.8788624, -1.093403, 0.8380011, 1, 1, 1, 1, 1,
0.8820795, -0.409518, 1.666429, 1, 1, 1, 1, 1,
0.8846163, 1.175096, -0.09526578, 1, 1, 1, 1, 1,
0.8858888, -1.51985, 1.332961, 1, 1, 1, 1, 1,
0.8889699, -1.682936, 2.617966, 1, 1, 1, 1, 1,
0.8922209, 0.3182652, 1.211118, 1, 1, 1, 1, 1,
0.894099, -0.3326194, 2.636838, 1, 1, 1, 1, 1,
0.9093993, -0.1164258, 2.234043, 0, 0, 1, 1, 1,
0.9121191, -0.198521, 1.75716, 1, 0, 0, 1, 1,
0.9153124, -1.422852, 1.626564, 1, 0, 0, 1, 1,
0.9165913, 1.396058, 0.2180954, 1, 0, 0, 1, 1,
0.9194267, 0.7163757, 1.697576, 1, 0, 0, 1, 1,
0.9246197, 0.8540453, 1.541367, 1, 0, 0, 1, 1,
0.9267105, 0.2549311, 0.536607, 0, 0, 0, 1, 1,
0.9318571, 0.1846654, 2.691741, 0, 0, 0, 1, 1,
0.9382897, 0.9418237, 2.04765, 0, 0, 0, 1, 1,
0.946888, 0.5343744, 1.874258, 0, 0, 0, 1, 1,
0.9477279, 1.520628, 0.2280604, 0, 0, 0, 1, 1,
0.9551686, -1.261401, 3.138185, 0, 0, 0, 1, 1,
0.9576327, -0.8101649, 1.115796, 0, 0, 0, 1, 1,
0.9630881, 0.6457929, 0.708322, 1, 1, 1, 1, 1,
0.9653934, -0.4258939, 2.861276, 1, 1, 1, 1, 1,
0.97088, -0.357247, 0.3531995, 1, 1, 1, 1, 1,
0.9791231, -0.7875383, 0.7658487, 1, 1, 1, 1, 1,
0.9878485, 0.4469657, 1.443666, 1, 1, 1, 1, 1,
0.9905701, 1.933392, 2.181022, 1, 1, 1, 1, 1,
0.9967245, -0.851795, 3.873929, 1, 1, 1, 1, 1,
1.002811, -0.7419544, 0.7413176, 1, 1, 1, 1, 1,
1.005514, 0.7660999, -0.5861205, 1, 1, 1, 1, 1,
1.01632, 1.559427, -1.313719, 1, 1, 1, 1, 1,
1.016548, -0.3870782, 2.140361, 1, 1, 1, 1, 1,
1.016825, -0.3821208, 0.7993332, 1, 1, 1, 1, 1,
1.019005, -0.1330142, -0.1112285, 1, 1, 1, 1, 1,
1.023285, -0.4828155, 2.260901, 1, 1, 1, 1, 1,
1.023758, -0.7364041, 1.875076, 1, 1, 1, 1, 1,
1.025412, 0.6597931, -1.205772, 0, 0, 1, 1, 1,
1.027047, -0.3626198, 0.3274993, 1, 0, 0, 1, 1,
1.028056, 0.8974221, 0.2539097, 1, 0, 0, 1, 1,
1.028081, -0.220503, 1.221995, 1, 0, 0, 1, 1,
1.036856, -0.4625723, 2.547673, 1, 0, 0, 1, 1,
1.039893, 1.421388, 1.534686, 1, 0, 0, 1, 1,
1.041425, 0.1026095, 2.030833, 0, 0, 0, 1, 1,
1.041539, -0.7746131, 2.941246, 0, 0, 0, 1, 1,
1.048547, -0.9342244, 1.898047, 0, 0, 0, 1, 1,
1.059138, -1.31625, 3.954905, 0, 0, 0, 1, 1,
1.060195, 0.2605694, 1.288516, 0, 0, 0, 1, 1,
1.061831, 0.2472403, 1.05489, 0, 0, 0, 1, 1,
1.071274, -1.933183, 3.083083, 0, 0, 0, 1, 1,
1.080929, 1.629597, 1.40908, 1, 1, 1, 1, 1,
1.082563, -1.674739, 2.087011, 1, 1, 1, 1, 1,
1.086745, 0.03518121, 1.820704, 1, 1, 1, 1, 1,
1.096405, 1.313291, -0.1841954, 1, 1, 1, 1, 1,
1.096411, -1.392307, 2.854252, 1, 1, 1, 1, 1,
1.098768, -0.2686991, 2.117748, 1, 1, 1, 1, 1,
1.101751, -0.4158133, 1.631445, 1, 1, 1, 1, 1,
1.102009, 0.8085276, 1.847255, 1, 1, 1, 1, 1,
1.108126, 1.027948, 0.07781629, 1, 1, 1, 1, 1,
1.108271, 0.7187448, 0.997839, 1, 1, 1, 1, 1,
1.119199, 0.6336607, 0.8956687, 1, 1, 1, 1, 1,
1.131611, 0.4111848, -0.4111889, 1, 1, 1, 1, 1,
1.135814, 0.1853877, 1.167929, 1, 1, 1, 1, 1,
1.140114, -0.1400184, 2.737286, 1, 1, 1, 1, 1,
1.140447, -0.9442183, 2.362495, 1, 1, 1, 1, 1,
1.142017, -1.77013, 1.766987, 0, 0, 1, 1, 1,
1.151053, 0.4528305, 2.467582, 1, 0, 0, 1, 1,
1.155385, -1.41381, 5.505571, 1, 0, 0, 1, 1,
1.157029, -0.03820932, 2.404892, 1, 0, 0, 1, 1,
1.164583, 0.2485078, 0.4736651, 1, 0, 0, 1, 1,
1.170872, -0.3271795, 2.223676, 1, 0, 0, 1, 1,
1.172748, 0.9305056, 0.4071504, 0, 0, 0, 1, 1,
1.172774, 1.022424, 0.6298819, 0, 0, 0, 1, 1,
1.176525, -2.42963, 3.554411, 0, 0, 0, 1, 1,
1.180334, -0.6567982, 2.370327, 0, 0, 0, 1, 1,
1.186275, 1.933292, 1.906305, 0, 0, 0, 1, 1,
1.190576, 1.614835, 0.2200672, 0, 0, 0, 1, 1,
1.205648, -0.04225173, 1.359252, 0, 0, 0, 1, 1,
1.207237, 0.07758402, 2.323342, 1, 1, 1, 1, 1,
1.212101, -0.03012219, 1.82324, 1, 1, 1, 1, 1,
1.212316, 0.3002835, 2.704068, 1, 1, 1, 1, 1,
1.213878, 0.04048559, 1.610945, 1, 1, 1, 1, 1,
1.224346, 0.4777489, 0.5693768, 1, 1, 1, 1, 1,
1.257402, 1.166682, 0.5909311, 1, 1, 1, 1, 1,
1.26224, 0.8868504, 0.9565635, 1, 1, 1, 1, 1,
1.264258, -0.9161226, 2.009291, 1, 1, 1, 1, 1,
1.288887, -0.4405961, 1.528733, 1, 1, 1, 1, 1,
1.294956, -0.8083829, -0.3424175, 1, 1, 1, 1, 1,
1.300138, -0.1913668, 1.343311, 1, 1, 1, 1, 1,
1.306449, -0.5563221, 2.601035, 1, 1, 1, 1, 1,
1.320362, -0.124947, 1.815253, 1, 1, 1, 1, 1,
1.327406, 2.277749, 2.377816, 1, 1, 1, 1, 1,
1.32875, 1.607046, -2.186154, 1, 1, 1, 1, 1,
1.335502, 1.456744, 0.4442295, 0, 0, 1, 1, 1,
1.336755, -1.932653, 4.075963, 1, 0, 0, 1, 1,
1.342441, 0.919847, 0.6958053, 1, 0, 0, 1, 1,
1.363817, 0.06597316, 1.703867, 1, 0, 0, 1, 1,
1.366135, -1.723419, 4.17998, 1, 0, 0, 1, 1,
1.367378, -2.698256, 1.84881, 1, 0, 0, 1, 1,
1.37633, 0.3509233, 2.416689, 0, 0, 0, 1, 1,
1.398744, 0.2164828, 2.240273, 0, 0, 0, 1, 1,
1.416396, 1.451804, 0.7011688, 0, 0, 0, 1, 1,
1.416924, -0.3407181, 1.866516, 0, 0, 0, 1, 1,
1.417464, 0.5818232, 2.718408, 0, 0, 0, 1, 1,
1.421833, -0.9833894, 2.420356, 0, 0, 0, 1, 1,
1.423511, 0.6500283, 2.296017, 0, 0, 0, 1, 1,
1.436597, 1.843437, -0.9102205, 1, 1, 1, 1, 1,
1.43882, -0.3480361, 1.800629, 1, 1, 1, 1, 1,
1.438887, 0.871623, 0.6283714, 1, 1, 1, 1, 1,
1.44189, 1.309047, 1.009134, 1, 1, 1, 1, 1,
1.463225, -1.283577, 1.210767, 1, 1, 1, 1, 1,
1.472727, -0.5027375, 2.682033, 1, 1, 1, 1, 1,
1.476666, 0.6175809, 2.73746, 1, 1, 1, 1, 1,
1.53352, 0.5488873, 2.163339, 1, 1, 1, 1, 1,
1.535549, -0.06135909, 2.5284, 1, 1, 1, 1, 1,
1.546251, -0.6521998, 3.932067, 1, 1, 1, 1, 1,
1.552844, 2.630761, -0.1179838, 1, 1, 1, 1, 1,
1.553704, -1.241524, 3.702503, 1, 1, 1, 1, 1,
1.560595, -1.284884, 2.295845, 1, 1, 1, 1, 1,
1.561185, -1.786944, 1.447467, 1, 1, 1, 1, 1,
1.575993, 0.03244057, 2.598993, 1, 1, 1, 1, 1,
1.577313, -2.05453, 1.196063, 0, 0, 1, 1, 1,
1.58289, -2.006696, 2.539099, 1, 0, 0, 1, 1,
1.583544, 0.4017856, 0.08117604, 1, 0, 0, 1, 1,
1.584986, 0.7830803, 0.1433603, 1, 0, 0, 1, 1,
1.589282, -0.9519051, 1.78584, 1, 0, 0, 1, 1,
1.590183, 0.2063446, 3.501562, 1, 0, 0, 1, 1,
1.615942, -1.172963, 2.254818, 0, 0, 0, 1, 1,
1.64695, 1.533262, 0.7837343, 0, 0, 0, 1, 1,
1.673381, 0.4977601, 1.034624, 0, 0, 0, 1, 1,
1.705798, -0.4207438, 3.118835, 0, 0, 0, 1, 1,
1.708337, -2.001089, 1.946266, 0, 0, 0, 1, 1,
1.727876, -0.4910536, 3.067669, 0, 0, 0, 1, 1,
1.733446, 1.975839, 3.334608, 0, 0, 0, 1, 1,
1.736029, -2.214298, 1.90781, 1, 1, 1, 1, 1,
1.738773, -0.04149791, 3.131696, 1, 1, 1, 1, 1,
1.747876, -0.1268528, 0.1251106, 1, 1, 1, 1, 1,
1.787437, -0.6943971, 2.147309, 1, 1, 1, 1, 1,
1.814615, -0.1147007, 1.91351, 1, 1, 1, 1, 1,
1.856068, 0.5360836, 1.359536, 1, 1, 1, 1, 1,
1.858802, -0.9270678, 1.611887, 1, 1, 1, 1, 1,
1.876038, -1.478679, 2.099313, 1, 1, 1, 1, 1,
1.880496, -0.1830195, 1.57122, 1, 1, 1, 1, 1,
1.882199, -0.5907261, 1.377919, 1, 1, 1, 1, 1,
1.889914, -0.4893346, -0.5083495, 1, 1, 1, 1, 1,
1.89554, 0.8953956, 2.966502, 1, 1, 1, 1, 1,
1.901288, -0.01151071, 0.7624065, 1, 1, 1, 1, 1,
1.906934, 2.099412, 1.295417, 1, 1, 1, 1, 1,
1.953227, 0.1451762, -0.2520772, 1, 1, 1, 1, 1,
1.955013, -0.6145894, 1.059232, 0, 0, 1, 1, 1,
1.981639, -0.3295532, 1.430279, 1, 0, 0, 1, 1,
2.001509, -0.005624762, 2.463809, 1, 0, 0, 1, 1,
2.015826, -0.4001665, 2.03983, 1, 0, 0, 1, 1,
2.025015, 0.8263015, 0.4670599, 1, 0, 0, 1, 1,
2.035605, 0.170999, -0.3425557, 1, 0, 0, 1, 1,
2.082701, -0.780995, 3.104103, 0, 0, 0, 1, 1,
2.107637, 0.2332351, 1.54714, 0, 0, 0, 1, 1,
2.108945, -0.8797201, 1.703915, 0, 0, 0, 1, 1,
2.110681, 1.169256, 0.7658833, 0, 0, 0, 1, 1,
2.357746, -0.05939436, -0.4229257, 0, 0, 0, 1, 1,
2.397252, -0.5322623, 0.7826146, 0, 0, 0, 1, 1,
2.397311, 1.402685, 0.0923406, 0, 0, 0, 1, 1,
2.498641, 0.6764558, 0.9038959, 1, 1, 1, 1, 1,
2.518085, 1.862827, 1.017237, 1, 1, 1, 1, 1,
2.617853, 0.001999362, 0.592992, 1, 1, 1, 1, 1,
2.624332, -0.7464266, 3.496237, 1, 1, 1, 1, 1,
2.734589, 1.198508, 0.8419954, 1, 1, 1, 1, 1,
2.858014, 0.1931291, 1.446339, 1, 1, 1, 1, 1,
2.908222, 0.5516387, 1.446451, 1, 1, 1, 1, 1
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
var radius = 9.850107;
var distance = 34.59808;
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
mvMatrix.translate( 0.2623736, 0.1441088, -0.2722583 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.59808);
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
