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
-2.751021, 1.278044, -0.6872389, 1, 0, 0, 1,
-2.749326, -0.7120172, -1.710381, 1, 0.007843138, 0, 1,
-2.708584, 2.217938, -0.3087752, 1, 0.01176471, 0, 1,
-2.660172, 1.730771, -2.118073, 1, 0.01960784, 0, 1,
-2.635976, -0.24516, -2.415851, 1, 0.02352941, 0, 1,
-2.598107, -0.890381, -1.437366, 1, 0.03137255, 0, 1,
-2.565344, -0.171842, -1.037964, 1, 0.03529412, 0, 1,
-2.52475, -0.4966721, -3.054385, 1, 0.04313726, 0, 1,
-2.39248, 1.002283, -0.3137651, 1, 0.04705882, 0, 1,
-2.351611, 0.2270251, -0.7163092, 1, 0.05490196, 0, 1,
-2.338979, -0.9137776, -2.919078, 1, 0.05882353, 0, 1,
-2.125291, 0.4875498, -0.5227291, 1, 0.06666667, 0, 1,
-2.111767, 0.8723884, -2.624836, 1, 0.07058824, 0, 1,
-2.091796, 1.182065, -0.9686514, 1, 0.07843138, 0, 1,
-2.086478, 0.9209989, -0.119286, 1, 0.08235294, 0, 1,
-2.082643, -1.190363, -1.176659, 1, 0.09019608, 0, 1,
-2.077441, 1.099522, 0.5269347, 1, 0.09411765, 0, 1,
-2.072335, 0.8726674, -0.3796621, 1, 0.1019608, 0, 1,
-2.064259, -0.3861701, -1.713022, 1, 0.1098039, 0, 1,
-2.047104, -2.45552, -1.010588, 1, 0.1137255, 0, 1,
-2.00792, -0.4739335, -3.666244, 1, 0.1215686, 0, 1,
-1.952152, 1.439674, -2.286338, 1, 0.1254902, 0, 1,
-1.927732, -0.9130561, -1.099818, 1, 0.1333333, 0, 1,
-1.906287, 0.8649691, -1.028228, 1, 0.1372549, 0, 1,
-1.891483, 1.091444, -1.806448, 1, 0.145098, 0, 1,
-1.889168, 0.02244327, -0.2197708, 1, 0.1490196, 0, 1,
-1.86606, 0.1476209, -1.153821, 1, 0.1568628, 0, 1,
-1.837086, -0.2299977, -1.758138, 1, 0.1607843, 0, 1,
-1.816964, -0.2481588, -1.87091, 1, 0.1686275, 0, 1,
-1.807228, -1.631878, -1.304145, 1, 0.172549, 0, 1,
-1.785468, 0.04215541, 0.7031257, 1, 0.1803922, 0, 1,
-1.781436, -1.035251, -1.403925, 1, 0.1843137, 0, 1,
-1.774804, -0.7625048, -2.102437, 1, 0.1921569, 0, 1,
-1.774211, -0.2569652, -2.925684, 1, 0.1960784, 0, 1,
-1.771582, 0.08789978, -1.768872, 1, 0.2039216, 0, 1,
-1.768464, 0.3430379, -0.9696683, 1, 0.2117647, 0, 1,
-1.729396, -0.1715577, -1.098328, 1, 0.2156863, 0, 1,
-1.726312, 0.337372, -1.897992, 1, 0.2235294, 0, 1,
-1.725044, 0.635214, 0.2560203, 1, 0.227451, 0, 1,
-1.720785, -0.08209487, -0.4604517, 1, 0.2352941, 0, 1,
-1.71159, -0.05454925, -1.459633, 1, 0.2392157, 0, 1,
-1.698449, -1.46467, -1.189545, 1, 0.2470588, 0, 1,
-1.684053, 2.134399, -0.9799559, 1, 0.2509804, 0, 1,
-1.678941, 0.7478482, -1.16608, 1, 0.2588235, 0, 1,
-1.675887, 0.6670635, -0.3232548, 1, 0.2627451, 0, 1,
-1.675076, -0.4452188, -2.203718, 1, 0.2705882, 0, 1,
-1.666479, 1.762871, 0.5624216, 1, 0.2745098, 0, 1,
-1.658088, 2.072941, 0.08395904, 1, 0.282353, 0, 1,
-1.656424, 1.125157, -1.669381, 1, 0.2862745, 0, 1,
-1.633137, -0.3410723, -0.9595045, 1, 0.2941177, 0, 1,
-1.628062, -3.041621, -3.86921, 1, 0.3019608, 0, 1,
-1.583002, 0.2334812, -3.138989, 1, 0.3058824, 0, 1,
-1.582973, -0.4237996, -1.846233, 1, 0.3137255, 0, 1,
-1.560422, -0.8899975, -3.312996, 1, 0.3176471, 0, 1,
-1.550226, -0.8328729, -1.388141, 1, 0.3254902, 0, 1,
-1.547292, -0.08436684, -2.661, 1, 0.3294118, 0, 1,
-1.545413, -1.039656, -3.540969, 1, 0.3372549, 0, 1,
-1.542901, 1.273328, 0.8587697, 1, 0.3411765, 0, 1,
-1.538235, 0.2531796, -0.8092245, 1, 0.3490196, 0, 1,
-1.521861, 2.468026, 0.8479939, 1, 0.3529412, 0, 1,
-1.520805, 0.2156976, -1.947651, 1, 0.3607843, 0, 1,
-1.514911, 0.4894933, -2.387152, 1, 0.3647059, 0, 1,
-1.509069, 0.439613, -2.156417, 1, 0.372549, 0, 1,
-1.499509, 0.2629625, -1.937328, 1, 0.3764706, 0, 1,
-1.494716, 0.2329658, -0.4063885, 1, 0.3843137, 0, 1,
-1.493981, -0.8338974, -2.751376, 1, 0.3882353, 0, 1,
-1.466709, 0.3641275, -1.964259, 1, 0.3960784, 0, 1,
-1.453131, -0.9572409, -1.717368, 1, 0.4039216, 0, 1,
-1.449482, -2.011837, -3.071732, 1, 0.4078431, 0, 1,
-1.447773, -0.5900476, -1.477197, 1, 0.4156863, 0, 1,
-1.445987, -0.4022515, -3.158288, 1, 0.4196078, 0, 1,
-1.429914, -0.7444469, -1.630723, 1, 0.427451, 0, 1,
-1.395106, -1.599316, -2.047038, 1, 0.4313726, 0, 1,
-1.387238, 0.5106094, -1.485293, 1, 0.4392157, 0, 1,
-1.379653, -0.2226486, -0.276828, 1, 0.4431373, 0, 1,
-1.359433, 0.4286918, -1.698735, 1, 0.4509804, 0, 1,
-1.349262, 1.318228, -2.504153, 1, 0.454902, 0, 1,
-1.345225, 1.148136, -2.002008, 1, 0.4627451, 0, 1,
-1.342043, -0.2160782, -3.594623, 1, 0.4666667, 0, 1,
-1.34192, -0.9776188, -0.9107721, 1, 0.4745098, 0, 1,
-1.337997, 0.9901323, -0.4852027, 1, 0.4784314, 0, 1,
-1.335297, 1.400011, -0.9556881, 1, 0.4862745, 0, 1,
-1.33044, -0.1301097, -1.344055, 1, 0.4901961, 0, 1,
-1.328052, -1.021862, -4.139818, 1, 0.4980392, 0, 1,
-1.320274, 0.7300308, -1.16545, 1, 0.5058824, 0, 1,
-1.315885, 0.5854641, -0.8337077, 1, 0.509804, 0, 1,
-1.307834, -0.05808917, -2.337373, 1, 0.5176471, 0, 1,
-1.305805, 1.637536, -0.8752621, 1, 0.5215687, 0, 1,
-1.297407, -0.329291, -3.165518, 1, 0.5294118, 0, 1,
-1.287951, -2.161698, -3.191429, 1, 0.5333334, 0, 1,
-1.286462, 0.08489178, -2.029545, 1, 0.5411765, 0, 1,
-1.279238, 0.4352199, -2.976231, 1, 0.5450981, 0, 1,
-1.277278, -0.8423437, -1.643253, 1, 0.5529412, 0, 1,
-1.276322, 0.9844353, -0.7166675, 1, 0.5568628, 0, 1,
-1.273479, -1.363152, -2.620338, 1, 0.5647059, 0, 1,
-1.261225, -1.693581, -3.232807, 1, 0.5686275, 0, 1,
-1.25896, -0.5886726, -2.291763, 1, 0.5764706, 0, 1,
-1.255552, 0.4207929, -0.9479303, 1, 0.5803922, 0, 1,
-1.250889, 0.7993742, -0.7173288, 1, 0.5882353, 0, 1,
-1.240467, -2.278889, -2.994116, 1, 0.5921569, 0, 1,
-1.234992, 1.844998, -1.082154, 1, 0.6, 0, 1,
-1.231948, 0.5958114, -0.2424536, 1, 0.6078432, 0, 1,
-1.226208, 0.5450923, 0.2907881, 1, 0.6117647, 0, 1,
-1.21351, 1.747198, -0.1691521, 1, 0.6196079, 0, 1,
-1.213218, 0.3017397, -0.09868905, 1, 0.6235294, 0, 1,
-1.204075, -0.8644877, -1.623191, 1, 0.6313726, 0, 1,
-1.198194, -0.08908918, -2.43102, 1, 0.6352941, 0, 1,
-1.192407, 0.04861949, -1.550432, 1, 0.6431373, 0, 1,
-1.192175, -1.698172, -2.428297, 1, 0.6470588, 0, 1,
-1.184685, -0.70157, -1.762922, 1, 0.654902, 0, 1,
-1.181096, 0.9386377, -1.764316, 1, 0.6588235, 0, 1,
-1.180381, 0.4584238, -0.3882994, 1, 0.6666667, 0, 1,
-1.171916, -0.3670299, -1.433719, 1, 0.6705883, 0, 1,
-1.171804, 0.7110361, -0.7598251, 1, 0.6784314, 0, 1,
-1.16501, -0.4822878, -2.846485, 1, 0.682353, 0, 1,
-1.160526, -0.6564546, -2.20416, 1, 0.6901961, 0, 1,
-1.160306, -0.04142596, -1.327897, 1, 0.6941177, 0, 1,
-1.158194, 1.293164, -0.2865615, 1, 0.7019608, 0, 1,
-1.15194, 0.4506367, -2.089665, 1, 0.7098039, 0, 1,
-1.135009, 1.974682, -0.2900857, 1, 0.7137255, 0, 1,
-1.133726, -0.1478654, -2.766454, 1, 0.7215686, 0, 1,
-1.12927, -1.79802, -3.435753, 1, 0.7254902, 0, 1,
-1.113898, 1.089497, -1.930711, 1, 0.7333333, 0, 1,
-1.104829, 0.06647347, -1.054816, 1, 0.7372549, 0, 1,
-1.10103, -0.09631085, -2.322501, 1, 0.7450981, 0, 1,
-1.096159, -0.8668927, -2.03265, 1, 0.7490196, 0, 1,
-1.09511, 0.3846807, -2.583797, 1, 0.7568628, 0, 1,
-1.091778, -1.409712, -3.258125, 1, 0.7607843, 0, 1,
-1.086398, 0.8477678, -1.056774, 1, 0.7686275, 0, 1,
-1.07045, -1.648657, -4.099414, 1, 0.772549, 0, 1,
-1.065235, 0.1037278, -1.098607, 1, 0.7803922, 0, 1,
-1.063774, 1.032212, -0.02634958, 1, 0.7843137, 0, 1,
-1.052567, -0.5855119, -1.563667, 1, 0.7921569, 0, 1,
-1.049926, 0.6899854, -1.055738, 1, 0.7960784, 0, 1,
-1.046779, 1.528326, 0.7842637, 1, 0.8039216, 0, 1,
-1.034455, -0.435376, -1.746385, 1, 0.8117647, 0, 1,
-1.034264, -0.5444442, -1.983696, 1, 0.8156863, 0, 1,
-1.032287, 1.045946, -0.7716366, 1, 0.8235294, 0, 1,
-1.013027, 0.2748717, -1.210413, 1, 0.827451, 0, 1,
-1.00904, 0.3162495, -0.2881044, 1, 0.8352941, 0, 1,
-1.004814, 0.6787059, -1.706791, 1, 0.8392157, 0, 1,
-1.003279, -0.6290317, -2.287392, 1, 0.8470588, 0, 1,
-1.001181, -0.7079211, -0.5537109, 1, 0.8509804, 0, 1,
-1.00101, 0.3979698, -1.610067, 1, 0.8588235, 0, 1,
-0.9990824, -1.322921, -1.748991, 1, 0.8627451, 0, 1,
-0.997053, 0.1411175, -2.620132, 1, 0.8705882, 0, 1,
-0.9854698, -0.190635, 1.093073, 1, 0.8745098, 0, 1,
-0.9836946, 1.723232, 0.2168425, 1, 0.8823529, 0, 1,
-0.9793334, -1.056044, -1.675961, 1, 0.8862745, 0, 1,
-0.9732531, 0.1626442, -3.555311, 1, 0.8941177, 0, 1,
-0.9676776, 0.4546883, -0.4902157, 1, 0.8980392, 0, 1,
-0.9642922, -0.4004196, -0.7999816, 1, 0.9058824, 0, 1,
-0.9531054, -1.289351, -2.831932, 1, 0.9137255, 0, 1,
-0.9434993, -0.06065953, -0.1367761, 1, 0.9176471, 0, 1,
-0.9415865, -0.630922, -0.8738102, 1, 0.9254902, 0, 1,
-0.9396557, 1.414173, -0.9708642, 1, 0.9294118, 0, 1,
-0.9227667, -0.5284266, -2.561788, 1, 0.9372549, 0, 1,
-0.917683, -1.605525, -3.454027, 1, 0.9411765, 0, 1,
-0.9159727, -0.191202, -0.4718462, 1, 0.9490196, 0, 1,
-0.913523, 1.623342, 0.06959935, 1, 0.9529412, 0, 1,
-0.908791, -0.1621198, -0.9104633, 1, 0.9607843, 0, 1,
-0.90631, -0.09842419, -1.830821, 1, 0.9647059, 0, 1,
-0.9030944, -1.080994, -4.12925, 1, 0.972549, 0, 1,
-0.9027399, -0.9933999, -1.25326, 1, 0.9764706, 0, 1,
-0.9019774, 0.3666048, -1.379502, 1, 0.9843137, 0, 1,
-0.9007983, 0.2600846, -0.685276, 1, 0.9882353, 0, 1,
-0.8993335, -1.966782, -3.021154, 1, 0.9960784, 0, 1,
-0.8992639, 0.2520879, -1.986664, 0.9960784, 1, 0, 1,
-0.8958769, -1.366961, -1.580603, 0.9921569, 1, 0, 1,
-0.8932981, -0.9119894, -1.381372, 0.9843137, 1, 0, 1,
-0.8891134, 0.9896795, -0.5234621, 0.9803922, 1, 0, 1,
-0.8883961, 0.5579624, -0.720651, 0.972549, 1, 0, 1,
-0.8861129, 0.8595842, 0.9366745, 0.9686275, 1, 0, 1,
-0.8845021, -0.005502674, 0.3651713, 0.9607843, 1, 0, 1,
-0.8794265, -1.803999, -2.472679, 0.9568627, 1, 0, 1,
-0.8793719, -1.202324, -0.8929785, 0.9490196, 1, 0, 1,
-0.8765219, -0.2313321, -0.4841191, 0.945098, 1, 0, 1,
-0.8753774, -1.049066, -2.356605, 0.9372549, 1, 0, 1,
-0.8729374, 0.9114374, -2.110472, 0.9333333, 1, 0, 1,
-0.8597828, 1.223063, -0.450274, 0.9254902, 1, 0, 1,
-0.8509122, 1.111695, -0.2377051, 0.9215686, 1, 0, 1,
-0.8496582, 0.03373551, -0.8738384, 0.9137255, 1, 0, 1,
-0.8398838, -0.3447991, -1.99782, 0.9098039, 1, 0, 1,
-0.8391981, -0.8241656, -3.328118, 0.9019608, 1, 0, 1,
-0.8373777, 0.09262463, -0.5710364, 0.8941177, 1, 0, 1,
-0.834784, -1.693361, -2.892658, 0.8901961, 1, 0, 1,
-0.8326744, -0.06817104, -0.2343339, 0.8823529, 1, 0, 1,
-0.8321013, -0.5755557, -2.802195, 0.8784314, 1, 0, 1,
-0.8276745, -0.7916285, -3.090402, 0.8705882, 1, 0, 1,
-0.8122964, -1.896736, -2.225427, 0.8666667, 1, 0, 1,
-0.8083994, 1.055795, -0.8235778, 0.8588235, 1, 0, 1,
-0.8053824, 1.423081, -0.8076283, 0.854902, 1, 0, 1,
-0.7976955, -2.736963, -3.406221, 0.8470588, 1, 0, 1,
-0.7944592, -0.2248016, -0.9067556, 0.8431373, 1, 0, 1,
-0.7882299, 0.09144887, -0.2014775, 0.8352941, 1, 0, 1,
-0.7821024, 1.386898, -0.764857, 0.8313726, 1, 0, 1,
-0.7807838, 0.6381762, 0.006529434, 0.8235294, 1, 0, 1,
-0.7793663, 2.907926, -0.3989611, 0.8196079, 1, 0, 1,
-0.774729, 0.784287, -1.085665, 0.8117647, 1, 0, 1,
-0.7744799, -0.0768499, -1.634577, 0.8078431, 1, 0, 1,
-0.7720633, 1.880106, -0.5063062, 0.8, 1, 0, 1,
-0.7615855, 0.572066, -1.120381, 0.7921569, 1, 0, 1,
-0.7593659, -0.6316916, -0.8595073, 0.7882353, 1, 0, 1,
-0.7584462, -0.9830989, -2.468667, 0.7803922, 1, 0, 1,
-0.7576875, -0.06940709, -2.618918, 0.7764706, 1, 0, 1,
-0.7541309, -0.201679, -1.350099, 0.7686275, 1, 0, 1,
-0.748166, -0.2267922, -2.147361, 0.7647059, 1, 0, 1,
-0.745352, 1.706827, 0.07302704, 0.7568628, 1, 0, 1,
-0.7453102, 0.5615383, -0.1577743, 0.7529412, 1, 0, 1,
-0.7424664, -0.6261572, -0.6349235, 0.7450981, 1, 0, 1,
-0.7404135, 0.208428, 0.1923096, 0.7411765, 1, 0, 1,
-0.7375577, -0.463365, -3.147533, 0.7333333, 1, 0, 1,
-0.723551, 0.2430816, -1.340618, 0.7294118, 1, 0, 1,
-0.7212675, 0.1463224, -1.451174, 0.7215686, 1, 0, 1,
-0.718133, -1.207603, -3.204654, 0.7176471, 1, 0, 1,
-0.7181128, -0.7844697, -0.9744039, 0.7098039, 1, 0, 1,
-0.7159061, -1.180004, -2.649724, 0.7058824, 1, 0, 1,
-0.709512, 1.473821, -1.545402, 0.6980392, 1, 0, 1,
-0.7042904, 0.6144258, -1.146209, 0.6901961, 1, 0, 1,
-0.7014119, 2.019594, 1.046011, 0.6862745, 1, 0, 1,
-0.7007923, 2.33298, -0.1192758, 0.6784314, 1, 0, 1,
-0.6955124, -0.6840053, -3.811555, 0.6745098, 1, 0, 1,
-0.6938756, -1.758335, -3.3945, 0.6666667, 1, 0, 1,
-0.6837914, 0.2046166, -3.081792, 0.6627451, 1, 0, 1,
-0.6831628, 1.247782, 0.6367918, 0.654902, 1, 0, 1,
-0.6824421, -0.1903736, -0.6945953, 0.6509804, 1, 0, 1,
-0.6821984, 0.5395008, -0.7935035, 0.6431373, 1, 0, 1,
-0.6806684, -0.3673575, -1.268935, 0.6392157, 1, 0, 1,
-0.6799047, 1.18867, -1.313307, 0.6313726, 1, 0, 1,
-0.6763619, 0.5060111, -1.824972, 0.627451, 1, 0, 1,
-0.6742702, 0.2092795, -0.5940619, 0.6196079, 1, 0, 1,
-0.6720539, 1.189957, -1.181418, 0.6156863, 1, 0, 1,
-0.6686972, 0.3039246, -0.2915021, 0.6078432, 1, 0, 1,
-0.6666711, -2.842263, -4.09328, 0.6039216, 1, 0, 1,
-0.6643319, 0.7932553, 0.3601216, 0.5960785, 1, 0, 1,
-0.6627864, -1.825738, -4.658241, 0.5882353, 1, 0, 1,
-0.6527001, -0.3210756, -1.430624, 0.5843138, 1, 0, 1,
-0.6441513, 0.2239548, -2.972266, 0.5764706, 1, 0, 1,
-0.6424713, -0.706706, -1.967372, 0.572549, 1, 0, 1,
-0.6412022, -0.1712847, -2.259227, 0.5647059, 1, 0, 1,
-0.6382172, 1.179013, -0.6032615, 0.5607843, 1, 0, 1,
-0.636168, 1.569626, 0.642345, 0.5529412, 1, 0, 1,
-0.6316327, 0.2767856, -1.596542, 0.5490196, 1, 0, 1,
-0.6263666, 0.7033108, -3.012837, 0.5411765, 1, 0, 1,
-0.625246, 0.23976, -0.9405987, 0.5372549, 1, 0, 1,
-0.6183572, 1.173646, -0.3456844, 0.5294118, 1, 0, 1,
-0.6127874, -0.01244792, -1.114694, 0.5254902, 1, 0, 1,
-0.6118906, -0.0691293, -2.453797, 0.5176471, 1, 0, 1,
-0.6094662, 0.6249271, -0.4807383, 0.5137255, 1, 0, 1,
-0.608197, 0.7196853, -0.5766672, 0.5058824, 1, 0, 1,
-0.6077253, 1.397638, -1.006245, 0.5019608, 1, 0, 1,
-0.6056111, 0.7334821, -0.7896209, 0.4941176, 1, 0, 1,
-0.6020376, 0.05272059, -2.221985, 0.4862745, 1, 0, 1,
-0.5945915, -0.8085005, -3.078821, 0.4823529, 1, 0, 1,
-0.5945398, -0.6143168, -2.619924, 0.4745098, 1, 0, 1,
-0.5944707, -1.635627, -2.420898, 0.4705882, 1, 0, 1,
-0.5934076, -1.500872, -2.966265, 0.4627451, 1, 0, 1,
-0.5904754, 0.2099542, -1.166887, 0.4588235, 1, 0, 1,
-0.5884479, -0.4578203, -2.991537, 0.4509804, 1, 0, 1,
-0.5849161, -0.03102448, -0.2198137, 0.4470588, 1, 0, 1,
-0.5808548, 2.403802, -0.6448858, 0.4392157, 1, 0, 1,
-0.5803073, -0.9630759, -1.788984, 0.4352941, 1, 0, 1,
-0.577425, 0.4732115, -0.7586805, 0.427451, 1, 0, 1,
-0.5765103, 1.309262, -0.786477, 0.4235294, 1, 0, 1,
-0.5757154, 0.8978472, -2.278557, 0.4156863, 1, 0, 1,
-0.5706432, 0.003920442, -1.792359, 0.4117647, 1, 0, 1,
-0.5620571, -1.480376, -0.7518373, 0.4039216, 1, 0, 1,
-0.5550552, 0.7207893, 0.9224594, 0.3960784, 1, 0, 1,
-0.5548868, -1.29639, -2.364716, 0.3921569, 1, 0, 1,
-0.5543615, 0.202187, -0.5412387, 0.3843137, 1, 0, 1,
-0.5506923, -0.7131912, -3.262962, 0.3803922, 1, 0, 1,
-0.5442979, 0.6985895, 0.4845236, 0.372549, 1, 0, 1,
-0.5440431, 0.09078637, -0.1964952, 0.3686275, 1, 0, 1,
-0.5432236, -0.1477213, -1.524438, 0.3607843, 1, 0, 1,
-0.5352463, 0.8097786, -0.007456286, 0.3568628, 1, 0, 1,
-0.5335139, 0.6321194, -1.295388, 0.3490196, 1, 0, 1,
-0.530888, 0.26741, -0.197618, 0.345098, 1, 0, 1,
-0.5295573, -0.983069, -3.012199, 0.3372549, 1, 0, 1,
-0.5252306, -0.3616442, -1.043801, 0.3333333, 1, 0, 1,
-0.5223773, 0.5883371, -3.037286, 0.3254902, 1, 0, 1,
-0.5115013, -0.5160189, -3.397424, 0.3215686, 1, 0, 1,
-0.5056217, 0.1875681, -1.24636, 0.3137255, 1, 0, 1,
-0.5029848, -0.0212156, -2.345052, 0.3098039, 1, 0, 1,
-0.5022841, 0.1106839, -2.046018, 0.3019608, 1, 0, 1,
-0.5014317, 0.07973131, -1.211656, 0.2941177, 1, 0, 1,
-0.5010803, 1.316108, -0.1167048, 0.2901961, 1, 0, 1,
-0.4995517, 0.02597055, -1.846033, 0.282353, 1, 0, 1,
-0.4968466, 0.4340095, -0.1912527, 0.2784314, 1, 0, 1,
-0.4949726, -0.7322293, -1.53447, 0.2705882, 1, 0, 1,
-0.4941671, 0.213376, -0.09520802, 0.2666667, 1, 0, 1,
-0.4923966, 0.5319788, 0.04017056, 0.2588235, 1, 0, 1,
-0.4902099, -1.304908, -2.955549, 0.254902, 1, 0, 1,
-0.4898347, -0.9090161, -2.373716, 0.2470588, 1, 0, 1,
-0.4894476, -0.5330778, -0.4655991, 0.2431373, 1, 0, 1,
-0.4887775, -1.25209, -4.682283, 0.2352941, 1, 0, 1,
-0.4833474, 1.185694, 0.5311272, 0.2313726, 1, 0, 1,
-0.4821899, 0.3946705, -0.5449911, 0.2235294, 1, 0, 1,
-0.4815117, 0.5035644, -0.09447002, 0.2196078, 1, 0, 1,
-0.4755349, -0.9090218, -2.247774, 0.2117647, 1, 0, 1,
-0.4735501, -1.388801, -3.315205, 0.2078431, 1, 0, 1,
-0.4731421, 0.8261444, -0.485297, 0.2, 1, 0, 1,
-0.4647585, -0.8435739, -1.66968, 0.1921569, 1, 0, 1,
-0.4634564, 0.2866029, -1.395164, 0.1882353, 1, 0, 1,
-0.4608669, 0.4711066, -1.567141, 0.1803922, 1, 0, 1,
-0.4558007, -0.4513484, -2.529689, 0.1764706, 1, 0, 1,
-0.455419, 0.2385631, -3.013084, 0.1686275, 1, 0, 1,
-0.4502553, 0.5621499, -1.183364, 0.1647059, 1, 0, 1,
-0.4351372, -1.581901, -3.663591, 0.1568628, 1, 0, 1,
-0.4317215, 1.534141, 0.7296199, 0.1529412, 1, 0, 1,
-0.4312669, 0.4084148, 1.120814, 0.145098, 1, 0, 1,
-0.4266644, -0.4568103, -2.598579, 0.1411765, 1, 0, 1,
-0.4259828, 1.733356, 0.4789922, 0.1333333, 1, 0, 1,
-0.4217611, -0.02365022, -2.235634, 0.1294118, 1, 0, 1,
-0.4179512, 1.836965, -0.6575162, 0.1215686, 1, 0, 1,
-0.4143626, 0.1706894, -0.7859867, 0.1176471, 1, 0, 1,
-0.4132805, 0.236885, -0.8015812, 0.1098039, 1, 0, 1,
-0.4096602, 1.206164, -0.0896476, 0.1058824, 1, 0, 1,
-0.4090595, -1.511178, -4.170063, 0.09803922, 1, 0, 1,
-0.4018757, 0.5823345, -0.07906669, 0.09019608, 1, 0, 1,
-0.4000651, 1.539069, 0.9360145, 0.08627451, 1, 0, 1,
-0.3982939, 2.026139, -0.5159363, 0.07843138, 1, 0, 1,
-0.3976253, -0.269507, -2.53987, 0.07450981, 1, 0, 1,
-0.3943742, -0.3603335, -0.6182922, 0.06666667, 1, 0, 1,
-0.392879, -1.903486, -0.6274408, 0.0627451, 1, 0, 1,
-0.3927474, 0.1450757, -0.3921711, 0.05490196, 1, 0, 1,
-0.3923967, -2.098806, -2.486132, 0.05098039, 1, 0, 1,
-0.3878277, -1.551902, -2.066324, 0.04313726, 1, 0, 1,
-0.3868156, -0.717338, -3.205702, 0.03921569, 1, 0, 1,
-0.386515, 0.7519114, -1.0773, 0.03137255, 1, 0, 1,
-0.3838773, 0.1660445, -1.602947, 0.02745098, 1, 0, 1,
-0.3814183, 1.065981, -1.00358, 0.01960784, 1, 0, 1,
-0.379939, 0.330658, -2.487704, 0.01568628, 1, 0, 1,
-0.3796906, -0.3568693, -2.960412, 0.007843138, 1, 0, 1,
-0.3766887, 1.604393, 1.721901, 0.003921569, 1, 0, 1,
-0.3756023, 1.576037, -1.101722, 0, 1, 0.003921569, 1,
-0.3733209, 1.39259, 0.1172551, 0, 1, 0.01176471, 1,
-0.3715523, -0.4862402, -3.820393, 0, 1, 0.01568628, 1,
-0.3706675, 1.654929, -0.7228064, 0, 1, 0.02352941, 1,
-0.3706557, 1.032622, 1.354689, 0, 1, 0.02745098, 1,
-0.3656269, -1.08901, -4.295729, 0, 1, 0.03529412, 1,
-0.3540045, 1.010726, -0.6958408, 0, 1, 0.03921569, 1,
-0.3439346, -0.09989636, -1.83343, 0, 1, 0.04705882, 1,
-0.3414792, 1.219374, -1.02046, 0, 1, 0.05098039, 1,
-0.3385172, -0.6066427, -1.933362, 0, 1, 0.05882353, 1,
-0.3350766, -1.794251, -3.069284, 0, 1, 0.0627451, 1,
-0.3350641, 0.976222, 0.4591862, 0, 1, 0.07058824, 1,
-0.3295802, 1.321211, -0.02462376, 0, 1, 0.07450981, 1,
-0.3295766, 0.02707284, -1.995098, 0, 1, 0.08235294, 1,
-0.3295413, 0.2104914, -2.794739, 0, 1, 0.08627451, 1,
-0.3252783, 0.5397117, -0.9674366, 0, 1, 0.09411765, 1,
-0.3244396, -0.2176446, -2.346576, 0, 1, 0.1019608, 1,
-0.324383, 1.600474, -1.103418, 0, 1, 0.1058824, 1,
-0.3182101, -0.6409969, -0.8588987, 0, 1, 0.1137255, 1,
-0.3172818, 0.1589584, -0.6565822, 0, 1, 0.1176471, 1,
-0.3155755, -1.092263, -3.145236, 0, 1, 0.1254902, 1,
-0.3142901, 1.645211, -1.914885, 0, 1, 0.1294118, 1,
-0.3137729, -0.1701868, -0.9194646, 0, 1, 0.1372549, 1,
-0.3136089, 1.450441, -0.8467593, 0, 1, 0.1411765, 1,
-0.3119845, 1.508794, -0.4695037, 0, 1, 0.1490196, 1,
-0.3114131, 1.771931, 0.8912154, 0, 1, 0.1529412, 1,
-0.3000529, -0.733728, -2.993262, 0, 1, 0.1607843, 1,
-0.2989599, 1.837395, -0.2486682, 0, 1, 0.1647059, 1,
-0.2971754, -0.1740882, -2.127752, 0, 1, 0.172549, 1,
-0.2968495, 0.4017325, 0.7001419, 0, 1, 0.1764706, 1,
-0.2964034, -0.2753073, -3.063559, 0, 1, 0.1843137, 1,
-0.2961715, -1.738788, -3.249325, 0, 1, 0.1882353, 1,
-0.2959294, 0.8228706, -0.9535428, 0, 1, 0.1960784, 1,
-0.2940927, -0.3647248, -2.24949, 0, 1, 0.2039216, 1,
-0.2929361, -0.7282088, -3.327046, 0, 1, 0.2078431, 1,
-0.2923323, 0.2028268, -2.714213, 0, 1, 0.2156863, 1,
-0.2914786, -0.2147943, -3.119642, 0, 1, 0.2196078, 1,
-0.2912009, -0.1725289, -3.98546, 0, 1, 0.227451, 1,
-0.2792335, 0.003885285, -0.5375304, 0, 1, 0.2313726, 1,
-0.2780876, -0.4478551, -2.384705, 0, 1, 0.2392157, 1,
-0.2711866, -0.09522273, -1.081306, 0, 1, 0.2431373, 1,
-0.2705375, 0.4249245, -2.437023, 0, 1, 0.2509804, 1,
-0.2693036, -0.7067658, -2.827857, 0, 1, 0.254902, 1,
-0.2668254, 0.01451169, -1.53099, 0, 1, 0.2627451, 1,
-0.266072, -1.626417, -4.647077, 0, 1, 0.2666667, 1,
-0.2636046, 0.4276003, -1.299335, 0, 1, 0.2745098, 1,
-0.2627697, -0.9193348, -3.509715, 0, 1, 0.2784314, 1,
-0.2619749, 1.387419, -2.549263, 0, 1, 0.2862745, 1,
-0.2603887, 0.3008105, -1.087678, 0, 1, 0.2901961, 1,
-0.2593327, 1.842151, -0.3988691, 0, 1, 0.2980392, 1,
-0.2562699, 0.3106328, -0.8547531, 0, 1, 0.3058824, 1,
-0.2521943, 0.4872687, -0.3601597, 0, 1, 0.3098039, 1,
-0.2468386, 0.1776289, 0.376265, 0, 1, 0.3176471, 1,
-0.2445993, 0.7033104, -0.02669424, 0, 1, 0.3215686, 1,
-0.2424755, -0.8915127, -3.276827, 0, 1, 0.3294118, 1,
-0.2397721, 0.8779809, -1.13451, 0, 1, 0.3333333, 1,
-0.2341174, -0.07989794, -0.7984532, 0, 1, 0.3411765, 1,
-0.2337951, 0.1733363, -1.177018, 0, 1, 0.345098, 1,
-0.2335936, -0.803407, -1.80609, 0, 1, 0.3529412, 1,
-0.233347, -0.4442182, -1.697865, 0, 1, 0.3568628, 1,
-0.2325302, -0.2801672, -0.202177, 0, 1, 0.3647059, 1,
-0.2318106, 0.9830326, -0.1427494, 0, 1, 0.3686275, 1,
-0.2315521, 0.9586973, 0.5600114, 0, 1, 0.3764706, 1,
-0.2288388, 0.4429903, 0.5312653, 0, 1, 0.3803922, 1,
-0.2239088, 1.146718, 0.5812238, 0, 1, 0.3882353, 1,
-0.2222297, -0.4848705, -2.816652, 0, 1, 0.3921569, 1,
-0.2207973, -0.3928487, -1.404014, 0, 1, 0.4, 1,
-0.2156392, 0.1127066, 0.5036564, 0, 1, 0.4078431, 1,
-0.2145808, 0.5982628, 0.5210338, 0, 1, 0.4117647, 1,
-0.2137535, 0.2328955, -0.4518839, 0, 1, 0.4196078, 1,
-0.2102867, 1.347352, 1.245941, 0, 1, 0.4235294, 1,
-0.2075981, 0.06702437, -0.2726338, 0, 1, 0.4313726, 1,
-0.2062339, -1.24697, -4.491406, 0, 1, 0.4352941, 1,
-0.2052529, 0.7988022, 0.1832061, 0, 1, 0.4431373, 1,
-0.203874, -0.3677659, -3.710673, 0, 1, 0.4470588, 1,
-0.2035092, -1.362162, -3.868661, 0, 1, 0.454902, 1,
-0.1988008, -1.360141, -1.857947, 0, 1, 0.4588235, 1,
-0.1969593, 1.08504, -0.1131638, 0, 1, 0.4666667, 1,
-0.1966565, -1.670742, -2.92904, 0, 1, 0.4705882, 1,
-0.1961126, 0.7599086, 0.3105911, 0, 1, 0.4784314, 1,
-0.195446, -0.9320991, -3.455066, 0, 1, 0.4823529, 1,
-0.1951773, -0.1280036, -2.768057, 0, 1, 0.4901961, 1,
-0.1922413, -0.5331546, -3.029169, 0, 1, 0.4941176, 1,
-0.1906583, -0.2936029, -2.601329, 0, 1, 0.5019608, 1,
-0.1883215, -0.4438196, -3.037965, 0, 1, 0.509804, 1,
-0.1849837, -0.4390189, -2.394156, 0, 1, 0.5137255, 1,
-0.1817651, -1.494079, -3.945961, 0, 1, 0.5215687, 1,
-0.1776246, 0.6068054, -0.5000268, 0, 1, 0.5254902, 1,
-0.1771296, 0.169214, -0.5785716, 0, 1, 0.5333334, 1,
-0.1762486, 0.6131824, -0.828601, 0, 1, 0.5372549, 1,
-0.1740785, -0.8726417, -1.415466, 0, 1, 0.5450981, 1,
-0.1739333, -0.4151734, -3.895134, 0, 1, 0.5490196, 1,
-0.1693888, 0.4439082, -1.673159, 0, 1, 0.5568628, 1,
-0.169045, 0.03465497, -2.695573, 0, 1, 0.5607843, 1,
-0.1642647, -0.87998, -2.749528, 0, 1, 0.5686275, 1,
-0.1635176, 0.8993787, 0.03352001, 0, 1, 0.572549, 1,
-0.1447151, -2.165582, -2.654343, 0, 1, 0.5803922, 1,
-0.1441376, 0.5246888, 0.5346628, 0, 1, 0.5843138, 1,
-0.1421571, 0.6892726, -1.244374, 0, 1, 0.5921569, 1,
-0.137201, -0.6382252, -2.169557, 0, 1, 0.5960785, 1,
-0.132885, -0.1787203, -4.191394, 0, 1, 0.6039216, 1,
-0.1258044, -0.8111695, -4.099062, 0, 1, 0.6117647, 1,
-0.1233742, 0.2217062, -1.331394, 0, 1, 0.6156863, 1,
-0.1232896, -1.159638, -1.717668, 0, 1, 0.6235294, 1,
-0.1197762, 0.6431884, 0.07674211, 0, 1, 0.627451, 1,
-0.1180005, -1.004423, -2.842406, 0, 1, 0.6352941, 1,
-0.1135289, 1.929198, -0.5506081, 0, 1, 0.6392157, 1,
-0.1135263, 1.808602, 0.5451426, 0, 1, 0.6470588, 1,
-0.1108556, -0.7526719, -3.675263, 0, 1, 0.6509804, 1,
-0.1068414, -0.8643313, -4.308236, 0, 1, 0.6588235, 1,
-0.1044031, 0.3885849, -0.05690532, 0, 1, 0.6627451, 1,
-0.1042812, -1.523484, -2.124305, 0, 1, 0.6705883, 1,
-0.102742, -0.7160329, -2.721527, 0, 1, 0.6745098, 1,
-0.09913211, -1.142814, -4.209612, 0, 1, 0.682353, 1,
-0.09861269, 1.214335, 0.3575428, 0, 1, 0.6862745, 1,
-0.09564852, -0.3628243, -2.640724, 0, 1, 0.6941177, 1,
-0.09041346, 0.7294801, -1.062932, 0, 1, 0.7019608, 1,
-0.08284739, 0.310789, -0.4312476, 0, 1, 0.7058824, 1,
-0.0816176, 0.1363879, -0.6768699, 0, 1, 0.7137255, 1,
-0.07833643, -0.2357132, -3.784241, 0, 1, 0.7176471, 1,
-0.07689743, 1.174366, -1.221058, 0, 1, 0.7254902, 1,
-0.07361192, -0.6338196, -1.680432, 0, 1, 0.7294118, 1,
-0.0684177, -0.2280874, -3.209236, 0, 1, 0.7372549, 1,
-0.06276107, 0.1167073, -0.4753322, 0, 1, 0.7411765, 1,
-0.06257118, -0.04571344, -1.750398, 0, 1, 0.7490196, 1,
-0.05955696, 0.3329752, 0.1491002, 0, 1, 0.7529412, 1,
-0.05475218, 0.1584921, -1.938191, 0, 1, 0.7607843, 1,
-0.05388379, 0.9973495, -0.2286882, 0, 1, 0.7647059, 1,
-0.05359679, -0.6288351, -1.941004, 0, 1, 0.772549, 1,
-0.04452614, 0.1169666, 1.453271, 0, 1, 0.7764706, 1,
-0.04452395, -0.2957788, -3.127247, 0, 1, 0.7843137, 1,
-0.0410311, -0.416152, -4.795966, 0, 1, 0.7882353, 1,
-0.04052154, 0.1019002, -0.3456494, 0, 1, 0.7960784, 1,
-0.03763508, -0.9981113, -4.165304, 0, 1, 0.8039216, 1,
-0.03224055, -0.8847139, -3.341298, 0, 1, 0.8078431, 1,
-0.02756815, 0.08931327, -0.76941, 0, 1, 0.8156863, 1,
-0.02521423, -0.203, -1.758058, 0, 1, 0.8196079, 1,
-0.02129812, 2.336419, -0.1676895, 0, 1, 0.827451, 1,
-0.01631095, -0.7959254, -3.511606, 0, 1, 0.8313726, 1,
-0.0161132, -1.152672, -2.955854, 0, 1, 0.8392157, 1,
-0.01458733, 0.453398, -0.777015, 0, 1, 0.8431373, 1,
-0.01123263, -0.7285714, -3.104043, 0, 1, 0.8509804, 1,
-0.008924226, -0.08292166, -4.21383, 0, 1, 0.854902, 1,
-0.007251061, -0.8748009, -1.858769, 0, 1, 0.8627451, 1,
-0.003700116, 0.2912819, -0.8406091, 0, 1, 0.8666667, 1,
-0.002540668, -0.1439209, -3.328853, 0, 1, 0.8745098, 1,
0.0009990477, 0.1975374, 1.238858, 0, 1, 0.8784314, 1,
0.002236936, -1.868041, 1.725211, 0, 1, 0.8862745, 1,
0.005043281, 1.077684, 1.285219, 0, 1, 0.8901961, 1,
0.005397627, 0.08962188, 0.729201, 0, 1, 0.8980392, 1,
0.006838996, 1.135742, 0.6715786, 0, 1, 0.9058824, 1,
0.01074098, -1.042011, 4.034602, 0, 1, 0.9098039, 1,
0.01585427, -0.2396157, 4.662557, 0, 1, 0.9176471, 1,
0.01615792, -0.007431642, 1.29636, 0, 1, 0.9215686, 1,
0.01800864, 1.07886, 0.2366637, 0, 1, 0.9294118, 1,
0.01990106, 0.3422544, 0.7571445, 0, 1, 0.9333333, 1,
0.02088345, -1.446365, 2.775924, 0, 1, 0.9411765, 1,
0.02410803, -2.821503, 5.08105, 0, 1, 0.945098, 1,
0.02686845, -0.1028731, 2.270406, 0, 1, 0.9529412, 1,
0.02693648, -0.806676, 3.316916, 0, 1, 0.9568627, 1,
0.02732231, 0.4023268, -0.6963054, 0, 1, 0.9647059, 1,
0.02737896, 0.937964, -0.2656649, 0, 1, 0.9686275, 1,
0.03275605, 0.3440067, -0.8569342, 0, 1, 0.9764706, 1,
0.03592097, -1.073413, 2.501276, 0, 1, 0.9803922, 1,
0.03616618, -0.3033427, 3.321261, 0, 1, 0.9882353, 1,
0.03736696, 0.7545875, 0.9579244, 0, 1, 0.9921569, 1,
0.04132783, 0.491154, -0.1000812, 0, 1, 1, 1,
0.04151284, -0.1266719, 3.176784, 0, 0.9921569, 1, 1,
0.04167556, -0.3656441, 3.177273, 0, 0.9882353, 1, 1,
0.04421915, -1.837561, 1.951365, 0, 0.9803922, 1, 1,
0.04958192, -0.6442477, 5.612135, 0, 0.9764706, 1, 1,
0.05308639, -1.16486, 4.844375, 0, 0.9686275, 1, 1,
0.06385621, 0.678409, 0.09003618, 0, 0.9647059, 1, 1,
0.06670625, 1.275899, -1.978949, 0, 0.9568627, 1, 1,
0.07041338, -1.528176, 1.501459, 0, 0.9529412, 1, 1,
0.07144587, 0.3938156, 0.08019641, 0, 0.945098, 1, 1,
0.07781862, 0.7521228, 1.303205, 0, 0.9411765, 1, 1,
0.08083874, -2.036457, 4.451304, 0, 0.9333333, 1, 1,
0.08181489, 0.4249726, -0.9877441, 0, 0.9294118, 1, 1,
0.08518093, 0.1917964, -0.8263125, 0, 0.9215686, 1, 1,
0.08707793, -0.7641149, 4.798724, 0, 0.9176471, 1, 1,
0.08815048, 0.5597597, -0.9702054, 0, 0.9098039, 1, 1,
0.08823585, 0.03458133, 1.291905, 0, 0.9058824, 1, 1,
0.08999143, 1.430714, -0.5315216, 0, 0.8980392, 1, 1,
0.0932403, -1.807401, 0.8147706, 0, 0.8901961, 1, 1,
0.09533437, 0.7801171, -0.2652777, 0, 0.8862745, 1, 1,
0.0971451, 0.4922199, 0.3042683, 0, 0.8784314, 1, 1,
0.09815407, -0.6346872, 2.553075, 0, 0.8745098, 1, 1,
0.1025925, 0.01596586, 3.010348, 0, 0.8666667, 1, 1,
0.1096013, 0.8560594, -0.648484, 0, 0.8627451, 1, 1,
0.1103091, -0.887333, 3.474616, 0, 0.854902, 1, 1,
0.1124767, 0.5506483, 1.16936, 0, 0.8509804, 1, 1,
0.1126263, -1.903404, 2.790919, 0, 0.8431373, 1, 1,
0.1135334, -0.6071125, 2.149894, 0, 0.8392157, 1, 1,
0.1137994, -0.5661175, 5.406449, 0, 0.8313726, 1, 1,
0.1161596, 0.9515615, 0.7091561, 0, 0.827451, 1, 1,
0.1186261, -1.354255, 2.032513, 0, 0.8196079, 1, 1,
0.1236183, 1.708525, -0.2251803, 0, 0.8156863, 1, 1,
0.1257273, -0.4277329, 2.38394, 0, 0.8078431, 1, 1,
0.1295469, -0.9241241, 4.6812, 0, 0.8039216, 1, 1,
0.1309353, -0.4451314, 2.65747, 0, 0.7960784, 1, 1,
0.1312307, -0.8331159, 3.177224, 0, 0.7882353, 1, 1,
0.1314376, 1.653537, -0.1728145, 0, 0.7843137, 1, 1,
0.1383361, 0.1180085, 1.146798, 0, 0.7764706, 1, 1,
0.1415969, -0.6982099, 4.08639, 0, 0.772549, 1, 1,
0.147831, 0.5021964, 0.02043686, 0, 0.7647059, 1, 1,
0.1497791, 0.3693289, 1.023173, 0, 0.7607843, 1, 1,
0.1506898, 0.9558437, -0.6214859, 0, 0.7529412, 1, 1,
0.1518567, -0.817669, 2.284979, 0, 0.7490196, 1, 1,
0.1565457, -0.8575062, 2.064291, 0, 0.7411765, 1, 1,
0.1600984, -0.1046826, 3.554304, 0, 0.7372549, 1, 1,
0.1605028, 0.141048, 0.9528083, 0, 0.7294118, 1, 1,
0.1615484, 0.3824158, -1.126899, 0, 0.7254902, 1, 1,
0.1652215, 1.219663, 1.415072, 0, 0.7176471, 1, 1,
0.1665259, -0.1700429, 2.453153, 0, 0.7137255, 1, 1,
0.1718596, -1.535671, 2.97, 0, 0.7058824, 1, 1,
0.1735589, -0.4428047, 1.787142, 0, 0.6980392, 1, 1,
0.1735948, -0.05359045, 0.6957581, 0, 0.6941177, 1, 1,
0.1797664, -0.3269687, 3.169827, 0, 0.6862745, 1, 1,
0.1800274, -1.156498, 3.012346, 0, 0.682353, 1, 1,
0.1815286, -0.651665, 2.850013, 0, 0.6745098, 1, 1,
0.1827735, 0.1713591, 0.9041302, 0, 0.6705883, 1, 1,
0.1835994, -0.6528007, 2.840156, 0, 0.6627451, 1, 1,
0.1885485, 1.179022, 0.7918789, 0, 0.6588235, 1, 1,
0.1901224, -0.4164897, 1.856951, 0, 0.6509804, 1, 1,
0.1941372, 1.534929, 0.8805405, 0, 0.6470588, 1, 1,
0.1966738, -1.045333, 4.010299, 0, 0.6392157, 1, 1,
0.1990987, -0.8053454, 4.05485, 0, 0.6352941, 1, 1,
0.2066321, -0.1602238, 0.9206803, 0, 0.627451, 1, 1,
0.2066533, 0.03268041, 1.832806, 0, 0.6235294, 1, 1,
0.2077794, -0.923788, 4.057952, 0, 0.6156863, 1, 1,
0.2095283, 0.8720174, -0.2059886, 0, 0.6117647, 1, 1,
0.2103344, -2.314232, 4.012272, 0, 0.6039216, 1, 1,
0.210893, -0.8214278, 2.248315, 0, 0.5960785, 1, 1,
0.2112647, 1.911646, -1.151294, 0, 0.5921569, 1, 1,
0.2114348, 0.1161139, 1.625796, 0, 0.5843138, 1, 1,
0.2117356, 0.810865, 0.8247616, 0, 0.5803922, 1, 1,
0.2133225, -0.3231321, 2.721795, 0, 0.572549, 1, 1,
0.2137664, 1.269796, -0.9610221, 0, 0.5686275, 1, 1,
0.2156477, 0.08936939, 0.4196001, 0, 0.5607843, 1, 1,
0.215797, 0.4064925, 0.6586098, 0, 0.5568628, 1, 1,
0.2165671, 1.757617, 0.1442729, 0, 0.5490196, 1, 1,
0.2169845, -0.8599875, 3.614676, 0, 0.5450981, 1, 1,
0.2226788, 1.298094, 0.6436899, 0, 0.5372549, 1, 1,
0.2249185, 0.1735259, 1.463891, 0, 0.5333334, 1, 1,
0.2317513, 0.9229503, 0.813463, 0, 0.5254902, 1, 1,
0.2321216, -1.364152, 3.259191, 0, 0.5215687, 1, 1,
0.2332041, -0.9390589, 2.585853, 0, 0.5137255, 1, 1,
0.2338513, 0.2085593, -0.4567979, 0, 0.509804, 1, 1,
0.2355021, -0.2938594, 2.291637, 0, 0.5019608, 1, 1,
0.2401111, 0.08714572, 2.614896, 0, 0.4941176, 1, 1,
0.2405718, -0.5016118, 2.292753, 0, 0.4901961, 1, 1,
0.2434436, -0.1912253, 3.154659, 0, 0.4823529, 1, 1,
0.2462396, -2.01465, 5.623344, 0, 0.4784314, 1, 1,
0.2542521, -0.06124146, 0.6624367, 0, 0.4705882, 1, 1,
0.2565486, -0.8561943, 1.898585, 0, 0.4666667, 1, 1,
0.2579515, -0.5400219, 2.262142, 0, 0.4588235, 1, 1,
0.2669092, 0.3077657, 0.8060808, 0, 0.454902, 1, 1,
0.2671571, -0.6273442, 3.013588, 0, 0.4470588, 1, 1,
0.267919, -1.067969, 3.138236, 0, 0.4431373, 1, 1,
0.2686417, 0.9782512, 1.664858, 0, 0.4352941, 1, 1,
0.2687837, -0.4412854, 3.608618, 0, 0.4313726, 1, 1,
0.2728552, -2.807711, 3.312205, 0, 0.4235294, 1, 1,
0.2739382, -1.065402, 2.907111, 0, 0.4196078, 1, 1,
0.2755835, -0.4557841, 2.883034, 0, 0.4117647, 1, 1,
0.2804998, 1.607287, -0.3981829, 0, 0.4078431, 1, 1,
0.2809262, 0.2667215, 1.35621, 0, 0.4, 1, 1,
0.2841502, -0.02452924, 1.952704, 0, 0.3921569, 1, 1,
0.2861989, -0.4561839, 4.489713, 0, 0.3882353, 1, 1,
0.2909057, 0.01494769, 0.5615835, 0, 0.3803922, 1, 1,
0.3015917, 1.421229, 0.6299008, 0, 0.3764706, 1, 1,
0.303309, -0.1049298, 3.507815, 0, 0.3686275, 1, 1,
0.3088374, -0.7321075, 3.285258, 0, 0.3647059, 1, 1,
0.3145602, -0.1368382, 3.045707, 0, 0.3568628, 1, 1,
0.3154344, 1.176485, -0.4829811, 0, 0.3529412, 1, 1,
0.3159993, -0.4407586, 3.541543, 0, 0.345098, 1, 1,
0.3165113, 0.4274179, 1.593907, 0, 0.3411765, 1, 1,
0.317055, 0.5943801, 0.7249612, 0, 0.3333333, 1, 1,
0.3180307, 0.8507568, 1.056894, 0, 0.3294118, 1, 1,
0.3269489, 1.256268, -1.181006, 0, 0.3215686, 1, 1,
0.3286808, 1.708652, 2.192165, 0, 0.3176471, 1, 1,
0.3323577, -0.005991044, 0.7900993, 0, 0.3098039, 1, 1,
0.3346797, 0.6494467, 1.915624, 0, 0.3058824, 1, 1,
0.341729, -0.6834027, 4.027706, 0, 0.2980392, 1, 1,
0.3432508, -0.9437411, 0.8623564, 0, 0.2901961, 1, 1,
0.3467287, 0.5166003, 1.075264, 0, 0.2862745, 1, 1,
0.348445, -0.06065462, 2.556802, 0, 0.2784314, 1, 1,
0.3501883, -0.1546647, 1.66453, 0, 0.2745098, 1, 1,
0.3514482, -1.228201, 4.312667, 0, 0.2666667, 1, 1,
0.3514843, -1.18567, 2.496664, 0, 0.2627451, 1, 1,
0.3522517, 2.080485, -0.4029482, 0, 0.254902, 1, 1,
0.3544156, -1.332114, 2.034032, 0, 0.2509804, 1, 1,
0.3578596, -0.6682023, 3.203639, 0, 0.2431373, 1, 1,
0.3593843, 1.341554, -0.04277539, 0, 0.2392157, 1, 1,
0.360561, -0.2132193, 1.84481, 0, 0.2313726, 1, 1,
0.3682838, 0.759995, 0.1492115, 0, 0.227451, 1, 1,
0.370581, -0.8134851, 3.180973, 0, 0.2196078, 1, 1,
0.3717133, 0.4194488, 1.736883, 0, 0.2156863, 1, 1,
0.3744501, -0.2909907, 1.389044, 0, 0.2078431, 1, 1,
0.3823889, 0.5500047, -0.4277785, 0, 0.2039216, 1, 1,
0.3828645, 1.774716, -0.7417831, 0, 0.1960784, 1, 1,
0.3844094, 0.3246976, 0.3960346, 0, 0.1882353, 1, 1,
0.3845249, -0.6223627, 1.750131, 0, 0.1843137, 1, 1,
0.3863818, 0.1306022, 2.211472, 0, 0.1764706, 1, 1,
0.3880101, 0.9520795, 1.343414, 0, 0.172549, 1, 1,
0.388808, -0.3844773, 2.599662, 0, 0.1647059, 1, 1,
0.3933261, 0.965964, 0.0008178277, 0, 0.1607843, 1, 1,
0.3950686, 1.334641, -1.11056, 0, 0.1529412, 1, 1,
0.4008019, 0.3844649, 3.233901, 0, 0.1490196, 1, 1,
0.4010823, -0.08584809, 1.481313, 0, 0.1411765, 1, 1,
0.4058456, -0.5848473, 3.23007, 0, 0.1372549, 1, 1,
0.4062361, -1.265132, 2.230055, 0, 0.1294118, 1, 1,
0.4073008, -0.5688193, 1.270673, 0, 0.1254902, 1, 1,
0.4108143, 1.06194, 0.0536944, 0, 0.1176471, 1, 1,
0.411973, -0.01504007, -0.3275554, 0, 0.1137255, 1, 1,
0.415802, 0.274223, 1.371449, 0, 0.1058824, 1, 1,
0.4202962, 0.1075422, 0.8647372, 0, 0.09803922, 1, 1,
0.4203685, 0.01089614, 1.35155, 0, 0.09411765, 1, 1,
0.4204563, -0.8986628, 1.95491, 0, 0.08627451, 1, 1,
0.4238902, -1.715046, 1.763561, 0, 0.08235294, 1, 1,
0.4244119, 1.062827, 0.2497782, 0, 0.07450981, 1, 1,
0.4251171, -1.672301, 1.661267, 0, 0.07058824, 1, 1,
0.4256402, -1.199191, 4.761899, 0, 0.0627451, 1, 1,
0.4265034, -0.9449698, 2.596839, 0, 0.05882353, 1, 1,
0.4289617, -0.08784177, -0.1137199, 0, 0.05098039, 1, 1,
0.4311587, -2.011991, 4.251581, 0, 0.04705882, 1, 1,
0.4413886, 0.2012251, 2.168646, 0, 0.03921569, 1, 1,
0.4420793, -0.4025373, 2.502984, 0, 0.03529412, 1, 1,
0.4432417, -0.055935, 1.067476, 0, 0.02745098, 1, 1,
0.4463026, 0.5636979, 0.4971582, 0, 0.02352941, 1, 1,
0.4471566, -0.2016998, 3.716771, 0, 0.01568628, 1, 1,
0.4478113, -0.8795862, 2.240335, 0, 0.01176471, 1, 1,
0.4488103, -0.5098009, 1.514548, 0, 0.003921569, 1, 1,
0.4499091, -0.6097139, 1.601463, 0.003921569, 0, 1, 1,
0.4504685, 0.02793387, 0.5746643, 0.007843138, 0, 1, 1,
0.4509791, 3.041336, -1.227922, 0.01568628, 0, 1, 1,
0.4528995, 0.4155181, 1.738089, 0.01960784, 0, 1, 1,
0.4539308, 1.595933, -0.4525136, 0.02745098, 0, 1, 1,
0.4569758, -2.999564, 0.6445308, 0.03137255, 0, 1, 1,
0.4581258, -0.00725559, 2.187362, 0.03921569, 0, 1, 1,
0.4630645, 1.920852, 0.6028916, 0.04313726, 0, 1, 1,
0.464303, 1.003106, 0.5025836, 0.05098039, 0, 1, 1,
0.4663689, -0.7485874, 3.480783, 0.05490196, 0, 1, 1,
0.4734739, -1.389423, 2.571299, 0.0627451, 0, 1, 1,
0.4743153, 0.688372, 0.08256675, 0.06666667, 0, 1, 1,
0.4749899, 1.011382, 2.341017, 0.07450981, 0, 1, 1,
0.4765595, 0.1037303, 3.589586, 0.07843138, 0, 1, 1,
0.479987, -0.1232605, 1.942534, 0.08627451, 0, 1, 1,
0.4812797, -0.3488533, 3.621302, 0.09019608, 0, 1, 1,
0.4814377, 0.5586982, -0.3531829, 0.09803922, 0, 1, 1,
0.4829224, 0.3785259, 0.6033048, 0.1058824, 0, 1, 1,
0.4832048, -1.635064, 1.556603, 0.1098039, 0, 1, 1,
0.484257, 1.063661, -0.5974277, 0.1176471, 0, 1, 1,
0.4863666, -0.2676307, 1.833313, 0.1215686, 0, 1, 1,
0.4867974, 0.4611093, 0.4664812, 0.1294118, 0, 1, 1,
0.4943754, 0.3963445, -0.6586514, 0.1333333, 0, 1, 1,
0.4944238, 1.219931, 0.6630752, 0.1411765, 0, 1, 1,
0.4948374, 1.361135, 0.6735443, 0.145098, 0, 1, 1,
0.5032039, 0.2017074, 1.667603, 0.1529412, 0, 1, 1,
0.5081605, -0.1170946, 4.177889, 0.1568628, 0, 1, 1,
0.509095, 0.3726865, 1.552255, 0.1647059, 0, 1, 1,
0.5149018, -0.8438691, 2.563288, 0.1686275, 0, 1, 1,
0.518232, 1.753731, 0.3752618, 0.1764706, 0, 1, 1,
0.5182952, 1.03858, 1.232329, 0.1803922, 0, 1, 1,
0.5207157, -0.4803061, 1.959171, 0.1882353, 0, 1, 1,
0.525106, -1.69886, 2.172213, 0.1921569, 0, 1, 1,
0.5275066, -0.5231999, 3.303189, 0.2, 0, 1, 1,
0.5322487, -0.2711445, 3.415246, 0.2078431, 0, 1, 1,
0.5322505, -2.115733, 2.274309, 0.2117647, 0, 1, 1,
0.5327532, -1.03823, 1.453768, 0.2196078, 0, 1, 1,
0.5357565, -1.486415, 2.341299, 0.2235294, 0, 1, 1,
0.5484471, -0.8663711, 4.333655, 0.2313726, 0, 1, 1,
0.5486706, 0.6739709, 1.902875, 0.2352941, 0, 1, 1,
0.5510713, 0.8509228, -0.0452616, 0.2431373, 0, 1, 1,
0.5520046, 0.1120778, 0.04562388, 0.2470588, 0, 1, 1,
0.5548851, 0.1747108, 3.177265, 0.254902, 0, 1, 1,
0.5550335, 0.1641213, 1.858745, 0.2588235, 0, 1, 1,
0.5573655, -0.3696524, 2.626585, 0.2666667, 0, 1, 1,
0.5579494, 0.5984762, 0.8353738, 0.2705882, 0, 1, 1,
0.5629611, 0.2202075, 1.983057, 0.2784314, 0, 1, 1,
0.56634, 1.771411, 0.6002565, 0.282353, 0, 1, 1,
0.5678293, 0.3099019, 0.4043567, 0.2901961, 0, 1, 1,
0.5691411, 1.452022, 1.758931, 0.2941177, 0, 1, 1,
0.5717899, 1.990527, 0.1713194, 0.3019608, 0, 1, 1,
0.5757415, -0.3222272, 0.2436345, 0.3098039, 0, 1, 1,
0.5864646, -1.268143, 3.078016, 0.3137255, 0, 1, 1,
0.5898076, 0.4100298, 1.186957, 0.3215686, 0, 1, 1,
0.5903735, 2.633904, 1.18405, 0.3254902, 0, 1, 1,
0.5906791, 0.3144048, 1.508497, 0.3333333, 0, 1, 1,
0.5918043, -0.8634015, 1.9674, 0.3372549, 0, 1, 1,
0.5940681, -0.9436558, 0.9145923, 0.345098, 0, 1, 1,
0.5977279, 0.6269003, 1.939434, 0.3490196, 0, 1, 1,
0.5990238, 0.07164454, 2.572977, 0.3568628, 0, 1, 1,
0.6021721, -0.5390306, 2.741523, 0.3607843, 0, 1, 1,
0.6038806, -1.236024, 4.852211, 0.3686275, 0, 1, 1,
0.6041554, -0.7582609, 2.961971, 0.372549, 0, 1, 1,
0.6055182, -0.3243314, 2.719697, 0.3803922, 0, 1, 1,
0.6057562, -1.294775, 2.202283, 0.3843137, 0, 1, 1,
0.6079838, -0.04029834, 0.3494204, 0.3921569, 0, 1, 1,
0.6145764, -0.003098259, 2.140414, 0.3960784, 0, 1, 1,
0.6162754, 2.633718, -1.575689, 0.4039216, 0, 1, 1,
0.6165345, 0.8638494, 1.634188, 0.4117647, 0, 1, 1,
0.6229064, 0.03764195, 0.9653372, 0.4156863, 0, 1, 1,
0.6238149, -0.03437803, 2.251055, 0.4235294, 0, 1, 1,
0.6269032, 2.398485, 0.1558855, 0.427451, 0, 1, 1,
0.6285597, 0.3878634, 0.2789735, 0.4352941, 0, 1, 1,
0.6305446, -1.057367, 3.042668, 0.4392157, 0, 1, 1,
0.6315097, 0.6726664, 2.116697, 0.4470588, 0, 1, 1,
0.6345287, -0.128841, 0.4549351, 0.4509804, 0, 1, 1,
0.6399808, 0.4050771, 0.6470677, 0.4588235, 0, 1, 1,
0.6518655, 0.73628, 2.500608, 0.4627451, 0, 1, 1,
0.6550661, 0.3884312, -0.01494632, 0.4705882, 0, 1, 1,
0.6580308, 0.8209186, 1.941905, 0.4745098, 0, 1, 1,
0.6605048, 0.537249, 0.671042, 0.4823529, 0, 1, 1,
0.6646123, 1.833431, 0.1941874, 0.4862745, 0, 1, 1,
0.6681716, 0.7626322, 2.017565, 0.4941176, 0, 1, 1,
0.6984427, -1.875942, 4.154413, 0.5019608, 0, 1, 1,
0.6987962, 0.1409543, 3.002689, 0.5058824, 0, 1, 1,
0.700794, 1.040586, 0.2409781, 0.5137255, 0, 1, 1,
0.7082695, -1.158193, 0.9783877, 0.5176471, 0, 1, 1,
0.7136141, -0.5954, 2.273422, 0.5254902, 0, 1, 1,
0.7174314, -0.7337185, 3.091912, 0.5294118, 0, 1, 1,
0.7238542, 1.457477, 0.4643277, 0.5372549, 0, 1, 1,
0.7254447, 0.2211505, 2.730562, 0.5411765, 0, 1, 1,
0.7278036, -1.081692, 2.046822, 0.5490196, 0, 1, 1,
0.7311687, 0.4592603, 0.9778138, 0.5529412, 0, 1, 1,
0.7337228, 1.356858, 1.426642, 0.5607843, 0, 1, 1,
0.7399726, 0.9033375, 0.2692765, 0.5647059, 0, 1, 1,
0.7441712, 0.7655215, 0.8029976, 0.572549, 0, 1, 1,
0.747638, -0.7185866, 3.452892, 0.5764706, 0, 1, 1,
0.7478296, 0.9309687, 1.404261, 0.5843138, 0, 1, 1,
0.7479302, 0.555665, 2.592025, 0.5882353, 0, 1, 1,
0.7523356, -0.6229911, 1.882293, 0.5960785, 0, 1, 1,
0.75355, -0.3759506, 1.112446, 0.6039216, 0, 1, 1,
0.7541521, 0.7196567, 0.8103142, 0.6078432, 0, 1, 1,
0.7557185, 0.1400261, 1.814756, 0.6156863, 0, 1, 1,
0.7565468, -1.867846, 3.191986, 0.6196079, 0, 1, 1,
0.7614952, 0.5223874, -0.1519095, 0.627451, 0, 1, 1,
0.7683205, 0.4677716, 0.7336219, 0.6313726, 0, 1, 1,
0.7727237, 0.8436167, -0.5967389, 0.6392157, 0, 1, 1,
0.7730986, 0.09171715, 2.064987, 0.6431373, 0, 1, 1,
0.7743995, 0.9132847, -0.4891971, 0.6509804, 0, 1, 1,
0.7755288, -1.428004, 3.353733, 0.654902, 0, 1, 1,
0.7772599, 0.7676267, -0.4052761, 0.6627451, 0, 1, 1,
0.7796094, -0.7012712, 3.871479, 0.6666667, 0, 1, 1,
0.7852954, -0.2010767, 1.070991, 0.6745098, 0, 1, 1,
0.7906151, 1.255457, -0.3245633, 0.6784314, 0, 1, 1,
0.7923256, -0.8583379, 3.078151, 0.6862745, 0, 1, 1,
0.7940406, -0.457952, 0.9567627, 0.6901961, 0, 1, 1,
0.7951062, 0.00476973, 2.914714, 0.6980392, 0, 1, 1,
0.7970272, 0.8339043, 1.142033, 0.7058824, 0, 1, 1,
0.8028115, -0.6263359, 2.809943, 0.7098039, 0, 1, 1,
0.8077375, 0.2230402, 0.3956843, 0.7176471, 0, 1, 1,
0.8106148, -0.7060474, 2.483422, 0.7215686, 0, 1, 1,
0.813421, 0.006943791, 3.311728, 0.7294118, 0, 1, 1,
0.8219646, 1.488031, -0.4647265, 0.7333333, 0, 1, 1,
0.8228418, -0.3808461, 0.9294514, 0.7411765, 0, 1, 1,
0.8275266, 0.6975644, 1.51266, 0.7450981, 0, 1, 1,
0.8307815, -0.09450636, 2.215201, 0.7529412, 0, 1, 1,
0.8360813, 0.07138439, 2.335386, 0.7568628, 0, 1, 1,
0.8399773, 0.1492019, 0.2542624, 0.7647059, 0, 1, 1,
0.8401225, 0.21628, 1.340167, 0.7686275, 0, 1, 1,
0.8435977, -2.302153, 3.395307, 0.7764706, 0, 1, 1,
0.8506049, 1.522068, 1.224614, 0.7803922, 0, 1, 1,
0.853984, 0.6511434, 0.7601555, 0.7882353, 0, 1, 1,
0.85759, 1.281337, 0.7207422, 0.7921569, 0, 1, 1,
0.8784717, -0.3676634, 1.977583, 0.8, 0, 1, 1,
0.8812542, 0.8823665, 1.425944, 0.8078431, 0, 1, 1,
0.8881484, -0.8785051, 2.472315, 0.8117647, 0, 1, 1,
0.8885023, 1.103287, 0.04875249, 0.8196079, 0, 1, 1,
0.8958381, -1.857452, 1.997397, 0.8235294, 0, 1, 1,
0.896825, 0.3056006, -0.06741229, 0.8313726, 0, 1, 1,
0.9071139, 1.923633, -0.100238, 0.8352941, 0, 1, 1,
0.9075307, 1.231179, 1.259116, 0.8431373, 0, 1, 1,
0.9081495, 0.07709447, 0.7087843, 0.8470588, 0, 1, 1,
0.9084104, 0.6397336, -0.1693285, 0.854902, 0, 1, 1,
0.9096244, -1.676142, 3.526875, 0.8588235, 0, 1, 1,
0.9109952, -2.201228, 3.727119, 0.8666667, 0, 1, 1,
0.9118642, 1.155872, 1.958163, 0.8705882, 0, 1, 1,
0.9184473, -0.2980148, 2.098161, 0.8784314, 0, 1, 1,
0.921517, -1.465641, 2.536616, 0.8823529, 0, 1, 1,
0.9278789, 0.2099901, 1.258913, 0.8901961, 0, 1, 1,
0.9340948, -0.5201705, 2.449164, 0.8941177, 0, 1, 1,
0.9354913, 0.945974, 1.337283, 0.9019608, 0, 1, 1,
0.9362313, 0.5201573, 1.046814, 0.9098039, 0, 1, 1,
0.936466, 1.139098, 0.1670883, 0.9137255, 0, 1, 1,
0.9442588, 0.4187366, 2.210929, 0.9215686, 0, 1, 1,
0.9482058, 1.37869, 1.212633, 0.9254902, 0, 1, 1,
0.9504065, 0.1949659, 0.2041831, 0.9333333, 0, 1, 1,
0.951318, -0.2083095, 0.9570289, 0.9372549, 0, 1, 1,
0.9600251, -0.7942159, 2.198292, 0.945098, 0, 1, 1,
0.9618956, 0.9449652, 1.441489, 0.9490196, 0, 1, 1,
0.9699246, 0.834033, 0.6087054, 0.9568627, 0, 1, 1,
0.9719241, -0.7123483, 1.480795, 0.9607843, 0, 1, 1,
0.977746, 1.255136, 0.4707774, 0.9686275, 0, 1, 1,
0.9781215, 0.8147944, 2.160295, 0.972549, 0, 1, 1,
0.9800148, 0.1442783, 1.66285, 0.9803922, 0, 1, 1,
0.9875491, -0.1862923, 1.720342, 0.9843137, 0, 1, 1,
0.9926538, 0.7359951, 0.07819842, 0.9921569, 0, 1, 1,
0.996117, -1.299489, 2.017345, 0.9960784, 0, 1, 1,
0.9976227, 0.8765416, 0.5558484, 1, 0, 0.9960784, 1,
1.00034, -0.9830536, 2.645408, 1, 0, 0.9882353, 1,
1.008502, 3.05176, -1.590254, 1, 0, 0.9843137, 1,
1.01013, 0.02115056, 2.293622, 1, 0, 0.9764706, 1,
1.01027, 0.8705997, 1.769624, 1, 0, 0.972549, 1,
1.013747, -1.326277, 2.550475, 1, 0, 0.9647059, 1,
1.022786, -0.4663993, 1.786181, 1, 0, 0.9607843, 1,
1.025406, -0.08506355, 2.220706, 1, 0, 0.9529412, 1,
1.026936, 0.1714576, 0.7432418, 1, 0, 0.9490196, 1,
1.027997, -1.026791, 0.8479557, 1, 0, 0.9411765, 1,
1.029014, -0.9802609, 1.361666, 1, 0, 0.9372549, 1,
1.034103, 0.5624892, -1.002424, 1, 0, 0.9294118, 1,
1.044341, 0.7390995, 0.7069809, 1, 0, 0.9254902, 1,
1.046996, 0.5519881, 1.04173, 1, 0, 0.9176471, 1,
1.047774, -0.02275435, 2.01513, 1, 0, 0.9137255, 1,
1.048345, 0.4185339, 1.37557, 1, 0, 0.9058824, 1,
1.058916, -1.291873, 1.702851, 1, 0, 0.9019608, 1,
1.059322, -0.1194221, 2.298016, 1, 0, 0.8941177, 1,
1.061833, -1.145811, 1.470944, 1, 0, 0.8862745, 1,
1.062364, 0.09306353, -0.1797907, 1, 0, 0.8823529, 1,
1.064242, -0.8955172, 1.513689, 1, 0, 0.8745098, 1,
1.06651, 0.209573, 1.119183, 1, 0, 0.8705882, 1,
1.068047, -1.068566, 2.533346, 1, 0, 0.8627451, 1,
1.075322, 0.2574389, 0.8725609, 1, 0, 0.8588235, 1,
1.078681, -1.50295, 2.112075, 1, 0, 0.8509804, 1,
1.082371, -1.099769, 2.296162, 1, 0, 0.8470588, 1,
1.082477, 0.3326576, 2.489064, 1, 0, 0.8392157, 1,
1.082906, 0.2974196, 2.134446, 1, 0, 0.8352941, 1,
1.088729, 0.8023728, 1.305424, 1, 0, 0.827451, 1,
1.095872, -1.145309, 3.04007, 1, 0, 0.8235294, 1,
1.100359, -0.640632, 3.163838, 1, 0, 0.8156863, 1,
1.100531, 1.965256, -1.641625, 1, 0, 0.8117647, 1,
1.108895, 0.07875444, 2.290136, 1, 0, 0.8039216, 1,
1.109338, -0.05009554, 0.49331, 1, 0, 0.7960784, 1,
1.111802, -0.006842594, 2.197188, 1, 0, 0.7921569, 1,
1.113053, 2.331955, 1.33435, 1, 0, 0.7843137, 1,
1.126368, -0.1375049, 1.013386, 1, 0, 0.7803922, 1,
1.126438, -0.470176, 3.376742, 1, 0, 0.772549, 1,
1.137031, -0.06983704, 0.3025789, 1, 0, 0.7686275, 1,
1.14122, -0.04898841, 2.610332, 1, 0, 0.7607843, 1,
1.141431, 0.03579954, 1.432307, 1, 0, 0.7568628, 1,
1.144102, 0.7375703, 0.5593862, 1, 0, 0.7490196, 1,
1.147, -1.367802, 3.021081, 1, 0, 0.7450981, 1,
1.153347, -0.08807739, 1.097059, 1, 0, 0.7372549, 1,
1.154889, 0.4754577, 1.15907, 1, 0, 0.7333333, 1,
1.166023, -1.773702, 1.180728, 1, 0, 0.7254902, 1,
1.185535, 0.0722432, 1.605185, 1, 0, 0.7215686, 1,
1.188836, -0.2081419, 2.14543, 1, 0, 0.7137255, 1,
1.189564, -1.61423, 2.331637, 1, 0, 0.7098039, 1,
1.194222, -0.4753994, 3.43657, 1, 0, 0.7019608, 1,
1.199076, -0.4370692, 3.053016, 1, 0, 0.6941177, 1,
1.200867, 0.1107484, -0.759755, 1, 0, 0.6901961, 1,
1.202214, 0.386303, 1.338197, 1, 0, 0.682353, 1,
1.20358, -2.126566, 2.274943, 1, 0, 0.6784314, 1,
1.203947, 0.1646092, 1.750005, 1, 0, 0.6705883, 1,
1.207301, 0.2740451, 0.4937481, 1, 0, 0.6666667, 1,
1.211307, -0.05419347, 1.143056, 1, 0, 0.6588235, 1,
1.214985, -0.1529596, 1.78794, 1, 0, 0.654902, 1,
1.217363, 0.4749216, 0.7869107, 1, 0, 0.6470588, 1,
1.217643, -0.1918069, 0.3389505, 1, 0, 0.6431373, 1,
1.240964, 0.2272467, 3.076017, 1, 0, 0.6352941, 1,
1.2474, 0.5262018, 1.041342, 1, 0, 0.6313726, 1,
1.257056, -1.168678, 2.093389, 1, 0, 0.6235294, 1,
1.268505, -0.9210891, 0.964863, 1, 0, 0.6196079, 1,
1.273503, 0.1296038, 1.965151, 1, 0, 0.6117647, 1,
1.277884, 0.3587175, 2.103407, 1, 0, 0.6078432, 1,
1.283072, -0.3169466, 1.168005, 1, 0, 0.6, 1,
1.285102, -0.7700529, 1.743119, 1, 0, 0.5921569, 1,
1.288496, 0.02733763, 0.8934821, 1, 0, 0.5882353, 1,
1.289143, -0.219217, 2.253862, 1, 0, 0.5803922, 1,
1.29263, -0.2256296, 0.793773, 1, 0, 0.5764706, 1,
1.299739, -0.4498468, 2.151909, 1, 0, 0.5686275, 1,
1.309966, 0.622573, 1.07682, 1, 0, 0.5647059, 1,
1.314086, 1.002629, 0.2782243, 1, 0, 0.5568628, 1,
1.335782, 0.1997554, 1.293214, 1, 0, 0.5529412, 1,
1.339943, 2.369617, -1.391127, 1, 0, 0.5450981, 1,
1.365252, 0.09531191, 3.509941, 1, 0, 0.5411765, 1,
1.366352, -1.688657, 2.575157, 1, 0, 0.5333334, 1,
1.36774, 0.3430964, 1.142962, 1, 0, 0.5294118, 1,
1.370174, 0.9791294, 1.983899, 1, 0, 0.5215687, 1,
1.375722, 1.755283, 1.638107, 1, 0, 0.5176471, 1,
1.382438, 1.046077, 1.657424, 1, 0, 0.509804, 1,
1.383082, -0.2706259, 0.08658352, 1, 0, 0.5058824, 1,
1.391391, 0.9278988, 1.562453, 1, 0, 0.4980392, 1,
1.400984, 1.21252, 2.923322, 1, 0, 0.4901961, 1,
1.402232, -1.298054, 1.374297, 1, 0, 0.4862745, 1,
1.402534, 1.220223, 2.971153, 1, 0, 0.4784314, 1,
1.40663, 0.244727, 1.502162, 1, 0, 0.4745098, 1,
1.407668, 1.094331, 1.406846, 1, 0, 0.4666667, 1,
1.411379, -0.940811, 3.159065, 1, 0, 0.4627451, 1,
1.426689, -0.8641384, 2.63558, 1, 0, 0.454902, 1,
1.430377, -0.4488775, 1.373121, 1, 0, 0.4509804, 1,
1.440987, -1.200121, 1.397818, 1, 0, 0.4431373, 1,
1.444082, -0.07432098, 1.440351, 1, 0, 0.4392157, 1,
1.453904, -2.191552, 2.716647, 1, 0, 0.4313726, 1,
1.462871, -0.4825552, 1.077066, 1, 0, 0.427451, 1,
1.467701, -0.293784, 1.475723, 1, 0, 0.4196078, 1,
1.468364, 1.782997, 2.073035, 1, 0, 0.4156863, 1,
1.471953, 0.3813385, 1.050998, 1, 0, 0.4078431, 1,
1.472261, -2.546448, 2.738082, 1, 0, 0.4039216, 1,
1.474484, -1.507622, 1.68022, 1, 0, 0.3960784, 1,
1.489318, 0.1458102, 0.2126384, 1, 0, 0.3882353, 1,
1.493723, -1.162102, 1.091848, 1, 0, 0.3843137, 1,
1.494663, 0.4464304, 2.100742, 1, 0, 0.3764706, 1,
1.495117, -0.1884317, 2.43946, 1, 0, 0.372549, 1,
1.49587, -0.242033, 0.3650025, 1, 0, 0.3647059, 1,
1.498189, -1.029899, 0.6195399, 1, 0, 0.3607843, 1,
1.502715, -1.024322, 1.461402, 1, 0, 0.3529412, 1,
1.50289, -0.1972531, 1.817384, 1, 0, 0.3490196, 1,
1.511191, 0.8622623, 1.384787, 1, 0, 0.3411765, 1,
1.5155, -0.4002262, 2.965654, 1, 0, 0.3372549, 1,
1.516087, -0.2182332, 3.112612, 1, 0, 0.3294118, 1,
1.517751, 0.3229388, 2.567794, 1, 0, 0.3254902, 1,
1.521201, 0.4581299, 2.357873, 1, 0, 0.3176471, 1,
1.521894, -1.44279, 1.216707, 1, 0, 0.3137255, 1,
1.529384, -1.329481, 2.182143, 1, 0, 0.3058824, 1,
1.542981, 1.166096, 1.105566, 1, 0, 0.2980392, 1,
1.560919, -2.135821, 2.543186, 1, 0, 0.2941177, 1,
1.602031, -0.8774225, 2.20302, 1, 0, 0.2862745, 1,
1.605133, -0.1295944, 0.7041965, 1, 0, 0.282353, 1,
1.607724, -0.8612387, 2.77609, 1, 0, 0.2745098, 1,
1.608712, -0.393589, -0.7973902, 1, 0, 0.2705882, 1,
1.615614, -1.518227, 2.259433, 1, 0, 0.2627451, 1,
1.623898, -0.2985523, 0.2329313, 1, 0, 0.2588235, 1,
1.624349, 0.4393042, 1.263098, 1, 0, 0.2509804, 1,
1.654497, -0.4102429, 2.16361, 1, 0, 0.2470588, 1,
1.655612, -0.5950126, 3.02001, 1, 0, 0.2392157, 1,
1.659696, 0.004285241, 3.20406, 1, 0, 0.2352941, 1,
1.695092, -0.4570985, 2.210991, 1, 0, 0.227451, 1,
1.732415, -2.357303, 0.5952216, 1, 0, 0.2235294, 1,
1.754979, -0.7597015, 2.02087, 1, 0, 0.2156863, 1,
1.756713, -0.1238813, 1.945289, 1, 0, 0.2117647, 1,
1.756788, 0.5748256, -0.1461578, 1, 0, 0.2039216, 1,
1.786394, -0.1004226, 2.401914, 1, 0, 0.1960784, 1,
1.797226, -0.4032519, 0.8561532, 1, 0, 0.1921569, 1,
1.797914, -1.086413, 4.06372, 1, 0, 0.1843137, 1,
1.804292, -0.2206453, 0.125249, 1, 0, 0.1803922, 1,
1.812041, -0.5726173, 2.615929, 1, 0, 0.172549, 1,
1.819118, 1.666695, 1.396309, 1, 0, 0.1686275, 1,
1.855507, 1.335648, 1.153014, 1, 0, 0.1607843, 1,
1.877031, -0.08543147, 3.467702, 1, 0, 0.1568628, 1,
1.904571, -0.9014823, 2.056391, 1, 0, 0.1490196, 1,
1.912879, -0.3858486, 2.510195, 1, 0, 0.145098, 1,
1.925969, 0.1680999, 2.058441, 1, 0, 0.1372549, 1,
1.944984, -2.669962, 1.151283, 1, 0, 0.1333333, 1,
1.981594, -1.902001, 1.564779, 1, 0, 0.1254902, 1,
2.019482, 1.389083, 0.128251, 1, 0, 0.1215686, 1,
2.028617, -0.09672097, 2.217582, 1, 0, 0.1137255, 1,
2.056615, -1.068801, 4.029043, 1, 0, 0.1098039, 1,
2.080133, 0.2400442, 1.056113, 1, 0, 0.1019608, 1,
2.131591, -0.00589772, 2.422549, 1, 0, 0.09411765, 1,
2.138725, -0.5733181, 3.037201, 1, 0, 0.09019608, 1,
2.143712, -0.04094317, 0.5592156, 1, 0, 0.08235294, 1,
2.203763, -0.9917622, 1.184048, 1, 0, 0.07843138, 1,
2.213837, 0.8781277, -0.6759847, 1, 0, 0.07058824, 1,
2.250421, -0.9323497, 3.224929, 1, 0, 0.06666667, 1,
2.254783, 1.387395, 0.9670447, 1, 0, 0.05882353, 1,
2.299582, 0.8313795, 0.4563478, 1, 0, 0.05490196, 1,
2.302517, -1.425108, 0.169608, 1, 0, 0.04705882, 1,
2.484379, -1.388889, 1.163018, 1, 0, 0.04313726, 1,
2.555321, -0.341471, 0.3058576, 1, 0, 0.03529412, 1,
2.649035, 1.419345, 0.8928485, 1, 0, 0.03137255, 1,
2.675672, -0.9144323, 1.35792, 1, 0, 0.02352941, 1,
2.697747, -0.6340471, 2.812912, 1, 0, 0.01960784, 1,
2.781455, -0.2512341, 1.694262, 1, 0, 0.01176471, 1,
2.899741, -1.236971, 3.017904, 1, 0, 0.007843138, 1
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
0.07435989, -4.074449, -6.562039, 0, -0.5, 0.5, 0.5,
0.07435989, -4.074449, -6.562039, 1, -0.5, 0.5, 0.5,
0.07435989, -4.074449, -6.562039, 1, 1.5, 0.5, 0.5,
0.07435989, -4.074449, -6.562039, 0, 1.5, 0.5, 0.5
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
-3.708826, 0.005069852, -6.562039, 0, -0.5, 0.5, 0.5,
-3.708826, 0.005069852, -6.562039, 1, -0.5, 0.5, 0.5,
-3.708826, 0.005069852, -6.562039, 1, 1.5, 0.5, 0.5,
-3.708826, 0.005069852, -6.562039, 0, 1.5, 0.5, 0.5
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
-3.708826, -4.074449, 0.4136894, 0, -0.5, 0.5, 0.5,
-3.708826, -4.074449, 0.4136894, 1, -0.5, 0.5, 0.5,
-3.708826, -4.074449, 0.4136894, 1, 1.5, 0.5, 0.5,
-3.708826, -4.074449, 0.4136894, 0, 1.5, 0.5, 0.5
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
-2, -3.133021, -4.952255,
2, -3.133021, -4.952255,
-2, -3.133021, -4.952255,
-2, -3.289926, -5.220552,
-1, -3.133021, -4.952255,
-1, -3.289926, -5.220552,
0, -3.133021, -4.952255,
0, -3.289926, -5.220552,
1, -3.133021, -4.952255,
1, -3.289926, -5.220552,
2, -3.133021, -4.952255,
2, -3.289926, -5.220552
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
-2, -3.603735, -5.757147, 0, -0.5, 0.5, 0.5,
-2, -3.603735, -5.757147, 1, -0.5, 0.5, 0.5,
-2, -3.603735, -5.757147, 1, 1.5, 0.5, 0.5,
-2, -3.603735, -5.757147, 0, 1.5, 0.5, 0.5,
-1, -3.603735, -5.757147, 0, -0.5, 0.5, 0.5,
-1, -3.603735, -5.757147, 1, -0.5, 0.5, 0.5,
-1, -3.603735, -5.757147, 1, 1.5, 0.5, 0.5,
-1, -3.603735, -5.757147, 0, 1.5, 0.5, 0.5,
0, -3.603735, -5.757147, 0, -0.5, 0.5, 0.5,
0, -3.603735, -5.757147, 1, -0.5, 0.5, 0.5,
0, -3.603735, -5.757147, 1, 1.5, 0.5, 0.5,
0, -3.603735, -5.757147, 0, 1.5, 0.5, 0.5,
1, -3.603735, -5.757147, 0, -0.5, 0.5, 0.5,
1, -3.603735, -5.757147, 1, -0.5, 0.5, 0.5,
1, -3.603735, -5.757147, 1, 1.5, 0.5, 0.5,
1, -3.603735, -5.757147, 0, 1.5, 0.5, 0.5,
2, -3.603735, -5.757147, 0, -0.5, 0.5, 0.5,
2, -3.603735, -5.757147, 1, -0.5, 0.5, 0.5,
2, -3.603735, -5.757147, 1, 1.5, 0.5, 0.5,
2, -3.603735, -5.757147, 0, 1.5, 0.5, 0.5
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
-2.835783, -3, -4.952255,
-2.835783, 3, -4.952255,
-2.835783, -3, -4.952255,
-2.98129, -3, -5.220552,
-2.835783, -2, -4.952255,
-2.98129, -2, -5.220552,
-2.835783, -1, -4.952255,
-2.98129, -1, -5.220552,
-2.835783, 0, -4.952255,
-2.98129, 0, -5.220552,
-2.835783, 1, -4.952255,
-2.98129, 1, -5.220552,
-2.835783, 2, -4.952255,
-2.98129, 2, -5.220552,
-2.835783, 3, -4.952255,
-2.98129, 3, -5.220552
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
-3.272304, -3, -5.757147, 0, -0.5, 0.5, 0.5,
-3.272304, -3, -5.757147, 1, -0.5, 0.5, 0.5,
-3.272304, -3, -5.757147, 1, 1.5, 0.5, 0.5,
-3.272304, -3, -5.757147, 0, 1.5, 0.5, 0.5,
-3.272304, -2, -5.757147, 0, -0.5, 0.5, 0.5,
-3.272304, -2, -5.757147, 1, -0.5, 0.5, 0.5,
-3.272304, -2, -5.757147, 1, 1.5, 0.5, 0.5,
-3.272304, -2, -5.757147, 0, 1.5, 0.5, 0.5,
-3.272304, -1, -5.757147, 0, -0.5, 0.5, 0.5,
-3.272304, -1, -5.757147, 1, -0.5, 0.5, 0.5,
-3.272304, -1, -5.757147, 1, 1.5, 0.5, 0.5,
-3.272304, -1, -5.757147, 0, 1.5, 0.5, 0.5,
-3.272304, 0, -5.757147, 0, -0.5, 0.5, 0.5,
-3.272304, 0, -5.757147, 1, -0.5, 0.5, 0.5,
-3.272304, 0, -5.757147, 1, 1.5, 0.5, 0.5,
-3.272304, 0, -5.757147, 0, 1.5, 0.5, 0.5,
-3.272304, 1, -5.757147, 0, -0.5, 0.5, 0.5,
-3.272304, 1, -5.757147, 1, -0.5, 0.5, 0.5,
-3.272304, 1, -5.757147, 1, 1.5, 0.5, 0.5,
-3.272304, 1, -5.757147, 0, 1.5, 0.5, 0.5,
-3.272304, 2, -5.757147, 0, -0.5, 0.5, 0.5,
-3.272304, 2, -5.757147, 1, -0.5, 0.5, 0.5,
-3.272304, 2, -5.757147, 1, 1.5, 0.5, 0.5,
-3.272304, 2, -5.757147, 0, 1.5, 0.5, 0.5,
-3.272304, 3, -5.757147, 0, -0.5, 0.5, 0.5,
-3.272304, 3, -5.757147, 1, -0.5, 0.5, 0.5,
-3.272304, 3, -5.757147, 1, 1.5, 0.5, 0.5,
-3.272304, 3, -5.757147, 0, 1.5, 0.5, 0.5
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
-2.835783, -3.133021, -4,
-2.835783, -3.133021, 4,
-2.835783, -3.133021, -4,
-2.98129, -3.289926, -4,
-2.835783, -3.133021, -2,
-2.98129, -3.289926, -2,
-2.835783, -3.133021, 0,
-2.98129, -3.289926, 0,
-2.835783, -3.133021, 2,
-2.98129, -3.289926, 2,
-2.835783, -3.133021, 4,
-2.98129, -3.289926, 4
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
-3.272304, -3.603735, -4, 0, -0.5, 0.5, 0.5,
-3.272304, -3.603735, -4, 1, -0.5, 0.5, 0.5,
-3.272304, -3.603735, -4, 1, 1.5, 0.5, 0.5,
-3.272304, -3.603735, -4, 0, 1.5, 0.5, 0.5,
-3.272304, -3.603735, -2, 0, -0.5, 0.5, 0.5,
-3.272304, -3.603735, -2, 1, -0.5, 0.5, 0.5,
-3.272304, -3.603735, -2, 1, 1.5, 0.5, 0.5,
-3.272304, -3.603735, -2, 0, 1.5, 0.5, 0.5,
-3.272304, -3.603735, 0, 0, -0.5, 0.5, 0.5,
-3.272304, -3.603735, 0, 1, -0.5, 0.5, 0.5,
-3.272304, -3.603735, 0, 1, 1.5, 0.5, 0.5,
-3.272304, -3.603735, 0, 0, 1.5, 0.5, 0.5,
-3.272304, -3.603735, 2, 0, -0.5, 0.5, 0.5,
-3.272304, -3.603735, 2, 1, -0.5, 0.5, 0.5,
-3.272304, -3.603735, 2, 1, 1.5, 0.5, 0.5,
-3.272304, -3.603735, 2, 0, 1.5, 0.5, 0.5,
-3.272304, -3.603735, 4, 0, -0.5, 0.5, 0.5,
-3.272304, -3.603735, 4, 1, -0.5, 0.5, 0.5,
-3.272304, -3.603735, 4, 1, 1.5, 0.5, 0.5,
-3.272304, -3.603735, 4, 0, 1.5, 0.5, 0.5
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
-2.835783, -3.133021, -4.952255,
-2.835783, 3.143161, -4.952255,
-2.835783, -3.133021, 5.779634,
-2.835783, 3.143161, 5.779634,
-2.835783, -3.133021, -4.952255,
-2.835783, -3.133021, 5.779634,
-2.835783, 3.143161, -4.952255,
-2.835783, 3.143161, 5.779634,
-2.835783, -3.133021, -4.952255,
2.984503, -3.133021, -4.952255,
-2.835783, -3.133021, 5.779634,
2.984503, -3.133021, 5.779634,
-2.835783, 3.143161, -4.952255,
2.984503, 3.143161, -4.952255,
-2.835783, 3.143161, 5.779634,
2.984503, 3.143161, 5.779634,
2.984503, -3.133021, -4.952255,
2.984503, 3.143161, -4.952255,
2.984503, -3.133021, 5.779634,
2.984503, 3.143161, 5.779634,
2.984503, -3.133021, -4.952255,
2.984503, -3.133021, 5.779634,
2.984503, 3.143161, -4.952255,
2.984503, 3.143161, 5.779634
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
var radius = 7.330129;
var distance = 32.61257;
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
mvMatrix.translate( -0.07435989, -0.005069852, -0.4136894 );
mvMatrix.scale( 1.361699, 1.262787, 0.738498 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.61257);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
tricyclohexyltin_hyd<-read.table("tricyclohexyltin_hyd.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tricyclohexyltin_hyd$V2
```

```
## Error in eval(expr, envir, enclos): object 'tricyclohexyltin_hyd' not found
```

```r
y<-tricyclohexyltin_hyd$V3
```

```
## Error in eval(expr, envir, enclos): object 'tricyclohexyltin_hyd' not found
```

```r
z<-tricyclohexyltin_hyd$V4
```

```
## Error in eval(expr, envir, enclos): object 'tricyclohexyltin_hyd' not found
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
-2.751021, 1.278044, -0.6872389, 0, 0, 1, 1, 1,
-2.749326, -0.7120172, -1.710381, 1, 0, 0, 1, 1,
-2.708584, 2.217938, -0.3087752, 1, 0, 0, 1, 1,
-2.660172, 1.730771, -2.118073, 1, 0, 0, 1, 1,
-2.635976, -0.24516, -2.415851, 1, 0, 0, 1, 1,
-2.598107, -0.890381, -1.437366, 1, 0, 0, 1, 1,
-2.565344, -0.171842, -1.037964, 0, 0, 0, 1, 1,
-2.52475, -0.4966721, -3.054385, 0, 0, 0, 1, 1,
-2.39248, 1.002283, -0.3137651, 0, 0, 0, 1, 1,
-2.351611, 0.2270251, -0.7163092, 0, 0, 0, 1, 1,
-2.338979, -0.9137776, -2.919078, 0, 0, 0, 1, 1,
-2.125291, 0.4875498, -0.5227291, 0, 0, 0, 1, 1,
-2.111767, 0.8723884, -2.624836, 0, 0, 0, 1, 1,
-2.091796, 1.182065, -0.9686514, 1, 1, 1, 1, 1,
-2.086478, 0.9209989, -0.119286, 1, 1, 1, 1, 1,
-2.082643, -1.190363, -1.176659, 1, 1, 1, 1, 1,
-2.077441, 1.099522, 0.5269347, 1, 1, 1, 1, 1,
-2.072335, 0.8726674, -0.3796621, 1, 1, 1, 1, 1,
-2.064259, -0.3861701, -1.713022, 1, 1, 1, 1, 1,
-2.047104, -2.45552, -1.010588, 1, 1, 1, 1, 1,
-2.00792, -0.4739335, -3.666244, 1, 1, 1, 1, 1,
-1.952152, 1.439674, -2.286338, 1, 1, 1, 1, 1,
-1.927732, -0.9130561, -1.099818, 1, 1, 1, 1, 1,
-1.906287, 0.8649691, -1.028228, 1, 1, 1, 1, 1,
-1.891483, 1.091444, -1.806448, 1, 1, 1, 1, 1,
-1.889168, 0.02244327, -0.2197708, 1, 1, 1, 1, 1,
-1.86606, 0.1476209, -1.153821, 1, 1, 1, 1, 1,
-1.837086, -0.2299977, -1.758138, 1, 1, 1, 1, 1,
-1.816964, -0.2481588, -1.87091, 0, 0, 1, 1, 1,
-1.807228, -1.631878, -1.304145, 1, 0, 0, 1, 1,
-1.785468, 0.04215541, 0.7031257, 1, 0, 0, 1, 1,
-1.781436, -1.035251, -1.403925, 1, 0, 0, 1, 1,
-1.774804, -0.7625048, -2.102437, 1, 0, 0, 1, 1,
-1.774211, -0.2569652, -2.925684, 1, 0, 0, 1, 1,
-1.771582, 0.08789978, -1.768872, 0, 0, 0, 1, 1,
-1.768464, 0.3430379, -0.9696683, 0, 0, 0, 1, 1,
-1.729396, -0.1715577, -1.098328, 0, 0, 0, 1, 1,
-1.726312, 0.337372, -1.897992, 0, 0, 0, 1, 1,
-1.725044, 0.635214, 0.2560203, 0, 0, 0, 1, 1,
-1.720785, -0.08209487, -0.4604517, 0, 0, 0, 1, 1,
-1.71159, -0.05454925, -1.459633, 0, 0, 0, 1, 1,
-1.698449, -1.46467, -1.189545, 1, 1, 1, 1, 1,
-1.684053, 2.134399, -0.9799559, 1, 1, 1, 1, 1,
-1.678941, 0.7478482, -1.16608, 1, 1, 1, 1, 1,
-1.675887, 0.6670635, -0.3232548, 1, 1, 1, 1, 1,
-1.675076, -0.4452188, -2.203718, 1, 1, 1, 1, 1,
-1.666479, 1.762871, 0.5624216, 1, 1, 1, 1, 1,
-1.658088, 2.072941, 0.08395904, 1, 1, 1, 1, 1,
-1.656424, 1.125157, -1.669381, 1, 1, 1, 1, 1,
-1.633137, -0.3410723, -0.9595045, 1, 1, 1, 1, 1,
-1.628062, -3.041621, -3.86921, 1, 1, 1, 1, 1,
-1.583002, 0.2334812, -3.138989, 1, 1, 1, 1, 1,
-1.582973, -0.4237996, -1.846233, 1, 1, 1, 1, 1,
-1.560422, -0.8899975, -3.312996, 1, 1, 1, 1, 1,
-1.550226, -0.8328729, -1.388141, 1, 1, 1, 1, 1,
-1.547292, -0.08436684, -2.661, 1, 1, 1, 1, 1,
-1.545413, -1.039656, -3.540969, 0, 0, 1, 1, 1,
-1.542901, 1.273328, 0.8587697, 1, 0, 0, 1, 1,
-1.538235, 0.2531796, -0.8092245, 1, 0, 0, 1, 1,
-1.521861, 2.468026, 0.8479939, 1, 0, 0, 1, 1,
-1.520805, 0.2156976, -1.947651, 1, 0, 0, 1, 1,
-1.514911, 0.4894933, -2.387152, 1, 0, 0, 1, 1,
-1.509069, 0.439613, -2.156417, 0, 0, 0, 1, 1,
-1.499509, 0.2629625, -1.937328, 0, 0, 0, 1, 1,
-1.494716, 0.2329658, -0.4063885, 0, 0, 0, 1, 1,
-1.493981, -0.8338974, -2.751376, 0, 0, 0, 1, 1,
-1.466709, 0.3641275, -1.964259, 0, 0, 0, 1, 1,
-1.453131, -0.9572409, -1.717368, 0, 0, 0, 1, 1,
-1.449482, -2.011837, -3.071732, 0, 0, 0, 1, 1,
-1.447773, -0.5900476, -1.477197, 1, 1, 1, 1, 1,
-1.445987, -0.4022515, -3.158288, 1, 1, 1, 1, 1,
-1.429914, -0.7444469, -1.630723, 1, 1, 1, 1, 1,
-1.395106, -1.599316, -2.047038, 1, 1, 1, 1, 1,
-1.387238, 0.5106094, -1.485293, 1, 1, 1, 1, 1,
-1.379653, -0.2226486, -0.276828, 1, 1, 1, 1, 1,
-1.359433, 0.4286918, -1.698735, 1, 1, 1, 1, 1,
-1.349262, 1.318228, -2.504153, 1, 1, 1, 1, 1,
-1.345225, 1.148136, -2.002008, 1, 1, 1, 1, 1,
-1.342043, -0.2160782, -3.594623, 1, 1, 1, 1, 1,
-1.34192, -0.9776188, -0.9107721, 1, 1, 1, 1, 1,
-1.337997, 0.9901323, -0.4852027, 1, 1, 1, 1, 1,
-1.335297, 1.400011, -0.9556881, 1, 1, 1, 1, 1,
-1.33044, -0.1301097, -1.344055, 1, 1, 1, 1, 1,
-1.328052, -1.021862, -4.139818, 1, 1, 1, 1, 1,
-1.320274, 0.7300308, -1.16545, 0, 0, 1, 1, 1,
-1.315885, 0.5854641, -0.8337077, 1, 0, 0, 1, 1,
-1.307834, -0.05808917, -2.337373, 1, 0, 0, 1, 1,
-1.305805, 1.637536, -0.8752621, 1, 0, 0, 1, 1,
-1.297407, -0.329291, -3.165518, 1, 0, 0, 1, 1,
-1.287951, -2.161698, -3.191429, 1, 0, 0, 1, 1,
-1.286462, 0.08489178, -2.029545, 0, 0, 0, 1, 1,
-1.279238, 0.4352199, -2.976231, 0, 0, 0, 1, 1,
-1.277278, -0.8423437, -1.643253, 0, 0, 0, 1, 1,
-1.276322, 0.9844353, -0.7166675, 0, 0, 0, 1, 1,
-1.273479, -1.363152, -2.620338, 0, 0, 0, 1, 1,
-1.261225, -1.693581, -3.232807, 0, 0, 0, 1, 1,
-1.25896, -0.5886726, -2.291763, 0, 0, 0, 1, 1,
-1.255552, 0.4207929, -0.9479303, 1, 1, 1, 1, 1,
-1.250889, 0.7993742, -0.7173288, 1, 1, 1, 1, 1,
-1.240467, -2.278889, -2.994116, 1, 1, 1, 1, 1,
-1.234992, 1.844998, -1.082154, 1, 1, 1, 1, 1,
-1.231948, 0.5958114, -0.2424536, 1, 1, 1, 1, 1,
-1.226208, 0.5450923, 0.2907881, 1, 1, 1, 1, 1,
-1.21351, 1.747198, -0.1691521, 1, 1, 1, 1, 1,
-1.213218, 0.3017397, -0.09868905, 1, 1, 1, 1, 1,
-1.204075, -0.8644877, -1.623191, 1, 1, 1, 1, 1,
-1.198194, -0.08908918, -2.43102, 1, 1, 1, 1, 1,
-1.192407, 0.04861949, -1.550432, 1, 1, 1, 1, 1,
-1.192175, -1.698172, -2.428297, 1, 1, 1, 1, 1,
-1.184685, -0.70157, -1.762922, 1, 1, 1, 1, 1,
-1.181096, 0.9386377, -1.764316, 1, 1, 1, 1, 1,
-1.180381, 0.4584238, -0.3882994, 1, 1, 1, 1, 1,
-1.171916, -0.3670299, -1.433719, 0, 0, 1, 1, 1,
-1.171804, 0.7110361, -0.7598251, 1, 0, 0, 1, 1,
-1.16501, -0.4822878, -2.846485, 1, 0, 0, 1, 1,
-1.160526, -0.6564546, -2.20416, 1, 0, 0, 1, 1,
-1.160306, -0.04142596, -1.327897, 1, 0, 0, 1, 1,
-1.158194, 1.293164, -0.2865615, 1, 0, 0, 1, 1,
-1.15194, 0.4506367, -2.089665, 0, 0, 0, 1, 1,
-1.135009, 1.974682, -0.2900857, 0, 0, 0, 1, 1,
-1.133726, -0.1478654, -2.766454, 0, 0, 0, 1, 1,
-1.12927, -1.79802, -3.435753, 0, 0, 0, 1, 1,
-1.113898, 1.089497, -1.930711, 0, 0, 0, 1, 1,
-1.104829, 0.06647347, -1.054816, 0, 0, 0, 1, 1,
-1.10103, -0.09631085, -2.322501, 0, 0, 0, 1, 1,
-1.096159, -0.8668927, -2.03265, 1, 1, 1, 1, 1,
-1.09511, 0.3846807, -2.583797, 1, 1, 1, 1, 1,
-1.091778, -1.409712, -3.258125, 1, 1, 1, 1, 1,
-1.086398, 0.8477678, -1.056774, 1, 1, 1, 1, 1,
-1.07045, -1.648657, -4.099414, 1, 1, 1, 1, 1,
-1.065235, 0.1037278, -1.098607, 1, 1, 1, 1, 1,
-1.063774, 1.032212, -0.02634958, 1, 1, 1, 1, 1,
-1.052567, -0.5855119, -1.563667, 1, 1, 1, 1, 1,
-1.049926, 0.6899854, -1.055738, 1, 1, 1, 1, 1,
-1.046779, 1.528326, 0.7842637, 1, 1, 1, 1, 1,
-1.034455, -0.435376, -1.746385, 1, 1, 1, 1, 1,
-1.034264, -0.5444442, -1.983696, 1, 1, 1, 1, 1,
-1.032287, 1.045946, -0.7716366, 1, 1, 1, 1, 1,
-1.013027, 0.2748717, -1.210413, 1, 1, 1, 1, 1,
-1.00904, 0.3162495, -0.2881044, 1, 1, 1, 1, 1,
-1.004814, 0.6787059, -1.706791, 0, 0, 1, 1, 1,
-1.003279, -0.6290317, -2.287392, 1, 0, 0, 1, 1,
-1.001181, -0.7079211, -0.5537109, 1, 0, 0, 1, 1,
-1.00101, 0.3979698, -1.610067, 1, 0, 0, 1, 1,
-0.9990824, -1.322921, -1.748991, 1, 0, 0, 1, 1,
-0.997053, 0.1411175, -2.620132, 1, 0, 0, 1, 1,
-0.9854698, -0.190635, 1.093073, 0, 0, 0, 1, 1,
-0.9836946, 1.723232, 0.2168425, 0, 0, 0, 1, 1,
-0.9793334, -1.056044, -1.675961, 0, 0, 0, 1, 1,
-0.9732531, 0.1626442, -3.555311, 0, 0, 0, 1, 1,
-0.9676776, 0.4546883, -0.4902157, 0, 0, 0, 1, 1,
-0.9642922, -0.4004196, -0.7999816, 0, 0, 0, 1, 1,
-0.9531054, -1.289351, -2.831932, 0, 0, 0, 1, 1,
-0.9434993, -0.06065953, -0.1367761, 1, 1, 1, 1, 1,
-0.9415865, -0.630922, -0.8738102, 1, 1, 1, 1, 1,
-0.9396557, 1.414173, -0.9708642, 1, 1, 1, 1, 1,
-0.9227667, -0.5284266, -2.561788, 1, 1, 1, 1, 1,
-0.917683, -1.605525, -3.454027, 1, 1, 1, 1, 1,
-0.9159727, -0.191202, -0.4718462, 1, 1, 1, 1, 1,
-0.913523, 1.623342, 0.06959935, 1, 1, 1, 1, 1,
-0.908791, -0.1621198, -0.9104633, 1, 1, 1, 1, 1,
-0.90631, -0.09842419, -1.830821, 1, 1, 1, 1, 1,
-0.9030944, -1.080994, -4.12925, 1, 1, 1, 1, 1,
-0.9027399, -0.9933999, -1.25326, 1, 1, 1, 1, 1,
-0.9019774, 0.3666048, -1.379502, 1, 1, 1, 1, 1,
-0.9007983, 0.2600846, -0.685276, 1, 1, 1, 1, 1,
-0.8993335, -1.966782, -3.021154, 1, 1, 1, 1, 1,
-0.8992639, 0.2520879, -1.986664, 1, 1, 1, 1, 1,
-0.8958769, -1.366961, -1.580603, 0, 0, 1, 1, 1,
-0.8932981, -0.9119894, -1.381372, 1, 0, 0, 1, 1,
-0.8891134, 0.9896795, -0.5234621, 1, 0, 0, 1, 1,
-0.8883961, 0.5579624, -0.720651, 1, 0, 0, 1, 1,
-0.8861129, 0.8595842, 0.9366745, 1, 0, 0, 1, 1,
-0.8845021, -0.005502674, 0.3651713, 1, 0, 0, 1, 1,
-0.8794265, -1.803999, -2.472679, 0, 0, 0, 1, 1,
-0.8793719, -1.202324, -0.8929785, 0, 0, 0, 1, 1,
-0.8765219, -0.2313321, -0.4841191, 0, 0, 0, 1, 1,
-0.8753774, -1.049066, -2.356605, 0, 0, 0, 1, 1,
-0.8729374, 0.9114374, -2.110472, 0, 0, 0, 1, 1,
-0.8597828, 1.223063, -0.450274, 0, 0, 0, 1, 1,
-0.8509122, 1.111695, -0.2377051, 0, 0, 0, 1, 1,
-0.8496582, 0.03373551, -0.8738384, 1, 1, 1, 1, 1,
-0.8398838, -0.3447991, -1.99782, 1, 1, 1, 1, 1,
-0.8391981, -0.8241656, -3.328118, 1, 1, 1, 1, 1,
-0.8373777, 0.09262463, -0.5710364, 1, 1, 1, 1, 1,
-0.834784, -1.693361, -2.892658, 1, 1, 1, 1, 1,
-0.8326744, -0.06817104, -0.2343339, 1, 1, 1, 1, 1,
-0.8321013, -0.5755557, -2.802195, 1, 1, 1, 1, 1,
-0.8276745, -0.7916285, -3.090402, 1, 1, 1, 1, 1,
-0.8122964, -1.896736, -2.225427, 1, 1, 1, 1, 1,
-0.8083994, 1.055795, -0.8235778, 1, 1, 1, 1, 1,
-0.8053824, 1.423081, -0.8076283, 1, 1, 1, 1, 1,
-0.7976955, -2.736963, -3.406221, 1, 1, 1, 1, 1,
-0.7944592, -0.2248016, -0.9067556, 1, 1, 1, 1, 1,
-0.7882299, 0.09144887, -0.2014775, 1, 1, 1, 1, 1,
-0.7821024, 1.386898, -0.764857, 1, 1, 1, 1, 1,
-0.7807838, 0.6381762, 0.006529434, 0, 0, 1, 1, 1,
-0.7793663, 2.907926, -0.3989611, 1, 0, 0, 1, 1,
-0.774729, 0.784287, -1.085665, 1, 0, 0, 1, 1,
-0.7744799, -0.0768499, -1.634577, 1, 0, 0, 1, 1,
-0.7720633, 1.880106, -0.5063062, 1, 0, 0, 1, 1,
-0.7615855, 0.572066, -1.120381, 1, 0, 0, 1, 1,
-0.7593659, -0.6316916, -0.8595073, 0, 0, 0, 1, 1,
-0.7584462, -0.9830989, -2.468667, 0, 0, 0, 1, 1,
-0.7576875, -0.06940709, -2.618918, 0, 0, 0, 1, 1,
-0.7541309, -0.201679, -1.350099, 0, 0, 0, 1, 1,
-0.748166, -0.2267922, -2.147361, 0, 0, 0, 1, 1,
-0.745352, 1.706827, 0.07302704, 0, 0, 0, 1, 1,
-0.7453102, 0.5615383, -0.1577743, 0, 0, 0, 1, 1,
-0.7424664, -0.6261572, -0.6349235, 1, 1, 1, 1, 1,
-0.7404135, 0.208428, 0.1923096, 1, 1, 1, 1, 1,
-0.7375577, -0.463365, -3.147533, 1, 1, 1, 1, 1,
-0.723551, 0.2430816, -1.340618, 1, 1, 1, 1, 1,
-0.7212675, 0.1463224, -1.451174, 1, 1, 1, 1, 1,
-0.718133, -1.207603, -3.204654, 1, 1, 1, 1, 1,
-0.7181128, -0.7844697, -0.9744039, 1, 1, 1, 1, 1,
-0.7159061, -1.180004, -2.649724, 1, 1, 1, 1, 1,
-0.709512, 1.473821, -1.545402, 1, 1, 1, 1, 1,
-0.7042904, 0.6144258, -1.146209, 1, 1, 1, 1, 1,
-0.7014119, 2.019594, 1.046011, 1, 1, 1, 1, 1,
-0.7007923, 2.33298, -0.1192758, 1, 1, 1, 1, 1,
-0.6955124, -0.6840053, -3.811555, 1, 1, 1, 1, 1,
-0.6938756, -1.758335, -3.3945, 1, 1, 1, 1, 1,
-0.6837914, 0.2046166, -3.081792, 1, 1, 1, 1, 1,
-0.6831628, 1.247782, 0.6367918, 0, 0, 1, 1, 1,
-0.6824421, -0.1903736, -0.6945953, 1, 0, 0, 1, 1,
-0.6821984, 0.5395008, -0.7935035, 1, 0, 0, 1, 1,
-0.6806684, -0.3673575, -1.268935, 1, 0, 0, 1, 1,
-0.6799047, 1.18867, -1.313307, 1, 0, 0, 1, 1,
-0.6763619, 0.5060111, -1.824972, 1, 0, 0, 1, 1,
-0.6742702, 0.2092795, -0.5940619, 0, 0, 0, 1, 1,
-0.6720539, 1.189957, -1.181418, 0, 0, 0, 1, 1,
-0.6686972, 0.3039246, -0.2915021, 0, 0, 0, 1, 1,
-0.6666711, -2.842263, -4.09328, 0, 0, 0, 1, 1,
-0.6643319, 0.7932553, 0.3601216, 0, 0, 0, 1, 1,
-0.6627864, -1.825738, -4.658241, 0, 0, 0, 1, 1,
-0.6527001, -0.3210756, -1.430624, 0, 0, 0, 1, 1,
-0.6441513, 0.2239548, -2.972266, 1, 1, 1, 1, 1,
-0.6424713, -0.706706, -1.967372, 1, 1, 1, 1, 1,
-0.6412022, -0.1712847, -2.259227, 1, 1, 1, 1, 1,
-0.6382172, 1.179013, -0.6032615, 1, 1, 1, 1, 1,
-0.636168, 1.569626, 0.642345, 1, 1, 1, 1, 1,
-0.6316327, 0.2767856, -1.596542, 1, 1, 1, 1, 1,
-0.6263666, 0.7033108, -3.012837, 1, 1, 1, 1, 1,
-0.625246, 0.23976, -0.9405987, 1, 1, 1, 1, 1,
-0.6183572, 1.173646, -0.3456844, 1, 1, 1, 1, 1,
-0.6127874, -0.01244792, -1.114694, 1, 1, 1, 1, 1,
-0.6118906, -0.0691293, -2.453797, 1, 1, 1, 1, 1,
-0.6094662, 0.6249271, -0.4807383, 1, 1, 1, 1, 1,
-0.608197, 0.7196853, -0.5766672, 1, 1, 1, 1, 1,
-0.6077253, 1.397638, -1.006245, 1, 1, 1, 1, 1,
-0.6056111, 0.7334821, -0.7896209, 1, 1, 1, 1, 1,
-0.6020376, 0.05272059, -2.221985, 0, 0, 1, 1, 1,
-0.5945915, -0.8085005, -3.078821, 1, 0, 0, 1, 1,
-0.5945398, -0.6143168, -2.619924, 1, 0, 0, 1, 1,
-0.5944707, -1.635627, -2.420898, 1, 0, 0, 1, 1,
-0.5934076, -1.500872, -2.966265, 1, 0, 0, 1, 1,
-0.5904754, 0.2099542, -1.166887, 1, 0, 0, 1, 1,
-0.5884479, -0.4578203, -2.991537, 0, 0, 0, 1, 1,
-0.5849161, -0.03102448, -0.2198137, 0, 0, 0, 1, 1,
-0.5808548, 2.403802, -0.6448858, 0, 0, 0, 1, 1,
-0.5803073, -0.9630759, -1.788984, 0, 0, 0, 1, 1,
-0.577425, 0.4732115, -0.7586805, 0, 0, 0, 1, 1,
-0.5765103, 1.309262, -0.786477, 0, 0, 0, 1, 1,
-0.5757154, 0.8978472, -2.278557, 0, 0, 0, 1, 1,
-0.5706432, 0.003920442, -1.792359, 1, 1, 1, 1, 1,
-0.5620571, -1.480376, -0.7518373, 1, 1, 1, 1, 1,
-0.5550552, 0.7207893, 0.9224594, 1, 1, 1, 1, 1,
-0.5548868, -1.29639, -2.364716, 1, 1, 1, 1, 1,
-0.5543615, 0.202187, -0.5412387, 1, 1, 1, 1, 1,
-0.5506923, -0.7131912, -3.262962, 1, 1, 1, 1, 1,
-0.5442979, 0.6985895, 0.4845236, 1, 1, 1, 1, 1,
-0.5440431, 0.09078637, -0.1964952, 1, 1, 1, 1, 1,
-0.5432236, -0.1477213, -1.524438, 1, 1, 1, 1, 1,
-0.5352463, 0.8097786, -0.007456286, 1, 1, 1, 1, 1,
-0.5335139, 0.6321194, -1.295388, 1, 1, 1, 1, 1,
-0.530888, 0.26741, -0.197618, 1, 1, 1, 1, 1,
-0.5295573, -0.983069, -3.012199, 1, 1, 1, 1, 1,
-0.5252306, -0.3616442, -1.043801, 1, 1, 1, 1, 1,
-0.5223773, 0.5883371, -3.037286, 1, 1, 1, 1, 1,
-0.5115013, -0.5160189, -3.397424, 0, 0, 1, 1, 1,
-0.5056217, 0.1875681, -1.24636, 1, 0, 0, 1, 1,
-0.5029848, -0.0212156, -2.345052, 1, 0, 0, 1, 1,
-0.5022841, 0.1106839, -2.046018, 1, 0, 0, 1, 1,
-0.5014317, 0.07973131, -1.211656, 1, 0, 0, 1, 1,
-0.5010803, 1.316108, -0.1167048, 1, 0, 0, 1, 1,
-0.4995517, 0.02597055, -1.846033, 0, 0, 0, 1, 1,
-0.4968466, 0.4340095, -0.1912527, 0, 0, 0, 1, 1,
-0.4949726, -0.7322293, -1.53447, 0, 0, 0, 1, 1,
-0.4941671, 0.213376, -0.09520802, 0, 0, 0, 1, 1,
-0.4923966, 0.5319788, 0.04017056, 0, 0, 0, 1, 1,
-0.4902099, -1.304908, -2.955549, 0, 0, 0, 1, 1,
-0.4898347, -0.9090161, -2.373716, 0, 0, 0, 1, 1,
-0.4894476, -0.5330778, -0.4655991, 1, 1, 1, 1, 1,
-0.4887775, -1.25209, -4.682283, 1, 1, 1, 1, 1,
-0.4833474, 1.185694, 0.5311272, 1, 1, 1, 1, 1,
-0.4821899, 0.3946705, -0.5449911, 1, 1, 1, 1, 1,
-0.4815117, 0.5035644, -0.09447002, 1, 1, 1, 1, 1,
-0.4755349, -0.9090218, -2.247774, 1, 1, 1, 1, 1,
-0.4735501, -1.388801, -3.315205, 1, 1, 1, 1, 1,
-0.4731421, 0.8261444, -0.485297, 1, 1, 1, 1, 1,
-0.4647585, -0.8435739, -1.66968, 1, 1, 1, 1, 1,
-0.4634564, 0.2866029, -1.395164, 1, 1, 1, 1, 1,
-0.4608669, 0.4711066, -1.567141, 1, 1, 1, 1, 1,
-0.4558007, -0.4513484, -2.529689, 1, 1, 1, 1, 1,
-0.455419, 0.2385631, -3.013084, 1, 1, 1, 1, 1,
-0.4502553, 0.5621499, -1.183364, 1, 1, 1, 1, 1,
-0.4351372, -1.581901, -3.663591, 1, 1, 1, 1, 1,
-0.4317215, 1.534141, 0.7296199, 0, 0, 1, 1, 1,
-0.4312669, 0.4084148, 1.120814, 1, 0, 0, 1, 1,
-0.4266644, -0.4568103, -2.598579, 1, 0, 0, 1, 1,
-0.4259828, 1.733356, 0.4789922, 1, 0, 0, 1, 1,
-0.4217611, -0.02365022, -2.235634, 1, 0, 0, 1, 1,
-0.4179512, 1.836965, -0.6575162, 1, 0, 0, 1, 1,
-0.4143626, 0.1706894, -0.7859867, 0, 0, 0, 1, 1,
-0.4132805, 0.236885, -0.8015812, 0, 0, 0, 1, 1,
-0.4096602, 1.206164, -0.0896476, 0, 0, 0, 1, 1,
-0.4090595, -1.511178, -4.170063, 0, 0, 0, 1, 1,
-0.4018757, 0.5823345, -0.07906669, 0, 0, 0, 1, 1,
-0.4000651, 1.539069, 0.9360145, 0, 0, 0, 1, 1,
-0.3982939, 2.026139, -0.5159363, 0, 0, 0, 1, 1,
-0.3976253, -0.269507, -2.53987, 1, 1, 1, 1, 1,
-0.3943742, -0.3603335, -0.6182922, 1, 1, 1, 1, 1,
-0.392879, -1.903486, -0.6274408, 1, 1, 1, 1, 1,
-0.3927474, 0.1450757, -0.3921711, 1, 1, 1, 1, 1,
-0.3923967, -2.098806, -2.486132, 1, 1, 1, 1, 1,
-0.3878277, -1.551902, -2.066324, 1, 1, 1, 1, 1,
-0.3868156, -0.717338, -3.205702, 1, 1, 1, 1, 1,
-0.386515, 0.7519114, -1.0773, 1, 1, 1, 1, 1,
-0.3838773, 0.1660445, -1.602947, 1, 1, 1, 1, 1,
-0.3814183, 1.065981, -1.00358, 1, 1, 1, 1, 1,
-0.379939, 0.330658, -2.487704, 1, 1, 1, 1, 1,
-0.3796906, -0.3568693, -2.960412, 1, 1, 1, 1, 1,
-0.3766887, 1.604393, 1.721901, 1, 1, 1, 1, 1,
-0.3756023, 1.576037, -1.101722, 1, 1, 1, 1, 1,
-0.3733209, 1.39259, 0.1172551, 1, 1, 1, 1, 1,
-0.3715523, -0.4862402, -3.820393, 0, 0, 1, 1, 1,
-0.3706675, 1.654929, -0.7228064, 1, 0, 0, 1, 1,
-0.3706557, 1.032622, 1.354689, 1, 0, 0, 1, 1,
-0.3656269, -1.08901, -4.295729, 1, 0, 0, 1, 1,
-0.3540045, 1.010726, -0.6958408, 1, 0, 0, 1, 1,
-0.3439346, -0.09989636, -1.83343, 1, 0, 0, 1, 1,
-0.3414792, 1.219374, -1.02046, 0, 0, 0, 1, 1,
-0.3385172, -0.6066427, -1.933362, 0, 0, 0, 1, 1,
-0.3350766, -1.794251, -3.069284, 0, 0, 0, 1, 1,
-0.3350641, 0.976222, 0.4591862, 0, 0, 0, 1, 1,
-0.3295802, 1.321211, -0.02462376, 0, 0, 0, 1, 1,
-0.3295766, 0.02707284, -1.995098, 0, 0, 0, 1, 1,
-0.3295413, 0.2104914, -2.794739, 0, 0, 0, 1, 1,
-0.3252783, 0.5397117, -0.9674366, 1, 1, 1, 1, 1,
-0.3244396, -0.2176446, -2.346576, 1, 1, 1, 1, 1,
-0.324383, 1.600474, -1.103418, 1, 1, 1, 1, 1,
-0.3182101, -0.6409969, -0.8588987, 1, 1, 1, 1, 1,
-0.3172818, 0.1589584, -0.6565822, 1, 1, 1, 1, 1,
-0.3155755, -1.092263, -3.145236, 1, 1, 1, 1, 1,
-0.3142901, 1.645211, -1.914885, 1, 1, 1, 1, 1,
-0.3137729, -0.1701868, -0.9194646, 1, 1, 1, 1, 1,
-0.3136089, 1.450441, -0.8467593, 1, 1, 1, 1, 1,
-0.3119845, 1.508794, -0.4695037, 1, 1, 1, 1, 1,
-0.3114131, 1.771931, 0.8912154, 1, 1, 1, 1, 1,
-0.3000529, -0.733728, -2.993262, 1, 1, 1, 1, 1,
-0.2989599, 1.837395, -0.2486682, 1, 1, 1, 1, 1,
-0.2971754, -0.1740882, -2.127752, 1, 1, 1, 1, 1,
-0.2968495, 0.4017325, 0.7001419, 1, 1, 1, 1, 1,
-0.2964034, -0.2753073, -3.063559, 0, 0, 1, 1, 1,
-0.2961715, -1.738788, -3.249325, 1, 0, 0, 1, 1,
-0.2959294, 0.8228706, -0.9535428, 1, 0, 0, 1, 1,
-0.2940927, -0.3647248, -2.24949, 1, 0, 0, 1, 1,
-0.2929361, -0.7282088, -3.327046, 1, 0, 0, 1, 1,
-0.2923323, 0.2028268, -2.714213, 1, 0, 0, 1, 1,
-0.2914786, -0.2147943, -3.119642, 0, 0, 0, 1, 1,
-0.2912009, -0.1725289, -3.98546, 0, 0, 0, 1, 1,
-0.2792335, 0.003885285, -0.5375304, 0, 0, 0, 1, 1,
-0.2780876, -0.4478551, -2.384705, 0, 0, 0, 1, 1,
-0.2711866, -0.09522273, -1.081306, 0, 0, 0, 1, 1,
-0.2705375, 0.4249245, -2.437023, 0, 0, 0, 1, 1,
-0.2693036, -0.7067658, -2.827857, 0, 0, 0, 1, 1,
-0.2668254, 0.01451169, -1.53099, 1, 1, 1, 1, 1,
-0.266072, -1.626417, -4.647077, 1, 1, 1, 1, 1,
-0.2636046, 0.4276003, -1.299335, 1, 1, 1, 1, 1,
-0.2627697, -0.9193348, -3.509715, 1, 1, 1, 1, 1,
-0.2619749, 1.387419, -2.549263, 1, 1, 1, 1, 1,
-0.2603887, 0.3008105, -1.087678, 1, 1, 1, 1, 1,
-0.2593327, 1.842151, -0.3988691, 1, 1, 1, 1, 1,
-0.2562699, 0.3106328, -0.8547531, 1, 1, 1, 1, 1,
-0.2521943, 0.4872687, -0.3601597, 1, 1, 1, 1, 1,
-0.2468386, 0.1776289, 0.376265, 1, 1, 1, 1, 1,
-0.2445993, 0.7033104, -0.02669424, 1, 1, 1, 1, 1,
-0.2424755, -0.8915127, -3.276827, 1, 1, 1, 1, 1,
-0.2397721, 0.8779809, -1.13451, 1, 1, 1, 1, 1,
-0.2341174, -0.07989794, -0.7984532, 1, 1, 1, 1, 1,
-0.2337951, 0.1733363, -1.177018, 1, 1, 1, 1, 1,
-0.2335936, -0.803407, -1.80609, 0, 0, 1, 1, 1,
-0.233347, -0.4442182, -1.697865, 1, 0, 0, 1, 1,
-0.2325302, -0.2801672, -0.202177, 1, 0, 0, 1, 1,
-0.2318106, 0.9830326, -0.1427494, 1, 0, 0, 1, 1,
-0.2315521, 0.9586973, 0.5600114, 1, 0, 0, 1, 1,
-0.2288388, 0.4429903, 0.5312653, 1, 0, 0, 1, 1,
-0.2239088, 1.146718, 0.5812238, 0, 0, 0, 1, 1,
-0.2222297, -0.4848705, -2.816652, 0, 0, 0, 1, 1,
-0.2207973, -0.3928487, -1.404014, 0, 0, 0, 1, 1,
-0.2156392, 0.1127066, 0.5036564, 0, 0, 0, 1, 1,
-0.2145808, 0.5982628, 0.5210338, 0, 0, 0, 1, 1,
-0.2137535, 0.2328955, -0.4518839, 0, 0, 0, 1, 1,
-0.2102867, 1.347352, 1.245941, 0, 0, 0, 1, 1,
-0.2075981, 0.06702437, -0.2726338, 1, 1, 1, 1, 1,
-0.2062339, -1.24697, -4.491406, 1, 1, 1, 1, 1,
-0.2052529, 0.7988022, 0.1832061, 1, 1, 1, 1, 1,
-0.203874, -0.3677659, -3.710673, 1, 1, 1, 1, 1,
-0.2035092, -1.362162, -3.868661, 1, 1, 1, 1, 1,
-0.1988008, -1.360141, -1.857947, 1, 1, 1, 1, 1,
-0.1969593, 1.08504, -0.1131638, 1, 1, 1, 1, 1,
-0.1966565, -1.670742, -2.92904, 1, 1, 1, 1, 1,
-0.1961126, 0.7599086, 0.3105911, 1, 1, 1, 1, 1,
-0.195446, -0.9320991, -3.455066, 1, 1, 1, 1, 1,
-0.1951773, -0.1280036, -2.768057, 1, 1, 1, 1, 1,
-0.1922413, -0.5331546, -3.029169, 1, 1, 1, 1, 1,
-0.1906583, -0.2936029, -2.601329, 1, 1, 1, 1, 1,
-0.1883215, -0.4438196, -3.037965, 1, 1, 1, 1, 1,
-0.1849837, -0.4390189, -2.394156, 1, 1, 1, 1, 1,
-0.1817651, -1.494079, -3.945961, 0, 0, 1, 1, 1,
-0.1776246, 0.6068054, -0.5000268, 1, 0, 0, 1, 1,
-0.1771296, 0.169214, -0.5785716, 1, 0, 0, 1, 1,
-0.1762486, 0.6131824, -0.828601, 1, 0, 0, 1, 1,
-0.1740785, -0.8726417, -1.415466, 1, 0, 0, 1, 1,
-0.1739333, -0.4151734, -3.895134, 1, 0, 0, 1, 1,
-0.1693888, 0.4439082, -1.673159, 0, 0, 0, 1, 1,
-0.169045, 0.03465497, -2.695573, 0, 0, 0, 1, 1,
-0.1642647, -0.87998, -2.749528, 0, 0, 0, 1, 1,
-0.1635176, 0.8993787, 0.03352001, 0, 0, 0, 1, 1,
-0.1447151, -2.165582, -2.654343, 0, 0, 0, 1, 1,
-0.1441376, 0.5246888, 0.5346628, 0, 0, 0, 1, 1,
-0.1421571, 0.6892726, -1.244374, 0, 0, 0, 1, 1,
-0.137201, -0.6382252, -2.169557, 1, 1, 1, 1, 1,
-0.132885, -0.1787203, -4.191394, 1, 1, 1, 1, 1,
-0.1258044, -0.8111695, -4.099062, 1, 1, 1, 1, 1,
-0.1233742, 0.2217062, -1.331394, 1, 1, 1, 1, 1,
-0.1232896, -1.159638, -1.717668, 1, 1, 1, 1, 1,
-0.1197762, 0.6431884, 0.07674211, 1, 1, 1, 1, 1,
-0.1180005, -1.004423, -2.842406, 1, 1, 1, 1, 1,
-0.1135289, 1.929198, -0.5506081, 1, 1, 1, 1, 1,
-0.1135263, 1.808602, 0.5451426, 1, 1, 1, 1, 1,
-0.1108556, -0.7526719, -3.675263, 1, 1, 1, 1, 1,
-0.1068414, -0.8643313, -4.308236, 1, 1, 1, 1, 1,
-0.1044031, 0.3885849, -0.05690532, 1, 1, 1, 1, 1,
-0.1042812, -1.523484, -2.124305, 1, 1, 1, 1, 1,
-0.102742, -0.7160329, -2.721527, 1, 1, 1, 1, 1,
-0.09913211, -1.142814, -4.209612, 1, 1, 1, 1, 1,
-0.09861269, 1.214335, 0.3575428, 0, 0, 1, 1, 1,
-0.09564852, -0.3628243, -2.640724, 1, 0, 0, 1, 1,
-0.09041346, 0.7294801, -1.062932, 1, 0, 0, 1, 1,
-0.08284739, 0.310789, -0.4312476, 1, 0, 0, 1, 1,
-0.0816176, 0.1363879, -0.6768699, 1, 0, 0, 1, 1,
-0.07833643, -0.2357132, -3.784241, 1, 0, 0, 1, 1,
-0.07689743, 1.174366, -1.221058, 0, 0, 0, 1, 1,
-0.07361192, -0.6338196, -1.680432, 0, 0, 0, 1, 1,
-0.0684177, -0.2280874, -3.209236, 0, 0, 0, 1, 1,
-0.06276107, 0.1167073, -0.4753322, 0, 0, 0, 1, 1,
-0.06257118, -0.04571344, -1.750398, 0, 0, 0, 1, 1,
-0.05955696, 0.3329752, 0.1491002, 0, 0, 0, 1, 1,
-0.05475218, 0.1584921, -1.938191, 0, 0, 0, 1, 1,
-0.05388379, 0.9973495, -0.2286882, 1, 1, 1, 1, 1,
-0.05359679, -0.6288351, -1.941004, 1, 1, 1, 1, 1,
-0.04452614, 0.1169666, 1.453271, 1, 1, 1, 1, 1,
-0.04452395, -0.2957788, -3.127247, 1, 1, 1, 1, 1,
-0.0410311, -0.416152, -4.795966, 1, 1, 1, 1, 1,
-0.04052154, 0.1019002, -0.3456494, 1, 1, 1, 1, 1,
-0.03763508, -0.9981113, -4.165304, 1, 1, 1, 1, 1,
-0.03224055, -0.8847139, -3.341298, 1, 1, 1, 1, 1,
-0.02756815, 0.08931327, -0.76941, 1, 1, 1, 1, 1,
-0.02521423, -0.203, -1.758058, 1, 1, 1, 1, 1,
-0.02129812, 2.336419, -0.1676895, 1, 1, 1, 1, 1,
-0.01631095, -0.7959254, -3.511606, 1, 1, 1, 1, 1,
-0.0161132, -1.152672, -2.955854, 1, 1, 1, 1, 1,
-0.01458733, 0.453398, -0.777015, 1, 1, 1, 1, 1,
-0.01123263, -0.7285714, -3.104043, 1, 1, 1, 1, 1,
-0.008924226, -0.08292166, -4.21383, 0, 0, 1, 1, 1,
-0.007251061, -0.8748009, -1.858769, 1, 0, 0, 1, 1,
-0.003700116, 0.2912819, -0.8406091, 1, 0, 0, 1, 1,
-0.002540668, -0.1439209, -3.328853, 1, 0, 0, 1, 1,
0.0009990477, 0.1975374, 1.238858, 1, 0, 0, 1, 1,
0.002236936, -1.868041, 1.725211, 1, 0, 0, 1, 1,
0.005043281, 1.077684, 1.285219, 0, 0, 0, 1, 1,
0.005397627, 0.08962188, 0.729201, 0, 0, 0, 1, 1,
0.006838996, 1.135742, 0.6715786, 0, 0, 0, 1, 1,
0.01074098, -1.042011, 4.034602, 0, 0, 0, 1, 1,
0.01585427, -0.2396157, 4.662557, 0, 0, 0, 1, 1,
0.01615792, -0.007431642, 1.29636, 0, 0, 0, 1, 1,
0.01800864, 1.07886, 0.2366637, 0, 0, 0, 1, 1,
0.01990106, 0.3422544, 0.7571445, 1, 1, 1, 1, 1,
0.02088345, -1.446365, 2.775924, 1, 1, 1, 1, 1,
0.02410803, -2.821503, 5.08105, 1, 1, 1, 1, 1,
0.02686845, -0.1028731, 2.270406, 1, 1, 1, 1, 1,
0.02693648, -0.806676, 3.316916, 1, 1, 1, 1, 1,
0.02732231, 0.4023268, -0.6963054, 1, 1, 1, 1, 1,
0.02737896, 0.937964, -0.2656649, 1, 1, 1, 1, 1,
0.03275605, 0.3440067, -0.8569342, 1, 1, 1, 1, 1,
0.03592097, -1.073413, 2.501276, 1, 1, 1, 1, 1,
0.03616618, -0.3033427, 3.321261, 1, 1, 1, 1, 1,
0.03736696, 0.7545875, 0.9579244, 1, 1, 1, 1, 1,
0.04132783, 0.491154, -0.1000812, 1, 1, 1, 1, 1,
0.04151284, -0.1266719, 3.176784, 1, 1, 1, 1, 1,
0.04167556, -0.3656441, 3.177273, 1, 1, 1, 1, 1,
0.04421915, -1.837561, 1.951365, 1, 1, 1, 1, 1,
0.04958192, -0.6442477, 5.612135, 0, 0, 1, 1, 1,
0.05308639, -1.16486, 4.844375, 1, 0, 0, 1, 1,
0.06385621, 0.678409, 0.09003618, 1, 0, 0, 1, 1,
0.06670625, 1.275899, -1.978949, 1, 0, 0, 1, 1,
0.07041338, -1.528176, 1.501459, 1, 0, 0, 1, 1,
0.07144587, 0.3938156, 0.08019641, 1, 0, 0, 1, 1,
0.07781862, 0.7521228, 1.303205, 0, 0, 0, 1, 1,
0.08083874, -2.036457, 4.451304, 0, 0, 0, 1, 1,
0.08181489, 0.4249726, -0.9877441, 0, 0, 0, 1, 1,
0.08518093, 0.1917964, -0.8263125, 0, 0, 0, 1, 1,
0.08707793, -0.7641149, 4.798724, 0, 0, 0, 1, 1,
0.08815048, 0.5597597, -0.9702054, 0, 0, 0, 1, 1,
0.08823585, 0.03458133, 1.291905, 0, 0, 0, 1, 1,
0.08999143, 1.430714, -0.5315216, 1, 1, 1, 1, 1,
0.0932403, -1.807401, 0.8147706, 1, 1, 1, 1, 1,
0.09533437, 0.7801171, -0.2652777, 1, 1, 1, 1, 1,
0.0971451, 0.4922199, 0.3042683, 1, 1, 1, 1, 1,
0.09815407, -0.6346872, 2.553075, 1, 1, 1, 1, 1,
0.1025925, 0.01596586, 3.010348, 1, 1, 1, 1, 1,
0.1096013, 0.8560594, -0.648484, 1, 1, 1, 1, 1,
0.1103091, -0.887333, 3.474616, 1, 1, 1, 1, 1,
0.1124767, 0.5506483, 1.16936, 1, 1, 1, 1, 1,
0.1126263, -1.903404, 2.790919, 1, 1, 1, 1, 1,
0.1135334, -0.6071125, 2.149894, 1, 1, 1, 1, 1,
0.1137994, -0.5661175, 5.406449, 1, 1, 1, 1, 1,
0.1161596, 0.9515615, 0.7091561, 1, 1, 1, 1, 1,
0.1186261, -1.354255, 2.032513, 1, 1, 1, 1, 1,
0.1236183, 1.708525, -0.2251803, 1, 1, 1, 1, 1,
0.1257273, -0.4277329, 2.38394, 0, 0, 1, 1, 1,
0.1295469, -0.9241241, 4.6812, 1, 0, 0, 1, 1,
0.1309353, -0.4451314, 2.65747, 1, 0, 0, 1, 1,
0.1312307, -0.8331159, 3.177224, 1, 0, 0, 1, 1,
0.1314376, 1.653537, -0.1728145, 1, 0, 0, 1, 1,
0.1383361, 0.1180085, 1.146798, 1, 0, 0, 1, 1,
0.1415969, -0.6982099, 4.08639, 0, 0, 0, 1, 1,
0.147831, 0.5021964, 0.02043686, 0, 0, 0, 1, 1,
0.1497791, 0.3693289, 1.023173, 0, 0, 0, 1, 1,
0.1506898, 0.9558437, -0.6214859, 0, 0, 0, 1, 1,
0.1518567, -0.817669, 2.284979, 0, 0, 0, 1, 1,
0.1565457, -0.8575062, 2.064291, 0, 0, 0, 1, 1,
0.1600984, -0.1046826, 3.554304, 0, 0, 0, 1, 1,
0.1605028, 0.141048, 0.9528083, 1, 1, 1, 1, 1,
0.1615484, 0.3824158, -1.126899, 1, 1, 1, 1, 1,
0.1652215, 1.219663, 1.415072, 1, 1, 1, 1, 1,
0.1665259, -0.1700429, 2.453153, 1, 1, 1, 1, 1,
0.1718596, -1.535671, 2.97, 1, 1, 1, 1, 1,
0.1735589, -0.4428047, 1.787142, 1, 1, 1, 1, 1,
0.1735948, -0.05359045, 0.6957581, 1, 1, 1, 1, 1,
0.1797664, -0.3269687, 3.169827, 1, 1, 1, 1, 1,
0.1800274, -1.156498, 3.012346, 1, 1, 1, 1, 1,
0.1815286, -0.651665, 2.850013, 1, 1, 1, 1, 1,
0.1827735, 0.1713591, 0.9041302, 1, 1, 1, 1, 1,
0.1835994, -0.6528007, 2.840156, 1, 1, 1, 1, 1,
0.1885485, 1.179022, 0.7918789, 1, 1, 1, 1, 1,
0.1901224, -0.4164897, 1.856951, 1, 1, 1, 1, 1,
0.1941372, 1.534929, 0.8805405, 1, 1, 1, 1, 1,
0.1966738, -1.045333, 4.010299, 0, 0, 1, 1, 1,
0.1990987, -0.8053454, 4.05485, 1, 0, 0, 1, 1,
0.2066321, -0.1602238, 0.9206803, 1, 0, 0, 1, 1,
0.2066533, 0.03268041, 1.832806, 1, 0, 0, 1, 1,
0.2077794, -0.923788, 4.057952, 1, 0, 0, 1, 1,
0.2095283, 0.8720174, -0.2059886, 1, 0, 0, 1, 1,
0.2103344, -2.314232, 4.012272, 0, 0, 0, 1, 1,
0.210893, -0.8214278, 2.248315, 0, 0, 0, 1, 1,
0.2112647, 1.911646, -1.151294, 0, 0, 0, 1, 1,
0.2114348, 0.1161139, 1.625796, 0, 0, 0, 1, 1,
0.2117356, 0.810865, 0.8247616, 0, 0, 0, 1, 1,
0.2133225, -0.3231321, 2.721795, 0, 0, 0, 1, 1,
0.2137664, 1.269796, -0.9610221, 0, 0, 0, 1, 1,
0.2156477, 0.08936939, 0.4196001, 1, 1, 1, 1, 1,
0.215797, 0.4064925, 0.6586098, 1, 1, 1, 1, 1,
0.2165671, 1.757617, 0.1442729, 1, 1, 1, 1, 1,
0.2169845, -0.8599875, 3.614676, 1, 1, 1, 1, 1,
0.2226788, 1.298094, 0.6436899, 1, 1, 1, 1, 1,
0.2249185, 0.1735259, 1.463891, 1, 1, 1, 1, 1,
0.2317513, 0.9229503, 0.813463, 1, 1, 1, 1, 1,
0.2321216, -1.364152, 3.259191, 1, 1, 1, 1, 1,
0.2332041, -0.9390589, 2.585853, 1, 1, 1, 1, 1,
0.2338513, 0.2085593, -0.4567979, 1, 1, 1, 1, 1,
0.2355021, -0.2938594, 2.291637, 1, 1, 1, 1, 1,
0.2401111, 0.08714572, 2.614896, 1, 1, 1, 1, 1,
0.2405718, -0.5016118, 2.292753, 1, 1, 1, 1, 1,
0.2434436, -0.1912253, 3.154659, 1, 1, 1, 1, 1,
0.2462396, -2.01465, 5.623344, 1, 1, 1, 1, 1,
0.2542521, -0.06124146, 0.6624367, 0, 0, 1, 1, 1,
0.2565486, -0.8561943, 1.898585, 1, 0, 0, 1, 1,
0.2579515, -0.5400219, 2.262142, 1, 0, 0, 1, 1,
0.2669092, 0.3077657, 0.8060808, 1, 0, 0, 1, 1,
0.2671571, -0.6273442, 3.013588, 1, 0, 0, 1, 1,
0.267919, -1.067969, 3.138236, 1, 0, 0, 1, 1,
0.2686417, 0.9782512, 1.664858, 0, 0, 0, 1, 1,
0.2687837, -0.4412854, 3.608618, 0, 0, 0, 1, 1,
0.2728552, -2.807711, 3.312205, 0, 0, 0, 1, 1,
0.2739382, -1.065402, 2.907111, 0, 0, 0, 1, 1,
0.2755835, -0.4557841, 2.883034, 0, 0, 0, 1, 1,
0.2804998, 1.607287, -0.3981829, 0, 0, 0, 1, 1,
0.2809262, 0.2667215, 1.35621, 0, 0, 0, 1, 1,
0.2841502, -0.02452924, 1.952704, 1, 1, 1, 1, 1,
0.2861989, -0.4561839, 4.489713, 1, 1, 1, 1, 1,
0.2909057, 0.01494769, 0.5615835, 1, 1, 1, 1, 1,
0.3015917, 1.421229, 0.6299008, 1, 1, 1, 1, 1,
0.303309, -0.1049298, 3.507815, 1, 1, 1, 1, 1,
0.3088374, -0.7321075, 3.285258, 1, 1, 1, 1, 1,
0.3145602, -0.1368382, 3.045707, 1, 1, 1, 1, 1,
0.3154344, 1.176485, -0.4829811, 1, 1, 1, 1, 1,
0.3159993, -0.4407586, 3.541543, 1, 1, 1, 1, 1,
0.3165113, 0.4274179, 1.593907, 1, 1, 1, 1, 1,
0.317055, 0.5943801, 0.7249612, 1, 1, 1, 1, 1,
0.3180307, 0.8507568, 1.056894, 1, 1, 1, 1, 1,
0.3269489, 1.256268, -1.181006, 1, 1, 1, 1, 1,
0.3286808, 1.708652, 2.192165, 1, 1, 1, 1, 1,
0.3323577, -0.005991044, 0.7900993, 1, 1, 1, 1, 1,
0.3346797, 0.6494467, 1.915624, 0, 0, 1, 1, 1,
0.341729, -0.6834027, 4.027706, 1, 0, 0, 1, 1,
0.3432508, -0.9437411, 0.8623564, 1, 0, 0, 1, 1,
0.3467287, 0.5166003, 1.075264, 1, 0, 0, 1, 1,
0.348445, -0.06065462, 2.556802, 1, 0, 0, 1, 1,
0.3501883, -0.1546647, 1.66453, 1, 0, 0, 1, 1,
0.3514482, -1.228201, 4.312667, 0, 0, 0, 1, 1,
0.3514843, -1.18567, 2.496664, 0, 0, 0, 1, 1,
0.3522517, 2.080485, -0.4029482, 0, 0, 0, 1, 1,
0.3544156, -1.332114, 2.034032, 0, 0, 0, 1, 1,
0.3578596, -0.6682023, 3.203639, 0, 0, 0, 1, 1,
0.3593843, 1.341554, -0.04277539, 0, 0, 0, 1, 1,
0.360561, -0.2132193, 1.84481, 0, 0, 0, 1, 1,
0.3682838, 0.759995, 0.1492115, 1, 1, 1, 1, 1,
0.370581, -0.8134851, 3.180973, 1, 1, 1, 1, 1,
0.3717133, 0.4194488, 1.736883, 1, 1, 1, 1, 1,
0.3744501, -0.2909907, 1.389044, 1, 1, 1, 1, 1,
0.3823889, 0.5500047, -0.4277785, 1, 1, 1, 1, 1,
0.3828645, 1.774716, -0.7417831, 1, 1, 1, 1, 1,
0.3844094, 0.3246976, 0.3960346, 1, 1, 1, 1, 1,
0.3845249, -0.6223627, 1.750131, 1, 1, 1, 1, 1,
0.3863818, 0.1306022, 2.211472, 1, 1, 1, 1, 1,
0.3880101, 0.9520795, 1.343414, 1, 1, 1, 1, 1,
0.388808, -0.3844773, 2.599662, 1, 1, 1, 1, 1,
0.3933261, 0.965964, 0.0008178277, 1, 1, 1, 1, 1,
0.3950686, 1.334641, -1.11056, 1, 1, 1, 1, 1,
0.4008019, 0.3844649, 3.233901, 1, 1, 1, 1, 1,
0.4010823, -0.08584809, 1.481313, 1, 1, 1, 1, 1,
0.4058456, -0.5848473, 3.23007, 0, 0, 1, 1, 1,
0.4062361, -1.265132, 2.230055, 1, 0, 0, 1, 1,
0.4073008, -0.5688193, 1.270673, 1, 0, 0, 1, 1,
0.4108143, 1.06194, 0.0536944, 1, 0, 0, 1, 1,
0.411973, -0.01504007, -0.3275554, 1, 0, 0, 1, 1,
0.415802, 0.274223, 1.371449, 1, 0, 0, 1, 1,
0.4202962, 0.1075422, 0.8647372, 0, 0, 0, 1, 1,
0.4203685, 0.01089614, 1.35155, 0, 0, 0, 1, 1,
0.4204563, -0.8986628, 1.95491, 0, 0, 0, 1, 1,
0.4238902, -1.715046, 1.763561, 0, 0, 0, 1, 1,
0.4244119, 1.062827, 0.2497782, 0, 0, 0, 1, 1,
0.4251171, -1.672301, 1.661267, 0, 0, 0, 1, 1,
0.4256402, -1.199191, 4.761899, 0, 0, 0, 1, 1,
0.4265034, -0.9449698, 2.596839, 1, 1, 1, 1, 1,
0.4289617, -0.08784177, -0.1137199, 1, 1, 1, 1, 1,
0.4311587, -2.011991, 4.251581, 1, 1, 1, 1, 1,
0.4413886, 0.2012251, 2.168646, 1, 1, 1, 1, 1,
0.4420793, -0.4025373, 2.502984, 1, 1, 1, 1, 1,
0.4432417, -0.055935, 1.067476, 1, 1, 1, 1, 1,
0.4463026, 0.5636979, 0.4971582, 1, 1, 1, 1, 1,
0.4471566, -0.2016998, 3.716771, 1, 1, 1, 1, 1,
0.4478113, -0.8795862, 2.240335, 1, 1, 1, 1, 1,
0.4488103, -0.5098009, 1.514548, 1, 1, 1, 1, 1,
0.4499091, -0.6097139, 1.601463, 1, 1, 1, 1, 1,
0.4504685, 0.02793387, 0.5746643, 1, 1, 1, 1, 1,
0.4509791, 3.041336, -1.227922, 1, 1, 1, 1, 1,
0.4528995, 0.4155181, 1.738089, 1, 1, 1, 1, 1,
0.4539308, 1.595933, -0.4525136, 1, 1, 1, 1, 1,
0.4569758, -2.999564, 0.6445308, 0, 0, 1, 1, 1,
0.4581258, -0.00725559, 2.187362, 1, 0, 0, 1, 1,
0.4630645, 1.920852, 0.6028916, 1, 0, 0, 1, 1,
0.464303, 1.003106, 0.5025836, 1, 0, 0, 1, 1,
0.4663689, -0.7485874, 3.480783, 1, 0, 0, 1, 1,
0.4734739, -1.389423, 2.571299, 1, 0, 0, 1, 1,
0.4743153, 0.688372, 0.08256675, 0, 0, 0, 1, 1,
0.4749899, 1.011382, 2.341017, 0, 0, 0, 1, 1,
0.4765595, 0.1037303, 3.589586, 0, 0, 0, 1, 1,
0.479987, -0.1232605, 1.942534, 0, 0, 0, 1, 1,
0.4812797, -0.3488533, 3.621302, 0, 0, 0, 1, 1,
0.4814377, 0.5586982, -0.3531829, 0, 0, 0, 1, 1,
0.4829224, 0.3785259, 0.6033048, 0, 0, 0, 1, 1,
0.4832048, -1.635064, 1.556603, 1, 1, 1, 1, 1,
0.484257, 1.063661, -0.5974277, 1, 1, 1, 1, 1,
0.4863666, -0.2676307, 1.833313, 1, 1, 1, 1, 1,
0.4867974, 0.4611093, 0.4664812, 1, 1, 1, 1, 1,
0.4943754, 0.3963445, -0.6586514, 1, 1, 1, 1, 1,
0.4944238, 1.219931, 0.6630752, 1, 1, 1, 1, 1,
0.4948374, 1.361135, 0.6735443, 1, 1, 1, 1, 1,
0.5032039, 0.2017074, 1.667603, 1, 1, 1, 1, 1,
0.5081605, -0.1170946, 4.177889, 1, 1, 1, 1, 1,
0.509095, 0.3726865, 1.552255, 1, 1, 1, 1, 1,
0.5149018, -0.8438691, 2.563288, 1, 1, 1, 1, 1,
0.518232, 1.753731, 0.3752618, 1, 1, 1, 1, 1,
0.5182952, 1.03858, 1.232329, 1, 1, 1, 1, 1,
0.5207157, -0.4803061, 1.959171, 1, 1, 1, 1, 1,
0.525106, -1.69886, 2.172213, 1, 1, 1, 1, 1,
0.5275066, -0.5231999, 3.303189, 0, 0, 1, 1, 1,
0.5322487, -0.2711445, 3.415246, 1, 0, 0, 1, 1,
0.5322505, -2.115733, 2.274309, 1, 0, 0, 1, 1,
0.5327532, -1.03823, 1.453768, 1, 0, 0, 1, 1,
0.5357565, -1.486415, 2.341299, 1, 0, 0, 1, 1,
0.5484471, -0.8663711, 4.333655, 1, 0, 0, 1, 1,
0.5486706, 0.6739709, 1.902875, 0, 0, 0, 1, 1,
0.5510713, 0.8509228, -0.0452616, 0, 0, 0, 1, 1,
0.5520046, 0.1120778, 0.04562388, 0, 0, 0, 1, 1,
0.5548851, 0.1747108, 3.177265, 0, 0, 0, 1, 1,
0.5550335, 0.1641213, 1.858745, 0, 0, 0, 1, 1,
0.5573655, -0.3696524, 2.626585, 0, 0, 0, 1, 1,
0.5579494, 0.5984762, 0.8353738, 0, 0, 0, 1, 1,
0.5629611, 0.2202075, 1.983057, 1, 1, 1, 1, 1,
0.56634, 1.771411, 0.6002565, 1, 1, 1, 1, 1,
0.5678293, 0.3099019, 0.4043567, 1, 1, 1, 1, 1,
0.5691411, 1.452022, 1.758931, 1, 1, 1, 1, 1,
0.5717899, 1.990527, 0.1713194, 1, 1, 1, 1, 1,
0.5757415, -0.3222272, 0.2436345, 1, 1, 1, 1, 1,
0.5864646, -1.268143, 3.078016, 1, 1, 1, 1, 1,
0.5898076, 0.4100298, 1.186957, 1, 1, 1, 1, 1,
0.5903735, 2.633904, 1.18405, 1, 1, 1, 1, 1,
0.5906791, 0.3144048, 1.508497, 1, 1, 1, 1, 1,
0.5918043, -0.8634015, 1.9674, 1, 1, 1, 1, 1,
0.5940681, -0.9436558, 0.9145923, 1, 1, 1, 1, 1,
0.5977279, 0.6269003, 1.939434, 1, 1, 1, 1, 1,
0.5990238, 0.07164454, 2.572977, 1, 1, 1, 1, 1,
0.6021721, -0.5390306, 2.741523, 1, 1, 1, 1, 1,
0.6038806, -1.236024, 4.852211, 0, 0, 1, 1, 1,
0.6041554, -0.7582609, 2.961971, 1, 0, 0, 1, 1,
0.6055182, -0.3243314, 2.719697, 1, 0, 0, 1, 1,
0.6057562, -1.294775, 2.202283, 1, 0, 0, 1, 1,
0.6079838, -0.04029834, 0.3494204, 1, 0, 0, 1, 1,
0.6145764, -0.003098259, 2.140414, 1, 0, 0, 1, 1,
0.6162754, 2.633718, -1.575689, 0, 0, 0, 1, 1,
0.6165345, 0.8638494, 1.634188, 0, 0, 0, 1, 1,
0.6229064, 0.03764195, 0.9653372, 0, 0, 0, 1, 1,
0.6238149, -0.03437803, 2.251055, 0, 0, 0, 1, 1,
0.6269032, 2.398485, 0.1558855, 0, 0, 0, 1, 1,
0.6285597, 0.3878634, 0.2789735, 0, 0, 0, 1, 1,
0.6305446, -1.057367, 3.042668, 0, 0, 0, 1, 1,
0.6315097, 0.6726664, 2.116697, 1, 1, 1, 1, 1,
0.6345287, -0.128841, 0.4549351, 1, 1, 1, 1, 1,
0.6399808, 0.4050771, 0.6470677, 1, 1, 1, 1, 1,
0.6518655, 0.73628, 2.500608, 1, 1, 1, 1, 1,
0.6550661, 0.3884312, -0.01494632, 1, 1, 1, 1, 1,
0.6580308, 0.8209186, 1.941905, 1, 1, 1, 1, 1,
0.6605048, 0.537249, 0.671042, 1, 1, 1, 1, 1,
0.6646123, 1.833431, 0.1941874, 1, 1, 1, 1, 1,
0.6681716, 0.7626322, 2.017565, 1, 1, 1, 1, 1,
0.6984427, -1.875942, 4.154413, 1, 1, 1, 1, 1,
0.6987962, 0.1409543, 3.002689, 1, 1, 1, 1, 1,
0.700794, 1.040586, 0.2409781, 1, 1, 1, 1, 1,
0.7082695, -1.158193, 0.9783877, 1, 1, 1, 1, 1,
0.7136141, -0.5954, 2.273422, 1, 1, 1, 1, 1,
0.7174314, -0.7337185, 3.091912, 1, 1, 1, 1, 1,
0.7238542, 1.457477, 0.4643277, 0, 0, 1, 1, 1,
0.7254447, 0.2211505, 2.730562, 1, 0, 0, 1, 1,
0.7278036, -1.081692, 2.046822, 1, 0, 0, 1, 1,
0.7311687, 0.4592603, 0.9778138, 1, 0, 0, 1, 1,
0.7337228, 1.356858, 1.426642, 1, 0, 0, 1, 1,
0.7399726, 0.9033375, 0.2692765, 1, 0, 0, 1, 1,
0.7441712, 0.7655215, 0.8029976, 0, 0, 0, 1, 1,
0.747638, -0.7185866, 3.452892, 0, 0, 0, 1, 1,
0.7478296, 0.9309687, 1.404261, 0, 0, 0, 1, 1,
0.7479302, 0.555665, 2.592025, 0, 0, 0, 1, 1,
0.7523356, -0.6229911, 1.882293, 0, 0, 0, 1, 1,
0.75355, -0.3759506, 1.112446, 0, 0, 0, 1, 1,
0.7541521, 0.7196567, 0.8103142, 0, 0, 0, 1, 1,
0.7557185, 0.1400261, 1.814756, 1, 1, 1, 1, 1,
0.7565468, -1.867846, 3.191986, 1, 1, 1, 1, 1,
0.7614952, 0.5223874, -0.1519095, 1, 1, 1, 1, 1,
0.7683205, 0.4677716, 0.7336219, 1, 1, 1, 1, 1,
0.7727237, 0.8436167, -0.5967389, 1, 1, 1, 1, 1,
0.7730986, 0.09171715, 2.064987, 1, 1, 1, 1, 1,
0.7743995, 0.9132847, -0.4891971, 1, 1, 1, 1, 1,
0.7755288, -1.428004, 3.353733, 1, 1, 1, 1, 1,
0.7772599, 0.7676267, -0.4052761, 1, 1, 1, 1, 1,
0.7796094, -0.7012712, 3.871479, 1, 1, 1, 1, 1,
0.7852954, -0.2010767, 1.070991, 1, 1, 1, 1, 1,
0.7906151, 1.255457, -0.3245633, 1, 1, 1, 1, 1,
0.7923256, -0.8583379, 3.078151, 1, 1, 1, 1, 1,
0.7940406, -0.457952, 0.9567627, 1, 1, 1, 1, 1,
0.7951062, 0.00476973, 2.914714, 1, 1, 1, 1, 1,
0.7970272, 0.8339043, 1.142033, 0, 0, 1, 1, 1,
0.8028115, -0.6263359, 2.809943, 1, 0, 0, 1, 1,
0.8077375, 0.2230402, 0.3956843, 1, 0, 0, 1, 1,
0.8106148, -0.7060474, 2.483422, 1, 0, 0, 1, 1,
0.813421, 0.006943791, 3.311728, 1, 0, 0, 1, 1,
0.8219646, 1.488031, -0.4647265, 1, 0, 0, 1, 1,
0.8228418, -0.3808461, 0.9294514, 0, 0, 0, 1, 1,
0.8275266, 0.6975644, 1.51266, 0, 0, 0, 1, 1,
0.8307815, -0.09450636, 2.215201, 0, 0, 0, 1, 1,
0.8360813, 0.07138439, 2.335386, 0, 0, 0, 1, 1,
0.8399773, 0.1492019, 0.2542624, 0, 0, 0, 1, 1,
0.8401225, 0.21628, 1.340167, 0, 0, 0, 1, 1,
0.8435977, -2.302153, 3.395307, 0, 0, 0, 1, 1,
0.8506049, 1.522068, 1.224614, 1, 1, 1, 1, 1,
0.853984, 0.6511434, 0.7601555, 1, 1, 1, 1, 1,
0.85759, 1.281337, 0.7207422, 1, 1, 1, 1, 1,
0.8784717, -0.3676634, 1.977583, 1, 1, 1, 1, 1,
0.8812542, 0.8823665, 1.425944, 1, 1, 1, 1, 1,
0.8881484, -0.8785051, 2.472315, 1, 1, 1, 1, 1,
0.8885023, 1.103287, 0.04875249, 1, 1, 1, 1, 1,
0.8958381, -1.857452, 1.997397, 1, 1, 1, 1, 1,
0.896825, 0.3056006, -0.06741229, 1, 1, 1, 1, 1,
0.9071139, 1.923633, -0.100238, 1, 1, 1, 1, 1,
0.9075307, 1.231179, 1.259116, 1, 1, 1, 1, 1,
0.9081495, 0.07709447, 0.7087843, 1, 1, 1, 1, 1,
0.9084104, 0.6397336, -0.1693285, 1, 1, 1, 1, 1,
0.9096244, -1.676142, 3.526875, 1, 1, 1, 1, 1,
0.9109952, -2.201228, 3.727119, 1, 1, 1, 1, 1,
0.9118642, 1.155872, 1.958163, 0, 0, 1, 1, 1,
0.9184473, -0.2980148, 2.098161, 1, 0, 0, 1, 1,
0.921517, -1.465641, 2.536616, 1, 0, 0, 1, 1,
0.9278789, 0.2099901, 1.258913, 1, 0, 0, 1, 1,
0.9340948, -0.5201705, 2.449164, 1, 0, 0, 1, 1,
0.9354913, 0.945974, 1.337283, 1, 0, 0, 1, 1,
0.9362313, 0.5201573, 1.046814, 0, 0, 0, 1, 1,
0.936466, 1.139098, 0.1670883, 0, 0, 0, 1, 1,
0.9442588, 0.4187366, 2.210929, 0, 0, 0, 1, 1,
0.9482058, 1.37869, 1.212633, 0, 0, 0, 1, 1,
0.9504065, 0.1949659, 0.2041831, 0, 0, 0, 1, 1,
0.951318, -0.2083095, 0.9570289, 0, 0, 0, 1, 1,
0.9600251, -0.7942159, 2.198292, 0, 0, 0, 1, 1,
0.9618956, 0.9449652, 1.441489, 1, 1, 1, 1, 1,
0.9699246, 0.834033, 0.6087054, 1, 1, 1, 1, 1,
0.9719241, -0.7123483, 1.480795, 1, 1, 1, 1, 1,
0.977746, 1.255136, 0.4707774, 1, 1, 1, 1, 1,
0.9781215, 0.8147944, 2.160295, 1, 1, 1, 1, 1,
0.9800148, 0.1442783, 1.66285, 1, 1, 1, 1, 1,
0.9875491, -0.1862923, 1.720342, 1, 1, 1, 1, 1,
0.9926538, 0.7359951, 0.07819842, 1, 1, 1, 1, 1,
0.996117, -1.299489, 2.017345, 1, 1, 1, 1, 1,
0.9976227, 0.8765416, 0.5558484, 1, 1, 1, 1, 1,
1.00034, -0.9830536, 2.645408, 1, 1, 1, 1, 1,
1.008502, 3.05176, -1.590254, 1, 1, 1, 1, 1,
1.01013, 0.02115056, 2.293622, 1, 1, 1, 1, 1,
1.01027, 0.8705997, 1.769624, 1, 1, 1, 1, 1,
1.013747, -1.326277, 2.550475, 1, 1, 1, 1, 1,
1.022786, -0.4663993, 1.786181, 0, 0, 1, 1, 1,
1.025406, -0.08506355, 2.220706, 1, 0, 0, 1, 1,
1.026936, 0.1714576, 0.7432418, 1, 0, 0, 1, 1,
1.027997, -1.026791, 0.8479557, 1, 0, 0, 1, 1,
1.029014, -0.9802609, 1.361666, 1, 0, 0, 1, 1,
1.034103, 0.5624892, -1.002424, 1, 0, 0, 1, 1,
1.044341, 0.7390995, 0.7069809, 0, 0, 0, 1, 1,
1.046996, 0.5519881, 1.04173, 0, 0, 0, 1, 1,
1.047774, -0.02275435, 2.01513, 0, 0, 0, 1, 1,
1.048345, 0.4185339, 1.37557, 0, 0, 0, 1, 1,
1.058916, -1.291873, 1.702851, 0, 0, 0, 1, 1,
1.059322, -0.1194221, 2.298016, 0, 0, 0, 1, 1,
1.061833, -1.145811, 1.470944, 0, 0, 0, 1, 1,
1.062364, 0.09306353, -0.1797907, 1, 1, 1, 1, 1,
1.064242, -0.8955172, 1.513689, 1, 1, 1, 1, 1,
1.06651, 0.209573, 1.119183, 1, 1, 1, 1, 1,
1.068047, -1.068566, 2.533346, 1, 1, 1, 1, 1,
1.075322, 0.2574389, 0.8725609, 1, 1, 1, 1, 1,
1.078681, -1.50295, 2.112075, 1, 1, 1, 1, 1,
1.082371, -1.099769, 2.296162, 1, 1, 1, 1, 1,
1.082477, 0.3326576, 2.489064, 1, 1, 1, 1, 1,
1.082906, 0.2974196, 2.134446, 1, 1, 1, 1, 1,
1.088729, 0.8023728, 1.305424, 1, 1, 1, 1, 1,
1.095872, -1.145309, 3.04007, 1, 1, 1, 1, 1,
1.100359, -0.640632, 3.163838, 1, 1, 1, 1, 1,
1.100531, 1.965256, -1.641625, 1, 1, 1, 1, 1,
1.108895, 0.07875444, 2.290136, 1, 1, 1, 1, 1,
1.109338, -0.05009554, 0.49331, 1, 1, 1, 1, 1,
1.111802, -0.006842594, 2.197188, 0, 0, 1, 1, 1,
1.113053, 2.331955, 1.33435, 1, 0, 0, 1, 1,
1.126368, -0.1375049, 1.013386, 1, 0, 0, 1, 1,
1.126438, -0.470176, 3.376742, 1, 0, 0, 1, 1,
1.137031, -0.06983704, 0.3025789, 1, 0, 0, 1, 1,
1.14122, -0.04898841, 2.610332, 1, 0, 0, 1, 1,
1.141431, 0.03579954, 1.432307, 0, 0, 0, 1, 1,
1.144102, 0.7375703, 0.5593862, 0, 0, 0, 1, 1,
1.147, -1.367802, 3.021081, 0, 0, 0, 1, 1,
1.153347, -0.08807739, 1.097059, 0, 0, 0, 1, 1,
1.154889, 0.4754577, 1.15907, 0, 0, 0, 1, 1,
1.166023, -1.773702, 1.180728, 0, 0, 0, 1, 1,
1.185535, 0.0722432, 1.605185, 0, 0, 0, 1, 1,
1.188836, -0.2081419, 2.14543, 1, 1, 1, 1, 1,
1.189564, -1.61423, 2.331637, 1, 1, 1, 1, 1,
1.194222, -0.4753994, 3.43657, 1, 1, 1, 1, 1,
1.199076, -0.4370692, 3.053016, 1, 1, 1, 1, 1,
1.200867, 0.1107484, -0.759755, 1, 1, 1, 1, 1,
1.202214, 0.386303, 1.338197, 1, 1, 1, 1, 1,
1.20358, -2.126566, 2.274943, 1, 1, 1, 1, 1,
1.203947, 0.1646092, 1.750005, 1, 1, 1, 1, 1,
1.207301, 0.2740451, 0.4937481, 1, 1, 1, 1, 1,
1.211307, -0.05419347, 1.143056, 1, 1, 1, 1, 1,
1.214985, -0.1529596, 1.78794, 1, 1, 1, 1, 1,
1.217363, 0.4749216, 0.7869107, 1, 1, 1, 1, 1,
1.217643, -0.1918069, 0.3389505, 1, 1, 1, 1, 1,
1.240964, 0.2272467, 3.076017, 1, 1, 1, 1, 1,
1.2474, 0.5262018, 1.041342, 1, 1, 1, 1, 1,
1.257056, -1.168678, 2.093389, 0, 0, 1, 1, 1,
1.268505, -0.9210891, 0.964863, 1, 0, 0, 1, 1,
1.273503, 0.1296038, 1.965151, 1, 0, 0, 1, 1,
1.277884, 0.3587175, 2.103407, 1, 0, 0, 1, 1,
1.283072, -0.3169466, 1.168005, 1, 0, 0, 1, 1,
1.285102, -0.7700529, 1.743119, 1, 0, 0, 1, 1,
1.288496, 0.02733763, 0.8934821, 0, 0, 0, 1, 1,
1.289143, -0.219217, 2.253862, 0, 0, 0, 1, 1,
1.29263, -0.2256296, 0.793773, 0, 0, 0, 1, 1,
1.299739, -0.4498468, 2.151909, 0, 0, 0, 1, 1,
1.309966, 0.622573, 1.07682, 0, 0, 0, 1, 1,
1.314086, 1.002629, 0.2782243, 0, 0, 0, 1, 1,
1.335782, 0.1997554, 1.293214, 0, 0, 0, 1, 1,
1.339943, 2.369617, -1.391127, 1, 1, 1, 1, 1,
1.365252, 0.09531191, 3.509941, 1, 1, 1, 1, 1,
1.366352, -1.688657, 2.575157, 1, 1, 1, 1, 1,
1.36774, 0.3430964, 1.142962, 1, 1, 1, 1, 1,
1.370174, 0.9791294, 1.983899, 1, 1, 1, 1, 1,
1.375722, 1.755283, 1.638107, 1, 1, 1, 1, 1,
1.382438, 1.046077, 1.657424, 1, 1, 1, 1, 1,
1.383082, -0.2706259, 0.08658352, 1, 1, 1, 1, 1,
1.391391, 0.9278988, 1.562453, 1, 1, 1, 1, 1,
1.400984, 1.21252, 2.923322, 1, 1, 1, 1, 1,
1.402232, -1.298054, 1.374297, 1, 1, 1, 1, 1,
1.402534, 1.220223, 2.971153, 1, 1, 1, 1, 1,
1.40663, 0.244727, 1.502162, 1, 1, 1, 1, 1,
1.407668, 1.094331, 1.406846, 1, 1, 1, 1, 1,
1.411379, -0.940811, 3.159065, 1, 1, 1, 1, 1,
1.426689, -0.8641384, 2.63558, 0, 0, 1, 1, 1,
1.430377, -0.4488775, 1.373121, 1, 0, 0, 1, 1,
1.440987, -1.200121, 1.397818, 1, 0, 0, 1, 1,
1.444082, -0.07432098, 1.440351, 1, 0, 0, 1, 1,
1.453904, -2.191552, 2.716647, 1, 0, 0, 1, 1,
1.462871, -0.4825552, 1.077066, 1, 0, 0, 1, 1,
1.467701, -0.293784, 1.475723, 0, 0, 0, 1, 1,
1.468364, 1.782997, 2.073035, 0, 0, 0, 1, 1,
1.471953, 0.3813385, 1.050998, 0, 0, 0, 1, 1,
1.472261, -2.546448, 2.738082, 0, 0, 0, 1, 1,
1.474484, -1.507622, 1.68022, 0, 0, 0, 1, 1,
1.489318, 0.1458102, 0.2126384, 0, 0, 0, 1, 1,
1.493723, -1.162102, 1.091848, 0, 0, 0, 1, 1,
1.494663, 0.4464304, 2.100742, 1, 1, 1, 1, 1,
1.495117, -0.1884317, 2.43946, 1, 1, 1, 1, 1,
1.49587, -0.242033, 0.3650025, 1, 1, 1, 1, 1,
1.498189, -1.029899, 0.6195399, 1, 1, 1, 1, 1,
1.502715, -1.024322, 1.461402, 1, 1, 1, 1, 1,
1.50289, -0.1972531, 1.817384, 1, 1, 1, 1, 1,
1.511191, 0.8622623, 1.384787, 1, 1, 1, 1, 1,
1.5155, -0.4002262, 2.965654, 1, 1, 1, 1, 1,
1.516087, -0.2182332, 3.112612, 1, 1, 1, 1, 1,
1.517751, 0.3229388, 2.567794, 1, 1, 1, 1, 1,
1.521201, 0.4581299, 2.357873, 1, 1, 1, 1, 1,
1.521894, -1.44279, 1.216707, 1, 1, 1, 1, 1,
1.529384, -1.329481, 2.182143, 1, 1, 1, 1, 1,
1.542981, 1.166096, 1.105566, 1, 1, 1, 1, 1,
1.560919, -2.135821, 2.543186, 1, 1, 1, 1, 1,
1.602031, -0.8774225, 2.20302, 0, 0, 1, 1, 1,
1.605133, -0.1295944, 0.7041965, 1, 0, 0, 1, 1,
1.607724, -0.8612387, 2.77609, 1, 0, 0, 1, 1,
1.608712, -0.393589, -0.7973902, 1, 0, 0, 1, 1,
1.615614, -1.518227, 2.259433, 1, 0, 0, 1, 1,
1.623898, -0.2985523, 0.2329313, 1, 0, 0, 1, 1,
1.624349, 0.4393042, 1.263098, 0, 0, 0, 1, 1,
1.654497, -0.4102429, 2.16361, 0, 0, 0, 1, 1,
1.655612, -0.5950126, 3.02001, 0, 0, 0, 1, 1,
1.659696, 0.004285241, 3.20406, 0, 0, 0, 1, 1,
1.695092, -0.4570985, 2.210991, 0, 0, 0, 1, 1,
1.732415, -2.357303, 0.5952216, 0, 0, 0, 1, 1,
1.754979, -0.7597015, 2.02087, 0, 0, 0, 1, 1,
1.756713, -0.1238813, 1.945289, 1, 1, 1, 1, 1,
1.756788, 0.5748256, -0.1461578, 1, 1, 1, 1, 1,
1.786394, -0.1004226, 2.401914, 1, 1, 1, 1, 1,
1.797226, -0.4032519, 0.8561532, 1, 1, 1, 1, 1,
1.797914, -1.086413, 4.06372, 1, 1, 1, 1, 1,
1.804292, -0.2206453, 0.125249, 1, 1, 1, 1, 1,
1.812041, -0.5726173, 2.615929, 1, 1, 1, 1, 1,
1.819118, 1.666695, 1.396309, 1, 1, 1, 1, 1,
1.855507, 1.335648, 1.153014, 1, 1, 1, 1, 1,
1.877031, -0.08543147, 3.467702, 1, 1, 1, 1, 1,
1.904571, -0.9014823, 2.056391, 1, 1, 1, 1, 1,
1.912879, -0.3858486, 2.510195, 1, 1, 1, 1, 1,
1.925969, 0.1680999, 2.058441, 1, 1, 1, 1, 1,
1.944984, -2.669962, 1.151283, 1, 1, 1, 1, 1,
1.981594, -1.902001, 1.564779, 1, 1, 1, 1, 1,
2.019482, 1.389083, 0.128251, 0, 0, 1, 1, 1,
2.028617, -0.09672097, 2.217582, 1, 0, 0, 1, 1,
2.056615, -1.068801, 4.029043, 1, 0, 0, 1, 1,
2.080133, 0.2400442, 1.056113, 1, 0, 0, 1, 1,
2.131591, -0.00589772, 2.422549, 1, 0, 0, 1, 1,
2.138725, -0.5733181, 3.037201, 1, 0, 0, 1, 1,
2.143712, -0.04094317, 0.5592156, 0, 0, 0, 1, 1,
2.203763, -0.9917622, 1.184048, 0, 0, 0, 1, 1,
2.213837, 0.8781277, -0.6759847, 0, 0, 0, 1, 1,
2.250421, -0.9323497, 3.224929, 0, 0, 0, 1, 1,
2.254783, 1.387395, 0.9670447, 0, 0, 0, 1, 1,
2.299582, 0.8313795, 0.4563478, 0, 0, 0, 1, 1,
2.302517, -1.425108, 0.169608, 0, 0, 0, 1, 1,
2.484379, -1.388889, 1.163018, 1, 1, 1, 1, 1,
2.555321, -0.341471, 0.3058576, 1, 1, 1, 1, 1,
2.649035, 1.419345, 0.8928485, 1, 1, 1, 1, 1,
2.675672, -0.9144323, 1.35792, 1, 1, 1, 1, 1,
2.697747, -0.6340471, 2.812912, 1, 1, 1, 1, 1,
2.781455, -0.2512341, 1.694262, 1, 1, 1, 1, 1,
2.899741, -1.236971, 3.017904, 1, 1, 1, 1, 1
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
var radius = 9.174888;
var distance = 32.2264;
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
mvMatrix.translate( -0.07435989, -0.005069971, -0.4136894 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.2264);
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