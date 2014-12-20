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
-3.275866, -0.3126675, -3.133699, 1, 0, 0, 1,
-3.185285, -1.38523, -1.740328, 1, 0.007843138, 0, 1,
-3.091082, 1.964898, 0.1276024, 1, 0.01176471, 0, 1,
-3.005439, 0.24092, -0.988295, 1, 0.01960784, 0, 1,
-2.700578, 0.4517144, -1.727641, 1, 0.02352941, 0, 1,
-2.632526, -0.4799794, -1.551578, 1, 0.03137255, 0, 1,
-2.554039, 0.4086221, -0.4828896, 1, 0.03529412, 0, 1,
-2.48552, 0.7128438, -2.721884, 1, 0.04313726, 0, 1,
-2.379298, -0.6306217, -0.6084357, 1, 0.04705882, 0, 1,
-2.342148, -0.08659655, -1.113755, 1, 0.05490196, 0, 1,
-2.333454, 0.07871796, -1.606029, 1, 0.05882353, 0, 1,
-2.296272, -0.2082993, -1.304423, 1, 0.06666667, 0, 1,
-2.296089, 2.804827, -0.4162159, 1, 0.07058824, 0, 1,
-2.294294, -1.291364, -1.375167, 1, 0.07843138, 0, 1,
-2.232605, 1.531111, -1.415242, 1, 0.08235294, 0, 1,
-2.17853, 0.09126712, -1.716883, 1, 0.09019608, 0, 1,
-2.077962, -0.0894273, -1.736605, 1, 0.09411765, 0, 1,
-2.057869, 1.206511, -2.093788, 1, 0.1019608, 0, 1,
-2.050852, 0.2050074, -1.218915, 1, 0.1098039, 0, 1,
-2.046475, -0.06822596, -1.546517, 1, 0.1137255, 0, 1,
-2.041494, -0.03961746, -3.552607, 1, 0.1215686, 0, 1,
-2.016777, 0.9377313, -3.732238, 1, 0.1254902, 0, 1,
-2.003175, -0.2090295, -3.13785, 1, 0.1333333, 0, 1,
-2.002556, 1.540365, -0.2695547, 1, 0.1372549, 0, 1,
-1.980972, -0.352613, -0.9062632, 1, 0.145098, 0, 1,
-1.962475, -0.7812946, -0.1652855, 1, 0.1490196, 0, 1,
-1.961766, -1.290212, -3.052353, 1, 0.1568628, 0, 1,
-1.957012, -1.949771, -1.596292, 1, 0.1607843, 0, 1,
-1.945223, 1.35744, -1.715224, 1, 0.1686275, 0, 1,
-1.941751, -0.8099555, -2.791939, 1, 0.172549, 0, 1,
-1.901021, 2.101079, -2.120502, 1, 0.1803922, 0, 1,
-1.890626, -0.9984631, -2.987228, 1, 0.1843137, 0, 1,
-1.851452, 0.8865588, -0.4246393, 1, 0.1921569, 0, 1,
-1.845677, -0.8471211, -4.183479, 1, 0.1960784, 0, 1,
-1.799837, 0.05735847, -1.515949, 1, 0.2039216, 0, 1,
-1.799581, 1.513062, -0.9039507, 1, 0.2117647, 0, 1,
-1.791924, -0.08045504, 0.5639024, 1, 0.2156863, 0, 1,
-1.761079, -0.4352508, -0.6031141, 1, 0.2235294, 0, 1,
-1.753023, -1.034345, -2.032783, 1, 0.227451, 0, 1,
-1.746032, -0.6906351, -1.391931, 1, 0.2352941, 0, 1,
-1.734467, -1.423577, -3.073698, 1, 0.2392157, 0, 1,
-1.732236, 1.460225, 0.3350373, 1, 0.2470588, 0, 1,
-1.721832, -0.1516959, -0.7997816, 1, 0.2509804, 0, 1,
-1.715132, -0.2508444, -2.662166, 1, 0.2588235, 0, 1,
-1.704526, -0.7294472, -2.370771, 1, 0.2627451, 0, 1,
-1.701516, -0.3911762, -2.176605, 1, 0.2705882, 0, 1,
-1.697307, 0.8170387, -0.08589323, 1, 0.2745098, 0, 1,
-1.692472, -1.047745, -2.781205, 1, 0.282353, 0, 1,
-1.679428, 0.773375, -1.500969, 1, 0.2862745, 0, 1,
-1.676119, 0.479445, -0.3524562, 1, 0.2941177, 0, 1,
-1.67219, 0.5426998, -0.9389747, 1, 0.3019608, 0, 1,
-1.655649, -1.022051, -1.69848, 1, 0.3058824, 0, 1,
-1.652777, 0.07523945, -1.42957, 1, 0.3137255, 0, 1,
-1.640087, 1.11831, -0.5438266, 1, 0.3176471, 0, 1,
-1.638541, 0.916779, 0.7283136, 1, 0.3254902, 0, 1,
-1.633208, 0.4584638, -1.25971, 1, 0.3294118, 0, 1,
-1.628384, 0.1009414, -3.004177, 1, 0.3372549, 0, 1,
-1.623982, -0.5499155, -1.426618, 1, 0.3411765, 0, 1,
-1.621826, 0.3907211, -0.4566647, 1, 0.3490196, 0, 1,
-1.617808, -1.680143, -2.727356, 1, 0.3529412, 0, 1,
-1.609036, -0.3285139, 1.564227, 1, 0.3607843, 0, 1,
-1.601008, -0.3025068, -1.743953, 1, 0.3647059, 0, 1,
-1.596189, -1.270594, -2.738936, 1, 0.372549, 0, 1,
-1.587512, -1.520911, -2.211238, 1, 0.3764706, 0, 1,
-1.585767, 0.7290113, 0.382241, 1, 0.3843137, 0, 1,
-1.583569, 0.9806547, -1.525272, 1, 0.3882353, 0, 1,
-1.563076, 0.5631672, -2.199217, 1, 0.3960784, 0, 1,
-1.553801, -0.5782505, -2.416885, 1, 0.4039216, 0, 1,
-1.552974, -1.129769, -2.354196, 1, 0.4078431, 0, 1,
-1.550614, -2.646997, -1.107018, 1, 0.4156863, 0, 1,
-1.54357, 1.096208, -0.6822868, 1, 0.4196078, 0, 1,
-1.537334, -0.5666372, -4.601087, 1, 0.427451, 0, 1,
-1.531633, 1.14078, -1.536488, 1, 0.4313726, 0, 1,
-1.507505, 2.025222, -1.747166, 1, 0.4392157, 0, 1,
-1.492182, -0.2319344, -2.828639, 1, 0.4431373, 0, 1,
-1.483772, 0.3330379, -1.765717, 1, 0.4509804, 0, 1,
-1.465776, 1.308734, -2.285654, 1, 0.454902, 0, 1,
-1.461728, 0.07560635, 0.1556625, 1, 0.4627451, 0, 1,
-1.453271, 0.8604384, 0.1915246, 1, 0.4666667, 0, 1,
-1.445349, 0.1908795, -1.571421, 1, 0.4745098, 0, 1,
-1.437283, 1.038459, -1.602955, 1, 0.4784314, 0, 1,
-1.435536, -0.4120146, -0.1951526, 1, 0.4862745, 0, 1,
-1.431478, -0.5940844, -2.101004, 1, 0.4901961, 0, 1,
-1.430344, 0.9846745, -0.689535, 1, 0.4980392, 0, 1,
-1.423907, -1.110367, -2.320422, 1, 0.5058824, 0, 1,
-1.422565, -1.791228, -2.337448, 1, 0.509804, 0, 1,
-1.418923, 0.4856741, -1.863716, 1, 0.5176471, 0, 1,
-1.409385, -0.5170304, -3.214827, 1, 0.5215687, 0, 1,
-1.409035, -0.7829471, -1.64319, 1, 0.5294118, 0, 1,
-1.406445, -1.5758, -2.949043, 1, 0.5333334, 0, 1,
-1.40505, 0.1111793, -3.492943, 1, 0.5411765, 0, 1,
-1.404225, 0.8962393, -1.088452, 1, 0.5450981, 0, 1,
-1.403515, -0.1716382, 0.7004222, 1, 0.5529412, 0, 1,
-1.390692, -0.4923882, -2.008963, 1, 0.5568628, 0, 1,
-1.388293, 0.5924629, -0.8279198, 1, 0.5647059, 0, 1,
-1.386763, 0.8867696, -1.282892, 1, 0.5686275, 0, 1,
-1.380732, -0.2364264, -1.568823, 1, 0.5764706, 0, 1,
-1.380021, 0.8178719, 0.3402029, 1, 0.5803922, 0, 1,
-1.361206, -0.8104525, -1.890644, 1, 0.5882353, 0, 1,
-1.357399, -0.8519707, -2.313058, 1, 0.5921569, 0, 1,
-1.346533, -0.3131898, -0.7566602, 1, 0.6, 0, 1,
-1.346144, -0.4233147, 0.031836, 1, 0.6078432, 0, 1,
-1.340213, 0.1347413, -3.254385, 1, 0.6117647, 0, 1,
-1.339629, 1.743881, -0.3615063, 1, 0.6196079, 0, 1,
-1.331906, -0.6216198, -2.763466, 1, 0.6235294, 0, 1,
-1.313433, -1.950431, -2.352378, 1, 0.6313726, 0, 1,
-1.311667, -1.479151, -2.920178, 1, 0.6352941, 0, 1,
-1.303308, -0.4825922, -2.724109, 1, 0.6431373, 0, 1,
-1.297763, -2.098924, -1.404155, 1, 0.6470588, 0, 1,
-1.274882, -0.07620023, -1.957419, 1, 0.654902, 0, 1,
-1.274442, -1.72394, -1.255515, 1, 0.6588235, 0, 1,
-1.273136, 2.257982, 0.1966553, 1, 0.6666667, 0, 1,
-1.26245, -2.292445, -2.131697, 1, 0.6705883, 0, 1,
-1.216635, 0.5552625, -1.664362, 1, 0.6784314, 0, 1,
-1.208758, 0.9325831, -1.443968, 1, 0.682353, 0, 1,
-1.203634, -0.7585074, -1.979555, 1, 0.6901961, 0, 1,
-1.197114, 0.7594454, 0.2422027, 1, 0.6941177, 0, 1,
-1.188107, 0.6764639, -1.27085, 1, 0.7019608, 0, 1,
-1.185328, -1.349566, -1.916591, 1, 0.7098039, 0, 1,
-1.183744, -1.132854, -3.574193, 1, 0.7137255, 0, 1,
-1.180582, 1.097242, -0.8044406, 1, 0.7215686, 0, 1,
-1.178013, -1.107502, -2.033559, 1, 0.7254902, 0, 1,
-1.176482, 0.3552129, -1.936923, 1, 0.7333333, 0, 1,
-1.165708, 1.241829, 0.07984959, 1, 0.7372549, 0, 1,
-1.164687, 0.3671433, -2.700675, 1, 0.7450981, 0, 1,
-1.162453, -0.3040572, -0.2103309, 1, 0.7490196, 0, 1,
-1.161398, -0.6509817, -3.248001, 1, 0.7568628, 0, 1,
-1.158489, -0.5117759, -3.280871, 1, 0.7607843, 0, 1,
-1.154276, 0.1158055, -1.794433, 1, 0.7686275, 0, 1,
-1.138949, -0.4030679, -1.677441, 1, 0.772549, 0, 1,
-1.138085, -1.284958, -2.652302, 1, 0.7803922, 0, 1,
-1.124047, -1.369549, -2.941719, 1, 0.7843137, 0, 1,
-1.114615, 0.7533294, -1.878738, 1, 0.7921569, 0, 1,
-1.112926, 0.8958837, -1.660848, 1, 0.7960784, 0, 1,
-1.11178, 0.005908117, -1.173151, 1, 0.8039216, 0, 1,
-1.110317, -0.2290688, -2.105907, 1, 0.8117647, 0, 1,
-1.109933, -1.622941, -2.323826, 1, 0.8156863, 0, 1,
-1.107117, -1.020908, -2.337606, 1, 0.8235294, 0, 1,
-1.096386, 0.493569, -1.504747, 1, 0.827451, 0, 1,
-1.093682, 0.6793055, -0.8597602, 1, 0.8352941, 0, 1,
-1.074328, -0.4069922, -1.311693, 1, 0.8392157, 0, 1,
-1.073971, -1.802545, 0.1018464, 1, 0.8470588, 0, 1,
-1.066247, -0.6733915, -0.7979417, 1, 0.8509804, 0, 1,
-1.05554, -0.7146615, -2.338023, 1, 0.8588235, 0, 1,
-1.050036, -0.4385741, -0.4419242, 1, 0.8627451, 0, 1,
-1.040945, -0.09340496, -1.866221, 1, 0.8705882, 0, 1,
-1.036453, 0.3837688, -1.181819, 1, 0.8745098, 0, 1,
-1.032307, 1.47181, -0.5160964, 1, 0.8823529, 0, 1,
-1.028641, -0.554181, -0.6994225, 1, 0.8862745, 0, 1,
-1.02698, 1.339638, -1.331181, 1, 0.8941177, 0, 1,
-1.02285, 2.166545, -0.8802474, 1, 0.8980392, 0, 1,
-1.020759, 1.953861, 0.7022378, 1, 0.9058824, 0, 1,
-1.015998, 0.3330449, -1.64526, 1, 0.9137255, 0, 1,
-1.014899, -0.6831781, -2.508345, 1, 0.9176471, 0, 1,
-1.014005, -1.156508, -2.238244, 1, 0.9254902, 0, 1,
-1.011005, 0.007756662, -0.626978, 1, 0.9294118, 0, 1,
-1.010504, -1.422264, -0.7552465, 1, 0.9372549, 0, 1,
-1.00627, -0.1751866, -0.7535086, 1, 0.9411765, 0, 1,
-1.003974, 0.6925727, -2.318736, 1, 0.9490196, 0, 1,
-1.002946, 0.3426071, -1.750437, 1, 0.9529412, 0, 1,
-0.9933556, -0.3837741, -4.10584, 1, 0.9607843, 0, 1,
-0.9856287, 0.6655734, -0.496582, 1, 0.9647059, 0, 1,
-0.9812704, 1.083217, -0.2976649, 1, 0.972549, 0, 1,
-0.9808173, -0.08764786, -1.416741, 1, 0.9764706, 0, 1,
-0.9807138, 1.059811, -1.131175, 1, 0.9843137, 0, 1,
-0.9790614, -1.402743, -2.807063, 1, 0.9882353, 0, 1,
-0.9781879, 1.008964, -0.4489932, 1, 0.9960784, 0, 1,
-0.9721966, 0.5730985, -1.019467, 0.9960784, 1, 0, 1,
-0.9705361, 2.022802, 2.255991, 0.9921569, 1, 0, 1,
-0.9686098, 0.348129, -0.3189459, 0.9843137, 1, 0, 1,
-0.9653963, -1.383172, -1.060124, 0.9803922, 1, 0, 1,
-0.9588496, 0.4268517, -2.550068, 0.972549, 1, 0, 1,
-0.9579074, -0.8113922, -2.327853, 0.9686275, 1, 0, 1,
-0.9549444, 1.051548, -0.6253778, 0.9607843, 1, 0, 1,
-0.9543353, -0.2977541, -1.029691, 0.9568627, 1, 0, 1,
-0.9531893, 0.6899228, -0.6938955, 0.9490196, 1, 0, 1,
-0.9472883, 2.168707, 0.03099271, 0.945098, 1, 0, 1,
-0.946705, -1.175155, -3.355621, 0.9372549, 1, 0, 1,
-0.9418213, 0.03617422, -1.288192, 0.9333333, 1, 0, 1,
-0.9413633, -0.9975728, -2.096592, 0.9254902, 1, 0, 1,
-0.9365339, -0.6175696, -3.027623, 0.9215686, 1, 0, 1,
-0.9342913, 0.5517943, -0.4179008, 0.9137255, 1, 0, 1,
-0.9313125, 0.7522287, -1.820146, 0.9098039, 1, 0, 1,
-0.9299086, -0.1436954, -1.457339, 0.9019608, 1, 0, 1,
-0.9284205, 0.7011423, -0.6215343, 0.8941177, 1, 0, 1,
-0.9275995, 0.6440575, -0.2617736, 0.8901961, 1, 0, 1,
-0.9154382, -1.967032, -3.207738, 0.8823529, 1, 0, 1,
-0.914369, 2.586719, 1.485393, 0.8784314, 1, 0, 1,
-0.9126879, 1.837665, 0.3749796, 0.8705882, 1, 0, 1,
-0.9123765, -0.1996195, -2.337736, 0.8666667, 1, 0, 1,
-0.9078317, -0.2348936, -1.559133, 0.8588235, 1, 0, 1,
-0.9046988, 1.304019, -1.41977, 0.854902, 1, 0, 1,
-0.9038066, 0.3105619, -1.713933, 0.8470588, 1, 0, 1,
-0.898947, -1.232628, -1.063496, 0.8431373, 1, 0, 1,
-0.8947648, 0.5699747, 0.5668337, 0.8352941, 1, 0, 1,
-0.8944861, -0.2431148, -2.880411, 0.8313726, 1, 0, 1,
-0.8927311, -1.078152, -2.687757, 0.8235294, 1, 0, 1,
-0.8850132, 0.5951893, -0.813072, 0.8196079, 1, 0, 1,
-0.880223, -0.7248048, -3.451653, 0.8117647, 1, 0, 1,
-0.8796734, 0.9304513, 0.9040055, 0.8078431, 1, 0, 1,
-0.8792576, -1.048859, -3.249939, 0.8, 1, 0, 1,
-0.8789191, -1.680919, -3.603465, 0.7921569, 1, 0, 1,
-0.876962, 0.5377631, -0.8799154, 0.7882353, 1, 0, 1,
-0.8761905, 0.3897556, -1.94578, 0.7803922, 1, 0, 1,
-0.8751396, -0.3581656, -0.6983817, 0.7764706, 1, 0, 1,
-0.8721783, -0.6383234, -2.546176, 0.7686275, 1, 0, 1,
-0.8652006, 0.4794143, -1.637808, 0.7647059, 1, 0, 1,
-0.8631408, 0.5880329, -1.180197, 0.7568628, 1, 0, 1,
-0.8623783, 0.5261846, -0.4986114, 0.7529412, 1, 0, 1,
-0.8582246, -0.3790638, -2.243264, 0.7450981, 1, 0, 1,
-0.8511186, 0.2719723, -0.5495571, 0.7411765, 1, 0, 1,
-0.8475699, 1.826995, -1.211995, 0.7333333, 1, 0, 1,
-0.8458071, 0.2135794, 0.08404352, 0.7294118, 1, 0, 1,
-0.8388557, -2.435867, -3.69719, 0.7215686, 1, 0, 1,
-0.8388373, -1.27109, -1.511557, 0.7176471, 1, 0, 1,
-0.8381103, 0.4502198, 0.007007636, 0.7098039, 1, 0, 1,
-0.8337635, 1.799353, -1.017717, 0.7058824, 1, 0, 1,
-0.8321966, 1.053743, -0.9845264, 0.6980392, 1, 0, 1,
-0.830123, 1.978044, 0.4849608, 0.6901961, 1, 0, 1,
-0.8282411, -0.6143782, -2.52507, 0.6862745, 1, 0, 1,
-0.8278771, 0.007739183, -2.561111, 0.6784314, 1, 0, 1,
-0.8241602, -0.2436367, -1.609744, 0.6745098, 1, 0, 1,
-0.8220702, 0.6256819, 0.0227614, 0.6666667, 1, 0, 1,
-0.8139973, 0.1923364, -1.448212, 0.6627451, 1, 0, 1,
-0.8132189, -2.185722, -1.947688, 0.654902, 1, 0, 1,
-0.8086979, 0.6725866, 0.08200265, 0.6509804, 1, 0, 1,
-0.8043725, 0.02010176, -3.064752, 0.6431373, 1, 0, 1,
-0.7950403, 0.9553779, -1.899892, 0.6392157, 1, 0, 1,
-0.7938387, -0.1502583, -1.300888, 0.6313726, 1, 0, 1,
-0.7912822, 1.119795, 0.02980059, 0.627451, 1, 0, 1,
-0.7789358, 0.06593181, -1.594844, 0.6196079, 1, 0, 1,
-0.7778461, 1.264463, -1.328922, 0.6156863, 1, 0, 1,
-0.770057, 1.001506, -0.06381523, 0.6078432, 1, 0, 1,
-0.7663704, 1.169678, -2.226121, 0.6039216, 1, 0, 1,
-0.7619255, 0.03875583, -1.335372, 0.5960785, 1, 0, 1,
-0.759931, 1.121535, -0.8923846, 0.5882353, 1, 0, 1,
-0.7594603, -2.060327, -4.012177, 0.5843138, 1, 0, 1,
-0.7548994, -0.4864394, 0.4414121, 0.5764706, 1, 0, 1,
-0.7512219, 1.236748, -0.1379553, 0.572549, 1, 0, 1,
-0.748058, 0.2429528, -0.9788924, 0.5647059, 1, 0, 1,
-0.7430025, 1.180166, 0.02757241, 0.5607843, 1, 0, 1,
-0.7429436, -0.374411, -2.952716, 0.5529412, 1, 0, 1,
-0.7426673, -0.8968075, -2.84116, 0.5490196, 1, 0, 1,
-0.7354429, -0.4000117, -2.433035, 0.5411765, 1, 0, 1,
-0.7349168, -0.384856, -0.8955258, 0.5372549, 1, 0, 1,
-0.7338644, -1.230704, -4.242787, 0.5294118, 1, 0, 1,
-0.7315095, -0.489231, -1.915318, 0.5254902, 1, 0, 1,
-0.7285337, -0.8729025, -1.196176, 0.5176471, 1, 0, 1,
-0.7279395, -2.324248, -3.771623, 0.5137255, 1, 0, 1,
-0.7247585, 0.2417672, -1.175287, 0.5058824, 1, 0, 1,
-0.7195773, 0.838757, 0.1976087, 0.5019608, 1, 0, 1,
-0.7185965, 0.4695191, -1.038851, 0.4941176, 1, 0, 1,
-0.7137729, -0.4188788, -1.250201, 0.4862745, 1, 0, 1,
-0.713569, 1.413516, 0.2659672, 0.4823529, 1, 0, 1,
-0.7111727, -0.5382466, -2.792224, 0.4745098, 1, 0, 1,
-0.7035704, 0.4579674, -0.7475912, 0.4705882, 1, 0, 1,
-0.6956127, 0.4590051, -1.057152, 0.4627451, 1, 0, 1,
-0.6956097, 0.5138862, -0.5200088, 0.4588235, 1, 0, 1,
-0.6928697, -0.535297, -1.312181, 0.4509804, 1, 0, 1,
-0.6911557, -1.217597, -1.324306, 0.4470588, 1, 0, 1,
-0.6881557, -0.7518098, -1.774111, 0.4392157, 1, 0, 1,
-0.68112, -1.173812, -3.10311, 0.4352941, 1, 0, 1,
-0.6808675, 0.3663949, -0.6832059, 0.427451, 1, 0, 1,
-0.6796645, -0.9269253, -1.787626, 0.4235294, 1, 0, 1,
-0.6788608, 0.3972872, -1.266415, 0.4156863, 1, 0, 1,
-0.6721861, 1.374386, -0.8242369, 0.4117647, 1, 0, 1,
-0.6715389, 1.305073, -0.2257059, 0.4039216, 1, 0, 1,
-0.6696762, 0.01364672, 0.02761235, 0.3960784, 1, 0, 1,
-0.6692393, 0.91504, -1.160735, 0.3921569, 1, 0, 1,
-0.6684147, 0.6295332, -2.033918, 0.3843137, 1, 0, 1,
-0.6675246, 0.7921803, -0.2194818, 0.3803922, 1, 0, 1,
-0.666757, 0.7498725, -1.758209, 0.372549, 1, 0, 1,
-0.6656814, -0.8651012, -1.823186, 0.3686275, 1, 0, 1,
-0.6656373, -1.141744, -2.25254, 0.3607843, 1, 0, 1,
-0.6620245, -0.4149976, -1.292493, 0.3568628, 1, 0, 1,
-0.6619655, -0.05352198, -1.023796, 0.3490196, 1, 0, 1,
-0.6562819, -0.09370857, -0.9347637, 0.345098, 1, 0, 1,
-0.6561338, 0.4882767, -1.169012, 0.3372549, 1, 0, 1,
-0.6508675, -0.2622828, -2.785719, 0.3333333, 1, 0, 1,
-0.6497386, -0.6259309, -1.729339, 0.3254902, 1, 0, 1,
-0.647529, -1.019179, -4.031188, 0.3215686, 1, 0, 1,
-0.6462206, 1.157565, 0.3104021, 0.3137255, 1, 0, 1,
-0.6458833, 0.7416318, -0.09904038, 0.3098039, 1, 0, 1,
-0.6375583, 1.034032, 0.4470329, 0.3019608, 1, 0, 1,
-0.6335899, 2.372185, -1.929993, 0.2941177, 1, 0, 1,
-0.6266859, 1.3411, -2.426471, 0.2901961, 1, 0, 1,
-0.6216552, 0.3877392, 1.314209, 0.282353, 1, 0, 1,
-0.6123366, -0.04681269, -1.294585, 0.2784314, 1, 0, 1,
-0.61093, 0.1558852, -1.016928, 0.2705882, 1, 0, 1,
-0.6104442, -1.485963, -2.60466, 0.2666667, 1, 0, 1,
-0.6088791, 2.956827, 0.07198534, 0.2588235, 1, 0, 1,
-0.6064951, -1.885347, -3.882929, 0.254902, 1, 0, 1,
-0.6041954, -1.227978, -3.354108, 0.2470588, 1, 0, 1,
-0.6032267, -2.264396, -3.525972, 0.2431373, 1, 0, 1,
-0.5994138, -0.2578317, -3.674317, 0.2352941, 1, 0, 1,
-0.5959206, 1.845541, -1.57008, 0.2313726, 1, 0, 1,
-0.5874052, 0.009663548, -1.744613, 0.2235294, 1, 0, 1,
-0.5818495, 0.6704588, -1.443362, 0.2196078, 1, 0, 1,
-0.5793577, -0.1796557, -2.01853, 0.2117647, 1, 0, 1,
-0.5769213, 0.4475403, -2.810049, 0.2078431, 1, 0, 1,
-0.5744635, -0.7194702, -2.524895, 0.2, 1, 0, 1,
-0.571731, 0.3954928, -0.5381181, 0.1921569, 1, 0, 1,
-0.5664853, 0.2796504, -2.311372, 0.1882353, 1, 0, 1,
-0.566082, 0.3275631, -0.306257, 0.1803922, 1, 0, 1,
-0.5634106, -0.678912, -2.417842, 0.1764706, 1, 0, 1,
-0.5557667, 0.358079, -1.436961, 0.1686275, 1, 0, 1,
-0.5535621, -0.7318242, -3.246707, 0.1647059, 1, 0, 1,
-0.5534094, 0.9600585, 0.5383621, 0.1568628, 1, 0, 1,
-0.5531023, 0.3170256, -2.489845, 0.1529412, 1, 0, 1,
-0.5521836, -0.02996199, -1.931907, 0.145098, 1, 0, 1,
-0.5514924, 0.3922658, 1.384284, 0.1411765, 1, 0, 1,
-0.5434941, 1.14078, 0.2860218, 0.1333333, 1, 0, 1,
-0.5429844, 0.8991834, 1.311755, 0.1294118, 1, 0, 1,
-0.5361313, 0.7322429, -0.5559238, 0.1215686, 1, 0, 1,
-0.530524, -0.577002, -1.5449, 0.1176471, 1, 0, 1,
-0.5240988, 0.1449647, -0.175729, 0.1098039, 1, 0, 1,
-0.5229332, 0.13199, -0.1405039, 0.1058824, 1, 0, 1,
-0.5164554, -1.149672, -2.078631, 0.09803922, 1, 0, 1,
-0.5109233, 1.118533, -0.1480048, 0.09019608, 1, 0, 1,
-0.5068324, -0.1710923, -0.8802006, 0.08627451, 1, 0, 1,
-0.5033016, 0.2022718, -1.898383, 0.07843138, 1, 0, 1,
-0.5027676, 0.666936, -0.214282, 0.07450981, 1, 0, 1,
-0.4965159, -1.790701, -3.03971, 0.06666667, 1, 0, 1,
-0.4941683, 1.45502, -1.252719, 0.0627451, 1, 0, 1,
-0.4919147, 0.4984453, -1.566717, 0.05490196, 1, 0, 1,
-0.4905328, 0.8080034, -1.265133, 0.05098039, 1, 0, 1,
-0.4900162, -0.6368215, -2.435136, 0.04313726, 1, 0, 1,
-0.4899763, 0.1113794, -0.3195769, 0.03921569, 1, 0, 1,
-0.4866688, 0.8127865, 0.5370429, 0.03137255, 1, 0, 1,
-0.4816731, 1.388529, -0.9698181, 0.02745098, 1, 0, 1,
-0.4814292, -0.2622992, -1.744431, 0.01960784, 1, 0, 1,
-0.4791334, -0.8759837, -3.603287, 0.01568628, 1, 0, 1,
-0.4744239, -0.4311, -2.439082, 0.007843138, 1, 0, 1,
-0.4735547, -0.8845713, -1.832324, 0.003921569, 1, 0, 1,
-0.4708402, 0.3416761, -2.459993, 0, 1, 0.003921569, 1,
-0.4705832, -0.385491, -4.123125, 0, 1, 0.01176471, 1,
-0.4697434, -0.07107286, -2.198043, 0, 1, 0.01568628, 1,
-0.4624904, 0.441007, 0.4177785, 0, 1, 0.02352941, 1,
-0.4623429, -1.915109, -2.762238, 0, 1, 0.02745098, 1,
-0.4588853, -0.342355, -1.672849, 0, 1, 0.03529412, 1,
-0.4588817, -1.382073, -2.483428, 0, 1, 0.03921569, 1,
-0.4581624, -0.4644411, -1.582635, 0, 1, 0.04705882, 1,
-0.4531475, -1.215952, -0.8971869, 0, 1, 0.05098039, 1,
-0.4526137, 0.6601209, -0.6449013, 0, 1, 0.05882353, 1,
-0.4487973, -0.2583477, -0.4047318, 0, 1, 0.0627451, 1,
-0.4452661, 0.6644091, -0.4047624, 0, 1, 0.07058824, 1,
-0.4442749, -0.3793271, -2.728826, 0, 1, 0.07450981, 1,
-0.4427454, -1.149241, -1.473618, 0, 1, 0.08235294, 1,
-0.4426627, 1.118798, -0.8233603, 0, 1, 0.08627451, 1,
-0.440622, 0.6339241, 0.964924, 0, 1, 0.09411765, 1,
-0.4323915, -1.286719, -2.014784, 0, 1, 0.1019608, 1,
-0.426588, 0.5410229, -0.8023641, 0, 1, 0.1058824, 1,
-0.4241835, -0.6434701, 0.4369614, 0, 1, 0.1137255, 1,
-0.4186742, -0.5410069, -3.275577, 0, 1, 0.1176471, 1,
-0.4152331, 0.984512, 0.5754026, 0, 1, 0.1254902, 1,
-0.4146031, 1.233711, -2.346922, 0, 1, 0.1294118, 1,
-0.4117247, 1.336822, 0.3166917, 0, 1, 0.1372549, 1,
-0.4114884, -1.616374, -2.255948, 0, 1, 0.1411765, 1,
-0.4050768, -0.6280221, -0.8856746, 0, 1, 0.1490196, 1,
-0.4026416, -0.4299665, -3.683682, 0, 1, 0.1529412, 1,
-0.4001635, 0.6139784, -0.331884, 0, 1, 0.1607843, 1,
-0.3975936, -0.7497693, -3.024216, 0, 1, 0.1647059, 1,
-0.3942724, 1.365258, -0.8721581, 0, 1, 0.172549, 1,
-0.3906648, 1.189693, -0.6111346, 0, 1, 0.1764706, 1,
-0.3875548, -0.3193892, -1.243797, 0, 1, 0.1843137, 1,
-0.381328, 0.1868617, -3.599903, 0, 1, 0.1882353, 1,
-0.3791929, 0.2891767, -0.3716474, 0, 1, 0.1960784, 1,
-0.3734599, -1.572299, -1.419144, 0, 1, 0.2039216, 1,
-0.3728644, -0.07493345, -2.510446, 0, 1, 0.2078431, 1,
-0.3718845, 0.6360294, -0.486311, 0, 1, 0.2156863, 1,
-0.3666115, -0.6984684, -2.584629, 0, 1, 0.2196078, 1,
-0.3649759, 0.6844702, 0.4456937, 0, 1, 0.227451, 1,
-0.3647678, 0.8984095, 0.745306, 0, 1, 0.2313726, 1,
-0.3628391, -1.231007, -2.526463, 0, 1, 0.2392157, 1,
-0.3609457, 1.292916, 1.093245, 0, 1, 0.2431373, 1,
-0.3589494, 0.4341698, -0.9864329, 0, 1, 0.2509804, 1,
-0.3527593, 0.06575977, -1.873894, 0, 1, 0.254902, 1,
-0.3526985, -1.204751, -3.065243, 0, 1, 0.2627451, 1,
-0.3468689, 0.9682374, -0.177279, 0, 1, 0.2666667, 1,
-0.3315399, -0.02244941, -1.157241, 0, 1, 0.2745098, 1,
-0.3266252, 0.9059547, 1.392147, 0, 1, 0.2784314, 1,
-0.3243034, -1.165808, -3.50734, 0, 1, 0.2862745, 1,
-0.3231093, 0.9362582, -0.5221712, 0, 1, 0.2901961, 1,
-0.3160211, 0.6876401, -0.9892257, 0, 1, 0.2980392, 1,
-0.312826, -0.9242278, -4.479768, 0, 1, 0.3058824, 1,
-0.3098207, 0.4868327, -1.194517, 0, 1, 0.3098039, 1,
-0.3091805, 0.4429486, 1.311322, 0, 1, 0.3176471, 1,
-0.3085174, -1.184363, -1.95561, 0, 1, 0.3215686, 1,
-0.3083454, 1.571572, 0.2880324, 0, 1, 0.3294118, 1,
-0.3053864, -0.4663127, -3.666794, 0, 1, 0.3333333, 1,
-0.2982275, -0.08713383, -0.6987017, 0, 1, 0.3411765, 1,
-0.2961194, -0.7496595, -4.180483, 0, 1, 0.345098, 1,
-0.2940626, -1.855826, -3.624444, 0, 1, 0.3529412, 1,
-0.2940528, 1.022664, -1.18755, 0, 1, 0.3568628, 1,
-0.2917863, -0.5044083, -1.864836, 0, 1, 0.3647059, 1,
-0.2843676, -1.246645, -1.76489, 0, 1, 0.3686275, 1,
-0.2843399, -0.942253, -1.836794, 0, 1, 0.3764706, 1,
-0.2832349, -0.9040176, -4.122037, 0, 1, 0.3803922, 1,
-0.2773003, 0.6507347, -2.294779, 0, 1, 0.3882353, 1,
-0.2745863, -1.014473, -4.552639, 0, 1, 0.3921569, 1,
-0.2724526, 0.7232036, -2.284075, 0, 1, 0.4, 1,
-0.2714549, -0.1182087, -3.490851, 0, 1, 0.4078431, 1,
-0.2676082, 0.2206014, 0.2063131, 0, 1, 0.4117647, 1,
-0.2664691, -0.5358658, -2.279941, 0, 1, 0.4196078, 1,
-0.2663106, -0.1085071, -1.093395, 0, 1, 0.4235294, 1,
-0.265444, -1.852577, -2.663149, 0, 1, 0.4313726, 1,
-0.2579912, 1.930521, -0.7280819, 0, 1, 0.4352941, 1,
-0.2534033, -0.9085551, -2.371197, 0, 1, 0.4431373, 1,
-0.2498532, -0.6310722, -3.266962, 0, 1, 0.4470588, 1,
-0.2482519, 0.8990105, 0.1251104, 0, 1, 0.454902, 1,
-0.2471233, 0.06010627, -0.02809079, 0, 1, 0.4588235, 1,
-0.2443007, 0.6923043, -0.5214271, 0, 1, 0.4666667, 1,
-0.2401137, -1.025005, -3.584545, 0, 1, 0.4705882, 1,
-0.2392853, -0.2905964, -1.047932, 0, 1, 0.4784314, 1,
-0.2384452, -0.559788, -4.170195, 0, 1, 0.4823529, 1,
-0.2346782, 0.4261763, 0.7122415, 0, 1, 0.4901961, 1,
-0.2331125, 2.251611, -1.869535, 0, 1, 0.4941176, 1,
-0.2329549, 1.182284, -0.7806639, 0, 1, 0.5019608, 1,
-0.2316005, 1.826442, -1.753044, 0, 1, 0.509804, 1,
-0.2240704, 1.320145, -1.671968, 0, 1, 0.5137255, 1,
-0.2227389, 0.3934197, 1.872401, 0, 1, 0.5215687, 1,
-0.2183398, -0.06728765, -2.167226, 0, 1, 0.5254902, 1,
-0.2146114, 0.1772203, -0.9823385, 0, 1, 0.5333334, 1,
-0.2073957, -0.7808772, -3.238139, 0, 1, 0.5372549, 1,
-0.205257, -0.8039183, -1.595915, 0, 1, 0.5450981, 1,
-0.198976, -0.1465531, -1.903997, 0, 1, 0.5490196, 1,
-0.1973867, 1.118165, -0.6207159, 0, 1, 0.5568628, 1,
-0.195156, 2.039193, 0.8819742, 0, 1, 0.5607843, 1,
-0.1933264, 1.303149, -0.877297, 0, 1, 0.5686275, 1,
-0.1911738, -1.390943, -3.30433, 0, 1, 0.572549, 1,
-0.1909991, -0.8262739, -3.310891, 0, 1, 0.5803922, 1,
-0.1823189, -0.5423689, -2.139838, 0, 1, 0.5843138, 1,
-0.1741142, -1.595233, -2.965587, 0, 1, 0.5921569, 1,
-0.1734701, 0.0140751, -4.486586, 0, 1, 0.5960785, 1,
-0.1709149, 0.3144996, 0.09961246, 0, 1, 0.6039216, 1,
-0.1707204, 0.8791056, -0.8843675, 0, 1, 0.6117647, 1,
-0.166344, 1.353131, 1.970442, 0, 1, 0.6156863, 1,
-0.1656154, -0.9397506, -2.817176, 0, 1, 0.6235294, 1,
-0.1610397, 1.720054, -0.2630479, 0, 1, 0.627451, 1,
-0.1605671, -0.4587283, -3.385436, 0, 1, 0.6352941, 1,
-0.1551428, -1.54651, -2.044828, 0, 1, 0.6392157, 1,
-0.1496362, -1.13464, -4.15846, 0, 1, 0.6470588, 1,
-0.1482302, -1.356058, -4.471199, 0, 1, 0.6509804, 1,
-0.1478984, -0.9612705, -3.666872, 0, 1, 0.6588235, 1,
-0.1435624, -0.5834943, -2.933662, 0, 1, 0.6627451, 1,
-0.1432785, 1.311124, 0.7161054, 0, 1, 0.6705883, 1,
-0.1408271, -0.8684894, -3.397466, 0, 1, 0.6745098, 1,
-0.1395836, -1.804085, -2.563102, 0, 1, 0.682353, 1,
-0.1391488, 1.023953, 0.3643941, 0, 1, 0.6862745, 1,
-0.1365774, 1.079384, 0.1089704, 0, 1, 0.6941177, 1,
-0.1361134, -1.394325, -2.345728, 0, 1, 0.7019608, 1,
-0.1359867, -0.2637455, -2.933768, 0, 1, 0.7058824, 1,
-0.1326537, -2.576815, -2.303841, 0, 1, 0.7137255, 1,
-0.1295675, -0.6590334, -3.412697, 0, 1, 0.7176471, 1,
-0.1261805, -0.3121311, -1.70876, 0, 1, 0.7254902, 1,
-0.1215742, -0.700767, -2.855311, 0, 1, 0.7294118, 1,
-0.1140449, -0.6961145, -1.986138, 0, 1, 0.7372549, 1,
-0.1119299, 0.04505657, -0.6100483, 0, 1, 0.7411765, 1,
-0.1112583, -0.8967248, -3.250326, 0, 1, 0.7490196, 1,
-0.1110548, 0.1122589, -1.665782, 0, 1, 0.7529412, 1,
-0.1077289, 2.379772, 0.3004899, 0, 1, 0.7607843, 1,
-0.103113, 0.2238504, -0.5566376, 0, 1, 0.7647059, 1,
-0.1029535, 0.1527557, 0.08238928, 0, 1, 0.772549, 1,
-0.09476405, -0.4746688, -3.051481, 0, 1, 0.7764706, 1,
-0.09309895, 2.389856, -0.3166655, 0, 1, 0.7843137, 1,
-0.08775936, 0.8307918, 1.359947, 0, 1, 0.7882353, 1,
-0.08643722, -0.09118716, -2.462451, 0, 1, 0.7960784, 1,
-0.0852585, 0.05029834, -1.594928, 0, 1, 0.8039216, 1,
-0.08475387, -0.987406, -1.499033, 0, 1, 0.8078431, 1,
-0.08408932, -0.5468215, -1.252887, 0, 1, 0.8156863, 1,
-0.08362534, -1.414261, -3.860818, 0, 1, 0.8196079, 1,
-0.08041734, 0.01827971, -0.7680373, 0, 1, 0.827451, 1,
-0.08024177, -0.725692, -5.773101, 0, 1, 0.8313726, 1,
-0.07198533, -0.06331626, -2.676041, 0, 1, 0.8392157, 1,
-0.06897155, -1.470078, -1.986079, 0, 1, 0.8431373, 1,
-0.06834325, 0.8013169, 0.9013901, 0, 1, 0.8509804, 1,
-0.06719691, 0.3875525, -0.02098166, 0, 1, 0.854902, 1,
-0.0625615, 1.511039, -0.44259, 0, 1, 0.8627451, 1,
-0.05856092, 0.6918907, 0.03692945, 0, 1, 0.8666667, 1,
-0.05658893, 1.170336, -0.800593, 0, 1, 0.8745098, 1,
-0.05432747, -1.864093, -1.844967, 0, 1, 0.8784314, 1,
-0.05110448, 0.4687184, -1.549679, 0, 1, 0.8862745, 1,
-0.04945373, 0.8403376, 0.9380627, 0, 1, 0.8901961, 1,
-0.04901592, -0.8614177, -4.245134, 0, 1, 0.8980392, 1,
-0.04665639, 0.8538055, 2.371075, 0, 1, 0.9058824, 1,
-0.04525013, 0.1843751, 0.2137213, 0, 1, 0.9098039, 1,
-0.04483385, 0.6096283, 1.390642, 0, 1, 0.9176471, 1,
-0.04399698, 0.006915676, -0.3488024, 0, 1, 0.9215686, 1,
-0.03986536, -1.027808, -2.55053, 0, 1, 0.9294118, 1,
-0.03523587, -1.077778, -3.273348, 0, 1, 0.9333333, 1,
-0.03321717, 0.09136353, -1.311265, 0, 1, 0.9411765, 1,
-0.03138023, -1.277492, -2.766905, 0, 1, 0.945098, 1,
-0.02949865, 0.1210045, -0.5741219, 0, 1, 0.9529412, 1,
-0.02237402, 0.3447596, 0.482441, 0, 1, 0.9568627, 1,
-0.01475718, 0.8519503, 1.842787, 0, 1, 0.9647059, 1,
-0.009726915, 2.372611, 0.5133393, 0, 1, 0.9686275, 1,
-0.002450482, -0.5912463, -3.726852, 0, 1, 0.9764706, 1,
-0.001957821, 0.2693953, 1.58832, 0, 1, 0.9803922, 1,
-0.001804026, -1.449865, -2.874579, 0, 1, 0.9882353, 1,
0.001006225, 0.5340597, -0.01869706, 0, 1, 0.9921569, 1,
0.007776352, -0.3144686, 4.170546, 0, 1, 1, 1,
0.008816991, 1.165771, 0.6166814, 0, 0.9921569, 1, 1,
0.0111764, 0.1204382, 1.834391, 0, 0.9882353, 1, 1,
0.01194675, 0.09387704, -0.6966014, 0, 0.9803922, 1, 1,
0.01328744, -0.04995915, 3.613063, 0, 0.9764706, 1, 1,
0.01520753, -0.1058215, 2.640738, 0, 0.9686275, 1, 1,
0.01523346, 0.07499631, 0.901346, 0, 0.9647059, 1, 1,
0.0191107, -0.6737481, 3.241923, 0, 0.9568627, 1, 1,
0.02072709, -0.7403767, 3.278319, 0, 0.9529412, 1, 1,
0.02129274, -0.6555803, 2.508624, 0, 0.945098, 1, 1,
0.02217641, -0.217523, 2.959702, 0, 0.9411765, 1, 1,
0.02538116, 0.8265281, -0.9910736, 0, 0.9333333, 1, 1,
0.0263532, -0.5551392, 4.887058, 0, 0.9294118, 1, 1,
0.03230641, 3.101302, 0.8646498, 0, 0.9215686, 1, 1,
0.03327519, 0.6677536, 0.4321861, 0, 0.9176471, 1, 1,
0.03334285, -0.7612631, 2.76664, 0, 0.9098039, 1, 1,
0.0378947, -0.7893853, 2.459015, 0, 0.9058824, 1, 1,
0.03861629, 1.553419, 0.5657132, 0, 0.8980392, 1, 1,
0.03939134, 0.7348016, 0.09639733, 0, 0.8901961, 1, 1,
0.04392739, 0.4193845, -0.7351463, 0, 0.8862745, 1, 1,
0.0440155, 2.483412, 0.1267445, 0, 0.8784314, 1, 1,
0.04419952, -0.8399486, 2.653068, 0, 0.8745098, 1, 1,
0.04830655, -0.4476626, 2.771783, 0, 0.8666667, 1, 1,
0.05080775, 0.4382961, -1.272455, 0, 0.8627451, 1, 1,
0.05396397, 0.9171392, -0.5082223, 0, 0.854902, 1, 1,
0.05627871, -0.09506824, 2.577337, 0, 0.8509804, 1, 1,
0.05747117, 2.265739, -0.1143913, 0, 0.8431373, 1, 1,
0.05773821, 1.069494, 0.3910131, 0, 0.8392157, 1, 1,
0.05988547, 0.4051377, -1.64225, 0, 0.8313726, 1, 1,
0.06277756, 1.739429, -1.9894, 0, 0.827451, 1, 1,
0.06418673, 1.986089, -1.712482, 0, 0.8196079, 1, 1,
0.06428319, 0.1696958, 0.04205596, 0, 0.8156863, 1, 1,
0.06581141, -0.4412264, 3.540405, 0, 0.8078431, 1, 1,
0.0670766, -0.2791416, 1.637309, 0, 0.8039216, 1, 1,
0.0689479, -0.5039591, 4.449167, 0, 0.7960784, 1, 1,
0.07575435, -0.6077548, 2.21764, 0, 0.7882353, 1, 1,
0.07613569, 0.4303342, -0.7381287, 0, 0.7843137, 1, 1,
0.07767703, -0.1387789, 3.715464, 0, 0.7764706, 1, 1,
0.08123635, -0.3633671, 4.336105, 0, 0.772549, 1, 1,
0.0822706, -1.500952, 2.638528, 0, 0.7647059, 1, 1,
0.08454448, 1.339238, 0.4419133, 0, 0.7607843, 1, 1,
0.08464852, -1.136423, 3.065293, 0, 0.7529412, 1, 1,
0.08468686, 0.3142777, 1.947874, 0, 0.7490196, 1, 1,
0.09418543, -1.226291, 3.175927, 0, 0.7411765, 1, 1,
0.1007144, -0.2470897, 1.352897, 0, 0.7372549, 1, 1,
0.1019616, -0.1009816, 2.709756, 0, 0.7294118, 1, 1,
0.1034681, -0.8267063, 4.250847, 0, 0.7254902, 1, 1,
0.1037642, -0.1708816, 2.693388, 0, 0.7176471, 1, 1,
0.1055889, 0.5163236, -0.07271087, 0, 0.7137255, 1, 1,
0.1070129, -0.1434331, 1.960701, 0, 0.7058824, 1, 1,
0.1073513, 0.3267181, 1.044614, 0, 0.6980392, 1, 1,
0.108116, -1.263838, 2.527282, 0, 0.6941177, 1, 1,
0.1086315, 0.5430483, 0.7449605, 0, 0.6862745, 1, 1,
0.1145895, -0.4787519, 2.175789, 0, 0.682353, 1, 1,
0.1154475, 1.838773, 1.114309, 0, 0.6745098, 1, 1,
0.1181865, -0.8503245, 2.008393, 0, 0.6705883, 1, 1,
0.1245514, 0.9643369, -0.2522566, 0, 0.6627451, 1, 1,
0.1302633, 0.1407363, 1.99456, 0, 0.6588235, 1, 1,
0.1312972, -0.1702365, 3.105389, 0, 0.6509804, 1, 1,
0.1372813, -0.02041478, 1.33771, 0, 0.6470588, 1, 1,
0.1390844, -0.8987253, 3.600909, 0, 0.6392157, 1, 1,
0.1407158, -0.5399022, 1.896281, 0, 0.6352941, 1, 1,
0.1411082, -1.917264, 2.026872, 0, 0.627451, 1, 1,
0.1464343, 1.338845, -1.032609, 0, 0.6235294, 1, 1,
0.1485212, 1.741931, -0.5076153, 0, 0.6156863, 1, 1,
0.1495406, -0.5294729, 1.574636, 0, 0.6117647, 1, 1,
0.1501496, 0.8774509, 0.2755585, 0, 0.6039216, 1, 1,
0.1516661, 1.650361, -1.505867, 0, 0.5960785, 1, 1,
0.1523704, 0.02070391, 0.3669007, 0, 0.5921569, 1, 1,
0.1535518, 0.9799203, -0.3398573, 0, 0.5843138, 1, 1,
0.1554363, 1.410668, 0.141311, 0, 0.5803922, 1, 1,
0.1603423, 1.693655, 0.5236082, 0, 0.572549, 1, 1,
0.1617196, 0.5420099, -1.260399, 0, 0.5686275, 1, 1,
0.1664135, 1.734101, 1.548464, 0, 0.5607843, 1, 1,
0.1686627, -1.19211, 2.10277, 0, 0.5568628, 1, 1,
0.1736445, 0.05720849, 1.840105, 0, 0.5490196, 1, 1,
0.1744011, 0.9327807, -0.285168, 0, 0.5450981, 1, 1,
0.1780722, -0.262941, 1.461439, 0, 0.5372549, 1, 1,
0.1791666, -0.4990511, 3.342222, 0, 0.5333334, 1, 1,
0.1821516, -0.4450466, 1.407962, 0, 0.5254902, 1, 1,
0.1834364, -0.9048004, 3.855806, 0, 0.5215687, 1, 1,
0.1843013, 0.4349983, -0.5087954, 0, 0.5137255, 1, 1,
0.1886715, 0.4502815, 0.525353, 0, 0.509804, 1, 1,
0.1922123, -0.6659948, 1.426753, 0, 0.5019608, 1, 1,
0.1959629, -1.262602, 2.414351, 0, 0.4941176, 1, 1,
0.1987881, -1.348653, 3.166882, 0, 0.4901961, 1, 1,
0.1989975, 0.1806572, -0.1984737, 0, 0.4823529, 1, 1,
0.1990052, -1.002273, 2.196314, 0, 0.4784314, 1, 1,
0.1999795, -0.1961441, 2.118093, 0, 0.4705882, 1, 1,
0.2032973, 0.6156369, 0.4905585, 0, 0.4666667, 1, 1,
0.2043674, -0.4979415, 2.86817, 0, 0.4588235, 1, 1,
0.2070312, -1.408954, 3.889437, 0, 0.454902, 1, 1,
0.211088, 0.6364188, 0.2748372, 0, 0.4470588, 1, 1,
0.2117504, -0.7637063, 3.838984, 0, 0.4431373, 1, 1,
0.2169457, -0.06621024, 1.683775, 0, 0.4352941, 1, 1,
0.2174347, 1.281568, 0.7069595, 0, 0.4313726, 1, 1,
0.2188923, 0.4905276, 1.073906, 0, 0.4235294, 1, 1,
0.2196045, 0.8403824, -1.122926, 0, 0.4196078, 1, 1,
0.220745, -0.7841344, 3.01764, 0, 0.4117647, 1, 1,
0.2209175, -0.5522458, 1.870577, 0, 0.4078431, 1, 1,
0.2233526, 0.3134969, 0.7640342, 0, 0.4, 1, 1,
0.2278988, -0.6492547, 4.516102, 0, 0.3921569, 1, 1,
0.2307933, -0.1619671, 1.402495, 0, 0.3882353, 1, 1,
0.2309376, -0.7869768, 2.004293, 0, 0.3803922, 1, 1,
0.2313446, 1.060315, -0.04654436, 0, 0.3764706, 1, 1,
0.2328503, 0.2824585, 2.149273, 0, 0.3686275, 1, 1,
0.2368923, -0.08819158, 1.643303, 0, 0.3647059, 1, 1,
0.2386438, -2.136076, 2.222147, 0, 0.3568628, 1, 1,
0.241717, -0.6304591, 1.399185, 0, 0.3529412, 1, 1,
0.2421556, 0.5901651, 0.5494131, 0, 0.345098, 1, 1,
0.2542638, 0.2119674, 2.525751, 0, 0.3411765, 1, 1,
0.2574843, -1.016034, 5.147513, 0, 0.3333333, 1, 1,
0.2593718, -2.540726, 2.38198, 0, 0.3294118, 1, 1,
0.2605321, -1.453481, 1.854183, 0, 0.3215686, 1, 1,
0.2609124, 1.647309, 1.900992, 0, 0.3176471, 1, 1,
0.2633942, 0.642536, 1.465214, 0, 0.3098039, 1, 1,
0.2650879, 0.6744196, 0.7227278, 0, 0.3058824, 1, 1,
0.2678596, 0.8373024, -0.7138665, 0, 0.2980392, 1, 1,
0.2696041, -0.264576, 1.677419, 0, 0.2901961, 1, 1,
0.2709563, -0.4239939, 4.263538, 0, 0.2862745, 1, 1,
0.2720176, 1.336385, -0.4690782, 0, 0.2784314, 1, 1,
0.2738981, -2.091801, 3.011853, 0, 0.2745098, 1, 1,
0.2775643, 0.09433158, 0.3705849, 0, 0.2666667, 1, 1,
0.2776911, -0.1189263, 2.593536, 0, 0.2627451, 1, 1,
0.2814468, -0.6053364, 2.987755, 0, 0.254902, 1, 1,
0.2841774, 0.479922, 0.01155441, 0, 0.2509804, 1, 1,
0.2901716, -0.6834804, 1.156171, 0, 0.2431373, 1, 1,
0.2920696, -0.857543, 4.206025, 0, 0.2392157, 1, 1,
0.2930697, 0.8623509, 1.748265, 0, 0.2313726, 1, 1,
0.2953085, 1.666228, 2.177466, 0, 0.227451, 1, 1,
0.2954096, -0.4161982, 2.14146, 0, 0.2196078, 1, 1,
0.2954373, 0.5512322, 0.9392613, 0, 0.2156863, 1, 1,
0.2978261, 1.581121, 0.1087177, 0, 0.2078431, 1, 1,
0.2982335, 0.2514242, 2.193982, 0, 0.2039216, 1, 1,
0.2988481, 0.6556219, 0.3124988, 0, 0.1960784, 1, 1,
0.3048971, 2.228207, -1.569169, 0, 0.1882353, 1, 1,
0.3118903, 1.029027, -0.1246662, 0, 0.1843137, 1, 1,
0.3174462, 0.7644276, 0.5875268, 0, 0.1764706, 1, 1,
0.3198127, -0.1268053, 0.7999891, 0, 0.172549, 1, 1,
0.3215772, -0.1653566, 1.136183, 0, 0.1647059, 1, 1,
0.3227185, -0.6283848, 2.34843, 0, 0.1607843, 1, 1,
0.3243929, 0.8208843, 1.449081, 0, 0.1529412, 1, 1,
0.3256455, -0.6113418, 3.740424, 0, 0.1490196, 1, 1,
0.3260698, -0.1386399, 1.842124, 0, 0.1411765, 1, 1,
0.3261634, 0.1347792, -0.1161649, 0, 0.1372549, 1, 1,
0.3267492, 0.02125031, -0.7939817, 0, 0.1294118, 1, 1,
0.3278562, -2.726923, 3.79404, 0, 0.1254902, 1, 1,
0.328422, 0.9840994, 0.5789169, 0, 0.1176471, 1, 1,
0.3314382, -0.556372, 2.418574, 0, 0.1137255, 1, 1,
0.3330253, -0.1066426, 1.997196, 0, 0.1058824, 1, 1,
0.3360539, 0.6196179, 0.3079304, 0, 0.09803922, 1, 1,
0.3367662, -0.275893, 3.42858, 0, 0.09411765, 1, 1,
0.3372765, 1.164816, 0.6116889, 0, 0.08627451, 1, 1,
0.3382667, -0.3276716, 2.797467, 0, 0.08235294, 1, 1,
0.3413934, -2.566025, 1.562171, 0, 0.07450981, 1, 1,
0.3417147, -0.9935887, 2.399439, 0, 0.07058824, 1, 1,
0.3421789, 0.3910776, -0.2713283, 0, 0.0627451, 1, 1,
0.3435521, -0.9337087, 1.98336, 0, 0.05882353, 1, 1,
0.3487121, 0.4523, -0.4904846, 0, 0.05098039, 1, 1,
0.3579333, -0.565415, 2.742511, 0, 0.04705882, 1, 1,
0.3630791, 0.4842482, 0.1560995, 0, 0.03921569, 1, 1,
0.375115, 1.164213, 0.1809465, 0, 0.03529412, 1, 1,
0.3803652, -1.007893, 3.672365, 0, 0.02745098, 1, 1,
0.3817449, -0.6978691, 2.539104, 0, 0.02352941, 1, 1,
0.3823442, -0.2803574, 2.990811, 0, 0.01568628, 1, 1,
0.3862012, -1.45128, 4.069812, 0, 0.01176471, 1, 1,
0.3865222, 0.8850497, 2.856206, 0, 0.003921569, 1, 1,
0.3872543, 0.3166706, 0.7767121, 0.003921569, 0, 1, 1,
0.3918805, -0.05231027, 1.762971, 0.007843138, 0, 1, 1,
0.3966476, 1.576769, 1.130185, 0.01568628, 0, 1, 1,
0.3969254, -0.9626474, 3.680209, 0.01960784, 0, 1, 1,
0.4051346, -0.8552684, 2.7115, 0.02745098, 0, 1, 1,
0.4097142, 1.793056, 1.030519, 0.03137255, 0, 1, 1,
0.4113951, 0.7802263, 1.368183, 0.03921569, 0, 1, 1,
0.4155177, 0.4214002, 1.366628, 0.04313726, 0, 1, 1,
0.4177296, -0.6824887, 3.171146, 0.05098039, 0, 1, 1,
0.4253366, -1.1602, 1.613605, 0.05490196, 0, 1, 1,
0.4270833, 0.2594625, 1.022326, 0.0627451, 0, 1, 1,
0.4296, -1.787792, 3.352157, 0.06666667, 0, 1, 1,
0.4303009, 0.8247043, 0.4925106, 0.07450981, 0, 1, 1,
0.4307983, 0.615258, -0.6605176, 0.07843138, 0, 1, 1,
0.4390213, -0.7905167, 1.843343, 0.08627451, 0, 1, 1,
0.4392546, -0.7467027, 0.07804166, 0.09019608, 0, 1, 1,
0.4400516, -1.198877, 2.031392, 0.09803922, 0, 1, 1,
0.4448054, 1.169757, -0.826921, 0.1058824, 0, 1, 1,
0.4480889, -2.023424, 1.89815, 0.1098039, 0, 1, 1,
0.4487702, -0.9018212, 2.468359, 0.1176471, 0, 1, 1,
0.4522232, -0.008380475, 2.034312, 0.1215686, 0, 1, 1,
0.4545314, 1.117408, 0.3197451, 0.1294118, 0, 1, 1,
0.4603277, 0.2595127, 0.1256721, 0.1333333, 0, 1, 1,
0.4641809, 0.2125869, 2.521622, 0.1411765, 0, 1, 1,
0.4642912, 0.5415116, 2.089466, 0.145098, 0, 1, 1,
0.4675928, 0.1769029, 1.380805, 0.1529412, 0, 1, 1,
0.4676901, -0.4940704, 1.008469, 0.1568628, 0, 1, 1,
0.4694099, -0.4141564, 3.501802, 0.1647059, 0, 1, 1,
0.4705479, -0.8734333, 3.251772, 0.1686275, 0, 1, 1,
0.4718668, -0.05970538, 1.170872, 0.1764706, 0, 1, 1,
0.4757197, 0.6599274, -0.4375254, 0.1803922, 0, 1, 1,
0.4767828, -0.1398237, 0.3440728, 0.1882353, 0, 1, 1,
0.4774901, -1.224808, 2.5265, 0.1921569, 0, 1, 1,
0.4843548, 2.255453, 0.1985367, 0.2, 0, 1, 1,
0.4881709, 1.354957, 0.2215768, 0.2078431, 0, 1, 1,
0.4893688, -0.2567951, 3.760238, 0.2117647, 0, 1, 1,
0.4901063, 1.415988, -0.9322584, 0.2196078, 0, 1, 1,
0.4941877, 0.1282036, 0.7378877, 0.2235294, 0, 1, 1,
0.4943173, 1.390378, 0.735306, 0.2313726, 0, 1, 1,
0.4976512, 2.136517, 1.431467, 0.2352941, 0, 1, 1,
0.5013869, -0.7406034, 0.7004772, 0.2431373, 0, 1, 1,
0.5155349, -1.176349, 3.658533, 0.2470588, 0, 1, 1,
0.5217009, 0.6876847, 0.6655571, 0.254902, 0, 1, 1,
0.5233891, 1.051127, -0.003282995, 0.2588235, 0, 1, 1,
0.524313, 1.436726, 1.046536, 0.2666667, 0, 1, 1,
0.5296719, 0.05007546, 1.748526, 0.2705882, 0, 1, 1,
0.5320473, 0.647867, 2.083749, 0.2784314, 0, 1, 1,
0.5332507, -0.2377505, 1.511949, 0.282353, 0, 1, 1,
0.5351158, 0.03390136, 0.8567848, 0.2901961, 0, 1, 1,
0.5377392, 0.1630555, 0.3368728, 0.2941177, 0, 1, 1,
0.5393401, 0.07871009, 0.2246146, 0.3019608, 0, 1, 1,
0.540983, -0.3403257, 3.194907, 0.3098039, 0, 1, 1,
0.5447044, -1.169386, 3.047546, 0.3137255, 0, 1, 1,
0.5449538, -2.934358, 3.998889, 0.3215686, 0, 1, 1,
0.5474235, -2.315424, 3.001363, 0.3254902, 0, 1, 1,
0.550887, 0.5062192, 0.8791122, 0.3333333, 0, 1, 1,
0.5513724, -0.9804344, 2.640032, 0.3372549, 0, 1, 1,
0.5557286, -0.9772557, 3.823815, 0.345098, 0, 1, 1,
0.5607556, -0.6457739, 3.613709, 0.3490196, 0, 1, 1,
0.568959, 1.999452, 0.130986, 0.3568628, 0, 1, 1,
0.5716435, -1.764084, 2.112402, 0.3607843, 0, 1, 1,
0.5720464, 0.5377549, 3.11292, 0.3686275, 0, 1, 1,
0.576201, -0.2614486, 2.807389, 0.372549, 0, 1, 1,
0.5794654, -0.9529503, 1.363086, 0.3803922, 0, 1, 1,
0.5843706, -0.1191284, 2.690134, 0.3843137, 0, 1, 1,
0.5854628, -1.011822, 4.167593, 0.3921569, 0, 1, 1,
0.5856245, 1.094689, 0.5302865, 0.3960784, 0, 1, 1,
0.5876416, 0.4119743, 2.085541, 0.4039216, 0, 1, 1,
0.5893973, 1.076328, 0.9134175, 0.4117647, 0, 1, 1,
0.5986736, -0.1846253, 2.838714, 0.4156863, 0, 1, 1,
0.5990611, -0.3182507, 2.549962, 0.4235294, 0, 1, 1,
0.5991059, 0.753348, 3.045295, 0.427451, 0, 1, 1,
0.6076326, -0.2393939, 2.524556, 0.4352941, 0, 1, 1,
0.6160492, 0.5560396, 1.461556, 0.4392157, 0, 1, 1,
0.6219488, 1.128281, 1.110162, 0.4470588, 0, 1, 1,
0.6287153, 0.5326872, 0.7593634, 0.4509804, 0, 1, 1,
0.6368216, 1.265831, 1.025687, 0.4588235, 0, 1, 1,
0.6392053, -0.9787968, 3.708053, 0.4627451, 0, 1, 1,
0.6533085, -0.03396513, 1.639696, 0.4705882, 0, 1, 1,
0.6537643, 0.2194409, 2.97819, 0.4745098, 0, 1, 1,
0.6538449, -0.10948, 2.368615, 0.4823529, 0, 1, 1,
0.6549759, 0.2471914, 2.500394, 0.4862745, 0, 1, 1,
0.6554614, 0.2975124, 1.712903, 0.4941176, 0, 1, 1,
0.6564864, -0.95539, 3.251704, 0.5019608, 0, 1, 1,
0.6585332, -0.3214531, 2.68159, 0.5058824, 0, 1, 1,
0.6705464, 2.410741, -0.4871682, 0.5137255, 0, 1, 1,
0.6714115, 0.1986749, 2.212443, 0.5176471, 0, 1, 1,
0.6720522, -1.732413, 2.74693, 0.5254902, 0, 1, 1,
0.6846665, 1.123131, -0.4390378, 0.5294118, 0, 1, 1,
0.6870725, -1.256526, 2.390329, 0.5372549, 0, 1, 1,
0.6971936, -0.1246166, -0.3070271, 0.5411765, 0, 1, 1,
0.6975169, 0.6590453, 1.926387, 0.5490196, 0, 1, 1,
0.6985754, -1.639738, 0.808349, 0.5529412, 0, 1, 1,
0.7013215, 0.6135666, 1.582834, 0.5607843, 0, 1, 1,
0.7100834, 0.2963889, 0.981886, 0.5647059, 0, 1, 1,
0.7116929, 0.994369, 0.9591061, 0.572549, 0, 1, 1,
0.7147871, -0.426463, 1.488377, 0.5764706, 0, 1, 1,
0.7162477, -0.3071694, 2.33534, 0.5843138, 0, 1, 1,
0.7164249, 0.8456658, 2.483796, 0.5882353, 0, 1, 1,
0.716985, -0.3394592, 1.584308, 0.5960785, 0, 1, 1,
0.7189739, -0.1955455, 2.562402, 0.6039216, 0, 1, 1,
0.7201005, 1.126449, 2.442362, 0.6078432, 0, 1, 1,
0.7202942, -0.2439222, 3.097853, 0.6156863, 0, 1, 1,
0.722577, -0.3172114, 1.886197, 0.6196079, 0, 1, 1,
0.7236265, 1.116714, 2.293528, 0.627451, 0, 1, 1,
0.7269409, 1.752379, -0.4577243, 0.6313726, 0, 1, 1,
0.7272175, 1.269475, -0.007950764, 0.6392157, 0, 1, 1,
0.7308131, 0.03324512, 0.6772675, 0.6431373, 0, 1, 1,
0.7310032, 1.076697, -0.1780731, 0.6509804, 0, 1, 1,
0.7337022, 0.4819866, 0.1495703, 0.654902, 0, 1, 1,
0.7356711, -1.57111, 4.211501, 0.6627451, 0, 1, 1,
0.7362838, 1.373729, 0.8704277, 0.6666667, 0, 1, 1,
0.7408257, 0.4452482, 0.6168386, 0.6745098, 0, 1, 1,
0.7509021, -0.2702658, 2.778538, 0.6784314, 0, 1, 1,
0.7643334, 0.75859, 1.284039, 0.6862745, 0, 1, 1,
0.7653452, 1.440089, 0.0375766, 0.6901961, 0, 1, 1,
0.768269, -0.1639335, 4.460272, 0.6980392, 0, 1, 1,
0.774379, -0.2267334, 2.585528, 0.7058824, 0, 1, 1,
0.7776865, 0.3281387, 1.23325, 0.7098039, 0, 1, 1,
0.78558, -0.1588476, 0.1698375, 0.7176471, 0, 1, 1,
0.788063, -0.044295, 1.682021, 0.7215686, 0, 1, 1,
0.7926112, 0.6175864, 2.065747, 0.7294118, 0, 1, 1,
0.7964969, -1.600682, 1.922912, 0.7333333, 0, 1, 1,
0.7971286, 0.3824793, 1.832961, 0.7411765, 0, 1, 1,
0.8067041, -1.810794, 1.621498, 0.7450981, 0, 1, 1,
0.8147978, -0.7414382, 2.650963, 0.7529412, 0, 1, 1,
0.8153569, 0.02731267, 1.298837, 0.7568628, 0, 1, 1,
0.817177, -1.638573, 4.019802, 0.7647059, 0, 1, 1,
0.8180943, -0.04413974, 3.018776, 0.7686275, 0, 1, 1,
0.8195657, 0.05269183, 2.827915, 0.7764706, 0, 1, 1,
0.8197219, -0.4683017, 1.856518, 0.7803922, 0, 1, 1,
0.8201962, 0.5080884, 1.071229, 0.7882353, 0, 1, 1,
0.8258455, 0.4548482, 0.4512972, 0.7921569, 0, 1, 1,
0.8298883, -1.714113, 1.936861, 0.8, 0, 1, 1,
0.8299496, 1.423309, 0.3065813, 0.8078431, 0, 1, 1,
0.8317785, 0.6828641, 0.8873868, 0.8117647, 0, 1, 1,
0.8379249, -0.6312717, 2.596864, 0.8196079, 0, 1, 1,
0.8390073, 1.747255, 1.203009, 0.8235294, 0, 1, 1,
0.8404924, 0.1784995, 0.520261, 0.8313726, 0, 1, 1,
0.8416186, 0.08239217, 3.464152, 0.8352941, 0, 1, 1,
0.8439205, -0.3638562, 2.727813, 0.8431373, 0, 1, 1,
0.8491693, 0.8055452, 2.599406, 0.8470588, 0, 1, 1,
0.8507987, 1.880773, 0.3484567, 0.854902, 0, 1, 1,
0.8516725, -1.356357, 3.242256, 0.8588235, 0, 1, 1,
0.8644153, 0.003065483, 2.487466, 0.8666667, 0, 1, 1,
0.8680179, -1.158306, 1.652234, 0.8705882, 0, 1, 1,
0.8809541, 0.4666255, -0.2511224, 0.8784314, 0, 1, 1,
0.8875762, 1.382141, 0.2993113, 0.8823529, 0, 1, 1,
0.8883676, -1.108467, 1.378353, 0.8901961, 0, 1, 1,
0.8972602, -1.331962, 1.729343, 0.8941177, 0, 1, 1,
0.9008392, 1.150143, 1.030712, 0.9019608, 0, 1, 1,
0.9043009, -0.9885136, 3.434849, 0.9098039, 0, 1, 1,
0.9123558, 0.07326923, 1.04144, 0.9137255, 0, 1, 1,
0.9141484, -0.1771227, 1.172359, 0.9215686, 0, 1, 1,
0.9146197, -0.4838174, 1.724859, 0.9254902, 0, 1, 1,
0.9161494, -0.8706034, 2.272806, 0.9333333, 0, 1, 1,
0.923122, 0.2081671, 1.584774, 0.9372549, 0, 1, 1,
0.9266699, 0.4011768, 1.208467, 0.945098, 0, 1, 1,
0.9284742, -1.146254, 2.870255, 0.9490196, 0, 1, 1,
0.9368578, -0.4318199, 0.7614759, 0.9568627, 0, 1, 1,
0.9383714, -1.166419, 2.562924, 0.9607843, 0, 1, 1,
0.9428946, -0.7052206, 3.106143, 0.9686275, 0, 1, 1,
0.9463302, -1.566773, 2.554295, 0.972549, 0, 1, 1,
0.9479392, 1.304887, 0.1479521, 0.9803922, 0, 1, 1,
0.9495825, -0.07016303, 1.562812, 0.9843137, 0, 1, 1,
0.9526128, 1.919102, -0.9363503, 0.9921569, 0, 1, 1,
0.9621792, 1.556113, 0.8196067, 0.9960784, 0, 1, 1,
0.9641544, 1.679007, -0.7821399, 1, 0, 0.9960784, 1,
0.9755057, -0.5989671, 2.669592, 1, 0, 0.9882353, 1,
0.9831333, 1.547484, 0.2048675, 1, 0, 0.9843137, 1,
0.9836328, 0.7949007, 0.8462521, 1, 0, 0.9764706, 1,
0.9847005, -1.078476, 3.274557, 1, 0, 0.972549, 1,
0.9895793, -0.5313158, 2.864151, 1, 0, 0.9647059, 1,
0.9908658, -0.458896, 0.6466061, 1, 0, 0.9607843, 1,
0.9915607, 1.022472, 1.606441, 1, 0, 0.9529412, 1,
0.9929574, 0.5116137, 1.875783, 1, 0, 0.9490196, 1,
0.9933621, 1.528501, 0.6985497, 1, 0, 0.9411765, 1,
1.000106, -0.3444756, 0.9745288, 1, 0, 0.9372549, 1,
1.000429, 1.324828, 1.033588, 1, 0, 0.9294118, 1,
1.006156, -0.7982481, 2.959897, 1, 0, 0.9254902, 1,
1.01023, -0.304624, 1.198938, 1, 0, 0.9176471, 1,
1.01026, -0.7367133, 1.693556, 1, 0, 0.9137255, 1,
1.012294, -1.944008, 0.9884935, 1, 0, 0.9058824, 1,
1.012956, 2.073417, 0.1655892, 1, 0, 0.9019608, 1,
1.015092, -0.9314374, 1.557127, 1, 0, 0.8941177, 1,
1.015515, 0.1248964, 2.256317, 1, 0, 0.8862745, 1,
1.022943, 0.9050632, 2.56261, 1, 0, 0.8823529, 1,
1.0252, -0.9376787, 2.531627, 1, 0, 0.8745098, 1,
1.029454, 0.7770313, 2.3005, 1, 0, 0.8705882, 1,
1.038199, 0.6971051, 0.4938917, 1, 0, 0.8627451, 1,
1.040051, -0.8259935, 3.370695, 1, 0, 0.8588235, 1,
1.042002, 0.1819942, 0.863272, 1, 0, 0.8509804, 1,
1.044689, 0.307851, 1.443127, 1, 0, 0.8470588, 1,
1.0457, 1.196485, 0.2283374, 1, 0, 0.8392157, 1,
1.046214, -1.408998, 3.057045, 1, 0, 0.8352941, 1,
1.05029, 1.207235, 0.2853533, 1, 0, 0.827451, 1,
1.05208, -0.8531161, 1.407001, 1, 0, 0.8235294, 1,
1.052433, 1.156748, 0.8526241, 1, 0, 0.8156863, 1,
1.067053, 0.06157837, 3.503939, 1, 0, 0.8117647, 1,
1.074404, 0.1357113, 1.171372, 1, 0, 0.8039216, 1,
1.082617, -0.8077469, 2.249617, 1, 0, 0.7960784, 1,
1.091472, -0.5794685, 1.59913, 1, 0, 0.7921569, 1,
1.103716, -0.2090721, 2.09487, 1, 0, 0.7843137, 1,
1.107772, -0.781747, 2.112782, 1, 0, 0.7803922, 1,
1.115058, -1.215521, 1.386259, 1, 0, 0.772549, 1,
1.121303, -0.09041612, 0.6584057, 1, 0, 0.7686275, 1,
1.125221, -0.3262177, 1.080687, 1, 0, 0.7607843, 1,
1.127085, 1.134092, -0.00278203, 1, 0, 0.7568628, 1,
1.12938, -0.7186234, 2.941248, 1, 0, 0.7490196, 1,
1.158773, 1.01081, 1.715326, 1, 0, 0.7450981, 1,
1.163658, 1.933591, -1.335387, 1, 0, 0.7372549, 1,
1.172773, 1.963338, 2.050513, 1, 0, 0.7333333, 1,
1.173364, -0.595723, 2.165303, 1, 0, 0.7254902, 1,
1.175897, -1.265926, 2.318347, 1, 0, 0.7215686, 1,
1.178269, -0.6609123, 3.644649, 1, 0, 0.7137255, 1,
1.18122, -1.373367, 3.657944, 1, 0, 0.7098039, 1,
1.183215, -0.557682, 1.016208, 1, 0, 0.7019608, 1,
1.188983, 0.5667332, 1.752206, 1, 0, 0.6941177, 1,
1.19417, 0.5227708, 1.55103, 1, 0, 0.6901961, 1,
1.20217, -0.882419, 2.203425, 1, 0, 0.682353, 1,
1.209441, 0.4647089, 0.9613409, 1, 0, 0.6784314, 1,
1.21363, -0.2428766, 2.069701, 1, 0, 0.6705883, 1,
1.21765, 0.4775438, 2.459021, 1, 0, 0.6666667, 1,
1.221256, 0.1986064, -0.850934, 1, 0, 0.6588235, 1,
1.221939, 0.388445, -0.4841561, 1, 0, 0.654902, 1,
1.231794, 0.5301152, 1.03513, 1, 0, 0.6470588, 1,
1.241835, -1.554802, 1.541584, 1, 0, 0.6431373, 1,
1.251362, 0.2943594, 1.472874, 1, 0, 0.6352941, 1,
1.25479, -0.6239664, 3.102985, 1, 0, 0.6313726, 1,
1.265326, 1.761359, 1.850978, 1, 0, 0.6235294, 1,
1.26624, -0.1424574, 2.653397, 1, 0, 0.6196079, 1,
1.278642, -0.7653167, 2.739485, 1, 0, 0.6117647, 1,
1.283206, 0.4511519, 2.125618, 1, 0, 0.6078432, 1,
1.2849, -1.087806, 2.81471, 1, 0, 0.6, 1,
1.290033, -1.450468, 1.79157, 1, 0, 0.5921569, 1,
1.294335, -2.191375, 3.011115, 1, 0, 0.5882353, 1,
1.303769, 1.419128, 0.2434695, 1, 0, 0.5803922, 1,
1.304008, 0.6164112, -0.008425457, 1, 0, 0.5764706, 1,
1.304848, 0.5256393, 1.097088, 1, 0, 0.5686275, 1,
1.309425, 1.042155, 0.6858879, 1, 0, 0.5647059, 1,
1.322332, 2.110361, 0.2206945, 1, 0, 0.5568628, 1,
1.32729, 1.00442, 0.635565, 1, 0, 0.5529412, 1,
1.331845, -0.3657903, 1.755897, 1, 0, 0.5450981, 1,
1.340632, 0.5947884, 1.963709, 1, 0, 0.5411765, 1,
1.343076, 0.2164678, 0.7238684, 1, 0, 0.5333334, 1,
1.343835, -0.4791409, 2.605434, 1, 0, 0.5294118, 1,
1.350291, -2.118725, 1.718424, 1, 0, 0.5215687, 1,
1.350891, -1.449721, 1.770741, 1, 0, 0.5176471, 1,
1.357208, -0.401522, 2.700596, 1, 0, 0.509804, 1,
1.362354, -0.3268874, 2.806913, 1, 0, 0.5058824, 1,
1.365617, -1.159208, 1.759808, 1, 0, 0.4980392, 1,
1.369706, 0.009001133, 1.044767, 1, 0, 0.4901961, 1,
1.371281, -0.6610393, 3.320871, 1, 0, 0.4862745, 1,
1.374397, -0.3983343, 3.452983, 1, 0, 0.4784314, 1,
1.374654, -0.2706268, 2.0112, 1, 0, 0.4745098, 1,
1.378998, -2.069284, -0.0470848, 1, 0, 0.4666667, 1,
1.381253, -0.1686847, 1.22444, 1, 0, 0.4627451, 1,
1.387015, 0.3308611, -0.3371356, 1, 0, 0.454902, 1,
1.395894, 0.8470818, 0.6356581, 1, 0, 0.4509804, 1,
1.407105, -0.2107221, 2.807564, 1, 0, 0.4431373, 1,
1.412617, 0.309453, 2.210626, 1, 0, 0.4392157, 1,
1.418073, 1.793432, 1.014403, 1, 0, 0.4313726, 1,
1.422128, 0.7785343, 1.629147, 1, 0, 0.427451, 1,
1.430259, -1.085095, 2.715878, 1, 0, 0.4196078, 1,
1.438671, -0.4294093, 1.891264, 1, 0, 0.4156863, 1,
1.442845, -0.1743649, 1.178358, 1, 0, 0.4078431, 1,
1.444538, -0.004683892, 0.358386, 1, 0, 0.4039216, 1,
1.444869, -0.9529365, 0.3341787, 1, 0, 0.3960784, 1,
1.449773, 0.073015, 0.9143551, 1, 0, 0.3882353, 1,
1.454614, 0.9346749, 0.3534564, 1, 0, 0.3843137, 1,
1.459075, -0.8637173, 3.486645, 1, 0, 0.3764706, 1,
1.472743, 0.8928605, 0.08426245, 1, 0, 0.372549, 1,
1.482639, 0.1466053, 1.438233, 1, 0, 0.3647059, 1,
1.489904, -0.4134257, 3.140369, 1, 0, 0.3607843, 1,
1.491211, 0.865751, 0.4475048, 1, 0, 0.3529412, 1,
1.495837, 0.6825827, 0.9306645, 1, 0, 0.3490196, 1,
1.507459, 1.460592, 0.8849422, 1, 0, 0.3411765, 1,
1.515173, 1.407528, 2.791539, 1, 0, 0.3372549, 1,
1.515301, 0.07541075, 3.054825, 1, 0, 0.3294118, 1,
1.515433, -0.2991777, 3.006225, 1, 0, 0.3254902, 1,
1.525266, 1.035267, 1.824661, 1, 0, 0.3176471, 1,
1.546404, 1.735191, 0.2631411, 1, 0, 0.3137255, 1,
1.558007, -0.05731434, 0.5670404, 1, 0, 0.3058824, 1,
1.562938, -0.06619085, 2.245433, 1, 0, 0.2980392, 1,
1.56294, 0.5698883, 0.3228611, 1, 0, 0.2941177, 1,
1.571656, 1.371369, 1.381556, 1, 0, 0.2862745, 1,
1.573548, -0.8683756, 1.712118, 1, 0, 0.282353, 1,
1.589786, -0.1254148, 0.7792011, 1, 0, 0.2745098, 1,
1.599651, 1.04659, -0.1459399, 1, 0, 0.2705882, 1,
1.665725, -0.3709877, 2.77561, 1, 0, 0.2627451, 1,
1.667531, 0.3287914, 1.776499, 1, 0, 0.2588235, 1,
1.669558, -1.42165, 0.9025471, 1, 0, 0.2509804, 1,
1.679389, -0.4081016, 2.19029, 1, 0, 0.2470588, 1,
1.684181, 0.3051167, 1.135803, 1, 0, 0.2392157, 1,
1.692682, -0.8225002, 1.117187, 1, 0, 0.2352941, 1,
1.70112, 1.893176, 0.8515795, 1, 0, 0.227451, 1,
1.706925, 0.4781771, 2.207971, 1, 0, 0.2235294, 1,
1.710064, 0.04907177, -0.08155151, 1, 0, 0.2156863, 1,
1.710306, 2.01481, 1.697058, 1, 0, 0.2117647, 1,
1.726251, -0.4698966, 1.73134, 1, 0, 0.2039216, 1,
1.727828, 0.1602803, 3.412001, 1, 0, 0.1960784, 1,
1.738112, -0.5095032, -0.06508958, 1, 0, 0.1921569, 1,
1.75979, -0.3709871, 2.658679, 1, 0, 0.1843137, 1,
1.761221, -0.07174348, 3.658383, 1, 0, 0.1803922, 1,
1.78758, -1.174816, 2.279552, 1, 0, 0.172549, 1,
1.795849, -0.2123374, 1.686916, 1, 0, 0.1686275, 1,
1.809483, -0.844597, 3.594697, 1, 0, 0.1607843, 1,
1.810381, 0.8065107, 0.9835791, 1, 0, 0.1568628, 1,
1.820234, 0.3839121, 1.765022, 1, 0, 0.1490196, 1,
1.821736, -0.206318, 2.309989, 1, 0, 0.145098, 1,
1.825018, -0.4048347, 0.902402, 1, 0, 0.1372549, 1,
1.833714, -0.4797758, 2.123703, 1, 0, 0.1333333, 1,
1.853872, -1.154487, 2.282976, 1, 0, 0.1254902, 1,
1.856628, 0.07621986, 1.035349, 1, 0, 0.1215686, 1,
1.887266, -0.05480164, 1.154695, 1, 0, 0.1137255, 1,
1.902243, 0.06570129, 1.335405, 1, 0, 0.1098039, 1,
1.908317, -0.2665898, 1.80624, 1, 0, 0.1019608, 1,
1.949726, -0.7665094, 1.642813, 1, 0, 0.09411765, 1,
1.961155, -1.232236, 1.245205, 1, 0, 0.09019608, 1,
1.965927, 0.9024612, 1.043872, 1, 0, 0.08235294, 1,
1.98388, -0.5111215, 0.8517845, 1, 0, 0.07843138, 1,
1.996606, -0.6543136, 4.163996, 1, 0, 0.07058824, 1,
1.998111, 0.2443013, 1.008707, 1, 0, 0.06666667, 1,
2.026546, 0.9424757, 0.05364628, 1, 0, 0.05882353, 1,
2.035115, -1.352385, 1.819459, 1, 0, 0.05490196, 1,
2.044485, 0.435911, 1.805666, 1, 0, 0.04705882, 1,
2.163291, -0.4877436, 1.300461, 1, 0, 0.04313726, 1,
2.180668, -0.2410187, 2.181891, 1, 0, 0.03529412, 1,
2.318721, 0.6332656, 1.516495, 1, 0, 0.03137255, 1,
2.420221, 0.04366525, 0.6659785, 1, 0, 0.02352941, 1,
2.459837, 0.1905152, 0.844013, 1, 0, 0.01960784, 1,
2.539708, 0.6913136, 1.234584, 1, 0, 0.01176471, 1,
2.854367, 0.3192056, 1.805321, 1, 0, 0.007843138, 1
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
-0.210749, -3.957402, -7.624146, 0, -0.5, 0.5, 0.5,
-0.210749, -3.957402, -7.624146, 1, -0.5, 0.5, 0.5,
-0.210749, -3.957402, -7.624146, 1, 1.5, 0.5, 0.5,
-0.210749, -3.957402, -7.624146, 0, 1.5, 0.5, 0.5
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
-4.31494, 0.08347178, -7.624146, 0, -0.5, 0.5, 0.5,
-4.31494, 0.08347178, -7.624146, 1, -0.5, 0.5, 0.5,
-4.31494, 0.08347178, -7.624146, 1, 1.5, 0.5, 0.5,
-4.31494, 0.08347178, -7.624146, 0, 1.5, 0.5, 0.5
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
-4.31494, -3.957402, -0.312794, 0, -0.5, 0.5, 0.5,
-4.31494, -3.957402, -0.312794, 1, -0.5, 0.5, 0.5,
-4.31494, -3.957402, -0.312794, 1, 1.5, 0.5, 0.5,
-4.31494, -3.957402, -0.312794, 0, 1.5, 0.5, 0.5
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
-3, -3.024893, -5.936911,
2, -3.024893, -5.936911,
-3, -3.024893, -5.936911,
-3, -3.180311, -6.218116,
-2, -3.024893, -5.936911,
-2, -3.180311, -6.218116,
-1, -3.024893, -5.936911,
-1, -3.180311, -6.218116,
0, -3.024893, -5.936911,
0, -3.180311, -6.218116,
1, -3.024893, -5.936911,
1, -3.180311, -6.218116,
2, -3.024893, -5.936911,
2, -3.180311, -6.218116
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
-3, -3.491148, -6.780528, 0, -0.5, 0.5, 0.5,
-3, -3.491148, -6.780528, 1, -0.5, 0.5, 0.5,
-3, -3.491148, -6.780528, 1, 1.5, 0.5, 0.5,
-3, -3.491148, -6.780528, 0, 1.5, 0.5, 0.5,
-2, -3.491148, -6.780528, 0, -0.5, 0.5, 0.5,
-2, -3.491148, -6.780528, 1, -0.5, 0.5, 0.5,
-2, -3.491148, -6.780528, 1, 1.5, 0.5, 0.5,
-2, -3.491148, -6.780528, 0, 1.5, 0.5, 0.5,
-1, -3.491148, -6.780528, 0, -0.5, 0.5, 0.5,
-1, -3.491148, -6.780528, 1, -0.5, 0.5, 0.5,
-1, -3.491148, -6.780528, 1, 1.5, 0.5, 0.5,
-1, -3.491148, -6.780528, 0, 1.5, 0.5, 0.5,
0, -3.491148, -6.780528, 0, -0.5, 0.5, 0.5,
0, -3.491148, -6.780528, 1, -0.5, 0.5, 0.5,
0, -3.491148, -6.780528, 1, 1.5, 0.5, 0.5,
0, -3.491148, -6.780528, 0, 1.5, 0.5, 0.5,
1, -3.491148, -6.780528, 0, -0.5, 0.5, 0.5,
1, -3.491148, -6.780528, 1, -0.5, 0.5, 0.5,
1, -3.491148, -6.780528, 1, 1.5, 0.5, 0.5,
1, -3.491148, -6.780528, 0, 1.5, 0.5, 0.5,
2, -3.491148, -6.780528, 0, -0.5, 0.5, 0.5,
2, -3.491148, -6.780528, 1, -0.5, 0.5, 0.5,
2, -3.491148, -6.780528, 1, 1.5, 0.5, 0.5,
2, -3.491148, -6.780528, 0, 1.5, 0.5, 0.5
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
-3.367819, -2, -5.936911,
-3.367819, 3, -5.936911,
-3.367819, -2, -5.936911,
-3.525672, -2, -6.218116,
-3.367819, -1, -5.936911,
-3.525672, -1, -6.218116,
-3.367819, 0, -5.936911,
-3.525672, 0, -6.218116,
-3.367819, 1, -5.936911,
-3.525672, 1, -6.218116,
-3.367819, 2, -5.936911,
-3.525672, 2, -6.218116,
-3.367819, 3, -5.936911,
-3.525672, 3, -6.218116
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
-3.84138, -2, -6.780528, 0, -0.5, 0.5, 0.5,
-3.84138, -2, -6.780528, 1, -0.5, 0.5, 0.5,
-3.84138, -2, -6.780528, 1, 1.5, 0.5, 0.5,
-3.84138, -2, -6.780528, 0, 1.5, 0.5, 0.5,
-3.84138, -1, -6.780528, 0, -0.5, 0.5, 0.5,
-3.84138, -1, -6.780528, 1, -0.5, 0.5, 0.5,
-3.84138, -1, -6.780528, 1, 1.5, 0.5, 0.5,
-3.84138, -1, -6.780528, 0, 1.5, 0.5, 0.5,
-3.84138, 0, -6.780528, 0, -0.5, 0.5, 0.5,
-3.84138, 0, -6.780528, 1, -0.5, 0.5, 0.5,
-3.84138, 0, -6.780528, 1, 1.5, 0.5, 0.5,
-3.84138, 0, -6.780528, 0, 1.5, 0.5, 0.5,
-3.84138, 1, -6.780528, 0, -0.5, 0.5, 0.5,
-3.84138, 1, -6.780528, 1, -0.5, 0.5, 0.5,
-3.84138, 1, -6.780528, 1, 1.5, 0.5, 0.5,
-3.84138, 1, -6.780528, 0, 1.5, 0.5, 0.5,
-3.84138, 2, -6.780528, 0, -0.5, 0.5, 0.5,
-3.84138, 2, -6.780528, 1, -0.5, 0.5, 0.5,
-3.84138, 2, -6.780528, 1, 1.5, 0.5, 0.5,
-3.84138, 2, -6.780528, 0, 1.5, 0.5, 0.5,
-3.84138, 3, -6.780528, 0, -0.5, 0.5, 0.5,
-3.84138, 3, -6.780528, 1, -0.5, 0.5, 0.5,
-3.84138, 3, -6.780528, 1, 1.5, 0.5, 0.5,
-3.84138, 3, -6.780528, 0, 1.5, 0.5, 0.5
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
-3.367819, -3.024893, -4,
-3.367819, -3.024893, 4,
-3.367819, -3.024893, -4,
-3.525672, -3.180311, -4,
-3.367819, -3.024893, -2,
-3.525672, -3.180311, -2,
-3.367819, -3.024893, 0,
-3.525672, -3.180311, 0,
-3.367819, -3.024893, 2,
-3.525672, -3.180311, 2,
-3.367819, -3.024893, 4,
-3.525672, -3.180311, 4
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
-3.84138, -3.491148, -4, 0, -0.5, 0.5, 0.5,
-3.84138, -3.491148, -4, 1, -0.5, 0.5, 0.5,
-3.84138, -3.491148, -4, 1, 1.5, 0.5, 0.5,
-3.84138, -3.491148, -4, 0, 1.5, 0.5, 0.5,
-3.84138, -3.491148, -2, 0, -0.5, 0.5, 0.5,
-3.84138, -3.491148, -2, 1, -0.5, 0.5, 0.5,
-3.84138, -3.491148, -2, 1, 1.5, 0.5, 0.5,
-3.84138, -3.491148, -2, 0, 1.5, 0.5, 0.5,
-3.84138, -3.491148, 0, 0, -0.5, 0.5, 0.5,
-3.84138, -3.491148, 0, 1, -0.5, 0.5, 0.5,
-3.84138, -3.491148, 0, 1, 1.5, 0.5, 0.5,
-3.84138, -3.491148, 0, 0, 1.5, 0.5, 0.5,
-3.84138, -3.491148, 2, 0, -0.5, 0.5, 0.5,
-3.84138, -3.491148, 2, 1, -0.5, 0.5, 0.5,
-3.84138, -3.491148, 2, 1, 1.5, 0.5, 0.5,
-3.84138, -3.491148, 2, 0, 1.5, 0.5, 0.5,
-3.84138, -3.491148, 4, 0, -0.5, 0.5, 0.5,
-3.84138, -3.491148, 4, 1, -0.5, 0.5, 0.5,
-3.84138, -3.491148, 4, 1, 1.5, 0.5, 0.5,
-3.84138, -3.491148, 4, 0, 1.5, 0.5, 0.5
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
-3.367819, -3.024893, -5.936911,
-3.367819, 3.191837, -5.936911,
-3.367819, -3.024893, 5.311323,
-3.367819, 3.191837, 5.311323,
-3.367819, -3.024893, -5.936911,
-3.367819, -3.024893, 5.311323,
-3.367819, 3.191837, -5.936911,
-3.367819, 3.191837, 5.311323,
-3.367819, -3.024893, -5.936911,
2.946321, -3.024893, -5.936911,
-3.367819, -3.024893, 5.311323,
2.946321, -3.024893, 5.311323,
-3.367819, 3.191837, -5.936911,
2.946321, 3.191837, -5.936911,
-3.367819, 3.191837, 5.311323,
2.946321, 3.191837, 5.311323,
2.946321, -3.024893, -5.936911,
2.946321, 3.191837, -5.936911,
2.946321, -3.024893, 5.311323,
2.946321, 3.191837, 5.311323,
2.946321, -3.024893, -5.936911,
2.946321, -3.024893, 5.311323,
2.946321, 3.191837, -5.936911,
2.946321, 3.191837, 5.311323
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
var radius = 7.646163;
var distance = 34.01864;
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
mvMatrix.translate( 0.210749, -0.08347178, 0.312794 );
mvMatrix.scale( 1.309312, 1.329828, 0.7349759 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.01864);
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
pyridaben<-read.table("pyridaben.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyridaben$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridaben' not found
```

```r
y<-pyridaben$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridaben' not found
```

```r
z<-pyridaben$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridaben' not found
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
-3.275866, -0.3126675, -3.133699, 0, 0, 1, 1, 1,
-3.185285, -1.38523, -1.740328, 1, 0, 0, 1, 1,
-3.091082, 1.964898, 0.1276024, 1, 0, 0, 1, 1,
-3.005439, 0.24092, -0.988295, 1, 0, 0, 1, 1,
-2.700578, 0.4517144, -1.727641, 1, 0, 0, 1, 1,
-2.632526, -0.4799794, -1.551578, 1, 0, 0, 1, 1,
-2.554039, 0.4086221, -0.4828896, 0, 0, 0, 1, 1,
-2.48552, 0.7128438, -2.721884, 0, 0, 0, 1, 1,
-2.379298, -0.6306217, -0.6084357, 0, 0, 0, 1, 1,
-2.342148, -0.08659655, -1.113755, 0, 0, 0, 1, 1,
-2.333454, 0.07871796, -1.606029, 0, 0, 0, 1, 1,
-2.296272, -0.2082993, -1.304423, 0, 0, 0, 1, 1,
-2.296089, 2.804827, -0.4162159, 0, 0, 0, 1, 1,
-2.294294, -1.291364, -1.375167, 1, 1, 1, 1, 1,
-2.232605, 1.531111, -1.415242, 1, 1, 1, 1, 1,
-2.17853, 0.09126712, -1.716883, 1, 1, 1, 1, 1,
-2.077962, -0.0894273, -1.736605, 1, 1, 1, 1, 1,
-2.057869, 1.206511, -2.093788, 1, 1, 1, 1, 1,
-2.050852, 0.2050074, -1.218915, 1, 1, 1, 1, 1,
-2.046475, -0.06822596, -1.546517, 1, 1, 1, 1, 1,
-2.041494, -0.03961746, -3.552607, 1, 1, 1, 1, 1,
-2.016777, 0.9377313, -3.732238, 1, 1, 1, 1, 1,
-2.003175, -0.2090295, -3.13785, 1, 1, 1, 1, 1,
-2.002556, 1.540365, -0.2695547, 1, 1, 1, 1, 1,
-1.980972, -0.352613, -0.9062632, 1, 1, 1, 1, 1,
-1.962475, -0.7812946, -0.1652855, 1, 1, 1, 1, 1,
-1.961766, -1.290212, -3.052353, 1, 1, 1, 1, 1,
-1.957012, -1.949771, -1.596292, 1, 1, 1, 1, 1,
-1.945223, 1.35744, -1.715224, 0, 0, 1, 1, 1,
-1.941751, -0.8099555, -2.791939, 1, 0, 0, 1, 1,
-1.901021, 2.101079, -2.120502, 1, 0, 0, 1, 1,
-1.890626, -0.9984631, -2.987228, 1, 0, 0, 1, 1,
-1.851452, 0.8865588, -0.4246393, 1, 0, 0, 1, 1,
-1.845677, -0.8471211, -4.183479, 1, 0, 0, 1, 1,
-1.799837, 0.05735847, -1.515949, 0, 0, 0, 1, 1,
-1.799581, 1.513062, -0.9039507, 0, 0, 0, 1, 1,
-1.791924, -0.08045504, 0.5639024, 0, 0, 0, 1, 1,
-1.761079, -0.4352508, -0.6031141, 0, 0, 0, 1, 1,
-1.753023, -1.034345, -2.032783, 0, 0, 0, 1, 1,
-1.746032, -0.6906351, -1.391931, 0, 0, 0, 1, 1,
-1.734467, -1.423577, -3.073698, 0, 0, 0, 1, 1,
-1.732236, 1.460225, 0.3350373, 1, 1, 1, 1, 1,
-1.721832, -0.1516959, -0.7997816, 1, 1, 1, 1, 1,
-1.715132, -0.2508444, -2.662166, 1, 1, 1, 1, 1,
-1.704526, -0.7294472, -2.370771, 1, 1, 1, 1, 1,
-1.701516, -0.3911762, -2.176605, 1, 1, 1, 1, 1,
-1.697307, 0.8170387, -0.08589323, 1, 1, 1, 1, 1,
-1.692472, -1.047745, -2.781205, 1, 1, 1, 1, 1,
-1.679428, 0.773375, -1.500969, 1, 1, 1, 1, 1,
-1.676119, 0.479445, -0.3524562, 1, 1, 1, 1, 1,
-1.67219, 0.5426998, -0.9389747, 1, 1, 1, 1, 1,
-1.655649, -1.022051, -1.69848, 1, 1, 1, 1, 1,
-1.652777, 0.07523945, -1.42957, 1, 1, 1, 1, 1,
-1.640087, 1.11831, -0.5438266, 1, 1, 1, 1, 1,
-1.638541, 0.916779, 0.7283136, 1, 1, 1, 1, 1,
-1.633208, 0.4584638, -1.25971, 1, 1, 1, 1, 1,
-1.628384, 0.1009414, -3.004177, 0, 0, 1, 1, 1,
-1.623982, -0.5499155, -1.426618, 1, 0, 0, 1, 1,
-1.621826, 0.3907211, -0.4566647, 1, 0, 0, 1, 1,
-1.617808, -1.680143, -2.727356, 1, 0, 0, 1, 1,
-1.609036, -0.3285139, 1.564227, 1, 0, 0, 1, 1,
-1.601008, -0.3025068, -1.743953, 1, 0, 0, 1, 1,
-1.596189, -1.270594, -2.738936, 0, 0, 0, 1, 1,
-1.587512, -1.520911, -2.211238, 0, 0, 0, 1, 1,
-1.585767, 0.7290113, 0.382241, 0, 0, 0, 1, 1,
-1.583569, 0.9806547, -1.525272, 0, 0, 0, 1, 1,
-1.563076, 0.5631672, -2.199217, 0, 0, 0, 1, 1,
-1.553801, -0.5782505, -2.416885, 0, 0, 0, 1, 1,
-1.552974, -1.129769, -2.354196, 0, 0, 0, 1, 1,
-1.550614, -2.646997, -1.107018, 1, 1, 1, 1, 1,
-1.54357, 1.096208, -0.6822868, 1, 1, 1, 1, 1,
-1.537334, -0.5666372, -4.601087, 1, 1, 1, 1, 1,
-1.531633, 1.14078, -1.536488, 1, 1, 1, 1, 1,
-1.507505, 2.025222, -1.747166, 1, 1, 1, 1, 1,
-1.492182, -0.2319344, -2.828639, 1, 1, 1, 1, 1,
-1.483772, 0.3330379, -1.765717, 1, 1, 1, 1, 1,
-1.465776, 1.308734, -2.285654, 1, 1, 1, 1, 1,
-1.461728, 0.07560635, 0.1556625, 1, 1, 1, 1, 1,
-1.453271, 0.8604384, 0.1915246, 1, 1, 1, 1, 1,
-1.445349, 0.1908795, -1.571421, 1, 1, 1, 1, 1,
-1.437283, 1.038459, -1.602955, 1, 1, 1, 1, 1,
-1.435536, -0.4120146, -0.1951526, 1, 1, 1, 1, 1,
-1.431478, -0.5940844, -2.101004, 1, 1, 1, 1, 1,
-1.430344, 0.9846745, -0.689535, 1, 1, 1, 1, 1,
-1.423907, -1.110367, -2.320422, 0, 0, 1, 1, 1,
-1.422565, -1.791228, -2.337448, 1, 0, 0, 1, 1,
-1.418923, 0.4856741, -1.863716, 1, 0, 0, 1, 1,
-1.409385, -0.5170304, -3.214827, 1, 0, 0, 1, 1,
-1.409035, -0.7829471, -1.64319, 1, 0, 0, 1, 1,
-1.406445, -1.5758, -2.949043, 1, 0, 0, 1, 1,
-1.40505, 0.1111793, -3.492943, 0, 0, 0, 1, 1,
-1.404225, 0.8962393, -1.088452, 0, 0, 0, 1, 1,
-1.403515, -0.1716382, 0.7004222, 0, 0, 0, 1, 1,
-1.390692, -0.4923882, -2.008963, 0, 0, 0, 1, 1,
-1.388293, 0.5924629, -0.8279198, 0, 0, 0, 1, 1,
-1.386763, 0.8867696, -1.282892, 0, 0, 0, 1, 1,
-1.380732, -0.2364264, -1.568823, 0, 0, 0, 1, 1,
-1.380021, 0.8178719, 0.3402029, 1, 1, 1, 1, 1,
-1.361206, -0.8104525, -1.890644, 1, 1, 1, 1, 1,
-1.357399, -0.8519707, -2.313058, 1, 1, 1, 1, 1,
-1.346533, -0.3131898, -0.7566602, 1, 1, 1, 1, 1,
-1.346144, -0.4233147, 0.031836, 1, 1, 1, 1, 1,
-1.340213, 0.1347413, -3.254385, 1, 1, 1, 1, 1,
-1.339629, 1.743881, -0.3615063, 1, 1, 1, 1, 1,
-1.331906, -0.6216198, -2.763466, 1, 1, 1, 1, 1,
-1.313433, -1.950431, -2.352378, 1, 1, 1, 1, 1,
-1.311667, -1.479151, -2.920178, 1, 1, 1, 1, 1,
-1.303308, -0.4825922, -2.724109, 1, 1, 1, 1, 1,
-1.297763, -2.098924, -1.404155, 1, 1, 1, 1, 1,
-1.274882, -0.07620023, -1.957419, 1, 1, 1, 1, 1,
-1.274442, -1.72394, -1.255515, 1, 1, 1, 1, 1,
-1.273136, 2.257982, 0.1966553, 1, 1, 1, 1, 1,
-1.26245, -2.292445, -2.131697, 0, 0, 1, 1, 1,
-1.216635, 0.5552625, -1.664362, 1, 0, 0, 1, 1,
-1.208758, 0.9325831, -1.443968, 1, 0, 0, 1, 1,
-1.203634, -0.7585074, -1.979555, 1, 0, 0, 1, 1,
-1.197114, 0.7594454, 0.2422027, 1, 0, 0, 1, 1,
-1.188107, 0.6764639, -1.27085, 1, 0, 0, 1, 1,
-1.185328, -1.349566, -1.916591, 0, 0, 0, 1, 1,
-1.183744, -1.132854, -3.574193, 0, 0, 0, 1, 1,
-1.180582, 1.097242, -0.8044406, 0, 0, 0, 1, 1,
-1.178013, -1.107502, -2.033559, 0, 0, 0, 1, 1,
-1.176482, 0.3552129, -1.936923, 0, 0, 0, 1, 1,
-1.165708, 1.241829, 0.07984959, 0, 0, 0, 1, 1,
-1.164687, 0.3671433, -2.700675, 0, 0, 0, 1, 1,
-1.162453, -0.3040572, -0.2103309, 1, 1, 1, 1, 1,
-1.161398, -0.6509817, -3.248001, 1, 1, 1, 1, 1,
-1.158489, -0.5117759, -3.280871, 1, 1, 1, 1, 1,
-1.154276, 0.1158055, -1.794433, 1, 1, 1, 1, 1,
-1.138949, -0.4030679, -1.677441, 1, 1, 1, 1, 1,
-1.138085, -1.284958, -2.652302, 1, 1, 1, 1, 1,
-1.124047, -1.369549, -2.941719, 1, 1, 1, 1, 1,
-1.114615, 0.7533294, -1.878738, 1, 1, 1, 1, 1,
-1.112926, 0.8958837, -1.660848, 1, 1, 1, 1, 1,
-1.11178, 0.005908117, -1.173151, 1, 1, 1, 1, 1,
-1.110317, -0.2290688, -2.105907, 1, 1, 1, 1, 1,
-1.109933, -1.622941, -2.323826, 1, 1, 1, 1, 1,
-1.107117, -1.020908, -2.337606, 1, 1, 1, 1, 1,
-1.096386, 0.493569, -1.504747, 1, 1, 1, 1, 1,
-1.093682, 0.6793055, -0.8597602, 1, 1, 1, 1, 1,
-1.074328, -0.4069922, -1.311693, 0, 0, 1, 1, 1,
-1.073971, -1.802545, 0.1018464, 1, 0, 0, 1, 1,
-1.066247, -0.6733915, -0.7979417, 1, 0, 0, 1, 1,
-1.05554, -0.7146615, -2.338023, 1, 0, 0, 1, 1,
-1.050036, -0.4385741, -0.4419242, 1, 0, 0, 1, 1,
-1.040945, -0.09340496, -1.866221, 1, 0, 0, 1, 1,
-1.036453, 0.3837688, -1.181819, 0, 0, 0, 1, 1,
-1.032307, 1.47181, -0.5160964, 0, 0, 0, 1, 1,
-1.028641, -0.554181, -0.6994225, 0, 0, 0, 1, 1,
-1.02698, 1.339638, -1.331181, 0, 0, 0, 1, 1,
-1.02285, 2.166545, -0.8802474, 0, 0, 0, 1, 1,
-1.020759, 1.953861, 0.7022378, 0, 0, 0, 1, 1,
-1.015998, 0.3330449, -1.64526, 0, 0, 0, 1, 1,
-1.014899, -0.6831781, -2.508345, 1, 1, 1, 1, 1,
-1.014005, -1.156508, -2.238244, 1, 1, 1, 1, 1,
-1.011005, 0.007756662, -0.626978, 1, 1, 1, 1, 1,
-1.010504, -1.422264, -0.7552465, 1, 1, 1, 1, 1,
-1.00627, -0.1751866, -0.7535086, 1, 1, 1, 1, 1,
-1.003974, 0.6925727, -2.318736, 1, 1, 1, 1, 1,
-1.002946, 0.3426071, -1.750437, 1, 1, 1, 1, 1,
-0.9933556, -0.3837741, -4.10584, 1, 1, 1, 1, 1,
-0.9856287, 0.6655734, -0.496582, 1, 1, 1, 1, 1,
-0.9812704, 1.083217, -0.2976649, 1, 1, 1, 1, 1,
-0.9808173, -0.08764786, -1.416741, 1, 1, 1, 1, 1,
-0.9807138, 1.059811, -1.131175, 1, 1, 1, 1, 1,
-0.9790614, -1.402743, -2.807063, 1, 1, 1, 1, 1,
-0.9781879, 1.008964, -0.4489932, 1, 1, 1, 1, 1,
-0.9721966, 0.5730985, -1.019467, 1, 1, 1, 1, 1,
-0.9705361, 2.022802, 2.255991, 0, 0, 1, 1, 1,
-0.9686098, 0.348129, -0.3189459, 1, 0, 0, 1, 1,
-0.9653963, -1.383172, -1.060124, 1, 0, 0, 1, 1,
-0.9588496, 0.4268517, -2.550068, 1, 0, 0, 1, 1,
-0.9579074, -0.8113922, -2.327853, 1, 0, 0, 1, 1,
-0.9549444, 1.051548, -0.6253778, 1, 0, 0, 1, 1,
-0.9543353, -0.2977541, -1.029691, 0, 0, 0, 1, 1,
-0.9531893, 0.6899228, -0.6938955, 0, 0, 0, 1, 1,
-0.9472883, 2.168707, 0.03099271, 0, 0, 0, 1, 1,
-0.946705, -1.175155, -3.355621, 0, 0, 0, 1, 1,
-0.9418213, 0.03617422, -1.288192, 0, 0, 0, 1, 1,
-0.9413633, -0.9975728, -2.096592, 0, 0, 0, 1, 1,
-0.9365339, -0.6175696, -3.027623, 0, 0, 0, 1, 1,
-0.9342913, 0.5517943, -0.4179008, 1, 1, 1, 1, 1,
-0.9313125, 0.7522287, -1.820146, 1, 1, 1, 1, 1,
-0.9299086, -0.1436954, -1.457339, 1, 1, 1, 1, 1,
-0.9284205, 0.7011423, -0.6215343, 1, 1, 1, 1, 1,
-0.9275995, 0.6440575, -0.2617736, 1, 1, 1, 1, 1,
-0.9154382, -1.967032, -3.207738, 1, 1, 1, 1, 1,
-0.914369, 2.586719, 1.485393, 1, 1, 1, 1, 1,
-0.9126879, 1.837665, 0.3749796, 1, 1, 1, 1, 1,
-0.9123765, -0.1996195, -2.337736, 1, 1, 1, 1, 1,
-0.9078317, -0.2348936, -1.559133, 1, 1, 1, 1, 1,
-0.9046988, 1.304019, -1.41977, 1, 1, 1, 1, 1,
-0.9038066, 0.3105619, -1.713933, 1, 1, 1, 1, 1,
-0.898947, -1.232628, -1.063496, 1, 1, 1, 1, 1,
-0.8947648, 0.5699747, 0.5668337, 1, 1, 1, 1, 1,
-0.8944861, -0.2431148, -2.880411, 1, 1, 1, 1, 1,
-0.8927311, -1.078152, -2.687757, 0, 0, 1, 1, 1,
-0.8850132, 0.5951893, -0.813072, 1, 0, 0, 1, 1,
-0.880223, -0.7248048, -3.451653, 1, 0, 0, 1, 1,
-0.8796734, 0.9304513, 0.9040055, 1, 0, 0, 1, 1,
-0.8792576, -1.048859, -3.249939, 1, 0, 0, 1, 1,
-0.8789191, -1.680919, -3.603465, 1, 0, 0, 1, 1,
-0.876962, 0.5377631, -0.8799154, 0, 0, 0, 1, 1,
-0.8761905, 0.3897556, -1.94578, 0, 0, 0, 1, 1,
-0.8751396, -0.3581656, -0.6983817, 0, 0, 0, 1, 1,
-0.8721783, -0.6383234, -2.546176, 0, 0, 0, 1, 1,
-0.8652006, 0.4794143, -1.637808, 0, 0, 0, 1, 1,
-0.8631408, 0.5880329, -1.180197, 0, 0, 0, 1, 1,
-0.8623783, 0.5261846, -0.4986114, 0, 0, 0, 1, 1,
-0.8582246, -0.3790638, -2.243264, 1, 1, 1, 1, 1,
-0.8511186, 0.2719723, -0.5495571, 1, 1, 1, 1, 1,
-0.8475699, 1.826995, -1.211995, 1, 1, 1, 1, 1,
-0.8458071, 0.2135794, 0.08404352, 1, 1, 1, 1, 1,
-0.8388557, -2.435867, -3.69719, 1, 1, 1, 1, 1,
-0.8388373, -1.27109, -1.511557, 1, 1, 1, 1, 1,
-0.8381103, 0.4502198, 0.007007636, 1, 1, 1, 1, 1,
-0.8337635, 1.799353, -1.017717, 1, 1, 1, 1, 1,
-0.8321966, 1.053743, -0.9845264, 1, 1, 1, 1, 1,
-0.830123, 1.978044, 0.4849608, 1, 1, 1, 1, 1,
-0.8282411, -0.6143782, -2.52507, 1, 1, 1, 1, 1,
-0.8278771, 0.007739183, -2.561111, 1, 1, 1, 1, 1,
-0.8241602, -0.2436367, -1.609744, 1, 1, 1, 1, 1,
-0.8220702, 0.6256819, 0.0227614, 1, 1, 1, 1, 1,
-0.8139973, 0.1923364, -1.448212, 1, 1, 1, 1, 1,
-0.8132189, -2.185722, -1.947688, 0, 0, 1, 1, 1,
-0.8086979, 0.6725866, 0.08200265, 1, 0, 0, 1, 1,
-0.8043725, 0.02010176, -3.064752, 1, 0, 0, 1, 1,
-0.7950403, 0.9553779, -1.899892, 1, 0, 0, 1, 1,
-0.7938387, -0.1502583, -1.300888, 1, 0, 0, 1, 1,
-0.7912822, 1.119795, 0.02980059, 1, 0, 0, 1, 1,
-0.7789358, 0.06593181, -1.594844, 0, 0, 0, 1, 1,
-0.7778461, 1.264463, -1.328922, 0, 0, 0, 1, 1,
-0.770057, 1.001506, -0.06381523, 0, 0, 0, 1, 1,
-0.7663704, 1.169678, -2.226121, 0, 0, 0, 1, 1,
-0.7619255, 0.03875583, -1.335372, 0, 0, 0, 1, 1,
-0.759931, 1.121535, -0.8923846, 0, 0, 0, 1, 1,
-0.7594603, -2.060327, -4.012177, 0, 0, 0, 1, 1,
-0.7548994, -0.4864394, 0.4414121, 1, 1, 1, 1, 1,
-0.7512219, 1.236748, -0.1379553, 1, 1, 1, 1, 1,
-0.748058, 0.2429528, -0.9788924, 1, 1, 1, 1, 1,
-0.7430025, 1.180166, 0.02757241, 1, 1, 1, 1, 1,
-0.7429436, -0.374411, -2.952716, 1, 1, 1, 1, 1,
-0.7426673, -0.8968075, -2.84116, 1, 1, 1, 1, 1,
-0.7354429, -0.4000117, -2.433035, 1, 1, 1, 1, 1,
-0.7349168, -0.384856, -0.8955258, 1, 1, 1, 1, 1,
-0.7338644, -1.230704, -4.242787, 1, 1, 1, 1, 1,
-0.7315095, -0.489231, -1.915318, 1, 1, 1, 1, 1,
-0.7285337, -0.8729025, -1.196176, 1, 1, 1, 1, 1,
-0.7279395, -2.324248, -3.771623, 1, 1, 1, 1, 1,
-0.7247585, 0.2417672, -1.175287, 1, 1, 1, 1, 1,
-0.7195773, 0.838757, 0.1976087, 1, 1, 1, 1, 1,
-0.7185965, 0.4695191, -1.038851, 1, 1, 1, 1, 1,
-0.7137729, -0.4188788, -1.250201, 0, 0, 1, 1, 1,
-0.713569, 1.413516, 0.2659672, 1, 0, 0, 1, 1,
-0.7111727, -0.5382466, -2.792224, 1, 0, 0, 1, 1,
-0.7035704, 0.4579674, -0.7475912, 1, 0, 0, 1, 1,
-0.6956127, 0.4590051, -1.057152, 1, 0, 0, 1, 1,
-0.6956097, 0.5138862, -0.5200088, 1, 0, 0, 1, 1,
-0.6928697, -0.535297, -1.312181, 0, 0, 0, 1, 1,
-0.6911557, -1.217597, -1.324306, 0, 0, 0, 1, 1,
-0.6881557, -0.7518098, -1.774111, 0, 0, 0, 1, 1,
-0.68112, -1.173812, -3.10311, 0, 0, 0, 1, 1,
-0.6808675, 0.3663949, -0.6832059, 0, 0, 0, 1, 1,
-0.6796645, -0.9269253, -1.787626, 0, 0, 0, 1, 1,
-0.6788608, 0.3972872, -1.266415, 0, 0, 0, 1, 1,
-0.6721861, 1.374386, -0.8242369, 1, 1, 1, 1, 1,
-0.6715389, 1.305073, -0.2257059, 1, 1, 1, 1, 1,
-0.6696762, 0.01364672, 0.02761235, 1, 1, 1, 1, 1,
-0.6692393, 0.91504, -1.160735, 1, 1, 1, 1, 1,
-0.6684147, 0.6295332, -2.033918, 1, 1, 1, 1, 1,
-0.6675246, 0.7921803, -0.2194818, 1, 1, 1, 1, 1,
-0.666757, 0.7498725, -1.758209, 1, 1, 1, 1, 1,
-0.6656814, -0.8651012, -1.823186, 1, 1, 1, 1, 1,
-0.6656373, -1.141744, -2.25254, 1, 1, 1, 1, 1,
-0.6620245, -0.4149976, -1.292493, 1, 1, 1, 1, 1,
-0.6619655, -0.05352198, -1.023796, 1, 1, 1, 1, 1,
-0.6562819, -0.09370857, -0.9347637, 1, 1, 1, 1, 1,
-0.6561338, 0.4882767, -1.169012, 1, 1, 1, 1, 1,
-0.6508675, -0.2622828, -2.785719, 1, 1, 1, 1, 1,
-0.6497386, -0.6259309, -1.729339, 1, 1, 1, 1, 1,
-0.647529, -1.019179, -4.031188, 0, 0, 1, 1, 1,
-0.6462206, 1.157565, 0.3104021, 1, 0, 0, 1, 1,
-0.6458833, 0.7416318, -0.09904038, 1, 0, 0, 1, 1,
-0.6375583, 1.034032, 0.4470329, 1, 0, 0, 1, 1,
-0.6335899, 2.372185, -1.929993, 1, 0, 0, 1, 1,
-0.6266859, 1.3411, -2.426471, 1, 0, 0, 1, 1,
-0.6216552, 0.3877392, 1.314209, 0, 0, 0, 1, 1,
-0.6123366, -0.04681269, -1.294585, 0, 0, 0, 1, 1,
-0.61093, 0.1558852, -1.016928, 0, 0, 0, 1, 1,
-0.6104442, -1.485963, -2.60466, 0, 0, 0, 1, 1,
-0.6088791, 2.956827, 0.07198534, 0, 0, 0, 1, 1,
-0.6064951, -1.885347, -3.882929, 0, 0, 0, 1, 1,
-0.6041954, -1.227978, -3.354108, 0, 0, 0, 1, 1,
-0.6032267, -2.264396, -3.525972, 1, 1, 1, 1, 1,
-0.5994138, -0.2578317, -3.674317, 1, 1, 1, 1, 1,
-0.5959206, 1.845541, -1.57008, 1, 1, 1, 1, 1,
-0.5874052, 0.009663548, -1.744613, 1, 1, 1, 1, 1,
-0.5818495, 0.6704588, -1.443362, 1, 1, 1, 1, 1,
-0.5793577, -0.1796557, -2.01853, 1, 1, 1, 1, 1,
-0.5769213, 0.4475403, -2.810049, 1, 1, 1, 1, 1,
-0.5744635, -0.7194702, -2.524895, 1, 1, 1, 1, 1,
-0.571731, 0.3954928, -0.5381181, 1, 1, 1, 1, 1,
-0.5664853, 0.2796504, -2.311372, 1, 1, 1, 1, 1,
-0.566082, 0.3275631, -0.306257, 1, 1, 1, 1, 1,
-0.5634106, -0.678912, -2.417842, 1, 1, 1, 1, 1,
-0.5557667, 0.358079, -1.436961, 1, 1, 1, 1, 1,
-0.5535621, -0.7318242, -3.246707, 1, 1, 1, 1, 1,
-0.5534094, 0.9600585, 0.5383621, 1, 1, 1, 1, 1,
-0.5531023, 0.3170256, -2.489845, 0, 0, 1, 1, 1,
-0.5521836, -0.02996199, -1.931907, 1, 0, 0, 1, 1,
-0.5514924, 0.3922658, 1.384284, 1, 0, 0, 1, 1,
-0.5434941, 1.14078, 0.2860218, 1, 0, 0, 1, 1,
-0.5429844, 0.8991834, 1.311755, 1, 0, 0, 1, 1,
-0.5361313, 0.7322429, -0.5559238, 1, 0, 0, 1, 1,
-0.530524, -0.577002, -1.5449, 0, 0, 0, 1, 1,
-0.5240988, 0.1449647, -0.175729, 0, 0, 0, 1, 1,
-0.5229332, 0.13199, -0.1405039, 0, 0, 0, 1, 1,
-0.5164554, -1.149672, -2.078631, 0, 0, 0, 1, 1,
-0.5109233, 1.118533, -0.1480048, 0, 0, 0, 1, 1,
-0.5068324, -0.1710923, -0.8802006, 0, 0, 0, 1, 1,
-0.5033016, 0.2022718, -1.898383, 0, 0, 0, 1, 1,
-0.5027676, 0.666936, -0.214282, 1, 1, 1, 1, 1,
-0.4965159, -1.790701, -3.03971, 1, 1, 1, 1, 1,
-0.4941683, 1.45502, -1.252719, 1, 1, 1, 1, 1,
-0.4919147, 0.4984453, -1.566717, 1, 1, 1, 1, 1,
-0.4905328, 0.8080034, -1.265133, 1, 1, 1, 1, 1,
-0.4900162, -0.6368215, -2.435136, 1, 1, 1, 1, 1,
-0.4899763, 0.1113794, -0.3195769, 1, 1, 1, 1, 1,
-0.4866688, 0.8127865, 0.5370429, 1, 1, 1, 1, 1,
-0.4816731, 1.388529, -0.9698181, 1, 1, 1, 1, 1,
-0.4814292, -0.2622992, -1.744431, 1, 1, 1, 1, 1,
-0.4791334, -0.8759837, -3.603287, 1, 1, 1, 1, 1,
-0.4744239, -0.4311, -2.439082, 1, 1, 1, 1, 1,
-0.4735547, -0.8845713, -1.832324, 1, 1, 1, 1, 1,
-0.4708402, 0.3416761, -2.459993, 1, 1, 1, 1, 1,
-0.4705832, -0.385491, -4.123125, 1, 1, 1, 1, 1,
-0.4697434, -0.07107286, -2.198043, 0, 0, 1, 1, 1,
-0.4624904, 0.441007, 0.4177785, 1, 0, 0, 1, 1,
-0.4623429, -1.915109, -2.762238, 1, 0, 0, 1, 1,
-0.4588853, -0.342355, -1.672849, 1, 0, 0, 1, 1,
-0.4588817, -1.382073, -2.483428, 1, 0, 0, 1, 1,
-0.4581624, -0.4644411, -1.582635, 1, 0, 0, 1, 1,
-0.4531475, -1.215952, -0.8971869, 0, 0, 0, 1, 1,
-0.4526137, 0.6601209, -0.6449013, 0, 0, 0, 1, 1,
-0.4487973, -0.2583477, -0.4047318, 0, 0, 0, 1, 1,
-0.4452661, 0.6644091, -0.4047624, 0, 0, 0, 1, 1,
-0.4442749, -0.3793271, -2.728826, 0, 0, 0, 1, 1,
-0.4427454, -1.149241, -1.473618, 0, 0, 0, 1, 1,
-0.4426627, 1.118798, -0.8233603, 0, 0, 0, 1, 1,
-0.440622, 0.6339241, 0.964924, 1, 1, 1, 1, 1,
-0.4323915, -1.286719, -2.014784, 1, 1, 1, 1, 1,
-0.426588, 0.5410229, -0.8023641, 1, 1, 1, 1, 1,
-0.4241835, -0.6434701, 0.4369614, 1, 1, 1, 1, 1,
-0.4186742, -0.5410069, -3.275577, 1, 1, 1, 1, 1,
-0.4152331, 0.984512, 0.5754026, 1, 1, 1, 1, 1,
-0.4146031, 1.233711, -2.346922, 1, 1, 1, 1, 1,
-0.4117247, 1.336822, 0.3166917, 1, 1, 1, 1, 1,
-0.4114884, -1.616374, -2.255948, 1, 1, 1, 1, 1,
-0.4050768, -0.6280221, -0.8856746, 1, 1, 1, 1, 1,
-0.4026416, -0.4299665, -3.683682, 1, 1, 1, 1, 1,
-0.4001635, 0.6139784, -0.331884, 1, 1, 1, 1, 1,
-0.3975936, -0.7497693, -3.024216, 1, 1, 1, 1, 1,
-0.3942724, 1.365258, -0.8721581, 1, 1, 1, 1, 1,
-0.3906648, 1.189693, -0.6111346, 1, 1, 1, 1, 1,
-0.3875548, -0.3193892, -1.243797, 0, 0, 1, 1, 1,
-0.381328, 0.1868617, -3.599903, 1, 0, 0, 1, 1,
-0.3791929, 0.2891767, -0.3716474, 1, 0, 0, 1, 1,
-0.3734599, -1.572299, -1.419144, 1, 0, 0, 1, 1,
-0.3728644, -0.07493345, -2.510446, 1, 0, 0, 1, 1,
-0.3718845, 0.6360294, -0.486311, 1, 0, 0, 1, 1,
-0.3666115, -0.6984684, -2.584629, 0, 0, 0, 1, 1,
-0.3649759, 0.6844702, 0.4456937, 0, 0, 0, 1, 1,
-0.3647678, 0.8984095, 0.745306, 0, 0, 0, 1, 1,
-0.3628391, -1.231007, -2.526463, 0, 0, 0, 1, 1,
-0.3609457, 1.292916, 1.093245, 0, 0, 0, 1, 1,
-0.3589494, 0.4341698, -0.9864329, 0, 0, 0, 1, 1,
-0.3527593, 0.06575977, -1.873894, 0, 0, 0, 1, 1,
-0.3526985, -1.204751, -3.065243, 1, 1, 1, 1, 1,
-0.3468689, 0.9682374, -0.177279, 1, 1, 1, 1, 1,
-0.3315399, -0.02244941, -1.157241, 1, 1, 1, 1, 1,
-0.3266252, 0.9059547, 1.392147, 1, 1, 1, 1, 1,
-0.3243034, -1.165808, -3.50734, 1, 1, 1, 1, 1,
-0.3231093, 0.9362582, -0.5221712, 1, 1, 1, 1, 1,
-0.3160211, 0.6876401, -0.9892257, 1, 1, 1, 1, 1,
-0.312826, -0.9242278, -4.479768, 1, 1, 1, 1, 1,
-0.3098207, 0.4868327, -1.194517, 1, 1, 1, 1, 1,
-0.3091805, 0.4429486, 1.311322, 1, 1, 1, 1, 1,
-0.3085174, -1.184363, -1.95561, 1, 1, 1, 1, 1,
-0.3083454, 1.571572, 0.2880324, 1, 1, 1, 1, 1,
-0.3053864, -0.4663127, -3.666794, 1, 1, 1, 1, 1,
-0.2982275, -0.08713383, -0.6987017, 1, 1, 1, 1, 1,
-0.2961194, -0.7496595, -4.180483, 1, 1, 1, 1, 1,
-0.2940626, -1.855826, -3.624444, 0, 0, 1, 1, 1,
-0.2940528, 1.022664, -1.18755, 1, 0, 0, 1, 1,
-0.2917863, -0.5044083, -1.864836, 1, 0, 0, 1, 1,
-0.2843676, -1.246645, -1.76489, 1, 0, 0, 1, 1,
-0.2843399, -0.942253, -1.836794, 1, 0, 0, 1, 1,
-0.2832349, -0.9040176, -4.122037, 1, 0, 0, 1, 1,
-0.2773003, 0.6507347, -2.294779, 0, 0, 0, 1, 1,
-0.2745863, -1.014473, -4.552639, 0, 0, 0, 1, 1,
-0.2724526, 0.7232036, -2.284075, 0, 0, 0, 1, 1,
-0.2714549, -0.1182087, -3.490851, 0, 0, 0, 1, 1,
-0.2676082, 0.2206014, 0.2063131, 0, 0, 0, 1, 1,
-0.2664691, -0.5358658, -2.279941, 0, 0, 0, 1, 1,
-0.2663106, -0.1085071, -1.093395, 0, 0, 0, 1, 1,
-0.265444, -1.852577, -2.663149, 1, 1, 1, 1, 1,
-0.2579912, 1.930521, -0.7280819, 1, 1, 1, 1, 1,
-0.2534033, -0.9085551, -2.371197, 1, 1, 1, 1, 1,
-0.2498532, -0.6310722, -3.266962, 1, 1, 1, 1, 1,
-0.2482519, 0.8990105, 0.1251104, 1, 1, 1, 1, 1,
-0.2471233, 0.06010627, -0.02809079, 1, 1, 1, 1, 1,
-0.2443007, 0.6923043, -0.5214271, 1, 1, 1, 1, 1,
-0.2401137, -1.025005, -3.584545, 1, 1, 1, 1, 1,
-0.2392853, -0.2905964, -1.047932, 1, 1, 1, 1, 1,
-0.2384452, -0.559788, -4.170195, 1, 1, 1, 1, 1,
-0.2346782, 0.4261763, 0.7122415, 1, 1, 1, 1, 1,
-0.2331125, 2.251611, -1.869535, 1, 1, 1, 1, 1,
-0.2329549, 1.182284, -0.7806639, 1, 1, 1, 1, 1,
-0.2316005, 1.826442, -1.753044, 1, 1, 1, 1, 1,
-0.2240704, 1.320145, -1.671968, 1, 1, 1, 1, 1,
-0.2227389, 0.3934197, 1.872401, 0, 0, 1, 1, 1,
-0.2183398, -0.06728765, -2.167226, 1, 0, 0, 1, 1,
-0.2146114, 0.1772203, -0.9823385, 1, 0, 0, 1, 1,
-0.2073957, -0.7808772, -3.238139, 1, 0, 0, 1, 1,
-0.205257, -0.8039183, -1.595915, 1, 0, 0, 1, 1,
-0.198976, -0.1465531, -1.903997, 1, 0, 0, 1, 1,
-0.1973867, 1.118165, -0.6207159, 0, 0, 0, 1, 1,
-0.195156, 2.039193, 0.8819742, 0, 0, 0, 1, 1,
-0.1933264, 1.303149, -0.877297, 0, 0, 0, 1, 1,
-0.1911738, -1.390943, -3.30433, 0, 0, 0, 1, 1,
-0.1909991, -0.8262739, -3.310891, 0, 0, 0, 1, 1,
-0.1823189, -0.5423689, -2.139838, 0, 0, 0, 1, 1,
-0.1741142, -1.595233, -2.965587, 0, 0, 0, 1, 1,
-0.1734701, 0.0140751, -4.486586, 1, 1, 1, 1, 1,
-0.1709149, 0.3144996, 0.09961246, 1, 1, 1, 1, 1,
-0.1707204, 0.8791056, -0.8843675, 1, 1, 1, 1, 1,
-0.166344, 1.353131, 1.970442, 1, 1, 1, 1, 1,
-0.1656154, -0.9397506, -2.817176, 1, 1, 1, 1, 1,
-0.1610397, 1.720054, -0.2630479, 1, 1, 1, 1, 1,
-0.1605671, -0.4587283, -3.385436, 1, 1, 1, 1, 1,
-0.1551428, -1.54651, -2.044828, 1, 1, 1, 1, 1,
-0.1496362, -1.13464, -4.15846, 1, 1, 1, 1, 1,
-0.1482302, -1.356058, -4.471199, 1, 1, 1, 1, 1,
-0.1478984, -0.9612705, -3.666872, 1, 1, 1, 1, 1,
-0.1435624, -0.5834943, -2.933662, 1, 1, 1, 1, 1,
-0.1432785, 1.311124, 0.7161054, 1, 1, 1, 1, 1,
-0.1408271, -0.8684894, -3.397466, 1, 1, 1, 1, 1,
-0.1395836, -1.804085, -2.563102, 1, 1, 1, 1, 1,
-0.1391488, 1.023953, 0.3643941, 0, 0, 1, 1, 1,
-0.1365774, 1.079384, 0.1089704, 1, 0, 0, 1, 1,
-0.1361134, -1.394325, -2.345728, 1, 0, 0, 1, 1,
-0.1359867, -0.2637455, -2.933768, 1, 0, 0, 1, 1,
-0.1326537, -2.576815, -2.303841, 1, 0, 0, 1, 1,
-0.1295675, -0.6590334, -3.412697, 1, 0, 0, 1, 1,
-0.1261805, -0.3121311, -1.70876, 0, 0, 0, 1, 1,
-0.1215742, -0.700767, -2.855311, 0, 0, 0, 1, 1,
-0.1140449, -0.6961145, -1.986138, 0, 0, 0, 1, 1,
-0.1119299, 0.04505657, -0.6100483, 0, 0, 0, 1, 1,
-0.1112583, -0.8967248, -3.250326, 0, 0, 0, 1, 1,
-0.1110548, 0.1122589, -1.665782, 0, 0, 0, 1, 1,
-0.1077289, 2.379772, 0.3004899, 0, 0, 0, 1, 1,
-0.103113, 0.2238504, -0.5566376, 1, 1, 1, 1, 1,
-0.1029535, 0.1527557, 0.08238928, 1, 1, 1, 1, 1,
-0.09476405, -0.4746688, -3.051481, 1, 1, 1, 1, 1,
-0.09309895, 2.389856, -0.3166655, 1, 1, 1, 1, 1,
-0.08775936, 0.8307918, 1.359947, 1, 1, 1, 1, 1,
-0.08643722, -0.09118716, -2.462451, 1, 1, 1, 1, 1,
-0.0852585, 0.05029834, -1.594928, 1, 1, 1, 1, 1,
-0.08475387, -0.987406, -1.499033, 1, 1, 1, 1, 1,
-0.08408932, -0.5468215, -1.252887, 1, 1, 1, 1, 1,
-0.08362534, -1.414261, -3.860818, 1, 1, 1, 1, 1,
-0.08041734, 0.01827971, -0.7680373, 1, 1, 1, 1, 1,
-0.08024177, -0.725692, -5.773101, 1, 1, 1, 1, 1,
-0.07198533, -0.06331626, -2.676041, 1, 1, 1, 1, 1,
-0.06897155, -1.470078, -1.986079, 1, 1, 1, 1, 1,
-0.06834325, 0.8013169, 0.9013901, 1, 1, 1, 1, 1,
-0.06719691, 0.3875525, -0.02098166, 0, 0, 1, 1, 1,
-0.0625615, 1.511039, -0.44259, 1, 0, 0, 1, 1,
-0.05856092, 0.6918907, 0.03692945, 1, 0, 0, 1, 1,
-0.05658893, 1.170336, -0.800593, 1, 0, 0, 1, 1,
-0.05432747, -1.864093, -1.844967, 1, 0, 0, 1, 1,
-0.05110448, 0.4687184, -1.549679, 1, 0, 0, 1, 1,
-0.04945373, 0.8403376, 0.9380627, 0, 0, 0, 1, 1,
-0.04901592, -0.8614177, -4.245134, 0, 0, 0, 1, 1,
-0.04665639, 0.8538055, 2.371075, 0, 0, 0, 1, 1,
-0.04525013, 0.1843751, 0.2137213, 0, 0, 0, 1, 1,
-0.04483385, 0.6096283, 1.390642, 0, 0, 0, 1, 1,
-0.04399698, 0.006915676, -0.3488024, 0, 0, 0, 1, 1,
-0.03986536, -1.027808, -2.55053, 0, 0, 0, 1, 1,
-0.03523587, -1.077778, -3.273348, 1, 1, 1, 1, 1,
-0.03321717, 0.09136353, -1.311265, 1, 1, 1, 1, 1,
-0.03138023, -1.277492, -2.766905, 1, 1, 1, 1, 1,
-0.02949865, 0.1210045, -0.5741219, 1, 1, 1, 1, 1,
-0.02237402, 0.3447596, 0.482441, 1, 1, 1, 1, 1,
-0.01475718, 0.8519503, 1.842787, 1, 1, 1, 1, 1,
-0.009726915, 2.372611, 0.5133393, 1, 1, 1, 1, 1,
-0.002450482, -0.5912463, -3.726852, 1, 1, 1, 1, 1,
-0.001957821, 0.2693953, 1.58832, 1, 1, 1, 1, 1,
-0.001804026, -1.449865, -2.874579, 1, 1, 1, 1, 1,
0.001006225, 0.5340597, -0.01869706, 1, 1, 1, 1, 1,
0.007776352, -0.3144686, 4.170546, 1, 1, 1, 1, 1,
0.008816991, 1.165771, 0.6166814, 1, 1, 1, 1, 1,
0.0111764, 0.1204382, 1.834391, 1, 1, 1, 1, 1,
0.01194675, 0.09387704, -0.6966014, 1, 1, 1, 1, 1,
0.01328744, -0.04995915, 3.613063, 0, 0, 1, 1, 1,
0.01520753, -0.1058215, 2.640738, 1, 0, 0, 1, 1,
0.01523346, 0.07499631, 0.901346, 1, 0, 0, 1, 1,
0.0191107, -0.6737481, 3.241923, 1, 0, 0, 1, 1,
0.02072709, -0.7403767, 3.278319, 1, 0, 0, 1, 1,
0.02129274, -0.6555803, 2.508624, 1, 0, 0, 1, 1,
0.02217641, -0.217523, 2.959702, 0, 0, 0, 1, 1,
0.02538116, 0.8265281, -0.9910736, 0, 0, 0, 1, 1,
0.0263532, -0.5551392, 4.887058, 0, 0, 0, 1, 1,
0.03230641, 3.101302, 0.8646498, 0, 0, 0, 1, 1,
0.03327519, 0.6677536, 0.4321861, 0, 0, 0, 1, 1,
0.03334285, -0.7612631, 2.76664, 0, 0, 0, 1, 1,
0.0378947, -0.7893853, 2.459015, 0, 0, 0, 1, 1,
0.03861629, 1.553419, 0.5657132, 1, 1, 1, 1, 1,
0.03939134, 0.7348016, 0.09639733, 1, 1, 1, 1, 1,
0.04392739, 0.4193845, -0.7351463, 1, 1, 1, 1, 1,
0.0440155, 2.483412, 0.1267445, 1, 1, 1, 1, 1,
0.04419952, -0.8399486, 2.653068, 1, 1, 1, 1, 1,
0.04830655, -0.4476626, 2.771783, 1, 1, 1, 1, 1,
0.05080775, 0.4382961, -1.272455, 1, 1, 1, 1, 1,
0.05396397, 0.9171392, -0.5082223, 1, 1, 1, 1, 1,
0.05627871, -0.09506824, 2.577337, 1, 1, 1, 1, 1,
0.05747117, 2.265739, -0.1143913, 1, 1, 1, 1, 1,
0.05773821, 1.069494, 0.3910131, 1, 1, 1, 1, 1,
0.05988547, 0.4051377, -1.64225, 1, 1, 1, 1, 1,
0.06277756, 1.739429, -1.9894, 1, 1, 1, 1, 1,
0.06418673, 1.986089, -1.712482, 1, 1, 1, 1, 1,
0.06428319, 0.1696958, 0.04205596, 1, 1, 1, 1, 1,
0.06581141, -0.4412264, 3.540405, 0, 0, 1, 1, 1,
0.0670766, -0.2791416, 1.637309, 1, 0, 0, 1, 1,
0.0689479, -0.5039591, 4.449167, 1, 0, 0, 1, 1,
0.07575435, -0.6077548, 2.21764, 1, 0, 0, 1, 1,
0.07613569, 0.4303342, -0.7381287, 1, 0, 0, 1, 1,
0.07767703, -0.1387789, 3.715464, 1, 0, 0, 1, 1,
0.08123635, -0.3633671, 4.336105, 0, 0, 0, 1, 1,
0.0822706, -1.500952, 2.638528, 0, 0, 0, 1, 1,
0.08454448, 1.339238, 0.4419133, 0, 0, 0, 1, 1,
0.08464852, -1.136423, 3.065293, 0, 0, 0, 1, 1,
0.08468686, 0.3142777, 1.947874, 0, 0, 0, 1, 1,
0.09418543, -1.226291, 3.175927, 0, 0, 0, 1, 1,
0.1007144, -0.2470897, 1.352897, 0, 0, 0, 1, 1,
0.1019616, -0.1009816, 2.709756, 1, 1, 1, 1, 1,
0.1034681, -0.8267063, 4.250847, 1, 1, 1, 1, 1,
0.1037642, -0.1708816, 2.693388, 1, 1, 1, 1, 1,
0.1055889, 0.5163236, -0.07271087, 1, 1, 1, 1, 1,
0.1070129, -0.1434331, 1.960701, 1, 1, 1, 1, 1,
0.1073513, 0.3267181, 1.044614, 1, 1, 1, 1, 1,
0.108116, -1.263838, 2.527282, 1, 1, 1, 1, 1,
0.1086315, 0.5430483, 0.7449605, 1, 1, 1, 1, 1,
0.1145895, -0.4787519, 2.175789, 1, 1, 1, 1, 1,
0.1154475, 1.838773, 1.114309, 1, 1, 1, 1, 1,
0.1181865, -0.8503245, 2.008393, 1, 1, 1, 1, 1,
0.1245514, 0.9643369, -0.2522566, 1, 1, 1, 1, 1,
0.1302633, 0.1407363, 1.99456, 1, 1, 1, 1, 1,
0.1312972, -0.1702365, 3.105389, 1, 1, 1, 1, 1,
0.1372813, -0.02041478, 1.33771, 1, 1, 1, 1, 1,
0.1390844, -0.8987253, 3.600909, 0, 0, 1, 1, 1,
0.1407158, -0.5399022, 1.896281, 1, 0, 0, 1, 1,
0.1411082, -1.917264, 2.026872, 1, 0, 0, 1, 1,
0.1464343, 1.338845, -1.032609, 1, 0, 0, 1, 1,
0.1485212, 1.741931, -0.5076153, 1, 0, 0, 1, 1,
0.1495406, -0.5294729, 1.574636, 1, 0, 0, 1, 1,
0.1501496, 0.8774509, 0.2755585, 0, 0, 0, 1, 1,
0.1516661, 1.650361, -1.505867, 0, 0, 0, 1, 1,
0.1523704, 0.02070391, 0.3669007, 0, 0, 0, 1, 1,
0.1535518, 0.9799203, -0.3398573, 0, 0, 0, 1, 1,
0.1554363, 1.410668, 0.141311, 0, 0, 0, 1, 1,
0.1603423, 1.693655, 0.5236082, 0, 0, 0, 1, 1,
0.1617196, 0.5420099, -1.260399, 0, 0, 0, 1, 1,
0.1664135, 1.734101, 1.548464, 1, 1, 1, 1, 1,
0.1686627, -1.19211, 2.10277, 1, 1, 1, 1, 1,
0.1736445, 0.05720849, 1.840105, 1, 1, 1, 1, 1,
0.1744011, 0.9327807, -0.285168, 1, 1, 1, 1, 1,
0.1780722, -0.262941, 1.461439, 1, 1, 1, 1, 1,
0.1791666, -0.4990511, 3.342222, 1, 1, 1, 1, 1,
0.1821516, -0.4450466, 1.407962, 1, 1, 1, 1, 1,
0.1834364, -0.9048004, 3.855806, 1, 1, 1, 1, 1,
0.1843013, 0.4349983, -0.5087954, 1, 1, 1, 1, 1,
0.1886715, 0.4502815, 0.525353, 1, 1, 1, 1, 1,
0.1922123, -0.6659948, 1.426753, 1, 1, 1, 1, 1,
0.1959629, -1.262602, 2.414351, 1, 1, 1, 1, 1,
0.1987881, -1.348653, 3.166882, 1, 1, 1, 1, 1,
0.1989975, 0.1806572, -0.1984737, 1, 1, 1, 1, 1,
0.1990052, -1.002273, 2.196314, 1, 1, 1, 1, 1,
0.1999795, -0.1961441, 2.118093, 0, 0, 1, 1, 1,
0.2032973, 0.6156369, 0.4905585, 1, 0, 0, 1, 1,
0.2043674, -0.4979415, 2.86817, 1, 0, 0, 1, 1,
0.2070312, -1.408954, 3.889437, 1, 0, 0, 1, 1,
0.211088, 0.6364188, 0.2748372, 1, 0, 0, 1, 1,
0.2117504, -0.7637063, 3.838984, 1, 0, 0, 1, 1,
0.2169457, -0.06621024, 1.683775, 0, 0, 0, 1, 1,
0.2174347, 1.281568, 0.7069595, 0, 0, 0, 1, 1,
0.2188923, 0.4905276, 1.073906, 0, 0, 0, 1, 1,
0.2196045, 0.8403824, -1.122926, 0, 0, 0, 1, 1,
0.220745, -0.7841344, 3.01764, 0, 0, 0, 1, 1,
0.2209175, -0.5522458, 1.870577, 0, 0, 0, 1, 1,
0.2233526, 0.3134969, 0.7640342, 0, 0, 0, 1, 1,
0.2278988, -0.6492547, 4.516102, 1, 1, 1, 1, 1,
0.2307933, -0.1619671, 1.402495, 1, 1, 1, 1, 1,
0.2309376, -0.7869768, 2.004293, 1, 1, 1, 1, 1,
0.2313446, 1.060315, -0.04654436, 1, 1, 1, 1, 1,
0.2328503, 0.2824585, 2.149273, 1, 1, 1, 1, 1,
0.2368923, -0.08819158, 1.643303, 1, 1, 1, 1, 1,
0.2386438, -2.136076, 2.222147, 1, 1, 1, 1, 1,
0.241717, -0.6304591, 1.399185, 1, 1, 1, 1, 1,
0.2421556, 0.5901651, 0.5494131, 1, 1, 1, 1, 1,
0.2542638, 0.2119674, 2.525751, 1, 1, 1, 1, 1,
0.2574843, -1.016034, 5.147513, 1, 1, 1, 1, 1,
0.2593718, -2.540726, 2.38198, 1, 1, 1, 1, 1,
0.2605321, -1.453481, 1.854183, 1, 1, 1, 1, 1,
0.2609124, 1.647309, 1.900992, 1, 1, 1, 1, 1,
0.2633942, 0.642536, 1.465214, 1, 1, 1, 1, 1,
0.2650879, 0.6744196, 0.7227278, 0, 0, 1, 1, 1,
0.2678596, 0.8373024, -0.7138665, 1, 0, 0, 1, 1,
0.2696041, -0.264576, 1.677419, 1, 0, 0, 1, 1,
0.2709563, -0.4239939, 4.263538, 1, 0, 0, 1, 1,
0.2720176, 1.336385, -0.4690782, 1, 0, 0, 1, 1,
0.2738981, -2.091801, 3.011853, 1, 0, 0, 1, 1,
0.2775643, 0.09433158, 0.3705849, 0, 0, 0, 1, 1,
0.2776911, -0.1189263, 2.593536, 0, 0, 0, 1, 1,
0.2814468, -0.6053364, 2.987755, 0, 0, 0, 1, 1,
0.2841774, 0.479922, 0.01155441, 0, 0, 0, 1, 1,
0.2901716, -0.6834804, 1.156171, 0, 0, 0, 1, 1,
0.2920696, -0.857543, 4.206025, 0, 0, 0, 1, 1,
0.2930697, 0.8623509, 1.748265, 0, 0, 0, 1, 1,
0.2953085, 1.666228, 2.177466, 1, 1, 1, 1, 1,
0.2954096, -0.4161982, 2.14146, 1, 1, 1, 1, 1,
0.2954373, 0.5512322, 0.9392613, 1, 1, 1, 1, 1,
0.2978261, 1.581121, 0.1087177, 1, 1, 1, 1, 1,
0.2982335, 0.2514242, 2.193982, 1, 1, 1, 1, 1,
0.2988481, 0.6556219, 0.3124988, 1, 1, 1, 1, 1,
0.3048971, 2.228207, -1.569169, 1, 1, 1, 1, 1,
0.3118903, 1.029027, -0.1246662, 1, 1, 1, 1, 1,
0.3174462, 0.7644276, 0.5875268, 1, 1, 1, 1, 1,
0.3198127, -0.1268053, 0.7999891, 1, 1, 1, 1, 1,
0.3215772, -0.1653566, 1.136183, 1, 1, 1, 1, 1,
0.3227185, -0.6283848, 2.34843, 1, 1, 1, 1, 1,
0.3243929, 0.8208843, 1.449081, 1, 1, 1, 1, 1,
0.3256455, -0.6113418, 3.740424, 1, 1, 1, 1, 1,
0.3260698, -0.1386399, 1.842124, 1, 1, 1, 1, 1,
0.3261634, 0.1347792, -0.1161649, 0, 0, 1, 1, 1,
0.3267492, 0.02125031, -0.7939817, 1, 0, 0, 1, 1,
0.3278562, -2.726923, 3.79404, 1, 0, 0, 1, 1,
0.328422, 0.9840994, 0.5789169, 1, 0, 0, 1, 1,
0.3314382, -0.556372, 2.418574, 1, 0, 0, 1, 1,
0.3330253, -0.1066426, 1.997196, 1, 0, 0, 1, 1,
0.3360539, 0.6196179, 0.3079304, 0, 0, 0, 1, 1,
0.3367662, -0.275893, 3.42858, 0, 0, 0, 1, 1,
0.3372765, 1.164816, 0.6116889, 0, 0, 0, 1, 1,
0.3382667, -0.3276716, 2.797467, 0, 0, 0, 1, 1,
0.3413934, -2.566025, 1.562171, 0, 0, 0, 1, 1,
0.3417147, -0.9935887, 2.399439, 0, 0, 0, 1, 1,
0.3421789, 0.3910776, -0.2713283, 0, 0, 0, 1, 1,
0.3435521, -0.9337087, 1.98336, 1, 1, 1, 1, 1,
0.3487121, 0.4523, -0.4904846, 1, 1, 1, 1, 1,
0.3579333, -0.565415, 2.742511, 1, 1, 1, 1, 1,
0.3630791, 0.4842482, 0.1560995, 1, 1, 1, 1, 1,
0.375115, 1.164213, 0.1809465, 1, 1, 1, 1, 1,
0.3803652, -1.007893, 3.672365, 1, 1, 1, 1, 1,
0.3817449, -0.6978691, 2.539104, 1, 1, 1, 1, 1,
0.3823442, -0.2803574, 2.990811, 1, 1, 1, 1, 1,
0.3862012, -1.45128, 4.069812, 1, 1, 1, 1, 1,
0.3865222, 0.8850497, 2.856206, 1, 1, 1, 1, 1,
0.3872543, 0.3166706, 0.7767121, 1, 1, 1, 1, 1,
0.3918805, -0.05231027, 1.762971, 1, 1, 1, 1, 1,
0.3966476, 1.576769, 1.130185, 1, 1, 1, 1, 1,
0.3969254, -0.9626474, 3.680209, 1, 1, 1, 1, 1,
0.4051346, -0.8552684, 2.7115, 1, 1, 1, 1, 1,
0.4097142, 1.793056, 1.030519, 0, 0, 1, 1, 1,
0.4113951, 0.7802263, 1.368183, 1, 0, 0, 1, 1,
0.4155177, 0.4214002, 1.366628, 1, 0, 0, 1, 1,
0.4177296, -0.6824887, 3.171146, 1, 0, 0, 1, 1,
0.4253366, -1.1602, 1.613605, 1, 0, 0, 1, 1,
0.4270833, 0.2594625, 1.022326, 1, 0, 0, 1, 1,
0.4296, -1.787792, 3.352157, 0, 0, 0, 1, 1,
0.4303009, 0.8247043, 0.4925106, 0, 0, 0, 1, 1,
0.4307983, 0.615258, -0.6605176, 0, 0, 0, 1, 1,
0.4390213, -0.7905167, 1.843343, 0, 0, 0, 1, 1,
0.4392546, -0.7467027, 0.07804166, 0, 0, 0, 1, 1,
0.4400516, -1.198877, 2.031392, 0, 0, 0, 1, 1,
0.4448054, 1.169757, -0.826921, 0, 0, 0, 1, 1,
0.4480889, -2.023424, 1.89815, 1, 1, 1, 1, 1,
0.4487702, -0.9018212, 2.468359, 1, 1, 1, 1, 1,
0.4522232, -0.008380475, 2.034312, 1, 1, 1, 1, 1,
0.4545314, 1.117408, 0.3197451, 1, 1, 1, 1, 1,
0.4603277, 0.2595127, 0.1256721, 1, 1, 1, 1, 1,
0.4641809, 0.2125869, 2.521622, 1, 1, 1, 1, 1,
0.4642912, 0.5415116, 2.089466, 1, 1, 1, 1, 1,
0.4675928, 0.1769029, 1.380805, 1, 1, 1, 1, 1,
0.4676901, -0.4940704, 1.008469, 1, 1, 1, 1, 1,
0.4694099, -0.4141564, 3.501802, 1, 1, 1, 1, 1,
0.4705479, -0.8734333, 3.251772, 1, 1, 1, 1, 1,
0.4718668, -0.05970538, 1.170872, 1, 1, 1, 1, 1,
0.4757197, 0.6599274, -0.4375254, 1, 1, 1, 1, 1,
0.4767828, -0.1398237, 0.3440728, 1, 1, 1, 1, 1,
0.4774901, -1.224808, 2.5265, 1, 1, 1, 1, 1,
0.4843548, 2.255453, 0.1985367, 0, 0, 1, 1, 1,
0.4881709, 1.354957, 0.2215768, 1, 0, 0, 1, 1,
0.4893688, -0.2567951, 3.760238, 1, 0, 0, 1, 1,
0.4901063, 1.415988, -0.9322584, 1, 0, 0, 1, 1,
0.4941877, 0.1282036, 0.7378877, 1, 0, 0, 1, 1,
0.4943173, 1.390378, 0.735306, 1, 0, 0, 1, 1,
0.4976512, 2.136517, 1.431467, 0, 0, 0, 1, 1,
0.5013869, -0.7406034, 0.7004772, 0, 0, 0, 1, 1,
0.5155349, -1.176349, 3.658533, 0, 0, 0, 1, 1,
0.5217009, 0.6876847, 0.6655571, 0, 0, 0, 1, 1,
0.5233891, 1.051127, -0.003282995, 0, 0, 0, 1, 1,
0.524313, 1.436726, 1.046536, 0, 0, 0, 1, 1,
0.5296719, 0.05007546, 1.748526, 0, 0, 0, 1, 1,
0.5320473, 0.647867, 2.083749, 1, 1, 1, 1, 1,
0.5332507, -0.2377505, 1.511949, 1, 1, 1, 1, 1,
0.5351158, 0.03390136, 0.8567848, 1, 1, 1, 1, 1,
0.5377392, 0.1630555, 0.3368728, 1, 1, 1, 1, 1,
0.5393401, 0.07871009, 0.2246146, 1, 1, 1, 1, 1,
0.540983, -0.3403257, 3.194907, 1, 1, 1, 1, 1,
0.5447044, -1.169386, 3.047546, 1, 1, 1, 1, 1,
0.5449538, -2.934358, 3.998889, 1, 1, 1, 1, 1,
0.5474235, -2.315424, 3.001363, 1, 1, 1, 1, 1,
0.550887, 0.5062192, 0.8791122, 1, 1, 1, 1, 1,
0.5513724, -0.9804344, 2.640032, 1, 1, 1, 1, 1,
0.5557286, -0.9772557, 3.823815, 1, 1, 1, 1, 1,
0.5607556, -0.6457739, 3.613709, 1, 1, 1, 1, 1,
0.568959, 1.999452, 0.130986, 1, 1, 1, 1, 1,
0.5716435, -1.764084, 2.112402, 1, 1, 1, 1, 1,
0.5720464, 0.5377549, 3.11292, 0, 0, 1, 1, 1,
0.576201, -0.2614486, 2.807389, 1, 0, 0, 1, 1,
0.5794654, -0.9529503, 1.363086, 1, 0, 0, 1, 1,
0.5843706, -0.1191284, 2.690134, 1, 0, 0, 1, 1,
0.5854628, -1.011822, 4.167593, 1, 0, 0, 1, 1,
0.5856245, 1.094689, 0.5302865, 1, 0, 0, 1, 1,
0.5876416, 0.4119743, 2.085541, 0, 0, 0, 1, 1,
0.5893973, 1.076328, 0.9134175, 0, 0, 0, 1, 1,
0.5986736, -0.1846253, 2.838714, 0, 0, 0, 1, 1,
0.5990611, -0.3182507, 2.549962, 0, 0, 0, 1, 1,
0.5991059, 0.753348, 3.045295, 0, 0, 0, 1, 1,
0.6076326, -0.2393939, 2.524556, 0, 0, 0, 1, 1,
0.6160492, 0.5560396, 1.461556, 0, 0, 0, 1, 1,
0.6219488, 1.128281, 1.110162, 1, 1, 1, 1, 1,
0.6287153, 0.5326872, 0.7593634, 1, 1, 1, 1, 1,
0.6368216, 1.265831, 1.025687, 1, 1, 1, 1, 1,
0.6392053, -0.9787968, 3.708053, 1, 1, 1, 1, 1,
0.6533085, -0.03396513, 1.639696, 1, 1, 1, 1, 1,
0.6537643, 0.2194409, 2.97819, 1, 1, 1, 1, 1,
0.6538449, -0.10948, 2.368615, 1, 1, 1, 1, 1,
0.6549759, 0.2471914, 2.500394, 1, 1, 1, 1, 1,
0.6554614, 0.2975124, 1.712903, 1, 1, 1, 1, 1,
0.6564864, -0.95539, 3.251704, 1, 1, 1, 1, 1,
0.6585332, -0.3214531, 2.68159, 1, 1, 1, 1, 1,
0.6705464, 2.410741, -0.4871682, 1, 1, 1, 1, 1,
0.6714115, 0.1986749, 2.212443, 1, 1, 1, 1, 1,
0.6720522, -1.732413, 2.74693, 1, 1, 1, 1, 1,
0.6846665, 1.123131, -0.4390378, 1, 1, 1, 1, 1,
0.6870725, -1.256526, 2.390329, 0, 0, 1, 1, 1,
0.6971936, -0.1246166, -0.3070271, 1, 0, 0, 1, 1,
0.6975169, 0.6590453, 1.926387, 1, 0, 0, 1, 1,
0.6985754, -1.639738, 0.808349, 1, 0, 0, 1, 1,
0.7013215, 0.6135666, 1.582834, 1, 0, 0, 1, 1,
0.7100834, 0.2963889, 0.981886, 1, 0, 0, 1, 1,
0.7116929, 0.994369, 0.9591061, 0, 0, 0, 1, 1,
0.7147871, -0.426463, 1.488377, 0, 0, 0, 1, 1,
0.7162477, -0.3071694, 2.33534, 0, 0, 0, 1, 1,
0.7164249, 0.8456658, 2.483796, 0, 0, 0, 1, 1,
0.716985, -0.3394592, 1.584308, 0, 0, 0, 1, 1,
0.7189739, -0.1955455, 2.562402, 0, 0, 0, 1, 1,
0.7201005, 1.126449, 2.442362, 0, 0, 0, 1, 1,
0.7202942, -0.2439222, 3.097853, 1, 1, 1, 1, 1,
0.722577, -0.3172114, 1.886197, 1, 1, 1, 1, 1,
0.7236265, 1.116714, 2.293528, 1, 1, 1, 1, 1,
0.7269409, 1.752379, -0.4577243, 1, 1, 1, 1, 1,
0.7272175, 1.269475, -0.007950764, 1, 1, 1, 1, 1,
0.7308131, 0.03324512, 0.6772675, 1, 1, 1, 1, 1,
0.7310032, 1.076697, -0.1780731, 1, 1, 1, 1, 1,
0.7337022, 0.4819866, 0.1495703, 1, 1, 1, 1, 1,
0.7356711, -1.57111, 4.211501, 1, 1, 1, 1, 1,
0.7362838, 1.373729, 0.8704277, 1, 1, 1, 1, 1,
0.7408257, 0.4452482, 0.6168386, 1, 1, 1, 1, 1,
0.7509021, -0.2702658, 2.778538, 1, 1, 1, 1, 1,
0.7643334, 0.75859, 1.284039, 1, 1, 1, 1, 1,
0.7653452, 1.440089, 0.0375766, 1, 1, 1, 1, 1,
0.768269, -0.1639335, 4.460272, 1, 1, 1, 1, 1,
0.774379, -0.2267334, 2.585528, 0, 0, 1, 1, 1,
0.7776865, 0.3281387, 1.23325, 1, 0, 0, 1, 1,
0.78558, -0.1588476, 0.1698375, 1, 0, 0, 1, 1,
0.788063, -0.044295, 1.682021, 1, 0, 0, 1, 1,
0.7926112, 0.6175864, 2.065747, 1, 0, 0, 1, 1,
0.7964969, -1.600682, 1.922912, 1, 0, 0, 1, 1,
0.7971286, 0.3824793, 1.832961, 0, 0, 0, 1, 1,
0.8067041, -1.810794, 1.621498, 0, 0, 0, 1, 1,
0.8147978, -0.7414382, 2.650963, 0, 0, 0, 1, 1,
0.8153569, 0.02731267, 1.298837, 0, 0, 0, 1, 1,
0.817177, -1.638573, 4.019802, 0, 0, 0, 1, 1,
0.8180943, -0.04413974, 3.018776, 0, 0, 0, 1, 1,
0.8195657, 0.05269183, 2.827915, 0, 0, 0, 1, 1,
0.8197219, -0.4683017, 1.856518, 1, 1, 1, 1, 1,
0.8201962, 0.5080884, 1.071229, 1, 1, 1, 1, 1,
0.8258455, 0.4548482, 0.4512972, 1, 1, 1, 1, 1,
0.8298883, -1.714113, 1.936861, 1, 1, 1, 1, 1,
0.8299496, 1.423309, 0.3065813, 1, 1, 1, 1, 1,
0.8317785, 0.6828641, 0.8873868, 1, 1, 1, 1, 1,
0.8379249, -0.6312717, 2.596864, 1, 1, 1, 1, 1,
0.8390073, 1.747255, 1.203009, 1, 1, 1, 1, 1,
0.8404924, 0.1784995, 0.520261, 1, 1, 1, 1, 1,
0.8416186, 0.08239217, 3.464152, 1, 1, 1, 1, 1,
0.8439205, -0.3638562, 2.727813, 1, 1, 1, 1, 1,
0.8491693, 0.8055452, 2.599406, 1, 1, 1, 1, 1,
0.8507987, 1.880773, 0.3484567, 1, 1, 1, 1, 1,
0.8516725, -1.356357, 3.242256, 1, 1, 1, 1, 1,
0.8644153, 0.003065483, 2.487466, 1, 1, 1, 1, 1,
0.8680179, -1.158306, 1.652234, 0, 0, 1, 1, 1,
0.8809541, 0.4666255, -0.2511224, 1, 0, 0, 1, 1,
0.8875762, 1.382141, 0.2993113, 1, 0, 0, 1, 1,
0.8883676, -1.108467, 1.378353, 1, 0, 0, 1, 1,
0.8972602, -1.331962, 1.729343, 1, 0, 0, 1, 1,
0.9008392, 1.150143, 1.030712, 1, 0, 0, 1, 1,
0.9043009, -0.9885136, 3.434849, 0, 0, 0, 1, 1,
0.9123558, 0.07326923, 1.04144, 0, 0, 0, 1, 1,
0.9141484, -0.1771227, 1.172359, 0, 0, 0, 1, 1,
0.9146197, -0.4838174, 1.724859, 0, 0, 0, 1, 1,
0.9161494, -0.8706034, 2.272806, 0, 0, 0, 1, 1,
0.923122, 0.2081671, 1.584774, 0, 0, 0, 1, 1,
0.9266699, 0.4011768, 1.208467, 0, 0, 0, 1, 1,
0.9284742, -1.146254, 2.870255, 1, 1, 1, 1, 1,
0.9368578, -0.4318199, 0.7614759, 1, 1, 1, 1, 1,
0.9383714, -1.166419, 2.562924, 1, 1, 1, 1, 1,
0.9428946, -0.7052206, 3.106143, 1, 1, 1, 1, 1,
0.9463302, -1.566773, 2.554295, 1, 1, 1, 1, 1,
0.9479392, 1.304887, 0.1479521, 1, 1, 1, 1, 1,
0.9495825, -0.07016303, 1.562812, 1, 1, 1, 1, 1,
0.9526128, 1.919102, -0.9363503, 1, 1, 1, 1, 1,
0.9621792, 1.556113, 0.8196067, 1, 1, 1, 1, 1,
0.9641544, 1.679007, -0.7821399, 1, 1, 1, 1, 1,
0.9755057, -0.5989671, 2.669592, 1, 1, 1, 1, 1,
0.9831333, 1.547484, 0.2048675, 1, 1, 1, 1, 1,
0.9836328, 0.7949007, 0.8462521, 1, 1, 1, 1, 1,
0.9847005, -1.078476, 3.274557, 1, 1, 1, 1, 1,
0.9895793, -0.5313158, 2.864151, 1, 1, 1, 1, 1,
0.9908658, -0.458896, 0.6466061, 0, 0, 1, 1, 1,
0.9915607, 1.022472, 1.606441, 1, 0, 0, 1, 1,
0.9929574, 0.5116137, 1.875783, 1, 0, 0, 1, 1,
0.9933621, 1.528501, 0.6985497, 1, 0, 0, 1, 1,
1.000106, -0.3444756, 0.9745288, 1, 0, 0, 1, 1,
1.000429, 1.324828, 1.033588, 1, 0, 0, 1, 1,
1.006156, -0.7982481, 2.959897, 0, 0, 0, 1, 1,
1.01023, -0.304624, 1.198938, 0, 0, 0, 1, 1,
1.01026, -0.7367133, 1.693556, 0, 0, 0, 1, 1,
1.012294, -1.944008, 0.9884935, 0, 0, 0, 1, 1,
1.012956, 2.073417, 0.1655892, 0, 0, 0, 1, 1,
1.015092, -0.9314374, 1.557127, 0, 0, 0, 1, 1,
1.015515, 0.1248964, 2.256317, 0, 0, 0, 1, 1,
1.022943, 0.9050632, 2.56261, 1, 1, 1, 1, 1,
1.0252, -0.9376787, 2.531627, 1, 1, 1, 1, 1,
1.029454, 0.7770313, 2.3005, 1, 1, 1, 1, 1,
1.038199, 0.6971051, 0.4938917, 1, 1, 1, 1, 1,
1.040051, -0.8259935, 3.370695, 1, 1, 1, 1, 1,
1.042002, 0.1819942, 0.863272, 1, 1, 1, 1, 1,
1.044689, 0.307851, 1.443127, 1, 1, 1, 1, 1,
1.0457, 1.196485, 0.2283374, 1, 1, 1, 1, 1,
1.046214, -1.408998, 3.057045, 1, 1, 1, 1, 1,
1.05029, 1.207235, 0.2853533, 1, 1, 1, 1, 1,
1.05208, -0.8531161, 1.407001, 1, 1, 1, 1, 1,
1.052433, 1.156748, 0.8526241, 1, 1, 1, 1, 1,
1.067053, 0.06157837, 3.503939, 1, 1, 1, 1, 1,
1.074404, 0.1357113, 1.171372, 1, 1, 1, 1, 1,
1.082617, -0.8077469, 2.249617, 1, 1, 1, 1, 1,
1.091472, -0.5794685, 1.59913, 0, 0, 1, 1, 1,
1.103716, -0.2090721, 2.09487, 1, 0, 0, 1, 1,
1.107772, -0.781747, 2.112782, 1, 0, 0, 1, 1,
1.115058, -1.215521, 1.386259, 1, 0, 0, 1, 1,
1.121303, -0.09041612, 0.6584057, 1, 0, 0, 1, 1,
1.125221, -0.3262177, 1.080687, 1, 0, 0, 1, 1,
1.127085, 1.134092, -0.00278203, 0, 0, 0, 1, 1,
1.12938, -0.7186234, 2.941248, 0, 0, 0, 1, 1,
1.158773, 1.01081, 1.715326, 0, 0, 0, 1, 1,
1.163658, 1.933591, -1.335387, 0, 0, 0, 1, 1,
1.172773, 1.963338, 2.050513, 0, 0, 0, 1, 1,
1.173364, -0.595723, 2.165303, 0, 0, 0, 1, 1,
1.175897, -1.265926, 2.318347, 0, 0, 0, 1, 1,
1.178269, -0.6609123, 3.644649, 1, 1, 1, 1, 1,
1.18122, -1.373367, 3.657944, 1, 1, 1, 1, 1,
1.183215, -0.557682, 1.016208, 1, 1, 1, 1, 1,
1.188983, 0.5667332, 1.752206, 1, 1, 1, 1, 1,
1.19417, 0.5227708, 1.55103, 1, 1, 1, 1, 1,
1.20217, -0.882419, 2.203425, 1, 1, 1, 1, 1,
1.209441, 0.4647089, 0.9613409, 1, 1, 1, 1, 1,
1.21363, -0.2428766, 2.069701, 1, 1, 1, 1, 1,
1.21765, 0.4775438, 2.459021, 1, 1, 1, 1, 1,
1.221256, 0.1986064, -0.850934, 1, 1, 1, 1, 1,
1.221939, 0.388445, -0.4841561, 1, 1, 1, 1, 1,
1.231794, 0.5301152, 1.03513, 1, 1, 1, 1, 1,
1.241835, -1.554802, 1.541584, 1, 1, 1, 1, 1,
1.251362, 0.2943594, 1.472874, 1, 1, 1, 1, 1,
1.25479, -0.6239664, 3.102985, 1, 1, 1, 1, 1,
1.265326, 1.761359, 1.850978, 0, 0, 1, 1, 1,
1.26624, -0.1424574, 2.653397, 1, 0, 0, 1, 1,
1.278642, -0.7653167, 2.739485, 1, 0, 0, 1, 1,
1.283206, 0.4511519, 2.125618, 1, 0, 0, 1, 1,
1.2849, -1.087806, 2.81471, 1, 0, 0, 1, 1,
1.290033, -1.450468, 1.79157, 1, 0, 0, 1, 1,
1.294335, -2.191375, 3.011115, 0, 0, 0, 1, 1,
1.303769, 1.419128, 0.2434695, 0, 0, 0, 1, 1,
1.304008, 0.6164112, -0.008425457, 0, 0, 0, 1, 1,
1.304848, 0.5256393, 1.097088, 0, 0, 0, 1, 1,
1.309425, 1.042155, 0.6858879, 0, 0, 0, 1, 1,
1.322332, 2.110361, 0.2206945, 0, 0, 0, 1, 1,
1.32729, 1.00442, 0.635565, 0, 0, 0, 1, 1,
1.331845, -0.3657903, 1.755897, 1, 1, 1, 1, 1,
1.340632, 0.5947884, 1.963709, 1, 1, 1, 1, 1,
1.343076, 0.2164678, 0.7238684, 1, 1, 1, 1, 1,
1.343835, -0.4791409, 2.605434, 1, 1, 1, 1, 1,
1.350291, -2.118725, 1.718424, 1, 1, 1, 1, 1,
1.350891, -1.449721, 1.770741, 1, 1, 1, 1, 1,
1.357208, -0.401522, 2.700596, 1, 1, 1, 1, 1,
1.362354, -0.3268874, 2.806913, 1, 1, 1, 1, 1,
1.365617, -1.159208, 1.759808, 1, 1, 1, 1, 1,
1.369706, 0.009001133, 1.044767, 1, 1, 1, 1, 1,
1.371281, -0.6610393, 3.320871, 1, 1, 1, 1, 1,
1.374397, -0.3983343, 3.452983, 1, 1, 1, 1, 1,
1.374654, -0.2706268, 2.0112, 1, 1, 1, 1, 1,
1.378998, -2.069284, -0.0470848, 1, 1, 1, 1, 1,
1.381253, -0.1686847, 1.22444, 1, 1, 1, 1, 1,
1.387015, 0.3308611, -0.3371356, 0, 0, 1, 1, 1,
1.395894, 0.8470818, 0.6356581, 1, 0, 0, 1, 1,
1.407105, -0.2107221, 2.807564, 1, 0, 0, 1, 1,
1.412617, 0.309453, 2.210626, 1, 0, 0, 1, 1,
1.418073, 1.793432, 1.014403, 1, 0, 0, 1, 1,
1.422128, 0.7785343, 1.629147, 1, 0, 0, 1, 1,
1.430259, -1.085095, 2.715878, 0, 0, 0, 1, 1,
1.438671, -0.4294093, 1.891264, 0, 0, 0, 1, 1,
1.442845, -0.1743649, 1.178358, 0, 0, 0, 1, 1,
1.444538, -0.004683892, 0.358386, 0, 0, 0, 1, 1,
1.444869, -0.9529365, 0.3341787, 0, 0, 0, 1, 1,
1.449773, 0.073015, 0.9143551, 0, 0, 0, 1, 1,
1.454614, 0.9346749, 0.3534564, 0, 0, 0, 1, 1,
1.459075, -0.8637173, 3.486645, 1, 1, 1, 1, 1,
1.472743, 0.8928605, 0.08426245, 1, 1, 1, 1, 1,
1.482639, 0.1466053, 1.438233, 1, 1, 1, 1, 1,
1.489904, -0.4134257, 3.140369, 1, 1, 1, 1, 1,
1.491211, 0.865751, 0.4475048, 1, 1, 1, 1, 1,
1.495837, 0.6825827, 0.9306645, 1, 1, 1, 1, 1,
1.507459, 1.460592, 0.8849422, 1, 1, 1, 1, 1,
1.515173, 1.407528, 2.791539, 1, 1, 1, 1, 1,
1.515301, 0.07541075, 3.054825, 1, 1, 1, 1, 1,
1.515433, -0.2991777, 3.006225, 1, 1, 1, 1, 1,
1.525266, 1.035267, 1.824661, 1, 1, 1, 1, 1,
1.546404, 1.735191, 0.2631411, 1, 1, 1, 1, 1,
1.558007, -0.05731434, 0.5670404, 1, 1, 1, 1, 1,
1.562938, -0.06619085, 2.245433, 1, 1, 1, 1, 1,
1.56294, 0.5698883, 0.3228611, 1, 1, 1, 1, 1,
1.571656, 1.371369, 1.381556, 0, 0, 1, 1, 1,
1.573548, -0.8683756, 1.712118, 1, 0, 0, 1, 1,
1.589786, -0.1254148, 0.7792011, 1, 0, 0, 1, 1,
1.599651, 1.04659, -0.1459399, 1, 0, 0, 1, 1,
1.665725, -0.3709877, 2.77561, 1, 0, 0, 1, 1,
1.667531, 0.3287914, 1.776499, 1, 0, 0, 1, 1,
1.669558, -1.42165, 0.9025471, 0, 0, 0, 1, 1,
1.679389, -0.4081016, 2.19029, 0, 0, 0, 1, 1,
1.684181, 0.3051167, 1.135803, 0, 0, 0, 1, 1,
1.692682, -0.8225002, 1.117187, 0, 0, 0, 1, 1,
1.70112, 1.893176, 0.8515795, 0, 0, 0, 1, 1,
1.706925, 0.4781771, 2.207971, 0, 0, 0, 1, 1,
1.710064, 0.04907177, -0.08155151, 0, 0, 0, 1, 1,
1.710306, 2.01481, 1.697058, 1, 1, 1, 1, 1,
1.726251, -0.4698966, 1.73134, 1, 1, 1, 1, 1,
1.727828, 0.1602803, 3.412001, 1, 1, 1, 1, 1,
1.738112, -0.5095032, -0.06508958, 1, 1, 1, 1, 1,
1.75979, -0.3709871, 2.658679, 1, 1, 1, 1, 1,
1.761221, -0.07174348, 3.658383, 1, 1, 1, 1, 1,
1.78758, -1.174816, 2.279552, 1, 1, 1, 1, 1,
1.795849, -0.2123374, 1.686916, 1, 1, 1, 1, 1,
1.809483, -0.844597, 3.594697, 1, 1, 1, 1, 1,
1.810381, 0.8065107, 0.9835791, 1, 1, 1, 1, 1,
1.820234, 0.3839121, 1.765022, 1, 1, 1, 1, 1,
1.821736, -0.206318, 2.309989, 1, 1, 1, 1, 1,
1.825018, -0.4048347, 0.902402, 1, 1, 1, 1, 1,
1.833714, -0.4797758, 2.123703, 1, 1, 1, 1, 1,
1.853872, -1.154487, 2.282976, 1, 1, 1, 1, 1,
1.856628, 0.07621986, 1.035349, 0, 0, 1, 1, 1,
1.887266, -0.05480164, 1.154695, 1, 0, 0, 1, 1,
1.902243, 0.06570129, 1.335405, 1, 0, 0, 1, 1,
1.908317, -0.2665898, 1.80624, 1, 0, 0, 1, 1,
1.949726, -0.7665094, 1.642813, 1, 0, 0, 1, 1,
1.961155, -1.232236, 1.245205, 1, 0, 0, 1, 1,
1.965927, 0.9024612, 1.043872, 0, 0, 0, 1, 1,
1.98388, -0.5111215, 0.8517845, 0, 0, 0, 1, 1,
1.996606, -0.6543136, 4.163996, 0, 0, 0, 1, 1,
1.998111, 0.2443013, 1.008707, 0, 0, 0, 1, 1,
2.026546, 0.9424757, 0.05364628, 0, 0, 0, 1, 1,
2.035115, -1.352385, 1.819459, 0, 0, 0, 1, 1,
2.044485, 0.435911, 1.805666, 0, 0, 0, 1, 1,
2.163291, -0.4877436, 1.300461, 1, 1, 1, 1, 1,
2.180668, -0.2410187, 2.181891, 1, 1, 1, 1, 1,
2.318721, 0.6332656, 1.516495, 1, 1, 1, 1, 1,
2.420221, 0.04366525, 0.6659785, 1, 1, 1, 1, 1,
2.459837, 0.1905152, 0.844013, 1, 1, 1, 1, 1,
2.539708, 0.6913136, 1.234584, 1, 1, 1, 1, 1,
2.854367, 0.3192056, 1.805321, 1, 1, 1, 1, 1
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
var radius = 9.488334;
var distance = 33.32737;
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
mvMatrix.translate( 0.210749, -0.08347178, 0.312794 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.32737);
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
