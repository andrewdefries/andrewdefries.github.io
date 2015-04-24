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
-3.884746, -3.234294, -3.054335, 1, 0, 0, 1,
-3.832197, -1.387929, -2.803292, 1, 0.007843138, 0, 1,
-3.195063, 0.3791883, -1.272973, 1, 0.01176471, 0, 1,
-3.004146, 0.6918934, -1.731366, 1, 0.01960784, 0, 1,
-2.981618, 0.2669603, -2.589438, 1, 0.02352941, 0, 1,
-2.894392, -0.7759843, -2.069756, 1, 0.03137255, 0, 1,
-2.836982, -0.2436365, -3.836967, 1, 0.03529412, 0, 1,
-2.767069, 0.1951727, -0.3861075, 1, 0.04313726, 0, 1,
-2.660908, 1.40808, -0.4766091, 1, 0.04705882, 0, 1,
-2.628899, -0.108227, -2.089363, 1, 0.05490196, 0, 1,
-2.496598, -0.9703355, -1.150943, 1, 0.05882353, 0, 1,
-2.478591, -1.428442, -1.760241, 1, 0.06666667, 0, 1,
-2.398606, -0.1606664, -0.4789455, 1, 0.07058824, 0, 1,
-2.37562, 0.1738617, -2.702527, 1, 0.07843138, 0, 1,
-2.305779, 1.591051, 0.1851611, 1, 0.08235294, 0, 1,
-2.25386, -0.3924353, -2.663189, 1, 0.09019608, 0, 1,
-2.186052, -0.2850612, -2.056945, 1, 0.09411765, 0, 1,
-2.167495, -1.173674, -3.241122, 1, 0.1019608, 0, 1,
-2.152509, -0.4910111, -0.634851, 1, 0.1098039, 0, 1,
-2.143665, -0.3244032, -1.1705, 1, 0.1137255, 0, 1,
-2.125938, -1.924614, -2.763331, 1, 0.1215686, 0, 1,
-2.125527, -0.9121701, -3.029592, 1, 0.1254902, 0, 1,
-2.08163, 0.2635695, -2.699533, 1, 0.1333333, 0, 1,
-2.053225, -0.1907564, -1.348818, 1, 0.1372549, 0, 1,
-2.051095, 0.6656008, -1.304121, 1, 0.145098, 0, 1,
-1.999481, 1.377728, -0.6099555, 1, 0.1490196, 0, 1,
-1.978005, -0.5707473, -1.743748, 1, 0.1568628, 0, 1,
-1.97056, 1.27191, -0.5678034, 1, 0.1607843, 0, 1,
-1.929474, 0.3656461, -2.646778, 1, 0.1686275, 0, 1,
-1.914796, 0.205182, -2.713197, 1, 0.172549, 0, 1,
-1.895007, 0.4684432, -1.662708, 1, 0.1803922, 0, 1,
-1.87847, 1.350793, -1.925606, 1, 0.1843137, 0, 1,
-1.86062, -0.257102, -0.5357159, 1, 0.1921569, 0, 1,
-1.855057, -1.042509, -3.674201, 1, 0.1960784, 0, 1,
-1.851753, -0.1856937, -2.249818, 1, 0.2039216, 0, 1,
-1.825746, -1.040049, -2.030863, 1, 0.2117647, 0, 1,
-1.78711, 1.13725, 0.5140223, 1, 0.2156863, 0, 1,
-1.784854, 0.2296951, -0.9696125, 1, 0.2235294, 0, 1,
-1.78228, -1.988576, -3.437416, 1, 0.227451, 0, 1,
-1.772243, 0.6904497, -2.271789, 1, 0.2352941, 0, 1,
-1.771009, 0.04799185, -2.298787, 1, 0.2392157, 0, 1,
-1.761732, 0.8214565, -2.420643, 1, 0.2470588, 0, 1,
-1.751131, 0.9499412, -0.9995503, 1, 0.2509804, 0, 1,
-1.750064, 0.5078493, -1.393672, 1, 0.2588235, 0, 1,
-1.724795, 0.4579207, -2.214287, 1, 0.2627451, 0, 1,
-1.705061, -0.4791767, -2.484268, 1, 0.2705882, 0, 1,
-1.682925, -0.06285914, -0.3355804, 1, 0.2745098, 0, 1,
-1.679318, 1.815767, -0.8917403, 1, 0.282353, 0, 1,
-1.65374, 0.8560566, -1.598669, 1, 0.2862745, 0, 1,
-1.643772, 1.479191, -1.734557, 1, 0.2941177, 0, 1,
-1.632389, -0.2199796, -2.57528, 1, 0.3019608, 0, 1,
-1.632268, 3.04007, -0.2265037, 1, 0.3058824, 0, 1,
-1.623492, 0.7451917, -1.380938, 1, 0.3137255, 0, 1,
-1.618307, -1.493031, -1.817742, 1, 0.3176471, 0, 1,
-1.613507, -1.906441, -2.71967, 1, 0.3254902, 0, 1,
-1.612951, -0.3055497, -2.932292, 1, 0.3294118, 0, 1,
-1.59601, -0.3514325, -2.203015, 1, 0.3372549, 0, 1,
-1.588394, 0.9289054, -1.869385, 1, 0.3411765, 0, 1,
-1.58397, -0.07562134, -2.71289, 1, 0.3490196, 0, 1,
-1.573124, 0.3875403, -1.4439, 1, 0.3529412, 0, 1,
-1.567523, -0.3275846, -1.964337, 1, 0.3607843, 0, 1,
-1.564786, -2.409409, -3.552146, 1, 0.3647059, 0, 1,
-1.56142, 1.322171, 0.01372685, 1, 0.372549, 0, 1,
-1.55188, -2.234145, -2.758653, 1, 0.3764706, 0, 1,
-1.550519, 0.1828272, -1.900128, 1, 0.3843137, 0, 1,
-1.549884, -0.8627386, -4.264349, 1, 0.3882353, 0, 1,
-1.548032, -1.150241, -3.654283, 1, 0.3960784, 0, 1,
-1.546349, -1.064215, -0.4430419, 1, 0.4039216, 0, 1,
-1.535054, 1.28059, -1.016692, 1, 0.4078431, 0, 1,
-1.519109, 0.148008, -1.056565, 1, 0.4156863, 0, 1,
-1.499995, 0.197933, -1.403701, 1, 0.4196078, 0, 1,
-1.491018, 0.4686268, -1.445173, 1, 0.427451, 0, 1,
-1.485235, 1.595272, -0.04235999, 1, 0.4313726, 0, 1,
-1.483367, 0.7806295, -1.340633, 1, 0.4392157, 0, 1,
-1.479418, -0.4438047, -0.9935293, 1, 0.4431373, 0, 1,
-1.47215, -0.713846, -1.562782, 1, 0.4509804, 0, 1,
-1.471927, 0.7534727, 0.645053, 1, 0.454902, 0, 1,
-1.471043, 0.4171354, -0.7768963, 1, 0.4627451, 0, 1,
-1.462675, -0.4668252, -4.112247, 1, 0.4666667, 0, 1,
-1.455611, -1.037756, -1.429828, 1, 0.4745098, 0, 1,
-1.451081, -1.460443, -1.436341, 1, 0.4784314, 0, 1,
-1.439636, -1.403672, -3.012314, 1, 0.4862745, 0, 1,
-1.439571, 0.7891535, -3.082718, 1, 0.4901961, 0, 1,
-1.434129, -0.6736045, -0.8433034, 1, 0.4980392, 0, 1,
-1.429195, 0.0513928, -1.526867, 1, 0.5058824, 0, 1,
-1.42891, -0.8837744, -2.948462, 1, 0.509804, 0, 1,
-1.424674, 1.110339, -1.277768, 1, 0.5176471, 0, 1,
-1.416454, 1.763063, 0.05039786, 1, 0.5215687, 0, 1,
-1.411409, -1.112384, -2.585619, 1, 0.5294118, 0, 1,
-1.407897, 0.6850758, 0.5976096, 1, 0.5333334, 0, 1,
-1.401872, 0.368052, -1.813342, 1, 0.5411765, 0, 1,
-1.396645, 0.4205476, 0.2871089, 1, 0.5450981, 0, 1,
-1.386735, 0.03010196, -0.9583983, 1, 0.5529412, 0, 1,
-1.384802, 1.634628, 1.243623, 1, 0.5568628, 0, 1,
-1.378983, -0.149894, -2.484823, 1, 0.5647059, 0, 1,
-1.370926, -0.1183699, -1.262583, 1, 0.5686275, 0, 1,
-1.363423, 1.735376, -0.1636186, 1, 0.5764706, 0, 1,
-1.361459, -0.791373, -2.212612, 1, 0.5803922, 0, 1,
-1.354592, 0.7296756, -1.607559, 1, 0.5882353, 0, 1,
-1.348259, -0.2254355, -3.143583, 1, 0.5921569, 0, 1,
-1.335424, 0.09771652, -0.1721861, 1, 0.6, 0, 1,
-1.335006, -0.4172018, -1.965562, 1, 0.6078432, 0, 1,
-1.316297, 0.1378314, -0.7689816, 1, 0.6117647, 0, 1,
-1.315901, 0.4569931, -0.9774821, 1, 0.6196079, 0, 1,
-1.310023, 0.321845, -1.28958, 1, 0.6235294, 0, 1,
-1.307147, 0.4401832, -1.289822, 1, 0.6313726, 0, 1,
-1.306118, -0.682641, -2.457622, 1, 0.6352941, 0, 1,
-1.30575, 1.182618, 0.4925488, 1, 0.6431373, 0, 1,
-1.30075, 0.7850026, -0.4573061, 1, 0.6470588, 0, 1,
-1.283861, 0.39728, 0.854451, 1, 0.654902, 0, 1,
-1.281316, -0.7939839, -1.667493, 1, 0.6588235, 0, 1,
-1.256536, 1.681394, -0.8392902, 1, 0.6666667, 0, 1,
-1.253423, 0.7086573, -2.553616, 1, 0.6705883, 0, 1,
-1.248424, 2.312541, -1.075096, 1, 0.6784314, 0, 1,
-1.247978, 0.4279481, -2.176383, 1, 0.682353, 0, 1,
-1.244978, 0.8469588, 0.6009452, 1, 0.6901961, 0, 1,
-1.239837, 1.13564, -0.8155719, 1, 0.6941177, 0, 1,
-1.222439, 0.2192667, -1.702646, 1, 0.7019608, 0, 1,
-1.213759, -0.384713, -1.509667, 1, 0.7098039, 0, 1,
-1.210581, 0.6704946, -2.274549, 1, 0.7137255, 0, 1,
-1.210499, -1.979374, -1.869795, 1, 0.7215686, 0, 1,
-1.206312, 1.542205, 0.045711, 1, 0.7254902, 0, 1,
-1.201142, 0.1268034, -2.304405, 1, 0.7333333, 0, 1,
-1.199403, 0.1255026, -2.201066, 1, 0.7372549, 0, 1,
-1.196987, 1.718252, -0.7430863, 1, 0.7450981, 0, 1,
-1.194431, 0.2862063, -0.8370577, 1, 0.7490196, 0, 1,
-1.191802, -0.9876403, -3.4598, 1, 0.7568628, 0, 1,
-1.182335, -0.9439433, -2.18431, 1, 0.7607843, 0, 1,
-1.181274, 1.605287, -0.2441387, 1, 0.7686275, 0, 1,
-1.178138, -0.3661132, -0.8477515, 1, 0.772549, 0, 1,
-1.176711, -0.3190234, -2.331449, 1, 0.7803922, 0, 1,
-1.174627, -0.07110262, -3.255827, 1, 0.7843137, 0, 1,
-1.168958, -0.02724204, -0.5379202, 1, 0.7921569, 0, 1,
-1.149311, -0.009570375, -0.8081052, 1, 0.7960784, 0, 1,
-1.148996, -1.584027, -2.593278, 1, 0.8039216, 0, 1,
-1.147054, 0.593513, -1.588527, 1, 0.8117647, 0, 1,
-1.141218, -0.3056445, -1.559137, 1, 0.8156863, 0, 1,
-1.13543, 1.957937, -0.6010883, 1, 0.8235294, 0, 1,
-1.126932, 0.7154053, 0.9968665, 1, 0.827451, 0, 1,
-1.117641, -0.9003353, -0.8660532, 1, 0.8352941, 0, 1,
-1.107389, -1.296461, -2.016529, 1, 0.8392157, 0, 1,
-1.104203, 0.566524, -1.190843, 1, 0.8470588, 0, 1,
-1.103389, -0.4241339, -3.138072, 1, 0.8509804, 0, 1,
-1.102095, -1.001241, -1.94266, 1, 0.8588235, 0, 1,
-1.092723, -0.2494964, -2.226738, 1, 0.8627451, 0, 1,
-1.087637, 2.275567, -1.02635, 1, 0.8705882, 0, 1,
-1.086099, -0.1197582, -0.4846426, 1, 0.8745098, 0, 1,
-1.081, -1.090477, -1.847819, 1, 0.8823529, 0, 1,
-1.080187, -1.143983, -1.466746, 1, 0.8862745, 0, 1,
-1.080023, -0.8118147, -1.997616, 1, 0.8941177, 0, 1,
-1.077019, 1.249341, 2.009346, 1, 0.8980392, 0, 1,
-1.073465, -1.137396, -3.860619, 1, 0.9058824, 0, 1,
-1.068557, -0.4092064, -2.758913, 1, 0.9137255, 0, 1,
-1.061557, -0.09528154, -1.111054, 1, 0.9176471, 0, 1,
-1.060587, 0.7370483, 0.03114922, 1, 0.9254902, 0, 1,
-1.049252, 2.064677, -0.3459269, 1, 0.9294118, 0, 1,
-1.045267, 1.921554, 0.1274354, 1, 0.9372549, 0, 1,
-1.04268, -0.3864723, -3.177811, 1, 0.9411765, 0, 1,
-1.041089, -1.364438, -2.773595, 1, 0.9490196, 0, 1,
-1.032516, 0.8494985, -1.527918, 1, 0.9529412, 0, 1,
-1.01783, -0.3674488, -2.435276, 1, 0.9607843, 0, 1,
-1.014081, -1.090472, -3.5055, 1, 0.9647059, 0, 1,
-1.010466, -0.007910135, -1.057881, 1, 0.972549, 0, 1,
-1.010183, -1.287495, -3.163342, 1, 0.9764706, 0, 1,
-1.003559, -0.1660348, -1.967842, 1, 0.9843137, 0, 1,
-1.000944, 1.494491, -0.5877796, 1, 0.9882353, 0, 1,
-0.9974396, 0.8037665, -1.680584, 1, 0.9960784, 0, 1,
-0.9955837, -0.2633558, -2.284526, 0.9960784, 1, 0, 1,
-0.9864109, -0.536699, -1.078639, 0.9921569, 1, 0, 1,
-0.9786451, -0.9358988, -1.87275, 0.9843137, 1, 0, 1,
-0.9781583, 0.4555098, -1.337596, 0.9803922, 1, 0, 1,
-0.9750478, -0.9228556, -2.5802, 0.972549, 1, 0, 1,
-0.9715431, -0.8810228, -2.506145, 0.9686275, 1, 0, 1,
-0.9692093, 0.2025597, -1.241294, 0.9607843, 1, 0, 1,
-0.9659491, 0.682431, -0.2664984, 0.9568627, 1, 0, 1,
-0.9560539, 1.482773, 0.4022326, 0.9490196, 1, 0, 1,
-0.9535915, -1.008316, -2.333852, 0.945098, 1, 0, 1,
-0.9531814, 1.044687, 0.1096656, 0.9372549, 1, 0, 1,
-0.951831, -0.8986878, -2.405107, 0.9333333, 1, 0, 1,
-0.9450596, 1.118185, -0.5921394, 0.9254902, 1, 0, 1,
-0.9447269, -0.05424817, -2.744101, 0.9215686, 1, 0, 1,
-0.9400766, -0.3877698, -1.683536, 0.9137255, 1, 0, 1,
-0.9359683, -0.6586806, -0.845961, 0.9098039, 1, 0, 1,
-0.9289737, 0.763604, -1.099702, 0.9019608, 1, 0, 1,
-0.9243606, 2.015837, -2.054111, 0.8941177, 1, 0, 1,
-0.9155926, 1.976804, -1.642452, 0.8901961, 1, 0, 1,
-0.9127989, 0.4863067, -1.584776, 0.8823529, 1, 0, 1,
-0.905756, 1.129747, -0.7482929, 0.8784314, 1, 0, 1,
-0.904569, 0.7647159, -0.4867479, 0.8705882, 1, 0, 1,
-0.9017469, 0.5945413, -1.552187, 0.8666667, 1, 0, 1,
-0.8988553, 0.1600186, -0.01135319, 0.8588235, 1, 0, 1,
-0.8988236, -1.037953, -0.5010835, 0.854902, 1, 0, 1,
-0.8959244, -0.1486911, -1.974254, 0.8470588, 1, 0, 1,
-0.8934006, 0.4745486, -2.542737, 0.8431373, 1, 0, 1,
-0.8925552, -1.34142, -2.371263, 0.8352941, 1, 0, 1,
-0.89244, 0.4908123, -0.884936, 0.8313726, 1, 0, 1,
-0.8884815, 0.0932421, -0.5724497, 0.8235294, 1, 0, 1,
-0.8883467, 2.082529, -0.7127873, 0.8196079, 1, 0, 1,
-0.8874206, 2.289759, -1.351361, 0.8117647, 1, 0, 1,
-0.8873481, -0.2696535, -2.5449, 0.8078431, 1, 0, 1,
-0.8831844, 1.274056, -0.3302516, 0.8, 1, 0, 1,
-0.8827558, 1.112208, -1.465466, 0.7921569, 1, 0, 1,
-0.8799816, -0.1206062, -0.223084, 0.7882353, 1, 0, 1,
-0.8790839, -0.9132335, -3.838446, 0.7803922, 1, 0, 1,
-0.8774914, -0.2363855, -0.4564785, 0.7764706, 1, 0, 1,
-0.8762403, -0.8218871, 0.8055168, 0.7686275, 1, 0, 1,
-0.8682761, 0.1993883, -0.5491037, 0.7647059, 1, 0, 1,
-0.8614078, -1.89267, -4.981594, 0.7568628, 1, 0, 1,
-0.8607003, -0.536373, -1.772974, 0.7529412, 1, 0, 1,
-0.8586006, 0.05759892, -1.541798, 0.7450981, 1, 0, 1,
-0.8581789, -1.473616, -1.332018, 0.7411765, 1, 0, 1,
-0.8546128, 0.678102, -1.227039, 0.7333333, 1, 0, 1,
-0.8535663, -0.5882187, -1.641076, 0.7294118, 1, 0, 1,
-0.8517423, -0.4238521, -3.82846, 0.7215686, 1, 0, 1,
-0.8508354, 0.6559247, -2.248458, 0.7176471, 1, 0, 1,
-0.8363007, 0.9254042, -0.6808985, 0.7098039, 1, 0, 1,
-0.8346723, -0.3559056, -1.83231, 0.7058824, 1, 0, 1,
-0.8331419, -0.5786462, -3.892154, 0.6980392, 1, 0, 1,
-0.8321507, -1.304532, -3.823497, 0.6901961, 1, 0, 1,
-0.8302474, -0.2154572, -2.256095, 0.6862745, 1, 0, 1,
-0.8293977, -0.8811585, -3.177482, 0.6784314, 1, 0, 1,
-0.8277926, 0.7913905, -1.704319, 0.6745098, 1, 0, 1,
-0.8256468, 0.2048528, -3.308829, 0.6666667, 1, 0, 1,
-0.8252168, 0.3883081, -0.8356631, 0.6627451, 1, 0, 1,
-0.8241577, -0.1886815, -2.870843, 0.654902, 1, 0, 1,
-0.8165293, -1.850779, -2.476656, 0.6509804, 1, 0, 1,
-0.8133084, -1.37088, -3.337406, 0.6431373, 1, 0, 1,
-0.8112636, 1.486645, -1.109604, 0.6392157, 1, 0, 1,
-0.8083797, -1.020326, -2.418308, 0.6313726, 1, 0, 1,
-0.8013238, -0.5872613, -2.587965, 0.627451, 1, 0, 1,
-0.7896258, -0.1282769, -2.936295, 0.6196079, 1, 0, 1,
-0.7870167, -0.8670089, -2.543078, 0.6156863, 1, 0, 1,
-0.7822717, 1.2096, -1.131635, 0.6078432, 1, 0, 1,
-0.7791225, 0.4910836, -1.216644, 0.6039216, 1, 0, 1,
-0.7722493, -0.2425899, -1.988179, 0.5960785, 1, 0, 1,
-0.7654496, 0.4299934, -2.127616, 0.5882353, 1, 0, 1,
-0.763643, 0.6844609, -2.00137, 0.5843138, 1, 0, 1,
-0.7636244, 0.06798, -0.4332192, 0.5764706, 1, 0, 1,
-0.7626292, -0.5474201, -3.480112, 0.572549, 1, 0, 1,
-0.7492892, 0.08392102, -2.411443, 0.5647059, 1, 0, 1,
-0.7481562, 1.996137, 0.2505783, 0.5607843, 1, 0, 1,
-0.7436786, 0.7563483, -0.6860101, 0.5529412, 1, 0, 1,
-0.7371822, -1.218618, -2.626575, 0.5490196, 1, 0, 1,
-0.7248251, 1.99134, -1.729119, 0.5411765, 1, 0, 1,
-0.7152547, 1.311201, -0.1204543, 0.5372549, 1, 0, 1,
-0.7131314, 2.232266, -0.4295633, 0.5294118, 1, 0, 1,
-0.7124603, -1.518072, -0.8289101, 0.5254902, 1, 0, 1,
-0.7100909, 0.3556788, -0.2943825, 0.5176471, 1, 0, 1,
-0.7095341, -0.2054893, -2.773277, 0.5137255, 1, 0, 1,
-0.707216, 1.601862, 0.2176409, 0.5058824, 1, 0, 1,
-0.6914623, -0.2043488, -2.32308, 0.5019608, 1, 0, 1,
-0.6904863, 0.3969899, -0.4460309, 0.4941176, 1, 0, 1,
-0.6894177, -1.062526, -3.905136, 0.4862745, 1, 0, 1,
-0.6888119, 1.814424, -1.733467, 0.4823529, 1, 0, 1,
-0.6803298, -0.6261306, -1.81184, 0.4745098, 1, 0, 1,
-0.6751115, -1.062001, 0.09393346, 0.4705882, 1, 0, 1,
-0.6739879, 0.1713858, -0.1090783, 0.4627451, 1, 0, 1,
-0.6703857, 0.8846533, -0.2185149, 0.4588235, 1, 0, 1,
-0.6700514, -0.3564419, -0.3159799, 0.4509804, 1, 0, 1,
-0.6690507, 0.3450691, -0.850141, 0.4470588, 1, 0, 1,
-0.6661465, -0.2356931, -0.6533684, 0.4392157, 1, 0, 1,
-0.6661199, 0.8809987, -1.277437, 0.4352941, 1, 0, 1,
-0.6613165, -1.983848, -4.008017, 0.427451, 1, 0, 1,
-0.6599476, 0.6980108, 0.548507, 0.4235294, 1, 0, 1,
-0.6592242, -0.8544587, -2.020954, 0.4156863, 1, 0, 1,
-0.6530135, -0.8655963, -3.207767, 0.4117647, 1, 0, 1,
-0.6521131, -0.3308437, -3.198758, 0.4039216, 1, 0, 1,
-0.6480462, -1.245824, -4.314353, 0.3960784, 1, 0, 1,
-0.6462546, 0.6141083, -1.442081, 0.3921569, 1, 0, 1,
-0.64411, 1.052753, -1.171858, 0.3843137, 1, 0, 1,
-0.6411165, 3.406502, 0.6955087, 0.3803922, 1, 0, 1,
-0.6403059, -1.725401, -2.159768, 0.372549, 1, 0, 1,
-0.6354798, 1.146023, -0.4518688, 0.3686275, 1, 0, 1,
-0.6326987, 2.508981, -2.475731, 0.3607843, 1, 0, 1,
-0.6315929, 1.273196, -1.336421, 0.3568628, 1, 0, 1,
-0.6314458, 1.013418, 0.2631165, 0.3490196, 1, 0, 1,
-0.6276577, -0.6922505, -1.626303, 0.345098, 1, 0, 1,
-0.6236945, -0.04792483, -2.618834, 0.3372549, 1, 0, 1,
-0.6223305, -1.171127, -2.288732, 0.3333333, 1, 0, 1,
-0.6190146, 1.111521, -0.8493816, 0.3254902, 1, 0, 1,
-0.617053, -0.8865675, -2.194903, 0.3215686, 1, 0, 1,
-0.6170427, 0.4655647, -1.086546, 0.3137255, 1, 0, 1,
-0.6088246, -0.7083424, -2.172192, 0.3098039, 1, 0, 1,
-0.6070142, 1.781854, -0.7818428, 0.3019608, 1, 0, 1,
-0.6054627, -1.168208, -2.93154, 0.2941177, 1, 0, 1,
-0.6025835, -2.152486, -2.978743, 0.2901961, 1, 0, 1,
-0.6017584, -1.075442, -3.915757, 0.282353, 1, 0, 1,
-0.595306, -0.8164033, -2.177608, 0.2784314, 1, 0, 1,
-0.5856681, -0.0002253793, -2.199702, 0.2705882, 1, 0, 1,
-0.5853359, 0.2516951, -0.0757722, 0.2666667, 1, 0, 1,
-0.5813711, -0.5813352, -2.19169, 0.2588235, 1, 0, 1,
-0.5768111, 0.3518578, -0.7754852, 0.254902, 1, 0, 1,
-0.5728338, 0.7254537, -0.4998564, 0.2470588, 1, 0, 1,
-0.5714133, 0.006058843, -2.23256, 0.2431373, 1, 0, 1,
-0.5692264, -0.5734378, -3.202158, 0.2352941, 1, 0, 1,
-0.5677063, -0.4103437, 0.4494202, 0.2313726, 1, 0, 1,
-0.5668177, -1.39883, -3.286533, 0.2235294, 1, 0, 1,
-0.5638056, -0.9498379, -3.774559, 0.2196078, 1, 0, 1,
-0.5588765, -0.2283647, -0.6093567, 0.2117647, 1, 0, 1,
-0.5508816, -0.5502738, -1.096749, 0.2078431, 1, 0, 1,
-0.5487412, -0.9581838, -4.013773, 0.2, 1, 0, 1,
-0.5357268, 1.212764, -0.7901191, 0.1921569, 1, 0, 1,
-0.5347027, -1.262924, -1.934982, 0.1882353, 1, 0, 1,
-0.5330027, -0.7524617, -0.9102262, 0.1803922, 1, 0, 1,
-0.5277342, 0.4633592, 1.112233, 0.1764706, 1, 0, 1,
-0.5231516, 0.4646299, -0.8723391, 0.1686275, 1, 0, 1,
-0.5207126, 0.8024126, 1.50348, 0.1647059, 1, 0, 1,
-0.5189546, -0.6319002, -1.469222, 0.1568628, 1, 0, 1,
-0.5154595, 0.3799337, 0.8029121, 0.1529412, 1, 0, 1,
-0.5113366, -0.06946662, -0.2519202, 0.145098, 1, 0, 1,
-0.508804, 0.2991414, -1.443068, 0.1411765, 1, 0, 1,
-0.4951609, -1.132521, -2.100247, 0.1333333, 1, 0, 1,
-0.4912556, 0.773479, 0.0123022, 0.1294118, 1, 0, 1,
-0.489843, -0.7127032, -1.466349, 0.1215686, 1, 0, 1,
-0.4878801, -0.4479386, -3.685852, 0.1176471, 1, 0, 1,
-0.4821955, -0.4796454, -2.713089, 0.1098039, 1, 0, 1,
-0.4789955, 1.608806, 0.4687901, 0.1058824, 1, 0, 1,
-0.4713056, 0.607001, -1.118844, 0.09803922, 1, 0, 1,
-0.4709319, 0.8544969, -0.6517993, 0.09019608, 1, 0, 1,
-0.4671785, 0.9416987, -0.82707, 0.08627451, 1, 0, 1,
-0.465147, 1.405482, -1.197587, 0.07843138, 1, 0, 1,
-0.4566891, -0.2049428, -3.998559, 0.07450981, 1, 0, 1,
-0.4458168, -0.1988451, -1.841937, 0.06666667, 1, 0, 1,
-0.4369471, -0.06942145, -1.288881, 0.0627451, 1, 0, 1,
-0.4328831, 0.6326914, -2.245594, 0.05490196, 1, 0, 1,
-0.4322372, 0.3478228, -0.762614, 0.05098039, 1, 0, 1,
-0.4275084, -1.380489, -3.427869, 0.04313726, 1, 0, 1,
-0.4258783, -1.547052, -2.501701, 0.03921569, 1, 0, 1,
-0.422133, 0.7790126, -1.5, 0.03137255, 1, 0, 1,
-0.4202274, 0.1318397, -2.811194, 0.02745098, 1, 0, 1,
-0.4185109, 0.7149276, -0.9973076, 0.01960784, 1, 0, 1,
-0.4145537, -1.201284, -3.415233, 0.01568628, 1, 0, 1,
-0.4145381, 0.788053, -0.226334, 0.007843138, 1, 0, 1,
-0.4109071, -0.3655989, -3.533671, 0.003921569, 1, 0, 1,
-0.408539, 0.04036621, -1.639195, 0, 1, 0.003921569, 1,
-0.4076059, -0.284648, -4.200095, 0, 1, 0.01176471, 1,
-0.4061559, -0.0921174, -0.4337675, 0, 1, 0.01568628, 1,
-0.4032351, -1.244864, -1.789536, 0, 1, 0.02352941, 1,
-0.3931968, -1.143639, -2.926302, 0, 1, 0.02745098, 1,
-0.3878738, 0.2332076, -1.544451, 0, 1, 0.03529412, 1,
-0.3783286, 0.344128, -1.787167, 0, 1, 0.03921569, 1,
-0.376318, -1.330191, -0.285355, 0, 1, 0.04705882, 1,
-0.3711407, 0.5060204, 0.9921482, 0, 1, 0.05098039, 1,
-0.3711195, -0.5440297, -3.272293, 0, 1, 0.05882353, 1,
-0.3710712, -0.3266398, -3.402071, 0, 1, 0.0627451, 1,
-0.3576989, -0.7567111, -3.537594, 0, 1, 0.07058824, 1,
-0.3575519, -0.7844703, -1.899844, 0, 1, 0.07450981, 1,
-0.354553, -1.319373, -3.061475, 0, 1, 0.08235294, 1,
-0.3525396, 0.9081439, -1.487504, 0, 1, 0.08627451, 1,
-0.3470006, 0.1880737, -0.9389966, 0, 1, 0.09411765, 1,
-0.3389915, -0.08738913, -1.514456, 0, 1, 0.1019608, 1,
-0.3340022, 1.068413, -1.702615, 0, 1, 0.1058824, 1,
-0.3305299, -0.7336754, -4.088102, 0, 1, 0.1137255, 1,
-0.3301648, -0.2140148, -3.987287, 0, 1, 0.1176471, 1,
-0.3265796, 0.2103805, -2.158115, 0, 1, 0.1254902, 1,
-0.3254069, 1.449126, -0.8833826, 0, 1, 0.1294118, 1,
-0.3218536, -0.0960019, -2.020963, 0, 1, 0.1372549, 1,
-0.3196343, -0.3877067, -2.501988, 0, 1, 0.1411765, 1,
-0.3169516, -1.534595, -2.235997, 0, 1, 0.1490196, 1,
-0.3101643, 0.06921925, -1.722965, 0, 1, 0.1529412, 1,
-0.3095723, 0.8722212, -0.3037051, 0, 1, 0.1607843, 1,
-0.3064321, 0.1468097, -0.5116157, 0, 1, 0.1647059, 1,
-0.3061857, -0.1917466, -3.508781, 0, 1, 0.172549, 1,
-0.3011394, -1.51973, -2.481087, 0, 1, 0.1764706, 1,
-0.2998847, 0.9004367, -2.442933, 0, 1, 0.1843137, 1,
-0.2959208, -0.6309055, -3.221877, 0, 1, 0.1882353, 1,
-0.2955399, -0.3445295, -1.832106, 0, 1, 0.1960784, 1,
-0.2941919, 0.8685234, 0.3752814, 0, 1, 0.2039216, 1,
-0.292991, 3.724802, -0.1991332, 0, 1, 0.2078431, 1,
-0.2892693, 1.666087, -0.9903482, 0, 1, 0.2156863, 1,
-0.2848809, 0.5236419, -2.24479, 0, 1, 0.2196078, 1,
-0.2829518, 1.311984, -0.8145967, 0, 1, 0.227451, 1,
-0.2791579, -0.4921272, -1.793126, 0, 1, 0.2313726, 1,
-0.2791514, 1.010258, -1.531069, 0, 1, 0.2392157, 1,
-0.2774394, 0.3543518, 0.2191779, 0, 1, 0.2431373, 1,
-0.2728434, -0.8653376, -1.129259, 0, 1, 0.2509804, 1,
-0.2690375, -0.191828, -1.003106, 0, 1, 0.254902, 1,
-0.2688298, -2.310285, -2.984195, 0, 1, 0.2627451, 1,
-0.2643417, -0.2380048, -3.689167, 0, 1, 0.2666667, 1,
-0.2613089, -0.003881789, -0.4526384, 0, 1, 0.2745098, 1,
-0.2607789, 1.022833, -0.7335889, 0, 1, 0.2784314, 1,
-0.2597928, -0.05788486, -1.754068, 0, 1, 0.2862745, 1,
-0.2569551, -0.757074, -3.992772, 0, 1, 0.2901961, 1,
-0.2559392, 1.386672, 1.220967, 0, 1, 0.2980392, 1,
-0.2499853, 1.559641, -0.2479711, 0, 1, 0.3058824, 1,
-0.2415997, 1.020203, 0.01413376, 0, 1, 0.3098039, 1,
-0.2409574, -0.6774554, -2.071928, 0, 1, 0.3176471, 1,
-0.2389049, 0.6106377, 0.7820477, 0, 1, 0.3215686, 1,
-0.2362022, 0.9241085, -1.010027, 0, 1, 0.3294118, 1,
-0.2331983, -0.6314582, -2.734077, 0, 1, 0.3333333, 1,
-0.23162, -1.15119, -2.126288, 0, 1, 0.3411765, 1,
-0.2294597, 0.7303512, -1.483806, 0, 1, 0.345098, 1,
-0.2259305, -0.4766456, -3.01823, 0, 1, 0.3529412, 1,
-0.2230897, 1.661099, -0.2656831, 0, 1, 0.3568628, 1,
-0.2217291, 0.03468685, -0.1802317, 0, 1, 0.3647059, 1,
-0.2214021, 0.6370351, 2.01118, 0, 1, 0.3686275, 1,
-0.2205865, 1.091149, -1.614898, 0, 1, 0.3764706, 1,
-0.2156154, -0.5083209, -2.200603, 0, 1, 0.3803922, 1,
-0.2143473, -1.092598, -3.830992, 0, 1, 0.3882353, 1,
-0.2092371, -0.4008653, -2.522086, 0, 1, 0.3921569, 1,
-0.2075461, 0.6213762, -0.1180161, 0, 1, 0.4, 1,
-0.2036102, -1.855614, -2.173698, 0, 1, 0.4078431, 1,
-0.2025522, -1.362679, -2.291758, 0, 1, 0.4117647, 1,
-0.2001297, 0.8392518, 0.5992718, 0, 1, 0.4196078, 1,
-0.1961347, 0.3119094, -0.3365375, 0, 1, 0.4235294, 1,
-0.1937884, -0.5665142, -3.562465, 0, 1, 0.4313726, 1,
-0.1920885, -0.5774466, -1.792829, 0, 1, 0.4352941, 1,
-0.1908584, -0.1122961, -3.483184, 0, 1, 0.4431373, 1,
-0.1879217, -0.02138188, -1.423281, 0, 1, 0.4470588, 1,
-0.1870448, 0.5100782, -0.04396172, 0, 1, 0.454902, 1,
-0.1837125, -0.9679196, -3.635823, 0, 1, 0.4588235, 1,
-0.180116, 0.2627044, -1.779556, 0, 1, 0.4666667, 1,
-0.1799672, 0.6842445, 0.6038249, 0, 1, 0.4705882, 1,
-0.1760769, 0.8499922, -1.611148, 0, 1, 0.4784314, 1,
-0.173959, -0.580404, -4.426124, 0, 1, 0.4823529, 1,
-0.1708363, -0.4363905, -3.009956, 0, 1, 0.4901961, 1,
-0.1666516, -0.7222697, -2.160411, 0, 1, 0.4941176, 1,
-0.1656725, -0.01855401, -2.380038, 0, 1, 0.5019608, 1,
-0.1631685, -1.482221, -4.682819, 0, 1, 0.509804, 1,
-0.1622716, 1.129328, -0.3218848, 0, 1, 0.5137255, 1,
-0.153609, 0.3538566, -0.5080061, 0, 1, 0.5215687, 1,
-0.1530291, 0.9948877, 0.0006721757, 0, 1, 0.5254902, 1,
-0.1486488, -0.3032646, -1.591923, 0, 1, 0.5333334, 1,
-0.1476697, -0.4466378, -2.371895, 0, 1, 0.5372549, 1,
-0.1441037, -0.7209848, -4.061743, 0, 1, 0.5450981, 1,
-0.1407233, 0.1031728, 0.1166141, 0, 1, 0.5490196, 1,
-0.1377356, 0.6654342, 0.4799382, 0, 1, 0.5568628, 1,
-0.1356644, -1.297381, -1.795358, 0, 1, 0.5607843, 1,
-0.1344777, -1.662738, -5.14872, 0, 1, 0.5686275, 1,
-0.133856, -0.7191824, -3.396836, 0, 1, 0.572549, 1,
-0.1334435, 1.052235, 1.156499, 0, 1, 0.5803922, 1,
-0.127092, 0.8051161, 0.280533, 0, 1, 0.5843138, 1,
-0.1270369, 0.8877848, 1.630682, 0, 1, 0.5921569, 1,
-0.126778, -1.707859, -4.147029, 0, 1, 0.5960785, 1,
-0.1238423, -0.788424, -3.072649, 0, 1, 0.6039216, 1,
-0.1215887, -0.7580891, -3.213843, 0, 1, 0.6117647, 1,
-0.1204983, 0.008233044, -1.35562, 0, 1, 0.6156863, 1,
-0.1179272, -0.8612536, -2.869261, 0, 1, 0.6235294, 1,
-0.112721, 0.323097, 0.2963975, 0, 1, 0.627451, 1,
-0.112018, 1.771377, -0.2162818, 0, 1, 0.6352941, 1,
-0.1077937, 0.7046176, -0.158523, 0, 1, 0.6392157, 1,
-0.1075254, -0.3016927, -2.772143, 0, 1, 0.6470588, 1,
-0.1068297, -0.88303, -3.868557, 0, 1, 0.6509804, 1,
-0.1061723, 0.6812039, -0.2016686, 0, 1, 0.6588235, 1,
-0.0976511, 0.8089834, -1.797522, 0, 1, 0.6627451, 1,
-0.0935851, -0.5386242, -2.960125, 0, 1, 0.6705883, 1,
-0.08775029, -0.7889991, -2.849868, 0, 1, 0.6745098, 1,
-0.08052957, -0.1963493, -1.754351, 0, 1, 0.682353, 1,
-0.07940502, 0.6078339, -0.3677201, 0, 1, 0.6862745, 1,
-0.07836691, 0.04120859, -0.410252, 0, 1, 0.6941177, 1,
-0.07775216, -0.1304377, -4.526478, 0, 1, 0.7019608, 1,
-0.07672131, -0.5495505, -3.956227, 0, 1, 0.7058824, 1,
-0.07450069, 1.127336, -0.5787957, 0, 1, 0.7137255, 1,
-0.07087658, 1.152583, -1.100208, 0, 1, 0.7176471, 1,
-0.06980627, -0.1615945, -2.687481, 0, 1, 0.7254902, 1,
-0.06426797, 0.5853596, -0.4363393, 0, 1, 0.7294118, 1,
-0.06367051, 1.257454, 0.8390703, 0, 1, 0.7372549, 1,
-0.0633143, 0.7132903, -0.4617727, 0, 1, 0.7411765, 1,
-0.06110305, -2.099382, -1.488967, 0, 1, 0.7490196, 1,
-0.05956139, 0.6238226, -0.3238712, 0, 1, 0.7529412, 1,
-0.05863679, 0.5612586, -1.616656, 0, 1, 0.7607843, 1,
-0.05792856, 1.277323, -0.2092439, 0, 1, 0.7647059, 1,
-0.05698825, -0.2311744, -5.004389, 0, 1, 0.772549, 1,
-0.05595569, -1.205673, -2.401167, 0, 1, 0.7764706, 1,
-0.05540542, -0.06571984, -4.614846, 0, 1, 0.7843137, 1,
-0.0527962, -0.6086563, -2.490366, 0, 1, 0.7882353, 1,
-0.05073499, 0.6995138, 1.018357, 0, 1, 0.7960784, 1,
-0.0450739, 0.06721189, -3.26813, 0, 1, 0.8039216, 1,
-0.04323441, 1.668532, 2.121042, 0, 1, 0.8078431, 1,
-0.042893, -0.1306021, -3.822278, 0, 1, 0.8156863, 1,
-0.04119003, -0.7219471, -3.411076, 0, 1, 0.8196079, 1,
-0.03910054, 0.7934151, 0.4094605, 0, 1, 0.827451, 1,
-0.03416558, -1.057953, -4.84532, 0, 1, 0.8313726, 1,
-0.03070692, 0.6613463, -0.02889021, 0, 1, 0.8392157, 1,
-0.02832329, 0.9319757, 0.07357264, 0, 1, 0.8431373, 1,
-0.02675913, -0.3785428, -1.559382, 0, 1, 0.8509804, 1,
-0.02381239, -0.3937302, -2.504854, 0, 1, 0.854902, 1,
-0.0149858, 0.4650601, -1.793982, 0, 1, 0.8627451, 1,
-0.009250095, -2.425534, -2.572263, 0, 1, 0.8666667, 1,
-0.00829456, -0.6077279, -4.294641, 0, 1, 0.8745098, 1,
-0.007744517, -0.876335, -1.557105, 0, 1, 0.8784314, 1,
-0.0051808, -0.03690287, -0.9593882, 0, 1, 0.8862745, 1,
0.0008403998, 1.098672, 0.1596101, 0, 1, 0.8901961, 1,
0.001467764, -2.333228, 2.010033, 0, 1, 0.8980392, 1,
0.004942593, 1.91765, 0.006239525, 0, 1, 0.9058824, 1,
0.009043725, -0.609513, 2.429327, 0, 1, 0.9098039, 1,
0.01195864, -0.656838, 4.107501, 0, 1, 0.9176471, 1,
0.01432464, 1.403667, 0.4728855, 0, 1, 0.9215686, 1,
0.01514924, 0.06086983, 1.152237, 0, 1, 0.9294118, 1,
0.01571015, 0.6014436, -0.6688104, 0, 1, 0.9333333, 1,
0.02893224, -1.697696, 3.605509, 0, 1, 0.9411765, 1,
0.03029347, -0.8162923, 2.000089, 0, 1, 0.945098, 1,
0.03605954, -0.2495366, 4.760906, 0, 1, 0.9529412, 1,
0.03805189, 0.3639617, 0.02607413, 0, 1, 0.9568627, 1,
0.03901158, -0.3108952, 3.341526, 0, 1, 0.9647059, 1,
0.04242639, -0.07140698, 2.626125, 0, 1, 0.9686275, 1,
0.04482166, -0.3626887, 1.82467, 0, 1, 0.9764706, 1,
0.0484094, -0.6022413, 4.193918, 0, 1, 0.9803922, 1,
0.04847385, 0.7288532, -0.8880637, 0, 1, 0.9882353, 1,
0.04937001, -0.4349523, 2.185002, 0, 1, 0.9921569, 1,
0.05091989, -1.711001, 2.317097, 0, 1, 1, 1,
0.05166228, 0.7934697, -0.685094, 0, 0.9921569, 1, 1,
0.05171106, 1.639044, -0.4732314, 0, 0.9882353, 1, 1,
0.05420147, 0.6672897, 1.660629, 0, 0.9803922, 1, 1,
0.05632338, 0.08430391, 0.7188736, 0, 0.9764706, 1, 1,
0.05718163, -0.3380441, 3.715072, 0, 0.9686275, 1, 1,
0.05776424, -0.3652446, 3.513345, 0, 0.9647059, 1, 1,
0.06571191, -0.4588307, 4.46353, 0, 0.9568627, 1, 1,
0.06727817, 0.7678946, 0.296288, 0, 0.9529412, 1, 1,
0.07333895, 1.517811, -0.8781026, 0, 0.945098, 1, 1,
0.07428162, -0.1210387, 1.38725, 0, 0.9411765, 1, 1,
0.08011959, -0.1015609, 3.102139, 0, 0.9333333, 1, 1,
0.08423345, -1.163414, 2.732889, 0, 0.9294118, 1, 1,
0.08604384, -0.2133567, 1.474644, 0, 0.9215686, 1, 1,
0.0868254, -0.5494467, 1.720096, 0, 0.9176471, 1, 1,
0.09331048, -1.54685, 3.366951, 0, 0.9098039, 1, 1,
0.09451336, -0.1931125, 1.986254, 0, 0.9058824, 1, 1,
0.1018684, 1.56058, -0.3988737, 0, 0.8980392, 1, 1,
0.1020075, 0.1609386, 0.3546181, 0, 0.8901961, 1, 1,
0.108126, -0.54822, 2.54589, 0, 0.8862745, 1, 1,
0.1092683, 1.679085, -0.8588602, 0, 0.8784314, 1, 1,
0.11025, 0.2812285, 0.2390354, 0, 0.8745098, 1, 1,
0.1107674, 0.1845147, -0.8650351, 0, 0.8666667, 1, 1,
0.1118316, 0.07022867, 0.2517257, 0, 0.8627451, 1, 1,
0.1154034, 0.3611529, 0.7332008, 0, 0.854902, 1, 1,
0.1181411, 0.05030861, 1.134741, 0, 0.8509804, 1, 1,
0.1204272, 1.178676, 1.367028, 0, 0.8431373, 1, 1,
0.1215552, 1.196568, -0.006397797, 0, 0.8392157, 1, 1,
0.124435, -0.01922459, 2.605258, 0, 0.8313726, 1, 1,
0.125169, 2.515087, -0.7512147, 0, 0.827451, 1, 1,
0.1255451, 0.4942587, 1.374075, 0, 0.8196079, 1, 1,
0.1338172, -1.045975, 3.720643, 0, 0.8156863, 1, 1,
0.1384816, -1.745173, 2.210783, 0, 0.8078431, 1, 1,
0.1415966, 0.4449044, 0.008658414, 0, 0.8039216, 1, 1,
0.1441102, -0.287152, 0.9575499, 0, 0.7960784, 1, 1,
0.1449134, -0.02691198, 0.5184788, 0, 0.7882353, 1, 1,
0.1450502, -0.8087761, 4.157895, 0, 0.7843137, 1, 1,
0.1455315, 0.7904674, -1.087456, 0, 0.7764706, 1, 1,
0.1462025, 0.04024208, -0.3471932, 0, 0.772549, 1, 1,
0.1476177, 0.08727513, 0.2621555, 0, 0.7647059, 1, 1,
0.1483892, -1.037078, 2.586551, 0, 0.7607843, 1, 1,
0.1485486, -1.780538, 3.502631, 0, 0.7529412, 1, 1,
0.1504176, 0.02502341, 1.650514, 0, 0.7490196, 1, 1,
0.1506255, -0.3728104, 3.468805, 0, 0.7411765, 1, 1,
0.1546634, 0.1177062, 0.3371617, 0, 0.7372549, 1, 1,
0.1558713, -0.901889, 3.427683, 0, 0.7294118, 1, 1,
0.1609378, 0.5793042, 0.3841679, 0, 0.7254902, 1, 1,
0.1626855, -1.077186, 2.213339, 0, 0.7176471, 1, 1,
0.1657669, 1.841938, 0.414292, 0, 0.7137255, 1, 1,
0.1703716, -1.421359, 3.186447, 0, 0.7058824, 1, 1,
0.173562, 0.1182969, 1.048499, 0, 0.6980392, 1, 1,
0.1735994, 0.1453292, -0.6252003, 0, 0.6941177, 1, 1,
0.1819145, 0.3250463, 0.9901932, 0, 0.6862745, 1, 1,
0.1822286, 0.4607654, 1.716977, 0, 0.682353, 1, 1,
0.1828298, -1.143671, 1.906982, 0, 0.6745098, 1, 1,
0.1834105, -0.6538504, 3.668309, 0, 0.6705883, 1, 1,
0.187851, 0.01627724, 0.2886499, 0, 0.6627451, 1, 1,
0.1982088, -0.2411529, 0.9150383, 0, 0.6588235, 1, 1,
0.1998843, 0.6782669, 0.8314374, 0, 0.6509804, 1, 1,
0.2000346, 0.07614958, -0.04507347, 0, 0.6470588, 1, 1,
0.2034319, -0.36541, 3.34588, 0, 0.6392157, 1, 1,
0.2041793, -0.4544622, 1.065166, 0, 0.6352941, 1, 1,
0.205396, -0.5827311, 3.547692, 0, 0.627451, 1, 1,
0.2062245, 0.6744846, 1.602439, 0, 0.6235294, 1, 1,
0.2085372, -0.4104505, 2.842992, 0, 0.6156863, 1, 1,
0.2125078, -0.5148014, 3.960126, 0, 0.6117647, 1, 1,
0.2188266, 0.1743337, 1.244919, 0, 0.6039216, 1, 1,
0.2243995, -1.150298, 1.959856, 0, 0.5960785, 1, 1,
0.2287315, -0.8414344, 2.832837, 0, 0.5921569, 1, 1,
0.2288268, -0.5064542, 1.40514, 0, 0.5843138, 1, 1,
0.2296942, -0.06162705, 2.468285, 0, 0.5803922, 1, 1,
0.2320792, -0.2222921, 2.653435, 0, 0.572549, 1, 1,
0.237071, 0.6947608, 1.706898, 0, 0.5686275, 1, 1,
0.244029, 0.6318198, 0.1746266, 0, 0.5607843, 1, 1,
0.2459994, -0.005073115, -0.3727953, 0, 0.5568628, 1, 1,
0.2488147, -0.2034772, 2.496025, 0, 0.5490196, 1, 1,
0.2515437, -3.196043, 3.564659, 0, 0.5450981, 1, 1,
0.2520727, 1.373657, 0.08632439, 0, 0.5372549, 1, 1,
0.2569399, -0.460676, 3.34397, 0, 0.5333334, 1, 1,
0.259288, 0.5994298, -0.9465714, 0, 0.5254902, 1, 1,
0.2613609, 1.147394, -0.3627853, 0, 0.5215687, 1, 1,
0.2624522, -0.7038002, 2.340832, 0, 0.5137255, 1, 1,
0.2638946, 0.1732172, 2.465295, 0, 0.509804, 1, 1,
0.2660898, -0.08068158, 1.821421, 0, 0.5019608, 1, 1,
0.2671972, -0.4305117, 3.062614, 0, 0.4941176, 1, 1,
0.2688183, 0.3184798, -2.451524, 0, 0.4901961, 1, 1,
0.2756252, 1.121789, 1.130864, 0, 0.4823529, 1, 1,
0.276729, -0.187491, 0.07303659, 0, 0.4784314, 1, 1,
0.276879, -1.052873, 3.057982, 0, 0.4705882, 1, 1,
0.28323, -0.4929445, 4.306707, 0, 0.4666667, 1, 1,
0.2854596, -0.4385329, 1.533243, 0, 0.4588235, 1, 1,
0.287231, 0.5396837, -0.2659938, 0, 0.454902, 1, 1,
0.2897051, 1.832782, 1.554372, 0, 0.4470588, 1, 1,
0.2992413, -1.027086, 5.296272, 0, 0.4431373, 1, 1,
0.2993247, -0.7228637, 3.827857, 0, 0.4352941, 1, 1,
0.3031426, -2.392604, 3.113328, 0, 0.4313726, 1, 1,
0.3045865, -1.789182, 4.341302, 0, 0.4235294, 1, 1,
0.3069104, 2.083796, -0.8575827, 0, 0.4196078, 1, 1,
0.3071327, 0.6111674, 0.3147017, 0, 0.4117647, 1, 1,
0.3096761, 0.001502287, 2.378826, 0, 0.4078431, 1, 1,
0.313795, -0.7362422, 2.154558, 0, 0.4, 1, 1,
0.3151896, 1.358719, -0.1354546, 0, 0.3921569, 1, 1,
0.3172019, -2.058472, 1.667769, 0, 0.3882353, 1, 1,
0.3200936, 0.7105033, -0.7535806, 0, 0.3803922, 1, 1,
0.321606, -0.06218912, 1.926928, 0, 0.3764706, 1, 1,
0.324315, -0.9601951, 1.709554, 0, 0.3686275, 1, 1,
0.3264465, 0.6232034, 3.393068, 0, 0.3647059, 1, 1,
0.3283701, 0.07584742, 1.026105, 0, 0.3568628, 1, 1,
0.3308863, -1.513468, 3.839009, 0, 0.3529412, 1, 1,
0.3319526, -1.1003, 3.120034, 0, 0.345098, 1, 1,
0.3450874, 0.7580254, 1.343213, 0, 0.3411765, 1, 1,
0.3482657, -2.186709, 2.474044, 0, 0.3333333, 1, 1,
0.3485062, 2.228727, 1.87099, 0, 0.3294118, 1, 1,
0.352869, 0.3920123, 0.204274, 0, 0.3215686, 1, 1,
0.3547745, -0.9299065, 4.313804, 0, 0.3176471, 1, 1,
0.3552738, 0.7189566, -0.1333236, 0, 0.3098039, 1, 1,
0.3579752, -0.3255759, 1.8944, 0, 0.3058824, 1, 1,
0.3590586, -1.342814, 2.345823, 0, 0.2980392, 1, 1,
0.3634751, 0.777841, 1.401146, 0, 0.2901961, 1, 1,
0.3651473, 0.2823591, 1.177333, 0, 0.2862745, 1, 1,
0.3675153, 1.743159, 0.07744073, 0, 0.2784314, 1, 1,
0.3736063, -0.3040386, 2.629967, 0, 0.2745098, 1, 1,
0.3745536, -0.2380409, 1.008821, 0, 0.2666667, 1, 1,
0.374993, -1.280163, 2.442464, 0, 0.2627451, 1, 1,
0.3766471, -0.2580943, 2.367998, 0, 0.254902, 1, 1,
0.3774054, -1.609046, 2.598023, 0, 0.2509804, 1, 1,
0.3774336, 0.8501171, 1.633102, 0, 0.2431373, 1, 1,
0.3806297, -1.232587, 1.652139, 0, 0.2392157, 1, 1,
0.383216, 0.4014201, -0.1551298, 0, 0.2313726, 1, 1,
0.385172, -1.24016, 1.501588, 0, 0.227451, 1, 1,
0.3866956, 0.7788928, 0.8842134, 0, 0.2196078, 1, 1,
0.3867345, -1.333857, 3.390718, 0, 0.2156863, 1, 1,
0.3874097, 0.01926798, 2.493118, 0, 0.2078431, 1, 1,
0.3884939, -0.4420757, 2.64078, 0, 0.2039216, 1, 1,
0.390239, 0.887738, -1.143506, 0, 0.1960784, 1, 1,
0.3908227, -0.09564033, 0.9481288, 0, 0.1882353, 1, 1,
0.3922732, -2.407619, 2.600728, 0, 0.1843137, 1, 1,
0.3935193, -1.094079, 2.857584, 0, 0.1764706, 1, 1,
0.3953011, -0.3083622, 2.373921, 0, 0.172549, 1, 1,
0.3999629, 0.6704432, -1.17388, 0, 0.1647059, 1, 1,
0.4004159, -1.109576, 1.55901, 0, 0.1607843, 1, 1,
0.4037937, -0.4962184, 1.427515, 0, 0.1529412, 1, 1,
0.4067129, 0.4887555, -0.6932148, 0, 0.1490196, 1, 1,
0.4145589, 0.9828882, -1.735738, 0, 0.1411765, 1, 1,
0.4148031, 2.420509, -0.5958031, 0, 0.1372549, 1, 1,
0.4164511, 0.8747766, -0.6784028, 0, 0.1294118, 1, 1,
0.4225549, 2.020863, -0.7728336, 0, 0.1254902, 1, 1,
0.4245376, 0.2691778, 2.468327, 0, 0.1176471, 1, 1,
0.4253806, 0.1598471, 2.176909, 0, 0.1137255, 1, 1,
0.4260523, -1.997002, 3.085186, 0, 0.1058824, 1, 1,
0.4285128, 1.609976, -1.559795, 0, 0.09803922, 1, 1,
0.436317, -0.1409971, 1.737418, 0, 0.09411765, 1, 1,
0.4393241, -1.018351, 2.263228, 0, 0.08627451, 1, 1,
0.4449802, 0.6317273, 0.2310387, 0, 0.08235294, 1, 1,
0.4462745, -0.7378928, 1.562925, 0, 0.07450981, 1, 1,
0.4500557, -1.760284, 3.13211, 0, 0.07058824, 1, 1,
0.4617791, -1.406567, 2.133959, 0, 0.0627451, 1, 1,
0.4625072, 0.6676715, 1.50509, 0, 0.05882353, 1, 1,
0.4635834, -0.6478533, 2.442657, 0, 0.05098039, 1, 1,
0.4651791, 0.3230681, 0.5380853, 0, 0.04705882, 1, 1,
0.4661406, -0.1688287, 1.303465, 0, 0.03921569, 1, 1,
0.4696397, -0.3495244, 1.085621, 0, 0.03529412, 1, 1,
0.4696772, -0.5967056, 3.70108, 0, 0.02745098, 1, 1,
0.4697355, 0.6104641, -0.6445442, 0, 0.02352941, 1, 1,
0.4705357, -0.1187031, 1.584377, 0, 0.01568628, 1, 1,
0.4749304, 0.8684266, -0.2473921, 0, 0.01176471, 1, 1,
0.4762536, 0.3030457, 0.8320862, 0, 0.003921569, 1, 1,
0.4771319, 0.8082754, 0.6684272, 0.003921569, 0, 1, 1,
0.4825236, 0.2721961, 1.664041, 0.007843138, 0, 1, 1,
0.4905407, -0.2165875, 2.609811, 0.01568628, 0, 1, 1,
0.4907854, 0.07087337, 0.828627, 0.01960784, 0, 1, 1,
0.4916617, -0.6683586, 3.060776, 0.02745098, 0, 1, 1,
0.4934151, -0.4858056, 2.330961, 0.03137255, 0, 1, 1,
0.5083034, -1.288676, 4.935629, 0.03921569, 0, 1, 1,
0.5085758, -0.1755327, 1.66477, 0.04313726, 0, 1, 1,
0.5090048, -0.326943, 4.456123, 0.05098039, 0, 1, 1,
0.5136665, -0.100595, -0.1845845, 0.05490196, 0, 1, 1,
0.5151085, -0.3025115, 2.187239, 0.0627451, 0, 1, 1,
0.5166566, -0.1417642, 0.7612047, 0.06666667, 0, 1, 1,
0.5215517, 0.9522898, 1.145111, 0.07450981, 0, 1, 1,
0.5275058, 0.4492563, -0.7614073, 0.07843138, 0, 1, 1,
0.5304071, -0.5443069, 1.226474, 0.08627451, 0, 1, 1,
0.5321733, 0.556626, 1.760527, 0.09019608, 0, 1, 1,
0.5338801, -0.8388911, 3.552418, 0.09803922, 0, 1, 1,
0.5339248, 1.129529, -0.598177, 0.1058824, 0, 1, 1,
0.5565857, -1.656336, 4.424908, 0.1098039, 0, 1, 1,
0.5587421, 0.9327082, 1.244504, 0.1176471, 0, 1, 1,
0.5597203, 0.9288163, 0.152402, 0.1215686, 0, 1, 1,
0.5735503, 0.951386, 1.346794, 0.1294118, 0, 1, 1,
0.5754793, -0.9125291, 2.127185, 0.1333333, 0, 1, 1,
0.5776857, 0.3948425, -0.0543741, 0.1411765, 0, 1, 1,
0.5793732, -0.2198617, 2.727272, 0.145098, 0, 1, 1,
0.5829732, 0.3234713, -0.9319432, 0.1529412, 0, 1, 1,
0.5844398, 0.1309287, 0.8752215, 0.1568628, 0, 1, 1,
0.5869823, 2.149385, 0.7696356, 0.1647059, 0, 1, 1,
0.5958704, -0.9094622, 2.742403, 0.1686275, 0, 1, 1,
0.5978945, 1.561391, 0.1562411, 0.1764706, 0, 1, 1,
0.5990753, -0.6806942, 0.01091342, 0.1803922, 0, 1, 1,
0.6019819, -0.1585951, 1.106631, 0.1882353, 0, 1, 1,
0.6020581, -0.6740862, 3.141577, 0.1921569, 0, 1, 1,
0.6023219, -0.3044462, 2.975545, 0.2, 0, 1, 1,
0.6088169, -0.1064375, 2.831557, 0.2078431, 0, 1, 1,
0.6103749, -0.1391529, 3.224342, 0.2117647, 0, 1, 1,
0.6134273, -0.8924696, 3.636145, 0.2196078, 0, 1, 1,
0.6150081, -0.301942, 1.59478, 0.2235294, 0, 1, 1,
0.6172009, -0.1719023, 1.151361, 0.2313726, 0, 1, 1,
0.6206785, -2.059514, 3.796423, 0.2352941, 0, 1, 1,
0.6227899, 1.267095, 0.2205111, 0.2431373, 0, 1, 1,
0.6232104, 0.2790699, -0.411833, 0.2470588, 0, 1, 1,
0.6290407, -0.6304747, 1.092215, 0.254902, 0, 1, 1,
0.6292823, 0.3231982, 0.3231856, 0.2588235, 0, 1, 1,
0.6308091, 0.1379757, 1.021337, 0.2666667, 0, 1, 1,
0.63146, -2.963475, 2.014529, 0.2705882, 0, 1, 1,
0.6364866, 0.3601435, -0.1830181, 0.2784314, 0, 1, 1,
0.641413, -1.807945, 1.238897, 0.282353, 0, 1, 1,
0.6437986, 1.297598, -0.1580993, 0.2901961, 0, 1, 1,
0.6464775, -0.5158142, 1.208708, 0.2941177, 0, 1, 1,
0.6477899, 0.3823739, 0.5471261, 0.3019608, 0, 1, 1,
0.6533288, 0.07311741, 3.188281, 0.3098039, 0, 1, 1,
0.654696, 1.760397, 1.088042, 0.3137255, 0, 1, 1,
0.6583725, -0.6561489, 2.699482, 0.3215686, 0, 1, 1,
0.6625535, -0.142293, 1.449536, 0.3254902, 0, 1, 1,
0.6628919, 0.4807292, 2.124417, 0.3333333, 0, 1, 1,
0.6634982, -1.089006, 1.475097, 0.3372549, 0, 1, 1,
0.6660363, 0.4342169, 1.216882, 0.345098, 0, 1, 1,
0.6670378, 1.852438, 1.81711, 0.3490196, 0, 1, 1,
0.6706068, 0.3550385, 2.10386, 0.3568628, 0, 1, 1,
0.6775221, -0.1521422, 3.459179, 0.3607843, 0, 1, 1,
0.6792011, 0.4666833, 2.215703, 0.3686275, 0, 1, 1,
0.6827105, -0.06467529, 2.715517, 0.372549, 0, 1, 1,
0.6847716, 1.598525, 1.047869, 0.3803922, 0, 1, 1,
0.6897997, 0.6034021, 3.105093, 0.3843137, 0, 1, 1,
0.6901724, 0.2157753, 1.239762, 0.3921569, 0, 1, 1,
0.6913482, 0.1337728, 2.379821, 0.3960784, 0, 1, 1,
0.695031, -0.06125562, 1.188236, 0.4039216, 0, 1, 1,
0.6985407, 0.3418993, 0.2909781, 0.4117647, 0, 1, 1,
0.6985799, 0.1908303, 1.626691, 0.4156863, 0, 1, 1,
0.7006617, 0.1072664, 2.381723, 0.4235294, 0, 1, 1,
0.7032472, 0.9709148, 0.9801702, 0.427451, 0, 1, 1,
0.7061616, -0.7486345, 1.78555, 0.4352941, 0, 1, 1,
0.7107741, -0.5720853, 3.015125, 0.4392157, 0, 1, 1,
0.7110819, 1.019356, 0.5032475, 0.4470588, 0, 1, 1,
0.7113761, 1.859853, 0.06450295, 0.4509804, 0, 1, 1,
0.7141618, -0.2704215, 1.146334, 0.4588235, 0, 1, 1,
0.7164489, -0.8868929, 2.100399, 0.4627451, 0, 1, 1,
0.7166157, -0.3123857, 1.569501, 0.4705882, 0, 1, 1,
0.7200596, -0.3896199, 3.761213, 0.4745098, 0, 1, 1,
0.7236127, 0.1960364, 1.488989, 0.4823529, 0, 1, 1,
0.731756, 0.1186314, 2.551944, 0.4862745, 0, 1, 1,
0.7321216, -0.9450966, 1.540028, 0.4941176, 0, 1, 1,
0.733815, -3.153965, 2.373207, 0.5019608, 0, 1, 1,
0.735884, 1.001943, 0.01233833, 0.5058824, 0, 1, 1,
0.7382065, 1.281137, 0.9003838, 0.5137255, 0, 1, 1,
0.7413834, -1.022357, 1.254218, 0.5176471, 0, 1, 1,
0.7445809, -0.4661613, 3.181319, 0.5254902, 0, 1, 1,
0.746676, -0.04093504, 1.443404, 0.5294118, 0, 1, 1,
0.7533201, -0.7640941, 2.57191, 0.5372549, 0, 1, 1,
0.7538584, 1.489424, -0.1481291, 0.5411765, 0, 1, 1,
0.7539104, -1.175114, 2.434988, 0.5490196, 0, 1, 1,
0.7589422, -0.4673542, 1.319171, 0.5529412, 0, 1, 1,
0.7653976, -0.5327154, 1.935787, 0.5607843, 0, 1, 1,
0.7662352, -1.293664, 1.479904, 0.5647059, 0, 1, 1,
0.7686469, -0.3960261, 1.664712, 0.572549, 0, 1, 1,
0.7692313, -0.2959777, 1.15524, 0.5764706, 0, 1, 1,
0.7707064, 1.739452, 0.872831, 0.5843138, 0, 1, 1,
0.7729048, 2.056478, 0.5289795, 0.5882353, 0, 1, 1,
0.7831009, 0.2299233, 0.3667662, 0.5960785, 0, 1, 1,
0.7864208, -1.412806, 3.410347, 0.6039216, 0, 1, 1,
0.7870737, 0.4685379, 1.707294, 0.6078432, 0, 1, 1,
0.7977433, 0.5219522, 2.786173, 0.6156863, 0, 1, 1,
0.8019876, 0.3499477, 0.4855636, 0.6196079, 0, 1, 1,
0.8148597, 1.34808, 0.6672801, 0.627451, 0, 1, 1,
0.8236538, 0.8882797, 1.637194, 0.6313726, 0, 1, 1,
0.8237571, 1.155729, -1.062533, 0.6392157, 0, 1, 1,
0.828096, -0.08950063, 1.825887, 0.6431373, 0, 1, 1,
0.8293488, -0.257628, 3.110371, 0.6509804, 0, 1, 1,
0.8364507, 0.2964156, 0.7213921, 0.654902, 0, 1, 1,
0.8394896, -0.693, 2.160834, 0.6627451, 0, 1, 1,
0.8405517, 0.0322561, 1.455194, 0.6666667, 0, 1, 1,
0.8428137, -0.6780079, 1.547493, 0.6745098, 0, 1, 1,
0.8492569, 0.1443621, 0.2895739, 0.6784314, 0, 1, 1,
0.8493619, 0.02318337, 0.6695979, 0.6862745, 0, 1, 1,
0.8539621, 0.1338182, 2.542442, 0.6901961, 0, 1, 1,
0.8544972, -0.2395705, 1.073329, 0.6980392, 0, 1, 1,
0.8546687, 0.6711974, -0.6032874, 0.7058824, 0, 1, 1,
0.8550779, 0.9931772, 1.663093, 0.7098039, 0, 1, 1,
0.8594581, -1.140288, 0.8687945, 0.7176471, 0, 1, 1,
0.8598645, -1.229041, 2.7365, 0.7215686, 0, 1, 1,
0.8601419, 0.3504211, 0.7425929, 0.7294118, 0, 1, 1,
0.8627577, -1.691071, 2.208658, 0.7333333, 0, 1, 1,
0.8664144, -0.2969518, 3.135787, 0.7411765, 0, 1, 1,
0.8675383, 0.6803352, 0.9085391, 0.7450981, 0, 1, 1,
0.8728682, -0.3894585, 2.867057, 0.7529412, 0, 1, 1,
0.8750802, 0.05064918, 1.149735, 0.7568628, 0, 1, 1,
0.8761523, -1.772057, 2.334686, 0.7647059, 0, 1, 1,
0.8789213, 0.5153435, 1.869271, 0.7686275, 0, 1, 1,
0.8826218, 0.04374754, -0.8035069, 0.7764706, 0, 1, 1,
0.8827968, -1.629528, 3.180941, 0.7803922, 0, 1, 1,
0.8884587, -0.052202, 2.485833, 0.7882353, 0, 1, 1,
0.8907698, -1.940678, 2.935239, 0.7921569, 0, 1, 1,
0.8979266, 1.661872, 0.6737898, 0.8, 0, 1, 1,
0.9068051, -1.449476, 2.948045, 0.8078431, 0, 1, 1,
0.9096171, 0.1884067, 1.537454, 0.8117647, 0, 1, 1,
0.9104918, -0.7867283, 2.132971, 0.8196079, 0, 1, 1,
0.9116182, 0.4922344, 1.516622, 0.8235294, 0, 1, 1,
0.9116318, 0.4508979, -0.0468354, 0.8313726, 0, 1, 1,
0.9147583, 0.8233453, -0.3978092, 0.8352941, 0, 1, 1,
0.9177362, -0.337844, 1.8389, 0.8431373, 0, 1, 1,
0.9205172, 0.6150086, 0.08382646, 0.8470588, 0, 1, 1,
0.9217379, -1.59857, 2.96348, 0.854902, 0, 1, 1,
0.924019, 0.8701736, -0.1319167, 0.8588235, 0, 1, 1,
0.9336697, -0.2626129, 2.044851, 0.8666667, 0, 1, 1,
0.9339641, -1.731877, 3.001333, 0.8705882, 0, 1, 1,
0.9434906, -2.882407, 3.443676, 0.8784314, 0, 1, 1,
0.9446213, 0.2591591, 0.3152232, 0.8823529, 0, 1, 1,
0.9463862, -0.04644369, 0.6361137, 0.8901961, 0, 1, 1,
0.9474515, -0.7226341, 2.328684, 0.8941177, 0, 1, 1,
0.9490409, -1.017038, 1.29459, 0.9019608, 0, 1, 1,
0.9608233, 1.041485, 1.694899, 0.9098039, 0, 1, 1,
0.9749467, -0.4756079, 2.272954, 0.9137255, 0, 1, 1,
0.9763069, 1.18465, 0.6067059, 0.9215686, 0, 1, 1,
0.980075, 0.1483306, 0.450991, 0.9254902, 0, 1, 1,
0.9802312, -0.6673675, 2.840204, 0.9333333, 0, 1, 1,
0.9824712, 0.1567602, 0.9867791, 0.9372549, 0, 1, 1,
0.9845582, -0.6586305, 3.123568, 0.945098, 0, 1, 1,
0.9849165, 1.478563, 0.6310995, 0.9490196, 0, 1, 1,
0.9901614, -0.1142692, 0.9654391, 0.9568627, 0, 1, 1,
0.9970697, -0.01291556, 1.653817, 0.9607843, 0, 1, 1,
1.009524, 0.01181652, 0.7647345, 0.9686275, 0, 1, 1,
1.011514, -0.3475306, 0.8863233, 0.972549, 0, 1, 1,
1.013552, -1.406799, 3.007742, 0.9803922, 0, 1, 1,
1.014809, -1.221796, 2.992533, 0.9843137, 0, 1, 1,
1.019316, -0.116994, 1.007614, 0.9921569, 0, 1, 1,
1.019539, -0.2043721, 2.716317, 0.9960784, 0, 1, 1,
1.020344, -1.492062, 4.308103, 1, 0, 0.9960784, 1,
1.021752, -1.572796, 3.001984, 1, 0, 0.9882353, 1,
1.026421, -0.5190061, 2.098848, 1, 0, 0.9843137, 1,
1.02779, -0.5129868, 3.247654, 1, 0, 0.9764706, 1,
1.029993, 0.384177, 1.329755, 1, 0, 0.972549, 1,
1.03014, -0.4243884, 2.205236, 1, 0, 0.9647059, 1,
1.031367, -0.5749216, 1.348849, 1, 0, 0.9607843, 1,
1.032923, 1.011146, 1.891549, 1, 0, 0.9529412, 1,
1.034295, -0.2407082, 2.278746, 1, 0, 0.9490196, 1,
1.036619, 0.9695026, 0.9116439, 1, 0, 0.9411765, 1,
1.03688, 0.5286109, 2.867087, 1, 0, 0.9372549, 1,
1.041099, 1.031859, 0.6144071, 1, 0, 0.9294118, 1,
1.041461, -0.8697841, 1.999686, 1, 0, 0.9254902, 1,
1.058244, -0.1127267, 1.217202, 1, 0, 0.9176471, 1,
1.082536, -0.840537, 2.711519, 1, 0, 0.9137255, 1,
1.0875, -0.2748512, 0.584001, 1, 0, 0.9058824, 1,
1.091522, -0.3828185, 1.021542, 1, 0, 0.9019608, 1,
1.093277, 0.5971157, 2.17178, 1, 0, 0.8941177, 1,
1.094092, 1.175897, -1.52969, 1, 0, 0.8862745, 1,
1.094504, -0.4747663, 1.374979, 1, 0, 0.8823529, 1,
1.095893, 0.9655973, 0.01601726, 1, 0, 0.8745098, 1,
1.097615, -0.4068677, 2.733694, 1, 0, 0.8705882, 1,
1.109431, 0.7327064, 0.3254503, 1, 0, 0.8627451, 1,
1.110153, -0.6798149, 3.105824, 1, 0, 0.8588235, 1,
1.115056, -1.686092, 2.23557, 1, 0, 0.8509804, 1,
1.115271, 1.695828, 1.259668, 1, 0, 0.8470588, 1,
1.117753, -0.5994967, 3.320787, 1, 0, 0.8392157, 1,
1.117825, 1.265081, 1.412946, 1, 0, 0.8352941, 1,
1.122436, 0.06485976, 1.506451, 1, 0, 0.827451, 1,
1.141089, 0.7115754, 1.035823, 1, 0, 0.8235294, 1,
1.158886, 1.015184, 1.283845, 1, 0, 0.8156863, 1,
1.16661, 0.3195063, 2.155404, 1, 0, 0.8117647, 1,
1.170503, -0.2505839, 1.830631, 1, 0, 0.8039216, 1,
1.180291, -1.32892, 2.00645, 1, 0, 0.7960784, 1,
1.180393, 1.523059, 0.7370644, 1, 0, 0.7921569, 1,
1.18856, 1.040885, 1.311954, 1, 0, 0.7843137, 1,
1.190179, -0.2445382, 1.928517, 1, 0, 0.7803922, 1,
1.194858, -0.2862349, 1.426709, 1, 0, 0.772549, 1,
1.194941, 0.870495, 2.07251, 1, 0, 0.7686275, 1,
1.208973, -0.6756203, 0.7189304, 1, 0, 0.7607843, 1,
1.211403, -0.1849504, 0.7249178, 1, 0, 0.7568628, 1,
1.213035, -1.503507, 1.614093, 1, 0, 0.7490196, 1,
1.213504, -1.751477, 2.426421, 1, 0, 0.7450981, 1,
1.216113, 0.1972875, 0.5697235, 1, 0, 0.7372549, 1,
1.219785, -0.9033682, 3.647316, 1, 0, 0.7333333, 1,
1.231082, -1.478801, 2.113095, 1, 0, 0.7254902, 1,
1.231423, 1.75866, 0.06098958, 1, 0, 0.7215686, 1,
1.236516, 1.380737, 1.95206, 1, 0, 0.7137255, 1,
1.238637, -0.5352588, 1.190758, 1, 0, 0.7098039, 1,
1.240467, -0.8498611, 1.778756, 1, 0, 0.7019608, 1,
1.244027, 2.216038, 0.1151152, 1, 0, 0.6941177, 1,
1.257921, -0.2300013, 1.782971, 1, 0, 0.6901961, 1,
1.265823, 0.8026603, 2.524317, 1, 0, 0.682353, 1,
1.268592, 0.1244207, 1.777494, 1, 0, 0.6784314, 1,
1.268757, 0.5114383, 0.05915243, 1, 0, 0.6705883, 1,
1.2689, 0.3311118, 0.942915, 1, 0, 0.6666667, 1,
1.269178, 0.6070488, 0.2145573, 1, 0, 0.6588235, 1,
1.278733, -0.8099837, 2.827554, 1, 0, 0.654902, 1,
1.288778, 0.5705107, -0.6548205, 1, 0, 0.6470588, 1,
1.295798, 0.7468016, 2.697529, 1, 0, 0.6431373, 1,
1.302463, -0.752951, 1.526861, 1, 0, 0.6352941, 1,
1.31389, 0.2186814, 0.2385669, 1, 0, 0.6313726, 1,
1.318144, 0.8233479, 1.808013, 1, 0, 0.6235294, 1,
1.319147, 1.542899, 0.7397663, 1, 0, 0.6196079, 1,
1.332507, 0.9125739, 0.1863089, 1, 0, 0.6117647, 1,
1.33254, 0.5688771, 1.610427, 1, 0, 0.6078432, 1,
1.344622, -0.5960016, 4.638727, 1, 0, 0.6, 1,
1.357022, -0.597025, 0.8801638, 1, 0, 0.5921569, 1,
1.363349, -0.6586024, 3.939239, 1, 0, 0.5882353, 1,
1.390849, 0.3788712, 1.166639, 1, 0, 0.5803922, 1,
1.411476, 0.4313059, 2.565785, 1, 0, 0.5764706, 1,
1.411525, -0.1726678, 2.015192, 1, 0, 0.5686275, 1,
1.418157, -0.5367657, 1.732905, 1, 0, 0.5647059, 1,
1.437316, 1.636894, 0.3953741, 1, 0, 0.5568628, 1,
1.438809, -0.6975319, 2.310204, 1, 0, 0.5529412, 1,
1.438959, 0.09470532, 2.139124, 1, 0, 0.5450981, 1,
1.445316, -0.4548225, 1.505997, 1, 0, 0.5411765, 1,
1.458323, -1.165635, 0.09879883, 1, 0, 0.5333334, 1,
1.460715, 1.410717, 0.3645249, 1, 0, 0.5294118, 1,
1.460956, 1.475014, 0.0656232, 1, 0, 0.5215687, 1,
1.462145, 0.3078127, 2.742573, 1, 0, 0.5176471, 1,
1.465493, 0.6813172, -0.7616381, 1, 0, 0.509804, 1,
1.469959, 2.354918, 1.474631, 1, 0, 0.5058824, 1,
1.474497, -1.131329, 2.174313, 1, 0, 0.4980392, 1,
1.489707, 0.3627543, 2.03305, 1, 0, 0.4901961, 1,
1.489764, 0.4441577, 1.48726, 1, 0, 0.4862745, 1,
1.490742, -1.327896, 1.530577, 1, 0, 0.4784314, 1,
1.499435, 0.01778741, 1.042451, 1, 0, 0.4745098, 1,
1.501199, 0.1567569, 1.441993, 1, 0, 0.4666667, 1,
1.509761, -1.29536, 3.360142, 1, 0, 0.4627451, 1,
1.512462, -0.03123927, 2.554603, 1, 0, 0.454902, 1,
1.514743, 0.2235903, 1.115157, 1, 0, 0.4509804, 1,
1.531297, 1.77282, 0.6555757, 1, 0, 0.4431373, 1,
1.542379, 0.6817592, 0.9166753, 1, 0, 0.4392157, 1,
1.570174, -0.08713336, 0.1661984, 1, 0, 0.4313726, 1,
1.584857, 2.144845, 0.7524309, 1, 0, 0.427451, 1,
1.609457, 0.365093, 1.22163, 1, 0, 0.4196078, 1,
1.611743, 1.120104, -1.220183, 1, 0, 0.4156863, 1,
1.614675, 0.8611463, 3.355959, 1, 0, 0.4078431, 1,
1.620976, -0.5901872, 2.06461, 1, 0, 0.4039216, 1,
1.621418, -0.4302152, 1.590051, 1, 0, 0.3960784, 1,
1.622993, 0.6059561, 2.369448, 1, 0, 0.3882353, 1,
1.626736, -0.2078289, 1.70315, 1, 0, 0.3843137, 1,
1.634783, 0.9371555, 1.786088, 1, 0, 0.3764706, 1,
1.657587, -2.62394, 3.204934, 1, 0, 0.372549, 1,
1.658983, 1.372734, 1.360838, 1, 0, 0.3647059, 1,
1.660456, -0.449825, 2.75435, 1, 0, 0.3607843, 1,
1.668735, 0.7049684, 0.003654169, 1, 0, 0.3529412, 1,
1.674581, 0.6366373, 2.776157, 1, 0, 0.3490196, 1,
1.674845, 0.6928562, -0.473549, 1, 0, 0.3411765, 1,
1.683445, 0.2531574, 0.7265847, 1, 0, 0.3372549, 1,
1.684027, 0.7151085, 0.3862559, 1, 0, 0.3294118, 1,
1.684838, -0.7088987, 1.852772, 1, 0, 0.3254902, 1,
1.703618, -1.071448, 1.142012, 1, 0, 0.3176471, 1,
1.704199, -0.8861465, 0.5222379, 1, 0, 0.3137255, 1,
1.708821, -0.1055238, 1.149112, 1, 0, 0.3058824, 1,
1.711814, 0.490865, -0.7156922, 1, 0, 0.2980392, 1,
1.718734, 0.5482571, 1.582838, 1, 0, 0.2941177, 1,
1.722493, -0.2701346, 1.109964, 1, 0, 0.2862745, 1,
1.728274, -0.07034308, 2.701807, 1, 0, 0.282353, 1,
1.740399, -0.09168476, 1.719799, 1, 0, 0.2745098, 1,
1.744788, 0.2099379, 0.728994, 1, 0, 0.2705882, 1,
1.750786, 0.8206306, 3.422504, 1, 0, 0.2627451, 1,
1.751652, -0.5240725, 3.324152, 1, 0, 0.2588235, 1,
1.757872, 0.2321045, 1.822752, 1, 0, 0.2509804, 1,
1.759535, -0.1286036, 0.8817884, 1, 0, 0.2470588, 1,
1.759715, -0.9547125, 4.414015, 1, 0, 0.2392157, 1,
1.769343, -1.429377, 2.674418, 1, 0, 0.2352941, 1,
1.84862, -0.4276599, 1.614626, 1, 0, 0.227451, 1,
1.85448, 0.0005199548, 1.31636, 1, 0, 0.2235294, 1,
1.855714, 1.226613, 1.679565, 1, 0, 0.2156863, 1,
1.871073, 0.9798241, 0.4107406, 1, 0, 0.2117647, 1,
1.88466, -1.387866, 1.707898, 1, 0, 0.2039216, 1,
1.885922, 2.053344, 0.8151781, 1, 0, 0.1960784, 1,
1.89757, 0.9214795, 1.096419, 1, 0, 0.1921569, 1,
1.908359, 1.411101, 0.9011142, 1, 0, 0.1843137, 1,
1.919129, -1.221298, 0.9951404, 1, 0, 0.1803922, 1,
1.937485, -0.01759379, 2.169228, 1, 0, 0.172549, 1,
1.952097, 1.820704, -0.07612668, 1, 0, 0.1686275, 1,
1.96007, 0.03425399, -0.3084787, 1, 0, 0.1607843, 1,
1.967122, 0.4528159, -0.3891136, 1, 0, 0.1568628, 1,
1.976458, -1.862695, 2.147308, 1, 0, 0.1490196, 1,
2.012493, -0.8497097, 1.838427, 1, 0, 0.145098, 1,
2.018965, -1.274303, 0.09822074, 1, 0, 0.1372549, 1,
2.049789, 0.5360087, 0.9805683, 1, 0, 0.1333333, 1,
2.055255, 1.13256, 0.4494472, 1, 0, 0.1254902, 1,
2.06594, 0.8325671, 0.4586068, 1, 0, 0.1215686, 1,
2.087962, 0.5026347, 1.759464, 1, 0, 0.1137255, 1,
2.14173, -0.6823236, 2.41687, 1, 0, 0.1098039, 1,
2.157812, 0.3731126, 2.21893, 1, 0, 0.1019608, 1,
2.168768, -0.4241133, 1.85485, 1, 0, 0.09411765, 1,
2.183758, -0.2910128, 1.56847, 1, 0, 0.09019608, 1,
2.183858, -0.5235471, 0.375602, 1, 0, 0.08235294, 1,
2.197858, -0.7914006, 2.258739, 1, 0, 0.07843138, 1,
2.200456, -0.5244824, 2.300273, 1, 0, 0.07058824, 1,
2.332125, 1.958957, 1.168964, 1, 0, 0.06666667, 1,
2.425241, -0.06459659, 2.687593, 1, 0, 0.05882353, 1,
2.536407, 0.2448839, 0.08176905, 1, 0, 0.05490196, 1,
2.537269, -0.5676454, 1.974838, 1, 0, 0.04705882, 1,
2.544805, -1.784826, 3.072084, 1, 0, 0.04313726, 1,
2.665828, 1.72745, 3.377999, 1, 0, 0.03529412, 1,
2.690956, 1.419174, 0.4858454, 1, 0, 0.03137255, 1,
2.702954, -0.4627416, 1.966211, 1, 0, 0.02352941, 1,
2.744501, -0.07471503, -0.2707862, 1, 0, 0.01960784, 1,
2.829281, 0.7682817, 2.273166, 1, 0, 0.01176471, 1,
3.194062, 0.7315503, 0.9200953, 1, 0, 0.007843138, 1
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
-0.3453423, -4.413861, -6.919147, 0, -0.5, 0.5, 0.5,
-0.3453423, -4.413861, -6.919147, 1, -0.5, 0.5, 0.5,
-0.3453423, -4.413861, -6.919147, 1, 1.5, 0.5, 0.5,
-0.3453423, -4.413861, -6.919147, 0, 1.5, 0.5, 0.5
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
-5.084604, 0.245254, -6.919147, 0, -0.5, 0.5, 0.5,
-5.084604, 0.245254, -6.919147, 1, -0.5, 0.5, 0.5,
-5.084604, 0.245254, -6.919147, 1, 1.5, 0.5, 0.5,
-5.084604, 0.245254, -6.919147, 0, 1.5, 0.5, 0.5
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
-5.084604, -4.413861, 0.07377601, 0, -0.5, 0.5, 0.5,
-5.084604, -4.413861, 0.07377601, 1, -0.5, 0.5, 0.5,
-5.084604, -4.413861, 0.07377601, 1, 1.5, 0.5, 0.5,
-5.084604, -4.413861, 0.07377601, 0, 1.5, 0.5, 0.5
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
-2, -3.33868, -5.305395,
2, -3.33868, -5.305395,
-2, -3.33868, -5.305395,
-2, -3.517877, -5.574354,
0, -3.33868, -5.305395,
0, -3.517877, -5.574354,
2, -3.33868, -5.305395,
2, -3.517877, -5.574354
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
-2, -3.876271, -6.112271, 0, -0.5, 0.5, 0.5,
-2, -3.876271, -6.112271, 1, -0.5, 0.5, 0.5,
-2, -3.876271, -6.112271, 1, 1.5, 0.5, 0.5,
-2, -3.876271, -6.112271, 0, 1.5, 0.5, 0.5,
0, -3.876271, -6.112271, 0, -0.5, 0.5, 0.5,
0, -3.876271, -6.112271, 1, -0.5, 0.5, 0.5,
0, -3.876271, -6.112271, 1, 1.5, 0.5, 0.5,
0, -3.876271, -6.112271, 0, 1.5, 0.5, 0.5,
2, -3.876271, -6.112271, 0, -0.5, 0.5, 0.5,
2, -3.876271, -6.112271, 1, -0.5, 0.5, 0.5,
2, -3.876271, -6.112271, 1, 1.5, 0.5, 0.5,
2, -3.876271, -6.112271, 0, 1.5, 0.5, 0.5
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
-3.990928, -3, -5.305395,
-3.990928, 3, -5.305395,
-3.990928, -3, -5.305395,
-4.173207, -3, -5.574354,
-3.990928, -2, -5.305395,
-4.173207, -2, -5.574354,
-3.990928, -1, -5.305395,
-4.173207, -1, -5.574354,
-3.990928, 0, -5.305395,
-4.173207, 0, -5.574354,
-3.990928, 1, -5.305395,
-4.173207, 1, -5.574354,
-3.990928, 2, -5.305395,
-4.173207, 2, -5.574354,
-3.990928, 3, -5.305395,
-4.173207, 3, -5.574354
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
-4.537766, -3, -6.112271, 0, -0.5, 0.5, 0.5,
-4.537766, -3, -6.112271, 1, -0.5, 0.5, 0.5,
-4.537766, -3, -6.112271, 1, 1.5, 0.5, 0.5,
-4.537766, -3, -6.112271, 0, 1.5, 0.5, 0.5,
-4.537766, -2, -6.112271, 0, -0.5, 0.5, 0.5,
-4.537766, -2, -6.112271, 1, -0.5, 0.5, 0.5,
-4.537766, -2, -6.112271, 1, 1.5, 0.5, 0.5,
-4.537766, -2, -6.112271, 0, 1.5, 0.5, 0.5,
-4.537766, -1, -6.112271, 0, -0.5, 0.5, 0.5,
-4.537766, -1, -6.112271, 1, -0.5, 0.5, 0.5,
-4.537766, -1, -6.112271, 1, 1.5, 0.5, 0.5,
-4.537766, -1, -6.112271, 0, 1.5, 0.5, 0.5,
-4.537766, 0, -6.112271, 0, -0.5, 0.5, 0.5,
-4.537766, 0, -6.112271, 1, -0.5, 0.5, 0.5,
-4.537766, 0, -6.112271, 1, 1.5, 0.5, 0.5,
-4.537766, 0, -6.112271, 0, 1.5, 0.5, 0.5,
-4.537766, 1, -6.112271, 0, -0.5, 0.5, 0.5,
-4.537766, 1, -6.112271, 1, -0.5, 0.5, 0.5,
-4.537766, 1, -6.112271, 1, 1.5, 0.5, 0.5,
-4.537766, 1, -6.112271, 0, 1.5, 0.5, 0.5,
-4.537766, 2, -6.112271, 0, -0.5, 0.5, 0.5,
-4.537766, 2, -6.112271, 1, -0.5, 0.5, 0.5,
-4.537766, 2, -6.112271, 1, 1.5, 0.5, 0.5,
-4.537766, 2, -6.112271, 0, 1.5, 0.5, 0.5,
-4.537766, 3, -6.112271, 0, -0.5, 0.5, 0.5,
-4.537766, 3, -6.112271, 1, -0.5, 0.5, 0.5,
-4.537766, 3, -6.112271, 1, 1.5, 0.5, 0.5,
-4.537766, 3, -6.112271, 0, 1.5, 0.5, 0.5
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
-3.990928, -3.33868, -4,
-3.990928, -3.33868, 4,
-3.990928, -3.33868, -4,
-4.173207, -3.517877, -4,
-3.990928, -3.33868, -2,
-4.173207, -3.517877, -2,
-3.990928, -3.33868, 0,
-4.173207, -3.517877, 0,
-3.990928, -3.33868, 2,
-4.173207, -3.517877, 2,
-3.990928, -3.33868, 4,
-4.173207, -3.517877, 4
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
-4.537766, -3.876271, -4, 0, -0.5, 0.5, 0.5,
-4.537766, -3.876271, -4, 1, -0.5, 0.5, 0.5,
-4.537766, -3.876271, -4, 1, 1.5, 0.5, 0.5,
-4.537766, -3.876271, -4, 0, 1.5, 0.5, 0.5,
-4.537766, -3.876271, -2, 0, -0.5, 0.5, 0.5,
-4.537766, -3.876271, -2, 1, -0.5, 0.5, 0.5,
-4.537766, -3.876271, -2, 1, 1.5, 0.5, 0.5,
-4.537766, -3.876271, -2, 0, 1.5, 0.5, 0.5,
-4.537766, -3.876271, 0, 0, -0.5, 0.5, 0.5,
-4.537766, -3.876271, 0, 1, -0.5, 0.5, 0.5,
-4.537766, -3.876271, 0, 1, 1.5, 0.5, 0.5,
-4.537766, -3.876271, 0, 0, 1.5, 0.5, 0.5,
-4.537766, -3.876271, 2, 0, -0.5, 0.5, 0.5,
-4.537766, -3.876271, 2, 1, -0.5, 0.5, 0.5,
-4.537766, -3.876271, 2, 1, 1.5, 0.5, 0.5,
-4.537766, -3.876271, 2, 0, 1.5, 0.5, 0.5,
-4.537766, -3.876271, 4, 0, -0.5, 0.5, 0.5,
-4.537766, -3.876271, 4, 1, -0.5, 0.5, 0.5,
-4.537766, -3.876271, 4, 1, 1.5, 0.5, 0.5,
-4.537766, -3.876271, 4, 0, 1.5, 0.5, 0.5
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
-3.990928, -3.33868, -5.305395,
-3.990928, 3.829188, -5.305395,
-3.990928, -3.33868, 5.452947,
-3.990928, 3.829188, 5.452947,
-3.990928, -3.33868, -5.305395,
-3.990928, -3.33868, 5.452947,
-3.990928, 3.829188, -5.305395,
-3.990928, 3.829188, 5.452947,
-3.990928, -3.33868, -5.305395,
3.300244, -3.33868, -5.305395,
-3.990928, -3.33868, 5.452947,
3.300244, -3.33868, 5.452947,
-3.990928, 3.829188, -5.305395,
3.300244, 3.829188, -5.305395,
-3.990928, 3.829188, 5.452947,
3.300244, 3.829188, 5.452947,
3.300244, -3.33868, -5.305395,
3.300244, 3.829188, -5.305395,
3.300244, -3.33868, 5.452947,
3.300244, 3.829188, 5.452947,
3.300244, -3.33868, -5.305395,
3.300244, -3.33868, 5.452947,
3.300244, 3.829188, -5.305395,
3.300244, 3.829188, 5.452947
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
var radius = 7.925277;
var distance = 35.26045;
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
mvMatrix.translate( 0.3453423, -0.245254, -0.07377601 );
mvMatrix.scale( 1.175252, 1.195469, 0.7964949 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.26045);
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
prop-2-ynyl_bromide<-read.table("prop-2-ynyl_bromide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prop-2-ynyl_bromide$V2
```

```
## Error in eval(expr, envir, enclos): object 'prop' not found
```

```r
y<-prop-2-ynyl_bromide$V3
```

```
## Error in eval(expr, envir, enclos): object 'prop' not found
```

```r
z<-prop-2-ynyl_bromide$V4
```

```
## Error in eval(expr, envir, enclos): object 'prop' not found
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
-3.884746, -3.234294, -3.054335, 0, 0, 1, 1, 1,
-3.832197, -1.387929, -2.803292, 1, 0, 0, 1, 1,
-3.195063, 0.3791883, -1.272973, 1, 0, 0, 1, 1,
-3.004146, 0.6918934, -1.731366, 1, 0, 0, 1, 1,
-2.981618, 0.2669603, -2.589438, 1, 0, 0, 1, 1,
-2.894392, -0.7759843, -2.069756, 1, 0, 0, 1, 1,
-2.836982, -0.2436365, -3.836967, 0, 0, 0, 1, 1,
-2.767069, 0.1951727, -0.3861075, 0, 0, 0, 1, 1,
-2.660908, 1.40808, -0.4766091, 0, 0, 0, 1, 1,
-2.628899, -0.108227, -2.089363, 0, 0, 0, 1, 1,
-2.496598, -0.9703355, -1.150943, 0, 0, 0, 1, 1,
-2.478591, -1.428442, -1.760241, 0, 0, 0, 1, 1,
-2.398606, -0.1606664, -0.4789455, 0, 0, 0, 1, 1,
-2.37562, 0.1738617, -2.702527, 1, 1, 1, 1, 1,
-2.305779, 1.591051, 0.1851611, 1, 1, 1, 1, 1,
-2.25386, -0.3924353, -2.663189, 1, 1, 1, 1, 1,
-2.186052, -0.2850612, -2.056945, 1, 1, 1, 1, 1,
-2.167495, -1.173674, -3.241122, 1, 1, 1, 1, 1,
-2.152509, -0.4910111, -0.634851, 1, 1, 1, 1, 1,
-2.143665, -0.3244032, -1.1705, 1, 1, 1, 1, 1,
-2.125938, -1.924614, -2.763331, 1, 1, 1, 1, 1,
-2.125527, -0.9121701, -3.029592, 1, 1, 1, 1, 1,
-2.08163, 0.2635695, -2.699533, 1, 1, 1, 1, 1,
-2.053225, -0.1907564, -1.348818, 1, 1, 1, 1, 1,
-2.051095, 0.6656008, -1.304121, 1, 1, 1, 1, 1,
-1.999481, 1.377728, -0.6099555, 1, 1, 1, 1, 1,
-1.978005, -0.5707473, -1.743748, 1, 1, 1, 1, 1,
-1.97056, 1.27191, -0.5678034, 1, 1, 1, 1, 1,
-1.929474, 0.3656461, -2.646778, 0, 0, 1, 1, 1,
-1.914796, 0.205182, -2.713197, 1, 0, 0, 1, 1,
-1.895007, 0.4684432, -1.662708, 1, 0, 0, 1, 1,
-1.87847, 1.350793, -1.925606, 1, 0, 0, 1, 1,
-1.86062, -0.257102, -0.5357159, 1, 0, 0, 1, 1,
-1.855057, -1.042509, -3.674201, 1, 0, 0, 1, 1,
-1.851753, -0.1856937, -2.249818, 0, 0, 0, 1, 1,
-1.825746, -1.040049, -2.030863, 0, 0, 0, 1, 1,
-1.78711, 1.13725, 0.5140223, 0, 0, 0, 1, 1,
-1.784854, 0.2296951, -0.9696125, 0, 0, 0, 1, 1,
-1.78228, -1.988576, -3.437416, 0, 0, 0, 1, 1,
-1.772243, 0.6904497, -2.271789, 0, 0, 0, 1, 1,
-1.771009, 0.04799185, -2.298787, 0, 0, 0, 1, 1,
-1.761732, 0.8214565, -2.420643, 1, 1, 1, 1, 1,
-1.751131, 0.9499412, -0.9995503, 1, 1, 1, 1, 1,
-1.750064, 0.5078493, -1.393672, 1, 1, 1, 1, 1,
-1.724795, 0.4579207, -2.214287, 1, 1, 1, 1, 1,
-1.705061, -0.4791767, -2.484268, 1, 1, 1, 1, 1,
-1.682925, -0.06285914, -0.3355804, 1, 1, 1, 1, 1,
-1.679318, 1.815767, -0.8917403, 1, 1, 1, 1, 1,
-1.65374, 0.8560566, -1.598669, 1, 1, 1, 1, 1,
-1.643772, 1.479191, -1.734557, 1, 1, 1, 1, 1,
-1.632389, -0.2199796, -2.57528, 1, 1, 1, 1, 1,
-1.632268, 3.04007, -0.2265037, 1, 1, 1, 1, 1,
-1.623492, 0.7451917, -1.380938, 1, 1, 1, 1, 1,
-1.618307, -1.493031, -1.817742, 1, 1, 1, 1, 1,
-1.613507, -1.906441, -2.71967, 1, 1, 1, 1, 1,
-1.612951, -0.3055497, -2.932292, 1, 1, 1, 1, 1,
-1.59601, -0.3514325, -2.203015, 0, 0, 1, 1, 1,
-1.588394, 0.9289054, -1.869385, 1, 0, 0, 1, 1,
-1.58397, -0.07562134, -2.71289, 1, 0, 0, 1, 1,
-1.573124, 0.3875403, -1.4439, 1, 0, 0, 1, 1,
-1.567523, -0.3275846, -1.964337, 1, 0, 0, 1, 1,
-1.564786, -2.409409, -3.552146, 1, 0, 0, 1, 1,
-1.56142, 1.322171, 0.01372685, 0, 0, 0, 1, 1,
-1.55188, -2.234145, -2.758653, 0, 0, 0, 1, 1,
-1.550519, 0.1828272, -1.900128, 0, 0, 0, 1, 1,
-1.549884, -0.8627386, -4.264349, 0, 0, 0, 1, 1,
-1.548032, -1.150241, -3.654283, 0, 0, 0, 1, 1,
-1.546349, -1.064215, -0.4430419, 0, 0, 0, 1, 1,
-1.535054, 1.28059, -1.016692, 0, 0, 0, 1, 1,
-1.519109, 0.148008, -1.056565, 1, 1, 1, 1, 1,
-1.499995, 0.197933, -1.403701, 1, 1, 1, 1, 1,
-1.491018, 0.4686268, -1.445173, 1, 1, 1, 1, 1,
-1.485235, 1.595272, -0.04235999, 1, 1, 1, 1, 1,
-1.483367, 0.7806295, -1.340633, 1, 1, 1, 1, 1,
-1.479418, -0.4438047, -0.9935293, 1, 1, 1, 1, 1,
-1.47215, -0.713846, -1.562782, 1, 1, 1, 1, 1,
-1.471927, 0.7534727, 0.645053, 1, 1, 1, 1, 1,
-1.471043, 0.4171354, -0.7768963, 1, 1, 1, 1, 1,
-1.462675, -0.4668252, -4.112247, 1, 1, 1, 1, 1,
-1.455611, -1.037756, -1.429828, 1, 1, 1, 1, 1,
-1.451081, -1.460443, -1.436341, 1, 1, 1, 1, 1,
-1.439636, -1.403672, -3.012314, 1, 1, 1, 1, 1,
-1.439571, 0.7891535, -3.082718, 1, 1, 1, 1, 1,
-1.434129, -0.6736045, -0.8433034, 1, 1, 1, 1, 1,
-1.429195, 0.0513928, -1.526867, 0, 0, 1, 1, 1,
-1.42891, -0.8837744, -2.948462, 1, 0, 0, 1, 1,
-1.424674, 1.110339, -1.277768, 1, 0, 0, 1, 1,
-1.416454, 1.763063, 0.05039786, 1, 0, 0, 1, 1,
-1.411409, -1.112384, -2.585619, 1, 0, 0, 1, 1,
-1.407897, 0.6850758, 0.5976096, 1, 0, 0, 1, 1,
-1.401872, 0.368052, -1.813342, 0, 0, 0, 1, 1,
-1.396645, 0.4205476, 0.2871089, 0, 0, 0, 1, 1,
-1.386735, 0.03010196, -0.9583983, 0, 0, 0, 1, 1,
-1.384802, 1.634628, 1.243623, 0, 0, 0, 1, 1,
-1.378983, -0.149894, -2.484823, 0, 0, 0, 1, 1,
-1.370926, -0.1183699, -1.262583, 0, 0, 0, 1, 1,
-1.363423, 1.735376, -0.1636186, 0, 0, 0, 1, 1,
-1.361459, -0.791373, -2.212612, 1, 1, 1, 1, 1,
-1.354592, 0.7296756, -1.607559, 1, 1, 1, 1, 1,
-1.348259, -0.2254355, -3.143583, 1, 1, 1, 1, 1,
-1.335424, 0.09771652, -0.1721861, 1, 1, 1, 1, 1,
-1.335006, -0.4172018, -1.965562, 1, 1, 1, 1, 1,
-1.316297, 0.1378314, -0.7689816, 1, 1, 1, 1, 1,
-1.315901, 0.4569931, -0.9774821, 1, 1, 1, 1, 1,
-1.310023, 0.321845, -1.28958, 1, 1, 1, 1, 1,
-1.307147, 0.4401832, -1.289822, 1, 1, 1, 1, 1,
-1.306118, -0.682641, -2.457622, 1, 1, 1, 1, 1,
-1.30575, 1.182618, 0.4925488, 1, 1, 1, 1, 1,
-1.30075, 0.7850026, -0.4573061, 1, 1, 1, 1, 1,
-1.283861, 0.39728, 0.854451, 1, 1, 1, 1, 1,
-1.281316, -0.7939839, -1.667493, 1, 1, 1, 1, 1,
-1.256536, 1.681394, -0.8392902, 1, 1, 1, 1, 1,
-1.253423, 0.7086573, -2.553616, 0, 0, 1, 1, 1,
-1.248424, 2.312541, -1.075096, 1, 0, 0, 1, 1,
-1.247978, 0.4279481, -2.176383, 1, 0, 0, 1, 1,
-1.244978, 0.8469588, 0.6009452, 1, 0, 0, 1, 1,
-1.239837, 1.13564, -0.8155719, 1, 0, 0, 1, 1,
-1.222439, 0.2192667, -1.702646, 1, 0, 0, 1, 1,
-1.213759, -0.384713, -1.509667, 0, 0, 0, 1, 1,
-1.210581, 0.6704946, -2.274549, 0, 0, 0, 1, 1,
-1.210499, -1.979374, -1.869795, 0, 0, 0, 1, 1,
-1.206312, 1.542205, 0.045711, 0, 0, 0, 1, 1,
-1.201142, 0.1268034, -2.304405, 0, 0, 0, 1, 1,
-1.199403, 0.1255026, -2.201066, 0, 0, 0, 1, 1,
-1.196987, 1.718252, -0.7430863, 0, 0, 0, 1, 1,
-1.194431, 0.2862063, -0.8370577, 1, 1, 1, 1, 1,
-1.191802, -0.9876403, -3.4598, 1, 1, 1, 1, 1,
-1.182335, -0.9439433, -2.18431, 1, 1, 1, 1, 1,
-1.181274, 1.605287, -0.2441387, 1, 1, 1, 1, 1,
-1.178138, -0.3661132, -0.8477515, 1, 1, 1, 1, 1,
-1.176711, -0.3190234, -2.331449, 1, 1, 1, 1, 1,
-1.174627, -0.07110262, -3.255827, 1, 1, 1, 1, 1,
-1.168958, -0.02724204, -0.5379202, 1, 1, 1, 1, 1,
-1.149311, -0.009570375, -0.8081052, 1, 1, 1, 1, 1,
-1.148996, -1.584027, -2.593278, 1, 1, 1, 1, 1,
-1.147054, 0.593513, -1.588527, 1, 1, 1, 1, 1,
-1.141218, -0.3056445, -1.559137, 1, 1, 1, 1, 1,
-1.13543, 1.957937, -0.6010883, 1, 1, 1, 1, 1,
-1.126932, 0.7154053, 0.9968665, 1, 1, 1, 1, 1,
-1.117641, -0.9003353, -0.8660532, 1, 1, 1, 1, 1,
-1.107389, -1.296461, -2.016529, 0, 0, 1, 1, 1,
-1.104203, 0.566524, -1.190843, 1, 0, 0, 1, 1,
-1.103389, -0.4241339, -3.138072, 1, 0, 0, 1, 1,
-1.102095, -1.001241, -1.94266, 1, 0, 0, 1, 1,
-1.092723, -0.2494964, -2.226738, 1, 0, 0, 1, 1,
-1.087637, 2.275567, -1.02635, 1, 0, 0, 1, 1,
-1.086099, -0.1197582, -0.4846426, 0, 0, 0, 1, 1,
-1.081, -1.090477, -1.847819, 0, 0, 0, 1, 1,
-1.080187, -1.143983, -1.466746, 0, 0, 0, 1, 1,
-1.080023, -0.8118147, -1.997616, 0, 0, 0, 1, 1,
-1.077019, 1.249341, 2.009346, 0, 0, 0, 1, 1,
-1.073465, -1.137396, -3.860619, 0, 0, 0, 1, 1,
-1.068557, -0.4092064, -2.758913, 0, 0, 0, 1, 1,
-1.061557, -0.09528154, -1.111054, 1, 1, 1, 1, 1,
-1.060587, 0.7370483, 0.03114922, 1, 1, 1, 1, 1,
-1.049252, 2.064677, -0.3459269, 1, 1, 1, 1, 1,
-1.045267, 1.921554, 0.1274354, 1, 1, 1, 1, 1,
-1.04268, -0.3864723, -3.177811, 1, 1, 1, 1, 1,
-1.041089, -1.364438, -2.773595, 1, 1, 1, 1, 1,
-1.032516, 0.8494985, -1.527918, 1, 1, 1, 1, 1,
-1.01783, -0.3674488, -2.435276, 1, 1, 1, 1, 1,
-1.014081, -1.090472, -3.5055, 1, 1, 1, 1, 1,
-1.010466, -0.007910135, -1.057881, 1, 1, 1, 1, 1,
-1.010183, -1.287495, -3.163342, 1, 1, 1, 1, 1,
-1.003559, -0.1660348, -1.967842, 1, 1, 1, 1, 1,
-1.000944, 1.494491, -0.5877796, 1, 1, 1, 1, 1,
-0.9974396, 0.8037665, -1.680584, 1, 1, 1, 1, 1,
-0.9955837, -0.2633558, -2.284526, 1, 1, 1, 1, 1,
-0.9864109, -0.536699, -1.078639, 0, 0, 1, 1, 1,
-0.9786451, -0.9358988, -1.87275, 1, 0, 0, 1, 1,
-0.9781583, 0.4555098, -1.337596, 1, 0, 0, 1, 1,
-0.9750478, -0.9228556, -2.5802, 1, 0, 0, 1, 1,
-0.9715431, -0.8810228, -2.506145, 1, 0, 0, 1, 1,
-0.9692093, 0.2025597, -1.241294, 1, 0, 0, 1, 1,
-0.9659491, 0.682431, -0.2664984, 0, 0, 0, 1, 1,
-0.9560539, 1.482773, 0.4022326, 0, 0, 0, 1, 1,
-0.9535915, -1.008316, -2.333852, 0, 0, 0, 1, 1,
-0.9531814, 1.044687, 0.1096656, 0, 0, 0, 1, 1,
-0.951831, -0.8986878, -2.405107, 0, 0, 0, 1, 1,
-0.9450596, 1.118185, -0.5921394, 0, 0, 0, 1, 1,
-0.9447269, -0.05424817, -2.744101, 0, 0, 0, 1, 1,
-0.9400766, -0.3877698, -1.683536, 1, 1, 1, 1, 1,
-0.9359683, -0.6586806, -0.845961, 1, 1, 1, 1, 1,
-0.9289737, 0.763604, -1.099702, 1, 1, 1, 1, 1,
-0.9243606, 2.015837, -2.054111, 1, 1, 1, 1, 1,
-0.9155926, 1.976804, -1.642452, 1, 1, 1, 1, 1,
-0.9127989, 0.4863067, -1.584776, 1, 1, 1, 1, 1,
-0.905756, 1.129747, -0.7482929, 1, 1, 1, 1, 1,
-0.904569, 0.7647159, -0.4867479, 1, 1, 1, 1, 1,
-0.9017469, 0.5945413, -1.552187, 1, 1, 1, 1, 1,
-0.8988553, 0.1600186, -0.01135319, 1, 1, 1, 1, 1,
-0.8988236, -1.037953, -0.5010835, 1, 1, 1, 1, 1,
-0.8959244, -0.1486911, -1.974254, 1, 1, 1, 1, 1,
-0.8934006, 0.4745486, -2.542737, 1, 1, 1, 1, 1,
-0.8925552, -1.34142, -2.371263, 1, 1, 1, 1, 1,
-0.89244, 0.4908123, -0.884936, 1, 1, 1, 1, 1,
-0.8884815, 0.0932421, -0.5724497, 0, 0, 1, 1, 1,
-0.8883467, 2.082529, -0.7127873, 1, 0, 0, 1, 1,
-0.8874206, 2.289759, -1.351361, 1, 0, 0, 1, 1,
-0.8873481, -0.2696535, -2.5449, 1, 0, 0, 1, 1,
-0.8831844, 1.274056, -0.3302516, 1, 0, 0, 1, 1,
-0.8827558, 1.112208, -1.465466, 1, 0, 0, 1, 1,
-0.8799816, -0.1206062, -0.223084, 0, 0, 0, 1, 1,
-0.8790839, -0.9132335, -3.838446, 0, 0, 0, 1, 1,
-0.8774914, -0.2363855, -0.4564785, 0, 0, 0, 1, 1,
-0.8762403, -0.8218871, 0.8055168, 0, 0, 0, 1, 1,
-0.8682761, 0.1993883, -0.5491037, 0, 0, 0, 1, 1,
-0.8614078, -1.89267, -4.981594, 0, 0, 0, 1, 1,
-0.8607003, -0.536373, -1.772974, 0, 0, 0, 1, 1,
-0.8586006, 0.05759892, -1.541798, 1, 1, 1, 1, 1,
-0.8581789, -1.473616, -1.332018, 1, 1, 1, 1, 1,
-0.8546128, 0.678102, -1.227039, 1, 1, 1, 1, 1,
-0.8535663, -0.5882187, -1.641076, 1, 1, 1, 1, 1,
-0.8517423, -0.4238521, -3.82846, 1, 1, 1, 1, 1,
-0.8508354, 0.6559247, -2.248458, 1, 1, 1, 1, 1,
-0.8363007, 0.9254042, -0.6808985, 1, 1, 1, 1, 1,
-0.8346723, -0.3559056, -1.83231, 1, 1, 1, 1, 1,
-0.8331419, -0.5786462, -3.892154, 1, 1, 1, 1, 1,
-0.8321507, -1.304532, -3.823497, 1, 1, 1, 1, 1,
-0.8302474, -0.2154572, -2.256095, 1, 1, 1, 1, 1,
-0.8293977, -0.8811585, -3.177482, 1, 1, 1, 1, 1,
-0.8277926, 0.7913905, -1.704319, 1, 1, 1, 1, 1,
-0.8256468, 0.2048528, -3.308829, 1, 1, 1, 1, 1,
-0.8252168, 0.3883081, -0.8356631, 1, 1, 1, 1, 1,
-0.8241577, -0.1886815, -2.870843, 0, 0, 1, 1, 1,
-0.8165293, -1.850779, -2.476656, 1, 0, 0, 1, 1,
-0.8133084, -1.37088, -3.337406, 1, 0, 0, 1, 1,
-0.8112636, 1.486645, -1.109604, 1, 0, 0, 1, 1,
-0.8083797, -1.020326, -2.418308, 1, 0, 0, 1, 1,
-0.8013238, -0.5872613, -2.587965, 1, 0, 0, 1, 1,
-0.7896258, -0.1282769, -2.936295, 0, 0, 0, 1, 1,
-0.7870167, -0.8670089, -2.543078, 0, 0, 0, 1, 1,
-0.7822717, 1.2096, -1.131635, 0, 0, 0, 1, 1,
-0.7791225, 0.4910836, -1.216644, 0, 0, 0, 1, 1,
-0.7722493, -0.2425899, -1.988179, 0, 0, 0, 1, 1,
-0.7654496, 0.4299934, -2.127616, 0, 0, 0, 1, 1,
-0.763643, 0.6844609, -2.00137, 0, 0, 0, 1, 1,
-0.7636244, 0.06798, -0.4332192, 1, 1, 1, 1, 1,
-0.7626292, -0.5474201, -3.480112, 1, 1, 1, 1, 1,
-0.7492892, 0.08392102, -2.411443, 1, 1, 1, 1, 1,
-0.7481562, 1.996137, 0.2505783, 1, 1, 1, 1, 1,
-0.7436786, 0.7563483, -0.6860101, 1, 1, 1, 1, 1,
-0.7371822, -1.218618, -2.626575, 1, 1, 1, 1, 1,
-0.7248251, 1.99134, -1.729119, 1, 1, 1, 1, 1,
-0.7152547, 1.311201, -0.1204543, 1, 1, 1, 1, 1,
-0.7131314, 2.232266, -0.4295633, 1, 1, 1, 1, 1,
-0.7124603, -1.518072, -0.8289101, 1, 1, 1, 1, 1,
-0.7100909, 0.3556788, -0.2943825, 1, 1, 1, 1, 1,
-0.7095341, -0.2054893, -2.773277, 1, 1, 1, 1, 1,
-0.707216, 1.601862, 0.2176409, 1, 1, 1, 1, 1,
-0.6914623, -0.2043488, -2.32308, 1, 1, 1, 1, 1,
-0.6904863, 0.3969899, -0.4460309, 1, 1, 1, 1, 1,
-0.6894177, -1.062526, -3.905136, 0, 0, 1, 1, 1,
-0.6888119, 1.814424, -1.733467, 1, 0, 0, 1, 1,
-0.6803298, -0.6261306, -1.81184, 1, 0, 0, 1, 1,
-0.6751115, -1.062001, 0.09393346, 1, 0, 0, 1, 1,
-0.6739879, 0.1713858, -0.1090783, 1, 0, 0, 1, 1,
-0.6703857, 0.8846533, -0.2185149, 1, 0, 0, 1, 1,
-0.6700514, -0.3564419, -0.3159799, 0, 0, 0, 1, 1,
-0.6690507, 0.3450691, -0.850141, 0, 0, 0, 1, 1,
-0.6661465, -0.2356931, -0.6533684, 0, 0, 0, 1, 1,
-0.6661199, 0.8809987, -1.277437, 0, 0, 0, 1, 1,
-0.6613165, -1.983848, -4.008017, 0, 0, 0, 1, 1,
-0.6599476, 0.6980108, 0.548507, 0, 0, 0, 1, 1,
-0.6592242, -0.8544587, -2.020954, 0, 0, 0, 1, 1,
-0.6530135, -0.8655963, -3.207767, 1, 1, 1, 1, 1,
-0.6521131, -0.3308437, -3.198758, 1, 1, 1, 1, 1,
-0.6480462, -1.245824, -4.314353, 1, 1, 1, 1, 1,
-0.6462546, 0.6141083, -1.442081, 1, 1, 1, 1, 1,
-0.64411, 1.052753, -1.171858, 1, 1, 1, 1, 1,
-0.6411165, 3.406502, 0.6955087, 1, 1, 1, 1, 1,
-0.6403059, -1.725401, -2.159768, 1, 1, 1, 1, 1,
-0.6354798, 1.146023, -0.4518688, 1, 1, 1, 1, 1,
-0.6326987, 2.508981, -2.475731, 1, 1, 1, 1, 1,
-0.6315929, 1.273196, -1.336421, 1, 1, 1, 1, 1,
-0.6314458, 1.013418, 0.2631165, 1, 1, 1, 1, 1,
-0.6276577, -0.6922505, -1.626303, 1, 1, 1, 1, 1,
-0.6236945, -0.04792483, -2.618834, 1, 1, 1, 1, 1,
-0.6223305, -1.171127, -2.288732, 1, 1, 1, 1, 1,
-0.6190146, 1.111521, -0.8493816, 1, 1, 1, 1, 1,
-0.617053, -0.8865675, -2.194903, 0, 0, 1, 1, 1,
-0.6170427, 0.4655647, -1.086546, 1, 0, 0, 1, 1,
-0.6088246, -0.7083424, -2.172192, 1, 0, 0, 1, 1,
-0.6070142, 1.781854, -0.7818428, 1, 0, 0, 1, 1,
-0.6054627, -1.168208, -2.93154, 1, 0, 0, 1, 1,
-0.6025835, -2.152486, -2.978743, 1, 0, 0, 1, 1,
-0.6017584, -1.075442, -3.915757, 0, 0, 0, 1, 1,
-0.595306, -0.8164033, -2.177608, 0, 0, 0, 1, 1,
-0.5856681, -0.0002253793, -2.199702, 0, 0, 0, 1, 1,
-0.5853359, 0.2516951, -0.0757722, 0, 0, 0, 1, 1,
-0.5813711, -0.5813352, -2.19169, 0, 0, 0, 1, 1,
-0.5768111, 0.3518578, -0.7754852, 0, 0, 0, 1, 1,
-0.5728338, 0.7254537, -0.4998564, 0, 0, 0, 1, 1,
-0.5714133, 0.006058843, -2.23256, 1, 1, 1, 1, 1,
-0.5692264, -0.5734378, -3.202158, 1, 1, 1, 1, 1,
-0.5677063, -0.4103437, 0.4494202, 1, 1, 1, 1, 1,
-0.5668177, -1.39883, -3.286533, 1, 1, 1, 1, 1,
-0.5638056, -0.9498379, -3.774559, 1, 1, 1, 1, 1,
-0.5588765, -0.2283647, -0.6093567, 1, 1, 1, 1, 1,
-0.5508816, -0.5502738, -1.096749, 1, 1, 1, 1, 1,
-0.5487412, -0.9581838, -4.013773, 1, 1, 1, 1, 1,
-0.5357268, 1.212764, -0.7901191, 1, 1, 1, 1, 1,
-0.5347027, -1.262924, -1.934982, 1, 1, 1, 1, 1,
-0.5330027, -0.7524617, -0.9102262, 1, 1, 1, 1, 1,
-0.5277342, 0.4633592, 1.112233, 1, 1, 1, 1, 1,
-0.5231516, 0.4646299, -0.8723391, 1, 1, 1, 1, 1,
-0.5207126, 0.8024126, 1.50348, 1, 1, 1, 1, 1,
-0.5189546, -0.6319002, -1.469222, 1, 1, 1, 1, 1,
-0.5154595, 0.3799337, 0.8029121, 0, 0, 1, 1, 1,
-0.5113366, -0.06946662, -0.2519202, 1, 0, 0, 1, 1,
-0.508804, 0.2991414, -1.443068, 1, 0, 0, 1, 1,
-0.4951609, -1.132521, -2.100247, 1, 0, 0, 1, 1,
-0.4912556, 0.773479, 0.0123022, 1, 0, 0, 1, 1,
-0.489843, -0.7127032, -1.466349, 1, 0, 0, 1, 1,
-0.4878801, -0.4479386, -3.685852, 0, 0, 0, 1, 1,
-0.4821955, -0.4796454, -2.713089, 0, 0, 0, 1, 1,
-0.4789955, 1.608806, 0.4687901, 0, 0, 0, 1, 1,
-0.4713056, 0.607001, -1.118844, 0, 0, 0, 1, 1,
-0.4709319, 0.8544969, -0.6517993, 0, 0, 0, 1, 1,
-0.4671785, 0.9416987, -0.82707, 0, 0, 0, 1, 1,
-0.465147, 1.405482, -1.197587, 0, 0, 0, 1, 1,
-0.4566891, -0.2049428, -3.998559, 1, 1, 1, 1, 1,
-0.4458168, -0.1988451, -1.841937, 1, 1, 1, 1, 1,
-0.4369471, -0.06942145, -1.288881, 1, 1, 1, 1, 1,
-0.4328831, 0.6326914, -2.245594, 1, 1, 1, 1, 1,
-0.4322372, 0.3478228, -0.762614, 1, 1, 1, 1, 1,
-0.4275084, -1.380489, -3.427869, 1, 1, 1, 1, 1,
-0.4258783, -1.547052, -2.501701, 1, 1, 1, 1, 1,
-0.422133, 0.7790126, -1.5, 1, 1, 1, 1, 1,
-0.4202274, 0.1318397, -2.811194, 1, 1, 1, 1, 1,
-0.4185109, 0.7149276, -0.9973076, 1, 1, 1, 1, 1,
-0.4145537, -1.201284, -3.415233, 1, 1, 1, 1, 1,
-0.4145381, 0.788053, -0.226334, 1, 1, 1, 1, 1,
-0.4109071, -0.3655989, -3.533671, 1, 1, 1, 1, 1,
-0.408539, 0.04036621, -1.639195, 1, 1, 1, 1, 1,
-0.4076059, -0.284648, -4.200095, 1, 1, 1, 1, 1,
-0.4061559, -0.0921174, -0.4337675, 0, 0, 1, 1, 1,
-0.4032351, -1.244864, -1.789536, 1, 0, 0, 1, 1,
-0.3931968, -1.143639, -2.926302, 1, 0, 0, 1, 1,
-0.3878738, 0.2332076, -1.544451, 1, 0, 0, 1, 1,
-0.3783286, 0.344128, -1.787167, 1, 0, 0, 1, 1,
-0.376318, -1.330191, -0.285355, 1, 0, 0, 1, 1,
-0.3711407, 0.5060204, 0.9921482, 0, 0, 0, 1, 1,
-0.3711195, -0.5440297, -3.272293, 0, 0, 0, 1, 1,
-0.3710712, -0.3266398, -3.402071, 0, 0, 0, 1, 1,
-0.3576989, -0.7567111, -3.537594, 0, 0, 0, 1, 1,
-0.3575519, -0.7844703, -1.899844, 0, 0, 0, 1, 1,
-0.354553, -1.319373, -3.061475, 0, 0, 0, 1, 1,
-0.3525396, 0.9081439, -1.487504, 0, 0, 0, 1, 1,
-0.3470006, 0.1880737, -0.9389966, 1, 1, 1, 1, 1,
-0.3389915, -0.08738913, -1.514456, 1, 1, 1, 1, 1,
-0.3340022, 1.068413, -1.702615, 1, 1, 1, 1, 1,
-0.3305299, -0.7336754, -4.088102, 1, 1, 1, 1, 1,
-0.3301648, -0.2140148, -3.987287, 1, 1, 1, 1, 1,
-0.3265796, 0.2103805, -2.158115, 1, 1, 1, 1, 1,
-0.3254069, 1.449126, -0.8833826, 1, 1, 1, 1, 1,
-0.3218536, -0.0960019, -2.020963, 1, 1, 1, 1, 1,
-0.3196343, -0.3877067, -2.501988, 1, 1, 1, 1, 1,
-0.3169516, -1.534595, -2.235997, 1, 1, 1, 1, 1,
-0.3101643, 0.06921925, -1.722965, 1, 1, 1, 1, 1,
-0.3095723, 0.8722212, -0.3037051, 1, 1, 1, 1, 1,
-0.3064321, 0.1468097, -0.5116157, 1, 1, 1, 1, 1,
-0.3061857, -0.1917466, -3.508781, 1, 1, 1, 1, 1,
-0.3011394, -1.51973, -2.481087, 1, 1, 1, 1, 1,
-0.2998847, 0.9004367, -2.442933, 0, 0, 1, 1, 1,
-0.2959208, -0.6309055, -3.221877, 1, 0, 0, 1, 1,
-0.2955399, -0.3445295, -1.832106, 1, 0, 0, 1, 1,
-0.2941919, 0.8685234, 0.3752814, 1, 0, 0, 1, 1,
-0.292991, 3.724802, -0.1991332, 1, 0, 0, 1, 1,
-0.2892693, 1.666087, -0.9903482, 1, 0, 0, 1, 1,
-0.2848809, 0.5236419, -2.24479, 0, 0, 0, 1, 1,
-0.2829518, 1.311984, -0.8145967, 0, 0, 0, 1, 1,
-0.2791579, -0.4921272, -1.793126, 0, 0, 0, 1, 1,
-0.2791514, 1.010258, -1.531069, 0, 0, 0, 1, 1,
-0.2774394, 0.3543518, 0.2191779, 0, 0, 0, 1, 1,
-0.2728434, -0.8653376, -1.129259, 0, 0, 0, 1, 1,
-0.2690375, -0.191828, -1.003106, 0, 0, 0, 1, 1,
-0.2688298, -2.310285, -2.984195, 1, 1, 1, 1, 1,
-0.2643417, -0.2380048, -3.689167, 1, 1, 1, 1, 1,
-0.2613089, -0.003881789, -0.4526384, 1, 1, 1, 1, 1,
-0.2607789, 1.022833, -0.7335889, 1, 1, 1, 1, 1,
-0.2597928, -0.05788486, -1.754068, 1, 1, 1, 1, 1,
-0.2569551, -0.757074, -3.992772, 1, 1, 1, 1, 1,
-0.2559392, 1.386672, 1.220967, 1, 1, 1, 1, 1,
-0.2499853, 1.559641, -0.2479711, 1, 1, 1, 1, 1,
-0.2415997, 1.020203, 0.01413376, 1, 1, 1, 1, 1,
-0.2409574, -0.6774554, -2.071928, 1, 1, 1, 1, 1,
-0.2389049, 0.6106377, 0.7820477, 1, 1, 1, 1, 1,
-0.2362022, 0.9241085, -1.010027, 1, 1, 1, 1, 1,
-0.2331983, -0.6314582, -2.734077, 1, 1, 1, 1, 1,
-0.23162, -1.15119, -2.126288, 1, 1, 1, 1, 1,
-0.2294597, 0.7303512, -1.483806, 1, 1, 1, 1, 1,
-0.2259305, -0.4766456, -3.01823, 0, 0, 1, 1, 1,
-0.2230897, 1.661099, -0.2656831, 1, 0, 0, 1, 1,
-0.2217291, 0.03468685, -0.1802317, 1, 0, 0, 1, 1,
-0.2214021, 0.6370351, 2.01118, 1, 0, 0, 1, 1,
-0.2205865, 1.091149, -1.614898, 1, 0, 0, 1, 1,
-0.2156154, -0.5083209, -2.200603, 1, 0, 0, 1, 1,
-0.2143473, -1.092598, -3.830992, 0, 0, 0, 1, 1,
-0.2092371, -0.4008653, -2.522086, 0, 0, 0, 1, 1,
-0.2075461, 0.6213762, -0.1180161, 0, 0, 0, 1, 1,
-0.2036102, -1.855614, -2.173698, 0, 0, 0, 1, 1,
-0.2025522, -1.362679, -2.291758, 0, 0, 0, 1, 1,
-0.2001297, 0.8392518, 0.5992718, 0, 0, 0, 1, 1,
-0.1961347, 0.3119094, -0.3365375, 0, 0, 0, 1, 1,
-0.1937884, -0.5665142, -3.562465, 1, 1, 1, 1, 1,
-0.1920885, -0.5774466, -1.792829, 1, 1, 1, 1, 1,
-0.1908584, -0.1122961, -3.483184, 1, 1, 1, 1, 1,
-0.1879217, -0.02138188, -1.423281, 1, 1, 1, 1, 1,
-0.1870448, 0.5100782, -0.04396172, 1, 1, 1, 1, 1,
-0.1837125, -0.9679196, -3.635823, 1, 1, 1, 1, 1,
-0.180116, 0.2627044, -1.779556, 1, 1, 1, 1, 1,
-0.1799672, 0.6842445, 0.6038249, 1, 1, 1, 1, 1,
-0.1760769, 0.8499922, -1.611148, 1, 1, 1, 1, 1,
-0.173959, -0.580404, -4.426124, 1, 1, 1, 1, 1,
-0.1708363, -0.4363905, -3.009956, 1, 1, 1, 1, 1,
-0.1666516, -0.7222697, -2.160411, 1, 1, 1, 1, 1,
-0.1656725, -0.01855401, -2.380038, 1, 1, 1, 1, 1,
-0.1631685, -1.482221, -4.682819, 1, 1, 1, 1, 1,
-0.1622716, 1.129328, -0.3218848, 1, 1, 1, 1, 1,
-0.153609, 0.3538566, -0.5080061, 0, 0, 1, 1, 1,
-0.1530291, 0.9948877, 0.0006721757, 1, 0, 0, 1, 1,
-0.1486488, -0.3032646, -1.591923, 1, 0, 0, 1, 1,
-0.1476697, -0.4466378, -2.371895, 1, 0, 0, 1, 1,
-0.1441037, -0.7209848, -4.061743, 1, 0, 0, 1, 1,
-0.1407233, 0.1031728, 0.1166141, 1, 0, 0, 1, 1,
-0.1377356, 0.6654342, 0.4799382, 0, 0, 0, 1, 1,
-0.1356644, -1.297381, -1.795358, 0, 0, 0, 1, 1,
-0.1344777, -1.662738, -5.14872, 0, 0, 0, 1, 1,
-0.133856, -0.7191824, -3.396836, 0, 0, 0, 1, 1,
-0.1334435, 1.052235, 1.156499, 0, 0, 0, 1, 1,
-0.127092, 0.8051161, 0.280533, 0, 0, 0, 1, 1,
-0.1270369, 0.8877848, 1.630682, 0, 0, 0, 1, 1,
-0.126778, -1.707859, -4.147029, 1, 1, 1, 1, 1,
-0.1238423, -0.788424, -3.072649, 1, 1, 1, 1, 1,
-0.1215887, -0.7580891, -3.213843, 1, 1, 1, 1, 1,
-0.1204983, 0.008233044, -1.35562, 1, 1, 1, 1, 1,
-0.1179272, -0.8612536, -2.869261, 1, 1, 1, 1, 1,
-0.112721, 0.323097, 0.2963975, 1, 1, 1, 1, 1,
-0.112018, 1.771377, -0.2162818, 1, 1, 1, 1, 1,
-0.1077937, 0.7046176, -0.158523, 1, 1, 1, 1, 1,
-0.1075254, -0.3016927, -2.772143, 1, 1, 1, 1, 1,
-0.1068297, -0.88303, -3.868557, 1, 1, 1, 1, 1,
-0.1061723, 0.6812039, -0.2016686, 1, 1, 1, 1, 1,
-0.0976511, 0.8089834, -1.797522, 1, 1, 1, 1, 1,
-0.0935851, -0.5386242, -2.960125, 1, 1, 1, 1, 1,
-0.08775029, -0.7889991, -2.849868, 1, 1, 1, 1, 1,
-0.08052957, -0.1963493, -1.754351, 1, 1, 1, 1, 1,
-0.07940502, 0.6078339, -0.3677201, 0, 0, 1, 1, 1,
-0.07836691, 0.04120859, -0.410252, 1, 0, 0, 1, 1,
-0.07775216, -0.1304377, -4.526478, 1, 0, 0, 1, 1,
-0.07672131, -0.5495505, -3.956227, 1, 0, 0, 1, 1,
-0.07450069, 1.127336, -0.5787957, 1, 0, 0, 1, 1,
-0.07087658, 1.152583, -1.100208, 1, 0, 0, 1, 1,
-0.06980627, -0.1615945, -2.687481, 0, 0, 0, 1, 1,
-0.06426797, 0.5853596, -0.4363393, 0, 0, 0, 1, 1,
-0.06367051, 1.257454, 0.8390703, 0, 0, 0, 1, 1,
-0.0633143, 0.7132903, -0.4617727, 0, 0, 0, 1, 1,
-0.06110305, -2.099382, -1.488967, 0, 0, 0, 1, 1,
-0.05956139, 0.6238226, -0.3238712, 0, 0, 0, 1, 1,
-0.05863679, 0.5612586, -1.616656, 0, 0, 0, 1, 1,
-0.05792856, 1.277323, -0.2092439, 1, 1, 1, 1, 1,
-0.05698825, -0.2311744, -5.004389, 1, 1, 1, 1, 1,
-0.05595569, -1.205673, -2.401167, 1, 1, 1, 1, 1,
-0.05540542, -0.06571984, -4.614846, 1, 1, 1, 1, 1,
-0.0527962, -0.6086563, -2.490366, 1, 1, 1, 1, 1,
-0.05073499, 0.6995138, 1.018357, 1, 1, 1, 1, 1,
-0.0450739, 0.06721189, -3.26813, 1, 1, 1, 1, 1,
-0.04323441, 1.668532, 2.121042, 1, 1, 1, 1, 1,
-0.042893, -0.1306021, -3.822278, 1, 1, 1, 1, 1,
-0.04119003, -0.7219471, -3.411076, 1, 1, 1, 1, 1,
-0.03910054, 0.7934151, 0.4094605, 1, 1, 1, 1, 1,
-0.03416558, -1.057953, -4.84532, 1, 1, 1, 1, 1,
-0.03070692, 0.6613463, -0.02889021, 1, 1, 1, 1, 1,
-0.02832329, 0.9319757, 0.07357264, 1, 1, 1, 1, 1,
-0.02675913, -0.3785428, -1.559382, 1, 1, 1, 1, 1,
-0.02381239, -0.3937302, -2.504854, 0, 0, 1, 1, 1,
-0.0149858, 0.4650601, -1.793982, 1, 0, 0, 1, 1,
-0.009250095, -2.425534, -2.572263, 1, 0, 0, 1, 1,
-0.00829456, -0.6077279, -4.294641, 1, 0, 0, 1, 1,
-0.007744517, -0.876335, -1.557105, 1, 0, 0, 1, 1,
-0.0051808, -0.03690287, -0.9593882, 1, 0, 0, 1, 1,
0.0008403998, 1.098672, 0.1596101, 0, 0, 0, 1, 1,
0.001467764, -2.333228, 2.010033, 0, 0, 0, 1, 1,
0.004942593, 1.91765, 0.006239525, 0, 0, 0, 1, 1,
0.009043725, -0.609513, 2.429327, 0, 0, 0, 1, 1,
0.01195864, -0.656838, 4.107501, 0, 0, 0, 1, 1,
0.01432464, 1.403667, 0.4728855, 0, 0, 0, 1, 1,
0.01514924, 0.06086983, 1.152237, 0, 0, 0, 1, 1,
0.01571015, 0.6014436, -0.6688104, 1, 1, 1, 1, 1,
0.02893224, -1.697696, 3.605509, 1, 1, 1, 1, 1,
0.03029347, -0.8162923, 2.000089, 1, 1, 1, 1, 1,
0.03605954, -0.2495366, 4.760906, 1, 1, 1, 1, 1,
0.03805189, 0.3639617, 0.02607413, 1, 1, 1, 1, 1,
0.03901158, -0.3108952, 3.341526, 1, 1, 1, 1, 1,
0.04242639, -0.07140698, 2.626125, 1, 1, 1, 1, 1,
0.04482166, -0.3626887, 1.82467, 1, 1, 1, 1, 1,
0.0484094, -0.6022413, 4.193918, 1, 1, 1, 1, 1,
0.04847385, 0.7288532, -0.8880637, 1, 1, 1, 1, 1,
0.04937001, -0.4349523, 2.185002, 1, 1, 1, 1, 1,
0.05091989, -1.711001, 2.317097, 1, 1, 1, 1, 1,
0.05166228, 0.7934697, -0.685094, 1, 1, 1, 1, 1,
0.05171106, 1.639044, -0.4732314, 1, 1, 1, 1, 1,
0.05420147, 0.6672897, 1.660629, 1, 1, 1, 1, 1,
0.05632338, 0.08430391, 0.7188736, 0, 0, 1, 1, 1,
0.05718163, -0.3380441, 3.715072, 1, 0, 0, 1, 1,
0.05776424, -0.3652446, 3.513345, 1, 0, 0, 1, 1,
0.06571191, -0.4588307, 4.46353, 1, 0, 0, 1, 1,
0.06727817, 0.7678946, 0.296288, 1, 0, 0, 1, 1,
0.07333895, 1.517811, -0.8781026, 1, 0, 0, 1, 1,
0.07428162, -0.1210387, 1.38725, 0, 0, 0, 1, 1,
0.08011959, -0.1015609, 3.102139, 0, 0, 0, 1, 1,
0.08423345, -1.163414, 2.732889, 0, 0, 0, 1, 1,
0.08604384, -0.2133567, 1.474644, 0, 0, 0, 1, 1,
0.0868254, -0.5494467, 1.720096, 0, 0, 0, 1, 1,
0.09331048, -1.54685, 3.366951, 0, 0, 0, 1, 1,
0.09451336, -0.1931125, 1.986254, 0, 0, 0, 1, 1,
0.1018684, 1.56058, -0.3988737, 1, 1, 1, 1, 1,
0.1020075, 0.1609386, 0.3546181, 1, 1, 1, 1, 1,
0.108126, -0.54822, 2.54589, 1, 1, 1, 1, 1,
0.1092683, 1.679085, -0.8588602, 1, 1, 1, 1, 1,
0.11025, 0.2812285, 0.2390354, 1, 1, 1, 1, 1,
0.1107674, 0.1845147, -0.8650351, 1, 1, 1, 1, 1,
0.1118316, 0.07022867, 0.2517257, 1, 1, 1, 1, 1,
0.1154034, 0.3611529, 0.7332008, 1, 1, 1, 1, 1,
0.1181411, 0.05030861, 1.134741, 1, 1, 1, 1, 1,
0.1204272, 1.178676, 1.367028, 1, 1, 1, 1, 1,
0.1215552, 1.196568, -0.006397797, 1, 1, 1, 1, 1,
0.124435, -0.01922459, 2.605258, 1, 1, 1, 1, 1,
0.125169, 2.515087, -0.7512147, 1, 1, 1, 1, 1,
0.1255451, 0.4942587, 1.374075, 1, 1, 1, 1, 1,
0.1338172, -1.045975, 3.720643, 1, 1, 1, 1, 1,
0.1384816, -1.745173, 2.210783, 0, 0, 1, 1, 1,
0.1415966, 0.4449044, 0.008658414, 1, 0, 0, 1, 1,
0.1441102, -0.287152, 0.9575499, 1, 0, 0, 1, 1,
0.1449134, -0.02691198, 0.5184788, 1, 0, 0, 1, 1,
0.1450502, -0.8087761, 4.157895, 1, 0, 0, 1, 1,
0.1455315, 0.7904674, -1.087456, 1, 0, 0, 1, 1,
0.1462025, 0.04024208, -0.3471932, 0, 0, 0, 1, 1,
0.1476177, 0.08727513, 0.2621555, 0, 0, 0, 1, 1,
0.1483892, -1.037078, 2.586551, 0, 0, 0, 1, 1,
0.1485486, -1.780538, 3.502631, 0, 0, 0, 1, 1,
0.1504176, 0.02502341, 1.650514, 0, 0, 0, 1, 1,
0.1506255, -0.3728104, 3.468805, 0, 0, 0, 1, 1,
0.1546634, 0.1177062, 0.3371617, 0, 0, 0, 1, 1,
0.1558713, -0.901889, 3.427683, 1, 1, 1, 1, 1,
0.1609378, 0.5793042, 0.3841679, 1, 1, 1, 1, 1,
0.1626855, -1.077186, 2.213339, 1, 1, 1, 1, 1,
0.1657669, 1.841938, 0.414292, 1, 1, 1, 1, 1,
0.1703716, -1.421359, 3.186447, 1, 1, 1, 1, 1,
0.173562, 0.1182969, 1.048499, 1, 1, 1, 1, 1,
0.1735994, 0.1453292, -0.6252003, 1, 1, 1, 1, 1,
0.1819145, 0.3250463, 0.9901932, 1, 1, 1, 1, 1,
0.1822286, 0.4607654, 1.716977, 1, 1, 1, 1, 1,
0.1828298, -1.143671, 1.906982, 1, 1, 1, 1, 1,
0.1834105, -0.6538504, 3.668309, 1, 1, 1, 1, 1,
0.187851, 0.01627724, 0.2886499, 1, 1, 1, 1, 1,
0.1982088, -0.2411529, 0.9150383, 1, 1, 1, 1, 1,
0.1998843, 0.6782669, 0.8314374, 1, 1, 1, 1, 1,
0.2000346, 0.07614958, -0.04507347, 1, 1, 1, 1, 1,
0.2034319, -0.36541, 3.34588, 0, 0, 1, 1, 1,
0.2041793, -0.4544622, 1.065166, 1, 0, 0, 1, 1,
0.205396, -0.5827311, 3.547692, 1, 0, 0, 1, 1,
0.2062245, 0.6744846, 1.602439, 1, 0, 0, 1, 1,
0.2085372, -0.4104505, 2.842992, 1, 0, 0, 1, 1,
0.2125078, -0.5148014, 3.960126, 1, 0, 0, 1, 1,
0.2188266, 0.1743337, 1.244919, 0, 0, 0, 1, 1,
0.2243995, -1.150298, 1.959856, 0, 0, 0, 1, 1,
0.2287315, -0.8414344, 2.832837, 0, 0, 0, 1, 1,
0.2288268, -0.5064542, 1.40514, 0, 0, 0, 1, 1,
0.2296942, -0.06162705, 2.468285, 0, 0, 0, 1, 1,
0.2320792, -0.2222921, 2.653435, 0, 0, 0, 1, 1,
0.237071, 0.6947608, 1.706898, 0, 0, 0, 1, 1,
0.244029, 0.6318198, 0.1746266, 1, 1, 1, 1, 1,
0.2459994, -0.005073115, -0.3727953, 1, 1, 1, 1, 1,
0.2488147, -0.2034772, 2.496025, 1, 1, 1, 1, 1,
0.2515437, -3.196043, 3.564659, 1, 1, 1, 1, 1,
0.2520727, 1.373657, 0.08632439, 1, 1, 1, 1, 1,
0.2569399, -0.460676, 3.34397, 1, 1, 1, 1, 1,
0.259288, 0.5994298, -0.9465714, 1, 1, 1, 1, 1,
0.2613609, 1.147394, -0.3627853, 1, 1, 1, 1, 1,
0.2624522, -0.7038002, 2.340832, 1, 1, 1, 1, 1,
0.2638946, 0.1732172, 2.465295, 1, 1, 1, 1, 1,
0.2660898, -0.08068158, 1.821421, 1, 1, 1, 1, 1,
0.2671972, -0.4305117, 3.062614, 1, 1, 1, 1, 1,
0.2688183, 0.3184798, -2.451524, 1, 1, 1, 1, 1,
0.2756252, 1.121789, 1.130864, 1, 1, 1, 1, 1,
0.276729, -0.187491, 0.07303659, 1, 1, 1, 1, 1,
0.276879, -1.052873, 3.057982, 0, 0, 1, 1, 1,
0.28323, -0.4929445, 4.306707, 1, 0, 0, 1, 1,
0.2854596, -0.4385329, 1.533243, 1, 0, 0, 1, 1,
0.287231, 0.5396837, -0.2659938, 1, 0, 0, 1, 1,
0.2897051, 1.832782, 1.554372, 1, 0, 0, 1, 1,
0.2992413, -1.027086, 5.296272, 1, 0, 0, 1, 1,
0.2993247, -0.7228637, 3.827857, 0, 0, 0, 1, 1,
0.3031426, -2.392604, 3.113328, 0, 0, 0, 1, 1,
0.3045865, -1.789182, 4.341302, 0, 0, 0, 1, 1,
0.3069104, 2.083796, -0.8575827, 0, 0, 0, 1, 1,
0.3071327, 0.6111674, 0.3147017, 0, 0, 0, 1, 1,
0.3096761, 0.001502287, 2.378826, 0, 0, 0, 1, 1,
0.313795, -0.7362422, 2.154558, 0, 0, 0, 1, 1,
0.3151896, 1.358719, -0.1354546, 1, 1, 1, 1, 1,
0.3172019, -2.058472, 1.667769, 1, 1, 1, 1, 1,
0.3200936, 0.7105033, -0.7535806, 1, 1, 1, 1, 1,
0.321606, -0.06218912, 1.926928, 1, 1, 1, 1, 1,
0.324315, -0.9601951, 1.709554, 1, 1, 1, 1, 1,
0.3264465, 0.6232034, 3.393068, 1, 1, 1, 1, 1,
0.3283701, 0.07584742, 1.026105, 1, 1, 1, 1, 1,
0.3308863, -1.513468, 3.839009, 1, 1, 1, 1, 1,
0.3319526, -1.1003, 3.120034, 1, 1, 1, 1, 1,
0.3450874, 0.7580254, 1.343213, 1, 1, 1, 1, 1,
0.3482657, -2.186709, 2.474044, 1, 1, 1, 1, 1,
0.3485062, 2.228727, 1.87099, 1, 1, 1, 1, 1,
0.352869, 0.3920123, 0.204274, 1, 1, 1, 1, 1,
0.3547745, -0.9299065, 4.313804, 1, 1, 1, 1, 1,
0.3552738, 0.7189566, -0.1333236, 1, 1, 1, 1, 1,
0.3579752, -0.3255759, 1.8944, 0, 0, 1, 1, 1,
0.3590586, -1.342814, 2.345823, 1, 0, 0, 1, 1,
0.3634751, 0.777841, 1.401146, 1, 0, 0, 1, 1,
0.3651473, 0.2823591, 1.177333, 1, 0, 0, 1, 1,
0.3675153, 1.743159, 0.07744073, 1, 0, 0, 1, 1,
0.3736063, -0.3040386, 2.629967, 1, 0, 0, 1, 1,
0.3745536, -0.2380409, 1.008821, 0, 0, 0, 1, 1,
0.374993, -1.280163, 2.442464, 0, 0, 0, 1, 1,
0.3766471, -0.2580943, 2.367998, 0, 0, 0, 1, 1,
0.3774054, -1.609046, 2.598023, 0, 0, 0, 1, 1,
0.3774336, 0.8501171, 1.633102, 0, 0, 0, 1, 1,
0.3806297, -1.232587, 1.652139, 0, 0, 0, 1, 1,
0.383216, 0.4014201, -0.1551298, 0, 0, 0, 1, 1,
0.385172, -1.24016, 1.501588, 1, 1, 1, 1, 1,
0.3866956, 0.7788928, 0.8842134, 1, 1, 1, 1, 1,
0.3867345, -1.333857, 3.390718, 1, 1, 1, 1, 1,
0.3874097, 0.01926798, 2.493118, 1, 1, 1, 1, 1,
0.3884939, -0.4420757, 2.64078, 1, 1, 1, 1, 1,
0.390239, 0.887738, -1.143506, 1, 1, 1, 1, 1,
0.3908227, -0.09564033, 0.9481288, 1, 1, 1, 1, 1,
0.3922732, -2.407619, 2.600728, 1, 1, 1, 1, 1,
0.3935193, -1.094079, 2.857584, 1, 1, 1, 1, 1,
0.3953011, -0.3083622, 2.373921, 1, 1, 1, 1, 1,
0.3999629, 0.6704432, -1.17388, 1, 1, 1, 1, 1,
0.4004159, -1.109576, 1.55901, 1, 1, 1, 1, 1,
0.4037937, -0.4962184, 1.427515, 1, 1, 1, 1, 1,
0.4067129, 0.4887555, -0.6932148, 1, 1, 1, 1, 1,
0.4145589, 0.9828882, -1.735738, 1, 1, 1, 1, 1,
0.4148031, 2.420509, -0.5958031, 0, 0, 1, 1, 1,
0.4164511, 0.8747766, -0.6784028, 1, 0, 0, 1, 1,
0.4225549, 2.020863, -0.7728336, 1, 0, 0, 1, 1,
0.4245376, 0.2691778, 2.468327, 1, 0, 0, 1, 1,
0.4253806, 0.1598471, 2.176909, 1, 0, 0, 1, 1,
0.4260523, -1.997002, 3.085186, 1, 0, 0, 1, 1,
0.4285128, 1.609976, -1.559795, 0, 0, 0, 1, 1,
0.436317, -0.1409971, 1.737418, 0, 0, 0, 1, 1,
0.4393241, -1.018351, 2.263228, 0, 0, 0, 1, 1,
0.4449802, 0.6317273, 0.2310387, 0, 0, 0, 1, 1,
0.4462745, -0.7378928, 1.562925, 0, 0, 0, 1, 1,
0.4500557, -1.760284, 3.13211, 0, 0, 0, 1, 1,
0.4617791, -1.406567, 2.133959, 0, 0, 0, 1, 1,
0.4625072, 0.6676715, 1.50509, 1, 1, 1, 1, 1,
0.4635834, -0.6478533, 2.442657, 1, 1, 1, 1, 1,
0.4651791, 0.3230681, 0.5380853, 1, 1, 1, 1, 1,
0.4661406, -0.1688287, 1.303465, 1, 1, 1, 1, 1,
0.4696397, -0.3495244, 1.085621, 1, 1, 1, 1, 1,
0.4696772, -0.5967056, 3.70108, 1, 1, 1, 1, 1,
0.4697355, 0.6104641, -0.6445442, 1, 1, 1, 1, 1,
0.4705357, -0.1187031, 1.584377, 1, 1, 1, 1, 1,
0.4749304, 0.8684266, -0.2473921, 1, 1, 1, 1, 1,
0.4762536, 0.3030457, 0.8320862, 1, 1, 1, 1, 1,
0.4771319, 0.8082754, 0.6684272, 1, 1, 1, 1, 1,
0.4825236, 0.2721961, 1.664041, 1, 1, 1, 1, 1,
0.4905407, -0.2165875, 2.609811, 1, 1, 1, 1, 1,
0.4907854, 0.07087337, 0.828627, 1, 1, 1, 1, 1,
0.4916617, -0.6683586, 3.060776, 1, 1, 1, 1, 1,
0.4934151, -0.4858056, 2.330961, 0, 0, 1, 1, 1,
0.5083034, -1.288676, 4.935629, 1, 0, 0, 1, 1,
0.5085758, -0.1755327, 1.66477, 1, 0, 0, 1, 1,
0.5090048, -0.326943, 4.456123, 1, 0, 0, 1, 1,
0.5136665, -0.100595, -0.1845845, 1, 0, 0, 1, 1,
0.5151085, -0.3025115, 2.187239, 1, 0, 0, 1, 1,
0.5166566, -0.1417642, 0.7612047, 0, 0, 0, 1, 1,
0.5215517, 0.9522898, 1.145111, 0, 0, 0, 1, 1,
0.5275058, 0.4492563, -0.7614073, 0, 0, 0, 1, 1,
0.5304071, -0.5443069, 1.226474, 0, 0, 0, 1, 1,
0.5321733, 0.556626, 1.760527, 0, 0, 0, 1, 1,
0.5338801, -0.8388911, 3.552418, 0, 0, 0, 1, 1,
0.5339248, 1.129529, -0.598177, 0, 0, 0, 1, 1,
0.5565857, -1.656336, 4.424908, 1, 1, 1, 1, 1,
0.5587421, 0.9327082, 1.244504, 1, 1, 1, 1, 1,
0.5597203, 0.9288163, 0.152402, 1, 1, 1, 1, 1,
0.5735503, 0.951386, 1.346794, 1, 1, 1, 1, 1,
0.5754793, -0.9125291, 2.127185, 1, 1, 1, 1, 1,
0.5776857, 0.3948425, -0.0543741, 1, 1, 1, 1, 1,
0.5793732, -0.2198617, 2.727272, 1, 1, 1, 1, 1,
0.5829732, 0.3234713, -0.9319432, 1, 1, 1, 1, 1,
0.5844398, 0.1309287, 0.8752215, 1, 1, 1, 1, 1,
0.5869823, 2.149385, 0.7696356, 1, 1, 1, 1, 1,
0.5958704, -0.9094622, 2.742403, 1, 1, 1, 1, 1,
0.5978945, 1.561391, 0.1562411, 1, 1, 1, 1, 1,
0.5990753, -0.6806942, 0.01091342, 1, 1, 1, 1, 1,
0.6019819, -0.1585951, 1.106631, 1, 1, 1, 1, 1,
0.6020581, -0.6740862, 3.141577, 1, 1, 1, 1, 1,
0.6023219, -0.3044462, 2.975545, 0, 0, 1, 1, 1,
0.6088169, -0.1064375, 2.831557, 1, 0, 0, 1, 1,
0.6103749, -0.1391529, 3.224342, 1, 0, 0, 1, 1,
0.6134273, -0.8924696, 3.636145, 1, 0, 0, 1, 1,
0.6150081, -0.301942, 1.59478, 1, 0, 0, 1, 1,
0.6172009, -0.1719023, 1.151361, 1, 0, 0, 1, 1,
0.6206785, -2.059514, 3.796423, 0, 0, 0, 1, 1,
0.6227899, 1.267095, 0.2205111, 0, 0, 0, 1, 1,
0.6232104, 0.2790699, -0.411833, 0, 0, 0, 1, 1,
0.6290407, -0.6304747, 1.092215, 0, 0, 0, 1, 1,
0.6292823, 0.3231982, 0.3231856, 0, 0, 0, 1, 1,
0.6308091, 0.1379757, 1.021337, 0, 0, 0, 1, 1,
0.63146, -2.963475, 2.014529, 0, 0, 0, 1, 1,
0.6364866, 0.3601435, -0.1830181, 1, 1, 1, 1, 1,
0.641413, -1.807945, 1.238897, 1, 1, 1, 1, 1,
0.6437986, 1.297598, -0.1580993, 1, 1, 1, 1, 1,
0.6464775, -0.5158142, 1.208708, 1, 1, 1, 1, 1,
0.6477899, 0.3823739, 0.5471261, 1, 1, 1, 1, 1,
0.6533288, 0.07311741, 3.188281, 1, 1, 1, 1, 1,
0.654696, 1.760397, 1.088042, 1, 1, 1, 1, 1,
0.6583725, -0.6561489, 2.699482, 1, 1, 1, 1, 1,
0.6625535, -0.142293, 1.449536, 1, 1, 1, 1, 1,
0.6628919, 0.4807292, 2.124417, 1, 1, 1, 1, 1,
0.6634982, -1.089006, 1.475097, 1, 1, 1, 1, 1,
0.6660363, 0.4342169, 1.216882, 1, 1, 1, 1, 1,
0.6670378, 1.852438, 1.81711, 1, 1, 1, 1, 1,
0.6706068, 0.3550385, 2.10386, 1, 1, 1, 1, 1,
0.6775221, -0.1521422, 3.459179, 1, 1, 1, 1, 1,
0.6792011, 0.4666833, 2.215703, 0, 0, 1, 1, 1,
0.6827105, -0.06467529, 2.715517, 1, 0, 0, 1, 1,
0.6847716, 1.598525, 1.047869, 1, 0, 0, 1, 1,
0.6897997, 0.6034021, 3.105093, 1, 0, 0, 1, 1,
0.6901724, 0.2157753, 1.239762, 1, 0, 0, 1, 1,
0.6913482, 0.1337728, 2.379821, 1, 0, 0, 1, 1,
0.695031, -0.06125562, 1.188236, 0, 0, 0, 1, 1,
0.6985407, 0.3418993, 0.2909781, 0, 0, 0, 1, 1,
0.6985799, 0.1908303, 1.626691, 0, 0, 0, 1, 1,
0.7006617, 0.1072664, 2.381723, 0, 0, 0, 1, 1,
0.7032472, 0.9709148, 0.9801702, 0, 0, 0, 1, 1,
0.7061616, -0.7486345, 1.78555, 0, 0, 0, 1, 1,
0.7107741, -0.5720853, 3.015125, 0, 0, 0, 1, 1,
0.7110819, 1.019356, 0.5032475, 1, 1, 1, 1, 1,
0.7113761, 1.859853, 0.06450295, 1, 1, 1, 1, 1,
0.7141618, -0.2704215, 1.146334, 1, 1, 1, 1, 1,
0.7164489, -0.8868929, 2.100399, 1, 1, 1, 1, 1,
0.7166157, -0.3123857, 1.569501, 1, 1, 1, 1, 1,
0.7200596, -0.3896199, 3.761213, 1, 1, 1, 1, 1,
0.7236127, 0.1960364, 1.488989, 1, 1, 1, 1, 1,
0.731756, 0.1186314, 2.551944, 1, 1, 1, 1, 1,
0.7321216, -0.9450966, 1.540028, 1, 1, 1, 1, 1,
0.733815, -3.153965, 2.373207, 1, 1, 1, 1, 1,
0.735884, 1.001943, 0.01233833, 1, 1, 1, 1, 1,
0.7382065, 1.281137, 0.9003838, 1, 1, 1, 1, 1,
0.7413834, -1.022357, 1.254218, 1, 1, 1, 1, 1,
0.7445809, -0.4661613, 3.181319, 1, 1, 1, 1, 1,
0.746676, -0.04093504, 1.443404, 1, 1, 1, 1, 1,
0.7533201, -0.7640941, 2.57191, 0, 0, 1, 1, 1,
0.7538584, 1.489424, -0.1481291, 1, 0, 0, 1, 1,
0.7539104, -1.175114, 2.434988, 1, 0, 0, 1, 1,
0.7589422, -0.4673542, 1.319171, 1, 0, 0, 1, 1,
0.7653976, -0.5327154, 1.935787, 1, 0, 0, 1, 1,
0.7662352, -1.293664, 1.479904, 1, 0, 0, 1, 1,
0.7686469, -0.3960261, 1.664712, 0, 0, 0, 1, 1,
0.7692313, -0.2959777, 1.15524, 0, 0, 0, 1, 1,
0.7707064, 1.739452, 0.872831, 0, 0, 0, 1, 1,
0.7729048, 2.056478, 0.5289795, 0, 0, 0, 1, 1,
0.7831009, 0.2299233, 0.3667662, 0, 0, 0, 1, 1,
0.7864208, -1.412806, 3.410347, 0, 0, 0, 1, 1,
0.7870737, 0.4685379, 1.707294, 0, 0, 0, 1, 1,
0.7977433, 0.5219522, 2.786173, 1, 1, 1, 1, 1,
0.8019876, 0.3499477, 0.4855636, 1, 1, 1, 1, 1,
0.8148597, 1.34808, 0.6672801, 1, 1, 1, 1, 1,
0.8236538, 0.8882797, 1.637194, 1, 1, 1, 1, 1,
0.8237571, 1.155729, -1.062533, 1, 1, 1, 1, 1,
0.828096, -0.08950063, 1.825887, 1, 1, 1, 1, 1,
0.8293488, -0.257628, 3.110371, 1, 1, 1, 1, 1,
0.8364507, 0.2964156, 0.7213921, 1, 1, 1, 1, 1,
0.8394896, -0.693, 2.160834, 1, 1, 1, 1, 1,
0.8405517, 0.0322561, 1.455194, 1, 1, 1, 1, 1,
0.8428137, -0.6780079, 1.547493, 1, 1, 1, 1, 1,
0.8492569, 0.1443621, 0.2895739, 1, 1, 1, 1, 1,
0.8493619, 0.02318337, 0.6695979, 1, 1, 1, 1, 1,
0.8539621, 0.1338182, 2.542442, 1, 1, 1, 1, 1,
0.8544972, -0.2395705, 1.073329, 1, 1, 1, 1, 1,
0.8546687, 0.6711974, -0.6032874, 0, 0, 1, 1, 1,
0.8550779, 0.9931772, 1.663093, 1, 0, 0, 1, 1,
0.8594581, -1.140288, 0.8687945, 1, 0, 0, 1, 1,
0.8598645, -1.229041, 2.7365, 1, 0, 0, 1, 1,
0.8601419, 0.3504211, 0.7425929, 1, 0, 0, 1, 1,
0.8627577, -1.691071, 2.208658, 1, 0, 0, 1, 1,
0.8664144, -0.2969518, 3.135787, 0, 0, 0, 1, 1,
0.8675383, 0.6803352, 0.9085391, 0, 0, 0, 1, 1,
0.8728682, -0.3894585, 2.867057, 0, 0, 0, 1, 1,
0.8750802, 0.05064918, 1.149735, 0, 0, 0, 1, 1,
0.8761523, -1.772057, 2.334686, 0, 0, 0, 1, 1,
0.8789213, 0.5153435, 1.869271, 0, 0, 0, 1, 1,
0.8826218, 0.04374754, -0.8035069, 0, 0, 0, 1, 1,
0.8827968, -1.629528, 3.180941, 1, 1, 1, 1, 1,
0.8884587, -0.052202, 2.485833, 1, 1, 1, 1, 1,
0.8907698, -1.940678, 2.935239, 1, 1, 1, 1, 1,
0.8979266, 1.661872, 0.6737898, 1, 1, 1, 1, 1,
0.9068051, -1.449476, 2.948045, 1, 1, 1, 1, 1,
0.9096171, 0.1884067, 1.537454, 1, 1, 1, 1, 1,
0.9104918, -0.7867283, 2.132971, 1, 1, 1, 1, 1,
0.9116182, 0.4922344, 1.516622, 1, 1, 1, 1, 1,
0.9116318, 0.4508979, -0.0468354, 1, 1, 1, 1, 1,
0.9147583, 0.8233453, -0.3978092, 1, 1, 1, 1, 1,
0.9177362, -0.337844, 1.8389, 1, 1, 1, 1, 1,
0.9205172, 0.6150086, 0.08382646, 1, 1, 1, 1, 1,
0.9217379, -1.59857, 2.96348, 1, 1, 1, 1, 1,
0.924019, 0.8701736, -0.1319167, 1, 1, 1, 1, 1,
0.9336697, -0.2626129, 2.044851, 1, 1, 1, 1, 1,
0.9339641, -1.731877, 3.001333, 0, 0, 1, 1, 1,
0.9434906, -2.882407, 3.443676, 1, 0, 0, 1, 1,
0.9446213, 0.2591591, 0.3152232, 1, 0, 0, 1, 1,
0.9463862, -0.04644369, 0.6361137, 1, 0, 0, 1, 1,
0.9474515, -0.7226341, 2.328684, 1, 0, 0, 1, 1,
0.9490409, -1.017038, 1.29459, 1, 0, 0, 1, 1,
0.9608233, 1.041485, 1.694899, 0, 0, 0, 1, 1,
0.9749467, -0.4756079, 2.272954, 0, 0, 0, 1, 1,
0.9763069, 1.18465, 0.6067059, 0, 0, 0, 1, 1,
0.980075, 0.1483306, 0.450991, 0, 0, 0, 1, 1,
0.9802312, -0.6673675, 2.840204, 0, 0, 0, 1, 1,
0.9824712, 0.1567602, 0.9867791, 0, 0, 0, 1, 1,
0.9845582, -0.6586305, 3.123568, 0, 0, 0, 1, 1,
0.9849165, 1.478563, 0.6310995, 1, 1, 1, 1, 1,
0.9901614, -0.1142692, 0.9654391, 1, 1, 1, 1, 1,
0.9970697, -0.01291556, 1.653817, 1, 1, 1, 1, 1,
1.009524, 0.01181652, 0.7647345, 1, 1, 1, 1, 1,
1.011514, -0.3475306, 0.8863233, 1, 1, 1, 1, 1,
1.013552, -1.406799, 3.007742, 1, 1, 1, 1, 1,
1.014809, -1.221796, 2.992533, 1, 1, 1, 1, 1,
1.019316, -0.116994, 1.007614, 1, 1, 1, 1, 1,
1.019539, -0.2043721, 2.716317, 1, 1, 1, 1, 1,
1.020344, -1.492062, 4.308103, 1, 1, 1, 1, 1,
1.021752, -1.572796, 3.001984, 1, 1, 1, 1, 1,
1.026421, -0.5190061, 2.098848, 1, 1, 1, 1, 1,
1.02779, -0.5129868, 3.247654, 1, 1, 1, 1, 1,
1.029993, 0.384177, 1.329755, 1, 1, 1, 1, 1,
1.03014, -0.4243884, 2.205236, 1, 1, 1, 1, 1,
1.031367, -0.5749216, 1.348849, 0, 0, 1, 1, 1,
1.032923, 1.011146, 1.891549, 1, 0, 0, 1, 1,
1.034295, -0.2407082, 2.278746, 1, 0, 0, 1, 1,
1.036619, 0.9695026, 0.9116439, 1, 0, 0, 1, 1,
1.03688, 0.5286109, 2.867087, 1, 0, 0, 1, 1,
1.041099, 1.031859, 0.6144071, 1, 0, 0, 1, 1,
1.041461, -0.8697841, 1.999686, 0, 0, 0, 1, 1,
1.058244, -0.1127267, 1.217202, 0, 0, 0, 1, 1,
1.082536, -0.840537, 2.711519, 0, 0, 0, 1, 1,
1.0875, -0.2748512, 0.584001, 0, 0, 0, 1, 1,
1.091522, -0.3828185, 1.021542, 0, 0, 0, 1, 1,
1.093277, 0.5971157, 2.17178, 0, 0, 0, 1, 1,
1.094092, 1.175897, -1.52969, 0, 0, 0, 1, 1,
1.094504, -0.4747663, 1.374979, 1, 1, 1, 1, 1,
1.095893, 0.9655973, 0.01601726, 1, 1, 1, 1, 1,
1.097615, -0.4068677, 2.733694, 1, 1, 1, 1, 1,
1.109431, 0.7327064, 0.3254503, 1, 1, 1, 1, 1,
1.110153, -0.6798149, 3.105824, 1, 1, 1, 1, 1,
1.115056, -1.686092, 2.23557, 1, 1, 1, 1, 1,
1.115271, 1.695828, 1.259668, 1, 1, 1, 1, 1,
1.117753, -0.5994967, 3.320787, 1, 1, 1, 1, 1,
1.117825, 1.265081, 1.412946, 1, 1, 1, 1, 1,
1.122436, 0.06485976, 1.506451, 1, 1, 1, 1, 1,
1.141089, 0.7115754, 1.035823, 1, 1, 1, 1, 1,
1.158886, 1.015184, 1.283845, 1, 1, 1, 1, 1,
1.16661, 0.3195063, 2.155404, 1, 1, 1, 1, 1,
1.170503, -0.2505839, 1.830631, 1, 1, 1, 1, 1,
1.180291, -1.32892, 2.00645, 1, 1, 1, 1, 1,
1.180393, 1.523059, 0.7370644, 0, 0, 1, 1, 1,
1.18856, 1.040885, 1.311954, 1, 0, 0, 1, 1,
1.190179, -0.2445382, 1.928517, 1, 0, 0, 1, 1,
1.194858, -0.2862349, 1.426709, 1, 0, 0, 1, 1,
1.194941, 0.870495, 2.07251, 1, 0, 0, 1, 1,
1.208973, -0.6756203, 0.7189304, 1, 0, 0, 1, 1,
1.211403, -0.1849504, 0.7249178, 0, 0, 0, 1, 1,
1.213035, -1.503507, 1.614093, 0, 0, 0, 1, 1,
1.213504, -1.751477, 2.426421, 0, 0, 0, 1, 1,
1.216113, 0.1972875, 0.5697235, 0, 0, 0, 1, 1,
1.219785, -0.9033682, 3.647316, 0, 0, 0, 1, 1,
1.231082, -1.478801, 2.113095, 0, 0, 0, 1, 1,
1.231423, 1.75866, 0.06098958, 0, 0, 0, 1, 1,
1.236516, 1.380737, 1.95206, 1, 1, 1, 1, 1,
1.238637, -0.5352588, 1.190758, 1, 1, 1, 1, 1,
1.240467, -0.8498611, 1.778756, 1, 1, 1, 1, 1,
1.244027, 2.216038, 0.1151152, 1, 1, 1, 1, 1,
1.257921, -0.2300013, 1.782971, 1, 1, 1, 1, 1,
1.265823, 0.8026603, 2.524317, 1, 1, 1, 1, 1,
1.268592, 0.1244207, 1.777494, 1, 1, 1, 1, 1,
1.268757, 0.5114383, 0.05915243, 1, 1, 1, 1, 1,
1.2689, 0.3311118, 0.942915, 1, 1, 1, 1, 1,
1.269178, 0.6070488, 0.2145573, 1, 1, 1, 1, 1,
1.278733, -0.8099837, 2.827554, 1, 1, 1, 1, 1,
1.288778, 0.5705107, -0.6548205, 1, 1, 1, 1, 1,
1.295798, 0.7468016, 2.697529, 1, 1, 1, 1, 1,
1.302463, -0.752951, 1.526861, 1, 1, 1, 1, 1,
1.31389, 0.2186814, 0.2385669, 1, 1, 1, 1, 1,
1.318144, 0.8233479, 1.808013, 0, 0, 1, 1, 1,
1.319147, 1.542899, 0.7397663, 1, 0, 0, 1, 1,
1.332507, 0.9125739, 0.1863089, 1, 0, 0, 1, 1,
1.33254, 0.5688771, 1.610427, 1, 0, 0, 1, 1,
1.344622, -0.5960016, 4.638727, 1, 0, 0, 1, 1,
1.357022, -0.597025, 0.8801638, 1, 0, 0, 1, 1,
1.363349, -0.6586024, 3.939239, 0, 0, 0, 1, 1,
1.390849, 0.3788712, 1.166639, 0, 0, 0, 1, 1,
1.411476, 0.4313059, 2.565785, 0, 0, 0, 1, 1,
1.411525, -0.1726678, 2.015192, 0, 0, 0, 1, 1,
1.418157, -0.5367657, 1.732905, 0, 0, 0, 1, 1,
1.437316, 1.636894, 0.3953741, 0, 0, 0, 1, 1,
1.438809, -0.6975319, 2.310204, 0, 0, 0, 1, 1,
1.438959, 0.09470532, 2.139124, 1, 1, 1, 1, 1,
1.445316, -0.4548225, 1.505997, 1, 1, 1, 1, 1,
1.458323, -1.165635, 0.09879883, 1, 1, 1, 1, 1,
1.460715, 1.410717, 0.3645249, 1, 1, 1, 1, 1,
1.460956, 1.475014, 0.0656232, 1, 1, 1, 1, 1,
1.462145, 0.3078127, 2.742573, 1, 1, 1, 1, 1,
1.465493, 0.6813172, -0.7616381, 1, 1, 1, 1, 1,
1.469959, 2.354918, 1.474631, 1, 1, 1, 1, 1,
1.474497, -1.131329, 2.174313, 1, 1, 1, 1, 1,
1.489707, 0.3627543, 2.03305, 1, 1, 1, 1, 1,
1.489764, 0.4441577, 1.48726, 1, 1, 1, 1, 1,
1.490742, -1.327896, 1.530577, 1, 1, 1, 1, 1,
1.499435, 0.01778741, 1.042451, 1, 1, 1, 1, 1,
1.501199, 0.1567569, 1.441993, 1, 1, 1, 1, 1,
1.509761, -1.29536, 3.360142, 1, 1, 1, 1, 1,
1.512462, -0.03123927, 2.554603, 0, 0, 1, 1, 1,
1.514743, 0.2235903, 1.115157, 1, 0, 0, 1, 1,
1.531297, 1.77282, 0.6555757, 1, 0, 0, 1, 1,
1.542379, 0.6817592, 0.9166753, 1, 0, 0, 1, 1,
1.570174, -0.08713336, 0.1661984, 1, 0, 0, 1, 1,
1.584857, 2.144845, 0.7524309, 1, 0, 0, 1, 1,
1.609457, 0.365093, 1.22163, 0, 0, 0, 1, 1,
1.611743, 1.120104, -1.220183, 0, 0, 0, 1, 1,
1.614675, 0.8611463, 3.355959, 0, 0, 0, 1, 1,
1.620976, -0.5901872, 2.06461, 0, 0, 0, 1, 1,
1.621418, -0.4302152, 1.590051, 0, 0, 0, 1, 1,
1.622993, 0.6059561, 2.369448, 0, 0, 0, 1, 1,
1.626736, -0.2078289, 1.70315, 0, 0, 0, 1, 1,
1.634783, 0.9371555, 1.786088, 1, 1, 1, 1, 1,
1.657587, -2.62394, 3.204934, 1, 1, 1, 1, 1,
1.658983, 1.372734, 1.360838, 1, 1, 1, 1, 1,
1.660456, -0.449825, 2.75435, 1, 1, 1, 1, 1,
1.668735, 0.7049684, 0.003654169, 1, 1, 1, 1, 1,
1.674581, 0.6366373, 2.776157, 1, 1, 1, 1, 1,
1.674845, 0.6928562, -0.473549, 1, 1, 1, 1, 1,
1.683445, 0.2531574, 0.7265847, 1, 1, 1, 1, 1,
1.684027, 0.7151085, 0.3862559, 1, 1, 1, 1, 1,
1.684838, -0.7088987, 1.852772, 1, 1, 1, 1, 1,
1.703618, -1.071448, 1.142012, 1, 1, 1, 1, 1,
1.704199, -0.8861465, 0.5222379, 1, 1, 1, 1, 1,
1.708821, -0.1055238, 1.149112, 1, 1, 1, 1, 1,
1.711814, 0.490865, -0.7156922, 1, 1, 1, 1, 1,
1.718734, 0.5482571, 1.582838, 1, 1, 1, 1, 1,
1.722493, -0.2701346, 1.109964, 0, 0, 1, 1, 1,
1.728274, -0.07034308, 2.701807, 1, 0, 0, 1, 1,
1.740399, -0.09168476, 1.719799, 1, 0, 0, 1, 1,
1.744788, 0.2099379, 0.728994, 1, 0, 0, 1, 1,
1.750786, 0.8206306, 3.422504, 1, 0, 0, 1, 1,
1.751652, -0.5240725, 3.324152, 1, 0, 0, 1, 1,
1.757872, 0.2321045, 1.822752, 0, 0, 0, 1, 1,
1.759535, -0.1286036, 0.8817884, 0, 0, 0, 1, 1,
1.759715, -0.9547125, 4.414015, 0, 0, 0, 1, 1,
1.769343, -1.429377, 2.674418, 0, 0, 0, 1, 1,
1.84862, -0.4276599, 1.614626, 0, 0, 0, 1, 1,
1.85448, 0.0005199548, 1.31636, 0, 0, 0, 1, 1,
1.855714, 1.226613, 1.679565, 0, 0, 0, 1, 1,
1.871073, 0.9798241, 0.4107406, 1, 1, 1, 1, 1,
1.88466, -1.387866, 1.707898, 1, 1, 1, 1, 1,
1.885922, 2.053344, 0.8151781, 1, 1, 1, 1, 1,
1.89757, 0.9214795, 1.096419, 1, 1, 1, 1, 1,
1.908359, 1.411101, 0.9011142, 1, 1, 1, 1, 1,
1.919129, -1.221298, 0.9951404, 1, 1, 1, 1, 1,
1.937485, -0.01759379, 2.169228, 1, 1, 1, 1, 1,
1.952097, 1.820704, -0.07612668, 1, 1, 1, 1, 1,
1.96007, 0.03425399, -0.3084787, 1, 1, 1, 1, 1,
1.967122, 0.4528159, -0.3891136, 1, 1, 1, 1, 1,
1.976458, -1.862695, 2.147308, 1, 1, 1, 1, 1,
2.012493, -0.8497097, 1.838427, 1, 1, 1, 1, 1,
2.018965, -1.274303, 0.09822074, 1, 1, 1, 1, 1,
2.049789, 0.5360087, 0.9805683, 1, 1, 1, 1, 1,
2.055255, 1.13256, 0.4494472, 1, 1, 1, 1, 1,
2.06594, 0.8325671, 0.4586068, 0, 0, 1, 1, 1,
2.087962, 0.5026347, 1.759464, 1, 0, 0, 1, 1,
2.14173, -0.6823236, 2.41687, 1, 0, 0, 1, 1,
2.157812, 0.3731126, 2.21893, 1, 0, 0, 1, 1,
2.168768, -0.4241133, 1.85485, 1, 0, 0, 1, 1,
2.183758, -0.2910128, 1.56847, 1, 0, 0, 1, 1,
2.183858, -0.5235471, 0.375602, 0, 0, 0, 1, 1,
2.197858, -0.7914006, 2.258739, 0, 0, 0, 1, 1,
2.200456, -0.5244824, 2.300273, 0, 0, 0, 1, 1,
2.332125, 1.958957, 1.168964, 0, 0, 0, 1, 1,
2.425241, -0.06459659, 2.687593, 0, 0, 0, 1, 1,
2.536407, 0.2448839, 0.08176905, 0, 0, 0, 1, 1,
2.537269, -0.5676454, 1.974838, 0, 0, 0, 1, 1,
2.544805, -1.784826, 3.072084, 1, 1, 1, 1, 1,
2.665828, 1.72745, 3.377999, 1, 1, 1, 1, 1,
2.690956, 1.419174, 0.4858454, 1, 1, 1, 1, 1,
2.702954, -0.4627416, 1.966211, 1, 1, 1, 1, 1,
2.744501, -0.07471503, -0.2707862, 1, 1, 1, 1, 1,
2.829281, 0.7682817, 2.273166, 1, 1, 1, 1, 1,
3.194062, 0.7315503, 0.9200953, 1, 1, 1, 1, 1
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
var radius = 9.80124;
var distance = 34.42645;
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
mvMatrix.translate( 0.3453424, -0.245254, -0.07377601 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.42645);
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