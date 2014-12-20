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
-3.368666, 0.1806784, -1.908392, 1, 0, 0, 1,
-3.230027, 0.3540606, -1.716473, 1, 0.007843138, 0, 1,
-3.147882, -2.362646, -3.12567, 1, 0.01176471, 0, 1,
-3.009793, -1.301655, -2.85613, 1, 0.01960784, 0, 1,
-2.823025, -0.8016108, -1.598541, 1, 0.02352941, 0, 1,
-2.557052, 0.2064184, -1.602386, 1, 0.03137255, 0, 1,
-2.393448, -1.267017, -2.184327, 1, 0.03529412, 0, 1,
-2.388522, -1.041606, -2.352027, 1, 0.04313726, 0, 1,
-2.382567, 0.8294569, -1.131205, 1, 0.04705882, 0, 1,
-2.348387, 0.7449431, -0.5689685, 1, 0.05490196, 0, 1,
-2.345607, 1.821906, -2.71696, 1, 0.05882353, 0, 1,
-2.298325, -0.440539, -1.203756, 1, 0.06666667, 0, 1,
-2.238091, 0.1849843, -0.1452994, 1, 0.07058824, 0, 1,
-2.146867, -1.021256, 0.0253366, 1, 0.07843138, 0, 1,
-2.138693, -1.325006, -2.597401, 1, 0.08235294, 0, 1,
-2.111385, -1.637973, -2.492539, 1, 0.09019608, 0, 1,
-2.088904, 0.8247879, -1.879079, 1, 0.09411765, 0, 1,
-2.079574, 1.245715, -0.8841404, 1, 0.1019608, 0, 1,
-1.99286, 0.09081059, 0.9753892, 1, 0.1098039, 0, 1,
-1.992308, -0.1153841, -2.140954, 1, 0.1137255, 0, 1,
-1.982662, -0.8554953, -3.008624, 1, 0.1215686, 0, 1,
-1.974517, -0.7085782, -0.4395534, 1, 0.1254902, 0, 1,
-1.908319, 1.085606, -0.5157739, 1, 0.1333333, 0, 1,
-1.87291, -0.6578992, -1.261771, 1, 0.1372549, 0, 1,
-1.870134, -0.8741992, -1.981868, 1, 0.145098, 0, 1,
-1.853519, 0.815474, -2.042519, 1, 0.1490196, 0, 1,
-1.850818, -0.3619696, -3.195944, 1, 0.1568628, 0, 1,
-1.840234, -0.4015556, -2.222204, 1, 0.1607843, 0, 1,
-1.813614, -1.394997, -2.560726, 1, 0.1686275, 0, 1,
-1.812214, -1.21655, -1.326129, 1, 0.172549, 0, 1,
-1.799585, -0.2737231, -2.560783, 1, 0.1803922, 0, 1,
-1.774888, -0.6527401, -2.301367, 1, 0.1843137, 0, 1,
-1.770908, 1.701713, -1.224547, 1, 0.1921569, 0, 1,
-1.746836, 0.7630482, -0.06726737, 1, 0.1960784, 0, 1,
-1.743125, -1.115876, -1.730111, 1, 0.2039216, 0, 1,
-1.72266, -0.5851033, -3.123257, 1, 0.2117647, 0, 1,
-1.717439, 0.3443842, -1.99454, 1, 0.2156863, 0, 1,
-1.712715, -1.872316, -1.748273, 1, 0.2235294, 0, 1,
-1.710315, -0.9058957, -1.290286, 1, 0.227451, 0, 1,
-1.70994, 0.09707658, -0.8718166, 1, 0.2352941, 0, 1,
-1.690257, -2.04753, -1.324188, 1, 0.2392157, 0, 1,
-1.670292, -0.774762, -1.595514, 1, 0.2470588, 0, 1,
-1.670035, 0.4262207, -1.743105, 1, 0.2509804, 0, 1,
-1.668258, 2.182165, -2.848068, 1, 0.2588235, 0, 1,
-1.638755, 0.8329089, 0.6551659, 1, 0.2627451, 0, 1,
-1.597974, 0.4051034, -2.952286, 1, 0.2705882, 0, 1,
-1.585181, -0.3630045, -1.249243, 1, 0.2745098, 0, 1,
-1.567319, -0.5314557, -3.80773, 1, 0.282353, 0, 1,
-1.559146, -0.7929195, -1.56373, 1, 0.2862745, 0, 1,
-1.544545, -0.7264524, -1.888219, 1, 0.2941177, 0, 1,
-1.539063, -1.854242, -3.052332, 1, 0.3019608, 0, 1,
-1.536323, -0.7783672, -2.095711, 1, 0.3058824, 0, 1,
-1.531928, 0.5447186, -0.5322266, 1, 0.3137255, 0, 1,
-1.525943, -0.5009287, -2.116155, 1, 0.3176471, 0, 1,
-1.51628, 0.5926908, 0.4066102, 1, 0.3254902, 0, 1,
-1.513765, -1.698062, -3.892531, 1, 0.3294118, 0, 1,
-1.511397, -0.05831679, -1.455688, 1, 0.3372549, 0, 1,
-1.499503, 0.07225694, -2.157877, 1, 0.3411765, 0, 1,
-1.479699, 1.024563, -2.134166, 1, 0.3490196, 0, 1,
-1.473121, -0.6742296, -3.381195, 1, 0.3529412, 0, 1,
-1.46983, -1.131749, -5.530988, 1, 0.3607843, 0, 1,
-1.468183, 0.5992638, -0.7118096, 1, 0.3647059, 0, 1,
-1.462494, -1.768449, -2.002375, 1, 0.372549, 0, 1,
-1.457646, 0.1767351, -1.903011, 1, 0.3764706, 0, 1,
-1.455665, -1.415193, -0.392255, 1, 0.3843137, 0, 1,
-1.435321, 0.3909126, -0.2854931, 1, 0.3882353, 0, 1,
-1.429609, -0.2916884, -2.317092, 1, 0.3960784, 0, 1,
-1.426302, 0.370812, -2.122668, 1, 0.4039216, 0, 1,
-1.4246, 0.2868506, 0.2202547, 1, 0.4078431, 0, 1,
-1.410729, -0.9671937, -2.274153, 1, 0.4156863, 0, 1,
-1.410681, -1.138055, -1.149498, 1, 0.4196078, 0, 1,
-1.404833, 0.05345128, -1.458847, 1, 0.427451, 0, 1,
-1.397264, 0.7289047, -2.066672, 1, 0.4313726, 0, 1,
-1.393265, -2.374073, -2.019583, 1, 0.4392157, 0, 1,
-1.389706, -0.7249755, -2.443615, 1, 0.4431373, 0, 1,
-1.388908, -0.5382384, -1.55472, 1, 0.4509804, 0, 1,
-1.386177, -0.2239295, -1.745862, 1, 0.454902, 0, 1,
-1.385954, 0.7122295, -1.274298, 1, 0.4627451, 0, 1,
-1.383922, 1.084536, -1.050275, 1, 0.4666667, 0, 1,
-1.378275, -0.9638253, -0.9842901, 1, 0.4745098, 0, 1,
-1.375033, -0.5596998, -1.855016, 1, 0.4784314, 0, 1,
-1.369534, 0.2213248, -0.7599569, 1, 0.4862745, 0, 1,
-1.36696, -2.306045, -1.525442, 1, 0.4901961, 0, 1,
-1.361697, 1.804694, 0.3807933, 1, 0.4980392, 0, 1,
-1.342667, -1.270417, -2.040784, 1, 0.5058824, 0, 1,
-1.336609, -1.289748, -1.689482, 1, 0.509804, 0, 1,
-1.333485, -0.5361105, -2.45858, 1, 0.5176471, 0, 1,
-1.33098, -1.118597, -3.72157, 1, 0.5215687, 0, 1,
-1.328721, 0.2239347, -2.325637, 1, 0.5294118, 0, 1,
-1.320848, -0.142534, -1.941503, 1, 0.5333334, 0, 1,
-1.32, 0.3575704, -1.362309, 1, 0.5411765, 0, 1,
-1.284507, -0.2153548, -0.7211249, 1, 0.5450981, 0, 1,
-1.283775, 1.839056, -1.229525, 1, 0.5529412, 0, 1,
-1.275415, -0.4212013, -1.237433, 1, 0.5568628, 0, 1,
-1.265898, 1.172792, -3.290587, 1, 0.5647059, 0, 1,
-1.260643, -0.4502184, -2.979842, 1, 0.5686275, 0, 1,
-1.255185, -1.893359, -2.571405, 1, 0.5764706, 0, 1,
-1.254675, 1.731043, -0.1447604, 1, 0.5803922, 0, 1,
-1.253995, -0.3674482, -3.181745, 1, 0.5882353, 0, 1,
-1.252564, -0.9785707, -1.777232, 1, 0.5921569, 0, 1,
-1.246866, -0.5045401, -2.272169, 1, 0.6, 0, 1,
-1.246142, 1.766425, -2.607233, 1, 0.6078432, 0, 1,
-1.232555, -2.757482, -3.667845, 1, 0.6117647, 0, 1,
-1.227957, -0.6237248, -2.32016, 1, 0.6196079, 0, 1,
-1.212852, -0.3950875, -3.187129, 1, 0.6235294, 0, 1,
-1.20791, 1.000948, -2.641106, 1, 0.6313726, 0, 1,
-1.203049, 0.9640365, -1.197525, 1, 0.6352941, 0, 1,
-1.195954, 0.3911934, -2.307395, 1, 0.6431373, 0, 1,
-1.173929, -0.01208293, -2.619294, 1, 0.6470588, 0, 1,
-1.173163, -1.204461, -2.527084, 1, 0.654902, 0, 1,
-1.166868, -0.02158779, -2.851709, 1, 0.6588235, 0, 1,
-1.163757, 0.6291515, -3.025502, 1, 0.6666667, 0, 1,
-1.157761, -1.024864, -1.94867, 1, 0.6705883, 0, 1,
-1.154544, -0.8634198, -1.94269, 1, 0.6784314, 0, 1,
-1.150149, 0.3481031, -0.1366279, 1, 0.682353, 0, 1,
-1.148996, -0.952211, -2.50392, 1, 0.6901961, 0, 1,
-1.12559, 0.646743, -0.8652853, 1, 0.6941177, 0, 1,
-1.120064, -1.506371, -1.735186, 1, 0.7019608, 0, 1,
-1.11929, -0.5026113, -1.34863, 1, 0.7098039, 0, 1,
-1.110074, -0.553105, -1.611147, 1, 0.7137255, 0, 1,
-1.106992, 0.6037562, -1.981539, 1, 0.7215686, 0, 1,
-1.105285, -0.5232825, -1.2062, 1, 0.7254902, 0, 1,
-1.100609, 1.316317, -0.7458205, 1, 0.7333333, 0, 1,
-1.095133, -0.7263701, -2.774649, 1, 0.7372549, 0, 1,
-1.093761, -0.2742778, -2.88128, 1, 0.7450981, 0, 1,
-1.093682, 0.1854587, -0.9342212, 1, 0.7490196, 0, 1,
-1.08569, -0.3554028, -4.375818, 1, 0.7568628, 0, 1,
-1.08305, -0.8114784, -1.387021, 1, 0.7607843, 0, 1,
-1.08302, 0.8465215, -1.865163, 1, 0.7686275, 0, 1,
-1.075397, 1.567666, -2.69572, 1, 0.772549, 0, 1,
-1.074457, -1.674942, -3.389053, 1, 0.7803922, 0, 1,
-1.073223, -1.428443, -3.734546, 1, 0.7843137, 0, 1,
-1.070847, -0.3281828, -2.08932, 1, 0.7921569, 0, 1,
-1.064149, -1.889112, -2.868769, 1, 0.7960784, 0, 1,
-1.062187, -0.5171543, -1.017085, 1, 0.8039216, 0, 1,
-1.060062, 0.05164225, -2.289798, 1, 0.8117647, 0, 1,
-1.058709, -0.1786591, -0.5873224, 1, 0.8156863, 0, 1,
-1.049894, 0.9656991, -1.47114, 1, 0.8235294, 0, 1,
-1.049875, 0.9539425, -1.493307, 1, 0.827451, 0, 1,
-1.041727, -0.9206644, -4.466472, 1, 0.8352941, 0, 1,
-1.040039, 0.744741, -1.215084, 1, 0.8392157, 0, 1,
-1.038661, 0.2608169, -0.6737794, 1, 0.8470588, 0, 1,
-1.034302, 1.708234, -0.4794143, 1, 0.8509804, 0, 1,
-1.034275, -0.1283688, -2.244474, 1, 0.8588235, 0, 1,
-1.033938, 0.820383, -2.602106, 1, 0.8627451, 0, 1,
-1.033809, 1.304803, 0.1944226, 1, 0.8705882, 0, 1,
-1.030778, -1.058228, -2.516732, 1, 0.8745098, 0, 1,
-1.030329, 0.8182533, 0.07707909, 1, 0.8823529, 0, 1,
-1.029915, -0.9756659, -4.756742, 1, 0.8862745, 0, 1,
-1.029361, -0.1352779, -2.905003, 1, 0.8941177, 0, 1,
-1.025858, 1.087581, -1.600993, 1, 0.8980392, 0, 1,
-1.023153, 0.4669727, -2.672915, 1, 0.9058824, 0, 1,
-1.021185, 0.1913957, -1.973096, 1, 0.9137255, 0, 1,
-1.010497, 0.6973413, -1.844939, 1, 0.9176471, 0, 1,
-1.00695, 0.5849789, -1.889392, 1, 0.9254902, 0, 1,
-0.999096, 0.7705818, -1.232259, 1, 0.9294118, 0, 1,
-0.9932736, 0.3177224, -1.685353, 1, 0.9372549, 0, 1,
-0.982918, 1.071895, -1.301976, 1, 0.9411765, 0, 1,
-0.976922, -0.6883451, -4.695935, 1, 0.9490196, 0, 1,
-0.9702681, 0.1058645, -1.684653, 1, 0.9529412, 0, 1,
-0.9631842, -1.03903, 0.1998303, 1, 0.9607843, 0, 1,
-0.961499, -0.6511297, -0.9355664, 1, 0.9647059, 0, 1,
-0.9611509, 0.01854426, -0.05234343, 1, 0.972549, 0, 1,
-0.9578451, -0.150883, -1.107811, 1, 0.9764706, 0, 1,
-0.9568327, 0.08427212, -1.053056, 1, 0.9843137, 0, 1,
-0.9543653, -1.058856, -1.056663, 1, 0.9882353, 0, 1,
-0.9531813, 0.1540947, -1.493117, 1, 0.9960784, 0, 1,
-0.9523209, 1.067852, 0.1865609, 0.9960784, 1, 0, 1,
-0.9515948, -0.5081102, -2.582406, 0.9921569, 1, 0, 1,
-0.9443228, -0.2618963, -0.8773974, 0.9843137, 1, 0, 1,
-0.9436599, 0.1854314, -2.922082, 0.9803922, 1, 0, 1,
-0.9384015, 0.3781412, -2.40312, 0.972549, 1, 0, 1,
-0.936838, -1.602015, -3.847391, 0.9686275, 1, 0, 1,
-0.9355265, 2.320749, -1.200498, 0.9607843, 1, 0, 1,
-0.9354756, 0.1115487, -2.863655, 0.9568627, 1, 0, 1,
-0.9296233, 0.8689175, -1.474974, 0.9490196, 1, 0, 1,
-0.9292252, -1.155773, -2.405545, 0.945098, 1, 0, 1,
-0.9283687, 0.9911332, -0.6310305, 0.9372549, 1, 0, 1,
-0.9280429, 0.4531853, 0.1802218, 0.9333333, 1, 0, 1,
-0.9273762, 1.419346, -1.472809, 0.9254902, 1, 0, 1,
-0.9269692, -0.3407449, -0.8780234, 0.9215686, 1, 0, 1,
-0.9249738, 0.04056473, -2.062382, 0.9137255, 1, 0, 1,
-0.9248441, 0.6148762, -1.426269, 0.9098039, 1, 0, 1,
-0.9239733, -1.279044, -4.565781, 0.9019608, 1, 0, 1,
-0.9171975, 1.55848, -0.2411918, 0.8941177, 1, 0, 1,
-0.9166327, -1.826333, -1.598067, 0.8901961, 1, 0, 1,
-0.9162715, 0.6678122, -0.5049996, 0.8823529, 1, 0, 1,
-0.9095938, -1.190235, -1.601918, 0.8784314, 1, 0, 1,
-0.9065624, 0.4035537, -1.649949, 0.8705882, 1, 0, 1,
-0.9033868, 0.4321887, -1.457291, 0.8666667, 1, 0, 1,
-0.9026088, 0.795957, -1.124468, 0.8588235, 1, 0, 1,
-0.9006692, 0.4457935, -0.9257236, 0.854902, 1, 0, 1,
-0.8994335, 0.5285505, 0.1782714, 0.8470588, 1, 0, 1,
-0.8950904, 0.7535474, -0.2204367, 0.8431373, 1, 0, 1,
-0.891712, 0.4227324, 1.480369, 0.8352941, 1, 0, 1,
-0.8862392, -0.8948375, -1.754273, 0.8313726, 1, 0, 1,
-0.8852881, -0.07617153, -1.983521, 0.8235294, 1, 0, 1,
-0.8820013, 0.8349363, -1.750173, 0.8196079, 1, 0, 1,
-0.8689995, -0.300411, -0.9479429, 0.8117647, 1, 0, 1,
-0.8633481, -1.053016, -2.362894, 0.8078431, 1, 0, 1,
-0.8600228, 0.1166376, -2.224892, 0.8, 1, 0, 1,
-0.8598543, 0.1129259, -1.589524, 0.7921569, 1, 0, 1,
-0.8593227, -0.3194102, -4.12111, 0.7882353, 1, 0, 1,
-0.8520888, -1.167268, -3.238181, 0.7803922, 1, 0, 1,
-0.8518848, -0.7963335, -3.11766, 0.7764706, 1, 0, 1,
-0.850775, -0.9918937, -1.974674, 0.7686275, 1, 0, 1,
-0.8386981, 1.271468, -1.079981, 0.7647059, 1, 0, 1,
-0.8386772, 0.8205237, 0.08339723, 0.7568628, 1, 0, 1,
-0.8384326, 0.5928628, -0.3905556, 0.7529412, 1, 0, 1,
-0.8372301, 0.6624128, -0.8575056, 0.7450981, 1, 0, 1,
-0.8340517, -0.1919347, -0.8598073, 0.7411765, 1, 0, 1,
-0.826866, 0.7333966, 1.142223, 0.7333333, 1, 0, 1,
-0.8223472, -2.22366, -2.930856, 0.7294118, 1, 0, 1,
-0.8166842, 0.7016624, -1.832757, 0.7215686, 1, 0, 1,
-0.8148933, 3.175756, 0.007816474, 0.7176471, 1, 0, 1,
-0.8146791, 1.91629, 1.881929, 0.7098039, 1, 0, 1,
-0.8107604, -1.464067, -4.176459, 0.7058824, 1, 0, 1,
-0.8094947, 0.112504, -0.2023239, 0.6980392, 1, 0, 1,
-0.809249, 0.4710775, -1.981632, 0.6901961, 1, 0, 1,
-0.8073454, 1.170418, 2.397406, 0.6862745, 1, 0, 1,
-0.8073301, -0.8150526, -2.404993, 0.6784314, 1, 0, 1,
-0.8020799, -0.69104, -1.346397, 0.6745098, 1, 0, 1,
-0.8003637, 1.015764, -1.261462, 0.6666667, 1, 0, 1,
-0.7987408, -1.512032, -4.184331, 0.6627451, 1, 0, 1,
-0.7976081, -0.2438732, -1.505172, 0.654902, 1, 0, 1,
-0.7973296, -0.4410309, -3.706383, 0.6509804, 1, 0, 1,
-0.7969815, 0.9084979, -0.9259932, 0.6431373, 1, 0, 1,
-0.7965345, 1.061324, -0.2775787, 0.6392157, 1, 0, 1,
-0.7945544, -1.544519, -4.017407, 0.6313726, 1, 0, 1,
-0.7920218, 0.4310881, -1.019958, 0.627451, 1, 0, 1,
-0.7904242, 0.9306418, 0.9105008, 0.6196079, 1, 0, 1,
-0.7846285, 0.7956154, -0.395462, 0.6156863, 1, 0, 1,
-0.7786164, 0.121088, -0.1002275, 0.6078432, 1, 0, 1,
-0.7760565, 0.5609658, -1.015242, 0.6039216, 1, 0, 1,
-0.7719143, -0.623177, -2.17551, 0.5960785, 1, 0, 1,
-0.7675838, -0.2694674, -1.083787, 0.5882353, 1, 0, 1,
-0.7668836, 0.7786496, -0.167413, 0.5843138, 1, 0, 1,
-0.7665048, -0.8214196, -3.311903, 0.5764706, 1, 0, 1,
-0.7646934, -0.6720973, -0.2127524, 0.572549, 1, 0, 1,
-0.7636157, 1.5022, -1.707529, 0.5647059, 1, 0, 1,
-0.7571945, 1.108597, -0.2629348, 0.5607843, 1, 0, 1,
-0.7522269, -1.644774, -3.253423, 0.5529412, 1, 0, 1,
-0.7517231, -0.8137848, -0.2566625, 0.5490196, 1, 0, 1,
-0.7477124, -0.0002439743, -0.8360197, 0.5411765, 1, 0, 1,
-0.7453976, -0.9519031, -3.234588, 0.5372549, 1, 0, 1,
-0.7433504, 2.634871, -0.6091676, 0.5294118, 1, 0, 1,
-0.7423305, 2.231331, 0.380758, 0.5254902, 1, 0, 1,
-0.7417355, -0.1937281, -3.432552, 0.5176471, 1, 0, 1,
-0.7394437, -0.2729233, -2.928607, 0.5137255, 1, 0, 1,
-0.732949, 1.34835, 0.1230001, 0.5058824, 1, 0, 1,
-0.7201552, -1.205295, -2.556834, 0.5019608, 1, 0, 1,
-0.7191409, -1.607545, -3.483094, 0.4941176, 1, 0, 1,
-0.7190032, 0.5783518, -0.8568885, 0.4862745, 1, 0, 1,
-0.7181746, -0.02033057, -1.833385, 0.4823529, 1, 0, 1,
-0.7162894, -1.372197, -3.277517, 0.4745098, 1, 0, 1,
-0.7155265, -0.7362202, -1.67953, 0.4705882, 1, 0, 1,
-0.7150232, -1.039601, -1.735565, 0.4627451, 1, 0, 1,
-0.7014893, 0.8983549, -0.8933725, 0.4588235, 1, 0, 1,
-0.6993415, -1.202268, -2.30808, 0.4509804, 1, 0, 1,
-0.6990801, -1.411284, -3.264994, 0.4470588, 1, 0, 1,
-0.6976258, 1.611638, 1.502484, 0.4392157, 1, 0, 1,
-0.6906794, 0.1263466, 0.06698855, 0.4352941, 1, 0, 1,
-0.6888479, -0.4853488, -2.559689, 0.427451, 1, 0, 1,
-0.6879022, -0.4811378, -0.8718072, 0.4235294, 1, 0, 1,
-0.6799151, 2.258346, -0.3205331, 0.4156863, 1, 0, 1,
-0.6776178, 0.2670948, -1.110961, 0.4117647, 1, 0, 1,
-0.6666716, 0.8319452, -2.177001, 0.4039216, 1, 0, 1,
-0.6661935, -0.6973699, -5.05884, 0.3960784, 1, 0, 1,
-0.6630163, -0.05163904, -2.899217, 0.3921569, 1, 0, 1,
-0.6582673, -0.3619001, -3.014583, 0.3843137, 1, 0, 1,
-0.6580181, 0.5044417, 0.6171644, 0.3803922, 1, 0, 1,
-0.6559811, 1.408958, 0.2957135, 0.372549, 1, 0, 1,
-0.6497466, -0.3836085, -1.314286, 0.3686275, 1, 0, 1,
-0.6484388, -0.9835634, -3.77871, 0.3607843, 1, 0, 1,
-0.647286, -0.7043449, -2.783686, 0.3568628, 1, 0, 1,
-0.6472529, -0.9325799, -2.122221, 0.3490196, 1, 0, 1,
-0.6448283, 0.5286674, -1.848444, 0.345098, 1, 0, 1,
-0.6435748, -1.065494, -2.592737, 0.3372549, 1, 0, 1,
-0.640171, -0.7361916, -3.203836, 0.3333333, 1, 0, 1,
-0.6381321, 0.2700211, -0.705904, 0.3254902, 1, 0, 1,
-0.6372867, -1.694659, -2.720757, 0.3215686, 1, 0, 1,
-0.6372188, -0.2505666, -1.586302, 0.3137255, 1, 0, 1,
-0.6275836, 0.4479233, -0.7370217, 0.3098039, 1, 0, 1,
-0.6253197, 1.215055, -0.7264249, 0.3019608, 1, 0, 1,
-0.6251618, -1.071045, -1.713793, 0.2941177, 1, 0, 1,
-0.6221392, 0.3894231, -2.23189, 0.2901961, 1, 0, 1,
-0.6187036, 0.1190668, -1.896467, 0.282353, 1, 0, 1,
-0.6143536, 1.003617, -1.081254, 0.2784314, 1, 0, 1,
-0.6109855, 0.4829507, -0.08020622, 0.2705882, 1, 0, 1,
-0.6077287, 1.132411, -0.260722, 0.2666667, 1, 0, 1,
-0.6014448, 1.628383, 1.050512, 0.2588235, 1, 0, 1,
-0.6013099, -0.01454983, -0.9094753, 0.254902, 1, 0, 1,
-0.600619, 0.956039, 0.9717588, 0.2470588, 1, 0, 1,
-0.5913592, -1.062709, -1.518173, 0.2431373, 1, 0, 1,
-0.5837498, 0.5492054, -1.245124, 0.2352941, 1, 0, 1,
-0.5774598, 0.311377, -2.376477, 0.2313726, 1, 0, 1,
-0.5742493, 0.8828757, 2.002114, 0.2235294, 1, 0, 1,
-0.5718971, -0.828611, -2.341436, 0.2196078, 1, 0, 1,
-0.5660283, 0.3710221, -0.8327039, 0.2117647, 1, 0, 1,
-0.560757, -0.8904538, -1.847653, 0.2078431, 1, 0, 1,
-0.5600231, 0.02056763, -3.470929, 0.2, 1, 0, 1,
-0.5563486, -0.4534175, -2.94983, 0.1921569, 1, 0, 1,
-0.5537421, -0.2155526, -1.228924, 0.1882353, 1, 0, 1,
-0.5533568, -0.2679563, -3.413812, 0.1803922, 1, 0, 1,
-0.5522349, -1.52754, -3.773308, 0.1764706, 1, 0, 1,
-0.5463328, 0.2772505, -3.323017, 0.1686275, 1, 0, 1,
-0.544761, 0.07390992, -2.270043, 0.1647059, 1, 0, 1,
-0.5374907, 0.003513929, -2.352449, 0.1568628, 1, 0, 1,
-0.5268288, -1.260778, -4.326314, 0.1529412, 1, 0, 1,
-0.5251023, -1.352717, -2.42757, 0.145098, 1, 0, 1,
-0.5226374, -0.292262, -1.598094, 0.1411765, 1, 0, 1,
-0.5204785, -1.950524, -3.730893, 0.1333333, 1, 0, 1,
-0.517431, 0.3166883, 1.296883, 0.1294118, 1, 0, 1,
-0.5146276, -0.2680891, -1.060856, 0.1215686, 1, 0, 1,
-0.5075825, -0.2954555, -0.7650594, 0.1176471, 1, 0, 1,
-0.5014561, -0.2666649, -3.336599, 0.1098039, 1, 0, 1,
-0.4924414, 0.6924138, -0.5063544, 0.1058824, 1, 0, 1,
-0.4901165, -0.563905, -1.491591, 0.09803922, 1, 0, 1,
-0.487877, -1.235427, -1.807115, 0.09019608, 1, 0, 1,
-0.4858655, -1.055899, -2.262591, 0.08627451, 1, 0, 1,
-0.4855961, 2.507603, 1.786232, 0.07843138, 1, 0, 1,
-0.4820073, 0.3890705, -2.59617, 0.07450981, 1, 0, 1,
-0.480889, 0.9148552, -0.2328507, 0.06666667, 1, 0, 1,
-0.4790745, -0.7333894, -3.715817, 0.0627451, 1, 0, 1,
-0.4769752, -0.776435, -1.471265, 0.05490196, 1, 0, 1,
-0.4745258, 1.262371, 0.03797466, 0.05098039, 1, 0, 1,
-0.4704963, 0.2097139, -0.7683526, 0.04313726, 1, 0, 1,
-0.4679177, 0.3755289, -0.09576809, 0.03921569, 1, 0, 1,
-0.4667083, 0.07582105, -1.370966, 0.03137255, 1, 0, 1,
-0.4659998, -0.9166225, -2.532863, 0.02745098, 1, 0, 1,
-0.4650247, 1.319659, -1.573825, 0.01960784, 1, 0, 1,
-0.4586427, -2.382489, -1.304441, 0.01568628, 1, 0, 1,
-0.4580841, 0.6567684, -0.9726562, 0.007843138, 1, 0, 1,
-0.4548918, -1.372332, -2.956644, 0.003921569, 1, 0, 1,
-0.4529314, -0.3974025, -1.040351, 0, 1, 0.003921569, 1,
-0.436389, -1.07039, -2.505439, 0, 1, 0.01176471, 1,
-0.4291458, 1.616654, -0.2740045, 0, 1, 0.01568628, 1,
-0.4280565, -1.579549, -3.815576, 0, 1, 0.02352941, 1,
-0.4264784, 0.3171302, -0.9956967, 0, 1, 0.02745098, 1,
-0.4232376, -1.77182, -1.86859, 0, 1, 0.03529412, 1,
-0.4174381, -1.787764, -4.29721, 0, 1, 0.03921569, 1,
-0.4174028, 0.9554634, -1.565147, 0, 1, 0.04705882, 1,
-0.4173474, -0.6717513, -1.940191, 0, 1, 0.05098039, 1,
-0.4168518, -0.9055153, -4.415518, 0, 1, 0.05882353, 1,
-0.4163274, 0.1410135, -1.10953, 0, 1, 0.0627451, 1,
-0.4117356, -2.120346, -3.627349, 0, 1, 0.07058824, 1,
-0.4113653, -0.0001257552, 0.06872182, 0, 1, 0.07450981, 1,
-0.4088727, -0.05494387, -1.330473, 0, 1, 0.08235294, 1,
-0.4068056, -0.07371689, -1.5672, 0, 1, 0.08627451, 1,
-0.4065264, -0.9233084, -2.859782, 0, 1, 0.09411765, 1,
-0.4021106, 0.3092974, 0.0004462748, 0, 1, 0.1019608, 1,
-0.3946004, 0.4443481, -2.475707, 0, 1, 0.1058824, 1,
-0.3935083, -1.572497, -3.743581, 0, 1, 0.1137255, 1,
-0.3930306, 0.5868099, -0.8645089, 0, 1, 0.1176471, 1,
-0.3895628, 0.3497115, -0.5969453, 0, 1, 0.1254902, 1,
-0.3889629, 0.1765115, -0.6244311, 0, 1, 0.1294118, 1,
-0.38634, -0.06959992, -2.803379, 0, 1, 0.1372549, 1,
-0.3835346, -0.4949569, -0.9507564, 0, 1, 0.1411765, 1,
-0.3772833, 0.2154893, -2.50539, 0, 1, 0.1490196, 1,
-0.3767372, 0.3776572, -0.1145154, 0, 1, 0.1529412, 1,
-0.3766393, -0.800283, -1.288726, 0, 1, 0.1607843, 1,
-0.3766309, -0.3839659, -2.488386, 0, 1, 0.1647059, 1,
-0.3673097, 0.3774311, 1.117655, 0, 1, 0.172549, 1,
-0.3671088, 1.136826, -2.458143, 0, 1, 0.1764706, 1,
-0.3651957, -0.4282775, -2.443972, 0, 1, 0.1843137, 1,
-0.3629495, -0.2610153, -2.447942, 0, 1, 0.1882353, 1,
-0.3617356, -0.4584048, -3.1961, 0, 1, 0.1960784, 1,
-0.3608606, 0.0397764, -1.166851, 0, 1, 0.2039216, 1,
-0.3505017, -0.2374709, -1.835135, 0, 1, 0.2078431, 1,
-0.349385, -0.8535398, -2.64672, 0, 1, 0.2156863, 1,
-0.3488795, -0.1756613, -1.567784, 0, 1, 0.2196078, 1,
-0.3477759, -1.381211, -3.688173, 0, 1, 0.227451, 1,
-0.3393867, 0.3718521, -0.4186809, 0, 1, 0.2313726, 1,
-0.3391568, 0.6353103, 1.275767, 0, 1, 0.2392157, 1,
-0.3356936, -1.063402, -1.790617, 0, 1, 0.2431373, 1,
-0.3332978, -0.8801108, -2.626947, 0, 1, 0.2509804, 1,
-0.3304033, 0.7091501, -1.338979, 0, 1, 0.254902, 1,
-0.3234366, 0.7498249, -1.18216, 0, 1, 0.2627451, 1,
-0.3214775, 2.614293, -0.07018819, 0, 1, 0.2666667, 1,
-0.3196618, -2.812948, -5.350105, 0, 1, 0.2745098, 1,
-0.3175583, 0.994824, 0.7380863, 0, 1, 0.2784314, 1,
-0.3134441, 0.7705468, -0.5177945, 0, 1, 0.2862745, 1,
-0.3132217, 0.1911242, -0.9023547, 0, 1, 0.2901961, 1,
-0.3093084, 0.8615246, -0.6872389, 0, 1, 0.2980392, 1,
-0.3036106, 0.9964843, -0.7043483, 0, 1, 0.3058824, 1,
-0.2999232, -1.444957, -3.496944, 0, 1, 0.3098039, 1,
-0.2975756, -0.3323568, -1.089512, 0, 1, 0.3176471, 1,
-0.2948284, -0.2164454, -4.164305, 0, 1, 0.3215686, 1,
-0.2920202, -0.2682224, -2.281194, 0, 1, 0.3294118, 1,
-0.2875336, -0.2171926, -2.800827, 0, 1, 0.3333333, 1,
-0.2873088, -0.1797574, -1.035809, 0, 1, 0.3411765, 1,
-0.284934, 1.504903, 0.2726302, 0, 1, 0.345098, 1,
-0.2810272, -0.8259109, -2.87625, 0, 1, 0.3529412, 1,
-0.2800556, 0.8666384, -1.478975, 0, 1, 0.3568628, 1,
-0.2778762, -0.8682907, -2.083481, 0, 1, 0.3647059, 1,
-0.2754598, -0.9205047, -1.784368, 0, 1, 0.3686275, 1,
-0.2742868, -0.02699381, -0.7847983, 0, 1, 0.3764706, 1,
-0.2737219, -0.9498428, -2.532845, 0, 1, 0.3803922, 1,
-0.2692546, -0.6007707, -4.651265, 0, 1, 0.3882353, 1,
-0.2689536, 0.6813722, 1.445419, 0, 1, 0.3921569, 1,
-0.2672445, -0.5857436, -3.477903, 0, 1, 0.4, 1,
-0.2641643, 1.314973, 1.02187, 0, 1, 0.4078431, 1,
-0.2635122, 1.116947, -1.50627, 0, 1, 0.4117647, 1,
-0.2615215, -0.60989, -2.610797, 0, 1, 0.4196078, 1,
-0.2575386, 0.2653022, -0.6898848, 0, 1, 0.4235294, 1,
-0.2477383, 2.160786, 0.7080966, 0, 1, 0.4313726, 1,
-0.2464889, -0.3167312, -2.38832, 0, 1, 0.4352941, 1,
-0.2367849, 1.131654, -0.8135529, 0, 1, 0.4431373, 1,
-0.2365133, -0.2052596, -0.08645874, 0, 1, 0.4470588, 1,
-0.236157, -0.9482219, -2.222326, 0, 1, 0.454902, 1,
-0.2330698, 0.06400008, -0.4405641, 0, 1, 0.4588235, 1,
-0.2310819, 0.02120616, -2.804915, 0, 1, 0.4666667, 1,
-0.2309112, 0.7930969, 0.07177238, 0, 1, 0.4705882, 1,
-0.2303229, 0.723841, -1.038104, 0, 1, 0.4784314, 1,
-0.2282856, 1.61807, -0.5418398, 0, 1, 0.4823529, 1,
-0.2234441, 0.2004079, -0.09450461, 0, 1, 0.4901961, 1,
-0.2211425, -0.6254428, -0.6555762, 0, 1, 0.4941176, 1,
-0.2197164, 0.5646856, -0.8131371, 0, 1, 0.5019608, 1,
-0.2178405, 0.311435, -0.9995778, 0, 1, 0.509804, 1,
-0.2105155, -0.6746587, -2.85179, 0, 1, 0.5137255, 1,
-0.2082224, 2.93708, -0.6110386, 0, 1, 0.5215687, 1,
-0.2054923, 1.284885, -0.3460687, 0, 1, 0.5254902, 1,
-0.2047542, -0.8711626, -2.955763, 0, 1, 0.5333334, 1,
-0.2047402, -0.3332392, -2.946872, 0, 1, 0.5372549, 1,
-0.2029588, -0.3993093, -2.390234, 0, 1, 0.5450981, 1,
-0.2029059, 1.70463, -0.01572007, 0, 1, 0.5490196, 1,
-0.1963232, -2.194922, -2.265388, 0, 1, 0.5568628, 1,
-0.1932386, 1.721387, 0.6304114, 0, 1, 0.5607843, 1,
-0.1889015, -0.1768491, -1.678996, 0, 1, 0.5686275, 1,
-0.1852644, -0.4708, -1.695773, 0, 1, 0.572549, 1,
-0.1847298, 0.08151773, -0.6743335, 0, 1, 0.5803922, 1,
-0.1844679, -0.1298965, 0.05990575, 0, 1, 0.5843138, 1,
-0.1844207, 0.1252517, -2.421888, 0, 1, 0.5921569, 1,
-0.1839878, -0.6036407, -2.202315, 0, 1, 0.5960785, 1,
-0.1821966, -1.178005, -3.769546, 0, 1, 0.6039216, 1,
-0.1821171, 2.575, 0.9583542, 0, 1, 0.6117647, 1,
-0.1781765, 0.6897271, -0.4703774, 0, 1, 0.6156863, 1,
-0.1778405, -0.5888754, -3.184601, 0, 1, 0.6235294, 1,
-0.1774142, -0.08540352, -3.001848, 0, 1, 0.627451, 1,
-0.1711991, 2.662391, 1.582466, 0, 1, 0.6352941, 1,
-0.1697042, 1.874819, -0.4062511, 0, 1, 0.6392157, 1,
-0.1675804, -0.5881617, -0.8367209, 0, 1, 0.6470588, 1,
-0.1671415, -1.246664, -3.20934, 0, 1, 0.6509804, 1,
-0.1662787, -0.9464416, -2.905417, 0, 1, 0.6588235, 1,
-0.1655161, -0.986785, -2.117959, 0, 1, 0.6627451, 1,
-0.1646676, -0.5663581, -4.584129, 0, 1, 0.6705883, 1,
-0.1638744, 0.9146081, -1.402547, 0, 1, 0.6745098, 1,
-0.162213, 0.8462124, 0.4439267, 0, 1, 0.682353, 1,
-0.1603371, 1.020084, -1.049722, 0, 1, 0.6862745, 1,
-0.1578891, -0.05576703, -2.971823, 0, 1, 0.6941177, 1,
-0.1562136, 0.9368888, -0.7265517, 0, 1, 0.7019608, 1,
-0.1539148, -0.8344662, -4.839012, 0, 1, 0.7058824, 1,
-0.1518694, 0.9907237, -0.5967566, 0, 1, 0.7137255, 1,
-0.1455702, -0.4075668, -2.3921, 0, 1, 0.7176471, 1,
-0.1432423, 0.4881563, -0.09324503, 0, 1, 0.7254902, 1,
-0.1422901, -0.6938606, -2.211797, 0, 1, 0.7294118, 1,
-0.1411712, 2.070746, -1.577276, 0, 1, 0.7372549, 1,
-0.137833, -0.06369741, -2.626932, 0, 1, 0.7411765, 1,
-0.1367067, -1.425481, -4.097394, 0, 1, 0.7490196, 1,
-0.136472, 0.3419436, -1.321021, 0, 1, 0.7529412, 1,
-0.1351024, -0.5267591, -2.623419, 0, 1, 0.7607843, 1,
-0.1346975, 0.7413343, -0.9945374, 0, 1, 0.7647059, 1,
-0.1341798, -0.04994468, -3.22439, 0, 1, 0.772549, 1,
-0.132348, -1.161253, -3.727997, 0, 1, 0.7764706, 1,
-0.1317734, 0.8906839, 0.9785295, 0, 1, 0.7843137, 1,
-0.127844, 0.2059631, -0.1108268, 0, 1, 0.7882353, 1,
-0.1227905, -1.689706, -4.382695, 0, 1, 0.7960784, 1,
-0.1181365, 1.862468, 1.312552, 0, 1, 0.8039216, 1,
-0.1120551, 0.183449, -0.4701987, 0, 1, 0.8078431, 1,
-0.1044675, -0.1343958, -3.077295, 0, 1, 0.8156863, 1,
-0.1042669, 0.3228815, 0.9087119, 0, 1, 0.8196079, 1,
-0.1030271, 0.2214854, 0.187358, 0, 1, 0.827451, 1,
-0.1022669, -1.436546, -3.034043, 0, 1, 0.8313726, 1,
-0.09827767, -0.931734, -5.461421, 0, 1, 0.8392157, 1,
-0.09662973, -0.006168816, -1.885998, 0, 1, 0.8431373, 1,
-0.09444078, -0.05782873, -2.613212, 0, 1, 0.8509804, 1,
-0.08939248, 0.7413266, -0.09254976, 0, 1, 0.854902, 1,
-0.0879427, -1.564013, -4.33469, 0, 1, 0.8627451, 1,
-0.08548582, 0.6743273, -0.5147802, 0, 1, 0.8666667, 1,
-0.08486727, 0.1198935, -0.1644158, 0, 1, 0.8745098, 1,
-0.08229957, -1.072991, -2.002577, 0, 1, 0.8784314, 1,
-0.0791087, 0.2829, 2.685564, 0, 1, 0.8862745, 1,
-0.07461402, 1.007925, 0.732213, 0, 1, 0.8901961, 1,
-0.0715814, 0.4062082, 1.942834, 0, 1, 0.8980392, 1,
-0.07153017, 1.036726, 0.5154232, 0, 1, 0.9058824, 1,
-0.07058842, 1.739141, 1.09343, 0, 1, 0.9098039, 1,
-0.06759413, -1.462223, -2.455031, 0, 1, 0.9176471, 1,
-0.06495358, 2.053234, -2.314863, 0, 1, 0.9215686, 1,
-0.06403247, 0.6343265, -1.387464, 0, 1, 0.9294118, 1,
-0.0585008, -1.13456, -4.571723, 0, 1, 0.9333333, 1,
-0.05799311, 0.370976, 0.9141049, 0, 1, 0.9411765, 1,
-0.0563608, -0.8876584, -3.382005, 0, 1, 0.945098, 1,
-0.05155798, -0.3799405, -3.550384, 0, 1, 0.9529412, 1,
-0.0512942, 0.1923459, -0.03658014, 0, 1, 0.9568627, 1,
-0.05071889, 0.9988145, -0.5320928, 0, 1, 0.9647059, 1,
-0.04540672, -0.2640659, -3.197396, 0, 1, 0.9686275, 1,
-0.03940194, -0.8598452, -2.734637, 0, 1, 0.9764706, 1,
-0.03702661, 0.56975, 0.06686075, 0, 1, 0.9803922, 1,
-0.03558776, 0.01746014, -2.10148, 0, 1, 0.9882353, 1,
-0.02964993, -2.828956, -3.811522, 0, 1, 0.9921569, 1,
-0.0252204, 1.673175, 0.9267926, 0, 1, 1, 1,
-0.0239364, 2.608886, -0.4347542, 0, 0.9921569, 1, 1,
-0.02197158, 0.3609837, 0.4663989, 0, 0.9882353, 1, 1,
-0.0207722, 0.8848394, 0.07816736, 0, 0.9803922, 1, 1,
-0.01562264, -0.5640684, -1.310599, 0, 0.9764706, 1, 1,
-0.01264486, -1.323252, -2.689645, 0, 0.9686275, 1, 1,
-0.01111057, 1.866445, 1.737992, 0, 0.9647059, 1, 1,
-0.008475174, -0.135553, -2.672024, 0, 0.9568627, 1, 1,
0.00201132, -1.444561, 2.110804, 0, 0.9529412, 1, 1,
0.003146043, -0.4909231, 2.678437, 0, 0.945098, 1, 1,
0.005349583, 2.538664, -1.195287, 0, 0.9411765, 1, 1,
0.006788826, 0.05142941, 1.903117, 0, 0.9333333, 1, 1,
0.01180954, -1.408253, 3.606342, 0, 0.9294118, 1, 1,
0.02304103, 1.757108, 1.000042, 0, 0.9215686, 1, 1,
0.02307262, -0.1522917, 3.287497, 0, 0.9176471, 1, 1,
0.02364191, 0.01475712, 1.911705, 0, 0.9098039, 1, 1,
0.02396375, -0.6651082, 3.101938, 0, 0.9058824, 1, 1,
0.02444204, 2.512425, -0.7301039, 0, 0.8980392, 1, 1,
0.02631251, 1.221712, 0.01139333, 0, 0.8901961, 1, 1,
0.02688701, -1.296007, 3.3963, 0, 0.8862745, 1, 1,
0.02862963, -0.4443652, 4.121313, 0, 0.8784314, 1, 1,
0.03144999, -0.2947952, 3.648138, 0, 0.8745098, 1, 1,
0.03299456, 0.2130727, -0.4331887, 0, 0.8666667, 1, 1,
0.03439154, 0.5553106, 1.250039, 0, 0.8627451, 1, 1,
0.03777726, 2.829658, -0.1043367, 0, 0.854902, 1, 1,
0.03869417, 1.776677, 0.3920499, 0, 0.8509804, 1, 1,
0.03885171, -2.551494, 4.493579, 0, 0.8431373, 1, 1,
0.04137744, -0.4290289, 2.699974, 0, 0.8392157, 1, 1,
0.04247541, 0.2340415, -0.03322512, 0, 0.8313726, 1, 1,
0.04296109, -0.293876, 1.042067, 0, 0.827451, 1, 1,
0.04424013, 1.292482, 0.4117505, 0, 0.8196079, 1, 1,
0.04443827, 1.66685, 2.531017, 0, 0.8156863, 1, 1,
0.05346812, -0.4870774, 1.93687, 0, 0.8078431, 1, 1,
0.05686587, 0.2993893, 1.211832, 0, 0.8039216, 1, 1,
0.05748061, -0.4140885, 2.657525, 0, 0.7960784, 1, 1,
0.05866884, -1.800342, 2.657516, 0, 0.7882353, 1, 1,
0.06219297, -0.530352, 2.882935, 0, 0.7843137, 1, 1,
0.06399908, -0.7642807, 3.42301, 0, 0.7764706, 1, 1,
0.06523116, -2.254452, 2.202333, 0, 0.772549, 1, 1,
0.06779324, 0.4827942, -0.4933058, 0, 0.7647059, 1, 1,
0.07277969, -0.8131967, 2.403536, 0, 0.7607843, 1, 1,
0.07317787, 0.2840587, 1.115038, 0, 0.7529412, 1, 1,
0.08348311, -0.6671788, 1.775099, 0, 0.7490196, 1, 1,
0.08913141, -0.5756162, 2.646788, 0, 0.7411765, 1, 1,
0.08932911, -0.07662647, 2.873183, 0, 0.7372549, 1, 1,
0.09251529, -1.08293, 2.413155, 0, 0.7294118, 1, 1,
0.09345902, 1.84802, 0.2442929, 0, 0.7254902, 1, 1,
0.09423631, 1.180508, 1.062629, 0, 0.7176471, 1, 1,
0.09499378, -0.5407526, 4.609097, 0, 0.7137255, 1, 1,
0.09654184, 0.5786112, -1.091127, 0, 0.7058824, 1, 1,
0.1007508, 0.156058, 1.717138, 0, 0.6980392, 1, 1,
0.1022888, 0.495048, 0.3330017, 0, 0.6941177, 1, 1,
0.1023603, -0.7445758, 0.6938773, 0, 0.6862745, 1, 1,
0.1028394, 0.1991807, -0.05816416, 0, 0.682353, 1, 1,
0.1040424, -0.5667092, 2.602473, 0, 0.6745098, 1, 1,
0.1051441, -1.03658, 1.179694, 0, 0.6705883, 1, 1,
0.1075175, -1.41419, 2.775468, 0, 0.6627451, 1, 1,
0.1134166, 0.9401839, -0.4122066, 0, 0.6588235, 1, 1,
0.1185035, 0.09402367, -0.8708357, 0, 0.6509804, 1, 1,
0.124387, 1.3295, -0.1377235, 0, 0.6470588, 1, 1,
0.1268946, -0.9537024, 1.726991, 0, 0.6392157, 1, 1,
0.1294469, -2.004574, 3.611077, 0, 0.6352941, 1, 1,
0.1295937, 1.025578, 0.005136416, 0, 0.627451, 1, 1,
0.1348309, -0.4200619, 3.399449, 0, 0.6235294, 1, 1,
0.135608, 0.6727095, -0.3874839, 0, 0.6156863, 1, 1,
0.1361487, 0.3612638, 0.4571448, 0, 0.6117647, 1, 1,
0.1366678, 0.714749, -1.047375, 0, 0.6039216, 1, 1,
0.136906, -0.322212, 3.004348, 0, 0.5960785, 1, 1,
0.1372966, 0.7683871, 0.5460066, 0, 0.5921569, 1, 1,
0.1480815, -1.096282, 2.142461, 0, 0.5843138, 1, 1,
0.1511302, -1.9489, 2.479882, 0, 0.5803922, 1, 1,
0.1518956, -2.781075, 3.360133, 0, 0.572549, 1, 1,
0.1525194, 0.1683536, 2.421804, 0, 0.5686275, 1, 1,
0.1531158, -0.8252626, 1.244519, 0, 0.5607843, 1, 1,
0.1548831, 0.02101556, 0.5219393, 0, 0.5568628, 1, 1,
0.1559232, -1.299926, 3.311847, 0, 0.5490196, 1, 1,
0.1579792, 0.1762312, 0.8261766, 0, 0.5450981, 1, 1,
0.1580504, -0.192255, 1.743135, 0, 0.5372549, 1, 1,
0.1583088, -0.1578806, 3.361642, 0, 0.5333334, 1, 1,
0.1597562, 1.125672, -1.011668, 0, 0.5254902, 1, 1,
0.1612169, -0.7178956, 2.096587, 0, 0.5215687, 1, 1,
0.1637066, -0.2595548, 3.260929, 0, 0.5137255, 1, 1,
0.1653283, -1.251695, 3.396857, 0, 0.509804, 1, 1,
0.1686968, -0.5556502, 2.798373, 0, 0.5019608, 1, 1,
0.170019, 0.6529794, 1.936887, 0, 0.4941176, 1, 1,
0.1711839, 1.157432, -1.084407, 0, 0.4901961, 1, 1,
0.1723071, -0.658769, 1.294636, 0, 0.4823529, 1, 1,
0.1741522, -0.4926858, 3.122854, 0, 0.4784314, 1, 1,
0.1754044, -0.2061991, 4.236938, 0, 0.4705882, 1, 1,
0.1815936, 0.3801031, -0.9337371, 0, 0.4666667, 1, 1,
0.1928503, -0.4495938, 2.635425, 0, 0.4588235, 1, 1,
0.1937989, 0.9187854, 0.5468324, 0, 0.454902, 1, 1,
0.1981244, -2.065779, 2.928954, 0, 0.4470588, 1, 1,
0.1982147, -0.5082741, 1.985479, 0, 0.4431373, 1, 1,
0.2035968, -0.8926541, 3.797174, 0, 0.4352941, 1, 1,
0.2062505, 0.8575231, -0.1130482, 0, 0.4313726, 1, 1,
0.2081688, -0.5094995, 3.193485, 0, 0.4235294, 1, 1,
0.217812, 2.393463, 0.9837416, 0, 0.4196078, 1, 1,
0.2211864, -1.365304, 0.8598002, 0, 0.4117647, 1, 1,
0.2230034, 1.100359, 0.4804449, 0, 0.4078431, 1, 1,
0.2270317, -1.064497, 3.111501, 0, 0.4, 1, 1,
0.2300579, 0.4629359, 0.04105011, 0, 0.3921569, 1, 1,
0.240547, 1.359664, 0.5996327, 0, 0.3882353, 1, 1,
0.2405749, 0.716127, 1.058491, 0, 0.3803922, 1, 1,
0.2444149, 0.01097133, 0.8999435, 0, 0.3764706, 1, 1,
0.2452129, -0.04282022, -0.1341566, 0, 0.3686275, 1, 1,
0.2456342, 1.302069, -0.2584682, 0, 0.3647059, 1, 1,
0.2497066, 0.5306226, 0.9786291, 0, 0.3568628, 1, 1,
0.2522322, 0.4356237, 0.5483147, 0, 0.3529412, 1, 1,
0.2532563, -0.2855581, 2.529987, 0, 0.345098, 1, 1,
0.2543375, 0.3665684, 1.288074, 0, 0.3411765, 1, 1,
0.2548783, 1.066941, 1.967081, 0, 0.3333333, 1, 1,
0.2577902, -0.1708919, 0.5577964, 0, 0.3294118, 1, 1,
0.2585664, -0.3097889, 3.442997, 0, 0.3215686, 1, 1,
0.2652945, -1.493615, 3.255733, 0, 0.3176471, 1, 1,
0.2659176, 0.3189611, 1.536607, 0, 0.3098039, 1, 1,
0.2666855, -1.49473, 2.700837, 0, 0.3058824, 1, 1,
0.267015, 1.334003, -0.3705622, 0, 0.2980392, 1, 1,
0.2703756, -0.4307006, 1.24015, 0, 0.2901961, 1, 1,
0.2778368, 0.6913111, 0.8967254, 0, 0.2862745, 1, 1,
0.279837, -0.1052607, 1.994682, 0, 0.2784314, 1, 1,
0.2798634, 0.06442919, 4.262923, 0, 0.2745098, 1, 1,
0.2815467, -0.1623026, 2.64237, 0, 0.2666667, 1, 1,
0.2852309, 0.04190305, 2.435829, 0, 0.2627451, 1, 1,
0.2854033, -0.5802456, 2.335306, 0, 0.254902, 1, 1,
0.289557, 0.7456115, 0.5590972, 0, 0.2509804, 1, 1,
0.2910958, 0.2046611, 1.119322, 0, 0.2431373, 1, 1,
0.2918707, -0.03910103, 1.202839, 0, 0.2392157, 1, 1,
0.2918721, 0.04373755, 0.5130031, 0, 0.2313726, 1, 1,
0.2943225, 0.007504377, 3.198752, 0, 0.227451, 1, 1,
0.2995337, 0.2135154, 2.882792, 0, 0.2196078, 1, 1,
0.3026424, -0.4633465, 2.021998, 0, 0.2156863, 1, 1,
0.3064725, -1.008039, 4.391979, 0, 0.2078431, 1, 1,
0.3075809, -2.166842, 3.137452, 0, 0.2039216, 1, 1,
0.3082565, 0.3585606, 0.1667058, 0, 0.1960784, 1, 1,
0.3119843, -0.7007729, 2.611406, 0, 0.1882353, 1, 1,
0.3142813, -0.3838326, 2.383296, 0, 0.1843137, 1, 1,
0.3221162, 1.287715, -1.720345, 0, 0.1764706, 1, 1,
0.3257221, 0.324424, -0.5243316, 0, 0.172549, 1, 1,
0.3314014, 0.9289302, -0.6991013, 0, 0.1647059, 1, 1,
0.336206, 1.978032, 0.6020797, 0, 0.1607843, 1, 1,
0.3407141, 1.569968, -0.1115241, 0, 0.1529412, 1, 1,
0.3417094, 0.4365079, -1.161773, 0, 0.1490196, 1, 1,
0.34254, -0.3276123, 0.7752046, 0, 0.1411765, 1, 1,
0.3479732, 1.120016, 1.620106, 0, 0.1372549, 1, 1,
0.3496187, -0.1967565, 1.524803, 0, 0.1294118, 1, 1,
0.3497713, 0.07768799, -0.2736968, 0, 0.1254902, 1, 1,
0.3533891, 1.421442, 0.3483288, 0, 0.1176471, 1, 1,
0.3559431, 1.281048, 0.2053542, 0, 0.1137255, 1, 1,
0.3567061, 1.932899, 1.305243, 0, 0.1058824, 1, 1,
0.3574959, -1.281713, 3.672432, 0, 0.09803922, 1, 1,
0.3578598, 0.0215128, 1.331014, 0, 0.09411765, 1, 1,
0.3583201, -0.6120153, 2.360213, 0, 0.08627451, 1, 1,
0.3587789, 0.146159, 1.991642, 0, 0.08235294, 1, 1,
0.3602519, -2.086073, 3.85798, 0, 0.07450981, 1, 1,
0.3629042, 0.4859456, -0.7979224, 0, 0.07058824, 1, 1,
0.3636899, -0.2482966, 0.7457812, 0, 0.0627451, 1, 1,
0.3689804, -0.5359675, 1.455558, 0, 0.05882353, 1, 1,
0.3690327, -0.293786, 3.355819, 0, 0.05098039, 1, 1,
0.369878, -1.593407, 2.360992, 0, 0.04705882, 1, 1,
0.3717467, 0.03814122, -0.02809198, 0, 0.03921569, 1, 1,
0.3718373, -1.4639, 2.72572, 0, 0.03529412, 1, 1,
0.3719387, -1.072832, 2.097025, 0, 0.02745098, 1, 1,
0.37506, -2.257756, 1.400774, 0, 0.02352941, 1, 1,
0.3759277, 0.2793346, 1.654936, 0, 0.01568628, 1, 1,
0.3762583, -0.2741494, 3.987804, 0, 0.01176471, 1, 1,
0.3807502, -1.49832, 2.186013, 0, 0.003921569, 1, 1,
0.3865043, 0.2110588, 1.31348, 0.003921569, 0, 1, 1,
0.3869965, -0.449013, 0.8606992, 0.007843138, 0, 1, 1,
0.3873945, 0.8318012, -0.6417264, 0.01568628, 0, 1, 1,
0.3912978, 1.71483, 0.6752872, 0.01960784, 0, 1, 1,
0.3915438, 0.4682161, -1.383388, 0.02745098, 0, 1, 1,
0.3932303, 0.569766, 0.1934565, 0.03137255, 0, 1, 1,
0.3933411, -1.064616, 4.257084, 0.03921569, 0, 1, 1,
0.39372, -0.8298243, 2.049276, 0.04313726, 0, 1, 1,
0.3975821, -1.330751, 1.680486, 0.05098039, 0, 1, 1,
0.4054617, 1.754077, -1.233608, 0.05490196, 0, 1, 1,
0.406957, -0.0807116, 1.685744, 0.0627451, 0, 1, 1,
0.4071304, -0.4601335, 1.784955, 0.06666667, 0, 1, 1,
0.4130293, 0.2292542, 1.346393, 0.07450981, 0, 1, 1,
0.4174685, -1.124704, 2.822789, 0.07843138, 0, 1, 1,
0.4223492, 0.6111173, 0.4397897, 0.08627451, 0, 1, 1,
0.4289391, -0.3636838, 2.384512, 0.09019608, 0, 1, 1,
0.4327143, 1.759322, 0.4944842, 0.09803922, 0, 1, 1,
0.4340354, 0.06234272, 2.15751, 0.1058824, 0, 1, 1,
0.4367607, -0.07077462, 0.03223503, 0.1098039, 0, 1, 1,
0.4469033, -1.190319, 2.409036, 0.1176471, 0, 1, 1,
0.4547897, 1.596625, -0.2615503, 0.1215686, 0, 1, 1,
0.4605308, 0.5293663, 0.8911296, 0.1294118, 0, 1, 1,
0.4608155, 1.12631, -0.4105185, 0.1333333, 0, 1, 1,
0.462447, 0.6766128, -0.0004189738, 0.1411765, 0, 1, 1,
0.4644647, -0.7206843, 2.711165, 0.145098, 0, 1, 1,
0.4646997, -1.186073, 1.806489, 0.1529412, 0, 1, 1,
0.4692954, -0.1480253, -0.3254635, 0.1568628, 0, 1, 1,
0.4703754, -0.495389, 2.160354, 0.1647059, 0, 1, 1,
0.4753905, 0.2737596, -0.1643437, 0.1686275, 0, 1, 1,
0.47584, -1.411885, 2.552194, 0.1764706, 0, 1, 1,
0.4762824, 1.614267, 1.026785, 0.1803922, 0, 1, 1,
0.4816891, 1.015526, 0.2762148, 0.1882353, 0, 1, 1,
0.4882117, 0.6173977, -0.6843982, 0.1921569, 0, 1, 1,
0.4958248, -1.289607, 2.9605, 0.2, 0, 1, 1,
0.4964924, -0.780736, 0.799737, 0.2078431, 0, 1, 1,
0.4990517, 0.7821933, -0.1385862, 0.2117647, 0, 1, 1,
0.5013923, 0.6295745, 1.105482, 0.2196078, 0, 1, 1,
0.5043279, 0.3568607, 0.6921496, 0.2235294, 0, 1, 1,
0.5133556, 1.798634, -2.880887, 0.2313726, 0, 1, 1,
0.5134897, -0.7291198, 4.148666, 0.2352941, 0, 1, 1,
0.5169957, -0.3203023, 1.599374, 0.2431373, 0, 1, 1,
0.5174953, -1.363323, 4.242513, 0.2470588, 0, 1, 1,
0.5181966, 1.206239, -0.2926947, 0.254902, 0, 1, 1,
0.5300255, -0.4343896, 2.612483, 0.2588235, 0, 1, 1,
0.5307344, -0.2762406, 0.9208364, 0.2666667, 0, 1, 1,
0.5366433, -0.0460746, 2.402327, 0.2705882, 0, 1, 1,
0.5374986, -1.047534, 1.898408, 0.2784314, 0, 1, 1,
0.5388297, -0.03736101, 1.49127, 0.282353, 0, 1, 1,
0.5393625, 0.8086954, 0.8364107, 0.2901961, 0, 1, 1,
0.5434592, -0.2605368, 1.808215, 0.2941177, 0, 1, 1,
0.5445311, 1.201223, 1.770787, 0.3019608, 0, 1, 1,
0.5493737, 0.6984894, 2.299961, 0.3098039, 0, 1, 1,
0.5498567, 0.5100514, -0.7512693, 0.3137255, 0, 1, 1,
0.5505791, -1.054677, 1.845789, 0.3215686, 0, 1, 1,
0.5521339, 0.07920796, 2.157768, 0.3254902, 0, 1, 1,
0.5581897, -1.642513, 3.227441, 0.3333333, 0, 1, 1,
0.5583886, -1.103766, 1.447377, 0.3372549, 0, 1, 1,
0.5630796, 2.022538, -1.320323, 0.345098, 0, 1, 1,
0.5636111, 0.7200767, -0.1001875, 0.3490196, 0, 1, 1,
0.5644252, -0.02911861, 0.8687366, 0.3568628, 0, 1, 1,
0.5668044, -1.712196, 2.465193, 0.3607843, 0, 1, 1,
0.5758604, 0.2470412, 1.359955, 0.3686275, 0, 1, 1,
0.5765544, 1.36349, 0.6979229, 0.372549, 0, 1, 1,
0.579405, -1.054688, 2.485481, 0.3803922, 0, 1, 1,
0.5808234, 1.28187, 2.014574, 0.3843137, 0, 1, 1,
0.5811498, -1.567824, 4.225444, 0.3921569, 0, 1, 1,
0.5811592, 0.4823299, 2.367867, 0.3960784, 0, 1, 1,
0.5821559, -0.2160046, 3.809664, 0.4039216, 0, 1, 1,
0.5835145, -1.510945, 3.333683, 0.4117647, 0, 1, 1,
0.587018, 0.2360983, 0.5773068, 0.4156863, 0, 1, 1,
0.5877286, -0.7289719, 1.558998, 0.4235294, 0, 1, 1,
0.5943356, -0.5713, 4.140401, 0.427451, 0, 1, 1,
0.5951059, -1.0423, 2.904101, 0.4352941, 0, 1, 1,
0.6054146, 1.926746, -0.03070093, 0.4392157, 0, 1, 1,
0.6064938, -0.07927892, 1.848438, 0.4470588, 0, 1, 1,
0.6088619, -1.004663, 1.126021, 0.4509804, 0, 1, 1,
0.618434, -2.445706, 1.655506, 0.4588235, 0, 1, 1,
0.6201023, 0.2763633, 1.877459, 0.4627451, 0, 1, 1,
0.6204814, 0.570902, 1.771779, 0.4705882, 0, 1, 1,
0.6214617, 0.2974012, 0.5747094, 0.4745098, 0, 1, 1,
0.6229384, 0.3384317, 0.1814608, 0.4823529, 0, 1, 1,
0.623864, 0.5471933, 0.1308072, 0.4862745, 0, 1, 1,
0.6252182, -1.582113, 2.643606, 0.4941176, 0, 1, 1,
0.6305497, 0.4212835, 1.534542, 0.5019608, 0, 1, 1,
0.6374642, 0.1708359, 2.078013, 0.5058824, 0, 1, 1,
0.6399657, -1.525073, 2.918766, 0.5137255, 0, 1, 1,
0.6434095, 0.0170721, -0.1418063, 0.5176471, 0, 1, 1,
0.6491802, -0.2551444, 2.116092, 0.5254902, 0, 1, 1,
0.6507263, 0.7574561, 1.739598, 0.5294118, 0, 1, 1,
0.6510763, 0.3592111, 0.6620979, 0.5372549, 0, 1, 1,
0.6515558, -0.1570969, 2.494978, 0.5411765, 0, 1, 1,
0.6516623, 0.201355, 0.4496351, 0.5490196, 0, 1, 1,
0.6562063, -0.724335, 2.105306, 0.5529412, 0, 1, 1,
0.6609618, -0.8497755, 3.166354, 0.5607843, 0, 1, 1,
0.6612652, 1.350645, 0.3636324, 0.5647059, 0, 1, 1,
0.6640798, -0.200658, 0.5687235, 0.572549, 0, 1, 1,
0.664594, -0.2266122, 1.692472, 0.5764706, 0, 1, 1,
0.6714297, -1.124668, 2.978052, 0.5843138, 0, 1, 1,
0.6745397, -0.7974811, 1.769181, 0.5882353, 0, 1, 1,
0.674766, 0.7730469, -1.278901, 0.5960785, 0, 1, 1,
0.6760011, -0.4707417, 0.6475478, 0.6039216, 0, 1, 1,
0.6784663, -1.64871, 3.088919, 0.6078432, 0, 1, 1,
0.6794506, 1.279571, 0.6756369, 0.6156863, 0, 1, 1,
0.6819707, -0.6443514, 2.713171, 0.6196079, 0, 1, 1,
0.6821661, 0.399772, 0.8254856, 0.627451, 0, 1, 1,
0.6930128, -2.642759, 2.904543, 0.6313726, 0, 1, 1,
0.6943488, -0.5132613, 2.529567, 0.6392157, 0, 1, 1,
0.6977555, 0.4847111, 0.9831426, 0.6431373, 0, 1, 1,
0.698255, 1.167234, -0.9137231, 0.6509804, 0, 1, 1,
0.7015119, -0.3521114, 0.5730357, 0.654902, 0, 1, 1,
0.7078365, 0.7401302, 1.522097, 0.6627451, 0, 1, 1,
0.7159134, -0.1378176, 2.645605, 0.6666667, 0, 1, 1,
0.7239997, -0.8311813, 2.10455, 0.6745098, 0, 1, 1,
0.728238, -0.7983711, 2.943599, 0.6784314, 0, 1, 1,
0.7334189, 1.327826, 0.3233792, 0.6862745, 0, 1, 1,
0.7337187, 0.7326769, 0.8897874, 0.6901961, 0, 1, 1,
0.7372891, -1.185763, 1.503375, 0.6980392, 0, 1, 1,
0.7394422, -0.1818241, 0.8962034, 0.7058824, 0, 1, 1,
0.7404996, 0.6740708, 0.4389879, 0.7098039, 0, 1, 1,
0.7538232, -0.4003537, 0.4586666, 0.7176471, 0, 1, 1,
0.7540582, 0.544504, 1.570092, 0.7215686, 0, 1, 1,
0.7604797, 2.324032, -0.3763022, 0.7294118, 0, 1, 1,
0.7634773, -0.7588303, 2.9954, 0.7333333, 0, 1, 1,
0.7780631, -0.6973733, 3.399271, 0.7411765, 0, 1, 1,
0.7840337, 0.536791, -0.1322286, 0.7450981, 0, 1, 1,
0.787447, 0.1860865, 2.643091, 0.7529412, 0, 1, 1,
0.7916108, -0.5095242, 0.8907459, 0.7568628, 0, 1, 1,
0.8101327, 0.7792449, 1.975227, 0.7647059, 0, 1, 1,
0.8192789, 1.368759, 0.05859026, 0.7686275, 0, 1, 1,
0.8221868, -1.588178, 4.66261, 0.7764706, 0, 1, 1,
0.8222651, 0.04746506, 2.327589, 0.7803922, 0, 1, 1,
0.8313302, 0.1654209, 3.010092, 0.7882353, 0, 1, 1,
0.8390425, -0.7481995, 4.078128, 0.7921569, 0, 1, 1,
0.8487643, 0.1948406, 1.259396, 0.8, 0, 1, 1,
0.8500314, -1.997939, 4.615417, 0.8078431, 0, 1, 1,
0.8542444, -0.6807126, 2.605695, 0.8117647, 0, 1, 1,
0.8564501, -1.270527, 3.399846, 0.8196079, 0, 1, 1,
0.8570979, 0.9651241, -0.001796584, 0.8235294, 0, 1, 1,
0.8614829, -0.837579, 1.140157, 0.8313726, 0, 1, 1,
0.8634318, 0.6700247, 1.414669, 0.8352941, 0, 1, 1,
0.8706135, 0.9475874, -0.1015469, 0.8431373, 0, 1, 1,
0.8719777, 0.460887, 1.558508, 0.8470588, 0, 1, 1,
0.8729224, 1.218875, 0.9034441, 0.854902, 0, 1, 1,
0.8779209, -0.8433133, 3.597603, 0.8588235, 0, 1, 1,
0.8942131, 2.193498, 0.6926975, 0.8666667, 0, 1, 1,
0.8975064, 1.63443, 1.104817, 0.8705882, 0, 1, 1,
0.9101341, 1.15083, 0.2852023, 0.8784314, 0, 1, 1,
0.9207477, 0.7136884, 2.226386, 0.8823529, 0, 1, 1,
0.9286038, -1.039099, 2.433061, 0.8901961, 0, 1, 1,
0.9378512, -1.013494, 3.004086, 0.8941177, 0, 1, 1,
0.9427141, 0.3422722, 3.05242, 0.9019608, 0, 1, 1,
0.9475145, 0.732312, 0.8100048, 0.9098039, 0, 1, 1,
0.9491654, 0.6032817, 0.09029668, 0.9137255, 0, 1, 1,
0.9494693, -1.543402, 1.525153, 0.9215686, 0, 1, 1,
0.9609299, -0.6877, 2.445506, 0.9254902, 0, 1, 1,
0.9632282, -0.2643886, 2.408517, 0.9333333, 0, 1, 1,
0.9651421, -0.1489179, 2.018942, 0.9372549, 0, 1, 1,
0.9655833, -0.1864276, 2.6553, 0.945098, 0, 1, 1,
0.974893, 0.5509477, 1.271925, 0.9490196, 0, 1, 1,
0.9788634, 1.839529, 1.257382, 0.9568627, 0, 1, 1,
0.9849225, 0.5003496, 1.381418, 0.9607843, 0, 1, 1,
0.9859951, 0.7410138, 1.987834, 0.9686275, 0, 1, 1,
0.9906785, -0.5317603, 3.041929, 0.972549, 0, 1, 1,
0.9949645, 1.68435, -0.2743167, 0.9803922, 0, 1, 1,
0.997481, 1.638102, 1.472803, 0.9843137, 0, 1, 1,
0.9990674, 0.7137026, 1.274244, 0.9921569, 0, 1, 1,
1.002481, -0.293348, 2.634395, 0.9960784, 0, 1, 1,
1.003962, 0.4557615, 0.4020723, 1, 0, 0.9960784, 1,
1.00466, -0.4667205, 2.744365, 1, 0, 0.9882353, 1,
1.006151, -0.6412621, 2.398421, 1, 0, 0.9843137, 1,
1.006801, -1.571575, 2.457675, 1, 0, 0.9764706, 1,
1.011535, 1.420299, -0.06384723, 1, 0, 0.972549, 1,
1.016636, 0.5757064, 2.975801, 1, 0, 0.9647059, 1,
1.021948, 1.89286, 0.5089843, 1, 0, 0.9607843, 1,
1.024073, 2.059988, -0.1211845, 1, 0, 0.9529412, 1,
1.029306, 0.3570645, 0.9168372, 1, 0, 0.9490196, 1,
1.036596, 1.344856, 0.8441589, 1, 0, 0.9411765, 1,
1.044383, 0.8811427, -0.2605656, 1, 0, 0.9372549, 1,
1.045286, 1.613721, 0.3950982, 1, 0, 0.9294118, 1,
1.049238, -1.263173, 3.504733, 1, 0, 0.9254902, 1,
1.055867, -0.3928852, 1.695273, 1, 0, 0.9176471, 1,
1.056042, 0.006905342, 2.220724, 1, 0, 0.9137255, 1,
1.062726, -1.038085, 1.959364, 1, 0, 0.9058824, 1,
1.064753, -0.4716772, 3.825378, 1, 0, 0.9019608, 1,
1.066546, -0.8706396, 3.527718, 1, 0, 0.8941177, 1,
1.074681, -1.632152, 3.731824, 1, 0, 0.8862745, 1,
1.082568, -1.745354, 1.34398, 1, 0, 0.8823529, 1,
1.087337, 1.860143, -0.8363938, 1, 0, 0.8745098, 1,
1.090956, -0.13755, 0.3214172, 1, 0, 0.8705882, 1,
1.094189, -1.122744, 1.567441, 1, 0, 0.8627451, 1,
1.094198, -0.5186058, 2.297643, 1, 0, 0.8588235, 1,
1.095379, -2.393757, 2.78977, 1, 0, 0.8509804, 1,
1.09643, 1.497692, -1.007058, 1, 0, 0.8470588, 1,
1.09962, -0.9361112, 2.562573, 1, 0, 0.8392157, 1,
1.109516, -0.80686, 2.77088, 1, 0, 0.8352941, 1,
1.122319, 0.321614, -0.2808329, 1, 0, 0.827451, 1,
1.128989, -0.4759937, 1.019152, 1, 0, 0.8235294, 1,
1.129587, 1.810193, -0.01533833, 1, 0, 0.8156863, 1,
1.130771, -0.06687431, 2.418966, 1, 0, 0.8117647, 1,
1.135023, -0.1661813, 0.8301008, 1, 0, 0.8039216, 1,
1.139735, -0.2041488, 0.5007672, 1, 0, 0.7960784, 1,
1.144645, -1.781531, 1.195706, 1, 0, 0.7921569, 1,
1.154601, 0.2463844, 0.1523343, 1, 0, 0.7843137, 1,
1.155304, -0.1102134, 2.642489, 1, 0, 0.7803922, 1,
1.15694, -0.15622, 2.728832, 1, 0, 0.772549, 1,
1.157024, -0.9878613, 2.467336, 1, 0, 0.7686275, 1,
1.158523, -0.2505933, 2.222329, 1, 0, 0.7607843, 1,
1.159445, 0.3714647, 0.5198167, 1, 0, 0.7568628, 1,
1.162344, 1.052424, 0.5620428, 1, 0, 0.7490196, 1,
1.175302, 0.09894585, 2.400535, 1, 0, 0.7450981, 1,
1.177828, 1.047297, 0.697867, 1, 0, 0.7372549, 1,
1.184684, -1.083436, 3.472201, 1, 0, 0.7333333, 1,
1.186082, 1.240766, -0.5625209, 1, 0, 0.7254902, 1,
1.187305, -0.5725478, 2.627543, 1, 0, 0.7215686, 1,
1.18826, -0.9346831, 1.19915, 1, 0, 0.7137255, 1,
1.196961, 1.135481, 1.867771, 1, 0, 0.7098039, 1,
1.198265, -1.442491, 1.615433, 1, 0, 0.7019608, 1,
1.217536, -0.6990527, 3.307713, 1, 0, 0.6941177, 1,
1.221187, -0.1212123, 2.476105, 1, 0, 0.6901961, 1,
1.225658, 0.02089711, 1.848491, 1, 0, 0.682353, 1,
1.229226, -0.2255797, 1.584586, 1, 0, 0.6784314, 1,
1.232867, -0.5245884, 2.193464, 1, 0, 0.6705883, 1,
1.248698, -1.764467, 1.958974, 1, 0, 0.6666667, 1,
1.252088, -0.6870663, 2.563281, 1, 0, 0.6588235, 1,
1.262399, -0.2813615, -0.6218959, 1, 0, 0.654902, 1,
1.262902, 0.6988195, -0.1136799, 1, 0, 0.6470588, 1,
1.272228, 0.9410423, 0.6615899, 1, 0, 0.6431373, 1,
1.278961, 2.317672, 1.35256, 1, 0, 0.6352941, 1,
1.282135, -0.6589476, 2.50871, 1, 0, 0.6313726, 1,
1.285309, -0.209054, 4.108195, 1, 0, 0.6235294, 1,
1.286133, -1.890523, 2.248203, 1, 0, 0.6196079, 1,
1.288437, 0.227386, -0.3703865, 1, 0, 0.6117647, 1,
1.290243, -0.3541422, 3.272966, 1, 0, 0.6078432, 1,
1.291464, -1.07459, 3.341372, 1, 0, 0.6, 1,
1.295399, 0.231777, 0.2043055, 1, 0, 0.5921569, 1,
1.295627, -0.3174889, 2.72224, 1, 0, 0.5882353, 1,
1.30525, 0.9033095, 0.1620379, 1, 0, 0.5803922, 1,
1.305751, -0.7579082, 3.223735, 1, 0, 0.5764706, 1,
1.306083, 1.160658, 2.852221, 1, 0, 0.5686275, 1,
1.309049, -1.458087, 3.290186, 1, 0, 0.5647059, 1,
1.311416, 1.87484, 1.783971, 1, 0, 0.5568628, 1,
1.31901, 0.4296064, 0.1924325, 1, 0, 0.5529412, 1,
1.331251, 0.04644824, 0.9333377, 1, 0, 0.5450981, 1,
1.341822, -0.846759, 2.839868, 1, 0, 0.5411765, 1,
1.351673, 0.3594485, -0.1127158, 1, 0, 0.5333334, 1,
1.353604, 1.005241, 1.311543, 1, 0, 0.5294118, 1,
1.385862, -0.3731118, 2.396401, 1, 0, 0.5215687, 1,
1.389665, -0.2969607, 2.809873, 1, 0, 0.5176471, 1,
1.391112, 0.2419576, 3.344425, 1, 0, 0.509804, 1,
1.407872, 0.8221407, 1.016747, 1, 0, 0.5058824, 1,
1.410132, 0.3714398, 2.2983, 1, 0, 0.4980392, 1,
1.41164, -0.3309776, 1.116807, 1, 0, 0.4901961, 1,
1.414976, 0.2511195, 0.09126364, 1, 0, 0.4862745, 1,
1.415629, 0.4592395, 1.46567, 1, 0, 0.4784314, 1,
1.423859, 0.42215, 0.328899, 1, 0, 0.4745098, 1,
1.42635, 0.5061634, 1.303893, 1, 0, 0.4666667, 1,
1.428857, -1.374003, 1.660949, 1, 0, 0.4627451, 1,
1.436753, -1.046092, 0.639926, 1, 0, 0.454902, 1,
1.457022, 0.1279382, 1.094575, 1, 0, 0.4509804, 1,
1.460744, 2.178234, -0.2140831, 1, 0, 0.4431373, 1,
1.464991, -0.1824104, 0.6871603, 1, 0, 0.4392157, 1,
1.475589, 1.24627, 1.921061, 1, 0, 0.4313726, 1,
1.479237, 1.003047, 0.7962843, 1, 0, 0.427451, 1,
1.481904, 0.1329189, 0.9966447, 1, 0, 0.4196078, 1,
1.486146, -0.9591071, 0.4222923, 1, 0, 0.4156863, 1,
1.490394, 0.02379517, 2.195637, 1, 0, 0.4078431, 1,
1.493937, 0.03801386, 1.321182, 1, 0, 0.4039216, 1,
1.51002, 1.217296, 0.9673575, 1, 0, 0.3960784, 1,
1.511688, 0.4106242, 0.710886, 1, 0, 0.3882353, 1,
1.518728, -1.121943, 3.021576, 1, 0, 0.3843137, 1,
1.522534, -0.02357682, 0.4765287, 1, 0, 0.3764706, 1,
1.522924, -0.2528855, 0.007608122, 1, 0, 0.372549, 1,
1.526192, 0.7465175, 0.9685106, 1, 0, 0.3647059, 1,
1.550812, -0.4019063, 3.898372, 1, 0, 0.3607843, 1,
1.555464, 0.2091512, 2.044719, 1, 0, 0.3529412, 1,
1.561265, 0.157715, 2.503614, 1, 0, 0.3490196, 1,
1.563097, -0.6214896, 2.519567, 1, 0, 0.3411765, 1,
1.573069, 0.6981729, 0.1328391, 1, 0, 0.3372549, 1,
1.592156, -0.282335, 1.241619, 1, 0, 0.3294118, 1,
1.593158, -0.3417776, 1.605288, 1, 0, 0.3254902, 1,
1.596557, -0.6853599, 1.894296, 1, 0, 0.3176471, 1,
1.639899, -0.6879317, 3.176502, 1, 0, 0.3137255, 1,
1.661451, 0.2171958, 2.756077, 1, 0, 0.3058824, 1,
1.66685, 0.6355374, 2.744816, 1, 0, 0.2980392, 1,
1.668131, -1.243541, 2.09319, 1, 0, 0.2941177, 1,
1.669566, 0.6971062, 0.2483536, 1, 0, 0.2862745, 1,
1.67349, -0.6782229, 2.68567, 1, 0, 0.282353, 1,
1.676455, -0.4544646, 3.688328, 1, 0, 0.2745098, 1,
1.684277, -0.7084802, 2.82639, 1, 0, 0.2705882, 1,
1.693068, -0.7007168, 2.154737, 1, 0, 0.2627451, 1,
1.707762, -1.402443, 3.059523, 1, 0, 0.2588235, 1,
1.716524, -0.5838167, 3.42435, 1, 0, 0.2509804, 1,
1.7298, 2.318167, 1.703175, 1, 0, 0.2470588, 1,
1.749881, 0.7194357, 2.017584, 1, 0, 0.2392157, 1,
1.758759, 0.3827756, 3.466449, 1, 0, 0.2352941, 1,
1.760843, -1.234073, 2.966668, 1, 0, 0.227451, 1,
1.782398, -0.8367417, 2.355704, 1, 0, 0.2235294, 1,
1.788788, -0.2961412, 1.506455, 1, 0, 0.2156863, 1,
1.802516, -0.3416815, 1.097178, 1, 0, 0.2117647, 1,
1.810373, 0.4148292, 0.2854578, 1, 0, 0.2039216, 1,
1.840863, -1.593349, 2.13766, 1, 0, 0.1960784, 1,
1.852981, 0.7792982, 0.9032395, 1, 0, 0.1921569, 1,
1.911334, -2.077482, 4.725625, 1, 0, 0.1843137, 1,
1.929157, 2.387571, -0.7220637, 1, 0, 0.1803922, 1,
1.935517, -2.526541, 0.6395267, 1, 0, 0.172549, 1,
1.939546, 0.2219597, 2.894736, 1, 0, 0.1686275, 1,
1.948135, 0.5474443, 1.806022, 1, 0, 0.1607843, 1,
2.008481, -1.435261, 0.9429147, 1, 0, 0.1568628, 1,
2.017516, -0.6456485, 2.280921, 1, 0, 0.1490196, 1,
2.033022, -2.536494, 1.526521, 1, 0, 0.145098, 1,
2.04502, 1.264692, 1.849328, 1, 0, 0.1372549, 1,
2.051578, 1.339386, 1.203782, 1, 0, 0.1333333, 1,
2.06915, 2.442182, -1.526713, 1, 0, 0.1254902, 1,
2.085104, 0.4442468, 1.215436, 1, 0, 0.1215686, 1,
2.093225, 0.8322647, 0.7362668, 1, 0, 0.1137255, 1,
2.101602, 0.03139639, 1.48974, 1, 0, 0.1098039, 1,
2.115312, 1.348723, 0.06465499, 1, 0, 0.1019608, 1,
2.16666, -0.3053638, 3.650398, 1, 0, 0.09411765, 1,
2.177637, 0.389814, -0.8157542, 1, 0, 0.09019608, 1,
2.213887, -0.6863362, 0.9581827, 1, 0, 0.08235294, 1,
2.224347, 0.4333994, 1.537561, 1, 0, 0.07843138, 1,
2.238513, -0.2045732, 0.4066737, 1, 0, 0.07058824, 1,
2.271089, 1.363657, -0.7351433, 1, 0, 0.06666667, 1,
2.273664, 1.06039, 1.086975, 1, 0, 0.05882353, 1,
2.386469, -1.365547, 2.200924, 1, 0, 0.05490196, 1,
2.415193, -0.585117, 0.5692635, 1, 0, 0.04705882, 1,
2.51832, -0.2505516, 1.862193, 1, 0, 0.04313726, 1,
2.644303, -0.3030833, 2.165172, 1, 0, 0.03529412, 1,
2.657537, 0.004820651, 3.474802, 1, 0, 0.03137255, 1,
2.817277, -0.9929937, 1.998362, 1, 0, 0.02352941, 1,
3.136854, 0.4886063, -0.1948905, 1, 0, 0.01960784, 1,
3.316959, 0.8522915, 1.539135, 1, 0, 0.01176471, 1,
3.533094, 1.780085, -0.4427448, 1, 0, 0.007843138, 1
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
0.08221424, -3.846754, -7.269484, 0, -0.5, 0.5, 0.5,
0.08221424, -3.846754, -7.269484, 1, -0.5, 0.5, 0.5,
0.08221424, -3.846754, -7.269484, 1, 1.5, 0.5, 0.5,
0.08221424, -3.846754, -7.269484, 0, 1.5, 0.5, 0.5
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
-4.538514, 0.1733999, -7.269484, 0, -0.5, 0.5, 0.5,
-4.538514, 0.1733999, -7.269484, 1, -0.5, 0.5, 0.5,
-4.538514, 0.1733999, -7.269484, 1, 1.5, 0.5, 0.5,
-4.538514, 0.1733999, -7.269484, 0, 1.5, 0.5, 0.5
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
-4.538514, -3.846754, -0.4026816, 0, -0.5, 0.5, 0.5,
-4.538514, -3.846754, -0.4026816, 1, -0.5, 0.5, 0.5,
-4.538514, -3.846754, -0.4026816, 1, 1.5, 0.5, 0.5,
-4.538514, -3.846754, -0.4026816, 0, 1.5, 0.5, 0.5
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
-3, -2.919026, -5.684837,
3, -2.919026, -5.684837,
-3, -2.919026, -5.684837,
-3, -3.073648, -5.948945,
-2, -2.919026, -5.684837,
-2, -3.073648, -5.948945,
-1, -2.919026, -5.684837,
-1, -3.073648, -5.948945,
0, -2.919026, -5.684837,
0, -3.073648, -5.948945,
1, -2.919026, -5.684837,
1, -3.073648, -5.948945,
2, -2.919026, -5.684837,
2, -3.073648, -5.948945,
3, -2.919026, -5.684837,
3, -3.073648, -5.948945
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
-3, -3.38289, -6.477161, 0, -0.5, 0.5, 0.5,
-3, -3.38289, -6.477161, 1, -0.5, 0.5, 0.5,
-3, -3.38289, -6.477161, 1, 1.5, 0.5, 0.5,
-3, -3.38289, -6.477161, 0, 1.5, 0.5, 0.5,
-2, -3.38289, -6.477161, 0, -0.5, 0.5, 0.5,
-2, -3.38289, -6.477161, 1, -0.5, 0.5, 0.5,
-2, -3.38289, -6.477161, 1, 1.5, 0.5, 0.5,
-2, -3.38289, -6.477161, 0, 1.5, 0.5, 0.5,
-1, -3.38289, -6.477161, 0, -0.5, 0.5, 0.5,
-1, -3.38289, -6.477161, 1, -0.5, 0.5, 0.5,
-1, -3.38289, -6.477161, 1, 1.5, 0.5, 0.5,
-1, -3.38289, -6.477161, 0, 1.5, 0.5, 0.5,
0, -3.38289, -6.477161, 0, -0.5, 0.5, 0.5,
0, -3.38289, -6.477161, 1, -0.5, 0.5, 0.5,
0, -3.38289, -6.477161, 1, 1.5, 0.5, 0.5,
0, -3.38289, -6.477161, 0, 1.5, 0.5, 0.5,
1, -3.38289, -6.477161, 0, -0.5, 0.5, 0.5,
1, -3.38289, -6.477161, 1, -0.5, 0.5, 0.5,
1, -3.38289, -6.477161, 1, 1.5, 0.5, 0.5,
1, -3.38289, -6.477161, 0, 1.5, 0.5, 0.5,
2, -3.38289, -6.477161, 0, -0.5, 0.5, 0.5,
2, -3.38289, -6.477161, 1, -0.5, 0.5, 0.5,
2, -3.38289, -6.477161, 1, 1.5, 0.5, 0.5,
2, -3.38289, -6.477161, 0, 1.5, 0.5, 0.5,
3, -3.38289, -6.477161, 0, -0.5, 0.5, 0.5,
3, -3.38289, -6.477161, 1, -0.5, 0.5, 0.5,
3, -3.38289, -6.477161, 1, 1.5, 0.5, 0.5,
3, -3.38289, -6.477161, 0, 1.5, 0.5, 0.5
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
-3.472192, -2, -5.684837,
-3.472192, 3, -5.684837,
-3.472192, -2, -5.684837,
-3.649912, -2, -5.948945,
-3.472192, -1, -5.684837,
-3.649912, -1, -5.948945,
-3.472192, 0, -5.684837,
-3.649912, 0, -5.948945,
-3.472192, 1, -5.684837,
-3.649912, 1, -5.948945,
-3.472192, 2, -5.684837,
-3.649912, 2, -5.948945,
-3.472192, 3, -5.684837,
-3.649912, 3, -5.948945
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
-4.005353, -2, -6.477161, 0, -0.5, 0.5, 0.5,
-4.005353, -2, -6.477161, 1, -0.5, 0.5, 0.5,
-4.005353, -2, -6.477161, 1, 1.5, 0.5, 0.5,
-4.005353, -2, -6.477161, 0, 1.5, 0.5, 0.5,
-4.005353, -1, -6.477161, 0, -0.5, 0.5, 0.5,
-4.005353, -1, -6.477161, 1, -0.5, 0.5, 0.5,
-4.005353, -1, -6.477161, 1, 1.5, 0.5, 0.5,
-4.005353, -1, -6.477161, 0, 1.5, 0.5, 0.5,
-4.005353, 0, -6.477161, 0, -0.5, 0.5, 0.5,
-4.005353, 0, -6.477161, 1, -0.5, 0.5, 0.5,
-4.005353, 0, -6.477161, 1, 1.5, 0.5, 0.5,
-4.005353, 0, -6.477161, 0, 1.5, 0.5, 0.5,
-4.005353, 1, -6.477161, 0, -0.5, 0.5, 0.5,
-4.005353, 1, -6.477161, 1, -0.5, 0.5, 0.5,
-4.005353, 1, -6.477161, 1, 1.5, 0.5, 0.5,
-4.005353, 1, -6.477161, 0, 1.5, 0.5, 0.5,
-4.005353, 2, -6.477161, 0, -0.5, 0.5, 0.5,
-4.005353, 2, -6.477161, 1, -0.5, 0.5, 0.5,
-4.005353, 2, -6.477161, 1, 1.5, 0.5, 0.5,
-4.005353, 2, -6.477161, 0, 1.5, 0.5, 0.5,
-4.005353, 3, -6.477161, 0, -0.5, 0.5, 0.5,
-4.005353, 3, -6.477161, 1, -0.5, 0.5, 0.5,
-4.005353, 3, -6.477161, 1, 1.5, 0.5, 0.5,
-4.005353, 3, -6.477161, 0, 1.5, 0.5, 0.5
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
-3.472192, -2.919026, -4,
-3.472192, -2.919026, 4,
-3.472192, -2.919026, -4,
-3.649912, -3.073648, -4,
-3.472192, -2.919026, -2,
-3.649912, -3.073648, -2,
-3.472192, -2.919026, 0,
-3.649912, -3.073648, 0,
-3.472192, -2.919026, 2,
-3.649912, -3.073648, 2,
-3.472192, -2.919026, 4,
-3.649912, -3.073648, 4
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
-4.005353, -3.38289, -4, 0, -0.5, 0.5, 0.5,
-4.005353, -3.38289, -4, 1, -0.5, 0.5, 0.5,
-4.005353, -3.38289, -4, 1, 1.5, 0.5, 0.5,
-4.005353, -3.38289, -4, 0, 1.5, 0.5, 0.5,
-4.005353, -3.38289, -2, 0, -0.5, 0.5, 0.5,
-4.005353, -3.38289, -2, 1, -0.5, 0.5, 0.5,
-4.005353, -3.38289, -2, 1, 1.5, 0.5, 0.5,
-4.005353, -3.38289, -2, 0, 1.5, 0.5, 0.5,
-4.005353, -3.38289, 0, 0, -0.5, 0.5, 0.5,
-4.005353, -3.38289, 0, 1, -0.5, 0.5, 0.5,
-4.005353, -3.38289, 0, 1, 1.5, 0.5, 0.5,
-4.005353, -3.38289, 0, 0, 1.5, 0.5, 0.5,
-4.005353, -3.38289, 2, 0, -0.5, 0.5, 0.5,
-4.005353, -3.38289, 2, 1, -0.5, 0.5, 0.5,
-4.005353, -3.38289, 2, 1, 1.5, 0.5, 0.5,
-4.005353, -3.38289, 2, 0, 1.5, 0.5, 0.5,
-4.005353, -3.38289, 4, 0, -0.5, 0.5, 0.5,
-4.005353, -3.38289, 4, 1, -0.5, 0.5, 0.5,
-4.005353, -3.38289, 4, 1, 1.5, 0.5, 0.5,
-4.005353, -3.38289, 4, 0, 1.5, 0.5, 0.5
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
-3.472192, -2.919026, -5.684837,
-3.472192, 3.265826, -5.684837,
-3.472192, -2.919026, 4.879474,
-3.472192, 3.265826, 4.879474,
-3.472192, -2.919026, -5.684837,
-3.472192, -2.919026, 4.879474,
-3.472192, 3.265826, -5.684837,
-3.472192, 3.265826, 4.879474,
-3.472192, -2.919026, -5.684837,
3.636621, -2.919026, -5.684837,
-3.472192, -2.919026, 4.879474,
3.636621, -2.919026, 4.879474,
-3.472192, 3.265826, -5.684837,
3.636621, 3.265826, -5.684837,
-3.472192, 3.265826, 4.879474,
3.636621, 3.265826, 4.879474,
3.636621, -2.919026, -5.684837,
3.636621, 3.265826, -5.684837,
3.636621, -2.919026, 4.879474,
3.636621, 3.265826, 4.879474,
3.636621, -2.919026, -5.684837,
3.636621, -2.919026, 4.879474,
3.636621, 3.265826, -5.684837,
3.636621, 3.265826, 4.879474
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
var radius = 7.559028;
var distance = 33.63097;
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
mvMatrix.translate( -0.08221424, -0.1733999, 0.4026816 );
mvMatrix.scale( 1.149696, 1.321449, 0.7736396 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.63097);
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
quinazoline<-read.table("quinazoline.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quinazoline$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinazoline' not found
```

```r
y<-quinazoline$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinazoline' not found
```

```r
z<-quinazoline$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinazoline' not found
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
-3.368666, 0.1806784, -1.908392, 0, 0, 1, 1, 1,
-3.230027, 0.3540606, -1.716473, 1, 0, 0, 1, 1,
-3.147882, -2.362646, -3.12567, 1, 0, 0, 1, 1,
-3.009793, -1.301655, -2.85613, 1, 0, 0, 1, 1,
-2.823025, -0.8016108, -1.598541, 1, 0, 0, 1, 1,
-2.557052, 0.2064184, -1.602386, 1, 0, 0, 1, 1,
-2.393448, -1.267017, -2.184327, 0, 0, 0, 1, 1,
-2.388522, -1.041606, -2.352027, 0, 0, 0, 1, 1,
-2.382567, 0.8294569, -1.131205, 0, 0, 0, 1, 1,
-2.348387, 0.7449431, -0.5689685, 0, 0, 0, 1, 1,
-2.345607, 1.821906, -2.71696, 0, 0, 0, 1, 1,
-2.298325, -0.440539, -1.203756, 0, 0, 0, 1, 1,
-2.238091, 0.1849843, -0.1452994, 0, 0, 0, 1, 1,
-2.146867, -1.021256, 0.0253366, 1, 1, 1, 1, 1,
-2.138693, -1.325006, -2.597401, 1, 1, 1, 1, 1,
-2.111385, -1.637973, -2.492539, 1, 1, 1, 1, 1,
-2.088904, 0.8247879, -1.879079, 1, 1, 1, 1, 1,
-2.079574, 1.245715, -0.8841404, 1, 1, 1, 1, 1,
-1.99286, 0.09081059, 0.9753892, 1, 1, 1, 1, 1,
-1.992308, -0.1153841, -2.140954, 1, 1, 1, 1, 1,
-1.982662, -0.8554953, -3.008624, 1, 1, 1, 1, 1,
-1.974517, -0.7085782, -0.4395534, 1, 1, 1, 1, 1,
-1.908319, 1.085606, -0.5157739, 1, 1, 1, 1, 1,
-1.87291, -0.6578992, -1.261771, 1, 1, 1, 1, 1,
-1.870134, -0.8741992, -1.981868, 1, 1, 1, 1, 1,
-1.853519, 0.815474, -2.042519, 1, 1, 1, 1, 1,
-1.850818, -0.3619696, -3.195944, 1, 1, 1, 1, 1,
-1.840234, -0.4015556, -2.222204, 1, 1, 1, 1, 1,
-1.813614, -1.394997, -2.560726, 0, 0, 1, 1, 1,
-1.812214, -1.21655, -1.326129, 1, 0, 0, 1, 1,
-1.799585, -0.2737231, -2.560783, 1, 0, 0, 1, 1,
-1.774888, -0.6527401, -2.301367, 1, 0, 0, 1, 1,
-1.770908, 1.701713, -1.224547, 1, 0, 0, 1, 1,
-1.746836, 0.7630482, -0.06726737, 1, 0, 0, 1, 1,
-1.743125, -1.115876, -1.730111, 0, 0, 0, 1, 1,
-1.72266, -0.5851033, -3.123257, 0, 0, 0, 1, 1,
-1.717439, 0.3443842, -1.99454, 0, 0, 0, 1, 1,
-1.712715, -1.872316, -1.748273, 0, 0, 0, 1, 1,
-1.710315, -0.9058957, -1.290286, 0, 0, 0, 1, 1,
-1.70994, 0.09707658, -0.8718166, 0, 0, 0, 1, 1,
-1.690257, -2.04753, -1.324188, 0, 0, 0, 1, 1,
-1.670292, -0.774762, -1.595514, 1, 1, 1, 1, 1,
-1.670035, 0.4262207, -1.743105, 1, 1, 1, 1, 1,
-1.668258, 2.182165, -2.848068, 1, 1, 1, 1, 1,
-1.638755, 0.8329089, 0.6551659, 1, 1, 1, 1, 1,
-1.597974, 0.4051034, -2.952286, 1, 1, 1, 1, 1,
-1.585181, -0.3630045, -1.249243, 1, 1, 1, 1, 1,
-1.567319, -0.5314557, -3.80773, 1, 1, 1, 1, 1,
-1.559146, -0.7929195, -1.56373, 1, 1, 1, 1, 1,
-1.544545, -0.7264524, -1.888219, 1, 1, 1, 1, 1,
-1.539063, -1.854242, -3.052332, 1, 1, 1, 1, 1,
-1.536323, -0.7783672, -2.095711, 1, 1, 1, 1, 1,
-1.531928, 0.5447186, -0.5322266, 1, 1, 1, 1, 1,
-1.525943, -0.5009287, -2.116155, 1, 1, 1, 1, 1,
-1.51628, 0.5926908, 0.4066102, 1, 1, 1, 1, 1,
-1.513765, -1.698062, -3.892531, 1, 1, 1, 1, 1,
-1.511397, -0.05831679, -1.455688, 0, 0, 1, 1, 1,
-1.499503, 0.07225694, -2.157877, 1, 0, 0, 1, 1,
-1.479699, 1.024563, -2.134166, 1, 0, 0, 1, 1,
-1.473121, -0.6742296, -3.381195, 1, 0, 0, 1, 1,
-1.46983, -1.131749, -5.530988, 1, 0, 0, 1, 1,
-1.468183, 0.5992638, -0.7118096, 1, 0, 0, 1, 1,
-1.462494, -1.768449, -2.002375, 0, 0, 0, 1, 1,
-1.457646, 0.1767351, -1.903011, 0, 0, 0, 1, 1,
-1.455665, -1.415193, -0.392255, 0, 0, 0, 1, 1,
-1.435321, 0.3909126, -0.2854931, 0, 0, 0, 1, 1,
-1.429609, -0.2916884, -2.317092, 0, 0, 0, 1, 1,
-1.426302, 0.370812, -2.122668, 0, 0, 0, 1, 1,
-1.4246, 0.2868506, 0.2202547, 0, 0, 0, 1, 1,
-1.410729, -0.9671937, -2.274153, 1, 1, 1, 1, 1,
-1.410681, -1.138055, -1.149498, 1, 1, 1, 1, 1,
-1.404833, 0.05345128, -1.458847, 1, 1, 1, 1, 1,
-1.397264, 0.7289047, -2.066672, 1, 1, 1, 1, 1,
-1.393265, -2.374073, -2.019583, 1, 1, 1, 1, 1,
-1.389706, -0.7249755, -2.443615, 1, 1, 1, 1, 1,
-1.388908, -0.5382384, -1.55472, 1, 1, 1, 1, 1,
-1.386177, -0.2239295, -1.745862, 1, 1, 1, 1, 1,
-1.385954, 0.7122295, -1.274298, 1, 1, 1, 1, 1,
-1.383922, 1.084536, -1.050275, 1, 1, 1, 1, 1,
-1.378275, -0.9638253, -0.9842901, 1, 1, 1, 1, 1,
-1.375033, -0.5596998, -1.855016, 1, 1, 1, 1, 1,
-1.369534, 0.2213248, -0.7599569, 1, 1, 1, 1, 1,
-1.36696, -2.306045, -1.525442, 1, 1, 1, 1, 1,
-1.361697, 1.804694, 0.3807933, 1, 1, 1, 1, 1,
-1.342667, -1.270417, -2.040784, 0, 0, 1, 1, 1,
-1.336609, -1.289748, -1.689482, 1, 0, 0, 1, 1,
-1.333485, -0.5361105, -2.45858, 1, 0, 0, 1, 1,
-1.33098, -1.118597, -3.72157, 1, 0, 0, 1, 1,
-1.328721, 0.2239347, -2.325637, 1, 0, 0, 1, 1,
-1.320848, -0.142534, -1.941503, 1, 0, 0, 1, 1,
-1.32, 0.3575704, -1.362309, 0, 0, 0, 1, 1,
-1.284507, -0.2153548, -0.7211249, 0, 0, 0, 1, 1,
-1.283775, 1.839056, -1.229525, 0, 0, 0, 1, 1,
-1.275415, -0.4212013, -1.237433, 0, 0, 0, 1, 1,
-1.265898, 1.172792, -3.290587, 0, 0, 0, 1, 1,
-1.260643, -0.4502184, -2.979842, 0, 0, 0, 1, 1,
-1.255185, -1.893359, -2.571405, 0, 0, 0, 1, 1,
-1.254675, 1.731043, -0.1447604, 1, 1, 1, 1, 1,
-1.253995, -0.3674482, -3.181745, 1, 1, 1, 1, 1,
-1.252564, -0.9785707, -1.777232, 1, 1, 1, 1, 1,
-1.246866, -0.5045401, -2.272169, 1, 1, 1, 1, 1,
-1.246142, 1.766425, -2.607233, 1, 1, 1, 1, 1,
-1.232555, -2.757482, -3.667845, 1, 1, 1, 1, 1,
-1.227957, -0.6237248, -2.32016, 1, 1, 1, 1, 1,
-1.212852, -0.3950875, -3.187129, 1, 1, 1, 1, 1,
-1.20791, 1.000948, -2.641106, 1, 1, 1, 1, 1,
-1.203049, 0.9640365, -1.197525, 1, 1, 1, 1, 1,
-1.195954, 0.3911934, -2.307395, 1, 1, 1, 1, 1,
-1.173929, -0.01208293, -2.619294, 1, 1, 1, 1, 1,
-1.173163, -1.204461, -2.527084, 1, 1, 1, 1, 1,
-1.166868, -0.02158779, -2.851709, 1, 1, 1, 1, 1,
-1.163757, 0.6291515, -3.025502, 1, 1, 1, 1, 1,
-1.157761, -1.024864, -1.94867, 0, 0, 1, 1, 1,
-1.154544, -0.8634198, -1.94269, 1, 0, 0, 1, 1,
-1.150149, 0.3481031, -0.1366279, 1, 0, 0, 1, 1,
-1.148996, -0.952211, -2.50392, 1, 0, 0, 1, 1,
-1.12559, 0.646743, -0.8652853, 1, 0, 0, 1, 1,
-1.120064, -1.506371, -1.735186, 1, 0, 0, 1, 1,
-1.11929, -0.5026113, -1.34863, 0, 0, 0, 1, 1,
-1.110074, -0.553105, -1.611147, 0, 0, 0, 1, 1,
-1.106992, 0.6037562, -1.981539, 0, 0, 0, 1, 1,
-1.105285, -0.5232825, -1.2062, 0, 0, 0, 1, 1,
-1.100609, 1.316317, -0.7458205, 0, 0, 0, 1, 1,
-1.095133, -0.7263701, -2.774649, 0, 0, 0, 1, 1,
-1.093761, -0.2742778, -2.88128, 0, 0, 0, 1, 1,
-1.093682, 0.1854587, -0.9342212, 1, 1, 1, 1, 1,
-1.08569, -0.3554028, -4.375818, 1, 1, 1, 1, 1,
-1.08305, -0.8114784, -1.387021, 1, 1, 1, 1, 1,
-1.08302, 0.8465215, -1.865163, 1, 1, 1, 1, 1,
-1.075397, 1.567666, -2.69572, 1, 1, 1, 1, 1,
-1.074457, -1.674942, -3.389053, 1, 1, 1, 1, 1,
-1.073223, -1.428443, -3.734546, 1, 1, 1, 1, 1,
-1.070847, -0.3281828, -2.08932, 1, 1, 1, 1, 1,
-1.064149, -1.889112, -2.868769, 1, 1, 1, 1, 1,
-1.062187, -0.5171543, -1.017085, 1, 1, 1, 1, 1,
-1.060062, 0.05164225, -2.289798, 1, 1, 1, 1, 1,
-1.058709, -0.1786591, -0.5873224, 1, 1, 1, 1, 1,
-1.049894, 0.9656991, -1.47114, 1, 1, 1, 1, 1,
-1.049875, 0.9539425, -1.493307, 1, 1, 1, 1, 1,
-1.041727, -0.9206644, -4.466472, 1, 1, 1, 1, 1,
-1.040039, 0.744741, -1.215084, 0, 0, 1, 1, 1,
-1.038661, 0.2608169, -0.6737794, 1, 0, 0, 1, 1,
-1.034302, 1.708234, -0.4794143, 1, 0, 0, 1, 1,
-1.034275, -0.1283688, -2.244474, 1, 0, 0, 1, 1,
-1.033938, 0.820383, -2.602106, 1, 0, 0, 1, 1,
-1.033809, 1.304803, 0.1944226, 1, 0, 0, 1, 1,
-1.030778, -1.058228, -2.516732, 0, 0, 0, 1, 1,
-1.030329, 0.8182533, 0.07707909, 0, 0, 0, 1, 1,
-1.029915, -0.9756659, -4.756742, 0, 0, 0, 1, 1,
-1.029361, -0.1352779, -2.905003, 0, 0, 0, 1, 1,
-1.025858, 1.087581, -1.600993, 0, 0, 0, 1, 1,
-1.023153, 0.4669727, -2.672915, 0, 0, 0, 1, 1,
-1.021185, 0.1913957, -1.973096, 0, 0, 0, 1, 1,
-1.010497, 0.6973413, -1.844939, 1, 1, 1, 1, 1,
-1.00695, 0.5849789, -1.889392, 1, 1, 1, 1, 1,
-0.999096, 0.7705818, -1.232259, 1, 1, 1, 1, 1,
-0.9932736, 0.3177224, -1.685353, 1, 1, 1, 1, 1,
-0.982918, 1.071895, -1.301976, 1, 1, 1, 1, 1,
-0.976922, -0.6883451, -4.695935, 1, 1, 1, 1, 1,
-0.9702681, 0.1058645, -1.684653, 1, 1, 1, 1, 1,
-0.9631842, -1.03903, 0.1998303, 1, 1, 1, 1, 1,
-0.961499, -0.6511297, -0.9355664, 1, 1, 1, 1, 1,
-0.9611509, 0.01854426, -0.05234343, 1, 1, 1, 1, 1,
-0.9578451, -0.150883, -1.107811, 1, 1, 1, 1, 1,
-0.9568327, 0.08427212, -1.053056, 1, 1, 1, 1, 1,
-0.9543653, -1.058856, -1.056663, 1, 1, 1, 1, 1,
-0.9531813, 0.1540947, -1.493117, 1, 1, 1, 1, 1,
-0.9523209, 1.067852, 0.1865609, 1, 1, 1, 1, 1,
-0.9515948, -0.5081102, -2.582406, 0, 0, 1, 1, 1,
-0.9443228, -0.2618963, -0.8773974, 1, 0, 0, 1, 1,
-0.9436599, 0.1854314, -2.922082, 1, 0, 0, 1, 1,
-0.9384015, 0.3781412, -2.40312, 1, 0, 0, 1, 1,
-0.936838, -1.602015, -3.847391, 1, 0, 0, 1, 1,
-0.9355265, 2.320749, -1.200498, 1, 0, 0, 1, 1,
-0.9354756, 0.1115487, -2.863655, 0, 0, 0, 1, 1,
-0.9296233, 0.8689175, -1.474974, 0, 0, 0, 1, 1,
-0.9292252, -1.155773, -2.405545, 0, 0, 0, 1, 1,
-0.9283687, 0.9911332, -0.6310305, 0, 0, 0, 1, 1,
-0.9280429, 0.4531853, 0.1802218, 0, 0, 0, 1, 1,
-0.9273762, 1.419346, -1.472809, 0, 0, 0, 1, 1,
-0.9269692, -0.3407449, -0.8780234, 0, 0, 0, 1, 1,
-0.9249738, 0.04056473, -2.062382, 1, 1, 1, 1, 1,
-0.9248441, 0.6148762, -1.426269, 1, 1, 1, 1, 1,
-0.9239733, -1.279044, -4.565781, 1, 1, 1, 1, 1,
-0.9171975, 1.55848, -0.2411918, 1, 1, 1, 1, 1,
-0.9166327, -1.826333, -1.598067, 1, 1, 1, 1, 1,
-0.9162715, 0.6678122, -0.5049996, 1, 1, 1, 1, 1,
-0.9095938, -1.190235, -1.601918, 1, 1, 1, 1, 1,
-0.9065624, 0.4035537, -1.649949, 1, 1, 1, 1, 1,
-0.9033868, 0.4321887, -1.457291, 1, 1, 1, 1, 1,
-0.9026088, 0.795957, -1.124468, 1, 1, 1, 1, 1,
-0.9006692, 0.4457935, -0.9257236, 1, 1, 1, 1, 1,
-0.8994335, 0.5285505, 0.1782714, 1, 1, 1, 1, 1,
-0.8950904, 0.7535474, -0.2204367, 1, 1, 1, 1, 1,
-0.891712, 0.4227324, 1.480369, 1, 1, 1, 1, 1,
-0.8862392, -0.8948375, -1.754273, 1, 1, 1, 1, 1,
-0.8852881, -0.07617153, -1.983521, 0, 0, 1, 1, 1,
-0.8820013, 0.8349363, -1.750173, 1, 0, 0, 1, 1,
-0.8689995, -0.300411, -0.9479429, 1, 0, 0, 1, 1,
-0.8633481, -1.053016, -2.362894, 1, 0, 0, 1, 1,
-0.8600228, 0.1166376, -2.224892, 1, 0, 0, 1, 1,
-0.8598543, 0.1129259, -1.589524, 1, 0, 0, 1, 1,
-0.8593227, -0.3194102, -4.12111, 0, 0, 0, 1, 1,
-0.8520888, -1.167268, -3.238181, 0, 0, 0, 1, 1,
-0.8518848, -0.7963335, -3.11766, 0, 0, 0, 1, 1,
-0.850775, -0.9918937, -1.974674, 0, 0, 0, 1, 1,
-0.8386981, 1.271468, -1.079981, 0, 0, 0, 1, 1,
-0.8386772, 0.8205237, 0.08339723, 0, 0, 0, 1, 1,
-0.8384326, 0.5928628, -0.3905556, 0, 0, 0, 1, 1,
-0.8372301, 0.6624128, -0.8575056, 1, 1, 1, 1, 1,
-0.8340517, -0.1919347, -0.8598073, 1, 1, 1, 1, 1,
-0.826866, 0.7333966, 1.142223, 1, 1, 1, 1, 1,
-0.8223472, -2.22366, -2.930856, 1, 1, 1, 1, 1,
-0.8166842, 0.7016624, -1.832757, 1, 1, 1, 1, 1,
-0.8148933, 3.175756, 0.007816474, 1, 1, 1, 1, 1,
-0.8146791, 1.91629, 1.881929, 1, 1, 1, 1, 1,
-0.8107604, -1.464067, -4.176459, 1, 1, 1, 1, 1,
-0.8094947, 0.112504, -0.2023239, 1, 1, 1, 1, 1,
-0.809249, 0.4710775, -1.981632, 1, 1, 1, 1, 1,
-0.8073454, 1.170418, 2.397406, 1, 1, 1, 1, 1,
-0.8073301, -0.8150526, -2.404993, 1, 1, 1, 1, 1,
-0.8020799, -0.69104, -1.346397, 1, 1, 1, 1, 1,
-0.8003637, 1.015764, -1.261462, 1, 1, 1, 1, 1,
-0.7987408, -1.512032, -4.184331, 1, 1, 1, 1, 1,
-0.7976081, -0.2438732, -1.505172, 0, 0, 1, 1, 1,
-0.7973296, -0.4410309, -3.706383, 1, 0, 0, 1, 1,
-0.7969815, 0.9084979, -0.9259932, 1, 0, 0, 1, 1,
-0.7965345, 1.061324, -0.2775787, 1, 0, 0, 1, 1,
-0.7945544, -1.544519, -4.017407, 1, 0, 0, 1, 1,
-0.7920218, 0.4310881, -1.019958, 1, 0, 0, 1, 1,
-0.7904242, 0.9306418, 0.9105008, 0, 0, 0, 1, 1,
-0.7846285, 0.7956154, -0.395462, 0, 0, 0, 1, 1,
-0.7786164, 0.121088, -0.1002275, 0, 0, 0, 1, 1,
-0.7760565, 0.5609658, -1.015242, 0, 0, 0, 1, 1,
-0.7719143, -0.623177, -2.17551, 0, 0, 0, 1, 1,
-0.7675838, -0.2694674, -1.083787, 0, 0, 0, 1, 1,
-0.7668836, 0.7786496, -0.167413, 0, 0, 0, 1, 1,
-0.7665048, -0.8214196, -3.311903, 1, 1, 1, 1, 1,
-0.7646934, -0.6720973, -0.2127524, 1, 1, 1, 1, 1,
-0.7636157, 1.5022, -1.707529, 1, 1, 1, 1, 1,
-0.7571945, 1.108597, -0.2629348, 1, 1, 1, 1, 1,
-0.7522269, -1.644774, -3.253423, 1, 1, 1, 1, 1,
-0.7517231, -0.8137848, -0.2566625, 1, 1, 1, 1, 1,
-0.7477124, -0.0002439743, -0.8360197, 1, 1, 1, 1, 1,
-0.7453976, -0.9519031, -3.234588, 1, 1, 1, 1, 1,
-0.7433504, 2.634871, -0.6091676, 1, 1, 1, 1, 1,
-0.7423305, 2.231331, 0.380758, 1, 1, 1, 1, 1,
-0.7417355, -0.1937281, -3.432552, 1, 1, 1, 1, 1,
-0.7394437, -0.2729233, -2.928607, 1, 1, 1, 1, 1,
-0.732949, 1.34835, 0.1230001, 1, 1, 1, 1, 1,
-0.7201552, -1.205295, -2.556834, 1, 1, 1, 1, 1,
-0.7191409, -1.607545, -3.483094, 1, 1, 1, 1, 1,
-0.7190032, 0.5783518, -0.8568885, 0, 0, 1, 1, 1,
-0.7181746, -0.02033057, -1.833385, 1, 0, 0, 1, 1,
-0.7162894, -1.372197, -3.277517, 1, 0, 0, 1, 1,
-0.7155265, -0.7362202, -1.67953, 1, 0, 0, 1, 1,
-0.7150232, -1.039601, -1.735565, 1, 0, 0, 1, 1,
-0.7014893, 0.8983549, -0.8933725, 1, 0, 0, 1, 1,
-0.6993415, -1.202268, -2.30808, 0, 0, 0, 1, 1,
-0.6990801, -1.411284, -3.264994, 0, 0, 0, 1, 1,
-0.6976258, 1.611638, 1.502484, 0, 0, 0, 1, 1,
-0.6906794, 0.1263466, 0.06698855, 0, 0, 0, 1, 1,
-0.6888479, -0.4853488, -2.559689, 0, 0, 0, 1, 1,
-0.6879022, -0.4811378, -0.8718072, 0, 0, 0, 1, 1,
-0.6799151, 2.258346, -0.3205331, 0, 0, 0, 1, 1,
-0.6776178, 0.2670948, -1.110961, 1, 1, 1, 1, 1,
-0.6666716, 0.8319452, -2.177001, 1, 1, 1, 1, 1,
-0.6661935, -0.6973699, -5.05884, 1, 1, 1, 1, 1,
-0.6630163, -0.05163904, -2.899217, 1, 1, 1, 1, 1,
-0.6582673, -0.3619001, -3.014583, 1, 1, 1, 1, 1,
-0.6580181, 0.5044417, 0.6171644, 1, 1, 1, 1, 1,
-0.6559811, 1.408958, 0.2957135, 1, 1, 1, 1, 1,
-0.6497466, -0.3836085, -1.314286, 1, 1, 1, 1, 1,
-0.6484388, -0.9835634, -3.77871, 1, 1, 1, 1, 1,
-0.647286, -0.7043449, -2.783686, 1, 1, 1, 1, 1,
-0.6472529, -0.9325799, -2.122221, 1, 1, 1, 1, 1,
-0.6448283, 0.5286674, -1.848444, 1, 1, 1, 1, 1,
-0.6435748, -1.065494, -2.592737, 1, 1, 1, 1, 1,
-0.640171, -0.7361916, -3.203836, 1, 1, 1, 1, 1,
-0.6381321, 0.2700211, -0.705904, 1, 1, 1, 1, 1,
-0.6372867, -1.694659, -2.720757, 0, 0, 1, 1, 1,
-0.6372188, -0.2505666, -1.586302, 1, 0, 0, 1, 1,
-0.6275836, 0.4479233, -0.7370217, 1, 0, 0, 1, 1,
-0.6253197, 1.215055, -0.7264249, 1, 0, 0, 1, 1,
-0.6251618, -1.071045, -1.713793, 1, 0, 0, 1, 1,
-0.6221392, 0.3894231, -2.23189, 1, 0, 0, 1, 1,
-0.6187036, 0.1190668, -1.896467, 0, 0, 0, 1, 1,
-0.6143536, 1.003617, -1.081254, 0, 0, 0, 1, 1,
-0.6109855, 0.4829507, -0.08020622, 0, 0, 0, 1, 1,
-0.6077287, 1.132411, -0.260722, 0, 0, 0, 1, 1,
-0.6014448, 1.628383, 1.050512, 0, 0, 0, 1, 1,
-0.6013099, -0.01454983, -0.9094753, 0, 0, 0, 1, 1,
-0.600619, 0.956039, 0.9717588, 0, 0, 0, 1, 1,
-0.5913592, -1.062709, -1.518173, 1, 1, 1, 1, 1,
-0.5837498, 0.5492054, -1.245124, 1, 1, 1, 1, 1,
-0.5774598, 0.311377, -2.376477, 1, 1, 1, 1, 1,
-0.5742493, 0.8828757, 2.002114, 1, 1, 1, 1, 1,
-0.5718971, -0.828611, -2.341436, 1, 1, 1, 1, 1,
-0.5660283, 0.3710221, -0.8327039, 1, 1, 1, 1, 1,
-0.560757, -0.8904538, -1.847653, 1, 1, 1, 1, 1,
-0.5600231, 0.02056763, -3.470929, 1, 1, 1, 1, 1,
-0.5563486, -0.4534175, -2.94983, 1, 1, 1, 1, 1,
-0.5537421, -0.2155526, -1.228924, 1, 1, 1, 1, 1,
-0.5533568, -0.2679563, -3.413812, 1, 1, 1, 1, 1,
-0.5522349, -1.52754, -3.773308, 1, 1, 1, 1, 1,
-0.5463328, 0.2772505, -3.323017, 1, 1, 1, 1, 1,
-0.544761, 0.07390992, -2.270043, 1, 1, 1, 1, 1,
-0.5374907, 0.003513929, -2.352449, 1, 1, 1, 1, 1,
-0.5268288, -1.260778, -4.326314, 0, 0, 1, 1, 1,
-0.5251023, -1.352717, -2.42757, 1, 0, 0, 1, 1,
-0.5226374, -0.292262, -1.598094, 1, 0, 0, 1, 1,
-0.5204785, -1.950524, -3.730893, 1, 0, 0, 1, 1,
-0.517431, 0.3166883, 1.296883, 1, 0, 0, 1, 1,
-0.5146276, -0.2680891, -1.060856, 1, 0, 0, 1, 1,
-0.5075825, -0.2954555, -0.7650594, 0, 0, 0, 1, 1,
-0.5014561, -0.2666649, -3.336599, 0, 0, 0, 1, 1,
-0.4924414, 0.6924138, -0.5063544, 0, 0, 0, 1, 1,
-0.4901165, -0.563905, -1.491591, 0, 0, 0, 1, 1,
-0.487877, -1.235427, -1.807115, 0, 0, 0, 1, 1,
-0.4858655, -1.055899, -2.262591, 0, 0, 0, 1, 1,
-0.4855961, 2.507603, 1.786232, 0, 0, 0, 1, 1,
-0.4820073, 0.3890705, -2.59617, 1, 1, 1, 1, 1,
-0.480889, 0.9148552, -0.2328507, 1, 1, 1, 1, 1,
-0.4790745, -0.7333894, -3.715817, 1, 1, 1, 1, 1,
-0.4769752, -0.776435, -1.471265, 1, 1, 1, 1, 1,
-0.4745258, 1.262371, 0.03797466, 1, 1, 1, 1, 1,
-0.4704963, 0.2097139, -0.7683526, 1, 1, 1, 1, 1,
-0.4679177, 0.3755289, -0.09576809, 1, 1, 1, 1, 1,
-0.4667083, 0.07582105, -1.370966, 1, 1, 1, 1, 1,
-0.4659998, -0.9166225, -2.532863, 1, 1, 1, 1, 1,
-0.4650247, 1.319659, -1.573825, 1, 1, 1, 1, 1,
-0.4586427, -2.382489, -1.304441, 1, 1, 1, 1, 1,
-0.4580841, 0.6567684, -0.9726562, 1, 1, 1, 1, 1,
-0.4548918, -1.372332, -2.956644, 1, 1, 1, 1, 1,
-0.4529314, -0.3974025, -1.040351, 1, 1, 1, 1, 1,
-0.436389, -1.07039, -2.505439, 1, 1, 1, 1, 1,
-0.4291458, 1.616654, -0.2740045, 0, 0, 1, 1, 1,
-0.4280565, -1.579549, -3.815576, 1, 0, 0, 1, 1,
-0.4264784, 0.3171302, -0.9956967, 1, 0, 0, 1, 1,
-0.4232376, -1.77182, -1.86859, 1, 0, 0, 1, 1,
-0.4174381, -1.787764, -4.29721, 1, 0, 0, 1, 1,
-0.4174028, 0.9554634, -1.565147, 1, 0, 0, 1, 1,
-0.4173474, -0.6717513, -1.940191, 0, 0, 0, 1, 1,
-0.4168518, -0.9055153, -4.415518, 0, 0, 0, 1, 1,
-0.4163274, 0.1410135, -1.10953, 0, 0, 0, 1, 1,
-0.4117356, -2.120346, -3.627349, 0, 0, 0, 1, 1,
-0.4113653, -0.0001257552, 0.06872182, 0, 0, 0, 1, 1,
-0.4088727, -0.05494387, -1.330473, 0, 0, 0, 1, 1,
-0.4068056, -0.07371689, -1.5672, 0, 0, 0, 1, 1,
-0.4065264, -0.9233084, -2.859782, 1, 1, 1, 1, 1,
-0.4021106, 0.3092974, 0.0004462748, 1, 1, 1, 1, 1,
-0.3946004, 0.4443481, -2.475707, 1, 1, 1, 1, 1,
-0.3935083, -1.572497, -3.743581, 1, 1, 1, 1, 1,
-0.3930306, 0.5868099, -0.8645089, 1, 1, 1, 1, 1,
-0.3895628, 0.3497115, -0.5969453, 1, 1, 1, 1, 1,
-0.3889629, 0.1765115, -0.6244311, 1, 1, 1, 1, 1,
-0.38634, -0.06959992, -2.803379, 1, 1, 1, 1, 1,
-0.3835346, -0.4949569, -0.9507564, 1, 1, 1, 1, 1,
-0.3772833, 0.2154893, -2.50539, 1, 1, 1, 1, 1,
-0.3767372, 0.3776572, -0.1145154, 1, 1, 1, 1, 1,
-0.3766393, -0.800283, -1.288726, 1, 1, 1, 1, 1,
-0.3766309, -0.3839659, -2.488386, 1, 1, 1, 1, 1,
-0.3673097, 0.3774311, 1.117655, 1, 1, 1, 1, 1,
-0.3671088, 1.136826, -2.458143, 1, 1, 1, 1, 1,
-0.3651957, -0.4282775, -2.443972, 0, 0, 1, 1, 1,
-0.3629495, -0.2610153, -2.447942, 1, 0, 0, 1, 1,
-0.3617356, -0.4584048, -3.1961, 1, 0, 0, 1, 1,
-0.3608606, 0.0397764, -1.166851, 1, 0, 0, 1, 1,
-0.3505017, -0.2374709, -1.835135, 1, 0, 0, 1, 1,
-0.349385, -0.8535398, -2.64672, 1, 0, 0, 1, 1,
-0.3488795, -0.1756613, -1.567784, 0, 0, 0, 1, 1,
-0.3477759, -1.381211, -3.688173, 0, 0, 0, 1, 1,
-0.3393867, 0.3718521, -0.4186809, 0, 0, 0, 1, 1,
-0.3391568, 0.6353103, 1.275767, 0, 0, 0, 1, 1,
-0.3356936, -1.063402, -1.790617, 0, 0, 0, 1, 1,
-0.3332978, -0.8801108, -2.626947, 0, 0, 0, 1, 1,
-0.3304033, 0.7091501, -1.338979, 0, 0, 0, 1, 1,
-0.3234366, 0.7498249, -1.18216, 1, 1, 1, 1, 1,
-0.3214775, 2.614293, -0.07018819, 1, 1, 1, 1, 1,
-0.3196618, -2.812948, -5.350105, 1, 1, 1, 1, 1,
-0.3175583, 0.994824, 0.7380863, 1, 1, 1, 1, 1,
-0.3134441, 0.7705468, -0.5177945, 1, 1, 1, 1, 1,
-0.3132217, 0.1911242, -0.9023547, 1, 1, 1, 1, 1,
-0.3093084, 0.8615246, -0.6872389, 1, 1, 1, 1, 1,
-0.3036106, 0.9964843, -0.7043483, 1, 1, 1, 1, 1,
-0.2999232, -1.444957, -3.496944, 1, 1, 1, 1, 1,
-0.2975756, -0.3323568, -1.089512, 1, 1, 1, 1, 1,
-0.2948284, -0.2164454, -4.164305, 1, 1, 1, 1, 1,
-0.2920202, -0.2682224, -2.281194, 1, 1, 1, 1, 1,
-0.2875336, -0.2171926, -2.800827, 1, 1, 1, 1, 1,
-0.2873088, -0.1797574, -1.035809, 1, 1, 1, 1, 1,
-0.284934, 1.504903, 0.2726302, 1, 1, 1, 1, 1,
-0.2810272, -0.8259109, -2.87625, 0, 0, 1, 1, 1,
-0.2800556, 0.8666384, -1.478975, 1, 0, 0, 1, 1,
-0.2778762, -0.8682907, -2.083481, 1, 0, 0, 1, 1,
-0.2754598, -0.9205047, -1.784368, 1, 0, 0, 1, 1,
-0.2742868, -0.02699381, -0.7847983, 1, 0, 0, 1, 1,
-0.2737219, -0.9498428, -2.532845, 1, 0, 0, 1, 1,
-0.2692546, -0.6007707, -4.651265, 0, 0, 0, 1, 1,
-0.2689536, 0.6813722, 1.445419, 0, 0, 0, 1, 1,
-0.2672445, -0.5857436, -3.477903, 0, 0, 0, 1, 1,
-0.2641643, 1.314973, 1.02187, 0, 0, 0, 1, 1,
-0.2635122, 1.116947, -1.50627, 0, 0, 0, 1, 1,
-0.2615215, -0.60989, -2.610797, 0, 0, 0, 1, 1,
-0.2575386, 0.2653022, -0.6898848, 0, 0, 0, 1, 1,
-0.2477383, 2.160786, 0.7080966, 1, 1, 1, 1, 1,
-0.2464889, -0.3167312, -2.38832, 1, 1, 1, 1, 1,
-0.2367849, 1.131654, -0.8135529, 1, 1, 1, 1, 1,
-0.2365133, -0.2052596, -0.08645874, 1, 1, 1, 1, 1,
-0.236157, -0.9482219, -2.222326, 1, 1, 1, 1, 1,
-0.2330698, 0.06400008, -0.4405641, 1, 1, 1, 1, 1,
-0.2310819, 0.02120616, -2.804915, 1, 1, 1, 1, 1,
-0.2309112, 0.7930969, 0.07177238, 1, 1, 1, 1, 1,
-0.2303229, 0.723841, -1.038104, 1, 1, 1, 1, 1,
-0.2282856, 1.61807, -0.5418398, 1, 1, 1, 1, 1,
-0.2234441, 0.2004079, -0.09450461, 1, 1, 1, 1, 1,
-0.2211425, -0.6254428, -0.6555762, 1, 1, 1, 1, 1,
-0.2197164, 0.5646856, -0.8131371, 1, 1, 1, 1, 1,
-0.2178405, 0.311435, -0.9995778, 1, 1, 1, 1, 1,
-0.2105155, -0.6746587, -2.85179, 1, 1, 1, 1, 1,
-0.2082224, 2.93708, -0.6110386, 0, 0, 1, 1, 1,
-0.2054923, 1.284885, -0.3460687, 1, 0, 0, 1, 1,
-0.2047542, -0.8711626, -2.955763, 1, 0, 0, 1, 1,
-0.2047402, -0.3332392, -2.946872, 1, 0, 0, 1, 1,
-0.2029588, -0.3993093, -2.390234, 1, 0, 0, 1, 1,
-0.2029059, 1.70463, -0.01572007, 1, 0, 0, 1, 1,
-0.1963232, -2.194922, -2.265388, 0, 0, 0, 1, 1,
-0.1932386, 1.721387, 0.6304114, 0, 0, 0, 1, 1,
-0.1889015, -0.1768491, -1.678996, 0, 0, 0, 1, 1,
-0.1852644, -0.4708, -1.695773, 0, 0, 0, 1, 1,
-0.1847298, 0.08151773, -0.6743335, 0, 0, 0, 1, 1,
-0.1844679, -0.1298965, 0.05990575, 0, 0, 0, 1, 1,
-0.1844207, 0.1252517, -2.421888, 0, 0, 0, 1, 1,
-0.1839878, -0.6036407, -2.202315, 1, 1, 1, 1, 1,
-0.1821966, -1.178005, -3.769546, 1, 1, 1, 1, 1,
-0.1821171, 2.575, 0.9583542, 1, 1, 1, 1, 1,
-0.1781765, 0.6897271, -0.4703774, 1, 1, 1, 1, 1,
-0.1778405, -0.5888754, -3.184601, 1, 1, 1, 1, 1,
-0.1774142, -0.08540352, -3.001848, 1, 1, 1, 1, 1,
-0.1711991, 2.662391, 1.582466, 1, 1, 1, 1, 1,
-0.1697042, 1.874819, -0.4062511, 1, 1, 1, 1, 1,
-0.1675804, -0.5881617, -0.8367209, 1, 1, 1, 1, 1,
-0.1671415, -1.246664, -3.20934, 1, 1, 1, 1, 1,
-0.1662787, -0.9464416, -2.905417, 1, 1, 1, 1, 1,
-0.1655161, -0.986785, -2.117959, 1, 1, 1, 1, 1,
-0.1646676, -0.5663581, -4.584129, 1, 1, 1, 1, 1,
-0.1638744, 0.9146081, -1.402547, 1, 1, 1, 1, 1,
-0.162213, 0.8462124, 0.4439267, 1, 1, 1, 1, 1,
-0.1603371, 1.020084, -1.049722, 0, 0, 1, 1, 1,
-0.1578891, -0.05576703, -2.971823, 1, 0, 0, 1, 1,
-0.1562136, 0.9368888, -0.7265517, 1, 0, 0, 1, 1,
-0.1539148, -0.8344662, -4.839012, 1, 0, 0, 1, 1,
-0.1518694, 0.9907237, -0.5967566, 1, 0, 0, 1, 1,
-0.1455702, -0.4075668, -2.3921, 1, 0, 0, 1, 1,
-0.1432423, 0.4881563, -0.09324503, 0, 0, 0, 1, 1,
-0.1422901, -0.6938606, -2.211797, 0, 0, 0, 1, 1,
-0.1411712, 2.070746, -1.577276, 0, 0, 0, 1, 1,
-0.137833, -0.06369741, -2.626932, 0, 0, 0, 1, 1,
-0.1367067, -1.425481, -4.097394, 0, 0, 0, 1, 1,
-0.136472, 0.3419436, -1.321021, 0, 0, 0, 1, 1,
-0.1351024, -0.5267591, -2.623419, 0, 0, 0, 1, 1,
-0.1346975, 0.7413343, -0.9945374, 1, 1, 1, 1, 1,
-0.1341798, -0.04994468, -3.22439, 1, 1, 1, 1, 1,
-0.132348, -1.161253, -3.727997, 1, 1, 1, 1, 1,
-0.1317734, 0.8906839, 0.9785295, 1, 1, 1, 1, 1,
-0.127844, 0.2059631, -0.1108268, 1, 1, 1, 1, 1,
-0.1227905, -1.689706, -4.382695, 1, 1, 1, 1, 1,
-0.1181365, 1.862468, 1.312552, 1, 1, 1, 1, 1,
-0.1120551, 0.183449, -0.4701987, 1, 1, 1, 1, 1,
-0.1044675, -0.1343958, -3.077295, 1, 1, 1, 1, 1,
-0.1042669, 0.3228815, 0.9087119, 1, 1, 1, 1, 1,
-0.1030271, 0.2214854, 0.187358, 1, 1, 1, 1, 1,
-0.1022669, -1.436546, -3.034043, 1, 1, 1, 1, 1,
-0.09827767, -0.931734, -5.461421, 1, 1, 1, 1, 1,
-0.09662973, -0.006168816, -1.885998, 1, 1, 1, 1, 1,
-0.09444078, -0.05782873, -2.613212, 1, 1, 1, 1, 1,
-0.08939248, 0.7413266, -0.09254976, 0, 0, 1, 1, 1,
-0.0879427, -1.564013, -4.33469, 1, 0, 0, 1, 1,
-0.08548582, 0.6743273, -0.5147802, 1, 0, 0, 1, 1,
-0.08486727, 0.1198935, -0.1644158, 1, 0, 0, 1, 1,
-0.08229957, -1.072991, -2.002577, 1, 0, 0, 1, 1,
-0.0791087, 0.2829, 2.685564, 1, 0, 0, 1, 1,
-0.07461402, 1.007925, 0.732213, 0, 0, 0, 1, 1,
-0.0715814, 0.4062082, 1.942834, 0, 0, 0, 1, 1,
-0.07153017, 1.036726, 0.5154232, 0, 0, 0, 1, 1,
-0.07058842, 1.739141, 1.09343, 0, 0, 0, 1, 1,
-0.06759413, -1.462223, -2.455031, 0, 0, 0, 1, 1,
-0.06495358, 2.053234, -2.314863, 0, 0, 0, 1, 1,
-0.06403247, 0.6343265, -1.387464, 0, 0, 0, 1, 1,
-0.0585008, -1.13456, -4.571723, 1, 1, 1, 1, 1,
-0.05799311, 0.370976, 0.9141049, 1, 1, 1, 1, 1,
-0.0563608, -0.8876584, -3.382005, 1, 1, 1, 1, 1,
-0.05155798, -0.3799405, -3.550384, 1, 1, 1, 1, 1,
-0.0512942, 0.1923459, -0.03658014, 1, 1, 1, 1, 1,
-0.05071889, 0.9988145, -0.5320928, 1, 1, 1, 1, 1,
-0.04540672, -0.2640659, -3.197396, 1, 1, 1, 1, 1,
-0.03940194, -0.8598452, -2.734637, 1, 1, 1, 1, 1,
-0.03702661, 0.56975, 0.06686075, 1, 1, 1, 1, 1,
-0.03558776, 0.01746014, -2.10148, 1, 1, 1, 1, 1,
-0.02964993, -2.828956, -3.811522, 1, 1, 1, 1, 1,
-0.0252204, 1.673175, 0.9267926, 1, 1, 1, 1, 1,
-0.0239364, 2.608886, -0.4347542, 1, 1, 1, 1, 1,
-0.02197158, 0.3609837, 0.4663989, 1, 1, 1, 1, 1,
-0.0207722, 0.8848394, 0.07816736, 1, 1, 1, 1, 1,
-0.01562264, -0.5640684, -1.310599, 0, 0, 1, 1, 1,
-0.01264486, -1.323252, -2.689645, 1, 0, 0, 1, 1,
-0.01111057, 1.866445, 1.737992, 1, 0, 0, 1, 1,
-0.008475174, -0.135553, -2.672024, 1, 0, 0, 1, 1,
0.00201132, -1.444561, 2.110804, 1, 0, 0, 1, 1,
0.003146043, -0.4909231, 2.678437, 1, 0, 0, 1, 1,
0.005349583, 2.538664, -1.195287, 0, 0, 0, 1, 1,
0.006788826, 0.05142941, 1.903117, 0, 0, 0, 1, 1,
0.01180954, -1.408253, 3.606342, 0, 0, 0, 1, 1,
0.02304103, 1.757108, 1.000042, 0, 0, 0, 1, 1,
0.02307262, -0.1522917, 3.287497, 0, 0, 0, 1, 1,
0.02364191, 0.01475712, 1.911705, 0, 0, 0, 1, 1,
0.02396375, -0.6651082, 3.101938, 0, 0, 0, 1, 1,
0.02444204, 2.512425, -0.7301039, 1, 1, 1, 1, 1,
0.02631251, 1.221712, 0.01139333, 1, 1, 1, 1, 1,
0.02688701, -1.296007, 3.3963, 1, 1, 1, 1, 1,
0.02862963, -0.4443652, 4.121313, 1, 1, 1, 1, 1,
0.03144999, -0.2947952, 3.648138, 1, 1, 1, 1, 1,
0.03299456, 0.2130727, -0.4331887, 1, 1, 1, 1, 1,
0.03439154, 0.5553106, 1.250039, 1, 1, 1, 1, 1,
0.03777726, 2.829658, -0.1043367, 1, 1, 1, 1, 1,
0.03869417, 1.776677, 0.3920499, 1, 1, 1, 1, 1,
0.03885171, -2.551494, 4.493579, 1, 1, 1, 1, 1,
0.04137744, -0.4290289, 2.699974, 1, 1, 1, 1, 1,
0.04247541, 0.2340415, -0.03322512, 1, 1, 1, 1, 1,
0.04296109, -0.293876, 1.042067, 1, 1, 1, 1, 1,
0.04424013, 1.292482, 0.4117505, 1, 1, 1, 1, 1,
0.04443827, 1.66685, 2.531017, 1, 1, 1, 1, 1,
0.05346812, -0.4870774, 1.93687, 0, 0, 1, 1, 1,
0.05686587, 0.2993893, 1.211832, 1, 0, 0, 1, 1,
0.05748061, -0.4140885, 2.657525, 1, 0, 0, 1, 1,
0.05866884, -1.800342, 2.657516, 1, 0, 0, 1, 1,
0.06219297, -0.530352, 2.882935, 1, 0, 0, 1, 1,
0.06399908, -0.7642807, 3.42301, 1, 0, 0, 1, 1,
0.06523116, -2.254452, 2.202333, 0, 0, 0, 1, 1,
0.06779324, 0.4827942, -0.4933058, 0, 0, 0, 1, 1,
0.07277969, -0.8131967, 2.403536, 0, 0, 0, 1, 1,
0.07317787, 0.2840587, 1.115038, 0, 0, 0, 1, 1,
0.08348311, -0.6671788, 1.775099, 0, 0, 0, 1, 1,
0.08913141, -0.5756162, 2.646788, 0, 0, 0, 1, 1,
0.08932911, -0.07662647, 2.873183, 0, 0, 0, 1, 1,
0.09251529, -1.08293, 2.413155, 1, 1, 1, 1, 1,
0.09345902, 1.84802, 0.2442929, 1, 1, 1, 1, 1,
0.09423631, 1.180508, 1.062629, 1, 1, 1, 1, 1,
0.09499378, -0.5407526, 4.609097, 1, 1, 1, 1, 1,
0.09654184, 0.5786112, -1.091127, 1, 1, 1, 1, 1,
0.1007508, 0.156058, 1.717138, 1, 1, 1, 1, 1,
0.1022888, 0.495048, 0.3330017, 1, 1, 1, 1, 1,
0.1023603, -0.7445758, 0.6938773, 1, 1, 1, 1, 1,
0.1028394, 0.1991807, -0.05816416, 1, 1, 1, 1, 1,
0.1040424, -0.5667092, 2.602473, 1, 1, 1, 1, 1,
0.1051441, -1.03658, 1.179694, 1, 1, 1, 1, 1,
0.1075175, -1.41419, 2.775468, 1, 1, 1, 1, 1,
0.1134166, 0.9401839, -0.4122066, 1, 1, 1, 1, 1,
0.1185035, 0.09402367, -0.8708357, 1, 1, 1, 1, 1,
0.124387, 1.3295, -0.1377235, 1, 1, 1, 1, 1,
0.1268946, -0.9537024, 1.726991, 0, 0, 1, 1, 1,
0.1294469, -2.004574, 3.611077, 1, 0, 0, 1, 1,
0.1295937, 1.025578, 0.005136416, 1, 0, 0, 1, 1,
0.1348309, -0.4200619, 3.399449, 1, 0, 0, 1, 1,
0.135608, 0.6727095, -0.3874839, 1, 0, 0, 1, 1,
0.1361487, 0.3612638, 0.4571448, 1, 0, 0, 1, 1,
0.1366678, 0.714749, -1.047375, 0, 0, 0, 1, 1,
0.136906, -0.322212, 3.004348, 0, 0, 0, 1, 1,
0.1372966, 0.7683871, 0.5460066, 0, 0, 0, 1, 1,
0.1480815, -1.096282, 2.142461, 0, 0, 0, 1, 1,
0.1511302, -1.9489, 2.479882, 0, 0, 0, 1, 1,
0.1518956, -2.781075, 3.360133, 0, 0, 0, 1, 1,
0.1525194, 0.1683536, 2.421804, 0, 0, 0, 1, 1,
0.1531158, -0.8252626, 1.244519, 1, 1, 1, 1, 1,
0.1548831, 0.02101556, 0.5219393, 1, 1, 1, 1, 1,
0.1559232, -1.299926, 3.311847, 1, 1, 1, 1, 1,
0.1579792, 0.1762312, 0.8261766, 1, 1, 1, 1, 1,
0.1580504, -0.192255, 1.743135, 1, 1, 1, 1, 1,
0.1583088, -0.1578806, 3.361642, 1, 1, 1, 1, 1,
0.1597562, 1.125672, -1.011668, 1, 1, 1, 1, 1,
0.1612169, -0.7178956, 2.096587, 1, 1, 1, 1, 1,
0.1637066, -0.2595548, 3.260929, 1, 1, 1, 1, 1,
0.1653283, -1.251695, 3.396857, 1, 1, 1, 1, 1,
0.1686968, -0.5556502, 2.798373, 1, 1, 1, 1, 1,
0.170019, 0.6529794, 1.936887, 1, 1, 1, 1, 1,
0.1711839, 1.157432, -1.084407, 1, 1, 1, 1, 1,
0.1723071, -0.658769, 1.294636, 1, 1, 1, 1, 1,
0.1741522, -0.4926858, 3.122854, 1, 1, 1, 1, 1,
0.1754044, -0.2061991, 4.236938, 0, 0, 1, 1, 1,
0.1815936, 0.3801031, -0.9337371, 1, 0, 0, 1, 1,
0.1928503, -0.4495938, 2.635425, 1, 0, 0, 1, 1,
0.1937989, 0.9187854, 0.5468324, 1, 0, 0, 1, 1,
0.1981244, -2.065779, 2.928954, 1, 0, 0, 1, 1,
0.1982147, -0.5082741, 1.985479, 1, 0, 0, 1, 1,
0.2035968, -0.8926541, 3.797174, 0, 0, 0, 1, 1,
0.2062505, 0.8575231, -0.1130482, 0, 0, 0, 1, 1,
0.2081688, -0.5094995, 3.193485, 0, 0, 0, 1, 1,
0.217812, 2.393463, 0.9837416, 0, 0, 0, 1, 1,
0.2211864, -1.365304, 0.8598002, 0, 0, 0, 1, 1,
0.2230034, 1.100359, 0.4804449, 0, 0, 0, 1, 1,
0.2270317, -1.064497, 3.111501, 0, 0, 0, 1, 1,
0.2300579, 0.4629359, 0.04105011, 1, 1, 1, 1, 1,
0.240547, 1.359664, 0.5996327, 1, 1, 1, 1, 1,
0.2405749, 0.716127, 1.058491, 1, 1, 1, 1, 1,
0.2444149, 0.01097133, 0.8999435, 1, 1, 1, 1, 1,
0.2452129, -0.04282022, -0.1341566, 1, 1, 1, 1, 1,
0.2456342, 1.302069, -0.2584682, 1, 1, 1, 1, 1,
0.2497066, 0.5306226, 0.9786291, 1, 1, 1, 1, 1,
0.2522322, 0.4356237, 0.5483147, 1, 1, 1, 1, 1,
0.2532563, -0.2855581, 2.529987, 1, 1, 1, 1, 1,
0.2543375, 0.3665684, 1.288074, 1, 1, 1, 1, 1,
0.2548783, 1.066941, 1.967081, 1, 1, 1, 1, 1,
0.2577902, -0.1708919, 0.5577964, 1, 1, 1, 1, 1,
0.2585664, -0.3097889, 3.442997, 1, 1, 1, 1, 1,
0.2652945, -1.493615, 3.255733, 1, 1, 1, 1, 1,
0.2659176, 0.3189611, 1.536607, 1, 1, 1, 1, 1,
0.2666855, -1.49473, 2.700837, 0, 0, 1, 1, 1,
0.267015, 1.334003, -0.3705622, 1, 0, 0, 1, 1,
0.2703756, -0.4307006, 1.24015, 1, 0, 0, 1, 1,
0.2778368, 0.6913111, 0.8967254, 1, 0, 0, 1, 1,
0.279837, -0.1052607, 1.994682, 1, 0, 0, 1, 1,
0.2798634, 0.06442919, 4.262923, 1, 0, 0, 1, 1,
0.2815467, -0.1623026, 2.64237, 0, 0, 0, 1, 1,
0.2852309, 0.04190305, 2.435829, 0, 0, 0, 1, 1,
0.2854033, -0.5802456, 2.335306, 0, 0, 0, 1, 1,
0.289557, 0.7456115, 0.5590972, 0, 0, 0, 1, 1,
0.2910958, 0.2046611, 1.119322, 0, 0, 0, 1, 1,
0.2918707, -0.03910103, 1.202839, 0, 0, 0, 1, 1,
0.2918721, 0.04373755, 0.5130031, 0, 0, 0, 1, 1,
0.2943225, 0.007504377, 3.198752, 1, 1, 1, 1, 1,
0.2995337, 0.2135154, 2.882792, 1, 1, 1, 1, 1,
0.3026424, -0.4633465, 2.021998, 1, 1, 1, 1, 1,
0.3064725, -1.008039, 4.391979, 1, 1, 1, 1, 1,
0.3075809, -2.166842, 3.137452, 1, 1, 1, 1, 1,
0.3082565, 0.3585606, 0.1667058, 1, 1, 1, 1, 1,
0.3119843, -0.7007729, 2.611406, 1, 1, 1, 1, 1,
0.3142813, -0.3838326, 2.383296, 1, 1, 1, 1, 1,
0.3221162, 1.287715, -1.720345, 1, 1, 1, 1, 1,
0.3257221, 0.324424, -0.5243316, 1, 1, 1, 1, 1,
0.3314014, 0.9289302, -0.6991013, 1, 1, 1, 1, 1,
0.336206, 1.978032, 0.6020797, 1, 1, 1, 1, 1,
0.3407141, 1.569968, -0.1115241, 1, 1, 1, 1, 1,
0.3417094, 0.4365079, -1.161773, 1, 1, 1, 1, 1,
0.34254, -0.3276123, 0.7752046, 1, 1, 1, 1, 1,
0.3479732, 1.120016, 1.620106, 0, 0, 1, 1, 1,
0.3496187, -0.1967565, 1.524803, 1, 0, 0, 1, 1,
0.3497713, 0.07768799, -0.2736968, 1, 0, 0, 1, 1,
0.3533891, 1.421442, 0.3483288, 1, 0, 0, 1, 1,
0.3559431, 1.281048, 0.2053542, 1, 0, 0, 1, 1,
0.3567061, 1.932899, 1.305243, 1, 0, 0, 1, 1,
0.3574959, -1.281713, 3.672432, 0, 0, 0, 1, 1,
0.3578598, 0.0215128, 1.331014, 0, 0, 0, 1, 1,
0.3583201, -0.6120153, 2.360213, 0, 0, 0, 1, 1,
0.3587789, 0.146159, 1.991642, 0, 0, 0, 1, 1,
0.3602519, -2.086073, 3.85798, 0, 0, 0, 1, 1,
0.3629042, 0.4859456, -0.7979224, 0, 0, 0, 1, 1,
0.3636899, -0.2482966, 0.7457812, 0, 0, 0, 1, 1,
0.3689804, -0.5359675, 1.455558, 1, 1, 1, 1, 1,
0.3690327, -0.293786, 3.355819, 1, 1, 1, 1, 1,
0.369878, -1.593407, 2.360992, 1, 1, 1, 1, 1,
0.3717467, 0.03814122, -0.02809198, 1, 1, 1, 1, 1,
0.3718373, -1.4639, 2.72572, 1, 1, 1, 1, 1,
0.3719387, -1.072832, 2.097025, 1, 1, 1, 1, 1,
0.37506, -2.257756, 1.400774, 1, 1, 1, 1, 1,
0.3759277, 0.2793346, 1.654936, 1, 1, 1, 1, 1,
0.3762583, -0.2741494, 3.987804, 1, 1, 1, 1, 1,
0.3807502, -1.49832, 2.186013, 1, 1, 1, 1, 1,
0.3865043, 0.2110588, 1.31348, 1, 1, 1, 1, 1,
0.3869965, -0.449013, 0.8606992, 1, 1, 1, 1, 1,
0.3873945, 0.8318012, -0.6417264, 1, 1, 1, 1, 1,
0.3912978, 1.71483, 0.6752872, 1, 1, 1, 1, 1,
0.3915438, 0.4682161, -1.383388, 1, 1, 1, 1, 1,
0.3932303, 0.569766, 0.1934565, 0, 0, 1, 1, 1,
0.3933411, -1.064616, 4.257084, 1, 0, 0, 1, 1,
0.39372, -0.8298243, 2.049276, 1, 0, 0, 1, 1,
0.3975821, -1.330751, 1.680486, 1, 0, 0, 1, 1,
0.4054617, 1.754077, -1.233608, 1, 0, 0, 1, 1,
0.406957, -0.0807116, 1.685744, 1, 0, 0, 1, 1,
0.4071304, -0.4601335, 1.784955, 0, 0, 0, 1, 1,
0.4130293, 0.2292542, 1.346393, 0, 0, 0, 1, 1,
0.4174685, -1.124704, 2.822789, 0, 0, 0, 1, 1,
0.4223492, 0.6111173, 0.4397897, 0, 0, 0, 1, 1,
0.4289391, -0.3636838, 2.384512, 0, 0, 0, 1, 1,
0.4327143, 1.759322, 0.4944842, 0, 0, 0, 1, 1,
0.4340354, 0.06234272, 2.15751, 0, 0, 0, 1, 1,
0.4367607, -0.07077462, 0.03223503, 1, 1, 1, 1, 1,
0.4469033, -1.190319, 2.409036, 1, 1, 1, 1, 1,
0.4547897, 1.596625, -0.2615503, 1, 1, 1, 1, 1,
0.4605308, 0.5293663, 0.8911296, 1, 1, 1, 1, 1,
0.4608155, 1.12631, -0.4105185, 1, 1, 1, 1, 1,
0.462447, 0.6766128, -0.0004189738, 1, 1, 1, 1, 1,
0.4644647, -0.7206843, 2.711165, 1, 1, 1, 1, 1,
0.4646997, -1.186073, 1.806489, 1, 1, 1, 1, 1,
0.4692954, -0.1480253, -0.3254635, 1, 1, 1, 1, 1,
0.4703754, -0.495389, 2.160354, 1, 1, 1, 1, 1,
0.4753905, 0.2737596, -0.1643437, 1, 1, 1, 1, 1,
0.47584, -1.411885, 2.552194, 1, 1, 1, 1, 1,
0.4762824, 1.614267, 1.026785, 1, 1, 1, 1, 1,
0.4816891, 1.015526, 0.2762148, 1, 1, 1, 1, 1,
0.4882117, 0.6173977, -0.6843982, 1, 1, 1, 1, 1,
0.4958248, -1.289607, 2.9605, 0, 0, 1, 1, 1,
0.4964924, -0.780736, 0.799737, 1, 0, 0, 1, 1,
0.4990517, 0.7821933, -0.1385862, 1, 0, 0, 1, 1,
0.5013923, 0.6295745, 1.105482, 1, 0, 0, 1, 1,
0.5043279, 0.3568607, 0.6921496, 1, 0, 0, 1, 1,
0.5133556, 1.798634, -2.880887, 1, 0, 0, 1, 1,
0.5134897, -0.7291198, 4.148666, 0, 0, 0, 1, 1,
0.5169957, -0.3203023, 1.599374, 0, 0, 0, 1, 1,
0.5174953, -1.363323, 4.242513, 0, 0, 0, 1, 1,
0.5181966, 1.206239, -0.2926947, 0, 0, 0, 1, 1,
0.5300255, -0.4343896, 2.612483, 0, 0, 0, 1, 1,
0.5307344, -0.2762406, 0.9208364, 0, 0, 0, 1, 1,
0.5366433, -0.0460746, 2.402327, 0, 0, 0, 1, 1,
0.5374986, -1.047534, 1.898408, 1, 1, 1, 1, 1,
0.5388297, -0.03736101, 1.49127, 1, 1, 1, 1, 1,
0.5393625, 0.8086954, 0.8364107, 1, 1, 1, 1, 1,
0.5434592, -0.2605368, 1.808215, 1, 1, 1, 1, 1,
0.5445311, 1.201223, 1.770787, 1, 1, 1, 1, 1,
0.5493737, 0.6984894, 2.299961, 1, 1, 1, 1, 1,
0.5498567, 0.5100514, -0.7512693, 1, 1, 1, 1, 1,
0.5505791, -1.054677, 1.845789, 1, 1, 1, 1, 1,
0.5521339, 0.07920796, 2.157768, 1, 1, 1, 1, 1,
0.5581897, -1.642513, 3.227441, 1, 1, 1, 1, 1,
0.5583886, -1.103766, 1.447377, 1, 1, 1, 1, 1,
0.5630796, 2.022538, -1.320323, 1, 1, 1, 1, 1,
0.5636111, 0.7200767, -0.1001875, 1, 1, 1, 1, 1,
0.5644252, -0.02911861, 0.8687366, 1, 1, 1, 1, 1,
0.5668044, -1.712196, 2.465193, 1, 1, 1, 1, 1,
0.5758604, 0.2470412, 1.359955, 0, 0, 1, 1, 1,
0.5765544, 1.36349, 0.6979229, 1, 0, 0, 1, 1,
0.579405, -1.054688, 2.485481, 1, 0, 0, 1, 1,
0.5808234, 1.28187, 2.014574, 1, 0, 0, 1, 1,
0.5811498, -1.567824, 4.225444, 1, 0, 0, 1, 1,
0.5811592, 0.4823299, 2.367867, 1, 0, 0, 1, 1,
0.5821559, -0.2160046, 3.809664, 0, 0, 0, 1, 1,
0.5835145, -1.510945, 3.333683, 0, 0, 0, 1, 1,
0.587018, 0.2360983, 0.5773068, 0, 0, 0, 1, 1,
0.5877286, -0.7289719, 1.558998, 0, 0, 0, 1, 1,
0.5943356, -0.5713, 4.140401, 0, 0, 0, 1, 1,
0.5951059, -1.0423, 2.904101, 0, 0, 0, 1, 1,
0.6054146, 1.926746, -0.03070093, 0, 0, 0, 1, 1,
0.6064938, -0.07927892, 1.848438, 1, 1, 1, 1, 1,
0.6088619, -1.004663, 1.126021, 1, 1, 1, 1, 1,
0.618434, -2.445706, 1.655506, 1, 1, 1, 1, 1,
0.6201023, 0.2763633, 1.877459, 1, 1, 1, 1, 1,
0.6204814, 0.570902, 1.771779, 1, 1, 1, 1, 1,
0.6214617, 0.2974012, 0.5747094, 1, 1, 1, 1, 1,
0.6229384, 0.3384317, 0.1814608, 1, 1, 1, 1, 1,
0.623864, 0.5471933, 0.1308072, 1, 1, 1, 1, 1,
0.6252182, -1.582113, 2.643606, 1, 1, 1, 1, 1,
0.6305497, 0.4212835, 1.534542, 1, 1, 1, 1, 1,
0.6374642, 0.1708359, 2.078013, 1, 1, 1, 1, 1,
0.6399657, -1.525073, 2.918766, 1, 1, 1, 1, 1,
0.6434095, 0.0170721, -0.1418063, 1, 1, 1, 1, 1,
0.6491802, -0.2551444, 2.116092, 1, 1, 1, 1, 1,
0.6507263, 0.7574561, 1.739598, 1, 1, 1, 1, 1,
0.6510763, 0.3592111, 0.6620979, 0, 0, 1, 1, 1,
0.6515558, -0.1570969, 2.494978, 1, 0, 0, 1, 1,
0.6516623, 0.201355, 0.4496351, 1, 0, 0, 1, 1,
0.6562063, -0.724335, 2.105306, 1, 0, 0, 1, 1,
0.6609618, -0.8497755, 3.166354, 1, 0, 0, 1, 1,
0.6612652, 1.350645, 0.3636324, 1, 0, 0, 1, 1,
0.6640798, -0.200658, 0.5687235, 0, 0, 0, 1, 1,
0.664594, -0.2266122, 1.692472, 0, 0, 0, 1, 1,
0.6714297, -1.124668, 2.978052, 0, 0, 0, 1, 1,
0.6745397, -0.7974811, 1.769181, 0, 0, 0, 1, 1,
0.674766, 0.7730469, -1.278901, 0, 0, 0, 1, 1,
0.6760011, -0.4707417, 0.6475478, 0, 0, 0, 1, 1,
0.6784663, -1.64871, 3.088919, 0, 0, 0, 1, 1,
0.6794506, 1.279571, 0.6756369, 1, 1, 1, 1, 1,
0.6819707, -0.6443514, 2.713171, 1, 1, 1, 1, 1,
0.6821661, 0.399772, 0.8254856, 1, 1, 1, 1, 1,
0.6930128, -2.642759, 2.904543, 1, 1, 1, 1, 1,
0.6943488, -0.5132613, 2.529567, 1, 1, 1, 1, 1,
0.6977555, 0.4847111, 0.9831426, 1, 1, 1, 1, 1,
0.698255, 1.167234, -0.9137231, 1, 1, 1, 1, 1,
0.7015119, -0.3521114, 0.5730357, 1, 1, 1, 1, 1,
0.7078365, 0.7401302, 1.522097, 1, 1, 1, 1, 1,
0.7159134, -0.1378176, 2.645605, 1, 1, 1, 1, 1,
0.7239997, -0.8311813, 2.10455, 1, 1, 1, 1, 1,
0.728238, -0.7983711, 2.943599, 1, 1, 1, 1, 1,
0.7334189, 1.327826, 0.3233792, 1, 1, 1, 1, 1,
0.7337187, 0.7326769, 0.8897874, 1, 1, 1, 1, 1,
0.7372891, -1.185763, 1.503375, 1, 1, 1, 1, 1,
0.7394422, -0.1818241, 0.8962034, 0, 0, 1, 1, 1,
0.7404996, 0.6740708, 0.4389879, 1, 0, 0, 1, 1,
0.7538232, -0.4003537, 0.4586666, 1, 0, 0, 1, 1,
0.7540582, 0.544504, 1.570092, 1, 0, 0, 1, 1,
0.7604797, 2.324032, -0.3763022, 1, 0, 0, 1, 1,
0.7634773, -0.7588303, 2.9954, 1, 0, 0, 1, 1,
0.7780631, -0.6973733, 3.399271, 0, 0, 0, 1, 1,
0.7840337, 0.536791, -0.1322286, 0, 0, 0, 1, 1,
0.787447, 0.1860865, 2.643091, 0, 0, 0, 1, 1,
0.7916108, -0.5095242, 0.8907459, 0, 0, 0, 1, 1,
0.8101327, 0.7792449, 1.975227, 0, 0, 0, 1, 1,
0.8192789, 1.368759, 0.05859026, 0, 0, 0, 1, 1,
0.8221868, -1.588178, 4.66261, 0, 0, 0, 1, 1,
0.8222651, 0.04746506, 2.327589, 1, 1, 1, 1, 1,
0.8313302, 0.1654209, 3.010092, 1, 1, 1, 1, 1,
0.8390425, -0.7481995, 4.078128, 1, 1, 1, 1, 1,
0.8487643, 0.1948406, 1.259396, 1, 1, 1, 1, 1,
0.8500314, -1.997939, 4.615417, 1, 1, 1, 1, 1,
0.8542444, -0.6807126, 2.605695, 1, 1, 1, 1, 1,
0.8564501, -1.270527, 3.399846, 1, 1, 1, 1, 1,
0.8570979, 0.9651241, -0.001796584, 1, 1, 1, 1, 1,
0.8614829, -0.837579, 1.140157, 1, 1, 1, 1, 1,
0.8634318, 0.6700247, 1.414669, 1, 1, 1, 1, 1,
0.8706135, 0.9475874, -0.1015469, 1, 1, 1, 1, 1,
0.8719777, 0.460887, 1.558508, 1, 1, 1, 1, 1,
0.8729224, 1.218875, 0.9034441, 1, 1, 1, 1, 1,
0.8779209, -0.8433133, 3.597603, 1, 1, 1, 1, 1,
0.8942131, 2.193498, 0.6926975, 1, 1, 1, 1, 1,
0.8975064, 1.63443, 1.104817, 0, 0, 1, 1, 1,
0.9101341, 1.15083, 0.2852023, 1, 0, 0, 1, 1,
0.9207477, 0.7136884, 2.226386, 1, 0, 0, 1, 1,
0.9286038, -1.039099, 2.433061, 1, 0, 0, 1, 1,
0.9378512, -1.013494, 3.004086, 1, 0, 0, 1, 1,
0.9427141, 0.3422722, 3.05242, 1, 0, 0, 1, 1,
0.9475145, 0.732312, 0.8100048, 0, 0, 0, 1, 1,
0.9491654, 0.6032817, 0.09029668, 0, 0, 0, 1, 1,
0.9494693, -1.543402, 1.525153, 0, 0, 0, 1, 1,
0.9609299, -0.6877, 2.445506, 0, 0, 0, 1, 1,
0.9632282, -0.2643886, 2.408517, 0, 0, 0, 1, 1,
0.9651421, -0.1489179, 2.018942, 0, 0, 0, 1, 1,
0.9655833, -0.1864276, 2.6553, 0, 0, 0, 1, 1,
0.974893, 0.5509477, 1.271925, 1, 1, 1, 1, 1,
0.9788634, 1.839529, 1.257382, 1, 1, 1, 1, 1,
0.9849225, 0.5003496, 1.381418, 1, 1, 1, 1, 1,
0.9859951, 0.7410138, 1.987834, 1, 1, 1, 1, 1,
0.9906785, -0.5317603, 3.041929, 1, 1, 1, 1, 1,
0.9949645, 1.68435, -0.2743167, 1, 1, 1, 1, 1,
0.997481, 1.638102, 1.472803, 1, 1, 1, 1, 1,
0.9990674, 0.7137026, 1.274244, 1, 1, 1, 1, 1,
1.002481, -0.293348, 2.634395, 1, 1, 1, 1, 1,
1.003962, 0.4557615, 0.4020723, 1, 1, 1, 1, 1,
1.00466, -0.4667205, 2.744365, 1, 1, 1, 1, 1,
1.006151, -0.6412621, 2.398421, 1, 1, 1, 1, 1,
1.006801, -1.571575, 2.457675, 1, 1, 1, 1, 1,
1.011535, 1.420299, -0.06384723, 1, 1, 1, 1, 1,
1.016636, 0.5757064, 2.975801, 1, 1, 1, 1, 1,
1.021948, 1.89286, 0.5089843, 0, 0, 1, 1, 1,
1.024073, 2.059988, -0.1211845, 1, 0, 0, 1, 1,
1.029306, 0.3570645, 0.9168372, 1, 0, 0, 1, 1,
1.036596, 1.344856, 0.8441589, 1, 0, 0, 1, 1,
1.044383, 0.8811427, -0.2605656, 1, 0, 0, 1, 1,
1.045286, 1.613721, 0.3950982, 1, 0, 0, 1, 1,
1.049238, -1.263173, 3.504733, 0, 0, 0, 1, 1,
1.055867, -0.3928852, 1.695273, 0, 0, 0, 1, 1,
1.056042, 0.006905342, 2.220724, 0, 0, 0, 1, 1,
1.062726, -1.038085, 1.959364, 0, 0, 0, 1, 1,
1.064753, -0.4716772, 3.825378, 0, 0, 0, 1, 1,
1.066546, -0.8706396, 3.527718, 0, 0, 0, 1, 1,
1.074681, -1.632152, 3.731824, 0, 0, 0, 1, 1,
1.082568, -1.745354, 1.34398, 1, 1, 1, 1, 1,
1.087337, 1.860143, -0.8363938, 1, 1, 1, 1, 1,
1.090956, -0.13755, 0.3214172, 1, 1, 1, 1, 1,
1.094189, -1.122744, 1.567441, 1, 1, 1, 1, 1,
1.094198, -0.5186058, 2.297643, 1, 1, 1, 1, 1,
1.095379, -2.393757, 2.78977, 1, 1, 1, 1, 1,
1.09643, 1.497692, -1.007058, 1, 1, 1, 1, 1,
1.09962, -0.9361112, 2.562573, 1, 1, 1, 1, 1,
1.109516, -0.80686, 2.77088, 1, 1, 1, 1, 1,
1.122319, 0.321614, -0.2808329, 1, 1, 1, 1, 1,
1.128989, -0.4759937, 1.019152, 1, 1, 1, 1, 1,
1.129587, 1.810193, -0.01533833, 1, 1, 1, 1, 1,
1.130771, -0.06687431, 2.418966, 1, 1, 1, 1, 1,
1.135023, -0.1661813, 0.8301008, 1, 1, 1, 1, 1,
1.139735, -0.2041488, 0.5007672, 1, 1, 1, 1, 1,
1.144645, -1.781531, 1.195706, 0, 0, 1, 1, 1,
1.154601, 0.2463844, 0.1523343, 1, 0, 0, 1, 1,
1.155304, -0.1102134, 2.642489, 1, 0, 0, 1, 1,
1.15694, -0.15622, 2.728832, 1, 0, 0, 1, 1,
1.157024, -0.9878613, 2.467336, 1, 0, 0, 1, 1,
1.158523, -0.2505933, 2.222329, 1, 0, 0, 1, 1,
1.159445, 0.3714647, 0.5198167, 0, 0, 0, 1, 1,
1.162344, 1.052424, 0.5620428, 0, 0, 0, 1, 1,
1.175302, 0.09894585, 2.400535, 0, 0, 0, 1, 1,
1.177828, 1.047297, 0.697867, 0, 0, 0, 1, 1,
1.184684, -1.083436, 3.472201, 0, 0, 0, 1, 1,
1.186082, 1.240766, -0.5625209, 0, 0, 0, 1, 1,
1.187305, -0.5725478, 2.627543, 0, 0, 0, 1, 1,
1.18826, -0.9346831, 1.19915, 1, 1, 1, 1, 1,
1.196961, 1.135481, 1.867771, 1, 1, 1, 1, 1,
1.198265, -1.442491, 1.615433, 1, 1, 1, 1, 1,
1.217536, -0.6990527, 3.307713, 1, 1, 1, 1, 1,
1.221187, -0.1212123, 2.476105, 1, 1, 1, 1, 1,
1.225658, 0.02089711, 1.848491, 1, 1, 1, 1, 1,
1.229226, -0.2255797, 1.584586, 1, 1, 1, 1, 1,
1.232867, -0.5245884, 2.193464, 1, 1, 1, 1, 1,
1.248698, -1.764467, 1.958974, 1, 1, 1, 1, 1,
1.252088, -0.6870663, 2.563281, 1, 1, 1, 1, 1,
1.262399, -0.2813615, -0.6218959, 1, 1, 1, 1, 1,
1.262902, 0.6988195, -0.1136799, 1, 1, 1, 1, 1,
1.272228, 0.9410423, 0.6615899, 1, 1, 1, 1, 1,
1.278961, 2.317672, 1.35256, 1, 1, 1, 1, 1,
1.282135, -0.6589476, 2.50871, 1, 1, 1, 1, 1,
1.285309, -0.209054, 4.108195, 0, 0, 1, 1, 1,
1.286133, -1.890523, 2.248203, 1, 0, 0, 1, 1,
1.288437, 0.227386, -0.3703865, 1, 0, 0, 1, 1,
1.290243, -0.3541422, 3.272966, 1, 0, 0, 1, 1,
1.291464, -1.07459, 3.341372, 1, 0, 0, 1, 1,
1.295399, 0.231777, 0.2043055, 1, 0, 0, 1, 1,
1.295627, -0.3174889, 2.72224, 0, 0, 0, 1, 1,
1.30525, 0.9033095, 0.1620379, 0, 0, 0, 1, 1,
1.305751, -0.7579082, 3.223735, 0, 0, 0, 1, 1,
1.306083, 1.160658, 2.852221, 0, 0, 0, 1, 1,
1.309049, -1.458087, 3.290186, 0, 0, 0, 1, 1,
1.311416, 1.87484, 1.783971, 0, 0, 0, 1, 1,
1.31901, 0.4296064, 0.1924325, 0, 0, 0, 1, 1,
1.331251, 0.04644824, 0.9333377, 1, 1, 1, 1, 1,
1.341822, -0.846759, 2.839868, 1, 1, 1, 1, 1,
1.351673, 0.3594485, -0.1127158, 1, 1, 1, 1, 1,
1.353604, 1.005241, 1.311543, 1, 1, 1, 1, 1,
1.385862, -0.3731118, 2.396401, 1, 1, 1, 1, 1,
1.389665, -0.2969607, 2.809873, 1, 1, 1, 1, 1,
1.391112, 0.2419576, 3.344425, 1, 1, 1, 1, 1,
1.407872, 0.8221407, 1.016747, 1, 1, 1, 1, 1,
1.410132, 0.3714398, 2.2983, 1, 1, 1, 1, 1,
1.41164, -0.3309776, 1.116807, 1, 1, 1, 1, 1,
1.414976, 0.2511195, 0.09126364, 1, 1, 1, 1, 1,
1.415629, 0.4592395, 1.46567, 1, 1, 1, 1, 1,
1.423859, 0.42215, 0.328899, 1, 1, 1, 1, 1,
1.42635, 0.5061634, 1.303893, 1, 1, 1, 1, 1,
1.428857, -1.374003, 1.660949, 1, 1, 1, 1, 1,
1.436753, -1.046092, 0.639926, 0, 0, 1, 1, 1,
1.457022, 0.1279382, 1.094575, 1, 0, 0, 1, 1,
1.460744, 2.178234, -0.2140831, 1, 0, 0, 1, 1,
1.464991, -0.1824104, 0.6871603, 1, 0, 0, 1, 1,
1.475589, 1.24627, 1.921061, 1, 0, 0, 1, 1,
1.479237, 1.003047, 0.7962843, 1, 0, 0, 1, 1,
1.481904, 0.1329189, 0.9966447, 0, 0, 0, 1, 1,
1.486146, -0.9591071, 0.4222923, 0, 0, 0, 1, 1,
1.490394, 0.02379517, 2.195637, 0, 0, 0, 1, 1,
1.493937, 0.03801386, 1.321182, 0, 0, 0, 1, 1,
1.51002, 1.217296, 0.9673575, 0, 0, 0, 1, 1,
1.511688, 0.4106242, 0.710886, 0, 0, 0, 1, 1,
1.518728, -1.121943, 3.021576, 0, 0, 0, 1, 1,
1.522534, -0.02357682, 0.4765287, 1, 1, 1, 1, 1,
1.522924, -0.2528855, 0.007608122, 1, 1, 1, 1, 1,
1.526192, 0.7465175, 0.9685106, 1, 1, 1, 1, 1,
1.550812, -0.4019063, 3.898372, 1, 1, 1, 1, 1,
1.555464, 0.2091512, 2.044719, 1, 1, 1, 1, 1,
1.561265, 0.157715, 2.503614, 1, 1, 1, 1, 1,
1.563097, -0.6214896, 2.519567, 1, 1, 1, 1, 1,
1.573069, 0.6981729, 0.1328391, 1, 1, 1, 1, 1,
1.592156, -0.282335, 1.241619, 1, 1, 1, 1, 1,
1.593158, -0.3417776, 1.605288, 1, 1, 1, 1, 1,
1.596557, -0.6853599, 1.894296, 1, 1, 1, 1, 1,
1.639899, -0.6879317, 3.176502, 1, 1, 1, 1, 1,
1.661451, 0.2171958, 2.756077, 1, 1, 1, 1, 1,
1.66685, 0.6355374, 2.744816, 1, 1, 1, 1, 1,
1.668131, -1.243541, 2.09319, 1, 1, 1, 1, 1,
1.669566, 0.6971062, 0.2483536, 0, 0, 1, 1, 1,
1.67349, -0.6782229, 2.68567, 1, 0, 0, 1, 1,
1.676455, -0.4544646, 3.688328, 1, 0, 0, 1, 1,
1.684277, -0.7084802, 2.82639, 1, 0, 0, 1, 1,
1.693068, -0.7007168, 2.154737, 1, 0, 0, 1, 1,
1.707762, -1.402443, 3.059523, 1, 0, 0, 1, 1,
1.716524, -0.5838167, 3.42435, 0, 0, 0, 1, 1,
1.7298, 2.318167, 1.703175, 0, 0, 0, 1, 1,
1.749881, 0.7194357, 2.017584, 0, 0, 0, 1, 1,
1.758759, 0.3827756, 3.466449, 0, 0, 0, 1, 1,
1.760843, -1.234073, 2.966668, 0, 0, 0, 1, 1,
1.782398, -0.8367417, 2.355704, 0, 0, 0, 1, 1,
1.788788, -0.2961412, 1.506455, 0, 0, 0, 1, 1,
1.802516, -0.3416815, 1.097178, 1, 1, 1, 1, 1,
1.810373, 0.4148292, 0.2854578, 1, 1, 1, 1, 1,
1.840863, -1.593349, 2.13766, 1, 1, 1, 1, 1,
1.852981, 0.7792982, 0.9032395, 1, 1, 1, 1, 1,
1.911334, -2.077482, 4.725625, 1, 1, 1, 1, 1,
1.929157, 2.387571, -0.7220637, 1, 1, 1, 1, 1,
1.935517, -2.526541, 0.6395267, 1, 1, 1, 1, 1,
1.939546, 0.2219597, 2.894736, 1, 1, 1, 1, 1,
1.948135, 0.5474443, 1.806022, 1, 1, 1, 1, 1,
2.008481, -1.435261, 0.9429147, 1, 1, 1, 1, 1,
2.017516, -0.6456485, 2.280921, 1, 1, 1, 1, 1,
2.033022, -2.536494, 1.526521, 1, 1, 1, 1, 1,
2.04502, 1.264692, 1.849328, 1, 1, 1, 1, 1,
2.051578, 1.339386, 1.203782, 1, 1, 1, 1, 1,
2.06915, 2.442182, -1.526713, 1, 1, 1, 1, 1,
2.085104, 0.4442468, 1.215436, 0, 0, 1, 1, 1,
2.093225, 0.8322647, 0.7362668, 1, 0, 0, 1, 1,
2.101602, 0.03139639, 1.48974, 1, 0, 0, 1, 1,
2.115312, 1.348723, 0.06465499, 1, 0, 0, 1, 1,
2.16666, -0.3053638, 3.650398, 1, 0, 0, 1, 1,
2.177637, 0.389814, -0.8157542, 1, 0, 0, 1, 1,
2.213887, -0.6863362, 0.9581827, 0, 0, 0, 1, 1,
2.224347, 0.4333994, 1.537561, 0, 0, 0, 1, 1,
2.238513, -0.2045732, 0.4066737, 0, 0, 0, 1, 1,
2.271089, 1.363657, -0.7351433, 0, 0, 0, 1, 1,
2.273664, 1.06039, 1.086975, 0, 0, 0, 1, 1,
2.386469, -1.365547, 2.200924, 0, 0, 0, 1, 1,
2.415193, -0.585117, 0.5692635, 0, 0, 0, 1, 1,
2.51832, -0.2505516, 1.862193, 1, 1, 1, 1, 1,
2.644303, -0.3030833, 2.165172, 1, 1, 1, 1, 1,
2.657537, 0.004820651, 3.474802, 1, 1, 1, 1, 1,
2.817277, -0.9929937, 1.998362, 1, 1, 1, 1, 1,
3.136854, 0.4886063, -0.1948905, 1, 1, 1, 1, 1,
3.316959, 0.8522915, 1.539135, 1, 1, 1, 1, 1,
3.533094, 1.780085, -0.4427448, 1, 1, 1, 1, 1
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
var radius = 9.423176;
var distance = 33.09851;
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
mvMatrix.translate( -0.08221436, -0.1733999, 0.4026816 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.09851);
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
