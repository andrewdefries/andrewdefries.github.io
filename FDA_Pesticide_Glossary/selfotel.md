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
-3.510614, -1.132184, -3.608205, 1, 0, 0, 1,
-3.372547, 0.8222008, -1.405509, 1, 0.007843138, 0, 1,
-3.189668, -0.8055679, -0.6474968, 1, 0.01176471, 0, 1,
-3.005831, 1.120444, -1.53325, 1, 0.01960784, 0, 1,
-2.808847, -0.06261699, -1.202926, 1, 0.02352941, 0, 1,
-2.7897, 1.442714, -0.8867297, 1, 0.03137255, 0, 1,
-2.59603, -0.08050795, -2.486529, 1, 0.03529412, 0, 1,
-2.585404, -0.4897913, -1.79367, 1, 0.04313726, 0, 1,
-2.570748, 0.41535, -0.7554256, 1, 0.04705882, 0, 1,
-2.568887, 0.639809, -2.156571, 1, 0.05490196, 0, 1,
-2.514302, -0.1061956, 0.4105202, 1, 0.05882353, 0, 1,
-2.513777, -0.2576269, -1.709491, 1, 0.06666667, 0, 1,
-2.443058, 0.6765411, -1.885368, 1, 0.07058824, 0, 1,
-2.433783, 1.742677, -1.018555, 1, 0.07843138, 0, 1,
-2.429813, 0.1198682, -1.658224, 1, 0.08235294, 0, 1,
-2.421096, 0.8390905, -1.011748, 1, 0.09019608, 0, 1,
-2.368296, -0.4119171, -0.02039327, 1, 0.09411765, 0, 1,
-2.270797, 0.1737931, 1.053474, 1, 0.1019608, 0, 1,
-2.197441, 1.493657, -1.90863, 1, 0.1098039, 0, 1,
-2.170905, -0.0005148995, -2.03252, 1, 0.1137255, 0, 1,
-2.124351, -0.7355946, -3.452089, 1, 0.1215686, 0, 1,
-2.116333, -0.155529, -1.909875, 1, 0.1254902, 0, 1,
-2.070388, -1.636462, -2.929663, 1, 0.1333333, 0, 1,
-1.95649, -0.9467892, -3.943527, 1, 0.1372549, 0, 1,
-1.94364, 0.6103836, -1.677039, 1, 0.145098, 0, 1,
-1.922239, -0.08032156, -2.553631, 1, 0.1490196, 0, 1,
-1.918041, 0.3770587, -2.178252, 1, 0.1568628, 0, 1,
-1.917888, 0.9427319, -1.147497, 1, 0.1607843, 0, 1,
-1.902785, 0.8544793, -1.260577, 1, 0.1686275, 0, 1,
-1.897153, -0.7395346, -2.820044, 1, 0.172549, 0, 1,
-1.882938, 0.05030133, -1.131056, 1, 0.1803922, 0, 1,
-1.862127, 0.7508591, -1.364052, 1, 0.1843137, 0, 1,
-1.84161, 1.999545, -2.182652, 1, 0.1921569, 0, 1,
-1.840693, 1.828613, 0.1440692, 1, 0.1960784, 0, 1,
-1.816918, -0.4252602, -2.146585, 1, 0.2039216, 0, 1,
-1.782257, 0.5931576, 0.5378799, 1, 0.2117647, 0, 1,
-1.779188, 0.8255035, -2.403857, 1, 0.2156863, 0, 1,
-1.774914, -0.02899428, 0.4465883, 1, 0.2235294, 0, 1,
-1.766992, 1.964329, -0.6014478, 1, 0.227451, 0, 1,
-1.753693, -0.02553506, -1.810393, 1, 0.2352941, 0, 1,
-1.713404, -0.2775937, -2.224473, 1, 0.2392157, 0, 1,
-1.704032, -1.393241, -1.725889, 1, 0.2470588, 0, 1,
-1.703691, -0.2188538, -3.09396, 1, 0.2509804, 0, 1,
-1.703057, -0.1819631, -0.3623009, 1, 0.2588235, 0, 1,
-1.667165, -0.5083528, -2.287824, 1, 0.2627451, 0, 1,
-1.622023, 0.08097806, -1.562967, 1, 0.2705882, 0, 1,
-1.589393, -0.7588817, -2.316491, 1, 0.2745098, 0, 1,
-1.583756, -0.0106135, -1.455258, 1, 0.282353, 0, 1,
-1.556414, 0.2065522, 0.1017794, 1, 0.2862745, 0, 1,
-1.50953, 1.478597, -3.061646, 1, 0.2941177, 0, 1,
-1.505591, -0.7295059, -1.16199, 1, 0.3019608, 0, 1,
-1.492503, -1.822164, -2.468466, 1, 0.3058824, 0, 1,
-1.48592, 1.890644, -0.325131, 1, 0.3137255, 0, 1,
-1.48552, -0.7999552, -2.859906, 1, 0.3176471, 0, 1,
-1.481181, -0.4686967, -0.7019308, 1, 0.3254902, 0, 1,
-1.468943, -0.03550599, -2.522898, 1, 0.3294118, 0, 1,
-1.456269, -0.9949113, -1.640107, 1, 0.3372549, 0, 1,
-1.455092, -0.2053525, -2.395955, 1, 0.3411765, 0, 1,
-1.453583, -2.339643, -2.765182, 1, 0.3490196, 0, 1,
-1.432518, 0.9564841, -0.723741, 1, 0.3529412, 0, 1,
-1.429121, 0.5307826, -1.764364, 1, 0.3607843, 0, 1,
-1.42351, -0.4301821, 1.853216, 1, 0.3647059, 0, 1,
-1.42302, 0.7103977, -0.01617843, 1, 0.372549, 0, 1,
-1.422082, -0.8398373, -1.656368, 1, 0.3764706, 0, 1,
-1.406856, 1.088099, -0.433381, 1, 0.3843137, 0, 1,
-1.403389, 0.2788181, -0.6975109, 1, 0.3882353, 0, 1,
-1.4019, -0.7615041, -2.247113, 1, 0.3960784, 0, 1,
-1.39529, -0.02632433, -2.137806, 1, 0.4039216, 0, 1,
-1.387215, -0.8691584, -1.389563, 1, 0.4078431, 0, 1,
-1.374784, -0.6553422, -0.2465885, 1, 0.4156863, 0, 1,
-1.36662, -0.3385176, -4.055338, 1, 0.4196078, 0, 1,
-1.360237, -0.6191789, -3.300325, 1, 0.427451, 0, 1,
-1.35603, 0.1978078, -2.102093, 1, 0.4313726, 0, 1,
-1.35511, 0.3583134, -0.4806581, 1, 0.4392157, 0, 1,
-1.347115, -0.740725, -0.5652631, 1, 0.4431373, 0, 1,
-1.342162, 0.5405712, -1.964346, 1, 0.4509804, 0, 1,
-1.339203, -1.386513, -2.38966, 1, 0.454902, 0, 1,
-1.331511, 0.2769971, -2.275095, 1, 0.4627451, 0, 1,
-1.327615, 0.126908, -0.1448899, 1, 0.4666667, 0, 1,
-1.310652, 1.496733, -0.7005233, 1, 0.4745098, 0, 1,
-1.3042, 1.998254, -0.2269948, 1, 0.4784314, 0, 1,
-1.303985, 1.69321, -0.079318, 1, 0.4862745, 0, 1,
-1.303716, -0.5830299, -0.9979174, 1, 0.4901961, 0, 1,
-1.288094, -2.021862, -3.09565, 1, 0.4980392, 0, 1,
-1.280266, -0.3989609, -3.19661, 1, 0.5058824, 0, 1,
-1.257019, -0.6176839, -1.465488, 1, 0.509804, 0, 1,
-1.25697, 0.3527324, 0.2233768, 1, 0.5176471, 0, 1,
-1.254565, 0.1755466, -1.389031, 1, 0.5215687, 0, 1,
-1.24644, 1.906404, -0.9514768, 1, 0.5294118, 0, 1,
-1.240074, 0.1949351, -0.2384818, 1, 0.5333334, 0, 1,
-1.236368, -1.058121, -2.4173, 1, 0.5411765, 0, 1,
-1.235498, 0.9301499, -1.593285, 1, 0.5450981, 0, 1,
-1.232401, 0.2973742, -1.367391, 1, 0.5529412, 0, 1,
-1.230919, 0.5249168, -1.316037, 1, 0.5568628, 0, 1,
-1.228183, 0.2294732, -0.6341425, 1, 0.5647059, 0, 1,
-1.22382, 0.542918, -1.265214, 1, 0.5686275, 0, 1,
-1.222965, 0.8572781, -2.298035, 1, 0.5764706, 0, 1,
-1.219399, -0.438415, -0.4314424, 1, 0.5803922, 0, 1,
-1.214998, -0.9532534, -3.468386, 1, 0.5882353, 0, 1,
-1.211777, 2.235348, -1.628277, 1, 0.5921569, 0, 1,
-1.198831, -1.120583, -1.617367, 1, 0.6, 0, 1,
-1.1986, -0.4927167, -0.7902929, 1, 0.6078432, 0, 1,
-1.194953, 0.1192045, -1.735476, 1, 0.6117647, 0, 1,
-1.193467, 2.42402, -0.06198075, 1, 0.6196079, 0, 1,
-1.189087, 0.2159255, -0.0867774, 1, 0.6235294, 0, 1,
-1.171262, 1.25223, 0.7029679, 1, 0.6313726, 0, 1,
-1.165926, -0.3849252, -2.370937, 1, 0.6352941, 0, 1,
-1.150247, 0.842896, -2.79928, 1, 0.6431373, 0, 1,
-1.136485, 0.4180829, -2.623397, 1, 0.6470588, 0, 1,
-1.13349, -0.6476367, -1.786619, 1, 0.654902, 0, 1,
-1.133267, -2.069011, -2.822705, 1, 0.6588235, 0, 1,
-1.132295, -0.4212545, -0.2917842, 1, 0.6666667, 0, 1,
-1.124191, 1.058824, -0.4936773, 1, 0.6705883, 0, 1,
-1.116675, 1.440873, -2.261264, 1, 0.6784314, 0, 1,
-1.10928, 1.221803, -2.376023, 1, 0.682353, 0, 1,
-1.107014, 0.7068282, 0.9684702, 1, 0.6901961, 0, 1,
-1.097693, 0.8670028, -1.595389, 1, 0.6941177, 0, 1,
-1.09276, 0.7801187, -1.235357, 1, 0.7019608, 0, 1,
-1.092682, -0.6314671, -1.623787, 1, 0.7098039, 0, 1,
-1.079473, -0.02634643, -0.3722124, 1, 0.7137255, 0, 1,
-1.074405, 0.7332423, -0.7044301, 1, 0.7215686, 0, 1,
-1.062245, -1.317214, -1.260473, 1, 0.7254902, 0, 1,
-1.062171, 0.8933918, 1.038552, 1, 0.7333333, 0, 1,
-1.055252, -0.9750714, -1.61832, 1, 0.7372549, 0, 1,
-1.051613, -0.02178514, -3.024532, 1, 0.7450981, 0, 1,
-1.047064, -0.431541, -2.056747, 1, 0.7490196, 0, 1,
-1.044276, 0.3084561, -2.853968, 1, 0.7568628, 0, 1,
-1.041432, -1.48596, -2.033872, 1, 0.7607843, 0, 1,
-1.039192, -0.2767052, 0.3951514, 1, 0.7686275, 0, 1,
-1.034409, 0.05845155, 0.3282969, 1, 0.772549, 0, 1,
-1.027933, 1.175453, -0.4952744, 1, 0.7803922, 0, 1,
-1.02063, -0.9784586, -3.711615, 1, 0.7843137, 0, 1,
-1.015358, -0.8850209, -1.293928, 1, 0.7921569, 0, 1,
-1.012626, 0.1465147, -2.588032, 1, 0.7960784, 0, 1,
-1.012279, 0.2834415, -1.359639, 1, 0.8039216, 0, 1,
-0.995385, 0.7017988, 0.2473124, 1, 0.8117647, 0, 1,
-0.9933679, -0.1557273, -1.237929, 1, 0.8156863, 0, 1,
-0.9929276, -0.8643471, -1.11082, 1, 0.8235294, 0, 1,
-0.9849163, -0.2825341, -0.1750496, 1, 0.827451, 0, 1,
-0.9821372, 1.846114, -2.61831, 1, 0.8352941, 0, 1,
-0.9780715, -0.3167336, -2.600267, 1, 0.8392157, 0, 1,
-0.9706473, -0.5455344, -2.725329, 1, 0.8470588, 0, 1,
-0.9697098, 1.80807, -0.7913951, 1, 0.8509804, 0, 1,
-0.9694081, -0.569638, -2.341533, 1, 0.8588235, 0, 1,
-0.9654891, -0.235674, -2.170898, 1, 0.8627451, 0, 1,
-0.9619992, 1.017363, -1.140054, 1, 0.8705882, 0, 1,
-0.9572618, 0.8714089, -2.725611, 1, 0.8745098, 0, 1,
-0.9567175, 0.7336091, 0.01434417, 1, 0.8823529, 0, 1,
-0.954543, -0.5694727, -1.870285, 1, 0.8862745, 0, 1,
-0.954291, 0.1893179, -2.360456, 1, 0.8941177, 0, 1,
-0.9529907, 1.097006, -0.8424091, 1, 0.8980392, 0, 1,
-0.9411777, -1.290744, -2.389081, 1, 0.9058824, 0, 1,
-0.940919, 0.7446285, -1.129724, 1, 0.9137255, 0, 1,
-0.9407687, -0.9594639, -4.069204, 1, 0.9176471, 0, 1,
-0.9370592, -1.343495, -3.229467, 1, 0.9254902, 0, 1,
-0.9368964, 0.1547784, -2.396068, 1, 0.9294118, 0, 1,
-0.9237064, -0.3879086, -2.287478, 1, 0.9372549, 0, 1,
-0.923678, -0.7274437, -1.367675, 1, 0.9411765, 0, 1,
-0.9214069, -0.9628932, -2.61922, 1, 0.9490196, 0, 1,
-0.9200559, -0.08700128, -1.82988, 1, 0.9529412, 0, 1,
-0.9193236, -0.481301, -0.7590344, 1, 0.9607843, 0, 1,
-0.9153922, 0.6702756, -2.7248, 1, 0.9647059, 0, 1,
-0.9114876, -0.1712637, -3.055331, 1, 0.972549, 0, 1,
-0.9110997, 0.4938422, 0.01236257, 1, 0.9764706, 0, 1,
-0.9037895, -0.0861957, -2.217839, 1, 0.9843137, 0, 1,
-0.9033939, -0.3314028, 0.5414534, 1, 0.9882353, 0, 1,
-0.9027945, -0.1401882, -1.470316, 1, 0.9960784, 0, 1,
-0.8987705, 0.01492822, -1.686593, 0.9960784, 1, 0, 1,
-0.8966059, 0.4196402, -0.3813769, 0.9921569, 1, 0, 1,
-0.893214, -0.1496194, -0.5616852, 0.9843137, 1, 0, 1,
-0.8925328, -0.4216918, -1.932645, 0.9803922, 1, 0, 1,
-0.8865387, -0.3435138, -1.188229, 0.972549, 1, 0, 1,
-0.8861751, 0.6323076, 0.4950642, 0.9686275, 1, 0, 1,
-0.8798286, -0.985009, -0.6639524, 0.9607843, 1, 0, 1,
-0.872922, 0.2354338, -1.967278, 0.9568627, 1, 0, 1,
-0.8704256, 1.12759, 1.71316, 0.9490196, 1, 0, 1,
-0.8631446, 1.016962, 0.4500753, 0.945098, 1, 0, 1,
-0.8593521, 1.486948, -0.07807266, 0.9372549, 1, 0, 1,
-0.8557939, 0.0225831, -0.1738134, 0.9333333, 1, 0, 1,
-0.854646, -0.9080374, -2.37629, 0.9254902, 1, 0, 1,
-0.8520948, 1.055923, 0.8781685, 0.9215686, 1, 0, 1,
-0.8461222, -0.41463, -1.546493, 0.9137255, 1, 0, 1,
-0.8421571, 1.069739, 1.479079, 0.9098039, 1, 0, 1,
-0.8409591, -1.504072, -1.307222, 0.9019608, 1, 0, 1,
-0.8370854, 0.2110979, -0.6087452, 0.8941177, 1, 0, 1,
-0.8344925, 0.5729807, -2.182804, 0.8901961, 1, 0, 1,
-0.8322367, 0.1600432, -0.4463595, 0.8823529, 1, 0, 1,
-0.8259608, 2.381077, -0.17183, 0.8784314, 1, 0, 1,
-0.8248502, 1.491727, -1.183472, 0.8705882, 1, 0, 1,
-0.8240595, -0.5383536, -0.01538578, 0.8666667, 1, 0, 1,
-0.8215623, 0.401685, -1.281283, 0.8588235, 1, 0, 1,
-0.8202438, 1.015501, -1.454672, 0.854902, 1, 0, 1,
-0.8181241, 0.4059901, -2.838045, 0.8470588, 1, 0, 1,
-0.8161346, -0.557127, -1.63799, 0.8431373, 1, 0, 1,
-0.811179, -0.4147603, -2.558285, 0.8352941, 1, 0, 1,
-0.808359, 0.8213019, 0.6231106, 0.8313726, 1, 0, 1,
-0.8071833, -0.281416, -2.316688, 0.8235294, 1, 0, 1,
-0.8018306, 1.092771, -1.741181, 0.8196079, 1, 0, 1,
-0.8016655, 0.4535501, -0.8545606, 0.8117647, 1, 0, 1,
-0.7953766, 0.8296509, -0.2986228, 0.8078431, 1, 0, 1,
-0.7883031, -1.103128, -2.098817, 0.8, 1, 0, 1,
-0.7837923, -0.5702346, -2.721369, 0.7921569, 1, 0, 1,
-0.7829238, 0.03964558, -1.365252, 0.7882353, 1, 0, 1,
-0.7784543, 1.110104, 0.7137195, 0.7803922, 1, 0, 1,
-0.7741496, 0.9670089, -0.186882, 0.7764706, 1, 0, 1,
-0.7734515, 1.158209, -0.5737711, 0.7686275, 1, 0, 1,
-0.7705187, 0.3316031, -1.673632, 0.7647059, 1, 0, 1,
-0.7677467, 1.696521, -0.8393654, 0.7568628, 1, 0, 1,
-0.767544, -0.271655, -2.250363, 0.7529412, 1, 0, 1,
-0.7631937, -0.1499185, -2.517418, 0.7450981, 1, 0, 1,
-0.763068, 1.140131, -2.205825, 0.7411765, 1, 0, 1,
-0.760281, -1.326822, -2.371557, 0.7333333, 1, 0, 1,
-0.7588152, 0.3328833, -0.7159345, 0.7294118, 1, 0, 1,
-0.7561627, 1.269051, -0.5957848, 0.7215686, 1, 0, 1,
-0.7495561, -1.582485, -4.31466, 0.7176471, 1, 0, 1,
-0.7450324, 0.09416279, -1.812383, 0.7098039, 1, 0, 1,
-0.7445505, 0.6481588, -0.104865, 0.7058824, 1, 0, 1,
-0.7434987, 1.76955, -1.464256, 0.6980392, 1, 0, 1,
-0.7415938, -0.1992346, -4.265933, 0.6901961, 1, 0, 1,
-0.7407084, 0.8929287, -0.592232, 0.6862745, 1, 0, 1,
-0.7374345, 0.2344656, -1.442764, 0.6784314, 1, 0, 1,
-0.7371958, 2.396694, -1.106383, 0.6745098, 1, 0, 1,
-0.7322966, 0.2294245, -0.8078488, 0.6666667, 1, 0, 1,
-0.7300567, -1.210103, -2.491242, 0.6627451, 1, 0, 1,
-0.7249119, 0.99348, -2.501894, 0.654902, 1, 0, 1,
-0.7233564, -0.3956207, -2.354737, 0.6509804, 1, 0, 1,
-0.7165198, -3.0149, -1.937678, 0.6431373, 1, 0, 1,
-0.7148647, -0.8842354, -3.395454, 0.6392157, 1, 0, 1,
-0.7113801, -0.5457938, -0.850323, 0.6313726, 1, 0, 1,
-0.7108982, 1.350399, 0.4769383, 0.627451, 1, 0, 1,
-0.7091227, -0.1792946, -1.919362, 0.6196079, 1, 0, 1,
-0.7059096, 0.3789627, -0.7632946, 0.6156863, 1, 0, 1,
-0.7042099, 0.3211565, -1.839903, 0.6078432, 1, 0, 1,
-0.7006146, -0.2626263, -4.018119, 0.6039216, 1, 0, 1,
-0.6956618, 0.5242665, -1.816188, 0.5960785, 1, 0, 1,
-0.6945538, -0.3340842, -1.172875, 0.5882353, 1, 0, 1,
-0.6944339, 0.5170196, 1.697523, 0.5843138, 1, 0, 1,
-0.6932072, 2.481079, -1.101767, 0.5764706, 1, 0, 1,
-0.6881036, -0.1272459, -2.543427, 0.572549, 1, 0, 1,
-0.6863466, 0.5167882, 0.3437876, 0.5647059, 1, 0, 1,
-0.6862436, -1.147161, -2.391356, 0.5607843, 1, 0, 1,
-0.6842928, -1.321029, -1.467477, 0.5529412, 1, 0, 1,
-0.6769894, -3.480097, -0.5739369, 0.5490196, 1, 0, 1,
-0.6760027, -1.582425, -1.960183, 0.5411765, 1, 0, 1,
-0.6734104, 1.02608, 0.5819277, 0.5372549, 1, 0, 1,
-0.6618492, 0.6305131, -1.2502, 0.5294118, 1, 0, 1,
-0.6569872, 0.8798409, -0.4010352, 0.5254902, 1, 0, 1,
-0.6550313, -1.22667, -1.579322, 0.5176471, 1, 0, 1,
-0.653244, -1.201243, -3.161675, 0.5137255, 1, 0, 1,
-0.6507831, -1.477534, -4.308668, 0.5058824, 1, 0, 1,
-0.648387, -1.263039, -3.216854, 0.5019608, 1, 0, 1,
-0.6450642, -1.493424, -4.839607, 0.4941176, 1, 0, 1,
-0.642933, -0.8238316, -2.986844, 0.4862745, 1, 0, 1,
-0.6423481, 1.190926, 0.4459934, 0.4823529, 1, 0, 1,
-0.6394297, -0.7760544, -3.324212, 0.4745098, 1, 0, 1,
-0.6391017, 0.0972902, -2.774601, 0.4705882, 1, 0, 1,
-0.6388909, -0.1492281, -2.983307, 0.4627451, 1, 0, 1,
-0.6367297, -0.115587, -0.7945057, 0.4588235, 1, 0, 1,
-0.6360281, 0.8375217, -0.1189982, 0.4509804, 1, 0, 1,
-0.6332672, 0.4623035, -2.113534, 0.4470588, 1, 0, 1,
-0.6295066, 1.526043, -0.3802292, 0.4392157, 1, 0, 1,
-0.6272147, -1.484473, -2.662107, 0.4352941, 1, 0, 1,
-0.6235227, 0.4232905, -2.633511, 0.427451, 1, 0, 1,
-0.6225759, 0.0355322, -1.956183, 0.4235294, 1, 0, 1,
-0.6222482, 0.8079409, -1.096177, 0.4156863, 1, 0, 1,
-0.6155691, 0.4793857, -2.484058, 0.4117647, 1, 0, 1,
-0.6084678, -0.4151286, -2.112312, 0.4039216, 1, 0, 1,
-0.6054075, 2.08998, 1.37541, 0.3960784, 1, 0, 1,
-0.6023647, -0.3105232, -2.821906, 0.3921569, 1, 0, 1,
-0.6014398, -0.5636034, -2.207354, 0.3843137, 1, 0, 1,
-0.5984553, -0.9530897, -1.374484, 0.3803922, 1, 0, 1,
-0.5968659, -0.3675861, -1.298385, 0.372549, 1, 0, 1,
-0.5944812, -0.1391856, -1.663663, 0.3686275, 1, 0, 1,
-0.5919887, 1.027106, 1.553898, 0.3607843, 1, 0, 1,
-0.5893433, 1.138718, -0.4030266, 0.3568628, 1, 0, 1,
-0.588496, -1.17902, -2.092197, 0.3490196, 1, 0, 1,
-0.5828233, 0.2269458, -0.6315563, 0.345098, 1, 0, 1,
-0.5822678, -0.6958211, -0.9469972, 0.3372549, 1, 0, 1,
-0.5806491, 0.3140842, -2.8573, 0.3333333, 1, 0, 1,
-0.5802234, -0.3043751, -2.694017, 0.3254902, 1, 0, 1,
-0.5745801, 0.3756842, -0.8689812, 0.3215686, 1, 0, 1,
-0.5745416, 0.8171272, -1.95887, 0.3137255, 1, 0, 1,
-0.5731295, 1.007245, -0.7164376, 0.3098039, 1, 0, 1,
-0.5683521, -1.157902, -2.234567, 0.3019608, 1, 0, 1,
-0.5642378, 0.2755506, 0.1194611, 0.2941177, 1, 0, 1,
-0.5639784, 0.1487945, -2.828, 0.2901961, 1, 0, 1,
-0.5566021, -1.71819, -2.203667, 0.282353, 1, 0, 1,
-0.5417259, -0.1096236, -2.663394, 0.2784314, 1, 0, 1,
-0.5354918, 1.019403, -0.5729942, 0.2705882, 1, 0, 1,
-0.5353869, -0.5526491, -1.342796, 0.2666667, 1, 0, 1,
-0.5353256, -0.1586639, -0.9951729, 0.2588235, 1, 0, 1,
-0.5305384, 0.9528748, 0.2964953, 0.254902, 1, 0, 1,
-0.5301766, 0.3129036, -1.839034, 0.2470588, 1, 0, 1,
-0.5277078, -0.9514686, -1.889895, 0.2431373, 1, 0, 1,
-0.5262946, -0.4457729, -1.226393, 0.2352941, 1, 0, 1,
-0.5228916, -0.4691069, -1.622322, 0.2313726, 1, 0, 1,
-0.5220496, -1.264947, -4.714339, 0.2235294, 1, 0, 1,
-0.521414, 0.1404826, -0.7770483, 0.2196078, 1, 0, 1,
-0.5200904, 0.4014286, -0.3058242, 0.2117647, 1, 0, 1,
-0.5191616, -0.3518651, -2.732684, 0.2078431, 1, 0, 1,
-0.5120794, -0.7270588, -3.234064, 0.2, 1, 0, 1,
-0.5110326, -0.3645141, -3.9768, 0.1921569, 1, 0, 1,
-0.5098384, -0.02362979, -1.758217, 0.1882353, 1, 0, 1,
-0.5094653, -0.02465183, -1.860419, 0.1803922, 1, 0, 1,
-0.5093432, 1.372478, -0.4912806, 0.1764706, 1, 0, 1,
-0.5091546, -1.195361, -1.723793, 0.1686275, 1, 0, 1,
-0.5047392, 2.270781, 0.4205629, 0.1647059, 1, 0, 1,
-0.4991002, -0.8681832, -1.161525, 0.1568628, 1, 0, 1,
-0.4974883, 0.5915943, -0.3666362, 0.1529412, 1, 0, 1,
-0.4963089, 0.1939797, -0.8034268, 0.145098, 1, 0, 1,
-0.4959022, -0.3466505, -1.616664, 0.1411765, 1, 0, 1,
-0.4926138, -1.066329, -3.308176, 0.1333333, 1, 0, 1,
-0.4923763, 2.276129, 0.5314068, 0.1294118, 1, 0, 1,
-0.4913684, 1.712638, -2.301363, 0.1215686, 1, 0, 1,
-0.491124, -0.04928974, -2.406203, 0.1176471, 1, 0, 1,
-0.489469, 0.7282823, -1.572158, 0.1098039, 1, 0, 1,
-0.4879698, 1.531537, 0.5895332, 0.1058824, 1, 0, 1,
-0.4866936, -0.2113319, -0.7685722, 0.09803922, 1, 0, 1,
-0.4817966, 0.6194388, -0.7995775, 0.09019608, 1, 0, 1,
-0.4790558, -0.9610139, -0.9800436, 0.08627451, 1, 0, 1,
-0.4786771, -0.2952409, -1.049658, 0.07843138, 1, 0, 1,
-0.4767919, -2.568164, -0.2396028, 0.07450981, 1, 0, 1,
-0.4731188, 1.880154, -1.746739, 0.06666667, 1, 0, 1,
-0.4723939, 0.1496854, -0.844596, 0.0627451, 1, 0, 1,
-0.4703463, -1.569829, -3.164175, 0.05490196, 1, 0, 1,
-0.4688536, 0.1637129, -0.1973799, 0.05098039, 1, 0, 1,
-0.4654531, 0.01888134, -3.18487, 0.04313726, 1, 0, 1,
-0.4640945, -0.3269931, -1.835059, 0.03921569, 1, 0, 1,
-0.4618114, 0.6846065, -0.774634, 0.03137255, 1, 0, 1,
-0.4438377, 0.8427383, -0.8419758, 0.02745098, 1, 0, 1,
-0.4412422, -0.3830792, -1.180014, 0.01960784, 1, 0, 1,
-0.4409332, 1.678849, -0.2664526, 0.01568628, 1, 0, 1,
-0.431629, 0.9036883, -0.3757423, 0.007843138, 1, 0, 1,
-0.4312938, 2.349654, 2.079628, 0.003921569, 1, 0, 1,
-0.4296711, -0.57689, -1.195841, 0, 1, 0.003921569, 1,
-0.4290922, 1.027555, -0.8232272, 0, 1, 0.01176471, 1,
-0.4264703, 0.2775322, 0.9295256, 0, 1, 0.01568628, 1,
-0.4228872, 1.651248, -0.2362462, 0, 1, 0.02352941, 1,
-0.4184184, 1.275507, -0.2992995, 0, 1, 0.02745098, 1,
-0.4180038, -0.2412182, -1.91116, 0, 1, 0.03529412, 1,
-0.4178067, -1.590081, -2.546671, 0, 1, 0.03921569, 1,
-0.4163663, -0.4794662, -1.852086, 0, 1, 0.04705882, 1,
-0.4153251, -0.6164728, -2.401014, 0, 1, 0.05098039, 1,
-0.4143485, 1.498513, -0.1795537, 0, 1, 0.05882353, 1,
-0.4093704, 1.792869, 0.1664127, 0, 1, 0.0627451, 1,
-0.4091277, -0.4469276, -2.830433, 0, 1, 0.07058824, 1,
-0.4078126, -0.03299334, -2.576258, 0, 1, 0.07450981, 1,
-0.4071083, 0.6677781, -2.506955, 0, 1, 0.08235294, 1,
-0.4060496, -0.3538268, -2.35556, 0, 1, 0.08627451, 1,
-0.4032736, -1.20887, -1.208944, 0, 1, 0.09411765, 1,
-0.4024935, 0.1273754, -1.434455, 0, 1, 0.1019608, 1,
-0.3952334, 0.2809339, -0.9746625, 0, 1, 0.1058824, 1,
-0.3947357, 0.502084, -1.736917, 0, 1, 0.1137255, 1,
-0.3922077, -0.172849, -1.251265, 0, 1, 0.1176471, 1,
-0.3880864, -0.4829512, -3.106635, 0, 1, 0.1254902, 1,
-0.3838028, -0.1364533, -1.921358, 0, 1, 0.1294118, 1,
-0.3829755, 1.435491, -0.183461, 0, 1, 0.1372549, 1,
-0.3828259, -0.3600295, -2.867609, 0, 1, 0.1411765, 1,
-0.3785905, 0.8634116, -1.269949, 0, 1, 0.1490196, 1,
-0.3772204, -0.01556466, -1.836518, 0, 1, 0.1529412, 1,
-0.3747252, 0.9597117, -0.6115035, 0, 1, 0.1607843, 1,
-0.3674252, -1.191878, -2.168869, 0, 1, 0.1647059, 1,
-0.3618543, 0.6765202, -0.4426791, 0, 1, 0.172549, 1,
-0.3558269, 1.491018, -0.6492884, 0, 1, 0.1764706, 1,
-0.3477071, -0.2262537, -1.318289, 0, 1, 0.1843137, 1,
-0.347701, -0.6314737, -3.191852, 0, 1, 0.1882353, 1,
-0.347166, 0.9694064, 0.03864547, 0, 1, 0.1960784, 1,
-0.3444674, 0.286156, -1.418747, 0, 1, 0.2039216, 1,
-0.3437904, 0.8118087, -0.2901154, 0, 1, 0.2078431, 1,
-0.3351671, 1.372443, -0.2769118, 0, 1, 0.2156863, 1,
-0.3349975, 1.00432, -0.4855034, 0, 1, 0.2196078, 1,
-0.3344018, -0.8750978, -2.51281, 0, 1, 0.227451, 1,
-0.3323142, -1.79158, -2.190322, 0, 1, 0.2313726, 1,
-0.32274, -0.6887043, -1.559783, 0, 1, 0.2392157, 1,
-0.321558, 1.324953, -0.5942029, 0, 1, 0.2431373, 1,
-0.3199165, -0.190328, -2.894798, 0, 1, 0.2509804, 1,
-0.3198242, -0.6351809, -1.420901, 0, 1, 0.254902, 1,
-0.3176586, 0.9198291, -1.692049, 0, 1, 0.2627451, 1,
-0.3133463, -0.2439512, -2.576756, 0, 1, 0.2666667, 1,
-0.3128677, 0.752037, -2.778867, 0, 1, 0.2745098, 1,
-0.3109695, -0.3667428, -1.46336, 0, 1, 0.2784314, 1,
-0.3105808, 1.696344, -2.974507, 0, 1, 0.2862745, 1,
-0.3085778, 0.4459854, -1.62741, 0, 1, 0.2901961, 1,
-0.3037532, 0.4646063, -0.9601278, 0, 1, 0.2980392, 1,
-0.3036243, 0.8401687, -0.6002762, 0, 1, 0.3058824, 1,
-0.303441, 0.01418014, -1.292184, 0, 1, 0.3098039, 1,
-0.3028407, -1.183137, -1.023723, 0, 1, 0.3176471, 1,
-0.301985, -0.7684559, -1.398365, 0, 1, 0.3215686, 1,
-0.2969995, -0.3442294, -2.895824, 0, 1, 0.3294118, 1,
-0.2967158, -0.05343632, -4.253356, 0, 1, 0.3333333, 1,
-0.2966408, -0.9540465, -3.445127, 0, 1, 0.3411765, 1,
-0.2922381, 0.4178998, -1.973262, 0, 1, 0.345098, 1,
-0.2859214, -0.0721222, -0.7438416, 0, 1, 0.3529412, 1,
-0.2824076, 0.9336998, -1.214109, 0, 1, 0.3568628, 1,
-0.2801875, -1.285857, -2.876112, 0, 1, 0.3647059, 1,
-0.2791761, -1.294671, -4.497305, 0, 1, 0.3686275, 1,
-0.2751984, 1.329741, -1.478915, 0, 1, 0.3764706, 1,
-0.2730948, 1.71508, -1.033649, 0, 1, 0.3803922, 1,
-0.2722493, -0.6230689, -3.134983, 0, 1, 0.3882353, 1,
-0.2714832, 0.07609754, -2.536903, 0, 1, 0.3921569, 1,
-0.2703672, 0.02483009, -0.8365276, 0, 1, 0.4, 1,
-0.2698101, 0.5835717, -2.781565, 0, 1, 0.4078431, 1,
-0.2638503, 0.5039173, -0.1815353, 0, 1, 0.4117647, 1,
-0.2558496, -0.5367765, -1.798402, 0, 1, 0.4196078, 1,
-0.2517931, 0.1109928, -1.208809, 0, 1, 0.4235294, 1,
-0.2497037, 0.6912853, 1.204668, 0, 1, 0.4313726, 1,
-0.2417552, 1.017448, -0.4662312, 0, 1, 0.4352941, 1,
-0.2386569, 1.490913, -0.2442847, 0, 1, 0.4431373, 1,
-0.2384821, -0.6320508, -3.155181, 0, 1, 0.4470588, 1,
-0.2352354, -1.030844, -3.116643, 0, 1, 0.454902, 1,
-0.2339772, -0.4180928, -1.258725, 0, 1, 0.4588235, 1,
-0.2332272, -0.5973414, -3.960644, 0, 1, 0.4666667, 1,
-0.2311944, 1.241066, 0.07778278, 0, 1, 0.4705882, 1,
-0.2293607, -1.023847, -2.829274, 0, 1, 0.4784314, 1,
-0.229307, -0.3209386, -3.244395, 0, 1, 0.4823529, 1,
-0.2286387, -0.006112684, -1.527984, 0, 1, 0.4901961, 1,
-0.2235401, -0.2420848, -2.789541, 0, 1, 0.4941176, 1,
-0.2229402, -0.4824623, -1.99139, 0, 1, 0.5019608, 1,
-0.2140547, 1.253933, 0.3128212, 0, 1, 0.509804, 1,
-0.2140452, 0.1123832, -1.908475, 0, 1, 0.5137255, 1,
-0.2125702, -1.030641, -4.812891, 0, 1, 0.5215687, 1,
-0.2115616, 0.7104248, -0.9338928, 0, 1, 0.5254902, 1,
-0.2104624, -0.1003661, -2.13184, 0, 1, 0.5333334, 1,
-0.2055514, 0.1026788, -1.052859, 0, 1, 0.5372549, 1,
-0.2016765, 0.1335312, -0.8051873, 0, 1, 0.5450981, 1,
-0.1970342, -0.9220605, -2.66352, 0, 1, 0.5490196, 1,
-0.1921655, 0.03814277, -0.9294559, 0, 1, 0.5568628, 1,
-0.1890412, -1.184603, -2.285895, 0, 1, 0.5607843, 1,
-0.1853096, 1.099524, -1.456251, 0, 1, 0.5686275, 1,
-0.1777181, 0.03824557, 0.04919623, 0, 1, 0.572549, 1,
-0.1754902, -0.4903885, -2.970029, 0, 1, 0.5803922, 1,
-0.1666527, -0.1501997, -2.484367, 0, 1, 0.5843138, 1,
-0.1621768, 0.6348863, 1.690767, 0, 1, 0.5921569, 1,
-0.1600979, 1.313756, -0.8107365, 0, 1, 0.5960785, 1,
-0.157185, 0.9585046, 0.5377272, 0, 1, 0.6039216, 1,
-0.1538219, 0.292861, -0.5765905, 0, 1, 0.6117647, 1,
-0.1535613, -1.250164, -4.279679, 0, 1, 0.6156863, 1,
-0.1481039, 0.03354477, -2.099106, 0, 1, 0.6235294, 1,
-0.1472208, 0.6687508, -0.524479, 0, 1, 0.627451, 1,
-0.1449422, -1.249949, -3.30447, 0, 1, 0.6352941, 1,
-0.1408547, 0.1723854, -2.544647, 0, 1, 0.6392157, 1,
-0.1396217, -0.6610934, -1.476545, 0, 1, 0.6470588, 1,
-0.1394198, 2.478834, 0.5924787, 0, 1, 0.6509804, 1,
-0.1388714, 0.9864973, -0.06886197, 0, 1, 0.6588235, 1,
-0.1353761, 1.6604, -0.6283456, 0, 1, 0.6627451, 1,
-0.1346399, -0.4186926, -2.164385, 0, 1, 0.6705883, 1,
-0.1345698, -0.4250094, -3.440557, 0, 1, 0.6745098, 1,
-0.1335852, -0.4211144, -3.181496, 0, 1, 0.682353, 1,
-0.1302985, 1.403372, 0.7317415, 0, 1, 0.6862745, 1,
-0.1261386, 0.8918021, -1.852303, 0, 1, 0.6941177, 1,
-0.1255392, 0.2727982, 0.7504796, 0, 1, 0.7019608, 1,
-0.122452, -1.701259, -1.821437, 0, 1, 0.7058824, 1,
-0.1193527, 1.192417, -0.299715, 0, 1, 0.7137255, 1,
-0.1185585, -0.777491, -1.8333, 0, 1, 0.7176471, 1,
-0.1178128, 0.2282646, 0.0002092623, 0, 1, 0.7254902, 1,
-0.1172026, -0.4696628, -2.240309, 0, 1, 0.7294118, 1,
-0.1105759, -1.20569, -3.943533, 0, 1, 0.7372549, 1,
-0.1062066, 0.5454211, -0.674556, 0, 1, 0.7411765, 1,
-0.1040515, -0.5573686, -2.696805, 0, 1, 0.7490196, 1,
-0.1025731, 0.7351696, -1.429775, 0, 1, 0.7529412, 1,
-0.09922316, 1.385012, -0.3033941, 0, 1, 0.7607843, 1,
-0.09401951, 0.5835199, -0.5924838, 0, 1, 0.7647059, 1,
-0.09281933, -1.751501, -2.538215, 0, 1, 0.772549, 1,
-0.09280103, 0.6575267, -1.249946, 0, 1, 0.7764706, 1,
-0.08797235, 1.252872, -1.151544, 0, 1, 0.7843137, 1,
-0.08397275, -0.3331974, -3.531061, 0, 1, 0.7882353, 1,
-0.08297853, -0.4611831, -1.15839, 0, 1, 0.7960784, 1,
-0.08092664, -0.08325455, 0.1439074, 0, 1, 0.8039216, 1,
-0.07726893, 0.2806841, -1.196696, 0, 1, 0.8078431, 1,
-0.07599431, 0.09943034, -0.9962651, 0, 1, 0.8156863, 1,
-0.07395551, 0.7850882, 0.2689777, 0, 1, 0.8196079, 1,
-0.07298977, 0.1387089, -0.2087454, 0, 1, 0.827451, 1,
-0.07174525, 1.089489, 0.1750644, 0, 1, 0.8313726, 1,
-0.07078163, -0.3863267, -1.365974, 0, 1, 0.8392157, 1,
-0.07073332, -0.3802686, -2.931817, 0, 1, 0.8431373, 1,
-0.06947939, 1.607179, 1.257828, 0, 1, 0.8509804, 1,
-0.0680214, 1.066396, -1.195757, 0, 1, 0.854902, 1,
-0.06693011, -1.900887, -0.7715768, 0, 1, 0.8627451, 1,
-0.06524342, -1.629598, -3.213564, 0, 1, 0.8666667, 1,
-0.06343159, -0.1623346, -2.06742, 0, 1, 0.8745098, 1,
-0.06044635, 1.15961, -0.2779907, 0, 1, 0.8784314, 1,
-0.05865976, -0.6773417, -3.532576, 0, 1, 0.8862745, 1,
-0.05456396, -0.4695521, -2.487784, 0, 1, 0.8901961, 1,
-0.05054171, -0.8854383, -5.087979, 0, 1, 0.8980392, 1,
-0.04954713, -0.35489, -4.403569, 0, 1, 0.9058824, 1,
-0.04580629, -0.003731881, -0.6433297, 0, 1, 0.9098039, 1,
-0.04478276, -0.1259986, -4.113586, 0, 1, 0.9176471, 1,
-0.03866854, -0.6250247, -0.8996525, 0, 1, 0.9215686, 1,
-0.03482371, 0.4194779, -1.664744, 0, 1, 0.9294118, 1,
-0.03434234, 0.4981556, 0.8762023, 0, 1, 0.9333333, 1,
-0.03094101, -1.473287, -2.19999, 0, 1, 0.9411765, 1,
-0.02580523, 0.1012696, 0.2967402, 0, 1, 0.945098, 1,
-0.02554715, 1.98513, -0.07357256, 0, 1, 0.9529412, 1,
-0.02154481, 1.858237, -0.245116, 0, 1, 0.9568627, 1,
-0.0182513, 0.3070158, 1.091686, 0, 1, 0.9647059, 1,
-0.01491033, -1.284766, -3.361891, 0, 1, 0.9686275, 1,
-0.01018724, -1.262129, -3.2814, 0, 1, 0.9764706, 1,
-0.007656464, -0.7788045, -4.115483, 0, 1, 0.9803922, 1,
-0.00283744, -2.50111, -3.768928, 0, 1, 0.9882353, 1,
-0.001630096, -0.3490459, -4.552447, 0, 1, 0.9921569, 1,
-2.765834e-05, 0.6118399, 1.431486, 0, 1, 1, 1,
2.318524e-05, 0.5873559, 0.3271571, 0, 0.9921569, 1, 1,
0.004776007, 0.3814011, 0.06938247, 0, 0.9882353, 1, 1,
0.005964255, -1.110872, 3.941932, 0, 0.9803922, 1, 1,
0.01235929, -1.313546, 3.736664, 0, 0.9764706, 1, 1,
0.0125207, -0.3620969, 2.599056, 0, 0.9686275, 1, 1,
0.0137425, 0.760312, -0.3596463, 0, 0.9647059, 1, 1,
0.01388994, 0.7014324, 1.881041, 0, 0.9568627, 1, 1,
0.01489663, -1.449904, 4.210495, 0, 0.9529412, 1, 1,
0.02555432, -0.1685027, 3.296629, 0, 0.945098, 1, 1,
0.02606279, 0.3212288, 0.2099532, 0, 0.9411765, 1, 1,
0.02649308, 0.03580251, 1.093837, 0, 0.9333333, 1, 1,
0.02653188, -0.4346928, 3.28348, 0, 0.9294118, 1, 1,
0.02778455, -0.9342929, 4.708704, 0, 0.9215686, 1, 1,
0.02843442, 0.2133668, -0.6226673, 0, 0.9176471, 1, 1,
0.02909064, -0.7761751, 2.826649, 0, 0.9098039, 1, 1,
0.03338869, -0.1485354, 2.953402, 0, 0.9058824, 1, 1,
0.0352316, 0.1139014, 1.788858, 0, 0.8980392, 1, 1,
0.03602466, 1.072246, -1.255223, 0, 0.8901961, 1, 1,
0.0410549, -0.2341121, 3.12589, 0, 0.8862745, 1, 1,
0.04658591, 0.1845867, 0.7881236, 0, 0.8784314, 1, 1,
0.04672534, -0.3127069, 2.81365, 0, 0.8745098, 1, 1,
0.04771555, -1.587985, 1.400784, 0, 0.8666667, 1, 1,
0.05006698, -0.7750183, 2.480338, 0, 0.8627451, 1, 1,
0.05062689, 0.362791, 0.3258913, 0, 0.854902, 1, 1,
0.05404604, -0.7028417, 2.84585, 0, 0.8509804, 1, 1,
0.06371382, 0.7271861, -1.282142, 0, 0.8431373, 1, 1,
0.0656312, -1.100567, 2.496746, 0, 0.8392157, 1, 1,
0.06605876, 1.050922, 0.9563153, 0, 0.8313726, 1, 1,
0.06708804, 0.6203641, 1.828467, 0, 0.827451, 1, 1,
0.06758274, 0.1182925, 1.545699, 0, 0.8196079, 1, 1,
0.07020494, -1.660458, 3.499986, 0, 0.8156863, 1, 1,
0.07206296, 1.245749, -0.5571396, 0, 0.8078431, 1, 1,
0.07350559, 0.945945, 1.231355, 0, 0.8039216, 1, 1,
0.07545421, -1.891094, 1.724414, 0, 0.7960784, 1, 1,
0.07589935, -0.3524758, 4.36116, 0, 0.7882353, 1, 1,
0.07782677, 0.1251332, 1.670912, 0, 0.7843137, 1, 1,
0.08022201, 1.352464, 0.411573, 0, 0.7764706, 1, 1,
0.08050818, 0.07549623, 0.7919407, 0, 0.772549, 1, 1,
0.08262473, -0.422936, 4.307428, 0, 0.7647059, 1, 1,
0.08924759, 0.4022204, 0.9735837, 0, 0.7607843, 1, 1,
0.08934311, -0.3772613, 2.147649, 0, 0.7529412, 1, 1,
0.0920547, -0.3199104, 3.008313, 0, 0.7490196, 1, 1,
0.09323496, -0.107359, 3.391314, 0, 0.7411765, 1, 1,
0.09354872, 0.2765272, 1.050463, 0, 0.7372549, 1, 1,
0.09397944, 1.220454, -0.9037132, 0, 0.7294118, 1, 1,
0.09402494, 2.661206, -2.020179, 0, 0.7254902, 1, 1,
0.09612732, 1.885686, -1.226867, 0, 0.7176471, 1, 1,
0.09724634, 0.09161101, 1.325819, 0, 0.7137255, 1, 1,
0.1004325, -0.2330764, 2.733556, 0, 0.7058824, 1, 1,
0.1035782, 1.38822, 1.259009, 0, 0.6980392, 1, 1,
0.1055175, 0.6254511, 0.0114043, 0, 0.6941177, 1, 1,
0.1056284, -1.005118, 1.587576, 0, 0.6862745, 1, 1,
0.1059644, 0.5137151, -0.135315, 0, 0.682353, 1, 1,
0.1063558, 1.564335, 1.057752, 0, 0.6745098, 1, 1,
0.1074323, -0.3391463, 3.487481, 0, 0.6705883, 1, 1,
0.1089028, 1.38535, -0.3307597, 0, 0.6627451, 1, 1,
0.1089114, -1.353474, 2.762233, 0, 0.6588235, 1, 1,
0.1181999, -0.3499406, 1.643339, 0, 0.6509804, 1, 1,
0.1204927, 0.9943169, 0.07535829, 0, 0.6470588, 1, 1,
0.1222081, 0.9525121, -0.7618375, 0, 0.6392157, 1, 1,
0.1229823, 0.2482508, 0.8447382, 0, 0.6352941, 1, 1,
0.1242167, 0.9913695, -0.2276906, 0, 0.627451, 1, 1,
0.1247698, 0.7923821, 1.024011, 0, 0.6235294, 1, 1,
0.128727, -0.529422, 2.066105, 0, 0.6156863, 1, 1,
0.1367711, 0.971024, -0.4677794, 0, 0.6117647, 1, 1,
0.1383735, -0.08247145, 3.962699, 0, 0.6039216, 1, 1,
0.1442962, 1.315323, -1.219693, 0, 0.5960785, 1, 1,
0.147145, 1.239583, -0.711257, 0, 0.5921569, 1, 1,
0.1519789, 0.5143709, -0.6064744, 0, 0.5843138, 1, 1,
0.1530065, 0.6525156, -0.9074569, 0, 0.5803922, 1, 1,
0.1598295, 0.1616578, 2.175217, 0, 0.572549, 1, 1,
0.1635118, 0.9916871, 1.049384, 0, 0.5686275, 1, 1,
0.164525, 0.7324702, -0.7263151, 0, 0.5607843, 1, 1,
0.164719, 1.473581, -2.197413, 0, 0.5568628, 1, 1,
0.1687126, 0.8658812, -0.6990656, 0, 0.5490196, 1, 1,
0.1689021, 1.745769, 0.4777509, 0, 0.5450981, 1, 1,
0.1690984, -0.9002504, 4.042454, 0, 0.5372549, 1, 1,
0.1767647, 1.173049, 1.745144, 0, 0.5333334, 1, 1,
0.1787885, -0.8342118, 3.018077, 0, 0.5254902, 1, 1,
0.1871069, -0.3189115, 1.31678, 0, 0.5215687, 1, 1,
0.1900211, -0.5581287, 1.083222, 0, 0.5137255, 1, 1,
0.1912713, 0.1084552, 0.7950425, 0, 0.509804, 1, 1,
0.1913482, 0.2888216, 0.4052022, 0, 0.5019608, 1, 1,
0.1914091, -0.6931984, 2.937099, 0, 0.4941176, 1, 1,
0.1921737, 1.016647, 0.1120189, 0, 0.4901961, 1, 1,
0.1932018, 2.169567, -0.1127388, 0, 0.4823529, 1, 1,
0.1935465, 0.4759021, -0.1916625, 0, 0.4784314, 1, 1,
0.1946238, -0.1877407, 3.205434, 0, 0.4705882, 1, 1,
0.1993886, 1.029798, 0.1068856, 0, 0.4666667, 1, 1,
0.2088384, 2.759663, -1.057743, 0, 0.4588235, 1, 1,
0.2108789, 1.3459, 0.02441073, 0, 0.454902, 1, 1,
0.2122051, 0.4129702, 1.266724, 0, 0.4470588, 1, 1,
0.2135083, 0.9729253, -1.816066, 0, 0.4431373, 1, 1,
0.2144945, -0.009327308, 2.332738, 0, 0.4352941, 1, 1,
0.2165349, 0.3019067, 1.191561, 0, 0.4313726, 1, 1,
0.2238634, 0.6129293, 1.000505, 0, 0.4235294, 1, 1,
0.2241275, -1.196025, 3.055896, 0, 0.4196078, 1, 1,
0.2243427, 0.5800468, -0.6222436, 0, 0.4117647, 1, 1,
0.2282978, -1.260962, 4.614072, 0, 0.4078431, 1, 1,
0.2284954, 0.1007993, 2.126075, 0, 0.4, 1, 1,
0.2292178, 0.07149297, 2.411834, 0, 0.3921569, 1, 1,
0.2297223, 0.9891557, 0.4011213, 0, 0.3882353, 1, 1,
0.2300703, 1.126492, 1.862074, 0, 0.3803922, 1, 1,
0.2320091, 1.849085, 0.5256103, 0, 0.3764706, 1, 1,
0.2368862, 0.2815514, 0.5328399, 0, 0.3686275, 1, 1,
0.238706, -0.8947005, 1.894362, 0, 0.3647059, 1, 1,
0.23885, 0.388716, -0.2629318, 0, 0.3568628, 1, 1,
0.2405261, 0.7426726, 0.5885704, 0, 0.3529412, 1, 1,
0.2410413, -1.589185, 3.542293, 0, 0.345098, 1, 1,
0.2422908, -0.687036, 0.9934714, 0, 0.3411765, 1, 1,
0.2429458, -0.3646727, 3.995167, 0, 0.3333333, 1, 1,
0.2457489, -0.6381835, 4.398193, 0, 0.3294118, 1, 1,
0.2486112, -0.2976501, 2.00033, 0, 0.3215686, 1, 1,
0.2511903, -0.06345282, 2.903326, 0, 0.3176471, 1, 1,
0.2522421, -0.4557668, 4.779009, 0, 0.3098039, 1, 1,
0.2542157, 0.3234722, 2.207663, 0, 0.3058824, 1, 1,
0.2581113, 0.6988113, 0.1519229, 0, 0.2980392, 1, 1,
0.2585274, -1.709208, 3.29559, 0, 0.2901961, 1, 1,
0.2610891, 0.9584722, -0.6510463, 0, 0.2862745, 1, 1,
0.2635305, -2.157672, 2.998103, 0, 0.2784314, 1, 1,
0.2751955, 0.8026912, -0.6916379, 0, 0.2745098, 1, 1,
0.2785525, 0.3754421, 0.3844029, 0, 0.2666667, 1, 1,
0.2837614, 1.201205, 0.7931269, 0, 0.2627451, 1, 1,
0.2843262, -0.1731861, 1.335672, 0, 0.254902, 1, 1,
0.2869833, 0.03665811, 0.6947041, 0, 0.2509804, 1, 1,
0.2882869, -0.1652945, 1.955755, 0, 0.2431373, 1, 1,
0.2898307, 1.515226, -0.7396977, 0, 0.2392157, 1, 1,
0.2938674, -1.062283, 3.111231, 0, 0.2313726, 1, 1,
0.2941023, -1.055806, 4.48466, 0, 0.227451, 1, 1,
0.2998979, 0.9841645, 1.437196, 0, 0.2196078, 1, 1,
0.3015864, 0.4286535, -0.1062339, 0, 0.2156863, 1, 1,
0.3052844, -0.4974163, 3.101893, 0, 0.2078431, 1, 1,
0.3073307, -0.722877, 1.44942, 0, 0.2039216, 1, 1,
0.3074619, -1.613715, 5.135635, 0, 0.1960784, 1, 1,
0.309237, -0.8028845, 2.786142, 0, 0.1882353, 1, 1,
0.3126641, -0.3485687, 3.493725, 0, 0.1843137, 1, 1,
0.3129206, 0.08066086, -0.2980085, 0, 0.1764706, 1, 1,
0.3165969, 0.3999156, -1.133884, 0, 0.172549, 1, 1,
0.3252542, -1.013694, 3.387066, 0, 0.1647059, 1, 1,
0.3258779, 1.187329, 1.8063, 0, 0.1607843, 1, 1,
0.3314608, 0.8721362, -0.2472237, 0, 0.1529412, 1, 1,
0.3328816, -0.8599042, 3.137538, 0, 0.1490196, 1, 1,
0.3333902, -1.061005, 3.730309, 0, 0.1411765, 1, 1,
0.333631, 0.08031414, 2.938103, 0, 0.1372549, 1, 1,
0.3383797, 0.4046354, 1.929039, 0, 0.1294118, 1, 1,
0.3390053, 2.181609, -0.188179, 0, 0.1254902, 1, 1,
0.3465725, 0.8877219, 1.289226, 0, 0.1176471, 1, 1,
0.3504386, 1.120685, -0.6788636, 0, 0.1137255, 1, 1,
0.3526974, -0.4696462, 3.063475, 0, 0.1058824, 1, 1,
0.3543186, -0.2975371, 3.372848, 0, 0.09803922, 1, 1,
0.3551852, -0.7789978, 1.995583, 0, 0.09411765, 1, 1,
0.3572241, -1.356753, 1.839918, 0, 0.08627451, 1, 1,
0.3671562, -2.014073, 3.48526, 0, 0.08235294, 1, 1,
0.3676174, 0.8580264, 0.1302471, 0, 0.07450981, 1, 1,
0.3688408, -1.389867, 2.615918, 0, 0.07058824, 1, 1,
0.3695094, -0.09249302, 2.064866, 0, 0.0627451, 1, 1,
0.3716533, -0.4368686, 1.694823, 0, 0.05882353, 1, 1,
0.3725739, 0.6727367, -2.255293, 0, 0.05098039, 1, 1,
0.3760219, 1.75087, 0.9279673, 0, 0.04705882, 1, 1,
0.3764027, -1.461777, 3.866466, 0, 0.03921569, 1, 1,
0.3772663, -0.06368557, 0.1332654, 0, 0.03529412, 1, 1,
0.381404, 0.2292953, 2.779101, 0, 0.02745098, 1, 1,
0.3831146, -0.04335957, 1.307448, 0, 0.02352941, 1, 1,
0.3856389, 0.09406971, 0.399136, 0, 0.01568628, 1, 1,
0.3863502, 0.2623011, 0.2105651, 0, 0.01176471, 1, 1,
0.3891465, -1.960626, 2.824648, 0, 0.003921569, 1, 1,
0.3900163, -0.07650159, 0.9336544, 0.003921569, 0, 1, 1,
0.3927945, 0.2490951, 1.000396, 0.007843138, 0, 1, 1,
0.3931375, 1.95558, -0.5928404, 0.01568628, 0, 1, 1,
0.3938147, 0.6117851, -0.2046598, 0.01960784, 0, 1, 1,
0.3963399, -0.5699624, 3.698787, 0.02745098, 0, 1, 1,
0.3965298, 0.2433917, 1.623663, 0.03137255, 0, 1, 1,
0.3983349, -0.7939917, 3.542382, 0.03921569, 0, 1, 1,
0.3992354, 0.1693647, 2.270538, 0.04313726, 0, 1, 1,
0.4033168, -0.3176463, 0.7800325, 0.05098039, 0, 1, 1,
0.409268, -1.792454, 4.007616, 0.05490196, 0, 1, 1,
0.4109946, 0.7419556, 2.050872, 0.0627451, 0, 1, 1,
0.4149233, 1.529655, 0.5510142, 0.06666667, 0, 1, 1,
0.4201937, 0.3926119, 1.445947, 0.07450981, 0, 1, 1,
0.4217033, 0.4506387, 1.253697, 0.07843138, 0, 1, 1,
0.4255878, 0.7117234, -0.9602701, 0.08627451, 0, 1, 1,
0.429722, -0.9014639, 4.188931, 0.09019608, 0, 1, 1,
0.4307186, 0.107528, 1.364658, 0.09803922, 0, 1, 1,
0.4381003, 0.9342676, 0.633639, 0.1058824, 0, 1, 1,
0.4382031, 1.178922, 0.5985656, 0.1098039, 0, 1, 1,
0.4425546, -0.1248219, 0.8612685, 0.1176471, 0, 1, 1,
0.4519702, 0.5549992, 0.5489671, 0.1215686, 0, 1, 1,
0.4545729, 0.01411091, 1.277432, 0.1294118, 0, 1, 1,
0.4601828, -0.6353611, 4.131784, 0.1333333, 0, 1, 1,
0.4601991, 0.106853, 2.463655, 0.1411765, 0, 1, 1,
0.4616953, 0.930459, -0.4360281, 0.145098, 0, 1, 1,
0.4639595, 0.1345783, 1.193503, 0.1529412, 0, 1, 1,
0.470085, 0.09379458, 1.561565, 0.1568628, 0, 1, 1,
0.4724155, 1.087686, 1.612006, 0.1647059, 0, 1, 1,
0.4735177, -0.476894, 2.595248, 0.1686275, 0, 1, 1,
0.4777529, -0.8470556, 2.11, 0.1764706, 0, 1, 1,
0.4780606, 1.33537, 0.1381221, 0.1803922, 0, 1, 1,
0.480182, -0.8066042, 3.039996, 0.1882353, 0, 1, 1,
0.4843477, 0.9310349, -0.7132854, 0.1921569, 0, 1, 1,
0.4994375, 0.9888552, 1.256158, 0.2, 0, 1, 1,
0.5010424, -0.400954, 3.38265, 0.2078431, 0, 1, 1,
0.5100275, 1.146281, 0.4224471, 0.2117647, 0, 1, 1,
0.5116847, -0.01448517, 1.181151, 0.2196078, 0, 1, 1,
0.5130629, 0.04674121, 0.5545508, 0.2235294, 0, 1, 1,
0.5140104, -1.265203, 4.076977, 0.2313726, 0, 1, 1,
0.5150999, 0.7249073, 0.5318918, 0.2352941, 0, 1, 1,
0.5152727, -0.9579481, 3.175031, 0.2431373, 0, 1, 1,
0.5192882, -0.8427386, 3.100216, 0.2470588, 0, 1, 1,
0.5206391, -1.840882, 2.66902, 0.254902, 0, 1, 1,
0.5219061, 1.058053, 1.509523, 0.2588235, 0, 1, 1,
0.5255782, -1.36477, 4.531044, 0.2666667, 0, 1, 1,
0.5295377, 0.8023596, 0.3776427, 0.2705882, 0, 1, 1,
0.534238, -1.747835, 3.256874, 0.2784314, 0, 1, 1,
0.5359811, -0.7350037, 2.540305, 0.282353, 0, 1, 1,
0.5409536, -0.7108085, 2.38366, 0.2901961, 0, 1, 1,
0.5435286, 0.5901309, 0.9261013, 0.2941177, 0, 1, 1,
0.5435837, -0.2636645, 0.8354761, 0.3019608, 0, 1, 1,
0.5491657, -1.125407, 3.369399, 0.3098039, 0, 1, 1,
0.5549305, -1.187781, 3.350695, 0.3137255, 0, 1, 1,
0.5558233, -0.4048821, 0.8244284, 0.3215686, 0, 1, 1,
0.5563669, 1.176049, 0.5106402, 0.3254902, 0, 1, 1,
0.5569257, 1.996791, 0.1705977, 0.3333333, 0, 1, 1,
0.5589156, 0.6940637, -1.64005, 0.3372549, 0, 1, 1,
0.5640505, 0.8735769, -0.9066655, 0.345098, 0, 1, 1,
0.5740919, 1.299532, -0.9114202, 0.3490196, 0, 1, 1,
0.5795779, 0.1831223, 1.685061, 0.3568628, 0, 1, 1,
0.5807887, 0.01206993, 0.4930222, 0.3607843, 0, 1, 1,
0.5820789, 0.4898874, -0.5691677, 0.3686275, 0, 1, 1,
0.5854939, 0.2441576, 1.663001, 0.372549, 0, 1, 1,
0.5861954, 1.812272, 1.00241, 0.3803922, 0, 1, 1,
0.5871698, 0.6160931, 2.055789, 0.3843137, 0, 1, 1,
0.5884354, 1.937828, 0.2014049, 0.3921569, 0, 1, 1,
0.5886356, -0.454257, 1.766247, 0.3960784, 0, 1, 1,
0.589285, -0.2799684, 3.316059, 0.4039216, 0, 1, 1,
0.5928203, -0.1781594, 1.475078, 0.4117647, 0, 1, 1,
0.5936869, 0.8430781, 1.086902, 0.4156863, 0, 1, 1,
0.594156, -1.392915, 3.033129, 0.4235294, 0, 1, 1,
0.5969293, 1.070322, -0.3715624, 0.427451, 0, 1, 1,
0.5992112, 0.8727797, 1.276383, 0.4352941, 0, 1, 1,
0.5992203, 0.3064573, 0.08350767, 0.4392157, 0, 1, 1,
0.6034352, -1.300983, 3.243373, 0.4470588, 0, 1, 1,
0.6039584, -0.05392352, 1.823343, 0.4509804, 0, 1, 1,
0.6044136, 0.7880359, -2.738303, 0.4588235, 0, 1, 1,
0.6047075, 0.4908441, 1.59304, 0.4627451, 0, 1, 1,
0.6084194, -0.9546304, 3.845394, 0.4705882, 0, 1, 1,
0.6132925, -1.045194, 3.783211, 0.4745098, 0, 1, 1,
0.6141328, -1.767908, 2.412392, 0.4823529, 0, 1, 1,
0.621005, 0.4964207, 2.336363, 0.4862745, 0, 1, 1,
0.622368, -0.02091531, 0.569478, 0.4941176, 0, 1, 1,
0.623042, 0.1189791, 2.607413, 0.5019608, 0, 1, 1,
0.6263231, 1.041219, -0.6640728, 0.5058824, 0, 1, 1,
0.6292573, 0.1394756, 2.003587, 0.5137255, 0, 1, 1,
0.6311736, 1.295252, -0.5009637, 0.5176471, 0, 1, 1,
0.6325073, -0.4931319, 1.776778, 0.5254902, 0, 1, 1,
0.6364783, 1.152516, 0.9353321, 0.5294118, 0, 1, 1,
0.6380672, 0.9975293, 1.283702, 0.5372549, 0, 1, 1,
0.6402193, 0.4738846, 2.29284, 0.5411765, 0, 1, 1,
0.6411596, -2.379872, 2.638895, 0.5490196, 0, 1, 1,
0.6481077, -0.7384789, 3.506533, 0.5529412, 0, 1, 1,
0.6491622, -0.8744094, 2.71208, 0.5607843, 0, 1, 1,
0.6561618, -1.971927, 2.860214, 0.5647059, 0, 1, 1,
0.6569889, 0.2677748, 1.419655, 0.572549, 0, 1, 1,
0.6601021, 0.08269224, 1.267903, 0.5764706, 0, 1, 1,
0.6628292, 2.244589, 0.5546621, 0.5843138, 0, 1, 1,
0.6654442, -0.05074206, 2.466268, 0.5882353, 0, 1, 1,
0.6708311, 0.6349585, 1.34312, 0.5960785, 0, 1, 1,
0.6754707, -0.1300069, 1.977051, 0.6039216, 0, 1, 1,
0.6770403, -1.257111, 4.507464, 0.6078432, 0, 1, 1,
0.6806825, 0.4442325, 0.03172567, 0.6156863, 0, 1, 1,
0.6856345, 1.061412, -0.3949732, 0.6196079, 0, 1, 1,
0.6861771, 0.3417529, 1.163299, 0.627451, 0, 1, 1,
0.6876263, -0.931984, 3.860036, 0.6313726, 0, 1, 1,
0.6939098, 0.3700277, 2.178294, 0.6392157, 0, 1, 1,
0.697233, -0.3361226, 0.28799, 0.6431373, 0, 1, 1,
0.6975892, 1.236072, -0.2003826, 0.6509804, 0, 1, 1,
0.6999111, -1.775838, 3.72784, 0.654902, 0, 1, 1,
0.7008196, 0.269558, 0.6574962, 0.6627451, 0, 1, 1,
0.7052673, 0.3816971, 0.9773508, 0.6666667, 0, 1, 1,
0.7073717, 0.668364, 0.3071172, 0.6745098, 0, 1, 1,
0.7121079, -1.596823, 2.268691, 0.6784314, 0, 1, 1,
0.7128801, -2.018935, 2.431892, 0.6862745, 0, 1, 1,
0.7170896, 0.3829457, 0.8412091, 0.6901961, 0, 1, 1,
0.7210733, 0.4331833, 0.0572055, 0.6980392, 0, 1, 1,
0.7232628, 0.3257969, 2.247214, 0.7058824, 0, 1, 1,
0.7270815, 0.3386681, 0.6274841, 0.7098039, 0, 1, 1,
0.7279545, -0.3195046, 2.926852, 0.7176471, 0, 1, 1,
0.7334916, -0.4282837, 2.480743, 0.7215686, 0, 1, 1,
0.7343426, 0.4491324, 0.4328103, 0.7294118, 0, 1, 1,
0.7353799, -0.002505407, 1.821457, 0.7333333, 0, 1, 1,
0.7371532, 0.1159733, 1.329265, 0.7411765, 0, 1, 1,
0.7386941, -0.8537259, 3.126585, 0.7450981, 0, 1, 1,
0.7401217, 0.01649685, 2.924181, 0.7529412, 0, 1, 1,
0.7444524, 0.6516325, 0.07926346, 0.7568628, 0, 1, 1,
0.7554701, 1.140375, 1.113157, 0.7647059, 0, 1, 1,
0.7562292, 1.722924, 1.433721, 0.7686275, 0, 1, 1,
0.7599172, 0.3781877, -0.4887014, 0.7764706, 0, 1, 1,
0.7608348, 1.194732, -0.07329778, 0.7803922, 0, 1, 1,
0.773232, 0.1796007, 1.294427, 0.7882353, 0, 1, 1,
0.7762322, -1.245071, 2.160994, 0.7921569, 0, 1, 1,
0.7782629, -0.4818164, 1.695535, 0.8, 0, 1, 1,
0.7812304, 2.522619, 0.1920627, 0.8078431, 0, 1, 1,
0.7829612, -1.13315, 0.586164, 0.8117647, 0, 1, 1,
0.7852844, -0.6109653, 1.40142, 0.8196079, 0, 1, 1,
0.7878295, -1.326548, 3.064184, 0.8235294, 0, 1, 1,
0.7880462, 0.08520715, 2.889858, 0.8313726, 0, 1, 1,
0.7896637, 0.9750798, -1.296532, 0.8352941, 0, 1, 1,
0.7929507, -1.888836, 5.061716, 0.8431373, 0, 1, 1,
0.7958362, 0.2511186, 1.924332, 0.8470588, 0, 1, 1,
0.7966162, 1.813136, -0.134359, 0.854902, 0, 1, 1,
0.8055702, -0.3391742, 2.399268, 0.8588235, 0, 1, 1,
0.8184253, -1.327921, 2.850521, 0.8666667, 0, 1, 1,
0.8194883, 1.118429, 0.8291676, 0.8705882, 0, 1, 1,
0.8210333, 0.399665, 0.7482154, 0.8784314, 0, 1, 1,
0.8274627, -0.7199142, 1.701547, 0.8823529, 0, 1, 1,
0.8349041, 0.90863, 3.039606, 0.8901961, 0, 1, 1,
0.8390135, 0.08535483, 3.773896, 0.8941177, 0, 1, 1,
0.8418424, 0.01058062, 1.095666, 0.9019608, 0, 1, 1,
0.8445191, -0.2677545, 1.131126, 0.9098039, 0, 1, 1,
0.8468478, 0.5464807, 0.5277247, 0.9137255, 0, 1, 1,
0.8527197, 0.06132931, 3.542775, 0.9215686, 0, 1, 1,
0.8534318, -0.09023171, 3.550231, 0.9254902, 0, 1, 1,
0.8598893, -0.3424781, 2.149036, 0.9333333, 0, 1, 1,
0.8603902, -0.8868837, 3.322263, 0.9372549, 0, 1, 1,
0.8617159, -0.2549471, 1.791157, 0.945098, 0, 1, 1,
0.8630037, -0.1421343, 3.715063, 0.9490196, 0, 1, 1,
0.8669622, -1.145636, 1.579627, 0.9568627, 0, 1, 1,
0.8716105, 0.03134964, 1.24265, 0.9607843, 0, 1, 1,
0.8837075, 0.9253467, 1.542908, 0.9686275, 0, 1, 1,
0.8863024, 0.7428696, 0.8683822, 0.972549, 0, 1, 1,
0.8887069, -0.2177382, 2.442141, 0.9803922, 0, 1, 1,
0.8906999, 1.477262, 1.34802, 0.9843137, 0, 1, 1,
0.8961943, 1.235872, -0.2025002, 0.9921569, 0, 1, 1,
0.8963051, -0.07162642, 1.435424, 0.9960784, 0, 1, 1,
0.9011804, -1.210869, 3.444034, 1, 0, 0.9960784, 1,
0.9020837, -0.5104287, 1.651505, 1, 0, 0.9882353, 1,
0.9047652, 0.9420198, 0.07471227, 1, 0, 0.9843137, 1,
0.9104612, 0.232747, 1.670096, 1, 0, 0.9764706, 1,
0.91313, 0.7188634, 0.2810965, 1, 0, 0.972549, 1,
0.9310893, 0.545424, 2.222773, 1, 0, 0.9647059, 1,
0.9315171, -1.399451, 1.971244, 1, 0, 0.9607843, 1,
0.9370044, 1.451114, -0.06089255, 1, 0, 0.9529412, 1,
0.9376536, -1.086111, 1.515581, 1, 0, 0.9490196, 1,
0.9408678, -0.2054465, 1.943094, 1, 0, 0.9411765, 1,
0.9458416, 0.1358629, 1.475185, 1, 0, 0.9372549, 1,
0.960775, 1.356518, 1.195711, 1, 0, 0.9294118, 1,
0.9611491, 0.6349022, 0.2729417, 1, 0, 0.9254902, 1,
0.9657022, -1.190931, 3.81563, 1, 0, 0.9176471, 1,
0.9674585, -0.3181659, 1.526205, 1, 0, 0.9137255, 1,
0.9756931, -1.373725, 2.039292, 1, 0, 0.9058824, 1,
0.9801289, 1.072785, -1.10334, 1, 0, 0.9019608, 1,
0.9856575, -0.901435, 1.290199, 1, 0, 0.8941177, 1,
0.9888262, 0.2838186, 1.262749, 1, 0, 0.8862745, 1,
0.9964199, -1.548463, 3.481136, 1, 0, 0.8823529, 1,
0.9977471, -0.4933831, 2.71105, 1, 0, 0.8745098, 1,
0.9992293, 0.4387661, 2.232905, 1, 0, 0.8705882, 1,
1.002526, 0.2255192, -0.480603, 1, 0, 0.8627451, 1,
1.00402, -0.01191575, 0.1820623, 1, 0, 0.8588235, 1,
1.005571, 1.347067, -0.5877391, 1, 0, 0.8509804, 1,
1.005632, -0.06337067, 1.315546, 1, 0, 0.8470588, 1,
1.009486, 1.279235, 0.3197647, 1, 0, 0.8392157, 1,
1.011326, -0.006492868, 2.887201, 1, 0, 0.8352941, 1,
1.016899, -0.04140849, 0.9890301, 1, 0, 0.827451, 1,
1.029094, 0.3849608, 1.932826, 1, 0, 0.8235294, 1,
1.035295, 0.8182722, 0.7336883, 1, 0, 0.8156863, 1,
1.038546, -1.450712, 1.336026, 1, 0, 0.8117647, 1,
1.052705, -0.685889, 1.753197, 1, 0, 0.8039216, 1,
1.059994, 0.5764045, 1.355825, 1, 0, 0.7960784, 1,
1.063548, 1.699503, 0.9599351, 1, 0, 0.7921569, 1,
1.068843, -1.355635, 2.958935, 1, 0, 0.7843137, 1,
1.074316, -0.2462937, 2.529265, 1, 0, 0.7803922, 1,
1.076817, -0.5419782, 3.29228, 1, 0, 0.772549, 1,
1.083856, -0.1370297, 0.2562753, 1, 0, 0.7686275, 1,
1.086489, 1.561543, 2.431588, 1, 0, 0.7607843, 1,
1.086497, -0.4300377, 2.571891, 1, 0, 0.7568628, 1,
1.092218, 2.457619, 1.277623, 1, 0, 0.7490196, 1,
1.098475, 0.39706, 2.315444, 1, 0, 0.7450981, 1,
1.104249, 1.131832, 1.377537, 1, 0, 0.7372549, 1,
1.129416, -0.4556134, 0.5105176, 1, 0, 0.7333333, 1,
1.135752, -1.016717, 1.713362, 1, 0, 0.7254902, 1,
1.144892, -0.8209674, 2.577076, 1, 0, 0.7215686, 1,
1.149069, 0.3367771, 2.34237, 1, 0, 0.7137255, 1,
1.163011, -0.5692142, 2.173422, 1, 0, 0.7098039, 1,
1.163662, -0.07245009, 0.5655292, 1, 0, 0.7019608, 1,
1.166333, -1.983509, 0.6699139, 1, 0, 0.6941177, 1,
1.179001, -0.8082757, 3.175634, 1, 0, 0.6901961, 1,
1.183064, 0.6064394, 2.496054, 1, 0, 0.682353, 1,
1.191589, -0.664555, 3.992048, 1, 0, 0.6784314, 1,
1.207453, 0.7444043, 1.182676, 1, 0, 0.6705883, 1,
1.210238, 0.2116109, 1.381063, 1, 0, 0.6666667, 1,
1.214054, 1.208429, -1.617048, 1, 0, 0.6588235, 1,
1.214357, 0.7762641, 0.5643963, 1, 0, 0.654902, 1,
1.214434, 0.9862272, 2.077966, 1, 0, 0.6470588, 1,
1.227701, 0.09497232, 1.864959, 1, 0, 0.6431373, 1,
1.23249, 0.473062, 1.960588, 1, 0, 0.6352941, 1,
1.234146, -0.7168421, 1.620909, 1, 0, 0.6313726, 1,
1.241885, -0.3297349, 0.247185, 1, 0, 0.6235294, 1,
1.246365, -0.0510895, 1.957108, 1, 0, 0.6196079, 1,
1.252135, 0.3727717, 2.648002, 1, 0, 0.6117647, 1,
1.252481, 0.3984831, 1.176405, 1, 0, 0.6078432, 1,
1.253887, 0.8900488, 0.8162054, 1, 0, 0.6, 1,
1.260651, -0.1805151, 2.660371, 1, 0, 0.5921569, 1,
1.269701, -0.1446349, 1.166036, 1, 0, 0.5882353, 1,
1.271435, 1.898762, -0.6640484, 1, 0, 0.5803922, 1,
1.276412, 1.552639, -1.054701, 1, 0, 0.5764706, 1,
1.282564, -0.1234356, 0.9517603, 1, 0, 0.5686275, 1,
1.283064, -0.1218942, 1.753647, 1, 0, 0.5647059, 1,
1.315363, 0.2080029, 3.298767, 1, 0, 0.5568628, 1,
1.31731, 0.5359197, 0.5284716, 1, 0, 0.5529412, 1,
1.319419, -0.1278439, 2.10705, 1, 0, 0.5450981, 1,
1.3228, -1.224603, 0.5526846, 1, 0, 0.5411765, 1,
1.323867, -0.5420855, 0.1240604, 1, 0, 0.5333334, 1,
1.332456, -0.6732672, 2.157789, 1, 0, 0.5294118, 1,
1.335501, 0.7500061, 1.615756, 1, 0, 0.5215687, 1,
1.344789, 0.4620999, 2.276503, 1, 0, 0.5176471, 1,
1.345936, -0.7292796, 0.3140394, 1, 0, 0.509804, 1,
1.350032, -0.369472, -0.06096993, 1, 0, 0.5058824, 1,
1.35351, -0.3224513, 0.4028243, 1, 0, 0.4980392, 1,
1.364418, 1.143204, 0.2595362, 1, 0, 0.4901961, 1,
1.364663, 1.106229, 0.8298247, 1, 0, 0.4862745, 1,
1.369766, -0.811457, 2.526565, 1, 0, 0.4784314, 1,
1.38038, 1.540782, 0.9371411, 1, 0, 0.4745098, 1,
1.384276, 0.7949691, 0.114247, 1, 0, 0.4666667, 1,
1.386852, 0.9013078, 1.228721, 1, 0, 0.4627451, 1,
1.392598, -0.474581, 2.642404, 1, 0, 0.454902, 1,
1.405087, 1.020103, 0.171913, 1, 0, 0.4509804, 1,
1.421665, 0.8913723, 1.986992, 1, 0, 0.4431373, 1,
1.433267, 0.02576288, 0.9523326, 1, 0, 0.4392157, 1,
1.473505, 2.17861, -0.1439641, 1, 0, 0.4313726, 1,
1.474858, -0.447395, -0.07364526, 1, 0, 0.427451, 1,
1.479555, -0.4920546, 1.621665, 1, 0, 0.4196078, 1,
1.482944, -0.08463836, 1.189933, 1, 0, 0.4156863, 1,
1.492171, 0.6767043, 1.762974, 1, 0, 0.4078431, 1,
1.508351, 0.1934521, 1.132836, 1, 0, 0.4039216, 1,
1.508867, -1.202311, 1.452721, 1, 0, 0.3960784, 1,
1.513157, 2.276171, 0.8823648, 1, 0, 0.3882353, 1,
1.518973, 0.3304618, 1.593151, 1, 0, 0.3843137, 1,
1.524706, -1.880917, 0.722292, 1, 0, 0.3764706, 1,
1.548361, -0.3892113, 1.567095, 1, 0, 0.372549, 1,
1.555566, 0.6340449, 2.630479, 1, 0, 0.3647059, 1,
1.562021, -0.3256538, -0.7414805, 1, 0, 0.3607843, 1,
1.567079, -0.06143802, 2.436184, 1, 0, 0.3529412, 1,
1.567581, 1.093851, 1.420249, 1, 0, 0.3490196, 1,
1.592625, -0.4236542, 1.844066, 1, 0, 0.3411765, 1,
1.597781, -0.2284282, 2.068524, 1, 0, 0.3372549, 1,
1.62044, -0.6424404, 2.164974, 1, 0, 0.3294118, 1,
1.641232, -0.606631, 0.1183348, 1, 0, 0.3254902, 1,
1.651091, -1.538674, 2.535756, 1, 0, 0.3176471, 1,
1.657432, 1.929899, 0.02820062, 1, 0, 0.3137255, 1,
1.669421, 1.558233, -0.5393388, 1, 0, 0.3058824, 1,
1.670406, 0.2917838, 3.391603, 1, 0, 0.2980392, 1,
1.691689, 0.8469864, 1.479485, 1, 0, 0.2941177, 1,
1.720762, 1.358156, 0.1140692, 1, 0, 0.2862745, 1,
1.721464, 0.8083762, 1.494637, 1, 0, 0.282353, 1,
1.735358, 1.163305, 0.9510951, 1, 0, 0.2745098, 1,
1.744687, 1.123249, 0.347222, 1, 0, 0.2705882, 1,
1.825476, -0.2257974, 3.017871, 1, 0, 0.2627451, 1,
1.831903, -0.8577604, 0.9032181, 1, 0, 0.2588235, 1,
1.831993, -1.650259, 1.886607, 1, 0, 0.2509804, 1,
1.846475, -0.04388205, 1.898857, 1, 0, 0.2470588, 1,
1.846812, -0.6477173, 2.478498, 1, 0, 0.2392157, 1,
1.856383, 0.8643975, -0.03708838, 1, 0, 0.2352941, 1,
1.857499, 0.184803, 0.06017545, 1, 0, 0.227451, 1,
1.874832, 0.9125101, 0.9310929, 1, 0, 0.2235294, 1,
1.887188, -0.4332893, 1.136013, 1, 0, 0.2156863, 1,
1.910603, -0.2978481, 1.757986, 1, 0, 0.2117647, 1,
1.938901, 1.315934, -1.059073, 1, 0, 0.2039216, 1,
1.941473, -1.972403, 1.750112, 1, 0, 0.1960784, 1,
1.949172, -0.2823417, 1.186053, 1, 0, 0.1921569, 1,
1.966071, -0.2423109, 2.441156, 1, 0, 0.1843137, 1,
1.995455, -0.5640424, 1.435773, 1, 0, 0.1803922, 1,
1.997872, 0.6824746, 4.375254, 1, 0, 0.172549, 1,
2.029109, -0.9744622, 1.940105, 1, 0, 0.1686275, 1,
2.040098, -1.390865, 1.987597, 1, 0, 0.1607843, 1,
2.094826, 1.624417, 0.4479376, 1, 0, 0.1568628, 1,
2.109939, 0.9152742, 0.690039, 1, 0, 0.1490196, 1,
2.114403, 0.57001, 3.403467, 1, 0, 0.145098, 1,
2.169464, 0.4298473, 0.363872, 1, 0, 0.1372549, 1,
2.189027, 0.005384925, -0.01669497, 1, 0, 0.1333333, 1,
2.201335, 0.551556, 2.458961, 1, 0, 0.1254902, 1,
2.206797, -0.2139471, 1.613935, 1, 0, 0.1215686, 1,
2.220348, -0.1481308, 1.827538, 1, 0, 0.1137255, 1,
2.251997, 0.8321298, 0.1022188, 1, 0, 0.1098039, 1,
2.284041, -0.1391839, 1.584726, 1, 0, 0.1019608, 1,
2.287939, -1.744022, 4.221203, 1, 0, 0.09411765, 1,
2.310028, -0.1693667, 2.251956, 1, 0, 0.09019608, 1,
2.337699, 0.3474481, 0.5433527, 1, 0, 0.08235294, 1,
2.364628, -0.3796546, 0.7601062, 1, 0, 0.07843138, 1,
2.554199, -0.4809706, 3.55418, 1, 0, 0.07058824, 1,
2.608842, -0.09847589, 2.349123, 1, 0, 0.06666667, 1,
2.610367, 0.3757946, 2.003524, 1, 0, 0.05882353, 1,
2.613598, 1.830926, 1.012568, 1, 0, 0.05490196, 1,
2.70945, -0.4928305, 2.026012, 1, 0, 0.04705882, 1,
2.745849, 0.7839075, -0.02010753, 1, 0, 0.04313726, 1,
2.755905, 1.614101, 0.2226228, 1, 0, 0.03529412, 1,
2.784853, -2.430602, 3.741585, 1, 0, 0.03137255, 1,
2.81421, -0.9206601, 1.270139, 1, 0, 0.02352941, 1,
2.925028, 0.453557, 1.254528, 1, 0, 0.01960784, 1,
2.930447, 1.936345, 0.7296095, 1, 0, 0.01176471, 1,
3.073932, -0.03061901, 2.313378, 1, 0, 0.007843138, 1
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
-0.2183408, -4.537736, -6.820881, 0, -0.5, 0.5, 0.5,
-0.2183408, -4.537736, -6.820881, 1, -0.5, 0.5, 0.5,
-0.2183408, -4.537736, -6.820881, 1, 1.5, 0.5, 0.5,
-0.2183408, -4.537736, -6.820881, 0, 1.5, 0.5, 0.5
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
-4.626694, -0.360217, -6.820881, 0, -0.5, 0.5, 0.5,
-4.626694, -0.360217, -6.820881, 1, -0.5, 0.5, 0.5,
-4.626694, -0.360217, -6.820881, 1, 1.5, 0.5, 0.5,
-4.626694, -0.360217, -6.820881, 0, 1.5, 0.5, 0.5
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
-4.626694, -4.537736, 0.02382827, 0, -0.5, 0.5, 0.5,
-4.626694, -4.537736, 0.02382827, 1, -0.5, 0.5, 0.5,
-4.626694, -4.537736, 0.02382827, 1, 1.5, 0.5, 0.5,
-4.626694, -4.537736, 0.02382827, 0, 1.5, 0.5, 0.5
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
-3, -3.573694, -5.241333,
3, -3.573694, -5.241333,
-3, -3.573694, -5.241333,
-3, -3.734367, -5.504591,
-2, -3.573694, -5.241333,
-2, -3.734367, -5.504591,
-1, -3.573694, -5.241333,
-1, -3.734367, -5.504591,
0, -3.573694, -5.241333,
0, -3.734367, -5.504591,
1, -3.573694, -5.241333,
1, -3.734367, -5.504591,
2, -3.573694, -5.241333,
2, -3.734367, -5.504591,
3, -3.573694, -5.241333,
3, -3.734367, -5.504591
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
-3, -4.055715, -6.031107, 0, -0.5, 0.5, 0.5,
-3, -4.055715, -6.031107, 1, -0.5, 0.5, 0.5,
-3, -4.055715, -6.031107, 1, 1.5, 0.5, 0.5,
-3, -4.055715, -6.031107, 0, 1.5, 0.5, 0.5,
-2, -4.055715, -6.031107, 0, -0.5, 0.5, 0.5,
-2, -4.055715, -6.031107, 1, -0.5, 0.5, 0.5,
-2, -4.055715, -6.031107, 1, 1.5, 0.5, 0.5,
-2, -4.055715, -6.031107, 0, 1.5, 0.5, 0.5,
-1, -4.055715, -6.031107, 0, -0.5, 0.5, 0.5,
-1, -4.055715, -6.031107, 1, -0.5, 0.5, 0.5,
-1, -4.055715, -6.031107, 1, 1.5, 0.5, 0.5,
-1, -4.055715, -6.031107, 0, 1.5, 0.5, 0.5,
0, -4.055715, -6.031107, 0, -0.5, 0.5, 0.5,
0, -4.055715, -6.031107, 1, -0.5, 0.5, 0.5,
0, -4.055715, -6.031107, 1, 1.5, 0.5, 0.5,
0, -4.055715, -6.031107, 0, 1.5, 0.5, 0.5,
1, -4.055715, -6.031107, 0, -0.5, 0.5, 0.5,
1, -4.055715, -6.031107, 1, -0.5, 0.5, 0.5,
1, -4.055715, -6.031107, 1, 1.5, 0.5, 0.5,
1, -4.055715, -6.031107, 0, 1.5, 0.5, 0.5,
2, -4.055715, -6.031107, 0, -0.5, 0.5, 0.5,
2, -4.055715, -6.031107, 1, -0.5, 0.5, 0.5,
2, -4.055715, -6.031107, 1, 1.5, 0.5, 0.5,
2, -4.055715, -6.031107, 0, 1.5, 0.5, 0.5,
3, -4.055715, -6.031107, 0, -0.5, 0.5, 0.5,
3, -4.055715, -6.031107, 1, -0.5, 0.5, 0.5,
3, -4.055715, -6.031107, 1, 1.5, 0.5, 0.5,
3, -4.055715, -6.031107, 0, 1.5, 0.5, 0.5
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
-3.609382, -3, -5.241333,
-3.609382, 2, -5.241333,
-3.609382, -3, -5.241333,
-3.778934, -3, -5.504591,
-3.609382, -2, -5.241333,
-3.778934, -2, -5.504591,
-3.609382, -1, -5.241333,
-3.778934, -1, -5.504591,
-3.609382, 0, -5.241333,
-3.778934, 0, -5.504591,
-3.609382, 1, -5.241333,
-3.778934, 1, -5.504591,
-3.609382, 2, -5.241333,
-3.778934, 2, -5.504591
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
-4.118038, -3, -6.031107, 0, -0.5, 0.5, 0.5,
-4.118038, -3, -6.031107, 1, -0.5, 0.5, 0.5,
-4.118038, -3, -6.031107, 1, 1.5, 0.5, 0.5,
-4.118038, -3, -6.031107, 0, 1.5, 0.5, 0.5,
-4.118038, -2, -6.031107, 0, -0.5, 0.5, 0.5,
-4.118038, -2, -6.031107, 1, -0.5, 0.5, 0.5,
-4.118038, -2, -6.031107, 1, 1.5, 0.5, 0.5,
-4.118038, -2, -6.031107, 0, 1.5, 0.5, 0.5,
-4.118038, -1, -6.031107, 0, -0.5, 0.5, 0.5,
-4.118038, -1, -6.031107, 1, -0.5, 0.5, 0.5,
-4.118038, -1, -6.031107, 1, 1.5, 0.5, 0.5,
-4.118038, -1, -6.031107, 0, 1.5, 0.5, 0.5,
-4.118038, 0, -6.031107, 0, -0.5, 0.5, 0.5,
-4.118038, 0, -6.031107, 1, -0.5, 0.5, 0.5,
-4.118038, 0, -6.031107, 1, 1.5, 0.5, 0.5,
-4.118038, 0, -6.031107, 0, 1.5, 0.5, 0.5,
-4.118038, 1, -6.031107, 0, -0.5, 0.5, 0.5,
-4.118038, 1, -6.031107, 1, -0.5, 0.5, 0.5,
-4.118038, 1, -6.031107, 1, 1.5, 0.5, 0.5,
-4.118038, 1, -6.031107, 0, 1.5, 0.5, 0.5,
-4.118038, 2, -6.031107, 0, -0.5, 0.5, 0.5,
-4.118038, 2, -6.031107, 1, -0.5, 0.5, 0.5,
-4.118038, 2, -6.031107, 1, 1.5, 0.5, 0.5,
-4.118038, 2, -6.031107, 0, 1.5, 0.5, 0.5
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
-3.609382, -3.573694, -4,
-3.609382, -3.573694, 4,
-3.609382, -3.573694, -4,
-3.778934, -3.734367, -4,
-3.609382, -3.573694, -2,
-3.778934, -3.734367, -2,
-3.609382, -3.573694, 0,
-3.778934, -3.734367, 0,
-3.609382, -3.573694, 2,
-3.778934, -3.734367, 2,
-3.609382, -3.573694, 4,
-3.778934, -3.734367, 4
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
-4.118038, -4.055715, -4, 0, -0.5, 0.5, 0.5,
-4.118038, -4.055715, -4, 1, -0.5, 0.5, 0.5,
-4.118038, -4.055715, -4, 1, 1.5, 0.5, 0.5,
-4.118038, -4.055715, -4, 0, 1.5, 0.5, 0.5,
-4.118038, -4.055715, -2, 0, -0.5, 0.5, 0.5,
-4.118038, -4.055715, -2, 1, -0.5, 0.5, 0.5,
-4.118038, -4.055715, -2, 1, 1.5, 0.5, 0.5,
-4.118038, -4.055715, -2, 0, 1.5, 0.5, 0.5,
-4.118038, -4.055715, 0, 0, -0.5, 0.5, 0.5,
-4.118038, -4.055715, 0, 1, -0.5, 0.5, 0.5,
-4.118038, -4.055715, 0, 1, 1.5, 0.5, 0.5,
-4.118038, -4.055715, 0, 0, 1.5, 0.5, 0.5,
-4.118038, -4.055715, 2, 0, -0.5, 0.5, 0.5,
-4.118038, -4.055715, 2, 1, -0.5, 0.5, 0.5,
-4.118038, -4.055715, 2, 1, 1.5, 0.5, 0.5,
-4.118038, -4.055715, 2, 0, 1.5, 0.5, 0.5,
-4.118038, -4.055715, 4, 0, -0.5, 0.5, 0.5,
-4.118038, -4.055715, 4, 1, -0.5, 0.5, 0.5,
-4.118038, -4.055715, 4, 1, 1.5, 0.5, 0.5,
-4.118038, -4.055715, 4, 0, 1.5, 0.5, 0.5
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
-3.609382, -3.573694, -5.241333,
-3.609382, 2.85326, -5.241333,
-3.609382, -3.573694, 5.28899,
-3.609382, 2.85326, 5.28899,
-3.609382, -3.573694, -5.241333,
-3.609382, -3.573694, 5.28899,
-3.609382, 2.85326, -5.241333,
-3.609382, 2.85326, 5.28899,
-3.609382, -3.573694, -5.241333,
3.1727, -3.573694, -5.241333,
-3.609382, -3.573694, 5.28899,
3.1727, -3.573694, 5.28899,
-3.609382, 2.85326, -5.241333,
3.1727, 2.85326, -5.241333,
-3.609382, 2.85326, 5.28899,
3.1727, 2.85326, 5.28899,
3.1727, -3.573694, -5.241333,
3.1727, 2.85326, -5.241333,
3.1727, -3.573694, 5.28899,
3.1727, 2.85326, 5.28899,
3.1727, -3.573694, -5.241333,
3.1727, -3.573694, 5.28899,
3.1727, 2.85326, -5.241333,
3.1727, 2.85326, 5.28899
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
var radius = 7.517378;
var distance = 33.44566;
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
mvMatrix.translate( 0.2183408, 0.360217, -0.02382827 );
mvMatrix.scale( 1.198443, 1.264664, 0.7718602 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.44566);
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
selfotel<-read.table("selfotel.xyz")
```

```
## Error in read.table("selfotel.xyz"): no lines available in input
```

```r
x<-selfotel$V2
```

```
## Error in eval(expr, envir, enclos): object 'selfotel' not found
```

```r
y<-selfotel$V3
```

```
## Error in eval(expr, envir, enclos): object 'selfotel' not found
```

```r
z<-selfotel$V4
```

```
## Error in eval(expr, envir, enclos): object 'selfotel' not found
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
-3.510614, -1.132184, -3.608205, 0, 0, 1, 1, 1,
-3.372547, 0.8222008, -1.405509, 1, 0, 0, 1, 1,
-3.189668, -0.8055679, -0.6474968, 1, 0, 0, 1, 1,
-3.005831, 1.120444, -1.53325, 1, 0, 0, 1, 1,
-2.808847, -0.06261699, -1.202926, 1, 0, 0, 1, 1,
-2.7897, 1.442714, -0.8867297, 1, 0, 0, 1, 1,
-2.59603, -0.08050795, -2.486529, 0, 0, 0, 1, 1,
-2.585404, -0.4897913, -1.79367, 0, 0, 0, 1, 1,
-2.570748, 0.41535, -0.7554256, 0, 0, 0, 1, 1,
-2.568887, 0.639809, -2.156571, 0, 0, 0, 1, 1,
-2.514302, -0.1061956, 0.4105202, 0, 0, 0, 1, 1,
-2.513777, -0.2576269, -1.709491, 0, 0, 0, 1, 1,
-2.443058, 0.6765411, -1.885368, 0, 0, 0, 1, 1,
-2.433783, 1.742677, -1.018555, 1, 1, 1, 1, 1,
-2.429813, 0.1198682, -1.658224, 1, 1, 1, 1, 1,
-2.421096, 0.8390905, -1.011748, 1, 1, 1, 1, 1,
-2.368296, -0.4119171, -0.02039327, 1, 1, 1, 1, 1,
-2.270797, 0.1737931, 1.053474, 1, 1, 1, 1, 1,
-2.197441, 1.493657, -1.90863, 1, 1, 1, 1, 1,
-2.170905, -0.0005148995, -2.03252, 1, 1, 1, 1, 1,
-2.124351, -0.7355946, -3.452089, 1, 1, 1, 1, 1,
-2.116333, -0.155529, -1.909875, 1, 1, 1, 1, 1,
-2.070388, -1.636462, -2.929663, 1, 1, 1, 1, 1,
-1.95649, -0.9467892, -3.943527, 1, 1, 1, 1, 1,
-1.94364, 0.6103836, -1.677039, 1, 1, 1, 1, 1,
-1.922239, -0.08032156, -2.553631, 1, 1, 1, 1, 1,
-1.918041, 0.3770587, -2.178252, 1, 1, 1, 1, 1,
-1.917888, 0.9427319, -1.147497, 1, 1, 1, 1, 1,
-1.902785, 0.8544793, -1.260577, 0, 0, 1, 1, 1,
-1.897153, -0.7395346, -2.820044, 1, 0, 0, 1, 1,
-1.882938, 0.05030133, -1.131056, 1, 0, 0, 1, 1,
-1.862127, 0.7508591, -1.364052, 1, 0, 0, 1, 1,
-1.84161, 1.999545, -2.182652, 1, 0, 0, 1, 1,
-1.840693, 1.828613, 0.1440692, 1, 0, 0, 1, 1,
-1.816918, -0.4252602, -2.146585, 0, 0, 0, 1, 1,
-1.782257, 0.5931576, 0.5378799, 0, 0, 0, 1, 1,
-1.779188, 0.8255035, -2.403857, 0, 0, 0, 1, 1,
-1.774914, -0.02899428, 0.4465883, 0, 0, 0, 1, 1,
-1.766992, 1.964329, -0.6014478, 0, 0, 0, 1, 1,
-1.753693, -0.02553506, -1.810393, 0, 0, 0, 1, 1,
-1.713404, -0.2775937, -2.224473, 0, 0, 0, 1, 1,
-1.704032, -1.393241, -1.725889, 1, 1, 1, 1, 1,
-1.703691, -0.2188538, -3.09396, 1, 1, 1, 1, 1,
-1.703057, -0.1819631, -0.3623009, 1, 1, 1, 1, 1,
-1.667165, -0.5083528, -2.287824, 1, 1, 1, 1, 1,
-1.622023, 0.08097806, -1.562967, 1, 1, 1, 1, 1,
-1.589393, -0.7588817, -2.316491, 1, 1, 1, 1, 1,
-1.583756, -0.0106135, -1.455258, 1, 1, 1, 1, 1,
-1.556414, 0.2065522, 0.1017794, 1, 1, 1, 1, 1,
-1.50953, 1.478597, -3.061646, 1, 1, 1, 1, 1,
-1.505591, -0.7295059, -1.16199, 1, 1, 1, 1, 1,
-1.492503, -1.822164, -2.468466, 1, 1, 1, 1, 1,
-1.48592, 1.890644, -0.325131, 1, 1, 1, 1, 1,
-1.48552, -0.7999552, -2.859906, 1, 1, 1, 1, 1,
-1.481181, -0.4686967, -0.7019308, 1, 1, 1, 1, 1,
-1.468943, -0.03550599, -2.522898, 1, 1, 1, 1, 1,
-1.456269, -0.9949113, -1.640107, 0, 0, 1, 1, 1,
-1.455092, -0.2053525, -2.395955, 1, 0, 0, 1, 1,
-1.453583, -2.339643, -2.765182, 1, 0, 0, 1, 1,
-1.432518, 0.9564841, -0.723741, 1, 0, 0, 1, 1,
-1.429121, 0.5307826, -1.764364, 1, 0, 0, 1, 1,
-1.42351, -0.4301821, 1.853216, 1, 0, 0, 1, 1,
-1.42302, 0.7103977, -0.01617843, 0, 0, 0, 1, 1,
-1.422082, -0.8398373, -1.656368, 0, 0, 0, 1, 1,
-1.406856, 1.088099, -0.433381, 0, 0, 0, 1, 1,
-1.403389, 0.2788181, -0.6975109, 0, 0, 0, 1, 1,
-1.4019, -0.7615041, -2.247113, 0, 0, 0, 1, 1,
-1.39529, -0.02632433, -2.137806, 0, 0, 0, 1, 1,
-1.387215, -0.8691584, -1.389563, 0, 0, 0, 1, 1,
-1.374784, -0.6553422, -0.2465885, 1, 1, 1, 1, 1,
-1.36662, -0.3385176, -4.055338, 1, 1, 1, 1, 1,
-1.360237, -0.6191789, -3.300325, 1, 1, 1, 1, 1,
-1.35603, 0.1978078, -2.102093, 1, 1, 1, 1, 1,
-1.35511, 0.3583134, -0.4806581, 1, 1, 1, 1, 1,
-1.347115, -0.740725, -0.5652631, 1, 1, 1, 1, 1,
-1.342162, 0.5405712, -1.964346, 1, 1, 1, 1, 1,
-1.339203, -1.386513, -2.38966, 1, 1, 1, 1, 1,
-1.331511, 0.2769971, -2.275095, 1, 1, 1, 1, 1,
-1.327615, 0.126908, -0.1448899, 1, 1, 1, 1, 1,
-1.310652, 1.496733, -0.7005233, 1, 1, 1, 1, 1,
-1.3042, 1.998254, -0.2269948, 1, 1, 1, 1, 1,
-1.303985, 1.69321, -0.079318, 1, 1, 1, 1, 1,
-1.303716, -0.5830299, -0.9979174, 1, 1, 1, 1, 1,
-1.288094, -2.021862, -3.09565, 1, 1, 1, 1, 1,
-1.280266, -0.3989609, -3.19661, 0, 0, 1, 1, 1,
-1.257019, -0.6176839, -1.465488, 1, 0, 0, 1, 1,
-1.25697, 0.3527324, 0.2233768, 1, 0, 0, 1, 1,
-1.254565, 0.1755466, -1.389031, 1, 0, 0, 1, 1,
-1.24644, 1.906404, -0.9514768, 1, 0, 0, 1, 1,
-1.240074, 0.1949351, -0.2384818, 1, 0, 0, 1, 1,
-1.236368, -1.058121, -2.4173, 0, 0, 0, 1, 1,
-1.235498, 0.9301499, -1.593285, 0, 0, 0, 1, 1,
-1.232401, 0.2973742, -1.367391, 0, 0, 0, 1, 1,
-1.230919, 0.5249168, -1.316037, 0, 0, 0, 1, 1,
-1.228183, 0.2294732, -0.6341425, 0, 0, 0, 1, 1,
-1.22382, 0.542918, -1.265214, 0, 0, 0, 1, 1,
-1.222965, 0.8572781, -2.298035, 0, 0, 0, 1, 1,
-1.219399, -0.438415, -0.4314424, 1, 1, 1, 1, 1,
-1.214998, -0.9532534, -3.468386, 1, 1, 1, 1, 1,
-1.211777, 2.235348, -1.628277, 1, 1, 1, 1, 1,
-1.198831, -1.120583, -1.617367, 1, 1, 1, 1, 1,
-1.1986, -0.4927167, -0.7902929, 1, 1, 1, 1, 1,
-1.194953, 0.1192045, -1.735476, 1, 1, 1, 1, 1,
-1.193467, 2.42402, -0.06198075, 1, 1, 1, 1, 1,
-1.189087, 0.2159255, -0.0867774, 1, 1, 1, 1, 1,
-1.171262, 1.25223, 0.7029679, 1, 1, 1, 1, 1,
-1.165926, -0.3849252, -2.370937, 1, 1, 1, 1, 1,
-1.150247, 0.842896, -2.79928, 1, 1, 1, 1, 1,
-1.136485, 0.4180829, -2.623397, 1, 1, 1, 1, 1,
-1.13349, -0.6476367, -1.786619, 1, 1, 1, 1, 1,
-1.133267, -2.069011, -2.822705, 1, 1, 1, 1, 1,
-1.132295, -0.4212545, -0.2917842, 1, 1, 1, 1, 1,
-1.124191, 1.058824, -0.4936773, 0, 0, 1, 1, 1,
-1.116675, 1.440873, -2.261264, 1, 0, 0, 1, 1,
-1.10928, 1.221803, -2.376023, 1, 0, 0, 1, 1,
-1.107014, 0.7068282, 0.9684702, 1, 0, 0, 1, 1,
-1.097693, 0.8670028, -1.595389, 1, 0, 0, 1, 1,
-1.09276, 0.7801187, -1.235357, 1, 0, 0, 1, 1,
-1.092682, -0.6314671, -1.623787, 0, 0, 0, 1, 1,
-1.079473, -0.02634643, -0.3722124, 0, 0, 0, 1, 1,
-1.074405, 0.7332423, -0.7044301, 0, 0, 0, 1, 1,
-1.062245, -1.317214, -1.260473, 0, 0, 0, 1, 1,
-1.062171, 0.8933918, 1.038552, 0, 0, 0, 1, 1,
-1.055252, -0.9750714, -1.61832, 0, 0, 0, 1, 1,
-1.051613, -0.02178514, -3.024532, 0, 0, 0, 1, 1,
-1.047064, -0.431541, -2.056747, 1, 1, 1, 1, 1,
-1.044276, 0.3084561, -2.853968, 1, 1, 1, 1, 1,
-1.041432, -1.48596, -2.033872, 1, 1, 1, 1, 1,
-1.039192, -0.2767052, 0.3951514, 1, 1, 1, 1, 1,
-1.034409, 0.05845155, 0.3282969, 1, 1, 1, 1, 1,
-1.027933, 1.175453, -0.4952744, 1, 1, 1, 1, 1,
-1.02063, -0.9784586, -3.711615, 1, 1, 1, 1, 1,
-1.015358, -0.8850209, -1.293928, 1, 1, 1, 1, 1,
-1.012626, 0.1465147, -2.588032, 1, 1, 1, 1, 1,
-1.012279, 0.2834415, -1.359639, 1, 1, 1, 1, 1,
-0.995385, 0.7017988, 0.2473124, 1, 1, 1, 1, 1,
-0.9933679, -0.1557273, -1.237929, 1, 1, 1, 1, 1,
-0.9929276, -0.8643471, -1.11082, 1, 1, 1, 1, 1,
-0.9849163, -0.2825341, -0.1750496, 1, 1, 1, 1, 1,
-0.9821372, 1.846114, -2.61831, 1, 1, 1, 1, 1,
-0.9780715, -0.3167336, -2.600267, 0, 0, 1, 1, 1,
-0.9706473, -0.5455344, -2.725329, 1, 0, 0, 1, 1,
-0.9697098, 1.80807, -0.7913951, 1, 0, 0, 1, 1,
-0.9694081, -0.569638, -2.341533, 1, 0, 0, 1, 1,
-0.9654891, -0.235674, -2.170898, 1, 0, 0, 1, 1,
-0.9619992, 1.017363, -1.140054, 1, 0, 0, 1, 1,
-0.9572618, 0.8714089, -2.725611, 0, 0, 0, 1, 1,
-0.9567175, 0.7336091, 0.01434417, 0, 0, 0, 1, 1,
-0.954543, -0.5694727, -1.870285, 0, 0, 0, 1, 1,
-0.954291, 0.1893179, -2.360456, 0, 0, 0, 1, 1,
-0.9529907, 1.097006, -0.8424091, 0, 0, 0, 1, 1,
-0.9411777, -1.290744, -2.389081, 0, 0, 0, 1, 1,
-0.940919, 0.7446285, -1.129724, 0, 0, 0, 1, 1,
-0.9407687, -0.9594639, -4.069204, 1, 1, 1, 1, 1,
-0.9370592, -1.343495, -3.229467, 1, 1, 1, 1, 1,
-0.9368964, 0.1547784, -2.396068, 1, 1, 1, 1, 1,
-0.9237064, -0.3879086, -2.287478, 1, 1, 1, 1, 1,
-0.923678, -0.7274437, -1.367675, 1, 1, 1, 1, 1,
-0.9214069, -0.9628932, -2.61922, 1, 1, 1, 1, 1,
-0.9200559, -0.08700128, -1.82988, 1, 1, 1, 1, 1,
-0.9193236, -0.481301, -0.7590344, 1, 1, 1, 1, 1,
-0.9153922, 0.6702756, -2.7248, 1, 1, 1, 1, 1,
-0.9114876, -0.1712637, -3.055331, 1, 1, 1, 1, 1,
-0.9110997, 0.4938422, 0.01236257, 1, 1, 1, 1, 1,
-0.9037895, -0.0861957, -2.217839, 1, 1, 1, 1, 1,
-0.9033939, -0.3314028, 0.5414534, 1, 1, 1, 1, 1,
-0.9027945, -0.1401882, -1.470316, 1, 1, 1, 1, 1,
-0.8987705, 0.01492822, -1.686593, 1, 1, 1, 1, 1,
-0.8966059, 0.4196402, -0.3813769, 0, 0, 1, 1, 1,
-0.893214, -0.1496194, -0.5616852, 1, 0, 0, 1, 1,
-0.8925328, -0.4216918, -1.932645, 1, 0, 0, 1, 1,
-0.8865387, -0.3435138, -1.188229, 1, 0, 0, 1, 1,
-0.8861751, 0.6323076, 0.4950642, 1, 0, 0, 1, 1,
-0.8798286, -0.985009, -0.6639524, 1, 0, 0, 1, 1,
-0.872922, 0.2354338, -1.967278, 0, 0, 0, 1, 1,
-0.8704256, 1.12759, 1.71316, 0, 0, 0, 1, 1,
-0.8631446, 1.016962, 0.4500753, 0, 0, 0, 1, 1,
-0.8593521, 1.486948, -0.07807266, 0, 0, 0, 1, 1,
-0.8557939, 0.0225831, -0.1738134, 0, 0, 0, 1, 1,
-0.854646, -0.9080374, -2.37629, 0, 0, 0, 1, 1,
-0.8520948, 1.055923, 0.8781685, 0, 0, 0, 1, 1,
-0.8461222, -0.41463, -1.546493, 1, 1, 1, 1, 1,
-0.8421571, 1.069739, 1.479079, 1, 1, 1, 1, 1,
-0.8409591, -1.504072, -1.307222, 1, 1, 1, 1, 1,
-0.8370854, 0.2110979, -0.6087452, 1, 1, 1, 1, 1,
-0.8344925, 0.5729807, -2.182804, 1, 1, 1, 1, 1,
-0.8322367, 0.1600432, -0.4463595, 1, 1, 1, 1, 1,
-0.8259608, 2.381077, -0.17183, 1, 1, 1, 1, 1,
-0.8248502, 1.491727, -1.183472, 1, 1, 1, 1, 1,
-0.8240595, -0.5383536, -0.01538578, 1, 1, 1, 1, 1,
-0.8215623, 0.401685, -1.281283, 1, 1, 1, 1, 1,
-0.8202438, 1.015501, -1.454672, 1, 1, 1, 1, 1,
-0.8181241, 0.4059901, -2.838045, 1, 1, 1, 1, 1,
-0.8161346, -0.557127, -1.63799, 1, 1, 1, 1, 1,
-0.811179, -0.4147603, -2.558285, 1, 1, 1, 1, 1,
-0.808359, 0.8213019, 0.6231106, 1, 1, 1, 1, 1,
-0.8071833, -0.281416, -2.316688, 0, 0, 1, 1, 1,
-0.8018306, 1.092771, -1.741181, 1, 0, 0, 1, 1,
-0.8016655, 0.4535501, -0.8545606, 1, 0, 0, 1, 1,
-0.7953766, 0.8296509, -0.2986228, 1, 0, 0, 1, 1,
-0.7883031, -1.103128, -2.098817, 1, 0, 0, 1, 1,
-0.7837923, -0.5702346, -2.721369, 1, 0, 0, 1, 1,
-0.7829238, 0.03964558, -1.365252, 0, 0, 0, 1, 1,
-0.7784543, 1.110104, 0.7137195, 0, 0, 0, 1, 1,
-0.7741496, 0.9670089, -0.186882, 0, 0, 0, 1, 1,
-0.7734515, 1.158209, -0.5737711, 0, 0, 0, 1, 1,
-0.7705187, 0.3316031, -1.673632, 0, 0, 0, 1, 1,
-0.7677467, 1.696521, -0.8393654, 0, 0, 0, 1, 1,
-0.767544, -0.271655, -2.250363, 0, 0, 0, 1, 1,
-0.7631937, -0.1499185, -2.517418, 1, 1, 1, 1, 1,
-0.763068, 1.140131, -2.205825, 1, 1, 1, 1, 1,
-0.760281, -1.326822, -2.371557, 1, 1, 1, 1, 1,
-0.7588152, 0.3328833, -0.7159345, 1, 1, 1, 1, 1,
-0.7561627, 1.269051, -0.5957848, 1, 1, 1, 1, 1,
-0.7495561, -1.582485, -4.31466, 1, 1, 1, 1, 1,
-0.7450324, 0.09416279, -1.812383, 1, 1, 1, 1, 1,
-0.7445505, 0.6481588, -0.104865, 1, 1, 1, 1, 1,
-0.7434987, 1.76955, -1.464256, 1, 1, 1, 1, 1,
-0.7415938, -0.1992346, -4.265933, 1, 1, 1, 1, 1,
-0.7407084, 0.8929287, -0.592232, 1, 1, 1, 1, 1,
-0.7374345, 0.2344656, -1.442764, 1, 1, 1, 1, 1,
-0.7371958, 2.396694, -1.106383, 1, 1, 1, 1, 1,
-0.7322966, 0.2294245, -0.8078488, 1, 1, 1, 1, 1,
-0.7300567, -1.210103, -2.491242, 1, 1, 1, 1, 1,
-0.7249119, 0.99348, -2.501894, 0, 0, 1, 1, 1,
-0.7233564, -0.3956207, -2.354737, 1, 0, 0, 1, 1,
-0.7165198, -3.0149, -1.937678, 1, 0, 0, 1, 1,
-0.7148647, -0.8842354, -3.395454, 1, 0, 0, 1, 1,
-0.7113801, -0.5457938, -0.850323, 1, 0, 0, 1, 1,
-0.7108982, 1.350399, 0.4769383, 1, 0, 0, 1, 1,
-0.7091227, -0.1792946, -1.919362, 0, 0, 0, 1, 1,
-0.7059096, 0.3789627, -0.7632946, 0, 0, 0, 1, 1,
-0.7042099, 0.3211565, -1.839903, 0, 0, 0, 1, 1,
-0.7006146, -0.2626263, -4.018119, 0, 0, 0, 1, 1,
-0.6956618, 0.5242665, -1.816188, 0, 0, 0, 1, 1,
-0.6945538, -0.3340842, -1.172875, 0, 0, 0, 1, 1,
-0.6944339, 0.5170196, 1.697523, 0, 0, 0, 1, 1,
-0.6932072, 2.481079, -1.101767, 1, 1, 1, 1, 1,
-0.6881036, -0.1272459, -2.543427, 1, 1, 1, 1, 1,
-0.6863466, 0.5167882, 0.3437876, 1, 1, 1, 1, 1,
-0.6862436, -1.147161, -2.391356, 1, 1, 1, 1, 1,
-0.6842928, -1.321029, -1.467477, 1, 1, 1, 1, 1,
-0.6769894, -3.480097, -0.5739369, 1, 1, 1, 1, 1,
-0.6760027, -1.582425, -1.960183, 1, 1, 1, 1, 1,
-0.6734104, 1.02608, 0.5819277, 1, 1, 1, 1, 1,
-0.6618492, 0.6305131, -1.2502, 1, 1, 1, 1, 1,
-0.6569872, 0.8798409, -0.4010352, 1, 1, 1, 1, 1,
-0.6550313, -1.22667, -1.579322, 1, 1, 1, 1, 1,
-0.653244, -1.201243, -3.161675, 1, 1, 1, 1, 1,
-0.6507831, -1.477534, -4.308668, 1, 1, 1, 1, 1,
-0.648387, -1.263039, -3.216854, 1, 1, 1, 1, 1,
-0.6450642, -1.493424, -4.839607, 1, 1, 1, 1, 1,
-0.642933, -0.8238316, -2.986844, 0, 0, 1, 1, 1,
-0.6423481, 1.190926, 0.4459934, 1, 0, 0, 1, 1,
-0.6394297, -0.7760544, -3.324212, 1, 0, 0, 1, 1,
-0.6391017, 0.0972902, -2.774601, 1, 0, 0, 1, 1,
-0.6388909, -0.1492281, -2.983307, 1, 0, 0, 1, 1,
-0.6367297, -0.115587, -0.7945057, 1, 0, 0, 1, 1,
-0.6360281, 0.8375217, -0.1189982, 0, 0, 0, 1, 1,
-0.6332672, 0.4623035, -2.113534, 0, 0, 0, 1, 1,
-0.6295066, 1.526043, -0.3802292, 0, 0, 0, 1, 1,
-0.6272147, -1.484473, -2.662107, 0, 0, 0, 1, 1,
-0.6235227, 0.4232905, -2.633511, 0, 0, 0, 1, 1,
-0.6225759, 0.0355322, -1.956183, 0, 0, 0, 1, 1,
-0.6222482, 0.8079409, -1.096177, 0, 0, 0, 1, 1,
-0.6155691, 0.4793857, -2.484058, 1, 1, 1, 1, 1,
-0.6084678, -0.4151286, -2.112312, 1, 1, 1, 1, 1,
-0.6054075, 2.08998, 1.37541, 1, 1, 1, 1, 1,
-0.6023647, -0.3105232, -2.821906, 1, 1, 1, 1, 1,
-0.6014398, -0.5636034, -2.207354, 1, 1, 1, 1, 1,
-0.5984553, -0.9530897, -1.374484, 1, 1, 1, 1, 1,
-0.5968659, -0.3675861, -1.298385, 1, 1, 1, 1, 1,
-0.5944812, -0.1391856, -1.663663, 1, 1, 1, 1, 1,
-0.5919887, 1.027106, 1.553898, 1, 1, 1, 1, 1,
-0.5893433, 1.138718, -0.4030266, 1, 1, 1, 1, 1,
-0.588496, -1.17902, -2.092197, 1, 1, 1, 1, 1,
-0.5828233, 0.2269458, -0.6315563, 1, 1, 1, 1, 1,
-0.5822678, -0.6958211, -0.9469972, 1, 1, 1, 1, 1,
-0.5806491, 0.3140842, -2.8573, 1, 1, 1, 1, 1,
-0.5802234, -0.3043751, -2.694017, 1, 1, 1, 1, 1,
-0.5745801, 0.3756842, -0.8689812, 0, 0, 1, 1, 1,
-0.5745416, 0.8171272, -1.95887, 1, 0, 0, 1, 1,
-0.5731295, 1.007245, -0.7164376, 1, 0, 0, 1, 1,
-0.5683521, -1.157902, -2.234567, 1, 0, 0, 1, 1,
-0.5642378, 0.2755506, 0.1194611, 1, 0, 0, 1, 1,
-0.5639784, 0.1487945, -2.828, 1, 0, 0, 1, 1,
-0.5566021, -1.71819, -2.203667, 0, 0, 0, 1, 1,
-0.5417259, -0.1096236, -2.663394, 0, 0, 0, 1, 1,
-0.5354918, 1.019403, -0.5729942, 0, 0, 0, 1, 1,
-0.5353869, -0.5526491, -1.342796, 0, 0, 0, 1, 1,
-0.5353256, -0.1586639, -0.9951729, 0, 0, 0, 1, 1,
-0.5305384, 0.9528748, 0.2964953, 0, 0, 0, 1, 1,
-0.5301766, 0.3129036, -1.839034, 0, 0, 0, 1, 1,
-0.5277078, -0.9514686, -1.889895, 1, 1, 1, 1, 1,
-0.5262946, -0.4457729, -1.226393, 1, 1, 1, 1, 1,
-0.5228916, -0.4691069, -1.622322, 1, 1, 1, 1, 1,
-0.5220496, -1.264947, -4.714339, 1, 1, 1, 1, 1,
-0.521414, 0.1404826, -0.7770483, 1, 1, 1, 1, 1,
-0.5200904, 0.4014286, -0.3058242, 1, 1, 1, 1, 1,
-0.5191616, -0.3518651, -2.732684, 1, 1, 1, 1, 1,
-0.5120794, -0.7270588, -3.234064, 1, 1, 1, 1, 1,
-0.5110326, -0.3645141, -3.9768, 1, 1, 1, 1, 1,
-0.5098384, -0.02362979, -1.758217, 1, 1, 1, 1, 1,
-0.5094653, -0.02465183, -1.860419, 1, 1, 1, 1, 1,
-0.5093432, 1.372478, -0.4912806, 1, 1, 1, 1, 1,
-0.5091546, -1.195361, -1.723793, 1, 1, 1, 1, 1,
-0.5047392, 2.270781, 0.4205629, 1, 1, 1, 1, 1,
-0.4991002, -0.8681832, -1.161525, 1, 1, 1, 1, 1,
-0.4974883, 0.5915943, -0.3666362, 0, 0, 1, 1, 1,
-0.4963089, 0.1939797, -0.8034268, 1, 0, 0, 1, 1,
-0.4959022, -0.3466505, -1.616664, 1, 0, 0, 1, 1,
-0.4926138, -1.066329, -3.308176, 1, 0, 0, 1, 1,
-0.4923763, 2.276129, 0.5314068, 1, 0, 0, 1, 1,
-0.4913684, 1.712638, -2.301363, 1, 0, 0, 1, 1,
-0.491124, -0.04928974, -2.406203, 0, 0, 0, 1, 1,
-0.489469, 0.7282823, -1.572158, 0, 0, 0, 1, 1,
-0.4879698, 1.531537, 0.5895332, 0, 0, 0, 1, 1,
-0.4866936, -0.2113319, -0.7685722, 0, 0, 0, 1, 1,
-0.4817966, 0.6194388, -0.7995775, 0, 0, 0, 1, 1,
-0.4790558, -0.9610139, -0.9800436, 0, 0, 0, 1, 1,
-0.4786771, -0.2952409, -1.049658, 0, 0, 0, 1, 1,
-0.4767919, -2.568164, -0.2396028, 1, 1, 1, 1, 1,
-0.4731188, 1.880154, -1.746739, 1, 1, 1, 1, 1,
-0.4723939, 0.1496854, -0.844596, 1, 1, 1, 1, 1,
-0.4703463, -1.569829, -3.164175, 1, 1, 1, 1, 1,
-0.4688536, 0.1637129, -0.1973799, 1, 1, 1, 1, 1,
-0.4654531, 0.01888134, -3.18487, 1, 1, 1, 1, 1,
-0.4640945, -0.3269931, -1.835059, 1, 1, 1, 1, 1,
-0.4618114, 0.6846065, -0.774634, 1, 1, 1, 1, 1,
-0.4438377, 0.8427383, -0.8419758, 1, 1, 1, 1, 1,
-0.4412422, -0.3830792, -1.180014, 1, 1, 1, 1, 1,
-0.4409332, 1.678849, -0.2664526, 1, 1, 1, 1, 1,
-0.431629, 0.9036883, -0.3757423, 1, 1, 1, 1, 1,
-0.4312938, 2.349654, 2.079628, 1, 1, 1, 1, 1,
-0.4296711, -0.57689, -1.195841, 1, 1, 1, 1, 1,
-0.4290922, 1.027555, -0.8232272, 1, 1, 1, 1, 1,
-0.4264703, 0.2775322, 0.9295256, 0, 0, 1, 1, 1,
-0.4228872, 1.651248, -0.2362462, 1, 0, 0, 1, 1,
-0.4184184, 1.275507, -0.2992995, 1, 0, 0, 1, 1,
-0.4180038, -0.2412182, -1.91116, 1, 0, 0, 1, 1,
-0.4178067, -1.590081, -2.546671, 1, 0, 0, 1, 1,
-0.4163663, -0.4794662, -1.852086, 1, 0, 0, 1, 1,
-0.4153251, -0.6164728, -2.401014, 0, 0, 0, 1, 1,
-0.4143485, 1.498513, -0.1795537, 0, 0, 0, 1, 1,
-0.4093704, 1.792869, 0.1664127, 0, 0, 0, 1, 1,
-0.4091277, -0.4469276, -2.830433, 0, 0, 0, 1, 1,
-0.4078126, -0.03299334, -2.576258, 0, 0, 0, 1, 1,
-0.4071083, 0.6677781, -2.506955, 0, 0, 0, 1, 1,
-0.4060496, -0.3538268, -2.35556, 0, 0, 0, 1, 1,
-0.4032736, -1.20887, -1.208944, 1, 1, 1, 1, 1,
-0.4024935, 0.1273754, -1.434455, 1, 1, 1, 1, 1,
-0.3952334, 0.2809339, -0.9746625, 1, 1, 1, 1, 1,
-0.3947357, 0.502084, -1.736917, 1, 1, 1, 1, 1,
-0.3922077, -0.172849, -1.251265, 1, 1, 1, 1, 1,
-0.3880864, -0.4829512, -3.106635, 1, 1, 1, 1, 1,
-0.3838028, -0.1364533, -1.921358, 1, 1, 1, 1, 1,
-0.3829755, 1.435491, -0.183461, 1, 1, 1, 1, 1,
-0.3828259, -0.3600295, -2.867609, 1, 1, 1, 1, 1,
-0.3785905, 0.8634116, -1.269949, 1, 1, 1, 1, 1,
-0.3772204, -0.01556466, -1.836518, 1, 1, 1, 1, 1,
-0.3747252, 0.9597117, -0.6115035, 1, 1, 1, 1, 1,
-0.3674252, -1.191878, -2.168869, 1, 1, 1, 1, 1,
-0.3618543, 0.6765202, -0.4426791, 1, 1, 1, 1, 1,
-0.3558269, 1.491018, -0.6492884, 1, 1, 1, 1, 1,
-0.3477071, -0.2262537, -1.318289, 0, 0, 1, 1, 1,
-0.347701, -0.6314737, -3.191852, 1, 0, 0, 1, 1,
-0.347166, 0.9694064, 0.03864547, 1, 0, 0, 1, 1,
-0.3444674, 0.286156, -1.418747, 1, 0, 0, 1, 1,
-0.3437904, 0.8118087, -0.2901154, 1, 0, 0, 1, 1,
-0.3351671, 1.372443, -0.2769118, 1, 0, 0, 1, 1,
-0.3349975, 1.00432, -0.4855034, 0, 0, 0, 1, 1,
-0.3344018, -0.8750978, -2.51281, 0, 0, 0, 1, 1,
-0.3323142, -1.79158, -2.190322, 0, 0, 0, 1, 1,
-0.32274, -0.6887043, -1.559783, 0, 0, 0, 1, 1,
-0.321558, 1.324953, -0.5942029, 0, 0, 0, 1, 1,
-0.3199165, -0.190328, -2.894798, 0, 0, 0, 1, 1,
-0.3198242, -0.6351809, -1.420901, 0, 0, 0, 1, 1,
-0.3176586, 0.9198291, -1.692049, 1, 1, 1, 1, 1,
-0.3133463, -0.2439512, -2.576756, 1, 1, 1, 1, 1,
-0.3128677, 0.752037, -2.778867, 1, 1, 1, 1, 1,
-0.3109695, -0.3667428, -1.46336, 1, 1, 1, 1, 1,
-0.3105808, 1.696344, -2.974507, 1, 1, 1, 1, 1,
-0.3085778, 0.4459854, -1.62741, 1, 1, 1, 1, 1,
-0.3037532, 0.4646063, -0.9601278, 1, 1, 1, 1, 1,
-0.3036243, 0.8401687, -0.6002762, 1, 1, 1, 1, 1,
-0.303441, 0.01418014, -1.292184, 1, 1, 1, 1, 1,
-0.3028407, -1.183137, -1.023723, 1, 1, 1, 1, 1,
-0.301985, -0.7684559, -1.398365, 1, 1, 1, 1, 1,
-0.2969995, -0.3442294, -2.895824, 1, 1, 1, 1, 1,
-0.2967158, -0.05343632, -4.253356, 1, 1, 1, 1, 1,
-0.2966408, -0.9540465, -3.445127, 1, 1, 1, 1, 1,
-0.2922381, 0.4178998, -1.973262, 1, 1, 1, 1, 1,
-0.2859214, -0.0721222, -0.7438416, 0, 0, 1, 1, 1,
-0.2824076, 0.9336998, -1.214109, 1, 0, 0, 1, 1,
-0.2801875, -1.285857, -2.876112, 1, 0, 0, 1, 1,
-0.2791761, -1.294671, -4.497305, 1, 0, 0, 1, 1,
-0.2751984, 1.329741, -1.478915, 1, 0, 0, 1, 1,
-0.2730948, 1.71508, -1.033649, 1, 0, 0, 1, 1,
-0.2722493, -0.6230689, -3.134983, 0, 0, 0, 1, 1,
-0.2714832, 0.07609754, -2.536903, 0, 0, 0, 1, 1,
-0.2703672, 0.02483009, -0.8365276, 0, 0, 0, 1, 1,
-0.2698101, 0.5835717, -2.781565, 0, 0, 0, 1, 1,
-0.2638503, 0.5039173, -0.1815353, 0, 0, 0, 1, 1,
-0.2558496, -0.5367765, -1.798402, 0, 0, 0, 1, 1,
-0.2517931, 0.1109928, -1.208809, 0, 0, 0, 1, 1,
-0.2497037, 0.6912853, 1.204668, 1, 1, 1, 1, 1,
-0.2417552, 1.017448, -0.4662312, 1, 1, 1, 1, 1,
-0.2386569, 1.490913, -0.2442847, 1, 1, 1, 1, 1,
-0.2384821, -0.6320508, -3.155181, 1, 1, 1, 1, 1,
-0.2352354, -1.030844, -3.116643, 1, 1, 1, 1, 1,
-0.2339772, -0.4180928, -1.258725, 1, 1, 1, 1, 1,
-0.2332272, -0.5973414, -3.960644, 1, 1, 1, 1, 1,
-0.2311944, 1.241066, 0.07778278, 1, 1, 1, 1, 1,
-0.2293607, -1.023847, -2.829274, 1, 1, 1, 1, 1,
-0.229307, -0.3209386, -3.244395, 1, 1, 1, 1, 1,
-0.2286387, -0.006112684, -1.527984, 1, 1, 1, 1, 1,
-0.2235401, -0.2420848, -2.789541, 1, 1, 1, 1, 1,
-0.2229402, -0.4824623, -1.99139, 1, 1, 1, 1, 1,
-0.2140547, 1.253933, 0.3128212, 1, 1, 1, 1, 1,
-0.2140452, 0.1123832, -1.908475, 1, 1, 1, 1, 1,
-0.2125702, -1.030641, -4.812891, 0, 0, 1, 1, 1,
-0.2115616, 0.7104248, -0.9338928, 1, 0, 0, 1, 1,
-0.2104624, -0.1003661, -2.13184, 1, 0, 0, 1, 1,
-0.2055514, 0.1026788, -1.052859, 1, 0, 0, 1, 1,
-0.2016765, 0.1335312, -0.8051873, 1, 0, 0, 1, 1,
-0.1970342, -0.9220605, -2.66352, 1, 0, 0, 1, 1,
-0.1921655, 0.03814277, -0.9294559, 0, 0, 0, 1, 1,
-0.1890412, -1.184603, -2.285895, 0, 0, 0, 1, 1,
-0.1853096, 1.099524, -1.456251, 0, 0, 0, 1, 1,
-0.1777181, 0.03824557, 0.04919623, 0, 0, 0, 1, 1,
-0.1754902, -0.4903885, -2.970029, 0, 0, 0, 1, 1,
-0.1666527, -0.1501997, -2.484367, 0, 0, 0, 1, 1,
-0.1621768, 0.6348863, 1.690767, 0, 0, 0, 1, 1,
-0.1600979, 1.313756, -0.8107365, 1, 1, 1, 1, 1,
-0.157185, 0.9585046, 0.5377272, 1, 1, 1, 1, 1,
-0.1538219, 0.292861, -0.5765905, 1, 1, 1, 1, 1,
-0.1535613, -1.250164, -4.279679, 1, 1, 1, 1, 1,
-0.1481039, 0.03354477, -2.099106, 1, 1, 1, 1, 1,
-0.1472208, 0.6687508, -0.524479, 1, 1, 1, 1, 1,
-0.1449422, -1.249949, -3.30447, 1, 1, 1, 1, 1,
-0.1408547, 0.1723854, -2.544647, 1, 1, 1, 1, 1,
-0.1396217, -0.6610934, -1.476545, 1, 1, 1, 1, 1,
-0.1394198, 2.478834, 0.5924787, 1, 1, 1, 1, 1,
-0.1388714, 0.9864973, -0.06886197, 1, 1, 1, 1, 1,
-0.1353761, 1.6604, -0.6283456, 1, 1, 1, 1, 1,
-0.1346399, -0.4186926, -2.164385, 1, 1, 1, 1, 1,
-0.1345698, -0.4250094, -3.440557, 1, 1, 1, 1, 1,
-0.1335852, -0.4211144, -3.181496, 1, 1, 1, 1, 1,
-0.1302985, 1.403372, 0.7317415, 0, 0, 1, 1, 1,
-0.1261386, 0.8918021, -1.852303, 1, 0, 0, 1, 1,
-0.1255392, 0.2727982, 0.7504796, 1, 0, 0, 1, 1,
-0.122452, -1.701259, -1.821437, 1, 0, 0, 1, 1,
-0.1193527, 1.192417, -0.299715, 1, 0, 0, 1, 1,
-0.1185585, -0.777491, -1.8333, 1, 0, 0, 1, 1,
-0.1178128, 0.2282646, 0.0002092623, 0, 0, 0, 1, 1,
-0.1172026, -0.4696628, -2.240309, 0, 0, 0, 1, 1,
-0.1105759, -1.20569, -3.943533, 0, 0, 0, 1, 1,
-0.1062066, 0.5454211, -0.674556, 0, 0, 0, 1, 1,
-0.1040515, -0.5573686, -2.696805, 0, 0, 0, 1, 1,
-0.1025731, 0.7351696, -1.429775, 0, 0, 0, 1, 1,
-0.09922316, 1.385012, -0.3033941, 0, 0, 0, 1, 1,
-0.09401951, 0.5835199, -0.5924838, 1, 1, 1, 1, 1,
-0.09281933, -1.751501, -2.538215, 1, 1, 1, 1, 1,
-0.09280103, 0.6575267, -1.249946, 1, 1, 1, 1, 1,
-0.08797235, 1.252872, -1.151544, 1, 1, 1, 1, 1,
-0.08397275, -0.3331974, -3.531061, 1, 1, 1, 1, 1,
-0.08297853, -0.4611831, -1.15839, 1, 1, 1, 1, 1,
-0.08092664, -0.08325455, 0.1439074, 1, 1, 1, 1, 1,
-0.07726893, 0.2806841, -1.196696, 1, 1, 1, 1, 1,
-0.07599431, 0.09943034, -0.9962651, 1, 1, 1, 1, 1,
-0.07395551, 0.7850882, 0.2689777, 1, 1, 1, 1, 1,
-0.07298977, 0.1387089, -0.2087454, 1, 1, 1, 1, 1,
-0.07174525, 1.089489, 0.1750644, 1, 1, 1, 1, 1,
-0.07078163, -0.3863267, -1.365974, 1, 1, 1, 1, 1,
-0.07073332, -0.3802686, -2.931817, 1, 1, 1, 1, 1,
-0.06947939, 1.607179, 1.257828, 1, 1, 1, 1, 1,
-0.0680214, 1.066396, -1.195757, 0, 0, 1, 1, 1,
-0.06693011, -1.900887, -0.7715768, 1, 0, 0, 1, 1,
-0.06524342, -1.629598, -3.213564, 1, 0, 0, 1, 1,
-0.06343159, -0.1623346, -2.06742, 1, 0, 0, 1, 1,
-0.06044635, 1.15961, -0.2779907, 1, 0, 0, 1, 1,
-0.05865976, -0.6773417, -3.532576, 1, 0, 0, 1, 1,
-0.05456396, -0.4695521, -2.487784, 0, 0, 0, 1, 1,
-0.05054171, -0.8854383, -5.087979, 0, 0, 0, 1, 1,
-0.04954713, -0.35489, -4.403569, 0, 0, 0, 1, 1,
-0.04580629, -0.003731881, -0.6433297, 0, 0, 0, 1, 1,
-0.04478276, -0.1259986, -4.113586, 0, 0, 0, 1, 1,
-0.03866854, -0.6250247, -0.8996525, 0, 0, 0, 1, 1,
-0.03482371, 0.4194779, -1.664744, 0, 0, 0, 1, 1,
-0.03434234, 0.4981556, 0.8762023, 1, 1, 1, 1, 1,
-0.03094101, -1.473287, -2.19999, 1, 1, 1, 1, 1,
-0.02580523, 0.1012696, 0.2967402, 1, 1, 1, 1, 1,
-0.02554715, 1.98513, -0.07357256, 1, 1, 1, 1, 1,
-0.02154481, 1.858237, -0.245116, 1, 1, 1, 1, 1,
-0.0182513, 0.3070158, 1.091686, 1, 1, 1, 1, 1,
-0.01491033, -1.284766, -3.361891, 1, 1, 1, 1, 1,
-0.01018724, -1.262129, -3.2814, 1, 1, 1, 1, 1,
-0.007656464, -0.7788045, -4.115483, 1, 1, 1, 1, 1,
-0.00283744, -2.50111, -3.768928, 1, 1, 1, 1, 1,
-0.001630096, -0.3490459, -4.552447, 1, 1, 1, 1, 1,
-2.765834e-05, 0.6118399, 1.431486, 1, 1, 1, 1, 1,
2.318524e-05, 0.5873559, 0.3271571, 1, 1, 1, 1, 1,
0.004776007, 0.3814011, 0.06938247, 1, 1, 1, 1, 1,
0.005964255, -1.110872, 3.941932, 1, 1, 1, 1, 1,
0.01235929, -1.313546, 3.736664, 0, 0, 1, 1, 1,
0.0125207, -0.3620969, 2.599056, 1, 0, 0, 1, 1,
0.0137425, 0.760312, -0.3596463, 1, 0, 0, 1, 1,
0.01388994, 0.7014324, 1.881041, 1, 0, 0, 1, 1,
0.01489663, -1.449904, 4.210495, 1, 0, 0, 1, 1,
0.02555432, -0.1685027, 3.296629, 1, 0, 0, 1, 1,
0.02606279, 0.3212288, 0.2099532, 0, 0, 0, 1, 1,
0.02649308, 0.03580251, 1.093837, 0, 0, 0, 1, 1,
0.02653188, -0.4346928, 3.28348, 0, 0, 0, 1, 1,
0.02778455, -0.9342929, 4.708704, 0, 0, 0, 1, 1,
0.02843442, 0.2133668, -0.6226673, 0, 0, 0, 1, 1,
0.02909064, -0.7761751, 2.826649, 0, 0, 0, 1, 1,
0.03338869, -0.1485354, 2.953402, 0, 0, 0, 1, 1,
0.0352316, 0.1139014, 1.788858, 1, 1, 1, 1, 1,
0.03602466, 1.072246, -1.255223, 1, 1, 1, 1, 1,
0.0410549, -0.2341121, 3.12589, 1, 1, 1, 1, 1,
0.04658591, 0.1845867, 0.7881236, 1, 1, 1, 1, 1,
0.04672534, -0.3127069, 2.81365, 1, 1, 1, 1, 1,
0.04771555, -1.587985, 1.400784, 1, 1, 1, 1, 1,
0.05006698, -0.7750183, 2.480338, 1, 1, 1, 1, 1,
0.05062689, 0.362791, 0.3258913, 1, 1, 1, 1, 1,
0.05404604, -0.7028417, 2.84585, 1, 1, 1, 1, 1,
0.06371382, 0.7271861, -1.282142, 1, 1, 1, 1, 1,
0.0656312, -1.100567, 2.496746, 1, 1, 1, 1, 1,
0.06605876, 1.050922, 0.9563153, 1, 1, 1, 1, 1,
0.06708804, 0.6203641, 1.828467, 1, 1, 1, 1, 1,
0.06758274, 0.1182925, 1.545699, 1, 1, 1, 1, 1,
0.07020494, -1.660458, 3.499986, 1, 1, 1, 1, 1,
0.07206296, 1.245749, -0.5571396, 0, 0, 1, 1, 1,
0.07350559, 0.945945, 1.231355, 1, 0, 0, 1, 1,
0.07545421, -1.891094, 1.724414, 1, 0, 0, 1, 1,
0.07589935, -0.3524758, 4.36116, 1, 0, 0, 1, 1,
0.07782677, 0.1251332, 1.670912, 1, 0, 0, 1, 1,
0.08022201, 1.352464, 0.411573, 1, 0, 0, 1, 1,
0.08050818, 0.07549623, 0.7919407, 0, 0, 0, 1, 1,
0.08262473, -0.422936, 4.307428, 0, 0, 0, 1, 1,
0.08924759, 0.4022204, 0.9735837, 0, 0, 0, 1, 1,
0.08934311, -0.3772613, 2.147649, 0, 0, 0, 1, 1,
0.0920547, -0.3199104, 3.008313, 0, 0, 0, 1, 1,
0.09323496, -0.107359, 3.391314, 0, 0, 0, 1, 1,
0.09354872, 0.2765272, 1.050463, 0, 0, 0, 1, 1,
0.09397944, 1.220454, -0.9037132, 1, 1, 1, 1, 1,
0.09402494, 2.661206, -2.020179, 1, 1, 1, 1, 1,
0.09612732, 1.885686, -1.226867, 1, 1, 1, 1, 1,
0.09724634, 0.09161101, 1.325819, 1, 1, 1, 1, 1,
0.1004325, -0.2330764, 2.733556, 1, 1, 1, 1, 1,
0.1035782, 1.38822, 1.259009, 1, 1, 1, 1, 1,
0.1055175, 0.6254511, 0.0114043, 1, 1, 1, 1, 1,
0.1056284, -1.005118, 1.587576, 1, 1, 1, 1, 1,
0.1059644, 0.5137151, -0.135315, 1, 1, 1, 1, 1,
0.1063558, 1.564335, 1.057752, 1, 1, 1, 1, 1,
0.1074323, -0.3391463, 3.487481, 1, 1, 1, 1, 1,
0.1089028, 1.38535, -0.3307597, 1, 1, 1, 1, 1,
0.1089114, -1.353474, 2.762233, 1, 1, 1, 1, 1,
0.1181999, -0.3499406, 1.643339, 1, 1, 1, 1, 1,
0.1204927, 0.9943169, 0.07535829, 1, 1, 1, 1, 1,
0.1222081, 0.9525121, -0.7618375, 0, 0, 1, 1, 1,
0.1229823, 0.2482508, 0.8447382, 1, 0, 0, 1, 1,
0.1242167, 0.9913695, -0.2276906, 1, 0, 0, 1, 1,
0.1247698, 0.7923821, 1.024011, 1, 0, 0, 1, 1,
0.128727, -0.529422, 2.066105, 1, 0, 0, 1, 1,
0.1367711, 0.971024, -0.4677794, 1, 0, 0, 1, 1,
0.1383735, -0.08247145, 3.962699, 0, 0, 0, 1, 1,
0.1442962, 1.315323, -1.219693, 0, 0, 0, 1, 1,
0.147145, 1.239583, -0.711257, 0, 0, 0, 1, 1,
0.1519789, 0.5143709, -0.6064744, 0, 0, 0, 1, 1,
0.1530065, 0.6525156, -0.9074569, 0, 0, 0, 1, 1,
0.1598295, 0.1616578, 2.175217, 0, 0, 0, 1, 1,
0.1635118, 0.9916871, 1.049384, 0, 0, 0, 1, 1,
0.164525, 0.7324702, -0.7263151, 1, 1, 1, 1, 1,
0.164719, 1.473581, -2.197413, 1, 1, 1, 1, 1,
0.1687126, 0.8658812, -0.6990656, 1, 1, 1, 1, 1,
0.1689021, 1.745769, 0.4777509, 1, 1, 1, 1, 1,
0.1690984, -0.9002504, 4.042454, 1, 1, 1, 1, 1,
0.1767647, 1.173049, 1.745144, 1, 1, 1, 1, 1,
0.1787885, -0.8342118, 3.018077, 1, 1, 1, 1, 1,
0.1871069, -0.3189115, 1.31678, 1, 1, 1, 1, 1,
0.1900211, -0.5581287, 1.083222, 1, 1, 1, 1, 1,
0.1912713, 0.1084552, 0.7950425, 1, 1, 1, 1, 1,
0.1913482, 0.2888216, 0.4052022, 1, 1, 1, 1, 1,
0.1914091, -0.6931984, 2.937099, 1, 1, 1, 1, 1,
0.1921737, 1.016647, 0.1120189, 1, 1, 1, 1, 1,
0.1932018, 2.169567, -0.1127388, 1, 1, 1, 1, 1,
0.1935465, 0.4759021, -0.1916625, 1, 1, 1, 1, 1,
0.1946238, -0.1877407, 3.205434, 0, 0, 1, 1, 1,
0.1993886, 1.029798, 0.1068856, 1, 0, 0, 1, 1,
0.2088384, 2.759663, -1.057743, 1, 0, 0, 1, 1,
0.2108789, 1.3459, 0.02441073, 1, 0, 0, 1, 1,
0.2122051, 0.4129702, 1.266724, 1, 0, 0, 1, 1,
0.2135083, 0.9729253, -1.816066, 1, 0, 0, 1, 1,
0.2144945, -0.009327308, 2.332738, 0, 0, 0, 1, 1,
0.2165349, 0.3019067, 1.191561, 0, 0, 0, 1, 1,
0.2238634, 0.6129293, 1.000505, 0, 0, 0, 1, 1,
0.2241275, -1.196025, 3.055896, 0, 0, 0, 1, 1,
0.2243427, 0.5800468, -0.6222436, 0, 0, 0, 1, 1,
0.2282978, -1.260962, 4.614072, 0, 0, 0, 1, 1,
0.2284954, 0.1007993, 2.126075, 0, 0, 0, 1, 1,
0.2292178, 0.07149297, 2.411834, 1, 1, 1, 1, 1,
0.2297223, 0.9891557, 0.4011213, 1, 1, 1, 1, 1,
0.2300703, 1.126492, 1.862074, 1, 1, 1, 1, 1,
0.2320091, 1.849085, 0.5256103, 1, 1, 1, 1, 1,
0.2368862, 0.2815514, 0.5328399, 1, 1, 1, 1, 1,
0.238706, -0.8947005, 1.894362, 1, 1, 1, 1, 1,
0.23885, 0.388716, -0.2629318, 1, 1, 1, 1, 1,
0.2405261, 0.7426726, 0.5885704, 1, 1, 1, 1, 1,
0.2410413, -1.589185, 3.542293, 1, 1, 1, 1, 1,
0.2422908, -0.687036, 0.9934714, 1, 1, 1, 1, 1,
0.2429458, -0.3646727, 3.995167, 1, 1, 1, 1, 1,
0.2457489, -0.6381835, 4.398193, 1, 1, 1, 1, 1,
0.2486112, -0.2976501, 2.00033, 1, 1, 1, 1, 1,
0.2511903, -0.06345282, 2.903326, 1, 1, 1, 1, 1,
0.2522421, -0.4557668, 4.779009, 1, 1, 1, 1, 1,
0.2542157, 0.3234722, 2.207663, 0, 0, 1, 1, 1,
0.2581113, 0.6988113, 0.1519229, 1, 0, 0, 1, 1,
0.2585274, -1.709208, 3.29559, 1, 0, 0, 1, 1,
0.2610891, 0.9584722, -0.6510463, 1, 0, 0, 1, 1,
0.2635305, -2.157672, 2.998103, 1, 0, 0, 1, 1,
0.2751955, 0.8026912, -0.6916379, 1, 0, 0, 1, 1,
0.2785525, 0.3754421, 0.3844029, 0, 0, 0, 1, 1,
0.2837614, 1.201205, 0.7931269, 0, 0, 0, 1, 1,
0.2843262, -0.1731861, 1.335672, 0, 0, 0, 1, 1,
0.2869833, 0.03665811, 0.6947041, 0, 0, 0, 1, 1,
0.2882869, -0.1652945, 1.955755, 0, 0, 0, 1, 1,
0.2898307, 1.515226, -0.7396977, 0, 0, 0, 1, 1,
0.2938674, -1.062283, 3.111231, 0, 0, 0, 1, 1,
0.2941023, -1.055806, 4.48466, 1, 1, 1, 1, 1,
0.2998979, 0.9841645, 1.437196, 1, 1, 1, 1, 1,
0.3015864, 0.4286535, -0.1062339, 1, 1, 1, 1, 1,
0.3052844, -0.4974163, 3.101893, 1, 1, 1, 1, 1,
0.3073307, -0.722877, 1.44942, 1, 1, 1, 1, 1,
0.3074619, -1.613715, 5.135635, 1, 1, 1, 1, 1,
0.309237, -0.8028845, 2.786142, 1, 1, 1, 1, 1,
0.3126641, -0.3485687, 3.493725, 1, 1, 1, 1, 1,
0.3129206, 0.08066086, -0.2980085, 1, 1, 1, 1, 1,
0.3165969, 0.3999156, -1.133884, 1, 1, 1, 1, 1,
0.3252542, -1.013694, 3.387066, 1, 1, 1, 1, 1,
0.3258779, 1.187329, 1.8063, 1, 1, 1, 1, 1,
0.3314608, 0.8721362, -0.2472237, 1, 1, 1, 1, 1,
0.3328816, -0.8599042, 3.137538, 1, 1, 1, 1, 1,
0.3333902, -1.061005, 3.730309, 1, 1, 1, 1, 1,
0.333631, 0.08031414, 2.938103, 0, 0, 1, 1, 1,
0.3383797, 0.4046354, 1.929039, 1, 0, 0, 1, 1,
0.3390053, 2.181609, -0.188179, 1, 0, 0, 1, 1,
0.3465725, 0.8877219, 1.289226, 1, 0, 0, 1, 1,
0.3504386, 1.120685, -0.6788636, 1, 0, 0, 1, 1,
0.3526974, -0.4696462, 3.063475, 1, 0, 0, 1, 1,
0.3543186, -0.2975371, 3.372848, 0, 0, 0, 1, 1,
0.3551852, -0.7789978, 1.995583, 0, 0, 0, 1, 1,
0.3572241, -1.356753, 1.839918, 0, 0, 0, 1, 1,
0.3671562, -2.014073, 3.48526, 0, 0, 0, 1, 1,
0.3676174, 0.8580264, 0.1302471, 0, 0, 0, 1, 1,
0.3688408, -1.389867, 2.615918, 0, 0, 0, 1, 1,
0.3695094, -0.09249302, 2.064866, 0, 0, 0, 1, 1,
0.3716533, -0.4368686, 1.694823, 1, 1, 1, 1, 1,
0.3725739, 0.6727367, -2.255293, 1, 1, 1, 1, 1,
0.3760219, 1.75087, 0.9279673, 1, 1, 1, 1, 1,
0.3764027, -1.461777, 3.866466, 1, 1, 1, 1, 1,
0.3772663, -0.06368557, 0.1332654, 1, 1, 1, 1, 1,
0.381404, 0.2292953, 2.779101, 1, 1, 1, 1, 1,
0.3831146, -0.04335957, 1.307448, 1, 1, 1, 1, 1,
0.3856389, 0.09406971, 0.399136, 1, 1, 1, 1, 1,
0.3863502, 0.2623011, 0.2105651, 1, 1, 1, 1, 1,
0.3891465, -1.960626, 2.824648, 1, 1, 1, 1, 1,
0.3900163, -0.07650159, 0.9336544, 1, 1, 1, 1, 1,
0.3927945, 0.2490951, 1.000396, 1, 1, 1, 1, 1,
0.3931375, 1.95558, -0.5928404, 1, 1, 1, 1, 1,
0.3938147, 0.6117851, -0.2046598, 1, 1, 1, 1, 1,
0.3963399, -0.5699624, 3.698787, 1, 1, 1, 1, 1,
0.3965298, 0.2433917, 1.623663, 0, 0, 1, 1, 1,
0.3983349, -0.7939917, 3.542382, 1, 0, 0, 1, 1,
0.3992354, 0.1693647, 2.270538, 1, 0, 0, 1, 1,
0.4033168, -0.3176463, 0.7800325, 1, 0, 0, 1, 1,
0.409268, -1.792454, 4.007616, 1, 0, 0, 1, 1,
0.4109946, 0.7419556, 2.050872, 1, 0, 0, 1, 1,
0.4149233, 1.529655, 0.5510142, 0, 0, 0, 1, 1,
0.4201937, 0.3926119, 1.445947, 0, 0, 0, 1, 1,
0.4217033, 0.4506387, 1.253697, 0, 0, 0, 1, 1,
0.4255878, 0.7117234, -0.9602701, 0, 0, 0, 1, 1,
0.429722, -0.9014639, 4.188931, 0, 0, 0, 1, 1,
0.4307186, 0.107528, 1.364658, 0, 0, 0, 1, 1,
0.4381003, 0.9342676, 0.633639, 0, 0, 0, 1, 1,
0.4382031, 1.178922, 0.5985656, 1, 1, 1, 1, 1,
0.4425546, -0.1248219, 0.8612685, 1, 1, 1, 1, 1,
0.4519702, 0.5549992, 0.5489671, 1, 1, 1, 1, 1,
0.4545729, 0.01411091, 1.277432, 1, 1, 1, 1, 1,
0.4601828, -0.6353611, 4.131784, 1, 1, 1, 1, 1,
0.4601991, 0.106853, 2.463655, 1, 1, 1, 1, 1,
0.4616953, 0.930459, -0.4360281, 1, 1, 1, 1, 1,
0.4639595, 0.1345783, 1.193503, 1, 1, 1, 1, 1,
0.470085, 0.09379458, 1.561565, 1, 1, 1, 1, 1,
0.4724155, 1.087686, 1.612006, 1, 1, 1, 1, 1,
0.4735177, -0.476894, 2.595248, 1, 1, 1, 1, 1,
0.4777529, -0.8470556, 2.11, 1, 1, 1, 1, 1,
0.4780606, 1.33537, 0.1381221, 1, 1, 1, 1, 1,
0.480182, -0.8066042, 3.039996, 1, 1, 1, 1, 1,
0.4843477, 0.9310349, -0.7132854, 1, 1, 1, 1, 1,
0.4994375, 0.9888552, 1.256158, 0, 0, 1, 1, 1,
0.5010424, -0.400954, 3.38265, 1, 0, 0, 1, 1,
0.5100275, 1.146281, 0.4224471, 1, 0, 0, 1, 1,
0.5116847, -0.01448517, 1.181151, 1, 0, 0, 1, 1,
0.5130629, 0.04674121, 0.5545508, 1, 0, 0, 1, 1,
0.5140104, -1.265203, 4.076977, 1, 0, 0, 1, 1,
0.5150999, 0.7249073, 0.5318918, 0, 0, 0, 1, 1,
0.5152727, -0.9579481, 3.175031, 0, 0, 0, 1, 1,
0.5192882, -0.8427386, 3.100216, 0, 0, 0, 1, 1,
0.5206391, -1.840882, 2.66902, 0, 0, 0, 1, 1,
0.5219061, 1.058053, 1.509523, 0, 0, 0, 1, 1,
0.5255782, -1.36477, 4.531044, 0, 0, 0, 1, 1,
0.5295377, 0.8023596, 0.3776427, 0, 0, 0, 1, 1,
0.534238, -1.747835, 3.256874, 1, 1, 1, 1, 1,
0.5359811, -0.7350037, 2.540305, 1, 1, 1, 1, 1,
0.5409536, -0.7108085, 2.38366, 1, 1, 1, 1, 1,
0.5435286, 0.5901309, 0.9261013, 1, 1, 1, 1, 1,
0.5435837, -0.2636645, 0.8354761, 1, 1, 1, 1, 1,
0.5491657, -1.125407, 3.369399, 1, 1, 1, 1, 1,
0.5549305, -1.187781, 3.350695, 1, 1, 1, 1, 1,
0.5558233, -0.4048821, 0.8244284, 1, 1, 1, 1, 1,
0.5563669, 1.176049, 0.5106402, 1, 1, 1, 1, 1,
0.5569257, 1.996791, 0.1705977, 1, 1, 1, 1, 1,
0.5589156, 0.6940637, -1.64005, 1, 1, 1, 1, 1,
0.5640505, 0.8735769, -0.9066655, 1, 1, 1, 1, 1,
0.5740919, 1.299532, -0.9114202, 1, 1, 1, 1, 1,
0.5795779, 0.1831223, 1.685061, 1, 1, 1, 1, 1,
0.5807887, 0.01206993, 0.4930222, 1, 1, 1, 1, 1,
0.5820789, 0.4898874, -0.5691677, 0, 0, 1, 1, 1,
0.5854939, 0.2441576, 1.663001, 1, 0, 0, 1, 1,
0.5861954, 1.812272, 1.00241, 1, 0, 0, 1, 1,
0.5871698, 0.6160931, 2.055789, 1, 0, 0, 1, 1,
0.5884354, 1.937828, 0.2014049, 1, 0, 0, 1, 1,
0.5886356, -0.454257, 1.766247, 1, 0, 0, 1, 1,
0.589285, -0.2799684, 3.316059, 0, 0, 0, 1, 1,
0.5928203, -0.1781594, 1.475078, 0, 0, 0, 1, 1,
0.5936869, 0.8430781, 1.086902, 0, 0, 0, 1, 1,
0.594156, -1.392915, 3.033129, 0, 0, 0, 1, 1,
0.5969293, 1.070322, -0.3715624, 0, 0, 0, 1, 1,
0.5992112, 0.8727797, 1.276383, 0, 0, 0, 1, 1,
0.5992203, 0.3064573, 0.08350767, 0, 0, 0, 1, 1,
0.6034352, -1.300983, 3.243373, 1, 1, 1, 1, 1,
0.6039584, -0.05392352, 1.823343, 1, 1, 1, 1, 1,
0.6044136, 0.7880359, -2.738303, 1, 1, 1, 1, 1,
0.6047075, 0.4908441, 1.59304, 1, 1, 1, 1, 1,
0.6084194, -0.9546304, 3.845394, 1, 1, 1, 1, 1,
0.6132925, -1.045194, 3.783211, 1, 1, 1, 1, 1,
0.6141328, -1.767908, 2.412392, 1, 1, 1, 1, 1,
0.621005, 0.4964207, 2.336363, 1, 1, 1, 1, 1,
0.622368, -0.02091531, 0.569478, 1, 1, 1, 1, 1,
0.623042, 0.1189791, 2.607413, 1, 1, 1, 1, 1,
0.6263231, 1.041219, -0.6640728, 1, 1, 1, 1, 1,
0.6292573, 0.1394756, 2.003587, 1, 1, 1, 1, 1,
0.6311736, 1.295252, -0.5009637, 1, 1, 1, 1, 1,
0.6325073, -0.4931319, 1.776778, 1, 1, 1, 1, 1,
0.6364783, 1.152516, 0.9353321, 1, 1, 1, 1, 1,
0.6380672, 0.9975293, 1.283702, 0, 0, 1, 1, 1,
0.6402193, 0.4738846, 2.29284, 1, 0, 0, 1, 1,
0.6411596, -2.379872, 2.638895, 1, 0, 0, 1, 1,
0.6481077, -0.7384789, 3.506533, 1, 0, 0, 1, 1,
0.6491622, -0.8744094, 2.71208, 1, 0, 0, 1, 1,
0.6561618, -1.971927, 2.860214, 1, 0, 0, 1, 1,
0.6569889, 0.2677748, 1.419655, 0, 0, 0, 1, 1,
0.6601021, 0.08269224, 1.267903, 0, 0, 0, 1, 1,
0.6628292, 2.244589, 0.5546621, 0, 0, 0, 1, 1,
0.6654442, -0.05074206, 2.466268, 0, 0, 0, 1, 1,
0.6708311, 0.6349585, 1.34312, 0, 0, 0, 1, 1,
0.6754707, -0.1300069, 1.977051, 0, 0, 0, 1, 1,
0.6770403, -1.257111, 4.507464, 0, 0, 0, 1, 1,
0.6806825, 0.4442325, 0.03172567, 1, 1, 1, 1, 1,
0.6856345, 1.061412, -0.3949732, 1, 1, 1, 1, 1,
0.6861771, 0.3417529, 1.163299, 1, 1, 1, 1, 1,
0.6876263, -0.931984, 3.860036, 1, 1, 1, 1, 1,
0.6939098, 0.3700277, 2.178294, 1, 1, 1, 1, 1,
0.697233, -0.3361226, 0.28799, 1, 1, 1, 1, 1,
0.6975892, 1.236072, -0.2003826, 1, 1, 1, 1, 1,
0.6999111, -1.775838, 3.72784, 1, 1, 1, 1, 1,
0.7008196, 0.269558, 0.6574962, 1, 1, 1, 1, 1,
0.7052673, 0.3816971, 0.9773508, 1, 1, 1, 1, 1,
0.7073717, 0.668364, 0.3071172, 1, 1, 1, 1, 1,
0.7121079, -1.596823, 2.268691, 1, 1, 1, 1, 1,
0.7128801, -2.018935, 2.431892, 1, 1, 1, 1, 1,
0.7170896, 0.3829457, 0.8412091, 1, 1, 1, 1, 1,
0.7210733, 0.4331833, 0.0572055, 1, 1, 1, 1, 1,
0.7232628, 0.3257969, 2.247214, 0, 0, 1, 1, 1,
0.7270815, 0.3386681, 0.6274841, 1, 0, 0, 1, 1,
0.7279545, -0.3195046, 2.926852, 1, 0, 0, 1, 1,
0.7334916, -0.4282837, 2.480743, 1, 0, 0, 1, 1,
0.7343426, 0.4491324, 0.4328103, 1, 0, 0, 1, 1,
0.7353799, -0.002505407, 1.821457, 1, 0, 0, 1, 1,
0.7371532, 0.1159733, 1.329265, 0, 0, 0, 1, 1,
0.7386941, -0.8537259, 3.126585, 0, 0, 0, 1, 1,
0.7401217, 0.01649685, 2.924181, 0, 0, 0, 1, 1,
0.7444524, 0.6516325, 0.07926346, 0, 0, 0, 1, 1,
0.7554701, 1.140375, 1.113157, 0, 0, 0, 1, 1,
0.7562292, 1.722924, 1.433721, 0, 0, 0, 1, 1,
0.7599172, 0.3781877, -0.4887014, 0, 0, 0, 1, 1,
0.7608348, 1.194732, -0.07329778, 1, 1, 1, 1, 1,
0.773232, 0.1796007, 1.294427, 1, 1, 1, 1, 1,
0.7762322, -1.245071, 2.160994, 1, 1, 1, 1, 1,
0.7782629, -0.4818164, 1.695535, 1, 1, 1, 1, 1,
0.7812304, 2.522619, 0.1920627, 1, 1, 1, 1, 1,
0.7829612, -1.13315, 0.586164, 1, 1, 1, 1, 1,
0.7852844, -0.6109653, 1.40142, 1, 1, 1, 1, 1,
0.7878295, -1.326548, 3.064184, 1, 1, 1, 1, 1,
0.7880462, 0.08520715, 2.889858, 1, 1, 1, 1, 1,
0.7896637, 0.9750798, -1.296532, 1, 1, 1, 1, 1,
0.7929507, -1.888836, 5.061716, 1, 1, 1, 1, 1,
0.7958362, 0.2511186, 1.924332, 1, 1, 1, 1, 1,
0.7966162, 1.813136, -0.134359, 1, 1, 1, 1, 1,
0.8055702, -0.3391742, 2.399268, 1, 1, 1, 1, 1,
0.8184253, -1.327921, 2.850521, 1, 1, 1, 1, 1,
0.8194883, 1.118429, 0.8291676, 0, 0, 1, 1, 1,
0.8210333, 0.399665, 0.7482154, 1, 0, 0, 1, 1,
0.8274627, -0.7199142, 1.701547, 1, 0, 0, 1, 1,
0.8349041, 0.90863, 3.039606, 1, 0, 0, 1, 1,
0.8390135, 0.08535483, 3.773896, 1, 0, 0, 1, 1,
0.8418424, 0.01058062, 1.095666, 1, 0, 0, 1, 1,
0.8445191, -0.2677545, 1.131126, 0, 0, 0, 1, 1,
0.8468478, 0.5464807, 0.5277247, 0, 0, 0, 1, 1,
0.8527197, 0.06132931, 3.542775, 0, 0, 0, 1, 1,
0.8534318, -0.09023171, 3.550231, 0, 0, 0, 1, 1,
0.8598893, -0.3424781, 2.149036, 0, 0, 0, 1, 1,
0.8603902, -0.8868837, 3.322263, 0, 0, 0, 1, 1,
0.8617159, -0.2549471, 1.791157, 0, 0, 0, 1, 1,
0.8630037, -0.1421343, 3.715063, 1, 1, 1, 1, 1,
0.8669622, -1.145636, 1.579627, 1, 1, 1, 1, 1,
0.8716105, 0.03134964, 1.24265, 1, 1, 1, 1, 1,
0.8837075, 0.9253467, 1.542908, 1, 1, 1, 1, 1,
0.8863024, 0.7428696, 0.8683822, 1, 1, 1, 1, 1,
0.8887069, -0.2177382, 2.442141, 1, 1, 1, 1, 1,
0.8906999, 1.477262, 1.34802, 1, 1, 1, 1, 1,
0.8961943, 1.235872, -0.2025002, 1, 1, 1, 1, 1,
0.8963051, -0.07162642, 1.435424, 1, 1, 1, 1, 1,
0.9011804, -1.210869, 3.444034, 1, 1, 1, 1, 1,
0.9020837, -0.5104287, 1.651505, 1, 1, 1, 1, 1,
0.9047652, 0.9420198, 0.07471227, 1, 1, 1, 1, 1,
0.9104612, 0.232747, 1.670096, 1, 1, 1, 1, 1,
0.91313, 0.7188634, 0.2810965, 1, 1, 1, 1, 1,
0.9310893, 0.545424, 2.222773, 1, 1, 1, 1, 1,
0.9315171, -1.399451, 1.971244, 0, 0, 1, 1, 1,
0.9370044, 1.451114, -0.06089255, 1, 0, 0, 1, 1,
0.9376536, -1.086111, 1.515581, 1, 0, 0, 1, 1,
0.9408678, -0.2054465, 1.943094, 1, 0, 0, 1, 1,
0.9458416, 0.1358629, 1.475185, 1, 0, 0, 1, 1,
0.960775, 1.356518, 1.195711, 1, 0, 0, 1, 1,
0.9611491, 0.6349022, 0.2729417, 0, 0, 0, 1, 1,
0.9657022, -1.190931, 3.81563, 0, 0, 0, 1, 1,
0.9674585, -0.3181659, 1.526205, 0, 0, 0, 1, 1,
0.9756931, -1.373725, 2.039292, 0, 0, 0, 1, 1,
0.9801289, 1.072785, -1.10334, 0, 0, 0, 1, 1,
0.9856575, -0.901435, 1.290199, 0, 0, 0, 1, 1,
0.9888262, 0.2838186, 1.262749, 0, 0, 0, 1, 1,
0.9964199, -1.548463, 3.481136, 1, 1, 1, 1, 1,
0.9977471, -0.4933831, 2.71105, 1, 1, 1, 1, 1,
0.9992293, 0.4387661, 2.232905, 1, 1, 1, 1, 1,
1.002526, 0.2255192, -0.480603, 1, 1, 1, 1, 1,
1.00402, -0.01191575, 0.1820623, 1, 1, 1, 1, 1,
1.005571, 1.347067, -0.5877391, 1, 1, 1, 1, 1,
1.005632, -0.06337067, 1.315546, 1, 1, 1, 1, 1,
1.009486, 1.279235, 0.3197647, 1, 1, 1, 1, 1,
1.011326, -0.006492868, 2.887201, 1, 1, 1, 1, 1,
1.016899, -0.04140849, 0.9890301, 1, 1, 1, 1, 1,
1.029094, 0.3849608, 1.932826, 1, 1, 1, 1, 1,
1.035295, 0.8182722, 0.7336883, 1, 1, 1, 1, 1,
1.038546, -1.450712, 1.336026, 1, 1, 1, 1, 1,
1.052705, -0.685889, 1.753197, 1, 1, 1, 1, 1,
1.059994, 0.5764045, 1.355825, 1, 1, 1, 1, 1,
1.063548, 1.699503, 0.9599351, 0, 0, 1, 1, 1,
1.068843, -1.355635, 2.958935, 1, 0, 0, 1, 1,
1.074316, -0.2462937, 2.529265, 1, 0, 0, 1, 1,
1.076817, -0.5419782, 3.29228, 1, 0, 0, 1, 1,
1.083856, -0.1370297, 0.2562753, 1, 0, 0, 1, 1,
1.086489, 1.561543, 2.431588, 1, 0, 0, 1, 1,
1.086497, -0.4300377, 2.571891, 0, 0, 0, 1, 1,
1.092218, 2.457619, 1.277623, 0, 0, 0, 1, 1,
1.098475, 0.39706, 2.315444, 0, 0, 0, 1, 1,
1.104249, 1.131832, 1.377537, 0, 0, 0, 1, 1,
1.129416, -0.4556134, 0.5105176, 0, 0, 0, 1, 1,
1.135752, -1.016717, 1.713362, 0, 0, 0, 1, 1,
1.144892, -0.8209674, 2.577076, 0, 0, 0, 1, 1,
1.149069, 0.3367771, 2.34237, 1, 1, 1, 1, 1,
1.163011, -0.5692142, 2.173422, 1, 1, 1, 1, 1,
1.163662, -0.07245009, 0.5655292, 1, 1, 1, 1, 1,
1.166333, -1.983509, 0.6699139, 1, 1, 1, 1, 1,
1.179001, -0.8082757, 3.175634, 1, 1, 1, 1, 1,
1.183064, 0.6064394, 2.496054, 1, 1, 1, 1, 1,
1.191589, -0.664555, 3.992048, 1, 1, 1, 1, 1,
1.207453, 0.7444043, 1.182676, 1, 1, 1, 1, 1,
1.210238, 0.2116109, 1.381063, 1, 1, 1, 1, 1,
1.214054, 1.208429, -1.617048, 1, 1, 1, 1, 1,
1.214357, 0.7762641, 0.5643963, 1, 1, 1, 1, 1,
1.214434, 0.9862272, 2.077966, 1, 1, 1, 1, 1,
1.227701, 0.09497232, 1.864959, 1, 1, 1, 1, 1,
1.23249, 0.473062, 1.960588, 1, 1, 1, 1, 1,
1.234146, -0.7168421, 1.620909, 1, 1, 1, 1, 1,
1.241885, -0.3297349, 0.247185, 0, 0, 1, 1, 1,
1.246365, -0.0510895, 1.957108, 1, 0, 0, 1, 1,
1.252135, 0.3727717, 2.648002, 1, 0, 0, 1, 1,
1.252481, 0.3984831, 1.176405, 1, 0, 0, 1, 1,
1.253887, 0.8900488, 0.8162054, 1, 0, 0, 1, 1,
1.260651, -0.1805151, 2.660371, 1, 0, 0, 1, 1,
1.269701, -0.1446349, 1.166036, 0, 0, 0, 1, 1,
1.271435, 1.898762, -0.6640484, 0, 0, 0, 1, 1,
1.276412, 1.552639, -1.054701, 0, 0, 0, 1, 1,
1.282564, -0.1234356, 0.9517603, 0, 0, 0, 1, 1,
1.283064, -0.1218942, 1.753647, 0, 0, 0, 1, 1,
1.315363, 0.2080029, 3.298767, 0, 0, 0, 1, 1,
1.31731, 0.5359197, 0.5284716, 0, 0, 0, 1, 1,
1.319419, -0.1278439, 2.10705, 1, 1, 1, 1, 1,
1.3228, -1.224603, 0.5526846, 1, 1, 1, 1, 1,
1.323867, -0.5420855, 0.1240604, 1, 1, 1, 1, 1,
1.332456, -0.6732672, 2.157789, 1, 1, 1, 1, 1,
1.335501, 0.7500061, 1.615756, 1, 1, 1, 1, 1,
1.344789, 0.4620999, 2.276503, 1, 1, 1, 1, 1,
1.345936, -0.7292796, 0.3140394, 1, 1, 1, 1, 1,
1.350032, -0.369472, -0.06096993, 1, 1, 1, 1, 1,
1.35351, -0.3224513, 0.4028243, 1, 1, 1, 1, 1,
1.364418, 1.143204, 0.2595362, 1, 1, 1, 1, 1,
1.364663, 1.106229, 0.8298247, 1, 1, 1, 1, 1,
1.369766, -0.811457, 2.526565, 1, 1, 1, 1, 1,
1.38038, 1.540782, 0.9371411, 1, 1, 1, 1, 1,
1.384276, 0.7949691, 0.114247, 1, 1, 1, 1, 1,
1.386852, 0.9013078, 1.228721, 1, 1, 1, 1, 1,
1.392598, -0.474581, 2.642404, 0, 0, 1, 1, 1,
1.405087, 1.020103, 0.171913, 1, 0, 0, 1, 1,
1.421665, 0.8913723, 1.986992, 1, 0, 0, 1, 1,
1.433267, 0.02576288, 0.9523326, 1, 0, 0, 1, 1,
1.473505, 2.17861, -0.1439641, 1, 0, 0, 1, 1,
1.474858, -0.447395, -0.07364526, 1, 0, 0, 1, 1,
1.479555, -0.4920546, 1.621665, 0, 0, 0, 1, 1,
1.482944, -0.08463836, 1.189933, 0, 0, 0, 1, 1,
1.492171, 0.6767043, 1.762974, 0, 0, 0, 1, 1,
1.508351, 0.1934521, 1.132836, 0, 0, 0, 1, 1,
1.508867, -1.202311, 1.452721, 0, 0, 0, 1, 1,
1.513157, 2.276171, 0.8823648, 0, 0, 0, 1, 1,
1.518973, 0.3304618, 1.593151, 0, 0, 0, 1, 1,
1.524706, -1.880917, 0.722292, 1, 1, 1, 1, 1,
1.548361, -0.3892113, 1.567095, 1, 1, 1, 1, 1,
1.555566, 0.6340449, 2.630479, 1, 1, 1, 1, 1,
1.562021, -0.3256538, -0.7414805, 1, 1, 1, 1, 1,
1.567079, -0.06143802, 2.436184, 1, 1, 1, 1, 1,
1.567581, 1.093851, 1.420249, 1, 1, 1, 1, 1,
1.592625, -0.4236542, 1.844066, 1, 1, 1, 1, 1,
1.597781, -0.2284282, 2.068524, 1, 1, 1, 1, 1,
1.62044, -0.6424404, 2.164974, 1, 1, 1, 1, 1,
1.641232, -0.606631, 0.1183348, 1, 1, 1, 1, 1,
1.651091, -1.538674, 2.535756, 1, 1, 1, 1, 1,
1.657432, 1.929899, 0.02820062, 1, 1, 1, 1, 1,
1.669421, 1.558233, -0.5393388, 1, 1, 1, 1, 1,
1.670406, 0.2917838, 3.391603, 1, 1, 1, 1, 1,
1.691689, 0.8469864, 1.479485, 1, 1, 1, 1, 1,
1.720762, 1.358156, 0.1140692, 0, 0, 1, 1, 1,
1.721464, 0.8083762, 1.494637, 1, 0, 0, 1, 1,
1.735358, 1.163305, 0.9510951, 1, 0, 0, 1, 1,
1.744687, 1.123249, 0.347222, 1, 0, 0, 1, 1,
1.825476, -0.2257974, 3.017871, 1, 0, 0, 1, 1,
1.831903, -0.8577604, 0.9032181, 1, 0, 0, 1, 1,
1.831993, -1.650259, 1.886607, 0, 0, 0, 1, 1,
1.846475, -0.04388205, 1.898857, 0, 0, 0, 1, 1,
1.846812, -0.6477173, 2.478498, 0, 0, 0, 1, 1,
1.856383, 0.8643975, -0.03708838, 0, 0, 0, 1, 1,
1.857499, 0.184803, 0.06017545, 0, 0, 0, 1, 1,
1.874832, 0.9125101, 0.9310929, 0, 0, 0, 1, 1,
1.887188, -0.4332893, 1.136013, 0, 0, 0, 1, 1,
1.910603, -0.2978481, 1.757986, 1, 1, 1, 1, 1,
1.938901, 1.315934, -1.059073, 1, 1, 1, 1, 1,
1.941473, -1.972403, 1.750112, 1, 1, 1, 1, 1,
1.949172, -0.2823417, 1.186053, 1, 1, 1, 1, 1,
1.966071, -0.2423109, 2.441156, 1, 1, 1, 1, 1,
1.995455, -0.5640424, 1.435773, 1, 1, 1, 1, 1,
1.997872, 0.6824746, 4.375254, 1, 1, 1, 1, 1,
2.029109, -0.9744622, 1.940105, 1, 1, 1, 1, 1,
2.040098, -1.390865, 1.987597, 1, 1, 1, 1, 1,
2.094826, 1.624417, 0.4479376, 1, 1, 1, 1, 1,
2.109939, 0.9152742, 0.690039, 1, 1, 1, 1, 1,
2.114403, 0.57001, 3.403467, 1, 1, 1, 1, 1,
2.169464, 0.4298473, 0.363872, 1, 1, 1, 1, 1,
2.189027, 0.005384925, -0.01669497, 1, 1, 1, 1, 1,
2.201335, 0.551556, 2.458961, 1, 1, 1, 1, 1,
2.206797, -0.2139471, 1.613935, 0, 0, 1, 1, 1,
2.220348, -0.1481308, 1.827538, 1, 0, 0, 1, 1,
2.251997, 0.8321298, 0.1022188, 1, 0, 0, 1, 1,
2.284041, -0.1391839, 1.584726, 1, 0, 0, 1, 1,
2.287939, -1.744022, 4.221203, 1, 0, 0, 1, 1,
2.310028, -0.1693667, 2.251956, 1, 0, 0, 1, 1,
2.337699, 0.3474481, 0.5433527, 0, 0, 0, 1, 1,
2.364628, -0.3796546, 0.7601062, 0, 0, 0, 1, 1,
2.554199, -0.4809706, 3.55418, 0, 0, 0, 1, 1,
2.608842, -0.09847589, 2.349123, 0, 0, 0, 1, 1,
2.610367, 0.3757946, 2.003524, 0, 0, 0, 1, 1,
2.613598, 1.830926, 1.012568, 0, 0, 0, 1, 1,
2.70945, -0.4928305, 2.026012, 0, 0, 0, 1, 1,
2.745849, 0.7839075, -0.02010753, 1, 1, 1, 1, 1,
2.755905, 1.614101, 0.2226228, 1, 1, 1, 1, 1,
2.784853, -2.430602, 3.741585, 1, 1, 1, 1, 1,
2.81421, -0.9206601, 1.270139, 1, 1, 1, 1, 1,
2.925028, 0.453557, 1.254528, 1, 1, 1, 1, 1,
2.930447, 1.936345, 0.7296095, 1, 1, 1, 1, 1,
3.073932, -0.03061901, 2.313378, 1, 1, 1, 1, 1
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
var radius = 9.382375;
var distance = 32.95519;
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
mvMatrix.translate( 0.2183406, 0.3602169, -0.02382827 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.95519);
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
