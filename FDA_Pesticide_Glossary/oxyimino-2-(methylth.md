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
-3.597583, -2.124606, -2.256124, 1, 0, 0, 1,
-3.37534, 1.350294, 0.00132483, 1, 0.007843138, 0, 1,
-2.969478, -0.03727131, -0.6860161, 1, 0.01176471, 0, 1,
-2.968756, 0.1877029, -1.864584, 1, 0.01960784, 0, 1,
-2.786961, -2.236963, -3.045043, 1, 0.02352941, 0, 1,
-2.718939, 1.052924, -0.4914427, 1, 0.03137255, 0, 1,
-2.566016, 0.3376487, -1.915315, 1, 0.03529412, 0, 1,
-2.537656, 0.6968173, -2.767213, 1, 0.04313726, 0, 1,
-2.40081, 0.156315, -0.5464525, 1, 0.04705882, 0, 1,
-2.386938, 0.4851947, -1.95358, 1, 0.05490196, 0, 1,
-2.363145, -0.8065846, -1.447921, 1, 0.05882353, 0, 1,
-2.314037, -0.3115961, 0.09044255, 1, 0.06666667, 0, 1,
-2.215305, 0.7894585, -1.510453, 1, 0.07058824, 0, 1,
-2.213956, -0.6192306, -2.478396, 1, 0.07843138, 0, 1,
-2.20815, 0.1526544, -0.6159098, 1, 0.08235294, 0, 1,
-2.197507, -1.357038, -2.132225, 1, 0.09019608, 0, 1,
-2.192196, 0.8126672, -2.933185, 1, 0.09411765, 0, 1,
-2.118181, 0.07893675, -1.495039, 1, 0.1019608, 0, 1,
-2.114798, -0.7214838, -1.52835, 1, 0.1098039, 0, 1,
-2.023862, 0.4293121, -1.057494, 1, 0.1137255, 0, 1,
-2.01577, 0.2388268, -0.8977581, 1, 0.1215686, 0, 1,
-2.013762, 0.1134252, -1.463222, 1, 0.1254902, 0, 1,
-2.011808, -0.6704302, -1.67263, 1, 0.1333333, 0, 1,
-1.975645, 1.245235, -0.1419442, 1, 0.1372549, 0, 1,
-1.967325, -2.148935, -1.025266, 1, 0.145098, 0, 1,
-1.959946, 0.7836614, -1.84376, 1, 0.1490196, 0, 1,
-1.931205, 0.943978, 0.2409303, 1, 0.1568628, 0, 1,
-1.919384, -0.2131538, -1.120466, 1, 0.1607843, 0, 1,
-1.915197, 0.3689191, -0.4893317, 1, 0.1686275, 0, 1,
-1.915105, 0.5409257, -0.4148288, 1, 0.172549, 0, 1,
-1.913627, 0.2929124, -0.8232967, 1, 0.1803922, 0, 1,
-1.89114, -0.5793823, -1.738906, 1, 0.1843137, 0, 1,
-1.870115, -1.068037, -2.157587, 1, 0.1921569, 0, 1,
-1.865008, -1.156631, -1.089391, 1, 0.1960784, 0, 1,
-1.858027, 0.01777456, -2.229873, 1, 0.2039216, 0, 1,
-1.830595, 0.877762, -1.314093, 1, 0.2117647, 0, 1,
-1.819377, 0.4491521, -0.427406, 1, 0.2156863, 0, 1,
-1.794735, -0.7168328, -3.132485, 1, 0.2235294, 0, 1,
-1.782754, -1.486653, -1.291561, 1, 0.227451, 0, 1,
-1.780101, -0.6777398, -0.7117745, 1, 0.2352941, 0, 1,
-1.77122, -0.5380422, -1.522455, 1, 0.2392157, 0, 1,
-1.771099, 1.912666, -2.824618, 1, 0.2470588, 0, 1,
-1.76593, 0.495174, -0.923027, 1, 0.2509804, 0, 1,
-1.758904, -1.360012, -1.446141, 1, 0.2588235, 0, 1,
-1.757299, 0.2024972, -1.387781, 1, 0.2627451, 0, 1,
-1.75194, -0.6834137, -1.118385, 1, 0.2705882, 0, 1,
-1.74914, -0.6932819, -2.349747, 1, 0.2745098, 0, 1,
-1.730921, 0.1613225, -2.394655, 1, 0.282353, 0, 1,
-1.706588, -0.3708223, -1.834234, 1, 0.2862745, 0, 1,
-1.70288, -0.9693205, -2.547583, 1, 0.2941177, 0, 1,
-1.698724, -0.0779084, -4.789941, 1, 0.3019608, 0, 1,
-1.686626, -1.347032, -2.655216, 1, 0.3058824, 0, 1,
-1.628927, 0.05508139, -2.344086, 1, 0.3137255, 0, 1,
-1.59915, 1.336116, -2.22527, 1, 0.3176471, 0, 1,
-1.585876, 1.342853, -0.9208927, 1, 0.3254902, 0, 1,
-1.56688, 1.408988, -3.466255, 1, 0.3294118, 0, 1,
-1.539041, 0.3191871, -2.052711, 1, 0.3372549, 0, 1,
-1.534751, -0.4317689, -3.321329, 1, 0.3411765, 0, 1,
-1.534538, 0.06999914, -1.040977, 1, 0.3490196, 0, 1,
-1.527403, 0.3978665, -0.6491261, 1, 0.3529412, 0, 1,
-1.526768, 0.5939158, 0.128341, 1, 0.3607843, 0, 1,
-1.512214, -0.4811757, -0.4125274, 1, 0.3647059, 0, 1,
-1.509027, 0.07492045, 0.77816, 1, 0.372549, 0, 1,
-1.500875, -1.78619, -2.728057, 1, 0.3764706, 0, 1,
-1.497534, -0.1591782, -2.324612, 1, 0.3843137, 0, 1,
-1.473292, -0.4040281, -2.921831, 1, 0.3882353, 0, 1,
-1.471806, -0.515761, -1.679582, 1, 0.3960784, 0, 1,
-1.46664, -0.8798668, -2.410034, 1, 0.4039216, 0, 1,
-1.461357, 0.1293336, -0.09926289, 1, 0.4078431, 0, 1,
-1.453388, -0.4517443, -1.939452, 1, 0.4156863, 0, 1,
-1.451847, -1.424757, -1.532692, 1, 0.4196078, 0, 1,
-1.446964, 2.102346, 0.1674295, 1, 0.427451, 0, 1,
-1.446483, 1.535556, -1.970013, 1, 0.4313726, 0, 1,
-1.422804, -0.1213976, -0.7892999, 1, 0.4392157, 0, 1,
-1.414583, -2.098449, -2.562335, 1, 0.4431373, 0, 1,
-1.412806, -0.2783378, -1.531738, 1, 0.4509804, 0, 1,
-1.411497, 2.35728, 1.279008, 1, 0.454902, 0, 1,
-1.40314, 0.04104268, -0.05629424, 1, 0.4627451, 0, 1,
-1.392405, 1.867595, -1.882967, 1, 0.4666667, 0, 1,
-1.389685, -0.581082, -2.197001, 1, 0.4745098, 0, 1,
-1.388923, -1.00054, -1.281973, 1, 0.4784314, 0, 1,
-1.387991, -0.5145548, -3.348254, 1, 0.4862745, 0, 1,
-1.386253, 0.9819119, -2.769714, 1, 0.4901961, 0, 1,
-1.377602, 0.108203, 0.156149, 1, 0.4980392, 0, 1,
-1.356176, -0.282796, -3.224788, 1, 0.5058824, 0, 1,
-1.352226, -0.3082615, -2.375295, 1, 0.509804, 0, 1,
-1.349429, 0.5421464, -1.296322, 1, 0.5176471, 0, 1,
-1.337845, -1.642012, -2.325292, 1, 0.5215687, 0, 1,
-1.330061, -0.4198889, -1.361051, 1, 0.5294118, 0, 1,
-1.329755, 0.4449845, -1.436941, 1, 0.5333334, 0, 1,
-1.328373, 1.908359, -0.7078473, 1, 0.5411765, 0, 1,
-1.323908, 0.647259, -1.859258, 1, 0.5450981, 0, 1,
-1.323434, -1.153009, -3.14748, 1, 0.5529412, 0, 1,
-1.320082, 0.2133798, -0.4059892, 1, 0.5568628, 0, 1,
-1.319064, 0.7462958, 0.4553302, 1, 0.5647059, 0, 1,
-1.318396, -0.6118479, -0.2475574, 1, 0.5686275, 0, 1,
-1.317344, -1.172982, -3.389584, 1, 0.5764706, 0, 1,
-1.308005, -1.196097, -2.145719, 1, 0.5803922, 0, 1,
-1.305953, 1.141637, 0.9133261, 1, 0.5882353, 0, 1,
-1.30506, 1.094612, -2.78188, 1, 0.5921569, 0, 1,
-1.297057, 0.2421404, -0.167286, 1, 0.6, 0, 1,
-1.285546, -0.5129395, -0.6702538, 1, 0.6078432, 0, 1,
-1.283962, -0.1881816, -1.800836, 1, 0.6117647, 0, 1,
-1.271554, -0.9764488, -2.059042, 1, 0.6196079, 0, 1,
-1.257603, -0.4642987, -3.22233, 1, 0.6235294, 0, 1,
-1.255582, -2.186107, -2.777258, 1, 0.6313726, 0, 1,
-1.250584, -0.7893252, -1.01718, 1, 0.6352941, 0, 1,
-1.249144, -0.9977171, -2.523244, 1, 0.6431373, 0, 1,
-1.228693, 0.4680772, -2.036929, 1, 0.6470588, 0, 1,
-1.225157, 0.7531651, -2.310911, 1, 0.654902, 0, 1,
-1.215713, 1.06432, 0.1871426, 1, 0.6588235, 0, 1,
-1.215361, -0.6385489, -1.570901, 1, 0.6666667, 0, 1,
-1.203823, -0.7162042, -2.243659, 1, 0.6705883, 0, 1,
-1.203371, 0.165558, -2.507675, 1, 0.6784314, 0, 1,
-1.194332, -0.9185694, -2.237396, 1, 0.682353, 0, 1,
-1.192675, 0.8779816, 1.00938, 1, 0.6901961, 0, 1,
-1.183547, 1.336554, -1.346241, 1, 0.6941177, 0, 1,
-1.183136, -1.642165, -2.817724, 1, 0.7019608, 0, 1,
-1.177369, 0.2843094, -0.05436753, 1, 0.7098039, 0, 1,
-1.159005, -0.3809902, -1.945352, 1, 0.7137255, 0, 1,
-1.156499, 1.17321, -2.736298, 1, 0.7215686, 0, 1,
-1.148843, 0.006613587, -1.478114, 1, 0.7254902, 0, 1,
-1.146833, 0.9019915, -1.134445, 1, 0.7333333, 0, 1,
-1.126517, -0.8514805, -1.415207, 1, 0.7372549, 0, 1,
-1.122724, -1.232448, -3.083486, 1, 0.7450981, 0, 1,
-1.121152, -1.022426, -2.809856, 1, 0.7490196, 0, 1,
-1.119025, -0.8425995, -2.03682, 1, 0.7568628, 0, 1,
-1.118928, -1.550299, -2.944387, 1, 0.7607843, 0, 1,
-1.116709, -1.617883, -3.085329, 1, 0.7686275, 0, 1,
-1.114634, 0.5122736, -2.701796, 1, 0.772549, 0, 1,
-1.113858, -1.00543, -1.537845, 1, 0.7803922, 0, 1,
-1.106669, -0.2234298, -2.071906, 1, 0.7843137, 0, 1,
-1.10643, -1.291274, -2.677751, 1, 0.7921569, 0, 1,
-1.097517, 1.157664, -0.5023237, 1, 0.7960784, 0, 1,
-1.087647, -1.941335, -3.075605, 1, 0.8039216, 0, 1,
-1.071323, 0.4413186, -1.28165, 1, 0.8117647, 0, 1,
-1.066743, -0.8767478, -2.983898, 1, 0.8156863, 0, 1,
-1.059695, 0.4844182, -0.2150796, 1, 0.8235294, 0, 1,
-1.055494, -0.2066781, -2.485676, 1, 0.827451, 0, 1,
-1.05348, 1.55238, -3.243741, 1, 0.8352941, 0, 1,
-1.053444, -1.848394, -1.072814, 1, 0.8392157, 0, 1,
-1.045902, 0.6684288, -1.038006, 1, 0.8470588, 0, 1,
-1.04331, 2.19315, 0.6473185, 1, 0.8509804, 0, 1,
-1.02907, -0.7766995, -2.113458, 1, 0.8588235, 0, 1,
-1.016423, 0.8667992, -0.1528403, 1, 0.8627451, 0, 1,
-1.012802, -0.09652472, -0.4464042, 1, 0.8705882, 0, 1,
-1.011191, 2.1316, -0.03615717, 1, 0.8745098, 0, 1,
-1.001987, 0.01168207, -4.07303, 1, 0.8823529, 0, 1,
-1.000533, 1.907102, -0.526839, 1, 0.8862745, 0, 1,
-0.9924851, 0.2473308, -1.319143, 1, 0.8941177, 0, 1,
-0.9878801, -0.239309, -2.302691, 1, 0.8980392, 0, 1,
-0.9865525, -1.108276, -1.618107, 1, 0.9058824, 0, 1,
-0.9861776, -0.6229603, -2.882773, 1, 0.9137255, 0, 1,
-0.9801672, 0.07475939, 0.2200739, 1, 0.9176471, 0, 1,
-0.9800757, 0.7056467, -0.06002283, 1, 0.9254902, 0, 1,
-0.9699816, -0.01942815, -2.033696, 1, 0.9294118, 0, 1,
-0.9686808, 1.166318, -1.460601, 1, 0.9372549, 0, 1,
-0.966959, -0.5687941, -3.559014, 1, 0.9411765, 0, 1,
-0.960516, -1.242666, -1.12741, 1, 0.9490196, 0, 1,
-0.9588879, -1.573867, -2.367989, 1, 0.9529412, 0, 1,
-0.9577876, 0.9282959, -1.585649, 1, 0.9607843, 0, 1,
-0.9558623, -0.4824164, -1.606043, 1, 0.9647059, 0, 1,
-0.9457101, 0.2201836, -1.522955, 1, 0.972549, 0, 1,
-0.9402572, 0.7064332, 0.1920851, 1, 0.9764706, 0, 1,
-0.9383821, -0.2563169, -2.960853, 1, 0.9843137, 0, 1,
-0.9359172, -0.2248344, -2.360324, 1, 0.9882353, 0, 1,
-0.9334866, -0.1822146, -2.540458, 1, 0.9960784, 0, 1,
-0.9317092, 0.3880955, -0.2390338, 0.9960784, 1, 0, 1,
-0.9262782, -0.06463706, 0.2739744, 0.9921569, 1, 0, 1,
-0.9170765, 0.1579774, -1.707667, 0.9843137, 1, 0, 1,
-0.9167701, 0.1719776, -1.7952, 0.9803922, 1, 0, 1,
-0.9132751, 1.395526, -2.037566, 0.972549, 1, 0, 1,
-0.9104543, -0.2641188, -1.058841, 0.9686275, 1, 0, 1,
-0.9031632, 0.3193286, -2.171742, 0.9607843, 1, 0, 1,
-0.9004309, -0.3207158, -2.09862, 0.9568627, 1, 0, 1,
-0.8940641, -0.9318227, -3.238166, 0.9490196, 1, 0, 1,
-0.8922654, -0.2062681, 0.2880766, 0.945098, 1, 0, 1,
-0.8900614, -0.4366456, -2.399089, 0.9372549, 1, 0, 1,
-0.8868436, 0.7015917, 0.2013836, 0.9333333, 1, 0, 1,
-0.8843692, 1.341722, -1.080675, 0.9254902, 1, 0, 1,
-0.8750713, -0.2343167, -2.06586, 0.9215686, 1, 0, 1,
-0.8736621, -0.4790159, -1.868468, 0.9137255, 1, 0, 1,
-0.8581717, 0.3129679, -0.3035061, 0.9098039, 1, 0, 1,
-0.8541774, -0.3020739, -2.070499, 0.9019608, 1, 0, 1,
-0.8535291, 1.352459, 0.7575002, 0.8941177, 1, 0, 1,
-0.846056, -0.273752, -4.354281, 0.8901961, 1, 0, 1,
-0.8444301, 0.8188783, -0.5688542, 0.8823529, 1, 0, 1,
-0.8440477, -0.9880693, -1.157136, 0.8784314, 1, 0, 1,
-0.8362235, -0.4943768, -1.584767, 0.8705882, 1, 0, 1,
-0.834092, 0.9129336, -1.215485, 0.8666667, 1, 0, 1,
-0.8291206, -0.9399693, -2.242069, 0.8588235, 1, 0, 1,
-0.8283099, 0.4264906, -1.680304, 0.854902, 1, 0, 1,
-0.8234957, 0.8073865, -1.324955, 0.8470588, 1, 0, 1,
-0.8202767, 0.9952098, -0.2855798, 0.8431373, 1, 0, 1,
-0.8186507, 0.5753695, -0.3744511, 0.8352941, 1, 0, 1,
-0.8185264, -0.2012346, -0.9386637, 0.8313726, 1, 0, 1,
-0.813389, -0.201644, -2.923963, 0.8235294, 1, 0, 1,
-0.8031184, -1.82977, -2.846764, 0.8196079, 1, 0, 1,
-0.8009433, -0.6320503, -2.395489, 0.8117647, 1, 0, 1,
-0.8006414, 0.07745415, -1.733775, 0.8078431, 1, 0, 1,
-0.7993076, -1.620733, -1.72252, 0.8, 1, 0, 1,
-0.7975449, -0.7965211, -3.838202, 0.7921569, 1, 0, 1,
-0.7926933, -0.4284216, -3.007725, 0.7882353, 1, 0, 1,
-0.789561, 0.02608878, -2.828444, 0.7803922, 1, 0, 1,
-0.7892774, -0.6580735, -2.818611, 0.7764706, 1, 0, 1,
-0.7849901, -1.372731, -1.90414, 0.7686275, 1, 0, 1,
-0.7848679, -0.3784775, -3.736261, 0.7647059, 1, 0, 1,
-0.7805011, 0.9850194, -0.6814499, 0.7568628, 1, 0, 1,
-0.7718237, 1.480288, -1.402008, 0.7529412, 1, 0, 1,
-0.7663423, 0.8283526, 0.5184467, 0.7450981, 1, 0, 1,
-0.762458, 0.7534485, -1.188191, 0.7411765, 1, 0, 1,
-0.761195, -0.6780157, -3.269845, 0.7333333, 1, 0, 1,
-0.7610359, 0.3931294, -2.553839, 0.7294118, 1, 0, 1,
-0.75631, 2.465647, -1.017542, 0.7215686, 1, 0, 1,
-0.7562677, -0.3127092, -1.172942, 0.7176471, 1, 0, 1,
-0.7542099, 0.8491468, -2.663849, 0.7098039, 1, 0, 1,
-0.7513506, 0.2811641, 1.209038, 0.7058824, 1, 0, 1,
-0.751051, 1.600783, -0.8383194, 0.6980392, 1, 0, 1,
-0.7507712, 0.5447618, -0.4190748, 0.6901961, 1, 0, 1,
-0.748476, -2.39798, -3.331526, 0.6862745, 1, 0, 1,
-0.7475755, 1.865196, 1.890255, 0.6784314, 1, 0, 1,
-0.7456961, 1.275402, 0.4085624, 0.6745098, 1, 0, 1,
-0.7419811, 1.884997, -1.439095, 0.6666667, 1, 0, 1,
-0.7408206, -0.04441734, -1.868943, 0.6627451, 1, 0, 1,
-0.739634, 0.7513906, -0.5880096, 0.654902, 1, 0, 1,
-0.7363675, -1.982655, -1.587304, 0.6509804, 1, 0, 1,
-0.7342668, -0.05397939, -1.466513, 0.6431373, 1, 0, 1,
-0.7320877, 2.056799, -2.093049, 0.6392157, 1, 0, 1,
-0.7282324, 0.2235638, -1.992435, 0.6313726, 1, 0, 1,
-0.7191468, -2.232047, -3.439671, 0.627451, 1, 0, 1,
-0.7185165, -0.5974759, -3.121851, 0.6196079, 1, 0, 1,
-0.7138728, 1.112032, -0.8038829, 0.6156863, 1, 0, 1,
-0.7059199, 1.510747, -2.86569, 0.6078432, 1, 0, 1,
-0.6954817, 1.845151, -0.05247589, 0.6039216, 1, 0, 1,
-0.6874455, 1.36971, 0.4100876, 0.5960785, 1, 0, 1,
-0.6785353, -0.3063157, -3.202787, 0.5882353, 1, 0, 1,
-0.6755729, -2.113333, -1.579288, 0.5843138, 1, 0, 1,
-0.6730491, 0.1203077, -0.3449269, 0.5764706, 1, 0, 1,
-0.6620164, -1.462661, -3.852056, 0.572549, 1, 0, 1,
-0.6555398, 0.1074355, -2.009898, 0.5647059, 1, 0, 1,
-0.65395, -0.604657, -1.937623, 0.5607843, 1, 0, 1,
-0.6526987, 0.02222999, -1.049767, 0.5529412, 1, 0, 1,
-0.6516739, -0.56072, -0.5693647, 0.5490196, 1, 0, 1,
-0.6504653, -0.7099607, -4.242887, 0.5411765, 1, 0, 1,
-0.6504328, -0.9893422, -2.799741, 0.5372549, 1, 0, 1,
-0.6474031, -0.05833434, -1.39451, 0.5294118, 1, 0, 1,
-0.6394057, -1.555058, -1.746877, 0.5254902, 1, 0, 1,
-0.6382352, 0.622991, -0.5459603, 0.5176471, 1, 0, 1,
-0.636182, -1.324046, -1.581104, 0.5137255, 1, 0, 1,
-0.6344403, -1.120352, -4.179076, 0.5058824, 1, 0, 1,
-0.6253428, -0.05641868, -1.336021, 0.5019608, 1, 0, 1,
-0.6217976, 1.88229, -0.1511153, 0.4941176, 1, 0, 1,
-0.6214622, 0.8845232, -2.11693, 0.4862745, 1, 0, 1,
-0.6182263, -1.075704, -2.0909, 0.4823529, 1, 0, 1,
-0.6156372, 0.1182484, -2.759888, 0.4745098, 1, 0, 1,
-0.6148159, -0.1991163, -1.700303, 0.4705882, 1, 0, 1,
-0.6125779, -0.6740054, -4.496413, 0.4627451, 1, 0, 1,
-0.6123319, 0.9535305, -1.655293, 0.4588235, 1, 0, 1,
-0.6085777, -1.73534, -1.742807, 0.4509804, 1, 0, 1,
-0.6024845, -1.427552, -3.697761, 0.4470588, 1, 0, 1,
-0.6015427, 1.055238, -0.7400561, 0.4392157, 1, 0, 1,
-0.5961246, -0.7965873, -3.075433, 0.4352941, 1, 0, 1,
-0.595184, -0.9999411, -2.484601, 0.427451, 1, 0, 1,
-0.5939227, 0.8401273, -0.1880157, 0.4235294, 1, 0, 1,
-0.5925908, 1.039874, -1.051004, 0.4156863, 1, 0, 1,
-0.5851988, 1.083281, -1.571126, 0.4117647, 1, 0, 1,
-0.5850759, -0.5513543, -2.015869, 0.4039216, 1, 0, 1,
-0.5845166, -0.6779689, -4.02058, 0.3960784, 1, 0, 1,
-0.5836358, -0.5094123, -3.564851, 0.3921569, 1, 0, 1,
-0.5834854, 0.2041748, -0.05169821, 0.3843137, 1, 0, 1,
-0.5832499, 0.8856381, 0.7002651, 0.3803922, 1, 0, 1,
-0.5828477, -1.925051, -3.605382, 0.372549, 1, 0, 1,
-0.5754279, -1.646947, -2.571633, 0.3686275, 1, 0, 1,
-0.574429, -0.1933023, -1.067457, 0.3607843, 1, 0, 1,
-0.5712088, 0.8097998, -0.1695771, 0.3568628, 1, 0, 1,
-0.5679064, -0.005899898, -1.013318, 0.3490196, 1, 0, 1,
-0.5673066, 0.08345456, -1.843388, 0.345098, 1, 0, 1,
-0.5650751, -1.103632, -1.965924, 0.3372549, 1, 0, 1,
-0.5590925, 1.827022, 0.9376768, 0.3333333, 1, 0, 1,
-0.5582658, 0.9394092, 1.340609, 0.3254902, 1, 0, 1,
-0.5579195, 0.6280344, -0.2984564, 0.3215686, 1, 0, 1,
-0.5562626, 0.006793783, 0.1839057, 0.3137255, 1, 0, 1,
-0.5550689, 0.3254508, -1.512631, 0.3098039, 1, 0, 1,
-0.5533807, 0.9467707, 0.2975328, 0.3019608, 1, 0, 1,
-0.5523358, 0.998113, 2.162289, 0.2941177, 1, 0, 1,
-0.5520716, 2.452323, 1.629262, 0.2901961, 1, 0, 1,
-0.5478417, -0.3923159, -3.154839, 0.282353, 1, 0, 1,
-0.5441152, 1.637216, 0.4700333, 0.2784314, 1, 0, 1,
-0.5438187, 0.118802, 0.4349268, 0.2705882, 1, 0, 1,
-0.5427552, 2.121616, -0.5703182, 0.2666667, 1, 0, 1,
-0.5402662, 0.1600542, 0.06756767, 0.2588235, 1, 0, 1,
-0.5286028, 0.5351107, -1.615907, 0.254902, 1, 0, 1,
-0.5281227, -1.646425, -2.495727, 0.2470588, 1, 0, 1,
-0.5207937, 1.602455, -0.3682068, 0.2431373, 1, 0, 1,
-0.5188187, -0.6842042, -1.488514, 0.2352941, 1, 0, 1,
-0.5155916, 0.2332638, -0.2709337, 0.2313726, 1, 0, 1,
-0.513763, -0.3634294, -2.266402, 0.2235294, 1, 0, 1,
-0.5019998, -0.7540495, -4.93491, 0.2196078, 1, 0, 1,
-0.501668, -1.456409, -3.05605, 0.2117647, 1, 0, 1,
-0.5015551, 2.409196, -0.1619744, 0.2078431, 1, 0, 1,
-0.4995495, 1.943263, -1.906457, 0.2, 1, 0, 1,
-0.4986836, -0.7091483, -1.77883, 0.1921569, 1, 0, 1,
-0.4965777, 0.4431806, -0.9255507, 0.1882353, 1, 0, 1,
-0.4928826, -0.6119294, -3.661982, 0.1803922, 1, 0, 1,
-0.4916831, 0.00275383, -1.587829, 0.1764706, 1, 0, 1,
-0.4874188, -0.5965289, -0.9725871, 0.1686275, 1, 0, 1,
-0.4850009, -0.6572995, -0.9219175, 0.1647059, 1, 0, 1,
-0.4844296, 0.3794882, 0.09082604, 0.1568628, 1, 0, 1,
-0.4797454, -0.7798105, -2.519412, 0.1529412, 1, 0, 1,
-0.4787, -0.8603072, -3.282587, 0.145098, 1, 0, 1,
-0.475241, -1.111978, -2.982976, 0.1411765, 1, 0, 1,
-0.4715294, -1.81338, -4.594209, 0.1333333, 1, 0, 1,
-0.4691748, -0.2320137, -5.238842, 0.1294118, 1, 0, 1,
-0.4673716, -1.47286, -2.117725, 0.1215686, 1, 0, 1,
-0.4654308, -0.8172159, -1.924335, 0.1176471, 1, 0, 1,
-0.4653622, -0.3024272, -2.167006, 0.1098039, 1, 0, 1,
-0.4612319, 1.978962, 0.4320711, 0.1058824, 1, 0, 1,
-0.4582896, -0.3412343, -3.671407, 0.09803922, 1, 0, 1,
-0.45479, 0.7748788, -2.492708, 0.09019608, 1, 0, 1,
-0.4535658, 0.1164718, -2.380464, 0.08627451, 1, 0, 1,
-0.4428204, -0.9926307, -3.160033, 0.07843138, 1, 0, 1,
-0.4403715, -0.156401, -1.397714, 0.07450981, 1, 0, 1,
-0.4351371, 0.8909103, 0.7639406, 0.06666667, 1, 0, 1,
-0.4335834, 1.41111, -0.6524133, 0.0627451, 1, 0, 1,
-0.4317384, -1.123105, -3.316304, 0.05490196, 1, 0, 1,
-0.4278192, 0.9465251, -1.677309, 0.05098039, 1, 0, 1,
-0.4159991, -0.305168, -3.187728, 0.04313726, 1, 0, 1,
-0.4117834, -1.343231, -3.545382, 0.03921569, 1, 0, 1,
-0.4115183, 0.1148256, -2.25875, 0.03137255, 1, 0, 1,
-0.4076499, 0.9832816, 0.8029937, 0.02745098, 1, 0, 1,
-0.4046627, -0.9913001, -2.152654, 0.01960784, 1, 0, 1,
-0.3995028, -0.1007867, -0.6545923, 0.01568628, 1, 0, 1,
-0.39853, -1.585318, -1.822704, 0.007843138, 1, 0, 1,
-0.3972972, 1.369148, 0.1278595, 0.003921569, 1, 0, 1,
-0.3880266, 1.656047, -1.123382, 0, 1, 0.003921569, 1,
-0.3873201, 0.05459601, -1.381755, 0, 1, 0.01176471, 1,
-0.3857901, -1.414072, -1.204366, 0, 1, 0.01568628, 1,
-0.3795243, 1.279236, 0.3873014, 0, 1, 0.02352941, 1,
-0.3780203, 0.3533342, -0.7889145, 0, 1, 0.02745098, 1,
-0.3776257, 0.7610038, 0.9638179, 0, 1, 0.03529412, 1,
-0.3767908, -0.1026582, -2.119056, 0, 1, 0.03921569, 1,
-0.366704, 2.054248, -0.01064653, 0, 1, 0.04705882, 1,
-0.3666122, 0.0201592, -2.506399, 0, 1, 0.05098039, 1,
-0.3629406, 0.08041041, -2.112481, 0, 1, 0.05882353, 1,
-0.3618033, -1.505726, -3.297979, 0, 1, 0.0627451, 1,
-0.3616116, -1.715973, -2.783513, 0, 1, 0.07058824, 1,
-0.3614344, 0.4856645, -0.4049748, 0, 1, 0.07450981, 1,
-0.3597438, 0.599655, -1.308156, 0, 1, 0.08235294, 1,
-0.359636, -0.2322403, -1.959361, 0, 1, 0.08627451, 1,
-0.3585751, 1.602418, -0.2818995, 0, 1, 0.09411765, 1,
-0.3546536, 0.5750663, -0.6731165, 0, 1, 0.1019608, 1,
-0.3457037, 0.01592713, -0.01112703, 0, 1, 0.1058824, 1,
-0.3443922, -1.645801, -2.902539, 0, 1, 0.1137255, 1,
-0.3406744, 1.082032, 0.09813686, 0, 1, 0.1176471, 1,
-0.3397131, -0.8325203, -1.784213, 0, 1, 0.1254902, 1,
-0.3367058, -0.04490813, -1.528869, 0, 1, 0.1294118, 1,
-0.3354934, 0.4005355, -0.6371982, 0, 1, 0.1372549, 1,
-0.3337137, 0.7926525, -0.8437734, 0, 1, 0.1411765, 1,
-0.3313624, 0.4940199, -0.1480259, 0, 1, 0.1490196, 1,
-0.3296634, -0.865886, -1.714562, 0, 1, 0.1529412, 1,
-0.3251636, -0.7922199, -2.448721, 0, 1, 0.1607843, 1,
-0.3213665, 0.3368649, -0.4014576, 0, 1, 0.1647059, 1,
-0.3196351, 1.086587, 0.9829822, 0, 1, 0.172549, 1,
-0.3165884, 0.7419147, 0.2477527, 0, 1, 0.1764706, 1,
-0.3137543, 0.6241562, 0.5738629, 0, 1, 0.1843137, 1,
-0.3126038, -0.9752202, -2.495188, 0, 1, 0.1882353, 1,
-0.3111842, 1.049016, 0.3583725, 0, 1, 0.1960784, 1,
-0.311021, 1.388208, 0.1693337, 0, 1, 0.2039216, 1,
-0.310511, 0.183699, -1.85847, 0, 1, 0.2078431, 1,
-0.3080239, -1.984993, -2.296797, 0, 1, 0.2156863, 1,
-0.3008591, 1.958342, -1.112259, 0, 1, 0.2196078, 1,
-0.2984819, 0.3219501, -2.031006, 0, 1, 0.227451, 1,
-0.2966253, 0.9027997, -0.1573104, 0, 1, 0.2313726, 1,
-0.2961738, -1.227247, -1.326805, 0, 1, 0.2392157, 1,
-0.2891814, 2.806043, -1.604905, 0, 1, 0.2431373, 1,
-0.2862297, 0.5164279, -0.6531653, 0, 1, 0.2509804, 1,
-0.2819591, 1.215264, 2.338814, 0, 1, 0.254902, 1,
-0.2763432, -1.511518, -4.913805, 0, 1, 0.2627451, 1,
-0.2716707, -0.6719908, -3.842752, 0, 1, 0.2666667, 1,
-0.2699143, 0.6955772, -2.20371, 0, 1, 0.2745098, 1,
-0.2686382, 0.8665426, 1.750602, 0, 1, 0.2784314, 1,
-0.2666152, -0.4542576, -1.185029, 0, 1, 0.2862745, 1,
-0.2656177, -0.7090544, -1.160675, 0, 1, 0.2901961, 1,
-0.2576866, 0.4189179, -0.8178459, 0, 1, 0.2980392, 1,
-0.2561272, 0.323247, -1.706851, 0, 1, 0.3058824, 1,
-0.2555523, -0.2427349, -2.110073, 0, 1, 0.3098039, 1,
-0.2551438, -0.732354, -3.090187, 0, 1, 0.3176471, 1,
-0.2546868, 1.06453, -0.2039992, 0, 1, 0.3215686, 1,
-0.2545335, -0.7290601, -3.900245, 0, 1, 0.3294118, 1,
-0.2514125, 0.3776135, -0.730428, 0, 1, 0.3333333, 1,
-0.2473835, -1.135432, -4.249404, 0, 1, 0.3411765, 1,
-0.2420111, 0.3364787, -3.343622, 0, 1, 0.345098, 1,
-0.241716, -0.1677988, -2.91159, 0, 1, 0.3529412, 1,
-0.2337747, 0.8041735, -0.7911018, 0, 1, 0.3568628, 1,
-0.2333602, 0.3236597, -1.497488, 0, 1, 0.3647059, 1,
-0.2328624, 0.6868236, 2.248405, 0, 1, 0.3686275, 1,
-0.23275, -0.6163365, -4.70901, 0, 1, 0.3764706, 1,
-0.2315999, 0.6081375, -1.122949, 0, 1, 0.3803922, 1,
-0.2303989, 2.090538, 0.7870252, 0, 1, 0.3882353, 1,
-0.2261959, -0.3839679, -3.149614, 0, 1, 0.3921569, 1,
-0.2196967, -1.83029, -2.032431, 0, 1, 0.4, 1,
-0.2137788, 0.006431904, -2.130098, 0, 1, 0.4078431, 1,
-0.2117229, -0.6431188, -3.197343, 0, 1, 0.4117647, 1,
-0.2112762, 0.3860104, 0.1095341, 0, 1, 0.4196078, 1,
-0.2105667, 1.50685, -2.160616, 0, 1, 0.4235294, 1,
-0.2072511, 0.3703888, -2.475266, 0, 1, 0.4313726, 1,
-0.2055688, 1.612081, 2.411079, 0, 1, 0.4352941, 1,
-0.2042383, -0.1540012, -2.180834, 0, 1, 0.4431373, 1,
-0.204179, 0.2931244, 0.2790817, 0, 1, 0.4470588, 1,
-0.2035896, 0.1395221, -1.679649, 0, 1, 0.454902, 1,
-0.2033601, -1.632589, -2.57686, 0, 1, 0.4588235, 1,
-0.1991923, -0.138729, -2.247419, 0, 1, 0.4666667, 1,
-0.1958065, -0.6001979, -3.238569, 0, 1, 0.4705882, 1,
-0.1923377, 0.8781356, -0.2819511, 0, 1, 0.4784314, 1,
-0.1898262, -1.763505, -3.374066, 0, 1, 0.4823529, 1,
-0.1893466, 0.9131352, -0.4562956, 0, 1, 0.4901961, 1,
-0.1869972, 0.9217079, -0.4585675, 0, 1, 0.4941176, 1,
-0.1819123, -0.7985143, -3.343852, 0, 1, 0.5019608, 1,
-0.1788986, 1.171229, -1.409817, 0, 1, 0.509804, 1,
-0.1731969, 0.5929689, 0.4578037, 0, 1, 0.5137255, 1,
-0.1667291, -0.5683292, -4.151359, 0, 1, 0.5215687, 1,
-0.165089, 0.05746024, -2.277771, 0, 1, 0.5254902, 1,
-0.1572428, 1.141754, 0.3004763, 0, 1, 0.5333334, 1,
-0.1537199, -0.2073661, -1.521283, 0, 1, 0.5372549, 1,
-0.1523459, 0.3653306, 1.751012, 0, 1, 0.5450981, 1,
-0.1435026, -0.9494865, -3.758576, 0, 1, 0.5490196, 1,
-0.1369414, 0.58647, -0.2158845, 0, 1, 0.5568628, 1,
-0.1362698, 0.9371873, -1.27171, 0, 1, 0.5607843, 1,
-0.1335327, 0.6197761, -0.6000979, 0, 1, 0.5686275, 1,
-0.1311795, 0.26115, -0.3995367, 0, 1, 0.572549, 1,
-0.1294321, 1.698629, 0.4640375, 0, 1, 0.5803922, 1,
-0.1254942, 0.3704472, -2.899285, 0, 1, 0.5843138, 1,
-0.1240088, -1.075125, -3.296502, 0, 1, 0.5921569, 1,
-0.1193685, -0.8432879, -1.187531, 0, 1, 0.5960785, 1,
-0.1192994, -1.856021, -4.292075, 0, 1, 0.6039216, 1,
-0.1179391, -0.9059483, -4.776128, 0, 1, 0.6117647, 1,
-0.1152535, 0.118709, -0.009967668, 0, 1, 0.6156863, 1,
-0.1134621, 2.139834, -0.4871442, 0, 1, 0.6235294, 1,
-0.1126807, 0.2720946, -0.03664734, 0, 1, 0.627451, 1,
-0.1059105, -0.3984092, -3.679808, 0, 1, 0.6352941, 1,
-0.1057689, -0.2774196, -3.540437, 0, 1, 0.6392157, 1,
-0.09578767, 0.7033634, -1.380759, 0, 1, 0.6470588, 1,
-0.09450117, -1.495634, -4.541552, 0, 1, 0.6509804, 1,
-0.09385856, -0.6419265, -1.921891, 0, 1, 0.6588235, 1,
-0.09255267, -0.8006978, -3.857376, 0, 1, 0.6627451, 1,
-0.09240943, -0.6489484, -2.796665, 0, 1, 0.6705883, 1,
-0.09176536, 2.06484, -0.3244654, 0, 1, 0.6745098, 1,
-0.08048978, -0.1271241, -3.078569, 0, 1, 0.682353, 1,
-0.07897405, -1.131314, -2.967635, 0, 1, 0.6862745, 1,
-0.07303347, 1.04551, 1.086202, 0, 1, 0.6941177, 1,
-0.07243372, -1.170019, -2.47581, 0, 1, 0.7019608, 1,
-0.07141413, 0.685491, 0.5287099, 0, 1, 0.7058824, 1,
-0.0686529, 0.2336501, 1.604993, 0, 1, 0.7137255, 1,
-0.06777446, 1.032685, 0.3785277, 0, 1, 0.7176471, 1,
-0.06411502, 1.713532, -1.899563, 0, 1, 0.7254902, 1,
-0.06398321, -0.4334721, -2.550004, 0, 1, 0.7294118, 1,
-0.06384943, -0.6865425, -3.045556, 0, 1, 0.7372549, 1,
-0.06294152, -2.297061, -2.880084, 0, 1, 0.7411765, 1,
-0.06256642, 0.3873345, -0.8040377, 0, 1, 0.7490196, 1,
-0.06011032, -1.596563, -3.968044, 0, 1, 0.7529412, 1,
-0.05479945, 0.5593717, -1.681371, 0, 1, 0.7607843, 1,
-0.05021313, -1.561242, -2.545264, 0, 1, 0.7647059, 1,
-0.04539089, 2.409974, -0.1011316, 0, 1, 0.772549, 1,
-0.04340019, 0.07737782, -0.059371, 0, 1, 0.7764706, 1,
-0.04094308, 0.02456465, 0.03960804, 0, 1, 0.7843137, 1,
-0.03943525, -1.974479, -3.511518, 0, 1, 0.7882353, 1,
-0.0272803, 1.077591, 1.7006, 0, 1, 0.7960784, 1,
-0.02637903, 1.616416, -2.36849, 0, 1, 0.8039216, 1,
-0.02384124, -0.5911946, -4.029751, 0, 1, 0.8078431, 1,
-0.02286914, 0.7692707, -1.006883, 0, 1, 0.8156863, 1,
-0.02073381, -0.6665015, -2.951345, 0, 1, 0.8196079, 1,
-0.01845775, -1.017771, -4.024523, 0, 1, 0.827451, 1,
-0.01675618, -0.4155252, -2.967921, 0, 1, 0.8313726, 1,
-0.01625487, 0.3060933, 0.1069916, 0, 1, 0.8392157, 1,
-0.01455955, -0.1153528, -1.651695, 0, 1, 0.8431373, 1,
-0.01365525, 0.08406436, 0.6785994, 0, 1, 0.8509804, 1,
-0.01209126, -0.926389, -1.222862, 0, 1, 0.854902, 1,
-0.01090038, 2.263891, -0.6111633, 0, 1, 0.8627451, 1,
-0.01077143, -0.7416766, -3.536824, 0, 1, 0.8666667, 1,
-0.005985044, -1.090023, -3.522793, 0, 1, 0.8745098, 1,
-0.004282474, 1.166223, 0.3630952, 0, 1, 0.8784314, 1,
-0.001758887, -0.08098155, -2.773864, 0, 1, 0.8862745, 1,
0.003220615, 1.315826, 0.6647167, 0, 1, 0.8901961, 1,
0.004729425, -0.2654656, 1.976577, 0, 1, 0.8980392, 1,
0.004902539, 1.34925, 0.7050738, 0, 1, 0.9058824, 1,
0.008712058, -0.8561912, 2.835359, 0, 1, 0.9098039, 1,
0.01033014, 0.2917784, 0.5028061, 0, 1, 0.9176471, 1,
0.0161971, -1.748963, 3.624797, 0, 1, 0.9215686, 1,
0.01672618, -0.3841352, 4.821072, 0, 1, 0.9294118, 1,
0.0189565, -1.631574, 3.131702, 0, 1, 0.9333333, 1,
0.02154982, -1.245474, 4.376695, 0, 1, 0.9411765, 1,
0.02191955, 1.339244, -1.184472, 0, 1, 0.945098, 1,
0.02197964, -0.9951958, 3.561396, 0, 1, 0.9529412, 1,
0.02328603, 1.232553, 1.074126, 0, 1, 0.9568627, 1,
0.02739343, 0.6000257, 0.4151413, 0, 1, 0.9647059, 1,
0.03052896, -0.1071343, 2.882565, 0, 1, 0.9686275, 1,
0.03290964, -0.4634227, 4.49584, 0, 1, 0.9764706, 1,
0.03417437, -1.256873, 4.127935, 0, 1, 0.9803922, 1,
0.03441861, -0.609054, 2.700549, 0, 1, 0.9882353, 1,
0.03442781, -0.6669126, 6.549601, 0, 1, 0.9921569, 1,
0.03623941, 0.5633704, 1.160571, 0, 1, 1, 1,
0.03636878, -1.202969, 1.765254, 0, 0.9921569, 1, 1,
0.03770201, 0.1106048, 0.4466606, 0, 0.9882353, 1, 1,
0.0384325, -0.08763454, 1.055951, 0, 0.9803922, 1, 1,
0.04302531, -0.524176, 2.507149, 0, 0.9764706, 1, 1,
0.04662693, -0.2522846, 3.186534, 0, 0.9686275, 1, 1,
0.04840161, 1.697517, 1.104288, 0, 0.9647059, 1, 1,
0.05070892, -0.2038448, 3.689682, 0, 0.9568627, 1, 1,
0.05157254, 0.4349335, -0.1289769, 0, 0.9529412, 1, 1,
0.05252621, 0.8616977, 1.184076, 0, 0.945098, 1, 1,
0.05362499, -0.5303801, 3.133973, 0, 0.9411765, 1, 1,
0.05380965, 0.5334545, -0.2528533, 0, 0.9333333, 1, 1,
0.05548651, -0.6831133, 3.529626, 0, 0.9294118, 1, 1,
0.05691697, 0.03073471, -0.754088, 0, 0.9215686, 1, 1,
0.05797995, -1.380331, 3.901434, 0, 0.9176471, 1, 1,
0.06054242, -1.478966, 3.400975, 0, 0.9098039, 1, 1,
0.06302228, 0.2351142, 0.08014061, 0, 0.9058824, 1, 1,
0.06352144, -0.03606249, 2.504088, 0, 0.8980392, 1, 1,
0.06426776, -1.548624, 3.933001, 0, 0.8901961, 1, 1,
0.06735869, 0.950429, 0.1118066, 0, 0.8862745, 1, 1,
0.07049891, 1.794935, -1.094343, 0, 0.8784314, 1, 1,
0.07463357, -2.035803, 1.070467, 0, 0.8745098, 1, 1,
0.07992839, 0.4275372, 0.07126669, 0, 0.8666667, 1, 1,
0.08053868, 1.86237, -0.3422636, 0, 0.8627451, 1, 1,
0.08236737, -0.3424632, 3.469465, 0, 0.854902, 1, 1,
0.08346268, -0.6387343, 3.626204, 0, 0.8509804, 1, 1,
0.08752871, -0.2245803, 2.218895, 0, 0.8431373, 1, 1,
0.08875234, -0.5221485, 2.336192, 0, 0.8392157, 1, 1,
0.08949739, 1.634943, 0.4378619, 0, 0.8313726, 1, 1,
0.09027391, 1.919465, -0.3876154, 0, 0.827451, 1, 1,
0.09118985, -1.219598, 3.763104, 0, 0.8196079, 1, 1,
0.09207997, -0.01135329, 2.044363, 0, 0.8156863, 1, 1,
0.09400783, 1.395457, 0.6443461, 0, 0.8078431, 1, 1,
0.09595642, -0.2710599, 3.573717, 0, 0.8039216, 1, 1,
0.09853964, 0.3269845, -1.071995, 0, 0.7960784, 1, 1,
0.09939317, 1.973537, -0.2679945, 0, 0.7882353, 1, 1,
0.0999923, -0.3615635, 0.5999876, 0, 0.7843137, 1, 1,
0.1040714, -0.2023371, 1.497543, 0, 0.7764706, 1, 1,
0.1075985, 1.685539, 1.289178, 0, 0.772549, 1, 1,
0.1078443, -0.7101771, 3.788115, 0, 0.7647059, 1, 1,
0.1100815, -0.5202294, 1.106918, 0, 0.7607843, 1, 1,
0.1104935, 2.01601, 0.5718269, 0, 0.7529412, 1, 1,
0.111965, 0.8154325, 0.9735866, 0, 0.7490196, 1, 1,
0.1150785, -0.06907048, 2.248946, 0, 0.7411765, 1, 1,
0.1204203, 1.634614, 0.5922935, 0, 0.7372549, 1, 1,
0.1209285, 1.325795, 0.7666031, 0, 0.7294118, 1, 1,
0.1233807, 1.939736, 1.574986, 0, 0.7254902, 1, 1,
0.124015, -1.292794, 0.9847964, 0, 0.7176471, 1, 1,
0.1287375, -0.4911118, 3.252378, 0, 0.7137255, 1, 1,
0.1307852, 1.191334, -0.2789015, 0, 0.7058824, 1, 1,
0.1312991, -0.9023411, 2.67189, 0, 0.6980392, 1, 1,
0.1355463, 0.950087, 0.1479134, 0, 0.6941177, 1, 1,
0.1371393, 0.624757, 1.385924, 0, 0.6862745, 1, 1,
0.1385641, -0.7776703, 2.647704, 0, 0.682353, 1, 1,
0.1397154, -1.579944, 1.794862, 0, 0.6745098, 1, 1,
0.1424017, 0.5669846, -0.3798927, 0, 0.6705883, 1, 1,
0.1446667, 2.330899, -1.726508, 0, 0.6627451, 1, 1,
0.1461906, 0.4704836, 0.7784852, 0, 0.6588235, 1, 1,
0.1495996, -0.2391403, 3.954872, 0, 0.6509804, 1, 1,
0.1510614, -0.5203912, 2.157097, 0, 0.6470588, 1, 1,
0.1538119, -1.283201, 3.957936, 0, 0.6392157, 1, 1,
0.1600043, -1.537434, 2.69367, 0, 0.6352941, 1, 1,
0.1610428, 1.071931, -0.496193, 0, 0.627451, 1, 1,
0.1617061, -0.1568, 3.74268, 0, 0.6235294, 1, 1,
0.1621895, -0.4647655, 2.329056, 0, 0.6156863, 1, 1,
0.1622168, 0.4734232, 1.114746, 0, 0.6117647, 1, 1,
0.1626634, 0.5108078, 0.9496668, 0, 0.6039216, 1, 1,
0.1629409, 0.7599639, 1.078581, 0, 0.5960785, 1, 1,
0.1645899, -1.456278, 2.251856, 0, 0.5921569, 1, 1,
0.1652332, 0.1947491, -1.781613, 0, 0.5843138, 1, 1,
0.1726473, 0.4745001, 1.148171, 0, 0.5803922, 1, 1,
0.1742376, -0.3147106, 1.44703, 0, 0.572549, 1, 1,
0.1757362, 0.8676995, 1.001986, 0, 0.5686275, 1, 1,
0.1764729, 0.5787043, 0.0654794, 0, 0.5607843, 1, 1,
0.1764933, 0.07821802, 2.538576, 0, 0.5568628, 1, 1,
0.1789313, -1.385403, 2.798151, 0, 0.5490196, 1, 1,
0.1828333, -0.4307941, 2.142377, 0, 0.5450981, 1, 1,
0.1836247, 0.3941751, 0.3483657, 0, 0.5372549, 1, 1,
0.1848149, -1.119488, 4.396492, 0, 0.5333334, 1, 1,
0.1864652, 0.8395831, 0.4484212, 0, 0.5254902, 1, 1,
0.1906411, -0.01302758, 0.43754, 0, 0.5215687, 1, 1,
0.1925957, -0.8630698, 3.355454, 0, 0.5137255, 1, 1,
0.1943509, -0.5972381, 1.760229, 0, 0.509804, 1, 1,
0.1973094, 0.1949427, 0.1713068, 0, 0.5019608, 1, 1,
0.1981122, 1.118904, 1.310357, 0, 0.4941176, 1, 1,
0.2001965, 0.8720352, -0.915823, 0, 0.4901961, 1, 1,
0.201249, -0.01766996, 1.579394, 0, 0.4823529, 1, 1,
0.2019976, 1.754324, -0.9455394, 0, 0.4784314, 1, 1,
0.2034128, -0.457013, 3.659645, 0, 0.4705882, 1, 1,
0.2052973, -1.602413, 4.22604, 0, 0.4666667, 1, 1,
0.2109919, -1.628965, 4.841924, 0, 0.4588235, 1, 1,
0.2112006, 1.67249, -0.4870177, 0, 0.454902, 1, 1,
0.2184856, -0.1023452, 3.450565, 0, 0.4470588, 1, 1,
0.2244914, 0.4119107, 1.859902, 0, 0.4431373, 1, 1,
0.2350934, 0.5529993, -1.201464, 0, 0.4352941, 1, 1,
0.2431377, -1.147831, 2.528562, 0, 0.4313726, 1, 1,
0.2435805, 1.256008, 2.050737, 0, 0.4235294, 1, 1,
0.2512619, 0.2478739, 0.4864901, 0, 0.4196078, 1, 1,
0.2520706, 0.2815336, 0.9120103, 0, 0.4117647, 1, 1,
0.2525541, 1.01886, 0.09856001, 0, 0.4078431, 1, 1,
0.2563825, 0.1993218, 1.103519, 0, 0.4, 1, 1,
0.2580979, 0.2405144, 0.858422, 0, 0.3921569, 1, 1,
0.2592987, -0.889118, 2.818599, 0, 0.3882353, 1, 1,
0.2595213, 0.5536259, 1.405858, 0, 0.3803922, 1, 1,
0.2632172, -2.048943, 1.892595, 0, 0.3764706, 1, 1,
0.2633452, 0.9991939, -0.3049147, 0, 0.3686275, 1, 1,
0.2659419, 0.3759935, -1.024499, 0, 0.3647059, 1, 1,
0.2659687, -1.817277, 3.063539, 0, 0.3568628, 1, 1,
0.26741, -0.2158332, 2.968971, 0, 0.3529412, 1, 1,
0.2756753, 0.2826895, 0.7310546, 0, 0.345098, 1, 1,
0.2768656, -1.095255, 4.425779, 0, 0.3411765, 1, 1,
0.2785891, -1.487838, 1.730059, 0, 0.3333333, 1, 1,
0.2811586, 1.269589, 0.7709828, 0, 0.3294118, 1, 1,
0.2828657, 1.281028, 1.214767, 0, 0.3215686, 1, 1,
0.2835255, -0.4434254, 1.154694, 0, 0.3176471, 1, 1,
0.2851217, 2.327562, 0.2369017, 0, 0.3098039, 1, 1,
0.2869037, 1.096057, 1.253546, 0, 0.3058824, 1, 1,
0.289473, -0.9373747, 1.497222, 0, 0.2980392, 1, 1,
0.289623, 1.216199, 0.3169317, 0, 0.2901961, 1, 1,
0.2902957, -0.3033313, 2.921135, 0, 0.2862745, 1, 1,
0.2978791, 0.2670149, 0.3157785, 0, 0.2784314, 1, 1,
0.3047942, -0.2174255, 3.799963, 0, 0.2745098, 1, 1,
0.3076715, -0.4993765, 3.831128, 0, 0.2666667, 1, 1,
0.3201835, 0.07810525, 0.1208687, 0, 0.2627451, 1, 1,
0.3210907, -0.266416, 3.368663, 0, 0.254902, 1, 1,
0.3210952, 1.260931, 0.4243959, 0, 0.2509804, 1, 1,
0.3245476, -0.8721894, 2.560781, 0, 0.2431373, 1, 1,
0.3297596, -1.383863, 3.76369, 0, 0.2392157, 1, 1,
0.3305751, -0.2746757, 4.5379, 0, 0.2313726, 1, 1,
0.3306333, 0.9129819, 1.92843, 0, 0.227451, 1, 1,
0.3316334, 0.1292048, -0.1495472, 0, 0.2196078, 1, 1,
0.3320928, -1.013998, 4.156453, 0, 0.2156863, 1, 1,
0.3352225, 0.2009451, 1.783577, 0, 0.2078431, 1, 1,
0.3365588, -0.6911485, 2.387748, 0, 0.2039216, 1, 1,
0.339693, 0.2775162, 1.120173, 0, 0.1960784, 1, 1,
0.3426778, -0.2603925, 1.424111, 0, 0.1882353, 1, 1,
0.3463, 1.580393, -0.7310313, 0, 0.1843137, 1, 1,
0.3464371, 0.3756839, 2.53778, 0, 0.1764706, 1, 1,
0.3466085, 2.072967, 1.101264, 0, 0.172549, 1, 1,
0.347755, 0.3819711, 2.025707, 0, 0.1647059, 1, 1,
0.3482873, -0.2156805, 2.47268, 0, 0.1607843, 1, 1,
0.3500507, -2.108399, 2.218859, 0, 0.1529412, 1, 1,
0.3503054, 2.154285, -0.8733737, 0, 0.1490196, 1, 1,
0.3512356, 0.7180553, 1.21156, 0, 0.1411765, 1, 1,
0.3548573, -1.005818, 2.214837, 0, 0.1372549, 1, 1,
0.3554132, -0.03753803, 1.765651, 0, 0.1294118, 1, 1,
0.3577326, -0.1019456, 2.341192, 0, 0.1254902, 1, 1,
0.3579509, -0.1387992, 2.555342, 0, 0.1176471, 1, 1,
0.3589178, -2.401765, 3.024956, 0, 0.1137255, 1, 1,
0.3656774, -0.1694134, 2.502028, 0, 0.1058824, 1, 1,
0.3658251, 1.28087, -0.1428074, 0, 0.09803922, 1, 1,
0.3710971, 0.3156059, 0.2031323, 0, 0.09411765, 1, 1,
0.3794898, 0.2280597, 0.5227093, 0, 0.08627451, 1, 1,
0.3797368, -1.846816, 3.813333, 0, 0.08235294, 1, 1,
0.3806381, 2.530289, 0.1549606, 0, 0.07450981, 1, 1,
0.3843982, 0.1095419, 3.155314, 0, 0.07058824, 1, 1,
0.3853415, 0.08198276, -0.8789738, 0, 0.0627451, 1, 1,
0.386099, -0.2062662, 2.09415, 0, 0.05882353, 1, 1,
0.387365, -0.7483535, 1.526665, 0, 0.05098039, 1, 1,
0.3878191, -0.002049402, 1.003782, 0, 0.04705882, 1, 1,
0.3892277, -0.7281557, 2.028427, 0, 0.03921569, 1, 1,
0.3901869, 0.3577626, 1.193231, 0, 0.03529412, 1, 1,
0.3952346, -1.826621, 4.400146, 0, 0.02745098, 1, 1,
0.3976023, 0.5185255, 0.4537476, 0, 0.02352941, 1, 1,
0.400649, 1.548251, -0.5137361, 0, 0.01568628, 1, 1,
0.4044794, 0.7870289, -0.3990347, 0, 0.01176471, 1, 1,
0.4115925, 1.225198, 1.891319, 0, 0.003921569, 1, 1,
0.4169395, -1.246727, 3.381875, 0.003921569, 0, 1, 1,
0.4218607, 0.1249013, 0.3246919, 0.007843138, 0, 1, 1,
0.4227085, -0.3986063, 2.529697, 0.01568628, 0, 1, 1,
0.4245706, 1.368526, 0.08277963, 0.01960784, 0, 1, 1,
0.4262609, -1.238986, 2.045079, 0.02745098, 0, 1, 1,
0.4286475, 0.03325152, 1.299695, 0.03137255, 0, 1, 1,
0.4297784, 0.8848397, 0.1335573, 0.03921569, 0, 1, 1,
0.4304967, 1.130606, 0.7832805, 0.04313726, 0, 1, 1,
0.4318406, 1.642333, 0.8036263, 0.05098039, 0, 1, 1,
0.4331941, -0.4649356, 2.452909, 0.05490196, 0, 1, 1,
0.4365816, -0.2896098, 3.161222, 0.0627451, 0, 1, 1,
0.4416741, -0.7097285, 2.226382, 0.06666667, 0, 1, 1,
0.4441962, -0.8884829, 2.554699, 0.07450981, 0, 1, 1,
0.4449874, -1.109544, 3.082463, 0.07843138, 0, 1, 1,
0.4454236, -0.01373096, 1.681141, 0.08627451, 0, 1, 1,
0.4495305, -0.2645, -0.2415367, 0.09019608, 0, 1, 1,
0.4502222, -0.3896412, 3.681676, 0.09803922, 0, 1, 1,
0.45138, 0.4975479, 0.002212976, 0.1058824, 0, 1, 1,
0.455929, 0.04716504, 3.867399, 0.1098039, 0, 1, 1,
0.4592994, 0.8005275, 0.002542268, 0.1176471, 0, 1, 1,
0.4600159, -0.05720501, 0.8884194, 0.1215686, 0, 1, 1,
0.4713466, 0.296044, 0.1936915, 0.1294118, 0, 1, 1,
0.4725351, -0.4855216, 2.381958, 0.1333333, 0, 1, 1,
0.4770671, -1.819653, 3.193683, 0.1411765, 0, 1, 1,
0.4774584, -0.7055837, 2.672438, 0.145098, 0, 1, 1,
0.4789768, 0.2669573, 3.410413, 0.1529412, 0, 1, 1,
0.4811531, 0.7431889, -0.4067672, 0.1568628, 0, 1, 1,
0.4820886, -0.6338436, 0.7039796, 0.1647059, 0, 1, 1,
0.4895475, 0.7476086, 0.2216512, 0.1686275, 0, 1, 1,
0.4940395, -0.9207081, 3.134424, 0.1764706, 0, 1, 1,
0.4960601, 0.3180043, 1.57239, 0.1803922, 0, 1, 1,
0.5039889, -0.1595008, 2.193659, 0.1882353, 0, 1, 1,
0.5063173, 1.594715, 1.136656, 0.1921569, 0, 1, 1,
0.5069112, 0.08120925, 2.662541, 0.2, 0, 1, 1,
0.5237334, 0.7445341, 1.132283, 0.2078431, 0, 1, 1,
0.5254577, -0.4379156, 0.4539043, 0.2117647, 0, 1, 1,
0.5255395, 0.4185666, 0.6944793, 0.2196078, 0, 1, 1,
0.5293056, 0.4338779, 0.6593811, 0.2235294, 0, 1, 1,
0.5314218, 0.1391836, 1.13208, 0.2313726, 0, 1, 1,
0.5325248, -0.058873, 0.9311848, 0.2352941, 0, 1, 1,
0.5374823, -1.356064, 4.211532, 0.2431373, 0, 1, 1,
0.5418211, 1.030272, -0.1079425, 0.2470588, 0, 1, 1,
0.553592, 0.2574331, 1.638592, 0.254902, 0, 1, 1,
0.5554623, 0.3754024, 0.4777272, 0.2588235, 0, 1, 1,
0.5589359, -0.611623, 3.079753, 0.2666667, 0, 1, 1,
0.5604262, 0.04381666, 4.098039, 0.2705882, 0, 1, 1,
0.5610556, -1.174769, 1.604035, 0.2784314, 0, 1, 1,
0.5660593, -0.9075951, 3.614435, 0.282353, 0, 1, 1,
0.5679318, -2.070935, 3.729666, 0.2901961, 0, 1, 1,
0.5691038, -1.322089, 2.637424, 0.2941177, 0, 1, 1,
0.5731753, -1.141953, 1.814555, 0.3019608, 0, 1, 1,
0.5738863, -0.8902573, 5.301677, 0.3098039, 0, 1, 1,
0.5741091, -0.7274002, 0.6079754, 0.3137255, 0, 1, 1,
0.5793753, -1.133276, 1.606711, 0.3215686, 0, 1, 1,
0.5954055, 0.1903859, 1.846598, 0.3254902, 0, 1, 1,
0.5979361, 0.3246152, -1.11578, 0.3333333, 0, 1, 1,
0.5991126, -0.8455167, 2.592854, 0.3372549, 0, 1, 1,
0.6038607, -0.729981, 3.842111, 0.345098, 0, 1, 1,
0.61617, 0.8263512, 0.1179575, 0.3490196, 0, 1, 1,
0.6189604, -0.5831792, 1.446379, 0.3568628, 0, 1, 1,
0.6192706, 1.88248, -0.0597635, 0.3607843, 0, 1, 1,
0.6271766, -2.238776, 3.488061, 0.3686275, 0, 1, 1,
0.6288117, -0.348994, 2.347847, 0.372549, 0, 1, 1,
0.6297936, 1.435673, 0.9074889, 0.3803922, 0, 1, 1,
0.6327062, 0.9367913, 0.5973769, 0.3843137, 0, 1, 1,
0.6388644, -0.8265426, 4.526149, 0.3921569, 0, 1, 1,
0.6391963, -0.7031537, 3.2679, 0.3960784, 0, 1, 1,
0.6442577, 0.5960436, -1.086308, 0.4039216, 0, 1, 1,
0.6452868, -0.8667492, 3.958668, 0.4117647, 0, 1, 1,
0.6458843, -0.6995377, 2.113641, 0.4156863, 0, 1, 1,
0.6507549, -0.6680923, 1.604871, 0.4235294, 0, 1, 1,
0.6566141, -0.4916637, 2.728701, 0.427451, 0, 1, 1,
0.6567284, 0.518375, 2.170115, 0.4352941, 0, 1, 1,
0.6577581, 0.02104618, 1.326024, 0.4392157, 0, 1, 1,
0.658823, 0.26898, 0.9144666, 0.4470588, 0, 1, 1,
0.6631983, 1.564019, 0.4849018, 0.4509804, 0, 1, 1,
0.6645424, 0.8275402, 0.1591996, 0.4588235, 0, 1, 1,
0.6647494, 0.525382, 1.505987, 0.4627451, 0, 1, 1,
0.6663838, -1.215687, 2.707875, 0.4705882, 0, 1, 1,
0.6739305, -0.5282624, 1.492436, 0.4745098, 0, 1, 1,
0.6759298, 0.4251198, 0.6508361, 0.4823529, 0, 1, 1,
0.6769542, 0.4208781, 1.284655, 0.4862745, 0, 1, 1,
0.68744, -0.1044176, 2.593523, 0.4941176, 0, 1, 1,
0.6892492, 0.1441683, 2.795697, 0.5019608, 0, 1, 1,
0.6896349, -0.451723, 2.284279, 0.5058824, 0, 1, 1,
0.6926172, 0.6588982, 1.006913, 0.5137255, 0, 1, 1,
0.6989298, -0.8044948, 2.131087, 0.5176471, 0, 1, 1,
0.6998954, -0.984485, 1.95287, 0.5254902, 0, 1, 1,
0.6999705, 0.20756, 1.018908, 0.5294118, 0, 1, 1,
0.7001069, 0.06612175, 0.3023836, 0.5372549, 0, 1, 1,
0.7028999, 3.077366, 0.5671811, 0.5411765, 0, 1, 1,
0.7083455, -0.7763485, 3.867601, 0.5490196, 0, 1, 1,
0.7147337, 0.1407402, 0.8338532, 0.5529412, 0, 1, 1,
0.7176411, -0.3478615, 1.362666, 0.5607843, 0, 1, 1,
0.7212763, 0.3692135, 0.8607588, 0.5647059, 0, 1, 1,
0.7281223, 1.361767, 1.116826, 0.572549, 0, 1, 1,
0.7306607, -1.534849, 3.048631, 0.5764706, 0, 1, 1,
0.7374969, 0.8958409, 1.25543, 0.5843138, 0, 1, 1,
0.7395194, 1.391086, -0.4736115, 0.5882353, 0, 1, 1,
0.7415102, 0.5652799, 0.7815421, 0.5960785, 0, 1, 1,
0.7455945, 0.8840698, -0.09122649, 0.6039216, 0, 1, 1,
0.7494264, 0.7422506, 1.942067, 0.6078432, 0, 1, 1,
0.755626, -0.8542797, 1.990481, 0.6156863, 0, 1, 1,
0.7593397, 0.6002944, 2.008936, 0.6196079, 0, 1, 1,
0.7603163, 0.1302371, 1.142976, 0.627451, 0, 1, 1,
0.761866, -0.8635788, 2.342883, 0.6313726, 0, 1, 1,
0.7684538, -0.1197731, 2.25152, 0.6392157, 0, 1, 1,
0.7740775, -1.699099, 0.9628444, 0.6431373, 0, 1, 1,
0.7836719, 0.8714873, 0.6629125, 0.6509804, 0, 1, 1,
0.7925428, -0.1091666, 1.536844, 0.654902, 0, 1, 1,
0.7926607, -0.3384813, 1.324313, 0.6627451, 0, 1, 1,
0.793879, 1.129086, 2.962813, 0.6666667, 0, 1, 1,
0.7939989, -0.5550537, 2.62797, 0.6745098, 0, 1, 1,
0.7940535, 0.9984788, -0.1484272, 0.6784314, 0, 1, 1,
0.7973531, -0.5993499, 2.785064, 0.6862745, 0, 1, 1,
0.799018, -2.588897, 3.903871, 0.6901961, 0, 1, 1,
0.8037993, -0.9134464, 0.9102407, 0.6980392, 0, 1, 1,
0.8100687, 1.013324, 1.847871, 0.7058824, 0, 1, 1,
0.8166239, -2.296238, 4.107832, 0.7098039, 0, 1, 1,
0.8203772, 1.001234, -0.2579165, 0.7176471, 0, 1, 1,
0.828062, 0.5945136, 0.08064704, 0.7215686, 0, 1, 1,
0.8433766, 0.4802182, 0.6828774, 0.7294118, 0, 1, 1,
0.8461183, 1.550711, 1.143685, 0.7333333, 0, 1, 1,
0.8479978, 0.378197, 1.123148, 0.7411765, 0, 1, 1,
0.8603433, 0.3307247, 4.062338, 0.7450981, 0, 1, 1,
0.8641527, 0.7230306, 2.042702, 0.7529412, 0, 1, 1,
0.8658155, -0.8837124, 2.905279, 0.7568628, 0, 1, 1,
0.8837334, -0.04810266, 0.8149207, 0.7647059, 0, 1, 1,
0.8842325, -1.15548, 2.239246, 0.7686275, 0, 1, 1,
0.8879537, -0.1697038, 2.085717, 0.7764706, 0, 1, 1,
0.8919584, 0.4244049, -0.01992817, 0.7803922, 0, 1, 1,
0.8920159, -3.131123, 2.818532, 0.7882353, 0, 1, 1,
0.8991349, -2.278259, 2.407711, 0.7921569, 0, 1, 1,
0.9005418, -1.924327, 3.679172, 0.8, 0, 1, 1,
0.9039925, 0.5503402, 1.103065, 0.8078431, 0, 1, 1,
0.9075909, -0.06784901, 2.014776, 0.8117647, 0, 1, 1,
0.9077617, 0.7924213, -0.7645073, 0.8196079, 0, 1, 1,
0.9110273, 1.826893, 0.4581844, 0.8235294, 0, 1, 1,
0.9127954, -0.657353, 1.53396, 0.8313726, 0, 1, 1,
0.9158809, -0.2989494, 4.729831, 0.8352941, 0, 1, 1,
0.9297396, -0.2725873, 2.296416, 0.8431373, 0, 1, 1,
0.9299591, 2.106843, 1.08882, 0.8470588, 0, 1, 1,
0.9306597, -0.08360282, 2.493396, 0.854902, 0, 1, 1,
0.9368909, 1.082352, -0.542117, 0.8588235, 0, 1, 1,
0.9396579, 0.7750023, 0.8964433, 0.8666667, 0, 1, 1,
0.9459582, -0.301455, 2.093895, 0.8705882, 0, 1, 1,
0.9575056, 0.1655325, 1.542644, 0.8784314, 0, 1, 1,
0.9642649, -0.886574, 0.8696858, 0.8823529, 0, 1, 1,
0.9692605, -0.5309333, -0.2907452, 0.8901961, 0, 1, 1,
0.9812222, -0.7409924, 1.089926, 0.8941177, 0, 1, 1,
0.9816521, 0.4428212, 1.082577, 0.9019608, 0, 1, 1,
0.9817755, 0.09198698, 0.1927373, 0.9098039, 0, 1, 1,
0.9830236, 0.8774302, -0.1985786, 0.9137255, 0, 1, 1,
0.9875945, 0.4227847, 1.09484, 0.9215686, 0, 1, 1,
0.9942416, -0.044952, 1.027131, 0.9254902, 0, 1, 1,
0.9956967, 0.2380177, 2.041032, 0.9333333, 0, 1, 1,
1.00765, -0.2819094, 2.248187, 0.9372549, 0, 1, 1,
1.008803, 0.3722565, 1.564447, 0.945098, 0, 1, 1,
1.019199, -0.0611852, 3.436014, 0.9490196, 0, 1, 1,
1.019514, 0.04354912, 1.85751, 0.9568627, 0, 1, 1,
1.022079, 0.591288, -0.505851, 0.9607843, 0, 1, 1,
1.025536, 0.1837451, 2.360953, 0.9686275, 0, 1, 1,
1.027709, 0.5184985, 1.005475, 0.972549, 0, 1, 1,
1.030101, -0.9592306, 2.498375, 0.9803922, 0, 1, 1,
1.0314, -1.115831, 2.551838, 0.9843137, 0, 1, 1,
1.031692, -0.897721, 1.784042, 0.9921569, 0, 1, 1,
1.032223, -0.6794647, 1.286599, 0.9960784, 0, 1, 1,
1.033747, -0.3584239, 0.2569015, 1, 0, 0.9960784, 1,
1.037255, -0.1234054, 1.296404, 1, 0, 0.9882353, 1,
1.037701, 0.08493958, 2.090194, 1, 0, 0.9843137, 1,
1.045648, -1.287034, 1.652122, 1, 0, 0.9764706, 1,
1.048538, -0.6436334, 3.329556, 1, 0, 0.972549, 1,
1.049031, 1.237186, 0.4332445, 1, 0, 0.9647059, 1,
1.059721, -0.1104509, 2.296731, 1, 0, 0.9607843, 1,
1.067576, 0.9445149, -0.3580905, 1, 0, 0.9529412, 1,
1.070631, 0.6094013, 0.9705652, 1, 0, 0.9490196, 1,
1.071512, -0.5155702, 0.3796352, 1, 0, 0.9411765, 1,
1.072708, -0.3008077, 1.946495, 1, 0, 0.9372549, 1,
1.073638, 0.9376212, 1.411863, 1, 0, 0.9294118, 1,
1.086283, 1.217264, 0.3601399, 1, 0, 0.9254902, 1,
1.090885, 0.1444803, 0.01146238, 1, 0, 0.9176471, 1,
1.09343, 0.849418, 1.605054, 1, 0, 0.9137255, 1,
1.10045, 0.1090645, 1.91325, 1, 0, 0.9058824, 1,
1.103401, -1.241411, 1.513357, 1, 0, 0.9019608, 1,
1.105817, -2.323712, 1.916836, 1, 0, 0.8941177, 1,
1.112621, -0.2529114, 1.483619, 1, 0, 0.8862745, 1,
1.11294, 0.3904117, 1.404406, 1, 0, 0.8823529, 1,
1.113264, -0.2454036, 2.894895, 1, 0, 0.8745098, 1,
1.117609, -0.9849331, 1.45697, 1, 0, 0.8705882, 1,
1.118291, -0.1730362, 1.007277, 1, 0, 0.8627451, 1,
1.121811, -0.8316224, 1.171101, 1, 0, 0.8588235, 1,
1.125403, 0.6461116, 0.1003801, 1, 0, 0.8509804, 1,
1.128378, -0.8952253, 3.721271, 1, 0, 0.8470588, 1,
1.130454, -1.389311, 2.906825, 1, 0, 0.8392157, 1,
1.132398, -0.9941178, 2.525966, 1, 0, 0.8352941, 1,
1.139467, 1.250293, 0.5647907, 1, 0, 0.827451, 1,
1.141334, -1.555186, 3.585792, 1, 0, 0.8235294, 1,
1.145293, -0.6582788, 3.100098, 1, 0, 0.8156863, 1,
1.149646, -1.811141, 2.961862, 1, 0, 0.8117647, 1,
1.15328, 0.07917224, 1.740098, 1, 0, 0.8039216, 1,
1.157636, 0.3566304, 0.2940861, 1, 0, 0.7960784, 1,
1.16028, 0.2201951, 2.22273, 1, 0, 0.7921569, 1,
1.166726, -0.8843944, 4.239151, 1, 0, 0.7843137, 1,
1.174263, -0.4802709, 1.728208, 1, 0, 0.7803922, 1,
1.175525, 0.4996035, 0.8546196, 1, 0, 0.772549, 1,
1.176099, -0.4977522, 1.927615, 1, 0, 0.7686275, 1,
1.178789, -0.1066334, 1.00861, 1, 0, 0.7607843, 1,
1.185455, 0.6742615, -0.6783262, 1, 0, 0.7568628, 1,
1.194076, -0.6149073, 1.778183, 1, 0, 0.7490196, 1,
1.206175, -0.2812435, 0.5443419, 1, 0, 0.7450981, 1,
1.216458, -1.308689, 3.41746, 1, 0, 0.7372549, 1,
1.235919, -1.061192, 2.326682, 1, 0, 0.7333333, 1,
1.239398, -0.9575121, 2.88558, 1, 0, 0.7254902, 1,
1.260852, 1.162044, 1.31198, 1, 0, 0.7215686, 1,
1.266614, 0.9233942, -0.5481991, 1, 0, 0.7137255, 1,
1.271136, 1.813215, -0.8438581, 1, 0, 0.7098039, 1,
1.285377, 0.3032086, 3.889933, 1, 0, 0.7019608, 1,
1.286463, 0.281897, 0.3652897, 1, 0, 0.6941177, 1,
1.287014, -0.01733954, 1.81854, 1, 0, 0.6901961, 1,
1.290864, -0.1907278, -0.6882589, 1, 0, 0.682353, 1,
1.293196, 0.2955205, 0.8358607, 1, 0, 0.6784314, 1,
1.298243, 0.9024251, 1.461403, 1, 0, 0.6705883, 1,
1.299269, -0.5033392, 1.898047, 1, 0, 0.6666667, 1,
1.303114, -1.722221, 2.228576, 1, 0, 0.6588235, 1,
1.315496, 0.3661669, 3.079962, 1, 0, 0.654902, 1,
1.316996, 0.3413197, 2.973109, 1, 0, 0.6470588, 1,
1.318994, 1.051414, -0.6683233, 1, 0, 0.6431373, 1,
1.321206, -0.9768673, 2.926128, 1, 0, 0.6352941, 1,
1.330956, -1.000792, 3.594823, 1, 0, 0.6313726, 1,
1.332237, 1.334002, 1.425812, 1, 0, 0.6235294, 1,
1.337033, 0.2763824, 2.081094, 1, 0, 0.6196079, 1,
1.345941, 0.4371434, 0.3925573, 1, 0, 0.6117647, 1,
1.355577, 0.60657, 0.7909817, 1, 0, 0.6078432, 1,
1.364242, 0.6265187, 1.3589, 1, 0, 0.6, 1,
1.369892, -0.7462913, 2.727439, 1, 0, 0.5921569, 1,
1.372179, 0.8702317, 2.077517, 1, 0, 0.5882353, 1,
1.378433, -2.044857, 1.881594, 1, 0, 0.5803922, 1,
1.383811, -1.748093, 1.28879, 1, 0, 0.5764706, 1,
1.392151, -1.182393, 3.889008, 1, 0, 0.5686275, 1,
1.394436, 0.1721078, 0.1786284, 1, 0, 0.5647059, 1,
1.397171, -1.68922, 2.507365, 1, 0, 0.5568628, 1,
1.397905, 0.515112, 0.5700988, 1, 0, 0.5529412, 1,
1.399025, 0.3892528, 0.8399296, 1, 0, 0.5450981, 1,
1.399657, -0.1605702, 1.448865, 1, 0, 0.5411765, 1,
1.407701, 1.417267, 1.121251, 1, 0, 0.5333334, 1,
1.408491, -1.147607, 1.756435, 1, 0, 0.5294118, 1,
1.409163, -1.291224, 1.522506, 1, 0, 0.5215687, 1,
1.412091, 0.2620079, 0.6108628, 1, 0, 0.5176471, 1,
1.413733, -1.684262, 4.044014, 1, 0, 0.509804, 1,
1.444109, 0.4923519, 2.110805, 1, 0, 0.5058824, 1,
1.459339, 0.6405739, -0.1548826, 1, 0, 0.4980392, 1,
1.467211, -1.434185, 3.486552, 1, 0, 0.4901961, 1,
1.467398, 0.2644815, 2.319862, 1, 0, 0.4862745, 1,
1.469894, -2.259162, 3.575634, 1, 0, 0.4784314, 1,
1.474335, 0.05629861, 0.7992534, 1, 0, 0.4745098, 1,
1.493755, -0.6192414, 1.576893, 1, 0, 0.4666667, 1,
1.504773, -1.924878, 1.522258, 1, 0, 0.4627451, 1,
1.50912, 0.1915064, 1.054613, 1, 0, 0.454902, 1,
1.523792, 0.2086445, 1.563318, 1, 0, 0.4509804, 1,
1.558866, -1.067075, 3.342975, 1, 0, 0.4431373, 1,
1.566684, 0.5745041, 1.176381, 1, 0, 0.4392157, 1,
1.567861, -0.1897514, 3.031543, 1, 0, 0.4313726, 1,
1.569981, 0.3218265, 2.264687, 1, 0, 0.427451, 1,
1.570978, 0.5254574, 3.047297, 1, 0, 0.4196078, 1,
1.57443, 1.807494, 1.427164, 1, 0, 0.4156863, 1,
1.59245, 0.5624363, 1.383463, 1, 0, 0.4078431, 1,
1.606421, -0.643058, 2.571406, 1, 0, 0.4039216, 1,
1.606471, -0.7284651, 2.01626, 1, 0, 0.3960784, 1,
1.609777, 0.05327722, 0.4435639, 1, 0, 0.3882353, 1,
1.621126, -0.007154016, 2.36623, 1, 0, 0.3843137, 1,
1.631978, -0.1934368, 0.9798253, 1, 0, 0.3764706, 1,
1.648895, 1.27307, -0.8494506, 1, 0, 0.372549, 1,
1.666824, 0.9610973, 1.826069, 1, 0, 0.3647059, 1,
1.675977, -0.6209055, 0.5375227, 1, 0, 0.3607843, 1,
1.685299, 0.8165344, 1.784294, 1, 0, 0.3529412, 1,
1.692839, 0.6210293, 0.4684916, 1, 0, 0.3490196, 1,
1.697819, 1.390329, 1.103403, 1, 0, 0.3411765, 1,
1.701887, 0.6529515, 0.8104885, 1, 0, 0.3372549, 1,
1.722806, -0.9776076, 1.701953, 1, 0, 0.3294118, 1,
1.746366, 0.239357, 1.885515, 1, 0, 0.3254902, 1,
1.768118, -0.04162564, 0.6041728, 1, 0, 0.3176471, 1,
1.789686, -1.134542, 2.044589, 1, 0, 0.3137255, 1,
1.801908, -1.397891, 2.524168, 1, 0, 0.3058824, 1,
1.804737, 0.4514739, -0.1774996, 1, 0, 0.2980392, 1,
1.805351, 2.137936, 3.282479, 1, 0, 0.2941177, 1,
1.808157, 0.07006184, 0.0646604, 1, 0, 0.2862745, 1,
1.812527, -1.211359, 2.928411, 1, 0, 0.282353, 1,
1.817733, -0.4018941, 0.791263, 1, 0, 0.2745098, 1,
1.845694, -0.7434018, 3.753037, 1, 0, 0.2705882, 1,
1.86178, -0.08111075, 2.818545, 1, 0, 0.2627451, 1,
1.86305, 1.494661, 0.9996641, 1, 0, 0.2588235, 1,
1.883199, 0.1069629, 2.062704, 1, 0, 0.2509804, 1,
1.888935, 1.004757, 3.674315, 1, 0, 0.2470588, 1,
1.891126, 0.2502179, 0.9482673, 1, 0, 0.2392157, 1,
1.901713, 0.3535491, 1.849123, 1, 0, 0.2352941, 1,
1.913498, -3.213247, 4.261334, 1, 0, 0.227451, 1,
1.921553, -2.223074, 0.128828, 1, 0, 0.2235294, 1,
1.932436, -0.8464809, 0.6436331, 1, 0, 0.2156863, 1,
1.947323, 1.602416, -0.3946664, 1, 0, 0.2117647, 1,
1.94897, 0.3605856, 2.384842, 1, 0, 0.2039216, 1,
1.970051, -1.359941, 2.858156, 1, 0, 0.1960784, 1,
1.972016, 0.4524321, 0.3975706, 1, 0, 0.1921569, 1,
1.994303, 1.136252, 2.096519, 1, 0, 0.1843137, 1,
2.021542, 0.5196007, 1.135684, 1, 0, 0.1803922, 1,
2.035922, -2.03378, 1.664295, 1, 0, 0.172549, 1,
2.040354, 0.07761094, -0.01264023, 1, 0, 0.1686275, 1,
2.041432, 0.3704474, 1.221539, 1, 0, 0.1607843, 1,
2.078165, -0.2741809, -0.3214765, 1, 0, 0.1568628, 1,
2.081817, -1.217687, 1.488616, 1, 0, 0.1490196, 1,
2.182697, 0.6926315, -0.1352232, 1, 0, 0.145098, 1,
2.187608, 0.6006345, -0.04708254, 1, 0, 0.1372549, 1,
2.193912, -0.7429971, 2.803231, 1, 0, 0.1333333, 1,
2.199874, 0.05735299, 1.900364, 1, 0, 0.1254902, 1,
2.208649, -1.214375, 3.005647, 1, 0, 0.1215686, 1,
2.209158, -0.464576, 2.668841, 1, 0, 0.1137255, 1,
2.217042, -0.9871207, 1.899111, 1, 0, 0.1098039, 1,
2.261988, -1.658017, 0.801899, 1, 0, 0.1019608, 1,
2.29563, -0.06471983, 1.43386, 1, 0, 0.09411765, 1,
2.372309, 0.9212683, 0.8289682, 1, 0, 0.09019608, 1,
2.407547, -0.08417714, 0.3734625, 1, 0, 0.08235294, 1,
2.425898, -2.479762, 2.545541, 1, 0, 0.07843138, 1,
2.497198, -0.3079912, 2.009443, 1, 0, 0.07058824, 1,
2.498775, 0.9941488, 2.461979, 1, 0, 0.06666667, 1,
2.575573, -0.2677442, 0.7031417, 1, 0, 0.05882353, 1,
2.584645, 0.4346253, 0.1188888, 1, 0, 0.05490196, 1,
2.634052, -0.52665, 1.82816, 1, 0, 0.04705882, 1,
2.662431, 0.6923892, 0.9363333, 1, 0, 0.04313726, 1,
2.765643, 0.06026392, 3.081048, 1, 0, 0.03529412, 1,
2.770127, -0.178832, 2.006981, 1, 0, 0.03137255, 1,
2.840854, -0.6019387, 3.515323, 1, 0, 0.02352941, 1,
3.021798, -1.978822, 3.898551, 1, 0, 0.01960784, 1,
3.187485, 0.2712743, 0.9357277, 1, 0, 0.01176471, 1,
3.484565, 1.74829, 0.9220338, 1, 0, 0.007843138, 1
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
-0.05650866, -4.279506, -7.236984, 0, -0.5, 0.5, 0.5,
-0.05650866, -4.279506, -7.236984, 1, -0.5, 0.5, 0.5,
-0.05650866, -4.279506, -7.236984, 1, 1.5, 0.5, 0.5,
-0.05650866, -4.279506, -7.236984, 0, 1.5, 0.5, 0.5
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
-4.798007, -0.06794024, -7.236984, 0, -0.5, 0.5, 0.5,
-4.798007, -0.06794024, -7.236984, 1, -0.5, 0.5, 0.5,
-4.798007, -0.06794024, -7.236984, 1, 1.5, 0.5, 0.5,
-4.798007, -0.06794024, -7.236984, 0, 1.5, 0.5, 0.5
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
-4.798007, -4.279506, 0.6553791, 0, -0.5, 0.5, 0.5,
-4.798007, -4.279506, 0.6553791, 1, -0.5, 0.5, 0.5,
-4.798007, -4.279506, 0.6553791, 1, 1.5, 0.5, 0.5,
-4.798007, -4.279506, 0.6553791, 0, 1.5, 0.5, 0.5
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
-2, -3.307606, -5.415669,
2, -3.307606, -5.415669,
-2, -3.307606, -5.415669,
-2, -3.469589, -5.719222,
0, -3.307606, -5.415669,
0, -3.469589, -5.719222,
2, -3.307606, -5.415669,
2, -3.469589, -5.719222
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
-2, -3.793556, -6.326326, 0, -0.5, 0.5, 0.5,
-2, -3.793556, -6.326326, 1, -0.5, 0.5, 0.5,
-2, -3.793556, -6.326326, 1, 1.5, 0.5, 0.5,
-2, -3.793556, -6.326326, 0, 1.5, 0.5, 0.5,
0, -3.793556, -6.326326, 0, -0.5, 0.5, 0.5,
0, -3.793556, -6.326326, 1, -0.5, 0.5, 0.5,
0, -3.793556, -6.326326, 1, 1.5, 0.5, 0.5,
0, -3.793556, -6.326326, 0, 1.5, 0.5, 0.5,
2, -3.793556, -6.326326, 0, -0.5, 0.5, 0.5,
2, -3.793556, -6.326326, 1, -0.5, 0.5, 0.5,
2, -3.793556, -6.326326, 1, 1.5, 0.5, 0.5,
2, -3.793556, -6.326326, 0, 1.5, 0.5, 0.5
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
-3.703815, -3, -5.415669,
-3.703815, 3, -5.415669,
-3.703815, -3, -5.415669,
-3.88618, -3, -5.719222,
-3.703815, -2, -5.415669,
-3.88618, -2, -5.719222,
-3.703815, -1, -5.415669,
-3.88618, -1, -5.719222,
-3.703815, 0, -5.415669,
-3.88618, 0, -5.719222,
-3.703815, 1, -5.415669,
-3.88618, 1, -5.719222,
-3.703815, 2, -5.415669,
-3.88618, 2, -5.719222,
-3.703815, 3, -5.415669,
-3.88618, 3, -5.719222
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
-4.250911, -3, -6.326326, 0, -0.5, 0.5, 0.5,
-4.250911, -3, -6.326326, 1, -0.5, 0.5, 0.5,
-4.250911, -3, -6.326326, 1, 1.5, 0.5, 0.5,
-4.250911, -3, -6.326326, 0, 1.5, 0.5, 0.5,
-4.250911, -2, -6.326326, 0, -0.5, 0.5, 0.5,
-4.250911, -2, -6.326326, 1, -0.5, 0.5, 0.5,
-4.250911, -2, -6.326326, 1, 1.5, 0.5, 0.5,
-4.250911, -2, -6.326326, 0, 1.5, 0.5, 0.5,
-4.250911, -1, -6.326326, 0, -0.5, 0.5, 0.5,
-4.250911, -1, -6.326326, 1, -0.5, 0.5, 0.5,
-4.250911, -1, -6.326326, 1, 1.5, 0.5, 0.5,
-4.250911, -1, -6.326326, 0, 1.5, 0.5, 0.5,
-4.250911, 0, -6.326326, 0, -0.5, 0.5, 0.5,
-4.250911, 0, -6.326326, 1, -0.5, 0.5, 0.5,
-4.250911, 0, -6.326326, 1, 1.5, 0.5, 0.5,
-4.250911, 0, -6.326326, 0, 1.5, 0.5, 0.5,
-4.250911, 1, -6.326326, 0, -0.5, 0.5, 0.5,
-4.250911, 1, -6.326326, 1, -0.5, 0.5, 0.5,
-4.250911, 1, -6.326326, 1, 1.5, 0.5, 0.5,
-4.250911, 1, -6.326326, 0, 1.5, 0.5, 0.5,
-4.250911, 2, -6.326326, 0, -0.5, 0.5, 0.5,
-4.250911, 2, -6.326326, 1, -0.5, 0.5, 0.5,
-4.250911, 2, -6.326326, 1, 1.5, 0.5, 0.5,
-4.250911, 2, -6.326326, 0, 1.5, 0.5, 0.5,
-4.250911, 3, -6.326326, 0, -0.5, 0.5, 0.5,
-4.250911, 3, -6.326326, 1, -0.5, 0.5, 0.5,
-4.250911, 3, -6.326326, 1, 1.5, 0.5, 0.5,
-4.250911, 3, -6.326326, 0, 1.5, 0.5, 0.5
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
-3.703815, -3.307606, -4,
-3.703815, -3.307606, 6,
-3.703815, -3.307606, -4,
-3.88618, -3.469589, -4,
-3.703815, -3.307606, -2,
-3.88618, -3.469589, -2,
-3.703815, -3.307606, 0,
-3.88618, -3.469589, 0,
-3.703815, -3.307606, 2,
-3.88618, -3.469589, 2,
-3.703815, -3.307606, 4,
-3.88618, -3.469589, 4,
-3.703815, -3.307606, 6,
-3.88618, -3.469589, 6
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
-4.250911, -3.793556, -4, 0, -0.5, 0.5, 0.5,
-4.250911, -3.793556, -4, 1, -0.5, 0.5, 0.5,
-4.250911, -3.793556, -4, 1, 1.5, 0.5, 0.5,
-4.250911, -3.793556, -4, 0, 1.5, 0.5, 0.5,
-4.250911, -3.793556, -2, 0, -0.5, 0.5, 0.5,
-4.250911, -3.793556, -2, 1, -0.5, 0.5, 0.5,
-4.250911, -3.793556, -2, 1, 1.5, 0.5, 0.5,
-4.250911, -3.793556, -2, 0, 1.5, 0.5, 0.5,
-4.250911, -3.793556, 0, 0, -0.5, 0.5, 0.5,
-4.250911, -3.793556, 0, 1, -0.5, 0.5, 0.5,
-4.250911, -3.793556, 0, 1, 1.5, 0.5, 0.5,
-4.250911, -3.793556, 0, 0, 1.5, 0.5, 0.5,
-4.250911, -3.793556, 2, 0, -0.5, 0.5, 0.5,
-4.250911, -3.793556, 2, 1, -0.5, 0.5, 0.5,
-4.250911, -3.793556, 2, 1, 1.5, 0.5, 0.5,
-4.250911, -3.793556, 2, 0, 1.5, 0.5, 0.5,
-4.250911, -3.793556, 4, 0, -0.5, 0.5, 0.5,
-4.250911, -3.793556, 4, 1, -0.5, 0.5, 0.5,
-4.250911, -3.793556, 4, 1, 1.5, 0.5, 0.5,
-4.250911, -3.793556, 4, 0, 1.5, 0.5, 0.5,
-4.250911, -3.793556, 6, 0, -0.5, 0.5, 0.5,
-4.250911, -3.793556, 6, 1, -0.5, 0.5, 0.5,
-4.250911, -3.793556, 6, 1, 1.5, 0.5, 0.5,
-4.250911, -3.793556, 6, 0, 1.5, 0.5, 0.5
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
-3.703815, -3.307606, -5.415669,
-3.703815, 3.171726, -5.415669,
-3.703815, -3.307606, 6.726427,
-3.703815, 3.171726, 6.726427,
-3.703815, -3.307606, -5.415669,
-3.703815, -3.307606, 6.726427,
-3.703815, 3.171726, -5.415669,
-3.703815, 3.171726, 6.726427,
-3.703815, -3.307606, -5.415669,
3.590798, -3.307606, -5.415669,
-3.703815, -3.307606, 6.726427,
3.590798, -3.307606, 6.726427,
-3.703815, 3.171726, -5.415669,
3.590798, 3.171726, -5.415669,
-3.703815, 3.171726, 6.726427,
3.590798, 3.171726, 6.726427,
3.590798, -3.307606, -5.415669,
3.590798, 3.171726, -5.415669,
3.590798, -3.307606, 6.726427,
3.590798, 3.171726, 6.726427,
3.590798, -3.307606, -5.415669,
3.590798, -3.307606, 6.726427,
3.590798, 3.171726, -5.415669,
3.590798, 3.171726, 6.726427
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
var radius = 8.317484;
var distance = 37.00543;
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
mvMatrix.translate( 0.05650866, 0.06794024, -0.6553791 );
mvMatrix.scale( 1.232831, 1.387956, 0.7406486 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.00543);
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


