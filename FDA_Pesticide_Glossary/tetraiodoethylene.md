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
-3.348983, -0.9801872, -3.464687, 1, 0, 0, 1,
-3.332643, -0.2875008, -0.3946487, 1, 0.007843138, 0, 1,
-3.184684, -1.430149, -2.770288, 1, 0.01176471, 0, 1,
-2.753762, -0.786544, -1.658235, 1, 0.01960784, 0, 1,
-2.581658, 1.184267, 0.4632661, 1, 0.02352941, 0, 1,
-2.450486, -0.3990123, -0.8712434, 1, 0.03137255, 0, 1,
-2.427483, -0.7527627, -1.311963, 1, 0.03529412, 0, 1,
-2.349417, -0.0904454, -1.140003, 1, 0.04313726, 0, 1,
-2.335435, -1.922348, -0.6205539, 1, 0.04705882, 0, 1,
-2.321541, 0.6124694, -1.88877, 1, 0.05490196, 0, 1,
-2.310201, -1.947322, -2.007338, 1, 0.05882353, 0, 1,
-2.30437, -1.922005, -2.678821, 1, 0.06666667, 0, 1,
-2.24517, 0.1420428, -0.7761541, 1, 0.07058824, 0, 1,
-2.238955, 0.9466642, -1.845939, 1, 0.07843138, 0, 1,
-2.235411, 0.713244, -1.024961, 1, 0.08235294, 0, 1,
-2.220395, -0.360847, -1.754019, 1, 0.09019608, 0, 1,
-2.146211, 0.3750963, -1.04426, 1, 0.09411765, 0, 1,
-2.12431, 0.3322796, 0.4496824, 1, 0.1019608, 0, 1,
-2.094786, -2.703918, -1.683103, 1, 0.1098039, 0, 1,
-2.079437, -0.77333, -2.766633, 1, 0.1137255, 0, 1,
-2.055937, -0.3471666, -2.550202, 1, 0.1215686, 0, 1,
-2.052032, 2.437971, -0.4577032, 1, 0.1254902, 0, 1,
-1.990922, -1.278773, -2.896176, 1, 0.1333333, 0, 1,
-1.985837, -0.4771217, -4.328232, 1, 0.1372549, 0, 1,
-1.952167, 0.02638934, -1.433028, 1, 0.145098, 0, 1,
-1.944796, 0.509859, -1.191251, 1, 0.1490196, 0, 1,
-1.895521, 0.7114058, -1.583326, 1, 0.1568628, 0, 1,
-1.89501, 0.5255091, -3.453599, 1, 0.1607843, 0, 1,
-1.892118, 0.4319686, -0.6817994, 1, 0.1686275, 0, 1,
-1.872285, 0.357329, -1.425884, 1, 0.172549, 0, 1,
-1.870036, 0.07976622, -1.68563, 1, 0.1803922, 0, 1,
-1.863238, -0.7157755, -2.030421, 1, 0.1843137, 0, 1,
-1.859022, -1.364242, -3.430632, 1, 0.1921569, 0, 1,
-1.855937, -0.18095, -2.147708, 1, 0.1960784, 0, 1,
-1.841103, -0.1372282, -0.14135, 1, 0.2039216, 0, 1,
-1.827776, -1.317783, -3.402774, 1, 0.2117647, 0, 1,
-1.800985, -0.9360535, -2.749987, 1, 0.2156863, 0, 1,
-1.799545, -0.5906255, -2.469166, 1, 0.2235294, 0, 1,
-1.794731, -0.3404666, 0.2672472, 1, 0.227451, 0, 1,
-1.782928, -0.2512642, 0.6030226, 1, 0.2352941, 0, 1,
-1.755727, -1.492903, -2.018766, 1, 0.2392157, 0, 1,
-1.712523, -0.5578098, 0.4286813, 1, 0.2470588, 0, 1,
-1.691888, 1.633473, -0.2678345, 1, 0.2509804, 0, 1,
-1.691599, -0.2132798, -3.080988, 1, 0.2588235, 0, 1,
-1.67699, -0.01081048, -3.78142, 1, 0.2627451, 0, 1,
-1.676185, -0.611755, -3.811783, 1, 0.2705882, 0, 1,
-1.662915, -1.380259, -1.805227, 1, 0.2745098, 0, 1,
-1.651522, 0.6755338, -2.746666, 1, 0.282353, 0, 1,
-1.640824, -1.756444, -1.190464, 1, 0.2862745, 0, 1,
-1.625861, -0.3234184, -1.61076, 1, 0.2941177, 0, 1,
-1.594924, -0.6140578, -1.247775, 1, 0.3019608, 0, 1,
-1.587271, 1.081869, -0.9163617, 1, 0.3058824, 0, 1,
-1.572509, 0.0219919, -2.450523, 1, 0.3137255, 0, 1,
-1.553073, 0.6751955, 0.3536771, 1, 0.3176471, 0, 1,
-1.551105, -0.3492656, -1.797673, 1, 0.3254902, 0, 1,
-1.542075, 0.5533541, -0.7673993, 1, 0.3294118, 0, 1,
-1.540902, 0.4204546, -0.5895467, 1, 0.3372549, 0, 1,
-1.511522, -0.4068901, -0.1276796, 1, 0.3411765, 0, 1,
-1.510679, 0.2057892, -1.600228, 1, 0.3490196, 0, 1,
-1.50693, 0.4485848, -0.5119023, 1, 0.3529412, 0, 1,
-1.503425, -0.5083407, -1.829474, 1, 0.3607843, 0, 1,
-1.495712, 1.258166, -1.408267, 1, 0.3647059, 0, 1,
-1.482385, -0.06363267, -0.9271963, 1, 0.372549, 0, 1,
-1.462449, 0.5136005, -1.368272, 1, 0.3764706, 0, 1,
-1.450354, -0.1670406, -1.330567, 1, 0.3843137, 0, 1,
-1.446816, 0.5261475, -0.01972227, 1, 0.3882353, 0, 1,
-1.445942, -1.514588, -0.9161922, 1, 0.3960784, 0, 1,
-1.44301, -0.061731, -1.019894, 1, 0.4039216, 0, 1,
-1.43998, 0.08050348, -1.249507, 1, 0.4078431, 0, 1,
-1.434313, -0.4335773, -2.002253, 1, 0.4156863, 0, 1,
-1.427745, -0.3010028, -3.306641, 1, 0.4196078, 0, 1,
-1.426505, -0.2627948, -0.9533845, 1, 0.427451, 0, 1,
-1.413832, -0.4802877, -1.933012, 1, 0.4313726, 0, 1,
-1.412076, 0.9197216, -0.9117485, 1, 0.4392157, 0, 1,
-1.409406, 1.395168, -0.9389237, 1, 0.4431373, 0, 1,
-1.403718, -0.02827587, -1.173912, 1, 0.4509804, 0, 1,
-1.382791, 0.2105478, -2.231495, 1, 0.454902, 0, 1,
-1.366929, -0.1406207, -0.07184114, 1, 0.4627451, 0, 1,
-1.360496, 0.4630141, -0.4758681, 1, 0.4666667, 0, 1,
-1.348135, -1.363687, -3.096284, 1, 0.4745098, 0, 1,
-1.33742, 0.4797687, 0.559459, 1, 0.4784314, 0, 1,
-1.331783, -0.01614586, -2.138016, 1, 0.4862745, 0, 1,
-1.327122, 0.1300985, -1.371487, 1, 0.4901961, 0, 1,
-1.324594, 1.703075, -1.703695, 1, 0.4980392, 0, 1,
-1.312129, 0.4720651, -1.492063, 1, 0.5058824, 0, 1,
-1.308822, -0.2436868, -1.340052, 1, 0.509804, 0, 1,
-1.303242, -1.299011, -3.22802, 1, 0.5176471, 0, 1,
-1.297282, 0.3600388, -3.351933, 1, 0.5215687, 0, 1,
-1.296679, 1.05799, -0.2107668, 1, 0.5294118, 0, 1,
-1.291669, 1.532029, -0.6147587, 1, 0.5333334, 0, 1,
-1.26755, 0.7912529, -2.124231, 1, 0.5411765, 0, 1,
-1.266816, -0.3188738, -1.00232, 1, 0.5450981, 0, 1,
-1.263896, -1.944573, -2.901286, 1, 0.5529412, 0, 1,
-1.260306, 0.07726754, -1.870208, 1, 0.5568628, 0, 1,
-1.260229, 0.1672391, 0.4087187, 1, 0.5647059, 0, 1,
-1.260208, 0.7585862, -1.209448, 1, 0.5686275, 0, 1,
-1.259525, 0.246389, -3.472983, 1, 0.5764706, 0, 1,
-1.256438, 1.19603, -0.3032613, 1, 0.5803922, 0, 1,
-1.255295, 3.230164, 0.2121032, 1, 0.5882353, 0, 1,
-1.249061, 0.09299379, -1.797738, 1, 0.5921569, 0, 1,
-1.240912, 0.177608, -2.456166, 1, 0.6, 0, 1,
-1.240145, 0.394872, -3.594805, 1, 0.6078432, 0, 1,
-1.239156, -1.154346, -0.3555998, 1, 0.6117647, 0, 1,
-1.236469, -0.5434773, -2.369355, 1, 0.6196079, 0, 1,
-1.232743, 0.7697944, -1.02655, 1, 0.6235294, 0, 1,
-1.232613, 0.6080362, -1.076527, 1, 0.6313726, 0, 1,
-1.22744, -0.08765591, -0.8177249, 1, 0.6352941, 0, 1,
-1.217504, 1.802587, -1.35368, 1, 0.6431373, 0, 1,
-1.207044, -1.362635, 0.1591516, 1, 0.6470588, 0, 1,
-1.200246, -0.2249566, -1.664089, 1, 0.654902, 0, 1,
-1.19068, -0.7364652, -2.519414, 1, 0.6588235, 0, 1,
-1.166791, 0.3939763, -1.45901, 1, 0.6666667, 0, 1,
-1.16527, 1.639264, 0.03331816, 1, 0.6705883, 0, 1,
-1.164991, 0.5924922, -2.104741, 1, 0.6784314, 0, 1,
-1.164894, 0.045251, -1.64982, 1, 0.682353, 0, 1,
-1.164232, -2.348158, -4.132633, 1, 0.6901961, 0, 1,
-1.163167, 0.2264375, -1.437863, 1, 0.6941177, 0, 1,
-1.161887, -0.7703029, -2.390429, 1, 0.7019608, 0, 1,
-1.159795, 0.2682156, -1.665226, 1, 0.7098039, 0, 1,
-1.154252, -0.8005624, -3.21976, 1, 0.7137255, 0, 1,
-1.140032, -1.678855, -3.488961, 1, 0.7215686, 0, 1,
-1.132865, -0.3320175, -3.250399, 1, 0.7254902, 0, 1,
-1.130271, -1.103752, -4.389194, 1, 0.7333333, 0, 1,
-1.127753, -0.3371798, -1.322604, 1, 0.7372549, 0, 1,
-1.125962, -0.05417411, -0.1567894, 1, 0.7450981, 0, 1,
-1.124323, 0.02138719, -1.305109, 1, 0.7490196, 0, 1,
-1.12148, 0.6528552, -0.7914292, 1, 0.7568628, 0, 1,
-1.118552, 0.3734062, -3.135025, 1, 0.7607843, 0, 1,
-1.113823, 1.375168, -1.545271, 1, 0.7686275, 0, 1,
-1.113711, -1.838729, -0.8651811, 1, 0.772549, 0, 1,
-1.107928, -0.7024471, -1.960794, 1, 0.7803922, 0, 1,
-1.103603, -0.953598, -2.502979, 1, 0.7843137, 0, 1,
-1.103272, 1.172297, -0.8456621, 1, 0.7921569, 0, 1,
-1.086583, -0.07503548, -2.962512, 1, 0.7960784, 0, 1,
-1.083392, 0.3992327, -3.016814, 1, 0.8039216, 0, 1,
-1.083082, 1.027234, -0.6603015, 1, 0.8117647, 0, 1,
-1.080381, -0.01028976, -1.873131, 1, 0.8156863, 0, 1,
-1.073532, 0.3752085, -2.298111, 1, 0.8235294, 0, 1,
-1.070435, 0.1093302, -1.261957, 1, 0.827451, 0, 1,
-1.066365, 1.202758, -1.004728, 1, 0.8352941, 0, 1,
-1.06361, -1.871306, -0.6177365, 1, 0.8392157, 0, 1,
-1.063318, 0.5728071, -0.1742012, 1, 0.8470588, 0, 1,
-1.053235, -0.7073562, -2.086896, 1, 0.8509804, 0, 1,
-1.052686, -0.03185501, -1.522432, 1, 0.8588235, 0, 1,
-1.05183, 0.04751609, -1.963862, 1, 0.8627451, 0, 1,
-1.050879, 0.7981228, -0.4582817, 1, 0.8705882, 0, 1,
-1.04143, -0.4575265, -3.048075, 1, 0.8745098, 0, 1,
-1.039559, -0.1925305, -1.35416, 1, 0.8823529, 0, 1,
-1.032536, 0.8153113, 0.4236096, 1, 0.8862745, 0, 1,
-1.025023, -0.149743, -0.006249064, 1, 0.8941177, 0, 1,
-1.010641, 0.2084525, 0.3361695, 1, 0.8980392, 0, 1,
-1.004857, 0.1150081, 0.3974563, 1, 0.9058824, 0, 1,
-0.9952733, -0.7064579, -3.45651, 1, 0.9137255, 0, 1,
-0.9752571, -0.4738051, -2.431576, 1, 0.9176471, 0, 1,
-0.9748514, -0.01358511, 0.3744883, 1, 0.9254902, 0, 1,
-0.9736543, -0.6765233, -3.679451, 1, 0.9294118, 0, 1,
-0.9715554, -0.8811179, -0.2304076, 1, 0.9372549, 0, 1,
-0.9670231, -0.4561304, -1.812844, 1, 0.9411765, 0, 1,
-0.9657992, 0.3512996, -2.935723, 1, 0.9490196, 0, 1,
-0.9609233, -0.05589875, -2.074248, 1, 0.9529412, 0, 1,
-0.9604686, 0.727661, -0.374497, 1, 0.9607843, 0, 1,
-0.952934, 0.2266322, -0.9379844, 1, 0.9647059, 0, 1,
-0.9420483, -0.05119225, -2.921948, 1, 0.972549, 0, 1,
-0.9410906, 0.5627497, -1.871218, 1, 0.9764706, 0, 1,
-0.9294821, 0.1318084, -1.114867, 1, 0.9843137, 0, 1,
-0.9280562, -1.354379, -3.519986, 1, 0.9882353, 0, 1,
-0.9169179, -0.8885033, -1.309858, 1, 0.9960784, 0, 1,
-0.9137736, -0.2576923, -1.423896, 0.9960784, 1, 0, 1,
-0.9133406, -0.0555911, -1.339419, 0.9921569, 1, 0, 1,
-0.9022357, -0.002525917, -3.599185, 0.9843137, 1, 0, 1,
-0.9005523, 0.7469122, 0.1058856, 0.9803922, 1, 0, 1,
-0.899249, 0.4306418, -0.9380682, 0.972549, 1, 0, 1,
-0.8981706, 1.627599, -0.717127, 0.9686275, 1, 0, 1,
-0.8968791, 0.106494, -1.700303, 0.9607843, 1, 0, 1,
-0.8909331, -0.4360053, -2.686054, 0.9568627, 1, 0, 1,
-0.8876421, -1.985397, -3.404455, 0.9490196, 1, 0, 1,
-0.8775211, -0.3578714, -2.918433, 0.945098, 1, 0, 1,
-0.8590285, -0.9960508, -2.891675, 0.9372549, 1, 0, 1,
-0.853889, 0.6186322, 0.4034989, 0.9333333, 1, 0, 1,
-0.8489521, -0.7016718, -2.731881, 0.9254902, 1, 0, 1,
-0.8351797, -1.091583, -2.028199, 0.9215686, 1, 0, 1,
-0.8348643, 0.2477208, -2.025961, 0.9137255, 1, 0, 1,
-0.8323236, -1.054567, -3.729303, 0.9098039, 1, 0, 1,
-0.8284824, 1.755805, -0.1364373, 0.9019608, 1, 0, 1,
-0.8234034, -1.546026, -2.231079, 0.8941177, 1, 0, 1,
-0.8218008, 1.718488, 0.7411066, 0.8901961, 1, 0, 1,
-0.8032839, -0.6214642, -2.229279, 0.8823529, 1, 0, 1,
-0.8028153, 0.6338139, 0.2448531, 0.8784314, 1, 0, 1,
-0.8013168, -1.282846, -2.778747, 0.8705882, 1, 0, 1,
-0.8000873, -0.8181021, -1.691199, 0.8666667, 1, 0, 1,
-0.7931162, -0.09360701, -3.211054, 0.8588235, 1, 0, 1,
-0.7903678, -0.1562042, -1.858992, 0.854902, 1, 0, 1,
-0.7884964, 2.015225, 0.3541327, 0.8470588, 1, 0, 1,
-0.7817692, -1.642662, -4.710766, 0.8431373, 1, 0, 1,
-0.778904, 0.7786071, -2.307692, 0.8352941, 1, 0, 1,
-0.7747687, -0.5552307, -1.070101, 0.8313726, 1, 0, 1,
-0.7695512, 0.8908197, -2.345411, 0.8235294, 1, 0, 1,
-0.769121, 1.353501, -1.017045, 0.8196079, 1, 0, 1,
-0.7636185, 0.7467483, 0.2313643, 0.8117647, 1, 0, 1,
-0.7623942, 1.319919, 0.009496624, 0.8078431, 1, 0, 1,
-0.7560996, 1.385906, -0.4757209, 0.8, 1, 0, 1,
-0.7526342, 1.095713, -0.3933786, 0.7921569, 1, 0, 1,
-0.7396528, 0.3267855, -0.2947149, 0.7882353, 1, 0, 1,
-0.7306734, 0.8075169, -1.521726, 0.7803922, 1, 0, 1,
-0.7300199, -0.5493057, -2.560794, 0.7764706, 1, 0, 1,
-0.7125522, 0.5041189, -2.858183, 0.7686275, 1, 0, 1,
-0.711451, -0.1223689, -3.465628, 0.7647059, 1, 0, 1,
-0.7105365, -0.02736669, -0.6978464, 0.7568628, 1, 0, 1,
-0.7091251, -0.07776751, -0.2017472, 0.7529412, 1, 0, 1,
-0.7089202, 1.515956, -1.001632, 0.7450981, 1, 0, 1,
-0.7078525, 0.9130787, -0.8623337, 0.7411765, 1, 0, 1,
-0.7061298, -0.75392, -2.974886, 0.7333333, 1, 0, 1,
-0.7054988, -0.115856, -1.426709, 0.7294118, 1, 0, 1,
-0.7049189, 0.7764788, -1.276011, 0.7215686, 1, 0, 1,
-0.6982909, -1.361985, -2.817985, 0.7176471, 1, 0, 1,
-0.6980728, 0.3693771, -2.445455, 0.7098039, 1, 0, 1,
-0.6926727, -1.089905, -2.315519, 0.7058824, 1, 0, 1,
-0.6898403, -0.5690316, -1.88519, 0.6980392, 1, 0, 1,
-0.6867293, 1.834922, 0.1700055, 0.6901961, 1, 0, 1,
-0.682901, 0.3709427, -1.205883, 0.6862745, 1, 0, 1,
-0.6821808, -0.9940262, -3.33618, 0.6784314, 1, 0, 1,
-0.6781729, 0.2529342, -0.9843143, 0.6745098, 1, 0, 1,
-0.6727595, 0.1038856, -1.558268, 0.6666667, 1, 0, 1,
-0.6726158, -1.211692, -2.307796, 0.6627451, 1, 0, 1,
-0.6716504, 0.5024616, -0.539635, 0.654902, 1, 0, 1,
-0.6699292, -1.429203, -3.106653, 0.6509804, 1, 0, 1,
-0.6657444, -0.318302, -1.36784, 0.6431373, 1, 0, 1,
-0.6644123, -1.228255, -1.762768, 0.6392157, 1, 0, 1,
-0.663914, 2.226162, -2.081003, 0.6313726, 1, 0, 1,
-0.6599658, -0.7603923, -3.067846, 0.627451, 1, 0, 1,
-0.6566939, 0.4886412, 0.3244487, 0.6196079, 1, 0, 1,
-0.6565327, 0.9326993, -0.9220098, 0.6156863, 1, 0, 1,
-0.6505119, -0.9481604, -1.220157, 0.6078432, 1, 0, 1,
-0.6485154, 1.046449, -0.3763593, 0.6039216, 1, 0, 1,
-0.6462265, -0.6391276, -3.384791, 0.5960785, 1, 0, 1,
-0.6435244, 0.8025879, -1.423587, 0.5882353, 1, 0, 1,
-0.6335205, -1.643997, -3.137016, 0.5843138, 1, 0, 1,
-0.6315532, 0.949247, -0.9548744, 0.5764706, 1, 0, 1,
-0.6315468, 0.5982075, 0.7320589, 0.572549, 1, 0, 1,
-0.6259401, 0.3269599, 0.7209721, 0.5647059, 1, 0, 1,
-0.6202821, -0.5416991, -4.592796, 0.5607843, 1, 0, 1,
-0.6182435, 0.2503585, -0.5611196, 0.5529412, 1, 0, 1,
-0.6090753, -1.001243, -2.191107, 0.5490196, 1, 0, 1,
-0.5940772, 1.139961, 1.262069, 0.5411765, 1, 0, 1,
-0.5893152, 0.2438492, -1.364443, 0.5372549, 1, 0, 1,
-0.5865216, 0.0160383, -0.6621696, 0.5294118, 1, 0, 1,
-0.5830793, 0.9329602, -0.8838742, 0.5254902, 1, 0, 1,
-0.581802, -1.949406, -2.536093, 0.5176471, 1, 0, 1,
-0.5748186, 0.3529748, -0.2353576, 0.5137255, 1, 0, 1,
-0.5718477, -0.02710916, -2.337387, 0.5058824, 1, 0, 1,
-0.5715932, 0.5419474, -0.4062712, 0.5019608, 1, 0, 1,
-0.5714484, 0.06495129, -2.282936, 0.4941176, 1, 0, 1,
-0.5700132, 1.24242, -0.6725367, 0.4862745, 1, 0, 1,
-0.5665872, 0.4726905, 0.1515675, 0.4823529, 1, 0, 1,
-0.5651521, -0.6423306, -1.330174, 0.4745098, 1, 0, 1,
-0.5643709, 0.07042837, -1.304664, 0.4705882, 1, 0, 1,
-0.5635032, 0.6766098, -1.030371, 0.4627451, 1, 0, 1,
-0.5583259, -0.4811647, -1.389274, 0.4588235, 1, 0, 1,
-0.5531126, -0.7228273, -2.59877, 0.4509804, 1, 0, 1,
-0.5512235, -0.06833149, -0.5332274, 0.4470588, 1, 0, 1,
-0.5509024, 1.923664, 1.023226, 0.4392157, 1, 0, 1,
-0.5451032, 1.835659, -1.517424, 0.4352941, 1, 0, 1,
-0.5439641, -0.1745062, -1.085944, 0.427451, 1, 0, 1,
-0.5364341, 0.2722946, -2.449558, 0.4235294, 1, 0, 1,
-0.536118, 1.273558, -0.0303019, 0.4156863, 1, 0, 1,
-0.5322344, 0.1915482, -0.5599335, 0.4117647, 1, 0, 1,
-0.5313385, -0.01560297, -0.3580862, 0.4039216, 1, 0, 1,
-0.528943, -0.4688674, -3.373054, 0.3960784, 1, 0, 1,
-0.527928, -0.5947284, -3.658062, 0.3921569, 1, 0, 1,
-0.5274005, 0.1237158, -0.02285456, 0.3843137, 1, 0, 1,
-0.5258108, -0.3664584, -1.043255, 0.3803922, 1, 0, 1,
-0.5240775, 1.081929, -1.153218, 0.372549, 1, 0, 1,
-0.5099429, -0.1404927, -0.933099, 0.3686275, 1, 0, 1,
-0.5079536, -0.02524867, -2.01788, 0.3607843, 1, 0, 1,
-0.5079259, -1.233473, -4.572575, 0.3568628, 1, 0, 1,
-0.50391, 1.023651, -1.017077, 0.3490196, 1, 0, 1,
-0.5030279, 0.584964, -1.291643, 0.345098, 1, 0, 1,
-0.5022046, -0.1918853, -2.833943, 0.3372549, 1, 0, 1,
-0.4957708, -1.264366, -3.123548, 0.3333333, 1, 0, 1,
-0.4920669, -0.2118217, -2.893711, 0.3254902, 1, 0, 1,
-0.4862137, 0.1595984, -1.430038, 0.3215686, 1, 0, 1,
-0.4818023, -0.7601964, -1.403457, 0.3137255, 1, 0, 1,
-0.4744414, -0.1972461, -0.3874596, 0.3098039, 1, 0, 1,
-0.4732277, -0.5631159, -3.758933, 0.3019608, 1, 0, 1,
-0.4725107, -1.21592, -1.843415, 0.2941177, 1, 0, 1,
-0.4685596, -0.8188501, -3.525642, 0.2901961, 1, 0, 1,
-0.4676884, 0.4606743, -1.827811, 0.282353, 1, 0, 1,
-0.4671068, -0.6588508, -2.902198, 0.2784314, 1, 0, 1,
-0.464905, 0.6018268, 0.4406318, 0.2705882, 1, 0, 1,
-0.4606147, -1.097277, -1.26823, 0.2666667, 1, 0, 1,
-0.459793, -0.6229053, -3.90809, 0.2588235, 1, 0, 1,
-0.4590851, -1.320033, -1.353587, 0.254902, 1, 0, 1,
-0.4570749, 1.045714, 0.1370643, 0.2470588, 1, 0, 1,
-0.4515228, -0.409286, -5.681196, 0.2431373, 1, 0, 1,
-0.4506011, -0.3682121, -2.371371, 0.2352941, 1, 0, 1,
-0.4480869, 1.874667, 0.08581432, 0.2313726, 1, 0, 1,
-0.4459847, 0.2629953, 1.138889, 0.2235294, 1, 0, 1,
-0.4459664, 0.2828465, 0.02075351, 0.2196078, 1, 0, 1,
-0.4452638, -0.7863536, -1.645579, 0.2117647, 1, 0, 1,
-0.4452632, -0.3263644, -2.059354, 0.2078431, 1, 0, 1,
-0.4444122, 0.06081782, -3.587392, 0.2, 1, 0, 1,
-0.4433176, 0.1514752, 0.698981, 0.1921569, 1, 0, 1,
-0.4371578, 0.8995158, -0.5004177, 0.1882353, 1, 0, 1,
-0.4361779, 0.7171664, -0.272089, 0.1803922, 1, 0, 1,
-0.4338107, 0.9953961, 1.48052, 0.1764706, 1, 0, 1,
-0.4318231, 2.102233, 0.2044491, 0.1686275, 1, 0, 1,
-0.431424, 0.1369846, -2.260883, 0.1647059, 1, 0, 1,
-0.4313114, 0.4713562, -0.8687913, 0.1568628, 1, 0, 1,
-0.4230656, -0.3209719, -3.017167, 0.1529412, 1, 0, 1,
-0.4211478, -0.3274971, -1.952902, 0.145098, 1, 0, 1,
-0.4200392, 1.369271, -2.42981, 0.1411765, 1, 0, 1,
-0.4186171, -1.50502, -3.322875, 0.1333333, 1, 0, 1,
-0.4060495, -0.33442, 0.9768065, 0.1294118, 1, 0, 1,
-0.4057587, -0.2740638, -2.496751, 0.1215686, 1, 0, 1,
-0.4041493, -0.3578089, -2.81135, 0.1176471, 1, 0, 1,
-0.4023211, -0.746774, -1.235424, 0.1098039, 1, 0, 1,
-0.4023049, 0.1352383, -1.972311, 0.1058824, 1, 0, 1,
-0.4020587, -0.6667069, -3.158142, 0.09803922, 1, 0, 1,
-0.3985977, -0.8980469, -3.656662, 0.09019608, 1, 0, 1,
-0.3959732, 0.5298426, -1.259542, 0.08627451, 1, 0, 1,
-0.3887421, -0.6327142, -1.24952, 0.07843138, 1, 0, 1,
-0.3884247, 0.7247638, 0.9392216, 0.07450981, 1, 0, 1,
-0.3796987, -0.2293874, -2.498547, 0.06666667, 1, 0, 1,
-0.3776747, 0.7119638, -2.009372, 0.0627451, 1, 0, 1,
-0.3668634, 0.5175657, -0.9910044, 0.05490196, 1, 0, 1,
-0.3665986, 0.731445, -0.2124641, 0.05098039, 1, 0, 1,
-0.3635238, 2.961372, 1.697937, 0.04313726, 1, 0, 1,
-0.3635212, -1.36582, -1.944347, 0.03921569, 1, 0, 1,
-0.3612531, 0.7058095, 0.7927878, 0.03137255, 1, 0, 1,
-0.356135, 2.066062, 1.092929, 0.02745098, 1, 0, 1,
-0.3546807, 0.04890149, -2.576879, 0.01960784, 1, 0, 1,
-0.3513364, 1.434745, -1.187819, 0.01568628, 1, 0, 1,
-0.351025, -0.2536187, -0.873541, 0.007843138, 1, 0, 1,
-0.350809, 1.28076, 0.01059011, 0.003921569, 1, 0, 1,
-0.349539, 1.585563, -0.9205151, 0, 1, 0.003921569, 1,
-0.3454404, 1.544888, 0.8872542, 0, 1, 0.01176471, 1,
-0.3442113, 1.408487, -0.1758744, 0, 1, 0.01568628, 1,
-0.3435322, 0.4538113, 0.7306346, 0, 1, 0.02352941, 1,
-0.3430586, -1.007294, -2.012411, 0, 1, 0.02745098, 1,
-0.3427171, -1.260744, -1.969878, 0, 1, 0.03529412, 1,
-0.340569, -1.162504, -4.034404, 0, 1, 0.03921569, 1,
-0.3368841, -0.008733445, -3.084578, 0, 1, 0.04705882, 1,
-0.3366747, 0.4110995, -2.690757, 0, 1, 0.05098039, 1,
-0.3355094, -1.417948, -3.943283, 0, 1, 0.05882353, 1,
-0.3353601, -1.281064, -2.680563, 0, 1, 0.0627451, 1,
-0.3337986, -0.2982342, -2.71011, 0, 1, 0.07058824, 1,
-0.3324519, 0.4918802, -1.014129, 0, 1, 0.07450981, 1,
-0.3312029, -1.421747, -3.078911, 0, 1, 0.08235294, 1,
-0.325289, -0.4175745, -2.721784, 0, 1, 0.08627451, 1,
-0.3220987, -0.2442559, -1.957279, 0, 1, 0.09411765, 1,
-0.3203337, 0.6879618, 0.1164557, 0, 1, 0.1019608, 1,
-0.3135698, -1.031037, -3.23378, 0, 1, 0.1058824, 1,
-0.3111184, -0.442297, -1.1514, 0, 1, 0.1137255, 1,
-0.3107014, -0.4969675, -1.814548, 0, 1, 0.1176471, 1,
-0.303687, 0.08652867, -0.722027, 0, 1, 0.1254902, 1,
-0.3013871, 1.824659, -0.4520536, 0, 1, 0.1294118, 1,
-0.3009346, 1.012303, 0.002637765, 0, 1, 0.1372549, 1,
-0.2998945, -1.552436, -2.573148, 0, 1, 0.1411765, 1,
-0.2953844, -2.150392, -4.752084, 0, 1, 0.1490196, 1,
-0.2931159, 1.386457, 0.8227283, 0, 1, 0.1529412, 1,
-0.2920615, -1.234278, -1.492244, 0, 1, 0.1607843, 1,
-0.2873473, 0.271172, -0.8884439, 0, 1, 0.1647059, 1,
-0.2795656, -0.4988821, -1.995251, 0, 1, 0.172549, 1,
-0.2794527, 0.2115889, -0.6364353, 0, 1, 0.1764706, 1,
-0.2780995, -1.602506, -3.281815, 0, 1, 0.1843137, 1,
-0.2770795, -0.8803709, -4.142604, 0, 1, 0.1882353, 1,
-0.2735006, 0.2632343, -2.302514, 0, 1, 0.1960784, 1,
-0.2730627, -0.9331815, -1.145833, 0, 1, 0.2039216, 1,
-0.273059, 0.3032637, -0.4116246, 0, 1, 0.2078431, 1,
-0.2718161, -0.224171, -1.913703, 0, 1, 0.2156863, 1,
-0.2703373, -1.656772, -2.48487, 0, 1, 0.2196078, 1,
-0.2680667, 0.1375351, -2.30991, 0, 1, 0.227451, 1,
-0.2663256, -0.5147832, -3.172495, 0, 1, 0.2313726, 1,
-0.26528, 0.857464, -1.772152, 0, 1, 0.2392157, 1,
-0.2649663, -0.3981872, -2.122475, 0, 1, 0.2431373, 1,
-0.2636745, -0.07525842, -1.272075, 0, 1, 0.2509804, 1,
-0.259277, -0.4117051, -2.289829, 0, 1, 0.254902, 1,
-0.2549816, -1.014439, -2.565435, 0, 1, 0.2627451, 1,
-0.2514071, 1.651188, 0.908362, 0, 1, 0.2666667, 1,
-0.2502626, 1.542481, -1.275162, 0, 1, 0.2745098, 1,
-0.24765, -2.2233, -3.417094, 0, 1, 0.2784314, 1,
-0.2457247, 1.413659, -0.5087236, 0, 1, 0.2862745, 1,
-0.2451154, 0.09528101, 1.32815, 0, 1, 0.2901961, 1,
-0.2429888, -0.7350803, -3.126237, 0, 1, 0.2980392, 1,
-0.2424165, -1.20919, -2.70587, 0, 1, 0.3058824, 1,
-0.2404214, -0.8789355, -2.803556, 0, 1, 0.3098039, 1,
-0.2382838, -2.140292, -3.758662, 0, 1, 0.3176471, 1,
-0.2367365, -0.5025761, -3.57558, 0, 1, 0.3215686, 1,
-0.2340197, -0.2407092, -3.409803, 0, 1, 0.3294118, 1,
-0.2326674, -0.6156275, -2.791344, 0, 1, 0.3333333, 1,
-0.2271184, 0.4925487, -0.6450462, 0, 1, 0.3411765, 1,
-0.226557, 0.4644029, 0.5091765, 0, 1, 0.345098, 1,
-0.2189887, 1.955827, 0.2282897, 0, 1, 0.3529412, 1,
-0.2187927, -0.6771281, -3.842502, 0, 1, 0.3568628, 1,
-0.217899, -0.4051104, -2.289304, 0, 1, 0.3647059, 1,
-0.214127, -1.478302, -3.027841, 0, 1, 0.3686275, 1,
-0.2088434, 1.003542, -1.100686, 0, 1, 0.3764706, 1,
-0.2084411, -0.7427987, -3.46382, 0, 1, 0.3803922, 1,
-0.206867, 1.387513, -0.8442142, 0, 1, 0.3882353, 1,
-0.2051661, -0.6729388, -3.23895, 0, 1, 0.3921569, 1,
-0.2050735, -0.9858739, -2.608563, 0, 1, 0.4, 1,
-0.2030512, -0.8419846, -2.139736, 0, 1, 0.4078431, 1,
-0.2013008, -1.313681, -2.427025, 0, 1, 0.4117647, 1,
-0.2007725, 1.515811, -1.419937, 0, 1, 0.4196078, 1,
-0.2006541, 0.09332906, -0.2477032, 0, 1, 0.4235294, 1,
-0.195075, 2.417639, 0.1349766, 0, 1, 0.4313726, 1,
-0.1921182, -0.5445633, -4.107089, 0, 1, 0.4352941, 1,
-0.1829202, -0.2415271, -2.729753, 0, 1, 0.4431373, 1,
-0.1776568, 0.3800093, -0.4198942, 0, 1, 0.4470588, 1,
-0.1743926, -0.5615597, -2.914302, 0, 1, 0.454902, 1,
-0.1717571, -2.850268, -1.803866, 0, 1, 0.4588235, 1,
-0.1715677, -0.308204, -2.285207, 0, 1, 0.4666667, 1,
-0.1683719, 0.249732, -1.175513, 0, 1, 0.4705882, 1,
-0.1655018, -0.204279, -5.193193, 0, 1, 0.4784314, 1,
-0.1615362, 0.52799, 0.1510698, 0, 1, 0.4823529, 1,
-0.1612905, -0.203917, -1.949296, 0, 1, 0.4901961, 1,
-0.1601245, 0.865345, -0.7746348, 0, 1, 0.4941176, 1,
-0.158675, 0.6084028, -0.1309244, 0, 1, 0.5019608, 1,
-0.1575339, 2.10958, -0.150509, 0, 1, 0.509804, 1,
-0.1533502, 1.200115, -0.3314749, 0, 1, 0.5137255, 1,
-0.1523079, -1.155278, -4.792429, 0, 1, 0.5215687, 1,
-0.1520183, 0.05853744, -0.8758671, 0, 1, 0.5254902, 1,
-0.1517513, 0.6832742, -0.1416658, 0, 1, 0.5333334, 1,
-0.1509185, 0.9241233, -1.180722, 0, 1, 0.5372549, 1,
-0.1453902, 0.4215356, 0.9192483, 0, 1, 0.5450981, 1,
-0.143941, -0.4982661, -3.180207, 0, 1, 0.5490196, 1,
-0.1423341, 1.35578, -1.619334, 0, 1, 0.5568628, 1,
-0.1381748, 0.5887345, -0.1216528, 0, 1, 0.5607843, 1,
-0.1370339, -0.007788446, -2.775604, 0, 1, 0.5686275, 1,
-0.133128, -0.1569291, -2.35446, 0, 1, 0.572549, 1,
-0.1291988, -0.9782585, -5.156137, 0, 1, 0.5803922, 1,
-0.1288676, -0.08405975, -3.26427, 0, 1, 0.5843138, 1,
-0.1258852, 0.4361628, -0.09165218, 0, 1, 0.5921569, 1,
-0.1254585, 0.00568361, 0.2226129, 0, 1, 0.5960785, 1,
-0.1222781, -1.424497, -2.869591, 0, 1, 0.6039216, 1,
-0.1190977, 0.8087488, -1.067021, 0, 1, 0.6117647, 1,
-0.117104, -1.450578, -4.084758, 0, 1, 0.6156863, 1,
-0.1147901, 0.6557267, 0.4047053, 0, 1, 0.6235294, 1,
-0.1121971, -0.6218104, -3.805632, 0, 1, 0.627451, 1,
-0.1107909, 0.1708083, -1.49279, 0, 1, 0.6352941, 1,
-0.1066437, 0.3864728, -0.635885, 0, 1, 0.6392157, 1,
-0.0993285, -0.2793065, -2.977589, 0, 1, 0.6470588, 1,
-0.09851885, 1.294561, 0.119162, 0, 1, 0.6509804, 1,
-0.09362628, -0.4072926, -4.672627, 0, 1, 0.6588235, 1,
-0.08993076, 0.5014248, -1.124898, 0, 1, 0.6627451, 1,
-0.08963818, -0.6053773, -2.853155, 0, 1, 0.6705883, 1,
-0.08962978, -1.621822, -3.02465, 0, 1, 0.6745098, 1,
-0.08633293, 0.117236, -0.2229572, 0, 1, 0.682353, 1,
-0.08426025, 1.014391, -1.166283, 0, 1, 0.6862745, 1,
-0.08260623, -0.8490031, -2.256224, 0, 1, 0.6941177, 1,
-0.08097367, -1.460007, -1.488818, 0, 1, 0.7019608, 1,
-0.08083081, 1.965313, -0.4394772, 0, 1, 0.7058824, 1,
-0.07899794, 1.170923, 0.3144168, 0, 1, 0.7137255, 1,
-0.07788688, -0.1431604, -1.792787, 0, 1, 0.7176471, 1,
-0.07406887, 0.0684264, -1.203625, 0, 1, 0.7254902, 1,
-0.07086866, 0.09475534, -0.04177091, 0, 1, 0.7294118, 1,
-0.06655844, -1.044407, -0.2371939, 0, 1, 0.7372549, 1,
-0.06067508, 0.850788, 0.6173322, 0, 1, 0.7411765, 1,
-0.05504842, -0.1969252, -1.822628, 0, 1, 0.7490196, 1,
-0.05420132, 1.645293, 0.3384653, 0, 1, 0.7529412, 1,
-0.05200287, 0.1087222, 0.7011211, 0, 1, 0.7607843, 1,
-0.05148871, -1.024115, -2.901783, 0, 1, 0.7647059, 1,
-0.04742429, 0.9359977, -1.226977, 0, 1, 0.772549, 1,
-0.04462352, 1.874322, -0.09757243, 0, 1, 0.7764706, 1,
-0.04405597, -0.2267278, -2.744992, 0, 1, 0.7843137, 1,
-0.04113088, 0.4631581, -0.7864072, 0, 1, 0.7882353, 1,
-0.03924433, -0.03393823, -0.7434179, 0, 1, 0.7960784, 1,
-0.03874231, 0.7884189, 0.6281093, 0, 1, 0.8039216, 1,
-0.03868426, 0.4588737, -1.558883, 0, 1, 0.8078431, 1,
-0.03728642, -1.136607, -2.204385, 0, 1, 0.8156863, 1,
-0.03587325, -0.9535853, -3.689916, 0, 1, 0.8196079, 1,
-0.032272, 1.243772, -0.7507142, 0, 1, 0.827451, 1,
-0.03199208, -1.015599, -3.540011, 0, 1, 0.8313726, 1,
-0.02689186, 1.279597, 1.625862, 0, 1, 0.8392157, 1,
-0.02458842, -0.03725297, -2.871032, 0, 1, 0.8431373, 1,
-0.02188246, 0.395927, 0.4869567, 0, 1, 0.8509804, 1,
-0.02187251, 0.3817486, 0.4358736, 0, 1, 0.854902, 1,
-0.020912, 0.5470329, -0.6839727, 0, 1, 0.8627451, 1,
-0.02073886, 0.05229102, -0.2167236, 0, 1, 0.8666667, 1,
-0.01999057, -1.394388, -1.48045, 0, 1, 0.8745098, 1,
-0.0181286, -0.01395022, -2.07412, 0, 1, 0.8784314, 1,
-0.01793958, -1.088188, -4.548387, 0, 1, 0.8862745, 1,
-0.01649149, 0.9847828, -0.1330424, 0, 1, 0.8901961, 1,
-0.01240201, -0.03138828, -2.911197, 0, 1, 0.8980392, 1,
-0.01234431, 0.6121076, -0.03101224, 0, 1, 0.9058824, 1,
-0.008690573, 1.097649, -1.421794, 0, 1, 0.9098039, 1,
-0.002359895, 0.9165848, 0.5587482, 0, 1, 0.9176471, 1,
0.001665985, -0.647688, 2.077995, 0, 1, 0.9215686, 1,
0.001859518, 0.04652059, -1.22092, 0, 1, 0.9294118, 1,
0.00241318, 1.319709, -0.5209596, 0, 1, 0.9333333, 1,
0.008232961, 0.1413014, 2.56732, 0, 1, 0.9411765, 1,
0.009681577, 0.5341204, -0.4676138, 0, 1, 0.945098, 1,
0.01016475, 0.6953598, -0.9744021, 0, 1, 0.9529412, 1,
0.01035749, 0.6216817, 0.1238801, 0, 1, 0.9568627, 1,
0.01046277, -1.007398, 3.922494, 0, 1, 0.9647059, 1,
0.01142074, -0.4005899, 4.208409, 0, 1, 0.9686275, 1,
0.01410492, 0.7192006, -0.3359727, 0, 1, 0.9764706, 1,
0.01867524, -0.4977867, 2.218986, 0, 1, 0.9803922, 1,
0.0188453, -0.06515522, 4.823174, 0, 1, 0.9882353, 1,
0.02595867, 0.5888372, -0.3282395, 0, 1, 0.9921569, 1,
0.02769304, 2.22067, -0.8926518, 0, 1, 1, 1,
0.02982605, 0.9150614, -0.4455579, 0, 0.9921569, 1, 1,
0.03004354, -0.5946018, 2.093935, 0, 0.9882353, 1, 1,
0.03531551, -1.071915, 1.189633, 0, 0.9803922, 1, 1,
0.03751451, -0.200653, 3.06623, 0, 0.9764706, 1, 1,
0.04329295, -0.1181748, 1.533401, 0, 0.9686275, 1, 1,
0.04626176, 1.248032, -0.2651053, 0, 0.9647059, 1, 1,
0.050375, -0.476994, 3.253927, 0, 0.9568627, 1, 1,
0.05391449, -0.2578187, 2.838549, 0, 0.9529412, 1, 1,
0.05404643, -0.7020739, 4.005566, 0, 0.945098, 1, 1,
0.05871444, 0.2468495, -1.128041, 0, 0.9411765, 1, 1,
0.06963475, -1.395258, 1.736343, 0, 0.9333333, 1, 1,
0.07116379, -1.114385, 1.773605, 0, 0.9294118, 1, 1,
0.07343665, 1.490404, -0.5320312, 0, 0.9215686, 1, 1,
0.076469, 0.9512281, 1.854347, 0, 0.9176471, 1, 1,
0.07652985, -0.06652319, 4.423504, 0, 0.9098039, 1, 1,
0.08010793, -0.3407591, 2.217688, 0, 0.9058824, 1, 1,
0.08084344, -0.1861184, 3.049601, 0, 0.8980392, 1, 1,
0.08099374, 0.6568009, 0.5368478, 0, 0.8901961, 1, 1,
0.08448458, 1.564496, -1.039589, 0, 0.8862745, 1, 1,
0.08825806, -0.2709414, 2.866143, 0, 0.8784314, 1, 1,
0.09076408, 0.351171, 1.908547, 0, 0.8745098, 1, 1,
0.09106827, 0.4058094, -0.04106743, 0, 0.8666667, 1, 1,
0.09132885, -0.5842527, 2.601289, 0, 0.8627451, 1, 1,
0.09161222, -0.473819, 4.997844, 0, 0.854902, 1, 1,
0.09776801, 1.453792, -0.8723601, 0, 0.8509804, 1, 1,
0.09941945, -1.196194, 2.678437, 0, 0.8431373, 1, 1,
0.09974727, 0.4998541, 0.2759909, 0, 0.8392157, 1, 1,
0.1061219, -1.060925, 3.130889, 0, 0.8313726, 1, 1,
0.1061339, -0.7154526, 4.838033, 0, 0.827451, 1, 1,
0.1063117, -0.5259024, 4.656573, 0, 0.8196079, 1, 1,
0.1141727, -0.1271107, 2.294676, 0, 0.8156863, 1, 1,
0.1152156, 1.040704, -0.7427369, 0, 0.8078431, 1, 1,
0.1184636, 2.743078, 0.06886168, 0, 0.8039216, 1, 1,
0.12056, -0.5360423, 2.713101, 0, 0.7960784, 1, 1,
0.1206717, 0.8344337, 1.71349, 0, 0.7882353, 1, 1,
0.1233115, -0.3471638, 3.837604, 0, 0.7843137, 1, 1,
0.1236817, 0.2846166, -1.179759, 0, 0.7764706, 1, 1,
0.1242719, 0.03942063, 1.401482, 0, 0.772549, 1, 1,
0.1272057, -2.045629, 2.661391, 0, 0.7647059, 1, 1,
0.1287042, -0.4803642, 3.533776, 0, 0.7607843, 1, 1,
0.1312323, 0.3631167, 1.433643, 0, 0.7529412, 1, 1,
0.13188, -1.69053, 2.582463, 0, 0.7490196, 1, 1,
0.1322671, 0.6073785, -0.3239363, 0, 0.7411765, 1, 1,
0.133868, -0.5769424, 2.924709, 0, 0.7372549, 1, 1,
0.1400093, -0.06141552, 0.5588396, 0, 0.7294118, 1, 1,
0.1429633, -0.8871282, 1.037729, 0, 0.7254902, 1, 1,
0.1433115, 0.9426667, -2.044923, 0, 0.7176471, 1, 1,
0.147561, -0.2123382, 3.476618, 0, 0.7137255, 1, 1,
0.1481233, -0.7711426, 2.811593, 0, 0.7058824, 1, 1,
0.1496085, -0.0464438, 2.107522, 0, 0.6980392, 1, 1,
0.1523136, -0.1672679, 2.090234, 0, 0.6941177, 1, 1,
0.1525646, -0.2763295, 4.181108, 0, 0.6862745, 1, 1,
0.1549054, -0.4598938, 3.462372, 0, 0.682353, 1, 1,
0.1555948, -1.219917, 3.798406, 0, 0.6745098, 1, 1,
0.1570783, 1.114867, 0.04335406, 0, 0.6705883, 1, 1,
0.1575019, -1.0051, 2.75956, 0, 0.6627451, 1, 1,
0.1575638, -0.04259584, 3.690701, 0, 0.6588235, 1, 1,
0.1579032, -0.5841122, 2.253809, 0, 0.6509804, 1, 1,
0.1604853, -1.049351, 3.82905, 0, 0.6470588, 1, 1,
0.1610986, 0.1926795, 2.144507, 0, 0.6392157, 1, 1,
0.1627649, -1.253065, 3.73447, 0, 0.6352941, 1, 1,
0.1640121, 0.944851, 1.244285, 0, 0.627451, 1, 1,
0.1642316, 0.6271092, 0.1687865, 0, 0.6235294, 1, 1,
0.1755237, 3.109253, 0.5977225, 0, 0.6156863, 1, 1,
0.1755609, 1.099372, -0.2936386, 0, 0.6117647, 1, 1,
0.1773063, -1.712691, 2.360754, 0, 0.6039216, 1, 1,
0.1776656, -1.001993, 3.786851, 0, 0.5960785, 1, 1,
0.1791951, -0.9305497, 2.387275, 0, 0.5921569, 1, 1,
0.1860259, -1.112104, 1.688842, 0, 0.5843138, 1, 1,
0.1887468, -1.475992, 4.718254, 0, 0.5803922, 1, 1,
0.1910987, 1.545828, -1.285771, 0, 0.572549, 1, 1,
0.1996105, 0.8491661, 1.469416, 0, 0.5686275, 1, 1,
0.2023917, -0.4837882, 4.083797, 0, 0.5607843, 1, 1,
0.2039316, -0.5181144, 2.496092, 0, 0.5568628, 1, 1,
0.2045118, -1.696834, 4.053008, 0, 0.5490196, 1, 1,
0.2052373, -2.856374, 4.103593, 0, 0.5450981, 1, 1,
0.2058325, 0.172173, -0.03302581, 0, 0.5372549, 1, 1,
0.2116241, 0.1946221, 2.495513, 0, 0.5333334, 1, 1,
0.2127738, 0.2064672, 0.8978565, 0, 0.5254902, 1, 1,
0.2130154, 0.6023851, -0.6367931, 0, 0.5215687, 1, 1,
0.2183568, 0.4121447, 0.90066, 0, 0.5137255, 1, 1,
0.2210258, -1.005254, 2.113533, 0, 0.509804, 1, 1,
0.2212953, -0.2841324, 0.3316235, 0, 0.5019608, 1, 1,
0.2243403, 0.8444149, -0.437401, 0, 0.4941176, 1, 1,
0.2243845, 0.8417536, 0.2025592, 0, 0.4901961, 1, 1,
0.2269187, -1.178741, 4.700753, 0, 0.4823529, 1, 1,
0.2320728, 0.9903377, 0.2768443, 0, 0.4784314, 1, 1,
0.23324, 0.2000245, 1.894071, 0, 0.4705882, 1, 1,
0.2368323, -1.639229, 3.210656, 0, 0.4666667, 1, 1,
0.2369135, 0.07605626, 0.1917112, 0, 0.4588235, 1, 1,
0.2399006, 0.9110228, 1.082342, 0, 0.454902, 1, 1,
0.2445615, -0.1115488, 2.060472, 0, 0.4470588, 1, 1,
0.2451307, -0.739021, 2.489834, 0, 0.4431373, 1, 1,
0.247298, 0.8126526, 1.743102, 0, 0.4352941, 1, 1,
0.2482978, 0.002102542, 1.983654, 0, 0.4313726, 1, 1,
0.2483993, 1.295525, 0.7140238, 0, 0.4235294, 1, 1,
0.2489145, -0.3797967, 1.558178, 0, 0.4196078, 1, 1,
0.2513845, 1.651079, 3.298298, 0, 0.4117647, 1, 1,
0.2554894, -0.6416681, 1.89902, 0, 0.4078431, 1, 1,
0.2574115, -1.478397, 4.471074, 0, 0.4, 1, 1,
0.2607795, 0.5899591, -1.904158, 0, 0.3921569, 1, 1,
0.26452, -0.1237599, 1.654766, 0, 0.3882353, 1, 1,
0.2649469, -2.173135, 2.230547, 0, 0.3803922, 1, 1,
0.267533, 2.144327, 0.9588227, 0, 0.3764706, 1, 1,
0.2684177, -0.310484, 2.262207, 0, 0.3686275, 1, 1,
0.2775902, -0.2553689, 2.479762, 0, 0.3647059, 1, 1,
0.2792554, -0.5542536, 4.052835, 0, 0.3568628, 1, 1,
0.2802761, -1.469679, 3.63339, 0, 0.3529412, 1, 1,
0.2808626, -0.1152638, 0.3778425, 0, 0.345098, 1, 1,
0.2824015, -1.352575, 3.741878, 0, 0.3411765, 1, 1,
0.2876912, 0.2315307, 0.2398386, 0, 0.3333333, 1, 1,
0.2894433, -2.082385, 2.208228, 0, 0.3294118, 1, 1,
0.2936641, -0.01784093, 2.725372, 0, 0.3215686, 1, 1,
0.2991365, 0.3069826, -1.103877, 0, 0.3176471, 1, 1,
0.301011, 0.3772323, -0.4911109, 0, 0.3098039, 1, 1,
0.302951, 0.2580383, 0.7410267, 0, 0.3058824, 1, 1,
0.3050908, 1.739844, -0.5972933, 0, 0.2980392, 1, 1,
0.3074906, 1.111889, -0.5198233, 0, 0.2901961, 1, 1,
0.3087558, 2.34783, 0.1537022, 0, 0.2862745, 1, 1,
0.3120829, -1.533376, 2.420227, 0, 0.2784314, 1, 1,
0.3126436, 0.5074616, 1.023163, 0, 0.2745098, 1, 1,
0.3139686, -0.519011, 4.010289, 0, 0.2666667, 1, 1,
0.3150876, -0.8195099, 2.411875, 0, 0.2627451, 1, 1,
0.3161335, 2.774451, 0.9228918, 0, 0.254902, 1, 1,
0.3218671, -0.1111322, 0.9194641, 0, 0.2509804, 1, 1,
0.3226489, -0.3994735, 1.411382, 0, 0.2431373, 1, 1,
0.3289148, -0.9047278, 2.723158, 0, 0.2392157, 1, 1,
0.3297286, 1.517302, 1.317494, 0, 0.2313726, 1, 1,
0.3334342, 0.1922328, 2.172953, 0, 0.227451, 1, 1,
0.335365, 0.8303062, -1.132698, 0, 0.2196078, 1, 1,
0.3377098, 0.7763957, -0.6943062, 0, 0.2156863, 1, 1,
0.3389825, -0.4845521, 3.939027, 0, 0.2078431, 1, 1,
0.3394615, 1.339946, 0.4706677, 0, 0.2039216, 1, 1,
0.3408955, 0.1551188, 1.06853, 0, 0.1960784, 1, 1,
0.3432547, 0.6995814, -2.151348, 0, 0.1882353, 1, 1,
0.3470757, -0.6881177, 1.913013, 0, 0.1843137, 1, 1,
0.3494737, 0.8063198, 2.302494, 0, 0.1764706, 1, 1,
0.3644679, -0.4933912, 2.804016, 0, 0.172549, 1, 1,
0.3661619, -1.017005, 2.771352, 0, 0.1647059, 1, 1,
0.3678122, -0.1312016, 2.548697, 0, 0.1607843, 1, 1,
0.3697068, -0.1185701, -0.0724327, 0, 0.1529412, 1, 1,
0.3721384, 0.004726375, 0.8104763, 0, 0.1490196, 1, 1,
0.3762434, -0.05533079, 1.365827, 0, 0.1411765, 1, 1,
0.3781056, 0.5165747, -0.2168311, 0, 0.1372549, 1, 1,
0.3786452, -0.125474, 0.4758018, 0, 0.1294118, 1, 1,
0.3790865, -0.1172602, 3.309112, 0, 0.1254902, 1, 1,
0.3805999, -1.160582, 1.856562, 0, 0.1176471, 1, 1,
0.3821762, 1.332451, 1.014964, 0, 0.1137255, 1, 1,
0.3839657, 0.6268411, 0.913285, 0, 0.1058824, 1, 1,
0.3845946, -0.6489032, 2.576088, 0, 0.09803922, 1, 1,
0.3870856, -0.005306141, 0.2515957, 0, 0.09411765, 1, 1,
0.3944633, 0.6795975, 1.262248, 0, 0.08627451, 1, 1,
0.4022499, 0.5920631, 0.5391677, 0, 0.08235294, 1, 1,
0.403839, 0.1563479, 1.279875, 0, 0.07450981, 1, 1,
0.4078956, -1.643523, 0.9073291, 0, 0.07058824, 1, 1,
0.4081562, 0.9600288, -1.043765, 0, 0.0627451, 1, 1,
0.4090574, -1.492247, 3.790797, 0, 0.05882353, 1, 1,
0.4138212, -0.14934, 0.6282029, 0, 0.05098039, 1, 1,
0.4177253, 0.1136541, 2.168704, 0, 0.04705882, 1, 1,
0.4229718, -1.052312, 3.394655, 0, 0.03921569, 1, 1,
0.4237667, -1.192747, 3.785557, 0, 0.03529412, 1, 1,
0.4276526, -0.4829675, 3.227475, 0, 0.02745098, 1, 1,
0.4326267, -0.4099869, 1.526355, 0, 0.02352941, 1, 1,
0.4335909, 0.7429277, 1.088644, 0, 0.01568628, 1, 1,
0.4339267, 1.858814, -0.1213657, 0, 0.01176471, 1, 1,
0.434037, 1.406782, 1.459808, 0, 0.003921569, 1, 1,
0.436479, 0.853192, 1.448291, 0.003921569, 0, 1, 1,
0.4377269, 0.05241737, 1.55532, 0.007843138, 0, 1, 1,
0.4397482, -1.188827, 0.4821891, 0.01568628, 0, 1, 1,
0.449176, 0.8229659, 0.6023774, 0.01960784, 0, 1, 1,
0.4528264, 0.3501123, 0.371196, 0.02745098, 0, 1, 1,
0.4603554, 0.5964107, 0.9637766, 0.03137255, 0, 1, 1,
0.4640928, 0.4063991, 1.037684, 0.03921569, 0, 1, 1,
0.4657459, 2.00355, 0.06547388, 0.04313726, 0, 1, 1,
0.4674668, 0.1942947, 0.9974817, 0.05098039, 0, 1, 1,
0.4708727, -0.2123807, 3.065126, 0.05490196, 0, 1, 1,
0.4737126, 0.01197665, 3.053271, 0.0627451, 0, 1, 1,
0.4746839, 1.890492, -0.2494942, 0.06666667, 0, 1, 1,
0.4765295, 1.271247, -0.2158229, 0.07450981, 0, 1, 1,
0.4781848, -0.4708335, 4.057611, 0.07843138, 0, 1, 1,
0.4814747, 1.152382, -1.657599, 0.08627451, 0, 1, 1,
0.4840129, 0.03854743, 1.52341, 0.09019608, 0, 1, 1,
0.4856688, -0.6869515, 4.604825, 0.09803922, 0, 1, 1,
0.489704, -0.03746437, 1.393638, 0.1058824, 0, 1, 1,
0.4953871, 0.8650896, 0.1332526, 0.1098039, 0, 1, 1,
0.4971513, -1.499295, 3.559428, 0.1176471, 0, 1, 1,
0.5004367, -1.05437, 4.518396, 0.1215686, 0, 1, 1,
0.5035414, -0.05829813, 1.162487, 0.1294118, 0, 1, 1,
0.5063498, 0.3878433, 2.276842, 0.1333333, 0, 1, 1,
0.5102252, 1.357067, -0.7232591, 0.1411765, 0, 1, 1,
0.5114565, 1.392387, -0.3007453, 0.145098, 0, 1, 1,
0.5133066, 0.7713349, -0.0008587756, 0.1529412, 0, 1, 1,
0.51453, 1.890422, -0.7100965, 0.1568628, 0, 1, 1,
0.5150688, 0.6034906, 1.269609, 0.1647059, 0, 1, 1,
0.5153332, -0.5497807, 2.500855, 0.1686275, 0, 1, 1,
0.5192443, -0.0328574, 3.340936, 0.1764706, 0, 1, 1,
0.5197583, -0.5547086, 2.462858, 0.1803922, 0, 1, 1,
0.519873, 1.504102, -1.742018, 0.1882353, 0, 1, 1,
0.5213362, 0.4694308, -0.1825366, 0.1921569, 0, 1, 1,
0.5228671, 0.09729697, 0.5381001, 0.2, 0, 1, 1,
0.5305498, -0.5632578, 1.861138, 0.2078431, 0, 1, 1,
0.5356009, 0.7525218, 0.8338915, 0.2117647, 0, 1, 1,
0.5401351, -1.726583, 2.604085, 0.2196078, 0, 1, 1,
0.5416005, -0.7890475, 2.583849, 0.2235294, 0, 1, 1,
0.544015, -1.026577, 3.981595, 0.2313726, 0, 1, 1,
0.5467448, 0.1256639, 1.00742, 0.2352941, 0, 1, 1,
0.5485054, 1.790385, -1.585989, 0.2431373, 0, 1, 1,
0.5524262, 0.2157861, 1.007964, 0.2470588, 0, 1, 1,
0.559129, 0.9301695, 0.4642354, 0.254902, 0, 1, 1,
0.5609629, 0.04046633, 4.360226, 0.2588235, 0, 1, 1,
0.563916, 0.7606271, -0.6120949, 0.2666667, 0, 1, 1,
0.5690467, 1.49402, -1.069249, 0.2705882, 0, 1, 1,
0.5699068, 1.580927, 0.701071, 0.2784314, 0, 1, 1,
0.5787162, -0.5760733, 3.309649, 0.282353, 0, 1, 1,
0.5817021, 0.3008473, 2.488931, 0.2901961, 0, 1, 1,
0.5844188, -0.4477532, 3.25828, 0.2941177, 0, 1, 1,
0.5862058, 1.088972, 0.7797901, 0.3019608, 0, 1, 1,
0.5955921, 0.3626, 2.86477, 0.3098039, 0, 1, 1,
0.6003403, 0.2121495, 2.780487, 0.3137255, 0, 1, 1,
0.6066266, -0.4977029, 2.12087, 0.3215686, 0, 1, 1,
0.6078612, 1.648408, 1.589859, 0.3254902, 0, 1, 1,
0.6086569, 0.1229134, 0.2400936, 0.3333333, 0, 1, 1,
0.6102048, -0.02188611, 1.601718, 0.3372549, 0, 1, 1,
0.6107796, 0.259726, 2.727893, 0.345098, 0, 1, 1,
0.6118371, 0.05423652, 2.939978, 0.3490196, 0, 1, 1,
0.6120869, 1.724238, -0.7421376, 0.3568628, 0, 1, 1,
0.6163721, -0.9356644, 3.599213, 0.3607843, 0, 1, 1,
0.6170966, 0.6719906, 0.04839132, 0.3686275, 0, 1, 1,
0.6203946, -0.9296246, 3.971884, 0.372549, 0, 1, 1,
0.6227183, -0.6421944, 1.99486, 0.3803922, 0, 1, 1,
0.6287291, 1.077818, 0.4544638, 0.3843137, 0, 1, 1,
0.6294624, -0.428746, 1.901443, 0.3921569, 0, 1, 1,
0.6319258, -0.7996999, 3.438112, 0.3960784, 0, 1, 1,
0.6325225, -0.3760315, 2.987136, 0.4039216, 0, 1, 1,
0.6377554, 3.587222, 1.199981, 0.4117647, 0, 1, 1,
0.6407574, -0.2937775, 2.206707, 0.4156863, 0, 1, 1,
0.6411405, -1.546247, 2.846902, 0.4235294, 0, 1, 1,
0.6420146, 0.1282366, 1.006263, 0.427451, 0, 1, 1,
0.6439203, -0.6481977, 1.823328, 0.4352941, 0, 1, 1,
0.6441756, -0.4064978, 1.118469, 0.4392157, 0, 1, 1,
0.646866, -1.383732, 2.88448, 0.4470588, 0, 1, 1,
0.6490614, -1.208026, 1.70768, 0.4509804, 0, 1, 1,
0.6522048, -0.007827399, 2.003293, 0.4588235, 0, 1, 1,
0.652712, -0.483062, 1.008988, 0.4627451, 0, 1, 1,
0.653094, 0.266958, 2.676909, 0.4705882, 0, 1, 1,
0.658308, 0.6484653, -0.5058119, 0.4745098, 0, 1, 1,
0.6624215, -0.07819258, 2.391522, 0.4823529, 0, 1, 1,
0.6632847, -1.094189, 2.789389, 0.4862745, 0, 1, 1,
0.6663071, 1.58212, 1.964537, 0.4941176, 0, 1, 1,
0.6723015, -1.009763, 2.944633, 0.5019608, 0, 1, 1,
0.6732451, -1.133454, 2.881397, 0.5058824, 0, 1, 1,
0.6777583, -0.5955482, 3.58884, 0.5137255, 0, 1, 1,
0.6817441, -0.4999254, 0.4853386, 0.5176471, 0, 1, 1,
0.688686, 1.955442, 0.7358389, 0.5254902, 0, 1, 1,
0.6937804, -0.7364794, 1.16686, 0.5294118, 0, 1, 1,
0.6962976, -0.8770128, 4.338486, 0.5372549, 0, 1, 1,
0.6964829, 0.1165329, 2.717692, 0.5411765, 0, 1, 1,
0.6975957, 1.98602, 0.06830209, 0.5490196, 0, 1, 1,
0.69808, 1.565069, 2.358045, 0.5529412, 0, 1, 1,
0.6998937, 0.5259776, 1.427833, 0.5607843, 0, 1, 1,
0.7046974, 0.2692553, 3.4244, 0.5647059, 0, 1, 1,
0.7088571, 0.5663543, 2.621005, 0.572549, 0, 1, 1,
0.7117756, -0.08404116, 2.165424, 0.5764706, 0, 1, 1,
0.7117845, 0.8561493, -0.02657172, 0.5843138, 0, 1, 1,
0.71216, -1.367266, 0.9971791, 0.5882353, 0, 1, 1,
0.7145575, 0.6303521, 1.824446, 0.5960785, 0, 1, 1,
0.7151862, 0.9093909, 1.421807, 0.6039216, 0, 1, 1,
0.7180544, -0.7440033, 2.862145, 0.6078432, 0, 1, 1,
0.7182912, 1.650628, -0.1182905, 0.6156863, 0, 1, 1,
0.7205822, -0.1533759, 2.55414, 0.6196079, 0, 1, 1,
0.7303438, 0.3425521, 1.210741, 0.627451, 0, 1, 1,
0.7304712, -1.331056, 1.068289, 0.6313726, 0, 1, 1,
0.7350991, 0.1811267, 0.7719777, 0.6392157, 0, 1, 1,
0.7351828, -0.8221531, 2.042317, 0.6431373, 0, 1, 1,
0.7375762, 0.7627268, 0.9478202, 0.6509804, 0, 1, 1,
0.746751, -0.2377529, 1.613922, 0.654902, 0, 1, 1,
0.7489147, 1.96695, 2.28154, 0.6627451, 0, 1, 1,
0.7612612, 0.0685086, 0.1421814, 0.6666667, 0, 1, 1,
0.7619249, -0.277998, 2.503217, 0.6745098, 0, 1, 1,
0.7700248, 0.609457, 0.7883114, 0.6784314, 0, 1, 1,
0.771885, -0.1979748, 1.083727, 0.6862745, 0, 1, 1,
0.7761505, 0.5334033, 1.707758, 0.6901961, 0, 1, 1,
0.7763805, 1.027328, 1.540531, 0.6980392, 0, 1, 1,
0.782658, -0.07469077, 1.779281, 0.7058824, 0, 1, 1,
0.7861328, 0.3799944, 1.5227, 0.7098039, 0, 1, 1,
0.7936189, -0.8445916, 1.518386, 0.7176471, 0, 1, 1,
0.8006046, -1.143044, 1.53387, 0.7215686, 0, 1, 1,
0.8036631, -0.7760245, 2.061816, 0.7294118, 0, 1, 1,
0.8091961, -0.7829899, 2.965413, 0.7333333, 0, 1, 1,
0.8114697, 0.009235566, 2.465655, 0.7411765, 0, 1, 1,
0.8120807, -0.1017266, 2.228524, 0.7450981, 0, 1, 1,
0.8194689, -0.6163446, 3.179262, 0.7529412, 0, 1, 1,
0.8224273, -0.6316696, 1.394018, 0.7568628, 0, 1, 1,
0.8234006, 0.04966783, 0.01730314, 0.7647059, 0, 1, 1,
0.8242188, 0.6972533, 2.419669, 0.7686275, 0, 1, 1,
0.8253166, -1.420648, 3.604468, 0.7764706, 0, 1, 1,
0.8253526, 0.1760091, 0.7051378, 0.7803922, 0, 1, 1,
0.8286802, -0.1564151, 2.253515, 0.7882353, 0, 1, 1,
0.8334838, 0.7152998, 0.8251054, 0.7921569, 0, 1, 1,
0.8340134, -0.9000419, 1.391756, 0.8, 0, 1, 1,
0.8367407, -0.4347798, 2.428514, 0.8078431, 0, 1, 1,
0.8388042, 1.398652, 1.23577, 0.8117647, 0, 1, 1,
0.8520588, -0.3768287, 1.693874, 0.8196079, 0, 1, 1,
0.8631306, 0.1400141, 1.136112, 0.8235294, 0, 1, 1,
0.8657391, 1.425101, 0.6315462, 0.8313726, 0, 1, 1,
0.8708091, -0.9656751, 3.05372, 0.8352941, 0, 1, 1,
0.8743252, -0.8474644, 1.777837, 0.8431373, 0, 1, 1,
0.8785661, 0.40858, 1.857182, 0.8470588, 0, 1, 1,
0.8790118, -0.07344825, 0.235961, 0.854902, 0, 1, 1,
0.8805041, 1.219773, 0.6584954, 0.8588235, 0, 1, 1,
0.8924292, 0.1088298, 1.526672, 0.8666667, 0, 1, 1,
0.8942133, -0.06273305, 0.9955041, 0.8705882, 0, 1, 1,
0.8990514, 0.6453069, 0.7386672, 0.8784314, 0, 1, 1,
0.9004592, 0.6098052, 0.9504282, 0.8823529, 0, 1, 1,
0.9072494, 0.2630187, 1.215932, 0.8901961, 0, 1, 1,
0.9076877, 0.2568762, 1.685686, 0.8941177, 0, 1, 1,
0.9084319, 0.7331451, 0.1967917, 0.9019608, 0, 1, 1,
0.9146857, 0.6709998, -0.4784116, 0.9098039, 0, 1, 1,
0.9163376, 1.172235, -0.3405284, 0.9137255, 0, 1, 1,
0.9179944, 0.5616342, -0.7215424, 0.9215686, 0, 1, 1,
0.9197422, -0.6822792, 4.167949, 0.9254902, 0, 1, 1,
0.9200541, 0.4191296, 1.519706, 0.9333333, 0, 1, 1,
0.9245777, -1.086467, 1.162051, 0.9372549, 0, 1, 1,
0.9277159, 1.5349, 1.719861, 0.945098, 0, 1, 1,
0.9293876, -0.1013595, 0.4231326, 0.9490196, 0, 1, 1,
0.9304702, 0.5586808, 1.346463, 0.9568627, 0, 1, 1,
0.9324565, 0.6400772, 0.5152249, 0.9607843, 0, 1, 1,
0.9338806, -0.7473163, 2.98909, 0.9686275, 0, 1, 1,
0.9362813, 1.771829, 0.1102045, 0.972549, 0, 1, 1,
0.9387909, 0.7023408, -0.118778, 0.9803922, 0, 1, 1,
0.9390878, -1.196709, 3.023975, 0.9843137, 0, 1, 1,
0.9452211, -1.060457, 3.261317, 0.9921569, 0, 1, 1,
0.9480442, 1.047603, 2.992349, 0.9960784, 0, 1, 1,
0.9506457, 0.5749893, 0.9554057, 1, 0, 0.9960784, 1,
0.9522378, 0.3686764, 0.6115048, 1, 0, 0.9882353, 1,
0.953206, 1.718267, 1.662878, 1, 0, 0.9843137, 1,
0.9538285, 1.057008, 1.230548, 1, 0, 0.9764706, 1,
0.9672993, -1.084439, 1.468389, 1, 0, 0.972549, 1,
0.9729133, 1.915327, -0.02272056, 1, 0, 0.9647059, 1,
0.9807965, 0.04518646, 1.995254, 1, 0, 0.9607843, 1,
0.9811174, 1.997529, -1.203979, 1, 0, 0.9529412, 1,
0.9831876, -0.2498126, 0.428265, 1, 0, 0.9490196, 1,
0.98637, -0.8993258, 3.793428, 1, 0, 0.9411765, 1,
0.9926661, 0.1835898, -0.4528403, 1, 0, 0.9372549, 1,
0.997829, -1.188727, 0.7231518, 1, 0, 0.9294118, 1,
1.001387, -0.04937925, 1.912483, 1, 0, 0.9254902, 1,
1.003227, 0.6538169, -0.007130745, 1, 0, 0.9176471, 1,
1.006535, -2.020012, 3.200916, 1, 0, 0.9137255, 1,
1.010927, -0.5394127, 1.525421, 1, 0, 0.9058824, 1,
1.011804, -0.3706782, 3.411296, 1, 0, 0.9019608, 1,
1.020706, 1.580237, -0.414574, 1, 0, 0.8941177, 1,
1.023226, -0.05248732, 1.969813, 1, 0, 0.8862745, 1,
1.025209, 1.361688, 0.539839, 1, 0, 0.8823529, 1,
1.026892, -0.1169506, -0.2997531, 1, 0, 0.8745098, 1,
1.043661, 1.592087, 0.8496718, 1, 0, 0.8705882, 1,
1.045223, 0.3409743, 1.188293, 1, 0, 0.8627451, 1,
1.045909, -1.739664, 2.228468, 1, 0, 0.8588235, 1,
1.046515, 0.08461318, 1.627443, 1, 0, 0.8509804, 1,
1.047495, -1.539386, 4.010537, 1, 0, 0.8470588, 1,
1.050127, -0.5094277, 2.328902, 1, 0, 0.8392157, 1,
1.059008, 0.5182537, 1.232595, 1, 0, 0.8352941, 1,
1.062497, 0.2791053, 1.494429, 1, 0, 0.827451, 1,
1.065147, -0.9401178, 1.343548, 1, 0, 0.8235294, 1,
1.070571, 0.03337466, 1.563461, 1, 0, 0.8156863, 1,
1.074312, 1.111743, -0.9100609, 1, 0, 0.8117647, 1,
1.075502, 0.6536133, 1.894159, 1, 0, 0.8039216, 1,
1.092423, 2.000837, 2.008758, 1, 0, 0.7960784, 1,
1.101118, 0.07598694, 1.09822, 1, 0, 0.7921569, 1,
1.102937, -1.548474, 2.763362, 1, 0, 0.7843137, 1,
1.106971, -1.304345, 0.778047, 1, 0, 0.7803922, 1,
1.107807, 0.6938392, 1.541399, 1, 0, 0.772549, 1,
1.108119, 0.991966, -0.2082385, 1, 0, 0.7686275, 1,
1.116259, 1.010949, -0.3325755, 1, 0, 0.7607843, 1,
1.123136, -0.5353963, 2.835883, 1, 0, 0.7568628, 1,
1.124186, -0.6411114, 3.1684, 1, 0, 0.7490196, 1,
1.124248, 0.4556363, 0.6890165, 1, 0, 0.7450981, 1,
1.127788, 2.133653, 0.1014222, 1, 0, 0.7372549, 1,
1.128053, 0.8647936, 2.390767, 1, 0, 0.7333333, 1,
1.134589, 0.3434761, 1.329588, 1, 0, 0.7254902, 1,
1.142998, 0.2363518, 2.640063, 1, 0, 0.7215686, 1,
1.145064, -0.1910584, 1.083115, 1, 0, 0.7137255, 1,
1.162739, -0.1182172, 2.841717, 1, 0, 0.7098039, 1,
1.164788, 0.08564473, 3.353348, 1, 0, 0.7019608, 1,
1.174161, -0.5364974, 2.432027, 1, 0, 0.6941177, 1,
1.176871, -0.4370538, 1.760589, 1, 0, 0.6901961, 1,
1.178515, 0.679714, 2.156053, 1, 0, 0.682353, 1,
1.185521, 1.098815, -0.6278132, 1, 0, 0.6784314, 1,
1.188287, -1.448545, 2.715311, 1, 0, 0.6705883, 1,
1.200033, -1.716246, 2.035673, 1, 0, 0.6666667, 1,
1.205451, 0.005459954, 2.622447, 1, 0, 0.6588235, 1,
1.212584, 0.1112343, 0.4102636, 1, 0, 0.654902, 1,
1.242076, 1.361868, 2.410538, 1, 0, 0.6470588, 1,
1.248517, -1.002634, 2.541279, 1, 0, 0.6431373, 1,
1.266355, -2.145909, 1.505205, 1, 0, 0.6352941, 1,
1.274944, 1.416795, 1.440335, 1, 0, 0.6313726, 1,
1.280386, -0.2835026, 2.377227, 1, 0, 0.6235294, 1,
1.292385, -0.7700355, 1.207946, 1, 0, 0.6196079, 1,
1.295278, -0.5721976, 3.55168, 1, 0, 0.6117647, 1,
1.297324, -1.100292, 2.464723, 1, 0, 0.6078432, 1,
1.303955, 0.06423537, 0.80237, 1, 0, 0.6, 1,
1.305921, -0.7374215, 1.294648, 1, 0, 0.5921569, 1,
1.309728, -0.3917837, 2.257632, 1, 0, 0.5882353, 1,
1.317925, 0.6424047, 1.483808, 1, 0, 0.5803922, 1,
1.320853, -0.9611867, 2.843333, 1, 0, 0.5764706, 1,
1.324496, -0.07556652, 0.08025252, 1, 0, 0.5686275, 1,
1.326324, -1.520461, 1.57436, 1, 0, 0.5647059, 1,
1.335823, -0.1395892, 2.245792, 1, 0, 0.5568628, 1,
1.348843, -0.01014004, 2.689122, 1, 0, 0.5529412, 1,
1.351983, 0.8626375, 1.369132, 1, 0, 0.5450981, 1,
1.352148, -1.468753, 3.086812, 1, 0, 0.5411765, 1,
1.353887, -0.07516341, 3.019683, 1, 0, 0.5333334, 1,
1.370518, 1.87849, 0.2480089, 1, 0, 0.5294118, 1,
1.378791, 0.3986267, 1.35447, 1, 0, 0.5215687, 1,
1.384223, 1.679178, 2.030252, 1, 0, 0.5176471, 1,
1.390788, 1.519911, -0.07813215, 1, 0, 0.509804, 1,
1.393785, 0.7492976, -0.7161586, 1, 0, 0.5058824, 1,
1.409863, 0.2358636, 1.574832, 1, 0, 0.4980392, 1,
1.414635, 0.6853443, 2.590704, 1, 0, 0.4901961, 1,
1.43302, -0.13906, 1.414295, 1, 0, 0.4862745, 1,
1.433264, -1.209664, 3.235821, 1, 0, 0.4784314, 1,
1.43841, 0.2554674, 1.058601, 1, 0, 0.4745098, 1,
1.445485, 0.254923, 2.518231, 1, 0, 0.4666667, 1,
1.460847, -0.09347816, 1.833139, 1, 0, 0.4627451, 1,
1.461256, -0.9316301, 3.442156, 1, 0, 0.454902, 1,
1.470181, -0.6987095, 3.852155, 1, 0, 0.4509804, 1,
1.4747, 0.624014, 0.4367712, 1, 0, 0.4431373, 1,
1.476854, -0.006830494, 0.4124832, 1, 0, 0.4392157, 1,
1.482036, 0.9879647, -2.086207, 1, 0, 0.4313726, 1,
1.483447, -1.779779, 2.585215, 1, 0, 0.427451, 1,
1.490777, -0.3212405, 2.132926, 1, 0, 0.4196078, 1,
1.501668, 1.119947, -0.2747222, 1, 0, 0.4156863, 1,
1.505727, 0.6187133, 0.6283524, 1, 0, 0.4078431, 1,
1.512886, -1.959681, 3.805782, 1, 0, 0.4039216, 1,
1.519601, 0.811886, 1.626486, 1, 0, 0.3960784, 1,
1.539637, -1.023178, 3.782185, 1, 0, 0.3882353, 1,
1.542741, 1.263467, 0.7691675, 1, 0, 0.3843137, 1,
1.543719, 0.360522, 2.523266, 1, 0, 0.3764706, 1,
1.566581, 2.401925, 1.66644, 1, 0, 0.372549, 1,
1.576465, 2.2177, 0.07901672, 1, 0, 0.3647059, 1,
1.589035, 0.3698827, 3.362595, 1, 0, 0.3607843, 1,
1.592126, -0.8577328, 2.395797, 1, 0, 0.3529412, 1,
1.625624, -0.6979339, 1.684161, 1, 0, 0.3490196, 1,
1.628716, -1.975207, 0.9558455, 1, 0, 0.3411765, 1,
1.639718, 0.6701294, 1.385401, 1, 0, 0.3372549, 1,
1.644343, -0.3025973, 2.377986, 1, 0, 0.3294118, 1,
1.650757, -0.4287305, 2.054347, 1, 0, 0.3254902, 1,
1.65201, 0.1668802, -0.1777977, 1, 0, 0.3176471, 1,
1.668874, 0.5739368, -0.4054126, 1, 0, 0.3137255, 1,
1.676628, -0.5238408, 3.022177, 1, 0, 0.3058824, 1,
1.704304, -1.041336, 2.546374, 1, 0, 0.2980392, 1,
1.71006, 0.5463027, -0.1672339, 1, 0, 0.2941177, 1,
1.727003, 1.206042, 0.7556217, 1, 0, 0.2862745, 1,
1.738262, 0.2671865, 2.366365, 1, 0, 0.282353, 1,
1.743547, 1.695194, 0.05137599, 1, 0, 0.2745098, 1,
1.750744, -0.6891364, 3.166475, 1, 0, 0.2705882, 1,
1.752371, -1.534736, 2.6419, 1, 0, 0.2627451, 1,
1.762972, -3.113171, 4.578491, 1, 0, 0.2588235, 1,
1.766241, 0.9708694, -1.551361, 1, 0, 0.2509804, 1,
1.767722, -0.9329059, 2.123091, 1, 0, 0.2470588, 1,
1.777344, -1.380173, 1.919293, 1, 0, 0.2392157, 1,
1.782573, -0.0780013, 2.555258, 1, 0, 0.2352941, 1,
1.784701, -0.3774081, 3.486667, 1, 0, 0.227451, 1,
1.791064, 0.1649966, 1.855157, 1, 0, 0.2235294, 1,
1.793569, -1.318343, 3.571097, 1, 0, 0.2156863, 1,
1.797918, 0.1357382, 0.7883353, 1, 0, 0.2117647, 1,
1.815599, -0.02604382, 1.086408, 1, 0, 0.2039216, 1,
1.820657, -1.577725, 2.755208, 1, 0, 0.1960784, 1,
1.850773, -1.291398, 1.514989, 1, 0, 0.1921569, 1,
1.868389, 0.329596, 0.5480219, 1, 0, 0.1843137, 1,
1.877447, 0.3749905, 3.23676, 1, 0, 0.1803922, 1,
1.902864, -0.7895623, 2.818466, 1, 0, 0.172549, 1,
1.911507, -0.2510899, 3.024094, 1, 0, 0.1686275, 1,
1.912867, -1.60167, 3.307537, 1, 0, 0.1607843, 1,
1.925698, 1.162314, 1.746922, 1, 0, 0.1568628, 1,
1.973502, 0.7342586, 1.175002, 1, 0, 0.1490196, 1,
1.989411, -2.04609, 1.594447, 1, 0, 0.145098, 1,
1.992814, -1.21362, 3.913594, 1, 0, 0.1372549, 1,
2.056724, -0.3660751, 2.429126, 1, 0, 0.1333333, 1,
2.063793, -1.236645, 3.156645, 1, 0, 0.1254902, 1,
2.089972, -0.1934531, 2.191902, 1, 0, 0.1215686, 1,
2.095779, 0.0619382, 1.731441, 1, 0, 0.1137255, 1,
2.100926, -1.184118, 2.251151, 1, 0, 0.1098039, 1,
2.105373, -0.7724785, 2.84062, 1, 0, 0.1019608, 1,
2.110058, -1.535686, 2.507304, 1, 0, 0.09411765, 1,
2.150009, 0.9263365, 1.50317, 1, 0, 0.09019608, 1,
2.156503, 0.1969863, 2.692994, 1, 0, 0.08235294, 1,
2.161225, -1.675518, 4.536107, 1, 0, 0.07843138, 1,
2.22674, -1.092307, -0.4116964, 1, 0, 0.07058824, 1,
2.345132, -0.515322, 1.284065, 1, 0, 0.06666667, 1,
2.42481, 0.4317836, 0.4899274, 1, 0, 0.05882353, 1,
2.532031, -0.5734361, 2.278393, 1, 0, 0.05490196, 1,
2.533339, 0.2273492, 0.7859324, 1, 0, 0.04705882, 1,
2.596705, 1.196862, 1.465156, 1, 0, 0.04313726, 1,
2.747987, 0.07742046, 1.043699, 1, 0, 0.03529412, 1,
2.78586, -1.616272, 2.014771, 1, 0, 0.03137255, 1,
2.823322, 0.4914594, 1.973972, 1, 0, 0.02352941, 1,
2.907507, 0.497723, 2.713257, 1, 0, 0.01960784, 1,
2.932698, 0.1654958, 2.50424, 1, 0, 0.01176471, 1,
3.602117, -2.290099, 3.103269, 1, 0, 0.007843138, 1
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
0.1265672, -4.248888, -7.491293, 0, -0.5, 0.5, 0.5,
0.1265672, -4.248888, -7.491293, 1, -0.5, 0.5, 0.5,
0.1265672, -4.248888, -7.491293, 1, 1.5, 0.5, 0.5,
0.1265672, -4.248888, -7.491293, 0, 1.5, 0.5, 0.5
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
-4.527194, 0.2370257, -7.491293, 0, -0.5, 0.5, 0.5,
-4.527194, 0.2370257, -7.491293, 1, -0.5, 0.5, 0.5,
-4.527194, 0.2370257, -7.491293, 1, 1.5, 0.5, 0.5,
-4.527194, 0.2370257, -7.491293, 0, 1.5, 0.5, 0.5
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
-4.527194, -4.248888, -0.341676, 0, -0.5, 0.5, 0.5,
-4.527194, -4.248888, -0.341676, 1, -0.5, 0.5, 0.5,
-4.527194, -4.248888, -0.341676, 1, 1.5, 0.5, 0.5,
-4.527194, -4.248888, -0.341676, 0, 1.5, 0.5, 0.5
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
-3, -3.213677, -5.841382,
3, -3.213677, -5.841382,
-3, -3.213677, -5.841382,
-3, -3.386212, -6.116367,
-2, -3.213677, -5.841382,
-2, -3.386212, -6.116367,
-1, -3.213677, -5.841382,
-1, -3.386212, -6.116367,
0, -3.213677, -5.841382,
0, -3.386212, -6.116367,
1, -3.213677, -5.841382,
1, -3.386212, -6.116367,
2, -3.213677, -5.841382,
2, -3.386212, -6.116367,
3, -3.213677, -5.841382,
3, -3.386212, -6.116367
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
-3, -3.731282, -6.666337, 0, -0.5, 0.5, 0.5,
-3, -3.731282, -6.666337, 1, -0.5, 0.5, 0.5,
-3, -3.731282, -6.666337, 1, 1.5, 0.5, 0.5,
-3, -3.731282, -6.666337, 0, 1.5, 0.5, 0.5,
-2, -3.731282, -6.666337, 0, -0.5, 0.5, 0.5,
-2, -3.731282, -6.666337, 1, -0.5, 0.5, 0.5,
-2, -3.731282, -6.666337, 1, 1.5, 0.5, 0.5,
-2, -3.731282, -6.666337, 0, 1.5, 0.5, 0.5,
-1, -3.731282, -6.666337, 0, -0.5, 0.5, 0.5,
-1, -3.731282, -6.666337, 1, -0.5, 0.5, 0.5,
-1, -3.731282, -6.666337, 1, 1.5, 0.5, 0.5,
-1, -3.731282, -6.666337, 0, 1.5, 0.5, 0.5,
0, -3.731282, -6.666337, 0, -0.5, 0.5, 0.5,
0, -3.731282, -6.666337, 1, -0.5, 0.5, 0.5,
0, -3.731282, -6.666337, 1, 1.5, 0.5, 0.5,
0, -3.731282, -6.666337, 0, 1.5, 0.5, 0.5,
1, -3.731282, -6.666337, 0, -0.5, 0.5, 0.5,
1, -3.731282, -6.666337, 1, -0.5, 0.5, 0.5,
1, -3.731282, -6.666337, 1, 1.5, 0.5, 0.5,
1, -3.731282, -6.666337, 0, 1.5, 0.5, 0.5,
2, -3.731282, -6.666337, 0, -0.5, 0.5, 0.5,
2, -3.731282, -6.666337, 1, -0.5, 0.5, 0.5,
2, -3.731282, -6.666337, 1, 1.5, 0.5, 0.5,
2, -3.731282, -6.666337, 0, 1.5, 0.5, 0.5,
3, -3.731282, -6.666337, 0, -0.5, 0.5, 0.5,
3, -3.731282, -6.666337, 1, -0.5, 0.5, 0.5,
3, -3.731282, -6.666337, 1, 1.5, 0.5, 0.5,
3, -3.731282, -6.666337, 0, 1.5, 0.5, 0.5
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
-3.453249, -3, -5.841382,
-3.453249, 3, -5.841382,
-3.453249, -3, -5.841382,
-3.63224, -3, -6.116367,
-3.453249, -2, -5.841382,
-3.63224, -2, -6.116367,
-3.453249, -1, -5.841382,
-3.63224, -1, -6.116367,
-3.453249, 0, -5.841382,
-3.63224, 0, -6.116367,
-3.453249, 1, -5.841382,
-3.63224, 1, -6.116367,
-3.453249, 2, -5.841382,
-3.63224, 2, -6.116367,
-3.453249, 3, -5.841382,
-3.63224, 3, -6.116367
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
-3.990222, -3, -6.666337, 0, -0.5, 0.5, 0.5,
-3.990222, -3, -6.666337, 1, -0.5, 0.5, 0.5,
-3.990222, -3, -6.666337, 1, 1.5, 0.5, 0.5,
-3.990222, -3, -6.666337, 0, 1.5, 0.5, 0.5,
-3.990222, -2, -6.666337, 0, -0.5, 0.5, 0.5,
-3.990222, -2, -6.666337, 1, -0.5, 0.5, 0.5,
-3.990222, -2, -6.666337, 1, 1.5, 0.5, 0.5,
-3.990222, -2, -6.666337, 0, 1.5, 0.5, 0.5,
-3.990222, -1, -6.666337, 0, -0.5, 0.5, 0.5,
-3.990222, -1, -6.666337, 1, -0.5, 0.5, 0.5,
-3.990222, -1, -6.666337, 1, 1.5, 0.5, 0.5,
-3.990222, -1, -6.666337, 0, 1.5, 0.5, 0.5,
-3.990222, 0, -6.666337, 0, -0.5, 0.5, 0.5,
-3.990222, 0, -6.666337, 1, -0.5, 0.5, 0.5,
-3.990222, 0, -6.666337, 1, 1.5, 0.5, 0.5,
-3.990222, 0, -6.666337, 0, 1.5, 0.5, 0.5,
-3.990222, 1, -6.666337, 0, -0.5, 0.5, 0.5,
-3.990222, 1, -6.666337, 1, -0.5, 0.5, 0.5,
-3.990222, 1, -6.666337, 1, 1.5, 0.5, 0.5,
-3.990222, 1, -6.666337, 0, 1.5, 0.5, 0.5,
-3.990222, 2, -6.666337, 0, -0.5, 0.5, 0.5,
-3.990222, 2, -6.666337, 1, -0.5, 0.5, 0.5,
-3.990222, 2, -6.666337, 1, 1.5, 0.5, 0.5,
-3.990222, 2, -6.666337, 0, 1.5, 0.5, 0.5,
-3.990222, 3, -6.666337, 0, -0.5, 0.5, 0.5,
-3.990222, 3, -6.666337, 1, -0.5, 0.5, 0.5,
-3.990222, 3, -6.666337, 1, 1.5, 0.5, 0.5,
-3.990222, 3, -6.666337, 0, 1.5, 0.5, 0.5
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
-3.453249, -3.213677, -4,
-3.453249, -3.213677, 4,
-3.453249, -3.213677, -4,
-3.63224, -3.386212, -4,
-3.453249, -3.213677, -2,
-3.63224, -3.386212, -2,
-3.453249, -3.213677, 0,
-3.63224, -3.386212, 0,
-3.453249, -3.213677, 2,
-3.63224, -3.386212, 2,
-3.453249, -3.213677, 4,
-3.63224, -3.386212, 4
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
-3.990222, -3.731282, -4, 0, -0.5, 0.5, 0.5,
-3.990222, -3.731282, -4, 1, -0.5, 0.5, 0.5,
-3.990222, -3.731282, -4, 1, 1.5, 0.5, 0.5,
-3.990222, -3.731282, -4, 0, 1.5, 0.5, 0.5,
-3.990222, -3.731282, -2, 0, -0.5, 0.5, 0.5,
-3.990222, -3.731282, -2, 1, -0.5, 0.5, 0.5,
-3.990222, -3.731282, -2, 1, 1.5, 0.5, 0.5,
-3.990222, -3.731282, -2, 0, 1.5, 0.5, 0.5,
-3.990222, -3.731282, 0, 0, -0.5, 0.5, 0.5,
-3.990222, -3.731282, 0, 1, -0.5, 0.5, 0.5,
-3.990222, -3.731282, 0, 1, 1.5, 0.5, 0.5,
-3.990222, -3.731282, 0, 0, 1.5, 0.5, 0.5,
-3.990222, -3.731282, 2, 0, -0.5, 0.5, 0.5,
-3.990222, -3.731282, 2, 1, -0.5, 0.5, 0.5,
-3.990222, -3.731282, 2, 1, 1.5, 0.5, 0.5,
-3.990222, -3.731282, 2, 0, 1.5, 0.5, 0.5,
-3.990222, -3.731282, 4, 0, -0.5, 0.5, 0.5,
-3.990222, -3.731282, 4, 1, -0.5, 0.5, 0.5,
-3.990222, -3.731282, 4, 1, 1.5, 0.5, 0.5,
-3.990222, -3.731282, 4, 0, 1.5, 0.5, 0.5
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
-3.453249, -3.213677, -5.841382,
-3.453249, 3.687728, -5.841382,
-3.453249, -3.213677, 5.15803,
-3.453249, 3.687728, 5.15803,
-3.453249, -3.213677, -5.841382,
-3.453249, -3.213677, 5.15803,
-3.453249, 3.687728, -5.841382,
-3.453249, 3.687728, 5.15803,
-3.453249, -3.213677, -5.841382,
3.706383, -3.213677, -5.841382,
-3.453249, -3.213677, 5.15803,
3.706383, -3.213677, 5.15803,
-3.453249, 3.687728, -5.841382,
3.706383, 3.687728, -5.841382,
-3.453249, 3.687728, 5.15803,
3.706383, 3.687728, 5.15803,
3.706383, -3.213677, -5.841382,
3.706383, 3.687728, -5.841382,
3.706383, -3.213677, 5.15803,
3.706383, 3.687728, 5.15803,
3.706383, -3.213677, -5.841382,
3.706383, -3.213677, 5.15803,
3.706383, 3.687728, -5.841382,
3.706383, 3.687728, 5.15803
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
var radius = 7.917994;
var distance = 35.22805;
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
mvMatrix.translate( -0.1265672, -0.2370257, 0.341676 );
mvMatrix.scale( 1.195744, 1.240485, 0.7783225 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.22805);
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
tetraiodoethylene<-read.table("tetraiodoethylene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetraiodoethylene$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetraiodoethylene' not found
```

```r
y<-tetraiodoethylene$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetraiodoethylene' not found
```

```r
z<-tetraiodoethylene$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetraiodoethylene' not found
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
-3.348983, -0.9801872, -3.464687, 0, 0, 1, 1, 1,
-3.332643, -0.2875008, -0.3946487, 1, 0, 0, 1, 1,
-3.184684, -1.430149, -2.770288, 1, 0, 0, 1, 1,
-2.753762, -0.786544, -1.658235, 1, 0, 0, 1, 1,
-2.581658, 1.184267, 0.4632661, 1, 0, 0, 1, 1,
-2.450486, -0.3990123, -0.8712434, 1, 0, 0, 1, 1,
-2.427483, -0.7527627, -1.311963, 0, 0, 0, 1, 1,
-2.349417, -0.0904454, -1.140003, 0, 0, 0, 1, 1,
-2.335435, -1.922348, -0.6205539, 0, 0, 0, 1, 1,
-2.321541, 0.6124694, -1.88877, 0, 0, 0, 1, 1,
-2.310201, -1.947322, -2.007338, 0, 0, 0, 1, 1,
-2.30437, -1.922005, -2.678821, 0, 0, 0, 1, 1,
-2.24517, 0.1420428, -0.7761541, 0, 0, 0, 1, 1,
-2.238955, 0.9466642, -1.845939, 1, 1, 1, 1, 1,
-2.235411, 0.713244, -1.024961, 1, 1, 1, 1, 1,
-2.220395, -0.360847, -1.754019, 1, 1, 1, 1, 1,
-2.146211, 0.3750963, -1.04426, 1, 1, 1, 1, 1,
-2.12431, 0.3322796, 0.4496824, 1, 1, 1, 1, 1,
-2.094786, -2.703918, -1.683103, 1, 1, 1, 1, 1,
-2.079437, -0.77333, -2.766633, 1, 1, 1, 1, 1,
-2.055937, -0.3471666, -2.550202, 1, 1, 1, 1, 1,
-2.052032, 2.437971, -0.4577032, 1, 1, 1, 1, 1,
-1.990922, -1.278773, -2.896176, 1, 1, 1, 1, 1,
-1.985837, -0.4771217, -4.328232, 1, 1, 1, 1, 1,
-1.952167, 0.02638934, -1.433028, 1, 1, 1, 1, 1,
-1.944796, 0.509859, -1.191251, 1, 1, 1, 1, 1,
-1.895521, 0.7114058, -1.583326, 1, 1, 1, 1, 1,
-1.89501, 0.5255091, -3.453599, 1, 1, 1, 1, 1,
-1.892118, 0.4319686, -0.6817994, 0, 0, 1, 1, 1,
-1.872285, 0.357329, -1.425884, 1, 0, 0, 1, 1,
-1.870036, 0.07976622, -1.68563, 1, 0, 0, 1, 1,
-1.863238, -0.7157755, -2.030421, 1, 0, 0, 1, 1,
-1.859022, -1.364242, -3.430632, 1, 0, 0, 1, 1,
-1.855937, -0.18095, -2.147708, 1, 0, 0, 1, 1,
-1.841103, -0.1372282, -0.14135, 0, 0, 0, 1, 1,
-1.827776, -1.317783, -3.402774, 0, 0, 0, 1, 1,
-1.800985, -0.9360535, -2.749987, 0, 0, 0, 1, 1,
-1.799545, -0.5906255, -2.469166, 0, 0, 0, 1, 1,
-1.794731, -0.3404666, 0.2672472, 0, 0, 0, 1, 1,
-1.782928, -0.2512642, 0.6030226, 0, 0, 0, 1, 1,
-1.755727, -1.492903, -2.018766, 0, 0, 0, 1, 1,
-1.712523, -0.5578098, 0.4286813, 1, 1, 1, 1, 1,
-1.691888, 1.633473, -0.2678345, 1, 1, 1, 1, 1,
-1.691599, -0.2132798, -3.080988, 1, 1, 1, 1, 1,
-1.67699, -0.01081048, -3.78142, 1, 1, 1, 1, 1,
-1.676185, -0.611755, -3.811783, 1, 1, 1, 1, 1,
-1.662915, -1.380259, -1.805227, 1, 1, 1, 1, 1,
-1.651522, 0.6755338, -2.746666, 1, 1, 1, 1, 1,
-1.640824, -1.756444, -1.190464, 1, 1, 1, 1, 1,
-1.625861, -0.3234184, -1.61076, 1, 1, 1, 1, 1,
-1.594924, -0.6140578, -1.247775, 1, 1, 1, 1, 1,
-1.587271, 1.081869, -0.9163617, 1, 1, 1, 1, 1,
-1.572509, 0.0219919, -2.450523, 1, 1, 1, 1, 1,
-1.553073, 0.6751955, 0.3536771, 1, 1, 1, 1, 1,
-1.551105, -0.3492656, -1.797673, 1, 1, 1, 1, 1,
-1.542075, 0.5533541, -0.7673993, 1, 1, 1, 1, 1,
-1.540902, 0.4204546, -0.5895467, 0, 0, 1, 1, 1,
-1.511522, -0.4068901, -0.1276796, 1, 0, 0, 1, 1,
-1.510679, 0.2057892, -1.600228, 1, 0, 0, 1, 1,
-1.50693, 0.4485848, -0.5119023, 1, 0, 0, 1, 1,
-1.503425, -0.5083407, -1.829474, 1, 0, 0, 1, 1,
-1.495712, 1.258166, -1.408267, 1, 0, 0, 1, 1,
-1.482385, -0.06363267, -0.9271963, 0, 0, 0, 1, 1,
-1.462449, 0.5136005, -1.368272, 0, 0, 0, 1, 1,
-1.450354, -0.1670406, -1.330567, 0, 0, 0, 1, 1,
-1.446816, 0.5261475, -0.01972227, 0, 0, 0, 1, 1,
-1.445942, -1.514588, -0.9161922, 0, 0, 0, 1, 1,
-1.44301, -0.061731, -1.019894, 0, 0, 0, 1, 1,
-1.43998, 0.08050348, -1.249507, 0, 0, 0, 1, 1,
-1.434313, -0.4335773, -2.002253, 1, 1, 1, 1, 1,
-1.427745, -0.3010028, -3.306641, 1, 1, 1, 1, 1,
-1.426505, -0.2627948, -0.9533845, 1, 1, 1, 1, 1,
-1.413832, -0.4802877, -1.933012, 1, 1, 1, 1, 1,
-1.412076, 0.9197216, -0.9117485, 1, 1, 1, 1, 1,
-1.409406, 1.395168, -0.9389237, 1, 1, 1, 1, 1,
-1.403718, -0.02827587, -1.173912, 1, 1, 1, 1, 1,
-1.382791, 0.2105478, -2.231495, 1, 1, 1, 1, 1,
-1.366929, -0.1406207, -0.07184114, 1, 1, 1, 1, 1,
-1.360496, 0.4630141, -0.4758681, 1, 1, 1, 1, 1,
-1.348135, -1.363687, -3.096284, 1, 1, 1, 1, 1,
-1.33742, 0.4797687, 0.559459, 1, 1, 1, 1, 1,
-1.331783, -0.01614586, -2.138016, 1, 1, 1, 1, 1,
-1.327122, 0.1300985, -1.371487, 1, 1, 1, 1, 1,
-1.324594, 1.703075, -1.703695, 1, 1, 1, 1, 1,
-1.312129, 0.4720651, -1.492063, 0, 0, 1, 1, 1,
-1.308822, -0.2436868, -1.340052, 1, 0, 0, 1, 1,
-1.303242, -1.299011, -3.22802, 1, 0, 0, 1, 1,
-1.297282, 0.3600388, -3.351933, 1, 0, 0, 1, 1,
-1.296679, 1.05799, -0.2107668, 1, 0, 0, 1, 1,
-1.291669, 1.532029, -0.6147587, 1, 0, 0, 1, 1,
-1.26755, 0.7912529, -2.124231, 0, 0, 0, 1, 1,
-1.266816, -0.3188738, -1.00232, 0, 0, 0, 1, 1,
-1.263896, -1.944573, -2.901286, 0, 0, 0, 1, 1,
-1.260306, 0.07726754, -1.870208, 0, 0, 0, 1, 1,
-1.260229, 0.1672391, 0.4087187, 0, 0, 0, 1, 1,
-1.260208, 0.7585862, -1.209448, 0, 0, 0, 1, 1,
-1.259525, 0.246389, -3.472983, 0, 0, 0, 1, 1,
-1.256438, 1.19603, -0.3032613, 1, 1, 1, 1, 1,
-1.255295, 3.230164, 0.2121032, 1, 1, 1, 1, 1,
-1.249061, 0.09299379, -1.797738, 1, 1, 1, 1, 1,
-1.240912, 0.177608, -2.456166, 1, 1, 1, 1, 1,
-1.240145, 0.394872, -3.594805, 1, 1, 1, 1, 1,
-1.239156, -1.154346, -0.3555998, 1, 1, 1, 1, 1,
-1.236469, -0.5434773, -2.369355, 1, 1, 1, 1, 1,
-1.232743, 0.7697944, -1.02655, 1, 1, 1, 1, 1,
-1.232613, 0.6080362, -1.076527, 1, 1, 1, 1, 1,
-1.22744, -0.08765591, -0.8177249, 1, 1, 1, 1, 1,
-1.217504, 1.802587, -1.35368, 1, 1, 1, 1, 1,
-1.207044, -1.362635, 0.1591516, 1, 1, 1, 1, 1,
-1.200246, -0.2249566, -1.664089, 1, 1, 1, 1, 1,
-1.19068, -0.7364652, -2.519414, 1, 1, 1, 1, 1,
-1.166791, 0.3939763, -1.45901, 1, 1, 1, 1, 1,
-1.16527, 1.639264, 0.03331816, 0, 0, 1, 1, 1,
-1.164991, 0.5924922, -2.104741, 1, 0, 0, 1, 1,
-1.164894, 0.045251, -1.64982, 1, 0, 0, 1, 1,
-1.164232, -2.348158, -4.132633, 1, 0, 0, 1, 1,
-1.163167, 0.2264375, -1.437863, 1, 0, 0, 1, 1,
-1.161887, -0.7703029, -2.390429, 1, 0, 0, 1, 1,
-1.159795, 0.2682156, -1.665226, 0, 0, 0, 1, 1,
-1.154252, -0.8005624, -3.21976, 0, 0, 0, 1, 1,
-1.140032, -1.678855, -3.488961, 0, 0, 0, 1, 1,
-1.132865, -0.3320175, -3.250399, 0, 0, 0, 1, 1,
-1.130271, -1.103752, -4.389194, 0, 0, 0, 1, 1,
-1.127753, -0.3371798, -1.322604, 0, 0, 0, 1, 1,
-1.125962, -0.05417411, -0.1567894, 0, 0, 0, 1, 1,
-1.124323, 0.02138719, -1.305109, 1, 1, 1, 1, 1,
-1.12148, 0.6528552, -0.7914292, 1, 1, 1, 1, 1,
-1.118552, 0.3734062, -3.135025, 1, 1, 1, 1, 1,
-1.113823, 1.375168, -1.545271, 1, 1, 1, 1, 1,
-1.113711, -1.838729, -0.8651811, 1, 1, 1, 1, 1,
-1.107928, -0.7024471, -1.960794, 1, 1, 1, 1, 1,
-1.103603, -0.953598, -2.502979, 1, 1, 1, 1, 1,
-1.103272, 1.172297, -0.8456621, 1, 1, 1, 1, 1,
-1.086583, -0.07503548, -2.962512, 1, 1, 1, 1, 1,
-1.083392, 0.3992327, -3.016814, 1, 1, 1, 1, 1,
-1.083082, 1.027234, -0.6603015, 1, 1, 1, 1, 1,
-1.080381, -0.01028976, -1.873131, 1, 1, 1, 1, 1,
-1.073532, 0.3752085, -2.298111, 1, 1, 1, 1, 1,
-1.070435, 0.1093302, -1.261957, 1, 1, 1, 1, 1,
-1.066365, 1.202758, -1.004728, 1, 1, 1, 1, 1,
-1.06361, -1.871306, -0.6177365, 0, 0, 1, 1, 1,
-1.063318, 0.5728071, -0.1742012, 1, 0, 0, 1, 1,
-1.053235, -0.7073562, -2.086896, 1, 0, 0, 1, 1,
-1.052686, -0.03185501, -1.522432, 1, 0, 0, 1, 1,
-1.05183, 0.04751609, -1.963862, 1, 0, 0, 1, 1,
-1.050879, 0.7981228, -0.4582817, 1, 0, 0, 1, 1,
-1.04143, -0.4575265, -3.048075, 0, 0, 0, 1, 1,
-1.039559, -0.1925305, -1.35416, 0, 0, 0, 1, 1,
-1.032536, 0.8153113, 0.4236096, 0, 0, 0, 1, 1,
-1.025023, -0.149743, -0.006249064, 0, 0, 0, 1, 1,
-1.010641, 0.2084525, 0.3361695, 0, 0, 0, 1, 1,
-1.004857, 0.1150081, 0.3974563, 0, 0, 0, 1, 1,
-0.9952733, -0.7064579, -3.45651, 0, 0, 0, 1, 1,
-0.9752571, -0.4738051, -2.431576, 1, 1, 1, 1, 1,
-0.9748514, -0.01358511, 0.3744883, 1, 1, 1, 1, 1,
-0.9736543, -0.6765233, -3.679451, 1, 1, 1, 1, 1,
-0.9715554, -0.8811179, -0.2304076, 1, 1, 1, 1, 1,
-0.9670231, -0.4561304, -1.812844, 1, 1, 1, 1, 1,
-0.9657992, 0.3512996, -2.935723, 1, 1, 1, 1, 1,
-0.9609233, -0.05589875, -2.074248, 1, 1, 1, 1, 1,
-0.9604686, 0.727661, -0.374497, 1, 1, 1, 1, 1,
-0.952934, 0.2266322, -0.9379844, 1, 1, 1, 1, 1,
-0.9420483, -0.05119225, -2.921948, 1, 1, 1, 1, 1,
-0.9410906, 0.5627497, -1.871218, 1, 1, 1, 1, 1,
-0.9294821, 0.1318084, -1.114867, 1, 1, 1, 1, 1,
-0.9280562, -1.354379, -3.519986, 1, 1, 1, 1, 1,
-0.9169179, -0.8885033, -1.309858, 1, 1, 1, 1, 1,
-0.9137736, -0.2576923, -1.423896, 1, 1, 1, 1, 1,
-0.9133406, -0.0555911, -1.339419, 0, 0, 1, 1, 1,
-0.9022357, -0.002525917, -3.599185, 1, 0, 0, 1, 1,
-0.9005523, 0.7469122, 0.1058856, 1, 0, 0, 1, 1,
-0.899249, 0.4306418, -0.9380682, 1, 0, 0, 1, 1,
-0.8981706, 1.627599, -0.717127, 1, 0, 0, 1, 1,
-0.8968791, 0.106494, -1.700303, 1, 0, 0, 1, 1,
-0.8909331, -0.4360053, -2.686054, 0, 0, 0, 1, 1,
-0.8876421, -1.985397, -3.404455, 0, 0, 0, 1, 1,
-0.8775211, -0.3578714, -2.918433, 0, 0, 0, 1, 1,
-0.8590285, -0.9960508, -2.891675, 0, 0, 0, 1, 1,
-0.853889, 0.6186322, 0.4034989, 0, 0, 0, 1, 1,
-0.8489521, -0.7016718, -2.731881, 0, 0, 0, 1, 1,
-0.8351797, -1.091583, -2.028199, 0, 0, 0, 1, 1,
-0.8348643, 0.2477208, -2.025961, 1, 1, 1, 1, 1,
-0.8323236, -1.054567, -3.729303, 1, 1, 1, 1, 1,
-0.8284824, 1.755805, -0.1364373, 1, 1, 1, 1, 1,
-0.8234034, -1.546026, -2.231079, 1, 1, 1, 1, 1,
-0.8218008, 1.718488, 0.7411066, 1, 1, 1, 1, 1,
-0.8032839, -0.6214642, -2.229279, 1, 1, 1, 1, 1,
-0.8028153, 0.6338139, 0.2448531, 1, 1, 1, 1, 1,
-0.8013168, -1.282846, -2.778747, 1, 1, 1, 1, 1,
-0.8000873, -0.8181021, -1.691199, 1, 1, 1, 1, 1,
-0.7931162, -0.09360701, -3.211054, 1, 1, 1, 1, 1,
-0.7903678, -0.1562042, -1.858992, 1, 1, 1, 1, 1,
-0.7884964, 2.015225, 0.3541327, 1, 1, 1, 1, 1,
-0.7817692, -1.642662, -4.710766, 1, 1, 1, 1, 1,
-0.778904, 0.7786071, -2.307692, 1, 1, 1, 1, 1,
-0.7747687, -0.5552307, -1.070101, 1, 1, 1, 1, 1,
-0.7695512, 0.8908197, -2.345411, 0, 0, 1, 1, 1,
-0.769121, 1.353501, -1.017045, 1, 0, 0, 1, 1,
-0.7636185, 0.7467483, 0.2313643, 1, 0, 0, 1, 1,
-0.7623942, 1.319919, 0.009496624, 1, 0, 0, 1, 1,
-0.7560996, 1.385906, -0.4757209, 1, 0, 0, 1, 1,
-0.7526342, 1.095713, -0.3933786, 1, 0, 0, 1, 1,
-0.7396528, 0.3267855, -0.2947149, 0, 0, 0, 1, 1,
-0.7306734, 0.8075169, -1.521726, 0, 0, 0, 1, 1,
-0.7300199, -0.5493057, -2.560794, 0, 0, 0, 1, 1,
-0.7125522, 0.5041189, -2.858183, 0, 0, 0, 1, 1,
-0.711451, -0.1223689, -3.465628, 0, 0, 0, 1, 1,
-0.7105365, -0.02736669, -0.6978464, 0, 0, 0, 1, 1,
-0.7091251, -0.07776751, -0.2017472, 0, 0, 0, 1, 1,
-0.7089202, 1.515956, -1.001632, 1, 1, 1, 1, 1,
-0.7078525, 0.9130787, -0.8623337, 1, 1, 1, 1, 1,
-0.7061298, -0.75392, -2.974886, 1, 1, 1, 1, 1,
-0.7054988, -0.115856, -1.426709, 1, 1, 1, 1, 1,
-0.7049189, 0.7764788, -1.276011, 1, 1, 1, 1, 1,
-0.6982909, -1.361985, -2.817985, 1, 1, 1, 1, 1,
-0.6980728, 0.3693771, -2.445455, 1, 1, 1, 1, 1,
-0.6926727, -1.089905, -2.315519, 1, 1, 1, 1, 1,
-0.6898403, -0.5690316, -1.88519, 1, 1, 1, 1, 1,
-0.6867293, 1.834922, 0.1700055, 1, 1, 1, 1, 1,
-0.682901, 0.3709427, -1.205883, 1, 1, 1, 1, 1,
-0.6821808, -0.9940262, -3.33618, 1, 1, 1, 1, 1,
-0.6781729, 0.2529342, -0.9843143, 1, 1, 1, 1, 1,
-0.6727595, 0.1038856, -1.558268, 1, 1, 1, 1, 1,
-0.6726158, -1.211692, -2.307796, 1, 1, 1, 1, 1,
-0.6716504, 0.5024616, -0.539635, 0, 0, 1, 1, 1,
-0.6699292, -1.429203, -3.106653, 1, 0, 0, 1, 1,
-0.6657444, -0.318302, -1.36784, 1, 0, 0, 1, 1,
-0.6644123, -1.228255, -1.762768, 1, 0, 0, 1, 1,
-0.663914, 2.226162, -2.081003, 1, 0, 0, 1, 1,
-0.6599658, -0.7603923, -3.067846, 1, 0, 0, 1, 1,
-0.6566939, 0.4886412, 0.3244487, 0, 0, 0, 1, 1,
-0.6565327, 0.9326993, -0.9220098, 0, 0, 0, 1, 1,
-0.6505119, -0.9481604, -1.220157, 0, 0, 0, 1, 1,
-0.6485154, 1.046449, -0.3763593, 0, 0, 0, 1, 1,
-0.6462265, -0.6391276, -3.384791, 0, 0, 0, 1, 1,
-0.6435244, 0.8025879, -1.423587, 0, 0, 0, 1, 1,
-0.6335205, -1.643997, -3.137016, 0, 0, 0, 1, 1,
-0.6315532, 0.949247, -0.9548744, 1, 1, 1, 1, 1,
-0.6315468, 0.5982075, 0.7320589, 1, 1, 1, 1, 1,
-0.6259401, 0.3269599, 0.7209721, 1, 1, 1, 1, 1,
-0.6202821, -0.5416991, -4.592796, 1, 1, 1, 1, 1,
-0.6182435, 0.2503585, -0.5611196, 1, 1, 1, 1, 1,
-0.6090753, -1.001243, -2.191107, 1, 1, 1, 1, 1,
-0.5940772, 1.139961, 1.262069, 1, 1, 1, 1, 1,
-0.5893152, 0.2438492, -1.364443, 1, 1, 1, 1, 1,
-0.5865216, 0.0160383, -0.6621696, 1, 1, 1, 1, 1,
-0.5830793, 0.9329602, -0.8838742, 1, 1, 1, 1, 1,
-0.581802, -1.949406, -2.536093, 1, 1, 1, 1, 1,
-0.5748186, 0.3529748, -0.2353576, 1, 1, 1, 1, 1,
-0.5718477, -0.02710916, -2.337387, 1, 1, 1, 1, 1,
-0.5715932, 0.5419474, -0.4062712, 1, 1, 1, 1, 1,
-0.5714484, 0.06495129, -2.282936, 1, 1, 1, 1, 1,
-0.5700132, 1.24242, -0.6725367, 0, 0, 1, 1, 1,
-0.5665872, 0.4726905, 0.1515675, 1, 0, 0, 1, 1,
-0.5651521, -0.6423306, -1.330174, 1, 0, 0, 1, 1,
-0.5643709, 0.07042837, -1.304664, 1, 0, 0, 1, 1,
-0.5635032, 0.6766098, -1.030371, 1, 0, 0, 1, 1,
-0.5583259, -0.4811647, -1.389274, 1, 0, 0, 1, 1,
-0.5531126, -0.7228273, -2.59877, 0, 0, 0, 1, 1,
-0.5512235, -0.06833149, -0.5332274, 0, 0, 0, 1, 1,
-0.5509024, 1.923664, 1.023226, 0, 0, 0, 1, 1,
-0.5451032, 1.835659, -1.517424, 0, 0, 0, 1, 1,
-0.5439641, -0.1745062, -1.085944, 0, 0, 0, 1, 1,
-0.5364341, 0.2722946, -2.449558, 0, 0, 0, 1, 1,
-0.536118, 1.273558, -0.0303019, 0, 0, 0, 1, 1,
-0.5322344, 0.1915482, -0.5599335, 1, 1, 1, 1, 1,
-0.5313385, -0.01560297, -0.3580862, 1, 1, 1, 1, 1,
-0.528943, -0.4688674, -3.373054, 1, 1, 1, 1, 1,
-0.527928, -0.5947284, -3.658062, 1, 1, 1, 1, 1,
-0.5274005, 0.1237158, -0.02285456, 1, 1, 1, 1, 1,
-0.5258108, -0.3664584, -1.043255, 1, 1, 1, 1, 1,
-0.5240775, 1.081929, -1.153218, 1, 1, 1, 1, 1,
-0.5099429, -0.1404927, -0.933099, 1, 1, 1, 1, 1,
-0.5079536, -0.02524867, -2.01788, 1, 1, 1, 1, 1,
-0.5079259, -1.233473, -4.572575, 1, 1, 1, 1, 1,
-0.50391, 1.023651, -1.017077, 1, 1, 1, 1, 1,
-0.5030279, 0.584964, -1.291643, 1, 1, 1, 1, 1,
-0.5022046, -0.1918853, -2.833943, 1, 1, 1, 1, 1,
-0.4957708, -1.264366, -3.123548, 1, 1, 1, 1, 1,
-0.4920669, -0.2118217, -2.893711, 1, 1, 1, 1, 1,
-0.4862137, 0.1595984, -1.430038, 0, 0, 1, 1, 1,
-0.4818023, -0.7601964, -1.403457, 1, 0, 0, 1, 1,
-0.4744414, -0.1972461, -0.3874596, 1, 0, 0, 1, 1,
-0.4732277, -0.5631159, -3.758933, 1, 0, 0, 1, 1,
-0.4725107, -1.21592, -1.843415, 1, 0, 0, 1, 1,
-0.4685596, -0.8188501, -3.525642, 1, 0, 0, 1, 1,
-0.4676884, 0.4606743, -1.827811, 0, 0, 0, 1, 1,
-0.4671068, -0.6588508, -2.902198, 0, 0, 0, 1, 1,
-0.464905, 0.6018268, 0.4406318, 0, 0, 0, 1, 1,
-0.4606147, -1.097277, -1.26823, 0, 0, 0, 1, 1,
-0.459793, -0.6229053, -3.90809, 0, 0, 0, 1, 1,
-0.4590851, -1.320033, -1.353587, 0, 0, 0, 1, 1,
-0.4570749, 1.045714, 0.1370643, 0, 0, 0, 1, 1,
-0.4515228, -0.409286, -5.681196, 1, 1, 1, 1, 1,
-0.4506011, -0.3682121, -2.371371, 1, 1, 1, 1, 1,
-0.4480869, 1.874667, 0.08581432, 1, 1, 1, 1, 1,
-0.4459847, 0.2629953, 1.138889, 1, 1, 1, 1, 1,
-0.4459664, 0.2828465, 0.02075351, 1, 1, 1, 1, 1,
-0.4452638, -0.7863536, -1.645579, 1, 1, 1, 1, 1,
-0.4452632, -0.3263644, -2.059354, 1, 1, 1, 1, 1,
-0.4444122, 0.06081782, -3.587392, 1, 1, 1, 1, 1,
-0.4433176, 0.1514752, 0.698981, 1, 1, 1, 1, 1,
-0.4371578, 0.8995158, -0.5004177, 1, 1, 1, 1, 1,
-0.4361779, 0.7171664, -0.272089, 1, 1, 1, 1, 1,
-0.4338107, 0.9953961, 1.48052, 1, 1, 1, 1, 1,
-0.4318231, 2.102233, 0.2044491, 1, 1, 1, 1, 1,
-0.431424, 0.1369846, -2.260883, 1, 1, 1, 1, 1,
-0.4313114, 0.4713562, -0.8687913, 1, 1, 1, 1, 1,
-0.4230656, -0.3209719, -3.017167, 0, 0, 1, 1, 1,
-0.4211478, -0.3274971, -1.952902, 1, 0, 0, 1, 1,
-0.4200392, 1.369271, -2.42981, 1, 0, 0, 1, 1,
-0.4186171, -1.50502, -3.322875, 1, 0, 0, 1, 1,
-0.4060495, -0.33442, 0.9768065, 1, 0, 0, 1, 1,
-0.4057587, -0.2740638, -2.496751, 1, 0, 0, 1, 1,
-0.4041493, -0.3578089, -2.81135, 0, 0, 0, 1, 1,
-0.4023211, -0.746774, -1.235424, 0, 0, 0, 1, 1,
-0.4023049, 0.1352383, -1.972311, 0, 0, 0, 1, 1,
-0.4020587, -0.6667069, -3.158142, 0, 0, 0, 1, 1,
-0.3985977, -0.8980469, -3.656662, 0, 0, 0, 1, 1,
-0.3959732, 0.5298426, -1.259542, 0, 0, 0, 1, 1,
-0.3887421, -0.6327142, -1.24952, 0, 0, 0, 1, 1,
-0.3884247, 0.7247638, 0.9392216, 1, 1, 1, 1, 1,
-0.3796987, -0.2293874, -2.498547, 1, 1, 1, 1, 1,
-0.3776747, 0.7119638, -2.009372, 1, 1, 1, 1, 1,
-0.3668634, 0.5175657, -0.9910044, 1, 1, 1, 1, 1,
-0.3665986, 0.731445, -0.2124641, 1, 1, 1, 1, 1,
-0.3635238, 2.961372, 1.697937, 1, 1, 1, 1, 1,
-0.3635212, -1.36582, -1.944347, 1, 1, 1, 1, 1,
-0.3612531, 0.7058095, 0.7927878, 1, 1, 1, 1, 1,
-0.356135, 2.066062, 1.092929, 1, 1, 1, 1, 1,
-0.3546807, 0.04890149, -2.576879, 1, 1, 1, 1, 1,
-0.3513364, 1.434745, -1.187819, 1, 1, 1, 1, 1,
-0.351025, -0.2536187, -0.873541, 1, 1, 1, 1, 1,
-0.350809, 1.28076, 0.01059011, 1, 1, 1, 1, 1,
-0.349539, 1.585563, -0.9205151, 1, 1, 1, 1, 1,
-0.3454404, 1.544888, 0.8872542, 1, 1, 1, 1, 1,
-0.3442113, 1.408487, -0.1758744, 0, 0, 1, 1, 1,
-0.3435322, 0.4538113, 0.7306346, 1, 0, 0, 1, 1,
-0.3430586, -1.007294, -2.012411, 1, 0, 0, 1, 1,
-0.3427171, -1.260744, -1.969878, 1, 0, 0, 1, 1,
-0.340569, -1.162504, -4.034404, 1, 0, 0, 1, 1,
-0.3368841, -0.008733445, -3.084578, 1, 0, 0, 1, 1,
-0.3366747, 0.4110995, -2.690757, 0, 0, 0, 1, 1,
-0.3355094, -1.417948, -3.943283, 0, 0, 0, 1, 1,
-0.3353601, -1.281064, -2.680563, 0, 0, 0, 1, 1,
-0.3337986, -0.2982342, -2.71011, 0, 0, 0, 1, 1,
-0.3324519, 0.4918802, -1.014129, 0, 0, 0, 1, 1,
-0.3312029, -1.421747, -3.078911, 0, 0, 0, 1, 1,
-0.325289, -0.4175745, -2.721784, 0, 0, 0, 1, 1,
-0.3220987, -0.2442559, -1.957279, 1, 1, 1, 1, 1,
-0.3203337, 0.6879618, 0.1164557, 1, 1, 1, 1, 1,
-0.3135698, -1.031037, -3.23378, 1, 1, 1, 1, 1,
-0.3111184, -0.442297, -1.1514, 1, 1, 1, 1, 1,
-0.3107014, -0.4969675, -1.814548, 1, 1, 1, 1, 1,
-0.303687, 0.08652867, -0.722027, 1, 1, 1, 1, 1,
-0.3013871, 1.824659, -0.4520536, 1, 1, 1, 1, 1,
-0.3009346, 1.012303, 0.002637765, 1, 1, 1, 1, 1,
-0.2998945, -1.552436, -2.573148, 1, 1, 1, 1, 1,
-0.2953844, -2.150392, -4.752084, 1, 1, 1, 1, 1,
-0.2931159, 1.386457, 0.8227283, 1, 1, 1, 1, 1,
-0.2920615, -1.234278, -1.492244, 1, 1, 1, 1, 1,
-0.2873473, 0.271172, -0.8884439, 1, 1, 1, 1, 1,
-0.2795656, -0.4988821, -1.995251, 1, 1, 1, 1, 1,
-0.2794527, 0.2115889, -0.6364353, 1, 1, 1, 1, 1,
-0.2780995, -1.602506, -3.281815, 0, 0, 1, 1, 1,
-0.2770795, -0.8803709, -4.142604, 1, 0, 0, 1, 1,
-0.2735006, 0.2632343, -2.302514, 1, 0, 0, 1, 1,
-0.2730627, -0.9331815, -1.145833, 1, 0, 0, 1, 1,
-0.273059, 0.3032637, -0.4116246, 1, 0, 0, 1, 1,
-0.2718161, -0.224171, -1.913703, 1, 0, 0, 1, 1,
-0.2703373, -1.656772, -2.48487, 0, 0, 0, 1, 1,
-0.2680667, 0.1375351, -2.30991, 0, 0, 0, 1, 1,
-0.2663256, -0.5147832, -3.172495, 0, 0, 0, 1, 1,
-0.26528, 0.857464, -1.772152, 0, 0, 0, 1, 1,
-0.2649663, -0.3981872, -2.122475, 0, 0, 0, 1, 1,
-0.2636745, -0.07525842, -1.272075, 0, 0, 0, 1, 1,
-0.259277, -0.4117051, -2.289829, 0, 0, 0, 1, 1,
-0.2549816, -1.014439, -2.565435, 1, 1, 1, 1, 1,
-0.2514071, 1.651188, 0.908362, 1, 1, 1, 1, 1,
-0.2502626, 1.542481, -1.275162, 1, 1, 1, 1, 1,
-0.24765, -2.2233, -3.417094, 1, 1, 1, 1, 1,
-0.2457247, 1.413659, -0.5087236, 1, 1, 1, 1, 1,
-0.2451154, 0.09528101, 1.32815, 1, 1, 1, 1, 1,
-0.2429888, -0.7350803, -3.126237, 1, 1, 1, 1, 1,
-0.2424165, -1.20919, -2.70587, 1, 1, 1, 1, 1,
-0.2404214, -0.8789355, -2.803556, 1, 1, 1, 1, 1,
-0.2382838, -2.140292, -3.758662, 1, 1, 1, 1, 1,
-0.2367365, -0.5025761, -3.57558, 1, 1, 1, 1, 1,
-0.2340197, -0.2407092, -3.409803, 1, 1, 1, 1, 1,
-0.2326674, -0.6156275, -2.791344, 1, 1, 1, 1, 1,
-0.2271184, 0.4925487, -0.6450462, 1, 1, 1, 1, 1,
-0.226557, 0.4644029, 0.5091765, 1, 1, 1, 1, 1,
-0.2189887, 1.955827, 0.2282897, 0, 0, 1, 1, 1,
-0.2187927, -0.6771281, -3.842502, 1, 0, 0, 1, 1,
-0.217899, -0.4051104, -2.289304, 1, 0, 0, 1, 1,
-0.214127, -1.478302, -3.027841, 1, 0, 0, 1, 1,
-0.2088434, 1.003542, -1.100686, 1, 0, 0, 1, 1,
-0.2084411, -0.7427987, -3.46382, 1, 0, 0, 1, 1,
-0.206867, 1.387513, -0.8442142, 0, 0, 0, 1, 1,
-0.2051661, -0.6729388, -3.23895, 0, 0, 0, 1, 1,
-0.2050735, -0.9858739, -2.608563, 0, 0, 0, 1, 1,
-0.2030512, -0.8419846, -2.139736, 0, 0, 0, 1, 1,
-0.2013008, -1.313681, -2.427025, 0, 0, 0, 1, 1,
-0.2007725, 1.515811, -1.419937, 0, 0, 0, 1, 1,
-0.2006541, 0.09332906, -0.2477032, 0, 0, 0, 1, 1,
-0.195075, 2.417639, 0.1349766, 1, 1, 1, 1, 1,
-0.1921182, -0.5445633, -4.107089, 1, 1, 1, 1, 1,
-0.1829202, -0.2415271, -2.729753, 1, 1, 1, 1, 1,
-0.1776568, 0.3800093, -0.4198942, 1, 1, 1, 1, 1,
-0.1743926, -0.5615597, -2.914302, 1, 1, 1, 1, 1,
-0.1717571, -2.850268, -1.803866, 1, 1, 1, 1, 1,
-0.1715677, -0.308204, -2.285207, 1, 1, 1, 1, 1,
-0.1683719, 0.249732, -1.175513, 1, 1, 1, 1, 1,
-0.1655018, -0.204279, -5.193193, 1, 1, 1, 1, 1,
-0.1615362, 0.52799, 0.1510698, 1, 1, 1, 1, 1,
-0.1612905, -0.203917, -1.949296, 1, 1, 1, 1, 1,
-0.1601245, 0.865345, -0.7746348, 1, 1, 1, 1, 1,
-0.158675, 0.6084028, -0.1309244, 1, 1, 1, 1, 1,
-0.1575339, 2.10958, -0.150509, 1, 1, 1, 1, 1,
-0.1533502, 1.200115, -0.3314749, 1, 1, 1, 1, 1,
-0.1523079, -1.155278, -4.792429, 0, 0, 1, 1, 1,
-0.1520183, 0.05853744, -0.8758671, 1, 0, 0, 1, 1,
-0.1517513, 0.6832742, -0.1416658, 1, 0, 0, 1, 1,
-0.1509185, 0.9241233, -1.180722, 1, 0, 0, 1, 1,
-0.1453902, 0.4215356, 0.9192483, 1, 0, 0, 1, 1,
-0.143941, -0.4982661, -3.180207, 1, 0, 0, 1, 1,
-0.1423341, 1.35578, -1.619334, 0, 0, 0, 1, 1,
-0.1381748, 0.5887345, -0.1216528, 0, 0, 0, 1, 1,
-0.1370339, -0.007788446, -2.775604, 0, 0, 0, 1, 1,
-0.133128, -0.1569291, -2.35446, 0, 0, 0, 1, 1,
-0.1291988, -0.9782585, -5.156137, 0, 0, 0, 1, 1,
-0.1288676, -0.08405975, -3.26427, 0, 0, 0, 1, 1,
-0.1258852, 0.4361628, -0.09165218, 0, 0, 0, 1, 1,
-0.1254585, 0.00568361, 0.2226129, 1, 1, 1, 1, 1,
-0.1222781, -1.424497, -2.869591, 1, 1, 1, 1, 1,
-0.1190977, 0.8087488, -1.067021, 1, 1, 1, 1, 1,
-0.117104, -1.450578, -4.084758, 1, 1, 1, 1, 1,
-0.1147901, 0.6557267, 0.4047053, 1, 1, 1, 1, 1,
-0.1121971, -0.6218104, -3.805632, 1, 1, 1, 1, 1,
-0.1107909, 0.1708083, -1.49279, 1, 1, 1, 1, 1,
-0.1066437, 0.3864728, -0.635885, 1, 1, 1, 1, 1,
-0.0993285, -0.2793065, -2.977589, 1, 1, 1, 1, 1,
-0.09851885, 1.294561, 0.119162, 1, 1, 1, 1, 1,
-0.09362628, -0.4072926, -4.672627, 1, 1, 1, 1, 1,
-0.08993076, 0.5014248, -1.124898, 1, 1, 1, 1, 1,
-0.08963818, -0.6053773, -2.853155, 1, 1, 1, 1, 1,
-0.08962978, -1.621822, -3.02465, 1, 1, 1, 1, 1,
-0.08633293, 0.117236, -0.2229572, 1, 1, 1, 1, 1,
-0.08426025, 1.014391, -1.166283, 0, 0, 1, 1, 1,
-0.08260623, -0.8490031, -2.256224, 1, 0, 0, 1, 1,
-0.08097367, -1.460007, -1.488818, 1, 0, 0, 1, 1,
-0.08083081, 1.965313, -0.4394772, 1, 0, 0, 1, 1,
-0.07899794, 1.170923, 0.3144168, 1, 0, 0, 1, 1,
-0.07788688, -0.1431604, -1.792787, 1, 0, 0, 1, 1,
-0.07406887, 0.0684264, -1.203625, 0, 0, 0, 1, 1,
-0.07086866, 0.09475534, -0.04177091, 0, 0, 0, 1, 1,
-0.06655844, -1.044407, -0.2371939, 0, 0, 0, 1, 1,
-0.06067508, 0.850788, 0.6173322, 0, 0, 0, 1, 1,
-0.05504842, -0.1969252, -1.822628, 0, 0, 0, 1, 1,
-0.05420132, 1.645293, 0.3384653, 0, 0, 0, 1, 1,
-0.05200287, 0.1087222, 0.7011211, 0, 0, 0, 1, 1,
-0.05148871, -1.024115, -2.901783, 1, 1, 1, 1, 1,
-0.04742429, 0.9359977, -1.226977, 1, 1, 1, 1, 1,
-0.04462352, 1.874322, -0.09757243, 1, 1, 1, 1, 1,
-0.04405597, -0.2267278, -2.744992, 1, 1, 1, 1, 1,
-0.04113088, 0.4631581, -0.7864072, 1, 1, 1, 1, 1,
-0.03924433, -0.03393823, -0.7434179, 1, 1, 1, 1, 1,
-0.03874231, 0.7884189, 0.6281093, 1, 1, 1, 1, 1,
-0.03868426, 0.4588737, -1.558883, 1, 1, 1, 1, 1,
-0.03728642, -1.136607, -2.204385, 1, 1, 1, 1, 1,
-0.03587325, -0.9535853, -3.689916, 1, 1, 1, 1, 1,
-0.032272, 1.243772, -0.7507142, 1, 1, 1, 1, 1,
-0.03199208, -1.015599, -3.540011, 1, 1, 1, 1, 1,
-0.02689186, 1.279597, 1.625862, 1, 1, 1, 1, 1,
-0.02458842, -0.03725297, -2.871032, 1, 1, 1, 1, 1,
-0.02188246, 0.395927, 0.4869567, 1, 1, 1, 1, 1,
-0.02187251, 0.3817486, 0.4358736, 0, 0, 1, 1, 1,
-0.020912, 0.5470329, -0.6839727, 1, 0, 0, 1, 1,
-0.02073886, 0.05229102, -0.2167236, 1, 0, 0, 1, 1,
-0.01999057, -1.394388, -1.48045, 1, 0, 0, 1, 1,
-0.0181286, -0.01395022, -2.07412, 1, 0, 0, 1, 1,
-0.01793958, -1.088188, -4.548387, 1, 0, 0, 1, 1,
-0.01649149, 0.9847828, -0.1330424, 0, 0, 0, 1, 1,
-0.01240201, -0.03138828, -2.911197, 0, 0, 0, 1, 1,
-0.01234431, 0.6121076, -0.03101224, 0, 0, 0, 1, 1,
-0.008690573, 1.097649, -1.421794, 0, 0, 0, 1, 1,
-0.002359895, 0.9165848, 0.5587482, 0, 0, 0, 1, 1,
0.001665985, -0.647688, 2.077995, 0, 0, 0, 1, 1,
0.001859518, 0.04652059, -1.22092, 0, 0, 0, 1, 1,
0.00241318, 1.319709, -0.5209596, 1, 1, 1, 1, 1,
0.008232961, 0.1413014, 2.56732, 1, 1, 1, 1, 1,
0.009681577, 0.5341204, -0.4676138, 1, 1, 1, 1, 1,
0.01016475, 0.6953598, -0.9744021, 1, 1, 1, 1, 1,
0.01035749, 0.6216817, 0.1238801, 1, 1, 1, 1, 1,
0.01046277, -1.007398, 3.922494, 1, 1, 1, 1, 1,
0.01142074, -0.4005899, 4.208409, 1, 1, 1, 1, 1,
0.01410492, 0.7192006, -0.3359727, 1, 1, 1, 1, 1,
0.01867524, -0.4977867, 2.218986, 1, 1, 1, 1, 1,
0.0188453, -0.06515522, 4.823174, 1, 1, 1, 1, 1,
0.02595867, 0.5888372, -0.3282395, 1, 1, 1, 1, 1,
0.02769304, 2.22067, -0.8926518, 1, 1, 1, 1, 1,
0.02982605, 0.9150614, -0.4455579, 1, 1, 1, 1, 1,
0.03004354, -0.5946018, 2.093935, 1, 1, 1, 1, 1,
0.03531551, -1.071915, 1.189633, 1, 1, 1, 1, 1,
0.03751451, -0.200653, 3.06623, 0, 0, 1, 1, 1,
0.04329295, -0.1181748, 1.533401, 1, 0, 0, 1, 1,
0.04626176, 1.248032, -0.2651053, 1, 0, 0, 1, 1,
0.050375, -0.476994, 3.253927, 1, 0, 0, 1, 1,
0.05391449, -0.2578187, 2.838549, 1, 0, 0, 1, 1,
0.05404643, -0.7020739, 4.005566, 1, 0, 0, 1, 1,
0.05871444, 0.2468495, -1.128041, 0, 0, 0, 1, 1,
0.06963475, -1.395258, 1.736343, 0, 0, 0, 1, 1,
0.07116379, -1.114385, 1.773605, 0, 0, 0, 1, 1,
0.07343665, 1.490404, -0.5320312, 0, 0, 0, 1, 1,
0.076469, 0.9512281, 1.854347, 0, 0, 0, 1, 1,
0.07652985, -0.06652319, 4.423504, 0, 0, 0, 1, 1,
0.08010793, -0.3407591, 2.217688, 0, 0, 0, 1, 1,
0.08084344, -0.1861184, 3.049601, 1, 1, 1, 1, 1,
0.08099374, 0.6568009, 0.5368478, 1, 1, 1, 1, 1,
0.08448458, 1.564496, -1.039589, 1, 1, 1, 1, 1,
0.08825806, -0.2709414, 2.866143, 1, 1, 1, 1, 1,
0.09076408, 0.351171, 1.908547, 1, 1, 1, 1, 1,
0.09106827, 0.4058094, -0.04106743, 1, 1, 1, 1, 1,
0.09132885, -0.5842527, 2.601289, 1, 1, 1, 1, 1,
0.09161222, -0.473819, 4.997844, 1, 1, 1, 1, 1,
0.09776801, 1.453792, -0.8723601, 1, 1, 1, 1, 1,
0.09941945, -1.196194, 2.678437, 1, 1, 1, 1, 1,
0.09974727, 0.4998541, 0.2759909, 1, 1, 1, 1, 1,
0.1061219, -1.060925, 3.130889, 1, 1, 1, 1, 1,
0.1061339, -0.7154526, 4.838033, 1, 1, 1, 1, 1,
0.1063117, -0.5259024, 4.656573, 1, 1, 1, 1, 1,
0.1141727, -0.1271107, 2.294676, 1, 1, 1, 1, 1,
0.1152156, 1.040704, -0.7427369, 0, 0, 1, 1, 1,
0.1184636, 2.743078, 0.06886168, 1, 0, 0, 1, 1,
0.12056, -0.5360423, 2.713101, 1, 0, 0, 1, 1,
0.1206717, 0.8344337, 1.71349, 1, 0, 0, 1, 1,
0.1233115, -0.3471638, 3.837604, 1, 0, 0, 1, 1,
0.1236817, 0.2846166, -1.179759, 1, 0, 0, 1, 1,
0.1242719, 0.03942063, 1.401482, 0, 0, 0, 1, 1,
0.1272057, -2.045629, 2.661391, 0, 0, 0, 1, 1,
0.1287042, -0.4803642, 3.533776, 0, 0, 0, 1, 1,
0.1312323, 0.3631167, 1.433643, 0, 0, 0, 1, 1,
0.13188, -1.69053, 2.582463, 0, 0, 0, 1, 1,
0.1322671, 0.6073785, -0.3239363, 0, 0, 0, 1, 1,
0.133868, -0.5769424, 2.924709, 0, 0, 0, 1, 1,
0.1400093, -0.06141552, 0.5588396, 1, 1, 1, 1, 1,
0.1429633, -0.8871282, 1.037729, 1, 1, 1, 1, 1,
0.1433115, 0.9426667, -2.044923, 1, 1, 1, 1, 1,
0.147561, -0.2123382, 3.476618, 1, 1, 1, 1, 1,
0.1481233, -0.7711426, 2.811593, 1, 1, 1, 1, 1,
0.1496085, -0.0464438, 2.107522, 1, 1, 1, 1, 1,
0.1523136, -0.1672679, 2.090234, 1, 1, 1, 1, 1,
0.1525646, -0.2763295, 4.181108, 1, 1, 1, 1, 1,
0.1549054, -0.4598938, 3.462372, 1, 1, 1, 1, 1,
0.1555948, -1.219917, 3.798406, 1, 1, 1, 1, 1,
0.1570783, 1.114867, 0.04335406, 1, 1, 1, 1, 1,
0.1575019, -1.0051, 2.75956, 1, 1, 1, 1, 1,
0.1575638, -0.04259584, 3.690701, 1, 1, 1, 1, 1,
0.1579032, -0.5841122, 2.253809, 1, 1, 1, 1, 1,
0.1604853, -1.049351, 3.82905, 1, 1, 1, 1, 1,
0.1610986, 0.1926795, 2.144507, 0, 0, 1, 1, 1,
0.1627649, -1.253065, 3.73447, 1, 0, 0, 1, 1,
0.1640121, 0.944851, 1.244285, 1, 0, 0, 1, 1,
0.1642316, 0.6271092, 0.1687865, 1, 0, 0, 1, 1,
0.1755237, 3.109253, 0.5977225, 1, 0, 0, 1, 1,
0.1755609, 1.099372, -0.2936386, 1, 0, 0, 1, 1,
0.1773063, -1.712691, 2.360754, 0, 0, 0, 1, 1,
0.1776656, -1.001993, 3.786851, 0, 0, 0, 1, 1,
0.1791951, -0.9305497, 2.387275, 0, 0, 0, 1, 1,
0.1860259, -1.112104, 1.688842, 0, 0, 0, 1, 1,
0.1887468, -1.475992, 4.718254, 0, 0, 0, 1, 1,
0.1910987, 1.545828, -1.285771, 0, 0, 0, 1, 1,
0.1996105, 0.8491661, 1.469416, 0, 0, 0, 1, 1,
0.2023917, -0.4837882, 4.083797, 1, 1, 1, 1, 1,
0.2039316, -0.5181144, 2.496092, 1, 1, 1, 1, 1,
0.2045118, -1.696834, 4.053008, 1, 1, 1, 1, 1,
0.2052373, -2.856374, 4.103593, 1, 1, 1, 1, 1,
0.2058325, 0.172173, -0.03302581, 1, 1, 1, 1, 1,
0.2116241, 0.1946221, 2.495513, 1, 1, 1, 1, 1,
0.2127738, 0.2064672, 0.8978565, 1, 1, 1, 1, 1,
0.2130154, 0.6023851, -0.6367931, 1, 1, 1, 1, 1,
0.2183568, 0.4121447, 0.90066, 1, 1, 1, 1, 1,
0.2210258, -1.005254, 2.113533, 1, 1, 1, 1, 1,
0.2212953, -0.2841324, 0.3316235, 1, 1, 1, 1, 1,
0.2243403, 0.8444149, -0.437401, 1, 1, 1, 1, 1,
0.2243845, 0.8417536, 0.2025592, 1, 1, 1, 1, 1,
0.2269187, -1.178741, 4.700753, 1, 1, 1, 1, 1,
0.2320728, 0.9903377, 0.2768443, 1, 1, 1, 1, 1,
0.23324, 0.2000245, 1.894071, 0, 0, 1, 1, 1,
0.2368323, -1.639229, 3.210656, 1, 0, 0, 1, 1,
0.2369135, 0.07605626, 0.1917112, 1, 0, 0, 1, 1,
0.2399006, 0.9110228, 1.082342, 1, 0, 0, 1, 1,
0.2445615, -0.1115488, 2.060472, 1, 0, 0, 1, 1,
0.2451307, -0.739021, 2.489834, 1, 0, 0, 1, 1,
0.247298, 0.8126526, 1.743102, 0, 0, 0, 1, 1,
0.2482978, 0.002102542, 1.983654, 0, 0, 0, 1, 1,
0.2483993, 1.295525, 0.7140238, 0, 0, 0, 1, 1,
0.2489145, -0.3797967, 1.558178, 0, 0, 0, 1, 1,
0.2513845, 1.651079, 3.298298, 0, 0, 0, 1, 1,
0.2554894, -0.6416681, 1.89902, 0, 0, 0, 1, 1,
0.2574115, -1.478397, 4.471074, 0, 0, 0, 1, 1,
0.2607795, 0.5899591, -1.904158, 1, 1, 1, 1, 1,
0.26452, -0.1237599, 1.654766, 1, 1, 1, 1, 1,
0.2649469, -2.173135, 2.230547, 1, 1, 1, 1, 1,
0.267533, 2.144327, 0.9588227, 1, 1, 1, 1, 1,
0.2684177, -0.310484, 2.262207, 1, 1, 1, 1, 1,
0.2775902, -0.2553689, 2.479762, 1, 1, 1, 1, 1,
0.2792554, -0.5542536, 4.052835, 1, 1, 1, 1, 1,
0.2802761, -1.469679, 3.63339, 1, 1, 1, 1, 1,
0.2808626, -0.1152638, 0.3778425, 1, 1, 1, 1, 1,
0.2824015, -1.352575, 3.741878, 1, 1, 1, 1, 1,
0.2876912, 0.2315307, 0.2398386, 1, 1, 1, 1, 1,
0.2894433, -2.082385, 2.208228, 1, 1, 1, 1, 1,
0.2936641, -0.01784093, 2.725372, 1, 1, 1, 1, 1,
0.2991365, 0.3069826, -1.103877, 1, 1, 1, 1, 1,
0.301011, 0.3772323, -0.4911109, 1, 1, 1, 1, 1,
0.302951, 0.2580383, 0.7410267, 0, 0, 1, 1, 1,
0.3050908, 1.739844, -0.5972933, 1, 0, 0, 1, 1,
0.3074906, 1.111889, -0.5198233, 1, 0, 0, 1, 1,
0.3087558, 2.34783, 0.1537022, 1, 0, 0, 1, 1,
0.3120829, -1.533376, 2.420227, 1, 0, 0, 1, 1,
0.3126436, 0.5074616, 1.023163, 1, 0, 0, 1, 1,
0.3139686, -0.519011, 4.010289, 0, 0, 0, 1, 1,
0.3150876, -0.8195099, 2.411875, 0, 0, 0, 1, 1,
0.3161335, 2.774451, 0.9228918, 0, 0, 0, 1, 1,
0.3218671, -0.1111322, 0.9194641, 0, 0, 0, 1, 1,
0.3226489, -0.3994735, 1.411382, 0, 0, 0, 1, 1,
0.3289148, -0.9047278, 2.723158, 0, 0, 0, 1, 1,
0.3297286, 1.517302, 1.317494, 0, 0, 0, 1, 1,
0.3334342, 0.1922328, 2.172953, 1, 1, 1, 1, 1,
0.335365, 0.8303062, -1.132698, 1, 1, 1, 1, 1,
0.3377098, 0.7763957, -0.6943062, 1, 1, 1, 1, 1,
0.3389825, -0.4845521, 3.939027, 1, 1, 1, 1, 1,
0.3394615, 1.339946, 0.4706677, 1, 1, 1, 1, 1,
0.3408955, 0.1551188, 1.06853, 1, 1, 1, 1, 1,
0.3432547, 0.6995814, -2.151348, 1, 1, 1, 1, 1,
0.3470757, -0.6881177, 1.913013, 1, 1, 1, 1, 1,
0.3494737, 0.8063198, 2.302494, 1, 1, 1, 1, 1,
0.3644679, -0.4933912, 2.804016, 1, 1, 1, 1, 1,
0.3661619, -1.017005, 2.771352, 1, 1, 1, 1, 1,
0.3678122, -0.1312016, 2.548697, 1, 1, 1, 1, 1,
0.3697068, -0.1185701, -0.0724327, 1, 1, 1, 1, 1,
0.3721384, 0.004726375, 0.8104763, 1, 1, 1, 1, 1,
0.3762434, -0.05533079, 1.365827, 1, 1, 1, 1, 1,
0.3781056, 0.5165747, -0.2168311, 0, 0, 1, 1, 1,
0.3786452, -0.125474, 0.4758018, 1, 0, 0, 1, 1,
0.3790865, -0.1172602, 3.309112, 1, 0, 0, 1, 1,
0.3805999, -1.160582, 1.856562, 1, 0, 0, 1, 1,
0.3821762, 1.332451, 1.014964, 1, 0, 0, 1, 1,
0.3839657, 0.6268411, 0.913285, 1, 0, 0, 1, 1,
0.3845946, -0.6489032, 2.576088, 0, 0, 0, 1, 1,
0.3870856, -0.005306141, 0.2515957, 0, 0, 0, 1, 1,
0.3944633, 0.6795975, 1.262248, 0, 0, 0, 1, 1,
0.4022499, 0.5920631, 0.5391677, 0, 0, 0, 1, 1,
0.403839, 0.1563479, 1.279875, 0, 0, 0, 1, 1,
0.4078956, -1.643523, 0.9073291, 0, 0, 0, 1, 1,
0.4081562, 0.9600288, -1.043765, 0, 0, 0, 1, 1,
0.4090574, -1.492247, 3.790797, 1, 1, 1, 1, 1,
0.4138212, -0.14934, 0.6282029, 1, 1, 1, 1, 1,
0.4177253, 0.1136541, 2.168704, 1, 1, 1, 1, 1,
0.4229718, -1.052312, 3.394655, 1, 1, 1, 1, 1,
0.4237667, -1.192747, 3.785557, 1, 1, 1, 1, 1,
0.4276526, -0.4829675, 3.227475, 1, 1, 1, 1, 1,
0.4326267, -0.4099869, 1.526355, 1, 1, 1, 1, 1,
0.4335909, 0.7429277, 1.088644, 1, 1, 1, 1, 1,
0.4339267, 1.858814, -0.1213657, 1, 1, 1, 1, 1,
0.434037, 1.406782, 1.459808, 1, 1, 1, 1, 1,
0.436479, 0.853192, 1.448291, 1, 1, 1, 1, 1,
0.4377269, 0.05241737, 1.55532, 1, 1, 1, 1, 1,
0.4397482, -1.188827, 0.4821891, 1, 1, 1, 1, 1,
0.449176, 0.8229659, 0.6023774, 1, 1, 1, 1, 1,
0.4528264, 0.3501123, 0.371196, 1, 1, 1, 1, 1,
0.4603554, 0.5964107, 0.9637766, 0, 0, 1, 1, 1,
0.4640928, 0.4063991, 1.037684, 1, 0, 0, 1, 1,
0.4657459, 2.00355, 0.06547388, 1, 0, 0, 1, 1,
0.4674668, 0.1942947, 0.9974817, 1, 0, 0, 1, 1,
0.4708727, -0.2123807, 3.065126, 1, 0, 0, 1, 1,
0.4737126, 0.01197665, 3.053271, 1, 0, 0, 1, 1,
0.4746839, 1.890492, -0.2494942, 0, 0, 0, 1, 1,
0.4765295, 1.271247, -0.2158229, 0, 0, 0, 1, 1,
0.4781848, -0.4708335, 4.057611, 0, 0, 0, 1, 1,
0.4814747, 1.152382, -1.657599, 0, 0, 0, 1, 1,
0.4840129, 0.03854743, 1.52341, 0, 0, 0, 1, 1,
0.4856688, -0.6869515, 4.604825, 0, 0, 0, 1, 1,
0.489704, -0.03746437, 1.393638, 0, 0, 0, 1, 1,
0.4953871, 0.8650896, 0.1332526, 1, 1, 1, 1, 1,
0.4971513, -1.499295, 3.559428, 1, 1, 1, 1, 1,
0.5004367, -1.05437, 4.518396, 1, 1, 1, 1, 1,
0.5035414, -0.05829813, 1.162487, 1, 1, 1, 1, 1,
0.5063498, 0.3878433, 2.276842, 1, 1, 1, 1, 1,
0.5102252, 1.357067, -0.7232591, 1, 1, 1, 1, 1,
0.5114565, 1.392387, -0.3007453, 1, 1, 1, 1, 1,
0.5133066, 0.7713349, -0.0008587756, 1, 1, 1, 1, 1,
0.51453, 1.890422, -0.7100965, 1, 1, 1, 1, 1,
0.5150688, 0.6034906, 1.269609, 1, 1, 1, 1, 1,
0.5153332, -0.5497807, 2.500855, 1, 1, 1, 1, 1,
0.5192443, -0.0328574, 3.340936, 1, 1, 1, 1, 1,
0.5197583, -0.5547086, 2.462858, 1, 1, 1, 1, 1,
0.519873, 1.504102, -1.742018, 1, 1, 1, 1, 1,
0.5213362, 0.4694308, -0.1825366, 1, 1, 1, 1, 1,
0.5228671, 0.09729697, 0.5381001, 0, 0, 1, 1, 1,
0.5305498, -0.5632578, 1.861138, 1, 0, 0, 1, 1,
0.5356009, 0.7525218, 0.8338915, 1, 0, 0, 1, 1,
0.5401351, -1.726583, 2.604085, 1, 0, 0, 1, 1,
0.5416005, -0.7890475, 2.583849, 1, 0, 0, 1, 1,
0.544015, -1.026577, 3.981595, 1, 0, 0, 1, 1,
0.5467448, 0.1256639, 1.00742, 0, 0, 0, 1, 1,
0.5485054, 1.790385, -1.585989, 0, 0, 0, 1, 1,
0.5524262, 0.2157861, 1.007964, 0, 0, 0, 1, 1,
0.559129, 0.9301695, 0.4642354, 0, 0, 0, 1, 1,
0.5609629, 0.04046633, 4.360226, 0, 0, 0, 1, 1,
0.563916, 0.7606271, -0.6120949, 0, 0, 0, 1, 1,
0.5690467, 1.49402, -1.069249, 0, 0, 0, 1, 1,
0.5699068, 1.580927, 0.701071, 1, 1, 1, 1, 1,
0.5787162, -0.5760733, 3.309649, 1, 1, 1, 1, 1,
0.5817021, 0.3008473, 2.488931, 1, 1, 1, 1, 1,
0.5844188, -0.4477532, 3.25828, 1, 1, 1, 1, 1,
0.5862058, 1.088972, 0.7797901, 1, 1, 1, 1, 1,
0.5955921, 0.3626, 2.86477, 1, 1, 1, 1, 1,
0.6003403, 0.2121495, 2.780487, 1, 1, 1, 1, 1,
0.6066266, -0.4977029, 2.12087, 1, 1, 1, 1, 1,
0.6078612, 1.648408, 1.589859, 1, 1, 1, 1, 1,
0.6086569, 0.1229134, 0.2400936, 1, 1, 1, 1, 1,
0.6102048, -0.02188611, 1.601718, 1, 1, 1, 1, 1,
0.6107796, 0.259726, 2.727893, 1, 1, 1, 1, 1,
0.6118371, 0.05423652, 2.939978, 1, 1, 1, 1, 1,
0.6120869, 1.724238, -0.7421376, 1, 1, 1, 1, 1,
0.6163721, -0.9356644, 3.599213, 1, 1, 1, 1, 1,
0.6170966, 0.6719906, 0.04839132, 0, 0, 1, 1, 1,
0.6203946, -0.9296246, 3.971884, 1, 0, 0, 1, 1,
0.6227183, -0.6421944, 1.99486, 1, 0, 0, 1, 1,
0.6287291, 1.077818, 0.4544638, 1, 0, 0, 1, 1,
0.6294624, -0.428746, 1.901443, 1, 0, 0, 1, 1,
0.6319258, -0.7996999, 3.438112, 1, 0, 0, 1, 1,
0.6325225, -0.3760315, 2.987136, 0, 0, 0, 1, 1,
0.6377554, 3.587222, 1.199981, 0, 0, 0, 1, 1,
0.6407574, -0.2937775, 2.206707, 0, 0, 0, 1, 1,
0.6411405, -1.546247, 2.846902, 0, 0, 0, 1, 1,
0.6420146, 0.1282366, 1.006263, 0, 0, 0, 1, 1,
0.6439203, -0.6481977, 1.823328, 0, 0, 0, 1, 1,
0.6441756, -0.4064978, 1.118469, 0, 0, 0, 1, 1,
0.646866, -1.383732, 2.88448, 1, 1, 1, 1, 1,
0.6490614, -1.208026, 1.70768, 1, 1, 1, 1, 1,
0.6522048, -0.007827399, 2.003293, 1, 1, 1, 1, 1,
0.652712, -0.483062, 1.008988, 1, 1, 1, 1, 1,
0.653094, 0.266958, 2.676909, 1, 1, 1, 1, 1,
0.658308, 0.6484653, -0.5058119, 1, 1, 1, 1, 1,
0.6624215, -0.07819258, 2.391522, 1, 1, 1, 1, 1,
0.6632847, -1.094189, 2.789389, 1, 1, 1, 1, 1,
0.6663071, 1.58212, 1.964537, 1, 1, 1, 1, 1,
0.6723015, -1.009763, 2.944633, 1, 1, 1, 1, 1,
0.6732451, -1.133454, 2.881397, 1, 1, 1, 1, 1,
0.6777583, -0.5955482, 3.58884, 1, 1, 1, 1, 1,
0.6817441, -0.4999254, 0.4853386, 1, 1, 1, 1, 1,
0.688686, 1.955442, 0.7358389, 1, 1, 1, 1, 1,
0.6937804, -0.7364794, 1.16686, 1, 1, 1, 1, 1,
0.6962976, -0.8770128, 4.338486, 0, 0, 1, 1, 1,
0.6964829, 0.1165329, 2.717692, 1, 0, 0, 1, 1,
0.6975957, 1.98602, 0.06830209, 1, 0, 0, 1, 1,
0.69808, 1.565069, 2.358045, 1, 0, 0, 1, 1,
0.6998937, 0.5259776, 1.427833, 1, 0, 0, 1, 1,
0.7046974, 0.2692553, 3.4244, 1, 0, 0, 1, 1,
0.7088571, 0.5663543, 2.621005, 0, 0, 0, 1, 1,
0.7117756, -0.08404116, 2.165424, 0, 0, 0, 1, 1,
0.7117845, 0.8561493, -0.02657172, 0, 0, 0, 1, 1,
0.71216, -1.367266, 0.9971791, 0, 0, 0, 1, 1,
0.7145575, 0.6303521, 1.824446, 0, 0, 0, 1, 1,
0.7151862, 0.9093909, 1.421807, 0, 0, 0, 1, 1,
0.7180544, -0.7440033, 2.862145, 0, 0, 0, 1, 1,
0.7182912, 1.650628, -0.1182905, 1, 1, 1, 1, 1,
0.7205822, -0.1533759, 2.55414, 1, 1, 1, 1, 1,
0.7303438, 0.3425521, 1.210741, 1, 1, 1, 1, 1,
0.7304712, -1.331056, 1.068289, 1, 1, 1, 1, 1,
0.7350991, 0.1811267, 0.7719777, 1, 1, 1, 1, 1,
0.7351828, -0.8221531, 2.042317, 1, 1, 1, 1, 1,
0.7375762, 0.7627268, 0.9478202, 1, 1, 1, 1, 1,
0.746751, -0.2377529, 1.613922, 1, 1, 1, 1, 1,
0.7489147, 1.96695, 2.28154, 1, 1, 1, 1, 1,
0.7612612, 0.0685086, 0.1421814, 1, 1, 1, 1, 1,
0.7619249, -0.277998, 2.503217, 1, 1, 1, 1, 1,
0.7700248, 0.609457, 0.7883114, 1, 1, 1, 1, 1,
0.771885, -0.1979748, 1.083727, 1, 1, 1, 1, 1,
0.7761505, 0.5334033, 1.707758, 1, 1, 1, 1, 1,
0.7763805, 1.027328, 1.540531, 1, 1, 1, 1, 1,
0.782658, -0.07469077, 1.779281, 0, 0, 1, 1, 1,
0.7861328, 0.3799944, 1.5227, 1, 0, 0, 1, 1,
0.7936189, -0.8445916, 1.518386, 1, 0, 0, 1, 1,
0.8006046, -1.143044, 1.53387, 1, 0, 0, 1, 1,
0.8036631, -0.7760245, 2.061816, 1, 0, 0, 1, 1,
0.8091961, -0.7829899, 2.965413, 1, 0, 0, 1, 1,
0.8114697, 0.009235566, 2.465655, 0, 0, 0, 1, 1,
0.8120807, -0.1017266, 2.228524, 0, 0, 0, 1, 1,
0.8194689, -0.6163446, 3.179262, 0, 0, 0, 1, 1,
0.8224273, -0.6316696, 1.394018, 0, 0, 0, 1, 1,
0.8234006, 0.04966783, 0.01730314, 0, 0, 0, 1, 1,
0.8242188, 0.6972533, 2.419669, 0, 0, 0, 1, 1,
0.8253166, -1.420648, 3.604468, 0, 0, 0, 1, 1,
0.8253526, 0.1760091, 0.7051378, 1, 1, 1, 1, 1,
0.8286802, -0.1564151, 2.253515, 1, 1, 1, 1, 1,
0.8334838, 0.7152998, 0.8251054, 1, 1, 1, 1, 1,
0.8340134, -0.9000419, 1.391756, 1, 1, 1, 1, 1,
0.8367407, -0.4347798, 2.428514, 1, 1, 1, 1, 1,
0.8388042, 1.398652, 1.23577, 1, 1, 1, 1, 1,
0.8520588, -0.3768287, 1.693874, 1, 1, 1, 1, 1,
0.8631306, 0.1400141, 1.136112, 1, 1, 1, 1, 1,
0.8657391, 1.425101, 0.6315462, 1, 1, 1, 1, 1,
0.8708091, -0.9656751, 3.05372, 1, 1, 1, 1, 1,
0.8743252, -0.8474644, 1.777837, 1, 1, 1, 1, 1,
0.8785661, 0.40858, 1.857182, 1, 1, 1, 1, 1,
0.8790118, -0.07344825, 0.235961, 1, 1, 1, 1, 1,
0.8805041, 1.219773, 0.6584954, 1, 1, 1, 1, 1,
0.8924292, 0.1088298, 1.526672, 1, 1, 1, 1, 1,
0.8942133, -0.06273305, 0.9955041, 0, 0, 1, 1, 1,
0.8990514, 0.6453069, 0.7386672, 1, 0, 0, 1, 1,
0.9004592, 0.6098052, 0.9504282, 1, 0, 0, 1, 1,
0.9072494, 0.2630187, 1.215932, 1, 0, 0, 1, 1,
0.9076877, 0.2568762, 1.685686, 1, 0, 0, 1, 1,
0.9084319, 0.7331451, 0.1967917, 1, 0, 0, 1, 1,
0.9146857, 0.6709998, -0.4784116, 0, 0, 0, 1, 1,
0.9163376, 1.172235, -0.3405284, 0, 0, 0, 1, 1,
0.9179944, 0.5616342, -0.7215424, 0, 0, 0, 1, 1,
0.9197422, -0.6822792, 4.167949, 0, 0, 0, 1, 1,
0.9200541, 0.4191296, 1.519706, 0, 0, 0, 1, 1,
0.9245777, -1.086467, 1.162051, 0, 0, 0, 1, 1,
0.9277159, 1.5349, 1.719861, 0, 0, 0, 1, 1,
0.9293876, -0.1013595, 0.4231326, 1, 1, 1, 1, 1,
0.9304702, 0.5586808, 1.346463, 1, 1, 1, 1, 1,
0.9324565, 0.6400772, 0.5152249, 1, 1, 1, 1, 1,
0.9338806, -0.7473163, 2.98909, 1, 1, 1, 1, 1,
0.9362813, 1.771829, 0.1102045, 1, 1, 1, 1, 1,
0.9387909, 0.7023408, -0.118778, 1, 1, 1, 1, 1,
0.9390878, -1.196709, 3.023975, 1, 1, 1, 1, 1,
0.9452211, -1.060457, 3.261317, 1, 1, 1, 1, 1,
0.9480442, 1.047603, 2.992349, 1, 1, 1, 1, 1,
0.9506457, 0.5749893, 0.9554057, 1, 1, 1, 1, 1,
0.9522378, 0.3686764, 0.6115048, 1, 1, 1, 1, 1,
0.953206, 1.718267, 1.662878, 1, 1, 1, 1, 1,
0.9538285, 1.057008, 1.230548, 1, 1, 1, 1, 1,
0.9672993, -1.084439, 1.468389, 1, 1, 1, 1, 1,
0.9729133, 1.915327, -0.02272056, 1, 1, 1, 1, 1,
0.9807965, 0.04518646, 1.995254, 0, 0, 1, 1, 1,
0.9811174, 1.997529, -1.203979, 1, 0, 0, 1, 1,
0.9831876, -0.2498126, 0.428265, 1, 0, 0, 1, 1,
0.98637, -0.8993258, 3.793428, 1, 0, 0, 1, 1,
0.9926661, 0.1835898, -0.4528403, 1, 0, 0, 1, 1,
0.997829, -1.188727, 0.7231518, 1, 0, 0, 1, 1,
1.001387, -0.04937925, 1.912483, 0, 0, 0, 1, 1,
1.003227, 0.6538169, -0.007130745, 0, 0, 0, 1, 1,
1.006535, -2.020012, 3.200916, 0, 0, 0, 1, 1,
1.010927, -0.5394127, 1.525421, 0, 0, 0, 1, 1,
1.011804, -0.3706782, 3.411296, 0, 0, 0, 1, 1,
1.020706, 1.580237, -0.414574, 0, 0, 0, 1, 1,
1.023226, -0.05248732, 1.969813, 0, 0, 0, 1, 1,
1.025209, 1.361688, 0.539839, 1, 1, 1, 1, 1,
1.026892, -0.1169506, -0.2997531, 1, 1, 1, 1, 1,
1.043661, 1.592087, 0.8496718, 1, 1, 1, 1, 1,
1.045223, 0.3409743, 1.188293, 1, 1, 1, 1, 1,
1.045909, -1.739664, 2.228468, 1, 1, 1, 1, 1,
1.046515, 0.08461318, 1.627443, 1, 1, 1, 1, 1,
1.047495, -1.539386, 4.010537, 1, 1, 1, 1, 1,
1.050127, -0.5094277, 2.328902, 1, 1, 1, 1, 1,
1.059008, 0.5182537, 1.232595, 1, 1, 1, 1, 1,
1.062497, 0.2791053, 1.494429, 1, 1, 1, 1, 1,
1.065147, -0.9401178, 1.343548, 1, 1, 1, 1, 1,
1.070571, 0.03337466, 1.563461, 1, 1, 1, 1, 1,
1.074312, 1.111743, -0.9100609, 1, 1, 1, 1, 1,
1.075502, 0.6536133, 1.894159, 1, 1, 1, 1, 1,
1.092423, 2.000837, 2.008758, 1, 1, 1, 1, 1,
1.101118, 0.07598694, 1.09822, 0, 0, 1, 1, 1,
1.102937, -1.548474, 2.763362, 1, 0, 0, 1, 1,
1.106971, -1.304345, 0.778047, 1, 0, 0, 1, 1,
1.107807, 0.6938392, 1.541399, 1, 0, 0, 1, 1,
1.108119, 0.991966, -0.2082385, 1, 0, 0, 1, 1,
1.116259, 1.010949, -0.3325755, 1, 0, 0, 1, 1,
1.123136, -0.5353963, 2.835883, 0, 0, 0, 1, 1,
1.124186, -0.6411114, 3.1684, 0, 0, 0, 1, 1,
1.124248, 0.4556363, 0.6890165, 0, 0, 0, 1, 1,
1.127788, 2.133653, 0.1014222, 0, 0, 0, 1, 1,
1.128053, 0.8647936, 2.390767, 0, 0, 0, 1, 1,
1.134589, 0.3434761, 1.329588, 0, 0, 0, 1, 1,
1.142998, 0.2363518, 2.640063, 0, 0, 0, 1, 1,
1.145064, -0.1910584, 1.083115, 1, 1, 1, 1, 1,
1.162739, -0.1182172, 2.841717, 1, 1, 1, 1, 1,
1.164788, 0.08564473, 3.353348, 1, 1, 1, 1, 1,
1.174161, -0.5364974, 2.432027, 1, 1, 1, 1, 1,
1.176871, -0.4370538, 1.760589, 1, 1, 1, 1, 1,
1.178515, 0.679714, 2.156053, 1, 1, 1, 1, 1,
1.185521, 1.098815, -0.6278132, 1, 1, 1, 1, 1,
1.188287, -1.448545, 2.715311, 1, 1, 1, 1, 1,
1.200033, -1.716246, 2.035673, 1, 1, 1, 1, 1,
1.205451, 0.005459954, 2.622447, 1, 1, 1, 1, 1,
1.212584, 0.1112343, 0.4102636, 1, 1, 1, 1, 1,
1.242076, 1.361868, 2.410538, 1, 1, 1, 1, 1,
1.248517, -1.002634, 2.541279, 1, 1, 1, 1, 1,
1.266355, -2.145909, 1.505205, 1, 1, 1, 1, 1,
1.274944, 1.416795, 1.440335, 1, 1, 1, 1, 1,
1.280386, -0.2835026, 2.377227, 0, 0, 1, 1, 1,
1.292385, -0.7700355, 1.207946, 1, 0, 0, 1, 1,
1.295278, -0.5721976, 3.55168, 1, 0, 0, 1, 1,
1.297324, -1.100292, 2.464723, 1, 0, 0, 1, 1,
1.303955, 0.06423537, 0.80237, 1, 0, 0, 1, 1,
1.305921, -0.7374215, 1.294648, 1, 0, 0, 1, 1,
1.309728, -0.3917837, 2.257632, 0, 0, 0, 1, 1,
1.317925, 0.6424047, 1.483808, 0, 0, 0, 1, 1,
1.320853, -0.9611867, 2.843333, 0, 0, 0, 1, 1,
1.324496, -0.07556652, 0.08025252, 0, 0, 0, 1, 1,
1.326324, -1.520461, 1.57436, 0, 0, 0, 1, 1,
1.335823, -0.1395892, 2.245792, 0, 0, 0, 1, 1,
1.348843, -0.01014004, 2.689122, 0, 0, 0, 1, 1,
1.351983, 0.8626375, 1.369132, 1, 1, 1, 1, 1,
1.352148, -1.468753, 3.086812, 1, 1, 1, 1, 1,
1.353887, -0.07516341, 3.019683, 1, 1, 1, 1, 1,
1.370518, 1.87849, 0.2480089, 1, 1, 1, 1, 1,
1.378791, 0.3986267, 1.35447, 1, 1, 1, 1, 1,
1.384223, 1.679178, 2.030252, 1, 1, 1, 1, 1,
1.390788, 1.519911, -0.07813215, 1, 1, 1, 1, 1,
1.393785, 0.7492976, -0.7161586, 1, 1, 1, 1, 1,
1.409863, 0.2358636, 1.574832, 1, 1, 1, 1, 1,
1.414635, 0.6853443, 2.590704, 1, 1, 1, 1, 1,
1.43302, -0.13906, 1.414295, 1, 1, 1, 1, 1,
1.433264, -1.209664, 3.235821, 1, 1, 1, 1, 1,
1.43841, 0.2554674, 1.058601, 1, 1, 1, 1, 1,
1.445485, 0.254923, 2.518231, 1, 1, 1, 1, 1,
1.460847, -0.09347816, 1.833139, 1, 1, 1, 1, 1,
1.461256, -0.9316301, 3.442156, 0, 0, 1, 1, 1,
1.470181, -0.6987095, 3.852155, 1, 0, 0, 1, 1,
1.4747, 0.624014, 0.4367712, 1, 0, 0, 1, 1,
1.476854, -0.006830494, 0.4124832, 1, 0, 0, 1, 1,
1.482036, 0.9879647, -2.086207, 1, 0, 0, 1, 1,
1.483447, -1.779779, 2.585215, 1, 0, 0, 1, 1,
1.490777, -0.3212405, 2.132926, 0, 0, 0, 1, 1,
1.501668, 1.119947, -0.2747222, 0, 0, 0, 1, 1,
1.505727, 0.6187133, 0.6283524, 0, 0, 0, 1, 1,
1.512886, -1.959681, 3.805782, 0, 0, 0, 1, 1,
1.519601, 0.811886, 1.626486, 0, 0, 0, 1, 1,
1.539637, -1.023178, 3.782185, 0, 0, 0, 1, 1,
1.542741, 1.263467, 0.7691675, 0, 0, 0, 1, 1,
1.543719, 0.360522, 2.523266, 1, 1, 1, 1, 1,
1.566581, 2.401925, 1.66644, 1, 1, 1, 1, 1,
1.576465, 2.2177, 0.07901672, 1, 1, 1, 1, 1,
1.589035, 0.3698827, 3.362595, 1, 1, 1, 1, 1,
1.592126, -0.8577328, 2.395797, 1, 1, 1, 1, 1,
1.625624, -0.6979339, 1.684161, 1, 1, 1, 1, 1,
1.628716, -1.975207, 0.9558455, 1, 1, 1, 1, 1,
1.639718, 0.6701294, 1.385401, 1, 1, 1, 1, 1,
1.644343, -0.3025973, 2.377986, 1, 1, 1, 1, 1,
1.650757, -0.4287305, 2.054347, 1, 1, 1, 1, 1,
1.65201, 0.1668802, -0.1777977, 1, 1, 1, 1, 1,
1.668874, 0.5739368, -0.4054126, 1, 1, 1, 1, 1,
1.676628, -0.5238408, 3.022177, 1, 1, 1, 1, 1,
1.704304, -1.041336, 2.546374, 1, 1, 1, 1, 1,
1.71006, 0.5463027, -0.1672339, 1, 1, 1, 1, 1,
1.727003, 1.206042, 0.7556217, 0, 0, 1, 1, 1,
1.738262, 0.2671865, 2.366365, 1, 0, 0, 1, 1,
1.743547, 1.695194, 0.05137599, 1, 0, 0, 1, 1,
1.750744, -0.6891364, 3.166475, 1, 0, 0, 1, 1,
1.752371, -1.534736, 2.6419, 1, 0, 0, 1, 1,
1.762972, -3.113171, 4.578491, 1, 0, 0, 1, 1,
1.766241, 0.9708694, -1.551361, 0, 0, 0, 1, 1,
1.767722, -0.9329059, 2.123091, 0, 0, 0, 1, 1,
1.777344, -1.380173, 1.919293, 0, 0, 0, 1, 1,
1.782573, -0.0780013, 2.555258, 0, 0, 0, 1, 1,
1.784701, -0.3774081, 3.486667, 0, 0, 0, 1, 1,
1.791064, 0.1649966, 1.855157, 0, 0, 0, 1, 1,
1.793569, -1.318343, 3.571097, 0, 0, 0, 1, 1,
1.797918, 0.1357382, 0.7883353, 1, 1, 1, 1, 1,
1.815599, -0.02604382, 1.086408, 1, 1, 1, 1, 1,
1.820657, -1.577725, 2.755208, 1, 1, 1, 1, 1,
1.850773, -1.291398, 1.514989, 1, 1, 1, 1, 1,
1.868389, 0.329596, 0.5480219, 1, 1, 1, 1, 1,
1.877447, 0.3749905, 3.23676, 1, 1, 1, 1, 1,
1.902864, -0.7895623, 2.818466, 1, 1, 1, 1, 1,
1.911507, -0.2510899, 3.024094, 1, 1, 1, 1, 1,
1.912867, -1.60167, 3.307537, 1, 1, 1, 1, 1,
1.925698, 1.162314, 1.746922, 1, 1, 1, 1, 1,
1.973502, 0.7342586, 1.175002, 1, 1, 1, 1, 1,
1.989411, -2.04609, 1.594447, 1, 1, 1, 1, 1,
1.992814, -1.21362, 3.913594, 1, 1, 1, 1, 1,
2.056724, -0.3660751, 2.429126, 1, 1, 1, 1, 1,
2.063793, -1.236645, 3.156645, 1, 1, 1, 1, 1,
2.089972, -0.1934531, 2.191902, 0, 0, 1, 1, 1,
2.095779, 0.0619382, 1.731441, 1, 0, 0, 1, 1,
2.100926, -1.184118, 2.251151, 1, 0, 0, 1, 1,
2.105373, -0.7724785, 2.84062, 1, 0, 0, 1, 1,
2.110058, -1.535686, 2.507304, 1, 0, 0, 1, 1,
2.150009, 0.9263365, 1.50317, 1, 0, 0, 1, 1,
2.156503, 0.1969863, 2.692994, 0, 0, 0, 1, 1,
2.161225, -1.675518, 4.536107, 0, 0, 0, 1, 1,
2.22674, -1.092307, -0.4116964, 0, 0, 0, 1, 1,
2.345132, -0.515322, 1.284065, 0, 0, 0, 1, 1,
2.42481, 0.4317836, 0.4899274, 0, 0, 0, 1, 1,
2.532031, -0.5734361, 2.278393, 0, 0, 0, 1, 1,
2.533339, 0.2273492, 0.7859324, 0, 0, 0, 1, 1,
2.596705, 1.196862, 1.465156, 1, 1, 1, 1, 1,
2.747987, 0.07742046, 1.043699, 1, 1, 1, 1, 1,
2.78586, -1.616272, 2.014771, 1, 1, 1, 1, 1,
2.823322, 0.4914594, 1.973972, 1, 1, 1, 1, 1,
2.907507, 0.497723, 2.713257, 1, 1, 1, 1, 1,
2.932698, 0.1654958, 2.50424, 1, 1, 1, 1, 1,
3.602117, -2.290099, 3.103269, 1, 1, 1, 1, 1
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
var radius = 9.785937;
var distance = 34.37269;
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
mvMatrix.translate( -0.1265671, -0.2370257, 0.341676 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.37269);
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