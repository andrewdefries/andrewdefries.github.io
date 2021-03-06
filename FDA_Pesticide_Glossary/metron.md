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
-3.586332, -1.162562, -1.599648, 1, 0, 0, 1,
-2.952499, 0.5319929, -3.172992, 1, 0.007843138, 0, 1,
-2.899279, 0.2752463, -1.74585, 1, 0.01176471, 0, 1,
-2.775153, 0.4407847, 0.8383362, 1, 0.01960784, 0, 1,
-2.678193, -0.4004352, -1.571885, 1, 0.02352941, 0, 1,
-2.668791, 0.1429906, -1.504765, 1, 0.03137255, 0, 1,
-2.612784, -1.21154, -2.887849, 1, 0.03529412, 0, 1,
-2.611864, -0.4975194, -2.233009, 1, 0.04313726, 0, 1,
-2.555377, -0.4675159, -1.656719, 1, 0.04705882, 0, 1,
-2.382292, 0.8105085, -2.087444, 1, 0.05490196, 0, 1,
-2.37513, 0.5220162, -3.360101, 1, 0.05882353, 0, 1,
-2.338307, 1.048787, -1.119381, 1, 0.06666667, 0, 1,
-2.270182, 0.2437037, -0.7666669, 1, 0.07058824, 0, 1,
-2.247184, -0.3025882, -2.363385, 1, 0.07843138, 0, 1,
-2.21977, -2.894453, -3.733777, 1, 0.08235294, 0, 1,
-2.191703, -0.409389, -0.07441586, 1, 0.09019608, 0, 1,
-2.17274, -0.8605553, -0.4870695, 1, 0.09411765, 0, 1,
-2.170894, 1.095702, -1.391711, 1, 0.1019608, 0, 1,
-2.135473, -0.2510793, 0.7132989, 1, 0.1098039, 0, 1,
-2.105998, -0.06871316, -2.416135, 1, 0.1137255, 0, 1,
-2.05075, 0.7913746, -0.4703654, 1, 0.1215686, 0, 1,
-2.026136, 1.589673, -1.034514, 1, 0.1254902, 0, 1,
-2.010524, 0.3992867, -0.4292722, 1, 0.1333333, 0, 1,
-2.009148, -0.08746367, -2.230346, 1, 0.1372549, 0, 1,
-1.998988, -1.149876, -1.024775, 1, 0.145098, 0, 1,
-1.981184, 1.517021, 0.07683165, 1, 0.1490196, 0, 1,
-1.977967, -0.6562382, -2.726191, 1, 0.1568628, 0, 1,
-1.962843, -0.4597931, -1.167443, 1, 0.1607843, 0, 1,
-1.915699, -0.4225858, -1.774366, 1, 0.1686275, 0, 1,
-1.907364, -1.741648, -1.112572, 1, 0.172549, 0, 1,
-1.878788, 0.0830981, 0.03415817, 1, 0.1803922, 0, 1,
-1.875658, 1.337402, -0.787807, 1, 0.1843137, 0, 1,
-1.855095, 0.5125969, -0.8082293, 1, 0.1921569, 0, 1,
-1.848719, -0.5593102, -0.6198667, 1, 0.1960784, 0, 1,
-1.826226, 1.464505, -1.009966, 1, 0.2039216, 0, 1,
-1.823968, -1.465297, -3.916727, 1, 0.2117647, 0, 1,
-1.802622, -0.3110189, -2.172034, 1, 0.2156863, 0, 1,
-1.797161, -0.1914072, -1.455204, 1, 0.2235294, 0, 1,
-1.769653, 0.7417924, -1.409624, 1, 0.227451, 0, 1,
-1.765243, 0.3128225, -2.69767, 1, 0.2352941, 0, 1,
-1.762237, -0.706378, -2.543376, 1, 0.2392157, 0, 1,
-1.741957, -0.1482654, -1.484321, 1, 0.2470588, 0, 1,
-1.740575, -1.244451, -2.865305, 1, 0.2509804, 0, 1,
-1.73867, 0.6774946, -1.413239, 1, 0.2588235, 0, 1,
-1.730112, -0.8898791, -2.045412, 1, 0.2627451, 0, 1,
-1.727359, 0.5606459, -1.109496, 1, 0.2705882, 0, 1,
-1.725935, -2.678747, -2.961498, 1, 0.2745098, 0, 1,
-1.723005, 1.886858, -0.3981344, 1, 0.282353, 0, 1,
-1.678297, -0.676244, 0.6739411, 1, 0.2862745, 0, 1,
-1.676498, -2.896971, -1.618944, 1, 0.2941177, 0, 1,
-1.67358, 2.122111, -0.5049217, 1, 0.3019608, 0, 1,
-1.665319, -0.8460955, -3.507292, 1, 0.3058824, 0, 1,
-1.664985, -0.6676953, -1.996344, 1, 0.3137255, 0, 1,
-1.654609, -0.2829157, -3.415931, 1, 0.3176471, 0, 1,
-1.651243, 2.435941, 0.3044623, 1, 0.3254902, 0, 1,
-1.643317, 0.1342635, -3.113693, 1, 0.3294118, 0, 1,
-1.642869, 0.1097834, -3.717218, 1, 0.3372549, 0, 1,
-1.641979, -0.9202155, -2.587583, 1, 0.3411765, 0, 1,
-1.63399, -0.2937855, -2.20207, 1, 0.3490196, 0, 1,
-1.627089, 0.6714895, -0.793358, 1, 0.3529412, 0, 1,
-1.624034, 1.700776, 1.229178, 1, 0.3607843, 0, 1,
-1.620669, -0.2689152, -2.238591, 1, 0.3647059, 0, 1,
-1.615784, -1.866879, -2.271549, 1, 0.372549, 0, 1,
-1.604144, -1.44471, -2.063058, 1, 0.3764706, 0, 1,
-1.603703, -0.175851, -3.251185, 1, 0.3843137, 0, 1,
-1.601737, -1.030968, -2.273124, 1, 0.3882353, 0, 1,
-1.5982, -1.716867, -2.344684, 1, 0.3960784, 0, 1,
-1.596347, -0.08214974, -1.793699, 1, 0.4039216, 0, 1,
-1.588147, -0.1840731, -1.844076, 1, 0.4078431, 0, 1,
-1.581621, -1.113915, -3.911389, 1, 0.4156863, 0, 1,
-1.579741, -0.0370003, -0.1008872, 1, 0.4196078, 0, 1,
-1.561271, 1.127516, -0.4362041, 1, 0.427451, 0, 1,
-1.55856, 0.5833439, -1.472918, 1, 0.4313726, 0, 1,
-1.556291, 0.2636343, -0.8148677, 1, 0.4392157, 0, 1,
-1.552641, 0.8883394, -1.510598, 1, 0.4431373, 0, 1,
-1.551565, 0.0527724, -0.2636738, 1, 0.4509804, 0, 1,
-1.53637, 0.6745871, -0.5834898, 1, 0.454902, 0, 1,
-1.525259, 0.09635945, -0.8491362, 1, 0.4627451, 0, 1,
-1.524319, 0.7931523, -1.307401, 1, 0.4666667, 0, 1,
-1.511639, -0.7803344, -1.938726, 1, 0.4745098, 0, 1,
-1.507622, 0.8311027, -2.308483, 1, 0.4784314, 0, 1,
-1.496113, 1.482481, -0.2837121, 1, 0.4862745, 0, 1,
-1.491639, -0.09388854, -2.372981, 1, 0.4901961, 0, 1,
-1.489409, -0.3071447, -1.653489, 1, 0.4980392, 0, 1,
-1.47998, -0.9729096, -2.698861, 1, 0.5058824, 0, 1,
-1.474542, 1.186553, -0.493238, 1, 0.509804, 0, 1,
-1.44903, -0.1188453, -1.340833, 1, 0.5176471, 0, 1,
-1.434186, -1.300586, -1.485758, 1, 0.5215687, 0, 1,
-1.421982, -0.4318213, -2.281712, 1, 0.5294118, 0, 1,
-1.411892, 0.289626, 0.7758144, 1, 0.5333334, 0, 1,
-1.411129, 2.236983, -1.637486, 1, 0.5411765, 0, 1,
-1.401398, -1.896384, -2.586695, 1, 0.5450981, 0, 1,
-1.392469, 0.9451045, 0.3222139, 1, 0.5529412, 0, 1,
-1.390079, -1.448959, -2.556316, 1, 0.5568628, 0, 1,
-1.386863, -0.651997, -2.584217, 1, 0.5647059, 0, 1,
-1.379532, -0.7004148, -2.175587, 1, 0.5686275, 0, 1,
-1.374061, -0.4371637, -2.31297, 1, 0.5764706, 0, 1,
-1.35675, -0.6110771, -1.509213, 1, 0.5803922, 0, 1,
-1.346165, -1.81026, -0.5671905, 1, 0.5882353, 0, 1,
-1.344502, 0.3010128, -0.1891223, 1, 0.5921569, 0, 1,
-1.335636, -0.6924455, -0.9295045, 1, 0.6, 0, 1,
-1.327994, 1.441856, -0.09942127, 1, 0.6078432, 0, 1,
-1.326532, -0.8447067, -2.520377, 1, 0.6117647, 0, 1,
-1.322525, -1.603501, -3.325631, 1, 0.6196079, 0, 1,
-1.319485, 0.02302325, -0.6502447, 1, 0.6235294, 0, 1,
-1.318246, -0.6171106, -2.909759, 1, 0.6313726, 0, 1,
-1.317857, 1.212183, 0.009023886, 1, 0.6352941, 0, 1,
-1.316391, -0.6357903, -3.518911, 1, 0.6431373, 0, 1,
-1.30964, 0.693391, -1.300467, 1, 0.6470588, 0, 1,
-1.296742, -0.9375324, -1.635983, 1, 0.654902, 0, 1,
-1.294052, -1.343608, -3.261812, 1, 0.6588235, 0, 1,
-1.28792, -0.02990083, -1.507173, 1, 0.6666667, 0, 1,
-1.284928, 0.6259638, -2.228196, 1, 0.6705883, 0, 1,
-1.282068, 0.2354855, -0.5092422, 1, 0.6784314, 0, 1,
-1.282011, -1.098848, -1.855577, 1, 0.682353, 0, 1,
-1.278663, 0.404155, -0.8679952, 1, 0.6901961, 0, 1,
-1.277587, -0.2261057, -1.548686, 1, 0.6941177, 0, 1,
-1.271232, 0.730095, -2.45308, 1, 0.7019608, 0, 1,
-1.268932, -0.5486832, -2.010949, 1, 0.7098039, 0, 1,
-1.265018, -0.1942399, -1.358934, 1, 0.7137255, 0, 1,
-1.262582, -0.2622724, -0.9539996, 1, 0.7215686, 0, 1,
-1.257682, 0.3463926, -0.8238322, 1, 0.7254902, 0, 1,
-1.252832, 0.0278473, -0.7768813, 1, 0.7333333, 0, 1,
-1.251708, 0.7897241, -0.4620025, 1, 0.7372549, 0, 1,
-1.251672, 1.489131, -0.8185768, 1, 0.7450981, 0, 1,
-1.244874, -0.2932227, -0.8751066, 1, 0.7490196, 0, 1,
-1.244719, 0.09802131, -1.227132, 1, 0.7568628, 0, 1,
-1.242912, -0.5482839, -3.651451, 1, 0.7607843, 0, 1,
-1.232556, -0.7261139, -3.469036, 1, 0.7686275, 0, 1,
-1.231186, 0.07553008, -1.773167, 1, 0.772549, 0, 1,
-1.226623, -0.7568757, -3.589608, 1, 0.7803922, 0, 1,
-1.223924, -0.341961, -0.01022201, 1, 0.7843137, 0, 1,
-1.22244, 0.6018637, -0.9037206, 1, 0.7921569, 0, 1,
-1.222058, -0.9911886, -2.234207, 1, 0.7960784, 0, 1,
-1.22151, -0.1313163, -0.9617565, 1, 0.8039216, 0, 1,
-1.21945, 1.433272, -1.455749, 1, 0.8117647, 0, 1,
-1.214444, 0.8900512, 0.1929096, 1, 0.8156863, 0, 1,
-1.205103, -1.407527, -4.220834, 1, 0.8235294, 0, 1,
-1.19637, -0.3084381, -2.272007, 1, 0.827451, 0, 1,
-1.19361, 0.4177721, -1.498554, 1, 0.8352941, 0, 1,
-1.191442, -0.3742106, -1.641834, 1, 0.8392157, 0, 1,
-1.191367, 0.6842209, -1.512502, 1, 0.8470588, 0, 1,
-1.188879, -0.4242252, -1.059061, 1, 0.8509804, 0, 1,
-1.188386, -0.3508162, -2.322762, 1, 0.8588235, 0, 1,
-1.187061, 0.7884799, -2.317379, 1, 0.8627451, 0, 1,
-1.180356, 0.6165625, -1.342034, 1, 0.8705882, 0, 1,
-1.177432, 0.2838892, 0.103867, 1, 0.8745098, 0, 1,
-1.173951, -0.4946047, -1.455045, 1, 0.8823529, 0, 1,
-1.169285, -1.823117, -1.191297, 1, 0.8862745, 0, 1,
-1.168975, 2.404009, -1.994384, 1, 0.8941177, 0, 1,
-1.153043, -0.6524206, -1.317482, 1, 0.8980392, 0, 1,
-1.13746, -1.642448, -2.815799, 1, 0.9058824, 0, 1,
-1.136348, -1.356834, -2.953864, 1, 0.9137255, 0, 1,
-1.135894, 1.242014, 1.907913, 1, 0.9176471, 0, 1,
-1.127244, 1.569437, 0.1724044, 1, 0.9254902, 0, 1,
-1.115556, 0.04636568, -0.111423, 1, 0.9294118, 0, 1,
-1.114488, 0.2204778, -1.944832, 1, 0.9372549, 0, 1,
-1.096996, -0.04645331, -1.544704, 1, 0.9411765, 0, 1,
-1.091664, 0.4208842, -0.4749101, 1, 0.9490196, 0, 1,
-1.088503, -0.005971454, -0.5968253, 1, 0.9529412, 0, 1,
-1.087659, 1.482207, 0.308272, 1, 0.9607843, 0, 1,
-1.081638, -0.5796643, -0.5144042, 1, 0.9647059, 0, 1,
-1.081258, 1.009688, -0.4011461, 1, 0.972549, 0, 1,
-1.07832, 1.121595, -1.25128, 1, 0.9764706, 0, 1,
-1.0751, -0.02897411, -1.544283, 1, 0.9843137, 0, 1,
-1.072863, 0.8272876, -1.125663, 1, 0.9882353, 0, 1,
-1.065957, 0.7114174, -1.242516, 1, 0.9960784, 0, 1,
-1.058902, 0.7326417, -1.154692, 0.9960784, 1, 0, 1,
-1.053749, 0.4512688, -1.396171, 0.9921569, 1, 0, 1,
-1.04713, -1.492925, -0.6002868, 0.9843137, 1, 0, 1,
-1.045089, 1.3773, 0.4296884, 0.9803922, 1, 0, 1,
-1.044577, 0.6235642, 0.5394199, 0.972549, 1, 0, 1,
-1.035303, 1.036157, -0.6341121, 0.9686275, 1, 0, 1,
-1.028738, 0.6405078, 0.6567612, 0.9607843, 1, 0, 1,
-1.028582, 0.7629366, -0.870068, 0.9568627, 1, 0, 1,
-1.021333, 1.724955, 0.7780609, 0.9490196, 1, 0, 1,
-1.02127, -0.8639676, -4.276445, 0.945098, 1, 0, 1,
-1.007468, 0.5766247, -1.213873, 0.9372549, 1, 0, 1,
-1.000018, -0.7283802, -2.088894, 0.9333333, 1, 0, 1,
-0.9993885, 0.3316996, -1.54945, 0.9254902, 1, 0, 1,
-0.9950504, -0.3465873, -2.362609, 0.9215686, 1, 0, 1,
-0.9937463, 0.2766285, -1.090864, 0.9137255, 1, 0, 1,
-0.9908307, -0.1073885, -2.320053, 0.9098039, 1, 0, 1,
-0.9872023, -0.874956, -3.398325, 0.9019608, 1, 0, 1,
-0.9823803, 0.3144111, -1.984304, 0.8941177, 1, 0, 1,
-0.9710738, 1.186225, -1.454257, 0.8901961, 1, 0, 1,
-0.9670785, -2.174546, -1.950676, 0.8823529, 1, 0, 1,
-0.9664053, 0.2510649, -0.5271155, 0.8784314, 1, 0, 1,
-0.9585209, 0.387874, -1.05002, 0.8705882, 1, 0, 1,
-0.9569193, 1.409403, 1.062857, 0.8666667, 1, 0, 1,
-0.9506446, 0.2990331, -0.5931091, 0.8588235, 1, 0, 1,
-0.9498096, 1.397024, -0.8881184, 0.854902, 1, 0, 1,
-0.9448371, 0.3371567, -0.9380387, 0.8470588, 1, 0, 1,
-0.9400109, -1.13824, -2.362549, 0.8431373, 1, 0, 1,
-0.939095, -2.080909, -2.551702, 0.8352941, 1, 0, 1,
-0.9386852, -0.9177502, -3.307952, 0.8313726, 1, 0, 1,
-0.9327223, -0.6672088, -2.423872, 0.8235294, 1, 0, 1,
-0.9300354, 0.52034, 0.5118487, 0.8196079, 1, 0, 1,
-0.9256822, -0.4010785, -0.3984781, 0.8117647, 1, 0, 1,
-0.924737, 1.358794, -1.879783, 0.8078431, 1, 0, 1,
-0.9205015, 0.7984527, -0.5688874, 0.8, 1, 0, 1,
-0.9177321, 0.2803438, -1.720433, 0.7921569, 1, 0, 1,
-0.9162313, 1.64189, 0.3559798, 0.7882353, 1, 0, 1,
-0.91356, -1.660852, -1.674039, 0.7803922, 1, 0, 1,
-0.9096957, 1.607069, 0.2969896, 0.7764706, 1, 0, 1,
-0.9059826, -0.2376421, -3.079309, 0.7686275, 1, 0, 1,
-0.901343, -0.3226332, -0.9442736, 0.7647059, 1, 0, 1,
-0.8986422, -0.7145683, -2.541371, 0.7568628, 1, 0, 1,
-0.8963983, -0.3096244, -3.081918, 0.7529412, 1, 0, 1,
-0.8949055, -0.1741672, -2.649176, 0.7450981, 1, 0, 1,
-0.8934636, -0.593453, -3.06714, 0.7411765, 1, 0, 1,
-0.8870538, -0.5446029, -1.237211, 0.7333333, 1, 0, 1,
-0.8817273, 0.9651759, -0.9074745, 0.7294118, 1, 0, 1,
-0.8811099, 0.9144672, -0.9402111, 0.7215686, 1, 0, 1,
-0.8809214, -0.2006592, -0.7355552, 0.7176471, 1, 0, 1,
-0.8766807, -1.438989, -4.137229, 0.7098039, 1, 0, 1,
-0.8763762, -0.7903548, -1.729241, 0.7058824, 1, 0, 1,
-0.8734937, 0.09960376, -1.732715, 0.6980392, 1, 0, 1,
-0.8676915, 0.493787, -0.8955549, 0.6901961, 1, 0, 1,
-0.8629473, 0.925139, -0.6742662, 0.6862745, 1, 0, 1,
-0.8603634, 0.3672381, 0.2850625, 0.6784314, 1, 0, 1,
-0.8438948, -0.5955708, -2.55046, 0.6745098, 1, 0, 1,
-0.843738, 0.4866569, -0.3947103, 0.6666667, 1, 0, 1,
-0.8417972, 0.1566468, 0.6070354, 0.6627451, 1, 0, 1,
-0.8318268, -0.02385766, -1.447835, 0.654902, 1, 0, 1,
-0.8315577, 0.1744617, -0.1780653, 0.6509804, 1, 0, 1,
-0.8284861, -0.6084322, -3.141895, 0.6431373, 1, 0, 1,
-0.8280162, 0.5565348, -0.6978502, 0.6392157, 1, 0, 1,
-0.8216852, 1.711134, -0.5621177, 0.6313726, 1, 0, 1,
-0.8208382, -1.103132, -3.115599, 0.627451, 1, 0, 1,
-0.8197607, 1.438503, -1.527995, 0.6196079, 1, 0, 1,
-0.8192484, -0.5459563, -2.819895, 0.6156863, 1, 0, 1,
-0.8185729, -0.3416248, -2.137986, 0.6078432, 1, 0, 1,
-0.8158029, -0.08815588, -1.805928, 0.6039216, 1, 0, 1,
-0.8109829, -0.8293929, -0.3992221, 0.5960785, 1, 0, 1,
-0.8109218, 1.645784, 0.5812078, 0.5882353, 1, 0, 1,
-0.808897, -0.2345271, -1.32686, 0.5843138, 1, 0, 1,
-0.8087537, -0.8403196, -0.9214081, 0.5764706, 1, 0, 1,
-0.8068323, -0.79648, -0.6218641, 0.572549, 1, 0, 1,
-0.8026375, 0.8670849, -1.383378, 0.5647059, 1, 0, 1,
-0.7999997, 0.4861215, -0.2742392, 0.5607843, 1, 0, 1,
-0.7997575, -0.7972752, -2.347329, 0.5529412, 1, 0, 1,
-0.7979528, -0.1288241, -2.333649, 0.5490196, 1, 0, 1,
-0.7935824, 0.8781105, -1.348299, 0.5411765, 1, 0, 1,
-0.7828293, -0.9223294, -2.535511, 0.5372549, 1, 0, 1,
-0.7808602, -0.1596504, -1.901422, 0.5294118, 1, 0, 1,
-0.7600607, 0.4991524, -0.4399621, 0.5254902, 1, 0, 1,
-0.7569771, 0.6920198, -2.107058, 0.5176471, 1, 0, 1,
-0.7545816, -0.9145516, -2.756341, 0.5137255, 1, 0, 1,
-0.7536939, -0.09410401, -0.956297, 0.5058824, 1, 0, 1,
-0.7521094, -1.857727, -2.155298, 0.5019608, 1, 0, 1,
-0.7508039, 1.028236, -1.429391, 0.4941176, 1, 0, 1,
-0.7492722, -1.204136, -2.483593, 0.4862745, 1, 0, 1,
-0.744775, -0.1278505, -2.202968, 0.4823529, 1, 0, 1,
-0.7375358, 1.172488, -1.194582, 0.4745098, 1, 0, 1,
-0.7357377, 1.28275, -0.997675, 0.4705882, 1, 0, 1,
-0.7351315, -0.1426335, -1.96014, 0.4627451, 1, 0, 1,
-0.7265335, -0.4556045, -0.1538304, 0.4588235, 1, 0, 1,
-0.7225925, -0.08149122, -1.802293, 0.4509804, 1, 0, 1,
-0.7216326, 0.009561521, -0.1055618, 0.4470588, 1, 0, 1,
-0.7211427, 1.918708, -1.574223, 0.4392157, 1, 0, 1,
-0.7165539, -0.4462563, -1.606644, 0.4352941, 1, 0, 1,
-0.7154991, 1.537994, -1.354733, 0.427451, 1, 0, 1,
-0.7132823, 0.07548559, -1.088824, 0.4235294, 1, 0, 1,
-0.7132646, -0.1306495, -1.617569, 0.4156863, 1, 0, 1,
-0.7102951, -1.804996, -1.310108, 0.4117647, 1, 0, 1,
-0.7061544, 0.451494, -0.1881442, 0.4039216, 1, 0, 1,
-0.7057299, -0.5842147, -4.080952, 0.3960784, 1, 0, 1,
-0.7023723, -0.1568154, -2.347417, 0.3921569, 1, 0, 1,
-0.6989354, 0.1005847, -1.037006, 0.3843137, 1, 0, 1,
-0.6967541, 1.507938, 2.259237, 0.3803922, 1, 0, 1,
-0.6884696, 2.162537, -0.0701583, 0.372549, 1, 0, 1,
-0.6875408, 0.553633, -1.450115, 0.3686275, 1, 0, 1,
-0.6754333, 0.1071473, 0.7258902, 0.3607843, 1, 0, 1,
-0.673959, -0.9363691, -2.755334, 0.3568628, 1, 0, 1,
-0.6666789, -0.5875123, -2.319397, 0.3490196, 1, 0, 1,
-0.6665871, -1.801766, -1.759566, 0.345098, 1, 0, 1,
-0.6636679, 1.327593, -1.458251, 0.3372549, 1, 0, 1,
-0.6633531, 1.787816, -0.2138191, 0.3333333, 1, 0, 1,
-0.6594483, 1.1333, 0.5412283, 0.3254902, 1, 0, 1,
-0.6525877, 0.3072079, -1.865326, 0.3215686, 1, 0, 1,
-0.6454946, -0.4675723, -0.7320276, 0.3137255, 1, 0, 1,
-0.6440607, 0.5543494, 1.26558, 0.3098039, 1, 0, 1,
-0.6333733, -1.36696, -2.571603, 0.3019608, 1, 0, 1,
-0.6281891, 0.05211114, -1.021446, 0.2941177, 1, 0, 1,
-0.6267266, 0.3079307, -0.5278298, 0.2901961, 1, 0, 1,
-0.6250464, -1.501387, -3.037138, 0.282353, 1, 0, 1,
-0.6227422, -0.287584, -2.99125, 0.2784314, 1, 0, 1,
-0.6149211, 0.1539087, 0.3242423, 0.2705882, 1, 0, 1,
-0.6138059, -0.1374727, -2.333296, 0.2666667, 1, 0, 1,
-0.6089819, -0.9946131, -0.8699573, 0.2588235, 1, 0, 1,
-0.6075956, -0.8238067, -4.28281, 0.254902, 1, 0, 1,
-0.6018872, -1.242787, -2.878138, 0.2470588, 1, 0, 1,
-0.5976006, -3.099948, -3.98089, 0.2431373, 1, 0, 1,
-0.5964988, 1.942935, -0.172807, 0.2352941, 1, 0, 1,
-0.5906113, 1.821183, -1.921908, 0.2313726, 1, 0, 1,
-0.585112, -1.17128, -2.094087, 0.2235294, 1, 0, 1,
-0.5828589, 0.8015237, -1.257796, 0.2196078, 1, 0, 1,
-0.5794733, 0.03610361, -1.772824, 0.2117647, 1, 0, 1,
-0.5782004, 1.960306, -0.1214376, 0.2078431, 1, 0, 1,
-0.5689059, -1.15028, -2.756444, 0.2, 1, 0, 1,
-0.5681915, -0.1431475, -0.4948829, 0.1921569, 1, 0, 1,
-0.5623815, -0.9500524, -1.398838, 0.1882353, 1, 0, 1,
-0.5619764, 1.010761, -0.4026417, 0.1803922, 1, 0, 1,
-0.5617206, 0.652625, 0.3103719, 0.1764706, 1, 0, 1,
-0.560564, 0.7941325, -1.155783, 0.1686275, 1, 0, 1,
-0.5517002, -0.3043106, -2.025787, 0.1647059, 1, 0, 1,
-0.5390862, -0.5744907, -2.905872, 0.1568628, 1, 0, 1,
-0.538653, 1.366886, -0.3558642, 0.1529412, 1, 0, 1,
-0.5257913, 0.07836548, -0.1335326, 0.145098, 1, 0, 1,
-0.524062, -1.216111, -2.199241, 0.1411765, 1, 0, 1,
-0.5235783, -0.2912143, -2.520433, 0.1333333, 1, 0, 1,
-0.5219237, 1.347354, -0.9107362, 0.1294118, 1, 0, 1,
-0.5189908, 0.8777994, -1.83049, 0.1215686, 1, 0, 1,
-0.5153052, 0.420181, -0.7814018, 0.1176471, 1, 0, 1,
-0.5129464, 0.09228965, -3.831916, 0.1098039, 1, 0, 1,
-0.5106473, -0.2274115, -0.0944384, 0.1058824, 1, 0, 1,
-0.506637, 0.1914651, -2.20098, 0.09803922, 1, 0, 1,
-0.5048244, -0.4753365, -2.281269, 0.09019608, 1, 0, 1,
-0.5036983, -2.022608, -4.867999, 0.08627451, 1, 0, 1,
-0.5029135, 1.631668, -1.77965, 0.07843138, 1, 0, 1,
-0.4990928, 0.7306778, -1.247029, 0.07450981, 1, 0, 1,
-0.4981914, 1.719186, -0.2713678, 0.06666667, 1, 0, 1,
-0.4947685, 1.269565, -0.6131588, 0.0627451, 1, 0, 1,
-0.4946818, 0.04202288, -0.8220505, 0.05490196, 1, 0, 1,
-0.4934625, 0.7796062, 0.8437895, 0.05098039, 1, 0, 1,
-0.489956, 0.6807395, 0.5891591, 0.04313726, 1, 0, 1,
-0.4890479, 0.8685435, -0.7014883, 0.03921569, 1, 0, 1,
-0.4872867, -1.16355, -4.413467, 0.03137255, 1, 0, 1,
-0.4847986, -1.163787, -2.754123, 0.02745098, 1, 0, 1,
-0.4829398, 1.232679, -1.071165, 0.01960784, 1, 0, 1,
-0.4826304, 1.386211, 0.8450767, 0.01568628, 1, 0, 1,
-0.480961, -0.192206, -1.472793, 0.007843138, 1, 0, 1,
-0.4798745, -1.25837, -1.377765, 0.003921569, 1, 0, 1,
-0.4794088, -0.6363977, -1.644773, 0, 1, 0.003921569, 1,
-0.47819, -0.6105035, -2.953589, 0, 1, 0.01176471, 1,
-0.4739311, 0.2139746, 0.1057018, 0, 1, 0.01568628, 1,
-0.4700153, 0.5332491, -1.309735, 0, 1, 0.02352941, 1,
-0.4626042, 2.781142, -0.7667025, 0, 1, 0.02745098, 1,
-0.4595013, 0.2035783, -1.496368, 0, 1, 0.03529412, 1,
-0.4577183, -0.5955995, -2.709311, 0, 1, 0.03921569, 1,
-0.4577003, 0.960897, -1.380304, 0, 1, 0.04705882, 1,
-0.4515541, 0.5275924, -1.96138, 0, 1, 0.05098039, 1,
-0.4512901, 0.07191123, -0.891037, 0, 1, 0.05882353, 1,
-0.4486902, 0.9891334, 0.320935, 0, 1, 0.0627451, 1,
-0.4473976, 0.5979705, -1.205987, 0, 1, 0.07058824, 1,
-0.4470376, 0.8138558, -0.9822644, 0, 1, 0.07450981, 1,
-0.4460158, 1.30474, -0.03035636, 0, 1, 0.08235294, 1,
-0.4427205, 0.6636749, -1.452336, 0, 1, 0.08627451, 1,
-0.4402878, -0.2078649, -2.385875, 0, 1, 0.09411765, 1,
-0.4393412, -0.6006704, -3.795195, 0, 1, 0.1019608, 1,
-0.4387987, 0.8094342, 1.144682, 0, 1, 0.1058824, 1,
-0.4359063, 1.110378, -1.371441, 0, 1, 0.1137255, 1,
-0.4348693, -0.5397129, -1.175967, 0, 1, 0.1176471, 1,
-0.4343045, -1.076843, -2.018759, 0, 1, 0.1254902, 1,
-0.4337326, -0.4070607, -1.28072, 0, 1, 0.1294118, 1,
-0.4326388, -0.6890671, -4.262092, 0, 1, 0.1372549, 1,
-0.4323035, -0.6883215, -2.548293, 0, 1, 0.1411765, 1,
-0.4306796, -0.3043932, -3.710999, 0, 1, 0.1490196, 1,
-0.4269964, 0.3135721, -2.999656, 0, 1, 0.1529412, 1,
-0.4168874, 1.184871, -1.846596, 0, 1, 0.1607843, 1,
-0.4151829, 1.869995, 1.098473, 0, 1, 0.1647059, 1,
-0.4150876, 0.3106876, -4.106643, 0, 1, 0.172549, 1,
-0.4108474, -1.226687e-05, -3.102713, 0, 1, 0.1764706, 1,
-0.4063962, 0.6518071, 1.241623, 0, 1, 0.1843137, 1,
-0.4061314, -1.595854, -3.937814, 0, 1, 0.1882353, 1,
-0.4048997, 0.7558796, -1.936485, 0, 1, 0.1960784, 1,
-0.3971073, -0.346605, -3.502128, 0, 1, 0.2039216, 1,
-0.3959104, -0.6241683, -1.857558, 0, 1, 0.2078431, 1,
-0.3931426, -0.4251342, -2.671769, 0, 1, 0.2156863, 1,
-0.3921777, -1.56718, -3.243347, 0, 1, 0.2196078, 1,
-0.391851, -2.080767, -4.172161, 0, 1, 0.227451, 1,
-0.3912496, 1.106325, -0.7855343, 0, 1, 0.2313726, 1,
-0.3902449, 1.243893, 1.271169, 0, 1, 0.2392157, 1,
-0.3800085, -0.3641807, -4.201427, 0, 1, 0.2431373, 1,
-0.3782643, 0.9811237, -0.3409775, 0, 1, 0.2509804, 1,
-0.3773895, -0.6542724, -3.889501, 0, 1, 0.254902, 1,
-0.3734726, 0.5928473, -0.8877218, 0, 1, 0.2627451, 1,
-0.3728109, 0.6323324, -1.568715, 0, 1, 0.2666667, 1,
-0.3695842, -0.1210165, -0.5622234, 0, 1, 0.2745098, 1,
-0.369011, -0.03915697, -2.044576, 0, 1, 0.2784314, 1,
-0.3673, 0.9751734, -0.5838543, 0, 1, 0.2862745, 1,
-0.3661837, -0.5137162, -2.509172, 0, 1, 0.2901961, 1,
-0.3615602, 0.003212522, -1.105702, 0, 1, 0.2980392, 1,
-0.3583503, -0.164925, -2.541588, 0, 1, 0.3058824, 1,
-0.3580245, 0.1613558, -0.9185414, 0, 1, 0.3098039, 1,
-0.3573931, -1.060777, -2.672925, 0, 1, 0.3176471, 1,
-0.3554261, 0.8215998, 1.064979, 0, 1, 0.3215686, 1,
-0.3520071, -0.185959, -1.567656, 0, 1, 0.3294118, 1,
-0.3501295, 0.9960293, -2.693584, 0, 1, 0.3333333, 1,
-0.3449689, -1.634158, -1.912806, 0, 1, 0.3411765, 1,
-0.3293108, -0.2264859, -0.5593629, 0, 1, 0.345098, 1,
-0.3267742, -0.8557929, -1.981065, 0, 1, 0.3529412, 1,
-0.3252579, 0.3076312, 0.2547243, 0, 1, 0.3568628, 1,
-0.3212042, -0.9573478, -2.793335, 0, 1, 0.3647059, 1,
-0.3207332, -1.499772, -2.619446, 0, 1, 0.3686275, 1,
-0.3173912, -0.5664817, -3.078684, 0, 1, 0.3764706, 1,
-0.3165188, 1.243315, 0.2979582, 0, 1, 0.3803922, 1,
-0.3148451, 0.07365183, -0.07348328, 0, 1, 0.3882353, 1,
-0.3094289, 1.365247, -2.203597, 0, 1, 0.3921569, 1,
-0.3076238, 0.5237522, -0.8613793, 0, 1, 0.4, 1,
-0.30455, 0.9011528, -0.3085042, 0, 1, 0.4078431, 1,
-0.2999938, 0.1099409, -0.4334423, 0, 1, 0.4117647, 1,
-0.2998968, -0.9013713, -2.184669, 0, 1, 0.4196078, 1,
-0.2982916, 1.21115, 1.259344, 0, 1, 0.4235294, 1,
-0.2974764, -1.447945, -3.732401, 0, 1, 0.4313726, 1,
-0.2948657, 0.2789105, -0.2533516, 0, 1, 0.4352941, 1,
-0.2927316, 1.094913, 0.9053524, 0, 1, 0.4431373, 1,
-0.2876688, -1.575106, -2.653158, 0, 1, 0.4470588, 1,
-0.2875628, -0.9098994, -3.887668, 0, 1, 0.454902, 1,
-0.2835431, 1.386777, -0.9268467, 0, 1, 0.4588235, 1,
-0.2821185, -0.6423882, -3.836927, 0, 1, 0.4666667, 1,
-0.281768, 0.7579144, -1.882267, 0, 1, 0.4705882, 1,
-0.2816474, 0.5406932, -1.128613, 0, 1, 0.4784314, 1,
-0.2771777, -0.7261783, -1.58724, 0, 1, 0.4823529, 1,
-0.2763201, 1.153636, 0.2582293, 0, 1, 0.4901961, 1,
-0.2733681, -0.187113, -2.573509, 0, 1, 0.4941176, 1,
-0.2684163, 1.318352, 1.388986, 0, 1, 0.5019608, 1,
-0.259422, -1.858884, -1.530362, 0, 1, 0.509804, 1,
-0.2557847, 0.7271122, -0.2090989, 0, 1, 0.5137255, 1,
-0.2549542, 0.8866734, 0.5024253, 0, 1, 0.5215687, 1,
-0.2541153, -0.2630296, -2.021097, 0, 1, 0.5254902, 1,
-0.2503691, 0.2596882, -2.642625, 0, 1, 0.5333334, 1,
-0.2446221, 0.9533213, -1.254181, 0, 1, 0.5372549, 1,
-0.2440937, -0.4583736, -3.903702, 0, 1, 0.5450981, 1,
-0.2374709, 0.8590771, -1.290588, 0, 1, 0.5490196, 1,
-0.233457, 2.338334, -1.663035, 0, 1, 0.5568628, 1,
-0.2329782, -1.742615, -4.075892, 0, 1, 0.5607843, 1,
-0.2299779, 0.06140929, -0.8062176, 0, 1, 0.5686275, 1,
-0.2291179, -0.1176915, -1.244253, 0, 1, 0.572549, 1,
-0.2290764, -0.4158354, -2.398458, 0, 1, 0.5803922, 1,
-0.2275291, 0.2155705, -1.452554, 0, 1, 0.5843138, 1,
-0.2252014, -0.1325776, -0.9826212, 0, 1, 0.5921569, 1,
-0.2090599, 0.8849226, -1.121278, 0, 1, 0.5960785, 1,
-0.2089374, -0.1355639, -3.283569, 0, 1, 0.6039216, 1,
-0.2041239, -0.6905116, -2.174178, 0, 1, 0.6117647, 1,
-0.1956356, -0.8114704, -3.154755, 0, 1, 0.6156863, 1,
-0.1953597, 0.6130775, -2.17555, 0, 1, 0.6235294, 1,
-0.1933716, 0.6346814, -1.150137, 0, 1, 0.627451, 1,
-0.1916502, -1.191866, -3.195086, 0, 1, 0.6352941, 1,
-0.190378, 1.473918, 0.289558, 0, 1, 0.6392157, 1,
-0.1900782, -0.9582215, -2.462869, 0, 1, 0.6470588, 1,
-0.1866676, -0.8233353, -3.165582, 0, 1, 0.6509804, 1,
-0.181301, -0.88457, -3.849866, 0, 1, 0.6588235, 1,
-0.1800462, 0.5613672, -0.4040689, 0, 1, 0.6627451, 1,
-0.1790442, -1.554038, -2.383866, 0, 1, 0.6705883, 1,
-0.172151, -0.799432, -2.488398, 0, 1, 0.6745098, 1,
-0.1712941, -0.1201554, -0.08816125, 0, 1, 0.682353, 1,
-0.1581746, -0.09873994, -1.791984, 0, 1, 0.6862745, 1,
-0.1568417, -0.5381311, -2.895489, 0, 1, 0.6941177, 1,
-0.1554952, 0.2655164, -1.497018, 0, 1, 0.7019608, 1,
-0.1544313, 0.9108576, -0.6428597, 0, 1, 0.7058824, 1,
-0.1538142, -0.2070521, -4.177534, 0, 1, 0.7137255, 1,
-0.1476604, 0.7604966, -2.77017, 0, 1, 0.7176471, 1,
-0.1473208, 0.3585597, 0.4821975, 0, 1, 0.7254902, 1,
-0.1463948, -0.516688, -3.916875, 0, 1, 0.7294118, 1,
-0.146363, -0.00201462, -0.2001071, 0, 1, 0.7372549, 1,
-0.1454777, -0.3796035, -3.743012, 0, 1, 0.7411765, 1,
-0.1445028, 1.345734, 0.6105154, 0, 1, 0.7490196, 1,
-0.1443717, -0.2482364, -3.298702, 0, 1, 0.7529412, 1,
-0.1438547, 0.009302046, -2.502148, 0, 1, 0.7607843, 1,
-0.1437726, 0.2804465, -1.067402, 0, 1, 0.7647059, 1,
-0.1412735, -0.5137089, -3.094727, 0, 1, 0.772549, 1,
-0.1407658, 1.263819, -0.2767652, 0, 1, 0.7764706, 1,
-0.1337823, -3.092094, -1.137394, 0, 1, 0.7843137, 1,
-0.1299357, -0.3908827, -4.511063, 0, 1, 0.7882353, 1,
-0.1276379, 0.5373192, -0.3493165, 0, 1, 0.7960784, 1,
-0.1254698, -0.3589452, -1.704764, 0, 1, 0.8039216, 1,
-0.1226831, -0.0341878, -2.627064, 0, 1, 0.8078431, 1,
-0.1200703, 1.027942, 0.4259141, 0, 1, 0.8156863, 1,
-0.1184792, 0.5214476, -1.754956, 0, 1, 0.8196079, 1,
-0.1106683, 0.4526686, -1.493918, 0, 1, 0.827451, 1,
-0.1096693, 1.134112, 1.198074, 0, 1, 0.8313726, 1,
-0.1037072, -1.245014, -2.603854, 0, 1, 0.8392157, 1,
-0.102246, -0.4168725, -2.313316, 0, 1, 0.8431373, 1,
-0.1010819, 1.273828, 1.324851, 0, 1, 0.8509804, 1,
-0.09858343, 1.268204, 1.383526, 0, 1, 0.854902, 1,
-0.09446595, -0.5729172, -3.723618, 0, 1, 0.8627451, 1,
-0.09263594, 1.288429, 0.2254551, 0, 1, 0.8666667, 1,
-0.08955839, 0.7911024, 1.242975, 0, 1, 0.8745098, 1,
-0.08460719, 0.3698406, -2.120154, 0, 1, 0.8784314, 1,
-0.07947943, 0.05370663, 0.6853507, 0, 1, 0.8862745, 1,
-0.07760448, 0.2415971, -0.7985786, 0, 1, 0.8901961, 1,
-0.07747114, 1.570948, -0.009222445, 0, 1, 0.8980392, 1,
-0.07495388, -0.159702, -3.460766, 0, 1, 0.9058824, 1,
-0.06982662, -1.433804, -2.602817, 0, 1, 0.9098039, 1,
-0.06936784, 0.5778252, -0.4009513, 0, 1, 0.9176471, 1,
-0.0689762, 1.854922, 0.9887071, 0, 1, 0.9215686, 1,
-0.06285273, 1.071443, 0.3301337, 0, 1, 0.9294118, 1,
-0.05865221, -0.5564619, -4.176223, 0, 1, 0.9333333, 1,
-0.05745561, -0.4197623, -2.109976, 0, 1, 0.9411765, 1,
-0.05709578, 1.413812, 1.363312, 0, 1, 0.945098, 1,
-0.0561638, -1.182385, -2.576867, 0, 1, 0.9529412, 1,
-0.05604864, -0.2951746, -2.958345, 0, 1, 0.9568627, 1,
-0.05255777, 1.170946, -0.4704255, 0, 1, 0.9647059, 1,
-0.05161461, 0.5631505, -1.966436, 0, 1, 0.9686275, 1,
-0.04365448, 0.01646834, -1.318278, 0, 1, 0.9764706, 1,
-0.04177, 1.248027, 0.4316391, 0, 1, 0.9803922, 1,
-0.04085597, -2.479601, -3.889086, 0, 1, 0.9882353, 1,
-0.0403729, 0.4095227, 1.245864, 0, 1, 0.9921569, 1,
-0.04018878, 0.5784622, -1.304715, 0, 1, 1, 1,
-0.03944012, 2.503027, 0.3878674, 0, 0.9921569, 1, 1,
-0.03927158, -0.7718849, -2.150235, 0, 0.9882353, 1, 1,
-0.037963, -0.5797532, -3.725706, 0, 0.9803922, 1, 1,
-0.0372554, 2.53748, 0.5482917, 0, 0.9764706, 1, 1,
-0.03546117, -0.3312846, -0.8704109, 0, 0.9686275, 1, 1,
-0.03317117, -1.283212, -3.713992, 0, 0.9647059, 1, 1,
-0.0267283, 0.5884361, 0.1434915, 0, 0.9568627, 1, 1,
-0.02313306, -0.2930207, -3.669209, 0, 0.9529412, 1, 1,
-0.02249969, -0.1573436, -1.179467, 0, 0.945098, 1, 1,
-0.02128232, 0.02252101, -0.4410993, 0, 0.9411765, 1, 1,
-0.01813677, -1.644957, -1.164404, 0, 0.9333333, 1, 1,
-0.01579307, -0.4370629, -3.274402, 0, 0.9294118, 1, 1,
-0.01540099, 1.704673, 0.8166232, 0, 0.9215686, 1, 1,
-0.0136069, 0.3711071, -0.9837223, 0, 0.9176471, 1, 1,
-0.01344931, -0.3591585, -2.965388, 0, 0.9098039, 1, 1,
-0.007886592, 0.2968957, 0.3436547, 0, 0.9058824, 1, 1,
-0.004815807, 0.04773956, -0.3266814, 0, 0.8980392, 1, 1,
-0.00464897, -1.665385, -2.714512, 0, 0.8901961, 1, 1,
0.0008362495, 0.9385576, -2.083277, 0, 0.8862745, 1, 1,
0.009302945, 1.328946, 0.2695581, 0, 0.8784314, 1, 1,
0.009623172, 0.8978662, 0.5305578, 0, 0.8745098, 1, 1,
0.01010716, -0.002918052, 1.684533, 0, 0.8666667, 1, 1,
0.01452231, 0.3192542, 0.9101192, 0, 0.8627451, 1, 1,
0.01622831, -0.8319803, 1.644779, 0, 0.854902, 1, 1,
0.01782839, -0.8429322, 3.473865, 0, 0.8509804, 1, 1,
0.02096983, -0.4547246, 2.46456, 0, 0.8431373, 1, 1,
0.0212303, -0.02223221, 2.655577, 0, 0.8392157, 1, 1,
0.02274556, 0.458452, 1.11222, 0, 0.8313726, 1, 1,
0.02348366, -0.4514112, 2.700835, 0, 0.827451, 1, 1,
0.024551, -0.06644484, 3.856646, 0, 0.8196079, 1, 1,
0.02901351, -0.9978641, 2.959803, 0, 0.8156863, 1, 1,
0.03202929, -0.04625401, 1.748807, 0, 0.8078431, 1, 1,
0.0356737, -0.5502336, 2.401733, 0, 0.8039216, 1, 1,
0.03714235, 0.512764, -0.7546792, 0, 0.7960784, 1, 1,
0.03876753, -0.8152159, 2.956378, 0, 0.7882353, 1, 1,
0.04143377, -0.2007805, 4.973228, 0, 0.7843137, 1, 1,
0.044262, 0.3208911, 1.272988, 0, 0.7764706, 1, 1,
0.04432169, -0.7500356, 1.739887, 0, 0.772549, 1, 1,
0.04976007, 0.02674147, -0.01648935, 0, 0.7647059, 1, 1,
0.05000709, -1.643826, 3.466724, 0, 0.7607843, 1, 1,
0.05560976, -0.3304868, 2.997899, 0, 0.7529412, 1, 1,
0.05743503, 0.7817512, 0.1290266, 0, 0.7490196, 1, 1,
0.05840456, 0.9061845, 1.648868, 0, 0.7411765, 1, 1,
0.06091615, 0.7537025, -0.000468747, 0, 0.7372549, 1, 1,
0.06393392, 0.580093, 1.106857, 0, 0.7294118, 1, 1,
0.06446903, -1.6974, 3.326405, 0, 0.7254902, 1, 1,
0.0690888, -0.04868367, 4.195117, 0, 0.7176471, 1, 1,
0.07401764, 0.6654958, -1.251623, 0, 0.7137255, 1, 1,
0.07872014, -0.6457856, 4.436742, 0, 0.7058824, 1, 1,
0.07873619, 0.05229845, 0.3557929, 0, 0.6980392, 1, 1,
0.07997561, 0.1271524, -0.3894094, 0, 0.6941177, 1, 1,
0.0841352, 1.279215, -0.4625946, 0, 0.6862745, 1, 1,
0.08461822, 1.453457, -0.6885855, 0, 0.682353, 1, 1,
0.08883319, -0.4237218, 3.13605, 0, 0.6745098, 1, 1,
0.09301394, 0.1594114, 1.55308, 0, 0.6705883, 1, 1,
0.09402698, -0.05660123, 2.264393, 0, 0.6627451, 1, 1,
0.09783113, 0.2316792, 0.9886082, 0, 0.6588235, 1, 1,
0.09852639, 1.031158, -1.486283, 0, 0.6509804, 1, 1,
0.09854231, -0.04663601, 2.920933, 0, 0.6470588, 1, 1,
0.1017391, -1.585291, 2.674402, 0, 0.6392157, 1, 1,
0.1074668, -0.09475681, 3.724399, 0, 0.6352941, 1, 1,
0.1103778, 0.1708239, 1.333951, 0, 0.627451, 1, 1,
0.1146126, -1.146922, 2.733233, 0, 0.6235294, 1, 1,
0.1160879, 0.2911959, 0.7864977, 0, 0.6156863, 1, 1,
0.1199132, 1.268534, 0.3084192, 0, 0.6117647, 1, 1,
0.1247336, 2.238224, 0.01957372, 0, 0.6039216, 1, 1,
0.1280142, -0.489453, 4.64752, 0, 0.5960785, 1, 1,
0.1280996, 0.3166879, 1.586097, 0, 0.5921569, 1, 1,
0.1284447, -0.6753371, 0.9744384, 0, 0.5843138, 1, 1,
0.129993, -1.067906, 3.047134, 0, 0.5803922, 1, 1,
0.1313976, -0.4036213, 3.199075, 0, 0.572549, 1, 1,
0.1414873, 1.747181, -1.95893, 0, 0.5686275, 1, 1,
0.1437034, -1.365154, 3.490862, 0, 0.5607843, 1, 1,
0.148235, 1.422642, 2.047901, 0, 0.5568628, 1, 1,
0.1517227, -0.8338672, 2.592263, 0, 0.5490196, 1, 1,
0.1518086, 0.8518081, 1.490488, 0, 0.5450981, 1, 1,
0.1529321, 1.490463, -0.8876386, 0, 0.5372549, 1, 1,
0.1550247, -1.067982, 2.921839, 0, 0.5333334, 1, 1,
0.1552763, -1.6504, 3.617805, 0, 0.5254902, 1, 1,
0.1558611, 1.044676, 1.57942, 0, 0.5215687, 1, 1,
0.1597722, -1.562684, 1.771357, 0, 0.5137255, 1, 1,
0.1599837, -0.2788464, 2.061087, 0, 0.509804, 1, 1,
0.1606429, -3.031353, 1.499166, 0, 0.5019608, 1, 1,
0.1630897, 1.526687, -2.105657, 0, 0.4941176, 1, 1,
0.1632428, -1.45283, 2.339916, 0, 0.4901961, 1, 1,
0.1660445, 0.1533232, 1.185379, 0, 0.4823529, 1, 1,
0.1680818, 0.3089126, 0.4553065, 0, 0.4784314, 1, 1,
0.1709363, 0.3388652, 1.539967, 0, 0.4705882, 1, 1,
0.1711774, -0.5379921, 2.972247, 0, 0.4666667, 1, 1,
0.1723402, 1.651145, -0.08074047, 0, 0.4588235, 1, 1,
0.1762791, -1.644318, 2.279861, 0, 0.454902, 1, 1,
0.1769548, -0.254497, 2.678328, 0, 0.4470588, 1, 1,
0.1788267, -0.4887082, 3.383458, 0, 0.4431373, 1, 1,
0.1857186, 0.2437735, 1.564771, 0, 0.4352941, 1, 1,
0.1925487, -0.7027166, 2.672024, 0, 0.4313726, 1, 1,
0.1951564, -0.7043849, 3.151066, 0, 0.4235294, 1, 1,
0.1957171, -0.3729, 1.431741, 0, 0.4196078, 1, 1,
0.1992469, 0.4904118, 2.186516, 0, 0.4117647, 1, 1,
0.1993896, 0.4897194, -0.3279811, 0, 0.4078431, 1, 1,
0.1997088, -1.508489, 0.8983858, 0, 0.4, 1, 1,
0.2051702, -1.040671, 1.37909, 0, 0.3921569, 1, 1,
0.2054703, 0.3468549, 0.844739, 0, 0.3882353, 1, 1,
0.2082435, 0.6331174, -0.09060937, 0, 0.3803922, 1, 1,
0.211492, 0.3977956, 0.4471636, 0, 0.3764706, 1, 1,
0.2162864, 1.201597, 0.4808487, 0, 0.3686275, 1, 1,
0.2164592, -1.192568, 1.495135, 0, 0.3647059, 1, 1,
0.2165079, -2.567647, 3.136689, 0, 0.3568628, 1, 1,
0.2188119, -0.7369431, 0.4454811, 0, 0.3529412, 1, 1,
0.2220214, -0.7561755, 3.458874, 0, 0.345098, 1, 1,
0.2257394, -0.5462081, 2.833447, 0, 0.3411765, 1, 1,
0.2258282, -1.07476, 2.194932, 0, 0.3333333, 1, 1,
0.2261247, 2.378355, -0.4177525, 0, 0.3294118, 1, 1,
0.2315371, -0.6068718, 2.98566, 0, 0.3215686, 1, 1,
0.2368864, -0.2006399, 3.182969, 0, 0.3176471, 1, 1,
0.237122, -1.135841, 2.753094, 0, 0.3098039, 1, 1,
0.2382997, 1.014916, 0.02820743, 0, 0.3058824, 1, 1,
0.2388373, 0.881187, -0.1968217, 0, 0.2980392, 1, 1,
0.240825, -1.004397, 3.212835, 0, 0.2901961, 1, 1,
0.2421387, 0.449218, 0.8752844, 0, 0.2862745, 1, 1,
0.2443247, -1.531992, 2.682492, 0, 0.2784314, 1, 1,
0.2450837, -0.2706471, 1.388423, 0, 0.2745098, 1, 1,
0.2451342, -1.295325, 2.373248, 0, 0.2666667, 1, 1,
0.2467733, -0.0736981, 0.8162283, 0, 0.2627451, 1, 1,
0.2517465, -0.330016, 0.8819166, 0, 0.254902, 1, 1,
0.2535722, 0.2126129, 0.3965993, 0, 0.2509804, 1, 1,
0.254593, 1.309289, 1.667925, 0, 0.2431373, 1, 1,
0.2547593, 0.2850536, 0.805696, 0, 0.2392157, 1, 1,
0.2581583, 0.5954555, 0.2693882, 0, 0.2313726, 1, 1,
0.2582901, 0.01350874, 1.363482, 0, 0.227451, 1, 1,
0.2601072, 0.7888646, 1.095741, 0, 0.2196078, 1, 1,
0.2644938, -2.146194, 3.43518, 0, 0.2156863, 1, 1,
0.2687461, -0.01373163, 3.427092, 0, 0.2078431, 1, 1,
0.269778, 0.4992702, 1.613301, 0, 0.2039216, 1, 1,
0.2778673, 0.4554839, 0.6667908, 0, 0.1960784, 1, 1,
0.2810518, -0.7487232, 3.937989, 0, 0.1882353, 1, 1,
0.2881005, 0.921351, -0.3658173, 0, 0.1843137, 1, 1,
0.2897147, -1.042832, 3.36261, 0, 0.1764706, 1, 1,
0.2935282, 0.1616399, 3.053785, 0, 0.172549, 1, 1,
0.2956549, -0.03944797, 1.212598, 0, 0.1647059, 1, 1,
0.2964941, -0.5872043, 2.511844, 0, 0.1607843, 1, 1,
0.2989189, -1.285442, 2.239479, 0, 0.1529412, 1, 1,
0.2992478, -0.3413555, 3.143163, 0, 0.1490196, 1, 1,
0.3104358, 0.987195, 1.845399, 0, 0.1411765, 1, 1,
0.3197952, -0.2384131, 0.3313177, 0, 0.1372549, 1, 1,
0.3214963, -0.7764888, 3.02031, 0, 0.1294118, 1, 1,
0.3222937, -1.564011, 2.024126, 0, 0.1254902, 1, 1,
0.3243794, 1.277545, 0.5830519, 0, 0.1176471, 1, 1,
0.3306299, 0.06522959, 2.019641, 0, 0.1137255, 1, 1,
0.3323382, 1.065868, 2.13733, 0, 0.1058824, 1, 1,
0.3332096, -0.3893319, 2.554995, 0, 0.09803922, 1, 1,
0.333273, 0.2479184, 0.09775468, 0, 0.09411765, 1, 1,
0.3334427, -0.1144611, 0.6493385, 0, 0.08627451, 1, 1,
0.3339632, 0.1325828, 0.4688814, 0, 0.08235294, 1, 1,
0.3381044, -0.3243912, 2.762127, 0, 0.07450981, 1, 1,
0.3387028, 0.9932888, 1.029803, 0, 0.07058824, 1, 1,
0.3400474, 0.8454859, 1.274589, 0, 0.0627451, 1, 1,
0.3411267, -0.161199, 2.304023, 0, 0.05882353, 1, 1,
0.3444637, 0.8429773, -0.2998088, 0, 0.05098039, 1, 1,
0.3458675, -1.259604, 2.955726, 0, 0.04705882, 1, 1,
0.3461839, -0.01067947, -0.09995973, 0, 0.03921569, 1, 1,
0.3469328, 0.9421977, 1.814905, 0, 0.03529412, 1, 1,
0.3481645, 0.4248337, 0.6326818, 0, 0.02745098, 1, 1,
0.3503832, 2.172328, 0.05351489, 0, 0.02352941, 1, 1,
0.3596391, -0.1678091, 0.8029298, 0, 0.01568628, 1, 1,
0.3605985, 0.3044805, -0.5021068, 0, 0.01176471, 1, 1,
0.3705976, -0.072342, 1.28719, 0, 0.003921569, 1, 1,
0.3752939, -0.04707619, 0.5454561, 0.003921569, 0, 1, 1,
0.382902, -0.8834399, 2.008909, 0.007843138, 0, 1, 1,
0.384146, -0.1763151, 0.1765371, 0.01568628, 0, 1, 1,
0.3861836, 0.4811338, 1.39933, 0.01960784, 0, 1, 1,
0.3869703, -1.548029, 2.628434, 0.02745098, 0, 1, 1,
0.3879036, 1.31922, 0.3843019, 0.03137255, 0, 1, 1,
0.3883571, 0.445729, 2.22137, 0.03921569, 0, 1, 1,
0.3888042, -0.2679712, 0.6314955, 0.04313726, 0, 1, 1,
0.3946072, 0.08784172, 1.299612, 0.05098039, 0, 1, 1,
0.3962069, -0.6471223, 2.512082, 0.05490196, 0, 1, 1,
0.3972302, 0.9821907, 0.08620515, 0.0627451, 0, 1, 1,
0.3991753, 0.009350961, 1.266315, 0.06666667, 0, 1, 1,
0.39976, 0.5573691, 0.9974666, 0.07450981, 0, 1, 1,
0.405422, 1.749759, 0.7196638, 0.07843138, 0, 1, 1,
0.4068022, -1.017247, 3.319179, 0.08627451, 0, 1, 1,
0.409823, -0.5081698, 2.440167, 0.09019608, 0, 1, 1,
0.4101637, -0.3972739, 2.49508, 0.09803922, 0, 1, 1,
0.4115298, 2.129395, 0.9981105, 0.1058824, 0, 1, 1,
0.4122331, 0.6944757, 0.04808548, 0.1098039, 0, 1, 1,
0.4317834, 1.323777, -0.1986842, 0.1176471, 0, 1, 1,
0.43355, -1.147207, 2.131833, 0.1215686, 0, 1, 1,
0.4367858, -0.649636, 2.980916, 0.1294118, 0, 1, 1,
0.4418176, 0.009684785, 1.084592, 0.1333333, 0, 1, 1,
0.4504401, 1.217839, 0.06559843, 0.1411765, 0, 1, 1,
0.4524766, 0.1617388, -0.07867781, 0.145098, 0, 1, 1,
0.4524775, 0.3810436, 2.43575, 0.1529412, 0, 1, 1,
0.4547676, 1.346836, -0.01477164, 0.1568628, 0, 1, 1,
0.4577588, 1.849573, 0.7170832, 0.1647059, 0, 1, 1,
0.4585923, 0.3948441, 2.017428, 0.1686275, 0, 1, 1,
0.4606545, 0.03079394, 2.516905, 0.1764706, 0, 1, 1,
0.461394, -0.02972736, 0.2333371, 0.1803922, 0, 1, 1,
0.4622776, -0.739363, 2.111345, 0.1882353, 0, 1, 1,
0.4633165, -0.02058535, 0.5425087, 0.1921569, 0, 1, 1,
0.4687652, 0.5427628, 1.296952, 0.2, 0, 1, 1,
0.4715843, -0.4828481, 3.024348, 0.2078431, 0, 1, 1,
0.4760902, -0.1318319, 2.465296, 0.2117647, 0, 1, 1,
0.4810055, 1.968469, -0.9702637, 0.2196078, 0, 1, 1,
0.4850478, -1.455391, 1.311158, 0.2235294, 0, 1, 1,
0.485613, 0.796398, 0.2738975, 0.2313726, 0, 1, 1,
0.4896125, -0.2156307, 1.204721, 0.2352941, 0, 1, 1,
0.4917886, 1.080603, 1.073997, 0.2431373, 0, 1, 1,
0.4932063, 0.4771268, 0.5009297, 0.2470588, 0, 1, 1,
0.4934405, -1.59684, 1.887985, 0.254902, 0, 1, 1,
0.4968943, -1.851112, 2.980418, 0.2588235, 0, 1, 1,
0.4971536, 1.084495, 0.8350158, 0.2666667, 0, 1, 1,
0.4976972, 0.791379, 1.146188, 0.2705882, 0, 1, 1,
0.4987706, 1.221435, -0.3788053, 0.2784314, 0, 1, 1,
0.5082111, 0.7276545, -1.049293, 0.282353, 0, 1, 1,
0.5103549, 1.043185, 1.005495, 0.2901961, 0, 1, 1,
0.5245043, -0.07597732, 1.308455, 0.2941177, 0, 1, 1,
0.5258592, -0.1367946, 1.100843, 0.3019608, 0, 1, 1,
0.5302291, 0.3741838, 3.009752, 0.3098039, 0, 1, 1,
0.5313385, 0.9882347, 0.6604986, 0.3137255, 0, 1, 1,
0.5348892, 0.381166, 0.8255204, 0.3215686, 0, 1, 1,
0.5349842, 0.592473, 1.602961, 0.3254902, 0, 1, 1,
0.542152, 0.7560803, 0.3274651, 0.3333333, 0, 1, 1,
0.542649, -0.4647495, 2.475999, 0.3372549, 0, 1, 1,
0.5430101, -0.4627318, 1.455828, 0.345098, 0, 1, 1,
0.5440562, 0.08986551, 1.694929, 0.3490196, 0, 1, 1,
0.5446579, -1.127735, 2.441828, 0.3568628, 0, 1, 1,
0.5446872, -1.046031, 2.600254, 0.3607843, 0, 1, 1,
0.5492178, -0.3980927, 2.388876, 0.3686275, 0, 1, 1,
0.5590584, 0.2117139, 1.645925, 0.372549, 0, 1, 1,
0.5647604, 0.629625, 0.724561, 0.3803922, 0, 1, 1,
0.5706074, 0.4101606, 1.083369, 0.3843137, 0, 1, 1,
0.5728356, 0.5112627, -0.08129712, 0.3921569, 0, 1, 1,
0.5732492, -1.536767, 3.032574, 0.3960784, 0, 1, 1,
0.5737142, -1.038237, 1.858988, 0.4039216, 0, 1, 1,
0.5763763, -0.3077259, 3.496741, 0.4117647, 0, 1, 1,
0.5786528, 1.174992, 0.6695754, 0.4156863, 0, 1, 1,
0.5789585, 0.238798, 1.469232, 0.4235294, 0, 1, 1,
0.5798289, 1.077472, 1.824497, 0.427451, 0, 1, 1,
0.5801157, -0.2851282, 2.147554, 0.4352941, 0, 1, 1,
0.5835686, -1.012775, 1.202865, 0.4392157, 0, 1, 1,
0.5865415, -1.739449, 4.54741, 0.4470588, 0, 1, 1,
0.5881575, 0.660879, -2.005841, 0.4509804, 0, 1, 1,
0.5889399, 0.0110781, 1.391242, 0.4588235, 0, 1, 1,
0.5911438, -0.4047198, 1.855876, 0.4627451, 0, 1, 1,
0.5927804, 0.407649, 1.539359, 0.4705882, 0, 1, 1,
0.5999756, 1.488235, 0.5759625, 0.4745098, 0, 1, 1,
0.6001874, -0.3150298, 3.126799, 0.4823529, 0, 1, 1,
0.6016704, -0.56621, 1.405126, 0.4862745, 0, 1, 1,
0.602228, -0.58735, 2.012002, 0.4941176, 0, 1, 1,
0.6065818, 1.015395, 0.6243657, 0.5019608, 0, 1, 1,
0.6150233, 2.077157, 0.04537758, 0.5058824, 0, 1, 1,
0.6170242, -1.111889, 3.255871, 0.5137255, 0, 1, 1,
0.6182845, -1.094683, 1.856539, 0.5176471, 0, 1, 1,
0.6191561, -0.5425711, 1.239903, 0.5254902, 0, 1, 1,
0.6236067, -0.5173649, 1.055144, 0.5294118, 0, 1, 1,
0.623808, 0.1745142, 0.6550182, 0.5372549, 0, 1, 1,
0.6308761, 0.7711369, -0.7392802, 0.5411765, 0, 1, 1,
0.6319867, 1.277916, 0.862294, 0.5490196, 0, 1, 1,
0.6331199, -1.705226, 2.250256, 0.5529412, 0, 1, 1,
0.6408296, -0.1316077, 3.362902, 0.5607843, 0, 1, 1,
0.6411243, 1.392218, -0.4089297, 0.5647059, 0, 1, 1,
0.6466644, -1.986871, 4.423899, 0.572549, 0, 1, 1,
0.6488392, 0.8801646, 0.8380335, 0.5764706, 0, 1, 1,
0.6490671, 1.047951, 0.4260012, 0.5843138, 0, 1, 1,
0.651998, 1.664202, 3.20754, 0.5882353, 0, 1, 1,
0.6600811, 0.2451446, 2.279188, 0.5960785, 0, 1, 1,
0.6651299, 1.227884, -0.4776015, 0.6039216, 0, 1, 1,
0.6672259, -1.402098, 2.567488, 0.6078432, 0, 1, 1,
0.6676906, -0.6958156, 4.68045, 0.6156863, 0, 1, 1,
0.6681585, -1.021271, 3.593206, 0.6196079, 0, 1, 1,
0.6683096, 1.189403, 0.3047523, 0.627451, 0, 1, 1,
0.6754284, 0.4684817, 0.9690084, 0.6313726, 0, 1, 1,
0.6767768, 2.151577, 0.7691144, 0.6392157, 0, 1, 1,
0.6777088, -0.1730353, 1.967003, 0.6431373, 0, 1, 1,
0.6778145, -0.4428418, 2.341805, 0.6509804, 0, 1, 1,
0.6780255, 1.513535, 0.6912459, 0.654902, 0, 1, 1,
0.6798364, 0.5827856, 1.381956, 0.6627451, 0, 1, 1,
0.6818975, -0.4046376, 1.286048, 0.6666667, 0, 1, 1,
0.6822467, 0.9980037, 1.012398, 0.6745098, 0, 1, 1,
0.6835742, 1.46116, 0.196166, 0.6784314, 0, 1, 1,
0.6843868, 0.09749688, 2.100266, 0.6862745, 0, 1, 1,
0.6852221, -0.1509852, 2.827134, 0.6901961, 0, 1, 1,
0.6856533, 0.5744883, 0.5515097, 0.6980392, 0, 1, 1,
0.688341, -0.09195447, 0.9620894, 0.7058824, 0, 1, 1,
0.6975265, 0.06593241, 0.3994851, 0.7098039, 0, 1, 1,
0.7029766, 0.9859607, 0.1553155, 0.7176471, 0, 1, 1,
0.7037416, -0.3138856, 0.6060039, 0.7215686, 0, 1, 1,
0.7048864, -0.1122213, 2.177043, 0.7294118, 0, 1, 1,
0.7067255, -1.050319, 2.689369, 0.7333333, 0, 1, 1,
0.7071292, 1.337547, 0.7010235, 0.7411765, 0, 1, 1,
0.7074191, 1.047564, 1.12958, 0.7450981, 0, 1, 1,
0.7079107, 0.1884881, 1.850069, 0.7529412, 0, 1, 1,
0.7103481, 0.9591448, 1.160239, 0.7568628, 0, 1, 1,
0.7120262, -0.579627, 3.785735, 0.7647059, 0, 1, 1,
0.71395, -0.7865783, 2.604401, 0.7686275, 0, 1, 1,
0.7152472, -0.8385565, 2.239483, 0.7764706, 0, 1, 1,
0.7193552, 0.5434066, 0.9347394, 0.7803922, 0, 1, 1,
0.721877, -0.211215, 3.204171, 0.7882353, 0, 1, 1,
0.72554, 0.1500233, 1.041474, 0.7921569, 0, 1, 1,
0.7320304, -1.604434, 1.481187, 0.8, 0, 1, 1,
0.7488586, -1.585518, 1.107419, 0.8078431, 0, 1, 1,
0.7490935, 1.151866, -0.05877067, 0.8117647, 0, 1, 1,
0.7505559, -1.492981, 1.646489, 0.8196079, 0, 1, 1,
0.7570892, 1.257475, 0.2351511, 0.8235294, 0, 1, 1,
0.7578583, 1.507277, 1.406556, 0.8313726, 0, 1, 1,
0.759128, 0.835547, -0.4008313, 0.8352941, 0, 1, 1,
0.7649379, -0.5945917, 1.651241, 0.8431373, 0, 1, 1,
0.7665582, -2.442747, 3.18564, 0.8470588, 0, 1, 1,
0.766616, -0.2647154, 0.6809973, 0.854902, 0, 1, 1,
0.7714333, -1.687515, 1.653243, 0.8588235, 0, 1, 1,
0.771633, -0.2707867, 0.3252536, 0.8666667, 0, 1, 1,
0.7782921, 0.1177197, 3.022754, 0.8705882, 0, 1, 1,
0.7824311, 1.514461, 0.5318402, 0.8784314, 0, 1, 1,
0.7862774, -0.6422172, 2.022834, 0.8823529, 0, 1, 1,
0.7943784, 1.454599, -0.2234134, 0.8901961, 0, 1, 1,
0.7986594, 0.25034, 0.7953711, 0.8941177, 0, 1, 1,
0.7989853, 0.5328219, 0.6838787, 0.9019608, 0, 1, 1,
0.8018432, -1.166186, 1.36154, 0.9098039, 0, 1, 1,
0.8046038, 0.1336119, 1.145162, 0.9137255, 0, 1, 1,
0.806496, -1.032694, 2.231911, 0.9215686, 0, 1, 1,
0.8068565, -1.507453, 0.6431003, 0.9254902, 0, 1, 1,
0.8107, -0.05948965, 0.3317199, 0.9333333, 0, 1, 1,
0.8125252, 1.676842, -0.02088009, 0.9372549, 0, 1, 1,
0.8184772, -0.002058977, 0.9693037, 0.945098, 0, 1, 1,
0.8208885, 1.152705, -0.8845151, 0.9490196, 0, 1, 1,
0.8223912, 1.744298, 2.422489, 0.9568627, 0, 1, 1,
0.8239799, -0.1624589, 2.837271, 0.9607843, 0, 1, 1,
0.8248869, -1.08192, 3.367625, 0.9686275, 0, 1, 1,
0.8274236, -1.321217, 2.897249, 0.972549, 0, 1, 1,
0.8297035, -1.340038, 3.338332, 0.9803922, 0, 1, 1,
0.8300009, -0.564904, -0.05771102, 0.9843137, 0, 1, 1,
0.8303081, -1.079352, 2.876078, 0.9921569, 0, 1, 1,
0.8353111, -0.5609285, 2.525101, 0.9960784, 0, 1, 1,
0.8387392, -0.4959683, 2.590661, 1, 0, 0.9960784, 1,
0.8390771, -1.548418, 2.131459, 1, 0, 0.9882353, 1,
0.8494277, -1.075423, 2.76592, 1, 0, 0.9843137, 1,
0.852087, -1.170982, 3.101006, 1, 0, 0.9764706, 1,
0.8596885, 0.5974597, 2.338715, 1, 0, 0.972549, 1,
0.8628638, 0.7540732, 1.119341, 1, 0, 0.9647059, 1,
0.8683346, 0.2027248, 2.164036, 1, 0, 0.9607843, 1,
0.8814203, 0.1973057, 2.404321, 1, 0, 0.9529412, 1,
0.8906016, 0.7977622, -0.03178805, 1, 0, 0.9490196, 1,
0.8914479, -0.762234, 3.639229, 1, 0, 0.9411765, 1,
0.8920909, 1.576719, 1.66381, 1, 0, 0.9372549, 1,
0.893719, 0.4226288, 0.3998365, 1, 0, 0.9294118, 1,
0.8945492, 0.4807858, 1.152838, 1, 0, 0.9254902, 1,
0.8966473, 0.9884416, 1.393166, 1, 0, 0.9176471, 1,
0.8991051, 0.7904181, 0.4125194, 1, 0, 0.9137255, 1,
0.9022246, 0.7087433, -0.2499572, 1, 0, 0.9058824, 1,
0.9056804, 0.1818746, 0.9616112, 1, 0, 0.9019608, 1,
0.909065, 0.6590544, 1.499655, 1, 0, 0.8941177, 1,
0.9245385, 1.674457, 0.2049498, 1, 0, 0.8862745, 1,
0.9315142, 0.3737161, 1.916402, 1, 0, 0.8823529, 1,
0.9381745, 0.5609435, 1.554153, 1, 0, 0.8745098, 1,
0.9447163, -1.393106, 2.72656, 1, 0, 0.8705882, 1,
0.9511117, 0.2921857, 0.3591793, 1, 0, 0.8627451, 1,
0.9554033, -1.529865, 1.156577, 1, 0, 0.8588235, 1,
0.9613454, 0.6997731, 3.304765, 1, 0, 0.8509804, 1,
0.9622723, -0.3982124, 2.462784, 1, 0, 0.8470588, 1,
0.9698008, 0.3827657, 2.303303, 1, 0, 0.8392157, 1,
0.9700655, 0.4833909, -0.05688031, 1, 0, 0.8352941, 1,
0.9884302, 0.2149979, 0.8872382, 1, 0, 0.827451, 1,
0.9903082, 0.1626621, 3.34537, 1, 0, 0.8235294, 1,
0.9910696, 0.01453277, 0.358357, 1, 0, 0.8156863, 1,
0.9954999, 0.5626366, 1.50764, 1, 0, 0.8117647, 1,
0.9964333, 0.4125012, 4.130616, 1, 0, 0.8039216, 1,
0.9994198, 1.056236, -0.01750774, 1, 0, 0.7960784, 1,
1.002854, 1.910712, -1.610298, 1, 0, 0.7921569, 1,
1.021432, -1.265101, 3.004635, 1, 0, 0.7843137, 1,
1.029976, 0.2344491, 1.521532, 1, 0, 0.7803922, 1,
1.041137, -0.1343605, 0.4584336, 1, 0, 0.772549, 1,
1.049598, 1.539459, 1.540217, 1, 0, 0.7686275, 1,
1.053565, 2.548003, 0.6005825, 1, 0, 0.7607843, 1,
1.055294, -0.517614, 2.030041, 1, 0, 0.7568628, 1,
1.055785, -1.824512, 2.72466, 1, 0, 0.7490196, 1,
1.058358, 1.42126, 1.017077, 1, 0, 0.7450981, 1,
1.065338, -2.631053, 3.727652, 1, 0, 0.7372549, 1,
1.067847, 0.005794709, 1.300806, 1, 0, 0.7333333, 1,
1.068295, -0.7993683, 2.494034, 1, 0, 0.7254902, 1,
1.079466, -0.4304053, 1.15727, 1, 0, 0.7215686, 1,
1.084125, 0.5700262, -0.5520027, 1, 0, 0.7137255, 1,
1.094535, -1.073491, 1.223814, 1, 0, 0.7098039, 1,
1.096539, 0.4025624, 1.191306, 1, 0, 0.7019608, 1,
1.099585, -1.692666, 1.505593, 1, 0, 0.6941177, 1,
1.102193, 0.07943542, 1.491088, 1, 0, 0.6901961, 1,
1.102998, -1.068121, 3.708678, 1, 0, 0.682353, 1,
1.109971, -0.5263923, 1.309182, 1, 0, 0.6784314, 1,
1.114691, 0.2654838, 0.9981699, 1, 0, 0.6705883, 1,
1.116013, -2.895104, 2.747279, 1, 0, 0.6666667, 1,
1.119208, -0.957534, 3.008322, 1, 0, 0.6588235, 1,
1.120615, -0.4925457, 1.939552, 1, 0, 0.654902, 1,
1.121952, -0.6409886, 1.662227, 1, 0, 0.6470588, 1,
1.12207, 1.578484, 0.6484789, 1, 0, 0.6431373, 1,
1.124404, 0.3492596, 2.40257, 1, 0, 0.6352941, 1,
1.126095, -0.287214, 2.893236, 1, 0, 0.6313726, 1,
1.134123, 0.03701314, 0.9282041, 1, 0, 0.6235294, 1,
1.134482, -0.1964455, 2.300977, 1, 0, 0.6196079, 1,
1.157976, -1.672936, 4.290455, 1, 0, 0.6117647, 1,
1.164609, -0.1475768, 2.578727, 1, 0, 0.6078432, 1,
1.170703, -0.7590753, 3.176272, 1, 0, 0.6, 1,
1.172967, -0.9129691, 2.359635, 1, 0, 0.5921569, 1,
1.18478, -1.307045, 4.001774, 1, 0, 0.5882353, 1,
1.188447, -1.316875, 0.946476, 1, 0, 0.5803922, 1,
1.190057, 2.543592, -0.129224, 1, 0, 0.5764706, 1,
1.196491, -0.2682796, 3.152815, 1, 0, 0.5686275, 1,
1.200612, 0.921461, -0.4418483, 1, 0, 0.5647059, 1,
1.201347, 0.873111, 0.1387776, 1, 0, 0.5568628, 1,
1.207042, 0.2925126, 0.7568198, 1, 0, 0.5529412, 1,
1.207807, 1.391853, 0.7715697, 1, 0, 0.5450981, 1,
1.210925, 0.9892456, 1.035281, 1, 0, 0.5411765, 1,
1.219765, 1.546793, 1.058296, 1, 0, 0.5333334, 1,
1.221403, 0.957155, 0.5771454, 1, 0, 0.5294118, 1,
1.232919, -1.336665, 3.71839, 1, 0, 0.5215687, 1,
1.242832, 0.8608683, 0.6424793, 1, 0, 0.5176471, 1,
1.244327, 0.5348837, 1.61548, 1, 0, 0.509804, 1,
1.257465, 0.1741941, -0.1271009, 1, 0, 0.5058824, 1,
1.257777, -1.016888, 3.793924, 1, 0, 0.4980392, 1,
1.264783, -0.2188302, 2.310842, 1, 0, 0.4901961, 1,
1.268041, 0.8120619, -0.3927807, 1, 0, 0.4862745, 1,
1.272432, -1.298216, 1.703645, 1, 0, 0.4784314, 1,
1.278618, 0.2683588, 0.5770384, 1, 0, 0.4745098, 1,
1.279646, -0.5259724, 2.242651, 1, 0, 0.4666667, 1,
1.288685, 0.7759589, 2.071045, 1, 0, 0.4627451, 1,
1.288733, -0.5038997, 2.942098, 1, 0, 0.454902, 1,
1.288807, -0.312477, 1.683792, 1, 0, 0.4509804, 1,
1.29714, -0.7033504, 2.076264, 1, 0, 0.4431373, 1,
1.300601, 0.5858093, 0.6556283, 1, 0, 0.4392157, 1,
1.302699, 1.377204, 0.9821263, 1, 0, 0.4313726, 1,
1.304719, 1.332507, 0.9575396, 1, 0, 0.427451, 1,
1.307511, 0.6077344, -1.043563, 1, 0, 0.4196078, 1,
1.311236, 0.004639496, 0.1751009, 1, 0, 0.4156863, 1,
1.311666, -0.1860447, 2.129192, 1, 0, 0.4078431, 1,
1.313918, 0.1905345, 2.131581, 1, 0, 0.4039216, 1,
1.317832, 0.03838585, 0.8845918, 1, 0, 0.3960784, 1,
1.323672, 0.3928884, 1.119114, 1, 0, 0.3882353, 1,
1.327424, -0.2236612, 3.502822, 1, 0, 0.3843137, 1,
1.329808, -0.1475294, 0.2990039, 1, 0, 0.3764706, 1,
1.333541, 0.2104034, 1.132573, 1, 0, 0.372549, 1,
1.352452, 1.312045, 0.0281936, 1, 0, 0.3647059, 1,
1.355161, 0.2447845, 1.312924, 1, 0, 0.3607843, 1,
1.363628, 0.9461973, 0.4608065, 1, 0, 0.3529412, 1,
1.389019, -0.2490536, 2.323402, 1, 0, 0.3490196, 1,
1.417459, 1.163759, 0.4371129, 1, 0, 0.3411765, 1,
1.426028, 0.582633, 0.909849, 1, 0, 0.3372549, 1,
1.429706, -1.875649, 2.597466, 1, 0, 0.3294118, 1,
1.440397, 0.1190481, 3.629623, 1, 0, 0.3254902, 1,
1.460906, -1.271146, 2.167313, 1, 0, 0.3176471, 1,
1.47222, -1.088875, 2.269903, 1, 0, 0.3137255, 1,
1.506623, -0.5386678, -1.287659, 1, 0, 0.3058824, 1,
1.533177, 0.01781688, 2.370532, 1, 0, 0.2980392, 1,
1.55824, -0.6126606, 2.881879, 1, 0, 0.2941177, 1,
1.559359, -0.05498018, 0.9057097, 1, 0, 0.2862745, 1,
1.571694, -1.911835, 1.915765, 1, 0, 0.282353, 1,
1.593001, 0.1567488, 1.521364, 1, 0, 0.2745098, 1,
1.595254, -1.758754, 3.621613, 1, 0, 0.2705882, 1,
1.595493, 0.002349245, 2.507123, 1, 0, 0.2627451, 1,
1.596179, 0.386, 2.936139, 1, 0, 0.2588235, 1,
1.608399, 0.2673326, -0.6361629, 1, 0, 0.2509804, 1,
1.609101, 1.204801, 1.594844, 1, 0, 0.2470588, 1,
1.630028, 0.3093682, 2.180785, 1, 0, 0.2392157, 1,
1.640283, 0.199512, 1.987772, 1, 0, 0.2352941, 1,
1.6589, -0.7811618, 1.025223, 1, 0, 0.227451, 1,
1.660902, -1.671516, 3.541444, 1, 0, 0.2235294, 1,
1.714713, 1.511891, 1.884975, 1, 0, 0.2156863, 1,
1.731767, -0.9633152, 0.001967046, 1, 0, 0.2117647, 1,
1.769711, 0.5549123, 1.250099, 1, 0, 0.2039216, 1,
1.7764, 0.5488377, 0.8080332, 1, 0, 0.1960784, 1,
1.803527, -0.03528021, 2.895764, 1, 0, 0.1921569, 1,
1.813427, 0.07690423, 0.2975139, 1, 0, 0.1843137, 1,
1.816432, 1.56989, 0.2934614, 1, 0, 0.1803922, 1,
1.839239, -0.2107277, 2.201903, 1, 0, 0.172549, 1,
1.845733, 0.227587, 1.257946, 1, 0, 0.1686275, 1,
1.873333, 2.130388, 0.03953688, 1, 0, 0.1607843, 1,
1.903142, 0.7288935, 1.535215, 1, 0, 0.1568628, 1,
1.932844, -1.384467, 0.9114621, 1, 0, 0.1490196, 1,
1.941024, -0.5462708, 1.634533, 1, 0, 0.145098, 1,
1.946293, 1.94685, 2.385234, 1, 0, 0.1372549, 1,
1.961366, -0.4362693, 3.064908, 1, 0, 0.1333333, 1,
1.962605, 0.3295854, 2.22094, 1, 0, 0.1254902, 1,
1.994303, 0.1969161, 2.051512, 1, 0, 0.1215686, 1,
2.007175, -0.03743118, 1.457499, 1, 0, 0.1137255, 1,
2.027221, -1.286457, 1.985028, 1, 0, 0.1098039, 1,
2.092442, 0.2063429, 0.5092348, 1, 0, 0.1019608, 1,
2.144791, -0.5946611, 2.34403, 1, 0, 0.09411765, 1,
2.173039, 0.2320606, 1.218494, 1, 0, 0.09019608, 1,
2.180871, -1.238709, 2.835853, 1, 0, 0.08235294, 1,
2.18419, 0.3053436, 0.9255511, 1, 0, 0.07843138, 1,
2.242303, 0.05593437, 1.817634, 1, 0, 0.07058824, 1,
2.269305, 0.07602692, 1.701431, 1, 0, 0.06666667, 1,
2.300649, 0.4452122, 1.492548, 1, 0, 0.05882353, 1,
2.404609, 0.7333937, 1.485841, 1, 0, 0.05490196, 1,
2.42691, 0.6820629, 0.822327, 1, 0, 0.04705882, 1,
2.43634, 2.016202, 1.596376, 1, 0, 0.04313726, 1,
2.568604, 1.05101, -0.2475048, 1, 0, 0.03529412, 1,
2.57614, 0.6387214, 2.182461, 1, 0, 0.03137255, 1,
2.61369, 1.212654, 1.944159, 1, 0, 0.02352941, 1,
2.692366, 0.605375, 2.465466, 1, 0, 0.01960784, 1,
2.700084, -0.6006298, 1.904956, 1, 0, 0.01176471, 1,
2.874265, -0.242653, 2.296705, 1, 0, 0.007843138, 1
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
-0.3560334, -4.096793, -6.536087, 0, -0.5, 0.5, 0.5,
-0.3560334, -4.096793, -6.536087, 1, -0.5, 0.5, 0.5,
-0.3560334, -4.096793, -6.536087, 1, 1.5, 0.5, 0.5,
-0.3560334, -4.096793, -6.536087, 0, 1.5, 0.5, 0.5
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
-4.681403, -0.1594027, -6.536087, 0, -0.5, 0.5, 0.5,
-4.681403, -0.1594027, -6.536087, 1, -0.5, 0.5, 0.5,
-4.681403, -0.1594027, -6.536087, 1, 1.5, 0.5, 0.5,
-4.681403, -0.1594027, -6.536087, 0, 1.5, 0.5, 0.5
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
-4.681403, -4.096793, 0.05261469, 0, -0.5, 0.5, 0.5,
-4.681403, -4.096793, 0.05261469, 1, -0.5, 0.5, 0.5,
-4.681403, -4.096793, 0.05261469, 1, 1.5, 0.5, 0.5,
-4.681403, -4.096793, 0.05261469, 0, 1.5, 0.5, 0.5
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
-3, -3.188164, -5.015617,
2, -3.188164, -5.015617,
-3, -3.188164, -5.015617,
-3, -3.339602, -5.269029,
-2, -3.188164, -5.015617,
-2, -3.339602, -5.269029,
-1, -3.188164, -5.015617,
-1, -3.339602, -5.269029,
0, -3.188164, -5.015617,
0, -3.339602, -5.269029,
1, -3.188164, -5.015617,
1, -3.339602, -5.269029,
2, -3.188164, -5.015617,
2, -3.339602, -5.269029
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
-3, -3.642478, -5.775852, 0, -0.5, 0.5, 0.5,
-3, -3.642478, -5.775852, 1, -0.5, 0.5, 0.5,
-3, -3.642478, -5.775852, 1, 1.5, 0.5, 0.5,
-3, -3.642478, -5.775852, 0, 1.5, 0.5, 0.5,
-2, -3.642478, -5.775852, 0, -0.5, 0.5, 0.5,
-2, -3.642478, -5.775852, 1, -0.5, 0.5, 0.5,
-2, -3.642478, -5.775852, 1, 1.5, 0.5, 0.5,
-2, -3.642478, -5.775852, 0, 1.5, 0.5, 0.5,
-1, -3.642478, -5.775852, 0, -0.5, 0.5, 0.5,
-1, -3.642478, -5.775852, 1, -0.5, 0.5, 0.5,
-1, -3.642478, -5.775852, 1, 1.5, 0.5, 0.5,
-1, -3.642478, -5.775852, 0, 1.5, 0.5, 0.5,
0, -3.642478, -5.775852, 0, -0.5, 0.5, 0.5,
0, -3.642478, -5.775852, 1, -0.5, 0.5, 0.5,
0, -3.642478, -5.775852, 1, 1.5, 0.5, 0.5,
0, -3.642478, -5.775852, 0, 1.5, 0.5, 0.5,
1, -3.642478, -5.775852, 0, -0.5, 0.5, 0.5,
1, -3.642478, -5.775852, 1, -0.5, 0.5, 0.5,
1, -3.642478, -5.775852, 1, 1.5, 0.5, 0.5,
1, -3.642478, -5.775852, 0, 1.5, 0.5, 0.5,
2, -3.642478, -5.775852, 0, -0.5, 0.5, 0.5,
2, -3.642478, -5.775852, 1, -0.5, 0.5, 0.5,
2, -3.642478, -5.775852, 1, 1.5, 0.5, 0.5,
2, -3.642478, -5.775852, 0, 1.5, 0.5, 0.5
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
-3.683241, -3, -5.015617,
-3.683241, 2, -5.015617,
-3.683241, -3, -5.015617,
-3.849601, -3, -5.269029,
-3.683241, -2, -5.015617,
-3.849601, -2, -5.269029,
-3.683241, -1, -5.015617,
-3.849601, -1, -5.269029,
-3.683241, 0, -5.015617,
-3.849601, 0, -5.269029,
-3.683241, 1, -5.015617,
-3.849601, 1, -5.269029,
-3.683241, 2, -5.015617,
-3.849601, 2, -5.269029
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
-4.182322, -3, -5.775852, 0, -0.5, 0.5, 0.5,
-4.182322, -3, -5.775852, 1, -0.5, 0.5, 0.5,
-4.182322, -3, -5.775852, 1, 1.5, 0.5, 0.5,
-4.182322, -3, -5.775852, 0, 1.5, 0.5, 0.5,
-4.182322, -2, -5.775852, 0, -0.5, 0.5, 0.5,
-4.182322, -2, -5.775852, 1, -0.5, 0.5, 0.5,
-4.182322, -2, -5.775852, 1, 1.5, 0.5, 0.5,
-4.182322, -2, -5.775852, 0, 1.5, 0.5, 0.5,
-4.182322, -1, -5.775852, 0, -0.5, 0.5, 0.5,
-4.182322, -1, -5.775852, 1, -0.5, 0.5, 0.5,
-4.182322, -1, -5.775852, 1, 1.5, 0.5, 0.5,
-4.182322, -1, -5.775852, 0, 1.5, 0.5, 0.5,
-4.182322, 0, -5.775852, 0, -0.5, 0.5, 0.5,
-4.182322, 0, -5.775852, 1, -0.5, 0.5, 0.5,
-4.182322, 0, -5.775852, 1, 1.5, 0.5, 0.5,
-4.182322, 0, -5.775852, 0, 1.5, 0.5, 0.5,
-4.182322, 1, -5.775852, 0, -0.5, 0.5, 0.5,
-4.182322, 1, -5.775852, 1, -0.5, 0.5, 0.5,
-4.182322, 1, -5.775852, 1, 1.5, 0.5, 0.5,
-4.182322, 1, -5.775852, 0, 1.5, 0.5, 0.5,
-4.182322, 2, -5.775852, 0, -0.5, 0.5, 0.5,
-4.182322, 2, -5.775852, 1, -0.5, 0.5, 0.5,
-4.182322, 2, -5.775852, 1, 1.5, 0.5, 0.5,
-4.182322, 2, -5.775852, 0, 1.5, 0.5, 0.5
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
-3.683241, -3.188164, -4,
-3.683241, -3.188164, 4,
-3.683241, -3.188164, -4,
-3.849601, -3.339602, -4,
-3.683241, -3.188164, -2,
-3.849601, -3.339602, -2,
-3.683241, -3.188164, 0,
-3.849601, -3.339602, 0,
-3.683241, -3.188164, 2,
-3.849601, -3.339602, 2,
-3.683241, -3.188164, 4,
-3.849601, -3.339602, 4
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
-4.182322, -3.642478, -4, 0, -0.5, 0.5, 0.5,
-4.182322, -3.642478, -4, 1, -0.5, 0.5, 0.5,
-4.182322, -3.642478, -4, 1, 1.5, 0.5, 0.5,
-4.182322, -3.642478, -4, 0, 1.5, 0.5, 0.5,
-4.182322, -3.642478, -2, 0, -0.5, 0.5, 0.5,
-4.182322, -3.642478, -2, 1, -0.5, 0.5, 0.5,
-4.182322, -3.642478, -2, 1, 1.5, 0.5, 0.5,
-4.182322, -3.642478, -2, 0, 1.5, 0.5, 0.5,
-4.182322, -3.642478, 0, 0, -0.5, 0.5, 0.5,
-4.182322, -3.642478, 0, 1, -0.5, 0.5, 0.5,
-4.182322, -3.642478, 0, 1, 1.5, 0.5, 0.5,
-4.182322, -3.642478, 0, 0, 1.5, 0.5, 0.5,
-4.182322, -3.642478, 2, 0, -0.5, 0.5, 0.5,
-4.182322, -3.642478, 2, 1, -0.5, 0.5, 0.5,
-4.182322, -3.642478, 2, 1, 1.5, 0.5, 0.5,
-4.182322, -3.642478, 2, 0, 1.5, 0.5, 0.5,
-4.182322, -3.642478, 4, 0, -0.5, 0.5, 0.5,
-4.182322, -3.642478, 4, 1, -0.5, 0.5, 0.5,
-4.182322, -3.642478, 4, 1, 1.5, 0.5, 0.5,
-4.182322, -3.642478, 4, 0, 1.5, 0.5, 0.5
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
-3.683241, -3.188164, -5.015617,
-3.683241, 2.869359, -5.015617,
-3.683241, -3.188164, 5.120847,
-3.683241, 2.869359, 5.120847,
-3.683241, -3.188164, -5.015617,
-3.683241, -3.188164, 5.120847,
-3.683241, 2.869359, -5.015617,
-3.683241, 2.869359, 5.120847,
-3.683241, -3.188164, -5.015617,
2.971174, -3.188164, -5.015617,
-3.683241, -3.188164, 5.120847,
2.971174, -3.188164, 5.120847,
-3.683241, 2.869359, -5.015617,
2.971174, 2.869359, -5.015617,
-3.683241, 2.869359, 5.120847,
2.971174, 2.869359, 5.120847,
2.971174, -3.188164, -5.015617,
2.971174, 2.869359, -5.015617,
2.971174, -3.188164, 5.120847,
2.971174, 2.869359, 5.120847,
2.971174, -3.188164, -5.015617,
2.971174, -3.188164, 5.120847,
2.971174, 2.869359, -5.015617,
2.971174, 2.869359, 5.120847
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
var radius = 7.237806;
var distance = 32.20182;
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
mvMatrix.translate( 0.3560334, 0.1594027, -0.05261469 );
mvMatrix.scale( 1.17601, 1.291891, 0.7720302 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.20182);
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
metron<-read.table("metron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metron$V2
```

```
## Error in eval(expr, envir, enclos): object 'metron' not found
```

```r
y<-metron$V3
```

```
## Error in eval(expr, envir, enclos): object 'metron' not found
```

```r
z<-metron$V4
```

```
## Error in eval(expr, envir, enclos): object 'metron' not found
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
-3.586332, -1.162562, -1.599648, 0, 0, 1, 1, 1,
-2.952499, 0.5319929, -3.172992, 1, 0, 0, 1, 1,
-2.899279, 0.2752463, -1.74585, 1, 0, 0, 1, 1,
-2.775153, 0.4407847, 0.8383362, 1, 0, 0, 1, 1,
-2.678193, -0.4004352, -1.571885, 1, 0, 0, 1, 1,
-2.668791, 0.1429906, -1.504765, 1, 0, 0, 1, 1,
-2.612784, -1.21154, -2.887849, 0, 0, 0, 1, 1,
-2.611864, -0.4975194, -2.233009, 0, 0, 0, 1, 1,
-2.555377, -0.4675159, -1.656719, 0, 0, 0, 1, 1,
-2.382292, 0.8105085, -2.087444, 0, 0, 0, 1, 1,
-2.37513, 0.5220162, -3.360101, 0, 0, 0, 1, 1,
-2.338307, 1.048787, -1.119381, 0, 0, 0, 1, 1,
-2.270182, 0.2437037, -0.7666669, 0, 0, 0, 1, 1,
-2.247184, -0.3025882, -2.363385, 1, 1, 1, 1, 1,
-2.21977, -2.894453, -3.733777, 1, 1, 1, 1, 1,
-2.191703, -0.409389, -0.07441586, 1, 1, 1, 1, 1,
-2.17274, -0.8605553, -0.4870695, 1, 1, 1, 1, 1,
-2.170894, 1.095702, -1.391711, 1, 1, 1, 1, 1,
-2.135473, -0.2510793, 0.7132989, 1, 1, 1, 1, 1,
-2.105998, -0.06871316, -2.416135, 1, 1, 1, 1, 1,
-2.05075, 0.7913746, -0.4703654, 1, 1, 1, 1, 1,
-2.026136, 1.589673, -1.034514, 1, 1, 1, 1, 1,
-2.010524, 0.3992867, -0.4292722, 1, 1, 1, 1, 1,
-2.009148, -0.08746367, -2.230346, 1, 1, 1, 1, 1,
-1.998988, -1.149876, -1.024775, 1, 1, 1, 1, 1,
-1.981184, 1.517021, 0.07683165, 1, 1, 1, 1, 1,
-1.977967, -0.6562382, -2.726191, 1, 1, 1, 1, 1,
-1.962843, -0.4597931, -1.167443, 1, 1, 1, 1, 1,
-1.915699, -0.4225858, -1.774366, 0, 0, 1, 1, 1,
-1.907364, -1.741648, -1.112572, 1, 0, 0, 1, 1,
-1.878788, 0.0830981, 0.03415817, 1, 0, 0, 1, 1,
-1.875658, 1.337402, -0.787807, 1, 0, 0, 1, 1,
-1.855095, 0.5125969, -0.8082293, 1, 0, 0, 1, 1,
-1.848719, -0.5593102, -0.6198667, 1, 0, 0, 1, 1,
-1.826226, 1.464505, -1.009966, 0, 0, 0, 1, 1,
-1.823968, -1.465297, -3.916727, 0, 0, 0, 1, 1,
-1.802622, -0.3110189, -2.172034, 0, 0, 0, 1, 1,
-1.797161, -0.1914072, -1.455204, 0, 0, 0, 1, 1,
-1.769653, 0.7417924, -1.409624, 0, 0, 0, 1, 1,
-1.765243, 0.3128225, -2.69767, 0, 0, 0, 1, 1,
-1.762237, -0.706378, -2.543376, 0, 0, 0, 1, 1,
-1.741957, -0.1482654, -1.484321, 1, 1, 1, 1, 1,
-1.740575, -1.244451, -2.865305, 1, 1, 1, 1, 1,
-1.73867, 0.6774946, -1.413239, 1, 1, 1, 1, 1,
-1.730112, -0.8898791, -2.045412, 1, 1, 1, 1, 1,
-1.727359, 0.5606459, -1.109496, 1, 1, 1, 1, 1,
-1.725935, -2.678747, -2.961498, 1, 1, 1, 1, 1,
-1.723005, 1.886858, -0.3981344, 1, 1, 1, 1, 1,
-1.678297, -0.676244, 0.6739411, 1, 1, 1, 1, 1,
-1.676498, -2.896971, -1.618944, 1, 1, 1, 1, 1,
-1.67358, 2.122111, -0.5049217, 1, 1, 1, 1, 1,
-1.665319, -0.8460955, -3.507292, 1, 1, 1, 1, 1,
-1.664985, -0.6676953, -1.996344, 1, 1, 1, 1, 1,
-1.654609, -0.2829157, -3.415931, 1, 1, 1, 1, 1,
-1.651243, 2.435941, 0.3044623, 1, 1, 1, 1, 1,
-1.643317, 0.1342635, -3.113693, 1, 1, 1, 1, 1,
-1.642869, 0.1097834, -3.717218, 0, 0, 1, 1, 1,
-1.641979, -0.9202155, -2.587583, 1, 0, 0, 1, 1,
-1.63399, -0.2937855, -2.20207, 1, 0, 0, 1, 1,
-1.627089, 0.6714895, -0.793358, 1, 0, 0, 1, 1,
-1.624034, 1.700776, 1.229178, 1, 0, 0, 1, 1,
-1.620669, -0.2689152, -2.238591, 1, 0, 0, 1, 1,
-1.615784, -1.866879, -2.271549, 0, 0, 0, 1, 1,
-1.604144, -1.44471, -2.063058, 0, 0, 0, 1, 1,
-1.603703, -0.175851, -3.251185, 0, 0, 0, 1, 1,
-1.601737, -1.030968, -2.273124, 0, 0, 0, 1, 1,
-1.5982, -1.716867, -2.344684, 0, 0, 0, 1, 1,
-1.596347, -0.08214974, -1.793699, 0, 0, 0, 1, 1,
-1.588147, -0.1840731, -1.844076, 0, 0, 0, 1, 1,
-1.581621, -1.113915, -3.911389, 1, 1, 1, 1, 1,
-1.579741, -0.0370003, -0.1008872, 1, 1, 1, 1, 1,
-1.561271, 1.127516, -0.4362041, 1, 1, 1, 1, 1,
-1.55856, 0.5833439, -1.472918, 1, 1, 1, 1, 1,
-1.556291, 0.2636343, -0.8148677, 1, 1, 1, 1, 1,
-1.552641, 0.8883394, -1.510598, 1, 1, 1, 1, 1,
-1.551565, 0.0527724, -0.2636738, 1, 1, 1, 1, 1,
-1.53637, 0.6745871, -0.5834898, 1, 1, 1, 1, 1,
-1.525259, 0.09635945, -0.8491362, 1, 1, 1, 1, 1,
-1.524319, 0.7931523, -1.307401, 1, 1, 1, 1, 1,
-1.511639, -0.7803344, -1.938726, 1, 1, 1, 1, 1,
-1.507622, 0.8311027, -2.308483, 1, 1, 1, 1, 1,
-1.496113, 1.482481, -0.2837121, 1, 1, 1, 1, 1,
-1.491639, -0.09388854, -2.372981, 1, 1, 1, 1, 1,
-1.489409, -0.3071447, -1.653489, 1, 1, 1, 1, 1,
-1.47998, -0.9729096, -2.698861, 0, 0, 1, 1, 1,
-1.474542, 1.186553, -0.493238, 1, 0, 0, 1, 1,
-1.44903, -0.1188453, -1.340833, 1, 0, 0, 1, 1,
-1.434186, -1.300586, -1.485758, 1, 0, 0, 1, 1,
-1.421982, -0.4318213, -2.281712, 1, 0, 0, 1, 1,
-1.411892, 0.289626, 0.7758144, 1, 0, 0, 1, 1,
-1.411129, 2.236983, -1.637486, 0, 0, 0, 1, 1,
-1.401398, -1.896384, -2.586695, 0, 0, 0, 1, 1,
-1.392469, 0.9451045, 0.3222139, 0, 0, 0, 1, 1,
-1.390079, -1.448959, -2.556316, 0, 0, 0, 1, 1,
-1.386863, -0.651997, -2.584217, 0, 0, 0, 1, 1,
-1.379532, -0.7004148, -2.175587, 0, 0, 0, 1, 1,
-1.374061, -0.4371637, -2.31297, 0, 0, 0, 1, 1,
-1.35675, -0.6110771, -1.509213, 1, 1, 1, 1, 1,
-1.346165, -1.81026, -0.5671905, 1, 1, 1, 1, 1,
-1.344502, 0.3010128, -0.1891223, 1, 1, 1, 1, 1,
-1.335636, -0.6924455, -0.9295045, 1, 1, 1, 1, 1,
-1.327994, 1.441856, -0.09942127, 1, 1, 1, 1, 1,
-1.326532, -0.8447067, -2.520377, 1, 1, 1, 1, 1,
-1.322525, -1.603501, -3.325631, 1, 1, 1, 1, 1,
-1.319485, 0.02302325, -0.6502447, 1, 1, 1, 1, 1,
-1.318246, -0.6171106, -2.909759, 1, 1, 1, 1, 1,
-1.317857, 1.212183, 0.009023886, 1, 1, 1, 1, 1,
-1.316391, -0.6357903, -3.518911, 1, 1, 1, 1, 1,
-1.30964, 0.693391, -1.300467, 1, 1, 1, 1, 1,
-1.296742, -0.9375324, -1.635983, 1, 1, 1, 1, 1,
-1.294052, -1.343608, -3.261812, 1, 1, 1, 1, 1,
-1.28792, -0.02990083, -1.507173, 1, 1, 1, 1, 1,
-1.284928, 0.6259638, -2.228196, 0, 0, 1, 1, 1,
-1.282068, 0.2354855, -0.5092422, 1, 0, 0, 1, 1,
-1.282011, -1.098848, -1.855577, 1, 0, 0, 1, 1,
-1.278663, 0.404155, -0.8679952, 1, 0, 0, 1, 1,
-1.277587, -0.2261057, -1.548686, 1, 0, 0, 1, 1,
-1.271232, 0.730095, -2.45308, 1, 0, 0, 1, 1,
-1.268932, -0.5486832, -2.010949, 0, 0, 0, 1, 1,
-1.265018, -0.1942399, -1.358934, 0, 0, 0, 1, 1,
-1.262582, -0.2622724, -0.9539996, 0, 0, 0, 1, 1,
-1.257682, 0.3463926, -0.8238322, 0, 0, 0, 1, 1,
-1.252832, 0.0278473, -0.7768813, 0, 0, 0, 1, 1,
-1.251708, 0.7897241, -0.4620025, 0, 0, 0, 1, 1,
-1.251672, 1.489131, -0.8185768, 0, 0, 0, 1, 1,
-1.244874, -0.2932227, -0.8751066, 1, 1, 1, 1, 1,
-1.244719, 0.09802131, -1.227132, 1, 1, 1, 1, 1,
-1.242912, -0.5482839, -3.651451, 1, 1, 1, 1, 1,
-1.232556, -0.7261139, -3.469036, 1, 1, 1, 1, 1,
-1.231186, 0.07553008, -1.773167, 1, 1, 1, 1, 1,
-1.226623, -0.7568757, -3.589608, 1, 1, 1, 1, 1,
-1.223924, -0.341961, -0.01022201, 1, 1, 1, 1, 1,
-1.22244, 0.6018637, -0.9037206, 1, 1, 1, 1, 1,
-1.222058, -0.9911886, -2.234207, 1, 1, 1, 1, 1,
-1.22151, -0.1313163, -0.9617565, 1, 1, 1, 1, 1,
-1.21945, 1.433272, -1.455749, 1, 1, 1, 1, 1,
-1.214444, 0.8900512, 0.1929096, 1, 1, 1, 1, 1,
-1.205103, -1.407527, -4.220834, 1, 1, 1, 1, 1,
-1.19637, -0.3084381, -2.272007, 1, 1, 1, 1, 1,
-1.19361, 0.4177721, -1.498554, 1, 1, 1, 1, 1,
-1.191442, -0.3742106, -1.641834, 0, 0, 1, 1, 1,
-1.191367, 0.6842209, -1.512502, 1, 0, 0, 1, 1,
-1.188879, -0.4242252, -1.059061, 1, 0, 0, 1, 1,
-1.188386, -0.3508162, -2.322762, 1, 0, 0, 1, 1,
-1.187061, 0.7884799, -2.317379, 1, 0, 0, 1, 1,
-1.180356, 0.6165625, -1.342034, 1, 0, 0, 1, 1,
-1.177432, 0.2838892, 0.103867, 0, 0, 0, 1, 1,
-1.173951, -0.4946047, -1.455045, 0, 0, 0, 1, 1,
-1.169285, -1.823117, -1.191297, 0, 0, 0, 1, 1,
-1.168975, 2.404009, -1.994384, 0, 0, 0, 1, 1,
-1.153043, -0.6524206, -1.317482, 0, 0, 0, 1, 1,
-1.13746, -1.642448, -2.815799, 0, 0, 0, 1, 1,
-1.136348, -1.356834, -2.953864, 0, 0, 0, 1, 1,
-1.135894, 1.242014, 1.907913, 1, 1, 1, 1, 1,
-1.127244, 1.569437, 0.1724044, 1, 1, 1, 1, 1,
-1.115556, 0.04636568, -0.111423, 1, 1, 1, 1, 1,
-1.114488, 0.2204778, -1.944832, 1, 1, 1, 1, 1,
-1.096996, -0.04645331, -1.544704, 1, 1, 1, 1, 1,
-1.091664, 0.4208842, -0.4749101, 1, 1, 1, 1, 1,
-1.088503, -0.005971454, -0.5968253, 1, 1, 1, 1, 1,
-1.087659, 1.482207, 0.308272, 1, 1, 1, 1, 1,
-1.081638, -0.5796643, -0.5144042, 1, 1, 1, 1, 1,
-1.081258, 1.009688, -0.4011461, 1, 1, 1, 1, 1,
-1.07832, 1.121595, -1.25128, 1, 1, 1, 1, 1,
-1.0751, -0.02897411, -1.544283, 1, 1, 1, 1, 1,
-1.072863, 0.8272876, -1.125663, 1, 1, 1, 1, 1,
-1.065957, 0.7114174, -1.242516, 1, 1, 1, 1, 1,
-1.058902, 0.7326417, -1.154692, 1, 1, 1, 1, 1,
-1.053749, 0.4512688, -1.396171, 0, 0, 1, 1, 1,
-1.04713, -1.492925, -0.6002868, 1, 0, 0, 1, 1,
-1.045089, 1.3773, 0.4296884, 1, 0, 0, 1, 1,
-1.044577, 0.6235642, 0.5394199, 1, 0, 0, 1, 1,
-1.035303, 1.036157, -0.6341121, 1, 0, 0, 1, 1,
-1.028738, 0.6405078, 0.6567612, 1, 0, 0, 1, 1,
-1.028582, 0.7629366, -0.870068, 0, 0, 0, 1, 1,
-1.021333, 1.724955, 0.7780609, 0, 0, 0, 1, 1,
-1.02127, -0.8639676, -4.276445, 0, 0, 0, 1, 1,
-1.007468, 0.5766247, -1.213873, 0, 0, 0, 1, 1,
-1.000018, -0.7283802, -2.088894, 0, 0, 0, 1, 1,
-0.9993885, 0.3316996, -1.54945, 0, 0, 0, 1, 1,
-0.9950504, -0.3465873, -2.362609, 0, 0, 0, 1, 1,
-0.9937463, 0.2766285, -1.090864, 1, 1, 1, 1, 1,
-0.9908307, -0.1073885, -2.320053, 1, 1, 1, 1, 1,
-0.9872023, -0.874956, -3.398325, 1, 1, 1, 1, 1,
-0.9823803, 0.3144111, -1.984304, 1, 1, 1, 1, 1,
-0.9710738, 1.186225, -1.454257, 1, 1, 1, 1, 1,
-0.9670785, -2.174546, -1.950676, 1, 1, 1, 1, 1,
-0.9664053, 0.2510649, -0.5271155, 1, 1, 1, 1, 1,
-0.9585209, 0.387874, -1.05002, 1, 1, 1, 1, 1,
-0.9569193, 1.409403, 1.062857, 1, 1, 1, 1, 1,
-0.9506446, 0.2990331, -0.5931091, 1, 1, 1, 1, 1,
-0.9498096, 1.397024, -0.8881184, 1, 1, 1, 1, 1,
-0.9448371, 0.3371567, -0.9380387, 1, 1, 1, 1, 1,
-0.9400109, -1.13824, -2.362549, 1, 1, 1, 1, 1,
-0.939095, -2.080909, -2.551702, 1, 1, 1, 1, 1,
-0.9386852, -0.9177502, -3.307952, 1, 1, 1, 1, 1,
-0.9327223, -0.6672088, -2.423872, 0, 0, 1, 1, 1,
-0.9300354, 0.52034, 0.5118487, 1, 0, 0, 1, 1,
-0.9256822, -0.4010785, -0.3984781, 1, 0, 0, 1, 1,
-0.924737, 1.358794, -1.879783, 1, 0, 0, 1, 1,
-0.9205015, 0.7984527, -0.5688874, 1, 0, 0, 1, 1,
-0.9177321, 0.2803438, -1.720433, 1, 0, 0, 1, 1,
-0.9162313, 1.64189, 0.3559798, 0, 0, 0, 1, 1,
-0.91356, -1.660852, -1.674039, 0, 0, 0, 1, 1,
-0.9096957, 1.607069, 0.2969896, 0, 0, 0, 1, 1,
-0.9059826, -0.2376421, -3.079309, 0, 0, 0, 1, 1,
-0.901343, -0.3226332, -0.9442736, 0, 0, 0, 1, 1,
-0.8986422, -0.7145683, -2.541371, 0, 0, 0, 1, 1,
-0.8963983, -0.3096244, -3.081918, 0, 0, 0, 1, 1,
-0.8949055, -0.1741672, -2.649176, 1, 1, 1, 1, 1,
-0.8934636, -0.593453, -3.06714, 1, 1, 1, 1, 1,
-0.8870538, -0.5446029, -1.237211, 1, 1, 1, 1, 1,
-0.8817273, 0.9651759, -0.9074745, 1, 1, 1, 1, 1,
-0.8811099, 0.9144672, -0.9402111, 1, 1, 1, 1, 1,
-0.8809214, -0.2006592, -0.7355552, 1, 1, 1, 1, 1,
-0.8766807, -1.438989, -4.137229, 1, 1, 1, 1, 1,
-0.8763762, -0.7903548, -1.729241, 1, 1, 1, 1, 1,
-0.8734937, 0.09960376, -1.732715, 1, 1, 1, 1, 1,
-0.8676915, 0.493787, -0.8955549, 1, 1, 1, 1, 1,
-0.8629473, 0.925139, -0.6742662, 1, 1, 1, 1, 1,
-0.8603634, 0.3672381, 0.2850625, 1, 1, 1, 1, 1,
-0.8438948, -0.5955708, -2.55046, 1, 1, 1, 1, 1,
-0.843738, 0.4866569, -0.3947103, 1, 1, 1, 1, 1,
-0.8417972, 0.1566468, 0.6070354, 1, 1, 1, 1, 1,
-0.8318268, -0.02385766, -1.447835, 0, 0, 1, 1, 1,
-0.8315577, 0.1744617, -0.1780653, 1, 0, 0, 1, 1,
-0.8284861, -0.6084322, -3.141895, 1, 0, 0, 1, 1,
-0.8280162, 0.5565348, -0.6978502, 1, 0, 0, 1, 1,
-0.8216852, 1.711134, -0.5621177, 1, 0, 0, 1, 1,
-0.8208382, -1.103132, -3.115599, 1, 0, 0, 1, 1,
-0.8197607, 1.438503, -1.527995, 0, 0, 0, 1, 1,
-0.8192484, -0.5459563, -2.819895, 0, 0, 0, 1, 1,
-0.8185729, -0.3416248, -2.137986, 0, 0, 0, 1, 1,
-0.8158029, -0.08815588, -1.805928, 0, 0, 0, 1, 1,
-0.8109829, -0.8293929, -0.3992221, 0, 0, 0, 1, 1,
-0.8109218, 1.645784, 0.5812078, 0, 0, 0, 1, 1,
-0.808897, -0.2345271, -1.32686, 0, 0, 0, 1, 1,
-0.8087537, -0.8403196, -0.9214081, 1, 1, 1, 1, 1,
-0.8068323, -0.79648, -0.6218641, 1, 1, 1, 1, 1,
-0.8026375, 0.8670849, -1.383378, 1, 1, 1, 1, 1,
-0.7999997, 0.4861215, -0.2742392, 1, 1, 1, 1, 1,
-0.7997575, -0.7972752, -2.347329, 1, 1, 1, 1, 1,
-0.7979528, -0.1288241, -2.333649, 1, 1, 1, 1, 1,
-0.7935824, 0.8781105, -1.348299, 1, 1, 1, 1, 1,
-0.7828293, -0.9223294, -2.535511, 1, 1, 1, 1, 1,
-0.7808602, -0.1596504, -1.901422, 1, 1, 1, 1, 1,
-0.7600607, 0.4991524, -0.4399621, 1, 1, 1, 1, 1,
-0.7569771, 0.6920198, -2.107058, 1, 1, 1, 1, 1,
-0.7545816, -0.9145516, -2.756341, 1, 1, 1, 1, 1,
-0.7536939, -0.09410401, -0.956297, 1, 1, 1, 1, 1,
-0.7521094, -1.857727, -2.155298, 1, 1, 1, 1, 1,
-0.7508039, 1.028236, -1.429391, 1, 1, 1, 1, 1,
-0.7492722, -1.204136, -2.483593, 0, 0, 1, 1, 1,
-0.744775, -0.1278505, -2.202968, 1, 0, 0, 1, 1,
-0.7375358, 1.172488, -1.194582, 1, 0, 0, 1, 1,
-0.7357377, 1.28275, -0.997675, 1, 0, 0, 1, 1,
-0.7351315, -0.1426335, -1.96014, 1, 0, 0, 1, 1,
-0.7265335, -0.4556045, -0.1538304, 1, 0, 0, 1, 1,
-0.7225925, -0.08149122, -1.802293, 0, 0, 0, 1, 1,
-0.7216326, 0.009561521, -0.1055618, 0, 0, 0, 1, 1,
-0.7211427, 1.918708, -1.574223, 0, 0, 0, 1, 1,
-0.7165539, -0.4462563, -1.606644, 0, 0, 0, 1, 1,
-0.7154991, 1.537994, -1.354733, 0, 0, 0, 1, 1,
-0.7132823, 0.07548559, -1.088824, 0, 0, 0, 1, 1,
-0.7132646, -0.1306495, -1.617569, 0, 0, 0, 1, 1,
-0.7102951, -1.804996, -1.310108, 1, 1, 1, 1, 1,
-0.7061544, 0.451494, -0.1881442, 1, 1, 1, 1, 1,
-0.7057299, -0.5842147, -4.080952, 1, 1, 1, 1, 1,
-0.7023723, -0.1568154, -2.347417, 1, 1, 1, 1, 1,
-0.6989354, 0.1005847, -1.037006, 1, 1, 1, 1, 1,
-0.6967541, 1.507938, 2.259237, 1, 1, 1, 1, 1,
-0.6884696, 2.162537, -0.0701583, 1, 1, 1, 1, 1,
-0.6875408, 0.553633, -1.450115, 1, 1, 1, 1, 1,
-0.6754333, 0.1071473, 0.7258902, 1, 1, 1, 1, 1,
-0.673959, -0.9363691, -2.755334, 1, 1, 1, 1, 1,
-0.6666789, -0.5875123, -2.319397, 1, 1, 1, 1, 1,
-0.6665871, -1.801766, -1.759566, 1, 1, 1, 1, 1,
-0.6636679, 1.327593, -1.458251, 1, 1, 1, 1, 1,
-0.6633531, 1.787816, -0.2138191, 1, 1, 1, 1, 1,
-0.6594483, 1.1333, 0.5412283, 1, 1, 1, 1, 1,
-0.6525877, 0.3072079, -1.865326, 0, 0, 1, 1, 1,
-0.6454946, -0.4675723, -0.7320276, 1, 0, 0, 1, 1,
-0.6440607, 0.5543494, 1.26558, 1, 0, 0, 1, 1,
-0.6333733, -1.36696, -2.571603, 1, 0, 0, 1, 1,
-0.6281891, 0.05211114, -1.021446, 1, 0, 0, 1, 1,
-0.6267266, 0.3079307, -0.5278298, 1, 0, 0, 1, 1,
-0.6250464, -1.501387, -3.037138, 0, 0, 0, 1, 1,
-0.6227422, -0.287584, -2.99125, 0, 0, 0, 1, 1,
-0.6149211, 0.1539087, 0.3242423, 0, 0, 0, 1, 1,
-0.6138059, -0.1374727, -2.333296, 0, 0, 0, 1, 1,
-0.6089819, -0.9946131, -0.8699573, 0, 0, 0, 1, 1,
-0.6075956, -0.8238067, -4.28281, 0, 0, 0, 1, 1,
-0.6018872, -1.242787, -2.878138, 0, 0, 0, 1, 1,
-0.5976006, -3.099948, -3.98089, 1, 1, 1, 1, 1,
-0.5964988, 1.942935, -0.172807, 1, 1, 1, 1, 1,
-0.5906113, 1.821183, -1.921908, 1, 1, 1, 1, 1,
-0.585112, -1.17128, -2.094087, 1, 1, 1, 1, 1,
-0.5828589, 0.8015237, -1.257796, 1, 1, 1, 1, 1,
-0.5794733, 0.03610361, -1.772824, 1, 1, 1, 1, 1,
-0.5782004, 1.960306, -0.1214376, 1, 1, 1, 1, 1,
-0.5689059, -1.15028, -2.756444, 1, 1, 1, 1, 1,
-0.5681915, -0.1431475, -0.4948829, 1, 1, 1, 1, 1,
-0.5623815, -0.9500524, -1.398838, 1, 1, 1, 1, 1,
-0.5619764, 1.010761, -0.4026417, 1, 1, 1, 1, 1,
-0.5617206, 0.652625, 0.3103719, 1, 1, 1, 1, 1,
-0.560564, 0.7941325, -1.155783, 1, 1, 1, 1, 1,
-0.5517002, -0.3043106, -2.025787, 1, 1, 1, 1, 1,
-0.5390862, -0.5744907, -2.905872, 1, 1, 1, 1, 1,
-0.538653, 1.366886, -0.3558642, 0, 0, 1, 1, 1,
-0.5257913, 0.07836548, -0.1335326, 1, 0, 0, 1, 1,
-0.524062, -1.216111, -2.199241, 1, 0, 0, 1, 1,
-0.5235783, -0.2912143, -2.520433, 1, 0, 0, 1, 1,
-0.5219237, 1.347354, -0.9107362, 1, 0, 0, 1, 1,
-0.5189908, 0.8777994, -1.83049, 1, 0, 0, 1, 1,
-0.5153052, 0.420181, -0.7814018, 0, 0, 0, 1, 1,
-0.5129464, 0.09228965, -3.831916, 0, 0, 0, 1, 1,
-0.5106473, -0.2274115, -0.0944384, 0, 0, 0, 1, 1,
-0.506637, 0.1914651, -2.20098, 0, 0, 0, 1, 1,
-0.5048244, -0.4753365, -2.281269, 0, 0, 0, 1, 1,
-0.5036983, -2.022608, -4.867999, 0, 0, 0, 1, 1,
-0.5029135, 1.631668, -1.77965, 0, 0, 0, 1, 1,
-0.4990928, 0.7306778, -1.247029, 1, 1, 1, 1, 1,
-0.4981914, 1.719186, -0.2713678, 1, 1, 1, 1, 1,
-0.4947685, 1.269565, -0.6131588, 1, 1, 1, 1, 1,
-0.4946818, 0.04202288, -0.8220505, 1, 1, 1, 1, 1,
-0.4934625, 0.7796062, 0.8437895, 1, 1, 1, 1, 1,
-0.489956, 0.6807395, 0.5891591, 1, 1, 1, 1, 1,
-0.4890479, 0.8685435, -0.7014883, 1, 1, 1, 1, 1,
-0.4872867, -1.16355, -4.413467, 1, 1, 1, 1, 1,
-0.4847986, -1.163787, -2.754123, 1, 1, 1, 1, 1,
-0.4829398, 1.232679, -1.071165, 1, 1, 1, 1, 1,
-0.4826304, 1.386211, 0.8450767, 1, 1, 1, 1, 1,
-0.480961, -0.192206, -1.472793, 1, 1, 1, 1, 1,
-0.4798745, -1.25837, -1.377765, 1, 1, 1, 1, 1,
-0.4794088, -0.6363977, -1.644773, 1, 1, 1, 1, 1,
-0.47819, -0.6105035, -2.953589, 1, 1, 1, 1, 1,
-0.4739311, 0.2139746, 0.1057018, 0, 0, 1, 1, 1,
-0.4700153, 0.5332491, -1.309735, 1, 0, 0, 1, 1,
-0.4626042, 2.781142, -0.7667025, 1, 0, 0, 1, 1,
-0.4595013, 0.2035783, -1.496368, 1, 0, 0, 1, 1,
-0.4577183, -0.5955995, -2.709311, 1, 0, 0, 1, 1,
-0.4577003, 0.960897, -1.380304, 1, 0, 0, 1, 1,
-0.4515541, 0.5275924, -1.96138, 0, 0, 0, 1, 1,
-0.4512901, 0.07191123, -0.891037, 0, 0, 0, 1, 1,
-0.4486902, 0.9891334, 0.320935, 0, 0, 0, 1, 1,
-0.4473976, 0.5979705, -1.205987, 0, 0, 0, 1, 1,
-0.4470376, 0.8138558, -0.9822644, 0, 0, 0, 1, 1,
-0.4460158, 1.30474, -0.03035636, 0, 0, 0, 1, 1,
-0.4427205, 0.6636749, -1.452336, 0, 0, 0, 1, 1,
-0.4402878, -0.2078649, -2.385875, 1, 1, 1, 1, 1,
-0.4393412, -0.6006704, -3.795195, 1, 1, 1, 1, 1,
-0.4387987, 0.8094342, 1.144682, 1, 1, 1, 1, 1,
-0.4359063, 1.110378, -1.371441, 1, 1, 1, 1, 1,
-0.4348693, -0.5397129, -1.175967, 1, 1, 1, 1, 1,
-0.4343045, -1.076843, -2.018759, 1, 1, 1, 1, 1,
-0.4337326, -0.4070607, -1.28072, 1, 1, 1, 1, 1,
-0.4326388, -0.6890671, -4.262092, 1, 1, 1, 1, 1,
-0.4323035, -0.6883215, -2.548293, 1, 1, 1, 1, 1,
-0.4306796, -0.3043932, -3.710999, 1, 1, 1, 1, 1,
-0.4269964, 0.3135721, -2.999656, 1, 1, 1, 1, 1,
-0.4168874, 1.184871, -1.846596, 1, 1, 1, 1, 1,
-0.4151829, 1.869995, 1.098473, 1, 1, 1, 1, 1,
-0.4150876, 0.3106876, -4.106643, 1, 1, 1, 1, 1,
-0.4108474, -1.226687e-05, -3.102713, 1, 1, 1, 1, 1,
-0.4063962, 0.6518071, 1.241623, 0, 0, 1, 1, 1,
-0.4061314, -1.595854, -3.937814, 1, 0, 0, 1, 1,
-0.4048997, 0.7558796, -1.936485, 1, 0, 0, 1, 1,
-0.3971073, -0.346605, -3.502128, 1, 0, 0, 1, 1,
-0.3959104, -0.6241683, -1.857558, 1, 0, 0, 1, 1,
-0.3931426, -0.4251342, -2.671769, 1, 0, 0, 1, 1,
-0.3921777, -1.56718, -3.243347, 0, 0, 0, 1, 1,
-0.391851, -2.080767, -4.172161, 0, 0, 0, 1, 1,
-0.3912496, 1.106325, -0.7855343, 0, 0, 0, 1, 1,
-0.3902449, 1.243893, 1.271169, 0, 0, 0, 1, 1,
-0.3800085, -0.3641807, -4.201427, 0, 0, 0, 1, 1,
-0.3782643, 0.9811237, -0.3409775, 0, 0, 0, 1, 1,
-0.3773895, -0.6542724, -3.889501, 0, 0, 0, 1, 1,
-0.3734726, 0.5928473, -0.8877218, 1, 1, 1, 1, 1,
-0.3728109, 0.6323324, -1.568715, 1, 1, 1, 1, 1,
-0.3695842, -0.1210165, -0.5622234, 1, 1, 1, 1, 1,
-0.369011, -0.03915697, -2.044576, 1, 1, 1, 1, 1,
-0.3673, 0.9751734, -0.5838543, 1, 1, 1, 1, 1,
-0.3661837, -0.5137162, -2.509172, 1, 1, 1, 1, 1,
-0.3615602, 0.003212522, -1.105702, 1, 1, 1, 1, 1,
-0.3583503, -0.164925, -2.541588, 1, 1, 1, 1, 1,
-0.3580245, 0.1613558, -0.9185414, 1, 1, 1, 1, 1,
-0.3573931, -1.060777, -2.672925, 1, 1, 1, 1, 1,
-0.3554261, 0.8215998, 1.064979, 1, 1, 1, 1, 1,
-0.3520071, -0.185959, -1.567656, 1, 1, 1, 1, 1,
-0.3501295, 0.9960293, -2.693584, 1, 1, 1, 1, 1,
-0.3449689, -1.634158, -1.912806, 1, 1, 1, 1, 1,
-0.3293108, -0.2264859, -0.5593629, 1, 1, 1, 1, 1,
-0.3267742, -0.8557929, -1.981065, 0, 0, 1, 1, 1,
-0.3252579, 0.3076312, 0.2547243, 1, 0, 0, 1, 1,
-0.3212042, -0.9573478, -2.793335, 1, 0, 0, 1, 1,
-0.3207332, -1.499772, -2.619446, 1, 0, 0, 1, 1,
-0.3173912, -0.5664817, -3.078684, 1, 0, 0, 1, 1,
-0.3165188, 1.243315, 0.2979582, 1, 0, 0, 1, 1,
-0.3148451, 0.07365183, -0.07348328, 0, 0, 0, 1, 1,
-0.3094289, 1.365247, -2.203597, 0, 0, 0, 1, 1,
-0.3076238, 0.5237522, -0.8613793, 0, 0, 0, 1, 1,
-0.30455, 0.9011528, -0.3085042, 0, 0, 0, 1, 1,
-0.2999938, 0.1099409, -0.4334423, 0, 0, 0, 1, 1,
-0.2998968, -0.9013713, -2.184669, 0, 0, 0, 1, 1,
-0.2982916, 1.21115, 1.259344, 0, 0, 0, 1, 1,
-0.2974764, -1.447945, -3.732401, 1, 1, 1, 1, 1,
-0.2948657, 0.2789105, -0.2533516, 1, 1, 1, 1, 1,
-0.2927316, 1.094913, 0.9053524, 1, 1, 1, 1, 1,
-0.2876688, -1.575106, -2.653158, 1, 1, 1, 1, 1,
-0.2875628, -0.9098994, -3.887668, 1, 1, 1, 1, 1,
-0.2835431, 1.386777, -0.9268467, 1, 1, 1, 1, 1,
-0.2821185, -0.6423882, -3.836927, 1, 1, 1, 1, 1,
-0.281768, 0.7579144, -1.882267, 1, 1, 1, 1, 1,
-0.2816474, 0.5406932, -1.128613, 1, 1, 1, 1, 1,
-0.2771777, -0.7261783, -1.58724, 1, 1, 1, 1, 1,
-0.2763201, 1.153636, 0.2582293, 1, 1, 1, 1, 1,
-0.2733681, -0.187113, -2.573509, 1, 1, 1, 1, 1,
-0.2684163, 1.318352, 1.388986, 1, 1, 1, 1, 1,
-0.259422, -1.858884, -1.530362, 1, 1, 1, 1, 1,
-0.2557847, 0.7271122, -0.2090989, 1, 1, 1, 1, 1,
-0.2549542, 0.8866734, 0.5024253, 0, 0, 1, 1, 1,
-0.2541153, -0.2630296, -2.021097, 1, 0, 0, 1, 1,
-0.2503691, 0.2596882, -2.642625, 1, 0, 0, 1, 1,
-0.2446221, 0.9533213, -1.254181, 1, 0, 0, 1, 1,
-0.2440937, -0.4583736, -3.903702, 1, 0, 0, 1, 1,
-0.2374709, 0.8590771, -1.290588, 1, 0, 0, 1, 1,
-0.233457, 2.338334, -1.663035, 0, 0, 0, 1, 1,
-0.2329782, -1.742615, -4.075892, 0, 0, 0, 1, 1,
-0.2299779, 0.06140929, -0.8062176, 0, 0, 0, 1, 1,
-0.2291179, -0.1176915, -1.244253, 0, 0, 0, 1, 1,
-0.2290764, -0.4158354, -2.398458, 0, 0, 0, 1, 1,
-0.2275291, 0.2155705, -1.452554, 0, 0, 0, 1, 1,
-0.2252014, -0.1325776, -0.9826212, 0, 0, 0, 1, 1,
-0.2090599, 0.8849226, -1.121278, 1, 1, 1, 1, 1,
-0.2089374, -0.1355639, -3.283569, 1, 1, 1, 1, 1,
-0.2041239, -0.6905116, -2.174178, 1, 1, 1, 1, 1,
-0.1956356, -0.8114704, -3.154755, 1, 1, 1, 1, 1,
-0.1953597, 0.6130775, -2.17555, 1, 1, 1, 1, 1,
-0.1933716, 0.6346814, -1.150137, 1, 1, 1, 1, 1,
-0.1916502, -1.191866, -3.195086, 1, 1, 1, 1, 1,
-0.190378, 1.473918, 0.289558, 1, 1, 1, 1, 1,
-0.1900782, -0.9582215, -2.462869, 1, 1, 1, 1, 1,
-0.1866676, -0.8233353, -3.165582, 1, 1, 1, 1, 1,
-0.181301, -0.88457, -3.849866, 1, 1, 1, 1, 1,
-0.1800462, 0.5613672, -0.4040689, 1, 1, 1, 1, 1,
-0.1790442, -1.554038, -2.383866, 1, 1, 1, 1, 1,
-0.172151, -0.799432, -2.488398, 1, 1, 1, 1, 1,
-0.1712941, -0.1201554, -0.08816125, 1, 1, 1, 1, 1,
-0.1581746, -0.09873994, -1.791984, 0, 0, 1, 1, 1,
-0.1568417, -0.5381311, -2.895489, 1, 0, 0, 1, 1,
-0.1554952, 0.2655164, -1.497018, 1, 0, 0, 1, 1,
-0.1544313, 0.9108576, -0.6428597, 1, 0, 0, 1, 1,
-0.1538142, -0.2070521, -4.177534, 1, 0, 0, 1, 1,
-0.1476604, 0.7604966, -2.77017, 1, 0, 0, 1, 1,
-0.1473208, 0.3585597, 0.4821975, 0, 0, 0, 1, 1,
-0.1463948, -0.516688, -3.916875, 0, 0, 0, 1, 1,
-0.146363, -0.00201462, -0.2001071, 0, 0, 0, 1, 1,
-0.1454777, -0.3796035, -3.743012, 0, 0, 0, 1, 1,
-0.1445028, 1.345734, 0.6105154, 0, 0, 0, 1, 1,
-0.1443717, -0.2482364, -3.298702, 0, 0, 0, 1, 1,
-0.1438547, 0.009302046, -2.502148, 0, 0, 0, 1, 1,
-0.1437726, 0.2804465, -1.067402, 1, 1, 1, 1, 1,
-0.1412735, -0.5137089, -3.094727, 1, 1, 1, 1, 1,
-0.1407658, 1.263819, -0.2767652, 1, 1, 1, 1, 1,
-0.1337823, -3.092094, -1.137394, 1, 1, 1, 1, 1,
-0.1299357, -0.3908827, -4.511063, 1, 1, 1, 1, 1,
-0.1276379, 0.5373192, -0.3493165, 1, 1, 1, 1, 1,
-0.1254698, -0.3589452, -1.704764, 1, 1, 1, 1, 1,
-0.1226831, -0.0341878, -2.627064, 1, 1, 1, 1, 1,
-0.1200703, 1.027942, 0.4259141, 1, 1, 1, 1, 1,
-0.1184792, 0.5214476, -1.754956, 1, 1, 1, 1, 1,
-0.1106683, 0.4526686, -1.493918, 1, 1, 1, 1, 1,
-0.1096693, 1.134112, 1.198074, 1, 1, 1, 1, 1,
-0.1037072, -1.245014, -2.603854, 1, 1, 1, 1, 1,
-0.102246, -0.4168725, -2.313316, 1, 1, 1, 1, 1,
-0.1010819, 1.273828, 1.324851, 1, 1, 1, 1, 1,
-0.09858343, 1.268204, 1.383526, 0, 0, 1, 1, 1,
-0.09446595, -0.5729172, -3.723618, 1, 0, 0, 1, 1,
-0.09263594, 1.288429, 0.2254551, 1, 0, 0, 1, 1,
-0.08955839, 0.7911024, 1.242975, 1, 0, 0, 1, 1,
-0.08460719, 0.3698406, -2.120154, 1, 0, 0, 1, 1,
-0.07947943, 0.05370663, 0.6853507, 1, 0, 0, 1, 1,
-0.07760448, 0.2415971, -0.7985786, 0, 0, 0, 1, 1,
-0.07747114, 1.570948, -0.009222445, 0, 0, 0, 1, 1,
-0.07495388, -0.159702, -3.460766, 0, 0, 0, 1, 1,
-0.06982662, -1.433804, -2.602817, 0, 0, 0, 1, 1,
-0.06936784, 0.5778252, -0.4009513, 0, 0, 0, 1, 1,
-0.0689762, 1.854922, 0.9887071, 0, 0, 0, 1, 1,
-0.06285273, 1.071443, 0.3301337, 0, 0, 0, 1, 1,
-0.05865221, -0.5564619, -4.176223, 1, 1, 1, 1, 1,
-0.05745561, -0.4197623, -2.109976, 1, 1, 1, 1, 1,
-0.05709578, 1.413812, 1.363312, 1, 1, 1, 1, 1,
-0.0561638, -1.182385, -2.576867, 1, 1, 1, 1, 1,
-0.05604864, -0.2951746, -2.958345, 1, 1, 1, 1, 1,
-0.05255777, 1.170946, -0.4704255, 1, 1, 1, 1, 1,
-0.05161461, 0.5631505, -1.966436, 1, 1, 1, 1, 1,
-0.04365448, 0.01646834, -1.318278, 1, 1, 1, 1, 1,
-0.04177, 1.248027, 0.4316391, 1, 1, 1, 1, 1,
-0.04085597, -2.479601, -3.889086, 1, 1, 1, 1, 1,
-0.0403729, 0.4095227, 1.245864, 1, 1, 1, 1, 1,
-0.04018878, 0.5784622, -1.304715, 1, 1, 1, 1, 1,
-0.03944012, 2.503027, 0.3878674, 1, 1, 1, 1, 1,
-0.03927158, -0.7718849, -2.150235, 1, 1, 1, 1, 1,
-0.037963, -0.5797532, -3.725706, 1, 1, 1, 1, 1,
-0.0372554, 2.53748, 0.5482917, 0, 0, 1, 1, 1,
-0.03546117, -0.3312846, -0.8704109, 1, 0, 0, 1, 1,
-0.03317117, -1.283212, -3.713992, 1, 0, 0, 1, 1,
-0.0267283, 0.5884361, 0.1434915, 1, 0, 0, 1, 1,
-0.02313306, -0.2930207, -3.669209, 1, 0, 0, 1, 1,
-0.02249969, -0.1573436, -1.179467, 1, 0, 0, 1, 1,
-0.02128232, 0.02252101, -0.4410993, 0, 0, 0, 1, 1,
-0.01813677, -1.644957, -1.164404, 0, 0, 0, 1, 1,
-0.01579307, -0.4370629, -3.274402, 0, 0, 0, 1, 1,
-0.01540099, 1.704673, 0.8166232, 0, 0, 0, 1, 1,
-0.0136069, 0.3711071, -0.9837223, 0, 0, 0, 1, 1,
-0.01344931, -0.3591585, -2.965388, 0, 0, 0, 1, 1,
-0.007886592, 0.2968957, 0.3436547, 0, 0, 0, 1, 1,
-0.004815807, 0.04773956, -0.3266814, 1, 1, 1, 1, 1,
-0.00464897, -1.665385, -2.714512, 1, 1, 1, 1, 1,
0.0008362495, 0.9385576, -2.083277, 1, 1, 1, 1, 1,
0.009302945, 1.328946, 0.2695581, 1, 1, 1, 1, 1,
0.009623172, 0.8978662, 0.5305578, 1, 1, 1, 1, 1,
0.01010716, -0.002918052, 1.684533, 1, 1, 1, 1, 1,
0.01452231, 0.3192542, 0.9101192, 1, 1, 1, 1, 1,
0.01622831, -0.8319803, 1.644779, 1, 1, 1, 1, 1,
0.01782839, -0.8429322, 3.473865, 1, 1, 1, 1, 1,
0.02096983, -0.4547246, 2.46456, 1, 1, 1, 1, 1,
0.0212303, -0.02223221, 2.655577, 1, 1, 1, 1, 1,
0.02274556, 0.458452, 1.11222, 1, 1, 1, 1, 1,
0.02348366, -0.4514112, 2.700835, 1, 1, 1, 1, 1,
0.024551, -0.06644484, 3.856646, 1, 1, 1, 1, 1,
0.02901351, -0.9978641, 2.959803, 1, 1, 1, 1, 1,
0.03202929, -0.04625401, 1.748807, 0, 0, 1, 1, 1,
0.0356737, -0.5502336, 2.401733, 1, 0, 0, 1, 1,
0.03714235, 0.512764, -0.7546792, 1, 0, 0, 1, 1,
0.03876753, -0.8152159, 2.956378, 1, 0, 0, 1, 1,
0.04143377, -0.2007805, 4.973228, 1, 0, 0, 1, 1,
0.044262, 0.3208911, 1.272988, 1, 0, 0, 1, 1,
0.04432169, -0.7500356, 1.739887, 0, 0, 0, 1, 1,
0.04976007, 0.02674147, -0.01648935, 0, 0, 0, 1, 1,
0.05000709, -1.643826, 3.466724, 0, 0, 0, 1, 1,
0.05560976, -0.3304868, 2.997899, 0, 0, 0, 1, 1,
0.05743503, 0.7817512, 0.1290266, 0, 0, 0, 1, 1,
0.05840456, 0.9061845, 1.648868, 0, 0, 0, 1, 1,
0.06091615, 0.7537025, -0.000468747, 0, 0, 0, 1, 1,
0.06393392, 0.580093, 1.106857, 1, 1, 1, 1, 1,
0.06446903, -1.6974, 3.326405, 1, 1, 1, 1, 1,
0.0690888, -0.04868367, 4.195117, 1, 1, 1, 1, 1,
0.07401764, 0.6654958, -1.251623, 1, 1, 1, 1, 1,
0.07872014, -0.6457856, 4.436742, 1, 1, 1, 1, 1,
0.07873619, 0.05229845, 0.3557929, 1, 1, 1, 1, 1,
0.07997561, 0.1271524, -0.3894094, 1, 1, 1, 1, 1,
0.0841352, 1.279215, -0.4625946, 1, 1, 1, 1, 1,
0.08461822, 1.453457, -0.6885855, 1, 1, 1, 1, 1,
0.08883319, -0.4237218, 3.13605, 1, 1, 1, 1, 1,
0.09301394, 0.1594114, 1.55308, 1, 1, 1, 1, 1,
0.09402698, -0.05660123, 2.264393, 1, 1, 1, 1, 1,
0.09783113, 0.2316792, 0.9886082, 1, 1, 1, 1, 1,
0.09852639, 1.031158, -1.486283, 1, 1, 1, 1, 1,
0.09854231, -0.04663601, 2.920933, 1, 1, 1, 1, 1,
0.1017391, -1.585291, 2.674402, 0, 0, 1, 1, 1,
0.1074668, -0.09475681, 3.724399, 1, 0, 0, 1, 1,
0.1103778, 0.1708239, 1.333951, 1, 0, 0, 1, 1,
0.1146126, -1.146922, 2.733233, 1, 0, 0, 1, 1,
0.1160879, 0.2911959, 0.7864977, 1, 0, 0, 1, 1,
0.1199132, 1.268534, 0.3084192, 1, 0, 0, 1, 1,
0.1247336, 2.238224, 0.01957372, 0, 0, 0, 1, 1,
0.1280142, -0.489453, 4.64752, 0, 0, 0, 1, 1,
0.1280996, 0.3166879, 1.586097, 0, 0, 0, 1, 1,
0.1284447, -0.6753371, 0.9744384, 0, 0, 0, 1, 1,
0.129993, -1.067906, 3.047134, 0, 0, 0, 1, 1,
0.1313976, -0.4036213, 3.199075, 0, 0, 0, 1, 1,
0.1414873, 1.747181, -1.95893, 0, 0, 0, 1, 1,
0.1437034, -1.365154, 3.490862, 1, 1, 1, 1, 1,
0.148235, 1.422642, 2.047901, 1, 1, 1, 1, 1,
0.1517227, -0.8338672, 2.592263, 1, 1, 1, 1, 1,
0.1518086, 0.8518081, 1.490488, 1, 1, 1, 1, 1,
0.1529321, 1.490463, -0.8876386, 1, 1, 1, 1, 1,
0.1550247, -1.067982, 2.921839, 1, 1, 1, 1, 1,
0.1552763, -1.6504, 3.617805, 1, 1, 1, 1, 1,
0.1558611, 1.044676, 1.57942, 1, 1, 1, 1, 1,
0.1597722, -1.562684, 1.771357, 1, 1, 1, 1, 1,
0.1599837, -0.2788464, 2.061087, 1, 1, 1, 1, 1,
0.1606429, -3.031353, 1.499166, 1, 1, 1, 1, 1,
0.1630897, 1.526687, -2.105657, 1, 1, 1, 1, 1,
0.1632428, -1.45283, 2.339916, 1, 1, 1, 1, 1,
0.1660445, 0.1533232, 1.185379, 1, 1, 1, 1, 1,
0.1680818, 0.3089126, 0.4553065, 1, 1, 1, 1, 1,
0.1709363, 0.3388652, 1.539967, 0, 0, 1, 1, 1,
0.1711774, -0.5379921, 2.972247, 1, 0, 0, 1, 1,
0.1723402, 1.651145, -0.08074047, 1, 0, 0, 1, 1,
0.1762791, -1.644318, 2.279861, 1, 0, 0, 1, 1,
0.1769548, -0.254497, 2.678328, 1, 0, 0, 1, 1,
0.1788267, -0.4887082, 3.383458, 1, 0, 0, 1, 1,
0.1857186, 0.2437735, 1.564771, 0, 0, 0, 1, 1,
0.1925487, -0.7027166, 2.672024, 0, 0, 0, 1, 1,
0.1951564, -0.7043849, 3.151066, 0, 0, 0, 1, 1,
0.1957171, -0.3729, 1.431741, 0, 0, 0, 1, 1,
0.1992469, 0.4904118, 2.186516, 0, 0, 0, 1, 1,
0.1993896, 0.4897194, -0.3279811, 0, 0, 0, 1, 1,
0.1997088, -1.508489, 0.8983858, 0, 0, 0, 1, 1,
0.2051702, -1.040671, 1.37909, 1, 1, 1, 1, 1,
0.2054703, 0.3468549, 0.844739, 1, 1, 1, 1, 1,
0.2082435, 0.6331174, -0.09060937, 1, 1, 1, 1, 1,
0.211492, 0.3977956, 0.4471636, 1, 1, 1, 1, 1,
0.2162864, 1.201597, 0.4808487, 1, 1, 1, 1, 1,
0.2164592, -1.192568, 1.495135, 1, 1, 1, 1, 1,
0.2165079, -2.567647, 3.136689, 1, 1, 1, 1, 1,
0.2188119, -0.7369431, 0.4454811, 1, 1, 1, 1, 1,
0.2220214, -0.7561755, 3.458874, 1, 1, 1, 1, 1,
0.2257394, -0.5462081, 2.833447, 1, 1, 1, 1, 1,
0.2258282, -1.07476, 2.194932, 1, 1, 1, 1, 1,
0.2261247, 2.378355, -0.4177525, 1, 1, 1, 1, 1,
0.2315371, -0.6068718, 2.98566, 1, 1, 1, 1, 1,
0.2368864, -0.2006399, 3.182969, 1, 1, 1, 1, 1,
0.237122, -1.135841, 2.753094, 1, 1, 1, 1, 1,
0.2382997, 1.014916, 0.02820743, 0, 0, 1, 1, 1,
0.2388373, 0.881187, -0.1968217, 1, 0, 0, 1, 1,
0.240825, -1.004397, 3.212835, 1, 0, 0, 1, 1,
0.2421387, 0.449218, 0.8752844, 1, 0, 0, 1, 1,
0.2443247, -1.531992, 2.682492, 1, 0, 0, 1, 1,
0.2450837, -0.2706471, 1.388423, 1, 0, 0, 1, 1,
0.2451342, -1.295325, 2.373248, 0, 0, 0, 1, 1,
0.2467733, -0.0736981, 0.8162283, 0, 0, 0, 1, 1,
0.2517465, -0.330016, 0.8819166, 0, 0, 0, 1, 1,
0.2535722, 0.2126129, 0.3965993, 0, 0, 0, 1, 1,
0.254593, 1.309289, 1.667925, 0, 0, 0, 1, 1,
0.2547593, 0.2850536, 0.805696, 0, 0, 0, 1, 1,
0.2581583, 0.5954555, 0.2693882, 0, 0, 0, 1, 1,
0.2582901, 0.01350874, 1.363482, 1, 1, 1, 1, 1,
0.2601072, 0.7888646, 1.095741, 1, 1, 1, 1, 1,
0.2644938, -2.146194, 3.43518, 1, 1, 1, 1, 1,
0.2687461, -0.01373163, 3.427092, 1, 1, 1, 1, 1,
0.269778, 0.4992702, 1.613301, 1, 1, 1, 1, 1,
0.2778673, 0.4554839, 0.6667908, 1, 1, 1, 1, 1,
0.2810518, -0.7487232, 3.937989, 1, 1, 1, 1, 1,
0.2881005, 0.921351, -0.3658173, 1, 1, 1, 1, 1,
0.2897147, -1.042832, 3.36261, 1, 1, 1, 1, 1,
0.2935282, 0.1616399, 3.053785, 1, 1, 1, 1, 1,
0.2956549, -0.03944797, 1.212598, 1, 1, 1, 1, 1,
0.2964941, -0.5872043, 2.511844, 1, 1, 1, 1, 1,
0.2989189, -1.285442, 2.239479, 1, 1, 1, 1, 1,
0.2992478, -0.3413555, 3.143163, 1, 1, 1, 1, 1,
0.3104358, 0.987195, 1.845399, 1, 1, 1, 1, 1,
0.3197952, -0.2384131, 0.3313177, 0, 0, 1, 1, 1,
0.3214963, -0.7764888, 3.02031, 1, 0, 0, 1, 1,
0.3222937, -1.564011, 2.024126, 1, 0, 0, 1, 1,
0.3243794, 1.277545, 0.5830519, 1, 0, 0, 1, 1,
0.3306299, 0.06522959, 2.019641, 1, 0, 0, 1, 1,
0.3323382, 1.065868, 2.13733, 1, 0, 0, 1, 1,
0.3332096, -0.3893319, 2.554995, 0, 0, 0, 1, 1,
0.333273, 0.2479184, 0.09775468, 0, 0, 0, 1, 1,
0.3334427, -0.1144611, 0.6493385, 0, 0, 0, 1, 1,
0.3339632, 0.1325828, 0.4688814, 0, 0, 0, 1, 1,
0.3381044, -0.3243912, 2.762127, 0, 0, 0, 1, 1,
0.3387028, 0.9932888, 1.029803, 0, 0, 0, 1, 1,
0.3400474, 0.8454859, 1.274589, 0, 0, 0, 1, 1,
0.3411267, -0.161199, 2.304023, 1, 1, 1, 1, 1,
0.3444637, 0.8429773, -0.2998088, 1, 1, 1, 1, 1,
0.3458675, -1.259604, 2.955726, 1, 1, 1, 1, 1,
0.3461839, -0.01067947, -0.09995973, 1, 1, 1, 1, 1,
0.3469328, 0.9421977, 1.814905, 1, 1, 1, 1, 1,
0.3481645, 0.4248337, 0.6326818, 1, 1, 1, 1, 1,
0.3503832, 2.172328, 0.05351489, 1, 1, 1, 1, 1,
0.3596391, -0.1678091, 0.8029298, 1, 1, 1, 1, 1,
0.3605985, 0.3044805, -0.5021068, 1, 1, 1, 1, 1,
0.3705976, -0.072342, 1.28719, 1, 1, 1, 1, 1,
0.3752939, -0.04707619, 0.5454561, 1, 1, 1, 1, 1,
0.382902, -0.8834399, 2.008909, 1, 1, 1, 1, 1,
0.384146, -0.1763151, 0.1765371, 1, 1, 1, 1, 1,
0.3861836, 0.4811338, 1.39933, 1, 1, 1, 1, 1,
0.3869703, -1.548029, 2.628434, 1, 1, 1, 1, 1,
0.3879036, 1.31922, 0.3843019, 0, 0, 1, 1, 1,
0.3883571, 0.445729, 2.22137, 1, 0, 0, 1, 1,
0.3888042, -0.2679712, 0.6314955, 1, 0, 0, 1, 1,
0.3946072, 0.08784172, 1.299612, 1, 0, 0, 1, 1,
0.3962069, -0.6471223, 2.512082, 1, 0, 0, 1, 1,
0.3972302, 0.9821907, 0.08620515, 1, 0, 0, 1, 1,
0.3991753, 0.009350961, 1.266315, 0, 0, 0, 1, 1,
0.39976, 0.5573691, 0.9974666, 0, 0, 0, 1, 1,
0.405422, 1.749759, 0.7196638, 0, 0, 0, 1, 1,
0.4068022, -1.017247, 3.319179, 0, 0, 0, 1, 1,
0.409823, -0.5081698, 2.440167, 0, 0, 0, 1, 1,
0.4101637, -0.3972739, 2.49508, 0, 0, 0, 1, 1,
0.4115298, 2.129395, 0.9981105, 0, 0, 0, 1, 1,
0.4122331, 0.6944757, 0.04808548, 1, 1, 1, 1, 1,
0.4317834, 1.323777, -0.1986842, 1, 1, 1, 1, 1,
0.43355, -1.147207, 2.131833, 1, 1, 1, 1, 1,
0.4367858, -0.649636, 2.980916, 1, 1, 1, 1, 1,
0.4418176, 0.009684785, 1.084592, 1, 1, 1, 1, 1,
0.4504401, 1.217839, 0.06559843, 1, 1, 1, 1, 1,
0.4524766, 0.1617388, -0.07867781, 1, 1, 1, 1, 1,
0.4524775, 0.3810436, 2.43575, 1, 1, 1, 1, 1,
0.4547676, 1.346836, -0.01477164, 1, 1, 1, 1, 1,
0.4577588, 1.849573, 0.7170832, 1, 1, 1, 1, 1,
0.4585923, 0.3948441, 2.017428, 1, 1, 1, 1, 1,
0.4606545, 0.03079394, 2.516905, 1, 1, 1, 1, 1,
0.461394, -0.02972736, 0.2333371, 1, 1, 1, 1, 1,
0.4622776, -0.739363, 2.111345, 1, 1, 1, 1, 1,
0.4633165, -0.02058535, 0.5425087, 1, 1, 1, 1, 1,
0.4687652, 0.5427628, 1.296952, 0, 0, 1, 1, 1,
0.4715843, -0.4828481, 3.024348, 1, 0, 0, 1, 1,
0.4760902, -0.1318319, 2.465296, 1, 0, 0, 1, 1,
0.4810055, 1.968469, -0.9702637, 1, 0, 0, 1, 1,
0.4850478, -1.455391, 1.311158, 1, 0, 0, 1, 1,
0.485613, 0.796398, 0.2738975, 1, 0, 0, 1, 1,
0.4896125, -0.2156307, 1.204721, 0, 0, 0, 1, 1,
0.4917886, 1.080603, 1.073997, 0, 0, 0, 1, 1,
0.4932063, 0.4771268, 0.5009297, 0, 0, 0, 1, 1,
0.4934405, -1.59684, 1.887985, 0, 0, 0, 1, 1,
0.4968943, -1.851112, 2.980418, 0, 0, 0, 1, 1,
0.4971536, 1.084495, 0.8350158, 0, 0, 0, 1, 1,
0.4976972, 0.791379, 1.146188, 0, 0, 0, 1, 1,
0.4987706, 1.221435, -0.3788053, 1, 1, 1, 1, 1,
0.5082111, 0.7276545, -1.049293, 1, 1, 1, 1, 1,
0.5103549, 1.043185, 1.005495, 1, 1, 1, 1, 1,
0.5245043, -0.07597732, 1.308455, 1, 1, 1, 1, 1,
0.5258592, -0.1367946, 1.100843, 1, 1, 1, 1, 1,
0.5302291, 0.3741838, 3.009752, 1, 1, 1, 1, 1,
0.5313385, 0.9882347, 0.6604986, 1, 1, 1, 1, 1,
0.5348892, 0.381166, 0.8255204, 1, 1, 1, 1, 1,
0.5349842, 0.592473, 1.602961, 1, 1, 1, 1, 1,
0.542152, 0.7560803, 0.3274651, 1, 1, 1, 1, 1,
0.542649, -0.4647495, 2.475999, 1, 1, 1, 1, 1,
0.5430101, -0.4627318, 1.455828, 1, 1, 1, 1, 1,
0.5440562, 0.08986551, 1.694929, 1, 1, 1, 1, 1,
0.5446579, -1.127735, 2.441828, 1, 1, 1, 1, 1,
0.5446872, -1.046031, 2.600254, 1, 1, 1, 1, 1,
0.5492178, -0.3980927, 2.388876, 0, 0, 1, 1, 1,
0.5590584, 0.2117139, 1.645925, 1, 0, 0, 1, 1,
0.5647604, 0.629625, 0.724561, 1, 0, 0, 1, 1,
0.5706074, 0.4101606, 1.083369, 1, 0, 0, 1, 1,
0.5728356, 0.5112627, -0.08129712, 1, 0, 0, 1, 1,
0.5732492, -1.536767, 3.032574, 1, 0, 0, 1, 1,
0.5737142, -1.038237, 1.858988, 0, 0, 0, 1, 1,
0.5763763, -0.3077259, 3.496741, 0, 0, 0, 1, 1,
0.5786528, 1.174992, 0.6695754, 0, 0, 0, 1, 1,
0.5789585, 0.238798, 1.469232, 0, 0, 0, 1, 1,
0.5798289, 1.077472, 1.824497, 0, 0, 0, 1, 1,
0.5801157, -0.2851282, 2.147554, 0, 0, 0, 1, 1,
0.5835686, -1.012775, 1.202865, 0, 0, 0, 1, 1,
0.5865415, -1.739449, 4.54741, 1, 1, 1, 1, 1,
0.5881575, 0.660879, -2.005841, 1, 1, 1, 1, 1,
0.5889399, 0.0110781, 1.391242, 1, 1, 1, 1, 1,
0.5911438, -0.4047198, 1.855876, 1, 1, 1, 1, 1,
0.5927804, 0.407649, 1.539359, 1, 1, 1, 1, 1,
0.5999756, 1.488235, 0.5759625, 1, 1, 1, 1, 1,
0.6001874, -0.3150298, 3.126799, 1, 1, 1, 1, 1,
0.6016704, -0.56621, 1.405126, 1, 1, 1, 1, 1,
0.602228, -0.58735, 2.012002, 1, 1, 1, 1, 1,
0.6065818, 1.015395, 0.6243657, 1, 1, 1, 1, 1,
0.6150233, 2.077157, 0.04537758, 1, 1, 1, 1, 1,
0.6170242, -1.111889, 3.255871, 1, 1, 1, 1, 1,
0.6182845, -1.094683, 1.856539, 1, 1, 1, 1, 1,
0.6191561, -0.5425711, 1.239903, 1, 1, 1, 1, 1,
0.6236067, -0.5173649, 1.055144, 1, 1, 1, 1, 1,
0.623808, 0.1745142, 0.6550182, 0, 0, 1, 1, 1,
0.6308761, 0.7711369, -0.7392802, 1, 0, 0, 1, 1,
0.6319867, 1.277916, 0.862294, 1, 0, 0, 1, 1,
0.6331199, -1.705226, 2.250256, 1, 0, 0, 1, 1,
0.6408296, -0.1316077, 3.362902, 1, 0, 0, 1, 1,
0.6411243, 1.392218, -0.4089297, 1, 0, 0, 1, 1,
0.6466644, -1.986871, 4.423899, 0, 0, 0, 1, 1,
0.6488392, 0.8801646, 0.8380335, 0, 0, 0, 1, 1,
0.6490671, 1.047951, 0.4260012, 0, 0, 0, 1, 1,
0.651998, 1.664202, 3.20754, 0, 0, 0, 1, 1,
0.6600811, 0.2451446, 2.279188, 0, 0, 0, 1, 1,
0.6651299, 1.227884, -0.4776015, 0, 0, 0, 1, 1,
0.6672259, -1.402098, 2.567488, 0, 0, 0, 1, 1,
0.6676906, -0.6958156, 4.68045, 1, 1, 1, 1, 1,
0.6681585, -1.021271, 3.593206, 1, 1, 1, 1, 1,
0.6683096, 1.189403, 0.3047523, 1, 1, 1, 1, 1,
0.6754284, 0.4684817, 0.9690084, 1, 1, 1, 1, 1,
0.6767768, 2.151577, 0.7691144, 1, 1, 1, 1, 1,
0.6777088, -0.1730353, 1.967003, 1, 1, 1, 1, 1,
0.6778145, -0.4428418, 2.341805, 1, 1, 1, 1, 1,
0.6780255, 1.513535, 0.6912459, 1, 1, 1, 1, 1,
0.6798364, 0.5827856, 1.381956, 1, 1, 1, 1, 1,
0.6818975, -0.4046376, 1.286048, 1, 1, 1, 1, 1,
0.6822467, 0.9980037, 1.012398, 1, 1, 1, 1, 1,
0.6835742, 1.46116, 0.196166, 1, 1, 1, 1, 1,
0.6843868, 0.09749688, 2.100266, 1, 1, 1, 1, 1,
0.6852221, -0.1509852, 2.827134, 1, 1, 1, 1, 1,
0.6856533, 0.5744883, 0.5515097, 1, 1, 1, 1, 1,
0.688341, -0.09195447, 0.9620894, 0, 0, 1, 1, 1,
0.6975265, 0.06593241, 0.3994851, 1, 0, 0, 1, 1,
0.7029766, 0.9859607, 0.1553155, 1, 0, 0, 1, 1,
0.7037416, -0.3138856, 0.6060039, 1, 0, 0, 1, 1,
0.7048864, -0.1122213, 2.177043, 1, 0, 0, 1, 1,
0.7067255, -1.050319, 2.689369, 1, 0, 0, 1, 1,
0.7071292, 1.337547, 0.7010235, 0, 0, 0, 1, 1,
0.7074191, 1.047564, 1.12958, 0, 0, 0, 1, 1,
0.7079107, 0.1884881, 1.850069, 0, 0, 0, 1, 1,
0.7103481, 0.9591448, 1.160239, 0, 0, 0, 1, 1,
0.7120262, -0.579627, 3.785735, 0, 0, 0, 1, 1,
0.71395, -0.7865783, 2.604401, 0, 0, 0, 1, 1,
0.7152472, -0.8385565, 2.239483, 0, 0, 0, 1, 1,
0.7193552, 0.5434066, 0.9347394, 1, 1, 1, 1, 1,
0.721877, -0.211215, 3.204171, 1, 1, 1, 1, 1,
0.72554, 0.1500233, 1.041474, 1, 1, 1, 1, 1,
0.7320304, -1.604434, 1.481187, 1, 1, 1, 1, 1,
0.7488586, -1.585518, 1.107419, 1, 1, 1, 1, 1,
0.7490935, 1.151866, -0.05877067, 1, 1, 1, 1, 1,
0.7505559, -1.492981, 1.646489, 1, 1, 1, 1, 1,
0.7570892, 1.257475, 0.2351511, 1, 1, 1, 1, 1,
0.7578583, 1.507277, 1.406556, 1, 1, 1, 1, 1,
0.759128, 0.835547, -0.4008313, 1, 1, 1, 1, 1,
0.7649379, -0.5945917, 1.651241, 1, 1, 1, 1, 1,
0.7665582, -2.442747, 3.18564, 1, 1, 1, 1, 1,
0.766616, -0.2647154, 0.6809973, 1, 1, 1, 1, 1,
0.7714333, -1.687515, 1.653243, 1, 1, 1, 1, 1,
0.771633, -0.2707867, 0.3252536, 1, 1, 1, 1, 1,
0.7782921, 0.1177197, 3.022754, 0, 0, 1, 1, 1,
0.7824311, 1.514461, 0.5318402, 1, 0, 0, 1, 1,
0.7862774, -0.6422172, 2.022834, 1, 0, 0, 1, 1,
0.7943784, 1.454599, -0.2234134, 1, 0, 0, 1, 1,
0.7986594, 0.25034, 0.7953711, 1, 0, 0, 1, 1,
0.7989853, 0.5328219, 0.6838787, 1, 0, 0, 1, 1,
0.8018432, -1.166186, 1.36154, 0, 0, 0, 1, 1,
0.8046038, 0.1336119, 1.145162, 0, 0, 0, 1, 1,
0.806496, -1.032694, 2.231911, 0, 0, 0, 1, 1,
0.8068565, -1.507453, 0.6431003, 0, 0, 0, 1, 1,
0.8107, -0.05948965, 0.3317199, 0, 0, 0, 1, 1,
0.8125252, 1.676842, -0.02088009, 0, 0, 0, 1, 1,
0.8184772, -0.002058977, 0.9693037, 0, 0, 0, 1, 1,
0.8208885, 1.152705, -0.8845151, 1, 1, 1, 1, 1,
0.8223912, 1.744298, 2.422489, 1, 1, 1, 1, 1,
0.8239799, -0.1624589, 2.837271, 1, 1, 1, 1, 1,
0.8248869, -1.08192, 3.367625, 1, 1, 1, 1, 1,
0.8274236, -1.321217, 2.897249, 1, 1, 1, 1, 1,
0.8297035, -1.340038, 3.338332, 1, 1, 1, 1, 1,
0.8300009, -0.564904, -0.05771102, 1, 1, 1, 1, 1,
0.8303081, -1.079352, 2.876078, 1, 1, 1, 1, 1,
0.8353111, -0.5609285, 2.525101, 1, 1, 1, 1, 1,
0.8387392, -0.4959683, 2.590661, 1, 1, 1, 1, 1,
0.8390771, -1.548418, 2.131459, 1, 1, 1, 1, 1,
0.8494277, -1.075423, 2.76592, 1, 1, 1, 1, 1,
0.852087, -1.170982, 3.101006, 1, 1, 1, 1, 1,
0.8596885, 0.5974597, 2.338715, 1, 1, 1, 1, 1,
0.8628638, 0.7540732, 1.119341, 1, 1, 1, 1, 1,
0.8683346, 0.2027248, 2.164036, 0, 0, 1, 1, 1,
0.8814203, 0.1973057, 2.404321, 1, 0, 0, 1, 1,
0.8906016, 0.7977622, -0.03178805, 1, 0, 0, 1, 1,
0.8914479, -0.762234, 3.639229, 1, 0, 0, 1, 1,
0.8920909, 1.576719, 1.66381, 1, 0, 0, 1, 1,
0.893719, 0.4226288, 0.3998365, 1, 0, 0, 1, 1,
0.8945492, 0.4807858, 1.152838, 0, 0, 0, 1, 1,
0.8966473, 0.9884416, 1.393166, 0, 0, 0, 1, 1,
0.8991051, 0.7904181, 0.4125194, 0, 0, 0, 1, 1,
0.9022246, 0.7087433, -0.2499572, 0, 0, 0, 1, 1,
0.9056804, 0.1818746, 0.9616112, 0, 0, 0, 1, 1,
0.909065, 0.6590544, 1.499655, 0, 0, 0, 1, 1,
0.9245385, 1.674457, 0.2049498, 0, 0, 0, 1, 1,
0.9315142, 0.3737161, 1.916402, 1, 1, 1, 1, 1,
0.9381745, 0.5609435, 1.554153, 1, 1, 1, 1, 1,
0.9447163, -1.393106, 2.72656, 1, 1, 1, 1, 1,
0.9511117, 0.2921857, 0.3591793, 1, 1, 1, 1, 1,
0.9554033, -1.529865, 1.156577, 1, 1, 1, 1, 1,
0.9613454, 0.6997731, 3.304765, 1, 1, 1, 1, 1,
0.9622723, -0.3982124, 2.462784, 1, 1, 1, 1, 1,
0.9698008, 0.3827657, 2.303303, 1, 1, 1, 1, 1,
0.9700655, 0.4833909, -0.05688031, 1, 1, 1, 1, 1,
0.9884302, 0.2149979, 0.8872382, 1, 1, 1, 1, 1,
0.9903082, 0.1626621, 3.34537, 1, 1, 1, 1, 1,
0.9910696, 0.01453277, 0.358357, 1, 1, 1, 1, 1,
0.9954999, 0.5626366, 1.50764, 1, 1, 1, 1, 1,
0.9964333, 0.4125012, 4.130616, 1, 1, 1, 1, 1,
0.9994198, 1.056236, -0.01750774, 1, 1, 1, 1, 1,
1.002854, 1.910712, -1.610298, 0, 0, 1, 1, 1,
1.021432, -1.265101, 3.004635, 1, 0, 0, 1, 1,
1.029976, 0.2344491, 1.521532, 1, 0, 0, 1, 1,
1.041137, -0.1343605, 0.4584336, 1, 0, 0, 1, 1,
1.049598, 1.539459, 1.540217, 1, 0, 0, 1, 1,
1.053565, 2.548003, 0.6005825, 1, 0, 0, 1, 1,
1.055294, -0.517614, 2.030041, 0, 0, 0, 1, 1,
1.055785, -1.824512, 2.72466, 0, 0, 0, 1, 1,
1.058358, 1.42126, 1.017077, 0, 0, 0, 1, 1,
1.065338, -2.631053, 3.727652, 0, 0, 0, 1, 1,
1.067847, 0.005794709, 1.300806, 0, 0, 0, 1, 1,
1.068295, -0.7993683, 2.494034, 0, 0, 0, 1, 1,
1.079466, -0.4304053, 1.15727, 0, 0, 0, 1, 1,
1.084125, 0.5700262, -0.5520027, 1, 1, 1, 1, 1,
1.094535, -1.073491, 1.223814, 1, 1, 1, 1, 1,
1.096539, 0.4025624, 1.191306, 1, 1, 1, 1, 1,
1.099585, -1.692666, 1.505593, 1, 1, 1, 1, 1,
1.102193, 0.07943542, 1.491088, 1, 1, 1, 1, 1,
1.102998, -1.068121, 3.708678, 1, 1, 1, 1, 1,
1.109971, -0.5263923, 1.309182, 1, 1, 1, 1, 1,
1.114691, 0.2654838, 0.9981699, 1, 1, 1, 1, 1,
1.116013, -2.895104, 2.747279, 1, 1, 1, 1, 1,
1.119208, -0.957534, 3.008322, 1, 1, 1, 1, 1,
1.120615, -0.4925457, 1.939552, 1, 1, 1, 1, 1,
1.121952, -0.6409886, 1.662227, 1, 1, 1, 1, 1,
1.12207, 1.578484, 0.6484789, 1, 1, 1, 1, 1,
1.124404, 0.3492596, 2.40257, 1, 1, 1, 1, 1,
1.126095, -0.287214, 2.893236, 1, 1, 1, 1, 1,
1.134123, 0.03701314, 0.9282041, 0, 0, 1, 1, 1,
1.134482, -0.1964455, 2.300977, 1, 0, 0, 1, 1,
1.157976, -1.672936, 4.290455, 1, 0, 0, 1, 1,
1.164609, -0.1475768, 2.578727, 1, 0, 0, 1, 1,
1.170703, -0.7590753, 3.176272, 1, 0, 0, 1, 1,
1.172967, -0.9129691, 2.359635, 1, 0, 0, 1, 1,
1.18478, -1.307045, 4.001774, 0, 0, 0, 1, 1,
1.188447, -1.316875, 0.946476, 0, 0, 0, 1, 1,
1.190057, 2.543592, -0.129224, 0, 0, 0, 1, 1,
1.196491, -0.2682796, 3.152815, 0, 0, 0, 1, 1,
1.200612, 0.921461, -0.4418483, 0, 0, 0, 1, 1,
1.201347, 0.873111, 0.1387776, 0, 0, 0, 1, 1,
1.207042, 0.2925126, 0.7568198, 0, 0, 0, 1, 1,
1.207807, 1.391853, 0.7715697, 1, 1, 1, 1, 1,
1.210925, 0.9892456, 1.035281, 1, 1, 1, 1, 1,
1.219765, 1.546793, 1.058296, 1, 1, 1, 1, 1,
1.221403, 0.957155, 0.5771454, 1, 1, 1, 1, 1,
1.232919, -1.336665, 3.71839, 1, 1, 1, 1, 1,
1.242832, 0.8608683, 0.6424793, 1, 1, 1, 1, 1,
1.244327, 0.5348837, 1.61548, 1, 1, 1, 1, 1,
1.257465, 0.1741941, -0.1271009, 1, 1, 1, 1, 1,
1.257777, -1.016888, 3.793924, 1, 1, 1, 1, 1,
1.264783, -0.2188302, 2.310842, 1, 1, 1, 1, 1,
1.268041, 0.8120619, -0.3927807, 1, 1, 1, 1, 1,
1.272432, -1.298216, 1.703645, 1, 1, 1, 1, 1,
1.278618, 0.2683588, 0.5770384, 1, 1, 1, 1, 1,
1.279646, -0.5259724, 2.242651, 1, 1, 1, 1, 1,
1.288685, 0.7759589, 2.071045, 1, 1, 1, 1, 1,
1.288733, -0.5038997, 2.942098, 0, 0, 1, 1, 1,
1.288807, -0.312477, 1.683792, 1, 0, 0, 1, 1,
1.29714, -0.7033504, 2.076264, 1, 0, 0, 1, 1,
1.300601, 0.5858093, 0.6556283, 1, 0, 0, 1, 1,
1.302699, 1.377204, 0.9821263, 1, 0, 0, 1, 1,
1.304719, 1.332507, 0.9575396, 1, 0, 0, 1, 1,
1.307511, 0.6077344, -1.043563, 0, 0, 0, 1, 1,
1.311236, 0.004639496, 0.1751009, 0, 0, 0, 1, 1,
1.311666, -0.1860447, 2.129192, 0, 0, 0, 1, 1,
1.313918, 0.1905345, 2.131581, 0, 0, 0, 1, 1,
1.317832, 0.03838585, 0.8845918, 0, 0, 0, 1, 1,
1.323672, 0.3928884, 1.119114, 0, 0, 0, 1, 1,
1.327424, -0.2236612, 3.502822, 0, 0, 0, 1, 1,
1.329808, -0.1475294, 0.2990039, 1, 1, 1, 1, 1,
1.333541, 0.2104034, 1.132573, 1, 1, 1, 1, 1,
1.352452, 1.312045, 0.0281936, 1, 1, 1, 1, 1,
1.355161, 0.2447845, 1.312924, 1, 1, 1, 1, 1,
1.363628, 0.9461973, 0.4608065, 1, 1, 1, 1, 1,
1.389019, -0.2490536, 2.323402, 1, 1, 1, 1, 1,
1.417459, 1.163759, 0.4371129, 1, 1, 1, 1, 1,
1.426028, 0.582633, 0.909849, 1, 1, 1, 1, 1,
1.429706, -1.875649, 2.597466, 1, 1, 1, 1, 1,
1.440397, 0.1190481, 3.629623, 1, 1, 1, 1, 1,
1.460906, -1.271146, 2.167313, 1, 1, 1, 1, 1,
1.47222, -1.088875, 2.269903, 1, 1, 1, 1, 1,
1.506623, -0.5386678, -1.287659, 1, 1, 1, 1, 1,
1.533177, 0.01781688, 2.370532, 1, 1, 1, 1, 1,
1.55824, -0.6126606, 2.881879, 1, 1, 1, 1, 1,
1.559359, -0.05498018, 0.9057097, 0, 0, 1, 1, 1,
1.571694, -1.911835, 1.915765, 1, 0, 0, 1, 1,
1.593001, 0.1567488, 1.521364, 1, 0, 0, 1, 1,
1.595254, -1.758754, 3.621613, 1, 0, 0, 1, 1,
1.595493, 0.002349245, 2.507123, 1, 0, 0, 1, 1,
1.596179, 0.386, 2.936139, 1, 0, 0, 1, 1,
1.608399, 0.2673326, -0.6361629, 0, 0, 0, 1, 1,
1.609101, 1.204801, 1.594844, 0, 0, 0, 1, 1,
1.630028, 0.3093682, 2.180785, 0, 0, 0, 1, 1,
1.640283, 0.199512, 1.987772, 0, 0, 0, 1, 1,
1.6589, -0.7811618, 1.025223, 0, 0, 0, 1, 1,
1.660902, -1.671516, 3.541444, 0, 0, 0, 1, 1,
1.714713, 1.511891, 1.884975, 0, 0, 0, 1, 1,
1.731767, -0.9633152, 0.001967046, 1, 1, 1, 1, 1,
1.769711, 0.5549123, 1.250099, 1, 1, 1, 1, 1,
1.7764, 0.5488377, 0.8080332, 1, 1, 1, 1, 1,
1.803527, -0.03528021, 2.895764, 1, 1, 1, 1, 1,
1.813427, 0.07690423, 0.2975139, 1, 1, 1, 1, 1,
1.816432, 1.56989, 0.2934614, 1, 1, 1, 1, 1,
1.839239, -0.2107277, 2.201903, 1, 1, 1, 1, 1,
1.845733, 0.227587, 1.257946, 1, 1, 1, 1, 1,
1.873333, 2.130388, 0.03953688, 1, 1, 1, 1, 1,
1.903142, 0.7288935, 1.535215, 1, 1, 1, 1, 1,
1.932844, -1.384467, 0.9114621, 1, 1, 1, 1, 1,
1.941024, -0.5462708, 1.634533, 1, 1, 1, 1, 1,
1.946293, 1.94685, 2.385234, 1, 1, 1, 1, 1,
1.961366, -0.4362693, 3.064908, 1, 1, 1, 1, 1,
1.962605, 0.3295854, 2.22094, 1, 1, 1, 1, 1,
1.994303, 0.1969161, 2.051512, 0, 0, 1, 1, 1,
2.007175, -0.03743118, 1.457499, 1, 0, 0, 1, 1,
2.027221, -1.286457, 1.985028, 1, 0, 0, 1, 1,
2.092442, 0.2063429, 0.5092348, 1, 0, 0, 1, 1,
2.144791, -0.5946611, 2.34403, 1, 0, 0, 1, 1,
2.173039, 0.2320606, 1.218494, 1, 0, 0, 1, 1,
2.180871, -1.238709, 2.835853, 0, 0, 0, 1, 1,
2.18419, 0.3053436, 0.9255511, 0, 0, 0, 1, 1,
2.242303, 0.05593437, 1.817634, 0, 0, 0, 1, 1,
2.269305, 0.07602692, 1.701431, 0, 0, 0, 1, 1,
2.300649, 0.4452122, 1.492548, 0, 0, 0, 1, 1,
2.404609, 0.7333937, 1.485841, 0, 0, 0, 1, 1,
2.42691, 0.6820629, 0.822327, 0, 0, 0, 1, 1,
2.43634, 2.016202, 1.596376, 1, 1, 1, 1, 1,
2.568604, 1.05101, -0.2475048, 1, 1, 1, 1, 1,
2.57614, 0.6387214, 2.182461, 1, 1, 1, 1, 1,
2.61369, 1.212654, 1.944159, 1, 1, 1, 1, 1,
2.692366, 0.605375, 2.465466, 1, 1, 1, 1, 1,
2.700084, -0.6006298, 1.904956, 1, 1, 1, 1, 1,
2.874265, -0.242653, 2.296705, 1, 1, 1, 1, 1
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
var radius = 9.102591;
var distance = 31.97246;
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
mvMatrix.translate( 0.3560334, 0.1594027, -0.05261469 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.97246);
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
