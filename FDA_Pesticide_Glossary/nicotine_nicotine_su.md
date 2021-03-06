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
-3.393228, 0.1572963, -1.886416, 1, 0, 0, 1,
-3.202227, 0.6259382, -1.328631, 1, 0.007843138, 0, 1,
-2.691076, 0.277829, -1.874664, 1, 0.01176471, 0, 1,
-2.645702, 0.2733279, -2.984498, 1, 0.01960784, 0, 1,
-2.569043, -2.475942, -0.6725324, 1, 0.02352941, 0, 1,
-2.48217, 0.04821169, -0.735994, 1, 0.03137255, 0, 1,
-2.475087, 0.9318733, -1.186543, 1, 0.03529412, 0, 1,
-2.382652, -0.1233155, -2.994241, 1, 0.04313726, 0, 1,
-2.319345, -1.217725, -1.847981, 1, 0.04705882, 0, 1,
-2.301018, -0.1284552, -2.416335, 1, 0.05490196, 0, 1,
-2.30092, 1.688627, 0.5777388, 1, 0.05882353, 0, 1,
-2.227523, 0.1701273, 1.000024, 1, 0.06666667, 0, 1,
-2.195406, -0.6244023, -2.09739, 1, 0.07058824, 0, 1,
-2.166938, 2.567305, -0.8849607, 1, 0.07843138, 0, 1,
-2.165627, 1.24086, -0.7196048, 1, 0.08235294, 0, 1,
-2.156408, -0.3405942, -2.328296, 1, 0.09019608, 0, 1,
-2.151533, 0.6184297, 0.07463871, 1, 0.09411765, 0, 1,
-2.132674, 0.1093734, -0.07865984, 1, 0.1019608, 0, 1,
-2.126895, -0.9027187, -1.268571, 1, 0.1098039, 0, 1,
-2.125388, 0.4225284, -2.324023, 1, 0.1137255, 0, 1,
-2.0477, 0.02957235, -1.07484, 1, 0.1215686, 0, 1,
-2.009107, 1.615598, -0.05470428, 1, 0.1254902, 0, 1,
-1.956045, -2.019527, -3.104224, 1, 0.1333333, 0, 1,
-1.952114, -0.3392407, -1.278082, 1, 0.1372549, 0, 1,
-1.932924, -0.134434, -3.179717, 1, 0.145098, 0, 1,
-1.930586, 1.426569, -0.1391598, 1, 0.1490196, 0, 1,
-1.905934, -0.3357486, -1.851156, 1, 0.1568628, 0, 1,
-1.868505, -1.922014, -1.505001, 1, 0.1607843, 0, 1,
-1.865243, 1.252988, -1.121372, 1, 0.1686275, 0, 1,
-1.861471, -2.02511, -4.483687, 1, 0.172549, 0, 1,
-1.828575, 1.30566, -0.7024844, 1, 0.1803922, 0, 1,
-1.822099, 0.9246674, -2.323099, 1, 0.1843137, 0, 1,
-1.820345, -0.02712522, -0.895844, 1, 0.1921569, 0, 1,
-1.798213, 0.7696677, -0.6083447, 1, 0.1960784, 0, 1,
-1.797847, -1.184709, -3.289303, 1, 0.2039216, 0, 1,
-1.782075, 0.6830136, -0.3518563, 1, 0.2117647, 0, 1,
-1.780079, -0.1160994, -0.1107982, 1, 0.2156863, 0, 1,
-1.771109, -0.2034736, -1.607928, 1, 0.2235294, 0, 1,
-1.765318, 0.6874698, -0.5146378, 1, 0.227451, 0, 1,
-1.756112, -0.2190861, -1.542839, 1, 0.2352941, 0, 1,
-1.747441, 1.690613, -1.007764, 1, 0.2392157, 0, 1,
-1.731279, 0.926821, -0.7077378, 1, 0.2470588, 0, 1,
-1.72379, 2.463956, 0.9656519, 1, 0.2509804, 0, 1,
-1.706761, -0.4696692, -1.370301, 1, 0.2588235, 0, 1,
-1.706017, -0.3874211, -3.158683, 1, 0.2627451, 0, 1,
-1.677685, 0.315017, -0.7957848, 1, 0.2705882, 0, 1,
-1.659624, 1.695579, -0.118859, 1, 0.2745098, 0, 1,
-1.642643, 1.002883, -1.987054, 1, 0.282353, 0, 1,
-1.637381, 0.6758454, -1.774244, 1, 0.2862745, 0, 1,
-1.629194, 0.4713193, -2.589512, 1, 0.2941177, 0, 1,
-1.614886, -1.067425, -2.729307, 1, 0.3019608, 0, 1,
-1.613829, 2.195316, -1.891484, 1, 0.3058824, 0, 1,
-1.602112, -0.07734291, -1.636263, 1, 0.3137255, 0, 1,
-1.601705, -1.266994, -0.9607803, 1, 0.3176471, 0, 1,
-1.598364, -1.288764, -0.6709879, 1, 0.3254902, 0, 1,
-1.575097, 0.755585, -1.43124, 1, 0.3294118, 0, 1,
-1.518869, 0.8834327, -0.2332472, 1, 0.3372549, 0, 1,
-1.515116, 2.61529, 0.1088088, 1, 0.3411765, 0, 1,
-1.514244, -0.7294087, -0.8645824, 1, 0.3490196, 0, 1,
-1.500389, 1.064475, -2.123151, 1, 0.3529412, 0, 1,
-1.497406, 0.5498759, 0.09742647, 1, 0.3607843, 0, 1,
-1.48236, 0.6170346, -0.7172255, 1, 0.3647059, 0, 1,
-1.477479, -0.9393533, -1.606212, 1, 0.372549, 0, 1,
-1.472093, -0.7299113, -2.267926, 1, 0.3764706, 0, 1,
-1.46528, -0.08453471, -1.86311, 1, 0.3843137, 0, 1,
-1.462144, -0.1328649, -2.545718, 1, 0.3882353, 0, 1,
-1.458395, -1.360608, -3.528294, 1, 0.3960784, 0, 1,
-1.452368, 0.4421413, -1.48218, 1, 0.4039216, 0, 1,
-1.449836, -0.517969, -1.474894, 1, 0.4078431, 0, 1,
-1.447987, -1.053993, -0.2501881, 1, 0.4156863, 0, 1,
-1.439208, 0.9354034, -1.568546, 1, 0.4196078, 0, 1,
-1.434696, -0.5484169, -0.9048492, 1, 0.427451, 0, 1,
-1.431703, -0.5082509, -2.151079, 1, 0.4313726, 0, 1,
-1.426301, -0.7685686, -0.7895237, 1, 0.4392157, 0, 1,
-1.420714, -1.358726, -2.619763, 1, 0.4431373, 0, 1,
-1.41568, 0.06223584, -2.110282, 1, 0.4509804, 0, 1,
-1.391566, 0.3140927, -2.062515, 1, 0.454902, 0, 1,
-1.390822, -1.227456, -1.799637, 1, 0.4627451, 0, 1,
-1.372894, 0.2128351, -1.924325, 1, 0.4666667, 0, 1,
-1.365518, -1.709769, -0.6874198, 1, 0.4745098, 0, 1,
-1.362532, 0.779992, -0.460859, 1, 0.4784314, 0, 1,
-1.362003, -0.7543687, -1.111337, 1, 0.4862745, 0, 1,
-1.335641, -0.7228, -2.353294, 1, 0.4901961, 0, 1,
-1.324873, 0.3348676, -2.139994, 1, 0.4980392, 0, 1,
-1.324423, 0.9522398, -2.191101, 1, 0.5058824, 0, 1,
-1.323876, 0.0717664, -0.2367071, 1, 0.509804, 0, 1,
-1.320394, 1.084099, -1.133155, 1, 0.5176471, 0, 1,
-1.319073, -0.2366046, -1.91946, 1, 0.5215687, 0, 1,
-1.318653, 0.66379, 0.3909678, 1, 0.5294118, 0, 1,
-1.308478, -0.03318122, -0.5584398, 1, 0.5333334, 0, 1,
-1.299384, 1.265747, -0.4967098, 1, 0.5411765, 0, 1,
-1.293321, -0.7062861, -2.43079, 1, 0.5450981, 0, 1,
-1.290904, 0.03500277, -1.275788, 1, 0.5529412, 0, 1,
-1.285534, 1.248652, -0.9542881, 1, 0.5568628, 0, 1,
-1.282913, -0.006678896, -1.815427, 1, 0.5647059, 0, 1,
-1.258776, 0.1493748, -1.974961, 1, 0.5686275, 0, 1,
-1.257269, -1.649374, -2.542397, 1, 0.5764706, 0, 1,
-1.253659, -0.4021859, -1.807548, 1, 0.5803922, 0, 1,
-1.247375, 0.07741206, -1.353684, 1, 0.5882353, 0, 1,
-1.245691, -1.586777, -3.249421, 1, 0.5921569, 0, 1,
-1.244166, 0.5962678, -0.632799, 1, 0.6, 0, 1,
-1.233823, -2.331506, -2.230325, 1, 0.6078432, 0, 1,
-1.23183, 0.03549541, -2.849682, 1, 0.6117647, 0, 1,
-1.228786, 0.1929161, -2.414101, 1, 0.6196079, 0, 1,
-1.22772, -0.1324415, -3.557106, 1, 0.6235294, 0, 1,
-1.215486, 0.2142719, -1.535852, 1, 0.6313726, 0, 1,
-1.192301, -0.7479831, -2.453962, 1, 0.6352941, 0, 1,
-1.185784, 0.2263668, -1.50668, 1, 0.6431373, 0, 1,
-1.178986, -1.140426, -0.6077209, 1, 0.6470588, 0, 1,
-1.168412, -0.6051409, -0.5409904, 1, 0.654902, 0, 1,
-1.164659, -1.319518, -0.8733277, 1, 0.6588235, 0, 1,
-1.162555, 0.70504, -0.5878716, 1, 0.6666667, 0, 1,
-1.154424, -0.4429627, -1.738523, 1, 0.6705883, 0, 1,
-1.153667, -0.3518304, -1.041812, 1, 0.6784314, 0, 1,
-1.151281, -0.04102803, -1.307741, 1, 0.682353, 0, 1,
-1.149595, 0.2044684, -1.560299, 1, 0.6901961, 0, 1,
-1.147559, 0.08012587, 0.4057387, 1, 0.6941177, 0, 1,
-1.141527, 0.5927136, -0.05251702, 1, 0.7019608, 0, 1,
-1.138901, -0.4365615, -0.8517491, 1, 0.7098039, 0, 1,
-1.138065, 0.8495247, -1.279086, 1, 0.7137255, 0, 1,
-1.136531, 0.3022012, -1.713861, 1, 0.7215686, 0, 1,
-1.133397, -0.6647124, -1.153033, 1, 0.7254902, 0, 1,
-1.131163, 0.4968328, 0.8566314, 1, 0.7333333, 0, 1,
-1.130203, 0.368006, -0.1470505, 1, 0.7372549, 0, 1,
-1.129424, 0.1308712, -2.389631, 1, 0.7450981, 0, 1,
-1.125065, 2.524192, 0.3308734, 1, 0.7490196, 0, 1,
-1.123562, 0.7864057, -1.057916, 1, 0.7568628, 0, 1,
-1.11376, -0.05103432, -2.092619, 1, 0.7607843, 0, 1,
-1.11151, -2.173049, -3.091206, 1, 0.7686275, 0, 1,
-1.106306, 0.5098438, 0.5542006, 1, 0.772549, 0, 1,
-1.100164, -0.9797116, -2.260626, 1, 0.7803922, 0, 1,
-1.095874, 0.8654572, -1.123687, 1, 0.7843137, 0, 1,
-1.094547, -0.9370639, -2.006902, 1, 0.7921569, 0, 1,
-1.092447, -1.614105, -3.66369, 1, 0.7960784, 0, 1,
-1.089426, 0.7378781, -0.4064232, 1, 0.8039216, 0, 1,
-1.087747, 1.195814, -1.288218, 1, 0.8117647, 0, 1,
-1.087258, 1.971476, -1.879516, 1, 0.8156863, 0, 1,
-1.080782, 1.029649, -1.366855, 1, 0.8235294, 0, 1,
-1.064882, 0.2060386, -1.834141, 1, 0.827451, 0, 1,
-1.064479, -0.6677999, -3.306855, 1, 0.8352941, 0, 1,
-1.058762, 0.2920552, 0.3671777, 1, 0.8392157, 0, 1,
-1.05823, -0.3166195, -2.116293, 1, 0.8470588, 0, 1,
-1.058151, -1.496116, -3.443753, 1, 0.8509804, 0, 1,
-1.055621, 0.6982553, -0.9781927, 1, 0.8588235, 0, 1,
-1.052178, -0.6740941, -1.971323, 1, 0.8627451, 0, 1,
-1.050811, -0.8979558, -3.552206, 1, 0.8705882, 0, 1,
-1.04706, 0.3626522, -2.215255, 1, 0.8745098, 0, 1,
-1.046561, 0.03258616, -0.01797726, 1, 0.8823529, 0, 1,
-1.046132, -0.1422372, -1.616452, 1, 0.8862745, 0, 1,
-1.045891, -0.3199874, -1.499241, 1, 0.8941177, 0, 1,
-1.039879, -0.6492254, -1.98149, 1, 0.8980392, 0, 1,
-1.039233, 1.501611, -2.268002, 1, 0.9058824, 0, 1,
-1.038675, 0.8586304, -2.352245, 1, 0.9137255, 0, 1,
-1.0152, 1.366137, 0.1439757, 1, 0.9176471, 0, 1,
-1.014417, 1.024914, -0.1508984, 1, 0.9254902, 0, 1,
-1.012282, 0.6972266, -2.333803, 1, 0.9294118, 0, 1,
-1.007654, 0.3415201, -1.337081, 1, 0.9372549, 0, 1,
-1.002823, -0.974965, -3.347367, 1, 0.9411765, 0, 1,
-1.001347, 0.3318287, -2.878508, 1, 0.9490196, 0, 1,
-1.00038, -0.1977463, -1.860769, 1, 0.9529412, 0, 1,
-0.9926304, -0.7788454, -3.786613, 1, 0.9607843, 0, 1,
-0.9912567, 0.7566817, -0.7020671, 1, 0.9647059, 0, 1,
-0.9895924, 1.950009, 0.1395869, 1, 0.972549, 0, 1,
-0.9751974, 1.909769, -2.534717, 1, 0.9764706, 0, 1,
-0.974025, -0.432191, -1.103227, 1, 0.9843137, 0, 1,
-0.9724141, 1.25329, 0.2608346, 1, 0.9882353, 0, 1,
-0.9585763, 0.5368342, -3.017816, 1, 0.9960784, 0, 1,
-0.9538602, -0.1294301, -2.270376, 0.9960784, 1, 0, 1,
-0.9495952, -0.3246633, -1.329494, 0.9921569, 1, 0, 1,
-0.9474922, -1.312696, -2.560974, 0.9843137, 1, 0, 1,
-0.9474687, -1.773344, -2.590878, 0.9803922, 1, 0, 1,
-0.9358419, -0.3937635, -2.091568, 0.972549, 1, 0, 1,
-0.9339264, -1.788093, -2.681122, 0.9686275, 1, 0, 1,
-0.9328363, -0.7791434, -1.353302, 0.9607843, 1, 0, 1,
-0.9140084, 0.4754389, 0.2454213, 0.9568627, 1, 0, 1,
-0.9131598, 2.272458, 1.840071, 0.9490196, 1, 0, 1,
-0.9094121, 1.370348, -1.229165, 0.945098, 1, 0, 1,
-0.9073662, 0.8186629, 0.2782684, 0.9372549, 1, 0, 1,
-0.9024699, 1.93183, 0.7451678, 0.9333333, 1, 0, 1,
-0.8950801, -1.799978, -1.79849, 0.9254902, 1, 0, 1,
-0.8925225, -1.981582, -2.161838, 0.9215686, 1, 0, 1,
-0.8901383, 1.607261, -0.006316504, 0.9137255, 1, 0, 1,
-0.8894017, 0.1229674, -0.3293817, 0.9098039, 1, 0, 1,
-0.8886877, 0.4403687, -0.6914362, 0.9019608, 1, 0, 1,
-0.8832102, 0.304888, -1.391694, 0.8941177, 1, 0, 1,
-0.8823795, -1.423521, -1.67089, 0.8901961, 1, 0, 1,
-0.8800609, -0.9425711, -2.668413, 0.8823529, 1, 0, 1,
-0.8717706, -0.6236911, -1.923959, 0.8784314, 1, 0, 1,
-0.865577, -0.3784357, -3.061257, 0.8705882, 1, 0, 1,
-0.8630413, -0.8969959, -3.215561, 0.8666667, 1, 0, 1,
-0.8625256, -0.1009821, -1.877167, 0.8588235, 1, 0, 1,
-0.8592569, 0.6503882, -2.193269, 0.854902, 1, 0, 1,
-0.8520543, -1.438686, -3.390795, 0.8470588, 1, 0, 1,
-0.8520243, -0.8358374, -1.611361, 0.8431373, 1, 0, 1,
-0.8484089, 0.7559768, -0.5040318, 0.8352941, 1, 0, 1,
-0.8420671, -0.777145, -1.306382, 0.8313726, 1, 0, 1,
-0.840484, 1.626623, -2.119446, 0.8235294, 1, 0, 1,
-0.8339423, 0.137732, -1.290177, 0.8196079, 1, 0, 1,
-0.8338407, 0.4421983, -0.8039795, 0.8117647, 1, 0, 1,
-0.8329157, 0.4733113, -0.734925, 0.8078431, 1, 0, 1,
-0.8312247, -0.7590929, -4.349934, 0.8, 1, 0, 1,
-0.8295946, -0.9101657, -2.171765, 0.7921569, 1, 0, 1,
-0.8264565, -0.5324242, -3.709925, 0.7882353, 1, 0, 1,
-0.8231074, 1.17179, 1.00498, 0.7803922, 1, 0, 1,
-0.8218635, -0.232711, -1.941949, 0.7764706, 1, 0, 1,
-0.8204553, -0.8030955, -1.792843, 0.7686275, 1, 0, 1,
-0.8197529, 1.563898, -1.262949, 0.7647059, 1, 0, 1,
-0.8067269, 0.7565351, 0.1691798, 0.7568628, 1, 0, 1,
-0.8032721, -0.519785, -2.178458, 0.7529412, 1, 0, 1,
-0.79992, 0.3935516, -1.245578, 0.7450981, 1, 0, 1,
-0.7995902, -0.4809133, -0.5913001, 0.7411765, 1, 0, 1,
-0.7969099, 1.004422, -1.469425, 0.7333333, 1, 0, 1,
-0.7935864, 1.127797, -0.947804, 0.7294118, 1, 0, 1,
-0.7928833, 0.1004166, -1.965782, 0.7215686, 1, 0, 1,
-0.7911294, -0.657787, -2.479162, 0.7176471, 1, 0, 1,
-0.7900138, -1.106898, -3.65405, 0.7098039, 1, 0, 1,
-0.7890462, 2.115148, -0.2724892, 0.7058824, 1, 0, 1,
-0.7879709, 0.4573372, -2.653701, 0.6980392, 1, 0, 1,
-0.7836481, 0.006572703, -0.6866844, 0.6901961, 1, 0, 1,
-0.7793041, -1.137421, -2.600026, 0.6862745, 1, 0, 1,
-0.7770652, 0.8676189, -0.2466919, 0.6784314, 1, 0, 1,
-0.774529, -1.760488, -2.471263, 0.6745098, 1, 0, 1,
-0.7733226, -0.7237269, -2.460791, 0.6666667, 1, 0, 1,
-0.7690693, 0.4525252, -1.356195, 0.6627451, 1, 0, 1,
-0.7666647, 1.108951, -0.4188867, 0.654902, 1, 0, 1,
-0.7640893, -0.532637, -2.966656, 0.6509804, 1, 0, 1,
-0.7611514, 0.7288612, 0.2618492, 0.6431373, 1, 0, 1,
-0.7525855, 0.03593133, -1.293205, 0.6392157, 1, 0, 1,
-0.7516452, -0.3509835, -2.578457, 0.6313726, 1, 0, 1,
-0.7502834, 0.07790571, -0.2956899, 0.627451, 1, 0, 1,
-0.7450206, -0.7312182, -1.998826, 0.6196079, 1, 0, 1,
-0.7442431, 0.9536378, -1.752504, 0.6156863, 1, 0, 1,
-0.7401296, -1.322183, -1.708741, 0.6078432, 1, 0, 1,
-0.738929, -1.440624, -3.126981, 0.6039216, 1, 0, 1,
-0.7377944, 0.584541, -0.5964649, 0.5960785, 1, 0, 1,
-0.737591, 0.7417235, 0.4151374, 0.5882353, 1, 0, 1,
-0.7373928, 0.9238208, -2.030104, 0.5843138, 1, 0, 1,
-0.736864, -0.05537239, -0.8900025, 0.5764706, 1, 0, 1,
-0.7350854, -0.2249608, -1.865687, 0.572549, 1, 0, 1,
-0.7342095, -0.2940874, -1.434059, 0.5647059, 1, 0, 1,
-0.7312099, 0.4019026, -1.579018, 0.5607843, 1, 0, 1,
-0.7283283, -1.001316, -1.696869, 0.5529412, 1, 0, 1,
-0.7265167, -0.9078045, -3.428786, 0.5490196, 1, 0, 1,
-0.7220254, 2.196067, 0.2357929, 0.5411765, 1, 0, 1,
-0.7163851, -1.078048, -1.634657, 0.5372549, 1, 0, 1,
-0.7158497, -0.3971266, -1.52195, 0.5294118, 1, 0, 1,
-0.7157856, 0.3562602, -1.180331, 0.5254902, 1, 0, 1,
-0.7063442, 1.682583, -0.859512, 0.5176471, 1, 0, 1,
-0.7056777, -1.06222, -1.195002, 0.5137255, 1, 0, 1,
-0.7056139, 0.8770187, -0.200078, 0.5058824, 1, 0, 1,
-0.7019493, 0.6567721, -0.5390334, 0.5019608, 1, 0, 1,
-0.6987733, 1.390439, -0.9204399, 0.4941176, 1, 0, 1,
-0.6953402, -1.478846, -3.61435, 0.4862745, 1, 0, 1,
-0.6930214, 0.8441613, -0.0375918, 0.4823529, 1, 0, 1,
-0.6886955, -2.37785, -3.450734, 0.4745098, 1, 0, 1,
-0.684448, -0.05168834, -3.933482, 0.4705882, 1, 0, 1,
-0.6809276, 0.4162029, -0.6823028, 0.4627451, 1, 0, 1,
-0.6657387, 0.2242341, -0.8651018, 0.4588235, 1, 0, 1,
-0.6652539, 0.8718297, -1.386405, 0.4509804, 1, 0, 1,
-0.6605231, 1.070106, 0.6262583, 0.4470588, 1, 0, 1,
-0.6597185, -0.5142306, -2.698417, 0.4392157, 1, 0, 1,
-0.6570542, -0.9963031, -2.40957, 0.4352941, 1, 0, 1,
-0.6562116, 0.225765, -2.206691, 0.427451, 1, 0, 1,
-0.6527287, 0.4833225, -2.346427, 0.4235294, 1, 0, 1,
-0.6502082, -1.139019, -0.4920983, 0.4156863, 1, 0, 1,
-0.6480958, -0.207861, -2.220823, 0.4117647, 1, 0, 1,
-0.6406977, -0.9442467, -2.469809, 0.4039216, 1, 0, 1,
-0.6345965, -0.589815, -3.542333, 0.3960784, 1, 0, 1,
-0.6315191, -0.2025881, -0.8606921, 0.3921569, 1, 0, 1,
-0.6295097, -0.4027956, -1.489035, 0.3843137, 1, 0, 1,
-0.6259139, -0.1962682, -1.492309, 0.3803922, 1, 0, 1,
-0.6252958, -1.074805, -2.424296, 0.372549, 1, 0, 1,
-0.6244442, -0.2643394, -2.220708, 0.3686275, 1, 0, 1,
-0.6236458, 0.3195734, -2.38257, 0.3607843, 1, 0, 1,
-0.613731, 0.9582731, -0.09296335, 0.3568628, 1, 0, 1,
-0.6114331, 1.134887, -0.6750826, 0.3490196, 1, 0, 1,
-0.6105123, 1.434425, -2.03948, 0.345098, 1, 0, 1,
-0.6099276, 0.4524292, 0.2091488, 0.3372549, 1, 0, 1,
-0.6075126, 2.252841, -0.696481, 0.3333333, 1, 0, 1,
-0.6060082, -0.8803302, -2.965465, 0.3254902, 1, 0, 1,
-0.6053062, -0.163317, -1.410774, 0.3215686, 1, 0, 1,
-0.6024352, -1.430083, -5.702077, 0.3137255, 1, 0, 1,
-0.5996217, -0.7654671, -2.708945, 0.3098039, 1, 0, 1,
-0.5985851, 0.1415167, -0.02164135, 0.3019608, 1, 0, 1,
-0.5981435, 0.4375875, -0.1452625, 0.2941177, 1, 0, 1,
-0.595067, 0.7121646, -1.93019, 0.2901961, 1, 0, 1,
-0.5947198, -0.5158107, -1.171431, 0.282353, 1, 0, 1,
-0.5934488, 0.2100323, -2.088903, 0.2784314, 1, 0, 1,
-0.591064, 0.4144174, -0.7513993, 0.2705882, 1, 0, 1,
-0.5832104, -0.2961605, -0.9670356, 0.2666667, 1, 0, 1,
-0.5831608, -2.229923, -2.661997, 0.2588235, 1, 0, 1,
-0.5782267, -0.9742439, -2.611008, 0.254902, 1, 0, 1,
-0.5780315, -0.6784938, -2.224059, 0.2470588, 1, 0, 1,
-0.5723503, 0.3373759, -1.48691, 0.2431373, 1, 0, 1,
-0.5646869, 1.137925, 0.4297822, 0.2352941, 1, 0, 1,
-0.5627914, -0.1691041, -2.196339, 0.2313726, 1, 0, 1,
-0.5618768, -1.986507, -2.970104, 0.2235294, 1, 0, 1,
-0.5608509, -1.137016, -1.570535, 0.2196078, 1, 0, 1,
-0.5589018, 1.045836, -1.724046, 0.2117647, 1, 0, 1,
-0.556843, 0.4220163, -0.04731599, 0.2078431, 1, 0, 1,
-0.5553365, 0.3517475, -1.285074, 0.2, 1, 0, 1,
-0.5472269, 0.9546222, -2.106822, 0.1921569, 1, 0, 1,
-0.5443531, -0.9575502, -3.596444, 0.1882353, 1, 0, 1,
-0.5413439, -1.158953, -2.217803, 0.1803922, 1, 0, 1,
-0.5365725, 0.6669121, 0.8709205, 0.1764706, 1, 0, 1,
-0.5335943, 0.6798983, -0.5665243, 0.1686275, 1, 0, 1,
-0.5307812, -1.140485, -3.048584, 0.1647059, 1, 0, 1,
-0.5302084, -1.59952, -2.045324, 0.1568628, 1, 0, 1,
-0.529336, -0.7314724, -1.449995, 0.1529412, 1, 0, 1,
-0.5291906, -0.9181541, -2.544108, 0.145098, 1, 0, 1,
-0.5262624, -0.4754308, -2.052465, 0.1411765, 1, 0, 1,
-0.5255888, 2.687435, -0.3455581, 0.1333333, 1, 0, 1,
-0.519154, -0.4051848, -3.548361, 0.1294118, 1, 0, 1,
-0.5183743, 0.5978155, -0.06378569, 0.1215686, 1, 0, 1,
-0.5141194, 0.4839813, -1.544212, 0.1176471, 1, 0, 1,
-0.51367, 1.045578, 0.6875454, 0.1098039, 1, 0, 1,
-0.5091919, -1.919843, -2.289514, 0.1058824, 1, 0, 1,
-0.504829, -0.7015941, -3.93188, 0.09803922, 1, 0, 1,
-0.5030469, 0.1206958, -2.412397, 0.09019608, 1, 0, 1,
-0.5006687, -0.8918074, -3.395751, 0.08627451, 1, 0, 1,
-0.500325, 0.1869246, -1.276069, 0.07843138, 1, 0, 1,
-0.4943044, 0.9359362, -0.3938699, 0.07450981, 1, 0, 1,
-0.4941735, 0.621185, -0.6509582, 0.06666667, 1, 0, 1,
-0.4939738, -0.03391401, -1.284254, 0.0627451, 1, 0, 1,
-0.4921298, -0.4760824, -1.777691, 0.05490196, 1, 0, 1,
-0.4915018, -1.802295, -1.053734, 0.05098039, 1, 0, 1,
-0.4909877, 0.0834017, -0.2593345, 0.04313726, 1, 0, 1,
-0.4893608, -0.6932355, -2.936454, 0.03921569, 1, 0, 1,
-0.4889167, 0.2719985, -0.556349, 0.03137255, 1, 0, 1,
-0.486321, 0.03820175, -1.554166, 0.02745098, 1, 0, 1,
-0.4810745, -0.1931752, -2.77248, 0.01960784, 1, 0, 1,
-0.4767693, -0.3412596, -2.580109, 0.01568628, 1, 0, 1,
-0.4742972, 0.3611177, -1.037999, 0.007843138, 1, 0, 1,
-0.4732786, -0.8351945, -4.675884, 0.003921569, 1, 0, 1,
-0.4725012, 0.02762793, -2.129821, 0, 1, 0.003921569, 1,
-0.471662, -1.25219, -0.4241461, 0, 1, 0.01176471, 1,
-0.469453, 0.260457, -1.031121, 0, 1, 0.01568628, 1,
-0.469243, -1.901707, -3.823518, 0, 1, 0.02352941, 1,
-0.4684932, 0.5185949, -0.558032, 0, 1, 0.02745098, 1,
-0.4683243, 0.8251652, -0.4927603, 0, 1, 0.03529412, 1,
-0.4663348, -0.5237006, -2.684825, 0, 1, 0.03921569, 1,
-0.466181, 0.735242, -1.308608, 0, 1, 0.04705882, 1,
-0.4615667, 0.2910732, -1.546752, 0, 1, 0.05098039, 1,
-0.4599199, -0.6139396, -3.12941, 0, 1, 0.05882353, 1,
-0.4570723, -0.9115014, -4.013201, 0, 1, 0.0627451, 1,
-0.457063, 0.04906774, -0.6779286, 0, 1, 0.07058824, 1,
-0.4558167, 0.2495719, -1.820934, 0, 1, 0.07450981, 1,
-0.4553395, -0.002226326, -0.9286554, 0, 1, 0.08235294, 1,
-0.4538623, -1.031349, -1.953305, 0, 1, 0.08627451, 1,
-0.4524975, 0.4345428, -1.558392, 0, 1, 0.09411765, 1,
-0.4519763, 0.3446084, 0.1367705, 0, 1, 0.1019608, 1,
-0.4513461, -0.04628386, -1.818177, 0, 1, 0.1058824, 1,
-0.4481632, -1.39676, 0.2176656, 0, 1, 0.1137255, 1,
-0.4472813, 0.2446484, -0.9424286, 0, 1, 0.1176471, 1,
-0.4422571, -1.581717, -2.047005, 0, 1, 0.1254902, 1,
-0.4385448, 2.409894, -1.647421, 0, 1, 0.1294118, 1,
-0.437633, 0.9259309, -0.3477839, 0, 1, 0.1372549, 1,
-0.4371829, 0.2896855, -0.2363825, 0, 1, 0.1411765, 1,
-0.4369859, -0.3015767, -1.864514, 0, 1, 0.1490196, 1,
-0.4312564, 0.3059303, -0.6485886, 0, 1, 0.1529412, 1,
-0.4273261, -1.540602, -3.508359, 0, 1, 0.1607843, 1,
-0.4254914, -0.575168, -1.09419, 0, 1, 0.1647059, 1,
-0.4243195, -0.8894935, -1.542764, 0, 1, 0.172549, 1,
-0.4213254, -0.1529519, -2.582198, 0, 1, 0.1764706, 1,
-0.4184525, -2.290406, -2.656653, 0, 1, 0.1843137, 1,
-0.4135882, 0.3229795, -1.134908, 0, 1, 0.1882353, 1,
-0.4103531, -1.04174, -4.275933, 0, 1, 0.1960784, 1,
-0.4028035, -0.446507, -1.576264, 0, 1, 0.2039216, 1,
-0.4026869, -0.1345873, -1.835079, 0, 1, 0.2078431, 1,
-0.3969227, -1.31319, -3.474337, 0, 1, 0.2156863, 1,
-0.3968939, 0.5199962, -0.3994924, 0, 1, 0.2196078, 1,
-0.3900042, 0.1938684, 0.2720812, 0, 1, 0.227451, 1,
-0.3890119, 1.115792, 0.2352832, 0, 1, 0.2313726, 1,
-0.3879115, 1.186432, -2.197081, 0, 1, 0.2392157, 1,
-0.3867664, -0.194769, -0.4254607, 0, 1, 0.2431373, 1,
-0.3849265, -0.1022281, -1.978856, 0, 1, 0.2509804, 1,
-0.3837194, 0.2219001, -1.860939, 0, 1, 0.254902, 1,
-0.382508, 0.9587867, 0.3957101, 0, 1, 0.2627451, 1,
-0.3809665, -1.015211, -1.848171, 0, 1, 0.2666667, 1,
-0.3808725, 1.330543, 1.311894, 0, 1, 0.2745098, 1,
-0.3789054, 0.03022863, -0.3250654, 0, 1, 0.2784314, 1,
-0.3778742, -1.184783, -2.1432, 0, 1, 0.2862745, 1,
-0.3773956, -0.6655231, -4.138286, 0, 1, 0.2901961, 1,
-0.3760203, -2.209433, -4.05986, 0, 1, 0.2980392, 1,
-0.3727539, 1.46605, -0.9007821, 0, 1, 0.3058824, 1,
-0.3696868, -0.6529787, -3.336103, 0, 1, 0.3098039, 1,
-0.365709, 2.259906, -3.296228, 0, 1, 0.3176471, 1,
-0.353344, 0.8022353, 1.203404, 0, 1, 0.3215686, 1,
-0.3517916, -1.612283, -3.668226, 0, 1, 0.3294118, 1,
-0.3515984, -1.047734, -4.575191, 0, 1, 0.3333333, 1,
-0.3502904, -0.3727079, -3.961834, 0, 1, 0.3411765, 1,
-0.3453179, 1.044009, -1.548549, 0, 1, 0.345098, 1,
-0.3442767, -1.098373, -4.669919, 0, 1, 0.3529412, 1,
-0.3434506, -0.3467785, -2.569631, 0, 1, 0.3568628, 1,
-0.3327166, -0.371939, -3.084282, 0, 1, 0.3647059, 1,
-0.328588, 1.829313, 0.7526854, 0, 1, 0.3686275, 1,
-0.328299, 0.1690483, -2.427788, 0, 1, 0.3764706, 1,
-0.3257607, 0.9705372, -1.177063, 0, 1, 0.3803922, 1,
-0.3183714, -1.146658, -3.983442, 0, 1, 0.3882353, 1,
-0.3125533, 1.42324, -1.573128, 0, 1, 0.3921569, 1,
-0.3096191, 0.7178736, 0.08458246, 0, 1, 0.4, 1,
-0.3071172, -1.355154, -3.381317, 0, 1, 0.4078431, 1,
-0.3059449, 0.2147485, -0.8352158, 0, 1, 0.4117647, 1,
-0.3028004, 0.8896376, -2.273709, 0, 1, 0.4196078, 1,
-0.3026624, -0.8770794, -1.887648, 0, 1, 0.4235294, 1,
-0.3022981, -1.020753, -2.143638, 0, 1, 0.4313726, 1,
-0.2965359, -1.173359, -1.15022, 0, 1, 0.4352941, 1,
-0.2954405, 0.289839, -0.2205548, 0, 1, 0.4431373, 1,
-0.2934251, 1.361506, 0.3279264, 0, 1, 0.4470588, 1,
-0.292937, 0.9144579, -1.204054, 0, 1, 0.454902, 1,
-0.2882911, 0.929361, 0.4411554, 0, 1, 0.4588235, 1,
-0.2862057, -1.088224, -2.66979, 0, 1, 0.4666667, 1,
-0.2847746, 1.48442, -1.942297, 0, 1, 0.4705882, 1,
-0.2795499, 0.8810183, -0.317173, 0, 1, 0.4784314, 1,
-0.2791662, 0.3494138, -1.28801, 0, 1, 0.4823529, 1,
-0.2725531, -1.180612, -0.981927, 0, 1, 0.4901961, 1,
-0.2723791, -0.677482, -1.933217, 0, 1, 0.4941176, 1,
-0.270543, -2.178491, -2.509661, 0, 1, 0.5019608, 1,
-0.2670389, -1.573529, -2.836067, 0, 1, 0.509804, 1,
-0.2659542, -0.3954848, -2.843317, 0, 1, 0.5137255, 1,
-0.2611566, 1.15497, -0.3497521, 0, 1, 0.5215687, 1,
-0.2603451, -0.07233212, -0.7657169, 0, 1, 0.5254902, 1,
-0.2598743, 0.1646367, -0.999019, 0, 1, 0.5333334, 1,
-0.2582297, -1.054024, -2.530455, 0, 1, 0.5372549, 1,
-0.2495872, 2.31187, 0.3357912, 0, 1, 0.5450981, 1,
-0.2490839, -0.1676698, -2.021817, 0, 1, 0.5490196, 1,
-0.2471774, 1.409359, -1.348256, 0, 1, 0.5568628, 1,
-0.232892, 0.1614464, -1.25634, 0, 1, 0.5607843, 1,
-0.2301534, -0.7331911, -4.236693, 0, 1, 0.5686275, 1,
-0.2295066, 0.2637934, -1.699729, 0, 1, 0.572549, 1,
-0.2261231, 0.4276947, 0.2801406, 0, 1, 0.5803922, 1,
-0.2243313, 1.27268, -0.8756408, 0, 1, 0.5843138, 1,
-0.2120522, 0.8615801, 0.1128487, 0, 1, 0.5921569, 1,
-0.2096844, 0.3904824, -2.499153, 0, 1, 0.5960785, 1,
-0.2082839, 0.2194936, -1.114992, 0, 1, 0.6039216, 1,
-0.2079305, 2.421101, -1.492964, 0, 1, 0.6117647, 1,
-0.2050493, 2.007702, -0.09435818, 0, 1, 0.6156863, 1,
-0.2015226, 1.240069, -0.682424, 0, 1, 0.6235294, 1,
-0.1989811, -0.6245589, -4.05659, 0, 1, 0.627451, 1,
-0.1987158, -1.178729, -1.950818, 0, 1, 0.6352941, 1,
-0.1929047, -1.300272, -2.359922, 0, 1, 0.6392157, 1,
-0.1904138, 0.5008782, -0.2602652, 0, 1, 0.6470588, 1,
-0.1895341, 0.5916727, -0.08787291, 0, 1, 0.6509804, 1,
-0.1832629, 0.05305228, -2.430227, 0, 1, 0.6588235, 1,
-0.1792369, 1.664236, 1.675589, 0, 1, 0.6627451, 1,
-0.178956, 1.220428, -1.715117, 0, 1, 0.6705883, 1,
-0.1771056, -0.1570249, -2.369815, 0, 1, 0.6745098, 1,
-0.1768094, 0.1612126, -0.5163177, 0, 1, 0.682353, 1,
-0.1756469, 0.8600779, -0.5985125, 0, 1, 0.6862745, 1,
-0.1750147, -1.339138, -1.807389, 0, 1, 0.6941177, 1,
-0.1711828, 0.7141687, -0.2489789, 0, 1, 0.7019608, 1,
-0.1693242, -0.8962272, -2.649611, 0, 1, 0.7058824, 1,
-0.1689355, -1.600291, -2.653995, 0, 1, 0.7137255, 1,
-0.1662855, -0.5452732, -2.869834, 0, 1, 0.7176471, 1,
-0.1636266, -0.2091882, -2.148572, 0, 1, 0.7254902, 1,
-0.1619116, 1.223593, 1.326066, 0, 1, 0.7294118, 1,
-0.1611457, 0.3574176, -0.7664793, 0, 1, 0.7372549, 1,
-0.1565663, -0.3929743, -3.683134, 0, 1, 0.7411765, 1,
-0.1563949, -1.956179, -3.250975, 0, 1, 0.7490196, 1,
-0.1530712, 1.218251, -0.2352817, 0, 1, 0.7529412, 1,
-0.152217, -1.099078, -2.252519, 0, 1, 0.7607843, 1,
-0.1512352, -0.3231, -3.341759, 0, 1, 0.7647059, 1,
-0.1510293, -1.780378, -2.462568, 0, 1, 0.772549, 1,
-0.1484045, -1.581287, -3.289386, 0, 1, 0.7764706, 1,
-0.1373032, 2.525329, -0.466271, 0, 1, 0.7843137, 1,
-0.1339896, -1.120565, -4.829112, 0, 1, 0.7882353, 1,
-0.1334243, 0.4719086, 0.7748256, 0, 1, 0.7960784, 1,
-0.1305618, 1.160175, -0.6435768, 0, 1, 0.8039216, 1,
-0.1257892, 0.405107, -1.360047, 0, 1, 0.8078431, 1,
-0.1246899, -1.42994, -2.571688, 0, 1, 0.8156863, 1,
-0.1225351, -0.4678278, -1.22786, 0, 1, 0.8196079, 1,
-0.1216719, 0.6297945, -0.06754983, 0, 1, 0.827451, 1,
-0.120951, -1.153141, -3.56745, 0, 1, 0.8313726, 1,
-0.1208053, 0.1722432, 0.5169604, 0, 1, 0.8392157, 1,
-0.1166111, 0.02334891, -0.4793137, 0, 1, 0.8431373, 1,
-0.1160936, -0.8873432, -4.466418, 0, 1, 0.8509804, 1,
-0.1150471, -0.1168573, -2.718661, 0, 1, 0.854902, 1,
-0.1092396, 0.6697768, -1.566517, 0, 1, 0.8627451, 1,
-0.1029894, -0.8301991, -2.822509, 0, 1, 0.8666667, 1,
-0.1024003, -0.1537758, -1.431706, 0, 1, 0.8745098, 1,
-0.1015425, -1.406487, -2.376821, 0, 1, 0.8784314, 1,
-0.1012123, -0.3643781, -1.478974, 0, 1, 0.8862745, 1,
-0.1009095, -1.42094, -3.139494, 0, 1, 0.8901961, 1,
-0.09858416, 1.443069, -1.79542, 0, 1, 0.8980392, 1,
-0.09636767, 0.6315903, -0.6961491, 0, 1, 0.9058824, 1,
-0.09143596, -0.9239185, -3.384939, 0, 1, 0.9098039, 1,
-0.09119066, -2.472723, -3.459563, 0, 1, 0.9176471, 1,
-0.08866989, -1.246874, -3.085916, 0, 1, 0.9215686, 1,
-0.08768374, -0.6532673, -3.254821, 0, 1, 0.9294118, 1,
-0.08669529, 0.4583234, -0.9330012, 0, 1, 0.9333333, 1,
-0.0840197, 0.1553622, -0.6135387, 0, 1, 0.9411765, 1,
-0.08362768, 0.6515413, 0.2843679, 0, 1, 0.945098, 1,
-0.08311815, -0.2379311, -2.699118, 0, 1, 0.9529412, 1,
-0.07977018, 0.1083093, -0.928778, 0, 1, 0.9568627, 1,
-0.07715239, -0.1452131, -1.314989, 0, 1, 0.9647059, 1,
-0.07058962, -0.921692, -3.243949, 0, 1, 0.9686275, 1,
-0.06864751, -0.3625092, -3.380876, 0, 1, 0.9764706, 1,
-0.06589263, -0.5683659, -4.853697, 0, 1, 0.9803922, 1,
-0.06502294, 0.3559961, 0.8987146, 0, 1, 0.9882353, 1,
-0.05765148, 0.2027891, 2.47874, 0, 1, 0.9921569, 1,
-0.05760426, 0.5221894, -0.2058217, 0, 1, 1, 1,
-0.05649429, 0.1629731, 0.2893896, 0, 0.9921569, 1, 1,
-0.05624909, -1.385697, -3.603696, 0, 0.9882353, 1, 1,
-0.05542761, -0.4163263, -3.113664, 0, 0.9803922, 1, 1,
-0.04944453, 0.04131816, -0.009307428, 0, 0.9764706, 1, 1,
-0.04859657, -0.9816307, -3.799869, 0, 0.9686275, 1, 1,
-0.046086, -0.4458199, -3.7575, 0, 0.9647059, 1, 1,
-0.04592966, 0.3822512, 0.1613278, 0, 0.9568627, 1, 1,
-0.0281646, -0.3937171, -3.759983, 0, 0.9529412, 1, 1,
-0.02526232, 0.3885044, 0.63218, 0, 0.945098, 1, 1,
-0.02369736, -0.3143182, -3.653074, 0, 0.9411765, 1, 1,
-0.0153938, -0.4091699, -2.993398, 0, 0.9333333, 1, 1,
-0.01493275, -0.7417007, -1.742796, 0, 0.9294118, 1, 1,
-0.0139146, 1.336804, 1.049205, 0, 0.9215686, 1, 1,
-0.01083286, -0.2590328, -2.82046, 0, 0.9176471, 1, 1,
-0.01049345, -0.07866977, -2.875874, 0, 0.9098039, 1, 1,
-0.006646761, 0.08901694, -0.1187805, 0, 0.9058824, 1, 1,
-0.0006088131, -0.8043157, -3.845205, 0, 0.8980392, 1, 1,
-0.0004850812, -1.357574, -4.012189, 0, 0.8901961, 1, 1,
0.003950727, 1.779359, 1.148135, 0, 0.8862745, 1, 1,
0.004002641, 0.1518131, 1.564035, 0, 0.8784314, 1, 1,
0.007161465, 0.1687597, 0.5342267, 0, 0.8745098, 1, 1,
0.007647534, 0.3305385, -0.7903451, 0, 0.8666667, 1, 1,
0.008955959, 1.411183, 0.4204412, 0, 0.8627451, 1, 1,
0.009732165, -0.02691033, 3.399755, 0, 0.854902, 1, 1,
0.01207907, 0.4219315, -0.7615311, 0, 0.8509804, 1, 1,
0.01776515, -1.470423, 3.753322, 0, 0.8431373, 1, 1,
0.01798955, -0.8349416, 4.501024, 0, 0.8392157, 1, 1,
0.02389406, 0.9613609, -0.3467748, 0, 0.8313726, 1, 1,
0.02517525, -0.3344364, 1.413954, 0, 0.827451, 1, 1,
0.02603961, 1.602028, -0.5531744, 0, 0.8196079, 1, 1,
0.03068729, 0.07471383, -0.4659801, 0, 0.8156863, 1, 1,
0.03609275, 0.0860436, 0.753572, 0, 0.8078431, 1, 1,
0.037243, -0.3071122, 3.264785, 0, 0.8039216, 1, 1,
0.03852862, 0.05864418, 0.07699059, 0, 0.7960784, 1, 1,
0.03999569, 0.4615502, 1.512651, 0, 0.7882353, 1, 1,
0.0481359, 0.5992438, -0.1697061, 0, 0.7843137, 1, 1,
0.04990833, 0.7700806, 1.675638, 0, 0.7764706, 1, 1,
0.05339404, 0.2002312, 0.7011844, 0, 0.772549, 1, 1,
0.0548655, 0.1681427, -0.5440289, 0, 0.7647059, 1, 1,
0.05492684, -0.2117347, 3.279822, 0, 0.7607843, 1, 1,
0.05536656, -0.7285909, 1.910133, 0, 0.7529412, 1, 1,
0.05730608, 1.184564, 1.114761, 0, 0.7490196, 1, 1,
0.05864454, -1.387853, 3.04247, 0, 0.7411765, 1, 1,
0.06056616, 0.3119368, -1.104007, 0, 0.7372549, 1, 1,
0.06233086, -0.8074711, 3.262156, 0, 0.7294118, 1, 1,
0.06908603, -2.489478, 2.246824, 0, 0.7254902, 1, 1,
0.07007804, 1.341128, -0.415274, 0, 0.7176471, 1, 1,
0.07155994, -1.667585, 4.741132, 0, 0.7137255, 1, 1,
0.07187737, 0.4335674, 0.1853985, 0, 0.7058824, 1, 1,
0.07800268, 1.57016, -0.9239085, 0, 0.6980392, 1, 1,
0.07846911, 1.003585, 1.200696, 0, 0.6941177, 1, 1,
0.08020281, -1.227808, 1.482873, 0, 0.6862745, 1, 1,
0.08433659, -0.3345796, 3.858763, 0, 0.682353, 1, 1,
0.08436714, -0.869895, 3.57318, 0, 0.6745098, 1, 1,
0.08443938, 0.4374686, 1.19592, 0, 0.6705883, 1, 1,
0.08628976, 0.6695874, 1.047649, 0, 0.6627451, 1, 1,
0.08647526, 0.7227491, 0.3853245, 0, 0.6588235, 1, 1,
0.09204615, 1.108602, -1.322334, 0, 0.6509804, 1, 1,
0.09325949, -0.3457991, 3.607392, 0, 0.6470588, 1, 1,
0.09866221, -1.044835, 3.084164, 0, 0.6392157, 1, 1,
0.1021521, 0.2323013, 1.185793, 0, 0.6352941, 1, 1,
0.1040808, -0.7872173, 2.648628, 0, 0.627451, 1, 1,
0.109572, 0.9294062, 0.5625432, 0, 0.6235294, 1, 1,
0.1121926, -0.7705131, 2.067136, 0, 0.6156863, 1, 1,
0.1141245, 1.334862, -0.3517087, 0, 0.6117647, 1, 1,
0.1178203, 0.5352203, -0.07826505, 0, 0.6039216, 1, 1,
0.118395, 3.114192, -0.3372954, 0, 0.5960785, 1, 1,
0.1242065, 0.4889213, 1.551422, 0, 0.5921569, 1, 1,
0.1248111, -0.784588, 4.550949, 0, 0.5843138, 1, 1,
0.1261487, 1.138621, 0.7976189, 0, 0.5803922, 1, 1,
0.1267827, 0.6936168, -1.026146, 0, 0.572549, 1, 1,
0.1296395, 0.1111402, -0.12488, 0, 0.5686275, 1, 1,
0.1315095, -0.1808297, 1.669713, 0, 0.5607843, 1, 1,
0.1322087, 0.07143206, 0.8016752, 0, 0.5568628, 1, 1,
0.137098, -0.3837117, 1.18347, 0, 0.5490196, 1, 1,
0.1422583, -0.9964453, 2.892598, 0, 0.5450981, 1, 1,
0.1433173, 0.9594971, 0.5529624, 0, 0.5372549, 1, 1,
0.1439852, -0.554199, 3.534195, 0, 0.5333334, 1, 1,
0.1446166, -0.815114, 3.801894, 0, 0.5254902, 1, 1,
0.1452985, 0.4793802, -1.561701, 0, 0.5215687, 1, 1,
0.1456399, -0.3686634, 1.54291, 0, 0.5137255, 1, 1,
0.1509202, 1.27194, -0.3467323, 0, 0.509804, 1, 1,
0.1548194, -1.923328, 2.630086, 0, 0.5019608, 1, 1,
0.1562143, 0.7983457, 0.2344987, 0, 0.4941176, 1, 1,
0.1583433, 0.459907, 0.1633196, 0, 0.4901961, 1, 1,
0.162516, 0.1234395, 1.492494, 0, 0.4823529, 1, 1,
0.1690353, 0.2509417, 2.62042, 0, 0.4784314, 1, 1,
0.1785663, -0.801378, 1.516704, 0, 0.4705882, 1, 1,
0.19165, 1.257127, 0.3955368, 0, 0.4666667, 1, 1,
0.1933024, 2.092581, -0.3761171, 0, 0.4588235, 1, 1,
0.1963465, 0.5138513, 2.48594, 0, 0.454902, 1, 1,
0.199917, -0.2593323, 1.568348, 0, 0.4470588, 1, 1,
0.2023382, 0.5880473, -0.4987089, 0, 0.4431373, 1, 1,
0.202639, -1.041029, 4.197529, 0, 0.4352941, 1, 1,
0.203877, 0.9717453, -1.684037, 0, 0.4313726, 1, 1,
0.2054272, -0.7157491, 2.956119, 0, 0.4235294, 1, 1,
0.2071917, -0.191049, 2.255043, 0, 0.4196078, 1, 1,
0.215188, -0.8403933, 1.889191, 0, 0.4117647, 1, 1,
0.2152119, 0.4750037, 1.033273, 0, 0.4078431, 1, 1,
0.2158246, -0.511813, 2.792448, 0, 0.4, 1, 1,
0.2188212, -0.9651684, 2.499952, 0, 0.3921569, 1, 1,
0.220151, 2.142856, -0.1376574, 0, 0.3882353, 1, 1,
0.2259899, -0.1706642, 3.146257, 0, 0.3803922, 1, 1,
0.227522, -1.280057, 2.439008, 0, 0.3764706, 1, 1,
0.2302519, 0.2909524, 2.140457, 0, 0.3686275, 1, 1,
0.2327575, 0.7082766, 0.7276757, 0, 0.3647059, 1, 1,
0.2468146, 0.5474441, -1.122354, 0, 0.3568628, 1, 1,
0.2533437, 0.4246622, 0.1076485, 0, 0.3529412, 1, 1,
0.2570511, 1.460374, 0.7182856, 0, 0.345098, 1, 1,
0.257584, 0.01053808, -0.3440622, 0, 0.3411765, 1, 1,
0.2623477, -1.206453, 3.559423, 0, 0.3333333, 1, 1,
0.2629934, 0.8088578, -1.494739, 0, 0.3294118, 1, 1,
0.2651242, -0.03651103, 1.975836, 0, 0.3215686, 1, 1,
0.2741267, 0.3639867, 0.4766674, 0, 0.3176471, 1, 1,
0.2795548, 0.2039674, 1.968821, 0, 0.3098039, 1, 1,
0.2806466, -0.7697431, 0.8512883, 0, 0.3058824, 1, 1,
0.2825365, -0.06846318, 3.531729, 0, 0.2980392, 1, 1,
0.2897508, 1.425699, -0.8045128, 0, 0.2901961, 1, 1,
0.2914892, -0.1978995, 2.277273, 0, 0.2862745, 1, 1,
0.2936901, 0.9339851, 0.0218045, 0, 0.2784314, 1, 1,
0.2968348, 1.064116, 0.4167717, 0, 0.2745098, 1, 1,
0.297617, -0.7173651, 2.1495, 0, 0.2666667, 1, 1,
0.3035355, 0.1900998, 0.1862029, 0, 0.2627451, 1, 1,
0.303568, -1.72217, 3.025862, 0, 0.254902, 1, 1,
0.3039125, -0.7935083, 0.9881851, 0, 0.2509804, 1, 1,
0.3058871, 1.403768, -0.8883199, 0, 0.2431373, 1, 1,
0.3068993, 0.4400202, -0.2029685, 0, 0.2392157, 1, 1,
0.3117552, 1.31849, 0.2960361, 0, 0.2313726, 1, 1,
0.3136676, -1.611293, 2.716537, 0, 0.227451, 1, 1,
0.3164741, -0.0672673, 2.186745, 0, 0.2196078, 1, 1,
0.3171273, -0.09977905, 0.8661026, 0, 0.2156863, 1, 1,
0.3180439, 2.745769, -0.4967998, 0, 0.2078431, 1, 1,
0.3182812, 0.3501083, -0.8722609, 0, 0.2039216, 1, 1,
0.3203338, -0.8314543, 3.237817, 0, 0.1960784, 1, 1,
0.3204302, -0.7930907, 3.494972, 0, 0.1882353, 1, 1,
0.330188, 0.161378, 0.8935767, 0, 0.1843137, 1, 1,
0.3331838, -0.2532507, 2.901531, 0, 0.1764706, 1, 1,
0.334913, -0.09418371, 2.966801, 0, 0.172549, 1, 1,
0.3356214, 0.6367711, 1.412472, 0, 0.1647059, 1, 1,
0.3367128, -1.547205, 2.497957, 0, 0.1607843, 1, 1,
0.3479882, 0.5709287, 1.254865, 0, 0.1529412, 1, 1,
0.3547643, -0.02484865, 1.441111, 0, 0.1490196, 1, 1,
0.3577242, 1.940992, 0.3447681, 0, 0.1411765, 1, 1,
0.3585871, -0.2615739, 3.379059, 0, 0.1372549, 1, 1,
0.3589716, -1.86251, 3.517005, 0, 0.1294118, 1, 1,
0.3593038, -0.6457658, 1.984778, 0, 0.1254902, 1, 1,
0.3601987, -0.2847952, 2.98747, 0, 0.1176471, 1, 1,
0.3611248, 0.02287328, 0.9691194, 0, 0.1137255, 1, 1,
0.3648842, -0.8106088, 3.044033, 0, 0.1058824, 1, 1,
0.3710724, -0.1803853, 1.548735, 0, 0.09803922, 1, 1,
0.3717171, -0.7260501, 2.690109, 0, 0.09411765, 1, 1,
0.3722498, 0.156713, 1.177111, 0, 0.08627451, 1, 1,
0.3726012, 1.090196, 1.043413, 0, 0.08235294, 1, 1,
0.3743642, -1.243828, 2.154116, 0, 0.07450981, 1, 1,
0.3744344, 0.4143695, 0.7726431, 0, 0.07058824, 1, 1,
0.3746643, 1.288303, 0.3446553, 0, 0.0627451, 1, 1,
0.3827122, -1.293775, 2.244615, 0, 0.05882353, 1, 1,
0.3829957, -1.007003, 3.466798, 0, 0.05098039, 1, 1,
0.383607, -1.100225, 2.599593, 0, 0.04705882, 1, 1,
0.3836364, -0.6623164, 2.804391, 0, 0.03921569, 1, 1,
0.3841871, 0.6366696, 2.028636, 0, 0.03529412, 1, 1,
0.391782, 0.4904751, -0.1876611, 0, 0.02745098, 1, 1,
0.3949489, -1.830135, 3.265355, 0, 0.02352941, 1, 1,
0.3950808, -1.280457, 3.392215, 0, 0.01568628, 1, 1,
0.3977409, 0.1905169, -0.07860255, 0, 0.01176471, 1, 1,
0.3983568, -0.2253844, 3.172073, 0, 0.003921569, 1, 1,
0.4016629, -0.01833374, 1.735185, 0.003921569, 0, 1, 1,
0.4045459, -0.5583963, 3.155398, 0.007843138, 0, 1, 1,
0.405435, 0.1046616, 0.3370578, 0.01568628, 0, 1, 1,
0.4072773, 0.1186132, 1.757952, 0.01960784, 0, 1, 1,
0.4090868, -1.841921, 3.063159, 0.02745098, 0, 1, 1,
0.4176574, 0.6488408, 0.9892568, 0.03137255, 0, 1, 1,
0.4197309, -1.754469, 3.273783, 0.03921569, 0, 1, 1,
0.4242073, -0.8055428, 2.96039, 0.04313726, 0, 1, 1,
0.4318702, 0.4967431, 0.6729242, 0.05098039, 0, 1, 1,
0.433275, 0.330228, 0.1598274, 0.05490196, 0, 1, 1,
0.4337799, 1.062027, -0.7538009, 0.0627451, 0, 1, 1,
0.4342969, -1.214218, 2.909887, 0.06666667, 0, 1, 1,
0.4395355, 0.5010219, 1.797822, 0.07450981, 0, 1, 1,
0.4433345, -0.3587576, 0.9611043, 0.07843138, 0, 1, 1,
0.4450491, 0.1149665, 2.311626, 0.08627451, 0, 1, 1,
0.4455185, -0.4561205, 3.641171, 0.09019608, 0, 1, 1,
0.4573883, -0.08937636, 2.357372, 0.09803922, 0, 1, 1,
0.4596945, 0.1999377, 1.547603, 0.1058824, 0, 1, 1,
0.4605685, 0.8965281, 0.4703662, 0.1098039, 0, 1, 1,
0.4621741, 0.5045992, 2.410398, 0.1176471, 0, 1, 1,
0.4657182, -0.8971728, 1.032711, 0.1215686, 0, 1, 1,
0.4688699, 1.208953, 0.6328634, 0.1294118, 0, 1, 1,
0.4694829, -0.5058772, 2.417884, 0.1333333, 0, 1, 1,
0.4705569, 1.673822, 0.6528599, 0.1411765, 0, 1, 1,
0.4705904, -0.9873983, 2.910439, 0.145098, 0, 1, 1,
0.4734386, 1.369078, 0.02558343, 0.1529412, 0, 1, 1,
0.4752569, -0.3526483, 2.134668, 0.1568628, 0, 1, 1,
0.4771797, -1.64762, 3.499408, 0.1647059, 0, 1, 1,
0.4776581, -0.5234835, 3.341962, 0.1686275, 0, 1, 1,
0.4819026, -1.503958, 2.80256, 0.1764706, 0, 1, 1,
0.4822378, -1.284553, 3.182951, 0.1803922, 0, 1, 1,
0.4859264, -0.8807059, 1.694777, 0.1882353, 0, 1, 1,
0.4894522, -1.259758, 2.214364, 0.1921569, 0, 1, 1,
0.4912815, 1.246115, 1.2578, 0.2, 0, 1, 1,
0.4918858, -0.3536707, 2.115671, 0.2078431, 0, 1, 1,
0.4949907, 0.6901318, -0.8165845, 0.2117647, 0, 1, 1,
0.4959077, -1.334033, 2.509462, 0.2196078, 0, 1, 1,
0.5074953, -1.357011, 3.540022, 0.2235294, 0, 1, 1,
0.5084447, -0.04868848, 1.505014, 0.2313726, 0, 1, 1,
0.5090171, 0.02734813, 0.08672417, 0.2352941, 0, 1, 1,
0.5144991, -1.024186, 2.934072, 0.2431373, 0, 1, 1,
0.5244266, 1.562778, 1.268993, 0.2470588, 0, 1, 1,
0.524844, 1.66754, 1.228213, 0.254902, 0, 1, 1,
0.5252457, -0.6242089, 1.176362, 0.2588235, 0, 1, 1,
0.5259338, 0.09736443, 1.52957, 0.2666667, 0, 1, 1,
0.5274072, -0.373578, 3.083616, 0.2705882, 0, 1, 1,
0.5346096, 0.5650203, 1.655292, 0.2784314, 0, 1, 1,
0.5365967, 1.026521, 0.5376683, 0.282353, 0, 1, 1,
0.5406147, -0.2779098, 2.062796, 0.2901961, 0, 1, 1,
0.5449082, -0.6417239, 4.055844, 0.2941177, 0, 1, 1,
0.5500112, 0.04906309, 2.414085, 0.3019608, 0, 1, 1,
0.5586064, 0.7584936, 1.237437, 0.3098039, 0, 1, 1,
0.562187, -0.4302599, 2.602505, 0.3137255, 0, 1, 1,
0.5622663, -0.5300741, 2.601567, 0.3215686, 0, 1, 1,
0.5637656, 0.988855, 0.8084921, 0.3254902, 0, 1, 1,
0.5669422, 1.795484, 0.6373434, 0.3333333, 0, 1, 1,
0.5674159, 0.9299368, 1.671702, 0.3372549, 0, 1, 1,
0.5676962, 0.8348194, 1.208436, 0.345098, 0, 1, 1,
0.5709324, -0.214009, 0.3783614, 0.3490196, 0, 1, 1,
0.5736543, 0.3767477, 0.2002899, 0.3568628, 0, 1, 1,
0.5771093, 1.041815, -0.4975673, 0.3607843, 0, 1, 1,
0.5783775, -0.2166125, 2.550927, 0.3686275, 0, 1, 1,
0.591337, 1.390415, -0.7363312, 0.372549, 0, 1, 1,
0.5941648, 1.800185, -0.8413649, 0.3803922, 0, 1, 1,
0.6068348, -1.006704, 2.992098, 0.3843137, 0, 1, 1,
0.6089101, 0.1932568, -0.5203087, 0.3921569, 0, 1, 1,
0.6098623, -0.7235159, 3.72473, 0.3960784, 0, 1, 1,
0.6108452, -0.7273598, 2.263545, 0.4039216, 0, 1, 1,
0.6136244, 1.054413, -0.5291977, 0.4117647, 0, 1, 1,
0.6144689, 0.3326462, 1.957201, 0.4156863, 0, 1, 1,
0.6183708, -1.425542, 1.795586, 0.4235294, 0, 1, 1,
0.6192718, 1.084238, -0.489459, 0.427451, 0, 1, 1,
0.6260448, 1.794761, 0.08149696, 0.4352941, 0, 1, 1,
0.6310463, -0.3645932, 1.070608, 0.4392157, 0, 1, 1,
0.637831, -0.2069844, 0.9495533, 0.4470588, 0, 1, 1,
0.6384569, 1.201213, 1.563944, 0.4509804, 0, 1, 1,
0.640864, 1.535187, 0.6077344, 0.4588235, 0, 1, 1,
0.6417413, -1.568709, 2.165838, 0.4627451, 0, 1, 1,
0.6433663, -0.233694, 2.331615, 0.4705882, 0, 1, 1,
0.6439074, 0.1331161, 1.176324, 0.4745098, 0, 1, 1,
0.6446885, 0.2761924, 2.628336, 0.4823529, 0, 1, 1,
0.6457286, 0.6086586, -0.3276465, 0.4862745, 0, 1, 1,
0.647151, 0.4971191, 1.250289, 0.4941176, 0, 1, 1,
0.6602903, 0.3371739, -0.09159093, 0.5019608, 0, 1, 1,
0.6704226, 0.2832039, 0.3785701, 0.5058824, 0, 1, 1,
0.6759585, 0.4465729, 1.041263, 0.5137255, 0, 1, 1,
0.6795415, -0.5181044, 1.558307, 0.5176471, 0, 1, 1,
0.6799453, 2.020707, 1.685727, 0.5254902, 0, 1, 1,
0.6854911, 0.5030649, 0.02003769, 0.5294118, 0, 1, 1,
0.6857163, 0.3764794, 1.761064, 0.5372549, 0, 1, 1,
0.6863711, 0.1641001, 2.416374, 0.5411765, 0, 1, 1,
0.6887521, -0.6728622, 0.4785881, 0.5490196, 0, 1, 1,
0.6909179, 1.92605, 0.3260631, 0.5529412, 0, 1, 1,
0.6939087, -0.0709009, 2.233815, 0.5607843, 0, 1, 1,
0.6977335, 0.1566131, 1.750081, 0.5647059, 0, 1, 1,
0.6979825, 0.8090529, -0.1776159, 0.572549, 0, 1, 1,
0.6991072, -0.5337473, 1.611995, 0.5764706, 0, 1, 1,
0.7017484, -0.03179281, 2.442082, 0.5843138, 0, 1, 1,
0.7078494, 0.9293717, 2.296091, 0.5882353, 0, 1, 1,
0.7114499, 0.8841338, 0.1121797, 0.5960785, 0, 1, 1,
0.7123703, 0.6307325, 2.290588, 0.6039216, 0, 1, 1,
0.7132723, -0.04905539, 2.23397, 0.6078432, 0, 1, 1,
0.7144632, 0.7612437, 1.214006, 0.6156863, 0, 1, 1,
0.7182603, -0.4043724, 2.324639, 0.6196079, 0, 1, 1,
0.7214469, 0.4425914, 1.108544, 0.627451, 0, 1, 1,
0.7218332, -0.4758431, 1.317275, 0.6313726, 0, 1, 1,
0.7239776, -1.72954, 0.8888473, 0.6392157, 0, 1, 1,
0.7274464, 1.422428, -0.02011816, 0.6431373, 0, 1, 1,
0.7291684, -0.5979748, 4.458027, 0.6509804, 0, 1, 1,
0.7294863, 2.334697, 1.817371, 0.654902, 0, 1, 1,
0.7296895, 0.1527398, 0.4655406, 0.6627451, 0, 1, 1,
0.7298351, 2.560112, 0.8719732, 0.6666667, 0, 1, 1,
0.7301383, 0.5531194, 0.8640388, 0.6745098, 0, 1, 1,
0.7324331, -1.38892, 2.659015, 0.6784314, 0, 1, 1,
0.7328852, 0.5166292, 1.736289, 0.6862745, 0, 1, 1,
0.7409049, 0.595063, 1.138664, 0.6901961, 0, 1, 1,
0.7486083, 1.232093, -0.1148697, 0.6980392, 0, 1, 1,
0.7533402, -0.7864869, 3.055629, 0.7058824, 0, 1, 1,
0.7632545, -1.234469, 2.690453, 0.7098039, 0, 1, 1,
0.7639843, 0.3308296, 2.333568, 0.7176471, 0, 1, 1,
0.765714, 1.601267, -0.1407597, 0.7215686, 0, 1, 1,
0.7702416, 0.09498986, 1.663158, 0.7294118, 0, 1, 1,
0.7706464, -1.026289, 1.774197, 0.7333333, 0, 1, 1,
0.7713087, -0.1125481, 2.463767, 0.7411765, 0, 1, 1,
0.7717009, 0.3840349, 1.135836, 0.7450981, 0, 1, 1,
0.7751114, -2.408342, 3.859597, 0.7529412, 0, 1, 1,
0.7797937, 1.278711, 1.251949, 0.7568628, 0, 1, 1,
0.7806177, 0.2601772, 1.530532, 0.7647059, 0, 1, 1,
0.7817109, -0.3514, 3.739667, 0.7686275, 0, 1, 1,
0.7968755, -3.009275, 1.850972, 0.7764706, 0, 1, 1,
0.7984222, -0.8577276, 2.649507, 0.7803922, 0, 1, 1,
0.8002724, -0.4294657, 0.4282731, 0.7882353, 0, 1, 1,
0.8050776, 0.1378531, 0.7719602, 0.7921569, 0, 1, 1,
0.8102255, 0.0799409, 1.931535, 0.8, 0, 1, 1,
0.8121775, 1.591762, 0.9090902, 0.8078431, 0, 1, 1,
0.8153809, -0.6370555, 1.739522, 0.8117647, 0, 1, 1,
0.8205342, 0.747008, 0.8137567, 0.8196079, 0, 1, 1,
0.8293319, 0.781047, 1.944778, 0.8235294, 0, 1, 1,
0.8321747, -2.213128, 2.60061, 0.8313726, 0, 1, 1,
0.8327916, -0.1949701, 2.200746, 0.8352941, 0, 1, 1,
0.8381914, -0.6039308, 3.005259, 0.8431373, 0, 1, 1,
0.8431551, 0.7817481, 0.8396906, 0.8470588, 0, 1, 1,
0.8445063, -0.1251551, 1.998586, 0.854902, 0, 1, 1,
0.8556805, -0.4214135, 1.01238, 0.8588235, 0, 1, 1,
0.8617738, -0.9949824, 2.981091, 0.8666667, 0, 1, 1,
0.8620594, -0.6086426, 1.357034, 0.8705882, 0, 1, 1,
0.862914, 0.8054816, -1.158168, 0.8784314, 0, 1, 1,
0.8635744, 0.3148787, 1.26756, 0.8823529, 0, 1, 1,
0.8658478, -1.420323, 2.554619, 0.8901961, 0, 1, 1,
0.8677726, -0.3752198, 2.925977, 0.8941177, 0, 1, 1,
0.8691514, -0.5887198, 3.132653, 0.9019608, 0, 1, 1,
0.8765518, 2.036611, 1.021035, 0.9098039, 0, 1, 1,
0.882292, -0.01576175, 1.093024, 0.9137255, 0, 1, 1,
0.882868, 0.7128378, 0.5491133, 0.9215686, 0, 1, 1,
0.8978013, -0.4913937, 1.803972, 0.9254902, 0, 1, 1,
0.8980355, -0.01473654, 1.498433, 0.9333333, 0, 1, 1,
0.9074109, 0.1942517, 0.6143514, 0.9372549, 0, 1, 1,
0.9153226, -1.996563, 3.501581, 0.945098, 0, 1, 1,
0.9240158, 0.0458695, 1.1798, 0.9490196, 0, 1, 1,
0.9370982, 1.91469, 1.560147, 0.9568627, 0, 1, 1,
0.9441589, 1.114451, -0.1744636, 0.9607843, 0, 1, 1,
0.9441801, -2.3454, 2.926172, 0.9686275, 0, 1, 1,
0.9453667, -1.443377, 1.493125, 0.972549, 0, 1, 1,
0.9473218, -1.802879, 3.937202, 0.9803922, 0, 1, 1,
0.9482867, 0.9406139, 1.167346, 0.9843137, 0, 1, 1,
0.9525313, 0.2021249, 1.111119, 0.9921569, 0, 1, 1,
0.9543445, -1.174286, 1.438283, 0.9960784, 0, 1, 1,
0.9559386, 2.155667, 0.08684496, 1, 0, 0.9960784, 1,
0.956307, 1.61067, 1.090625, 1, 0, 0.9882353, 1,
0.9591849, -1.214158, 2.184969, 1, 0, 0.9843137, 1,
0.9608855, 0.07573491, 0.1675556, 1, 0, 0.9764706, 1,
0.9610561, -0.5691142, 2.132122, 1, 0, 0.972549, 1,
0.9627825, 0.5803825, 1.472249, 1, 0, 0.9647059, 1,
0.9710954, 1.550977, 1.387451, 1, 0, 0.9607843, 1,
0.9722899, -0.7050735, 2.844926, 1, 0, 0.9529412, 1,
0.9824572, 1.637291, 2.110562, 1, 0, 0.9490196, 1,
0.9840896, -1.216408, 1.063763, 1, 0, 0.9411765, 1,
0.9945126, 0.8359337, 0.256186, 1, 0, 0.9372549, 1,
0.9953747, 0.9728672, 3.127997, 1, 0, 0.9294118, 1,
1.006631, 0.3218398, 2.03366, 1, 0, 0.9254902, 1,
1.007191, -1.788177, 4.165151, 1, 0, 0.9176471, 1,
1.009229, 0.6273314, 0.1188548, 1, 0, 0.9137255, 1,
1.01018, 0.4540376, 1.195434, 1, 0, 0.9058824, 1,
1.011839, -1.857385, 0.4660773, 1, 0, 0.9019608, 1,
1.012034, -0.1269949, 2.359515, 1, 0, 0.8941177, 1,
1.01469, 1.331178, 2.393257, 1, 0, 0.8862745, 1,
1.015487, -0.2614386, 2.012513, 1, 0, 0.8823529, 1,
1.01565, -0.1554323, 1.819092, 1, 0, 0.8745098, 1,
1.017982, -0.6612388, 1.743862, 1, 0, 0.8705882, 1,
1.019359, 0.8968276, 1.300612, 1, 0, 0.8627451, 1,
1.020446, 0.3904054, 0.7433835, 1, 0, 0.8588235, 1,
1.02092, 0.9313293, 0.06074316, 1, 0, 0.8509804, 1,
1.030675, -0.8894119, 1.904175, 1, 0, 0.8470588, 1,
1.034329, 1.181608, 0.2006015, 1, 0, 0.8392157, 1,
1.035926, 2.168116, 2.000404, 1, 0, 0.8352941, 1,
1.036242, -1.538447, 1.945874, 1, 0, 0.827451, 1,
1.036829, 0.3046496, 1.309716, 1, 0, 0.8235294, 1,
1.039376, -0.3966909, 2.905603, 1, 0, 0.8156863, 1,
1.042502, -0.03408527, 1.085824, 1, 0, 0.8117647, 1,
1.047238, -0.225111, -1.485798, 1, 0, 0.8039216, 1,
1.058361, -0.7180126, 0.9241997, 1, 0, 0.7960784, 1,
1.058967, -1.488104, 2.530075, 1, 0, 0.7921569, 1,
1.061108, 0.2453465, 2.162141, 1, 0, 0.7843137, 1,
1.063642, 0.5263722, 0.2073216, 1, 0, 0.7803922, 1,
1.068934, -1.791913, 2.398262, 1, 0, 0.772549, 1,
1.074182, -1.018789, 2.259448, 1, 0, 0.7686275, 1,
1.082144, 0.4961781, 0.645332, 1, 0, 0.7607843, 1,
1.090273, -0.3863285, 3.173572, 1, 0, 0.7568628, 1,
1.099009, -1.100057, 1.390345, 1, 0, 0.7490196, 1,
1.12676, -1.076403, 2.383173, 1, 0, 0.7450981, 1,
1.127248, 0.2729633, 2.303701, 1, 0, 0.7372549, 1,
1.133635, -0.1322014, 2.293752, 1, 0, 0.7333333, 1,
1.133921, -1.464164, 3.803332, 1, 0, 0.7254902, 1,
1.136397, 0.9358749, 2.989949, 1, 0, 0.7215686, 1,
1.141296, -0.006350895, 0.1736268, 1, 0, 0.7137255, 1,
1.141949, 1.63127, 0.5093168, 1, 0, 0.7098039, 1,
1.146634, -1.146537, 2.596931, 1, 0, 0.7019608, 1,
1.150322, 1.126634, 1.544663, 1, 0, 0.6941177, 1,
1.151936, 1.260473, -0.5508823, 1, 0, 0.6901961, 1,
1.164252, -0.4799671, 1.305036, 1, 0, 0.682353, 1,
1.165868, 0.7940735, 3.943941, 1, 0, 0.6784314, 1,
1.17458, -0.05076521, 2.303771, 1, 0, 0.6705883, 1,
1.175715, 1.989213, 0.6158863, 1, 0, 0.6666667, 1,
1.189127, 1.966287, 2.444975, 1, 0, 0.6588235, 1,
1.192418, -1.099606, 2.140218, 1, 0, 0.654902, 1,
1.192947, -0.6734811, 1.533144, 1, 0, 0.6470588, 1,
1.207327, -0.2298707, 0.2075605, 1, 0, 0.6431373, 1,
1.221627, -1.667074, 1.198942, 1, 0, 0.6352941, 1,
1.223443, 0.3695844, 1.864518, 1, 0, 0.6313726, 1,
1.22791, -0.4930965, 1.507173, 1, 0, 0.6235294, 1,
1.229399, -1.060082, 3.351191, 1, 0, 0.6196079, 1,
1.233706, 0.4018773, 1.633699, 1, 0, 0.6117647, 1,
1.23504, -0.3242415, 1.181946, 1, 0, 0.6078432, 1,
1.238127, 0.1703173, 2.406235, 1, 0, 0.6, 1,
1.240371, 0.1113593, 2.772274, 1, 0, 0.5921569, 1,
1.256522, 0.6469316, -0.08574253, 1, 0, 0.5882353, 1,
1.288974, -1.163382, 2.76752, 1, 0, 0.5803922, 1,
1.298563, 0.2597249, -0.5644337, 1, 0, 0.5764706, 1,
1.316136, 0.9818599, 2.311249, 1, 0, 0.5686275, 1,
1.318544, 0.3247896, 1.643824, 1, 0, 0.5647059, 1,
1.319824, -1.326698, 4.79358, 1, 0, 0.5568628, 1,
1.335198, -0.456679, 1.72007, 1, 0, 0.5529412, 1,
1.341359, 0.8516645, -0.2936699, 1, 0, 0.5450981, 1,
1.341896, 0.779618, 2.130833, 1, 0, 0.5411765, 1,
1.342121, 0.3730255, 1.79095, 1, 0, 0.5333334, 1,
1.346487, 1.716046, -0.5442579, 1, 0, 0.5294118, 1,
1.349979, 1.142846, 1.125006, 1, 0, 0.5215687, 1,
1.357446, 0.3079756, 0.02593815, 1, 0, 0.5176471, 1,
1.364041, 0.4058872, -0.9601218, 1, 0, 0.509804, 1,
1.377435, 0.4768549, 1.192338, 1, 0, 0.5058824, 1,
1.384115, -0.1239496, 2.72161, 1, 0, 0.4980392, 1,
1.414287, -0.748782, 0.6131906, 1, 0, 0.4901961, 1,
1.419455, 2.11594, 1.385212, 1, 0, 0.4862745, 1,
1.421711, 0.5661195, 0.2956978, 1, 0, 0.4784314, 1,
1.444607, -0.4722237, 1.017391, 1, 0, 0.4745098, 1,
1.45424, -1.162322, 4.571492, 1, 0, 0.4666667, 1,
1.454367, 0.6452533, 2.205992, 1, 0, 0.4627451, 1,
1.456291, -0.6762702, 1.77523, 1, 0, 0.454902, 1,
1.459288, 1.614661, 0.3689269, 1, 0, 0.4509804, 1,
1.479429, -0.6068037, 2.245465, 1, 0, 0.4431373, 1,
1.489635, -0.2178688, 0.3658254, 1, 0, 0.4392157, 1,
1.494991, 0.3411867, 1.674022, 1, 0, 0.4313726, 1,
1.505481, 0.4184729, 1.32775, 1, 0, 0.427451, 1,
1.518096, -0.1655589, 1.443229, 1, 0, 0.4196078, 1,
1.523641, -1.018044, 1.388748, 1, 0, 0.4156863, 1,
1.528344, -0.5214041, 4.36091, 1, 0, 0.4078431, 1,
1.538375, -1.094317, 0.1567151, 1, 0, 0.4039216, 1,
1.542482, 0.1880594, 1.323221, 1, 0, 0.3960784, 1,
1.542745, -0.2902739, 2.906083, 1, 0, 0.3882353, 1,
1.555173, 1.03733, 1.847839, 1, 0, 0.3843137, 1,
1.563955, -0.8882653, 1.938607, 1, 0, 0.3764706, 1,
1.580685, 1.159227, -0.2529707, 1, 0, 0.372549, 1,
1.587492, 0.6243388, 1.728998, 1, 0, 0.3647059, 1,
1.58762, 0.3585115, 2.295104, 1, 0, 0.3607843, 1,
1.595179, -0.2742303, 2.334259, 1, 0, 0.3529412, 1,
1.614697, -0.1393858, 0.5291508, 1, 0, 0.3490196, 1,
1.619082, 0.2079051, -0.03978482, 1, 0, 0.3411765, 1,
1.632272, -0.2735009, 2.448887, 1, 0, 0.3372549, 1,
1.634199, 0.1928996, 2.382961, 1, 0, 0.3294118, 1,
1.652539, -0.2014814, 0.6997582, 1, 0, 0.3254902, 1,
1.661945, -0.1807074, 1.385865, 1, 0, 0.3176471, 1,
1.686524, 0.4146504, 2.392222, 1, 0, 0.3137255, 1,
1.686857, -0.9213604, 3.955744, 1, 0, 0.3058824, 1,
1.691408, -1.460443, 1.115541, 1, 0, 0.2980392, 1,
1.691502, 0.1857962, 2.311355, 1, 0, 0.2941177, 1,
1.692331, -0.3663147, 0.9493124, 1, 0, 0.2862745, 1,
1.723615, -1.503088, 0.8995241, 1, 0, 0.282353, 1,
1.725224, 2.306344, -0.5787848, 1, 0, 0.2745098, 1,
1.730594, 1.18012, 2.701559, 1, 0, 0.2705882, 1,
1.735664, 0.4524154, 0.2055815, 1, 0, 0.2627451, 1,
1.737214, -1.117446, 0.479735, 1, 0, 0.2588235, 1,
1.738873, -1.147352, 2.182584, 1, 0, 0.2509804, 1,
1.766293, 0.4430345, 0.523341, 1, 0, 0.2470588, 1,
1.772227, 2.125411, 0.6823094, 1, 0, 0.2392157, 1,
1.778751, 0.5819784, 3.184615, 1, 0, 0.2352941, 1,
1.78978, 0.5038077, -0.1563849, 1, 0, 0.227451, 1,
1.798217, 1.778712, 0.9511867, 1, 0, 0.2235294, 1,
1.818302, -0.9934119, 1.819783, 1, 0, 0.2156863, 1,
1.845096, -0.2756045, 4.135369, 1, 0, 0.2117647, 1,
1.85312, -1.32814, 1.637195, 1, 0, 0.2039216, 1,
1.865663, 0.5898765, 0.418432, 1, 0, 0.1960784, 1,
1.877678, -0.06729792, 2.46171, 1, 0, 0.1921569, 1,
1.900573, -0.4188041, 0.2073488, 1, 0, 0.1843137, 1,
1.911111, 0.1903426, 0.7326161, 1, 0, 0.1803922, 1,
1.921554, -1.183805, 1.248464, 1, 0, 0.172549, 1,
1.921651, -0.920113, 4.185041, 1, 0, 0.1686275, 1,
1.933429, -0.03974757, 1.757048, 1, 0, 0.1607843, 1,
1.935354, 1.118048, 1.252197, 1, 0, 0.1568628, 1,
1.960747, 1.863097, 0.380255, 1, 0, 0.1490196, 1,
2.002575, -0.542336, -0.3803124, 1, 0, 0.145098, 1,
2.029272, -0.7013093, 1.279309, 1, 0, 0.1372549, 1,
2.039506, -0.9021426, 2.165726, 1, 0, 0.1333333, 1,
2.085142, 0.6699892, 0.7800462, 1, 0, 0.1254902, 1,
2.091123, -0.3502877, 1.602614, 1, 0, 0.1215686, 1,
2.092626, 0.9364172, 0.8759275, 1, 0, 0.1137255, 1,
2.1032, 0.6825491, -0.5093712, 1, 0, 0.1098039, 1,
2.153417, 1.559929, 0.733663, 1, 0, 0.1019608, 1,
2.166823, -1.976866, 4.161462, 1, 0, 0.09411765, 1,
2.171511, 1.731559, 0.1241299, 1, 0, 0.09019608, 1,
2.208122, -0.5103109, 1.630492, 1, 0, 0.08235294, 1,
2.23894, 1.434781, 0.4447922, 1, 0, 0.07843138, 1,
2.24923, 0.3575532, 2.323434, 1, 0, 0.07058824, 1,
2.260522, 1.117569, -0.4779959, 1, 0, 0.06666667, 1,
2.261776, -0.1495718, 2.063861, 1, 0, 0.05882353, 1,
2.4008, -0.8779408, 0.1076365, 1, 0, 0.05490196, 1,
2.459226, -0.1465574, 0.5100353, 1, 0, 0.04705882, 1,
2.524304, 0.6096398, 2.294669, 1, 0, 0.04313726, 1,
2.584416, 1.205628, 0.7838275, 1, 0, 0.03529412, 1,
2.61714, 0.2685077, 0.7899129, 1, 0, 0.03137255, 1,
2.633872, 0.2443979, 1.865472, 1, 0, 0.02352941, 1,
2.737109, -0.3076857, 2.113843, 1, 0, 0.01960784, 1,
2.866052, -1.620008, 0.4247701, 1, 0, 0.01176471, 1,
3.304726, 0.1346468, 1.044694, 1, 0, 0.007843138, 1
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
-0.04425061, -4.047203, -7.481091, 0, -0.5, 0.5, 0.5,
-0.04425061, -4.047203, -7.481091, 1, -0.5, 0.5, 0.5,
-0.04425061, -4.047203, -7.481091, 1, 1.5, 0.5, 0.5,
-0.04425061, -4.047203, -7.481091, 0, 1.5, 0.5, 0.5
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
-4.528531, 0.05245852, -7.481091, 0, -0.5, 0.5, 0.5,
-4.528531, 0.05245852, -7.481091, 1, -0.5, 0.5, 0.5,
-4.528531, 0.05245852, -7.481091, 1, 1.5, 0.5, 0.5,
-4.528531, 0.05245852, -7.481091, 0, 1.5, 0.5, 0.5
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
-4.528531, -4.047203, -0.4542487, 0, -0.5, 0.5, 0.5,
-4.528531, -4.047203, -0.4542487, 1, -0.5, 0.5, 0.5,
-4.528531, -4.047203, -0.4542487, 1, 1.5, 0.5, 0.5,
-4.528531, -4.047203, -0.4542487, 0, 1.5, 0.5, 0.5
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
-3, -3.101127, -5.859512,
3, -3.101127, -5.859512,
-3, -3.101127, -5.859512,
-3, -3.258806, -6.129776,
-2, -3.101127, -5.859512,
-2, -3.258806, -6.129776,
-1, -3.101127, -5.859512,
-1, -3.258806, -6.129776,
0, -3.101127, -5.859512,
0, -3.258806, -6.129776,
1, -3.101127, -5.859512,
1, -3.258806, -6.129776,
2, -3.101127, -5.859512,
2, -3.258806, -6.129776,
3, -3.101127, -5.859512,
3, -3.258806, -6.129776
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
-3, -3.574165, -6.670302, 0, -0.5, 0.5, 0.5,
-3, -3.574165, -6.670302, 1, -0.5, 0.5, 0.5,
-3, -3.574165, -6.670302, 1, 1.5, 0.5, 0.5,
-3, -3.574165, -6.670302, 0, 1.5, 0.5, 0.5,
-2, -3.574165, -6.670302, 0, -0.5, 0.5, 0.5,
-2, -3.574165, -6.670302, 1, -0.5, 0.5, 0.5,
-2, -3.574165, -6.670302, 1, 1.5, 0.5, 0.5,
-2, -3.574165, -6.670302, 0, 1.5, 0.5, 0.5,
-1, -3.574165, -6.670302, 0, -0.5, 0.5, 0.5,
-1, -3.574165, -6.670302, 1, -0.5, 0.5, 0.5,
-1, -3.574165, -6.670302, 1, 1.5, 0.5, 0.5,
-1, -3.574165, -6.670302, 0, 1.5, 0.5, 0.5,
0, -3.574165, -6.670302, 0, -0.5, 0.5, 0.5,
0, -3.574165, -6.670302, 1, -0.5, 0.5, 0.5,
0, -3.574165, -6.670302, 1, 1.5, 0.5, 0.5,
0, -3.574165, -6.670302, 0, 1.5, 0.5, 0.5,
1, -3.574165, -6.670302, 0, -0.5, 0.5, 0.5,
1, -3.574165, -6.670302, 1, -0.5, 0.5, 0.5,
1, -3.574165, -6.670302, 1, 1.5, 0.5, 0.5,
1, -3.574165, -6.670302, 0, 1.5, 0.5, 0.5,
2, -3.574165, -6.670302, 0, -0.5, 0.5, 0.5,
2, -3.574165, -6.670302, 1, -0.5, 0.5, 0.5,
2, -3.574165, -6.670302, 1, 1.5, 0.5, 0.5,
2, -3.574165, -6.670302, 0, 1.5, 0.5, 0.5,
3, -3.574165, -6.670302, 0, -0.5, 0.5, 0.5,
3, -3.574165, -6.670302, 1, -0.5, 0.5, 0.5,
3, -3.574165, -6.670302, 1, 1.5, 0.5, 0.5,
3, -3.574165, -6.670302, 0, 1.5, 0.5, 0.5
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
-3.493697, -3, -5.859512,
-3.493697, 3, -5.859512,
-3.493697, -3, -5.859512,
-3.666169, -3, -6.129776,
-3.493697, -2, -5.859512,
-3.666169, -2, -6.129776,
-3.493697, -1, -5.859512,
-3.666169, -1, -6.129776,
-3.493697, 0, -5.859512,
-3.666169, 0, -6.129776,
-3.493697, 1, -5.859512,
-3.666169, 1, -6.129776,
-3.493697, 2, -5.859512,
-3.666169, 2, -6.129776,
-3.493697, 3, -5.859512,
-3.666169, 3, -6.129776
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
-4.011114, -3, -6.670302, 0, -0.5, 0.5, 0.5,
-4.011114, -3, -6.670302, 1, -0.5, 0.5, 0.5,
-4.011114, -3, -6.670302, 1, 1.5, 0.5, 0.5,
-4.011114, -3, -6.670302, 0, 1.5, 0.5, 0.5,
-4.011114, -2, -6.670302, 0, -0.5, 0.5, 0.5,
-4.011114, -2, -6.670302, 1, -0.5, 0.5, 0.5,
-4.011114, -2, -6.670302, 1, 1.5, 0.5, 0.5,
-4.011114, -2, -6.670302, 0, 1.5, 0.5, 0.5,
-4.011114, -1, -6.670302, 0, -0.5, 0.5, 0.5,
-4.011114, -1, -6.670302, 1, -0.5, 0.5, 0.5,
-4.011114, -1, -6.670302, 1, 1.5, 0.5, 0.5,
-4.011114, -1, -6.670302, 0, 1.5, 0.5, 0.5,
-4.011114, 0, -6.670302, 0, -0.5, 0.5, 0.5,
-4.011114, 0, -6.670302, 1, -0.5, 0.5, 0.5,
-4.011114, 0, -6.670302, 1, 1.5, 0.5, 0.5,
-4.011114, 0, -6.670302, 0, 1.5, 0.5, 0.5,
-4.011114, 1, -6.670302, 0, -0.5, 0.5, 0.5,
-4.011114, 1, -6.670302, 1, -0.5, 0.5, 0.5,
-4.011114, 1, -6.670302, 1, 1.5, 0.5, 0.5,
-4.011114, 1, -6.670302, 0, 1.5, 0.5, 0.5,
-4.011114, 2, -6.670302, 0, -0.5, 0.5, 0.5,
-4.011114, 2, -6.670302, 1, -0.5, 0.5, 0.5,
-4.011114, 2, -6.670302, 1, 1.5, 0.5, 0.5,
-4.011114, 2, -6.670302, 0, 1.5, 0.5, 0.5,
-4.011114, 3, -6.670302, 0, -0.5, 0.5, 0.5,
-4.011114, 3, -6.670302, 1, -0.5, 0.5, 0.5,
-4.011114, 3, -6.670302, 1, 1.5, 0.5, 0.5,
-4.011114, 3, -6.670302, 0, 1.5, 0.5, 0.5
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
-3.493697, -3.101127, -4,
-3.493697, -3.101127, 4,
-3.493697, -3.101127, -4,
-3.666169, -3.258806, -4,
-3.493697, -3.101127, -2,
-3.666169, -3.258806, -2,
-3.493697, -3.101127, 0,
-3.666169, -3.258806, 0,
-3.493697, -3.101127, 2,
-3.666169, -3.258806, 2,
-3.493697, -3.101127, 4,
-3.666169, -3.258806, 4
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
-4.011114, -3.574165, -4, 0, -0.5, 0.5, 0.5,
-4.011114, -3.574165, -4, 1, -0.5, 0.5, 0.5,
-4.011114, -3.574165, -4, 1, 1.5, 0.5, 0.5,
-4.011114, -3.574165, -4, 0, 1.5, 0.5, 0.5,
-4.011114, -3.574165, -2, 0, -0.5, 0.5, 0.5,
-4.011114, -3.574165, -2, 1, -0.5, 0.5, 0.5,
-4.011114, -3.574165, -2, 1, 1.5, 0.5, 0.5,
-4.011114, -3.574165, -2, 0, 1.5, 0.5, 0.5,
-4.011114, -3.574165, 0, 0, -0.5, 0.5, 0.5,
-4.011114, -3.574165, 0, 1, -0.5, 0.5, 0.5,
-4.011114, -3.574165, 0, 1, 1.5, 0.5, 0.5,
-4.011114, -3.574165, 0, 0, 1.5, 0.5, 0.5,
-4.011114, -3.574165, 2, 0, -0.5, 0.5, 0.5,
-4.011114, -3.574165, 2, 1, -0.5, 0.5, 0.5,
-4.011114, -3.574165, 2, 1, 1.5, 0.5, 0.5,
-4.011114, -3.574165, 2, 0, 1.5, 0.5, 0.5,
-4.011114, -3.574165, 4, 0, -0.5, 0.5, 0.5,
-4.011114, -3.574165, 4, 1, -0.5, 0.5, 0.5,
-4.011114, -3.574165, 4, 1, 1.5, 0.5, 0.5,
-4.011114, -3.574165, 4, 0, 1.5, 0.5, 0.5
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
-3.493697, -3.101127, -5.859512,
-3.493697, 3.206044, -5.859512,
-3.493697, -3.101127, 4.951015,
-3.493697, 3.206044, 4.951015,
-3.493697, -3.101127, -5.859512,
-3.493697, -3.101127, 4.951015,
-3.493697, 3.206044, -5.859512,
-3.493697, 3.206044, 4.951015,
-3.493697, -3.101127, -5.859512,
3.405196, -3.101127, -5.859512,
-3.493697, -3.101127, 4.951015,
3.405196, -3.101127, 4.951015,
-3.493697, 3.206044, -5.859512,
3.405196, 3.206044, -5.859512,
-3.493697, 3.206044, 4.951015,
3.405196, 3.206044, 4.951015,
3.405196, -3.101127, -5.859512,
3.405196, 3.206044, -5.859512,
3.405196, -3.101127, 4.951015,
3.405196, 3.206044, 4.951015,
3.405196, -3.101127, -5.859512,
3.405196, -3.101127, 4.951015,
3.405196, 3.206044, -5.859512,
3.405196, 3.206044, 4.951015
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
var radius = 7.631303;
var distance = 33.95253;
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
mvMatrix.translate( 0.04425061, -0.05245852, 0.4542487 );
mvMatrix.scale( 1.196006, 1.308211, 0.763248 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.95253);
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
nicotine_nicotine_su<-read.table("nicotine_nicotine_su.xyz", skip=1)
```

```
## Error in read.table("nicotine_nicotine_su.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-nicotine_nicotine_su$V2
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_nicotine_su' not found
```

```r
y<-nicotine_nicotine_su$V3
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_nicotine_su' not found
```

```r
z<-nicotine_nicotine_su$V4
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_nicotine_su' not found
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
-3.393228, 0.1572963, -1.886416, 0, 0, 1, 1, 1,
-3.202227, 0.6259382, -1.328631, 1, 0, 0, 1, 1,
-2.691076, 0.277829, -1.874664, 1, 0, 0, 1, 1,
-2.645702, 0.2733279, -2.984498, 1, 0, 0, 1, 1,
-2.569043, -2.475942, -0.6725324, 1, 0, 0, 1, 1,
-2.48217, 0.04821169, -0.735994, 1, 0, 0, 1, 1,
-2.475087, 0.9318733, -1.186543, 0, 0, 0, 1, 1,
-2.382652, -0.1233155, -2.994241, 0, 0, 0, 1, 1,
-2.319345, -1.217725, -1.847981, 0, 0, 0, 1, 1,
-2.301018, -0.1284552, -2.416335, 0, 0, 0, 1, 1,
-2.30092, 1.688627, 0.5777388, 0, 0, 0, 1, 1,
-2.227523, 0.1701273, 1.000024, 0, 0, 0, 1, 1,
-2.195406, -0.6244023, -2.09739, 0, 0, 0, 1, 1,
-2.166938, 2.567305, -0.8849607, 1, 1, 1, 1, 1,
-2.165627, 1.24086, -0.7196048, 1, 1, 1, 1, 1,
-2.156408, -0.3405942, -2.328296, 1, 1, 1, 1, 1,
-2.151533, 0.6184297, 0.07463871, 1, 1, 1, 1, 1,
-2.132674, 0.1093734, -0.07865984, 1, 1, 1, 1, 1,
-2.126895, -0.9027187, -1.268571, 1, 1, 1, 1, 1,
-2.125388, 0.4225284, -2.324023, 1, 1, 1, 1, 1,
-2.0477, 0.02957235, -1.07484, 1, 1, 1, 1, 1,
-2.009107, 1.615598, -0.05470428, 1, 1, 1, 1, 1,
-1.956045, -2.019527, -3.104224, 1, 1, 1, 1, 1,
-1.952114, -0.3392407, -1.278082, 1, 1, 1, 1, 1,
-1.932924, -0.134434, -3.179717, 1, 1, 1, 1, 1,
-1.930586, 1.426569, -0.1391598, 1, 1, 1, 1, 1,
-1.905934, -0.3357486, -1.851156, 1, 1, 1, 1, 1,
-1.868505, -1.922014, -1.505001, 1, 1, 1, 1, 1,
-1.865243, 1.252988, -1.121372, 0, 0, 1, 1, 1,
-1.861471, -2.02511, -4.483687, 1, 0, 0, 1, 1,
-1.828575, 1.30566, -0.7024844, 1, 0, 0, 1, 1,
-1.822099, 0.9246674, -2.323099, 1, 0, 0, 1, 1,
-1.820345, -0.02712522, -0.895844, 1, 0, 0, 1, 1,
-1.798213, 0.7696677, -0.6083447, 1, 0, 0, 1, 1,
-1.797847, -1.184709, -3.289303, 0, 0, 0, 1, 1,
-1.782075, 0.6830136, -0.3518563, 0, 0, 0, 1, 1,
-1.780079, -0.1160994, -0.1107982, 0, 0, 0, 1, 1,
-1.771109, -0.2034736, -1.607928, 0, 0, 0, 1, 1,
-1.765318, 0.6874698, -0.5146378, 0, 0, 0, 1, 1,
-1.756112, -0.2190861, -1.542839, 0, 0, 0, 1, 1,
-1.747441, 1.690613, -1.007764, 0, 0, 0, 1, 1,
-1.731279, 0.926821, -0.7077378, 1, 1, 1, 1, 1,
-1.72379, 2.463956, 0.9656519, 1, 1, 1, 1, 1,
-1.706761, -0.4696692, -1.370301, 1, 1, 1, 1, 1,
-1.706017, -0.3874211, -3.158683, 1, 1, 1, 1, 1,
-1.677685, 0.315017, -0.7957848, 1, 1, 1, 1, 1,
-1.659624, 1.695579, -0.118859, 1, 1, 1, 1, 1,
-1.642643, 1.002883, -1.987054, 1, 1, 1, 1, 1,
-1.637381, 0.6758454, -1.774244, 1, 1, 1, 1, 1,
-1.629194, 0.4713193, -2.589512, 1, 1, 1, 1, 1,
-1.614886, -1.067425, -2.729307, 1, 1, 1, 1, 1,
-1.613829, 2.195316, -1.891484, 1, 1, 1, 1, 1,
-1.602112, -0.07734291, -1.636263, 1, 1, 1, 1, 1,
-1.601705, -1.266994, -0.9607803, 1, 1, 1, 1, 1,
-1.598364, -1.288764, -0.6709879, 1, 1, 1, 1, 1,
-1.575097, 0.755585, -1.43124, 1, 1, 1, 1, 1,
-1.518869, 0.8834327, -0.2332472, 0, 0, 1, 1, 1,
-1.515116, 2.61529, 0.1088088, 1, 0, 0, 1, 1,
-1.514244, -0.7294087, -0.8645824, 1, 0, 0, 1, 1,
-1.500389, 1.064475, -2.123151, 1, 0, 0, 1, 1,
-1.497406, 0.5498759, 0.09742647, 1, 0, 0, 1, 1,
-1.48236, 0.6170346, -0.7172255, 1, 0, 0, 1, 1,
-1.477479, -0.9393533, -1.606212, 0, 0, 0, 1, 1,
-1.472093, -0.7299113, -2.267926, 0, 0, 0, 1, 1,
-1.46528, -0.08453471, -1.86311, 0, 0, 0, 1, 1,
-1.462144, -0.1328649, -2.545718, 0, 0, 0, 1, 1,
-1.458395, -1.360608, -3.528294, 0, 0, 0, 1, 1,
-1.452368, 0.4421413, -1.48218, 0, 0, 0, 1, 1,
-1.449836, -0.517969, -1.474894, 0, 0, 0, 1, 1,
-1.447987, -1.053993, -0.2501881, 1, 1, 1, 1, 1,
-1.439208, 0.9354034, -1.568546, 1, 1, 1, 1, 1,
-1.434696, -0.5484169, -0.9048492, 1, 1, 1, 1, 1,
-1.431703, -0.5082509, -2.151079, 1, 1, 1, 1, 1,
-1.426301, -0.7685686, -0.7895237, 1, 1, 1, 1, 1,
-1.420714, -1.358726, -2.619763, 1, 1, 1, 1, 1,
-1.41568, 0.06223584, -2.110282, 1, 1, 1, 1, 1,
-1.391566, 0.3140927, -2.062515, 1, 1, 1, 1, 1,
-1.390822, -1.227456, -1.799637, 1, 1, 1, 1, 1,
-1.372894, 0.2128351, -1.924325, 1, 1, 1, 1, 1,
-1.365518, -1.709769, -0.6874198, 1, 1, 1, 1, 1,
-1.362532, 0.779992, -0.460859, 1, 1, 1, 1, 1,
-1.362003, -0.7543687, -1.111337, 1, 1, 1, 1, 1,
-1.335641, -0.7228, -2.353294, 1, 1, 1, 1, 1,
-1.324873, 0.3348676, -2.139994, 1, 1, 1, 1, 1,
-1.324423, 0.9522398, -2.191101, 0, 0, 1, 1, 1,
-1.323876, 0.0717664, -0.2367071, 1, 0, 0, 1, 1,
-1.320394, 1.084099, -1.133155, 1, 0, 0, 1, 1,
-1.319073, -0.2366046, -1.91946, 1, 0, 0, 1, 1,
-1.318653, 0.66379, 0.3909678, 1, 0, 0, 1, 1,
-1.308478, -0.03318122, -0.5584398, 1, 0, 0, 1, 1,
-1.299384, 1.265747, -0.4967098, 0, 0, 0, 1, 1,
-1.293321, -0.7062861, -2.43079, 0, 0, 0, 1, 1,
-1.290904, 0.03500277, -1.275788, 0, 0, 0, 1, 1,
-1.285534, 1.248652, -0.9542881, 0, 0, 0, 1, 1,
-1.282913, -0.006678896, -1.815427, 0, 0, 0, 1, 1,
-1.258776, 0.1493748, -1.974961, 0, 0, 0, 1, 1,
-1.257269, -1.649374, -2.542397, 0, 0, 0, 1, 1,
-1.253659, -0.4021859, -1.807548, 1, 1, 1, 1, 1,
-1.247375, 0.07741206, -1.353684, 1, 1, 1, 1, 1,
-1.245691, -1.586777, -3.249421, 1, 1, 1, 1, 1,
-1.244166, 0.5962678, -0.632799, 1, 1, 1, 1, 1,
-1.233823, -2.331506, -2.230325, 1, 1, 1, 1, 1,
-1.23183, 0.03549541, -2.849682, 1, 1, 1, 1, 1,
-1.228786, 0.1929161, -2.414101, 1, 1, 1, 1, 1,
-1.22772, -0.1324415, -3.557106, 1, 1, 1, 1, 1,
-1.215486, 0.2142719, -1.535852, 1, 1, 1, 1, 1,
-1.192301, -0.7479831, -2.453962, 1, 1, 1, 1, 1,
-1.185784, 0.2263668, -1.50668, 1, 1, 1, 1, 1,
-1.178986, -1.140426, -0.6077209, 1, 1, 1, 1, 1,
-1.168412, -0.6051409, -0.5409904, 1, 1, 1, 1, 1,
-1.164659, -1.319518, -0.8733277, 1, 1, 1, 1, 1,
-1.162555, 0.70504, -0.5878716, 1, 1, 1, 1, 1,
-1.154424, -0.4429627, -1.738523, 0, 0, 1, 1, 1,
-1.153667, -0.3518304, -1.041812, 1, 0, 0, 1, 1,
-1.151281, -0.04102803, -1.307741, 1, 0, 0, 1, 1,
-1.149595, 0.2044684, -1.560299, 1, 0, 0, 1, 1,
-1.147559, 0.08012587, 0.4057387, 1, 0, 0, 1, 1,
-1.141527, 0.5927136, -0.05251702, 1, 0, 0, 1, 1,
-1.138901, -0.4365615, -0.8517491, 0, 0, 0, 1, 1,
-1.138065, 0.8495247, -1.279086, 0, 0, 0, 1, 1,
-1.136531, 0.3022012, -1.713861, 0, 0, 0, 1, 1,
-1.133397, -0.6647124, -1.153033, 0, 0, 0, 1, 1,
-1.131163, 0.4968328, 0.8566314, 0, 0, 0, 1, 1,
-1.130203, 0.368006, -0.1470505, 0, 0, 0, 1, 1,
-1.129424, 0.1308712, -2.389631, 0, 0, 0, 1, 1,
-1.125065, 2.524192, 0.3308734, 1, 1, 1, 1, 1,
-1.123562, 0.7864057, -1.057916, 1, 1, 1, 1, 1,
-1.11376, -0.05103432, -2.092619, 1, 1, 1, 1, 1,
-1.11151, -2.173049, -3.091206, 1, 1, 1, 1, 1,
-1.106306, 0.5098438, 0.5542006, 1, 1, 1, 1, 1,
-1.100164, -0.9797116, -2.260626, 1, 1, 1, 1, 1,
-1.095874, 0.8654572, -1.123687, 1, 1, 1, 1, 1,
-1.094547, -0.9370639, -2.006902, 1, 1, 1, 1, 1,
-1.092447, -1.614105, -3.66369, 1, 1, 1, 1, 1,
-1.089426, 0.7378781, -0.4064232, 1, 1, 1, 1, 1,
-1.087747, 1.195814, -1.288218, 1, 1, 1, 1, 1,
-1.087258, 1.971476, -1.879516, 1, 1, 1, 1, 1,
-1.080782, 1.029649, -1.366855, 1, 1, 1, 1, 1,
-1.064882, 0.2060386, -1.834141, 1, 1, 1, 1, 1,
-1.064479, -0.6677999, -3.306855, 1, 1, 1, 1, 1,
-1.058762, 0.2920552, 0.3671777, 0, 0, 1, 1, 1,
-1.05823, -0.3166195, -2.116293, 1, 0, 0, 1, 1,
-1.058151, -1.496116, -3.443753, 1, 0, 0, 1, 1,
-1.055621, 0.6982553, -0.9781927, 1, 0, 0, 1, 1,
-1.052178, -0.6740941, -1.971323, 1, 0, 0, 1, 1,
-1.050811, -0.8979558, -3.552206, 1, 0, 0, 1, 1,
-1.04706, 0.3626522, -2.215255, 0, 0, 0, 1, 1,
-1.046561, 0.03258616, -0.01797726, 0, 0, 0, 1, 1,
-1.046132, -0.1422372, -1.616452, 0, 0, 0, 1, 1,
-1.045891, -0.3199874, -1.499241, 0, 0, 0, 1, 1,
-1.039879, -0.6492254, -1.98149, 0, 0, 0, 1, 1,
-1.039233, 1.501611, -2.268002, 0, 0, 0, 1, 1,
-1.038675, 0.8586304, -2.352245, 0, 0, 0, 1, 1,
-1.0152, 1.366137, 0.1439757, 1, 1, 1, 1, 1,
-1.014417, 1.024914, -0.1508984, 1, 1, 1, 1, 1,
-1.012282, 0.6972266, -2.333803, 1, 1, 1, 1, 1,
-1.007654, 0.3415201, -1.337081, 1, 1, 1, 1, 1,
-1.002823, -0.974965, -3.347367, 1, 1, 1, 1, 1,
-1.001347, 0.3318287, -2.878508, 1, 1, 1, 1, 1,
-1.00038, -0.1977463, -1.860769, 1, 1, 1, 1, 1,
-0.9926304, -0.7788454, -3.786613, 1, 1, 1, 1, 1,
-0.9912567, 0.7566817, -0.7020671, 1, 1, 1, 1, 1,
-0.9895924, 1.950009, 0.1395869, 1, 1, 1, 1, 1,
-0.9751974, 1.909769, -2.534717, 1, 1, 1, 1, 1,
-0.974025, -0.432191, -1.103227, 1, 1, 1, 1, 1,
-0.9724141, 1.25329, 0.2608346, 1, 1, 1, 1, 1,
-0.9585763, 0.5368342, -3.017816, 1, 1, 1, 1, 1,
-0.9538602, -0.1294301, -2.270376, 1, 1, 1, 1, 1,
-0.9495952, -0.3246633, -1.329494, 0, 0, 1, 1, 1,
-0.9474922, -1.312696, -2.560974, 1, 0, 0, 1, 1,
-0.9474687, -1.773344, -2.590878, 1, 0, 0, 1, 1,
-0.9358419, -0.3937635, -2.091568, 1, 0, 0, 1, 1,
-0.9339264, -1.788093, -2.681122, 1, 0, 0, 1, 1,
-0.9328363, -0.7791434, -1.353302, 1, 0, 0, 1, 1,
-0.9140084, 0.4754389, 0.2454213, 0, 0, 0, 1, 1,
-0.9131598, 2.272458, 1.840071, 0, 0, 0, 1, 1,
-0.9094121, 1.370348, -1.229165, 0, 0, 0, 1, 1,
-0.9073662, 0.8186629, 0.2782684, 0, 0, 0, 1, 1,
-0.9024699, 1.93183, 0.7451678, 0, 0, 0, 1, 1,
-0.8950801, -1.799978, -1.79849, 0, 0, 0, 1, 1,
-0.8925225, -1.981582, -2.161838, 0, 0, 0, 1, 1,
-0.8901383, 1.607261, -0.006316504, 1, 1, 1, 1, 1,
-0.8894017, 0.1229674, -0.3293817, 1, 1, 1, 1, 1,
-0.8886877, 0.4403687, -0.6914362, 1, 1, 1, 1, 1,
-0.8832102, 0.304888, -1.391694, 1, 1, 1, 1, 1,
-0.8823795, -1.423521, -1.67089, 1, 1, 1, 1, 1,
-0.8800609, -0.9425711, -2.668413, 1, 1, 1, 1, 1,
-0.8717706, -0.6236911, -1.923959, 1, 1, 1, 1, 1,
-0.865577, -0.3784357, -3.061257, 1, 1, 1, 1, 1,
-0.8630413, -0.8969959, -3.215561, 1, 1, 1, 1, 1,
-0.8625256, -0.1009821, -1.877167, 1, 1, 1, 1, 1,
-0.8592569, 0.6503882, -2.193269, 1, 1, 1, 1, 1,
-0.8520543, -1.438686, -3.390795, 1, 1, 1, 1, 1,
-0.8520243, -0.8358374, -1.611361, 1, 1, 1, 1, 1,
-0.8484089, 0.7559768, -0.5040318, 1, 1, 1, 1, 1,
-0.8420671, -0.777145, -1.306382, 1, 1, 1, 1, 1,
-0.840484, 1.626623, -2.119446, 0, 0, 1, 1, 1,
-0.8339423, 0.137732, -1.290177, 1, 0, 0, 1, 1,
-0.8338407, 0.4421983, -0.8039795, 1, 0, 0, 1, 1,
-0.8329157, 0.4733113, -0.734925, 1, 0, 0, 1, 1,
-0.8312247, -0.7590929, -4.349934, 1, 0, 0, 1, 1,
-0.8295946, -0.9101657, -2.171765, 1, 0, 0, 1, 1,
-0.8264565, -0.5324242, -3.709925, 0, 0, 0, 1, 1,
-0.8231074, 1.17179, 1.00498, 0, 0, 0, 1, 1,
-0.8218635, -0.232711, -1.941949, 0, 0, 0, 1, 1,
-0.8204553, -0.8030955, -1.792843, 0, 0, 0, 1, 1,
-0.8197529, 1.563898, -1.262949, 0, 0, 0, 1, 1,
-0.8067269, 0.7565351, 0.1691798, 0, 0, 0, 1, 1,
-0.8032721, -0.519785, -2.178458, 0, 0, 0, 1, 1,
-0.79992, 0.3935516, -1.245578, 1, 1, 1, 1, 1,
-0.7995902, -0.4809133, -0.5913001, 1, 1, 1, 1, 1,
-0.7969099, 1.004422, -1.469425, 1, 1, 1, 1, 1,
-0.7935864, 1.127797, -0.947804, 1, 1, 1, 1, 1,
-0.7928833, 0.1004166, -1.965782, 1, 1, 1, 1, 1,
-0.7911294, -0.657787, -2.479162, 1, 1, 1, 1, 1,
-0.7900138, -1.106898, -3.65405, 1, 1, 1, 1, 1,
-0.7890462, 2.115148, -0.2724892, 1, 1, 1, 1, 1,
-0.7879709, 0.4573372, -2.653701, 1, 1, 1, 1, 1,
-0.7836481, 0.006572703, -0.6866844, 1, 1, 1, 1, 1,
-0.7793041, -1.137421, -2.600026, 1, 1, 1, 1, 1,
-0.7770652, 0.8676189, -0.2466919, 1, 1, 1, 1, 1,
-0.774529, -1.760488, -2.471263, 1, 1, 1, 1, 1,
-0.7733226, -0.7237269, -2.460791, 1, 1, 1, 1, 1,
-0.7690693, 0.4525252, -1.356195, 1, 1, 1, 1, 1,
-0.7666647, 1.108951, -0.4188867, 0, 0, 1, 1, 1,
-0.7640893, -0.532637, -2.966656, 1, 0, 0, 1, 1,
-0.7611514, 0.7288612, 0.2618492, 1, 0, 0, 1, 1,
-0.7525855, 0.03593133, -1.293205, 1, 0, 0, 1, 1,
-0.7516452, -0.3509835, -2.578457, 1, 0, 0, 1, 1,
-0.7502834, 0.07790571, -0.2956899, 1, 0, 0, 1, 1,
-0.7450206, -0.7312182, -1.998826, 0, 0, 0, 1, 1,
-0.7442431, 0.9536378, -1.752504, 0, 0, 0, 1, 1,
-0.7401296, -1.322183, -1.708741, 0, 0, 0, 1, 1,
-0.738929, -1.440624, -3.126981, 0, 0, 0, 1, 1,
-0.7377944, 0.584541, -0.5964649, 0, 0, 0, 1, 1,
-0.737591, 0.7417235, 0.4151374, 0, 0, 0, 1, 1,
-0.7373928, 0.9238208, -2.030104, 0, 0, 0, 1, 1,
-0.736864, -0.05537239, -0.8900025, 1, 1, 1, 1, 1,
-0.7350854, -0.2249608, -1.865687, 1, 1, 1, 1, 1,
-0.7342095, -0.2940874, -1.434059, 1, 1, 1, 1, 1,
-0.7312099, 0.4019026, -1.579018, 1, 1, 1, 1, 1,
-0.7283283, -1.001316, -1.696869, 1, 1, 1, 1, 1,
-0.7265167, -0.9078045, -3.428786, 1, 1, 1, 1, 1,
-0.7220254, 2.196067, 0.2357929, 1, 1, 1, 1, 1,
-0.7163851, -1.078048, -1.634657, 1, 1, 1, 1, 1,
-0.7158497, -0.3971266, -1.52195, 1, 1, 1, 1, 1,
-0.7157856, 0.3562602, -1.180331, 1, 1, 1, 1, 1,
-0.7063442, 1.682583, -0.859512, 1, 1, 1, 1, 1,
-0.7056777, -1.06222, -1.195002, 1, 1, 1, 1, 1,
-0.7056139, 0.8770187, -0.200078, 1, 1, 1, 1, 1,
-0.7019493, 0.6567721, -0.5390334, 1, 1, 1, 1, 1,
-0.6987733, 1.390439, -0.9204399, 1, 1, 1, 1, 1,
-0.6953402, -1.478846, -3.61435, 0, 0, 1, 1, 1,
-0.6930214, 0.8441613, -0.0375918, 1, 0, 0, 1, 1,
-0.6886955, -2.37785, -3.450734, 1, 0, 0, 1, 1,
-0.684448, -0.05168834, -3.933482, 1, 0, 0, 1, 1,
-0.6809276, 0.4162029, -0.6823028, 1, 0, 0, 1, 1,
-0.6657387, 0.2242341, -0.8651018, 1, 0, 0, 1, 1,
-0.6652539, 0.8718297, -1.386405, 0, 0, 0, 1, 1,
-0.6605231, 1.070106, 0.6262583, 0, 0, 0, 1, 1,
-0.6597185, -0.5142306, -2.698417, 0, 0, 0, 1, 1,
-0.6570542, -0.9963031, -2.40957, 0, 0, 0, 1, 1,
-0.6562116, 0.225765, -2.206691, 0, 0, 0, 1, 1,
-0.6527287, 0.4833225, -2.346427, 0, 0, 0, 1, 1,
-0.6502082, -1.139019, -0.4920983, 0, 0, 0, 1, 1,
-0.6480958, -0.207861, -2.220823, 1, 1, 1, 1, 1,
-0.6406977, -0.9442467, -2.469809, 1, 1, 1, 1, 1,
-0.6345965, -0.589815, -3.542333, 1, 1, 1, 1, 1,
-0.6315191, -0.2025881, -0.8606921, 1, 1, 1, 1, 1,
-0.6295097, -0.4027956, -1.489035, 1, 1, 1, 1, 1,
-0.6259139, -0.1962682, -1.492309, 1, 1, 1, 1, 1,
-0.6252958, -1.074805, -2.424296, 1, 1, 1, 1, 1,
-0.6244442, -0.2643394, -2.220708, 1, 1, 1, 1, 1,
-0.6236458, 0.3195734, -2.38257, 1, 1, 1, 1, 1,
-0.613731, 0.9582731, -0.09296335, 1, 1, 1, 1, 1,
-0.6114331, 1.134887, -0.6750826, 1, 1, 1, 1, 1,
-0.6105123, 1.434425, -2.03948, 1, 1, 1, 1, 1,
-0.6099276, 0.4524292, 0.2091488, 1, 1, 1, 1, 1,
-0.6075126, 2.252841, -0.696481, 1, 1, 1, 1, 1,
-0.6060082, -0.8803302, -2.965465, 1, 1, 1, 1, 1,
-0.6053062, -0.163317, -1.410774, 0, 0, 1, 1, 1,
-0.6024352, -1.430083, -5.702077, 1, 0, 0, 1, 1,
-0.5996217, -0.7654671, -2.708945, 1, 0, 0, 1, 1,
-0.5985851, 0.1415167, -0.02164135, 1, 0, 0, 1, 1,
-0.5981435, 0.4375875, -0.1452625, 1, 0, 0, 1, 1,
-0.595067, 0.7121646, -1.93019, 1, 0, 0, 1, 1,
-0.5947198, -0.5158107, -1.171431, 0, 0, 0, 1, 1,
-0.5934488, 0.2100323, -2.088903, 0, 0, 0, 1, 1,
-0.591064, 0.4144174, -0.7513993, 0, 0, 0, 1, 1,
-0.5832104, -0.2961605, -0.9670356, 0, 0, 0, 1, 1,
-0.5831608, -2.229923, -2.661997, 0, 0, 0, 1, 1,
-0.5782267, -0.9742439, -2.611008, 0, 0, 0, 1, 1,
-0.5780315, -0.6784938, -2.224059, 0, 0, 0, 1, 1,
-0.5723503, 0.3373759, -1.48691, 1, 1, 1, 1, 1,
-0.5646869, 1.137925, 0.4297822, 1, 1, 1, 1, 1,
-0.5627914, -0.1691041, -2.196339, 1, 1, 1, 1, 1,
-0.5618768, -1.986507, -2.970104, 1, 1, 1, 1, 1,
-0.5608509, -1.137016, -1.570535, 1, 1, 1, 1, 1,
-0.5589018, 1.045836, -1.724046, 1, 1, 1, 1, 1,
-0.556843, 0.4220163, -0.04731599, 1, 1, 1, 1, 1,
-0.5553365, 0.3517475, -1.285074, 1, 1, 1, 1, 1,
-0.5472269, 0.9546222, -2.106822, 1, 1, 1, 1, 1,
-0.5443531, -0.9575502, -3.596444, 1, 1, 1, 1, 1,
-0.5413439, -1.158953, -2.217803, 1, 1, 1, 1, 1,
-0.5365725, 0.6669121, 0.8709205, 1, 1, 1, 1, 1,
-0.5335943, 0.6798983, -0.5665243, 1, 1, 1, 1, 1,
-0.5307812, -1.140485, -3.048584, 1, 1, 1, 1, 1,
-0.5302084, -1.59952, -2.045324, 1, 1, 1, 1, 1,
-0.529336, -0.7314724, -1.449995, 0, 0, 1, 1, 1,
-0.5291906, -0.9181541, -2.544108, 1, 0, 0, 1, 1,
-0.5262624, -0.4754308, -2.052465, 1, 0, 0, 1, 1,
-0.5255888, 2.687435, -0.3455581, 1, 0, 0, 1, 1,
-0.519154, -0.4051848, -3.548361, 1, 0, 0, 1, 1,
-0.5183743, 0.5978155, -0.06378569, 1, 0, 0, 1, 1,
-0.5141194, 0.4839813, -1.544212, 0, 0, 0, 1, 1,
-0.51367, 1.045578, 0.6875454, 0, 0, 0, 1, 1,
-0.5091919, -1.919843, -2.289514, 0, 0, 0, 1, 1,
-0.504829, -0.7015941, -3.93188, 0, 0, 0, 1, 1,
-0.5030469, 0.1206958, -2.412397, 0, 0, 0, 1, 1,
-0.5006687, -0.8918074, -3.395751, 0, 0, 0, 1, 1,
-0.500325, 0.1869246, -1.276069, 0, 0, 0, 1, 1,
-0.4943044, 0.9359362, -0.3938699, 1, 1, 1, 1, 1,
-0.4941735, 0.621185, -0.6509582, 1, 1, 1, 1, 1,
-0.4939738, -0.03391401, -1.284254, 1, 1, 1, 1, 1,
-0.4921298, -0.4760824, -1.777691, 1, 1, 1, 1, 1,
-0.4915018, -1.802295, -1.053734, 1, 1, 1, 1, 1,
-0.4909877, 0.0834017, -0.2593345, 1, 1, 1, 1, 1,
-0.4893608, -0.6932355, -2.936454, 1, 1, 1, 1, 1,
-0.4889167, 0.2719985, -0.556349, 1, 1, 1, 1, 1,
-0.486321, 0.03820175, -1.554166, 1, 1, 1, 1, 1,
-0.4810745, -0.1931752, -2.77248, 1, 1, 1, 1, 1,
-0.4767693, -0.3412596, -2.580109, 1, 1, 1, 1, 1,
-0.4742972, 0.3611177, -1.037999, 1, 1, 1, 1, 1,
-0.4732786, -0.8351945, -4.675884, 1, 1, 1, 1, 1,
-0.4725012, 0.02762793, -2.129821, 1, 1, 1, 1, 1,
-0.471662, -1.25219, -0.4241461, 1, 1, 1, 1, 1,
-0.469453, 0.260457, -1.031121, 0, 0, 1, 1, 1,
-0.469243, -1.901707, -3.823518, 1, 0, 0, 1, 1,
-0.4684932, 0.5185949, -0.558032, 1, 0, 0, 1, 1,
-0.4683243, 0.8251652, -0.4927603, 1, 0, 0, 1, 1,
-0.4663348, -0.5237006, -2.684825, 1, 0, 0, 1, 1,
-0.466181, 0.735242, -1.308608, 1, 0, 0, 1, 1,
-0.4615667, 0.2910732, -1.546752, 0, 0, 0, 1, 1,
-0.4599199, -0.6139396, -3.12941, 0, 0, 0, 1, 1,
-0.4570723, -0.9115014, -4.013201, 0, 0, 0, 1, 1,
-0.457063, 0.04906774, -0.6779286, 0, 0, 0, 1, 1,
-0.4558167, 0.2495719, -1.820934, 0, 0, 0, 1, 1,
-0.4553395, -0.002226326, -0.9286554, 0, 0, 0, 1, 1,
-0.4538623, -1.031349, -1.953305, 0, 0, 0, 1, 1,
-0.4524975, 0.4345428, -1.558392, 1, 1, 1, 1, 1,
-0.4519763, 0.3446084, 0.1367705, 1, 1, 1, 1, 1,
-0.4513461, -0.04628386, -1.818177, 1, 1, 1, 1, 1,
-0.4481632, -1.39676, 0.2176656, 1, 1, 1, 1, 1,
-0.4472813, 0.2446484, -0.9424286, 1, 1, 1, 1, 1,
-0.4422571, -1.581717, -2.047005, 1, 1, 1, 1, 1,
-0.4385448, 2.409894, -1.647421, 1, 1, 1, 1, 1,
-0.437633, 0.9259309, -0.3477839, 1, 1, 1, 1, 1,
-0.4371829, 0.2896855, -0.2363825, 1, 1, 1, 1, 1,
-0.4369859, -0.3015767, -1.864514, 1, 1, 1, 1, 1,
-0.4312564, 0.3059303, -0.6485886, 1, 1, 1, 1, 1,
-0.4273261, -1.540602, -3.508359, 1, 1, 1, 1, 1,
-0.4254914, -0.575168, -1.09419, 1, 1, 1, 1, 1,
-0.4243195, -0.8894935, -1.542764, 1, 1, 1, 1, 1,
-0.4213254, -0.1529519, -2.582198, 1, 1, 1, 1, 1,
-0.4184525, -2.290406, -2.656653, 0, 0, 1, 1, 1,
-0.4135882, 0.3229795, -1.134908, 1, 0, 0, 1, 1,
-0.4103531, -1.04174, -4.275933, 1, 0, 0, 1, 1,
-0.4028035, -0.446507, -1.576264, 1, 0, 0, 1, 1,
-0.4026869, -0.1345873, -1.835079, 1, 0, 0, 1, 1,
-0.3969227, -1.31319, -3.474337, 1, 0, 0, 1, 1,
-0.3968939, 0.5199962, -0.3994924, 0, 0, 0, 1, 1,
-0.3900042, 0.1938684, 0.2720812, 0, 0, 0, 1, 1,
-0.3890119, 1.115792, 0.2352832, 0, 0, 0, 1, 1,
-0.3879115, 1.186432, -2.197081, 0, 0, 0, 1, 1,
-0.3867664, -0.194769, -0.4254607, 0, 0, 0, 1, 1,
-0.3849265, -0.1022281, -1.978856, 0, 0, 0, 1, 1,
-0.3837194, 0.2219001, -1.860939, 0, 0, 0, 1, 1,
-0.382508, 0.9587867, 0.3957101, 1, 1, 1, 1, 1,
-0.3809665, -1.015211, -1.848171, 1, 1, 1, 1, 1,
-0.3808725, 1.330543, 1.311894, 1, 1, 1, 1, 1,
-0.3789054, 0.03022863, -0.3250654, 1, 1, 1, 1, 1,
-0.3778742, -1.184783, -2.1432, 1, 1, 1, 1, 1,
-0.3773956, -0.6655231, -4.138286, 1, 1, 1, 1, 1,
-0.3760203, -2.209433, -4.05986, 1, 1, 1, 1, 1,
-0.3727539, 1.46605, -0.9007821, 1, 1, 1, 1, 1,
-0.3696868, -0.6529787, -3.336103, 1, 1, 1, 1, 1,
-0.365709, 2.259906, -3.296228, 1, 1, 1, 1, 1,
-0.353344, 0.8022353, 1.203404, 1, 1, 1, 1, 1,
-0.3517916, -1.612283, -3.668226, 1, 1, 1, 1, 1,
-0.3515984, -1.047734, -4.575191, 1, 1, 1, 1, 1,
-0.3502904, -0.3727079, -3.961834, 1, 1, 1, 1, 1,
-0.3453179, 1.044009, -1.548549, 1, 1, 1, 1, 1,
-0.3442767, -1.098373, -4.669919, 0, 0, 1, 1, 1,
-0.3434506, -0.3467785, -2.569631, 1, 0, 0, 1, 1,
-0.3327166, -0.371939, -3.084282, 1, 0, 0, 1, 1,
-0.328588, 1.829313, 0.7526854, 1, 0, 0, 1, 1,
-0.328299, 0.1690483, -2.427788, 1, 0, 0, 1, 1,
-0.3257607, 0.9705372, -1.177063, 1, 0, 0, 1, 1,
-0.3183714, -1.146658, -3.983442, 0, 0, 0, 1, 1,
-0.3125533, 1.42324, -1.573128, 0, 0, 0, 1, 1,
-0.3096191, 0.7178736, 0.08458246, 0, 0, 0, 1, 1,
-0.3071172, -1.355154, -3.381317, 0, 0, 0, 1, 1,
-0.3059449, 0.2147485, -0.8352158, 0, 0, 0, 1, 1,
-0.3028004, 0.8896376, -2.273709, 0, 0, 0, 1, 1,
-0.3026624, -0.8770794, -1.887648, 0, 0, 0, 1, 1,
-0.3022981, -1.020753, -2.143638, 1, 1, 1, 1, 1,
-0.2965359, -1.173359, -1.15022, 1, 1, 1, 1, 1,
-0.2954405, 0.289839, -0.2205548, 1, 1, 1, 1, 1,
-0.2934251, 1.361506, 0.3279264, 1, 1, 1, 1, 1,
-0.292937, 0.9144579, -1.204054, 1, 1, 1, 1, 1,
-0.2882911, 0.929361, 0.4411554, 1, 1, 1, 1, 1,
-0.2862057, -1.088224, -2.66979, 1, 1, 1, 1, 1,
-0.2847746, 1.48442, -1.942297, 1, 1, 1, 1, 1,
-0.2795499, 0.8810183, -0.317173, 1, 1, 1, 1, 1,
-0.2791662, 0.3494138, -1.28801, 1, 1, 1, 1, 1,
-0.2725531, -1.180612, -0.981927, 1, 1, 1, 1, 1,
-0.2723791, -0.677482, -1.933217, 1, 1, 1, 1, 1,
-0.270543, -2.178491, -2.509661, 1, 1, 1, 1, 1,
-0.2670389, -1.573529, -2.836067, 1, 1, 1, 1, 1,
-0.2659542, -0.3954848, -2.843317, 1, 1, 1, 1, 1,
-0.2611566, 1.15497, -0.3497521, 0, 0, 1, 1, 1,
-0.2603451, -0.07233212, -0.7657169, 1, 0, 0, 1, 1,
-0.2598743, 0.1646367, -0.999019, 1, 0, 0, 1, 1,
-0.2582297, -1.054024, -2.530455, 1, 0, 0, 1, 1,
-0.2495872, 2.31187, 0.3357912, 1, 0, 0, 1, 1,
-0.2490839, -0.1676698, -2.021817, 1, 0, 0, 1, 1,
-0.2471774, 1.409359, -1.348256, 0, 0, 0, 1, 1,
-0.232892, 0.1614464, -1.25634, 0, 0, 0, 1, 1,
-0.2301534, -0.7331911, -4.236693, 0, 0, 0, 1, 1,
-0.2295066, 0.2637934, -1.699729, 0, 0, 0, 1, 1,
-0.2261231, 0.4276947, 0.2801406, 0, 0, 0, 1, 1,
-0.2243313, 1.27268, -0.8756408, 0, 0, 0, 1, 1,
-0.2120522, 0.8615801, 0.1128487, 0, 0, 0, 1, 1,
-0.2096844, 0.3904824, -2.499153, 1, 1, 1, 1, 1,
-0.2082839, 0.2194936, -1.114992, 1, 1, 1, 1, 1,
-0.2079305, 2.421101, -1.492964, 1, 1, 1, 1, 1,
-0.2050493, 2.007702, -0.09435818, 1, 1, 1, 1, 1,
-0.2015226, 1.240069, -0.682424, 1, 1, 1, 1, 1,
-0.1989811, -0.6245589, -4.05659, 1, 1, 1, 1, 1,
-0.1987158, -1.178729, -1.950818, 1, 1, 1, 1, 1,
-0.1929047, -1.300272, -2.359922, 1, 1, 1, 1, 1,
-0.1904138, 0.5008782, -0.2602652, 1, 1, 1, 1, 1,
-0.1895341, 0.5916727, -0.08787291, 1, 1, 1, 1, 1,
-0.1832629, 0.05305228, -2.430227, 1, 1, 1, 1, 1,
-0.1792369, 1.664236, 1.675589, 1, 1, 1, 1, 1,
-0.178956, 1.220428, -1.715117, 1, 1, 1, 1, 1,
-0.1771056, -0.1570249, -2.369815, 1, 1, 1, 1, 1,
-0.1768094, 0.1612126, -0.5163177, 1, 1, 1, 1, 1,
-0.1756469, 0.8600779, -0.5985125, 0, 0, 1, 1, 1,
-0.1750147, -1.339138, -1.807389, 1, 0, 0, 1, 1,
-0.1711828, 0.7141687, -0.2489789, 1, 0, 0, 1, 1,
-0.1693242, -0.8962272, -2.649611, 1, 0, 0, 1, 1,
-0.1689355, -1.600291, -2.653995, 1, 0, 0, 1, 1,
-0.1662855, -0.5452732, -2.869834, 1, 0, 0, 1, 1,
-0.1636266, -0.2091882, -2.148572, 0, 0, 0, 1, 1,
-0.1619116, 1.223593, 1.326066, 0, 0, 0, 1, 1,
-0.1611457, 0.3574176, -0.7664793, 0, 0, 0, 1, 1,
-0.1565663, -0.3929743, -3.683134, 0, 0, 0, 1, 1,
-0.1563949, -1.956179, -3.250975, 0, 0, 0, 1, 1,
-0.1530712, 1.218251, -0.2352817, 0, 0, 0, 1, 1,
-0.152217, -1.099078, -2.252519, 0, 0, 0, 1, 1,
-0.1512352, -0.3231, -3.341759, 1, 1, 1, 1, 1,
-0.1510293, -1.780378, -2.462568, 1, 1, 1, 1, 1,
-0.1484045, -1.581287, -3.289386, 1, 1, 1, 1, 1,
-0.1373032, 2.525329, -0.466271, 1, 1, 1, 1, 1,
-0.1339896, -1.120565, -4.829112, 1, 1, 1, 1, 1,
-0.1334243, 0.4719086, 0.7748256, 1, 1, 1, 1, 1,
-0.1305618, 1.160175, -0.6435768, 1, 1, 1, 1, 1,
-0.1257892, 0.405107, -1.360047, 1, 1, 1, 1, 1,
-0.1246899, -1.42994, -2.571688, 1, 1, 1, 1, 1,
-0.1225351, -0.4678278, -1.22786, 1, 1, 1, 1, 1,
-0.1216719, 0.6297945, -0.06754983, 1, 1, 1, 1, 1,
-0.120951, -1.153141, -3.56745, 1, 1, 1, 1, 1,
-0.1208053, 0.1722432, 0.5169604, 1, 1, 1, 1, 1,
-0.1166111, 0.02334891, -0.4793137, 1, 1, 1, 1, 1,
-0.1160936, -0.8873432, -4.466418, 1, 1, 1, 1, 1,
-0.1150471, -0.1168573, -2.718661, 0, 0, 1, 1, 1,
-0.1092396, 0.6697768, -1.566517, 1, 0, 0, 1, 1,
-0.1029894, -0.8301991, -2.822509, 1, 0, 0, 1, 1,
-0.1024003, -0.1537758, -1.431706, 1, 0, 0, 1, 1,
-0.1015425, -1.406487, -2.376821, 1, 0, 0, 1, 1,
-0.1012123, -0.3643781, -1.478974, 1, 0, 0, 1, 1,
-0.1009095, -1.42094, -3.139494, 0, 0, 0, 1, 1,
-0.09858416, 1.443069, -1.79542, 0, 0, 0, 1, 1,
-0.09636767, 0.6315903, -0.6961491, 0, 0, 0, 1, 1,
-0.09143596, -0.9239185, -3.384939, 0, 0, 0, 1, 1,
-0.09119066, -2.472723, -3.459563, 0, 0, 0, 1, 1,
-0.08866989, -1.246874, -3.085916, 0, 0, 0, 1, 1,
-0.08768374, -0.6532673, -3.254821, 0, 0, 0, 1, 1,
-0.08669529, 0.4583234, -0.9330012, 1, 1, 1, 1, 1,
-0.0840197, 0.1553622, -0.6135387, 1, 1, 1, 1, 1,
-0.08362768, 0.6515413, 0.2843679, 1, 1, 1, 1, 1,
-0.08311815, -0.2379311, -2.699118, 1, 1, 1, 1, 1,
-0.07977018, 0.1083093, -0.928778, 1, 1, 1, 1, 1,
-0.07715239, -0.1452131, -1.314989, 1, 1, 1, 1, 1,
-0.07058962, -0.921692, -3.243949, 1, 1, 1, 1, 1,
-0.06864751, -0.3625092, -3.380876, 1, 1, 1, 1, 1,
-0.06589263, -0.5683659, -4.853697, 1, 1, 1, 1, 1,
-0.06502294, 0.3559961, 0.8987146, 1, 1, 1, 1, 1,
-0.05765148, 0.2027891, 2.47874, 1, 1, 1, 1, 1,
-0.05760426, 0.5221894, -0.2058217, 1, 1, 1, 1, 1,
-0.05649429, 0.1629731, 0.2893896, 1, 1, 1, 1, 1,
-0.05624909, -1.385697, -3.603696, 1, 1, 1, 1, 1,
-0.05542761, -0.4163263, -3.113664, 1, 1, 1, 1, 1,
-0.04944453, 0.04131816, -0.009307428, 0, 0, 1, 1, 1,
-0.04859657, -0.9816307, -3.799869, 1, 0, 0, 1, 1,
-0.046086, -0.4458199, -3.7575, 1, 0, 0, 1, 1,
-0.04592966, 0.3822512, 0.1613278, 1, 0, 0, 1, 1,
-0.0281646, -0.3937171, -3.759983, 1, 0, 0, 1, 1,
-0.02526232, 0.3885044, 0.63218, 1, 0, 0, 1, 1,
-0.02369736, -0.3143182, -3.653074, 0, 0, 0, 1, 1,
-0.0153938, -0.4091699, -2.993398, 0, 0, 0, 1, 1,
-0.01493275, -0.7417007, -1.742796, 0, 0, 0, 1, 1,
-0.0139146, 1.336804, 1.049205, 0, 0, 0, 1, 1,
-0.01083286, -0.2590328, -2.82046, 0, 0, 0, 1, 1,
-0.01049345, -0.07866977, -2.875874, 0, 0, 0, 1, 1,
-0.006646761, 0.08901694, -0.1187805, 0, 0, 0, 1, 1,
-0.0006088131, -0.8043157, -3.845205, 1, 1, 1, 1, 1,
-0.0004850812, -1.357574, -4.012189, 1, 1, 1, 1, 1,
0.003950727, 1.779359, 1.148135, 1, 1, 1, 1, 1,
0.004002641, 0.1518131, 1.564035, 1, 1, 1, 1, 1,
0.007161465, 0.1687597, 0.5342267, 1, 1, 1, 1, 1,
0.007647534, 0.3305385, -0.7903451, 1, 1, 1, 1, 1,
0.008955959, 1.411183, 0.4204412, 1, 1, 1, 1, 1,
0.009732165, -0.02691033, 3.399755, 1, 1, 1, 1, 1,
0.01207907, 0.4219315, -0.7615311, 1, 1, 1, 1, 1,
0.01776515, -1.470423, 3.753322, 1, 1, 1, 1, 1,
0.01798955, -0.8349416, 4.501024, 1, 1, 1, 1, 1,
0.02389406, 0.9613609, -0.3467748, 1, 1, 1, 1, 1,
0.02517525, -0.3344364, 1.413954, 1, 1, 1, 1, 1,
0.02603961, 1.602028, -0.5531744, 1, 1, 1, 1, 1,
0.03068729, 0.07471383, -0.4659801, 1, 1, 1, 1, 1,
0.03609275, 0.0860436, 0.753572, 0, 0, 1, 1, 1,
0.037243, -0.3071122, 3.264785, 1, 0, 0, 1, 1,
0.03852862, 0.05864418, 0.07699059, 1, 0, 0, 1, 1,
0.03999569, 0.4615502, 1.512651, 1, 0, 0, 1, 1,
0.0481359, 0.5992438, -0.1697061, 1, 0, 0, 1, 1,
0.04990833, 0.7700806, 1.675638, 1, 0, 0, 1, 1,
0.05339404, 0.2002312, 0.7011844, 0, 0, 0, 1, 1,
0.0548655, 0.1681427, -0.5440289, 0, 0, 0, 1, 1,
0.05492684, -0.2117347, 3.279822, 0, 0, 0, 1, 1,
0.05536656, -0.7285909, 1.910133, 0, 0, 0, 1, 1,
0.05730608, 1.184564, 1.114761, 0, 0, 0, 1, 1,
0.05864454, -1.387853, 3.04247, 0, 0, 0, 1, 1,
0.06056616, 0.3119368, -1.104007, 0, 0, 0, 1, 1,
0.06233086, -0.8074711, 3.262156, 1, 1, 1, 1, 1,
0.06908603, -2.489478, 2.246824, 1, 1, 1, 1, 1,
0.07007804, 1.341128, -0.415274, 1, 1, 1, 1, 1,
0.07155994, -1.667585, 4.741132, 1, 1, 1, 1, 1,
0.07187737, 0.4335674, 0.1853985, 1, 1, 1, 1, 1,
0.07800268, 1.57016, -0.9239085, 1, 1, 1, 1, 1,
0.07846911, 1.003585, 1.200696, 1, 1, 1, 1, 1,
0.08020281, -1.227808, 1.482873, 1, 1, 1, 1, 1,
0.08433659, -0.3345796, 3.858763, 1, 1, 1, 1, 1,
0.08436714, -0.869895, 3.57318, 1, 1, 1, 1, 1,
0.08443938, 0.4374686, 1.19592, 1, 1, 1, 1, 1,
0.08628976, 0.6695874, 1.047649, 1, 1, 1, 1, 1,
0.08647526, 0.7227491, 0.3853245, 1, 1, 1, 1, 1,
0.09204615, 1.108602, -1.322334, 1, 1, 1, 1, 1,
0.09325949, -0.3457991, 3.607392, 1, 1, 1, 1, 1,
0.09866221, -1.044835, 3.084164, 0, 0, 1, 1, 1,
0.1021521, 0.2323013, 1.185793, 1, 0, 0, 1, 1,
0.1040808, -0.7872173, 2.648628, 1, 0, 0, 1, 1,
0.109572, 0.9294062, 0.5625432, 1, 0, 0, 1, 1,
0.1121926, -0.7705131, 2.067136, 1, 0, 0, 1, 1,
0.1141245, 1.334862, -0.3517087, 1, 0, 0, 1, 1,
0.1178203, 0.5352203, -0.07826505, 0, 0, 0, 1, 1,
0.118395, 3.114192, -0.3372954, 0, 0, 0, 1, 1,
0.1242065, 0.4889213, 1.551422, 0, 0, 0, 1, 1,
0.1248111, -0.784588, 4.550949, 0, 0, 0, 1, 1,
0.1261487, 1.138621, 0.7976189, 0, 0, 0, 1, 1,
0.1267827, 0.6936168, -1.026146, 0, 0, 0, 1, 1,
0.1296395, 0.1111402, -0.12488, 0, 0, 0, 1, 1,
0.1315095, -0.1808297, 1.669713, 1, 1, 1, 1, 1,
0.1322087, 0.07143206, 0.8016752, 1, 1, 1, 1, 1,
0.137098, -0.3837117, 1.18347, 1, 1, 1, 1, 1,
0.1422583, -0.9964453, 2.892598, 1, 1, 1, 1, 1,
0.1433173, 0.9594971, 0.5529624, 1, 1, 1, 1, 1,
0.1439852, -0.554199, 3.534195, 1, 1, 1, 1, 1,
0.1446166, -0.815114, 3.801894, 1, 1, 1, 1, 1,
0.1452985, 0.4793802, -1.561701, 1, 1, 1, 1, 1,
0.1456399, -0.3686634, 1.54291, 1, 1, 1, 1, 1,
0.1509202, 1.27194, -0.3467323, 1, 1, 1, 1, 1,
0.1548194, -1.923328, 2.630086, 1, 1, 1, 1, 1,
0.1562143, 0.7983457, 0.2344987, 1, 1, 1, 1, 1,
0.1583433, 0.459907, 0.1633196, 1, 1, 1, 1, 1,
0.162516, 0.1234395, 1.492494, 1, 1, 1, 1, 1,
0.1690353, 0.2509417, 2.62042, 1, 1, 1, 1, 1,
0.1785663, -0.801378, 1.516704, 0, 0, 1, 1, 1,
0.19165, 1.257127, 0.3955368, 1, 0, 0, 1, 1,
0.1933024, 2.092581, -0.3761171, 1, 0, 0, 1, 1,
0.1963465, 0.5138513, 2.48594, 1, 0, 0, 1, 1,
0.199917, -0.2593323, 1.568348, 1, 0, 0, 1, 1,
0.2023382, 0.5880473, -0.4987089, 1, 0, 0, 1, 1,
0.202639, -1.041029, 4.197529, 0, 0, 0, 1, 1,
0.203877, 0.9717453, -1.684037, 0, 0, 0, 1, 1,
0.2054272, -0.7157491, 2.956119, 0, 0, 0, 1, 1,
0.2071917, -0.191049, 2.255043, 0, 0, 0, 1, 1,
0.215188, -0.8403933, 1.889191, 0, 0, 0, 1, 1,
0.2152119, 0.4750037, 1.033273, 0, 0, 0, 1, 1,
0.2158246, -0.511813, 2.792448, 0, 0, 0, 1, 1,
0.2188212, -0.9651684, 2.499952, 1, 1, 1, 1, 1,
0.220151, 2.142856, -0.1376574, 1, 1, 1, 1, 1,
0.2259899, -0.1706642, 3.146257, 1, 1, 1, 1, 1,
0.227522, -1.280057, 2.439008, 1, 1, 1, 1, 1,
0.2302519, 0.2909524, 2.140457, 1, 1, 1, 1, 1,
0.2327575, 0.7082766, 0.7276757, 1, 1, 1, 1, 1,
0.2468146, 0.5474441, -1.122354, 1, 1, 1, 1, 1,
0.2533437, 0.4246622, 0.1076485, 1, 1, 1, 1, 1,
0.2570511, 1.460374, 0.7182856, 1, 1, 1, 1, 1,
0.257584, 0.01053808, -0.3440622, 1, 1, 1, 1, 1,
0.2623477, -1.206453, 3.559423, 1, 1, 1, 1, 1,
0.2629934, 0.8088578, -1.494739, 1, 1, 1, 1, 1,
0.2651242, -0.03651103, 1.975836, 1, 1, 1, 1, 1,
0.2741267, 0.3639867, 0.4766674, 1, 1, 1, 1, 1,
0.2795548, 0.2039674, 1.968821, 1, 1, 1, 1, 1,
0.2806466, -0.7697431, 0.8512883, 0, 0, 1, 1, 1,
0.2825365, -0.06846318, 3.531729, 1, 0, 0, 1, 1,
0.2897508, 1.425699, -0.8045128, 1, 0, 0, 1, 1,
0.2914892, -0.1978995, 2.277273, 1, 0, 0, 1, 1,
0.2936901, 0.9339851, 0.0218045, 1, 0, 0, 1, 1,
0.2968348, 1.064116, 0.4167717, 1, 0, 0, 1, 1,
0.297617, -0.7173651, 2.1495, 0, 0, 0, 1, 1,
0.3035355, 0.1900998, 0.1862029, 0, 0, 0, 1, 1,
0.303568, -1.72217, 3.025862, 0, 0, 0, 1, 1,
0.3039125, -0.7935083, 0.9881851, 0, 0, 0, 1, 1,
0.3058871, 1.403768, -0.8883199, 0, 0, 0, 1, 1,
0.3068993, 0.4400202, -0.2029685, 0, 0, 0, 1, 1,
0.3117552, 1.31849, 0.2960361, 0, 0, 0, 1, 1,
0.3136676, -1.611293, 2.716537, 1, 1, 1, 1, 1,
0.3164741, -0.0672673, 2.186745, 1, 1, 1, 1, 1,
0.3171273, -0.09977905, 0.8661026, 1, 1, 1, 1, 1,
0.3180439, 2.745769, -0.4967998, 1, 1, 1, 1, 1,
0.3182812, 0.3501083, -0.8722609, 1, 1, 1, 1, 1,
0.3203338, -0.8314543, 3.237817, 1, 1, 1, 1, 1,
0.3204302, -0.7930907, 3.494972, 1, 1, 1, 1, 1,
0.330188, 0.161378, 0.8935767, 1, 1, 1, 1, 1,
0.3331838, -0.2532507, 2.901531, 1, 1, 1, 1, 1,
0.334913, -0.09418371, 2.966801, 1, 1, 1, 1, 1,
0.3356214, 0.6367711, 1.412472, 1, 1, 1, 1, 1,
0.3367128, -1.547205, 2.497957, 1, 1, 1, 1, 1,
0.3479882, 0.5709287, 1.254865, 1, 1, 1, 1, 1,
0.3547643, -0.02484865, 1.441111, 1, 1, 1, 1, 1,
0.3577242, 1.940992, 0.3447681, 1, 1, 1, 1, 1,
0.3585871, -0.2615739, 3.379059, 0, 0, 1, 1, 1,
0.3589716, -1.86251, 3.517005, 1, 0, 0, 1, 1,
0.3593038, -0.6457658, 1.984778, 1, 0, 0, 1, 1,
0.3601987, -0.2847952, 2.98747, 1, 0, 0, 1, 1,
0.3611248, 0.02287328, 0.9691194, 1, 0, 0, 1, 1,
0.3648842, -0.8106088, 3.044033, 1, 0, 0, 1, 1,
0.3710724, -0.1803853, 1.548735, 0, 0, 0, 1, 1,
0.3717171, -0.7260501, 2.690109, 0, 0, 0, 1, 1,
0.3722498, 0.156713, 1.177111, 0, 0, 0, 1, 1,
0.3726012, 1.090196, 1.043413, 0, 0, 0, 1, 1,
0.3743642, -1.243828, 2.154116, 0, 0, 0, 1, 1,
0.3744344, 0.4143695, 0.7726431, 0, 0, 0, 1, 1,
0.3746643, 1.288303, 0.3446553, 0, 0, 0, 1, 1,
0.3827122, -1.293775, 2.244615, 1, 1, 1, 1, 1,
0.3829957, -1.007003, 3.466798, 1, 1, 1, 1, 1,
0.383607, -1.100225, 2.599593, 1, 1, 1, 1, 1,
0.3836364, -0.6623164, 2.804391, 1, 1, 1, 1, 1,
0.3841871, 0.6366696, 2.028636, 1, 1, 1, 1, 1,
0.391782, 0.4904751, -0.1876611, 1, 1, 1, 1, 1,
0.3949489, -1.830135, 3.265355, 1, 1, 1, 1, 1,
0.3950808, -1.280457, 3.392215, 1, 1, 1, 1, 1,
0.3977409, 0.1905169, -0.07860255, 1, 1, 1, 1, 1,
0.3983568, -0.2253844, 3.172073, 1, 1, 1, 1, 1,
0.4016629, -0.01833374, 1.735185, 1, 1, 1, 1, 1,
0.4045459, -0.5583963, 3.155398, 1, 1, 1, 1, 1,
0.405435, 0.1046616, 0.3370578, 1, 1, 1, 1, 1,
0.4072773, 0.1186132, 1.757952, 1, 1, 1, 1, 1,
0.4090868, -1.841921, 3.063159, 1, 1, 1, 1, 1,
0.4176574, 0.6488408, 0.9892568, 0, 0, 1, 1, 1,
0.4197309, -1.754469, 3.273783, 1, 0, 0, 1, 1,
0.4242073, -0.8055428, 2.96039, 1, 0, 0, 1, 1,
0.4318702, 0.4967431, 0.6729242, 1, 0, 0, 1, 1,
0.433275, 0.330228, 0.1598274, 1, 0, 0, 1, 1,
0.4337799, 1.062027, -0.7538009, 1, 0, 0, 1, 1,
0.4342969, -1.214218, 2.909887, 0, 0, 0, 1, 1,
0.4395355, 0.5010219, 1.797822, 0, 0, 0, 1, 1,
0.4433345, -0.3587576, 0.9611043, 0, 0, 0, 1, 1,
0.4450491, 0.1149665, 2.311626, 0, 0, 0, 1, 1,
0.4455185, -0.4561205, 3.641171, 0, 0, 0, 1, 1,
0.4573883, -0.08937636, 2.357372, 0, 0, 0, 1, 1,
0.4596945, 0.1999377, 1.547603, 0, 0, 0, 1, 1,
0.4605685, 0.8965281, 0.4703662, 1, 1, 1, 1, 1,
0.4621741, 0.5045992, 2.410398, 1, 1, 1, 1, 1,
0.4657182, -0.8971728, 1.032711, 1, 1, 1, 1, 1,
0.4688699, 1.208953, 0.6328634, 1, 1, 1, 1, 1,
0.4694829, -0.5058772, 2.417884, 1, 1, 1, 1, 1,
0.4705569, 1.673822, 0.6528599, 1, 1, 1, 1, 1,
0.4705904, -0.9873983, 2.910439, 1, 1, 1, 1, 1,
0.4734386, 1.369078, 0.02558343, 1, 1, 1, 1, 1,
0.4752569, -0.3526483, 2.134668, 1, 1, 1, 1, 1,
0.4771797, -1.64762, 3.499408, 1, 1, 1, 1, 1,
0.4776581, -0.5234835, 3.341962, 1, 1, 1, 1, 1,
0.4819026, -1.503958, 2.80256, 1, 1, 1, 1, 1,
0.4822378, -1.284553, 3.182951, 1, 1, 1, 1, 1,
0.4859264, -0.8807059, 1.694777, 1, 1, 1, 1, 1,
0.4894522, -1.259758, 2.214364, 1, 1, 1, 1, 1,
0.4912815, 1.246115, 1.2578, 0, 0, 1, 1, 1,
0.4918858, -0.3536707, 2.115671, 1, 0, 0, 1, 1,
0.4949907, 0.6901318, -0.8165845, 1, 0, 0, 1, 1,
0.4959077, -1.334033, 2.509462, 1, 0, 0, 1, 1,
0.5074953, -1.357011, 3.540022, 1, 0, 0, 1, 1,
0.5084447, -0.04868848, 1.505014, 1, 0, 0, 1, 1,
0.5090171, 0.02734813, 0.08672417, 0, 0, 0, 1, 1,
0.5144991, -1.024186, 2.934072, 0, 0, 0, 1, 1,
0.5244266, 1.562778, 1.268993, 0, 0, 0, 1, 1,
0.524844, 1.66754, 1.228213, 0, 0, 0, 1, 1,
0.5252457, -0.6242089, 1.176362, 0, 0, 0, 1, 1,
0.5259338, 0.09736443, 1.52957, 0, 0, 0, 1, 1,
0.5274072, -0.373578, 3.083616, 0, 0, 0, 1, 1,
0.5346096, 0.5650203, 1.655292, 1, 1, 1, 1, 1,
0.5365967, 1.026521, 0.5376683, 1, 1, 1, 1, 1,
0.5406147, -0.2779098, 2.062796, 1, 1, 1, 1, 1,
0.5449082, -0.6417239, 4.055844, 1, 1, 1, 1, 1,
0.5500112, 0.04906309, 2.414085, 1, 1, 1, 1, 1,
0.5586064, 0.7584936, 1.237437, 1, 1, 1, 1, 1,
0.562187, -0.4302599, 2.602505, 1, 1, 1, 1, 1,
0.5622663, -0.5300741, 2.601567, 1, 1, 1, 1, 1,
0.5637656, 0.988855, 0.8084921, 1, 1, 1, 1, 1,
0.5669422, 1.795484, 0.6373434, 1, 1, 1, 1, 1,
0.5674159, 0.9299368, 1.671702, 1, 1, 1, 1, 1,
0.5676962, 0.8348194, 1.208436, 1, 1, 1, 1, 1,
0.5709324, -0.214009, 0.3783614, 1, 1, 1, 1, 1,
0.5736543, 0.3767477, 0.2002899, 1, 1, 1, 1, 1,
0.5771093, 1.041815, -0.4975673, 1, 1, 1, 1, 1,
0.5783775, -0.2166125, 2.550927, 0, 0, 1, 1, 1,
0.591337, 1.390415, -0.7363312, 1, 0, 0, 1, 1,
0.5941648, 1.800185, -0.8413649, 1, 0, 0, 1, 1,
0.6068348, -1.006704, 2.992098, 1, 0, 0, 1, 1,
0.6089101, 0.1932568, -0.5203087, 1, 0, 0, 1, 1,
0.6098623, -0.7235159, 3.72473, 1, 0, 0, 1, 1,
0.6108452, -0.7273598, 2.263545, 0, 0, 0, 1, 1,
0.6136244, 1.054413, -0.5291977, 0, 0, 0, 1, 1,
0.6144689, 0.3326462, 1.957201, 0, 0, 0, 1, 1,
0.6183708, -1.425542, 1.795586, 0, 0, 0, 1, 1,
0.6192718, 1.084238, -0.489459, 0, 0, 0, 1, 1,
0.6260448, 1.794761, 0.08149696, 0, 0, 0, 1, 1,
0.6310463, -0.3645932, 1.070608, 0, 0, 0, 1, 1,
0.637831, -0.2069844, 0.9495533, 1, 1, 1, 1, 1,
0.6384569, 1.201213, 1.563944, 1, 1, 1, 1, 1,
0.640864, 1.535187, 0.6077344, 1, 1, 1, 1, 1,
0.6417413, -1.568709, 2.165838, 1, 1, 1, 1, 1,
0.6433663, -0.233694, 2.331615, 1, 1, 1, 1, 1,
0.6439074, 0.1331161, 1.176324, 1, 1, 1, 1, 1,
0.6446885, 0.2761924, 2.628336, 1, 1, 1, 1, 1,
0.6457286, 0.6086586, -0.3276465, 1, 1, 1, 1, 1,
0.647151, 0.4971191, 1.250289, 1, 1, 1, 1, 1,
0.6602903, 0.3371739, -0.09159093, 1, 1, 1, 1, 1,
0.6704226, 0.2832039, 0.3785701, 1, 1, 1, 1, 1,
0.6759585, 0.4465729, 1.041263, 1, 1, 1, 1, 1,
0.6795415, -0.5181044, 1.558307, 1, 1, 1, 1, 1,
0.6799453, 2.020707, 1.685727, 1, 1, 1, 1, 1,
0.6854911, 0.5030649, 0.02003769, 1, 1, 1, 1, 1,
0.6857163, 0.3764794, 1.761064, 0, 0, 1, 1, 1,
0.6863711, 0.1641001, 2.416374, 1, 0, 0, 1, 1,
0.6887521, -0.6728622, 0.4785881, 1, 0, 0, 1, 1,
0.6909179, 1.92605, 0.3260631, 1, 0, 0, 1, 1,
0.6939087, -0.0709009, 2.233815, 1, 0, 0, 1, 1,
0.6977335, 0.1566131, 1.750081, 1, 0, 0, 1, 1,
0.6979825, 0.8090529, -0.1776159, 0, 0, 0, 1, 1,
0.6991072, -0.5337473, 1.611995, 0, 0, 0, 1, 1,
0.7017484, -0.03179281, 2.442082, 0, 0, 0, 1, 1,
0.7078494, 0.9293717, 2.296091, 0, 0, 0, 1, 1,
0.7114499, 0.8841338, 0.1121797, 0, 0, 0, 1, 1,
0.7123703, 0.6307325, 2.290588, 0, 0, 0, 1, 1,
0.7132723, -0.04905539, 2.23397, 0, 0, 0, 1, 1,
0.7144632, 0.7612437, 1.214006, 1, 1, 1, 1, 1,
0.7182603, -0.4043724, 2.324639, 1, 1, 1, 1, 1,
0.7214469, 0.4425914, 1.108544, 1, 1, 1, 1, 1,
0.7218332, -0.4758431, 1.317275, 1, 1, 1, 1, 1,
0.7239776, -1.72954, 0.8888473, 1, 1, 1, 1, 1,
0.7274464, 1.422428, -0.02011816, 1, 1, 1, 1, 1,
0.7291684, -0.5979748, 4.458027, 1, 1, 1, 1, 1,
0.7294863, 2.334697, 1.817371, 1, 1, 1, 1, 1,
0.7296895, 0.1527398, 0.4655406, 1, 1, 1, 1, 1,
0.7298351, 2.560112, 0.8719732, 1, 1, 1, 1, 1,
0.7301383, 0.5531194, 0.8640388, 1, 1, 1, 1, 1,
0.7324331, -1.38892, 2.659015, 1, 1, 1, 1, 1,
0.7328852, 0.5166292, 1.736289, 1, 1, 1, 1, 1,
0.7409049, 0.595063, 1.138664, 1, 1, 1, 1, 1,
0.7486083, 1.232093, -0.1148697, 1, 1, 1, 1, 1,
0.7533402, -0.7864869, 3.055629, 0, 0, 1, 1, 1,
0.7632545, -1.234469, 2.690453, 1, 0, 0, 1, 1,
0.7639843, 0.3308296, 2.333568, 1, 0, 0, 1, 1,
0.765714, 1.601267, -0.1407597, 1, 0, 0, 1, 1,
0.7702416, 0.09498986, 1.663158, 1, 0, 0, 1, 1,
0.7706464, -1.026289, 1.774197, 1, 0, 0, 1, 1,
0.7713087, -0.1125481, 2.463767, 0, 0, 0, 1, 1,
0.7717009, 0.3840349, 1.135836, 0, 0, 0, 1, 1,
0.7751114, -2.408342, 3.859597, 0, 0, 0, 1, 1,
0.7797937, 1.278711, 1.251949, 0, 0, 0, 1, 1,
0.7806177, 0.2601772, 1.530532, 0, 0, 0, 1, 1,
0.7817109, -0.3514, 3.739667, 0, 0, 0, 1, 1,
0.7968755, -3.009275, 1.850972, 0, 0, 0, 1, 1,
0.7984222, -0.8577276, 2.649507, 1, 1, 1, 1, 1,
0.8002724, -0.4294657, 0.4282731, 1, 1, 1, 1, 1,
0.8050776, 0.1378531, 0.7719602, 1, 1, 1, 1, 1,
0.8102255, 0.0799409, 1.931535, 1, 1, 1, 1, 1,
0.8121775, 1.591762, 0.9090902, 1, 1, 1, 1, 1,
0.8153809, -0.6370555, 1.739522, 1, 1, 1, 1, 1,
0.8205342, 0.747008, 0.8137567, 1, 1, 1, 1, 1,
0.8293319, 0.781047, 1.944778, 1, 1, 1, 1, 1,
0.8321747, -2.213128, 2.60061, 1, 1, 1, 1, 1,
0.8327916, -0.1949701, 2.200746, 1, 1, 1, 1, 1,
0.8381914, -0.6039308, 3.005259, 1, 1, 1, 1, 1,
0.8431551, 0.7817481, 0.8396906, 1, 1, 1, 1, 1,
0.8445063, -0.1251551, 1.998586, 1, 1, 1, 1, 1,
0.8556805, -0.4214135, 1.01238, 1, 1, 1, 1, 1,
0.8617738, -0.9949824, 2.981091, 1, 1, 1, 1, 1,
0.8620594, -0.6086426, 1.357034, 0, 0, 1, 1, 1,
0.862914, 0.8054816, -1.158168, 1, 0, 0, 1, 1,
0.8635744, 0.3148787, 1.26756, 1, 0, 0, 1, 1,
0.8658478, -1.420323, 2.554619, 1, 0, 0, 1, 1,
0.8677726, -0.3752198, 2.925977, 1, 0, 0, 1, 1,
0.8691514, -0.5887198, 3.132653, 1, 0, 0, 1, 1,
0.8765518, 2.036611, 1.021035, 0, 0, 0, 1, 1,
0.882292, -0.01576175, 1.093024, 0, 0, 0, 1, 1,
0.882868, 0.7128378, 0.5491133, 0, 0, 0, 1, 1,
0.8978013, -0.4913937, 1.803972, 0, 0, 0, 1, 1,
0.8980355, -0.01473654, 1.498433, 0, 0, 0, 1, 1,
0.9074109, 0.1942517, 0.6143514, 0, 0, 0, 1, 1,
0.9153226, -1.996563, 3.501581, 0, 0, 0, 1, 1,
0.9240158, 0.0458695, 1.1798, 1, 1, 1, 1, 1,
0.9370982, 1.91469, 1.560147, 1, 1, 1, 1, 1,
0.9441589, 1.114451, -0.1744636, 1, 1, 1, 1, 1,
0.9441801, -2.3454, 2.926172, 1, 1, 1, 1, 1,
0.9453667, -1.443377, 1.493125, 1, 1, 1, 1, 1,
0.9473218, -1.802879, 3.937202, 1, 1, 1, 1, 1,
0.9482867, 0.9406139, 1.167346, 1, 1, 1, 1, 1,
0.9525313, 0.2021249, 1.111119, 1, 1, 1, 1, 1,
0.9543445, -1.174286, 1.438283, 1, 1, 1, 1, 1,
0.9559386, 2.155667, 0.08684496, 1, 1, 1, 1, 1,
0.956307, 1.61067, 1.090625, 1, 1, 1, 1, 1,
0.9591849, -1.214158, 2.184969, 1, 1, 1, 1, 1,
0.9608855, 0.07573491, 0.1675556, 1, 1, 1, 1, 1,
0.9610561, -0.5691142, 2.132122, 1, 1, 1, 1, 1,
0.9627825, 0.5803825, 1.472249, 1, 1, 1, 1, 1,
0.9710954, 1.550977, 1.387451, 0, 0, 1, 1, 1,
0.9722899, -0.7050735, 2.844926, 1, 0, 0, 1, 1,
0.9824572, 1.637291, 2.110562, 1, 0, 0, 1, 1,
0.9840896, -1.216408, 1.063763, 1, 0, 0, 1, 1,
0.9945126, 0.8359337, 0.256186, 1, 0, 0, 1, 1,
0.9953747, 0.9728672, 3.127997, 1, 0, 0, 1, 1,
1.006631, 0.3218398, 2.03366, 0, 0, 0, 1, 1,
1.007191, -1.788177, 4.165151, 0, 0, 0, 1, 1,
1.009229, 0.6273314, 0.1188548, 0, 0, 0, 1, 1,
1.01018, 0.4540376, 1.195434, 0, 0, 0, 1, 1,
1.011839, -1.857385, 0.4660773, 0, 0, 0, 1, 1,
1.012034, -0.1269949, 2.359515, 0, 0, 0, 1, 1,
1.01469, 1.331178, 2.393257, 0, 0, 0, 1, 1,
1.015487, -0.2614386, 2.012513, 1, 1, 1, 1, 1,
1.01565, -0.1554323, 1.819092, 1, 1, 1, 1, 1,
1.017982, -0.6612388, 1.743862, 1, 1, 1, 1, 1,
1.019359, 0.8968276, 1.300612, 1, 1, 1, 1, 1,
1.020446, 0.3904054, 0.7433835, 1, 1, 1, 1, 1,
1.02092, 0.9313293, 0.06074316, 1, 1, 1, 1, 1,
1.030675, -0.8894119, 1.904175, 1, 1, 1, 1, 1,
1.034329, 1.181608, 0.2006015, 1, 1, 1, 1, 1,
1.035926, 2.168116, 2.000404, 1, 1, 1, 1, 1,
1.036242, -1.538447, 1.945874, 1, 1, 1, 1, 1,
1.036829, 0.3046496, 1.309716, 1, 1, 1, 1, 1,
1.039376, -0.3966909, 2.905603, 1, 1, 1, 1, 1,
1.042502, -0.03408527, 1.085824, 1, 1, 1, 1, 1,
1.047238, -0.225111, -1.485798, 1, 1, 1, 1, 1,
1.058361, -0.7180126, 0.9241997, 1, 1, 1, 1, 1,
1.058967, -1.488104, 2.530075, 0, 0, 1, 1, 1,
1.061108, 0.2453465, 2.162141, 1, 0, 0, 1, 1,
1.063642, 0.5263722, 0.2073216, 1, 0, 0, 1, 1,
1.068934, -1.791913, 2.398262, 1, 0, 0, 1, 1,
1.074182, -1.018789, 2.259448, 1, 0, 0, 1, 1,
1.082144, 0.4961781, 0.645332, 1, 0, 0, 1, 1,
1.090273, -0.3863285, 3.173572, 0, 0, 0, 1, 1,
1.099009, -1.100057, 1.390345, 0, 0, 0, 1, 1,
1.12676, -1.076403, 2.383173, 0, 0, 0, 1, 1,
1.127248, 0.2729633, 2.303701, 0, 0, 0, 1, 1,
1.133635, -0.1322014, 2.293752, 0, 0, 0, 1, 1,
1.133921, -1.464164, 3.803332, 0, 0, 0, 1, 1,
1.136397, 0.9358749, 2.989949, 0, 0, 0, 1, 1,
1.141296, -0.006350895, 0.1736268, 1, 1, 1, 1, 1,
1.141949, 1.63127, 0.5093168, 1, 1, 1, 1, 1,
1.146634, -1.146537, 2.596931, 1, 1, 1, 1, 1,
1.150322, 1.126634, 1.544663, 1, 1, 1, 1, 1,
1.151936, 1.260473, -0.5508823, 1, 1, 1, 1, 1,
1.164252, -0.4799671, 1.305036, 1, 1, 1, 1, 1,
1.165868, 0.7940735, 3.943941, 1, 1, 1, 1, 1,
1.17458, -0.05076521, 2.303771, 1, 1, 1, 1, 1,
1.175715, 1.989213, 0.6158863, 1, 1, 1, 1, 1,
1.189127, 1.966287, 2.444975, 1, 1, 1, 1, 1,
1.192418, -1.099606, 2.140218, 1, 1, 1, 1, 1,
1.192947, -0.6734811, 1.533144, 1, 1, 1, 1, 1,
1.207327, -0.2298707, 0.2075605, 1, 1, 1, 1, 1,
1.221627, -1.667074, 1.198942, 1, 1, 1, 1, 1,
1.223443, 0.3695844, 1.864518, 1, 1, 1, 1, 1,
1.22791, -0.4930965, 1.507173, 0, 0, 1, 1, 1,
1.229399, -1.060082, 3.351191, 1, 0, 0, 1, 1,
1.233706, 0.4018773, 1.633699, 1, 0, 0, 1, 1,
1.23504, -0.3242415, 1.181946, 1, 0, 0, 1, 1,
1.238127, 0.1703173, 2.406235, 1, 0, 0, 1, 1,
1.240371, 0.1113593, 2.772274, 1, 0, 0, 1, 1,
1.256522, 0.6469316, -0.08574253, 0, 0, 0, 1, 1,
1.288974, -1.163382, 2.76752, 0, 0, 0, 1, 1,
1.298563, 0.2597249, -0.5644337, 0, 0, 0, 1, 1,
1.316136, 0.9818599, 2.311249, 0, 0, 0, 1, 1,
1.318544, 0.3247896, 1.643824, 0, 0, 0, 1, 1,
1.319824, -1.326698, 4.79358, 0, 0, 0, 1, 1,
1.335198, -0.456679, 1.72007, 0, 0, 0, 1, 1,
1.341359, 0.8516645, -0.2936699, 1, 1, 1, 1, 1,
1.341896, 0.779618, 2.130833, 1, 1, 1, 1, 1,
1.342121, 0.3730255, 1.79095, 1, 1, 1, 1, 1,
1.346487, 1.716046, -0.5442579, 1, 1, 1, 1, 1,
1.349979, 1.142846, 1.125006, 1, 1, 1, 1, 1,
1.357446, 0.3079756, 0.02593815, 1, 1, 1, 1, 1,
1.364041, 0.4058872, -0.9601218, 1, 1, 1, 1, 1,
1.377435, 0.4768549, 1.192338, 1, 1, 1, 1, 1,
1.384115, -0.1239496, 2.72161, 1, 1, 1, 1, 1,
1.414287, -0.748782, 0.6131906, 1, 1, 1, 1, 1,
1.419455, 2.11594, 1.385212, 1, 1, 1, 1, 1,
1.421711, 0.5661195, 0.2956978, 1, 1, 1, 1, 1,
1.444607, -0.4722237, 1.017391, 1, 1, 1, 1, 1,
1.45424, -1.162322, 4.571492, 1, 1, 1, 1, 1,
1.454367, 0.6452533, 2.205992, 1, 1, 1, 1, 1,
1.456291, -0.6762702, 1.77523, 0, 0, 1, 1, 1,
1.459288, 1.614661, 0.3689269, 1, 0, 0, 1, 1,
1.479429, -0.6068037, 2.245465, 1, 0, 0, 1, 1,
1.489635, -0.2178688, 0.3658254, 1, 0, 0, 1, 1,
1.494991, 0.3411867, 1.674022, 1, 0, 0, 1, 1,
1.505481, 0.4184729, 1.32775, 1, 0, 0, 1, 1,
1.518096, -0.1655589, 1.443229, 0, 0, 0, 1, 1,
1.523641, -1.018044, 1.388748, 0, 0, 0, 1, 1,
1.528344, -0.5214041, 4.36091, 0, 0, 0, 1, 1,
1.538375, -1.094317, 0.1567151, 0, 0, 0, 1, 1,
1.542482, 0.1880594, 1.323221, 0, 0, 0, 1, 1,
1.542745, -0.2902739, 2.906083, 0, 0, 0, 1, 1,
1.555173, 1.03733, 1.847839, 0, 0, 0, 1, 1,
1.563955, -0.8882653, 1.938607, 1, 1, 1, 1, 1,
1.580685, 1.159227, -0.2529707, 1, 1, 1, 1, 1,
1.587492, 0.6243388, 1.728998, 1, 1, 1, 1, 1,
1.58762, 0.3585115, 2.295104, 1, 1, 1, 1, 1,
1.595179, -0.2742303, 2.334259, 1, 1, 1, 1, 1,
1.614697, -0.1393858, 0.5291508, 1, 1, 1, 1, 1,
1.619082, 0.2079051, -0.03978482, 1, 1, 1, 1, 1,
1.632272, -0.2735009, 2.448887, 1, 1, 1, 1, 1,
1.634199, 0.1928996, 2.382961, 1, 1, 1, 1, 1,
1.652539, -0.2014814, 0.6997582, 1, 1, 1, 1, 1,
1.661945, -0.1807074, 1.385865, 1, 1, 1, 1, 1,
1.686524, 0.4146504, 2.392222, 1, 1, 1, 1, 1,
1.686857, -0.9213604, 3.955744, 1, 1, 1, 1, 1,
1.691408, -1.460443, 1.115541, 1, 1, 1, 1, 1,
1.691502, 0.1857962, 2.311355, 1, 1, 1, 1, 1,
1.692331, -0.3663147, 0.9493124, 0, 0, 1, 1, 1,
1.723615, -1.503088, 0.8995241, 1, 0, 0, 1, 1,
1.725224, 2.306344, -0.5787848, 1, 0, 0, 1, 1,
1.730594, 1.18012, 2.701559, 1, 0, 0, 1, 1,
1.735664, 0.4524154, 0.2055815, 1, 0, 0, 1, 1,
1.737214, -1.117446, 0.479735, 1, 0, 0, 1, 1,
1.738873, -1.147352, 2.182584, 0, 0, 0, 1, 1,
1.766293, 0.4430345, 0.523341, 0, 0, 0, 1, 1,
1.772227, 2.125411, 0.6823094, 0, 0, 0, 1, 1,
1.778751, 0.5819784, 3.184615, 0, 0, 0, 1, 1,
1.78978, 0.5038077, -0.1563849, 0, 0, 0, 1, 1,
1.798217, 1.778712, 0.9511867, 0, 0, 0, 1, 1,
1.818302, -0.9934119, 1.819783, 0, 0, 0, 1, 1,
1.845096, -0.2756045, 4.135369, 1, 1, 1, 1, 1,
1.85312, -1.32814, 1.637195, 1, 1, 1, 1, 1,
1.865663, 0.5898765, 0.418432, 1, 1, 1, 1, 1,
1.877678, -0.06729792, 2.46171, 1, 1, 1, 1, 1,
1.900573, -0.4188041, 0.2073488, 1, 1, 1, 1, 1,
1.911111, 0.1903426, 0.7326161, 1, 1, 1, 1, 1,
1.921554, -1.183805, 1.248464, 1, 1, 1, 1, 1,
1.921651, -0.920113, 4.185041, 1, 1, 1, 1, 1,
1.933429, -0.03974757, 1.757048, 1, 1, 1, 1, 1,
1.935354, 1.118048, 1.252197, 1, 1, 1, 1, 1,
1.960747, 1.863097, 0.380255, 1, 1, 1, 1, 1,
2.002575, -0.542336, -0.3803124, 1, 1, 1, 1, 1,
2.029272, -0.7013093, 1.279309, 1, 1, 1, 1, 1,
2.039506, -0.9021426, 2.165726, 1, 1, 1, 1, 1,
2.085142, 0.6699892, 0.7800462, 1, 1, 1, 1, 1,
2.091123, -0.3502877, 1.602614, 0, 0, 1, 1, 1,
2.092626, 0.9364172, 0.8759275, 1, 0, 0, 1, 1,
2.1032, 0.6825491, -0.5093712, 1, 0, 0, 1, 1,
2.153417, 1.559929, 0.733663, 1, 0, 0, 1, 1,
2.166823, -1.976866, 4.161462, 1, 0, 0, 1, 1,
2.171511, 1.731559, 0.1241299, 1, 0, 0, 1, 1,
2.208122, -0.5103109, 1.630492, 0, 0, 0, 1, 1,
2.23894, 1.434781, 0.4447922, 0, 0, 0, 1, 1,
2.24923, 0.3575532, 2.323434, 0, 0, 0, 1, 1,
2.260522, 1.117569, -0.4779959, 0, 0, 0, 1, 1,
2.261776, -0.1495718, 2.063861, 0, 0, 0, 1, 1,
2.4008, -0.8779408, 0.1076365, 0, 0, 0, 1, 1,
2.459226, -0.1465574, 0.5100353, 0, 0, 0, 1, 1,
2.524304, 0.6096398, 2.294669, 1, 1, 1, 1, 1,
2.584416, 1.205628, 0.7838275, 1, 1, 1, 1, 1,
2.61714, 0.2685077, 0.7899129, 1, 1, 1, 1, 1,
2.633872, 0.2443979, 1.865472, 1, 1, 1, 1, 1,
2.737109, -0.3076857, 2.113843, 1, 1, 1, 1, 1,
2.866052, -1.620008, 0.4247701, 1, 1, 1, 1, 1,
3.304726, 0.1346468, 1.044694, 1, 1, 1, 1, 1
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
var radius = 9.491072;
var distance = 33.33698;
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
mvMatrix.translate( 0.04425049, -0.05245829, 0.4542487 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.33698);
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
