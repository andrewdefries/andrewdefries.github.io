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
-4.131153, -0.4492035, -1.453495, 1, 0, 0, 1,
-3.048242, 0.7175987, -1.082266, 1, 0.007843138, 0, 1,
-2.699667, 0.248106, -4.872027, 1, 0.01176471, 0, 1,
-2.516575, 0.598257, -1.481206, 1, 0.01960784, 0, 1,
-2.487107, -0.69287, -3.243413, 1, 0.02352941, 0, 1,
-2.464551, 0.2523012, -2.583831, 1, 0.03137255, 0, 1,
-2.443435, -0.9223534, -1.101477, 1, 0.03529412, 0, 1,
-2.423675, 0.7235807, -1.612637, 1, 0.04313726, 0, 1,
-2.396263, -0.0443849, -1.394541, 1, 0.04705882, 0, 1,
-2.3935, -0.2856339, -0.8885999, 1, 0.05490196, 0, 1,
-2.380059, 0.3774843, 0.3121261, 1, 0.05882353, 0, 1,
-2.33316, 1.509392, -2.261323, 1, 0.06666667, 0, 1,
-2.314125, -0.5876757, -1.371988, 1, 0.07058824, 0, 1,
-2.266766, -0.1475224, -1.825087, 1, 0.07843138, 0, 1,
-2.242398, -0.2878177, -3.197371, 1, 0.08235294, 0, 1,
-2.224133, -0.5206594, 0.03896794, 1, 0.09019608, 0, 1,
-2.222136, -0.912264, 0.1146737, 1, 0.09411765, 0, 1,
-2.180925, 1.435385, -1.918058, 1, 0.1019608, 0, 1,
-2.175409, 0.1681737, -2.1343, 1, 0.1098039, 0, 1,
-2.164943, 0.709608, -1.262097, 1, 0.1137255, 0, 1,
-2.069467, 0.9803437, -0.5722998, 1, 0.1215686, 0, 1,
-2.064534, -2.145263, -2.523865, 1, 0.1254902, 0, 1,
-2.048886, -1.070341, -1.734144, 1, 0.1333333, 0, 1,
-2.04064, 1.682443, -1.902699, 1, 0.1372549, 0, 1,
-2.039236, 0.7512985, -1.964148, 1, 0.145098, 0, 1,
-2.024871, -1.119428, -1.779856, 1, 0.1490196, 0, 1,
-1.895362, 1.051911, -2.171732, 1, 0.1568628, 0, 1,
-1.890376, -0.07098831, 0.3662012, 1, 0.1607843, 0, 1,
-1.84684, -0.9620924, -3.184786, 1, 0.1686275, 0, 1,
-1.846763, -1.178711, -1.133441, 1, 0.172549, 0, 1,
-1.824694, -1.20239, -1.724239, 1, 0.1803922, 0, 1,
-1.792585, 0.5440143, -2.711659, 1, 0.1843137, 0, 1,
-1.780712, 0.9004366, -0.3107819, 1, 0.1921569, 0, 1,
-1.756029, -0.7486271, -2.666663, 1, 0.1960784, 0, 1,
-1.71949, 0.148229, -0.3896962, 1, 0.2039216, 0, 1,
-1.719186, -1.169497, -2.833476, 1, 0.2117647, 0, 1,
-1.684936, -1.605595, -0.2893361, 1, 0.2156863, 0, 1,
-1.684633, 0.4721599, -0.7918865, 1, 0.2235294, 0, 1,
-1.675943, 0.3896616, -2.925252, 1, 0.227451, 0, 1,
-1.663212, -0.4173751, -2.221941, 1, 0.2352941, 0, 1,
-1.655704, -0.1376362, -2.40351, 1, 0.2392157, 0, 1,
-1.646126, -1.105175, -2.282567, 1, 0.2470588, 0, 1,
-1.640063, 0.3171656, -1.2826, 1, 0.2509804, 0, 1,
-1.637421, 0.3346773, -0.6942967, 1, 0.2588235, 0, 1,
-1.617583, 0.4423491, -1.74437, 1, 0.2627451, 0, 1,
-1.617048, 1.889055, -0.1793091, 1, 0.2705882, 0, 1,
-1.612793, 1.139756, 0.5555078, 1, 0.2745098, 0, 1,
-1.611513, 1.066902, -0.5594816, 1, 0.282353, 0, 1,
-1.60714, -0.2847725, -2.128422, 1, 0.2862745, 0, 1,
-1.601542, -1.017319, -3.315861, 1, 0.2941177, 0, 1,
-1.601377, -0.8052683, -1.975283, 1, 0.3019608, 0, 1,
-1.59461, 0.9907928, -0.4519685, 1, 0.3058824, 0, 1,
-1.585765, -2.11885, -3.146844, 1, 0.3137255, 0, 1,
-1.585069, 0.7336953, -1.769448, 1, 0.3176471, 0, 1,
-1.572349, 0.8030603, 0.373224, 1, 0.3254902, 0, 1,
-1.554885, 1.006549, 0.1614876, 1, 0.3294118, 0, 1,
-1.552459, 1.339879, 0.5801055, 1, 0.3372549, 0, 1,
-1.545892, -0.5569933, -2.144353, 1, 0.3411765, 0, 1,
-1.526867, 0.4365982, -1.255245, 1, 0.3490196, 0, 1,
-1.521046, -0.1130571, -1.238902, 1, 0.3529412, 0, 1,
-1.517062, 0.2306471, -1.893297, 1, 0.3607843, 0, 1,
-1.512549, -0.3757418, -2.515564, 1, 0.3647059, 0, 1,
-1.510994, 0.94677, -0.523427, 1, 0.372549, 0, 1,
-1.509863, 0.5168375, -3.349354, 1, 0.3764706, 0, 1,
-1.501152, 1.487963, -1.058833, 1, 0.3843137, 0, 1,
-1.483554, -0.5277277, -0.4745083, 1, 0.3882353, 0, 1,
-1.462685, -0.6926559, -1.744133, 1, 0.3960784, 0, 1,
-1.462485, 0.6588303, -1.708739, 1, 0.4039216, 0, 1,
-1.446095, 0.2660999, -0.4088076, 1, 0.4078431, 0, 1,
-1.444632, -0.866787, -1.477374, 1, 0.4156863, 0, 1,
-1.442524, -0.6770477, -1.870507, 1, 0.4196078, 0, 1,
-1.42864, -1.397136, -1.691286, 1, 0.427451, 0, 1,
-1.422691, -0.7299815, -2.31986, 1, 0.4313726, 0, 1,
-1.422101, 0.234405, -2.752978, 1, 0.4392157, 0, 1,
-1.419461, -0.0140503, 0.01276954, 1, 0.4431373, 0, 1,
-1.389865, -0.184904, -1.659562, 1, 0.4509804, 0, 1,
-1.370566, 0.5042065, -1.482338, 1, 0.454902, 0, 1,
-1.366854, 0.4819913, -2.568333, 1, 0.4627451, 0, 1,
-1.364921, 0.138409, -1.418943, 1, 0.4666667, 0, 1,
-1.364545, -0.1992968, -0.1870331, 1, 0.4745098, 0, 1,
-1.354238, -1.048763, -0.4870094, 1, 0.4784314, 0, 1,
-1.352118, -2.564735, -1.165428, 1, 0.4862745, 0, 1,
-1.348856, 0.1194089, -0.01079138, 1, 0.4901961, 0, 1,
-1.34576, -0.02391552, -1.879338, 1, 0.4980392, 0, 1,
-1.33622, 1.586164, 0.3189408, 1, 0.5058824, 0, 1,
-1.327902, -0.4332066, -2.601857, 1, 0.509804, 0, 1,
-1.319906, -1.746772, -2.537645, 1, 0.5176471, 0, 1,
-1.315947, 0.6251951, -3.601414, 1, 0.5215687, 0, 1,
-1.295662, -1.147317, -3.026844, 1, 0.5294118, 0, 1,
-1.295072, 1.463823, 0.5308352, 1, 0.5333334, 0, 1,
-1.293287, 0.5554758, -1.447029, 1, 0.5411765, 0, 1,
-1.291151, 1.144624, -0.2398931, 1, 0.5450981, 0, 1,
-1.285157, 0.717788, -2.440012, 1, 0.5529412, 0, 1,
-1.284878, 1.122759, -2.314892, 1, 0.5568628, 0, 1,
-1.284333, 1.549456, 0.7609002, 1, 0.5647059, 0, 1,
-1.268655, -0.5547923, -1.794197, 1, 0.5686275, 0, 1,
-1.268346, 1.379957, 0.2482314, 1, 0.5764706, 0, 1,
-1.255188, -0.2622569, -2.951212, 1, 0.5803922, 0, 1,
-1.24698, 0.574474, -1.181238, 1, 0.5882353, 0, 1,
-1.232824, -1.020263, -1.726789, 1, 0.5921569, 0, 1,
-1.215208, -0.05705716, -0.8243496, 1, 0.6, 0, 1,
-1.207448, 1.437782, -0.8819144, 1, 0.6078432, 0, 1,
-1.206069, -0.8955672, -2.00202, 1, 0.6117647, 0, 1,
-1.195424, 0.07496792, -1.322816, 1, 0.6196079, 0, 1,
-1.195121, 1.446788, 0.989791, 1, 0.6235294, 0, 1,
-1.194005, 1.290935, 1.122675, 1, 0.6313726, 0, 1,
-1.189323, 1.080616, -0.7715595, 1, 0.6352941, 0, 1,
-1.173056, -0.6206908, -2.137625, 1, 0.6431373, 0, 1,
-1.171584, -1.295613, -2.899058, 1, 0.6470588, 0, 1,
-1.170753, -0.5270148, -1.512329, 1, 0.654902, 0, 1,
-1.16693, -0.5959578, -4.230547, 1, 0.6588235, 0, 1,
-1.161014, 0.5042444, -1.644805, 1, 0.6666667, 0, 1,
-1.157112, -0.04701433, -1.38004, 1, 0.6705883, 0, 1,
-1.152802, -0.5821574, -1.515368, 1, 0.6784314, 0, 1,
-1.150091, -1.409724, -1.870496, 1, 0.682353, 0, 1,
-1.135833, -0.9061137, -2.561118, 1, 0.6901961, 0, 1,
-1.135263, -0.7047852, -0.5012854, 1, 0.6941177, 0, 1,
-1.134274, -0.1230298, -0.03804263, 1, 0.7019608, 0, 1,
-1.134155, 1.635305, -1.849683, 1, 0.7098039, 0, 1,
-1.123176, 0.01099177, -0.8203723, 1, 0.7137255, 0, 1,
-1.117501, -1.65924, -2.848531, 1, 0.7215686, 0, 1,
-1.117197, 0.3549455, -2.371592, 1, 0.7254902, 0, 1,
-1.105257, 0.05979774, -2.933208, 1, 0.7333333, 0, 1,
-1.087171, -0.04793418, -2.374769, 1, 0.7372549, 0, 1,
-1.077005, 0.8561468, -1.025864, 1, 0.7450981, 0, 1,
-1.076001, 1.4997, -2.199878, 1, 0.7490196, 0, 1,
-1.075662, 0.765944, -0.5807069, 1, 0.7568628, 0, 1,
-1.073842, 0.439592, -0.1700488, 1, 0.7607843, 0, 1,
-1.073076, -1.422979, -3.132073, 1, 0.7686275, 0, 1,
-1.071803, -0.2790129, -0.8400304, 1, 0.772549, 0, 1,
-1.069257, 1.24861, 0.06740408, 1, 0.7803922, 0, 1,
-1.066325, 0.1849719, 0.5437557, 1, 0.7843137, 0, 1,
-1.064402, -0.9799476, -2.967357, 1, 0.7921569, 0, 1,
-1.06222, 0.2827172, -3.143672, 1, 0.7960784, 0, 1,
-1.057814, -0.2240119, -3.551401, 1, 0.8039216, 0, 1,
-1.057626, 0.4329098, -3.274008, 1, 0.8117647, 0, 1,
-1.055299, 0.04353995, -2.098668, 1, 0.8156863, 0, 1,
-1.05364, 1.786561, 1.991041, 1, 0.8235294, 0, 1,
-1.049645, 0.2909918, -0.9270288, 1, 0.827451, 0, 1,
-1.038837, -1.532814, 0.284967, 1, 0.8352941, 0, 1,
-1.034603, 1.551103, -2.508499, 1, 0.8392157, 0, 1,
-1.033073, -0.7755483, -2.542591, 1, 0.8470588, 0, 1,
-1.032298, -0.7202328, -3.879134, 1, 0.8509804, 0, 1,
-1.016583, 1.727846, -1.746891, 1, 0.8588235, 0, 1,
-1.011863, -0.4550948, -1.662953, 1, 0.8627451, 0, 1,
-1.005565, -0.04500927, -2.243683, 1, 0.8705882, 0, 1,
-0.9958849, 3.050297, -0.1049131, 1, 0.8745098, 0, 1,
-0.9916457, -0.3723595, -3.124317, 1, 0.8823529, 0, 1,
-0.9769866, -0.9352096, -0.9178948, 1, 0.8862745, 0, 1,
-0.9751657, 0.4722059, -3.324383, 1, 0.8941177, 0, 1,
-0.9695742, -0.7968969, -2.707051, 1, 0.8980392, 0, 1,
-0.9651641, 0.5190752, -2.426341, 1, 0.9058824, 0, 1,
-0.9626677, 0.4119421, -1.431701, 1, 0.9137255, 0, 1,
-0.9569139, -0.821954, -3.155805, 1, 0.9176471, 0, 1,
-0.9511982, 0.3934253, -2.554645, 1, 0.9254902, 0, 1,
-0.9511102, -0.1257856, -1.159421, 1, 0.9294118, 0, 1,
-0.9474959, 0.5313666, -1.612504, 1, 0.9372549, 0, 1,
-0.9469227, 1.411839, -0.5519316, 1, 0.9411765, 0, 1,
-0.9382394, 1.790827, -0.4613225, 1, 0.9490196, 0, 1,
-0.9367849, 0.1792519, -0.5876288, 1, 0.9529412, 0, 1,
-0.926985, 1.157896, -0.2032383, 1, 0.9607843, 0, 1,
-0.92546, -0.09853345, -2.05181, 1, 0.9647059, 0, 1,
-0.9135637, 0.227779, -2.176776, 1, 0.972549, 0, 1,
-0.9126787, -0.5817111, -1.534971, 1, 0.9764706, 0, 1,
-0.9123471, -1.143566, -1.70774, 1, 0.9843137, 0, 1,
-0.9102333, 0.3598716, -2.377749, 1, 0.9882353, 0, 1,
-0.9089772, 0.1176274, -2.586645, 1, 0.9960784, 0, 1,
-0.9061664, 0.3264185, -1.942508, 0.9960784, 1, 0, 1,
-0.905495, -1.320538, -3.976136, 0.9921569, 1, 0, 1,
-0.897633, -0.1827406, -0.8151494, 0.9843137, 1, 0, 1,
-0.8961129, 0.008546818, -1.484053, 0.9803922, 1, 0, 1,
-0.8953582, 0.936649, -0.01586611, 0.972549, 1, 0, 1,
-0.8800909, 1.528263, -0.5104939, 0.9686275, 1, 0, 1,
-0.872771, -0.8685259, -3.062148, 0.9607843, 1, 0, 1,
-0.8650821, -1.094705, -1.908353, 0.9568627, 1, 0, 1,
-0.8639627, 0.02085613, -1.557163, 0.9490196, 1, 0, 1,
-0.8621871, 1.120995, -0.1384756, 0.945098, 1, 0, 1,
-0.8613724, 0.0930765, -0.08764458, 0.9372549, 1, 0, 1,
-0.8613238, -0.08535992, -0.7021523, 0.9333333, 1, 0, 1,
-0.8601701, 0.1849729, -0.7100218, 0.9254902, 1, 0, 1,
-0.8591273, 1.198225, -0.9887996, 0.9215686, 1, 0, 1,
-0.8571134, -0.03221595, -1.590394, 0.9137255, 1, 0, 1,
-0.8551664, 0.353839, -0.6477551, 0.9098039, 1, 0, 1,
-0.8492315, 1.266788, -1.970998, 0.9019608, 1, 0, 1,
-0.8453242, 0.8651855, -1.162341, 0.8941177, 1, 0, 1,
-0.8305309, -0.6793023, -1.407655, 0.8901961, 1, 0, 1,
-0.8302791, -0.04474279, -2.66108, 0.8823529, 1, 0, 1,
-0.8288758, 0.6555162, -2.644945, 0.8784314, 1, 0, 1,
-0.8258659, 0.7341962, -0.7749201, 0.8705882, 1, 0, 1,
-0.8250461, 2.314454, 1.510276, 0.8666667, 1, 0, 1,
-0.8208681, -0.0324198, -0.3216166, 0.8588235, 1, 0, 1,
-0.819851, 0.3067167, -3.530116, 0.854902, 1, 0, 1,
-0.8169743, 0.380082, -1.875641, 0.8470588, 1, 0, 1,
-0.8139488, -0.3722442, -1.815519, 0.8431373, 1, 0, 1,
-0.8093327, 0.719987, -1.466854, 0.8352941, 1, 0, 1,
-0.8066918, 0.920658, -0.05675118, 0.8313726, 1, 0, 1,
-0.8008832, 1.679059, -1.412926, 0.8235294, 1, 0, 1,
-0.8006013, -0.3913904, -3.174795, 0.8196079, 1, 0, 1,
-0.7946066, -1.532245, -3.045142, 0.8117647, 1, 0, 1,
-0.7945481, -0.4785028, -1.299314, 0.8078431, 1, 0, 1,
-0.7918355, -0.1298752, -2.207116, 0.8, 1, 0, 1,
-0.7909997, -0.05187917, -3.064724, 0.7921569, 1, 0, 1,
-0.7888055, 0.4645039, 0.02624727, 0.7882353, 1, 0, 1,
-0.7857, 0.3245345, -1.3376, 0.7803922, 1, 0, 1,
-0.7757252, -1.309929, -3.329096, 0.7764706, 1, 0, 1,
-0.7744819, -0.7278634, -1.487192, 0.7686275, 1, 0, 1,
-0.773439, -1.185579, -3.650908, 0.7647059, 1, 0, 1,
-0.7725346, -0.2079062, -2.286247, 0.7568628, 1, 0, 1,
-0.767357, -1.1531, -2.827754, 0.7529412, 1, 0, 1,
-0.7661435, -1.409106, -1.744133, 0.7450981, 1, 0, 1,
-0.7619366, 0.2586469, -1.911222, 0.7411765, 1, 0, 1,
-0.7610779, 1.340064, 0.2327862, 0.7333333, 1, 0, 1,
-0.7607448, -0.8530188, -2.176148, 0.7294118, 1, 0, 1,
-0.7600406, -0.4248559, -2.813864, 0.7215686, 1, 0, 1,
-0.7530067, 0.7235203, -0.6469508, 0.7176471, 1, 0, 1,
-0.7506104, 0.1196436, -0.7350016, 0.7098039, 1, 0, 1,
-0.7488607, -1.3915, -2.252498, 0.7058824, 1, 0, 1,
-0.7438756, -0.636025, -1.314456, 0.6980392, 1, 0, 1,
-0.742419, 0.02571934, -1.471537, 0.6901961, 1, 0, 1,
-0.7423342, 0.8193154, -1.108176, 0.6862745, 1, 0, 1,
-0.7394704, 0.5718099, -0.4702841, 0.6784314, 1, 0, 1,
-0.7394202, -0.2429301, -0.416172, 0.6745098, 1, 0, 1,
-0.7391443, -1.163573, -3.18788, 0.6666667, 1, 0, 1,
-0.7391377, -0.3947225, -1.505042, 0.6627451, 1, 0, 1,
-0.7368666, -1.342888, -3.884447, 0.654902, 1, 0, 1,
-0.7363141, -2.002171, -3.561248, 0.6509804, 1, 0, 1,
-0.7305263, -1.679458, -3.6933, 0.6431373, 1, 0, 1,
-0.7298717, 1.134032, 0.6768088, 0.6392157, 1, 0, 1,
-0.7247092, 1.052011, -0.8441576, 0.6313726, 1, 0, 1,
-0.7156315, -0.4104957, -2.438967, 0.627451, 1, 0, 1,
-0.7142673, 2.098322, -0.4123421, 0.6196079, 1, 0, 1,
-0.7116773, 0.8635467, -2.055386, 0.6156863, 1, 0, 1,
-0.7111765, -0.8311163, -1.305735, 0.6078432, 1, 0, 1,
-0.7108229, 1.036347, 1.598839, 0.6039216, 1, 0, 1,
-0.709596, 1.402322, 0.856589, 0.5960785, 1, 0, 1,
-0.7042586, -1.27213, -3.419303, 0.5882353, 1, 0, 1,
-0.692812, 1.340754, -1.408947, 0.5843138, 1, 0, 1,
-0.6927137, -0.1797194, -1.849873, 0.5764706, 1, 0, 1,
-0.6916986, 0.4146293, -1.194867, 0.572549, 1, 0, 1,
-0.6912982, -0.8910246, -1.041111, 0.5647059, 1, 0, 1,
-0.6888813, 2.089814, 0.5095055, 0.5607843, 1, 0, 1,
-0.6846933, 0.007903904, -0.7488044, 0.5529412, 1, 0, 1,
-0.6829685, -0.5385504, -1.910002, 0.5490196, 1, 0, 1,
-0.6660667, -0.9979991, -2.928078, 0.5411765, 1, 0, 1,
-0.6581932, -1.558876, -2.831044, 0.5372549, 1, 0, 1,
-0.657163, 1.812173, 0.4879788, 0.5294118, 1, 0, 1,
-0.6567259, -1.163056, -2.691188, 0.5254902, 1, 0, 1,
-0.6553425, -1.136147, -1.754596, 0.5176471, 1, 0, 1,
-0.6549777, 0.2886108, -2.292978, 0.5137255, 1, 0, 1,
-0.6512471, -0.9856305, -3.250205, 0.5058824, 1, 0, 1,
-0.6484749, -0.5344487, -2.131747, 0.5019608, 1, 0, 1,
-0.6483232, -1.194527, -2.13877, 0.4941176, 1, 0, 1,
-0.6437989, -2.566069, -4.386219, 0.4862745, 1, 0, 1,
-0.6380517, -0.7043576, -0.8858739, 0.4823529, 1, 0, 1,
-0.6367301, -1.707259, -3.529925, 0.4745098, 1, 0, 1,
-0.6323828, 0.688378, 0.06923522, 0.4705882, 1, 0, 1,
-0.6248953, 1.223027, 0.3810044, 0.4627451, 1, 0, 1,
-0.6215797, 0.8417453, 0.8933001, 0.4588235, 1, 0, 1,
-0.6159829, 0.5506335, -1.673289, 0.4509804, 1, 0, 1,
-0.6158065, -0.6324497, -2.298077, 0.4470588, 1, 0, 1,
-0.615629, 0.04092225, -1.372531, 0.4392157, 1, 0, 1,
-0.6057082, -0.3779675, -1.737581, 0.4352941, 1, 0, 1,
-0.6049195, 0.2635641, -0.5774788, 0.427451, 1, 0, 1,
-0.6045459, 2.789568, -2.443628, 0.4235294, 1, 0, 1,
-0.6018645, -0.728688, -2.905513, 0.4156863, 1, 0, 1,
-0.5977031, 0.01546265, -0.5868002, 0.4117647, 1, 0, 1,
-0.5920954, -3.331395, -2.951233, 0.4039216, 1, 0, 1,
-0.5903867, -1.070428, -3.616762, 0.3960784, 1, 0, 1,
-0.5881123, 1.088602, -0.09674818, 0.3921569, 1, 0, 1,
-0.5849429, -0.4288943, -2.169401, 0.3843137, 1, 0, 1,
-0.5791428, 0.3346201, -1.838374, 0.3803922, 1, 0, 1,
-0.5713655, 1.332175, -0.6380178, 0.372549, 1, 0, 1,
-0.5710244, -0.1444193, -2.617331, 0.3686275, 1, 0, 1,
-0.5685981, 1.255783, -0.5932086, 0.3607843, 1, 0, 1,
-0.567808, -0.4240685, -0.5148845, 0.3568628, 1, 0, 1,
-0.5656303, 0.4223641, -1.287717, 0.3490196, 1, 0, 1,
-0.5602629, -1.778876, -4.351174, 0.345098, 1, 0, 1,
-0.5571927, 1.181357, 0.294693, 0.3372549, 1, 0, 1,
-0.5558485, 1.101137, -0.7328179, 0.3333333, 1, 0, 1,
-0.5557779, -0.5954223, -0.9578854, 0.3254902, 1, 0, 1,
-0.5482699, 0.8012335, -0.8723835, 0.3215686, 1, 0, 1,
-0.5479292, 0.09927741, -1.007902, 0.3137255, 1, 0, 1,
-0.5471904, -0.2978277, -0.7001998, 0.3098039, 1, 0, 1,
-0.5453911, -0.0845553, -2.681379, 0.3019608, 1, 0, 1,
-0.5449759, 0.322379, -1.667535, 0.2941177, 1, 0, 1,
-0.5435629, 0.4867239, 0.08160622, 0.2901961, 1, 0, 1,
-0.5417641, -1.754824, -2.063925, 0.282353, 1, 0, 1,
-0.5399217, 2.122094, 0.3303682, 0.2784314, 1, 0, 1,
-0.5336049, 0.8176641, -1.13445, 0.2705882, 1, 0, 1,
-0.5331885, 1.063425, -0.4766472, 0.2666667, 1, 0, 1,
-0.5310247, 0.4870908, -0.6318821, 0.2588235, 1, 0, 1,
-0.5287608, 1.742788, -1.245849, 0.254902, 1, 0, 1,
-0.5281302, -0.02689286, -1.466217, 0.2470588, 1, 0, 1,
-0.5234485, 0.006327014, -2.688712, 0.2431373, 1, 0, 1,
-0.5130726, 0.1303628, -2.802767, 0.2352941, 1, 0, 1,
-0.5079648, -0.3894087, -1.353507, 0.2313726, 1, 0, 1,
-0.5058579, -0.70829, -2.112179, 0.2235294, 1, 0, 1,
-0.5058183, -0.8569626, -0.5288711, 0.2196078, 1, 0, 1,
-0.505397, 1.091253, -1.894489, 0.2117647, 1, 0, 1,
-0.5035929, -1.737483, -3.109854, 0.2078431, 1, 0, 1,
-0.4975558, 1.414548, -1.896312, 0.2, 1, 0, 1,
-0.4861819, -1.014432, -5.008506, 0.1921569, 1, 0, 1,
-0.4819973, -1.00377, -2.263594, 0.1882353, 1, 0, 1,
-0.4803888, 2.082264, 0.3847201, 0.1803922, 1, 0, 1,
-0.4800832, -0.08071432, -0.6155833, 0.1764706, 1, 0, 1,
-0.4770664, 1.62796, 3.116792, 0.1686275, 1, 0, 1,
-0.4759577, 0.4855325, -0.07710338, 0.1647059, 1, 0, 1,
-0.4715573, 0.2331723, -0.2105864, 0.1568628, 1, 0, 1,
-0.4712134, -0.4073929, -1.352278, 0.1529412, 1, 0, 1,
-0.4641703, -1.559111, -3.461032, 0.145098, 1, 0, 1,
-0.461396, 1.394839, -1.352377, 0.1411765, 1, 0, 1,
-0.460723, 1.936457, -0.7486477, 0.1333333, 1, 0, 1,
-0.4603491, 0.2617992, -1.707446, 0.1294118, 1, 0, 1,
-0.4582958, -0.8280489, -3.301804, 0.1215686, 1, 0, 1,
-0.458103, -0.780186, -0.9094124, 0.1176471, 1, 0, 1,
-0.4572765, -0.795608, -2.073602, 0.1098039, 1, 0, 1,
-0.4572203, -0.0371732, -1.517587, 0.1058824, 1, 0, 1,
-0.4528667, 1.262554, -0.7833832, 0.09803922, 1, 0, 1,
-0.4523306, -0.2313103, -3.45742, 0.09019608, 1, 0, 1,
-0.4462615, -0.1839163, -2.696257, 0.08627451, 1, 0, 1,
-0.4452034, -0.3042953, -1.304585, 0.07843138, 1, 0, 1,
-0.441187, 1.03921, -1.322581, 0.07450981, 1, 0, 1,
-0.4402395, 1.234985, -2.081434, 0.06666667, 1, 0, 1,
-0.4399494, 0.5773385, -0.4023326, 0.0627451, 1, 0, 1,
-0.4309169, -1.347358, -4.62333, 0.05490196, 1, 0, 1,
-0.4265569, 0.4444025, 1.299705, 0.05098039, 1, 0, 1,
-0.4246278, -0.484322, -4.012979, 0.04313726, 1, 0, 1,
-0.4243634, 0.616178, -1.317551, 0.03921569, 1, 0, 1,
-0.4242418, -0.2817421, -3.885682, 0.03137255, 1, 0, 1,
-0.4225031, -0.2252872, -1.043563, 0.02745098, 1, 0, 1,
-0.4217831, -0.4547971, -3.050245, 0.01960784, 1, 0, 1,
-0.4216351, 3.696416, -1.002231, 0.01568628, 1, 0, 1,
-0.4202988, 0.2467818, -2.071241, 0.007843138, 1, 0, 1,
-0.413592, 0.2605864, -1.842092, 0.003921569, 1, 0, 1,
-0.4118626, -0.2635471, -1.443278, 0, 1, 0.003921569, 1,
-0.4100585, -1.925768, -3.174255, 0, 1, 0.01176471, 1,
-0.4094039, 0.5897369, 0.7996609, 0, 1, 0.01568628, 1,
-0.4078017, -2.793374, -2.117355, 0, 1, 0.02352941, 1,
-0.4051942, -0.2084232, -0.8745486, 0, 1, 0.02745098, 1,
-0.3984866, -0.1094775, -2.920538, 0, 1, 0.03529412, 1,
-0.3969596, 1.364534, -1.716197, 0, 1, 0.03921569, 1,
-0.3961461, 0.513514, -2.72652, 0, 1, 0.04705882, 1,
-0.3957127, 1.095383, -1.434862, 0, 1, 0.05098039, 1,
-0.3915162, 1.342561, -1.886905, 0, 1, 0.05882353, 1,
-0.3902137, -1.601239, -3.35027, 0, 1, 0.0627451, 1,
-0.388894, -0.3948824, -3.037852, 0, 1, 0.07058824, 1,
-0.3857583, -1.102378, -4.01969, 0, 1, 0.07450981, 1,
-0.3826327, 1.628999, -0.3487199, 0, 1, 0.08235294, 1,
-0.3802596, -1.316904, -4.319061, 0, 1, 0.08627451, 1,
-0.3791357, 0.147464, -1.914732, 0, 1, 0.09411765, 1,
-0.3740738, 0.7224301, -0.5609441, 0, 1, 0.1019608, 1,
-0.3736209, -0.4346664, -0.6737678, 0, 1, 0.1058824, 1,
-0.3716389, 0.008860331, -2.057076, 0, 1, 0.1137255, 1,
-0.3671352, 0.1995212, -0.6779252, 0, 1, 0.1176471, 1,
-0.3665653, -0.2468262, -3.332129, 0, 1, 0.1254902, 1,
-0.3664614, 1.935239, -0.04914704, 0, 1, 0.1294118, 1,
-0.3620589, -0.3032093, -2.293788, 0, 1, 0.1372549, 1,
-0.3617728, 2.296051, -0.2576199, 0, 1, 0.1411765, 1,
-0.3612426, -0.6588544, -2.16761, 0, 1, 0.1490196, 1,
-0.360028, -0.2097333, -0.2640015, 0, 1, 0.1529412, 1,
-0.3544675, -1.25932, -2.697364, 0, 1, 0.1607843, 1,
-0.3541103, -0.5639383, -0.7919791, 0, 1, 0.1647059, 1,
-0.3503245, 1.371751, -1.819264, 0, 1, 0.172549, 1,
-0.3469811, -2.620112, -1.055421, 0, 1, 0.1764706, 1,
-0.3441865, 0.2444864, 0.2662373, 0, 1, 0.1843137, 1,
-0.3375123, -0.6566091, -1.557837, 0, 1, 0.1882353, 1,
-0.3371502, -0.2407513, -2.431924, 0, 1, 0.1960784, 1,
-0.3370668, 0.5457719, -0.7599306, 0, 1, 0.2039216, 1,
-0.3345077, -1.692146, -3.308963, 0, 1, 0.2078431, 1,
-0.3334477, 0.6181415, -0.1871942, 0, 1, 0.2156863, 1,
-0.3307257, 0.4821127, -0.1124878, 0, 1, 0.2196078, 1,
-0.3298588, -1.403613, -1.962898, 0, 1, 0.227451, 1,
-0.3294888, -1.341529, -4.778447, 0, 1, 0.2313726, 1,
-0.3259492, 0.1771518, -1.0819, 0, 1, 0.2392157, 1,
-0.3211212, 0.01478334, -1.981124, 0, 1, 0.2431373, 1,
-0.3151225, -0.5241041, -2.855266, 0, 1, 0.2509804, 1,
-0.314671, -1.609442, -1.8719, 0, 1, 0.254902, 1,
-0.3143078, -0.130466, -2.23148, 0, 1, 0.2627451, 1,
-0.3131365, -0.0294566, -2.681983, 0, 1, 0.2666667, 1,
-0.3113665, 0.5158224, -1.241986, 0, 1, 0.2745098, 1,
-0.3101258, -0.5168072, -2.031324, 0, 1, 0.2784314, 1,
-0.3057506, 0.6390124, -1.652389, 0, 1, 0.2862745, 1,
-0.3015306, -0.6386046, -3.643471, 0, 1, 0.2901961, 1,
-0.2998174, -0.2867799, -1.966099, 0, 1, 0.2980392, 1,
-0.2954222, -0.03524273, -0.9589895, 0, 1, 0.3058824, 1,
-0.2946374, 1.934524, -0.3744839, 0, 1, 0.3098039, 1,
-0.2933771, -0.9574987, -2.35117, 0, 1, 0.3176471, 1,
-0.2897966, 0.2433249, -0.2857146, 0, 1, 0.3215686, 1,
-0.2826848, -0.7775095, -3.258485, 0, 1, 0.3294118, 1,
-0.2772558, 2.269407, -0.1247925, 0, 1, 0.3333333, 1,
-0.2752622, 1.271016, -2.054145, 0, 1, 0.3411765, 1,
-0.2739037, -1.493836, -2.014177, 0, 1, 0.345098, 1,
-0.2735289, 1.679706, -1.106711, 0, 1, 0.3529412, 1,
-0.2721606, -0.8527474, -4.130578, 0, 1, 0.3568628, 1,
-0.2694154, 0.5995634, -1.059659, 0, 1, 0.3647059, 1,
-0.2681035, -0.3777299, -1.85345, 0, 1, 0.3686275, 1,
-0.2648969, 0.1746442, -1.185998, 0, 1, 0.3764706, 1,
-0.2648661, -0.01782871, -2.423206, 0, 1, 0.3803922, 1,
-0.259701, 1.54852, -1.333521, 0, 1, 0.3882353, 1,
-0.2585379, -1.922871, -2.091892, 0, 1, 0.3921569, 1,
-0.2579219, 1.493522, 1.298423, 0, 1, 0.4, 1,
-0.2546322, 0.5565611, 0.6082882, 0, 1, 0.4078431, 1,
-0.2519853, 0.713751, -1.412135, 0, 1, 0.4117647, 1,
-0.2510883, 1.301491, -0.2479729, 0, 1, 0.4196078, 1,
-0.2500846, 0.1999354, -1.292245, 0, 1, 0.4235294, 1,
-0.2473768, -0.02581532, -3.995013, 0, 1, 0.4313726, 1,
-0.2414827, 0.701059, 0.05255451, 0, 1, 0.4352941, 1,
-0.2410274, -1.743068, -3.858225, 0, 1, 0.4431373, 1,
-0.2381068, -0.6439329, -2.043297, 0, 1, 0.4470588, 1,
-0.2362572, -0.6698788, -2.816496, 0, 1, 0.454902, 1,
-0.2359512, -1.071631, -1.527286, 0, 1, 0.4588235, 1,
-0.2348776, -1.177373, -3.355305, 0, 1, 0.4666667, 1,
-0.2317048, 0.9606602, -0.2559608, 0, 1, 0.4705882, 1,
-0.2212923, -0.2971307, -2.677119, 0, 1, 0.4784314, 1,
-0.2204999, -0.2601165, -2.502128, 0, 1, 0.4823529, 1,
-0.2187261, 0.3524537, -0.2145045, 0, 1, 0.4901961, 1,
-0.2178454, -1.688266, -4.503212, 0, 1, 0.4941176, 1,
-0.2157525, 0.7814003, -2.023462, 0, 1, 0.5019608, 1,
-0.2131003, -0.1427602, -1.879889, 0, 1, 0.509804, 1,
-0.2102882, -0.8160809, -3.285878, 0, 1, 0.5137255, 1,
-0.2089784, 0.4686201, 0.6919409, 0, 1, 0.5215687, 1,
-0.2029248, 0.615259, 0.4466715, 0, 1, 0.5254902, 1,
-0.2019558, -0.8561676, -4.202386, 0, 1, 0.5333334, 1,
-0.1992215, -0.2745954, -1.516164, 0, 1, 0.5372549, 1,
-0.1956705, 0.3519098, -0.9962555, 0, 1, 0.5450981, 1,
-0.1943182, 1.943534, 0.07878729, 0, 1, 0.5490196, 1,
-0.1930611, -0.4529143, -2.465334, 0, 1, 0.5568628, 1,
-0.1923287, -0.2217858, -3.43304, 0, 1, 0.5607843, 1,
-0.1904686, -0.7018296, -3.660751, 0, 1, 0.5686275, 1,
-0.1888534, -1.363018, -1.550214, 0, 1, 0.572549, 1,
-0.1819724, 1.367419, -0.441805, 0, 1, 0.5803922, 1,
-0.1796414, 1.052905, 0.9162093, 0, 1, 0.5843138, 1,
-0.1672707, 0.1340282, -0.907902, 0, 1, 0.5921569, 1,
-0.1647131, 1.668128, -0.6501724, 0, 1, 0.5960785, 1,
-0.1593624, -0.5530446, -1.947712, 0, 1, 0.6039216, 1,
-0.1495362, 0.3252378, -2.344565, 0, 1, 0.6117647, 1,
-0.1461825, -0.9389557, -3.292418, 0, 1, 0.6156863, 1,
-0.1443527, 0.6822159, -1.19265, 0, 1, 0.6235294, 1,
-0.1332465, -1.268636, -2.486631, 0, 1, 0.627451, 1,
-0.1294547, -1.308098, -2.784741, 0, 1, 0.6352941, 1,
-0.1274996, -0.4025141, -4.810956, 0, 1, 0.6392157, 1,
-0.1247831, 1.717036, 1.081031, 0, 1, 0.6470588, 1,
-0.1243647, -0.000475786, -2.648474, 0, 1, 0.6509804, 1,
-0.1242321, 1.006464, -0.8917748, 0, 1, 0.6588235, 1,
-0.1219157, 0.08407797, -1.765372, 0, 1, 0.6627451, 1,
-0.1214529, 1.416192, 1.295596, 0, 1, 0.6705883, 1,
-0.1196597, 0.4726324, 0.8243502, 0, 1, 0.6745098, 1,
-0.1162937, -0.08101226, -1.715927, 0, 1, 0.682353, 1,
-0.1150935, 0.02702927, -0.9740157, 0, 1, 0.6862745, 1,
-0.1149916, 1.165449, -0.9662197, 0, 1, 0.6941177, 1,
-0.1107124, 0.1027371, -0.5197473, 0, 1, 0.7019608, 1,
-0.1083092, -0.8987318, -3.77508, 0, 1, 0.7058824, 1,
-0.105275, 2.38293, -0.1884371, 0, 1, 0.7137255, 1,
-0.1036576, -0.1568203, -2.905025, 0, 1, 0.7176471, 1,
-0.09834716, 0.2469803, -0.1989891, 0, 1, 0.7254902, 1,
-0.09806964, 1.228442, 1.895681, 0, 1, 0.7294118, 1,
-0.09660067, -0.2758994, -3.045899, 0, 1, 0.7372549, 1,
-0.09461551, 0.919633, 1.366089, 0, 1, 0.7411765, 1,
-0.09397915, -1.38522, -2.427971, 0, 1, 0.7490196, 1,
-0.09269831, -0.1922086, -4.297369, 0, 1, 0.7529412, 1,
-0.09146839, 0.2404661, 0.1826447, 0, 1, 0.7607843, 1,
-0.09140443, -1.40711, -2.332897, 0, 1, 0.7647059, 1,
-0.09116499, -0.1003218, -3.794844, 0, 1, 0.772549, 1,
-0.09064189, -0.4582607, -3.263454, 0, 1, 0.7764706, 1,
-0.09042782, -0.07247058, -2.714622, 0, 1, 0.7843137, 1,
-0.08743704, 0.5932018, 0.3907381, 0, 1, 0.7882353, 1,
-0.0865569, -1.721496, -4.418588, 0, 1, 0.7960784, 1,
-0.08564281, -0.9960883, -2.308839, 0, 1, 0.8039216, 1,
-0.08474929, 0.5235002, -0.4735822, 0, 1, 0.8078431, 1,
-0.08348706, 0.3153762, -1.717646, 0, 1, 0.8156863, 1,
-0.08140116, -0.3770574, -2.476921, 0, 1, 0.8196079, 1,
-0.07803192, 0.5748504, -0.04975351, 0, 1, 0.827451, 1,
-0.07618131, 1.131472, 0.03907109, 0, 1, 0.8313726, 1,
-0.07153102, -1.007118, -4.06867, 0, 1, 0.8392157, 1,
-0.07092598, -0.7843133, -3.254373, 0, 1, 0.8431373, 1,
-0.07092575, 1.446, 0.08295807, 0, 1, 0.8509804, 1,
-0.06768436, 1.293282, 1.315527, 0, 1, 0.854902, 1,
-0.06626976, 0.7008029, -0.3893586, 0, 1, 0.8627451, 1,
-0.06598169, 0.2346183, 0.2066148, 0, 1, 0.8666667, 1,
-0.06434739, 1.338013, 0.7554598, 0, 1, 0.8745098, 1,
-0.06299056, -0.5045234, -5.476116, 0, 1, 0.8784314, 1,
-0.06130734, 0.7841851, -0.01997795, 0, 1, 0.8862745, 1,
-0.0539574, 1.142772, -0.5981953, 0, 1, 0.8901961, 1,
-0.0464385, -1.009387, -4.423288, 0, 1, 0.8980392, 1,
-0.03646884, 0.4230447, -1.499566, 0, 1, 0.9058824, 1,
-0.03423076, -1.197952, -3.102942, 0, 1, 0.9098039, 1,
-0.03351355, -0.05464207, -3.315448, 0, 1, 0.9176471, 1,
-0.02769019, 1.618823, -1.05472, 0, 1, 0.9215686, 1,
-0.02593317, -1.702097, -3.651439, 0, 1, 0.9294118, 1,
-0.02480424, -0.4671424, -1.78483, 0, 1, 0.9333333, 1,
-0.01780069, -0.6930052, -4.382033, 0, 1, 0.9411765, 1,
-0.01547452, -1.032645, -3.10192, 0, 1, 0.945098, 1,
-0.006607381, -0.5410385, -3.773907, 0, 1, 0.9529412, 1,
0.001973941, -1.19049, 4.236225, 0, 1, 0.9568627, 1,
0.002768649, 1.140947, 0.117227, 0, 1, 0.9647059, 1,
0.003798255, -0.1349933, 2.160179, 0, 1, 0.9686275, 1,
0.008561155, 0.5997992, -0.4174788, 0, 1, 0.9764706, 1,
0.01046466, 0.9460254, 1.135703, 0, 1, 0.9803922, 1,
0.01647, 1.411839, 3.047509, 0, 1, 0.9882353, 1,
0.01788924, -1.112357, 2.735323, 0, 1, 0.9921569, 1,
0.01924557, 0.1508322, 0.6533245, 0, 1, 1, 1,
0.02422315, 0.4493115, -0.1198467, 0, 0.9921569, 1, 1,
0.02561861, -1.050189, 2.518992, 0, 0.9882353, 1, 1,
0.02631038, -2.239217, 3.109193, 0, 0.9803922, 1, 1,
0.02713938, -1.762566, 2.397442, 0, 0.9764706, 1, 1,
0.02944288, -0.4435031, 4.485501, 0, 0.9686275, 1, 1,
0.0423378, -1.038595, 2.54429, 0, 0.9647059, 1, 1,
0.04344415, 0.02889986, 2.0493, 0, 0.9568627, 1, 1,
0.04764089, -1.391302, 3.053028, 0, 0.9529412, 1, 1,
0.04870455, 1.846311, 0.5891809, 0, 0.945098, 1, 1,
0.04993786, 0.7492175, -0.1627477, 0, 0.9411765, 1, 1,
0.05262552, -1.448448, 3.003835, 0, 0.9333333, 1, 1,
0.05767319, -0.3774666, 1.991793, 0, 0.9294118, 1, 1,
0.06050652, -0.2803227, 2.674086, 0, 0.9215686, 1, 1,
0.07417578, -0.3400711, 2.30334, 0, 0.9176471, 1, 1,
0.07532208, -0.1606446, 1.913037, 0, 0.9098039, 1, 1,
0.0756527, 0.1096028, -0.251196, 0, 0.9058824, 1, 1,
0.08269732, 0.1142618, -0.04570916, 0, 0.8980392, 1, 1,
0.08331729, 0.7144296, 2.210602, 0, 0.8901961, 1, 1,
0.08390296, 0.3119655, -0.6560794, 0, 0.8862745, 1, 1,
0.0852271, -0.04868373, 2.400136, 0, 0.8784314, 1, 1,
0.08536299, 0.3696519, -1.80988, 0, 0.8745098, 1, 1,
0.09613955, 2.213244, -0.3931163, 0, 0.8666667, 1, 1,
0.0982166, 0.3441912, -0.928039, 0, 0.8627451, 1, 1,
0.09835265, 2.49687, 0.6172321, 0, 0.854902, 1, 1,
0.1032472, 0.03068442, 0.9948019, 0, 0.8509804, 1, 1,
0.1046407, -1.73005, 3.795135, 0, 0.8431373, 1, 1,
0.1065477, -0.002582473, 3.091849, 0, 0.8392157, 1, 1,
0.1156987, -2.510978, 4.108451, 0, 0.8313726, 1, 1,
0.1198634, 0.3202524, 0.8634959, 0, 0.827451, 1, 1,
0.1276479, -1.075021, 3.065404, 0, 0.8196079, 1, 1,
0.1321805, -0.5935009, 3.865917, 0, 0.8156863, 1, 1,
0.1357292, -2.791389, 2.662064, 0, 0.8078431, 1, 1,
0.1368715, -0.47663, 3.24876, 0, 0.8039216, 1, 1,
0.1370008, -1.968368, 2.163059, 0, 0.7960784, 1, 1,
0.1373253, -1.145867, 2.266939, 0, 0.7882353, 1, 1,
0.1386897, -0.9783674, 2.982517, 0, 0.7843137, 1, 1,
0.1403118, -0.539149, 3.523179, 0, 0.7764706, 1, 1,
0.1413782, 0.859776, 1.745744, 0, 0.772549, 1, 1,
0.1436095, -0.2457839, 2.0198, 0, 0.7647059, 1, 1,
0.146681, -0.8750131, 2.315991, 0, 0.7607843, 1, 1,
0.1471969, -0.1361953, 2.940696, 0, 0.7529412, 1, 1,
0.1484483, 0.6674898, 0.7512906, 0, 0.7490196, 1, 1,
0.1504855, 2.09886, -1.30078, 0, 0.7411765, 1, 1,
0.1512392, -1.293475, 3.727746, 0, 0.7372549, 1, 1,
0.1522436, 0.5093997, 0.01167682, 0, 0.7294118, 1, 1,
0.1585954, 1.221994, 0.4208071, 0, 0.7254902, 1, 1,
0.1611469, 0.2313952, 3.049315, 0, 0.7176471, 1, 1,
0.1633937, -0.472519, 3.383232, 0, 0.7137255, 1, 1,
0.167796, 0.19104, 1.237495, 0, 0.7058824, 1, 1,
0.1736137, 0.4475545, 1.893902, 0, 0.6980392, 1, 1,
0.1768674, -0.6957074, 3.110037, 0, 0.6941177, 1, 1,
0.1773399, 0.8736632, 1.631872, 0, 0.6862745, 1, 1,
0.177852, -0.1547412, 3.88984, 0, 0.682353, 1, 1,
0.1805555, -0.3104858, 3.806205, 0, 0.6745098, 1, 1,
0.1816792, 0.2387379, 2.212815, 0, 0.6705883, 1, 1,
0.1890684, 0.8576581, -0.07737271, 0, 0.6627451, 1, 1,
0.1971009, 0.2783617, 0.3079879, 0, 0.6588235, 1, 1,
0.1974661, -0.009254145, 1.56197, 0, 0.6509804, 1, 1,
0.1988724, 0.2325317, 0.6860868, 0, 0.6470588, 1, 1,
0.2017896, -0.01324581, 2.320689, 0, 0.6392157, 1, 1,
0.2069799, -0.716242, 3.034664, 0, 0.6352941, 1, 1,
0.2087219, -1.070778, 1.311273, 0, 0.627451, 1, 1,
0.2152256, -1.087007, 2.403737, 0, 0.6235294, 1, 1,
0.2169259, -0.1002689, 2.252806, 0, 0.6156863, 1, 1,
0.2209273, 0.4758705, 0.9827848, 0, 0.6117647, 1, 1,
0.2271095, -1.02982, 3.000386, 0, 0.6039216, 1, 1,
0.2275957, -0.3139325, 1.457828, 0, 0.5960785, 1, 1,
0.2286841, -0.3752108, 2.818869, 0, 0.5921569, 1, 1,
0.2291466, -1.563369, 2.205238, 0, 0.5843138, 1, 1,
0.2291623, -0.2183398, 2.24463, 0, 0.5803922, 1, 1,
0.2319431, -0.5189142, 4.761721, 0, 0.572549, 1, 1,
0.2334176, -1.115663, 1.95081, 0, 0.5686275, 1, 1,
0.2354818, -0.7406989, 3.348066, 0, 0.5607843, 1, 1,
0.2359402, -0.537896, 1.647864, 0, 0.5568628, 1, 1,
0.2380326, 0.3858391, 1.011718, 0, 0.5490196, 1, 1,
0.2387427, 0.0577543, 1.278156, 0, 0.5450981, 1, 1,
0.2446409, 1.081601, -0.8034543, 0, 0.5372549, 1, 1,
0.2483631, -1.460982, 3.410137, 0, 0.5333334, 1, 1,
0.2527832, 0.7371904, 0.9490032, 0, 0.5254902, 1, 1,
0.2529749, -1.337691, 1.047026, 0, 0.5215687, 1, 1,
0.2543634, 0.9229638, -0.7026632, 0, 0.5137255, 1, 1,
0.2545971, 1.212929, 1.929595, 0, 0.509804, 1, 1,
0.259625, 2.729455, -0.7156758, 0, 0.5019608, 1, 1,
0.2598993, 0.190874, 0.4042673, 0, 0.4941176, 1, 1,
0.2621752, -1.185429, 2.410621, 0, 0.4901961, 1, 1,
0.2674934, 3.08474, 1.061645, 0, 0.4823529, 1, 1,
0.2684873, 0.2227078, 2.058866, 0, 0.4784314, 1, 1,
0.2695551, 0.5319778, 0.52029, 0, 0.4705882, 1, 1,
0.2704322, 0.5575137, 1.831718, 0, 0.4666667, 1, 1,
0.2741216, 0.6628016, 2.073474, 0, 0.4588235, 1, 1,
0.2745257, -0.8796511, 2.996771, 0, 0.454902, 1, 1,
0.2750584, 1.118449, 0.9072081, 0, 0.4470588, 1, 1,
0.2759554, -1.02974, 1.210943, 0, 0.4431373, 1, 1,
0.2772008, -0.9767933, 4.044433, 0, 0.4352941, 1, 1,
0.2782232, -1.224402, 3.113776, 0, 0.4313726, 1, 1,
0.2811455, 0.2936909, 1.075823, 0, 0.4235294, 1, 1,
0.2865631, -1.322355, 2.353542, 0, 0.4196078, 1, 1,
0.2939319, 1.717541, -0.5760838, 0, 0.4117647, 1, 1,
0.296251, -0.8275996, 4.334881, 0, 0.4078431, 1, 1,
0.2977293, 1.013749, 0.3366419, 0, 0.4, 1, 1,
0.2979583, -2.49415, 3.33014, 0, 0.3921569, 1, 1,
0.298463, -0.8314186, 1.977314, 0, 0.3882353, 1, 1,
0.3040053, 0.6339778, -0.316797, 0, 0.3803922, 1, 1,
0.3062229, 0.4631467, 1.645681, 0, 0.3764706, 1, 1,
0.3063973, -0.3236136, 1.940815, 0, 0.3686275, 1, 1,
0.3074353, -0.9468786, 1.0802, 0, 0.3647059, 1, 1,
0.3149525, 0.6202131, 1.985225, 0, 0.3568628, 1, 1,
0.321642, -1.390145, 2.442625, 0, 0.3529412, 1, 1,
0.3217953, 0.5371214, 0.5364318, 0, 0.345098, 1, 1,
0.3259399, -3.096293, 3.346245, 0, 0.3411765, 1, 1,
0.3270489, -1.082571, 3.375393, 0, 0.3333333, 1, 1,
0.3273205, -0.7239766, 2.841298, 0, 0.3294118, 1, 1,
0.3310646, 0.8159083, -0.2937173, 0, 0.3215686, 1, 1,
0.3364103, 0.1753361, 3.26723, 0, 0.3176471, 1, 1,
0.3365965, -1.517833, 2.977722, 0, 0.3098039, 1, 1,
0.3371221, 0.9425941, 2.49614, 0, 0.3058824, 1, 1,
0.3388475, 0.4586392, 1.782148, 0, 0.2980392, 1, 1,
0.3389346, -0.2514716, 2.299762, 0, 0.2901961, 1, 1,
0.3398366, 0.8821511, 0.1473143, 0, 0.2862745, 1, 1,
0.3402257, 0.4470034, -0.6942965, 0, 0.2784314, 1, 1,
0.3403588, -0.01122088, 2.956596, 0, 0.2745098, 1, 1,
0.3537218, -0.14615, 1.770851, 0, 0.2666667, 1, 1,
0.360628, 0.02154805, 1.045271, 0, 0.2627451, 1, 1,
0.3667296, -1.093122, 2.493305, 0, 0.254902, 1, 1,
0.3675886, 2.307089, -1.358977, 0, 0.2509804, 1, 1,
0.3774346, -0.1764556, 2.340151, 0, 0.2431373, 1, 1,
0.3787155, 0.3095788, 1.899132, 0, 0.2392157, 1, 1,
0.3817005, 0.4260486, 0.2806198, 0, 0.2313726, 1, 1,
0.3818085, -0.3113281, 1.509331, 0, 0.227451, 1, 1,
0.381968, 0.3188126, 1.627027, 0, 0.2196078, 1, 1,
0.3819688, 0.5256909, 1.432812, 0, 0.2156863, 1, 1,
0.3826835, 2.502463, 0.8694875, 0, 0.2078431, 1, 1,
0.3839929, -1.731506, 4.111649, 0, 0.2039216, 1, 1,
0.3856189, 0.3255008, -0.008945479, 0, 0.1960784, 1, 1,
0.3867395, -0.111306, 1.590805, 0, 0.1882353, 1, 1,
0.3917531, -0.1540359, 2.661543, 0, 0.1843137, 1, 1,
0.3960474, -0.4869983, 3.163091, 0, 0.1764706, 1, 1,
0.3962113, -0.9298628, 2.956363, 0, 0.172549, 1, 1,
0.3965294, 0.3166459, -1.079654, 0, 0.1647059, 1, 1,
0.3967146, 0.08150788, 0.1169402, 0, 0.1607843, 1, 1,
0.3971076, -1.83962, 4.062433, 0, 0.1529412, 1, 1,
0.3979197, -1.639229, 3.654735, 0, 0.1490196, 1, 1,
0.3996502, 0.9553475, 0.08528747, 0, 0.1411765, 1, 1,
0.3999111, -1.484606, 4.127824, 0, 0.1372549, 1, 1,
0.400401, 1.417753, 1.882885, 0, 0.1294118, 1, 1,
0.4027779, 0.09234853, 2.023663, 0, 0.1254902, 1, 1,
0.4051211, -0.7767074, 3.701357, 0, 0.1176471, 1, 1,
0.4058005, 0.6384335, 2.214853, 0, 0.1137255, 1, 1,
0.4071039, -0.3294027, 2.560948, 0, 0.1058824, 1, 1,
0.4090522, 0.2119178, 1.727294, 0, 0.09803922, 1, 1,
0.4103442, 0.4721443, -0.657249, 0, 0.09411765, 1, 1,
0.414838, 0.03824286, 0.1384265, 0, 0.08627451, 1, 1,
0.4148526, -0.5392122, 3.604346, 0, 0.08235294, 1, 1,
0.4179657, -0.2350505, 0.9136246, 0, 0.07450981, 1, 1,
0.4221092, -0.4682443, 2.518118, 0, 0.07058824, 1, 1,
0.4246937, 0.9894326, 1.198259, 0, 0.0627451, 1, 1,
0.4257868, 1.44181, 1.568456, 0, 0.05882353, 1, 1,
0.4297945, -0.8984756, 2.985858, 0, 0.05098039, 1, 1,
0.4335613, -1.5907, 1.975992, 0, 0.04705882, 1, 1,
0.4362167, -1.138894, 3.295419, 0, 0.03921569, 1, 1,
0.4420531, 1.667166, 1.889309, 0, 0.03529412, 1, 1,
0.4426501, 1.329755, -0.2494534, 0, 0.02745098, 1, 1,
0.4442295, -1.032571, 2.554985, 0, 0.02352941, 1, 1,
0.4478457, 1.590479, -0.9068761, 0, 0.01568628, 1, 1,
0.453412, 0.7676269, 0.3332271, 0, 0.01176471, 1, 1,
0.4539355, 0.9590042, 0.3073012, 0, 0.003921569, 1, 1,
0.4543305, -0.3385898, 2.553506, 0.003921569, 0, 1, 1,
0.4586669, 1.374823, 0.09538551, 0.007843138, 0, 1, 1,
0.4597151, -0.6741378, 2.357206, 0.01568628, 0, 1, 1,
0.4601503, 0.1272301, 1.374326, 0.01960784, 0, 1, 1,
0.4655082, 0.2782124, 1.221635, 0.02745098, 0, 1, 1,
0.4656128, 1.190836, 1.129675, 0.03137255, 0, 1, 1,
0.4667311, -1.76391, 2.701988, 0.03921569, 0, 1, 1,
0.4672381, -0.7113737, 3.684428, 0.04313726, 0, 1, 1,
0.4692301, -0.645423, 0.7813762, 0.05098039, 0, 1, 1,
0.4768951, -0.7457362, 3.197409, 0.05490196, 0, 1, 1,
0.4772245, -1.744992, 2.691721, 0.0627451, 0, 1, 1,
0.4775357, 0.7279721, 2.733388, 0.06666667, 0, 1, 1,
0.4786947, -1.387388, 0.6050704, 0.07450981, 0, 1, 1,
0.4824485, -0.4110016, 2.042999, 0.07843138, 0, 1, 1,
0.4838837, 0.4895641, 0.6820904, 0.08627451, 0, 1, 1,
0.4840854, 0.3520917, 0.1316703, 0.09019608, 0, 1, 1,
0.485778, 0.7460745, 0.2223365, 0.09803922, 0, 1, 1,
0.4889057, 1.106936, 0.09396964, 0.1058824, 0, 1, 1,
0.490948, 1.266986, 1.201086, 0.1098039, 0, 1, 1,
0.4914939, 0.4064924, -1.196801, 0.1176471, 0, 1, 1,
0.4938042, -1.503732, 3.414884, 0.1215686, 0, 1, 1,
0.4992696, -0.5154462, 1.542745, 0.1294118, 0, 1, 1,
0.5055782, -0.03900551, 2.017093, 0.1333333, 0, 1, 1,
0.5061886, -0.8515693, 3.048746, 0.1411765, 0, 1, 1,
0.5068941, 0.292928, 2.03834, 0.145098, 0, 1, 1,
0.5069011, -1.354675, 2.941437, 0.1529412, 0, 1, 1,
0.507619, 0.05921689, 2.178851, 0.1568628, 0, 1, 1,
0.5118051, 0.2348443, 1.395583, 0.1647059, 0, 1, 1,
0.512242, -0.9036222, 1.463674, 0.1686275, 0, 1, 1,
0.5166526, -0.6324813, 3.458579, 0.1764706, 0, 1, 1,
0.5210771, 2.012036, -0.1964971, 0.1803922, 0, 1, 1,
0.5317873, -0.7610494, 2.7225, 0.1882353, 0, 1, 1,
0.5320922, -0.04746458, 2.11499, 0.1921569, 0, 1, 1,
0.5339545, 0.01994871, 1.167848, 0.2, 0, 1, 1,
0.5346788, 1.340417, 1.880412, 0.2078431, 0, 1, 1,
0.5377159, -1.063874, 1.712149, 0.2117647, 0, 1, 1,
0.5381379, -0.7800866, 2.294074, 0.2196078, 0, 1, 1,
0.5385501, 0.9895025, 0.9050133, 0.2235294, 0, 1, 1,
0.5428388, -0.299952, 3.297979, 0.2313726, 0, 1, 1,
0.5446683, -0.09078822, 0.4626356, 0.2352941, 0, 1, 1,
0.5504159, -1.366378, 1.968989, 0.2431373, 0, 1, 1,
0.5551805, 0.007578218, 1.043858, 0.2470588, 0, 1, 1,
0.5591059, 0.5534995, -0.4307584, 0.254902, 0, 1, 1,
0.5621639, -2.053247, 2.086128, 0.2588235, 0, 1, 1,
0.5677925, 0.3561117, 0.6783427, 0.2666667, 0, 1, 1,
0.5724057, 0.2583705, 1.383749, 0.2705882, 0, 1, 1,
0.5781323, 0.1571631, 1.903268, 0.2784314, 0, 1, 1,
0.5801564, -0.5629572, 1.925615, 0.282353, 0, 1, 1,
0.5804318, -1.163297, 2.455146, 0.2901961, 0, 1, 1,
0.5821014, -3.441435, 2.314936, 0.2941177, 0, 1, 1,
0.5832382, -0.05056379, 1.148886, 0.3019608, 0, 1, 1,
0.5847378, 0.5254306, 0.6866202, 0.3098039, 0, 1, 1,
0.5869713, 0.2554629, 0.259251, 0.3137255, 0, 1, 1,
0.5898716, 0.1188306, 2.30085, 0.3215686, 0, 1, 1,
0.5908073, -1.061646, 3.307144, 0.3254902, 0, 1, 1,
0.5993963, -0.3365927, 2.08316, 0.3333333, 0, 1, 1,
0.6014972, -2.791247, 3.447181, 0.3372549, 0, 1, 1,
0.6021595, 0.8057988, -0.09473373, 0.345098, 0, 1, 1,
0.604759, -1.215342, 2.471052, 0.3490196, 0, 1, 1,
0.609022, -0.7457723, 2.008592, 0.3568628, 0, 1, 1,
0.6133835, 0.4878996, 2.489828, 0.3607843, 0, 1, 1,
0.6137635, -0.09674992, 1.14324, 0.3686275, 0, 1, 1,
0.6200374, 0.4467065, 1.541971, 0.372549, 0, 1, 1,
0.6246105, -1.398341, 2.696686, 0.3803922, 0, 1, 1,
0.6265861, 1.074496, 2.391839, 0.3843137, 0, 1, 1,
0.6274608, -1.394113, 4.872861, 0.3921569, 0, 1, 1,
0.6372877, -0.7296522, 1.35159, 0.3960784, 0, 1, 1,
0.6458212, -0.6403087, 2.455483, 0.4039216, 0, 1, 1,
0.6480241, 1.183732, 0.5934668, 0.4117647, 0, 1, 1,
0.6533679, -0.2563186, 0.6030725, 0.4156863, 0, 1, 1,
0.6535456, 1.259774, 0.1530236, 0.4235294, 0, 1, 1,
0.6573945, 0.3064086, 2.280553, 0.427451, 0, 1, 1,
0.6601495, 1.97143, 1.282605, 0.4352941, 0, 1, 1,
0.6610022, -0.1495776, 1.790617, 0.4392157, 0, 1, 1,
0.6619256, -0.4275513, 2.392936, 0.4470588, 0, 1, 1,
0.6629255, -0.2094676, 2.758823, 0.4509804, 0, 1, 1,
0.6647269, -0.5135266, 1.873024, 0.4588235, 0, 1, 1,
0.6662048, -0.775239, 1.828714, 0.4627451, 0, 1, 1,
0.6694915, -0.7048072, 3.46541, 0.4705882, 0, 1, 1,
0.6737007, 0.7678801, 1.153335, 0.4745098, 0, 1, 1,
0.6783196, 1.022842, -0.3821914, 0.4823529, 0, 1, 1,
0.6810747, 1.581533, 0.1859374, 0.4862745, 0, 1, 1,
0.6821978, 0.6790522, 2.311265, 0.4941176, 0, 1, 1,
0.6824573, 2.214391, -0.2550655, 0.5019608, 0, 1, 1,
0.6844864, -0.8157001, 2.682837, 0.5058824, 0, 1, 1,
0.6859128, -0.9678856, 1.783537, 0.5137255, 0, 1, 1,
0.6869044, 0.7527254, -0.04451318, 0.5176471, 0, 1, 1,
0.6870921, -0.1590723, 2.338042, 0.5254902, 0, 1, 1,
0.6905131, 0.3781093, -0.2394388, 0.5294118, 0, 1, 1,
0.6958916, -0.3282818, 2.151995, 0.5372549, 0, 1, 1,
0.6976411, -0.4424835, 1.116267, 0.5411765, 0, 1, 1,
0.7066321, 0.2094344, 1.04085, 0.5490196, 0, 1, 1,
0.7125286, 0.4013442, 1.391793, 0.5529412, 0, 1, 1,
0.7144271, 1.116997, -1.293869, 0.5607843, 0, 1, 1,
0.7155671, -0.4285491, 3.343702, 0.5647059, 0, 1, 1,
0.7174684, -0.7160502, 1.923549, 0.572549, 0, 1, 1,
0.7183819, -0.5983889, 3.248203, 0.5764706, 0, 1, 1,
0.7220408, -0.01828388, 0.8837181, 0.5843138, 0, 1, 1,
0.7231876, -0.07092609, 0.969761, 0.5882353, 0, 1, 1,
0.7246575, 1.088989, 0.9232214, 0.5960785, 0, 1, 1,
0.7247888, 0.4156068, 0.5555475, 0.6039216, 0, 1, 1,
0.7272601, -1.082718, 2.581806, 0.6078432, 0, 1, 1,
0.7305149, -0.1578908, 2.980641, 0.6156863, 0, 1, 1,
0.733374, -1.171361, 4.24938, 0.6196079, 0, 1, 1,
0.7367921, 0.4714458, 0.1017012, 0.627451, 0, 1, 1,
0.7369439, -0.7895649, 2.134603, 0.6313726, 0, 1, 1,
0.7377653, 1.223086, -0.2848064, 0.6392157, 0, 1, 1,
0.7381189, 0.5319421, 0.6708705, 0.6431373, 0, 1, 1,
0.7388932, 0.1371008, 2.702568, 0.6509804, 0, 1, 1,
0.7414444, 0.1091663, 1.800315, 0.654902, 0, 1, 1,
0.7437637, -0.04842371, 2.625226, 0.6627451, 0, 1, 1,
0.7577018, 0.7734545, 0.5534369, 0.6666667, 0, 1, 1,
0.761167, -0.6820752, 3.39959, 0.6745098, 0, 1, 1,
0.7628452, 0.4521084, 0.4162868, 0.6784314, 0, 1, 1,
0.7660812, 0.1954838, 1.63114, 0.6862745, 0, 1, 1,
0.766763, -2.19441, 2.710749, 0.6901961, 0, 1, 1,
0.7680231, 0.439712, 0.236488, 0.6980392, 0, 1, 1,
0.7711033, -0.805636, 1.632547, 0.7058824, 0, 1, 1,
0.7721813, -0.8971947, 2.326405, 0.7098039, 0, 1, 1,
0.7746778, 0.2046704, -0.2978189, 0.7176471, 0, 1, 1,
0.780463, 0.1137445, 1.020417, 0.7215686, 0, 1, 1,
0.7809568, -0.5411471, 2.103602, 0.7294118, 0, 1, 1,
0.7844115, -1.162595, 0.9158491, 0.7333333, 0, 1, 1,
0.7866464, 0.4247571, -0.2883262, 0.7411765, 0, 1, 1,
0.7884532, -0.9569166, 2.160698, 0.7450981, 0, 1, 1,
0.7906016, 0.1944779, 1.997879, 0.7529412, 0, 1, 1,
0.797051, 1.03422, -0.1367048, 0.7568628, 0, 1, 1,
0.7973982, -1.527248, 3.554743, 0.7647059, 0, 1, 1,
0.8026705, 1.281733, 1.254402, 0.7686275, 0, 1, 1,
0.8050458, 0.7821979, 1.355247, 0.7764706, 0, 1, 1,
0.8073666, 0.9095652, 0.2920237, 0.7803922, 0, 1, 1,
0.8075439, 0.9995552, -1.368179, 0.7882353, 0, 1, 1,
0.8096681, -0.2204333, 2.669694, 0.7921569, 0, 1, 1,
0.8122408, 0.7344317, 0.8275834, 0.8, 0, 1, 1,
0.8130237, 0.07803637, 1.599243, 0.8078431, 0, 1, 1,
0.8153152, 2.035433, 1.52591, 0.8117647, 0, 1, 1,
0.8167638, -0.967977, 2.861608, 0.8196079, 0, 1, 1,
0.8173904, 0.7370577, 2.866509, 0.8235294, 0, 1, 1,
0.8186722, -0.7435202, 1.129361, 0.8313726, 0, 1, 1,
0.8347971, 0.07903717, 0.9976345, 0.8352941, 0, 1, 1,
0.8377074, -0.1862683, 0.3815796, 0.8431373, 0, 1, 1,
0.8388718, 0.06943177, 1.226786, 0.8470588, 0, 1, 1,
0.846812, 1.659672, 1.913835, 0.854902, 0, 1, 1,
0.8494411, 0.7514857, 0.5091329, 0.8588235, 0, 1, 1,
0.8507735, 0.1789893, 1.744284, 0.8666667, 0, 1, 1,
0.8533944, 1.11574, 0.09513426, 0.8705882, 0, 1, 1,
0.8546014, 0.4995055, 0.7833096, 0.8784314, 0, 1, 1,
0.8546425, 0.2063358, 1.515614, 0.8823529, 0, 1, 1,
0.8568366, 1.431254, 0.2871932, 0.8901961, 0, 1, 1,
0.8570989, 0.6208719, 1.087699, 0.8941177, 0, 1, 1,
0.8607128, 1.394974, 0.1900488, 0.9019608, 0, 1, 1,
0.8793105, -0.7621449, 1.491416, 0.9098039, 0, 1, 1,
0.8799056, 0.3680833, 3.77271, 0.9137255, 0, 1, 1,
0.8803227, 1.638887, -0.9179653, 0.9215686, 0, 1, 1,
0.8850292, 0.6969187, 1.011304, 0.9254902, 0, 1, 1,
0.8854958, -0.1721503, 3.511742, 0.9333333, 0, 1, 1,
0.8861181, -0.4129063, 2.941256, 0.9372549, 0, 1, 1,
0.8887243, -0.2942081, 2.155708, 0.945098, 0, 1, 1,
0.8938308, 2.086483, 1.939051, 0.9490196, 0, 1, 1,
0.8951751, 2.344845, 0.07972458, 0.9568627, 0, 1, 1,
0.9013144, -1.533925, 2.221285, 0.9607843, 0, 1, 1,
0.9033503, 0.680914, 0.4396172, 0.9686275, 0, 1, 1,
0.9039906, 2.959455, 0.08483393, 0.972549, 0, 1, 1,
0.9040354, -0.2775168, 2.504826, 0.9803922, 0, 1, 1,
0.9059892, -0.4995958, 1.49365, 0.9843137, 0, 1, 1,
0.9117141, -1.661052, 1.016851, 0.9921569, 0, 1, 1,
0.9132294, -0.8441144, 5.242103, 0.9960784, 0, 1, 1,
0.9247741, 0.8744352, 0.3300339, 1, 0, 0.9960784, 1,
0.9254126, -0.7550592, 1.385424, 1, 0, 0.9882353, 1,
0.9365163, -0.3401758, 1.545857, 1, 0, 0.9843137, 1,
0.9499094, -0.6904272, 1.47306, 1, 0, 0.9764706, 1,
0.9530405, 0.4252982, 1.907421, 1, 0, 0.972549, 1,
0.9537174, -0.1629236, 1.499616, 1, 0, 0.9647059, 1,
0.9619877, -2.21038, 3.204472, 1, 0, 0.9607843, 1,
0.9631773, -0.4121542, 0.3419538, 1, 0, 0.9529412, 1,
0.9646567, -1.087558, 0.3249506, 1, 0, 0.9490196, 1,
0.9741023, 2.216401, -1.963034, 1, 0, 0.9411765, 1,
0.9792894, -0.4600743, 0.1188277, 1, 0, 0.9372549, 1,
0.9877717, -1.143643, 2.575262, 1, 0, 0.9294118, 1,
0.991456, 0.4336011, 0.8199403, 1, 0, 0.9254902, 1,
0.9923016, -0.2667106, 1.120193, 1, 0, 0.9176471, 1,
0.99576, 0.4257055, -1.015477, 1, 0, 0.9137255, 1,
1.001269, -0.2247741, 1.322166, 1, 0, 0.9058824, 1,
1.014649, -0.9503475, 2.878396, 1, 0, 0.9019608, 1,
1.020106, 0.6178204, 1.07164, 1, 0, 0.8941177, 1,
1.023784, -0.1512461, 1.140704, 1, 0, 0.8862745, 1,
1.030841, 1.549474, -1.477839, 1, 0, 0.8823529, 1,
1.038096, -0.6405322, 2.244887, 1, 0, 0.8745098, 1,
1.038288, 0.5286728, 1.249487, 1, 0, 0.8705882, 1,
1.040008, 0.6045834, -1.020568, 1, 0, 0.8627451, 1,
1.041706, 1.385655, 1.133594, 1, 0, 0.8588235, 1,
1.043621, -0.2666157, 0.5034276, 1, 0, 0.8509804, 1,
1.043681, 1.212962, 1.60888, 1, 0, 0.8470588, 1,
1.052531, 0.237939, 2.62696, 1, 0, 0.8392157, 1,
1.0647, 0.997013, 2.147866, 1, 0, 0.8352941, 1,
1.066155, -2.036984, 1.974051, 1, 0, 0.827451, 1,
1.07563, 2.32761, 0.00638173, 1, 0, 0.8235294, 1,
1.077332, 0.09783458, 0.7443783, 1, 0, 0.8156863, 1,
1.080749, 0.4207694, 2.183337, 1, 0, 0.8117647, 1,
1.080868, 0.60074, 1.450012, 1, 0, 0.8039216, 1,
1.082291, 0.5269773, 0.5802047, 1, 0, 0.7960784, 1,
1.099605, 0.135704, 2.198833, 1, 0, 0.7921569, 1,
1.099952, -1.282339, 4.667867, 1, 0, 0.7843137, 1,
1.100872, 0.7905344, 1.221827, 1, 0, 0.7803922, 1,
1.105267, 1.83418, 1.935274, 1, 0, 0.772549, 1,
1.109885, 0.02686577, 1.531177, 1, 0, 0.7686275, 1,
1.134361, 1.148537, -0.01387635, 1, 0, 0.7607843, 1,
1.136165, 0.1585343, 2.30695, 1, 0, 0.7568628, 1,
1.138759, 0.5370224, 0.5862823, 1, 0, 0.7490196, 1,
1.138761, -0.3404209, 3.39957, 1, 0, 0.7450981, 1,
1.140282, -0.8429484, 1.642982, 1, 0, 0.7372549, 1,
1.145704, 0.2058904, 1.585736, 1, 0, 0.7333333, 1,
1.14969, 0.9196877, 0.6934597, 1, 0, 0.7254902, 1,
1.156208, 0.3054162, 0.2948613, 1, 0, 0.7215686, 1,
1.157912, 0.1833469, 3.643629, 1, 0, 0.7137255, 1,
1.165628, -1.022502, 1.507905, 1, 0, 0.7098039, 1,
1.175155, 1.541357, 0.1605909, 1, 0, 0.7019608, 1,
1.181522, 1.720396, -0.416703, 1, 0, 0.6941177, 1,
1.19054, -0.817777, 4.324324, 1, 0, 0.6901961, 1,
1.190976, 1.898491, 1.82082, 1, 0, 0.682353, 1,
1.20331, 0.3385203, 1.719881, 1, 0, 0.6784314, 1,
1.204176, 1.206727, 0.2522504, 1, 0, 0.6705883, 1,
1.217574, -0.06893218, 0.1858775, 1, 0, 0.6666667, 1,
1.233731, -0.3559791, 3.485479, 1, 0, 0.6588235, 1,
1.236869, -0.5317309, 1.902778, 1, 0, 0.654902, 1,
1.239306, 1.314611, 0.5481664, 1, 0, 0.6470588, 1,
1.241359, 0.7970423, 2.369565, 1, 0, 0.6431373, 1,
1.246217, -0.7969966, 2.717152, 1, 0, 0.6352941, 1,
1.253147, 0.9908445, 1.267551, 1, 0, 0.6313726, 1,
1.254008, 0.7017104, 1.323549, 1, 0, 0.6235294, 1,
1.26182, 0.3577634, 0.1658494, 1, 0, 0.6196079, 1,
1.264037, -0.5494471, 1.195694, 1, 0, 0.6117647, 1,
1.265361, 0.5131718, 0.490747, 1, 0, 0.6078432, 1,
1.269016, 0.8066233, 1.763518, 1, 0, 0.6, 1,
1.272231, -1.264287, 1.419837, 1, 0, 0.5921569, 1,
1.273255, -0.3268053, 0.8160743, 1, 0, 0.5882353, 1,
1.274035, 0.5638965, -0.5706876, 1, 0, 0.5803922, 1,
1.297215, 0.05776533, -1.168481, 1, 0, 0.5764706, 1,
1.306128, 1.366887, 0.4933855, 1, 0, 0.5686275, 1,
1.30645, 1.134758, 0.1189582, 1, 0, 0.5647059, 1,
1.307822, -1.007861, 2.829092, 1, 0, 0.5568628, 1,
1.308061, -0.569379, 3.931456, 1, 0, 0.5529412, 1,
1.316154, 0.926851, 0.5170546, 1, 0, 0.5450981, 1,
1.319153, 1.022857, 0.131767, 1, 0, 0.5411765, 1,
1.324152, 0.7322122, -0.8977771, 1, 0, 0.5333334, 1,
1.336248, 0.4630261, 3.464841, 1, 0, 0.5294118, 1,
1.336809, 0.0991005, 2.42376, 1, 0, 0.5215687, 1,
1.343272, -0.07743925, 0.8653041, 1, 0, 0.5176471, 1,
1.369077, 0.2415249, 1.409144, 1, 0, 0.509804, 1,
1.375104, -0.7761021, 0.557519, 1, 0, 0.5058824, 1,
1.382378, 0.2689919, 0.7516961, 1, 0, 0.4980392, 1,
1.387706, -0.5593283, 0.9604564, 1, 0, 0.4901961, 1,
1.389488, 0.8970551, -0.06325273, 1, 0, 0.4862745, 1,
1.389729, -0.3047955, 2.429179, 1, 0, 0.4784314, 1,
1.397953, 1.374488, 0.477348, 1, 0, 0.4745098, 1,
1.401627, 0.2737107, 1.706974, 1, 0, 0.4666667, 1,
1.421452, 1.353051, 0.5503107, 1, 0, 0.4627451, 1,
1.427017, 1.003118, -0.694693, 1, 0, 0.454902, 1,
1.437773, 1.89578, -0.481579, 1, 0, 0.4509804, 1,
1.439556, -1.077132, 4.32957, 1, 0, 0.4431373, 1,
1.443273, -0.5820547, 2.90724, 1, 0, 0.4392157, 1,
1.452124, 2.06473, 0.7072088, 1, 0, 0.4313726, 1,
1.472314, -0.3193883, 1.925745, 1, 0, 0.427451, 1,
1.488921, -0.825592, 2.296478, 1, 0, 0.4196078, 1,
1.490383, -0.5051792, 2.849599, 1, 0, 0.4156863, 1,
1.491246, -0.1057382, 0.7320737, 1, 0, 0.4078431, 1,
1.496765, -0.4812374, 1.878564, 1, 0, 0.4039216, 1,
1.501792, 1.23111, 0.252106, 1, 0, 0.3960784, 1,
1.506303, 1.65842, 0.4375333, 1, 0, 0.3882353, 1,
1.516324, -0.5646092, 3.204629, 1, 0, 0.3843137, 1,
1.517932, -1.549245, 2.410812, 1, 0, 0.3764706, 1,
1.524677, -1.092091, 2.689523, 1, 0, 0.372549, 1,
1.545696, -0.9500625, 2.183805, 1, 0, 0.3647059, 1,
1.558611, -0.4712426, 2.180214, 1, 0, 0.3607843, 1,
1.561002, 0.5296776, 0.6519428, 1, 0, 0.3529412, 1,
1.56269, 1.373145, -0.542811, 1, 0, 0.3490196, 1,
1.563836, 1.409647, 2.025041, 1, 0, 0.3411765, 1,
1.565425, 1.564214, -0.5750042, 1, 0, 0.3372549, 1,
1.576622, 0.8241291, 0.6335173, 1, 0, 0.3294118, 1,
1.580406, 0.01498088, 1.033654, 1, 0, 0.3254902, 1,
1.582902, -0.8496042, 2.359563, 1, 0, 0.3176471, 1,
1.611768, -0.540363, 2.383562, 1, 0, 0.3137255, 1,
1.620965, -1.159147, 3.033342, 1, 0, 0.3058824, 1,
1.63676, 0.08762104, 0.7682436, 1, 0, 0.2980392, 1,
1.637494, 0.9196998, 2.579557, 1, 0, 0.2941177, 1,
1.647189, -0.04631275, 2.716105, 1, 0, 0.2862745, 1,
1.652037, -0.1790192, -0.2077194, 1, 0, 0.282353, 1,
1.656167, 0.6747813, 1.364895, 1, 0, 0.2745098, 1,
1.664867, -0.4553644, 0.6769155, 1, 0, 0.2705882, 1,
1.670634, -0.6566927, 1.594023, 1, 0, 0.2627451, 1,
1.684819, -1.310698, 1.447806, 1, 0, 0.2588235, 1,
1.696823, 0.7170041, 1.325789, 1, 0, 0.2509804, 1,
1.706528, 0.6267102, 1.008842, 1, 0, 0.2470588, 1,
1.762494, -0.0004032023, 0.963244, 1, 0, 0.2392157, 1,
1.763301, 0.5328209, 2.096858, 1, 0, 0.2352941, 1,
1.76487, -1.230509, 1.400929, 1, 0, 0.227451, 1,
1.779743, -0.47336, 0.1217619, 1, 0, 0.2235294, 1,
1.80435, -0.1388716, 1.61934, 1, 0, 0.2156863, 1,
1.837612, 0.120413, 0.9981767, 1, 0, 0.2117647, 1,
1.852824, 1.092134, 1.627938, 1, 0, 0.2039216, 1,
1.878771, 1.211922, 1.659556, 1, 0, 0.1960784, 1,
1.892737, -0.8850411, 2.50345, 1, 0, 0.1921569, 1,
1.89615, 1.724545, 1.37128, 1, 0, 0.1843137, 1,
1.951988, 0.1458146, 3.435779, 1, 0, 0.1803922, 1,
1.961215, 1.264516, 2.02545, 1, 0, 0.172549, 1,
1.961681, -1.478132, 2.872955, 1, 0, 0.1686275, 1,
1.965546, 1.029234, 0.3007142, 1, 0, 0.1607843, 1,
1.998302, -0.9214292, 1.792952, 1, 0, 0.1568628, 1,
2.000806, -0.9758524, 1.336699, 1, 0, 0.1490196, 1,
2.01244, 0.0899502, 1.063432, 1, 0, 0.145098, 1,
2.034873, -0.1106359, 1.261638, 1, 0, 0.1372549, 1,
2.03876, -0.4325313, 1.964961, 1, 0, 0.1333333, 1,
2.055955, 0.4504227, 1.616019, 1, 0, 0.1254902, 1,
2.076705, 1.112611, 0.162799, 1, 0, 0.1215686, 1,
2.086035, -1.781697, 2.546829, 1, 0, 0.1137255, 1,
2.088915, -0.2569201, 2.044613, 1, 0, 0.1098039, 1,
2.09634, 0.2311555, 1.542155, 1, 0, 0.1019608, 1,
2.142073, -1.783687, 3.65076, 1, 0, 0.09411765, 1,
2.185936, 0.0938678, 1.179014, 1, 0, 0.09019608, 1,
2.217084, -0.9545477, 0.353621, 1, 0, 0.08235294, 1,
2.238316, -0.7075564, 1.575477, 1, 0, 0.07843138, 1,
2.248252, 0.1113907, 1.756178, 1, 0, 0.07058824, 1,
2.25429, 0.05160989, 1.323134, 1, 0, 0.06666667, 1,
2.273419, -1.184738, 2.613325, 1, 0, 0.05882353, 1,
2.277118, 2.037871, -1.550209, 1, 0, 0.05490196, 1,
2.295089, 1.319666, -1.798027, 1, 0, 0.04705882, 1,
2.31001, 1.313423, 0.7032843, 1, 0, 0.04313726, 1,
2.315266, 0.9146467, 2.621677, 1, 0, 0.03529412, 1,
2.352475, -1.099819, 1.314186, 1, 0, 0.03137255, 1,
2.45065, 1.520838, 1.301079, 1, 0, 0.02352941, 1,
2.572197, -1.135019, 0.9504629, 1, 0, 0.01960784, 1,
2.762704, 0.3178477, 2.492108, 1, 0, 0.01176471, 1,
2.89052, 0.3917878, 1.387874, 1, 0, 0.007843138, 1
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
-0.6203163, -4.6513, -7.292854, 0, -0.5, 0.5, 0.5,
-0.6203163, -4.6513, -7.292854, 1, -0.5, 0.5, 0.5,
-0.6203163, -4.6513, -7.292854, 1, 1.5, 0.5, 0.5,
-0.6203163, -4.6513, -7.292854, 0, 1.5, 0.5, 0.5
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
-5.321326, 0.1274906, -7.292854, 0, -0.5, 0.5, 0.5,
-5.321326, 0.1274906, -7.292854, 1, -0.5, 0.5, 0.5,
-5.321326, 0.1274906, -7.292854, 1, 1.5, 0.5, 0.5,
-5.321326, 0.1274906, -7.292854, 0, 1.5, 0.5, 0.5
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
-5.321326, -4.6513, -0.1170068, 0, -0.5, 0.5, 0.5,
-5.321326, -4.6513, -0.1170068, 1, -0.5, 0.5, 0.5,
-5.321326, -4.6513, -0.1170068, 1, 1.5, 0.5, 0.5,
-5.321326, -4.6513, -0.1170068, 0, 1.5, 0.5, 0.5
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
-4, -3.548503, -5.636889,
2, -3.548503, -5.636889,
-4, -3.548503, -5.636889,
-4, -3.732302, -5.912884,
-2, -3.548503, -5.636889,
-2, -3.732302, -5.912884,
0, -3.548503, -5.636889,
0, -3.732302, -5.912884,
2, -3.548503, -5.636889,
2, -3.732302, -5.912884
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
"-4",
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
-4, -4.099902, -6.464872, 0, -0.5, 0.5, 0.5,
-4, -4.099902, -6.464872, 1, -0.5, 0.5, 0.5,
-4, -4.099902, -6.464872, 1, 1.5, 0.5, 0.5,
-4, -4.099902, -6.464872, 0, 1.5, 0.5, 0.5,
-2, -4.099902, -6.464872, 0, -0.5, 0.5, 0.5,
-2, -4.099902, -6.464872, 1, -0.5, 0.5, 0.5,
-2, -4.099902, -6.464872, 1, 1.5, 0.5, 0.5,
-2, -4.099902, -6.464872, 0, 1.5, 0.5, 0.5,
0, -4.099902, -6.464872, 0, -0.5, 0.5, 0.5,
0, -4.099902, -6.464872, 1, -0.5, 0.5, 0.5,
0, -4.099902, -6.464872, 1, 1.5, 0.5, 0.5,
0, -4.099902, -6.464872, 0, 1.5, 0.5, 0.5,
2, -4.099902, -6.464872, 0, -0.5, 0.5, 0.5,
2, -4.099902, -6.464872, 1, -0.5, 0.5, 0.5,
2, -4.099902, -6.464872, 1, 1.5, 0.5, 0.5,
2, -4.099902, -6.464872, 0, 1.5, 0.5, 0.5
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
-4.236478, -2, -5.636889,
-4.236478, 2, -5.636889,
-4.236478, -2, -5.636889,
-4.417286, -2, -5.912884,
-4.236478, 0, -5.636889,
-4.417286, 0, -5.912884,
-4.236478, 2, -5.636889,
-4.417286, 2, -5.912884
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
"0",
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
-4.778902, -2, -6.464872, 0, -0.5, 0.5, 0.5,
-4.778902, -2, -6.464872, 1, -0.5, 0.5, 0.5,
-4.778902, -2, -6.464872, 1, 1.5, 0.5, 0.5,
-4.778902, -2, -6.464872, 0, 1.5, 0.5, 0.5,
-4.778902, 0, -6.464872, 0, -0.5, 0.5, 0.5,
-4.778902, 0, -6.464872, 1, -0.5, 0.5, 0.5,
-4.778902, 0, -6.464872, 1, 1.5, 0.5, 0.5,
-4.778902, 0, -6.464872, 0, 1.5, 0.5, 0.5,
-4.778902, 2, -6.464872, 0, -0.5, 0.5, 0.5,
-4.778902, 2, -6.464872, 1, -0.5, 0.5, 0.5,
-4.778902, 2, -6.464872, 1, 1.5, 0.5, 0.5,
-4.778902, 2, -6.464872, 0, 1.5, 0.5, 0.5
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
-4.236478, -3.548503, -4,
-4.236478, -3.548503, 4,
-4.236478, -3.548503, -4,
-4.417286, -3.732302, -4,
-4.236478, -3.548503, -2,
-4.417286, -3.732302, -2,
-4.236478, -3.548503, 0,
-4.417286, -3.732302, 0,
-4.236478, -3.548503, 2,
-4.417286, -3.732302, 2,
-4.236478, -3.548503, 4,
-4.417286, -3.732302, 4
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
-4.778902, -4.099902, -4, 0, -0.5, 0.5, 0.5,
-4.778902, -4.099902, -4, 1, -0.5, 0.5, 0.5,
-4.778902, -4.099902, -4, 1, 1.5, 0.5, 0.5,
-4.778902, -4.099902, -4, 0, 1.5, 0.5, 0.5,
-4.778902, -4.099902, -2, 0, -0.5, 0.5, 0.5,
-4.778902, -4.099902, -2, 1, -0.5, 0.5, 0.5,
-4.778902, -4.099902, -2, 1, 1.5, 0.5, 0.5,
-4.778902, -4.099902, -2, 0, 1.5, 0.5, 0.5,
-4.778902, -4.099902, 0, 0, -0.5, 0.5, 0.5,
-4.778902, -4.099902, 0, 1, -0.5, 0.5, 0.5,
-4.778902, -4.099902, 0, 1, 1.5, 0.5, 0.5,
-4.778902, -4.099902, 0, 0, 1.5, 0.5, 0.5,
-4.778902, -4.099902, 2, 0, -0.5, 0.5, 0.5,
-4.778902, -4.099902, 2, 1, -0.5, 0.5, 0.5,
-4.778902, -4.099902, 2, 1, 1.5, 0.5, 0.5,
-4.778902, -4.099902, 2, 0, 1.5, 0.5, 0.5,
-4.778902, -4.099902, 4, 0, -0.5, 0.5, 0.5,
-4.778902, -4.099902, 4, 1, -0.5, 0.5, 0.5,
-4.778902, -4.099902, 4, 1, 1.5, 0.5, 0.5,
-4.778902, -4.099902, 4, 0, 1.5, 0.5, 0.5
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
-4.236478, -3.548503, -5.636889,
-4.236478, 3.803484, -5.636889,
-4.236478, -3.548503, 5.402876,
-4.236478, 3.803484, 5.402876,
-4.236478, -3.548503, -5.636889,
-4.236478, -3.548503, 5.402876,
-4.236478, 3.803484, -5.636889,
-4.236478, 3.803484, 5.402876,
-4.236478, -3.548503, -5.636889,
2.995845, -3.548503, -5.636889,
-4.236478, -3.548503, 5.402876,
2.995845, -3.548503, 5.402876,
-4.236478, 3.803484, -5.636889,
2.995845, 3.803484, -5.636889,
-4.236478, 3.803484, 5.402876,
2.995845, 3.803484, 5.402876,
2.995845, -3.548503, -5.636889,
2.995845, 3.803484, -5.636889,
2.995845, -3.548503, 5.402876,
2.995845, 3.803484, 5.402876,
2.995845, -3.548503, -5.636889,
2.995845, -3.548503, 5.402876,
2.995845, 3.803484, -5.636889,
2.995845, 3.803484, 5.402876
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
var radius = 8.067077;
var distance = 35.89134;
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
mvMatrix.translate( 0.6203163, -0.1274906, 0.1170068 );
mvMatrix.scale( 1.206014, 1.186384, 0.7900786 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.89134);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
sodium_dimethyldithi<-read.table("sodium_dimethyldithi.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sodium_dimethyldithi$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dimethyldithi' not found
```

```r
y<-sodium_dimethyldithi$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dimethyldithi' not found
```

```r
z<-sodium_dimethyldithi$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dimethyldithi' not found
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
-4.131153, -0.4492035, -1.453495, 0, 0, 1, 1, 1,
-3.048242, 0.7175987, -1.082266, 1, 0, 0, 1, 1,
-2.699667, 0.248106, -4.872027, 1, 0, 0, 1, 1,
-2.516575, 0.598257, -1.481206, 1, 0, 0, 1, 1,
-2.487107, -0.69287, -3.243413, 1, 0, 0, 1, 1,
-2.464551, 0.2523012, -2.583831, 1, 0, 0, 1, 1,
-2.443435, -0.9223534, -1.101477, 0, 0, 0, 1, 1,
-2.423675, 0.7235807, -1.612637, 0, 0, 0, 1, 1,
-2.396263, -0.0443849, -1.394541, 0, 0, 0, 1, 1,
-2.3935, -0.2856339, -0.8885999, 0, 0, 0, 1, 1,
-2.380059, 0.3774843, 0.3121261, 0, 0, 0, 1, 1,
-2.33316, 1.509392, -2.261323, 0, 0, 0, 1, 1,
-2.314125, -0.5876757, -1.371988, 0, 0, 0, 1, 1,
-2.266766, -0.1475224, -1.825087, 1, 1, 1, 1, 1,
-2.242398, -0.2878177, -3.197371, 1, 1, 1, 1, 1,
-2.224133, -0.5206594, 0.03896794, 1, 1, 1, 1, 1,
-2.222136, -0.912264, 0.1146737, 1, 1, 1, 1, 1,
-2.180925, 1.435385, -1.918058, 1, 1, 1, 1, 1,
-2.175409, 0.1681737, -2.1343, 1, 1, 1, 1, 1,
-2.164943, 0.709608, -1.262097, 1, 1, 1, 1, 1,
-2.069467, 0.9803437, -0.5722998, 1, 1, 1, 1, 1,
-2.064534, -2.145263, -2.523865, 1, 1, 1, 1, 1,
-2.048886, -1.070341, -1.734144, 1, 1, 1, 1, 1,
-2.04064, 1.682443, -1.902699, 1, 1, 1, 1, 1,
-2.039236, 0.7512985, -1.964148, 1, 1, 1, 1, 1,
-2.024871, -1.119428, -1.779856, 1, 1, 1, 1, 1,
-1.895362, 1.051911, -2.171732, 1, 1, 1, 1, 1,
-1.890376, -0.07098831, 0.3662012, 1, 1, 1, 1, 1,
-1.84684, -0.9620924, -3.184786, 0, 0, 1, 1, 1,
-1.846763, -1.178711, -1.133441, 1, 0, 0, 1, 1,
-1.824694, -1.20239, -1.724239, 1, 0, 0, 1, 1,
-1.792585, 0.5440143, -2.711659, 1, 0, 0, 1, 1,
-1.780712, 0.9004366, -0.3107819, 1, 0, 0, 1, 1,
-1.756029, -0.7486271, -2.666663, 1, 0, 0, 1, 1,
-1.71949, 0.148229, -0.3896962, 0, 0, 0, 1, 1,
-1.719186, -1.169497, -2.833476, 0, 0, 0, 1, 1,
-1.684936, -1.605595, -0.2893361, 0, 0, 0, 1, 1,
-1.684633, 0.4721599, -0.7918865, 0, 0, 0, 1, 1,
-1.675943, 0.3896616, -2.925252, 0, 0, 0, 1, 1,
-1.663212, -0.4173751, -2.221941, 0, 0, 0, 1, 1,
-1.655704, -0.1376362, -2.40351, 0, 0, 0, 1, 1,
-1.646126, -1.105175, -2.282567, 1, 1, 1, 1, 1,
-1.640063, 0.3171656, -1.2826, 1, 1, 1, 1, 1,
-1.637421, 0.3346773, -0.6942967, 1, 1, 1, 1, 1,
-1.617583, 0.4423491, -1.74437, 1, 1, 1, 1, 1,
-1.617048, 1.889055, -0.1793091, 1, 1, 1, 1, 1,
-1.612793, 1.139756, 0.5555078, 1, 1, 1, 1, 1,
-1.611513, 1.066902, -0.5594816, 1, 1, 1, 1, 1,
-1.60714, -0.2847725, -2.128422, 1, 1, 1, 1, 1,
-1.601542, -1.017319, -3.315861, 1, 1, 1, 1, 1,
-1.601377, -0.8052683, -1.975283, 1, 1, 1, 1, 1,
-1.59461, 0.9907928, -0.4519685, 1, 1, 1, 1, 1,
-1.585765, -2.11885, -3.146844, 1, 1, 1, 1, 1,
-1.585069, 0.7336953, -1.769448, 1, 1, 1, 1, 1,
-1.572349, 0.8030603, 0.373224, 1, 1, 1, 1, 1,
-1.554885, 1.006549, 0.1614876, 1, 1, 1, 1, 1,
-1.552459, 1.339879, 0.5801055, 0, 0, 1, 1, 1,
-1.545892, -0.5569933, -2.144353, 1, 0, 0, 1, 1,
-1.526867, 0.4365982, -1.255245, 1, 0, 0, 1, 1,
-1.521046, -0.1130571, -1.238902, 1, 0, 0, 1, 1,
-1.517062, 0.2306471, -1.893297, 1, 0, 0, 1, 1,
-1.512549, -0.3757418, -2.515564, 1, 0, 0, 1, 1,
-1.510994, 0.94677, -0.523427, 0, 0, 0, 1, 1,
-1.509863, 0.5168375, -3.349354, 0, 0, 0, 1, 1,
-1.501152, 1.487963, -1.058833, 0, 0, 0, 1, 1,
-1.483554, -0.5277277, -0.4745083, 0, 0, 0, 1, 1,
-1.462685, -0.6926559, -1.744133, 0, 0, 0, 1, 1,
-1.462485, 0.6588303, -1.708739, 0, 0, 0, 1, 1,
-1.446095, 0.2660999, -0.4088076, 0, 0, 0, 1, 1,
-1.444632, -0.866787, -1.477374, 1, 1, 1, 1, 1,
-1.442524, -0.6770477, -1.870507, 1, 1, 1, 1, 1,
-1.42864, -1.397136, -1.691286, 1, 1, 1, 1, 1,
-1.422691, -0.7299815, -2.31986, 1, 1, 1, 1, 1,
-1.422101, 0.234405, -2.752978, 1, 1, 1, 1, 1,
-1.419461, -0.0140503, 0.01276954, 1, 1, 1, 1, 1,
-1.389865, -0.184904, -1.659562, 1, 1, 1, 1, 1,
-1.370566, 0.5042065, -1.482338, 1, 1, 1, 1, 1,
-1.366854, 0.4819913, -2.568333, 1, 1, 1, 1, 1,
-1.364921, 0.138409, -1.418943, 1, 1, 1, 1, 1,
-1.364545, -0.1992968, -0.1870331, 1, 1, 1, 1, 1,
-1.354238, -1.048763, -0.4870094, 1, 1, 1, 1, 1,
-1.352118, -2.564735, -1.165428, 1, 1, 1, 1, 1,
-1.348856, 0.1194089, -0.01079138, 1, 1, 1, 1, 1,
-1.34576, -0.02391552, -1.879338, 1, 1, 1, 1, 1,
-1.33622, 1.586164, 0.3189408, 0, 0, 1, 1, 1,
-1.327902, -0.4332066, -2.601857, 1, 0, 0, 1, 1,
-1.319906, -1.746772, -2.537645, 1, 0, 0, 1, 1,
-1.315947, 0.6251951, -3.601414, 1, 0, 0, 1, 1,
-1.295662, -1.147317, -3.026844, 1, 0, 0, 1, 1,
-1.295072, 1.463823, 0.5308352, 1, 0, 0, 1, 1,
-1.293287, 0.5554758, -1.447029, 0, 0, 0, 1, 1,
-1.291151, 1.144624, -0.2398931, 0, 0, 0, 1, 1,
-1.285157, 0.717788, -2.440012, 0, 0, 0, 1, 1,
-1.284878, 1.122759, -2.314892, 0, 0, 0, 1, 1,
-1.284333, 1.549456, 0.7609002, 0, 0, 0, 1, 1,
-1.268655, -0.5547923, -1.794197, 0, 0, 0, 1, 1,
-1.268346, 1.379957, 0.2482314, 0, 0, 0, 1, 1,
-1.255188, -0.2622569, -2.951212, 1, 1, 1, 1, 1,
-1.24698, 0.574474, -1.181238, 1, 1, 1, 1, 1,
-1.232824, -1.020263, -1.726789, 1, 1, 1, 1, 1,
-1.215208, -0.05705716, -0.8243496, 1, 1, 1, 1, 1,
-1.207448, 1.437782, -0.8819144, 1, 1, 1, 1, 1,
-1.206069, -0.8955672, -2.00202, 1, 1, 1, 1, 1,
-1.195424, 0.07496792, -1.322816, 1, 1, 1, 1, 1,
-1.195121, 1.446788, 0.989791, 1, 1, 1, 1, 1,
-1.194005, 1.290935, 1.122675, 1, 1, 1, 1, 1,
-1.189323, 1.080616, -0.7715595, 1, 1, 1, 1, 1,
-1.173056, -0.6206908, -2.137625, 1, 1, 1, 1, 1,
-1.171584, -1.295613, -2.899058, 1, 1, 1, 1, 1,
-1.170753, -0.5270148, -1.512329, 1, 1, 1, 1, 1,
-1.16693, -0.5959578, -4.230547, 1, 1, 1, 1, 1,
-1.161014, 0.5042444, -1.644805, 1, 1, 1, 1, 1,
-1.157112, -0.04701433, -1.38004, 0, 0, 1, 1, 1,
-1.152802, -0.5821574, -1.515368, 1, 0, 0, 1, 1,
-1.150091, -1.409724, -1.870496, 1, 0, 0, 1, 1,
-1.135833, -0.9061137, -2.561118, 1, 0, 0, 1, 1,
-1.135263, -0.7047852, -0.5012854, 1, 0, 0, 1, 1,
-1.134274, -0.1230298, -0.03804263, 1, 0, 0, 1, 1,
-1.134155, 1.635305, -1.849683, 0, 0, 0, 1, 1,
-1.123176, 0.01099177, -0.8203723, 0, 0, 0, 1, 1,
-1.117501, -1.65924, -2.848531, 0, 0, 0, 1, 1,
-1.117197, 0.3549455, -2.371592, 0, 0, 0, 1, 1,
-1.105257, 0.05979774, -2.933208, 0, 0, 0, 1, 1,
-1.087171, -0.04793418, -2.374769, 0, 0, 0, 1, 1,
-1.077005, 0.8561468, -1.025864, 0, 0, 0, 1, 1,
-1.076001, 1.4997, -2.199878, 1, 1, 1, 1, 1,
-1.075662, 0.765944, -0.5807069, 1, 1, 1, 1, 1,
-1.073842, 0.439592, -0.1700488, 1, 1, 1, 1, 1,
-1.073076, -1.422979, -3.132073, 1, 1, 1, 1, 1,
-1.071803, -0.2790129, -0.8400304, 1, 1, 1, 1, 1,
-1.069257, 1.24861, 0.06740408, 1, 1, 1, 1, 1,
-1.066325, 0.1849719, 0.5437557, 1, 1, 1, 1, 1,
-1.064402, -0.9799476, -2.967357, 1, 1, 1, 1, 1,
-1.06222, 0.2827172, -3.143672, 1, 1, 1, 1, 1,
-1.057814, -0.2240119, -3.551401, 1, 1, 1, 1, 1,
-1.057626, 0.4329098, -3.274008, 1, 1, 1, 1, 1,
-1.055299, 0.04353995, -2.098668, 1, 1, 1, 1, 1,
-1.05364, 1.786561, 1.991041, 1, 1, 1, 1, 1,
-1.049645, 0.2909918, -0.9270288, 1, 1, 1, 1, 1,
-1.038837, -1.532814, 0.284967, 1, 1, 1, 1, 1,
-1.034603, 1.551103, -2.508499, 0, 0, 1, 1, 1,
-1.033073, -0.7755483, -2.542591, 1, 0, 0, 1, 1,
-1.032298, -0.7202328, -3.879134, 1, 0, 0, 1, 1,
-1.016583, 1.727846, -1.746891, 1, 0, 0, 1, 1,
-1.011863, -0.4550948, -1.662953, 1, 0, 0, 1, 1,
-1.005565, -0.04500927, -2.243683, 1, 0, 0, 1, 1,
-0.9958849, 3.050297, -0.1049131, 0, 0, 0, 1, 1,
-0.9916457, -0.3723595, -3.124317, 0, 0, 0, 1, 1,
-0.9769866, -0.9352096, -0.9178948, 0, 0, 0, 1, 1,
-0.9751657, 0.4722059, -3.324383, 0, 0, 0, 1, 1,
-0.9695742, -0.7968969, -2.707051, 0, 0, 0, 1, 1,
-0.9651641, 0.5190752, -2.426341, 0, 0, 0, 1, 1,
-0.9626677, 0.4119421, -1.431701, 0, 0, 0, 1, 1,
-0.9569139, -0.821954, -3.155805, 1, 1, 1, 1, 1,
-0.9511982, 0.3934253, -2.554645, 1, 1, 1, 1, 1,
-0.9511102, -0.1257856, -1.159421, 1, 1, 1, 1, 1,
-0.9474959, 0.5313666, -1.612504, 1, 1, 1, 1, 1,
-0.9469227, 1.411839, -0.5519316, 1, 1, 1, 1, 1,
-0.9382394, 1.790827, -0.4613225, 1, 1, 1, 1, 1,
-0.9367849, 0.1792519, -0.5876288, 1, 1, 1, 1, 1,
-0.926985, 1.157896, -0.2032383, 1, 1, 1, 1, 1,
-0.92546, -0.09853345, -2.05181, 1, 1, 1, 1, 1,
-0.9135637, 0.227779, -2.176776, 1, 1, 1, 1, 1,
-0.9126787, -0.5817111, -1.534971, 1, 1, 1, 1, 1,
-0.9123471, -1.143566, -1.70774, 1, 1, 1, 1, 1,
-0.9102333, 0.3598716, -2.377749, 1, 1, 1, 1, 1,
-0.9089772, 0.1176274, -2.586645, 1, 1, 1, 1, 1,
-0.9061664, 0.3264185, -1.942508, 1, 1, 1, 1, 1,
-0.905495, -1.320538, -3.976136, 0, 0, 1, 1, 1,
-0.897633, -0.1827406, -0.8151494, 1, 0, 0, 1, 1,
-0.8961129, 0.008546818, -1.484053, 1, 0, 0, 1, 1,
-0.8953582, 0.936649, -0.01586611, 1, 0, 0, 1, 1,
-0.8800909, 1.528263, -0.5104939, 1, 0, 0, 1, 1,
-0.872771, -0.8685259, -3.062148, 1, 0, 0, 1, 1,
-0.8650821, -1.094705, -1.908353, 0, 0, 0, 1, 1,
-0.8639627, 0.02085613, -1.557163, 0, 0, 0, 1, 1,
-0.8621871, 1.120995, -0.1384756, 0, 0, 0, 1, 1,
-0.8613724, 0.0930765, -0.08764458, 0, 0, 0, 1, 1,
-0.8613238, -0.08535992, -0.7021523, 0, 0, 0, 1, 1,
-0.8601701, 0.1849729, -0.7100218, 0, 0, 0, 1, 1,
-0.8591273, 1.198225, -0.9887996, 0, 0, 0, 1, 1,
-0.8571134, -0.03221595, -1.590394, 1, 1, 1, 1, 1,
-0.8551664, 0.353839, -0.6477551, 1, 1, 1, 1, 1,
-0.8492315, 1.266788, -1.970998, 1, 1, 1, 1, 1,
-0.8453242, 0.8651855, -1.162341, 1, 1, 1, 1, 1,
-0.8305309, -0.6793023, -1.407655, 1, 1, 1, 1, 1,
-0.8302791, -0.04474279, -2.66108, 1, 1, 1, 1, 1,
-0.8288758, 0.6555162, -2.644945, 1, 1, 1, 1, 1,
-0.8258659, 0.7341962, -0.7749201, 1, 1, 1, 1, 1,
-0.8250461, 2.314454, 1.510276, 1, 1, 1, 1, 1,
-0.8208681, -0.0324198, -0.3216166, 1, 1, 1, 1, 1,
-0.819851, 0.3067167, -3.530116, 1, 1, 1, 1, 1,
-0.8169743, 0.380082, -1.875641, 1, 1, 1, 1, 1,
-0.8139488, -0.3722442, -1.815519, 1, 1, 1, 1, 1,
-0.8093327, 0.719987, -1.466854, 1, 1, 1, 1, 1,
-0.8066918, 0.920658, -0.05675118, 1, 1, 1, 1, 1,
-0.8008832, 1.679059, -1.412926, 0, 0, 1, 1, 1,
-0.8006013, -0.3913904, -3.174795, 1, 0, 0, 1, 1,
-0.7946066, -1.532245, -3.045142, 1, 0, 0, 1, 1,
-0.7945481, -0.4785028, -1.299314, 1, 0, 0, 1, 1,
-0.7918355, -0.1298752, -2.207116, 1, 0, 0, 1, 1,
-0.7909997, -0.05187917, -3.064724, 1, 0, 0, 1, 1,
-0.7888055, 0.4645039, 0.02624727, 0, 0, 0, 1, 1,
-0.7857, 0.3245345, -1.3376, 0, 0, 0, 1, 1,
-0.7757252, -1.309929, -3.329096, 0, 0, 0, 1, 1,
-0.7744819, -0.7278634, -1.487192, 0, 0, 0, 1, 1,
-0.773439, -1.185579, -3.650908, 0, 0, 0, 1, 1,
-0.7725346, -0.2079062, -2.286247, 0, 0, 0, 1, 1,
-0.767357, -1.1531, -2.827754, 0, 0, 0, 1, 1,
-0.7661435, -1.409106, -1.744133, 1, 1, 1, 1, 1,
-0.7619366, 0.2586469, -1.911222, 1, 1, 1, 1, 1,
-0.7610779, 1.340064, 0.2327862, 1, 1, 1, 1, 1,
-0.7607448, -0.8530188, -2.176148, 1, 1, 1, 1, 1,
-0.7600406, -0.4248559, -2.813864, 1, 1, 1, 1, 1,
-0.7530067, 0.7235203, -0.6469508, 1, 1, 1, 1, 1,
-0.7506104, 0.1196436, -0.7350016, 1, 1, 1, 1, 1,
-0.7488607, -1.3915, -2.252498, 1, 1, 1, 1, 1,
-0.7438756, -0.636025, -1.314456, 1, 1, 1, 1, 1,
-0.742419, 0.02571934, -1.471537, 1, 1, 1, 1, 1,
-0.7423342, 0.8193154, -1.108176, 1, 1, 1, 1, 1,
-0.7394704, 0.5718099, -0.4702841, 1, 1, 1, 1, 1,
-0.7394202, -0.2429301, -0.416172, 1, 1, 1, 1, 1,
-0.7391443, -1.163573, -3.18788, 1, 1, 1, 1, 1,
-0.7391377, -0.3947225, -1.505042, 1, 1, 1, 1, 1,
-0.7368666, -1.342888, -3.884447, 0, 0, 1, 1, 1,
-0.7363141, -2.002171, -3.561248, 1, 0, 0, 1, 1,
-0.7305263, -1.679458, -3.6933, 1, 0, 0, 1, 1,
-0.7298717, 1.134032, 0.6768088, 1, 0, 0, 1, 1,
-0.7247092, 1.052011, -0.8441576, 1, 0, 0, 1, 1,
-0.7156315, -0.4104957, -2.438967, 1, 0, 0, 1, 1,
-0.7142673, 2.098322, -0.4123421, 0, 0, 0, 1, 1,
-0.7116773, 0.8635467, -2.055386, 0, 0, 0, 1, 1,
-0.7111765, -0.8311163, -1.305735, 0, 0, 0, 1, 1,
-0.7108229, 1.036347, 1.598839, 0, 0, 0, 1, 1,
-0.709596, 1.402322, 0.856589, 0, 0, 0, 1, 1,
-0.7042586, -1.27213, -3.419303, 0, 0, 0, 1, 1,
-0.692812, 1.340754, -1.408947, 0, 0, 0, 1, 1,
-0.6927137, -0.1797194, -1.849873, 1, 1, 1, 1, 1,
-0.6916986, 0.4146293, -1.194867, 1, 1, 1, 1, 1,
-0.6912982, -0.8910246, -1.041111, 1, 1, 1, 1, 1,
-0.6888813, 2.089814, 0.5095055, 1, 1, 1, 1, 1,
-0.6846933, 0.007903904, -0.7488044, 1, 1, 1, 1, 1,
-0.6829685, -0.5385504, -1.910002, 1, 1, 1, 1, 1,
-0.6660667, -0.9979991, -2.928078, 1, 1, 1, 1, 1,
-0.6581932, -1.558876, -2.831044, 1, 1, 1, 1, 1,
-0.657163, 1.812173, 0.4879788, 1, 1, 1, 1, 1,
-0.6567259, -1.163056, -2.691188, 1, 1, 1, 1, 1,
-0.6553425, -1.136147, -1.754596, 1, 1, 1, 1, 1,
-0.6549777, 0.2886108, -2.292978, 1, 1, 1, 1, 1,
-0.6512471, -0.9856305, -3.250205, 1, 1, 1, 1, 1,
-0.6484749, -0.5344487, -2.131747, 1, 1, 1, 1, 1,
-0.6483232, -1.194527, -2.13877, 1, 1, 1, 1, 1,
-0.6437989, -2.566069, -4.386219, 0, 0, 1, 1, 1,
-0.6380517, -0.7043576, -0.8858739, 1, 0, 0, 1, 1,
-0.6367301, -1.707259, -3.529925, 1, 0, 0, 1, 1,
-0.6323828, 0.688378, 0.06923522, 1, 0, 0, 1, 1,
-0.6248953, 1.223027, 0.3810044, 1, 0, 0, 1, 1,
-0.6215797, 0.8417453, 0.8933001, 1, 0, 0, 1, 1,
-0.6159829, 0.5506335, -1.673289, 0, 0, 0, 1, 1,
-0.6158065, -0.6324497, -2.298077, 0, 0, 0, 1, 1,
-0.615629, 0.04092225, -1.372531, 0, 0, 0, 1, 1,
-0.6057082, -0.3779675, -1.737581, 0, 0, 0, 1, 1,
-0.6049195, 0.2635641, -0.5774788, 0, 0, 0, 1, 1,
-0.6045459, 2.789568, -2.443628, 0, 0, 0, 1, 1,
-0.6018645, -0.728688, -2.905513, 0, 0, 0, 1, 1,
-0.5977031, 0.01546265, -0.5868002, 1, 1, 1, 1, 1,
-0.5920954, -3.331395, -2.951233, 1, 1, 1, 1, 1,
-0.5903867, -1.070428, -3.616762, 1, 1, 1, 1, 1,
-0.5881123, 1.088602, -0.09674818, 1, 1, 1, 1, 1,
-0.5849429, -0.4288943, -2.169401, 1, 1, 1, 1, 1,
-0.5791428, 0.3346201, -1.838374, 1, 1, 1, 1, 1,
-0.5713655, 1.332175, -0.6380178, 1, 1, 1, 1, 1,
-0.5710244, -0.1444193, -2.617331, 1, 1, 1, 1, 1,
-0.5685981, 1.255783, -0.5932086, 1, 1, 1, 1, 1,
-0.567808, -0.4240685, -0.5148845, 1, 1, 1, 1, 1,
-0.5656303, 0.4223641, -1.287717, 1, 1, 1, 1, 1,
-0.5602629, -1.778876, -4.351174, 1, 1, 1, 1, 1,
-0.5571927, 1.181357, 0.294693, 1, 1, 1, 1, 1,
-0.5558485, 1.101137, -0.7328179, 1, 1, 1, 1, 1,
-0.5557779, -0.5954223, -0.9578854, 1, 1, 1, 1, 1,
-0.5482699, 0.8012335, -0.8723835, 0, 0, 1, 1, 1,
-0.5479292, 0.09927741, -1.007902, 1, 0, 0, 1, 1,
-0.5471904, -0.2978277, -0.7001998, 1, 0, 0, 1, 1,
-0.5453911, -0.0845553, -2.681379, 1, 0, 0, 1, 1,
-0.5449759, 0.322379, -1.667535, 1, 0, 0, 1, 1,
-0.5435629, 0.4867239, 0.08160622, 1, 0, 0, 1, 1,
-0.5417641, -1.754824, -2.063925, 0, 0, 0, 1, 1,
-0.5399217, 2.122094, 0.3303682, 0, 0, 0, 1, 1,
-0.5336049, 0.8176641, -1.13445, 0, 0, 0, 1, 1,
-0.5331885, 1.063425, -0.4766472, 0, 0, 0, 1, 1,
-0.5310247, 0.4870908, -0.6318821, 0, 0, 0, 1, 1,
-0.5287608, 1.742788, -1.245849, 0, 0, 0, 1, 1,
-0.5281302, -0.02689286, -1.466217, 0, 0, 0, 1, 1,
-0.5234485, 0.006327014, -2.688712, 1, 1, 1, 1, 1,
-0.5130726, 0.1303628, -2.802767, 1, 1, 1, 1, 1,
-0.5079648, -0.3894087, -1.353507, 1, 1, 1, 1, 1,
-0.5058579, -0.70829, -2.112179, 1, 1, 1, 1, 1,
-0.5058183, -0.8569626, -0.5288711, 1, 1, 1, 1, 1,
-0.505397, 1.091253, -1.894489, 1, 1, 1, 1, 1,
-0.5035929, -1.737483, -3.109854, 1, 1, 1, 1, 1,
-0.4975558, 1.414548, -1.896312, 1, 1, 1, 1, 1,
-0.4861819, -1.014432, -5.008506, 1, 1, 1, 1, 1,
-0.4819973, -1.00377, -2.263594, 1, 1, 1, 1, 1,
-0.4803888, 2.082264, 0.3847201, 1, 1, 1, 1, 1,
-0.4800832, -0.08071432, -0.6155833, 1, 1, 1, 1, 1,
-0.4770664, 1.62796, 3.116792, 1, 1, 1, 1, 1,
-0.4759577, 0.4855325, -0.07710338, 1, 1, 1, 1, 1,
-0.4715573, 0.2331723, -0.2105864, 1, 1, 1, 1, 1,
-0.4712134, -0.4073929, -1.352278, 0, 0, 1, 1, 1,
-0.4641703, -1.559111, -3.461032, 1, 0, 0, 1, 1,
-0.461396, 1.394839, -1.352377, 1, 0, 0, 1, 1,
-0.460723, 1.936457, -0.7486477, 1, 0, 0, 1, 1,
-0.4603491, 0.2617992, -1.707446, 1, 0, 0, 1, 1,
-0.4582958, -0.8280489, -3.301804, 1, 0, 0, 1, 1,
-0.458103, -0.780186, -0.9094124, 0, 0, 0, 1, 1,
-0.4572765, -0.795608, -2.073602, 0, 0, 0, 1, 1,
-0.4572203, -0.0371732, -1.517587, 0, 0, 0, 1, 1,
-0.4528667, 1.262554, -0.7833832, 0, 0, 0, 1, 1,
-0.4523306, -0.2313103, -3.45742, 0, 0, 0, 1, 1,
-0.4462615, -0.1839163, -2.696257, 0, 0, 0, 1, 1,
-0.4452034, -0.3042953, -1.304585, 0, 0, 0, 1, 1,
-0.441187, 1.03921, -1.322581, 1, 1, 1, 1, 1,
-0.4402395, 1.234985, -2.081434, 1, 1, 1, 1, 1,
-0.4399494, 0.5773385, -0.4023326, 1, 1, 1, 1, 1,
-0.4309169, -1.347358, -4.62333, 1, 1, 1, 1, 1,
-0.4265569, 0.4444025, 1.299705, 1, 1, 1, 1, 1,
-0.4246278, -0.484322, -4.012979, 1, 1, 1, 1, 1,
-0.4243634, 0.616178, -1.317551, 1, 1, 1, 1, 1,
-0.4242418, -0.2817421, -3.885682, 1, 1, 1, 1, 1,
-0.4225031, -0.2252872, -1.043563, 1, 1, 1, 1, 1,
-0.4217831, -0.4547971, -3.050245, 1, 1, 1, 1, 1,
-0.4216351, 3.696416, -1.002231, 1, 1, 1, 1, 1,
-0.4202988, 0.2467818, -2.071241, 1, 1, 1, 1, 1,
-0.413592, 0.2605864, -1.842092, 1, 1, 1, 1, 1,
-0.4118626, -0.2635471, -1.443278, 1, 1, 1, 1, 1,
-0.4100585, -1.925768, -3.174255, 1, 1, 1, 1, 1,
-0.4094039, 0.5897369, 0.7996609, 0, 0, 1, 1, 1,
-0.4078017, -2.793374, -2.117355, 1, 0, 0, 1, 1,
-0.4051942, -0.2084232, -0.8745486, 1, 0, 0, 1, 1,
-0.3984866, -0.1094775, -2.920538, 1, 0, 0, 1, 1,
-0.3969596, 1.364534, -1.716197, 1, 0, 0, 1, 1,
-0.3961461, 0.513514, -2.72652, 1, 0, 0, 1, 1,
-0.3957127, 1.095383, -1.434862, 0, 0, 0, 1, 1,
-0.3915162, 1.342561, -1.886905, 0, 0, 0, 1, 1,
-0.3902137, -1.601239, -3.35027, 0, 0, 0, 1, 1,
-0.388894, -0.3948824, -3.037852, 0, 0, 0, 1, 1,
-0.3857583, -1.102378, -4.01969, 0, 0, 0, 1, 1,
-0.3826327, 1.628999, -0.3487199, 0, 0, 0, 1, 1,
-0.3802596, -1.316904, -4.319061, 0, 0, 0, 1, 1,
-0.3791357, 0.147464, -1.914732, 1, 1, 1, 1, 1,
-0.3740738, 0.7224301, -0.5609441, 1, 1, 1, 1, 1,
-0.3736209, -0.4346664, -0.6737678, 1, 1, 1, 1, 1,
-0.3716389, 0.008860331, -2.057076, 1, 1, 1, 1, 1,
-0.3671352, 0.1995212, -0.6779252, 1, 1, 1, 1, 1,
-0.3665653, -0.2468262, -3.332129, 1, 1, 1, 1, 1,
-0.3664614, 1.935239, -0.04914704, 1, 1, 1, 1, 1,
-0.3620589, -0.3032093, -2.293788, 1, 1, 1, 1, 1,
-0.3617728, 2.296051, -0.2576199, 1, 1, 1, 1, 1,
-0.3612426, -0.6588544, -2.16761, 1, 1, 1, 1, 1,
-0.360028, -0.2097333, -0.2640015, 1, 1, 1, 1, 1,
-0.3544675, -1.25932, -2.697364, 1, 1, 1, 1, 1,
-0.3541103, -0.5639383, -0.7919791, 1, 1, 1, 1, 1,
-0.3503245, 1.371751, -1.819264, 1, 1, 1, 1, 1,
-0.3469811, -2.620112, -1.055421, 1, 1, 1, 1, 1,
-0.3441865, 0.2444864, 0.2662373, 0, 0, 1, 1, 1,
-0.3375123, -0.6566091, -1.557837, 1, 0, 0, 1, 1,
-0.3371502, -0.2407513, -2.431924, 1, 0, 0, 1, 1,
-0.3370668, 0.5457719, -0.7599306, 1, 0, 0, 1, 1,
-0.3345077, -1.692146, -3.308963, 1, 0, 0, 1, 1,
-0.3334477, 0.6181415, -0.1871942, 1, 0, 0, 1, 1,
-0.3307257, 0.4821127, -0.1124878, 0, 0, 0, 1, 1,
-0.3298588, -1.403613, -1.962898, 0, 0, 0, 1, 1,
-0.3294888, -1.341529, -4.778447, 0, 0, 0, 1, 1,
-0.3259492, 0.1771518, -1.0819, 0, 0, 0, 1, 1,
-0.3211212, 0.01478334, -1.981124, 0, 0, 0, 1, 1,
-0.3151225, -0.5241041, -2.855266, 0, 0, 0, 1, 1,
-0.314671, -1.609442, -1.8719, 0, 0, 0, 1, 1,
-0.3143078, -0.130466, -2.23148, 1, 1, 1, 1, 1,
-0.3131365, -0.0294566, -2.681983, 1, 1, 1, 1, 1,
-0.3113665, 0.5158224, -1.241986, 1, 1, 1, 1, 1,
-0.3101258, -0.5168072, -2.031324, 1, 1, 1, 1, 1,
-0.3057506, 0.6390124, -1.652389, 1, 1, 1, 1, 1,
-0.3015306, -0.6386046, -3.643471, 1, 1, 1, 1, 1,
-0.2998174, -0.2867799, -1.966099, 1, 1, 1, 1, 1,
-0.2954222, -0.03524273, -0.9589895, 1, 1, 1, 1, 1,
-0.2946374, 1.934524, -0.3744839, 1, 1, 1, 1, 1,
-0.2933771, -0.9574987, -2.35117, 1, 1, 1, 1, 1,
-0.2897966, 0.2433249, -0.2857146, 1, 1, 1, 1, 1,
-0.2826848, -0.7775095, -3.258485, 1, 1, 1, 1, 1,
-0.2772558, 2.269407, -0.1247925, 1, 1, 1, 1, 1,
-0.2752622, 1.271016, -2.054145, 1, 1, 1, 1, 1,
-0.2739037, -1.493836, -2.014177, 1, 1, 1, 1, 1,
-0.2735289, 1.679706, -1.106711, 0, 0, 1, 1, 1,
-0.2721606, -0.8527474, -4.130578, 1, 0, 0, 1, 1,
-0.2694154, 0.5995634, -1.059659, 1, 0, 0, 1, 1,
-0.2681035, -0.3777299, -1.85345, 1, 0, 0, 1, 1,
-0.2648969, 0.1746442, -1.185998, 1, 0, 0, 1, 1,
-0.2648661, -0.01782871, -2.423206, 1, 0, 0, 1, 1,
-0.259701, 1.54852, -1.333521, 0, 0, 0, 1, 1,
-0.2585379, -1.922871, -2.091892, 0, 0, 0, 1, 1,
-0.2579219, 1.493522, 1.298423, 0, 0, 0, 1, 1,
-0.2546322, 0.5565611, 0.6082882, 0, 0, 0, 1, 1,
-0.2519853, 0.713751, -1.412135, 0, 0, 0, 1, 1,
-0.2510883, 1.301491, -0.2479729, 0, 0, 0, 1, 1,
-0.2500846, 0.1999354, -1.292245, 0, 0, 0, 1, 1,
-0.2473768, -0.02581532, -3.995013, 1, 1, 1, 1, 1,
-0.2414827, 0.701059, 0.05255451, 1, 1, 1, 1, 1,
-0.2410274, -1.743068, -3.858225, 1, 1, 1, 1, 1,
-0.2381068, -0.6439329, -2.043297, 1, 1, 1, 1, 1,
-0.2362572, -0.6698788, -2.816496, 1, 1, 1, 1, 1,
-0.2359512, -1.071631, -1.527286, 1, 1, 1, 1, 1,
-0.2348776, -1.177373, -3.355305, 1, 1, 1, 1, 1,
-0.2317048, 0.9606602, -0.2559608, 1, 1, 1, 1, 1,
-0.2212923, -0.2971307, -2.677119, 1, 1, 1, 1, 1,
-0.2204999, -0.2601165, -2.502128, 1, 1, 1, 1, 1,
-0.2187261, 0.3524537, -0.2145045, 1, 1, 1, 1, 1,
-0.2178454, -1.688266, -4.503212, 1, 1, 1, 1, 1,
-0.2157525, 0.7814003, -2.023462, 1, 1, 1, 1, 1,
-0.2131003, -0.1427602, -1.879889, 1, 1, 1, 1, 1,
-0.2102882, -0.8160809, -3.285878, 1, 1, 1, 1, 1,
-0.2089784, 0.4686201, 0.6919409, 0, 0, 1, 1, 1,
-0.2029248, 0.615259, 0.4466715, 1, 0, 0, 1, 1,
-0.2019558, -0.8561676, -4.202386, 1, 0, 0, 1, 1,
-0.1992215, -0.2745954, -1.516164, 1, 0, 0, 1, 1,
-0.1956705, 0.3519098, -0.9962555, 1, 0, 0, 1, 1,
-0.1943182, 1.943534, 0.07878729, 1, 0, 0, 1, 1,
-0.1930611, -0.4529143, -2.465334, 0, 0, 0, 1, 1,
-0.1923287, -0.2217858, -3.43304, 0, 0, 0, 1, 1,
-0.1904686, -0.7018296, -3.660751, 0, 0, 0, 1, 1,
-0.1888534, -1.363018, -1.550214, 0, 0, 0, 1, 1,
-0.1819724, 1.367419, -0.441805, 0, 0, 0, 1, 1,
-0.1796414, 1.052905, 0.9162093, 0, 0, 0, 1, 1,
-0.1672707, 0.1340282, -0.907902, 0, 0, 0, 1, 1,
-0.1647131, 1.668128, -0.6501724, 1, 1, 1, 1, 1,
-0.1593624, -0.5530446, -1.947712, 1, 1, 1, 1, 1,
-0.1495362, 0.3252378, -2.344565, 1, 1, 1, 1, 1,
-0.1461825, -0.9389557, -3.292418, 1, 1, 1, 1, 1,
-0.1443527, 0.6822159, -1.19265, 1, 1, 1, 1, 1,
-0.1332465, -1.268636, -2.486631, 1, 1, 1, 1, 1,
-0.1294547, -1.308098, -2.784741, 1, 1, 1, 1, 1,
-0.1274996, -0.4025141, -4.810956, 1, 1, 1, 1, 1,
-0.1247831, 1.717036, 1.081031, 1, 1, 1, 1, 1,
-0.1243647, -0.000475786, -2.648474, 1, 1, 1, 1, 1,
-0.1242321, 1.006464, -0.8917748, 1, 1, 1, 1, 1,
-0.1219157, 0.08407797, -1.765372, 1, 1, 1, 1, 1,
-0.1214529, 1.416192, 1.295596, 1, 1, 1, 1, 1,
-0.1196597, 0.4726324, 0.8243502, 1, 1, 1, 1, 1,
-0.1162937, -0.08101226, -1.715927, 1, 1, 1, 1, 1,
-0.1150935, 0.02702927, -0.9740157, 0, 0, 1, 1, 1,
-0.1149916, 1.165449, -0.9662197, 1, 0, 0, 1, 1,
-0.1107124, 0.1027371, -0.5197473, 1, 0, 0, 1, 1,
-0.1083092, -0.8987318, -3.77508, 1, 0, 0, 1, 1,
-0.105275, 2.38293, -0.1884371, 1, 0, 0, 1, 1,
-0.1036576, -0.1568203, -2.905025, 1, 0, 0, 1, 1,
-0.09834716, 0.2469803, -0.1989891, 0, 0, 0, 1, 1,
-0.09806964, 1.228442, 1.895681, 0, 0, 0, 1, 1,
-0.09660067, -0.2758994, -3.045899, 0, 0, 0, 1, 1,
-0.09461551, 0.919633, 1.366089, 0, 0, 0, 1, 1,
-0.09397915, -1.38522, -2.427971, 0, 0, 0, 1, 1,
-0.09269831, -0.1922086, -4.297369, 0, 0, 0, 1, 1,
-0.09146839, 0.2404661, 0.1826447, 0, 0, 0, 1, 1,
-0.09140443, -1.40711, -2.332897, 1, 1, 1, 1, 1,
-0.09116499, -0.1003218, -3.794844, 1, 1, 1, 1, 1,
-0.09064189, -0.4582607, -3.263454, 1, 1, 1, 1, 1,
-0.09042782, -0.07247058, -2.714622, 1, 1, 1, 1, 1,
-0.08743704, 0.5932018, 0.3907381, 1, 1, 1, 1, 1,
-0.0865569, -1.721496, -4.418588, 1, 1, 1, 1, 1,
-0.08564281, -0.9960883, -2.308839, 1, 1, 1, 1, 1,
-0.08474929, 0.5235002, -0.4735822, 1, 1, 1, 1, 1,
-0.08348706, 0.3153762, -1.717646, 1, 1, 1, 1, 1,
-0.08140116, -0.3770574, -2.476921, 1, 1, 1, 1, 1,
-0.07803192, 0.5748504, -0.04975351, 1, 1, 1, 1, 1,
-0.07618131, 1.131472, 0.03907109, 1, 1, 1, 1, 1,
-0.07153102, -1.007118, -4.06867, 1, 1, 1, 1, 1,
-0.07092598, -0.7843133, -3.254373, 1, 1, 1, 1, 1,
-0.07092575, 1.446, 0.08295807, 1, 1, 1, 1, 1,
-0.06768436, 1.293282, 1.315527, 0, 0, 1, 1, 1,
-0.06626976, 0.7008029, -0.3893586, 1, 0, 0, 1, 1,
-0.06598169, 0.2346183, 0.2066148, 1, 0, 0, 1, 1,
-0.06434739, 1.338013, 0.7554598, 1, 0, 0, 1, 1,
-0.06299056, -0.5045234, -5.476116, 1, 0, 0, 1, 1,
-0.06130734, 0.7841851, -0.01997795, 1, 0, 0, 1, 1,
-0.0539574, 1.142772, -0.5981953, 0, 0, 0, 1, 1,
-0.0464385, -1.009387, -4.423288, 0, 0, 0, 1, 1,
-0.03646884, 0.4230447, -1.499566, 0, 0, 0, 1, 1,
-0.03423076, -1.197952, -3.102942, 0, 0, 0, 1, 1,
-0.03351355, -0.05464207, -3.315448, 0, 0, 0, 1, 1,
-0.02769019, 1.618823, -1.05472, 0, 0, 0, 1, 1,
-0.02593317, -1.702097, -3.651439, 0, 0, 0, 1, 1,
-0.02480424, -0.4671424, -1.78483, 1, 1, 1, 1, 1,
-0.01780069, -0.6930052, -4.382033, 1, 1, 1, 1, 1,
-0.01547452, -1.032645, -3.10192, 1, 1, 1, 1, 1,
-0.006607381, -0.5410385, -3.773907, 1, 1, 1, 1, 1,
0.001973941, -1.19049, 4.236225, 1, 1, 1, 1, 1,
0.002768649, 1.140947, 0.117227, 1, 1, 1, 1, 1,
0.003798255, -0.1349933, 2.160179, 1, 1, 1, 1, 1,
0.008561155, 0.5997992, -0.4174788, 1, 1, 1, 1, 1,
0.01046466, 0.9460254, 1.135703, 1, 1, 1, 1, 1,
0.01647, 1.411839, 3.047509, 1, 1, 1, 1, 1,
0.01788924, -1.112357, 2.735323, 1, 1, 1, 1, 1,
0.01924557, 0.1508322, 0.6533245, 1, 1, 1, 1, 1,
0.02422315, 0.4493115, -0.1198467, 1, 1, 1, 1, 1,
0.02561861, -1.050189, 2.518992, 1, 1, 1, 1, 1,
0.02631038, -2.239217, 3.109193, 1, 1, 1, 1, 1,
0.02713938, -1.762566, 2.397442, 0, 0, 1, 1, 1,
0.02944288, -0.4435031, 4.485501, 1, 0, 0, 1, 1,
0.0423378, -1.038595, 2.54429, 1, 0, 0, 1, 1,
0.04344415, 0.02889986, 2.0493, 1, 0, 0, 1, 1,
0.04764089, -1.391302, 3.053028, 1, 0, 0, 1, 1,
0.04870455, 1.846311, 0.5891809, 1, 0, 0, 1, 1,
0.04993786, 0.7492175, -0.1627477, 0, 0, 0, 1, 1,
0.05262552, -1.448448, 3.003835, 0, 0, 0, 1, 1,
0.05767319, -0.3774666, 1.991793, 0, 0, 0, 1, 1,
0.06050652, -0.2803227, 2.674086, 0, 0, 0, 1, 1,
0.07417578, -0.3400711, 2.30334, 0, 0, 0, 1, 1,
0.07532208, -0.1606446, 1.913037, 0, 0, 0, 1, 1,
0.0756527, 0.1096028, -0.251196, 0, 0, 0, 1, 1,
0.08269732, 0.1142618, -0.04570916, 1, 1, 1, 1, 1,
0.08331729, 0.7144296, 2.210602, 1, 1, 1, 1, 1,
0.08390296, 0.3119655, -0.6560794, 1, 1, 1, 1, 1,
0.0852271, -0.04868373, 2.400136, 1, 1, 1, 1, 1,
0.08536299, 0.3696519, -1.80988, 1, 1, 1, 1, 1,
0.09613955, 2.213244, -0.3931163, 1, 1, 1, 1, 1,
0.0982166, 0.3441912, -0.928039, 1, 1, 1, 1, 1,
0.09835265, 2.49687, 0.6172321, 1, 1, 1, 1, 1,
0.1032472, 0.03068442, 0.9948019, 1, 1, 1, 1, 1,
0.1046407, -1.73005, 3.795135, 1, 1, 1, 1, 1,
0.1065477, -0.002582473, 3.091849, 1, 1, 1, 1, 1,
0.1156987, -2.510978, 4.108451, 1, 1, 1, 1, 1,
0.1198634, 0.3202524, 0.8634959, 1, 1, 1, 1, 1,
0.1276479, -1.075021, 3.065404, 1, 1, 1, 1, 1,
0.1321805, -0.5935009, 3.865917, 1, 1, 1, 1, 1,
0.1357292, -2.791389, 2.662064, 0, 0, 1, 1, 1,
0.1368715, -0.47663, 3.24876, 1, 0, 0, 1, 1,
0.1370008, -1.968368, 2.163059, 1, 0, 0, 1, 1,
0.1373253, -1.145867, 2.266939, 1, 0, 0, 1, 1,
0.1386897, -0.9783674, 2.982517, 1, 0, 0, 1, 1,
0.1403118, -0.539149, 3.523179, 1, 0, 0, 1, 1,
0.1413782, 0.859776, 1.745744, 0, 0, 0, 1, 1,
0.1436095, -0.2457839, 2.0198, 0, 0, 0, 1, 1,
0.146681, -0.8750131, 2.315991, 0, 0, 0, 1, 1,
0.1471969, -0.1361953, 2.940696, 0, 0, 0, 1, 1,
0.1484483, 0.6674898, 0.7512906, 0, 0, 0, 1, 1,
0.1504855, 2.09886, -1.30078, 0, 0, 0, 1, 1,
0.1512392, -1.293475, 3.727746, 0, 0, 0, 1, 1,
0.1522436, 0.5093997, 0.01167682, 1, 1, 1, 1, 1,
0.1585954, 1.221994, 0.4208071, 1, 1, 1, 1, 1,
0.1611469, 0.2313952, 3.049315, 1, 1, 1, 1, 1,
0.1633937, -0.472519, 3.383232, 1, 1, 1, 1, 1,
0.167796, 0.19104, 1.237495, 1, 1, 1, 1, 1,
0.1736137, 0.4475545, 1.893902, 1, 1, 1, 1, 1,
0.1768674, -0.6957074, 3.110037, 1, 1, 1, 1, 1,
0.1773399, 0.8736632, 1.631872, 1, 1, 1, 1, 1,
0.177852, -0.1547412, 3.88984, 1, 1, 1, 1, 1,
0.1805555, -0.3104858, 3.806205, 1, 1, 1, 1, 1,
0.1816792, 0.2387379, 2.212815, 1, 1, 1, 1, 1,
0.1890684, 0.8576581, -0.07737271, 1, 1, 1, 1, 1,
0.1971009, 0.2783617, 0.3079879, 1, 1, 1, 1, 1,
0.1974661, -0.009254145, 1.56197, 1, 1, 1, 1, 1,
0.1988724, 0.2325317, 0.6860868, 1, 1, 1, 1, 1,
0.2017896, -0.01324581, 2.320689, 0, 0, 1, 1, 1,
0.2069799, -0.716242, 3.034664, 1, 0, 0, 1, 1,
0.2087219, -1.070778, 1.311273, 1, 0, 0, 1, 1,
0.2152256, -1.087007, 2.403737, 1, 0, 0, 1, 1,
0.2169259, -0.1002689, 2.252806, 1, 0, 0, 1, 1,
0.2209273, 0.4758705, 0.9827848, 1, 0, 0, 1, 1,
0.2271095, -1.02982, 3.000386, 0, 0, 0, 1, 1,
0.2275957, -0.3139325, 1.457828, 0, 0, 0, 1, 1,
0.2286841, -0.3752108, 2.818869, 0, 0, 0, 1, 1,
0.2291466, -1.563369, 2.205238, 0, 0, 0, 1, 1,
0.2291623, -0.2183398, 2.24463, 0, 0, 0, 1, 1,
0.2319431, -0.5189142, 4.761721, 0, 0, 0, 1, 1,
0.2334176, -1.115663, 1.95081, 0, 0, 0, 1, 1,
0.2354818, -0.7406989, 3.348066, 1, 1, 1, 1, 1,
0.2359402, -0.537896, 1.647864, 1, 1, 1, 1, 1,
0.2380326, 0.3858391, 1.011718, 1, 1, 1, 1, 1,
0.2387427, 0.0577543, 1.278156, 1, 1, 1, 1, 1,
0.2446409, 1.081601, -0.8034543, 1, 1, 1, 1, 1,
0.2483631, -1.460982, 3.410137, 1, 1, 1, 1, 1,
0.2527832, 0.7371904, 0.9490032, 1, 1, 1, 1, 1,
0.2529749, -1.337691, 1.047026, 1, 1, 1, 1, 1,
0.2543634, 0.9229638, -0.7026632, 1, 1, 1, 1, 1,
0.2545971, 1.212929, 1.929595, 1, 1, 1, 1, 1,
0.259625, 2.729455, -0.7156758, 1, 1, 1, 1, 1,
0.2598993, 0.190874, 0.4042673, 1, 1, 1, 1, 1,
0.2621752, -1.185429, 2.410621, 1, 1, 1, 1, 1,
0.2674934, 3.08474, 1.061645, 1, 1, 1, 1, 1,
0.2684873, 0.2227078, 2.058866, 1, 1, 1, 1, 1,
0.2695551, 0.5319778, 0.52029, 0, 0, 1, 1, 1,
0.2704322, 0.5575137, 1.831718, 1, 0, 0, 1, 1,
0.2741216, 0.6628016, 2.073474, 1, 0, 0, 1, 1,
0.2745257, -0.8796511, 2.996771, 1, 0, 0, 1, 1,
0.2750584, 1.118449, 0.9072081, 1, 0, 0, 1, 1,
0.2759554, -1.02974, 1.210943, 1, 0, 0, 1, 1,
0.2772008, -0.9767933, 4.044433, 0, 0, 0, 1, 1,
0.2782232, -1.224402, 3.113776, 0, 0, 0, 1, 1,
0.2811455, 0.2936909, 1.075823, 0, 0, 0, 1, 1,
0.2865631, -1.322355, 2.353542, 0, 0, 0, 1, 1,
0.2939319, 1.717541, -0.5760838, 0, 0, 0, 1, 1,
0.296251, -0.8275996, 4.334881, 0, 0, 0, 1, 1,
0.2977293, 1.013749, 0.3366419, 0, 0, 0, 1, 1,
0.2979583, -2.49415, 3.33014, 1, 1, 1, 1, 1,
0.298463, -0.8314186, 1.977314, 1, 1, 1, 1, 1,
0.3040053, 0.6339778, -0.316797, 1, 1, 1, 1, 1,
0.3062229, 0.4631467, 1.645681, 1, 1, 1, 1, 1,
0.3063973, -0.3236136, 1.940815, 1, 1, 1, 1, 1,
0.3074353, -0.9468786, 1.0802, 1, 1, 1, 1, 1,
0.3149525, 0.6202131, 1.985225, 1, 1, 1, 1, 1,
0.321642, -1.390145, 2.442625, 1, 1, 1, 1, 1,
0.3217953, 0.5371214, 0.5364318, 1, 1, 1, 1, 1,
0.3259399, -3.096293, 3.346245, 1, 1, 1, 1, 1,
0.3270489, -1.082571, 3.375393, 1, 1, 1, 1, 1,
0.3273205, -0.7239766, 2.841298, 1, 1, 1, 1, 1,
0.3310646, 0.8159083, -0.2937173, 1, 1, 1, 1, 1,
0.3364103, 0.1753361, 3.26723, 1, 1, 1, 1, 1,
0.3365965, -1.517833, 2.977722, 1, 1, 1, 1, 1,
0.3371221, 0.9425941, 2.49614, 0, 0, 1, 1, 1,
0.3388475, 0.4586392, 1.782148, 1, 0, 0, 1, 1,
0.3389346, -0.2514716, 2.299762, 1, 0, 0, 1, 1,
0.3398366, 0.8821511, 0.1473143, 1, 0, 0, 1, 1,
0.3402257, 0.4470034, -0.6942965, 1, 0, 0, 1, 1,
0.3403588, -0.01122088, 2.956596, 1, 0, 0, 1, 1,
0.3537218, -0.14615, 1.770851, 0, 0, 0, 1, 1,
0.360628, 0.02154805, 1.045271, 0, 0, 0, 1, 1,
0.3667296, -1.093122, 2.493305, 0, 0, 0, 1, 1,
0.3675886, 2.307089, -1.358977, 0, 0, 0, 1, 1,
0.3774346, -0.1764556, 2.340151, 0, 0, 0, 1, 1,
0.3787155, 0.3095788, 1.899132, 0, 0, 0, 1, 1,
0.3817005, 0.4260486, 0.2806198, 0, 0, 0, 1, 1,
0.3818085, -0.3113281, 1.509331, 1, 1, 1, 1, 1,
0.381968, 0.3188126, 1.627027, 1, 1, 1, 1, 1,
0.3819688, 0.5256909, 1.432812, 1, 1, 1, 1, 1,
0.3826835, 2.502463, 0.8694875, 1, 1, 1, 1, 1,
0.3839929, -1.731506, 4.111649, 1, 1, 1, 1, 1,
0.3856189, 0.3255008, -0.008945479, 1, 1, 1, 1, 1,
0.3867395, -0.111306, 1.590805, 1, 1, 1, 1, 1,
0.3917531, -0.1540359, 2.661543, 1, 1, 1, 1, 1,
0.3960474, -0.4869983, 3.163091, 1, 1, 1, 1, 1,
0.3962113, -0.9298628, 2.956363, 1, 1, 1, 1, 1,
0.3965294, 0.3166459, -1.079654, 1, 1, 1, 1, 1,
0.3967146, 0.08150788, 0.1169402, 1, 1, 1, 1, 1,
0.3971076, -1.83962, 4.062433, 1, 1, 1, 1, 1,
0.3979197, -1.639229, 3.654735, 1, 1, 1, 1, 1,
0.3996502, 0.9553475, 0.08528747, 1, 1, 1, 1, 1,
0.3999111, -1.484606, 4.127824, 0, 0, 1, 1, 1,
0.400401, 1.417753, 1.882885, 1, 0, 0, 1, 1,
0.4027779, 0.09234853, 2.023663, 1, 0, 0, 1, 1,
0.4051211, -0.7767074, 3.701357, 1, 0, 0, 1, 1,
0.4058005, 0.6384335, 2.214853, 1, 0, 0, 1, 1,
0.4071039, -0.3294027, 2.560948, 1, 0, 0, 1, 1,
0.4090522, 0.2119178, 1.727294, 0, 0, 0, 1, 1,
0.4103442, 0.4721443, -0.657249, 0, 0, 0, 1, 1,
0.414838, 0.03824286, 0.1384265, 0, 0, 0, 1, 1,
0.4148526, -0.5392122, 3.604346, 0, 0, 0, 1, 1,
0.4179657, -0.2350505, 0.9136246, 0, 0, 0, 1, 1,
0.4221092, -0.4682443, 2.518118, 0, 0, 0, 1, 1,
0.4246937, 0.9894326, 1.198259, 0, 0, 0, 1, 1,
0.4257868, 1.44181, 1.568456, 1, 1, 1, 1, 1,
0.4297945, -0.8984756, 2.985858, 1, 1, 1, 1, 1,
0.4335613, -1.5907, 1.975992, 1, 1, 1, 1, 1,
0.4362167, -1.138894, 3.295419, 1, 1, 1, 1, 1,
0.4420531, 1.667166, 1.889309, 1, 1, 1, 1, 1,
0.4426501, 1.329755, -0.2494534, 1, 1, 1, 1, 1,
0.4442295, -1.032571, 2.554985, 1, 1, 1, 1, 1,
0.4478457, 1.590479, -0.9068761, 1, 1, 1, 1, 1,
0.453412, 0.7676269, 0.3332271, 1, 1, 1, 1, 1,
0.4539355, 0.9590042, 0.3073012, 1, 1, 1, 1, 1,
0.4543305, -0.3385898, 2.553506, 1, 1, 1, 1, 1,
0.4586669, 1.374823, 0.09538551, 1, 1, 1, 1, 1,
0.4597151, -0.6741378, 2.357206, 1, 1, 1, 1, 1,
0.4601503, 0.1272301, 1.374326, 1, 1, 1, 1, 1,
0.4655082, 0.2782124, 1.221635, 1, 1, 1, 1, 1,
0.4656128, 1.190836, 1.129675, 0, 0, 1, 1, 1,
0.4667311, -1.76391, 2.701988, 1, 0, 0, 1, 1,
0.4672381, -0.7113737, 3.684428, 1, 0, 0, 1, 1,
0.4692301, -0.645423, 0.7813762, 1, 0, 0, 1, 1,
0.4768951, -0.7457362, 3.197409, 1, 0, 0, 1, 1,
0.4772245, -1.744992, 2.691721, 1, 0, 0, 1, 1,
0.4775357, 0.7279721, 2.733388, 0, 0, 0, 1, 1,
0.4786947, -1.387388, 0.6050704, 0, 0, 0, 1, 1,
0.4824485, -0.4110016, 2.042999, 0, 0, 0, 1, 1,
0.4838837, 0.4895641, 0.6820904, 0, 0, 0, 1, 1,
0.4840854, 0.3520917, 0.1316703, 0, 0, 0, 1, 1,
0.485778, 0.7460745, 0.2223365, 0, 0, 0, 1, 1,
0.4889057, 1.106936, 0.09396964, 0, 0, 0, 1, 1,
0.490948, 1.266986, 1.201086, 1, 1, 1, 1, 1,
0.4914939, 0.4064924, -1.196801, 1, 1, 1, 1, 1,
0.4938042, -1.503732, 3.414884, 1, 1, 1, 1, 1,
0.4992696, -0.5154462, 1.542745, 1, 1, 1, 1, 1,
0.5055782, -0.03900551, 2.017093, 1, 1, 1, 1, 1,
0.5061886, -0.8515693, 3.048746, 1, 1, 1, 1, 1,
0.5068941, 0.292928, 2.03834, 1, 1, 1, 1, 1,
0.5069011, -1.354675, 2.941437, 1, 1, 1, 1, 1,
0.507619, 0.05921689, 2.178851, 1, 1, 1, 1, 1,
0.5118051, 0.2348443, 1.395583, 1, 1, 1, 1, 1,
0.512242, -0.9036222, 1.463674, 1, 1, 1, 1, 1,
0.5166526, -0.6324813, 3.458579, 1, 1, 1, 1, 1,
0.5210771, 2.012036, -0.1964971, 1, 1, 1, 1, 1,
0.5317873, -0.7610494, 2.7225, 1, 1, 1, 1, 1,
0.5320922, -0.04746458, 2.11499, 1, 1, 1, 1, 1,
0.5339545, 0.01994871, 1.167848, 0, 0, 1, 1, 1,
0.5346788, 1.340417, 1.880412, 1, 0, 0, 1, 1,
0.5377159, -1.063874, 1.712149, 1, 0, 0, 1, 1,
0.5381379, -0.7800866, 2.294074, 1, 0, 0, 1, 1,
0.5385501, 0.9895025, 0.9050133, 1, 0, 0, 1, 1,
0.5428388, -0.299952, 3.297979, 1, 0, 0, 1, 1,
0.5446683, -0.09078822, 0.4626356, 0, 0, 0, 1, 1,
0.5504159, -1.366378, 1.968989, 0, 0, 0, 1, 1,
0.5551805, 0.007578218, 1.043858, 0, 0, 0, 1, 1,
0.5591059, 0.5534995, -0.4307584, 0, 0, 0, 1, 1,
0.5621639, -2.053247, 2.086128, 0, 0, 0, 1, 1,
0.5677925, 0.3561117, 0.6783427, 0, 0, 0, 1, 1,
0.5724057, 0.2583705, 1.383749, 0, 0, 0, 1, 1,
0.5781323, 0.1571631, 1.903268, 1, 1, 1, 1, 1,
0.5801564, -0.5629572, 1.925615, 1, 1, 1, 1, 1,
0.5804318, -1.163297, 2.455146, 1, 1, 1, 1, 1,
0.5821014, -3.441435, 2.314936, 1, 1, 1, 1, 1,
0.5832382, -0.05056379, 1.148886, 1, 1, 1, 1, 1,
0.5847378, 0.5254306, 0.6866202, 1, 1, 1, 1, 1,
0.5869713, 0.2554629, 0.259251, 1, 1, 1, 1, 1,
0.5898716, 0.1188306, 2.30085, 1, 1, 1, 1, 1,
0.5908073, -1.061646, 3.307144, 1, 1, 1, 1, 1,
0.5993963, -0.3365927, 2.08316, 1, 1, 1, 1, 1,
0.6014972, -2.791247, 3.447181, 1, 1, 1, 1, 1,
0.6021595, 0.8057988, -0.09473373, 1, 1, 1, 1, 1,
0.604759, -1.215342, 2.471052, 1, 1, 1, 1, 1,
0.609022, -0.7457723, 2.008592, 1, 1, 1, 1, 1,
0.6133835, 0.4878996, 2.489828, 1, 1, 1, 1, 1,
0.6137635, -0.09674992, 1.14324, 0, 0, 1, 1, 1,
0.6200374, 0.4467065, 1.541971, 1, 0, 0, 1, 1,
0.6246105, -1.398341, 2.696686, 1, 0, 0, 1, 1,
0.6265861, 1.074496, 2.391839, 1, 0, 0, 1, 1,
0.6274608, -1.394113, 4.872861, 1, 0, 0, 1, 1,
0.6372877, -0.7296522, 1.35159, 1, 0, 0, 1, 1,
0.6458212, -0.6403087, 2.455483, 0, 0, 0, 1, 1,
0.6480241, 1.183732, 0.5934668, 0, 0, 0, 1, 1,
0.6533679, -0.2563186, 0.6030725, 0, 0, 0, 1, 1,
0.6535456, 1.259774, 0.1530236, 0, 0, 0, 1, 1,
0.6573945, 0.3064086, 2.280553, 0, 0, 0, 1, 1,
0.6601495, 1.97143, 1.282605, 0, 0, 0, 1, 1,
0.6610022, -0.1495776, 1.790617, 0, 0, 0, 1, 1,
0.6619256, -0.4275513, 2.392936, 1, 1, 1, 1, 1,
0.6629255, -0.2094676, 2.758823, 1, 1, 1, 1, 1,
0.6647269, -0.5135266, 1.873024, 1, 1, 1, 1, 1,
0.6662048, -0.775239, 1.828714, 1, 1, 1, 1, 1,
0.6694915, -0.7048072, 3.46541, 1, 1, 1, 1, 1,
0.6737007, 0.7678801, 1.153335, 1, 1, 1, 1, 1,
0.6783196, 1.022842, -0.3821914, 1, 1, 1, 1, 1,
0.6810747, 1.581533, 0.1859374, 1, 1, 1, 1, 1,
0.6821978, 0.6790522, 2.311265, 1, 1, 1, 1, 1,
0.6824573, 2.214391, -0.2550655, 1, 1, 1, 1, 1,
0.6844864, -0.8157001, 2.682837, 1, 1, 1, 1, 1,
0.6859128, -0.9678856, 1.783537, 1, 1, 1, 1, 1,
0.6869044, 0.7527254, -0.04451318, 1, 1, 1, 1, 1,
0.6870921, -0.1590723, 2.338042, 1, 1, 1, 1, 1,
0.6905131, 0.3781093, -0.2394388, 1, 1, 1, 1, 1,
0.6958916, -0.3282818, 2.151995, 0, 0, 1, 1, 1,
0.6976411, -0.4424835, 1.116267, 1, 0, 0, 1, 1,
0.7066321, 0.2094344, 1.04085, 1, 0, 0, 1, 1,
0.7125286, 0.4013442, 1.391793, 1, 0, 0, 1, 1,
0.7144271, 1.116997, -1.293869, 1, 0, 0, 1, 1,
0.7155671, -0.4285491, 3.343702, 1, 0, 0, 1, 1,
0.7174684, -0.7160502, 1.923549, 0, 0, 0, 1, 1,
0.7183819, -0.5983889, 3.248203, 0, 0, 0, 1, 1,
0.7220408, -0.01828388, 0.8837181, 0, 0, 0, 1, 1,
0.7231876, -0.07092609, 0.969761, 0, 0, 0, 1, 1,
0.7246575, 1.088989, 0.9232214, 0, 0, 0, 1, 1,
0.7247888, 0.4156068, 0.5555475, 0, 0, 0, 1, 1,
0.7272601, -1.082718, 2.581806, 0, 0, 0, 1, 1,
0.7305149, -0.1578908, 2.980641, 1, 1, 1, 1, 1,
0.733374, -1.171361, 4.24938, 1, 1, 1, 1, 1,
0.7367921, 0.4714458, 0.1017012, 1, 1, 1, 1, 1,
0.7369439, -0.7895649, 2.134603, 1, 1, 1, 1, 1,
0.7377653, 1.223086, -0.2848064, 1, 1, 1, 1, 1,
0.7381189, 0.5319421, 0.6708705, 1, 1, 1, 1, 1,
0.7388932, 0.1371008, 2.702568, 1, 1, 1, 1, 1,
0.7414444, 0.1091663, 1.800315, 1, 1, 1, 1, 1,
0.7437637, -0.04842371, 2.625226, 1, 1, 1, 1, 1,
0.7577018, 0.7734545, 0.5534369, 1, 1, 1, 1, 1,
0.761167, -0.6820752, 3.39959, 1, 1, 1, 1, 1,
0.7628452, 0.4521084, 0.4162868, 1, 1, 1, 1, 1,
0.7660812, 0.1954838, 1.63114, 1, 1, 1, 1, 1,
0.766763, -2.19441, 2.710749, 1, 1, 1, 1, 1,
0.7680231, 0.439712, 0.236488, 1, 1, 1, 1, 1,
0.7711033, -0.805636, 1.632547, 0, 0, 1, 1, 1,
0.7721813, -0.8971947, 2.326405, 1, 0, 0, 1, 1,
0.7746778, 0.2046704, -0.2978189, 1, 0, 0, 1, 1,
0.780463, 0.1137445, 1.020417, 1, 0, 0, 1, 1,
0.7809568, -0.5411471, 2.103602, 1, 0, 0, 1, 1,
0.7844115, -1.162595, 0.9158491, 1, 0, 0, 1, 1,
0.7866464, 0.4247571, -0.2883262, 0, 0, 0, 1, 1,
0.7884532, -0.9569166, 2.160698, 0, 0, 0, 1, 1,
0.7906016, 0.1944779, 1.997879, 0, 0, 0, 1, 1,
0.797051, 1.03422, -0.1367048, 0, 0, 0, 1, 1,
0.7973982, -1.527248, 3.554743, 0, 0, 0, 1, 1,
0.8026705, 1.281733, 1.254402, 0, 0, 0, 1, 1,
0.8050458, 0.7821979, 1.355247, 0, 0, 0, 1, 1,
0.8073666, 0.9095652, 0.2920237, 1, 1, 1, 1, 1,
0.8075439, 0.9995552, -1.368179, 1, 1, 1, 1, 1,
0.8096681, -0.2204333, 2.669694, 1, 1, 1, 1, 1,
0.8122408, 0.7344317, 0.8275834, 1, 1, 1, 1, 1,
0.8130237, 0.07803637, 1.599243, 1, 1, 1, 1, 1,
0.8153152, 2.035433, 1.52591, 1, 1, 1, 1, 1,
0.8167638, -0.967977, 2.861608, 1, 1, 1, 1, 1,
0.8173904, 0.7370577, 2.866509, 1, 1, 1, 1, 1,
0.8186722, -0.7435202, 1.129361, 1, 1, 1, 1, 1,
0.8347971, 0.07903717, 0.9976345, 1, 1, 1, 1, 1,
0.8377074, -0.1862683, 0.3815796, 1, 1, 1, 1, 1,
0.8388718, 0.06943177, 1.226786, 1, 1, 1, 1, 1,
0.846812, 1.659672, 1.913835, 1, 1, 1, 1, 1,
0.8494411, 0.7514857, 0.5091329, 1, 1, 1, 1, 1,
0.8507735, 0.1789893, 1.744284, 1, 1, 1, 1, 1,
0.8533944, 1.11574, 0.09513426, 0, 0, 1, 1, 1,
0.8546014, 0.4995055, 0.7833096, 1, 0, 0, 1, 1,
0.8546425, 0.2063358, 1.515614, 1, 0, 0, 1, 1,
0.8568366, 1.431254, 0.2871932, 1, 0, 0, 1, 1,
0.8570989, 0.6208719, 1.087699, 1, 0, 0, 1, 1,
0.8607128, 1.394974, 0.1900488, 1, 0, 0, 1, 1,
0.8793105, -0.7621449, 1.491416, 0, 0, 0, 1, 1,
0.8799056, 0.3680833, 3.77271, 0, 0, 0, 1, 1,
0.8803227, 1.638887, -0.9179653, 0, 0, 0, 1, 1,
0.8850292, 0.6969187, 1.011304, 0, 0, 0, 1, 1,
0.8854958, -0.1721503, 3.511742, 0, 0, 0, 1, 1,
0.8861181, -0.4129063, 2.941256, 0, 0, 0, 1, 1,
0.8887243, -0.2942081, 2.155708, 0, 0, 0, 1, 1,
0.8938308, 2.086483, 1.939051, 1, 1, 1, 1, 1,
0.8951751, 2.344845, 0.07972458, 1, 1, 1, 1, 1,
0.9013144, -1.533925, 2.221285, 1, 1, 1, 1, 1,
0.9033503, 0.680914, 0.4396172, 1, 1, 1, 1, 1,
0.9039906, 2.959455, 0.08483393, 1, 1, 1, 1, 1,
0.9040354, -0.2775168, 2.504826, 1, 1, 1, 1, 1,
0.9059892, -0.4995958, 1.49365, 1, 1, 1, 1, 1,
0.9117141, -1.661052, 1.016851, 1, 1, 1, 1, 1,
0.9132294, -0.8441144, 5.242103, 1, 1, 1, 1, 1,
0.9247741, 0.8744352, 0.3300339, 1, 1, 1, 1, 1,
0.9254126, -0.7550592, 1.385424, 1, 1, 1, 1, 1,
0.9365163, -0.3401758, 1.545857, 1, 1, 1, 1, 1,
0.9499094, -0.6904272, 1.47306, 1, 1, 1, 1, 1,
0.9530405, 0.4252982, 1.907421, 1, 1, 1, 1, 1,
0.9537174, -0.1629236, 1.499616, 1, 1, 1, 1, 1,
0.9619877, -2.21038, 3.204472, 0, 0, 1, 1, 1,
0.9631773, -0.4121542, 0.3419538, 1, 0, 0, 1, 1,
0.9646567, -1.087558, 0.3249506, 1, 0, 0, 1, 1,
0.9741023, 2.216401, -1.963034, 1, 0, 0, 1, 1,
0.9792894, -0.4600743, 0.1188277, 1, 0, 0, 1, 1,
0.9877717, -1.143643, 2.575262, 1, 0, 0, 1, 1,
0.991456, 0.4336011, 0.8199403, 0, 0, 0, 1, 1,
0.9923016, -0.2667106, 1.120193, 0, 0, 0, 1, 1,
0.99576, 0.4257055, -1.015477, 0, 0, 0, 1, 1,
1.001269, -0.2247741, 1.322166, 0, 0, 0, 1, 1,
1.014649, -0.9503475, 2.878396, 0, 0, 0, 1, 1,
1.020106, 0.6178204, 1.07164, 0, 0, 0, 1, 1,
1.023784, -0.1512461, 1.140704, 0, 0, 0, 1, 1,
1.030841, 1.549474, -1.477839, 1, 1, 1, 1, 1,
1.038096, -0.6405322, 2.244887, 1, 1, 1, 1, 1,
1.038288, 0.5286728, 1.249487, 1, 1, 1, 1, 1,
1.040008, 0.6045834, -1.020568, 1, 1, 1, 1, 1,
1.041706, 1.385655, 1.133594, 1, 1, 1, 1, 1,
1.043621, -0.2666157, 0.5034276, 1, 1, 1, 1, 1,
1.043681, 1.212962, 1.60888, 1, 1, 1, 1, 1,
1.052531, 0.237939, 2.62696, 1, 1, 1, 1, 1,
1.0647, 0.997013, 2.147866, 1, 1, 1, 1, 1,
1.066155, -2.036984, 1.974051, 1, 1, 1, 1, 1,
1.07563, 2.32761, 0.00638173, 1, 1, 1, 1, 1,
1.077332, 0.09783458, 0.7443783, 1, 1, 1, 1, 1,
1.080749, 0.4207694, 2.183337, 1, 1, 1, 1, 1,
1.080868, 0.60074, 1.450012, 1, 1, 1, 1, 1,
1.082291, 0.5269773, 0.5802047, 1, 1, 1, 1, 1,
1.099605, 0.135704, 2.198833, 0, 0, 1, 1, 1,
1.099952, -1.282339, 4.667867, 1, 0, 0, 1, 1,
1.100872, 0.7905344, 1.221827, 1, 0, 0, 1, 1,
1.105267, 1.83418, 1.935274, 1, 0, 0, 1, 1,
1.109885, 0.02686577, 1.531177, 1, 0, 0, 1, 1,
1.134361, 1.148537, -0.01387635, 1, 0, 0, 1, 1,
1.136165, 0.1585343, 2.30695, 0, 0, 0, 1, 1,
1.138759, 0.5370224, 0.5862823, 0, 0, 0, 1, 1,
1.138761, -0.3404209, 3.39957, 0, 0, 0, 1, 1,
1.140282, -0.8429484, 1.642982, 0, 0, 0, 1, 1,
1.145704, 0.2058904, 1.585736, 0, 0, 0, 1, 1,
1.14969, 0.9196877, 0.6934597, 0, 0, 0, 1, 1,
1.156208, 0.3054162, 0.2948613, 0, 0, 0, 1, 1,
1.157912, 0.1833469, 3.643629, 1, 1, 1, 1, 1,
1.165628, -1.022502, 1.507905, 1, 1, 1, 1, 1,
1.175155, 1.541357, 0.1605909, 1, 1, 1, 1, 1,
1.181522, 1.720396, -0.416703, 1, 1, 1, 1, 1,
1.19054, -0.817777, 4.324324, 1, 1, 1, 1, 1,
1.190976, 1.898491, 1.82082, 1, 1, 1, 1, 1,
1.20331, 0.3385203, 1.719881, 1, 1, 1, 1, 1,
1.204176, 1.206727, 0.2522504, 1, 1, 1, 1, 1,
1.217574, -0.06893218, 0.1858775, 1, 1, 1, 1, 1,
1.233731, -0.3559791, 3.485479, 1, 1, 1, 1, 1,
1.236869, -0.5317309, 1.902778, 1, 1, 1, 1, 1,
1.239306, 1.314611, 0.5481664, 1, 1, 1, 1, 1,
1.241359, 0.7970423, 2.369565, 1, 1, 1, 1, 1,
1.246217, -0.7969966, 2.717152, 1, 1, 1, 1, 1,
1.253147, 0.9908445, 1.267551, 1, 1, 1, 1, 1,
1.254008, 0.7017104, 1.323549, 0, 0, 1, 1, 1,
1.26182, 0.3577634, 0.1658494, 1, 0, 0, 1, 1,
1.264037, -0.5494471, 1.195694, 1, 0, 0, 1, 1,
1.265361, 0.5131718, 0.490747, 1, 0, 0, 1, 1,
1.269016, 0.8066233, 1.763518, 1, 0, 0, 1, 1,
1.272231, -1.264287, 1.419837, 1, 0, 0, 1, 1,
1.273255, -0.3268053, 0.8160743, 0, 0, 0, 1, 1,
1.274035, 0.5638965, -0.5706876, 0, 0, 0, 1, 1,
1.297215, 0.05776533, -1.168481, 0, 0, 0, 1, 1,
1.306128, 1.366887, 0.4933855, 0, 0, 0, 1, 1,
1.30645, 1.134758, 0.1189582, 0, 0, 0, 1, 1,
1.307822, -1.007861, 2.829092, 0, 0, 0, 1, 1,
1.308061, -0.569379, 3.931456, 0, 0, 0, 1, 1,
1.316154, 0.926851, 0.5170546, 1, 1, 1, 1, 1,
1.319153, 1.022857, 0.131767, 1, 1, 1, 1, 1,
1.324152, 0.7322122, -0.8977771, 1, 1, 1, 1, 1,
1.336248, 0.4630261, 3.464841, 1, 1, 1, 1, 1,
1.336809, 0.0991005, 2.42376, 1, 1, 1, 1, 1,
1.343272, -0.07743925, 0.8653041, 1, 1, 1, 1, 1,
1.369077, 0.2415249, 1.409144, 1, 1, 1, 1, 1,
1.375104, -0.7761021, 0.557519, 1, 1, 1, 1, 1,
1.382378, 0.2689919, 0.7516961, 1, 1, 1, 1, 1,
1.387706, -0.5593283, 0.9604564, 1, 1, 1, 1, 1,
1.389488, 0.8970551, -0.06325273, 1, 1, 1, 1, 1,
1.389729, -0.3047955, 2.429179, 1, 1, 1, 1, 1,
1.397953, 1.374488, 0.477348, 1, 1, 1, 1, 1,
1.401627, 0.2737107, 1.706974, 1, 1, 1, 1, 1,
1.421452, 1.353051, 0.5503107, 1, 1, 1, 1, 1,
1.427017, 1.003118, -0.694693, 0, 0, 1, 1, 1,
1.437773, 1.89578, -0.481579, 1, 0, 0, 1, 1,
1.439556, -1.077132, 4.32957, 1, 0, 0, 1, 1,
1.443273, -0.5820547, 2.90724, 1, 0, 0, 1, 1,
1.452124, 2.06473, 0.7072088, 1, 0, 0, 1, 1,
1.472314, -0.3193883, 1.925745, 1, 0, 0, 1, 1,
1.488921, -0.825592, 2.296478, 0, 0, 0, 1, 1,
1.490383, -0.5051792, 2.849599, 0, 0, 0, 1, 1,
1.491246, -0.1057382, 0.7320737, 0, 0, 0, 1, 1,
1.496765, -0.4812374, 1.878564, 0, 0, 0, 1, 1,
1.501792, 1.23111, 0.252106, 0, 0, 0, 1, 1,
1.506303, 1.65842, 0.4375333, 0, 0, 0, 1, 1,
1.516324, -0.5646092, 3.204629, 0, 0, 0, 1, 1,
1.517932, -1.549245, 2.410812, 1, 1, 1, 1, 1,
1.524677, -1.092091, 2.689523, 1, 1, 1, 1, 1,
1.545696, -0.9500625, 2.183805, 1, 1, 1, 1, 1,
1.558611, -0.4712426, 2.180214, 1, 1, 1, 1, 1,
1.561002, 0.5296776, 0.6519428, 1, 1, 1, 1, 1,
1.56269, 1.373145, -0.542811, 1, 1, 1, 1, 1,
1.563836, 1.409647, 2.025041, 1, 1, 1, 1, 1,
1.565425, 1.564214, -0.5750042, 1, 1, 1, 1, 1,
1.576622, 0.8241291, 0.6335173, 1, 1, 1, 1, 1,
1.580406, 0.01498088, 1.033654, 1, 1, 1, 1, 1,
1.582902, -0.8496042, 2.359563, 1, 1, 1, 1, 1,
1.611768, -0.540363, 2.383562, 1, 1, 1, 1, 1,
1.620965, -1.159147, 3.033342, 1, 1, 1, 1, 1,
1.63676, 0.08762104, 0.7682436, 1, 1, 1, 1, 1,
1.637494, 0.9196998, 2.579557, 1, 1, 1, 1, 1,
1.647189, -0.04631275, 2.716105, 0, 0, 1, 1, 1,
1.652037, -0.1790192, -0.2077194, 1, 0, 0, 1, 1,
1.656167, 0.6747813, 1.364895, 1, 0, 0, 1, 1,
1.664867, -0.4553644, 0.6769155, 1, 0, 0, 1, 1,
1.670634, -0.6566927, 1.594023, 1, 0, 0, 1, 1,
1.684819, -1.310698, 1.447806, 1, 0, 0, 1, 1,
1.696823, 0.7170041, 1.325789, 0, 0, 0, 1, 1,
1.706528, 0.6267102, 1.008842, 0, 0, 0, 1, 1,
1.762494, -0.0004032023, 0.963244, 0, 0, 0, 1, 1,
1.763301, 0.5328209, 2.096858, 0, 0, 0, 1, 1,
1.76487, -1.230509, 1.400929, 0, 0, 0, 1, 1,
1.779743, -0.47336, 0.1217619, 0, 0, 0, 1, 1,
1.80435, -0.1388716, 1.61934, 0, 0, 0, 1, 1,
1.837612, 0.120413, 0.9981767, 1, 1, 1, 1, 1,
1.852824, 1.092134, 1.627938, 1, 1, 1, 1, 1,
1.878771, 1.211922, 1.659556, 1, 1, 1, 1, 1,
1.892737, -0.8850411, 2.50345, 1, 1, 1, 1, 1,
1.89615, 1.724545, 1.37128, 1, 1, 1, 1, 1,
1.951988, 0.1458146, 3.435779, 1, 1, 1, 1, 1,
1.961215, 1.264516, 2.02545, 1, 1, 1, 1, 1,
1.961681, -1.478132, 2.872955, 1, 1, 1, 1, 1,
1.965546, 1.029234, 0.3007142, 1, 1, 1, 1, 1,
1.998302, -0.9214292, 1.792952, 1, 1, 1, 1, 1,
2.000806, -0.9758524, 1.336699, 1, 1, 1, 1, 1,
2.01244, 0.0899502, 1.063432, 1, 1, 1, 1, 1,
2.034873, -0.1106359, 1.261638, 1, 1, 1, 1, 1,
2.03876, -0.4325313, 1.964961, 1, 1, 1, 1, 1,
2.055955, 0.4504227, 1.616019, 1, 1, 1, 1, 1,
2.076705, 1.112611, 0.162799, 0, 0, 1, 1, 1,
2.086035, -1.781697, 2.546829, 1, 0, 0, 1, 1,
2.088915, -0.2569201, 2.044613, 1, 0, 0, 1, 1,
2.09634, 0.2311555, 1.542155, 1, 0, 0, 1, 1,
2.142073, -1.783687, 3.65076, 1, 0, 0, 1, 1,
2.185936, 0.0938678, 1.179014, 1, 0, 0, 1, 1,
2.217084, -0.9545477, 0.353621, 0, 0, 0, 1, 1,
2.238316, -0.7075564, 1.575477, 0, 0, 0, 1, 1,
2.248252, 0.1113907, 1.756178, 0, 0, 0, 1, 1,
2.25429, 0.05160989, 1.323134, 0, 0, 0, 1, 1,
2.273419, -1.184738, 2.613325, 0, 0, 0, 1, 1,
2.277118, 2.037871, -1.550209, 0, 0, 0, 1, 1,
2.295089, 1.319666, -1.798027, 0, 0, 0, 1, 1,
2.31001, 1.313423, 0.7032843, 1, 1, 1, 1, 1,
2.315266, 0.9146467, 2.621677, 1, 1, 1, 1, 1,
2.352475, -1.099819, 1.314186, 1, 1, 1, 1, 1,
2.45065, 1.520838, 1.301079, 1, 1, 1, 1, 1,
2.572197, -1.135019, 0.9504629, 1, 1, 1, 1, 1,
2.762704, 0.3178477, 2.492108, 1, 1, 1, 1, 1,
2.89052, 0.3917878, 1.387874, 1, 1, 1, 1, 1
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
var radius = 9.940312;
var distance = 34.91492;
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
mvMatrix.translate( 0.6203163, -0.1274905, 0.1170068 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.91492);
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
