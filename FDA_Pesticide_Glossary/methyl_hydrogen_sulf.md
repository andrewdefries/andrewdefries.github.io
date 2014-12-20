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
-2.979923, -0.3595805, -0.5677546, 1, 0, 0, 1,
-2.737314, -1.682766, -3.035881, 1, 0.007843138, 0, 1,
-2.57815, -0.2092889, -1.512923, 1, 0.01176471, 0, 1,
-2.544887, -0.2421455, -2.195816, 1, 0.01960784, 0, 1,
-2.479597, 0.1012724, -4.208017, 1, 0.02352941, 0, 1,
-2.472618, 0.2483269, -2.481303, 1, 0.03137255, 0, 1,
-2.402446, 0.6113643, -0.6405351, 1, 0.03529412, 0, 1,
-2.389703, -1.470099, -2.359895, 1, 0.04313726, 0, 1,
-2.313014, -1.251325, -1.297313, 1, 0.04705882, 0, 1,
-2.301326, -1.650616, -4.410174, 1, 0.05490196, 0, 1,
-2.268678, 0.739475, -2.36548, 1, 0.05882353, 0, 1,
-2.264342, -0.2845133, -0.8466917, 1, 0.06666667, 0, 1,
-2.202203, -0.4435652, -2.168565, 1, 0.07058824, 0, 1,
-2.155142, -0.5035428, -2.15066, 1, 0.07843138, 0, 1,
-2.108231, -0.5355538, -1.200247, 1, 0.08235294, 0, 1,
-2.104736, 0.175833, -2.267919, 1, 0.09019608, 0, 1,
-2.09392, 0.03581247, -1.953041, 1, 0.09411765, 0, 1,
-2.088718, -0.9574974, -1.570799, 1, 0.1019608, 0, 1,
-2.06346, 0.204688, -1.143665, 1, 0.1098039, 0, 1,
-2.056497, -0.08847962, -1.964354, 1, 0.1137255, 0, 1,
-2.049746, -0.02833522, -2.559582, 1, 0.1215686, 0, 1,
-2.019965, -0.5971276, -2.89142, 1, 0.1254902, 0, 1,
-1.992815, -0.4014895, -1.157126, 1, 0.1333333, 0, 1,
-1.991335, -1.220994, -1.604902, 1, 0.1372549, 0, 1,
-1.978797, -1.181299, -2.801771, 1, 0.145098, 0, 1,
-1.968852, -0.7064404, -3.289793, 1, 0.1490196, 0, 1,
-1.957871, -0.4519196, -0.3570946, 1, 0.1568628, 0, 1,
-1.945137, 0.2791709, -0.501653, 1, 0.1607843, 0, 1,
-1.937146, -1.787881, -3.828057, 1, 0.1686275, 0, 1,
-1.930633, -0.562869, -1.140934, 1, 0.172549, 0, 1,
-1.927537, -3.404558, -2.482636, 1, 0.1803922, 0, 1,
-1.918553, -1.40388, -2.284905, 1, 0.1843137, 0, 1,
-1.911018, -0.5509331, 0.6194893, 1, 0.1921569, 0, 1,
-1.895911, -1.463353, -2.561419, 1, 0.1960784, 0, 1,
-1.877113, -1.32307, -3.022423, 1, 0.2039216, 0, 1,
-1.867962, -0.669761, -2.243692, 1, 0.2117647, 0, 1,
-1.863033, 0.2648534, -1.587344, 1, 0.2156863, 0, 1,
-1.837294, -1.336107, -3.287778, 1, 0.2235294, 0, 1,
-1.837064, -0.2596983, -0.4362301, 1, 0.227451, 0, 1,
-1.815407, 0.241143, -0.6181208, 1, 0.2352941, 0, 1,
-1.795544, 0.6517349, -0.8385932, 1, 0.2392157, 0, 1,
-1.773236, -1.822946, -3.576601, 1, 0.2470588, 0, 1,
-1.76299, 1.719672, 0.3553911, 1, 0.2509804, 0, 1,
-1.716168, -0.07362612, -0.8130417, 1, 0.2588235, 0, 1,
-1.708028, -0.1061531, -1.770136, 1, 0.2627451, 0, 1,
-1.672552, -1.709737, -4.056203, 1, 0.2705882, 0, 1,
-1.667046, -1.031845, -3.632749, 1, 0.2745098, 0, 1,
-1.666332, 1.781044, -0.4815345, 1, 0.282353, 0, 1,
-1.649359, -1.065332, -4.201275, 1, 0.2862745, 0, 1,
-1.644585, 0.6963928, 0.3011493, 1, 0.2941177, 0, 1,
-1.625892, -0.1211266, -3.437135, 1, 0.3019608, 0, 1,
-1.620921, 1.951262, -1.945584, 1, 0.3058824, 0, 1,
-1.614319, 0.5894532, -0.3144392, 1, 0.3137255, 0, 1,
-1.602953, 1.087961, -1.963803, 1, 0.3176471, 0, 1,
-1.579758, 0.4014635, -3.07832, 1, 0.3254902, 0, 1,
-1.534385, -0.4159171, -2.086953, 1, 0.3294118, 0, 1,
-1.507589, -0.6845529, -0.6988167, 1, 0.3372549, 0, 1,
-1.49532, -2.374409, -3.824338, 1, 0.3411765, 0, 1,
-1.495007, 1.556204, -1.345415, 1, 0.3490196, 0, 1,
-1.487431, 0.0660713, -1.342309, 1, 0.3529412, 0, 1,
-1.482101, 0.4351088, -0.6890321, 1, 0.3607843, 0, 1,
-1.481119, -0.2521636, -0.9972845, 1, 0.3647059, 0, 1,
-1.473926, -0.2456512, -1.133619, 1, 0.372549, 0, 1,
-1.467292, -0.7866935, -1.284735, 1, 0.3764706, 0, 1,
-1.456602, -0.1151881, -2.25248, 1, 0.3843137, 0, 1,
-1.446312, 0.6467552, 0.4279279, 1, 0.3882353, 0, 1,
-1.445718, -0.04959046, -1.599916, 1, 0.3960784, 0, 1,
-1.440262, -0.384478, -1.565882, 1, 0.4039216, 0, 1,
-1.439961, -0.2300917, -3.195948, 1, 0.4078431, 0, 1,
-1.439671, 0.6191448, -1.517933, 1, 0.4156863, 0, 1,
-1.437126, -2.095167, -3.129132, 1, 0.4196078, 0, 1,
-1.432995, -0.8261666, -1.211465, 1, 0.427451, 0, 1,
-1.432803, 0.9761534, -0.9468302, 1, 0.4313726, 0, 1,
-1.432535, -0.1189432, -0.4643447, 1, 0.4392157, 0, 1,
-1.41489, -1.716319, -0.834226, 1, 0.4431373, 0, 1,
-1.407191, 0.2710626, -3.569301, 1, 0.4509804, 0, 1,
-1.400325, -0.7440888, -1.706801, 1, 0.454902, 0, 1,
-1.394396, 0.1862301, -1.147125, 1, 0.4627451, 0, 1,
-1.393143, 1.290613, 0.08002213, 1, 0.4666667, 0, 1,
-1.378727, -2.345049, -2.369864, 1, 0.4745098, 0, 1,
-1.374174, -0.1342531, -1.570336, 1, 0.4784314, 0, 1,
-1.360932, -1.031478, -2.548095, 1, 0.4862745, 0, 1,
-1.350202, -0.6372979, -2.844469, 1, 0.4901961, 0, 1,
-1.346624, 0.3884336, 0.05470743, 1, 0.4980392, 0, 1,
-1.342567, 2.261844, 0.7497976, 1, 0.5058824, 0, 1,
-1.340657, 1.634961, -0.9864304, 1, 0.509804, 0, 1,
-1.319668, -1.907705, -1.105167, 1, 0.5176471, 0, 1,
-1.31851, -0.8856621, -2.643682, 1, 0.5215687, 0, 1,
-1.31425, 1.328537, 0.4699519, 1, 0.5294118, 0, 1,
-1.313511, 0.5288065, -0.9452385, 1, 0.5333334, 0, 1,
-1.30719, -0.273621, -1.970706, 1, 0.5411765, 0, 1,
-1.300725, 0.8651274, -2.277885, 1, 0.5450981, 0, 1,
-1.293385, 0.9514591, -0.4673077, 1, 0.5529412, 0, 1,
-1.287819, -0.9521465, -3.408381, 1, 0.5568628, 0, 1,
-1.283192, -0.2969049, -2.294343, 1, 0.5647059, 0, 1,
-1.282409, 0.6846516, -0.9743425, 1, 0.5686275, 0, 1,
-1.267602, -0.302864, -1.721426, 1, 0.5764706, 0, 1,
-1.266302, 0.02419749, -1.110798, 1, 0.5803922, 0, 1,
-1.261863, 0.01830659, 0.2735226, 1, 0.5882353, 0, 1,
-1.237033, 0.4400475, -3.367894, 1, 0.5921569, 0, 1,
-1.236151, -0.8707051, -1.925774, 1, 0.6, 0, 1,
-1.234578, 0.6049346, -3.149351, 1, 0.6078432, 0, 1,
-1.231204, -0.3065075, -3.974317, 1, 0.6117647, 0, 1,
-1.228558, -0.6738781, -3.447045, 1, 0.6196079, 0, 1,
-1.228495, 0.4923219, -0.5927322, 1, 0.6235294, 0, 1,
-1.221136, -2.300773, -3.424511, 1, 0.6313726, 0, 1,
-1.220289, 0.4030083, -0.8912359, 1, 0.6352941, 0, 1,
-1.217541, 1.494017, -0.755757, 1, 0.6431373, 0, 1,
-1.214016, 1.367119, -1.069137, 1, 0.6470588, 0, 1,
-1.211774, -0.007471486, -1.045504, 1, 0.654902, 0, 1,
-1.2032, -0.6204833, -1.206743, 1, 0.6588235, 0, 1,
-1.198143, 2.311623, -0.6945059, 1, 0.6666667, 0, 1,
-1.161375, 1.550783, -1.375514, 1, 0.6705883, 0, 1,
-1.160827, -0.4067163, -0.02670153, 1, 0.6784314, 0, 1,
-1.158659, -0.5111923, -1.42205, 1, 0.682353, 0, 1,
-1.135488, 0.3974078, -2.135218, 1, 0.6901961, 0, 1,
-1.133623, 0.8695405, -0.6633971, 1, 0.6941177, 0, 1,
-1.130557, -0.8432603, -2.233964, 1, 0.7019608, 0, 1,
-1.126924, 0.04849227, -1.598892, 1, 0.7098039, 0, 1,
-1.110481, -0.5208743, 0.04263104, 1, 0.7137255, 0, 1,
-1.106423, 0.615513, -1.967472, 1, 0.7215686, 0, 1,
-1.104188, 0.1884648, -2.070369, 1, 0.7254902, 0, 1,
-1.098539, 0.06135251, -2.26301, 1, 0.7333333, 0, 1,
-1.09403, 1.446252, 1.314334, 1, 0.7372549, 0, 1,
-1.089862, -0.3926313, -0.7169112, 1, 0.7450981, 0, 1,
-1.083057, 0.0533609, -2.470593, 1, 0.7490196, 0, 1,
-1.078505, -0.2191569, -1.909644, 1, 0.7568628, 0, 1,
-1.07579, 0.695824, -1.722049, 1, 0.7607843, 0, 1,
-1.066966, 0.1465814, -1.550856, 1, 0.7686275, 0, 1,
-1.06563, 0.1341312, -0.1726382, 1, 0.772549, 0, 1,
-1.058809, 1.961369, 0.07690775, 1, 0.7803922, 0, 1,
-1.057063, -0.5789322, -2.722862, 1, 0.7843137, 0, 1,
-1.051817, -0.1485638, -1.537152, 1, 0.7921569, 0, 1,
-1.051332, -0.6328104, -2.782746, 1, 0.7960784, 0, 1,
-1.050383, 0.9649912, -1.941536, 1, 0.8039216, 0, 1,
-1.049869, 1.237784, -0.655506, 1, 0.8117647, 0, 1,
-1.041392, -0.03028684, -0.6638699, 1, 0.8156863, 0, 1,
-1.040727, 0.7031808, -2.814781, 1, 0.8235294, 0, 1,
-1.026378, 1.895424, -0.4932103, 1, 0.827451, 0, 1,
-1.026034, 0.5986451, -0.4580843, 1, 0.8352941, 0, 1,
-1.025937, 0.8321486, -1.950503, 1, 0.8392157, 0, 1,
-1.025276, 0.7006144, -2.101799, 1, 0.8470588, 0, 1,
-1.019949, -1.44851, -2.566466, 1, 0.8509804, 0, 1,
-1.016721, -0.3833641, -1.584812, 1, 0.8588235, 0, 1,
-1.016665, 1.56805, -1.356493, 1, 0.8627451, 0, 1,
-1.013806, 1.427036, -2.711872, 1, 0.8705882, 0, 1,
-1.013209, 0.4116167, -1.273521, 1, 0.8745098, 0, 1,
-1.011739, -0.3052543, -2.344149, 1, 0.8823529, 0, 1,
-1.004718, -1.281255, -3.990217, 1, 0.8862745, 0, 1,
-0.9997662, -1.076795, -2.454453, 1, 0.8941177, 0, 1,
-0.9962527, -1.357727, -2.759843, 1, 0.8980392, 0, 1,
-0.9947979, -1.412189, -3.802117, 1, 0.9058824, 0, 1,
-0.9935193, -0.6075149, -2.281425, 1, 0.9137255, 0, 1,
-0.9923481, 1.524022, -1.287066, 1, 0.9176471, 0, 1,
-0.9919171, -1.995284, -1.590095, 1, 0.9254902, 0, 1,
-0.9882798, -0.7424746, -1.772477, 1, 0.9294118, 0, 1,
-0.9860826, -0.1826388, -0.7044318, 1, 0.9372549, 0, 1,
-0.9851142, -2.141226, -3.240516, 1, 0.9411765, 0, 1,
-0.9833786, 0.6023897, -0.9758192, 1, 0.9490196, 0, 1,
-0.9823011, -0.2352627, -3.216806, 1, 0.9529412, 0, 1,
-0.9773142, -0.6840186, -0.7886372, 1, 0.9607843, 0, 1,
-0.9754853, 0.8974332, -2.470251, 1, 0.9647059, 0, 1,
-0.9751337, 2.257923, -1.422636, 1, 0.972549, 0, 1,
-0.9696032, -1.418292, -1.012681, 1, 0.9764706, 0, 1,
-0.9689336, -0.1526469, -3.285743, 1, 0.9843137, 0, 1,
-0.9671246, 0.8993653, -1.113653, 1, 0.9882353, 0, 1,
-0.9663542, 0.6011215, -1.058202, 1, 0.9960784, 0, 1,
-0.9624625, 0.3025917, -1.278216, 0.9960784, 1, 0, 1,
-0.961235, -1.059336, -1.136544, 0.9921569, 1, 0, 1,
-0.9542518, 1.095967, -0.8790156, 0.9843137, 1, 0, 1,
-0.9461924, 1.538209, -1.300301, 0.9803922, 1, 0, 1,
-0.9381165, -0.5196649, -2.111004, 0.972549, 1, 0, 1,
-0.9375808, -1.005811, -3.334059, 0.9686275, 1, 0, 1,
-0.9327869, 0.2786883, -1.643176, 0.9607843, 1, 0, 1,
-0.9255973, 1.692389, -0.3340312, 0.9568627, 1, 0, 1,
-0.9250415, 1.099961, -0.3029658, 0.9490196, 1, 0, 1,
-0.916957, -0.5991977, -1.111206, 0.945098, 1, 0, 1,
-0.9162839, 1.956317, 0.6131482, 0.9372549, 1, 0, 1,
-0.9103337, 1.349887, 0.5038223, 0.9333333, 1, 0, 1,
-0.9091918, -1.099053, -2.781541, 0.9254902, 1, 0, 1,
-0.908383, 0.8565857, -1.683463, 0.9215686, 1, 0, 1,
-0.9070157, -1.042666, -4.408504, 0.9137255, 1, 0, 1,
-0.9065533, 0.6270322, -1.862576, 0.9098039, 1, 0, 1,
-0.902721, -1.225544, -0.8356192, 0.9019608, 1, 0, 1,
-0.9027013, 0.3238896, -1.674902, 0.8941177, 1, 0, 1,
-0.9010029, -1.224103, -2.324798, 0.8901961, 1, 0, 1,
-0.894316, 0.3584372, 0.04539151, 0.8823529, 1, 0, 1,
-0.8920957, -1.03286, -1.736299, 0.8784314, 1, 0, 1,
-0.888379, -1.652585, -2.354666, 0.8705882, 1, 0, 1,
-0.8866308, -0.3916812, -1.70371, 0.8666667, 1, 0, 1,
-0.8847235, -1.695908, -1.979838, 0.8588235, 1, 0, 1,
-0.8746567, -0.7652969, -3.798037, 0.854902, 1, 0, 1,
-0.8696787, 0.05176414, -1.823707, 0.8470588, 1, 0, 1,
-0.8656558, -0.4018222, -0.6404399, 0.8431373, 1, 0, 1,
-0.8568016, -1.847702, -3.078956, 0.8352941, 1, 0, 1,
-0.8375807, 1.613263, -0.2115286, 0.8313726, 1, 0, 1,
-0.8370187, 1.041715, 0.09728564, 0.8235294, 1, 0, 1,
-0.8287797, -1.367957, -3.723873, 0.8196079, 1, 0, 1,
-0.8256517, -0.1597326, -3.238997, 0.8117647, 1, 0, 1,
-0.8254133, -0.01004783, 0.05137512, 0.8078431, 1, 0, 1,
-0.8249371, 1.852239, 0.7787641, 0.8, 1, 0, 1,
-0.8244653, 0.6784693, -1.590048, 0.7921569, 1, 0, 1,
-0.8242669, -1.551597, -2.325621, 0.7882353, 1, 0, 1,
-0.816418, -0.1398227, -3.682348, 0.7803922, 1, 0, 1,
-0.8148008, -0.8063408, -1.787774, 0.7764706, 1, 0, 1,
-0.8118019, -1.282162, -4.609526, 0.7686275, 1, 0, 1,
-0.8096885, -0.2488665, -2.595518, 0.7647059, 1, 0, 1,
-0.8096191, 0.01828464, -0.8525754, 0.7568628, 1, 0, 1,
-0.8070178, -1.575361, -3.291897, 0.7529412, 1, 0, 1,
-0.7994352, 1.388981, 0.3807436, 0.7450981, 1, 0, 1,
-0.7935745, -1.010486, -3.286799, 0.7411765, 1, 0, 1,
-0.7913649, -0.2237076, -0.2168079, 0.7333333, 1, 0, 1,
-0.7895985, 1.417457, -1.541832, 0.7294118, 1, 0, 1,
-0.7881016, -0.6273997, -1.766317, 0.7215686, 1, 0, 1,
-0.7865782, -0.4770912, -3.105377, 0.7176471, 1, 0, 1,
-0.785925, 0.8254017, -0.3249158, 0.7098039, 1, 0, 1,
-0.7845065, 0.1841578, -0.6622069, 0.7058824, 1, 0, 1,
-0.7814255, -0.250082, -1.616049, 0.6980392, 1, 0, 1,
-0.78142, -0.3801404, -0.9238875, 0.6901961, 1, 0, 1,
-0.7779369, -1.195324, -3.729531, 0.6862745, 1, 0, 1,
-0.7770353, -0.3318807, -2.564895, 0.6784314, 1, 0, 1,
-0.7716878, -0.3889959, -1.472708, 0.6745098, 1, 0, 1,
-0.7599977, -0.198555, -0.2310988, 0.6666667, 1, 0, 1,
-0.7586933, 0.4688691, -1.559958, 0.6627451, 1, 0, 1,
-0.7574326, 1.381341, -0.03717943, 0.654902, 1, 0, 1,
-0.7563938, -0.1276906, -0.8456478, 0.6509804, 1, 0, 1,
-0.7543144, -0.1357359, -0.2282477, 0.6431373, 1, 0, 1,
-0.7512048, -1.632797, -1.499524, 0.6392157, 1, 0, 1,
-0.7388316, 0.1484385, 0.3357816, 0.6313726, 1, 0, 1,
-0.7268707, -0.5485139, -2.423559, 0.627451, 1, 0, 1,
-0.7247941, -0.3015284, 0.7241387, 0.6196079, 1, 0, 1,
-0.7179937, 0.683997, 0.3466274, 0.6156863, 1, 0, 1,
-0.717973, 2.298363, -0.1581846, 0.6078432, 1, 0, 1,
-0.7159899, -1.123522, -3.399932, 0.6039216, 1, 0, 1,
-0.7154979, -0.4464305, -2.741919, 0.5960785, 1, 0, 1,
-0.7152126, -1.392012, -1.591673, 0.5882353, 1, 0, 1,
-0.7141895, -0.05843282, -1.705445, 0.5843138, 1, 0, 1,
-0.7125971, -0.3362368, -2.986058, 0.5764706, 1, 0, 1,
-0.7115563, -1.538991, -1.942724, 0.572549, 1, 0, 1,
-0.7069532, 0.9755733, -0.3754205, 0.5647059, 1, 0, 1,
-0.7038565, -1.570649, -3.422056, 0.5607843, 1, 0, 1,
-0.701619, 0.2598814, -1.036472, 0.5529412, 1, 0, 1,
-0.70161, -1.106457, -4.316861, 0.5490196, 1, 0, 1,
-0.6984168, 0.350556, -1.227816, 0.5411765, 1, 0, 1,
-0.696764, -0.5217759, -2.833791, 0.5372549, 1, 0, 1,
-0.6903254, -0.3563997, -3.648112, 0.5294118, 1, 0, 1,
-0.6777143, -0.2938079, -1.431411, 0.5254902, 1, 0, 1,
-0.670718, 0.1429031, -0.5350062, 0.5176471, 1, 0, 1,
-0.6701676, -1.428591, -2.183902, 0.5137255, 1, 0, 1,
-0.6679998, 0.4664549, -0.9128126, 0.5058824, 1, 0, 1,
-0.6626951, 0.146376, -1.847097, 0.5019608, 1, 0, 1,
-0.6614838, 0.2821461, -3.560287, 0.4941176, 1, 0, 1,
-0.660223, -0.5520654, -0.7640562, 0.4862745, 1, 0, 1,
-0.6521144, -0.04322512, -1.760309, 0.4823529, 1, 0, 1,
-0.64872, -0.1789807, -1.136882, 0.4745098, 1, 0, 1,
-0.6475773, -0.2967347, -0.8287743, 0.4705882, 1, 0, 1,
-0.6416603, -0.5267625, -0.002938363, 0.4627451, 1, 0, 1,
-0.6391696, -0.0481738, -2.838075, 0.4588235, 1, 0, 1,
-0.6372464, 1.251244, -1.222425, 0.4509804, 1, 0, 1,
-0.6318394, 0.2838047, -1.786255, 0.4470588, 1, 0, 1,
-0.6309772, 0.7516491, -1.78205, 0.4392157, 1, 0, 1,
-0.6304535, 1.116519, -1.111836, 0.4352941, 1, 0, 1,
-0.6281725, 0.522599, -0.01310129, 0.427451, 1, 0, 1,
-0.6279941, 0.00184699, -1.753938, 0.4235294, 1, 0, 1,
-0.6278489, -0.2896306, -2.236919, 0.4156863, 1, 0, 1,
-0.6201611, 1.612912, -1.862323, 0.4117647, 1, 0, 1,
-0.6119242, -0.5956132, -0.8411372, 0.4039216, 1, 0, 1,
-0.6088936, -0.07913116, -2.618835, 0.3960784, 1, 0, 1,
-0.6082563, 1.596122, -0.996487, 0.3921569, 1, 0, 1,
-0.6071364, 0.4156621, -0.7223644, 0.3843137, 1, 0, 1,
-0.6018344, 0.07242402, -1.074429, 0.3803922, 1, 0, 1,
-0.5993177, -1.153444, -2.59167, 0.372549, 1, 0, 1,
-0.5963944, -0.08381412, -1.176071, 0.3686275, 1, 0, 1,
-0.5872521, 1.026505, -0.2046638, 0.3607843, 1, 0, 1,
-0.5833672, -1.179879, -1.422694, 0.3568628, 1, 0, 1,
-0.5798085, 0.2877135, -0.05671068, 0.3490196, 1, 0, 1,
-0.5747671, 0.5137349, -1.38277, 0.345098, 1, 0, 1,
-0.5701266, -1.98723, -2.532563, 0.3372549, 1, 0, 1,
-0.5692431, -0.2891468, -3.089032, 0.3333333, 1, 0, 1,
-0.5686224, 0.109589, -0.04895183, 0.3254902, 1, 0, 1,
-0.5635695, 0.1724711, -1.280632, 0.3215686, 1, 0, 1,
-0.5584685, -1.888373, -3.943923, 0.3137255, 1, 0, 1,
-0.556631, 1.906001, 0.4525078, 0.3098039, 1, 0, 1,
-0.5553318, 1.238657, -1.823771, 0.3019608, 1, 0, 1,
-0.5528998, -0.3431202, -2.215243, 0.2941177, 1, 0, 1,
-0.5435207, -0.03523485, -0.7988685, 0.2901961, 1, 0, 1,
-0.5413067, -1.353252, -4.215897, 0.282353, 1, 0, 1,
-0.5341885, 0.4742384, -2.3216, 0.2784314, 1, 0, 1,
-0.5312233, 0.9301315, -0.3064658, 0.2705882, 1, 0, 1,
-0.521322, 0.7310618, -0.3957081, 0.2666667, 1, 0, 1,
-0.5186905, -2.214541, -2.522239, 0.2588235, 1, 0, 1,
-0.5144099, 1.757474, -0.1728993, 0.254902, 1, 0, 1,
-0.5089572, 0.4433506, 0.8559033, 0.2470588, 1, 0, 1,
-0.5061343, -0.7053427, -3.05558, 0.2431373, 1, 0, 1,
-0.5056564, -0.508939, -1.509535, 0.2352941, 1, 0, 1,
-0.5032075, -1.078395, -1.882789, 0.2313726, 1, 0, 1,
-0.4955231, -2.598708, -3.507265, 0.2235294, 1, 0, 1,
-0.4955024, 0.6297305, -1.221679, 0.2196078, 1, 0, 1,
-0.4918748, 1.761068, -1.937066, 0.2117647, 1, 0, 1,
-0.4899337, 0.2830951, -2.212411, 0.2078431, 1, 0, 1,
-0.4775449, -1.208545, -2.624984, 0.2, 1, 0, 1,
-0.4687189, -0.254605, -2.883033, 0.1921569, 1, 0, 1,
-0.4640147, -2.147201, -1.718807, 0.1882353, 1, 0, 1,
-0.4629463, -0.05931178, -0.8754215, 0.1803922, 1, 0, 1,
-0.461663, 1.994774, 0.08256579, 0.1764706, 1, 0, 1,
-0.4612521, 0.0873057, -2.011136, 0.1686275, 1, 0, 1,
-0.4549999, 0.4360953, -0.7150472, 0.1647059, 1, 0, 1,
-0.4453261, -0.06523088, -1.342402, 0.1568628, 1, 0, 1,
-0.4403313, -1.381164, -3.443581, 0.1529412, 1, 0, 1,
-0.4354578, -0.4821502, -2.370189, 0.145098, 1, 0, 1,
-0.430475, -0.09668352, -3.49616, 0.1411765, 1, 0, 1,
-0.4296573, 1.526323, 0.8830867, 0.1333333, 1, 0, 1,
-0.4255524, 2.140271, -1.070678, 0.1294118, 1, 0, 1,
-0.4167316, 0.08691146, -0.7484719, 0.1215686, 1, 0, 1,
-0.413912, 1.255241, 1.218824, 0.1176471, 1, 0, 1,
-0.4120867, -0.5011289, -2.86491, 0.1098039, 1, 0, 1,
-0.4117965, -0.8769714, -2.511375, 0.1058824, 1, 0, 1,
-0.4091485, -1.169087, -1.636848, 0.09803922, 1, 0, 1,
-0.4078, 0.5764905, -0.3004031, 0.09019608, 1, 0, 1,
-0.4072981, 0.4824772, -1.155055, 0.08627451, 1, 0, 1,
-0.4058147, -0.5850202, -4.175088, 0.07843138, 1, 0, 1,
-0.396029, -0.03448616, -2.349037, 0.07450981, 1, 0, 1,
-0.3860644, 1.452335, -1.370849, 0.06666667, 1, 0, 1,
-0.383719, 0.8893067, -1.223504, 0.0627451, 1, 0, 1,
-0.3825896, 0.5561665, -1.830869, 0.05490196, 1, 0, 1,
-0.3778253, 0.4499389, -1.014745, 0.05098039, 1, 0, 1,
-0.3777629, 0.9329138, 0.3628837, 0.04313726, 1, 0, 1,
-0.3695446, -0.4715745, -3.87265, 0.03921569, 1, 0, 1,
-0.3684472, -1.187824, -4.402971, 0.03137255, 1, 0, 1,
-0.3636765, -0.09492764, -2.615985, 0.02745098, 1, 0, 1,
-0.3609198, 1.402719, 0.5873153, 0.01960784, 1, 0, 1,
-0.3600203, 1.543913, -0.01054212, 0.01568628, 1, 0, 1,
-0.3587622, 0.09957551, -0.5435653, 0.007843138, 1, 0, 1,
-0.3586607, -0.1950288, -2.534549, 0.003921569, 1, 0, 1,
-0.3564236, 0.2198453, -1.879052, 0, 1, 0.003921569, 1,
-0.3505731, -0.5337459, -3.026499, 0, 1, 0.01176471, 1,
-0.3504052, 0.358944, -2.407007, 0, 1, 0.01568628, 1,
-0.3421678, -0.01996655, -1.743592, 0, 1, 0.02352941, 1,
-0.3393584, 0.4375215, -0.6961601, 0, 1, 0.02745098, 1,
-0.3386691, 0.6919519, -2.462655, 0, 1, 0.03529412, 1,
-0.3206276, 1.021125, 1.794653, 0, 1, 0.03921569, 1,
-0.3131217, 1.310556, -0.4424351, 0, 1, 0.04705882, 1,
-0.3111128, 0.2175572, 0.104168, 0, 1, 0.05098039, 1,
-0.3084116, 1.141174, 0.5162393, 0, 1, 0.05882353, 1,
-0.3081259, -1.018944, -1.237313, 0, 1, 0.0627451, 1,
-0.3080998, -1.278996, -5.166633, 0, 1, 0.07058824, 1,
-0.3079918, 0.6573393, -0.02761164, 0, 1, 0.07450981, 1,
-0.3053132, -0.6544465, -1.605641, 0, 1, 0.08235294, 1,
-0.3015656, -0.5807034, -4.8692, 0, 1, 0.08627451, 1,
-0.3004526, 0.1029081, -1.135612, 0, 1, 0.09411765, 1,
-0.2948622, 0.4705915, -1.002759, 0, 1, 0.1019608, 1,
-0.2749318, -0.9142246, -1.77635, 0, 1, 0.1058824, 1,
-0.2730007, -0.2699084, -1.361734, 0, 1, 0.1137255, 1,
-0.2704939, -0.5500196, -2.797923, 0, 1, 0.1176471, 1,
-0.2694022, 1.249764, 1.002503, 0, 1, 0.1254902, 1,
-0.2652892, 0.3161962, -0.6882303, 0, 1, 0.1294118, 1,
-0.265171, 0.8232184, -0.7120394, 0, 1, 0.1372549, 1,
-0.2595179, 0.1257552, -2.489651, 0, 1, 0.1411765, 1,
-0.2561099, -1.665384, -4.690531, 0, 1, 0.1490196, 1,
-0.2540399, -1.087398, -3.555389, 0, 1, 0.1529412, 1,
-0.2533997, -0.3688225, -2.827348, 0, 1, 0.1607843, 1,
-0.2515815, 0.123943, -0.6081305, 0, 1, 0.1647059, 1,
-0.2491349, 0.2426114, -2.118004, 0, 1, 0.172549, 1,
-0.2485751, 1.148186, -1.645334, 0, 1, 0.1764706, 1,
-0.2458375, 1.990107, -0.7595621, 0, 1, 0.1843137, 1,
-0.2427984, -0.2470771, -3.102264, 0, 1, 0.1882353, 1,
-0.2420739, 0.5816727, 0.002550524, 0, 1, 0.1960784, 1,
-0.2408003, -1.415778, -3.4811, 0, 1, 0.2039216, 1,
-0.2399269, -0.7169125, -2.943785, 0, 1, 0.2078431, 1,
-0.2383663, -0.3991388, -1.089146, 0, 1, 0.2156863, 1,
-0.2369805, 0.8254859, -0.6329764, 0, 1, 0.2196078, 1,
-0.2354789, -1.773522, -3.575288, 0, 1, 0.227451, 1,
-0.2295882, 0.6064438, 0.3893603, 0, 1, 0.2313726, 1,
-0.2282266, -1.021446, -2.146228, 0, 1, 0.2392157, 1,
-0.2280463, 0.5615024, 0.3484249, 0, 1, 0.2431373, 1,
-0.2278916, 0.9728374, -0.3065282, 0, 1, 0.2509804, 1,
-0.2185705, -1.303367, -3.846106, 0, 1, 0.254902, 1,
-0.2139213, 0.3500098, 0.2320472, 0, 1, 0.2627451, 1,
-0.2127364, -0.6646166, -4.292586, 0, 1, 0.2666667, 1,
-0.210311, 0.05740257, -1.062309, 0, 1, 0.2745098, 1,
-0.205687, -0.172265, -2.285341, 0, 1, 0.2784314, 1,
-0.2054064, 0.4036511, -0.5115414, 0, 1, 0.2862745, 1,
-0.2030834, 0.1254842, -0.9273508, 0, 1, 0.2901961, 1,
-0.2030613, -0.7028174, -1.5571, 0, 1, 0.2980392, 1,
-0.2028709, -1.947687, -3.283304, 0, 1, 0.3058824, 1,
-0.200242, 0.1900915, 1.702351, 0, 1, 0.3098039, 1,
-0.1963, -0.9395449, -3.810906, 0, 1, 0.3176471, 1,
-0.1934714, 0.9249187, 0.5282555, 0, 1, 0.3215686, 1,
-0.1933231, 0.5800742, 0.1862502, 0, 1, 0.3294118, 1,
-0.1921632, 1.832244, 0.1931307, 0, 1, 0.3333333, 1,
-0.1836483, -0.7302743, -3.527817, 0, 1, 0.3411765, 1,
-0.1828153, -0.105508, -1.983831, 0, 1, 0.345098, 1,
-0.1804989, 0.6950831, -0.5802012, 0, 1, 0.3529412, 1,
-0.177908, -0.004705844, -2.018061, 0, 1, 0.3568628, 1,
-0.1777051, -0.05162534, -3.799412, 0, 1, 0.3647059, 1,
-0.1716484, 0.7348645, 1.845283, 0, 1, 0.3686275, 1,
-0.1713627, 1.021638, -1.079692, 0, 1, 0.3764706, 1,
-0.1681399, 1.692158, 0.443601, 0, 1, 0.3803922, 1,
-0.1679758, 1.730374, 0.8446388, 0, 1, 0.3882353, 1,
-0.1654586, 0.5516078, -1.509287, 0, 1, 0.3921569, 1,
-0.1613574, 0.7268223, 1.496887, 0, 1, 0.4, 1,
-0.1574422, 1.095118, -0.06703324, 0, 1, 0.4078431, 1,
-0.1569205, 0.06203111, -0.61935, 0, 1, 0.4117647, 1,
-0.1566678, 0.5557796, -0.5310566, 0, 1, 0.4196078, 1,
-0.1544006, -0.5308131, -1.231423, 0, 1, 0.4235294, 1,
-0.1521901, -2.198579, -1.710798, 0, 1, 0.4313726, 1,
-0.1509939, -0.4332083, -2.355081, 0, 1, 0.4352941, 1,
-0.1487345, -0.6398686, -2.842204, 0, 1, 0.4431373, 1,
-0.1457635, 1.549582, 0.1512091, 0, 1, 0.4470588, 1,
-0.1437, -1.052076, -1.617908, 0, 1, 0.454902, 1,
-0.1434618, -1.249861, -3.014516, 0, 1, 0.4588235, 1,
-0.1416719, 1.743818, 0.4091995, 0, 1, 0.4666667, 1,
-0.1408935, -0.8968067, -3.616533, 0, 1, 0.4705882, 1,
-0.139099, 1.112264, 3.048443, 0, 1, 0.4784314, 1,
-0.1349048, -1.894446, -2.765509, 0, 1, 0.4823529, 1,
-0.1337612, 0.1708895, -1.032542, 0, 1, 0.4901961, 1,
-0.1334772, -1.666927, -2.29364, 0, 1, 0.4941176, 1,
-0.1322132, -0.1829507, -3.459334, 0, 1, 0.5019608, 1,
-0.12761, 0.3932016, 0.1698575, 0, 1, 0.509804, 1,
-0.126951, -0.3630818, -4.614471, 0, 1, 0.5137255, 1,
-0.1259027, 1.278974, -0.3514102, 0, 1, 0.5215687, 1,
-0.1241709, -0.4429431, -3.366559, 0, 1, 0.5254902, 1,
-0.1219499, 0.6349758, -0.5900835, 0, 1, 0.5333334, 1,
-0.1202687, 0.02860998, -1.567241, 0, 1, 0.5372549, 1,
-0.1197268, -0.6345621, -2.019778, 0, 1, 0.5450981, 1,
-0.1191454, -1.179332, -2.679536, 0, 1, 0.5490196, 1,
-0.1186421, -1.008068, -2.517024, 0, 1, 0.5568628, 1,
-0.1165523, -0.7743835, -1.608855, 0, 1, 0.5607843, 1,
-0.1137358, -1.504735, -3.675549, 0, 1, 0.5686275, 1,
-0.1125142, 1.105503, -0.2562546, 0, 1, 0.572549, 1,
-0.110973, 1.29073, -1.341392, 0, 1, 0.5803922, 1,
-0.1105638, -1.645279, -3.359774, 0, 1, 0.5843138, 1,
-0.1068188, 1.062471, -0.5281885, 0, 1, 0.5921569, 1,
-0.1027059, 0.06103392, -1.40974, 0, 1, 0.5960785, 1,
-0.1009668, -0.003857179, -0.8361716, 0, 1, 0.6039216, 1,
-0.09859807, -1.216631, -4.421277, 0, 1, 0.6117647, 1,
-0.09480863, 1.661355, -0.488963, 0, 1, 0.6156863, 1,
-0.08984816, -1.551115, -2.713473, 0, 1, 0.6235294, 1,
-0.08726511, 0.3921994, -0.8117346, 0, 1, 0.627451, 1,
-0.08530929, -1.199115, -2.344851, 0, 1, 0.6352941, 1,
-0.08466001, 1.52544, -0.8456053, 0, 1, 0.6392157, 1,
-0.08414523, -0.4086557, -2.746572, 0, 1, 0.6470588, 1,
-0.08279183, -0.5244331, -2.571775, 0, 1, 0.6509804, 1,
-0.08107067, 0.04734729, -1.66981, 0, 1, 0.6588235, 1,
-0.08025416, -1.230788, -3.66738, 0, 1, 0.6627451, 1,
-0.07937583, 1.52913, -0.01985485, 0, 1, 0.6705883, 1,
-0.0770267, 0.9121659, 0.3159433, 0, 1, 0.6745098, 1,
-0.07023074, -2.3184, -1.724254, 0, 1, 0.682353, 1,
-0.06769913, -0.7983019, -4.395389, 0, 1, 0.6862745, 1,
-0.06758916, -1.302099, -1.487556, 0, 1, 0.6941177, 1,
-0.06722702, 0.4374979, -1.025701, 0, 1, 0.7019608, 1,
-0.06016499, -0.8180047, -1.049755, 0, 1, 0.7058824, 1,
-0.05965735, 1.04065, -1.464731, 0, 1, 0.7137255, 1,
-0.05616088, -0.8920104, -2.660926, 0, 1, 0.7176471, 1,
-0.05348917, -0.2540927, -3.954771, 0, 1, 0.7254902, 1,
-0.05225639, 1.08575, -0.5562501, 0, 1, 0.7294118, 1,
-0.04920312, 0.8388411, -1.490474, 0, 1, 0.7372549, 1,
-0.04332614, -0.1670258, -2.462922, 0, 1, 0.7411765, 1,
-0.03699948, 0.4279474, -1.009751, 0, 1, 0.7490196, 1,
-0.03665605, -1.259107, -1.796993, 0, 1, 0.7529412, 1,
-0.03603258, -0.7262281, -2.456635, 0, 1, 0.7607843, 1,
-0.03399765, 0.2235151, 2.199232, 0, 1, 0.7647059, 1,
-0.02896168, -1.019565, -2.072739, 0, 1, 0.772549, 1,
-0.02890907, -1.2327, -1.212431, 0, 1, 0.7764706, 1,
-0.02749704, -0.909011, -2.363504, 0, 1, 0.7843137, 1,
-0.021639, 0.6079745, 0.7354078, 0, 1, 0.7882353, 1,
-0.01745507, -0.5631877, -3.684557, 0, 1, 0.7960784, 1,
-0.0159544, 1.562033, 0.5332813, 0, 1, 0.8039216, 1,
-0.01563019, 0.07190882, -0.7651889, 0, 1, 0.8078431, 1,
-0.0148433, 0.802088, -1.053001, 0, 1, 0.8156863, 1,
-0.01376568, -0.3329497, -4.697122, 0, 1, 0.8196079, 1,
-0.01047263, 0.6084796, 1.149599, 0, 1, 0.827451, 1,
-0.01015919, -0.855049, -2.452978, 0, 1, 0.8313726, 1,
-0.009554953, 0.9246663, 0.8513662, 0, 1, 0.8392157, 1,
-0.007735861, -0.07809708, -2.167582, 0, 1, 0.8431373, 1,
-0.006879624, -0.02416545, -2.963737, 0, 1, 0.8509804, 1,
-0.004631269, 0.3573838, -0.4503972, 0, 1, 0.854902, 1,
-0.001523524, 1.944271, -0.03299563, 0, 1, 0.8627451, 1,
-0.001163002, 1.361947, -1.322807, 0, 1, 0.8666667, 1,
-0.0006129919, -0.7540348, -3.310719, 0, 1, 0.8745098, 1,
0.003668061, -1.086897, 4.057678, 0, 1, 0.8784314, 1,
0.004543663, 0.712731, 0.3746996, 0, 1, 0.8862745, 1,
0.006235152, 0.9227882, -0.7841909, 0, 1, 0.8901961, 1,
0.006311965, 0.05832918, 0.6910944, 0, 1, 0.8980392, 1,
0.006877546, 0.1240612, -0.4771486, 0, 1, 0.9058824, 1,
0.007183313, -0.7383227, 1.778477, 0, 1, 0.9098039, 1,
0.007309291, 0.1084683, 0.5728289, 0, 1, 0.9176471, 1,
0.008685909, 1.031015, 0.6208335, 0, 1, 0.9215686, 1,
0.009116611, -2.100143, 4.053441, 0, 1, 0.9294118, 1,
0.009495069, -0.6736348, 4.187712, 0, 1, 0.9333333, 1,
0.01341315, 0.3969813, -0.4102925, 0, 1, 0.9411765, 1,
0.01711763, -0.9156867, 2.936544, 0, 1, 0.945098, 1,
0.01775033, 0.4673382, -0.2890963, 0, 1, 0.9529412, 1,
0.01842905, -0.7975828, 2.267839, 0, 1, 0.9568627, 1,
0.01876155, -2.755043, 2.749518, 0, 1, 0.9647059, 1,
0.01891882, -0.9275628, 3.37018, 0, 1, 0.9686275, 1,
0.01953878, -2.84266, 3.168756, 0, 1, 0.9764706, 1,
0.0227705, -1.942639, 1.92946, 0, 1, 0.9803922, 1,
0.02278377, 1.142631, -0.3993525, 0, 1, 0.9882353, 1,
0.025389, -1.822554, 1.418302, 0, 1, 0.9921569, 1,
0.02984297, 0.5028611, 0.4868676, 0, 1, 1, 1,
0.03030724, -2.119384, 3.838145, 0, 0.9921569, 1, 1,
0.03246583, 1.830252, -0.4962691, 0, 0.9882353, 1, 1,
0.03449264, -0.9227053, 2.076516, 0, 0.9803922, 1, 1,
0.03941616, -0.2640096, 3.922406, 0, 0.9764706, 1, 1,
0.04058846, -0.6136221, 2.958428, 0, 0.9686275, 1, 1,
0.04506801, -0.3188591, 2.214385, 0, 0.9647059, 1, 1,
0.04887291, 0.1831002, -0.9027475, 0, 0.9568627, 1, 1,
0.0494797, -1.624349, 3.111623, 0, 0.9529412, 1, 1,
0.05101292, 1.566496, 0.9381199, 0, 0.945098, 1, 1,
0.05113905, 2.294698, 1.256722, 0, 0.9411765, 1, 1,
0.05284406, 0.2681266, 1.544528, 0, 0.9333333, 1, 1,
0.06377328, -0.06873948, 2.075614, 0, 0.9294118, 1, 1,
0.06408226, 0.09548298, 1.070302, 0, 0.9215686, 1, 1,
0.06642947, 0.2362591, 0.8158637, 0, 0.9176471, 1, 1,
0.07293595, 1.465006, 0.05173962, 0, 0.9098039, 1, 1,
0.07293742, -1.289667, 5.174529, 0, 0.9058824, 1, 1,
0.07645038, 0.8762593, 0.3018596, 0, 0.8980392, 1, 1,
0.08126923, 0.2103148, 0.5214811, 0, 0.8901961, 1, 1,
0.08134673, 1.08097, -0.9058307, 0, 0.8862745, 1, 1,
0.08520789, 0.3493811, 0.3515523, 0, 0.8784314, 1, 1,
0.08601463, 0.2189033, 1.020731, 0, 0.8745098, 1, 1,
0.08879056, -0.90554, 2.865575, 0, 0.8666667, 1, 1,
0.09286168, 0.1626103, -1.094179, 0, 0.8627451, 1, 1,
0.09485326, -1.194283, 2.319582, 0, 0.854902, 1, 1,
0.09645219, 0.3373155, -0.9316583, 0, 0.8509804, 1, 1,
0.1000906, 0.116529, -0.3924281, 0, 0.8431373, 1, 1,
0.1036201, 1.720481, -0.174032, 0, 0.8392157, 1, 1,
0.107448, 0.04082659, 1.011405, 0, 0.8313726, 1, 1,
0.1087405, -1.956963, 3.620934, 0, 0.827451, 1, 1,
0.1107329, 0.8659551, 0.5567045, 0, 0.8196079, 1, 1,
0.1155907, 1.48977, 0.3363064, 0, 0.8156863, 1, 1,
0.1219719, 0.3447777, 1.243684, 0, 0.8078431, 1, 1,
0.1225131, 0.2544767, 0.48258, 0, 0.8039216, 1, 1,
0.1234707, -0.3220176, 3.198291, 0, 0.7960784, 1, 1,
0.1237866, -1.143845, 3.191124, 0, 0.7882353, 1, 1,
0.1245214, 0.06146173, 1.291747, 0, 0.7843137, 1, 1,
0.1253522, -0.07238644, 2.752267, 0, 0.7764706, 1, 1,
0.1262267, 1.974337, -0.3904387, 0, 0.772549, 1, 1,
0.1297664, 0.9128965, 1.200676, 0, 0.7647059, 1, 1,
0.1346857, -1.319304, 3.07813, 0, 0.7607843, 1, 1,
0.1346899, -0.899218, 2.38426, 0, 0.7529412, 1, 1,
0.1377435, 0.5236234, -0.7298496, 0, 0.7490196, 1, 1,
0.1403241, -0.4412308, 3.708364, 0, 0.7411765, 1, 1,
0.1413939, 1.343149, 0.5250614, 0, 0.7372549, 1, 1,
0.1419175, -1.489842, 2.101668, 0, 0.7294118, 1, 1,
0.1445588, -2.605123, 3.042023, 0, 0.7254902, 1, 1,
0.1468249, -0.3247368, 2.732634, 0, 0.7176471, 1, 1,
0.1473963, 1.073401, 0.6264886, 0, 0.7137255, 1, 1,
0.1508364, 1.64994, -0.306801, 0, 0.7058824, 1, 1,
0.1513025, 0.3733641, 1.443199, 0, 0.6980392, 1, 1,
0.1514838, -0.8370365, 3.58634, 0, 0.6941177, 1, 1,
0.1523671, 1.281947, -0.03356501, 0, 0.6862745, 1, 1,
0.1526576, -0.5775709, 1.562974, 0, 0.682353, 1, 1,
0.1527507, -1.254365, 3.134959, 0, 0.6745098, 1, 1,
0.1535307, 2.041824, -0.04645311, 0, 0.6705883, 1, 1,
0.1563692, 2.115616, 1.120721, 0, 0.6627451, 1, 1,
0.1604619, -1.363371, 4.902256, 0, 0.6588235, 1, 1,
0.1616163, -1.037004, 3.714384, 0, 0.6509804, 1, 1,
0.1707494, -1.045964, 1.251319, 0, 0.6470588, 1, 1,
0.1831028, -2.419763, 2.46763, 0, 0.6392157, 1, 1,
0.1852633, 0.5061462, 1.510003, 0, 0.6352941, 1, 1,
0.1864139, 0.04239324, 0.6162048, 0, 0.627451, 1, 1,
0.1872385, 0.5186952, -0.404028, 0, 0.6235294, 1, 1,
0.1876975, -0.4411108, 4.891638, 0, 0.6156863, 1, 1,
0.1887771, -0.7694935, 3.702009, 0, 0.6117647, 1, 1,
0.1892509, -0.6207141, 3.627544, 0, 0.6039216, 1, 1,
0.1909409, 1.316194, -0.6682585, 0, 0.5960785, 1, 1,
0.1967129, -1.542719, 4.773747, 0, 0.5921569, 1, 1,
0.1983288, -0.05958455, 1.398537, 0, 0.5843138, 1, 1,
0.198347, -1.866939, 2.755321, 0, 0.5803922, 1, 1,
0.1986553, -0.06407087, 2.294734, 0, 0.572549, 1, 1,
0.1988082, 0.01589576, 1.761654, 0, 0.5686275, 1, 1,
0.2005795, 0.05089676, 1.813975, 0, 0.5607843, 1, 1,
0.201377, 0.2913208, 2.425992, 0, 0.5568628, 1, 1,
0.2050611, -2.302809, 3.341535, 0, 0.5490196, 1, 1,
0.2079989, 1.361272, -0.5021896, 0, 0.5450981, 1, 1,
0.2118248, 0.829069, 0.892865, 0, 0.5372549, 1, 1,
0.2154373, -0.6336527, 3.05454, 0, 0.5333334, 1, 1,
0.2209387, -0.6419694, 2.643567, 0, 0.5254902, 1, 1,
0.2239124, -1.123148, 5.040828, 0, 0.5215687, 1, 1,
0.2297985, -1.610776, 3.003213, 0, 0.5137255, 1, 1,
0.2298147, 0.1705085, 1.23876, 0, 0.509804, 1, 1,
0.2381529, 0.77621, 0.5693833, 0, 0.5019608, 1, 1,
0.2469172, -0.4642284, 3.62447, 0, 0.4941176, 1, 1,
0.2477284, -0.349113, 2.17224, 0, 0.4901961, 1, 1,
0.252439, 1.716637, -0.3661171, 0, 0.4823529, 1, 1,
0.2587862, 2.377485, 1.700094, 0, 0.4784314, 1, 1,
0.2589859, 0.5799813, 0.1293878, 0, 0.4705882, 1, 1,
0.2590175, -0.1374337, 3.144552, 0, 0.4666667, 1, 1,
0.2599533, -1.281013, 4.527187, 0, 0.4588235, 1, 1,
0.2706362, 0.8840635, -0.03306784, 0, 0.454902, 1, 1,
0.2718707, 0.1741336, 1.814264, 0, 0.4470588, 1, 1,
0.2754102, -0.02070167, 2.65668, 0, 0.4431373, 1, 1,
0.2765558, -2.438003, 4.811413, 0, 0.4352941, 1, 1,
0.2907757, -0.6534108, 3.927741, 0, 0.4313726, 1, 1,
0.294035, -0.0287643, 0.290376, 0, 0.4235294, 1, 1,
0.2985204, -1.516458, 3.923375, 0, 0.4196078, 1, 1,
0.2992569, -1.443526, 3.966432, 0, 0.4117647, 1, 1,
0.2998192, -0.4397987, 1.747499, 0, 0.4078431, 1, 1,
0.301244, 2.474455, -0.822368, 0, 0.4, 1, 1,
0.3017677, -0.4951899, 2.27265, 0, 0.3921569, 1, 1,
0.3061478, -1.252855, 4.479895, 0, 0.3882353, 1, 1,
0.3086249, 0.1225321, 0.3176101, 0, 0.3803922, 1, 1,
0.3095482, -1.312303, 1.929301, 0, 0.3764706, 1, 1,
0.3122139, 0.5403384, -0.2841754, 0, 0.3686275, 1, 1,
0.3155401, -0.2400575, 2.041616, 0, 0.3647059, 1, 1,
0.317051, 1.406543, 0.4784673, 0, 0.3568628, 1, 1,
0.3200594, -1.058634, 2.542574, 0, 0.3529412, 1, 1,
0.3206634, 0.459468, 0.4590813, 0, 0.345098, 1, 1,
0.3209291, 2.254023, 1.016611, 0, 0.3411765, 1, 1,
0.3222303, 0.06599189, 0.8166083, 0, 0.3333333, 1, 1,
0.3229911, 1.752633, 0.1194563, 0, 0.3294118, 1, 1,
0.3236735, -1.560942, 3.797231, 0, 0.3215686, 1, 1,
0.3252473, 0.4002315, 1.386001, 0, 0.3176471, 1, 1,
0.3405475, 1.303421, 0.7573193, 0, 0.3098039, 1, 1,
0.3439711, -1.152729, 1.143735, 0, 0.3058824, 1, 1,
0.3453738, 1.332635, 1.974869, 0, 0.2980392, 1, 1,
0.3463572, -1.990583, 3.355106, 0, 0.2901961, 1, 1,
0.3464982, 0.3473333, 0.110337, 0, 0.2862745, 1, 1,
0.3526157, 0.4754311, 0.01634708, 0, 0.2784314, 1, 1,
0.3546128, 0.3324207, 0.8912132, 0, 0.2745098, 1, 1,
0.3579215, -1.046509, 4.04774, 0, 0.2666667, 1, 1,
0.3593723, 0.7845182, -0.05855849, 0, 0.2627451, 1, 1,
0.3600037, 1.047199, 0.7190295, 0, 0.254902, 1, 1,
0.3606084, 1.043385, -0.2545585, 0, 0.2509804, 1, 1,
0.3616026, -0.2812768, 3.508156, 0, 0.2431373, 1, 1,
0.3699227, -0.553719, 2.074212, 0, 0.2392157, 1, 1,
0.3703662, -0.1936723, 4.057123, 0, 0.2313726, 1, 1,
0.370389, -0.9608954, 3.415744, 0, 0.227451, 1, 1,
0.3713582, 1.145621, -0.1570219, 0, 0.2196078, 1, 1,
0.3717122, -1.64705, 2.958221, 0, 0.2156863, 1, 1,
0.3726268, -1.484874, 2.914497, 0, 0.2078431, 1, 1,
0.3737693, 0.3727491, 0.6471894, 0, 0.2039216, 1, 1,
0.3783708, -0.7268926, 2.809265, 0, 0.1960784, 1, 1,
0.3791863, 0.09231581, 0.4591283, 0, 0.1882353, 1, 1,
0.3877812, 1.998244, 0.2223454, 0, 0.1843137, 1, 1,
0.3886794, 0.3124258, 1.796708, 0, 0.1764706, 1, 1,
0.3934155, -0.8397487, 3.612171, 0, 0.172549, 1, 1,
0.4148982, -0.04921456, 3.06531, 0, 0.1647059, 1, 1,
0.4168071, -0.5019435, 3.273464, 0, 0.1607843, 1, 1,
0.4177617, -0.3206126, 2.189575, 0, 0.1529412, 1, 1,
0.4241295, 0.4920958, -0.08946853, 0, 0.1490196, 1, 1,
0.4249132, -0.7661186, 2.510355, 0, 0.1411765, 1, 1,
0.425364, 0.9365599, 0.5616271, 0, 0.1372549, 1, 1,
0.4374098, 0.2048317, 2.109084, 0, 0.1294118, 1, 1,
0.4393492, 0.06052006, 0.5878517, 0, 0.1254902, 1, 1,
0.4397702, 0.7522371, 2.05661, 0, 0.1176471, 1, 1,
0.4400056, -1.055253, 2.568216, 0, 0.1137255, 1, 1,
0.4472239, -0.6710061, 3.663689, 0, 0.1058824, 1, 1,
0.4475281, -0.5084052, 3.20063, 0, 0.09803922, 1, 1,
0.4524317, -0.2530746, 2.056378, 0, 0.09411765, 1, 1,
0.4525595, -0.7912321, 0.9912534, 0, 0.08627451, 1, 1,
0.4601239, -0.4354765, 1.627312, 0, 0.08235294, 1, 1,
0.4614487, -0.967296, 2.790815, 0, 0.07450981, 1, 1,
0.4620724, 0.2057354, 1.200737, 0, 0.07058824, 1, 1,
0.4663523, -0.6329635, 4.877727, 0, 0.0627451, 1, 1,
0.4666226, 0.07956223, 0.1965852, 0, 0.05882353, 1, 1,
0.4673485, -0.4879875, 2.389324, 0, 0.05098039, 1, 1,
0.4687173, 0.2189959, 1.245217, 0, 0.04705882, 1, 1,
0.4720104, -0.7112312, 4.427672, 0, 0.03921569, 1, 1,
0.481859, 0.4538539, 0.2573888, 0, 0.03529412, 1, 1,
0.4829808, 0.1549899, 1.118766, 0, 0.02745098, 1, 1,
0.484317, 0.3470474, 0.2398144, 0, 0.02352941, 1, 1,
0.4858917, 0.9042102, -0.2660848, 0, 0.01568628, 1, 1,
0.4885256, 0.3011464, 1.299829, 0, 0.01176471, 1, 1,
0.4886474, -0.4677308, 1.656831, 0, 0.003921569, 1, 1,
0.4941572, 1.63064, 0.4851411, 0.003921569, 0, 1, 1,
0.4994324, -0.6138318, 0.9136493, 0.007843138, 0, 1, 1,
0.4996417, -3.678593, 3.172411, 0.01568628, 0, 1, 1,
0.5003364, -0.3280503, 2.223017, 0.01960784, 0, 1, 1,
0.5004373, 1.813834, -0.8719137, 0.02745098, 0, 1, 1,
0.5025609, 0.04052284, 0.5146713, 0.03137255, 0, 1, 1,
0.5082688, -1.240943, 2.528206, 0.03921569, 0, 1, 1,
0.5096079, 0.236182, 0.8578837, 0.04313726, 0, 1, 1,
0.5220996, -0.4000677, 2.255638, 0.05098039, 0, 1, 1,
0.5235671, 0.9904643, -0.5770617, 0.05490196, 0, 1, 1,
0.5238473, -1.074758, 2.612598, 0.0627451, 0, 1, 1,
0.5238649, -0.928583, 2.188449, 0.06666667, 0, 1, 1,
0.5264806, 0.7988623, 0.6461967, 0.07450981, 0, 1, 1,
0.5301246, 0.6924567, 0.3644044, 0.07843138, 0, 1, 1,
0.5366615, 0.8667725, -0.7852566, 0.08627451, 0, 1, 1,
0.5379456, -0.6540892, 1.024277, 0.09019608, 0, 1, 1,
0.5412663, -0.182859, 2.829074, 0.09803922, 0, 1, 1,
0.5413556, -0.4582772, 1.667107, 0.1058824, 0, 1, 1,
0.542158, -0.7943708, 3.356916, 0.1098039, 0, 1, 1,
0.5517983, 0.4968435, -0.9603507, 0.1176471, 0, 1, 1,
0.5518903, 1.725802, -0.3260704, 0.1215686, 0, 1, 1,
0.5529249, 0.9481339, 0.6447728, 0.1294118, 0, 1, 1,
0.5538914, 1.916809, -0.3263347, 0.1333333, 0, 1, 1,
0.5558729, -0.5931575, 2.366299, 0.1411765, 0, 1, 1,
0.5680785, 0.6363859, 1.026006, 0.145098, 0, 1, 1,
0.5686821, 1.428171, 2.822524, 0.1529412, 0, 1, 1,
0.5705881, 0.4588395, 2.092848, 0.1568628, 0, 1, 1,
0.570882, -1.672306, 4.428924, 0.1647059, 0, 1, 1,
0.5798823, -0.6016141, 3.780134, 0.1686275, 0, 1, 1,
0.5835354, -1.343749, 1.803036, 0.1764706, 0, 1, 1,
0.5851753, -0.5394721, 1.567529, 0.1803922, 0, 1, 1,
0.5886438, -1.050342, 2.349079, 0.1882353, 0, 1, 1,
0.5900962, 1.818038, 0.04124473, 0.1921569, 0, 1, 1,
0.5976874, 0.4270245, 0.3421378, 0.2, 0, 1, 1,
0.5979586, -0.4733293, 3.889784, 0.2078431, 0, 1, 1,
0.611591, -0.3179408, 3.22599, 0.2117647, 0, 1, 1,
0.6171348, 0.8402682, 0.2980565, 0.2196078, 0, 1, 1,
0.6179051, 0.800549, -0.1586391, 0.2235294, 0, 1, 1,
0.6201371, 0.2297162, 1.270173, 0.2313726, 0, 1, 1,
0.6229503, -1.213417, 3.79759, 0.2352941, 0, 1, 1,
0.6271934, 1.133795, -0.1174131, 0.2431373, 0, 1, 1,
0.6272004, 1.31271, 0.1356799, 0.2470588, 0, 1, 1,
0.6326156, 0.9687534, -0.4187501, 0.254902, 0, 1, 1,
0.6381423, 1.843489, -1.233495, 0.2588235, 0, 1, 1,
0.6385478, -1.338445, 2.804618, 0.2666667, 0, 1, 1,
0.6418316, 0.02358217, -0.4255359, 0.2705882, 0, 1, 1,
0.6435972, -0.8932747, 4.313064, 0.2784314, 0, 1, 1,
0.6459261, 1.530928, -0.1050334, 0.282353, 0, 1, 1,
0.6504111, 1.446627, -0.2586785, 0.2901961, 0, 1, 1,
0.6537347, -0.2583667, 0.3115759, 0.2941177, 0, 1, 1,
0.6547533, 1.16889, 1.4456, 0.3019608, 0, 1, 1,
0.6570542, -0.6353366, 3.266013, 0.3098039, 0, 1, 1,
0.6572639, -1.63868, 2.511413, 0.3137255, 0, 1, 1,
0.6625555, -0.2061069, 3.127992, 0.3215686, 0, 1, 1,
0.6636503, -0.561003, 1.196159, 0.3254902, 0, 1, 1,
0.6644815, 0.9376013, 1.863901, 0.3333333, 0, 1, 1,
0.6648875, 1.393343, -1.036084, 0.3372549, 0, 1, 1,
0.6655464, -1.406013, 1.889481, 0.345098, 0, 1, 1,
0.6664186, -1.884903, 3.525167, 0.3490196, 0, 1, 1,
0.6687467, 1.493514, -0.7038743, 0.3568628, 0, 1, 1,
0.6725754, -1.608339, 3.551117, 0.3607843, 0, 1, 1,
0.6735943, 1.037473, 1.308118, 0.3686275, 0, 1, 1,
0.6761879, 0.2957445, 0.09326883, 0.372549, 0, 1, 1,
0.6783782, 1.305323, -0.2022348, 0.3803922, 0, 1, 1,
0.6952589, 0.6120484, 0.932385, 0.3843137, 0, 1, 1,
0.6953654, -0.2908227, 1.776919, 0.3921569, 0, 1, 1,
0.702377, -0.1714725, -0.5696536, 0.3960784, 0, 1, 1,
0.7089203, -0.1599743, 1.937214, 0.4039216, 0, 1, 1,
0.7103377, 0.08828434, 2.567853, 0.4117647, 0, 1, 1,
0.7134899, -1.09766, 2.206861, 0.4156863, 0, 1, 1,
0.7138698, 1.469118, 0.245891, 0.4235294, 0, 1, 1,
0.7148072, -0.3930709, 2.310416, 0.427451, 0, 1, 1,
0.7151344, -0.7942841, 3.100654, 0.4352941, 0, 1, 1,
0.7263121, -0.7803969, 2.457151, 0.4392157, 0, 1, 1,
0.7313001, -0.07750578, 2.121065, 0.4470588, 0, 1, 1,
0.7333675, -0.1124469, 1.88034, 0.4509804, 0, 1, 1,
0.7349461, 1.264331, 0.5699205, 0.4588235, 0, 1, 1,
0.7428854, 0.005290219, 2.091644, 0.4627451, 0, 1, 1,
0.7451792, 0.8122433, 0.7550741, 0.4705882, 0, 1, 1,
0.7455233, -1.439017, 3.287886, 0.4745098, 0, 1, 1,
0.7491331, -1.445439, 3.071185, 0.4823529, 0, 1, 1,
0.7501463, -1.12161, 2.054231, 0.4862745, 0, 1, 1,
0.7531595, 0.6069482, 2.451381, 0.4941176, 0, 1, 1,
0.7539018, 0.3341656, 1.388512, 0.5019608, 0, 1, 1,
0.7576092, 0.9173945, 1.661837, 0.5058824, 0, 1, 1,
0.7654801, -0.3917867, 2.625114, 0.5137255, 0, 1, 1,
0.767974, 2.376312, 0.207315, 0.5176471, 0, 1, 1,
0.7697374, -0.005676718, 2.627856, 0.5254902, 0, 1, 1,
0.7698013, -0.4425567, 2.465869, 0.5294118, 0, 1, 1,
0.7700566, 1.93084, -0.18146, 0.5372549, 0, 1, 1,
0.770732, -0.09245152, 2.242426, 0.5411765, 0, 1, 1,
0.7712008, 1.091851, 0.5276219, 0.5490196, 0, 1, 1,
0.774052, 0.02304701, 1.154047, 0.5529412, 0, 1, 1,
0.7743947, -0.05936924, 2.354428, 0.5607843, 0, 1, 1,
0.7760848, -1.019536, 3.221684, 0.5647059, 0, 1, 1,
0.7781358, 0.8945168, 0.8376365, 0.572549, 0, 1, 1,
0.7828192, -0.2049321, 0.8179653, 0.5764706, 0, 1, 1,
0.7871804, 1.850721, 1.014364, 0.5843138, 0, 1, 1,
0.7921631, 0.3652733, 0.5641978, 0.5882353, 0, 1, 1,
0.7936675, -1.103571, 0.802088, 0.5960785, 0, 1, 1,
0.8054491, -0.6932242, 2.360234, 0.6039216, 0, 1, 1,
0.8083333, 0.5239273, 0.2194145, 0.6078432, 0, 1, 1,
0.8090135, -0.6684603, 1.267118, 0.6156863, 0, 1, 1,
0.8145533, 1.437388, 1.563644, 0.6196079, 0, 1, 1,
0.8160107, -1.157263, 0.2278015, 0.627451, 0, 1, 1,
0.8182602, 0.3438391, -1.025208, 0.6313726, 0, 1, 1,
0.819749, -1.968225, 5.052404, 0.6392157, 0, 1, 1,
0.82303, -0.8818501, 2.444491, 0.6431373, 0, 1, 1,
0.8249363, 0.0781633, 2.66917, 0.6509804, 0, 1, 1,
0.8253329, 0.5086375, -1.064262, 0.654902, 0, 1, 1,
0.8346268, 0.7636741, 0.4753888, 0.6627451, 0, 1, 1,
0.8365595, -0.2190493, 1.572111, 0.6666667, 0, 1, 1,
0.8406246, 0.8001126, 0.53166, 0.6745098, 0, 1, 1,
0.8433818, 0.3468305, 1.673799, 0.6784314, 0, 1, 1,
0.844108, 0.3660547, 0.9583068, 0.6862745, 0, 1, 1,
0.8469525, 0.08254299, 2.370859, 0.6901961, 0, 1, 1,
0.8556728, 0.2574855, 1.016947, 0.6980392, 0, 1, 1,
0.8610341, 1.574993, -0.3293445, 0.7058824, 0, 1, 1,
0.8633821, 0.0506378, 0.8488819, 0.7098039, 0, 1, 1,
0.8635932, -1.452476, 3.847121, 0.7176471, 0, 1, 1,
0.8641019, -0.3904297, 2.137776, 0.7215686, 0, 1, 1,
0.8648828, 0.1405572, 1.674264, 0.7294118, 0, 1, 1,
0.8660315, 1.572166, 1.167647, 0.7333333, 0, 1, 1,
0.8713153, -1.288395, 1.988559, 0.7411765, 0, 1, 1,
0.8721874, -1.605916, 0.5320005, 0.7450981, 0, 1, 1,
0.8724262, 0.7566919, -0.1544551, 0.7529412, 0, 1, 1,
0.87818, -0.3447643, -0.2174218, 0.7568628, 0, 1, 1,
0.8855181, -1.191938, 1.738975, 0.7647059, 0, 1, 1,
0.8952082, -1.286092, 2.774117, 0.7686275, 0, 1, 1,
0.9037212, -1.870413, 1.435847, 0.7764706, 0, 1, 1,
0.9039696, -1.274149, 2.414156, 0.7803922, 0, 1, 1,
0.904209, 0.04703346, 0.373849, 0.7882353, 0, 1, 1,
0.9060259, -0.1252695, 0.7961081, 0.7921569, 0, 1, 1,
0.9069517, -0.9828169, 1.811453, 0.8, 0, 1, 1,
0.9084806, 0.8275167, 1.085865, 0.8078431, 0, 1, 1,
0.90856, 0.4202315, 1.09171, 0.8117647, 0, 1, 1,
0.9149516, 0.803273, 0.5198613, 0.8196079, 0, 1, 1,
0.9159693, 2.115629, -1.335297, 0.8235294, 0, 1, 1,
0.9188666, 0.2585767, 1.374875, 0.8313726, 0, 1, 1,
0.9341056, -1.128872, 3.343933, 0.8352941, 0, 1, 1,
0.94131, 0.4594427, 0.002576186, 0.8431373, 0, 1, 1,
0.9467604, -0.2391682, 3.800707, 0.8470588, 0, 1, 1,
0.9596618, 0.5395281, 2.88142, 0.854902, 0, 1, 1,
0.9677306, 0.007408638, 3.049285, 0.8588235, 0, 1, 1,
0.9733545, 1.120286, -0.8045168, 0.8666667, 0, 1, 1,
0.9747043, 0.7253653, 1.751536, 0.8705882, 0, 1, 1,
0.9753886, 0.6815069, 1.276177, 0.8784314, 0, 1, 1,
0.9755303, -1.085429, 0.9606955, 0.8823529, 0, 1, 1,
0.9787692, -0.148041, 1.195914, 0.8901961, 0, 1, 1,
0.983632, 0.9008301, -0.1522722, 0.8941177, 0, 1, 1,
0.9877692, -1.487273, 3.624908, 0.9019608, 0, 1, 1,
0.9885402, -0.4365022, 2.468799, 0.9098039, 0, 1, 1,
0.9890304, -1.684154, 3.988512, 0.9137255, 0, 1, 1,
0.9898018, 1.415792, -0.1040086, 0.9215686, 0, 1, 1,
0.9915771, 1.859773, 1.803771, 0.9254902, 0, 1, 1,
0.998096, 1.240806, -1.400627, 0.9333333, 0, 1, 1,
1.006073, 0.07592704, 2.871996, 0.9372549, 0, 1, 1,
1.009316, -2.154384, 2.843983, 0.945098, 0, 1, 1,
1.01018, 0.9025642, -0.2796863, 0.9490196, 0, 1, 1,
1.010218, -0.9260674, 1.718058, 0.9568627, 0, 1, 1,
1.01146, 0.6807151, 1.242248, 0.9607843, 0, 1, 1,
1.012792, -0.324941, 1.674825, 0.9686275, 0, 1, 1,
1.013468, -0.02222343, 1.555419, 0.972549, 0, 1, 1,
1.01477, -3.295156, 2.574937, 0.9803922, 0, 1, 1,
1.020897, 1.006588, 0.1445725, 0.9843137, 0, 1, 1,
1.030061, 2.750401, -0.7519712, 0.9921569, 0, 1, 1,
1.032746, 1.920386, 1.579063, 0.9960784, 0, 1, 1,
1.03621, 0.3022769, 0.8564791, 1, 0, 0.9960784, 1,
1.038722, -0.7342345, 1.861611, 1, 0, 0.9882353, 1,
1.040209, 0.1913465, 2.255963, 1, 0, 0.9843137, 1,
1.046084, -2.027605, 2.796033, 1, 0, 0.9764706, 1,
1.046395, -0.7147795, 1.866649, 1, 0, 0.972549, 1,
1.051003, -0.5748817, 1.939352, 1, 0, 0.9647059, 1,
1.054282, -0.4202572, 3.124683, 1, 0, 0.9607843, 1,
1.057289, -0.7062854, 2.202314, 1, 0, 0.9529412, 1,
1.059168, 0.8001693, 1.37776, 1, 0, 0.9490196, 1,
1.060359, 0.5114968, 1.393918, 1, 0, 0.9411765, 1,
1.063703, 0.4903079, 0.5622785, 1, 0, 0.9372549, 1,
1.064934, -2.188937, 2.844278, 1, 0, 0.9294118, 1,
1.069146, -0.3743287, 1.379783, 1, 0, 0.9254902, 1,
1.070499, 0.8844465, 1.747326, 1, 0, 0.9176471, 1,
1.076027, 1.107634, 1.023994, 1, 0, 0.9137255, 1,
1.076606, 0.3937357, 0.6331808, 1, 0, 0.9058824, 1,
1.07699, 1.177711, 1.791145, 1, 0, 0.9019608, 1,
1.084845, 0.7090892, 2.6756, 1, 0, 0.8941177, 1,
1.09451, 0.7771072, 1.202389, 1, 0, 0.8862745, 1,
1.097726, -0.3621779, 1.430357, 1, 0, 0.8823529, 1,
1.098716, 2.218983, 1.077857, 1, 0, 0.8745098, 1,
1.117319, 1.213329, 1.918981, 1, 0, 0.8705882, 1,
1.122567, 0.4632684, 0.5288624, 1, 0, 0.8627451, 1,
1.13168, 1.233927, -0.9858571, 1, 0, 0.8588235, 1,
1.135049, -0.3776887, 1.426506, 1, 0, 0.8509804, 1,
1.149901, -0.1246394, 0.9888479, 1, 0, 0.8470588, 1,
1.152458, 1.191393, 1.664833, 1, 0, 0.8392157, 1,
1.158946, 0.2940938, 1.461434, 1, 0, 0.8352941, 1,
1.15899, 1.285388, -0.09891935, 1, 0, 0.827451, 1,
1.163063, 0.3007706, 1.288373, 1, 0, 0.8235294, 1,
1.164152, -2.085749, 3.202454, 1, 0, 0.8156863, 1,
1.166521, 1.882319, -1.126115, 1, 0, 0.8117647, 1,
1.169841, 0.6653929, 0.6426609, 1, 0, 0.8039216, 1,
1.170105, 1.322251, 1.189574, 1, 0, 0.7960784, 1,
1.175388, -1.46358, 2.342383, 1, 0, 0.7921569, 1,
1.1755, -0.1526363, 0.9806154, 1, 0, 0.7843137, 1,
1.1933, -1.496343, 3.948326, 1, 0, 0.7803922, 1,
1.204426, -2.055753, 1.732379, 1, 0, 0.772549, 1,
1.20696, -0.4103186, 3.12095, 1, 0, 0.7686275, 1,
1.207299, 1.191944, -0.1462978, 1, 0, 0.7607843, 1,
1.208876, -2.128254, 5.119805, 1, 0, 0.7568628, 1,
1.218713, -0.9584657, 1.5859, 1, 0, 0.7490196, 1,
1.22086, -2.08726, 2.650935, 1, 0, 0.7450981, 1,
1.223698, -0.7630729, 0.2915011, 1, 0, 0.7372549, 1,
1.236381, -0.4617431, 0.6433268, 1, 0, 0.7333333, 1,
1.241188, 0.1002828, 2.242468, 1, 0, 0.7254902, 1,
1.244927, -0.2832832, 2.903149, 1, 0, 0.7215686, 1,
1.248011, 0.9803883, 0.3020306, 1, 0, 0.7137255, 1,
1.251903, 0.2778346, 1.743791, 1, 0, 0.7098039, 1,
1.25866, -0.6859329, 1.818141, 1, 0, 0.7019608, 1,
1.26159, 0.08299826, 2.058394, 1, 0, 0.6941177, 1,
1.264585, -0.5169878, 3.09909, 1, 0, 0.6901961, 1,
1.266789, 1.566523, 2.066387, 1, 0, 0.682353, 1,
1.2668, -0.3268109, 1.760699, 1, 0, 0.6784314, 1,
1.290209, 0.8315139, 0.5670858, 1, 0, 0.6705883, 1,
1.293429, -0.4863794, 2.696, 1, 0, 0.6666667, 1,
1.293887, -0.7486901, 2.950986, 1, 0, 0.6588235, 1,
1.299512, -0.2355205, 0.8286422, 1, 0, 0.654902, 1,
1.303639, -0.7474894, 1.553638, 1, 0, 0.6470588, 1,
1.314331, -0.2926106, 0.7577649, 1, 0, 0.6431373, 1,
1.319659, 1.067486, 0.3957308, 1, 0, 0.6352941, 1,
1.32753, -1.704707, 1.816841, 1, 0, 0.6313726, 1,
1.342808, -1.265597, 3.242878, 1, 0, 0.6235294, 1,
1.344045, 0.2235054, 0.5247749, 1, 0, 0.6196079, 1,
1.347813, -0.1329506, 1.197966, 1, 0, 0.6117647, 1,
1.353424, 0.07790908, 3.178895, 1, 0, 0.6078432, 1,
1.354423, 0.145895, 1.171397, 1, 0, 0.6, 1,
1.356023, 0.02147816, 0.2602697, 1, 0, 0.5921569, 1,
1.361381, 0.6319781, -0.01051567, 1, 0, 0.5882353, 1,
1.37025, 2.02133, 1.7086, 1, 0, 0.5803922, 1,
1.370855, -0.6404219, 3.294587, 1, 0, 0.5764706, 1,
1.372823, 0.02514294, 1.77368, 1, 0, 0.5686275, 1,
1.379639, -1.422901, 1.752606, 1, 0, 0.5647059, 1,
1.381341, 1.41844, 2.466582, 1, 0, 0.5568628, 1,
1.384602, -0.4386822, 1.037762, 1, 0, 0.5529412, 1,
1.38706, -0.5832823, 0.441629, 1, 0, 0.5450981, 1,
1.388571, 1.168126, 2.147669, 1, 0, 0.5411765, 1,
1.389303, -0.2976973, 2.432866, 1, 0, 0.5333334, 1,
1.396315, -1.407079, 2.303186, 1, 0, 0.5294118, 1,
1.398458, -1.129525, 1.896636, 1, 0, 0.5215687, 1,
1.416069, 0.77227, 1.194615, 1, 0, 0.5176471, 1,
1.420609, 2.260638, -0.5860767, 1, 0, 0.509804, 1,
1.42661, 0.1852531, 1.586331, 1, 0, 0.5058824, 1,
1.429095, -0.4151564, 2.4745, 1, 0, 0.4980392, 1,
1.437576, 0.9213166, 1.204006, 1, 0, 0.4901961, 1,
1.446258, -0.9895254, 0.1059899, 1, 0, 0.4862745, 1,
1.454481, 0.6180238, 0.4423833, 1, 0, 0.4784314, 1,
1.460303, 1.282572, -1.192745, 1, 0, 0.4745098, 1,
1.470511, -0.08591426, 0.7737305, 1, 0, 0.4666667, 1,
1.471472, 0.1001296, 2.805726, 1, 0, 0.4627451, 1,
1.473488, 0.8307632, 0.776113, 1, 0, 0.454902, 1,
1.483046, 0.2499712, 0.714754, 1, 0, 0.4509804, 1,
1.486047, 0.01780951, 1.760563, 1, 0, 0.4431373, 1,
1.486274, -0.7017325, 2.592074, 1, 0, 0.4392157, 1,
1.486915, -1.028127, 1.073081, 1, 0, 0.4313726, 1,
1.489474, -0.9759948, 1.619099, 1, 0, 0.427451, 1,
1.496011, -0.5728903, 2.31796, 1, 0, 0.4196078, 1,
1.502372, 0.2144545, 1.099869, 1, 0, 0.4156863, 1,
1.50326, 0.3183777, 1.573042, 1, 0, 0.4078431, 1,
1.528072, 1.227618, 2.582617, 1, 0, 0.4039216, 1,
1.532588, 2.674749, 0.8211587, 1, 0, 0.3960784, 1,
1.536032, 1.156563, 0.05491791, 1, 0, 0.3882353, 1,
1.541369, 2.249343, 1.634971, 1, 0, 0.3843137, 1,
1.551528, 0.8836954, 0.08144696, 1, 0, 0.3764706, 1,
1.57122, -0.4139498, 0.6709824, 1, 0, 0.372549, 1,
1.584098, -0.2982258, 2.489941, 1, 0, 0.3647059, 1,
1.596387, 1.040752, 2.343764, 1, 0, 0.3607843, 1,
1.605822, -0.9760971, 1.159998, 1, 0, 0.3529412, 1,
1.611266, -1.024249, 2.603799, 1, 0, 0.3490196, 1,
1.619336, -1.2362, 4.229637, 1, 0, 0.3411765, 1,
1.624733, 0.6869694, 2.084297, 1, 0, 0.3372549, 1,
1.649577, -1.798486, 2.828737, 1, 0, 0.3294118, 1,
1.654885, -0.5322573, 1.548948, 1, 0, 0.3254902, 1,
1.673651, -1.405957, 3.281601, 1, 0, 0.3176471, 1,
1.682675, 0.5598792, 0.7440998, 1, 0, 0.3137255, 1,
1.702668, 1.17931, 2.122273, 1, 0, 0.3058824, 1,
1.710335, -0.17761, 1.547485, 1, 0, 0.2980392, 1,
1.723681, 0.4793814, 2.92699, 1, 0, 0.2941177, 1,
1.746167, 0.4962825, 2.536747, 1, 0, 0.2862745, 1,
1.749399, -0.8216562, 1.756266, 1, 0, 0.282353, 1,
1.750374, 0.9649422, 2.094422, 1, 0, 0.2745098, 1,
1.759976, 0.02549423, 2.53348, 1, 0, 0.2705882, 1,
1.766683, 1.090216, 2.059488, 1, 0, 0.2627451, 1,
1.771099, 0.047152, 1.03426, 1, 0, 0.2588235, 1,
1.780059, 0.3720815, 1.795057, 1, 0, 0.2509804, 1,
1.791899, 0.6110716, 2.077151, 1, 0, 0.2470588, 1,
1.824712, 0.28565, -0.4357725, 1, 0, 0.2392157, 1,
1.82625, -1.526273, 3.572702, 1, 0, 0.2352941, 1,
1.830095, 0.5178789, 3.187722, 1, 0, 0.227451, 1,
1.83932, -1.20811, 2.660192, 1, 0, 0.2235294, 1,
1.846921, -0.7446831, 0.6272014, 1, 0, 0.2156863, 1,
1.859571, -2.160468, 2.291793, 1, 0, 0.2117647, 1,
1.870402, -0.1333827, 2.44176, 1, 0, 0.2039216, 1,
1.87181, -0.4235157, 2.805638, 1, 0, 0.1960784, 1,
1.884457, -1.913258, 0.2258954, 1, 0, 0.1921569, 1,
1.889196, 0.9715139, -0.3102649, 1, 0, 0.1843137, 1,
1.889671, 0.8917555, 0.2837424, 1, 0, 0.1803922, 1,
1.932284, 0.2787771, 0.4955481, 1, 0, 0.172549, 1,
1.946922, 0.1782979, 1.246013, 1, 0, 0.1686275, 1,
1.983382, 1.026272, 1.773046, 1, 0, 0.1607843, 1,
1.99345, 0.663134, -0.1363536, 1, 0, 0.1568628, 1,
1.997934, 0.3137736, 1.98946, 1, 0, 0.1490196, 1,
2.027524, 1.696042, 1.807067, 1, 0, 0.145098, 1,
2.033579, -1.794586, 1.972829, 1, 0, 0.1372549, 1,
2.058574, 0.2583225, 2.532489, 1, 0, 0.1333333, 1,
2.060247, -0.08788664, 1.992647, 1, 0, 0.1254902, 1,
2.079795, 1.471027, 1.345824, 1, 0, 0.1215686, 1,
2.123178, 0.6895219, -0.2596806, 1, 0, 0.1137255, 1,
2.131896, -0.1544467, 0.5707082, 1, 0, 0.1098039, 1,
2.191489, 1.303364, 0.8149316, 1, 0, 0.1019608, 1,
2.231913, -0.392828, -0.01417641, 1, 0, 0.09411765, 1,
2.257339, -0.417571, 1.782969, 1, 0, 0.09019608, 1,
2.285704, 0.2820352, 0.653401, 1, 0, 0.08235294, 1,
2.30069, 0.07551369, 0.7847226, 1, 0, 0.07843138, 1,
2.306245, -0.5501287, 1.133672, 1, 0, 0.07058824, 1,
2.348222, -0.4797358, 1.500212, 1, 0, 0.06666667, 1,
2.371213, -0.09751352, 0.5668074, 1, 0, 0.05882353, 1,
2.383625, 1.617577, 1.571863, 1, 0, 0.05490196, 1,
2.528437, -1.104457, 1.842958, 1, 0, 0.04705882, 1,
2.569217, -0.6150624, 0.5813978, 1, 0, 0.04313726, 1,
2.613333, 0.2074332, 3.105116, 1, 0, 0.03529412, 1,
2.6177, 0.2930517, 0.2784809, 1, 0, 0.03137255, 1,
2.782935, 0.6421976, -0.1548254, 1, 0, 0.02352941, 1,
2.823117, 0.5966986, 2.138635, 1, 0, 0.01960784, 1,
2.857743, 2.425171, 0.5264502, 1, 0, 0.01176471, 1,
3.016484, 1.381798, 0.02847152, 1, 0, 0.007843138, 1
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
0.01828051, -4.768308, -6.919459, 0, -0.5, 0.5, 0.5,
0.01828051, -4.768308, -6.919459, 1, -0.5, 0.5, 0.5,
0.01828051, -4.768308, -6.919459, 1, 1.5, 0.5, 0.5,
0.01828051, -4.768308, -6.919459, 0, 1.5, 0.5, 0.5
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
-3.996314, -0.4640961, -6.919459, 0, -0.5, 0.5, 0.5,
-3.996314, -0.4640961, -6.919459, 1, -0.5, 0.5, 0.5,
-3.996314, -0.4640961, -6.919459, 1, 1.5, 0.5, 0.5,
-3.996314, -0.4640961, -6.919459, 0, 1.5, 0.5, 0.5
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
-3.996314, -4.768308, 0.003948212, 0, -0.5, 0.5, 0.5,
-3.996314, -4.768308, 0.003948212, 1, -0.5, 0.5, 0.5,
-3.996314, -4.768308, 0.003948212, 1, 1.5, 0.5, 0.5,
-3.996314, -4.768308, 0.003948212, 0, 1.5, 0.5, 0.5
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
-2, -3.775028, -5.32175,
3, -3.775028, -5.32175,
-2, -3.775028, -5.32175,
-2, -3.940575, -5.588035,
-1, -3.775028, -5.32175,
-1, -3.940575, -5.588035,
0, -3.775028, -5.32175,
0, -3.940575, -5.588035,
1, -3.775028, -5.32175,
1, -3.940575, -5.588035,
2, -3.775028, -5.32175,
2, -3.940575, -5.588035,
3, -3.775028, -5.32175,
3, -3.940575, -5.588035
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
-2, -4.271668, -6.120605, 0, -0.5, 0.5, 0.5,
-2, -4.271668, -6.120605, 1, -0.5, 0.5, 0.5,
-2, -4.271668, -6.120605, 1, 1.5, 0.5, 0.5,
-2, -4.271668, -6.120605, 0, 1.5, 0.5, 0.5,
-1, -4.271668, -6.120605, 0, -0.5, 0.5, 0.5,
-1, -4.271668, -6.120605, 1, -0.5, 0.5, 0.5,
-1, -4.271668, -6.120605, 1, 1.5, 0.5, 0.5,
-1, -4.271668, -6.120605, 0, 1.5, 0.5, 0.5,
0, -4.271668, -6.120605, 0, -0.5, 0.5, 0.5,
0, -4.271668, -6.120605, 1, -0.5, 0.5, 0.5,
0, -4.271668, -6.120605, 1, 1.5, 0.5, 0.5,
0, -4.271668, -6.120605, 0, 1.5, 0.5, 0.5,
1, -4.271668, -6.120605, 0, -0.5, 0.5, 0.5,
1, -4.271668, -6.120605, 1, -0.5, 0.5, 0.5,
1, -4.271668, -6.120605, 1, 1.5, 0.5, 0.5,
1, -4.271668, -6.120605, 0, 1.5, 0.5, 0.5,
2, -4.271668, -6.120605, 0, -0.5, 0.5, 0.5,
2, -4.271668, -6.120605, 1, -0.5, 0.5, 0.5,
2, -4.271668, -6.120605, 1, 1.5, 0.5, 0.5,
2, -4.271668, -6.120605, 0, 1.5, 0.5, 0.5,
3, -4.271668, -6.120605, 0, -0.5, 0.5, 0.5,
3, -4.271668, -6.120605, 1, -0.5, 0.5, 0.5,
3, -4.271668, -6.120605, 1, 1.5, 0.5, 0.5,
3, -4.271668, -6.120605, 0, 1.5, 0.5, 0.5
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
-3.069869, -3, -5.32175,
-3.069869, 2, -5.32175,
-3.069869, -3, -5.32175,
-3.224276, -3, -5.588035,
-3.069869, -2, -5.32175,
-3.224276, -2, -5.588035,
-3.069869, -1, -5.32175,
-3.224276, -1, -5.588035,
-3.069869, 0, -5.32175,
-3.224276, 0, -5.588035,
-3.069869, 1, -5.32175,
-3.224276, 1, -5.588035,
-3.069869, 2, -5.32175,
-3.224276, 2, -5.588035
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
-3.533091, -3, -6.120605, 0, -0.5, 0.5, 0.5,
-3.533091, -3, -6.120605, 1, -0.5, 0.5, 0.5,
-3.533091, -3, -6.120605, 1, 1.5, 0.5, 0.5,
-3.533091, -3, -6.120605, 0, 1.5, 0.5, 0.5,
-3.533091, -2, -6.120605, 0, -0.5, 0.5, 0.5,
-3.533091, -2, -6.120605, 1, -0.5, 0.5, 0.5,
-3.533091, -2, -6.120605, 1, 1.5, 0.5, 0.5,
-3.533091, -2, -6.120605, 0, 1.5, 0.5, 0.5,
-3.533091, -1, -6.120605, 0, -0.5, 0.5, 0.5,
-3.533091, -1, -6.120605, 1, -0.5, 0.5, 0.5,
-3.533091, -1, -6.120605, 1, 1.5, 0.5, 0.5,
-3.533091, -1, -6.120605, 0, 1.5, 0.5, 0.5,
-3.533091, 0, -6.120605, 0, -0.5, 0.5, 0.5,
-3.533091, 0, -6.120605, 1, -0.5, 0.5, 0.5,
-3.533091, 0, -6.120605, 1, 1.5, 0.5, 0.5,
-3.533091, 0, -6.120605, 0, 1.5, 0.5, 0.5,
-3.533091, 1, -6.120605, 0, -0.5, 0.5, 0.5,
-3.533091, 1, -6.120605, 1, -0.5, 0.5, 0.5,
-3.533091, 1, -6.120605, 1, 1.5, 0.5, 0.5,
-3.533091, 1, -6.120605, 0, 1.5, 0.5, 0.5,
-3.533091, 2, -6.120605, 0, -0.5, 0.5, 0.5,
-3.533091, 2, -6.120605, 1, -0.5, 0.5, 0.5,
-3.533091, 2, -6.120605, 1, 1.5, 0.5, 0.5,
-3.533091, 2, -6.120605, 0, 1.5, 0.5, 0.5
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
-3.069869, -3.775028, -4,
-3.069869, -3.775028, 4,
-3.069869, -3.775028, -4,
-3.224276, -3.940575, -4,
-3.069869, -3.775028, -2,
-3.224276, -3.940575, -2,
-3.069869, -3.775028, 0,
-3.224276, -3.940575, 0,
-3.069869, -3.775028, 2,
-3.224276, -3.940575, 2,
-3.069869, -3.775028, 4,
-3.224276, -3.940575, 4
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
-3.533091, -4.271668, -4, 0, -0.5, 0.5, 0.5,
-3.533091, -4.271668, -4, 1, -0.5, 0.5, 0.5,
-3.533091, -4.271668, -4, 1, 1.5, 0.5, 0.5,
-3.533091, -4.271668, -4, 0, 1.5, 0.5, 0.5,
-3.533091, -4.271668, -2, 0, -0.5, 0.5, 0.5,
-3.533091, -4.271668, -2, 1, -0.5, 0.5, 0.5,
-3.533091, -4.271668, -2, 1, 1.5, 0.5, 0.5,
-3.533091, -4.271668, -2, 0, 1.5, 0.5, 0.5,
-3.533091, -4.271668, 0, 0, -0.5, 0.5, 0.5,
-3.533091, -4.271668, 0, 1, -0.5, 0.5, 0.5,
-3.533091, -4.271668, 0, 1, 1.5, 0.5, 0.5,
-3.533091, -4.271668, 0, 0, 1.5, 0.5, 0.5,
-3.533091, -4.271668, 2, 0, -0.5, 0.5, 0.5,
-3.533091, -4.271668, 2, 1, -0.5, 0.5, 0.5,
-3.533091, -4.271668, 2, 1, 1.5, 0.5, 0.5,
-3.533091, -4.271668, 2, 0, 1.5, 0.5, 0.5,
-3.533091, -4.271668, 4, 0, -0.5, 0.5, 0.5,
-3.533091, -4.271668, 4, 1, -0.5, 0.5, 0.5,
-3.533091, -4.271668, 4, 1, 1.5, 0.5, 0.5,
-3.533091, -4.271668, 4, 0, 1.5, 0.5, 0.5
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
-3.069869, -3.775028, -5.32175,
-3.069869, 2.846836, -5.32175,
-3.069869, -3.775028, 5.329647,
-3.069869, 2.846836, 5.329647,
-3.069869, -3.775028, -5.32175,
-3.069869, -3.775028, 5.329647,
-3.069869, 2.846836, -5.32175,
-3.069869, 2.846836, 5.329647,
-3.069869, -3.775028, -5.32175,
3.10643, -3.775028, -5.32175,
-3.069869, -3.775028, 5.329647,
3.10643, -3.775028, 5.329647,
-3.069869, 2.846836, -5.32175,
3.10643, 2.846836, -5.32175,
-3.069869, 2.846836, 5.329647,
3.10643, 2.846836, 5.329647,
3.10643, -3.775028, -5.32175,
3.10643, 2.846836, -5.32175,
3.10643, -3.775028, 5.329647,
3.10643, 2.846836, 5.329647,
3.10643, -3.775028, -5.32175,
3.10643, -3.775028, 5.329647,
3.10643, 2.846836, -5.32175,
3.10643, 2.846836, 5.329647
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
var radius = 7.465194;
var distance = 33.21349;
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
mvMatrix.translate( -0.01828051, 0.4640961, -0.003948212 );
mvMatrix.scale( 1.306853, 1.218919, 0.7577893 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.21349);
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
methyl_hydrogen_sulf<-read.table("methyl_hydrogen_sulf.xyz")
```

```
## Error in read.table("methyl_hydrogen_sulf.xyz"): no lines available in input
```

```r
x<-methyl_hydrogen_sulf$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_hydrogen_sulf' not found
```

```r
y<-methyl_hydrogen_sulf$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_hydrogen_sulf' not found
```

```r
z<-methyl_hydrogen_sulf$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_hydrogen_sulf' not found
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
-2.979923, -0.3595805, -0.5677546, 0, 0, 1, 1, 1,
-2.737314, -1.682766, -3.035881, 1, 0, 0, 1, 1,
-2.57815, -0.2092889, -1.512923, 1, 0, 0, 1, 1,
-2.544887, -0.2421455, -2.195816, 1, 0, 0, 1, 1,
-2.479597, 0.1012724, -4.208017, 1, 0, 0, 1, 1,
-2.472618, 0.2483269, -2.481303, 1, 0, 0, 1, 1,
-2.402446, 0.6113643, -0.6405351, 0, 0, 0, 1, 1,
-2.389703, -1.470099, -2.359895, 0, 0, 0, 1, 1,
-2.313014, -1.251325, -1.297313, 0, 0, 0, 1, 1,
-2.301326, -1.650616, -4.410174, 0, 0, 0, 1, 1,
-2.268678, 0.739475, -2.36548, 0, 0, 0, 1, 1,
-2.264342, -0.2845133, -0.8466917, 0, 0, 0, 1, 1,
-2.202203, -0.4435652, -2.168565, 0, 0, 0, 1, 1,
-2.155142, -0.5035428, -2.15066, 1, 1, 1, 1, 1,
-2.108231, -0.5355538, -1.200247, 1, 1, 1, 1, 1,
-2.104736, 0.175833, -2.267919, 1, 1, 1, 1, 1,
-2.09392, 0.03581247, -1.953041, 1, 1, 1, 1, 1,
-2.088718, -0.9574974, -1.570799, 1, 1, 1, 1, 1,
-2.06346, 0.204688, -1.143665, 1, 1, 1, 1, 1,
-2.056497, -0.08847962, -1.964354, 1, 1, 1, 1, 1,
-2.049746, -0.02833522, -2.559582, 1, 1, 1, 1, 1,
-2.019965, -0.5971276, -2.89142, 1, 1, 1, 1, 1,
-1.992815, -0.4014895, -1.157126, 1, 1, 1, 1, 1,
-1.991335, -1.220994, -1.604902, 1, 1, 1, 1, 1,
-1.978797, -1.181299, -2.801771, 1, 1, 1, 1, 1,
-1.968852, -0.7064404, -3.289793, 1, 1, 1, 1, 1,
-1.957871, -0.4519196, -0.3570946, 1, 1, 1, 1, 1,
-1.945137, 0.2791709, -0.501653, 1, 1, 1, 1, 1,
-1.937146, -1.787881, -3.828057, 0, 0, 1, 1, 1,
-1.930633, -0.562869, -1.140934, 1, 0, 0, 1, 1,
-1.927537, -3.404558, -2.482636, 1, 0, 0, 1, 1,
-1.918553, -1.40388, -2.284905, 1, 0, 0, 1, 1,
-1.911018, -0.5509331, 0.6194893, 1, 0, 0, 1, 1,
-1.895911, -1.463353, -2.561419, 1, 0, 0, 1, 1,
-1.877113, -1.32307, -3.022423, 0, 0, 0, 1, 1,
-1.867962, -0.669761, -2.243692, 0, 0, 0, 1, 1,
-1.863033, 0.2648534, -1.587344, 0, 0, 0, 1, 1,
-1.837294, -1.336107, -3.287778, 0, 0, 0, 1, 1,
-1.837064, -0.2596983, -0.4362301, 0, 0, 0, 1, 1,
-1.815407, 0.241143, -0.6181208, 0, 0, 0, 1, 1,
-1.795544, 0.6517349, -0.8385932, 0, 0, 0, 1, 1,
-1.773236, -1.822946, -3.576601, 1, 1, 1, 1, 1,
-1.76299, 1.719672, 0.3553911, 1, 1, 1, 1, 1,
-1.716168, -0.07362612, -0.8130417, 1, 1, 1, 1, 1,
-1.708028, -0.1061531, -1.770136, 1, 1, 1, 1, 1,
-1.672552, -1.709737, -4.056203, 1, 1, 1, 1, 1,
-1.667046, -1.031845, -3.632749, 1, 1, 1, 1, 1,
-1.666332, 1.781044, -0.4815345, 1, 1, 1, 1, 1,
-1.649359, -1.065332, -4.201275, 1, 1, 1, 1, 1,
-1.644585, 0.6963928, 0.3011493, 1, 1, 1, 1, 1,
-1.625892, -0.1211266, -3.437135, 1, 1, 1, 1, 1,
-1.620921, 1.951262, -1.945584, 1, 1, 1, 1, 1,
-1.614319, 0.5894532, -0.3144392, 1, 1, 1, 1, 1,
-1.602953, 1.087961, -1.963803, 1, 1, 1, 1, 1,
-1.579758, 0.4014635, -3.07832, 1, 1, 1, 1, 1,
-1.534385, -0.4159171, -2.086953, 1, 1, 1, 1, 1,
-1.507589, -0.6845529, -0.6988167, 0, 0, 1, 1, 1,
-1.49532, -2.374409, -3.824338, 1, 0, 0, 1, 1,
-1.495007, 1.556204, -1.345415, 1, 0, 0, 1, 1,
-1.487431, 0.0660713, -1.342309, 1, 0, 0, 1, 1,
-1.482101, 0.4351088, -0.6890321, 1, 0, 0, 1, 1,
-1.481119, -0.2521636, -0.9972845, 1, 0, 0, 1, 1,
-1.473926, -0.2456512, -1.133619, 0, 0, 0, 1, 1,
-1.467292, -0.7866935, -1.284735, 0, 0, 0, 1, 1,
-1.456602, -0.1151881, -2.25248, 0, 0, 0, 1, 1,
-1.446312, 0.6467552, 0.4279279, 0, 0, 0, 1, 1,
-1.445718, -0.04959046, -1.599916, 0, 0, 0, 1, 1,
-1.440262, -0.384478, -1.565882, 0, 0, 0, 1, 1,
-1.439961, -0.2300917, -3.195948, 0, 0, 0, 1, 1,
-1.439671, 0.6191448, -1.517933, 1, 1, 1, 1, 1,
-1.437126, -2.095167, -3.129132, 1, 1, 1, 1, 1,
-1.432995, -0.8261666, -1.211465, 1, 1, 1, 1, 1,
-1.432803, 0.9761534, -0.9468302, 1, 1, 1, 1, 1,
-1.432535, -0.1189432, -0.4643447, 1, 1, 1, 1, 1,
-1.41489, -1.716319, -0.834226, 1, 1, 1, 1, 1,
-1.407191, 0.2710626, -3.569301, 1, 1, 1, 1, 1,
-1.400325, -0.7440888, -1.706801, 1, 1, 1, 1, 1,
-1.394396, 0.1862301, -1.147125, 1, 1, 1, 1, 1,
-1.393143, 1.290613, 0.08002213, 1, 1, 1, 1, 1,
-1.378727, -2.345049, -2.369864, 1, 1, 1, 1, 1,
-1.374174, -0.1342531, -1.570336, 1, 1, 1, 1, 1,
-1.360932, -1.031478, -2.548095, 1, 1, 1, 1, 1,
-1.350202, -0.6372979, -2.844469, 1, 1, 1, 1, 1,
-1.346624, 0.3884336, 0.05470743, 1, 1, 1, 1, 1,
-1.342567, 2.261844, 0.7497976, 0, 0, 1, 1, 1,
-1.340657, 1.634961, -0.9864304, 1, 0, 0, 1, 1,
-1.319668, -1.907705, -1.105167, 1, 0, 0, 1, 1,
-1.31851, -0.8856621, -2.643682, 1, 0, 0, 1, 1,
-1.31425, 1.328537, 0.4699519, 1, 0, 0, 1, 1,
-1.313511, 0.5288065, -0.9452385, 1, 0, 0, 1, 1,
-1.30719, -0.273621, -1.970706, 0, 0, 0, 1, 1,
-1.300725, 0.8651274, -2.277885, 0, 0, 0, 1, 1,
-1.293385, 0.9514591, -0.4673077, 0, 0, 0, 1, 1,
-1.287819, -0.9521465, -3.408381, 0, 0, 0, 1, 1,
-1.283192, -0.2969049, -2.294343, 0, 0, 0, 1, 1,
-1.282409, 0.6846516, -0.9743425, 0, 0, 0, 1, 1,
-1.267602, -0.302864, -1.721426, 0, 0, 0, 1, 1,
-1.266302, 0.02419749, -1.110798, 1, 1, 1, 1, 1,
-1.261863, 0.01830659, 0.2735226, 1, 1, 1, 1, 1,
-1.237033, 0.4400475, -3.367894, 1, 1, 1, 1, 1,
-1.236151, -0.8707051, -1.925774, 1, 1, 1, 1, 1,
-1.234578, 0.6049346, -3.149351, 1, 1, 1, 1, 1,
-1.231204, -0.3065075, -3.974317, 1, 1, 1, 1, 1,
-1.228558, -0.6738781, -3.447045, 1, 1, 1, 1, 1,
-1.228495, 0.4923219, -0.5927322, 1, 1, 1, 1, 1,
-1.221136, -2.300773, -3.424511, 1, 1, 1, 1, 1,
-1.220289, 0.4030083, -0.8912359, 1, 1, 1, 1, 1,
-1.217541, 1.494017, -0.755757, 1, 1, 1, 1, 1,
-1.214016, 1.367119, -1.069137, 1, 1, 1, 1, 1,
-1.211774, -0.007471486, -1.045504, 1, 1, 1, 1, 1,
-1.2032, -0.6204833, -1.206743, 1, 1, 1, 1, 1,
-1.198143, 2.311623, -0.6945059, 1, 1, 1, 1, 1,
-1.161375, 1.550783, -1.375514, 0, 0, 1, 1, 1,
-1.160827, -0.4067163, -0.02670153, 1, 0, 0, 1, 1,
-1.158659, -0.5111923, -1.42205, 1, 0, 0, 1, 1,
-1.135488, 0.3974078, -2.135218, 1, 0, 0, 1, 1,
-1.133623, 0.8695405, -0.6633971, 1, 0, 0, 1, 1,
-1.130557, -0.8432603, -2.233964, 1, 0, 0, 1, 1,
-1.126924, 0.04849227, -1.598892, 0, 0, 0, 1, 1,
-1.110481, -0.5208743, 0.04263104, 0, 0, 0, 1, 1,
-1.106423, 0.615513, -1.967472, 0, 0, 0, 1, 1,
-1.104188, 0.1884648, -2.070369, 0, 0, 0, 1, 1,
-1.098539, 0.06135251, -2.26301, 0, 0, 0, 1, 1,
-1.09403, 1.446252, 1.314334, 0, 0, 0, 1, 1,
-1.089862, -0.3926313, -0.7169112, 0, 0, 0, 1, 1,
-1.083057, 0.0533609, -2.470593, 1, 1, 1, 1, 1,
-1.078505, -0.2191569, -1.909644, 1, 1, 1, 1, 1,
-1.07579, 0.695824, -1.722049, 1, 1, 1, 1, 1,
-1.066966, 0.1465814, -1.550856, 1, 1, 1, 1, 1,
-1.06563, 0.1341312, -0.1726382, 1, 1, 1, 1, 1,
-1.058809, 1.961369, 0.07690775, 1, 1, 1, 1, 1,
-1.057063, -0.5789322, -2.722862, 1, 1, 1, 1, 1,
-1.051817, -0.1485638, -1.537152, 1, 1, 1, 1, 1,
-1.051332, -0.6328104, -2.782746, 1, 1, 1, 1, 1,
-1.050383, 0.9649912, -1.941536, 1, 1, 1, 1, 1,
-1.049869, 1.237784, -0.655506, 1, 1, 1, 1, 1,
-1.041392, -0.03028684, -0.6638699, 1, 1, 1, 1, 1,
-1.040727, 0.7031808, -2.814781, 1, 1, 1, 1, 1,
-1.026378, 1.895424, -0.4932103, 1, 1, 1, 1, 1,
-1.026034, 0.5986451, -0.4580843, 1, 1, 1, 1, 1,
-1.025937, 0.8321486, -1.950503, 0, 0, 1, 1, 1,
-1.025276, 0.7006144, -2.101799, 1, 0, 0, 1, 1,
-1.019949, -1.44851, -2.566466, 1, 0, 0, 1, 1,
-1.016721, -0.3833641, -1.584812, 1, 0, 0, 1, 1,
-1.016665, 1.56805, -1.356493, 1, 0, 0, 1, 1,
-1.013806, 1.427036, -2.711872, 1, 0, 0, 1, 1,
-1.013209, 0.4116167, -1.273521, 0, 0, 0, 1, 1,
-1.011739, -0.3052543, -2.344149, 0, 0, 0, 1, 1,
-1.004718, -1.281255, -3.990217, 0, 0, 0, 1, 1,
-0.9997662, -1.076795, -2.454453, 0, 0, 0, 1, 1,
-0.9962527, -1.357727, -2.759843, 0, 0, 0, 1, 1,
-0.9947979, -1.412189, -3.802117, 0, 0, 0, 1, 1,
-0.9935193, -0.6075149, -2.281425, 0, 0, 0, 1, 1,
-0.9923481, 1.524022, -1.287066, 1, 1, 1, 1, 1,
-0.9919171, -1.995284, -1.590095, 1, 1, 1, 1, 1,
-0.9882798, -0.7424746, -1.772477, 1, 1, 1, 1, 1,
-0.9860826, -0.1826388, -0.7044318, 1, 1, 1, 1, 1,
-0.9851142, -2.141226, -3.240516, 1, 1, 1, 1, 1,
-0.9833786, 0.6023897, -0.9758192, 1, 1, 1, 1, 1,
-0.9823011, -0.2352627, -3.216806, 1, 1, 1, 1, 1,
-0.9773142, -0.6840186, -0.7886372, 1, 1, 1, 1, 1,
-0.9754853, 0.8974332, -2.470251, 1, 1, 1, 1, 1,
-0.9751337, 2.257923, -1.422636, 1, 1, 1, 1, 1,
-0.9696032, -1.418292, -1.012681, 1, 1, 1, 1, 1,
-0.9689336, -0.1526469, -3.285743, 1, 1, 1, 1, 1,
-0.9671246, 0.8993653, -1.113653, 1, 1, 1, 1, 1,
-0.9663542, 0.6011215, -1.058202, 1, 1, 1, 1, 1,
-0.9624625, 0.3025917, -1.278216, 1, 1, 1, 1, 1,
-0.961235, -1.059336, -1.136544, 0, 0, 1, 1, 1,
-0.9542518, 1.095967, -0.8790156, 1, 0, 0, 1, 1,
-0.9461924, 1.538209, -1.300301, 1, 0, 0, 1, 1,
-0.9381165, -0.5196649, -2.111004, 1, 0, 0, 1, 1,
-0.9375808, -1.005811, -3.334059, 1, 0, 0, 1, 1,
-0.9327869, 0.2786883, -1.643176, 1, 0, 0, 1, 1,
-0.9255973, 1.692389, -0.3340312, 0, 0, 0, 1, 1,
-0.9250415, 1.099961, -0.3029658, 0, 0, 0, 1, 1,
-0.916957, -0.5991977, -1.111206, 0, 0, 0, 1, 1,
-0.9162839, 1.956317, 0.6131482, 0, 0, 0, 1, 1,
-0.9103337, 1.349887, 0.5038223, 0, 0, 0, 1, 1,
-0.9091918, -1.099053, -2.781541, 0, 0, 0, 1, 1,
-0.908383, 0.8565857, -1.683463, 0, 0, 0, 1, 1,
-0.9070157, -1.042666, -4.408504, 1, 1, 1, 1, 1,
-0.9065533, 0.6270322, -1.862576, 1, 1, 1, 1, 1,
-0.902721, -1.225544, -0.8356192, 1, 1, 1, 1, 1,
-0.9027013, 0.3238896, -1.674902, 1, 1, 1, 1, 1,
-0.9010029, -1.224103, -2.324798, 1, 1, 1, 1, 1,
-0.894316, 0.3584372, 0.04539151, 1, 1, 1, 1, 1,
-0.8920957, -1.03286, -1.736299, 1, 1, 1, 1, 1,
-0.888379, -1.652585, -2.354666, 1, 1, 1, 1, 1,
-0.8866308, -0.3916812, -1.70371, 1, 1, 1, 1, 1,
-0.8847235, -1.695908, -1.979838, 1, 1, 1, 1, 1,
-0.8746567, -0.7652969, -3.798037, 1, 1, 1, 1, 1,
-0.8696787, 0.05176414, -1.823707, 1, 1, 1, 1, 1,
-0.8656558, -0.4018222, -0.6404399, 1, 1, 1, 1, 1,
-0.8568016, -1.847702, -3.078956, 1, 1, 1, 1, 1,
-0.8375807, 1.613263, -0.2115286, 1, 1, 1, 1, 1,
-0.8370187, 1.041715, 0.09728564, 0, 0, 1, 1, 1,
-0.8287797, -1.367957, -3.723873, 1, 0, 0, 1, 1,
-0.8256517, -0.1597326, -3.238997, 1, 0, 0, 1, 1,
-0.8254133, -0.01004783, 0.05137512, 1, 0, 0, 1, 1,
-0.8249371, 1.852239, 0.7787641, 1, 0, 0, 1, 1,
-0.8244653, 0.6784693, -1.590048, 1, 0, 0, 1, 1,
-0.8242669, -1.551597, -2.325621, 0, 0, 0, 1, 1,
-0.816418, -0.1398227, -3.682348, 0, 0, 0, 1, 1,
-0.8148008, -0.8063408, -1.787774, 0, 0, 0, 1, 1,
-0.8118019, -1.282162, -4.609526, 0, 0, 0, 1, 1,
-0.8096885, -0.2488665, -2.595518, 0, 0, 0, 1, 1,
-0.8096191, 0.01828464, -0.8525754, 0, 0, 0, 1, 1,
-0.8070178, -1.575361, -3.291897, 0, 0, 0, 1, 1,
-0.7994352, 1.388981, 0.3807436, 1, 1, 1, 1, 1,
-0.7935745, -1.010486, -3.286799, 1, 1, 1, 1, 1,
-0.7913649, -0.2237076, -0.2168079, 1, 1, 1, 1, 1,
-0.7895985, 1.417457, -1.541832, 1, 1, 1, 1, 1,
-0.7881016, -0.6273997, -1.766317, 1, 1, 1, 1, 1,
-0.7865782, -0.4770912, -3.105377, 1, 1, 1, 1, 1,
-0.785925, 0.8254017, -0.3249158, 1, 1, 1, 1, 1,
-0.7845065, 0.1841578, -0.6622069, 1, 1, 1, 1, 1,
-0.7814255, -0.250082, -1.616049, 1, 1, 1, 1, 1,
-0.78142, -0.3801404, -0.9238875, 1, 1, 1, 1, 1,
-0.7779369, -1.195324, -3.729531, 1, 1, 1, 1, 1,
-0.7770353, -0.3318807, -2.564895, 1, 1, 1, 1, 1,
-0.7716878, -0.3889959, -1.472708, 1, 1, 1, 1, 1,
-0.7599977, -0.198555, -0.2310988, 1, 1, 1, 1, 1,
-0.7586933, 0.4688691, -1.559958, 1, 1, 1, 1, 1,
-0.7574326, 1.381341, -0.03717943, 0, 0, 1, 1, 1,
-0.7563938, -0.1276906, -0.8456478, 1, 0, 0, 1, 1,
-0.7543144, -0.1357359, -0.2282477, 1, 0, 0, 1, 1,
-0.7512048, -1.632797, -1.499524, 1, 0, 0, 1, 1,
-0.7388316, 0.1484385, 0.3357816, 1, 0, 0, 1, 1,
-0.7268707, -0.5485139, -2.423559, 1, 0, 0, 1, 1,
-0.7247941, -0.3015284, 0.7241387, 0, 0, 0, 1, 1,
-0.7179937, 0.683997, 0.3466274, 0, 0, 0, 1, 1,
-0.717973, 2.298363, -0.1581846, 0, 0, 0, 1, 1,
-0.7159899, -1.123522, -3.399932, 0, 0, 0, 1, 1,
-0.7154979, -0.4464305, -2.741919, 0, 0, 0, 1, 1,
-0.7152126, -1.392012, -1.591673, 0, 0, 0, 1, 1,
-0.7141895, -0.05843282, -1.705445, 0, 0, 0, 1, 1,
-0.7125971, -0.3362368, -2.986058, 1, 1, 1, 1, 1,
-0.7115563, -1.538991, -1.942724, 1, 1, 1, 1, 1,
-0.7069532, 0.9755733, -0.3754205, 1, 1, 1, 1, 1,
-0.7038565, -1.570649, -3.422056, 1, 1, 1, 1, 1,
-0.701619, 0.2598814, -1.036472, 1, 1, 1, 1, 1,
-0.70161, -1.106457, -4.316861, 1, 1, 1, 1, 1,
-0.6984168, 0.350556, -1.227816, 1, 1, 1, 1, 1,
-0.696764, -0.5217759, -2.833791, 1, 1, 1, 1, 1,
-0.6903254, -0.3563997, -3.648112, 1, 1, 1, 1, 1,
-0.6777143, -0.2938079, -1.431411, 1, 1, 1, 1, 1,
-0.670718, 0.1429031, -0.5350062, 1, 1, 1, 1, 1,
-0.6701676, -1.428591, -2.183902, 1, 1, 1, 1, 1,
-0.6679998, 0.4664549, -0.9128126, 1, 1, 1, 1, 1,
-0.6626951, 0.146376, -1.847097, 1, 1, 1, 1, 1,
-0.6614838, 0.2821461, -3.560287, 1, 1, 1, 1, 1,
-0.660223, -0.5520654, -0.7640562, 0, 0, 1, 1, 1,
-0.6521144, -0.04322512, -1.760309, 1, 0, 0, 1, 1,
-0.64872, -0.1789807, -1.136882, 1, 0, 0, 1, 1,
-0.6475773, -0.2967347, -0.8287743, 1, 0, 0, 1, 1,
-0.6416603, -0.5267625, -0.002938363, 1, 0, 0, 1, 1,
-0.6391696, -0.0481738, -2.838075, 1, 0, 0, 1, 1,
-0.6372464, 1.251244, -1.222425, 0, 0, 0, 1, 1,
-0.6318394, 0.2838047, -1.786255, 0, 0, 0, 1, 1,
-0.6309772, 0.7516491, -1.78205, 0, 0, 0, 1, 1,
-0.6304535, 1.116519, -1.111836, 0, 0, 0, 1, 1,
-0.6281725, 0.522599, -0.01310129, 0, 0, 0, 1, 1,
-0.6279941, 0.00184699, -1.753938, 0, 0, 0, 1, 1,
-0.6278489, -0.2896306, -2.236919, 0, 0, 0, 1, 1,
-0.6201611, 1.612912, -1.862323, 1, 1, 1, 1, 1,
-0.6119242, -0.5956132, -0.8411372, 1, 1, 1, 1, 1,
-0.6088936, -0.07913116, -2.618835, 1, 1, 1, 1, 1,
-0.6082563, 1.596122, -0.996487, 1, 1, 1, 1, 1,
-0.6071364, 0.4156621, -0.7223644, 1, 1, 1, 1, 1,
-0.6018344, 0.07242402, -1.074429, 1, 1, 1, 1, 1,
-0.5993177, -1.153444, -2.59167, 1, 1, 1, 1, 1,
-0.5963944, -0.08381412, -1.176071, 1, 1, 1, 1, 1,
-0.5872521, 1.026505, -0.2046638, 1, 1, 1, 1, 1,
-0.5833672, -1.179879, -1.422694, 1, 1, 1, 1, 1,
-0.5798085, 0.2877135, -0.05671068, 1, 1, 1, 1, 1,
-0.5747671, 0.5137349, -1.38277, 1, 1, 1, 1, 1,
-0.5701266, -1.98723, -2.532563, 1, 1, 1, 1, 1,
-0.5692431, -0.2891468, -3.089032, 1, 1, 1, 1, 1,
-0.5686224, 0.109589, -0.04895183, 1, 1, 1, 1, 1,
-0.5635695, 0.1724711, -1.280632, 0, 0, 1, 1, 1,
-0.5584685, -1.888373, -3.943923, 1, 0, 0, 1, 1,
-0.556631, 1.906001, 0.4525078, 1, 0, 0, 1, 1,
-0.5553318, 1.238657, -1.823771, 1, 0, 0, 1, 1,
-0.5528998, -0.3431202, -2.215243, 1, 0, 0, 1, 1,
-0.5435207, -0.03523485, -0.7988685, 1, 0, 0, 1, 1,
-0.5413067, -1.353252, -4.215897, 0, 0, 0, 1, 1,
-0.5341885, 0.4742384, -2.3216, 0, 0, 0, 1, 1,
-0.5312233, 0.9301315, -0.3064658, 0, 0, 0, 1, 1,
-0.521322, 0.7310618, -0.3957081, 0, 0, 0, 1, 1,
-0.5186905, -2.214541, -2.522239, 0, 0, 0, 1, 1,
-0.5144099, 1.757474, -0.1728993, 0, 0, 0, 1, 1,
-0.5089572, 0.4433506, 0.8559033, 0, 0, 0, 1, 1,
-0.5061343, -0.7053427, -3.05558, 1, 1, 1, 1, 1,
-0.5056564, -0.508939, -1.509535, 1, 1, 1, 1, 1,
-0.5032075, -1.078395, -1.882789, 1, 1, 1, 1, 1,
-0.4955231, -2.598708, -3.507265, 1, 1, 1, 1, 1,
-0.4955024, 0.6297305, -1.221679, 1, 1, 1, 1, 1,
-0.4918748, 1.761068, -1.937066, 1, 1, 1, 1, 1,
-0.4899337, 0.2830951, -2.212411, 1, 1, 1, 1, 1,
-0.4775449, -1.208545, -2.624984, 1, 1, 1, 1, 1,
-0.4687189, -0.254605, -2.883033, 1, 1, 1, 1, 1,
-0.4640147, -2.147201, -1.718807, 1, 1, 1, 1, 1,
-0.4629463, -0.05931178, -0.8754215, 1, 1, 1, 1, 1,
-0.461663, 1.994774, 0.08256579, 1, 1, 1, 1, 1,
-0.4612521, 0.0873057, -2.011136, 1, 1, 1, 1, 1,
-0.4549999, 0.4360953, -0.7150472, 1, 1, 1, 1, 1,
-0.4453261, -0.06523088, -1.342402, 1, 1, 1, 1, 1,
-0.4403313, -1.381164, -3.443581, 0, 0, 1, 1, 1,
-0.4354578, -0.4821502, -2.370189, 1, 0, 0, 1, 1,
-0.430475, -0.09668352, -3.49616, 1, 0, 0, 1, 1,
-0.4296573, 1.526323, 0.8830867, 1, 0, 0, 1, 1,
-0.4255524, 2.140271, -1.070678, 1, 0, 0, 1, 1,
-0.4167316, 0.08691146, -0.7484719, 1, 0, 0, 1, 1,
-0.413912, 1.255241, 1.218824, 0, 0, 0, 1, 1,
-0.4120867, -0.5011289, -2.86491, 0, 0, 0, 1, 1,
-0.4117965, -0.8769714, -2.511375, 0, 0, 0, 1, 1,
-0.4091485, -1.169087, -1.636848, 0, 0, 0, 1, 1,
-0.4078, 0.5764905, -0.3004031, 0, 0, 0, 1, 1,
-0.4072981, 0.4824772, -1.155055, 0, 0, 0, 1, 1,
-0.4058147, -0.5850202, -4.175088, 0, 0, 0, 1, 1,
-0.396029, -0.03448616, -2.349037, 1, 1, 1, 1, 1,
-0.3860644, 1.452335, -1.370849, 1, 1, 1, 1, 1,
-0.383719, 0.8893067, -1.223504, 1, 1, 1, 1, 1,
-0.3825896, 0.5561665, -1.830869, 1, 1, 1, 1, 1,
-0.3778253, 0.4499389, -1.014745, 1, 1, 1, 1, 1,
-0.3777629, 0.9329138, 0.3628837, 1, 1, 1, 1, 1,
-0.3695446, -0.4715745, -3.87265, 1, 1, 1, 1, 1,
-0.3684472, -1.187824, -4.402971, 1, 1, 1, 1, 1,
-0.3636765, -0.09492764, -2.615985, 1, 1, 1, 1, 1,
-0.3609198, 1.402719, 0.5873153, 1, 1, 1, 1, 1,
-0.3600203, 1.543913, -0.01054212, 1, 1, 1, 1, 1,
-0.3587622, 0.09957551, -0.5435653, 1, 1, 1, 1, 1,
-0.3586607, -0.1950288, -2.534549, 1, 1, 1, 1, 1,
-0.3564236, 0.2198453, -1.879052, 1, 1, 1, 1, 1,
-0.3505731, -0.5337459, -3.026499, 1, 1, 1, 1, 1,
-0.3504052, 0.358944, -2.407007, 0, 0, 1, 1, 1,
-0.3421678, -0.01996655, -1.743592, 1, 0, 0, 1, 1,
-0.3393584, 0.4375215, -0.6961601, 1, 0, 0, 1, 1,
-0.3386691, 0.6919519, -2.462655, 1, 0, 0, 1, 1,
-0.3206276, 1.021125, 1.794653, 1, 0, 0, 1, 1,
-0.3131217, 1.310556, -0.4424351, 1, 0, 0, 1, 1,
-0.3111128, 0.2175572, 0.104168, 0, 0, 0, 1, 1,
-0.3084116, 1.141174, 0.5162393, 0, 0, 0, 1, 1,
-0.3081259, -1.018944, -1.237313, 0, 0, 0, 1, 1,
-0.3080998, -1.278996, -5.166633, 0, 0, 0, 1, 1,
-0.3079918, 0.6573393, -0.02761164, 0, 0, 0, 1, 1,
-0.3053132, -0.6544465, -1.605641, 0, 0, 0, 1, 1,
-0.3015656, -0.5807034, -4.8692, 0, 0, 0, 1, 1,
-0.3004526, 0.1029081, -1.135612, 1, 1, 1, 1, 1,
-0.2948622, 0.4705915, -1.002759, 1, 1, 1, 1, 1,
-0.2749318, -0.9142246, -1.77635, 1, 1, 1, 1, 1,
-0.2730007, -0.2699084, -1.361734, 1, 1, 1, 1, 1,
-0.2704939, -0.5500196, -2.797923, 1, 1, 1, 1, 1,
-0.2694022, 1.249764, 1.002503, 1, 1, 1, 1, 1,
-0.2652892, 0.3161962, -0.6882303, 1, 1, 1, 1, 1,
-0.265171, 0.8232184, -0.7120394, 1, 1, 1, 1, 1,
-0.2595179, 0.1257552, -2.489651, 1, 1, 1, 1, 1,
-0.2561099, -1.665384, -4.690531, 1, 1, 1, 1, 1,
-0.2540399, -1.087398, -3.555389, 1, 1, 1, 1, 1,
-0.2533997, -0.3688225, -2.827348, 1, 1, 1, 1, 1,
-0.2515815, 0.123943, -0.6081305, 1, 1, 1, 1, 1,
-0.2491349, 0.2426114, -2.118004, 1, 1, 1, 1, 1,
-0.2485751, 1.148186, -1.645334, 1, 1, 1, 1, 1,
-0.2458375, 1.990107, -0.7595621, 0, 0, 1, 1, 1,
-0.2427984, -0.2470771, -3.102264, 1, 0, 0, 1, 1,
-0.2420739, 0.5816727, 0.002550524, 1, 0, 0, 1, 1,
-0.2408003, -1.415778, -3.4811, 1, 0, 0, 1, 1,
-0.2399269, -0.7169125, -2.943785, 1, 0, 0, 1, 1,
-0.2383663, -0.3991388, -1.089146, 1, 0, 0, 1, 1,
-0.2369805, 0.8254859, -0.6329764, 0, 0, 0, 1, 1,
-0.2354789, -1.773522, -3.575288, 0, 0, 0, 1, 1,
-0.2295882, 0.6064438, 0.3893603, 0, 0, 0, 1, 1,
-0.2282266, -1.021446, -2.146228, 0, 0, 0, 1, 1,
-0.2280463, 0.5615024, 0.3484249, 0, 0, 0, 1, 1,
-0.2278916, 0.9728374, -0.3065282, 0, 0, 0, 1, 1,
-0.2185705, -1.303367, -3.846106, 0, 0, 0, 1, 1,
-0.2139213, 0.3500098, 0.2320472, 1, 1, 1, 1, 1,
-0.2127364, -0.6646166, -4.292586, 1, 1, 1, 1, 1,
-0.210311, 0.05740257, -1.062309, 1, 1, 1, 1, 1,
-0.205687, -0.172265, -2.285341, 1, 1, 1, 1, 1,
-0.2054064, 0.4036511, -0.5115414, 1, 1, 1, 1, 1,
-0.2030834, 0.1254842, -0.9273508, 1, 1, 1, 1, 1,
-0.2030613, -0.7028174, -1.5571, 1, 1, 1, 1, 1,
-0.2028709, -1.947687, -3.283304, 1, 1, 1, 1, 1,
-0.200242, 0.1900915, 1.702351, 1, 1, 1, 1, 1,
-0.1963, -0.9395449, -3.810906, 1, 1, 1, 1, 1,
-0.1934714, 0.9249187, 0.5282555, 1, 1, 1, 1, 1,
-0.1933231, 0.5800742, 0.1862502, 1, 1, 1, 1, 1,
-0.1921632, 1.832244, 0.1931307, 1, 1, 1, 1, 1,
-0.1836483, -0.7302743, -3.527817, 1, 1, 1, 1, 1,
-0.1828153, -0.105508, -1.983831, 1, 1, 1, 1, 1,
-0.1804989, 0.6950831, -0.5802012, 0, 0, 1, 1, 1,
-0.177908, -0.004705844, -2.018061, 1, 0, 0, 1, 1,
-0.1777051, -0.05162534, -3.799412, 1, 0, 0, 1, 1,
-0.1716484, 0.7348645, 1.845283, 1, 0, 0, 1, 1,
-0.1713627, 1.021638, -1.079692, 1, 0, 0, 1, 1,
-0.1681399, 1.692158, 0.443601, 1, 0, 0, 1, 1,
-0.1679758, 1.730374, 0.8446388, 0, 0, 0, 1, 1,
-0.1654586, 0.5516078, -1.509287, 0, 0, 0, 1, 1,
-0.1613574, 0.7268223, 1.496887, 0, 0, 0, 1, 1,
-0.1574422, 1.095118, -0.06703324, 0, 0, 0, 1, 1,
-0.1569205, 0.06203111, -0.61935, 0, 0, 0, 1, 1,
-0.1566678, 0.5557796, -0.5310566, 0, 0, 0, 1, 1,
-0.1544006, -0.5308131, -1.231423, 0, 0, 0, 1, 1,
-0.1521901, -2.198579, -1.710798, 1, 1, 1, 1, 1,
-0.1509939, -0.4332083, -2.355081, 1, 1, 1, 1, 1,
-0.1487345, -0.6398686, -2.842204, 1, 1, 1, 1, 1,
-0.1457635, 1.549582, 0.1512091, 1, 1, 1, 1, 1,
-0.1437, -1.052076, -1.617908, 1, 1, 1, 1, 1,
-0.1434618, -1.249861, -3.014516, 1, 1, 1, 1, 1,
-0.1416719, 1.743818, 0.4091995, 1, 1, 1, 1, 1,
-0.1408935, -0.8968067, -3.616533, 1, 1, 1, 1, 1,
-0.139099, 1.112264, 3.048443, 1, 1, 1, 1, 1,
-0.1349048, -1.894446, -2.765509, 1, 1, 1, 1, 1,
-0.1337612, 0.1708895, -1.032542, 1, 1, 1, 1, 1,
-0.1334772, -1.666927, -2.29364, 1, 1, 1, 1, 1,
-0.1322132, -0.1829507, -3.459334, 1, 1, 1, 1, 1,
-0.12761, 0.3932016, 0.1698575, 1, 1, 1, 1, 1,
-0.126951, -0.3630818, -4.614471, 1, 1, 1, 1, 1,
-0.1259027, 1.278974, -0.3514102, 0, 0, 1, 1, 1,
-0.1241709, -0.4429431, -3.366559, 1, 0, 0, 1, 1,
-0.1219499, 0.6349758, -0.5900835, 1, 0, 0, 1, 1,
-0.1202687, 0.02860998, -1.567241, 1, 0, 0, 1, 1,
-0.1197268, -0.6345621, -2.019778, 1, 0, 0, 1, 1,
-0.1191454, -1.179332, -2.679536, 1, 0, 0, 1, 1,
-0.1186421, -1.008068, -2.517024, 0, 0, 0, 1, 1,
-0.1165523, -0.7743835, -1.608855, 0, 0, 0, 1, 1,
-0.1137358, -1.504735, -3.675549, 0, 0, 0, 1, 1,
-0.1125142, 1.105503, -0.2562546, 0, 0, 0, 1, 1,
-0.110973, 1.29073, -1.341392, 0, 0, 0, 1, 1,
-0.1105638, -1.645279, -3.359774, 0, 0, 0, 1, 1,
-0.1068188, 1.062471, -0.5281885, 0, 0, 0, 1, 1,
-0.1027059, 0.06103392, -1.40974, 1, 1, 1, 1, 1,
-0.1009668, -0.003857179, -0.8361716, 1, 1, 1, 1, 1,
-0.09859807, -1.216631, -4.421277, 1, 1, 1, 1, 1,
-0.09480863, 1.661355, -0.488963, 1, 1, 1, 1, 1,
-0.08984816, -1.551115, -2.713473, 1, 1, 1, 1, 1,
-0.08726511, 0.3921994, -0.8117346, 1, 1, 1, 1, 1,
-0.08530929, -1.199115, -2.344851, 1, 1, 1, 1, 1,
-0.08466001, 1.52544, -0.8456053, 1, 1, 1, 1, 1,
-0.08414523, -0.4086557, -2.746572, 1, 1, 1, 1, 1,
-0.08279183, -0.5244331, -2.571775, 1, 1, 1, 1, 1,
-0.08107067, 0.04734729, -1.66981, 1, 1, 1, 1, 1,
-0.08025416, -1.230788, -3.66738, 1, 1, 1, 1, 1,
-0.07937583, 1.52913, -0.01985485, 1, 1, 1, 1, 1,
-0.0770267, 0.9121659, 0.3159433, 1, 1, 1, 1, 1,
-0.07023074, -2.3184, -1.724254, 1, 1, 1, 1, 1,
-0.06769913, -0.7983019, -4.395389, 0, 0, 1, 1, 1,
-0.06758916, -1.302099, -1.487556, 1, 0, 0, 1, 1,
-0.06722702, 0.4374979, -1.025701, 1, 0, 0, 1, 1,
-0.06016499, -0.8180047, -1.049755, 1, 0, 0, 1, 1,
-0.05965735, 1.04065, -1.464731, 1, 0, 0, 1, 1,
-0.05616088, -0.8920104, -2.660926, 1, 0, 0, 1, 1,
-0.05348917, -0.2540927, -3.954771, 0, 0, 0, 1, 1,
-0.05225639, 1.08575, -0.5562501, 0, 0, 0, 1, 1,
-0.04920312, 0.8388411, -1.490474, 0, 0, 0, 1, 1,
-0.04332614, -0.1670258, -2.462922, 0, 0, 0, 1, 1,
-0.03699948, 0.4279474, -1.009751, 0, 0, 0, 1, 1,
-0.03665605, -1.259107, -1.796993, 0, 0, 0, 1, 1,
-0.03603258, -0.7262281, -2.456635, 0, 0, 0, 1, 1,
-0.03399765, 0.2235151, 2.199232, 1, 1, 1, 1, 1,
-0.02896168, -1.019565, -2.072739, 1, 1, 1, 1, 1,
-0.02890907, -1.2327, -1.212431, 1, 1, 1, 1, 1,
-0.02749704, -0.909011, -2.363504, 1, 1, 1, 1, 1,
-0.021639, 0.6079745, 0.7354078, 1, 1, 1, 1, 1,
-0.01745507, -0.5631877, -3.684557, 1, 1, 1, 1, 1,
-0.0159544, 1.562033, 0.5332813, 1, 1, 1, 1, 1,
-0.01563019, 0.07190882, -0.7651889, 1, 1, 1, 1, 1,
-0.0148433, 0.802088, -1.053001, 1, 1, 1, 1, 1,
-0.01376568, -0.3329497, -4.697122, 1, 1, 1, 1, 1,
-0.01047263, 0.6084796, 1.149599, 1, 1, 1, 1, 1,
-0.01015919, -0.855049, -2.452978, 1, 1, 1, 1, 1,
-0.009554953, 0.9246663, 0.8513662, 1, 1, 1, 1, 1,
-0.007735861, -0.07809708, -2.167582, 1, 1, 1, 1, 1,
-0.006879624, -0.02416545, -2.963737, 1, 1, 1, 1, 1,
-0.004631269, 0.3573838, -0.4503972, 0, 0, 1, 1, 1,
-0.001523524, 1.944271, -0.03299563, 1, 0, 0, 1, 1,
-0.001163002, 1.361947, -1.322807, 1, 0, 0, 1, 1,
-0.0006129919, -0.7540348, -3.310719, 1, 0, 0, 1, 1,
0.003668061, -1.086897, 4.057678, 1, 0, 0, 1, 1,
0.004543663, 0.712731, 0.3746996, 1, 0, 0, 1, 1,
0.006235152, 0.9227882, -0.7841909, 0, 0, 0, 1, 1,
0.006311965, 0.05832918, 0.6910944, 0, 0, 0, 1, 1,
0.006877546, 0.1240612, -0.4771486, 0, 0, 0, 1, 1,
0.007183313, -0.7383227, 1.778477, 0, 0, 0, 1, 1,
0.007309291, 0.1084683, 0.5728289, 0, 0, 0, 1, 1,
0.008685909, 1.031015, 0.6208335, 0, 0, 0, 1, 1,
0.009116611, -2.100143, 4.053441, 0, 0, 0, 1, 1,
0.009495069, -0.6736348, 4.187712, 1, 1, 1, 1, 1,
0.01341315, 0.3969813, -0.4102925, 1, 1, 1, 1, 1,
0.01711763, -0.9156867, 2.936544, 1, 1, 1, 1, 1,
0.01775033, 0.4673382, -0.2890963, 1, 1, 1, 1, 1,
0.01842905, -0.7975828, 2.267839, 1, 1, 1, 1, 1,
0.01876155, -2.755043, 2.749518, 1, 1, 1, 1, 1,
0.01891882, -0.9275628, 3.37018, 1, 1, 1, 1, 1,
0.01953878, -2.84266, 3.168756, 1, 1, 1, 1, 1,
0.0227705, -1.942639, 1.92946, 1, 1, 1, 1, 1,
0.02278377, 1.142631, -0.3993525, 1, 1, 1, 1, 1,
0.025389, -1.822554, 1.418302, 1, 1, 1, 1, 1,
0.02984297, 0.5028611, 0.4868676, 1, 1, 1, 1, 1,
0.03030724, -2.119384, 3.838145, 1, 1, 1, 1, 1,
0.03246583, 1.830252, -0.4962691, 1, 1, 1, 1, 1,
0.03449264, -0.9227053, 2.076516, 1, 1, 1, 1, 1,
0.03941616, -0.2640096, 3.922406, 0, 0, 1, 1, 1,
0.04058846, -0.6136221, 2.958428, 1, 0, 0, 1, 1,
0.04506801, -0.3188591, 2.214385, 1, 0, 0, 1, 1,
0.04887291, 0.1831002, -0.9027475, 1, 0, 0, 1, 1,
0.0494797, -1.624349, 3.111623, 1, 0, 0, 1, 1,
0.05101292, 1.566496, 0.9381199, 1, 0, 0, 1, 1,
0.05113905, 2.294698, 1.256722, 0, 0, 0, 1, 1,
0.05284406, 0.2681266, 1.544528, 0, 0, 0, 1, 1,
0.06377328, -0.06873948, 2.075614, 0, 0, 0, 1, 1,
0.06408226, 0.09548298, 1.070302, 0, 0, 0, 1, 1,
0.06642947, 0.2362591, 0.8158637, 0, 0, 0, 1, 1,
0.07293595, 1.465006, 0.05173962, 0, 0, 0, 1, 1,
0.07293742, -1.289667, 5.174529, 0, 0, 0, 1, 1,
0.07645038, 0.8762593, 0.3018596, 1, 1, 1, 1, 1,
0.08126923, 0.2103148, 0.5214811, 1, 1, 1, 1, 1,
0.08134673, 1.08097, -0.9058307, 1, 1, 1, 1, 1,
0.08520789, 0.3493811, 0.3515523, 1, 1, 1, 1, 1,
0.08601463, 0.2189033, 1.020731, 1, 1, 1, 1, 1,
0.08879056, -0.90554, 2.865575, 1, 1, 1, 1, 1,
0.09286168, 0.1626103, -1.094179, 1, 1, 1, 1, 1,
0.09485326, -1.194283, 2.319582, 1, 1, 1, 1, 1,
0.09645219, 0.3373155, -0.9316583, 1, 1, 1, 1, 1,
0.1000906, 0.116529, -0.3924281, 1, 1, 1, 1, 1,
0.1036201, 1.720481, -0.174032, 1, 1, 1, 1, 1,
0.107448, 0.04082659, 1.011405, 1, 1, 1, 1, 1,
0.1087405, -1.956963, 3.620934, 1, 1, 1, 1, 1,
0.1107329, 0.8659551, 0.5567045, 1, 1, 1, 1, 1,
0.1155907, 1.48977, 0.3363064, 1, 1, 1, 1, 1,
0.1219719, 0.3447777, 1.243684, 0, 0, 1, 1, 1,
0.1225131, 0.2544767, 0.48258, 1, 0, 0, 1, 1,
0.1234707, -0.3220176, 3.198291, 1, 0, 0, 1, 1,
0.1237866, -1.143845, 3.191124, 1, 0, 0, 1, 1,
0.1245214, 0.06146173, 1.291747, 1, 0, 0, 1, 1,
0.1253522, -0.07238644, 2.752267, 1, 0, 0, 1, 1,
0.1262267, 1.974337, -0.3904387, 0, 0, 0, 1, 1,
0.1297664, 0.9128965, 1.200676, 0, 0, 0, 1, 1,
0.1346857, -1.319304, 3.07813, 0, 0, 0, 1, 1,
0.1346899, -0.899218, 2.38426, 0, 0, 0, 1, 1,
0.1377435, 0.5236234, -0.7298496, 0, 0, 0, 1, 1,
0.1403241, -0.4412308, 3.708364, 0, 0, 0, 1, 1,
0.1413939, 1.343149, 0.5250614, 0, 0, 0, 1, 1,
0.1419175, -1.489842, 2.101668, 1, 1, 1, 1, 1,
0.1445588, -2.605123, 3.042023, 1, 1, 1, 1, 1,
0.1468249, -0.3247368, 2.732634, 1, 1, 1, 1, 1,
0.1473963, 1.073401, 0.6264886, 1, 1, 1, 1, 1,
0.1508364, 1.64994, -0.306801, 1, 1, 1, 1, 1,
0.1513025, 0.3733641, 1.443199, 1, 1, 1, 1, 1,
0.1514838, -0.8370365, 3.58634, 1, 1, 1, 1, 1,
0.1523671, 1.281947, -0.03356501, 1, 1, 1, 1, 1,
0.1526576, -0.5775709, 1.562974, 1, 1, 1, 1, 1,
0.1527507, -1.254365, 3.134959, 1, 1, 1, 1, 1,
0.1535307, 2.041824, -0.04645311, 1, 1, 1, 1, 1,
0.1563692, 2.115616, 1.120721, 1, 1, 1, 1, 1,
0.1604619, -1.363371, 4.902256, 1, 1, 1, 1, 1,
0.1616163, -1.037004, 3.714384, 1, 1, 1, 1, 1,
0.1707494, -1.045964, 1.251319, 1, 1, 1, 1, 1,
0.1831028, -2.419763, 2.46763, 0, 0, 1, 1, 1,
0.1852633, 0.5061462, 1.510003, 1, 0, 0, 1, 1,
0.1864139, 0.04239324, 0.6162048, 1, 0, 0, 1, 1,
0.1872385, 0.5186952, -0.404028, 1, 0, 0, 1, 1,
0.1876975, -0.4411108, 4.891638, 1, 0, 0, 1, 1,
0.1887771, -0.7694935, 3.702009, 1, 0, 0, 1, 1,
0.1892509, -0.6207141, 3.627544, 0, 0, 0, 1, 1,
0.1909409, 1.316194, -0.6682585, 0, 0, 0, 1, 1,
0.1967129, -1.542719, 4.773747, 0, 0, 0, 1, 1,
0.1983288, -0.05958455, 1.398537, 0, 0, 0, 1, 1,
0.198347, -1.866939, 2.755321, 0, 0, 0, 1, 1,
0.1986553, -0.06407087, 2.294734, 0, 0, 0, 1, 1,
0.1988082, 0.01589576, 1.761654, 0, 0, 0, 1, 1,
0.2005795, 0.05089676, 1.813975, 1, 1, 1, 1, 1,
0.201377, 0.2913208, 2.425992, 1, 1, 1, 1, 1,
0.2050611, -2.302809, 3.341535, 1, 1, 1, 1, 1,
0.2079989, 1.361272, -0.5021896, 1, 1, 1, 1, 1,
0.2118248, 0.829069, 0.892865, 1, 1, 1, 1, 1,
0.2154373, -0.6336527, 3.05454, 1, 1, 1, 1, 1,
0.2209387, -0.6419694, 2.643567, 1, 1, 1, 1, 1,
0.2239124, -1.123148, 5.040828, 1, 1, 1, 1, 1,
0.2297985, -1.610776, 3.003213, 1, 1, 1, 1, 1,
0.2298147, 0.1705085, 1.23876, 1, 1, 1, 1, 1,
0.2381529, 0.77621, 0.5693833, 1, 1, 1, 1, 1,
0.2469172, -0.4642284, 3.62447, 1, 1, 1, 1, 1,
0.2477284, -0.349113, 2.17224, 1, 1, 1, 1, 1,
0.252439, 1.716637, -0.3661171, 1, 1, 1, 1, 1,
0.2587862, 2.377485, 1.700094, 1, 1, 1, 1, 1,
0.2589859, 0.5799813, 0.1293878, 0, 0, 1, 1, 1,
0.2590175, -0.1374337, 3.144552, 1, 0, 0, 1, 1,
0.2599533, -1.281013, 4.527187, 1, 0, 0, 1, 1,
0.2706362, 0.8840635, -0.03306784, 1, 0, 0, 1, 1,
0.2718707, 0.1741336, 1.814264, 1, 0, 0, 1, 1,
0.2754102, -0.02070167, 2.65668, 1, 0, 0, 1, 1,
0.2765558, -2.438003, 4.811413, 0, 0, 0, 1, 1,
0.2907757, -0.6534108, 3.927741, 0, 0, 0, 1, 1,
0.294035, -0.0287643, 0.290376, 0, 0, 0, 1, 1,
0.2985204, -1.516458, 3.923375, 0, 0, 0, 1, 1,
0.2992569, -1.443526, 3.966432, 0, 0, 0, 1, 1,
0.2998192, -0.4397987, 1.747499, 0, 0, 0, 1, 1,
0.301244, 2.474455, -0.822368, 0, 0, 0, 1, 1,
0.3017677, -0.4951899, 2.27265, 1, 1, 1, 1, 1,
0.3061478, -1.252855, 4.479895, 1, 1, 1, 1, 1,
0.3086249, 0.1225321, 0.3176101, 1, 1, 1, 1, 1,
0.3095482, -1.312303, 1.929301, 1, 1, 1, 1, 1,
0.3122139, 0.5403384, -0.2841754, 1, 1, 1, 1, 1,
0.3155401, -0.2400575, 2.041616, 1, 1, 1, 1, 1,
0.317051, 1.406543, 0.4784673, 1, 1, 1, 1, 1,
0.3200594, -1.058634, 2.542574, 1, 1, 1, 1, 1,
0.3206634, 0.459468, 0.4590813, 1, 1, 1, 1, 1,
0.3209291, 2.254023, 1.016611, 1, 1, 1, 1, 1,
0.3222303, 0.06599189, 0.8166083, 1, 1, 1, 1, 1,
0.3229911, 1.752633, 0.1194563, 1, 1, 1, 1, 1,
0.3236735, -1.560942, 3.797231, 1, 1, 1, 1, 1,
0.3252473, 0.4002315, 1.386001, 1, 1, 1, 1, 1,
0.3405475, 1.303421, 0.7573193, 1, 1, 1, 1, 1,
0.3439711, -1.152729, 1.143735, 0, 0, 1, 1, 1,
0.3453738, 1.332635, 1.974869, 1, 0, 0, 1, 1,
0.3463572, -1.990583, 3.355106, 1, 0, 0, 1, 1,
0.3464982, 0.3473333, 0.110337, 1, 0, 0, 1, 1,
0.3526157, 0.4754311, 0.01634708, 1, 0, 0, 1, 1,
0.3546128, 0.3324207, 0.8912132, 1, 0, 0, 1, 1,
0.3579215, -1.046509, 4.04774, 0, 0, 0, 1, 1,
0.3593723, 0.7845182, -0.05855849, 0, 0, 0, 1, 1,
0.3600037, 1.047199, 0.7190295, 0, 0, 0, 1, 1,
0.3606084, 1.043385, -0.2545585, 0, 0, 0, 1, 1,
0.3616026, -0.2812768, 3.508156, 0, 0, 0, 1, 1,
0.3699227, -0.553719, 2.074212, 0, 0, 0, 1, 1,
0.3703662, -0.1936723, 4.057123, 0, 0, 0, 1, 1,
0.370389, -0.9608954, 3.415744, 1, 1, 1, 1, 1,
0.3713582, 1.145621, -0.1570219, 1, 1, 1, 1, 1,
0.3717122, -1.64705, 2.958221, 1, 1, 1, 1, 1,
0.3726268, -1.484874, 2.914497, 1, 1, 1, 1, 1,
0.3737693, 0.3727491, 0.6471894, 1, 1, 1, 1, 1,
0.3783708, -0.7268926, 2.809265, 1, 1, 1, 1, 1,
0.3791863, 0.09231581, 0.4591283, 1, 1, 1, 1, 1,
0.3877812, 1.998244, 0.2223454, 1, 1, 1, 1, 1,
0.3886794, 0.3124258, 1.796708, 1, 1, 1, 1, 1,
0.3934155, -0.8397487, 3.612171, 1, 1, 1, 1, 1,
0.4148982, -0.04921456, 3.06531, 1, 1, 1, 1, 1,
0.4168071, -0.5019435, 3.273464, 1, 1, 1, 1, 1,
0.4177617, -0.3206126, 2.189575, 1, 1, 1, 1, 1,
0.4241295, 0.4920958, -0.08946853, 1, 1, 1, 1, 1,
0.4249132, -0.7661186, 2.510355, 1, 1, 1, 1, 1,
0.425364, 0.9365599, 0.5616271, 0, 0, 1, 1, 1,
0.4374098, 0.2048317, 2.109084, 1, 0, 0, 1, 1,
0.4393492, 0.06052006, 0.5878517, 1, 0, 0, 1, 1,
0.4397702, 0.7522371, 2.05661, 1, 0, 0, 1, 1,
0.4400056, -1.055253, 2.568216, 1, 0, 0, 1, 1,
0.4472239, -0.6710061, 3.663689, 1, 0, 0, 1, 1,
0.4475281, -0.5084052, 3.20063, 0, 0, 0, 1, 1,
0.4524317, -0.2530746, 2.056378, 0, 0, 0, 1, 1,
0.4525595, -0.7912321, 0.9912534, 0, 0, 0, 1, 1,
0.4601239, -0.4354765, 1.627312, 0, 0, 0, 1, 1,
0.4614487, -0.967296, 2.790815, 0, 0, 0, 1, 1,
0.4620724, 0.2057354, 1.200737, 0, 0, 0, 1, 1,
0.4663523, -0.6329635, 4.877727, 0, 0, 0, 1, 1,
0.4666226, 0.07956223, 0.1965852, 1, 1, 1, 1, 1,
0.4673485, -0.4879875, 2.389324, 1, 1, 1, 1, 1,
0.4687173, 0.2189959, 1.245217, 1, 1, 1, 1, 1,
0.4720104, -0.7112312, 4.427672, 1, 1, 1, 1, 1,
0.481859, 0.4538539, 0.2573888, 1, 1, 1, 1, 1,
0.4829808, 0.1549899, 1.118766, 1, 1, 1, 1, 1,
0.484317, 0.3470474, 0.2398144, 1, 1, 1, 1, 1,
0.4858917, 0.9042102, -0.2660848, 1, 1, 1, 1, 1,
0.4885256, 0.3011464, 1.299829, 1, 1, 1, 1, 1,
0.4886474, -0.4677308, 1.656831, 1, 1, 1, 1, 1,
0.4941572, 1.63064, 0.4851411, 1, 1, 1, 1, 1,
0.4994324, -0.6138318, 0.9136493, 1, 1, 1, 1, 1,
0.4996417, -3.678593, 3.172411, 1, 1, 1, 1, 1,
0.5003364, -0.3280503, 2.223017, 1, 1, 1, 1, 1,
0.5004373, 1.813834, -0.8719137, 1, 1, 1, 1, 1,
0.5025609, 0.04052284, 0.5146713, 0, 0, 1, 1, 1,
0.5082688, -1.240943, 2.528206, 1, 0, 0, 1, 1,
0.5096079, 0.236182, 0.8578837, 1, 0, 0, 1, 1,
0.5220996, -0.4000677, 2.255638, 1, 0, 0, 1, 1,
0.5235671, 0.9904643, -0.5770617, 1, 0, 0, 1, 1,
0.5238473, -1.074758, 2.612598, 1, 0, 0, 1, 1,
0.5238649, -0.928583, 2.188449, 0, 0, 0, 1, 1,
0.5264806, 0.7988623, 0.6461967, 0, 0, 0, 1, 1,
0.5301246, 0.6924567, 0.3644044, 0, 0, 0, 1, 1,
0.5366615, 0.8667725, -0.7852566, 0, 0, 0, 1, 1,
0.5379456, -0.6540892, 1.024277, 0, 0, 0, 1, 1,
0.5412663, -0.182859, 2.829074, 0, 0, 0, 1, 1,
0.5413556, -0.4582772, 1.667107, 0, 0, 0, 1, 1,
0.542158, -0.7943708, 3.356916, 1, 1, 1, 1, 1,
0.5517983, 0.4968435, -0.9603507, 1, 1, 1, 1, 1,
0.5518903, 1.725802, -0.3260704, 1, 1, 1, 1, 1,
0.5529249, 0.9481339, 0.6447728, 1, 1, 1, 1, 1,
0.5538914, 1.916809, -0.3263347, 1, 1, 1, 1, 1,
0.5558729, -0.5931575, 2.366299, 1, 1, 1, 1, 1,
0.5680785, 0.6363859, 1.026006, 1, 1, 1, 1, 1,
0.5686821, 1.428171, 2.822524, 1, 1, 1, 1, 1,
0.5705881, 0.4588395, 2.092848, 1, 1, 1, 1, 1,
0.570882, -1.672306, 4.428924, 1, 1, 1, 1, 1,
0.5798823, -0.6016141, 3.780134, 1, 1, 1, 1, 1,
0.5835354, -1.343749, 1.803036, 1, 1, 1, 1, 1,
0.5851753, -0.5394721, 1.567529, 1, 1, 1, 1, 1,
0.5886438, -1.050342, 2.349079, 1, 1, 1, 1, 1,
0.5900962, 1.818038, 0.04124473, 1, 1, 1, 1, 1,
0.5976874, 0.4270245, 0.3421378, 0, 0, 1, 1, 1,
0.5979586, -0.4733293, 3.889784, 1, 0, 0, 1, 1,
0.611591, -0.3179408, 3.22599, 1, 0, 0, 1, 1,
0.6171348, 0.8402682, 0.2980565, 1, 0, 0, 1, 1,
0.6179051, 0.800549, -0.1586391, 1, 0, 0, 1, 1,
0.6201371, 0.2297162, 1.270173, 1, 0, 0, 1, 1,
0.6229503, -1.213417, 3.79759, 0, 0, 0, 1, 1,
0.6271934, 1.133795, -0.1174131, 0, 0, 0, 1, 1,
0.6272004, 1.31271, 0.1356799, 0, 0, 0, 1, 1,
0.6326156, 0.9687534, -0.4187501, 0, 0, 0, 1, 1,
0.6381423, 1.843489, -1.233495, 0, 0, 0, 1, 1,
0.6385478, -1.338445, 2.804618, 0, 0, 0, 1, 1,
0.6418316, 0.02358217, -0.4255359, 0, 0, 0, 1, 1,
0.6435972, -0.8932747, 4.313064, 1, 1, 1, 1, 1,
0.6459261, 1.530928, -0.1050334, 1, 1, 1, 1, 1,
0.6504111, 1.446627, -0.2586785, 1, 1, 1, 1, 1,
0.6537347, -0.2583667, 0.3115759, 1, 1, 1, 1, 1,
0.6547533, 1.16889, 1.4456, 1, 1, 1, 1, 1,
0.6570542, -0.6353366, 3.266013, 1, 1, 1, 1, 1,
0.6572639, -1.63868, 2.511413, 1, 1, 1, 1, 1,
0.6625555, -0.2061069, 3.127992, 1, 1, 1, 1, 1,
0.6636503, -0.561003, 1.196159, 1, 1, 1, 1, 1,
0.6644815, 0.9376013, 1.863901, 1, 1, 1, 1, 1,
0.6648875, 1.393343, -1.036084, 1, 1, 1, 1, 1,
0.6655464, -1.406013, 1.889481, 1, 1, 1, 1, 1,
0.6664186, -1.884903, 3.525167, 1, 1, 1, 1, 1,
0.6687467, 1.493514, -0.7038743, 1, 1, 1, 1, 1,
0.6725754, -1.608339, 3.551117, 1, 1, 1, 1, 1,
0.6735943, 1.037473, 1.308118, 0, 0, 1, 1, 1,
0.6761879, 0.2957445, 0.09326883, 1, 0, 0, 1, 1,
0.6783782, 1.305323, -0.2022348, 1, 0, 0, 1, 1,
0.6952589, 0.6120484, 0.932385, 1, 0, 0, 1, 1,
0.6953654, -0.2908227, 1.776919, 1, 0, 0, 1, 1,
0.702377, -0.1714725, -0.5696536, 1, 0, 0, 1, 1,
0.7089203, -0.1599743, 1.937214, 0, 0, 0, 1, 1,
0.7103377, 0.08828434, 2.567853, 0, 0, 0, 1, 1,
0.7134899, -1.09766, 2.206861, 0, 0, 0, 1, 1,
0.7138698, 1.469118, 0.245891, 0, 0, 0, 1, 1,
0.7148072, -0.3930709, 2.310416, 0, 0, 0, 1, 1,
0.7151344, -0.7942841, 3.100654, 0, 0, 0, 1, 1,
0.7263121, -0.7803969, 2.457151, 0, 0, 0, 1, 1,
0.7313001, -0.07750578, 2.121065, 1, 1, 1, 1, 1,
0.7333675, -0.1124469, 1.88034, 1, 1, 1, 1, 1,
0.7349461, 1.264331, 0.5699205, 1, 1, 1, 1, 1,
0.7428854, 0.005290219, 2.091644, 1, 1, 1, 1, 1,
0.7451792, 0.8122433, 0.7550741, 1, 1, 1, 1, 1,
0.7455233, -1.439017, 3.287886, 1, 1, 1, 1, 1,
0.7491331, -1.445439, 3.071185, 1, 1, 1, 1, 1,
0.7501463, -1.12161, 2.054231, 1, 1, 1, 1, 1,
0.7531595, 0.6069482, 2.451381, 1, 1, 1, 1, 1,
0.7539018, 0.3341656, 1.388512, 1, 1, 1, 1, 1,
0.7576092, 0.9173945, 1.661837, 1, 1, 1, 1, 1,
0.7654801, -0.3917867, 2.625114, 1, 1, 1, 1, 1,
0.767974, 2.376312, 0.207315, 1, 1, 1, 1, 1,
0.7697374, -0.005676718, 2.627856, 1, 1, 1, 1, 1,
0.7698013, -0.4425567, 2.465869, 1, 1, 1, 1, 1,
0.7700566, 1.93084, -0.18146, 0, 0, 1, 1, 1,
0.770732, -0.09245152, 2.242426, 1, 0, 0, 1, 1,
0.7712008, 1.091851, 0.5276219, 1, 0, 0, 1, 1,
0.774052, 0.02304701, 1.154047, 1, 0, 0, 1, 1,
0.7743947, -0.05936924, 2.354428, 1, 0, 0, 1, 1,
0.7760848, -1.019536, 3.221684, 1, 0, 0, 1, 1,
0.7781358, 0.8945168, 0.8376365, 0, 0, 0, 1, 1,
0.7828192, -0.2049321, 0.8179653, 0, 0, 0, 1, 1,
0.7871804, 1.850721, 1.014364, 0, 0, 0, 1, 1,
0.7921631, 0.3652733, 0.5641978, 0, 0, 0, 1, 1,
0.7936675, -1.103571, 0.802088, 0, 0, 0, 1, 1,
0.8054491, -0.6932242, 2.360234, 0, 0, 0, 1, 1,
0.8083333, 0.5239273, 0.2194145, 0, 0, 0, 1, 1,
0.8090135, -0.6684603, 1.267118, 1, 1, 1, 1, 1,
0.8145533, 1.437388, 1.563644, 1, 1, 1, 1, 1,
0.8160107, -1.157263, 0.2278015, 1, 1, 1, 1, 1,
0.8182602, 0.3438391, -1.025208, 1, 1, 1, 1, 1,
0.819749, -1.968225, 5.052404, 1, 1, 1, 1, 1,
0.82303, -0.8818501, 2.444491, 1, 1, 1, 1, 1,
0.8249363, 0.0781633, 2.66917, 1, 1, 1, 1, 1,
0.8253329, 0.5086375, -1.064262, 1, 1, 1, 1, 1,
0.8346268, 0.7636741, 0.4753888, 1, 1, 1, 1, 1,
0.8365595, -0.2190493, 1.572111, 1, 1, 1, 1, 1,
0.8406246, 0.8001126, 0.53166, 1, 1, 1, 1, 1,
0.8433818, 0.3468305, 1.673799, 1, 1, 1, 1, 1,
0.844108, 0.3660547, 0.9583068, 1, 1, 1, 1, 1,
0.8469525, 0.08254299, 2.370859, 1, 1, 1, 1, 1,
0.8556728, 0.2574855, 1.016947, 1, 1, 1, 1, 1,
0.8610341, 1.574993, -0.3293445, 0, 0, 1, 1, 1,
0.8633821, 0.0506378, 0.8488819, 1, 0, 0, 1, 1,
0.8635932, -1.452476, 3.847121, 1, 0, 0, 1, 1,
0.8641019, -0.3904297, 2.137776, 1, 0, 0, 1, 1,
0.8648828, 0.1405572, 1.674264, 1, 0, 0, 1, 1,
0.8660315, 1.572166, 1.167647, 1, 0, 0, 1, 1,
0.8713153, -1.288395, 1.988559, 0, 0, 0, 1, 1,
0.8721874, -1.605916, 0.5320005, 0, 0, 0, 1, 1,
0.8724262, 0.7566919, -0.1544551, 0, 0, 0, 1, 1,
0.87818, -0.3447643, -0.2174218, 0, 0, 0, 1, 1,
0.8855181, -1.191938, 1.738975, 0, 0, 0, 1, 1,
0.8952082, -1.286092, 2.774117, 0, 0, 0, 1, 1,
0.9037212, -1.870413, 1.435847, 0, 0, 0, 1, 1,
0.9039696, -1.274149, 2.414156, 1, 1, 1, 1, 1,
0.904209, 0.04703346, 0.373849, 1, 1, 1, 1, 1,
0.9060259, -0.1252695, 0.7961081, 1, 1, 1, 1, 1,
0.9069517, -0.9828169, 1.811453, 1, 1, 1, 1, 1,
0.9084806, 0.8275167, 1.085865, 1, 1, 1, 1, 1,
0.90856, 0.4202315, 1.09171, 1, 1, 1, 1, 1,
0.9149516, 0.803273, 0.5198613, 1, 1, 1, 1, 1,
0.9159693, 2.115629, -1.335297, 1, 1, 1, 1, 1,
0.9188666, 0.2585767, 1.374875, 1, 1, 1, 1, 1,
0.9341056, -1.128872, 3.343933, 1, 1, 1, 1, 1,
0.94131, 0.4594427, 0.002576186, 1, 1, 1, 1, 1,
0.9467604, -0.2391682, 3.800707, 1, 1, 1, 1, 1,
0.9596618, 0.5395281, 2.88142, 1, 1, 1, 1, 1,
0.9677306, 0.007408638, 3.049285, 1, 1, 1, 1, 1,
0.9733545, 1.120286, -0.8045168, 1, 1, 1, 1, 1,
0.9747043, 0.7253653, 1.751536, 0, 0, 1, 1, 1,
0.9753886, 0.6815069, 1.276177, 1, 0, 0, 1, 1,
0.9755303, -1.085429, 0.9606955, 1, 0, 0, 1, 1,
0.9787692, -0.148041, 1.195914, 1, 0, 0, 1, 1,
0.983632, 0.9008301, -0.1522722, 1, 0, 0, 1, 1,
0.9877692, -1.487273, 3.624908, 1, 0, 0, 1, 1,
0.9885402, -0.4365022, 2.468799, 0, 0, 0, 1, 1,
0.9890304, -1.684154, 3.988512, 0, 0, 0, 1, 1,
0.9898018, 1.415792, -0.1040086, 0, 0, 0, 1, 1,
0.9915771, 1.859773, 1.803771, 0, 0, 0, 1, 1,
0.998096, 1.240806, -1.400627, 0, 0, 0, 1, 1,
1.006073, 0.07592704, 2.871996, 0, 0, 0, 1, 1,
1.009316, -2.154384, 2.843983, 0, 0, 0, 1, 1,
1.01018, 0.9025642, -0.2796863, 1, 1, 1, 1, 1,
1.010218, -0.9260674, 1.718058, 1, 1, 1, 1, 1,
1.01146, 0.6807151, 1.242248, 1, 1, 1, 1, 1,
1.012792, -0.324941, 1.674825, 1, 1, 1, 1, 1,
1.013468, -0.02222343, 1.555419, 1, 1, 1, 1, 1,
1.01477, -3.295156, 2.574937, 1, 1, 1, 1, 1,
1.020897, 1.006588, 0.1445725, 1, 1, 1, 1, 1,
1.030061, 2.750401, -0.7519712, 1, 1, 1, 1, 1,
1.032746, 1.920386, 1.579063, 1, 1, 1, 1, 1,
1.03621, 0.3022769, 0.8564791, 1, 1, 1, 1, 1,
1.038722, -0.7342345, 1.861611, 1, 1, 1, 1, 1,
1.040209, 0.1913465, 2.255963, 1, 1, 1, 1, 1,
1.046084, -2.027605, 2.796033, 1, 1, 1, 1, 1,
1.046395, -0.7147795, 1.866649, 1, 1, 1, 1, 1,
1.051003, -0.5748817, 1.939352, 1, 1, 1, 1, 1,
1.054282, -0.4202572, 3.124683, 0, 0, 1, 1, 1,
1.057289, -0.7062854, 2.202314, 1, 0, 0, 1, 1,
1.059168, 0.8001693, 1.37776, 1, 0, 0, 1, 1,
1.060359, 0.5114968, 1.393918, 1, 0, 0, 1, 1,
1.063703, 0.4903079, 0.5622785, 1, 0, 0, 1, 1,
1.064934, -2.188937, 2.844278, 1, 0, 0, 1, 1,
1.069146, -0.3743287, 1.379783, 0, 0, 0, 1, 1,
1.070499, 0.8844465, 1.747326, 0, 0, 0, 1, 1,
1.076027, 1.107634, 1.023994, 0, 0, 0, 1, 1,
1.076606, 0.3937357, 0.6331808, 0, 0, 0, 1, 1,
1.07699, 1.177711, 1.791145, 0, 0, 0, 1, 1,
1.084845, 0.7090892, 2.6756, 0, 0, 0, 1, 1,
1.09451, 0.7771072, 1.202389, 0, 0, 0, 1, 1,
1.097726, -0.3621779, 1.430357, 1, 1, 1, 1, 1,
1.098716, 2.218983, 1.077857, 1, 1, 1, 1, 1,
1.117319, 1.213329, 1.918981, 1, 1, 1, 1, 1,
1.122567, 0.4632684, 0.5288624, 1, 1, 1, 1, 1,
1.13168, 1.233927, -0.9858571, 1, 1, 1, 1, 1,
1.135049, -0.3776887, 1.426506, 1, 1, 1, 1, 1,
1.149901, -0.1246394, 0.9888479, 1, 1, 1, 1, 1,
1.152458, 1.191393, 1.664833, 1, 1, 1, 1, 1,
1.158946, 0.2940938, 1.461434, 1, 1, 1, 1, 1,
1.15899, 1.285388, -0.09891935, 1, 1, 1, 1, 1,
1.163063, 0.3007706, 1.288373, 1, 1, 1, 1, 1,
1.164152, -2.085749, 3.202454, 1, 1, 1, 1, 1,
1.166521, 1.882319, -1.126115, 1, 1, 1, 1, 1,
1.169841, 0.6653929, 0.6426609, 1, 1, 1, 1, 1,
1.170105, 1.322251, 1.189574, 1, 1, 1, 1, 1,
1.175388, -1.46358, 2.342383, 0, 0, 1, 1, 1,
1.1755, -0.1526363, 0.9806154, 1, 0, 0, 1, 1,
1.1933, -1.496343, 3.948326, 1, 0, 0, 1, 1,
1.204426, -2.055753, 1.732379, 1, 0, 0, 1, 1,
1.20696, -0.4103186, 3.12095, 1, 0, 0, 1, 1,
1.207299, 1.191944, -0.1462978, 1, 0, 0, 1, 1,
1.208876, -2.128254, 5.119805, 0, 0, 0, 1, 1,
1.218713, -0.9584657, 1.5859, 0, 0, 0, 1, 1,
1.22086, -2.08726, 2.650935, 0, 0, 0, 1, 1,
1.223698, -0.7630729, 0.2915011, 0, 0, 0, 1, 1,
1.236381, -0.4617431, 0.6433268, 0, 0, 0, 1, 1,
1.241188, 0.1002828, 2.242468, 0, 0, 0, 1, 1,
1.244927, -0.2832832, 2.903149, 0, 0, 0, 1, 1,
1.248011, 0.9803883, 0.3020306, 1, 1, 1, 1, 1,
1.251903, 0.2778346, 1.743791, 1, 1, 1, 1, 1,
1.25866, -0.6859329, 1.818141, 1, 1, 1, 1, 1,
1.26159, 0.08299826, 2.058394, 1, 1, 1, 1, 1,
1.264585, -0.5169878, 3.09909, 1, 1, 1, 1, 1,
1.266789, 1.566523, 2.066387, 1, 1, 1, 1, 1,
1.2668, -0.3268109, 1.760699, 1, 1, 1, 1, 1,
1.290209, 0.8315139, 0.5670858, 1, 1, 1, 1, 1,
1.293429, -0.4863794, 2.696, 1, 1, 1, 1, 1,
1.293887, -0.7486901, 2.950986, 1, 1, 1, 1, 1,
1.299512, -0.2355205, 0.8286422, 1, 1, 1, 1, 1,
1.303639, -0.7474894, 1.553638, 1, 1, 1, 1, 1,
1.314331, -0.2926106, 0.7577649, 1, 1, 1, 1, 1,
1.319659, 1.067486, 0.3957308, 1, 1, 1, 1, 1,
1.32753, -1.704707, 1.816841, 1, 1, 1, 1, 1,
1.342808, -1.265597, 3.242878, 0, 0, 1, 1, 1,
1.344045, 0.2235054, 0.5247749, 1, 0, 0, 1, 1,
1.347813, -0.1329506, 1.197966, 1, 0, 0, 1, 1,
1.353424, 0.07790908, 3.178895, 1, 0, 0, 1, 1,
1.354423, 0.145895, 1.171397, 1, 0, 0, 1, 1,
1.356023, 0.02147816, 0.2602697, 1, 0, 0, 1, 1,
1.361381, 0.6319781, -0.01051567, 0, 0, 0, 1, 1,
1.37025, 2.02133, 1.7086, 0, 0, 0, 1, 1,
1.370855, -0.6404219, 3.294587, 0, 0, 0, 1, 1,
1.372823, 0.02514294, 1.77368, 0, 0, 0, 1, 1,
1.379639, -1.422901, 1.752606, 0, 0, 0, 1, 1,
1.381341, 1.41844, 2.466582, 0, 0, 0, 1, 1,
1.384602, -0.4386822, 1.037762, 0, 0, 0, 1, 1,
1.38706, -0.5832823, 0.441629, 1, 1, 1, 1, 1,
1.388571, 1.168126, 2.147669, 1, 1, 1, 1, 1,
1.389303, -0.2976973, 2.432866, 1, 1, 1, 1, 1,
1.396315, -1.407079, 2.303186, 1, 1, 1, 1, 1,
1.398458, -1.129525, 1.896636, 1, 1, 1, 1, 1,
1.416069, 0.77227, 1.194615, 1, 1, 1, 1, 1,
1.420609, 2.260638, -0.5860767, 1, 1, 1, 1, 1,
1.42661, 0.1852531, 1.586331, 1, 1, 1, 1, 1,
1.429095, -0.4151564, 2.4745, 1, 1, 1, 1, 1,
1.437576, 0.9213166, 1.204006, 1, 1, 1, 1, 1,
1.446258, -0.9895254, 0.1059899, 1, 1, 1, 1, 1,
1.454481, 0.6180238, 0.4423833, 1, 1, 1, 1, 1,
1.460303, 1.282572, -1.192745, 1, 1, 1, 1, 1,
1.470511, -0.08591426, 0.7737305, 1, 1, 1, 1, 1,
1.471472, 0.1001296, 2.805726, 1, 1, 1, 1, 1,
1.473488, 0.8307632, 0.776113, 0, 0, 1, 1, 1,
1.483046, 0.2499712, 0.714754, 1, 0, 0, 1, 1,
1.486047, 0.01780951, 1.760563, 1, 0, 0, 1, 1,
1.486274, -0.7017325, 2.592074, 1, 0, 0, 1, 1,
1.486915, -1.028127, 1.073081, 1, 0, 0, 1, 1,
1.489474, -0.9759948, 1.619099, 1, 0, 0, 1, 1,
1.496011, -0.5728903, 2.31796, 0, 0, 0, 1, 1,
1.502372, 0.2144545, 1.099869, 0, 0, 0, 1, 1,
1.50326, 0.3183777, 1.573042, 0, 0, 0, 1, 1,
1.528072, 1.227618, 2.582617, 0, 0, 0, 1, 1,
1.532588, 2.674749, 0.8211587, 0, 0, 0, 1, 1,
1.536032, 1.156563, 0.05491791, 0, 0, 0, 1, 1,
1.541369, 2.249343, 1.634971, 0, 0, 0, 1, 1,
1.551528, 0.8836954, 0.08144696, 1, 1, 1, 1, 1,
1.57122, -0.4139498, 0.6709824, 1, 1, 1, 1, 1,
1.584098, -0.2982258, 2.489941, 1, 1, 1, 1, 1,
1.596387, 1.040752, 2.343764, 1, 1, 1, 1, 1,
1.605822, -0.9760971, 1.159998, 1, 1, 1, 1, 1,
1.611266, -1.024249, 2.603799, 1, 1, 1, 1, 1,
1.619336, -1.2362, 4.229637, 1, 1, 1, 1, 1,
1.624733, 0.6869694, 2.084297, 1, 1, 1, 1, 1,
1.649577, -1.798486, 2.828737, 1, 1, 1, 1, 1,
1.654885, -0.5322573, 1.548948, 1, 1, 1, 1, 1,
1.673651, -1.405957, 3.281601, 1, 1, 1, 1, 1,
1.682675, 0.5598792, 0.7440998, 1, 1, 1, 1, 1,
1.702668, 1.17931, 2.122273, 1, 1, 1, 1, 1,
1.710335, -0.17761, 1.547485, 1, 1, 1, 1, 1,
1.723681, 0.4793814, 2.92699, 1, 1, 1, 1, 1,
1.746167, 0.4962825, 2.536747, 0, 0, 1, 1, 1,
1.749399, -0.8216562, 1.756266, 1, 0, 0, 1, 1,
1.750374, 0.9649422, 2.094422, 1, 0, 0, 1, 1,
1.759976, 0.02549423, 2.53348, 1, 0, 0, 1, 1,
1.766683, 1.090216, 2.059488, 1, 0, 0, 1, 1,
1.771099, 0.047152, 1.03426, 1, 0, 0, 1, 1,
1.780059, 0.3720815, 1.795057, 0, 0, 0, 1, 1,
1.791899, 0.6110716, 2.077151, 0, 0, 0, 1, 1,
1.824712, 0.28565, -0.4357725, 0, 0, 0, 1, 1,
1.82625, -1.526273, 3.572702, 0, 0, 0, 1, 1,
1.830095, 0.5178789, 3.187722, 0, 0, 0, 1, 1,
1.83932, -1.20811, 2.660192, 0, 0, 0, 1, 1,
1.846921, -0.7446831, 0.6272014, 0, 0, 0, 1, 1,
1.859571, -2.160468, 2.291793, 1, 1, 1, 1, 1,
1.870402, -0.1333827, 2.44176, 1, 1, 1, 1, 1,
1.87181, -0.4235157, 2.805638, 1, 1, 1, 1, 1,
1.884457, -1.913258, 0.2258954, 1, 1, 1, 1, 1,
1.889196, 0.9715139, -0.3102649, 1, 1, 1, 1, 1,
1.889671, 0.8917555, 0.2837424, 1, 1, 1, 1, 1,
1.932284, 0.2787771, 0.4955481, 1, 1, 1, 1, 1,
1.946922, 0.1782979, 1.246013, 1, 1, 1, 1, 1,
1.983382, 1.026272, 1.773046, 1, 1, 1, 1, 1,
1.99345, 0.663134, -0.1363536, 1, 1, 1, 1, 1,
1.997934, 0.3137736, 1.98946, 1, 1, 1, 1, 1,
2.027524, 1.696042, 1.807067, 1, 1, 1, 1, 1,
2.033579, -1.794586, 1.972829, 1, 1, 1, 1, 1,
2.058574, 0.2583225, 2.532489, 1, 1, 1, 1, 1,
2.060247, -0.08788664, 1.992647, 1, 1, 1, 1, 1,
2.079795, 1.471027, 1.345824, 0, 0, 1, 1, 1,
2.123178, 0.6895219, -0.2596806, 1, 0, 0, 1, 1,
2.131896, -0.1544467, 0.5707082, 1, 0, 0, 1, 1,
2.191489, 1.303364, 0.8149316, 1, 0, 0, 1, 1,
2.231913, -0.392828, -0.01417641, 1, 0, 0, 1, 1,
2.257339, -0.417571, 1.782969, 1, 0, 0, 1, 1,
2.285704, 0.2820352, 0.653401, 0, 0, 0, 1, 1,
2.30069, 0.07551369, 0.7847226, 0, 0, 0, 1, 1,
2.306245, -0.5501287, 1.133672, 0, 0, 0, 1, 1,
2.348222, -0.4797358, 1.500212, 0, 0, 0, 1, 1,
2.371213, -0.09751352, 0.5668074, 0, 0, 0, 1, 1,
2.383625, 1.617577, 1.571863, 0, 0, 0, 1, 1,
2.528437, -1.104457, 1.842958, 0, 0, 0, 1, 1,
2.569217, -0.6150624, 0.5813978, 1, 1, 1, 1, 1,
2.613333, 0.2074332, 3.105116, 1, 1, 1, 1, 1,
2.6177, 0.2930517, 0.2784809, 1, 1, 1, 1, 1,
2.782935, 0.6421976, -0.1548254, 1, 1, 1, 1, 1,
2.823117, 0.5966986, 2.138635, 1, 1, 1, 1, 1,
2.857743, 2.425171, 0.5264502, 1, 1, 1, 1, 1,
3.016484, 1.381798, 0.02847152, 1, 1, 1, 1, 1
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
var radius = 9.322374;
var distance = 32.74445;
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
mvMatrix.translate( -0.01828051, 0.4640961, -0.003948212 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.74445);
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
