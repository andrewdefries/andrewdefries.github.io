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
-3.117518, -0.2677464, -0.09955807, 1, 0, 0, 1,
-3.061028, -0.4297552, -1.574873, 1, 0.007843138, 0, 1,
-2.940288, 1.077674, -1.351109, 1, 0.01176471, 0, 1,
-2.717765, 1.144169, -1.150507, 1, 0.01960784, 0, 1,
-2.665894, -0.5631689, -1.92231, 1, 0.02352941, 0, 1,
-2.491567, 1.197585, -1.49338, 1, 0.03137255, 0, 1,
-2.456988, -0.7528902, -3.013876, 1, 0.03529412, 0, 1,
-2.447656, 1.284292, -2.094715, 1, 0.04313726, 0, 1,
-2.41995, 1.312857, -1.282492, 1, 0.04705882, 0, 1,
-2.326602, -2.559558, -1.762951, 1, 0.05490196, 0, 1,
-2.179814, 0.9481261, -0.8501476, 1, 0.05882353, 0, 1,
-2.075467, -0.6655885, -1.343603, 1, 0.06666667, 0, 1,
-2.062251, 0.5461817, -1.459864, 1, 0.07058824, 0, 1,
-2.054673, 0.757039, -0.9785112, 1, 0.07843138, 0, 1,
-2.002278, 0.3218025, -1.234132, 1, 0.08235294, 0, 1,
-1.985347, 1.813328, -1.36863, 1, 0.09019608, 0, 1,
-1.976423, 1.132123, 0.7595108, 1, 0.09411765, 0, 1,
-1.968347, 1.021574, -0.9856624, 1, 0.1019608, 0, 1,
-1.931095, 1.265151, -0.02872558, 1, 0.1098039, 0, 1,
-1.911467, 0.6411793, -2.034174, 1, 0.1137255, 0, 1,
-1.88389, -0.7362795, -3.042989, 1, 0.1215686, 0, 1,
-1.857313, -0.5019849, -0.7880381, 1, 0.1254902, 0, 1,
-1.846519, 0.864835, -2.441566, 1, 0.1333333, 0, 1,
-1.813226, 1.011305, -0.6642054, 1, 0.1372549, 0, 1,
-1.810524, -1.062762, -1.704294, 1, 0.145098, 0, 1,
-1.782794, 0.04170823, -3.404927, 1, 0.1490196, 0, 1,
-1.781377, -0.1022123, -1.705679, 1, 0.1568628, 0, 1,
-1.775836, -0.6155155, -0.7008428, 1, 0.1607843, 0, 1,
-1.771596, 1.378377, -0.05423597, 1, 0.1686275, 0, 1,
-1.766097, 1.743206, -0.9336882, 1, 0.172549, 0, 1,
-1.761683, -1.617651, -2.952229, 1, 0.1803922, 0, 1,
-1.76116, 1.522243, -0.7482082, 1, 0.1843137, 0, 1,
-1.739068, -0.1596074, -1.940952, 1, 0.1921569, 0, 1,
-1.724908, -2.527583, -4.405855, 1, 0.1960784, 0, 1,
-1.719046, 0.639777, -0.3175567, 1, 0.2039216, 0, 1,
-1.712517, -1.451157, -4.17974, 1, 0.2117647, 0, 1,
-1.70627, -0.201873, -0.6946774, 1, 0.2156863, 0, 1,
-1.704416, -1.884598, -2.723512, 1, 0.2235294, 0, 1,
-1.683063, 2.500463, 0.1021022, 1, 0.227451, 0, 1,
-1.682267, 0.2098081, -1.53868, 1, 0.2352941, 0, 1,
-1.673166, 0.6235924, 0.4809224, 1, 0.2392157, 0, 1,
-1.66992, 1.746897, -2.093843, 1, 0.2470588, 0, 1,
-1.647176, 0.2217599, -1.770301, 1, 0.2509804, 0, 1,
-1.643919, -0.03974992, -2.076412, 1, 0.2588235, 0, 1,
-1.630105, 1.392444, -1.141976, 1, 0.2627451, 0, 1,
-1.621462, 1.132939, -0.1745056, 1, 0.2705882, 0, 1,
-1.605433, 0.3490522, -1.320356, 1, 0.2745098, 0, 1,
-1.586871, 0.2117103, -2.103263, 1, 0.282353, 0, 1,
-1.584257, 0.3111263, -3.155724, 1, 0.2862745, 0, 1,
-1.57654, 0.8863301, -0.7194127, 1, 0.2941177, 0, 1,
-1.574276, 0.450027, -0.9615996, 1, 0.3019608, 0, 1,
-1.572049, -0.78149, -1.455557, 1, 0.3058824, 0, 1,
-1.557967, -0.4158649, -0.8178899, 1, 0.3137255, 0, 1,
-1.549366, -0.591846, -2.407537, 1, 0.3176471, 0, 1,
-1.529189, -0.2418503, -3.521553, 1, 0.3254902, 0, 1,
-1.519756, -1.0646, -2.324443, 1, 0.3294118, 0, 1,
-1.499984, -1.37123, -2.210353, 1, 0.3372549, 0, 1,
-1.499634, -0.586983, -3.091558, 1, 0.3411765, 0, 1,
-1.498647, 1.382393, -2.105277, 1, 0.3490196, 0, 1,
-1.492544, -0.4813417, -0.5930794, 1, 0.3529412, 0, 1,
-1.487983, 0.6361042, -2.694727, 1, 0.3607843, 0, 1,
-1.475797, -0.6066327, -2.307472, 1, 0.3647059, 0, 1,
-1.469672, -0.08025782, -1.596975, 1, 0.372549, 0, 1,
-1.462277, -0.1879934, -1.641173, 1, 0.3764706, 0, 1,
-1.459819, -0.8673546, -2.112852, 1, 0.3843137, 0, 1,
-1.456837, -0.1659583, -2.468026, 1, 0.3882353, 0, 1,
-1.448442, 0.1120314, -1.600883, 1, 0.3960784, 0, 1,
-1.440417, -0.6993929, -1.878308, 1, 0.4039216, 0, 1,
-1.43881, 1.112731, -2.606023, 1, 0.4078431, 0, 1,
-1.438086, 0.004343587, -1.477025, 1, 0.4156863, 0, 1,
-1.437481, 0.9248145, -0.866879, 1, 0.4196078, 0, 1,
-1.431394, 0.7381776, -2.130036, 1, 0.427451, 0, 1,
-1.424928, -0.5148836, -0.06957948, 1, 0.4313726, 0, 1,
-1.423311, 2.495117, -1.197045, 1, 0.4392157, 0, 1,
-1.418008, 0.7742642, 0.8496826, 1, 0.4431373, 0, 1,
-1.409402, -0.4187973, -1.957879, 1, 0.4509804, 0, 1,
-1.408646, 0.6095328, -1.361488, 1, 0.454902, 0, 1,
-1.406094, 0.4719639, -0.1372736, 1, 0.4627451, 0, 1,
-1.394734, -1.694473, -2.072694, 1, 0.4666667, 0, 1,
-1.387505, 0.971875, -2.731314, 1, 0.4745098, 0, 1,
-1.372663, -1.69733, -0.8175035, 1, 0.4784314, 0, 1,
-1.364924, -1.035714, -0.8000491, 1, 0.4862745, 0, 1,
-1.331825, -1.87634, -4.147228, 1, 0.4901961, 0, 1,
-1.325975, 0.07507572, -2.03754, 1, 0.4980392, 0, 1,
-1.302969, -0.8069689, -1.832552, 1, 0.5058824, 0, 1,
-1.297352, 0.06659248, -2.025314, 1, 0.509804, 0, 1,
-1.295577, -0.7504056, -3.477848, 1, 0.5176471, 0, 1,
-1.284149, 1.142662, 0.2379004, 1, 0.5215687, 0, 1,
-1.277223, 1.312851, -0.2527954, 1, 0.5294118, 0, 1,
-1.276991, 1.11498, -1.382952, 1, 0.5333334, 0, 1,
-1.273294, -0.004059026, -2.004173, 1, 0.5411765, 0, 1,
-1.261853, 0.5184912, -1.913702, 1, 0.5450981, 0, 1,
-1.258996, -0.535862, -2.51625, 1, 0.5529412, 0, 1,
-1.256829, -0.2552042, -1.281765, 1, 0.5568628, 0, 1,
-1.249411, -0.1426293, -1.39817, 1, 0.5647059, 0, 1,
-1.244098, -0.6781443, -1.462353, 1, 0.5686275, 0, 1,
-1.232774, -1.428534, -1.056687, 1, 0.5764706, 0, 1,
-1.2237, -0.4102675, -1.069214, 1, 0.5803922, 0, 1,
-1.221354, 0.28723, -1.29832, 1, 0.5882353, 0, 1,
-1.21904, -0.3190577, -3.333651, 1, 0.5921569, 0, 1,
-1.213115, 0.7645335, -1.483819, 1, 0.6, 0, 1,
-1.212141, 0.09434508, -0.9776669, 1, 0.6078432, 0, 1,
-1.207099, -0.1763447, -1.691541, 1, 0.6117647, 0, 1,
-1.204902, -0.2366663, -1.589209, 1, 0.6196079, 0, 1,
-1.20085, -0.7839131, -0.7024806, 1, 0.6235294, 0, 1,
-1.188191, -0.9363109, -2.526375, 1, 0.6313726, 0, 1,
-1.186546, 1.345083, -1.081424, 1, 0.6352941, 0, 1,
-1.175585, -1.840526, -2.55921, 1, 0.6431373, 0, 1,
-1.171505, -0.6566063, 0.5278523, 1, 0.6470588, 0, 1,
-1.169158, 0.2204027, -0.7432064, 1, 0.654902, 0, 1,
-1.166678, -0.6130086, -1.579309, 1, 0.6588235, 0, 1,
-1.163383, 1.018493, 0.7237928, 1, 0.6666667, 0, 1,
-1.161457, -0.5676042, 0.1727452, 1, 0.6705883, 0, 1,
-1.161022, -0.2652133, -2.498706, 1, 0.6784314, 0, 1,
-1.156121, 0.3860815, -2.23227, 1, 0.682353, 0, 1,
-1.153354, 0.6559876, -1.263941, 1, 0.6901961, 0, 1,
-1.153239, 0.4593046, -0.7300257, 1, 0.6941177, 0, 1,
-1.152272, 0.4590821, -0.6742565, 1, 0.7019608, 0, 1,
-1.151201, -0.2624457, -1.394299, 1, 0.7098039, 0, 1,
-1.149084, 1.267973, 0.5266446, 1, 0.7137255, 0, 1,
-1.147957, -1.585967, -2.45358, 1, 0.7215686, 0, 1,
-1.135033, -1.489264, -2.537949, 1, 0.7254902, 0, 1,
-1.131152, -0.1111815, -1.713361, 1, 0.7333333, 0, 1,
-1.120164, -0.06627292, -1.714854, 1, 0.7372549, 0, 1,
-1.114916, 0.6338605, -2.155974, 1, 0.7450981, 0, 1,
-1.113922, 1.955992, -0.03483144, 1, 0.7490196, 0, 1,
-1.11352, 2.492653, 0.129033, 1, 0.7568628, 0, 1,
-1.11191, 1.714398, 0.07631946, 1, 0.7607843, 0, 1,
-1.109105, -1.154401, -1.349941, 1, 0.7686275, 0, 1,
-1.106521, -1.412686, -2.158262, 1, 0.772549, 0, 1,
-1.104958, -0.01336772, -1.208223, 1, 0.7803922, 0, 1,
-1.103021, -0.4593965, -2.543619, 1, 0.7843137, 0, 1,
-1.09839, -0.4390303, -1.226435, 1, 0.7921569, 0, 1,
-1.095277, -0.7765141, -2.451297, 1, 0.7960784, 0, 1,
-1.093906, 0.3420132, -0.6609592, 1, 0.8039216, 0, 1,
-1.092203, -1.643184, -1.583738, 1, 0.8117647, 0, 1,
-1.091142, 0.02641607, -0.7587851, 1, 0.8156863, 0, 1,
-1.083681, 1.462928, -2.215064, 1, 0.8235294, 0, 1,
-1.082542, -1.281338, -2.817265, 1, 0.827451, 0, 1,
-1.076011, 1.553564, -1.095882, 1, 0.8352941, 0, 1,
-1.075161, -0.342284, -2.554536, 1, 0.8392157, 0, 1,
-1.070766, 1.127223, -2.324391, 1, 0.8470588, 0, 1,
-1.062534, 0.3314058, -1.785308, 1, 0.8509804, 0, 1,
-1.060731, 0.2958436, -1.591053, 1, 0.8588235, 0, 1,
-1.054723, -0.5916407, -3.380095, 1, 0.8627451, 0, 1,
-1.052015, -1.002015, -2.164976, 1, 0.8705882, 0, 1,
-1.044084, 0.2803321, -0.8591801, 1, 0.8745098, 0, 1,
-1.03984, -1.847715, -2.168467, 1, 0.8823529, 0, 1,
-1.039039, 0.3585514, -3.225134, 1, 0.8862745, 0, 1,
-1.029006, -0.8068543, -3.06776, 1, 0.8941177, 0, 1,
-1.026111, -1.613335, -2.341536, 1, 0.8980392, 0, 1,
-1.02552, 0.6784478, -1.87181, 1, 0.9058824, 0, 1,
-1.02389, -0.3507711, -2.24712, 1, 0.9137255, 0, 1,
-1.022595, 2.343316, -0.06811816, 1, 0.9176471, 0, 1,
-1.021691, 0.005988806, -1.03002, 1, 0.9254902, 0, 1,
-1.018249, -0.9520163, -4.971709, 1, 0.9294118, 0, 1,
-1.014148, -0.06196744, 0.03420145, 1, 0.9372549, 0, 1,
-1.013332, -0.6318352, -2.274444, 1, 0.9411765, 0, 1,
-1.012543, -0.2798197, -2.84611, 1, 0.9490196, 0, 1,
-1.011291, 0.4243435, 0.02312327, 1, 0.9529412, 0, 1,
-1.010461, -1.655788, -3.320776, 1, 0.9607843, 0, 1,
-1.009756, 1.611671, -0.2545395, 1, 0.9647059, 0, 1,
-1.007674, -0.7202904, -2.292808, 1, 0.972549, 0, 1,
-1.00547, -1.077616, -2.192627, 1, 0.9764706, 0, 1,
-0.9950604, -0.3936333, -0.6915068, 1, 0.9843137, 0, 1,
-0.9944906, 0.4038989, -0.4159747, 1, 0.9882353, 0, 1,
-0.9926468, 0.7181132, 0.9156213, 1, 0.9960784, 0, 1,
-0.985944, 1.18357, -0.1386793, 0.9960784, 1, 0, 1,
-0.9840512, -0.1494552, -1.594791, 0.9921569, 1, 0, 1,
-0.9837013, 1.156835, -1.022743, 0.9843137, 1, 0, 1,
-0.9836926, 0.4950574, -0.8227186, 0.9803922, 1, 0, 1,
-0.9791828, 0.4995156, -1.13336, 0.972549, 1, 0, 1,
-0.9745581, 1.082317, -0.1958156, 0.9686275, 1, 0, 1,
-0.9721639, 0.002965248, -0.9036939, 0.9607843, 1, 0, 1,
-0.9701047, 0.3800519, -2.90817, 0.9568627, 1, 0, 1,
-0.9681841, 1.9584, -0.9894465, 0.9490196, 1, 0, 1,
-0.9650449, -0.02833347, -1.161829, 0.945098, 1, 0, 1,
-0.964405, 1.393105, -1.64323, 0.9372549, 1, 0, 1,
-0.9588446, -1.063129, -2.183085, 0.9333333, 1, 0, 1,
-0.9555926, -1.647405, -2.419819, 0.9254902, 1, 0, 1,
-0.947307, 0.782847, -0.7008547, 0.9215686, 1, 0, 1,
-0.9467027, 0.4125786, -1.098072, 0.9137255, 1, 0, 1,
-0.944968, -0.5460424, -1.244922, 0.9098039, 1, 0, 1,
-0.9391508, -0.5493832, -0.6740743, 0.9019608, 1, 0, 1,
-0.9346147, 0.08543947, -2.102853, 0.8941177, 1, 0, 1,
-0.9327473, -0.09014988, 0.008339222, 0.8901961, 1, 0, 1,
-0.9316518, 1.725422, 0.9373422, 0.8823529, 1, 0, 1,
-0.9278834, 0.3989031, -2.223635, 0.8784314, 1, 0, 1,
-0.9266422, 0.7300544, -1.392971, 0.8705882, 1, 0, 1,
-0.9205688, -0.5689412, -2.066334, 0.8666667, 1, 0, 1,
-0.9094538, -1.543446, -3.152606, 0.8588235, 1, 0, 1,
-0.9078785, -1.841395, -2.46609, 0.854902, 1, 0, 1,
-0.9077122, -0.07723505, -2.395827, 0.8470588, 1, 0, 1,
-0.9010767, 0.0296677, -2.202849, 0.8431373, 1, 0, 1,
-0.9010536, 0.4592163, -1.253682, 0.8352941, 1, 0, 1,
-0.9003996, -0.4310486, -2.1605, 0.8313726, 1, 0, 1,
-0.8876786, -1.013372, -3.627476, 0.8235294, 1, 0, 1,
-0.8871497, -0.1929771, -1.4737, 0.8196079, 1, 0, 1,
-0.8821425, -0.3565579, -1.742381, 0.8117647, 1, 0, 1,
-0.8810045, 0.3971279, 1.087423, 0.8078431, 1, 0, 1,
-0.8790158, -0.5063804, -1.704633, 0.8, 1, 0, 1,
-0.8780937, 0.233648, -0.8817228, 0.7921569, 1, 0, 1,
-0.8741022, -0.1260589, -3.434448, 0.7882353, 1, 0, 1,
-0.8682971, 0.8668707, -0.9717014, 0.7803922, 1, 0, 1,
-0.8663111, -0.1492439, -0.105378, 0.7764706, 1, 0, 1,
-0.8657796, 0.6588975, -0.4018387, 0.7686275, 1, 0, 1,
-0.8563191, -0.06189346, -1.674472, 0.7647059, 1, 0, 1,
-0.8526956, -0.01080854, -3.78277, 0.7568628, 1, 0, 1,
-0.8492017, 0.5652211, -1.000242, 0.7529412, 1, 0, 1,
-0.8446355, 0.1244031, -3.374301, 0.7450981, 1, 0, 1,
-0.8419474, -1.301105, -2.312377, 0.7411765, 1, 0, 1,
-0.8407296, 0.6988766, -0.8958637, 0.7333333, 1, 0, 1,
-0.840411, 1.654512, -0.3587586, 0.7294118, 1, 0, 1,
-0.8350534, 0.0641962, -4.372044, 0.7215686, 1, 0, 1,
-0.8347372, -0.4418203, -2.164856, 0.7176471, 1, 0, 1,
-0.8330449, -0.3076821, -3.711096, 0.7098039, 1, 0, 1,
-0.8321357, -0.6513752, -2.733974, 0.7058824, 1, 0, 1,
-0.8231918, 1.368643, -0.8372548, 0.6980392, 1, 0, 1,
-0.8156047, -0.8998837, -3.591981, 0.6901961, 1, 0, 1,
-0.802498, -0.7782375, -1.129098, 0.6862745, 1, 0, 1,
-0.7915491, -1.19861, -3.14871, 0.6784314, 1, 0, 1,
-0.789353, -0.4386772, -1.730754, 0.6745098, 1, 0, 1,
-0.7872034, -2.106996, -3.216341, 0.6666667, 1, 0, 1,
-0.7840636, -0.8131163, -1.604789, 0.6627451, 1, 0, 1,
-0.7812661, 1.125329, -0.6837108, 0.654902, 1, 0, 1,
-0.7782151, -0.3888802, -0.05937428, 0.6509804, 1, 0, 1,
-0.7765634, 1.480881, -1.477608, 0.6431373, 1, 0, 1,
-0.7746458, -0.2243169, -0.8792381, 0.6392157, 1, 0, 1,
-0.7740418, -0.02251334, -0.6730317, 0.6313726, 1, 0, 1,
-0.7693393, 0.8461841, -1.933075, 0.627451, 1, 0, 1,
-0.7692235, -0.2323066, -2.143756, 0.6196079, 1, 0, 1,
-0.7683225, -1.29746, -2.24514, 0.6156863, 1, 0, 1,
-0.7675053, -0.432803, -1.181818, 0.6078432, 1, 0, 1,
-0.7635074, -0.8996527, -3.074642, 0.6039216, 1, 0, 1,
-0.7609676, 0.4627256, -0.7044989, 0.5960785, 1, 0, 1,
-0.7608626, -0.8553013, -3.205515, 0.5882353, 1, 0, 1,
-0.7547743, -1.276407, -2.025649, 0.5843138, 1, 0, 1,
-0.7521054, -0.2627213, -2.876182, 0.5764706, 1, 0, 1,
-0.7465261, -0.9119844, -2.737844, 0.572549, 1, 0, 1,
-0.7407596, 1.431357, -2.455657, 0.5647059, 1, 0, 1,
-0.7325817, 0.726552, -0.6223843, 0.5607843, 1, 0, 1,
-0.7306947, -0.2878556, -2.318921, 0.5529412, 1, 0, 1,
-0.7276567, -1.796273, -3.229995, 0.5490196, 1, 0, 1,
-0.7254719, 0.2334486, -0.5411294, 0.5411765, 1, 0, 1,
-0.7228675, 1.651318, -0.1322236, 0.5372549, 1, 0, 1,
-0.7192196, 0.7850085, 2.396487, 0.5294118, 1, 0, 1,
-0.7144108, -2.828002, -3.959318, 0.5254902, 1, 0, 1,
-0.7102354, -0.1817724, -2.621067, 0.5176471, 1, 0, 1,
-0.7086182, -1.054817, -1.545522, 0.5137255, 1, 0, 1,
-0.7081801, 0.8004896, -0.9125853, 0.5058824, 1, 0, 1,
-0.7073574, 1.950557, 0.2232553, 0.5019608, 1, 0, 1,
-0.6948096, -1.326078, -3.475227, 0.4941176, 1, 0, 1,
-0.6931038, -0.1635701, -0.5493652, 0.4862745, 1, 0, 1,
-0.6928035, -0.4514801, -2.177123, 0.4823529, 1, 0, 1,
-0.6860949, 0.9077202, 0.2881792, 0.4745098, 1, 0, 1,
-0.6834016, 0.9925358, -2.423767, 0.4705882, 1, 0, 1,
-0.6813287, 0.5576045, -1.632148, 0.4627451, 1, 0, 1,
-0.6746891, -0.3554292, -0.9921672, 0.4588235, 1, 0, 1,
-0.6732218, -0.5512642, -0.9896622, 0.4509804, 1, 0, 1,
-0.6632373, 0.6626906, -0.3942557, 0.4470588, 1, 0, 1,
-0.662745, 0.5239801, -1.509068, 0.4392157, 1, 0, 1,
-0.6624855, -0.383225, -2.110153, 0.4352941, 1, 0, 1,
-0.6616495, -0.4699874, -2.914472, 0.427451, 1, 0, 1,
-0.6599184, 0.7765009, -0.4431516, 0.4235294, 1, 0, 1,
-0.6574306, -0.1996152, -3.343556, 0.4156863, 1, 0, 1,
-0.649344, -1.497071, -4.935372, 0.4117647, 1, 0, 1,
-0.6419552, 0.3566151, -0.8489217, 0.4039216, 1, 0, 1,
-0.641685, -0.8338495, -4.160321, 0.3960784, 1, 0, 1,
-0.6357362, -0.3864479, -3.118397, 0.3921569, 1, 0, 1,
-0.6333393, 0.4188579, -1.45595, 0.3843137, 1, 0, 1,
-0.6305758, 0.9456111, 0.1299958, 0.3803922, 1, 0, 1,
-0.6295543, 1.545927, -1.043893, 0.372549, 1, 0, 1,
-0.6288733, 0.4924978, -0.6984734, 0.3686275, 1, 0, 1,
-0.6286628, 1.279552, -0.1041763, 0.3607843, 1, 0, 1,
-0.6268305, 1.456373, -0.5373257, 0.3568628, 1, 0, 1,
-0.6267904, -1.617131, -3.132499, 0.3490196, 1, 0, 1,
-0.6267769, 0.5083051, -0.04810977, 0.345098, 1, 0, 1,
-0.6248716, -0.417564, -1.760663, 0.3372549, 1, 0, 1,
-0.6219968, -0.001728032, -1.24357, 0.3333333, 1, 0, 1,
-0.6150109, -0.8521057, -2.791473, 0.3254902, 1, 0, 1,
-0.6130602, -0.8768141, -3.817304, 0.3215686, 1, 0, 1,
-0.6130008, 1.826853, -0.02324327, 0.3137255, 1, 0, 1,
-0.6128517, -0.4808864, -3.629256, 0.3098039, 1, 0, 1,
-0.6125943, 0.7559443, 0.2492679, 0.3019608, 1, 0, 1,
-0.611136, 0.4456642, 0.9980927, 0.2941177, 1, 0, 1,
-0.608132, 1.655963, -1.995796, 0.2901961, 1, 0, 1,
-0.606677, 0.02005447, -3.134413, 0.282353, 1, 0, 1,
-0.6064039, -1.092776, -2.289149, 0.2784314, 1, 0, 1,
-0.6027914, 0.9824426, 0.5669671, 0.2705882, 1, 0, 1,
-0.5983876, 0.25153, -1.805824, 0.2666667, 1, 0, 1,
-0.5918292, -1.882608, -2.024198, 0.2588235, 1, 0, 1,
-0.5917066, 1.627911, -1.323392, 0.254902, 1, 0, 1,
-0.5909714, -0.9595653, -2.87302, 0.2470588, 1, 0, 1,
-0.5900632, 0.3986862, 1.378869, 0.2431373, 1, 0, 1,
-0.5840028, 1.340265, -0.5156812, 0.2352941, 1, 0, 1,
-0.5826165, -0.3325625, -2.928068, 0.2313726, 1, 0, 1,
-0.5792356, 2.70109, 0.2562418, 0.2235294, 1, 0, 1,
-0.5743108, -1.948883, -4.166441, 0.2196078, 1, 0, 1,
-0.5737744, -0.726153, -2.430683, 0.2117647, 1, 0, 1,
-0.5734078, 0.4313614, -0.6649346, 0.2078431, 1, 0, 1,
-0.570709, 1.540402, -0.8916366, 0.2, 1, 0, 1,
-0.5676611, 1.823643, -1.229732, 0.1921569, 1, 0, 1,
-0.5668272, 0.7056254, 0.825083, 0.1882353, 1, 0, 1,
-0.5661799, -0.4587166, -3.421359, 0.1803922, 1, 0, 1,
-0.5628259, -0.2744985, -1.235346, 0.1764706, 1, 0, 1,
-0.5604563, -0.3395436, -2.850338, 0.1686275, 1, 0, 1,
-0.5585444, 0.7615732, 0.08783115, 0.1647059, 1, 0, 1,
-0.5583729, 0.1687533, -2.529597, 0.1568628, 1, 0, 1,
-0.552642, 0.6655897, 0.03112602, 0.1529412, 1, 0, 1,
-0.5519217, -0.9449888, -0.8531701, 0.145098, 1, 0, 1,
-0.5447184, 1.737686, -0.2757471, 0.1411765, 1, 0, 1,
-0.5438846, -1.182281, -2.667646, 0.1333333, 1, 0, 1,
-0.5327942, 0.5305189, -1.030171, 0.1294118, 1, 0, 1,
-0.5291269, -0.703544, -7.079037, 0.1215686, 1, 0, 1,
-0.5281336, 0.8094079, -1.529469, 0.1176471, 1, 0, 1,
-0.5255479, -0.6463149, -2.43106, 0.1098039, 1, 0, 1,
-0.5241828, 2.271096, -0.6077881, 0.1058824, 1, 0, 1,
-0.5220768, -1.085779, -3.876242, 0.09803922, 1, 0, 1,
-0.5164183, -0.2236695, -2.134529, 0.09019608, 1, 0, 1,
-0.5159963, -0.3012397, 0.1582514, 0.08627451, 1, 0, 1,
-0.5157372, 0.6942189, 0.4821349, 0.07843138, 1, 0, 1,
-0.5150857, -0.4524164, -2.711666, 0.07450981, 1, 0, 1,
-0.5135828, 0.2494417, -1.41613, 0.06666667, 1, 0, 1,
-0.5090646, 1.196193, -2.32541, 0.0627451, 1, 0, 1,
-0.5086942, 0.1994574, -1.328432, 0.05490196, 1, 0, 1,
-0.5026818, -1.349948, -3.940741, 0.05098039, 1, 0, 1,
-0.5024145, 1.483709, -1.629367, 0.04313726, 1, 0, 1,
-0.4992979, 1.200881, 0.1021956, 0.03921569, 1, 0, 1,
-0.4919782, -0.2641194, -2.57464, 0.03137255, 1, 0, 1,
-0.4887568, 1.442186, -1.813951, 0.02745098, 1, 0, 1,
-0.4838637, 1.229792, -0.5681029, 0.01960784, 1, 0, 1,
-0.4822619, -0.1408065, -1.091933, 0.01568628, 1, 0, 1,
-0.4806053, 0.6769907, 0.18173, 0.007843138, 1, 0, 1,
-0.4772167, 0.009708473, -2.036405, 0.003921569, 1, 0, 1,
-0.4730765, 0.400053, 1.037075, 0, 1, 0.003921569, 1,
-0.4682657, -0.241241, -1.607983, 0, 1, 0.01176471, 1,
-0.4646395, 0.2537985, -2.785205, 0, 1, 0.01568628, 1,
-0.4635687, -0.6266825, -1.951493, 0, 1, 0.02352941, 1,
-0.4627437, 0.1289638, 0.4962766, 0, 1, 0.02745098, 1,
-0.4611742, -1.194332, -3.350569, 0, 1, 0.03529412, 1,
-0.4561055, 0.6591064, -1.975037, 0, 1, 0.03921569, 1,
-0.4531979, 1.139369, 0.6509332, 0, 1, 0.04705882, 1,
-0.4465007, -0.5751886, 0.2666513, 0, 1, 0.05098039, 1,
-0.4429538, 1.069834, 0.6441992, 0, 1, 0.05882353, 1,
-0.4393949, 0.3465397, 1.139443, 0, 1, 0.0627451, 1,
-0.439346, 1.220796, -0.06967629, 0, 1, 0.07058824, 1,
-0.4389876, -0.9688658, -3.666005, 0, 1, 0.07450981, 1,
-0.4359728, 0.7444926, -0.7125772, 0, 1, 0.08235294, 1,
-0.4316721, -1.16431, -4.279946, 0, 1, 0.08627451, 1,
-0.4311523, -1.792665, -4.542101, 0, 1, 0.09411765, 1,
-0.4261754, -2.847174, -3.278368, 0, 1, 0.1019608, 1,
-0.4249719, -1.136241, -1.779468, 0, 1, 0.1058824, 1,
-0.4227462, 0.7987998, -1.772728, 0, 1, 0.1137255, 1,
-0.4217687, -0.9718049, -2.427076, 0, 1, 0.1176471, 1,
-0.4188128, 0.5409861, -1.068869, 0, 1, 0.1254902, 1,
-0.4169242, -1.233127, -2.316827, 0, 1, 0.1294118, 1,
-0.4164008, 1.771134, -0.7230327, 0, 1, 0.1372549, 1,
-0.4153711, 1.471749, 0.144352, 0, 1, 0.1411765, 1,
-0.4152649, -0.2858601, -3.109869, 0, 1, 0.1490196, 1,
-0.4131553, -0.4925868, -3.137509, 0, 1, 0.1529412, 1,
-0.411134, -0.768559, -2.627296, 0, 1, 0.1607843, 1,
-0.408906, -0.02917072, -2.081677, 0, 1, 0.1647059, 1,
-0.405286, 1.541826, 0.261353, 0, 1, 0.172549, 1,
-0.3999558, -1.105554, -3.25037, 0, 1, 0.1764706, 1,
-0.3994817, -0.1385859, -3.151809, 0, 1, 0.1843137, 1,
-0.3929999, -0.9328977, -4.10205, 0, 1, 0.1882353, 1,
-0.392798, 1.071196, 0.6057889, 0, 1, 0.1960784, 1,
-0.3918279, -1.924343, -4.21133, 0, 1, 0.2039216, 1,
-0.3861821, -1.663672, -1.905748, 0, 1, 0.2078431, 1,
-0.3852745, -1.008526, -3.54403, 0, 1, 0.2156863, 1,
-0.3846576, 0.05131736, -1.355548, 0, 1, 0.2196078, 1,
-0.3810281, 0.6683862, -1.517981, 0, 1, 0.227451, 1,
-0.380953, 0.4723813, -0.3945892, 0, 1, 0.2313726, 1,
-0.377792, 0.3564411, 0.3763344, 0, 1, 0.2392157, 1,
-0.3755371, -0.3549278, -1.585163, 0, 1, 0.2431373, 1,
-0.3744012, 0.3343992, -2.493341, 0, 1, 0.2509804, 1,
-0.3742908, -1.223253, -2.479712, 0, 1, 0.254902, 1,
-0.3727659, 0.7733765, 0.4320514, 0, 1, 0.2627451, 1,
-0.3673054, 1.140659, 0.7650036, 0, 1, 0.2666667, 1,
-0.365779, 1.162388, -0.5987828, 0, 1, 0.2745098, 1,
-0.3614252, 1.290182, -0.4051982, 0, 1, 0.2784314, 1,
-0.3598996, -0.6615537, -1.460677, 0, 1, 0.2862745, 1,
-0.3589378, -1.081679, -2.252438, 0, 1, 0.2901961, 1,
-0.3571062, -0.53275, -1.466655, 0, 1, 0.2980392, 1,
-0.3534971, -1.027511, -4.024551, 0, 1, 0.3058824, 1,
-0.3507705, 0.1644289, 0.09996945, 0, 1, 0.3098039, 1,
-0.3385946, 0.5573167, 0.2107205, 0, 1, 0.3176471, 1,
-0.3383193, -0.3032539, -3.040256, 0, 1, 0.3215686, 1,
-0.336292, -0.3633044, -2.314459, 0, 1, 0.3294118, 1,
-0.3283598, -0.9535965, -3.828365, 0, 1, 0.3333333, 1,
-0.3263297, -0.6515967, -1.982836, 0, 1, 0.3411765, 1,
-0.3243794, 0.4539825, 1.026582, 0, 1, 0.345098, 1,
-0.3202629, 0.08202991, 0.3141538, 0, 1, 0.3529412, 1,
-0.3201685, -1.298663, -1.946606, 0, 1, 0.3568628, 1,
-0.3063908, 0.08012384, -0.5897635, 0, 1, 0.3647059, 1,
-0.3055633, -0.09709508, -2.585789, 0, 1, 0.3686275, 1,
-0.3044415, 0.2266983, -1.693999, 0, 1, 0.3764706, 1,
-0.3022847, -0.9984813, -2.020705, 0, 1, 0.3803922, 1,
-0.3020779, -1.208989, -2.220603, 0, 1, 0.3882353, 1,
-0.3010836, 1.886229, 0.8933315, 0, 1, 0.3921569, 1,
-0.2992002, 0.6258772, -0.6803679, 0, 1, 0.4, 1,
-0.29641, -0.2738962, -1.944971, 0, 1, 0.4078431, 1,
-0.2955954, -1.121271, -3.223769, 0, 1, 0.4117647, 1,
-0.2951491, -0.6526448, -2.612784, 0, 1, 0.4196078, 1,
-0.2832091, 0.8165628, -2.389945, 0, 1, 0.4235294, 1,
-0.2821873, 0.5269452, -0.4620021, 0, 1, 0.4313726, 1,
-0.2811049, 0.9296105, 0.4669406, 0, 1, 0.4352941, 1,
-0.2802407, 1.435784, -0.7386748, 0, 1, 0.4431373, 1,
-0.2785882, -0.1497367, 0.6914315, 0, 1, 0.4470588, 1,
-0.2783315, 0.1176604, -2.309396, 0, 1, 0.454902, 1,
-0.275891, 0.3042779, -1.008552, 0, 1, 0.4588235, 1,
-0.2732193, -0.1058838, -1.758194, 0, 1, 0.4666667, 1,
-0.2661755, 1.234175, -1.155355, 0, 1, 0.4705882, 1,
-0.2617437, -0.2752593, -2.144423, 0, 1, 0.4784314, 1,
-0.2602251, 0.133695, 0.2601923, 0, 1, 0.4823529, 1,
-0.2557776, -0.4648394, -3.527327, 0, 1, 0.4901961, 1,
-0.2552817, 0.8444123, -0.2504165, 0, 1, 0.4941176, 1,
-0.2519113, -0.6669793, -3.453904, 0, 1, 0.5019608, 1,
-0.2518765, -0.6728065, -2.633529, 0, 1, 0.509804, 1,
-0.248969, -1.017593, -2.206073, 0, 1, 0.5137255, 1,
-0.2483168, -0.6471883, -3.821811, 0, 1, 0.5215687, 1,
-0.2481236, -0.8664933, -0.8145446, 0, 1, 0.5254902, 1,
-0.244805, -2.120611, -2.3191, 0, 1, 0.5333334, 1,
-0.243112, 0.7780843, -1.802705, 0, 1, 0.5372549, 1,
-0.2399048, -0.4832312, -2.598561, 0, 1, 0.5450981, 1,
-0.2277984, 0.3793839, -0.1005848, 0, 1, 0.5490196, 1,
-0.2274647, -0.9176954, -2.678384, 0, 1, 0.5568628, 1,
-0.2232501, 0.5284516, -1.80235, 0, 1, 0.5607843, 1,
-0.2187692, 0.2215385, -0.2069033, 0, 1, 0.5686275, 1,
-0.216004, -1.085392, -3.654348, 0, 1, 0.572549, 1,
-0.2147492, 0.2750826, -1.471055, 0, 1, 0.5803922, 1,
-0.2069647, -0.7023306, -4.153843, 0, 1, 0.5843138, 1,
-0.2045537, -0.02987976, 1.344165, 0, 1, 0.5921569, 1,
-0.2036087, -0.7882888, -2.451218, 0, 1, 0.5960785, 1,
-0.2010344, 1.732102, 1.016947, 0, 1, 0.6039216, 1,
-0.2009164, -0.1549435, -2.435035, 0, 1, 0.6117647, 1,
-0.1938663, 1.542418, 1.523942, 0, 1, 0.6156863, 1,
-0.1929193, -0.8562779, -1.881921, 0, 1, 0.6235294, 1,
-0.1927283, -0.8836449, -2.367232, 0, 1, 0.627451, 1,
-0.191108, -1.946992, -2.570818, 0, 1, 0.6352941, 1,
-0.1905235, -0.7733803, -3.369162, 0, 1, 0.6392157, 1,
-0.1904787, -0.5667034, -4.386928, 0, 1, 0.6470588, 1,
-0.1894829, 0.6184326, 0.2163133, 0, 1, 0.6509804, 1,
-0.1863556, 0.586969, -0.7186939, 0, 1, 0.6588235, 1,
-0.1834766, -0.8757418, -1.697439, 0, 1, 0.6627451, 1,
-0.1824854, 0.1827037, -1.834532, 0, 1, 0.6705883, 1,
-0.1805719, -0.3599963, -3.145782, 0, 1, 0.6745098, 1,
-0.1800964, 0.7858658, 0.9670199, 0, 1, 0.682353, 1,
-0.1774894, -0.5668833, -0.7800069, 0, 1, 0.6862745, 1,
-0.1750674, 0.8639176, -0.7122967, 0, 1, 0.6941177, 1,
-0.1632392, -0.7780368, -1.750021, 0, 1, 0.7019608, 1,
-0.1605436, 1.176183, -2.047597, 0, 1, 0.7058824, 1,
-0.1585192, -0.8721131, -2.84622, 0, 1, 0.7137255, 1,
-0.1552652, 0.5575117, 0.6756418, 0, 1, 0.7176471, 1,
-0.1548873, -0.5599002, -3.224248, 0, 1, 0.7254902, 1,
-0.1548068, -0.8732962, -2.395066, 0, 1, 0.7294118, 1,
-0.1477733, 0.05305894, -0.3532783, 0, 1, 0.7372549, 1,
-0.1336998, -1.331663, -3.87343, 0, 1, 0.7411765, 1,
-0.1321043, -0.6725424, -2.706995, 0, 1, 0.7490196, 1,
-0.1282391, 0.5272936, 0.03037179, 0, 1, 0.7529412, 1,
-0.1266366, 0.3237899, -1.496294, 0, 1, 0.7607843, 1,
-0.1249364, 1.093611, 0.8358657, 0, 1, 0.7647059, 1,
-0.1248105, -0.5515574, -2.656099, 0, 1, 0.772549, 1,
-0.118289, 0.6406948, -0.430431, 0, 1, 0.7764706, 1,
-0.1157643, 0.1644446, -0.04741012, 0, 1, 0.7843137, 1,
-0.1139764, 0.4542045, 0.6227815, 0, 1, 0.7882353, 1,
-0.1139713, 0.5414883, 1.168085, 0, 1, 0.7960784, 1,
-0.1132422, 0.1888817, -1.854647, 0, 1, 0.8039216, 1,
-0.1131809, 0.03303024, -3.425553, 0, 1, 0.8078431, 1,
-0.1064032, 0.4322899, 0.4045641, 0, 1, 0.8156863, 1,
-0.1058934, -1.132421, -3.162037, 0, 1, 0.8196079, 1,
-0.1053303, 0.8381712, -0.4603978, 0, 1, 0.827451, 1,
-0.1047359, 0.08169621, -2.711745, 0, 1, 0.8313726, 1,
-0.1047024, 0.1743082, -0.5673259, 0, 1, 0.8392157, 1,
-0.1042935, -2.044845, -3.50586, 0, 1, 0.8431373, 1,
-0.09915445, -1.035168, -2.225712, 0, 1, 0.8509804, 1,
-0.09871837, 0.8627495, -0.9697329, 0, 1, 0.854902, 1,
-0.09670021, -0.4580769, -1.242702, 0, 1, 0.8627451, 1,
-0.0962722, -0.5230899, -2.479597, 0, 1, 0.8666667, 1,
-0.09550668, 0.8273047, -0.8668098, 0, 1, 0.8745098, 1,
-0.08900663, -0.6898217, -4.013034, 0, 1, 0.8784314, 1,
-0.08712003, 1.131727, -1.361481, 0, 1, 0.8862745, 1,
-0.07653037, -1.153474, -2.43793, 0, 1, 0.8901961, 1,
-0.07638285, 0.2375738, 0.613791, 0, 1, 0.8980392, 1,
-0.07271104, 1.821885, 0.9509673, 0, 1, 0.9058824, 1,
-0.07102443, 0.6035194, -0.9506279, 0, 1, 0.9098039, 1,
-0.07012391, 0.6819803, 0.4289788, 0, 1, 0.9176471, 1,
-0.06355902, 0.2099655, 0.004978136, 0, 1, 0.9215686, 1,
-0.06251678, 0.3696473, -1.159074, 0, 1, 0.9294118, 1,
-0.06175387, 0.0296266, 0.03421485, 0, 1, 0.9333333, 1,
-0.05711323, -1.216496, -2.882065, 0, 1, 0.9411765, 1,
-0.05509376, -0.8877075, -2.708411, 0, 1, 0.945098, 1,
-0.05276336, 1.897951, 0.2165931, 0, 1, 0.9529412, 1,
-0.05045049, 0.3833761, 1.086502, 0, 1, 0.9568627, 1,
-0.04856557, 1.217197, -0.3779596, 0, 1, 0.9647059, 1,
-0.04494164, -1.806775, -3.913536, 0, 1, 0.9686275, 1,
-0.04305791, 0.9489293, 0.6517454, 0, 1, 0.9764706, 1,
-0.04283158, -0.6611865, -3.035691, 0, 1, 0.9803922, 1,
-0.04135964, 1.239262, -0.6220092, 0, 1, 0.9882353, 1,
-0.03713306, 0.3741973, 0.8304461, 0, 1, 0.9921569, 1,
-0.02995214, 0.4516463, -0.2384237, 0, 1, 1, 1,
-0.02434398, 1.39361, 0.7218259, 0, 0.9921569, 1, 1,
-0.01802879, 0.2665713, 1.015286, 0, 0.9882353, 1, 1,
-0.01113845, 1.303951, 0.1998666, 0, 0.9803922, 1, 1,
-0.01078393, -0.709551, -2.855719, 0, 0.9764706, 1, 1,
-0.01075961, -0.3388866, -4.034313, 0, 0.9686275, 1, 1,
-0.01031893, 0.1305593, -0.5121308, 0, 0.9647059, 1, 1,
-0.008801384, -0.3552062, -2.504463, 0, 0.9568627, 1, 1,
-0.008303442, 0.165225, 0.2904577, 0, 0.9529412, 1, 1,
-0.007144989, -1.152606, -4.715704, 0, 0.945098, 1, 1,
-0.006005045, 1.462546, -0.2686619, 0, 0.9411765, 1, 1,
-0.005747002, 0.7506011, 0.2463247, 0, 0.9333333, 1, 1,
-0.002956479, -1.409541, -3.391048, 0, 0.9294118, 1, 1,
-0.002462828, -0.8752003, -4.171389, 0, 0.9215686, 1, 1,
-0.001207292, 0.5691821, -0.941343, 0, 0.9176471, 1, 1,
0.002058379, 1.12347, -2.096218, 0, 0.9098039, 1, 1,
0.003142591, 0.03380296, 0.4312246, 0, 0.9058824, 1, 1,
0.00327247, -0.684853, 3.530684, 0, 0.8980392, 1, 1,
0.003715062, -0.4082815, 3.396364, 0, 0.8901961, 1, 1,
0.005827936, -0.1022795, 3.558977, 0, 0.8862745, 1, 1,
0.01009419, 0.3379245, 0.01285469, 0, 0.8784314, 1, 1,
0.0124559, -1.163796, 3.080773, 0, 0.8745098, 1, 1,
0.01274909, -1.288217, 3.966331, 0, 0.8666667, 1, 1,
0.01411886, 0.01750322, 0.9914477, 0, 0.8627451, 1, 1,
0.01455731, 0.2448378, 0.5758327, 0, 0.854902, 1, 1,
0.01769158, 2.302684, 1.253526, 0, 0.8509804, 1, 1,
0.02635292, 0.8012451, 0.685105, 0, 0.8431373, 1, 1,
0.02904187, 0.4886079, 1.891361, 0, 0.8392157, 1, 1,
0.03188794, -0.09655292, 3.727005, 0, 0.8313726, 1, 1,
0.03626309, -0.9339041, 2.592252, 0, 0.827451, 1, 1,
0.03848424, -0.7287759, 2.850528, 0, 0.8196079, 1, 1,
0.04046253, -0.1356549, 3.401934, 0, 0.8156863, 1, 1,
0.04343106, -0.9992357, 2.910846, 0, 0.8078431, 1, 1,
0.04402179, 0.2011387, -0.6741772, 0, 0.8039216, 1, 1,
0.04631438, -1.085553, 4.20546, 0, 0.7960784, 1, 1,
0.04655098, 1.64494, 0.6188961, 0, 0.7882353, 1, 1,
0.04958292, 1.670636, 0.8714479, 0, 0.7843137, 1, 1,
0.04966382, -0.7298687, 1.944899, 0, 0.7764706, 1, 1,
0.05513646, -0.4782419, 2.245378, 0, 0.772549, 1, 1,
0.0559765, -1.242287, 2.063385, 0, 0.7647059, 1, 1,
0.05688863, 1.524659, 0.2710117, 0, 0.7607843, 1, 1,
0.05819118, 0.2648973, -0.8092755, 0, 0.7529412, 1, 1,
0.06222701, 1.258095, -1.276063, 0, 0.7490196, 1, 1,
0.0659193, 0.2929415, 0.3414491, 0, 0.7411765, 1, 1,
0.06655632, -1.21189, 2.696307, 0, 0.7372549, 1, 1,
0.07119064, -1.008453, 1.232837, 0, 0.7294118, 1, 1,
0.07710113, 0.6058134, -1.584415, 0, 0.7254902, 1, 1,
0.07763587, -2.198575, 4.224677, 0, 0.7176471, 1, 1,
0.07930078, 0.2814561, -0.1113293, 0, 0.7137255, 1, 1,
0.07972037, 0.7988992, 0.5968748, 0, 0.7058824, 1, 1,
0.08042607, -1.199797, 3.12684, 0, 0.6980392, 1, 1,
0.08099553, -0.6484801, 2.367052, 0, 0.6941177, 1, 1,
0.08184481, -1.064469, 1.408475, 0, 0.6862745, 1, 1,
0.09139356, 0.9279774, -1.220384, 0, 0.682353, 1, 1,
0.103139, -2.341808, 1.74757, 0, 0.6745098, 1, 1,
0.105629, 0.1713885, 1.154306, 0, 0.6705883, 1, 1,
0.1056776, 0.4345496, -0.6943889, 0, 0.6627451, 1, 1,
0.1067991, -1.652809, 1.725996, 0, 0.6588235, 1, 1,
0.1107874, 0.2017827, -1.288952, 0, 0.6509804, 1, 1,
0.1140687, -2.914878, 3.928517, 0, 0.6470588, 1, 1,
0.1142411, 1.233872, 0.05615684, 0, 0.6392157, 1, 1,
0.1151522, 1.016836, -0.5828109, 0, 0.6352941, 1, 1,
0.1183011, 0.4856071, 0.454048, 0, 0.627451, 1, 1,
0.1203937, -0.4605763, 1.164065, 0, 0.6235294, 1, 1,
0.1205047, 0.06468658, 0.6511252, 0, 0.6156863, 1, 1,
0.1244142, -0.4975044, 2.772539, 0, 0.6117647, 1, 1,
0.1244572, -0.493516, 2.41007, 0, 0.6039216, 1, 1,
0.1244648, 0.666833, 0.3008859, 0, 0.5960785, 1, 1,
0.1260813, -0.7520981, 2.770002, 0, 0.5921569, 1, 1,
0.1292629, 0.8403389, -1.708124, 0, 0.5843138, 1, 1,
0.1296453, -0.1626421, 2.555209, 0, 0.5803922, 1, 1,
0.1307075, 0.4887017, -0.0422669, 0, 0.572549, 1, 1,
0.13143, 1.077617, 0.2092956, 0, 0.5686275, 1, 1,
0.1350501, -0.263426, 3.510691, 0, 0.5607843, 1, 1,
0.1353849, -0.4866679, 2.245278, 0, 0.5568628, 1, 1,
0.1367794, -0.009234858, -0.04801822, 0, 0.5490196, 1, 1,
0.1373971, 0.3567331, -1.024086, 0, 0.5450981, 1, 1,
0.1397827, -1.08836, 3.811552, 0, 0.5372549, 1, 1,
0.1401455, -1.750817, 4.116783, 0, 0.5333334, 1, 1,
0.1421633, -0.869352, 1.347187, 0, 0.5254902, 1, 1,
0.1423413, 0.0681467, -0.1580602, 0, 0.5215687, 1, 1,
0.1462118, 0.4125654, 0.353879, 0, 0.5137255, 1, 1,
0.1484742, -0.3069368, 4.462142, 0, 0.509804, 1, 1,
0.1521735, -0.2503484, 2.061749, 0, 0.5019608, 1, 1,
0.1528272, -0.8480124, 1.962063, 0, 0.4941176, 1, 1,
0.1537056, 0.7921429, -0.420212, 0, 0.4901961, 1, 1,
0.1605176, -1.893993, 2.432507, 0, 0.4823529, 1, 1,
0.1639401, 1.211521, 0.3341807, 0, 0.4784314, 1, 1,
0.1639621, 1.238795, -0.1807824, 0, 0.4705882, 1, 1,
0.1662122, -0.336038, 2.468329, 0, 0.4666667, 1, 1,
0.1682351, -0.3263136, 1.375661, 0, 0.4588235, 1, 1,
0.1717427, -0.7466516, 4.671739, 0, 0.454902, 1, 1,
0.1895043, 0.4353242, -1.544551, 0, 0.4470588, 1, 1,
0.2010206, 0.9236448, -0.3528574, 0, 0.4431373, 1, 1,
0.2048922, -0.4337056, 2.077586, 0, 0.4352941, 1, 1,
0.2084634, 0.9691742, -0.7287712, 0, 0.4313726, 1, 1,
0.2090563, -1.558139, 2.547546, 0, 0.4235294, 1, 1,
0.2116973, -1.177252, 1.548713, 0, 0.4196078, 1, 1,
0.2119033, 1.889423, -0.7818363, 0, 0.4117647, 1, 1,
0.2135263, -0.3935916, 3.492014, 0, 0.4078431, 1, 1,
0.2135452, -0.2188, 0.3213575, 0, 0.4, 1, 1,
0.2146901, 0.3504734, 1.381267, 0, 0.3921569, 1, 1,
0.221114, 0.1610069, 0.7864729, 0, 0.3882353, 1, 1,
0.2220034, 0.3699193, 1.246195, 0, 0.3803922, 1, 1,
0.22429, 0.2721832, 1.647419, 0, 0.3764706, 1, 1,
0.2270105, 1.612926, 0.03427972, 0, 0.3686275, 1, 1,
0.231004, -0.679455, 0.4042394, 0, 0.3647059, 1, 1,
0.2333224, 0.4803265, 1.291671, 0, 0.3568628, 1, 1,
0.2347703, 0.9067498, 1.411608, 0, 0.3529412, 1, 1,
0.2404756, -0.5420675, 3.835631, 0, 0.345098, 1, 1,
0.2453632, -0.4561749, 2.536872, 0, 0.3411765, 1, 1,
0.2455335, -0.8955449, 4.730394, 0, 0.3333333, 1, 1,
0.2470814, -0.4153627, 3.620941, 0, 0.3294118, 1, 1,
0.2506152, 0.9724572, 1.367997, 0, 0.3215686, 1, 1,
0.2507415, -0.1895425, 2.60456, 0, 0.3176471, 1, 1,
0.2536379, -0.2150728, 1.646052, 0, 0.3098039, 1, 1,
0.2557768, 1.487407, 0.2250163, 0, 0.3058824, 1, 1,
0.257947, 1.556781, 0.9439286, 0, 0.2980392, 1, 1,
0.2581215, 0.4413212, -0.4383496, 0, 0.2901961, 1, 1,
0.2587307, -0.3284778, 3.520029, 0, 0.2862745, 1, 1,
0.2633289, 0.9813989, -0.1595635, 0, 0.2784314, 1, 1,
0.2644073, -0.8546024, 2.777188, 0, 0.2745098, 1, 1,
0.2678374, -0.5176057, 3.347413, 0, 0.2666667, 1, 1,
0.2862822, 0.189899, 2.71592, 0, 0.2627451, 1, 1,
0.2876464, 0.03584521, 2.812736, 0, 0.254902, 1, 1,
0.2892282, 0.9426153, -1.835665, 0, 0.2509804, 1, 1,
0.2895276, 0.776415, 0.4175372, 0, 0.2431373, 1, 1,
0.291035, 1.843306, -1.342202, 0, 0.2392157, 1, 1,
0.2919323, -1.4689, 4.131019, 0, 0.2313726, 1, 1,
0.3033367, -0.8623825, 2.907993, 0, 0.227451, 1, 1,
0.3034239, -0.2540097, 2.51942, 0, 0.2196078, 1, 1,
0.3042281, 1.176726, 0.2038725, 0, 0.2156863, 1, 1,
0.3064929, -0.572435, 3.364702, 0, 0.2078431, 1, 1,
0.3146791, -0.1584218, 0.5498065, 0, 0.2039216, 1, 1,
0.3187223, 0.6247084, -0.2373405, 0, 0.1960784, 1, 1,
0.3206534, 0.8225409, 0.4313912, 0, 0.1882353, 1, 1,
0.3242989, 0.5767879, 0.1843972, 0, 0.1843137, 1, 1,
0.3243964, 1.131969, 0.6435015, 0, 0.1764706, 1, 1,
0.3252906, -0.4517132, 1.993537, 0, 0.172549, 1, 1,
0.3274668, -0.2387915, 2.520802, 0, 0.1647059, 1, 1,
0.3282617, -1.129757, 3.352462, 0, 0.1607843, 1, 1,
0.3285285, 0.6013144, 1.917497, 0, 0.1529412, 1, 1,
0.3290284, -0.1243015, 1.616456, 0, 0.1490196, 1, 1,
0.3293503, 2.343432, 0.2094281, 0, 0.1411765, 1, 1,
0.3346726, -1.309224, 3.555578, 0, 0.1372549, 1, 1,
0.3470364, 1.049047, -1.617568, 0, 0.1294118, 1, 1,
0.3503553, 0.152029, 1.870366, 0, 0.1254902, 1, 1,
0.3520355, 2.081245, -0.2094341, 0, 0.1176471, 1, 1,
0.3525259, 0.5623225, 0.7455204, 0, 0.1137255, 1, 1,
0.3560422, 0.01105989, -0.3607025, 0, 0.1058824, 1, 1,
0.3565931, -1.051662, 1.981296, 0, 0.09803922, 1, 1,
0.3625806, 1.043316, 0.8084478, 0, 0.09411765, 1, 1,
0.3780028, 1.567696, -1.292884, 0, 0.08627451, 1, 1,
0.38094, -0.3208732, 1.249448, 0, 0.08235294, 1, 1,
0.3819244, 0.6519782, 1.829689, 0, 0.07450981, 1, 1,
0.3866938, 0.570477, -0.9011318, 0, 0.07058824, 1, 1,
0.3902565, 0.8947574, -1.523395, 0, 0.0627451, 1, 1,
0.3962505, 0.5927518, 1.786517, 0, 0.05882353, 1, 1,
0.3968487, 1.0442, 0.8981013, 0, 0.05098039, 1, 1,
0.4003015, -0.620594, 2.132172, 0, 0.04705882, 1, 1,
0.4021648, 0.4228961, 2.517039, 0, 0.03921569, 1, 1,
0.4036618, 1.992712, -2.10661, 0, 0.03529412, 1, 1,
0.4098502, 0.1807363, -0.5191095, 0, 0.02745098, 1, 1,
0.4146893, -1.386037, 1.200123, 0, 0.02352941, 1, 1,
0.4207779, -0.1828751, 1.639541, 0, 0.01568628, 1, 1,
0.4211207, -0.2278991, 2.483129, 0, 0.01176471, 1, 1,
0.4258935, 0.9117078, -0.554083, 0, 0.003921569, 1, 1,
0.4282154, -0.1301799, 2.153021, 0.003921569, 0, 1, 1,
0.4323561, -0.007698074, 2.588219, 0.007843138, 0, 1, 1,
0.4324094, -1.093723, 0.8786076, 0.01568628, 0, 1, 1,
0.4359456, 0.03736233, 1.582132, 0.01960784, 0, 1, 1,
0.43967, -0.7671003, 2.392932, 0.02745098, 0, 1, 1,
0.4414631, -0.5391353, 2.444377, 0.03137255, 0, 1, 1,
0.4417316, -1.767888, 4.208373, 0.03921569, 0, 1, 1,
0.44782, -0.7758775, 3.192593, 0.04313726, 0, 1, 1,
0.4581565, -0.06956704, 3.088542, 0.05098039, 0, 1, 1,
0.4591043, 1.548255, -0.6447222, 0.05490196, 0, 1, 1,
0.4592075, 0.3738982, 0.4890432, 0.0627451, 0, 1, 1,
0.4604127, -1.332418, 3.277728, 0.06666667, 0, 1, 1,
0.4607631, -0.7278692, 3.205481, 0.07450981, 0, 1, 1,
0.4613869, -0.1720784, 2.421791, 0.07843138, 0, 1, 1,
0.4628494, 3.234017, -0.5016665, 0.08627451, 0, 1, 1,
0.46835, 1.122592, 0.9671394, 0.09019608, 0, 1, 1,
0.4692209, 0.7706726, 1.248604, 0.09803922, 0, 1, 1,
0.4706894, 0.3029157, 1.355781, 0.1058824, 0, 1, 1,
0.4718722, 2.167705, 1.689628, 0.1098039, 0, 1, 1,
0.4830615, 0.9880168, 1.109824, 0.1176471, 0, 1, 1,
0.4841304, 0.2348781, 2.400934, 0.1215686, 0, 1, 1,
0.4845035, 1.78584, 1.070241, 0.1294118, 0, 1, 1,
0.5022108, -0.2908889, 1.698412, 0.1333333, 0, 1, 1,
0.5036374, 0.3977449, 0.01198387, 0.1411765, 0, 1, 1,
0.5082951, -0.3731521, 3.425279, 0.145098, 0, 1, 1,
0.514919, 1.00599, -1.878644, 0.1529412, 0, 1, 1,
0.520283, -1.402815, 1.883872, 0.1568628, 0, 1, 1,
0.5211434, 0.1012049, 1.83722, 0.1647059, 0, 1, 1,
0.5249619, -0.08362046, 1.349476, 0.1686275, 0, 1, 1,
0.5271288, 1.065714, -1.453171, 0.1764706, 0, 1, 1,
0.5346152, -0.1169757, 1.30546, 0.1803922, 0, 1, 1,
0.5390021, 1.357958, -0.9265288, 0.1882353, 0, 1, 1,
0.5457243, 0.4346398, 1.558532, 0.1921569, 0, 1, 1,
0.546073, -0.4152884, 2.835241, 0.2, 0, 1, 1,
0.5519498, -1.961818, 2.730781, 0.2078431, 0, 1, 1,
0.5523369, 3.324183, 0.4930564, 0.2117647, 0, 1, 1,
0.5533498, -0.3060662, 1.391814, 0.2196078, 0, 1, 1,
0.5549113, -0.05852403, 1.082286, 0.2235294, 0, 1, 1,
0.5607352, 0.8994038, -0.2420233, 0.2313726, 0, 1, 1,
0.561467, 0.5500104, 0.9817541, 0.2352941, 0, 1, 1,
0.5621387, 0.1028854, 1.478122, 0.2431373, 0, 1, 1,
0.5622053, -1.79489, 3.189471, 0.2470588, 0, 1, 1,
0.5622622, 2.075081, 1.181756, 0.254902, 0, 1, 1,
0.5637206, 1.306229, -0.05468167, 0.2588235, 0, 1, 1,
0.5649941, -0.6095408, 2.16169, 0.2666667, 0, 1, 1,
0.5704955, -0.1813296, 1.138956, 0.2705882, 0, 1, 1,
0.5745845, 0.3680953, 1.390901, 0.2784314, 0, 1, 1,
0.5751851, 0.1142818, 1.685643, 0.282353, 0, 1, 1,
0.5769401, -0.165139, 0.8308893, 0.2901961, 0, 1, 1,
0.5804067, -0.3699617, 0.7832817, 0.2941177, 0, 1, 1,
0.5816894, 0.1951252, 0.3411774, 0.3019608, 0, 1, 1,
0.5834243, -1.158885, 2.620367, 0.3098039, 0, 1, 1,
0.584734, -0.1625661, 2.561533, 0.3137255, 0, 1, 1,
0.5863686, -0.8498223, 2.149348, 0.3215686, 0, 1, 1,
0.5978165, -0.8600108, 3.072124, 0.3254902, 0, 1, 1,
0.602071, 0.2588446, -0.1207566, 0.3333333, 0, 1, 1,
0.6026064, 0.3407755, 0.8591348, 0.3372549, 0, 1, 1,
0.6028494, 0.3727272, 1.573288, 0.345098, 0, 1, 1,
0.6047446, -0.4126884, 2.06294, 0.3490196, 0, 1, 1,
0.6111287, 0.3341967, 2.044267, 0.3568628, 0, 1, 1,
0.6133507, -1.973161, 1.866661, 0.3607843, 0, 1, 1,
0.6141095, -1.137069, 2.442084, 0.3686275, 0, 1, 1,
0.6149121, 2.22974, 0.813282, 0.372549, 0, 1, 1,
0.6230814, -1.051065, 2.133023, 0.3803922, 0, 1, 1,
0.6233311, 0.4159033, 1.016905, 0.3843137, 0, 1, 1,
0.627574, -0.471116, 2.492442, 0.3921569, 0, 1, 1,
0.6314026, 0.01040376, 0.6278458, 0.3960784, 0, 1, 1,
0.6321454, 0.947426, 1.388997, 0.4039216, 0, 1, 1,
0.6322847, 0.05166054, 2.345066, 0.4117647, 0, 1, 1,
0.6355842, 0.4087983, 1.527785, 0.4156863, 0, 1, 1,
0.6374593, -0.5544026, 2.777504, 0.4235294, 0, 1, 1,
0.645402, 0.8608984, 0.06304945, 0.427451, 0, 1, 1,
0.6457683, 0.6087604, -0.904938, 0.4352941, 0, 1, 1,
0.6467367, -1.804205, 4.617273, 0.4392157, 0, 1, 1,
0.6482694, 0.1549929, 1.97451, 0.4470588, 0, 1, 1,
0.6493454, -0.5679813, 1.116707, 0.4509804, 0, 1, 1,
0.650048, -0.7614008, 1.562279, 0.4588235, 0, 1, 1,
0.651985, -0.09684677, 2.097383, 0.4627451, 0, 1, 1,
0.65412, -2.167839, 1.699356, 0.4705882, 0, 1, 1,
0.6542742, 1.096314, 1.522618, 0.4745098, 0, 1, 1,
0.6561677, -0.5335003, 1.843674, 0.4823529, 0, 1, 1,
0.6564137, 0.0878197, 1.136175, 0.4862745, 0, 1, 1,
0.6580153, 0.8897178, 0.2603136, 0.4941176, 0, 1, 1,
0.6593399, -0.5928846, 4.222906, 0.5019608, 0, 1, 1,
0.6593419, 1.909075, 0.3159362, 0.5058824, 0, 1, 1,
0.6597592, 0.002071462, 3.112201, 0.5137255, 0, 1, 1,
0.6601889, -0.291952, 4.47675, 0.5176471, 0, 1, 1,
0.6641132, -0.550501, 0.953253, 0.5254902, 0, 1, 1,
0.6641605, 1.347226, 0.374003, 0.5294118, 0, 1, 1,
0.6729676, 0.9990177, -0.6221109, 0.5372549, 0, 1, 1,
0.6731459, -0.5950224, 1.561071, 0.5411765, 0, 1, 1,
0.6740084, -0.5444034, 1.618007, 0.5490196, 0, 1, 1,
0.6754147, -0.7256876, 2.668193, 0.5529412, 0, 1, 1,
0.6793787, -0.5431806, 2.558412, 0.5607843, 0, 1, 1,
0.6799371, 1.284858, -0.1517716, 0.5647059, 0, 1, 1,
0.6828886, 0.7523639, 0.7456194, 0.572549, 0, 1, 1,
0.7036924, 0.8980551, -1.663916, 0.5764706, 0, 1, 1,
0.7055349, -0.4432429, 2.015798, 0.5843138, 0, 1, 1,
0.7067495, 0.7589743, 0.3600282, 0.5882353, 0, 1, 1,
0.710919, 1.357674, 0.3224163, 0.5960785, 0, 1, 1,
0.7121122, -1.243431, 2.781396, 0.6039216, 0, 1, 1,
0.7124968, 1.591082, 0.8362194, 0.6078432, 0, 1, 1,
0.7156392, -0.02314453, 0.950875, 0.6156863, 0, 1, 1,
0.7184852, 1.397237, -1.036998, 0.6196079, 0, 1, 1,
0.7208547, -0.3048771, 1.151488, 0.627451, 0, 1, 1,
0.7286708, -1.115547, 3.091614, 0.6313726, 0, 1, 1,
0.7334563, 1.012751, -0.2515355, 0.6392157, 0, 1, 1,
0.7378938, 1.239519, 0.1460954, 0.6431373, 0, 1, 1,
0.7381695, 1.088275, -0.6178455, 0.6509804, 0, 1, 1,
0.7429749, -0.1837333, 2.608786, 0.654902, 0, 1, 1,
0.7450383, 1.028044, 0.675283, 0.6627451, 0, 1, 1,
0.7456232, -1.211627, 3.612282, 0.6666667, 0, 1, 1,
0.7561779, -1.073997, 2.038127, 0.6745098, 0, 1, 1,
0.7563828, 0.001473948, 2.342269, 0.6784314, 0, 1, 1,
0.7636073, 0.7491981, 0.7807985, 0.6862745, 0, 1, 1,
0.769765, -0.6013942, 2.436069, 0.6901961, 0, 1, 1,
0.7737322, 0.08825809, 1.562425, 0.6980392, 0, 1, 1,
0.776314, -3.179442, 1.588365, 0.7058824, 0, 1, 1,
0.7775854, 0.9908013, 0.05887944, 0.7098039, 0, 1, 1,
0.7785816, 0.6497666, 0.7587389, 0.7176471, 0, 1, 1,
0.7880269, -0.1343819, 2.878199, 0.7215686, 0, 1, 1,
0.797198, -0.1028, 3.081585, 0.7294118, 0, 1, 1,
0.8045052, 0.8286677, 0.1678457, 0.7333333, 0, 1, 1,
0.8050394, 0.1726824, 0.5500999, 0.7411765, 0, 1, 1,
0.8056814, -0.7249693, 3.647815, 0.7450981, 0, 1, 1,
0.8092971, -0.1231369, 1.494327, 0.7529412, 0, 1, 1,
0.8107779, -0.4524434, 3.886112, 0.7568628, 0, 1, 1,
0.8122112, -0.0186869, 2.755827, 0.7647059, 0, 1, 1,
0.8122419, 0.804833, 1.022633, 0.7686275, 0, 1, 1,
0.812968, 1.036095, 0.7022824, 0.7764706, 0, 1, 1,
0.8137509, 1.025206, -1.702313, 0.7803922, 0, 1, 1,
0.813843, 0.5106348, 1.829551, 0.7882353, 0, 1, 1,
0.8187969, -0.6576807, 5.066819, 0.7921569, 0, 1, 1,
0.8251215, -0.813913, 1.621067, 0.8, 0, 1, 1,
0.8279088, -1.475662, 4.145672, 0.8078431, 0, 1, 1,
0.829047, 0.5728117, 0.7014457, 0.8117647, 0, 1, 1,
0.833891, -1.40764, 2.332378, 0.8196079, 0, 1, 1,
0.8351166, -0.397662, 1.309355, 0.8235294, 0, 1, 1,
0.8389211, 1.468651, 1.294084, 0.8313726, 0, 1, 1,
0.8390258, 1.747494, 0.4302686, 0.8352941, 0, 1, 1,
0.8395014, -1.039742, 1.03813, 0.8431373, 0, 1, 1,
0.8401082, 1.714754, 0.2478865, 0.8470588, 0, 1, 1,
0.8427496, 1.054132, -0.4116546, 0.854902, 0, 1, 1,
0.8480523, -1.667997, 2.918548, 0.8588235, 0, 1, 1,
0.8504986, -0.4064721, 2.139771, 0.8666667, 0, 1, 1,
0.8516183, -0.835792, 1.70418, 0.8705882, 0, 1, 1,
0.8517494, 0.7079942, 1.290867, 0.8784314, 0, 1, 1,
0.8569415, 0.5231193, 0.3669359, 0.8823529, 0, 1, 1,
0.8609549, -1.842101, 1.598855, 0.8901961, 0, 1, 1,
0.8619884, -0.1103512, 1.852371, 0.8941177, 0, 1, 1,
0.8675495, 0.1698782, 1.080378, 0.9019608, 0, 1, 1,
0.8690173, 0.08501308, 1.167483, 0.9098039, 0, 1, 1,
0.8698151, -0.824379, 1.477777, 0.9137255, 0, 1, 1,
0.8793197, 0.02232779, -0.008533245, 0.9215686, 0, 1, 1,
0.8821193, 0.06417421, 2.746515, 0.9254902, 0, 1, 1,
0.8886667, 1.529098, 0.1289117, 0.9333333, 0, 1, 1,
0.8924237, 0.6656029, 0.3579758, 0.9372549, 0, 1, 1,
0.9004272, -1.147498, 2.352932, 0.945098, 0, 1, 1,
0.9016023, 0.5584916, -0.4963223, 0.9490196, 0, 1, 1,
0.9022587, 1.490598, 1.833475, 0.9568627, 0, 1, 1,
0.9040794, -0.9198744, 2.993311, 0.9607843, 0, 1, 1,
0.9052215, 0.4903338, 1.83884, 0.9686275, 0, 1, 1,
0.9067433, 0.5959054, 0.9050477, 0.972549, 0, 1, 1,
0.9071251, 0.2590043, 1.020635, 0.9803922, 0, 1, 1,
0.9091641, -0.2650146, 0.9408216, 0.9843137, 0, 1, 1,
0.9153254, -0.3535123, 1.882013, 0.9921569, 0, 1, 1,
0.9253981, -0.002575089, 0.878431, 0.9960784, 0, 1, 1,
0.9266771, 0.9787546, 1.220537, 1, 0, 0.9960784, 1,
0.9297293, -0.4058355, 2.198659, 1, 0, 0.9882353, 1,
0.9349346, 1.350461, 0.19508, 1, 0, 0.9843137, 1,
0.9406673, 0.7225768, 0.05010524, 1, 0, 0.9764706, 1,
0.9409801, 0.2284639, 1.302954, 1, 0, 0.972549, 1,
0.9414882, -0.2418881, 0.01630637, 1, 0, 0.9647059, 1,
0.9415554, 1.485293, 0.6044047, 1, 0, 0.9607843, 1,
0.9480356, -0.5735985, 2.55002, 1, 0, 0.9529412, 1,
0.9639627, -0.4796336, 0.7615756, 1, 0, 0.9490196, 1,
0.9640551, -0.5636859, 1.094793, 1, 0, 0.9411765, 1,
0.9654208, 0.9194213, 0.5645748, 1, 0, 0.9372549, 1,
0.9681373, -0.7381699, 3.051606, 1, 0, 0.9294118, 1,
0.9784997, 0.3881179, 2.264778, 1, 0, 0.9254902, 1,
0.989381, 0.2004975, 0.003129234, 1, 0, 0.9176471, 1,
0.9913121, -0.3539226, 1.933621, 1, 0, 0.9137255, 1,
1.006215, 0.08446771, 1.692043, 1, 0, 0.9058824, 1,
1.007719, -1.932288, 3.296189, 1, 0, 0.9019608, 1,
1.007729, -2.212826, 2.864972, 1, 0, 0.8941177, 1,
1.008053, -1.050436, 1.320235, 1, 0, 0.8862745, 1,
1.016501, 0.2675165, 2.347065, 1, 0, 0.8823529, 1,
1.01939, 0.6679624, 1.960741, 1, 0, 0.8745098, 1,
1.027164, 0.1385549, 2.290035, 1, 0, 0.8705882, 1,
1.03275, 2.407283, -0.05234278, 1, 0, 0.8627451, 1,
1.042459, 0.2771101, 1.115856, 1, 0, 0.8588235, 1,
1.043855, -1.236269, 3.433209, 1, 0, 0.8509804, 1,
1.045169, 1.2758, -1.62341, 1, 0, 0.8470588, 1,
1.045337, 0.2211605, -0.007977569, 1, 0, 0.8392157, 1,
1.0479, 1.287927, -2.035541, 1, 0, 0.8352941, 1,
1.056549, -0.435237, 2.144914, 1, 0, 0.827451, 1,
1.062473, 0.2479593, 1.912471, 1, 0, 0.8235294, 1,
1.063947, 0.6681305, 1.984585, 1, 0, 0.8156863, 1,
1.065492, -1.023958, 5.069727, 1, 0, 0.8117647, 1,
1.070953, 0.5009802, 2.078446, 1, 0, 0.8039216, 1,
1.072564, -0.2469038, 2.772319, 1, 0, 0.7960784, 1,
1.076651, 1.414905, 0.3444596, 1, 0, 0.7921569, 1,
1.07918, 1.013024, 0.3486671, 1, 0, 0.7843137, 1,
1.080897, 0.05026226, 1.858685, 1, 0, 0.7803922, 1,
1.08458, -0.01974021, -0.283315, 1, 0, 0.772549, 1,
1.088573, 0.04913471, 0.9390703, 1, 0, 0.7686275, 1,
1.091057, 0.4129859, 1.263488, 1, 0, 0.7607843, 1,
1.092887, 0.2381236, 1.86093, 1, 0, 0.7568628, 1,
1.094118, 0.1871057, 3.283134, 1, 0, 0.7490196, 1,
1.100623, -0.4805138, 1.996083, 1, 0, 0.7450981, 1,
1.10095, 0.09112926, 0.6971438, 1, 0, 0.7372549, 1,
1.108866, 0.708463, 0.6934549, 1, 0, 0.7333333, 1,
1.125732, 1.452089, -0.2156753, 1, 0, 0.7254902, 1,
1.129789, 1.478865, 1.332168, 1, 0, 0.7215686, 1,
1.132753, 0.9675927, -0.6381974, 1, 0, 0.7137255, 1,
1.134531, 1.424716, 1.372041, 1, 0, 0.7098039, 1,
1.137659, -0.01798242, 0.6784194, 1, 0, 0.7019608, 1,
1.140647, -0.04254112, 2.514511, 1, 0, 0.6941177, 1,
1.140721, 0.8820927, -0.6534795, 1, 0, 0.6901961, 1,
1.152875, 0.3634932, -0.5464079, 1, 0, 0.682353, 1,
1.156546, 1.013748, 0.8541586, 1, 0, 0.6784314, 1,
1.162008, 0.08922695, 0.8375314, 1, 0, 0.6705883, 1,
1.165205, -0.1726932, 1.197752, 1, 0, 0.6666667, 1,
1.179485, 0.1029328, 1.144895, 1, 0, 0.6588235, 1,
1.182317, 0.05347997, 2.729378, 1, 0, 0.654902, 1,
1.184596, -0.9688144, 1.933421, 1, 0, 0.6470588, 1,
1.187913, 0.08699484, 1.438987, 1, 0, 0.6431373, 1,
1.200005, -1.106114, 3.720661, 1, 0, 0.6352941, 1,
1.204062, 1.445781, 1.176546, 1, 0, 0.6313726, 1,
1.20674, 1.49123, -0.5533016, 1, 0, 0.6235294, 1,
1.231977, 0.3183506, 1.255708, 1, 0, 0.6196079, 1,
1.24439, -1.293105, 1.720647, 1, 0, 0.6117647, 1,
1.246804, -1.08512, 2.398547, 1, 0, 0.6078432, 1,
1.248516, -0.355367, 2.727561, 1, 0, 0.6, 1,
1.248518, -0.4932642, 2.495295, 1, 0, 0.5921569, 1,
1.254179, -0.6573943, 0.4097459, 1, 0, 0.5882353, 1,
1.272685, 0.5449063, 0.7489436, 1, 0, 0.5803922, 1,
1.274167, 0.06660958, 1.82407, 1, 0, 0.5764706, 1,
1.277969, 0.01486203, 3.516234, 1, 0, 0.5686275, 1,
1.284876, 0.365462, 0.8169931, 1, 0, 0.5647059, 1,
1.287645, 0.2434692, 1.006627, 1, 0, 0.5568628, 1,
1.288034, 0.5541908, -0.02258042, 1, 0, 0.5529412, 1,
1.289706, -1.327286, 1.889683, 1, 0, 0.5450981, 1,
1.305279, -0.8233173, 2.220074, 1, 0, 0.5411765, 1,
1.310175, -0.2622178, -0.01942117, 1, 0, 0.5333334, 1,
1.314323, 0.4852836, 0.9627935, 1, 0, 0.5294118, 1,
1.315038, 0.1197134, 1.995877, 1, 0, 0.5215687, 1,
1.315336, -0.8958963, 2.426407, 1, 0, 0.5176471, 1,
1.317308, -1.887118, 4.301868, 1, 0, 0.509804, 1,
1.32439, -1.378116, 3.020719, 1, 0, 0.5058824, 1,
1.335237, -1.623982, 3.397019, 1, 0, 0.4980392, 1,
1.338688, 0.1808286, 2.044415, 1, 0, 0.4901961, 1,
1.344219, -1.035635, 1.765354, 1, 0, 0.4862745, 1,
1.354601, 0.5205896, 0.1631383, 1, 0, 0.4784314, 1,
1.356132, 0.1705128, 3.088699, 1, 0, 0.4745098, 1,
1.368065, -0.1813882, 1.62565, 1, 0, 0.4666667, 1,
1.368796, 0.1526056, 1.706709, 1, 0, 0.4627451, 1,
1.405226, -1.155488, 3.627495, 1, 0, 0.454902, 1,
1.412967, 0.1782326, 2.991378, 1, 0, 0.4509804, 1,
1.414738, -0.3336765, 2.05082, 1, 0, 0.4431373, 1,
1.4192, 0.2613791, 1.698774, 1, 0, 0.4392157, 1,
1.425913, 2.529915, 1.212938, 1, 0, 0.4313726, 1,
1.435565, -0.459265, 2.508234, 1, 0, 0.427451, 1,
1.439838, 0.81012, 1.798831, 1, 0, 0.4196078, 1,
1.443501, -0.3318733, 3.938182, 1, 0, 0.4156863, 1,
1.449795, 0.02719649, 1.810846, 1, 0, 0.4078431, 1,
1.452702, -0.8982587, 3.032593, 1, 0, 0.4039216, 1,
1.45419, 0.9154462, -0.5599402, 1, 0, 0.3960784, 1,
1.457244, -0.6729125, 1.57435, 1, 0, 0.3882353, 1,
1.457641, 0.5016809, 2.493245, 1, 0, 0.3843137, 1,
1.461239, -0.1981319, 1.916252, 1, 0, 0.3764706, 1,
1.482846, -0.1049447, 1.033655, 1, 0, 0.372549, 1,
1.498402, -0.1107713, 0.9216393, 1, 0, 0.3647059, 1,
1.533168, -0.2091275, 1.216703, 1, 0, 0.3607843, 1,
1.537854, -0.9055718, 1.477514, 1, 0, 0.3529412, 1,
1.543503, -0.4547988, -0.4567413, 1, 0, 0.3490196, 1,
1.557833, -0.8191835, 0.2151354, 1, 0, 0.3411765, 1,
1.570664, 1.399964, 1.386557, 1, 0, 0.3372549, 1,
1.584279, -1.242667, 3.806857, 1, 0, 0.3294118, 1,
1.584491, 0.6624125, 1.947776, 1, 0, 0.3254902, 1,
1.585486, -0.4414701, 1.656714, 1, 0, 0.3176471, 1,
1.60188, 1.741429, 1.34413, 1, 0, 0.3137255, 1,
1.605005, -0.1114466, 1.292228, 1, 0, 0.3058824, 1,
1.606935, -0.4317881, 2.512705, 1, 0, 0.2980392, 1,
1.629774, -0.6061767, 1.059799, 1, 0, 0.2941177, 1,
1.63431, -1.043348, 1.913039, 1, 0, 0.2862745, 1,
1.637831, -0.395476, 2.429124, 1, 0, 0.282353, 1,
1.666667, -0.9531949, 2.30231, 1, 0, 0.2745098, 1,
1.672064, -1.2644, 0.7648086, 1, 0, 0.2705882, 1,
1.684125, -1.214985, 1.300099, 1, 0, 0.2627451, 1,
1.716533, -0.3140302, 2.695979, 1, 0, 0.2588235, 1,
1.734934, 2.25895, -0.3124207, 1, 0, 0.2509804, 1,
1.784059, -0.2717937, 2.930494, 1, 0, 0.2470588, 1,
1.78616, 0.7161499, 2.566455, 1, 0, 0.2392157, 1,
1.827909, 0.3777154, 0.7047866, 1, 0, 0.2352941, 1,
1.836883, 1.185348, 0.8782306, 1, 0, 0.227451, 1,
1.843561, -0.221585, 0.258702, 1, 0, 0.2235294, 1,
1.853449, -0.09953669, 1.091161, 1, 0, 0.2156863, 1,
1.861531, 0.5985104, 1.089159, 1, 0, 0.2117647, 1,
1.905592, 0.1629603, 0.06230773, 1, 0, 0.2039216, 1,
1.912284, -0.3548377, 1.618388, 1, 0, 0.1960784, 1,
1.932624, -0.1519554, 1.60428, 1, 0, 0.1921569, 1,
1.994773, 1.389218, -0.6148244, 1, 0, 0.1843137, 1,
2.014955, 2.561207, 0.7636219, 1, 0, 0.1803922, 1,
2.031499, 0.1426832, 1.914377, 1, 0, 0.172549, 1,
2.036136, 0.2986915, -0.1035811, 1, 0, 0.1686275, 1,
2.050569, 0.4367143, 0.8379052, 1, 0, 0.1607843, 1,
2.052504, -1.156782, 1.371813, 1, 0, 0.1568628, 1,
2.073262, -0.08026709, 2.626715, 1, 0, 0.1490196, 1,
2.073529, -0.7115974, 1.4717, 1, 0, 0.145098, 1,
2.094374, -1.601438, 0.3868845, 1, 0, 0.1372549, 1,
2.139659, 1.14656, 2.260838, 1, 0, 0.1333333, 1,
2.176916, 1.514535, 0.4231412, 1, 0, 0.1254902, 1,
2.183331, -0.07639814, 1.453258, 1, 0, 0.1215686, 1,
2.212049, 1.289349, 0.338019, 1, 0, 0.1137255, 1,
2.250314, -0.9943895, 2.106059, 1, 0, 0.1098039, 1,
2.35662, -0.6708323, 1.51081, 1, 0, 0.1019608, 1,
2.364458, -0.2020513, 1.210433, 1, 0, 0.09411765, 1,
2.375377, -0.6589739, 3.412803, 1, 0, 0.09019608, 1,
2.382634, -1.282362, 3.357922, 1, 0, 0.08235294, 1,
2.390229, 0.6679636, 0.1163727, 1, 0, 0.07843138, 1,
2.416299, 0.3626641, 0.5661616, 1, 0, 0.07058824, 1,
2.440241, 1.63405, 0.8817099, 1, 0, 0.06666667, 1,
2.440926, -1.569863, 2.099172, 1, 0, 0.05882353, 1,
2.591875, -0.1248845, 3.165356, 1, 0, 0.05490196, 1,
2.606991, -0.9384596, 2.758831, 1, 0, 0.04705882, 1,
2.611113, -1.285661, 1.119187, 1, 0, 0.04313726, 1,
2.63622, -0.6975157, 2.933663, 1, 0, 0.03529412, 1,
2.648887, 0.4716881, 2.089942, 1, 0, 0.03137255, 1,
2.78707, 1.764508, 1.624863, 1, 0, 0.02352941, 1,
3.092934, -0.5568287, 1.116718, 1, 0, 0.01960784, 1,
3.136873, -0.8618602, 1.866036, 1, 0, 0.01176471, 1,
3.341659, -1.067695, 3.581874, 1, 0, 0.007843138, 1
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
0.1120703, -4.281806, -9.138252, 0, -0.5, 0.5, 0.5,
0.1120703, -4.281806, -9.138252, 1, -0.5, 0.5, 0.5,
0.1120703, -4.281806, -9.138252, 1, 1.5, 0.5, 0.5,
0.1120703, -4.281806, -9.138252, 0, 1.5, 0.5, 0.5
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
-4.212348, 0.07237077, -9.138252, 0, -0.5, 0.5, 0.5,
-4.212348, 0.07237077, -9.138252, 1, -0.5, 0.5, 0.5,
-4.212348, 0.07237077, -9.138252, 1, 1.5, 0.5, 0.5,
-4.212348, 0.07237077, -9.138252, 0, 1.5, 0.5, 0.5
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
-4.212348, -4.281806, -1.004655, 0, -0.5, 0.5, 0.5,
-4.212348, -4.281806, -1.004655, 1, -0.5, 0.5, 0.5,
-4.212348, -4.281806, -1.004655, 1, 1.5, 0.5, 0.5,
-4.212348, -4.281806, -1.004655, 0, 1.5, 0.5, 0.5
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
-3, -3.276996, -7.261268,
3, -3.276996, -7.261268,
-3, -3.276996, -7.261268,
-3, -3.444465, -7.574099,
-2, -3.276996, -7.261268,
-2, -3.444465, -7.574099,
-1, -3.276996, -7.261268,
-1, -3.444465, -7.574099,
0, -3.276996, -7.261268,
0, -3.444465, -7.574099,
1, -3.276996, -7.261268,
1, -3.444465, -7.574099,
2, -3.276996, -7.261268,
2, -3.444465, -7.574099,
3, -3.276996, -7.261268,
3, -3.444465, -7.574099
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
-3, -3.779401, -8.19976, 0, -0.5, 0.5, 0.5,
-3, -3.779401, -8.19976, 1, -0.5, 0.5, 0.5,
-3, -3.779401, -8.19976, 1, 1.5, 0.5, 0.5,
-3, -3.779401, -8.19976, 0, 1.5, 0.5, 0.5,
-2, -3.779401, -8.19976, 0, -0.5, 0.5, 0.5,
-2, -3.779401, -8.19976, 1, -0.5, 0.5, 0.5,
-2, -3.779401, -8.19976, 1, 1.5, 0.5, 0.5,
-2, -3.779401, -8.19976, 0, 1.5, 0.5, 0.5,
-1, -3.779401, -8.19976, 0, -0.5, 0.5, 0.5,
-1, -3.779401, -8.19976, 1, -0.5, 0.5, 0.5,
-1, -3.779401, -8.19976, 1, 1.5, 0.5, 0.5,
-1, -3.779401, -8.19976, 0, 1.5, 0.5, 0.5,
0, -3.779401, -8.19976, 0, -0.5, 0.5, 0.5,
0, -3.779401, -8.19976, 1, -0.5, 0.5, 0.5,
0, -3.779401, -8.19976, 1, 1.5, 0.5, 0.5,
0, -3.779401, -8.19976, 0, 1.5, 0.5, 0.5,
1, -3.779401, -8.19976, 0, -0.5, 0.5, 0.5,
1, -3.779401, -8.19976, 1, -0.5, 0.5, 0.5,
1, -3.779401, -8.19976, 1, 1.5, 0.5, 0.5,
1, -3.779401, -8.19976, 0, 1.5, 0.5, 0.5,
2, -3.779401, -8.19976, 0, -0.5, 0.5, 0.5,
2, -3.779401, -8.19976, 1, -0.5, 0.5, 0.5,
2, -3.779401, -8.19976, 1, 1.5, 0.5, 0.5,
2, -3.779401, -8.19976, 0, 1.5, 0.5, 0.5,
3, -3.779401, -8.19976, 0, -0.5, 0.5, 0.5,
3, -3.779401, -8.19976, 1, -0.5, 0.5, 0.5,
3, -3.779401, -8.19976, 1, 1.5, 0.5, 0.5,
3, -3.779401, -8.19976, 0, 1.5, 0.5, 0.5
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
-3.214406, -3, -7.261268,
-3.214406, 3, -7.261268,
-3.214406, -3, -7.261268,
-3.380729, -3, -7.574099,
-3.214406, -2, -7.261268,
-3.380729, -2, -7.574099,
-3.214406, -1, -7.261268,
-3.380729, -1, -7.574099,
-3.214406, 0, -7.261268,
-3.380729, 0, -7.574099,
-3.214406, 1, -7.261268,
-3.380729, 1, -7.574099,
-3.214406, 2, -7.261268,
-3.380729, 2, -7.574099,
-3.214406, 3, -7.261268,
-3.380729, 3, -7.574099
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
-3.713377, -3, -8.19976, 0, -0.5, 0.5, 0.5,
-3.713377, -3, -8.19976, 1, -0.5, 0.5, 0.5,
-3.713377, -3, -8.19976, 1, 1.5, 0.5, 0.5,
-3.713377, -3, -8.19976, 0, 1.5, 0.5, 0.5,
-3.713377, -2, -8.19976, 0, -0.5, 0.5, 0.5,
-3.713377, -2, -8.19976, 1, -0.5, 0.5, 0.5,
-3.713377, -2, -8.19976, 1, 1.5, 0.5, 0.5,
-3.713377, -2, -8.19976, 0, 1.5, 0.5, 0.5,
-3.713377, -1, -8.19976, 0, -0.5, 0.5, 0.5,
-3.713377, -1, -8.19976, 1, -0.5, 0.5, 0.5,
-3.713377, -1, -8.19976, 1, 1.5, 0.5, 0.5,
-3.713377, -1, -8.19976, 0, 1.5, 0.5, 0.5,
-3.713377, 0, -8.19976, 0, -0.5, 0.5, 0.5,
-3.713377, 0, -8.19976, 1, -0.5, 0.5, 0.5,
-3.713377, 0, -8.19976, 1, 1.5, 0.5, 0.5,
-3.713377, 0, -8.19976, 0, 1.5, 0.5, 0.5,
-3.713377, 1, -8.19976, 0, -0.5, 0.5, 0.5,
-3.713377, 1, -8.19976, 1, -0.5, 0.5, 0.5,
-3.713377, 1, -8.19976, 1, 1.5, 0.5, 0.5,
-3.713377, 1, -8.19976, 0, 1.5, 0.5, 0.5,
-3.713377, 2, -8.19976, 0, -0.5, 0.5, 0.5,
-3.713377, 2, -8.19976, 1, -0.5, 0.5, 0.5,
-3.713377, 2, -8.19976, 1, 1.5, 0.5, 0.5,
-3.713377, 2, -8.19976, 0, 1.5, 0.5, 0.5,
-3.713377, 3, -8.19976, 0, -0.5, 0.5, 0.5,
-3.713377, 3, -8.19976, 1, -0.5, 0.5, 0.5,
-3.713377, 3, -8.19976, 1, 1.5, 0.5, 0.5,
-3.713377, 3, -8.19976, 0, 1.5, 0.5, 0.5
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
-3.214406, -3.276996, -6,
-3.214406, -3.276996, 4,
-3.214406, -3.276996, -6,
-3.380729, -3.444465, -6,
-3.214406, -3.276996, -4,
-3.380729, -3.444465, -4,
-3.214406, -3.276996, -2,
-3.380729, -3.444465, -2,
-3.214406, -3.276996, 0,
-3.380729, -3.444465, 0,
-3.214406, -3.276996, 2,
-3.380729, -3.444465, 2,
-3.214406, -3.276996, 4,
-3.380729, -3.444465, 4
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
-3.713377, -3.779401, -6, 0, -0.5, 0.5, 0.5,
-3.713377, -3.779401, -6, 1, -0.5, 0.5, 0.5,
-3.713377, -3.779401, -6, 1, 1.5, 0.5, 0.5,
-3.713377, -3.779401, -6, 0, 1.5, 0.5, 0.5,
-3.713377, -3.779401, -4, 0, -0.5, 0.5, 0.5,
-3.713377, -3.779401, -4, 1, -0.5, 0.5, 0.5,
-3.713377, -3.779401, -4, 1, 1.5, 0.5, 0.5,
-3.713377, -3.779401, -4, 0, 1.5, 0.5, 0.5,
-3.713377, -3.779401, -2, 0, -0.5, 0.5, 0.5,
-3.713377, -3.779401, -2, 1, -0.5, 0.5, 0.5,
-3.713377, -3.779401, -2, 1, 1.5, 0.5, 0.5,
-3.713377, -3.779401, -2, 0, 1.5, 0.5, 0.5,
-3.713377, -3.779401, 0, 0, -0.5, 0.5, 0.5,
-3.713377, -3.779401, 0, 1, -0.5, 0.5, 0.5,
-3.713377, -3.779401, 0, 1, 1.5, 0.5, 0.5,
-3.713377, -3.779401, 0, 0, 1.5, 0.5, 0.5,
-3.713377, -3.779401, 2, 0, -0.5, 0.5, 0.5,
-3.713377, -3.779401, 2, 1, -0.5, 0.5, 0.5,
-3.713377, -3.779401, 2, 1, 1.5, 0.5, 0.5,
-3.713377, -3.779401, 2, 0, 1.5, 0.5, 0.5,
-3.713377, -3.779401, 4, 0, -0.5, 0.5, 0.5,
-3.713377, -3.779401, 4, 1, -0.5, 0.5, 0.5,
-3.713377, -3.779401, 4, 1, 1.5, 0.5, 0.5,
-3.713377, -3.779401, 4, 0, 1.5, 0.5, 0.5
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
-3.214406, -3.276996, -7.261268,
-3.214406, 3.421738, -7.261268,
-3.214406, -3.276996, 5.251959,
-3.214406, 3.421738, 5.251959,
-3.214406, -3.276996, -7.261268,
-3.214406, -3.276996, 5.251959,
-3.214406, 3.421738, -7.261268,
-3.214406, 3.421738, 5.251959,
-3.214406, -3.276996, -7.261268,
3.438546, -3.276996, -7.261268,
-3.214406, -3.276996, 5.251959,
3.438546, -3.276996, 5.251959,
-3.214406, 3.421738, -7.261268,
3.438546, 3.421738, -7.261268,
-3.214406, 3.421738, 5.251959,
3.438546, 3.421738, 5.251959,
3.438546, -3.276996, -7.261268,
3.438546, 3.421738, -7.261268,
3.438546, -3.276996, 5.251959,
3.438546, 3.421738, 5.251959,
3.438546, -3.276996, -7.261268,
3.438546, -3.276996, 5.251959,
3.438546, 3.421738, -7.261268,
3.438546, 3.421738, 5.251959
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
var radius = 8.370316;
var distance = 37.24048;
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
mvMatrix.translate( -0.1120703, -0.07237077, 1.004655 );
mvMatrix.scale( 1.360321, 1.351024, 0.7232467 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.24048);
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
phenylmethylcarbamat<-read.table("phenylmethylcarbamat.xyz", skip=1)
```

```
## Error in read.table("phenylmethylcarbamat.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-phenylmethylcarbamat$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenylmethylcarbamat' not found
```

```r
y<-phenylmethylcarbamat$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenylmethylcarbamat' not found
```

```r
z<-phenylmethylcarbamat$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenylmethylcarbamat' not found
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
-3.117518, -0.2677464, -0.09955807, 0, 0, 1, 1, 1,
-3.061028, -0.4297552, -1.574873, 1, 0, 0, 1, 1,
-2.940288, 1.077674, -1.351109, 1, 0, 0, 1, 1,
-2.717765, 1.144169, -1.150507, 1, 0, 0, 1, 1,
-2.665894, -0.5631689, -1.92231, 1, 0, 0, 1, 1,
-2.491567, 1.197585, -1.49338, 1, 0, 0, 1, 1,
-2.456988, -0.7528902, -3.013876, 0, 0, 0, 1, 1,
-2.447656, 1.284292, -2.094715, 0, 0, 0, 1, 1,
-2.41995, 1.312857, -1.282492, 0, 0, 0, 1, 1,
-2.326602, -2.559558, -1.762951, 0, 0, 0, 1, 1,
-2.179814, 0.9481261, -0.8501476, 0, 0, 0, 1, 1,
-2.075467, -0.6655885, -1.343603, 0, 0, 0, 1, 1,
-2.062251, 0.5461817, -1.459864, 0, 0, 0, 1, 1,
-2.054673, 0.757039, -0.9785112, 1, 1, 1, 1, 1,
-2.002278, 0.3218025, -1.234132, 1, 1, 1, 1, 1,
-1.985347, 1.813328, -1.36863, 1, 1, 1, 1, 1,
-1.976423, 1.132123, 0.7595108, 1, 1, 1, 1, 1,
-1.968347, 1.021574, -0.9856624, 1, 1, 1, 1, 1,
-1.931095, 1.265151, -0.02872558, 1, 1, 1, 1, 1,
-1.911467, 0.6411793, -2.034174, 1, 1, 1, 1, 1,
-1.88389, -0.7362795, -3.042989, 1, 1, 1, 1, 1,
-1.857313, -0.5019849, -0.7880381, 1, 1, 1, 1, 1,
-1.846519, 0.864835, -2.441566, 1, 1, 1, 1, 1,
-1.813226, 1.011305, -0.6642054, 1, 1, 1, 1, 1,
-1.810524, -1.062762, -1.704294, 1, 1, 1, 1, 1,
-1.782794, 0.04170823, -3.404927, 1, 1, 1, 1, 1,
-1.781377, -0.1022123, -1.705679, 1, 1, 1, 1, 1,
-1.775836, -0.6155155, -0.7008428, 1, 1, 1, 1, 1,
-1.771596, 1.378377, -0.05423597, 0, 0, 1, 1, 1,
-1.766097, 1.743206, -0.9336882, 1, 0, 0, 1, 1,
-1.761683, -1.617651, -2.952229, 1, 0, 0, 1, 1,
-1.76116, 1.522243, -0.7482082, 1, 0, 0, 1, 1,
-1.739068, -0.1596074, -1.940952, 1, 0, 0, 1, 1,
-1.724908, -2.527583, -4.405855, 1, 0, 0, 1, 1,
-1.719046, 0.639777, -0.3175567, 0, 0, 0, 1, 1,
-1.712517, -1.451157, -4.17974, 0, 0, 0, 1, 1,
-1.70627, -0.201873, -0.6946774, 0, 0, 0, 1, 1,
-1.704416, -1.884598, -2.723512, 0, 0, 0, 1, 1,
-1.683063, 2.500463, 0.1021022, 0, 0, 0, 1, 1,
-1.682267, 0.2098081, -1.53868, 0, 0, 0, 1, 1,
-1.673166, 0.6235924, 0.4809224, 0, 0, 0, 1, 1,
-1.66992, 1.746897, -2.093843, 1, 1, 1, 1, 1,
-1.647176, 0.2217599, -1.770301, 1, 1, 1, 1, 1,
-1.643919, -0.03974992, -2.076412, 1, 1, 1, 1, 1,
-1.630105, 1.392444, -1.141976, 1, 1, 1, 1, 1,
-1.621462, 1.132939, -0.1745056, 1, 1, 1, 1, 1,
-1.605433, 0.3490522, -1.320356, 1, 1, 1, 1, 1,
-1.586871, 0.2117103, -2.103263, 1, 1, 1, 1, 1,
-1.584257, 0.3111263, -3.155724, 1, 1, 1, 1, 1,
-1.57654, 0.8863301, -0.7194127, 1, 1, 1, 1, 1,
-1.574276, 0.450027, -0.9615996, 1, 1, 1, 1, 1,
-1.572049, -0.78149, -1.455557, 1, 1, 1, 1, 1,
-1.557967, -0.4158649, -0.8178899, 1, 1, 1, 1, 1,
-1.549366, -0.591846, -2.407537, 1, 1, 1, 1, 1,
-1.529189, -0.2418503, -3.521553, 1, 1, 1, 1, 1,
-1.519756, -1.0646, -2.324443, 1, 1, 1, 1, 1,
-1.499984, -1.37123, -2.210353, 0, 0, 1, 1, 1,
-1.499634, -0.586983, -3.091558, 1, 0, 0, 1, 1,
-1.498647, 1.382393, -2.105277, 1, 0, 0, 1, 1,
-1.492544, -0.4813417, -0.5930794, 1, 0, 0, 1, 1,
-1.487983, 0.6361042, -2.694727, 1, 0, 0, 1, 1,
-1.475797, -0.6066327, -2.307472, 1, 0, 0, 1, 1,
-1.469672, -0.08025782, -1.596975, 0, 0, 0, 1, 1,
-1.462277, -0.1879934, -1.641173, 0, 0, 0, 1, 1,
-1.459819, -0.8673546, -2.112852, 0, 0, 0, 1, 1,
-1.456837, -0.1659583, -2.468026, 0, 0, 0, 1, 1,
-1.448442, 0.1120314, -1.600883, 0, 0, 0, 1, 1,
-1.440417, -0.6993929, -1.878308, 0, 0, 0, 1, 1,
-1.43881, 1.112731, -2.606023, 0, 0, 0, 1, 1,
-1.438086, 0.004343587, -1.477025, 1, 1, 1, 1, 1,
-1.437481, 0.9248145, -0.866879, 1, 1, 1, 1, 1,
-1.431394, 0.7381776, -2.130036, 1, 1, 1, 1, 1,
-1.424928, -0.5148836, -0.06957948, 1, 1, 1, 1, 1,
-1.423311, 2.495117, -1.197045, 1, 1, 1, 1, 1,
-1.418008, 0.7742642, 0.8496826, 1, 1, 1, 1, 1,
-1.409402, -0.4187973, -1.957879, 1, 1, 1, 1, 1,
-1.408646, 0.6095328, -1.361488, 1, 1, 1, 1, 1,
-1.406094, 0.4719639, -0.1372736, 1, 1, 1, 1, 1,
-1.394734, -1.694473, -2.072694, 1, 1, 1, 1, 1,
-1.387505, 0.971875, -2.731314, 1, 1, 1, 1, 1,
-1.372663, -1.69733, -0.8175035, 1, 1, 1, 1, 1,
-1.364924, -1.035714, -0.8000491, 1, 1, 1, 1, 1,
-1.331825, -1.87634, -4.147228, 1, 1, 1, 1, 1,
-1.325975, 0.07507572, -2.03754, 1, 1, 1, 1, 1,
-1.302969, -0.8069689, -1.832552, 0, 0, 1, 1, 1,
-1.297352, 0.06659248, -2.025314, 1, 0, 0, 1, 1,
-1.295577, -0.7504056, -3.477848, 1, 0, 0, 1, 1,
-1.284149, 1.142662, 0.2379004, 1, 0, 0, 1, 1,
-1.277223, 1.312851, -0.2527954, 1, 0, 0, 1, 1,
-1.276991, 1.11498, -1.382952, 1, 0, 0, 1, 1,
-1.273294, -0.004059026, -2.004173, 0, 0, 0, 1, 1,
-1.261853, 0.5184912, -1.913702, 0, 0, 0, 1, 1,
-1.258996, -0.535862, -2.51625, 0, 0, 0, 1, 1,
-1.256829, -0.2552042, -1.281765, 0, 0, 0, 1, 1,
-1.249411, -0.1426293, -1.39817, 0, 0, 0, 1, 1,
-1.244098, -0.6781443, -1.462353, 0, 0, 0, 1, 1,
-1.232774, -1.428534, -1.056687, 0, 0, 0, 1, 1,
-1.2237, -0.4102675, -1.069214, 1, 1, 1, 1, 1,
-1.221354, 0.28723, -1.29832, 1, 1, 1, 1, 1,
-1.21904, -0.3190577, -3.333651, 1, 1, 1, 1, 1,
-1.213115, 0.7645335, -1.483819, 1, 1, 1, 1, 1,
-1.212141, 0.09434508, -0.9776669, 1, 1, 1, 1, 1,
-1.207099, -0.1763447, -1.691541, 1, 1, 1, 1, 1,
-1.204902, -0.2366663, -1.589209, 1, 1, 1, 1, 1,
-1.20085, -0.7839131, -0.7024806, 1, 1, 1, 1, 1,
-1.188191, -0.9363109, -2.526375, 1, 1, 1, 1, 1,
-1.186546, 1.345083, -1.081424, 1, 1, 1, 1, 1,
-1.175585, -1.840526, -2.55921, 1, 1, 1, 1, 1,
-1.171505, -0.6566063, 0.5278523, 1, 1, 1, 1, 1,
-1.169158, 0.2204027, -0.7432064, 1, 1, 1, 1, 1,
-1.166678, -0.6130086, -1.579309, 1, 1, 1, 1, 1,
-1.163383, 1.018493, 0.7237928, 1, 1, 1, 1, 1,
-1.161457, -0.5676042, 0.1727452, 0, 0, 1, 1, 1,
-1.161022, -0.2652133, -2.498706, 1, 0, 0, 1, 1,
-1.156121, 0.3860815, -2.23227, 1, 0, 0, 1, 1,
-1.153354, 0.6559876, -1.263941, 1, 0, 0, 1, 1,
-1.153239, 0.4593046, -0.7300257, 1, 0, 0, 1, 1,
-1.152272, 0.4590821, -0.6742565, 1, 0, 0, 1, 1,
-1.151201, -0.2624457, -1.394299, 0, 0, 0, 1, 1,
-1.149084, 1.267973, 0.5266446, 0, 0, 0, 1, 1,
-1.147957, -1.585967, -2.45358, 0, 0, 0, 1, 1,
-1.135033, -1.489264, -2.537949, 0, 0, 0, 1, 1,
-1.131152, -0.1111815, -1.713361, 0, 0, 0, 1, 1,
-1.120164, -0.06627292, -1.714854, 0, 0, 0, 1, 1,
-1.114916, 0.6338605, -2.155974, 0, 0, 0, 1, 1,
-1.113922, 1.955992, -0.03483144, 1, 1, 1, 1, 1,
-1.11352, 2.492653, 0.129033, 1, 1, 1, 1, 1,
-1.11191, 1.714398, 0.07631946, 1, 1, 1, 1, 1,
-1.109105, -1.154401, -1.349941, 1, 1, 1, 1, 1,
-1.106521, -1.412686, -2.158262, 1, 1, 1, 1, 1,
-1.104958, -0.01336772, -1.208223, 1, 1, 1, 1, 1,
-1.103021, -0.4593965, -2.543619, 1, 1, 1, 1, 1,
-1.09839, -0.4390303, -1.226435, 1, 1, 1, 1, 1,
-1.095277, -0.7765141, -2.451297, 1, 1, 1, 1, 1,
-1.093906, 0.3420132, -0.6609592, 1, 1, 1, 1, 1,
-1.092203, -1.643184, -1.583738, 1, 1, 1, 1, 1,
-1.091142, 0.02641607, -0.7587851, 1, 1, 1, 1, 1,
-1.083681, 1.462928, -2.215064, 1, 1, 1, 1, 1,
-1.082542, -1.281338, -2.817265, 1, 1, 1, 1, 1,
-1.076011, 1.553564, -1.095882, 1, 1, 1, 1, 1,
-1.075161, -0.342284, -2.554536, 0, 0, 1, 1, 1,
-1.070766, 1.127223, -2.324391, 1, 0, 0, 1, 1,
-1.062534, 0.3314058, -1.785308, 1, 0, 0, 1, 1,
-1.060731, 0.2958436, -1.591053, 1, 0, 0, 1, 1,
-1.054723, -0.5916407, -3.380095, 1, 0, 0, 1, 1,
-1.052015, -1.002015, -2.164976, 1, 0, 0, 1, 1,
-1.044084, 0.2803321, -0.8591801, 0, 0, 0, 1, 1,
-1.03984, -1.847715, -2.168467, 0, 0, 0, 1, 1,
-1.039039, 0.3585514, -3.225134, 0, 0, 0, 1, 1,
-1.029006, -0.8068543, -3.06776, 0, 0, 0, 1, 1,
-1.026111, -1.613335, -2.341536, 0, 0, 0, 1, 1,
-1.02552, 0.6784478, -1.87181, 0, 0, 0, 1, 1,
-1.02389, -0.3507711, -2.24712, 0, 0, 0, 1, 1,
-1.022595, 2.343316, -0.06811816, 1, 1, 1, 1, 1,
-1.021691, 0.005988806, -1.03002, 1, 1, 1, 1, 1,
-1.018249, -0.9520163, -4.971709, 1, 1, 1, 1, 1,
-1.014148, -0.06196744, 0.03420145, 1, 1, 1, 1, 1,
-1.013332, -0.6318352, -2.274444, 1, 1, 1, 1, 1,
-1.012543, -0.2798197, -2.84611, 1, 1, 1, 1, 1,
-1.011291, 0.4243435, 0.02312327, 1, 1, 1, 1, 1,
-1.010461, -1.655788, -3.320776, 1, 1, 1, 1, 1,
-1.009756, 1.611671, -0.2545395, 1, 1, 1, 1, 1,
-1.007674, -0.7202904, -2.292808, 1, 1, 1, 1, 1,
-1.00547, -1.077616, -2.192627, 1, 1, 1, 1, 1,
-0.9950604, -0.3936333, -0.6915068, 1, 1, 1, 1, 1,
-0.9944906, 0.4038989, -0.4159747, 1, 1, 1, 1, 1,
-0.9926468, 0.7181132, 0.9156213, 1, 1, 1, 1, 1,
-0.985944, 1.18357, -0.1386793, 1, 1, 1, 1, 1,
-0.9840512, -0.1494552, -1.594791, 0, 0, 1, 1, 1,
-0.9837013, 1.156835, -1.022743, 1, 0, 0, 1, 1,
-0.9836926, 0.4950574, -0.8227186, 1, 0, 0, 1, 1,
-0.9791828, 0.4995156, -1.13336, 1, 0, 0, 1, 1,
-0.9745581, 1.082317, -0.1958156, 1, 0, 0, 1, 1,
-0.9721639, 0.002965248, -0.9036939, 1, 0, 0, 1, 1,
-0.9701047, 0.3800519, -2.90817, 0, 0, 0, 1, 1,
-0.9681841, 1.9584, -0.9894465, 0, 0, 0, 1, 1,
-0.9650449, -0.02833347, -1.161829, 0, 0, 0, 1, 1,
-0.964405, 1.393105, -1.64323, 0, 0, 0, 1, 1,
-0.9588446, -1.063129, -2.183085, 0, 0, 0, 1, 1,
-0.9555926, -1.647405, -2.419819, 0, 0, 0, 1, 1,
-0.947307, 0.782847, -0.7008547, 0, 0, 0, 1, 1,
-0.9467027, 0.4125786, -1.098072, 1, 1, 1, 1, 1,
-0.944968, -0.5460424, -1.244922, 1, 1, 1, 1, 1,
-0.9391508, -0.5493832, -0.6740743, 1, 1, 1, 1, 1,
-0.9346147, 0.08543947, -2.102853, 1, 1, 1, 1, 1,
-0.9327473, -0.09014988, 0.008339222, 1, 1, 1, 1, 1,
-0.9316518, 1.725422, 0.9373422, 1, 1, 1, 1, 1,
-0.9278834, 0.3989031, -2.223635, 1, 1, 1, 1, 1,
-0.9266422, 0.7300544, -1.392971, 1, 1, 1, 1, 1,
-0.9205688, -0.5689412, -2.066334, 1, 1, 1, 1, 1,
-0.9094538, -1.543446, -3.152606, 1, 1, 1, 1, 1,
-0.9078785, -1.841395, -2.46609, 1, 1, 1, 1, 1,
-0.9077122, -0.07723505, -2.395827, 1, 1, 1, 1, 1,
-0.9010767, 0.0296677, -2.202849, 1, 1, 1, 1, 1,
-0.9010536, 0.4592163, -1.253682, 1, 1, 1, 1, 1,
-0.9003996, -0.4310486, -2.1605, 1, 1, 1, 1, 1,
-0.8876786, -1.013372, -3.627476, 0, 0, 1, 1, 1,
-0.8871497, -0.1929771, -1.4737, 1, 0, 0, 1, 1,
-0.8821425, -0.3565579, -1.742381, 1, 0, 0, 1, 1,
-0.8810045, 0.3971279, 1.087423, 1, 0, 0, 1, 1,
-0.8790158, -0.5063804, -1.704633, 1, 0, 0, 1, 1,
-0.8780937, 0.233648, -0.8817228, 1, 0, 0, 1, 1,
-0.8741022, -0.1260589, -3.434448, 0, 0, 0, 1, 1,
-0.8682971, 0.8668707, -0.9717014, 0, 0, 0, 1, 1,
-0.8663111, -0.1492439, -0.105378, 0, 0, 0, 1, 1,
-0.8657796, 0.6588975, -0.4018387, 0, 0, 0, 1, 1,
-0.8563191, -0.06189346, -1.674472, 0, 0, 0, 1, 1,
-0.8526956, -0.01080854, -3.78277, 0, 0, 0, 1, 1,
-0.8492017, 0.5652211, -1.000242, 0, 0, 0, 1, 1,
-0.8446355, 0.1244031, -3.374301, 1, 1, 1, 1, 1,
-0.8419474, -1.301105, -2.312377, 1, 1, 1, 1, 1,
-0.8407296, 0.6988766, -0.8958637, 1, 1, 1, 1, 1,
-0.840411, 1.654512, -0.3587586, 1, 1, 1, 1, 1,
-0.8350534, 0.0641962, -4.372044, 1, 1, 1, 1, 1,
-0.8347372, -0.4418203, -2.164856, 1, 1, 1, 1, 1,
-0.8330449, -0.3076821, -3.711096, 1, 1, 1, 1, 1,
-0.8321357, -0.6513752, -2.733974, 1, 1, 1, 1, 1,
-0.8231918, 1.368643, -0.8372548, 1, 1, 1, 1, 1,
-0.8156047, -0.8998837, -3.591981, 1, 1, 1, 1, 1,
-0.802498, -0.7782375, -1.129098, 1, 1, 1, 1, 1,
-0.7915491, -1.19861, -3.14871, 1, 1, 1, 1, 1,
-0.789353, -0.4386772, -1.730754, 1, 1, 1, 1, 1,
-0.7872034, -2.106996, -3.216341, 1, 1, 1, 1, 1,
-0.7840636, -0.8131163, -1.604789, 1, 1, 1, 1, 1,
-0.7812661, 1.125329, -0.6837108, 0, 0, 1, 1, 1,
-0.7782151, -0.3888802, -0.05937428, 1, 0, 0, 1, 1,
-0.7765634, 1.480881, -1.477608, 1, 0, 0, 1, 1,
-0.7746458, -0.2243169, -0.8792381, 1, 0, 0, 1, 1,
-0.7740418, -0.02251334, -0.6730317, 1, 0, 0, 1, 1,
-0.7693393, 0.8461841, -1.933075, 1, 0, 0, 1, 1,
-0.7692235, -0.2323066, -2.143756, 0, 0, 0, 1, 1,
-0.7683225, -1.29746, -2.24514, 0, 0, 0, 1, 1,
-0.7675053, -0.432803, -1.181818, 0, 0, 0, 1, 1,
-0.7635074, -0.8996527, -3.074642, 0, 0, 0, 1, 1,
-0.7609676, 0.4627256, -0.7044989, 0, 0, 0, 1, 1,
-0.7608626, -0.8553013, -3.205515, 0, 0, 0, 1, 1,
-0.7547743, -1.276407, -2.025649, 0, 0, 0, 1, 1,
-0.7521054, -0.2627213, -2.876182, 1, 1, 1, 1, 1,
-0.7465261, -0.9119844, -2.737844, 1, 1, 1, 1, 1,
-0.7407596, 1.431357, -2.455657, 1, 1, 1, 1, 1,
-0.7325817, 0.726552, -0.6223843, 1, 1, 1, 1, 1,
-0.7306947, -0.2878556, -2.318921, 1, 1, 1, 1, 1,
-0.7276567, -1.796273, -3.229995, 1, 1, 1, 1, 1,
-0.7254719, 0.2334486, -0.5411294, 1, 1, 1, 1, 1,
-0.7228675, 1.651318, -0.1322236, 1, 1, 1, 1, 1,
-0.7192196, 0.7850085, 2.396487, 1, 1, 1, 1, 1,
-0.7144108, -2.828002, -3.959318, 1, 1, 1, 1, 1,
-0.7102354, -0.1817724, -2.621067, 1, 1, 1, 1, 1,
-0.7086182, -1.054817, -1.545522, 1, 1, 1, 1, 1,
-0.7081801, 0.8004896, -0.9125853, 1, 1, 1, 1, 1,
-0.7073574, 1.950557, 0.2232553, 1, 1, 1, 1, 1,
-0.6948096, -1.326078, -3.475227, 1, 1, 1, 1, 1,
-0.6931038, -0.1635701, -0.5493652, 0, 0, 1, 1, 1,
-0.6928035, -0.4514801, -2.177123, 1, 0, 0, 1, 1,
-0.6860949, 0.9077202, 0.2881792, 1, 0, 0, 1, 1,
-0.6834016, 0.9925358, -2.423767, 1, 0, 0, 1, 1,
-0.6813287, 0.5576045, -1.632148, 1, 0, 0, 1, 1,
-0.6746891, -0.3554292, -0.9921672, 1, 0, 0, 1, 1,
-0.6732218, -0.5512642, -0.9896622, 0, 0, 0, 1, 1,
-0.6632373, 0.6626906, -0.3942557, 0, 0, 0, 1, 1,
-0.662745, 0.5239801, -1.509068, 0, 0, 0, 1, 1,
-0.6624855, -0.383225, -2.110153, 0, 0, 0, 1, 1,
-0.6616495, -0.4699874, -2.914472, 0, 0, 0, 1, 1,
-0.6599184, 0.7765009, -0.4431516, 0, 0, 0, 1, 1,
-0.6574306, -0.1996152, -3.343556, 0, 0, 0, 1, 1,
-0.649344, -1.497071, -4.935372, 1, 1, 1, 1, 1,
-0.6419552, 0.3566151, -0.8489217, 1, 1, 1, 1, 1,
-0.641685, -0.8338495, -4.160321, 1, 1, 1, 1, 1,
-0.6357362, -0.3864479, -3.118397, 1, 1, 1, 1, 1,
-0.6333393, 0.4188579, -1.45595, 1, 1, 1, 1, 1,
-0.6305758, 0.9456111, 0.1299958, 1, 1, 1, 1, 1,
-0.6295543, 1.545927, -1.043893, 1, 1, 1, 1, 1,
-0.6288733, 0.4924978, -0.6984734, 1, 1, 1, 1, 1,
-0.6286628, 1.279552, -0.1041763, 1, 1, 1, 1, 1,
-0.6268305, 1.456373, -0.5373257, 1, 1, 1, 1, 1,
-0.6267904, -1.617131, -3.132499, 1, 1, 1, 1, 1,
-0.6267769, 0.5083051, -0.04810977, 1, 1, 1, 1, 1,
-0.6248716, -0.417564, -1.760663, 1, 1, 1, 1, 1,
-0.6219968, -0.001728032, -1.24357, 1, 1, 1, 1, 1,
-0.6150109, -0.8521057, -2.791473, 1, 1, 1, 1, 1,
-0.6130602, -0.8768141, -3.817304, 0, 0, 1, 1, 1,
-0.6130008, 1.826853, -0.02324327, 1, 0, 0, 1, 1,
-0.6128517, -0.4808864, -3.629256, 1, 0, 0, 1, 1,
-0.6125943, 0.7559443, 0.2492679, 1, 0, 0, 1, 1,
-0.611136, 0.4456642, 0.9980927, 1, 0, 0, 1, 1,
-0.608132, 1.655963, -1.995796, 1, 0, 0, 1, 1,
-0.606677, 0.02005447, -3.134413, 0, 0, 0, 1, 1,
-0.6064039, -1.092776, -2.289149, 0, 0, 0, 1, 1,
-0.6027914, 0.9824426, 0.5669671, 0, 0, 0, 1, 1,
-0.5983876, 0.25153, -1.805824, 0, 0, 0, 1, 1,
-0.5918292, -1.882608, -2.024198, 0, 0, 0, 1, 1,
-0.5917066, 1.627911, -1.323392, 0, 0, 0, 1, 1,
-0.5909714, -0.9595653, -2.87302, 0, 0, 0, 1, 1,
-0.5900632, 0.3986862, 1.378869, 1, 1, 1, 1, 1,
-0.5840028, 1.340265, -0.5156812, 1, 1, 1, 1, 1,
-0.5826165, -0.3325625, -2.928068, 1, 1, 1, 1, 1,
-0.5792356, 2.70109, 0.2562418, 1, 1, 1, 1, 1,
-0.5743108, -1.948883, -4.166441, 1, 1, 1, 1, 1,
-0.5737744, -0.726153, -2.430683, 1, 1, 1, 1, 1,
-0.5734078, 0.4313614, -0.6649346, 1, 1, 1, 1, 1,
-0.570709, 1.540402, -0.8916366, 1, 1, 1, 1, 1,
-0.5676611, 1.823643, -1.229732, 1, 1, 1, 1, 1,
-0.5668272, 0.7056254, 0.825083, 1, 1, 1, 1, 1,
-0.5661799, -0.4587166, -3.421359, 1, 1, 1, 1, 1,
-0.5628259, -0.2744985, -1.235346, 1, 1, 1, 1, 1,
-0.5604563, -0.3395436, -2.850338, 1, 1, 1, 1, 1,
-0.5585444, 0.7615732, 0.08783115, 1, 1, 1, 1, 1,
-0.5583729, 0.1687533, -2.529597, 1, 1, 1, 1, 1,
-0.552642, 0.6655897, 0.03112602, 0, 0, 1, 1, 1,
-0.5519217, -0.9449888, -0.8531701, 1, 0, 0, 1, 1,
-0.5447184, 1.737686, -0.2757471, 1, 0, 0, 1, 1,
-0.5438846, -1.182281, -2.667646, 1, 0, 0, 1, 1,
-0.5327942, 0.5305189, -1.030171, 1, 0, 0, 1, 1,
-0.5291269, -0.703544, -7.079037, 1, 0, 0, 1, 1,
-0.5281336, 0.8094079, -1.529469, 0, 0, 0, 1, 1,
-0.5255479, -0.6463149, -2.43106, 0, 0, 0, 1, 1,
-0.5241828, 2.271096, -0.6077881, 0, 0, 0, 1, 1,
-0.5220768, -1.085779, -3.876242, 0, 0, 0, 1, 1,
-0.5164183, -0.2236695, -2.134529, 0, 0, 0, 1, 1,
-0.5159963, -0.3012397, 0.1582514, 0, 0, 0, 1, 1,
-0.5157372, 0.6942189, 0.4821349, 0, 0, 0, 1, 1,
-0.5150857, -0.4524164, -2.711666, 1, 1, 1, 1, 1,
-0.5135828, 0.2494417, -1.41613, 1, 1, 1, 1, 1,
-0.5090646, 1.196193, -2.32541, 1, 1, 1, 1, 1,
-0.5086942, 0.1994574, -1.328432, 1, 1, 1, 1, 1,
-0.5026818, -1.349948, -3.940741, 1, 1, 1, 1, 1,
-0.5024145, 1.483709, -1.629367, 1, 1, 1, 1, 1,
-0.4992979, 1.200881, 0.1021956, 1, 1, 1, 1, 1,
-0.4919782, -0.2641194, -2.57464, 1, 1, 1, 1, 1,
-0.4887568, 1.442186, -1.813951, 1, 1, 1, 1, 1,
-0.4838637, 1.229792, -0.5681029, 1, 1, 1, 1, 1,
-0.4822619, -0.1408065, -1.091933, 1, 1, 1, 1, 1,
-0.4806053, 0.6769907, 0.18173, 1, 1, 1, 1, 1,
-0.4772167, 0.009708473, -2.036405, 1, 1, 1, 1, 1,
-0.4730765, 0.400053, 1.037075, 1, 1, 1, 1, 1,
-0.4682657, -0.241241, -1.607983, 1, 1, 1, 1, 1,
-0.4646395, 0.2537985, -2.785205, 0, 0, 1, 1, 1,
-0.4635687, -0.6266825, -1.951493, 1, 0, 0, 1, 1,
-0.4627437, 0.1289638, 0.4962766, 1, 0, 0, 1, 1,
-0.4611742, -1.194332, -3.350569, 1, 0, 0, 1, 1,
-0.4561055, 0.6591064, -1.975037, 1, 0, 0, 1, 1,
-0.4531979, 1.139369, 0.6509332, 1, 0, 0, 1, 1,
-0.4465007, -0.5751886, 0.2666513, 0, 0, 0, 1, 1,
-0.4429538, 1.069834, 0.6441992, 0, 0, 0, 1, 1,
-0.4393949, 0.3465397, 1.139443, 0, 0, 0, 1, 1,
-0.439346, 1.220796, -0.06967629, 0, 0, 0, 1, 1,
-0.4389876, -0.9688658, -3.666005, 0, 0, 0, 1, 1,
-0.4359728, 0.7444926, -0.7125772, 0, 0, 0, 1, 1,
-0.4316721, -1.16431, -4.279946, 0, 0, 0, 1, 1,
-0.4311523, -1.792665, -4.542101, 1, 1, 1, 1, 1,
-0.4261754, -2.847174, -3.278368, 1, 1, 1, 1, 1,
-0.4249719, -1.136241, -1.779468, 1, 1, 1, 1, 1,
-0.4227462, 0.7987998, -1.772728, 1, 1, 1, 1, 1,
-0.4217687, -0.9718049, -2.427076, 1, 1, 1, 1, 1,
-0.4188128, 0.5409861, -1.068869, 1, 1, 1, 1, 1,
-0.4169242, -1.233127, -2.316827, 1, 1, 1, 1, 1,
-0.4164008, 1.771134, -0.7230327, 1, 1, 1, 1, 1,
-0.4153711, 1.471749, 0.144352, 1, 1, 1, 1, 1,
-0.4152649, -0.2858601, -3.109869, 1, 1, 1, 1, 1,
-0.4131553, -0.4925868, -3.137509, 1, 1, 1, 1, 1,
-0.411134, -0.768559, -2.627296, 1, 1, 1, 1, 1,
-0.408906, -0.02917072, -2.081677, 1, 1, 1, 1, 1,
-0.405286, 1.541826, 0.261353, 1, 1, 1, 1, 1,
-0.3999558, -1.105554, -3.25037, 1, 1, 1, 1, 1,
-0.3994817, -0.1385859, -3.151809, 0, 0, 1, 1, 1,
-0.3929999, -0.9328977, -4.10205, 1, 0, 0, 1, 1,
-0.392798, 1.071196, 0.6057889, 1, 0, 0, 1, 1,
-0.3918279, -1.924343, -4.21133, 1, 0, 0, 1, 1,
-0.3861821, -1.663672, -1.905748, 1, 0, 0, 1, 1,
-0.3852745, -1.008526, -3.54403, 1, 0, 0, 1, 1,
-0.3846576, 0.05131736, -1.355548, 0, 0, 0, 1, 1,
-0.3810281, 0.6683862, -1.517981, 0, 0, 0, 1, 1,
-0.380953, 0.4723813, -0.3945892, 0, 0, 0, 1, 1,
-0.377792, 0.3564411, 0.3763344, 0, 0, 0, 1, 1,
-0.3755371, -0.3549278, -1.585163, 0, 0, 0, 1, 1,
-0.3744012, 0.3343992, -2.493341, 0, 0, 0, 1, 1,
-0.3742908, -1.223253, -2.479712, 0, 0, 0, 1, 1,
-0.3727659, 0.7733765, 0.4320514, 1, 1, 1, 1, 1,
-0.3673054, 1.140659, 0.7650036, 1, 1, 1, 1, 1,
-0.365779, 1.162388, -0.5987828, 1, 1, 1, 1, 1,
-0.3614252, 1.290182, -0.4051982, 1, 1, 1, 1, 1,
-0.3598996, -0.6615537, -1.460677, 1, 1, 1, 1, 1,
-0.3589378, -1.081679, -2.252438, 1, 1, 1, 1, 1,
-0.3571062, -0.53275, -1.466655, 1, 1, 1, 1, 1,
-0.3534971, -1.027511, -4.024551, 1, 1, 1, 1, 1,
-0.3507705, 0.1644289, 0.09996945, 1, 1, 1, 1, 1,
-0.3385946, 0.5573167, 0.2107205, 1, 1, 1, 1, 1,
-0.3383193, -0.3032539, -3.040256, 1, 1, 1, 1, 1,
-0.336292, -0.3633044, -2.314459, 1, 1, 1, 1, 1,
-0.3283598, -0.9535965, -3.828365, 1, 1, 1, 1, 1,
-0.3263297, -0.6515967, -1.982836, 1, 1, 1, 1, 1,
-0.3243794, 0.4539825, 1.026582, 1, 1, 1, 1, 1,
-0.3202629, 0.08202991, 0.3141538, 0, 0, 1, 1, 1,
-0.3201685, -1.298663, -1.946606, 1, 0, 0, 1, 1,
-0.3063908, 0.08012384, -0.5897635, 1, 0, 0, 1, 1,
-0.3055633, -0.09709508, -2.585789, 1, 0, 0, 1, 1,
-0.3044415, 0.2266983, -1.693999, 1, 0, 0, 1, 1,
-0.3022847, -0.9984813, -2.020705, 1, 0, 0, 1, 1,
-0.3020779, -1.208989, -2.220603, 0, 0, 0, 1, 1,
-0.3010836, 1.886229, 0.8933315, 0, 0, 0, 1, 1,
-0.2992002, 0.6258772, -0.6803679, 0, 0, 0, 1, 1,
-0.29641, -0.2738962, -1.944971, 0, 0, 0, 1, 1,
-0.2955954, -1.121271, -3.223769, 0, 0, 0, 1, 1,
-0.2951491, -0.6526448, -2.612784, 0, 0, 0, 1, 1,
-0.2832091, 0.8165628, -2.389945, 0, 0, 0, 1, 1,
-0.2821873, 0.5269452, -0.4620021, 1, 1, 1, 1, 1,
-0.2811049, 0.9296105, 0.4669406, 1, 1, 1, 1, 1,
-0.2802407, 1.435784, -0.7386748, 1, 1, 1, 1, 1,
-0.2785882, -0.1497367, 0.6914315, 1, 1, 1, 1, 1,
-0.2783315, 0.1176604, -2.309396, 1, 1, 1, 1, 1,
-0.275891, 0.3042779, -1.008552, 1, 1, 1, 1, 1,
-0.2732193, -0.1058838, -1.758194, 1, 1, 1, 1, 1,
-0.2661755, 1.234175, -1.155355, 1, 1, 1, 1, 1,
-0.2617437, -0.2752593, -2.144423, 1, 1, 1, 1, 1,
-0.2602251, 0.133695, 0.2601923, 1, 1, 1, 1, 1,
-0.2557776, -0.4648394, -3.527327, 1, 1, 1, 1, 1,
-0.2552817, 0.8444123, -0.2504165, 1, 1, 1, 1, 1,
-0.2519113, -0.6669793, -3.453904, 1, 1, 1, 1, 1,
-0.2518765, -0.6728065, -2.633529, 1, 1, 1, 1, 1,
-0.248969, -1.017593, -2.206073, 1, 1, 1, 1, 1,
-0.2483168, -0.6471883, -3.821811, 0, 0, 1, 1, 1,
-0.2481236, -0.8664933, -0.8145446, 1, 0, 0, 1, 1,
-0.244805, -2.120611, -2.3191, 1, 0, 0, 1, 1,
-0.243112, 0.7780843, -1.802705, 1, 0, 0, 1, 1,
-0.2399048, -0.4832312, -2.598561, 1, 0, 0, 1, 1,
-0.2277984, 0.3793839, -0.1005848, 1, 0, 0, 1, 1,
-0.2274647, -0.9176954, -2.678384, 0, 0, 0, 1, 1,
-0.2232501, 0.5284516, -1.80235, 0, 0, 0, 1, 1,
-0.2187692, 0.2215385, -0.2069033, 0, 0, 0, 1, 1,
-0.216004, -1.085392, -3.654348, 0, 0, 0, 1, 1,
-0.2147492, 0.2750826, -1.471055, 0, 0, 0, 1, 1,
-0.2069647, -0.7023306, -4.153843, 0, 0, 0, 1, 1,
-0.2045537, -0.02987976, 1.344165, 0, 0, 0, 1, 1,
-0.2036087, -0.7882888, -2.451218, 1, 1, 1, 1, 1,
-0.2010344, 1.732102, 1.016947, 1, 1, 1, 1, 1,
-0.2009164, -0.1549435, -2.435035, 1, 1, 1, 1, 1,
-0.1938663, 1.542418, 1.523942, 1, 1, 1, 1, 1,
-0.1929193, -0.8562779, -1.881921, 1, 1, 1, 1, 1,
-0.1927283, -0.8836449, -2.367232, 1, 1, 1, 1, 1,
-0.191108, -1.946992, -2.570818, 1, 1, 1, 1, 1,
-0.1905235, -0.7733803, -3.369162, 1, 1, 1, 1, 1,
-0.1904787, -0.5667034, -4.386928, 1, 1, 1, 1, 1,
-0.1894829, 0.6184326, 0.2163133, 1, 1, 1, 1, 1,
-0.1863556, 0.586969, -0.7186939, 1, 1, 1, 1, 1,
-0.1834766, -0.8757418, -1.697439, 1, 1, 1, 1, 1,
-0.1824854, 0.1827037, -1.834532, 1, 1, 1, 1, 1,
-0.1805719, -0.3599963, -3.145782, 1, 1, 1, 1, 1,
-0.1800964, 0.7858658, 0.9670199, 1, 1, 1, 1, 1,
-0.1774894, -0.5668833, -0.7800069, 0, 0, 1, 1, 1,
-0.1750674, 0.8639176, -0.7122967, 1, 0, 0, 1, 1,
-0.1632392, -0.7780368, -1.750021, 1, 0, 0, 1, 1,
-0.1605436, 1.176183, -2.047597, 1, 0, 0, 1, 1,
-0.1585192, -0.8721131, -2.84622, 1, 0, 0, 1, 1,
-0.1552652, 0.5575117, 0.6756418, 1, 0, 0, 1, 1,
-0.1548873, -0.5599002, -3.224248, 0, 0, 0, 1, 1,
-0.1548068, -0.8732962, -2.395066, 0, 0, 0, 1, 1,
-0.1477733, 0.05305894, -0.3532783, 0, 0, 0, 1, 1,
-0.1336998, -1.331663, -3.87343, 0, 0, 0, 1, 1,
-0.1321043, -0.6725424, -2.706995, 0, 0, 0, 1, 1,
-0.1282391, 0.5272936, 0.03037179, 0, 0, 0, 1, 1,
-0.1266366, 0.3237899, -1.496294, 0, 0, 0, 1, 1,
-0.1249364, 1.093611, 0.8358657, 1, 1, 1, 1, 1,
-0.1248105, -0.5515574, -2.656099, 1, 1, 1, 1, 1,
-0.118289, 0.6406948, -0.430431, 1, 1, 1, 1, 1,
-0.1157643, 0.1644446, -0.04741012, 1, 1, 1, 1, 1,
-0.1139764, 0.4542045, 0.6227815, 1, 1, 1, 1, 1,
-0.1139713, 0.5414883, 1.168085, 1, 1, 1, 1, 1,
-0.1132422, 0.1888817, -1.854647, 1, 1, 1, 1, 1,
-0.1131809, 0.03303024, -3.425553, 1, 1, 1, 1, 1,
-0.1064032, 0.4322899, 0.4045641, 1, 1, 1, 1, 1,
-0.1058934, -1.132421, -3.162037, 1, 1, 1, 1, 1,
-0.1053303, 0.8381712, -0.4603978, 1, 1, 1, 1, 1,
-0.1047359, 0.08169621, -2.711745, 1, 1, 1, 1, 1,
-0.1047024, 0.1743082, -0.5673259, 1, 1, 1, 1, 1,
-0.1042935, -2.044845, -3.50586, 1, 1, 1, 1, 1,
-0.09915445, -1.035168, -2.225712, 1, 1, 1, 1, 1,
-0.09871837, 0.8627495, -0.9697329, 0, 0, 1, 1, 1,
-0.09670021, -0.4580769, -1.242702, 1, 0, 0, 1, 1,
-0.0962722, -0.5230899, -2.479597, 1, 0, 0, 1, 1,
-0.09550668, 0.8273047, -0.8668098, 1, 0, 0, 1, 1,
-0.08900663, -0.6898217, -4.013034, 1, 0, 0, 1, 1,
-0.08712003, 1.131727, -1.361481, 1, 0, 0, 1, 1,
-0.07653037, -1.153474, -2.43793, 0, 0, 0, 1, 1,
-0.07638285, 0.2375738, 0.613791, 0, 0, 0, 1, 1,
-0.07271104, 1.821885, 0.9509673, 0, 0, 0, 1, 1,
-0.07102443, 0.6035194, -0.9506279, 0, 0, 0, 1, 1,
-0.07012391, 0.6819803, 0.4289788, 0, 0, 0, 1, 1,
-0.06355902, 0.2099655, 0.004978136, 0, 0, 0, 1, 1,
-0.06251678, 0.3696473, -1.159074, 0, 0, 0, 1, 1,
-0.06175387, 0.0296266, 0.03421485, 1, 1, 1, 1, 1,
-0.05711323, -1.216496, -2.882065, 1, 1, 1, 1, 1,
-0.05509376, -0.8877075, -2.708411, 1, 1, 1, 1, 1,
-0.05276336, 1.897951, 0.2165931, 1, 1, 1, 1, 1,
-0.05045049, 0.3833761, 1.086502, 1, 1, 1, 1, 1,
-0.04856557, 1.217197, -0.3779596, 1, 1, 1, 1, 1,
-0.04494164, -1.806775, -3.913536, 1, 1, 1, 1, 1,
-0.04305791, 0.9489293, 0.6517454, 1, 1, 1, 1, 1,
-0.04283158, -0.6611865, -3.035691, 1, 1, 1, 1, 1,
-0.04135964, 1.239262, -0.6220092, 1, 1, 1, 1, 1,
-0.03713306, 0.3741973, 0.8304461, 1, 1, 1, 1, 1,
-0.02995214, 0.4516463, -0.2384237, 1, 1, 1, 1, 1,
-0.02434398, 1.39361, 0.7218259, 1, 1, 1, 1, 1,
-0.01802879, 0.2665713, 1.015286, 1, 1, 1, 1, 1,
-0.01113845, 1.303951, 0.1998666, 1, 1, 1, 1, 1,
-0.01078393, -0.709551, -2.855719, 0, 0, 1, 1, 1,
-0.01075961, -0.3388866, -4.034313, 1, 0, 0, 1, 1,
-0.01031893, 0.1305593, -0.5121308, 1, 0, 0, 1, 1,
-0.008801384, -0.3552062, -2.504463, 1, 0, 0, 1, 1,
-0.008303442, 0.165225, 0.2904577, 1, 0, 0, 1, 1,
-0.007144989, -1.152606, -4.715704, 1, 0, 0, 1, 1,
-0.006005045, 1.462546, -0.2686619, 0, 0, 0, 1, 1,
-0.005747002, 0.7506011, 0.2463247, 0, 0, 0, 1, 1,
-0.002956479, -1.409541, -3.391048, 0, 0, 0, 1, 1,
-0.002462828, -0.8752003, -4.171389, 0, 0, 0, 1, 1,
-0.001207292, 0.5691821, -0.941343, 0, 0, 0, 1, 1,
0.002058379, 1.12347, -2.096218, 0, 0, 0, 1, 1,
0.003142591, 0.03380296, 0.4312246, 0, 0, 0, 1, 1,
0.00327247, -0.684853, 3.530684, 1, 1, 1, 1, 1,
0.003715062, -0.4082815, 3.396364, 1, 1, 1, 1, 1,
0.005827936, -0.1022795, 3.558977, 1, 1, 1, 1, 1,
0.01009419, 0.3379245, 0.01285469, 1, 1, 1, 1, 1,
0.0124559, -1.163796, 3.080773, 1, 1, 1, 1, 1,
0.01274909, -1.288217, 3.966331, 1, 1, 1, 1, 1,
0.01411886, 0.01750322, 0.9914477, 1, 1, 1, 1, 1,
0.01455731, 0.2448378, 0.5758327, 1, 1, 1, 1, 1,
0.01769158, 2.302684, 1.253526, 1, 1, 1, 1, 1,
0.02635292, 0.8012451, 0.685105, 1, 1, 1, 1, 1,
0.02904187, 0.4886079, 1.891361, 1, 1, 1, 1, 1,
0.03188794, -0.09655292, 3.727005, 1, 1, 1, 1, 1,
0.03626309, -0.9339041, 2.592252, 1, 1, 1, 1, 1,
0.03848424, -0.7287759, 2.850528, 1, 1, 1, 1, 1,
0.04046253, -0.1356549, 3.401934, 1, 1, 1, 1, 1,
0.04343106, -0.9992357, 2.910846, 0, 0, 1, 1, 1,
0.04402179, 0.2011387, -0.6741772, 1, 0, 0, 1, 1,
0.04631438, -1.085553, 4.20546, 1, 0, 0, 1, 1,
0.04655098, 1.64494, 0.6188961, 1, 0, 0, 1, 1,
0.04958292, 1.670636, 0.8714479, 1, 0, 0, 1, 1,
0.04966382, -0.7298687, 1.944899, 1, 0, 0, 1, 1,
0.05513646, -0.4782419, 2.245378, 0, 0, 0, 1, 1,
0.0559765, -1.242287, 2.063385, 0, 0, 0, 1, 1,
0.05688863, 1.524659, 0.2710117, 0, 0, 0, 1, 1,
0.05819118, 0.2648973, -0.8092755, 0, 0, 0, 1, 1,
0.06222701, 1.258095, -1.276063, 0, 0, 0, 1, 1,
0.0659193, 0.2929415, 0.3414491, 0, 0, 0, 1, 1,
0.06655632, -1.21189, 2.696307, 0, 0, 0, 1, 1,
0.07119064, -1.008453, 1.232837, 1, 1, 1, 1, 1,
0.07710113, 0.6058134, -1.584415, 1, 1, 1, 1, 1,
0.07763587, -2.198575, 4.224677, 1, 1, 1, 1, 1,
0.07930078, 0.2814561, -0.1113293, 1, 1, 1, 1, 1,
0.07972037, 0.7988992, 0.5968748, 1, 1, 1, 1, 1,
0.08042607, -1.199797, 3.12684, 1, 1, 1, 1, 1,
0.08099553, -0.6484801, 2.367052, 1, 1, 1, 1, 1,
0.08184481, -1.064469, 1.408475, 1, 1, 1, 1, 1,
0.09139356, 0.9279774, -1.220384, 1, 1, 1, 1, 1,
0.103139, -2.341808, 1.74757, 1, 1, 1, 1, 1,
0.105629, 0.1713885, 1.154306, 1, 1, 1, 1, 1,
0.1056776, 0.4345496, -0.6943889, 1, 1, 1, 1, 1,
0.1067991, -1.652809, 1.725996, 1, 1, 1, 1, 1,
0.1107874, 0.2017827, -1.288952, 1, 1, 1, 1, 1,
0.1140687, -2.914878, 3.928517, 1, 1, 1, 1, 1,
0.1142411, 1.233872, 0.05615684, 0, 0, 1, 1, 1,
0.1151522, 1.016836, -0.5828109, 1, 0, 0, 1, 1,
0.1183011, 0.4856071, 0.454048, 1, 0, 0, 1, 1,
0.1203937, -0.4605763, 1.164065, 1, 0, 0, 1, 1,
0.1205047, 0.06468658, 0.6511252, 1, 0, 0, 1, 1,
0.1244142, -0.4975044, 2.772539, 1, 0, 0, 1, 1,
0.1244572, -0.493516, 2.41007, 0, 0, 0, 1, 1,
0.1244648, 0.666833, 0.3008859, 0, 0, 0, 1, 1,
0.1260813, -0.7520981, 2.770002, 0, 0, 0, 1, 1,
0.1292629, 0.8403389, -1.708124, 0, 0, 0, 1, 1,
0.1296453, -0.1626421, 2.555209, 0, 0, 0, 1, 1,
0.1307075, 0.4887017, -0.0422669, 0, 0, 0, 1, 1,
0.13143, 1.077617, 0.2092956, 0, 0, 0, 1, 1,
0.1350501, -0.263426, 3.510691, 1, 1, 1, 1, 1,
0.1353849, -0.4866679, 2.245278, 1, 1, 1, 1, 1,
0.1367794, -0.009234858, -0.04801822, 1, 1, 1, 1, 1,
0.1373971, 0.3567331, -1.024086, 1, 1, 1, 1, 1,
0.1397827, -1.08836, 3.811552, 1, 1, 1, 1, 1,
0.1401455, -1.750817, 4.116783, 1, 1, 1, 1, 1,
0.1421633, -0.869352, 1.347187, 1, 1, 1, 1, 1,
0.1423413, 0.0681467, -0.1580602, 1, 1, 1, 1, 1,
0.1462118, 0.4125654, 0.353879, 1, 1, 1, 1, 1,
0.1484742, -0.3069368, 4.462142, 1, 1, 1, 1, 1,
0.1521735, -0.2503484, 2.061749, 1, 1, 1, 1, 1,
0.1528272, -0.8480124, 1.962063, 1, 1, 1, 1, 1,
0.1537056, 0.7921429, -0.420212, 1, 1, 1, 1, 1,
0.1605176, -1.893993, 2.432507, 1, 1, 1, 1, 1,
0.1639401, 1.211521, 0.3341807, 1, 1, 1, 1, 1,
0.1639621, 1.238795, -0.1807824, 0, 0, 1, 1, 1,
0.1662122, -0.336038, 2.468329, 1, 0, 0, 1, 1,
0.1682351, -0.3263136, 1.375661, 1, 0, 0, 1, 1,
0.1717427, -0.7466516, 4.671739, 1, 0, 0, 1, 1,
0.1895043, 0.4353242, -1.544551, 1, 0, 0, 1, 1,
0.2010206, 0.9236448, -0.3528574, 1, 0, 0, 1, 1,
0.2048922, -0.4337056, 2.077586, 0, 0, 0, 1, 1,
0.2084634, 0.9691742, -0.7287712, 0, 0, 0, 1, 1,
0.2090563, -1.558139, 2.547546, 0, 0, 0, 1, 1,
0.2116973, -1.177252, 1.548713, 0, 0, 0, 1, 1,
0.2119033, 1.889423, -0.7818363, 0, 0, 0, 1, 1,
0.2135263, -0.3935916, 3.492014, 0, 0, 0, 1, 1,
0.2135452, -0.2188, 0.3213575, 0, 0, 0, 1, 1,
0.2146901, 0.3504734, 1.381267, 1, 1, 1, 1, 1,
0.221114, 0.1610069, 0.7864729, 1, 1, 1, 1, 1,
0.2220034, 0.3699193, 1.246195, 1, 1, 1, 1, 1,
0.22429, 0.2721832, 1.647419, 1, 1, 1, 1, 1,
0.2270105, 1.612926, 0.03427972, 1, 1, 1, 1, 1,
0.231004, -0.679455, 0.4042394, 1, 1, 1, 1, 1,
0.2333224, 0.4803265, 1.291671, 1, 1, 1, 1, 1,
0.2347703, 0.9067498, 1.411608, 1, 1, 1, 1, 1,
0.2404756, -0.5420675, 3.835631, 1, 1, 1, 1, 1,
0.2453632, -0.4561749, 2.536872, 1, 1, 1, 1, 1,
0.2455335, -0.8955449, 4.730394, 1, 1, 1, 1, 1,
0.2470814, -0.4153627, 3.620941, 1, 1, 1, 1, 1,
0.2506152, 0.9724572, 1.367997, 1, 1, 1, 1, 1,
0.2507415, -0.1895425, 2.60456, 1, 1, 1, 1, 1,
0.2536379, -0.2150728, 1.646052, 1, 1, 1, 1, 1,
0.2557768, 1.487407, 0.2250163, 0, 0, 1, 1, 1,
0.257947, 1.556781, 0.9439286, 1, 0, 0, 1, 1,
0.2581215, 0.4413212, -0.4383496, 1, 0, 0, 1, 1,
0.2587307, -0.3284778, 3.520029, 1, 0, 0, 1, 1,
0.2633289, 0.9813989, -0.1595635, 1, 0, 0, 1, 1,
0.2644073, -0.8546024, 2.777188, 1, 0, 0, 1, 1,
0.2678374, -0.5176057, 3.347413, 0, 0, 0, 1, 1,
0.2862822, 0.189899, 2.71592, 0, 0, 0, 1, 1,
0.2876464, 0.03584521, 2.812736, 0, 0, 0, 1, 1,
0.2892282, 0.9426153, -1.835665, 0, 0, 0, 1, 1,
0.2895276, 0.776415, 0.4175372, 0, 0, 0, 1, 1,
0.291035, 1.843306, -1.342202, 0, 0, 0, 1, 1,
0.2919323, -1.4689, 4.131019, 0, 0, 0, 1, 1,
0.3033367, -0.8623825, 2.907993, 1, 1, 1, 1, 1,
0.3034239, -0.2540097, 2.51942, 1, 1, 1, 1, 1,
0.3042281, 1.176726, 0.2038725, 1, 1, 1, 1, 1,
0.3064929, -0.572435, 3.364702, 1, 1, 1, 1, 1,
0.3146791, -0.1584218, 0.5498065, 1, 1, 1, 1, 1,
0.3187223, 0.6247084, -0.2373405, 1, 1, 1, 1, 1,
0.3206534, 0.8225409, 0.4313912, 1, 1, 1, 1, 1,
0.3242989, 0.5767879, 0.1843972, 1, 1, 1, 1, 1,
0.3243964, 1.131969, 0.6435015, 1, 1, 1, 1, 1,
0.3252906, -0.4517132, 1.993537, 1, 1, 1, 1, 1,
0.3274668, -0.2387915, 2.520802, 1, 1, 1, 1, 1,
0.3282617, -1.129757, 3.352462, 1, 1, 1, 1, 1,
0.3285285, 0.6013144, 1.917497, 1, 1, 1, 1, 1,
0.3290284, -0.1243015, 1.616456, 1, 1, 1, 1, 1,
0.3293503, 2.343432, 0.2094281, 1, 1, 1, 1, 1,
0.3346726, -1.309224, 3.555578, 0, 0, 1, 1, 1,
0.3470364, 1.049047, -1.617568, 1, 0, 0, 1, 1,
0.3503553, 0.152029, 1.870366, 1, 0, 0, 1, 1,
0.3520355, 2.081245, -0.2094341, 1, 0, 0, 1, 1,
0.3525259, 0.5623225, 0.7455204, 1, 0, 0, 1, 1,
0.3560422, 0.01105989, -0.3607025, 1, 0, 0, 1, 1,
0.3565931, -1.051662, 1.981296, 0, 0, 0, 1, 1,
0.3625806, 1.043316, 0.8084478, 0, 0, 0, 1, 1,
0.3780028, 1.567696, -1.292884, 0, 0, 0, 1, 1,
0.38094, -0.3208732, 1.249448, 0, 0, 0, 1, 1,
0.3819244, 0.6519782, 1.829689, 0, 0, 0, 1, 1,
0.3866938, 0.570477, -0.9011318, 0, 0, 0, 1, 1,
0.3902565, 0.8947574, -1.523395, 0, 0, 0, 1, 1,
0.3962505, 0.5927518, 1.786517, 1, 1, 1, 1, 1,
0.3968487, 1.0442, 0.8981013, 1, 1, 1, 1, 1,
0.4003015, -0.620594, 2.132172, 1, 1, 1, 1, 1,
0.4021648, 0.4228961, 2.517039, 1, 1, 1, 1, 1,
0.4036618, 1.992712, -2.10661, 1, 1, 1, 1, 1,
0.4098502, 0.1807363, -0.5191095, 1, 1, 1, 1, 1,
0.4146893, -1.386037, 1.200123, 1, 1, 1, 1, 1,
0.4207779, -0.1828751, 1.639541, 1, 1, 1, 1, 1,
0.4211207, -0.2278991, 2.483129, 1, 1, 1, 1, 1,
0.4258935, 0.9117078, -0.554083, 1, 1, 1, 1, 1,
0.4282154, -0.1301799, 2.153021, 1, 1, 1, 1, 1,
0.4323561, -0.007698074, 2.588219, 1, 1, 1, 1, 1,
0.4324094, -1.093723, 0.8786076, 1, 1, 1, 1, 1,
0.4359456, 0.03736233, 1.582132, 1, 1, 1, 1, 1,
0.43967, -0.7671003, 2.392932, 1, 1, 1, 1, 1,
0.4414631, -0.5391353, 2.444377, 0, 0, 1, 1, 1,
0.4417316, -1.767888, 4.208373, 1, 0, 0, 1, 1,
0.44782, -0.7758775, 3.192593, 1, 0, 0, 1, 1,
0.4581565, -0.06956704, 3.088542, 1, 0, 0, 1, 1,
0.4591043, 1.548255, -0.6447222, 1, 0, 0, 1, 1,
0.4592075, 0.3738982, 0.4890432, 1, 0, 0, 1, 1,
0.4604127, -1.332418, 3.277728, 0, 0, 0, 1, 1,
0.4607631, -0.7278692, 3.205481, 0, 0, 0, 1, 1,
0.4613869, -0.1720784, 2.421791, 0, 0, 0, 1, 1,
0.4628494, 3.234017, -0.5016665, 0, 0, 0, 1, 1,
0.46835, 1.122592, 0.9671394, 0, 0, 0, 1, 1,
0.4692209, 0.7706726, 1.248604, 0, 0, 0, 1, 1,
0.4706894, 0.3029157, 1.355781, 0, 0, 0, 1, 1,
0.4718722, 2.167705, 1.689628, 1, 1, 1, 1, 1,
0.4830615, 0.9880168, 1.109824, 1, 1, 1, 1, 1,
0.4841304, 0.2348781, 2.400934, 1, 1, 1, 1, 1,
0.4845035, 1.78584, 1.070241, 1, 1, 1, 1, 1,
0.5022108, -0.2908889, 1.698412, 1, 1, 1, 1, 1,
0.5036374, 0.3977449, 0.01198387, 1, 1, 1, 1, 1,
0.5082951, -0.3731521, 3.425279, 1, 1, 1, 1, 1,
0.514919, 1.00599, -1.878644, 1, 1, 1, 1, 1,
0.520283, -1.402815, 1.883872, 1, 1, 1, 1, 1,
0.5211434, 0.1012049, 1.83722, 1, 1, 1, 1, 1,
0.5249619, -0.08362046, 1.349476, 1, 1, 1, 1, 1,
0.5271288, 1.065714, -1.453171, 1, 1, 1, 1, 1,
0.5346152, -0.1169757, 1.30546, 1, 1, 1, 1, 1,
0.5390021, 1.357958, -0.9265288, 1, 1, 1, 1, 1,
0.5457243, 0.4346398, 1.558532, 1, 1, 1, 1, 1,
0.546073, -0.4152884, 2.835241, 0, 0, 1, 1, 1,
0.5519498, -1.961818, 2.730781, 1, 0, 0, 1, 1,
0.5523369, 3.324183, 0.4930564, 1, 0, 0, 1, 1,
0.5533498, -0.3060662, 1.391814, 1, 0, 0, 1, 1,
0.5549113, -0.05852403, 1.082286, 1, 0, 0, 1, 1,
0.5607352, 0.8994038, -0.2420233, 1, 0, 0, 1, 1,
0.561467, 0.5500104, 0.9817541, 0, 0, 0, 1, 1,
0.5621387, 0.1028854, 1.478122, 0, 0, 0, 1, 1,
0.5622053, -1.79489, 3.189471, 0, 0, 0, 1, 1,
0.5622622, 2.075081, 1.181756, 0, 0, 0, 1, 1,
0.5637206, 1.306229, -0.05468167, 0, 0, 0, 1, 1,
0.5649941, -0.6095408, 2.16169, 0, 0, 0, 1, 1,
0.5704955, -0.1813296, 1.138956, 0, 0, 0, 1, 1,
0.5745845, 0.3680953, 1.390901, 1, 1, 1, 1, 1,
0.5751851, 0.1142818, 1.685643, 1, 1, 1, 1, 1,
0.5769401, -0.165139, 0.8308893, 1, 1, 1, 1, 1,
0.5804067, -0.3699617, 0.7832817, 1, 1, 1, 1, 1,
0.5816894, 0.1951252, 0.3411774, 1, 1, 1, 1, 1,
0.5834243, -1.158885, 2.620367, 1, 1, 1, 1, 1,
0.584734, -0.1625661, 2.561533, 1, 1, 1, 1, 1,
0.5863686, -0.8498223, 2.149348, 1, 1, 1, 1, 1,
0.5978165, -0.8600108, 3.072124, 1, 1, 1, 1, 1,
0.602071, 0.2588446, -0.1207566, 1, 1, 1, 1, 1,
0.6026064, 0.3407755, 0.8591348, 1, 1, 1, 1, 1,
0.6028494, 0.3727272, 1.573288, 1, 1, 1, 1, 1,
0.6047446, -0.4126884, 2.06294, 1, 1, 1, 1, 1,
0.6111287, 0.3341967, 2.044267, 1, 1, 1, 1, 1,
0.6133507, -1.973161, 1.866661, 1, 1, 1, 1, 1,
0.6141095, -1.137069, 2.442084, 0, 0, 1, 1, 1,
0.6149121, 2.22974, 0.813282, 1, 0, 0, 1, 1,
0.6230814, -1.051065, 2.133023, 1, 0, 0, 1, 1,
0.6233311, 0.4159033, 1.016905, 1, 0, 0, 1, 1,
0.627574, -0.471116, 2.492442, 1, 0, 0, 1, 1,
0.6314026, 0.01040376, 0.6278458, 1, 0, 0, 1, 1,
0.6321454, 0.947426, 1.388997, 0, 0, 0, 1, 1,
0.6322847, 0.05166054, 2.345066, 0, 0, 0, 1, 1,
0.6355842, 0.4087983, 1.527785, 0, 0, 0, 1, 1,
0.6374593, -0.5544026, 2.777504, 0, 0, 0, 1, 1,
0.645402, 0.8608984, 0.06304945, 0, 0, 0, 1, 1,
0.6457683, 0.6087604, -0.904938, 0, 0, 0, 1, 1,
0.6467367, -1.804205, 4.617273, 0, 0, 0, 1, 1,
0.6482694, 0.1549929, 1.97451, 1, 1, 1, 1, 1,
0.6493454, -0.5679813, 1.116707, 1, 1, 1, 1, 1,
0.650048, -0.7614008, 1.562279, 1, 1, 1, 1, 1,
0.651985, -0.09684677, 2.097383, 1, 1, 1, 1, 1,
0.65412, -2.167839, 1.699356, 1, 1, 1, 1, 1,
0.6542742, 1.096314, 1.522618, 1, 1, 1, 1, 1,
0.6561677, -0.5335003, 1.843674, 1, 1, 1, 1, 1,
0.6564137, 0.0878197, 1.136175, 1, 1, 1, 1, 1,
0.6580153, 0.8897178, 0.2603136, 1, 1, 1, 1, 1,
0.6593399, -0.5928846, 4.222906, 1, 1, 1, 1, 1,
0.6593419, 1.909075, 0.3159362, 1, 1, 1, 1, 1,
0.6597592, 0.002071462, 3.112201, 1, 1, 1, 1, 1,
0.6601889, -0.291952, 4.47675, 1, 1, 1, 1, 1,
0.6641132, -0.550501, 0.953253, 1, 1, 1, 1, 1,
0.6641605, 1.347226, 0.374003, 1, 1, 1, 1, 1,
0.6729676, 0.9990177, -0.6221109, 0, 0, 1, 1, 1,
0.6731459, -0.5950224, 1.561071, 1, 0, 0, 1, 1,
0.6740084, -0.5444034, 1.618007, 1, 0, 0, 1, 1,
0.6754147, -0.7256876, 2.668193, 1, 0, 0, 1, 1,
0.6793787, -0.5431806, 2.558412, 1, 0, 0, 1, 1,
0.6799371, 1.284858, -0.1517716, 1, 0, 0, 1, 1,
0.6828886, 0.7523639, 0.7456194, 0, 0, 0, 1, 1,
0.7036924, 0.8980551, -1.663916, 0, 0, 0, 1, 1,
0.7055349, -0.4432429, 2.015798, 0, 0, 0, 1, 1,
0.7067495, 0.7589743, 0.3600282, 0, 0, 0, 1, 1,
0.710919, 1.357674, 0.3224163, 0, 0, 0, 1, 1,
0.7121122, -1.243431, 2.781396, 0, 0, 0, 1, 1,
0.7124968, 1.591082, 0.8362194, 0, 0, 0, 1, 1,
0.7156392, -0.02314453, 0.950875, 1, 1, 1, 1, 1,
0.7184852, 1.397237, -1.036998, 1, 1, 1, 1, 1,
0.7208547, -0.3048771, 1.151488, 1, 1, 1, 1, 1,
0.7286708, -1.115547, 3.091614, 1, 1, 1, 1, 1,
0.7334563, 1.012751, -0.2515355, 1, 1, 1, 1, 1,
0.7378938, 1.239519, 0.1460954, 1, 1, 1, 1, 1,
0.7381695, 1.088275, -0.6178455, 1, 1, 1, 1, 1,
0.7429749, -0.1837333, 2.608786, 1, 1, 1, 1, 1,
0.7450383, 1.028044, 0.675283, 1, 1, 1, 1, 1,
0.7456232, -1.211627, 3.612282, 1, 1, 1, 1, 1,
0.7561779, -1.073997, 2.038127, 1, 1, 1, 1, 1,
0.7563828, 0.001473948, 2.342269, 1, 1, 1, 1, 1,
0.7636073, 0.7491981, 0.7807985, 1, 1, 1, 1, 1,
0.769765, -0.6013942, 2.436069, 1, 1, 1, 1, 1,
0.7737322, 0.08825809, 1.562425, 1, 1, 1, 1, 1,
0.776314, -3.179442, 1.588365, 0, 0, 1, 1, 1,
0.7775854, 0.9908013, 0.05887944, 1, 0, 0, 1, 1,
0.7785816, 0.6497666, 0.7587389, 1, 0, 0, 1, 1,
0.7880269, -0.1343819, 2.878199, 1, 0, 0, 1, 1,
0.797198, -0.1028, 3.081585, 1, 0, 0, 1, 1,
0.8045052, 0.8286677, 0.1678457, 1, 0, 0, 1, 1,
0.8050394, 0.1726824, 0.5500999, 0, 0, 0, 1, 1,
0.8056814, -0.7249693, 3.647815, 0, 0, 0, 1, 1,
0.8092971, -0.1231369, 1.494327, 0, 0, 0, 1, 1,
0.8107779, -0.4524434, 3.886112, 0, 0, 0, 1, 1,
0.8122112, -0.0186869, 2.755827, 0, 0, 0, 1, 1,
0.8122419, 0.804833, 1.022633, 0, 0, 0, 1, 1,
0.812968, 1.036095, 0.7022824, 0, 0, 0, 1, 1,
0.8137509, 1.025206, -1.702313, 1, 1, 1, 1, 1,
0.813843, 0.5106348, 1.829551, 1, 1, 1, 1, 1,
0.8187969, -0.6576807, 5.066819, 1, 1, 1, 1, 1,
0.8251215, -0.813913, 1.621067, 1, 1, 1, 1, 1,
0.8279088, -1.475662, 4.145672, 1, 1, 1, 1, 1,
0.829047, 0.5728117, 0.7014457, 1, 1, 1, 1, 1,
0.833891, -1.40764, 2.332378, 1, 1, 1, 1, 1,
0.8351166, -0.397662, 1.309355, 1, 1, 1, 1, 1,
0.8389211, 1.468651, 1.294084, 1, 1, 1, 1, 1,
0.8390258, 1.747494, 0.4302686, 1, 1, 1, 1, 1,
0.8395014, -1.039742, 1.03813, 1, 1, 1, 1, 1,
0.8401082, 1.714754, 0.2478865, 1, 1, 1, 1, 1,
0.8427496, 1.054132, -0.4116546, 1, 1, 1, 1, 1,
0.8480523, -1.667997, 2.918548, 1, 1, 1, 1, 1,
0.8504986, -0.4064721, 2.139771, 1, 1, 1, 1, 1,
0.8516183, -0.835792, 1.70418, 0, 0, 1, 1, 1,
0.8517494, 0.7079942, 1.290867, 1, 0, 0, 1, 1,
0.8569415, 0.5231193, 0.3669359, 1, 0, 0, 1, 1,
0.8609549, -1.842101, 1.598855, 1, 0, 0, 1, 1,
0.8619884, -0.1103512, 1.852371, 1, 0, 0, 1, 1,
0.8675495, 0.1698782, 1.080378, 1, 0, 0, 1, 1,
0.8690173, 0.08501308, 1.167483, 0, 0, 0, 1, 1,
0.8698151, -0.824379, 1.477777, 0, 0, 0, 1, 1,
0.8793197, 0.02232779, -0.008533245, 0, 0, 0, 1, 1,
0.8821193, 0.06417421, 2.746515, 0, 0, 0, 1, 1,
0.8886667, 1.529098, 0.1289117, 0, 0, 0, 1, 1,
0.8924237, 0.6656029, 0.3579758, 0, 0, 0, 1, 1,
0.9004272, -1.147498, 2.352932, 0, 0, 0, 1, 1,
0.9016023, 0.5584916, -0.4963223, 1, 1, 1, 1, 1,
0.9022587, 1.490598, 1.833475, 1, 1, 1, 1, 1,
0.9040794, -0.9198744, 2.993311, 1, 1, 1, 1, 1,
0.9052215, 0.4903338, 1.83884, 1, 1, 1, 1, 1,
0.9067433, 0.5959054, 0.9050477, 1, 1, 1, 1, 1,
0.9071251, 0.2590043, 1.020635, 1, 1, 1, 1, 1,
0.9091641, -0.2650146, 0.9408216, 1, 1, 1, 1, 1,
0.9153254, -0.3535123, 1.882013, 1, 1, 1, 1, 1,
0.9253981, -0.002575089, 0.878431, 1, 1, 1, 1, 1,
0.9266771, 0.9787546, 1.220537, 1, 1, 1, 1, 1,
0.9297293, -0.4058355, 2.198659, 1, 1, 1, 1, 1,
0.9349346, 1.350461, 0.19508, 1, 1, 1, 1, 1,
0.9406673, 0.7225768, 0.05010524, 1, 1, 1, 1, 1,
0.9409801, 0.2284639, 1.302954, 1, 1, 1, 1, 1,
0.9414882, -0.2418881, 0.01630637, 1, 1, 1, 1, 1,
0.9415554, 1.485293, 0.6044047, 0, 0, 1, 1, 1,
0.9480356, -0.5735985, 2.55002, 1, 0, 0, 1, 1,
0.9639627, -0.4796336, 0.7615756, 1, 0, 0, 1, 1,
0.9640551, -0.5636859, 1.094793, 1, 0, 0, 1, 1,
0.9654208, 0.9194213, 0.5645748, 1, 0, 0, 1, 1,
0.9681373, -0.7381699, 3.051606, 1, 0, 0, 1, 1,
0.9784997, 0.3881179, 2.264778, 0, 0, 0, 1, 1,
0.989381, 0.2004975, 0.003129234, 0, 0, 0, 1, 1,
0.9913121, -0.3539226, 1.933621, 0, 0, 0, 1, 1,
1.006215, 0.08446771, 1.692043, 0, 0, 0, 1, 1,
1.007719, -1.932288, 3.296189, 0, 0, 0, 1, 1,
1.007729, -2.212826, 2.864972, 0, 0, 0, 1, 1,
1.008053, -1.050436, 1.320235, 0, 0, 0, 1, 1,
1.016501, 0.2675165, 2.347065, 1, 1, 1, 1, 1,
1.01939, 0.6679624, 1.960741, 1, 1, 1, 1, 1,
1.027164, 0.1385549, 2.290035, 1, 1, 1, 1, 1,
1.03275, 2.407283, -0.05234278, 1, 1, 1, 1, 1,
1.042459, 0.2771101, 1.115856, 1, 1, 1, 1, 1,
1.043855, -1.236269, 3.433209, 1, 1, 1, 1, 1,
1.045169, 1.2758, -1.62341, 1, 1, 1, 1, 1,
1.045337, 0.2211605, -0.007977569, 1, 1, 1, 1, 1,
1.0479, 1.287927, -2.035541, 1, 1, 1, 1, 1,
1.056549, -0.435237, 2.144914, 1, 1, 1, 1, 1,
1.062473, 0.2479593, 1.912471, 1, 1, 1, 1, 1,
1.063947, 0.6681305, 1.984585, 1, 1, 1, 1, 1,
1.065492, -1.023958, 5.069727, 1, 1, 1, 1, 1,
1.070953, 0.5009802, 2.078446, 1, 1, 1, 1, 1,
1.072564, -0.2469038, 2.772319, 1, 1, 1, 1, 1,
1.076651, 1.414905, 0.3444596, 0, 0, 1, 1, 1,
1.07918, 1.013024, 0.3486671, 1, 0, 0, 1, 1,
1.080897, 0.05026226, 1.858685, 1, 0, 0, 1, 1,
1.08458, -0.01974021, -0.283315, 1, 0, 0, 1, 1,
1.088573, 0.04913471, 0.9390703, 1, 0, 0, 1, 1,
1.091057, 0.4129859, 1.263488, 1, 0, 0, 1, 1,
1.092887, 0.2381236, 1.86093, 0, 0, 0, 1, 1,
1.094118, 0.1871057, 3.283134, 0, 0, 0, 1, 1,
1.100623, -0.4805138, 1.996083, 0, 0, 0, 1, 1,
1.10095, 0.09112926, 0.6971438, 0, 0, 0, 1, 1,
1.108866, 0.708463, 0.6934549, 0, 0, 0, 1, 1,
1.125732, 1.452089, -0.2156753, 0, 0, 0, 1, 1,
1.129789, 1.478865, 1.332168, 0, 0, 0, 1, 1,
1.132753, 0.9675927, -0.6381974, 1, 1, 1, 1, 1,
1.134531, 1.424716, 1.372041, 1, 1, 1, 1, 1,
1.137659, -0.01798242, 0.6784194, 1, 1, 1, 1, 1,
1.140647, -0.04254112, 2.514511, 1, 1, 1, 1, 1,
1.140721, 0.8820927, -0.6534795, 1, 1, 1, 1, 1,
1.152875, 0.3634932, -0.5464079, 1, 1, 1, 1, 1,
1.156546, 1.013748, 0.8541586, 1, 1, 1, 1, 1,
1.162008, 0.08922695, 0.8375314, 1, 1, 1, 1, 1,
1.165205, -0.1726932, 1.197752, 1, 1, 1, 1, 1,
1.179485, 0.1029328, 1.144895, 1, 1, 1, 1, 1,
1.182317, 0.05347997, 2.729378, 1, 1, 1, 1, 1,
1.184596, -0.9688144, 1.933421, 1, 1, 1, 1, 1,
1.187913, 0.08699484, 1.438987, 1, 1, 1, 1, 1,
1.200005, -1.106114, 3.720661, 1, 1, 1, 1, 1,
1.204062, 1.445781, 1.176546, 1, 1, 1, 1, 1,
1.20674, 1.49123, -0.5533016, 0, 0, 1, 1, 1,
1.231977, 0.3183506, 1.255708, 1, 0, 0, 1, 1,
1.24439, -1.293105, 1.720647, 1, 0, 0, 1, 1,
1.246804, -1.08512, 2.398547, 1, 0, 0, 1, 1,
1.248516, -0.355367, 2.727561, 1, 0, 0, 1, 1,
1.248518, -0.4932642, 2.495295, 1, 0, 0, 1, 1,
1.254179, -0.6573943, 0.4097459, 0, 0, 0, 1, 1,
1.272685, 0.5449063, 0.7489436, 0, 0, 0, 1, 1,
1.274167, 0.06660958, 1.82407, 0, 0, 0, 1, 1,
1.277969, 0.01486203, 3.516234, 0, 0, 0, 1, 1,
1.284876, 0.365462, 0.8169931, 0, 0, 0, 1, 1,
1.287645, 0.2434692, 1.006627, 0, 0, 0, 1, 1,
1.288034, 0.5541908, -0.02258042, 0, 0, 0, 1, 1,
1.289706, -1.327286, 1.889683, 1, 1, 1, 1, 1,
1.305279, -0.8233173, 2.220074, 1, 1, 1, 1, 1,
1.310175, -0.2622178, -0.01942117, 1, 1, 1, 1, 1,
1.314323, 0.4852836, 0.9627935, 1, 1, 1, 1, 1,
1.315038, 0.1197134, 1.995877, 1, 1, 1, 1, 1,
1.315336, -0.8958963, 2.426407, 1, 1, 1, 1, 1,
1.317308, -1.887118, 4.301868, 1, 1, 1, 1, 1,
1.32439, -1.378116, 3.020719, 1, 1, 1, 1, 1,
1.335237, -1.623982, 3.397019, 1, 1, 1, 1, 1,
1.338688, 0.1808286, 2.044415, 1, 1, 1, 1, 1,
1.344219, -1.035635, 1.765354, 1, 1, 1, 1, 1,
1.354601, 0.5205896, 0.1631383, 1, 1, 1, 1, 1,
1.356132, 0.1705128, 3.088699, 1, 1, 1, 1, 1,
1.368065, -0.1813882, 1.62565, 1, 1, 1, 1, 1,
1.368796, 0.1526056, 1.706709, 1, 1, 1, 1, 1,
1.405226, -1.155488, 3.627495, 0, 0, 1, 1, 1,
1.412967, 0.1782326, 2.991378, 1, 0, 0, 1, 1,
1.414738, -0.3336765, 2.05082, 1, 0, 0, 1, 1,
1.4192, 0.2613791, 1.698774, 1, 0, 0, 1, 1,
1.425913, 2.529915, 1.212938, 1, 0, 0, 1, 1,
1.435565, -0.459265, 2.508234, 1, 0, 0, 1, 1,
1.439838, 0.81012, 1.798831, 0, 0, 0, 1, 1,
1.443501, -0.3318733, 3.938182, 0, 0, 0, 1, 1,
1.449795, 0.02719649, 1.810846, 0, 0, 0, 1, 1,
1.452702, -0.8982587, 3.032593, 0, 0, 0, 1, 1,
1.45419, 0.9154462, -0.5599402, 0, 0, 0, 1, 1,
1.457244, -0.6729125, 1.57435, 0, 0, 0, 1, 1,
1.457641, 0.5016809, 2.493245, 0, 0, 0, 1, 1,
1.461239, -0.1981319, 1.916252, 1, 1, 1, 1, 1,
1.482846, -0.1049447, 1.033655, 1, 1, 1, 1, 1,
1.498402, -0.1107713, 0.9216393, 1, 1, 1, 1, 1,
1.533168, -0.2091275, 1.216703, 1, 1, 1, 1, 1,
1.537854, -0.9055718, 1.477514, 1, 1, 1, 1, 1,
1.543503, -0.4547988, -0.4567413, 1, 1, 1, 1, 1,
1.557833, -0.8191835, 0.2151354, 1, 1, 1, 1, 1,
1.570664, 1.399964, 1.386557, 1, 1, 1, 1, 1,
1.584279, -1.242667, 3.806857, 1, 1, 1, 1, 1,
1.584491, 0.6624125, 1.947776, 1, 1, 1, 1, 1,
1.585486, -0.4414701, 1.656714, 1, 1, 1, 1, 1,
1.60188, 1.741429, 1.34413, 1, 1, 1, 1, 1,
1.605005, -0.1114466, 1.292228, 1, 1, 1, 1, 1,
1.606935, -0.4317881, 2.512705, 1, 1, 1, 1, 1,
1.629774, -0.6061767, 1.059799, 1, 1, 1, 1, 1,
1.63431, -1.043348, 1.913039, 0, 0, 1, 1, 1,
1.637831, -0.395476, 2.429124, 1, 0, 0, 1, 1,
1.666667, -0.9531949, 2.30231, 1, 0, 0, 1, 1,
1.672064, -1.2644, 0.7648086, 1, 0, 0, 1, 1,
1.684125, -1.214985, 1.300099, 1, 0, 0, 1, 1,
1.716533, -0.3140302, 2.695979, 1, 0, 0, 1, 1,
1.734934, 2.25895, -0.3124207, 0, 0, 0, 1, 1,
1.784059, -0.2717937, 2.930494, 0, 0, 0, 1, 1,
1.78616, 0.7161499, 2.566455, 0, 0, 0, 1, 1,
1.827909, 0.3777154, 0.7047866, 0, 0, 0, 1, 1,
1.836883, 1.185348, 0.8782306, 0, 0, 0, 1, 1,
1.843561, -0.221585, 0.258702, 0, 0, 0, 1, 1,
1.853449, -0.09953669, 1.091161, 0, 0, 0, 1, 1,
1.861531, 0.5985104, 1.089159, 1, 1, 1, 1, 1,
1.905592, 0.1629603, 0.06230773, 1, 1, 1, 1, 1,
1.912284, -0.3548377, 1.618388, 1, 1, 1, 1, 1,
1.932624, -0.1519554, 1.60428, 1, 1, 1, 1, 1,
1.994773, 1.389218, -0.6148244, 1, 1, 1, 1, 1,
2.014955, 2.561207, 0.7636219, 1, 1, 1, 1, 1,
2.031499, 0.1426832, 1.914377, 1, 1, 1, 1, 1,
2.036136, 0.2986915, -0.1035811, 1, 1, 1, 1, 1,
2.050569, 0.4367143, 0.8379052, 1, 1, 1, 1, 1,
2.052504, -1.156782, 1.371813, 1, 1, 1, 1, 1,
2.073262, -0.08026709, 2.626715, 1, 1, 1, 1, 1,
2.073529, -0.7115974, 1.4717, 1, 1, 1, 1, 1,
2.094374, -1.601438, 0.3868845, 1, 1, 1, 1, 1,
2.139659, 1.14656, 2.260838, 1, 1, 1, 1, 1,
2.176916, 1.514535, 0.4231412, 1, 1, 1, 1, 1,
2.183331, -0.07639814, 1.453258, 0, 0, 1, 1, 1,
2.212049, 1.289349, 0.338019, 1, 0, 0, 1, 1,
2.250314, -0.9943895, 2.106059, 1, 0, 0, 1, 1,
2.35662, -0.6708323, 1.51081, 1, 0, 0, 1, 1,
2.364458, -0.2020513, 1.210433, 1, 0, 0, 1, 1,
2.375377, -0.6589739, 3.412803, 1, 0, 0, 1, 1,
2.382634, -1.282362, 3.357922, 0, 0, 0, 1, 1,
2.390229, 0.6679636, 0.1163727, 0, 0, 0, 1, 1,
2.416299, 0.3626641, 0.5661616, 0, 0, 0, 1, 1,
2.440241, 1.63405, 0.8817099, 0, 0, 0, 1, 1,
2.440926, -1.569863, 2.099172, 0, 0, 0, 1, 1,
2.591875, -0.1248845, 3.165356, 0, 0, 0, 1, 1,
2.606991, -0.9384596, 2.758831, 0, 0, 0, 1, 1,
2.611113, -1.285661, 1.119187, 1, 1, 1, 1, 1,
2.63622, -0.6975157, 2.933663, 1, 1, 1, 1, 1,
2.648887, 0.4716881, 2.089942, 1, 1, 1, 1, 1,
2.78707, 1.764508, 1.624863, 1, 1, 1, 1, 1,
3.092934, -0.5568287, 1.116718, 1, 1, 1, 1, 1,
3.136873, -0.8618602, 1.866036, 1, 1, 1, 1, 1,
3.341659, -1.067695, 3.581874, 1, 1, 1, 1, 1
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
var radius = 10.20182;
var distance = 35.83347;
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
mvMatrix.translate( -0.1120703, -0.07237077, 1.004655 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.83347);
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