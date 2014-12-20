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
-3.155276, -1.234653, -0.6446648, 1, 0, 0, 1,
-3.01211, -1.147987, -3.336431, 1, 0.007843138, 0, 1,
-3.009904, -0.008529769, -1.624946, 1, 0.01176471, 0, 1,
-2.772006, 0.09832726, -2.18635, 1, 0.01960784, 0, 1,
-2.764931, 1.082813, -1.515177, 1, 0.02352941, 0, 1,
-2.73411, -0.3233925, -3.406504, 1, 0.03137255, 0, 1,
-2.56539, 0.07481422, -0.1668484, 1, 0.03529412, 0, 1,
-2.554619, 0.05100963, -1.366124, 1, 0.04313726, 0, 1,
-2.540899, 1.09515, -2.255492, 1, 0.04705882, 0, 1,
-2.489195, -0.9957098, -2.059307, 1, 0.05490196, 0, 1,
-2.390936, 0.007228084, -1.52654, 1, 0.05882353, 0, 1,
-2.353935, -0.6059688, -2.153103, 1, 0.06666667, 0, 1,
-2.329803, 0.2416576, -1.274217, 1, 0.07058824, 0, 1,
-2.29936, -0.224754, 0.249324, 1, 0.07843138, 0, 1,
-2.276152, -1.066991, -1.12322, 1, 0.08235294, 0, 1,
-2.269041, -0.5651099, -1.215719, 1, 0.09019608, 0, 1,
-2.24602, 0.3310078, -1.734954, 1, 0.09411765, 0, 1,
-2.23992, 0.6781733, -3.198007, 1, 0.1019608, 0, 1,
-2.227092, -0.4911332, -2.580884, 1, 0.1098039, 0, 1,
-2.121648, 0.9715419, -2.828688, 1, 0.1137255, 0, 1,
-2.076792, -0.9626707, -2.12508, 1, 0.1215686, 0, 1,
-2.062726, -1.746502, -2.176659, 1, 0.1254902, 0, 1,
-2.040298, 0.6412907, -1.283901, 1, 0.1333333, 0, 1,
-2.021288, 0.02336791, -1.610924, 1, 0.1372549, 0, 1,
-2.007698, 0.3385626, -1.321581, 1, 0.145098, 0, 1,
-1.964308, 0.3329612, -1.227458, 1, 0.1490196, 0, 1,
-1.879673, 0.02810895, -2.55838, 1, 0.1568628, 0, 1,
-1.855629, -1.339463, 0.004456238, 1, 0.1607843, 0, 1,
-1.83787, -0.8146719, -2.053748, 1, 0.1686275, 0, 1,
-1.821576, -1.495767, -1.971192, 1, 0.172549, 0, 1,
-1.810454, -1.164832, -4.835079, 1, 0.1803922, 0, 1,
-1.809636, -1.285188, -1.846942, 1, 0.1843137, 0, 1,
-1.795192, 1.077187, -1.742467, 1, 0.1921569, 0, 1,
-1.774527, -0.7094977, -3.452717, 1, 0.1960784, 0, 1,
-1.768923, 0.9720399, -1.906059, 1, 0.2039216, 0, 1,
-1.758993, 1.484774, -2.738219, 1, 0.2117647, 0, 1,
-1.755687, -1.036074, -2.310344, 1, 0.2156863, 0, 1,
-1.752241, -1.127254, -2.167187, 1, 0.2235294, 0, 1,
-1.748896, 0.4663641, -1.579033, 1, 0.227451, 0, 1,
-1.737756, 0.4141334, 0.07110926, 1, 0.2352941, 0, 1,
-1.727825, -0.4774989, -2.594568, 1, 0.2392157, 0, 1,
-1.713788, 0.1756977, -1.668257, 1, 0.2470588, 0, 1,
-1.699135, -0.7352027, -1.335157, 1, 0.2509804, 0, 1,
-1.69789, 0.6678559, 1.428233, 1, 0.2588235, 0, 1,
-1.694574, -0.3255774, -1.307558, 1, 0.2627451, 0, 1,
-1.690731, 1.561865, -1.750617, 1, 0.2705882, 0, 1,
-1.690169, -0.5166314, -2.568174, 1, 0.2745098, 0, 1,
-1.686826, 0.7101171, -3.362053, 1, 0.282353, 0, 1,
-1.68471, 2.164553, -0.721344, 1, 0.2862745, 0, 1,
-1.682734, -0.7421094, -1.681352, 1, 0.2941177, 0, 1,
-1.677034, -0.4013847, -1.769465, 1, 0.3019608, 0, 1,
-1.666287, 1.062259, -0.817995, 1, 0.3058824, 0, 1,
-1.656873, -0.1286181, -1.345896, 1, 0.3137255, 0, 1,
-1.656092, 0.2269991, -0.2515831, 1, 0.3176471, 0, 1,
-1.636506, 0.2057786, -0.554984, 1, 0.3254902, 0, 1,
-1.629055, -0.5056152, -1.218835, 1, 0.3294118, 0, 1,
-1.620651, -0.5359932, -0.992964, 1, 0.3372549, 0, 1,
-1.607549, 0.8098953, -0.6315914, 1, 0.3411765, 0, 1,
-1.603439, 1.024436, -1.784045, 1, 0.3490196, 0, 1,
-1.594378, -0.1090752, -3.170374, 1, 0.3529412, 0, 1,
-1.591164, -0.5212638, -2.994009, 1, 0.3607843, 0, 1,
-1.583775, 0.9746036, -1.04441, 1, 0.3647059, 0, 1,
-1.581986, -0.9948622, -2.172585, 1, 0.372549, 0, 1,
-1.572376, 0.7571013, -0.355393, 1, 0.3764706, 0, 1,
-1.538619, -0.3543252, -0.1435305, 1, 0.3843137, 0, 1,
-1.537477, 0.3370069, -1.84278, 1, 0.3882353, 0, 1,
-1.531086, 1.1875, -0.9960813, 1, 0.3960784, 0, 1,
-1.529911, 0.3960162, -2.353125, 1, 0.4039216, 0, 1,
-1.524008, -0.406029, -3.152683, 1, 0.4078431, 0, 1,
-1.522123, -1.003658, -3.022715, 1, 0.4156863, 0, 1,
-1.522106, -0.2715893, 0.7598895, 1, 0.4196078, 0, 1,
-1.513378, 0.02513257, -3.725725, 1, 0.427451, 0, 1,
-1.48618, 0.6715016, -0.972954, 1, 0.4313726, 0, 1,
-1.465539, 0.223793, 0.5512401, 1, 0.4392157, 0, 1,
-1.459149, 0.1286493, -0.1586601, 1, 0.4431373, 0, 1,
-1.453225, -0.1640595, -1.614154, 1, 0.4509804, 0, 1,
-1.452882, -0.4365389, -0.8992041, 1, 0.454902, 0, 1,
-1.446999, -0.02744489, -0.3619362, 1, 0.4627451, 0, 1,
-1.442468, -0.6504697, -1.026713, 1, 0.4666667, 0, 1,
-1.431144, -0.1223855, -2.671942, 1, 0.4745098, 0, 1,
-1.426657, -0.3349397, -0.7546182, 1, 0.4784314, 0, 1,
-1.424415, -0.9253075, -2.253287, 1, 0.4862745, 0, 1,
-1.419731, -1.274364, -3.935114, 1, 0.4901961, 0, 1,
-1.414426, -0.7869239, -1.864225, 1, 0.4980392, 0, 1,
-1.394948, -1.315462, -1.401743, 1, 0.5058824, 0, 1,
-1.387525, 1.047539, -0.7443146, 1, 0.509804, 0, 1,
-1.381585, 0.2363818, -0.915673, 1, 0.5176471, 0, 1,
-1.380662, 0.529734, -1.49087, 1, 0.5215687, 0, 1,
-1.369195, -1.183667, -3.148135, 1, 0.5294118, 0, 1,
-1.364925, -1.069863, -1.039922, 1, 0.5333334, 0, 1,
-1.355166, 0.04389324, -1.628573, 1, 0.5411765, 0, 1,
-1.352027, 1.131506, -1.587749, 1, 0.5450981, 0, 1,
-1.35064, -1.077999, -3.34713, 1, 0.5529412, 0, 1,
-1.34203, 0.4198381, -1.436934, 1, 0.5568628, 0, 1,
-1.334992, -1.343016, -4.276888, 1, 0.5647059, 0, 1,
-1.330363, -0.7709222, -2.389488, 1, 0.5686275, 0, 1,
-1.323035, 0.6451266, -1.688287, 1, 0.5764706, 0, 1,
-1.320486, 0.3157416, -2.522908, 1, 0.5803922, 0, 1,
-1.308747, 0.9866188, 0.2857468, 1, 0.5882353, 0, 1,
-1.30572, 0.253916, -0.4654197, 1, 0.5921569, 0, 1,
-1.29374, 0.5342039, -1.202965, 1, 0.6, 0, 1,
-1.286129, -0.3757626, -3.850663, 1, 0.6078432, 0, 1,
-1.285906, -1.43745, -2.755146, 1, 0.6117647, 0, 1,
-1.274688, 0.1657677, -1.450836, 1, 0.6196079, 0, 1,
-1.266116, 0.3643551, 0.2803698, 1, 0.6235294, 0, 1,
-1.249047, -0.7961476, -3.584091, 1, 0.6313726, 0, 1,
-1.24723, -0.06610042, -1.272829, 1, 0.6352941, 0, 1,
-1.245861, -0.6013603, -2.051353, 1, 0.6431373, 0, 1,
-1.24193, -0.2264178, -0.6423818, 1, 0.6470588, 0, 1,
-1.239319, -0.5287917, -1.653687, 1, 0.654902, 0, 1,
-1.234722, 0.7551965, -2.004509, 1, 0.6588235, 0, 1,
-1.225421, -1.063965, -2.227079, 1, 0.6666667, 0, 1,
-1.223665, -0.3282185, -2.442262, 1, 0.6705883, 0, 1,
-1.223481, -0.2113605, -1.18547, 1, 0.6784314, 0, 1,
-1.214476, -0.08036027, -1.786074, 1, 0.682353, 0, 1,
-1.210693, -1.173762, -2.143008, 1, 0.6901961, 0, 1,
-1.200417, -0.1790323, -1.663842, 1, 0.6941177, 0, 1,
-1.198735, -0.6802341, -0.3491728, 1, 0.7019608, 0, 1,
-1.194822, -0.766651, -1.839934, 1, 0.7098039, 0, 1,
-1.194284, 0.09511714, -1.641343, 1, 0.7137255, 0, 1,
-1.193038, -0.6043013, -0.9463958, 1, 0.7215686, 0, 1,
-1.189482, 0.2281309, -2.454227, 1, 0.7254902, 0, 1,
-1.178833, 0.7583321, -0.9812673, 1, 0.7333333, 0, 1,
-1.171365, -1.941191, -3.133751, 1, 0.7372549, 0, 1,
-1.158909, 0.6977935, -0.0900823, 1, 0.7450981, 0, 1,
-1.155955, 0.1441708, -1.926017, 1, 0.7490196, 0, 1,
-1.147994, -0.3629889, -2.139253, 1, 0.7568628, 0, 1,
-1.144537, 0.8240324, -0.7251479, 1, 0.7607843, 0, 1,
-1.140688, -1.268449, -3.267518, 1, 0.7686275, 0, 1,
-1.138148, 0.4371432, -2.073456, 1, 0.772549, 0, 1,
-1.120463, -0.8566855, -1.785121, 1, 0.7803922, 0, 1,
-1.117892, -1.115715, -1.475873, 1, 0.7843137, 0, 1,
-1.11577, 1.235079, -1.098934, 1, 0.7921569, 0, 1,
-1.114768, 0.06686504, -1.981086, 1, 0.7960784, 0, 1,
-1.104936, -0.1672962, -1.492583, 1, 0.8039216, 0, 1,
-1.103074, -0.338746, -3.571353, 1, 0.8117647, 0, 1,
-1.093888, 0.6792328, -0.7862941, 1, 0.8156863, 0, 1,
-1.089251, -0.4553343, -2.349368, 1, 0.8235294, 0, 1,
-1.078564, 2.701079, -0.9439498, 1, 0.827451, 0, 1,
-1.061988, -1.486465, -1.93966, 1, 0.8352941, 0, 1,
-1.060021, -0.2117539, -1.24745, 1, 0.8392157, 0, 1,
-1.056351, -0.2615897, -1.690459, 1, 0.8470588, 0, 1,
-1.050105, -1.099927, -2.487208, 1, 0.8509804, 0, 1,
-1.031053, -0.89948, -3.059898, 1, 0.8588235, 0, 1,
-1.029206, -0.02029049, -0.9998672, 1, 0.8627451, 0, 1,
-1.025132, 0.2915067, -1.245704, 1, 0.8705882, 0, 1,
-1.024715, 0.7119489, -1.602981, 1, 0.8745098, 0, 1,
-1.020752, -0.7643457, -2.139325, 1, 0.8823529, 0, 1,
-1.02017, -0.9887314, -3.480886, 1, 0.8862745, 0, 1,
-1.003603, 1.57884, -1.622835, 1, 0.8941177, 0, 1,
-0.9977754, -0.4961731, -1.49566, 1, 0.8980392, 0, 1,
-0.9970949, 1.094796, -1.19829, 1, 0.9058824, 0, 1,
-0.9954374, 1.6013, -0.988158, 1, 0.9137255, 0, 1,
-0.9929233, 0.3127438, -0.8302928, 1, 0.9176471, 0, 1,
-0.992419, 1.264096, -0.8922521, 1, 0.9254902, 0, 1,
-0.9897514, -0.6714861, -2.034925, 1, 0.9294118, 0, 1,
-0.988166, -0.8545682, -1.852103, 1, 0.9372549, 0, 1,
-0.9857239, -1.769703, -3.405633, 1, 0.9411765, 0, 1,
-0.9842292, -0.6723538, -2.25329, 1, 0.9490196, 0, 1,
-0.9835222, -1.864319, -2.124358, 1, 0.9529412, 0, 1,
-0.9766514, -1.605912, -1.947239, 1, 0.9607843, 0, 1,
-0.9646255, 1.465151, -1.356153, 1, 0.9647059, 0, 1,
-0.9636437, -0.7001091, -3.513476, 1, 0.972549, 0, 1,
-0.9618486, -0.08620182, -1.866458, 1, 0.9764706, 0, 1,
-0.9593165, -0.09725013, -1.889522, 1, 0.9843137, 0, 1,
-0.956588, -0.7050496, -5.239658, 1, 0.9882353, 0, 1,
-0.9537363, 0.2964767, -0.7425467, 1, 0.9960784, 0, 1,
-0.9524171, -0.9391479, -3.759993, 0.9960784, 1, 0, 1,
-0.9503947, -2.170436, -3.066896, 0.9921569, 1, 0, 1,
-0.9335409, 0.3168601, -2.271404, 0.9843137, 1, 0, 1,
-0.932734, -0.2547638, -2.192755, 0.9803922, 1, 0, 1,
-0.9324333, -1.896693, -2.250328, 0.972549, 1, 0, 1,
-0.9288153, 0.782384, -2.039069, 0.9686275, 1, 0, 1,
-0.9281008, -0.6699972, -2.434035, 0.9607843, 1, 0, 1,
-0.9271384, -0.6289509, -1.482971, 0.9568627, 1, 0, 1,
-0.9254615, 1.356489, -0.8898246, 0.9490196, 1, 0, 1,
-0.9235063, 0.6296909, 0.2802881, 0.945098, 1, 0, 1,
-0.9171378, -0.1033356, -1.483468, 0.9372549, 1, 0, 1,
-0.9168432, 0.09927306, -0.1717121, 0.9333333, 1, 0, 1,
-0.9167985, -0.6014749, -4.358575, 0.9254902, 1, 0, 1,
-0.907821, -0.6552544, -0.7452874, 0.9215686, 1, 0, 1,
-0.9054147, -0.6802912, -2.70982, 0.9137255, 1, 0, 1,
-0.9035473, 1.953661, 0.8142053, 0.9098039, 1, 0, 1,
-0.8990009, 0.08443849, -1.231207, 0.9019608, 1, 0, 1,
-0.8956596, -1.006377, -1.640226, 0.8941177, 1, 0, 1,
-0.8908182, -1.273079, -1.179068, 0.8901961, 1, 0, 1,
-0.8906271, -1.479326, -2.585343, 0.8823529, 1, 0, 1,
-0.8879867, 0.2196499, -1.632692, 0.8784314, 1, 0, 1,
-0.8826795, -0.9443102, -1.373069, 0.8705882, 1, 0, 1,
-0.8783436, -0.6524755, -2.122984, 0.8666667, 1, 0, 1,
-0.8751385, 1.730513, -0.01322165, 0.8588235, 1, 0, 1,
-0.8695791, 0.4413356, -1.222899, 0.854902, 1, 0, 1,
-0.8644563, -0.6159283, -1.62879, 0.8470588, 1, 0, 1,
-0.8500272, 1.572241, -1.552551, 0.8431373, 1, 0, 1,
-0.8491068, 1.244763, -2.239346, 0.8352941, 1, 0, 1,
-0.843077, 0.6973262, 0.6184016, 0.8313726, 1, 0, 1,
-0.8430171, -0.8810241, -2.846211, 0.8235294, 1, 0, 1,
-0.8426347, 0.8434618, 0.613188, 0.8196079, 1, 0, 1,
-0.8346875, -0.980489, 0.4557423, 0.8117647, 1, 0, 1,
-0.8287522, 2.956633, 0.9588962, 0.8078431, 1, 0, 1,
-0.8284855, 1.349641, 0.0758817, 0.8, 1, 0, 1,
-0.8232087, 1.286002, -0.2123019, 0.7921569, 1, 0, 1,
-0.8226492, 1.71224, 0.04286708, 0.7882353, 1, 0, 1,
-0.8193944, 1.190024, -0.4606914, 0.7803922, 1, 0, 1,
-0.8178181, 0.1701674, -2.466005, 0.7764706, 1, 0, 1,
-0.8160417, -0.132856, 0.6557235, 0.7686275, 1, 0, 1,
-0.8144676, 1.477126, 0.05364409, 0.7647059, 1, 0, 1,
-0.8116172, -0.09375396, -2.114881, 0.7568628, 1, 0, 1,
-0.8111381, 0.7396485, -0.9761706, 0.7529412, 1, 0, 1,
-0.8108919, 0.2874874, -2.151738, 0.7450981, 1, 0, 1,
-0.8055505, 0.318428, -0.6026651, 0.7411765, 1, 0, 1,
-0.8039127, -1.061553, -2.528828, 0.7333333, 1, 0, 1,
-0.7950234, 1.248504, -1.206233, 0.7294118, 1, 0, 1,
-0.7940465, 0.7748104, -1.709377, 0.7215686, 1, 0, 1,
-0.7935613, 1.649146, -0.7600005, 0.7176471, 1, 0, 1,
-0.7912059, 0.7197026, -2.487513, 0.7098039, 1, 0, 1,
-0.7857987, -0.06618837, -1.867548, 0.7058824, 1, 0, 1,
-0.7834164, -0.7712472, -1.936154, 0.6980392, 1, 0, 1,
-0.7819261, 2.256993, -1.152946, 0.6901961, 1, 0, 1,
-0.7794973, 0.08067827, -0.9107461, 0.6862745, 1, 0, 1,
-0.7786979, 1.232298, -1.680617, 0.6784314, 1, 0, 1,
-0.773553, -0.4357137, -1.366013, 0.6745098, 1, 0, 1,
-0.7709322, 0.1707851, -0.7264299, 0.6666667, 1, 0, 1,
-0.7687031, -1.831718, -2.122743, 0.6627451, 1, 0, 1,
-0.7596227, 0.7937993, -1.070555, 0.654902, 1, 0, 1,
-0.7539887, -1.297422, -2.91392, 0.6509804, 1, 0, 1,
-0.7537402, -0.1172608, -1.997503, 0.6431373, 1, 0, 1,
-0.7461461, -0.6492706, -2.886441, 0.6392157, 1, 0, 1,
-0.7439344, 0.08569048, -0.7430845, 0.6313726, 1, 0, 1,
-0.7403482, 0.9576432, -1.223029, 0.627451, 1, 0, 1,
-0.7312322, -0.1446619, -3.895725, 0.6196079, 1, 0, 1,
-0.7311987, 0.2236277, -1.720134, 0.6156863, 1, 0, 1,
-0.7304571, 0.2377611, -0.1948202, 0.6078432, 1, 0, 1,
-0.7236029, 1.529762, -1.279344, 0.6039216, 1, 0, 1,
-0.7205966, 0.5650122, -1.581221, 0.5960785, 1, 0, 1,
-0.7200867, 0.03563018, -1.472086, 0.5882353, 1, 0, 1,
-0.7190509, 0.9353969, -0.3486925, 0.5843138, 1, 0, 1,
-0.7169634, 0.7433916, -0.1621777, 0.5764706, 1, 0, 1,
-0.7081932, -0.4292004, -2.728635, 0.572549, 1, 0, 1,
-0.706762, -0.2129231, -3.414856, 0.5647059, 1, 0, 1,
-0.7033563, 1.801602, -0.7577496, 0.5607843, 1, 0, 1,
-0.7029502, -1.393692, -2.848032, 0.5529412, 1, 0, 1,
-0.6949735, 0.9808189, -0.5203364, 0.5490196, 1, 0, 1,
-0.6933883, -1.0482, -1.979753, 0.5411765, 1, 0, 1,
-0.6928114, 0.04343117, -2.800336, 0.5372549, 1, 0, 1,
-0.689311, 0.2509288, -2.709797, 0.5294118, 1, 0, 1,
-0.6871859, 1.740063, -0.3896807, 0.5254902, 1, 0, 1,
-0.6842801, 0.05335325, -1.48021, 0.5176471, 1, 0, 1,
-0.6785675, 0.5150592, -1.730501, 0.5137255, 1, 0, 1,
-0.667794, -0.7684888, -1.314212, 0.5058824, 1, 0, 1,
-0.6664936, -1.352083, -2.920416, 0.5019608, 1, 0, 1,
-0.6643892, -0.8101606, -3.559753, 0.4941176, 1, 0, 1,
-0.6596353, 0.9754587, -3.034188, 0.4862745, 1, 0, 1,
-0.6547819, -0.2287988, -1.940513, 0.4823529, 1, 0, 1,
-0.6491556, -0.7922099, -1.295704, 0.4745098, 1, 0, 1,
-0.6485679, -0.6564479, -0.6658606, 0.4705882, 1, 0, 1,
-0.6465462, -0.489172, -2.017062, 0.4627451, 1, 0, 1,
-0.6448157, -1.372022, -4.003778, 0.4588235, 1, 0, 1,
-0.6408734, -0.1395288, -2.085827, 0.4509804, 1, 0, 1,
-0.6391822, -0.956936, -2.42124, 0.4470588, 1, 0, 1,
-0.638905, -0.9281611, -2.641892, 0.4392157, 1, 0, 1,
-0.6384708, 0.08210638, -1.774056, 0.4352941, 1, 0, 1,
-0.62923, -0.397754, -3.583953, 0.427451, 1, 0, 1,
-0.6253169, -1.08195, -0.8922368, 0.4235294, 1, 0, 1,
-0.6240327, 1.272013, -0.636021, 0.4156863, 1, 0, 1,
-0.6153998, 0.3081869, -2.766035, 0.4117647, 1, 0, 1,
-0.613224, 1.522589, 1.662931, 0.4039216, 1, 0, 1,
-0.6069846, -1.89458, -1.279317, 0.3960784, 1, 0, 1,
-0.6018814, -0.07705565, -1.306536, 0.3921569, 1, 0, 1,
-0.5968274, -1.219269, -2.257619, 0.3843137, 1, 0, 1,
-0.5847616, -0.691, -0.9410064, 0.3803922, 1, 0, 1,
-0.5832329, -0.8681442, -2.402563, 0.372549, 1, 0, 1,
-0.5809332, -0.4816582, -2.377656, 0.3686275, 1, 0, 1,
-0.5800055, -1.234313, -2.547679, 0.3607843, 1, 0, 1,
-0.5777583, -0.1924408, -1.771428, 0.3568628, 1, 0, 1,
-0.5761442, -0.08612478, -1.587421, 0.3490196, 1, 0, 1,
-0.5667748, 0.5454293, -0.9083844, 0.345098, 1, 0, 1,
-0.5600656, -1.719202, -3.388775, 0.3372549, 1, 0, 1,
-0.5589029, -0.05667906, -1.633429, 0.3333333, 1, 0, 1,
-0.5565048, -1.201142, -1.890652, 0.3254902, 1, 0, 1,
-0.5563094, -0.01855411, -3.129966, 0.3215686, 1, 0, 1,
-0.5390102, 0.06168603, -0.4722305, 0.3137255, 1, 0, 1,
-0.5346414, -0.1864784, -3.345708, 0.3098039, 1, 0, 1,
-0.5336813, -0.6343778, -1.625886, 0.3019608, 1, 0, 1,
-0.5334817, 0.4304375, -2.571129, 0.2941177, 1, 0, 1,
-0.5295463, 1.684781, 1.056368, 0.2901961, 1, 0, 1,
-0.525381, -1.517249, -1.78151, 0.282353, 1, 0, 1,
-0.5247872, -1.698838, -3.930996, 0.2784314, 1, 0, 1,
-0.524613, 0.9064413, -1.577067, 0.2705882, 1, 0, 1,
-0.5216523, -0.437399, -3.580338, 0.2666667, 1, 0, 1,
-0.5179294, -2.691413, -3.257301, 0.2588235, 1, 0, 1,
-0.5150469, -0.9627675, -2.256263, 0.254902, 1, 0, 1,
-0.5118256, 1.184762, -2.040552, 0.2470588, 1, 0, 1,
-0.5114907, -1.225522, -1.911294, 0.2431373, 1, 0, 1,
-0.5110571, -0.2640086, -3.005542, 0.2352941, 1, 0, 1,
-0.5087181, 0.2962495, -0.6963572, 0.2313726, 1, 0, 1,
-0.5078991, 0.9187598, -1.654364, 0.2235294, 1, 0, 1,
-0.5034421, 1.870935, -0.5644565, 0.2196078, 1, 0, 1,
-0.5004892, 0.8342351, -1.621869, 0.2117647, 1, 0, 1,
-0.500356, 0.1283069, -2.424284, 0.2078431, 1, 0, 1,
-0.497998, 0.261246, -0.2722343, 0.2, 1, 0, 1,
-0.4961522, -0.05917075, -2.043719, 0.1921569, 1, 0, 1,
-0.4937495, 0.5160034, -1.587183, 0.1882353, 1, 0, 1,
-0.4902798, 0.04840878, -0.2347512, 0.1803922, 1, 0, 1,
-0.4892278, 1.684655, -1.151087, 0.1764706, 1, 0, 1,
-0.4825949, -1.683591, -2.401251, 0.1686275, 1, 0, 1,
-0.4811582, 1.00326, -0.7874516, 0.1647059, 1, 0, 1,
-0.4809551, 0.9380118, 0.7154401, 0.1568628, 1, 0, 1,
-0.4774258, -1.365608, -2.046745, 0.1529412, 1, 0, 1,
-0.4773551, 0.4949071, -2.780718, 0.145098, 1, 0, 1,
-0.4717493, 0.06788412, -1.808444, 0.1411765, 1, 0, 1,
-0.4705115, -0.03633074, -1.739715, 0.1333333, 1, 0, 1,
-0.4647427, -1.349156, -3.991488, 0.1294118, 1, 0, 1,
-0.4621148, 1.227997, 0.5719661, 0.1215686, 1, 0, 1,
-0.4614484, 0.3461865, 0.02074068, 0.1176471, 1, 0, 1,
-0.4610661, 0.1339392, -0.09341402, 0.1098039, 1, 0, 1,
-0.4581087, 0.4251182, -1.867747, 0.1058824, 1, 0, 1,
-0.4516519, -0.3566806, -3.36805, 0.09803922, 1, 0, 1,
-0.4503546, 0.6808164, -0.6803149, 0.09019608, 1, 0, 1,
-0.4477067, -0.6367468, -1.59516, 0.08627451, 1, 0, 1,
-0.4469604, -1.359307, -4.940899, 0.07843138, 1, 0, 1,
-0.446885, 0.2034378, -1.258249, 0.07450981, 1, 0, 1,
-0.4440219, -0.01787716, -1.743871, 0.06666667, 1, 0, 1,
-0.4437405, 2.552052, 0.9149839, 0.0627451, 1, 0, 1,
-0.4433087, -1.22481, -2.691947, 0.05490196, 1, 0, 1,
-0.4430383, -1.105932, -3.586212, 0.05098039, 1, 0, 1,
-0.4424404, 0.3670903, -2.005759, 0.04313726, 1, 0, 1,
-0.4412239, -0.2489541, -1.213404, 0.03921569, 1, 0, 1,
-0.4399048, 0.2869596, -0.492835, 0.03137255, 1, 0, 1,
-0.4376345, -0.1780937, -1.190993, 0.02745098, 1, 0, 1,
-0.4334033, -0.2946147, -0.9072141, 0.01960784, 1, 0, 1,
-0.4304752, 1.081637, 1.28221, 0.01568628, 1, 0, 1,
-0.4248295, 0.5369728, -0.1593729, 0.007843138, 1, 0, 1,
-0.4163652, -0.3051253, -4.443286, 0.003921569, 1, 0, 1,
-0.4158735, 0.05163635, -2.081287, 0, 1, 0.003921569, 1,
-0.4157693, 0.08393978, -2.8123, 0, 1, 0.01176471, 1,
-0.4111924, -1.19113, -1.7435, 0, 1, 0.01568628, 1,
-0.4085988, 0.7344332, -0.9602169, 0, 1, 0.02352941, 1,
-0.405809, -1.116039, -2.315898, 0, 1, 0.02745098, 1,
-0.4039596, 1.767419, 0.5344858, 0, 1, 0.03529412, 1,
-0.4034772, 0.1875722, -1.742264, 0, 1, 0.03921569, 1,
-0.4029624, -0.8080218, -2.809713, 0, 1, 0.04705882, 1,
-0.3987358, 1.227172, -1.453475, 0, 1, 0.05098039, 1,
-0.3924639, -1.10069, -3.347774, 0, 1, 0.05882353, 1,
-0.3909227, -1.399648, -2.187174, 0, 1, 0.0627451, 1,
-0.3906155, 0.1888493, -1.984981, 0, 1, 0.07058824, 1,
-0.3793554, 2.166785, 1.357791, 0, 1, 0.07450981, 1,
-0.3746097, 1.120419, -2.470195, 0, 1, 0.08235294, 1,
-0.3713722, -0.5125317, -3.241019, 0, 1, 0.08627451, 1,
-0.3629459, 0.7239684, -0.5077941, 0, 1, 0.09411765, 1,
-0.3609914, -0.1899874, -3.244258, 0, 1, 0.1019608, 1,
-0.3597825, -0.959682, -1.490775, 0, 1, 0.1058824, 1,
-0.3583629, -1.408604, -4.822994, 0, 1, 0.1137255, 1,
-0.3510606, 0.5892318, -0.6605582, 0, 1, 0.1176471, 1,
-0.3443097, -0.2108877, -2.648515, 0, 1, 0.1254902, 1,
-0.34132, 2.102817, -0.5151371, 0, 1, 0.1294118, 1,
-0.3306998, -0.5442486, -1.708042, 0, 1, 0.1372549, 1,
-0.3256232, -0.572341, -2.340238, 0, 1, 0.1411765, 1,
-0.3222277, -1.196145, -1.716459, 0, 1, 0.1490196, 1,
-0.3187736, 1.312164, -1.622845, 0, 1, 0.1529412, 1,
-0.312373, 0.01614527, -2.657203, 0, 1, 0.1607843, 1,
-0.3053136, 0.1685793, -0.9337774, 0, 1, 0.1647059, 1,
-0.3046551, 0.3467744, -1.203123, 0, 1, 0.172549, 1,
-0.3020285, 0.09050146, 0.2083764, 0, 1, 0.1764706, 1,
-0.2994646, -0.06961476, -1.829941, 0, 1, 0.1843137, 1,
-0.2970861, -0.01999196, -1.89511, 0, 1, 0.1882353, 1,
-0.2970618, 2.282324, -1.003484, 0, 1, 0.1960784, 1,
-0.2953691, 0.9147713, 1.380975, 0, 1, 0.2039216, 1,
-0.2938538, 0.3656213, -0.2754119, 0, 1, 0.2078431, 1,
-0.2934974, 0.9849201, 0.1957039, 0, 1, 0.2156863, 1,
-0.2897631, -0.1150271, -1.196942, 0, 1, 0.2196078, 1,
-0.2883589, -0.05884946, -0.9209735, 0, 1, 0.227451, 1,
-0.2877164, -0.241115, -1.560194, 0, 1, 0.2313726, 1,
-0.2795085, -0.07470379, -2.059112, 0, 1, 0.2392157, 1,
-0.2767467, -0.161991, -4.072366, 0, 1, 0.2431373, 1,
-0.2729654, -0.2822658, -3.450224, 0, 1, 0.2509804, 1,
-0.2644967, -0.1979843, -2.153683, 0, 1, 0.254902, 1,
-0.2594611, 1.743826, -0.8318136, 0, 1, 0.2627451, 1,
-0.2558531, 0.9582339, -0.2178224, 0, 1, 0.2666667, 1,
-0.2542657, -1.50499, -3.563179, 0, 1, 0.2745098, 1,
-0.2529279, -0.07840167, -0.6267717, 0, 1, 0.2784314, 1,
-0.2507385, 1.030243, -2.438613, 0, 1, 0.2862745, 1,
-0.2417023, -0.9027355, -3.117145, 0, 1, 0.2901961, 1,
-0.2407758, -0.9577734, -2.906178, 0, 1, 0.2980392, 1,
-0.240168, -0.7836326, -3.337463, 0, 1, 0.3058824, 1,
-0.2371796, 0.3295932, -1.301913, 0, 1, 0.3098039, 1,
-0.2321576, -1.801411, -1.569964, 0, 1, 0.3176471, 1,
-0.2316582, 0.7587249, 0.01521616, 0, 1, 0.3215686, 1,
-0.2282245, 0.1457937, -1.475338, 0, 1, 0.3294118, 1,
-0.2218996, 1.60834, 0.5607144, 0, 1, 0.3333333, 1,
-0.2204505, -0.6838934, -2.802032, 0, 1, 0.3411765, 1,
-0.2148607, 0.5294355, -1.026702, 0, 1, 0.345098, 1,
-0.2123031, -1.770256, -4.717359, 0, 1, 0.3529412, 1,
-0.2078138, 0.1000892, -0.5864536, 0, 1, 0.3568628, 1,
-0.2037695, -0.5550695, -1.788541, 0, 1, 0.3647059, 1,
-0.1942521, -0.4113328, -2.088901, 0, 1, 0.3686275, 1,
-0.1940612, 0.723011, 0.8667231, 0, 1, 0.3764706, 1,
-0.1938246, 0.9365619, -0.1757086, 0, 1, 0.3803922, 1,
-0.1931548, 0.9595573, -0.4463737, 0, 1, 0.3882353, 1,
-0.1911273, 0.5577775, -0.05792378, 0, 1, 0.3921569, 1,
-0.1903216, 0.3497722, -0.4780056, 0, 1, 0.4, 1,
-0.1894317, -0.2404595, -0.08385593, 0, 1, 0.4078431, 1,
-0.1893079, 0.1921203, -0.1585777, 0, 1, 0.4117647, 1,
-0.1884471, -0.5642411, -2.256707, 0, 1, 0.4196078, 1,
-0.1883782, 1.940787, -2.594939, 0, 1, 0.4235294, 1,
-0.1868235, -1.91839, -2.104368, 0, 1, 0.4313726, 1,
-0.1844996, 0.7953086, -1.923141, 0, 1, 0.4352941, 1,
-0.1835123, -0.04159162, -2.030603, 0, 1, 0.4431373, 1,
-0.1820201, 0.6635265, -0.4625809, 0, 1, 0.4470588, 1,
-0.179429, -0.7451282, -2.283195, 0, 1, 0.454902, 1,
-0.1793554, 1.559738, 1.12253, 0, 1, 0.4588235, 1,
-0.1759271, -0.8183146, -3.201834, 0, 1, 0.4666667, 1,
-0.1747835, 0.9710681, -1.064888, 0, 1, 0.4705882, 1,
-0.1726021, -0.4521614, -0.9062092, 0, 1, 0.4784314, 1,
-0.1715216, -0.6421098, -2.449759, 0, 1, 0.4823529, 1,
-0.1691945, -1.698097, -2.541723, 0, 1, 0.4901961, 1,
-0.1684835, -0.4617673, -2.91983, 0, 1, 0.4941176, 1,
-0.1613558, 0.9970242, 0.7308241, 0, 1, 0.5019608, 1,
-0.1526542, 0.3157251, -1.645703, 0, 1, 0.509804, 1,
-0.151386, 0.0788177, -1.014966, 0, 1, 0.5137255, 1,
-0.1509694, -0.9114573, -2.033856, 0, 1, 0.5215687, 1,
-0.1466247, -0.3101424, -1.396985, 0, 1, 0.5254902, 1,
-0.1461448, -1.720007, -4.240133, 0, 1, 0.5333334, 1,
-0.1460656, 0.1378167, -2.952469, 0, 1, 0.5372549, 1,
-0.1419796, 0.7166256, 2.018201, 0, 1, 0.5450981, 1,
-0.1412779, -0.06996356, -3.086208, 0, 1, 0.5490196, 1,
-0.1395571, -0.040511, -0.6397287, 0, 1, 0.5568628, 1,
-0.1332223, 0.466494, -0.04731309, 0, 1, 0.5607843, 1,
-0.1329644, 0.01077611, -0.5000153, 0, 1, 0.5686275, 1,
-0.1284384, 0.4326145, -2.482711, 0, 1, 0.572549, 1,
-0.1267048, -0.09742633, -2.159139, 0, 1, 0.5803922, 1,
-0.1264765, -0.07280764, -2.79749, 0, 1, 0.5843138, 1,
-0.1244027, 0.8677928, -0.06467475, 0, 1, 0.5921569, 1,
-0.1209751, 0.03096809, -0.9695919, 0, 1, 0.5960785, 1,
-0.1191989, 0.8530103, 0.05484703, 0, 1, 0.6039216, 1,
-0.1172001, 0.01649517, -2.45711, 0, 1, 0.6117647, 1,
-0.1170623, 0.4556024, -0.3419044, 0, 1, 0.6156863, 1,
-0.113174, -0.6795142, -1.373767, 0, 1, 0.6235294, 1,
-0.1099511, 1.603116, -1.148006, 0, 1, 0.627451, 1,
-0.1083072, -2.071616, -3.187954, 0, 1, 0.6352941, 1,
-0.1061314, 1.89684, 1.750246, 0, 1, 0.6392157, 1,
-0.1051768, 2.038157, -1.945919, 0, 1, 0.6470588, 1,
-0.1043082, 0.3419171, -1.107138, 0, 1, 0.6509804, 1,
-0.09046962, -0.7070347, -1.570779, 0, 1, 0.6588235, 1,
-0.08394311, 0.196566, -0.07207178, 0, 1, 0.6627451, 1,
-0.07965694, 1.955683, -1.0531, 0, 1, 0.6705883, 1,
-0.07873455, 1.287729, 0.234042, 0, 1, 0.6745098, 1,
-0.07308454, -0.3917055, -2.729358, 0, 1, 0.682353, 1,
-0.06551931, 0.1126845, 0.05312014, 0, 1, 0.6862745, 1,
-0.06505961, -0.963387, -3.760434, 0, 1, 0.6941177, 1,
-0.06195504, 0.3515715, -0.2107927, 0, 1, 0.7019608, 1,
-0.05465258, 0.7722538, -1.126515, 0, 1, 0.7058824, 1,
-0.05353706, 0.2476462, -0.8578655, 0, 1, 0.7137255, 1,
-0.05300868, -0.04941957, -0.6167902, 0, 1, 0.7176471, 1,
-0.05276996, -0.6388452, -3.929572, 0, 1, 0.7254902, 1,
-0.04757379, 0.5887606, 0.9436543, 0, 1, 0.7294118, 1,
-0.04309339, -1.754568, -3.335611, 0, 1, 0.7372549, 1,
-0.04206166, 2.826489, 0.5239504, 0, 1, 0.7411765, 1,
-0.04187869, 0.145901, 0.8218783, 0, 1, 0.7490196, 1,
-0.0417712, -0.5905882, -2.485364, 0, 1, 0.7529412, 1,
-0.04003498, -0.4331851, -4.066327, 0, 1, 0.7607843, 1,
-0.0366221, -0.1816491, -2.734933, 0, 1, 0.7647059, 1,
-0.03522392, -0.06318011, -1.987261, 0, 1, 0.772549, 1,
-0.03504563, 1.435766, 0.289097, 0, 1, 0.7764706, 1,
-0.03386696, 0.5334747, -0.9681041, 0, 1, 0.7843137, 1,
-0.03360926, 0.2948119, 0.4038551, 0, 1, 0.7882353, 1,
-0.03199423, 0.9951828, -0.6210933, 0, 1, 0.7960784, 1,
-0.02897426, -0.8289196, -3.969907, 0, 1, 0.8039216, 1,
-0.02888016, 0.4849166, 0.5715656, 0, 1, 0.8078431, 1,
-0.02872572, 0.5281415, 1.312762, 0, 1, 0.8156863, 1,
-0.02539245, 0.07061668, 1.15958, 0, 1, 0.8196079, 1,
-0.02153965, 2.356799, -0.5875919, 0, 1, 0.827451, 1,
-0.02118241, 0.3500982, 0.1537439, 0, 1, 0.8313726, 1,
-0.02098293, -0.9172502, -3.323792, 0, 1, 0.8392157, 1,
-0.02025923, -1.926212, -2.312367, 0, 1, 0.8431373, 1,
-0.01732919, 0.4379324, 2.018116, 0, 1, 0.8509804, 1,
-0.0150983, -1.587656, -2.812266, 0, 1, 0.854902, 1,
-0.014148, 2.408448, 1.840018, 0, 1, 0.8627451, 1,
-0.01189209, -0.575087, -4.548204, 0, 1, 0.8666667, 1,
-0.01051544, 0.9786243, -0.6159841, 0, 1, 0.8745098, 1,
-0.007995626, 1.219143, 0.1328185, 0, 1, 0.8784314, 1,
-0.006415089, -0.4812348, -4.900932, 0, 1, 0.8862745, 1,
-0.005521089, 0.8443103, -0.708906, 0, 1, 0.8901961, 1,
-0.005413805, -0.6981936, -3.830586, 0, 1, 0.8980392, 1,
-0.00540594, -0.5114308, -2.666093, 0, 1, 0.9058824, 1,
-0.001470873, 0.8980353, -0.03212651, 0, 1, 0.9098039, 1,
-0.001367365, 0.2515446, -0.1993017, 0, 1, 0.9176471, 1,
-0.0002355472, -1.205957, -2.657676, 0, 1, 0.9215686, 1,
0.0009678295, 1.112069, -1.140011, 0, 1, 0.9294118, 1,
0.004044635, -0.04382501, 3.284961, 0, 1, 0.9333333, 1,
0.004355919, 0.4556701, 1.557569, 0, 1, 0.9411765, 1,
0.005380449, 1.228361, -0.3227473, 0, 1, 0.945098, 1,
0.007913068, 0.6573085, -1.415118, 0, 1, 0.9529412, 1,
0.01006498, -0.2729804, 3.63677, 0, 1, 0.9568627, 1,
0.01008463, 1.623584, 0.1915147, 0, 1, 0.9647059, 1,
0.01096595, 1.383949, 0.4465165, 0, 1, 0.9686275, 1,
0.02359451, 0.03664478, -0.5261243, 0, 1, 0.9764706, 1,
0.0296766, -0.1254571, 3.789576, 0, 1, 0.9803922, 1,
0.03088161, 1.45926, -0.1037092, 0, 1, 0.9882353, 1,
0.03307915, 1.519871, -1.543642, 0, 1, 0.9921569, 1,
0.03806732, -0.5929905, 3.538351, 0, 1, 1, 1,
0.0388447, 1.513302, -0.625051, 0, 0.9921569, 1, 1,
0.03901723, -0.6334025, 2.735766, 0, 0.9882353, 1, 1,
0.04877657, 1.269455, -0.3538281, 0, 0.9803922, 1, 1,
0.0522564, 0.3739587, 0.2077518, 0, 0.9764706, 1, 1,
0.05432309, -0.1237311, 2.525436, 0, 0.9686275, 1, 1,
0.05589602, -1.434559, 4.056384, 0, 0.9647059, 1, 1,
0.05751798, -1.106059, 3.782656, 0, 0.9568627, 1, 1,
0.05861502, 0.7966175, -0.3441281, 0, 0.9529412, 1, 1,
0.05938386, 0.5960312, -0.6367033, 0, 0.945098, 1, 1,
0.05962503, 0.09474074, -0.4555635, 0, 0.9411765, 1, 1,
0.06150428, -0.0476997, 1.874735, 0, 0.9333333, 1, 1,
0.06379954, 1.709514, 0.724237, 0, 0.9294118, 1, 1,
0.06591877, 0.5712527, 1.327295, 0, 0.9215686, 1, 1,
0.06870675, -1.029967, 2.31091, 0, 0.9176471, 1, 1,
0.06968685, -1.292671, 4.364505, 0, 0.9098039, 1, 1,
0.07822986, 0.3942879, 1.095664, 0, 0.9058824, 1, 1,
0.07946651, -0.005493372, 1.830179, 0, 0.8980392, 1, 1,
0.08030783, -0.2347289, 3.059633, 0, 0.8901961, 1, 1,
0.08107182, -0.9252998, 4.687763, 0, 0.8862745, 1, 1,
0.08140385, 0.2897069, 0.9448491, 0, 0.8784314, 1, 1,
0.08211298, 0.5887328, -0.5857907, 0, 0.8745098, 1, 1,
0.09474342, -0.6581953, 4.504449, 0, 0.8666667, 1, 1,
0.1006344, 0.8788883, 0.4737651, 0, 0.8627451, 1, 1,
0.1020538, 0.1325295, -1.357331, 0, 0.854902, 1, 1,
0.1028875, -1.130775, 2.841556, 0, 0.8509804, 1, 1,
0.1042574, 2.432368, 0.4773364, 0, 0.8431373, 1, 1,
0.1067723, 0.8696535, 1.399629, 0, 0.8392157, 1, 1,
0.1116658, -1.553666, 2.645778, 0, 0.8313726, 1, 1,
0.111679, 0.8618006, -1.963288, 0, 0.827451, 1, 1,
0.1135339, -2.170488, 1.150976, 0, 0.8196079, 1, 1,
0.113958, -0.05982033, 2.394877, 0, 0.8156863, 1, 1,
0.1148972, -1.765095, 2.745657, 0, 0.8078431, 1, 1,
0.1190831, -0.4718682, 4.041001, 0, 0.8039216, 1, 1,
0.1192477, 1.285814, 0.2186491, 0, 0.7960784, 1, 1,
0.1220251, -0.1314376, 3.159542, 0, 0.7882353, 1, 1,
0.122701, 0.07328351, 0.6839995, 0, 0.7843137, 1, 1,
0.1246678, 0.3771555, -0.2044531, 0, 0.7764706, 1, 1,
0.12672, 0.1901297, -0.5677337, 0, 0.772549, 1, 1,
0.1269181, 0.5482396, 0.665166, 0, 0.7647059, 1, 1,
0.1279673, 2.18028, -0.7445837, 0, 0.7607843, 1, 1,
0.1319462, -0.5780897, 3.545115, 0, 0.7529412, 1, 1,
0.1334386, -0.3685254, 3.222738, 0, 0.7490196, 1, 1,
0.136177, 1.889316, 1.400419, 0, 0.7411765, 1, 1,
0.1369834, -0.2032889, 3.704688, 0, 0.7372549, 1, 1,
0.1378977, 1.313261, 1.959445, 0, 0.7294118, 1, 1,
0.1467465, 1.827698, 1.199092, 0, 0.7254902, 1, 1,
0.1468931, -0.3640128, 3.354528, 0, 0.7176471, 1, 1,
0.1482417, -0.7812971, 2.964327, 0, 0.7137255, 1, 1,
0.1608707, 0.2167231, 0.9785475, 0, 0.7058824, 1, 1,
0.1665747, -0.6390837, 3.970856, 0, 0.6980392, 1, 1,
0.1676149, 0.4200512, 0.168498, 0, 0.6941177, 1, 1,
0.1701388, 1.229913, 0.1351262, 0, 0.6862745, 1, 1,
0.1701563, 0.9348023, 1.565948, 0, 0.682353, 1, 1,
0.1716172, 0.008699409, 2.011035, 0, 0.6745098, 1, 1,
0.1723186, -1.195622, 1.527048, 0, 0.6705883, 1, 1,
0.1755338, -0.1463943, 0.5321377, 0, 0.6627451, 1, 1,
0.1774545, -0.4424348, 2.831151, 0, 0.6588235, 1, 1,
0.1787043, -0.2625762, 2.504339, 0, 0.6509804, 1, 1,
0.1835218, 2.012141, -0.6752188, 0, 0.6470588, 1, 1,
0.188379, -1.280233, 1.19351, 0, 0.6392157, 1, 1,
0.191826, 1.024443, -0.4498475, 0, 0.6352941, 1, 1,
0.2013637, 0.4435521, -0.498808, 0, 0.627451, 1, 1,
0.2024253, 0.5471827, 1.066444, 0, 0.6235294, 1, 1,
0.2047595, -1.682606, 3.887912, 0, 0.6156863, 1, 1,
0.2068582, -0.2073891, 2.114972, 0, 0.6117647, 1, 1,
0.2082277, -0.6117718, 4.755253, 0, 0.6039216, 1, 1,
0.2125412, -0.3682675, 2.09154, 0, 0.5960785, 1, 1,
0.2148903, -1.709602, 3.457733, 0, 0.5921569, 1, 1,
0.2208039, 0.8901432, 0.05592765, 0, 0.5843138, 1, 1,
0.2241374, -0.4337099, 2.574637, 0, 0.5803922, 1, 1,
0.2324788, -1.06573, 3.335215, 0, 0.572549, 1, 1,
0.2334189, 0.4727077, 0.5812632, 0, 0.5686275, 1, 1,
0.234819, -0.9669174, 2.011225, 0, 0.5607843, 1, 1,
0.2404502, 0.2714311, 0.3853669, 0, 0.5568628, 1, 1,
0.2406344, -0.7677968, 4.227024, 0, 0.5490196, 1, 1,
0.2409784, -1.007641, 3.079362, 0, 0.5450981, 1, 1,
0.246731, -1.099721, 3.599183, 0, 0.5372549, 1, 1,
0.248929, 0.3696864, 1.559204, 0, 0.5333334, 1, 1,
0.249572, 0.04734425, 2.068135, 0, 0.5254902, 1, 1,
0.2500105, -0.4322586, 2.623362, 0, 0.5215687, 1, 1,
0.2540008, -0.2848019, 2.475773, 0, 0.5137255, 1, 1,
0.2630289, 0.3579354, -0.490745, 0, 0.509804, 1, 1,
0.2644207, -2.684901, 3.181321, 0, 0.5019608, 1, 1,
0.2659622, -1.677051, 2.525424, 0, 0.4941176, 1, 1,
0.2689301, -0.6561971, 3.844902, 0, 0.4901961, 1, 1,
0.2692942, 0.1795234, 1.024882, 0, 0.4823529, 1, 1,
0.2704117, 0.079851, 1.564697, 0, 0.4784314, 1, 1,
0.276097, 0.332132, 1.118979, 0, 0.4705882, 1, 1,
0.2761643, -0.5585647, 1.429398, 0, 0.4666667, 1, 1,
0.276262, 0.3853578, 0.300699, 0, 0.4588235, 1, 1,
0.2763604, -1.269438, 1.616596, 0, 0.454902, 1, 1,
0.2767281, 0.1037975, 1.888501, 0, 0.4470588, 1, 1,
0.2826445, 0.0577535, 0.8851854, 0, 0.4431373, 1, 1,
0.2830939, 0.3739104, 1.443375, 0, 0.4352941, 1, 1,
0.2878723, 0.3272738, 2.818401, 0, 0.4313726, 1, 1,
0.2911924, 0.2080036, 1.755329, 0, 0.4235294, 1, 1,
0.2963698, -1.752676, 3.195852, 0, 0.4196078, 1, 1,
0.3061439, -1.422731, 3.771135, 0, 0.4117647, 1, 1,
0.3061865, 0.2128615, -0.068364, 0, 0.4078431, 1, 1,
0.3071491, -0.8719106, 2.903784, 0, 0.4, 1, 1,
0.308539, 1.956133, -0.1770298, 0, 0.3921569, 1, 1,
0.3108006, -0.7812967, 1.995926, 0, 0.3882353, 1, 1,
0.3115664, -0.3958354, 2.26624, 0, 0.3803922, 1, 1,
0.3188241, -0.1793977, 0.2639554, 0, 0.3764706, 1, 1,
0.3202015, -1.642634, 2.294043, 0, 0.3686275, 1, 1,
0.3230287, 0.3282012, 0.6150032, 0, 0.3647059, 1, 1,
0.3255919, 0.1992449, 2.134895, 0, 0.3568628, 1, 1,
0.3272473, 1.385997, 1.625172, 0, 0.3529412, 1, 1,
0.3276624, 0.8661379, -0.3675405, 0, 0.345098, 1, 1,
0.3277613, 1.775828, 0.729544, 0, 0.3411765, 1, 1,
0.3365997, 0.5280756, 1.79637, 0, 0.3333333, 1, 1,
0.3368116, 1.336126, 1.104811, 0, 0.3294118, 1, 1,
0.3381664, -0.8565758, 3.593236, 0, 0.3215686, 1, 1,
0.338215, 1.841017, -1.090147, 0, 0.3176471, 1, 1,
0.3386853, 0.6368019, 1.772972, 0, 0.3098039, 1, 1,
0.3390567, 0.4640975, 1.457724, 0, 0.3058824, 1, 1,
0.3409197, 0.7255641, -0.8456381, 0, 0.2980392, 1, 1,
0.3421804, -0.2679721, 1.850496, 0, 0.2901961, 1, 1,
0.3428353, 1.184249, 0.5269912, 0, 0.2862745, 1, 1,
0.3447551, -0.2552457, 3.951921, 0, 0.2784314, 1, 1,
0.3492897, -0.8096643, 2.528162, 0, 0.2745098, 1, 1,
0.3592751, -1.355202, 0.9891384, 0, 0.2666667, 1, 1,
0.3596423, 0.9965861, -0.4244814, 0, 0.2627451, 1, 1,
0.3624036, -2.281067, 1.306962, 0, 0.254902, 1, 1,
0.3628522, -0.6745002, 4.835688, 0, 0.2509804, 1, 1,
0.373095, 0.3434803, 0.5368026, 0, 0.2431373, 1, 1,
0.3733743, 1.648221, -0.1857833, 0, 0.2392157, 1, 1,
0.3746193, -1.436993, 4.018011, 0, 0.2313726, 1, 1,
0.3748229, -0.9545688, 3.098588, 0, 0.227451, 1, 1,
0.3751846, 0.9369649, -1.838892, 0, 0.2196078, 1, 1,
0.3762685, -0.9835116, 2.238181, 0, 0.2156863, 1, 1,
0.3778456, 0.4425359, -1.64367, 0, 0.2078431, 1, 1,
0.3796304, 0.5066943, 1.387874, 0, 0.2039216, 1, 1,
0.3816706, -1.158831, 2.081409, 0, 0.1960784, 1, 1,
0.3826823, 0.6620247, -0.6709836, 0, 0.1882353, 1, 1,
0.3859242, 2.261178, -0.4434261, 0, 0.1843137, 1, 1,
0.3890983, -0.02415809, 3.742639, 0, 0.1764706, 1, 1,
0.3910398, 0.7014332, 0.5498487, 0, 0.172549, 1, 1,
0.3960682, -1.103199, 3.017271, 0, 0.1647059, 1, 1,
0.3986715, 1.988112, 0.2814379, 0, 0.1607843, 1, 1,
0.4010666, 0.9354714, 0.5786003, 0, 0.1529412, 1, 1,
0.4033412, 0.054051, 1.218197, 0, 0.1490196, 1, 1,
0.4055284, 0.1983751, 2.253898, 0, 0.1411765, 1, 1,
0.4083227, 0.932631, -0.1067268, 0, 0.1372549, 1, 1,
0.4104374, 1.540758, 0.005203701, 0, 0.1294118, 1, 1,
0.4119081, -0.3941211, 2.170144, 0, 0.1254902, 1, 1,
0.413766, 1.308124, 2.211508, 0, 0.1176471, 1, 1,
0.4219524, 0.5170125, 1.033873, 0, 0.1137255, 1, 1,
0.4220406, 0.8538352, 0.9677763, 0, 0.1058824, 1, 1,
0.423093, -0.3126437, 0.9462473, 0, 0.09803922, 1, 1,
0.4270845, -1.33967, 4.674392, 0, 0.09411765, 1, 1,
0.4284179, -1.151397, 2.107281, 0, 0.08627451, 1, 1,
0.4348431, 1.535301, 1.880891, 0, 0.08235294, 1, 1,
0.4353984, -0.2660338, 4.281791, 0, 0.07450981, 1, 1,
0.4375, 1.286307, -0.4089442, 0, 0.07058824, 1, 1,
0.4388169, -0.38064, 3.405499, 0, 0.0627451, 1, 1,
0.4389625, -0.7706848, 3.635553, 0, 0.05882353, 1, 1,
0.4416452, 1.16925, -1.136468, 0, 0.05098039, 1, 1,
0.4418653, -1.074351, 3.424656, 0, 0.04705882, 1, 1,
0.4469266, 1.349084, -0.7547935, 0, 0.03921569, 1, 1,
0.4471449, -0.5137244, 0.7797884, 0, 0.03529412, 1, 1,
0.4572616, 0.1449534, 1.264661, 0, 0.02745098, 1, 1,
0.4585797, -0.6349015, 2.953574, 0, 0.02352941, 1, 1,
0.4596497, -1.758498, 2.572276, 0, 0.01568628, 1, 1,
0.4617525, -1.211161, 3.55611, 0, 0.01176471, 1, 1,
0.463547, 0.3613685, 1.350983, 0, 0.003921569, 1, 1,
0.4697509, 1.268013, 1.563079, 0.003921569, 0, 1, 1,
0.4701797, -0.1346952, 2.179325, 0.007843138, 0, 1, 1,
0.4719046, -0.7171298, 2.919474, 0.01568628, 0, 1, 1,
0.4722787, 1.48899, 0.8792328, 0.01960784, 0, 1, 1,
0.4764715, -1.160905, 2.187218, 0.02745098, 0, 1, 1,
0.4787318, -1.017385, 2.478731, 0.03137255, 0, 1, 1,
0.4790884, 0.9766038, 0.9059743, 0.03921569, 0, 1, 1,
0.4826159, 0.0347467, 1.065628, 0.04313726, 0, 1, 1,
0.4827719, 2.444017, -2.159415, 0.05098039, 0, 1, 1,
0.4831696, 1.182997, 1.189216, 0.05490196, 0, 1, 1,
0.4864576, 0.04798845, 2.142564, 0.0627451, 0, 1, 1,
0.4900068, 0.5306186, -0.05292291, 0.06666667, 0, 1, 1,
0.4976486, -0.2411045, 1.499413, 0.07450981, 0, 1, 1,
0.4978147, -1.707039, 3.340575, 0.07843138, 0, 1, 1,
0.5070401, -0.4042456, 3.509776, 0.08627451, 0, 1, 1,
0.5124442, -1.043403, 4.304687, 0.09019608, 0, 1, 1,
0.5146537, -1.074046, 3.737973, 0.09803922, 0, 1, 1,
0.5159571, 0.2304962, 2.225339, 0.1058824, 0, 1, 1,
0.5202653, -1.711551, 2.214087, 0.1098039, 0, 1, 1,
0.523036, 0.8489877, 2.301673, 0.1176471, 0, 1, 1,
0.5243878, 1.106555, -1.004364, 0.1215686, 0, 1, 1,
0.5246552, 0.6035485, -0.9880435, 0.1294118, 0, 1, 1,
0.5268089, 0.5567141, 0.7790226, 0.1333333, 0, 1, 1,
0.5268202, -1.401253, 2.943104, 0.1411765, 0, 1, 1,
0.5329366, 0.4719294, 0.9332065, 0.145098, 0, 1, 1,
0.5345445, -0.01717457, 1.406931, 0.1529412, 0, 1, 1,
0.5348005, 2.365908, -0.7473902, 0.1568628, 0, 1, 1,
0.5385521, 0.9717221, -0.1211978, 0.1647059, 0, 1, 1,
0.5400643, 0.6185761, -1.247298, 0.1686275, 0, 1, 1,
0.5407429, -0.2036646, 2.996946, 0.1764706, 0, 1, 1,
0.5427208, 1.989426, 0.3641241, 0.1803922, 0, 1, 1,
0.5444651, 1.34758, 0.8593798, 0.1882353, 0, 1, 1,
0.5451992, 0.06525616, 1.831162, 0.1921569, 0, 1, 1,
0.5530884, 0.6426474, 1.650935, 0.2, 0, 1, 1,
0.5589978, 1.281995, 2.486213, 0.2078431, 0, 1, 1,
0.5608792, -1.203837, 4.515664, 0.2117647, 0, 1, 1,
0.5647297, 0.5248711, 1.339769, 0.2196078, 0, 1, 1,
0.565263, -0.7627931, 2.019497, 0.2235294, 0, 1, 1,
0.5670978, 0.8780198, 0.3547028, 0.2313726, 0, 1, 1,
0.5683734, -0.1693535, 0.6473207, 0.2352941, 0, 1, 1,
0.5709764, -1.285486, 4.49942, 0.2431373, 0, 1, 1,
0.573718, -0.8669549, 2.482792, 0.2470588, 0, 1, 1,
0.5796699, -0.07138446, 1.653789, 0.254902, 0, 1, 1,
0.5806806, 0.2004841, 1.173982, 0.2588235, 0, 1, 1,
0.5816362, 0.4205862, 1.680175, 0.2666667, 0, 1, 1,
0.5894069, -0.8868731, 2.835996, 0.2705882, 0, 1, 1,
0.589753, -1.339081, 2.790093, 0.2784314, 0, 1, 1,
0.5903802, 2.478385, 1.139673, 0.282353, 0, 1, 1,
0.5907007, -0.560239, 2.414616, 0.2901961, 0, 1, 1,
0.5988067, 2.797669, -1.333119, 0.2941177, 0, 1, 1,
0.59914, 0.1938369, -1.152343, 0.3019608, 0, 1, 1,
0.6010252, 0.4927866, 1.056819, 0.3098039, 0, 1, 1,
0.6033562, 1.496393, 0.7790132, 0.3137255, 0, 1, 1,
0.6077942, 0.0387001, 0.7027711, 0.3215686, 0, 1, 1,
0.6080918, 0.2189775, 1.964821, 0.3254902, 0, 1, 1,
0.6131432, 1.403268, -0.4101525, 0.3333333, 0, 1, 1,
0.6149079, -2.043009, 2.98514, 0.3372549, 0, 1, 1,
0.6204641, 0.931284, -1.384278, 0.345098, 0, 1, 1,
0.621403, -1.322315, 1.570862, 0.3490196, 0, 1, 1,
0.6317812, 1.731005, 1.051033, 0.3568628, 0, 1, 1,
0.6371884, -0.9876087, 1.820397, 0.3607843, 0, 1, 1,
0.6421699, 0.2081687, 0.5393596, 0.3686275, 0, 1, 1,
0.6439395, 1.08021, 0.5842066, 0.372549, 0, 1, 1,
0.6445926, 0.3328206, 2.37111, 0.3803922, 0, 1, 1,
0.6504677, 1.388057, 2.043849, 0.3843137, 0, 1, 1,
0.6510293, -1.99431, 1.837068, 0.3921569, 0, 1, 1,
0.6525806, 2.148491, -1.235036, 0.3960784, 0, 1, 1,
0.6540644, 0.9808801, 1.339493, 0.4039216, 0, 1, 1,
0.6559114, 1.604303, 0.2732065, 0.4117647, 0, 1, 1,
0.6560864, -1.297605, 3.096363, 0.4156863, 0, 1, 1,
0.6566121, 0.5740295, -0.1430173, 0.4235294, 0, 1, 1,
0.6596171, 0.8881938, 1.167526, 0.427451, 0, 1, 1,
0.661259, -0.1347455, 0.9860268, 0.4352941, 0, 1, 1,
0.6642277, 0.072279, 1.345525, 0.4392157, 0, 1, 1,
0.6642467, 0.09969928, 2.436191, 0.4470588, 0, 1, 1,
0.66774, 1.57638, 1.3915, 0.4509804, 0, 1, 1,
0.6682718, 0.08738575, 1.079643, 0.4588235, 0, 1, 1,
0.6692942, 0.4584956, 1.343767, 0.4627451, 0, 1, 1,
0.6758788, -0.3346442, 2.057142, 0.4705882, 0, 1, 1,
0.6796505, 0.5627189, -0.8242846, 0.4745098, 0, 1, 1,
0.6799221, -0.003226923, 1.429775, 0.4823529, 0, 1, 1,
0.6816853, -2.393829, 4.321062, 0.4862745, 0, 1, 1,
0.6817061, 1.603482, 1.208957, 0.4941176, 0, 1, 1,
0.6881151, -1.486184, 4.632792, 0.5019608, 0, 1, 1,
0.6892183, 0.7974319, 1.102687, 0.5058824, 0, 1, 1,
0.6893705, -0.3925297, 3.489454, 0.5137255, 0, 1, 1,
0.6904995, 0.2033279, 1.322487, 0.5176471, 0, 1, 1,
0.6949688, 1.088459, 1.066476, 0.5254902, 0, 1, 1,
0.6982772, 0.2770551, 2.76635, 0.5294118, 0, 1, 1,
0.7010717, 0.6555247, 0.6216925, 0.5372549, 0, 1, 1,
0.7028531, 0.6244336, -0.09779935, 0.5411765, 0, 1, 1,
0.7044276, -0.1619575, 1.365387, 0.5490196, 0, 1, 1,
0.7056251, 0.5284938, 0.3575886, 0.5529412, 0, 1, 1,
0.7116489, 0.7213857, 0.6754292, 0.5607843, 0, 1, 1,
0.7171003, 0.0977146, 2.283202, 0.5647059, 0, 1, 1,
0.7275871, -1.432636, 3.067524, 0.572549, 0, 1, 1,
0.7283799, -0.8723583, 2.364003, 0.5764706, 0, 1, 1,
0.7299447, -0.9546102, 4.550945, 0.5843138, 0, 1, 1,
0.7316068, 0.2897035, 0.7789641, 0.5882353, 0, 1, 1,
0.7349714, 1.796404, 1.843213, 0.5960785, 0, 1, 1,
0.7351655, -1.048479, 2.20735, 0.6039216, 0, 1, 1,
0.7379196, 0.5085377, -0.06379169, 0.6078432, 0, 1, 1,
0.7405776, -0.2852999, 5.001343, 0.6156863, 0, 1, 1,
0.749009, -1.333898, 3.255651, 0.6196079, 0, 1, 1,
0.75109, 0.3602439, 0.6144695, 0.627451, 0, 1, 1,
0.7531999, -0.718124, 2.305026, 0.6313726, 0, 1, 1,
0.7596226, -1.879444, 3.26919, 0.6392157, 0, 1, 1,
0.7648627, -0.5221361, 3.174627, 0.6431373, 0, 1, 1,
0.7652785, 0.7369456, 0.5284184, 0.6509804, 0, 1, 1,
0.7668921, -1.196363, 0.873907, 0.654902, 0, 1, 1,
0.767139, 1.213314, 2.250838, 0.6627451, 0, 1, 1,
0.7690124, 0.837715, 0.5673762, 0.6666667, 0, 1, 1,
0.7699214, 0.9214478, 1.070976, 0.6745098, 0, 1, 1,
0.7713507, -0.1488249, 1.766824, 0.6784314, 0, 1, 1,
0.7730556, 0.7058466, 1.420862, 0.6862745, 0, 1, 1,
0.777386, 0.9517941, 0.5639945, 0.6901961, 0, 1, 1,
0.7791617, 0.697401, 1.324307, 0.6980392, 0, 1, 1,
0.7805817, -0.03322209, 0.3807319, 0.7058824, 0, 1, 1,
0.7854573, -0.4654487, 1.173393, 0.7098039, 0, 1, 1,
0.795541, -0.4941818, 0.8806884, 0.7176471, 0, 1, 1,
0.8013813, 0.649806, 1.206777, 0.7215686, 0, 1, 1,
0.8025888, 1.691798, -0.1946902, 0.7294118, 0, 1, 1,
0.8065967, 1.667414, -0.2866595, 0.7333333, 0, 1, 1,
0.8110494, 0.9787468, 0.6350571, 0.7411765, 0, 1, 1,
0.8126438, 1.212094, 1.440428, 0.7450981, 0, 1, 1,
0.8131633, -0.6480219, 0.6669598, 0.7529412, 0, 1, 1,
0.8247072, 0.5711164, 1.647531, 0.7568628, 0, 1, 1,
0.8327635, -0.05160467, 2.079447, 0.7647059, 0, 1, 1,
0.8337029, -0.7663282, 2.878644, 0.7686275, 0, 1, 1,
0.8367467, -0.298632, 2.336019, 0.7764706, 0, 1, 1,
0.8388339, -0.1688367, 3.136692, 0.7803922, 0, 1, 1,
0.8398471, -0.3531044, 1.583744, 0.7882353, 0, 1, 1,
0.8408328, -0.6984357, 0.3572021, 0.7921569, 0, 1, 1,
0.8452135, 0.09852631, 1.230191, 0.8, 0, 1, 1,
0.8473241, -1.131957, 1.457771, 0.8078431, 0, 1, 1,
0.8532456, 0.5117528, 1.294409, 0.8117647, 0, 1, 1,
0.856128, 1.030803, 0.6872712, 0.8196079, 0, 1, 1,
0.8571165, -0.4096772, 2.519313, 0.8235294, 0, 1, 1,
0.8600005, -1.095773, 2.344809, 0.8313726, 0, 1, 1,
0.8640849, 0.5569884, 1.480443, 0.8352941, 0, 1, 1,
0.872804, 1.265234, 0.9787863, 0.8431373, 0, 1, 1,
0.873482, -0.2521731, 0.7972836, 0.8470588, 0, 1, 1,
0.8784618, -1.905719, 2.686317, 0.854902, 0, 1, 1,
0.8793281, 0.1089402, 1.822415, 0.8588235, 0, 1, 1,
0.8799331, -0.7462524, 0.6200152, 0.8666667, 0, 1, 1,
0.8839283, -0.4753199, 2.890754, 0.8705882, 0, 1, 1,
0.8892, -0.2313529, 1.613324, 0.8784314, 0, 1, 1,
0.8989947, -1.372362, 2.510367, 0.8823529, 0, 1, 1,
0.9020861, -0.8914922, 2.292723, 0.8901961, 0, 1, 1,
0.9072211, 0.6391818, 1.459814, 0.8941177, 0, 1, 1,
0.9096193, 0.727331, -0.9227663, 0.9019608, 0, 1, 1,
0.9098638, 0.2145545, 1.881007, 0.9098039, 0, 1, 1,
0.9117143, 2.236205, 0.3018901, 0.9137255, 0, 1, 1,
0.9123638, 0.0285105, 0.9217345, 0.9215686, 0, 1, 1,
0.9298451, -0.3200492, 3.565192, 0.9254902, 0, 1, 1,
0.9319773, 1.767761, -0.5640661, 0.9333333, 0, 1, 1,
0.9346055, -1.096589, 3.214347, 0.9372549, 0, 1, 1,
0.941909, -0.1289762, 1.542047, 0.945098, 0, 1, 1,
0.9454895, -0.5654029, 0.6924676, 0.9490196, 0, 1, 1,
0.9500418, -1.775578, 2.449182, 0.9568627, 0, 1, 1,
0.9585167, 0.5915399, 1.800585, 0.9607843, 0, 1, 1,
0.9589772, 1.875489, 2.162757, 0.9686275, 0, 1, 1,
0.9614883, -0.331393, 0.8797005, 0.972549, 0, 1, 1,
0.9640343, -0.1132366, 2.972371, 0.9803922, 0, 1, 1,
0.9690484, 1.670471, 1.690151, 0.9843137, 0, 1, 1,
0.9702868, 0.4420537, 0.922344, 0.9921569, 0, 1, 1,
0.9791768, 0.09188366, 1.795141, 0.9960784, 0, 1, 1,
0.9796754, 1.658424, -0.7533213, 1, 0, 0.9960784, 1,
0.9807215, -1.734974, 3.934845, 1, 0, 0.9882353, 1,
0.9838035, -0.7006301, 3.958926, 1, 0, 0.9843137, 1,
0.9842855, 0.2729904, 2.026856, 1, 0, 0.9764706, 1,
0.9846573, -0.04448968, 1.347803, 1, 0, 0.972549, 1,
0.9855124, -0.106183, 1.681297, 1, 0, 0.9647059, 1,
0.9859319, -0.03621577, 1.602441, 1, 0, 0.9607843, 1,
0.9885648, 0.6316625, 0.1126698, 1, 0, 0.9529412, 1,
0.9915999, -0.3639541, 1.447031, 1, 0, 0.9490196, 1,
0.9985948, 0.2493041, 1.836805, 1, 0, 0.9411765, 1,
1.004117, -1.45261, 2.753139, 1, 0, 0.9372549, 1,
1.023401, -1.060534, 2.120564, 1, 0, 0.9294118, 1,
1.024092, 0.7863854, 1.105924, 1, 0, 0.9254902, 1,
1.02509, -0.3765062, 1.57547, 1, 0, 0.9176471, 1,
1.026756, 0.8264812, 1.641525, 1, 0, 0.9137255, 1,
1.038378, -1.030523, 4.43375, 1, 0, 0.9058824, 1,
1.042181, 0.1946846, 1.577788, 1, 0, 0.9019608, 1,
1.04599, 1.856264, -0.5427227, 1, 0, 0.8941177, 1,
1.054057, 0.1851888, 2.632553, 1, 0, 0.8862745, 1,
1.062723, -0.6075463, 4.230638, 1, 0, 0.8823529, 1,
1.066753, 0.03342213, 2.073176, 1, 0, 0.8745098, 1,
1.066994, -0.9844369, 2.030955, 1, 0, 0.8705882, 1,
1.067376, 0.7614473, 1.344225, 1, 0, 0.8627451, 1,
1.069237, -0.3771967, 1.563433, 1, 0, 0.8588235, 1,
1.072323, 0.7452528, 0.3748425, 1, 0, 0.8509804, 1,
1.073053, -0.213211, 0.2647218, 1, 0, 0.8470588, 1,
1.081344, -0.3994272, 1.629417, 1, 0, 0.8392157, 1,
1.082191, 0.8066992, 0.1347056, 1, 0, 0.8352941, 1,
1.091639, -0.7384333, 0.5686039, 1, 0, 0.827451, 1,
1.092238, -0.05846221, 1.628258, 1, 0, 0.8235294, 1,
1.10081, 0.08364664, 2.040247, 1, 0, 0.8156863, 1,
1.107708, -0.2051087, 2.067905, 1, 0, 0.8117647, 1,
1.115933, 0.981573, 0.03845401, 1, 0, 0.8039216, 1,
1.119021, 2.109514, 1.527557, 1, 0, 0.7960784, 1,
1.123442, -0.7157074, 1.016588, 1, 0, 0.7921569, 1,
1.123517, -1.111541, 3.980385, 1, 0, 0.7843137, 1,
1.12444, 2.510292, 0.0239351, 1, 0, 0.7803922, 1,
1.136982, 0.6408436, -0.866805, 1, 0, 0.772549, 1,
1.149146, 1.07068, -1.094268, 1, 0, 0.7686275, 1,
1.151626, -0.8462495, 0.2578501, 1, 0, 0.7607843, 1,
1.153803, -0.1444318, 3.335935, 1, 0, 0.7568628, 1,
1.154892, -0.6750062, 1.858261, 1, 0, 0.7490196, 1,
1.161295, -0.3988331, 1.803051, 1, 0, 0.7450981, 1,
1.161989, -1.712898, 2.953916, 1, 0, 0.7372549, 1,
1.162498, 0.6161565, 1.567706, 1, 0, 0.7333333, 1,
1.164964, -0.5663245, 2.908413, 1, 0, 0.7254902, 1,
1.165585, 0.08548453, 0.8859686, 1, 0, 0.7215686, 1,
1.165615, -1.803386, 3.282349, 1, 0, 0.7137255, 1,
1.166895, 1.088422, 0.4813282, 1, 0, 0.7098039, 1,
1.172482, 0.2222223, 2.835429, 1, 0, 0.7019608, 1,
1.178895, -0.6774596, 3.248359, 1, 0, 0.6941177, 1,
1.180047, -2.723065, 0.6797571, 1, 0, 0.6901961, 1,
1.189812, 0.5431586, 1.917375, 1, 0, 0.682353, 1,
1.192284, 1.059744, 1.336728, 1, 0, 0.6784314, 1,
1.202571, -1.421883, 2.935188, 1, 0, 0.6705883, 1,
1.206311, 1.643806, 1.140298, 1, 0, 0.6666667, 1,
1.214146, -0.7074721, 1.398352, 1, 0, 0.6588235, 1,
1.230367, 0.7833164, 1.736464, 1, 0, 0.654902, 1,
1.245054, 1.313742, 2.312869, 1, 0, 0.6470588, 1,
1.245422, -0.5326647, 1.687975, 1, 0, 0.6431373, 1,
1.253416, -2.223502, 3.426547, 1, 0, 0.6352941, 1,
1.254142, 0.8527142, 0.2208271, 1, 0, 0.6313726, 1,
1.258489, 0.02017105, 0.977118, 1, 0, 0.6235294, 1,
1.263076, 0.8526257, 0.4902083, 1, 0, 0.6196079, 1,
1.26636, -1.405679, 3.011577, 1, 0, 0.6117647, 1,
1.267723, -0.4304592, 1.521806, 1, 0, 0.6078432, 1,
1.269331, 2.93115, -0.7042378, 1, 0, 0.6, 1,
1.277625, 1.031188, 2.121266, 1, 0, 0.5921569, 1,
1.278396, -0.9288023, 3.572236, 1, 0, 0.5882353, 1,
1.282355, -1.651604, 2.151999, 1, 0, 0.5803922, 1,
1.288207, 0.7123511, 2.315658, 1, 0, 0.5764706, 1,
1.288342, 1.67412, 1.518298, 1, 0, 0.5686275, 1,
1.290926, 2.840924, 1.623281, 1, 0, 0.5647059, 1,
1.296024, 0.050877, 2.084922, 1, 0, 0.5568628, 1,
1.30207, -0.5729811, 1.734594, 1, 0, 0.5529412, 1,
1.319172, -1.003057, 1.352478, 1, 0, 0.5450981, 1,
1.32082, -2.242377, 2.039682, 1, 0, 0.5411765, 1,
1.321649, -0.358494, 1.488808, 1, 0, 0.5333334, 1,
1.330514, -0.7580516, 3.344042, 1, 0, 0.5294118, 1,
1.332488, -1.137676, 2.001302, 1, 0, 0.5215687, 1,
1.339522, 1.724192, 0.1608132, 1, 0, 0.5176471, 1,
1.343896, 0.2435263, 1.641066, 1, 0, 0.509804, 1,
1.34596, 0.2060862, 1.927417, 1, 0, 0.5058824, 1,
1.346312, -0.7126507, 3.670099, 1, 0, 0.4980392, 1,
1.358327, -0.4984632, 2.761021, 1, 0, 0.4901961, 1,
1.359502, 0.307969, 0.7595527, 1, 0, 0.4862745, 1,
1.363921, -1.863721, 3.17814, 1, 0, 0.4784314, 1,
1.364974, 1.037063, 1.043107, 1, 0, 0.4745098, 1,
1.374148, 0.8458604, 1.21269, 1, 0, 0.4666667, 1,
1.378946, 0.04572855, 3.139873, 1, 0, 0.4627451, 1,
1.384821, 0.06745439, 0.6104749, 1, 0, 0.454902, 1,
1.385103, 0.4481511, 2.38235, 1, 0, 0.4509804, 1,
1.391819, 0.9317051, 0.6543354, 1, 0, 0.4431373, 1,
1.398718, 0.9203459, 2.289827, 1, 0, 0.4392157, 1,
1.400657, -0.08032102, 0.6435069, 1, 0, 0.4313726, 1,
1.411201, 0.7398129, 1.529741, 1, 0, 0.427451, 1,
1.429009, -2.025158, 3.390687, 1, 0, 0.4196078, 1,
1.441025, 0.9976053, -1.224365, 1, 0, 0.4156863, 1,
1.443154, 1.271458, 2.438144, 1, 0, 0.4078431, 1,
1.45523, 3.339314, 0.005009332, 1, 0, 0.4039216, 1,
1.465773, 0.8473341, 0.7861881, 1, 0, 0.3960784, 1,
1.471874, 1.465302, 0.7719778, 1, 0, 0.3882353, 1,
1.487978, 1.22917, 0.7015465, 1, 0, 0.3843137, 1,
1.488079, -2.1875, 2.176875, 1, 0, 0.3764706, 1,
1.491543, -0.9648356, 2.956452, 1, 0, 0.372549, 1,
1.498649, -0.5122016, 2.507537, 1, 0, 0.3647059, 1,
1.499282, 0.7575511, 1.926329, 1, 0, 0.3607843, 1,
1.503541, -0.3965338, 0.188017, 1, 0, 0.3529412, 1,
1.508132, 0.2983584, 2.350978, 1, 0, 0.3490196, 1,
1.514185, 0.5860327, 2.677173, 1, 0, 0.3411765, 1,
1.522196, 0.766871, 1.79095, 1, 0, 0.3372549, 1,
1.549912, 0.6021877, 0.008593609, 1, 0, 0.3294118, 1,
1.559655, -0.6858566, 2.310505, 1, 0, 0.3254902, 1,
1.562877, 0.05130669, 1.806521, 1, 0, 0.3176471, 1,
1.587039, -0.1841076, 4.180122, 1, 0, 0.3137255, 1,
1.59346, 1.558075, -0.4290858, 1, 0, 0.3058824, 1,
1.599786, -1.386086, 2.839741, 1, 0, 0.2980392, 1,
1.621744, -0.9388136, 2.335947, 1, 0, 0.2941177, 1,
1.628084, 1.812911, 2.376069, 1, 0, 0.2862745, 1,
1.638083, -1.217479, 2.425371, 1, 0, 0.282353, 1,
1.643167, -0.9853988, 1.214462, 1, 0, 0.2745098, 1,
1.679078, 0.4491409, 1.50429, 1, 0, 0.2705882, 1,
1.691688, -1.340983, 0.3229453, 1, 0, 0.2627451, 1,
1.697296, -0.6893106, 1.409474, 1, 0, 0.2588235, 1,
1.703034, 1.038709, 1.309717, 1, 0, 0.2509804, 1,
1.716244, -1.451648, 2.16691, 1, 0, 0.2470588, 1,
1.719808, -0.7618686, 2.763288, 1, 0, 0.2392157, 1,
1.721142, -0.4191911, 0.1025304, 1, 0, 0.2352941, 1,
1.734735, 1.844023, 2.553095, 1, 0, 0.227451, 1,
1.737676, 0.2091133, 1.227666, 1, 0, 0.2235294, 1,
1.742134, -0.4018601, 1.067971, 1, 0, 0.2156863, 1,
1.742372, -0.1175238, 0.7358319, 1, 0, 0.2117647, 1,
1.749598, -0.6027282, 0.1149011, 1, 0, 0.2039216, 1,
1.781203, -0.6350448, 0.2489211, 1, 0, 0.1960784, 1,
1.790746, 1.130128, 2.414629, 1, 0, 0.1921569, 1,
1.796512, -1.59642, 1.43962, 1, 0, 0.1843137, 1,
1.814193, -1.931388, 1.039192, 1, 0, 0.1803922, 1,
1.824726, -0.7341205, 0.2146687, 1, 0, 0.172549, 1,
1.826043, 0.1398267, 2.4551, 1, 0, 0.1686275, 1,
1.839565, -0.9097204, 0.6708408, 1, 0, 0.1607843, 1,
1.852247, -0.3644272, -0.3141235, 1, 0, 0.1568628, 1,
1.853732, -0.2000262, -0.5578324, 1, 0, 0.1490196, 1,
1.863041, 0.5592985, 1.815798, 1, 0, 0.145098, 1,
1.866574, -1.108117, 3.525004, 1, 0, 0.1372549, 1,
1.874852, 1.327853, -0.01144638, 1, 0, 0.1333333, 1,
1.944816, -0.6684539, 2.186585, 1, 0, 0.1254902, 1,
1.949446, 1.336946, 2.562939, 1, 0, 0.1215686, 1,
1.973078, 0.1443468, 0.5291064, 1, 0, 0.1137255, 1,
1.976469, -0.9310252, 0.3706422, 1, 0, 0.1098039, 1,
2.020881, -1.42622, 2.803136, 1, 0, 0.1019608, 1,
2.053915, -0.3346591, 0.7486022, 1, 0, 0.09411765, 1,
2.061592, 1.098833, 0.5042701, 1, 0, 0.09019608, 1,
2.203741, -0.5618448, 0.723628, 1, 0, 0.08235294, 1,
2.214127, -1.622568, 2.764151, 1, 0, 0.07843138, 1,
2.346924, 0.3283994, 2.20423, 1, 0, 0.07058824, 1,
2.382069, -1.666422, 1.685719, 1, 0, 0.06666667, 1,
2.423783, -0.7234553, 3.708255, 1, 0, 0.05882353, 1,
2.431992, 0.1537111, 1.955736, 1, 0, 0.05490196, 1,
2.496748, 0.2370607, 0.5892799, 1, 0, 0.04705882, 1,
2.549037, -1.823996, 3.727023, 1, 0, 0.04313726, 1,
2.554671, 0.3938915, 0.9661233, 1, 0, 0.03529412, 1,
2.617274, -2.119261, 3.268528, 1, 0, 0.03137255, 1,
2.622457, 0.02531783, 1.716075, 1, 0, 0.02352941, 1,
2.660579, -0.9261994, 1.220287, 1, 0, 0.01960784, 1,
2.839143, 1.827117, 1.507321, 1, 0, 0.01176471, 1,
3.017395, -1.410897, 0.3301635, 1, 0, 0.007843138, 1
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
-0.0689404, -3.750638, -6.975508, 0, -0.5, 0.5, 0.5,
-0.0689404, -3.750638, -6.975508, 1, -0.5, 0.5, 0.5,
-0.0689404, -3.750638, -6.975508, 1, 1.5, 0.5, 0.5,
-0.0689404, -3.750638, -6.975508, 0, 1.5, 0.5, 0.5
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
-4.201543, 0.3081247, -6.975508, 0, -0.5, 0.5, 0.5,
-4.201543, 0.3081247, -6.975508, 1, -0.5, 0.5, 0.5,
-4.201543, 0.3081247, -6.975508, 1, 1.5, 0.5, 0.5,
-4.201543, 0.3081247, -6.975508, 0, 1.5, 0.5, 0.5
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
-4.201543, -3.750638, -0.1191573, 0, -0.5, 0.5, 0.5,
-4.201543, -3.750638, -0.1191573, 1, -0.5, 0.5, 0.5,
-4.201543, -3.750638, -0.1191573, 1, 1.5, 0.5, 0.5,
-4.201543, -3.750638, -0.1191573, 0, 1.5, 0.5, 0.5
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
-3, -2.814, -5.393273,
3, -2.814, -5.393273,
-3, -2.814, -5.393273,
-3, -2.970107, -5.656979,
-2, -2.814, -5.393273,
-2, -2.970107, -5.656979,
-1, -2.814, -5.393273,
-1, -2.970107, -5.656979,
0, -2.814, -5.393273,
0, -2.970107, -5.656979,
1, -2.814, -5.393273,
1, -2.970107, -5.656979,
2, -2.814, -5.393273,
2, -2.970107, -5.656979,
3, -2.814, -5.393273,
3, -2.970107, -5.656979
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
-3, -3.282319, -6.18439, 0, -0.5, 0.5, 0.5,
-3, -3.282319, -6.18439, 1, -0.5, 0.5, 0.5,
-3, -3.282319, -6.18439, 1, 1.5, 0.5, 0.5,
-3, -3.282319, -6.18439, 0, 1.5, 0.5, 0.5,
-2, -3.282319, -6.18439, 0, -0.5, 0.5, 0.5,
-2, -3.282319, -6.18439, 1, -0.5, 0.5, 0.5,
-2, -3.282319, -6.18439, 1, 1.5, 0.5, 0.5,
-2, -3.282319, -6.18439, 0, 1.5, 0.5, 0.5,
-1, -3.282319, -6.18439, 0, -0.5, 0.5, 0.5,
-1, -3.282319, -6.18439, 1, -0.5, 0.5, 0.5,
-1, -3.282319, -6.18439, 1, 1.5, 0.5, 0.5,
-1, -3.282319, -6.18439, 0, 1.5, 0.5, 0.5,
0, -3.282319, -6.18439, 0, -0.5, 0.5, 0.5,
0, -3.282319, -6.18439, 1, -0.5, 0.5, 0.5,
0, -3.282319, -6.18439, 1, 1.5, 0.5, 0.5,
0, -3.282319, -6.18439, 0, 1.5, 0.5, 0.5,
1, -3.282319, -6.18439, 0, -0.5, 0.5, 0.5,
1, -3.282319, -6.18439, 1, -0.5, 0.5, 0.5,
1, -3.282319, -6.18439, 1, 1.5, 0.5, 0.5,
1, -3.282319, -6.18439, 0, 1.5, 0.5, 0.5,
2, -3.282319, -6.18439, 0, -0.5, 0.5, 0.5,
2, -3.282319, -6.18439, 1, -0.5, 0.5, 0.5,
2, -3.282319, -6.18439, 1, 1.5, 0.5, 0.5,
2, -3.282319, -6.18439, 0, 1.5, 0.5, 0.5,
3, -3.282319, -6.18439, 0, -0.5, 0.5, 0.5,
3, -3.282319, -6.18439, 1, -0.5, 0.5, 0.5,
3, -3.282319, -6.18439, 1, 1.5, 0.5, 0.5,
3, -3.282319, -6.18439, 0, 1.5, 0.5, 0.5
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
-3.247866, -2, -5.393273,
-3.247866, 3, -5.393273,
-3.247866, -2, -5.393273,
-3.406812, -2, -5.656979,
-3.247866, -1, -5.393273,
-3.406812, -1, -5.656979,
-3.247866, 0, -5.393273,
-3.406812, 0, -5.656979,
-3.247866, 1, -5.393273,
-3.406812, 1, -5.656979,
-3.247866, 2, -5.393273,
-3.406812, 2, -5.656979,
-3.247866, 3, -5.393273,
-3.406812, 3, -5.656979
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
-3.724705, -2, -6.18439, 0, -0.5, 0.5, 0.5,
-3.724705, -2, -6.18439, 1, -0.5, 0.5, 0.5,
-3.724705, -2, -6.18439, 1, 1.5, 0.5, 0.5,
-3.724705, -2, -6.18439, 0, 1.5, 0.5, 0.5,
-3.724705, -1, -6.18439, 0, -0.5, 0.5, 0.5,
-3.724705, -1, -6.18439, 1, -0.5, 0.5, 0.5,
-3.724705, -1, -6.18439, 1, 1.5, 0.5, 0.5,
-3.724705, -1, -6.18439, 0, 1.5, 0.5, 0.5,
-3.724705, 0, -6.18439, 0, -0.5, 0.5, 0.5,
-3.724705, 0, -6.18439, 1, -0.5, 0.5, 0.5,
-3.724705, 0, -6.18439, 1, 1.5, 0.5, 0.5,
-3.724705, 0, -6.18439, 0, 1.5, 0.5, 0.5,
-3.724705, 1, -6.18439, 0, -0.5, 0.5, 0.5,
-3.724705, 1, -6.18439, 1, -0.5, 0.5, 0.5,
-3.724705, 1, -6.18439, 1, 1.5, 0.5, 0.5,
-3.724705, 1, -6.18439, 0, 1.5, 0.5, 0.5,
-3.724705, 2, -6.18439, 0, -0.5, 0.5, 0.5,
-3.724705, 2, -6.18439, 1, -0.5, 0.5, 0.5,
-3.724705, 2, -6.18439, 1, 1.5, 0.5, 0.5,
-3.724705, 2, -6.18439, 0, 1.5, 0.5, 0.5,
-3.724705, 3, -6.18439, 0, -0.5, 0.5, 0.5,
-3.724705, 3, -6.18439, 1, -0.5, 0.5, 0.5,
-3.724705, 3, -6.18439, 1, 1.5, 0.5, 0.5,
-3.724705, 3, -6.18439, 0, 1.5, 0.5, 0.5
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
-3.247866, -2.814, -4,
-3.247866, -2.814, 4,
-3.247866, -2.814, -4,
-3.406812, -2.970107, -4,
-3.247866, -2.814, -2,
-3.406812, -2.970107, -2,
-3.247866, -2.814, 0,
-3.406812, -2.970107, 0,
-3.247866, -2.814, 2,
-3.406812, -2.970107, 2,
-3.247866, -2.814, 4,
-3.406812, -2.970107, 4
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
-3.724705, -3.282319, -4, 0, -0.5, 0.5, 0.5,
-3.724705, -3.282319, -4, 1, -0.5, 0.5, 0.5,
-3.724705, -3.282319, -4, 1, 1.5, 0.5, 0.5,
-3.724705, -3.282319, -4, 0, 1.5, 0.5, 0.5,
-3.724705, -3.282319, -2, 0, -0.5, 0.5, 0.5,
-3.724705, -3.282319, -2, 1, -0.5, 0.5, 0.5,
-3.724705, -3.282319, -2, 1, 1.5, 0.5, 0.5,
-3.724705, -3.282319, -2, 0, 1.5, 0.5, 0.5,
-3.724705, -3.282319, 0, 0, -0.5, 0.5, 0.5,
-3.724705, -3.282319, 0, 1, -0.5, 0.5, 0.5,
-3.724705, -3.282319, 0, 1, 1.5, 0.5, 0.5,
-3.724705, -3.282319, 0, 0, 1.5, 0.5, 0.5,
-3.724705, -3.282319, 2, 0, -0.5, 0.5, 0.5,
-3.724705, -3.282319, 2, 1, -0.5, 0.5, 0.5,
-3.724705, -3.282319, 2, 1, 1.5, 0.5, 0.5,
-3.724705, -3.282319, 2, 0, 1.5, 0.5, 0.5,
-3.724705, -3.282319, 4, 0, -0.5, 0.5, 0.5,
-3.724705, -3.282319, 4, 1, -0.5, 0.5, 0.5,
-3.724705, -3.282319, 4, 1, 1.5, 0.5, 0.5,
-3.724705, -3.282319, 4, 0, 1.5, 0.5, 0.5
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
-3.247866, -2.814, -5.393273,
-3.247866, 3.43025, -5.393273,
-3.247866, -2.814, 5.154958,
-3.247866, 3.43025, 5.154958,
-3.247866, -2.814, -5.393273,
-3.247866, -2.814, 5.154958,
-3.247866, 3.43025, -5.393273,
-3.247866, 3.43025, 5.154958,
-3.247866, -2.814, -5.393273,
3.109985, -2.814, -5.393273,
-3.247866, -2.814, 5.154958,
3.109985, -2.814, 5.154958,
-3.247866, 3.43025, -5.393273,
3.109985, 3.43025, -5.393273,
-3.247866, 3.43025, 5.154958,
3.109985, 3.43025, 5.154958,
3.109985, -2.814, -5.393273,
3.109985, 3.43025, -5.393273,
3.109985, -2.814, 5.154958,
3.109985, 3.43025, 5.154958,
3.109985, -2.814, -5.393273,
3.109985, -2.814, 5.154958,
3.109985, 3.43025, -5.393273,
3.109985, 3.43025, 5.154958
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
var radius = 7.373537;
var distance = 32.8057;
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
mvMatrix.translate( 0.0689404, -0.3081247, 0.1191573 );
mvMatrix.scale( 1.253948, 1.276761, 0.7558057 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.8057);
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
puromycin_aminonucle<-read.table("puromycin_aminonucle.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-puromycin_aminonucle$V2
```

```
## Error in eval(expr, envir, enclos): object 'puromycin_aminonucle' not found
```

```r
y<-puromycin_aminonucle$V3
```

```
## Error in eval(expr, envir, enclos): object 'puromycin_aminonucle' not found
```

```r
z<-puromycin_aminonucle$V4
```

```
## Error in eval(expr, envir, enclos): object 'puromycin_aminonucle' not found
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
-3.155276, -1.234653, -0.6446648, 0, 0, 1, 1, 1,
-3.01211, -1.147987, -3.336431, 1, 0, 0, 1, 1,
-3.009904, -0.008529769, -1.624946, 1, 0, 0, 1, 1,
-2.772006, 0.09832726, -2.18635, 1, 0, 0, 1, 1,
-2.764931, 1.082813, -1.515177, 1, 0, 0, 1, 1,
-2.73411, -0.3233925, -3.406504, 1, 0, 0, 1, 1,
-2.56539, 0.07481422, -0.1668484, 0, 0, 0, 1, 1,
-2.554619, 0.05100963, -1.366124, 0, 0, 0, 1, 1,
-2.540899, 1.09515, -2.255492, 0, 0, 0, 1, 1,
-2.489195, -0.9957098, -2.059307, 0, 0, 0, 1, 1,
-2.390936, 0.007228084, -1.52654, 0, 0, 0, 1, 1,
-2.353935, -0.6059688, -2.153103, 0, 0, 0, 1, 1,
-2.329803, 0.2416576, -1.274217, 0, 0, 0, 1, 1,
-2.29936, -0.224754, 0.249324, 1, 1, 1, 1, 1,
-2.276152, -1.066991, -1.12322, 1, 1, 1, 1, 1,
-2.269041, -0.5651099, -1.215719, 1, 1, 1, 1, 1,
-2.24602, 0.3310078, -1.734954, 1, 1, 1, 1, 1,
-2.23992, 0.6781733, -3.198007, 1, 1, 1, 1, 1,
-2.227092, -0.4911332, -2.580884, 1, 1, 1, 1, 1,
-2.121648, 0.9715419, -2.828688, 1, 1, 1, 1, 1,
-2.076792, -0.9626707, -2.12508, 1, 1, 1, 1, 1,
-2.062726, -1.746502, -2.176659, 1, 1, 1, 1, 1,
-2.040298, 0.6412907, -1.283901, 1, 1, 1, 1, 1,
-2.021288, 0.02336791, -1.610924, 1, 1, 1, 1, 1,
-2.007698, 0.3385626, -1.321581, 1, 1, 1, 1, 1,
-1.964308, 0.3329612, -1.227458, 1, 1, 1, 1, 1,
-1.879673, 0.02810895, -2.55838, 1, 1, 1, 1, 1,
-1.855629, -1.339463, 0.004456238, 1, 1, 1, 1, 1,
-1.83787, -0.8146719, -2.053748, 0, 0, 1, 1, 1,
-1.821576, -1.495767, -1.971192, 1, 0, 0, 1, 1,
-1.810454, -1.164832, -4.835079, 1, 0, 0, 1, 1,
-1.809636, -1.285188, -1.846942, 1, 0, 0, 1, 1,
-1.795192, 1.077187, -1.742467, 1, 0, 0, 1, 1,
-1.774527, -0.7094977, -3.452717, 1, 0, 0, 1, 1,
-1.768923, 0.9720399, -1.906059, 0, 0, 0, 1, 1,
-1.758993, 1.484774, -2.738219, 0, 0, 0, 1, 1,
-1.755687, -1.036074, -2.310344, 0, 0, 0, 1, 1,
-1.752241, -1.127254, -2.167187, 0, 0, 0, 1, 1,
-1.748896, 0.4663641, -1.579033, 0, 0, 0, 1, 1,
-1.737756, 0.4141334, 0.07110926, 0, 0, 0, 1, 1,
-1.727825, -0.4774989, -2.594568, 0, 0, 0, 1, 1,
-1.713788, 0.1756977, -1.668257, 1, 1, 1, 1, 1,
-1.699135, -0.7352027, -1.335157, 1, 1, 1, 1, 1,
-1.69789, 0.6678559, 1.428233, 1, 1, 1, 1, 1,
-1.694574, -0.3255774, -1.307558, 1, 1, 1, 1, 1,
-1.690731, 1.561865, -1.750617, 1, 1, 1, 1, 1,
-1.690169, -0.5166314, -2.568174, 1, 1, 1, 1, 1,
-1.686826, 0.7101171, -3.362053, 1, 1, 1, 1, 1,
-1.68471, 2.164553, -0.721344, 1, 1, 1, 1, 1,
-1.682734, -0.7421094, -1.681352, 1, 1, 1, 1, 1,
-1.677034, -0.4013847, -1.769465, 1, 1, 1, 1, 1,
-1.666287, 1.062259, -0.817995, 1, 1, 1, 1, 1,
-1.656873, -0.1286181, -1.345896, 1, 1, 1, 1, 1,
-1.656092, 0.2269991, -0.2515831, 1, 1, 1, 1, 1,
-1.636506, 0.2057786, -0.554984, 1, 1, 1, 1, 1,
-1.629055, -0.5056152, -1.218835, 1, 1, 1, 1, 1,
-1.620651, -0.5359932, -0.992964, 0, 0, 1, 1, 1,
-1.607549, 0.8098953, -0.6315914, 1, 0, 0, 1, 1,
-1.603439, 1.024436, -1.784045, 1, 0, 0, 1, 1,
-1.594378, -0.1090752, -3.170374, 1, 0, 0, 1, 1,
-1.591164, -0.5212638, -2.994009, 1, 0, 0, 1, 1,
-1.583775, 0.9746036, -1.04441, 1, 0, 0, 1, 1,
-1.581986, -0.9948622, -2.172585, 0, 0, 0, 1, 1,
-1.572376, 0.7571013, -0.355393, 0, 0, 0, 1, 1,
-1.538619, -0.3543252, -0.1435305, 0, 0, 0, 1, 1,
-1.537477, 0.3370069, -1.84278, 0, 0, 0, 1, 1,
-1.531086, 1.1875, -0.9960813, 0, 0, 0, 1, 1,
-1.529911, 0.3960162, -2.353125, 0, 0, 0, 1, 1,
-1.524008, -0.406029, -3.152683, 0, 0, 0, 1, 1,
-1.522123, -1.003658, -3.022715, 1, 1, 1, 1, 1,
-1.522106, -0.2715893, 0.7598895, 1, 1, 1, 1, 1,
-1.513378, 0.02513257, -3.725725, 1, 1, 1, 1, 1,
-1.48618, 0.6715016, -0.972954, 1, 1, 1, 1, 1,
-1.465539, 0.223793, 0.5512401, 1, 1, 1, 1, 1,
-1.459149, 0.1286493, -0.1586601, 1, 1, 1, 1, 1,
-1.453225, -0.1640595, -1.614154, 1, 1, 1, 1, 1,
-1.452882, -0.4365389, -0.8992041, 1, 1, 1, 1, 1,
-1.446999, -0.02744489, -0.3619362, 1, 1, 1, 1, 1,
-1.442468, -0.6504697, -1.026713, 1, 1, 1, 1, 1,
-1.431144, -0.1223855, -2.671942, 1, 1, 1, 1, 1,
-1.426657, -0.3349397, -0.7546182, 1, 1, 1, 1, 1,
-1.424415, -0.9253075, -2.253287, 1, 1, 1, 1, 1,
-1.419731, -1.274364, -3.935114, 1, 1, 1, 1, 1,
-1.414426, -0.7869239, -1.864225, 1, 1, 1, 1, 1,
-1.394948, -1.315462, -1.401743, 0, 0, 1, 1, 1,
-1.387525, 1.047539, -0.7443146, 1, 0, 0, 1, 1,
-1.381585, 0.2363818, -0.915673, 1, 0, 0, 1, 1,
-1.380662, 0.529734, -1.49087, 1, 0, 0, 1, 1,
-1.369195, -1.183667, -3.148135, 1, 0, 0, 1, 1,
-1.364925, -1.069863, -1.039922, 1, 0, 0, 1, 1,
-1.355166, 0.04389324, -1.628573, 0, 0, 0, 1, 1,
-1.352027, 1.131506, -1.587749, 0, 0, 0, 1, 1,
-1.35064, -1.077999, -3.34713, 0, 0, 0, 1, 1,
-1.34203, 0.4198381, -1.436934, 0, 0, 0, 1, 1,
-1.334992, -1.343016, -4.276888, 0, 0, 0, 1, 1,
-1.330363, -0.7709222, -2.389488, 0, 0, 0, 1, 1,
-1.323035, 0.6451266, -1.688287, 0, 0, 0, 1, 1,
-1.320486, 0.3157416, -2.522908, 1, 1, 1, 1, 1,
-1.308747, 0.9866188, 0.2857468, 1, 1, 1, 1, 1,
-1.30572, 0.253916, -0.4654197, 1, 1, 1, 1, 1,
-1.29374, 0.5342039, -1.202965, 1, 1, 1, 1, 1,
-1.286129, -0.3757626, -3.850663, 1, 1, 1, 1, 1,
-1.285906, -1.43745, -2.755146, 1, 1, 1, 1, 1,
-1.274688, 0.1657677, -1.450836, 1, 1, 1, 1, 1,
-1.266116, 0.3643551, 0.2803698, 1, 1, 1, 1, 1,
-1.249047, -0.7961476, -3.584091, 1, 1, 1, 1, 1,
-1.24723, -0.06610042, -1.272829, 1, 1, 1, 1, 1,
-1.245861, -0.6013603, -2.051353, 1, 1, 1, 1, 1,
-1.24193, -0.2264178, -0.6423818, 1, 1, 1, 1, 1,
-1.239319, -0.5287917, -1.653687, 1, 1, 1, 1, 1,
-1.234722, 0.7551965, -2.004509, 1, 1, 1, 1, 1,
-1.225421, -1.063965, -2.227079, 1, 1, 1, 1, 1,
-1.223665, -0.3282185, -2.442262, 0, 0, 1, 1, 1,
-1.223481, -0.2113605, -1.18547, 1, 0, 0, 1, 1,
-1.214476, -0.08036027, -1.786074, 1, 0, 0, 1, 1,
-1.210693, -1.173762, -2.143008, 1, 0, 0, 1, 1,
-1.200417, -0.1790323, -1.663842, 1, 0, 0, 1, 1,
-1.198735, -0.6802341, -0.3491728, 1, 0, 0, 1, 1,
-1.194822, -0.766651, -1.839934, 0, 0, 0, 1, 1,
-1.194284, 0.09511714, -1.641343, 0, 0, 0, 1, 1,
-1.193038, -0.6043013, -0.9463958, 0, 0, 0, 1, 1,
-1.189482, 0.2281309, -2.454227, 0, 0, 0, 1, 1,
-1.178833, 0.7583321, -0.9812673, 0, 0, 0, 1, 1,
-1.171365, -1.941191, -3.133751, 0, 0, 0, 1, 1,
-1.158909, 0.6977935, -0.0900823, 0, 0, 0, 1, 1,
-1.155955, 0.1441708, -1.926017, 1, 1, 1, 1, 1,
-1.147994, -0.3629889, -2.139253, 1, 1, 1, 1, 1,
-1.144537, 0.8240324, -0.7251479, 1, 1, 1, 1, 1,
-1.140688, -1.268449, -3.267518, 1, 1, 1, 1, 1,
-1.138148, 0.4371432, -2.073456, 1, 1, 1, 1, 1,
-1.120463, -0.8566855, -1.785121, 1, 1, 1, 1, 1,
-1.117892, -1.115715, -1.475873, 1, 1, 1, 1, 1,
-1.11577, 1.235079, -1.098934, 1, 1, 1, 1, 1,
-1.114768, 0.06686504, -1.981086, 1, 1, 1, 1, 1,
-1.104936, -0.1672962, -1.492583, 1, 1, 1, 1, 1,
-1.103074, -0.338746, -3.571353, 1, 1, 1, 1, 1,
-1.093888, 0.6792328, -0.7862941, 1, 1, 1, 1, 1,
-1.089251, -0.4553343, -2.349368, 1, 1, 1, 1, 1,
-1.078564, 2.701079, -0.9439498, 1, 1, 1, 1, 1,
-1.061988, -1.486465, -1.93966, 1, 1, 1, 1, 1,
-1.060021, -0.2117539, -1.24745, 0, 0, 1, 1, 1,
-1.056351, -0.2615897, -1.690459, 1, 0, 0, 1, 1,
-1.050105, -1.099927, -2.487208, 1, 0, 0, 1, 1,
-1.031053, -0.89948, -3.059898, 1, 0, 0, 1, 1,
-1.029206, -0.02029049, -0.9998672, 1, 0, 0, 1, 1,
-1.025132, 0.2915067, -1.245704, 1, 0, 0, 1, 1,
-1.024715, 0.7119489, -1.602981, 0, 0, 0, 1, 1,
-1.020752, -0.7643457, -2.139325, 0, 0, 0, 1, 1,
-1.02017, -0.9887314, -3.480886, 0, 0, 0, 1, 1,
-1.003603, 1.57884, -1.622835, 0, 0, 0, 1, 1,
-0.9977754, -0.4961731, -1.49566, 0, 0, 0, 1, 1,
-0.9970949, 1.094796, -1.19829, 0, 0, 0, 1, 1,
-0.9954374, 1.6013, -0.988158, 0, 0, 0, 1, 1,
-0.9929233, 0.3127438, -0.8302928, 1, 1, 1, 1, 1,
-0.992419, 1.264096, -0.8922521, 1, 1, 1, 1, 1,
-0.9897514, -0.6714861, -2.034925, 1, 1, 1, 1, 1,
-0.988166, -0.8545682, -1.852103, 1, 1, 1, 1, 1,
-0.9857239, -1.769703, -3.405633, 1, 1, 1, 1, 1,
-0.9842292, -0.6723538, -2.25329, 1, 1, 1, 1, 1,
-0.9835222, -1.864319, -2.124358, 1, 1, 1, 1, 1,
-0.9766514, -1.605912, -1.947239, 1, 1, 1, 1, 1,
-0.9646255, 1.465151, -1.356153, 1, 1, 1, 1, 1,
-0.9636437, -0.7001091, -3.513476, 1, 1, 1, 1, 1,
-0.9618486, -0.08620182, -1.866458, 1, 1, 1, 1, 1,
-0.9593165, -0.09725013, -1.889522, 1, 1, 1, 1, 1,
-0.956588, -0.7050496, -5.239658, 1, 1, 1, 1, 1,
-0.9537363, 0.2964767, -0.7425467, 1, 1, 1, 1, 1,
-0.9524171, -0.9391479, -3.759993, 1, 1, 1, 1, 1,
-0.9503947, -2.170436, -3.066896, 0, 0, 1, 1, 1,
-0.9335409, 0.3168601, -2.271404, 1, 0, 0, 1, 1,
-0.932734, -0.2547638, -2.192755, 1, 0, 0, 1, 1,
-0.9324333, -1.896693, -2.250328, 1, 0, 0, 1, 1,
-0.9288153, 0.782384, -2.039069, 1, 0, 0, 1, 1,
-0.9281008, -0.6699972, -2.434035, 1, 0, 0, 1, 1,
-0.9271384, -0.6289509, -1.482971, 0, 0, 0, 1, 1,
-0.9254615, 1.356489, -0.8898246, 0, 0, 0, 1, 1,
-0.9235063, 0.6296909, 0.2802881, 0, 0, 0, 1, 1,
-0.9171378, -0.1033356, -1.483468, 0, 0, 0, 1, 1,
-0.9168432, 0.09927306, -0.1717121, 0, 0, 0, 1, 1,
-0.9167985, -0.6014749, -4.358575, 0, 0, 0, 1, 1,
-0.907821, -0.6552544, -0.7452874, 0, 0, 0, 1, 1,
-0.9054147, -0.6802912, -2.70982, 1, 1, 1, 1, 1,
-0.9035473, 1.953661, 0.8142053, 1, 1, 1, 1, 1,
-0.8990009, 0.08443849, -1.231207, 1, 1, 1, 1, 1,
-0.8956596, -1.006377, -1.640226, 1, 1, 1, 1, 1,
-0.8908182, -1.273079, -1.179068, 1, 1, 1, 1, 1,
-0.8906271, -1.479326, -2.585343, 1, 1, 1, 1, 1,
-0.8879867, 0.2196499, -1.632692, 1, 1, 1, 1, 1,
-0.8826795, -0.9443102, -1.373069, 1, 1, 1, 1, 1,
-0.8783436, -0.6524755, -2.122984, 1, 1, 1, 1, 1,
-0.8751385, 1.730513, -0.01322165, 1, 1, 1, 1, 1,
-0.8695791, 0.4413356, -1.222899, 1, 1, 1, 1, 1,
-0.8644563, -0.6159283, -1.62879, 1, 1, 1, 1, 1,
-0.8500272, 1.572241, -1.552551, 1, 1, 1, 1, 1,
-0.8491068, 1.244763, -2.239346, 1, 1, 1, 1, 1,
-0.843077, 0.6973262, 0.6184016, 1, 1, 1, 1, 1,
-0.8430171, -0.8810241, -2.846211, 0, 0, 1, 1, 1,
-0.8426347, 0.8434618, 0.613188, 1, 0, 0, 1, 1,
-0.8346875, -0.980489, 0.4557423, 1, 0, 0, 1, 1,
-0.8287522, 2.956633, 0.9588962, 1, 0, 0, 1, 1,
-0.8284855, 1.349641, 0.0758817, 1, 0, 0, 1, 1,
-0.8232087, 1.286002, -0.2123019, 1, 0, 0, 1, 1,
-0.8226492, 1.71224, 0.04286708, 0, 0, 0, 1, 1,
-0.8193944, 1.190024, -0.4606914, 0, 0, 0, 1, 1,
-0.8178181, 0.1701674, -2.466005, 0, 0, 0, 1, 1,
-0.8160417, -0.132856, 0.6557235, 0, 0, 0, 1, 1,
-0.8144676, 1.477126, 0.05364409, 0, 0, 0, 1, 1,
-0.8116172, -0.09375396, -2.114881, 0, 0, 0, 1, 1,
-0.8111381, 0.7396485, -0.9761706, 0, 0, 0, 1, 1,
-0.8108919, 0.2874874, -2.151738, 1, 1, 1, 1, 1,
-0.8055505, 0.318428, -0.6026651, 1, 1, 1, 1, 1,
-0.8039127, -1.061553, -2.528828, 1, 1, 1, 1, 1,
-0.7950234, 1.248504, -1.206233, 1, 1, 1, 1, 1,
-0.7940465, 0.7748104, -1.709377, 1, 1, 1, 1, 1,
-0.7935613, 1.649146, -0.7600005, 1, 1, 1, 1, 1,
-0.7912059, 0.7197026, -2.487513, 1, 1, 1, 1, 1,
-0.7857987, -0.06618837, -1.867548, 1, 1, 1, 1, 1,
-0.7834164, -0.7712472, -1.936154, 1, 1, 1, 1, 1,
-0.7819261, 2.256993, -1.152946, 1, 1, 1, 1, 1,
-0.7794973, 0.08067827, -0.9107461, 1, 1, 1, 1, 1,
-0.7786979, 1.232298, -1.680617, 1, 1, 1, 1, 1,
-0.773553, -0.4357137, -1.366013, 1, 1, 1, 1, 1,
-0.7709322, 0.1707851, -0.7264299, 1, 1, 1, 1, 1,
-0.7687031, -1.831718, -2.122743, 1, 1, 1, 1, 1,
-0.7596227, 0.7937993, -1.070555, 0, 0, 1, 1, 1,
-0.7539887, -1.297422, -2.91392, 1, 0, 0, 1, 1,
-0.7537402, -0.1172608, -1.997503, 1, 0, 0, 1, 1,
-0.7461461, -0.6492706, -2.886441, 1, 0, 0, 1, 1,
-0.7439344, 0.08569048, -0.7430845, 1, 0, 0, 1, 1,
-0.7403482, 0.9576432, -1.223029, 1, 0, 0, 1, 1,
-0.7312322, -0.1446619, -3.895725, 0, 0, 0, 1, 1,
-0.7311987, 0.2236277, -1.720134, 0, 0, 0, 1, 1,
-0.7304571, 0.2377611, -0.1948202, 0, 0, 0, 1, 1,
-0.7236029, 1.529762, -1.279344, 0, 0, 0, 1, 1,
-0.7205966, 0.5650122, -1.581221, 0, 0, 0, 1, 1,
-0.7200867, 0.03563018, -1.472086, 0, 0, 0, 1, 1,
-0.7190509, 0.9353969, -0.3486925, 0, 0, 0, 1, 1,
-0.7169634, 0.7433916, -0.1621777, 1, 1, 1, 1, 1,
-0.7081932, -0.4292004, -2.728635, 1, 1, 1, 1, 1,
-0.706762, -0.2129231, -3.414856, 1, 1, 1, 1, 1,
-0.7033563, 1.801602, -0.7577496, 1, 1, 1, 1, 1,
-0.7029502, -1.393692, -2.848032, 1, 1, 1, 1, 1,
-0.6949735, 0.9808189, -0.5203364, 1, 1, 1, 1, 1,
-0.6933883, -1.0482, -1.979753, 1, 1, 1, 1, 1,
-0.6928114, 0.04343117, -2.800336, 1, 1, 1, 1, 1,
-0.689311, 0.2509288, -2.709797, 1, 1, 1, 1, 1,
-0.6871859, 1.740063, -0.3896807, 1, 1, 1, 1, 1,
-0.6842801, 0.05335325, -1.48021, 1, 1, 1, 1, 1,
-0.6785675, 0.5150592, -1.730501, 1, 1, 1, 1, 1,
-0.667794, -0.7684888, -1.314212, 1, 1, 1, 1, 1,
-0.6664936, -1.352083, -2.920416, 1, 1, 1, 1, 1,
-0.6643892, -0.8101606, -3.559753, 1, 1, 1, 1, 1,
-0.6596353, 0.9754587, -3.034188, 0, 0, 1, 1, 1,
-0.6547819, -0.2287988, -1.940513, 1, 0, 0, 1, 1,
-0.6491556, -0.7922099, -1.295704, 1, 0, 0, 1, 1,
-0.6485679, -0.6564479, -0.6658606, 1, 0, 0, 1, 1,
-0.6465462, -0.489172, -2.017062, 1, 0, 0, 1, 1,
-0.6448157, -1.372022, -4.003778, 1, 0, 0, 1, 1,
-0.6408734, -0.1395288, -2.085827, 0, 0, 0, 1, 1,
-0.6391822, -0.956936, -2.42124, 0, 0, 0, 1, 1,
-0.638905, -0.9281611, -2.641892, 0, 0, 0, 1, 1,
-0.6384708, 0.08210638, -1.774056, 0, 0, 0, 1, 1,
-0.62923, -0.397754, -3.583953, 0, 0, 0, 1, 1,
-0.6253169, -1.08195, -0.8922368, 0, 0, 0, 1, 1,
-0.6240327, 1.272013, -0.636021, 0, 0, 0, 1, 1,
-0.6153998, 0.3081869, -2.766035, 1, 1, 1, 1, 1,
-0.613224, 1.522589, 1.662931, 1, 1, 1, 1, 1,
-0.6069846, -1.89458, -1.279317, 1, 1, 1, 1, 1,
-0.6018814, -0.07705565, -1.306536, 1, 1, 1, 1, 1,
-0.5968274, -1.219269, -2.257619, 1, 1, 1, 1, 1,
-0.5847616, -0.691, -0.9410064, 1, 1, 1, 1, 1,
-0.5832329, -0.8681442, -2.402563, 1, 1, 1, 1, 1,
-0.5809332, -0.4816582, -2.377656, 1, 1, 1, 1, 1,
-0.5800055, -1.234313, -2.547679, 1, 1, 1, 1, 1,
-0.5777583, -0.1924408, -1.771428, 1, 1, 1, 1, 1,
-0.5761442, -0.08612478, -1.587421, 1, 1, 1, 1, 1,
-0.5667748, 0.5454293, -0.9083844, 1, 1, 1, 1, 1,
-0.5600656, -1.719202, -3.388775, 1, 1, 1, 1, 1,
-0.5589029, -0.05667906, -1.633429, 1, 1, 1, 1, 1,
-0.5565048, -1.201142, -1.890652, 1, 1, 1, 1, 1,
-0.5563094, -0.01855411, -3.129966, 0, 0, 1, 1, 1,
-0.5390102, 0.06168603, -0.4722305, 1, 0, 0, 1, 1,
-0.5346414, -0.1864784, -3.345708, 1, 0, 0, 1, 1,
-0.5336813, -0.6343778, -1.625886, 1, 0, 0, 1, 1,
-0.5334817, 0.4304375, -2.571129, 1, 0, 0, 1, 1,
-0.5295463, 1.684781, 1.056368, 1, 0, 0, 1, 1,
-0.525381, -1.517249, -1.78151, 0, 0, 0, 1, 1,
-0.5247872, -1.698838, -3.930996, 0, 0, 0, 1, 1,
-0.524613, 0.9064413, -1.577067, 0, 0, 0, 1, 1,
-0.5216523, -0.437399, -3.580338, 0, 0, 0, 1, 1,
-0.5179294, -2.691413, -3.257301, 0, 0, 0, 1, 1,
-0.5150469, -0.9627675, -2.256263, 0, 0, 0, 1, 1,
-0.5118256, 1.184762, -2.040552, 0, 0, 0, 1, 1,
-0.5114907, -1.225522, -1.911294, 1, 1, 1, 1, 1,
-0.5110571, -0.2640086, -3.005542, 1, 1, 1, 1, 1,
-0.5087181, 0.2962495, -0.6963572, 1, 1, 1, 1, 1,
-0.5078991, 0.9187598, -1.654364, 1, 1, 1, 1, 1,
-0.5034421, 1.870935, -0.5644565, 1, 1, 1, 1, 1,
-0.5004892, 0.8342351, -1.621869, 1, 1, 1, 1, 1,
-0.500356, 0.1283069, -2.424284, 1, 1, 1, 1, 1,
-0.497998, 0.261246, -0.2722343, 1, 1, 1, 1, 1,
-0.4961522, -0.05917075, -2.043719, 1, 1, 1, 1, 1,
-0.4937495, 0.5160034, -1.587183, 1, 1, 1, 1, 1,
-0.4902798, 0.04840878, -0.2347512, 1, 1, 1, 1, 1,
-0.4892278, 1.684655, -1.151087, 1, 1, 1, 1, 1,
-0.4825949, -1.683591, -2.401251, 1, 1, 1, 1, 1,
-0.4811582, 1.00326, -0.7874516, 1, 1, 1, 1, 1,
-0.4809551, 0.9380118, 0.7154401, 1, 1, 1, 1, 1,
-0.4774258, -1.365608, -2.046745, 0, 0, 1, 1, 1,
-0.4773551, 0.4949071, -2.780718, 1, 0, 0, 1, 1,
-0.4717493, 0.06788412, -1.808444, 1, 0, 0, 1, 1,
-0.4705115, -0.03633074, -1.739715, 1, 0, 0, 1, 1,
-0.4647427, -1.349156, -3.991488, 1, 0, 0, 1, 1,
-0.4621148, 1.227997, 0.5719661, 1, 0, 0, 1, 1,
-0.4614484, 0.3461865, 0.02074068, 0, 0, 0, 1, 1,
-0.4610661, 0.1339392, -0.09341402, 0, 0, 0, 1, 1,
-0.4581087, 0.4251182, -1.867747, 0, 0, 0, 1, 1,
-0.4516519, -0.3566806, -3.36805, 0, 0, 0, 1, 1,
-0.4503546, 0.6808164, -0.6803149, 0, 0, 0, 1, 1,
-0.4477067, -0.6367468, -1.59516, 0, 0, 0, 1, 1,
-0.4469604, -1.359307, -4.940899, 0, 0, 0, 1, 1,
-0.446885, 0.2034378, -1.258249, 1, 1, 1, 1, 1,
-0.4440219, -0.01787716, -1.743871, 1, 1, 1, 1, 1,
-0.4437405, 2.552052, 0.9149839, 1, 1, 1, 1, 1,
-0.4433087, -1.22481, -2.691947, 1, 1, 1, 1, 1,
-0.4430383, -1.105932, -3.586212, 1, 1, 1, 1, 1,
-0.4424404, 0.3670903, -2.005759, 1, 1, 1, 1, 1,
-0.4412239, -0.2489541, -1.213404, 1, 1, 1, 1, 1,
-0.4399048, 0.2869596, -0.492835, 1, 1, 1, 1, 1,
-0.4376345, -0.1780937, -1.190993, 1, 1, 1, 1, 1,
-0.4334033, -0.2946147, -0.9072141, 1, 1, 1, 1, 1,
-0.4304752, 1.081637, 1.28221, 1, 1, 1, 1, 1,
-0.4248295, 0.5369728, -0.1593729, 1, 1, 1, 1, 1,
-0.4163652, -0.3051253, -4.443286, 1, 1, 1, 1, 1,
-0.4158735, 0.05163635, -2.081287, 1, 1, 1, 1, 1,
-0.4157693, 0.08393978, -2.8123, 1, 1, 1, 1, 1,
-0.4111924, -1.19113, -1.7435, 0, 0, 1, 1, 1,
-0.4085988, 0.7344332, -0.9602169, 1, 0, 0, 1, 1,
-0.405809, -1.116039, -2.315898, 1, 0, 0, 1, 1,
-0.4039596, 1.767419, 0.5344858, 1, 0, 0, 1, 1,
-0.4034772, 0.1875722, -1.742264, 1, 0, 0, 1, 1,
-0.4029624, -0.8080218, -2.809713, 1, 0, 0, 1, 1,
-0.3987358, 1.227172, -1.453475, 0, 0, 0, 1, 1,
-0.3924639, -1.10069, -3.347774, 0, 0, 0, 1, 1,
-0.3909227, -1.399648, -2.187174, 0, 0, 0, 1, 1,
-0.3906155, 0.1888493, -1.984981, 0, 0, 0, 1, 1,
-0.3793554, 2.166785, 1.357791, 0, 0, 0, 1, 1,
-0.3746097, 1.120419, -2.470195, 0, 0, 0, 1, 1,
-0.3713722, -0.5125317, -3.241019, 0, 0, 0, 1, 1,
-0.3629459, 0.7239684, -0.5077941, 1, 1, 1, 1, 1,
-0.3609914, -0.1899874, -3.244258, 1, 1, 1, 1, 1,
-0.3597825, -0.959682, -1.490775, 1, 1, 1, 1, 1,
-0.3583629, -1.408604, -4.822994, 1, 1, 1, 1, 1,
-0.3510606, 0.5892318, -0.6605582, 1, 1, 1, 1, 1,
-0.3443097, -0.2108877, -2.648515, 1, 1, 1, 1, 1,
-0.34132, 2.102817, -0.5151371, 1, 1, 1, 1, 1,
-0.3306998, -0.5442486, -1.708042, 1, 1, 1, 1, 1,
-0.3256232, -0.572341, -2.340238, 1, 1, 1, 1, 1,
-0.3222277, -1.196145, -1.716459, 1, 1, 1, 1, 1,
-0.3187736, 1.312164, -1.622845, 1, 1, 1, 1, 1,
-0.312373, 0.01614527, -2.657203, 1, 1, 1, 1, 1,
-0.3053136, 0.1685793, -0.9337774, 1, 1, 1, 1, 1,
-0.3046551, 0.3467744, -1.203123, 1, 1, 1, 1, 1,
-0.3020285, 0.09050146, 0.2083764, 1, 1, 1, 1, 1,
-0.2994646, -0.06961476, -1.829941, 0, 0, 1, 1, 1,
-0.2970861, -0.01999196, -1.89511, 1, 0, 0, 1, 1,
-0.2970618, 2.282324, -1.003484, 1, 0, 0, 1, 1,
-0.2953691, 0.9147713, 1.380975, 1, 0, 0, 1, 1,
-0.2938538, 0.3656213, -0.2754119, 1, 0, 0, 1, 1,
-0.2934974, 0.9849201, 0.1957039, 1, 0, 0, 1, 1,
-0.2897631, -0.1150271, -1.196942, 0, 0, 0, 1, 1,
-0.2883589, -0.05884946, -0.9209735, 0, 0, 0, 1, 1,
-0.2877164, -0.241115, -1.560194, 0, 0, 0, 1, 1,
-0.2795085, -0.07470379, -2.059112, 0, 0, 0, 1, 1,
-0.2767467, -0.161991, -4.072366, 0, 0, 0, 1, 1,
-0.2729654, -0.2822658, -3.450224, 0, 0, 0, 1, 1,
-0.2644967, -0.1979843, -2.153683, 0, 0, 0, 1, 1,
-0.2594611, 1.743826, -0.8318136, 1, 1, 1, 1, 1,
-0.2558531, 0.9582339, -0.2178224, 1, 1, 1, 1, 1,
-0.2542657, -1.50499, -3.563179, 1, 1, 1, 1, 1,
-0.2529279, -0.07840167, -0.6267717, 1, 1, 1, 1, 1,
-0.2507385, 1.030243, -2.438613, 1, 1, 1, 1, 1,
-0.2417023, -0.9027355, -3.117145, 1, 1, 1, 1, 1,
-0.2407758, -0.9577734, -2.906178, 1, 1, 1, 1, 1,
-0.240168, -0.7836326, -3.337463, 1, 1, 1, 1, 1,
-0.2371796, 0.3295932, -1.301913, 1, 1, 1, 1, 1,
-0.2321576, -1.801411, -1.569964, 1, 1, 1, 1, 1,
-0.2316582, 0.7587249, 0.01521616, 1, 1, 1, 1, 1,
-0.2282245, 0.1457937, -1.475338, 1, 1, 1, 1, 1,
-0.2218996, 1.60834, 0.5607144, 1, 1, 1, 1, 1,
-0.2204505, -0.6838934, -2.802032, 1, 1, 1, 1, 1,
-0.2148607, 0.5294355, -1.026702, 1, 1, 1, 1, 1,
-0.2123031, -1.770256, -4.717359, 0, 0, 1, 1, 1,
-0.2078138, 0.1000892, -0.5864536, 1, 0, 0, 1, 1,
-0.2037695, -0.5550695, -1.788541, 1, 0, 0, 1, 1,
-0.1942521, -0.4113328, -2.088901, 1, 0, 0, 1, 1,
-0.1940612, 0.723011, 0.8667231, 1, 0, 0, 1, 1,
-0.1938246, 0.9365619, -0.1757086, 1, 0, 0, 1, 1,
-0.1931548, 0.9595573, -0.4463737, 0, 0, 0, 1, 1,
-0.1911273, 0.5577775, -0.05792378, 0, 0, 0, 1, 1,
-0.1903216, 0.3497722, -0.4780056, 0, 0, 0, 1, 1,
-0.1894317, -0.2404595, -0.08385593, 0, 0, 0, 1, 1,
-0.1893079, 0.1921203, -0.1585777, 0, 0, 0, 1, 1,
-0.1884471, -0.5642411, -2.256707, 0, 0, 0, 1, 1,
-0.1883782, 1.940787, -2.594939, 0, 0, 0, 1, 1,
-0.1868235, -1.91839, -2.104368, 1, 1, 1, 1, 1,
-0.1844996, 0.7953086, -1.923141, 1, 1, 1, 1, 1,
-0.1835123, -0.04159162, -2.030603, 1, 1, 1, 1, 1,
-0.1820201, 0.6635265, -0.4625809, 1, 1, 1, 1, 1,
-0.179429, -0.7451282, -2.283195, 1, 1, 1, 1, 1,
-0.1793554, 1.559738, 1.12253, 1, 1, 1, 1, 1,
-0.1759271, -0.8183146, -3.201834, 1, 1, 1, 1, 1,
-0.1747835, 0.9710681, -1.064888, 1, 1, 1, 1, 1,
-0.1726021, -0.4521614, -0.9062092, 1, 1, 1, 1, 1,
-0.1715216, -0.6421098, -2.449759, 1, 1, 1, 1, 1,
-0.1691945, -1.698097, -2.541723, 1, 1, 1, 1, 1,
-0.1684835, -0.4617673, -2.91983, 1, 1, 1, 1, 1,
-0.1613558, 0.9970242, 0.7308241, 1, 1, 1, 1, 1,
-0.1526542, 0.3157251, -1.645703, 1, 1, 1, 1, 1,
-0.151386, 0.0788177, -1.014966, 1, 1, 1, 1, 1,
-0.1509694, -0.9114573, -2.033856, 0, 0, 1, 1, 1,
-0.1466247, -0.3101424, -1.396985, 1, 0, 0, 1, 1,
-0.1461448, -1.720007, -4.240133, 1, 0, 0, 1, 1,
-0.1460656, 0.1378167, -2.952469, 1, 0, 0, 1, 1,
-0.1419796, 0.7166256, 2.018201, 1, 0, 0, 1, 1,
-0.1412779, -0.06996356, -3.086208, 1, 0, 0, 1, 1,
-0.1395571, -0.040511, -0.6397287, 0, 0, 0, 1, 1,
-0.1332223, 0.466494, -0.04731309, 0, 0, 0, 1, 1,
-0.1329644, 0.01077611, -0.5000153, 0, 0, 0, 1, 1,
-0.1284384, 0.4326145, -2.482711, 0, 0, 0, 1, 1,
-0.1267048, -0.09742633, -2.159139, 0, 0, 0, 1, 1,
-0.1264765, -0.07280764, -2.79749, 0, 0, 0, 1, 1,
-0.1244027, 0.8677928, -0.06467475, 0, 0, 0, 1, 1,
-0.1209751, 0.03096809, -0.9695919, 1, 1, 1, 1, 1,
-0.1191989, 0.8530103, 0.05484703, 1, 1, 1, 1, 1,
-0.1172001, 0.01649517, -2.45711, 1, 1, 1, 1, 1,
-0.1170623, 0.4556024, -0.3419044, 1, 1, 1, 1, 1,
-0.113174, -0.6795142, -1.373767, 1, 1, 1, 1, 1,
-0.1099511, 1.603116, -1.148006, 1, 1, 1, 1, 1,
-0.1083072, -2.071616, -3.187954, 1, 1, 1, 1, 1,
-0.1061314, 1.89684, 1.750246, 1, 1, 1, 1, 1,
-0.1051768, 2.038157, -1.945919, 1, 1, 1, 1, 1,
-0.1043082, 0.3419171, -1.107138, 1, 1, 1, 1, 1,
-0.09046962, -0.7070347, -1.570779, 1, 1, 1, 1, 1,
-0.08394311, 0.196566, -0.07207178, 1, 1, 1, 1, 1,
-0.07965694, 1.955683, -1.0531, 1, 1, 1, 1, 1,
-0.07873455, 1.287729, 0.234042, 1, 1, 1, 1, 1,
-0.07308454, -0.3917055, -2.729358, 1, 1, 1, 1, 1,
-0.06551931, 0.1126845, 0.05312014, 0, 0, 1, 1, 1,
-0.06505961, -0.963387, -3.760434, 1, 0, 0, 1, 1,
-0.06195504, 0.3515715, -0.2107927, 1, 0, 0, 1, 1,
-0.05465258, 0.7722538, -1.126515, 1, 0, 0, 1, 1,
-0.05353706, 0.2476462, -0.8578655, 1, 0, 0, 1, 1,
-0.05300868, -0.04941957, -0.6167902, 1, 0, 0, 1, 1,
-0.05276996, -0.6388452, -3.929572, 0, 0, 0, 1, 1,
-0.04757379, 0.5887606, 0.9436543, 0, 0, 0, 1, 1,
-0.04309339, -1.754568, -3.335611, 0, 0, 0, 1, 1,
-0.04206166, 2.826489, 0.5239504, 0, 0, 0, 1, 1,
-0.04187869, 0.145901, 0.8218783, 0, 0, 0, 1, 1,
-0.0417712, -0.5905882, -2.485364, 0, 0, 0, 1, 1,
-0.04003498, -0.4331851, -4.066327, 0, 0, 0, 1, 1,
-0.0366221, -0.1816491, -2.734933, 1, 1, 1, 1, 1,
-0.03522392, -0.06318011, -1.987261, 1, 1, 1, 1, 1,
-0.03504563, 1.435766, 0.289097, 1, 1, 1, 1, 1,
-0.03386696, 0.5334747, -0.9681041, 1, 1, 1, 1, 1,
-0.03360926, 0.2948119, 0.4038551, 1, 1, 1, 1, 1,
-0.03199423, 0.9951828, -0.6210933, 1, 1, 1, 1, 1,
-0.02897426, -0.8289196, -3.969907, 1, 1, 1, 1, 1,
-0.02888016, 0.4849166, 0.5715656, 1, 1, 1, 1, 1,
-0.02872572, 0.5281415, 1.312762, 1, 1, 1, 1, 1,
-0.02539245, 0.07061668, 1.15958, 1, 1, 1, 1, 1,
-0.02153965, 2.356799, -0.5875919, 1, 1, 1, 1, 1,
-0.02118241, 0.3500982, 0.1537439, 1, 1, 1, 1, 1,
-0.02098293, -0.9172502, -3.323792, 1, 1, 1, 1, 1,
-0.02025923, -1.926212, -2.312367, 1, 1, 1, 1, 1,
-0.01732919, 0.4379324, 2.018116, 1, 1, 1, 1, 1,
-0.0150983, -1.587656, -2.812266, 0, 0, 1, 1, 1,
-0.014148, 2.408448, 1.840018, 1, 0, 0, 1, 1,
-0.01189209, -0.575087, -4.548204, 1, 0, 0, 1, 1,
-0.01051544, 0.9786243, -0.6159841, 1, 0, 0, 1, 1,
-0.007995626, 1.219143, 0.1328185, 1, 0, 0, 1, 1,
-0.006415089, -0.4812348, -4.900932, 1, 0, 0, 1, 1,
-0.005521089, 0.8443103, -0.708906, 0, 0, 0, 1, 1,
-0.005413805, -0.6981936, -3.830586, 0, 0, 0, 1, 1,
-0.00540594, -0.5114308, -2.666093, 0, 0, 0, 1, 1,
-0.001470873, 0.8980353, -0.03212651, 0, 0, 0, 1, 1,
-0.001367365, 0.2515446, -0.1993017, 0, 0, 0, 1, 1,
-0.0002355472, -1.205957, -2.657676, 0, 0, 0, 1, 1,
0.0009678295, 1.112069, -1.140011, 0, 0, 0, 1, 1,
0.004044635, -0.04382501, 3.284961, 1, 1, 1, 1, 1,
0.004355919, 0.4556701, 1.557569, 1, 1, 1, 1, 1,
0.005380449, 1.228361, -0.3227473, 1, 1, 1, 1, 1,
0.007913068, 0.6573085, -1.415118, 1, 1, 1, 1, 1,
0.01006498, -0.2729804, 3.63677, 1, 1, 1, 1, 1,
0.01008463, 1.623584, 0.1915147, 1, 1, 1, 1, 1,
0.01096595, 1.383949, 0.4465165, 1, 1, 1, 1, 1,
0.02359451, 0.03664478, -0.5261243, 1, 1, 1, 1, 1,
0.0296766, -0.1254571, 3.789576, 1, 1, 1, 1, 1,
0.03088161, 1.45926, -0.1037092, 1, 1, 1, 1, 1,
0.03307915, 1.519871, -1.543642, 1, 1, 1, 1, 1,
0.03806732, -0.5929905, 3.538351, 1, 1, 1, 1, 1,
0.0388447, 1.513302, -0.625051, 1, 1, 1, 1, 1,
0.03901723, -0.6334025, 2.735766, 1, 1, 1, 1, 1,
0.04877657, 1.269455, -0.3538281, 1, 1, 1, 1, 1,
0.0522564, 0.3739587, 0.2077518, 0, 0, 1, 1, 1,
0.05432309, -0.1237311, 2.525436, 1, 0, 0, 1, 1,
0.05589602, -1.434559, 4.056384, 1, 0, 0, 1, 1,
0.05751798, -1.106059, 3.782656, 1, 0, 0, 1, 1,
0.05861502, 0.7966175, -0.3441281, 1, 0, 0, 1, 1,
0.05938386, 0.5960312, -0.6367033, 1, 0, 0, 1, 1,
0.05962503, 0.09474074, -0.4555635, 0, 0, 0, 1, 1,
0.06150428, -0.0476997, 1.874735, 0, 0, 0, 1, 1,
0.06379954, 1.709514, 0.724237, 0, 0, 0, 1, 1,
0.06591877, 0.5712527, 1.327295, 0, 0, 0, 1, 1,
0.06870675, -1.029967, 2.31091, 0, 0, 0, 1, 1,
0.06968685, -1.292671, 4.364505, 0, 0, 0, 1, 1,
0.07822986, 0.3942879, 1.095664, 0, 0, 0, 1, 1,
0.07946651, -0.005493372, 1.830179, 1, 1, 1, 1, 1,
0.08030783, -0.2347289, 3.059633, 1, 1, 1, 1, 1,
0.08107182, -0.9252998, 4.687763, 1, 1, 1, 1, 1,
0.08140385, 0.2897069, 0.9448491, 1, 1, 1, 1, 1,
0.08211298, 0.5887328, -0.5857907, 1, 1, 1, 1, 1,
0.09474342, -0.6581953, 4.504449, 1, 1, 1, 1, 1,
0.1006344, 0.8788883, 0.4737651, 1, 1, 1, 1, 1,
0.1020538, 0.1325295, -1.357331, 1, 1, 1, 1, 1,
0.1028875, -1.130775, 2.841556, 1, 1, 1, 1, 1,
0.1042574, 2.432368, 0.4773364, 1, 1, 1, 1, 1,
0.1067723, 0.8696535, 1.399629, 1, 1, 1, 1, 1,
0.1116658, -1.553666, 2.645778, 1, 1, 1, 1, 1,
0.111679, 0.8618006, -1.963288, 1, 1, 1, 1, 1,
0.1135339, -2.170488, 1.150976, 1, 1, 1, 1, 1,
0.113958, -0.05982033, 2.394877, 1, 1, 1, 1, 1,
0.1148972, -1.765095, 2.745657, 0, 0, 1, 1, 1,
0.1190831, -0.4718682, 4.041001, 1, 0, 0, 1, 1,
0.1192477, 1.285814, 0.2186491, 1, 0, 0, 1, 1,
0.1220251, -0.1314376, 3.159542, 1, 0, 0, 1, 1,
0.122701, 0.07328351, 0.6839995, 1, 0, 0, 1, 1,
0.1246678, 0.3771555, -0.2044531, 1, 0, 0, 1, 1,
0.12672, 0.1901297, -0.5677337, 0, 0, 0, 1, 1,
0.1269181, 0.5482396, 0.665166, 0, 0, 0, 1, 1,
0.1279673, 2.18028, -0.7445837, 0, 0, 0, 1, 1,
0.1319462, -0.5780897, 3.545115, 0, 0, 0, 1, 1,
0.1334386, -0.3685254, 3.222738, 0, 0, 0, 1, 1,
0.136177, 1.889316, 1.400419, 0, 0, 0, 1, 1,
0.1369834, -0.2032889, 3.704688, 0, 0, 0, 1, 1,
0.1378977, 1.313261, 1.959445, 1, 1, 1, 1, 1,
0.1467465, 1.827698, 1.199092, 1, 1, 1, 1, 1,
0.1468931, -0.3640128, 3.354528, 1, 1, 1, 1, 1,
0.1482417, -0.7812971, 2.964327, 1, 1, 1, 1, 1,
0.1608707, 0.2167231, 0.9785475, 1, 1, 1, 1, 1,
0.1665747, -0.6390837, 3.970856, 1, 1, 1, 1, 1,
0.1676149, 0.4200512, 0.168498, 1, 1, 1, 1, 1,
0.1701388, 1.229913, 0.1351262, 1, 1, 1, 1, 1,
0.1701563, 0.9348023, 1.565948, 1, 1, 1, 1, 1,
0.1716172, 0.008699409, 2.011035, 1, 1, 1, 1, 1,
0.1723186, -1.195622, 1.527048, 1, 1, 1, 1, 1,
0.1755338, -0.1463943, 0.5321377, 1, 1, 1, 1, 1,
0.1774545, -0.4424348, 2.831151, 1, 1, 1, 1, 1,
0.1787043, -0.2625762, 2.504339, 1, 1, 1, 1, 1,
0.1835218, 2.012141, -0.6752188, 1, 1, 1, 1, 1,
0.188379, -1.280233, 1.19351, 0, 0, 1, 1, 1,
0.191826, 1.024443, -0.4498475, 1, 0, 0, 1, 1,
0.2013637, 0.4435521, -0.498808, 1, 0, 0, 1, 1,
0.2024253, 0.5471827, 1.066444, 1, 0, 0, 1, 1,
0.2047595, -1.682606, 3.887912, 1, 0, 0, 1, 1,
0.2068582, -0.2073891, 2.114972, 1, 0, 0, 1, 1,
0.2082277, -0.6117718, 4.755253, 0, 0, 0, 1, 1,
0.2125412, -0.3682675, 2.09154, 0, 0, 0, 1, 1,
0.2148903, -1.709602, 3.457733, 0, 0, 0, 1, 1,
0.2208039, 0.8901432, 0.05592765, 0, 0, 0, 1, 1,
0.2241374, -0.4337099, 2.574637, 0, 0, 0, 1, 1,
0.2324788, -1.06573, 3.335215, 0, 0, 0, 1, 1,
0.2334189, 0.4727077, 0.5812632, 0, 0, 0, 1, 1,
0.234819, -0.9669174, 2.011225, 1, 1, 1, 1, 1,
0.2404502, 0.2714311, 0.3853669, 1, 1, 1, 1, 1,
0.2406344, -0.7677968, 4.227024, 1, 1, 1, 1, 1,
0.2409784, -1.007641, 3.079362, 1, 1, 1, 1, 1,
0.246731, -1.099721, 3.599183, 1, 1, 1, 1, 1,
0.248929, 0.3696864, 1.559204, 1, 1, 1, 1, 1,
0.249572, 0.04734425, 2.068135, 1, 1, 1, 1, 1,
0.2500105, -0.4322586, 2.623362, 1, 1, 1, 1, 1,
0.2540008, -0.2848019, 2.475773, 1, 1, 1, 1, 1,
0.2630289, 0.3579354, -0.490745, 1, 1, 1, 1, 1,
0.2644207, -2.684901, 3.181321, 1, 1, 1, 1, 1,
0.2659622, -1.677051, 2.525424, 1, 1, 1, 1, 1,
0.2689301, -0.6561971, 3.844902, 1, 1, 1, 1, 1,
0.2692942, 0.1795234, 1.024882, 1, 1, 1, 1, 1,
0.2704117, 0.079851, 1.564697, 1, 1, 1, 1, 1,
0.276097, 0.332132, 1.118979, 0, 0, 1, 1, 1,
0.2761643, -0.5585647, 1.429398, 1, 0, 0, 1, 1,
0.276262, 0.3853578, 0.300699, 1, 0, 0, 1, 1,
0.2763604, -1.269438, 1.616596, 1, 0, 0, 1, 1,
0.2767281, 0.1037975, 1.888501, 1, 0, 0, 1, 1,
0.2826445, 0.0577535, 0.8851854, 1, 0, 0, 1, 1,
0.2830939, 0.3739104, 1.443375, 0, 0, 0, 1, 1,
0.2878723, 0.3272738, 2.818401, 0, 0, 0, 1, 1,
0.2911924, 0.2080036, 1.755329, 0, 0, 0, 1, 1,
0.2963698, -1.752676, 3.195852, 0, 0, 0, 1, 1,
0.3061439, -1.422731, 3.771135, 0, 0, 0, 1, 1,
0.3061865, 0.2128615, -0.068364, 0, 0, 0, 1, 1,
0.3071491, -0.8719106, 2.903784, 0, 0, 0, 1, 1,
0.308539, 1.956133, -0.1770298, 1, 1, 1, 1, 1,
0.3108006, -0.7812967, 1.995926, 1, 1, 1, 1, 1,
0.3115664, -0.3958354, 2.26624, 1, 1, 1, 1, 1,
0.3188241, -0.1793977, 0.2639554, 1, 1, 1, 1, 1,
0.3202015, -1.642634, 2.294043, 1, 1, 1, 1, 1,
0.3230287, 0.3282012, 0.6150032, 1, 1, 1, 1, 1,
0.3255919, 0.1992449, 2.134895, 1, 1, 1, 1, 1,
0.3272473, 1.385997, 1.625172, 1, 1, 1, 1, 1,
0.3276624, 0.8661379, -0.3675405, 1, 1, 1, 1, 1,
0.3277613, 1.775828, 0.729544, 1, 1, 1, 1, 1,
0.3365997, 0.5280756, 1.79637, 1, 1, 1, 1, 1,
0.3368116, 1.336126, 1.104811, 1, 1, 1, 1, 1,
0.3381664, -0.8565758, 3.593236, 1, 1, 1, 1, 1,
0.338215, 1.841017, -1.090147, 1, 1, 1, 1, 1,
0.3386853, 0.6368019, 1.772972, 1, 1, 1, 1, 1,
0.3390567, 0.4640975, 1.457724, 0, 0, 1, 1, 1,
0.3409197, 0.7255641, -0.8456381, 1, 0, 0, 1, 1,
0.3421804, -0.2679721, 1.850496, 1, 0, 0, 1, 1,
0.3428353, 1.184249, 0.5269912, 1, 0, 0, 1, 1,
0.3447551, -0.2552457, 3.951921, 1, 0, 0, 1, 1,
0.3492897, -0.8096643, 2.528162, 1, 0, 0, 1, 1,
0.3592751, -1.355202, 0.9891384, 0, 0, 0, 1, 1,
0.3596423, 0.9965861, -0.4244814, 0, 0, 0, 1, 1,
0.3624036, -2.281067, 1.306962, 0, 0, 0, 1, 1,
0.3628522, -0.6745002, 4.835688, 0, 0, 0, 1, 1,
0.373095, 0.3434803, 0.5368026, 0, 0, 0, 1, 1,
0.3733743, 1.648221, -0.1857833, 0, 0, 0, 1, 1,
0.3746193, -1.436993, 4.018011, 0, 0, 0, 1, 1,
0.3748229, -0.9545688, 3.098588, 1, 1, 1, 1, 1,
0.3751846, 0.9369649, -1.838892, 1, 1, 1, 1, 1,
0.3762685, -0.9835116, 2.238181, 1, 1, 1, 1, 1,
0.3778456, 0.4425359, -1.64367, 1, 1, 1, 1, 1,
0.3796304, 0.5066943, 1.387874, 1, 1, 1, 1, 1,
0.3816706, -1.158831, 2.081409, 1, 1, 1, 1, 1,
0.3826823, 0.6620247, -0.6709836, 1, 1, 1, 1, 1,
0.3859242, 2.261178, -0.4434261, 1, 1, 1, 1, 1,
0.3890983, -0.02415809, 3.742639, 1, 1, 1, 1, 1,
0.3910398, 0.7014332, 0.5498487, 1, 1, 1, 1, 1,
0.3960682, -1.103199, 3.017271, 1, 1, 1, 1, 1,
0.3986715, 1.988112, 0.2814379, 1, 1, 1, 1, 1,
0.4010666, 0.9354714, 0.5786003, 1, 1, 1, 1, 1,
0.4033412, 0.054051, 1.218197, 1, 1, 1, 1, 1,
0.4055284, 0.1983751, 2.253898, 1, 1, 1, 1, 1,
0.4083227, 0.932631, -0.1067268, 0, 0, 1, 1, 1,
0.4104374, 1.540758, 0.005203701, 1, 0, 0, 1, 1,
0.4119081, -0.3941211, 2.170144, 1, 0, 0, 1, 1,
0.413766, 1.308124, 2.211508, 1, 0, 0, 1, 1,
0.4219524, 0.5170125, 1.033873, 1, 0, 0, 1, 1,
0.4220406, 0.8538352, 0.9677763, 1, 0, 0, 1, 1,
0.423093, -0.3126437, 0.9462473, 0, 0, 0, 1, 1,
0.4270845, -1.33967, 4.674392, 0, 0, 0, 1, 1,
0.4284179, -1.151397, 2.107281, 0, 0, 0, 1, 1,
0.4348431, 1.535301, 1.880891, 0, 0, 0, 1, 1,
0.4353984, -0.2660338, 4.281791, 0, 0, 0, 1, 1,
0.4375, 1.286307, -0.4089442, 0, 0, 0, 1, 1,
0.4388169, -0.38064, 3.405499, 0, 0, 0, 1, 1,
0.4389625, -0.7706848, 3.635553, 1, 1, 1, 1, 1,
0.4416452, 1.16925, -1.136468, 1, 1, 1, 1, 1,
0.4418653, -1.074351, 3.424656, 1, 1, 1, 1, 1,
0.4469266, 1.349084, -0.7547935, 1, 1, 1, 1, 1,
0.4471449, -0.5137244, 0.7797884, 1, 1, 1, 1, 1,
0.4572616, 0.1449534, 1.264661, 1, 1, 1, 1, 1,
0.4585797, -0.6349015, 2.953574, 1, 1, 1, 1, 1,
0.4596497, -1.758498, 2.572276, 1, 1, 1, 1, 1,
0.4617525, -1.211161, 3.55611, 1, 1, 1, 1, 1,
0.463547, 0.3613685, 1.350983, 1, 1, 1, 1, 1,
0.4697509, 1.268013, 1.563079, 1, 1, 1, 1, 1,
0.4701797, -0.1346952, 2.179325, 1, 1, 1, 1, 1,
0.4719046, -0.7171298, 2.919474, 1, 1, 1, 1, 1,
0.4722787, 1.48899, 0.8792328, 1, 1, 1, 1, 1,
0.4764715, -1.160905, 2.187218, 1, 1, 1, 1, 1,
0.4787318, -1.017385, 2.478731, 0, 0, 1, 1, 1,
0.4790884, 0.9766038, 0.9059743, 1, 0, 0, 1, 1,
0.4826159, 0.0347467, 1.065628, 1, 0, 0, 1, 1,
0.4827719, 2.444017, -2.159415, 1, 0, 0, 1, 1,
0.4831696, 1.182997, 1.189216, 1, 0, 0, 1, 1,
0.4864576, 0.04798845, 2.142564, 1, 0, 0, 1, 1,
0.4900068, 0.5306186, -0.05292291, 0, 0, 0, 1, 1,
0.4976486, -0.2411045, 1.499413, 0, 0, 0, 1, 1,
0.4978147, -1.707039, 3.340575, 0, 0, 0, 1, 1,
0.5070401, -0.4042456, 3.509776, 0, 0, 0, 1, 1,
0.5124442, -1.043403, 4.304687, 0, 0, 0, 1, 1,
0.5146537, -1.074046, 3.737973, 0, 0, 0, 1, 1,
0.5159571, 0.2304962, 2.225339, 0, 0, 0, 1, 1,
0.5202653, -1.711551, 2.214087, 1, 1, 1, 1, 1,
0.523036, 0.8489877, 2.301673, 1, 1, 1, 1, 1,
0.5243878, 1.106555, -1.004364, 1, 1, 1, 1, 1,
0.5246552, 0.6035485, -0.9880435, 1, 1, 1, 1, 1,
0.5268089, 0.5567141, 0.7790226, 1, 1, 1, 1, 1,
0.5268202, -1.401253, 2.943104, 1, 1, 1, 1, 1,
0.5329366, 0.4719294, 0.9332065, 1, 1, 1, 1, 1,
0.5345445, -0.01717457, 1.406931, 1, 1, 1, 1, 1,
0.5348005, 2.365908, -0.7473902, 1, 1, 1, 1, 1,
0.5385521, 0.9717221, -0.1211978, 1, 1, 1, 1, 1,
0.5400643, 0.6185761, -1.247298, 1, 1, 1, 1, 1,
0.5407429, -0.2036646, 2.996946, 1, 1, 1, 1, 1,
0.5427208, 1.989426, 0.3641241, 1, 1, 1, 1, 1,
0.5444651, 1.34758, 0.8593798, 1, 1, 1, 1, 1,
0.5451992, 0.06525616, 1.831162, 1, 1, 1, 1, 1,
0.5530884, 0.6426474, 1.650935, 0, 0, 1, 1, 1,
0.5589978, 1.281995, 2.486213, 1, 0, 0, 1, 1,
0.5608792, -1.203837, 4.515664, 1, 0, 0, 1, 1,
0.5647297, 0.5248711, 1.339769, 1, 0, 0, 1, 1,
0.565263, -0.7627931, 2.019497, 1, 0, 0, 1, 1,
0.5670978, 0.8780198, 0.3547028, 1, 0, 0, 1, 1,
0.5683734, -0.1693535, 0.6473207, 0, 0, 0, 1, 1,
0.5709764, -1.285486, 4.49942, 0, 0, 0, 1, 1,
0.573718, -0.8669549, 2.482792, 0, 0, 0, 1, 1,
0.5796699, -0.07138446, 1.653789, 0, 0, 0, 1, 1,
0.5806806, 0.2004841, 1.173982, 0, 0, 0, 1, 1,
0.5816362, 0.4205862, 1.680175, 0, 0, 0, 1, 1,
0.5894069, -0.8868731, 2.835996, 0, 0, 0, 1, 1,
0.589753, -1.339081, 2.790093, 1, 1, 1, 1, 1,
0.5903802, 2.478385, 1.139673, 1, 1, 1, 1, 1,
0.5907007, -0.560239, 2.414616, 1, 1, 1, 1, 1,
0.5988067, 2.797669, -1.333119, 1, 1, 1, 1, 1,
0.59914, 0.1938369, -1.152343, 1, 1, 1, 1, 1,
0.6010252, 0.4927866, 1.056819, 1, 1, 1, 1, 1,
0.6033562, 1.496393, 0.7790132, 1, 1, 1, 1, 1,
0.6077942, 0.0387001, 0.7027711, 1, 1, 1, 1, 1,
0.6080918, 0.2189775, 1.964821, 1, 1, 1, 1, 1,
0.6131432, 1.403268, -0.4101525, 1, 1, 1, 1, 1,
0.6149079, -2.043009, 2.98514, 1, 1, 1, 1, 1,
0.6204641, 0.931284, -1.384278, 1, 1, 1, 1, 1,
0.621403, -1.322315, 1.570862, 1, 1, 1, 1, 1,
0.6317812, 1.731005, 1.051033, 1, 1, 1, 1, 1,
0.6371884, -0.9876087, 1.820397, 1, 1, 1, 1, 1,
0.6421699, 0.2081687, 0.5393596, 0, 0, 1, 1, 1,
0.6439395, 1.08021, 0.5842066, 1, 0, 0, 1, 1,
0.6445926, 0.3328206, 2.37111, 1, 0, 0, 1, 1,
0.6504677, 1.388057, 2.043849, 1, 0, 0, 1, 1,
0.6510293, -1.99431, 1.837068, 1, 0, 0, 1, 1,
0.6525806, 2.148491, -1.235036, 1, 0, 0, 1, 1,
0.6540644, 0.9808801, 1.339493, 0, 0, 0, 1, 1,
0.6559114, 1.604303, 0.2732065, 0, 0, 0, 1, 1,
0.6560864, -1.297605, 3.096363, 0, 0, 0, 1, 1,
0.6566121, 0.5740295, -0.1430173, 0, 0, 0, 1, 1,
0.6596171, 0.8881938, 1.167526, 0, 0, 0, 1, 1,
0.661259, -0.1347455, 0.9860268, 0, 0, 0, 1, 1,
0.6642277, 0.072279, 1.345525, 0, 0, 0, 1, 1,
0.6642467, 0.09969928, 2.436191, 1, 1, 1, 1, 1,
0.66774, 1.57638, 1.3915, 1, 1, 1, 1, 1,
0.6682718, 0.08738575, 1.079643, 1, 1, 1, 1, 1,
0.6692942, 0.4584956, 1.343767, 1, 1, 1, 1, 1,
0.6758788, -0.3346442, 2.057142, 1, 1, 1, 1, 1,
0.6796505, 0.5627189, -0.8242846, 1, 1, 1, 1, 1,
0.6799221, -0.003226923, 1.429775, 1, 1, 1, 1, 1,
0.6816853, -2.393829, 4.321062, 1, 1, 1, 1, 1,
0.6817061, 1.603482, 1.208957, 1, 1, 1, 1, 1,
0.6881151, -1.486184, 4.632792, 1, 1, 1, 1, 1,
0.6892183, 0.7974319, 1.102687, 1, 1, 1, 1, 1,
0.6893705, -0.3925297, 3.489454, 1, 1, 1, 1, 1,
0.6904995, 0.2033279, 1.322487, 1, 1, 1, 1, 1,
0.6949688, 1.088459, 1.066476, 1, 1, 1, 1, 1,
0.6982772, 0.2770551, 2.76635, 1, 1, 1, 1, 1,
0.7010717, 0.6555247, 0.6216925, 0, 0, 1, 1, 1,
0.7028531, 0.6244336, -0.09779935, 1, 0, 0, 1, 1,
0.7044276, -0.1619575, 1.365387, 1, 0, 0, 1, 1,
0.7056251, 0.5284938, 0.3575886, 1, 0, 0, 1, 1,
0.7116489, 0.7213857, 0.6754292, 1, 0, 0, 1, 1,
0.7171003, 0.0977146, 2.283202, 1, 0, 0, 1, 1,
0.7275871, -1.432636, 3.067524, 0, 0, 0, 1, 1,
0.7283799, -0.8723583, 2.364003, 0, 0, 0, 1, 1,
0.7299447, -0.9546102, 4.550945, 0, 0, 0, 1, 1,
0.7316068, 0.2897035, 0.7789641, 0, 0, 0, 1, 1,
0.7349714, 1.796404, 1.843213, 0, 0, 0, 1, 1,
0.7351655, -1.048479, 2.20735, 0, 0, 0, 1, 1,
0.7379196, 0.5085377, -0.06379169, 0, 0, 0, 1, 1,
0.7405776, -0.2852999, 5.001343, 1, 1, 1, 1, 1,
0.749009, -1.333898, 3.255651, 1, 1, 1, 1, 1,
0.75109, 0.3602439, 0.6144695, 1, 1, 1, 1, 1,
0.7531999, -0.718124, 2.305026, 1, 1, 1, 1, 1,
0.7596226, -1.879444, 3.26919, 1, 1, 1, 1, 1,
0.7648627, -0.5221361, 3.174627, 1, 1, 1, 1, 1,
0.7652785, 0.7369456, 0.5284184, 1, 1, 1, 1, 1,
0.7668921, -1.196363, 0.873907, 1, 1, 1, 1, 1,
0.767139, 1.213314, 2.250838, 1, 1, 1, 1, 1,
0.7690124, 0.837715, 0.5673762, 1, 1, 1, 1, 1,
0.7699214, 0.9214478, 1.070976, 1, 1, 1, 1, 1,
0.7713507, -0.1488249, 1.766824, 1, 1, 1, 1, 1,
0.7730556, 0.7058466, 1.420862, 1, 1, 1, 1, 1,
0.777386, 0.9517941, 0.5639945, 1, 1, 1, 1, 1,
0.7791617, 0.697401, 1.324307, 1, 1, 1, 1, 1,
0.7805817, -0.03322209, 0.3807319, 0, 0, 1, 1, 1,
0.7854573, -0.4654487, 1.173393, 1, 0, 0, 1, 1,
0.795541, -0.4941818, 0.8806884, 1, 0, 0, 1, 1,
0.8013813, 0.649806, 1.206777, 1, 0, 0, 1, 1,
0.8025888, 1.691798, -0.1946902, 1, 0, 0, 1, 1,
0.8065967, 1.667414, -0.2866595, 1, 0, 0, 1, 1,
0.8110494, 0.9787468, 0.6350571, 0, 0, 0, 1, 1,
0.8126438, 1.212094, 1.440428, 0, 0, 0, 1, 1,
0.8131633, -0.6480219, 0.6669598, 0, 0, 0, 1, 1,
0.8247072, 0.5711164, 1.647531, 0, 0, 0, 1, 1,
0.8327635, -0.05160467, 2.079447, 0, 0, 0, 1, 1,
0.8337029, -0.7663282, 2.878644, 0, 0, 0, 1, 1,
0.8367467, -0.298632, 2.336019, 0, 0, 0, 1, 1,
0.8388339, -0.1688367, 3.136692, 1, 1, 1, 1, 1,
0.8398471, -0.3531044, 1.583744, 1, 1, 1, 1, 1,
0.8408328, -0.6984357, 0.3572021, 1, 1, 1, 1, 1,
0.8452135, 0.09852631, 1.230191, 1, 1, 1, 1, 1,
0.8473241, -1.131957, 1.457771, 1, 1, 1, 1, 1,
0.8532456, 0.5117528, 1.294409, 1, 1, 1, 1, 1,
0.856128, 1.030803, 0.6872712, 1, 1, 1, 1, 1,
0.8571165, -0.4096772, 2.519313, 1, 1, 1, 1, 1,
0.8600005, -1.095773, 2.344809, 1, 1, 1, 1, 1,
0.8640849, 0.5569884, 1.480443, 1, 1, 1, 1, 1,
0.872804, 1.265234, 0.9787863, 1, 1, 1, 1, 1,
0.873482, -0.2521731, 0.7972836, 1, 1, 1, 1, 1,
0.8784618, -1.905719, 2.686317, 1, 1, 1, 1, 1,
0.8793281, 0.1089402, 1.822415, 1, 1, 1, 1, 1,
0.8799331, -0.7462524, 0.6200152, 1, 1, 1, 1, 1,
0.8839283, -0.4753199, 2.890754, 0, 0, 1, 1, 1,
0.8892, -0.2313529, 1.613324, 1, 0, 0, 1, 1,
0.8989947, -1.372362, 2.510367, 1, 0, 0, 1, 1,
0.9020861, -0.8914922, 2.292723, 1, 0, 0, 1, 1,
0.9072211, 0.6391818, 1.459814, 1, 0, 0, 1, 1,
0.9096193, 0.727331, -0.9227663, 1, 0, 0, 1, 1,
0.9098638, 0.2145545, 1.881007, 0, 0, 0, 1, 1,
0.9117143, 2.236205, 0.3018901, 0, 0, 0, 1, 1,
0.9123638, 0.0285105, 0.9217345, 0, 0, 0, 1, 1,
0.9298451, -0.3200492, 3.565192, 0, 0, 0, 1, 1,
0.9319773, 1.767761, -0.5640661, 0, 0, 0, 1, 1,
0.9346055, -1.096589, 3.214347, 0, 0, 0, 1, 1,
0.941909, -0.1289762, 1.542047, 0, 0, 0, 1, 1,
0.9454895, -0.5654029, 0.6924676, 1, 1, 1, 1, 1,
0.9500418, -1.775578, 2.449182, 1, 1, 1, 1, 1,
0.9585167, 0.5915399, 1.800585, 1, 1, 1, 1, 1,
0.9589772, 1.875489, 2.162757, 1, 1, 1, 1, 1,
0.9614883, -0.331393, 0.8797005, 1, 1, 1, 1, 1,
0.9640343, -0.1132366, 2.972371, 1, 1, 1, 1, 1,
0.9690484, 1.670471, 1.690151, 1, 1, 1, 1, 1,
0.9702868, 0.4420537, 0.922344, 1, 1, 1, 1, 1,
0.9791768, 0.09188366, 1.795141, 1, 1, 1, 1, 1,
0.9796754, 1.658424, -0.7533213, 1, 1, 1, 1, 1,
0.9807215, -1.734974, 3.934845, 1, 1, 1, 1, 1,
0.9838035, -0.7006301, 3.958926, 1, 1, 1, 1, 1,
0.9842855, 0.2729904, 2.026856, 1, 1, 1, 1, 1,
0.9846573, -0.04448968, 1.347803, 1, 1, 1, 1, 1,
0.9855124, -0.106183, 1.681297, 1, 1, 1, 1, 1,
0.9859319, -0.03621577, 1.602441, 0, 0, 1, 1, 1,
0.9885648, 0.6316625, 0.1126698, 1, 0, 0, 1, 1,
0.9915999, -0.3639541, 1.447031, 1, 0, 0, 1, 1,
0.9985948, 0.2493041, 1.836805, 1, 0, 0, 1, 1,
1.004117, -1.45261, 2.753139, 1, 0, 0, 1, 1,
1.023401, -1.060534, 2.120564, 1, 0, 0, 1, 1,
1.024092, 0.7863854, 1.105924, 0, 0, 0, 1, 1,
1.02509, -0.3765062, 1.57547, 0, 0, 0, 1, 1,
1.026756, 0.8264812, 1.641525, 0, 0, 0, 1, 1,
1.038378, -1.030523, 4.43375, 0, 0, 0, 1, 1,
1.042181, 0.1946846, 1.577788, 0, 0, 0, 1, 1,
1.04599, 1.856264, -0.5427227, 0, 0, 0, 1, 1,
1.054057, 0.1851888, 2.632553, 0, 0, 0, 1, 1,
1.062723, -0.6075463, 4.230638, 1, 1, 1, 1, 1,
1.066753, 0.03342213, 2.073176, 1, 1, 1, 1, 1,
1.066994, -0.9844369, 2.030955, 1, 1, 1, 1, 1,
1.067376, 0.7614473, 1.344225, 1, 1, 1, 1, 1,
1.069237, -0.3771967, 1.563433, 1, 1, 1, 1, 1,
1.072323, 0.7452528, 0.3748425, 1, 1, 1, 1, 1,
1.073053, -0.213211, 0.2647218, 1, 1, 1, 1, 1,
1.081344, -0.3994272, 1.629417, 1, 1, 1, 1, 1,
1.082191, 0.8066992, 0.1347056, 1, 1, 1, 1, 1,
1.091639, -0.7384333, 0.5686039, 1, 1, 1, 1, 1,
1.092238, -0.05846221, 1.628258, 1, 1, 1, 1, 1,
1.10081, 0.08364664, 2.040247, 1, 1, 1, 1, 1,
1.107708, -0.2051087, 2.067905, 1, 1, 1, 1, 1,
1.115933, 0.981573, 0.03845401, 1, 1, 1, 1, 1,
1.119021, 2.109514, 1.527557, 1, 1, 1, 1, 1,
1.123442, -0.7157074, 1.016588, 0, 0, 1, 1, 1,
1.123517, -1.111541, 3.980385, 1, 0, 0, 1, 1,
1.12444, 2.510292, 0.0239351, 1, 0, 0, 1, 1,
1.136982, 0.6408436, -0.866805, 1, 0, 0, 1, 1,
1.149146, 1.07068, -1.094268, 1, 0, 0, 1, 1,
1.151626, -0.8462495, 0.2578501, 1, 0, 0, 1, 1,
1.153803, -0.1444318, 3.335935, 0, 0, 0, 1, 1,
1.154892, -0.6750062, 1.858261, 0, 0, 0, 1, 1,
1.161295, -0.3988331, 1.803051, 0, 0, 0, 1, 1,
1.161989, -1.712898, 2.953916, 0, 0, 0, 1, 1,
1.162498, 0.6161565, 1.567706, 0, 0, 0, 1, 1,
1.164964, -0.5663245, 2.908413, 0, 0, 0, 1, 1,
1.165585, 0.08548453, 0.8859686, 0, 0, 0, 1, 1,
1.165615, -1.803386, 3.282349, 1, 1, 1, 1, 1,
1.166895, 1.088422, 0.4813282, 1, 1, 1, 1, 1,
1.172482, 0.2222223, 2.835429, 1, 1, 1, 1, 1,
1.178895, -0.6774596, 3.248359, 1, 1, 1, 1, 1,
1.180047, -2.723065, 0.6797571, 1, 1, 1, 1, 1,
1.189812, 0.5431586, 1.917375, 1, 1, 1, 1, 1,
1.192284, 1.059744, 1.336728, 1, 1, 1, 1, 1,
1.202571, -1.421883, 2.935188, 1, 1, 1, 1, 1,
1.206311, 1.643806, 1.140298, 1, 1, 1, 1, 1,
1.214146, -0.7074721, 1.398352, 1, 1, 1, 1, 1,
1.230367, 0.7833164, 1.736464, 1, 1, 1, 1, 1,
1.245054, 1.313742, 2.312869, 1, 1, 1, 1, 1,
1.245422, -0.5326647, 1.687975, 1, 1, 1, 1, 1,
1.253416, -2.223502, 3.426547, 1, 1, 1, 1, 1,
1.254142, 0.8527142, 0.2208271, 1, 1, 1, 1, 1,
1.258489, 0.02017105, 0.977118, 0, 0, 1, 1, 1,
1.263076, 0.8526257, 0.4902083, 1, 0, 0, 1, 1,
1.26636, -1.405679, 3.011577, 1, 0, 0, 1, 1,
1.267723, -0.4304592, 1.521806, 1, 0, 0, 1, 1,
1.269331, 2.93115, -0.7042378, 1, 0, 0, 1, 1,
1.277625, 1.031188, 2.121266, 1, 0, 0, 1, 1,
1.278396, -0.9288023, 3.572236, 0, 0, 0, 1, 1,
1.282355, -1.651604, 2.151999, 0, 0, 0, 1, 1,
1.288207, 0.7123511, 2.315658, 0, 0, 0, 1, 1,
1.288342, 1.67412, 1.518298, 0, 0, 0, 1, 1,
1.290926, 2.840924, 1.623281, 0, 0, 0, 1, 1,
1.296024, 0.050877, 2.084922, 0, 0, 0, 1, 1,
1.30207, -0.5729811, 1.734594, 0, 0, 0, 1, 1,
1.319172, -1.003057, 1.352478, 1, 1, 1, 1, 1,
1.32082, -2.242377, 2.039682, 1, 1, 1, 1, 1,
1.321649, -0.358494, 1.488808, 1, 1, 1, 1, 1,
1.330514, -0.7580516, 3.344042, 1, 1, 1, 1, 1,
1.332488, -1.137676, 2.001302, 1, 1, 1, 1, 1,
1.339522, 1.724192, 0.1608132, 1, 1, 1, 1, 1,
1.343896, 0.2435263, 1.641066, 1, 1, 1, 1, 1,
1.34596, 0.2060862, 1.927417, 1, 1, 1, 1, 1,
1.346312, -0.7126507, 3.670099, 1, 1, 1, 1, 1,
1.358327, -0.4984632, 2.761021, 1, 1, 1, 1, 1,
1.359502, 0.307969, 0.7595527, 1, 1, 1, 1, 1,
1.363921, -1.863721, 3.17814, 1, 1, 1, 1, 1,
1.364974, 1.037063, 1.043107, 1, 1, 1, 1, 1,
1.374148, 0.8458604, 1.21269, 1, 1, 1, 1, 1,
1.378946, 0.04572855, 3.139873, 1, 1, 1, 1, 1,
1.384821, 0.06745439, 0.6104749, 0, 0, 1, 1, 1,
1.385103, 0.4481511, 2.38235, 1, 0, 0, 1, 1,
1.391819, 0.9317051, 0.6543354, 1, 0, 0, 1, 1,
1.398718, 0.9203459, 2.289827, 1, 0, 0, 1, 1,
1.400657, -0.08032102, 0.6435069, 1, 0, 0, 1, 1,
1.411201, 0.7398129, 1.529741, 1, 0, 0, 1, 1,
1.429009, -2.025158, 3.390687, 0, 0, 0, 1, 1,
1.441025, 0.9976053, -1.224365, 0, 0, 0, 1, 1,
1.443154, 1.271458, 2.438144, 0, 0, 0, 1, 1,
1.45523, 3.339314, 0.005009332, 0, 0, 0, 1, 1,
1.465773, 0.8473341, 0.7861881, 0, 0, 0, 1, 1,
1.471874, 1.465302, 0.7719778, 0, 0, 0, 1, 1,
1.487978, 1.22917, 0.7015465, 0, 0, 0, 1, 1,
1.488079, -2.1875, 2.176875, 1, 1, 1, 1, 1,
1.491543, -0.9648356, 2.956452, 1, 1, 1, 1, 1,
1.498649, -0.5122016, 2.507537, 1, 1, 1, 1, 1,
1.499282, 0.7575511, 1.926329, 1, 1, 1, 1, 1,
1.503541, -0.3965338, 0.188017, 1, 1, 1, 1, 1,
1.508132, 0.2983584, 2.350978, 1, 1, 1, 1, 1,
1.514185, 0.5860327, 2.677173, 1, 1, 1, 1, 1,
1.522196, 0.766871, 1.79095, 1, 1, 1, 1, 1,
1.549912, 0.6021877, 0.008593609, 1, 1, 1, 1, 1,
1.559655, -0.6858566, 2.310505, 1, 1, 1, 1, 1,
1.562877, 0.05130669, 1.806521, 1, 1, 1, 1, 1,
1.587039, -0.1841076, 4.180122, 1, 1, 1, 1, 1,
1.59346, 1.558075, -0.4290858, 1, 1, 1, 1, 1,
1.599786, -1.386086, 2.839741, 1, 1, 1, 1, 1,
1.621744, -0.9388136, 2.335947, 1, 1, 1, 1, 1,
1.628084, 1.812911, 2.376069, 0, 0, 1, 1, 1,
1.638083, -1.217479, 2.425371, 1, 0, 0, 1, 1,
1.643167, -0.9853988, 1.214462, 1, 0, 0, 1, 1,
1.679078, 0.4491409, 1.50429, 1, 0, 0, 1, 1,
1.691688, -1.340983, 0.3229453, 1, 0, 0, 1, 1,
1.697296, -0.6893106, 1.409474, 1, 0, 0, 1, 1,
1.703034, 1.038709, 1.309717, 0, 0, 0, 1, 1,
1.716244, -1.451648, 2.16691, 0, 0, 0, 1, 1,
1.719808, -0.7618686, 2.763288, 0, 0, 0, 1, 1,
1.721142, -0.4191911, 0.1025304, 0, 0, 0, 1, 1,
1.734735, 1.844023, 2.553095, 0, 0, 0, 1, 1,
1.737676, 0.2091133, 1.227666, 0, 0, 0, 1, 1,
1.742134, -0.4018601, 1.067971, 0, 0, 0, 1, 1,
1.742372, -0.1175238, 0.7358319, 1, 1, 1, 1, 1,
1.749598, -0.6027282, 0.1149011, 1, 1, 1, 1, 1,
1.781203, -0.6350448, 0.2489211, 1, 1, 1, 1, 1,
1.790746, 1.130128, 2.414629, 1, 1, 1, 1, 1,
1.796512, -1.59642, 1.43962, 1, 1, 1, 1, 1,
1.814193, -1.931388, 1.039192, 1, 1, 1, 1, 1,
1.824726, -0.7341205, 0.2146687, 1, 1, 1, 1, 1,
1.826043, 0.1398267, 2.4551, 1, 1, 1, 1, 1,
1.839565, -0.9097204, 0.6708408, 1, 1, 1, 1, 1,
1.852247, -0.3644272, -0.3141235, 1, 1, 1, 1, 1,
1.853732, -0.2000262, -0.5578324, 1, 1, 1, 1, 1,
1.863041, 0.5592985, 1.815798, 1, 1, 1, 1, 1,
1.866574, -1.108117, 3.525004, 1, 1, 1, 1, 1,
1.874852, 1.327853, -0.01144638, 1, 1, 1, 1, 1,
1.944816, -0.6684539, 2.186585, 1, 1, 1, 1, 1,
1.949446, 1.336946, 2.562939, 0, 0, 1, 1, 1,
1.973078, 0.1443468, 0.5291064, 1, 0, 0, 1, 1,
1.976469, -0.9310252, 0.3706422, 1, 0, 0, 1, 1,
2.020881, -1.42622, 2.803136, 1, 0, 0, 1, 1,
2.053915, -0.3346591, 0.7486022, 1, 0, 0, 1, 1,
2.061592, 1.098833, 0.5042701, 1, 0, 0, 1, 1,
2.203741, -0.5618448, 0.723628, 0, 0, 0, 1, 1,
2.214127, -1.622568, 2.764151, 0, 0, 0, 1, 1,
2.346924, 0.3283994, 2.20423, 0, 0, 0, 1, 1,
2.382069, -1.666422, 1.685719, 0, 0, 0, 1, 1,
2.423783, -0.7234553, 3.708255, 0, 0, 0, 1, 1,
2.431992, 0.1537111, 1.955736, 0, 0, 0, 1, 1,
2.496748, 0.2370607, 0.5892799, 0, 0, 0, 1, 1,
2.549037, -1.823996, 3.727023, 1, 1, 1, 1, 1,
2.554671, 0.3938915, 0.9661233, 1, 1, 1, 1, 1,
2.617274, -2.119261, 3.268528, 1, 1, 1, 1, 1,
2.622457, 0.02531783, 1.716075, 1, 1, 1, 1, 1,
2.660579, -0.9261994, 1.220287, 1, 1, 1, 1, 1,
2.839143, 1.827117, 1.507321, 1, 1, 1, 1, 1,
3.017395, -1.410897, 0.3301635, 1, 1, 1, 1, 1
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
var radius = 9.230118;
var distance = 32.42039;
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
mvMatrix.translate( 0.06894016, -0.3081247, 0.1191573 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.42039);
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
