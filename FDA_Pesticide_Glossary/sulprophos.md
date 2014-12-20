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
-3.301462, -1.622148, -1.452132, 1, 0, 0, 1,
-2.680787, -0.1214707, -1.752746, 1, 0.007843138, 0, 1,
-2.679638, -0.2132286, -2.528047, 1, 0.01176471, 0, 1,
-2.442809, 1.866428, 0.7512985, 1, 0.01960784, 0, 1,
-2.40228, -0.05464156, -2.542037, 1, 0.02352941, 0, 1,
-2.382578, -0.4691294, -0.82988, 1, 0.03137255, 0, 1,
-2.306754, 0.430252, -2.139987, 1, 0.03529412, 0, 1,
-2.291746, 1.85509, 0.04842686, 1, 0.04313726, 0, 1,
-2.28415, 0.3053449, -2.490307, 1, 0.04705882, 0, 1,
-2.25714, 0.3647411, -0.8832108, 1, 0.05490196, 0, 1,
-2.247645, -0.89916, -2.615607, 1, 0.05882353, 0, 1,
-2.234814, -0.7509801, -1.344863, 1, 0.06666667, 0, 1,
-2.214944, -2.616177, -1.492946, 1, 0.07058824, 0, 1,
-2.197625, 1.767595, 0.4790997, 1, 0.07843138, 0, 1,
-2.166668, -0.697708, -1.679496, 1, 0.08235294, 0, 1,
-2.153862, 0.5945554, -0.02499759, 1, 0.09019608, 0, 1,
-2.128881, -1.542091, -1.911546, 1, 0.09411765, 0, 1,
-2.068179, -0.8889261, -3.283758, 1, 0.1019608, 0, 1,
-2.06172, -1.160525, -1.74601, 1, 0.1098039, 0, 1,
-2.041249, -0.5555249, -0.8390992, 1, 0.1137255, 0, 1,
-2.040903, 0.4509266, -1.462037, 1, 0.1215686, 0, 1,
-2.037088, -1.145071, -2.079706, 1, 0.1254902, 0, 1,
-2.027438, 0.7630243, -0.3934798, 1, 0.1333333, 0, 1,
-2.025594, 0.2556882, -2.136421, 1, 0.1372549, 0, 1,
-1.989886, -1.071698, -1.401348, 1, 0.145098, 0, 1,
-1.986651, 1.856827, 0.4825228, 1, 0.1490196, 0, 1,
-1.967375, -1.32154, -2.38337, 1, 0.1568628, 0, 1,
-1.961574, -0.01528943, -2.073884, 1, 0.1607843, 0, 1,
-1.944899, 1.408327, -1.746215, 1, 0.1686275, 0, 1,
-1.943629, 0.4457411, -2.24297, 1, 0.172549, 0, 1,
-1.928327, -0.169086, -1.582772, 1, 0.1803922, 0, 1,
-1.888657, -2.035559, -1.63494, 1, 0.1843137, 0, 1,
-1.858563, -1.007202, -1.765198, 1, 0.1921569, 0, 1,
-1.843347, -0.6233521, -1.310827, 1, 0.1960784, 0, 1,
-1.839029, -0.05872153, -1.509385, 1, 0.2039216, 0, 1,
-1.831753, 0.3026994, -0.9759682, 1, 0.2117647, 0, 1,
-1.814333, 0.6034854, -1.636454, 1, 0.2156863, 0, 1,
-1.795372, 1.344639, 0.409671, 1, 0.2235294, 0, 1,
-1.791802, 1.212852, -0.5259833, 1, 0.227451, 0, 1,
-1.791558, -0.09949013, -0.5363871, 1, 0.2352941, 0, 1,
-1.774949, 0.7595954, -1.679991, 1, 0.2392157, 0, 1,
-1.772069, -1.072917, -2.102636, 1, 0.2470588, 0, 1,
-1.739867, 0.4404795, -0.7129313, 1, 0.2509804, 0, 1,
-1.716186, 0.6173208, -1.655964, 1, 0.2588235, 0, 1,
-1.681061, 1.52458, -0.9830945, 1, 0.2627451, 0, 1,
-1.678542, 0.6962172, -1.09923, 1, 0.2705882, 0, 1,
-1.675756, 2.098344, -3.07876, 1, 0.2745098, 0, 1,
-1.642491, -1.71984, -2.452506, 1, 0.282353, 0, 1,
-1.63911, 1.474427, -0.695287, 1, 0.2862745, 0, 1,
-1.630605, -0.231074, -1.359377, 1, 0.2941177, 0, 1,
-1.629053, 0.1850883, -2.280254, 1, 0.3019608, 0, 1,
-1.626239, -1.133443, -2.67675, 1, 0.3058824, 0, 1,
-1.625266, 1.430383, 0.9601181, 1, 0.3137255, 0, 1,
-1.616319, 0.2877376, -2.68061, 1, 0.3176471, 0, 1,
-1.615695, -0.726742, 0.234862, 1, 0.3254902, 0, 1,
-1.613202, -0.2883098, -1.969514, 1, 0.3294118, 0, 1,
-1.60986, -0.3195042, -1.97086, 1, 0.3372549, 0, 1,
-1.605092, 0.417636, -1.513525, 1, 0.3411765, 0, 1,
-1.589394, -0.08637699, -1.959021, 1, 0.3490196, 0, 1,
-1.571527, -1.845146, -1.714473, 1, 0.3529412, 0, 1,
-1.566298, -0.6031135, -0.9816239, 1, 0.3607843, 0, 1,
-1.550817, -1.189067, -2.566868, 1, 0.3647059, 0, 1,
-1.550816, -0.338414, -1.083718, 1, 0.372549, 0, 1,
-1.549732, -0.5080621, -2.421543, 1, 0.3764706, 0, 1,
-1.530991, 0.09370723, -1.046953, 1, 0.3843137, 0, 1,
-1.52831, 0.8072559, -1.979995, 1, 0.3882353, 0, 1,
-1.519575, 1.792518, -0.5090253, 1, 0.3960784, 0, 1,
-1.518647, 1.340854, -0.3490118, 1, 0.4039216, 0, 1,
-1.515276, -1.160941, -2.14603, 1, 0.4078431, 0, 1,
-1.513582, 0.2137699, -0.9185385, 1, 0.4156863, 0, 1,
-1.504818, -0.312897, -3.051908, 1, 0.4196078, 0, 1,
-1.498681, -0.1630488, -1.001819, 1, 0.427451, 0, 1,
-1.493219, 1.200872, -1.110146, 1, 0.4313726, 0, 1,
-1.484848, 1.033803, -1.142601, 1, 0.4392157, 0, 1,
-1.480249, 0.9722564, -0.746326, 1, 0.4431373, 0, 1,
-1.476987, -0.5051866, -3.499448, 1, 0.4509804, 0, 1,
-1.475677, 0.5966235, -2.863034, 1, 0.454902, 0, 1,
-1.468217, 0.09627952, -2.1674, 1, 0.4627451, 0, 1,
-1.463852, -0.1245968, 1.777332, 1, 0.4666667, 0, 1,
-1.456035, 0.4370051, -1.508757, 1, 0.4745098, 0, 1,
-1.454382, 0.39462, -3.117481, 1, 0.4784314, 0, 1,
-1.452402, -0.5759768, -1.440393, 1, 0.4862745, 0, 1,
-1.452133, -0.3634653, -0.5979988, 1, 0.4901961, 0, 1,
-1.447474, 1.031004, -0.4982786, 1, 0.4980392, 0, 1,
-1.447173, 0.4552331, -1.89812, 1, 0.5058824, 0, 1,
-1.440281, -0.5508835, -1.782723, 1, 0.509804, 0, 1,
-1.431502, -2.035843, -2.370709, 1, 0.5176471, 0, 1,
-1.41899, -1.675067, -1.76554, 1, 0.5215687, 0, 1,
-1.413527, -0.4744238, -0.9104869, 1, 0.5294118, 0, 1,
-1.412163, 0.9140121, -0.04879859, 1, 0.5333334, 0, 1,
-1.404548, -0.07582135, 0.4115457, 1, 0.5411765, 0, 1,
-1.391482, -1.93696, -1.527799, 1, 0.5450981, 0, 1,
-1.385592, 0.8529354, -2.380208, 1, 0.5529412, 0, 1,
-1.384118, 1.358715, -1.403035, 1, 0.5568628, 0, 1,
-1.357691, -0.4665354, -1.682176, 1, 0.5647059, 0, 1,
-1.356403, -1.003446, -2.901446, 1, 0.5686275, 0, 1,
-1.35418, -0.8167228, -1.624566, 1, 0.5764706, 0, 1,
-1.345655, 1.203462, -1.471618, 1, 0.5803922, 0, 1,
-1.336881, -0.4439101, -2.286839, 1, 0.5882353, 0, 1,
-1.33531, -0.6336055, 0.04542468, 1, 0.5921569, 0, 1,
-1.3342, -0.7619568, -1.828899, 1, 0.6, 0, 1,
-1.334025, 0.1145399, -2.407943, 1, 0.6078432, 0, 1,
-1.333518, -0.04676413, -0.870844, 1, 0.6117647, 0, 1,
-1.326947, -1.119709, -3.169507, 1, 0.6196079, 0, 1,
-1.323371, 1.377518, -0.8908646, 1, 0.6235294, 0, 1,
-1.316864, 0.2895794, -0.7733315, 1, 0.6313726, 0, 1,
-1.31503, 0.5695683, -2.351676, 1, 0.6352941, 0, 1,
-1.312624, -1.021268, -2.82206, 1, 0.6431373, 0, 1,
-1.309678, 0.4734679, -1.032347, 1, 0.6470588, 0, 1,
-1.308727, 1.534119, -1.851694, 1, 0.654902, 0, 1,
-1.29631, -0.1626275, -1.45553, 1, 0.6588235, 0, 1,
-1.295573, -1.187144, -3.293452, 1, 0.6666667, 0, 1,
-1.287324, 0.3660636, -1.338367, 1, 0.6705883, 0, 1,
-1.267371, 0.5819793, -0.9280273, 1, 0.6784314, 0, 1,
-1.255767, -0.3819781, -3.211924, 1, 0.682353, 0, 1,
-1.253512, 0.9359071, -1.805604, 1, 0.6901961, 0, 1,
-1.251241, 0.06482259, -0.3151163, 1, 0.6941177, 0, 1,
-1.243836, 0.383837, -1.084177, 1, 0.7019608, 0, 1,
-1.241827, 0.008352936, -0.1856428, 1, 0.7098039, 0, 1,
-1.241204, 0.1870473, -0.02566229, 1, 0.7137255, 0, 1,
-1.239259, -1.088825, -1.38752, 1, 0.7215686, 0, 1,
-1.239205, -0.2224841, -1.428308, 1, 0.7254902, 0, 1,
-1.227433, -0.1490804, -2.606466, 1, 0.7333333, 0, 1,
-1.220864, 0.8852953, 0.3716844, 1, 0.7372549, 0, 1,
-1.214592, -0.5378909, -4.414981, 1, 0.7450981, 0, 1,
-1.214278, -0.1787552, -1.281759, 1, 0.7490196, 0, 1,
-1.200042, 0.6773287, -1.808221, 1, 0.7568628, 0, 1,
-1.196364, 0.6092436, -1.479819, 1, 0.7607843, 0, 1,
-1.192711, 0.1712435, -1.369378, 1, 0.7686275, 0, 1,
-1.187872, 0.2064638, -0.389302, 1, 0.772549, 0, 1,
-1.187117, -0.9315513, -4.082991, 1, 0.7803922, 0, 1,
-1.180731, 0.7245185, -1.099566, 1, 0.7843137, 0, 1,
-1.178375, -0.7659032, -3.360653, 1, 0.7921569, 0, 1,
-1.168863, -0.9437994, -1.491603, 1, 0.7960784, 0, 1,
-1.161289, -0.8702745, -3.068968, 1, 0.8039216, 0, 1,
-1.155192, 0.5317589, -1.427341, 1, 0.8117647, 0, 1,
-1.149001, 0.5398595, -2.724375, 1, 0.8156863, 0, 1,
-1.146656, 0.9651729, -0.3373239, 1, 0.8235294, 0, 1,
-1.143482, -0.3300775, -3.280325, 1, 0.827451, 0, 1,
-1.134703, 0.2308384, -2.165082, 1, 0.8352941, 0, 1,
-1.132074, 0.9889889, -0.7942289, 1, 0.8392157, 0, 1,
-1.131931, 0.2947453, -2.531449, 1, 0.8470588, 0, 1,
-1.128717, 0.6786392, -1.374433, 1, 0.8509804, 0, 1,
-1.125044, 0.7737732, -1.370826, 1, 0.8588235, 0, 1,
-1.124669, -0.08481637, -0.6495509, 1, 0.8627451, 0, 1,
-1.120598, 0.8664705, -0.4117908, 1, 0.8705882, 0, 1,
-1.108099, -0.5741904, -2.487033, 1, 0.8745098, 0, 1,
-1.101489, 0.1908016, -0.7902026, 1, 0.8823529, 0, 1,
-1.092065, -0.1612584, -3.547073, 1, 0.8862745, 0, 1,
-1.090025, 0.6166011, -2.142812, 1, 0.8941177, 0, 1,
-1.076432, 0.7441218, -1.12449, 1, 0.8980392, 0, 1,
-1.073343, 0.2749493, -1.906208, 1, 0.9058824, 0, 1,
-1.070806, 0.6003752, -1.955034, 1, 0.9137255, 0, 1,
-1.068045, -1.745192, -3.461051, 1, 0.9176471, 0, 1,
-1.067336, -0.8059694, -2.996451, 1, 0.9254902, 0, 1,
-1.066075, -1.397267, -3.572358, 1, 0.9294118, 0, 1,
-1.064003, 0.09674744, -1.625669, 1, 0.9372549, 0, 1,
-1.061546, 1.744369, -0.3837247, 1, 0.9411765, 0, 1,
-1.048121, -0.5005829, -0.8037193, 1, 0.9490196, 0, 1,
-1.043225, -1.396888, -3.272007, 1, 0.9529412, 0, 1,
-1.042108, 1.514474, -1.79816, 1, 0.9607843, 0, 1,
-1.039028, -0.08481248, -2.103392, 1, 0.9647059, 0, 1,
-1.037764, 0.7094597, 0.729161, 1, 0.972549, 0, 1,
-1.033634, -0.3302287, -2.460392, 1, 0.9764706, 0, 1,
-1.030046, 0.600885, 1.117081, 1, 0.9843137, 0, 1,
-1.020349, 1.464261, -0.343286, 1, 0.9882353, 0, 1,
-1.018241, -0.1227203, -3.75839, 1, 0.9960784, 0, 1,
-1.015037, 0.801522, -1.913915, 0.9960784, 1, 0, 1,
-1.012523, -0.6311795, -1.600883, 0.9921569, 1, 0, 1,
-1.005989, 0.4402179, -3.152445, 0.9843137, 1, 0, 1,
-0.9972493, 1.382139, -1.57647, 0.9803922, 1, 0, 1,
-0.9907954, -0.1419984, -2.173356, 0.972549, 1, 0, 1,
-0.9898911, 0.6929247, -0.8811665, 0.9686275, 1, 0, 1,
-0.9832427, 0.225173, -1.618542, 0.9607843, 1, 0, 1,
-0.9804011, -0.4722594, -1.546364, 0.9568627, 1, 0, 1,
-0.9801453, -0.4903508, -3.963902, 0.9490196, 1, 0, 1,
-0.9771852, 2.303103, 2.958872, 0.945098, 1, 0, 1,
-0.9744513, -0.1665382, -0.6349835, 0.9372549, 1, 0, 1,
-0.9744299, 2.108968, -0.9551511, 0.9333333, 1, 0, 1,
-0.9723503, -0.3925008, -1.274062, 0.9254902, 1, 0, 1,
-0.969285, -0.06728929, -2.505713, 0.9215686, 1, 0, 1,
-0.9651899, -0.4794431, -1.715429, 0.9137255, 1, 0, 1,
-0.9502903, 0.1981459, -0.6920028, 0.9098039, 1, 0, 1,
-0.9485546, 0.615289, -2.052701, 0.9019608, 1, 0, 1,
-0.9455159, -0.1424157, -0.9127739, 0.8941177, 1, 0, 1,
-0.9378292, -0.4254599, -0.2049994, 0.8901961, 1, 0, 1,
-0.9371798, 0.2690873, -2.694085, 0.8823529, 1, 0, 1,
-0.9366413, 1.479061, -1.012894, 0.8784314, 1, 0, 1,
-0.9198967, -0.442637, -1.748361, 0.8705882, 1, 0, 1,
-0.9118735, -0.364222, 1.111315, 0.8666667, 1, 0, 1,
-0.9088164, -1.876771, -1.551094, 0.8588235, 1, 0, 1,
-0.9074703, -0.6168508, -1.862793, 0.854902, 1, 0, 1,
-0.902925, -0.2792734, -0.07117726, 0.8470588, 1, 0, 1,
-0.8962435, 0.519745, -1.617385, 0.8431373, 1, 0, 1,
-0.8905389, 0.7948211, 0.7548411, 0.8352941, 1, 0, 1,
-0.8905306, 1.755083, -0.006815573, 0.8313726, 1, 0, 1,
-0.8814323, -0.05900105, -0.5752565, 0.8235294, 1, 0, 1,
-0.8813732, 1.169597, -1.396285, 0.8196079, 1, 0, 1,
-0.879724, 0.06045283, -2.135572, 0.8117647, 1, 0, 1,
-0.878344, -0.5779091, -3.976478, 0.8078431, 1, 0, 1,
-0.8780145, -0.6269046, -0.6635404, 0.8, 1, 0, 1,
-0.872907, 1.257362, -0.3390737, 0.7921569, 1, 0, 1,
-0.871962, -0.8404763, -3.027663, 0.7882353, 1, 0, 1,
-0.8718045, 0.3874438, -1.25177, 0.7803922, 1, 0, 1,
-0.8684151, -0.7668126, -4.050307, 0.7764706, 1, 0, 1,
-0.8611709, 1.491015, -0.7227001, 0.7686275, 1, 0, 1,
-0.8508604, -0.3636083, -2.398133, 0.7647059, 1, 0, 1,
-0.8505498, 1.174753, -3.208575, 0.7568628, 1, 0, 1,
-0.8449804, 0.08024348, -1.296244, 0.7529412, 1, 0, 1,
-0.8406337, 1.682974, -0.735224, 0.7450981, 1, 0, 1,
-0.8364536, 0.3895308, -1.548373, 0.7411765, 1, 0, 1,
-0.831404, 0.3278843, -1.706444, 0.7333333, 1, 0, 1,
-0.8283666, -0.07928795, -2.011741, 0.7294118, 1, 0, 1,
-0.8239909, -0.7001483, 0.6011118, 0.7215686, 1, 0, 1,
-0.8216274, 1.382577, -0.5455557, 0.7176471, 1, 0, 1,
-0.8200155, -0.6263253, -2.982111, 0.7098039, 1, 0, 1,
-0.8076649, 0.6811669, 0.8369026, 0.7058824, 1, 0, 1,
-0.8017084, 0.01953036, -1.227722, 0.6980392, 1, 0, 1,
-0.8010087, 0.4687975, -0.6695833, 0.6901961, 1, 0, 1,
-0.8001204, 1.112301, 0.5116453, 0.6862745, 1, 0, 1,
-0.7916042, 0.6108801, -1.180436, 0.6784314, 1, 0, 1,
-0.7802917, -0.9494943, -1.925122, 0.6745098, 1, 0, 1,
-0.776674, 1.395956, -0.7506167, 0.6666667, 1, 0, 1,
-0.7704042, 1.149138, -2.769508, 0.6627451, 1, 0, 1,
-0.7699383, 0.2820513, -2.702369, 0.654902, 1, 0, 1,
-0.7624229, 0.2209672, -1.04754, 0.6509804, 1, 0, 1,
-0.7604942, 1.85886, 0.3380653, 0.6431373, 1, 0, 1,
-0.7512538, -0.4800932, -4.119457, 0.6392157, 1, 0, 1,
-0.7444829, 1.482737, 0.05930774, 0.6313726, 1, 0, 1,
-0.7402378, 1.103974, -0.6936252, 0.627451, 1, 0, 1,
-0.7350466, -0.6753383, -2.600986, 0.6196079, 1, 0, 1,
-0.73497, -0.6957564, -1.933056, 0.6156863, 1, 0, 1,
-0.7328051, -0.1825042, -0.9739469, 0.6078432, 1, 0, 1,
-0.7304699, 1.038821, -0.8904659, 0.6039216, 1, 0, 1,
-0.7275748, -0.3014789, -2.746398, 0.5960785, 1, 0, 1,
-0.7251309, 0.7243924, 1.422585, 0.5882353, 1, 0, 1,
-0.7250822, -0.3447759, -0.9497169, 0.5843138, 1, 0, 1,
-0.724285, 0.5513561, 0.4845611, 0.5764706, 1, 0, 1,
-0.7210198, 0.7291484, -3.765792, 0.572549, 1, 0, 1,
-0.717629, -1.547762, -3.584565, 0.5647059, 1, 0, 1,
-0.7149638, 0.4598833, 0.5994197, 0.5607843, 1, 0, 1,
-0.7079908, -2.045297, -2.518268, 0.5529412, 1, 0, 1,
-0.7072182, 0.04287702, -1.758016, 0.5490196, 1, 0, 1,
-0.7072036, 1.947323, 0.1312414, 0.5411765, 1, 0, 1,
-0.7048772, -0.6266024, -2.509128, 0.5372549, 1, 0, 1,
-0.694346, 0.8235249, 0.4557882, 0.5294118, 1, 0, 1,
-0.6922882, -0.7346551, -2.01561, 0.5254902, 1, 0, 1,
-0.6905136, -0.06463382, -1.352317, 0.5176471, 1, 0, 1,
-0.6790173, -0.196024, -1.627304, 0.5137255, 1, 0, 1,
-0.6668103, -1.5909, -2.542456, 0.5058824, 1, 0, 1,
-0.6650508, 0.2575912, -0.6928449, 0.5019608, 1, 0, 1,
-0.6647903, -0.02814855, -0.9258834, 0.4941176, 1, 0, 1,
-0.6601803, -1.178657, -2.541845, 0.4862745, 1, 0, 1,
-0.6586584, -0.7019815, -4.160543, 0.4823529, 1, 0, 1,
-0.6547171, 1.410676, -0.9169422, 0.4745098, 1, 0, 1,
-0.6533204, 0.4382131, 1.408116, 0.4705882, 1, 0, 1,
-0.6475311, -0.04565017, -0.2330165, 0.4627451, 1, 0, 1,
-0.6463614, -0.08639286, -0.5272158, 0.4588235, 1, 0, 1,
-0.6401834, -0.6607389, -2.696103, 0.4509804, 1, 0, 1,
-0.6348148, 2.063413, -0.8004735, 0.4470588, 1, 0, 1,
-0.6345716, 1.461986, 0.3500683, 0.4392157, 1, 0, 1,
-0.6326187, -0.4315318, -1.494626, 0.4352941, 1, 0, 1,
-0.6307549, -0.08239344, -2.535916, 0.427451, 1, 0, 1,
-0.6272154, -0.0003863501, -1.953078, 0.4235294, 1, 0, 1,
-0.6217686, -1.784803, -2.302235, 0.4156863, 1, 0, 1,
-0.620739, 0.6072635, 1.02171, 0.4117647, 1, 0, 1,
-0.6204529, -0.4335281, -3.760007, 0.4039216, 1, 0, 1,
-0.6191239, 0.4919978, 0.07591061, 0.3960784, 1, 0, 1,
-0.6182575, 2.114206, 0.4379117, 0.3921569, 1, 0, 1,
-0.6153991, -0.05102767, -1.779863, 0.3843137, 1, 0, 1,
-0.6053001, -0.6340249, -1.758054, 0.3803922, 1, 0, 1,
-0.6026505, -1.731885, -2.309948, 0.372549, 1, 0, 1,
-0.6001911, 1.361519, -0.2491701, 0.3686275, 1, 0, 1,
-0.5992993, 0.670309, -0.8827735, 0.3607843, 1, 0, 1,
-0.5988223, -0.07095058, -3.482012, 0.3568628, 1, 0, 1,
-0.5926222, 1.752317, -1.029089, 0.3490196, 1, 0, 1,
-0.5896733, 0.7272364, -0.9174262, 0.345098, 1, 0, 1,
-0.5895831, -0.9722261, -2.121413, 0.3372549, 1, 0, 1,
-0.5838275, 0.4423448, -1.259395, 0.3333333, 1, 0, 1,
-0.5805873, -0.565504, -1.518387, 0.3254902, 1, 0, 1,
-0.5802337, -1.036386, -3.257326, 0.3215686, 1, 0, 1,
-0.5801766, 1.314751, -1.294275, 0.3137255, 1, 0, 1,
-0.5782064, 0.328077, -1.12042, 0.3098039, 1, 0, 1,
-0.5770811, 2.203453, -0.03141168, 0.3019608, 1, 0, 1,
-0.5767588, -0.9872153, -5.328762, 0.2941177, 1, 0, 1,
-0.5720122, -1.345035, -1.542565, 0.2901961, 1, 0, 1,
-0.5714885, 0.178415, -2.046317, 0.282353, 1, 0, 1,
-0.5699208, -0.3742368, -2.448174, 0.2784314, 1, 0, 1,
-0.5689017, -0.7094345, -1.117874, 0.2705882, 1, 0, 1,
-0.5677675, -0.654151, -4.022743, 0.2666667, 1, 0, 1,
-0.5665625, 0.1920166, -1.706837, 0.2588235, 1, 0, 1,
-0.5665591, 0.8023454, -1.705592, 0.254902, 1, 0, 1,
-0.5659268, -0.8412444, -2.058064, 0.2470588, 1, 0, 1,
-0.5623434, 0.7480181, 0.3717303, 0.2431373, 1, 0, 1,
-0.55977, -1.672595, -2.629376, 0.2352941, 1, 0, 1,
-0.5580806, -1.206097, -5.072157, 0.2313726, 1, 0, 1,
-0.5576756, 0.1189881, -1.23575, 0.2235294, 1, 0, 1,
-0.5527471, -0.4476335, -1.66297, 0.2196078, 1, 0, 1,
-0.5448738, 0.3967538, -4.056665, 0.2117647, 1, 0, 1,
-0.5437642, -0.5442579, -2.915092, 0.2078431, 1, 0, 1,
-0.5415624, 1.160049, 0.3147141, 0.2, 1, 0, 1,
-0.5395047, 0.2466896, -1.383128, 0.1921569, 1, 0, 1,
-0.5377141, 0.5442871, -0.06292255, 0.1882353, 1, 0, 1,
-0.5356606, 0.1024708, -1.548313, 0.1803922, 1, 0, 1,
-0.5356111, 1.0246, 0.4124984, 0.1764706, 1, 0, 1,
-0.5342556, 0.04211595, -2.008225, 0.1686275, 1, 0, 1,
-0.525664, 0.4365528, -1.822563, 0.1647059, 1, 0, 1,
-0.518217, -0.07669368, -3.474967, 0.1568628, 1, 0, 1,
-0.5164566, 0.2368941, -3.180055, 0.1529412, 1, 0, 1,
-0.5158733, -1.355523, -3.916375, 0.145098, 1, 0, 1,
-0.514099, -0.2750665, -0.9097267, 0.1411765, 1, 0, 1,
-0.5100781, -0.1851849, -2.886535, 0.1333333, 1, 0, 1,
-0.5092456, 0.6796843, -2.482655, 0.1294118, 1, 0, 1,
-0.5061067, 0.1619031, -0.5057876, 0.1215686, 1, 0, 1,
-0.5058438, -1.34835, -2.916918, 0.1176471, 1, 0, 1,
-0.500393, 0.1314169, -1.28043, 0.1098039, 1, 0, 1,
-0.4969939, 0.2086021, -3.520411, 0.1058824, 1, 0, 1,
-0.494513, -0.5391291, -0.8758953, 0.09803922, 1, 0, 1,
-0.4940237, 1.843007, 0.05011346, 0.09019608, 1, 0, 1,
-0.4936053, -0.2237916, -1.153317, 0.08627451, 1, 0, 1,
-0.4916022, 0.357483, -1.467251, 0.07843138, 1, 0, 1,
-0.4895723, -1.80268, -4.178917, 0.07450981, 1, 0, 1,
-0.4858237, 0.8591581, -1.120048, 0.06666667, 1, 0, 1,
-0.4813858, 0.8939701, 0.7528462, 0.0627451, 1, 0, 1,
-0.4735658, -1.552335, -1.742378, 0.05490196, 1, 0, 1,
-0.4726242, -0.05352102, -1.459904, 0.05098039, 1, 0, 1,
-0.470715, -1.387788, -1.099019, 0.04313726, 1, 0, 1,
-0.4689464, -1.719715, -3.6195, 0.03921569, 1, 0, 1,
-0.4645921, 1.391675, -0.6913149, 0.03137255, 1, 0, 1,
-0.4605857, 0.6047198, -0.5076366, 0.02745098, 1, 0, 1,
-0.4558424, 0.6298571, -0.5312224, 0.01960784, 1, 0, 1,
-0.4510138, 0.6895223, 0.2462098, 0.01568628, 1, 0, 1,
-0.450607, 0.5814281, -1.142683, 0.007843138, 1, 0, 1,
-0.4493924, 0.2930492, -0.08333693, 0.003921569, 1, 0, 1,
-0.4437698, 1.934536, -0.08723673, 0, 1, 0.003921569, 1,
-0.442862, -1.249321, -3.162126, 0, 1, 0.01176471, 1,
-0.4428222, 0.7175571, -0.7801607, 0, 1, 0.01568628, 1,
-0.4410059, -0.9281508, -2.032911, 0, 1, 0.02352941, 1,
-0.4358537, 2.836061, 0.6651607, 0, 1, 0.02745098, 1,
-0.4354303, 0.3030181, -1.20862, 0, 1, 0.03529412, 1,
-0.4320756, -1.022213, -0.9307439, 0, 1, 0.03921569, 1,
-0.4309517, 1.170428, 0.7158256, 0, 1, 0.04705882, 1,
-0.4293972, 0.03931358, -1.255398, 0, 1, 0.05098039, 1,
-0.4278268, -0.2012402, -1.195392, 0, 1, 0.05882353, 1,
-0.4277722, 0.1049585, -0.9543325, 0, 1, 0.0627451, 1,
-0.421552, 0.09383155, -1.718925, 0, 1, 0.07058824, 1,
-0.4213172, 0.2069339, -2.227985, 0, 1, 0.07450981, 1,
-0.4180589, -1.419929, -3.288896, 0, 1, 0.08235294, 1,
-0.4178932, 1.380652, -0.5853509, 0, 1, 0.08627451, 1,
-0.4123776, 0.8751091, -3.3995, 0, 1, 0.09411765, 1,
-0.4029704, -0.1052267, -2.148548, 0, 1, 0.1019608, 1,
-0.3997236, 0.4148297, -0.8554668, 0, 1, 0.1058824, 1,
-0.3989976, 0.1488737, -1.358995, 0, 1, 0.1137255, 1,
-0.3978512, -2.128189, -2.388792, 0, 1, 0.1176471, 1,
-0.3975199, 0.09582098, -1.486989, 0, 1, 0.1254902, 1,
-0.3961436, 0.4576774, 0.1373827, 0, 1, 0.1294118, 1,
-0.3960011, 0.603153, -0.7218603, 0, 1, 0.1372549, 1,
-0.3956484, -0.01831973, -1.036921, 0, 1, 0.1411765, 1,
-0.3920554, 0.4350017, 0.7926967, 0, 1, 0.1490196, 1,
-0.3857569, -0.02777076, -1.385261, 0, 1, 0.1529412, 1,
-0.3838691, 0.9198197, 0.06314878, 0, 1, 0.1607843, 1,
-0.3834237, 0.3319585, -0.6777547, 0, 1, 0.1647059, 1,
-0.3808752, 0.388851, -0.7434844, 0, 1, 0.172549, 1,
-0.3705722, 0.4111059, -0.1641447, 0, 1, 0.1764706, 1,
-0.3701444, 0.1586284, 0.7044845, 0, 1, 0.1843137, 1,
-0.3658546, -0.9482341, -5.033421, 0, 1, 0.1882353, 1,
-0.3612243, 1.466884, 1.0324, 0, 1, 0.1960784, 1,
-0.3563363, 0.04866412, -3.111916, 0, 1, 0.2039216, 1,
-0.3556672, 0.06557492, -1.346808, 0, 1, 0.2078431, 1,
-0.3547512, 1.599522, 1.196021, 0, 1, 0.2156863, 1,
-0.3528103, -1.670532, -1.941484, 0, 1, 0.2196078, 1,
-0.3527837, -2.856352, -2.732338, 0, 1, 0.227451, 1,
-0.351551, -0.7270455, -3.107937, 0, 1, 0.2313726, 1,
-0.3509035, 0.9333248, -0.470733, 0, 1, 0.2392157, 1,
-0.3493205, -0.8304999, -1.807711, 0, 1, 0.2431373, 1,
-0.3481642, -1.03705, -3.917931, 0, 1, 0.2509804, 1,
-0.347139, 0.3621235, -1.367381, 0, 1, 0.254902, 1,
-0.3422443, -1.087772, -2.310002, 0, 1, 0.2627451, 1,
-0.3394424, -0.1758639, -2.218873, 0, 1, 0.2666667, 1,
-0.3370112, -0.3379291, -3.729389, 0, 1, 0.2745098, 1,
-0.3363369, 0.6816745, -1.05384, 0, 1, 0.2784314, 1,
-0.3362343, -0.02076012, -1.024099, 0, 1, 0.2862745, 1,
-0.3318698, -1.043009, -3.443628, 0, 1, 0.2901961, 1,
-0.3242226, 0.09931301, -1.357137, 0, 1, 0.2980392, 1,
-0.3241111, 1.158799, 0.00265725, 0, 1, 0.3058824, 1,
-0.318984, -0.8718902, -2.271174, 0, 1, 0.3098039, 1,
-0.3174351, -0.6275634, -3.211308, 0, 1, 0.3176471, 1,
-0.3158498, -0.5591241, -2.807696, 0, 1, 0.3215686, 1,
-0.3106723, -0.6615636, -4.00335, 0, 1, 0.3294118, 1,
-0.3070814, -1.617499, -3.463958, 0, 1, 0.3333333, 1,
-0.3025326, -0.7957638, -2.684312, 0, 1, 0.3411765, 1,
-0.3020602, 0.2507718, -1.544046, 0, 1, 0.345098, 1,
-0.2994117, -0.09747009, -1.112251, 0, 1, 0.3529412, 1,
-0.2988906, 0.0590762, -2.910552, 0, 1, 0.3568628, 1,
-0.2980722, 2.338456, 1.044335, 0, 1, 0.3647059, 1,
-0.2915697, 1.632948, -0.6412365, 0, 1, 0.3686275, 1,
-0.2905766, -0.6276288, -2.99581, 0, 1, 0.3764706, 1,
-0.2902541, -0.02238768, -1.927003, 0, 1, 0.3803922, 1,
-0.2876385, -0.28881, -2.586863, 0, 1, 0.3882353, 1,
-0.2853561, -1.053692, -3.379725, 0, 1, 0.3921569, 1,
-0.285006, -0.6278265, -2.852, 0, 1, 0.4, 1,
-0.2832022, 1.901172, 0.02282017, 0, 1, 0.4078431, 1,
-0.2796281, -1.429726, -3.666701, 0, 1, 0.4117647, 1,
-0.2711975, 0.3096612, -1.130397, 0, 1, 0.4196078, 1,
-0.2678862, -0.7730495, -1.837671, 0, 1, 0.4235294, 1,
-0.2678535, -0.789032, -4.321139, 0, 1, 0.4313726, 1,
-0.2659634, -1.009027, -3.357508, 0, 1, 0.4352941, 1,
-0.2658599, -0.1527134, -4.25481, 0, 1, 0.4431373, 1,
-0.2612621, 0.956156, -1.110437, 0, 1, 0.4470588, 1,
-0.2597695, -0.8308467, -2.457049, 0, 1, 0.454902, 1,
-0.2593431, 0.2352976, 0.2017447, 0, 1, 0.4588235, 1,
-0.2540784, 0.1453058, -0.6514875, 0, 1, 0.4666667, 1,
-0.2522137, 0.07767567, -0.635512, 0, 1, 0.4705882, 1,
-0.248366, -1.048157, -3.873069, 0, 1, 0.4784314, 1,
-0.2465431, -1.048502, -1.430376, 0, 1, 0.4823529, 1,
-0.2440253, -0.9882263, -3.305128, 0, 1, 0.4901961, 1,
-0.2432949, 1.189968, -0.789844, 0, 1, 0.4941176, 1,
-0.2424793, -1.25549, -1.296571, 0, 1, 0.5019608, 1,
-0.2411949, -0.9046562, -2.001432, 0, 1, 0.509804, 1,
-0.2383877, 1.045103, -1.666382, 0, 1, 0.5137255, 1,
-0.2380985, 0.62036, 0.04592956, 0, 1, 0.5215687, 1,
-0.2362216, -1.628557, -4.575926, 0, 1, 0.5254902, 1,
-0.2355828, 0.313088, -2.176509, 0, 1, 0.5333334, 1,
-0.2332083, -1.89891, -1.256706, 0, 1, 0.5372549, 1,
-0.2317169, 0.8815604, -0.5451452, 0, 1, 0.5450981, 1,
-0.2310352, 0.6297279, 0.5063879, 0, 1, 0.5490196, 1,
-0.2248071, -0.1603516, -3.27838, 0, 1, 0.5568628, 1,
-0.2220791, -1.607395, -3.23417, 0, 1, 0.5607843, 1,
-0.221371, -0.266026, -4.667086, 0, 1, 0.5686275, 1,
-0.2184998, -0.5600867, -2.106926, 0, 1, 0.572549, 1,
-0.2145959, -1.921392, -1.728716, 0, 1, 0.5803922, 1,
-0.2143344, 0.1605387, -1.245711, 0, 1, 0.5843138, 1,
-0.2132643, 0.3973093, -1.793624, 0, 1, 0.5921569, 1,
-0.2112753, 0.9942985, -0.4232809, 0, 1, 0.5960785, 1,
-0.2098426, -0.4514223, -4.140473, 0, 1, 0.6039216, 1,
-0.209738, 0.4038081, -0.307964, 0, 1, 0.6117647, 1,
-0.2084404, 0.4534684, -0.1394588, 0, 1, 0.6156863, 1,
-0.2081672, -0.5196918, -2.634851, 0, 1, 0.6235294, 1,
-0.2060871, 1.329775, -1.194533, 0, 1, 0.627451, 1,
-0.2051275, 1.494349, 0.8852372, 0, 1, 0.6352941, 1,
-0.2022187, 1.765967, -1.178891, 0, 1, 0.6392157, 1,
-0.2019696, -0.2414142, -2.374789, 0, 1, 0.6470588, 1,
-0.201084, -0.1862307, -3.118475, 0, 1, 0.6509804, 1,
-0.1882288, 0.561033, -1.627756, 0, 1, 0.6588235, 1,
-0.1878924, -0.1532354, -4.954868, 0, 1, 0.6627451, 1,
-0.1873323, -1.359075, -2.434335, 0, 1, 0.6705883, 1,
-0.1843102, 0.1049232, -0.6212417, 0, 1, 0.6745098, 1,
-0.1801354, 1.597812, 0.7807099, 0, 1, 0.682353, 1,
-0.1782126, 0.1266901, -0.02724965, 0, 1, 0.6862745, 1,
-0.1736533, 0.03812952, -2.044274, 0, 1, 0.6941177, 1,
-0.1734513, 0.08729783, -2.794641, 0, 1, 0.7019608, 1,
-0.172629, 0.6064644, -1.106569, 0, 1, 0.7058824, 1,
-0.1712575, -0.279554, -3.358467, 0, 1, 0.7137255, 1,
-0.1704916, 0.2250863, -0.8446614, 0, 1, 0.7176471, 1,
-0.1665859, 0.339738, 0.6379085, 0, 1, 0.7254902, 1,
-0.1633334, 0.321954, -0.6422458, 0, 1, 0.7294118, 1,
-0.1595995, 0.2285405, -1.602491, 0, 1, 0.7372549, 1,
-0.1593389, 0.08061743, -0.9077436, 0, 1, 0.7411765, 1,
-0.155345, 0.2081741, -1.79051, 0, 1, 0.7490196, 1,
-0.1490603, -0.4872377, -3.573501, 0, 1, 0.7529412, 1,
-0.1446061, -1.29023, -2.173567, 0, 1, 0.7607843, 1,
-0.1392732, 0.7006551, -0.1135319, 0, 1, 0.7647059, 1,
-0.1381845, 0.6327291, 0.04833828, 0, 1, 0.772549, 1,
-0.1332638, 0.9690108, -1.088052, 0, 1, 0.7764706, 1,
-0.1331574, -1.381714, -2.213964, 0, 1, 0.7843137, 1,
-0.1327195, -0.5540449, -3.356229, 0, 1, 0.7882353, 1,
-0.1281174, -0.7359911, -2.41646, 0, 1, 0.7960784, 1,
-0.1262744, 0.1017486, -2.191937, 0, 1, 0.8039216, 1,
-0.1260729, 0.9924152, 0.8175259, 0, 1, 0.8078431, 1,
-0.1226265, -0.7562149, -2.524879, 0, 1, 0.8156863, 1,
-0.1206115, -1.170505, -3.669347, 0, 1, 0.8196079, 1,
-0.1169122, 0.4328679, -0.8305163, 0, 1, 0.827451, 1,
-0.1168243, -1.505253, -3.954484, 0, 1, 0.8313726, 1,
-0.1159059, -0.2207041, -1.747693, 0, 1, 0.8392157, 1,
-0.115128, -0.4729455, -1.699652, 0, 1, 0.8431373, 1,
-0.1073011, 0.05000659, -1.728705, 0, 1, 0.8509804, 1,
-0.104679, 0.3670409, -2.163172, 0, 1, 0.854902, 1,
-0.104236, -1.639245, -3.370447, 0, 1, 0.8627451, 1,
-0.09861128, 1.749235, 0.4163192, 0, 1, 0.8666667, 1,
-0.0974291, -0.6094162, -3.344072, 0, 1, 0.8745098, 1,
-0.096921, -0.4682982, -2.70499, 0, 1, 0.8784314, 1,
-0.09453639, 0.206978, 0.6261957, 0, 1, 0.8862745, 1,
-0.09421617, -0.1241999, -2.013604, 0, 1, 0.8901961, 1,
-0.09371589, 1.435568, -0.09294505, 0, 1, 0.8980392, 1,
-0.08866142, -1.442023, -3.64936, 0, 1, 0.9058824, 1,
-0.08540015, 1.425225, -0.4990793, 0, 1, 0.9098039, 1,
-0.0840599, -0.6239681, -3.496381, 0, 1, 0.9176471, 1,
-0.07813242, -0.8905271, -2.996053, 0, 1, 0.9215686, 1,
-0.07809624, -0.8035983, -2.578252, 0, 1, 0.9294118, 1,
-0.07579916, 0.9840294, 0.09589418, 0, 1, 0.9333333, 1,
-0.07333048, 0.09109466, -0.3933147, 0, 1, 0.9411765, 1,
-0.07269488, 0.2783153, -0.2851626, 0, 1, 0.945098, 1,
-0.07243903, 0.254016, 1.696133, 0, 1, 0.9529412, 1,
-0.07195642, 2.345284, -1.745931, 0, 1, 0.9568627, 1,
-0.07104322, -0.6610898, -3.384818, 0, 1, 0.9647059, 1,
-0.07092652, -0.4265479, -1.154718, 0, 1, 0.9686275, 1,
-0.0700726, 0.2014105, -1.408626, 0, 1, 0.9764706, 1,
-0.06845926, 0.4304387, 0.06500214, 0, 1, 0.9803922, 1,
-0.06403293, -0.6470508, -3.465654, 0, 1, 0.9882353, 1,
-0.06137914, 1.046936, -0.2063125, 0, 1, 0.9921569, 1,
-0.05595848, 1.931538, 0.09239339, 0, 1, 1, 1,
-0.05503757, -0.4563755, -0.7756643, 0, 0.9921569, 1, 1,
-0.05031329, -1.831281, -1.608579, 0, 0.9882353, 1, 1,
-0.04784108, 0.1428598, -0.2638393, 0, 0.9803922, 1, 1,
-0.04508356, -0.05754432, -2.549074, 0, 0.9764706, 1, 1,
-0.04392321, -0.3314785, -3.037721, 0, 0.9686275, 1, 1,
-0.03472077, -0.2043297, -3.748769, 0, 0.9647059, 1, 1,
-0.03416039, 1.087465, 0.6760562, 0, 0.9568627, 1, 1,
-0.02867051, 1.43389, 1.705988, 0, 0.9529412, 1, 1,
-0.02851867, -0.7920349, -4.368127, 0, 0.945098, 1, 1,
-0.02733115, -0.4824508, -3.742927, 0, 0.9411765, 1, 1,
-0.02691349, -0.7809638, -1.836857, 0, 0.9333333, 1, 1,
-0.02620151, -0.3607304, -3.127824, 0, 0.9294118, 1, 1,
-0.02619172, -1.053441, -4.077044, 0, 0.9215686, 1, 1,
-0.02398784, 0.2824214, -2.080952, 0, 0.9176471, 1, 1,
-0.0231282, 0.1068659, -0.9098259, 0, 0.9098039, 1, 1,
-0.0200852, 0.08993151, -0.5909457, 0, 0.9058824, 1, 1,
-0.01943964, 0.3372244, 1.45367, 0, 0.8980392, 1, 1,
-0.01908317, 1.004258, -0.5872455, 0, 0.8901961, 1, 1,
-0.0189143, -0.3758205, -2.869361, 0, 0.8862745, 1, 1,
-0.01824315, -1.109145, -2.831879, 0, 0.8784314, 1, 1,
-0.01728917, 0.4047978, -0.0785917, 0, 0.8745098, 1, 1,
-0.01140259, -0.8325452, -3.990026, 0, 0.8666667, 1, 1,
-0.009719414, -0.06315039, -1.543597, 0, 0.8627451, 1, 1,
-0.008245375, -0.1211696, -2.649767, 0, 0.854902, 1, 1,
-0.00545508, 0.9687219, -0.3677258, 0, 0.8509804, 1, 1,
0.005520972, -1.763032, 2.705169, 0, 0.8431373, 1, 1,
0.006669199, -0.2980662, 0.04954122, 0, 0.8392157, 1, 1,
0.006793103, 1.088928, -1.66957, 0, 0.8313726, 1, 1,
0.008064928, -0.9725112, 5.058396, 0, 0.827451, 1, 1,
0.008956403, 1.62422, -0.2475968, 0, 0.8196079, 1, 1,
0.01299397, -1.914868, 2.212685, 0, 0.8156863, 1, 1,
0.01488433, -1.008275, 3.575711, 0, 0.8078431, 1, 1,
0.01824345, 1.54562, -0.7419773, 0, 0.8039216, 1, 1,
0.01971491, -0.1433767, 3.894164, 0, 0.7960784, 1, 1,
0.02206483, 0.07417264, 0.5583686, 0, 0.7882353, 1, 1,
0.02292579, 1.747254, 1.983232, 0, 0.7843137, 1, 1,
0.02624947, 0.3160115, 0.1294763, 0, 0.7764706, 1, 1,
0.02795955, -1.465686, 2.583893, 0, 0.772549, 1, 1,
0.02923867, 0.2974992, -0.9079788, 0, 0.7647059, 1, 1,
0.03431596, -0.158535, 5.131096, 0, 0.7607843, 1, 1,
0.04039108, -0.6334397, 2.972656, 0, 0.7529412, 1, 1,
0.04240116, -0.3850152, 2.264338, 0, 0.7490196, 1, 1,
0.04436703, 1.025724, -1.072415, 0, 0.7411765, 1, 1,
0.04833024, 1.333914, 1.092652, 0, 0.7372549, 1, 1,
0.05080368, -0.9756613, 4.350219, 0, 0.7294118, 1, 1,
0.05088474, 0.07430673, 1.411252, 0, 0.7254902, 1, 1,
0.05121032, -0.3758736, 4.231084, 0, 0.7176471, 1, 1,
0.05143145, 1.132179, 2.324959, 0, 0.7137255, 1, 1,
0.06142325, -0.06688295, 3.263733, 0, 0.7058824, 1, 1,
0.06371582, -0.7801362, 3.546203, 0, 0.6980392, 1, 1,
0.06377681, -0.02745438, 1.96767, 0, 0.6941177, 1, 1,
0.0653, 1.928078, 0.6953306, 0, 0.6862745, 1, 1,
0.0685445, 0.9871976, -0.3407848, 0, 0.682353, 1, 1,
0.06856969, 0.1762862, -0.2419729, 0, 0.6745098, 1, 1,
0.07138649, 0.7064238, 0.3191437, 0, 0.6705883, 1, 1,
0.09306651, 0.4962665, -2.549753, 0, 0.6627451, 1, 1,
0.09366398, -0.1163023, 2.52215, 0, 0.6588235, 1, 1,
0.09915502, -0.1565754, 2.185983, 0, 0.6509804, 1, 1,
0.1018946, 1.153278, -0.8013502, 0, 0.6470588, 1, 1,
0.1043671, -0.259758, 2.882738, 0, 0.6392157, 1, 1,
0.1044847, 1.935848, -0.01372258, 0, 0.6352941, 1, 1,
0.1046568, -0.5826955, 2.915708, 0, 0.627451, 1, 1,
0.1072105, 0.5010499, 2.500163, 0, 0.6235294, 1, 1,
0.1075963, -2.260332, 3.841726, 0, 0.6156863, 1, 1,
0.1140388, 0.5017374, 1.512382, 0, 0.6117647, 1, 1,
0.1173743, -1.124212, 5.897804, 0, 0.6039216, 1, 1,
0.1209532, -0.4494117, 2.872861, 0, 0.5960785, 1, 1,
0.1215199, 0.3554729, 1.317526, 0, 0.5921569, 1, 1,
0.1215508, 0.3148612, 0.4241551, 0, 0.5843138, 1, 1,
0.1255616, -0.7918027, 2.122329, 0, 0.5803922, 1, 1,
0.1266817, -0.1686702, 2.237236, 0, 0.572549, 1, 1,
0.1280165, -0.3033381, 1.807191, 0, 0.5686275, 1, 1,
0.1353754, -0.4370669, 4.578751, 0, 0.5607843, 1, 1,
0.1389863, -1.709962, 0.9472286, 0, 0.5568628, 1, 1,
0.1399375, -0.3882744, 3.16843, 0, 0.5490196, 1, 1,
0.1416715, 1.178376, 0.4423956, 0, 0.5450981, 1, 1,
0.143508, -0.2001278, 4.049191, 0, 0.5372549, 1, 1,
0.1633726, 2.692664, -0.7482548, 0, 0.5333334, 1, 1,
0.1643661, 0.3098803, 1.29061, 0, 0.5254902, 1, 1,
0.1672457, -1.006698, 4.256104, 0, 0.5215687, 1, 1,
0.1698385, 0.1598311, 0.8000088, 0, 0.5137255, 1, 1,
0.1742214, 0.5234267, 0.2214259, 0, 0.509804, 1, 1,
0.1807399, 2.059631, -0.5973629, 0, 0.5019608, 1, 1,
0.1885129, -1.307665, 3.513526, 0, 0.4941176, 1, 1,
0.1899826, -0.1400522, 2.35302, 0, 0.4901961, 1, 1,
0.1924012, -0.1917706, 2.896358, 0, 0.4823529, 1, 1,
0.1960509, -0.5542243, 4.710248, 0, 0.4784314, 1, 1,
0.1965925, 0.02236744, 1.949548, 0, 0.4705882, 1, 1,
0.2009784, -2.110167, 3.372152, 0, 0.4666667, 1, 1,
0.2035922, 0.7708104, -0.1759478, 0, 0.4588235, 1, 1,
0.2037773, 0.9037082, 0.2046282, 0, 0.454902, 1, 1,
0.2058338, -1.094929, 2.933315, 0, 0.4470588, 1, 1,
0.2157696, -0.6587592, 3.089471, 0, 0.4431373, 1, 1,
0.2229667, -0.3240775, 2.765849, 0, 0.4352941, 1, 1,
0.228474, 1.677693, 0.3582078, 0, 0.4313726, 1, 1,
0.2316777, 0.3322108, 1.652182, 0, 0.4235294, 1, 1,
0.2318275, 1.889401, 0.7779644, 0, 0.4196078, 1, 1,
0.2355613, 1.517828, 1.405506, 0, 0.4117647, 1, 1,
0.2366568, 1.776183, -0.1589656, 0, 0.4078431, 1, 1,
0.2372966, 0.562589, 0.7095993, 0, 0.4, 1, 1,
0.2381912, -0.08142217, 2.581901, 0, 0.3921569, 1, 1,
0.2388684, -1.964758, 1.96327, 0, 0.3882353, 1, 1,
0.2483632, -1.064867, 3.352712, 0, 0.3803922, 1, 1,
0.2494132, 0.4179181, -0.4246852, 0, 0.3764706, 1, 1,
0.2499353, 0.1209325, 1.763494, 0, 0.3686275, 1, 1,
0.2508608, -1.231203, 3.303964, 0, 0.3647059, 1, 1,
0.2512538, 0.9262327, 0.9114692, 0, 0.3568628, 1, 1,
0.2557131, -0.07203297, 3.551115, 0, 0.3529412, 1, 1,
0.2557448, 0.7667417, -1.159414, 0, 0.345098, 1, 1,
0.2671123, -0.4887361, 2.313565, 0, 0.3411765, 1, 1,
0.2723225, 0.4696225, 1.43125, 0, 0.3333333, 1, 1,
0.2724469, -0.6062648, 0.05835, 0, 0.3294118, 1, 1,
0.2737456, -1.290859, 1.393708, 0, 0.3215686, 1, 1,
0.2747461, -0.4802467, 2.675217, 0, 0.3176471, 1, 1,
0.2749309, -2.377992, 2.777788, 0, 0.3098039, 1, 1,
0.2813241, -0.6421632, 3.96761, 0, 0.3058824, 1, 1,
0.2823094, 1.526045, 1.221943, 0, 0.2980392, 1, 1,
0.2855653, 1.222461, 0.1003443, 0, 0.2901961, 1, 1,
0.2862628, 0.5100112, 1.194156, 0, 0.2862745, 1, 1,
0.2878637, -0.1293475, 1.597129, 0, 0.2784314, 1, 1,
0.2952562, 1.384589, 1.375051, 0, 0.2745098, 1, 1,
0.2961406, 1.411182, -0.5217286, 0, 0.2666667, 1, 1,
0.2981595, -0.3924525, 4.704099, 0, 0.2627451, 1, 1,
0.3009086, -2.155881, 0.9714906, 0, 0.254902, 1, 1,
0.3012907, 0.2856809, 0.9740486, 0, 0.2509804, 1, 1,
0.3031083, 0.4389324, 0.3132311, 0, 0.2431373, 1, 1,
0.3047831, 0.3590819, 1.122763, 0, 0.2392157, 1, 1,
0.3051697, -0.4967795, 1.982098, 0, 0.2313726, 1, 1,
0.3080202, -1.363627, 1.365164, 0, 0.227451, 1, 1,
0.3082975, -0.9021978, 3.484818, 0, 0.2196078, 1, 1,
0.3087804, 0.3059293, 0.7301392, 0, 0.2156863, 1, 1,
0.3102763, 1.18368, 1.28359, 0, 0.2078431, 1, 1,
0.3106207, 1.106335, -0.2640527, 0, 0.2039216, 1, 1,
0.3122506, 0.1435806, 1.858772, 0, 0.1960784, 1, 1,
0.3213219, 0.7854538, 0.5428373, 0, 0.1882353, 1, 1,
0.3247029, 0.7252415, 1.380816, 0, 0.1843137, 1, 1,
0.326145, 1.511205, -0.7057044, 0, 0.1764706, 1, 1,
0.3266167, 0.4903812, 2.942743, 0, 0.172549, 1, 1,
0.327056, -1.312494, 2.181724, 0, 0.1647059, 1, 1,
0.3273766, -1.177999, 0.1929191, 0, 0.1607843, 1, 1,
0.3319505, 0.1480417, -0.6501492, 0, 0.1529412, 1, 1,
0.3337417, 1.891183, 0.1448351, 0, 0.1490196, 1, 1,
0.3354654, -0.9271547, 2.944136, 0, 0.1411765, 1, 1,
0.3398879, 0.0528275, 1.656802, 0, 0.1372549, 1, 1,
0.3409661, 1.738594, 1.123959, 0, 0.1294118, 1, 1,
0.3442129, -0.06051736, 3.120173, 0, 0.1254902, 1, 1,
0.3446414, -0.2442369, 3.383905, 0, 0.1176471, 1, 1,
0.3462605, -0.468391, 0.5689948, 0, 0.1137255, 1, 1,
0.3528745, 1.552194, -0.8804922, 0, 0.1058824, 1, 1,
0.3550458, 0.4233819, 0.4051898, 0, 0.09803922, 1, 1,
0.3557077, -0.1478536, 1.961982, 0, 0.09411765, 1, 1,
0.3559701, -0.1409695, 3.24783, 0, 0.08627451, 1, 1,
0.3580481, -0.02669485, -0.3867423, 0, 0.08235294, 1, 1,
0.3586684, -0.441773, 3.291435, 0, 0.07450981, 1, 1,
0.36213, 0.09932747, 1.637311, 0, 0.07058824, 1, 1,
0.3634913, -0.1465302, 0.03649744, 0, 0.0627451, 1, 1,
0.3666024, 1.070338, 0.6954274, 0, 0.05882353, 1, 1,
0.3723944, 2.147573, 1.681197, 0, 0.05098039, 1, 1,
0.3733324, 0.06110502, 0.3928603, 0, 0.04705882, 1, 1,
0.3853826, -0.2219762, 2.326221, 0, 0.03921569, 1, 1,
0.3878266, -0.7852085, 2.662306, 0, 0.03529412, 1, 1,
0.388836, 0.4354607, 0.7380071, 0, 0.02745098, 1, 1,
0.3929771, -1.020431, 3.142507, 0, 0.02352941, 1, 1,
0.39494, 0.1393482, 0.4703957, 0, 0.01568628, 1, 1,
0.3963243, -0.1737298, 2.16671, 0, 0.01176471, 1, 1,
0.4019606, -2.099212, 4.315397, 0, 0.003921569, 1, 1,
0.403427, -0.3057017, 2.434325, 0.003921569, 0, 1, 1,
0.4052407, 0.5952207, 2.13285, 0.007843138, 0, 1, 1,
0.4093136, 2.048195, 0.1979278, 0.01568628, 0, 1, 1,
0.413516, -0.538128, 2.26827, 0.01960784, 0, 1, 1,
0.4189372, 0.4860293, 0.5411664, 0.02745098, 0, 1, 1,
0.4207735, -1.772768, 2.870108, 0.03137255, 0, 1, 1,
0.4210726, 0.3878636, 1.74488, 0.03921569, 0, 1, 1,
0.4244447, 0.5967452, 0.9463347, 0.04313726, 0, 1, 1,
0.4280565, 0.1984932, 2.069076, 0.05098039, 0, 1, 1,
0.4287636, 0.2433318, 1.160423, 0.05490196, 0, 1, 1,
0.4287963, -0.2992048, 2.286401, 0.0627451, 0, 1, 1,
0.4295793, -1.141498, 1.60117, 0.06666667, 0, 1, 1,
0.4325139, -1.557996, 2.881038, 0.07450981, 0, 1, 1,
0.4339679, -0.6561843, 3.048529, 0.07843138, 0, 1, 1,
0.4350722, -0.788684, 3.327387, 0.08627451, 0, 1, 1,
0.4371102, -0.4468019, 2.183371, 0.09019608, 0, 1, 1,
0.4371229, -1.993289, 2.349573, 0.09803922, 0, 1, 1,
0.4385201, 0.7472525, 1.752947, 0.1058824, 0, 1, 1,
0.4402876, 1.573345, 0.4591237, 0.1098039, 0, 1, 1,
0.44052, -0.4460955, 1.720857, 0.1176471, 0, 1, 1,
0.4407803, -1.309867, 2.055612, 0.1215686, 0, 1, 1,
0.4407934, -0.5807053, 0.2487945, 0.1294118, 0, 1, 1,
0.4415038, -0.2310556, 2.978963, 0.1333333, 0, 1, 1,
0.442626, 0.4415997, 1.362496, 0.1411765, 0, 1, 1,
0.4483885, -0.5060882, 3.68416, 0.145098, 0, 1, 1,
0.4504836, 1.00373, 0.3910845, 0.1529412, 0, 1, 1,
0.4570556, 0.1561376, 1.042209, 0.1568628, 0, 1, 1,
0.4619183, 0.1190639, 0.1425393, 0.1647059, 0, 1, 1,
0.4661461, -0.7112916, 2.67731, 0.1686275, 0, 1, 1,
0.4684209, 0.1281386, -0.7579577, 0.1764706, 0, 1, 1,
0.4734539, -1.040054, 1.662857, 0.1803922, 0, 1, 1,
0.4759632, 0.9025204, 0.365454, 0.1882353, 0, 1, 1,
0.4767282, 0.5588419, -0.006625354, 0.1921569, 0, 1, 1,
0.4785932, 0.1055989, 2.363521, 0.2, 0, 1, 1,
0.4831617, -1.497699, 1.976785, 0.2078431, 0, 1, 1,
0.4854625, -0.8599073, 2.777244, 0.2117647, 0, 1, 1,
0.4880161, 0.5019585, 0.256164, 0.2196078, 0, 1, 1,
0.4880422, 0.1674119, 1.696503, 0.2235294, 0, 1, 1,
0.4915146, 0.6551803, -0.08089777, 0.2313726, 0, 1, 1,
0.4921409, -0.7215394, 3.129188, 0.2352941, 0, 1, 1,
0.4942701, -0.1127476, 2.594308, 0.2431373, 0, 1, 1,
0.4967469, 1.073283, 0.6342668, 0.2470588, 0, 1, 1,
0.4967889, -1.637122, 2.521435, 0.254902, 0, 1, 1,
0.5004203, 0.7884628, 0.6820056, 0.2588235, 0, 1, 1,
0.5024137, -0.3465865, 3.4344, 0.2666667, 0, 1, 1,
0.5038339, 0.8571553, -1.671005, 0.2705882, 0, 1, 1,
0.5070153, 0.1388887, 3.23283, 0.2784314, 0, 1, 1,
0.5070496, 0.3469266, -0.1672283, 0.282353, 0, 1, 1,
0.5087976, -0.7225937, 2.102211, 0.2901961, 0, 1, 1,
0.5088958, 0.8104002, 0.774211, 0.2941177, 0, 1, 1,
0.5129116, -0.4330514, 1.344545, 0.3019608, 0, 1, 1,
0.5152295, 0.3607503, 0.01326756, 0.3098039, 0, 1, 1,
0.5175132, -0.02233486, 1.59302, 0.3137255, 0, 1, 1,
0.5205727, 0.2755184, 1.314556, 0.3215686, 0, 1, 1,
0.5350006, -1.272675, 4.456073, 0.3254902, 0, 1, 1,
0.540202, -2.099443, 4.8513, 0.3333333, 0, 1, 1,
0.543014, -1.51088, 3.88391, 0.3372549, 0, 1, 1,
0.5488425, -0.9770374, 1.93427, 0.345098, 0, 1, 1,
0.5489447, 0.8517687, 1.232389, 0.3490196, 0, 1, 1,
0.5496536, -0.6535359, 1.491549, 0.3568628, 0, 1, 1,
0.5508671, 0.9174398, -0.3638898, 0.3607843, 0, 1, 1,
0.5514553, 0.2843694, 1.380523, 0.3686275, 0, 1, 1,
0.5515832, -0.2466143, 2.359832, 0.372549, 0, 1, 1,
0.5523723, -0.2582743, 0.2626416, 0.3803922, 0, 1, 1,
0.5591378, 2.942379, -0.7112435, 0.3843137, 0, 1, 1,
0.5605567, -0.6348623, 2.145948, 0.3921569, 0, 1, 1,
0.5605806, 0.5310469, 0.1433136, 0.3960784, 0, 1, 1,
0.5639715, 0.5267411, 0.6868719, 0.4039216, 0, 1, 1,
0.5647398, -0.4578618, -0.1608005, 0.4117647, 0, 1, 1,
0.5661613, -2.021155, 2.212449, 0.4156863, 0, 1, 1,
0.5677066, -2.046912, 2.71284, 0.4235294, 0, 1, 1,
0.5682912, -1.476435, 2.993652, 0.427451, 0, 1, 1,
0.569463, 0.8878191, -0.5130373, 0.4352941, 0, 1, 1,
0.5708543, -1.854057, 2.04526, 0.4392157, 0, 1, 1,
0.5728655, 0.5552989, -1.318381, 0.4470588, 0, 1, 1,
0.5741644, 0.4401025, 1.926418, 0.4509804, 0, 1, 1,
0.5761954, -0.2874885, 3.565889, 0.4588235, 0, 1, 1,
0.5819209, -1.009902, 2.217759, 0.4627451, 0, 1, 1,
0.5845797, 0.02533397, 0.7859341, 0.4705882, 0, 1, 1,
0.5846214, 0.0045614, 0.5546248, 0.4745098, 0, 1, 1,
0.5860748, 0.6675622, 1.847556, 0.4823529, 0, 1, 1,
0.588852, -1.247209, 3.259015, 0.4862745, 0, 1, 1,
0.6050275, -0.8638833, 3.539431, 0.4941176, 0, 1, 1,
0.6054239, 1.131524, -0.370796, 0.5019608, 0, 1, 1,
0.6111037, -1.543092, 1.321295, 0.5058824, 0, 1, 1,
0.6129732, 1.388165, -0.8731154, 0.5137255, 0, 1, 1,
0.6155703, 0.9835002, 2.164151, 0.5176471, 0, 1, 1,
0.6196656, 0.5171577, 2.755221, 0.5254902, 0, 1, 1,
0.6197531, 0.05415604, 0.9935386, 0.5294118, 0, 1, 1,
0.6201012, 0.8290982, 0.2341094, 0.5372549, 0, 1, 1,
0.6255037, -0.01662556, 0.9542992, 0.5411765, 0, 1, 1,
0.6306147, -1.638419, 2.972538, 0.5490196, 0, 1, 1,
0.6315413, -1.924222, 0.9952762, 0.5529412, 0, 1, 1,
0.6370113, 2.227684, -0.6892353, 0.5607843, 0, 1, 1,
0.6383039, -2.365259, 1.788029, 0.5647059, 0, 1, 1,
0.6424265, -1.161418, 2.381627, 0.572549, 0, 1, 1,
0.6439796, -0.3817115, 2.442399, 0.5764706, 0, 1, 1,
0.6453984, 1.080816, 0.9533888, 0.5843138, 0, 1, 1,
0.6477138, 0.6493567, 1.051011, 0.5882353, 0, 1, 1,
0.6500575, 1.686039, 0.2739802, 0.5960785, 0, 1, 1,
0.6517102, -0.3855748, 2.978752, 0.6039216, 0, 1, 1,
0.6554939, 1.205401, 0.6544003, 0.6078432, 0, 1, 1,
0.6578131, -0.2278094, 0.2398436, 0.6156863, 0, 1, 1,
0.6580368, -0.8866952, 3.075116, 0.6196079, 0, 1, 1,
0.6665986, 0.5549114, 1.021783, 0.627451, 0, 1, 1,
0.6698626, 0.03972951, 3.075499, 0.6313726, 0, 1, 1,
0.6712666, 0.8014935, 0.8851185, 0.6392157, 0, 1, 1,
0.6713512, -0.02615113, 2.276197, 0.6431373, 0, 1, 1,
0.6717974, -0.2457528, 2.730483, 0.6509804, 0, 1, 1,
0.6750144, -0.4183262, 3.311627, 0.654902, 0, 1, 1,
0.6770481, 0.007601617, 0.2311196, 0.6627451, 0, 1, 1,
0.6840001, -1.1359, 2.724748, 0.6666667, 0, 1, 1,
0.68549, 0.3618515, 1.652914, 0.6745098, 0, 1, 1,
0.6887434, -0.9906346, 0.04651527, 0.6784314, 0, 1, 1,
0.6899529, -0.9438497, 0.785871, 0.6862745, 0, 1, 1,
0.6902771, -0.4616945, 2.619201, 0.6901961, 0, 1, 1,
0.6924154, -0.7004539, 1.407226, 0.6980392, 0, 1, 1,
0.694632, 0.3872261, 0.355162, 0.7058824, 0, 1, 1,
0.6947247, 3.010293, 0.5561414, 0.7098039, 0, 1, 1,
0.6954417, 1.95153, -0.6979632, 0.7176471, 0, 1, 1,
0.6974261, -0.2341135, 0.1483232, 0.7215686, 0, 1, 1,
0.6984432, -0.5150613, 2.966267, 0.7294118, 0, 1, 1,
0.6984717, 0.01632359, 2.897349, 0.7333333, 0, 1, 1,
0.7036923, -1.884143, 1.172981, 0.7411765, 0, 1, 1,
0.7175587, -0.7120115, 3.151103, 0.7450981, 0, 1, 1,
0.7196724, 1.075639, 0.7239434, 0.7529412, 0, 1, 1,
0.7226614, -0.8953405, 2.497405, 0.7568628, 0, 1, 1,
0.7252942, 1.125806, 0.1037847, 0.7647059, 0, 1, 1,
0.7255746, 1.326785, 0.02291705, 0.7686275, 0, 1, 1,
0.7285972, -0.03024889, 2.600259, 0.7764706, 0, 1, 1,
0.7320331, -2.419423, 2.554171, 0.7803922, 0, 1, 1,
0.7336588, -0.08573635, 2.620399, 0.7882353, 0, 1, 1,
0.7342696, -1.994286, 3.174073, 0.7921569, 0, 1, 1,
0.7344307, 0.6360992, -0.2895631, 0.8, 0, 1, 1,
0.7406959, -0.02016827, 0.2517497, 0.8078431, 0, 1, 1,
0.7420675, 0.09682086, 1.687704, 0.8117647, 0, 1, 1,
0.7434797, 0.7828681, -1.219635, 0.8196079, 0, 1, 1,
0.7467413, -0.208693, 1.979583, 0.8235294, 0, 1, 1,
0.7474388, -0.2076119, 2.773793, 0.8313726, 0, 1, 1,
0.7524782, -1.559188, 1.943751, 0.8352941, 0, 1, 1,
0.7635634, 0.2677222, 0.920513, 0.8431373, 0, 1, 1,
0.7656084, 0.5817896, 1.876217, 0.8470588, 0, 1, 1,
0.7696989, 0.8835558, 1.694301, 0.854902, 0, 1, 1,
0.7734288, 0.05848997, 2.071029, 0.8588235, 0, 1, 1,
0.7754472, 1.032193, 1.238474, 0.8666667, 0, 1, 1,
0.7788932, -0.5427164, 1.646451, 0.8705882, 0, 1, 1,
0.7790198, 0.848621, 2.151268, 0.8784314, 0, 1, 1,
0.7795573, 0.7146876, -0.07112847, 0.8823529, 0, 1, 1,
0.7820063, -0.4491943, 2.762841, 0.8901961, 0, 1, 1,
0.7826072, -0.7151355, 2.631487, 0.8941177, 0, 1, 1,
0.7865148, -0.003088422, 2.677563, 0.9019608, 0, 1, 1,
0.7904177, 0.375494, 2.026514, 0.9098039, 0, 1, 1,
0.7918422, -0.9101831, 2.52076, 0.9137255, 0, 1, 1,
0.7947922, 0.02079273, 1.857219, 0.9215686, 0, 1, 1,
0.8013726, -1.257541, 1.958435, 0.9254902, 0, 1, 1,
0.8027174, -1.371131, 2.349002, 0.9333333, 0, 1, 1,
0.8039395, -0.2854884, 2.993536, 0.9372549, 0, 1, 1,
0.807415, -0.2397923, 2.721481, 0.945098, 0, 1, 1,
0.8119929, -1.660076, 1.617571, 0.9490196, 0, 1, 1,
0.8161455, 1.90045, -0.4033412, 0.9568627, 0, 1, 1,
0.8199723, 0.3342986, 1.050055, 0.9607843, 0, 1, 1,
0.826781, -0.8726011, 1.994121, 0.9686275, 0, 1, 1,
0.826795, 0.3023944, 1.279085, 0.972549, 0, 1, 1,
0.8274618, -0.6303304, -0.1033003, 0.9803922, 0, 1, 1,
0.8315507, -0.5054483, 1.026378, 0.9843137, 0, 1, 1,
0.8325763, 1.894882, 0.7726122, 0.9921569, 0, 1, 1,
0.8361406, -0.09747832, 3.427798, 0.9960784, 0, 1, 1,
0.8423243, -0.8322636, 2.584216, 1, 0, 0.9960784, 1,
0.8563973, -0.3670557, 2.252609, 1, 0, 0.9882353, 1,
0.8681076, -1.20885, 2.879465, 1, 0, 0.9843137, 1,
0.8702229, -0.571677, 0.5293993, 1, 0, 0.9764706, 1,
0.870347, -1.082505, 2.863565, 1, 0, 0.972549, 1,
0.8731536, -0.2521349, 1.995424, 1, 0, 0.9647059, 1,
0.8761512, -0.02397085, 1.327617, 1, 0, 0.9607843, 1,
0.8773562, -0.9834592, 2.451555, 1, 0, 0.9529412, 1,
0.8777085, -0.6129751, 2.25726, 1, 0, 0.9490196, 1,
0.8801849, -1.185794, 3.253158, 1, 0, 0.9411765, 1,
0.8828394, -1.122385, 2.079334, 1, 0, 0.9372549, 1,
0.8926474, 0.1646517, 0.5305187, 1, 0, 0.9294118, 1,
0.9070673, -1.329762, 1.450112, 1, 0, 0.9254902, 1,
0.9131789, -0.1597834, 2.954312, 1, 0, 0.9176471, 1,
0.9155525, 0.3536605, 2.274688, 1, 0, 0.9137255, 1,
0.9253266, 1.584139, -1.922933, 1, 0, 0.9058824, 1,
0.9270636, 0.9577479, -1.987716, 1, 0, 0.9019608, 1,
0.9292963, -0.03846495, 2.244261, 1, 0, 0.8941177, 1,
0.9385908, 0.8886026, -0.2888529, 1, 0, 0.8862745, 1,
0.9386572, -0.1623954, 2.601231, 1, 0, 0.8823529, 1,
0.9434916, 0.1502228, 0.8278556, 1, 0, 0.8745098, 1,
0.9443822, 0.4721299, 2.058951, 1, 0, 0.8705882, 1,
0.9449803, -0.08143912, 0.4258629, 1, 0, 0.8627451, 1,
0.9455876, 0.5348029, -0.4525034, 1, 0, 0.8588235, 1,
0.9461983, -1.383417, 3.310189, 1, 0, 0.8509804, 1,
0.9496573, 0.2663316, 1.091831, 1, 0, 0.8470588, 1,
0.9547819, 0.7302338, -0.290365, 1, 0, 0.8392157, 1,
0.9626031, -0.05554728, 0.7270171, 1, 0, 0.8352941, 1,
0.9663765, -0.3263382, 3.6006, 1, 0, 0.827451, 1,
0.9727682, -0.8589926, 1.376822, 1, 0, 0.8235294, 1,
0.9779227, 1.846016, 1.023156, 1, 0, 0.8156863, 1,
0.9919663, 0.02469167, 3.558113, 1, 0, 0.8117647, 1,
1.000909, 0.0277215, 1.54644, 1, 0, 0.8039216, 1,
1.007989, 0.5251514, 2.620234, 1, 0, 0.7960784, 1,
1.010453, 0.84243, -0.6003591, 1, 0, 0.7921569, 1,
1.01792, -0.02441064, 1.490064, 1, 0, 0.7843137, 1,
1.022452, 0.7214092, 0.02986434, 1, 0, 0.7803922, 1,
1.036077, 0.597241, 1.206042, 1, 0, 0.772549, 1,
1.038251, 1.104964, -0.2197368, 1, 0, 0.7686275, 1,
1.038443, -0.7926041, 2.581347, 1, 0, 0.7607843, 1,
1.042024, -0.6516259, 2.757816, 1, 0, 0.7568628, 1,
1.043835, 0.3153693, 1.933217, 1, 0, 0.7490196, 1,
1.045974, -0.2170096, 0.344898, 1, 0, 0.7450981, 1,
1.061284, 0.776845, 0.4672701, 1, 0, 0.7372549, 1,
1.062978, -0.3490476, 2.90916, 1, 0, 0.7333333, 1,
1.064489, 0.7882402, 1.129632, 1, 0, 0.7254902, 1,
1.065826, -1.628091, 2.789826, 1, 0, 0.7215686, 1,
1.072494, 0.207525, -0.6399228, 1, 0, 0.7137255, 1,
1.072981, 1.359813, -0.2323878, 1, 0, 0.7098039, 1,
1.091792, -0.6440267, 1.964033, 1, 0, 0.7019608, 1,
1.093259, 3.094125, -0.8799155, 1, 0, 0.6941177, 1,
1.098236, -1.851871, 3.183537, 1, 0, 0.6901961, 1,
1.102503, -0.1161683, 3.635307, 1, 0, 0.682353, 1,
1.112265, -0.7955306, 1.963109, 1, 0, 0.6784314, 1,
1.120562, -0.272078, 1.101591, 1, 0, 0.6705883, 1,
1.122514, -0.02997927, 1.114618, 1, 0, 0.6666667, 1,
1.128693, -0.2681903, 1.622904, 1, 0, 0.6588235, 1,
1.132849, 0.2250228, 0.4659109, 1, 0, 0.654902, 1,
1.133381, -0.8462157, 0.8346435, 1, 0, 0.6470588, 1,
1.134828, -0.1156037, 1.713544, 1, 0, 0.6431373, 1,
1.139176, 0.02823219, 2.974741, 1, 0, 0.6352941, 1,
1.15408, 1.723257, -1.722267, 1, 0, 0.6313726, 1,
1.15439, -1.194412, 2.922501, 1, 0, 0.6235294, 1,
1.175361, 0.2638828, 0.5533838, 1, 0, 0.6196079, 1,
1.183398, 1.850265, 0.6823643, 1, 0, 0.6117647, 1,
1.187838, -0.4755277, 1.928602, 1, 0, 0.6078432, 1,
1.195535, -1.009249, 2.357694, 1, 0, 0.6, 1,
1.200247, -1.638034, 2.183729, 1, 0, 0.5921569, 1,
1.211816, 1.062277, 1.341224, 1, 0, 0.5882353, 1,
1.214412, -0.5249487, 2.498089, 1, 0, 0.5803922, 1,
1.217081, 0.5688958, 1.659712, 1, 0, 0.5764706, 1,
1.218598, -1.447074, 2.464358, 1, 0, 0.5686275, 1,
1.235201, -0.6018659, 3.634882, 1, 0, 0.5647059, 1,
1.237619, 0.9961702, 0.7924165, 1, 0, 0.5568628, 1,
1.238094, -1.174354, 1.563216, 1, 0, 0.5529412, 1,
1.241812, -0.1104566, -0.02106964, 1, 0, 0.5450981, 1,
1.242183, 0.5437309, 2.160724, 1, 0, 0.5411765, 1,
1.244064, -3.386812, 1.572867, 1, 0, 0.5333334, 1,
1.255428, 0.4467947, 0.577718, 1, 0, 0.5294118, 1,
1.258463, -0.7233109, 2.372935, 1, 0, 0.5215687, 1,
1.264504, 1.875832, 0.9366993, 1, 0, 0.5176471, 1,
1.270962, 0.761632, 0.3289085, 1, 0, 0.509804, 1,
1.271964, 3.250901, 0.5062451, 1, 0, 0.5058824, 1,
1.291418, -0.4226772, 1.058043, 1, 0, 0.4980392, 1,
1.29534, -0.9661877, 2.118923, 1, 0, 0.4901961, 1,
1.295984, 0.614468, 1.260441, 1, 0, 0.4862745, 1,
1.299333, -1.086358, 2.592336, 1, 0, 0.4784314, 1,
1.301273, 0.1163268, 0.7934231, 1, 0, 0.4745098, 1,
1.304096, -0.2427005, 2.071275, 1, 0, 0.4666667, 1,
1.306449, -0.2184917, 1.772309, 1, 0, 0.4627451, 1,
1.312507, -2.393357, 3.582016, 1, 0, 0.454902, 1,
1.324602, -1.149032, 3.000918, 1, 0, 0.4509804, 1,
1.332534, 1.96197, 1.943131, 1, 0, 0.4431373, 1,
1.355531, 2.521372, -0.3252857, 1, 0, 0.4392157, 1,
1.363912, -0.2158872, 1.951428, 1, 0, 0.4313726, 1,
1.376963, -1.088862, 2.060391, 1, 0, 0.427451, 1,
1.385063, -0.9056197, 2.102537, 1, 0, 0.4196078, 1,
1.395277, -0.7667446, 4.151268, 1, 0, 0.4156863, 1,
1.398042, -0.3151085, 2.435429, 1, 0, 0.4078431, 1,
1.428932, -1.699471, 2.011669, 1, 0, 0.4039216, 1,
1.44187, 0.3444162, 3.062108, 1, 0, 0.3960784, 1,
1.452334, -0.5357492, 1.80002, 1, 0, 0.3882353, 1,
1.468087, 1.319277, 0.4809614, 1, 0, 0.3843137, 1,
1.473344, 1.291924, 0.6714651, 1, 0, 0.3764706, 1,
1.484071, -1.701207, 3.599229, 1, 0, 0.372549, 1,
1.504231, 2.288113, -1.533581, 1, 0, 0.3647059, 1,
1.520762, 0.6119037, 2.034212, 1, 0, 0.3607843, 1,
1.533734, -0.5916805, 0.754639, 1, 0, 0.3529412, 1,
1.533941, 2.115293, 1.084663, 1, 0, 0.3490196, 1,
1.542872, -1.413852, 3.060142, 1, 0, 0.3411765, 1,
1.544165, -0.2399829, -0.06603548, 1, 0, 0.3372549, 1,
1.553307, -0.555218, 3.359251, 1, 0, 0.3294118, 1,
1.577103, -1.703697, 1.872862, 1, 0, 0.3254902, 1,
1.584006, -0.1267107, 1.709388, 1, 0, 0.3176471, 1,
1.599498, -0.9859593, 1.479841, 1, 0, 0.3137255, 1,
1.602295, 0.5454826, 1.664024, 1, 0, 0.3058824, 1,
1.604945, 0.1155975, 2.109751, 1, 0, 0.2980392, 1,
1.60576, -0.2670433, 1.226172, 1, 0, 0.2941177, 1,
1.608847, -0.06126168, 0.5528859, 1, 0, 0.2862745, 1,
1.62192, 0.3131883, 0.7163985, 1, 0, 0.282353, 1,
1.6298, 0.3305694, 2.037885, 1, 0, 0.2745098, 1,
1.636402, 1.105686, 1.65395, 1, 0, 0.2705882, 1,
1.673912, -0.8677883, 1.267986, 1, 0, 0.2627451, 1,
1.680336, 0.6770689, 2.534247, 1, 0, 0.2588235, 1,
1.72166, 1.094878, 0.632479, 1, 0, 0.2509804, 1,
1.731432, 0.6403271, 1.009771, 1, 0, 0.2470588, 1,
1.735853, 1.557312, 0.4770448, 1, 0, 0.2392157, 1,
1.737823, -0.2514189, 1.320521, 1, 0, 0.2352941, 1,
1.743153, 0.1781417, 2.569528, 1, 0, 0.227451, 1,
1.782472, 0.1681286, 1.289956, 1, 0, 0.2235294, 1,
1.787301, 0.5749107, 2.305305, 1, 0, 0.2156863, 1,
1.787895, 1.42013, 0.2773497, 1, 0, 0.2117647, 1,
1.80055, 1.489388, 0.5920279, 1, 0, 0.2039216, 1,
1.847653, 0.165832, 1.909138, 1, 0, 0.1960784, 1,
1.850456, 0.326531, 1.10132, 1, 0, 0.1921569, 1,
1.859291, -0.4294267, 2.429167, 1, 0, 0.1843137, 1,
1.868617, 0.3068143, 3.824179, 1, 0, 0.1803922, 1,
1.887957, 1.24631, -0.2415407, 1, 0, 0.172549, 1,
1.917874, 2.224711, 1.937814, 1, 0, 0.1686275, 1,
1.950438, -0.1496632, 1.0978, 1, 0, 0.1607843, 1,
1.953734, -0.6021333, 0.2855067, 1, 0, 0.1568628, 1,
1.977269, -1.54596, 1.460664, 1, 0, 0.1490196, 1,
2.006027, 0.8709847, 0.5836015, 1, 0, 0.145098, 1,
2.023046, -1.728415, 3.185941, 1, 0, 0.1372549, 1,
2.057035, 0.6178736, 0.2995306, 1, 0, 0.1333333, 1,
2.063729, -0.2668628, 2.335512, 1, 0, 0.1254902, 1,
2.08806, 0.9725022, 0.1266398, 1, 0, 0.1215686, 1,
2.095228, -0.5855799, 1.739582, 1, 0, 0.1137255, 1,
2.124639, 0.8040156, 1.266279, 1, 0, 0.1098039, 1,
2.150628, 0.2946439, 0.5143484, 1, 0, 0.1019608, 1,
2.17823, -1.117322, 3.251333, 1, 0, 0.09411765, 1,
2.265352, 0.6760227, 2.653118, 1, 0, 0.09019608, 1,
2.314076, 1.033884, 1.451888, 1, 0, 0.08235294, 1,
2.328282, 1.981275, 3.157812, 1, 0, 0.07843138, 1,
2.371026, 1.885239, 0.1612948, 1, 0, 0.07058824, 1,
2.395551, 2.214854, 0.8766668, 1, 0, 0.06666667, 1,
2.421436, 0.08331846, 2.912603, 1, 0, 0.05882353, 1,
2.457064, -1.37174, 1.761823, 1, 0, 0.05490196, 1,
2.470236, 1.35149, -1.800579, 1, 0, 0.04705882, 1,
2.475877, -1.184232, 1.081525, 1, 0, 0.04313726, 1,
2.684496, 1.353153, 1.735823, 1, 0, 0.03529412, 1,
2.767553, 0.6688757, 1.317888, 1, 0, 0.03137255, 1,
2.775404, 0.2228023, 1.079511, 1, 0, 0.02352941, 1,
2.803359, -0.4277791, 2.574843, 1, 0, 0.01960784, 1,
3.014779, -0.1832707, 2.35339, 1, 0, 0.01176471, 1,
3.22472, 0.6803151, 1.731417, 1, 0, 0.007843138, 1
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
-0.03837097, -4.511904, -7.231665, 0, -0.5, 0.5, 0.5,
-0.03837097, -4.511904, -7.231665, 1, -0.5, 0.5, 0.5,
-0.03837097, -4.511904, -7.231665, 1, 1.5, 0.5, 0.5,
-0.03837097, -4.511904, -7.231665, 0, 1.5, 0.5, 0.5
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
-4.40765, -0.06795549, -7.231665, 0, -0.5, 0.5, 0.5,
-4.40765, -0.06795549, -7.231665, 1, -0.5, 0.5, 0.5,
-4.40765, -0.06795549, -7.231665, 1, 1.5, 0.5, 0.5,
-4.40765, -0.06795549, -7.231665, 0, 1.5, 0.5, 0.5
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
-4.40765, -4.511904, 0.2845209, 0, -0.5, 0.5, 0.5,
-4.40765, -4.511904, 0.2845209, 1, -0.5, 0.5, 0.5,
-4.40765, -4.511904, 0.2845209, 1, 1.5, 0.5, 0.5,
-4.40765, -4.511904, 0.2845209, 0, 1.5, 0.5, 0.5
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
-3, -3.486377, -5.49716,
3, -3.486377, -5.49716,
-3, -3.486377, -5.49716,
-3, -3.657299, -5.786244,
-2, -3.486377, -5.49716,
-2, -3.657299, -5.786244,
-1, -3.486377, -5.49716,
-1, -3.657299, -5.786244,
0, -3.486377, -5.49716,
0, -3.657299, -5.786244,
1, -3.486377, -5.49716,
1, -3.657299, -5.786244,
2, -3.486377, -5.49716,
2, -3.657299, -5.786244,
3, -3.486377, -5.49716,
3, -3.657299, -5.786244
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
-3, -3.999141, -6.364413, 0, -0.5, 0.5, 0.5,
-3, -3.999141, -6.364413, 1, -0.5, 0.5, 0.5,
-3, -3.999141, -6.364413, 1, 1.5, 0.5, 0.5,
-3, -3.999141, -6.364413, 0, 1.5, 0.5, 0.5,
-2, -3.999141, -6.364413, 0, -0.5, 0.5, 0.5,
-2, -3.999141, -6.364413, 1, -0.5, 0.5, 0.5,
-2, -3.999141, -6.364413, 1, 1.5, 0.5, 0.5,
-2, -3.999141, -6.364413, 0, 1.5, 0.5, 0.5,
-1, -3.999141, -6.364413, 0, -0.5, 0.5, 0.5,
-1, -3.999141, -6.364413, 1, -0.5, 0.5, 0.5,
-1, -3.999141, -6.364413, 1, 1.5, 0.5, 0.5,
-1, -3.999141, -6.364413, 0, 1.5, 0.5, 0.5,
0, -3.999141, -6.364413, 0, -0.5, 0.5, 0.5,
0, -3.999141, -6.364413, 1, -0.5, 0.5, 0.5,
0, -3.999141, -6.364413, 1, 1.5, 0.5, 0.5,
0, -3.999141, -6.364413, 0, 1.5, 0.5, 0.5,
1, -3.999141, -6.364413, 0, -0.5, 0.5, 0.5,
1, -3.999141, -6.364413, 1, -0.5, 0.5, 0.5,
1, -3.999141, -6.364413, 1, 1.5, 0.5, 0.5,
1, -3.999141, -6.364413, 0, 1.5, 0.5, 0.5,
2, -3.999141, -6.364413, 0, -0.5, 0.5, 0.5,
2, -3.999141, -6.364413, 1, -0.5, 0.5, 0.5,
2, -3.999141, -6.364413, 1, 1.5, 0.5, 0.5,
2, -3.999141, -6.364413, 0, 1.5, 0.5, 0.5,
3, -3.999141, -6.364413, 0, -0.5, 0.5, 0.5,
3, -3.999141, -6.364413, 1, -0.5, 0.5, 0.5,
3, -3.999141, -6.364413, 1, 1.5, 0.5, 0.5,
3, -3.999141, -6.364413, 0, 1.5, 0.5, 0.5
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
-3.399354, -3, -5.49716,
-3.399354, 3, -5.49716,
-3.399354, -3, -5.49716,
-3.567404, -3, -5.786244,
-3.399354, -2, -5.49716,
-3.567404, -2, -5.786244,
-3.399354, -1, -5.49716,
-3.567404, -1, -5.786244,
-3.399354, 0, -5.49716,
-3.567404, 0, -5.786244,
-3.399354, 1, -5.49716,
-3.567404, 1, -5.786244,
-3.399354, 2, -5.49716,
-3.567404, 2, -5.786244,
-3.399354, 3, -5.49716,
-3.567404, 3, -5.786244
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
-3.903502, -3, -6.364413, 0, -0.5, 0.5, 0.5,
-3.903502, -3, -6.364413, 1, -0.5, 0.5, 0.5,
-3.903502, -3, -6.364413, 1, 1.5, 0.5, 0.5,
-3.903502, -3, -6.364413, 0, 1.5, 0.5, 0.5,
-3.903502, -2, -6.364413, 0, -0.5, 0.5, 0.5,
-3.903502, -2, -6.364413, 1, -0.5, 0.5, 0.5,
-3.903502, -2, -6.364413, 1, 1.5, 0.5, 0.5,
-3.903502, -2, -6.364413, 0, 1.5, 0.5, 0.5,
-3.903502, -1, -6.364413, 0, -0.5, 0.5, 0.5,
-3.903502, -1, -6.364413, 1, -0.5, 0.5, 0.5,
-3.903502, -1, -6.364413, 1, 1.5, 0.5, 0.5,
-3.903502, -1, -6.364413, 0, 1.5, 0.5, 0.5,
-3.903502, 0, -6.364413, 0, -0.5, 0.5, 0.5,
-3.903502, 0, -6.364413, 1, -0.5, 0.5, 0.5,
-3.903502, 0, -6.364413, 1, 1.5, 0.5, 0.5,
-3.903502, 0, -6.364413, 0, 1.5, 0.5, 0.5,
-3.903502, 1, -6.364413, 0, -0.5, 0.5, 0.5,
-3.903502, 1, -6.364413, 1, -0.5, 0.5, 0.5,
-3.903502, 1, -6.364413, 1, 1.5, 0.5, 0.5,
-3.903502, 1, -6.364413, 0, 1.5, 0.5, 0.5,
-3.903502, 2, -6.364413, 0, -0.5, 0.5, 0.5,
-3.903502, 2, -6.364413, 1, -0.5, 0.5, 0.5,
-3.903502, 2, -6.364413, 1, 1.5, 0.5, 0.5,
-3.903502, 2, -6.364413, 0, 1.5, 0.5, 0.5,
-3.903502, 3, -6.364413, 0, -0.5, 0.5, 0.5,
-3.903502, 3, -6.364413, 1, -0.5, 0.5, 0.5,
-3.903502, 3, -6.364413, 1, 1.5, 0.5, 0.5,
-3.903502, 3, -6.364413, 0, 1.5, 0.5, 0.5
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
-3.399354, -3.486377, -4,
-3.399354, -3.486377, 4,
-3.399354, -3.486377, -4,
-3.567404, -3.657299, -4,
-3.399354, -3.486377, -2,
-3.567404, -3.657299, -2,
-3.399354, -3.486377, 0,
-3.567404, -3.657299, 0,
-3.399354, -3.486377, 2,
-3.567404, -3.657299, 2,
-3.399354, -3.486377, 4,
-3.567404, -3.657299, 4
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
-3.903502, -3.999141, -4, 0, -0.5, 0.5, 0.5,
-3.903502, -3.999141, -4, 1, -0.5, 0.5, 0.5,
-3.903502, -3.999141, -4, 1, 1.5, 0.5, 0.5,
-3.903502, -3.999141, -4, 0, 1.5, 0.5, 0.5,
-3.903502, -3.999141, -2, 0, -0.5, 0.5, 0.5,
-3.903502, -3.999141, -2, 1, -0.5, 0.5, 0.5,
-3.903502, -3.999141, -2, 1, 1.5, 0.5, 0.5,
-3.903502, -3.999141, -2, 0, 1.5, 0.5, 0.5,
-3.903502, -3.999141, 0, 0, -0.5, 0.5, 0.5,
-3.903502, -3.999141, 0, 1, -0.5, 0.5, 0.5,
-3.903502, -3.999141, 0, 1, 1.5, 0.5, 0.5,
-3.903502, -3.999141, 0, 0, 1.5, 0.5, 0.5,
-3.903502, -3.999141, 2, 0, -0.5, 0.5, 0.5,
-3.903502, -3.999141, 2, 1, -0.5, 0.5, 0.5,
-3.903502, -3.999141, 2, 1, 1.5, 0.5, 0.5,
-3.903502, -3.999141, 2, 0, 1.5, 0.5, 0.5,
-3.903502, -3.999141, 4, 0, -0.5, 0.5, 0.5,
-3.903502, -3.999141, 4, 1, -0.5, 0.5, 0.5,
-3.903502, -3.999141, 4, 1, 1.5, 0.5, 0.5,
-3.903502, -3.999141, 4, 0, 1.5, 0.5, 0.5
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
-3.399354, -3.486377, -5.49716,
-3.399354, 3.350466, -5.49716,
-3.399354, -3.486377, 6.066202,
-3.399354, 3.350466, 6.066202,
-3.399354, -3.486377, -5.49716,
-3.399354, -3.486377, 6.066202,
-3.399354, 3.350466, -5.49716,
-3.399354, 3.350466, 6.066202,
-3.399354, -3.486377, -5.49716,
3.322613, -3.486377, -5.49716,
-3.399354, -3.486377, 6.066202,
3.322613, -3.486377, 6.066202,
-3.399354, 3.350466, -5.49716,
3.322613, 3.350466, -5.49716,
-3.399354, 3.350466, 6.066202,
3.322613, 3.350466, 6.066202,
3.322613, -3.486377, -5.49716,
3.322613, 3.350466, -5.49716,
3.322613, -3.486377, 6.066202,
3.322613, 3.350466, 6.066202,
3.322613, -3.486377, -5.49716,
3.322613, -3.486377, 6.066202,
3.322613, 3.350466, -5.49716,
3.322613, 3.350466, 6.066202
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
var radius = 8.021068;
var distance = 35.68664;
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
mvMatrix.translate( 0.03837097, 0.06795549, -0.2845209 );
mvMatrix.scale( 1.290178, 1.2685, 0.7500012 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.68664);
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
sulprophos<-read.table("sulprophos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulprophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulprophos' not found
```

```r
y<-sulprophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulprophos' not found
```

```r
z<-sulprophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulprophos' not found
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
-3.301462, -1.622148, -1.452132, 0, 0, 1, 1, 1,
-2.680787, -0.1214707, -1.752746, 1, 0, 0, 1, 1,
-2.679638, -0.2132286, -2.528047, 1, 0, 0, 1, 1,
-2.442809, 1.866428, 0.7512985, 1, 0, 0, 1, 1,
-2.40228, -0.05464156, -2.542037, 1, 0, 0, 1, 1,
-2.382578, -0.4691294, -0.82988, 1, 0, 0, 1, 1,
-2.306754, 0.430252, -2.139987, 0, 0, 0, 1, 1,
-2.291746, 1.85509, 0.04842686, 0, 0, 0, 1, 1,
-2.28415, 0.3053449, -2.490307, 0, 0, 0, 1, 1,
-2.25714, 0.3647411, -0.8832108, 0, 0, 0, 1, 1,
-2.247645, -0.89916, -2.615607, 0, 0, 0, 1, 1,
-2.234814, -0.7509801, -1.344863, 0, 0, 0, 1, 1,
-2.214944, -2.616177, -1.492946, 0, 0, 0, 1, 1,
-2.197625, 1.767595, 0.4790997, 1, 1, 1, 1, 1,
-2.166668, -0.697708, -1.679496, 1, 1, 1, 1, 1,
-2.153862, 0.5945554, -0.02499759, 1, 1, 1, 1, 1,
-2.128881, -1.542091, -1.911546, 1, 1, 1, 1, 1,
-2.068179, -0.8889261, -3.283758, 1, 1, 1, 1, 1,
-2.06172, -1.160525, -1.74601, 1, 1, 1, 1, 1,
-2.041249, -0.5555249, -0.8390992, 1, 1, 1, 1, 1,
-2.040903, 0.4509266, -1.462037, 1, 1, 1, 1, 1,
-2.037088, -1.145071, -2.079706, 1, 1, 1, 1, 1,
-2.027438, 0.7630243, -0.3934798, 1, 1, 1, 1, 1,
-2.025594, 0.2556882, -2.136421, 1, 1, 1, 1, 1,
-1.989886, -1.071698, -1.401348, 1, 1, 1, 1, 1,
-1.986651, 1.856827, 0.4825228, 1, 1, 1, 1, 1,
-1.967375, -1.32154, -2.38337, 1, 1, 1, 1, 1,
-1.961574, -0.01528943, -2.073884, 1, 1, 1, 1, 1,
-1.944899, 1.408327, -1.746215, 0, 0, 1, 1, 1,
-1.943629, 0.4457411, -2.24297, 1, 0, 0, 1, 1,
-1.928327, -0.169086, -1.582772, 1, 0, 0, 1, 1,
-1.888657, -2.035559, -1.63494, 1, 0, 0, 1, 1,
-1.858563, -1.007202, -1.765198, 1, 0, 0, 1, 1,
-1.843347, -0.6233521, -1.310827, 1, 0, 0, 1, 1,
-1.839029, -0.05872153, -1.509385, 0, 0, 0, 1, 1,
-1.831753, 0.3026994, -0.9759682, 0, 0, 0, 1, 1,
-1.814333, 0.6034854, -1.636454, 0, 0, 0, 1, 1,
-1.795372, 1.344639, 0.409671, 0, 0, 0, 1, 1,
-1.791802, 1.212852, -0.5259833, 0, 0, 0, 1, 1,
-1.791558, -0.09949013, -0.5363871, 0, 0, 0, 1, 1,
-1.774949, 0.7595954, -1.679991, 0, 0, 0, 1, 1,
-1.772069, -1.072917, -2.102636, 1, 1, 1, 1, 1,
-1.739867, 0.4404795, -0.7129313, 1, 1, 1, 1, 1,
-1.716186, 0.6173208, -1.655964, 1, 1, 1, 1, 1,
-1.681061, 1.52458, -0.9830945, 1, 1, 1, 1, 1,
-1.678542, 0.6962172, -1.09923, 1, 1, 1, 1, 1,
-1.675756, 2.098344, -3.07876, 1, 1, 1, 1, 1,
-1.642491, -1.71984, -2.452506, 1, 1, 1, 1, 1,
-1.63911, 1.474427, -0.695287, 1, 1, 1, 1, 1,
-1.630605, -0.231074, -1.359377, 1, 1, 1, 1, 1,
-1.629053, 0.1850883, -2.280254, 1, 1, 1, 1, 1,
-1.626239, -1.133443, -2.67675, 1, 1, 1, 1, 1,
-1.625266, 1.430383, 0.9601181, 1, 1, 1, 1, 1,
-1.616319, 0.2877376, -2.68061, 1, 1, 1, 1, 1,
-1.615695, -0.726742, 0.234862, 1, 1, 1, 1, 1,
-1.613202, -0.2883098, -1.969514, 1, 1, 1, 1, 1,
-1.60986, -0.3195042, -1.97086, 0, 0, 1, 1, 1,
-1.605092, 0.417636, -1.513525, 1, 0, 0, 1, 1,
-1.589394, -0.08637699, -1.959021, 1, 0, 0, 1, 1,
-1.571527, -1.845146, -1.714473, 1, 0, 0, 1, 1,
-1.566298, -0.6031135, -0.9816239, 1, 0, 0, 1, 1,
-1.550817, -1.189067, -2.566868, 1, 0, 0, 1, 1,
-1.550816, -0.338414, -1.083718, 0, 0, 0, 1, 1,
-1.549732, -0.5080621, -2.421543, 0, 0, 0, 1, 1,
-1.530991, 0.09370723, -1.046953, 0, 0, 0, 1, 1,
-1.52831, 0.8072559, -1.979995, 0, 0, 0, 1, 1,
-1.519575, 1.792518, -0.5090253, 0, 0, 0, 1, 1,
-1.518647, 1.340854, -0.3490118, 0, 0, 0, 1, 1,
-1.515276, -1.160941, -2.14603, 0, 0, 0, 1, 1,
-1.513582, 0.2137699, -0.9185385, 1, 1, 1, 1, 1,
-1.504818, -0.312897, -3.051908, 1, 1, 1, 1, 1,
-1.498681, -0.1630488, -1.001819, 1, 1, 1, 1, 1,
-1.493219, 1.200872, -1.110146, 1, 1, 1, 1, 1,
-1.484848, 1.033803, -1.142601, 1, 1, 1, 1, 1,
-1.480249, 0.9722564, -0.746326, 1, 1, 1, 1, 1,
-1.476987, -0.5051866, -3.499448, 1, 1, 1, 1, 1,
-1.475677, 0.5966235, -2.863034, 1, 1, 1, 1, 1,
-1.468217, 0.09627952, -2.1674, 1, 1, 1, 1, 1,
-1.463852, -0.1245968, 1.777332, 1, 1, 1, 1, 1,
-1.456035, 0.4370051, -1.508757, 1, 1, 1, 1, 1,
-1.454382, 0.39462, -3.117481, 1, 1, 1, 1, 1,
-1.452402, -0.5759768, -1.440393, 1, 1, 1, 1, 1,
-1.452133, -0.3634653, -0.5979988, 1, 1, 1, 1, 1,
-1.447474, 1.031004, -0.4982786, 1, 1, 1, 1, 1,
-1.447173, 0.4552331, -1.89812, 0, 0, 1, 1, 1,
-1.440281, -0.5508835, -1.782723, 1, 0, 0, 1, 1,
-1.431502, -2.035843, -2.370709, 1, 0, 0, 1, 1,
-1.41899, -1.675067, -1.76554, 1, 0, 0, 1, 1,
-1.413527, -0.4744238, -0.9104869, 1, 0, 0, 1, 1,
-1.412163, 0.9140121, -0.04879859, 1, 0, 0, 1, 1,
-1.404548, -0.07582135, 0.4115457, 0, 0, 0, 1, 1,
-1.391482, -1.93696, -1.527799, 0, 0, 0, 1, 1,
-1.385592, 0.8529354, -2.380208, 0, 0, 0, 1, 1,
-1.384118, 1.358715, -1.403035, 0, 0, 0, 1, 1,
-1.357691, -0.4665354, -1.682176, 0, 0, 0, 1, 1,
-1.356403, -1.003446, -2.901446, 0, 0, 0, 1, 1,
-1.35418, -0.8167228, -1.624566, 0, 0, 0, 1, 1,
-1.345655, 1.203462, -1.471618, 1, 1, 1, 1, 1,
-1.336881, -0.4439101, -2.286839, 1, 1, 1, 1, 1,
-1.33531, -0.6336055, 0.04542468, 1, 1, 1, 1, 1,
-1.3342, -0.7619568, -1.828899, 1, 1, 1, 1, 1,
-1.334025, 0.1145399, -2.407943, 1, 1, 1, 1, 1,
-1.333518, -0.04676413, -0.870844, 1, 1, 1, 1, 1,
-1.326947, -1.119709, -3.169507, 1, 1, 1, 1, 1,
-1.323371, 1.377518, -0.8908646, 1, 1, 1, 1, 1,
-1.316864, 0.2895794, -0.7733315, 1, 1, 1, 1, 1,
-1.31503, 0.5695683, -2.351676, 1, 1, 1, 1, 1,
-1.312624, -1.021268, -2.82206, 1, 1, 1, 1, 1,
-1.309678, 0.4734679, -1.032347, 1, 1, 1, 1, 1,
-1.308727, 1.534119, -1.851694, 1, 1, 1, 1, 1,
-1.29631, -0.1626275, -1.45553, 1, 1, 1, 1, 1,
-1.295573, -1.187144, -3.293452, 1, 1, 1, 1, 1,
-1.287324, 0.3660636, -1.338367, 0, 0, 1, 1, 1,
-1.267371, 0.5819793, -0.9280273, 1, 0, 0, 1, 1,
-1.255767, -0.3819781, -3.211924, 1, 0, 0, 1, 1,
-1.253512, 0.9359071, -1.805604, 1, 0, 0, 1, 1,
-1.251241, 0.06482259, -0.3151163, 1, 0, 0, 1, 1,
-1.243836, 0.383837, -1.084177, 1, 0, 0, 1, 1,
-1.241827, 0.008352936, -0.1856428, 0, 0, 0, 1, 1,
-1.241204, 0.1870473, -0.02566229, 0, 0, 0, 1, 1,
-1.239259, -1.088825, -1.38752, 0, 0, 0, 1, 1,
-1.239205, -0.2224841, -1.428308, 0, 0, 0, 1, 1,
-1.227433, -0.1490804, -2.606466, 0, 0, 0, 1, 1,
-1.220864, 0.8852953, 0.3716844, 0, 0, 0, 1, 1,
-1.214592, -0.5378909, -4.414981, 0, 0, 0, 1, 1,
-1.214278, -0.1787552, -1.281759, 1, 1, 1, 1, 1,
-1.200042, 0.6773287, -1.808221, 1, 1, 1, 1, 1,
-1.196364, 0.6092436, -1.479819, 1, 1, 1, 1, 1,
-1.192711, 0.1712435, -1.369378, 1, 1, 1, 1, 1,
-1.187872, 0.2064638, -0.389302, 1, 1, 1, 1, 1,
-1.187117, -0.9315513, -4.082991, 1, 1, 1, 1, 1,
-1.180731, 0.7245185, -1.099566, 1, 1, 1, 1, 1,
-1.178375, -0.7659032, -3.360653, 1, 1, 1, 1, 1,
-1.168863, -0.9437994, -1.491603, 1, 1, 1, 1, 1,
-1.161289, -0.8702745, -3.068968, 1, 1, 1, 1, 1,
-1.155192, 0.5317589, -1.427341, 1, 1, 1, 1, 1,
-1.149001, 0.5398595, -2.724375, 1, 1, 1, 1, 1,
-1.146656, 0.9651729, -0.3373239, 1, 1, 1, 1, 1,
-1.143482, -0.3300775, -3.280325, 1, 1, 1, 1, 1,
-1.134703, 0.2308384, -2.165082, 1, 1, 1, 1, 1,
-1.132074, 0.9889889, -0.7942289, 0, 0, 1, 1, 1,
-1.131931, 0.2947453, -2.531449, 1, 0, 0, 1, 1,
-1.128717, 0.6786392, -1.374433, 1, 0, 0, 1, 1,
-1.125044, 0.7737732, -1.370826, 1, 0, 0, 1, 1,
-1.124669, -0.08481637, -0.6495509, 1, 0, 0, 1, 1,
-1.120598, 0.8664705, -0.4117908, 1, 0, 0, 1, 1,
-1.108099, -0.5741904, -2.487033, 0, 0, 0, 1, 1,
-1.101489, 0.1908016, -0.7902026, 0, 0, 0, 1, 1,
-1.092065, -0.1612584, -3.547073, 0, 0, 0, 1, 1,
-1.090025, 0.6166011, -2.142812, 0, 0, 0, 1, 1,
-1.076432, 0.7441218, -1.12449, 0, 0, 0, 1, 1,
-1.073343, 0.2749493, -1.906208, 0, 0, 0, 1, 1,
-1.070806, 0.6003752, -1.955034, 0, 0, 0, 1, 1,
-1.068045, -1.745192, -3.461051, 1, 1, 1, 1, 1,
-1.067336, -0.8059694, -2.996451, 1, 1, 1, 1, 1,
-1.066075, -1.397267, -3.572358, 1, 1, 1, 1, 1,
-1.064003, 0.09674744, -1.625669, 1, 1, 1, 1, 1,
-1.061546, 1.744369, -0.3837247, 1, 1, 1, 1, 1,
-1.048121, -0.5005829, -0.8037193, 1, 1, 1, 1, 1,
-1.043225, -1.396888, -3.272007, 1, 1, 1, 1, 1,
-1.042108, 1.514474, -1.79816, 1, 1, 1, 1, 1,
-1.039028, -0.08481248, -2.103392, 1, 1, 1, 1, 1,
-1.037764, 0.7094597, 0.729161, 1, 1, 1, 1, 1,
-1.033634, -0.3302287, -2.460392, 1, 1, 1, 1, 1,
-1.030046, 0.600885, 1.117081, 1, 1, 1, 1, 1,
-1.020349, 1.464261, -0.343286, 1, 1, 1, 1, 1,
-1.018241, -0.1227203, -3.75839, 1, 1, 1, 1, 1,
-1.015037, 0.801522, -1.913915, 1, 1, 1, 1, 1,
-1.012523, -0.6311795, -1.600883, 0, 0, 1, 1, 1,
-1.005989, 0.4402179, -3.152445, 1, 0, 0, 1, 1,
-0.9972493, 1.382139, -1.57647, 1, 0, 0, 1, 1,
-0.9907954, -0.1419984, -2.173356, 1, 0, 0, 1, 1,
-0.9898911, 0.6929247, -0.8811665, 1, 0, 0, 1, 1,
-0.9832427, 0.225173, -1.618542, 1, 0, 0, 1, 1,
-0.9804011, -0.4722594, -1.546364, 0, 0, 0, 1, 1,
-0.9801453, -0.4903508, -3.963902, 0, 0, 0, 1, 1,
-0.9771852, 2.303103, 2.958872, 0, 0, 0, 1, 1,
-0.9744513, -0.1665382, -0.6349835, 0, 0, 0, 1, 1,
-0.9744299, 2.108968, -0.9551511, 0, 0, 0, 1, 1,
-0.9723503, -0.3925008, -1.274062, 0, 0, 0, 1, 1,
-0.969285, -0.06728929, -2.505713, 0, 0, 0, 1, 1,
-0.9651899, -0.4794431, -1.715429, 1, 1, 1, 1, 1,
-0.9502903, 0.1981459, -0.6920028, 1, 1, 1, 1, 1,
-0.9485546, 0.615289, -2.052701, 1, 1, 1, 1, 1,
-0.9455159, -0.1424157, -0.9127739, 1, 1, 1, 1, 1,
-0.9378292, -0.4254599, -0.2049994, 1, 1, 1, 1, 1,
-0.9371798, 0.2690873, -2.694085, 1, 1, 1, 1, 1,
-0.9366413, 1.479061, -1.012894, 1, 1, 1, 1, 1,
-0.9198967, -0.442637, -1.748361, 1, 1, 1, 1, 1,
-0.9118735, -0.364222, 1.111315, 1, 1, 1, 1, 1,
-0.9088164, -1.876771, -1.551094, 1, 1, 1, 1, 1,
-0.9074703, -0.6168508, -1.862793, 1, 1, 1, 1, 1,
-0.902925, -0.2792734, -0.07117726, 1, 1, 1, 1, 1,
-0.8962435, 0.519745, -1.617385, 1, 1, 1, 1, 1,
-0.8905389, 0.7948211, 0.7548411, 1, 1, 1, 1, 1,
-0.8905306, 1.755083, -0.006815573, 1, 1, 1, 1, 1,
-0.8814323, -0.05900105, -0.5752565, 0, 0, 1, 1, 1,
-0.8813732, 1.169597, -1.396285, 1, 0, 0, 1, 1,
-0.879724, 0.06045283, -2.135572, 1, 0, 0, 1, 1,
-0.878344, -0.5779091, -3.976478, 1, 0, 0, 1, 1,
-0.8780145, -0.6269046, -0.6635404, 1, 0, 0, 1, 1,
-0.872907, 1.257362, -0.3390737, 1, 0, 0, 1, 1,
-0.871962, -0.8404763, -3.027663, 0, 0, 0, 1, 1,
-0.8718045, 0.3874438, -1.25177, 0, 0, 0, 1, 1,
-0.8684151, -0.7668126, -4.050307, 0, 0, 0, 1, 1,
-0.8611709, 1.491015, -0.7227001, 0, 0, 0, 1, 1,
-0.8508604, -0.3636083, -2.398133, 0, 0, 0, 1, 1,
-0.8505498, 1.174753, -3.208575, 0, 0, 0, 1, 1,
-0.8449804, 0.08024348, -1.296244, 0, 0, 0, 1, 1,
-0.8406337, 1.682974, -0.735224, 1, 1, 1, 1, 1,
-0.8364536, 0.3895308, -1.548373, 1, 1, 1, 1, 1,
-0.831404, 0.3278843, -1.706444, 1, 1, 1, 1, 1,
-0.8283666, -0.07928795, -2.011741, 1, 1, 1, 1, 1,
-0.8239909, -0.7001483, 0.6011118, 1, 1, 1, 1, 1,
-0.8216274, 1.382577, -0.5455557, 1, 1, 1, 1, 1,
-0.8200155, -0.6263253, -2.982111, 1, 1, 1, 1, 1,
-0.8076649, 0.6811669, 0.8369026, 1, 1, 1, 1, 1,
-0.8017084, 0.01953036, -1.227722, 1, 1, 1, 1, 1,
-0.8010087, 0.4687975, -0.6695833, 1, 1, 1, 1, 1,
-0.8001204, 1.112301, 0.5116453, 1, 1, 1, 1, 1,
-0.7916042, 0.6108801, -1.180436, 1, 1, 1, 1, 1,
-0.7802917, -0.9494943, -1.925122, 1, 1, 1, 1, 1,
-0.776674, 1.395956, -0.7506167, 1, 1, 1, 1, 1,
-0.7704042, 1.149138, -2.769508, 1, 1, 1, 1, 1,
-0.7699383, 0.2820513, -2.702369, 0, 0, 1, 1, 1,
-0.7624229, 0.2209672, -1.04754, 1, 0, 0, 1, 1,
-0.7604942, 1.85886, 0.3380653, 1, 0, 0, 1, 1,
-0.7512538, -0.4800932, -4.119457, 1, 0, 0, 1, 1,
-0.7444829, 1.482737, 0.05930774, 1, 0, 0, 1, 1,
-0.7402378, 1.103974, -0.6936252, 1, 0, 0, 1, 1,
-0.7350466, -0.6753383, -2.600986, 0, 0, 0, 1, 1,
-0.73497, -0.6957564, -1.933056, 0, 0, 0, 1, 1,
-0.7328051, -0.1825042, -0.9739469, 0, 0, 0, 1, 1,
-0.7304699, 1.038821, -0.8904659, 0, 0, 0, 1, 1,
-0.7275748, -0.3014789, -2.746398, 0, 0, 0, 1, 1,
-0.7251309, 0.7243924, 1.422585, 0, 0, 0, 1, 1,
-0.7250822, -0.3447759, -0.9497169, 0, 0, 0, 1, 1,
-0.724285, 0.5513561, 0.4845611, 1, 1, 1, 1, 1,
-0.7210198, 0.7291484, -3.765792, 1, 1, 1, 1, 1,
-0.717629, -1.547762, -3.584565, 1, 1, 1, 1, 1,
-0.7149638, 0.4598833, 0.5994197, 1, 1, 1, 1, 1,
-0.7079908, -2.045297, -2.518268, 1, 1, 1, 1, 1,
-0.7072182, 0.04287702, -1.758016, 1, 1, 1, 1, 1,
-0.7072036, 1.947323, 0.1312414, 1, 1, 1, 1, 1,
-0.7048772, -0.6266024, -2.509128, 1, 1, 1, 1, 1,
-0.694346, 0.8235249, 0.4557882, 1, 1, 1, 1, 1,
-0.6922882, -0.7346551, -2.01561, 1, 1, 1, 1, 1,
-0.6905136, -0.06463382, -1.352317, 1, 1, 1, 1, 1,
-0.6790173, -0.196024, -1.627304, 1, 1, 1, 1, 1,
-0.6668103, -1.5909, -2.542456, 1, 1, 1, 1, 1,
-0.6650508, 0.2575912, -0.6928449, 1, 1, 1, 1, 1,
-0.6647903, -0.02814855, -0.9258834, 1, 1, 1, 1, 1,
-0.6601803, -1.178657, -2.541845, 0, 0, 1, 1, 1,
-0.6586584, -0.7019815, -4.160543, 1, 0, 0, 1, 1,
-0.6547171, 1.410676, -0.9169422, 1, 0, 0, 1, 1,
-0.6533204, 0.4382131, 1.408116, 1, 0, 0, 1, 1,
-0.6475311, -0.04565017, -0.2330165, 1, 0, 0, 1, 1,
-0.6463614, -0.08639286, -0.5272158, 1, 0, 0, 1, 1,
-0.6401834, -0.6607389, -2.696103, 0, 0, 0, 1, 1,
-0.6348148, 2.063413, -0.8004735, 0, 0, 0, 1, 1,
-0.6345716, 1.461986, 0.3500683, 0, 0, 0, 1, 1,
-0.6326187, -0.4315318, -1.494626, 0, 0, 0, 1, 1,
-0.6307549, -0.08239344, -2.535916, 0, 0, 0, 1, 1,
-0.6272154, -0.0003863501, -1.953078, 0, 0, 0, 1, 1,
-0.6217686, -1.784803, -2.302235, 0, 0, 0, 1, 1,
-0.620739, 0.6072635, 1.02171, 1, 1, 1, 1, 1,
-0.6204529, -0.4335281, -3.760007, 1, 1, 1, 1, 1,
-0.6191239, 0.4919978, 0.07591061, 1, 1, 1, 1, 1,
-0.6182575, 2.114206, 0.4379117, 1, 1, 1, 1, 1,
-0.6153991, -0.05102767, -1.779863, 1, 1, 1, 1, 1,
-0.6053001, -0.6340249, -1.758054, 1, 1, 1, 1, 1,
-0.6026505, -1.731885, -2.309948, 1, 1, 1, 1, 1,
-0.6001911, 1.361519, -0.2491701, 1, 1, 1, 1, 1,
-0.5992993, 0.670309, -0.8827735, 1, 1, 1, 1, 1,
-0.5988223, -0.07095058, -3.482012, 1, 1, 1, 1, 1,
-0.5926222, 1.752317, -1.029089, 1, 1, 1, 1, 1,
-0.5896733, 0.7272364, -0.9174262, 1, 1, 1, 1, 1,
-0.5895831, -0.9722261, -2.121413, 1, 1, 1, 1, 1,
-0.5838275, 0.4423448, -1.259395, 1, 1, 1, 1, 1,
-0.5805873, -0.565504, -1.518387, 1, 1, 1, 1, 1,
-0.5802337, -1.036386, -3.257326, 0, 0, 1, 1, 1,
-0.5801766, 1.314751, -1.294275, 1, 0, 0, 1, 1,
-0.5782064, 0.328077, -1.12042, 1, 0, 0, 1, 1,
-0.5770811, 2.203453, -0.03141168, 1, 0, 0, 1, 1,
-0.5767588, -0.9872153, -5.328762, 1, 0, 0, 1, 1,
-0.5720122, -1.345035, -1.542565, 1, 0, 0, 1, 1,
-0.5714885, 0.178415, -2.046317, 0, 0, 0, 1, 1,
-0.5699208, -0.3742368, -2.448174, 0, 0, 0, 1, 1,
-0.5689017, -0.7094345, -1.117874, 0, 0, 0, 1, 1,
-0.5677675, -0.654151, -4.022743, 0, 0, 0, 1, 1,
-0.5665625, 0.1920166, -1.706837, 0, 0, 0, 1, 1,
-0.5665591, 0.8023454, -1.705592, 0, 0, 0, 1, 1,
-0.5659268, -0.8412444, -2.058064, 0, 0, 0, 1, 1,
-0.5623434, 0.7480181, 0.3717303, 1, 1, 1, 1, 1,
-0.55977, -1.672595, -2.629376, 1, 1, 1, 1, 1,
-0.5580806, -1.206097, -5.072157, 1, 1, 1, 1, 1,
-0.5576756, 0.1189881, -1.23575, 1, 1, 1, 1, 1,
-0.5527471, -0.4476335, -1.66297, 1, 1, 1, 1, 1,
-0.5448738, 0.3967538, -4.056665, 1, 1, 1, 1, 1,
-0.5437642, -0.5442579, -2.915092, 1, 1, 1, 1, 1,
-0.5415624, 1.160049, 0.3147141, 1, 1, 1, 1, 1,
-0.5395047, 0.2466896, -1.383128, 1, 1, 1, 1, 1,
-0.5377141, 0.5442871, -0.06292255, 1, 1, 1, 1, 1,
-0.5356606, 0.1024708, -1.548313, 1, 1, 1, 1, 1,
-0.5356111, 1.0246, 0.4124984, 1, 1, 1, 1, 1,
-0.5342556, 0.04211595, -2.008225, 1, 1, 1, 1, 1,
-0.525664, 0.4365528, -1.822563, 1, 1, 1, 1, 1,
-0.518217, -0.07669368, -3.474967, 1, 1, 1, 1, 1,
-0.5164566, 0.2368941, -3.180055, 0, 0, 1, 1, 1,
-0.5158733, -1.355523, -3.916375, 1, 0, 0, 1, 1,
-0.514099, -0.2750665, -0.9097267, 1, 0, 0, 1, 1,
-0.5100781, -0.1851849, -2.886535, 1, 0, 0, 1, 1,
-0.5092456, 0.6796843, -2.482655, 1, 0, 0, 1, 1,
-0.5061067, 0.1619031, -0.5057876, 1, 0, 0, 1, 1,
-0.5058438, -1.34835, -2.916918, 0, 0, 0, 1, 1,
-0.500393, 0.1314169, -1.28043, 0, 0, 0, 1, 1,
-0.4969939, 0.2086021, -3.520411, 0, 0, 0, 1, 1,
-0.494513, -0.5391291, -0.8758953, 0, 0, 0, 1, 1,
-0.4940237, 1.843007, 0.05011346, 0, 0, 0, 1, 1,
-0.4936053, -0.2237916, -1.153317, 0, 0, 0, 1, 1,
-0.4916022, 0.357483, -1.467251, 0, 0, 0, 1, 1,
-0.4895723, -1.80268, -4.178917, 1, 1, 1, 1, 1,
-0.4858237, 0.8591581, -1.120048, 1, 1, 1, 1, 1,
-0.4813858, 0.8939701, 0.7528462, 1, 1, 1, 1, 1,
-0.4735658, -1.552335, -1.742378, 1, 1, 1, 1, 1,
-0.4726242, -0.05352102, -1.459904, 1, 1, 1, 1, 1,
-0.470715, -1.387788, -1.099019, 1, 1, 1, 1, 1,
-0.4689464, -1.719715, -3.6195, 1, 1, 1, 1, 1,
-0.4645921, 1.391675, -0.6913149, 1, 1, 1, 1, 1,
-0.4605857, 0.6047198, -0.5076366, 1, 1, 1, 1, 1,
-0.4558424, 0.6298571, -0.5312224, 1, 1, 1, 1, 1,
-0.4510138, 0.6895223, 0.2462098, 1, 1, 1, 1, 1,
-0.450607, 0.5814281, -1.142683, 1, 1, 1, 1, 1,
-0.4493924, 0.2930492, -0.08333693, 1, 1, 1, 1, 1,
-0.4437698, 1.934536, -0.08723673, 1, 1, 1, 1, 1,
-0.442862, -1.249321, -3.162126, 1, 1, 1, 1, 1,
-0.4428222, 0.7175571, -0.7801607, 0, 0, 1, 1, 1,
-0.4410059, -0.9281508, -2.032911, 1, 0, 0, 1, 1,
-0.4358537, 2.836061, 0.6651607, 1, 0, 0, 1, 1,
-0.4354303, 0.3030181, -1.20862, 1, 0, 0, 1, 1,
-0.4320756, -1.022213, -0.9307439, 1, 0, 0, 1, 1,
-0.4309517, 1.170428, 0.7158256, 1, 0, 0, 1, 1,
-0.4293972, 0.03931358, -1.255398, 0, 0, 0, 1, 1,
-0.4278268, -0.2012402, -1.195392, 0, 0, 0, 1, 1,
-0.4277722, 0.1049585, -0.9543325, 0, 0, 0, 1, 1,
-0.421552, 0.09383155, -1.718925, 0, 0, 0, 1, 1,
-0.4213172, 0.2069339, -2.227985, 0, 0, 0, 1, 1,
-0.4180589, -1.419929, -3.288896, 0, 0, 0, 1, 1,
-0.4178932, 1.380652, -0.5853509, 0, 0, 0, 1, 1,
-0.4123776, 0.8751091, -3.3995, 1, 1, 1, 1, 1,
-0.4029704, -0.1052267, -2.148548, 1, 1, 1, 1, 1,
-0.3997236, 0.4148297, -0.8554668, 1, 1, 1, 1, 1,
-0.3989976, 0.1488737, -1.358995, 1, 1, 1, 1, 1,
-0.3978512, -2.128189, -2.388792, 1, 1, 1, 1, 1,
-0.3975199, 0.09582098, -1.486989, 1, 1, 1, 1, 1,
-0.3961436, 0.4576774, 0.1373827, 1, 1, 1, 1, 1,
-0.3960011, 0.603153, -0.7218603, 1, 1, 1, 1, 1,
-0.3956484, -0.01831973, -1.036921, 1, 1, 1, 1, 1,
-0.3920554, 0.4350017, 0.7926967, 1, 1, 1, 1, 1,
-0.3857569, -0.02777076, -1.385261, 1, 1, 1, 1, 1,
-0.3838691, 0.9198197, 0.06314878, 1, 1, 1, 1, 1,
-0.3834237, 0.3319585, -0.6777547, 1, 1, 1, 1, 1,
-0.3808752, 0.388851, -0.7434844, 1, 1, 1, 1, 1,
-0.3705722, 0.4111059, -0.1641447, 1, 1, 1, 1, 1,
-0.3701444, 0.1586284, 0.7044845, 0, 0, 1, 1, 1,
-0.3658546, -0.9482341, -5.033421, 1, 0, 0, 1, 1,
-0.3612243, 1.466884, 1.0324, 1, 0, 0, 1, 1,
-0.3563363, 0.04866412, -3.111916, 1, 0, 0, 1, 1,
-0.3556672, 0.06557492, -1.346808, 1, 0, 0, 1, 1,
-0.3547512, 1.599522, 1.196021, 1, 0, 0, 1, 1,
-0.3528103, -1.670532, -1.941484, 0, 0, 0, 1, 1,
-0.3527837, -2.856352, -2.732338, 0, 0, 0, 1, 1,
-0.351551, -0.7270455, -3.107937, 0, 0, 0, 1, 1,
-0.3509035, 0.9333248, -0.470733, 0, 0, 0, 1, 1,
-0.3493205, -0.8304999, -1.807711, 0, 0, 0, 1, 1,
-0.3481642, -1.03705, -3.917931, 0, 0, 0, 1, 1,
-0.347139, 0.3621235, -1.367381, 0, 0, 0, 1, 1,
-0.3422443, -1.087772, -2.310002, 1, 1, 1, 1, 1,
-0.3394424, -0.1758639, -2.218873, 1, 1, 1, 1, 1,
-0.3370112, -0.3379291, -3.729389, 1, 1, 1, 1, 1,
-0.3363369, 0.6816745, -1.05384, 1, 1, 1, 1, 1,
-0.3362343, -0.02076012, -1.024099, 1, 1, 1, 1, 1,
-0.3318698, -1.043009, -3.443628, 1, 1, 1, 1, 1,
-0.3242226, 0.09931301, -1.357137, 1, 1, 1, 1, 1,
-0.3241111, 1.158799, 0.00265725, 1, 1, 1, 1, 1,
-0.318984, -0.8718902, -2.271174, 1, 1, 1, 1, 1,
-0.3174351, -0.6275634, -3.211308, 1, 1, 1, 1, 1,
-0.3158498, -0.5591241, -2.807696, 1, 1, 1, 1, 1,
-0.3106723, -0.6615636, -4.00335, 1, 1, 1, 1, 1,
-0.3070814, -1.617499, -3.463958, 1, 1, 1, 1, 1,
-0.3025326, -0.7957638, -2.684312, 1, 1, 1, 1, 1,
-0.3020602, 0.2507718, -1.544046, 1, 1, 1, 1, 1,
-0.2994117, -0.09747009, -1.112251, 0, 0, 1, 1, 1,
-0.2988906, 0.0590762, -2.910552, 1, 0, 0, 1, 1,
-0.2980722, 2.338456, 1.044335, 1, 0, 0, 1, 1,
-0.2915697, 1.632948, -0.6412365, 1, 0, 0, 1, 1,
-0.2905766, -0.6276288, -2.99581, 1, 0, 0, 1, 1,
-0.2902541, -0.02238768, -1.927003, 1, 0, 0, 1, 1,
-0.2876385, -0.28881, -2.586863, 0, 0, 0, 1, 1,
-0.2853561, -1.053692, -3.379725, 0, 0, 0, 1, 1,
-0.285006, -0.6278265, -2.852, 0, 0, 0, 1, 1,
-0.2832022, 1.901172, 0.02282017, 0, 0, 0, 1, 1,
-0.2796281, -1.429726, -3.666701, 0, 0, 0, 1, 1,
-0.2711975, 0.3096612, -1.130397, 0, 0, 0, 1, 1,
-0.2678862, -0.7730495, -1.837671, 0, 0, 0, 1, 1,
-0.2678535, -0.789032, -4.321139, 1, 1, 1, 1, 1,
-0.2659634, -1.009027, -3.357508, 1, 1, 1, 1, 1,
-0.2658599, -0.1527134, -4.25481, 1, 1, 1, 1, 1,
-0.2612621, 0.956156, -1.110437, 1, 1, 1, 1, 1,
-0.2597695, -0.8308467, -2.457049, 1, 1, 1, 1, 1,
-0.2593431, 0.2352976, 0.2017447, 1, 1, 1, 1, 1,
-0.2540784, 0.1453058, -0.6514875, 1, 1, 1, 1, 1,
-0.2522137, 0.07767567, -0.635512, 1, 1, 1, 1, 1,
-0.248366, -1.048157, -3.873069, 1, 1, 1, 1, 1,
-0.2465431, -1.048502, -1.430376, 1, 1, 1, 1, 1,
-0.2440253, -0.9882263, -3.305128, 1, 1, 1, 1, 1,
-0.2432949, 1.189968, -0.789844, 1, 1, 1, 1, 1,
-0.2424793, -1.25549, -1.296571, 1, 1, 1, 1, 1,
-0.2411949, -0.9046562, -2.001432, 1, 1, 1, 1, 1,
-0.2383877, 1.045103, -1.666382, 1, 1, 1, 1, 1,
-0.2380985, 0.62036, 0.04592956, 0, 0, 1, 1, 1,
-0.2362216, -1.628557, -4.575926, 1, 0, 0, 1, 1,
-0.2355828, 0.313088, -2.176509, 1, 0, 0, 1, 1,
-0.2332083, -1.89891, -1.256706, 1, 0, 0, 1, 1,
-0.2317169, 0.8815604, -0.5451452, 1, 0, 0, 1, 1,
-0.2310352, 0.6297279, 0.5063879, 1, 0, 0, 1, 1,
-0.2248071, -0.1603516, -3.27838, 0, 0, 0, 1, 1,
-0.2220791, -1.607395, -3.23417, 0, 0, 0, 1, 1,
-0.221371, -0.266026, -4.667086, 0, 0, 0, 1, 1,
-0.2184998, -0.5600867, -2.106926, 0, 0, 0, 1, 1,
-0.2145959, -1.921392, -1.728716, 0, 0, 0, 1, 1,
-0.2143344, 0.1605387, -1.245711, 0, 0, 0, 1, 1,
-0.2132643, 0.3973093, -1.793624, 0, 0, 0, 1, 1,
-0.2112753, 0.9942985, -0.4232809, 1, 1, 1, 1, 1,
-0.2098426, -0.4514223, -4.140473, 1, 1, 1, 1, 1,
-0.209738, 0.4038081, -0.307964, 1, 1, 1, 1, 1,
-0.2084404, 0.4534684, -0.1394588, 1, 1, 1, 1, 1,
-0.2081672, -0.5196918, -2.634851, 1, 1, 1, 1, 1,
-0.2060871, 1.329775, -1.194533, 1, 1, 1, 1, 1,
-0.2051275, 1.494349, 0.8852372, 1, 1, 1, 1, 1,
-0.2022187, 1.765967, -1.178891, 1, 1, 1, 1, 1,
-0.2019696, -0.2414142, -2.374789, 1, 1, 1, 1, 1,
-0.201084, -0.1862307, -3.118475, 1, 1, 1, 1, 1,
-0.1882288, 0.561033, -1.627756, 1, 1, 1, 1, 1,
-0.1878924, -0.1532354, -4.954868, 1, 1, 1, 1, 1,
-0.1873323, -1.359075, -2.434335, 1, 1, 1, 1, 1,
-0.1843102, 0.1049232, -0.6212417, 1, 1, 1, 1, 1,
-0.1801354, 1.597812, 0.7807099, 1, 1, 1, 1, 1,
-0.1782126, 0.1266901, -0.02724965, 0, 0, 1, 1, 1,
-0.1736533, 0.03812952, -2.044274, 1, 0, 0, 1, 1,
-0.1734513, 0.08729783, -2.794641, 1, 0, 0, 1, 1,
-0.172629, 0.6064644, -1.106569, 1, 0, 0, 1, 1,
-0.1712575, -0.279554, -3.358467, 1, 0, 0, 1, 1,
-0.1704916, 0.2250863, -0.8446614, 1, 0, 0, 1, 1,
-0.1665859, 0.339738, 0.6379085, 0, 0, 0, 1, 1,
-0.1633334, 0.321954, -0.6422458, 0, 0, 0, 1, 1,
-0.1595995, 0.2285405, -1.602491, 0, 0, 0, 1, 1,
-0.1593389, 0.08061743, -0.9077436, 0, 0, 0, 1, 1,
-0.155345, 0.2081741, -1.79051, 0, 0, 0, 1, 1,
-0.1490603, -0.4872377, -3.573501, 0, 0, 0, 1, 1,
-0.1446061, -1.29023, -2.173567, 0, 0, 0, 1, 1,
-0.1392732, 0.7006551, -0.1135319, 1, 1, 1, 1, 1,
-0.1381845, 0.6327291, 0.04833828, 1, 1, 1, 1, 1,
-0.1332638, 0.9690108, -1.088052, 1, 1, 1, 1, 1,
-0.1331574, -1.381714, -2.213964, 1, 1, 1, 1, 1,
-0.1327195, -0.5540449, -3.356229, 1, 1, 1, 1, 1,
-0.1281174, -0.7359911, -2.41646, 1, 1, 1, 1, 1,
-0.1262744, 0.1017486, -2.191937, 1, 1, 1, 1, 1,
-0.1260729, 0.9924152, 0.8175259, 1, 1, 1, 1, 1,
-0.1226265, -0.7562149, -2.524879, 1, 1, 1, 1, 1,
-0.1206115, -1.170505, -3.669347, 1, 1, 1, 1, 1,
-0.1169122, 0.4328679, -0.8305163, 1, 1, 1, 1, 1,
-0.1168243, -1.505253, -3.954484, 1, 1, 1, 1, 1,
-0.1159059, -0.2207041, -1.747693, 1, 1, 1, 1, 1,
-0.115128, -0.4729455, -1.699652, 1, 1, 1, 1, 1,
-0.1073011, 0.05000659, -1.728705, 1, 1, 1, 1, 1,
-0.104679, 0.3670409, -2.163172, 0, 0, 1, 1, 1,
-0.104236, -1.639245, -3.370447, 1, 0, 0, 1, 1,
-0.09861128, 1.749235, 0.4163192, 1, 0, 0, 1, 1,
-0.0974291, -0.6094162, -3.344072, 1, 0, 0, 1, 1,
-0.096921, -0.4682982, -2.70499, 1, 0, 0, 1, 1,
-0.09453639, 0.206978, 0.6261957, 1, 0, 0, 1, 1,
-0.09421617, -0.1241999, -2.013604, 0, 0, 0, 1, 1,
-0.09371589, 1.435568, -0.09294505, 0, 0, 0, 1, 1,
-0.08866142, -1.442023, -3.64936, 0, 0, 0, 1, 1,
-0.08540015, 1.425225, -0.4990793, 0, 0, 0, 1, 1,
-0.0840599, -0.6239681, -3.496381, 0, 0, 0, 1, 1,
-0.07813242, -0.8905271, -2.996053, 0, 0, 0, 1, 1,
-0.07809624, -0.8035983, -2.578252, 0, 0, 0, 1, 1,
-0.07579916, 0.9840294, 0.09589418, 1, 1, 1, 1, 1,
-0.07333048, 0.09109466, -0.3933147, 1, 1, 1, 1, 1,
-0.07269488, 0.2783153, -0.2851626, 1, 1, 1, 1, 1,
-0.07243903, 0.254016, 1.696133, 1, 1, 1, 1, 1,
-0.07195642, 2.345284, -1.745931, 1, 1, 1, 1, 1,
-0.07104322, -0.6610898, -3.384818, 1, 1, 1, 1, 1,
-0.07092652, -0.4265479, -1.154718, 1, 1, 1, 1, 1,
-0.0700726, 0.2014105, -1.408626, 1, 1, 1, 1, 1,
-0.06845926, 0.4304387, 0.06500214, 1, 1, 1, 1, 1,
-0.06403293, -0.6470508, -3.465654, 1, 1, 1, 1, 1,
-0.06137914, 1.046936, -0.2063125, 1, 1, 1, 1, 1,
-0.05595848, 1.931538, 0.09239339, 1, 1, 1, 1, 1,
-0.05503757, -0.4563755, -0.7756643, 1, 1, 1, 1, 1,
-0.05031329, -1.831281, -1.608579, 1, 1, 1, 1, 1,
-0.04784108, 0.1428598, -0.2638393, 1, 1, 1, 1, 1,
-0.04508356, -0.05754432, -2.549074, 0, 0, 1, 1, 1,
-0.04392321, -0.3314785, -3.037721, 1, 0, 0, 1, 1,
-0.03472077, -0.2043297, -3.748769, 1, 0, 0, 1, 1,
-0.03416039, 1.087465, 0.6760562, 1, 0, 0, 1, 1,
-0.02867051, 1.43389, 1.705988, 1, 0, 0, 1, 1,
-0.02851867, -0.7920349, -4.368127, 1, 0, 0, 1, 1,
-0.02733115, -0.4824508, -3.742927, 0, 0, 0, 1, 1,
-0.02691349, -0.7809638, -1.836857, 0, 0, 0, 1, 1,
-0.02620151, -0.3607304, -3.127824, 0, 0, 0, 1, 1,
-0.02619172, -1.053441, -4.077044, 0, 0, 0, 1, 1,
-0.02398784, 0.2824214, -2.080952, 0, 0, 0, 1, 1,
-0.0231282, 0.1068659, -0.9098259, 0, 0, 0, 1, 1,
-0.0200852, 0.08993151, -0.5909457, 0, 0, 0, 1, 1,
-0.01943964, 0.3372244, 1.45367, 1, 1, 1, 1, 1,
-0.01908317, 1.004258, -0.5872455, 1, 1, 1, 1, 1,
-0.0189143, -0.3758205, -2.869361, 1, 1, 1, 1, 1,
-0.01824315, -1.109145, -2.831879, 1, 1, 1, 1, 1,
-0.01728917, 0.4047978, -0.0785917, 1, 1, 1, 1, 1,
-0.01140259, -0.8325452, -3.990026, 1, 1, 1, 1, 1,
-0.009719414, -0.06315039, -1.543597, 1, 1, 1, 1, 1,
-0.008245375, -0.1211696, -2.649767, 1, 1, 1, 1, 1,
-0.00545508, 0.9687219, -0.3677258, 1, 1, 1, 1, 1,
0.005520972, -1.763032, 2.705169, 1, 1, 1, 1, 1,
0.006669199, -0.2980662, 0.04954122, 1, 1, 1, 1, 1,
0.006793103, 1.088928, -1.66957, 1, 1, 1, 1, 1,
0.008064928, -0.9725112, 5.058396, 1, 1, 1, 1, 1,
0.008956403, 1.62422, -0.2475968, 1, 1, 1, 1, 1,
0.01299397, -1.914868, 2.212685, 1, 1, 1, 1, 1,
0.01488433, -1.008275, 3.575711, 0, 0, 1, 1, 1,
0.01824345, 1.54562, -0.7419773, 1, 0, 0, 1, 1,
0.01971491, -0.1433767, 3.894164, 1, 0, 0, 1, 1,
0.02206483, 0.07417264, 0.5583686, 1, 0, 0, 1, 1,
0.02292579, 1.747254, 1.983232, 1, 0, 0, 1, 1,
0.02624947, 0.3160115, 0.1294763, 1, 0, 0, 1, 1,
0.02795955, -1.465686, 2.583893, 0, 0, 0, 1, 1,
0.02923867, 0.2974992, -0.9079788, 0, 0, 0, 1, 1,
0.03431596, -0.158535, 5.131096, 0, 0, 0, 1, 1,
0.04039108, -0.6334397, 2.972656, 0, 0, 0, 1, 1,
0.04240116, -0.3850152, 2.264338, 0, 0, 0, 1, 1,
0.04436703, 1.025724, -1.072415, 0, 0, 0, 1, 1,
0.04833024, 1.333914, 1.092652, 0, 0, 0, 1, 1,
0.05080368, -0.9756613, 4.350219, 1, 1, 1, 1, 1,
0.05088474, 0.07430673, 1.411252, 1, 1, 1, 1, 1,
0.05121032, -0.3758736, 4.231084, 1, 1, 1, 1, 1,
0.05143145, 1.132179, 2.324959, 1, 1, 1, 1, 1,
0.06142325, -0.06688295, 3.263733, 1, 1, 1, 1, 1,
0.06371582, -0.7801362, 3.546203, 1, 1, 1, 1, 1,
0.06377681, -0.02745438, 1.96767, 1, 1, 1, 1, 1,
0.0653, 1.928078, 0.6953306, 1, 1, 1, 1, 1,
0.0685445, 0.9871976, -0.3407848, 1, 1, 1, 1, 1,
0.06856969, 0.1762862, -0.2419729, 1, 1, 1, 1, 1,
0.07138649, 0.7064238, 0.3191437, 1, 1, 1, 1, 1,
0.09306651, 0.4962665, -2.549753, 1, 1, 1, 1, 1,
0.09366398, -0.1163023, 2.52215, 1, 1, 1, 1, 1,
0.09915502, -0.1565754, 2.185983, 1, 1, 1, 1, 1,
0.1018946, 1.153278, -0.8013502, 1, 1, 1, 1, 1,
0.1043671, -0.259758, 2.882738, 0, 0, 1, 1, 1,
0.1044847, 1.935848, -0.01372258, 1, 0, 0, 1, 1,
0.1046568, -0.5826955, 2.915708, 1, 0, 0, 1, 1,
0.1072105, 0.5010499, 2.500163, 1, 0, 0, 1, 1,
0.1075963, -2.260332, 3.841726, 1, 0, 0, 1, 1,
0.1140388, 0.5017374, 1.512382, 1, 0, 0, 1, 1,
0.1173743, -1.124212, 5.897804, 0, 0, 0, 1, 1,
0.1209532, -0.4494117, 2.872861, 0, 0, 0, 1, 1,
0.1215199, 0.3554729, 1.317526, 0, 0, 0, 1, 1,
0.1215508, 0.3148612, 0.4241551, 0, 0, 0, 1, 1,
0.1255616, -0.7918027, 2.122329, 0, 0, 0, 1, 1,
0.1266817, -0.1686702, 2.237236, 0, 0, 0, 1, 1,
0.1280165, -0.3033381, 1.807191, 0, 0, 0, 1, 1,
0.1353754, -0.4370669, 4.578751, 1, 1, 1, 1, 1,
0.1389863, -1.709962, 0.9472286, 1, 1, 1, 1, 1,
0.1399375, -0.3882744, 3.16843, 1, 1, 1, 1, 1,
0.1416715, 1.178376, 0.4423956, 1, 1, 1, 1, 1,
0.143508, -0.2001278, 4.049191, 1, 1, 1, 1, 1,
0.1633726, 2.692664, -0.7482548, 1, 1, 1, 1, 1,
0.1643661, 0.3098803, 1.29061, 1, 1, 1, 1, 1,
0.1672457, -1.006698, 4.256104, 1, 1, 1, 1, 1,
0.1698385, 0.1598311, 0.8000088, 1, 1, 1, 1, 1,
0.1742214, 0.5234267, 0.2214259, 1, 1, 1, 1, 1,
0.1807399, 2.059631, -0.5973629, 1, 1, 1, 1, 1,
0.1885129, -1.307665, 3.513526, 1, 1, 1, 1, 1,
0.1899826, -0.1400522, 2.35302, 1, 1, 1, 1, 1,
0.1924012, -0.1917706, 2.896358, 1, 1, 1, 1, 1,
0.1960509, -0.5542243, 4.710248, 1, 1, 1, 1, 1,
0.1965925, 0.02236744, 1.949548, 0, 0, 1, 1, 1,
0.2009784, -2.110167, 3.372152, 1, 0, 0, 1, 1,
0.2035922, 0.7708104, -0.1759478, 1, 0, 0, 1, 1,
0.2037773, 0.9037082, 0.2046282, 1, 0, 0, 1, 1,
0.2058338, -1.094929, 2.933315, 1, 0, 0, 1, 1,
0.2157696, -0.6587592, 3.089471, 1, 0, 0, 1, 1,
0.2229667, -0.3240775, 2.765849, 0, 0, 0, 1, 1,
0.228474, 1.677693, 0.3582078, 0, 0, 0, 1, 1,
0.2316777, 0.3322108, 1.652182, 0, 0, 0, 1, 1,
0.2318275, 1.889401, 0.7779644, 0, 0, 0, 1, 1,
0.2355613, 1.517828, 1.405506, 0, 0, 0, 1, 1,
0.2366568, 1.776183, -0.1589656, 0, 0, 0, 1, 1,
0.2372966, 0.562589, 0.7095993, 0, 0, 0, 1, 1,
0.2381912, -0.08142217, 2.581901, 1, 1, 1, 1, 1,
0.2388684, -1.964758, 1.96327, 1, 1, 1, 1, 1,
0.2483632, -1.064867, 3.352712, 1, 1, 1, 1, 1,
0.2494132, 0.4179181, -0.4246852, 1, 1, 1, 1, 1,
0.2499353, 0.1209325, 1.763494, 1, 1, 1, 1, 1,
0.2508608, -1.231203, 3.303964, 1, 1, 1, 1, 1,
0.2512538, 0.9262327, 0.9114692, 1, 1, 1, 1, 1,
0.2557131, -0.07203297, 3.551115, 1, 1, 1, 1, 1,
0.2557448, 0.7667417, -1.159414, 1, 1, 1, 1, 1,
0.2671123, -0.4887361, 2.313565, 1, 1, 1, 1, 1,
0.2723225, 0.4696225, 1.43125, 1, 1, 1, 1, 1,
0.2724469, -0.6062648, 0.05835, 1, 1, 1, 1, 1,
0.2737456, -1.290859, 1.393708, 1, 1, 1, 1, 1,
0.2747461, -0.4802467, 2.675217, 1, 1, 1, 1, 1,
0.2749309, -2.377992, 2.777788, 1, 1, 1, 1, 1,
0.2813241, -0.6421632, 3.96761, 0, 0, 1, 1, 1,
0.2823094, 1.526045, 1.221943, 1, 0, 0, 1, 1,
0.2855653, 1.222461, 0.1003443, 1, 0, 0, 1, 1,
0.2862628, 0.5100112, 1.194156, 1, 0, 0, 1, 1,
0.2878637, -0.1293475, 1.597129, 1, 0, 0, 1, 1,
0.2952562, 1.384589, 1.375051, 1, 0, 0, 1, 1,
0.2961406, 1.411182, -0.5217286, 0, 0, 0, 1, 1,
0.2981595, -0.3924525, 4.704099, 0, 0, 0, 1, 1,
0.3009086, -2.155881, 0.9714906, 0, 0, 0, 1, 1,
0.3012907, 0.2856809, 0.9740486, 0, 0, 0, 1, 1,
0.3031083, 0.4389324, 0.3132311, 0, 0, 0, 1, 1,
0.3047831, 0.3590819, 1.122763, 0, 0, 0, 1, 1,
0.3051697, -0.4967795, 1.982098, 0, 0, 0, 1, 1,
0.3080202, -1.363627, 1.365164, 1, 1, 1, 1, 1,
0.3082975, -0.9021978, 3.484818, 1, 1, 1, 1, 1,
0.3087804, 0.3059293, 0.7301392, 1, 1, 1, 1, 1,
0.3102763, 1.18368, 1.28359, 1, 1, 1, 1, 1,
0.3106207, 1.106335, -0.2640527, 1, 1, 1, 1, 1,
0.3122506, 0.1435806, 1.858772, 1, 1, 1, 1, 1,
0.3213219, 0.7854538, 0.5428373, 1, 1, 1, 1, 1,
0.3247029, 0.7252415, 1.380816, 1, 1, 1, 1, 1,
0.326145, 1.511205, -0.7057044, 1, 1, 1, 1, 1,
0.3266167, 0.4903812, 2.942743, 1, 1, 1, 1, 1,
0.327056, -1.312494, 2.181724, 1, 1, 1, 1, 1,
0.3273766, -1.177999, 0.1929191, 1, 1, 1, 1, 1,
0.3319505, 0.1480417, -0.6501492, 1, 1, 1, 1, 1,
0.3337417, 1.891183, 0.1448351, 1, 1, 1, 1, 1,
0.3354654, -0.9271547, 2.944136, 1, 1, 1, 1, 1,
0.3398879, 0.0528275, 1.656802, 0, 0, 1, 1, 1,
0.3409661, 1.738594, 1.123959, 1, 0, 0, 1, 1,
0.3442129, -0.06051736, 3.120173, 1, 0, 0, 1, 1,
0.3446414, -0.2442369, 3.383905, 1, 0, 0, 1, 1,
0.3462605, -0.468391, 0.5689948, 1, 0, 0, 1, 1,
0.3528745, 1.552194, -0.8804922, 1, 0, 0, 1, 1,
0.3550458, 0.4233819, 0.4051898, 0, 0, 0, 1, 1,
0.3557077, -0.1478536, 1.961982, 0, 0, 0, 1, 1,
0.3559701, -0.1409695, 3.24783, 0, 0, 0, 1, 1,
0.3580481, -0.02669485, -0.3867423, 0, 0, 0, 1, 1,
0.3586684, -0.441773, 3.291435, 0, 0, 0, 1, 1,
0.36213, 0.09932747, 1.637311, 0, 0, 0, 1, 1,
0.3634913, -0.1465302, 0.03649744, 0, 0, 0, 1, 1,
0.3666024, 1.070338, 0.6954274, 1, 1, 1, 1, 1,
0.3723944, 2.147573, 1.681197, 1, 1, 1, 1, 1,
0.3733324, 0.06110502, 0.3928603, 1, 1, 1, 1, 1,
0.3853826, -0.2219762, 2.326221, 1, 1, 1, 1, 1,
0.3878266, -0.7852085, 2.662306, 1, 1, 1, 1, 1,
0.388836, 0.4354607, 0.7380071, 1, 1, 1, 1, 1,
0.3929771, -1.020431, 3.142507, 1, 1, 1, 1, 1,
0.39494, 0.1393482, 0.4703957, 1, 1, 1, 1, 1,
0.3963243, -0.1737298, 2.16671, 1, 1, 1, 1, 1,
0.4019606, -2.099212, 4.315397, 1, 1, 1, 1, 1,
0.403427, -0.3057017, 2.434325, 1, 1, 1, 1, 1,
0.4052407, 0.5952207, 2.13285, 1, 1, 1, 1, 1,
0.4093136, 2.048195, 0.1979278, 1, 1, 1, 1, 1,
0.413516, -0.538128, 2.26827, 1, 1, 1, 1, 1,
0.4189372, 0.4860293, 0.5411664, 1, 1, 1, 1, 1,
0.4207735, -1.772768, 2.870108, 0, 0, 1, 1, 1,
0.4210726, 0.3878636, 1.74488, 1, 0, 0, 1, 1,
0.4244447, 0.5967452, 0.9463347, 1, 0, 0, 1, 1,
0.4280565, 0.1984932, 2.069076, 1, 0, 0, 1, 1,
0.4287636, 0.2433318, 1.160423, 1, 0, 0, 1, 1,
0.4287963, -0.2992048, 2.286401, 1, 0, 0, 1, 1,
0.4295793, -1.141498, 1.60117, 0, 0, 0, 1, 1,
0.4325139, -1.557996, 2.881038, 0, 0, 0, 1, 1,
0.4339679, -0.6561843, 3.048529, 0, 0, 0, 1, 1,
0.4350722, -0.788684, 3.327387, 0, 0, 0, 1, 1,
0.4371102, -0.4468019, 2.183371, 0, 0, 0, 1, 1,
0.4371229, -1.993289, 2.349573, 0, 0, 0, 1, 1,
0.4385201, 0.7472525, 1.752947, 0, 0, 0, 1, 1,
0.4402876, 1.573345, 0.4591237, 1, 1, 1, 1, 1,
0.44052, -0.4460955, 1.720857, 1, 1, 1, 1, 1,
0.4407803, -1.309867, 2.055612, 1, 1, 1, 1, 1,
0.4407934, -0.5807053, 0.2487945, 1, 1, 1, 1, 1,
0.4415038, -0.2310556, 2.978963, 1, 1, 1, 1, 1,
0.442626, 0.4415997, 1.362496, 1, 1, 1, 1, 1,
0.4483885, -0.5060882, 3.68416, 1, 1, 1, 1, 1,
0.4504836, 1.00373, 0.3910845, 1, 1, 1, 1, 1,
0.4570556, 0.1561376, 1.042209, 1, 1, 1, 1, 1,
0.4619183, 0.1190639, 0.1425393, 1, 1, 1, 1, 1,
0.4661461, -0.7112916, 2.67731, 1, 1, 1, 1, 1,
0.4684209, 0.1281386, -0.7579577, 1, 1, 1, 1, 1,
0.4734539, -1.040054, 1.662857, 1, 1, 1, 1, 1,
0.4759632, 0.9025204, 0.365454, 1, 1, 1, 1, 1,
0.4767282, 0.5588419, -0.006625354, 1, 1, 1, 1, 1,
0.4785932, 0.1055989, 2.363521, 0, 0, 1, 1, 1,
0.4831617, -1.497699, 1.976785, 1, 0, 0, 1, 1,
0.4854625, -0.8599073, 2.777244, 1, 0, 0, 1, 1,
0.4880161, 0.5019585, 0.256164, 1, 0, 0, 1, 1,
0.4880422, 0.1674119, 1.696503, 1, 0, 0, 1, 1,
0.4915146, 0.6551803, -0.08089777, 1, 0, 0, 1, 1,
0.4921409, -0.7215394, 3.129188, 0, 0, 0, 1, 1,
0.4942701, -0.1127476, 2.594308, 0, 0, 0, 1, 1,
0.4967469, 1.073283, 0.6342668, 0, 0, 0, 1, 1,
0.4967889, -1.637122, 2.521435, 0, 0, 0, 1, 1,
0.5004203, 0.7884628, 0.6820056, 0, 0, 0, 1, 1,
0.5024137, -0.3465865, 3.4344, 0, 0, 0, 1, 1,
0.5038339, 0.8571553, -1.671005, 0, 0, 0, 1, 1,
0.5070153, 0.1388887, 3.23283, 1, 1, 1, 1, 1,
0.5070496, 0.3469266, -0.1672283, 1, 1, 1, 1, 1,
0.5087976, -0.7225937, 2.102211, 1, 1, 1, 1, 1,
0.5088958, 0.8104002, 0.774211, 1, 1, 1, 1, 1,
0.5129116, -0.4330514, 1.344545, 1, 1, 1, 1, 1,
0.5152295, 0.3607503, 0.01326756, 1, 1, 1, 1, 1,
0.5175132, -0.02233486, 1.59302, 1, 1, 1, 1, 1,
0.5205727, 0.2755184, 1.314556, 1, 1, 1, 1, 1,
0.5350006, -1.272675, 4.456073, 1, 1, 1, 1, 1,
0.540202, -2.099443, 4.8513, 1, 1, 1, 1, 1,
0.543014, -1.51088, 3.88391, 1, 1, 1, 1, 1,
0.5488425, -0.9770374, 1.93427, 1, 1, 1, 1, 1,
0.5489447, 0.8517687, 1.232389, 1, 1, 1, 1, 1,
0.5496536, -0.6535359, 1.491549, 1, 1, 1, 1, 1,
0.5508671, 0.9174398, -0.3638898, 1, 1, 1, 1, 1,
0.5514553, 0.2843694, 1.380523, 0, 0, 1, 1, 1,
0.5515832, -0.2466143, 2.359832, 1, 0, 0, 1, 1,
0.5523723, -0.2582743, 0.2626416, 1, 0, 0, 1, 1,
0.5591378, 2.942379, -0.7112435, 1, 0, 0, 1, 1,
0.5605567, -0.6348623, 2.145948, 1, 0, 0, 1, 1,
0.5605806, 0.5310469, 0.1433136, 1, 0, 0, 1, 1,
0.5639715, 0.5267411, 0.6868719, 0, 0, 0, 1, 1,
0.5647398, -0.4578618, -0.1608005, 0, 0, 0, 1, 1,
0.5661613, -2.021155, 2.212449, 0, 0, 0, 1, 1,
0.5677066, -2.046912, 2.71284, 0, 0, 0, 1, 1,
0.5682912, -1.476435, 2.993652, 0, 0, 0, 1, 1,
0.569463, 0.8878191, -0.5130373, 0, 0, 0, 1, 1,
0.5708543, -1.854057, 2.04526, 0, 0, 0, 1, 1,
0.5728655, 0.5552989, -1.318381, 1, 1, 1, 1, 1,
0.5741644, 0.4401025, 1.926418, 1, 1, 1, 1, 1,
0.5761954, -0.2874885, 3.565889, 1, 1, 1, 1, 1,
0.5819209, -1.009902, 2.217759, 1, 1, 1, 1, 1,
0.5845797, 0.02533397, 0.7859341, 1, 1, 1, 1, 1,
0.5846214, 0.0045614, 0.5546248, 1, 1, 1, 1, 1,
0.5860748, 0.6675622, 1.847556, 1, 1, 1, 1, 1,
0.588852, -1.247209, 3.259015, 1, 1, 1, 1, 1,
0.6050275, -0.8638833, 3.539431, 1, 1, 1, 1, 1,
0.6054239, 1.131524, -0.370796, 1, 1, 1, 1, 1,
0.6111037, -1.543092, 1.321295, 1, 1, 1, 1, 1,
0.6129732, 1.388165, -0.8731154, 1, 1, 1, 1, 1,
0.6155703, 0.9835002, 2.164151, 1, 1, 1, 1, 1,
0.6196656, 0.5171577, 2.755221, 1, 1, 1, 1, 1,
0.6197531, 0.05415604, 0.9935386, 1, 1, 1, 1, 1,
0.6201012, 0.8290982, 0.2341094, 0, 0, 1, 1, 1,
0.6255037, -0.01662556, 0.9542992, 1, 0, 0, 1, 1,
0.6306147, -1.638419, 2.972538, 1, 0, 0, 1, 1,
0.6315413, -1.924222, 0.9952762, 1, 0, 0, 1, 1,
0.6370113, 2.227684, -0.6892353, 1, 0, 0, 1, 1,
0.6383039, -2.365259, 1.788029, 1, 0, 0, 1, 1,
0.6424265, -1.161418, 2.381627, 0, 0, 0, 1, 1,
0.6439796, -0.3817115, 2.442399, 0, 0, 0, 1, 1,
0.6453984, 1.080816, 0.9533888, 0, 0, 0, 1, 1,
0.6477138, 0.6493567, 1.051011, 0, 0, 0, 1, 1,
0.6500575, 1.686039, 0.2739802, 0, 0, 0, 1, 1,
0.6517102, -0.3855748, 2.978752, 0, 0, 0, 1, 1,
0.6554939, 1.205401, 0.6544003, 0, 0, 0, 1, 1,
0.6578131, -0.2278094, 0.2398436, 1, 1, 1, 1, 1,
0.6580368, -0.8866952, 3.075116, 1, 1, 1, 1, 1,
0.6665986, 0.5549114, 1.021783, 1, 1, 1, 1, 1,
0.6698626, 0.03972951, 3.075499, 1, 1, 1, 1, 1,
0.6712666, 0.8014935, 0.8851185, 1, 1, 1, 1, 1,
0.6713512, -0.02615113, 2.276197, 1, 1, 1, 1, 1,
0.6717974, -0.2457528, 2.730483, 1, 1, 1, 1, 1,
0.6750144, -0.4183262, 3.311627, 1, 1, 1, 1, 1,
0.6770481, 0.007601617, 0.2311196, 1, 1, 1, 1, 1,
0.6840001, -1.1359, 2.724748, 1, 1, 1, 1, 1,
0.68549, 0.3618515, 1.652914, 1, 1, 1, 1, 1,
0.6887434, -0.9906346, 0.04651527, 1, 1, 1, 1, 1,
0.6899529, -0.9438497, 0.785871, 1, 1, 1, 1, 1,
0.6902771, -0.4616945, 2.619201, 1, 1, 1, 1, 1,
0.6924154, -0.7004539, 1.407226, 1, 1, 1, 1, 1,
0.694632, 0.3872261, 0.355162, 0, 0, 1, 1, 1,
0.6947247, 3.010293, 0.5561414, 1, 0, 0, 1, 1,
0.6954417, 1.95153, -0.6979632, 1, 0, 0, 1, 1,
0.6974261, -0.2341135, 0.1483232, 1, 0, 0, 1, 1,
0.6984432, -0.5150613, 2.966267, 1, 0, 0, 1, 1,
0.6984717, 0.01632359, 2.897349, 1, 0, 0, 1, 1,
0.7036923, -1.884143, 1.172981, 0, 0, 0, 1, 1,
0.7175587, -0.7120115, 3.151103, 0, 0, 0, 1, 1,
0.7196724, 1.075639, 0.7239434, 0, 0, 0, 1, 1,
0.7226614, -0.8953405, 2.497405, 0, 0, 0, 1, 1,
0.7252942, 1.125806, 0.1037847, 0, 0, 0, 1, 1,
0.7255746, 1.326785, 0.02291705, 0, 0, 0, 1, 1,
0.7285972, -0.03024889, 2.600259, 0, 0, 0, 1, 1,
0.7320331, -2.419423, 2.554171, 1, 1, 1, 1, 1,
0.7336588, -0.08573635, 2.620399, 1, 1, 1, 1, 1,
0.7342696, -1.994286, 3.174073, 1, 1, 1, 1, 1,
0.7344307, 0.6360992, -0.2895631, 1, 1, 1, 1, 1,
0.7406959, -0.02016827, 0.2517497, 1, 1, 1, 1, 1,
0.7420675, 0.09682086, 1.687704, 1, 1, 1, 1, 1,
0.7434797, 0.7828681, -1.219635, 1, 1, 1, 1, 1,
0.7467413, -0.208693, 1.979583, 1, 1, 1, 1, 1,
0.7474388, -0.2076119, 2.773793, 1, 1, 1, 1, 1,
0.7524782, -1.559188, 1.943751, 1, 1, 1, 1, 1,
0.7635634, 0.2677222, 0.920513, 1, 1, 1, 1, 1,
0.7656084, 0.5817896, 1.876217, 1, 1, 1, 1, 1,
0.7696989, 0.8835558, 1.694301, 1, 1, 1, 1, 1,
0.7734288, 0.05848997, 2.071029, 1, 1, 1, 1, 1,
0.7754472, 1.032193, 1.238474, 1, 1, 1, 1, 1,
0.7788932, -0.5427164, 1.646451, 0, 0, 1, 1, 1,
0.7790198, 0.848621, 2.151268, 1, 0, 0, 1, 1,
0.7795573, 0.7146876, -0.07112847, 1, 0, 0, 1, 1,
0.7820063, -0.4491943, 2.762841, 1, 0, 0, 1, 1,
0.7826072, -0.7151355, 2.631487, 1, 0, 0, 1, 1,
0.7865148, -0.003088422, 2.677563, 1, 0, 0, 1, 1,
0.7904177, 0.375494, 2.026514, 0, 0, 0, 1, 1,
0.7918422, -0.9101831, 2.52076, 0, 0, 0, 1, 1,
0.7947922, 0.02079273, 1.857219, 0, 0, 0, 1, 1,
0.8013726, -1.257541, 1.958435, 0, 0, 0, 1, 1,
0.8027174, -1.371131, 2.349002, 0, 0, 0, 1, 1,
0.8039395, -0.2854884, 2.993536, 0, 0, 0, 1, 1,
0.807415, -0.2397923, 2.721481, 0, 0, 0, 1, 1,
0.8119929, -1.660076, 1.617571, 1, 1, 1, 1, 1,
0.8161455, 1.90045, -0.4033412, 1, 1, 1, 1, 1,
0.8199723, 0.3342986, 1.050055, 1, 1, 1, 1, 1,
0.826781, -0.8726011, 1.994121, 1, 1, 1, 1, 1,
0.826795, 0.3023944, 1.279085, 1, 1, 1, 1, 1,
0.8274618, -0.6303304, -0.1033003, 1, 1, 1, 1, 1,
0.8315507, -0.5054483, 1.026378, 1, 1, 1, 1, 1,
0.8325763, 1.894882, 0.7726122, 1, 1, 1, 1, 1,
0.8361406, -0.09747832, 3.427798, 1, 1, 1, 1, 1,
0.8423243, -0.8322636, 2.584216, 1, 1, 1, 1, 1,
0.8563973, -0.3670557, 2.252609, 1, 1, 1, 1, 1,
0.8681076, -1.20885, 2.879465, 1, 1, 1, 1, 1,
0.8702229, -0.571677, 0.5293993, 1, 1, 1, 1, 1,
0.870347, -1.082505, 2.863565, 1, 1, 1, 1, 1,
0.8731536, -0.2521349, 1.995424, 1, 1, 1, 1, 1,
0.8761512, -0.02397085, 1.327617, 0, 0, 1, 1, 1,
0.8773562, -0.9834592, 2.451555, 1, 0, 0, 1, 1,
0.8777085, -0.6129751, 2.25726, 1, 0, 0, 1, 1,
0.8801849, -1.185794, 3.253158, 1, 0, 0, 1, 1,
0.8828394, -1.122385, 2.079334, 1, 0, 0, 1, 1,
0.8926474, 0.1646517, 0.5305187, 1, 0, 0, 1, 1,
0.9070673, -1.329762, 1.450112, 0, 0, 0, 1, 1,
0.9131789, -0.1597834, 2.954312, 0, 0, 0, 1, 1,
0.9155525, 0.3536605, 2.274688, 0, 0, 0, 1, 1,
0.9253266, 1.584139, -1.922933, 0, 0, 0, 1, 1,
0.9270636, 0.9577479, -1.987716, 0, 0, 0, 1, 1,
0.9292963, -0.03846495, 2.244261, 0, 0, 0, 1, 1,
0.9385908, 0.8886026, -0.2888529, 0, 0, 0, 1, 1,
0.9386572, -0.1623954, 2.601231, 1, 1, 1, 1, 1,
0.9434916, 0.1502228, 0.8278556, 1, 1, 1, 1, 1,
0.9443822, 0.4721299, 2.058951, 1, 1, 1, 1, 1,
0.9449803, -0.08143912, 0.4258629, 1, 1, 1, 1, 1,
0.9455876, 0.5348029, -0.4525034, 1, 1, 1, 1, 1,
0.9461983, -1.383417, 3.310189, 1, 1, 1, 1, 1,
0.9496573, 0.2663316, 1.091831, 1, 1, 1, 1, 1,
0.9547819, 0.7302338, -0.290365, 1, 1, 1, 1, 1,
0.9626031, -0.05554728, 0.7270171, 1, 1, 1, 1, 1,
0.9663765, -0.3263382, 3.6006, 1, 1, 1, 1, 1,
0.9727682, -0.8589926, 1.376822, 1, 1, 1, 1, 1,
0.9779227, 1.846016, 1.023156, 1, 1, 1, 1, 1,
0.9919663, 0.02469167, 3.558113, 1, 1, 1, 1, 1,
1.000909, 0.0277215, 1.54644, 1, 1, 1, 1, 1,
1.007989, 0.5251514, 2.620234, 1, 1, 1, 1, 1,
1.010453, 0.84243, -0.6003591, 0, 0, 1, 1, 1,
1.01792, -0.02441064, 1.490064, 1, 0, 0, 1, 1,
1.022452, 0.7214092, 0.02986434, 1, 0, 0, 1, 1,
1.036077, 0.597241, 1.206042, 1, 0, 0, 1, 1,
1.038251, 1.104964, -0.2197368, 1, 0, 0, 1, 1,
1.038443, -0.7926041, 2.581347, 1, 0, 0, 1, 1,
1.042024, -0.6516259, 2.757816, 0, 0, 0, 1, 1,
1.043835, 0.3153693, 1.933217, 0, 0, 0, 1, 1,
1.045974, -0.2170096, 0.344898, 0, 0, 0, 1, 1,
1.061284, 0.776845, 0.4672701, 0, 0, 0, 1, 1,
1.062978, -0.3490476, 2.90916, 0, 0, 0, 1, 1,
1.064489, 0.7882402, 1.129632, 0, 0, 0, 1, 1,
1.065826, -1.628091, 2.789826, 0, 0, 0, 1, 1,
1.072494, 0.207525, -0.6399228, 1, 1, 1, 1, 1,
1.072981, 1.359813, -0.2323878, 1, 1, 1, 1, 1,
1.091792, -0.6440267, 1.964033, 1, 1, 1, 1, 1,
1.093259, 3.094125, -0.8799155, 1, 1, 1, 1, 1,
1.098236, -1.851871, 3.183537, 1, 1, 1, 1, 1,
1.102503, -0.1161683, 3.635307, 1, 1, 1, 1, 1,
1.112265, -0.7955306, 1.963109, 1, 1, 1, 1, 1,
1.120562, -0.272078, 1.101591, 1, 1, 1, 1, 1,
1.122514, -0.02997927, 1.114618, 1, 1, 1, 1, 1,
1.128693, -0.2681903, 1.622904, 1, 1, 1, 1, 1,
1.132849, 0.2250228, 0.4659109, 1, 1, 1, 1, 1,
1.133381, -0.8462157, 0.8346435, 1, 1, 1, 1, 1,
1.134828, -0.1156037, 1.713544, 1, 1, 1, 1, 1,
1.139176, 0.02823219, 2.974741, 1, 1, 1, 1, 1,
1.15408, 1.723257, -1.722267, 1, 1, 1, 1, 1,
1.15439, -1.194412, 2.922501, 0, 0, 1, 1, 1,
1.175361, 0.2638828, 0.5533838, 1, 0, 0, 1, 1,
1.183398, 1.850265, 0.6823643, 1, 0, 0, 1, 1,
1.187838, -0.4755277, 1.928602, 1, 0, 0, 1, 1,
1.195535, -1.009249, 2.357694, 1, 0, 0, 1, 1,
1.200247, -1.638034, 2.183729, 1, 0, 0, 1, 1,
1.211816, 1.062277, 1.341224, 0, 0, 0, 1, 1,
1.214412, -0.5249487, 2.498089, 0, 0, 0, 1, 1,
1.217081, 0.5688958, 1.659712, 0, 0, 0, 1, 1,
1.218598, -1.447074, 2.464358, 0, 0, 0, 1, 1,
1.235201, -0.6018659, 3.634882, 0, 0, 0, 1, 1,
1.237619, 0.9961702, 0.7924165, 0, 0, 0, 1, 1,
1.238094, -1.174354, 1.563216, 0, 0, 0, 1, 1,
1.241812, -0.1104566, -0.02106964, 1, 1, 1, 1, 1,
1.242183, 0.5437309, 2.160724, 1, 1, 1, 1, 1,
1.244064, -3.386812, 1.572867, 1, 1, 1, 1, 1,
1.255428, 0.4467947, 0.577718, 1, 1, 1, 1, 1,
1.258463, -0.7233109, 2.372935, 1, 1, 1, 1, 1,
1.264504, 1.875832, 0.9366993, 1, 1, 1, 1, 1,
1.270962, 0.761632, 0.3289085, 1, 1, 1, 1, 1,
1.271964, 3.250901, 0.5062451, 1, 1, 1, 1, 1,
1.291418, -0.4226772, 1.058043, 1, 1, 1, 1, 1,
1.29534, -0.9661877, 2.118923, 1, 1, 1, 1, 1,
1.295984, 0.614468, 1.260441, 1, 1, 1, 1, 1,
1.299333, -1.086358, 2.592336, 1, 1, 1, 1, 1,
1.301273, 0.1163268, 0.7934231, 1, 1, 1, 1, 1,
1.304096, -0.2427005, 2.071275, 1, 1, 1, 1, 1,
1.306449, -0.2184917, 1.772309, 1, 1, 1, 1, 1,
1.312507, -2.393357, 3.582016, 0, 0, 1, 1, 1,
1.324602, -1.149032, 3.000918, 1, 0, 0, 1, 1,
1.332534, 1.96197, 1.943131, 1, 0, 0, 1, 1,
1.355531, 2.521372, -0.3252857, 1, 0, 0, 1, 1,
1.363912, -0.2158872, 1.951428, 1, 0, 0, 1, 1,
1.376963, -1.088862, 2.060391, 1, 0, 0, 1, 1,
1.385063, -0.9056197, 2.102537, 0, 0, 0, 1, 1,
1.395277, -0.7667446, 4.151268, 0, 0, 0, 1, 1,
1.398042, -0.3151085, 2.435429, 0, 0, 0, 1, 1,
1.428932, -1.699471, 2.011669, 0, 0, 0, 1, 1,
1.44187, 0.3444162, 3.062108, 0, 0, 0, 1, 1,
1.452334, -0.5357492, 1.80002, 0, 0, 0, 1, 1,
1.468087, 1.319277, 0.4809614, 0, 0, 0, 1, 1,
1.473344, 1.291924, 0.6714651, 1, 1, 1, 1, 1,
1.484071, -1.701207, 3.599229, 1, 1, 1, 1, 1,
1.504231, 2.288113, -1.533581, 1, 1, 1, 1, 1,
1.520762, 0.6119037, 2.034212, 1, 1, 1, 1, 1,
1.533734, -0.5916805, 0.754639, 1, 1, 1, 1, 1,
1.533941, 2.115293, 1.084663, 1, 1, 1, 1, 1,
1.542872, -1.413852, 3.060142, 1, 1, 1, 1, 1,
1.544165, -0.2399829, -0.06603548, 1, 1, 1, 1, 1,
1.553307, -0.555218, 3.359251, 1, 1, 1, 1, 1,
1.577103, -1.703697, 1.872862, 1, 1, 1, 1, 1,
1.584006, -0.1267107, 1.709388, 1, 1, 1, 1, 1,
1.599498, -0.9859593, 1.479841, 1, 1, 1, 1, 1,
1.602295, 0.5454826, 1.664024, 1, 1, 1, 1, 1,
1.604945, 0.1155975, 2.109751, 1, 1, 1, 1, 1,
1.60576, -0.2670433, 1.226172, 1, 1, 1, 1, 1,
1.608847, -0.06126168, 0.5528859, 0, 0, 1, 1, 1,
1.62192, 0.3131883, 0.7163985, 1, 0, 0, 1, 1,
1.6298, 0.3305694, 2.037885, 1, 0, 0, 1, 1,
1.636402, 1.105686, 1.65395, 1, 0, 0, 1, 1,
1.673912, -0.8677883, 1.267986, 1, 0, 0, 1, 1,
1.680336, 0.6770689, 2.534247, 1, 0, 0, 1, 1,
1.72166, 1.094878, 0.632479, 0, 0, 0, 1, 1,
1.731432, 0.6403271, 1.009771, 0, 0, 0, 1, 1,
1.735853, 1.557312, 0.4770448, 0, 0, 0, 1, 1,
1.737823, -0.2514189, 1.320521, 0, 0, 0, 1, 1,
1.743153, 0.1781417, 2.569528, 0, 0, 0, 1, 1,
1.782472, 0.1681286, 1.289956, 0, 0, 0, 1, 1,
1.787301, 0.5749107, 2.305305, 0, 0, 0, 1, 1,
1.787895, 1.42013, 0.2773497, 1, 1, 1, 1, 1,
1.80055, 1.489388, 0.5920279, 1, 1, 1, 1, 1,
1.847653, 0.165832, 1.909138, 1, 1, 1, 1, 1,
1.850456, 0.326531, 1.10132, 1, 1, 1, 1, 1,
1.859291, -0.4294267, 2.429167, 1, 1, 1, 1, 1,
1.868617, 0.3068143, 3.824179, 1, 1, 1, 1, 1,
1.887957, 1.24631, -0.2415407, 1, 1, 1, 1, 1,
1.917874, 2.224711, 1.937814, 1, 1, 1, 1, 1,
1.950438, -0.1496632, 1.0978, 1, 1, 1, 1, 1,
1.953734, -0.6021333, 0.2855067, 1, 1, 1, 1, 1,
1.977269, -1.54596, 1.460664, 1, 1, 1, 1, 1,
2.006027, 0.8709847, 0.5836015, 1, 1, 1, 1, 1,
2.023046, -1.728415, 3.185941, 1, 1, 1, 1, 1,
2.057035, 0.6178736, 0.2995306, 1, 1, 1, 1, 1,
2.063729, -0.2668628, 2.335512, 1, 1, 1, 1, 1,
2.08806, 0.9725022, 0.1266398, 0, 0, 1, 1, 1,
2.095228, -0.5855799, 1.739582, 1, 0, 0, 1, 1,
2.124639, 0.8040156, 1.266279, 1, 0, 0, 1, 1,
2.150628, 0.2946439, 0.5143484, 1, 0, 0, 1, 1,
2.17823, -1.117322, 3.251333, 1, 0, 0, 1, 1,
2.265352, 0.6760227, 2.653118, 1, 0, 0, 1, 1,
2.314076, 1.033884, 1.451888, 0, 0, 0, 1, 1,
2.328282, 1.981275, 3.157812, 0, 0, 0, 1, 1,
2.371026, 1.885239, 0.1612948, 0, 0, 0, 1, 1,
2.395551, 2.214854, 0.8766668, 0, 0, 0, 1, 1,
2.421436, 0.08331846, 2.912603, 0, 0, 0, 1, 1,
2.457064, -1.37174, 1.761823, 0, 0, 0, 1, 1,
2.470236, 1.35149, -1.800579, 0, 0, 0, 1, 1,
2.475877, -1.184232, 1.081525, 1, 1, 1, 1, 1,
2.684496, 1.353153, 1.735823, 1, 1, 1, 1, 1,
2.767553, 0.6688757, 1.317888, 1, 1, 1, 1, 1,
2.775404, 0.2228023, 1.079511, 1, 1, 1, 1, 1,
2.803359, -0.4277791, 2.574843, 1, 1, 1, 1, 1,
3.014779, -0.1832707, 2.35339, 1, 1, 1, 1, 1,
3.22472, 0.6803151, 1.731417, 1, 1, 1, 1, 1
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
var radius = 9.873195;
var distance = 34.67918;
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
mvMatrix.translate( 0.03837085, 0.06795549, -0.2845209 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.67918);
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
