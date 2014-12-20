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
-2.893599, -2.61781, -2.423833, 1, 0, 0, 1,
-2.86576, -1.089369, -1.348709, 1, 0.007843138, 0, 1,
-2.664804, -0.3517787, -1.109198, 1, 0.01176471, 0, 1,
-2.606805, -1.261242, -4.016104, 1, 0.01960784, 0, 1,
-2.552942, -0.5510892, -2.75315, 1, 0.02352941, 0, 1,
-2.465665, 0.9869157, -1.294127, 1, 0.03137255, 0, 1,
-2.439563, 0.3368572, -0.5535606, 1, 0.03529412, 0, 1,
-2.351324, 1.210327, -2.529772, 1, 0.04313726, 0, 1,
-2.341091, -0.1765355, -4.064928, 1, 0.04705882, 0, 1,
-2.337883, -1.649934, -1.921042, 1, 0.05490196, 0, 1,
-2.337013, -0.01531538, -0.3871372, 1, 0.05882353, 0, 1,
-2.240852, -0.7933758, -1.816576, 1, 0.06666667, 0, 1,
-2.21165, 1.768659, -2.172815, 1, 0.07058824, 0, 1,
-2.207963, -0.04784354, -1.563285, 1, 0.07843138, 0, 1,
-2.16903, 1.76889, -0.8048071, 1, 0.08235294, 0, 1,
-2.064933, -0.2801856, -2.487675, 1, 0.09019608, 0, 1,
-2.05473, 0.4041918, -2.055763, 1, 0.09411765, 0, 1,
-2.01849, 0.5935727, -0.8849669, 1, 0.1019608, 0, 1,
-2.018156, 0.5103844, -1.403205, 1, 0.1098039, 0, 1,
-2.01404, -0.5975763, -2.795719, 1, 0.1137255, 0, 1,
-2.013505, -0.8265366, -2.080411, 1, 0.1215686, 0, 1,
-1.978376, 0.9927636, -1.600163, 1, 0.1254902, 0, 1,
-1.938549, 1.114958, -0.4389445, 1, 0.1333333, 0, 1,
-1.937743, -1.002534, -1.9598, 1, 0.1372549, 0, 1,
-1.927197, 2.107692, -1.739016, 1, 0.145098, 0, 1,
-1.909991, -0.00071774, 1.724904, 1, 0.1490196, 0, 1,
-1.903728, -1.133653, -2.54546, 1, 0.1568628, 0, 1,
-1.903121, -0.08137525, -1.699145, 1, 0.1607843, 0, 1,
-1.889853, -2.553946, -2.998245, 1, 0.1686275, 0, 1,
-1.885337, 0.4094065, 0.4441311, 1, 0.172549, 0, 1,
-1.848226, 0.3803248, -2.066497, 1, 0.1803922, 0, 1,
-1.838209, 0.3504485, -3.15911, 1, 0.1843137, 0, 1,
-1.837357, -1.488953, -1.637292, 1, 0.1921569, 0, 1,
-1.829128, 0.6210743, 0.640552, 1, 0.1960784, 0, 1,
-1.824298, 2.154958, 0.0422918, 1, 0.2039216, 0, 1,
-1.81068, 0.05552832, -1.873739, 1, 0.2117647, 0, 1,
-1.808416, 1.443668, -0.8890074, 1, 0.2156863, 0, 1,
-1.779251, -0.02847117, -2.089797, 1, 0.2235294, 0, 1,
-1.776451, -1.393902, -1.614595, 1, 0.227451, 0, 1,
-1.776137, 0.08744267, -1.619988, 1, 0.2352941, 0, 1,
-1.763098, 1.502212, -2.096058, 1, 0.2392157, 0, 1,
-1.737933, -0.406209, -2.835706, 1, 0.2470588, 0, 1,
-1.736429, 0.3577542, -0.9381552, 1, 0.2509804, 0, 1,
-1.724861, 0.04765992, 0.02466197, 1, 0.2588235, 0, 1,
-1.718634, -0.1137183, -0.750218, 1, 0.2627451, 0, 1,
-1.715663, -0.1924761, -2.261781, 1, 0.2705882, 0, 1,
-1.705589, -1.89937, -1.224538, 1, 0.2745098, 0, 1,
-1.69114, -1.210602, -2.960864, 1, 0.282353, 0, 1,
-1.687793, -1.403822, -1.060485, 1, 0.2862745, 0, 1,
-1.655475, -1.241027, -1.831349, 1, 0.2941177, 0, 1,
-1.654127, -0.1048317, 0.1866239, 1, 0.3019608, 0, 1,
-1.64202, 0.9973165, -1.263746, 1, 0.3058824, 0, 1,
-1.619202, -0.7803625, -0.954487, 1, 0.3137255, 0, 1,
-1.618358, -0.2948083, -3.942128, 1, 0.3176471, 0, 1,
-1.615521, 0.4529651, -2.365279, 1, 0.3254902, 0, 1,
-1.60235, 0.7583973, -0.5509608, 1, 0.3294118, 0, 1,
-1.579602, -0.01392468, -0.3060123, 1, 0.3372549, 0, 1,
-1.570976, 0.540235, -0.02913159, 1, 0.3411765, 0, 1,
-1.563691, 0.8345263, 0.6321471, 1, 0.3490196, 0, 1,
-1.562268, -0.06406011, -0.5356787, 1, 0.3529412, 0, 1,
-1.561584, -0.2148389, -1.495458, 1, 0.3607843, 0, 1,
-1.559992, -1.012683, -4.319388, 1, 0.3647059, 0, 1,
-1.552557, 1.053438, -1.211704, 1, 0.372549, 0, 1,
-1.540716, -1.909202, -1.897363, 1, 0.3764706, 0, 1,
-1.533028, 0.3933592, -0.277894, 1, 0.3843137, 0, 1,
-1.531688, 0.5898004, -1.007166, 1, 0.3882353, 0, 1,
-1.515378, 1.107292, -1.115067, 1, 0.3960784, 0, 1,
-1.502279, 0.2793283, -1.779074, 1, 0.4039216, 0, 1,
-1.499189, -0.1257357, -3.582414, 1, 0.4078431, 0, 1,
-1.485932, -0.2578479, -0.2782393, 1, 0.4156863, 0, 1,
-1.476773, 1.306499, 0.1399991, 1, 0.4196078, 0, 1,
-1.472939, -1.858209, -5.24671, 1, 0.427451, 0, 1,
-1.463693, 0.07472894, -0.4543283, 1, 0.4313726, 0, 1,
-1.4594, 0.6474382, -1.384584, 1, 0.4392157, 0, 1,
-1.453395, 0.143309, -1.803481, 1, 0.4431373, 0, 1,
-1.449238, 1.031212, -1.334481, 1, 0.4509804, 0, 1,
-1.443648, -0.3446938, -1.786435, 1, 0.454902, 0, 1,
-1.43781, -0.1851128, -1.326781, 1, 0.4627451, 0, 1,
-1.426542, -1.003529, -3.087382, 1, 0.4666667, 0, 1,
-1.403079, 0.2675805, -1.282319, 1, 0.4745098, 0, 1,
-1.401982, -0.7482397, -0.9914066, 1, 0.4784314, 0, 1,
-1.399483, -0.7419733, -2.024383, 1, 0.4862745, 0, 1,
-1.397728, 0.7272357, -2.171945, 1, 0.4901961, 0, 1,
-1.390897, 1.406674, -1.671376, 1, 0.4980392, 0, 1,
-1.387468, -0.370182, -3.205776, 1, 0.5058824, 0, 1,
-1.383282, 0.8104455, 0.9145332, 1, 0.509804, 0, 1,
-1.383049, 2.308997, 0.00307293, 1, 0.5176471, 0, 1,
-1.36955, 0.06611218, 0.1829161, 1, 0.5215687, 0, 1,
-1.367143, 0.00437623, -1.877902, 1, 0.5294118, 0, 1,
-1.355041, -2.650633, -3.030365, 1, 0.5333334, 0, 1,
-1.344258, -0.7372059, -1.868363, 1, 0.5411765, 0, 1,
-1.341681, -0.7991731, -1.532848, 1, 0.5450981, 0, 1,
-1.333291, 0.2709479, -3.232102, 1, 0.5529412, 0, 1,
-1.332564, -0.8216119, 0.4698954, 1, 0.5568628, 0, 1,
-1.325323, -0.6442513, -1.763705, 1, 0.5647059, 0, 1,
-1.322599, -0.3279376, -0.8007292, 1, 0.5686275, 0, 1,
-1.321054, 1.658278, -0.8735959, 1, 0.5764706, 0, 1,
-1.311375, 1.433976, -2.409231, 1, 0.5803922, 0, 1,
-1.302985, -0.5988062, -0.5243475, 1, 0.5882353, 0, 1,
-1.300838, 1.409662, -0.1203943, 1, 0.5921569, 0, 1,
-1.299303, 2.500901, -1.28104, 1, 0.6, 0, 1,
-1.294089, 0.1496594, -1.835627, 1, 0.6078432, 0, 1,
-1.276154, -1.855553, -1.233332, 1, 0.6117647, 0, 1,
-1.2722, -0.07777094, -0.8187142, 1, 0.6196079, 0, 1,
-1.266983, 0.3757538, -1.339123, 1, 0.6235294, 0, 1,
-1.254629, 0.9532619, -0.982265, 1, 0.6313726, 0, 1,
-1.245667, -1.789161, -0.8789102, 1, 0.6352941, 0, 1,
-1.239907, 1.553011, 1.350709, 1, 0.6431373, 0, 1,
-1.237037, -0.8304888, -1.603075, 1, 0.6470588, 0, 1,
-1.235142, -1.071423, -3.18649, 1, 0.654902, 0, 1,
-1.229258, 0.8274985, -1.845157, 1, 0.6588235, 0, 1,
-1.221566, -0.6653608, -1.37758, 1, 0.6666667, 0, 1,
-1.218199, -0.9454407, -1.437573, 1, 0.6705883, 0, 1,
-1.213944, 0.6666549, -1.131723, 1, 0.6784314, 0, 1,
-1.21119, 1.608502, -0.6837963, 1, 0.682353, 0, 1,
-1.206342, -1.957349, -4.300344, 1, 0.6901961, 0, 1,
-1.205651, -1.613699, -2.329574, 1, 0.6941177, 0, 1,
-1.203417, -1.195589, -1.845748, 1, 0.7019608, 0, 1,
-1.202696, -0.1489626, -0.9180062, 1, 0.7098039, 0, 1,
-1.201713, 0.2314734, -1.647794, 1, 0.7137255, 0, 1,
-1.186429, -1.091446, -2.023735, 1, 0.7215686, 0, 1,
-1.178163, -0.2468798, -1.721407, 1, 0.7254902, 0, 1,
-1.171982, 1.465555, -0.2416132, 1, 0.7333333, 0, 1,
-1.167014, 0.4767703, -0.3646981, 1, 0.7372549, 0, 1,
-1.166743, 0.667492, -1.423918, 1, 0.7450981, 0, 1,
-1.16454, -0.25122, -2.179695, 1, 0.7490196, 0, 1,
-1.157666, 0.8692709, -1.402777, 1, 0.7568628, 0, 1,
-1.156692, 0.9468994, -2.143074, 1, 0.7607843, 0, 1,
-1.15528, -0.3749586, -1.554452, 1, 0.7686275, 0, 1,
-1.150253, -0.4970381, -1.235678, 1, 0.772549, 0, 1,
-1.142548, 0.01307875, -2.179891, 1, 0.7803922, 0, 1,
-1.137981, 0.3888322, -0.4834054, 1, 0.7843137, 0, 1,
-1.136813, 0.9583439, -1.451346, 1, 0.7921569, 0, 1,
-1.122662, 0.868252, 1.101689, 1, 0.7960784, 0, 1,
-1.118975, 0.3998678, -2.357443, 1, 0.8039216, 0, 1,
-1.118887, 1.394969, -0.09765582, 1, 0.8117647, 0, 1,
-1.116412, 0.03392402, -1.492762, 1, 0.8156863, 0, 1,
-1.115277, 0.9797968, -1.938693, 1, 0.8235294, 0, 1,
-1.108723, 0.6576619, -0.415218, 1, 0.827451, 0, 1,
-1.108595, -0.1792362, -1.716288, 1, 0.8352941, 0, 1,
-1.106022, 2.260478, 0.4575522, 1, 0.8392157, 0, 1,
-1.099253, -0.06090727, -1.039892, 1, 0.8470588, 0, 1,
-1.094865, 1.002275, 0.5165176, 1, 0.8509804, 0, 1,
-1.090404, 0.1593022, -1.147028, 1, 0.8588235, 0, 1,
-1.080396, -1.720356, -4.96511, 1, 0.8627451, 0, 1,
-1.073344, -0.8764048, -2.282889, 1, 0.8705882, 0, 1,
-1.071882, -0.9829775, -3.475693, 1, 0.8745098, 0, 1,
-1.068104, 0.8492447, -1.236435, 1, 0.8823529, 0, 1,
-1.062395, -0.5279844, -2.719729, 1, 0.8862745, 0, 1,
-1.061446, -0.7302436, -1.141323, 1, 0.8941177, 0, 1,
-1.053386, 0.5728456, 0.3072959, 1, 0.8980392, 0, 1,
-1.051173, -1.348462, -1.948701, 1, 0.9058824, 0, 1,
-1.04996, -0.05765542, 0.0412061, 1, 0.9137255, 0, 1,
-1.045634, 0.8835465, 0.03044024, 1, 0.9176471, 0, 1,
-1.039888, -0.3229457, -3.555391, 1, 0.9254902, 0, 1,
-1.034506, 1.009657, 0.1047672, 1, 0.9294118, 0, 1,
-1.028877, -1.021494, -1.637988, 1, 0.9372549, 0, 1,
-1.026144, -0.1374947, -1.912809, 1, 0.9411765, 0, 1,
-1.023711, 2.368249, 0.967133, 1, 0.9490196, 0, 1,
-1.017361, -0.645348, -3.039151, 1, 0.9529412, 0, 1,
-1.000458, -0.488805, -2.210864, 1, 0.9607843, 0, 1,
-0.9974541, -0.7966548, -2.242239, 1, 0.9647059, 0, 1,
-0.9869946, 0.7731807, -2.193259, 1, 0.972549, 0, 1,
-0.986588, -1.34009, -2.026099, 1, 0.9764706, 0, 1,
-0.9864642, 2.641515, -2.177717, 1, 0.9843137, 0, 1,
-0.9824694, -0.2968987, -3.639966, 1, 0.9882353, 0, 1,
-0.9808233, -0.2634798, -3.450633, 1, 0.9960784, 0, 1,
-0.9787916, -0.4252912, -1.070257, 0.9960784, 1, 0, 1,
-0.9743172, 0.9921368, 0.7003995, 0.9921569, 1, 0, 1,
-0.9695598, 0.3092804, -0.277103, 0.9843137, 1, 0, 1,
-0.9681914, -0.370978, -1.529627, 0.9803922, 1, 0, 1,
-0.9610098, 0.8295164, -1.65408, 0.972549, 1, 0, 1,
-0.960682, 1.034876, -2.16752, 0.9686275, 1, 0, 1,
-0.9555451, -0.4306793, -0.4764658, 0.9607843, 1, 0, 1,
-0.952113, 1.465701, -0.2912566, 0.9568627, 1, 0, 1,
-0.9464288, 0.4875919, -0.06052985, 0.9490196, 1, 0, 1,
-0.9459506, -0.4667479, -1.649909, 0.945098, 1, 0, 1,
-0.9448167, -1.544722, -1.762238, 0.9372549, 1, 0, 1,
-0.9437293, -0.5866206, -1.848474, 0.9333333, 1, 0, 1,
-0.943714, 0.1598598, -1.42183, 0.9254902, 1, 0, 1,
-0.942053, 0.7364756, -0.5612825, 0.9215686, 1, 0, 1,
-0.9272821, 0.2636888, -1.38726, 0.9137255, 1, 0, 1,
-0.9212915, 2.823865, 0.4020793, 0.9098039, 1, 0, 1,
-0.9186056, 0.1184562, -0.1439757, 0.9019608, 1, 0, 1,
-0.9167617, -0.3448162, -2.929203, 0.8941177, 1, 0, 1,
-0.9144605, -1.212616, -1.757321, 0.8901961, 1, 0, 1,
-0.9135032, -1.263438, -2.660966, 0.8823529, 1, 0, 1,
-0.8975199, -0.9314638, -2.160568, 0.8784314, 1, 0, 1,
-0.8957907, 0.4960726, -1.097726, 0.8705882, 1, 0, 1,
-0.8922347, 0.5418908, -2.411871, 0.8666667, 1, 0, 1,
-0.8896358, -0.01485677, -2.455602, 0.8588235, 1, 0, 1,
-0.8840705, -0.6173493, -2.83889, 0.854902, 1, 0, 1,
-0.880397, -0.3722397, -4.306779, 0.8470588, 1, 0, 1,
-0.8776505, 1.24519, 0.2713264, 0.8431373, 1, 0, 1,
-0.872606, 0.5418068, 0.3344473, 0.8352941, 1, 0, 1,
-0.8695877, -0.1431198, -0.8080063, 0.8313726, 1, 0, 1,
-0.8677839, 0.1545091, -0.5140972, 0.8235294, 1, 0, 1,
-0.8663786, 1.502344, 0.6894233, 0.8196079, 1, 0, 1,
-0.8659518, -1.230868, -3.123593, 0.8117647, 1, 0, 1,
-0.8658814, -1.466431, -1.5642, 0.8078431, 1, 0, 1,
-0.86535, -1.054815, -4.163846, 0.8, 1, 0, 1,
-0.8630608, -0.3990141, -2.11457, 0.7921569, 1, 0, 1,
-0.8623756, 0.9397527, 0.9355087, 0.7882353, 1, 0, 1,
-0.852196, -0.4814811, -1.942094, 0.7803922, 1, 0, 1,
-0.8487881, 1.023014, -0.6958669, 0.7764706, 1, 0, 1,
-0.8458139, -1.227052, -3.850268, 0.7686275, 1, 0, 1,
-0.8393175, -1.126364, -2.665642, 0.7647059, 1, 0, 1,
-0.8391798, -0.5860357, -1.072999, 0.7568628, 1, 0, 1,
-0.8391545, 0.07902591, -1.291888, 0.7529412, 1, 0, 1,
-0.8325446, -0.3801543, -1.021231, 0.7450981, 1, 0, 1,
-0.8267455, 0.6622398, -0.4850602, 0.7411765, 1, 0, 1,
-0.8255601, -0.2766008, -2.412798, 0.7333333, 1, 0, 1,
-0.8216307, -1.412946, -3.658564, 0.7294118, 1, 0, 1,
-0.8099942, -0.6971487, -2.808988, 0.7215686, 1, 0, 1,
-0.8013629, -3.88969, -4.585014, 0.7176471, 1, 0, 1,
-0.7991075, 1.004452, -1.510936, 0.7098039, 1, 0, 1,
-0.7985687, -0.8413176, -2.988794, 0.7058824, 1, 0, 1,
-0.7926869, -0.3549235, -1.923264, 0.6980392, 1, 0, 1,
-0.7926412, -0.117023, -1.84077, 0.6901961, 1, 0, 1,
-0.7923602, -0.4857756, -1.081703, 0.6862745, 1, 0, 1,
-0.7868328, 0.7331462, -0.1993927, 0.6784314, 1, 0, 1,
-0.7851177, 2.149001, -0.003896003, 0.6745098, 1, 0, 1,
-0.7801668, 0.592169, 0.1170111, 0.6666667, 1, 0, 1,
-0.7787182, -0.4761018, -1.279463, 0.6627451, 1, 0, 1,
-0.7690875, -0.2654447, -1.646629, 0.654902, 1, 0, 1,
-0.7660004, -0.146678, -3.231826, 0.6509804, 1, 0, 1,
-0.7655032, 0.06454372, -2.029476, 0.6431373, 1, 0, 1,
-0.765224, -0.4865946, -1.577703, 0.6392157, 1, 0, 1,
-0.7635804, -0.9490288, -2.333953, 0.6313726, 1, 0, 1,
-0.756831, -0.4566101, -3.101432, 0.627451, 1, 0, 1,
-0.7564124, -0.2443587, -2.753004, 0.6196079, 1, 0, 1,
-0.7496292, -0.02917728, -1.856382, 0.6156863, 1, 0, 1,
-0.7421321, 1.876678, -0.6521401, 0.6078432, 1, 0, 1,
-0.7407923, 0.7126845, 0.8157483, 0.6039216, 1, 0, 1,
-0.737327, 1.14021, -0.449859, 0.5960785, 1, 0, 1,
-0.7283716, -0.1114959, -2.52462, 0.5882353, 1, 0, 1,
-0.7257982, -0.8014985, -2.962528, 0.5843138, 1, 0, 1,
-0.7183136, -0.7639052, -3.051144, 0.5764706, 1, 0, 1,
-0.7154959, 0.1846581, 0.3981153, 0.572549, 1, 0, 1,
-0.7145531, -1.101789, -1.536312, 0.5647059, 1, 0, 1,
-0.713392, 0.3002615, -1.935012, 0.5607843, 1, 0, 1,
-0.7133699, -0.1195783, -1.522134, 0.5529412, 1, 0, 1,
-0.7093664, -0.09633604, -1.957746, 0.5490196, 1, 0, 1,
-0.7024546, -0.1384937, -2.349018, 0.5411765, 1, 0, 1,
-0.6968293, -0.8950446, -2.843462, 0.5372549, 1, 0, 1,
-0.6954148, -0.3418307, -1.011062, 0.5294118, 1, 0, 1,
-0.6870797, 1.785859, -0.2314692, 0.5254902, 1, 0, 1,
-0.6811936, 1.35048, -0.4745541, 0.5176471, 1, 0, 1,
-0.6806595, -0.7579777, -2.049037, 0.5137255, 1, 0, 1,
-0.6795079, -0.3816921, -1.923834, 0.5058824, 1, 0, 1,
-0.6794721, -0.1374468, -0.889811, 0.5019608, 1, 0, 1,
-0.6792252, 1.98822, 0.8680598, 0.4941176, 1, 0, 1,
-0.6768683, 0.6344922, -1.037369, 0.4862745, 1, 0, 1,
-0.6693056, -0.9420761, -2.85393, 0.4823529, 1, 0, 1,
-0.6680818, -0.5031967, -1.452086, 0.4745098, 1, 0, 1,
-0.6620619, 0.01106335, -0.9369112, 0.4705882, 1, 0, 1,
-0.6605313, -1.108572, -2.477664, 0.4627451, 1, 0, 1,
-0.6595376, 0.9829492, 0.2702917, 0.4588235, 1, 0, 1,
-0.6527483, -0.2978069, -4.320404, 0.4509804, 1, 0, 1,
-0.6496522, -0.2497066, -2.238649, 0.4470588, 1, 0, 1,
-0.6468139, 0.04911884, -1.314701, 0.4392157, 1, 0, 1,
-0.6439674, 1.056922, -1.198768, 0.4352941, 1, 0, 1,
-0.6401312, 1.506321, 0.41822, 0.427451, 1, 0, 1,
-0.6289607, -0.2623776, -1.212154, 0.4235294, 1, 0, 1,
-0.6265575, -0.1709524, -1.834822, 0.4156863, 1, 0, 1,
-0.6248333, -0.3295724, -2.328309, 0.4117647, 1, 0, 1,
-0.6204846, -1.630632, -4.269817, 0.4039216, 1, 0, 1,
-0.6153778, 0.8771481, -0.5454621, 0.3960784, 1, 0, 1,
-0.6073579, 0.05187356, -0.5422885, 0.3921569, 1, 0, 1,
-0.6047323, 1.377552, -0.06803846, 0.3843137, 1, 0, 1,
-0.6030585, 0.3565616, -2.374576, 0.3803922, 1, 0, 1,
-0.5945316, -0.01323577, -1.150992, 0.372549, 1, 0, 1,
-0.5869505, -1.371162, -4.782362, 0.3686275, 1, 0, 1,
-0.5852952, 1.140461, -0.8411696, 0.3607843, 1, 0, 1,
-0.5836706, -1.691111, -2.185441, 0.3568628, 1, 0, 1,
-0.5748618, -0.5763332, -2.02952, 0.3490196, 1, 0, 1,
-0.5735899, 0.7550961, -1.348845, 0.345098, 1, 0, 1,
-0.5715721, 0.4691881, -1.027423, 0.3372549, 1, 0, 1,
-0.5653594, 0.7178644, -2.38804, 0.3333333, 1, 0, 1,
-0.5611821, 0.2320023, -1.71112, 0.3254902, 1, 0, 1,
-0.5567781, -1.238834, -1.034042, 0.3215686, 1, 0, 1,
-0.5564016, 0.1464544, -1.976535, 0.3137255, 1, 0, 1,
-0.5529583, 2.341, -1.004637, 0.3098039, 1, 0, 1,
-0.5512341, -1.314448, -1.50803, 0.3019608, 1, 0, 1,
-0.5443519, -1.483717, -3.688335, 0.2941177, 1, 0, 1,
-0.5425578, 1.238267, -1.415275, 0.2901961, 1, 0, 1,
-0.5417616, -0.175953, -2.568806, 0.282353, 1, 0, 1,
-0.5417, -2.57819, -3.015893, 0.2784314, 1, 0, 1,
-0.5383404, 0.08325654, -2.048418, 0.2705882, 1, 0, 1,
-0.530172, 0.2273884, -2.123236, 0.2666667, 1, 0, 1,
-0.5189078, -0.7779908, -2.320452, 0.2588235, 1, 0, 1,
-0.5140445, -1.030706, -2.120059, 0.254902, 1, 0, 1,
-0.5133439, 1.711438, -0.07897451, 0.2470588, 1, 0, 1,
-0.5097352, 0.01873024, -1.210231, 0.2431373, 1, 0, 1,
-0.505586, -0.606167, -2.58388, 0.2352941, 1, 0, 1,
-0.5038897, 0.1242132, -1.925829, 0.2313726, 1, 0, 1,
-0.5029817, 0.3275188, -1.140081, 0.2235294, 1, 0, 1,
-0.502183, -0.2115429, -2.611806, 0.2196078, 1, 0, 1,
-0.4952764, -0.3661388, -1.104242, 0.2117647, 1, 0, 1,
-0.4946838, -0.05982498, -1.334306, 0.2078431, 1, 0, 1,
-0.4917833, 1.095403, 0.6053179, 0.2, 1, 0, 1,
-0.4875871, -0.515215, -2.350654, 0.1921569, 1, 0, 1,
-0.486308, -1.163431, -3.056023, 0.1882353, 1, 0, 1,
-0.4816928, -0.01822896, -2.796973, 0.1803922, 1, 0, 1,
-0.4762664, 0.5475581, 0.2239235, 0.1764706, 1, 0, 1,
-0.4760773, 1.025885, 1.424355, 0.1686275, 1, 0, 1,
-0.4733857, -0.07589567, -2.943306, 0.1647059, 1, 0, 1,
-0.4733309, -0.967537, -2.486587, 0.1568628, 1, 0, 1,
-0.4722881, 1.944674, -0.9366878, 0.1529412, 1, 0, 1,
-0.4720847, -1.541173, -2.083671, 0.145098, 1, 0, 1,
-0.4717927, -0.1620153, -0.9243001, 0.1411765, 1, 0, 1,
-0.4715334, 1.348244, 0.03402002, 0.1333333, 1, 0, 1,
-0.4701559, 0.2907574, -1.570629, 0.1294118, 1, 0, 1,
-0.469043, 0.5879529, 0.04269589, 0.1215686, 1, 0, 1,
-0.4634302, 0.2454117, -2.042454, 0.1176471, 1, 0, 1,
-0.461421, -1.661401, -2.746318, 0.1098039, 1, 0, 1,
-0.4577325, -0.2852541, -1.581327, 0.1058824, 1, 0, 1,
-0.4564458, 0.5140567, -0.3489211, 0.09803922, 1, 0, 1,
-0.4550962, -0.4487458, -3.514923, 0.09019608, 1, 0, 1,
-0.4453346, -0.3313829, -3.567815, 0.08627451, 1, 0, 1,
-0.4453342, -0.9763227, -3.674167, 0.07843138, 1, 0, 1,
-0.4449843, -0.6401483, -2.0713, 0.07450981, 1, 0, 1,
-0.4412459, 0.7599093, -1.684758, 0.06666667, 1, 0, 1,
-0.4386255, 2.384134, 0.4933414, 0.0627451, 1, 0, 1,
-0.437115, 0.4152529, -0.4072792, 0.05490196, 1, 0, 1,
-0.4331736, -1.100856, -3.340817, 0.05098039, 1, 0, 1,
-0.4312851, -1.495215, -2.942384, 0.04313726, 1, 0, 1,
-0.4284659, 1.01564, -0.2460268, 0.03921569, 1, 0, 1,
-0.4242826, -1.487856, -2.019712, 0.03137255, 1, 0, 1,
-0.4225708, -0.7410253, -4.053223, 0.02745098, 1, 0, 1,
-0.4223503, -0.5665717, -3.958917, 0.01960784, 1, 0, 1,
-0.4215164, 0.8236419, -1.430785, 0.01568628, 1, 0, 1,
-0.4181033, 0.3873565, 0.1435693, 0.007843138, 1, 0, 1,
-0.4164817, -2.292716, -4.257375, 0.003921569, 1, 0, 1,
-0.4113762, 1.409992, -0.3145263, 0, 1, 0.003921569, 1,
-0.4059727, 0.150271, -2.034228, 0, 1, 0.01176471, 1,
-0.4047324, 0.2118683, -2.994231, 0, 1, 0.01568628, 1,
-0.4025346, 1.859586, 0.8069513, 0, 1, 0.02352941, 1,
-0.3959957, 1.982782, -1.202902, 0, 1, 0.02745098, 1,
-0.395897, 1.292276, 0.1679689, 0, 1, 0.03529412, 1,
-0.3937873, -0.121962, -0.9412779, 0, 1, 0.03921569, 1,
-0.3927567, 0.1690822, -1.621261, 0, 1, 0.04705882, 1,
-0.3794946, 0.623117, -1.001763, 0, 1, 0.05098039, 1,
-0.3791966, -0.2279944, -2.666559, 0, 1, 0.05882353, 1,
-0.3783865, 1.269607, 0.1996121, 0, 1, 0.0627451, 1,
-0.3756289, 0.4437198, 0.5246868, 0, 1, 0.07058824, 1,
-0.3742883, 2.638113, 0.1146331, 0, 1, 0.07450981, 1,
-0.3740861, -1.536106, -3.953615, 0, 1, 0.08235294, 1,
-0.3718285, -0.4928973, -1.115461, 0, 1, 0.08627451, 1,
-0.3671058, -2.247542, -3.552022, 0, 1, 0.09411765, 1,
-0.3664808, 0.4115941, -0.02724799, 0, 1, 0.1019608, 1,
-0.3621677, -1.511245, -2.531437, 0, 1, 0.1058824, 1,
-0.3620553, -0.6490051, -2.487068, 0, 1, 0.1137255, 1,
-0.3607851, 0.7527246, -0.08692835, 0, 1, 0.1176471, 1,
-0.3593772, -1.132066, -3.005491, 0, 1, 0.1254902, 1,
-0.3575068, 0.4430661, 0.605682, 0, 1, 0.1294118, 1,
-0.3573643, 0.3351818, -1.067306, 0, 1, 0.1372549, 1,
-0.345843, -1.656411, -2.533576, 0, 1, 0.1411765, 1,
-0.3441942, 0.6050157, -1.376238, 0, 1, 0.1490196, 1,
-0.3424689, -0.112363, -3.694189, 0, 1, 0.1529412, 1,
-0.3367806, -0.5793958, -2.108193, 0, 1, 0.1607843, 1,
-0.3332714, -0.9906478, -1.976239, 0, 1, 0.1647059, 1,
-0.3318222, -1.150985, -5.876719, 0, 1, 0.172549, 1,
-0.3304008, -0.6600824, -1.452143, 0, 1, 0.1764706, 1,
-0.3300338, -1.94094, -1.083522, 0, 1, 0.1843137, 1,
-0.3280934, 0.8146369, -0.8580691, 0, 1, 0.1882353, 1,
-0.3274589, 0.08733156, -0.4038, 0, 1, 0.1960784, 1,
-0.3256761, 1.096154, 1.163625, 0, 1, 0.2039216, 1,
-0.3249509, -0.5772375, -1.464719, 0, 1, 0.2078431, 1,
-0.3224105, -1.544341, -3.506751, 0, 1, 0.2156863, 1,
-0.3212731, -1.388579, -2.907007, 0, 1, 0.2196078, 1,
-0.318281, 0.1871071, 0.1617705, 0, 1, 0.227451, 1,
-0.318046, 0.5097225, -1.78879, 0, 1, 0.2313726, 1,
-0.3138318, -1.094487, -3.685477, 0, 1, 0.2392157, 1,
-0.3123803, -0.9140676, -3.172846, 0, 1, 0.2431373, 1,
-0.3089802, 0.6270156, -0.9107131, 0, 1, 0.2509804, 1,
-0.3087587, 0.6146071, 0.4737292, 0, 1, 0.254902, 1,
-0.3079789, -0.5232372, -1.649676, 0, 1, 0.2627451, 1,
-0.3034761, 1.633095, -0.8630018, 0, 1, 0.2666667, 1,
-0.3018739, 0.06066626, -3.133745, 0, 1, 0.2745098, 1,
-0.2983466, 1.097912, 1.514048, 0, 1, 0.2784314, 1,
-0.2943216, -0.1381225, -1.855389, 0, 1, 0.2862745, 1,
-0.2895903, 0.572434, 0.04749395, 0, 1, 0.2901961, 1,
-0.2890888, -0.3425894, -1.950791, 0, 1, 0.2980392, 1,
-0.2875286, -0.1075842, -0.5924823, 0, 1, 0.3058824, 1,
-0.286192, -0.8680418, -2.650924, 0, 1, 0.3098039, 1,
-0.2836212, -0.4338279, -1.575611, 0, 1, 0.3176471, 1,
-0.2825006, 0.2336884, -1.768157, 0, 1, 0.3215686, 1,
-0.2741856, 1.752006, 1.599136, 0, 1, 0.3294118, 1,
-0.2741268, -0.09112671, -1.950075, 0, 1, 0.3333333, 1,
-0.2709827, 0.08110132, -1.462931, 0, 1, 0.3411765, 1,
-0.2658102, -1.316694, -5.238011, 0, 1, 0.345098, 1,
-0.2645752, 0.3047689, -0.3179426, 0, 1, 0.3529412, 1,
-0.2631567, 1.114672, -0.8683589, 0, 1, 0.3568628, 1,
-0.2608694, 1.511525, 0.5437136, 0, 1, 0.3647059, 1,
-0.2603576, -0.4753857, -3.104584, 0, 1, 0.3686275, 1,
-0.2594855, -1.609553, -2.181161, 0, 1, 0.3764706, 1,
-0.2471091, -0.2757055, -2.252731, 0, 1, 0.3803922, 1,
-0.2419445, -1.571084, -4.163429, 0, 1, 0.3882353, 1,
-0.24119, 1.238418, -0.4622075, 0, 1, 0.3921569, 1,
-0.2398513, -0.3134756, -2.902462, 0, 1, 0.4, 1,
-0.2371646, 0.4850198, -1.580817, 0, 1, 0.4078431, 1,
-0.2340407, -1.779946, -0.4579059, 0, 1, 0.4117647, 1,
-0.229181, 1.643437, -0.3519509, 0, 1, 0.4196078, 1,
-0.2262122, 0.6547663, 0.3582956, 0, 1, 0.4235294, 1,
-0.22324, 1.098837, 0.7890034, 0, 1, 0.4313726, 1,
-0.2223723, -0.01316084, -1.035674, 0, 1, 0.4352941, 1,
-0.2213832, 0.4979864, 2.540298, 0, 1, 0.4431373, 1,
-0.2211207, 0.4501161, -0.04380532, 0, 1, 0.4470588, 1,
-0.2183329, -0.4801508, -4.374916, 0, 1, 0.454902, 1,
-0.218112, -1.47513, -2.672791, 0, 1, 0.4588235, 1,
-0.2164168, -0.5217094, -3.157667, 0, 1, 0.4666667, 1,
-0.2158498, -0.8745875, -3.245229, 0, 1, 0.4705882, 1,
-0.2157716, -1.413459, -1.417996, 0, 1, 0.4784314, 1,
-0.2150508, 0.6825431, -0.9253448, 0, 1, 0.4823529, 1,
-0.2148428, 1.157732, -1.880183, 0, 1, 0.4901961, 1,
-0.2134086, 0.4420451, 1.758132, 0, 1, 0.4941176, 1,
-0.2100735, 0.4294479, -0.656967, 0, 1, 0.5019608, 1,
-0.2067409, -0.2493233, -1.893571, 0, 1, 0.509804, 1,
-0.2050457, 0.4225181, 1.43881, 0, 1, 0.5137255, 1,
-0.1998133, -2.892808, -3.367159, 0, 1, 0.5215687, 1,
-0.1967123, 1.298245, 0.2371371, 0, 1, 0.5254902, 1,
-0.1966903, 1.079125, 1.316569, 0, 1, 0.5333334, 1,
-0.1925863, -0.5220999, -2.889778, 0, 1, 0.5372549, 1,
-0.1923722, -1.888936, -3.570017, 0, 1, 0.5450981, 1,
-0.189464, 1.714914, 0.09480182, 0, 1, 0.5490196, 1,
-0.1890341, -0.02883601, -1.987812, 0, 1, 0.5568628, 1,
-0.187254, 0.6655303, 0.06607635, 0, 1, 0.5607843, 1,
-0.1815143, 0.9197854, -0.8413422, 0, 1, 0.5686275, 1,
-0.1812401, -1.272565, -1.173981, 0, 1, 0.572549, 1,
-0.178585, -0.2461985, -2.617899, 0, 1, 0.5803922, 1,
-0.1765465, 1.202173, -0.4012196, 0, 1, 0.5843138, 1,
-0.1733767, 0.9959034, -1.256687, 0, 1, 0.5921569, 1,
-0.170506, 0.1079037, -0.2500958, 0, 1, 0.5960785, 1,
-0.1702947, 0.3171918, -1.945889, 0, 1, 0.6039216, 1,
-0.1688644, 1.368616, -0.6384872, 0, 1, 0.6117647, 1,
-0.1650759, 0.5555431, 0.03611664, 0, 1, 0.6156863, 1,
-0.1646071, -0.2068038, -2.427718, 0, 1, 0.6235294, 1,
-0.1637105, 2.162362, 0.8021337, 0, 1, 0.627451, 1,
-0.1613515, 0.3231234, -0.9641701, 0, 1, 0.6352941, 1,
-0.160069, 1.729696, 0.6956648, 0, 1, 0.6392157, 1,
-0.1558861, 1.957186, -0.5701841, 0, 1, 0.6470588, 1,
-0.1543897, -0.1795375, -2.457747, 0, 1, 0.6509804, 1,
-0.149273, 0.2552003, 0.02901233, 0, 1, 0.6588235, 1,
-0.1458492, -0.7572956, -2.524553, 0, 1, 0.6627451, 1,
-0.1407773, 0.3443212, -0.941113, 0, 1, 0.6705883, 1,
-0.1400049, -0.3361247, -2.17363, 0, 1, 0.6745098, 1,
-0.1395018, -1.531742, -3.608465, 0, 1, 0.682353, 1,
-0.1363059, -0.7024115, -3.073218, 0, 1, 0.6862745, 1,
-0.1346075, 0.5521247, -0.07453346, 0, 1, 0.6941177, 1,
-0.1233327, -0.2887372, -2.42003, 0, 1, 0.7019608, 1,
-0.1219566, -1.176798, -3.189514, 0, 1, 0.7058824, 1,
-0.1183701, 1.094164, -0.6197973, 0, 1, 0.7137255, 1,
-0.1172803, 1.004365, 0.04543127, 0, 1, 0.7176471, 1,
-0.1163147, -0.7636827, -1.863621, 0, 1, 0.7254902, 1,
-0.1140661, 0.9167738, -1.487083, 0, 1, 0.7294118, 1,
-0.1087031, -1.274922, -3.273531, 0, 1, 0.7372549, 1,
-0.1051445, 0.2660719, -0.7458674, 0, 1, 0.7411765, 1,
-0.1049074, -0.4179331, -3.070936, 0, 1, 0.7490196, 1,
-0.1040329, 0.7725694, -0.09170268, 0, 1, 0.7529412, 1,
-0.1037965, -0.8564963, -3.183698, 0, 1, 0.7607843, 1,
-0.1033669, -0.1145737, -1.332448, 0, 1, 0.7647059, 1,
-0.1023241, -1.270227, -5.818849, 0, 1, 0.772549, 1,
-0.09867879, -0.5079998, -3.414551, 0, 1, 0.7764706, 1,
-0.09766649, -0.6693942, -3.586674, 0, 1, 0.7843137, 1,
-0.0959875, 0.124392, -1.077316, 0, 1, 0.7882353, 1,
-0.0958443, 1.216115, -1.32374, 0, 1, 0.7960784, 1,
-0.09311996, 0.2804256, -1.90918, 0, 1, 0.8039216, 1,
-0.0912667, -1.099254, -5.305414, 0, 1, 0.8078431, 1,
-0.09085995, 0.1845812, -1.125973, 0, 1, 0.8156863, 1,
-0.08913479, -0.6498493, -2.298982, 0, 1, 0.8196079, 1,
-0.08857521, 0.7335131, -0.8539436, 0, 1, 0.827451, 1,
-0.0867304, -0.695677, -2.787672, 0, 1, 0.8313726, 1,
-0.08524449, -0.9237645, -1.585884, 0, 1, 0.8392157, 1,
-0.08001862, -1.895356, -1.655163, 0, 1, 0.8431373, 1,
-0.07870224, -0.8051423, -2.818886, 0, 1, 0.8509804, 1,
-0.0753391, -0.9936672, -3.976435, 0, 1, 0.854902, 1,
-0.07308124, 0.81981, 0.01942234, 0, 1, 0.8627451, 1,
-0.07094637, -0.8430462, -2.523163, 0, 1, 0.8666667, 1,
-0.06742839, -1.09595, -2.895002, 0, 1, 0.8745098, 1,
-0.06328931, -0.3289063, -3.008835, 0, 1, 0.8784314, 1,
-0.05443174, -0.6381433, -2.708266, 0, 1, 0.8862745, 1,
-0.05105316, -0.2070217, -2.307081, 0, 1, 0.8901961, 1,
-0.04999074, -0.4020689, -3.041737, 0, 1, 0.8980392, 1,
-0.04742651, -0.8378361, -4.378626, 0, 1, 0.9058824, 1,
-0.04734622, -0.6550428, -3.924538, 0, 1, 0.9098039, 1,
-0.04423582, -1.006819, -3.193246, 0, 1, 0.9176471, 1,
-0.03435412, 0.9215543, -0.3057501, 0, 1, 0.9215686, 1,
-0.03291075, 0.03054034, -1.04865, 0, 1, 0.9294118, 1,
-0.03109494, -0.6529518, -2.973331, 0, 1, 0.9333333, 1,
-0.02892438, 0.6197155, -0.8497755, 0, 1, 0.9411765, 1,
-0.025976, 0.2038615, -0.4346164, 0, 1, 0.945098, 1,
-0.02415762, -0.1390557, -3.977958, 0, 1, 0.9529412, 1,
-0.02350148, 0.3828639, 0.8240654, 0, 1, 0.9568627, 1,
-0.0234664, 0.2443528, 0.3921025, 0, 1, 0.9647059, 1,
-0.02275693, 1.091616, 1.338609, 0, 1, 0.9686275, 1,
-0.01664663, -1.49289, -3.886133, 0, 1, 0.9764706, 1,
-0.01257605, -0.6286974, -2.259857, 0, 1, 0.9803922, 1,
-0.01227059, 0.3977058, 0.8078483, 0, 1, 0.9882353, 1,
-0.01224794, 0.2445722, -0.4011003, 0, 1, 0.9921569, 1,
-0.009266132, 0.6615211, 0.03613812, 0, 1, 1, 1,
-0.005981747, -0.6158581, -4.107422, 0, 0.9921569, 1, 1,
-0.003564645, -0.8667901, -2.943578, 0, 0.9882353, 1, 1,
0.008568514, 1.392175, -0.4777144, 0, 0.9803922, 1, 1,
0.01600922, -0.5574839, 3.402299, 0, 0.9764706, 1, 1,
0.01786811, -1.612708, 2.854858, 0, 0.9686275, 1, 1,
0.02239627, -0.05188106, 2.558016, 0, 0.9647059, 1, 1,
0.02982461, -2.034456, 5.134109, 0, 0.9568627, 1, 1,
0.034941, -1.706513, 2.296352, 0, 0.9529412, 1, 1,
0.03644851, 0.5556458, 0.5177174, 0, 0.945098, 1, 1,
0.036477, 1.901947, -0.5755489, 0, 0.9411765, 1, 1,
0.03683567, -0.3687355, 2.672189, 0, 0.9333333, 1, 1,
0.04276939, -0.7631941, 2.593795, 0, 0.9294118, 1, 1,
0.05301895, 0.5044212, 0.5953415, 0, 0.9215686, 1, 1,
0.05508042, -0.9202676, 3.02682, 0, 0.9176471, 1, 1,
0.06115167, 0.1589027, 1.884644, 0, 0.9098039, 1, 1,
0.06589484, -1.363842, 4.808936, 0, 0.9058824, 1, 1,
0.06620559, -0.2320705, 3.372267, 0, 0.8980392, 1, 1,
0.07104681, 0.7059274, -0.8214321, 0, 0.8901961, 1, 1,
0.07109318, -1.162096, 2.342611, 0, 0.8862745, 1, 1,
0.07309073, -1.269147, 2.502, 0, 0.8784314, 1, 1,
0.07309397, 0.2201722, -0.1029051, 0, 0.8745098, 1, 1,
0.07326536, 0.6322916, 0.4540879, 0, 0.8666667, 1, 1,
0.07356668, -0.1320318, 3.673097, 0, 0.8627451, 1, 1,
0.07755586, -1.91333, 1.732378, 0, 0.854902, 1, 1,
0.08304169, -0.6732766, 3.340134, 0, 0.8509804, 1, 1,
0.08314391, -0.08992968, 2.65408, 0, 0.8431373, 1, 1,
0.08404817, 1.554485, -0.4296199, 0, 0.8392157, 1, 1,
0.0852728, 0.03464274, 0.8119509, 0, 0.8313726, 1, 1,
0.08550967, -1.021957, 3.54697, 0, 0.827451, 1, 1,
0.0856651, 0.4203301, 1.64072, 0, 0.8196079, 1, 1,
0.08834976, -1.619614, 3.821445, 0, 0.8156863, 1, 1,
0.09227084, -1.058062, 3.68558, 0, 0.8078431, 1, 1,
0.09512754, -0.2903655, 4.267783, 0, 0.8039216, 1, 1,
0.101911, -0.1891406, 3.630443, 0, 0.7960784, 1, 1,
0.1027733, 0.1080978, 1.300738, 0, 0.7882353, 1, 1,
0.1123675, 0.8092453, 0.7878193, 0, 0.7843137, 1, 1,
0.1133729, -1.265035, 4.219276, 0, 0.7764706, 1, 1,
0.11365, -1.225411, 5.893633, 0, 0.772549, 1, 1,
0.114348, 0.3340547, 0.09085652, 0, 0.7647059, 1, 1,
0.117752, -0.4351713, 4.653432, 0, 0.7607843, 1, 1,
0.1211135, -0.6047388, 5.131278, 0, 0.7529412, 1, 1,
0.1211469, -0.7321545, 2.164647, 0, 0.7490196, 1, 1,
0.1216458, -0.2521302, 2.929866, 0, 0.7411765, 1, 1,
0.1223073, 1.167997, 0.7174535, 0, 0.7372549, 1, 1,
0.1234697, 0.1237273, 1.111484, 0, 0.7294118, 1, 1,
0.1253355, 1.091019, 1.525451, 0, 0.7254902, 1, 1,
0.1272781, 0.7200536, -0.836683, 0, 0.7176471, 1, 1,
0.1280143, 1.204239, -1.686443, 0, 0.7137255, 1, 1,
0.1280927, -1.049166, 1.798725, 0, 0.7058824, 1, 1,
0.1282686, 0.5327018, 0.04362876, 0, 0.6980392, 1, 1,
0.1286312, 0.1503062, -1.838703, 0, 0.6941177, 1, 1,
0.1310215, 0.5461811, 0.04910132, 0, 0.6862745, 1, 1,
0.1321688, 1.323018, -0.1744687, 0, 0.682353, 1, 1,
0.1322897, -2.846087, 4.014323, 0, 0.6745098, 1, 1,
0.1339743, 0.9251452, 0.624278, 0, 0.6705883, 1, 1,
0.1364069, 0.3018304, -0.3168392, 0, 0.6627451, 1, 1,
0.1373615, -0.7546774, 2.40209, 0, 0.6588235, 1, 1,
0.1378512, 1.060514, -0.1691011, 0, 0.6509804, 1, 1,
0.1411007, -0.7680702, 2.314523, 0, 0.6470588, 1, 1,
0.1441615, 0.9034535, -0.6809207, 0, 0.6392157, 1, 1,
0.1442385, 1.25654, -0.492647, 0, 0.6352941, 1, 1,
0.1449191, 2.239032, 1.405347, 0, 0.627451, 1, 1,
0.1460753, 1.58753, 0.7098244, 0, 0.6235294, 1, 1,
0.1495541, 0.9182109, 1.525044, 0, 0.6156863, 1, 1,
0.1498545, 1.907373, 0.933275, 0, 0.6117647, 1, 1,
0.1501251, -0.1930452, 2.604794, 0, 0.6039216, 1, 1,
0.1529573, -0.4381634, 2.679416, 0, 0.5960785, 1, 1,
0.1537318, 0.7295013, -0.0656302, 0, 0.5921569, 1, 1,
0.1543009, 0.4302344, 0.9654205, 0, 0.5843138, 1, 1,
0.1621492, 0.7699897, 0.1873317, 0, 0.5803922, 1, 1,
0.1711451, -0.1368723, 2.061005, 0, 0.572549, 1, 1,
0.1728587, 1.377203, 1.806686, 0, 0.5686275, 1, 1,
0.173872, -2.135291, 3.546144, 0, 0.5607843, 1, 1,
0.1759556, 0.999066, -0.2857459, 0, 0.5568628, 1, 1,
0.1798765, 0.7616398, 1.320152, 0, 0.5490196, 1, 1,
0.1833869, 0.8686447, 0.1055602, 0, 0.5450981, 1, 1,
0.1970099, 0.05320385, 2.830546, 0, 0.5372549, 1, 1,
0.1986428, 1.375058, 1.513792, 0, 0.5333334, 1, 1,
0.2020298, -1.014899, 2.807927, 0, 0.5254902, 1, 1,
0.2086741, -1.317268, 2.674758, 0, 0.5215687, 1, 1,
0.209124, 0.2542875, 0.2706029, 0, 0.5137255, 1, 1,
0.2124275, 0.7227443, -0.687673, 0, 0.509804, 1, 1,
0.2136475, 0.6327519, 0.7746181, 0, 0.5019608, 1, 1,
0.2241848, -0.5798647, 1.099178, 0, 0.4941176, 1, 1,
0.2280047, -1.350928, 2.591269, 0, 0.4901961, 1, 1,
0.2284158, -0.2408661, 0.4557337, 0, 0.4823529, 1, 1,
0.2295214, -1.011578, 3.32704, 0, 0.4784314, 1, 1,
0.2297764, -1.004756, 3.101855, 0, 0.4705882, 1, 1,
0.2341699, -0.543171, 2.266385, 0, 0.4666667, 1, 1,
0.2345446, -1.92067, 4.206841, 0, 0.4588235, 1, 1,
0.2349567, 0.6079136, 0.2411847, 0, 0.454902, 1, 1,
0.2351936, 0.7639281, 1.680572, 0, 0.4470588, 1, 1,
0.2378834, 0.1306989, -0.5730736, 0, 0.4431373, 1, 1,
0.2383513, -1.295812, 2.902961, 0, 0.4352941, 1, 1,
0.2455429, 0.5118735, -0.9152102, 0, 0.4313726, 1, 1,
0.245552, 0.4784175, -0.5017242, 0, 0.4235294, 1, 1,
0.2464575, 1.171071, 0.9008468, 0, 0.4196078, 1, 1,
0.2514708, -0.666843, 2.064091, 0, 0.4117647, 1, 1,
0.2521968, -0.6055059, 2.15493, 0, 0.4078431, 1, 1,
0.2527834, -0.7728001, 2.776258, 0, 0.4, 1, 1,
0.256729, 0.7155848, -0.3427196, 0, 0.3921569, 1, 1,
0.2577742, -0.01571313, 1.480046, 0, 0.3882353, 1, 1,
0.2601853, 1.509231, 0.4773095, 0, 0.3803922, 1, 1,
0.260915, 0.03003146, 1.938232, 0, 0.3764706, 1, 1,
0.2628006, 1.042805, 2.247545, 0, 0.3686275, 1, 1,
0.267471, 1.039991, 0.664712, 0, 0.3647059, 1, 1,
0.2722271, 1.415275, 0.3310056, 0, 0.3568628, 1, 1,
0.2760012, 0.4639385, -0.5192207, 0, 0.3529412, 1, 1,
0.2774487, -1.075007, 2.091904, 0, 0.345098, 1, 1,
0.2789781, -0.9266685, 3.293305, 0, 0.3411765, 1, 1,
0.284985, -0.82782, 2.485655, 0, 0.3333333, 1, 1,
0.2855944, -0.6378808, 2.154992, 0, 0.3294118, 1, 1,
0.2859211, 0.4994121, -0.4270721, 0, 0.3215686, 1, 1,
0.2861443, 1.513349, -1.197826, 0, 0.3176471, 1, 1,
0.2883324, -2.470963, 3.444971, 0, 0.3098039, 1, 1,
0.2900703, -1.61031, 3.11551, 0, 0.3058824, 1, 1,
0.2907501, 0.1882781, 2.05835, 0, 0.2980392, 1, 1,
0.293607, -0.6291358, 5.610371, 0, 0.2901961, 1, 1,
0.3007716, -0.2414502, 2.250974, 0, 0.2862745, 1, 1,
0.3045729, -1.09637, 4.5235, 0, 0.2784314, 1, 1,
0.3053934, -1.433789, 3.013928, 0, 0.2745098, 1, 1,
0.306264, 0.8932823, 0.4984173, 0, 0.2666667, 1, 1,
0.3093339, -0.6940142, 1.636234, 0, 0.2627451, 1, 1,
0.3111849, 0.1934147, 1.436404, 0, 0.254902, 1, 1,
0.3123125, -0.6993632, 4.668902, 0, 0.2509804, 1, 1,
0.3156365, 0.5737535, 1.467604, 0, 0.2431373, 1, 1,
0.3161387, -0.669623, 2.823334, 0, 0.2392157, 1, 1,
0.3175678, -2.130871, 2.509879, 0, 0.2313726, 1, 1,
0.3176092, 0.1478022, 2.969342, 0, 0.227451, 1, 1,
0.322029, -0.6627508, 3.107508, 0, 0.2196078, 1, 1,
0.3326724, 0.4718031, -0.6078824, 0, 0.2156863, 1, 1,
0.3328235, 0.5435809, 1.443491, 0, 0.2078431, 1, 1,
0.3349409, 0.2457161, 2.462147, 0, 0.2039216, 1, 1,
0.3353872, -0.1572622, 3.126005, 0, 0.1960784, 1, 1,
0.3361763, 0.8051226, 1.044968, 0, 0.1882353, 1, 1,
0.3366165, -1.292022, 3.459912, 0, 0.1843137, 1, 1,
0.3381211, 0.07928652, 1.210113, 0, 0.1764706, 1, 1,
0.338141, 1.624758, 0.2287932, 0, 0.172549, 1, 1,
0.3421502, 0.6677283, 1.566366, 0, 0.1647059, 1, 1,
0.3436343, -0.6866979, 2.209257, 0, 0.1607843, 1, 1,
0.3454697, 0.4317581, 1.562986, 0, 0.1529412, 1, 1,
0.3484664, 0.1384169, 1.030817, 0, 0.1490196, 1, 1,
0.3541755, 0.5429406, 1.206668, 0, 0.1411765, 1, 1,
0.3553076, 0.7676463, -0.4789993, 0, 0.1372549, 1, 1,
0.3554947, 1.875292, -0.8870454, 0, 0.1294118, 1, 1,
0.3652742, 0.249421, 1.234095, 0, 0.1254902, 1, 1,
0.3662546, 0.1235458, 1.107319, 0, 0.1176471, 1, 1,
0.366395, 0.7611846, 0.1169601, 0, 0.1137255, 1, 1,
0.3682234, 0.278002, 1.022745, 0, 0.1058824, 1, 1,
0.368726, 0.7716507, 0.8212875, 0, 0.09803922, 1, 1,
0.3719721, -1.055204, 2.524621, 0, 0.09411765, 1, 1,
0.3737416, -0.7752123, 3.597462, 0, 0.08627451, 1, 1,
0.3781055, -0.07038711, 3.072974, 0, 0.08235294, 1, 1,
0.3786123, 0.1555534, 1.300529, 0, 0.07450981, 1, 1,
0.3825479, 1.118155, -0.8638079, 0, 0.07058824, 1, 1,
0.3854706, 1.533196, 1.193329, 0, 0.0627451, 1, 1,
0.3885508, -1.094263, 3.352605, 0, 0.05882353, 1, 1,
0.3906274, -0.3356539, 1.960732, 0, 0.05098039, 1, 1,
0.3908963, 0.6447156, 0.3983727, 0, 0.04705882, 1, 1,
0.3925163, -0.2294714, 2.965884, 0, 0.03921569, 1, 1,
0.3963834, 0.8651475, 0.4282453, 0, 0.03529412, 1, 1,
0.3977835, -0.6126755, 3.059756, 0, 0.02745098, 1, 1,
0.4011598, 0.3750212, 0.9785429, 0, 0.02352941, 1, 1,
0.403086, -1.81413, 2.768563, 0, 0.01568628, 1, 1,
0.4080548, -1.164543, 4.020706, 0, 0.01176471, 1, 1,
0.4135094, 0.757264, 0.0525062, 0, 0.003921569, 1, 1,
0.4186564, -0.1463428, 3.314509, 0.003921569, 0, 1, 1,
0.424305, -0.6665461, 2.712147, 0.007843138, 0, 1, 1,
0.433582, 0.9517695, 0.01766437, 0.01568628, 0, 1, 1,
0.4345066, -0.2057573, 2.380164, 0.01960784, 0, 1, 1,
0.4368898, 1.145454, 0.6178486, 0.02745098, 0, 1, 1,
0.437455, 0.5835108, 0.1659816, 0.03137255, 0, 1, 1,
0.4374903, 0.7251418, 2.005199, 0.03921569, 0, 1, 1,
0.4393933, -0.4603301, 1.850844, 0.04313726, 0, 1, 1,
0.4415877, -0.6778356, 2.82807, 0.05098039, 0, 1, 1,
0.4422958, -0.1280211, -0.0690704, 0.05490196, 0, 1, 1,
0.4430392, 0.3804578, 1.364149, 0.0627451, 0, 1, 1,
0.4495658, -0.1548909, 3.094724, 0.06666667, 0, 1, 1,
0.459706, -0.9296386, 2.531832, 0.07450981, 0, 1, 1,
0.4622949, 0.6041834, -0.6285922, 0.07843138, 0, 1, 1,
0.4628855, -0.666407, 3.608739, 0.08627451, 0, 1, 1,
0.4630689, -0.05260524, 2.074125, 0.09019608, 0, 1, 1,
0.4648844, 1.57568, 0.9810793, 0.09803922, 0, 1, 1,
0.4667083, 1.311804, 0.8529278, 0.1058824, 0, 1, 1,
0.4669077, 0.6009012, 1.493212, 0.1098039, 0, 1, 1,
0.4702285, 0.1093795, 1.964301, 0.1176471, 0, 1, 1,
0.4711724, -0.2258623, 0.3937737, 0.1215686, 0, 1, 1,
0.473447, -0.9604875, 1.793885, 0.1294118, 0, 1, 1,
0.4754646, -0.9268086, 3.287388, 0.1333333, 0, 1, 1,
0.4755041, 0.2307021, 0.9518371, 0.1411765, 0, 1, 1,
0.4831019, 1.49244, -0.3340677, 0.145098, 0, 1, 1,
0.4834159, 0.488246, 2.831974, 0.1529412, 0, 1, 1,
0.4837927, -0.8348964, 2.161373, 0.1568628, 0, 1, 1,
0.4844125, -1.095738, 4.109905, 0.1647059, 0, 1, 1,
0.4869715, 0.02601664, 1.937684, 0.1686275, 0, 1, 1,
0.490405, 0.1664771, 1.105212, 0.1764706, 0, 1, 1,
0.4906237, 1.597342, -0.43493, 0.1803922, 0, 1, 1,
0.4960354, 0.5571502, -1.287622, 0.1882353, 0, 1, 1,
0.5008925, 0.01575939, 1.687739, 0.1921569, 0, 1, 1,
0.5019032, 1.774873, 2.126871, 0.2, 0, 1, 1,
0.5056678, -0.7022421, 2.546862, 0.2078431, 0, 1, 1,
0.5057222, -1.906322, 5.219316, 0.2117647, 0, 1, 1,
0.5098817, -0.2647799, 4.405479, 0.2196078, 0, 1, 1,
0.5115366, 0.4321962, 0.467289, 0.2235294, 0, 1, 1,
0.5120274, -0.3531822, 3.699319, 0.2313726, 0, 1, 1,
0.5122566, 1.525939, -0.6018289, 0.2352941, 0, 1, 1,
0.51575, 0.8789551, 0.01465322, 0.2431373, 0, 1, 1,
0.5176706, -1.024979, 2.548961, 0.2470588, 0, 1, 1,
0.517825, -1.374642, 2.1196, 0.254902, 0, 1, 1,
0.517938, -0.1515522, 2.958378, 0.2588235, 0, 1, 1,
0.5186596, -0.0982739, 0.6394446, 0.2666667, 0, 1, 1,
0.5239742, -0.2281251, 3.046039, 0.2705882, 0, 1, 1,
0.5240493, -0.6799665, 2.094137, 0.2784314, 0, 1, 1,
0.5265968, -1.91219, 3.328955, 0.282353, 0, 1, 1,
0.52732, 1.168974, 0.6860967, 0.2901961, 0, 1, 1,
0.5377787, -0.08709295, 1.014529, 0.2941177, 0, 1, 1,
0.5379631, 0.6391363, 2.02803, 0.3019608, 0, 1, 1,
0.5385952, -0.5369297, 2.163468, 0.3098039, 0, 1, 1,
0.5390573, -1.440207, 3.33788, 0.3137255, 0, 1, 1,
0.5397704, -0.4671836, 2.593036, 0.3215686, 0, 1, 1,
0.5417508, 0.08412611, 0.6660786, 0.3254902, 0, 1, 1,
0.543708, -1.381418, 2.306606, 0.3333333, 0, 1, 1,
0.5439768, -2.294154, 3.804208, 0.3372549, 0, 1, 1,
0.547015, 0.5281392, 2.548139, 0.345098, 0, 1, 1,
0.5472291, -0.4880234, 3.338288, 0.3490196, 0, 1, 1,
0.5491606, -0.4778702, 3.36993, 0.3568628, 0, 1, 1,
0.5511158, 0.579567, 0.22538, 0.3607843, 0, 1, 1,
0.5522084, 1.564937, -1.342698, 0.3686275, 0, 1, 1,
0.5549748, 0.4155433, 0.8846235, 0.372549, 0, 1, 1,
0.562171, 0.6290362, -1.050587, 0.3803922, 0, 1, 1,
0.5678398, 1.284103, 1.119437, 0.3843137, 0, 1, 1,
0.5689143, -0.01866723, 1.034284, 0.3921569, 0, 1, 1,
0.5702099, -0.5087809, 0.6250768, 0.3960784, 0, 1, 1,
0.5734178, 0.8255351, -1.088322, 0.4039216, 0, 1, 1,
0.5796954, 0.7029792, 0.3510323, 0.4117647, 0, 1, 1,
0.5847398, 0.6425532, -0.1695432, 0.4156863, 0, 1, 1,
0.5880296, 0.7778556, 0.2315677, 0.4235294, 0, 1, 1,
0.5971848, -0.05486829, 1.68602, 0.427451, 0, 1, 1,
0.6001576, 0.6131899, 0.3636217, 0.4352941, 0, 1, 1,
0.611457, 0.3745948, 2.118658, 0.4392157, 0, 1, 1,
0.6272033, -0.1433866, 0.9732108, 0.4470588, 0, 1, 1,
0.6290039, -0.5478345, 3.551285, 0.4509804, 0, 1, 1,
0.6292162, -0.1099877, 2.061226, 0.4588235, 0, 1, 1,
0.6296247, 0.07919679, 2.588893, 0.4627451, 0, 1, 1,
0.6323685, -0.9422122, 0.9080142, 0.4705882, 0, 1, 1,
0.6356227, 1.767995, -1.045581, 0.4745098, 0, 1, 1,
0.6399843, -0.9514474, 4.363837, 0.4823529, 0, 1, 1,
0.6429523, 0.0352099, 1.80003, 0.4862745, 0, 1, 1,
0.648689, 0.2769097, 0.9097613, 0.4941176, 0, 1, 1,
0.6497086, 0.1209004, 1.759859, 0.5019608, 0, 1, 1,
0.6507984, -0.3017535, 2.783073, 0.5058824, 0, 1, 1,
0.6510782, 0.339302, 2.172261, 0.5137255, 0, 1, 1,
0.6562543, -0.3533809, 0.7865714, 0.5176471, 0, 1, 1,
0.6601323, -0.50359, 2.642425, 0.5254902, 0, 1, 1,
0.6686124, 0.745883, 1.119491, 0.5294118, 0, 1, 1,
0.6742801, -1.08319, 3.542894, 0.5372549, 0, 1, 1,
0.6771506, -0.7482851, 3.26936, 0.5411765, 0, 1, 1,
0.6779045, -0.4080184, 3.21753, 0.5490196, 0, 1, 1,
0.6780059, 0.01449669, 1.365262, 0.5529412, 0, 1, 1,
0.6818873, -1.7997, 3.378715, 0.5607843, 0, 1, 1,
0.6907732, -0.1270849, 0.1927888, 0.5647059, 0, 1, 1,
0.6910904, 0.3476822, 1.423269, 0.572549, 0, 1, 1,
0.6911862, 0.1056057, 1.773132, 0.5764706, 0, 1, 1,
0.6915609, 0.3047575, 1.917467, 0.5843138, 0, 1, 1,
0.6935932, -0.7214109, 3.431656, 0.5882353, 0, 1, 1,
0.696394, -0.6759151, 1.195413, 0.5960785, 0, 1, 1,
0.7004461, 0.1650268, 0.8224105, 0.6039216, 0, 1, 1,
0.7011203, -0.2904803, 2.600619, 0.6078432, 0, 1, 1,
0.7032899, 0.1471158, 1.161012, 0.6156863, 0, 1, 1,
0.7257037, 0.3527576, 2.304427, 0.6196079, 0, 1, 1,
0.7269326, -0.6677315, 1.918002, 0.627451, 0, 1, 1,
0.7274724, -1.493433, 2.948291, 0.6313726, 0, 1, 1,
0.7307193, 0.3133539, 1.847707, 0.6392157, 0, 1, 1,
0.7320961, 1.153328, -0.5075876, 0.6431373, 0, 1, 1,
0.7485192, 1.679311, 0.08565396, 0.6509804, 0, 1, 1,
0.7494422, -1.11209, 3.88874, 0.654902, 0, 1, 1,
0.7507448, 0.06061778, -0.4521408, 0.6627451, 0, 1, 1,
0.7539708, 0.708102, 0.3433487, 0.6666667, 0, 1, 1,
0.75533, -0.06724095, 1.773616, 0.6745098, 0, 1, 1,
0.7610251, 0.3481156, 2.19052, 0.6784314, 0, 1, 1,
0.7655492, 0.4269956, 1.800429, 0.6862745, 0, 1, 1,
0.7690009, 0.348331, 1.661537, 0.6901961, 0, 1, 1,
0.769438, 0.4801398, 2.006606, 0.6980392, 0, 1, 1,
0.7712321, 0.09258068, 0.542154, 0.7058824, 0, 1, 1,
0.7722813, -0.1010884, 1.685455, 0.7098039, 0, 1, 1,
0.7756367, -0.5314576, 3.676289, 0.7176471, 0, 1, 1,
0.7760406, 0.3382373, 2.983412, 0.7215686, 0, 1, 1,
0.7804743, -0.1031885, 2.081765, 0.7294118, 0, 1, 1,
0.7815818, 1.101148, -0.3849655, 0.7333333, 0, 1, 1,
0.7857631, 0.3339484, 1.427272, 0.7411765, 0, 1, 1,
0.7885612, -0.6959853, 2.272612, 0.7450981, 0, 1, 1,
0.7910176, -0.1694861, 1.23947, 0.7529412, 0, 1, 1,
0.794121, -0.2270917, 1.588154, 0.7568628, 0, 1, 1,
0.7950605, 0.08054166, 0.5667901, 0.7647059, 0, 1, 1,
0.7990835, -0.1910768, 3.808005, 0.7686275, 0, 1, 1,
0.8022029, 0.6061902, 0.05046725, 0.7764706, 0, 1, 1,
0.8034434, -0.1440904, 2.769184, 0.7803922, 0, 1, 1,
0.8090266, -0.6844178, 0.8863906, 0.7882353, 0, 1, 1,
0.8092918, -0.05281816, 1.54607, 0.7921569, 0, 1, 1,
0.8131582, -0.1554172, 1.559469, 0.8, 0, 1, 1,
0.8181415, -0.1706326, 1.706898, 0.8078431, 0, 1, 1,
0.8183201, 0.6932451, 2.213621, 0.8117647, 0, 1, 1,
0.830242, 0.4406519, 2.380652, 0.8196079, 0, 1, 1,
0.8351722, 0.9475974, 1.206469, 0.8235294, 0, 1, 1,
0.8417721, 0.338769, 0.1168163, 0.8313726, 0, 1, 1,
0.8426645, -1.043862, 0.7833663, 0.8352941, 0, 1, 1,
0.8434994, -0.2833804, 1.154365, 0.8431373, 0, 1, 1,
0.8440084, -0.4410176, 2.166028, 0.8470588, 0, 1, 1,
0.8440762, 1.010559, 3.397932, 0.854902, 0, 1, 1,
0.8520404, 0.07365832, 1.877592, 0.8588235, 0, 1, 1,
0.8523479, -0.4924377, 1.972559, 0.8666667, 0, 1, 1,
0.8534198, 0.2199142, 1.711164, 0.8705882, 0, 1, 1,
0.8541937, -0.8066562, 3.320694, 0.8784314, 0, 1, 1,
0.8646155, 0.1575654, 2.937211, 0.8823529, 0, 1, 1,
0.8683938, -0.006587347, 2.220553, 0.8901961, 0, 1, 1,
0.8732585, 0.189851, 1.641931, 0.8941177, 0, 1, 1,
0.8785345, 1.163794, 1.433814, 0.9019608, 0, 1, 1,
0.8870677, -0.9638972, 3.32979, 0.9098039, 0, 1, 1,
0.8910397, 1.394543, 1.847257, 0.9137255, 0, 1, 1,
0.8941207, 0.4675656, -0.03566593, 0.9215686, 0, 1, 1,
0.8949951, 0.2284234, 2.471419, 0.9254902, 0, 1, 1,
0.8970304, 1.9097, 1.020621, 0.9333333, 0, 1, 1,
0.8986865, -0.6554183, 1.169828, 0.9372549, 0, 1, 1,
0.9049279, -1.438866, 1.435873, 0.945098, 0, 1, 1,
0.9055146, 1.530415, 0.7396603, 0.9490196, 0, 1, 1,
0.9089236, -0.8532287, 3.917414, 0.9568627, 0, 1, 1,
0.9124865, -0.11323, 0.5616282, 0.9607843, 0, 1, 1,
0.9142731, 0.6813422, 1.138784, 0.9686275, 0, 1, 1,
0.9185558, -0.03945572, 3.233787, 0.972549, 0, 1, 1,
0.9220025, 0.1458486, 2.372893, 0.9803922, 0, 1, 1,
0.9288316, -0.5315115, 2.542718, 0.9843137, 0, 1, 1,
0.9300366, 0.0762815, 1.714806, 0.9921569, 0, 1, 1,
0.9383311, -0.6450541, 2.499476, 0.9960784, 0, 1, 1,
0.9451735, -0.04817701, 2.764498, 1, 0, 0.9960784, 1,
0.9470476, -0.4127003, 1.903185, 1, 0, 0.9882353, 1,
0.9483875, -0.2536256, 1.007707, 1, 0, 0.9843137, 1,
0.9532818, 0.09884911, 1.27311, 1, 0, 0.9764706, 1,
0.9592351, 0.4184139, 0.735738, 1, 0, 0.972549, 1,
0.9622331, 0.1868299, 2.910505, 1, 0, 0.9647059, 1,
0.9721651, 0.1979861, 2.512854, 1, 0, 0.9607843, 1,
0.9831852, -0.409227, 2.458849, 1, 0, 0.9529412, 1,
0.98353, 0.01567315, 1.018307, 1, 0, 0.9490196, 1,
0.9839028, -0.7408016, 0.8702845, 1, 0, 0.9411765, 1,
0.9873228, -0.3042466, 1.272892, 1, 0, 0.9372549, 1,
0.9884914, 0.9987138, 0.001441097, 1, 0, 0.9294118, 1,
0.9892001, -0.2216462, 0.7868432, 1, 0, 0.9254902, 1,
1.001787, -0.1671042, 2.26307, 1, 0, 0.9176471, 1,
1.005418, -0.2906308, 0.4790738, 1, 0, 0.9137255, 1,
1.014591, -0.2699049, 2.094575, 1, 0, 0.9058824, 1,
1.023025, -1.091553, 2.696167, 1, 0, 0.9019608, 1,
1.028031, 0.1068811, -0.8267208, 1, 0, 0.8941177, 1,
1.029214, 0.7755632, -0.6382108, 1, 0, 0.8862745, 1,
1.029931, 0.625154, 1.324676, 1, 0, 0.8823529, 1,
1.034777, -1.482552, 1.487361, 1, 0, 0.8745098, 1,
1.044912, -0.2176422, 0.4831972, 1, 0, 0.8705882, 1,
1.046285, 1.082381, 1.903696, 1, 0, 0.8627451, 1,
1.047297, -0.520337, 2.929064, 1, 0, 0.8588235, 1,
1.054837, 0.225687, 1.233866, 1, 0, 0.8509804, 1,
1.057595, -0.7550743, 0.5861757, 1, 0, 0.8470588, 1,
1.061771, -0.02912956, 0.7784067, 1, 0, 0.8392157, 1,
1.067598, 0.03848795, 1.677684, 1, 0, 0.8352941, 1,
1.080894, 0.1532772, -0.6431985, 1, 0, 0.827451, 1,
1.091742, 0.6462181, -0.6810387, 1, 0, 0.8235294, 1,
1.098996, -0.127917, 2.044026, 1, 0, 0.8156863, 1,
1.099429, -1.938285, 3.140696, 1, 0, 0.8117647, 1,
1.101526, -0.07581903, 0.04172382, 1, 0, 0.8039216, 1,
1.101989, 0.2776776, 0.5575052, 1, 0, 0.7960784, 1,
1.102777, -0.2118263, 2.742099, 1, 0, 0.7921569, 1,
1.104875, -1.573806, 1.712498, 1, 0, 0.7843137, 1,
1.114613, -0.2522823, 1.484496, 1, 0, 0.7803922, 1,
1.116826, -0.7586873, 2.542234, 1, 0, 0.772549, 1,
1.11845, 0.7940308, 1.653076, 1, 0, 0.7686275, 1,
1.119423, -1.129893, 3.212244, 1, 0, 0.7607843, 1,
1.132476, 0.04515231, 1.134374, 1, 0, 0.7568628, 1,
1.136144, -3.257314, 4.485078, 1, 0, 0.7490196, 1,
1.136262, 0.5098718, 2.587729, 1, 0, 0.7450981, 1,
1.138265, -0.8946495, 2.012549, 1, 0, 0.7372549, 1,
1.145324, -0.4826535, 2.619148, 1, 0, 0.7333333, 1,
1.149007, -1.820491, 3.945401, 1, 0, 0.7254902, 1,
1.150683, 0.6932991, 1.205541, 1, 0, 0.7215686, 1,
1.152214, 0.2944872, 0.08121576, 1, 0, 0.7137255, 1,
1.155471, 0.8583296, 2.546708, 1, 0, 0.7098039, 1,
1.166131, -2.786908, 1.032178, 1, 0, 0.7019608, 1,
1.180511, 0.7376083, 1.263008, 1, 0, 0.6941177, 1,
1.183722, 0.2897848, 2.14114, 1, 0, 0.6901961, 1,
1.18994, 0.8527674, -0.7206655, 1, 0, 0.682353, 1,
1.19948, -0.1897046, 0.859478, 1, 0, 0.6784314, 1,
1.200217, 0.9467868, 3.061352, 1, 0, 0.6705883, 1,
1.22168, -0.3646959, 2.267493, 1, 0, 0.6666667, 1,
1.228161, -0.6450972, 3.437764, 1, 0, 0.6588235, 1,
1.229606, -0.4980549, 1.468695, 1, 0, 0.654902, 1,
1.230814, 0.6080199, 1.967911, 1, 0, 0.6470588, 1,
1.234768, 1.123225, 0.8042223, 1, 0, 0.6431373, 1,
1.243274, 1.371498, 1.380906, 1, 0, 0.6352941, 1,
1.251136, 0.05796966, 0.9227775, 1, 0, 0.6313726, 1,
1.252733, -1.497408, 0.9975662, 1, 0, 0.6235294, 1,
1.260558, -0.209516, 2.056661, 1, 0, 0.6196079, 1,
1.26214, -0.4667993, 2.750454, 1, 0, 0.6117647, 1,
1.271535, 1.148602, 0.1495309, 1, 0, 0.6078432, 1,
1.273466, -1.195398, 2.930008, 1, 0, 0.6, 1,
1.273887, -0.3608137, 2.557985, 1, 0, 0.5921569, 1,
1.278042, -1.243531, 0.3264343, 1, 0, 0.5882353, 1,
1.28749, 0.6508499, 0.5883331, 1, 0, 0.5803922, 1,
1.291188, -1.732485, 3.000966, 1, 0, 0.5764706, 1,
1.293329, 0.413572, 1.502396, 1, 0, 0.5686275, 1,
1.294998, 0.1338593, 0.2090287, 1, 0, 0.5647059, 1,
1.308347, 0.743494, 0.5827848, 1, 0, 0.5568628, 1,
1.309462, -1.545232, 1.0107, 1, 0, 0.5529412, 1,
1.313963, 0.3774355, 1.889062, 1, 0, 0.5450981, 1,
1.31657, -1.80416, 1.669045, 1, 0, 0.5411765, 1,
1.327574, 1.906527, 1.567392, 1, 0, 0.5333334, 1,
1.334657, 1.027479, -1.400826, 1, 0, 0.5294118, 1,
1.339417, 0.1543251, 1.081745, 1, 0, 0.5215687, 1,
1.343582, -1.58436, 1.184929, 1, 0, 0.5176471, 1,
1.348476, -0.587042, 1.386827, 1, 0, 0.509804, 1,
1.351585, -0.08547955, 2.105323, 1, 0, 0.5058824, 1,
1.356269, 0.4847689, 0.9872639, 1, 0, 0.4980392, 1,
1.375589, -1.557585, 2.688757, 1, 0, 0.4901961, 1,
1.378169, 1.716372, 1.889752, 1, 0, 0.4862745, 1,
1.381593, -0.3113762, 0.6785242, 1, 0, 0.4784314, 1,
1.384765, 0.3743185, -0.2644195, 1, 0, 0.4745098, 1,
1.389947, -0.09590125, 1.069253, 1, 0, 0.4666667, 1,
1.399588, 1.572207, 1.618679, 1, 0, 0.4627451, 1,
1.400869, -1.155733, 2.352237, 1, 0, 0.454902, 1,
1.407098, 0.5413878, 0.1016568, 1, 0, 0.4509804, 1,
1.413998, 2.693209, -0.03460723, 1, 0, 0.4431373, 1,
1.417296, 0.3270869, 3.618459, 1, 0, 0.4392157, 1,
1.419182, 0.5597402, 0.3479432, 1, 0, 0.4313726, 1,
1.422515, -0.08151998, 2.438274, 1, 0, 0.427451, 1,
1.431981, -0.8674796, 1.579506, 1, 0, 0.4196078, 1,
1.43337, -0.6170163, 1.812459, 1, 0, 0.4156863, 1,
1.43655, -0.4172812, 2.968272, 1, 0, 0.4078431, 1,
1.441664, -1.415034, 2.104356, 1, 0, 0.4039216, 1,
1.462841, -1.252283, 1.989976, 1, 0, 0.3960784, 1,
1.471308, 0.02639507, 1.292206, 1, 0, 0.3882353, 1,
1.476352, 0.3940518, 0.2585315, 1, 0, 0.3843137, 1,
1.484547, -2.3846, 3.08501, 1, 0, 0.3764706, 1,
1.48917, 1.218726, 0.7853043, 1, 0, 0.372549, 1,
1.489321, -0.4731345, 3.536198, 1, 0, 0.3647059, 1,
1.496052, -0.3354309, 0.7115488, 1, 0, 0.3607843, 1,
1.503521, -0.2611406, 1.455546, 1, 0, 0.3529412, 1,
1.508372, -0.2776976, 1.933853, 1, 0, 0.3490196, 1,
1.511192, 1.326492, 0.5674841, 1, 0, 0.3411765, 1,
1.528219, -1.334696, 2.320167, 1, 0, 0.3372549, 1,
1.534358, -0.3987039, 0.3111158, 1, 0, 0.3294118, 1,
1.538931, 1.164104, -0.4163801, 1, 0, 0.3254902, 1,
1.541071, 1.122018, 1.409404, 1, 0, 0.3176471, 1,
1.571635, -0.8417317, 1.232806, 1, 0, 0.3137255, 1,
1.580227, 1.918405, -0.5539868, 1, 0, 0.3058824, 1,
1.585558, 0.2445205, 1.374009, 1, 0, 0.2980392, 1,
1.5982, 0.6544744, 1.424346, 1, 0, 0.2941177, 1,
1.631122, 0.3575672, 0.9215778, 1, 0, 0.2862745, 1,
1.63404, 0.7179624, 1.534266, 1, 0, 0.282353, 1,
1.64547, 0.6815577, 1.166379, 1, 0, 0.2745098, 1,
1.646342, 1.268433, 0.6997025, 1, 0, 0.2705882, 1,
1.647196, -0.378758, 2.784047, 1, 0, 0.2627451, 1,
1.651302, 0.7713245, 0.1705558, 1, 0, 0.2588235, 1,
1.654773, -0.3484804, 0.5867186, 1, 0, 0.2509804, 1,
1.660869, 2.69534, 0.6004754, 1, 0, 0.2470588, 1,
1.664684, -1.018648, 1.946799, 1, 0, 0.2392157, 1,
1.669263, 0.8028498, -0.8145664, 1, 0, 0.2352941, 1,
1.705692, 0.05718247, 3.843219, 1, 0, 0.227451, 1,
1.71942, 0.8498273, 2.563322, 1, 0, 0.2235294, 1,
1.719576, -2.570636, 2.708377, 1, 0, 0.2156863, 1,
1.723715, -0.6106176, 1.661721, 1, 0, 0.2117647, 1,
1.725384, 0.6080053, -0.915887, 1, 0, 0.2039216, 1,
1.747805, 0.02441938, 1.966934, 1, 0, 0.1960784, 1,
1.749817, 0.2342641, 1.330284, 1, 0, 0.1921569, 1,
1.761316, -0.8069078, 1.056426, 1, 0, 0.1843137, 1,
1.793874, 0.6966395, 0.1942817, 1, 0, 0.1803922, 1,
1.797531, 0.5783854, 1.986995, 1, 0, 0.172549, 1,
1.806799, 1.515776, 0.7713237, 1, 0, 0.1686275, 1,
1.825624, -0.2998481, 1.760548, 1, 0, 0.1607843, 1,
1.846192, 1.22994, 2.393129, 1, 0, 0.1568628, 1,
1.856623, -0.9104449, 4.118433, 1, 0, 0.1490196, 1,
1.860904, 0.2981174, 0.4803423, 1, 0, 0.145098, 1,
1.861688, 1.106897, 0.2806933, 1, 0, 0.1372549, 1,
1.887234, -1.1939, 1.47634, 1, 0, 0.1333333, 1,
1.890314, -0.07400709, 2.257464, 1, 0, 0.1254902, 1,
1.922198, -1.36058, 3.01859, 1, 0, 0.1215686, 1,
2.006602, 1.006516, -1.111997, 1, 0, 0.1137255, 1,
2.015226, -0.7143258, 0.6843362, 1, 0, 0.1098039, 1,
2.028031, -1.80422, 3.029504, 1, 0, 0.1019608, 1,
2.050332, -1.663311, 2.790493, 1, 0, 0.09411765, 1,
2.070196, 0.3967282, 2.166318, 1, 0, 0.09019608, 1,
2.278068, 0.3273651, 0.8158006, 1, 0, 0.08235294, 1,
2.285205, -0.6498582, 0.7961468, 1, 0, 0.07843138, 1,
2.38376, -0.1113208, 1.812158, 1, 0, 0.07058824, 1,
2.436894, 1.083918, 0.6884683, 1, 0, 0.06666667, 1,
2.46937, -0.04769742, 2.252733, 1, 0, 0.05882353, 1,
2.537312, 1.81482, 0.9486851, 1, 0, 0.05490196, 1,
2.541003, 0.5479681, 2.2145, 1, 0, 0.04705882, 1,
2.547814, 0.6582519, 2.739874, 1, 0, 0.04313726, 1,
2.642062, -1.023981, 5.27427, 1, 0, 0.03529412, 1,
2.660769, -0.182443, 1.189543, 1, 0, 0.03137255, 1,
2.666461, 0.04886102, 1.087775, 1, 0, 0.02352941, 1,
2.914581, 0.7966379, 2.009051, 1, 0, 0.01960784, 1,
3.20077, 1.016225, 2.88899, 1, 0, 0.01176471, 1,
3.59844, 0.624501, 2.948222, 1, 0, 0.007843138, 1
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
0.3524206, -5.027637, -7.871794, 0, -0.5, 0.5, 0.5,
0.3524206, -5.027637, -7.871794, 1, -0.5, 0.5, 0.5,
0.3524206, -5.027637, -7.871794, 1, 1.5, 0.5, 0.5,
0.3524206, -5.027637, -7.871794, 0, 1.5, 0.5, 0.5
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
-3.993999, -0.5329125, -7.871794, 0, -0.5, 0.5, 0.5,
-3.993999, -0.5329125, -7.871794, 1, -0.5, 0.5, 0.5,
-3.993999, -0.5329125, -7.871794, 1, 1.5, 0.5, 0.5,
-3.993999, -0.5329125, -7.871794, 0, 1.5, 0.5, 0.5
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
-3.993999, -5.027637, 0.008456945, 0, -0.5, 0.5, 0.5,
-3.993999, -5.027637, 0.008456945, 1, -0.5, 0.5, 0.5,
-3.993999, -5.027637, 0.008456945, 1, 1.5, 0.5, 0.5,
-3.993999, -5.027637, 0.008456945, 0, 1.5, 0.5, 0.5
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
-2, -3.990393, -6.053275,
3, -3.990393, -6.053275,
-2, -3.990393, -6.053275,
-2, -4.163267, -6.356361,
-1, -3.990393, -6.053275,
-1, -4.163267, -6.356361,
0, -3.990393, -6.053275,
0, -4.163267, -6.356361,
1, -3.990393, -6.053275,
1, -4.163267, -6.356361,
2, -3.990393, -6.053275,
2, -4.163267, -6.356361,
3, -3.990393, -6.053275,
3, -4.163267, -6.356361
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
-2, -4.509015, -6.962534, 0, -0.5, 0.5, 0.5,
-2, -4.509015, -6.962534, 1, -0.5, 0.5, 0.5,
-2, -4.509015, -6.962534, 1, 1.5, 0.5, 0.5,
-2, -4.509015, -6.962534, 0, 1.5, 0.5, 0.5,
-1, -4.509015, -6.962534, 0, -0.5, 0.5, 0.5,
-1, -4.509015, -6.962534, 1, -0.5, 0.5, 0.5,
-1, -4.509015, -6.962534, 1, 1.5, 0.5, 0.5,
-1, -4.509015, -6.962534, 0, 1.5, 0.5, 0.5,
0, -4.509015, -6.962534, 0, -0.5, 0.5, 0.5,
0, -4.509015, -6.962534, 1, -0.5, 0.5, 0.5,
0, -4.509015, -6.962534, 1, 1.5, 0.5, 0.5,
0, -4.509015, -6.962534, 0, 1.5, 0.5, 0.5,
1, -4.509015, -6.962534, 0, -0.5, 0.5, 0.5,
1, -4.509015, -6.962534, 1, -0.5, 0.5, 0.5,
1, -4.509015, -6.962534, 1, 1.5, 0.5, 0.5,
1, -4.509015, -6.962534, 0, 1.5, 0.5, 0.5,
2, -4.509015, -6.962534, 0, -0.5, 0.5, 0.5,
2, -4.509015, -6.962534, 1, -0.5, 0.5, 0.5,
2, -4.509015, -6.962534, 1, 1.5, 0.5, 0.5,
2, -4.509015, -6.962534, 0, 1.5, 0.5, 0.5,
3, -4.509015, -6.962534, 0, -0.5, 0.5, 0.5,
3, -4.509015, -6.962534, 1, -0.5, 0.5, 0.5,
3, -4.509015, -6.962534, 1, 1.5, 0.5, 0.5,
3, -4.509015, -6.962534, 0, 1.5, 0.5, 0.5
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
-2.990979, -3, -6.053275,
-2.990979, 2, -6.053275,
-2.990979, -3, -6.053275,
-3.158149, -3, -6.356361,
-2.990979, -2, -6.053275,
-3.158149, -2, -6.356361,
-2.990979, -1, -6.053275,
-3.158149, -1, -6.356361,
-2.990979, 0, -6.053275,
-3.158149, 0, -6.356361,
-2.990979, 1, -6.053275,
-3.158149, 1, -6.356361,
-2.990979, 2, -6.053275,
-3.158149, 2, -6.356361
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
-3.492489, -3, -6.962534, 0, -0.5, 0.5, 0.5,
-3.492489, -3, -6.962534, 1, -0.5, 0.5, 0.5,
-3.492489, -3, -6.962534, 1, 1.5, 0.5, 0.5,
-3.492489, -3, -6.962534, 0, 1.5, 0.5, 0.5,
-3.492489, -2, -6.962534, 0, -0.5, 0.5, 0.5,
-3.492489, -2, -6.962534, 1, -0.5, 0.5, 0.5,
-3.492489, -2, -6.962534, 1, 1.5, 0.5, 0.5,
-3.492489, -2, -6.962534, 0, 1.5, 0.5, 0.5,
-3.492489, -1, -6.962534, 0, -0.5, 0.5, 0.5,
-3.492489, -1, -6.962534, 1, -0.5, 0.5, 0.5,
-3.492489, -1, -6.962534, 1, 1.5, 0.5, 0.5,
-3.492489, -1, -6.962534, 0, 1.5, 0.5, 0.5,
-3.492489, 0, -6.962534, 0, -0.5, 0.5, 0.5,
-3.492489, 0, -6.962534, 1, -0.5, 0.5, 0.5,
-3.492489, 0, -6.962534, 1, 1.5, 0.5, 0.5,
-3.492489, 0, -6.962534, 0, 1.5, 0.5, 0.5,
-3.492489, 1, -6.962534, 0, -0.5, 0.5, 0.5,
-3.492489, 1, -6.962534, 1, -0.5, 0.5, 0.5,
-3.492489, 1, -6.962534, 1, 1.5, 0.5, 0.5,
-3.492489, 1, -6.962534, 0, 1.5, 0.5, 0.5,
-3.492489, 2, -6.962534, 0, -0.5, 0.5, 0.5,
-3.492489, 2, -6.962534, 1, -0.5, 0.5, 0.5,
-3.492489, 2, -6.962534, 1, 1.5, 0.5, 0.5,
-3.492489, 2, -6.962534, 0, 1.5, 0.5, 0.5
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
-2.990979, -3.990393, -4,
-2.990979, -3.990393, 4,
-2.990979, -3.990393, -4,
-3.158149, -4.163267, -4,
-2.990979, -3.990393, -2,
-3.158149, -4.163267, -2,
-2.990979, -3.990393, 0,
-3.158149, -4.163267, 0,
-2.990979, -3.990393, 2,
-3.158149, -4.163267, 2,
-2.990979, -3.990393, 4,
-3.158149, -4.163267, 4
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
-3.492489, -4.509015, -4, 0, -0.5, 0.5, 0.5,
-3.492489, -4.509015, -4, 1, -0.5, 0.5, 0.5,
-3.492489, -4.509015, -4, 1, 1.5, 0.5, 0.5,
-3.492489, -4.509015, -4, 0, 1.5, 0.5, 0.5,
-3.492489, -4.509015, -2, 0, -0.5, 0.5, 0.5,
-3.492489, -4.509015, -2, 1, -0.5, 0.5, 0.5,
-3.492489, -4.509015, -2, 1, 1.5, 0.5, 0.5,
-3.492489, -4.509015, -2, 0, 1.5, 0.5, 0.5,
-3.492489, -4.509015, 0, 0, -0.5, 0.5, 0.5,
-3.492489, -4.509015, 0, 1, -0.5, 0.5, 0.5,
-3.492489, -4.509015, 0, 1, 1.5, 0.5, 0.5,
-3.492489, -4.509015, 0, 0, 1.5, 0.5, 0.5,
-3.492489, -4.509015, 2, 0, -0.5, 0.5, 0.5,
-3.492489, -4.509015, 2, 1, -0.5, 0.5, 0.5,
-3.492489, -4.509015, 2, 1, 1.5, 0.5, 0.5,
-3.492489, -4.509015, 2, 0, 1.5, 0.5, 0.5,
-3.492489, -4.509015, 4, 0, -0.5, 0.5, 0.5,
-3.492489, -4.509015, 4, 1, -0.5, 0.5, 0.5,
-3.492489, -4.509015, 4, 1, 1.5, 0.5, 0.5,
-3.492489, -4.509015, 4, 0, 1.5, 0.5, 0.5
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
-2.990979, -3.990393, -6.053275,
-2.990979, 2.924568, -6.053275,
-2.990979, -3.990393, 6.070189,
-2.990979, 2.924568, 6.070189,
-2.990979, -3.990393, -6.053275,
-2.990979, -3.990393, 6.070189,
-2.990979, 2.924568, -6.053275,
-2.990979, 2.924568, 6.070189,
-2.990979, -3.990393, -6.053275,
3.695821, -3.990393, -6.053275,
-2.990979, -3.990393, 6.070189,
3.695821, -3.990393, 6.070189,
-2.990979, 2.924568, -6.053275,
3.695821, 2.924568, -6.053275,
-2.990979, 2.924568, 6.070189,
3.695821, 2.924568, 6.070189,
3.695821, -3.990393, -6.053275,
3.695821, 2.924568, -6.053275,
3.695821, -3.990393, 6.070189,
3.695821, 2.924568, 6.070189,
3.695821, -3.990393, -6.053275,
3.695821, -3.990393, 6.070189,
3.695821, 2.924568, -6.053275,
3.695821, 2.924568, 6.070189
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
var radius = 8.263914;
var distance = 36.76709;
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
mvMatrix.translate( -0.3524206, 0.5329125, -0.008456945 );
mvMatrix.scale( 1.336231, 1.292141, 0.7370093 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.76709);
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
thiocarbamate<-read.table("thiocarbamate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiocarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiocarbamate' not found
```

```r
y<-thiocarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiocarbamate' not found
```

```r
z<-thiocarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiocarbamate' not found
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
-2.893599, -2.61781, -2.423833, 0, 0, 1, 1, 1,
-2.86576, -1.089369, -1.348709, 1, 0, 0, 1, 1,
-2.664804, -0.3517787, -1.109198, 1, 0, 0, 1, 1,
-2.606805, -1.261242, -4.016104, 1, 0, 0, 1, 1,
-2.552942, -0.5510892, -2.75315, 1, 0, 0, 1, 1,
-2.465665, 0.9869157, -1.294127, 1, 0, 0, 1, 1,
-2.439563, 0.3368572, -0.5535606, 0, 0, 0, 1, 1,
-2.351324, 1.210327, -2.529772, 0, 0, 0, 1, 1,
-2.341091, -0.1765355, -4.064928, 0, 0, 0, 1, 1,
-2.337883, -1.649934, -1.921042, 0, 0, 0, 1, 1,
-2.337013, -0.01531538, -0.3871372, 0, 0, 0, 1, 1,
-2.240852, -0.7933758, -1.816576, 0, 0, 0, 1, 1,
-2.21165, 1.768659, -2.172815, 0, 0, 0, 1, 1,
-2.207963, -0.04784354, -1.563285, 1, 1, 1, 1, 1,
-2.16903, 1.76889, -0.8048071, 1, 1, 1, 1, 1,
-2.064933, -0.2801856, -2.487675, 1, 1, 1, 1, 1,
-2.05473, 0.4041918, -2.055763, 1, 1, 1, 1, 1,
-2.01849, 0.5935727, -0.8849669, 1, 1, 1, 1, 1,
-2.018156, 0.5103844, -1.403205, 1, 1, 1, 1, 1,
-2.01404, -0.5975763, -2.795719, 1, 1, 1, 1, 1,
-2.013505, -0.8265366, -2.080411, 1, 1, 1, 1, 1,
-1.978376, 0.9927636, -1.600163, 1, 1, 1, 1, 1,
-1.938549, 1.114958, -0.4389445, 1, 1, 1, 1, 1,
-1.937743, -1.002534, -1.9598, 1, 1, 1, 1, 1,
-1.927197, 2.107692, -1.739016, 1, 1, 1, 1, 1,
-1.909991, -0.00071774, 1.724904, 1, 1, 1, 1, 1,
-1.903728, -1.133653, -2.54546, 1, 1, 1, 1, 1,
-1.903121, -0.08137525, -1.699145, 1, 1, 1, 1, 1,
-1.889853, -2.553946, -2.998245, 0, 0, 1, 1, 1,
-1.885337, 0.4094065, 0.4441311, 1, 0, 0, 1, 1,
-1.848226, 0.3803248, -2.066497, 1, 0, 0, 1, 1,
-1.838209, 0.3504485, -3.15911, 1, 0, 0, 1, 1,
-1.837357, -1.488953, -1.637292, 1, 0, 0, 1, 1,
-1.829128, 0.6210743, 0.640552, 1, 0, 0, 1, 1,
-1.824298, 2.154958, 0.0422918, 0, 0, 0, 1, 1,
-1.81068, 0.05552832, -1.873739, 0, 0, 0, 1, 1,
-1.808416, 1.443668, -0.8890074, 0, 0, 0, 1, 1,
-1.779251, -0.02847117, -2.089797, 0, 0, 0, 1, 1,
-1.776451, -1.393902, -1.614595, 0, 0, 0, 1, 1,
-1.776137, 0.08744267, -1.619988, 0, 0, 0, 1, 1,
-1.763098, 1.502212, -2.096058, 0, 0, 0, 1, 1,
-1.737933, -0.406209, -2.835706, 1, 1, 1, 1, 1,
-1.736429, 0.3577542, -0.9381552, 1, 1, 1, 1, 1,
-1.724861, 0.04765992, 0.02466197, 1, 1, 1, 1, 1,
-1.718634, -0.1137183, -0.750218, 1, 1, 1, 1, 1,
-1.715663, -0.1924761, -2.261781, 1, 1, 1, 1, 1,
-1.705589, -1.89937, -1.224538, 1, 1, 1, 1, 1,
-1.69114, -1.210602, -2.960864, 1, 1, 1, 1, 1,
-1.687793, -1.403822, -1.060485, 1, 1, 1, 1, 1,
-1.655475, -1.241027, -1.831349, 1, 1, 1, 1, 1,
-1.654127, -0.1048317, 0.1866239, 1, 1, 1, 1, 1,
-1.64202, 0.9973165, -1.263746, 1, 1, 1, 1, 1,
-1.619202, -0.7803625, -0.954487, 1, 1, 1, 1, 1,
-1.618358, -0.2948083, -3.942128, 1, 1, 1, 1, 1,
-1.615521, 0.4529651, -2.365279, 1, 1, 1, 1, 1,
-1.60235, 0.7583973, -0.5509608, 1, 1, 1, 1, 1,
-1.579602, -0.01392468, -0.3060123, 0, 0, 1, 1, 1,
-1.570976, 0.540235, -0.02913159, 1, 0, 0, 1, 1,
-1.563691, 0.8345263, 0.6321471, 1, 0, 0, 1, 1,
-1.562268, -0.06406011, -0.5356787, 1, 0, 0, 1, 1,
-1.561584, -0.2148389, -1.495458, 1, 0, 0, 1, 1,
-1.559992, -1.012683, -4.319388, 1, 0, 0, 1, 1,
-1.552557, 1.053438, -1.211704, 0, 0, 0, 1, 1,
-1.540716, -1.909202, -1.897363, 0, 0, 0, 1, 1,
-1.533028, 0.3933592, -0.277894, 0, 0, 0, 1, 1,
-1.531688, 0.5898004, -1.007166, 0, 0, 0, 1, 1,
-1.515378, 1.107292, -1.115067, 0, 0, 0, 1, 1,
-1.502279, 0.2793283, -1.779074, 0, 0, 0, 1, 1,
-1.499189, -0.1257357, -3.582414, 0, 0, 0, 1, 1,
-1.485932, -0.2578479, -0.2782393, 1, 1, 1, 1, 1,
-1.476773, 1.306499, 0.1399991, 1, 1, 1, 1, 1,
-1.472939, -1.858209, -5.24671, 1, 1, 1, 1, 1,
-1.463693, 0.07472894, -0.4543283, 1, 1, 1, 1, 1,
-1.4594, 0.6474382, -1.384584, 1, 1, 1, 1, 1,
-1.453395, 0.143309, -1.803481, 1, 1, 1, 1, 1,
-1.449238, 1.031212, -1.334481, 1, 1, 1, 1, 1,
-1.443648, -0.3446938, -1.786435, 1, 1, 1, 1, 1,
-1.43781, -0.1851128, -1.326781, 1, 1, 1, 1, 1,
-1.426542, -1.003529, -3.087382, 1, 1, 1, 1, 1,
-1.403079, 0.2675805, -1.282319, 1, 1, 1, 1, 1,
-1.401982, -0.7482397, -0.9914066, 1, 1, 1, 1, 1,
-1.399483, -0.7419733, -2.024383, 1, 1, 1, 1, 1,
-1.397728, 0.7272357, -2.171945, 1, 1, 1, 1, 1,
-1.390897, 1.406674, -1.671376, 1, 1, 1, 1, 1,
-1.387468, -0.370182, -3.205776, 0, 0, 1, 1, 1,
-1.383282, 0.8104455, 0.9145332, 1, 0, 0, 1, 1,
-1.383049, 2.308997, 0.00307293, 1, 0, 0, 1, 1,
-1.36955, 0.06611218, 0.1829161, 1, 0, 0, 1, 1,
-1.367143, 0.00437623, -1.877902, 1, 0, 0, 1, 1,
-1.355041, -2.650633, -3.030365, 1, 0, 0, 1, 1,
-1.344258, -0.7372059, -1.868363, 0, 0, 0, 1, 1,
-1.341681, -0.7991731, -1.532848, 0, 0, 0, 1, 1,
-1.333291, 0.2709479, -3.232102, 0, 0, 0, 1, 1,
-1.332564, -0.8216119, 0.4698954, 0, 0, 0, 1, 1,
-1.325323, -0.6442513, -1.763705, 0, 0, 0, 1, 1,
-1.322599, -0.3279376, -0.8007292, 0, 0, 0, 1, 1,
-1.321054, 1.658278, -0.8735959, 0, 0, 0, 1, 1,
-1.311375, 1.433976, -2.409231, 1, 1, 1, 1, 1,
-1.302985, -0.5988062, -0.5243475, 1, 1, 1, 1, 1,
-1.300838, 1.409662, -0.1203943, 1, 1, 1, 1, 1,
-1.299303, 2.500901, -1.28104, 1, 1, 1, 1, 1,
-1.294089, 0.1496594, -1.835627, 1, 1, 1, 1, 1,
-1.276154, -1.855553, -1.233332, 1, 1, 1, 1, 1,
-1.2722, -0.07777094, -0.8187142, 1, 1, 1, 1, 1,
-1.266983, 0.3757538, -1.339123, 1, 1, 1, 1, 1,
-1.254629, 0.9532619, -0.982265, 1, 1, 1, 1, 1,
-1.245667, -1.789161, -0.8789102, 1, 1, 1, 1, 1,
-1.239907, 1.553011, 1.350709, 1, 1, 1, 1, 1,
-1.237037, -0.8304888, -1.603075, 1, 1, 1, 1, 1,
-1.235142, -1.071423, -3.18649, 1, 1, 1, 1, 1,
-1.229258, 0.8274985, -1.845157, 1, 1, 1, 1, 1,
-1.221566, -0.6653608, -1.37758, 1, 1, 1, 1, 1,
-1.218199, -0.9454407, -1.437573, 0, 0, 1, 1, 1,
-1.213944, 0.6666549, -1.131723, 1, 0, 0, 1, 1,
-1.21119, 1.608502, -0.6837963, 1, 0, 0, 1, 1,
-1.206342, -1.957349, -4.300344, 1, 0, 0, 1, 1,
-1.205651, -1.613699, -2.329574, 1, 0, 0, 1, 1,
-1.203417, -1.195589, -1.845748, 1, 0, 0, 1, 1,
-1.202696, -0.1489626, -0.9180062, 0, 0, 0, 1, 1,
-1.201713, 0.2314734, -1.647794, 0, 0, 0, 1, 1,
-1.186429, -1.091446, -2.023735, 0, 0, 0, 1, 1,
-1.178163, -0.2468798, -1.721407, 0, 0, 0, 1, 1,
-1.171982, 1.465555, -0.2416132, 0, 0, 0, 1, 1,
-1.167014, 0.4767703, -0.3646981, 0, 0, 0, 1, 1,
-1.166743, 0.667492, -1.423918, 0, 0, 0, 1, 1,
-1.16454, -0.25122, -2.179695, 1, 1, 1, 1, 1,
-1.157666, 0.8692709, -1.402777, 1, 1, 1, 1, 1,
-1.156692, 0.9468994, -2.143074, 1, 1, 1, 1, 1,
-1.15528, -0.3749586, -1.554452, 1, 1, 1, 1, 1,
-1.150253, -0.4970381, -1.235678, 1, 1, 1, 1, 1,
-1.142548, 0.01307875, -2.179891, 1, 1, 1, 1, 1,
-1.137981, 0.3888322, -0.4834054, 1, 1, 1, 1, 1,
-1.136813, 0.9583439, -1.451346, 1, 1, 1, 1, 1,
-1.122662, 0.868252, 1.101689, 1, 1, 1, 1, 1,
-1.118975, 0.3998678, -2.357443, 1, 1, 1, 1, 1,
-1.118887, 1.394969, -0.09765582, 1, 1, 1, 1, 1,
-1.116412, 0.03392402, -1.492762, 1, 1, 1, 1, 1,
-1.115277, 0.9797968, -1.938693, 1, 1, 1, 1, 1,
-1.108723, 0.6576619, -0.415218, 1, 1, 1, 1, 1,
-1.108595, -0.1792362, -1.716288, 1, 1, 1, 1, 1,
-1.106022, 2.260478, 0.4575522, 0, 0, 1, 1, 1,
-1.099253, -0.06090727, -1.039892, 1, 0, 0, 1, 1,
-1.094865, 1.002275, 0.5165176, 1, 0, 0, 1, 1,
-1.090404, 0.1593022, -1.147028, 1, 0, 0, 1, 1,
-1.080396, -1.720356, -4.96511, 1, 0, 0, 1, 1,
-1.073344, -0.8764048, -2.282889, 1, 0, 0, 1, 1,
-1.071882, -0.9829775, -3.475693, 0, 0, 0, 1, 1,
-1.068104, 0.8492447, -1.236435, 0, 0, 0, 1, 1,
-1.062395, -0.5279844, -2.719729, 0, 0, 0, 1, 1,
-1.061446, -0.7302436, -1.141323, 0, 0, 0, 1, 1,
-1.053386, 0.5728456, 0.3072959, 0, 0, 0, 1, 1,
-1.051173, -1.348462, -1.948701, 0, 0, 0, 1, 1,
-1.04996, -0.05765542, 0.0412061, 0, 0, 0, 1, 1,
-1.045634, 0.8835465, 0.03044024, 1, 1, 1, 1, 1,
-1.039888, -0.3229457, -3.555391, 1, 1, 1, 1, 1,
-1.034506, 1.009657, 0.1047672, 1, 1, 1, 1, 1,
-1.028877, -1.021494, -1.637988, 1, 1, 1, 1, 1,
-1.026144, -0.1374947, -1.912809, 1, 1, 1, 1, 1,
-1.023711, 2.368249, 0.967133, 1, 1, 1, 1, 1,
-1.017361, -0.645348, -3.039151, 1, 1, 1, 1, 1,
-1.000458, -0.488805, -2.210864, 1, 1, 1, 1, 1,
-0.9974541, -0.7966548, -2.242239, 1, 1, 1, 1, 1,
-0.9869946, 0.7731807, -2.193259, 1, 1, 1, 1, 1,
-0.986588, -1.34009, -2.026099, 1, 1, 1, 1, 1,
-0.9864642, 2.641515, -2.177717, 1, 1, 1, 1, 1,
-0.9824694, -0.2968987, -3.639966, 1, 1, 1, 1, 1,
-0.9808233, -0.2634798, -3.450633, 1, 1, 1, 1, 1,
-0.9787916, -0.4252912, -1.070257, 1, 1, 1, 1, 1,
-0.9743172, 0.9921368, 0.7003995, 0, 0, 1, 1, 1,
-0.9695598, 0.3092804, -0.277103, 1, 0, 0, 1, 1,
-0.9681914, -0.370978, -1.529627, 1, 0, 0, 1, 1,
-0.9610098, 0.8295164, -1.65408, 1, 0, 0, 1, 1,
-0.960682, 1.034876, -2.16752, 1, 0, 0, 1, 1,
-0.9555451, -0.4306793, -0.4764658, 1, 0, 0, 1, 1,
-0.952113, 1.465701, -0.2912566, 0, 0, 0, 1, 1,
-0.9464288, 0.4875919, -0.06052985, 0, 0, 0, 1, 1,
-0.9459506, -0.4667479, -1.649909, 0, 0, 0, 1, 1,
-0.9448167, -1.544722, -1.762238, 0, 0, 0, 1, 1,
-0.9437293, -0.5866206, -1.848474, 0, 0, 0, 1, 1,
-0.943714, 0.1598598, -1.42183, 0, 0, 0, 1, 1,
-0.942053, 0.7364756, -0.5612825, 0, 0, 0, 1, 1,
-0.9272821, 0.2636888, -1.38726, 1, 1, 1, 1, 1,
-0.9212915, 2.823865, 0.4020793, 1, 1, 1, 1, 1,
-0.9186056, 0.1184562, -0.1439757, 1, 1, 1, 1, 1,
-0.9167617, -0.3448162, -2.929203, 1, 1, 1, 1, 1,
-0.9144605, -1.212616, -1.757321, 1, 1, 1, 1, 1,
-0.9135032, -1.263438, -2.660966, 1, 1, 1, 1, 1,
-0.8975199, -0.9314638, -2.160568, 1, 1, 1, 1, 1,
-0.8957907, 0.4960726, -1.097726, 1, 1, 1, 1, 1,
-0.8922347, 0.5418908, -2.411871, 1, 1, 1, 1, 1,
-0.8896358, -0.01485677, -2.455602, 1, 1, 1, 1, 1,
-0.8840705, -0.6173493, -2.83889, 1, 1, 1, 1, 1,
-0.880397, -0.3722397, -4.306779, 1, 1, 1, 1, 1,
-0.8776505, 1.24519, 0.2713264, 1, 1, 1, 1, 1,
-0.872606, 0.5418068, 0.3344473, 1, 1, 1, 1, 1,
-0.8695877, -0.1431198, -0.8080063, 1, 1, 1, 1, 1,
-0.8677839, 0.1545091, -0.5140972, 0, 0, 1, 1, 1,
-0.8663786, 1.502344, 0.6894233, 1, 0, 0, 1, 1,
-0.8659518, -1.230868, -3.123593, 1, 0, 0, 1, 1,
-0.8658814, -1.466431, -1.5642, 1, 0, 0, 1, 1,
-0.86535, -1.054815, -4.163846, 1, 0, 0, 1, 1,
-0.8630608, -0.3990141, -2.11457, 1, 0, 0, 1, 1,
-0.8623756, 0.9397527, 0.9355087, 0, 0, 0, 1, 1,
-0.852196, -0.4814811, -1.942094, 0, 0, 0, 1, 1,
-0.8487881, 1.023014, -0.6958669, 0, 0, 0, 1, 1,
-0.8458139, -1.227052, -3.850268, 0, 0, 0, 1, 1,
-0.8393175, -1.126364, -2.665642, 0, 0, 0, 1, 1,
-0.8391798, -0.5860357, -1.072999, 0, 0, 0, 1, 1,
-0.8391545, 0.07902591, -1.291888, 0, 0, 0, 1, 1,
-0.8325446, -0.3801543, -1.021231, 1, 1, 1, 1, 1,
-0.8267455, 0.6622398, -0.4850602, 1, 1, 1, 1, 1,
-0.8255601, -0.2766008, -2.412798, 1, 1, 1, 1, 1,
-0.8216307, -1.412946, -3.658564, 1, 1, 1, 1, 1,
-0.8099942, -0.6971487, -2.808988, 1, 1, 1, 1, 1,
-0.8013629, -3.88969, -4.585014, 1, 1, 1, 1, 1,
-0.7991075, 1.004452, -1.510936, 1, 1, 1, 1, 1,
-0.7985687, -0.8413176, -2.988794, 1, 1, 1, 1, 1,
-0.7926869, -0.3549235, -1.923264, 1, 1, 1, 1, 1,
-0.7926412, -0.117023, -1.84077, 1, 1, 1, 1, 1,
-0.7923602, -0.4857756, -1.081703, 1, 1, 1, 1, 1,
-0.7868328, 0.7331462, -0.1993927, 1, 1, 1, 1, 1,
-0.7851177, 2.149001, -0.003896003, 1, 1, 1, 1, 1,
-0.7801668, 0.592169, 0.1170111, 1, 1, 1, 1, 1,
-0.7787182, -0.4761018, -1.279463, 1, 1, 1, 1, 1,
-0.7690875, -0.2654447, -1.646629, 0, 0, 1, 1, 1,
-0.7660004, -0.146678, -3.231826, 1, 0, 0, 1, 1,
-0.7655032, 0.06454372, -2.029476, 1, 0, 0, 1, 1,
-0.765224, -0.4865946, -1.577703, 1, 0, 0, 1, 1,
-0.7635804, -0.9490288, -2.333953, 1, 0, 0, 1, 1,
-0.756831, -0.4566101, -3.101432, 1, 0, 0, 1, 1,
-0.7564124, -0.2443587, -2.753004, 0, 0, 0, 1, 1,
-0.7496292, -0.02917728, -1.856382, 0, 0, 0, 1, 1,
-0.7421321, 1.876678, -0.6521401, 0, 0, 0, 1, 1,
-0.7407923, 0.7126845, 0.8157483, 0, 0, 0, 1, 1,
-0.737327, 1.14021, -0.449859, 0, 0, 0, 1, 1,
-0.7283716, -0.1114959, -2.52462, 0, 0, 0, 1, 1,
-0.7257982, -0.8014985, -2.962528, 0, 0, 0, 1, 1,
-0.7183136, -0.7639052, -3.051144, 1, 1, 1, 1, 1,
-0.7154959, 0.1846581, 0.3981153, 1, 1, 1, 1, 1,
-0.7145531, -1.101789, -1.536312, 1, 1, 1, 1, 1,
-0.713392, 0.3002615, -1.935012, 1, 1, 1, 1, 1,
-0.7133699, -0.1195783, -1.522134, 1, 1, 1, 1, 1,
-0.7093664, -0.09633604, -1.957746, 1, 1, 1, 1, 1,
-0.7024546, -0.1384937, -2.349018, 1, 1, 1, 1, 1,
-0.6968293, -0.8950446, -2.843462, 1, 1, 1, 1, 1,
-0.6954148, -0.3418307, -1.011062, 1, 1, 1, 1, 1,
-0.6870797, 1.785859, -0.2314692, 1, 1, 1, 1, 1,
-0.6811936, 1.35048, -0.4745541, 1, 1, 1, 1, 1,
-0.6806595, -0.7579777, -2.049037, 1, 1, 1, 1, 1,
-0.6795079, -0.3816921, -1.923834, 1, 1, 1, 1, 1,
-0.6794721, -0.1374468, -0.889811, 1, 1, 1, 1, 1,
-0.6792252, 1.98822, 0.8680598, 1, 1, 1, 1, 1,
-0.6768683, 0.6344922, -1.037369, 0, 0, 1, 1, 1,
-0.6693056, -0.9420761, -2.85393, 1, 0, 0, 1, 1,
-0.6680818, -0.5031967, -1.452086, 1, 0, 0, 1, 1,
-0.6620619, 0.01106335, -0.9369112, 1, 0, 0, 1, 1,
-0.6605313, -1.108572, -2.477664, 1, 0, 0, 1, 1,
-0.6595376, 0.9829492, 0.2702917, 1, 0, 0, 1, 1,
-0.6527483, -0.2978069, -4.320404, 0, 0, 0, 1, 1,
-0.6496522, -0.2497066, -2.238649, 0, 0, 0, 1, 1,
-0.6468139, 0.04911884, -1.314701, 0, 0, 0, 1, 1,
-0.6439674, 1.056922, -1.198768, 0, 0, 0, 1, 1,
-0.6401312, 1.506321, 0.41822, 0, 0, 0, 1, 1,
-0.6289607, -0.2623776, -1.212154, 0, 0, 0, 1, 1,
-0.6265575, -0.1709524, -1.834822, 0, 0, 0, 1, 1,
-0.6248333, -0.3295724, -2.328309, 1, 1, 1, 1, 1,
-0.6204846, -1.630632, -4.269817, 1, 1, 1, 1, 1,
-0.6153778, 0.8771481, -0.5454621, 1, 1, 1, 1, 1,
-0.6073579, 0.05187356, -0.5422885, 1, 1, 1, 1, 1,
-0.6047323, 1.377552, -0.06803846, 1, 1, 1, 1, 1,
-0.6030585, 0.3565616, -2.374576, 1, 1, 1, 1, 1,
-0.5945316, -0.01323577, -1.150992, 1, 1, 1, 1, 1,
-0.5869505, -1.371162, -4.782362, 1, 1, 1, 1, 1,
-0.5852952, 1.140461, -0.8411696, 1, 1, 1, 1, 1,
-0.5836706, -1.691111, -2.185441, 1, 1, 1, 1, 1,
-0.5748618, -0.5763332, -2.02952, 1, 1, 1, 1, 1,
-0.5735899, 0.7550961, -1.348845, 1, 1, 1, 1, 1,
-0.5715721, 0.4691881, -1.027423, 1, 1, 1, 1, 1,
-0.5653594, 0.7178644, -2.38804, 1, 1, 1, 1, 1,
-0.5611821, 0.2320023, -1.71112, 1, 1, 1, 1, 1,
-0.5567781, -1.238834, -1.034042, 0, 0, 1, 1, 1,
-0.5564016, 0.1464544, -1.976535, 1, 0, 0, 1, 1,
-0.5529583, 2.341, -1.004637, 1, 0, 0, 1, 1,
-0.5512341, -1.314448, -1.50803, 1, 0, 0, 1, 1,
-0.5443519, -1.483717, -3.688335, 1, 0, 0, 1, 1,
-0.5425578, 1.238267, -1.415275, 1, 0, 0, 1, 1,
-0.5417616, -0.175953, -2.568806, 0, 0, 0, 1, 1,
-0.5417, -2.57819, -3.015893, 0, 0, 0, 1, 1,
-0.5383404, 0.08325654, -2.048418, 0, 0, 0, 1, 1,
-0.530172, 0.2273884, -2.123236, 0, 0, 0, 1, 1,
-0.5189078, -0.7779908, -2.320452, 0, 0, 0, 1, 1,
-0.5140445, -1.030706, -2.120059, 0, 0, 0, 1, 1,
-0.5133439, 1.711438, -0.07897451, 0, 0, 0, 1, 1,
-0.5097352, 0.01873024, -1.210231, 1, 1, 1, 1, 1,
-0.505586, -0.606167, -2.58388, 1, 1, 1, 1, 1,
-0.5038897, 0.1242132, -1.925829, 1, 1, 1, 1, 1,
-0.5029817, 0.3275188, -1.140081, 1, 1, 1, 1, 1,
-0.502183, -0.2115429, -2.611806, 1, 1, 1, 1, 1,
-0.4952764, -0.3661388, -1.104242, 1, 1, 1, 1, 1,
-0.4946838, -0.05982498, -1.334306, 1, 1, 1, 1, 1,
-0.4917833, 1.095403, 0.6053179, 1, 1, 1, 1, 1,
-0.4875871, -0.515215, -2.350654, 1, 1, 1, 1, 1,
-0.486308, -1.163431, -3.056023, 1, 1, 1, 1, 1,
-0.4816928, -0.01822896, -2.796973, 1, 1, 1, 1, 1,
-0.4762664, 0.5475581, 0.2239235, 1, 1, 1, 1, 1,
-0.4760773, 1.025885, 1.424355, 1, 1, 1, 1, 1,
-0.4733857, -0.07589567, -2.943306, 1, 1, 1, 1, 1,
-0.4733309, -0.967537, -2.486587, 1, 1, 1, 1, 1,
-0.4722881, 1.944674, -0.9366878, 0, 0, 1, 1, 1,
-0.4720847, -1.541173, -2.083671, 1, 0, 0, 1, 1,
-0.4717927, -0.1620153, -0.9243001, 1, 0, 0, 1, 1,
-0.4715334, 1.348244, 0.03402002, 1, 0, 0, 1, 1,
-0.4701559, 0.2907574, -1.570629, 1, 0, 0, 1, 1,
-0.469043, 0.5879529, 0.04269589, 1, 0, 0, 1, 1,
-0.4634302, 0.2454117, -2.042454, 0, 0, 0, 1, 1,
-0.461421, -1.661401, -2.746318, 0, 0, 0, 1, 1,
-0.4577325, -0.2852541, -1.581327, 0, 0, 0, 1, 1,
-0.4564458, 0.5140567, -0.3489211, 0, 0, 0, 1, 1,
-0.4550962, -0.4487458, -3.514923, 0, 0, 0, 1, 1,
-0.4453346, -0.3313829, -3.567815, 0, 0, 0, 1, 1,
-0.4453342, -0.9763227, -3.674167, 0, 0, 0, 1, 1,
-0.4449843, -0.6401483, -2.0713, 1, 1, 1, 1, 1,
-0.4412459, 0.7599093, -1.684758, 1, 1, 1, 1, 1,
-0.4386255, 2.384134, 0.4933414, 1, 1, 1, 1, 1,
-0.437115, 0.4152529, -0.4072792, 1, 1, 1, 1, 1,
-0.4331736, -1.100856, -3.340817, 1, 1, 1, 1, 1,
-0.4312851, -1.495215, -2.942384, 1, 1, 1, 1, 1,
-0.4284659, 1.01564, -0.2460268, 1, 1, 1, 1, 1,
-0.4242826, -1.487856, -2.019712, 1, 1, 1, 1, 1,
-0.4225708, -0.7410253, -4.053223, 1, 1, 1, 1, 1,
-0.4223503, -0.5665717, -3.958917, 1, 1, 1, 1, 1,
-0.4215164, 0.8236419, -1.430785, 1, 1, 1, 1, 1,
-0.4181033, 0.3873565, 0.1435693, 1, 1, 1, 1, 1,
-0.4164817, -2.292716, -4.257375, 1, 1, 1, 1, 1,
-0.4113762, 1.409992, -0.3145263, 1, 1, 1, 1, 1,
-0.4059727, 0.150271, -2.034228, 1, 1, 1, 1, 1,
-0.4047324, 0.2118683, -2.994231, 0, 0, 1, 1, 1,
-0.4025346, 1.859586, 0.8069513, 1, 0, 0, 1, 1,
-0.3959957, 1.982782, -1.202902, 1, 0, 0, 1, 1,
-0.395897, 1.292276, 0.1679689, 1, 0, 0, 1, 1,
-0.3937873, -0.121962, -0.9412779, 1, 0, 0, 1, 1,
-0.3927567, 0.1690822, -1.621261, 1, 0, 0, 1, 1,
-0.3794946, 0.623117, -1.001763, 0, 0, 0, 1, 1,
-0.3791966, -0.2279944, -2.666559, 0, 0, 0, 1, 1,
-0.3783865, 1.269607, 0.1996121, 0, 0, 0, 1, 1,
-0.3756289, 0.4437198, 0.5246868, 0, 0, 0, 1, 1,
-0.3742883, 2.638113, 0.1146331, 0, 0, 0, 1, 1,
-0.3740861, -1.536106, -3.953615, 0, 0, 0, 1, 1,
-0.3718285, -0.4928973, -1.115461, 0, 0, 0, 1, 1,
-0.3671058, -2.247542, -3.552022, 1, 1, 1, 1, 1,
-0.3664808, 0.4115941, -0.02724799, 1, 1, 1, 1, 1,
-0.3621677, -1.511245, -2.531437, 1, 1, 1, 1, 1,
-0.3620553, -0.6490051, -2.487068, 1, 1, 1, 1, 1,
-0.3607851, 0.7527246, -0.08692835, 1, 1, 1, 1, 1,
-0.3593772, -1.132066, -3.005491, 1, 1, 1, 1, 1,
-0.3575068, 0.4430661, 0.605682, 1, 1, 1, 1, 1,
-0.3573643, 0.3351818, -1.067306, 1, 1, 1, 1, 1,
-0.345843, -1.656411, -2.533576, 1, 1, 1, 1, 1,
-0.3441942, 0.6050157, -1.376238, 1, 1, 1, 1, 1,
-0.3424689, -0.112363, -3.694189, 1, 1, 1, 1, 1,
-0.3367806, -0.5793958, -2.108193, 1, 1, 1, 1, 1,
-0.3332714, -0.9906478, -1.976239, 1, 1, 1, 1, 1,
-0.3318222, -1.150985, -5.876719, 1, 1, 1, 1, 1,
-0.3304008, -0.6600824, -1.452143, 1, 1, 1, 1, 1,
-0.3300338, -1.94094, -1.083522, 0, 0, 1, 1, 1,
-0.3280934, 0.8146369, -0.8580691, 1, 0, 0, 1, 1,
-0.3274589, 0.08733156, -0.4038, 1, 0, 0, 1, 1,
-0.3256761, 1.096154, 1.163625, 1, 0, 0, 1, 1,
-0.3249509, -0.5772375, -1.464719, 1, 0, 0, 1, 1,
-0.3224105, -1.544341, -3.506751, 1, 0, 0, 1, 1,
-0.3212731, -1.388579, -2.907007, 0, 0, 0, 1, 1,
-0.318281, 0.1871071, 0.1617705, 0, 0, 0, 1, 1,
-0.318046, 0.5097225, -1.78879, 0, 0, 0, 1, 1,
-0.3138318, -1.094487, -3.685477, 0, 0, 0, 1, 1,
-0.3123803, -0.9140676, -3.172846, 0, 0, 0, 1, 1,
-0.3089802, 0.6270156, -0.9107131, 0, 0, 0, 1, 1,
-0.3087587, 0.6146071, 0.4737292, 0, 0, 0, 1, 1,
-0.3079789, -0.5232372, -1.649676, 1, 1, 1, 1, 1,
-0.3034761, 1.633095, -0.8630018, 1, 1, 1, 1, 1,
-0.3018739, 0.06066626, -3.133745, 1, 1, 1, 1, 1,
-0.2983466, 1.097912, 1.514048, 1, 1, 1, 1, 1,
-0.2943216, -0.1381225, -1.855389, 1, 1, 1, 1, 1,
-0.2895903, 0.572434, 0.04749395, 1, 1, 1, 1, 1,
-0.2890888, -0.3425894, -1.950791, 1, 1, 1, 1, 1,
-0.2875286, -0.1075842, -0.5924823, 1, 1, 1, 1, 1,
-0.286192, -0.8680418, -2.650924, 1, 1, 1, 1, 1,
-0.2836212, -0.4338279, -1.575611, 1, 1, 1, 1, 1,
-0.2825006, 0.2336884, -1.768157, 1, 1, 1, 1, 1,
-0.2741856, 1.752006, 1.599136, 1, 1, 1, 1, 1,
-0.2741268, -0.09112671, -1.950075, 1, 1, 1, 1, 1,
-0.2709827, 0.08110132, -1.462931, 1, 1, 1, 1, 1,
-0.2658102, -1.316694, -5.238011, 1, 1, 1, 1, 1,
-0.2645752, 0.3047689, -0.3179426, 0, 0, 1, 1, 1,
-0.2631567, 1.114672, -0.8683589, 1, 0, 0, 1, 1,
-0.2608694, 1.511525, 0.5437136, 1, 0, 0, 1, 1,
-0.2603576, -0.4753857, -3.104584, 1, 0, 0, 1, 1,
-0.2594855, -1.609553, -2.181161, 1, 0, 0, 1, 1,
-0.2471091, -0.2757055, -2.252731, 1, 0, 0, 1, 1,
-0.2419445, -1.571084, -4.163429, 0, 0, 0, 1, 1,
-0.24119, 1.238418, -0.4622075, 0, 0, 0, 1, 1,
-0.2398513, -0.3134756, -2.902462, 0, 0, 0, 1, 1,
-0.2371646, 0.4850198, -1.580817, 0, 0, 0, 1, 1,
-0.2340407, -1.779946, -0.4579059, 0, 0, 0, 1, 1,
-0.229181, 1.643437, -0.3519509, 0, 0, 0, 1, 1,
-0.2262122, 0.6547663, 0.3582956, 0, 0, 0, 1, 1,
-0.22324, 1.098837, 0.7890034, 1, 1, 1, 1, 1,
-0.2223723, -0.01316084, -1.035674, 1, 1, 1, 1, 1,
-0.2213832, 0.4979864, 2.540298, 1, 1, 1, 1, 1,
-0.2211207, 0.4501161, -0.04380532, 1, 1, 1, 1, 1,
-0.2183329, -0.4801508, -4.374916, 1, 1, 1, 1, 1,
-0.218112, -1.47513, -2.672791, 1, 1, 1, 1, 1,
-0.2164168, -0.5217094, -3.157667, 1, 1, 1, 1, 1,
-0.2158498, -0.8745875, -3.245229, 1, 1, 1, 1, 1,
-0.2157716, -1.413459, -1.417996, 1, 1, 1, 1, 1,
-0.2150508, 0.6825431, -0.9253448, 1, 1, 1, 1, 1,
-0.2148428, 1.157732, -1.880183, 1, 1, 1, 1, 1,
-0.2134086, 0.4420451, 1.758132, 1, 1, 1, 1, 1,
-0.2100735, 0.4294479, -0.656967, 1, 1, 1, 1, 1,
-0.2067409, -0.2493233, -1.893571, 1, 1, 1, 1, 1,
-0.2050457, 0.4225181, 1.43881, 1, 1, 1, 1, 1,
-0.1998133, -2.892808, -3.367159, 0, 0, 1, 1, 1,
-0.1967123, 1.298245, 0.2371371, 1, 0, 0, 1, 1,
-0.1966903, 1.079125, 1.316569, 1, 0, 0, 1, 1,
-0.1925863, -0.5220999, -2.889778, 1, 0, 0, 1, 1,
-0.1923722, -1.888936, -3.570017, 1, 0, 0, 1, 1,
-0.189464, 1.714914, 0.09480182, 1, 0, 0, 1, 1,
-0.1890341, -0.02883601, -1.987812, 0, 0, 0, 1, 1,
-0.187254, 0.6655303, 0.06607635, 0, 0, 0, 1, 1,
-0.1815143, 0.9197854, -0.8413422, 0, 0, 0, 1, 1,
-0.1812401, -1.272565, -1.173981, 0, 0, 0, 1, 1,
-0.178585, -0.2461985, -2.617899, 0, 0, 0, 1, 1,
-0.1765465, 1.202173, -0.4012196, 0, 0, 0, 1, 1,
-0.1733767, 0.9959034, -1.256687, 0, 0, 0, 1, 1,
-0.170506, 0.1079037, -0.2500958, 1, 1, 1, 1, 1,
-0.1702947, 0.3171918, -1.945889, 1, 1, 1, 1, 1,
-0.1688644, 1.368616, -0.6384872, 1, 1, 1, 1, 1,
-0.1650759, 0.5555431, 0.03611664, 1, 1, 1, 1, 1,
-0.1646071, -0.2068038, -2.427718, 1, 1, 1, 1, 1,
-0.1637105, 2.162362, 0.8021337, 1, 1, 1, 1, 1,
-0.1613515, 0.3231234, -0.9641701, 1, 1, 1, 1, 1,
-0.160069, 1.729696, 0.6956648, 1, 1, 1, 1, 1,
-0.1558861, 1.957186, -0.5701841, 1, 1, 1, 1, 1,
-0.1543897, -0.1795375, -2.457747, 1, 1, 1, 1, 1,
-0.149273, 0.2552003, 0.02901233, 1, 1, 1, 1, 1,
-0.1458492, -0.7572956, -2.524553, 1, 1, 1, 1, 1,
-0.1407773, 0.3443212, -0.941113, 1, 1, 1, 1, 1,
-0.1400049, -0.3361247, -2.17363, 1, 1, 1, 1, 1,
-0.1395018, -1.531742, -3.608465, 1, 1, 1, 1, 1,
-0.1363059, -0.7024115, -3.073218, 0, 0, 1, 1, 1,
-0.1346075, 0.5521247, -0.07453346, 1, 0, 0, 1, 1,
-0.1233327, -0.2887372, -2.42003, 1, 0, 0, 1, 1,
-0.1219566, -1.176798, -3.189514, 1, 0, 0, 1, 1,
-0.1183701, 1.094164, -0.6197973, 1, 0, 0, 1, 1,
-0.1172803, 1.004365, 0.04543127, 1, 0, 0, 1, 1,
-0.1163147, -0.7636827, -1.863621, 0, 0, 0, 1, 1,
-0.1140661, 0.9167738, -1.487083, 0, 0, 0, 1, 1,
-0.1087031, -1.274922, -3.273531, 0, 0, 0, 1, 1,
-0.1051445, 0.2660719, -0.7458674, 0, 0, 0, 1, 1,
-0.1049074, -0.4179331, -3.070936, 0, 0, 0, 1, 1,
-0.1040329, 0.7725694, -0.09170268, 0, 0, 0, 1, 1,
-0.1037965, -0.8564963, -3.183698, 0, 0, 0, 1, 1,
-0.1033669, -0.1145737, -1.332448, 1, 1, 1, 1, 1,
-0.1023241, -1.270227, -5.818849, 1, 1, 1, 1, 1,
-0.09867879, -0.5079998, -3.414551, 1, 1, 1, 1, 1,
-0.09766649, -0.6693942, -3.586674, 1, 1, 1, 1, 1,
-0.0959875, 0.124392, -1.077316, 1, 1, 1, 1, 1,
-0.0958443, 1.216115, -1.32374, 1, 1, 1, 1, 1,
-0.09311996, 0.2804256, -1.90918, 1, 1, 1, 1, 1,
-0.0912667, -1.099254, -5.305414, 1, 1, 1, 1, 1,
-0.09085995, 0.1845812, -1.125973, 1, 1, 1, 1, 1,
-0.08913479, -0.6498493, -2.298982, 1, 1, 1, 1, 1,
-0.08857521, 0.7335131, -0.8539436, 1, 1, 1, 1, 1,
-0.0867304, -0.695677, -2.787672, 1, 1, 1, 1, 1,
-0.08524449, -0.9237645, -1.585884, 1, 1, 1, 1, 1,
-0.08001862, -1.895356, -1.655163, 1, 1, 1, 1, 1,
-0.07870224, -0.8051423, -2.818886, 1, 1, 1, 1, 1,
-0.0753391, -0.9936672, -3.976435, 0, 0, 1, 1, 1,
-0.07308124, 0.81981, 0.01942234, 1, 0, 0, 1, 1,
-0.07094637, -0.8430462, -2.523163, 1, 0, 0, 1, 1,
-0.06742839, -1.09595, -2.895002, 1, 0, 0, 1, 1,
-0.06328931, -0.3289063, -3.008835, 1, 0, 0, 1, 1,
-0.05443174, -0.6381433, -2.708266, 1, 0, 0, 1, 1,
-0.05105316, -0.2070217, -2.307081, 0, 0, 0, 1, 1,
-0.04999074, -0.4020689, -3.041737, 0, 0, 0, 1, 1,
-0.04742651, -0.8378361, -4.378626, 0, 0, 0, 1, 1,
-0.04734622, -0.6550428, -3.924538, 0, 0, 0, 1, 1,
-0.04423582, -1.006819, -3.193246, 0, 0, 0, 1, 1,
-0.03435412, 0.9215543, -0.3057501, 0, 0, 0, 1, 1,
-0.03291075, 0.03054034, -1.04865, 0, 0, 0, 1, 1,
-0.03109494, -0.6529518, -2.973331, 1, 1, 1, 1, 1,
-0.02892438, 0.6197155, -0.8497755, 1, 1, 1, 1, 1,
-0.025976, 0.2038615, -0.4346164, 1, 1, 1, 1, 1,
-0.02415762, -0.1390557, -3.977958, 1, 1, 1, 1, 1,
-0.02350148, 0.3828639, 0.8240654, 1, 1, 1, 1, 1,
-0.0234664, 0.2443528, 0.3921025, 1, 1, 1, 1, 1,
-0.02275693, 1.091616, 1.338609, 1, 1, 1, 1, 1,
-0.01664663, -1.49289, -3.886133, 1, 1, 1, 1, 1,
-0.01257605, -0.6286974, -2.259857, 1, 1, 1, 1, 1,
-0.01227059, 0.3977058, 0.8078483, 1, 1, 1, 1, 1,
-0.01224794, 0.2445722, -0.4011003, 1, 1, 1, 1, 1,
-0.009266132, 0.6615211, 0.03613812, 1, 1, 1, 1, 1,
-0.005981747, -0.6158581, -4.107422, 1, 1, 1, 1, 1,
-0.003564645, -0.8667901, -2.943578, 1, 1, 1, 1, 1,
0.008568514, 1.392175, -0.4777144, 1, 1, 1, 1, 1,
0.01600922, -0.5574839, 3.402299, 0, 0, 1, 1, 1,
0.01786811, -1.612708, 2.854858, 1, 0, 0, 1, 1,
0.02239627, -0.05188106, 2.558016, 1, 0, 0, 1, 1,
0.02982461, -2.034456, 5.134109, 1, 0, 0, 1, 1,
0.034941, -1.706513, 2.296352, 1, 0, 0, 1, 1,
0.03644851, 0.5556458, 0.5177174, 1, 0, 0, 1, 1,
0.036477, 1.901947, -0.5755489, 0, 0, 0, 1, 1,
0.03683567, -0.3687355, 2.672189, 0, 0, 0, 1, 1,
0.04276939, -0.7631941, 2.593795, 0, 0, 0, 1, 1,
0.05301895, 0.5044212, 0.5953415, 0, 0, 0, 1, 1,
0.05508042, -0.9202676, 3.02682, 0, 0, 0, 1, 1,
0.06115167, 0.1589027, 1.884644, 0, 0, 0, 1, 1,
0.06589484, -1.363842, 4.808936, 0, 0, 0, 1, 1,
0.06620559, -0.2320705, 3.372267, 1, 1, 1, 1, 1,
0.07104681, 0.7059274, -0.8214321, 1, 1, 1, 1, 1,
0.07109318, -1.162096, 2.342611, 1, 1, 1, 1, 1,
0.07309073, -1.269147, 2.502, 1, 1, 1, 1, 1,
0.07309397, 0.2201722, -0.1029051, 1, 1, 1, 1, 1,
0.07326536, 0.6322916, 0.4540879, 1, 1, 1, 1, 1,
0.07356668, -0.1320318, 3.673097, 1, 1, 1, 1, 1,
0.07755586, -1.91333, 1.732378, 1, 1, 1, 1, 1,
0.08304169, -0.6732766, 3.340134, 1, 1, 1, 1, 1,
0.08314391, -0.08992968, 2.65408, 1, 1, 1, 1, 1,
0.08404817, 1.554485, -0.4296199, 1, 1, 1, 1, 1,
0.0852728, 0.03464274, 0.8119509, 1, 1, 1, 1, 1,
0.08550967, -1.021957, 3.54697, 1, 1, 1, 1, 1,
0.0856651, 0.4203301, 1.64072, 1, 1, 1, 1, 1,
0.08834976, -1.619614, 3.821445, 1, 1, 1, 1, 1,
0.09227084, -1.058062, 3.68558, 0, 0, 1, 1, 1,
0.09512754, -0.2903655, 4.267783, 1, 0, 0, 1, 1,
0.101911, -0.1891406, 3.630443, 1, 0, 0, 1, 1,
0.1027733, 0.1080978, 1.300738, 1, 0, 0, 1, 1,
0.1123675, 0.8092453, 0.7878193, 1, 0, 0, 1, 1,
0.1133729, -1.265035, 4.219276, 1, 0, 0, 1, 1,
0.11365, -1.225411, 5.893633, 0, 0, 0, 1, 1,
0.114348, 0.3340547, 0.09085652, 0, 0, 0, 1, 1,
0.117752, -0.4351713, 4.653432, 0, 0, 0, 1, 1,
0.1211135, -0.6047388, 5.131278, 0, 0, 0, 1, 1,
0.1211469, -0.7321545, 2.164647, 0, 0, 0, 1, 1,
0.1216458, -0.2521302, 2.929866, 0, 0, 0, 1, 1,
0.1223073, 1.167997, 0.7174535, 0, 0, 0, 1, 1,
0.1234697, 0.1237273, 1.111484, 1, 1, 1, 1, 1,
0.1253355, 1.091019, 1.525451, 1, 1, 1, 1, 1,
0.1272781, 0.7200536, -0.836683, 1, 1, 1, 1, 1,
0.1280143, 1.204239, -1.686443, 1, 1, 1, 1, 1,
0.1280927, -1.049166, 1.798725, 1, 1, 1, 1, 1,
0.1282686, 0.5327018, 0.04362876, 1, 1, 1, 1, 1,
0.1286312, 0.1503062, -1.838703, 1, 1, 1, 1, 1,
0.1310215, 0.5461811, 0.04910132, 1, 1, 1, 1, 1,
0.1321688, 1.323018, -0.1744687, 1, 1, 1, 1, 1,
0.1322897, -2.846087, 4.014323, 1, 1, 1, 1, 1,
0.1339743, 0.9251452, 0.624278, 1, 1, 1, 1, 1,
0.1364069, 0.3018304, -0.3168392, 1, 1, 1, 1, 1,
0.1373615, -0.7546774, 2.40209, 1, 1, 1, 1, 1,
0.1378512, 1.060514, -0.1691011, 1, 1, 1, 1, 1,
0.1411007, -0.7680702, 2.314523, 1, 1, 1, 1, 1,
0.1441615, 0.9034535, -0.6809207, 0, 0, 1, 1, 1,
0.1442385, 1.25654, -0.492647, 1, 0, 0, 1, 1,
0.1449191, 2.239032, 1.405347, 1, 0, 0, 1, 1,
0.1460753, 1.58753, 0.7098244, 1, 0, 0, 1, 1,
0.1495541, 0.9182109, 1.525044, 1, 0, 0, 1, 1,
0.1498545, 1.907373, 0.933275, 1, 0, 0, 1, 1,
0.1501251, -0.1930452, 2.604794, 0, 0, 0, 1, 1,
0.1529573, -0.4381634, 2.679416, 0, 0, 0, 1, 1,
0.1537318, 0.7295013, -0.0656302, 0, 0, 0, 1, 1,
0.1543009, 0.4302344, 0.9654205, 0, 0, 0, 1, 1,
0.1621492, 0.7699897, 0.1873317, 0, 0, 0, 1, 1,
0.1711451, -0.1368723, 2.061005, 0, 0, 0, 1, 1,
0.1728587, 1.377203, 1.806686, 0, 0, 0, 1, 1,
0.173872, -2.135291, 3.546144, 1, 1, 1, 1, 1,
0.1759556, 0.999066, -0.2857459, 1, 1, 1, 1, 1,
0.1798765, 0.7616398, 1.320152, 1, 1, 1, 1, 1,
0.1833869, 0.8686447, 0.1055602, 1, 1, 1, 1, 1,
0.1970099, 0.05320385, 2.830546, 1, 1, 1, 1, 1,
0.1986428, 1.375058, 1.513792, 1, 1, 1, 1, 1,
0.2020298, -1.014899, 2.807927, 1, 1, 1, 1, 1,
0.2086741, -1.317268, 2.674758, 1, 1, 1, 1, 1,
0.209124, 0.2542875, 0.2706029, 1, 1, 1, 1, 1,
0.2124275, 0.7227443, -0.687673, 1, 1, 1, 1, 1,
0.2136475, 0.6327519, 0.7746181, 1, 1, 1, 1, 1,
0.2241848, -0.5798647, 1.099178, 1, 1, 1, 1, 1,
0.2280047, -1.350928, 2.591269, 1, 1, 1, 1, 1,
0.2284158, -0.2408661, 0.4557337, 1, 1, 1, 1, 1,
0.2295214, -1.011578, 3.32704, 1, 1, 1, 1, 1,
0.2297764, -1.004756, 3.101855, 0, 0, 1, 1, 1,
0.2341699, -0.543171, 2.266385, 1, 0, 0, 1, 1,
0.2345446, -1.92067, 4.206841, 1, 0, 0, 1, 1,
0.2349567, 0.6079136, 0.2411847, 1, 0, 0, 1, 1,
0.2351936, 0.7639281, 1.680572, 1, 0, 0, 1, 1,
0.2378834, 0.1306989, -0.5730736, 1, 0, 0, 1, 1,
0.2383513, -1.295812, 2.902961, 0, 0, 0, 1, 1,
0.2455429, 0.5118735, -0.9152102, 0, 0, 0, 1, 1,
0.245552, 0.4784175, -0.5017242, 0, 0, 0, 1, 1,
0.2464575, 1.171071, 0.9008468, 0, 0, 0, 1, 1,
0.2514708, -0.666843, 2.064091, 0, 0, 0, 1, 1,
0.2521968, -0.6055059, 2.15493, 0, 0, 0, 1, 1,
0.2527834, -0.7728001, 2.776258, 0, 0, 0, 1, 1,
0.256729, 0.7155848, -0.3427196, 1, 1, 1, 1, 1,
0.2577742, -0.01571313, 1.480046, 1, 1, 1, 1, 1,
0.2601853, 1.509231, 0.4773095, 1, 1, 1, 1, 1,
0.260915, 0.03003146, 1.938232, 1, 1, 1, 1, 1,
0.2628006, 1.042805, 2.247545, 1, 1, 1, 1, 1,
0.267471, 1.039991, 0.664712, 1, 1, 1, 1, 1,
0.2722271, 1.415275, 0.3310056, 1, 1, 1, 1, 1,
0.2760012, 0.4639385, -0.5192207, 1, 1, 1, 1, 1,
0.2774487, -1.075007, 2.091904, 1, 1, 1, 1, 1,
0.2789781, -0.9266685, 3.293305, 1, 1, 1, 1, 1,
0.284985, -0.82782, 2.485655, 1, 1, 1, 1, 1,
0.2855944, -0.6378808, 2.154992, 1, 1, 1, 1, 1,
0.2859211, 0.4994121, -0.4270721, 1, 1, 1, 1, 1,
0.2861443, 1.513349, -1.197826, 1, 1, 1, 1, 1,
0.2883324, -2.470963, 3.444971, 1, 1, 1, 1, 1,
0.2900703, -1.61031, 3.11551, 0, 0, 1, 1, 1,
0.2907501, 0.1882781, 2.05835, 1, 0, 0, 1, 1,
0.293607, -0.6291358, 5.610371, 1, 0, 0, 1, 1,
0.3007716, -0.2414502, 2.250974, 1, 0, 0, 1, 1,
0.3045729, -1.09637, 4.5235, 1, 0, 0, 1, 1,
0.3053934, -1.433789, 3.013928, 1, 0, 0, 1, 1,
0.306264, 0.8932823, 0.4984173, 0, 0, 0, 1, 1,
0.3093339, -0.6940142, 1.636234, 0, 0, 0, 1, 1,
0.3111849, 0.1934147, 1.436404, 0, 0, 0, 1, 1,
0.3123125, -0.6993632, 4.668902, 0, 0, 0, 1, 1,
0.3156365, 0.5737535, 1.467604, 0, 0, 0, 1, 1,
0.3161387, -0.669623, 2.823334, 0, 0, 0, 1, 1,
0.3175678, -2.130871, 2.509879, 0, 0, 0, 1, 1,
0.3176092, 0.1478022, 2.969342, 1, 1, 1, 1, 1,
0.322029, -0.6627508, 3.107508, 1, 1, 1, 1, 1,
0.3326724, 0.4718031, -0.6078824, 1, 1, 1, 1, 1,
0.3328235, 0.5435809, 1.443491, 1, 1, 1, 1, 1,
0.3349409, 0.2457161, 2.462147, 1, 1, 1, 1, 1,
0.3353872, -0.1572622, 3.126005, 1, 1, 1, 1, 1,
0.3361763, 0.8051226, 1.044968, 1, 1, 1, 1, 1,
0.3366165, -1.292022, 3.459912, 1, 1, 1, 1, 1,
0.3381211, 0.07928652, 1.210113, 1, 1, 1, 1, 1,
0.338141, 1.624758, 0.2287932, 1, 1, 1, 1, 1,
0.3421502, 0.6677283, 1.566366, 1, 1, 1, 1, 1,
0.3436343, -0.6866979, 2.209257, 1, 1, 1, 1, 1,
0.3454697, 0.4317581, 1.562986, 1, 1, 1, 1, 1,
0.3484664, 0.1384169, 1.030817, 1, 1, 1, 1, 1,
0.3541755, 0.5429406, 1.206668, 1, 1, 1, 1, 1,
0.3553076, 0.7676463, -0.4789993, 0, 0, 1, 1, 1,
0.3554947, 1.875292, -0.8870454, 1, 0, 0, 1, 1,
0.3652742, 0.249421, 1.234095, 1, 0, 0, 1, 1,
0.3662546, 0.1235458, 1.107319, 1, 0, 0, 1, 1,
0.366395, 0.7611846, 0.1169601, 1, 0, 0, 1, 1,
0.3682234, 0.278002, 1.022745, 1, 0, 0, 1, 1,
0.368726, 0.7716507, 0.8212875, 0, 0, 0, 1, 1,
0.3719721, -1.055204, 2.524621, 0, 0, 0, 1, 1,
0.3737416, -0.7752123, 3.597462, 0, 0, 0, 1, 1,
0.3781055, -0.07038711, 3.072974, 0, 0, 0, 1, 1,
0.3786123, 0.1555534, 1.300529, 0, 0, 0, 1, 1,
0.3825479, 1.118155, -0.8638079, 0, 0, 0, 1, 1,
0.3854706, 1.533196, 1.193329, 0, 0, 0, 1, 1,
0.3885508, -1.094263, 3.352605, 1, 1, 1, 1, 1,
0.3906274, -0.3356539, 1.960732, 1, 1, 1, 1, 1,
0.3908963, 0.6447156, 0.3983727, 1, 1, 1, 1, 1,
0.3925163, -0.2294714, 2.965884, 1, 1, 1, 1, 1,
0.3963834, 0.8651475, 0.4282453, 1, 1, 1, 1, 1,
0.3977835, -0.6126755, 3.059756, 1, 1, 1, 1, 1,
0.4011598, 0.3750212, 0.9785429, 1, 1, 1, 1, 1,
0.403086, -1.81413, 2.768563, 1, 1, 1, 1, 1,
0.4080548, -1.164543, 4.020706, 1, 1, 1, 1, 1,
0.4135094, 0.757264, 0.0525062, 1, 1, 1, 1, 1,
0.4186564, -0.1463428, 3.314509, 1, 1, 1, 1, 1,
0.424305, -0.6665461, 2.712147, 1, 1, 1, 1, 1,
0.433582, 0.9517695, 0.01766437, 1, 1, 1, 1, 1,
0.4345066, -0.2057573, 2.380164, 1, 1, 1, 1, 1,
0.4368898, 1.145454, 0.6178486, 1, 1, 1, 1, 1,
0.437455, 0.5835108, 0.1659816, 0, 0, 1, 1, 1,
0.4374903, 0.7251418, 2.005199, 1, 0, 0, 1, 1,
0.4393933, -0.4603301, 1.850844, 1, 0, 0, 1, 1,
0.4415877, -0.6778356, 2.82807, 1, 0, 0, 1, 1,
0.4422958, -0.1280211, -0.0690704, 1, 0, 0, 1, 1,
0.4430392, 0.3804578, 1.364149, 1, 0, 0, 1, 1,
0.4495658, -0.1548909, 3.094724, 0, 0, 0, 1, 1,
0.459706, -0.9296386, 2.531832, 0, 0, 0, 1, 1,
0.4622949, 0.6041834, -0.6285922, 0, 0, 0, 1, 1,
0.4628855, -0.666407, 3.608739, 0, 0, 0, 1, 1,
0.4630689, -0.05260524, 2.074125, 0, 0, 0, 1, 1,
0.4648844, 1.57568, 0.9810793, 0, 0, 0, 1, 1,
0.4667083, 1.311804, 0.8529278, 0, 0, 0, 1, 1,
0.4669077, 0.6009012, 1.493212, 1, 1, 1, 1, 1,
0.4702285, 0.1093795, 1.964301, 1, 1, 1, 1, 1,
0.4711724, -0.2258623, 0.3937737, 1, 1, 1, 1, 1,
0.473447, -0.9604875, 1.793885, 1, 1, 1, 1, 1,
0.4754646, -0.9268086, 3.287388, 1, 1, 1, 1, 1,
0.4755041, 0.2307021, 0.9518371, 1, 1, 1, 1, 1,
0.4831019, 1.49244, -0.3340677, 1, 1, 1, 1, 1,
0.4834159, 0.488246, 2.831974, 1, 1, 1, 1, 1,
0.4837927, -0.8348964, 2.161373, 1, 1, 1, 1, 1,
0.4844125, -1.095738, 4.109905, 1, 1, 1, 1, 1,
0.4869715, 0.02601664, 1.937684, 1, 1, 1, 1, 1,
0.490405, 0.1664771, 1.105212, 1, 1, 1, 1, 1,
0.4906237, 1.597342, -0.43493, 1, 1, 1, 1, 1,
0.4960354, 0.5571502, -1.287622, 1, 1, 1, 1, 1,
0.5008925, 0.01575939, 1.687739, 1, 1, 1, 1, 1,
0.5019032, 1.774873, 2.126871, 0, 0, 1, 1, 1,
0.5056678, -0.7022421, 2.546862, 1, 0, 0, 1, 1,
0.5057222, -1.906322, 5.219316, 1, 0, 0, 1, 1,
0.5098817, -0.2647799, 4.405479, 1, 0, 0, 1, 1,
0.5115366, 0.4321962, 0.467289, 1, 0, 0, 1, 1,
0.5120274, -0.3531822, 3.699319, 1, 0, 0, 1, 1,
0.5122566, 1.525939, -0.6018289, 0, 0, 0, 1, 1,
0.51575, 0.8789551, 0.01465322, 0, 0, 0, 1, 1,
0.5176706, -1.024979, 2.548961, 0, 0, 0, 1, 1,
0.517825, -1.374642, 2.1196, 0, 0, 0, 1, 1,
0.517938, -0.1515522, 2.958378, 0, 0, 0, 1, 1,
0.5186596, -0.0982739, 0.6394446, 0, 0, 0, 1, 1,
0.5239742, -0.2281251, 3.046039, 0, 0, 0, 1, 1,
0.5240493, -0.6799665, 2.094137, 1, 1, 1, 1, 1,
0.5265968, -1.91219, 3.328955, 1, 1, 1, 1, 1,
0.52732, 1.168974, 0.6860967, 1, 1, 1, 1, 1,
0.5377787, -0.08709295, 1.014529, 1, 1, 1, 1, 1,
0.5379631, 0.6391363, 2.02803, 1, 1, 1, 1, 1,
0.5385952, -0.5369297, 2.163468, 1, 1, 1, 1, 1,
0.5390573, -1.440207, 3.33788, 1, 1, 1, 1, 1,
0.5397704, -0.4671836, 2.593036, 1, 1, 1, 1, 1,
0.5417508, 0.08412611, 0.6660786, 1, 1, 1, 1, 1,
0.543708, -1.381418, 2.306606, 1, 1, 1, 1, 1,
0.5439768, -2.294154, 3.804208, 1, 1, 1, 1, 1,
0.547015, 0.5281392, 2.548139, 1, 1, 1, 1, 1,
0.5472291, -0.4880234, 3.338288, 1, 1, 1, 1, 1,
0.5491606, -0.4778702, 3.36993, 1, 1, 1, 1, 1,
0.5511158, 0.579567, 0.22538, 1, 1, 1, 1, 1,
0.5522084, 1.564937, -1.342698, 0, 0, 1, 1, 1,
0.5549748, 0.4155433, 0.8846235, 1, 0, 0, 1, 1,
0.562171, 0.6290362, -1.050587, 1, 0, 0, 1, 1,
0.5678398, 1.284103, 1.119437, 1, 0, 0, 1, 1,
0.5689143, -0.01866723, 1.034284, 1, 0, 0, 1, 1,
0.5702099, -0.5087809, 0.6250768, 1, 0, 0, 1, 1,
0.5734178, 0.8255351, -1.088322, 0, 0, 0, 1, 1,
0.5796954, 0.7029792, 0.3510323, 0, 0, 0, 1, 1,
0.5847398, 0.6425532, -0.1695432, 0, 0, 0, 1, 1,
0.5880296, 0.7778556, 0.2315677, 0, 0, 0, 1, 1,
0.5971848, -0.05486829, 1.68602, 0, 0, 0, 1, 1,
0.6001576, 0.6131899, 0.3636217, 0, 0, 0, 1, 1,
0.611457, 0.3745948, 2.118658, 0, 0, 0, 1, 1,
0.6272033, -0.1433866, 0.9732108, 1, 1, 1, 1, 1,
0.6290039, -0.5478345, 3.551285, 1, 1, 1, 1, 1,
0.6292162, -0.1099877, 2.061226, 1, 1, 1, 1, 1,
0.6296247, 0.07919679, 2.588893, 1, 1, 1, 1, 1,
0.6323685, -0.9422122, 0.9080142, 1, 1, 1, 1, 1,
0.6356227, 1.767995, -1.045581, 1, 1, 1, 1, 1,
0.6399843, -0.9514474, 4.363837, 1, 1, 1, 1, 1,
0.6429523, 0.0352099, 1.80003, 1, 1, 1, 1, 1,
0.648689, 0.2769097, 0.9097613, 1, 1, 1, 1, 1,
0.6497086, 0.1209004, 1.759859, 1, 1, 1, 1, 1,
0.6507984, -0.3017535, 2.783073, 1, 1, 1, 1, 1,
0.6510782, 0.339302, 2.172261, 1, 1, 1, 1, 1,
0.6562543, -0.3533809, 0.7865714, 1, 1, 1, 1, 1,
0.6601323, -0.50359, 2.642425, 1, 1, 1, 1, 1,
0.6686124, 0.745883, 1.119491, 1, 1, 1, 1, 1,
0.6742801, -1.08319, 3.542894, 0, 0, 1, 1, 1,
0.6771506, -0.7482851, 3.26936, 1, 0, 0, 1, 1,
0.6779045, -0.4080184, 3.21753, 1, 0, 0, 1, 1,
0.6780059, 0.01449669, 1.365262, 1, 0, 0, 1, 1,
0.6818873, -1.7997, 3.378715, 1, 0, 0, 1, 1,
0.6907732, -0.1270849, 0.1927888, 1, 0, 0, 1, 1,
0.6910904, 0.3476822, 1.423269, 0, 0, 0, 1, 1,
0.6911862, 0.1056057, 1.773132, 0, 0, 0, 1, 1,
0.6915609, 0.3047575, 1.917467, 0, 0, 0, 1, 1,
0.6935932, -0.7214109, 3.431656, 0, 0, 0, 1, 1,
0.696394, -0.6759151, 1.195413, 0, 0, 0, 1, 1,
0.7004461, 0.1650268, 0.8224105, 0, 0, 0, 1, 1,
0.7011203, -0.2904803, 2.600619, 0, 0, 0, 1, 1,
0.7032899, 0.1471158, 1.161012, 1, 1, 1, 1, 1,
0.7257037, 0.3527576, 2.304427, 1, 1, 1, 1, 1,
0.7269326, -0.6677315, 1.918002, 1, 1, 1, 1, 1,
0.7274724, -1.493433, 2.948291, 1, 1, 1, 1, 1,
0.7307193, 0.3133539, 1.847707, 1, 1, 1, 1, 1,
0.7320961, 1.153328, -0.5075876, 1, 1, 1, 1, 1,
0.7485192, 1.679311, 0.08565396, 1, 1, 1, 1, 1,
0.7494422, -1.11209, 3.88874, 1, 1, 1, 1, 1,
0.7507448, 0.06061778, -0.4521408, 1, 1, 1, 1, 1,
0.7539708, 0.708102, 0.3433487, 1, 1, 1, 1, 1,
0.75533, -0.06724095, 1.773616, 1, 1, 1, 1, 1,
0.7610251, 0.3481156, 2.19052, 1, 1, 1, 1, 1,
0.7655492, 0.4269956, 1.800429, 1, 1, 1, 1, 1,
0.7690009, 0.348331, 1.661537, 1, 1, 1, 1, 1,
0.769438, 0.4801398, 2.006606, 1, 1, 1, 1, 1,
0.7712321, 0.09258068, 0.542154, 0, 0, 1, 1, 1,
0.7722813, -0.1010884, 1.685455, 1, 0, 0, 1, 1,
0.7756367, -0.5314576, 3.676289, 1, 0, 0, 1, 1,
0.7760406, 0.3382373, 2.983412, 1, 0, 0, 1, 1,
0.7804743, -0.1031885, 2.081765, 1, 0, 0, 1, 1,
0.7815818, 1.101148, -0.3849655, 1, 0, 0, 1, 1,
0.7857631, 0.3339484, 1.427272, 0, 0, 0, 1, 1,
0.7885612, -0.6959853, 2.272612, 0, 0, 0, 1, 1,
0.7910176, -0.1694861, 1.23947, 0, 0, 0, 1, 1,
0.794121, -0.2270917, 1.588154, 0, 0, 0, 1, 1,
0.7950605, 0.08054166, 0.5667901, 0, 0, 0, 1, 1,
0.7990835, -0.1910768, 3.808005, 0, 0, 0, 1, 1,
0.8022029, 0.6061902, 0.05046725, 0, 0, 0, 1, 1,
0.8034434, -0.1440904, 2.769184, 1, 1, 1, 1, 1,
0.8090266, -0.6844178, 0.8863906, 1, 1, 1, 1, 1,
0.8092918, -0.05281816, 1.54607, 1, 1, 1, 1, 1,
0.8131582, -0.1554172, 1.559469, 1, 1, 1, 1, 1,
0.8181415, -0.1706326, 1.706898, 1, 1, 1, 1, 1,
0.8183201, 0.6932451, 2.213621, 1, 1, 1, 1, 1,
0.830242, 0.4406519, 2.380652, 1, 1, 1, 1, 1,
0.8351722, 0.9475974, 1.206469, 1, 1, 1, 1, 1,
0.8417721, 0.338769, 0.1168163, 1, 1, 1, 1, 1,
0.8426645, -1.043862, 0.7833663, 1, 1, 1, 1, 1,
0.8434994, -0.2833804, 1.154365, 1, 1, 1, 1, 1,
0.8440084, -0.4410176, 2.166028, 1, 1, 1, 1, 1,
0.8440762, 1.010559, 3.397932, 1, 1, 1, 1, 1,
0.8520404, 0.07365832, 1.877592, 1, 1, 1, 1, 1,
0.8523479, -0.4924377, 1.972559, 1, 1, 1, 1, 1,
0.8534198, 0.2199142, 1.711164, 0, 0, 1, 1, 1,
0.8541937, -0.8066562, 3.320694, 1, 0, 0, 1, 1,
0.8646155, 0.1575654, 2.937211, 1, 0, 0, 1, 1,
0.8683938, -0.006587347, 2.220553, 1, 0, 0, 1, 1,
0.8732585, 0.189851, 1.641931, 1, 0, 0, 1, 1,
0.8785345, 1.163794, 1.433814, 1, 0, 0, 1, 1,
0.8870677, -0.9638972, 3.32979, 0, 0, 0, 1, 1,
0.8910397, 1.394543, 1.847257, 0, 0, 0, 1, 1,
0.8941207, 0.4675656, -0.03566593, 0, 0, 0, 1, 1,
0.8949951, 0.2284234, 2.471419, 0, 0, 0, 1, 1,
0.8970304, 1.9097, 1.020621, 0, 0, 0, 1, 1,
0.8986865, -0.6554183, 1.169828, 0, 0, 0, 1, 1,
0.9049279, -1.438866, 1.435873, 0, 0, 0, 1, 1,
0.9055146, 1.530415, 0.7396603, 1, 1, 1, 1, 1,
0.9089236, -0.8532287, 3.917414, 1, 1, 1, 1, 1,
0.9124865, -0.11323, 0.5616282, 1, 1, 1, 1, 1,
0.9142731, 0.6813422, 1.138784, 1, 1, 1, 1, 1,
0.9185558, -0.03945572, 3.233787, 1, 1, 1, 1, 1,
0.9220025, 0.1458486, 2.372893, 1, 1, 1, 1, 1,
0.9288316, -0.5315115, 2.542718, 1, 1, 1, 1, 1,
0.9300366, 0.0762815, 1.714806, 1, 1, 1, 1, 1,
0.9383311, -0.6450541, 2.499476, 1, 1, 1, 1, 1,
0.9451735, -0.04817701, 2.764498, 1, 1, 1, 1, 1,
0.9470476, -0.4127003, 1.903185, 1, 1, 1, 1, 1,
0.9483875, -0.2536256, 1.007707, 1, 1, 1, 1, 1,
0.9532818, 0.09884911, 1.27311, 1, 1, 1, 1, 1,
0.9592351, 0.4184139, 0.735738, 1, 1, 1, 1, 1,
0.9622331, 0.1868299, 2.910505, 1, 1, 1, 1, 1,
0.9721651, 0.1979861, 2.512854, 0, 0, 1, 1, 1,
0.9831852, -0.409227, 2.458849, 1, 0, 0, 1, 1,
0.98353, 0.01567315, 1.018307, 1, 0, 0, 1, 1,
0.9839028, -0.7408016, 0.8702845, 1, 0, 0, 1, 1,
0.9873228, -0.3042466, 1.272892, 1, 0, 0, 1, 1,
0.9884914, 0.9987138, 0.001441097, 1, 0, 0, 1, 1,
0.9892001, -0.2216462, 0.7868432, 0, 0, 0, 1, 1,
1.001787, -0.1671042, 2.26307, 0, 0, 0, 1, 1,
1.005418, -0.2906308, 0.4790738, 0, 0, 0, 1, 1,
1.014591, -0.2699049, 2.094575, 0, 0, 0, 1, 1,
1.023025, -1.091553, 2.696167, 0, 0, 0, 1, 1,
1.028031, 0.1068811, -0.8267208, 0, 0, 0, 1, 1,
1.029214, 0.7755632, -0.6382108, 0, 0, 0, 1, 1,
1.029931, 0.625154, 1.324676, 1, 1, 1, 1, 1,
1.034777, -1.482552, 1.487361, 1, 1, 1, 1, 1,
1.044912, -0.2176422, 0.4831972, 1, 1, 1, 1, 1,
1.046285, 1.082381, 1.903696, 1, 1, 1, 1, 1,
1.047297, -0.520337, 2.929064, 1, 1, 1, 1, 1,
1.054837, 0.225687, 1.233866, 1, 1, 1, 1, 1,
1.057595, -0.7550743, 0.5861757, 1, 1, 1, 1, 1,
1.061771, -0.02912956, 0.7784067, 1, 1, 1, 1, 1,
1.067598, 0.03848795, 1.677684, 1, 1, 1, 1, 1,
1.080894, 0.1532772, -0.6431985, 1, 1, 1, 1, 1,
1.091742, 0.6462181, -0.6810387, 1, 1, 1, 1, 1,
1.098996, -0.127917, 2.044026, 1, 1, 1, 1, 1,
1.099429, -1.938285, 3.140696, 1, 1, 1, 1, 1,
1.101526, -0.07581903, 0.04172382, 1, 1, 1, 1, 1,
1.101989, 0.2776776, 0.5575052, 1, 1, 1, 1, 1,
1.102777, -0.2118263, 2.742099, 0, 0, 1, 1, 1,
1.104875, -1.573806, 1.712498, 1, 0, 0, 1, 1,
1.114613, -0.2522823, 1.484496, 1, 0, 0, 1, 1,
1.116826, -0.7586873, 2.542234, 1, 0, 0, 1, 1,
1.11845, 0.7940308, 1.653076, 1, 0, 0, 1, 1,
1.119423, -1.129893, 3.212244, 1, 0, 0, 1, 1,
1.132476, 0.04515231, 1.134374, 0, 0, 0, 1, 1,
1.136144, -3.257314, 4.485078, 0, 0, 0, 1, 1,
1.136262, 0.5098718, 2.587729, 0, 0, 0, 1, 1,
1.138265, -0.8946495, 2.012549, 0, 0, 0, 1, 1,
1.145324, -0.4826535, 2.619148, 0, 0, 0, 1, 1,
1.149007, -1.820491, 3.945401, 0, 0, 0, 1, 1,
1.150683, 0.6932991, 1.205541, 0, 0, 0, 1, 1,
1.152214, 0.2944872, 0.08121576, 1, 1, 1, 1, 1,
1.155471, 0.8583296, 2.546708, 1, 1, 1, 1, 1,
1.166131, -2.786908, 1.032178, 1, 1, 1, 1, 1,
1.180511, 0.7376083, 1.263008, 1, 1, 1, 1, 1,
1.183722, 0.2897848, 2.14114, 1, 1, 1, 1, 1,
1.18994, 0.8527674, -0.7206655, 1, 1, 1, 1, 1,
1.19948, -0.1897046, 0.859478, 1, 1, 1, 1, 1,
1.200217, 0.9467868, 3.061352, 1, 1, 1, 1, 1,
1.22168, -0.3646959, 2.267493, 1, 1, 1, 1, 1,
1.228161, -0.6450972, 3.437764, 1, 1, 1, 1, 1,
1.229606, -0.4980549, 1.468695, 1, 1, 1, 1, 1,
1.230814, 0.6080199, 1.967911, 1, 1, 1, 1, 1,
1.234768, 1.123225, 0.8042223, 1, 1, 1, 1, 1,
1.243274, 1.371498, 1.380906, 1, 1, 1, 1, 1,
1.251136, 0.05796966, 0.9227775, 1, 1, 1, 1, 1,
1.252733, -1.497408, 0.9975662, 0, 0, 1, 1, 1,
1.260558, -0.209516, 2.056661, 1, 0, 0, 1, 1,
1.26214, -0.4667993, 2.750454, 1, 0, 0, 1, 1,
1.271535, 1.148602, 0.1495309, 1, 0, 0, 1, 1,
1.273466, -1.195398, 2.930008, 1, 0, 0, 1, 1,
1.273887, -0.3608137, 2.557985, 1, 0, 0, 1, 1,
1.278042, -1.243531, 0.3264343, 0, 0, 0, 1, 1,
1.28749, 0.6508499, 0.5883331, 0, 0, 0, 1, 1,
1.291188, -1.732485, 3.000966, 0, 0, 0, 1, 1,
1.293329, 0.413572, 1.502396, 0, 0, 0, 1, 1,
1.294998, 0.1338593, 0.2090287, 0, 0, 0, 1, 1,
1.308347, 0.743494, 0.5827848, 0, 0, 0, 1, 1,
1.309462, -1.545232, 1.0107, 0, 0, 0, 1, 1,
1.313963, 0.3774355, 1.889062, 1, 1, 1, 1, 1,
1.31657, -1.80416, 1.669045, 1, 1, 1, 1, 1,
1.327574, 1.906527, 1.567392, 1, 1, 1, 1, 1,
1.334657, 1.027479, -1.400826, 1, 1, 1, 1, 1,
1.339417, 0.1543251, 1.081745, 1, 1, 1, 1, 1,
1.343582, -1.58436, 1.184929, 1, 1, 1, 1, 1,
1.348476, -0.587042, 1.386827, 1, 1, 1, 1, 1,
1.351585, -0.08547955, 2.105323, 1, 1, 1, 1, 1,
1.356269, 0.4847689, 0.9872639, 1, 1, 1, 1, 1,
1.375589, -1.557585, 2.688757, 1, 1, 1, 1, 1,
1.378169, 1.716372, 1.889752, 1, 1, 1, 1, 1,
1.381593, -0.3113762, 0.6785242, 1, 1, 1, 1, 1,
1.384765, 0.3743185, -0.2644195, 1, 1, 1, 1, 1,
1.389947, -0.09590125, 1.069253, 1, 1, 1, 1, 1,
1.399588, 1.572207, 1.618679, 1, 1, 1, 1, 1,
1.400869, -1.155733, 2.352237, 0, 0, 1, 1, 1,
1.407098, 0.5413878, 0.1016568, 1, 0, 0, 1, 1,
1.413998, 2.693209, -0.03460723, 1, 0, 0, 1, 1,
1.417296, 0.3270869, 3.618459, 1, 0, 0, 1, 1,
1.419182, 0.5597402, 0.3479432, 1, 0, 0, 1, 1,
1.422515, -0.08151998, 2.438274, 1, 0, 0, 1, 1,
1.431981, -0.8674796, 1.579506, 0, 0, 0, 1, 1,
1.43337, -0.6170163, 1.812459, 0, 0, 0, 1, 1,
1.43655, -0.4172812, 2.968272, 0, 0, 0, 1, 1,
1.441664, -1.415034, 2.104356, 0, 0, 0, 1, 1,
1.462841, -1.252283, 1.989976, 0, 0, 0, 1, 1,
1.471308, 0.02639507, 1.292206, 0, 0, 0, 1, 1,
1.476352, 0.3940518, 0.2585315, 0, 0, 0, 1, 1,
1.484547, -2.3846, 3.08501, 1, 1, 1, 1, 1,
1.48917, 1.218726, 0.7853043, 1, 1, 1, 1, 1,
1.489321, -0.4731345, 3.536198, 1, 1, 1, 1, 1,
1.496052, -0.3354309, 0.7115488, 1, 1, 1, 1, 1,
1.503521, -0.2611406, 1.455546, 1, 1, 1, 1, 1,
1.508372, -0.2776976, 1.933853, 1, 1, 1, 1, 1,
1.511192, 1.326492, 0.5674841, 1, 1, 1, 1, 1,
1.528219, -1.334696, 2.320167, 1, 1, 1, 1, 1,
1.534358, -0.3987039, 0.3111158, 1, 1, 1, 1, 1,
1.538931, 1.164104, -0.4163801, 1, 1, 1, 1, 1,
1.541071, 1.122018, 1.409404, 1, 1, 1, 1, 1,
1.571635, -0.8417317, 1.232806, 1, 1, 1, 1, 1,
1.580227, 1.918405, -0.5539868, 1, 1, 1, 1, 1,
1.585558, 0.2445205, 1.374009, 1, 1, 1, 1, 1,
1.5982, 0.6544744, 1.424346, 1, 1, 1, 1, 1,
1.631122, 0.3575672, 0.9215778, 0, 0, 1, 1, 1,
1.63404, 0.7179624, 1.534266, 1, 0, 0, 1, 1,
1.64547, 0.6815577, 1.166379, 1, 0, 0, 1, 1,
1.646342, 1.268433, 0.6997025, 1, 0, 0, 1, 1,
1.647196, -0.378758, 2.784047, 1, 0, 0, 1, 1,
1.651302, 0.7713245, 0.1705558, 1, 0, 0, 1, 1,
1.654773, -0.3484804, 0.5867186, 0, 0, 0, 1, 1,
1.660869, 2.69534, 0.6004754, 0, 0, 0, 1, 1,
1.664684, -1.018648, 1.946799, 0, 0, 0, 1, 1,
1.669263, 0.8028498, -0.8145664, 0, 0, 0, 1, 1,
1.705692, 0.05718247, 3.843219, 0, 0, 0, 1, 1,
1.71942, 0.8498273, 2.563322, 0, 0, 0, 1, 1,
1.719576, -2.570636, 2.708377, 0, 0, 0, 1, 1,
1.723715, -0.6106176, 1.661721, 1, 1, 1, 1, 1,
1.725384, 0.6080053, -0.915887, 1, 1, 1, 1, 1,
1.747805, 0.02441938, 1.966934, 1, 1, 1, 1, 1,
1.749817, 0.2342641, 1.330284, 1, 1, 1, 1, 1,
1.761316, -0.8069078, 1.056426, 1, 1, 1, 1, 1,
1.793874, 0.6966395, 0.1942817, 1, 1, 1, 1, 1,
1.797531, 0.5783854, 1.986995, 1, 1, 1, 1, 1,
1.806799, 1.515776, 0.7713237, 1, 1, 1, 1, 1,
1.825624, -0.2998481, 1.760548, 1, 1, 1, 1, 1,
1.846192, 1.22994, 2.393129, 1, 1, 1, 1, 1,
1.856623, -0.9104449, 4.118433, 1, 1, 1, 1, 1,
1.860904, 0.2981174, 0.4803423, 1, 1, 1, 1, 1,
1.861688, 1.106897, 0.2806933, 1, 1, 1, 1, 1,
1.887234, -1.1939, 1.47634, 1, 1, 1, 1, 1,
1.890314, -0.07400709, 2.257464, 1, 1, 1, 1, 1,
1.922198, -1.36058, 3.01859, 0, 0, 1, 1, 1,
2.006602, 1.006516, -1.111997, 1, 0, 0, 1, 1,
2.015226, -0.7143258, 0.6843362, 1, 0, 0, 1, 1,
2.028031, -1.80422, 3.029504, 1, 0, 0, 1, 1,
2.050332, -1.663311, 2.790493, 1, 0, 0, 1, 1,
2.070196, 0.3967282, 2.166318, 1, 0, 0, 1, 1,
2.278068, 0.3273651, 0.8158006, 0, 0, 0, 1, 1,
2.285205, -0.6498582, 0.7961468, 0, 0, 0, 1, 1,
2.38376, -0.1113208, 1.812158, 0, 0, 0, 1, 1,
2.436894, 1.083918, 0.6884683, 0, 0, 0, 1, 1,
2.46937, -0.04769742, 2.252733, 0, 0, 0, 1, 1,
2.537312, 1.81482, 0.9486851, 0, 0, 0, 1, 1,
2.541003, 0.5479681, 2.2145, 0, 0, 0, 1, 1,
2.547814, 0.6582519, 2.739874, 1, 1, 1, 1, 1,
2.642062, -1.023981, 5.27427, 1, 1, 1, 1, 1,
2.660769, -0.182443, 1.189543, 1, 1, 1, 1, 1,
2.666461, 0.04886102, 1.087775, 1, 1, 1, 1, 1,
2.914581, 0.7966379, 2.009051, 1, 1, 1, 1, 1,
3.20077, 1.016225, 2.88899, 1, 1, 1, 1, 1,
3.59844, 0.624501, 2.948222, 1, 1, 1, 1, 1
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
var radius = 10.10659;
var distance = 35.49897;
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
mvMatrix.translate( -0.3524207, 0.5329124, -0.008456945 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.49897);
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
