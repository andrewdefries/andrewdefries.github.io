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
-3.18105, -1.153878, -3.173036, 1, 0, 0, 1,
-2.950511, -0.4503396, -3.461432, 1, 0.007843138, 0, 1,
-2.643799, -0.5818346, 0.7661412, 1, 0.01176471, 0, 1,
-2.614337, 0.949734, -1.518624, 1, 0.01960784, 0, 1,
-2.493177, -0.469954, -2.954216, 1, 0.02352941, 0, 1,
-2.326912, -1.194375, -2.731613, 1, 0.03137255, 0, 1,
-2.31018, 1.101256, -0.5365601, 1, 0.03529412, 0, 1,
-2.214882, -0.1338118, 0.2459628, 1, 0.04313726, 0, 1,
-2.192169, -0.04805143, -0.9356528, 1, 0.04705882, 0, 1,
-2.187109, -0.4107831, -1.48883, 1, 0.05490196, 0, 1,
-2.176886, -0.4708403, -2.844139, 1, 0.05882353, 0, 1,
-2.154958, 0.2840231, 0.543641, 1, 0.06666667, 0, 1,
-2.137469, -1.086875, -2.375051, 1, 0.07058824, 0, 1,
-2.118124, 0.3415949, -2.613245, 1, 0.07843138, 0, 1,
-2.116614, -0.7368754, -3.323247, 1, 0.08235294, 0, 1,
-2.07232, -0.4667452, -1.442033, 1, 0.09019608, 0, 1,
-2.068385, 0.9486049, -1.545939, 1, 0.09411765, 0, 1,
-2.063401, -1.130578, -3.641603, 1, 0.1019608, 0, 1,
-1.950611, -0.1526873, 1.269222, 1, 0.1098039, 0, 1,
-1.907907, 0.1641677, -1.590205, 1, 0.1137255, 0, 1,
-1.906417, -2.216516, -3.592522, 1, 0.1215686, 0, 1,
-1.89519, -0.5322679, -2.956475, 1, 0.1254902, 0, 1,
-1.84505, 0.1679433, -1.856981, 1, 0.1333333, 0, 1,
-1.830828, 0.4327281, -3.916519, 1, 0.1372549, 0, 1,
-1.817337, 0.7819796, -1.315891, 1, 0.145098, 0, 1,
-1.813457, -2.41572, -2.658021, 1, 0.1490196, 0, 1,
-1.80702, -0.74345, -1.639605, 1, 0.1568628, 0, 1,
-1.790824, -0.718438, -1.001307, 1, 0.1607843, 0, 1,
-1.783672, -0.4882543, -2.509087, 1, 0.1686275, 0, 1,
-1.778425, 0.4463096, -0.6283643, 1, 0.172549, 0, 1,
-1.765785, -0.2608189, 0.4062493, 1, 0.1803922, 0, 1,
-1.749119, 0.106245, -1.280248, 1, 0.1843137, 0, 1,
-1.727305, -0.6201062, -1.072854, 1, 0.1921569, 0, 1,
-1.725657, -0.1806138, -2.188846, 1, 0.1960784, 0, 1,
-1.705858, -0.2390756, -2.405742, 1, 0.2039216, 0, 1,
-1.704793, 1.809727, -0.7990061, 1, 0.2117647, 0, 1,
-1.663424, -0.8384952, -1.585527, 1, 0.2156863, 0, 1,
-1.660071, -0.1916532, -0.1433196, 1, 0.2235294, 0, 1,
-1.65771, -0.5091546, -0.9297605, 1, 0.227451, 0, 1,
-1.657654, -0.02190448, -0.4438091, 1, 0.2352941, 0, 1,
-1.649923, -0.9500766, -1.679897, 1, 0.2392157, 0, 1,
-1.626273, -0.6615923, -1.205379, 1, 0.2470588, 0, 1,
-1.625388, -0.492145, -1.695199, 1, 0.2509804, 0, 1,
-1.624845, -0.2155398, -1.371386, 1, 0.2588235, 0, 1,
-1.609076, -1.682377, -1.900539, 1, 0.2627451, 0, 1,
-1.602363, 0.1020869, -1.167619, 1, 0.2705882, 0, 1,
-1.599768, 0.179398, -1.900832, 1, 0.2745098, 0, 1,
-1.598659, 0.4975221, -0.4943393, 1, 0.282353, 0, 1,
-1.598527, -0.258487, -0.475955, 1, 0.2862745, 0, 1,
-1.597717, -0.9444433, -2.272811, 1, 0.2941177, 0, 1,
-1.596392, -1.097178, -3.195004, 1, 0.3019608, 0, 1,
-1.591811, 1.33325, -0.6917931, 1, 0.3058824, 0, 1,
-1.585659, 1.559741, -0.4694451, 1, 0.3137255, 0, 1,
-1.568159, -0.2369095, -2.430395, 1, 0.3176471, 0, 1,
-1.567825, -1.04164, -3.570133, 1, 0.3254902, 0, 1,
-1.566743, 0.2257669, -0.97237, 1, 0.3294118, 0, 1,
-1.562966, -0.4600348, -2.334181, 1, 0.3372549, 0, 1,
-1.548021, 0.3172623, -2.100532, 1, 0.3411765, 0, 1,
-1.540314, 0.2889108, 0.2403078, 1, 0.3490196, 0, 1,
-1.533681, -0.6031618, 0.0164311, 1, 0.3529412, 0, 1,
-1.523921, -0.8240429, -2.817823, 1, 0.3607843, 0, 1,
-1.512996, -0.02755251, -0.1929392, 1, 0.3647059, 0, 1,
-1.511276, -0.9729335, -2.077033, 1, 0.372549, 0, 1,
-1.507844, 0.8977023, -0.5603899, 1, 0.3764706, 0, 1,
-1.504471, -0.7060756, -1.925527, 1, 0.3843137, 0, 1,
-1.501936, -0.5946192, -0.7910123, 1, 0.3882353, 0, 1,
-1.485736, -1.365745, -2.172271, 1, 0.3960784, 0, 1,
-1.478731, -0.5957827, -2.974302, 1, 0.4039216, 0, 1,
-1.477641, -0.5992686, -3.366246, 1, 0.4078431, 0, 1,
-1.442701, -0.9530659, -1.757378, 1, 0.4156863, 0, 1,
-1.44021, 0.6313711, -0.9785582, 1, 0.4196078, 0, 1,
-1.438568, -1.261775, -4.446051, 1, 0.427451, 0, 1,
-1.435348, 1.276496, 1.542539, 1, 0.4313726, 0, 1,
-1.410641, -1.361867, -2.255202, 1, 0.4392157, 0, 1,
-1.401518, 0.5669157, -0.934369, 1, 0.4431373, 0, 1,
-1.396595, 1.322202, 0.3083338, 1, 0.4509804, 0, 1,
-1.389827, 0.1419739, -2.564237, 1, 0.454902, 0, 1,
-1.376246, -0.9947364, -1.259832, 1, 0.4627451, 0, 1,
-1.373711, -1.487684, -2.858811, 1, 0.4666667, 0, 1,
-1.373435, 0.9772531, -0.8440619, 1, 0.4745098, 0, 1,
-1.372861, 1.038499, 0.6567152, 1, 0.4784314, 0, 1,
-1.372012, -2.031453, -2.163934, 1, 0.4862745, 0, 1,
-1.371204, 1.176356, -1.987496, 1, 0.4901961, 0, 1,
-1.369256, -0.6036199, -0.8469088, 1, 0.4980392, 0, 1,
-1.361585, 0.3353342, -0.593142, 1, 0.5058824, 0, 1,
-1.360826, 0.6488996, -1.013515, 1, 0.509804, 0, 1,
-1.359083, -0.4255417, -2.052612, 1, 0.5176471, 0, 1,
-1.351059, 0.01950829, -2.221356, 1, 0.5215687, 0, 1,
-1.350688, -0.4056198, -1.631224, 1, 0.5294118, 0, 1,
-1.332249, 1.72417, -1.777022, 1, 0.5333334, 0, 1,
-1.329642, 0.6191347, -1.336026, 1, 0.5411765, 0, 1,
-1.324699, -0.80805, -2.772596, 1, 0.5450981, 0, 1,
-1.324171, -0.23453, -1.851022, 1, 0.5529412, 0, 1,
-1.323031, 2.056614, -0.07851945, 1, 0.5568628, 0, 1,
-1.322929, -0.1576177, -1.384026, 1, 0.5647059, 0, 1,
-1.322218, -0.06851798, -3.072371, 1, 0.5686275, 0, 1,
-1.317343, 1.471542, -0.316563, 1, 0.5764706, 0, 1,
-1.304106, -1.166728, -4.270413, 1, 0.5803922, 0, 1,
-1.302355, 1.109864, -1.036244, 1, 0.5882353, 0, 1,
-1.297543, -1.030876, -1.242999, 1, 0.5921569, 0, 1,
-1.296661, 0.3952827, -0.6339822, 1, 0.6, 0, 1,
-1.292099, -0.4555943, -3.206896, 1, 0.6078432, 0, 1,
-1.290394, -0.09627682, 0.005199471, 1, 0.6117647, 0, 1,
-1.288953, 0.1651446, -1.601202, 1, 0.6196079, 0, 1,
-1.277614, -0.276889, -1.484553, 1, 0.6235294, 0, 1,
-1.276556, -0.0884795, -1.894325, 1, 0.6313726, 0, 1,
-1.274467, -2.066543, -2.670909, 1, 0.6352941, 0, 1,
-1.26662, 0.4967743, -1.664253, 1, 0.6431373, 0, 1,
-1.26515, 0.2747568, -0.9687092, 1, 0.6470588, 0, 1,
-1.261067, 0.7563081, -1.591828, 1, 0.654902, 0, 1,
-1.254296, -2.096284, -1.951548, 1, 0.6588235, 0, 1,
-1.251462, 1.431006, -0.8333259, 1, 0.6666667, 0, 1,
-1.249292, 0.3865028, -2.251061, 1, 0.6705883, 0, 1,
-1.24716, 0.625167, 0.7539083, 1, 0.6784314, 0, 1,
-1.24623, 0.8536083, -1.335423, 1, 0.682353, 0, 1,
-1.244794, -1.506837, -1.177741, 1, 0.6901961, 0, 1,
-1.24274, -1.713875, -2.505613, 1, 0.6941177, 0, 1,
-1.242089, -0.1559067, -0.9054979, 1, 0.7019608, 0, 1,
-1.240935, -0.3660157, -3.509778, 1, 0.7098039, 0, 1,
-1.239574, 0.5439145, -1.598161, 1, 0.7137255, 0, 1,
-1.238166, -1.290066, -2.939692, 1, 0.7215686, 0, 1,
-1.229605, 0.0338125, -1.332986, 1, 0.7254902, 0, 1,
-1.211592, 1.186707, -0.8670155, 1, 0.7333333, 0, 1,
-1.192486, 1.21557, -1.483285, 1, 0.7372549, 0, 1,
-1.190089, -0.6647344, -3.74687, 1, 0.7450981, 0, 1,
-1.188911, 0.502059, -1.314192, 1, 0.7490196, 0, 1,
-1.183291, 1.420547, -0.789391, 1, 0.7568628, 0, 1,
-1.182708, 0.01833123, -1.208096, 1, 0.7607843, 0, 1,
-1.181821, -2.094392, -2.468246, 1, 0.7686275, 0, 1,
-1.16894, -2.192991, -2.968328, 1, 0.772549, 0, 1,
-1.166391, 2.381667, 0.6364598, 1, 0.7803922, 0, 1,
-1.163494, 1.569931, -0.3418438, 1, 0.7843137, 0, 1,
-1.162538, 1.842624, -1.275308, 1, 0.7921569, 0, 1,
-1.161002, 0.1284949, -0.9219984, 1, 0.7960784, 0, 1,
-1.158254, 1.554754, -2.299579, 1, 0.8039216, 0, 1,
-1.157922, 0.2038393, -2.136586, 1, 0.8117647, 0, 1,
-1.157517, -0.3279567, -1.542183, 1, 0.8156863, 0, 1,
-1.156882, -1.027777, -1.727649, 1, 0.8235294, 0, 1,
-1.154281, -1.02524, -2.729855, 1, 0.827451, 0, 1,
-1.143345, 0.2544393, -1.454305, 1, 0.8352941, 0, 1,
-1.13667, -0.5995231, -0.6598556, 1, 0.8392157, 0, 1,
-1.1355, -0.1585044, -2.785964, 1, 0.8470588, 0, 1,
-1.129838, -1.663822, -0.9158359, 1, 0.8509804, 0, 1,
-1.124518, 0.4469688, -0.9648795, 1, 0.8588235, 0, 1,
-1.121838, -0.8879798, -1.613081, 1, 0.8627451, 0, 1,
-1.119942, 2.25587, -1.111913, 1, 0.8705882, 0, 1,
-1.105945, -1.003174, -1.372242, 1, 0.8745098, 0, 1,
-1.097079, 0.7036066, -2.077858, 1, 0.8823529, 0, 1,
-1.095176, -0.1476444, -1.361557, 1, 0.8862745, 0, 1,
-1.085898, 1.212166, -0.3729445, 1, 0.8941177, 0, 1,
-1.072477, 1.971689, -2.006307, 1, 0.8980392, 0, 1,
-1.071807, -0.6700053, -1.134087, 1, 0.9058824, 0, 1,
-1.062258, -0.8942252, -3.241302, 1, 0.9137255, 0, 1,
-1.061069, 0.7257921, 2.307035, 1, 0.9176471, 0, 1,
-1.060425, -0.7802047, -1.774946, 1, 0.9254902, 0, 1,
-1.05789, -0.947289, -1.640385, 1, 0.9294118, 0, 1,
-1.05372, 1.312759, -0.05350147, 1, 0.9372549, 0, 1,
-1.050373, 0.4579915, -0.4315131, 1, 0.9411765, 0, 1,
-1.047791, -0.6472402, -1.582429, 1, 0.9490196, 0, 1,
-1.046997, -1.231459, -2.886148, 1, 0.9529412, 0, 1,
-1.039134, 0.5824738, 0.07499859, 1, 0.9607843, 0, 1,
-1.017228, 1.058193, -2.072927, 1, 0.9647059, 0, 1,
-1.00869, 1.339977, -0.7863379, 1, 0.972549, 0, 1,
-1.007173, 0.8566143, -0.1507259, 1, 0.9764706, 0, 1,
-1.001251, 0.3621696, -1.014437, 1, 0.9843137, 0, 1,
-0.993401, 0.2027275, -0.5796961, 1, 0.9882353, 0, 1,
-0.9865215, 0.4292953, -0.6072271, 1, 0.9960784, 0, 1,
-0.9849871, -0.8825034, -2.338181, 0.9960784, 1, 0, 1,
-0.9797707, 1.099279, -0.631158, 0.9921569, 1, 0, 1,
-0.9772742, 0.7258983, -0.7841747, 0.9843137, 1, 0, 1,
-0.9767637, 1.947747, -1.200266, 0.9803922, 1, 0, 1,
-0.976522, 0.2367048, -1.508092, 0.972549, 1, 0, 1,
-0.9603338, 0.9495888, 0.3642648, 0.9686275, 1, 0, 1,
-0.9600487, -0.07672492, -1.553691, 0.9607843, 1, 0, 1,
-0.9497709, -0.9435571, -2.100709, 0.9568627, 1, 0, 1,
-0.9490042, -0.1511352, -1.001134, 0.9490196, 1, 0, 1,
-0.9417515, -0.4303274, -2.336632, 0.945098, 1, 0, 1,
-0.9378312, -0.1151816, -2.461575, 0.9372549, 1, 0, 1,
-0.9262393, -0.2982642, -1.443619, 0.9333333, 1, 0, 1,
-0.9250647, 1.942312, 1.197298, 0.9254902, 1, 0, 1,
-0.9213607, -0.2072387, -1.613087, 0.9215686, 1, 0, 1,
-0.9184116, 0.2592113, -2.594197, 0.9137255, 1, 0, 1,
-0.9118878, -0.06622602, -0.2467861, 0.9098039, 1, 0, 1,
-0.9088548, 0.7493086, -0.4424096, 0.9019608, 1, 0, 1,
-0.9079266, 1.268587, 0.6127017, 0.8941177, 1, 0, 1,
-0.8999546, -0.2718172, -1.793798, 0.8901961, 1, 0, 1,
-0.8969921, -1.214885, -4.232053, 0.8823529, 1, 0, 1,
-0.8967975, -0.208035, -2.255338, 0.8784314, 1, 0, 1,
-0.8880184, -0.5500718, -1.615196, 0.8705882, 1, 0, 1,
-0.8869226, 0.2531889, -2.663866, 0.8666667, 1, 0, 1,
-0.8847597, -0.588263, -1.802665, 0.8588235, 1, 0, 1,
-0.8806385, -2.656852, -3.08686, 0.854902, 1, 0, 1,
-0.8794236, 0.4951834, -1.589177, 0.8470588, 1, 0, 1,
-0.8781153, -1.162528, -2.701335, 0.8431373, 1, 0, 1,
-0.8775824, -0.451784, -0.06198825, 0.8352941, 1, 0, 1,
-0.8727052, -0.5787249, -0.941107, 0.8313726, 1, 0, 1,
-0.8645573, 0.4703639, 0.3596684, 0.8235294, 1, 0, 1,
-0.851602, -0.6148228, -2.584847, 0.8196079, 1, 0, 1,
-0.8433906, -0.6072358, -2.77522, 0.8117647, 1, 0, 1,
-0.8314732, -0.4155401, -3.452968, 0.8078431, 1, 0, 1,
-0.8308201, -0.5183553, -4.872775, 0.8, 1, 0, 1,
-0.829722, -0.2332512, -2.774565, 0.7921569, 1, 0, 1,
-0.8214963, -0.9310618, -3.005522, 0.7882353, 1, 0, 1,
-0.8189752, 0.1025662, -0.9926085, 0.7803922, 1, 0, 1,
-0.8160599, -1.063971, -2.86658, 0.7764706, 1, 0, 1,
-0.8120413, 1.166014, -1.201787, 0.7686275, 1, 0, 1,
-0.8113539, -1.256488, -2.533962, 0.7647059, 1, 0, 1,
-0.8078153, 2.306639, -0.8157189, 0.7568628, 1, 0, 1,
-0.8076271, 1.192132, -1.36074, 0.7529412, 1, 0, 1,
-0.8067433, -0.8676191, -1.961144, 0.7450981, 1, 0, 1,
-0.8031779, 0.9301233, 0.499805, 0.7411765, 1, 0, 1,
-0.8016879, -1.496711, -2.181461, 0.7333333, 1, 0, 1,
-0.7915897, -1.4748, -2.36289, 0.7294118, 1, 0, 1,
-0.7815311, 1.332378, -0.08043934, 0.7215686, 1, 0, 1,
-0.7732077, -1.73633, -3.969584, 0.7176471, 1, 0, 1,
-0.7719388, 0.1380825, -0.9881147, 0.7098039, 1, 0, 1,
-0.7683544, 1.337659, -2.744145, 0.7058824, 1, 0, 1,
-0.7662855, 0.6892554, 1.758605, 0.6980392, 1, 0, 1,
-0.7643579, -0.8176584, -2.577209, 0.6901961, 1, 0, 1,
-0.7559385, -0.7333561, -2.698796, 0.6862745, 1, 0, 1,
-0.7535202, 1.422862, 0.5427783, 0.6784314, 1, 0, 1,
-0.7470735, -1.670795, -4.294349, 0.6745098, 1, 0, 1,
-0.7417663, 0.5681277, -2.515719, 0.6666667, 1, 0, 1,
-0.7384759, -0.219127, -1.699725, 0.6627451, 1, 0, 1,
-0.7378371, 1.066439, 0.0672544, 0.654902, 1, 0, 1,
-0.7374235, 1.203711, -0.853962, 0.6509804, 1, 0, 1,
-0.733513, 0.6788828, -0.6913216, 0.6431373, 1, 0, 1,
-0.7329454, 0.6761467, -0.6083292, 0.6392157, 1, 0, 1,
-0.7293662, 1.613451, 0.8034247, 0.6313726, 1, 0, 1,
-0.7280853, -0.5861258, -0.8903685, 0.627451, 1, 0, 1,
-0.7279915, 0.8843488, -0.8383039, 0.6196079, 1, 0, 1,
-0.7272888, -0.9530748, -2.202652, 0.6156863, 1, 0, 1,
-0.72357, -0.7073486, -2.847425, 0.6078432, 1, 0, 1,
-0.7137401, -1.029056, -2.015568, 0.6039216, 1, 0, 1,
-0.7136685, -2.368203, -2.457182, 0.5960785, 1, 0, 1,
-0.7134764, -0.002528601, -1.749249, 0.5882353, 1, 0, 1,
-0.7126795, -0.4295103, -1.424934, 0.5843138, 1, 0, 1,
-0.7115744, -0.6659415, -1.529746, 0.5764706, 1, 0, 1,
-0.710082, -2.008116, -2.057745, 0.572549, 1, 0, 1,
-0.7095505, -1.719318, -1.405599, 0.5647059, 1, 0, 1,
-0.7082317, 0.2802227, 0.2422239, 0.5607843, 1, 0, 1,
-0.7073098, 2.962806, 0.4796064, 0.5529412, 1, 0, 1,
-0.7042459, -0.6175352, -2.355361, 0.5490196, 1, 0, 1,
-0.7014624, 1.338524, -0.2427877, 0.5411765, 1, 0, 1,
-0.7001536, 0.2527237, -0.7939824, 0.5372549, 1, 0, 1,
-0.6999459, -0.3324613, -2.216699, 0.5294118, 1, 0, 1,
-0.6992981, 1.023378, 0.810453, 0.5254902, 1, 0, 1,
-0.6981381, -1.338228, -2.273765, 0.5176471, 1, 0, 1,
-0.6948153, -0.09533952, -3.187566, 0.5137255, 1, 0, 1,
-0.6861217, -1.058475, -3.190764, 0.5058824, 1, 0, 1,
-0.6835005, 0.4781237, -1.940753, 0.5019608, 1, 0, 1,
-0.6818169, -0.01662762, -1.861769, 0.4941176, 1, 0, 1,
-0.6817521, 0.4066883, 0.2028284, 0.4862745, 1, 0, 1,
-0.6802214, 0.3860446, -0.0002956956, 0.4823529, 1, 0, 1,
-0.6732591, -1.646073, -1.498864, 0.4745098, 1, 0, 1,
-0.6724931, -0.1753299, -0.04526355, 0.4705882, 1, 0, 1,
-0.6710591, -1.16995, -3.091528, 0.4627451, 1, 0, 1,
-0.6691628, 0.2201749, -2.109074, 0.4588235, 1, 0, 1,
-0.6647115, 1.484493, -0.4272204, 0.4509804, 1, 0, 1,
-0.6632999, 0.3237109, -0.3360395, 0.4470588, 1, 0, 1,
-0.6581161, 1.317173, 0.9788807, 0.4392157, 1, 0, 1,
-0.6501413, 0.03441692, -1.53264, 0.4352941, 1, 0, 1,
-0.6484807, -1.563981, -2.563428, 0.427451, 1, 0, 1,
-0.6451816, -0.2183048, -1.175267, 0.4235294, 1, 0, 1,
-0.6413391, -0.781812, -0.9939048, 0.4156863, 1, 0, 1,
-0.639319, -0.6088655, -3.041817, 0.4117647, 1, 0, 1,
-0.6370436, 1.320701, -0.07910863, 0.4039216, 1, 0, 1,
-0.6316409, 2.815425, -1.65832, 0.3960784, 1, 0, 1,
-0.6306359, 1.317906, -1.718187, 0.3921569, 1, 0, 1,
-0.6299641, -0.8603926, -2.496691, 0.3843137, 1, 0, 1,
-0.6287414, -1.521204, -3.365997, 0.3803922, 1, 0, 1,
-0.6270767, 0.450047, -1.694041, 0.372549, 1, 0, 1,
-0.6208106, -0.6710359, -0.3506119, 0.3686275, 1, 0, 1,
-0.6207554, 0.02089818, 0.2746128, 0.3607843, 1, 0, 1,
-0.6155447, -2.332337, -0.8032762, 0.3568628, 1, 0, 1,
-0.6152481, -1.102354, -0.7339374, 0.3490196, 1, 0, 1,
-0.6140171, 1.901696, -2.059226, 0.345098, 1, 0, 1,
-0.6053926, -0.7102737, -1.03516, 0.3372549, 1, 0, 1,
-0.5943406, -1.311853, -4.792146, 0.3333333, 1, 0, 1,
-0.594027, -0.3652306, -2.21427, 0.3254902, 1, 0, 1,
-0.592485, 0.712634, -1.848183, 0.3215686, 1, 0, 1,
-0.5897401, -0.6939631, -1.323728, 0.3137255, 1, 0, 1,
-0.5852434, 0.2959482, -0.8664598, 0.3098039, 1, 0, 1,
-0.5850976, 0.4198613, -0.6789727, 0.3019608, 1, 0, 1,
-0.584999, 1.420899, -0.3884756, 0.2941177, 1, 0, 1,
-0.5819694, -0.7822756, -2.690413, 0.2901961, 1, 0, 1,
-0.579881, 0.8673151, -3.947275, 0.282353, 1, 0, 1,
-0.5792127, -1.984732, -3.372671, 0.2784314, 1, 0, 1,
-0.5748215, -0.4563563, -2.534648, 0.2705882, 1, 0, 1,
-0.5725035, -2.363276, -3.970183, 0.2666667, 1, 0, 1,
-0.5714679, -0.8114253, -2.718997, 0.2588235, 1, 0, 1,
-0.5694605, 1.390574, 1.713218, 0.254902, 1, 0, 1,
-0.5691489, -0.9065974, -1.422034, 0.2470588, 1, 0, 1,
-0.5687223, 1.107864, 0.4212103, 0.2431373, 1, 0, 1,
-0.5613624, 0.9028527, 0.8091893, 0.2352941, 1, 0, 1,
-0.554621, -2.174567, -2.827805, 0.2313726, 1, 0, 1,
-0.5529191, -0.9559761, -3.181417, 0.2235294, 1, 0, 1,
-0.551546, 0.03641511, -2.147514, 0.2196078, 1, 0, 1,
-0.5490945, 0.4692747, -0.9975407, 0.2117647, 1, 0, 1,
-0.545231, 0.2079426, -1.499336, 0.2078431, 1, 0, 1,
-0.5413056, 0.5189431, -1.331727, 0.2, 1, 0, 1,
-0.5380611, 0.8617653, 0.9598476, 0.1921569, 1, 0, 1,
-0.5364041, 0.6560469, 0.6155205, 0.1882353, 1, 0, 1,
-0.5272771, 0.2471289, -2.489592, 0.1803922, 1, 0, 1,
-0.5211261, 0.5766929, -0.2719014, 0.1764706, 1, 0, 1,
-0.5195158, 0.4079009, -0.6666883, 0.1686275, 1, 0, 1,
-0.5182248, 0.253272, -1.025687, 0.1647059, 1, 0, 1,
-0.5172408, -1.250217, -3.859056, 0.1568628, 1, 0, 1,
-0.5163526, -0.6120269, -2.776866, 0.1529412, 1, 0, 1,
-0.513186, 0.2015888, -2.19022, 0.145098, 1, 0, 1,
-0.5119141, -0.8461863, -2.78552, 0.1411765, 1, 0, 1,
-0.5102527, -0.7654961, -1.060989, 0.1333333, 1, 0, 1,
-0.5101233, 1.281595, -1.952666, 0.1294118, 1, 0, 1,
-0.5088024, -0.8764801, -2.946203, 0.1215686, 1, 0, 1,
-0.5022668, -0.06721257, -2.979057, 0.1176471, 1, 0, 1,
-0.49733, 0.7887954, -0.4064328, 0.1098039, 1, 0, 1,
-0.4969035, 0.9889088, -0.6215659, 0.1058824, 1, 0, 1,
-0.4968246, -0.4933195, -1.864342, 0.09803922, 1, 0, 1,
-0.4964808, -0.4583034, -1.987084, 0.09019608, 1, 0, 1,
-0.4924571, 1.493311, 0.1433289, 0.08627451, 1, 0, 1,
-0.4919259, 0.3571981, -0.7546698, 0.07843138, 1, 0, 1,
-0.4886363, 0.4316649, -1.431869, 0.07450981, 1, 0, 1,
-0.4798948, -0.1132944, -0.4065858, 0.06666667, 1, 0, 1,
-0.4797851, -1.333738, -2.896939, 0.0627451, 1, 0, 1,
-0.4707459, 0.3255357, -0.7457353, 0.05490196, 1, 0, 1,
-0.4702817, 0.2460157, 0.1433728, 0.05098039, 1, 0, 1,
-0.4670624, 1.013915, 0.6969569, 0.04313726, 1, 0, 1,
-0.4655082, -0.1754851, -1.404209, 0.03921569, 1, 0, 1,
-0.4628458, -0.08441677, -0.6343576, 0.03137255, 1, 0, 1,
-0.462371, -0.6294427, -1.763787, 0.02745098, 1, 0, 1,
-0.4600981, 0.2403217, -2.286249, 0.01960784, 1, 0, 1,
-0.4569891, -1.832727, -3.896485, 0.01568628, 1, 0, 1,
-0.4555657, 0.9402986, 0.5401924, 0.007843138, 1, 0, 1,
-0.4553882, 1.403851, 0.3393307, 0.003921569, 1, 0, 1,
-0.4502926, 0.7954807, -0.6632614, 0, 1, 0.003921569, 1,
-0.4492999, -0.1277122, -1.102486, 0, 1, 0.01176471, 1,
-0.4464505, 0.2876537, -1.811596, 0, 1, 0.01568628, 1,
-0.4444528, 0.702794, 0.9456478, 0, 1, 0.02352941, 1,
-0.4311113, -0.4969388, -2.005863, 0, 1, 0.02745098, 1,
-0.4269719, -0.9606758, -4.177652, 0, 1, 0.03529412, 1,
-0.4246996, -0.5225412, -3.348578, 0, 1, 0.03921569, 1,
-0.4215889, -1.602305, -3.022826, 0, 1, 0.04705882, 1,
-0.4204413, 0.4884565, -0.1118363, 0, 1, 0.05098039, 1,
-0.4192386, 1.952857, 0.3330934, 0, 1, 0.05882353, 1,
-0.4168258, -0.621979, -3.180762, 0, 1, 0.0627451, 1,
-0.4150913, -0.7993972, -3.918326, 0, 1, 0.07058824, 1,
-0.4139232, -0.2564534, -2.563976, 0, 1, 0.07450981, 1,
-0.4036082, 1.123636, -0.1928446, 0, 1, 0.08235294, 1,
-0.3994848, 2.551049, 0.3644589, 0, 1, 0.08627451, 1,
-0.3921434, 0.1816932, -0.009753181, 0, 1, 0.09411765, 1,
-0.3910263, -0.4923374, -2.505203, 0, 1, 0.1019608, 1,
-0.3891762, 1.429694, 0.5865112, 0, 1, 0.1058824, 1,
-0.3878278, -0.6268863, -1.473077, 0, 1, 0.1137255, 1,
-0.387006, -0.1000666, -2.911635, 0, 1, 0.1176471, 1,
-0.3846592, -0.6503493, -3.365585, 0, 1, 0.1254902, 1,
-0.3762765, -1.213378, -2.310316, 0, 1, 0.1294118, 1,
-0.3737794, 0.7082549, -1.684955, 0, 1, 0.1372549, 1,
-0.3713688, 0.6542653, 0.2837346, 0, 1, 0.1411765, 1,
-0.3710472, 0.2144971, -1.203375, 0, 1, 0.1490196, 1,
-0.3659156, -0.275801, -0.6508811, 0, 1, 0.1529412, 1,
-0.3648895, 1.290698, -0.5285526, 0, 1, 0.1607843, 1,
-0.3615192, -0.927089, -3.172537, 0, 1, 0.1647059, 1,
-0.3598806, 0.09313887, -2.68915, 0, 1, 0.172549, 1,
-0.359486, -1.22975, -3.704975, 0, 1, 0.1764706, 1,
-0.3547199, -1.046522, -4.576651, 0, 1, 0.1843137, 1,
-0.3538198, -0.5840756, -1.47206, 0, 1, 0.1882353, 1,
-0.3537993, 1.790346, -1.714825, 0, 1, 0.1960784, 1,
-0.353633, -0.5005424, -3.105352, 0, 1, 0.2039216, 1,
-0.352087, 1.558408, 0.4437692, 0, 1, 0.2078431, 1,
-0.3515395, -1.041745, -3.557626, 0, 1, 0.2156863, 1,
-0.3394855, 0.1265507, -1.769696, 0, 1, 0.2196078, 1,
-0.3393393, 0.9179248, -1.345734, 0, 1, 0.227451, 1,
-0.3349193, -1.403595, -1.885189, 0, 1, 0.2313726, 1,
-0.3337766, -1.900562, -3.366587, 0, 1, 0.2392157, 1,
-0.3314541, 0.3730643, 0.7545257, 0, 1, 0.2431373, 1,
-0.3309429, 0.9747411, -0.8329042, 0, 1, 0.2509804, 1,
-0.3295924, 0.3127117, -1.930414, 0, 1, 0.254902, 1,
-0.3286817, 0.9390475, -1.991539, 0, 1, 0.2627451, 1,
-0.3255514, 1.572586, -0.5558523, 0, 1, 0.2666667, 1,
-0.3156402, 0.3650458, -0.6723948, 0, 1, 0.2745098, 1,
-0.3115201, -0.3937579, -1.662175, 0, 1, 0.2784314, 1,
-0.3113168, -0.5251448, -1.928844, 0, 1, 0.2862745, 1,
-0.3072769, -0.88936, -2.417872, 0, 1, 0.2901961, 1,
-0.3048503, -1.240501, -2.344741, 0, 1, 0.2980392, 1,
-0.3031809, 0.5197291, -1.092301, 0, 1, 0.3058824, 1,
-0.3010994, -1.811885, -3.053751, 0, 1, 0.3098039, 1,
-0.2960636, 1.348918, 0.07103954, 0, 1, 0.3176471, 1,
-0.2959959, -0.531634, -2.725202, 0, 1, 0.3215686, 1,
-0.2942979, -0.8091599, -3.821739, 0, 1, 0.3294118, 1,
-0.2892341, -0.5439928, -4.277744, 0, 1, 0.3333333, 1,
-0.2865761, 0.9297684, -1.811873, 0, 1, 0.3411765, 1,
-0.2858037, -0.3602332, -1.385675, 0, 1, 0.345098, 1,
-0.2838565, -0.9186503, -2.819545, 0, 1, 0.3529412, 1,
-0.2795325, 1.237153, 0.7936929, 0, 1, 0.3568628, 1,
-0.2789362, 0.2389183, -0.4389207, 0, 1, 0.3647059, 1,
-0.2767314, -0.5421634, -1.690624, 0, 1, 0.3686275, 1,
-0.2723099, 0.3735515, -0.5471902, 0, 1, 0.3764706, 1,
-0.2684487, -0.8215225, -1.932547, 0, 1, 0.3803922, 1,
-0.2676037, -0.4985483, -1.401811, 0, 1, 0.3882353, 1,
-0.265209, 0.06665213, -1.588545, 0, 1, 0.3921569, 1,
-0.2645292, 1.399611, 0.7548218, 0, 1, 0.4, 1,
-0.2629184, -1.037738, -2.789199, 0, 1, 0.4078431, 1,
-0.2618856, -0.875266, -3.155417, 0, 1, 0.4117647, 1,
-0.260455, -0.1239482, -1.441739, 0, 1, 0.4196078, 1,
-0.2595862, 1.064826, 0.5056664, 0, 1, 0.4235294, 1,
-0.2570418, 1.25372, -1.006893, 0, 1, 0.4313726, 1,
-0.2570282, -0.2256523, -2.369852, 0, 1, 0.4352941, 1,
-0.2540907, -0.3814015, -1.951577, 0, 1, 0.4431373, 1,
-0.2510136, -0.4818552, -3.020722, 0, 1, 0.4470588, 1,
-0.249236, 1.378514, -0.1331869, 0, 1, 0.454902, 1,
-0.2458178, -1.342789, -2.069471, 0, 1, 0.4588235, 1,
-0.2438229, 0.4591511, 0.6157578, 0, 1, 0.4666667, 1,
-0.2429933, -1.606877, -2.319377, 0, 1, 0.4705882, 1,
-0.2424716, -0.8450532, -2.606353, 0, 1, 0.4784314, 1,
-0.239885, -0.9291889, -2.486994, 0, 1, 0.4823529, 1,
-0.2369111, 0.7049736, -0.475425, 0, 1, 0.4901961, 1,
-0.2343782, 0.1651212, -1.304268, 0, 1, 0.4941176, 1,
-0.2342346, 0.6992797, -0.8335452, 0, 1, 0.5019608, 1,
-0.229258, -0.7113506, -1.182836, 0, 1, 0.509804, 1,
-0.2173379, 0.481187, -1.076963, 0, 1, 0.5137255, 1,
-0.214495, 0.5034407, -0.3342404, 0, 1, 0.5215687, 1,
-0.2125404, -2.220824, -1.343162, 0, 1, 0.5254902, 1,
-0.2116781, 0.3912976, -0.2186986, 0, 1, 0.5333334, 1,
-0.2099157, 0.8730753, -1.726652, 0, 1, 0.5372549, 1,
-0.2089068, -0.1316693, -1.402504, 0, 1, 0.5450981, 1,
-0.2061646, -0.2783583, -1.309793, 0, 1, 0.5490196, 1,
-0.2060609, -2.249066, -0.683699, 0, 1, 0.5568628, 1,
-0.2002029, -0.3088681, -2.369604, 0, 1, 0.5607843, 1,
-0.1982043, -0.8253278, -2.84037, 0, 1, 0.5686275, 1,
-0.1945489, -0.03132027, -2.497168, 0, 1, 0.572549, 1,
-0.1906511, 0.3832972, -0.1817178, 0, 1, 0.5803922, 1,
-0.1896007, -0.1355779, -1.760186, 0, 1, 0.5843138, 1,
-0.1760547, 0.4620866, -0.6536644, 0, 1, 0.5921569, 1,
-0.1734295, -0.1271139, -2.273733, 0, 1, 0.5960785, 1,
-0.1714169, 0.533334, 0.3532681, 0, 1, 0.6039216, 1,
-0.1645014, -1.588209, -2.544385, 0, 1, 0.6117647, 1,
-0.162403, 0.9481601, -0.8294494, 0, 1, 0.6156863, 1,
-0.1588285, 0.3267483, -1.771683, 0, 1, 0.6235294, 1,
-0.1560962, -0.9667353, -2.655421, 0, 1, 0.627451, 1,
-0.1555555, -0.7665981, -2.27636, 0, 1, 0.6352941, 1,
-0.1545346, -0.4726987, -1.315915, 0, 1, 0.6392157, 1,
-0.1475277, 1.182678, -0.3309953, 0, 1, 0.6470588, 1,
-0.1467439, -0.2567163, -3.787871, 0, 1, 0.6509804, 1,
-0.1464947, -0.9731605, -1.312435, 0, 1, 0.6588235, 1,
-0.1435313, 0.04702596, -1.020512, 0, 1, 0.6627451, 1,
-0.141295, 0.1461849, -0.3197159, 0, 1, 0.6705883, 1,
-0.1362224, 1.188158, 1.5357, 0, 1, 0.6745098, 1,
-0.1361476, 1.805111, 0.1025119, 0, 1, 0.682353, 1,
-0.1334987, 0.1659628, -2.228438, 0, 1, 0.6862745, 1,
-0.1325138, -0.0952104, -1.862564, 0, 1, 0.6941177, 1,
-0.1245167, 2.010895, 0.5811369, 0, 1, 0.7019608, 1,
-0.1240286, 0.9098711, -1.540751, 0, 1, 0.7058824, 1,
-0.120927, -0.2361118, -0.5604538, 0, 1, 0.7137255, 1,
-0.1138756, 0.961962, -1.453832, 0, 1, 0.7176471, 1,
-0.1106726, 0.5361305, 0.3892389, 0, 1, 0.7254902, 1,
-0.1098033, 0.9825967, -1.378318, 0, 1, 0.7294118, 1,
-0.1050005, 0.3723491, -0.6244903, 0, 1, 0.7372549, 1,
-0.1032174, -0.3427478, -3.38671, 0, 1, 0.7411765, 1,
-0.09887793, 2.60941, -0.2453581, 0, 1, 0.7490196, 1,
-0.09870898, 1.375707, 1.690654, 0, 1, 0.7529412, 1,
-0.09747181, 1.534196, -0.1368557, 0, 1, 0.7607843, 1,
-0.0966251, -0.5807395, -3.762318, 0, 1, 0.7647059, 1,
-0.09636469, 1.382757, -1.934386, 0, 1, 0.772549, 1,
-0.09484828, -0.2693163, -4.084234, 0, 1, 0.7764706, 1,
-0.09464067, -0.2888457, -1.866876, 0, 1, 0.7843137, 1,
-0.09412276, -1.719751, -2.458307, 0, 1, 0.7882353, 1,
-0.09361443, 1.435102, -1.758896, 0, 1, 0.7960784, 1,
-0.09072436, 0.3472472, 1.370514, 0, 1, 0.8039216, 1,
-0.09047961, 0.5185677, -0.4317468, 0, 1, 0.8078431, 1,
-0.08753452, -0.8818601, -3.508815, 0, 1, 0.8156863, 1,
-0.08432788, 2.020846, 2.556058, 0, 1, 0.8196079, 1,
-0.07950919, -0.6365838, -4.349993, 0, 1, 0.827451, 1,
-0.07636065, 1.15241, -1.244824, 0, 1, 0.8313726, 1,
-0.07505036, -0.9978237, -4.639906, 0, 1, 0.8392157, 1,
-0.07409985, 0.164831, -0.9276326, 0, 1, 0.8431373, 1,
-0.07237061, 0.2722339, -0.5802292, 0, 1, 0.8509804, 1,
-0.06297453, -0.8518387, -2.276898, 0, 1, 0.854902, 1,
-0.06139638, 1.36113, -1.060136, 0, 1, 0.8627451, 1,
-0.05882787, -1.103134, -3.226243, 0, 1, 0.8666667, 1,
-0.05747587, 0.4055295, 1.499496, 0, 1, 0.8745098, 1,
-0.05717043, -0.09963746, -3.412712, 0, 1, 0.8784314, 1,
-0.05543145, -0.8536807, -3.981653, 0, 1, 0.8862745, 1,
-0.05376043, -1.1505, -1.324556, 0, 1, 0.8901961, 1,
-0.0532706, 0.4354145, -0.2003124, 0, 1, 0.8980392, 1,
-0.04942336, 0.006556332, -2.180614, 0, 1, 0.9058824, 1,
-0.04721484, -1.491209, -3.459124, 0, 1, 0.9098039, 1,
-0.04604039, 0.6765333, 0.9801547, 0, 1, 0.9176471, 1,
-0.04351149, 1.066169, -0.05928738, 0, 1, 0.9215686, 1,
-0.03718653, -2.818727, -4.194271, 0, 1, 0.9294118, 1,
-0.03322644, 0.1142801, 0.7150983, 0, 1, 0.9333333, 1,
-0.03296273, 0.6369655, 1.566492, 0, 1, 0.9411765, 1,
-0.03107665, -0.2519698, -1.8288, 0, 1, 0.945098, 1,
-0.02954823, 0.4074583, -1.039594, 0, 1, 0.9529412, 1,
-0.02847765, -0.353269, -4.220574, 0, 1, 0.9568627, 1,
-0.02417208, 0.2455344, 0.08981802, 0, 1, 0.9647059, 1,
-0.02191866, 0.3425587, -1.248014, 0, 1, 0.9686275, 1,
-0.02094031, 0.6218757, 0.08713396, 0, 1, 0.9764706, 1,
-0.02022014, 0.8315053, -1.069083, 0, 1, 0.9803922, 1,
-0.01541251, -0.09413081, -2.996825, 0, 1, 0.9882353, 1,
-0.01484088, -0.6707929, -4.309782, 0, 1, 0.9921569, 1,
-0.01152732, -0.3059974, -4.768586, 0, 1, 1, 1,
-0.005445379, -0.5241915, -3.875551, 0, 0.9921569, 1, 1,
-0.005082924, -0.2343502, -2.300174, 0, 0.9882353, 1, 1,
0.002726001, -0.5873237, 2.968474, 0, 0.9803922, 1, 1,
0.002786453, 1.722739, -1.253738, 0, 0.9764706, 1, 1,
0.004708692, -2.578748, 2.24047, 0, 0.9686275, 1, 1,
0.004783384, -0.2567089, 4.520425, 0, 0.9647059, 1, 1,
0.006090008, 1.889432, 1.13518, 0, 0.9568627, 1, 1,
0.008679111, 0.5098324, -0.860065, 0, 0.9529412, 1, 1,
0.009182385, 1.13038, -0.2512741, 0, 0.945098, 1, 1,
0.01980008, -1.468762, 3.580923, 0, 0.9411765, 1, 1,
0.0218107, -1.072581, 1.904674, 0, 0.9333333, 1, 1,
0.02696388, -0.1382674, 3.81213, 0, 0.9294118, 1, 1,
0.02730314, 1.795361, -1.155598, 0, 0.9215686, 1, 1,
0.02779168, -0.2056428, 4.674037, 0, 0.9176471, 1, 1,
0.02971923, 0.7598893, -1.355203, 0, 0.9098039, 1, 1,
0.03092518, -0.1592988, 1.568502, 0, 0.9058824, 1, 1,
0.03719102, -0.6749567, 4.131956, 0, 0.8980392, 1, 1,
0.04114818, -1.262263, 2.168304, 0, 0.8901961, 1, 1,
0.04341562, -1.45576, 4.307254, 0, 0.8862745, 1, 1,
0.04357223, -0.9382278, 4.294073, 0, 0.8784314, 1, 1,
0.0449687, -0.7250856, 2.580737, 0, 0.8745098, 1, 1,
0.04518974, 0.2943294, -0.3180674, 0, 0.8666667, 1, 1,
0.04888441, 0.5211058, 0.5880318, 0, 0.8627451, 1, 1,
0.05400691, 0.9977468, 1.010275, 0, 0.854902, 1, 1,
0.05432426, 0.4940338, -1.280019, 0, 0.8509804, 1, 1,
0.05557819, -0.08311028, 3.820797, 0, 0.8431373, 1, 1,
0.05995733, 1.264182, -0.08219922, 0, 0.8392157, 1, 1,
0.06139153, 0.1448597, 0.6319196, 0, 0.8313726, 1, 1,
0.06186569, 0.4039208, 0.2364775, 0, 0.827451, 1, 1,
0.06190085, 1.551539, 1.098361, 0, 0.8196079, 1, 1,
0.06296471, 0.5767132, 0.5319706, 0, 0.8156863, 1, 1,
0.06419165, -0.2666083, 1.783485, 0, 0.8078431, 1, 1,
0.06576187, -0.5670081, 5.532249, 0, 0.8039216, 1, 1,
0.06795803, 0.6132779, 0.9053497, 0, 0.7960784, 1, 1,
0.07118613, -1.405285, 2.04354, 0, 0.7882353, 1, 1,
0.07239448, -1.719745, 3.388796, 0, 0.7843137, 1, 1,
0.07326977, -0.1753808, 3.938039, 0, 0.7764706, 1, 1,
0.0737448, 0.4756909, 0.01729614, 0, 0.772549, 1, 1,
0.07426028, -1.076422, 1.3615, 0, 0.7647059, 1, 1,
0.08268133, 1.525361, 0.2281787, 0, 0.7607843, 1, 1,
0.08281192, 0.0619483, -0.3663812, 0, 0.7529412, 1, 1,
0.08410953, -0.277416, 3.944665, 0, 0.7490196, 1, 1,
0.08519861, 0.8703384, -0.4410546, 0, 0.7411765, 1, 1,
0.08781169, -0.03773972, 2.569982, 0, 0.7372549, 1, 1,
0.08811944, 1.397884, 0.4288788, 0, 0.7294118, 1, 1,
0.09475658, 0.2354213, 0.2643966, 0, 0.7254902, 1, 1,
0.0953261, 0.1379247, 1.457355, 0, 0.7176471, 1, 1,
0.09760519, 0.389703, -1.311035, 0, 0.7137255, 1, 1,
0.09959914, 1.133508, 1.601935, 0, 0.7058824, 1, 1,
0.1026359, 0.7223864, 0.3464689, 0, 0.6980392, 1, 1,
0.1057314, 0.3161969, 0.4405724, 0, 0.6941177, 1, 1,
0.1063092, 1.498461, 2.716695, 0, 0.6862745, 1, 1,
0.1091583, -1.345729, 1.382947, 0, 0.682353, 1, 1,
0.1124567, -0.2162029, 4.631628, 0, 0.6745098, 1, 1,
0.1143916, -2.203047, 2.982398, 0, 0.6705883, 1, 1,
0.1191333, -0.5096801, 4.254106, 0, 0.6627451, 1, 1,
0.1214441, 0.09585257, 0.9903655, 0, 0.6588235, 1, 1,
0.129981, -0.6066474, 3.638418, 0, 0.6509804, 1, 1,
0.1304058, 1.200305, 0.2374315, 0, 0.6470588, 1, 1,
0.130822, -0.2663265, 2.046417, 0, 0.6392157, 1, 1,
0.1345795, 0.06822152, 1.029391, 0, 0.6352941, 1, 1,
0.1372776, -0.9524564, 2.469108, 0, 0.627451, 1, 1,
0.1381972, 1.209719, -0.5959497, 0, 0.6235294, 1, 1,
0.1413397, 0.3166793, 1.148477, 0, 0.6156863, 1, 1,
0.1421767, 0.6477986, 1.463067, 0, 0.6117647, 1, 1,
0.142712, 0.2081072, -0.7859566, 0, 0.6039216, 1, 1,
0.1430801, -1.148522, 3.215105, 0, 0.5960785, 1, 1,
0.1461743, -0.03530764, -0.4738931, 0, 0.5921569, 1, 1,
0.1469273, -0.304022, 0.6900832, 0, 0.5843138, 1, 1,
0.1480597, -1.879917, 2.29993, 0, 0.5803922, 1, 1,
0.1503699, 0.05522073, 0.7252072, 0, 0.572549, 1, 1,
0.1517924, 0.9290848, 0.7942132, 0, 0.5686275, 1, 1,
0.1602182, -1.366387, 2.836918, 0, 0.5607843, 1, 1,
0.1602912, 1.015825, 0.807028, 0, 0.5568628, 1, 1,
0.1609112, -0.9079378, 2.291798, 0, 0.5490196, 1, 1,
0.1610998, -1.520572, 2.672473, 0, 0.5450981, 1, 1,
0.1626026, -0.4216271, 2.891374, 0, 0.5372549, 1, 1,
0.1631143, 0.3079639, -0.1124349, 0, 0.5333334, 1, 1,
0.1640781, -1.155372, 2.574243, 0, 0.5254902, 1, 1,
0.1677212, -1.201307, 1.750251, 0, 0.5215687, 1, 1,
0.1678351, 2.047263, 1.016953, 0, 0.5137255, 1, 1,
0.168102, 1.365728, 0.3951628, 0, 0.509804, 1, 1,
0.1693911, -0.4217784, 3.161535, 0, 0.5019608, 1, 1,
0.1705179, -0.4303415, 3.139098, 0, 0.4941176, 1, 1,
0.1717308, -1.487205, 2.581888, 0, 0.4901961, 1, 1,
0.1739319, -1.630633, 4.420654, 0, 0.4823529, 1, 1,
0.1763081, -0.3239265, 0.6614577, 0, 0.4784314, 1, 1,
0.177214, 0.6521596, 0.8742232, 0, 0.4705882, 1, 1,
0.1777522, 0.2034292, 0.3999068, 0, 0.4666667, 1, 1,
0.1955028, 0.5893366, 1.778801, 0, 0.4588235, 1, 1,
0.1966, -0.04255385, 0.6568533, 0, 0.454902, 1, 1,
0.1967676, -0.6463447, 2.571747, 0, 0.4470588, 1, 1,
0.1972236, 0.4831173, 2.636747, 0, 0.4431373, 1, 1,
0.1977427, 1.687822, 0.4119386, 0, 0.4352941, 1, 1,
0.2055335, 1.166244, -0.8629819, 0, 0.4313726, 1, 1,
0.2096425, -1.330171, 0.7239894, 0, 0.4235294, 1, 1,
0.210815, -0.5570413, 3.019817, 0, 0.4196078, 1, 1,
0.2115373, -0.5226134, 3.038457, 0, 0.4117647, 1, 1,
0.2208351, -0.322859, 2.282901, 0, 0.4078431, 1, 1,
0.2273347, 0.6806569, 2.16971, 0, 0.4, 1, 1,
0.2283504, 1.167889, -0.1961849, 0, 0.3921569, 1, 1,
0.228942, -1.466298, 3.826097, 0, 0.3882353, 1, 1,
0.2320805, -1.210793, 2.945203, 0, 0.3803922, 1, 1,
0.2330251, -0.5671227, 1.164456, 0, 0.3764706, 1, 1,
0.2353081, -1.192237, 1.015566, 0, 0.3686275, 1, 1,
0.2371076, 0.8832114, 0.5947129, 0, 0.3647059, 1, 1,
0.2377606, 1.050777, -1.203698, 0, 0.3568628, 1, 1,
0.2400621, -1.006104, 2.695411, 0, 0.3529412, 1, 1,
0.241374, 0.2277774, -0.07106458, 0, 0.345098, 1, 1,
0.2425341, 0.5369673, 2.044839, 0, 0.3411765, 1, 1,
0.2460256, -0.8458037, 3.701347, 0, 0.3333333, 1, 1,
0.2467707, -2.439748, 1.876498, 0, 0.3294118, 1, 1,
0.2487707, -1.93215, 3.084145, 0, 0.3215686, 1, 1,
0.2500023, -0.6306701, 2.396174, 0, 0.3176471, 1, 1,
0.2512555, 0.2886478, 1.137984, 0, 0.3098039, 1, 1,
0.2631482, 2.067162, 2.674438, 0, 0.3058824, 1, 1,
0.2641448, -0.9347516, 3.459795, 0, 0.2980392, 1, 1,
0.2787441, -0.5708823, 2.831148, 0, 0.2901961, 1, 1,
0.2795428, 0.6520671, -0.5016466, 0, 0.2862745, 1, 1,
0.2800916, 1.023841, -0.5914844, 0, 0.2784314, 1, 1,
0.2873306, 0.9502186, -0.7026834, 0, 0.2745098, 1, 1,
0.2895733, -0.02686029, 0.4922366, 0, 0.2666667, 1, 1,
0.2955169, 0.09751923, 0.1256257, 0, 0.2627451, 1, 1,
0.2979396, -0.8133442, 2.276358, 0, 0.254902, 1, 1,
0.300352, -0.9859298, 2.539299, 0, 0.2509804, 1, 1,
0.3077907, 0.5199994, 1.193346, 0, 0.2431373, 1, 1,
0.312471, -1.178894, 4.842704, 0, 0.2392157, 1, 1,
0.3139954, 1.073885, 0.7589256, 0, 0.2313726, 1, 1,
0.323976, 0.8961757, 0.3305527, 0, 0.227451, 1, 1,
0.3295819, -0.1761277, 1.630219, 0, 0.2196078, 1, 1,
0.3320882, 0.7541028, -0.8286844, 0, 0.2156863, 1, 1,
0.3365845, -1.781931, 3.634681, 0, 0.2078431, 1, 1,
0.3375741, -1.526829, 4.741003, 0, 0.2039216, 1, 1,
0.3430199, 0.3970676, 0.1978261, 0, 0.1960784, 1, 1,
0.3464687, 0.08732925, 4.371519, 0, 0.1882353, 1, 1,
0.3503362, 0.1719599, 1.718175, 0, 0.1843137, 1, 1,
0.3522739, 0.622811, -0.07586862, 0, 0.1764706, 1, 1,
0.3534442, 2.235825, 1.166373, 0, 0.172549, 1, 1,
0.353606, 0.9661467, 2.006661, 0, 0.1647059, 1, 1,
0.3550008, 1.273652, -0.382135, 0, 0.1607843, 1, 1,
0.3574689, -0.9080744, 2.66765, 0, 0.1529412, 1, 1,
0.3576022, -2.220849, 2.724993, 0, 0.1490196, 1, 1,
0.3620862, 0.5085862, 0.5644391, 0, 0.1411765, 1, 1,
0.3633492, 1.201655, 0.5417458, 0, 0.1372549, 1, 1,
0.3641473, -2.026572, 4.907098, 0, 0.1294118, 1, 1,
0.3670689, 1.064288, 0.3058532, 0, 0.1254902, 1, 1,
0.3680221, -1.318519, 3.115271, 0, 0.1176471, 1, 1,
0.3691604, 2.197112, 1.411981, 0, 0.1137255, 1, 1,
0.3691726, -0.2109134, 2.72792, 0, 0.1058824, 1, 1,
0.3727919, 2.460556, -1.095807, 0, 0.09803922, 1, 1,
0.3778607, 1.460428, 0.507267, 0, 0.09411765, 1, 1,
0.3784331, -0.1855684, 3.242103, 0, 0.08627451, 1, 1,
0.381954, 1.234147, 1.503492, 0, 0.08235294, 1, 1,
0.3850295, 0.1192716, 2.892402, 0, 0.07450981, 1, 1,
0.3880709, 0.8672549, -0.7063048, 0, 0.07058824, 1, 1,
0.3885515, -0.1684826, 1.036646, 0, 0.0627451, 1, 1,
0.390992, 0.1900749, 0.8121475, 0, 0.05882353, 1, 1,
0.3930256, -0.7294023, 2.984962, 0, 0.05098039, 1, 1,
0.3944034, 0.7259288, -0.9254527, 0, 0.04705882, 1, 1,
0.3975147, 1.245641, 0.3633433, 0, 0.03921569, 1, 1,
0.3983746, -0.4602195, 2.337165, 0, 0.03529412, 1, 1,
0.4009208, -0.6623427, 2.007574, 0, 0.02745098, 1, 1,
0.4033111, -0.3191473, 2.900578, 0, 0.02352941, 1, 1,
0.4043916, 1.080884, -1.563757, 0, 0.01568628, 1, 1,
0.405781, 0.4722348, -0.3063049, 0, 0.01176471, 1, 1,
0.4079818, -0.7210405, 1.929212, 0, 0.003921569, 1, 1,
0.409591, -0.5894384, 2.075062, 0.003921569, 0, 1, 1,
0.4136454, -0.543927, 0.8568147, 0.007843138, 0, 1, 1,
0.416777, -1.171721, 3.409554, 0.01568628, 0, 1, 1,
0.4176424, -0.003922968, 1.899721, 0.01960784, 0, 1, 1,
0.4184019, -1.016579, 1.697349, 0.02745098, 0, 1, 1,
0.4204254, -2.245762, 2.942269, 0.03137255, 0, 1, 1,
0.42177, 1.338532, -0.1449358, 0.03921569, 0, 1, 1,
0.4234194, -1.327676, 4.038653, 0.04313726, 0, 1, 1,
0.4270078, 0.9941493, 0.5510796, 0.05098039, 0, 1, 1,
0.4322974, 0.9498898, -0.1808187, 0.05490196, 0, 1, 1,
0.4327607, 0.3468641, 0.787873, 0.0627451, 0, 1, 1,
0.4343176, 0.7024363, -1.074353, 0.06666667, 0, 1, 1,
0.43607, -0.2060908, 3.899757, 0.07450981, 0, 1, 1,
0.4373645, 0.9138281, 1.5731, 0.07843138, 0, 1, 1,
0.4422589, -2.776348, 3.185915, 0.08627451, 0, 1, 1,
0.446041, -0.319141, 2.546915, 0.09019608, 0, 1, 1,
0.4469147, 0.4756778, -0.47419, 0.09803922, 0, 1, 1,
0.447235, -0.02086302, 1.466586, 0.1058824, 0, 1, 1,
0.4472967, 0.8395624, -0.7308232, 0.1098039, 0, 1, 1,
0.4477578, 0.7579451, -0.4339879, 0.1176471, 0, 1, 1,
0.4486795, -2.166706, 1.462654, 0.1215686, 0, 1, 1,
0.4530117, -0.3149114, 1.378101, 0.1294118, 0, 1, 1,
0.4531751, -0.07815986, 0.7483558, 0.1333333, 0, 1, 1,
0.4544826, 2.269046, -0.4634832, 0.1411765, 0, 1, 1,
0.4548004, -0.2824501, 1.167142, 0.145098, 0, 1, 1,
0.4552027, 0.517374, 2.161387, 0.1529412, 0, 1, 1,
0.4569599, 0.02483672, 1.495721, 0.1568628, 0, 1, 1,
0.4584875, 0.2850878, 2.191, 0.1647059, 0, 1, 1,
0.4589891, -2.269878, 3.731574, 0.1686275, 0, 1, 1,
0.4595559, -1.039605, 3.145838, 0.1764706, 0, 1, 1,
0.4606053, 2.241256, -0.7784286, 0.1803922, 0, 1, 1,
0.4614365, 1.050726, 0.3157499, 0.1882353, 0, 1, 1,
0.4633746, 0.2832018, 0.3394002, 0.1921569, 0, 1, 1,
0.4650869, -1.049242, 3.799825, 0.2, 0, 1, 1,
0.4657257, -1.328519, 2.414161, 0.2078431, 0, 1, 1,
0.4683281, -0.05438161, 2.45704, 0.2117647, 0, 1, 1,
0.4715953, -0.08492585, 3.859851, 0.2196078, 0, 1, 1,
0.474791, -0.2690607, 0.4342346, 0.2235294, 0, 1, 1,
0.4761384, 0.5969021, -1.635632, 0.2313726, 0, 1, 1,
0.482348, -0.7644365, 4.021305, 0.2352941, 0, 1, 1,
0.4832169, 0.850666, 1.819225, 0.2431373, 0, 1, 1,
0.4860569, 0.1348658, 0.7714036, 0.2470588, 0, 1, 1,
0.4863777, -0.7141017, 2.899787, 0.254902, 0, 1, 1,
0.4917029, -1.260411, 1.004179, 0.2588235, 0, 1, 1,
0.4929773, -1.130875, 2.11428, 0.2666667, 0, 1, 1,
0.4931464, 0.6202708, 1.067604, 0.2705882, 0, 1, 1,
0.496402, -0.2377196, 4.477573, 0.2784314, 0, 1, 1,
0.4987234, 0.4550246, -1.135909, 0.282353, 0, 1, 1,
0.5007438, -0.06153952, 1.669041, 0.2901961, 0, 1, 1,
0.501828, 1.076431, -0.3776748, 0.2941177, 0, 1, 1,
0.5031485, 1.180286, -0.4365312, 0.3019608, 0, 1, 1,
0.5052778, -0.7821531, 2.775344, 0.3098039, 0, 1, 1,
0.5052926, -0.6059406, 2.532118, 0.3137255, 0, 1, 1,
0.5075198, -0.7757881, 2.925716, 0.3215686, 0, 1, 1,
0.5127602, 0.7959616, 1.805302, 0.3254902, 0, 1, 1,
0.5189378, 0.6256199, 0.451115, 0.3333333, 0, 1, 1,
0.520257, -0.03826469, 1.283781, 0.3372549, 0, 1, 1,
0.5229685, 1.983101, 0.05394782, 0.345098, 0, 1, 1,
0.5310909, 2.107966, 0.711323, 0.3490196, 0, 1, 1,
0.5321749, -0.1725663, 0.5390779, 0.3568628, 0, 1, 1,
0.5392059, -0.4639555, 1.932167, 0.3607843, 0, 1, 1,
0.5445153, -0.7512573, 3.860499, 0.3686275, 0, 1, 1,
0.5449154, -0.7647671, 1.617077, 0.372549, 0, 1, 1,
0.5449923, -0.9105901, 4.432336, 0.3803922, 0, 1, 1,
0.558888, -0.8892934, 3.13437, 0.3843137, 0, 1, 1,
0.5619086, -1.666538, 3.082855, 0.3921569, 0, 1, 1,
0.5694395, 0.4754281, 0.3606678, 0.3960784, 0, 1, 1,
0.5705808, -0.7480192, 1.558046, 0.4039216, 0, 1, 1,
0.5715059, 1.549655, 1.866273, 0.4117647, 0, 1, 1,
0.581599, -0.8300698, 2.24739, 0.4156863, 0, 1, 1,
0.5836527, -0.04950065, 0.7423214, 0.4235294, 0, 1, 1,
0.5837286, -0.4352249, 1.15367, 0.427451, 0, 1, 1,
0.5838977, 0.3615205, 1.071539, 0.4352941, 0, 1, 1,
0.6075537, -0.9701198, 2.861618, 0.4392157, 0, 1, 1,
0.6088189, 0.793601, 1.372966, 0.4470588, 0, 1, 1,
0.6130149, 1.26294, -0.500675, 0.4509804, 0, 1, 1,
0.6134054, -1.009514, 1.920568, 0.4588235, 0, 1, 1,
0.6138663, -0.3381891, 1.779859, 0.4627451, 0, 1, 1,
0.6166513, -0.1684368, 1.500179, 0.4705882, 0, 1, 1,
0.6189967, -0.7993683, 1.898039, 0.4745098, 0, 1, 1,
0.6245922, -0.709768, 3.244058, 0.4823529, 0, 1, 1,
0.6245966, 1.89145, 0.421944, 0.4862745, 0, 1, 1,
0.6258405, 0.8165821, -0.5863885, 0.4941176, 0, 1, 1,
0.6299596, -0.7300504, 3.192547, 0.5019608, 0, 1, 1,
0.6316105, -0.2028563, 0.311653, 0.5058824, 0, 1, 1,
0.6430156, -1.382054, 2.805152, 0.5137255, 0, 1, 1,
0.6446202, 0.4559819, 0.4372319, 0.5176471, 0, 1, 1,
0.6492263, 0.8578085, 1.359744, 0.5254902, 0, 1, 1,
0.653815, -0.6369981, 2.399497, 0.5294118, 0, 1, 1,
0.654923, 0.6972879, 0.4175711, 0.5372549, 0, 1, 1,
0.6573773, 0.3210914, -0.2928937, 0.5411765, 0, 1, 1,
0.6588479, 0.2992444, 1.880967, 0.5490196, 0, 1, 1,
0.6605008, -0.1227095, 1.650548, 0.5529412, 0, 1, 1,
0.6623157, 0.4585062, 0.2043515, 0.5607843, 0, 1, 1,
0.6665826, -0.2160214, 0.2620443, 0.5647059, 0, 1, 1,
0.6735986, 0.7101513, 0.1671862, 0.572549, 0, 1, 1,
0.6798256, -0.5437191, 3.747523, 0.5764706, 0, 1, 1,
0.680602, -1.070362, 3.253742, 0.5843138, 0, 1, 1,
0.6848649, -0.2502651, 2.410522, 0.5882353, 0, 1, 1,
0.687454, 0.1774873, 0.5022974, 0.5960785, 0, 1, 1,
0.689161, -1.388665, 2.896304, 0.6039216, 0, 1, 1,
0.6944286, 0.5306536, 1.028747, 0.6078432, 0, 1, 1,
0.6973261, -0.03003184, 2.112095, 0.6156863, 0, 1, 1,
0.6979592, 0.6713395, 0.5373121, 0.6196079, 0, 1, 1,
0.7020186, -0.9886932, 3.838176, 0.627451, 0, 1, 1,
0.7051588, 0.434584, 1.720238, 0.6313726, 0, 1, 1,
0.707801, -0.8247932, 1.388705, 0.6392157, 0, 1, 1,
0.7137934, -0.1353449, 0.5979234, 0.6431373, 0, 1, 1,
0.7143233, -0.2927415, 2.990066, 0.6509804, 0, 1, 1,
0.7157819, 1.184561, -1.12567, 0.654902, 0, 1, 1,
0.7182134, 1.173133, 0.7143391, 0.6627451, 0, 1, 1,
0.7184023, 1.691951, -0.1123653, 0.6666667, 0, 1, 1,
0.7194284, 0.1202606, 2.060424, 0.6745098, 0, 1, 1,
0.7317069, -0.8215421, 1.064131, 0.6784314, 0, 1, 1,
0.7326501, 0.4884045, 0.2065538, 0.6862745, 0, 1, 1,
0.7392054, -0.1626648, 3.207788, 0.6901961, 0, 1, 1,
0.7437122, 0.7241568, 1.766274, 0.6980392, 0, 1, 1,
0.7466924, 0.2668636, 2.52063, 0.7058824, 0, 1, 1,
0.7487276, -0.5822328, 2.985079, 0.7098039, 0, 1, 1,
0.7603427, 0.7584191, 1.0875, 0.7176471, 0, 1, 1,
0.7865878, 0.4043144, 0.368548, 0.7215686, 0, 1, 1,
0.7930683, 2.067507, 0.465799, 0.7294118, 0, 1, 1,
0.7994414, -0.01479164, 0.1904227, 0.7333333, 0, 1, 1,
0.8002079, 0.6086531, 1.403352, 0.7411765, 0, 1, 1,
0.8019428, -0.6235482, 2.166021, 0.7450981, 0, 1, 1,
0.8056936, -0.05706308, 2.306924, 0.7529412, 0, 1, 1,
0.8272106, 1.063484, -0.7989488, 0.7568628, 0, 1, 1,
0.8272318, -1.670248, 3.655444, 0.7647059, 0, 1, 1,
0.8346885, -0.03024329, 1.2262, 0.7686275, 0, 1, 1,
0.8374743, 1.088866, 1.920455, 0.7764706, 0, 1, 1,
0.8455418, -0.5193911, 3.64101, 0.7803922, 0, 1, 1,
0.8652031, -0.4523063, 1.673191, 0.7882353, 0, 1, 1,
0.8658741, 0.2477032, 0.7517774, 0.7921569, 0, 1, 1,
0.8661699, -0.8194898, 0.8418946, 0.8, 0, 1, 1,
0.8774354, -0.5399994, 2.755734, 0.8078431, 0, 1, 1,
0.8810808, 0.2642571, 1.318289, 0.8117647, 0, 1, 1,
0.8844256, 0.5569807, 1.766643, 0.8196079, 0, 1, 1,
0.8940387, -1.016051, 2.870546, 0.8235294, 0, 1, 1,
0.8953765, -0.2128098, 0.7633712, 0.8313726, 0, 1, 1,
0.8967656, -1.144882, 1.33733, 0.8352941, 0, 1, 1,
0.8978923, -0.7923771, 3.175504, 0.8431373, 0, 1, 1,
0.9038437, 1.548167, 0.7615124, 0.8470588, 0, 1, 1,
0.9063857, -0.7779358, 3.601881, 0.854902, 0, 1, 1,
0.9070599, -0.330136, 2.905668, 0.8588235, 0, 1, 1,
0.911891, -0.8605191, 2.20293, 0.8666667, 0, 1, 1,
0.912743, -0.2159013, 1.717437, 0.8705882, 0, 1, 1,
0.9303988, -0.005684057, 3.079239, 0.8784314, 0, 1, 1,
0.9316239, 2.861997, 1.139582, 0.8823529, 0, 1, 1,
0.9367523, 0.8471736, 0.6952202, 0.8901961, 0, 1, 1,
0.9368367, 0.8062574, 0.1535413, 0.8941177, 0, 1, 1,
0.9416254, -0.3388194, 3.481915, 0.9019608, 0, 1, 1,
0.9446136, 2.184633, 0.9265761, 0.9098039, 0, 1, 1,
0.9528065, -2.378873, 4.424153, 0.9137255, 0, 1, 1,
0.9534636, 0.9399697, 1.757055, 0.9215686, 0, 1, 1,
0.9547043, -0.2891053, 2.199487, 0.9254902, 0, 1, 1,
0.9638194, 0.8729623, 1.128335, 0.9333333, 0, 1, 1,
0.9692661, 1.366266, 2.285298, 0.9372549, 0, 1, 1,
0.9753023, 0.5269542, 1.028576, 0.945098, 0, 1, 1,
0.9786379, 1.193285, 1.772183, 0.9490196, 0, 1, 1,
0.9792208, -0.2024905, 2.050792, 0.9568627, 0, 1, 1,
0.9833376, 0.7148443, 1.287419, 0.9607843, 0, 1, 1,
0.9895504, 1.234692, -0.09169391, 0.9686275, 0, 1, 1,
0.9910078, -0.9499999, 0.9302539, 0.972549, 0, 1, 1,
0.9921397, 0.26347, 1.120397, 0.9803922, 0, 1, 1,
0.9930383, 0.5098675, -0.3375585, 0.9843137, 0, 1, 1,
0.9939157, 0.4277468, -1.809883, 0.9921569, 0, 1, 1,
0.997412, 0.1224065, 1.218478, 0.9960784, 0, 1, 1,
0.9986854, -0.1652625, 0.8616243, 1, 0, 0.9960784, 1,
0.9990481, -0.09395557, 3.435633, 1, 0, 0.9882353, 1,
1.001056, 0.4817172, 1.412142, 1, 0, 0.9843137, 1,
1.00849, 1.820059, 1.139302, 1, 0, 0.9764706, 1,
1.009603, -1.419536, 3.353587, 1, 0, 0.972549, 1,
1.012187, -0.01215679, 3.11411, 1, 0, 0.9647059, 1,
1.02263, 1.989951, 0.4947457, 1, 0, 0.9607843, 1,
1.023423, 0.05314372, -1.034649, 1, 0, 0.9529412, 1,
1.028945, 0.8101556, 1.927263, 1, 0, 0.9490196, 1,
1.034113, 1.421132, -0.1656734, 1, 0, 0.9411765, 1,
1.036852, 0.2614363, 2.523267, 1, 0, 0.9372549, 1,
1.040311, 0.5824198, 0.05490635, 1, 0, 0.9294118, 1,
1.045964, 1.825512, 0.2501913, 1, 0, 0.9254902, 1,
1.046262, 0.2008571, 2.162345, 1, 0, 0.9176471, 1,
1.050255, -0.9987451, 3.078986, 1, 0, 0.9137255, 1,
1.050864, -0.07062574, 2.294195, 1, 0, 0.9058824, 1,
1.053084, -0.8683835, 1.957375, 1, 0, 0.9019608, 1,
1.053928, -0.002096684, 0.465304, 1, 0, 0.8941177, 1,
1.056532, -0.6541973, 1.532599, 1, 0, 0.8862745, 1,
1.058072, 0.07001854, -0.06983416, 1, 0, 0.8823529, 1,
1.058565, -1.090648, 2.465177, 1, 0, 0.8745098, 1,
1.061646, -0.4841806, 3.574322, 1, 0, 0.8705882, 1,
1.068105, -0.7152872, 1.481984, 1, 0, 0.8627451, 1,
1.074989, 0.06509123, 0.6830128, 1, 0, 0.8588235, 1,
1.079516, -1.071128, 1.516165, 1, 0, 0.8509804, 1,
1.089699, 0.1320519, 0.4519491, 1, 0, 0.8470588, 1,
1.097578, 1.679467, -0.4986355, 1, 0, 0.8392157, 1,
1.099891, -1.042329, 1.728077, 1, 0, 0.8352941, 1,
1.10556, -0.03511655, 2.844727, 1, 0, 0.827451, 1,
1.106098, -0.8363287, 0.1704069, 1, 0, 0.8235294, 1,
1.123583, 1.161186, 2.411888, 1, 0, 0.8156863, 1,
1.125452, 0.9834991, 0.7054655, 1, 0, 0.8117647, 1,
1.139013, -2.445335, 3.008203, 1, 0, 0.8039216, 1,
1.142216, 0.3215067, 2.546583, 1, 0, 0.7960784, 1,
1.147554, -1.047132, 1.69869, 1, 0, 0.7921569, 1,
1.158058, -1.940555, 3.388453, 1, 0, 0.7843137, 1,
1.178377, -2.30864, 3.86506, 1, 0, 0.7803922, 1,
1.178448, -1.101771, 2.70671, 1, 0, 0.772549, 1,
1.200082, 0.9866555, 1.318211, 1, 0, 0.7686275, 1,
1.203362, -0.5699083, -0.0139396, 1, 0, 0.7607843, 1,
1.216398, 1.960748, 1.410404, 1, 0, 0.7568628, 1,
1.224785, -1.214919, 2.622082, 1, 0, 0.7490196, 1,
1.230678, -0.7711779, 2.087804, 1, 0, 0.7450981, 1,
1.23423, 0.538289, 0.9824857, 1, 0, 0.7372549, 1,
1.246746, -0.6330878, 2.296496, 1, 0, 0.7333333, 1,
1.251814, 0.6939715, 1.670782, 1, 0, 0.7254902, 1,
1.255262, -0.3283722, 0.419271, 1, 0, 0.7215686, 1,
1.256715, 0.5054962, -0.06274068, 1, 0, 0.7137255, 1,
1.258324, -2.198127, 4.14515, 1, 0, 0.7098039, 1,
1.264714, 0.3830951, 3.207437, 1, 0, 0.7019608, 1,
1.272395, -2.328356, 0.7825983, 1, 0, 0.6941177, 1,
1.276148, -0.5994347, -0.08676221, 1, 0, 0.6901961, 1,
1.288126, 0.7705383, 1.512206, 1, 0, 0.682353, 1,
1.294691, 0.6062018, -0.2924743, 1, 0, 0.6784314, 1,
1.296959, -0.478413, 0.3519004, 1, 0, 0.6705883, 1,
1.304134, 0.6782117, 2.017289, 1, 0, 0.6666667, 1,
1.304423, 1.093062, 2.300002, 1, 0, 0.6588235, 1,
1.30686, 0.3742807, 1.141896, 1, 0, 0.654902, 1,
1.31063, 0.9382406, 0.7864411, 1, 0, 0.6470588, 1,
1.315188, -1.834391, 2.619254, 1, 0, 0.6431373, 1,
1.323916, 0.5140684, 0.6054291, 1, 0, 0.6352941, 1,
1.328924, -0.2863507, 2.730908, 1, 0, 0.6313726, 1,
1.344292, -1.612484, 1.97817, 1, 0, 0.6235294, 1,
1.352466, -0.6047405, 3.500099, 1, 0, 0.6196079, 1,
1.354336, 1.090099, 0.9152131, 1, 0, 0.6117647, 1,
1.364324, 0.07980254, 0.9705519, 1, 0, 0.6078432, 1,
1.368204, 1.419304, 0.2229614, 1, 0, 0.6, 1,
1.378552, -0.6568624, 4.252836, 1, 0, 0.5921569, 1,
1.400126, -0.4491052, 2.932644, 1, 0, 0.5882353, 1,
1.412532, 2.223362, 0.6300136, 1, 0, 0.5803922, 1,
1.420203, 0.211429, 0.6570997, 1, 0, 0.5764706, 1,
1.424264, -0.494862, 1.817283, 1, 0, 0.5686275, 1,
1.431268, -1.640441, 2.554686, 1, 0, 0.5647059, 1,
1.433662, 0.9116182, 0.5095382, 1, 0, 0.5568628, 1,
1.461819, -0.8844327, 1.71979, 1, 0, 0.5529412, 1,
1.461925, -0.6745573, 1.627917, 1, 0, 0.5450981, 1,
1.464103, 0.2905454, 0.4689601, 1, 0, 0.5411765, 1,
1.469333, -1.638624, 1.221792, 1, 0, 0.5333334, 1,
1.470808, -1.345545, 2.413804, 1, 0, 0.5294118, 1,
1.474211, 0.2336552, 2.310468, 1, 0, 0.5215687, 1,
1.475877, 0.6591952, -0.1112407, 1, 0, 0.5176471, 1,
1.486972, -0.4787145, 1.37368, 1, 0, 0.509804, 1,
1.491277, 1.0888, 1.565023, 1, 0, 0.5058824, 1,
1.498981, 0.1169979, 0.4962372, 1, 0, 0.4980392, 1,
1.503537, 0.008903366, 1.539294, 1, 0, 0.4901961, 1,
1.518498, -0.3735897, 2.105627, 1, 0, 0.4862745, 1,
1.520037, 0.4298686, 0.2602061, 1, 0, 0.4784314, 1,
1.540707, 0.1955384, 2.185127, 1, 0, 0.4745098, 1,
1.561329, -0.4900351, 3.184041, 1, 0, 0.4666667, 1,
1.575081, -0.4515898, 1.68242, 1, 0, 0.4627451, 1,
1.583193, 0.6668696, 0.1816047, 1, 0, 0.454902, 1,
1.608549, 0.6594426, 1.838014, 1, 0, 0.4509804, 1,
1.609213, 1.689666, 0.1919071, 1, 0, 0.4431373, 1,
1.613625, -1.991657, 2.109138, 1, 0, 0.4392157, 1,
1.615888, 0.3312463, 2.807676, 1, 0, 0.4313726, 1,
1.625659, -0.1861405, 1.022595, 1, 0, 0.427451, 1,
1.636838, -0.6160405, 2.1132, 1, 0, 0.4196078, 1,
1.645972, 0.4132655, 1.054958, 1, 0, 0.4156863, 1,
1.655145, 0.1500866, 1.233762, 1, 0, 0.4078431, 1,
1.658025, 2.060551, 0.3640839, 1, 0, 0.4039216, 1,
1.660072, -0.3951402, 1.56795, 1, 0, 0.3960784, 1,
1.663083, 1.854994, -0.1743496, 1, 0, 0.3882353, 1,
1.664079, 0.1170515, 1.180974, 1, 0, 0.3843137, 1,
1.664502, -0.1609126, 1.293187, 1, 0, 0.3764706, 1,
1.683974, 1.845352, 0.06406684, 1, 0, 0.372549, 1,
1.702473, 1.218584, 0.7451316, 1, 0, 0.3647059, 1,
1.705229, 1.500542, 1.198695, 1, 0, 0.3607843, 1,
1.721275, 1.376425, 0.02846496, 1, 0, 0.3529412, 1,
1.724004, -0.4604273, 0.7030921, 1, 0, 0.3490196, 1,
1.733305, -1.932822, 1.958668, 1, 0, 0.3411765, 1,
1.740182, 0.7953679, 1.26768, 1, 0, 0.3372549, 1,
1.742935, 0.777512, 1.008602, 1, 0, 0.3294118, 1,
1.751067, 0.8271413, 0.08414391, 1, 0, 0.3254902, 1,
1.759496, 0.0992212, 2.844381, 1, 0, 0.3176471, 1,
1.759614, -1.301521, 1.495964, 1, 0, 0.3137255, 1,
1.763606, -1.566745, 1.841972, 1, 0, 0.3058824, 1,
1.765254, 0.3012286, 0.995259, 1, 0, 0.2980392, 1,
1.77082, 0.4252724, 2.301675, 1, 0, 0.2941177, 1,
1.773462, -2.222127, 3.5481, 1, 0, 0.2862745, 1,
1.774573, 0.9041253, -0.3467042, 1, 0, 0.282353, 1,
1.781378, -1.000623, 2.057586, 1, 0, 0.2745098, 1,
1.822323, 0.2650249, 1.556765, 1, 0, 0.2705882, 1,
1.830176, -1.083757, 1.722866, 1, 0, 0.2627451, 1,
1.832539, 0.633963, 1.896091, 1, 0, 0.2588235, 1,
1.836078, -0.6039436, 2.888992, 1, 0, 0.2509804, 1,
1.841482, 1.100858, 1.6339, 1, 0, 0.2470588, 1,
1.860706, -0.9714351, 2.103828, 1, 0, 0.2392157, 1,
1.867679, -0.06680044, 1.572844, 1, 0, 0.2352941, 1,
1.870055, 0.2246983, 2.930961, 1, 0, 0.227451, 1,
1.874346, 0.8023605, -0.05854101, 1, 0, 0.2235294, 1,
1.874435, 0.6349099, 3.233588, 1, 0, 0.2156863, 1,
1.881908, -0.4532207, 2.645106, 1, 0, 0.2117647, 1,
1.906489, -0.454937, 3.037188, 1, 0, 0.2039216, 1,
1.925759, 0.7220447, 0.4554669, 1, 0, 0.1960784, 1,
1.926141, -1.08972, 2.557276, 1, 0, 0.1921569, 1,
1.933738, 0.8944076, -0.3426946, 1, 0, 0.1843137, 1,
1.948107, -1.053833, 3.696701, 1, 0, 0.1803922, 1,
1.953706, -0.06942008, 1.996677, 1, 0, 0.172549, 1,
1.975719, 0.9798438, 1.637422, 1, 0, 0.1686275, 1,
1.985104, 1.558591, -0.3104824, 1, 0, 0.1607843, 1,
1.986304, 0.1346613, 0.4860856, 1, 0, 0.1568628, 1,
1.993325, 1.649649, 0.6206995, 1, 0, 0.1490196, 1,
1.997828, 0.4656147, -0.004632071, 1, 0, 0.145098, 1,
2.007903, 0.4748467, 0.1876846, 1, 0, 0.1372549, 1,
2.021388, 0.3991153, -0.09311547, 1, 0, 0.1333333, 1,
2.023518, -0.07795822, 0.8066068, 1, 0, 0.1254902, 1,
2.038201, -1.151298, 2.422979, 1, 0, 0.1215686, 1,
2.04521, 0.8093798, 2.001021, 1, 0, 0.1137255, 1,
2.066075, 0.8130786, 1.267234, 1, 0, 0.1098039, 1,
2.069402, -0.3093428, 0.03575712, 1, 0, 0.1019608, 1,
2.078542, -0.2776134, 2.879234, 1, 0, 0.09411765, 1,
2.085144, 1.347284, 0.8366778, 1, 0, 0.09019608, 1,
2.092044, -1.654163, 1.215422, 1, 0, 0.08235294, 1,
2.109683, 0.3896893, 2.110483, 1, 0, 0.07843138, 1,
2.110431, -0.5411288, 0.6731812, 1, 0, 0.07058824, 1,
2.153707, 0.7537843, 0.5890305, 1, 0, 0.06666667, 1,
2.226993, -1.943069, 0.8643758, 1, 0, 0.05882353, 1,
2.237244, 0.9596255, 0.1270008, 1, 0, 0.05490196, 1,
2.243994, -0.04171658, 3.552689, 1, 0, 0.04705882, 1,
2.322515, -1.611261, 2.567567, 1, 0, 0.04313726, 1,
2.382799, -1.369636, 1.482947, 1, 0, 0.03529412, 1,
2.445577, -0.2123298, 2.27658, 1, 0, 0.03137255, 1,
2.588873, 0.3248911, 1.522673, 1, 0, 0.02352941, 1,
2.618071, 1.325086, 2.22984, 1, 0, 0.01960784, 1,
2.638584, -0.9924033, 0.9667619, 1, 0, 0.01176471, 1,
2.654964, -0.4415872, 2.020627, 1, 0, 0.007843138, 1
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
-0.2630428, -3.798697, -6.636426, 0, -0.5, 0.5, 0.5,
-0.2630428, -3.798697, -6.636426, 1, -0.5, 0.5, 0.5,
-0.2630428, -3.798697, -6.636426, 1, 1.5, 0.5, 0.5,
-0.2630428, -3.798697, -6.636426, 0, 1.5, 0.5, 0.5
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
-4.170254, 0.07203913, -6.636426, 0, -0.5, 0.5, 0.5,
-4.170254, 0.07203913, -6.636426, 1, -0.5, 0.5, 0.5,
-4.170254, 0.07203913, -6.636426, 1, 1.5, 0.5, 0.5,
-4.170254, 0.07203913, -6.636426, 0, 1.5, 0.5, 0.5
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
-4.170254, -3.798697, 0.3297369, 0, -0.5, 0.5, 0.5,
-4.170254, -3.798697, 0.3297369, 1, -0.5, 0.5, 0.5,
-4.170254, -3.798697, 0.3297369, 1, 1.5, 0.5, 0.5,
-4.170254, -3.798697, 0.3297369, 0, 1.5, 0.5, 0.5
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
-3, -2.905451, -5.028851,
2, -2.905451, -5.028851,
-3, -2.905451, -5.028851,
-3, -3.054325, -5.29678,
-2, -2.905451, -5.028851,
-2, -3.054325, -5.29678,
-1, -2.905451, -5.028851,
-1, -3.054325, -5.29678,
0, -2.905451, -5.028851,
0, -3.054325, -5.29678,
1, -2.905451, -5.028851,
1, -3.054325, -5.29678,
2, -2.905451, -5.028851,
2, -3.054325, -5.29678
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
-3, -3.352074, -5.832639, 0, -0.5, 0.5, 0.5,
-3, -3.352074, -5.832639, 1, -0.5, 0.5, 0.5,
-3, -3.352074, -5.832639, 1, 1.5, 0.5, 0.5,
-3, -3.352074, -5.832639, 0, 1.5, 0.5, 0.5,
-2, -3.352074, -5.832639, 0, -0.5, 0.5, 0.5,
-2, -3.352074, -5.832639, 1, -0.5, 0.5, 0.5,
-2, -3.352074, -5.832639, 1, 1.5, 0.5, 0.5,
-2, -3.352074, -5.832639, 0, 1.5, 0.5, 0.5,
-1, -3.352074, -5.832639, 0, -0.5, 0.5, 0.5,
-1, -3.352074, -5.832639, 1, -0.5, 0.5, 0.5,
-1, -3.352074, -5.832639, 1, 1.5, 0.5, 0.5,
-1, -3.352074, -5.832639, 0, 1.5, 0.5, 0.5,
0, -3.352074, -5.832639, 0, -0.5, 0.5, 0.5,
0, -3.352074, -5.832639, 1, -0.5, 0.5, 0.5,
0, -3.352074, -5.832639, 1, 1.5, 0.5, 0.5,
0, -3.352074, -5.832639, 0, 1.5, 0.5, 0.5,
1, -3.352074, -5.832639, 0, -0.5, 0.5, 0.5,
1, -3.352074, -5.832639, 1, -0.5, 0.5, 0.5,
1, -3.352074, -5.832639, 1, 1.5, 0.5, 0.5,
1, -3.352074, -5.832639, 0, 1.5, 0.5, 0.5,
2, -3.352074, -5.832639, 0, -0.5, 0.5, 0.5,
2, -3.352074, -5.832639, 1, -0.5, 0.5, 0.5,
2, -3.352074, -5.832639, 1, 1.5, 0.5, 0.5,
2, -3.352074, -5.832639, 0, 1.5, 0.5, 0.5
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
-3.26859, -2, -5.028851,
-3.26859, 2, -5.028851,
-3.26859, -2, -5.028851,
-3.418867, -2, -5.29678,
-3.26859, -1, -5.028851,
-3.418867, -1, -5.29678,
-3.26859, 0, -5.028851,
-3.418867, 0, -5.29678,
-3.26859, 1, -5.028851,
-3.418867, 1, -5.29678,
-3.26859, 2, -5.028851,
-3.418867, 2, -5.29678
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
-3.719422, -2, -5.832639, 0, -0.5, 0.5, 0.5,
-3.719422, -2, -5.832639, 1, -0.5, 0.5, 0.5,
-3.719422, -2, -5.832639, 1, 1.5, 0.5, 0.5,
-3.719422, -2, -5.832639, 0, 1.5, 0.5, 0.5,
-3.719422, -1, -5.832639, 0, -0.5, 0.5, 0.5,
-3.719422, -1, -5.832639, 1, -0.5, 0.5, 0.5,
-3.719422, -1, -5.832639, 1, 1.5, 0.5, 0.5,
-3.719422, -1, -5.832639, 0, 1.5, 0.5, 0.5,
-3.719422, 0, -5.832639, 0, -0.5, 0.5, 0.5,
-3.719422, 0, -5.832639, 1, -0.5, 0.5, 0.5,
-3.719422, 0, -5.832639, 1, 1.5, 0.5, 0.5,
-3.719422, 0, -5.832639, 0, 1.5, 0.5, 0.5,
-3.719422, 1, -5.832639, 0, -0.5, 0.5, 0.5,
-3.719422, 1, -5.832639, 1, -0.5, 0.5, 0.5,
-3.719422, 1, -5.832639, 1, 1.5, 0.5, 0.5,
-3.719422, 1, -5.832639, 0, 1.5, 0.5, 0.5,
-3.719422, 2, -5.832639, 0, -0.5, 0.5, 0.5,
-3.719422, 2, -5.832639, 1, -0.5, 0.5, 0.5,
-3.719422, 2, -5.832639, 1, 1.5, 0.5, 0.5,
-3.719422, 2, -5.832639, 0, 1.5, 0.5, 0.5
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
-3.26859, -2.905451, -4,
-3.26859, -2.905451, 4,
-3.26859, -2.905451, -4,
-3.418867, -3.054325, -4,
-3.26859, -2.905451, -2,
-3.418867, -3.054325, -2,
-3.26859, -2.905451, 0,
-3.418867, -3.054325, 0,
-3.26859, -2.905451, 2,
-3.418867, -3.054325, 2,
-3.26859, -2.905451, 4,
-3.418867, -3.054325, 4
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
-3.719422, -3.352074, -4, 0, -0.5, 0.5, 0.5,
-3.719422, -3.352074, -4, 1, -0.5, 0.5, 0.5,
-3.719422, -3.352074, -4, 1, 1.5, 0.5, 0.5,
-3.719422, -3.352074, -4, 0, 1.5, 0.5, 0.5,
-3.719422, -3.352074, -2, 0, -0.5, 0.5, 0.5,
-3.719422, -3.352074, -2, 1, -0.5, 0.5, 0.5,
-3.719422, -3.352074, -2, 1, 1.5, 0.5, 0.5,
-3.719422, -3.352074, -2, 0, 1.5, 0.5, 0.5,
-3.719422, -3.352074, 0, 0, -0.5, 0.5, 0.5,
-3.719422, -3.352074, 0, 1, -0.5, 0.5, 0.5,
-3.719422, -3.352074, 0, 1, 1.5, 0.5, 0.5,
-3.719422, -3.352074, 0, 0, 1.5, 0.5, 0.5,
-3.719422, -3.352074, 2, 0, -0.5, 0.5, 0.5,
-3.719422, -3.352074, 2, 1, -0.5, 0.5, 0.5,
-3.719422, -3.352074, 2, 1, 1.5, 0.5, 0.5,
-3.719422, -3.352074, 2, 0, 1.5, 0.5, 0.5,
-3.719422, -3.352074, 4, 0, -0.5, 0.5, 0.5,
-3.719422, -3.352074, 4, 1, -0.5, 0.5, 0.5,
-3.719422, -3.352074, 4, 1, 1.5, 0.5, 0.5,
-3.719422, -3.352074, 4, 0, 1.5, 0.5, 0.5
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
-3.26859, -2.905451, -5.028851,
-3.26859, 3.049529, -5.028851,
-3.26859, -2.905451, 5.688324,
-3.26859, 3.049529, 5.688324,
-3.26859, -2.905451, -5.028851,
-3.26859, -2.905451, 5.688324,
-3.26859, 3.049529, -5.028851,
-3.26859, 3.049529, 5.688324,
-3.26859, -2.905451, -5.028851,
2.742504, -2.905451, -5.028851,
-3.26859, -2.905451, 5.688324,
2.742504, -2.905451, 5.688324,
-3.26859, 3.049529, -5.028851,
2.742504, 3.049529, -5.028851,
-3.26859, 3.049529, 5.688324,
2.742504, 3.049529, 5.688324,
2.742504, -2.905451, -5.028851,
2.742504, 3.049529, -5.028851,
2.742504, -2.905451, 5.688324,
2.742504, 3.049529, 5.688324,
2.742504, -2.905451, -5.028851,
2.742504, -2.905451, 5.688324,
2.742504, 3.049529, -5.028851,
2.742504, 3.049529, 5.688324
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
var radius = 7.291384;
var distance = 32.44019;
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
mvMatrix.translate( 0.2630428, -0.07203913, -0.3297369 );
mvMatrix.scale( 1.311506, 1.323865, 0.7356032 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.44019);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
tralkoxydim<-read.table("tralkoxydim.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tralkoxydim$V2
```

```
## Error in eval(expr, envir, enclos): object 'tralkoxydim' not found
```

```r
y<-tralkoxydim$V3
```

```
## Error in eval(expr, envir, enclos): object 'tralkoxydim' not found
```

```r
z<-tralkoxydim$V4
```

```
## Error in eval(expr, envir, enclos): object 'tralkoxydim' not found
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
-3.18105, -1.153878, -3.173036, 0, 0, 1, 1, 1,
-2.950511, -0.4503396, -3.461432, 1, 0, 0, 1, 1,
-2.643799, -0.5818346, 0.7661412, 1, 0, 0, 1, 1,
-2.614337, 0.949734, -1.518624, 1, 0, 0, 1, 1,
-2.493177, -0.469954, -2.954216, 1, 0, 0, 1, 1,
-2.326912, -1.194375, -2.731613, 1, 0, 0, 1, 1,
-2.31018, 1.101256, -0.5365601, 0, 0, 0, 1, 1,
-2.214882, -0.1338118, 0.2459628, 0, 0, 0, 1, 1,
-2.192169, -0.04805143, -0.9356528, 0, 0, 0, 1, 1,
-2.187109, -0.4107831, -1.48883, 0, 0, 0, 1, 1,
-2.176886, -0.4708403, -2.844139, 0, 0, 0, 1, 1,
-2.154958, 0.2840231, 0.543641, 0, 0, 0, 1, 1,
-2.137469, -1.086875, -2.375051, 0, 0, 0, 1, 1,
-2.118124, 0.3415949, -2.613245, 1, 1, 1, 1, 1,
-2.116614, -0.7368754, -3.323247, 1, 1, 1, 1, 1,
-2.07232, -0.4667452, -1.442033, 1, 1, 1, 1, 1,
-2.068385, 0.9486049, -1.545939, 1, 1, 1, 1, 1,
-2.063401, -1.130578, -3.641603, 1, 1, 1, 1, 1,
-1.950611, -0.1526873, 1.269222, 1, 1, 1, 1, 1,
-1.907907, 0.1641677, -1.590205, 1, 1, 1, 1, 1,
-1.906417, -2.216516, -3.592522, 1, 1, 1, 1, 1,
-1.89519, -0.5322679, -2.956475, 1, 1, 1, 1, 1,
-1.84505, 0.1679433, -1.856981, 1, 1, 1, 1, 1,
-1.830828, 0.4327281, -3.916519, 1, 1, 1, 1, 1,
-1.817337, 0.7819796, -1.315891, 1, 1, 1, 1, 1,
-1.813457, -2.41572, -2.658021, 1, 1, 1, 1, 1,
-1.80702, -0.74345, -1.639605, 1, 1, 1, 1, 1,
-1.790824, -0.718438, -1.001307, 1, 1, 1, 1, 1,
-1.783672, -0.4882543, -2.509087, 0, 0, 1, 1, 1,
-1.778425, 0.4463096, -0.6283643, 1, 0, 0, 1, 1,
-1.765785, -0.2608189, 0.4062493, 1, 0, 0, 1, 1,
-1.749119, 0.106245, -1.280248, 1, 0, 0, 1, 1,
-1.727305, -0.6201062, -1.072854, 1, 0, 0, 1, 1,
-1.725657, -0.1806138, -2.188846, 1, 0, 0, 1, 1,
-1.705858, -0.2390756, -2.405742, 0, 0, 0, 1, 1,
-1.704793, 1.809727, -0.7990061, 0, 0, 0, 1, 1,
-1.663424, -0.8384952, -1.585527, 0, 0, 0, 1, 1,
-1.660071, -0.1916532, -0.1433196, 0, 0, 0, 1, 1,
-1.65771, -0.5091546, -0.9297605, 0, 0, 0, 1, 1,
-1.657654, -0.02190448, -0.4438091, 0, 0, 0, 1, 1,
-1.649923, -0.9500766, -1.679897, 0, 0, 0, 1, 1,
-1.626273, -0.6615923, -1.205379, 1, 1, 1, 1, 1,
-1.625388, -0.492145, -1.695199, 1, 1, 1, 1, 1,
-1.624845, -0.2155398, -1.371386, 1, 1, 1, 1, 1,
-1.609076, -1.682377, -1.900539, 1, 1, 1, 1, 1,
-1.602363, 0.1020869, -1.167619, 1, 1, 1, 1, 1,
-1.599768, 0.179398, -1.900832, 1, 1, 1, 1, 1,
-1.598659, 0.4975221, -0.4943393, 1, 1, 1, 1, 1,
-1.598527, -0.258487, -0.475955, 1, 1, 1, 1, 1,
-1.597717, -0.9444433, -2.272811, 1, 1, 1, 1, 1,
-1.596392, -1.097178, -3.195004, 1, 1, 1, 1, 1,
-1.591811, 1.33325, -0.6917931, 1, 1, 1, 1, 1,
-1.585659, 1.559741, -0.4694451, 1, 1, 1, 1, 1,
-1.568159, -0.2369095, -2.430395, 1, 1, 1, 1, 1,
-1.567825, -1.04164, -3.570133, 1, 1, 1, 1, 1,
-1.566743, 0.2257669, -0.97237, 1, 1, 1, 1, 1,
-1.562966, -0.4600348, -2.334181, 0, 0, 1, 1, 1,
-1.548021, 0.3172623, -2.100532, 1, 0, 0, 1, 1,
-1.540314, 0.2889108, 0.2403078, 1, 0, 0, 1, 1,
-1.533681, -0.6031618, 0.0164311, 1, 0, 0, 1, 1,
-1.523921, -0.8240429, -2.817823, 1, 0, 0, 1, 1,
-1.512996, -0.02755251, -0.1929392, 1, 0, 0, 1, 1,
-1.511276, -0.9729335, -2.077033, 0, 0, 0, 1, 1,
-1.507844, 0.8977023, -0.5603899, 0, 0, 0, 1, 1,
-1.504471, -0.7060756, -1.925527, 0, 0, 0, 1, 1,
-1.501936, -0.5946192, -0.7910123, 0, 0, 0, 1, 1,
-1.485736, -1.365745, -2.172271, 0, 0, 0, 1, 1,
-1.478731, -0.5957827, -2.974302, 0, 0, 0, 1, 1,
-1.477641, -0.5992686, -3.366246, 0, 0, 0, 1, 1,
-1.442701, -0.9530659, -1.757378, 1, 1, 1, 1, 1,
-1.44021, 0.6313711, -0.9785582, 1, 1, 1, 1, 1,
-1.438568, -1.261775, -4.446051, 1, 1, 1, 1, 1,
-1.435348, 1.276496, 1.542539, 1, 1, 1, 1, 1,
-1.410641, -1.361867, -2.255202, 1, 1, 1, 1, 1,
-1.401518, 0.5669157, -0.934369, 1, 1, 1, 1, 1,
-1.396595, 1.322202, 0.3083338, 1, 1, 1, 1, 1,
-1.389827, 0.1419739, -2.564237, 1, 1, 1, 1, 1,
-1.376246, -0.9947364, -1.259832, 1, 1, 1, 1, 1,
-1.373711, -1.487684, -2.858811, 1, 1, 1, 1, 1,
-1.373435, 0.9772531, -0.8440619, 1, 1, 1, 1, 1,
-1.372861, 1.038499, 0.6567152, 1, 1, 1, 1, 1,
-1.372012, -2.031453, -2.163934, 1, 1, 1, 1, 1,
-1.371204, 1.176356, -1.987496, 1, 1, 1, 1, 1,
-1.369256, -0.6036199, -0.8469088, 1, 1, 1, 1, 1,
-1.361585, 0.3353342, -0.593142, 0, 0, 1, 1, 1,
-1.360826, 0.6488996, -1.013515, 1, 0, 0, 1, 1,
-1.359083, -0.4255417, -2.052612, 1, 0, 0, 1, 1,
-1.351059, 0.01950829, -2.221356, 1, 0, 0, 1, 1,
-1.350688, -0.4056198, -1.631224, 1, 0, 0, 1, 1,
-1.332249, 1.72417, -1.777022, 1, 0, 0, 1, 1,
-1.329642, 0.6191347, -1.336026, 0, 0, 0, 1, 1,
-1.324699, -0.80805, -2.772596, 0, 0, 0, 1, 1,
-1.324171, -0.23453, -1.851022, 0, 0, 0, 1, 1,
-1.323031, 2.056614, -0.07851945, 0, 0, 0, 1, 1,
-1.322929, -0.1576177, -1.384026, 0, 0, 0, 1, 1,
-1.322218, -0.06851798, -3.072371, 0, 0, 0, 1, 1,
-1.317343, 1.471542, -0.316563, 0, 0, 0, 1, 1,
-1.304106, -1.166728, -4.270413, 1, 1, 1, 1, 1,
-1.302355, 1.109864, -1.036244, 1, 1, 1, 1, 1,
-1.297543, -1.030876, -1.242999, 1, 1, 1, 1, 1,
-1.296661, 0.3952827, -0.6339822, 1, 1, 1, 1, 1,
-1.292099, -0.4555943, -3.206896, 1, 1, 1, 1, 1,
-1.290394, -0.09627682, 0.005199471, 1, 1, 1, 1, 1,
-1.288953, 0.1651446, -1.601202, 1, 1, 1, 1, 1,
-1.277614, -0.276889, -1.484553, 1, 1, 1, 1, 1,
-1.276556, -0.0884795, -1.894325, 1, 1, 1, 1, 1,
-1.274467, -2.066543, -2.670909, 1, 1, 1, 1, 1,
-1.26662, 0.4967743, -1.664253, 1, 1, 1, 1, 1,
-1.26515, 0.2747568, -0.9687092, 1, 1, 1, 1, 1,
-1.261067, 0.7563081, -1.591828, 1, 1, 1, 1, 1,
-1.254296, -2.096284, -1.951548, 1, 1, 1, 1, 1,
-1.251462, 1.431006, -0.8333259, 1, 1, 1, 1, 1,
-1.249292, 0.3865028, -2.251061, 0, 0, 1, 1, 1,
-1.24716, 0.625167, 0.7539083, 1, 0, 0, 1, 1,
-1.24623, 0.8536083, -1.335423, 1, 0, 0, 1, 1,
-1.244794, -1.506837, -1.177741, 1, 0, 0, 1, 1,
-1.24274, -1.713875, -2.505613, 1, 0, 0, 1, 1,
-1.242089, -0.1559067, -0.9054979, 1, 0, 0, 1, 1,
-1.240935, -0.3660157, -3.509778, 0, 0, 0, 1, 1,
-1.239574, 0.5439145, -1.598161, 0, 0, 0, 1, 1,
-1.238166, -1.290066, -2.939692, 0, 0, 0, 1, 1,
-1.229605, 0.0338125, -1.332986, 0, 0, 0, 1, 1,
-1.211592, 1.186707, -0.8670155, 0, 0, 0, 1, 1,
-1.192486, 1.21557, -1.483285, 0, 0, 0, 1, 1,
-1.190089, -0.6647344, -3.74687, 0, 0, 0, 1, 1,
-1.188911, 0.502059, -1.314192, 1, 1, 1, 1, 1,
-1.183291, 1.420547, -0.789391, 1, 1, 1, 1, 1,
-1.182708, 0.01833123, -1.208096, 1, 1, 1, 1, 1,
-1.181821, -2.094392, -2.468246, 1, 1, 1, 1, 1,
-1.16894, -2.192991, -2.968328, 1, 1, 1, 1, 1,
-1.166391, 2.381667, 0.6364598, 1, 1, 1, 1, 1,
-1.163494, 1.569931, -0.3418438, 1, 1, 1, 1, 1,
-1.162538, 1.842624, -1.275308, 1, 1, 1, 1, 1,
-1.161002, 0.1284949, -0.9219984, 1, 1, 1, 1, 1,
-1.158254, 1.554754, -2.299579, 1, 1, 1, 1, 1,
-1.157922, 0.2038393, -2.136586, 1, 1, 1, 1, 1,
-1.157517, -0.3279567, -1.542183, 1, 1, 1, 1, 1,
-1.156882, -1.027777, -1.727649, 1, 1, 1, 1, 1,
-1.154281, -1.02524, -2.729855, 1, 1, 1, 1, 1,
-1.143345, 0.2544393, -1.454305, 1, 1, 1, 1, 1,
-1.13667, -0.5995231, -0.6598556, 0, 0, 1, 1, 1,
-1.1355, -0.1585044, -2.785964, 1, 0, 0, 1, 1,
-1.129838, -1.663822, -0.9158359, 1, 0, 0, 1, 1,
-1.124518, 0.4469688, -0.9648795, 1, 0, 0, 1, 1,
-1.121838, -0.8879798, -1.613081, 1, 0, 0, 1, 1,
-1.119942, 2.25587, -1.111913, 1, 0, 0, 1, 1,
-1.105945, -1.003174, -1.372242, 0, 0, 0, 1, 1,
-1.097079, 0.7036066, -2.077858, 0, 0, 0, 1, 1,
-1.095176, -0.1476444, -1.361557, 0, 0, 0, 1, 1,
-1.085898, 1.212166, -0.3729445, 0, 0, 0, 1, 1,
-1.072477, 1.971689, -2.006307, 0, 0, 0, 1, 1,
-1.071807, -0.6700053, -1.134087, 0, 0, 0, 1, 1,
-1.062258, -0.8942252, -3.241302, 0, 0, 0, 1, 1,
-1.061069, 0.7257921, 2.307035, 1, 1, 1, 1, 1,
-1.060425, -0.7802047, -1.774946, 1, 1, 1, 1, 1,
-1.05789, -0.947289, -1.640385, 1, 1, 1, 1, 1,
-1.05372, 1.312759, -0.05350147, 1, 1, 1, 1, 1,
-1.050373, 0.4579915, -0.4315131, 1, 1, 1, 1, 1,
-1.047791, -0.6472402, -1.582429, 1, 1, 1, 1, 1,
-1.046997, -1.231459, -2.886148, 1, 1, 1, 1, 1,
-1.039134, 0.5824738, 0.07499859, 1, 1, 1, 1, 1,
-1.017228, 1.058193, -2.072927, 1, 1, 1, 1, 1,
-1.00869, 1.339977, -0.7863379, 1, 1, 1, 1, 1,
-1.007173, 0.8566143, -0.1507259, 1, 1, 1, 1, 1,
-1.001251, 0.3621696, -1.014437, 1, 1, 1, 1, 1,
-0.993401, 0.2027275, -0.5796961, 1, 1, 1, 1, 1,
-0.9865215, 0.4292953, -0.6072271, 1, 1, 1, 1, 1,
-0.9849871, -0.8825034, -2.338181, 1, 1, 1, 1, 1,
-0.9797707, 1.099279, -0.631158, 0, 0, 1, 1, 1,
-0.9772742, 0.7258983, -0.7841747, 1, 0, 0, 1, 1,
-0.9767637, 1.947747, -1.200266, 1, 0, 0, 1, 1,
-0.976522, 0.2367048, -1.508092, 1, 0, 0, 1, 1,
-0.9603338, 0.9495888, 0.3642648, 1, 0, 0, 1, 1,
-0.9600487, -0.07672492, -1.553691, 1, 0, 0, 1, 1,
-0.9497709, -0.9435571, -2.100709, 0, 0, 0, 1, 1,
-0.9490042, -0.1511352, -1.001134, 0, 0, 0, 1, 1,
-0.9417515, -0.4303274, -2.336632, 0, 0, 0, 1, 1,
-0.9378312, -0.1151816, -2.461575, 0, 0, 0, 1, 1,
-0.9262393, -0.2982642, -1.443619, 0, 0, 0, 1, 1,
-0.9250647, 1.942312, 1.197298, 0, 0, 0, 1, 1,
-0.9213607, -0.2072387, -1.613087, 0, 0, 0, 1, 1,
-0.9184116, 0.2592113, -2.594197, 1, 1, 1, 1, 1,
-0.9118878, -0.06622602, -0.2467861, 1, 1, 1, 1, 1,
-0.9088548, 0.7493086, -0.4424096, 1, 1, 1, 1, 1,
-0.9079266, 1.268587, 0.6127017, 1, 1, 1, 1, 1,
-0.8999546, -0.2718172, -1.793798, 1, 1, 1, 1, 1,
-0.8969921, -1.214885, -4.232053, 1, 1, 1, 1, 1,
-0.8967975, -0.208035, -2.255338, 1, 1, 1, 1, 1,
-0.8880184, -0.5500718, -1.615196, 1, 1, 1, 1, 1,
-0.8869226, 0.2531889, -2.663866, 1, 1, 1, 1, 1,
-0.8847597, -0.588263, -1.802665, 1, 1, 1, 1, 1,
-0.8806385, -2.656852, -3.08686, 1, 1, 1, 1, 1,
-0.8794236, 0.4951834, -1.589177, 1, 1, 1, 1, 1,
-0.8781153, -1.162528, -2.701335, 1, 1, 1, 1, 1,
-0.8775824, -0.451784, -0.06198825, 1, 1, 1, 1, 1,
-0.8727052, -0.5787249, -0.941107, 1, 1, 1, 1, 1,
-0.8645573, 0.4703639, 0.3596684, 0, 0, 1, 1, 1,
-0.851602, -0.6148228, -2.584847, 1, 0, 0, 1, 1,
-0.8433906, -0.6072358, -2.77522, 1, 0, 0, 1, 1,
-0.8314732, -0.4155401, -3.452968, 1, 0, 0, 1, 1,
-0.8308201, -0.5183553, -4.872775, 1, 0, 0, 1, 1,
-0.829722, -0.2332512, -2.774565, 1, 0, 0, 1, 1,
-0.8214963, -0.9310618, -3.005522, 0, 0, 0, 1, 1,
-0.8189752, 0.1025662, -0.9926085, 0, 0, 0, 1, 1,
-0.8160599, -1.063971, -2.86658, 0, 0, 0, 1, 1,
-0.8120413, 1.166014, -1.201787, 0, 0, 0, 1, 1,
-0.8113539, -1.256488, -2.533962, 0, 0, 0, 1, 1,
-0.8078153, 2.306639, -0.8157189, 0, 0, 0, 1, 1,
-0.8076271, 1.192132, -1.36074, 0, 0, 0, 1, 1,
-0.8067433, -0.8676191, -1.961144, 1, 1, 1, 1, 1,
-0.8031779, 0.9301233, 0.499805, 1, 1, 1, 1, 1,
-0.8016879, -1.496711, -2.181461, 1, 1, 1, 1, 1,
-0.7915897, -1.4748, -2.36289, 1, 1, 1, 1, 1,
-0.7815311, 1.332378, -0.08043934, 1, 1, 1, 1, 1,
-0.7732077, -1.73633, -3.969584, 1, 1, 1, 1, 1,
-0.7719388, 0.1380825, -0.9881147, 1, 1, 1, 1, 1,
-0.7683544, 1.337659, -2.744145, 1, 1, 1, 1, 1,
-0.7662855, 0.6892554, 1.758605, 1, 1, 1, 1, 1,
-0.7643579, -0.8176584, -2.577209, 1, 1, 1, 1, 1,
-0.7559385, -0.7333561, -2.698796, 1, 1, 1, 1, 1,
-0.7535202, 1.422862, 0.5427783, 1, 1, 1, 1, 1,
-0.7470735, -1.670795, -4.294349, 1, 1, 1, 1, 1,
-0.7417663, 0.5681277, -2.515719, 1, 1, 1, 1, 1,
-0.7384759, -0.219127, -1.699725, 1, 1, 1, 1, 1,
-0.7378371, 1.066439, 0.0672544, 0, 0, 1, 1, 1,
-0.7374235, 1.203711, -0.853962, 1, 0, 0, 1, 1,
-0.733513, 0.6788828, -0.6913216, 1, 0, 0, 1, 1,
-0.7329454, 0.6761467, -0.6083292, 1, 0, 0, 1, 1,
-0.7293662, 1.613451, 0.8034247, 1, 0, 0, 1, 1,
-0.7280853, -0.5861258, -0.8903685, 1, 0, 0, 1, 1,
-0.7279915, 0.8843488, -0.8383039, 0, 0, 0, 1, 1,
-0.7272888, -0.9530748, -2.202652, 0, 0, 0, 1, 1,
-0.72357, -0.7073486, -2.847425, 0, 0, 0, 1, 1,
-0.7137401, -1.029056, -2.015568, 0, 0, 0, 1, 1,
-0.7136685, -2.368203, -2.457182, 0, 0, 0, 1, 1,
-0.7134764, -0.002528601, -1.749249, 0, 0, 0, 1, 1,
-0.7126795, -0.4295103, -1.424934, 0, 0, 0, 1, 1,
-0.7115744, -0.6659415, -1.529746, 1, 1, 1, 1, 1,
-0.710082, -2.008116, -2.057745, 1, 1, 1, 1, 1,
-0.7095505, -1.719318, -1.405599, 1, 1, 1, 1, 1,
-0.7082317, 0.2802227, 0.2422239, 1, 1, 1, 1, 1,
-0.7073098, 2.962806, 0.4796064, 1, 1, 1, 1, 1,
-0.7042459, -0.6175352, -2.355361, 1, 1, 1, 1, 1,
-0.7014624, 1.338524, -0.2427877, 1, 1, 1, 1, 1,
-0.7001536, 0.2527237, -0.7939824, 1, 1, 1, 1, 1,
-0.6999459, -0.3324613, -2.216699, 1, 1, 1, 1, 1,
-0.6992981, 1.023378, 0.810453, 1, 1, 1, 1, 1,
-0.6981381, -1.338228, -2.273765, 1, 1, 1, 1, 1,
-0.6948153, -0.09533952, -3.187566, 1, 1, 1, 1, 1,
-0.6861217, -1.058475, -3.190764, 1, 1, 1, 1, 1,
-0.6835005, 0.4781237, -1.940753, 1, 1, 1, 1, 1,
-0.6818169, -0.01662762, -1.861769, 1, 1, 1, 1, 1,
-0.6817521, 0.4066883, 0.2028284, 0, 0, 1, 1, 1,
-0.6802214, 0.3860446, -0.0002956956, 1, 0, 0, 1, 1,
-0.6732591, -1.646073, -1.498864, 1, 0, 0, 1, 1,
-0.6724931, -0.1753299, -0.04526355, 1, 0, 0, 1, 1,
-0.6710591, -1.16995, -3.091528, 1, 0, 0, 1, 1,
-0.6691628, 0.2201749, -2.109074, 1, 0, 0, 1, 1,
-0.6647115, 1.484493, -0.4272204, 0, 0, 0, 1, 1,
-0.6632999, 0.3237109, -0.3360395, 0, 0, 0, 1, 1,
-0.6581161, 1.317173, 0.9788807, 0, 0, 0, 1, 1,
-0.6501413, 0.03441692, -1.53264, 0, 0, 0, 1, 1,
-0.6484807, -1.563981, -2.563428, 0, 0, 0, 1, 1,
-0.6451816, -0.2183048, -1.175267, 0, 0, 0, 1, 1,
-0.6413391, -0.781812, -0.9939048, 0, 0, 0, 1, 1,
-0.639319, -0.6088655, -3.041817, 1, 1, 1, 1, 1,
-0.6370436, 1.320701, -0.07910863, 1, 1, 1, 1, 1,
-0.6316409, 2.815425, -1.65832, 1, 1, 1, 1, 1,
-0.6306359, 1.317906, -1.718187, 1, 1, 1, 1, 1,
-0.6299641, -0.8603926, -2.496691, 1, 1, 1, 1, 1,
-0.6287414, -1.521204, -3.365997, 1, 1, 1, 1, 1,
-0.6270767, 0.450047, -1.694041, 1, 1, 1, 1, 1,
-0.6208106, -0.6710359, -0.3506119, 1, 1, 1, 1, 1,
-0.6207554, 0.02089818, 0.2746128, 1, 1, 1, 1, 1,
-0.6155447, -2.332337, -0.8032762, 1, 1, 1, 1, 1,
-0.6152481, -1.102354, -0.7339374, 1, 1, 1, 1, 1,
-0.6140171, 1.901696, -2.059226, 1, 1, 1, 1, 1,
-0.6053926, -0.7102737, -1.03516, 1, 1, 1, 1, 1,
-0.5943406, -1.311853, -4.792146, 1, 1, 1, 1, 1,
-0.594027, -0.3652306, -2.21427, 1, 1, 1, 1, 1,
-0.592485, 0.712634, -1.848183, 0, 0, 1, 1, 1,
-0.5897401, -0.6939631, -1.323728, 1, 0, 0, 1, 1,
-0.5852434, 0.2959482, -0.8664598, 1, 0, 0, 1, 1,
-0.5850976, 0.4198613, -0.6789727, 1, 0, 0, 1, 1,
-0.584999, 1.420899, -0.3884756, 1, 0, 0, 1, 1,
-0.5819694, -0.7822756, -2.690413, 1, 0, 0, 1, 1,
-0.579881, 0.8673151, -3.947275, 0, 0, 0, 1, 1,
-0.5792127, -1.984732, -3.372671, 0, 0, 0, 1, 1,
-0.5748215, -0.4563563, -2.534648, 0, 0, 0, 1, 1,
-0.5725035, -2.363276, -3.970183, 0, 0, 0, 1, 1,
-0.5714679, -0.8114253, -2.718997, 0, 0, 0, 1, 1,
-0.5694605, 1.390574, 1.713218, 0, 0, 0, 1, 1,
-0.5691489, -0.9065974, -1.422034, 0, 0, 0, 1, 1,
-0.5687223, 1.107864, 0.4212103, 1, 1, 1, 1, 1,
-0.5613624, 0.9028527, 0.8091893, 1, 1, 1, 1, 1,
-0.554621, -2.174567, -2.827805, 1, 1, 1, 1, 1,
-0.5529191, -0.9559761, -3.181417, 1, 1, 1, 1, 1,
-0.551546, 0.03641511, -2.147514, 1, 1, 1, 1, 1,
-0.5490945, 0.4692747, -0.9975407, 1, 1, 1, 1, 1,
-0.545231, 0.2079426, -1.499336, 1, 1, 1, 1, 1,
-0.5413056, 0.5189431, -1.331727, 1, 1, 1, 1, 1,
-0.5380611, 0.8617653, 0.9598476, 1, 1, 1, 1, 1,
-0.5364041, 0.6560469, 0.6155205, 1, 1, 1, 1, 1,
-0.5272771, 0.2471289, -2.489592, 1, 1, 1, 1, 1,
-0.5211261, 0.5766929, -0.2719014, 1, 1, 1, 1, 1,
-0.5195158, 0.4079009, -0.6666883, 1, 1, 1, 1, 1,
-0.5182248, 0.253272, -1.025687, 1, 1, 1, 1, 1,
-0.5172408, -1.250217, -3.859056, 1, 1, 1, 1, 1,
-0.5163526, -0.6120269, -2.776866, 0, 0, 1, 1, 1,
-0.513186, 0.2015888, -2.19022, 1, 0, 0, 1, 1,
-0.5119141, -0.8461863, -2.78552, 1, 0, 0, 1, 1,
-0.5102527, -0.7654961, -1.060989, 1, 0, 0, 1, 1,
-0.5101233, 1.281595, -1.952666, 1, 0, 0, 1, 1,
-0.5088024, -0.8764801, -2.946203, 1, 0, 0, 1, 1,
-0.5022668, -0.06721257, -2.979057, 0, 0, 0, 1, 1,
-0.49733, 0.7887954, -0.4064328, 0, 0, 0, 1, 1,
-0.4969035, 0.9889088, -0.6215659, 0, 0, 0, 1, 1,
-0.4968246, -0.4933195, -1.864342, 0, 0, 0, 1, 1,
-0.4964808, -0.4583034, -1.987084, 0, 0, 0, 1, 1,
-0.4924571, 1.493311, 0.1433289, 0, 0, 0, 1, 1,
-0.4919259, 0.3571981, -0.7546698, 0, 0, 0, 1, 1,
-0.4886363, 0.4316649, -1.431869, 1, 1, 1, 1, 1,
-0.4798948, -0.1132944, -0.4065858, 1, 1, 1, 1, 1,
-0.4797851, -1.333738, -2.896939, 1, 1, 1, 1, 1,
-0.4707459, 0.3255357, -0.7457353, 1, 1, 1, 1, 1,
-0.4702817, 0.2460157, 0.1433728, 1, 1, 1, 1, 1,
-0.4670624, 1.013915, 0.6969569, 1, 1, 1, 1, 1,
-0.4655082, -0.1754851, -1.404209, 1, 1, 1, 1, 1,
-0.4628458, -0.08441677, -0.6343576, 1, 1, 1, 1, 1,
-0.462371, -0.6294427, -1.763787, 1, 1, 1, 1, 1,
-0.4600981, 0.2403217, -2.286249, 1, 1, 1, 1, 1,
-0.4569891, -1.832727, -3.896485, 1, 1, 1, 1, 1,
-0.4555657, 0.9402986, 0.5401924, 1, 1, 1, 1, 1,
-0.4553882, 1.403851, 0.3393307, 1, 1, 1, 1, 1,
-0.4502926, 0.7954807, -0.6632614, 1, 1, 1, 1, 1,
-0.4492999, -0.1277122, -1.102486, 1, 1, 1, 1, 1,
-0.4464505, 0.2876537, -1.811596, 0, 0, 1, 1, 1,
-0.4444528, 0.702794, 0.9456478, 1, 0, 0, 1, 1,
-0.4311113, -0.4969388, -2.005863, 1, 0, 0, 1, 1,
-0.4269719, -0.9606758, -4.177652, 1, 0, 0, 1, 1,
-0.4246996, -0.5225412, -3.348578, 1, 0, 0, 1, 1,
-0.4215889, -1.602305, -3.022826, 1, 0, 0, 1, 1,
-0.4204413, 0.4884565, -0.1118363, 0, 0, 0, 1, 1,
-0.4192386, 1.952857, 0.3330934, 0, 0, 0, 1, 1,
-0.4168258, -0.621979, -3.180762, 0, 0, 0, 1, 1,
-0.4150913, -0.7993972, -3.918326, 0, 0, 0, 1, 1,
-0.4139232, -0.2564534, -2.563976, 0, 0, 0, 1, 1,
-0.4036082, 1.123636, -0.1928446, 0, 0, 0, 1, 1,
-0.3994848, 2.551049, 0.3644589, 0, 0, 0, 1, 1,
-0.3921434, 0.1816932, -0.009753181, 1, 1, 1, 1, 1,
-0.3910263, -0.4923374, -2.505203, 1, 1, 1, 1, 1,
-0.3891762, 1.429694, 0.5865112, 1, 1, 1, 1, 1,
-0.3878278, -0.6268863, -1.473077, 1, 1, 1, 1, 1,
-0.387006, -0.1000666, -2.911635, 1, 1, 1, 1, 1,
-0.3846592, -0.6503493, -3.365585, 1, 1, 1, 1, 1,
-0.3762765, -1.213378, -2.310316, 1, 1, 1, 1, 1,
-0.3737794, 0.7082549, -1.684955, 1, 1, 1, 1, 1,
-0.3713688, 0.6542653, 0.2837346, 1, 1, 1, 1, 1,
-0.3710472, 0.2144971, -1.203375, 1, 1, 1, 1, 1,
-0.3659156, -0.275801, -0.6508811, 1, 1, 1, 1, 1,
-0.3648895, 1.290698, -0.5285526, 1, 1, 1, 1, 1,
-0.3615192, -0.927089, -3.172537, 1, 1, 1, 1, 1,
-0.3598806, 0.09313887, -2.68915, 1, 1, 1, 1, 1,
-0.359486, -1.22975, -3.704975, 1, 1, 1, 1, 1,
-0.3547199, -1.046522, -4.576651, 0, 0, 1, 1, 1,
-0.3538198, -0.5840756, -1.47206, 1, 0, 0, 1, 1,
-0.3537993, 1.790346, -1.714825, 1, 0, 0, 1, 1,
-0.353633, -0.5005424, -3.105352, 1, 0, 0, 1, 1,
-0.352087, 1.558408, 0.4437692, 1, 0, 0, 1, 1,
-0.3515395, -1.041745, -3.557626, 1, 0, 0, 1, 1,
-0.3394855, 0.1265507, -1.769696, 0, 0, 0, 1, 1,
-0.3393393, 0.9179248, -1.345734, 0, 0, 0, 1, 1,
-0.3349193, -1.403595, -1.885189, 0, 0, 0, 1, 1,
-0.3337766, -1.900562, -3.366587, 0, 0, 0, 1, 1,
-0.3314541, 0.3730643, 0.7545257, 0, 0, 0, 1, 1,
-0.3309429, 0.9747411, -0.8329042, 0, 0, 0, 1, 1,
-0.3295924, 0.3127117, -1.930414, 0, 0, 0, 1, 1,
-0.3286817, 0.9390475, -1.991539, 1, 1, 1, 1, 1,
-0.3255514, 1.572586, -0.5558523, 1, 1, 1, 1, 1,
-0.3156402, 0.3650458, -0.6723948, 1, 1, 1, 1, 1,
-0.3115201, -0.3937579, -1.662175, 1, 1, 1, 1, 1,
-0.3113168, -0.5251448, -1.928844, 1, 1, 1, 1, 1,
-0.3072769, -0.88936, -2.417872, 1, 1, 1, 1, 1,
-0.3048503, -1.240501, -2.344741, 1, 1, 1, 1, 1,
-0.3031809, 0.5197291, -1.092301, 1, 1, 1, 1, 1,
-0.3010994, -1.811885, -3.053751, 1, 1, 1, 1, 1,
-0.2960636, 1.348918, 0.07103954, 1, 1, 1, 1, 1,
-0.2959959, -0.531634, -2.725202, 1, 1, 1, 1, 1,
-0.2942979, -0.8091599, -3.821739, 1, 1, 1, 1, 1,
-0.2892341, -0.5439928, -4.277744, 1, 1, 1, 1, 1,
-0.2865761, 0.9297684, -1.811873, 1, 1, 1, 1, 1,
-0.2858037, -0.3602332, -1.385675, 1, 1, 1, 1, 1,
-0.2838565, -0.9186503, -2.819545, 0, 0, 1, 1, 1,
-0.2795325, 1.237153, 0.7936929, 1, 0, 0, 1, 1,
-0.2789362, 0.2389183, -0.4389207, 1, 0, 0, 1, 1,
-0.2767314, -0.5421634, -1.690624, 1, 0, 0, 1, 1,
-0.2723099, 0.3735515, -0.5471902, 1, 0, 0, 1, 1,
-0.2684487, -0.8215225, -1.932547, 1, 0, 0, 1, 1,
-0.2676037, -0.4985483, -1.401811, 0, 0, 0, 1, 1,
-0.265209, 0.06665213, -1.588545, 0, 0, 0, 1, 1,
-0.2645292, 1.399611, 0.7548218, 0, 0, 0, 1, 1,
-0.2629184, -1.037738, -2.789199, 0, 0, 0, 1, 1,
-0.2618856, -0.875266, -3.155417, 0, 0, 0, 1, 1,
-0.260455, -0.1239482, -1.441739, 0, 0, 0, 1, 1,
-0.2595862, 1.064826, 0.5056664, 0, 0, 0, 1, 1,
-0.2570418, 1.25372, -1.006893, 1, 1, 1, 1, 1,
-0.2570282, -0.2256523, -2.369852, 1, 1, 1, 1, 1,
-0.2540907, -0.3814015, -1.951577, 1, 1, 1, 1, 1,
-0.2510136, -0.4818552, -3.020722, 1, 1, 1, 1, 1,
-0.249236, 1.378514, -0.1331869, 1, 1, 1, 1, 1,
-0.2458178, -1.342789, -2.069471, 1, 1, 1, 1, 1,
-0.2438229, 0.4591511, 0.6157578, 1, 1, 1, 1, 1,
-0.2429933, -1.606877, -2.319377, 1, 1, 1, 1, 1,
-0.2424716, -0.8450532, -2.606353, 1, 1, 1, 1, 1,
-0.239885, -0.9291889, -2.486994, 1, 1, 1, 1, 1,
-0.2369111, 0.7049736, -0.475425, 1, 1, 1, 1, 1,
-0.2343782, 0.1651212, -1.304268, 1, 1, 1, 1, 1,
-0.2342346, 0.6992797, -0.8335452, 1, 1, 1, 1, 1,
-0.229258, -0.7113506, -1.182836, 1, 1, 1, 1, 1,
-0.2173379, 0.481187, -1.076963, 1, 1, 1, 1, 1,
-0.214495, 0.5034407, -0.3342404, 0, 0, 1, 1, 1,
-0.2125404, -2.220824, -1.343162, 1, 0, 0, 1, 1,
-0.2116781, 0.3912976, -0.2186986, 1, 0, 0, 1, 1,
-0.2099157, 0.8730753, -1.726652, 1, 0, 0, 1, 1,
-0.2089068, -0.1316693, -1.402504, 1, 0, 0, 1, 1,
-0.2061646, -0.2783583, -1.309793, 1, 0, 0, 1, 1,
-0.2060609, -2.249066, -0.683699, 0, 0, 0, 1, 1,
-0.2002029, -0.3088681, -2.369604, 0, 0, 0, 1, 1,
-0.1982043, -0.8253278, -2.84037, 0, 0, 0, 1, 1,
-0.1945489, -0.03132027, -2.497168, 0, 0, 0, 1, 1,
-0.1906511, 0.3832972, -0.1817178, 0, 0, 0, 1, 1,
-0.1896007, -0.1355779, -1.760186, 0, 0, 0, 1, 1,
-0.1760547, 0.4620866, -0.6536644, 0, 0, 0, 1, 1,
-0.1734295, -0.1271139, -2.273733, 1, 1, 1, 1, 1,
-0.1714169, 0.533334, 0.3532681, 1, 1, 1, 1, 1,
-0.1645014, -1.588209, -2.544385, 1, 1, 1, 1, 1,
-0.162403, 0.9481601, -0.8294494, 1, 1, 1, 1, 1,
-0.1588285, 0.3267483, -1.771683, 1, 1, 1, 1, 1,
-0.1560962, -0.9667353, -2.655421, 1, 1, 1, 1, 1,
-0.1555555, -0.7665981, -2.27636, 1, 1, 1, 1, 1,
-0.1545346, -0.4726987, -1.315915, 1, 1, 1, 1, 1,
-0.1475277, 1.182678, -0.3309953, 1, 1, 1, 1, 1,
-0.1467439, -0.2567163, -3.787871, 1, 1, 1, 1, 1,
-0.1464947, -0.9731605, -1.312435, 1, 1, 1, 1, 1,
-0.1435313, 0.04702596, -1.020512, 1, 1, 1, 1, 1,
-0.141295, 0.1461849, -0.3197159, 1, 1, 1, 1, 1,
-0.1362224, 1.188158, 1.5357, 1, 1, 1, 1, 1,
-0.1361476, 1.805111, 0.1025119, 1, 1, 1, 1, 1,
-0.1334987, 0.1659628, -2.228438, 0, 0, 1, 1, 1,
-0.1325138, -0.0952104, -1.862564, 1, 0, 0, 1, 1,
-0.1245167, 2.010895, 0.5811369, 1, 0, 0, 1, 1,
-0.1240286, 0.9098711, -1.540751, 1, 0, 0, 1, 1,
-0.120927, -0.2361118, -0.5604538, 1, 0, 0, 1, 1,
-0.1138756, 0.961962, -1.453832, 1, 0, 0, 1, 1,
-0.1106726, 0.5361305, 0.3892389, 0, 0, 0, 1, 1,
-0.1098033, 0.9825967, -1.378318, 0, 0, 0, 1, 1,
-0.1050005, 0.3723491, -0.6244903, 0, 0, 0, 1, 1,
-0.1032174, -0.3427478, -3.38671, 0, 0, 0, 1, 1,
-0.09887793, 2.60941, -0.2453581, 0, 0, 0, 1, 1,
-0.09870898, 1.375707, 1.690654, 0, 0, 0, 1, 1,
-0.09747181, 1.534196, -0.1368557, 0, 0, 0, 1, 1,
-0.0966251, -0.5807395, -3.762318, 1, 1, 1, 1, 1,
-0.09636469, 1.382757, -1.934386, 1, 1, 1, 1, 1,
-0.09484828, -0.2693163, -4.084234, 1, 1, 1, 1, 1,
-0.09464067, -0.2888457, -1.866876, 1, 1, 1, 1, 1,
-0.09412276, -1.719751, -2.458307, 1, 1, 1, 1, 1,
-0.09361443, 1.435102, -1.758896, 1, 1, 1, 1, 1,
-0.09072436, 0.3472472, 1.370514, 1, 1, 1, 1, 1,
-0.09047961, 0.5185677, -0.4317468, 1, 1, 1, 1, 1,
-0.08753452, -0.8818601, -3.508815, 1, 1, 1, 1, 1,
-0.08432788, 2.020846, 2.556058, 1, 1, 1, 1, 1,
-0.07950919, -0.6365838, -4.349993, 1, 1, 1, 1, 1,
-0.07636065, 1.15241, -1.244824, 1, 1, 1, 1, 1,
-0.07505036, -0.9978237, -4.639906, 1, 1, 1, 1, 1,
-0.07409985, 0.164831, -0.9276326, 1, 1, 1, 1, 1,
-0.07237061, 0.2722339, -0.5802292, 1, 1, 1, 1, 1,
-0.06297453, -0.8518387, -2.276898, 0, 0, 1, 1, 1,
-0.06139638, 1.36113, -1.060136, 1, 0, 0, 1, 1,
-0.05882787, -1.103134, -3.226243, 1, 0, 0, 1, 1,
-0.05747587, 0.4055295, 1.499496, 1, 0, 0, 1, 1,
-0.05717043, -0.09963746, -3.412712, 1, 0, 0, 1, 1,
-0.05543145, -0.8536807, -3.981653, 1, 0, 0, 1, 1,
-0.05376043, -1.1505, -1.324556, 0, 0, 0, 1, 1,
-0.0532706, 0.4354145, -0.2003124, 0, 0, 0, 1, 1,
-0.04942336, 0.006556332, -2.180614, 0, 0, 0, 1, 1,
-0.04721484, -1.491209, -3.459124, 0, 0, 0, 1, 1,
-0.04604039, 0.6765333, 0.9801547, 0, 0, 0, 1, 1,
-0.04351149, 1.066169, -0.05928738, 0, 0, 0, 1, 1,
-0.03718653, -2.818727, -4.194271, 0, 0, 0, 1, 1,
-0.03322644, 0.1142801, 0.7150983, 1, 1, 1, 1, 1,
-0.03296273, 0.6369655, 1.566492, 1, 1, 1, 1, 1,
-0.03107665, -0.2519698, -1.8288, 1, 1, 1, 1, 1,
-0.02954823, 0.4074583, -1.039594, 1, 1, 1, 1, 1,
-0.02847765, -0.353269, -4.220574, 1, 1, 1, 1, 1,
-0.02417208, 0.2455344, 0.08981802, 1, 1, 1, 1, 1,
-0.02191866, 0.3425587, -1.248014, 1, 1, 1, 1, 1,
-0.02094031, 0.6218757, 0.08713396, 1, 1, 1, 1, 1,
-0.02022014, 0.8315053, -1.069083, 1, 1, 1, 1, 1,
-0.01541251, -0.09413081, -2.996825, 1, 1, 1, 1, 1,
-0.01484088, -0.6707929, -4.309782, 1, 1, 1, 1, 1,
-0.01152732, -0.3059974, -4.768586, 1, 1, 1, 1, 1,
-0.005445379, -0.5241915, -3.875551, 1, 1, 1, 1, 1,
-0.005082924, -0.2343502, -2.300174, 1, 1, 1, 1, 1,
0.002726001, -0.5873237, 2.968474, 1, 1, 1, 1, 1,
0.002786453, 1.722739, -1.253738, 0, 0, 1, 1, 1,
0.004708692, -2.578748, 2.24047, 1, 0, 0, 1, 1,
0.004783384, -0.2567089, 4.520425, 1, 0, 0, 1, 1,
0.006090008, 1.889432, 1.13518, 1, 0, 0, 1, 1,
0.008679111, 0.5098324, -0.860065, 1, 0, 0, 1, 1,
0.009182385, 1.13038, -0.2512741, 1, 0, 0, 1, 1,
0.01980008, -1.468762, 3.580923, 0, 0, 0, 1, 1,
0.0218107, -1.072581, 1.904674, 0, 0, 0, 1, 1,
0.02696388, -0.1382674, 3.81213, 0, 0, 0, 1, 1,
0.02730314, 1.795361, -1.155598, 0, 0, 0, 1, 1,
0.02779168, -0.2056428, 4.674037, 0, 0, 0, 1, 1,
0.02971923, 0.7598893, -1.355203, 0, 0, 0, 1, 1,
0.03092518, -0.1592988, 1.568502, 0, 0, 0, 1, 1,
0.03719102, -0.6749567, 4.131956, 1, 1, 1, 1, 1,
0.04114818, -1.262263, 2.168304, 1, 1, 1, 1, 1,
0.04341562, -1.45576, 4.307254, 1, 1, 1, 1, 1,
0.04357223, -0.9382278, 4.294073, 1, 1, 1, 1, 1,
0.0449687, -0.7250856, 2.580737, 1, 1, 1, 1, 1,
0.04518974, 0.2943294, -0.3180674, 1, 1, 1, 1, 1,
0.04888441, 0.5211058, 0.5880318, 1, 1, 1, 1, 1,
0.05400691, 0.9977468, 1.010275, 1, 1, 1, 1, 1,
0.05432426, 0.4940338, -1.280019, 1, 1, 1, 1, 1,
0.05557819, -0.08311028, 3.820797, 1, 1, 1, 1, 1,
0.05995733, 1.264182, -0.08219922, 1, 1, 1, 1, 1,
0.06139153, 0.1448597, 0.6319196, 1, 1, 1, 1, 1,
0.06186569, 0.4039208, 0.2364775, 1, 1, 1, 1, 1,
0.06190085, 1.551539, 1.098361, 1, 1, 1, 1, 1,
0.06296471, 0.5767132, 0.5319706, 1, 1, 1, 1, 1,
0.06419165, -0.2666083, 1.783485, 0, 0, 1, 1, 1,
0.06576187, -0.5670081, 5.532249, 1, 0, 0, 1, 1,
0.06795803, 0.6132779, 0.9053497, 1, 0, 0, 1, 1,
0.07118613, -1.405285, 2.04354, 1, 0, 0, 1, 1,
0.07239448, -1.719745, 3.388796, 1, 0, 0, 1, 1,
0.07326977, -0.1753808, 3.938039, 1, 0, 0, 1, 1,
0.0737448, 0.4756909, 0.01729614, 0, 0, 0, 1, 1,
0.07426028, -1.076422, 1.3615, 0, 0, 0, 1, 1,
0.08268133, 1.525361, 0.2281787, 0, 0, 0, 1, 1,
0.08281192, 0.0619483, -0.3663812, 0, 0, 0, 1, 1,
0.08410953, -0.277416, 3.944665, 0, 0, 0, 1, 1,
0.08519861, 0.8703384, -0.4410546, 0, 0, 0, 1, 1,
0.08781169, -0.03773972, 2.569982, 0, 0, 0, 1, 1,
0.08811944, 1.397884, 0.4288788, 1, 1, 1, 1, 1,
0.09475658, 0.2354213, 0.2643966, 1, 1, 1, 1, 1,
0.0953261, 0.1379247, 1.457355, 1, 1, 1, 1, 1,
0.09760519, 0.389703, -1.311035, 1, 1, 1, 1, 1,
0.09959914, 1.133508, 1.601935, 1, 1, 1, 1, 1,
0.1026359, 0.7223864, 0.3464689, 1, 1, 1, 1, 1,
0.1057314, 0.3161969, 0.4405724, 1, 1, 1, 1, 1,
0.1063092, 1.498461, 2.716695, 1, 1, 1, 1, 1,
0.1091583, -1.345729, 1.382947, 1, 1, 1, 1, 1,
0.1124567, -0.2162029, 4.631628, 1, 1, 1, 1, 1,
0.1143916, -2.203047, 2.982398, 1, 1, 1, 1, 1,
0.1191333, -0.5096801, 4.254106, 1, 1, 1, 1, 1,
0.1214441, 0.09585257, 0.9903655, 1, 1, 1, 1, 1,
0.129981, -0.6066474, 3.638418, 1, 1, 1, 1, 1,
0.1304058, 1.200305, 0.2374315, 1, 1, 1, 1, 1,
0.130822, -0.2663265, 2.046417, 0, 0, 1, 1, 1,
0.1345795, 0.06822152, 1.029391, 1, 0, 0, 1, 1,
0.1372776, -0.9524564, 2.469108, 1, 0, 0, 1, 1,
0.1381972, 1.209719, -0.5959497, 1, 0, 0, 1, 1,
0.1413397, 0.3166793, 1.148477, 1, 0, 0, 1, 1,
0.1421767, 0.6477986, 1.463067, 1, 0, 0, 1, 1,
0.142712, 0.2081072, -0.7859566, 0, 0, 0, 1, 1,
0.1430801, -1.148522, 3.215105, 0, 0, 0, 1, 1,
0.1461743, -0.03530764, -0.4738931, 0, 0, 0, 1, 1,
0.1469273, -0.304022, 0.6900832, 0, 0, 0, 1, 1,
0.1480597, -1.879917, 2.29993, 0, 0, 0, 1, 1,
0.1503699, 0.05522073, 0.7252072, 0, 0, 0, 1, 1,
0.1517924, 0.9290848, 0.7942132, 0, 0, 0, 1, 1,
0.1602182, -1.366387, 2.836918, 1, 1, 1, 1, 1,
0.1602912, 1.015825, 0.807028, 1, 1, 1, 1, 1,
0.1609112, -0.9079378, 2.291798, 1, 1, 1, 1, 1,
0.1610998, -1.520572, 2.672473, 1, 1, 1, 1, 1,
0.1626026, -0.4216271, 2.891374, 1, 1, 1, 1, 1,
0.1631143, 0.3079639, -0.1124349, 1, 1, 1, 1, 1,
0.1640781, -1.155372, 2.574243, 1, 1, 1, 1, 1,
0.1677212, -1.201307, 1.750251, 1, 1, 1, 1, 1,
0.1678351, 2.047263, 1.016953, 1, 1, 1, 1, 1,
0.168102, 1.365728, 0.3951628, 1, 1, 1, 1, 1,
0.1693911, -0.4217784, 3.161535, 1, 1, 1, 1, 1,
0.1705179, -0.4303415, 3.139098, 1, 1, 1, 1, 1,
0.1717308, -1.487205, 2.581888, 1, 1, 1, 1, 1,
0.1739319, -1.630633, 4.420654, 1, 1, 1, 1, 1,
0.1763081, -0.3239265, 0.6614577, 1, 1, 1, 1, 1,
0.177214, 0.6521596, 0.8742232, 0, 0, 1, 1, 1,
0.1777522, 0.2034292, 0.3999068, 1, 0, 0, 1, 1,
0.1955028, 0.5893366, 1.778801, 1, 0, 0, 1, 1,
0.1966, -0.04255385, 0.6568533, 1, 0, 0, 1, 1,
0.1967676, -0.6463447, 2.571747, 1, 0, 0, 1, 1,
0.1972236, 0.4831173, 2.636747, 1, 0, 0, 1, 1,
0.1977427, 1.687822, 0.4119386, 0, 0, 0, 1, 1,
0.2055335, 1.166244, -0.8629819, 0, 0, 0, 1, 1,
0.2096425, -1.330171, 0.7239894, 0, 0, 0, 1, 1,
0.210815, -0.5570413, 3.019817, 0, 0, 0, 1, 1,
0.2115373, -0.5226134, 3.038457, 0, 0, 0, 1, 1,
0.2208351, -0.322859, 2.282901, 0, 0, 0, 1, 1,
0.2273347, 0.6806569, 2.16971, 0, 0, 0, 1, 1,
0.2283504, 1.167889, -0.1961849, 1, 1, 1, 1, 1,
0.228942, -1.466298, 3.826097, 1, 1, 1, 1, 1,
0.2320805, -1.210793, 2.945203, 1, 1, 1, 1, 1,
0.2330251, -0.5671227, 1.164456, 1, 1, 1, 1, 1,
0.2353081, -1.192237, 1.015566, 1, 1, 1, 1, 1,
0.2371076, 0.8832114, 0.5947129, 1, 1, 1, 1, 1,
0.2377606, 1.050777, -1.203698, 1, 1, 1, 1, 1,
0.2400621, -1.006104, 2.695411, 1, 1, 1, 1, 1,
0.241374, 0.2277774, -0.07106458, 1, 1, 1, 1, 1,
0.2425341, 0.5369673, 2.044839, 1, 1, 1, 1, 1,
0.2460256, -0.8458037, 3.701347, 1, 1, 1, 1, 1,
0.2467707, -2.439748, 1.876498, 1, 1, 1, 1, 1,
0.2487707, -1.93215, 3.084145, 1, 1, 1, 1, 1,
0.2500023, -0.6306701, 2.396174, 1, 1, 1, 1, 1,
0.2512555, 0.2886478, 1.137984, 1, 1, 1, 1, 1,
0.2631482, 2.067162, 2.674438, 0, 0, 1, 1, 1,
0.2641448, -0.9347516, 3.459795, 1, 0, 0, 1, 1,
0.2787441, -0.5708823, 2.831148, 1, 0, 0, 1, 1,
0.2795428, 0.6520671, -0.5016466, 1, 0, 0, 1, 1,
0.2800916, 1.023841, -0.5914844, 1, 0, 0, 1, 1,
0.2873306, 0.9502186, -0.7026834, 1, 0, 0, 1, 1,
0.2895733, -0.02686029, 0.4922366, 0, 0, 0, 1, 1,
0.2955169, 0.09751923, 0.1256257, 0, 0, 0, 1, 1,
0.2979396, -0.8133442, 2.276358, 0, 0, 0, 1, 1,
0.300352, -0.9859298, 2.539299, 0, 0, 0, 1, 1,
0.3077907, 0.5199994, 1.193346, 0, 0, 0, 1, 1,
0.312471, -1.178894, 4.842704, 0, 0, 0, 1, 1,
0.3139954, 1.073885, 0.7589256, 0, 0, 0, 1, 1,
0.323976, 0.8961757, 0.3305527, 1, 1, 1, 1, 1,
0.3295819, -0.1761277, 1.630219, 1, 1, 1, 1, 1,
0.3320882, 0.7541028, -0.8286844, 1, 1, 1, 1, 1,
0.3365845, -1.781931, 3.634681, 1, 1, 1, 1, 1,
0.3375741, -1.526829, 4.741003, 1, 1, 1, 1, 1,
0.3430199, 0.3970676, 0.1978261, 1, 1, 1, 1, 1,
0.3464687, 0.08732925, 4.371519, 1, 1, 1, 1, 1,
0.3503362, 0.1719599, 1.718175, 1, 1, 1, 1, 1,
0.3522739, 0.622811, -0.07586862, 1, 1, 1, 1, 1,
0.3534442, 2.235825, 1.166373, 1, 1, 1, 1, 1,
0.353606, 0.9661467, 2.006661, 1, 1, 1, 1, 1,
0.3550008, 1.273652, -0.382135, 1, 1, 1, 1, 1,
0.3574689, -0.9080744, 2.66765, 1, 1, 1, 1, 1,
0.3576022, -2.220849, 2.724993, 1, 1, 1, 1, 1,
0.3620862, 0.5085862, 0.5644391, 1, 1, 1, 1, 1,
0.3633492, 1.201655, 0.5417458, 0, 0, 1, 1, 1,
0.3641473, -2.026572, 4.907098, 1, 0, 0, 1, 1,
0.3670689, 1.064288, 0.3058532, 1, 0, 0, 1, 1,
0.3680221, -1.318519, 3.115271, 1, 0, 0, 1, 1,
0.3691604, 2.197112, 1.411981, 1, 0, 0, 1, 1,
0.3691726, -0.2109134, 2.72792, 1, 0, 0, 1, 1,
0.3727919, 2.460556, -1.095807, 0, 0, 0, 1, 1,
0.3778607, 1.460428, 0.507267, 0, 0, 0, 1, 1,
0.3784331, -0.1855684, 3.242103, 0, 0, 0, 1, 1,
0.381954, 1.234147, 1.503492, 0, 0, 0, 1, 1,
0.3850295, 0.1192716, 2.892402, 0, 0, 0, 1, 1,
0.3880709, 0.8672549, -0.7063048, 0, 0, 0, 1, 1,
0.3885515, -0.1684826, 1.036646, 0, 0, 0, 1, 1,
0.390992, 0.1900749, 0.8121475, 1, 1, 1, 1, 1,
0.3930256, -0.7294023, 2.984962, 1, 1, 1, 1, 1,
0.3944034, 0.7259288, -0.9254527, 1, 1, 1, 1, 1,
0.3975147, 1.245641, 0.3633433, 1, 1, 1, 1, 1,
0.3983746, -0.4602195, 2.337165, 1, 1, 1, 1, 1,
0.4009208, -0.6623427, 2.007574, 1, 1, 1, 1, 1,
0.4033111, -0.3191473, 2.900578, 1, 1, 1, 1, 1,
0.4043916, 1.080884, -1.563757, 1, 1, 1, 1, 1,
0.405781, 0.4722348, -0.3063049, 1, 1, 1, 1, 1,
0.4079818, -0.7210405, 1.929212, 1, 1, 1, 1, 1,
0.409591, -0.5894384, 2.075062, 1, 1, 1, 1, 1,
0.4136454, -0.543927, 0.8568147, 1, 1, 1, 1, 1,
0.416777, -1.171721, 3.409554, 1, 1, 1, 1, 1,
0.4176424, -0.003922968, 1.899721, 1, 1, 1, 1, 1,
0.4184019, -1.016579, 1.697349, 1, 1, 1, 1, 1,
0.4204254, -2.245762, 2.942269, 0, 0, 1, 1, 1,
0.42177, 1.338532, -0.1449358, 1, 0, 0, 1, 1,
0.4234194, -1.327676, 4.038653, 1, 0, 0, 1, 1,
0.4270078, 0.9941493, 0.5510796, 1, 0, 0, 1, 1,
0.4322974, 0.9498898, -0.1808187, 1, 0, 0, 1, 1,
0.4327607, 0.3468641, 0.787873, 1, 0, 0, 1, 1,
0.4343176, 0.7024363, -1.074353, 0, 0, 0, 1, 1,
0.43607, -0.2060908, 3.899757, 0, 0, 0, 1, 1,
0.4373645, 0.9138281, 1.5731, 0, 0, 0, 1, 1,
0.4422589, -2.776348, 3.185915, 0, 0, 0, 1, 1,
0.446041, -0.319141, 2.546915, 0, 0, 0, 1, 1,
0.4469147, 0.4756778, -0.47419, 0, 0, 0, 1, 1,
0.447235, -0.02086302, 1.466586, 0, 0, 0, 1, 1,
0.4472967, 0.8395624, -0.7308232, 1, 1, 1, 1, 1,
0.4477578, 0.7579451, -0.4339879, 1, 1, 1, 1, 1,
0.4486795, -2.166706, 1.462654, 1, 1, 1, 1, 1,
0.4530117, -0.3149114, 1.378101, 1, 1, 1, 1, 1,
0.4531751, -0.07815986, 0.7483558, 1, 1, 1, 1, 1,
0.4544826, 2.269046, -0.4634832, 1, 1, 1, 1, 1,
0.4548004, -0.2824501, 1.167142, 1, 1, 1, 1, 1,
0.4552027, 0.517374, 2.161387, 1, 1, 1, 1, 1,
0.4569599, 0.02483672, 1.495721, 1, 1, 1, 1, 1,
0.4584875, 0.2850878, 2.191, 1, 1, 1, 1, 1,
0.4589891, -2.269878, 3.731574, 1, 1, 1, 1, 1,
0.4595559, -1.039605, 3.145838, 1, 1, 1, 1, 1,
0.4606053, 2.241256, -0.7784286, 1, 1, 1, 1, 1,
0.4614365, 1.050726, 0.3157499, 1, 1, 1, 1, 1,
0.4633746, 0.2832018, 0.3394002, 1, 1, 1, 1, 1,
0.4650869, -1.049242, 3.799825, 0, 0, 1, 1, 1,
0.4657257, -1.328519, 2.414161, 1, 0, 0, 1, 1,
0.4683281, -0.05438161, 2.45704, 1, 0, 0, 1, 1,
0.4715953, -0.08492585, 3.859851, 1, 0, 0, 1, 1,
0.474791, -0.2690607, 0.4342346, 1, 0, 0, 1, 1,
0.4761384, 0.5969021, -1.635632, 1, 0, 0, 1, 1,
0.482348, -0.7644365, 4.021305, 0, 0, 0, 1, 1,
0.4832169, 0.850666, 1.819225, 0, 0, 0, 1, 1,
0.4860569, 0.1348658, 0.7714036, 0, 0, 0, 1, 1,
0.4863777, -0.7141017, 2.899787, 0, 0, 0, 1, 1,
0.4917029, -1.260411, 1.004179, 0, 0, 0, 1, 1,
0.4929773, -1.130875, 2.11428, 0, 0, 0, 1, 1,
0.4931464, 0.6202708, 1.067604, 0, 0, 0, 1, 1,
0.496402, -0.2377196, 4.477573, 1, 1, 1, 1, 1,
0.4987234, 0.4550246, -1.135909, 1, 1, 1, 1, 1,
0.5007438, -0.06153952, 1.669041, 1, 1, 1, 1, 1,
0.501828, 1.076431, -0.3776748, 1, 1, 1, 1, 1,
0.5031485, 1.180286, -0.4365312, 1, 1, 1, 1, 1,
0.5052778, -0.7821531, 2.775344, 1, 1, 1, 1, 1,
0.5052926, -0.6059406, 2.532118, 1, 1, 1, 1, 1,
0.5075198, -0.7757881, 2.925716, 1, 1, 1, 1, 1,
0.5127602, 0.7959616, 1.805302, 1, 1, 1, 1, 1,
0.5189378, 0.6256199, 0.451115, 1, 1, 1, 1, 1,
0.520257, -0.03826469, 1.283781, 1, 1, 1, 1, 1,
0.5229685, 1.983101, 0.05394782, 1, 1, 1, 1, 1,
0.5310909, 2.107966, 0.711323, 1, 1, 1, 1, 1,
0.5321749, -0.1725663, 0.5390779, 1, 1, 1, 1, 1,
0.5392059, -0.4639555, 1.932167, 1, 1, 1, 1, 1,
0.5445153, -0.7512573, 3.860499, 0, 0, 1, 1, 1,
0.5449154, -0.7647671, 1.617077, 1, 0, 0, 1, 1,
0.5449923, -0.9105901, 4.432336, 1, 0, 0, 1, 1,
0.558888, -0.8892934, 3.13437, 1, 0, 0, 1, 1,
0.5619086, -1.666538, 3.082855, 1, 0, 0, 1, 1,
0.5694395, 0.4754281, 0.3606678, 1, 0, 0, 1, 1,
0.5705808, -0.7480192, 1.558046, 0, 0, 0, 1, 1,
0.5715059, 1.549655, 1.866273, 0, 0, 0, 1, 1,
0.581599, -0.8300698, 2.24739, 0, 0, 0, 1, 1,
0.5836527, -0.04950065, 0.7423214, 0, 0, 0, 1, 1,
0.5837286, -0.4352249, 1.15367, 0, 0, 0, 1, 1,
0.5838977, 0.3615205, 1.071539, 0, 0, 0, 1, 1,
0.6075537, -0.9701198, 2.861618, 0, 0, 0, 1, 1,
0.6088189, 0.793601, 1.372966, 1, 1, 1, 1, 1,
0.6130149, 1.26294, -0.500675, 1, 1, 1, 1, 1,
0.6134054, -1.009514, 1.920568, 1, 1, 1, 1, 1,
0.6138663, -0.3381891, 1.779859, 1, 1, 1, 1, 1,
0.6166513, -0.1684368, 1.500179, 1, 1, 1, 1, 1,
0.6189967, -0.7993683, 1.898039, 1, 1, 1, 1, 1,
0.6245922, -0.709768, 3.244058, 1, 1, 1, 1, 1,
0.6245966, 1.89145, 0.421944, 1, 1, 1, 1, 1,
0.6258405, 0.8165821, -0.5863885, 1, 1, 1, 1, 1,
0.6299596, -0.7300504, 3.192547, 1, 1, 1, 1, 1,
0.6316105, -0.2028563, 0.311653, 1, 1, 1, 1, 1,
0.6430156, -1.382054, 2.805152, 1, 1, 1, 1, 1,
0.6446202, 0.4559819, 0.4372319, 1, 1, 1, 1, 1,
0.6492263, 0.8578085, 1.359744, 1, 1, 1, 1, 1,
0.653815, -0.6369981, 2.399497, 1, 1, 1, 1, 1,
0.654923, 0.6972879, 0.4175711, 0, 0, 1, 1, 1,
0.6573773, 0.3210914, -0.2928937, 1, 0, 0, 1, 1,
0.6588479, 0.2992444, 1.880967, 1, 0, 0, 1, 1,
0.6605008, -0.1227095, 1.650548, 1, 0, 0, 1, 1,
0.6623157, 0.4585062, 0.2043515, 1, 0, 0, 1, 1,
0.6665826, -0.2160214, 0.2620443, 1, 0, 0, 1, 1,
0.6735986, 0.7101513, 0.1671862, 0, 0, 0, 1, 1,
0.6798256, -0.5437191, 3.747523, 0, 0, 0, 1, 1,
0.680602, -1.070362, 3.253742, 0, 0, 0, 1, 1,
0.6848649, -0.2502651, 2.410522, 0, 0, 0, 1, 1,
0.687454, 0.1774873, 0.5022974, 0, 0, 0, 1, 1,
0.689161, -1.388665, 2.896304, 0, 0, 0, 1, 1,
0.6944286, 0.5306536, 1.028747, 0, 0, 0, 1, 1,
0.6973261, -0.03003184, 2.112095, 1, 1, 1, 1, 1,
0.6979592, 0.6713395, 0.5373121, 1, 1, 1, 1, 1,
0.7020186, -0.9886932, 3.838176, 1, 1, 1, 1, 1,
0.7051588, 0.434584, 1.720238, 1, 1, 1, 1, 1,
0.707801, -0.8247932, 1.388705, 1, 1, 1, 1, 1,
0.7137934, -0.1353449, 0.5979234, 1, 1, 1, 1, 1,
0.7143233, -0.2927415, 2.990066, 1, 1, 1, 1, 1,
0.7157819, 1.184561, -1.12567, 1, 1, 1, 1, 1,
0.7182134, 1.173133, 0.7143391, 1, 1, 1, 1, 1,
0.7184023, 1.691951, -0.1123653, 1, 1, 1, 1, 1,
0.7194284, 0.1202606, 2.060424, 1, 1, 1, 1, 1,
0.7317069, -0.8215421, 1.064131, 1, 1, 1, 1, 1,
0.7326501, 0.4884045, 0.2065538, 1, 1, 1, 1, 1,
0.7392054, -0.1626648, 3.207788, 1, 1, 1, 1, 1,
0.7437122, 0.7241568, 1.766274, 1, 1, 1, 1, 1,
0.7466924, 0.2668636, 2.52063, 0, 0, 1, 1, 1,
0.7487276, -0.5822328, 2.985079, 1, 0, 0, 1, 1,
0.7603427, 0.7584191, 1.0875, 1, 0, 0, 1, 1,
0.7865878, 0.4043144, 0.368548, 1, 0, 0, 1, 1,
0.7930683, 2.067507, 0.465799, 1, 0, 0, 1, 1,
0.7994414, -0.01479164, 0.1904227, 1, 0, 0, 1, 1,
0.8002079, 0.6086531, 1.403352, 0, 0, 0, 1, 1,
0.8019428, -0.6235482, 2.166021, 0, 0, 0, 1, 1,
0.8056936, -0.05706308, 2.306924, 0, 0, 0, 1, 1,
0.8272106, 1.063484, -0.7989488, 0, 0, 0, 1, 1,
0.8272318, -1.670248, 3.655444, 0, 0, 0, 1, 1,
0.8346885, -0.03024329, 1.2262, 0, 0, 0, 1, 1,
0.8374743, 1.088866, 1.920455, 0, 0, 0, 1, 1,
0.8455418, -0.5193911, 3.64101, 1, 1, 1, 1, 1,
0.8652031, -0.4523063, 1.673191, 1, 1, 1, 1, 1,
0.8658741, 0.2477032, 0.7517774, 1, 1, 1, 1, 1,
0.8661699, -0.8194898, 0.8418946, 1, 1, 1, 1, 1,
0.8774354, -0.5399994, 2.755734, 1, 1, 1, 1, 1,
0.8810808, 0.2642571, 1.318289, 1, 1, 1, 1, 1,
0.8844256, 0.5569807, 1.766643, 1, 1, 1, 1, 1,
0.8940387, -1.016051, 2.870546, 1, 1, 1, 1, 1,
0.8953765, -0.2128098, 0.7633712, 1, 1, 1, 1, 1,
0.8967656, -1.144882, 1.33733, 1, 1, 1, 1, 1,
0.8978923, -0.7923771, 3.175504, 1, 1, 1, 1, 1,
0.9038437, 1.548167, 0.7615124, 1, 1, 1, 1, 1,
0.9063857, -0.7779358, 3.601881, 1, 1, 1, 1, 1,
0.9070599, -0.330136, 2.905668, 1, 1, 1, 1, 1,
0.911891, -0.8605191, 2.20293, 1, 1, 1, 1, 1,
0.912743, -0.2159013, 1.717437, 0, 0, 1, 1, 1,
0.9303988, -0.005684057, 3.079239, 1, 0, 0, 1, 1,
0.9316239, 2.861997, 1.139582, 1, 0, 0, 1, 1,
0.9367523, 0.8471736, 0.6952202, 1, 0, 0, 1, 1,
0.9368367, 0.8062574, 0.1535413, 1, 0, 0, 1, 1,
0.9416254, -0.3388194, 3.481915, 1, 0, 0, 1, 1,
0.9446136, 2.184633, 0.9265761, 0, 0, 0, 1, 1,
0.9528065, -2.378873, 4.424153, 0, 0, 0, 1, 1,
0.9534636, 0.9399697, 1.757055, 0, 0, 0, 1, 1,
0.9547043, -0.2891053, 2.199487, 0, 0, 0, 1, 1,
0.9638194, 0.8729623, 1.128335, 0, 0, 0, 1, 1,
0.9692661, 1.366266, 2.285298, 0, 0, 0, 1, 1,
0.9753023, 0.5269542, 1.028576, 0, 0, 0, 1, 1,
0.9786379, 1.193285, 1.772183, 1, 1, 1, 1, 1,
0.9792208, -0.2024905, 2.050792, 1, 1, 1, 1, 1,
0.9833376, 0.7148443, 1.287419, 1, 1, 1, 1, 1,
0.9895504, 1.234692, -0.09169391, 1, 1, 1, 1, 1,
0.9910078, -0.9499999, 0.9302539, 1, 1, 1, 1, 1,
0.9921397, 0.26347, 1.120397, 1, 1, 1, 1, 1,
0.9930383, 0.5098675, -0.3375585, 1, 1, 1, 1, 1,
0.9939157, 0.4277468, -1.809883, 1, 1, 1, 1, 1,
0.997412, 0.1224065, 1.218478, 1, 1, 1, 1, 1,
0.9986854, -0.1652625, 0.8616243, 1, 1, 1, 1, 1,
0.9990481, -0.09395557, 3.435633, 1, 1, 1, 1, 1,
1.001056, 0.4817172, 1.412142, 1, 1, 1, 1, 1,
1.00849, 1.820059, 1.139302, 1, 1, 1, 1, 1,
1.009603, -1.419536, 3.353587, 1, 1, 1, 1, 1,
1.012187, -0.01215679, 3.11411, 1, 1, 1, 1, 1,
1.02263, 1.989951, 0.4947457, 0, 0, 1, 1, 1,
1.023423, 0.05314372, -1.034649, 1, 0, 0, 1, 1,
1.028945, 0.8101556, 1.927263, 1, 0, 0, 1, 1,
1.034113, 1.421132, -0.1656734, 1, 0, 0, 1, 1,
1.036852, 0.2614363, 2.523267, 1, 0, 0, 1, 1,
1.040311, 0.5824198, 0.05490635, 1, 0, 0, 1, 1,
1.045964, 1.825512, 0.2501913, 0, 0, 0, 1, 1,
1.046262, 0.2008571, 2.162345, 0, 0, 0, 1, 1,
1.050255, -0.9987451, 3.078986, 0, 0, 0, 1, 1,
1.050864, -0.07062574, 2.294195, 0, 0, 0, 1, 1,
1.053084, -0.8683835, 1.957375, 0, 0, 0, 1, 1,
1.053928, -0.002096684, 0.465304, 0, 0, 0, 1, 1,
1.056532, -0.6541973, 1.532599, 0, 0, 0, 1, 1,
1.058072, 0.07001854, -0.06983416, 1, 1, 1, 1, 1,
1.058565, -1.090648, 2.465177, 1, 1, 1, 1, 1,
1.061646, -0.4841806, 3.574322, 1, 1, 1, 1, 1,
1.068105, -0.7152872, 1.481984, 1, 1, 1, 1, 1,
1.074989, 0.06509123, 0.6830128, 1, 1, 1, 1, 1,
1.079516, -1.071128, 1.516165, 1, 1, 1, 1, 1,
1.089699, 0.1320519, 0.4519491, 1, 1, 1, 1, 1,
1.097578, 1.679467, -0.4986355, 1, 1, 1, 1, 1,
1.099891, -1.042329, 1.728077, 1, 1, 1, 1, 1,
1.10556, -0.03511655, 2.844727, 1, 1, 1, 1, 1,
1.106098, -0.8363287, 0.1704069, 1, 1, 1, 1, 1,
1.123583, 1.161186, 2.411888, 1, 1, 1, 1, 1,
1.125452, 0.9834991, 0.7054655, 1, 1, 1, 1, 1,
1.139013, -2.445335, 3.008203, 1, 1, 1, 1, 1,
1.142216, 0.3215067, 2.546583, 1, 1, 1, 1, 1,
1.147554, -1.047132, 1.69869, 0, 0, 1, 1, 1,
1.158058, -1.940555, 3.388453, 1, 0, 0, 1, 1,
1.178377, -2.30864, 3.86506, 1, 0, 0, 1, 1,
1.178448, -1.101771, 2.70671, 1, 0, 0, 1, 1,
1.200082, 0.9866555, 1.318211, 1, 0, 0, 1, 1,
1.203362, -0.5699083, -0.0139396, 1, 0, 0, 1, 1,
1.216398, 1.960748, 1.410404, 0, 0, 0, 1, 1,
1.224785, -1.214919, 2.622082, 0, 0, 0, 1, 1,
1.230678, -0.7711779, 2.087804, 0, 0, 0, 1, 1,
1.23423, 0.538289, 0.9824857, 0, 0, 0, 1, 1,
1.246746, -0.6330878, 2.296496, 0, 0, 0, 1, 1,
1.251814, 0.6939715, 1.670782, 0, 0, 0, 1, 1,
1.255262, -0.3283722, 0.419271, 0, 0, 0, 1, 1,
1.256715, 0.5054962, -0.06274068, 1, 1, 1, 1, 1,
1.258324, -2.198127, 4.14515, 1, 1, 1, 1, 1,
1.264714, 0.3830951, 3.207437, 1, 1, 1, 1, 1,
1.272395, -2.328356, 0.7825983, 1, 1, 1, 1, 1,
1.276148, -0.5994347, -0.08676221, 1, 1, 1, 1, 1,
1.288126, 0.7705383, 1.512206, 1, 1, 1, 1, 1,
1.294691, 0.6062018, -0.2924743, 1, 1, 1, 1, 1,
1.296959, -0.478413, 0.3519004, 1, 1, 1, 1, 1,
1.304134, 0.6782117, 2.017289, 1, 1, 1, 1, 1,
1.304423, 1.093062, 2.300002, 1, 1, 1, 1, 1,
1.30686, 0.3742807, 1.141896, 1, 1, 1, 1, 1,
1.31063, 0.9382406, 0.7864411, 1, 1, 1, 1, 1,
1.315188, -1.834391, 2.619254, 1, 1, 1, 1, 1,
1.323916, 0.5140684, 0.6054291, 1, 1, 1, 1, 1,
1.328924, -0.2863507, 2.730908, 1, 1, 1, 1, 1,
1.344292, -1.612484, 1.97817, 0, 0, 1, 1, 1,
1.352466, -0.6047405, 3.500099, 1, 0, 0, 1, 1,
1.354336, 1.090099, 0.9152131, 1, 0, 0, 1, 1,
1.364324, 0.07980254, 0.9705519, 1, 0, 0, 1, 1,
1.368204, 1.419304, 0.2229614, 1, 0, 0, 1, 1,
1.378552, -0.6568624, 4.252836, 1, 0, 0, 1, 1,
1.400126, -0.4491052, 2.932644, 0, 0, 0, 1, 1,
1.412532, 2.223362, 0.6300136, 0, 0, 0, 1, 1,
1.420203, 0.211429, 0.6570997, 0, 0, 0, 1, 1,
1.424264, -0.494862, 1.817283, 0, 0, 0, 1, 1,
1.431268, -1.640441, 2.554686, 0, 0, 0, 1, 1,
1.433662, 0.9116182, 0.5095382, 0, 0, 0, 1, 1,
1.461819, -0.8844327, 1.71979, 0, 0, 0, 1, 1,
1.461925, -0.6745573, 1.627917, 1, 1, 1, 1, 1,
1.464103, 0.2905454, 0.4689601, 1, 1, 1, 1, 1,
1.469333, -1.638624, 1.221792, 1, 1, 1, 1, 1,
1.470808, -1.345545, 2.413804, 1, 1, 1, 1, 1,
1.474211, 0.2336552, 2.310468, 1, 1, 1, 1, 1,
1.475877, 0.6591952, -0.1112407, 1, 1, 1, 1, 1,
1.486972, -0.4787145, 1.37368, 1, 1, 1, 1, 1,
1.491277, 1.0888, 1.565023, 1, 1, 1, 1, 1,
1.498981, 0.1169979, 0.4962372, 1, 1, 1, 1, 1,
1.503537, 0.008903366, 1.539294, 1, 1, 1, 1, 1,
1.518498, -0.3735897, 2.105627, 1, 1, 1, 1, 1,
1.520037, 0.4298686, 0.2602061, 1, 1, 1, 1, 1,
1.540707, 0.1955384, 2.185127, 1, 1, 1, 1, 1,
1.561329, -0.4900351, 3.184041, 1, 1, 1, 1, 1,
1.575081, -0.4515898, 1.68242, 1, 1, 1, 1, 1,
1.583193, 0.6668696, 0.1816047, 0, 0, 1, 1, 1,
1.608549, 0.6594426, 1.838014, 1, 0, 0, 1, 1,
1.609213, 1.689666, 0.1919071, 1, 0, 0, 1, 1,
1.613625, -1.991657, 2.109138, 1, 0, 0, 1, 1,
1.615888, 0.3312463, 2.807676, 1, 0, 0, 1, 1,
1.625659, -0.1861405, 1.022595, 1, 0, 0, 1, 1,
1.636838, -0.6160405, 2.1132, 0, 0, 0, 1, 1,
1.645972, 0.4132655, 1.054958, 0, 0, 0, 1, 1,
1.655145, 0.1500866, 1.233762, 0, 0, 0, 1, 1,
1.658025, 2.060551, 0.3640839, 0, 0, 0, 1, 1,
1.660072, -0.3951402, 1.56795, 0, 0, 0, 1, 1,
1.663083, 1.854994, -0.1743496, 0, 0, 0, 1, 1,
1.664079, 0.1170515, 1.180974, 0, 0, 0, 1, 1,
1.664502, -0.1609126, 1.293187, 1, 1, 1, 1, 1,
1.683974, 1.845352, 0.06406684, 1, 1, 1, 1, 1,
1.702473, 1.218584, 0.7451316, 1, 1, 1, 1, 1,
1.705229, 1.500542, 1.198695, 1, 1, 1, 1, 1,
1.721275, 1.376425, 0.02846496, 1, 1, 1, 1, 1,
1.724004, -0.4604273, 0.7030921, 1, 1, 1, 1, 1,
1.733305, -1.932822, 1.958668, 1, 1, 1, 1, 1,
1.740182, 0.7953679, 1.26768, 1, 1, 1, 1, 1,
1.742935, 0.777512, 1.008602, 1, 1, 1, 1, 1,
1.751067, 0.8271413, 0.08414391, 1, 1, 1, 1, 1,
1.759496, 0.0992212, 2.844381, 1, 1, 1, 1, 1,
1.759614, -1.301521, 1.495964, 1, 1, 1, 1, 1,
1.763606, -1.566745, 1.841972, 1, 1, 1, 1, 1,
1.765254, 0.3012286, 0.995259, 1, 1, 1, 1, 1,
1.77082, 0.4252724, 2.301675, 1, 1, 1, 1, 1,
1.773462, -2.222127, 3.5481, 0, 0, 1, 1, 1,
1.774573, 0.9041253, -0.3467042, 1, 0, 0, 1, 1,
1.781378, -1.000623, 2.057586, 1, 0, 0, 1, 1,
1.822323, 0.2650249, 1.556765, 1, 0, 0, 1, 1,
1.830176, -1.083757, 1.722866, 1, 0, 0, 1, 1,
1.832539, 0.633963, 1.896091, 1, 0, 0, 1, 1,
1.836078, -0.6039436, 2.888992, 0, 0, 0, 1, 1,
1.841482, 1.100858, 1.6339, 0, 0, 0, 1, 1,
1.860706, -0.9714351, 2.103828, 0, 0, 0, 1, 1,
1.867679, -0.06680044, 1.572844, 0, 0, 0, 1, 1,
1.870055, 0.2246983, 2.930961, 0, 0, 0, 1, 1,
1.874346, 0.8023605, -0.05854101, 0, 0, 0, 1, 1,
1.874435, 0.6349099, 3.233588, 0, 0, 0, 1, 1,
1.881908, -0.4532207, 2.645106, 1, 1, 1, 1, 1,
1.906489, -0.454937, 3.037188, 1, 1, 1, 1, 1,
1.925759, 0.7220447, 0.4554669, 1, 1, 1, 1, 1,
1.926141, -1.08972, 2.557276, 1, 1, 1, 1, 1,
1.933738, 0.8944076, -0.3426946, 1, 1, 1, 1, 1,
1.948107, -1.053833, 3.696701, 1, 1, 1, 1, 1,
1.953706, -0.06942008, 1.996677, 1, 1, 1, 1, 1,
1.975719, 0.9798438, 1.637422, 1, 1, 1, 1, 1,
1.985104, 1.558591, -0.3104824, 1, 1, 1, 1, 1,
1.986304, 0.1346613, 0.4860856, 1, 1, 1, 1, 1,
1.993325, 1.649649, 0.6206995, 1, 1, 1, 1, 1,
1.997828, 0.4656147, -0.004632071, 1, 1, 1, 1, 1,
2.007903, 0.4748467, 0.1876846, 1, 1, 1, 1, 1,
2.021388, 0.3991153, -0.09311547, 1, 1, 1, 1, 1,
2.023518, -0.07795822, 0.8066068, 1, 1, 1, 1, 1,
2.038201, -1.151298, 2.422979, 0, 0, 1, 1, 1,
2.04521, 0.8093798, 2.001021, 1, 0, 0, 1, 1,
2.066075, 0.8130786, 1.267234, 1, 0, 0, 1, 1,
2.069402, -0.3093428, 0.03575712, 1, 0, 0, 1, 1,
2.078542, -0.2776134, 2.879234, 1, 0, 0, 1, 1,
2.085144, 1.347284, 0.8366778, 1, 0, 0, 1, 1,
2.092044, -1.654163, 1.215422, 0, 0, 0, 1, 1,
2.109683, 0.3896893, 2.110483, 0, 0, 0, 1, 1,
2.110431, -0.5411288, 0.6731812, 0, 0, 0, 1, 1,
2.153707, 0.7537843, 0.5890305, 0, 0, 0, 1, 1,
2.226993, -1.943069, 0.8643758, 0, 0, 0, 1, 1,
2.237244, 0.9596255, 0.1270008, 0, 0, 0, 1, 1,
2.243994, -0.04171658, 3.552689, 0, 0, 0, 1, 1,
2.322515, -1.611261, 2.567567, 1, 1, 1, 1, 1,
2.382799, -1.369636, 1.482947, 1, 1, 1, 1, 1,
2.445577, -0.2123298, 2.27658, 1, 1, 1, 1, 1,
2.588873, 0.3248911, 1.522673, 1, 1, 1, 1, 1,
2.618071, 1.325086, 2.22984, 1, 1, 1, 1, 1,
2.638584, -0.9924033, 0.9667619, 1, 1, 1, 1, 1,
2.654964, -0.4415872, 2.020627, 1, 1, 1, 1, 1
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
var radius = 9.134637;
var distance = 32.08503;
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
mvMatrix.translate( 0.2630427, -0.07203913, -0.3297369 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.08503);
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
