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
-3.722506, -1.282502, -2.643348, 1, 0, 0, 1,
-2.623735, 0.4496195, -2.027456, 1, 0.007843138, 0, 1,
-2.532004, 1.017907, -2.07103, 1, 0.01176471, 0, 1,
-2.457191, 0.003590029, -1.533666, 1, 0.01960784, 0, 1,
-2.398081, -0.376085, -2.150909, 1, 0.02352941, 0, 1,
-2.380601, -1.367104, 0.4627047, 1, 0.03137255, 0, 1,
-2.188965, 1.311828, -0.7465732, 1, 0.03529412, 0, 1,
-2.185077, -1.300377, -1.932709, 1, 0.04313726, 0, 1,
-2.079162, 1.558345, -1.235067, 1, 0.04705882, 0, 1,
-2.023886, 0.08388653, -1.020544, 1, 0.05490196, 0, 1,
-2.021934, 1.262681, -0.8489954, 1, 0.05882353, 0, 1,
-1.97512, 0.4500525, -0.8512579, 1, 0.06666667, 0, 1,
-1.954733, 1.749212, -0.5002366, 1, 0.07058824, 0, 1,
-1.948718, 0.4041272, -2.669327, 1, 0.07843138, 0, 1,
-1.912106, -0.5852421, -2.225354, 1, 0.08235294, 0, 1,
-1.907075, 1.440741, 0.2210842, 1, 0.09019608, 0, 1,
-1.878317, -2.448687, -3.391, 1, 0.09411765, 0, 1,
-1.870255, 0.182742, 0.6343138, 1, 0.1019608, 0, 1,
-1.86047, 1.155702, 0.7644647, 1, 0.1098039, 0, 1,
-1.852647, -0.5693465, -1.988166, 1, 0.1137255, 0, 1,
-1.845049, 1.166583, -0.6289185, 1, 0.1215686, 0, 1,
-1.802027, -0.19152, -3.676342, 1, 0.1254902, 0, 1,
-1.799933, -1.380931, -3.103758, 1, 0.1333333, 0, 1,
-1.782839, -1.567154, -3.660702, 1, 0.1372549, 0, 1,
-1.782135, -1.623288, -1.312978, 1, 0.145098, 0, 1,
-1.781381, 0.3102486, -1.643954, 1, 0.1490196, 0, 1,
-1.768267, -2.602748, -3.18743, 1, 0.1568628, 0, 1,
-1.758563, -0.5918198, -0.9389589, 1, 0.1607843, 0, 1,
-1.754943, 1.12076, 0.03162196, 1, 0.1686275, 0, 1,
-1.747159, -0.8105626, -4.708207, 1, 0.172549, 0, 1,
-1.73371, -0.824378, -1.890789, 1, 0.1803922, 0, 1,
-1.733694, -0.279581, -1.763226, 1, 0.1843137, 0, 1,
-1.732927, -0.701309, -1.74111, 1, 0.1921569, 0, 1,
-1.709391, 0.6147143, -1.729629, 1, 0.1960784, 0, 1,
-1.685268, 0.01891987, -1.414039, 1, 0.2039216, 0, 1,
-1.682605, 0.1098007, -1.547401, 1, 0.2117647, 0, 1,
-1.660849, 0.7707194, -1.649336, 1, 0.2156863, 0, 1,
-1.64076, -0.7474709, -1.856924, 1, 0.2235294, 0, 1,
-1.630793, -0.2536687, 0.1161972, 1, 0.227451, 0, 1,
-1.617597, -1.251496, -2.67843, 1, 0.2352941, 0, 1,
-1.612798, 0.4106205, -1.182364, 1, 0.2392157, 0, 1,
-1.606591, -1.231122, -3.959956, 1, 0.2470588, 0, 1,
-1.604486, -0.02290722, -2.174714, 1, 0.2509804, 0, 1,
-1.58742, 0.7023688, 0.24809, 1, 0.2588235, 0, 1,
-1.577225, 0.777975, -0.531959, 1, 0.2627451, 0, 1,
-1.570277, 1.554122, -0.5102133, 1, 0.2705882, 0, 1,
-1.537332, 0.7608014, -0.07907231, 1, 0.2745098, 0, 1,
-1.529338, -1.202895, -1.443169, 1, 0.282353, 0, 1,
-1.509917, -0.1671088, -0.9769399, 1, 0.2862745, 0, 1,
-1.503566, 0.7388623, -2.152358, 1, 0.2941177, 0, 1,
-1.502074, -1.417806, -2.763686, 1, 0.3019608, 0, 1,
-1.49609, 0.1146113, -0.7437884, 1, 0.3058824, 0, 1,
-1.492806, -1.450914, -2.02608, 1, 0.3137255, 0, 1,
-1.487545, 0.7399821, 0.2174691, 1, 0.3176471, 0, 1,
-1.482583, -0.2204918, -1.606365, 1, 0.3254902, 0, 1,
-1.47637, -0.7066604, -3.169616, 1, 0.3294118, 0, 1,
-1.475666, -0.1979749, -2.689454, 1, 0.3372549, 0, 1,
-1.471841, 0.09203535, -0.4066085, 1, 0.3411765, 0, 1,
-1.460256, -1.086201, -2.357826, 1, 0.3490196, 0, 1,
-1.456555, -1.141569, -1.311541, 1, 0.3529412, 0, 1,
-1.454532, 0.2823667, 0.2402156, 1, 0.3607843, 0, 1,
-1.446001, 0.3557581, 0.3536682, 1, 0.3647059, 0, 1,
-1.445743, -0.6387381, -1.512056, 1, 0.372549, 0, 1,
-1.43111, 0.9240265, -1.353736, 1, 0.3764706, 0, 1,
-1.42325, -0.9660763, 0.1546525, 1, 0.3843137, 0, 1,
-1.412659, 0.1698442, -1.065432, 1, 0.3882353, 0, 1,
-1.410419, 1.175546, -1.82631, 1, 0.3960784, 0, 1,
-1.408027, 1.726241, -1.174027, 1, 0.4039216, 0, 1,
-1.407261, -0.582863, -1.585809, 1, 0.4078431, 0, 1,
-1.388426, -1.236159, -2.311147, 1, 0.4156863, 0, 1,
-1.385345, -0.4855416, -1.395023, 1, 0.4196078, 0, 1,
-1.382921, 1.886506, -1.285478, 1, 0.427451, 0, 1,
-1.379583, 1.151099, -3.451799, 1, 0.4313726, 0, 1,
-1.370714, -0.5171491, -0.5816776, 1, 0.4392157, 0, 1,
-1.368824, -0.9296891, -3.251693, 1, 0.4431373, 0, 1,
-1.360596, -0.8538462, -1.418929, 1, 0.4509804, 0, 1,
-1.357237, -2.495527, -1.545675, 1, 0.454902, 0, 1,
-1.355896, 0.5735989, -2.062663, 1, 0.4627451, 0, 1,
-1.352169, -2.072127, -2.396165, 1, 0.4666667, 0, 1,
-1.347424, 0.3292241, -1.113083, 1, 0.4745098, 0, 1,
-1.328227, -1.146364, -2.441294, 1, 0.4784314, 0, 1,
-1.328129, 1.477541, -0.4915454, 1, 0.4862745, 0, 1,
-1.313605, 0.6725239, -0.05488221, 1, 0.4901961, 0, 1,
-1.313277, 0.03233269, -1.194547, 1, 0.4980392, 0, 1,
-1.310139, 0.9820153, 0.5262158, 1, 0.5058824, 0, 1,
-1.300728, 0.8531849, 0.5803439, 1, 0.509804, 0, 1,
-1.283485, -0.3615146, -2.446026, 1, 0.5176471, 0, 1,
-1.279937, -1.252848, -2.253138, 1, 0.5215687, 0, 1,
-1.278502, 0.1526, 0.02351267, 1, 0.5294118, 0, 1,
-1.278062, 0.945533, -0.9865857, 1, 0.5333334, 0, 1,
-1.277922, -1.162615, -2.772984, 1, 0.5411765, 0, 1,
-1.275023, 0.3268466, -3.401037, 1, 0.5450981, 0, 1,
-1.272632, -0.1316555, -2.677548, 1, 0.5529412, 0, 1,
-1.269677, -1.336723, -1.753591, 1, 0.5568628, 0, 1,
-1.265932, -0.1171143, -0.357469, 1, 0.5647059, 0, 1,
-1.263879, -0.7841486, -1.668787, 1, 0.5686275, 0, 1,
-1.256347, 0.9050766, 0.3555069, 1, 0.5764706, 0, 1,
-1.254933, -0.2094233, -3.803218, 1, 0.5803922, 0, 1,
-1.252973, 0.7142996, 0.5101801, 1, 0.5882353, 0, 1,
-1.250979, 0.527209, 0.7418107, 1, 0.5921569, 0, 1,
-1.239287, -0.6236909, -2.76536, 1, 0.6, 0, 1,
-1.236031, 0.4039815, -2.369215, 1, 0.6078432, 0, 1,
-1.234288, -0.4925299, -1.589089, 1, 0.6117647, 0, 1,
-1.227153, -0.179032, -1.642269, 1, 0.6196079, 0, 1,
-1.226044, -0.03791922, -0.4226649, 1, 0.6235294, 0, 1,
-1.215216, -0.08632351, -0.7137979, 1, 0.6313726, 0, 1,
-1.207729, -0.6610306, -1.487777, 1, 0.6352941, 0, 1,
-1.200529, 0.1814998, -1.961712, 1, 0.6431373, 0, 1,
-1.198469, -1.158812, -1.64987, 1, 0.6470588, 0, 1,
-1.19521, -1.029077, -3.289899, 1, 0.654902, 0, 1,
-1.182592, 0.3475459, -1.4177, 1, 0.6588235, 0, 1,
-1.182311, -0.1834087, -3.366255, 1, 0.6666667, 0, 1,
-1.1764, -2.320777, -2.950045, 1, 0.6705883, 0, 1,
-1.165377, 0.6519579, -0.6629859, 1, 0.6784314, 0, 1,
-1.159072, 0.7691637, -2.323297, 1, 0.682353, 0, 1,
-1.158569, -0.02542462, -1.446851, 1, 0.6901961, 0, 1,
-1.151579, 1.411181, -2.065509, 1, 0.6941177, 0, 1,
-1.139056, 0.1797498, -0.8745062, 1, 0.7019608, 0, 1,
-1.138146, 1.294738, -1.913901, 1, 0.7098039, 0, 1,
-1.133964, -0.1145973, 0.2810709, 1, 0.7137255, 0, 1,
-1.117808, -0.4738346, -1.690687, 1, 0.7215686, 0, 1,
-1.115387, -0.5906078, -2.811356, 1, 0.7254902, 0, 1,
-1.114876, -0.5124616, -1.982057, 1, 0.7333333, 0, 1,
-1.114001, 1.380889, 1.233669, 1, 0.7372549, 0, 1,
-1.113458, -0.8769469, -2.174633, 1, 0.7450981, 0, 1,
-1.100119, -0.395478, -0.2057181, 1, 0.7490196, 0, 1,
-1.092926, 0.9756566, -0.3070965, 1, 0.7568628, 0, 1,
-1.090086, -0.07366215, -2.834466, 1, 0.7607843, 0, 1,
-1.088197, 0.4918978, -0.6800849, 1, 0.7686275, 0, 1,
-1.087762, 1.190978, -1.362121, 1, 0.772549, 0, 1,
-1.080639, 0.3229001, -2.497598, 1, 0.7803922, 0, 1,
-1.079496, 0.3284829, -0.9156445, 1, 0.7843137, 0, 1,
-1.078242, -1.005353, -2.048587, 1, 0.7921569, 0, 1,
-1.075758, -2.228059, -2.399461, 1, 0.7960784, 0, 1,
-1.074935, 1.515049, 0.4970094, 1, 0.8039216, 0, 1,
-1.067885, -1.671268, -4.226638, 1, 0.8117647, 0, 1,
-1.057965, 1.546241, -2.424625, 1, 0.8156863, 0, 1,
-1.045968, -0.7684215, -1.519451, 1, 0.8235294, 0, 1,
-1.04561, -0.02157807, -3.139129, 1, 0.827451, 0, 1,
-1.044773, -0.1607033, -0.1517623, 1, 0.8352941, 0, 1,
-1.042388, 0.3457626, -0.4815426, 1, 0.8392157, 0, 1,
-1.033724, 0.6258514, -3.60841, 1, 0.8470588, 0, 1,
-1.031606, 0.4406308, -1.625456, 1, 0.8509804, 0, 1,
-1.028909, 0.9349493, -0.6773862, 1, 0.8588235, 0, 1,
-1.016749, 0.4517546, -0.2403923, 1, 0.8627451, 0, 1,
-1.014147, 1.048171, -0.1960987, 1, 0.8705882, 0, 1,
-0.997269, 0.150377, -0.6476772, 1, 0.8745098, 0, 1,
-0.9960803, 0.3482275, -0.2559094, 1, 0.8823529, 0, 1,
-0.9923778, 1.327536, -0.577524, 1, 0.8862745, 0, 1,
-0.9922948, 1.20418, -0.1931492, 1, 0.8941177, 0, 1,
-0.9900582, -1.197966, -0.4529108, 1, 0.8980392, 0, 1,
-0.9894307, 0.02424852, -2.706272, 1, 0.9058824, 0, 1,
-0.9863076, -0.4917243, -2.961804, 1, 0.9137255, 0, 1,
-0.9847212, -0.05976833, -0.8839149, 1, 0.9176471, 0, 1,
-0.9840496, 0.1506669, -1.418319, 1, 0.9254902, 0, 1,
-0.9800369, 0.9664074, -0.4221861, 1, 0.9294118, 0, 1,
-0.9789538, 0.4035702, 0.6726225, 1, 0.9372549, 0, 1,
-0.978352, 0.3832454, -1.757621, 1, 0.9411765, 0, 1,
-0.9662098, 0.6654617, -2.195365, 1, 0.9490196, 0, 1,
-0.9652577, 0.4203168, -1.491733, 1, 0.9529412, 0, 1,
-0.9650241, -0.6398507, -3.301384, 1, 0.9607843, 0, 1,
-0.9648162, 0.2053133, -1.043182, 1, 0.9647059, 0, 1,
-0.9644812, -0.1604459, -1.364075, 1, 0.972549, 0, 1,
-0.9611104, -0.3039242, -3.858942, 1, 0.9764706, 0, 1,
-0.9520738, -0.2830002, -2.619029, 1, 0.9843137, 0, 1,
-0.9501995, -0.7481342, -2.045877, 1, 0.9882353, 0, 1,
-0.948168, -0.3595415, -4.600947, 1, 0.9960784, 0, 1,
-0.941308, 0.1657404, -1.358852, 0.9960784, 1, 0, 1,
-0.9362119, 0.1842515, -1.07151, 0.9921569, 1, 0, 1,
-0.9355643, -1.013483, -2.203884, 0.9843137, 1, 0, 1,
-0.9271124, -0.3828374, -2.12788, 0.9803922, 1, 0, 1,
-0.9252084, -0.8683237, -1.766575, 0.972549, 1, 0, 1,
-0.9237723, 0.3335814, -1.462085, 0.9686275, 1, 0, 1,
-0.9203271, -0.5955616, -2.421913, 0.9607843, 1, 0, 1,
-0.9171057, -0.6849889, -1.841209, 0.9568627, 1, 0, 1,
-0.914641, 1.293139, 0.617849, 0.9490196, 1, 0, 1,
-0.9085996, -0.8402983, -2.606513, 0.945098, 1, 0, 1,
-0.9067223, 1.397746, -0.7836897, 0.9372549, 1, 0, 1,
-0.8980692, 2.131205, 0.4513319, 0.9333333, 1, 0, 1,
-0.8808626, -0.04413684, -0.461828, 0.9254902, 1, 0, 1,
-0.8808041, -0.5785942, -2.144228, 0.9215686, 1, 0, 1,
-0.8800302, 0.1006744, -1.10735, 0.9137255, 1, 0, 1,
-0.8774121, -1.262093, -2.623192, 0.9098039, 1, 0, 1,
-0.8746899, 0.6029294, -0.6853449, 0.9019608, 1, 0, 1,
-0.8719736, 0.4402646, -1.470133, 0.8941177, 1, 0, 1,
-0.8708186, -1.023983, -2.751493, 0.8901961, 1, 0, 1,
-0.8698718, 0.2894243, -0.001828404, 0.8823529, 1, 0, 1,
-0.8688754, -1.367928, -2.920573, 0.8784314, 1, 0, 1,
-0.8651692, 0.8497561, -0.7841178, 0.8705882, 1, 0, 1,
-0.8576514, -0.8537818, -2.080991, 0.8666667, 1, 0, 1,
-0.8543656, 1.081709, -0.9974121, 0.8588235, 1, 0, 1,
-0.8521295, 1.385079, -0.3345579, 0.854902, 1, 0, 1,
-0.8452441, 1.531584, 0.03618892, 0.8470588, 1, 0, 1,
-0.8366775, 0.8598111, 0.005183199, 0.8431373, 1, 0, 1,
-0.8339837, -1.144327, -2.257829, 0.8352941, 1, 0, 1,
-0.8333442, 0.4745807, -1.277261, 0.8313726, 1, 0, 1,
-0.8321624, 1.225779, -0.8832803, 0.8235294, 1, 0, 1,
-0.8318307, 1.303885, 0.169536, 0.8196079, 1, 0, 1,
-0.8263542, -0.417896, -1.940113, 0.8117647, 1, 0, 1,
-0.8261758, 0.5209285, -0.3909917, 0.8078431, 1, 0, 1,
-0.8259267, -0.5607922, -2.974504, 0.8, 1, 0, 1,
-0.8217943, -1.806643, -0.2892831, 0.7921569, 1, 0, 1,
-0.8208716, -0.7979376, -2.192102, 0.7882353, 1, 0, 1,
-0.820358, -0.5682824, -3.014613, 0.7803922, 1, 0, 1,
-0.8141867, 1.716728, -1.371514, 0.7764706, 1, 0, 1,
-0.812038, -0.1469059, -0.5579676, 0.7686275, 1, 0, 1,
-0.8045919, 0.540673, 0.131886, 0.7647059, 1, 0, 1,
-0.7970681, -1.559637, -2.793512, 0.7568628, 1, 0, 1,
-0.7961954, -0.6666932, -1.436523, 0.7529412, 1, 0, 1,
-0.7902789, 1.255212, 0.08370467, 0.7450981, 1, 0, 1,
-0.7866072, 2.846456, -1.086172, 0.7411765, 1, 0, 1,
-0.7844324, -0.2835011, -2.660247, 0.7333333, 1, 0, 1,
-0.7840954, -0.2146344, -0.9609568, 0.7294118, 1, 0, 1,
-0.7824459, -0.1702162, -2.538146, 0.7215686, 1, 0, 1,
-0.7770317, -0.9991555, -2.261938, 0.7176471, 1, 0, 1,
-0.776437, -0.1702678, -0.9785383, 0.7098039, 1, 0, 1,
-0.7723137, 1.257255, 0.06627514, 0.7058824, 1, 0, 1,
-0.7606803, -0.6121506, -2.79978, 0.6980392, 1, 0, 1,
-0.7606003, 0.6531127, -0.1670839, 0.6901961, 1, 0, 1,
-0.7591698, -1.17265, -0.3517084, 0.6862745, 1, 0, 1,
-0.7566335, 1.490528, 0.03815991, 0.6784314, 1, 0, 1,
-0.7560076, 0.174797, -3.13427, 0.6745098, 1, 0, 1,
-0.7549257, 0.4902477, -0.8084458, 0.6666667, 1, 0, 1,
-0.7483575, 0.1588497, 0.8331344, 0.6627451, 1, 0, 1,
-0.7481828, 0.7137139, 0.1906176, 0.654902, 1, 0, 1,
-0.7470739, -0.7941402, -2.500052, 0.6509804, 1, 0, 1,
-0.7430744, -0.1759853, -2.22479, 0.6431373, 1, 0, 1,
-0.7390175, 0.3220184, -2.179054, 0.6392157, 1, 0, 1,
-0.7380542, 0.3914009, 0.2730227, 0.6313726, 1, 0, 1,
-0.7376314, 0.6480144, -2.078111, 0.627451, 1, 0, 1,
-0.7313303, 1.138347, -1.546211, 0.6196079, 1, 0, 1,
-0.7301593, -0.3730913, -2.785034, 0.6156863, 1, 0, 1,
-0.7296115, 0.9511876, -0.8898771, 0.6078432, 1, 0, 1,
-0.7269581, 0.6176991, -2.20492, 0.6039216, 1, 0, 1,
-0.7254131, 1.953754, -1.208438, 0.5960785, 1, 0, 1,
-0.7221909, -0.3901492, -3.523383, 0.5882353, 1, 0, 1,
-0.718895, -0.9093721, -3.60986, 0.5843138, 1, 0, 1,
-0.7186783, 0.8390877, -0.6207405, 0.5764706, 1, 0, 1,
-0.717911, -0.9766785, -2.570107, 0.572549, 1, 0, 1,
-0.7154918, 0.09943072, -2.207738, 0.5647059, 1, 0, 1,
-0.7143744, 0.4179438, 0.8566154, 0.5607843, 1, 0, 1,
-0.7124218, 0.1341039, -2.006764, 0.5529412, 1, 0, 1,
-0.7066441, 1.249461, 0.5490046, 0.5490196, 1, 0, 1,
-0.704088, -0.3869767, -0.0868483, 0.5411765, 1, 0, 1,
-0.7014903, 0.4302595, -0.3594056, 0.5372549, 1, 0, 1,
-0.6896585, 0.3887709, -1.264047, 0.5294118, 1, 0, 1,
-0.686775, -0.6773285, -2.725032, 0.5254902, 1, 0, 1,
-0.6866496, -0.3489142, -2.63332, 0.5176471, 1, 0, 1,
-0.6861417, -1.69696, -6.132728, 0.5137255, 1, 0, 1,
-0.6816208, -0.7519596, -2.067389, 0.5058824, 1, 0, 1,
-0.677722, -0.9945111, -2.177164, 0.5019608, 1, 0, 1,
-0.6750913, -0.2681106, -3.544078, 0.4941176, 1, 0, 1,
-0.6722397, -1.190416, -3.375947, 0.4862745, 1, 0, 1,
-0.6672965, -1.009534, -3.524813, 0.4823529, 1, 0, 1,
-0.6656113, 0.1448619, -2.125511, 0.4745098, 1, 0, 1,
-0.6580685, 1.577824, -1.008512, 0.4705882, 1, 0, 1,
-0.6567325, -0.6543835, -3.507244, 0.4627451, 1, 0, 1,
-0.6516726, -1.05463, -0.8502888, 0.4588235, 1, 0, 1,
-0.6478274, 0.9140106, -2.343989, 0.4509804, 1, 0, 1,
-0.6468135, 0.4356104, -1.663617, 0.4470588, 1, 0, 1,
-0.6449469, -1.838865, -2.546697, 0.4392157, 1, 0, 1,
-0.6400201, 0.3421678, -0.5624844, 0.4352941, 1, 0, 1,
-0.6395676, 0.01492194, 0.7069983, 0.427451, 1, 0, 1,
-0.6381829, -0.1290342, -0.6580923, 0.4235294, 1, 0, 1,
-0.6296456, 0.4883611, -0.847047, 0.4156863, 1, 0, 1,
-0.6251606, 0.4309493, -1.41311, 0.4117647, 1, 0, 1,
-0.6208437, 2.043157, 0.3472382, 0.4039216, 1, 0, 1,
-0.6182518, -1.638423, -3.042817, 0.3960784, 1, 0, 1,
-0.6171637, 0.2603824, -1.371487, 0.3921569, 1, 0, 1,
-0.6167893, -0.3405182, -1.687288, 0.3843137, 1, 0, 1,
-0.6147782, -1.358019, -2.839418, 0.3803922, 1, 0, 1,
-0.6094519, -1.113188, -3.972252, 0.372549, 1, 0, 1,
-0.6080247, 0.3726175, -0.5452513, 0.3686275, 1, 0, 1,
-0.6028204, 0.8196318, -2.401921, 0.3607843, 1, 0, 1,
-0.6000242, 0.3150393, 0.5118355, 0.3568628, 1, 0, 1,
-0.5997465, 0.5090887, -2.025907, 0.3490196, 1, 0, 1,
-0.5997382, 1.173631, -0.7865573, 0.345098, 1, 0, 1,
-0.5995747, -0.9895381, -2.216978, 0.3372549, 1, 0, 1,
-0.5991763, 0.4132106, -0.6218505, 0.3333333, 1, 0, 1,
-0.5965004, -0.141074, -1.108577, 0.3254902, 1, 0, 1,
-0.5933753, 1.221512, -1.027503, 0.3215686, 1, 0, 1,
-0.5909119, -0.9458179, -3.080249, 0.3137255, 1, 0, 1,
-0.5851835, 0.5509734, -1.207664, 0.3098039, 1, 0, 1,
-0.5831341, -0.3448186, -4.49763, 0.3019608, 1, 0, 1,
-0.5829808, 0.758238, -1.261821, 0.2941177, 1, 0, 1,
-0.5809427, 2.026738, 0.6385254, 0.2901961, 1, 0, 1,
-0.5798523, -0.3674609, -2.071882, 0.282353, 1, 0, 1,
-0.5709846, 1.317402, 0.7978611, 0.2784314, 1, 0, 1,
-0.5681115, -0.8776013, -1.781259, 0.2705882, 1, 0, 1,
-0.5665018, -1.094852, -1.671438, 0.2666667, 1, 0, 1,
-0.562888, -0.5155462, -3.256081, 0.2588235, 1, 0, 1,
-0.5527545, 1.093776, -0.7973824, 0.254902, 1, 0, 1,
-0.5493197, -0.03861979, -2.123671, 0.2470588, 1, 0, 1,
-0.5473304, -1.454589, -2.633979, 0.2431373, 1, 0, 1,
-0.5466828, 0.04274968, -0.3950244, 0.2352941, 1, 0, 1,
-0.5453414, 0.2926143, -1.694935, 0.2313726, 1, 0, 1,
-0.541879, -1.877771, -4.206644, 0.2235294, 1, 0, 1,
-0.5406668, -1.00672, -1.161254, 0.2196078, 1, 0, 1,
-0.5375907, -0.5274942, -2.292969, 0.2117647, 1, 0, 1,
-0.5289772, 0.7797917, -1.01374, 0.2078431, 1, 0, 1,
-0.5213072, 0.3409095, -2.627094, 0.2, 1, 0, 1,
-0.5212926, 1.214943, 0.2898585, 0.1921569, 1, 0, 1,
-0.520622, 0.0007637437, -1.867044, 0.1882353, 1, 0, 1,
-0.5160143, -0.5979579, -1.715461, 0.1803922, 1, 0, 1,
-0.5132129, -0.4362936, -2.537475, 0.1764706, 1, 0, 1,
-0.5125942, -0.7706516, -2.396896, 0.1686275, 1, 0, 1,
-0.5119618, 0.4919172, -0.7603546, 0.1647059, 1, 0, 1,
-0.5109637, 0.7874693, 0.785534, 0.1568628, 1, 0, 1,
-0.5093859, 0.5864002, -0.821471, 0.1529412, 1, 0, 1,
-0.5091353, -0.7173204, -3.26219, 0.145098, 1, 0, 1,
-0.5079263, 0.2141692, -0.3370414, 0.1411765, 1, 0, 1,
-0.5059186, -0.03407457, -2.454179, 0.1333333, 1, 0, 1,
-0.5018835, 0.921476, -1.067706, 0.1294118, 1, 0, 1,
-0.4952409, -2.105642, -2.801125, 0.1215686, 1, 0, 1,
-0.4939171, -0.9684306, -2.200493, 0.1176471, 1, 0, 1,
-0.4927666, 0.1870489, -1.658062, 0.1098039, 1, 0, 1,
-0.4914248, -0.6927074, -1.965155, 0.1058824, 1, 0, 1,
-0.490121, -1.214792, -3.002626, 0.09803922, 1, 0, 1,
-0.4894876, 0.0733084, -0.6504214, 0.09019608, 1, 0, 1,
-0.4868555, 0.2526472, -2.013747, 0.08627451, 1, 0, 1,
-0.486289, 0.9443005, -0.250774, 0.07843138, 1, 0, 1,
-0.4862044, 0.6729853, 0.2489164, 0.07450981, 1, 0, 1,
-0.4840081, -0.5918375, -3.603344, 0.06666667, 1, 0, 1,
-0.4801611, -0.8190672, -2.957529, 0.0627451, 1, 0, 1,
-0.4792039, 0.2147102, 0.6535305, 0.05490196, 1, 0, 1,
-0.4710721, 0.4255007, -2.284186, 0.05098039, 1, 0, 1,
-0.4682781, 0.7738172, -2.233398, 0.04313726, 1, 0, 1,
-0.4669722, -0.1979237, -3.454497, 0.03921569, 1, 0, 1,
-0.46372, -2.690894, -1.277694, 0.03137255, 1, 0, 1,
-0.4542922, 0.4684863, -3.186849, 0.02745098, 1, 0, 1,
-0.4506575, 0.3495592, -1.686222, 0.01960784, 1, 0, 1,
-0.450582, -0.2484837, -2.585048, 0.01568628, 1, 0, 1,
-0.4487503, 0.5689654, -2.643655, 0.007843138, 1, 0, 1,
-0.445636, 0.7140826, -1.931124, 0.003921569, 1, 0, 1,
-0.4396364, -1.034922, -2.809283, 0, 1, 0.003921569, 1,
-0.4339152, 0.9905759, 0.4787037, 0, 1, 0.01176471, 1,
-0.4306494, 0.1491783, -0.4044442, 0, 1, 0.01568628, 1,
-0.4269131, 0.0270884, -3.144484, 0, 1, 0.02352941, 1,
-0.4250188, -1.059003, -3.730802, 0, 1, 0.02745098, 1,
-0.4246231, -0.6620858, -4.112656, 0, 1, 0.03529412, 1,
-0.4240719, -0.8722422, -2.214308, 0, 1, 0.03921569, 1,
-0.423464, 1.479277, -0.184238, 0, 1, 0.04705882, 1,
-0.418578, -0.525118, -1.514533, 0, 1, 0.05098039, 1,
-0.4184497, 2.500705, -1.026364, 0, 1, 0.05882353, 1,
-0.4122894, -1.463853, -3.589316, 0, 1, 0.0627451, 1,
-0.4117948, -0.03013763, -0.3258197, 0, 1, 0.07058824, 1,
-0.4117026, -0.2705203, -1.211484, 0, 1, 0.07450981, 1,
-0.4026992, -1.025872, -3.584726, 0, 1, 0.08235294, 1,
-0.3982768, -0.3653592, -1.941578, 0, 1, 0.08627451, 1,
-0.3957773, -2.084013, -3.675834, 0, 1, 0.09411765, 1,
-0.3955968, 0.3708124, -1.163397, 0, 1, 0.1019608, 1,
-0.3924742, -0.4090368, -1.809465, 0, 1, 0.1058824, 1,
-0.389289, -0.6804547, -2.89866, 0, 1, 0.1137255, 1,
-0.3852679, -1.768293, -2.587686, 0, 1, 0.1176471, 1,
-0.3839519, 0.8499662, -2.375004, 0, 1, 0.1254902, 1,
-0.3836199, 0.205168, -0.3699913, 0, 1, 0.1294118, 1,
-0.3810564, 0.2594629, -0.7730635, 0, 1, 0.1372549, 1,
-0.3792859, 1.247701, 1.027324, 0, 1, 0.1411765, 1,
-0.376914, 0.1241542, -0.1333434, 0, 1, 0.1490196, 1,
-0.3768223, -1.283435, -3.001992, 0, 1, 0.1529412, 1,
-0.3752098, -0.1062017, -1.387698, 0, 1, 0.1607843, 1,
-0.3748983, 0.7167274, -0.4058601, 0, 1, 0.1647059, 1,
-0.3711099, 1.054829, -0.5456215, 0, 1, 0.172549, 1,
-0.3694516, -1.608343, -2.566348, 0, 1, 0.1764706, 1,
-0.3650143, 1.854341, -0.2816889, 0, 1, 0.1843137, 1,
-0.3618259, 0.8838744, -0.9854524, 0, 1, 0.1882353, 1,
-0.361717, 0.6436609, -2.530983, 0, 1, 0.1960784, 1,
-0.3596103, 0.07411496, -1.585739, 0, 1, 0.2039216, 1,
-0.3562514, 0.1135684, -1.326724, 0, 1, 0.2078431, 1,
-0.3544723, 0.2678978, 0.04670794, 0, 1, 0.2156863, 1,
-0.3536076, 1.371177, 0.6134295, 0, 1, 0.2196078, 1,
-0.3534214, 0.2300595, -1.117197, 0, 1, 0.227451, 1,
-0.3531984, -1.029738, -1.79568, 0, 1, 0.2313726, 1,
-0.3509443, 0.6125252, 0.1478833, 0, 1, 0.2392157, 1,
-0.3499907, -0.3024352, 0.1619789, 0, 1, 0.2431373, 1,
-0.3448078, -0.7237737, -1.352912, 0, 1, 0.2509804, 1,
-0.3426017, -0.9619647, -1.204212, 0, 1, 0.254902, 1,
-0.3411805, -0.4817165, -1.910387, 0, 1, 0.2627451, 1,
-0.337851, -1.534018, -3.213157, 0, 1, 0.2666667, 1,
-0.3370507, -1.723183, -2.003346, 0, 1, 0.2745098, 1,
-0.3358078, 0.1199314, -2.30235, 0, 1, 0.2784314, 1,
-0.3350877, -1.462899, -1.036393, 0, 1, 0.2862745, 1,
-0.3335308, 0.8580249, 0.1632395, 0, 1, 0.2901961, 1,
-0.3315641, 1.107081, 0.2537133, 0, 1, 0.2980392, 1,
-0.3291243, 0.8213592, -1.235632, 0, 1, 0.3058824, 1,
-0.3271457, 0.2193649, -0.2901088, 0, 1, 0.3098039, 1,
-0.3256014, -0.3744871, -1.97952, 0, 1, 0.3176471, 1,
-0.3224187, 1.176321, -0.9934665, 0, 1, 0.3215686, 1,
-0.3214946, 1.574257, 0.9673234, 0, 1, 0.3294118, 1,
-0.3209628, 0.1050693, -1.146199, 0, 1, 0.3333333, 1,
-0.3078727, 1.357706, -0.2608411, 0, 1, 0.3411765, 1,
-0.3074318, 0.03609794, 0.01970583, 0, 1, 0.345098, 1,
-0.3040917, 0.4298775, -1.906483, 0, 1, 0.3529412, 1,
-0.2985628, -2.294447, -2.624703, 0, 1, 0.3568628, 1,
-0.2961577, -0.967779, -3.691546, 0, 1, 0.3647059, 1,
-0.293624, -1.197563, -3.773817, 0, 1, 0.3686275, 1,
-0.2924913, -0.7694695, -1.653611, 0, 1, 0.3764706, 1,
-0.2915363, 0.1646118, -0.3778267, 0, 1, 0.3803922, 1,
-0.29109, -1.38823, -2.59256, 0, 1, 0.3882353, 1,
-0.2875833, -2.109527, -1.606342, 0, 1, 0.3921569, 1,
-0.2860838, 0.7614781, -0.4478502, 0, 1, 0.4, 1,
-0.2858141, 0.6400551, 0.09561859, 0, 1, 0.4078431, 1,
-0.282208, 0.4819041, -0.04037395, 0, 1, 0.4117647, 1,
-0.2790601, 0.5609279, 1.856908, 0, 1, 0.4196078, 1,
-0.2785581, -1.584057, -3.219367, 0, 1, 0.4235294, 1,
-0.2764696, -1.162239, -2.973294, 0, 1, 0.4313726, 1,
-0.2756335, -0.4012845, -2.249619, 0, 1, 0.4352941, 1,
-0.2750222, 0.2544679, 0.9618753, 0, 1, 0.4431373, 1,
-0.2725815, -0.7684173, -2.786721, 0, 1, 0.4470588, 1,
-0.2724641, 1.070442, 1.182861, 0, 1, 0.454902, 1,
-0.2718113, 1.148662, 0.3388832, 0, 1, 0.4588235, 1,
-0.2693577, 1.355303, -0.8677027, 0, 1, 0.4666667, 1,
-0.2691879, 0.5037002, -0.5077021, 0, 1, 0.4705882, 1,
-0.2685622, -0.9466015, -1.48767, 0, 1, 0.4784314, 1,
-0.2661489, -0.4123595, -3.815222, 0, 1, 0.4823529, 1,
-0.2645292, 0.9765955, 2.000755, 0, 1, 0.4901961, 1,
-0.2575476, -1.203827, -0.1788707, 0, 1, 0.4941176, 1,
-0.2572276, -1.563235, -3.427934, 0, 1, 0.5019608, 1,
-0.2570968, 0.1341557, 0.3375426, 0, 1, 0.509804, 1,
-0.251191, -1.225343, -2.754157, 0, 1, 0.5137255, 1,
-0.2494235, -0.203144, -0.8640103, 0, 1, 0.5215687, 1,
-0.2491756, 0.8586415, 0.01755913, 0, 1, 0.5254902, 1,
-0.2476919, -0.1390908, -3.598434, 0, 1, 0.5333334, 1,
-0.2443389, 0.6092734, 0.5537354, 0, 1, 0.5372549, 1,
-0.241873, -1.478939, -2.215383, 0, 1, 0.5450981, 1,
-0.2340034, 0.7694435, 0.09006966, 0, 1, 0.5490196, 1,
-0.2333312, 0.001507348, -0.1190744, 0, 1, 0.5568628, 1,
-0.2319293, -1.047169, -2.404264, 0, 1, 0.5607843, 1,
-0.2299102, 2.245076, 0.7024736, 0, 1, 0.5686275, 1,
-0.2253082, -0.4844838, -4.294177, 0, 1, 0.572549, 1,
-0.2251111, -1.13968, -4.268444, 0, 1, 0.5803922, 1,
-0.2197113, 0.7769748, -0.4055002, 0, 1, 0.5843138, 1,
-0.2177934, -1.66074, -2.843676, 0, 1, 0.5921569, 1,
-0.217357, -0.06298004, -1.235952, 0, 1, 0.5960785, 1,
-0.2171798, -0.1792352, -1.064401, 0, 1, 0.6039216, 1,
-0.2166247, -0.7577631, -2.1985, 0, 1, 0.6117647, 1,
-0.215745, 0.06162301, -2.886461, 0, 1, 0.6156863, 1,
-0.2153877, -1.375788, -3.559135, 0, 1, 0.6235294, 1,
-0.2110068, -2.397502, -4.766038, 0, 1, 0.627451, 1,
-0.2104211, 1.083291, 0.7441314, 0, 1, 0.6352941, 1,
-0.2101208, -0.629941, -2.08274, 0, 1, 0.6392157, 1,
-0.2073727, -1.352065, -2.712107, 0, 1, 0.6470588, 1,
-0.2069579, 1.195576, 2.429316, 0, 1, 0.6509804, 1,
-0.205812, -0.4446135, -2.807039, 0, 1, 0.6588235, 1,
-0.1932845, 1.636255, 1.108178, 0, 1, 0.6627451, 1,
-0.1841632, -2.502996, -5.212195, 0, 1, 0.6705883, 1,
-0.1810851, 1.282319, -1.184852, 0, 1, 0.6745098, 1,
-0.1769739, -0.2989628, -1.411154, 0, 1, 0.682353, 1,
-0.1695509, 0.06263614, -1.388498, 0, 1, 0.6862745, 1,
-0.1679654, -2.627594, -3.196982, 0, 1, 0.6941177, 1,
-0.1678464, -0.6114786, -2.352934, 0, 1, 0.7019608, 1,
-0.1667631, 1.075947, -1.731973, 0, 1, 0.7058824, 1,
-0.1662284, -0.4112185, -3.625702, 0, 1, 0.7137255, 1,
-0.1662132, 0.08971658, -1.291482, 0, 1, 0.7176471, 1,
-0.1635858, 1.184504, -0.6920683, 0, 1, 0.7254902, 1,
-0.1570809, 1.291846, 1.296208, 0, 1, 0.7294118, 1,
-0.1529766, 0.2305464, 0.2171897, 0, 1, 0.7372549, 1,
-0.1529239, 0.2473302, -0.6237505, 0, 1, 0.7411765, 1,
-0.1486863, 1.604371, -0.6180856, 0, 1, 0.7490196, 1,
-0.1478828, -0.2467034, -4.285594, 0, 1, 0.7529412, 1,
-0.1442881, -0.8072237, -1.963445, 0, 1, 0.7607843, 1,
-0.136431, 0.1927174, -1.487567, 0, 1, 0.7647059, 1,
-0.1330598, -0.5089436, -3.264402, 0, 1, 0.772549, 1,
-0.1283054, 0.1105818, -2.212857, 0, 1, 0.7764706, 1,
-0.12166, 0.05704388, -1.14658, 0, 1, 0.7843137, 1,
-0.1212945, -1.349527, -4.813539, 0, 1, 0.7882353, 1,
-0.1212153, 0.3638019, -0.8508528, 0, 1, 0.7960784, 1,
-0.1211619, 0.1886022, 0.5704269, 0, 1, 0.8039216, 1,
-0.120077, 0.3593368, -0.8568823, 0, 1, 0.8078431, 1,
-0.1161873, 0.08437435, 0.1692961, 0, 1, 0.8156863, 1,
-0.1097619, 1.131349, -0.7274799, 0, 1, 0.8196079, 1,
-0.1091357, -0.2802518, -2.970751, 0, 1, 0.827451, 1,
-0.1076064, -0.008087354, -1.726648, 0, 1, 0.8313726, 1,
-0.1055729, -1.062712, -2.791604, 0, 1, 0.8392157, 1,
-0.1042415, 0.4583042, 0.1674932, 0, 1, 0.8431373, 1,
-0.1036975, 1.877309, -0.6029089, 0, 1, 0.8509804, 1,
-0.09880517, -0.2198379, -2.92341, 0, 1, 0.854902, 1,
-0.0943855, -1.055194, -3.534289, 0, 1, 0.8627451, 1,
-0.0932845, 0.6016262, -0.1980963, 0, 1, 0.8666667, 1,
-0.08836336, 1.100953, -1.364408, 0, 1, 0.8745098, 1,
-0.07602213, 0.6465389, -0.1317803, 0, 1, 0.8784314, 1,
-0.07595692, 1.321506, -0.2343251, 0, 1, 0.8862745, 1,
-0.07540113, -0.1491188, -4.49354, 0, 1, 0.8901961, 1,
-0.0728024, 1.159245, -1.377042, 0, 1, 0.8980392, 1,
-0.0627588, 0.7510913, -0.3578972, 0, 1, 0.9058824, 1,
-0.06205159, -1.912031, -3.833066, 0, 1, 0.9098039, 1,
-0.06068827, 0.07056059, 0.02619172, 0, 1, 0.9176471, 1,
-0.05753904, 0.2686335, -0.9254364, 0, 1, 0.9215686, 1,
-0.05537998, 0.4356315, 0.3049825, 0, 1, 0.9294118, 1,
-0.04889431, -0.8948151, -4.237842, 0, 1, 0.9333333, 1,
-0.04816064, 2.076612, 1.142786, 0, 1, 0.9411765, 1,
-0.04524785, -1.233299, -5.468054, 0, 1, 0.945098, 1,
-0.04444472, 0.5448044, -1.155928, 0, 1, 0.9529412, 1,
-0.04216824, -1.380818, -3.183292, 0, 1, 0.9568627, 1,
-0.04212445, 0.109119, -1.684335, 0, 1, 0.9647059, 1,
-0.04121446, -0.8883178, -3.015709, 0, 1, 0.9686275, 1,
-0.03895054, -0.4416896, -2.512504, 0, 1, 0.9764706, 1,
-0.03759648, 0.1755881, 0.4489288, 0, 1, 0.9803922, 1,
-0.0371003, -0.9143862, -3.885345, 0, 1, 0.9882353, 1,
-0.03298412, 0.4565057, -0.1748687, 0, 1, 0.9921569, 1,
-0.03281746, 1.34421, -0.4113199, 0, 1, 1, 1,
-0.03091165, -0.9306468, -3.01568, 0, 0.9921569, 1, 1,
-0.03034307, -0.6091917, -2.571824, 0, 0.9882353, 1, 1,
-0.02832109, 0.2443682, 0.3970485, 0, 0.9803922, 1, 1,
-0.02807816, -1.554537, -3.958376, 0, 0.9764706, 1, 1,
-0.02798281, 1.496376, 0.8308898, 0, 0.9686275, 1, 1,
-0.02732691, -2.844669, -3.679333, 0, 0.9647059, 1, 1,
-0.02568728, 0.2374151, -1.376342, 0, 0.9568627, 1, 1,
-0.0252826, -1.505806, -3.586116, 0, 0.9529412, 1, 1,
-0.02446755, 0.1054626, -0.01267602, 0, 0.945098, 1, 1,
-0.02398203, 0.8431559, 0.6997046, 0, 0.9411765, 1, 1,
-0.02279318, 0.9261081, -1.124006, 0, 0.9333333, 1, 1,
-0.02028038, -1.230109, -1.981626, 0, 0.9294118, 1, 1,
-0.01146612, -0.5972789, -2.216202, 0, 0.9215686, 1, 1,
-0.01054453, 2.022332, 0.7203435, 0, 0.9176471, 1, 1,
-0.01033559, -0.985671, -3.69541, 0, 0.9098039, 1, 1,
-0.0002172753, 0.7143308, 0.4355396, 0, 0.9058824, 1, 1,
0.0004266519, 0.1280101, 0.5499339, 0, 0.8980392, 1, 1,
0.00134051, -0.6496964, 3.506294, 0, 0.8901961, 1, 1,
0.002626092, -0.3121472, 4.232818, 0, 0.8862745, 1, 1,
0.00798511, 0.2407044, 0.5146198, 0, 0.8784314, 1, 1,
0.008822058, -0.04757541, 3.293377, 0, 0.8745098, 1, 1,
0.009070277, 0.1284612, 1.80348, 0, 0.8666667, 1, 1,
0.01026621, -1.252718, 2.833591, 0, 0.8627451, 1, 1,
0.01026714, 0.8236782, -0.5479742, 0, 0.854902, 1, 1,
0.0104629, 0.7256128, 0.5061535, 0, 0.8509804, 1, 1,
0.01642784, -0.2733643, 1.831172, 0, 0.8431373, 1, 1,
0.01699782, 0.8145515, -0.6325783, 0, 0.8392157, 1, 1,
0.01929596, 1.00943, -1.589794, 0, 0.8313726, 1, 1,
0.01971739, -0.6703348, 2.988609, 0, 0.827451, 1, 1,
0.02472384, 1.180215, -1.7821, 0, 0.8196079, 1, 1,
0.02631959, -0.4358526, 1.490148, 0, 0.8156863, 1, 1,
0.02679948, -1.294891, 4.819904, 0, 0.8078431, 1, 1,
0.02878471, 2.466297, -1.072165, 0, 0.8039216, 1, 1,
0.02887491, 1.043904, 0.4593734, 0, 0.7960784, 1, 1,
0.03148358, -2.021428, 4.057474, 0, 0.7882353, 1, 1,
0.03180479, 0.4908859, -0.807656, 0, 0.7843137, 1, 1,
0.03397563, 0.8336621, -0.4684562, 0, 0.7764706, 1, 1,
0.03744754, 0.7644715, 1.089604, 0, 0.772549, 1, 1,
0.03749479, 0.8375949, -1.877506, 0, 0.7647059, 1, 1,
0.04478191, 1.092203, -0.535272, 0, 0.7607843, 1, 1,
0.0482608, 0.5417584, 1.038444, 0, 0.7529412, 1, 1,
0.05044646, 0.2851207, -1.078562, 0, 0.7490196, 1, 1,
0.06417595, 0.004387888, -0.04498596, 0, 0.7411765, 1, 1,
0.06608485, -0.5994951, 3.647234, 0, 0.7372549, 1, 1,
0.06723682, -0.5381678, 2.764975, 0, 0.7294118, 1, 1,
0.06833646, 1.571638, 0.4872212, 0, 0.7254902, 1, 1,
0.06930999, 0.4982873, -0.6569915, 0, 0.7176471, 1, 1,
0.06981404, -0.6991836, 3.449624, 0, 0.7137255, 1, 1,
0.07698692, -0.5672414, 3.639923, 0, 0.7058824, 1, 1,
0.07722158, -0.358029, 4.0488, 0, 0.6980392, 1, 1,
0.07911127, -0.8019645, 4.2122, 0, 0.6941177, 1, 1,
0.07979558, -0.9746144, 2.352159, 0, 0.6862745, 1, 1,
0.08557183, 0.4674105, -0.112401, 0, 0.682353, 1, 1,
0.09256025, 1.155862, -0.3250408, 0, 0.6745098, 1, 1,
0.09786668, -0.1228058, 1.700037, 0, 0.6705883, 1, 1,
0.09997384, 0.5718129, 0.03395477, 0, 0.6627451, 1, 1,
0.1041392, -1.015752, 2.049165, 0, 0.6588235, 1, 1,
0.1047926, -0.1826702, 3.147365, 0, 0.6509804, 1, 1,
0.1061805, -1.12557, 2.667454, 0, 0.6470588, 1, 1,
0.1063104, 0.3731949, 1.535255, 0, 0.6392157, 1, 1,
0.1064346, 0.6240216, 0.3117985, 0, 0.6352941, 1, 1,
0.1066945, -0.5662588, 4.292763, 0, 0.627451, 1, 1,
0.1152075, -0.06169597, 1.699458, 0, 0.6235294, 1, 1,
0.1303679, -1.212283, 3.046846, 0, 0.6156863, 1, 1,
0.1322927, -0.2077925, 3.486361, 0, 0.6117647, 1, 1,
0.1331447, 0.4618237, 0.2058453, 0, 0.6039216, 1, 1,
0.1363698, -0.471837, 2.243003, 0, 0.5960785, 1, 1,
0.1365827, -0.7940508, 1.864681, 0, 0.5921569, 1, 1,
0.1384366, 0.8064131, 0.2286104, 0, 0.5843138, 1, 1,
0.1390201, 1.202404, 0.6200176, 0, 0.5803922, 1, 1,
0.1415889, -1.729755, 2.36741, 0, 0.572549, 1, 1,
0.1434141, -0.0119712, 0.6862493, 0, 0.5686275, 1, 1,
0.1450006, -0.376686, 3.352767, 0, 0.5607843, 1, 1,
0.1472744, 0.08514523, 1.64294, 0, 0.5568628, 1, 1,
0.14891, 1.272339, 0.7640814, 0, 0.5490196, 1, 1,
0.1526208, -0.8880391, 3.586625, 0, 0.5450981, 1, 1,
0.1536926, 2.249751, -0.8186623, 0, 0.5372549, 1, 1,
0.1549116, 0.814011, -0.6574501, 0, 0.5333334, 1, 1,
0.1586632, 0.6579096, 0.9125863, 0, 0.5254902, 1, 1,
0.1608617, 0.5276775, -0.1459599, 0, 0.5215687, 1, 1,
0.1642296, 1.017918, -1.367485, 0, 0.5137255, 1, 1,
0.1663453, 0.2244912, 1.891507, 0, 0.509804, 1, 1,
0.1710528, 1.471631, -1.451503, 0, 0.5019608, 1, 1,
0.1728347, 0.4590716, 1.233622, 0, 0.4941176, 1, 1,
0.1767395, 0.4429132, 0.5281618, 0, 0.4901961, 1, 1,
0.176801, 0.617328, 0.5624372, 0, 0.4823529, 1, 1,
0.1782759, -0.465756, 3.078759, 0, 0.4784314, 1, 1,
0.1784779, -0.7311009, 2.648381, 0, 0.4705882, 1, 1,
0.1795924, 0.7535873, -1.313029, 0, 0.4666667, 1, 1,
0.1803332, 1.969929, -0.6063939, 0, 0.4588235, 1, 1,
0.1826312, -0.3141321, 1.967943, 0, 0.454902, 1, 1,
0.1840653, -1.575935, 3.242101, 0, 0.4470588, 1, 1,
0.1842963, -0.6614178, 3.430785, 0, 0.4431373, 1, 1,
0.1857051, -0.8546539, 2.354156, 0, 0.4352941, 1, 1,
0.1908422, 0.9500683, 0.4256596, 0, 0.4313726, 1, 1,
0.1909807, -0.4251309, 1.857963, 0, 0.4235294, 1, 1,
0.1925286, -1.039577, 2.824233, 0, 0.4196078, 1, 1,
0.1935883, 1.058802, -0.7557001, 0, 0.4117647, 1, 1,
0.198089, 0.8221326, 1.475008, 0, 0.4078431, 1, 1,
0.2036031, -0.5129503, 3.164775, 0, 0.4, 1, 1,
0.2042318, -0.6496392, 1.508942, 0, 0.3921569, 1, 1,
0.2085139, -0.8173599, 2.956324, 0, 0.3882353, 1, 1,
0.2090119, 1.302645, 0.6433023, 0, 0.3803922, 1, 1,
0.2172066, 1.516555, 0.1236837, 0, 0.3764706, 1, 1,
0.2203806, 0.6258929, -1.149973, 0, 0.3686275, 1, 1,
0.2226691, -0.9555519, 3.965524, 0, 0.3647059, 1, 1,
0.2228258, -0.02537794, 1.859782, 0, 0.3568628, 1, 1,
0.2258835, -1.016918, 2.969783, 0, 0.3529412, 1, 1,
0.2263691, 1.124887, -0.440207, 0, 0.345098, 1, 1,
0.2293147, -1.122184, 1.755479, 0, 0.3411765, 1, 1,
0.230979, -0.4498919, 2.001706, 0, 0.3333333, 1, 1,
0.2342886, 0.8703244, 0.6225059, 0, 0.3294118, 1, 1,
0.2372673, -0.8388872, 3.51839, 0, 0.3215686, 1, 1,
0.2406766, -0.1154207, 1.000329, 0, 0.3176471, 1, 1,
0.2410934, -2.031024, 2.373902, 0, 0.3098039, 1, 1,
0.2524311, 1.781988, -0.1091161, 0, 0.3058824, 1, 1,
0.2549079, -0.7314093, 1.90476, 0, 0.2980392, 1, 1,
0.2558374, -0.152694, 2.962144, 0, 0.2901961, 1, 1,
0.2564614, -2.543032, 1.800705, 0, 0.2862745, 1, 1,
0.2576079, -0.4522727, 5.083541, 0, 0.2784314, 1, 1,
0.2588409, -0.4573643, 2.717339, 0, 0.2745098, 1, 1,
0.2604419, -0.2430205, 1.352809, 0, 0.2666667, 1, 1,
0.265351, -0.6717213, 3.833564, 0, 0.2627451, 1, 1,
0.2655617, 0.8474512, 1.243945, 0, 0.254902, 1, 1,
0.2666877, -0.3447816, 0.4092457, 0, 0.2509804, 1, 1,
0.2704968, -0.5729501, 1.89113, 0, 0.2431373, 1, 1,
0.2725708, -0.04741813, 2.145595, 0, 0.2392157, 1, 1,
0.2778971, 1.188014, -0.6848981, 0, 0.2313726, 1, 1,
0.2780713, -0.06659972, 2.167743, 0, 0.227451, 1, 1,
0.2830747, 0.9629996, 0.09393349, 0, 0.2196078, 1, 1,
0.2832812, -0.1878326, 2.281671, 0, 0.2156863, 1, 1,
0.2837045, 1.474598, 0.8497307, 0, 0.2078431, 1, 1,
0.2856567, 0.04875175, 1.263442, 0, 0.2039216, 1, 1,
0.2869426, 0.4770322, 1.373962, 0, 0.1960784, 1, 1,
0.2912498, -0.4782181, 2.138242, 0, 0.1882353, 1, 1,
0.2913997, -1.088781, 2.49811, 0, 0.1843137, 1, 1,
0.2922133, -0.1044237, 1.887649, 0, 0.1764706, 1, 1,
0.2923329, 0.301515, -0.8004749, 0, 0.172549, 1, 1,
0.2937616, -0.2999849, 4.4687, 0, 0.1647059, 1, 1,
0.2947947, 0.1067416, 1.797748, 0, 0.1607843, 1, 1,
0.2965792, 1.361227, -0.7726032, 0, 0.1529412, 1, 1,
0.2968734, -1.095048, 3.513748, 0, 0.1490196, 1, 1,
0.3044963, 0.0002910533, 0.2424475, 0, 0.1411765, 1, 1,
0.3057381, 1.252561, 1.166772, 0, 0.1372549, 1, 1,
0.3057556, -0.4755147, 0.2065957, 0, 0.1294118, 1, 1,
0.3069438, 0.6034795, -0.5161899, 0, 0.1254902, 1, 1,
0.3074958, 0.3163651, 1.414696, 0, 0.1176471, 1, 1,
0.3078354, 2.207171, -1.186767, 0, 0.1137255, 1, 1,
0.3078885, -0.9871529, 2.573744, 0, 0.1058824, 1, 1,
0.3092478, -0.6008839, 3.584145, 0, 0.09803922, 1, 1,
0.3114321, 1.347719, 0.844596, 0, 0.09411765, 1, 1,
0.3155189, -0.1163927, 2.301975, 0, 0.08627451, 1, 1,
0.3205893, -1.518528, 4.500118, 0, 0.08235294, 1, 1,
0.321045, 0.09353372, 1.246199, 0, 0.07450981, 1, 1,
0.3254482, 0.5756729, -1.514306, 0, 0.07058824, 1, 1,
0.3264283, -0.01336097, 2.218676, 0, 0.0627451, 1, 1,
0.333328, 0.959646, -0.7702253, 0, 0.05882353, 1, 1,
0.3363767, -0.9997722, 2.252981, 0, 0.05098039, 1, 1,
0.3417687, -0.7599047, 3.646782, 0, 0.04705882, 1, 1,
0.3434171, -0.7387382, 2.395554, 0, 0.03921569, 1, 1,
0.3440551, -1.888649, 2.709241, 0, 0.03529412, 1, 1,
0.3479387, 0.6954249, 2.24374, 0, 0.02745098, 1, 1,
0.3521869, -0.3152542, 0.4264724, 0, 0.02352941, 1, 1,
0.355503, 0.2895106, 1.974304, 0, 0.01568628, 1, 1,
0.3635477, 0.02375696, 1.63405, 0, 0.01176471, 1, 1,
0.3662197, -1.484391, 1.751498, 0, 0.003921569, 1, 1,
0.3686617, 0.1922911, 0.9101167, 0.003921569, 0, 1, 1,
0.3694752, 0.3536822, -0.03316105, 0.007843138, 0, 1, 1,
0.371427, 1.009704, 0.831947, 0.01568628, 0, 1, 1,
0.3778382, -0.3564525, 1.695331, 0.01960784, 0, 1, 1,
0.3821248, 0.7154268, 0.003344721, 0.02745098, 0, 1, 1,
0.3833622, -0.5258052, 1.113741, 0.03137255, 0, 1, 1,
0.3848616, -2.646972, 2.477642, 0.03921569, 0, 1, 1,
0.3913972, 0.799583, -0.3318526, 0.04313726, 0, 1, 1,
0.3937565, 1.55865, 1.871704, 0.05098039, 0, 1, 1,
0.3982333, 0.2591137, 2.390507, 0.05490196, 0, 1, 1,
0.4043341, -0.09417021, 2.994264, 0.0627451, 0, 1, 1,
0.4047092, 1.273626, -2.366315, 0.06666667, 0, 1, 1,
0.4090748, -1.971393, 4.349598, 0.07450981, 0, 1, 1,
0.4112582, 0.6282851, 0.2459716, 0.07843138, 0, 1, 1,
0.4154579, -0.1843233, 2.256094, 0.08627451, 0, 1, 1,
0.4171111, -1.702923, 5.592126, 0.09019608, 0, 1, 1,
0.4171516, -0.5347357, 3.093621, 0.09803922, 0, 1, 1,
0.4217119, -0.451211, 3.224042, 0.1058824, 0, 1, 1,
0.421883, -1.665184, 2.748997, 0.1098039, 0, 1, 1,
0.4297948, 0.04582995, 0.8093927, 0.1176471, 0, 1, 1,
0.4302779, 1.890346, -0.3751071, 0.1215686, 0, 1, 1,
0.4333771, -0.9471441, 2.548465, 0.1294118, 0, 1, 1,
0.4389352, 0.7808157, -0.9725291, 0.1333333, 0, 1, 1,
0.4431917, 0.5018868, 1.996479, 0.1411765, 0, 1, 1,
0.4457742, 1.193845, 0.7902186, 0.145098, 0, 1, 1,
0.4468023, -2.000903, 2.830453, 0.1529412, 0, 1, 1,
0.4472814, 1.01281, 2.939899, 0.1568628, 0, 1, 1,
0.4490646, -0.6340832, 2.634778, 0.1647059, 0, 1, 1,
0.4500135, -1.510874, 3.232712, 0.1686275, 0, 1, 1,
0.4534631, -1.366091, 2.036478, 0.1764706, 0, 1, 1,
0.4558112, -0.2450045, 2.509027, 0.1803922, 0, 1, 1,
0.4562082, -1.267889, 4.831662, 0.1882353, 0, 1, 1,
0.4567742, -0.8998725, 3.116642, 0.1921569, 0, 1, 1,
0.4609181, -1.381578, 2.318599, 0.2, 0, 1, 1,
0.4618156, -0.3277813, 1.843747, 0.2078431, 0, 1, 1,
0.4671737, -1.550923, 1.939184, 0.2117647, 0, 1, 1,
0.470211, -1.45267, 2.351101, 0.2196078, 0, 1, 1,
0.4713342, -1.884371, 1.857355, 0.2235294, 0, 1, 1,
0.4769714, -0.1175602, 0.2491716, 0.2313726, 0, 1, 1,
0.4827293, -0.2723678, 2.102745, 0.2352941, 0, 1, 1,
0.4868839, -0.2865365, 3.975028, 0.2431373, 0, 1, 1,
0.4876589, 0.745246, 0.2309553, 0.2470588, 0, 1, 1,
0.4884062, -1.481017, 2.71702, 0.254902, 0, 1, 1,
0.4888153, -1.398879, 1.93784, 0.2588235, 0, 1, 1,
0.4908873, 2.017712, -0.04067127, 0.2666667, 0, 1, 1,
0.4917124, 0.6067645, 1.753976, 0.2705882, 0, 1, 1,
0.4924291, -1.062826, 1.486782, 0.2784314, 0, 1, 1,
0.4931032, -1.249913, 1.838882, 0.282353, 0, 1, 1,
0.498165, 1.191248, -0.4294717, 0.2901961, 0, 1, 1,
0.498573, -0.0491887, 2.276716, 0.2941177, 0, 1, 1,
0.5040079, 0.4556342, 0.6436483, 0.3019608, 0, 1, 1,
0.5085774, -0.7657241, 1.647138, 0.3098039, 0, 1, 1,
0.5112129, 2.547201, 1.424834, 0.3137255, 0, 1, 1,
0.5123239, -1.006974, 4.24479, 0.3215686, 0, 1, 1,
0.5180451, -1.751994, 3.359111, 0.3254902, 0, 1, 1,
0.5266406, -0.7686372, 2.780891, 0.3333333, 0, 1, 1,
0.5276103, 1.466755, -0.3158298, 0.3372549, 0, 1, 1,
0.5327066, -0.8144016, 5.048469, 0.345098, 0, 1, 1,
0.5328009, -0.1206815, 0.6864874, 0.3490196, 0, 1, 1,
0.5348181, 0.1507654, 2.112718, 0.3568628, 0, 1, 1,
0.5374606, 1.656253, 0.1600783, 0.3607843, 0, 1, 1,
0.5377234, 0.2034129, 1.616065, 0.3686275, 0, 1, 1,
0.5403984, -0.5041723, 2.581822, 0.372549, 0, 1, 1,
0.5427387, -1.423227, 2.910763, 0.3803922, 0, 1, 1,
0.5445207, 1.482609, -0.8205585, 0.3843137, 0, 1, 1,
0.5448272, 0.4249012, 0.2443397, 0.3921569, 0, 1, 1,
0.5497014, 1.295218, -1.532309, 0.3960784, 0, 1, 1,
0.5566471, 0.1599091, 1.494918, 0.4039216, 0, 1, 1,
0.5600908, -0.797618, 2.544989, 0.4117647, 0, 1, 1,
0.5608208, -0.160282, 2.465704, 0.4156863, 0, 1, 1,
0.5630714, 0.7260643, 0.5226977, 0.4235294, 0, 1, 1,
0.5676599, -0.1780539, 2.206618, 0.427451, 0, 1, 1,
0.5696125, 0.06830944, 2.67076, 0.4352941, 0, 1, 1,
0.5728247, 1.16651, -0.3424155, 0.4392157, 0, 1, 1,
0.575198, -0.6430773, 3.628488, 0.4470588, 0, 1, 1,
0.5756329, 1.793426, -0.5839998, 0.4509804, 0, 1, 1,
0.5783998, -1.018971, 1.257561, 0.4588235, 0, 1, 1,
0.5834875, 0.4941695, 0.3616351, 0.4627451, 0, 1, 1,
0.5836986, -0.2634452, 3.718959, 0.4705882, 0, 1, 1,
0.5862324, 0.8121539, 1.725018, 0.4745098, 0, 1, 1,
0.5875021, 0.650813, 1.833781, 0.4823529, 0, 1, 1,
0.5901492, 0.5726693, -0.02606178, 0.4862745, 0, 1, 1,
0.5954407, -0.8475805, 2.926509, 0.4941176, 0, 1, 1,
0.597307, -0.6575973, 2.510076, 0.5019608, 0, 1, 1,
0.6077284, -0.690265, 2.739021, 0.5058824, 0, 1, 1,
0.6095565, 0.3319514, 2.326932, 0.5137255, 0, 1, 1,
0.6118246, -0.7768808, 2.238624, 0.5176471, 0, 1, 1,
0.6223275, -0.3534603, 3.524447, 0.5254902, 0, 1, 1,
0.6292638, 0.482702, 0.6524144, 0.5294118, 0, 1, 1,
0.6295582, -0.4977922, 1.850258, 0.5372549, 0, 1, 1,
0.6315795, 0.2793615, 0.1016776, 0.5411765, 0, 1, 1,
0.6336787, 0.4333711, -1.452567, 0.5490196, 0, 1, 1,
0.6382561, -0.7203658, 2.975527, 0.5529412, 0, 1, 1,
0.6384022, 1.602835, 0.2154817, 0.5607843, 0, 1, 1,
0.6490038, 2.347013, 0.7731869, 0.5647059, 0, 1, 1,
0.6563139, 0.9423039, 0.5331626, 0.572549, 0, 1, 1,
0.6614553, -1.525673, 3.048435, 0.5764706, 0, 1, 1,
0.6621706, 0.4698961, 2.561719, 0.5843138, 0, 1, 1,
0.6642209, -0.512485, 2.019047, 0.5882353, 0, 1, 1,
0.6657016, -0.4765343, 1.866325, 0.5960785, 0, 1, 1,
0.6666303, 0.7190756, 2.807445, 0.6039216, 0, 1, 1,
0.666872, 0.1707173, 1.933666, 0.6078432, 0, 1, 1,
0.6717426, -0.3189639, 1.812814, 0.6156863, 0, 1, 1,
0.6772005, -0.3354281, 2.328251, 0.6196079, 0, 1, 1,
0.6785854, -1.425677, 2.557755, 0.627451, 0, 1, 1,
0.6788846, 2.224586, -0.08312608, 0.6313726, 0, 1, 1,
0.6797238, 1.624935, -0.5495059, 0.6392157, 0, 1, 1,
0.6832469, 0.2039688, 1.712826, 0.6431373, 0, 1, 1,
0.690922, -2.206819, 2.44413, 0.6509804, 0, 1, 1,
0.6913784, 1.55144, 1.527811, 0.654902, 0, 1, 1,
0.6930004, -0.328223, 1.916433, 0.6627451, 0, 1, 1,
0.696408, -1.389876, 2.168736, 0.6666667, 0, 1, 1,
0.7023976, -2.007398, 1.916449, 0.6745098, 0, 1, 1,
0.7024654, 0.2812061, 0.1418981, 0.6784314, 0, 1, 1,
0.704762, -0.06571567, 2.748606, 0.6862745, 0, 1, 1,
0.7057573, -0.6873755, 2.810776, 0.6901961, 0, 1, 1,
0.7073891, 0.5357592, 2.538802, 0.6980392, 0, 1, 1,
0.7080065, 0.2585097, 1.744768, 0.7058824, 0, 1, 1,
0.7184168, 1.849026, 2.516096, 0.7098039, 0, 1, 1,
0.7195352, 0.3407609, 0.9661161, 0.7176471, 0, 1, 1,
0.725113, -1.409497, 3.836943, 0.7215686, 0, 1, 1,
0.7313531, -0.08269323, 4.452245, 0.7294118, 0, 1, 1,
0.7336769, -0.08565717, 2.347272, 0.7333333, 0, 1, 1,
0.7377137, -0.8302227, 1.676184, 0.7411765, 0, 1, 1,
0.7385999, 0.9259478, -0.1451515, 0.7450981, 0, 1, 1,
0.7387359, -2.162303, 3.356025, 0.7529412, 0, 1, 1,
0.7532136, -0.1917472, 1.203899, 0.7568628, 0, 1, 1,
0.7643275, 1.010128, 1.405096, 0.7647059, 0, 1, 1,
0.7685609, -0.8501595, 2.798556, 0.7686275, 0, 1, 1,
0.7697755, 1.27919, 0.2009824, 0.7764706, 0, 1, 1,
0.7841169, 1.663759, 0.2057197, 0.7803922, 0, 1, 1,
0.7869391, -1.834816, 2.878615, 0.7882353, 0, 1, 1,
0.7952381, 1.002149, -0.004119607, 0.7921569, 0, 1, 1,
0.7975101, 0.6812861, -0.6569405, 0.8, 0, 1, 1,
0.7975355, 2.115669, -0.4796683, 0.8078431, 0, 1, 1,
0.7982228, -1.268037, 0.2999572, 0.8117647, 0, 1, 1,
0.802557, -1.196905, 0.9740415, 0.8196079, 0, 1, 1,
0.8055525, 1.235142, -0.1384541, 0.8235294, 0, 1, 1,
0.8057745, -0.004403211, 2.654689, 0.8313726, 0, 1, 1,
0.8068577, -1.397182, 2.2723, 0.8352941, 0, 1, 1,
0.8080869, -0.6409673, 1.900204, 0.8431373, 0, 1, 1,
0.8091021, 0.6814455, 0.7657468, 0.8470588, 0, 1, 1,
0.8207119, -1.169072, 2.441967, 0.854902, 0, 1, 1,
0.8247666, 2.110564, 1.701889, 0.8588235, 0, 1, 1,
0.8269358, 0.2428336, -0.1926016, 0.8666667, 0, 1, 1,
0.8404567, 0.2572501, 0.9274616, 0.8705882, 0, 1, 1,
0.8461785, -0.3149658, 1.486413, 0.8784314, 0, 1, 1,
0.8529495, 1.186784, -0.8502585, 0.8823529, 0, 1, 1,
0.8541167, -1.266728, 2.041184, 0.8901961, 0, 1, 1,
0.8588938, 0.4730079, 0.1450851, 0.8941177, 0, 1, 1,
0.8609295, 0.2178621, 0.6114156, 0.9019608, 0, 1, 1,
0.8615748, 0.2236156, 2.025445, 0.9098039, 0, 1, 1,
0.8644714, -0.07700098, 1.836994, 0.9137255, 0, 1, 1,
0.8667858, 0.01726729, 2.643242, 0.9215686, 0, 1, 1,
0.8674378, -0.9727054, 4.130686, 0.9254902, 0, 1, 1,
0.8718717, -0.4859661, 2.556371, 0.9333333, 0, 1, 1,
0.8737367, 0.9561945, 0.879123, 0.9372549, 0, 1, 1,
0.8738785, -1.485772, 3.602558, 0.945098, 0, 1, 1,
0.874711, 2.646392, -0.4791134, 0.9490196, 0, 1, 1,
0.8763536, 0.3965113, 0.1787524, 0.9568627, 0, 1, 1,
0.8816099, 1.511811, -0.6954691, 0.9607843, 0, 1, 1,
0.8897783, -0.3715526, 0.8693829, 0.9686275, 0, 1, 1,
0.8958933, 0.6650904, 1.78733, 0.972549, 0, 1, 1,
0.9046422, 1.088667, -0.3541117, 0.9803922, 0, 1, 1,
0.9211735, 0.6346235, 0.5176729, 0.9843137, 0, 1, 1,
0.9240326, -0.5489864, 0.6763945, 0.9921569, 0, 1, 1,
0.9285578, 1.00645, 1.216625, 0.9960784, 0, 1, 1,
0.928717, 1.26827, 1.801655, 1, 0, 0.9960784, 1,
0.9315163, 0.9437596, 0.2178074, 1, 0, 0.9882353, 1,
0.9369361, -0.5511084, 2.266372, 1, 0, 0.9843137, 1,
0.947929, -0.9614639, 1.933659, 1, 0, 0.9764706, 1,
0.948558, -0.1930547, 0.2302813, 1, 0, 0.972549, 1,
0.9522984, -0.2069732, 2.802213, 1, 0, 0.9647059, 1,
0.9581891, 1.941683, 0.4637838, 1, 0, 0.9607843, 1,
0.9635719, -0.5255671, 2.084998, 1, 0, 0.9529412, 1,
0.9708579, 0.193926, 1.335706, 1, 0, 0.9490196, 1,
0.9784134, -1.996815, 1.245821, 1, 0, 0.9411765, 1,
0.9805781, -0.09552342, -0.9322233, 1, 0, 0.9372549, 1,
0.985188, 0.09534071, 0.1793244, 1, 0, 0.9294118, 1,
0.9876931, 0.3947449, 3.217564, 1, 0, 0.9254902, 1,
0.9888654, -0.1045228, 0.8948802, 1, 0, 0.9176471, 1,
0.9897031, 0.7506515, -0.0916495, 1, 0, 0.9137255, 1,
0.9904061, 0.6548417, -0.8870143, 1, 0, 0.9058824, 1,
0.9955333, -0.9724194, 0.0730296, 1, 0, 0.9019608, 1,
0.9978769, -0.6309093, 0.9042209, 1, 0, 0.8941177, 1,
1.000578, -0.1046112, 1.333179, 1, 0, 0.8862745, 1,
1.001376, -1.704784, 1.86061, 1, 0, 0.8823529, 1,
1.007177, 0.06963091, 2.16518, 1, 0, 0.8745098, 1,
1.016415, -0.770898, 0.7469575, 1, 0, 0.8705882, 1,
1.019797, -1.135012, 1.943321, 1, 0, 0.8627451, 1,
1.026163, 0.5669503, 0.714467, 1, 0, 0.8588235, 1,
1.026568, -2.074711, 2.61746, 1, 0, 0.8509804, 1,
1.029466, 1.097349, -1.173458, 1, 0, 0.8470588, 1,
1.034433, -0.1549491, 1.687252, 1, 0, 0.8392157, 1,
1.037775, 1.543786, 0.6808153, 1, 0, 0.8352941, 1,
1.039079, -1.656057, 1.989199, 1, 0, 0.827451, 1,
1.039386, -0.7681948, 3.213269, 1, 0, 0.8235294, 1,
1.04731, -0.5572903, 3.362891, 1, 0, 0.8156863, 1,
1.054356, -0.7004657, 3.440813, 1, 0, 0.8117647, 1,
1.055221, 1.382631, 1.040462, 1, 0, 0.8039216, 1,
1.058496, -0.7058474, 2.853533, 1, 0, 0.7960784, 1,
1.077154, -0.08429313, 0.09303728, 1, 0, 0.7921569, 1,
1.081217, -0.3752506, 1.820089, 1, 0, 0.7843137, 1,
1.081431, 2.348915, -0.04633276, 1, 0, 0.7803922, 1,
1.084449, -1.755464, 2.723809, 1, 0, 0.772549, 1,
1.095763, -0.3943814, -1.380561, 1, 0, 0.7686275, 1,
1.099939, 0.8171431, 0.7125267, 1, 0, 0.7607843, 1,
1.103677, -0.3882587, -0.405334, 1, 0, 0.7568628, 1,
1.105766, -0.5314688, 1.966346, 1, 0, 0.7490196, 1,
1.107429, -0.4842471, 0.7315601, 1, 0, 0.7450981, 1,
1.113681, 0.7572455, 0.7114769, 1, 0, 0.7372549, 1,
1.114306, 1.507041, 1.509693, 1, 0, 0.7333333, 1,
1.114748, 1.210183, -0.8569668, 1, 0, 0.7254902, 1,
1.122276, -1.580234, 2.103774, 1, 0, 0.7215686, 1,
1.127657, -0.4322315, 1.66905, 1, 0, 0.7137255, 1,
1.128698, -0.8418105, 2.118065, 1, 0, 0.7098039, 1,
1.130981, -0.4389794, 2.936759, 1, 0, 0.7019608, 1,
1.134902, -1.563338, 2.210985, 1, 0, 0.6941177, 1,
1.135783, 0.8068141, 1.684445, 1, 0, 0.6901961, 1,
1.14002, -0.07600661, 1.388919, 1, 0, 0.682353, 1,
1.141382, -2.297413, 3.619691, 1, 0, 0.6784314, 1,
1.146153, -0.4307115, 2.158009, 1, 0, 0.6705883, 1,
1.153279, 0.8797988, 1.590716, 1, 0, 0.6666667, 1,
1.163622, 0.02933502, 2.597419, 1, 0, 0.6588235, 1,
1.173214, 0.4330667, 0.7466323, 1, 0, 0.654902, 1,
1.176052, 2.103849, -0.3971443, 1, 0, 0.6470588, 1,
1.183666, -0.2147514, 1.43721, 1, 0, 0.6431373, 1,
1.185984, -1.738567, 1.924927, 1, 0, 0.6352941, 1,
1.186772, 0.1806611, 1.403874, 1, 0, 0.6313726, 1,
1.187604, -1.914724, 3.68456, 1, 0, 0.6235294, 1,
1.18895, -1.004324, 1.691106, 1, 0, 0.6196079, 1,
1.189082, 0.1305325, -0.2050774, 1, 0, 0.6117647, 1,
1.191971, -0.8760788, 1.190226, 1, 0, 0.6078432, 1,
1.19475, -1.899475, 1.847734, 1, 0, 0.6, 1,
1.194802, 0.7453393, 1.770039, 1, 0, 0.5921569, 1,
1.197708, 0.3310266, 2.140293, 1, 0, 0.5882353, 1,
1.19867, -0.6751822, -0.6041619, 1, 0, 0.5803922, 1,
1.200746, 0.7069418, -0.06021727, 1, 0, 0.5764706, 1,
1.214046, -0.1429503, 1.794699, 1, 0, 0.5686275, 1,
1.218263, -2.478766, 1.906629, 1, 0, 0.5647059, 1,
1.219014, -0.2515603, 0.7672215, 1, 0, 0.5568628, 1,
1.240163, 0.6213906, 1.859337, 1, 0, 0.5529412, 1,
1.250531, -0.9457338, 1.979073, 1, 0, 0.5450981, 1,
1.253591, -1.038645, 2.987687, 1, 0, 0.5411765, 1,
1.257652, -1.583094, 2.45462, 1, 0, 0.5333334, 1,
1.258814, -0.007800664, 2.166261, 1, 0, 0.5294118, 1,
1.270157, 0.9648563, -0.2634422, 1, 0, 0.5215687, 1,
1.271863, -2.331887, 1.567845, 1, 0, 0.5176471, 1,
1.284421, 0.7641736, 2.123794, 1, 0, 0.509804, 1,
1.290247, -1.920939, 1.525242, 1, 0, 0.5058824, 1,
1.305822, -0.07256017, 1.975289, 1, 0, 0.4980392, 1,
1.306062, 0.6832707, 0.856531, 1, 0, 0.4901961, 1,
1.31669, 0.01858284, 3.734338, 1, 0, 0.4862745, 1,
1.317861, -0.3724408, 1.616148, 1, 0, 0.4784314, 1,
1.32179, -1.988023, 2.340671, 1, 0, 0.4745098, 1,
1.340437, -1.503341, 2.649221, 1, 0, 0.4666667, 1,
1.341552, 0.8888385, 1.200599, 1, 0, 0.4627451, 1,
1.343383, 1.918744, 0.8843158, 1, 0, 0.454902, 1,
1.345942, 1.374036, 0.6565662, 1, 0, 0.4509804, 1,
1.361031, 0.7417153, 1.76532, 1, 0, 0.4431373, 1,
1.390457, 0.2224887, 0.07462615, 1, 0, 0.4392157, 1,
1.393366, -0.4655193, -0.7332065, 1, 0, 0.4313726, 1,
1.413516, -0.5275896, 1.96652, 1, 0, 0.427451, 1,
1.419638, -2.098356, 2.338702, 1, 0, 0.4196078, 1,
1.436757, 0.492131, 1.119388, 1, 0, 0.4156863, 1,
1.445512, 0.2340765, 1.589577, 1, 0, 0.4078431, 1,
1.451659, -0.2508345, 2.501508, 1, 0, 0.4039216, 1,
1.466145, -0.5835158, 3.552495, 1, 0, 0.3960784, 1,
1.467564, -0.1231468, 1.829717, 1, 0, 0.3882353, 1,
1.46884, -1.329977, 2.199673, 1, 0, 0.3843137, 1,
1.488921, 0.8287461, 1.515892, 1, 0, 0.3764706, 1,
1.494491, -1.425056, 2.151954, 1, 0, 0.372549, 1,
1.494698, -0.460536, 3.109842, 1, 0, 0.3647059, 1,
1.499504, -0.9046072, 1.851282, 1, 0, 0.3607843, 1,
1.502603, -0.2541131, 3.352352, 1, 0, 0.3529412, 1,
1.505922, 0.1907633, 2.899556, 1, 0, 0.3490196, 1,
1.510509, -1.10588, 2.394814, 1, 0, 0.3411765, 1,
1.513449, 0.6145809, 4.246309, 1, 0, 0.3372549, 1,
1.514026, 0.05356223, 3.786087, 1, 0, 0.3294118, 1,
1.51762, -0.4319493, 2.823975, 1, 0, 0.3254902, 1,
1.571392, 0.7769215, 1.683866, 1, 0, 0.3176471, 1,
1.581717, 0.9798042, -1.103487, 1, 0, 0.3137255, 1,
1.592547, 0.9079797, 0.1200332, 1, 0, 0.3058824, 1,
1.615578, -0.5026406, 1.608551, 1, 0, 0.2980392, 1,
1.616236, -0.04825097, 1.262999, 1, 0, 0.2941177, 1,
1.621553, -1.217727, 3.038858, 1, 0, 0.2862745, 1,
1.632341, -1.803577, 3.980098, 1, 0, 0.282353, 1,
1.644077, -0.792245, 0.5379717, 1, 0, 0.2745098, 1,
1.657873, -0.8839984, 2.200493, 1, 0, 0.2705882, 1,
1.661406, -0.549099, 2.997242, 1, 0, 0.2627451, 1,
1.676732, -0.5187355, 3.869083, 1, 0, 0.2588235, 1,
1.676757, -0.3040455, 1.088135, 1, 0, 0.2509804, 1,
1.68117, 0.6092288, 1.928159, 1, 0, 0.2470588, 1,
1.683746, 1.00221, 1.878223, 1, 0, 0.2392157, 1,
1.69101, 0.4587869, 0.8183907, 1, 0, 0.2352941, 1,
1.693, -0.5904234, 0.9129083, 1, 0, 0.227451, 1,
1.697798, 1.043807, 2.96596, 1, 0, 0.2235294, 1,
1.699089, -0.7325427, 2.452642, 1, 0, 0.2156863, 1,
1.704925, 0.3860252, 1.297709, 1, 0, 0.2117647, 1,
1.712338, -0.6332784, 0.9031013, 1, 0, 0.2039216, 1,
1.748206, -1.269184, 2.628706, 1, 0, 0.1960784, 1,
1.753472, -0.2738056, 0.03834006, 1, 0, 0.1921569, 1,
1.762309, 0.7952634, 1.203482, 1, 0, 0.1843137, 1,
1.78873, -0.7187324, 1.977595, 1, 0, 0.1803922, 1,
1.789368, -0.1979976, 1.380664, 1, 0, 0.172549, 1,
1.823246, -0.2570993, 1.375662, 1, 0, 0.1686275, 1,
1.912046, 0.2240034, 0.6053877, 1, 0, 0.1607843, 1,
1.933792, -0.3896847, 1.075168, 1, 0, 0.1568628, 1,
1.937947, -0.2120983, 1.030993, 1, 0, 0.1490196, 1,
1.944636, -1.268128, -0.03185847, 1, 0, 0.145098, 1,
1.948915, -1.281514, 2.097378, 1, 0, 0.1372549, 1,
1.953334, 0.2062871, 2.023849, 1, 0, 0.1333333, 1,
2.019532, 1.209925, 2.866994, 1, 0, 0.1254902, 1,
2.06205, 0.42875, 2.487908, 1, 0, 0.1215686, 1,
2.112839, 0.5173658, -0.01939076, 1, 0, 0.1137255, 1,
2.135144, 0.1985402, 3.422452, 1, 0, 0.1098039, 1,
2.164617, -0.3436334, 1.178425, 1, 0, 0.1019608, 1,
2.178978, -0.9408547, 2.555379, 1, 0, 0.09411765, 1,
2.18869, -0.0068268, 0.8898239, 1, 0, 0.09019608, 1,
2.190425, 1.602337, 0.6334552, 1, 0, 0.08235294, 1,
2.223195, 0.4683647, 1.073712, 1, 0, 0.07843138, 1,
2.230894, 1.588179, 0.0963827, 1, 0, 0.07058824, 1,
2.235739, 1.476165, 1.013384, 1, 0, 0.06666667, 1,
2.260192, 0.9862024, -0.7803345, 1, 0, 0.05882353, 1,
2.288876, -0.1503681, 3.225338, 1, 0, 0.05490196, 1,
2.357034, 1.390588, -0.9747035, 1, 0, 0.04705882, 1,
2.380043, 0.6761571, 2.831037, 1, 0, 0.04313726, 1,
2.475264, -0.3768693, 0.9453323, 1, 0, 0.03529412, 1,
2.656041, -2.567203, 2.107205, 1, 0, 0.03137255, 1,
2.698853, -0.1264333, 0.5285098, 1, 0, 0.02352941, 1,
2.984684, 1.456269, 2.726553, 1, 0, 0.01960784, 1,
3.721323, 0.07105947, 2.414309, 1, 0, 0.01176471, 1,
4.168494, -0.4259263, 0.3340157, 1, 0, 0.007843138, 1
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
0.2229942, -3.809314, -8.12009, 0, -0.5, 0.5, 0.5,
0.2229942, -3.809314, -8.12009, 1, -0.5, 0.5, 0.5,
0.2229942, -3.809314, -8.12009, 1, 1.5, 0.5, 0.5,
0.2229942, -3.809314, -8.12009, 0, 1.5, 0.5, 0.5
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
-5.06003, 0.0008933544, -8.12009, 0, -0.5, 0.5, 0.5,
-5.06003, 0.0008933544, -8.12009, 1, -0.5, 0.5, 0.5,
-5.06003, 0.0008933544, -8.12009, 1, 1.5, 0.5, 0.5,
-5.06003, 0.0008933544, -8.12009, 0, 1.5, 0.5, 0.5
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
-5.06003, -3.809314, -0.2703011, 0, -0.5, 0.5, 0.5,
-5.06003, -3.809314, -0.2703011, 1, -0.5, 0.5, 0.5,
-5.06003, -3.809314, -0.2703011, 1, 1.5, 0.5, 0.5,
-5.06003, -3.809314, -0.2703011, 0, 1.5, 0.5, 0.5
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
-2, -2.930036, -6.308601,
4, -2.930036, -6.308601,
-2, -2.930036, -6.308601,
-2, -3.076582, -6.610516,
0, -2.930036, -6.308601,
0, -3.076582, -6.610516,
2, -2.930036, -6.308601,
2, -3.076582, -6.610516,
4, -2.930036, -6.308601,
4, -3.076582, -6.610516
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
"2",
"4"
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
-2, -3.369675, -7.214346, 0, -0.5, 0.5, 0.5,
-2, -3.369675, -7.214346, 1, -0.5, 0.5, 0.5,
-2, -3.369675, -7.214346, 1, 1.5, 0.5, 0.5,
-2, -3.369675, -7.214346, 0, 1.5, 0.5, 0.5,
0, -3.369675, -7.214346, 0, -0.5, 0.5, 0.5,
0, -3.369675, -7.214346, 1, -0.5, 0.5, 0.5,
0, -3.369675, -7.214346, 1, 1.5, 0.5, 0.5,
0, -3.369675, -7.214346, 0, 1.5, 0.5, 0.5,
2, -3.369675, -7.214346, 0, -0.5, 0.5, 0.5,
2, -3.369675, -7.214346, 1, -0.5, 0.5, 0.5,
2, -3.369675, -7.214346, 1, 1.5, 0.5, 0.5,
2, -3.369675, -7.214346, 0, 1.5, 0.5, 0.5,
4, -3.369675, -7.214346, 0, -0.5, 0.5, 0.5,
4, -3.369675, -7.214346, 1, -0.5, 0.5, 0.5,
4, -3.369675, -7.214346, 1, 1.5, 0.5, 0.5,
4, -3.369675, -7.214346, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.840871, -2, -6.308601,
-3.840871, 2, -6.308601,
-3.840871, -2, -6.308601,
-4.044064, -2, -6.610516,
-3.840871, -1, -6.308601,
-4.044064, -1, -6.610516,
-3.840871, 0, -6.308601,
-4.044064, 0, -6.610516,
-3.840871, 1, -6.308601,
-4.044064, 1, -6.610516,
-3.840871, 2, -6.308601,
-4.044064, 2, -6.610516
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
-4.45045, -2, -7.214346, 0, -0.5, 0.5, 0.5,
-4.45045, -2, -7.214346, 1, -0.5, 0.5, 0.5,
-4.45045, -2, -7.214346, 1, 1.5, 0.5, 0.5,
-4.45045, -2, -7.214346, 0, 1.5, 0.5, 0.5,
-4.45045, -1, -7.214346, 0, -0.5, 0.5, 0.5,
-4.45045, -1, -7.214346, 1, -0.5, 0.5, 0.5,
-4.45045, -1, -7.214346, 1, 1.5, 0.5, 0.5,
-4.45045, -1, -7.214346, 0, 1.5, 0.5, 0.5,
-4.45045, 0, -7.214346, 0, -0.5, 0.5, 0.5,
-4.45045, 0, -7.214346, 1, -0.5, 0.5, 0.5,
-4.45045, 0, -7.214346, 1, 1.5, 0.5, 0.5,
-4.45045, 0, -7.214346, 0, 1.5, 0.5, 0.5,
-4.45045, 1, -7.214346, 0, -0.5, 0.5, 0.5,
-4.45045, 1, -7.214346, 1, -0.5, 0.5, 0.5,
-4.45045, 1, -7.214346, 1, 1.5, 0.5, 0.5,
-4.45045, 1, -7.214346, 0, 1.5, 0.5, 0.5,
-4.45045, 2, -7.214346, 0, -0.5, 0.5, 0.5,
-4.45045, 2, -7.214346, 1, -0.5, 0.5, 0.5,
-4.45045, 2, -7.214346, 1, 1.5, 0.5, 0.5,
-4.45045, 2, -7.214346, 0, 1.5, 0.5, 0.5
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
-3.840871, -2.930036, -6,
-3.840871, -2.930036, 4,
-3.840871, -2.930036, -6,
-4.044064, -3.076582, -6,
-3.840871, -2.930036, -4,
-4.044064, -3.076582, -4,
-3.840871, -2.930036, -2,
-4.044064, -3.076582, -2,
-3.840871, -2.930036, 0,
-4.044064, -3.076582, 0,
-3.840871, -2.930036, 2,
-4.044064, -3.076582, 2,
-3.840871, -2.930036, 4,
-4.044064, -3.076582, 4
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
"-6",
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
-4.45045, -3.369675, -6, 0, -0.5, 0.5, 0.5,
-4.45045, -3.369675, -6, 1, -0.5, 0.5, 0.5,
-4.45045, -3.369675, -6, 1, 1.5, 0.5, 0.5,
-4.45045, -3.369675, -6, 0, 1.5, 0.5, 0.5,
-4.45045, -3.369675, -4, 0, -0.5, 0.5, 0.5,
-4.45045, -3.369675, -4, 1, -0.5, 0.5, 0.5,
-4.45045, -3.369675, -4, 1, 1.5, 0.5, 0.5,
-4.45045, -3.369675, -4, 0, 1.5, 0.5, 0.5,
-4.45045, -3.369675, -2, 0, -0.5, 0.5, 0.5,
-4.45045, -3.369675, -2, 1, -0.5, 0.5, 0.5,
-4.45045, -3.369675, -2, 1, 1.5, 0.5, 0.5,
-4.45045, -3.369675, -2, 0, 1.5, 0.5, 0.5,
-4.45045, -3.369675, 0, 0, -0.5, 0.5, 0.5,
-4.45045, -3.369675, 0, 1, -0.5, 0.5, 0.5,
-4.45045, -3.369675, 0, 1, 1.5, 0.5, 0.5,
-4.45045, -3.369675, 0, 0, 1.5, 0.5, 0.5,
-4.45045, -3.369675, 2, 0, -0.5, 0.5, 0.5,
-4.45045, -3.369675, 2, 1, -0.5, 0.5, 0.5,
-4.45045, -3.369675, 2, 1, 1.5, 0.5, 0.5,
-4.45045, -3.369675, 2, 0, 1.5, 0.5, 0.5,
-4.45045, -3.369675, 4, 0, -0.5, 0.5, 0.5,
-4.45045, -3.369675, 4, 1, -0.5, 0.5, 0.5,
-4.45045, -3.369675, 4, 1, 1.5, 0.5, 0.5,
-4.45045, -3.369675, 4, 0, 1.5, 0.5, 0.5
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
-3.840871, -2.930036, -6.308601,
-3.840871, 2.931823, -6.308601,
-3.840871, -2.930036, 5.767999,
-3.840871, 2.931823, 5.767999,
-3.840871, -2.930036, -6.308601,
-3.840871, -2.930036, 5.767999,
-3.840871, 2.931823, -6.308601,
-3.840871, 2.931823, 5.767999,
-3.840871, -2.930036, -6.308601,
4.286859, -2.930036, -6.308601,
-3.840871, -2.930036, 5.767999,
4.286859, -2.930036, 5.767999,
-3.840871, 2.931823, -6.308601,
4.286859, 2.931823, -6.308601,
-3.840871, 2.931823, 5.767999,
4.286859, 2.931823, 5.767999,
4.286859, -2.930036, -6.308601,
4.286859, 2.931823, -6.308601,
4.286859, -2.930036, 5.767999,
4.286859, 2.931823, 5.767999,
4.286859, -2.930036, -6.308601,
4.286859, -2.930036, 5.767999,
4.286859, 2.931823, -6.308601,
4.286859, 2.931823, 5.767999
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
var radius = 8.379679;
var distance = 37.28214;
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
mvMatrix.translate( -0.2229942, -0.0008933544, 0.2703011 );
mvMatrix.scale( 1.114736, 1.545632, 0.7502338 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.28214);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
oxadiazon_2-tert-but<-read.table("oxadiazon_2-tert-but.xyz", skip=1)
```

```
## Error in read.table("oxadiazon_2-tert-but.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-oxadiazon_2-tert-but$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxadiazon_2' not found
```

```r
y<-oxadiazon_2-tert-but$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxadiazon_2' not found
```

```r
z<-oxadiazon_2-tert-but$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxadiazon_2' not found
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
-3.722506, -1.282502, -2.643348, 0, 0, 1, 1, 1,
-2.623735, 0.4496195, -2.027456, 1, 0, 0, 1, 1,
-2.532004, 1.017907, -2.07103, 1, 0, 0, 1, 1,
-2.457191, 0.003590029, -1.533666, 1, 0, 0, 1, 1,
-2.398081, -0.376085, -2.150909, 1, 0, 0, 1, 1,
-2.380601, -1.367104, 0.4627047, 1, 0, 0, 1, 1,
-2.188965, 1.311828, -0.7465732, 0, 0, 0, 1, 1,
-2.185077, -1.300377, -1.932709, 0, 0, 0, 1, 1,
-2.079162, 1.558345, -1.235067, 0, 0, 0, 1, 1,
-2.023886, 0.08388653, -1.020544, 0, 0, 0, 1, 1,
-2.021934, 1.262681, -0.8489954, 0, 0, 0, 1, 1,
-1.97512, 0.4500525, -0.8512579, 0, 0, 0, 1, 1,
-1.954733, 1.749212, -0.5002366, 0, 0, 0, 1, 1,
-1.948718, 0.4041272, -2.669327, 1, 1, 1, 1, 1,
-1.912106, -0.5852421, -2.225354, 1, 1, 1, 1, 1,
-1.907075, 1.440741, 0.2210842, 1, 1, 1, 1, 1,
-1.878317, -2.448687, -3.391, 1, 1, 1, 1, 1,
-1.870255, 0.182742, 0.6343138, 1, 1, 1, 1, 1,
-1.86047, 1.155702, 0.7644647, 1, 1, 1, 1, 1,
-1.852647, -0.5693465, -1.988166, 1, 1, 1, 1, 1,
-1.845049, 1.166583, -0.6289185, 1, 1, 1, 1, 1,
-1.802027, -0.19152, -3.676342, 1, 1, 1, 1, 1,
-1.799933, -1.380931, -3.103758, 1, 1, 1, 1, 1,
-1.782839, -1.567154, -3.660702, 1, 1, 1, 1, 1,
-1.782135, -1.623288, -1.312978, 1, 1, 1, 1, 1,
-1.781381, 0.3102486, -1.643954, 1, 1, 1, 1, 1,
-1.768267, -2.602748, -3.18743, 1, 1, 1, 1, 1,
-1.758563, -0.5918198, -0.9389589, 1, 1, 1, 1, 1,
-1.754943, 1.12076, 0.03162196, 0, 0, 1, 1, 1,
-1.747159, -0.8105626, -4.708207, 1, 0, 0, 1, 1,
-1.73371, -0.824378, -1.890789, 1, 0, 0, 1, 1,
-1.733694, -0.279581, -1.763226, 1, 0, 0, 1, 1,
-1.732927, -0.701309, -1.74111, 1, 0, 0, 1, 1,
-1.709391, 0.6147143, -1.729629, 1, 0, 0, 1, 1,
-1.685268, 0.01891987, -1.414039, 0, 0, 0, 1, 1,
-1.682605, 0.1098007, -1.547401, 0, 0, 0, 1, 1,
-1.660849, 0.7707194, -1.649336, 0, 0, 0, 1, 1,
-1.64076, -0.7474709, -1.856924, 0, 0, 0, 1, 1,
-1.630793, -0.2536687, 0.1161972, 0, 0, 0, 1, 1,
-1.617597, -1.251496, -2.67843, 0, 0, 0, 1, 1,
-1.612798, 0.4106205, -1.182364, 0, 0, 0, 1, 1,
-1.606591, -1.231122, -3.959956, 1, 1, 1, 1, 1,
-1.604486, -0.02290722, -2.174714, 1, 1, 1, 1, 1,
-1.58742, 0.7023688, 0.24809, 1, 1, 1, 1, 1,
-1.577225, 0.777975, -0.531959, 1, 1, 1, 1, 1,
-1.570277, 1.554122, -0.5102133, 1, 1, 1, 1, 1,
-1.537332, 0.7608014, -0.07907231, 1, 1, 1, 1, 1,
-1.529338, -1.202895, -1.443169, 1, 1, 1, 1, 1,
-1.509917, -0.1671088, -0.9769399, 1, 1, 1, 1, 1,
-1.503566, 0.7388623, -2.152358, 1, 1, 1, 1, 1,
-1.502074, -1.417806, -2.763686, 1, 1, 1, 1, 1,
-1.49609, 0.1146113, -0.7437884, 1, 1, 1, 1, 1,
-1.492806, -1.450914, -2.02608, 1, 1, 1, 1, 1,
-1.487545, 0.7399821, 0.2174691, 1, 1, 1, 1, 1,
-1.482583, -0.2204918, -1.606365, 1, 1, 1, 1, 1,
-1.47637, -0.7066604, -3.169616, 1, 1, 1, 1, 1,
-1.475666, -0.1979749, -2.689454, 0, 0, 1, 1, 1,
-1.471841, 0.09203535, -0.4066085, 1, 0, 0, 1, 1,
-1.460256, -1.086201, -2.357826, 1, 0, 0, 1, 1,
-1.456555, -1.141569, -1.311541, 1, 0, 0, 1, 1,
-1.454532, 0.2823667, 0.2402156, 1, 0, 0, 1, 1,
-1.446001, 0.3557581, 0.3536682, 1, 0, 0, 1, 1,
-1.445743, -0.6387381, -1.512056, 0, 0, 0, 1, 1,
-1.43111, 0.9240265, -1.353736, 0, 0, 0, 1, 1,
-1.42325, -0.9660763, 0.1546525, 0, 0, 0, 1, 1,
-1.412659, 0.1698442, -1.065432, 0, 0, 0, 1, 1,
-1.410419, 1.175546, -1.82631, 0, 0, 0, 1, 1,
-1.408027, 1.726241, -1.174027, 0, 0, 0, 1, 1,
-1.407261, -0.582863, -1.585809, 0, 0, 0, 1, 1,
-1.388426, -1.236159, -2.311147, 1, 1, 1, 1, 1,
-1.385345, -0.4855416, -1.395023, 1, 1, 1, 1, 1,
-1.382921, 1.886506, -1.285478, 1, 1, 1, 1, 1,
-1.379583, 1.151099, -3.451799, 1, 1, 1, 1, 1,
-1.370714, -0.5171491, -0.5816776, 1, 1, 1, 1, 1,
-1.368824, -0.9296891, -3.251693, 1, 1, 1, 1, 1,
-1.360596, -0.8538462, -1.418929, 1, 1, 1, 1, 1,
-1.357237, -2.495527, -1.545675, 1, 1, 1, 1, 1,
-1.355896, 0.5735989, -2.062663, 1, 1, 1, 1, 1,
-1.352169, -2.072127, -2.396165, 1, 1, 1, 1, 1,
-1.347424, 0.3292241, -1.113083, 1, 1, 1, 1, 1,
-1.328227, -1.146364, -2.441294, 1, 1, 1, 1, 1,
-1.328129, 1.477541, -0.4915454, 1, 1, 1, 1, 1,
-1.313605, 0.6725239, -0.05488221, 1, 1, 1, 1, 1,
-1.313277, 0.03233269, -1.194547, 1, 1, 1, 1, 1,
-1.310139, 0.9820153, 0.5262158, 0, 0, 1, 1, 1,
-1.300728, 0.8531849, 0.5803439, 1, 0, 0, 1, 1,
-1.283485, -0.3615146, -2.446026, 1, 0, 0, 1, 1,
-1.279937, -1.252848, -2.253138, 1, 0, 0, 1, 1,
-1.278502, 0.1526, 0.02351267, 1, 0, 0, 1, 1,
-1.278062, 0.945533, -0.9865857, 1, 0, 0, 1, 1,
-1.277922, -1.162615, -2.772984, 0, 0, 0, 1, 1,
-1.275023, 0.3268466, -3.401037, 0, 0, 0, 1, 1,
-1.272632, -0.1316555, -2.677548, 0, 0, 0, 1, 1,
-1.269677, -1.336723, -1.753591, 0, 0, 0, 1, 1,
-1.265932, -0.1171143, -0.357469, 0, 0, 0, 1, 1,
-1.263879, -0.7841486, -1.668787, 0, 0, 0, 1, 1,
-1.256347, 0.9050766, 0.3555069, 0, 0, 0, 1, 1,
-1.254933, -0.2094233, -3.803218, 1, 1, 1, 1, 1,
-1.252973, 0.7142996, 0.5101801, 1, 1, 1, 1, 1,
-1.250979, 0.527209, 0.7418107, 1, 1, 1, 1, 1,
-1.239287, -0.6236909, -2.76536, 1, 1, 1, 1, 1,
-1.236031, 0.4039815, -2.369215, 1, 1, 1, 1, 1,
-1.234288, -0.4925299, -1.589089, 1, 1, 1, 1, 1,
-1.227153, -0.179032, -1.642269, 1, 1, 1, 1, 1,
-1.226044, -0.03791922, -0.4226649, 1, 1, 1, 1, 1,
-1.215216, -0.08632351, -0.7137979, 1, 1, 1, 1, 1,
-1.207729, -0.6610306, -1.487777, 1, 1, 1, 1, 1,
-1.200529, 0.1814998, -1.961712, 1, 1, 1, 1, 1,
-1.198469, -1.158812, -1.64987, 1, 1, 1, 1, 1,
-1.19521, -1.029077, -3.289899, 1, 1, 1, 1, 1,
-1.182592, 0.3475459, -1.4177, 1, 1, 1, 1, 1,
-1.182311, -0.1834087, -3.366255, 1, 1, 1, 1, 1,
-1.1764, -2.320777, -2.950045, 0, 0, 1, 1, 1,
-1.165377, 0.6519579, -0.6629859, 1, 0, 0, 1, 1,
-1.159072, 0.7691637, -2.323297, 1, 0, 0, 1, 1,
-1.158569, -0.02542462, -1.446851, 1, 0, 0, 1, 1,
-1.151579, 1.411181, -2.065509, 1, 0, 0, 1, 1,
-1.139056, 0.1797498, -0.8745062, 1, 0, 0, 1, 1,
-1.138146, 1.294738, -1.913901, 0, 0, 0, 1, 1,
-1.133964, -0.1145973, 0.2810709, 0, 0, 0, 1, 1,
-1.117808, -0.4738346, -1.690687, 0, 0, 0, 1, 1,
-1.115387, -0.5906078, -2.811356, 0, 0, 0, 1, 1,
-1.114876, -0.5124616, -1.982057, 0, 0, 0, 1, 1,
-1.114001, 1.380889, 1.233669, 0, 0, 0, 1, 1,
-1.113458, -0.8769469, -2.174633, 0, 0, 0, 1, 1,
-1.100119, -0.395478, -0.2057181, 1, 1, 1, 1, 1,
-1.092926, 0.9756566, -0.3070965, 1, 1, 1, 1, 1,
-1.090086, -0.07366215, -2.834466, 1, 1, 1, 1, 1,
-1.088197, 0.4918978, -0.6800849, 1, 1, 1, 1, 1,
-1.087762, 1.190978, -1.362121, 1, 1, 1, 1, 1,
-1.080639, 0.3229001, -2.497598, 1, 1, 1, 1, 1,
-1.079496, 0.3284829, -0.9156445, 1, 1, 1, 1, 1,
-1.078242, -1.005353, -2.048587, 1, 1, 1, 1, 1,
-1.075758, -2.228059, -2.399461, 1, 1, 1, 1, 1,
-1.074935, 1.515049, 0.4970094, 1, 1, 1, 1, 1,
-1.067885, -1.671268, -4.226638, 1, 1, 1, 1, 1,
-1.057965, 1.546241, -2.424625, 1, 1, 1, 1, 1,
-1.045968, -0.7684215, -1.519451, 1, 1, 1, 1, 1,
-1.04561, -0.02157807, -3.139129, 1, 1, 1, 1, 1,
-1.044773, -0.1607033, -0.1517623, 1, 1, 1, 1, 1,
-1.042388, 0.3457626, -0.4815426, 0, 0, 1, 1, 1,
-1.033724, 0.6258514, -3.60841, 1, 0, 0, 1, 1,
-1.031606, 0.4406308, -1.625456, 1, 0, 0, 1, 1,
-1.028909, 0.9349493, -0.6773862, 1, 0, 0, 1, 1,
-1.016749, 0.4517546, -0.2403923, 1, 0, 0, 1, 1,
-1.014147, 1.048171, -0.1960987, 1, 0, 0, 1, 1,
-0.997269, 0.150377, -0.6476772, 0, 0, 0, 1, 1,
-0.9960803, 0.3482275, -0.2559094, 0, 0, 0, 1, 1,
-0.9923778, 1.327536, -0.577524, 0, 0, 0, 1, 1,
-0.9922948, 1.20418, -0.1931492, 0, 0, 0, 1, 1,
-0.9900582, -1.197966, -0.4529108, 0, 0, 0, 1, 1,
-0.9894307, 0.02424852, -2.706272, 0, 0, 0, 1, 1,
-0.9863076, -0.4917243, -2.961804, 0, 0, 0, 1, 1,
-0.9847212, -0.05976833, -0.8839149, 1, 1, 1, 1, 1,
-0.9840496, 0.1506669, -1.418319, 1, 1, 1, 1, 1,
-0.9800369, 0.9664074, -0.4221861, 1, 1, 1, 1, 1,
-0.9789538, 0.4035702, 0.6726225, 1, 1, 1, 1, 1,
-0.978352, 0.3832454, -1.757621, 1, 1, 1, 1, 1,
-0.9662098, 0.6654617, -2.195365, 1, 1, 1, 1, 1,
-0.9652577, 0.4203168, -1.491733, 1, 1, 1, 1, 1,
-0.9650241, -0.6398507, -3.301384, 1, 1, 1, 1, 1,
-0.9648162, 0.2053133, -1.043182, 1, 1, 1, 1, 1,
-0.9644812, -0.1604459, -1.364075, 1, 1, 1, 1, 1,
-0.9611104, -0.3039242, -3.858942, 1, 1, 1, 1, 1,
-0.9520738, -0.2830002, -2.619029, 1, 1, 1, 1, 1,
-0.9501995, -0.7481342, -2.045877, 1, 1, 1, 1, 1,
-0.948168, -0.3595415, -4.600947, 1, 1, 1, 1, 1,
-0.941308, 0.1657404, -1.358852, 1, 1, 1, 1, 1,
-0.9362119, 0.1842515, -1.07151, 0, 0, 1, 1, 1,
-0.9355643, -1.013483, -2.203884, 1, 0, 0, 1, 1,
-0.9271124, -0.3828374, -2.12788, 1, 0, 0, 1, 1,
-0.9252084, -0.8683237, -1.766575, 1, 0, 0, 1, 1,
-0.9237723, 0.3335814, -1.462085, 1, 0, 0, 1, 1,
-0.9203271, -0.5955616, -2.421913, 1, 0, 0, 1, 1,
-0.9171057, -0.6849889, -1.841209, 0, 0, 0, 1, 1,
-0.914641, 1.293139, 0.617849, 0, 0, 0, 1, 1,
-0.9085996, -0.8402983, -2.606513, 0, 0, 0, 1, 1,
-0.9067223, 1.397746, -0.7836897, 0, 0, 0, 1, 1,
-0.8980692, 2.131205, 0.4513319, 0, 0, 0, 1, 1,
-0.8808626, -0.04413684, -0.461828, 0, 0, 0, 1, 1,
-0.8808041, -0.5785942, -2.144228, 0, 0, 0, 1, 1,
-0.8800302, 0.1006744, -1.10735, 1, 1, 1, 1, 1,
-0.8774121, -1.262093, -2.623192, 1, 1, 1, 1, 1,
-0.8746899, 0.6029294, -0.6853449, 1, 1, 1, 1, 1,
-0.8719736, 0.4402646, -1.470133, 1, 1, 1, 1, 1,
-0.8708186, -1.023983, -2.751493, 1, 1, 1, 1, 1,
-0.8698718, 0.2894243, -0.001828404, 1, 1, 1, 1, 1,
-0.8688754, -1.367928, -2.920573, 1, 1, 1, 1, 1,
-0.8651692, 0.8497561, -0.7841178, 1, 1, 1, 1, 1,
-0.8576514, -0.8537818, -2.080991, 1, 1, 1, 1, 1,
-0.8543656, 1.081709, -0.9974121, 1, 1, 1, 1, 1,
-0.8521295, 1.385079, -0.3345579, 1, 1, 1, 1, 1,
-0.8452441, 1.531584, 0.03618892, 1, 1, 1, 1, 1,
-0.8366775, 0.8598111, 0.005183199, 1, 1, 1, 1, 1,
-0.8339837, -1.144327, -2.257829, 1, 1, 1, 1, 1,
-0.8333442, 0.4745807, -1.277261, 1, 1, 1, 1, 1,
-0.8321624, 1.225779, -0.8832803, 0, 0, 1, 1, 1,
-0.8318307, 1.303885, 0.169536, 1, 0, 0, 1, 1,
-0.8263542, -0.417896, -1.940113, 1, 0, 0, 1, 1,
-0.8261758, 0.5209285, -0.3909917, 1, 0, 0, 1, 1,
-0.8259267, -0.5607922, -2.974504, 1, 0, 0, 1, 1,
-0.8217943, -1.806643, -0.2892831, 1, 0, 0, 1, 1,
-0.8208716, -0.7979376, -2.192102, 0, 0, 0, 1, 1,
-0.820358, -0.5682824, -3.014613, 0, 0, 0, 1, 1,
-0.8141867, 1.716728, -1.371514, 0, 0, 0, 1, 1,
-0.812038, -0.1469059, -0.5579676, 0, 0, 0, 1, 1,
-0.8045919, 0.540673, 0.131886, 0, 0, 0, 1, 1,
-0.7970681, -1.559637, -2.793512, 0, 0, 0, 1, 1,
-0.7961954, -0.6666932, -1.436523, 0, 0, 0, 1, 1,
-0.7902789, 1.255212, 0.08370467, 1, 1, 1, 1, 1,
-0.7866072, 2.846456, -1.086172, 1, 1, 1, 1, 1,
-0.7844324, -0.2835011, -2.660247, 1, 1, 1, 1, 1,
-0.7840954, -0.2146344, -0.9609568, 1, 1, 1, 1, 1,
-0.7824459, -0.1702162, -2.538146, 1, 1, 1, 1, 1,
-0.7770317, -0.9991555, -2.261938, 1, 1, 1, 1, 1,
-0.776437, -0.1702678, -0.9785383, 1, 1, 1, 1, 1,
-0.7723137, 1.257255, 0.06627514, 1, 1, 1, 1, 1,
-0.7606803, -0.6121506, -2.79978, 1, 1, 1, 1, 1,
-0.7606003, 0.6531127, -0.1670839, 1, 1, 1, 1, 1,
-0.7591698, -1.17265, -0.3517084, 1, 1, 1, 1, 1,
-0.7566335, 1.490528, 0.03815991, 1, 1, 1, 1, 1,
-0.7560076, 0.174797, -3.13427, 1, 1, 1, 1, 1,
-0.7549257, 0.4902477, -0.8084458, 1, 1, 1, 1, 1,
-0.7483575, 0.1588497, 0.8331344, 1, 1, 1, 1, 1,
-0.7481828, 0.7137139, 0.1906176, 0, 0, 1, 1, 1,
-0.7470739, -0.7941402, -2.500052, 1, 0, 0, 1, 1,
-0.7430744, -0.1759853, -2.22479, 1, 0, 0, 1, 1,
-0.7390175, 0.3220184, -2.179054, 1, 0, 0, 1, 1,
-0.7380542, 0.3914009, 0.2730227, 1, 0, 0, 1, 1,
-0.7376314, 0.6480144, -2.078111, 1, 0, 0, 1, 1,
-0.7313303, 1.138347, -1.546211, 0, 0, 0, 1, 1,
-0.7301593, -0.3730913, -2.785034, 0, 0, 0, 1, 1,
-0.7296115, 0.9511876, -0.8898771, 0, 0, 0, 1, 1,
-0.7269581, 0.6176991, -2.20492, 0, 0, 0, 1, 1,
-0.7254131, 1.953754, -1.208438, 0, 0, 0, 1, 1,
-0.7221909, -0.3901492, -3.523383, 0, 0, 0, 1, 1,
-0.718895, -0.9093721, -3.60986, 0, 0, 0, 1, 1,
-0.7186783, 0.8390877, -0.6207405, 1, 1, 1, 1, 1,
-0.717911, -0.9766785, -2.570107, 1, 1, 1, 1, 1,
-0.7154918, 0.09943072, -2.207738, 1, 1, 1, 1, 1,
-0.7143744, 0.4179438, 0.8566154, 1, 1, 1, 1, 1,
-0.7124218, 0.1341039, -2.006764, 1, 1, 1, 1, 1,
-0.7066441, 1.249461, 0.5490046, 1, 1, 1, 1, 1,
-0.704088, -0.3869767, -0.0868483, 1, 1, 1, 1, 1,
-0.7014903, 0.4302595, -0.3594056, 1, 1, 1, 1, 1,
-0.6896585, 0.3887709, -1.264047, 1, 1, 1, 1, 1,
-0.686775, -0.6773285, -2.725032, 1, 1, 1, 1, 1,
-0.6866496, -0.3489142, -2.63332, 1, 1, 1, 1, 1,
-0.6861417, -1.69696, -6.132728, 1, 1, 1, 1, 1,
-0.6816208, -0.7519596, -2.067389, 1, 1, 1, 1, 1,
-0.677722, -0.9945111, -2.177164, 1, 1, 1, 1, 1,
-0.6750913, -0.2681106, -3.544078, 1, 1, 1, 1, 1,
-0.6722397, -1.190416, -3.375947, 0, 0, 1, 1, 1,
-0.6672965, -1.009534, -3.524813, 1, 0, 0, 1, 1,
-0.6656113, 0.1448619, -2.125511, 1, 0, 0, 1, 1,
-0.6580685, 1.577824, -1.008512, 1, 0, 0, 1, 1,
-0.6567325, -0.6543835, -3.507244, 1, 0, 0, 1, 1,
-0.6516726, -1.05463, -0.8502888, 1, 0, 0, 1, 1,
-0.6478274, 0.9140106, -2.343989, 0, 0, 0, 1, 1,
-0.6468135, 0.4356104, -1.663617, 0, 0, 0, 1, 1,
-0.6449469, -1.838865, -2.546697, 0, 0, 0, 1, 1,
-0.6400201, 0.3421678, -0.5624844, 0, 0, 0, 1, 1,
-0.6395676, 0.01492194, 0.7069983, 0, 0, 0, 1, 1,
-0.6381829, -0.1290342, -0.6580923, 0, 0, 0, 1, 1,
-0.6296456, 0.4883611, -0.847047, 0, 0, 0, 1, 1,
-0.6251606, 0.4309493, -1.41311, 1, 1, 1, 1, 1,
-0.6208437, 2.043157, 0.3472382, 1, 1, 1, 1, 1,
-0.6182518, -1.638423, -3.042817, 1, 1, 1, 1, 1,
-0.6171637, 0.2603824, -1.371487, 1, 1, 1, 1, 1,
-0.6167893, -0.3405182, -1.687288, 1, 1, 1, 1, 1,
-0.6147782, -1.358019, -2.839418, 1, 1, 1, 1, 1,
-0.6094519, -1.113188, -3.972252, 1, 1, 1, 1, 1,
-0.6080247, 0.3726175, -0.5452513, 1, 1, 1, 1, 1,
-0.6028204, 0.8196318, -2.401921, 1, 1, 1, 1, 1,
-0.6000242, 0.3150393, 0.5118355, 1, 1, 1, 1, 1,
-0.5997465, 0.5090887, -2.025907, 1, 1, 1, 1, 1,
-0.5997382, 1.173631, -0.7865573, 1, 1, 1, 1, 1,
-0.5995747, -0.9895381, -2.216978, 1, 1, 1, 1, 1,
-0.5991763, 0.4132106, -0.6218505, 1, 1, 1, 1, 1,
-0.5965004, -0.141074, -1.108577, 1, 1, 1, 1, 1,
-0.5933753, 1.221512, -1.027503, 0, 0, 1, 1, 1,
-0.5909119, -0.9458179, -3.080249, 1, 0, 0, 1, 1,
-0.5851835, 0.5509734, -1.207664, 1, 0, 0, 1, 1,
-0.5831341, -0.3448186, -4.49763, 1, 0, 0, 1, 1,
-0.5829808, 0.758238, -1.261821, 1, 0, 0, 1, 1,
-0.5809427, 2.026738, 0.6385254, 1, 0, 0, 1, 1,
-0.5798523, -0.3674609, -2.071882, 0, 0, 0, 1, 1,
-0.5709846, 1.317402, 0.7978611, 0, 0, 0, 1, 1,
-0.5681115, -0.8776013, -1.781259, 0, 0, 0, 1, 1,
-0.5665018, -1.094852, -1.671438, 0, 0, 0, 1, 1,
-0.562888, -0.5155462, -3.256081, 0, 0, 0, 1, 1,
-0.5527545, 1.093776, -0.7973824, 0, 0, 0, 1, 1,
-0.5493197, -0.03861979, -2.123671, 0, 0, 0, 1, 1,
-0.5473304, -1.454589, -2.633979, 1, 1, 1, 1, 1,
-0.5466828, 0.04274968, -0.3950244, 1, 1, 1, 1, 1,
-0.5453414, 0.2926143, -1.694935, 1, 1, 1, 1, 1,
-0.541879, -1.877771, -4.206644, 1, 1, 1, 1, 1,
-0.5406668, -1.00672, -1.161254, 1, 1, 1, 1, 1,
-0.5375907, -0.5274942, -2.292969, 1, 1, 1, 1, 1,
-0.5289772, 0.7797917, -1.01374, 1, 1, 1, 1, 1,
-0.5213072, 0.3409095, -2.627094, 1, 1, 1, 1, 1,
-0.5212926, 1.214943, 0.2898585, 1, 1, 1, 1, 1,
-0.520622, 0.0007637437, -1.867044, 1, 1, 1, 1, 1,
-0.5160143, -0.5979579, -1.715461, 1, 1, 1, 1, 1,
-0.5132129, -0.4362936, -2.537475, 1, 1, 1, 1, 1,
-0.5125942, -0.7706516, -2.396896, 1, 1, 1, 1, 1,
-0.5119618, 0.4919172, -0.7603546, 1, 1, 1, 1, 1,
-0.5109637, 0.7874693, 0.785534, 1, 1, 1, 1, 1,
-0.5093859, 0.5864002, -0.821471, 0, 0, 1, 1, 1,
-0.5091353, -0.7173204, -3.26219, 1, 0, 0, 1, 1,
-0.5079263, 0.2141692, -0.3370414, 1, 0, 0, 1, 1,
-0.5059186, -0.03407457, -2.454179, 1, 0, 0, 1, 1,
-0.5018835, 0.921476, -1.067706, 1, 0, 0, 1, 1,
-0.4952409, -2.105642, -2.801125, 1, 0, 0, 1, 1,
-0.4939171, -0.9684306, -2.200493, 0, 0, 0, 1, 1,
-0.4927666, 0.1870489, -1.658062, 0, 0, 0, 1, 1,
-0.4914248, -0.6927074, -1.965155, 0, 0, 0, 1, 1,
-0.490121, -1.214792, -3.002626, 0, 0, 0, 1, 1,
-0.4894876, 0.0733084, -0.6504214, 0, 0, 0, 1, 1,
-0.4868555, 0.2526472, -2.013747, 0, 0, 0, 1, 1,
-0.486289, 0.9443005, -0.250774, 0, 0, 0, 1, 1,
-0.4862044, 0.6729853, 0.2489164, 1, 1, 1, 1, 1,
-0.4840081, -0.5918375, -3.603344, 1, 1, 1, 1, 1,
-0.4801611, -0.8190672, -2.957529, 1, 1, 1, 1, 1,
-0.4792039, 0.2147102, 0.6535305, 1, 1, 1, 1, 1,
-0.4710721, 0.4255007, -2.284186, 1, 1, 1, 1, 1,
-0.4682781, 0.7738172, -2.233398, 1, 1, 1, 1, 1,
-0.4669722, -0.1979237, -3.454497, 1, 1, 1, 1, 1,
-0.46372, -2.690894, -1.277694, 1, 1, 1, 1, 1,
-0.4542922, 0.4684863, -3.186849, 1, 1, 1, 1, 1,
-0.4506575, 0.3495592, -1.686222, 1, 1, 1, 1, 1,
-0.450582, -0.2484837, -2.585048, 1, 1, 1, 1, 1,
-0.4487503, 0.5689654, -2.643655, 1, 1, 1, 1, 1,
-0.445636, 0.7140826, -1.931124, 1, 1, 1, 1, 1,
-0.4396364, -1.034922, -2.809283, 1, 1, 1, 1, 1,
-0.4339152, 0.9905759, 0.4787037, 1, 1, 1, 1, 1,
-0.4306494, 0.1491783, -0.4044442, 0, 0, 1, 1, 1,
-0.4269131, 0.0270884, -3.144484, 1, 0, 0, 1, 1,
-0.4250188, -1.059003, -3.730802, 1, 0, 0, 1, 1,
-0.4246231, -0.6620858, -4.112656, 1, 0, 0, 1, 1,
-0.4240719, -0.8722422, -2.214308, 1, 0, 0, 1, 1,
-0.423464, 1.479277, -0.184238, 1, 0, 0, 1, 1,
-0.418578, -0.525118, -1.514533, 0, 0, 0, 1, 1,
-0.4184497, 2.500705, -1.026364, 0, 0, 0, 1, 1,
-0.4122894, -1.463853, -3.589316, 0, 0, 0, 1, 1,
-0.4117948, -0.03013763, -0.3258197, 0, 0, 0, 1, 1,
-0.4117026, -0.2705203, -1.211484, 0, 0, 0, 1, 1,
-0.4026992, -1.025872, -3.584726, 0, 0, 0, 1, 1,
-0.3982768, -0.3653592, -1.941578, 0, 0, 0, 1, 1,
-0.3957773, -2.084013, -3.675834, 1, 1, 1, 1, 1,
-0.3955968, 0.3708124, -1.163397, 1, 1, 1, 1, 1,
-0.3924742, -0.4090368, -1.809465, 1, 1, 1, 1, 1,
-0.389289, -0.6804547, -2.89866, 1, 1, 1, 1, 1,
-0.3852679, -1.768293, -2.587686, 1, 1, 1, 1, 1,
-0.3839519, 0.8499662, -2.375004, 1, 1, 1, 1, 1,
-0.3836199, 0.205168, -0.3699913, 1, 1, 1, 1, 1,
-0.3810564, 0.2594629, -0.7730635, 1, 1, 1, 1, 1,
-0.3792859, 1.247701, 1.027324, 1, 1, 1, 1, 1,
-0.376914, 0.1241542, -0.1333434, 1, 1, 1, 1, 1,
-0.3768223, -1.283435, -3.001992, 1, 1, 1, 1, 1,
-0.3752098, -0.1062017, -1.387698, 1, 1, 1, 1, 1,
-0.3748983, 0.7167274, -0.4058601, 1, 1, 1, 1, 1,
-0.3711099, 1.054829, -0.5456215, 1, 1, 1, 1, 1,
-0.3694516, -1.608343, -2.566348, 1, 1, 1, 1, 1,
-0.3650143, 1.854341, -0.2816889, 0, 0, 1, 1, 1,
-0.3618259, 0.8838744, -0.9854524, 1, 0, 0, 1, 1,
-0.361717, 0.6436609, -2.530983, 1, 0, 0, 1, 1,
-0.3596103, 0.07411496, -1.585739, 1, 0, 0, 1, 1,
-0.3562514, 0.1135684, -1.326724, 1, 0, 0, 1, 1,
-0.3544723, 0.2678978, 0.04670794, 1, 0, 0, 1, 1,
-0.3536076, 1.371177, 0.6134295, 0, 0, 0, 1, 1,
-0.3534214, 0.2300595, -1.117197, 0, 0, 0, 1, 1,
-0.3531984, -1.029738, -1.79568, 0, 0, 0, 1, 1,
-0.3509443, 0.6125252, 0.1478833, 0, 0, 0, 1, 1,
-0.3499907, -0.3024352, 0.1619789, 0, 0, 0, 1, 1,
-0.3448078, -0.7237737, -1.352912, 0, 0, 0, 1, 1,
-0.3426017, -0.9619647, -1.204212, 0, 0, 0, 1, 1,
-0.3411805, -0.4817165, -1.910387, 1, 1, 1, 1, 1,
-0.337851, -1.534018, -3.213157, 1, 1, 1, 1, 1,
-0.3370507, -1.723183, -2.003346, 1, 1, 1, 1, 1,
-0.3358078, 0.1199314, -2.30235, 1, 1, 1, 1, 1,
-0.3350877, -1.462899, -1.036393, 1, 1, 1, 1, 1,
-0.3335308, 0.8580249, 0.1632395, 1, 1, 1, 1, 1,
-0.3315641, 1.107081, 0.2537133, 1, 1, 1, 1, 1,
-0.3291243, 0.8213592, -1.235632, 1, 1, 1, 1, 1,
-0.3271457, 0.2193649, -0.2901088, 1, 1, 1, 1, 1,
-0.3256014, -0.3744871, -1.97952, 1, 1, 1, 1, 1,
-0.3224187, 1.176321, -0.9934665, 1, 1, 1, 1, 1,
-0.3214946, 1.574257, 0.9673234, 1, 1, 1, 1, 1,
-0.3209628, 0.1050693, -1.146199, 1, 1, 1, 1, 1,
-0.3078727, 1.357706, -0.2608411, 1, 1, 1, 1, 1,
-0.3074318, 0.03609794, 0.01970583, 1, 1, 1, 1, 1,
-0.3040917, 0.4298775, -1.906483, 0, 0, 1, 1, 1,
-0.2985628, -2.294447, -2.624703, 1, 0, 0, 1, 1,
-0.2961577, -0.967779, -3.691546, 1, 0, 0, 1, 1,
-0.293624, -1.197563, -3.773817, 1, 0, 0, 1, 1,
-0.2924913, -0.7694695, -1.653611, 1, 0, 0, 1, 1,
-0.2915363, 0.1646118, -0.3778267, 1, 0, 0, 1, 1,
-0.29109, -1.38823, -2.59256, 0, 0, 0, 1, 1,
-0.2875833, -2.109527, -1.606342, 0, 0, 0, 1, 1,
-0.2860838, 0.7614781, -0.4478502, 0, 0, 0, 1, 1,
-0.2858141, 0.6400551, 0.09561859, 0, 0, 0, 1, 1,
-0.282208, 0.4819041, -0.04037395, 0, 0, 0, 1, 1,
-0.2790601, 0.5609279, 1.856908, 0, 0, 0, 1, 1,
-0.2785581, -1.584057, -3.219367, 0, 0, 0, 1, 1,
-0.2764696, -1.162239, -2.973294, 1, 1, 1, 1, 1,
-0.2756335, -0.4012845, -2.249619, 1, 1, 1, 1, 1,
-0.2750222, 0.2544679, 0.9618753, 1, 1, 1, 1, 1,
-0.2725815, -0.7684173, -2.786721, 1, 1, 1, 1, 1,
-0.2724641, 1.070442, 1.182861, 1, 1, 1, 1, 1,
-0.2718113, 1.148662, 0.3388832, 1, 1, 1, 1, 1,
-0.2693577, 1.355303, -0.8677027, 1, 1, 1, 1, 1,
-0.2691879, 0.5037002, -0.5077021, 1, 1, 1, 1, 1,
-0.2685622, -0.9466015, -1.48767, 1, 1, 1, 1, 1,
-0.2661489, -0.4123595, -3.815222, 1, 1, 1, 1, 1,
-0.2645292, 0.9765955, 2.000755, 1, 1, 1, 1, 1,
-0.2575476, -1.203827, -0.1788707, 1, 1, 1, 1, 1,
-0.2572276, -1.563235, -3.427934, 1, 1, 1, 1, 1,
-0.2570968, 0.1341557, 0.3375426, 1, 1, 1, 1, 1,
-0.251191, -1.225343, -2.754157, 1, 1, 1, 1, 1,
-0.2494235, -0.203144, -0.8640103, 0, 0, 1, 1, 1,
-0.2491756, 0.8586415, 0.01755913, 1, 0, 0, 1, 1,
-0.2476919, -0.1390908, -3.598434, 1, 0, 0, 1, 1,
-0.2443389, 0.6092734, 0.5537354, 1, 0, 0, 1, 1,
-0.241873, -1.478939, -2.215383, 1, 0, 0, 1, 1,
-0.2340034, 0.7694435, 0.09006966, 1, 0, 0, 1, 1,
-0.2333312, 0.001507348, -0.1190744, 0, 0, 0, 1, 1,
-0.2319293, -1.047169, -2.404264, 0, 0, 0, 1, 1,
-0.2299102, 2.245076, 0.7024736, 0, 0, 0, 1, 1,
-0.2253082, -0.4844838, -4.294177, 0, 0, 0, 1, 1,
-0.2251111, -1.13968, -4.268444, 0, 0, 0, 1, 1,
-0.2197113, 0.7769748, -0.4055002, 0, 0, 0, 1, 1,
-0.2177934, -1.66074, -2.843676, 0, 0, 0, 1, 1,
-0.217357, -0.06298004, -1.235952, 1, 1, 1, 1, 1,
-0.2171798, -0.1792352, -1.064401, 1, 1, 1, 1, 1,
-0.2166247, -0.7577631, -2.1985, 1, 1, 1, 1, 1,
-0.215745, 0.06162301, -2.886461, 1, 1, 1, 1, 1,
-0.2153877, -1.375788, -3.559135, 1, 1, 1, 1, 1,
-0.2110068, -2.397502, -4.766038, 1, 1, 1, 1, 1,
-0.2104211, 1.083291, 0.7441314, 1, 1, 1, 1, 1,
-0.2101208, -0.629941, -2.08274, 1, 1, 1, 1, 1,
-0.2073727, -1.352065, -2.712107, 1, 1, 1, 1, 1,
-0.2069579, 1.195576, 2.429316, 1, 1, 1, 1, 1,
-0.205812, -0.4446135, -2.807039, 1, 1, 1, 1, 1,
-0.1932845, 1.636255, 1.108178, 1, 1, 1, 1, 1,
-0.1841632, -2.502996, -5.212195, 1, 1, 1, 1, 1,
-0.1810851, 1.282319, -1.184852, 1, 1, 1, 1, 1,
-0.1769739, -0.2989628, -1.411154, 1, 1, 1, 1, 1,
-0.1695509, 0.06263614, -1.388498, 0, 0, 1, 1, 1,
-0.1679654, -2.627594, -3.196982, 1, 0, 0, 1, 1,
-0.1678464, -0.6114786, -2.352934, 1, 0, 0, 1, 1,
-0.1667631, 1.075947, -1.731973, 1, 0, 0, 1, 1,
-0.1662284, -0.4112185, -3.625702, 1, 0, 0, 1, 1,
-0.1662132, 0.08971658, -1.291482, 1, 0, 0, 1, 1,
-0.1635858, 1.184504, -0.6920683, 0, 0, 0, 1, 1,
-0.1570809, 1.291846, 1.296208, 0, 0, 0, 1, 1,
-0.1529766, 0.2305464, 0.2171897, 0, 0, 0, 1, 1,
-0.1529239, 0.2473302, -0.6237505, 0, 0, 0, 1, 1,
-0.1486863, 1.604371, -0.6180856, 0, 0, 0, 1, 1,
-0.1478828, -0.2467034, -4.285594, 0, 0, 0, 1, 1,
-0.1442881, -0.8072237, -1.963445, 0, 0, 0, 1, 1,
-0.136431, 0.1927174, -1.487567, 1, 1, 1, 1, 1,
-0.1330598, -0.5089436, -3.264402, 1, 1, 1, 1, 1,
-0.1283054, 0.1105818, -2.212857, 1, 1, 1, 1, 1,
-0.12166, 0.05704388, -1.14658, 1, 1, 1, 1, 1,
-0.1212945, -1.349527, -4.813539, 1, 1, 1, 1, 1,
-0.1212153, 0.3638019, -0.8508528, 1, 1, 1, 1, 1,
-0.1211619, 0.1886022, 0.5704269, 1, 1, 1, 1, 1,
-0.120077, 0.3593368, -0.8568823, 1, 1, 1, 1, 1,
-0.1161873, 0.08437435, 0.1692961, 1, 1, 1, 1, 1,
-0.1097619, 1.131349, -0.7274799, 1, 1, 1, 1, 1,
-0.1091357, -0.2802518, -2.970751, 1, 1, 1, 1, 1,
-0.1076064, -0.008087354, -1.726648, 1, 1, 1, 1, 1,
-0.1055729, -1.062712, -2.791604, 1, 1, 1, 1, 1,
-0.1042415, 0.4583042, 0.1674932, 1, 1, 1, 1, 1,
-0.1036975, 1.877309, -0.6029089, 1, 1, 1, 1, 1,
-0.09880517, -0.2198379, -2.92341, 0, 0, 1, 1, 1,
-0.0943855, -1.055194, -3.534289, 1, 0, 0, 1, 1,
-0.0932845, 0.6016262, -0.1980963, 1, 0, 0, 1, 1,
-0.08836336, 1.100953, -1.364408, 1, 0, 0, 1, 1,
-0.07602213, 0.6465389, -0.1317803, 1, 0, 0, 1, 1,
-0.07595692, 1.321506, -0.2343251, 1, 0, 0, 1, 1,
-0.07540113, -0.1491188, -4.49354, 0, 0, 0, 1, 1,
-0.0728024, 1.159245, -1.377042, 0, 0, 0, 1, 1,
-0.0627588, 0.7510913, -0.3578972, 0, 0, 0, 1, 1,
-0.06205159, -1.912031, -3.833066, 0, 0, 0, 1, 1,
-0.06068827, 0.07056059, 0.02619172, 0, 0, 0, 1, 1,
-0.05753904, 0.2686335, -0.9254364, 0, 0, 0, 1, 1,
-0.05537998, 0.4356315, 0.3049825, 0, 0, 0, 1, 1,
-0.04889431, -0.8948151, -4.237842, 1, 1, 1, 1, 1,
-0.04816064, 2.076612, 1.142786, 1, 1, 1, 1, 1,
-0.04524785, -1.233299, -5.468054, 1, 1, 1, 1, 1,
-0.04444472, 0.5448044, -1.155928, 1, 1, 1, 1, 1,
-0.04216824, -1.380818, -3.183292, 1, 1, 1, 1, 1,
-0.04212445, 0.109119, -1.684335, 1, 1, 1, 1, 1,
-0.04121446, -0.8883178, -3.015709, 1, 1, 1, 1, 1,
-0.03895054, -0.4416896, -2.512504, 1, 1, 1, 1, 1,
-0.03759648, 0.1755881, 0.4489288, 1, 1, 1, 1, 1,
-0.0371003, -0.9143862, -3.885345, 1, 1, 1, 1, 1,
-0.03298412, 0.4565057, -0.1748687, 1, 1, 1, 1, 1,
-0.03281746, 1.34421, -0.4113199, 1, 1, 1, 1, 1,
-0.03091165, -0.9306468, -3.01568, 1, 1, 1, 1, 1,
-0.03034307, -0.6091917, -2.571824, 1, 1, 1, 1, 1,
-0.02832109, 0.2443682, 0.3970485, 1, 1, 1, 1, 1,
-0.02807816, -1.554537, -3.958376, 0, 0, 1, 1, 1,
-0.02798281, 1.496376, 0.8308898, 1, 0, 0, 1, 1,
-0.02732691, -2.844669, -3.679333, 1, 0, 0, 1, 1,
-0.02568728, 0.2374151, -1.376342, 1, 0, 0, 1, 1,
-0.0252826, -1.505806, -3.586116, 1, 0, 0, 1, 1,
-0.02446755, 0.1054626, -0.01267602, 1, 0, 0, 1, 1,
-0.02398203, 0.8431559, 0.6997046, 0, 0, 0, 1, 1,
-0.02279318, 0.9261081, -1.124006, 0, 0, 0, 1, 1,
-0.02028038, -1.230109, -1.981626, 0, 0, 0, 1, 1,
-0.01146612, -0.5972789, -2.216202, 0, 0, 0, 1, 1,
-0.01054453, 2.022332, 0.7203435, 0, 0, 0, 1, 1,
-0.01033559, -0.985671, -3.69541, 0, 0, 0, 1, 1,
-0.0002172753, 0.7143308, 0.4355396, 0, 0, 0, 1, 1,
0.0004266519, 0.1280101, 0.5499339, 1, 1, 1, 1, 1,
0.00134051, -0.6496964, 3.506294, 1, 1, 1, 1, 1,
0.002626092, -0.3121472, 4.232818, 1, 1, 1, 1, 1,
0.00798511, 0.2407044, 0.5146198, 1, 1, 1, 1, 1,
0.008822058, -0.04757541, 3.293377, 1, 1, 1, 1, 1,
0.009070277, 0.1284612, 1.80348, 1, 1, 1, 1, 1,
0.01026621, -1.252718, 2.833591, 1, 1, 1, 1, 1,
0.01026714, 0.8236782, -0.5479742, 1, 1, 1, 1, 1,
0.0104629, 0.7256128, 0.5061535, 1, 1, 1, 1, 1,
0.01642784, -0.2733643, 1.831172, 1, 1, 1, 1, 1,
0.01699782, 0.8145515, -0.6325783, 1, 1, 1, 1, 1,
0.01929596, 1.00943, -1.589794, 1, 1, 1, 1, 1,
0.01971739, -0.6703348, 2.988609, 1, 1, 1, 1, 1,
0.02472384, 1.180215, -1.7821, 1, 1, 1, 1, 1,
0.02631959, -0.4358526, 1.490148, 1, 1, 1, 1, 1,
0.02679948, -1.294891, 4.819904, 0, 0, 1, 1, 1,
0.02878471, 2.466297, -1.072165, 1, 0, 0, 1, 1,
0.02887491, 1.043904, 0.4593734, 1, 0, 0, 1, 1,
0.03148358, -2.021428, 4.057474, 1, 0, 0, 1, 1,
0.03180479, 0.4908859, -0.807656, 1, 0, 0, 1, 1,
0.03397563, 0.8336621, -0.4684562, 1, 0, 0, 1, 1,
0.03744754, 0.7644715, 1.089604, 0, 0, 0, 1, 1,
0.03749479, 0.8375949, -1.877506, 0, 0, 0, 1, 1,
0.04478191, 1.092203, -0.535272, 0, 0, 0, 1, 1,
0.0482608, 0.5417584, 1.038444, 0, 0, 0, 1, 1,
0.05044646, 0.2851207, -1.078562, 0, 0, 0, 1, 1,
0.06417595, 0.004387888, -0.04498596, 0, 0, 0, 1, 1,
0.06608485, -0.5994951, 3.647234, 0, 0, 0, 1, 1,
0.06723682, -0.5381678, 2.764975, 1, 1, 1, 1, 1,
0.06833646, 1.571638, 0.4872212, 1, 1, 1, 1, 1,
0.06930999, 0.4982873, -0.6569915, 1, 1, 1, 1, 1,
0.06981404, -0.6991836, 3.449624, 1, 1, 1, 1, 1,
0.07698692, -0.5672414, 3.639923, 1, 1, 1, 1, 1,
0.07722158, -0.358029, 4.0488, 1, 1, 1, 1, 1,
0.07911127, -0.8019645, 4.2122, 1, 1, 1, 1, 1,
0.07979558, -0.9746144, 2.352159, 1, 1, 1, 1, 1,
0.08557183, 0.4674105, -0.112401, 1, 1, 1, 1, 1,
0.09256025, 1.155862, -0.3250408, 1, 1, 1, 1, 1,
0.09786668, -0.1228058, 1.700037, 1, 1, 1, 1, 1,
0.09997384, 0.5718129, 0.03395477, 1, 1, 1, 1, 1,
0.1041392, -1.015752, 2.049165, 1, 1, 1, 1, 1,
0.1047926, -0.1826702, 3.147365, 1, 1, 1, 1, 1,
0.1061805, -1.12557, 2.667454, 1, 1, 1, 1, 1,
0.1063104, 0.3731949, 1.535255, 0, 0, 1, 1, 1,
0.1064346, 0.6240216, 0.3117985, 1, 0, 0, 1, 1,
0.1066945, -0.5662588, 4.292763, 1, 0, 0, 1, 1,
0.1152075, -0.06169597, 1.699458, 1, 0, 0, 1, 1,
0.1303679, -1.212283, 3.046846, 1, 0, 0, 1, 1,
0.1322927, -0.2077925, 3.486361, 1, 0, 0, 1, 1,
0.1331447, 0.4618237, 0.2058453, 0, 0, 0, 1, 1,
0.1363698, -0.471837, 2.243003, 0, 0, 0, 1, 1,
0.1365827, -0.7940508, 1.864681, 0, 0, 0, 1, 1,
0.1384366, 0.8064131, 0.2286104, 0, 0, 0, 1, 1,
0.1390201, 1.202404, 0.6200176, 0, 0, 0, 1, 1,
0.1415889, -1.729755, 2.36741, 0, 0, 0, 1, 1,
0.1434141, -0.0119712, 0.6862493, 0, 0, 0, 1, 1,
0.1450006, -0.376686, 3.352767, 1, 1, 1, 1, 1,
0.1472744, 0.08514523, 1.64294, 1, 1, 1, 1, 1,
0.14891, 1.272339, 0.7640814, 1, 1, 1, 1, 1,
0.1526208, -0.8880391, 3.586625, 1, 1, 1, 1, 1,
0.1536926, 2.249751, -0.8186623, 1, 1, 1, 1, 1,
0.1549116, 0.814011, -0.6574501, 1, 1, 1, 1, 1,
0.1586632, 0.6579096, 0.9125863, 1, 1, 1, 1, 1,
0.1608617, 0.5276775, -0.1459599, 1, 1, 1, 1, 1,
0.1642296, 1.017918, -1.367485, 1, 1, 1, 1, 1,
0.1663453, 0.2244912, 1.891507, 1, 1, 1, 1, 1,
0.1710528, 1.471631, -1.451503, 1, 1, 1, 1, 1,
0.1728347, 0.4590716, 1.233622, 1, 1, 1, 1, 1,
0.1767395, 0.4429132, 0.5281618, 1, 1, 1, 1, 1,
0.176801, 0.617328, 0.5624372, 1, 1, 1, 1, 1,
0.1782759, -0.465756, 3.078759, 1, 1, 1, 1, 1,
0.1784779, -0.7311009, 2.648381, 0, 0, 1, 1, 1,
0.1795924, 0.7535873, -1.313029, 1, 0, 0, 1, 1,
0.1803332, 1.969929, -0.6063939, 1, 0, 0, 1, 1,
0.1826312, -0.3141321, 1.967943, 1, 0, 0, 1, 1,
0.1840653, -1.575935, 3.242101, 1, 0, 0, 1, 1,
0.1842963, -0.6614178, 3.430785, 1, 0, 0, 1, 1,
0.1857051, -0.8546539, 2.354156, 0, 0, 0, 1, 1,
0.1908422, 0.9500683, 0.4256596, 0, 0, 0, 1, 1,
0.1909807, -0.4251309, 1.857963, 0, 0, 0, 1, 1,
0.1925286, -1.039577, 2.824233, 0, 0, 0, 1, 1,
0.1935883, 1.058802, -0.7557001, 0, 0, 0, 1, 1,
0.198089, 0.8221326, 1.475008, 0, 0, 0, 1, 1,
0.2036031, -0.5129503, 3.164775, 0, 0, 0, 1, 1,
0.2042318, -0.6496392, 1.508942, 1, 1, 1, 1, 1,
0.2085139, -0.8173599, 2.956324, 1, 1, 1, 1, 1,
0.2090119, 1.302645, 0.6433023, 1, 1, 1, 1, 1,
0.2172066, 1.516555, 0.1236837, 1, 1, 1, 1, 1,
0.2203806, 0.6258929, -1.149973, 1, 1, 1, 1, 1,
0.2226691, -0.9555519, 3.965524, 1, 1, 1, 1, 1,
0.2228258, -0.02537794, 1.859782, 1, 1, 1, 1, 1,
0.2258835, -1.016918, 2.969783, 1, 1, 1, 1, 1,
0.2263691, 1.124887, -0.440207, 1, 1, 1, 1, 1,
0.2293147, -1.122184, 1.755479, 1, 1, 1, 1, 1,
0.230979, -0.4498919, 2.001706, 1, 1, 1, 1, 1,
0.2342886, 0.8703244, 0.6225059, 1, 1, 1, 1, 1,
0.2372673, -0.8388872, 3.51839, 1, 1, 1, 1, 1,
0.2406766, -0.1154207, 1.000329, 1, 1, 1, 1, 1,
0.2410934, -2.031024, 2.373902, 1, 1, 1, 1, 1,
0.2524311, 1.781988, -0.1091161, 0, 0, 1, 1, 1,
0.2549079, -0.7314093, 1.90476, 1, 0, 0, 1, 1,
0.2558374, -0.152694, 2.962144, 1, 0, 0, 1, 1,
0.2564614, -2.543032, 1.800705, 1, 0, 0, 1, 1,
0.2576079, -0.4522727, 5.083541, 1, 0, 0, 1, 1,
0.2588409, -0.4573643, 2.717339, 1, 0, 0, 1, 1,
0.2604419, -0.2430205, 1.352809, 0, 0, 0, 1, 1,
0.265351, -0.6717213, 3.833564, 0, 0, 0, 1, 1,
0.2655617, 0.8474512, 1.243945, 0, 0, 0, 1, 1,
0.2666877, -0.3447816, 0.4092457, 0, 0, 0, 1, 1,
0.2704968, -0.5729501, 1.89113, 0, 0, 0, 1, 1,
0.2725708, -0.04741813, 2.145595, 0, 0, 0, 1, 1,
0.2778971, 1.188014, -0.6848981, 0, 0, 0, 1, 1,
0.2780713, -0.06659972, 2.167743, 1, 1, 1, 1, 1,
0.2830747, 0.9629996, 0.09393349, 1, 1, 1, 1, 1,
0.2832812, -0.1878326, 2.281671, 1, 1, 1, 1, 1,
0.2837045, 1.474598, 0.8497307, 1, 1, 1, 1, 1,
0.2856567, 0.04875175, 1.263442, 1, 1, 1, 1, 1,
0.2869426, 0.4770322, 1.373962, 1, 1, 1, 1, 1,
0.2912498, -0.4782181, 2.138242, 1, 1, 1, 1, 1,
0.2913997, -1.088781, 2.49811, 1, 1, 1, 1, 1,
0.2922133, -0.1044237, 1.887649, 1, 1, 1, 1, 1,
0.2923329, 0.301515, -0.8004749, 1, 1, 1, 1, 1,
0.2937616, -0.2999849, 4.4687, 1, 1, 1, 1, 1,
0.2947947, 0.1067416, 1.797748, 1, 1, 1, 1, 1,
0.2965792, 1.361227, -0.7726032, 1, 1, 1, 1, 1,
0.2968734, -1.095048, 3.513748, 1, 1, 1, 1, 1,
0.3044963, 0.0002910533, 0.2424475, 1, 1, 1, 1, 1,
0.3057381, 1.252561, 1.166772, 0, 0, 1, 1, 1,
0.3057556, -0.4755147, 0.2065957, 1, 0, 0, 1, 1,
0.3069438, 0.6034795, -0.5161899, 1, 0, 0, 1, 1,
0.3074958, 0.3163651, 1.414696, 1, 0, 0, 1, 1,
0.3078354, 2.207171, -1.186767, 1, 0, 0, 1, 1,
0.3078885, -0.9871529, 2.573744, 1, 0, 0, 1, 1,
0.3092478, -0.6008839, 3.584145, 0, 0, 0, 1, 1,
0.3114321, 1.347719, 0.844596, 0, 0, 0, 1, 1,
0.3155189, -0.1163927, 2.301975, 0, 0, 0, 1, 1,
0.3205893, -1.518528, 4.500118, 0, 0, 0, 1, 1,
0.321045, 0.09353372, 1.246199, 0, 0, 0, 1, 1,
0.3254482, 0.5756729, -1.514306, 0, 0, 0, 1, 1,
0.3264283, -0.01336097, 2.218676, 0, 0, 0, 1, 1,
0.333328, 0.959646, -0.7702253, 1, 1, 1, 1, 1,
0.3363767, -0.9997722, 2.252981, 1, 1, 1, 1, 1,
0.3417687, -0.7599047, 3.646782, 1, 1, 1, 1, 1,
0.3434171, -0.7387382, 2.395554, 1, 1, 1, 1, 1,
0.3440551, -1.888649, 2.709241, 1, 1, 1, 1, 1,
0.3479387, 0.6954249, 2.24374, 1, 1, 1, 1, 1,
0.3521869, -0.3152542, 0.4264724, 1, 1, 1, 1, 1,
0.355503, 0.2895106, 1.974304, 1, 1, 1, 1, 1,
0.3635477, 0.02375696, 1.63405, 1, 1, 1, 1, 1,
0.3662197, -1.484391, 1.751498, 1, 1, 1, 1, 1,
0.3686617, 0.1922911, 0.9101167, 1, 1, 1, 1, 1,
0.3694752, 0.3536822, -0.03316105, 1, 1, 1, 1, 1,
0.371427, 1.009704, 0.831947, 1, 1, 1, 1, 1,
0.3778382, -0.3564525, 1.695331, 1, 1, 1, 1, 1,
0.3821248, 0.7154268, 0.003344721, 1, 1, 1, 1, 1,
0.3833622, -0.5258052, 1.113741, 0, 0, 1, 1, 1,
0.3848616, -2.646972, 2.477642, 1, 0, 0, 1, 1,
0.3913972, 0.799583, -0.3318526, 1, 0, 0, 1, 1,
0.3937565, 1.55865, 1.871704, 1, 0, 0, 1, 1,
0.3982333, 0.2591137, 2.390507, 1, 0, 0, 1, 1,
0.4043341, -0.09417021, 2.994264, 1, 0, 0, 1, 1,
0.4047092, 1.273626, -2.366315, 0, 0, 0, 1, 1,
0.4090748, -1.971393, 4.349598, 0, 0, 0, 1, 1,
0.4112582, 0.6282851, 0.2459716, 0, 0, 0, 1, 1,
0.4154579, -0.1843233, 2.256094, 0, 0, 0, 1, 1,
0.4171111, -1.702923, 5.592126, 0, 0, 0, 1, 1,
0.4171516, -0.5347357, 3.093621, 0, 0, 0, 1, 1,
0.4217119, -0.451211, 3.224042, 0, 0, 0, 1, 1,
0.421883, -1.665184, 2.748997, 1, 1, 1, 1, 1,
0.4297948, 0.04582995, 0.8093927, 1, 1, 1, 1, 1,
0.4302779, 1.890346, -0.3751071, 1, 1, 1, 1, 1,
0.4333771, -0.9471441, 2.548465, 1, 1, 1, 1, 1,
0.4389352, 0.7808157, -0.9725291, 1, 1, 1, 1, 1,
0.4431917, 0.5018868, 1.996479, 1, 1, 1, 1, 1,
0.4457742, 1.193845, 0.7902186, 1, 1, 1, 1, 1,
0.4468023, -2.000903, 2.830453, 1, 1, 1, 1, 1,
0.4472814, 1.01281, 2.939899, 1, 1, 1, 1, 1,
0.4490646, -0.6340832, 2.634778, 1, 1, 1, 1, 1,
0.4500135, -1.510874, 3.232712, 1, 1, 1, 1, 1,
0.4534631, -1.366091, 2.036478, 1, 1, 1, 1, 1,
0.4558112, -0.2450045, 2.509027, 1, 1, 1, 1, 1,
0.4562082, -1.267889, 4.831662, 1, 1, 1, 1, 1,
0.4567742, -0.8998725, 3.116642, 1, 1, 1, 1, 1,
0.4609181, -1.381578, 2.318599, 0, 0, 1, 1, 1,
0.4618156, -0.3277813, 1.843747, 1, 0, 0, 1, 1,
0.4671737, -1.550923, 1.939184, 1, 0, 0, 1, 1,
0.470211, -1.45267, 2.351101, 1, 0, 0, 1, 1,
0.4713342, -1.884371, 1.857355, 1, 0, 0, 1, 1,
0.4769714, -0.1175602, 0.2491716, 1, 0, 0, 1, 1,
0.4827293, -0.2723678, 2.102745, 0, 0, 0, 1, 1,
0.4868839, -0.2865365, 3.975028, 0, 0, 0, 1, 1,
0.4876589, 0.745246, 0.2309553, 0, 0, 0, 1, 1,
0.4884062, -1.481017, 2.71702, 0, 0, 0, 1, 1,
0.4888153, -1.398879, 1.93784, 0, 0, 0, 1, 1,
0.4908873, 2.017712, -0.04067127, 0, 0, 0, 1, 1,
0.4917124, 0.6067645, 1.753976, 0, 0, 0, 1, 1,
0.4924291, -1.062826, 1.486782, 1, 1, 1, 1, 1,
0.4931032, -1.249913, 1.838882, 1, 1, 1, 1, 1,
0.498165, 1.191248, -0.4294717, 1, 1, 1, 1, 1,
0.498573, -0.0491887, 2.276716, 1, 1, 1, 1, 1,
0.5040079, 0.4556342, 0.6436483, 1, 1, 1, 1, 1,
0.5085774, -0.7657241, 1.647138, 1, 1, 1, 1, 1,
0.5112129, 2.547201, 1.424834, 1, 1, 1, 1, 1,
0.5123239, -1.006974, 4.24479, 1, 1, 1, 1, 1,
0.5180451, -1.751994, 3.359111, 1, 1, 1, 1, 1,
0.5266406, -0.7686372, 2.780891, 1, 1, 1, 1, 1,
0.5276103, 1.466755, -0.3158298, 1, 1, 1, 1, 1,
0.5327066, -0.8144016, 5.048469, 1, 1, 1, 1, 1,
0.5328009, -0.1206815, 0.6864874, 1, 1, 1, 1, 1,
0.5348181, 0.1507654, 2.112718, 1, 1, 1, 1, 1,
0.5374606, 1.656253, 0.1600783, 1, 1, 1, 1, 1,
0.5377234, 0.2034129, 1.616065, 0, 0, 1, 1, 1,
0.5403984, -0.5041723, 2.581822, 1, 0, 0, 1, 1,
0.5427387, -1.423227, 2.910763, 1, 0, 0, 1, 1,
0.5445207, 1.482609, -0.8205585, 1, 0, 0, 1, 1,
0.5448272, 0.4249012, 0.2443397, 1, 0, 0, 1, 1,
0.5497014, 1.295218, -1.532309, 1, 0, 0, 1, 1,
0.5566471, 0.1599091, 1.494918, 0, 0, 0, 1, 1,
0.5600908, -0.797618, 2.544989, 0, 0, 0, 1, 1,
0.5608208, -0.160282, 2.465704, 0, 0, 0, 1, 1,
0.5630714, 0.7260643, 0.5226977, 0, 0, 0, 1, 1,
0.5676599, -0.1780539, 2.206618, 0, 0, 0, 1, 1,
0.5696125, 0.06830944, 2.67076, 0, 0, 0, 1, 1,
0.5728247, 1.16651, -0.3424155, 0, 0, 0, 1, 1,
0.575198, -0.6430773, 3.628488, 1, 1, 1, 1, 1,
0.5756329, 1.793426, -0.5839998, 1, 1, 1, 1, 1,
0.5783998, -1.018971, 1.257561, 1, 1, 1, 1, 1,
0.5834875, 0.4941695, 0.3616351, 1, 1, 1, 1, 1,
0.5836986, -0.2634452, 3.718959, 1, 1, 1, 1, 1,
0.5862324, 0.8121539, 1.725018, 1, 1, 1, 1, 1,
0.5875021, 0.650813, 1.833781, 1, 1, 1, 1, 1,
0.5901492, 0.5726693, -0.02606178, 1, 1, 1, 1, 1,
0.5954407, -0.8475805, 2.926509, 1, 1, 1, 1, 1,
0.597307, -0.6575973, 2.510076, 1, 1, 1, 1, 1,
0.6077284, -0.690265, 2.739021, 1, 1, 1, 1, 1,
0.6095565, 0.3319514, 2.326932, 1, 1, 1, 1, 1,
0.6118246, -0.7768808, 2.238624, 1, 1, 1, 1, 1,
0.6223275, -0.3534603, 3.524447, 1, 1, 1, 1, 1,
0.6292638, 0.482702, 0.6524144, 1, 1, 1, 1, 1,
0.6295582, -0.4977922, 1.850258, 0, 0, 1, 1, 1,
0.6315795, 0.2793615, 0.1016776, 1, 0, 0, 1, 1,
0.6336787, 0.4333711, -1.452567, 1, 0, 0, 1, 1,
0.6382561, -0.7203658, 2.975527, 1, 0, 0, 1, 1,
0.6384022, 1.602835, 0.2154817, 1, 0, 0, 1, 1,
0.6490038, 2.347013, 0.7731869, 1, 0, 0, 1, 1,
0.6563139, 0.9423039, 0.5331626, 0, 0, 0, 1, 1,
0.6614553, -1.525673, 3.048435, 0, 0, 0, 1, 1,
0.6621706, 0.4698961, 2.561719, 0, 0, 0, 1, 1,
0.6642209, -0.512485, 2.019047, 0, 0, 0, 1, 1,
0.6657016, -0.4765343, 1.866325, 0, 0, 0, 1, 1,
0.6666303, 0.7190756, 2.807445, 0, 0, 0, 1, 1,
0.666872, 0.1707173, 1.933666, 0, 0, 0, 1, 1,
0.6717426, -0.3189639, 1.812814, 1, 1, 1, 1, 1,
0.6772005, -0.3354281, 2.328251, 1, 1, 1, 1, 1,
0.6785854, -1.425677, 2.557755, 1, 1, 1, 1, 1,
0.6788846, 2.224586, -0.08312608, 1, 1, 1, 1, 1,
0.6797238, 1.624935, -0.5495059, 1, 1, 1, 1, 1,
0.6832469, 0.2039688, 1.712826, 1, 1, 1, 1, 1,
0.690922, -2.206819, 2.44413, 1, 1, 1, 1, 1,
0.6913784, 1.55144, 1.527811, 1, 1, 1, 1, 1,
0.6930004, -0.328223, 1.916433, 1, 1, 1, 1, 1,
0.696408, -1.389876, 2.168736, 1, 1, 1, 1, 1,
0.7023976, -2.007398, 1.916449, 1, 1, 1, 1, 1,
0.7024654, 0.2812061, 0.1418981, 1, 1, 1, 1, 1,
0.704762, -0.06571567, 2.748606, 1, 1, 1, 1, 1,
0.7057573, -0.6873755, 2.810776, 1, 1, 1, 1, 1,
0.7073891, 0.5357592, 2.538802, 1, 1, 1, 1, 1,
0.7080065, 0.2585097, 1.744768, 0, 0, 1, 1, 1,
0.7184168, 1.849026, 2.516096, 1, 0, 0, 1, 1,
0.7195352, 0.3407609, 0.9661161, 1, 0, 0, 1, 1,
0.725113, -1.409497, 3.836943, 1, 0, 0, 1, 1,
0.7313531, -0.08269323, 4.452245, 1, 0, 0, 1, 1,
0.7336769, -0.08565717, 2.347272, 1, 0, 0, 1, 1,
0.7377137, -0.8302227, 1.676184, 0, 0, 0, 1, 1,
0.7385999, 0.9259478, -0.1451515, 0, 0, 0, 1, 1,
0.7387359, -2.162303, 3.356025, 0, 0, 0, 1, 1,
0.7532136, -0.1917472, 1.203899, 0, 0, 0, 1, 1,
0.7643275, 1.010128, 1.405096, 0, 0, 0, 1, 1,
0.7685609, -0.8501595, 2.798556, 0, 0, 0, 1, 1,
0.7697755, 1.27919, 0.2009824, 0, 0, 0, 1, 1,
0.7841169, 1.663759, 0.2057197, 1, 1, 1, 1, 1,
0.7869391, -1.834816, 2.878615, 1, 1, 1, 1, 1,
0.7952381, 1.002149, -0.004119607, 1, 1, 1, 1, 1,
0.7975101, 0.6812861, -0.6569405, 1, 1, 1, 1, 1,
0.7975355, 2.115669, -0.4796683, 1, 1, 1, 1, 1,
0.7982228, -1.268037, 0.2999572, 1, 1, 1, 1, 1,
0.802557, -1.196905, 0.9740415, 1, 1, 1, 1, 1,
0.8055525, 1.235142, -0.1384541, 1, 1, 1, 1, 1,
0.8057745, -0.004403211, 2.654689, 1, 1, 1, 1, 1,
0.8068577, -1.397182, 2.2723, 1, 1, 1, 1, 1,
0.8080869, -0.6409673, 1.900204, 1, 1, 1, 1, 1,
0.8091021, 0.6814455, 0.7657468, 1, 1, 1, 1, 1,
0.8207119, -1.169072, 2.441967, 1, 1, 1, 1, 1,
0.8247666, 2.110564, 1.701889, 1, 1, 1, 1, 1,
0.8269358, 0.2428336, -0.1926016, 1, 1, 1, 1, 1,
0.8404567, 0.2572501, 0.9274616, 0, 0, 1, 1, 1,
0.8461785, -0.3149658, 1.486413, 1, 0, 0, 1, 1,
0.8529495, 1.186784, -0.8502585, 1, 0, 0, 1, 1,
0.8541167, -1.266728, 2.041184, 1, 0, 0, 1, 1,
0.8588938, 0.4730079, 0.1450851, 1, 0, 0, 1, 1,
0.8609295, 0.2178621, 0.6114156, 1, 0, 0, 1, 1,
0.8615748, 0.2236156, 2.025445, 0, 0, 0, 1, 1,
0.8644714, -0.07700098, 1.836994, 0, 0, 0, 1, 1,
0.8667858, 0.01726729, 2.643242, 0, 0, 0, 1, 1,
0.8674378, -0.9727054, 4.130686, 0, 0, 0, 1, 1,
0.8718717, -0.4859661, 2.556371, 0, 0, 0, 1, 1,
0.8737367, 0.9561945, 0.879123, 0, 0, 0, 1, 1,
0.8738785, -1.485772, 3.602558, 0, 0, 0, 1, 1,
0.874711, 2.646392, -0.4791134, 1, 1, 1, 1, 1,
0.8763536, 0.3965113, 0.1787524, 1, 1, 1, 1, 1,
0.8816099, 1.511811, -0.6954691, 1, 1, 1, 1, 1,
0.8897783, -0.3715526, 0.8693829, 1, 1, 1, 1, 1,
0.8958933, 0.6650904, 1.78733, 1, 1, 1, 1, 1,
0.9046422, 1.088667, -0.3541117, 1, 1, 1, 1, 1,
0.9211735, 0.6346235, 0.5176729, 1, 1, 1, 1, 1,
0.9240326, -0.5489864, 0.6763945, 1, 1, 1, 1, 1,
0.9285578, 1.00645, 1.216625, 1, 1, 1, 1, 1,
0.928717, 1.26827, 1.801655, 1, 1, 1, 1, 1,
0.9315163, 0.9437596, 0.2178074, 1, 1, 1, 1, 1,
0.9369361, -0.5511084, 2.266372, 1, 1, 1, 1, 1,
0.947929, -0.9614639, 1.933659, 1, 1, 1, 1, 1,
0.948558, -0.1930547, 0.2302813, 1, 1, 1, 1, 1,
0.9522984, -0.2069732, 2.802213, 1, 1, 1, 1, 1,
0.9581891, 1.941683, 0.4637838, 0, 0, 1, 1, 1,
0.9635719, -0.5255671, 2.084998, 1, 0, 0, 1, 1,
0.9708579, 0.193926, 1.335706, 1, 0, 0, 1, 1,
0.9784134, -1.996815, 1.245821, 1, 0, 0, 1, 1,
0.9805781, -0.09552342, -0.9322233, 1, 0, 0, 1, 1,
0.985188, 0.09534071, 0.1793244, 1, 0, 0, 1, 1,
0.9876931, 0.3947449, 3.217564, 0, 0, 0, 1, 1,
0.9888654, -0.1045228, 0.8948802, 0, 0, 0, 1, 1,
0.9897031, 0.7506515, -0.0916495, 0, 0, 0, 1, 1,
0.9904061, 0.6548417, -0.8870143, 0, 0, 0, 1, 1,
0.9955333, -0.9724194, 0.0730296, 0, 0, 0, 1, 1,
0.9978769, -0.6309093, 0.9042209, 0, 0, 0, 1, 1,
1.000578, -0.1046112, 1.333179, 0, 0, 0, 1, 1,
1.001376, -1.704784, 1.86061, 1, 1, 1, 1, 1,
1.007177, 0.06963091, 2.16518, 1, 1, 1, 1, 1,
1.016415, -0.770898, 0.7469575, 1, 1, 1, 1, 1,
1.019797, -1.135012, 1.943321, 1, 1, 1, 1, 1,
1.026163, 0.5669503, 0.714467, 1, 1, 1, 1, 1,
1.026568, -2.074711, 2.61746, 1, 1, 1, 1, 1,
1.029466, 1.097349, -1.173458, 1, 1, 1, 1, 1,
1.034433, -0.1549491, 1.687252, 1, 1, 1, 1, 1,
1.037775, 1.543786, 0.6808153, 1, 1, 1, 1, 1,
1.039079, -1.656057, 1.989199, 1, 1, 1, 1, 1,
1.039386, -0.7681948, 3.213269, 1, 1, 1, 1, 1,
1.04731, -0.5572903, 3.362891, 1, 1, 1, 1, 1,
1.054356, -0.7004657, 3.440813, 1, 1, 1, 1, 1,
1.055221, 1.382631, 1.040462, 1, 1, 1, 1, 1,
1.058496, -0.7058474, 2.853533, 1, 1, 1, 1, 1,
1.077154, -0.08429313, 0.09303728, 0, 0, 1, 1, 1,
1.081217, -0.3752506, 1.820089, 1, 0, 0, 1, 1,
1.081431, 2.348915, -0.04633276, 1, 0, 0, 1, 1,
1.084449, -1.755464, 2.723809, 1, 0, 0, 1, 1,
1.095763, -0.3943814, -1.380561, 1, 0, 0, 1, 1,
1.099939, 0.8171431, 0.7125267, 1, 0, 0, 1, 1,
1.103677, -0.3882587, -0.405334, 0, 0, 0, 1, 1,
1.105766, -0.5314688, 1.966346, 0, 0, 0, 1, 1,
1.107429, -0.4842471, 0.7315601, 0, 0, 0, 1, 1,
1.113681, 0.7572455, 0.7114769, 0, 0, 0, 1, 1,
1.114306, 1.507041, 1.509693, 0, 0, 0, 1, 1,
1.114748, 1.210183, -0.8569668, 0, 0, 0, 1, 1,
1.122276, -1.580234, 2.103774, 0, 0, 0, 1, 1,
1.127657, -0.4322315, 1.66905, 1, 1, 1, 1, 1,
1.128698, -0.8418105, 2.118065, 1, 1, 1, 1, 1,
1.130981, -0.4389794, 2.936759, 1, 1, 1, 1, 1,
1.134902, -1.563338, 2.210985, 1, 1, 1, 1, 1,
1.135783, 0.8068141, 1.684445, 1, 1, 1, 1, 1,
1.14002, -0.07600661, 1.388919, 1, 1, 1, 1, 1,
1.141382, -2.297413, 3.619691, 1, 1, 1, 1, 1,
1.146153, -0.4307115, 2.158009, 1, 1, 1, 1, 1,
1.153279, 0.8797988, 1.590716, 1, 1, 1, 1, 1,
1.163622, 0.02933502, 2.597419, 1, 1, 1, 1, 1,
1.173214, 0.4330667, 0.7466323, 1, 1, 1, 1, 1,
1.176052, 2.103849, -0.3971443, 1, 1, 1, 1, 1,
1.183666, -0.2147514, 1.43721, 1, 1, 1, 1, 1,
1.185984, -1.738567, 1.924927, 1, 1, 1, 1, 1,
1.186772, 0.1806611, 1.403874, 1, 1, 1, 1, 1,
1.187604, -1.914724, 3.68456, 0, 0, 1, 1, 1,
1.18895, -1.004324, 1.691106, 1, 0, 0, 1, 1,
1.189082, 0.1305325, -0.2050774, 1, 0, 0, 1, 1,
1.191971, -0.8760788, 1.190226, 1, 0, 0, 1, 1,
1.19475, -1.899475, 1.847734, 1, 0, 0, 1, 1,
1.194802, 0.7453393, 1.770039, 1, 0, 0, 1, 1,
1.197708, 0.3310266, 2.140293, 0, 0, 0, 1, 1,
1.19867, -0.6751822, -0.6041619, 0, 0, 0, 1, 1,
1.200746, 0.7069418, -0.06021727, 0, 0, 0, 1, 1,
1.214046, -0.1429503, 1.794699, 0, 0, 0, 1, 1,
1.218263, -2.478766, 1.906629, 0, 0, 0, 1, 1,
1.219014, -0.2515603, 0.7672215, 0, 0, 0, 1, 1,
1.240163, 0.6213906, 1.859337, 0, 0, 0, 1, 1,
1.250531, -0.9457338, 1.979073, 1, 1, 1, 1, 1,
1.253591, -1.038645, 2.987687, 1, 1, 1, 1, 1,
1.257652, -1.583094, 2.45462, 1, 1, 1, 1, 1,
1.258814, -0.007800664, 2.166261, 1, 1, 1, 1, 1,
1.270157, 0.9648563, -0.2634422, 1, 1, 1, 1, 1,
1.271863, -2.331887, 1.567845, 1, 1, 1, 1, 1,
1.284421, 0.7641736, 2.123794, 1, 1, 1, 1, 1,
1.290247, -1.920939, 1.525242, 1, 1, 1, 1, 1,
1.305822, -0.07256017, 1.975289, 1, 1, 1, 1, 1,
1.306062, 0.6832707, 0.856531, 1, 1, 1, 1, 1,
1.31669, 0.01858284, 3.734338, 1, 1, 1, 1, 1,
1.317861, -0.3724408, 1.616148, 1, 1, 1, 1, 1,
1.32179, -1.988023, 2.340671, 1, 1, 1, 1, 1,
1.340437, -1.503341, 2.649221, 1, 1, 1, 1, 1,
1.341552, 0.8888385, 1.200599, 1, 1, 1, 1, 1,
1.343383, 1.918744, 0.8843158, 0, 0, 1, 1, 1,
1.345942, 1.374036, 0.6565662, 1, 0, 0, 1, 1,
1.361031, 0.7417153, 1.76532, 1, 0, 0, 1, 1,
1.390457, 0.2224887, 0.07462615, 1, 0, 0, 1, 1,
1.393366, -0.4655193, -0.7332065, 1, 0, 0, 1, 1,
1.413516, -0.5275896, 1.96652, 1, 0, 0, 1, 1,
1.419638, -2.098356, 2.338702, 0, 0, 0, 1, 1,
1.436757, 0.492131, 1.119388, 0, 0, 0, 1, 1,
1.445512, 0.2340765, 1.589577, 0, 0, 0, 1, 1,
1.451659, -0.2508345, 2.501508, 0, 0, 0, 1, 1,
1.466145, -0.5835158, 3.552495, 0, 0, 0, 1, 1,
1.467564, -0.1231468, 1.829717, 0, 0, 0, 1, 1,
1.46884, -1.329977, 2.199673, 0, 0, 0, 1, 1,
1.488921, 0.8287461, 1.515892, 1, 1, 1, 1, 1,
1.494491, -1.425056, 2.151954, 1, 1, 1, 1, 1,
1.494698, -0.460536, 3.109842, 1, 1, 1, 1, 1,
1.499504, -0.9046072, 1.851282, 1, 1, 1, 1, 1,
1.502603, -0.2541131, 3.352352, 1, 1, 1, 1, 1,
1.505922, 0.1907633, 2.899556, 1, 1, 1, 1, 1,
1.510509, -1.10588, 2.394814, 1, 1, 1, 1, 1,
1.513449, 0.6145809, 4.246309, 1, 1, 1, 1, 1,
1.514026, 0.05356223, 3.786087, 1, 1, 1, 1, 1,
1.51762, -0.4319493, 2.823975, 1, 1, 1, 1, 1,
1.571392, 0.7769215, 1.683866, 1, 1, 1, 1, 1,
1.581717, 0.9798042, -1.103487, 1, 1, 1, 1, 1,
1.592547, 0.9079797, 0.1200332, 1, 1, 1, 1, 1,
1.615578, -0.5026406, 1.608551, 1, 1, 1, 1, 1,
1.616236, -0.04825097, 1.262999, 1, 1, 1, 1, 1,
1.621553, -1.217727, 3.038858, 0, 0, 1, 1, 1,
1.632341, -1.803577, 3.980098, 1, 0, 0, 1, 1,
1.644077, -0.792245, 0.5379717, 1, 0, 0, 1, 1,
1.657873, -0.8839984, 2.200493, 1, 0, 0, 1, 1,
1.661406, -0.549099, 2.997242, 1, 0, 0, 1, 1,
1.676732, -0.5187355, 3.869083, 1, 0, 0, 1, 1,
1.676757, -0.3040455, 1.088135, 0, 0, 0, 1, 1,
1.68117, 0.6092288, 1.928159, 0, 0, 0, 1, 1,
1.683746, 1.00221, 1.878223, 0, 0, 0, 1, 1,
1.69101, 0.4587869, 0.8183907, 0, 0, 0, 1, 1,
1.693, -0.5904234, 0.9129083, 0, 0, 0, 1, 1,
1.697798, 1.043807, 2.96596, 0, 0, 0, 1, 1,
1.699089, -0.7325427, 2.452642, 0, 0, 0, 1, 1,
1.704925, 0.3860252, 1.297709, 1, 1, 1, 1, 1,
1.712338, -0.6332784, 0.9031013, 1, 1, 1, 1, 1,
1.748206, -1.269184, 2.628706, 1, 1, 1, 1, 1,
1.753472, -0.2738056, 0.03834006, 1, 1, 1, 1, 1,
1.762309, 0.7952634, 1.203482, 1, 1, 1, 1, 1,
1.78873, -0.7187324, 1.977595, 1, 1, 1, 1, 1,
1.789368, -0.1979976, 1.380664, 1, 1, 1, 1, 1,
1.823246, -0.2570993, 1.375662, 1, 1, 1, 1, 1,
1.912046, 0.2240034, 0.6053877, 1, 1, 1, 1, 1,
1.933792, -0.3896847, 1.075168, 1, 1, 1, 1, 1,
1.937947, -0.2120983, 1.030993, 1, 1, 1, 1, 1,
1.944636, -1.268128, -0.03185847, 1, 1, 1, 1, 1,
1.948915, -1.281514, 2.097378, 1, 1, 1, 1, 1,
1.953334, 0.2062871, 2.023849, 1, 1, 1, 1, 1,
2.019532, 1.209925, 2.866994, 1, 1, 1, 1, 1,
2.06205, 0.42875, 2.487908, 0, 0, 1, 1, 1,
2.112839, 0.5173658, -0.01939076, 1, 0, 0, 1, 1,
2.135144, 0.1985402, 3.422452, 1, 0, 0, 1, 1,
2.164617, -0.3436334, 1.178425, 1, 0, 0, 1, 1,
2.178978, -0.9408547, 2.555379, 1, 0, 0, 1, 1,
2.18869, -0.0068268, 0.8898239, 1, 0, 0, 1, 1,
2.190425, 1.602337, 0.6334552, 0, 0, 0, 1, 1,
2.223195, 0.4683647, 1.073712, 0, 0, 0, 1, 1,
2.230894, 1.588179, 0.0963827, 0, 0, 0, 1, 1,
2.235739, 1.476165, 1.013384, 0, 0, 0, 1, 1,
2.260192, 0.9862024, -0.7803345, 0, 0, 0, 1, 1,
2.288876, -0.1503681, 3.225338, 0, 0, 0, 1, 1,
2.357034, 1.390588, -0.9747035, 0, 0, 0, 1, 1,
2.380043, 0.6761571, 2.831037, 1, 1, 1, 1, 1,
2.475264, -0.3768693, 0.9453323, 1, 1, 1, 1, 1,
2.656041, -2.567203, 2.107205, 1, 1, 1, 1, 1,
2.698853, -0.1264333, 0.5285098, 1, 1, 1, 1, 1,
2.984684, 1.456269, 2.726553, 1, 1, 1, 1, 1,
3.721323, 0.07105947, 2.414309, 1, 1, 1, 1, 1,
4.168494, -0.4259263, 0.3340157, 1, 1, 1, 1, 1
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
var radius = 10.22108;
var distance = 35.90111;
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
mvMatrix.translate( -0.2229943, -0.0008933544, 0.2703011 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.90111);
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
