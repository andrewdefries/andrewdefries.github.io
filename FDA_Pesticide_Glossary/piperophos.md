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
-2.925058, 0.8461081, -0.1045547, 1, 0, 0, 1,
-2.8903, 1.166203, -0.4710537, 1, 0.007843138, 0, 1,
-2.671439, -0.1487845, -0.9618943, 1, 0.01176471, 0, 1,
-2.658989, 0.3323045, -3.195354, 1, 0.01960784, 0, 1,
-2.629138, -1.862793, -2.584092, 1, 0.02352941, 0, 1,
-2.385519, -0.5602939, -1.370857, 1, 0.03137255, 0, 1,
-2.375859, 0.78938, -3.410296, 1, 0.03529412, 0, 1,
-2.345984, -1.204475, -0.1037875, 1, 0.04313726, 0, 1,
-2.319318, -0.06104735, -1.603543, 1, 0.04705882, 0, 1,
-2.307923, 1.064365, -1.929119, 1, 0.05490196, 0, 1,
-2.276373, 0.7613162, -3.179368, 1, 0.05882353, 0, 1,
-2.240161, -0.09943989, -2.704091, 1, 0.06666667, 0, 1,
-2.234564, 0.3278787, -1.579212, 1, 0.07058824, 0, 1,
-2.227633, -0.4402665, -2.082021, 1, 0.07843138, 0, 1,
-2.220587, 0.8064783, -3.640341, 1, 0.08235294, 0, 1,
-2.185161, -0.5569598, -2.129665, 1, 0.09019608, 0, 1,
-2.155545, 0.1560799, -1.193849, 1, 0.09411765, 0, 1,
-2.123601, -1.254336, -2.895879, 1, 0.1019608, 0, 1,
-2.060526, -0.04201049, -3.05847, 1, 0.1098039, 0, 1,
-2.053406, 2.3121, -1.12139, 1, 0.1137255, 0, 1,
-2.052388, 0.319481, -2.545301, 1, 0.1215686, 0, 1,
-2.044926, 1.007377, -1.291859, 1, 0.1254902, 0, 1,
-1.995391, -0.7279712, -2.302289, 1, 0.1333333, 0, 1,
-1.990717, -0.4122722, -2.549389, 1, 0.1372549, 0, 1,
-1.961186, 0.3344642, -1.791007, 1, 0.145098, 0, 1,
-1.958217, 0.8982338, -1.735368, 1, 0.1490196, 0, 1,
-1.938366, -0.7519709, -1.066191, 1, 0.1568628, 0, 1,
-1.936033, -0.9981206, -1.881843, 1, 0.1607843, 0, 1,
-1.916692, 0.8215542, -0.8173155, 1, 0.1686275, 0, 1,
-1.889808, 0.5505756, -1.55353, 1, 0.172549, 0, 1,
-1.885406, 0.4877475, -2.826324, 1, 0.1803922, 0, 1,
-1.868019, 1.090274, -1.674564, 1, 0.1843137, 0, 1,
-1.85998, 0.4286599, -2.933761, 1, 0.1921569, 0, 1,
-1.856305, 0.9592205, -0.3972675, 1, 0.1960784, 0, 1,
-1.848141, 0.4658882, -3.193262, 1, 0.2039216, 0, 1,
-1.830645, -0.7791636, -0.6497609, 1, 0.2117647, 0, 1,
-1.809697, -0.9075452, -3.673788, 1, 0.2156863, 0, 1,
-1.801255, -0.2109857, -2.279616, 1, 0.2235294, 0, 1,
-1.800204, 0.3891568, -2.094403, 1, 0.227451, 0, 1,
-1.761668, -1.698291, -1.183981, 1, 0.2352941, 0, 1,
-1.761366, 1.336894, -1.292439, 1, 0.2392157, 0, 1,
-1.758198, 0.2127919, -1.739159, 1, 0.2470588, 0, 1,
-1.756732, 0.5702955, -0.9714743, 1, 0.2509804, 0, 1,
-1.741508, -1.644538, -2.480144, 1, 0.2588235, 0, 1,
-1.73736, 0.6645905, -1.57135, 1, 0.2627451, 0, 1,
-1.729896, 0.7563892, -2.184331, 1, 0.2705882, 0, 1,
-1.718519, 0.8430359, -1.03891, 1, 0.2745098, 0, 1,
-1.701944, 0.5829504, 0.7240095, 1, 0.282353, 0, 1,
-1.696303, -2.311322, -2.223145, 1, 0.2862745, 0, 1,
-1.694576, -0.5270457, -3.174145, 1, 0.2941177, 0, 1,
-1.691366, 1.064934, -1.577712, 1, 0.3019608, 0, 1,
-1.68856, -0.7622107, -3.240797, 1, 0.3058824, 0, 1,
-1.654772, 1.790199, -1.092308, 1, 0.3137255, 0, 1,
-1.651074, -0.9925668, -2.123918, 1, 0.3176471, 0, 1,
-1.63893, -1.59872, -2.343073, 1, 0.3254902, 0, 1,
-1.626086, -0.6123616, -2.862647, 1, 0.3294118, 0, 1,
-1.614133, -0.8371279, -2.15382, 1, 0.3372549, 0, 1,
-1.594818, 0.04746677, -2.502192, 1, 0.3411765, 0, 1,
-1.594642, 0.8167254, -3.061827, 1, 0.3490196, 0, 1,
-1.579018, 0.1769745, -2.094718, 1, 0.3529412, 0, 1,
-1.563711, 0.2682177, -2.426148, 1, 0.3607843, 0, 1,
-1.557547, 0.4369629, -0.7021353, 1, 0.3647059, 0, 1,
-1.555942, -0.7869353, -2.134063, 1, 0.372549, 0, 1,
-1.546623, 1.021938, 0.5349312, 1, 0.3764706, 0, 1,
-1.510943, 1.327299, -1.493315, 1, 0.3843137, 0, 1,
-1.498556, -0.8246088, -2.079058, 1, 0.3882353, 0, 1,
-1.4969, 0.3067214, -0.1334654, 1, 0.3960784, 0, 1,
-1.496108, 1.965116, -0.6125441, 1, 0.4039216, 0, 1,
-1.496075, 0.159499, -2.553294, 1, 0.4078431, 0, 1,
-1.494688, -0.2390512, -1.109062, 1, 0.4156863, 0, 1,
-1.487726, -1.181244, -2.037209, 1, 0.4196078, 0, 1,
-1.479233, 0.7616519, -1.953603, 1, 0.427451, 0, 1,
-1.477199, 0.6658111, -2.244001, 1, 0.4313726, 0, 1,
-1.473428, 0.2057953, -1.764806, 1, 0.4392157, 0, 1,
-1.460747, 0.04274256, -0.06314708, 1, 0.4431373, 0, 1,
-1.453067, -0.5436212, -0.3064393, 1, 0.4509804, 0, 1,
-1.450628, 0.4737166, -0.9386099, 1, 0.454902, 0, 1,
-1.450148, -0.618245, -0.9604328, 1, 0.4627451, 0, 1,
-1.421018, 1.06445, -3.276523, 1, 0.4666667, 0, 1,
-1.414982, -0.8095084, -4.248401, 1, 0.4745098, 0, 1,
-1.407816, -0.2813435, -2.793747, 1, 0.4784314, 0, 1,
-1.401377, 1.082473, -0.9092454, 1, 0.4862745, 0, 1,
-1.398315, 0.83701, -1.632056, 1, 0.4901961, 0, 1,
-1.397969, 0.1986267, -1.417457, 1, 0.4980392, 0, 1,
-1.392942, -0.06440664, -2.160805, 1, 0.5058824, 0, 1,
-1.377035, 0.6668192, -1.50923, 1, 0.509804, 0, 1,
-1.374948, 0.4732955, -2.492055, 1, 0.5176471, 0, 1,
-1.37112, -0.4136409, -1.457269, 1, 0.5215687, 0, 1,
-1.369957, -1.791184, -2.461693, 1, 0.5294118, 0, 1,
-1.364341, -0.7965249, -3.463029, 1, 0.5333334, 0, 1,
-1.363009, -0.1671687, -2.676679, 1, 0.5411765, 0, 1,
-1.35997, -0.3730676, -3.06247, 1, 0.5450981, 0, 1,
-1.3527, -0.2526588, -2.780625, 1, 0.5529412, 0, 1,
-1.339219, -0.9728875, -2.160411, 1, 0.5568628, 0, 1,
-1.338272, -0.6510948, -2.404994, 1, 0.5647059, 0, 1,
-1.336842, 0.8203171, 0.8950247, 1, 0.5686275, 0, 1,
-1.33327, -1.220807, -1.401036, 1, 0.5764706, 0, 1,
-1.323343, 0.8035672, -1.491315, 1, 0.5803922, 0, 1,
-1.310518, 0.3326502, -2.349629, 1, 0.5882353, 0, 1,
-1.297721, -0.2550183, -1.47413, 1, 0.5921569, 0, 1,
-1.295437, 1.314994, -0.8360586, 1, 0.6, 0, 1,
-1.294256, -1.195132, -2.986063, 1, 0.6078432, 0, 1,
-1.293141, -0.2564934, -1.984519, 1, 0.6117647, 0, 1,
-1.292041, -1.304257, -2.58196, 1, 0.6196079, 0, 1,
-1.27962, -1.452329, -2.126549, 1, 0.6235294, 0, 1,
-1.270192, -0.8799229, -2.012996, 1, 0.6313726, 0, 1,
-1.269842, -0.4331227, 0.1386772, 1, 0.6352941, 0, 1,
-1.268038, 0.3836655, -0.8440662, 1, 0.6431373, 0, 1,
-1.265873, 1.018735, -1.802528, 1, 0.6470588, 0, 1,
-1.257508, -0.01969926, -3.121869, 1, 0.654902, 0, 1,
-1.25174, -0.2395062, 1.141092, 1, 0.6588235, 0, 1,
-1.248685, 0.3390016, 0.1776156, 1, 0.6666667, 0, 1,
-1.237104, 1.08871, -1.156044, 1, 0.6705883, 0, 1,
-1.220003, 0.6614878, -1.565371, 1, 0.6784314, 0, 1,
-1.218966, 1.031723, 0.4998976, 1, 0.682353, 0, 1,
-1.218324, 0.4937688, -1.632587, 1, 0.6901961, 0, 1,
-1.216282, 1.318679, 0.60179, 1, 0.6941177, 0, 1,
-1.211454, -0.4607178, -1.760831, 1, 0.7019608, 0, 1,
-1.199431, 0.3022028, -1.937702, 1, 0.7098039, 0, 1,
-1.199025, -0.9225313, -3.583623, 1, 0.7137255, 0, 1,
-1.193887, -1.881328, -2.222029, 1, 0.7215686, 0, 1,
-1.192391, 1.270173, 0.8210922, 1, 0.7254902, 0, 1,
-1.19221, 1.005602, -2.096996, 1, 0.7333333, 0, 1,
-1.181586, 0.7011073, -0.3180153, 1, 0.7372549, 0, 1,
-1.180248, 0.1638966, -1.856141, 1, 0.7450981, 0, 1,
-1.172454, -0.9654373, -3.149496, 1, 0.7490196, 0, 1,
-1.166505, 0.4918456, 0.4287431, 1, 0.7568628, 0, 1,
-1.16083, -0.1265792, -0.9121948, 1, 0.7607843, 0, 1,
-1.154853, -0.4078301, -1.732512, 1, 0.7686275, 0, 1,
-1.152594, 0.9250072, -1.067134, 1, 0.772549, 0, 1,
-1.150393, -0.7577551, -2.685076, 1, 0.7803922, 0, 1,
-1.150194, 0.061577, 1.612404, 1, 0.7843137, 0, 1,
-1.143697, 0.134207, -1.894073, 1, 0.7921569, 0, 1,
-1.139496, -1.660412, -3.673841, 1, 0.7960784, 0, 1,
-1.133872, -1.752344, -2.199952, 1, 0.8039216, 0, 1,
-1.129537, 1.448506, -0.1199401, 1, 0.8117647, 0, 1,
-1.124673, -1.088018, -1.031994, 1, 0.8156863, 0, 1,
-1.120456, 1.418622, 0.08276028, 1, 0.8235294, 0, 1,
-1.118144, -0.1423672, -2.301096, 1, 0.827451, 0, 1,
-1.116598, -0.5381534, -2.783731, 1, 0.8352941, 0, 1,
-1.114884, 0.5385839, -2.105738, 1, 0.8392157, 0, 1,
-1.106371, -2.151598, -0.6821856, 1, 0.8470588, 0, 1,
-1.105126, 0.3441504, -0.7301341, 1, 0.8509804, 0, 1,
-1.099716, -0.3136995, -1.179239, 1, 0.8588235, 0, 1,
-1.097845, -0.8264505, -0.4492166, 1, 0.8627451, 0, 1,
-1.089732, -0.989207, -1.398142, 1, 0.8705882, 0, 1,
-1.086651, 0.4590345, -0.4869981, 1, 0.8745098, 0, 1,
-1.081599, -0.3919766, -1.28105, 1, 0.8823529, 0, 1,
-1.078602, 1.719171, 0.3132752, 1, 0.8862745, 0, 1,
-1.071802, -0.8360007, -2.757683, 1, 0.8941177, 0, 1,
-1.071139, -0.19474, -0.1297833, 1, 0.8980392, 0, 1,
-1.057879, -0.2146236, 0.2528011, 1, 0.9058824, 0, 1,
-1.057342, 0.8723254, -0.7967511, 1, 0.9137255, 0, 1,
-1.044718, -0.5209367, -3.190988, 1, 0.9176471, 0, 1,
-1.039003, -0.3499649, -1.464405, 1, 0.9254902, 0, 1,
-1.038903, 0.6293494, -2.087617, 1, 0.9294118, 0, 1,
-1.022655, 0.1461647, -0.622184, 1, 0.9372549, 0, 1,
-1.019352, -0.9987345, -2.911463, 1, 0.9411765, 0, 1,
-1.017966, -1.320972, -2.02985, 1, 0.9490196, 0, 1,
-1.005286, -1.216389, -2.409136, 1, 0.9529412, 0, 1,
-1.005104, 3.211473, -0.2400963, 1, 0.9607843, 0, 1,
-1.003796, -1.215263, -3.866788, 1, 0.9647059, 0, 1,
-1.002113, -0.3237012, -1.630468, 1, 0.972549, 0, 1,
-0.998606, -0.4826635, -1.480872, 1, 0.9764706, 0, 1,
-0.9966241, 0.1315082, -1.667553, 1, 0.9843137, 0, 1,
-0.993682, 0.3267317, 0.6579357, 1, 0.9882353, 0, 1,
-0.9883947, -2.471939, -2.45403, 1, 0.9960784, 0, 1,
-0.9838168, -0.1607336, -2.06546, 0.9960784, 1, 0, 1,
-0.9836, 0.5194246, 1.060538, 0.9921569, 1, 0, 1,
-0.9809077, 0.09331719, -2.152964, 0.9843137, 1, 0, 1,
-0.9781969, -0.784345, -2.92887, 0.9803922, 1, 0, 1,
-0.9770941, -1.255376, -2.746161, 0.972549, 1, 0, 1,
-0.9744687, -2.157695, -1.001162, 0.9686275, 1, 0, 1,
-0.9668936, 0.3237839, -2.210198, 0.9607843, 1, 0, 1,
-0.9668754, 0.3523281, -1.026413, 0.9568627, 1, 0, 1,
-0.9637754, 0.3145779, -0.9157717, 0.9490196, 1, 0, 1,
-0.9611473, -0.4791421, -2.987085, 0.945098, 1, 0, 1,
-0.959272, 1.276158, -0.3446973, 0.9372549, 1, 0, 1,
-0.957248, -1.401588, -1.080308, 0.9333333, 1, 0, 1,
-0.9492342, -1.171701, -3.241114, 0.9254902, 1, 0, 1,
-0.9452288, -0.4948662, -3.208489, 0.9215686, 1, 0, 1,
-0.9423556, -1.399502, -2.039348, 0.9137255, 1, 0, 1,
-0.9421985, -0.05810519, -2.750694, 0.9098039, 1, 0, 1,
-0.9373707, 2.254175, 1.474642, 0.9019608, 1, 0, 1,
-0.9360411, 0.1423103, -2.430166, 0.8941177, 1, 0, 1,
-0.9347287, -0.07227939, -1.260795, 0.8901961, 1, 0, 1,
-0.9281108, -1.030843, -1.350643, 0.8823529, 1, 0, 1,
-0.9260386, 0.5736923, -0.477575, 0.8784314, 1, 0, 1,
-0.924384, -1.375749, -2.27514, 0.8705882, 1, 0, 1,
-0.9186044, -1.476083, -4.103107, 0.8666667, 1, 0, 1,
-0.9164981, 1.514565, -0.1616905, 0.8588235, 1, 0, 1,
-0.9152822, 1.244808, -0.3099689, 0.854902, 1, 0, 1,
-0.9084618, 1.519431, -0.3333635, 0.8470588, 1, 0, 1,
-0.9083662, -1.717453, -1.636833, 0.8431373, 1, 0, 1,
-0.9081376, 0.8022624, -0.1316003, 0.8352941, 1, 0, 1,
-0.8997796, 0.5453644, -1.697484, 0.8313726, 1, 0, 1,
-0.8929591, 1.828333, -0.7896951, 0.8235294, 1, 0, 1,
-0.891613, 1.131633, -1.363801, 0.8196079, 1, 0, 1,
-0.8900466, -1.026035, -1.564751, 0.8117647, 1, 0, 1,
-0.8867163, 2.544182, -1.478908, 0.8078431, 1, 0, 1,
-0.8851575, 0.730987, -2.293097, 0.8, 1, 0, 1,
-0.8686852, 0.3897894, -0.8543137, 0.7921569, 1, 0, 1,
-0.8634895, -1.067116, -2.867944, 0.7882353, 1, 0, 1,
-0.8617101, 0.633931, -1.608736, 0.7803922, 1, 0, 1,
-0.8553775, -0.5561233, -1.261667, 0.7764706, 1, 0, 1,
-0.8533743, 1.485121, -0.4145561, 0.7686275, 1, 0, 1,
-0.8514839, 1.825469, 0.635736, 0.7647059, 1, 0, 1,
-0.8415868, 1.341291, 0.04300212, 0.7568628, 1, 0, 1,
-0.839174, -1.004667, -2.407193, 0.7529412, 1, 0, 1,
-0.8386066, 0.819719, -0.007863697, 0.7450981, 1, 0, 1,
-0.827557, -0.3754813, -2.305655, 0.7411765, 1, 0, 1,
-0.8253016, -1.111444, -1.499178, 0.7333333, 1, 0, 1,
-0.8155272, -0.8673482, -1.314504, 0.7294118, 1, 0, 1,
-0.8142365, 0.06192259, -2.702785, 0.7215686, 1, 0, 1,
-0.8128447, -1.132528, -1.594067, 0.7176471, 1, 0, 1,
-0.8123164, -1.038211, -2.65388, 0.7098039, 1, 0, 1,
-0.811553, 0.09566543, -1.144719, 0.7058824, 1, 0, 1,
-0.8113292, 1.533246, -1.55274, 0.6980392, 1, 0, 1,
-0.8112916, -0.4659745, -1.476414, 0.6901961, 1, 0, 1,
-0.8111286, -1.057994, -2.234968, 0.6862745, 1, 0, 1,
-0.8095186, 0.9458901, 0.06802946, 0.6784314, 1, 0, 1,
-0.8074471, 1.063789, -0.7848738, 0.6745098, 1, 0, 1,
-0.8041152, 0.8623958, -1.472396, 0.6666667, 1, 0, 1,
-0.8010091, 0.8107199, 0.119238, 0.6627451, 1, 0, 1,
-0.7976749, -1.493778, -0.8891994, 0.654902, 1, 0, 1,
-0.7973551, 0.8270459, -0.6640092, 0.6509804, 1, 0, 1,
-0.7970684, -1.184687, -4.062303, 0.6431373, 1, 0, 1,
-0.7959686, -0.4247252, -0.7354855, 0.6392157, 1, 0, 1,
-0.7914864, -1.745033, -3.014892, 0.6313726, 1, 0, 1,
-0.7825879, -0.9686793, -2.213195, 0.627451, 1, 0, 1,
-0.779622, 0.1374278, -1.711932, 0.6196079, 1, 0, 1,
-0.7794247, -1.742402, -4.621301, 0.6156863, 1, 0, 1,
-0.7764259, 0.712681, -1.2518, 0.6078432, 1, 0, 1,
-0.7696263, 1.370722, -0.7607074, 0.6039216, 1, 0, 1,
-0.7544172, -0.3207418, -3.372419, 0.5960785, 1, 0, 1,
-0.7349022, 1.486154, -0.5458603, 0.5882353, 1, 0, 1,
-0.7282985, -0.2634766, -3.653699, 0.5843138, 1, 0, 1,
-0.7278897, 1.227086, 0.1211902, 0.5764706, 1, 0, 1,
-0.7269078, 0.2381871, -1.256827, 0.572549, 1, 0, 1,
-0.7151538, -1.658955, -2.774674, 0.5647059, 1, 0, 1,
-0.7115632, 1.852996, -0.5855708, 0.5607843, 1, 0, 1,
-0.708955, -1.015175, -1.182356, 0.5529412, 1, 0, 1,
-0.7043325, 1.506228, 0.6449129, 0.5490196, 1, 0, 1,
-0.7038266, 0.09889866, -1.501721, 0.5411765, 1, 0, 1,
-0.6978446, -1.137067, -3.493239, 0.5372549, 1, 0, 1,
-0.6970415, 0.1015412, -1.120305, 0.5294118, 1, 0, 1,
-0.6939617, 2.939285, 1.892636, 0.5254902, 1, 0, 1,
-0.6937771, -0.2309473, -0.7887898, 0.5176471, 1, 0, 1,
-0.6880513, -0.3038142, -1.991236, 0.5137255, 1, 0, 1,
-0.6846745, -0.3809172, -1.177195, 0.5058824, 1, 0, 1,
-0.6840426, 0.596169, -1.734896, 0.5019608, 1, 0, 1,
-0.6834112, -0.3997963, -2.811016, 0.4941176, 1, 0, 1,
-0.6813895, 0.5371177, -1.514998, 0.4862745, 1, 0, 1,
-0.6773506, 0.3997498, -1.367241, 0.4823529, 1, 0, 1,
-0.6765036, -1.39027, -1.383096, 0.4745098, 1, 0, 1,
-0.6745535, 1.423584, -0.9085299, 0.4705882, 1, 0, 1,
-0.6730162, 1.91173, -0.3291964, 0.4627451, 1, 0, 1,
-0.6697104, 0.3672645, -1.395564, 0.4588235, 1, 0, 1,
-0.6673166, -0.9779634, -2.722217, 0.4509804, 1, 0, 1,
-0.6666421, -0.2178696, -2.319125, 0.4470588, 1, 0, 1,
-0.662078, -0.7856116, -2.670892, 0.4392157, 1, 0, 1,
-0.6581674, -0.1794901, -3.178208, 0.4352941, 1, 0, 1,
-0.6575266, -0.7502059, -1.416849, 0.427451, 1, 0, 1,
-0.6567746, -0.1558996, -2.282575, 0.4235294, 1, 0, 1,
-0.6459736, 1.12642, -0.1546017, 0.4156863, 1, 0, 1,
-0.6451806, 0.0722947, -1.44115, 0.4117647, 1, 0, 1,
-0.6411578, 2.345499, -0.826328, 0.4039216, 1, 0, 1,
-0.6376696, 2.323667, 1.106401, 0.3960784, 1, 0, 1,
-0.6354878, 1.461792, -0.9850048, 0.3921569, 1, 0, 1,
-0.6342497, 0.8560429, -0.8624106, 0.3843137, 1, 0, 1,
-0.6336238, -0.8186054, -4.066948, 0.3803922, 1, 0, 1,
-0.6327462, 0.4274733, -2.290404, 0.372549, 1, 0, 1,
-0.6268507, -1.024889, -0.886688, 0.3686275, 1, 0, 1,
-0.6201404, 0.7234555, -1.137949, 0.3607843, 1, 0, 1,
-0.6185208, 1.186408, -0.07460219, 0.3568628, 1, 0, 1,
-0.6176926, 2.319903, 0.2627197, 0.3490196, 1, 0, 1,
-0.6159246, -0.14956, -0.461538, 0.345098, 1, 0, 1,
-0.613726, -0.3053654, -1.481611, 0.3372549, 1, 0, 1,
-0.6121047, 0.02564618, -1.726871, 0.3333333, 1, 0, 1,
-0.6027895, -0.1631504, 0.4349138, 0.3254902, 1, 0, 1,
-0.6026787, 0.5410676, 0.5442029, 0.3215686, 1, 0, 1,
-0.5986197, 0.7606165, -1.111644, 0.3137255, 1, 0, 1,
-0.5985734, -1.007876, -1.462108, 0.3098039, 1, 0, 1,
-0.5975615, -0.03698377, -3.20004, 0.3019608, 1, 0, 1,
-0.5973598, -1.312849, -1.494738, 0.2941177, 1, 0, 1,
-0.5967528, -0.4394172, -1.648865, 0.2901961, 1, 0, 1,
-0.5962899, 0.4727719, 0.1897741, 0.282353, 1, 0, 1,
-0.5892161, -0.09433258, -1.923866, 0.2784314, 1, 0, 1,
-0.5850078, 1.808459, -0.7425503, 0.2705882, 1, 0, 1,
-0.5766191, -0.844264, -1.198857, 0.2666667, 1, 0, 1,
-0.5732764, -0.4154897, -2.482404, 0.2588235, 1, 0, 1,
-0.5714914, -0.578749, -2.449255, 0.254902, 1, 0, 1,
-0.5606395, 0.08999334, -0.9250085, 0.2470588, 1, 0, 1,
-0.5590054, -0.3664821, -3.065824, 0.2431373, 1, 0, 1,
-0.5581557, 0.9987811, 0.01036927, 0.2352941, 1, 0, 1,
-0.5580397, 1.541952, 0.8849093, 0.2313726, 1, 0, 1,
-0.5547619, 0.2200276, -0.4782701, 0.2235294, 1, 0, 1,
-0.5522678, -0.1451289, -2.854901, 0.2196078, 1, 0, 1,
-0.5496626, 0.2242284, -2.02215, 0.2117647, 1, 0, 1,
-0.5473958, 1.062545, -1.875586, 0.2078431, 1, 0, 1,
-0.5469997, 0.7266213, -0.474782, 0.2, 1, 0, 1,
-0.5384055, 0.1714575, -0.6915082, 0.1921569, 1, 0, 1,
-0.5368694, 0.4697099, -0.02596659, 0.1882353, 1, 0, 1,
-0.532777, 1.177319, 1.383375, 0.1803922, 1, 0, 1,
-0.5311146, -0.6497676, -3.237596, 0.1764706, 1, 0, 1,
-0.5249619, 0.7342642, -0.9494416, 0.1686275, 1, 0, 1,
-0.5212743, 0.0003606329, -0.7371283, 0.1647059, 1, 0, 1,
-0.51393, -0.5921649, -4.34832, 0.1568628, 1, 0, 1,
-0.504039, 0.3829412, -0.3059942, 0.1529412, 1, 0, 1,
-0.5029345, 2.36619, -0.08914965, 0.145098, 1, 0, 1,
-0.5026217, -0.7380494, -3.341829, 0.1411765, 1, 0, 1,
-0.5022604, -0.6368544, -2.499375, 0.1333333, 1, 0, 1,
-0.500578, 0.03086933, -1.364214, 0.1294118, 1, 0, 1,
-0.4949279, 1.767383, -1.288622, 0.1215686, 1, 0, 1,
-0.4904287, 1.097962, -1.019818, 0.1176471, 1, 0, 1,
-0.4881486, -0.7799023, -3.186533, 0.1098039, 1, 0, 1,
-0.4861223, 0.03227725, -2.721474, 0.1058824, 1, 0, 1,
-0.4826575, -0.9759855, -3.97039, 0.09803922, 1, 0, 1,
-0.479778, 0.6422524, 0.1812181, 0.09019608, 1, 0, 1,
-0.4797377, 1.067969, -1.477789, 0.08627451, 1, 0, 1,
-0.4778485, -1.35723, -2.994988, 0.07843138, 1, 0, 1,
-0.4769507, 0.8084967, -1.216102, 0.07450981, 1, 0, 1,
-0.4767484, 0.03058887, -1.230948, 0.06666667, 1, 0, 1,
-0.469246, 0.4534197, -1.153554, 0.0627451, 1, 0, 1,
-0.4673631, 0.4176413, -1.953511, 0.05490196, 1, 0, 1,
-0.4619545, -1.097546, -1.397544, 0.05098039, 1, 0, 1,
-0.4566208, -0.3040101, -1.483638, 0.04313726, 1, 0, 1,
-0.4560673, -0.7659972, -1.985628, 0.03921569, 1, 0, 1,
-0.4546361, -0.447785, -1.805364, 0.03137255, 1, 0, 1,
-0.4544682, -0.47326, -1.934972, 0.02745098, 1, 0, 1,
-0.4543862, 2.350147, 0.5122724, 0.01960784, 1, 0, 1,
-0.4535042, 0.7495813, -1.308397, 0.01568628, 1, 0, 1,
-0.453169, -1.426478, -3.293276, 0.007843138, 1, 0, 1,
-0.4483676, 1.000903, -0.5042456, 0.003921569, 1, 0, 1,
-0.4465359, 0.1412609, -0.8885744, 0, 1, 0.003921569, 1,
-0.4428703, 0.8625911, -1.47318, 0, 1, 0.01176471, 1,
-0.4420485, 0.2134142, -1.385752, 0, 1, 0.01568628, 1,
-0.4415224, 0.4986658, -0.01416808, 0, 1, 0.02352941, 1,
-0.4410304, 0.1158235, -1.468117, 0, 1, 0.02745098, 1,
-0.4401957, -0.2590694, -3.387192, 0, 1, 0.03529412, 1,
-0.439516, 0.05114986, 0.9685035, 0, 1, 0.03921569, 1,
-0.4378268, -0.1487073, -2.365492, 0, 1, 0.04705882, 1,
-0.4369687, -0.696077, -3.555883, 0, 1, 0.05098039, 1,
-0.4359964, 0.3421, -0.8460041, 0, 1, 0.05882353, 1,
-0.4354572, -1.235206, -3.116955, 0, 1, 0.0627451, 1,
-0.4341575, -0.6815888, -0.5512195, 0, 1, 0.07058824, 1,
-0.4340948, 0.4679812, -1.257716, 0, 1, 0.07450981, 1,
-0.4337638, -1.777605, -3.906414, 0, 1, 0.08235294, 1,
-0.4307883, -0.8643996, -1.713912, 0, 1, 0.08627451, 1,
-0.4237497, -0.1310912, -2.274667, 0, 1, 0.09411765, 1,
-0.4194179, -2.22075, -3.214295, 0, 1, 0.1019608, 1,
-0.4167878, 2.046921, 0.2458742, 0, 1, 0.1058824, 1,
-0.4138265, 0.1948528, -2.121714, 0, 1, 0.1137255, 1,
-0.4138101, 1.525868, -0.9331877, 0, 1, 0.1176471, 1,
-0.4111267, -0.4854579, -3.638114, 0, 1, 0.1254902, 1,
-0.409363, -0.1391242, -0.9289516, 0, 1, 0.1294118, 1,
-0.4079241, 1.514537, 1.17746, 0, 1, 0.1372549, 1,
-0.4030905, -0.9224095, -5.234494, 0, 1, 0.1411765, 1,
-0.3989007, 0.4376963, -1.650955, 0, 1, 0.1490196, 1,
-0.3984894, 0.1640687, 0.707609, 0, 1, 0.1529412, 1,
-0.3968872, 0.4918844, -0.8175459, 0, 1, 0.1607843, 1,
-0.392116, 0.5522053, -0.9600313, 0, 1, 0.1647059, 1,
-0.392049, 1.825578, -0.6735868, 0, 1, 0.172549, 1,
-0.3902629, -0.4251809, -3.213937, 0, 1, 0.1764706, 1,
-0.3874308, 2.396116, 1.783691, 0, 1, 0.1843137, 1,
-0.3873888, -0.1116747, -2.638963, 0, 1, 0.1882353, 1,
-0.3848926, 0.5467866, 0.2421085, 0, 1, 0.1960784, 1,
-0.3841225, 0.5066622, -0.463381, 0, 1, 0.2039216, 1,
-0.3840491, 0.4494549, -2.366547, 0, 1, 0.2078431, 1,
-0.3834781, -1.487442, -2.794745, 0, 1, 0.2156863, 1,
-0.3823786, 0.6579434, -0.6221781, 0, 1, 0.2196078, 1,
-0.3705254, 0.26497, -1.146734, 0, 1, 0.227451, 1,
-0.361351, 0.1471842, -0.68336, 0, 1, 0.2313726, 1,
-0.3595396, -0.01825382, -0.9060592, 0, 1, 0.2392157, 1,
-0.3592023, 0.9140583, 1.940485, 0, 1, 0.2431373, 1,
-0.3585508, -0.07479002, -3.013808, 0, 1, 0.2509804, 1,
-0.3578617, 0.9527074, -1.950644, 0, 1, 0.254902, 1,
-0.3566123, -0.3550124, -3.701884, 0, 1, 0.2627451, 1,
-0.3555753, 1.349403, -0.6199242, 0, 1, 0.2666667, 1,
-0.3531646, -2.307188, -3.357608, 0, 1, 0.2745098, 1,
-0.3529294, 1.62896, 0.7596754, 0, 1, 0.2784314, 1,
-0.3518871, -0.398426, -2.609412, 0, 1, 0.2862745, 1,
-0.3501475, -0.3758107, -2.057292, 0, 1, 0.2901961, 1,
-0.3482913, 0.8235475, -0.5118706, 0, 1, 0.2980392, 1,
-0.3457429, 1.080742, -0.0968584, 0, 1, 0.3058824, 1,
-0.3444243, -2.068333, -3.222964, 0, 1, 0.3098039, 1,
-0.3434244, 0.387925, 2.373452, 0, 1, 0.3176471, 1,
-0.3424969, -0.9338582, -3.17361, 0, 1, 0.3215686, 1,
-0.3423213, -1.283918, -1.697834, 0, 1, 0.3294118, 1,
-0.3343988, -1.124364, -4.298733, 0, 1, 0.3333333, 1,
-0.3321009, 0.8674299, 0.8280044, 0, 1, 0.3411765, 1,
-0.3309675, 0.7130094, 0.4141788, 0, 1, 0.345098, 1,
-0.3298694, -1.174303, -4.322012, 0, 1, 0.3529412, 1,
-0.3268816, 0.8743343, -1.038113, 0, 1, 0.3568628, 1,
-0.3260756, 1.737659, -1.377978, 0, 1, 0.3647059, 1,
-0.3221216, -0.02230263, -1.983497, 0, 1, 0.3686275, 1,
-0.3218194, -0.5725073, -2.298132, 0, 1, 0.3764706, 1,
-0.3174813, 0.4887805, 0.4438519, 0, 1, 0.3803922, 1,
-0.3165269, 0.1283451, -1.15883, 0, 1, 0.3882353, 1,
-0.3153776, -1.761869, -4.725117, 0, 1, 0.3921569, 1,
-0.3141944, -0.2773369, -2.448469, 0, 1, 0.4, 1,
-0.3129821, -0.5777004, -2.103067, 0, 1, 0.4078431, 1,
-0.3087984, -1.034735, -3.473763, 0, 1, 0.4117647, 1,
-0.3066612, -1.294729, -2.139676, 0, 1, 0.4196078, 1,
-0.2945259, 0.0737544, -0.9444165, 0, 1, 0.4235294, 1,
-0.2895394, 1.051625, -1.13601, 0, 1, 0.4313726, 1,
-0.2876273, 0.05558626, -3.043909, 0, 1, 0.4352941, 1,
-0.2875379, -0.5089883, -2.280459, 0, 1, 0.4431373, 1,
-0.2808238, -0.9378176, -2.827466, 0, 1, 0.4470588, 1,
-0.2776925, 0.5737123, -1.686163, 0, 1, 0.454902, 1,
-0.2774202, 0.7293617, -0.1329273, 0, 1, 0.4588235, 1,
-0.2752073, -0.3405146, -2.868742, 0, 1, 0.4666667, 1,
-0.2746154, -1.531273, -3.411027, 0, 1, 0.4705882, 1,
-0.2713941, -0.09240861, -0.5533965, 0, 1, 0.4784314, 1,
-0.2697424, -0.8167551, -2.902002, 0, 1, 0.4823529, 1,
-0.2682571, -1.983315, -2.58698, 0, 1, 0.4901961, 1,
-0.2654372, -1.088423, -2.665463, 0, 1, 0.4941176, 1,
-0.2634535, -0.7296315, -2.570045, 0, 1, 0.5019608, 1,
-0.2624075, 0.2883001, -0.760187, 0, 1, 0.509804, 1,
-0.2614124, -2.641663, -2.595929, 0, 1, 0.5137255, 1,
-0.2609279, 0.282613, -1.518507, 0, 1, 0.5215687, 1,
-0.2538263, -1.69693, -2.750776, 0, 1, 0.5254902, 1,
-0.253112, -2.079921, -3.619946, 0, 1, 0.5333334, 1,
-0.2417498, 0.632866, -0.2471975, 0, 1, 0.5372549, 1,
-0.2399787, -0.7820137, -2.721158, 0, 1, 0.5450981, 1,
-0.2392139, -0.4610106, -1.123284, 0, 1, 0.5490196, 1,
-0.2373971, -0.0008391789, -1.729232, 0, 1, 0.5568628, 1,
-0.2370595, 1.50554, 0.3272476, 0, 1, 0.5607843, 1,
-0.2344433, 1.692525, 1.350547, 0, 1, 0.5686275, 1,
-0.2291528, 0.05588032, -1.460998, 0, 1, 0.572549, 1,
-0.2253374, 1.584062, -0.6517913, 0, 1, 0.5803922, 1,
-0.2251356, 1.292379, 0.369756, 0, 1, 0.5843138, 1,
-0.2250466, 1.851378, -0.5712057, 0, 1, 0.5921569, 1,
-0.2183854, 0.248777, -0.2671187, 0, 1, 0.5960785, 1,
-0.2180796, 1.882253, -0.3658819, 0, 1, 0.6039216, 1,
-0.2162877, 0.2670027, 0.3174362, 0, 1, 0.6117647, 1,
-0.2151769, -0.1758642, -2.469401, 0, 1, 0.6156863, 1,
-0.2072749, 0.9486634, 0.168272, 0, 1, 0.6235294, 1,
-0.2070687, -2.182325, -3.243357, 0, 1, 0.627451, 1,
-0.2069095, -0.6923352, -3.122808, 0, 1, 0.6352941, 1,
-0.2061969, -0.8539881, -3.445382, 0, 1, 0.6392157, 1,
-0.2043454, 0.3220294, -1.425523, 0, 1, 0.6470588, 1,
-0.2000934, 1.516025, 1.494061, 0, 1, 0.6509804, 1,
-0.1993426, 0.8341948, 1.590617, 0, 1, 0.6588235, 1,
-0.1990657, 0.698499, -0.5671422, 0, 1, 0.6627451, 1,
-0.193154, -0.2193224, -2.695319, 0, 1, 0.6705883, 1,
-0.1906536, 1.467489, 0.5868841, 0, 1, 0.6745098, 1,
-0.1896529, 1.262817, -1.074494, 0, 1, 0.682353, 1,
-0.1887681, 1.012055, -1.360005, 0, 1, 0.6862745, 1,
-0.1878397, -1.172452, -4.568088, 0, 1, 0.6941177, 1,
-0.1871144, -0.3636077, -1.497418, 0, 1, 0.7019608, 1,
-0.1842069, -1.637207, -4.589952, 0, 1, 0.7058824, 1,
-0.1821511, 0.9769325, 0.8969304, 0, 1, 0.7137255, 1,
-0.1806515, -1.071901, -3.796758, 0, 1, 0.7176471, 1,
-0.1799869, -0.3343203, -3.388138, 0, 1, 0.7254902, 1,
-0.1789232, -0.9107282, -2.466617, 0, 1, 0.7294118, 1,
-0.1757501, 0.5129365, -0.8820621, 0, 1, 0.7372549, 1,
-0.1742277, -0.01108697, -1.287778, 0, 1, 0.7411765, 1,
-0.1710887, -1.389813, -2.391012, 0, 1, 0.7490196, 1,
-0.1662114, -0.4690706, -2.808449, 0, 1, 0.7529412, 1,
-0.166068, 0.8370681, -1.496644, 0, 1, 0.7607843, 1,
-0.1635603, -1.057205, -3.57539, 0, 1, 0.7647059, 1,
-0.1476565, -0.4493993, -1.266834, 0, 1, 0.772549, 1,
-0.1462053, 0.7072887, -2.409373, 0, 1, 0.7764706, 1,
-0.1461497, -1.918003, -3.663357, 0, 1, 0.7843137, 1,
-0.1453277, -0.4097134, -2.037495, 0, 1, 0.7882353, 1,
-0.1443021, -0.645873, -3.333825, 0, 1, 0.7960784, 1,
-0.143355, 0.6305443, -0.7265755, 0, 1, 0.8039216, 1,
-0.141214, 0.2063282, -1.073088, 0, 1, 0.8078431, 1,
-0.1397685, 1.185372, -1.192516, 0, 1, 0.8156863, 1,
-0.1356533, -0.3293268, -2.986595, 0, 1, 0.8196079, 1,
-0.1352049, -2.819789, -3.21238, 0, 1, 0.827451, 1,
-0.1350932, -0.3622382, -0.8652459, 0, 1, 0.8313726, 1,
-0.1344861, 0.807342, -1.85059, 0, 1, 0.8392157, 1,
-0.1335035, 0.772229, 1.682116, 0, 1, 0.8431373, 1,
-0.1327942, -1.431515, -1.108884, 0, 1, 0.8509804, 1,
-0.1327835, 0.6662654, -0.8582723, 0, 1, 0.854902, 1,
-0.1316863, -1.114625, -3.075362, 0, 1, 0.8627451, 1,
-0.1291209, -0.3066934, -1.384437, 0, 1, 0.8666667, 1,
-0.1285402, 0.1506783, -0.7111521, 0, 1, 0.8745098, 1,
-0.1282419, 0.01333791, -1.853022, 0, 1, 0.8784314, 1,
-0.1260325, 0.3380891, 0.3130788, 0, 1, 0.8862745, 1,
-0.1240863, 0.2598437, -1.397902, 0, 1, 0.8901961, 1,
-0.1225212, -0.1699325, -3.393862, 0, 1, 0.8980392, 1,
-0.1189527, -0.7829028, -2.189414, 0, 1, 0.9058824, 1,
-0.118393, -0.8201305, -4.143604, 0, 1, 0.9098039, 1,
-0.1176549, 0.6902292, 2.126243, 0, 1, 0.9176471, 1,
-0.1158963, 1.539043, -0.3505392, 0, 1, 0.9215686, 1,
-0.1111966, -1.291802, -4.966083, 0, 1, 0.9294118, 1,
-0.1090962, 0.07018878, -0.9521512, 0, 1, 0.9333333, 1,
-0.1063584, 0.6194163, -1.207835, 0, 1, 0.9411765, 1,
-0.1021238, 0.7003866, -0.9249594, 0, 1, 0.945098, 1,
-0.09787581, 0.826339, 0.20262, 0, 1, 0.9529412, 1,
-0.09599666, -0.2607309, -2.199381, 0, 1, 0.9568627, 1,
-0.09333149, -1.930462, -3.808537, 0, 1, 0.9647059, 1,
-0.09255518, -1.225623, -2.429473, 0, 1, 0.9686275, 1,
-0.08450011, 0.5081859, -0.9296672, 0, 1, 0.9764706, 1,
-0.07797966, -1.351841, -4.256371, 0, 1, 0.9803922, 1,
-0.07081994, 0.8425385, -0.5275386, 0, 1, 0.9882353, 1,
-0.07065411, -0.2205557, -1.171227, 0, 1, 0.9921569, 1,
-0.07046728, 0.6681634, -0.453264, 0, 1, 1, 1,
-0.06766753, 0.6194673, -1.722128, 0, 0.9921569, 1, 1,
-0.06751529, 0.4054708, -0.7886191, 0, 0.9882353, 1, 1,
-0.06670979, 1.471229, -1.334978, 0, 0.9803922, 1, 1,
-0.06394956, 0.1465768, -1.92215, 0, 0.9764706, 1, 1,
-0.06151232, -0.2611232, -2.684797, 0, 0.9686275, 1, 1,
-0.06083735, 0.3504224, -0.9481928, 0, 0.9647059, 1, 1,
-0.06082539, -0.8827918, -1.812961, 0, 0.9568627, 1, 1,
-0.05901606, -0.5335495, -2.584, 0, 0.9529412, 1, 1,
-0.05769692, 1.524487, -1.737731, 0, 0.945098, 1, 1,
-0.04870903, -0.01030567, -2.795076, 0, 0.9411765, 1, 1,
-0.04299573, 0.9660659, -1.253614, 0, 0.9333333, 1, 1,
-0.03946735, -0.5474046, -1.736612, 0, 0.9294118, 1, 1,
-0.03621078, -1.261844, -3.542738, 0, 0.9215686, 1, 1,
-0.03600336, -1.643134, -3.332411, 0, 0.9176471, 1, 1,
-0.03452393, 0.1703673, -1.449915, 0, 0.9098039, 1, 1,
-0.03287956, -0.3005701, -3.243461, 0, 0.9058824, 1, 1,
-0.03004234, -1.09169, -1.489819, 0, 0.8980392, 1, 1,
-0.0230426, 1.467372, -1.722668, 0, 0.8901961, 1, 1,
-0.01733146, -1.455802, -4.044892, 0, 0.8862745, 1, 1,
-0.01690514, -0.881581, -3.123222, 0, 0.8784314, 1, 1,
-0.01555331, -0.4193345, -1.586847, 0, 0.8745098, 1, 1,
-0.01505734, 1.569831, -0.1034535, 0, 0.8666667, 1, 1,
-0.01411309, 0.6714413, 1.133836, 0, 0.8627451, 1, 1,
-0.01017445, -0.3262576, -1.779118, 0, 0.854902, 1, 1,
-0.00994636, 0.4132085, -1.082261, 0, 0.8509804, 1, 1,
-0.009002752, 0.2726857, -0.5980259, 0, 0.8431373, 1, 1,
0.001305725, 0.06328508, 0.1709464, 0, 0.8392157, 1, 1,
0.005999513, 0.6834411, 1.612617, 0, 0.8313726, 1, 1,
0.006234047, 0.1160003, -0.6287379, 0, 0.827451, 1, 1,
0.009660346, 0.6196847, 1.019507, 0, 0.8196079, 1, 1,
0.0107916, 0.652217, 0.1077608, 0, 0.8156863, 1, 1,
0.01093114, -0.4602114, 3.01638, 0, 0.8078431, 1, 1,
0.01101917, -0.3082501, 2.808499, 0, 0.8039216, 1, 1,
0.02112562, 1.133991, -0.2135613, 0, 0.7960784, 1, 1,
0.02161146, -0.4687082, 1.971742, 0, 0.7882353, 1, 1,
0.02377381, 1.484148, -2.349395, 0, 0.7843137, 1, 1,
0.02581844, 1.104623, -0.3281848, 0, 0.7764706, 1, 1,
0.03018444, 0.3993276, 1.087407, 0, 0.772549, 1, 1,
0.03116715, 0.767045, -1.294789, 0, 0.7647059, 1, 1,
0.03499513, -0.2592028, 3.885824, 0, 0.7607843, 1, 1,
0.0363954, -0.3050539, 3.427062, 0, 0.7529412, 1, 1,
0.03919532, 1.285964, -0.7531531, 0, 0.7490196, 1, 1,
0.04278978, 0.8984649, -0.3770976, 0, 0.7411765, 1, 1,
0.04715022, 0.6227521, 0.9831313, 0, 0.7372549, 1, 1,
0.05729079, 1.070101, 0.3913063, 0, 0.7294118, 1, 1,
0.05838153, 0.5329723, 0.9002224, 0, 0.7254902, 1, 1,
0.05875092, 1.694564, 0.2033739, 0, 0.7176471, 1, 1,
0.05939152, -0.3830524, 1.634587, 0, 0.7137255, 1, 1,
0.06644987, -0.6393111, 1.687732, 0, 0.7058824, 1, 1,
0.06820111, -0.1082471, 2.62879, 0, 0.6980392, 1, 1,
0.06889667, 0.491898, -0.3842144, 0, 0.6941177, 1, 1,
0.07052549, 0.5766494, -0.3930669, 0, 0.6862745, 1, 1,
0.07609714, -0.06072117, 2.425466, 0, 0.682353, 1, 1,
0.07859119, 1.628048, 0.230797, 0, 0.6745098, 1, 1,
0.07967632, -0.114761, 3.622183, 0, 0.6705883, 1, 1,
0.08149971, -0.4027116, 1.782892, 0, 0.6627451, 1, 1,
0.08271535, 0.3071598, 1.014923, 0, 0.6588235, 1, 1,
0.08794937, -1.286801, 3.057344, 0, 0.6509804, 1, 1,
0.08876437, -1.537246, 5.242463, 0, 0.6470588, 1, 1,
0.09039731, 1.515419, -0.7711403, 0, 0.6392157, 1, 1,
0.09534582, -0.7304154, 3.396887, 0, 0.6352941, 1, 1,
0.1005275, -0.6041828, 4.06238, 0, 0.627451, 1, 1,
0.1067644, 3.022156, -0.3379817, 0, 0.6235294, 1, 1,
0.1096589, 0.8002813, 0.6279978, 0, 0.6156863, 1, 1,
0.1111881, -0.08468481, 1.759649, 0, 0.6117647, 1, 1,
0.119291, -0.8911306, 3.559996, 0, 0.6039216, 1, 1,
0.1204307, -0.04901748, 0.7361835, 0, 0.5960785, 1, 1,
0.1207761, 1.717801, 0.08277595, 0, 0.5921569, 1, 1,
0.1210087, 0.02416866, 0.6017553, 0, 0.5843138, 1, 1,
0.1217127, -0.5879253, 2.987558, 0, 0.5803922, 1, 1,
0.1217799, -1.864935, 2.077395, 0, 0.572549, 1, 1,
0.1251461, -1.74793, 1.750353, 0, 0.5686275, 1, 1,
0.1333798, -0.5987638, 3.881087, 0, 0.5607843, 1, 1,
0.1359015, -2.518798, 1.086059, 0, 0.5568628, 1, 1,
0.1363202, 0.3183797, 0.8753507, 0, 0.5490196, 1, 1,
0.1363982, 0.5369452, 0.7086025, 0, 0.5450981, 1, 1,
0.1396718, -0.3411079, 0.8964353, 0, 0.5372549, 1, 1,
0.140552, 0.6984586, -1.807511, 0, 0.5333334, 1, 1,
0.1420131, -0.5851605, 4.981128, 0, 0.5254902, 1, 1,
0.1424085, 0.4704257, -0.01662039, 0, 0.5215687, 1, 1,
0.1442264, 0.6538371, 0.4296759, 0, 0.5137255, 1, 1,
0.1482282, 0.4486572, -0.3493674, 0, 0.509804, 1, 1,
0.1486695, -0.5544651, 3.310506, 0, 0.5019608, 1, 1,
0.1527934, -0.2790786, 3.902557, 0, 0.4941176, 1, 1,
0.1583418, -1.158888, 3.702422, 0, 0.4901961, 1, 1,
0.1644085, 1.50939, 0.1458881, 0, 0.4823529, 1, 1,
0.1650426, 0.2523834, 2.014889, 0, 0.4784314, 1, 1,
0.1682098, 0.3043391, 2.929588, 0, 0.4705882, 1, 1,
0.1793904, 1.234238, -0.04467292, 0, 0.4666667, 1, 1,
0.1799513, -1.448553, 2.843268, 0, 0.4588235, 1, 1,
0.18315, -0.02519899, 2.121024, 0, 0.454902, 1, 1,
0.1843836, 2.238324, 0.5232525, 0, 0.4470588, 1, 1,
0.1844569, 0.5604261, 0.229123, 0, 0.4431373, 1, 1,
0.193513, -1.345747, 1.789134, 0, 0.4352941, 1, 1,
0.1970812, -0.7749951, 2.645237, 0, 0.4313726, 1, 1,
0.1975379, 0.5735312, -0.19578, 0, 0.4235294, 1, 1,
0.1977197, 1.615672, 0.6618486, 0, 0.4196078, 1, 1,
0.1996855, -0.1610012, 2.504525, 0, 0.4117647, 1, 1,
0.2018852, 0.8191972, 0.3959653, 0, 0.4078431, 1, 1,
0.2082748, 0.5044423, 1.266308, 0, 0.4, 1, 1,
0.2109261, 0.7637594, 1.271674, 0, 0.3921569, 1, 1,
0.212386, 1.323478, 0.3234155, 0, 0.3882353, 1, 1,
0.2159612, -0.306652, 2.264747, 0, 0.3803922, 1, 1,
0.2179785, 0.9111366, 0.2199395, 0, 0.3764706, 1, 1,
0.2191914, 1.212352, 0.7538961, 0, 0.3686275, 1, 1,
0.2201922, -0.2228852, 0.7946019, 0, 0.3647059, 1, 1,
0.2361138, -1.065616, 2.651063, 0, 0.3568628, 1, 1,
0.2379778, -0.3591895, 3.09461, 0, 0.3529412, 1, 1,
0.2447631, -1.859438, 1.859248, 0, 0.345098, 1, 1,
0.245077, -0.1109304, 1.86679, 0, 0.3411765, 1, 1,
0.2484265, 0.4323303, 0.7294112, 0, 0.3333333, 1, 1,
0.2525648, 0.2582036, 0.9254801, 0, 0.3294118, 1, 1,
0.2546778, 0.6643185, -0.4639296, 0, 0.3215686, 1, 1,
0.254808, -1.309999, 3.141955, 0, 0.3176471, 1, 1,
0.2554342, 1.565835, 0.3557348, 0, 0.3098039, 1, 1,
0.2564482, -0.4200376, 4.19031, 0, 0.3058824, 1, 1,
0.2567669, 0.3213814, 0.6036852, 0, 0.2980392, 1, 1,
0.2575743, -0.9474394, 2.177129, 0, 0.2901961, 1, 1,
0.2580153, -0.7835531, 2.122387, 0, 0.2862745, 1, 1,
0.263796, -0.4964186, 1.921864, 0, 0.2784314, 1, 1,
0.264227, -0.7116929, 2.740947, 0, 0.2745098, 1, 1,
0.26588, -1.528288, 1.974356, 0, 0.2666667, 1, 1,
0.2678091, 0.324085, 1.757223, 0, 0.2627451, 1, 1,
0.2706218, -1.170938, 3.419945, 0, 0.254902, 1, 1,
0.2747353, -0.1109222, 2.258947, 0, 0.2509804, 1, 1,
0.2820432, -0.02074971, 0.3221838, 0, 0.2431373, 1, 1,
0.2853218, -0.2788904, 2.601914, 0, 0.2392157, 1, 1,
0.2870604, 0.002696319, 1.356128, 0, 0.2313726, 1, 1,
0.2877105, 1.352366, -0.3348677, 0, 0.227451, 1, 1,
0.2938881, -0.2008012, 1.813352, 0, 0.2196078, 1, 1,
0.2950669, -1.060928, 1.916907, 0, 0.2156863, 1, 1,
0.2993033, 0.3399162, -0.3276092, 0, 0.2078431, 1, 1,
0.3001138, 1.15097, 1.247972, 0, 0.2039216, 1, 1,
0.3024115, -0.06169678, 3.100903, 0, 0.1960784, 1, 1,
0.3037177, -2.493816, 1.94799, 0, 0.1882353, 1, 1,
0.3121037, -0.5491598, 2.878451, 0, 0.1843137, 1, 1,
0.3147278, -0.1250233, 0.9070644, 0, 0.1764706, 1, 1,
0.3193355, 0.1516178, 2.443176, 0, 0.172549, 1, 1,
0.3243873, -0.3024617, 3.264181, 0, 0.1647059, 1, 1,
0.3330337, 0.1804577, 0.439497, 0, 0.1607843, 1, 1,
0.3331752, 0.2305182, 0.7431149, 0, 0.1529412, 1, 1,
0.3338388, 0.104275, 0.9632849, 0, 0.1490196, 1, 1,
0.3416081, -2.425292, 2.525271, 0, 0.1411765, 1, 1,
0.3443738, 0.7698382, -0.04892493, 0, 0.1372549, 1, 1,
0.3463603, -0.6478954, 1.689056, 0, 0.1294118, 1, 1,
0.348206, 0.4556404, 2.277384, 0, 0.1254902, 1, 1,
0.3487214, 0.5484722, 0.260216, 0, 0.1176471, 1, 1,
0.3497307, -0.691916, 1.823367, 0, 0.1137255, 1, 1,
0.3497873, -0.227044, 2.167797, 0, 0.1058824, 1, 1,
0.3534342, 0.05226317, 0.9098744, 0, 0.09803922, 1, 1,
0.3622465, 0.3379979, -0.5474659, 0, 0.09411765, 1, 1,
0.3659206, -0.7388706, 3.857859, 0, 0.08627451, 1, 1,
0.3710567, -0.3961478, 4.043332, 0, 0.08235294, 1, 1,
0.3713828, -0.1223295, 0.8385221, 0, 0.07450981, 1, 1,
0.3755168, -0.1931698, 1.632813, 0, 0.07058824, 1, 1,
0.384293, -0.1402373, 3.299943, 0, 0.0627451, 1, 1,
0.3860645, -0.5849683, 1.077442, 0, 0.05882353, 1, 1,
0.3867606, -0.2008381, 2.926814, 0, 0.05098039, 1, 1,
0.3869482, 0.4963911, 1.049914, 0, 0.04705882, 1, 1,
0.3897482, 0.382805, 0.3821846, 0, 0.03921569, 1, 1,
0.3943735, -0.3990978, 1.273243, 0, 0.03529412, 1, 1,
0.3981024, -0.09515022, 1.221405, 0, 0.02745098, 1, 1,
0.4034767, 0.4516349, 0.6701773, 0, 0.02352941, 1, 1,
0.4043066, -0.4413854, 2.409054, 0, 0.01568628, 1, 1,
0.4069695, 0.4298784, 0.4730309, 0, 0.01176471, 1, 1,
0.4089808, -0.5206803, 2.048739, 0, 0.003921569, 1, 1,
0.4102911, 0.4637051, 1.191006, 0.003921569, 0, 1, 1,
0.4106998, -0.2280211, 0.2148934, 0.007843138, 0, 1, 1,
0.4134801, -0.1083288, 3.045103, 0.01568628, 0, 1, 1,
0.4138532, -1.629389, 4.278569, 0.01960784, 0, 1, 1,
0.4166606, -1.335063, 3.136487, 0.02745098, 0, 1, 1,
0.4193103, -0.588291, 2.131113, 0.03137255, 0, 1, 1,
0.4199487, 1.100388, 1.753428, 0.03921569, 0, 1, 1,
0.4238922, 0.4823442, 0.2268938, 0.04313726, 0, 1, 1,
0.4266623, -0.564998, 1.562865, 0.05098039, 0, 1, 1,
0.4275287, -1.608082, 1.923935, 0.05490196, 0, 1, 1,
0.4297852, 0.1745715, 0.6177331, 0.0627451, 0, 1, 1,
0.4323568, -0.2040264, 1.391136, 0.06666667, 0, 1, 1,
0.4327858, 0.1015872, 1.661253, 0.07450981, 0, 1, 1,
0.4341838, 1.051828, -0.6600119, 0.07843138, 0, 1, 1,
0.4384369, 1.145099, 1.771173, 0.08627451, 0, 1, 1,
0.4408283, -0.1488509, 0.9898192, 0.09019608, 0, 1, 1,
0.4418298, 1.124493, 0.5335945, 0.09803922, 0, 1, 1,
0.4418762, 0.3477757, 0.1194014, 0.1058824, 0, 1, 1,
0.4425082, 0.01964613, 0.1726882, 0.1098039, 0, 1, 1,
0.4432323, -1.090533, 2.212472, 0.1176471, 0, 1, 1,
0.4434458, 1.228724, -0.9359609, 0.1215686, 0, 1, 1,
0.4465691, -0.1440476, 1.796599, 0.1294118, 0, 1, 1,
0.44824, -0.02049641, 0.7547964, 0.1333333, 0, 1, 1,
0.4509324, -0.1452582, 1.601378, 0.1411765, 0, 1, 1,
0.45335, 0.1435396, 2.247322, 0.145098, 0, 1, 1,
0.4555255, -0.02289921, 1.78261, 0.1529412, 0, 1, 1,
0.4567701, 0.6456895, 0.5781159, 0.1568628, 0, 1, 1,
0.4598113, 0.3854919, 1.196885, 0.1647059, 0, 1, 1,
0.4617268, -0.8788055, 1.458047, 0.1686275, 0, 1, 1,
0.4668266, 0.5989116, -0.7958514, 0.1764706, 0, 1, 1,
0.4686407, -1.768466, 2.424142, 0.1803922, 0, 1, 1,
0.4707392, 0.4424621, 2.104558, 0.1882353, 0, 1, 1,
0.4874254, 0.8895105, 0.3987271, 0.1921569, 0, 1, 1,
0.4916132, -0.4864094, 3.413841, 0.2, 0, 1, 1,
0.4937896, -0.2953583, 3.232542, 0.2078431, 0, 1, 1,
0.4951888, -0.5240867, 1.798148, 0.2117647, 0, 1, 1,
0.4959581, 0.3349789, 1.469073, 0.2196078, 0, 1, 1,
0.5065599, 1.621042, 1.681771, 0.2235294, 0, 1, 1,
0.5076284, 0.4609704, 2.439215, 0.2313726, 0, 1, 1,
0.5078666, 0.7361748, 2.512775, 0.2352941, 0, 1, 1,
0.5133412, 0.6375275, 2.319905, 0.2431373, 0, 1, 1,
0.5213685, 1.216757, -0.05718324, 0.2470588, 0, 1, 1,
0.5227732, 0.5444104, 2.047685, 0.254902, 0, 1, 1,
0.5288942, 0.6377814, 1.971881, 0.2588235, 0, 1, 1,
0.5332111, -0.1637032, 2.172706, 0.2666667, 0, 1, 1,
0.5382396, -0.7625341, 3.033798, 0.2705882, 0, 1, 1,
0.5382479, -0.5588369, 3.748696, 0.2784314, 0, 1, 1,
0.5392305, 0.6388617, 0.917597, 0.282353, 0, 1, 1,
0.5404288, -0.6875792, 2.154692, 0.2901961, 0, 1, 1,
0.5460384, -2.598036, 3.367298, 0.2941177, 0, 1, 1,
0.5494094, -1.572064, 3.821612, 0.3019608, 0, 1, 1,
0.5496494, -0.7016421, 2.134706, 0.3098039, 0, 1, 1,
0.5500384, -0.2360013, 2.970844, 0.3137255, 0, 1, 1,
0.5552718, -0.8048214, 1.538346, 0.3215686, 0, 1, 1,
0.5555933, 1.602123, -0.4531673, 0.3254902, 0, 1, 1,
0.5559333, -0.5233267, 2.358839, 0.3333333, 0, 1, 1,
0.5562714, 1.341794, 0.4111291, 0.3372549, 0, 1, 1,
0.5572797, -1.401769, 2.963397, 0.345098, 0, 1, 1,
0.558566, 0.9176898, 1.444778, 0.3490196, 0, 1, 1,
0.5619976, -0.6365957, 1.908266, 0.3568628, 0, 1, 1,
0.5667639, -2.092635, 3.209387, 0.3607843, 0, 1, 1,
0.5673621, 0.6148347, -0.548924, 0.3686275, 0, 1, 1,
0.5706845, 2.181867, 0.5139509, 0.372549, 0, 1, 1,
0.5721924, 0.228662, 1.666059, 0.3803922, 0, 1, 1,
0.574623, 1.054158, 0.03693038, 0.3843137, 0, 1, 1,
0.5788739, -0.7937792, 2.853385, 0.3921569, 0, 1, 1,
0.581943, -1.638296, 0.5801564, 0.3960784, 0, 1, 1,
0.5871687, -1.612212, 2.408965, 0.4039216, 0, 1, 1,
0.5930178, -0.06541661, 1.37047, 0.4117647, 0, 1, 1,
0.5941504, -0.2500101, 3.521904, 0.4156863, 0, 1, 1,
0.5950899, -1.88923, 1.946373, 0.4235294, 0, 1, 1,
0.6002921, 0.8262742, 2.693862, 0.427451, 0, 1, 1,
0.6006288, 2.07031, -0.741613, 0.4352941, 0, 1, 1,
0.6008825, 1.147119, 1.062889, 0.4392157, 0, 1, 1,
0.6033466, -0.9573621, 3.82368, 0.4470588, 0, 1, 1,
0.606992, -0.5239949, 2.313, 0.4509804, 0, 1, 1,
0.6077607, 1.218055, 0.5208427, 0.4588235, 0, 1, 1,
0.6141707, -1.903425, 2.405715, 0.4627451, 0, 1, 1,
0.6251963, -1.080772, 1.103066, 0.4705882, 0, 1, 1,
0.626462, -1.327887, 1.344856, 0.4745098, 0, 1, 1,
0.6289051, -0.01876737, 1.588857, 0.4823529, 0, 1, 1,
0.6408588, -1.77799, 3.239779, 0.4862745, 0, 1, 1,
0.6467718, 1.38755, 2.059267, 0.4941176, 0, 1, 1,
0.649101, -3.054604, 2.551664, 0.5019608, 0, 1, 1,
0.6495654, -1.297029, 2.411319, 0.5058824, 0, 1, 1,
0.6509382, 0.9497243, 0.2914329, 0.5137255, 0, 1, 1,
0.651333, 1.021902, 1.077554, 0.5176471, 0, 1, 1,
0.6544159, -0.129085, -0.1085741, 0.5254902, 0, 1, 1,
0.6604689, 0.4375719, 0.3622297, 0.5294118, 0, 1, 1,
0.6652225, -1.147401, 2.109799, 0.5372549, 0, 1, 1,
0.6661659, 2.316434, -0.4001977, 0.5411765, 0, 1, 1,
0.6665114, -2.435362, 2.35362, 0.5490196, 0, 1, 1,
0.6699632, -1.284664, 2.260393, 0.5529412, 0, 1, 1,
0.6769043, 0.153965, 0.6933995, 0.5607843, 0, 1, 1,
0.6785741, 0.254762, -0.6174763, 0.5647059, 0, 1, 1,
0.6788633, 0.2411896, 0.808486, 0.572549, 0, 1, 1,
0.6792632, -1.007945, 1.347463, 0.5764706, 0, 1, 1,
0.6808122, 0.7334265, 0.895988, 0.5843138, 0, 1, 1,
0.6841033, -0.4339317, 1.154858, 0.5882353, 0, 1, 1,
0.6957847, -1.599397, 1.04087, 0.5960785, 0, 1, 1,
0.6986188, 0.854607, 2.26526, 0.6039216, 0, 1, 1,
0.7015609, -0.6405568, 2.054132, 0.6078432, 0, 1, 1,
0.7018229, 0.7718829, 0.4649574, 0.6156863, 0, 1, 1,
0.7025005, -0.331553, 2.068792, 0.6196079, 0, 1, 1,
0.7106618, 2.598879, 1.39307, 0.627451, 0, 1, 1,
0.7149825, 1.366417, -0.3437573, 0.6313726, 0, 1, 1,
0.7160896, 0.8424979, 1.381731, 0.6392157, 0, 1, 1,
0.7191918, -1.804931, 2.849686, 0.6431373, 0, 1, 1,
0.7196952, -0.2911285, 2.260619, 0.6509804, 0, 1, 1,
0.7206556, -0.4204059, 1.312728, 0.654902, 0, 1, 1,
0.7228467, -0.3768784, 1.638464, 0.6627451, 0, 1, 1,
0.7229607, -1.252491, 3.019554, 0.6666667, 0, 1, 1,
0.7293206, 1.681479, 2.616342, 0.6745098, 0, 1, 1,
0.7315824, 0.8781117, 0.2633999, 0.6784314, 0, 1, 1,
0.7414799, -1.459056, 3.665227, 0.6862745, 0, 1, 1,
0.7451138, -0.334767, 2.826187, 0.6901961, 0, 1, 1,
0.7541448, 1.061626, 0.5887299, 0.6980392, 0, 1, 1,
0.76111, 1.815728, 0.5843302, 0.7058824, 0, 1, 1,
0.767938, -0.847771, 2.296526, 0.7098039, 0, 1, 1,
0.7691555, 1.736841, -0.8455455, 0.7176471, 0, 1, 1,
0.7709935, -0.02400577, -0.005555284, 0.7215686, 0, 1, 1,
0.7726723, 0.07391581, 1.58505, 0.7294118, 0, 1, 1,
0.780233, 0.2355311, 2.482668, 0.7333333, 0, 1, 1,
0.7825317, 0.6542293, 0.4502072, 0.7411765, 0, 1, 1,
0.7845517, -0.02451418, 0.935164, 0.7450981, 0, 1, 1,
0.7886402, 0.3913231, 2.769545, 0.7529412, 0, 1, 1,
0.7891152, 0.5728425, 0.316797, 0.7568628, 0, 1, 1,
0.7916986, -1.34643, 1.737446, 0.7647059, 0, 1, 1,
0.7932377, -0.1174502, 2.963084, 0.7686275, 0, 1, 1,
0.7998478, -0.4149196, 0.3172628, 0.7764706, 0, 1, 1,
0.806511, 1.023623, 1.308906, 0.7803922, 0, 1, 1,
0.8079017, -0.2727003, 2.067415, 0.7882353, 0, 1, 1,
0.8086969, 1.156366, 1.089604, 0.7921569, 0, 1, 1,
0.8105708, -0.2431768, 1.00287, 0.8, 0, 1, 1,
0.8115357, -0.3659653, 0.732739, 0.8078431, 0, 1, 1,
0.8139879, 1.175359, 0.5837336, 0.8117647, 0, 1, 1,
0.8142162, -1.953834, 2.008771, 0.8196079, 0, 1, 1,
0.814657, 0.08907341, 0.6484507, 0.8235294, 0, 1, 1,
0.8167678, -0.457642, 2.833518, 0.8313726, 0, 1, 1,
0.8195175, 0.2708786, 1.039142, 0.8352941, 0, 1, 1,
0.8198806, 2.348961, 1.521628, 0.8431373, 0, 1, 1,
0.8219898, -0.1382407, 1.95016, 0.8470588, 0, 1, 1,
0.8242826, 1.720828, -0.9420721, 0.854902, 0, 1, 1,
0.8251497, 1.506179, -0.02398788, 0.8588235, 0, 1, 1,
0.8304335, 0.1707599, 0.1293783, 0.8666667, 0, 1, 1,
0.8308568, -0.371286, 2.645495, 0.8705882, 0, 1, 1,
0.8310955, 0.2587581, -0.05405964, 0.8784314, 0, 1, 1,
0.8311869, 0.6766788, -0.9379767, 0.8823529, 0, 1, 1,
0.832693, -0.07686974, 2.541617, 0.8901961, 0, 1, 1,
0.8454685, 0.4161882, 3.884164, 0.8941177, 0, 1, 1,
0.8458858, 0.2286679, 2.011227, 0.9019608, 0, 1, 1,
0.851319, 0.3525496, 1.436974, 0.9098039, 0, 1, 1,
0.8540181, -0.4150337, 2.737948, 0.9137255, 0, 1, 1,
0.8550593, -0.258584, 2.682183, 0.9215686, 0, 1, 1,
0.8582792, -0.9823027, 1.664544, 0.9254902, 0, 1, 1,
0.8604753, -1.442785, 3.646768, 0.9333333, 0, 1, 1,
0.8626655, 0.763963, 1.437215, 0.9372549, 0, 1, 1,
0.8762512, 0.9121282, 0.6236899, 0.945098, 0, 1, 1,
0.880316, -0.6933061, 1.918144, 0.9490196, 0, 1, 1,
0.8825139, -2.249445, 3.020947, 0.9568627, 0, 1, 1,
0.8848832, 0.3763913, 1.505291, 0.9607843, 0, 1, 1,
0.8887616, 0.7209954, 3.188438, 0.9686275, 0, 1, 1,
0.8898388, 0.3555863, 1.116025, 0.972549, 0, 1, 1,
0.9020779, 0.4281558, 0.4801875, 0.9803922, 0, 1, 1,
0.9033492, 0.3442514, -0.4706022, 0.9843137, 0, 1, 1,
0.9101608, 0.3707832, 2.555231, 0.9921569, 0, 1, 1,
0.9149843, -0.1526887, 3.440778, 0.9960784, 0, 1, 1,
0.9183089, -0.1954673, 2.183818, 1, 0, 0.9960784, 1,
0.9197479, 0.7222747, 0.1943759, 1, 0, 0.9882353, 1,
0.9269264, 0.459307, 0.852554, 1, 0, 0.9843137, 1,
0.929005, 0.5197971, 2.056064, 1, 0, 0.9764706, 1,
0.9357051, -0.1592227, 2.610047, 1, 0, 0.972549, 1,
0.9365472, -0.1348188, 2.841372, 1, 0, 0.9647059, 1,
0.9406334, 0.7396795, -0.1953994, 1, 0, 0.9607843, 1,
0.9452314, 0.5213678, 1.400406, 1, 0, 0.9529412, 1,
0.9519669, 0.5085161, 0.7855861, 1, 0, 0.9490196, 1,
0.9564554, 0.08973025, 0.7359614, 1, 0, 0.9411765, 1,
0.9575363, -1.723609, 2.01375, 1, 0, 0.9372549, 1,
0.9598191, -0.3040458, 1.226097, 1, 0, 0.9294118, 1,
0.9621985, 1.186226, 0.05854034, 1, 0, 0.9254902, 1,
0.9630359, 0.1476458, 1.255279, 1, 0, 0.9176471, 1,
0.9631327, 0.9579546, -0.5429349, 1, 0, 0.9137255, 1,
0.9631887, -0.9147064, 1.762962, 1, 0, 0.9058824, 1,
0.9704028, 1.761729, 0.1695649, 1, 0, 0.9019608, 1,
0.9749903, -0.9908909, 1.966217, 1, 0, 0.8941177, 1,
0.9755065, 0.2483789, 0.1166885, 1, 0, 0.8862745, 1,
0.9777881, -0.7866903, 3.282057, 1, 0, 0.8823529, 1,
0.9784811, 0.3909675, 2.239902, 1, 0, 0.8745098, 1,
0.9851458, -0.6212165, 1.670358, 1, 0, 0.8705882, 1,
0.9922821, -0.4874739, 3.098149, 1, 0, 0.8627451, 1,
0.9971135, 2.238243, 0.9709826, 1, 0, 0.8588235, 1,
0.9975943, 0.1148442, 0.4275031, 1, 0, 0.8509804, 1,
0.9996004, 0.1539499, 1.133454, 1, 0, 0.8470588, 1,
1.001063, 0.7658597, -0.1056496, 1, 0, 0.8392157, 1,
1.005714, -0.5420948, 3.134428, 1, 0, 0.8352941, 1,
1.017679, 0.4411857, 1.578703, 1, 0, 0.827451, 1,
1.023759, 0.1806118, 1.803261, 1, 0, 0.8235294, 1,
1.026782, -1.25238, 2.991757, 1, 0, 0.8156863, 1,
1.029989, -3.294971, 2.958277, 1, 0, 0.8117647, 1,
1.032562, -0.1331735, 0.9568411, 1, 0, 0.8039216, 1,
1.049131, 1.657073, 1.979753, 1, 0, 0.7960784, 1,
1.049976, -0.6015726, 3.273771, 1, 0, 0.7921569, 1,
1.057019, 0.3851823, -0.3009597, 1, 0, 0.7843137, 1,
1.067384, 0.6510065, 1.945396, 1, 0, 0.7803922, 1,
1.070794, -2.086607, 2.254575, 1, 0, 0.772549, 1,
1.075333, -0.8265092, 2.858173, 1, 0, 0.7686275, 1,
1.079022, 0.02893693, 2.020707, 1, 0, 0.7607843, 1,
1.087223, -0.5314372, 1.767016, 1, 0, 0.7568628, 1,
1.097631, -0.1641996, 0.3328048, 1, 0, 0.7490196, 1,
1.097877, 0.1467877, 1.30703, 1, 0, 0.7450981, 1,
1.100842, 1.122657, -0.5080393, 1, 0, 0.7372549, 1,
1.101915, -0.1370226, 1.238401, 1, 0, 0.7333333, 1,
1.112711, 0.8985021, 1.731194, 1, 0, 0.7254902, 1,
1.120017, -1.424873, 3.344759, 1, 0, 0.7215686, 1,
1.120029, 1.998924, 0.8323823, 1, 0, 0.7137255, 1,
1.12309, 0.1321332, 0.1822081, 1, 0, 0.7098039, 1,
1.125414, 1.14298, 0.9925414, 1, 0, 0.7019608, 1,
1.132991, 0.3957906, 1.221348, 1, 0, 0.6941177, 1,
1.133896, 0.8064789, 1.308288, 1, 0, 0.6901961, 1,
1.150392, -1.19269, 2.926383, 1, 0, 0.682353, 1,
1.15833, -1.77435, 1.44794, 1, 0, 0.6784314, 1,
1.161911, 1.348883, 0.2871968, 1, 0, 0.6705883, 1,
1.175677, -0.02296893, 2.25575, 1, 0, 0.6666667, 1,
1.176412, -0.5433101, 2.027651, 1, 0, 0.6588235, 1,
1.181337, 0.7774873, 1.560887, 1, 0, 0.654902, 1,
1.192595, 0.4096063, 0.3290739, 1, 0, 0.6470588, 1,
1.198796, -0.9360386, 2.681456, 1, 0, 0.6431373, 1,
1.199017, 1.432324, 1.916798, 1, 0, 0.6352941, 1,
1.210703, 0.1014631, 0.936716, 1, 0, 0.6313726, 1,
1.213598, -0.2282819, 1.401679, 1, 0, 0.6235294, 1,
1.213898, -0.03245264, 2.208079, 1, 0, 0.6196079, 1,
1.219619, 0.1426849, -0.8570989, 1, 0, 0.6117647, 1,
1.224284, 0.4634565, -0.2011748, 1, 0, 0.6078432, 1,
1.225461, 0.9938275, -0.1986431, 1, 0, 0.6, 1,
1.260498, -0.754724, 2.091698, 1, 0, 0.5921569, 1,
1.264, 1.278155, 0.4277113, 1, 0, 0.5882353, 1,
1.267444, 0.8283014, 1.323768, 1, 0, 0.5803922, 1,
1.268574, -0.503529, 0.5173321, 1, 0, 0.5764706, 1,
1.273, -1.066398, 4.574793, 1, 0, 0.5686275, 1,
1.277081, -0.1528749, 2.31076, 1, 0, 0.5647059, 1,
1.283368, 0.454599, 2.182739, 1, 0, 0.5568628, 1,
1.29412, 1.564032, 1.156072, 1, 0, 0.5529412, 1,
1.297164, 0.4098093, -0.1536418, 1, 0, 0.5450981, 1,
1.29809, -1.503629, 1.834944, 1, 0, 0.5411765, 1,
1.300828, -0.2950248, -0.6137749, 1, 0, 0.5333334, 1,
1.30595, -0.4851984, 0.7718781, 1, 0, 0.5294118, 1,
1.309925, -1.044391, 1.782786, 1, 0, 0.5215687, 1,
1.316586, -1.970494, 1.636642, 1, 0, 0.5176471, 1,
1.322184, 1.871317, -0.06766681, 1, 0, 0.509804, 1,
1.336597, 1.44228, -0.6228839, 1, 0, 0.5058824, 1,
1.336868, -0.7352182, 1.282066, 1, 0, 0.4980392, 1,
1.339642, 0.7816366, 1.118599, 1, 0, 0.4901961, 1,
1.349839, 0.9085966, -0.4220584, 1, 0, 0.4862745, 1,
1.357215, 0.718882, 0.9352714, 1, 0, 0.4784314, 1,
1.363023, -0.2047161, 2.993194, 1, 0, 0.4745098, 1,
1.364206, -0.7008241, 2.124551, 1, 0, 0.4666667, 1,
1.369675, 0.212521, 2.581759, 1, 0, 0.4627451, 1,
1.374507, -1.126192, 1.766091, 1, 0, 0.454902, 1,
1.377018, 1.543991, -0.0009161613, 1, 0, 0.4509804, 1,
1.394044, 1.743581, -0.2526296, 1, 0, 0.4431373, 1,
1.400785, -1.176371, 3.171324, 1, 0, 0.4392157, 1,
1.401229, 0.2273529, 1.275957, 1, 0, 0.4313726, 1,
1.409247, -1.746109, 3.293774, 1, 0, 0.427451, 1,
1.41119, -0.5796784, 1.686413, 1, 0, 0.4196078, 1,
1.41912, -0.04968188, 1.006379, 1, 0, 0.4156863, 1,
1.427369, 0.4793613, 0.8071294, 1, 0, 0.4078431, 1,
1.429085, 0.2245308, 2.314986, 1, 0, 0.4039216, 1,
1.42988, -0.7124388, 1.927649, 1, 0, 0.3960784, 1,
1.437943, -1.016335, 1.518895, 1, 0, 0.3882353, 1,
1.440282, 1.119465, 1.829358, 1, 0, 0.3843137, 1,
1.447075, 0.5454347, 0.03981445, 1, 0, 0.3764706, 1,
1.455245, -0.0108191, 3.203896, 1, 0, 0.372549, 1,
1.465101, 1.247572, 0.4515383, 1, 0, 0.3647059, 1,
1.475318, 0.6793572, 1.174676, 1, 0, 0.3607843, 1,
1.480737, -0.5441862, 2.492758, 1, 0, 0.3529412, 1,
1.495104, 0.3333153, 2.213369, 1, 0, 0.3490196, 1,
1.526108, -0.04839168, 1.254462, 1, 0, 0.3411765, 1,
1.529662, -0.6484599, 2.329278, 1, 0, 0.3372549, 1,
1.546463, 0.3350258, 2.874508, 1, 0, 0.3294118, 1,
1.553205, -1.435229, 3.288808, 1, 0, 0.3254902, 1,
1.557716, -0.3740233, 3.150739, 1, 0, 0.3176471, 1,
1.561462, -0.8275188, 0.04410371, 1, 0, 0.3137255, 1,
1.563617, 0.9317344, 1.427191, 1, 0, 0.3058824, 1,
1.577351, 0.779583, 1.126846, 1, 0, 0.2980392, 1,
1.583666, -1.955927, 3.02254, 1, 0, 0.2941177, 1,
1.587494, -0.0438633, 1.067456, 1, 0, 0.2862745, 1,
1.589623, -0.1712808, 0.9551187, 1, 0, 0.282353, 1,
1.604731, -1.830922, 2.384798, 1, 0, 0.2745098, 1,
1.604975, -0.4661125, 1.133994, 1, 0, 0.2705882, 1,
1.60819, 0.9930891, 1.022362, 1, 0, 0.2627451, 1,
1.615025, 0.3628322, 3.679966, 1, 0, 0.2588235, 1,
1.620587, 0.8881655, 0.6063846, 1, 0, 0.2509804, 1,
1.626397, -1.195712, 2.634623, 1, 0, 0.2470588, 1,
1.642098, 1.755083, 0.06359705, 1, 0, 0.2392157, 1,
1.648003, -0.9599814, 1.22428, 1, 0, 0.2352941, 1,
1.653917, 0.8032733, 2.135282, 1, 0, 0.227451, 1,
1.655111, -0.05730734, 3.392063, 1, 0, 0.2235294, 1,
1.683547, 1.595579, 3.234112, 1, 0, 0.2156863, 1,
1.712752, -1.312109, 2.655675, 1, 0, 0.2117647, 1,
1.747394, 0.9638252, 0.1759283, 1, 0, 0.2039216, 1,
1.748366, -1.350424, 1.969376, 1, 0, 0.1960784, 1,
1.774057, -0.8152161, 2.539715, 1, 0, 0.1921569, 1,
1.785155, 0.5657037, 1.550583, 1, 0, 0.1843137, 1,
1.788868, -1.381478, 0.1927688, 1, 0, 0.1803922, 1,
1.800754, 1.916527, 1.865436, 1, 0, 0.172549, 1,
1.819893, -0.5073, 3.155622, 1, 0, 0.1686275, 1,
1.860093, 0.2369427, 2.413352, 1, 0, 0.1607843, 1,
1.860394, 0.8854567, -0.06537262, 1, 0, 0.1568628, 1,
1.880719, -1.318729, 2.366317, 1, 0, 0.1490196, 1,
1.942011, 0.4240396, 1.141433, 1, 0, 0.145098, 1,
1.960696, -0.06423364, 2.961194, 1, 0, 0.1372549, 1,
1.964427, 0.8779787, 1.279988, 1, 0, 0.1333333, 1,
2.030884, 0.2967131, 1.858968, 1, 0, 0.1254902, 1,
2.031476, -0.1254509, 2.756483, 1, 0, 0.1215686, 1,
2.034131, 0.519857, 0.9635774, 1, 0, 0.1137255, 1,
2.068849, 1.206288, 2.564359, 1, 0, 0.1098039, 1,
2.080781, -0.3088258, 1.996686, 1, 0, 0.1019608, 1,
2.123632, -0.1871181, 3.640842, 1, 0, 0.09411765, 1,
2.175856, -0.5761214, 2.508841, 1, 0, 0.09019608, 1,
2.1762, -0.4854313, 0.7582596, 1, 0, 0.08235294, 1,
2.212335, 0.6983816, 1.738531, 1, 0, 0.07843138, 1,
2.21425, -2.132644, 2.999718, 1, 0, 0.07058824, 1,
2.233863, -0.3541624, 1.634324, 1, 0, 0.06666667, 1,
2.237122, 0.6097969, 0.1163902, 1, 0, 0.05882353, 1,
2.243138, 2.12948, 0.6093858, 1, 0, 0.05490196, 1,
2.296307, -0.5692806, 2.322838, 1, 0, 0.04705882, 1,
2.336138, 1.420887, 0.7330378, 1, 0, 0.04313726, 1,
2.35256, -0.9354676, 0.7823328, 1, 0, 0.03529412, 1,
2.606105, -0.4153605, -0.1996192, 1, 0, 0.03137255, 1,
2.665895, -0.3701953, -1.618412, 1, 0, 0.02352941, 1,
2.758473, 0.504123, 3.760078, 1, 0, 0.01960784, 1,
3.139732, 0.5392775, 0.9101661, 1, 0, 0.01176471, 1,
3.162655, -0.8105117, 0.3095075, 1, 0, 0.007843138, 1
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
0.1187984, -4.397813, -7.010338, 0, -0.5, 0.5, 0.5,
0.1187984, -4.397813, -7.010338, 1, -0.5, 0.5, 0.5,
0.1187984, -4.397813, -7.010338, 1, 1.5, 0.5, 0.5,
0.1187984, -4.397813, -7.010338, 0, 1.5, 0.5, 0.5
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
-3.956926, -0.04174876, -7.010338, 0, -0.5, 0.5, 0.5,
-3.956926, -0.04174876, -7.010338, 1, -0.5, 0.5, 0.5,
-3.956926, -0.04174876, -7.010338, 1, 1.5, 0.5, 0.5,
-3.956926, -0.04174876, -7.010338, 0, 1.5, 0.5, 0.5
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
-3.956926, -4.397813, 0.003984451, 0, -0.5, 0.5, 0.5,
-3.956926, -4.397813, 0.003984451, 1, -0.5, 0.5, 0.5,
-3.956926, -4.397813, 0.003984451, 1, 1.5, 0.5, 0.5,
-3.956926, -4.397813, 0.003984451, 0, 1.5, 0.5, 0.5
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
-2, -3.392567, -5.391648,
3, -3.392567, -5.391648,
-2, -3.392567, -5.391648,
-2, -3.560108, -5.66143,
-1, -3.392567, -5.391648,
-1, -3.560108, -5.66143,
0, -3.392567, -5.391648,
0, -3.560108, -5.66143,
1, -3.392567, -5.391648,
1, -3.560108, -5.66143,
2, -3.392567, -5.391648,
2, -3.560108, -5.66143,
3, -3.392567, -5.391648,
3, -3.560108, -5.66143
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
-2, -3.89519, -6.200993, 0, -0.5, 0.5, 0.5,
-2, -3.89519, -6.200993, 1, -0.5, 0.5, 0.5,
-2, -3.89519, -6.200993, 1, 1.5, 0.5, 0.5,
-2, -3.89519, -6.200993, 0, 1.5, 0.5, 0.5,
-1, -3.89519, -6.200993, 0, -0.5, 0.5, 0.5,
-1, -3.89519, -6.200993, 1, -0.5, 0.5, 0.5,
-1, -3.89519, -6.200993, 1, 1.5, 0.5, 0.5,
-1, -3.89519, -6.200993, 0, 1.5, 0.5, 0.5,
0, -3.89519, -6.200993, 0, -0.5, 0.5, 0.5,
0, -3.89519, -6.200993, 1, -0.5, 0.5, 0.5,
0, -3.89519, -6.200993, 1, 1.5, 0.5, 0.5,
0, -3.89519, -6.200993, 0, 1.5, 0.5, 0.5,
1, -3.89519, -6.200993, 0, -0.5, 0.5, 0.5,
1, -3.89519, -6.200993, 1, -0.5, 0.5, 0.5,
1, -3.89519, -6.200993, 1, 1.5, 0.5, 0.5,
1, -3.89519, -6.200993, 0, 1.5, 0.5, 0.5,
2, -3.89519, -6.200993, 0, -0.5, 0.5, 0.5,
2, -3.89519, -6.200993, 1, -0.5, 0.5, 0.5,
2, -3.89519, -6.200993, 1, 1.5, 0.5, 0.5,
2, -3.89519, -6.200993, 0, 1.5, 0.5, 0.5,
3, -3.89519, -6.200993, 0, -0.5, 0.5, 0.5,
3, -3.89519, -6.200993, 1, -0.5, 0.5, 0.5,
3, -3.89519, -6.200993, 1, 1.5, 0.5, 0.5,
3, -3.89519, -6.200993, 0, 1.5, 0.5, 0.5
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
-3.016374, -3, -5.391648,
-3.016374, 3, -5.391648,
-3.016374, -3, -5.391648,
-3.173133, -3, -5.66143,
-3.016374, -2, -5.391648,
-3.173133, -2, -5.66143,
-3.016374, -1, -5.391648,
-3.173133, -1, -5.66143,
-3.016374, 0, -5.391648,
-3.173133, 0, -5.66143,
-3.016374, 1, -5.391648,
-3.173133, 1, -5.66143,
-3.016374, 2, -5.391648,
-3.173133, 2, -5.66143,
-3.016374, 3, -5.391648,
-3.173133, 3, -5.66143
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
-3.48665, -3, -6.200993, 0, -0.5, 0.5, 0.5,
-3.48665, -3, -6.200993, 1, -0.5, 0.5, 0.5,
-3.48665, -3, -6.200993, 1, 1.5, 0.5, 0.5,
-3.48665, -3, -6.200993, 0, 1.5, 0.5, 0.5,
-3.48665, -2, -6.200993, 0, -0.5, 0.5, 0.5,
-3.48665, -2, -6.200993, 1, -0.5, 0.5, 0.5,
-3.48665, -2, -6.200993, 1, 1.5, 0.5, 0.5,
-3.48665, -2, -6.200993, 0, 1.5, 0.5, 0.5,
-3.48665, -1, -6.200993, 0, -0.5, 0.5, 0.5,
-3.48665, -1, -6.200993, 1, -0.5, 0.5, 0.5,
-3.48665, -1, -6.200993, 1, 1.5, 0.5, 0.5,
-3.48665, -1, -6.200993, 0, 1.5, 0.5, 0.5,
-3.48665, 0, -6.200993, 0, -0.5, 0.5, 0.5,
-3.48665, 0, -6.200993, 1, -0.5, 0.5, 0.5,
-3.48665, 0, -6.200993, 1, 1.5, 0.5, 0.5,
-3.48665, 0, -6.200993, 0, 1.5, 0.5, 0.5,
-3.48665, 1, -6.200993, 0, -0.5, 0.5, 0.5,
-3.48665, 1, -6.200993, 1, -0.5, 0.5, 0.5,
-3.48665, 1, -6.200993, 1, 1.5, 0.5, 0.5,
-3.48665, 1, -6.200993, 0, 1.5, 0.5, 0.5,
-3.48665, 2, -6.200993, 0, -0.5, 0.5, 0.5,
-3.48665, 2, -6.200993, 1, -0.5, 0.5, 0.5,
-3.48665, 2, -6.200993, 1, 1.5, 0.5, 0.5,
-3.48665, 2, -6.200993, 0, 1.5, 0.5, 0.5,
-3.48665, 3, -6.200993, 0, -0.5, 0.5, 0.5,
-3.48665, 3, -6.200993, 1, -0.5, 0.5, 0.5,
-3.48665, 3, -6.200993, 1, 1.5, 0.5, 0.5,
-3.48665, 3, -6.200993, 0, 1.5, 0.5, 0.5
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
-3.016374, -3.392567, -4,
-3.016374, -3.392567, 4,
-3.016374, -3.392567, -4,
-3.173133, -3.560108, -4,
-3.016374, -3.392567, -2,
-3.173133, -3.560108, -2,
-3.016374, -3.392567, 0,
-3.173133, -3.560108, 0,
-3.016374, -3.392567, 2,
-3.173133, -3.560108, 2,
-3.016374, -3.392567, 4,
-3.173133, -3.560108, 4
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
-3.48665, -3.89519, -4, 0, -0.5, 0.5, 0.5,
-3.48665, -3.89519, -4, 1, -0.5, 0.5, 0.5,
-3.48665, -3.89519, -4, 1, 1.5, 0.5, 0.5,
-3.48665, -3.89519, -4, 0, 1.5, 0.5, 0.5,
-3.48665, -3.89519, -2, 0, -0.5, 0.5, 0.5,
-3.48665, -3.89519, -2, 1, -0.5, 0.5, 0.5,
-3.48665, -3.89519, -2, 1, 1.5, 0.5, 0.5,
-3.48665, -3.89519, -2, 0, 1.5, 0.5, 0.5,
-3.48665, -3.89519, 0, 0, -0.5, 0.5, 0.5,
-3.48665, -3.89519, 0, 1, -0.5, 0.5, 0.5,
-3.48665, -3.89519, 0, 1, 1.5, 0.5, 0.5,
-3.48665, -3.89519, 0, 0, 1.5, 0.5, 0.5,
-3.48665, -3.89519, 2, 0, -0.5, 0.5, 0.5,
-3.48665, -3.89519, 2, 1, -0.5, 0.5, 0.5,
-3.48665, -3.89519, 2, 1, 1.5, 0.5, 0.5,
-3.48665, -3.89519, 2, 0, 1.5, 0.5, 0.5,
-3.48665, -3.89519, 4, 0, -0.5, 0.5, 0.5,
-3.48665, -3.89519, 4, 1, -0.5, 0.5, 0.5,
-3.48665, -3.89519, 4, 1, 1.5, 0.5, 0.5,
-3.48665, -3.89519, 4, 0, 1.5, 0.5, 0.5
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
-3.016374, -3.392567, -5.391648,
-3.016374, 3.30907, -5.391648,
-3.016374, -3.392567, 5.399617,
-3.016374, 3.30907, 5.399617,
-3.016374, -3.392567, -5.391648,
-3.016374, -3.392567, 5.399617,
-3.016374, 3.30907, -5.391648,
-3.016374, 3.30907, 5.399617,
-3.016374, -3.392567, -5.391648,
3.253971, -3.392567, -5.391648,
-3.016374, -3.392567, 5.399617,
3.253971, -3.392567, 5.399617,
-3.016374, 3.30907, -5.391648,
3.253971, 3.30907, -5.391648,
-3.016374, 3.30907, 5.399617,
3.253971, 3.30907, 5.399617,
3.253971, -3.392567, -5.391648,
3.253971, 3.30907, -5.391648,
3.253971, -3.392567, 5.399617,
3.253971, 3.30907, 5.399617,
3.253971, -3.392567, -5.391648,
3.253971, -3.392567, 5.399617,
3.253971, 3.30907, -5.391648,
3.253971, 3.30907, 5.399617
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
var radius = 7.564463;
var distance = 33.65515;
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
mvMatrix.translate( -0.1187984, 0.04174876, -0.003984451 );
mvMatrix.scale( 1.304369, 1.220425, 0.7579135 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.65515);
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
piperophos<-read.table("piperophos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-piperophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'piperophos' not found
```

```r
y<-piperophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'piperophos' not found
```

```r
z<-piperophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'piperophos' not found
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
-2.925058, 0.8461081, -0.1045547, 0, 0, 1, 1, 1,
-2.8903, 1.166203, -0.4710537, 1, 0, 0, 1, 1,
-2.671439, -0.1487845, -0.9618943, 1, 0, 0, 1, 1,
-2.658989, 0.3323045, -3.195354, 1, 0, 0, 1, 1,
-2.629138, -1.862793, -2.584092, 1, 0, 0, 1, 1,
-2.385519, -0.5602939, -1.370857, 1, 0, 0, 1, 1,
-2.375859, 0.78938, -3.410296, 0, 0, 0, 1, 1,
-2.345984, -1.204475, -0.1037875, 0, 0, 0, 1, 1,
-2.319318, -0.06104735, -1.603543, 0, 0, 0, 1, 1,
-2.307923, 1.064365, -1.929119, 0, 0, 0, 1, 1,
-2.276373, 0.7613162, -3.179368, 0, 0, 0, 1, 1,
-2.240161, -0.09943989, -2.704091, 0, 0, 0, 1, 1,
-2.234564, 0.3278787, -1.579212, 0, 0, 0, 1, 1,
-2.227633, -0.4402665, -2.082021, 1, 1, 1, 1, 1,
-2.220587, 0.8064783, -3.640341, 1, 1, 1, 1, 1,
-2.185161, -0.5569598, -2.129665, 1, 1, 1, 1, 1,
-2.155545, 0.1560799, -1.193849, 1, 1, 1, 1, 1,
-2.123601, -1.254336, -2.895879, 1, 1, 1, 1, 1,
-2.060526, -0.04201049, -3.05847, 1, 1, 1, 1, 1,
-2.053406, 2.3121, -1.12139, 1, 1, 1, 1, 1,
-2.052388, 0.319481, -2.545301, 1, 1, 1, 1, 1,
-2.044926, 1.007377, -1.291859, 1, 1, 1, 1, 1,
-1.995391, -0.7279712, -2.302289, 1, 1, 1, 1, 1,
-1.990717, -0.4122722, -2.549389, 1, 1, 1, 1, 1,
-1.961186, 0.3344642, -1.791007, 1, 1, 1, 1, 1,
-1.958217, 0.8982338, -1.735368, 1, 1, 1, 1, 1,
-1.938366, -0.7519709, -1.066191, 1, 1, 1, 1, 1,
-1.936033, -0.9981206, -1.881843, 1, 1, 1, 1, 1,
-1.916692, 0.8215542, -0.8173155, 0, 0, 1, 1, 1,
-1.889808, 0.5505756, -1.55353, 1, 0, 0, 1, 1,
-1.885406, 0.4877475, -2.826324, 1, 0, 0, 1, 1,
-1.868019, 1.090274, -1.674564, 1, 0, 0, 1, 1,
-1.85998, 0.4286599, -2.933761, 1, 0, 0, 1, 1,
-1.856305, 0.9592205, -0.3972675, 1, 0, 0, 1, 1,
-1.848141, 0.4658882, -3.193262, 0, 0, 0, 1, 1,
-1.830645, -0.7791636, -0.6497609, 0, 0, 0, 1, 1,
-1.809697, -0.9075452, -3.673788, 0, 0, 0, 1, 1,
-1.801255, -0.2109857, -2.279616, 0, 0, 0, 1, 1,
-1.800204, 0.3891568, -2.094403, 0, 0, 0, 1, 1,
-1.761668, -1.698291, -1.183981, 0, 0, 0, 1, 1,
-1.761366, 1.336894, -1.292439, 0, 0, 0, 1, 1,
-1.758198, 0.2127919, -1.739159, 1, 1, 1, 1, 1,
-1.756732, 0.5702955, -0.9714743, 1, 1, 1, 1, 1,
-1.741508, -1.644538, -2.480144, 1, 1, 1, 1, 1,
-1.73736, 0.6645905, -1.57135, 1, 1, 1, 1, 1,
-1.729896, 0.7563892, -2.184331, 1, 1, 1, 1, 1,
-1.718519, 0.8430359, -1.03891, 1, 1, 1, 1, 1,
-1.701944, 0.5829504, 0.7240095, 1, 1, 1, 1, 1,
-1.696303, -2.311322, -2.223145, 1, 1, 1, 1, 1,
-1.694576, -0.5270457, -3.174145, 1, 1, 1, 1, 1,
-1.691366, 1.064934, -1.577712, 1, 1, 1, 1, 1,
-1.68856, -0.7622107, -3.240797, 1, 1, 1, 1, 1,
-1.654772, 1.790199, -1.092308, 1, 1, 1, 1, 1,
-1.651074, -0.9925668, -2.123918, 1, 1, 1, 1, 1,
-1.63893, -1.59872, -2.343073, 1, 1, 1, 1, 1,
-1.626086, -0.6123616, -2.862647, 1, 1, 1, 1, 1,
-1.614133, -0.8371279, -2.15382, 0, 0, 1, 1, 1,
-1.594818, 0.04746677, -2.502192, 1, 0, 0, 1, 1,
-1.594642, 0.8167254, -3.061827, 1, 0, 0, 1, 1,
-1.579018, 0.1769745, -2.094718, 1, 0, 0, 1, 1,
-1.563711, 0.2682177, -2.426148, 1, 0, 0, 1, 1,
-1.557547, 0.4369629, -0.7021353, 1, 0, 0, 1, 1,
-1.555942, -0.7869353, -2.134063, 0, 0, 0, 1, 1,
-1.546623, 1.021938, 0.5349312, 0, 0, 0, 1, 1,
-1.510943, 1.327299, -1.493315, 0, 0, 0, 1, 1,
-1.498556, -0.8246088, -2.079058, 0, 0, 0, 1, 1,
-1.4969, 0.3067214, -0.1334654, 0, 0, 0, 1, 1,
-1.496108, 1.965116, -0.6125441, 0, 0, 0, 1, 1,
-1.496075, 0.159499, -2.553294, 0, 0, 0, 1, 1,
-1.494688, -0.2390512, -1.109062, 1, 1, 1, 1, 1,
-1.487726, -1.181244, -2.037209, 1, 1, 1, 1, 1,
-1.479233, 0.7616519, -1.953603, 1, 1, 1, 1, 1,
-1.477199, 0.6658111, -2.244001, 1, 1, 1, 1, 1,
-1.473428, 0.2057953, -1.764806, 1, 1, 1, 1, 1,
-1.460747, 0.04274256, -0.06314708, 1, 1, 1, 1, 1,
-1.453067, -0.5436212, -0.3064393, 1, 1, 1, 1, 1,
-1.450628, 0.4737166, -0.9386099, 1, 1, 1, 1, 1,
-1.450148, -0.618245, -0.9604328, 1, 1, 1, 1, 1,
-1.421018, 1.06445, -3.276523, 1, 1, 1, 1, 1,
-1.414982, -0.8095084, -4.248401, 1, 1, 1, 1, 1,
-1.407816, -0.2813435, -2.793747, 1, 1, 1, 1, 1,
-1.401377, 1.082473, -0.9092454, 1, 1, 1, 1, 1,
-1.398315, 0.83701, -1.632056, 1, 1, 1, 1, 1,
-1.397969, 0.1986267, -1.417457, 1, 1, 1, 1, 1,
-1.392942, -0.06440664, -2.160805, 0, 0, 1, 1, 1,
-1.377035, 0.6668192, -1.50923, 1, 0, 0, 1, 1,
-1.374948, 0.4732955, -2.492055, 1, 0, 0, 1, 1,
-1.37112, -0.4136409, -1.457269, 1, 0, 0, 1, 1,
-1.369957, -1.791184, -2.461693, 1, 0, 0, 1, 1,
-1.364341, -0.7965249, -3.463029, 1, 0, 0, 1, 1,
-1.363009, -0.1671687, -2.676679, 0, 0, 0, 1, 1,
-1.35997, -0.3730676, -3.06247, 0, 0, 0, 1, 1,
-1.3527, -0.2526588, -2.780625, 0, 0, 0, 1, 1,
-1.339219, -0.9728875, -2.160411, 0, 0, 0, 1, 1,
-1.338272, -0.6510948, -2.404994, 0, 0, 0, 1, 1,
-1.336842, 0.8203171, 0.8950247, 0, 0, 0, 1, 1,
-1.33327, -1.220807, -1.401036, 0, 0, 0, 1, 1,
-1.323343, 0.8035672, -1.491315, 1, 1, 1, 1, 1,
-1.310518, 0.3326502, -2.349629, 1, 1, 1, 1, 1,
-1.297721, -0.2550183, -1.47413, 1, 1, 1, 1, 1,
-1.295437, 1.314994, -0.8360586, 1, 1, 1, 1, 1,
-1.294256, -1.195132, -2.986063, 1, 1, 1, 1, 1,
-1.293141, -0.2564934, -1.984519, 1, 1, 1, 1, 1,
-1.292041, -1.304257, -2.58196, 1, 1, 1, 1, 1,
-1.27962, -1.452329, -2.126549, 1, 1, 1, 1, 1,
-1.270192, -0.8799229, -2.012996, 1, 1, 1, 1, 1,
-1.269842, -0.4331227, 0.1386772, 1, 1, 1, 1, 1,
-1.268038, 0.3836655, -0.8440662, 1, 1, 1, 1, 1,
-1.265873, 1.018735, -1.802528, 1, 1, 1, 1, 1,
-1.257508, -0.01969926, -3.121869, 1, 1, 1, 1, 1,
-1.25174, -0.2395062, 1.141092, 1, 1, 1, 1, 1,
-1.248685, 0.3390016, 0.1776156, 1, 1, 1, 1, 1,
-1.237104, 1.08871, -1.156044, 0, 0, 1, 1, 1,
-1.220003, 0.6614878, -1.565371, 1, 0, 0, 1, 1,
-1.218966, 1.031723, 0.4998976, 1, 0, 0, 1, 1,
-1.218324, 0.4937688, -1.632587, 1, 0, 0, 1, 1,
-1.216282, 1.318679, 0.60179, 1, 0, 0, 1, 1,
-1.211454, -0.4607178, -1.760831, 1, 0, 0, 1, 1,
-1.199431, 0.3022028, -1.937702, 0, 0, 0, 1, 1,
-1.199025, -0.9225313, -3.583623, 0, 0, 0, 1, 1,
-1.193887, -1.881328, -2.222029, 0, 0, 0, 1, 1,
-1.192391, 1.270173, 0.8210922, 0, 0, 0, 1, 1,
-1.19221, 1.005602, -2.096996, 0, 0, 0, 1, 1,
-1.181586, 0.7011073, -0.3180153, 0, 0, 0, 1, 1,
-1.180248, 0.1638966, -1.856141, 0, 0, 0, 1, 1,
-1.172454, -0.9654373, -3.149496, 1, 1, 1, 1, 1,
-1.166505, 0.4918456, 0.4287431, 1, 1, 1, 1, 1,
-1.16083, -0.1265792, -0.9121948, 1, 1, 1, 1, 1,
-1.154853, -0.4078301, -1.732512, 1, 1, 1, 1, 1,
-1.152594, 0.9250072, -1.067134, 1, 1, 1, 1, 1,
-1.150393, -0.7577551, -2.685076, 1, 1, 1, 1, 1,
-1.150194, 0.061577, 1.612404, 1, 1, 1, 1, 1,
-1.143697, 0.134207, -1.894073, 1, 1, 1, 1, 1,
-1.139496, -1.660412, -3.673841, 1, 1, 1, 1, 1,
-1.133872, -1.752344, -2.199952, 1, 1, 1, 1, 1,
-1.129537, 1.448506, -0.1199401, 1, 1, 1, 1, 1,
-1.124673, -1.088018, -1.031994, 1, 1, 1, 1, 1,
-1.120456, 1.418622, 0.08276028, 1, 1, 1, 1, 1,
-1.118144, -0.1423672, -2.301096, 1, 1, 1, 1, 1,
-1.116598, -0.5381534, -2.783731, 1, 1, 1, 1, 1,
-1.114884, 0.5385839, -2.105738, 0, 0, 1, 1, 1,
-1.106371, -2.151598, -0.6821856, 1, 0, 0, 1, 1,
-1.105126, 0.3441504, -0.7301341, 1, 0, 0, 1, 1,
-1.099716, -0.3136995, -1.179239, 1, 0, 0, 1, 1,
-1.097845, -0.8264505, -0.4492166, 1, 0, 0, 1, 1,
-1.089732, -0.989207, -1.398142, 1, 0, 0, 1, 1,
-1.086651, 0.4590345, -0.4869981, 0, 0, 0, 1, 1,
-1.081599, -0.3919766, -1.28105, 0, 0, 0, 1, 1,
-1.078602, 1.719171, 0.3132752, 0, 0, 0, 1, 1,
-1.071802, -0.8360007, -2.757683, 0, 0, 0, 1, 1,
-1.071139, -0.19474, -0.1297833, 0, 0, 0, 1, 1,
-1.057879, -0.2146236, 0.2528011, 0, 0, 0, 1, 1,
-1.057342, 0.8723254, -0.7967511, 0, 0, 0, 1, 1,
-1.044718, -0.5209367, -3.190988, 1, 1, 1, 1, 1,
-1.039003, -0.3499649, -1.464405, 1, 1, 1, 1, 1,
-1.038903, 0.6293494, -2.087617, 1, 1, 1, 1, 1,
-1.022655, 0.1461647, -0.622184, 1, 1, 1, 1, 1,
-1.019352, -0.9987345, -2.911463, 1, 1, 1, 1, 1,
-1.017966, -1.320972, -2.02985, 1, 1, 1, 1, 1,
-1.005286, -1.216389, -2.409136, 1, 1, 1, 1, 1,
-1.005104, 3.211473, -0.2400963, 1, 1, 1, 1, 1,
-1.003796, -1.215263, -3.866788, 1, 1, 1, 1, 1,
-1.002113, -0.3237012, -1.630468, 1, 1, 1, 1, 1,
-0.998606, -0.4826635, -1.480872, 1, 1, 1, 1, 1,
-0.9966241, 0.1315082, -1.667553, 1, 1, 1, 1, 1,
-0.993682, 0.3267317, 0.6579357, 1, 1, 1, 1, 1,
-0.9883947, -2.471939, -2.45403, 1, 1, 1, 1, 1,
-0.9838168, -0.1607336, -2.06546, 1, 1, 1, 1, 1,
-0.9836, 0.5194246, 1.060538, 0, 0, 1, 1, 1,
-0.9809077, 0.09331719, -2.152964, 1, 0, 0, 1, 1,
-0.9781969, -0.784345, -2.92887, 1, 0, 0, 1, 1,
-0.9770941, -1.255376, -2.746161, 1, 0, 0, 1, 1,
-0.9744687, -2.157695, -1.001162, 1, 0, 0, 1, 1,
-0.9668936, 0.3237839, -2.210198, 1, 0, 0, 1, 1,
-0.9668754, 0.3523281, -1.026413, 0, 0, 0, 1, 1,
-0.9637754, 0.3145779, -0.9157717, 0, 0, 0, 1, 1,
-0.9611473, -0.4791421, -2.987085, 0, 0, 0, 1, 1,
-0.959272, 1.276158, -0.3446973, 0, 0, 0, 1, 1,
-0.957248, -1.401588, -1.080308, 0, 0, 0, 1, 1,
-0.9492342, -1.171701, -3.241114, 0, 0, 0, 1, 1,
-0.9452288, -0.4948662, -3.208489, 0, 0, 0, 1, 1,
-0.9423556, -1.399502, -2.039348, 1, 1, 1, 1, 1,
-0.9421985, -0.05810519, -2.750694, 1, 1, 1, 1, 1,
-0.9373707, 2.254175, 1.474642, 1, 1, 1, 1, 1,
-0.9360411, 0.1423103, -2.430166, 1, 1, 1, 1, 1,
-0.9347287, -0.07227939, -1.260795, 1, 1, 1, 1, 1,
-0.9281108, -1.030843, -1.350643, 1, 1, 1, 1, 1,
-0.9260386, 0.5736923, -0.477575, 1, 1, 1, 1, 1,
-0.924384, -1.375749, -2.27514, 1, 1, 1, 1, 1,
-0.9186044, -1.476083, -4.103107, 1, 1, 1, 1, 1,
-0.9164981, 1.514565, -0.1616905, 1, 1, 1, 1, 1,
-0.9152822, 1.244808, -0.3099689, 1, 1, 1, 1, 1,
-0.9084618, 1.519431, -0.3333635, 1, 1, 1, 1, 1,
-0.9083662, -1.717453, -1.636833, 1, 1, 1, 1, 1,
-0.9081376, 0.8022624, -0.1316003, 1, 1, 1, 1, 1,
-0.8997796, 0.5453644, -1.697484, 1, 1, 1, 1, 1,
-0.8929591, 1.828333, -0.7896951, 0, 0, 1, 1, 1,
-0.891613, 1.131633, -1.363801, 1, 0, 0, 1, 1,
-0.8900466, -1.026035, -1.564751, 1, 0, 0, 1, 1,
-0.8867163, 2.544182, -1.478908, 1, 0, 0, 1, 1,
-0.8851575, 0.730987, -2.293097, 1, 0, 0, 1, 1,
-0.8686852, 0.3897894, -0.8543137, 1, 0, 0, 1, 1,
-0.8634895, -1.067116, -2.867944, 0, 0, 0, 1, 1,
-0.8617101, 0.633931, -1.608736, 0, 0, 0, 1, 1,
-0.8553775, -0.5561233, -1.261667, 0, 0, 0, 1, 1,
-0.8533743, 1.485121, -0.4145561, 0, 0, 0, 1, 1,
-0.8514839, 1.825469, 0.635736, 0, 0, 0, 1, 1,
-0.8415868, 1.341291, 0.04300212, 0, 0, 0, 1, 1,
-0.839174, -1.004667, -2.407193, 0, 0, 0, 1, 1,
-0.8386066, 0.819719, -0.007863697, 1, 1, 1, 1, 1,
-0.827557, -0.3754813, -2.305655, 1, 1, 1, 1, 1,
-0.8253016, -1.111444, -1.499178, 1, 1, 1, 1, 1,
-0.8155272, -0.8673482, -1.314504, 1, 1, 1, 1, 1,
-0.8142365, 0.06192259, -2.702785, 1, 1, 1, 1, 1,
-0.8128447, -1.132528, -1.594067, 1, 1, 1, 1, 1,
-0.8123164, -1.038211, -2.65388, 1, 1, 1, 1, 1,
-0.811553, 0.09566543, -1.144719, 1, 1, 1, 1, 1,
-0.8113292, 1.533246, -1.55274, 1, 1, 1, 1, 1,
-0.8112916, -0.4659745, -1.476414, 1, 1, 1, 1, 1,
-0.8111286, -1.057994, -2.234968, 1, 1, 1, 1, 1,
-0.8095186, 0.9458901, 0.06802946, 1, 1, 1, 1, 1,
-0.8074471, 1.063789, -0.7848738, 1, 1, 1, 1, 1,
-0.8041152, 0.8623958, -1.472396, 1, 1, 1, 1, 1,
-0.8010091, 0.8107199, 0.119238, 1, 1, 1, 1, 1,
-0.7976749, -1.493778, -0.8891994, 0, 0, 1, 1, 1,
-0.7973551, 0.8270459, -0.6640092, 1, 0, 0, 1, 1,
-0.7970684, -1.184687, -4.062303, 1, 0, 0, 1, 1,
-0.7959686, -0.4247252, -0.7354855, 1, 0, 0, 1, 1,
-0.7914864, -1.745033, -3.014892, 1, 0, 0, 1, 1,
-0.7825879, -0.9686793, -2.213195, 1, 0, 0, 1, 1,
-0.779622, 0.1374278, -1.711932, 0, 0, 0, 1, 1,
-0.7794247, -1.742402, -4.621301, 0, 0, 0, 1, 1,
-0.7764259, 0.712681, -1.2518, 0, 0, 0, 1, 1,
-0.7696263, 1.370722, -0.7607074, 0, 0, 0, 1, 1,
-0.7544172, -0.3207418, -3.372419, 0, 0, 0, 1, 1,
-0.7349022, 1.486154, -0.5458603, 0, 0, 0, 1, 1,
-0.7282985, -0.2634766, -3.653699, 0, 0, 0, 1, 1,
-0.7278897, 1.227086, 0.1211902, 1, 1, 1, 1, 1,
-0.7269078, 0.2381871, -1.256827, 1, 1, 1, 1, 1,
-0.7151538, -1.658955, -2.774674, 1, 1, 1, 1, 1,
-0.7115632, 1.852996, -0.5855708, 1, 1, 1, 1, 1,
-0.708955, -1.015175, -1.182356, 1, 1, 1, 1, 1,
-0.7043325, 1.506228, 0.6449129, 1, 1, 1, 1, 1,
-0.7038266, 0.09889866, -1.501721, 1, 1, 1, 1, 1,
-0.6978446, -1.137067, -3.493239, 1, 1, 1, 1, 1,
-0.6970415, 0.1015412, -1.120305, 1, 1, 1, 1, 1,
-0.6939617, 2.939285, 1.892636, 1, 1, 1, 1, 1,
-0.6937771, -0.2309473, -0.7887898, 1, 1, 1, 1, 1,
-0.6880513, -0.3038142, -1.991236, 1, 1, 1, 1, 1,
-0.6846745, -0.3809172, -1.177195, 1, 1, 1, 1, 1,
-0.6840426, 0.596169, -1.734896, 1, 1, 1, 1, 1,
-0.6834112, -0.3997963, -2.811016, 1, 1, 1, 1, 1,
-0.6813895, 0.5371177, -1.514998, 0, 0, 1, 1, 1,
-0.6773506, 0.3997498, -1.367241, 1, 0, 0, 1, 1,
-0.6765036, -1.39027, -1.383096, 1, 0, 0, 1, 1,
-0.6745535, 1.423584, -0.9085299, 1, 0, 0, 1, 1,
-0.6730162, 1.91173, -0.3291964, 1, 0, 0, 1, 1,
-0.6697104, 0.3672645, -1.395564, 1, 0, 0, 1, 1,
-0.6673166, -0.9779634, -2.722217, 0, 0, 0, 1, 1,
-0.6666421, -0.2178696, -2.319125, 0, 0, 0, 1, 1,
-0.662078, -0.7856116, -2.670892, 0, 0, 0, 1, 1,
-0.6581674, -0.1794901, -3.178208, 0, 0, 0, 1, 1,
-0.6575266, -0.7502059, -1.416849, 0, 0, 0, 1, 1,
-0.6567746, -0.1558996, -2.282575, 0, 0, 0, 1, 1,
-0.6459736, 1.12642, -0.1546017, 0, 0, 0, 1, 1,
-0.6451806, 0.0722947, -1.44115, 1, 1, 1, 1, 1,
-0.6411578, 2.345499, -0.826328, 1, 1, 1, 1, 1,
-0.6376696, 2.323667, 1.106401, 1, 1, 1, 1, 1,
-0.6354878, 1.461792, -0.9850048, 1, 1, 1, 1, 1,
-0.6342497, 0.8560429, -0.8624106, 1, 1, 1, 1, 1,
-0.6336238, -0.8186054, -4.066948, 1, 1, 1, 1, 1,
-0.6327462, 0.4274733, -2.290404, 1, 1, 1, 1, 1,
-0.6268507, -1.024889, -0.886688, 1, 1, 1, 1, 1,
-0.6201404, 0.7234555, -1.137949, 1, 1, 1, 1, 1,
-0.6185208, 1.186408, -0.07460219, 1, 1, 1, 1, 1,
-0.6176926, 2.319903, 0.2627197, 1, 1, 1, 1, 1,
-0.6159246, -0.14956, -0.461538, 1, 1, 1, 1, 1,
-0.613726, -0.3053654, -1.481611, 1, 1, 1, 1, 1,
-0.6121047, 0.02564618, -1.726871, 1, 1, 1, 1, 1,
-0.6027895, -0.1631504, 0.4349138, 1, 1, 1, 1, 1,
-0.6026787, 0.5410676, 0.5442029, 0, 0, 1, 1, 1,
-0.5986197, 0.7606165, -1.111644, 1, 0, 0, 1, 1,
-0.5985734, -1.007876, -1.462108, 1, 0, 0, 1, 1,
-0.5975615, -0.03698377, -3.20004, 1, 0, 0, 1, 1,
-0.5973598, -1.312849, -1.494738, 1, 0, 0, 1, 1,
-0.5967528, -0.4394172, -1.648865, 1, 0, 0, 1, 1,
-0.5962899, 0.4727719, 0.1897741, 0, 0, 0, 1, 1,
-0.5892161, -0.09433258, -1.923866, 0, 0, 0, 1, 1,
-0.5850078, 1.808459, -0.7425503, 0, 0, 0, 1, 1,
-0.5766191, -0.844264, -1.198857, 0, 0, 0, 1, 1,
-0.5732764, -0.4154897, -2.482404, 0, 0, 0, 1, 1,
-0.5714914, -0.578749, -2.449255, 0, 0, 0, 1, 1,
-0.5606395, 0.08999334, -0.9250085, 0, 0, 0, 1, 1,
-0.5590054, -0.3664821, -3.065824, 1, 1, 1, 1, 1,
-0.5581557, 0.9987811, 0.01036927, 1, 1, 1, 1, 1,
-0.5580397, 1.541952, 0.8849093, 1, 1, 1, 1, 1,
-0.5547619, 0.2200276, -0.4782701, 1, 1, 1, 1, 1,
-0.5522678, -0.1451289, -2.854901, 1, 1, 1, 1, 1,
-0.5496626, 0.2242284, -2.02215, 1, 1, 1, 1, 1,
-0.5473958, 1.062545, -1.875586, 1, 1, 1, 1, 1,
-0.5469997, 0.7266213, -0.474782, 1, 1, 1, 1, 1,
-0.5384055, 0.1714575, -0.6915082, 1, 1, 1, 1, 1,
-0.5368694, 0.4697099, -0.02596659, 1, 1, 1, 1, 1,
-0.532777, 1.177319, 1.383375, 1, 1, 1, 1, 1,
-0.5311146, -0.6497676, -3.237596, 1, 1, 1, 1, 1,
-0.5249619, 0.7342642, -0.9494416, 1, 1, 1, 1, 1,
-0.5212743, 0.0003606329, -0.7371283, 1, 1, 1, 1, 1,
-0.51393, -0.5921649, -4.34832, 1, 1, 1, 1, 1,
-0.504039, 0.3829412, -0.3059942, 0, 0, 1, 1, 1,
-0.5029345, 2.36619, -0.08914965, 1, 0, 0, 1, 1,
-0.5026217, -0.7380494, -3.341829, 1, 0, 0, 1, 1,
-0.5022604, -0.6368544, -2.499375, 1, 0, 0, 1, 1,
-0.500578, 0.03086933, -1.364214, 1, 0, 0, 1, 1,
-0.4949279, 1.767383, -1.288622, 1, 0, 0, 1, 1,
-0.4904287, 1.097962, -1.019818, 0, 0, 0, 1, 1,
-0.4881486, -0.7799023, -3.186533, 0, 0, 0, 1, 1,
-0.4861223, 0.03227725, -2.721474, 0, 0, 0, 1, 1,
-0.4826575, -0.9759855, -3.97039, 0, 0, 0, 1, 1,
-0.479778, 0.6422524, 0.1812181, 0, 0, 0, 1, 1,
-0.4797377, 1.067969, -1.477789, 0, 0, 0, 1, 1,
-0.4778485, -1.35723, -2.994988, 0, 0, 0, 1, 1,
-0.4769507, 0.8084967, -1.216102, 1, 1, 1, 1, 1,
-0.4767484, 0.03058887, -1.230948, 1, 1, 1, 1, 1,
-0.469246, 0.4534197, -1.153554, 1, 1, 1, 1, 1,
-0.4673631, 0.4176413, -1.953511, 1, 1, 1, 1, 1,
-0.4619545, -1.097546, -1.397544, 1, 1, 1, 1, 1,
-0.4566208, -0.3040101, -1.483638, 1, 1, 1, 1, 1,
-0.4560673, -0.7659972, -1.985628, 1, 1, 1, 1, 1,
-0.4546361, -0.447785, -1.805364, 1, 1, 1, 1, 1,
-0.4544682, -0.47326, -1.934972, 1, 1, 1, 1, 1,
-0.4543862, 2.350147, 0.5122724, 1, 1, 1, 1, 1,
-0.4535042, 0.7495813, -1.308397, 1, 1, 1, 1, 1,
-0.453169, -1.426478, -3.293276, 1, 1, 1, 1, 1,
-0.4483676, 1.000903, -0.5042456, 1, 1, 1, 1, 1,
-0.4465359, 0.1412609, -0.8885744, 1, 1, 1, 1, 1,
-0.4428703, 0.8625911, -1.47318, 1, 1, 1, 1, 1,
-0.4420485, 0.2134142, -1.385752, 0, 0, 1, 1, 1,
-0.4415224, 0.4986658, -0.01416808, 1, 0, 0, 1, 1,
-0.4410304, 0.1158235, -1.468117, 1, 0, 0, 1, 1,
-0.4401957, -0.2590694, -3.387192, 1, 0, 0, 1, 1,
-0.439516, 0.05114986, 0.9685035, 1, 0, 0, 1, 1,
-0.4378268, -0.1487073, -2.365492, 1, 0, 0, 1, 1,
-0.4369687, -0.696077, -3.555883, 0, 0, 0, 1, 1,
-0.4359964, 0.3421, -0.8460041, 0, 0, 0, 1, 1,
-0.4354572, -1.235206, -3.116955, 0, 0, 0, 1, 1,
-0.4341575, -0.6815888, -0.5512195, 0, 0, 0, 1, 1,
-0.4340948, 0.4679812, -1.257716, 0, 0, 0, 1, 1,
-0.4337638, -1.777605, -3.906414, 0, 0, 0, 1, 1,
-0.4307883, -0.8643996, -1.713912, 0, 0, 0, 1, 1,
-0.4237497, -0.1310912, -2.274667, 1, 1, 1, 1, 1,
-0.4194179, -2.22075, -3.214295, 1, 1, 1, 1, 1,
-0.4167878, 2.046921, 0.2458742, 1, 1, 1, 1, 1,
-0.4138265, 0.1948528, -2.121714, 1, 1, 1, 1, 1,
-0.4138101, 1.525868, -0.9331877, 1, 1, 1, 1, 1,
-0.4111267, -0.4854579, -3.638114, 1, 1, 1, 1, 1,
-0.409363, -0.1391242, -0.9289516, 1, 1, 1, 1, 1,
-0.4079241, 1.514537, 1.17746, 1, 1, 1, 1, 1,
-0.4030905, -0.9224095, -5.234494, 1, 1, 1, 1, 1,
-0.3989007, 0.4376963, -1.650955, 1, 1, 1, 1, 1,
-0.3984894, 0.1640687, 0.707609, 1, 1, 1, 1, 1,
-0.3968872, 0.4918844, -0.8175459, 1, 1, 1, 1, 1,
-0.392116, 0.5522053, -0.9600313, 1, 1, 1, 1, 1,
-0.392049, 1.825578, -0.6735868, 1, 1, 1, 1, 1,
-0.3902629, -0.4251809, -3.213937, 1, 1, 1, 1, 1,
-0.3874308, 2.396116, 1.783691, 0, 0, 1, 1, 1,
-0.3873888, -0.1116747, -2.638963, 1, 0, 0, 1, 1,
-0.3848926, 0.5467866, 0.2421085, 1, 0, 0, 1, 1,
-0.3841225, 0.5066622, -0.463381, 1, 0, 0, 1, 1,
-0.3840491, 0.4494549, -2.366547, 1, 0, 0, 1, 1,
-0.3834781, -1.487442, -2.794745, 1, 0, 0, 1, 1,
-0.3823786, 0.6579434, -0.6221781, 0, 0, 0, 1, 1,
-0.3705254, 0.26497, -1.146734, 0, 0, 0, 1, 1,
-0.361351, 0.1471842, -0.68336, 0, 0, 0, 1, 1,
-0.3595396, -0.01825382, -0.9060592, 0, 0, 0, 1, 1,
-0.3592023, 0.9140583, 1.940485, 0, 0, 0, 1, 1,
-0.3585508, -0.07479002, -3.013808, 0, 0, 0, 1, 1,
-0.3578617, 0.9527074, -1.950644, 0, 0, 0, 1, 1,
-0.3566123, -0.3550124, -3.701884, 1, 1, 1, 1, 1,
-0.3555753, 1.349403, -0.6199242, 1, 1, 1, 1, 1,
-0.3531646, -2.307188, -3.357608, 1, 1, 1, 1, 1,
-0.3529294, 1.62896, 0.7596754, 1, 1, 1, 1, 1,
-0.3518871, -0.398426, -2.609412, 1, 1, 1, 1, 1,
-0.3501475, -0.3758107, -2.057292, 1, 1, 1, 1, 1,
-0.3482913, 0.8235475, -0.5118706, 1, 1, 1, 1, 1,
-0.3457429, 1.080742, -0.0968584, 1, 1, 1, 1, 1,
-0.3444243, -2.068333, -3.222964, 1, 1, 1, 1, 1,
-0.3434244, 0.387925, 2.373452, 1, 1, 1, 1, 1,
-0.3424969, -0.9338582, -3.17361, 1, 1, 1, 1, 1,
-0.3423213, -1.283918, -1.697834, 1, 1, 1, 1, 1,
-0.3343988, -1.124364, -4.298733, 1, 1, 1, 1, 1,
-0.3321009, 0.8674299, 0.8280044, 1, 1, 1, 1, 1,
-0.3309675, 0.7130094, 0.4141788, 1, 1, 1, 1, 1,
-0.3298694, -1.174303, -4.322012, 0, 0, 1, 1, 1,
-0.3268816, 0.8743343, -1.038113, 1, 0, 0, 1, 1,
-0.3260756, 1.737659, -1.377978, 1, 0, 0, 1, 1,
-0.3221216, -0.02230263, -1.983497, 1, 0, 0, 1, 1,
-0.3218194, -0.5725073, -2.298132, 1, 0, 0, 1, 1,
-0.3174813, 0.4887805, 0.4438519, 1, 0, 0, 1, 1,
-0.3165269, 0.1283451, -1.15883, 0, 0, 0, 1, 1,
-0.3153776, -1.761869, -4.725117, 0, 0, 0, 1, 1,
-0.3141944, -0.2773369, -2.448469, 0, 0, 0, 1, 1,
-0.3129821, -0.5777004, -2.103067, 0, 0, 0, 1, 1,
-0.3087984, -1.034735, -3.473763, 0, 0, 0, 1, 1,
-0.3066612, -1.294729, -2.139676, 0, 0, 0, 1, 1,
-0.2945259, 0.0737544, -0.9444165, 0, 0, 0, 1, 1,
-0.2895394, 1.051625, -1.13601, 1, 1, 1, 1, 1,
-0.2876273, 0.05558626, -3.043909, 1, 1, 1, 1, 1,
-0.2875379, -0.5089883, -2.280459, 1, 1, 1, 1, 1,
-0.2808238, -0.9378176, -2.827466, 1, 1, 1, 1, 1,
-0.2776925, 0.5737123, -1.686163, 1, 1, 1, 1, 1,
-0.2774202, 0.7293617, -0.1329273, 1, 1, 1, 1, 1,
-0.2752073, -0.3405146, -2.868742, 1, 1, 1, 1, 1,
-0.2746154, -1.531273, -3.411027, 1, 1, 1, 1, 1,
-0.2713941, -0.09240861, -0.5533965, 1, 1, 1, 1, 1,
-0.2697424, -0.8167551, -2.902002, 1, 1, 1, 1, 1,
-0.2682571, -1.983315, -2.58698, 1, 1, 1, 1, 1,
-0.2654372, -1.088423, -2.665463, 1, 1, 1, 1, 1,
-0.2634535, -0.7296315, -2.570045, 1, 1, 1, 1, 1,
-0.2624075, 0.2883001, -0.760187, 1, 1, 1, 1, 1,
-0.2614124, -2.641663, -2.595929, 1, 1, 1, 1, 1,
-0.2609279, 0.282613, -1.518507, 0, 0, 1, 1, 1,
-0.2538263, -1.69693, -2.750776, 1, 0, 0, 1, 1,
-0.253112, -2.079921, -3.619946, 1, 0, 0, 1, 1,
-0.2417498, 0.632866, -0.2471975, 1, 0, 0, 1, 1,
-0.2399787, -0.7820137, -2.721158, 1, 0, 0, 1, 1,
-0.2392139, -0.4610106, -1.123284, 1, 0, 0, 1, 1,
-0.2373971, -0.0008391789, -1.729232, 0, 0, 0, 1, 1,
-0.2370595, 1.50554, 0.3272476, 0, 0, 0, 1, 1,
-0.2344433, 1.692525, 1.350547, 0, 0, 0, 1, 1,
-0.2291528, 0.05588032, -1.460998, 0, 0, 0, 1, 1,
-0.2253374, 1.584062, -0.6517913, 0, 0, 0, 1, 1,
-0.2251356, 1.292379, 0.369756, 0, 0, 0, 1, 1,
-0.2250466, 1.851378, -0.5712057, 0, 0, 0, 1, 1,
-0.2183854, 0.248777, -0.2671187, 1, 1, 1, 1, 1,
-0.2180796, 1.882253, -0.3658819, 1, 1, 1, 1, 1,
-0.2162877, 0.2670027, 0.3174362, 1, 1, 1, 1, 1,
-0.2151769, -0.1758642, -2.469401, 1, 1, 1, 1, 1,
-0.2072749, 0.9486634, 0.168272, 1, 1, 1, 1, 1,
-0.2070687, -2.182325, -3.243357, 1, 1, 1, 1, 1,
-0.2069095, -0.6923352, -3.122808, 1, 1, 1, 1, 1,
-0.2061969, -0.8539881, -3.445382, 1, 1, 1, 1, 1,
-0.2043454, 0.3220294, -1.425523, 1, 1, 1, 1, 1,
-0.2000934, 1.516025, 1.494061, 1, 1, 1, 1, 1,
-0.1993426, 0.8341948, 1.590617, 1, 1, 1, 1, 1,
-0.1990657, 0.698499, -0.5671422, 1, 1, 1, 1, 1,
-0.193154, -0.2193224, -2.695319, 1, 1, 1, 1, 1,
-0.1906536, 1.467489, 0.5868841, 1, 1, 1, 1, 1,
-0.1896529, 1.262817, -1.074494, 1, 1, 1, 1, 1,
-0.1887681, 1.012055, -1.360005, 0, 0, 1, 1, 1,
-0.1878397, -1.172452, -4.568088, 1, 0, 0, 1, 1,
-0.1871144, -0.3636077, -1.497418, 1, 0, 0, 1, 1,
-0.1842069, -1.637207, -4.589952, 1, 0, 0, 1, 1,
-0.1821511, 0.9769325, 0.8969304, 1, 0, 0, 1, 1,
-0.1806515, -1.071901, -3.796758, 1, 0, 0, 1, 1,
-0.1799869, -0.3343203, -3.388138, 0, 0, 0, 1, 1,
-0.1789232, -0.9107282, -2.466617, 0, 0, 0, 1, 1,
-0.1757501, 0.5129365, -0.8820621, 0, 0, 0, 1, 1,
-0.1742277, -0.01108697, -1.287778, 0, 0, 0, 1, 1,
-0.1710887, -1.389813, -2.391012, 0, 0, 0, 1, 1,
-0.1662114, -0.4690706, -2.808449, 0, 0, 0, 1, 1,
-0.166068, 0.8370681, -1.496644, 0, 0, 0, 1, 1,
-0.1635603, -1.057205, -3.57539, 1, 1, 1, 1, 1,
-0.1476565, -0.4493993, -1.266834, 1, 1, 1, 1, 1,
-0.1462053, 0.7072887, -2.409373, 1, 1, 1, 1, 1,
-0.1461497, -1.918003, -3.663357, 1, 1, 1, 1, 1,
-0.1453277, -0.4097134, -2.037495, 1, 1, 1, 1, 1,
-0.1443021, -0.645873, -3.333825, 1, 1, 1, 1, 1,
-0.143355, 0.6305443, -0.7265755, 1, 1, 1, 1, 1,
-0.141214, 0.2063282, -1.073088, 1, 1, 1, 1, 1,
-0.1397685, 1.185372, -1.192516, 1, 1, 1, 1, 1,
-0.1356533, -0.3293268, -2.986595, 1, 1, 1, 1, 1,
-0.1352049, -2.819789, -3.21238, 1, 1, 1, 1, 1,
-0.1350932, -0.3622382, -0.8652459, 1, 1, 1, 1, 1,
-0.1344861, 0.807342, -1.85059, 1, 1, 1, 1, 1,
-0.1335035, 0.772229, 1.682116, 1, 1, 1, 1, 1,
-0.1327942, -1.431515, -1.108884, 1, 1, 1, 1, 1,
-0.1327835, 0.6662654, -0.8582723, 0, 0, 1, 1, 1,
-0.1316863, -1.114625, -3.075362, 1, 0, 0, 1, 1,
-0.1291209, -0.3066934, -1.384437, 1, 0, 0, 1, 1,
-0.1285402, 0.1506783, -0.7111521, 1, 0, 0, 1, 1,
-0.1282419, 0.01333791, -1.853022, 1, 0, 0, 1, 1,
-0.1260325, 0.3380891, 0.3130788, 1, 0, 0, 1, 1,
-0.1240863, 0.2598437, -1.397902, 0, 0, 0, 1, 1,
-0.1225212, -0.1699325, -3.393862, 0, 0, 0, 1, 1,
-0.1189527, -0.7829028, -2.189414, 0, 0, 0, 1, 1,
-0.118393, -0.8201305, -4.143604, 0, 0, 0, 1, 1,
-0.1176549, 0.6902292, 2.126243, 0, 0, 0, 1, 1,
-0.1158963, 1.539043, -0.3505392, 0, 0, 0, 1, 1,
-0.1111966, -1.291802, -4.966083, 0, 0, 0, 1, 1,
-0.1090962, 0.07018878, -0.9521512, 1, 1, 1, 1, 1,
-0.1063584, 0.6194163, -1.207835, 1, 1, 1, 1, 1,
-0.1021238, 0.7003866, -0.9249594, 1, 1, 1, 1, 1,
-0.09787581, 0.826339, 0.20262, 1, 1, 1, 1, 1,
-0.09599666, -0.2607309, -2.199381, 1, 1, 1, 1, 1,
-0.09333149, -1.930462, -3.808537, 1, 1, 1, 1, 1,
-0.09255518, -1.225623, -2.429473, 1, 1, 1, 1, 1,
-0.08450011, 0.5081859, -0.9296672, 1, 1, 1, 1, 1,
-0.07797966, -1.351841, -4.256371, 1, 1, 1, 1, 1,
-0.07081994, 0.8425385, -0.5275386, 1, 1, 1, 1, 1,
-0.07065411, -0.2205557, -1.171227, 1, 1, 1, 1, 1,
-0.07046728, 0.6681634, -0.453264, 1, 1, 1, 1, 1,
-0.06766753, 0.6194673, -1.722128, 1, 1, 1, 1, 1,
-0.06751529, 0.4054708, -0.7886191, 1, 1, 1, 1, 1,
-0.06670979, 1.471229, -1.334978, 1, 1, 1, 1, 1,
-0.06394956, 0.1465768, -1.92215, 0, 0, 1, 1, 1,
-0.06151232, -0.2611232, -2.684797, 1, 0, 0, 1, 1,
-0.06083735, 0.3504224, -0.9481928, 1, 0, 0, 1, 1,
-0.06082539, -0.8827918, -1.812961, 1, 0, 0, 1, 1,
-0.05901606, -0.5335495, -2.584, 1, 0, 0, 1, 1,
-0.05769692, 1.524487, -1.737731, 1, 0, 0, 1, 1,
-0.04870903, -0.01030567, -2.795076, 0, 0, 0, 1, 1,
-0.04299573, 0.9660659, -1.253614, 0, 0, 0, 1, 1,
-0.03946735, -0.5474046, -1.736612, 0, 0, 0, 1, 1,
-0.03621078, -1.261844, -3.542738, 0, 0, 0, 1, 1,
-0.03600336, -1.643134, -3.332411, 0, 0, 0, 1, 1,
-0.03452393, 0.1703673, -1.449915, 0, 0, 0, 1, 1,
-0.03287956, -0.3005701, -3.243461, 0, 0, 0, 1, 1,
-0.03004234, -1.09169, -1.489819, 1, 1, 1, 1, 1,
-0.0230426, 1.467372, -1.722668, 1, 1, 1, 1, 1,
-0.01733146, -1.455802, -4.044892, 1, 1, 1, 1, 1,
-0.01690514, -0.881581, -3.123222, 1, 1, 1, 1, 1,
-0.01555331, -0.4193345, -1.586847, 1, 1, 1, 1, 1,
-0.01505734, 1.569831, -0.1034535, 1, 1, 1, 1, 1,
-0.01411309, 0.6714413, 1.133836, 1, 1, 1, 1, 1,
-0.01017445, -0.3262576, -1.779118, 1, 1, 1, 1, 1,
-0.00994636, 0.4132085, -1.082261, 1, 1, 1, 1, 1,
-0.009002752, 0.2726857, -0.5980259, 1, 1, 1, 1, 1,
0.001305725, 0.06328508, 0.1709464, 1, 1, 1, 1, 1,
0.005999513, 0.6834411, 1.612617, 1, 1, 1, 1, 1,
0.006234047, 0.1160003, -0.6287379, 1, 1, 1, 1, 1,
0.009660346, 0.6196847, 1.019507, 1, 1, 1, 1, 1,
0.0107916, 0.652217, 0.1077608, 1, 1, 1, 1, 1,
0.01093114, -0.4602114, 3.01638, 0, 0, 1, 1, 1,
0.01101917, -0.3082501, 2.808499, 1, 0, 0, 1, 1,
0.02112562, 1.133991, -0.2135613, 1, 0, 0, 1, 1,
0.02161146, -0.4687082, 1.971742, 1, 0, 0, 1, 1,
0.02377381, 1.484148, -2.349395, 1, 0, 0, 1, 1,
0.02581844, 1.104623, -0.3281848, 1, 0, 0, 1, 1,
0.03018444, 0.3993276, 1.087407, 0, 0, 0, 1, 1,
0.03116715, 0.767045, -1.294789, 0, 0, 0, 1, 1,
0.03499513, -0.2592028, 3.885824, 0, 0, 0, 1, 1,
0.0363954, -0.3050539, 3.427062, 0, 0, 0, 1, 1,
0.03919532, 1.285964, -0.7531531, 0, 0, 0, 1, 1,
0.04278978, 0.8984649, -0.3770976, 0, 0, 0, 1, 1,
0.04715022, 0.6227521, 0.9831313, 0, 0, 0, 1, 1,
0.05729079, 1.070101, 0.3913063, 1, 1, 1, 1, 1,
0.05838153, 0.5329723, 0.9002224, 1, 1, 1, 1, 1,
0.05875092, 1.694564, 0.2033739, 1, 1, 1, 1, 1,
0.05939152, -0.3830524, 1.634587, 1, 1, 1, 1, 1,
0.06644987, -0.6393111, 1.687732, 1, 1, 1, 1, 1,
0.06820111, -0.1082471, 2.62879, 1, 1, 1, 1, 1,
0.06889667, 0.491898, -0.3842144, 1, 1, 1, 1, 1,
0.07052549, 0.5766494, -0.3930669, 1, 1, 1, 1, 1,
0.07609714, -0.06072117, 2.425466, 1, 1, 1, 1, 1,
0.07859119, 1.628048, 0.230797, 1, 1, 1, 1, 1,
0.07967632, -0.114761, 3.622183, 1, 1, 1, 1, 1,
0.08149971, -0.4027116, 1.782892, 1, 1, 1, 1, 1,
0.08271535, 0.3071598, 1.014923, 1, 1, 1, 1, 1,
0.08794937, -1.286801, 3.057344, 1, 1, 1, 1, 1,
0.08876437, -1.537246, 5.242463, 1, 1, 1, 1, 1,
0.09039731, 1.515419, -0.7711403, 0, 0, 1, 1, 1,
0.09534582, -0.7304154, 3.396887, 1, 0, 0, 1, 1,
0.1005275, -0.6041828, 4.06238, 1, 0, 0, 1, 1,
0.1067644, 3.022156, -0.3379817, 1, 0, 0, 1, 1,
0.1096589, 0.8002813, 0.6279978, 1, 0, 0, 1, 1,
0.1111881, -0.08468481, 1.759649, 1, 0, 0, 1, 1,
0.119291, -0.8911306, 3.559996, 0, 0, 0, 1, 1,
0.1204307, -0.04901748, 0.7361835, 0, 0, 0, 1, 1,
0.1207761, 1.717801, 0.08277595, 0, 0, 0, 1, 1,
0.1210087, 0.02416866, 0.6017553, 0, 0, 0, 1, 1,
0.1217127, -0.5879253, 2.987558, 0, 0, 0, 1, 1,
0.1217799, -1.864935, 2.077395, 0, 0, 0, 1, 1,
0.1251461, -1.74793, 1.750353, 0, 0, 0, 1, 1,
0.1333798, -0.5987638, 3.881087, 1, 1, 1, 1, 1,
0.1359015, -2.518798, 1.086059, 1, 1, 1, 1, 1,
0.1363202, 0.3183797, 0.8753507, 1, 1, 1, 1, 1,
0.1363982, 0.5369452, 0.7086025, 1, 1, 1, 1, 1,
0.1396718, -0.3411079, 0.8964353, 1, 1, 1, 1, 1,
0.140552, 0.6984586, -1.807511, 1, 1, 1, 1, 1,
0.1420131, -0.5851605, 4.981128, 1, 1, 1, 1, 1,
0.1424085, 0.4704257, -0.01662039, 1, 1, 1, 1, 1,
0.1442264, 0.6538371, 0.4296759, 1, 1, 1, 1, 1,
0.1482282, 0.4486572, -0.3493674, 1, 1, 1, 1, 1,
0.1486695, -0.5544651, 3.310506, 1, 1, 1, 1, 1,
0.1527934, -0.2790786, 3.902557, 1, 1, 1, 1, 1,
0.1583418, -1.158888, 3.702422, 1, 1, 1, 1, 1,
0.1644085, 1.50939, 0.1458881, 1, 1, 1, 1, 1,
0.1650426, 0.2523834, 2.014889, 1, 1, 1, 1, 1,
0.1682098, 0.3043391, 2.929588, 0, 0, 1, 1, 1,
0.1793904, 1.234238, -0.04467292, 1, 0, 0, 1, 1,
0.1799513, -1.448553, 2.843268, 1, 0, 0, 1, 1,
0.18315, -0.02519899, 2.121024, 1, 0, 0, 1, 1,
0.1843836, 2.238324, 0.5232525, 1, 0, 0, 1, 1,
0.1844569, 0.5604261, 0.229123, 1, 0, 0, 1, 1,
0.193513, -1.345747, 1.789134, 0, 0, 0, 1, 1,
0.1970812, -0.7749951, 2.645237, 0, 0, 0, 1, 1,
0.1975379, 0.5735312, -0.19578, 0, 0, 0, 1, 1,
0.1977197, 1.615672, 0.6618486, 0, 0, 0, 1, 1,
0.1996855, -0.1610012, 2.504525, 0, 0, 0, 1, 1,
0.2018852, 0.8191972, 0.3959653, 0, 0, 0, 1, 1,
0.2082748, 0.5044423, 1.266308, 0, 0, 0, 1, 1,
0.2109261, 0.7637594, 1.271674, 1, 1, 1, 1, 1,
0.212386, 1.323478, 0.3234155, 1, 1, 1, 1, 1,
0.2159612, -0.306652, 2.264747, 1, 1, 1, 1, 1,
0.2179785, 0.9111366, 0.2199395, 1, 1, 1, 1, 1,
0.2191914, 1.212352, 0.7538961, 1, 1, 1, 1, 1,
0.2201922, -0.2228852, 0.7946019, 1, 1, 1, 1, 1,
0.2361138, -1.065616, 2.651063, 1, 1, 1, 1, 1,
0.2379778, -0.3591895, 3.09461, 1, 1, 1, 1, 1,
0.2447631, -1.859438, 1.859248, 1, 1, 1, 1, 1,
0.245077, -0.1109304, 1.86679, 1, 1, 1, 1, 1,
0.2484265, 0.4323303, 0.7294112, 1, 1, 1, 1, 1,
0.2525648, 0.2582036, 0.9254801, 1, 1, 1, 1, 1,
0.2546778, 0.6643185, -0.4639296, 1, 1, 1, 1, 1,
0.254808, -1.309999, 3.141955, 1, 1, 1, 1, 1,
0.2554342, 1.565835, 0.3557348, 1, 1, 1, 1, 1,
0.2564482, -0.4200376, 4.19031, 0, 0, 1, 1, 1,
0.2567669, 0.3213814, 0.6036852, 1, 0, 0, 1, 1,
0.2575743, -0.9474394, 2.177129, 1, 0, 0, 1, 1,
0.2580153, -0.7835531, 2.122387, 1, 0, 0, 1, 1,
0.263796, -0.4964186, 1.921864, 1, 0, 0, 1, 1,
0.264227, -0.7116929, 2.740947, 1, 0, 0, 1, 1,
0.26588, -1.528288, 1.974356, 0, 0, 0, 1, 1,
0.2678091, 0.324085, 1.757223, 0, 0, 0, 1, 1,
0.2706218, -1.170938, 3.419945, 0, 0, 0, 1, 1,
0.2747353, -0.1109222, 2.258947, 0, 0, 0, 1, 1,
0.2820432, -0.02074971, 0.3221838, 0, 0, 0, 1, 1,
0.2853218, -0.2788904, 2.601914, 0, 0, 0, 1, 1,
0.2870604, 0.002696319, 1.356128, 0, 0, 0, 1, 1,
0.2877105, 1.352366, -0.3348677, 1, 1, 1, 1, 1,
0.2938881, -0.2008012, 1.813352, 1, 1, 1, 1, 1,
0.2950669, -1.060928, 1.916907, 1, 1, 1, 1, 1,
0.2993033, 0.3399162, -0.3276092, 1, 1, 1, 1, 1,
0.3001138, 1.15097, 1.247972, 1, 1, 1, 1, 1,
0.3024115, -0.06169678, 3.100903, 1, 1, 1, 1, 1,
0.3037177, -2.493816, 1.94799, 1, 1, 1, 1, 1,
0.3121037, -0.5491598, 2.878451, 1, 1, 1, 1, 1,
0.3147278, -0.1250233, 0.9070644, 1, 1, 1, 1, 1,
0.3193355, 0.1516178, 2.443176, 1, 1, 1, 1, 1,
0.3243873, -0.3024617, 3.264181, 1, 1, 1, 1, 1,
0.3330337, 0.1804577, 0.439497, 1, 1, 1, 1, 1,
0.3331752, 0.2305182, 0.7431149, 1, 1, 1, 1, 1,
0.3338388, 0.104275, 0.9632849, 1, 1, 1, 1, 1,
0.3416081, -2.425292, 2.525271, 1, 1, 1, 1, 1,
0.3443738, 0.7698382, -0.04892493, 0, 0, 1, 1, 1,
0.3463603, -0.6478954, 1.689056, 1, 0, 0, 1, 1,
0.348206, 0.4556404, 2.277384, 1, 0, 0, 1, 1,
0.3487214, 0.5484722, 0.260216, 1, 0, 0, 1, 1,
0.3497307, -0.691916, 1.823367, 1, 0, 0, 1, 1,
0.3497873, -0.227044, 2.167797, 1, 0, 0, 1, 1,
0.3534342, 0.05226317, 0.9098744, 0, 0, 0, 1, 1,
0.3622465, 0.3379979, -0.5474659, 0, 0, 0, 1, 1,
0.3659206, -0.7388706, 3.857859, 0, 0, 0, 1, 1,
0.3710567, -0.3961478, 4.043332, 0, 0, 0, 1, 1,
0.3713828, -0.1223295, 0.8385221, 0, 0, 0, 1, 1,
0.3755168, -0.1931698, 1.632813, 0, 0, 0, 1, 1,
0.384293, -0.1402373, 3.299943, 0, 0, 0, 1, 1,
0.3860645, -0.5849683, 1.077442, 1, 1, 1, 1, 1,
0.3867606, -0.2008381, 2.926814, 1, 1, 1, 1, 1,
0.3869482, 0.4963911, 1.049914, 1, 1, 1, 1, 1,
0.3897482, 0.382805, 0.3821846, 1, 1, 1, 1, 1,
0.3943735, -0.3990978, 1.273243, 1, 1, 1, 1, 1,
0.3981024, -0.09515022, 1.221405, 1, 1, 1, 1, 1,
0.4034767, 0.4516349, 0.6701773, 1, 1, 1, 1, 1,
0.4043066, -0.4413854, 2.409054, 1, 1, 1, 1, 1,
0.4069695, 0.4298784, 0.4730309, 1, 1, 1, 1, 1,
0.4089808, -0.5206803, 2.048739, 1, 1, 1, 1, 1,
0.4102911, 0.4637051, 1.191006, 1, 1, 1, 1, 1,
0.4106998, -0.2280211, 0.2148934, 1, 1, 1, 1, 1,
0.4134801, -0.1083288, 3.045103, 1, 1, 1, 1, 1,
0.4138532, -1.629389, 4.278569, 1, 1, 1, 1, 1,
0.4166606, -1.335063, 3.136487, 1, 1, 1, 1, 1,
0.4193103, -0.588291, 2.131113, 0, 0, 1, 1, 1,
0.4199487, 1.100388, 1.753428, 1, 0, 0, 1, 1,
0.4238922, 0.4823442, 0.2268938, 1, 0, 0, 1, 1,
0.4266623, -0.564998, 1.562865, 1, 0, 0, 1, 1,
0.4275287, -1.608082, 1.923935, 1, 0, 0, 1, 1,
0.4297852, 0.1745715, 0.6177331, 1, 0, 0, 1, 1,
0.4323568, -0.2040264, 1.391136, 0, 0, 0, 1, 1,
0.4327858, 0.1015872, 1.661253, 0, 0, 0, 1, 1,
0.4341838, 1.051828, -0.6600119, 0, 0, 0, 1, 1,
0.4384369, 1.145099, 1.771173, 0, 0, 0, 1, 1,
0.4408283, -0.1488509, 0.9898192, 0, 0, 0, 1, 1,
0.4418298, 1.124493, 0.5335945, 0, 0, 0, 1, 1,
0.4418762, 0.3477757, 0.1194014, 0, 0, 0, 1, 1,
0.4425082, 0.01964613, 0.1726882, 1, 1, 1, 1, 1,
0.4432323, -1.090533, 2.212472, 1, 1, 1, 1, 1,
0.4434458, 1.228724, -0.9359609, 1, 1, 1, 1, 1,
0.4465691, -0.1440476, 1.796599, 1, 1, 1, 1, 1,
0.44824, -0.02049641, 0.7547964, 1, 1, 1, 1, 1,
0.4509324, -0.1452582, 1.601378, 1, 1, 1, 1, 1,
0.45335, 0.1435396, 2.247322, 1, 1, 1, 1, 1,
0.4555255, -0.02289921, 1.78261, 1, 1, 1, 1, 1,
0.4567701, 0.6456895, 0.5781159, 1, 1, 1, 1, 1,
0.4598113, 0.3854919, 1.196885, 1, 1, 1, 1, 1,
0.4617268, -0.8788055, 1.458047, 1, 1, 1, 1, 1,
0.4668266, 0.5989116, -0.7958514, 1, 1, 1, 1, 1,
0.4686407, -1.768466, 2.424142, 1, 1, 1, 1, 1,
0.4707392, 0.4424621, 2.104558, 1, 1, 1, 1, 1,
0.4874254, 0.8895105, 0.3987271, 1, 1, 1, 1, 1,
0.4916132, -0.4864094, 3.413841, 0, 0, 1, 1, 1,
0.4937896, -0.2953583, 3.232542, 1, 0, 0, 1, 1,
0.4951888, -0.5240867, 1.798148, 1, 0, 0, 1, 1,
0.4959581, 0.3349789, 1.469073, 1, 0, 0, 1, 1,
0.5065599, 1.621042, 1.681771, 1, 0, 0, 1, 1,
0.5076284, 0.4609704, 2.439215, 1, 0, 0, 1, 1,
0.5078666, 0.7361748, 2.512775, 0, 0, 0, 1, 1,
0.5133412, 0.6375275, 2.319905, 0, 0, 0, 1, 1,
0.5213685, 1.216757, -0.05718324, 0, 0, 0, 1, 1,
0.5227732, 0.5444104, 2.047685, 0, 0, 0, 1, 1,
0.5288942, 0.6377814, 1.971881, 0, 0, 0, 1, 1,
0.5332111, -0.1637032, 2.172706, 0, 0, 0, 1, 1,
0.5382396, -0.7625341, 3.033798, 0, 0, 0, 1, 1,
0.5382479, -0.5588369, 3.748696, 1, 1, 1, 1, 1,
0.5392305, 0.6388617, 0.917597, 1, 1, 1, 1, 1,
0.5404288, -0.6875792, 2.154692, 1, 1, 1, 1, 1,
0.5460384, -2.598036, 3.367298, 1, 1, 1, 1, 1,
0.5494094, -1.572064, 3.821612, 1, 1, 1, 1, 1,
0.5496494, -0.7016421, 2.134706, 1, 1, 1, 1, 1,
0.5500384, -0.2360013, 2.970844, 1, 1, 1, 1, 1,
0.5552718, -0.8048214, 1.538346, 1, 1, 1, 1, 1,
0.5555933, 1.602123, -0.4531673, 1, 1, 1, 1, 1,
0.5559333, -0.5233267, 2.358839, 1, 1, 1, 1, 1,
0.5562714, 1.341794, 0.4111291, 1, 1, 1, 1, 1,
0.5572797, -1.401769, 2.963397, 1, 1, 1, 1, 1,
0.558566, 0.9176898, 1.444778, 1, 1, 1, 1, 1,
0.5619976, -0.6365957, 1.908266, 1, 1, 1, 1, 1,
0.5667639, -2.092635, 3.209387, 1, 1, 1, 1, 1,
0.5673621, 0.6148347, -0.548924, 0, 0, 1, 1, 1,
0.5706845, 2.181867, 0.5139509, 1, 0, 0, 1, 1,
0.5721924, 0.228662, 1.666059, 1, 0, 0, 1, 1,
0.574623, 1.054158, 0.03693038, 1, 0, 0, 1, 1,
0.5788739, -0.7937792, 2.853385, 1, 0, 0, 1, 1,
0.581943, -1.638296, 0.5801564, 1, 0, 0, 1, 1,
0.5871687, -1.612212, 2.408965, 0, 0, 0, 1, 1,
0.5930178, -0.06541661, 1.37047, 0, 0, 0, 1, 1,
0.5941504, -0.2500101, 3.521904, 0, 0, 0, 1, 1,
0.5950899, -1.88923, 1.946373, 0, 0, 0, 1, 1,
0.6002921, 0.8262742, 2.693862, 0, 0, 0, 1, 1,
0.6006288, 2.07031, -0.741613, 0, 0, 0, 1, 1,
0.6008825, 1.147119, 1.062889, 0, 0, 0, 1, 1,
0.6033466, -0.9573621, 3.82368, 1, 1, 1, 1, 1,
0.606992, -0.5239949, 2.313, 1, 1, 1, 1, 1,
0.6077607, 1.218055, 0.5208427, 1, 1, 1, 1, 1,
0.6141707, -1.903425, 2.405715, 1, 1, 1, 1, 1,
0.6251963, -1.080772, 1.103066, 1, 1, 1, 1, 1,
0.626462, -1.327887, 1.344856, 1, 1, 1, 1, 1,
0.6289051, -0.01876737, 1.588857, 1, 1, 1, 1, 1,
0.6408588, -1.77799, 3.239779, 1, 1, 1, 1, 1,
0.6467718, 1.38755, 2.059267, 1, 1, 1, 1, 1,
0.649101, -3.054604, 2.551664, 1, 1, 1, 1, 1,
0.6495654, -1.297029, 2.411319, 1, 1, 1, 1, 1,
0.6509382, 0.9497243, 0.2914329, 1, 1, 1, 1, 1,
0.651333, 1.021902, 1.077554, 1, 1, 1, 1, 1,
0.6544159, -0.129085, -0.1085741, 1, 1, 1, 1, 1,
0.6604689, 0.4375719, 0.3622297, 1, 1, 1, 1, 1,
0.6652225, -1.147401, 2.109799, 0, 0, 1, 1, 1,
0.6661659, 2.316434, -0.4001977, 1, 0, 0, 1, 1,
0.6665114, -2.435362, 2.35362, 1, 0, 0, 1, 1,
0.6699632, -1.284664, 2.260393, 1, 0, 0, 1, 1,
0.6769043, 0.153965, 0.6933995, 1, 0, 0, 1, 1,
0.6785741, 0.254762, -0.6174763, 1, 0, 0, 1, 1,
0.6788633, 0.2411896, 0.808486, 0, 0, 0, 1, 1,
0.6792632, -1.007945, 1.347463, 0, 0, 0, 1, 1,
0.6808122, 0.7334265, 0.895988, 0, 0, 0, 1, 1,
0.6841033, -0.4339317, 1.154858, 0, 0, 0, 1, 1,
0.6957847, -1.599397, 1.04087, 0, 0, 0, 1, 1,
0.6986188, 0.854607, 2.26526, 0, 0, 0, 1, 1,
0.7015609, -0.6405568, 2.054132, 0, 0, 0, 1, 1,
0.7018229, 0.7718829, 0.4649574, 1, 1, 1, 1, 1,
0.7025005, -0.331553, 2.068792, 1, 1, 1, 1, 1,
0.7106618, 2.598879, 1.39307, 1, 1, 1, 1, 1,
0.7149825, 1.366417, -0.3437573, 1, 1, 1, 1, 1,
0.7160896, 0.8424979, 1.381731, 1, 1, 1, 1, 1,
0.7191918, -1.804931, 2.849686, 1, 1, 1, 1, 1,
0.7196952, -0.2911285, 2.260619, 1, 1, 1, 1, 1,
0.7206556, -0.4204059, 1.312728, 1, 1, 1, 1, 1,
0.7228467, -0.3768784, 1.638464, 1, 1, 1, 1, 1,
0.7229607, -1.252491, 3.019554, 1, 1, 1, 1, 1,
0.7293206, 1.681479, 2.616342, 1, 1, 1, 1, 1,
0.7315824, 0.8781117, 0.2633999, 1, 1, 1, 1, 1,
0.7414799, -1.459056, 3.665227, 1, 1, 1, 1, 1,
0.7451138, -0.334767, 2.826187, 1, 1, 1, 1, 1,
0.7541448, 1.061626, 0.5887299, 1, 1, 1, 1, 1,
0.76111, 1.815728, 0.5843302, 0, 0, 1, 1, 1,
0.767938, -0.847771, 2.296526, 1, 0, 0, 1, 1,
0.7691555, 1.736841, -0.8455455, 1, 0, 0, 1, 1,
0.7709935, -0.02400577, -0.005555284, 1, 0, 0, 1, 1,
0.7726723, 0.07391581, 1.58505, 1, 0, 0, 1, 1,
0.780233, 0.2355311, 2.482668, 1, 0, 0, 1, 1,
0.7825317, 0.6542293, 0.4502072, 0, 0, 0, 1, 1,
0.7845517, -0.02451418, 0.935164, 0, 0, 0, 1, 1,
0.7886402, 0.3913231, 2.769545, 0, 0, 0, 1, 1,
0.7891152, 0.5728425, 0.316797, 0, 0, 0, 1, 1,
0.7916986, -1.34643, 1.737446, 0, 0, 0, 1, 1,
0.7932377, -0.1174502, 2.963084, 0, 0, 0, 1, 1,
0.7998478, -0.4149196, 0.3172628, 0, 0, 0, 1, 1,
0.806511, 1.023623, 1.308906, 1, 1, 1, 1, 1,
0.8079017, -0.2727003, 2.067415, 1, 1, 1, 1, 1,
0.8086969, 1.156366, 1.089604, 1, 1, 1, 1, 1,
0.8105708, -0.2431768, 1.00287, 1, 1, 1, 1, 1,
0.8115357, -0.3659653, 0.732739, 1, 1, 1, 1, 1,
0.8139879, 1.175359, 0.5837336, 1, 1, 1, 1, 1,
0.8142162, -1.953834, 2.008771, 1, 1, 1, 1, 1,
0.814657, 0.08907341, 0.6484507, 1, 1, 1, 1, 1,
0.8167678, -0.457642, 2.833518, 1, 1, 1, 1, 1,
0.8195175, 0.2708786, 1.039142, 1, 1, 1, 1, 1,
0.8198806, 2.348961, 1.521628, 1, 1, 1, 1, 1,
0.8219898, -0.1382407, 1.95016, 1, 1, 1, 1, 1,
0.8242826, 1.720828, -0.9420721, 1, 1, 1, 1, 1,
0.8251497, 1.506179, -0.02398788, 1, 1, 1, 1, 1,
0.8304335, 0.1707599, 0.1293783, 1, 1, 1, 1, 1,
0.8308568, -0.371286, 2.645495, 0, 0, 1, 1, 1,
0.8310955, 0.2587581, -0.05405964, 1, 0, 0, 1, 1,
0.8311869, 0.6766788, -0.9379767, 1, 0, 0, 1, 1,
0.832693, -0.07686974, 2.541617, 1, 0, 0, 1, 1,
0.8454685, 0.4161882, 3.884164, 1, 0, 0, 1, 1,
0.8458858, 0.2286679, 2.011227, 1, 0, 0, 1, 1,
0.851319, 0.3525496, 1.436974, 0, 0, 0, 1, 1,
0.8540181, -0.4150337, 2.737948, 0, 0, 0, 1, 1,
0.8550593, -0.258584, 2.682183, 0, 0, 0, 1, 1,
0.8582792, -0.9823027, 1.664544, 0, 0, 0, 1, 1,
0.8604753, -1.442785, 3.646768, 0, 0, 0, 1, 1,
0.8626655, 0.763963, 1.437215, 0, 0, 0, 1, 1,
0.8762512, 0.9121282, 0.6236899, 0, 0, 0, 1, 1,
0.880316, -0.6933061, 1.918144, 1, 1, 1, 1, 1,
0.8825139, -2.249445, 3.020947, 1, 1, 1, 1, 1,
0.8848832, 0.3763913, 1.505291, 1, 1, 1, 1, 1,
0.8887616, 0.7209954, 3.188438, 1, 1, 1, 1, 1,
0.8898388, 0.3555863, 1.116025, 1, 1, 1, 1, 1,
0.9020779, 0.4281558, 0.4801875, 1, 1, 1, 1, 1,
0.9033492, 0.3442514, -0.4706022, 1, 1, 1, 1, 1,
0.9101608, 0.3707832, 2.555231, 1, 1, 1, 1, 1,
0.9149843, -0.1526887, 3.440778, 1, 1, 1, 1, 1,
0.9183089, -0.1954673, 2.183818, 1, 1, 1, 1, 1,
0.9197479, 0.7222747, 0.1943759, 1, 1, 1, 1, 1,
0.9269264, 0.459307, 0.852554, 1, 1, 1, 1, 1,
0.929005, 0.5197971, 2.056064, 1, 1, 1, 1, 1,
0.9357051, -0.1592227, 2.610047, 1, 1, 1, 1, 1,
0.9365472, -0.1348188, 2.841372, 1, 1, 1, 1, 1,
0.9406334, 0.7396795, -0.1953994, 0, 0, 1, 1, 1,
0.9452314, 0.5213678, 1.400406, 1, 0, 0, 1, 1,
0.9519669, 0.5085161, 0.7855861, 1, 0, 0, 1, 1,
0.9564554, 0.08973025, 0.7359614, 1, 0, 0, 1, 1,
0.9575363, -1.723609, 2.01375, 1, 0, 0, 1, 1,
0.9598191, -0.3040458, 1.226097, 1, 0, 0, 1, 1,
0.9621985, 1.186226, 0.05854034, 0, 0, 0, 1, 1,
0.9630359, 0.1476458, 1.255279, 0, 0, 0, 1, 1,
0.9631327, 0.9579546, -0.5429349, 0, 0, 0, 1, 1,
0.9631887, -0.9147064, 1.762962, 0, 0, 0, 1, 1,
0.9704028, 1.761729, 0.1695649, 0, 0, 0, 1, 1,
0.9749903, -0.9908909, 1.966217, 0, 0, 0, 1, 1,
0.9755065, 0.2483789, 0.1166885, 0, 0, 0, 1, 1,
0.9777881, -0.7866903, 3.282057, 1, 1, 1, 1, 1,
0.9784811, 0.3909675, 2.239902, 1, 1, 1, 1, 1,
0.9851458, -0.6212165, 1.670358, 1, 1, 1, 1, 1,
0.9922821, -0.4874739, 3.098149, 1, 1, 1, 1, 1,
0.9971135, 2.238243, 0.9709826, 1, 1, 1, 1, 1,
0.9975943, 0.1148442, 0.4275031, 1, 1, 1, 1, 1,
0.9996004, 0.1539499, 1.133454, 1, 1, 1, 1, 1,
1.001063, 0.7658597, -0.1056496, 1, 1, 1, 1, 1,
1.005714, -0.5420948, 3.134428, 1, 1, 1, 1, 1,
1.017679, 0.4411857, 1.578703, 1, 1, 1, 1, 1,
1.023759, 0.1806118, 1.803261, 1, 1, 1, 1, 1,
1.026782, -1.25238, 2.991757, 1, 1, 1, 1, 1,
1.029989, -3.294971, 2.958277, 1, 1, 1, 1, 1,
1.032562, -0.1331735, 0.9568411, 1, 1, 1, 1, 1,
1.049131, 1.657073, 1.979753, 1, 1, 1, 1, 1,
1.049976, -0.6015726, 3.273771, 0, 0, 1, 1, 1,
1.057019, 0.3851823, -0.3009597, 1, 0, 0, 1, 1,
1.067384, 0.6510065, 1.945396, 1, 0, 0, 1, 1,
1.070794, -2.086607, 2.254575, 1, 0, 0, 1, 1,
1.075333, -0.8265092, 2.858173, 1, 0, 0, 1, 1,
1.079022, 0.02893693, 2.020707, 1, 0, 0, 1, 1,
1.087223, -0.5314372, 1.767016, 0, 0, 0, 1, 1,
1.097631, -0.1641996, 0.3328048, 0, 0, 0, 1, 1,
1.097877, 0.1467877, 1.30703, 0, 0, 0, 1, 1,
1.100842, 1.122657, -0.5080393, 0, 0, 0, 1, 1,
1.101915, -0.1370226, 1.238401, 0, 0, 0, 1, 1,
1.112711, 0.8985021, 1.731194, 0, 0, 0, 1, 1,
1.120017, -1.424873, 3.344759, 0, 0, 0, 1, 1,
1.120029, 1.998924, 0.8323823, 1, 1, 1, 1, 1,
1.12309, 0.1321332, 0.1822081, 1, 1, 1, 1, 1,
1.125414, 1.14298, 0.9925414, 1, 1, 1, 1, 1,
1.132991, 0.3957906, 1.221348, 1, 1, 1, 1, 1,
1.133896, 0.8064789, 1.308288, 1, 1, 1, 1, 1,
1.150392, -1.19269, 2.926383, 1, 1, 1, 1, 1,
1.15833, -1.77435, 1.44794, 1, 1, 1, 1, 1,
1.161911, 1.348883, 0.2871968, 1, 1, 1, 1, 1,
1.175677, -0.02296893, 2.25575, 1, 1, 1, 1, 1,
1.176412, -0.5433101, 2.027651, 1, 1, 1, 1, 1,
1.181337, 0.7774873, 1.560887, 1, 1, 1, 1, 1,
1.192595, 0.4096063, 0.3290739, 1, 1, 1, 1, 1,
1.198796, -0.9360386, 2.681456, 1, 1, 1, 1, 1,
1.199017, 1.432324, 1.916798, 1, 1, 1, 1, 1,
1.210703, 0.1014631, 0.936716, 1, 1, 1, 1, 1,
1.213598, -0.2282819, 1.401679, 0, 0, 1, 1, 1,
1.213898, -0.03245264, 2.208079, 1, 0, 0, 1, 1,
1.219619, 0.1426849, -0.8570989, 1, 0, 0, 1, 1,
1.224284, 0.4634565, -0.2011748, 1, 0, 0, 1, 1,
1.225461, 0.9938275, -0.1986431, 1, 0, 0, 1, 1,
1.260498, -0.754724, 2.091698, 1, 0, 0, 1, 1,
1.264, 1.278155, 0.4277113, 0, 0, 0, 1, 1,
1.267444, 0.8283014, 1.323768, 0, 0, 0, 1, 1,
1.268574, -0.503529, 0.5173321, 0, 0, 0, 1, 1,
1.273, -1.066398, 4.574793, 0, 0, 0, 1, 1,
1.277081, -0.1528749, 2.31076, 0, 0, 0, 1, 1,
1.283368, 0.454599, 2.182739, 0, 0, 0, 1, 1,
1.29412, 1.564032, 1.156072, 0, 0, 0, 1, 1,
1.297164, 0.4098093, -0.1536418, 1, 1, 1, 1, 1,
1.29809, -1.503629, 1.834944, 1, 1, 1, 1, 1,
1.300828, -0.2950248, -0.6137749, 1, 1, 1, 1, 1,
1.30595, -0.4851984, 0.7718781, 1, 1, 1, 1, 1,
1.309925, -1.044391, 1.782786, 1, 1, 1, 1, 1,
1.316586, -1.970494, 1.636642, 1, 1, 1, 1, 1,
1.322184, 1.871317, -0.06766681, 1, 1, 1, 1, 1,
1.336597, 1.44228, -0.6228839, 1, 1, 1, 1, 1,
1.336868, -0.7352182, 1.282066, 1, 1, 1, 1, 1,
1.339642, 0.7816366, 1.118599, 1, 1, 1, 1, 1,
1.349839, 0.9085966, -0.4220584, 1, 1, 1, 1, 1,
1.357215, 0.718882, 0.9352714, 1, 1, 1, 1, 1,
1.363023, -0.2047161, 2.993194, 1, 1, 1, 1, 1,
1.364206, -0.7008241, 2.124551, 1, 1, 1, 1, 1,
1.369675, 0.212521, 2.581759, 1, 1, 1, 1, 1,
1.374507, -1.126192, 1.766091, 0, 0, 1, 1, 1,
1.377018, 1.543991, -0.0009161613, 1, 0, 0, 1, 1,
1.394044, 1.743581, -0.2526296, 1, 0, 0, 1, 1,
1.400785, -1.176371, 3.171324, 1, 0, 0, 1, 1,
1.401229, 0.2273529, 1.275957, 1, 0, 0, 1, 1,
1.409247, -1.746109, 3.293774, 1, 0, 0, 1, 1,
1.41119, -0.5796784, 1.686413, 0, 0, 0, 1, 1,
1.41912, -0.04968188, 1.006379, 0, 0, 0, 1, 1,
1.427369, 0.4793613, 0.8071294, 0, 0, 0, 1, 1,
1.429085, 0.2245308, 2.314986, 0, 0, 0, 1, 1,
1.42988, -0.7124388, 1.927649, 0, 0, 0, 1, 1,
1.437943, -1.016335, 1.518895, 0, 0, 0, 1, 1,
1.440282, 1.119465, 1.829358, 0, 0, 0, 1, 1,
1.447075, 0.5454347, 0.03981445, 1, 1, 1, 1, 1,
1.455245, -0.0108191, 3.203896, 1, 1, 1, 1, 1,
1.465101, 1.247572, 0.4515383, 1, 1, 1, 1, 1,
1.475318, 0.6793572, 1.174676, 1, 1, 1, 1, 1,
1.480737, -0.5441862, 2.492758, 1, 1, 1, 1, 1,
1.495104, 0.3333153, 2.213369, 1, 1, 1, 1, 1,
1.526108, -0.04839168, 1.254462, 1, 1, 1, 1, 1,
1.529662, -0.6484599, 2.329278, 1, 1, 1, 1, 1,
1.546463, 0.3350258, 2.874508, 1, 1, 1, 1, 1,
1.553205, -1.435229, 3.288808, 1, 1, 1, 1, 1,
1.557716, -0.3740233, 3.150739, 1, 1, 1, 1, 1,
1.561462, -0.8275188, 0.04410371, 1, 1, 1, 1, 1,
1.563617, 0.9317344, 1.427191, 1, 1, 1, 1, 1,
1.577351, 0.779583, 1.126846, 1, 1, 1, 1, 1,
1.583666, -1.955927, 3.02254, 1, 1, 1, 1, 1,
1.587494, -0.0438633, 1.067456, 0, 0, 1, 1, 1,
1.589623, -0.1712808, 0.9551187, 1, 0, 0, 1, 1,
1.604731, -1.830922, 2.384798, 1, 0, 0, 1, 1,
1.604975, -0.4661125, 1.133994, 1, 0, 0, 1, 1,
1.60819, 0.9930891, 1.022362, 1, 0, 0, 1, 1,
1.615025, 0.3628322, 3.679966, 1, 0, 0, 1, 1,
1.620587, 0.8881655, 0.6063846, 0, 0, 0, 1, 1,
1.626397, -1.195712, 2.634623, 0, 0, 0, 1, 1,
1.642098, 1.755083, 0.06359705, 0, 0, 0, 1, 1,
1.648003, -0.9599814, 1.22428, 0, 0, 0, 1, 1,
1.653917, 0.8032733, 2.135282, 0, 0, 0, 1, 1,
1.655111, -0.05730734, 3.392063, 0, 0, 0, 1, 1,
1.683547, 1.595579, 3.234112, 0, 0, 0, 1, 1,
1.712752, -1.312109, 2.655675, 1, 1, 1, 1, 1,
1.747394, 0.9638252, 0.1759283, 1, 1, 1, 1, 1,
1.748366, -1.350424, 1.969376, 1, 1, 1, 1, 1,
1.774057, -0.8152161, 2.539715, 1, 1, 1, 1, 1,
1.785155, 0.5657037, 1.550583, 1, 1, 1, 1, 1,
1.788868, -1.381478, 0.1927688, 1, 1, 1, 1, 1,
1.800754, 1.916527, 1.865436, 1, 1, 1, 1, 1,
1.819893, -0.5073, 3.155622, 1, 1, 1, 1, 1,
1.860093, 0.2369427, 2.413352, 1, 1, 1, 1, 1,
1.860394, 0.8854567, -0.06537262, 1, 1, 1, 1, 1,
1.880719, -1.318729, 2.366317, 1, 1, 1, 1, 1,
1.942011, 0.4240396, 1.141433, 1, 1, 1, 1, 1,
1.960696, -0.06423364, 2.961194, 1, 1, 1, 1, 1,
1.964427, 0.8779787, 1.279988, 1, 1, 1, 1, 1,
2.030884, 0.2967131, 1.858968, 1, 1, 1, 1, 1,
2.031476, -0.1254509, 2.756483, 0, 0, 1, 1, 1,
2.034131, 0.519857, 0.9635774, 1, 0, 0, 1, 1,
2.068849, 1.206288, 2.564359, 1, 0, 0, 1, 1,
2.080781, -0.3088258, 1.996686, 1, 0, 0, 1, 1,
2.123632, -0.1871181, 3.640842, 1, 0, 0, 1, 1,
2.175856, -0.5761214, 2.508841, 1, 0, 0, 1, 1,
2.1762, -0.4854313, 0.7582596, 0, 0, 0, 1, 1,
2.212335, 0.6983816, 1.738531, 0, 0, 0, 1, 1,
2.21425, -2.132644, 2.999718, 0, 0, 0, 1, 1,
2.233863, -0.3541624, 1.634324, 0, 0, 0, 1, 1,
2.237122, 0.6097969, 0.1163902, 0, 0, 0, 1, 1,
2.243138, 2.12948, 0.6093858, 0, 0, 0, 1, 1,
2.296307, -0.5692806, 2.322838, 0, 0, 0, 1, 1,
2.336138, 1.420887, 0.7330378, 1, 1, 1, 1, 1,
2.35256, -0.9354676, 0.7823328, 1, 1, 1, 1, 1,
2.606105, -0.4153605, -0.1996192, 1, 1, 1, 1, 1,
2.665895, -0.3701953, -1.618412, 1, 1, 1, 1, 1,
2.758473, 0.504123, 3.760078, 1, 1, 1, 1, 1,
3.139732, 0.5392775, 0.9101661, 1, 1, 1, 1, 1,
3.162655, -0.8105117, 0.3095075, 1, 1, 1, 1, 1
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
var radius = 9.421632;
var distance = 33.09308;
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
mvMatrix.translate( -0.1187983, 0.04174852, -0.003984451 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.09308);
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
