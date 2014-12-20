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
-3.162454, 0.6375147, -3.230538, 1, 0, 0, 1,
-3.1403, -0.1945934, -2.080987, 1, 0.007843138, 0, 1,
-3.086603, -0.3167479, -2.168694, 1, 0.01176471, 0, 1,
-3.030445, 0.4290784, -0.8934178, 1, 0.01960784, 0, 1,
-2.766172, -0.1101638, -0.7548174, 1, 0.02352941, 0, 1,
-2.6443, -0.4663224, -0.9868834, 1, 0.03137255, 0, 1,
-2.576895, 0.004637042, -0.4483862, 1, 0.03529412, 0, 1,
-2.496238, 0.2205625, 0.265764, 1, 0.04313726, 0, 1,
-2.405588, 1.116455, -2.481267, 1, 0.04705882, 0, 1,
-2.293319, -0.7764255, -1.547521, 1, 0.05490196, 0, 1,
-2.254883, -0.6240646, -0.7610424, 1, 0.05882353, 0, 1,
-2.253878, 0.2641265, -0.5106897, 1, 0.06666667, 0, 1,
-2.215556, 1.165835, -2.712216, 1, 0.07058824, 0, 1,
-2.194168, -0.2530303, -0.1066496, 1, 0.07843138, 0, 1,
-2.16683, -0.7179097, -1.1741, 1, 0.08235294, 0, 1,
-2.161727, -1.186305, -2.669316, 1, 0.09019608, 0, 1,
-2.131349, 0.5474614, -0.06607945, 1, 0.09411765, 0, 1,
-2.088227, -1.751361, -0.8831189, 1, 0.1019608, 0, 1,
-2.087644, -1.550208, -2.428597, 1, 0.1098039, 0, 1,
-2.082696, -1.119155, -0.5623001, 1, 0.1137255, 0, 1,
-2.077579, -2.262193, -3.599721, 1, 0.1215686, 0, 1,
-2.041071, 0.02388577, -1.137926, 1, 0.1254902, 0, 1,
-2.021099, -1.236921, -2.724484, 1, 0.1333333, 0, 1,
-2.004765, 0.7027435, -1.736288, 1, 0.1372549, 0, 1,
-2.003819, -0.1643398, -1.118875, 1, 0.145098, 0, 1,
-1.994829, 0.5403935, -1.535058, 1, 0.1490196, 0, 1,
-1.990218, -0.7742745, -1.497721, 1, 0.1568628, 0, 1,
-1.93165, 0.5819519, -1.683964, 1, 0.1607843, 0, 1,
-1.929686, -0.4794117, -3.940517, 1, 0.1686275, 0, 1,
-1.910702, 1.140287, -1.212659, 1, 0.172549, 0, 1,
-1.897745, 1.82273, -0.1953198, 1, 0.1803922, 0, 1,
-1.875025, -0.7399607, -2.269705, 1, 0.1843137, 0, 1,
-1.866278, -1.234283, -0.9863119, 1, 0.1921569, 0, 1,
-1.841449, -1.069986, -2.846142, 1, 0.1960784, 0, 1,
-1.836494, 0.3601392, -0.8261953, 1, 0.2039216, 0, 1,
-1.834581, 2.334845, -0.07987052, 1, 0.2117647, 0, 1,
-1.831745, 1.794754, -2.265657, 1, 0.2156863, 0, 1,
-1.83147, -0.2146329, -1.961088, 1, 0.2235294, 0, 1,
-1.830322, -0.1577934, -0.8608184, 1, 0.227451, 0, 1,
-1.820503, -0.1343518, -2.078609, 1, 0.2352941, 0, 1,
-1.784184, 0.6349011, -2.238951, 1, 0.2392157, 0, 1,
-1.777867, 0.1344223, -1.092059, 1, 0.2470588, 0, 1,
-1.755995, -0.9163793, -3.808245, 1, 0.2509804, 0, 1,
-1.730089, 0.1518749, -0.7285713, 1, 0.2588235, 0, 1,
-1.716662, -0.7860476, -2.259865, 1, 0.2627451, 0, 1,
-1.70301, -2.71871, -2.105521, 1, 0.2705882, 0, 1,
-1.695399, 0.8052023, 0.3674397, 1, 0.2745098, 0, 1,
-1.68567, -1.211064, -2.186665, 1, 0.282353, 0, 1,
-1.665735, -0.8973607, -2.378367, 1, 0.2862745, 0, 1,
-1.601711, -0.5294139, -2.809366, 1, 0.2941177, 0, 1,
-1.595219, 0.4631551, -1.855843, 1, 0.3019608, 0, 1,
-1.56024, 0.6481956, -1.844035, 1, 0.3058824, 0, 1,
-1.514366, -0.9052964, 0.1798833, 1, 0.3137255, 0, 1,
-1.509931, 0.2743126, -1.334029, 1, 0.3176471, 0, 1,
-1.507176, 1.453503, -0.5217221, 1, 0.3254902, 0, 1,
-1.486174, -0.6617171, -0.9923909, 1, 0.3294118, 0, 1,
-1.467469, 0.4963526, -1.337424, 1, 0.3372549, 0, 1,
-1.45947, 0.8584076, -2.422792, 1, 0.3411765, 0, 1,
-1.447647, 0.2779054, -1.818064, 1, 0.3490196, 0, 1,
-1.446892, 0.733346, 0.4707555, 1, 0.3529412, 0, 1,
-1.44355, 0.7284759, -0.7841548, 1, 0.3607843, 0, 1,
-1.443215, -1.043846, -2.280134, 1, 0.3647059, 0, 1,
-1.437432, 0.02880117, -0.5057286, 1, 0.372549, 0, 1,
-1.434789, -0.4864802, -4.390864, 1, 0.3764706, 0, 1,
-1.428044, -0.4339759, -2.433334, 1, 0.3843137, 0, 1,
-1.406464, 1.331828, -0.5479791, 1, 0.3882353, 0, 1,
-1.401997, -0.8787147, -1.930041, 1, 0.3960784, 0, 1,
-1.400002, -2.093022, -2.698083, 1, 0.4039216, 0, 1,
-1.39888, 1.131129, -1.795674, 1, 0.4078431, 0, 1,
-1.395081, -1.178928, -1.921002, 1, 0.4156863, 0, 1,
-1.394699, 0.223639, -1.636064, 1, 0.4196078, 0, 1,
-1.383824, 0.07445559, -4.703801, 1, 0.427451, 0, 1,
-1.383352, 2.112781, -0.6634942, 1, 0.4313726, 0, 1,
-1.381736, -1.126342, -2.035237, 1, 0.4392157, 0, 1,
-1.365333, 1.32691, -2.574051, 1, 0.4431373, 0, 1,
-1.350179, 0.1973435, -0.07957984, 1, 0.4509804, 0, 1,
-1.349829, 0.02434258, -2.132811, 1, 0.454902, 0, 1,
-1.340861, 0.6461723, -2.800385, 1, 0.4627451, 0, 1,
-1.330307, 0.8217676, -0.6711841, 1, 0.4666667, 0, 1,
-1.330196, -1.302682, -2.128086, 1, 0.4745098, 0, 1,
-1.325636, 0.04040631, -1.093038, 1, 0.4784314, 0, 1,
-1.325146, -1.326801, -2.915884, 1, 0.4862745, 0, 1,
-1.323594, 0.6259647, -0.841567, 1, 0.4901961, 0, 1,
-1.32119, -1.017888, -1.977822, 1, 0.4980392, 0, 1,
-1.305279, 0.03285159, 0.325949, 1, 0.5058824, 0, 1,
-1.302969, -1.770726, -2.780285, 1, 0.509804, 0, 1,
-1.290022, 0.6357678, -3.235782, 1, 0.5176471, 0, 1,
-1.289617, 0.01660531, -2.630477, 1, 0.5215687, 0, 1,
-1.288631, 0.3408587, -1.208882, 1, 0.5294118, 0, 1,
-1.278445, -0.1343343, -1.576834, 1, 0.5333334, 0, 1,
-1.275212, 0.252208, -1.585384, 1, 0.5411765, 0, 1,
-1.271916, -0.7513194, -2.389061, 1, 0.5450981, 0, 1,
-1.271441, 0.4989222, -0.8802292, 1, 0.5529412, 0, 1,
-1.271399, -2.267184, -1.172048, 1, 0.5568628, 0, 1,
-1.251296, 0.5573454, -2.740422, 1, 0.5647059, 0, 1,
-1.249404, -0.3265706, -1.587773, 1, 0.5686275, 0, 1,
-1.246138, -1.272047, -4.692898, 1, 0.5764706, 0, 1,
-1.236709, 0.9526702, -0.5833469, 1, 0.5803922, 0, 1,
-1.233722, -0.9048947, -2.62569, 1, 0.5882353, 0, 1,
-1.232586, 0.2110605, -0.758011, 1, 0.5921569, 0, 1,
-1.227726, 0.9519386, -0.9414288, 1, 0.6, 0, 1,
-1.224103, 0.9501231, -0.1705573, 1, 0.6078432, 0, 1,
-1.218876, -0.8091536, -3.620084, 1, 0.6117647, 0, 1,
-1.216612, -0.4115455, -1.898418, 1, 0.6196079, 0, 1,
-1.216341, 0.4890761, -1.286139, 1, 0.6235294, 0, 1,
-1.214004, 1.206752, 1.537009, 1, 0.6313726, 0, 1,
-1.207345, 0.5481352, -0.4524176, 1, 0.6352941, 0, 1,
-1.206377, -0.1082463, -3.439817, 1, 0.6431373, 0, 1,
-1.201531, 0.3210456, -1.026952, 1, 0.6470588, 0, 1,
-1.201, 0.8688152, -0.5857763, 1, 0.654902, 0, 1,
-1.200781, -0.2795903, -3.362857, 1, 0.6588235, 0, 1,
-1.196497, 0.9301712, -1.379455, 1, 0.6666667, 0, 1,
-1.193615, -0.1125627, -1.262374, 1, 0.6705883, 0, 1,
-1.193152, 0.545933, -0.7298862, 1, 0.6784314, 0, 1,
-1.175803, 0.5388392, -0.8874573, 1, 0.682353, 0, 1,
-1.173114, 1.569456, -1.677217, 1, 0.6901961, 0, 1,
-1.171137, 1.021481, 0.7203977, 1, 0.6941177, 0, 1,
-1.170019, 0.3465712, -1.275957, 1, 0.7019608, 0, 1,
-1.166983, 0.5021472, -2.159025, 1, 0.7098039, 0, 1,
-1.164836, 0.367728, 0.03796922, 1, 0.7137255, 0, 1,
-1.159913, 0.01046759, -1.211218, 1, 0.7215686, 0, 1,
-1.14461, -0.5634722, -1.725937, 1, 0.7254902, 0, 1,
-1.132261, 0.9477187, -1.348093, 1, 0.7333333, 0, 1,
-1.13135, 0.8220246, -0.127847, 1, 0.7372549, 0, 1,
-1.128531, -0.3311879, -1.653175, 1, 0.7450981, 0, 1,
-1.127425, -0.9210117, -1.32995, 1, 0.7490196, 0, 1,
-1.119251, 0.1673222, -1.376834, 1, 0.7568628, 0, 1,
-1.118275, 0.3354466, -2.137335, 1, 0.7607843, 0, 1,
-1.117797, 2.386523, -1.655225, 1, 0.7686275, 0, 1,
-1.105686, -2.408795, -2.093292, 1, 0.772549, 0, 1,
-1.09907, -1.876722, -3.714529, 1, 0.7803922, 0, 1,
-1.098881, -2.004969, -3.776468, 1, 0.7843137, 0, 1,
-1.097053, -0.2062314, -2.858281, 1, 0.7921569, 0, 1,
-1.094917, -0.9794927, -0.9344389, 1, 0.7960784, 0, 1,
-1.089453, 2.347747, 0.1797936, 1, 0.8039216, 0, 1,
-1.088895, 0.5852993, -0.04262648, 1, 0.8117647, 0, 1,
-1.071581, -0.2022864, -0.9292922, 1, 0.8156863, 0, 1,
-1.071193, 0.1882311, -0.3514709, 1, 0.8235294, 0, 1,
-1.065591, -0.6741216, -2.070053, 1, 0.827451, 0, 1,
-1.065522, 0.4018669, -0.9416293, 1, 0.8352941, 0, 1,
-1.065333, -0.8415004, -1.891603, 1, 0.8392157, 0, 1,
-1.064975, -1.277127, -2.1419, 1, 0.8470588, 0, 1,
-1.059105, 0.4538302, -2.381058, 1, 0.8509804, 0, 1,
-1.056393, -2.400545, -2.832082, 1, 0.8588235, 0, 1,
-1.055315, 0.01915796, -3.591576, 1, 0.8627451, 0, 1,
-1.045168, 2.146315, -0.6428876, 1, 0.8705882, 0, 1,
-1.044847, -1.874547, -2.616082, 1, 0.8745098, 0, 1,
-1.044291, 1.431509, -1.80646, 1, 0.8823529, 0, 1,
-1.043144, 0.2388496, -1.766181, 1, 0.8862745, 0, 1,
-1.042469, -0.1876158, -1.524682, 1, 0.8941177, 0, 1,
-1.03142, -0.2278896, -1.371971, 1, 0.8980392, 0, 1,
-1.03139, -1.098778, -1.436693, 1, 0.9058824, 0, 1,
-1.02938, 1.079701, -0.3818696, 1, 0.9137255, 0, 1,
-1.02206, -0.6499442, -3.167831, 1, 0.9176471, 0, 1,
-1.013768, -0.1222652, -3.462071, 1, 0.9254902, 0, 1,
-1.012303, 0.7270367, -1.726522, 1, 0.9294118, 0, 1,
-1.008971, 0.7162402, 0.05099716, 1, 0.9372549, 0, 1,
-1.006032, -0.8431967, -3.331328, 1, 0.9411765, 0, 1,
-1.004712, 1.223402, -0.116638, 1, 0.9490196, 0, 1,
-1.004551, 0.8855466, -2.661432, 1, 0.9529412, 0, 1,
-1.003459, -0.6474526, -2.97056, 1, 0.9607843, 0, 1,
-0.9983006, -0.1451672, -1.162224, 1, 0.9647059, 0, 1,
-0.9920356, -0.2558625, -2.870194, 1, 0.972549, 0, 1,
-0.9872731, -0.4599356, -0.9205337, 1, 0.9764706, 0, 1,
-0.9796016, 1.218037, -1.497807, 1, 0.9843137, 0, 1,
-0.9785545, -0.07364394, -1.125946, 1, 0.9882353, 0, 1,
-0.9764749, -0.5723844, -0.6237971, 1, 0.9960784, 0, 1,
-0.9742641, -0.2953144, -2.255395, 0.9960784, 1, 0, 1,
-0.96865, -0.3837618, -0.7147175, 0.9921569, 1, 0, 1,
-0.9658325, 0.9408795, -1.191625, 0.9843137, 1, 0, 1,
-0.9597251, 2.34481, -1.717175, 0.9803922, 1, 0, 1,
-0.9532704, 0.3270116, -1.235334, 0.972549, 1, 0, 1,
-0.9375651, -0.3227687, -1.970843, 0.9686275, 1, 0, 1,
-0.9288191, -0.1530707, -1.80315, 0.9607843, 1, 0, 1,
-0.9256017, -1.556933, -2.662801, 0.9568627, 1, 0, 1,
-0.9187932, -0.4234272, -2.207632, 0.9490196, 1, 0, 1,
-0.9181215, -0.8299616, -2.596144, 0.945098, 1, 0, 1,
-0.9164569, 1.821951, -0.1273109, 0.9372549, 1, 0, 1,
-0.9056385, -0.09460419, -0.7441086, 0.9333333, 1, 0, 1,
-0.9020123, 0.7846249, -1.262991, 0.9254902, 1, 0, 1,
-0.9012066, 0.1539618, -2.844805, 0.9215686, 1, 0, 1,
-0.9010935, 1.067818, -0.6006371, 0.9137255, 1, 0, 1,
-0.89044, -0.2278723, -1.340959, 0.9098039, 1, 0, 1,
-0.8877801, -0.9997026, -3.011846, 0.9019608, 1, 0, 1,
-0.8877249, 0.41593, -2.609394, 0.8941177, 1, 0, 1,
-0.8861061, -0.2298108, -4.594146, 0.8901961, 1, 0, 1,
-0.8799827, -0.366177, -1.459906, 0.8823529, 1, 0, 1,
-0.8795874, 0.5820274, -0.454738, 0.8784314, 1, 0, 1,
-0.8737959, -1.420551, -2.805912, 0.8705882, 1, 0, 1,
-0.8713982, -0.1977298, -3.136452, 0.8666667, 1, 0, 1,
-0.8656414, -0.3053416, -2.632744, 0.8588235, 1, 0, 1,
-0.8644206, -1.457662, -1.626829, 0.854902, 1, 0, 1,
-0.8529303, -0.6939201, -2.863868, 0.8470588, 1, 0, 1,
-0.8473105, 0.4963495, -1.419115, 0.8431373, 1, 0, 1,
-0.8464725, -0.07343294, -0.7119537, 0.8352941, 1, 0, 1,
-0.8409247, 1.571618, 0.8496456, 0.8313726, 1, 0, 1,
-0.8398993, -1.085066, -3.993582, 0.8235294, 1, 0, 1,
-0.83477, 0.002890607, -3.701381, 0.8196079, 1, 0, 1,
-0.8344266, 0.1932293, -0.6523399, 0.8117647, 1, 0, 1,
-0.8286348, 0.1496747, -1.659194, 0.8078431, 1, 0, 1,
-0.8279538, -0.382139, -1.336941, 0.8, 1, 0, 1,
-0.8258852, -1.647117, -4.121284, 0.7921569, 1, 0, 1,
-0.822256, 0.5961226, 0.08889632, 0.7882353, 1, 0, 1,
-0.8193263, -0.7017105, -1.376095, 0.7803922, 1, 0, 1,
-0.8175913, 0.6122579, -1.479524, 0.7764706, 1, 0, 1,
-0.8122446, -1.65038, -1.748933, 0.7686275, 1, 0, 1,
-0.8081152, 0.08529025, -0.7725497, 0.7647059, 1, 0, 1,
-0.7976645, 0.05826824, -3.318755, 0.7568628, 1, 0, 1,
-0.7952364, 1.35156, 0.7919841, 0.7529412, 1, 0, 1,
-0.7908903, 0.9240107, -1.951856, 0.7450981, 1, 0, 1,
-0.7875491, -0.1935472, -0.01676014, 0.7411765, 1, 0, 1,
-0.7820693, 0.6226087, 0.1241674, 0.7333333, 1, 0, 1,
-0.7770252, -0.7820635, -3.303201, 0.7294118, 1, 0, 1,
-0.776513, 0.01961789, -0.9610296, 0.7215686, 1, 0, 1,
-0.7722017, -0.823108, -1.869533, 0.7176471, 1, 0, 1,
-0.7680159, -0.04680318, -0.8735262, 0.7098039, 1, 0, 1,
-0.7667704, 0.9205059, 0.4419762, 0.7058824, 1, 0, 1,
-0.7615205, 1.601615, -1.396388, 0.6980392, 1, 0, 1,
-0.7611268, 1.012319, 1.388281, 0.6901961, 1, 0, 1,
-0.7582272, -0.02501829, -1.568498, 0.6862745, 1, 0, 1,
-0.7564862, -0.5815381, -1.656022, 0.6784314, 1, 0, 1,
-0.7550302, -0.2561655, -2.308282, 0.6745098, 1, 0, 1,
-0.7487621, -0.4233654, -0.356783, 0.6666667, 1, 0, 1,
-0.7455311, -1.830823, -0.9499842, 0.6627451, 1, 0, 1,
-0.7431296, -0.4846187, -1.922814, 0.654902, 1, 0, 1,
-0.7359121, -0.01816078, -1.023697, 0.6509804, 1, 0, 1,
-0.7338272, 0.2345535, -2.41942, 0.6431373, 1, 0, 1,
-0.7329262, -0.2886727, -2.006507, 0.6392157, 1, 0, 1,
-0.7318103, 1.571997, 1.548707, 0.6313726, 1, 0, 1,
-0.7244326, -0.6413375, -2.995706, 0.627451, 1, 0, 1,
-0.7241457, 0.521156, -1.095, 0.6196079, 1, 0, 1,
-0.7182943, -1.045641, -1.321518, 0.6156863, 1, 0, 1,
-0.7171488, -0.3362262, -1.45927, 0.6078432, 1, 0, 1,
-0.716287, -0.3736808, -0.8575581, 0.6039216, 1, 0, 1,
-0.7142894, 0.9473791, -0.2763816, 0.5960785, 1, 0, 1,
-0.7142656, -0.9631279, -2.911593, 0.5882353, 1, 0, 1,
-0.7116026, 0.498509, -0.5614784, 0.5843138, 1, 0, 1,
-0.7096299, -0.5891649, -2.481012, 0.5764706, 1, 0, 1,
-0.7084094, 0.3898846, -1.295169, 0.572549, 1, 0, 1,
-0.7081056, -0.4123602, -2.23532, 0.5647059, 1, 0, 1,
-0.707718, 0.4908431, -0.7859594, 0.5607843, 1, 0, 1,
-0.7062417, -0.4686462, -2.194055, 0.5529412, 1, 0, 1,
-0.7051873, -1.501158, -2.043418, 0.5490196, 1, 0, 1,
-0.7039754, -2.10662, -2.585817, 0.5411765, 1, 0, 1,
-0.7000734, 0.9129623, -1.588748, 0.5372549, 1, 0, 1,
-0.6973457, 0.02091666, -2.226275, 0.5294118, 1, 0, 1,
-0.697004, -0.8763955, -2.492482, 0.5254902, 1, 0, 1,
-0.6956414, -1.479282, -1.952985, 0.5176471, 1, 0, 1,
-0.6881032, 1.767213, -1.008667, 0.5137255, 1, 0, 1,
-0.6879166, -1.967555, -2.618477, 0.5058824, 1, 0, 1,
-0.6740986, -0.5053567, -1.608506, 0.5019608, 1, 0, 1,
-0.6732816, 0.3580767, -2.018394, 0.4941176, 1, 0, 1,
-0.6690625, -1.096943, -2.61362, 0.4862745, 1, 0, 1,
-0.6672058, 0.8411769, 0.5781175, 0.4823529, 1, 0, 1,
-0.6616327, -0.4832713, -0.7991083, 0.4745098, 1, 0, 1,
-0.6557689, -1.079056, -1.444602, 0.4705882, 1, 0, 1,
-0.6551335, 0.9019182, 0.4124621, 0.4627451, 1, 0, 1,
-0.6529756, 0.5705489, 0.7506293, 0.4588235, 1, 0, 1,
-0.6521215, -0.256938, 0.3261504, 0.4509804, 1, 0, 1,
-0.6489463, 0.2421081, -1.508509, 0.4470588, 1, 0, 1,
-0.6477737, 0.4990673, 0.5544814, 0.4392157, 1, 0, 1,
-0.647654, -0.4969421, -3.438775, 0.4352941, 1, 0, 1,
-0.6474898, -0.145016, -0.6469637, 0.427451, 1, 0, 1,
-0.646836, 2.553571, -0.02128942, 0.4235294, 1, 0, 1,
-0.6411372, -0.6126296, -0.7510715, 0.4156863, 1, 0, 1,
-0.6390105, -1.25528, -2.720423, 0.4117647, 1, 0, 1,
-0.6344836, 0.2158789, -1.825623, 0.4039216, 1, 0, 1,
-0.6257919, -0.4951819, -1.802287, 0.3960784, 1, 0, 1,
-0.6234617, 0.8292643, -1.298005, 0.3921569, 1, 0, 1,
-0.6101531, -2.292616, -1.63209, 0.3843137, 1, 0, 1,
-0.6050866, -0.4213749, -2.476076, 0.3803922, 1, 0, 1,
-0.6029828, -0.9248589, -3.580215, 0.372549, 1, 0, 1,
-0.6012069, 0.5700889, -0.6620405, 0.3686275, 1, 0, 1,
-0.6005023, 0.8231391, -0.8130012, 0.3607843, 1, 0, 1,
-0.586244, -0.9227483, -3.697422, 0.3568628, 1, 0, 1,
-0.5824475, -2.434134, -2.629627, 0.3490196, 1, 0, 1,
-0.5736292, -0.4617728, -2.049839, 0.345098, 1, 0, 1,
-0.5608735, -1.192448, -2.047378, 0.3372549, 1, 0, 1,
-0.5602406, -0.3622057, -3.18021, 0.3333333, 1, 0, 1,
-0.5601786, -1.185422, -2.870832, 0.3254902, 1, 0, 1,
-0.5598404, -0.6847869, -1.502247, 0.3215686, 1, 0, 1,
-0.556945, -2.437799, -2.99468, 0.3137255, 1, 0, 1,
-0.554354, -0.1139356, -2.374099, 0.3098039, 1, 0, 1,
-0.5520126, -0.5388058, -2.308711, 0.3019608, 1, 0, 1,
-0.549962, 0.3141502, -1.261325, 0.2941177, 1, 0, 1,
-0.5468763, 0.7637309, -0.7833938, 0.2901961, 1, 0, 1,
-0.5466043, -0.565703, -1.802201, 0.282353, 1, 0, 1,
-0.5407606, 0.3406079, -1.48111, 0.2784314, 1, 0, 1,
-0.5348698, 0.1914535, 0.2736075, 0.2705882, 1, 0, 1,
-0.5336336, 1.678251, 0.4037197, 0.2666667, 1, 0, 1,
-0.5266591, 1.04921, 0.9610825, 0.2588235, 1, 0, 1,
-0.5263124, -0.3121262, -1.960971, 0.254902, 1, 0, 1,
-0.5258891, 1.011871, 0.4593994, 0.2470588, 1, 0, 1,
-0.5252696, -0.1633583, -2.67063, 0.2431373, 1, 0, 1,
-0.5227787, -0.6850401, -1.768981, 0.2352941, 1, 0, 1,
-0.5106029, -1.892021, -4.898451, 0.2313726, 1, 0, 1,
-0.5100873, -1.678621, -3.82313, 0.2235294, 1, 0, 1,
-0.5097427, 0.6529471, -1.333212, 0.2196078, 1, 0, 1,
-0.5090998, 0.7639629, 0.7340955, 0.2117647, 1, 0, 1,
-0.5084315, 0.1585856, 0.1323103, 0.2078431, 1, 0, 1,
-0.5041453, 0.003442149, -0.7509735, 0.2, 1, 0, 1,
-0.5032878, 0.5704264, -2.304496, 0.1921569, 1, 0, 1,
-0.5024984, -1.550013, -2.244235, 0.1882353, 1, 0, 1,
-0.50229, 0.3557752, -0.6737109, 0.1803922, 1, 0, 1,
-0.4985988, -1.545482, -2.215256, 0.1764706, 1, 0, 1,
-0.4971959, 0.3060579, -0.4958461, 0.1686275, 1, 0, 1,
-0.4956761, -0.5881866, -1.211077, 0.1647059, 1, 0, 1,
-0.4955548, 0.0513767, -0.8395225, 0.1568628, 1, 0, 1,
-0.4946099, 1.86018, -0.1098775, 0.1529412, 1, 0, 1,
-0.4941265, -0.2323828, -0.3056941, 0.145098, 1, 0, 1,
-0.4920127, 0.9901322, -0.3283103, 0.1411765, 1, 0, 1,
-0.4873299, -0.864625, -4.226632, 0.1333333, 1, 0, 1,
-0.484989, 0.5920081, -1.852059, 0.1294118, 1, 0, 1,
-0.4831944, 1.181362, -1.973469, 0.1215686, 1, 0, 1,
-0.4831125, -1.121746, -2.821305, 0.1176471, 1, 0, 1,
-0.4817715, 1.191731, -0.4160245, 0.1098039, 1, 0, 1,
-0.4815877, 1.321183, 0.1347575, 0.1058824, 1, 0, 1,
-0.4808124, 0.4553457, -0.50439, 0.09803922, 1, 0, 1,
-0.4780672, -0.6982006, -2.123557, 0.09019608, 1, 0, 1,
-0.4772549, 1.189635, -1.695323, 0.08627451, 1, 0, 1,
-0.4758694, -1.744107, -2.250097, 0.07843138, 1, 0, 1,
-0.4750649, 0.6454037, -0.5514508, 0.07450981, 1, 0, 1,
-0.4748082, 0.4277934, -1.407441, 0.06666667, 1, 0, 1,
-0.4741794, 1.040952, -0.05523666, 0.0627451, 1, 0, 1,
-0.4671257, -0.2218473, -0.9116477, 0.05490196, 1, 0, 1,
-0.4664335, -1.94367, -4.254599, 0.05098039, 1, 0, 1,
-0.465931, -0.9724411, -3.475671, 0.04313726, 1, 0, 1,
-0.4632835, 1.082822, 2.528682, 0.03921569, 1, 0, 1,
-0.4588105, -1.189301, -4.575489, 0.03137255, 1, 0, 1,
-0.4573967, -0.6811126, -2.86537, 0.02745098, 1, 0, 1,
-0.4567613, 0.5084761, -0.4529002, 0.01960784, 1, 0, 1,
-0.4558066, 0.5810888, 2.545678, 0.01568628, 1, 0, 1,
-0.4554074, 0.5333893, -2.000058, 0.007843138, 1, 0, 1,
-0.4528933, -1.829294, -2.216708, 0.003921569, 1, 0, 1,
-0.4462423, -1.196076, -3.088823, 0, 1, 0.003921569, 1,
-0.4446542, -0.05772183, -1.826833, 0, 1, 0.01176471, 1,
-0.4441328, -0.9149475, -4.783702, 0, 1, 0.01568628, 1,
-0.4438101, -0.09376185, -1.108839, 0, 1, 0.02352941, 1,
-0.4421025, 0.6961326, 0.1086851, 0, 1, 0.02745098, 1,
-0.4414993, -0.767643, -1.834792, 0, 1, 0.03529412, 1,
-0.4408825, 0.2604001, -1.307273, 0, 1, 0.03921569, 1,
-0.4382272, 0.7285283, 0.6183985, 0, 1, 0.04705882, 1,
-0.4376253, -0.4137564, -4.469622, 0, 1, 0.05098039, 1,
-0.4369562, -0.6318572, -2.080434, 0, 1, 0.05882353, 1,
-0.4360819, 0.09822366, -1.142063, 0, 1, 0.0627451, 1,
-0.4354812, 0.5863233, -0.4608842, 0, 1, 0.07058824, 1,
-0.4301052, -1.394632, -3.668605, 0, 1, 0.07450981, 1,
-0.4288945, -0.2093384, -0.7831749, 0, 1, 0.08235294, 1,
-0.4189432, -0.2769856, -3.557765, 0, 1, 0.08627451, 1,
-0.4170333, -0.1718965, 0.2872548, 0, 1, 0.09411765, 1,
-0.4147389, 0.3716326, -1.9585, 0, 1, 0.1019608, 1,
-0.4074454, -0.0549822, -0.7217792, 0, 1, 0.1058824, 1,
-0.4055743, -0.5884899, -2.454006, 0, 1, 0.1137255, 1,
-0.4029352, -0.1040702, -1.648106, 0, 1, 0.1176471, 1,
-0.3862997, 0.4041331, -1.139204, 0, 1, 0.1254902, 1,
-0.3832272, 0.09965298, -1.669837, 0, 1, 0.1294118, 1,
-0.3725352, 0.16514, -0.5969533, 0, 1, 0.1372549, 1,
-0.3681543, -1.980479, -3.373331, 0, 1, 0.1411765, 1,
-0.3678122, 2.175404, -0.6821773, 0, 1, 0.1490196, 1,
-0.3602428, -1.227785, -4.237859, 0, 1, 0.1529412, 1,
-0.359996, 0.08980747, -1.582839, 0, 1, 0.1607843, 1,
-0.3556522, -1.76549, -2.182614, 0, 1, 0.1647059, 1,
-0.3542425, 1.118588, 0.2674535, 0, 1, 0.172549, 1,
-0.3504367, 0.822409, -0.6581435, 0, 1, 0.1764706, 1,
-0.3485626, 0.1272513, -1.024924, 0, 1, 0.1843137, 1,
-0.3469981, 1.30798, -1.563689, 0, 1, 0.1882353, 1,
-0.3469471, -1.196291, -3.093099, 0, 1, 0.1960784, 1,
-0.3451502, 1.326033, 1.741246, 0, 1, 0.2039216, 1,
-0.3288622, 1.661703, -0.07488634, 0, 1, 0.2078431, 1,
-0.3190899, -0.473515, -1.358487, 0, 1, 0.2156863, 1,
-0.3155328, -0.08823315, -1.078619, 0, 1, 0.2196078, 1,
-0.3115593, 0.8582519, 1.222487, 0, 1, 0.227451, 1,
-0.3015741, 2.150459, -2.016289, 0, 1, 0.2313726, 1,
-0.3000578, -0.5228792, -5.452089, 0, 1, 0.2392157, 1,
-0.2956748, 1.483012, 1.158944, 0, 1, 0.2431373, 1,
-0.2923848, 0.08957574, -1.303073, 0, 1, 0.2509804, 1,
-0.2893245, -0.9691972, -2.92129, 0, 1, 0.254902, 1,
-0.287735, 1.472301, -0.3279453, 0, 1, 0.2627451, 1,
-0.2721561, -0.7813577, -3.63081, 0, 1, 0.2666667, 1,
-0.2714193, -1.799496, -1.212234, 0, 1, 0.2745098, 1,
-0.2711333, 0.533017, 0.6408731, 0, 1, 0.2784314, 1,
-0.2686988, 0.5253477, -1.18272, 0, 1, 0.2862745, 1,
-0.2675599, -0.5285923, -2.537427, 0, 1, 0.2901961, 1,
-0.2653498, -0.511034, -1.731043, 0, 1, 0.2980392, 1,
-0.2571754, 0.9165469, -0.7496563, 0, 1, 0.3058824, 1,
-0.2551495, -0.3347848, -3.913311, 0, 1, 0.3098039, 1,
-0.2546529, 1.510893, -0.006369629, 0, 1, 0.3176471, 1,
-0.2535897, 0.2627799, 0.1702462, 0, 1, 0.3215686, 1,
-0.2505478, -0.4532438, -1.509588, 0, 1, 0.3294118, 1,
-0.2502184, -0.692014, -3.761408, 0, 1, 0.3333333, 1,
-0.2446634, -1.326726, -2.212651, 0, 1, 0.3411765, 1,
-0.2418063, -1.111508, -3.380174, 0, 1, 0.345098, 1,
-0.239091, -0.1580187, -2.996871, 0, 1, 0.3529412, 1,
-0.2312505, 0.8981143, 0.3965608, 0, 1, 0.3568628, 1,
-0.2269707, 1.433791, 0.05468998, 0, 1, 0.3647059, 1,
-0.2236492, 0.4698749, 1.653547, 0, 1, 0.3686275, 1,
-0.2215367, 1.325977, -1.523437, 0, 1, 0.3764706, 1,
-0.2186733, 0.1507594, -0.3169484, 0, 1, 0.3803922, 1,
-0.2129298, 0.005415125, -0.9985229, 0, 1, 0.3882353, 1,
-0.2114863, -0.7640936, -3.042643, 0, 1, 0.3921569, 1,
-0.2097887, -0.2989233, -4.482556, 0, 1, 0.4, 1,
-0.2084327, -1.054984, -2.301489, 0, 1, 0.4078431, 1,
-0.207125, 1.401492, -0.6758696, 0, 1, 0.4117647, 1,
-0.2066282, -1.369808, -4.669343, 0, 1, 0.4196078, 1,
-0.2050702, -1.0339, -4.358457, 0, 1, 0.4235294, 1,
-0.2031196, -0.2294717, -3.09607, 0, 1, 0.4313726, 1,
-0.1989224, 1.494641, 0.9077402, 0, 1, 0.4352941, 1,
-0.197954, 0.3874723, -0.6574866, 0, 1, 0.4431373, 1,
-0.1935972, 0.3535201, -0.8959741, 0, 1, 0.4470588, 1,
-0.1849274, -0.1383094, -3.075337, 0, 1, 0.454902, 1,
-0.1844636, -0.708087, -3.137904, 0, 1, 0.4588235, 1,
-0.1813284, -2.080141, -1.658708, 0, 1, 0.4666667, 1,
-0.1811315, 1.241414, -0.2138719, 0, 1, 0.4705882, 1,
-0.1811286, -1.256113, -4.198071, 0, 1, 0.4784314, 1,
-0.1754705, -1.383611, -3.346471, 0, 1, 0.4823529, 1,
-0.174501, -0.390146, -2.55915, 0, 1, 0.4901961, 1,
-0.1659754, -2.476136, -4.690555, 0, 1, 0.4941176, 1,
-0.1653716, 0.7836069, -2.218297, 0, 1, 0.5019608, 1,
-0.1610803, 0.3710767, -1.637441, 0, 1, 0.509804, 1,
-0.155718, 0.2306568, -1.334007, 0, 1, 0.5137255, 1,
-0.1548567, -1.828651, -1.213486, 0, 1, 0.5215687, 1,
-0.153234, -1.016087, -2.685222, 0, 1, 0.5254902, 1,
-0.1487048, 0.8782934, -0.5185586, 0, 1, 0.5333334, 1,
-0.1474426, 1.337276, -1.299625, 0, 1, 0.5372549, 1,
-0.1455854, 0.1968688, -0.7557864, 0, 1, 0.5450981, 1,
-0.1453891, 1.684093, 0.8145431, 0, 1, 0.5490196, 1,
-0.1449466, -0.542317, -3.099022, 0, 1, 0.5568628, 1,
-0.1445637, -1.325744, -3.291835, 0, 1, 0.5607843, 1,
-0.1434672, 0.9528753, -0.5112524, 0, 1, 0.5686275, 1,
-0.1432348, 1.335585, -0.2279675, 0, 1, 0.572549, 1,
-0.1431903, 0.6463205, 1.525986, 0, 1, 0.5803922, 1,
-0.1381836, -0.1026506, -2.131809, 0, 1, 0.5843138, 1,
-0.1367007, -0.9521156, -3.280194, 0, 1, 0.5921569, 1,
-0.1360419, 0.2897683, -0.9513652, 0, 1, 0.5960785, 1,
-0.1315554, 0.111576, 0.3280229, 0, 1, 0.6039216, 1,
-0.1279102, -2.432214, -4.047565, 0, 1, 0.6117647, 1,
-0.1205297, -0.78078, -1.977653, 0, 1, 0.6156863, 1,
-0.1166916, 1.090317, -0.2399329, 0, 1, 0.6235294, 1,
-0.1166473, -0.02194525, -1.400492, 0, 1, 0.627451, 1,
-0.1129002, -0.5878496, -3.492795, 0, 1, 0.6352941, 1,
-0.1101003, -0.6346171, -3.684799, 0, 1, 0.6392157, 1,
-0.1089395, -0.9730792, -4.791877, 0, 1, 0.6470588, 1,
-0.1084115, -0.6655838, -3.067281, 0, 1, 0.6509804, 1,
-0.1076987, 1.204907, 1.537111, 0, 1, 0.6588235, 1,
-0.1058227, 0.6937114, -1.543223, 0, 1, 0.6627451, 1,
-0.1057869, 0.07808105, -0.7003127, 0, 1, 0.6705883, 1,
-0.1021526, 0.06862677, -0.4448083, 0, 1, 0.6745098, 1,
-0.1015323, -0.6623151, -3.132831, 0, 1, 0.682353, 1,
-0.09942798, 1.744888, -2.146809, 0, 1, 0.6862745, 1,
-0.09381183, -0.02133106, -4.405269, 0, 1, 0.6941177, 1,
-0.0902929, -0.0558666, -0.9870912, 0, 1, 0.7019608, 1,
-0.08875291, 0.5555046, 0.414822, 0, 1, 0.7058824, 1,
-0.08873904, -0.4443776, -3.90843, 0, 1, 0.7137255, 1,
-0.08623577, -0.1886083, -4.998311, 0, 1, 0.7176471, 1,
-0.082296, -0.02615661, -1.551806, 0, 1, 0.7254902, 1,
-0.08164042, 0.8096906, -0.03290036, 0, 1, 0.7294118, 1,
-0.07475697, -0.8913443, -2.937238, 0, 1, 0.7372549, 1,
-0.07309733, -0.001841092, -2.391066, 0, 1, 0.7411765, 1,
-0.06876235, 0.07862606, -1.78011, 0, 1, 0.7490196, 1,
-0.06765992, 0.2039771, -0.1838768, 0, 1, 0.7529412, 1,
-0.06446796, -0.1902818, -4.413328, 0, 1, 0.7607843, 1,
-0.06249804, -0.331674, -3.213732, 0, 1, 0.7647059, 1,
-0.06228629, -0.5785762, -2.023425, 0, 1, 0.772549, 1,
-0.06043058, 0.2422558, -0.8772425, 0, 1, 0.7764706, 1,
-0.05867346, -0.4041171, -2.945817, 0, 1, 0.7843137, 1,
-0.0553575, -0.1205189, -3.837476, 0, 1, 0.7882353, 1,
-0.05382672, 2.502768, -0.3829283, 0, 1, 0.7960784, 1,
-0.05006297, -1.813618, -3.841919, 0, 1, 0.8039216, 1,
-0.04977879, -0.482389, -1.353445, 0, 1, 0.8078431, 1,
-0.04869529, 0.345761, -0.5691608, 0, 1, 0.8156863, 1,
-0.04415606, 0.4519403, -2.462738, 0, 1, 0.8196079, 1,
-0.04323489, 0.5504387, -0.3928138, 0, 1, 0.827451, 1,
-0.04040615, -1.144075, -2.802409, 0, 1, 0.8313726, 1,
-0.03893412, 1.781008, -1.205823, 0, 1, 0.8392157, 1,
-0.03022193, 0.8244489, 1.383509, 0, 1, 0.8431373, 1,
-0.02789025, 0.2669492, 0.7709483, 0, 1, 0.8509804, 1,
-0.0232926, 1.165544, -1.320509, 0, 1, 0.854902, 1,
-0.0227567, -0.5539173, -4.523037, 0, 1, 0.8627451, 1,
-0.016388, 0.9060819, -0.7813154, 0, 1, 0.8666667, 1,
-0.01401956, -0.9367149, -0.2576444, 0, 1, 0.8745098, 1,
-0.01283446, 1.058849, -0.4755823, 0, 1, 0.8784314, 1,
-0.0101186, 0.6626126, -0.9968532, 0, 1, 0.8862745, 1,
-0.008947654, 0.4530122, -1.64858, 0, 1, 0.8901961, 1,
-0.007257125, -0.8020328, -3.369122, 0, 1, 0.8980392, 1,
-0.0001588294, -1.4621, -3.737024, 0, 1, 0.9058824, 1,
-0.0001403393, -1.170643, -1.597059, 0, 1, 0.9098039, 1,
0.0004352971, -0.225081, 1.46415, 0, 1, 0.9176471, 1,
0.001562827, -0.362724, 3.25246, 0, 1, 0.9215686, 1,
0.005667504, 0.2479758, -0.7067798, 0, 1, 0.9294118, 1,
0.007919662, -0.2117206, 5.472044, 0, 1, 0.9333333, 1,
0.01286294, -2.616378, 3.974178, 0, 1, 0.9411765, 1,
0.02007678, 1.744499, 1.542814, 0, 1, 0.945098, 1,
0.02690106, -1.228327, 5.165855, 0, 1, 0.9529412, 1,
0.0272876, -1.212172, 2.64074, 0, 1, 0.9568627, 1,
0.02786575, 1.131729, 0.2268298, 0, 1, 0.9647059, 1,
0.03096713, 0.8368107, -1.227546, 0, 1, 0.9686275, 1,
0.03871831, 0.4820498, 0.1116973, 0, 1, 0.9764706, 1,
0.03916937, 1.011729, 1.49969, 0, 1, 0.9803922, 1,
0.03950603, -0.0160099, 2.380537, 0, 1, 0.9882353, 1,
0.04787955, -1.043538, 4.958498, 0, 1, 0.9921569, 1,
0.05123383, 2.122783, 2.5043, 0, 1, 1, 1,
0.05420589, 0.9996858, 1.176501, 0, 0.9921569, 1, 1,
0.06257152, -0.4475253, 2.390598, 0, 0.9882353, 1, 1,
0.06273894, 1.180597, 0.7830657, 0, 0.9803922, 1, 1,
0.06721029, -0.8099609, 2.589687, 0, 0.9764706, 1, 1,
0.07319273, 1.009422, -0.1062748, 0, 0.9686275, 1, 1,
0.07429082, -0.7588596, 3.001831, 0, 0.9647059, 1, 1,
0.07442118, 0.104887, 0.6534179, 0, 0.9568627, 1, 1,
0.07620292, -1.018537, 3.652343, 0, 0.9529412, 1, 1,
0.07764064, -0.6716137, 4.399252, 0, 0.945098, 1, 1,
0.0805905, -1.488176, 1.583681, 0, 0.9411765, 1, 1,
0.082128, -0.9181767, 2.862538, 0, 0.9333333, 1, 1,
0.08350559, -0.2897367, 1.998642, 0, 0.9294118, 1, 1,
0.08772953, -0.4968995, 3.030168, 0, 0.9215686, 1, 1,
0.09252094, -0.412164, 4.190516, 0, 0.9176471, 1, 1,
0.09279876, -0.2947075, 4.707776, 0, 0.9098039, 1, 1,
0.09358826, 0.08169909, -0.678624, 0, 0.9058824, 1, 1,
0.09637627, 0.4196111, -0.07601962, 0, 0.8980392, 1, 1,
0.09803943, 1.241904, 0.7078699, 0, 0.8901961, 1, 1,
0.09811452, 0.6633319, 1.256617, 0, 0.8862745, 1, 1,
0.09894247, 0.4480457, 1.617842, 0, 0.8784314, 1, 1,
0.09973459, -0.5856591, 1.200221, 0, 0.8745098, 1, 1,
0.1014588, -0.7949544, 3.008312, 0, 0.8666667, 1, 1,
0.104381, -1.277081, 2.200796, 0, 0.8627451, 1, 1,
0.1101206, 1.966864, -0.7129754, 0, 0.854902, 1, 1,
0.1216618, -0.7611909, 3.525657, 0, 0.8509804, 1, 1,
0.1218188, -0.9683867, 3.490464, 0, 0.8431373, 1, 1,
0.1225478, 0.6825296, -1.840081, 0, 0.8392157, 1, 1,
0.1286626, 0.5589651, -0.201321, 0, 0.8313726, 1, 1,
0.1298563, -0.2171713, 3.628508, 0, 0.827451, 1, 1,
0.1323239, -0.30129, 2.950256, 0, 0.8196079, 1, 1,
0.1346513, 0.8576302, -0.2414049, 0, 0.8156863, 1, 1,
0.1379674, -0.5176638, 5.193082, 0, 0.8078431, 1, 1,
0.1404213, -0.3834143, 1.69952, 0, 0.8039216, 1, 1,
0.1430961, 1.422393, 0.7398381, 0, 0.7960784, 1, 1,
0.1433696, -0.7886785, 2.651275, 0, 0.7882353, 1, 1,
0.1434402, -0.8422271, 3.769905, 0, 0.7843137, 1, 1,
0.1458156, 0.0314649, 2.083507, 0, 0.7764706, 1, 1,
0.1487902, 0.5107225, 1.572255, 0, 0.772549, 1, 1,
0.150992, 1.009347, 1.184818, 0, 0.7647059, 1, 1,
0.1521805, -0.4385084, 1.807063, 0, 0.7607843, 1, 1,
0.1527552, 1.234989, 1.128646, 0, 0.7529412, 1, 1,
0.1543654, -1.455131, 3.726983, 0, 0.7490196, 1, 1,
0.1556962, 0.5555368, 1.666914, 0, 0.7411765, 1, 1,
0.1564193, 0.1716693, 2.172205, 0, 0.7372549, 1, 1,
0.1582284, 1.273329, -2.379012, 0, 0.7294118, 1, 1,
0.1636491, -1.396563, 1.977289, 0, 0.7254902, 1, 1,
0.1648967, 1.34559, -0.4402987, 0, 0.7176471, 1, 1,
0.1661111, -0.4865121, 2.945775, 0, 0.7137255, 1, 1,
0.1701261, 1.76602, 1.121445, 0, 0.7058824, 1, 1,
0.1735184, -0.5997883, 2.458212, 0, 0.6980392, 1, 1,
0.1759764, -0.1408119, 2.120564, 0, 0.6941177, 1, 1,
0.1849065, 0.232823, 1.994925, 0, 0.6862745, 1, 1,
0.1878684, -0.2915098, 3.66454, 0, 0.682353, 1, 1,
0.1913342, -1.876399, 2.197799, 0, 0.6745098, 1, 1,
0.1926422, 0.3608035, 1.050407, 0, 0.6705883, 1, 1,
0.193532, 1.277467, 1.258296, 0, 0.6627451, 1, 1,
0.1945328, -0.8904344, 3.585169, 0, 0.6588235, 1, 1,
0.1967368, -0.7579933, 3.22223, 0, 0.6509804, 1, 1,
0.1986844, -0.8905935, 5.513188, 0, 0.6470588, 1, 1,
0.1990957, -0.2951389, 2.655924, 0, 0.6392157, 1, 1,
0.1991149, -0.6399312, 3.266877, 0, 0.6352941, 1, 1,
0.2010493, -1.339283, 4.874979, 0, 0.627451, 1, 1,
0.2020437, -0.2587417, 3.074838, 0, 0.6235294, 1, 1,
0.2038089, 1.623962, 1.841538, 0, 0.6156863, 1, 1,
0.2039919, 1.48136, 0.9367177, 0, 0.6117647, 1, 1,
0.2042104, 0.1750349, 0.3613805, 0, 0.6039216, 1, 1,
0.2050181, 1.394177, 0.5951391, 0, 0.5960785, 1, 1,
0.2061109, -1.145473, 3.097363, 0, 0.5921569, 1, 1,
0.2110954, -0.1927046, 1.993481, 0, 0.5843138, 1, 1,
0.2172184, 1.125276, -1.559251, 0, 0.5803922, 1, 1,
0.2188261, -1.153977, 3.146897, 0, 0.572549, 1, 1,
0.2198473, -0.127059, 1.804728, 0, 0.5686275, 1, 1,
0.2223114, 0.316807, 1.384769, 0, 0.5607843, 1, 1,
0.228041, 0.1887615, -0.3640515, 0, 0.5568628, 1, 1,
0.230904, 0.5686124, 1.886567, 0, 0.5490196, 1, 1,
0.2309528, 1.108383, -0.4275194, 0, 0.5450981, 1, 1,
0.2315681, -0.1621388, 3.716708, 0, 0.5372549, 1, 1,
0.2340298, 0.1945289, 0.2751852, 0, 0.5333334, 1, 1,
0.2404376, 0.5422566, 1.592156, 0, 0.5254902, 1, 1,
0.2419602, -0.2307433, 0.6407939, 0, 0.5215687, 1, 1,
0.2460974, 1.022001, -0.05694749, 0, 0.5137255, 1, 1,
0.2477555, 0.8254245, 0.7245324, 0, 0.509804, 1, 1,
0.2505029, 0.6627227, 1.095342, 0, 0.5019608, 1, 1,
0.253237, -0.216131, 1.577714, 0, 0.4941176, 1, 1,
0.2535993, -0.02516891, 1.510637, 0, 0.4901961, 1, 1,
0.2573138, 0.0649377, 0.2768394, 0, 0.4823529, 1, 1,
0.25853, 0.8569694, -0.985218, 0, 0.4784314, 1, 1,
0.2612578, -0.1511677, 1.928071, 0, 0.4705882, 1, 1,
0.26163, 1.677993, -0.9246953, 0, 0.4666667, 1, 1,
0.262146, 0.713829, 1.045675, 0, 0.4588235, 1, 1,
0.2622857, -0.9701138, 0.9232972, 0, 0.454902, 1, 1,
0.2631884, -0.91889, 3.037212, 0, 0.4470588, 1, 1,
0.2643292, -1.054182, 2.320956, 0, 0.4431373, 1, 1,
0.2678124, 0.09822278, 2.42217, 0, 0.4352941, 1, 1,
0.2695017, 0.1127519, 1.315732, 0, 0.4313726, 1, 1,
0.2702552, 1.623528, -1.927533, 0, 0.4235294, 1, 1,
0.2716607, -0.1803285, 2.645983, 0, 0.4196078, 1, 1,
0.2717051, -1.733311, 3.193946, 0, 0.4117647, 1, 1,
0.2744241, 1.592125, -0.5310749, 0, 0.4078431, 1, 1,
0.2759605, 0.2169413, 2.373671, 0, 0.4, 1, 1,
0.2760322, -0.3670535, 3.621478, 0, 0.3921569, 1, 1,
0.2768893, 0.01728568, 1.877357, 0, 0.3882353, 1, 1,
0.2781824, -0.5623224, 2.759197, 0, 0.3803922, 1, 1,
0.28085, -1.696024, 1.222484, 0, 0.3764706, 1, 1,
0.2831334, 0.5840898, 0.274366, 0, 0.3686275, 1, 1,
0.2883265, 0.1422286, 2.913482, 0, 0.3647059, 1, 1,
0.2951653, -0.8868545, 1.932195, 0, 0.3568628, 1, 1,
0.2966812, 0.4697211, -0.3893114, 0, 0.3529412, 1, 1,
0.2975442, -0.2830054, 2.613624, 0, 0.345098, 1, 1,
0.3010022, -0.5587627, 2.642394, 0, 0.3411765, 1, 1,
0.3020499, 1.157094, 0.5936496, 0, 0.3333333, 1, 1,
0.3029025, 0.1737363, 1.918555, 0, 0.3294118, 1, 1,
0.3075244, -0.1743159, 3.555004, 0, 0.3215686, 1, 1,
0.3084248, 1.885556, 1.867653, 0, 0.3176471, 1, 1,
0.3088719, 0.8487588, 0.5444524, 0, 0.3098039, 1, 1,
0.3139047, -0.1741125, 2.722847, 0, 0.3058824, 1, 1,
0.3145447, -0.8707538, 1.047526, 0, 0.2980392, 1, 1,
0.3158525, -0.974079, 1.707038, 0, 0.2901961, 1, 1,
0.316349, 0.3241828, 1.497026, 0, 0.2862745, 1, 1,
0.3212196, 1.064687, -1.576481, 0, 0.2784314, 1, 1,
0.3217013, -0.6141621, 3.175393, 0, 0.2745098, 1, 1,
0.3246645, -0.05627031, 2.440663, 0, 0.2666667, 1, 1,
0.329295, 1.60473, 1.873158, 0, 0.2627451, 1, 1,
0.3307547, -0.05133799, 2.873498, 0, 0.254902, 1, 1,
0.3339584, -0.7901471, 1.126175, 0, 0.2509804, 1, 1,
0.3341335, -0.4273961, 1.837821, 0, 0.2431373, 1, 1,
0.3369747, 0.5207407, 1.054326, 0, 0.2392157, 1, 1,
0.3371378, 1.728304, 0.7346013, 0, 0.2313726, 1, 1,
0.3371539, 1.047897, -1.003493, 0, 0.227451, 1, 1,
0.3419482, 1.425985, -0.2264417, 0, 0.2196078, 1, 1,
0.347532, 0.3829151, 0.5427828, 0, 0.2156863, 1, 1,
0.3480615, 1.086027, 1.099051, 0, 0.2078431, 1, 1,
0.3531904, 0.2738165, 0.2178772, 0, 0.2039216, 1, 1,
0.3532993, 0.06827816, 0.9959703, 0, 0.1960784, 1, 1,
0.3553144, 0.6358663, 0.6519984, 0, 0.1882353, 1, 1,
0.3555077, 0.0759304, 1.184376, 0, 0.1843137, 1, 1,
0.3598107, 1.048604, -0.8833899, 0, 0.1764706, 1, 1,
0.3616223, 0.5438883, -0.02668269, 0, 0.172549, 1, 1,
0.3642855, -0.7899008, 3.871189, 0, 0.1647059, 1, 1,
0.3645974, 0.0850793, 0.9646524, 0, 0.1607843, 1, 1,
0.3661087, 1.218082, 1.651937, 0, 0.1529412, 1, 1,
0.366757, -0.005467356, -0.3899359, 0, 0.1490196, 1, 1,
0.3671371, 0.09371119, -0.02917695, 0, 0.1411765, 1, 1,
0.369701, -0.2367543, 2.079589, 0, 0.1372549, 1, 1,
0.3722313, 1.243983, 2.030691, 0, 0.1294118, 1, 1,
0.373664, 0.197025, 0.920919, 0, 0.1254902, 1, 1,
0.3773836, -0.4883789, 3.510716, 0, 0.1176471, 1, 1,
0.382045, 1.203274, -0.2143285, 0, 0.1137255, 1, 1,
0.3840248, 0.772257, 0.2516871, 0, 0.1058824, 1, 1,
0.3853736, 0.01703992, 0.9845377, 0, 0.09803922, 1, 1,
0.3879449, -0.7548417, 2.957641, 0, 0.09411765, 1, 1,
0.3882259, 0.7803522, -0.6708733, 0, 0.08627451, 1, 1,
0.3907521, 0.7559704, 0.4698999, 0, 0.08235294, 1, 1,
0.3929032, -0.6444554, 4.158751, 0, 0.07450981, 1, 1,
0.4008243, -0.549423, 4.120888, 0, 0.07058824, 1, 1,
0.4011135, 0.9408825, -0.9024174, 0, 0.0627451, 1, 1,
0.401504, -1.156061, 2.722927, 0, 0.05882353, 1, 1,
0.4057964, 1.659775, 1.330444, 0, 0.05098039, 1, 1,
0.406029, 1.92658, -0.04056299, 0, 0.04705882, 1, 1,
0.4085301, 0.4901594, -0.006970325, 0, 0.03921569, 1, 1,
0.4120586, -1.009066, 0.9773647, 0, 0.03529412, 1, 1,
0.4122425, -0.2015719, 1.564624, 0, 0.02745098, 1, 1,
0.4176994, 0.8305278, -0.0960826, 0, 0.02352941, 1, 1,
0.4232652, 0.3092365, 2.166644, 0, 0.01568628, 1, 1,
0.4255536, -0.2199525, 2.229085, 0, 0.01176471, 1, 1,
0.4319807, 3.005461, -0.903951, 0, 0.003921569, 1, 1,
0.4330406, -0.03398822, 2.612077, 0.003921569, 0, 1, 1,
0.4332304, 1.06254, -0.4859242, 0.007843138, 0, 1, 1,
0.4368853, -0.005551247, 2.832094, 0.01568628, 0, 1, 1,
0.4396252, 0.0917749, 0.6864896, 0.01960784, 0, 1, 1,
0.4397111, -0.242479, 2.59752, 0.02745098, 0, 1, 1,
0.4399169, 1.34268, 1.587295, 0.03137255, 0, 1, 1,
0.4405493, 0.07853368, 1.744975, 0.03921569, 0, 1, 1,
0.4446971, -0.3290016, 0.3322853, 0.04313726, 0, 1, 1,
0.4467356, -0.1316941, 1.886122, 0.05098039, 0, 1, 1,
0.4565641, -0.7893521, 2.397388, 0.05490196, 0, 1, 1,
0.4609044, 2.35205, -0.4207015, 0.0627451, 0, 1, 1,
0.4690976, -0.9421221, 1.097653, 0.06666667, 0, 1, 1,
0.4711758, 1.030291, 0.1716223, 0.07450981, 0, 1, 1,
0.4789543, -0.7454191, 3.300683, 0.07843138, 0, 1, 1,
0.4840371, -1.289693, 3.062276, 0.08627451, 0, 1, 1,
0.4848342, 1.313425, -0.5161942, 0.09019608, 0, 1, 1,
0.4926479, -0.6244263, 1.727955, 0.09803922, 0, 1, 1,
0.4949572, 0.4870906, -0.8785691, 0.1058824, 0, 1, 1,
0.4955414, 0.4645231, 1.256853, 0.1098039, 0, 1, 1,
0.4988154, 2.886022, -0.7023051, 0.1176471, 0, 1, 1,
0.5019457, -0.01570686, 0.8609329, 0.1215686, 0, 1, 1,
0.5029548, 1.674454, 0.07163913, 0.1294118, 0, 1, 1,
0.5136194, -0.785891, 2.742023, 0.1333333, 0, 1, 1,
0.5160224, 1.20557, 1.998177, 0.1411765, 0, 1, 1,
0.5177703, 0.474051, 1.061108, 0.145098, 0, 1, 1,
0.5217835, -0.8716208, 3.637316, 0.1529412, 0, 1, 1,
0.5225998, 1.578491, -0.4917999, 0.1568628, 0, 1, 1,
0.5227458, 0.8770406, -0.2702061, 0.1647059, 0, 1, 1,
0.5246844, -1.179938, 1.764235, 0.1686275, 0, 1, 1,
0.5263245, -2.04883, 3.410879, 0.1764706, 0, 1, 1,
0.5327467, 1.451443, 0.8334879, 0.1803922, 0, 1, 1,
0.5328913, 0.8490521, 0.4278456, 0.1882353, 0, 1, 1,
0.5355403, 0.7759826, 1.405278, 0.1921569, 0, 1, 1,
0.5521199, -0.4398443, 1.375556, 0.2, 0, 1, 1,
0.5715178, 0.8993999, 0.7152559, 0.2078431, 0, 1, 1,
0.5726297, 2.140309, 1.256837, 0.2117647, 0, 1, 1,
0.5773017, -0.217458, -0.1931185, 0.2196078, 0, 1, 1,
0.5812636, 2.140494, -0.1884396, 0.2235294, 0, 1, 1,
0.5818812, 0.06077508, 2.234396, 0.2313726, 0, 1, 1,
0.5840606, -0.3524245, 3.016247, 0.2352941, 0, 1, 1,
0.5859326, -0.6943846, 3.177591, 0.2431373, 0, 1, 1,
0.5875406, 0.767517, 0.334353, 0.2470588, 0, 1, 1,
0.5902137, 1.28553, 0.1718546, 0.254902, 0, 1, 1,
0.5941032, 0.5120864, 1.923094, 0.2588235, 0, 1, 1,
0.5958806, 0.2833498, 0.8333363, 0.2666667, 0, 1, 1,
0.6041793, 0.3284873, 1.703606, 0.2705882, 0, 1, 1,
0.6053702, 2.58254, -0.2810544, 0.2784314, 0, 1, 1,
0.606975, 0.3524403, 2.079992, 0.282353, 0, 1, 1,
0.6102022, -0.5571935, 2.558915, 0.2901961, 0, 1, 1,
0.6107175, -0.4534574, 3.669062, 0.2941177, 0, 1, 1,
0.6214636, -0.8505226, 0.7775549, 0.3019608, 0, 1, 1,
0.6244462, -0.8990518, 2.963941, 0.3098039, 0, 1, 1,
0.6309211, 0.4763686, 1.551904, 0.3137255, 0, 1, 1,
0.6364574, 0.01529054, -0.1247434, 0.3215686, 0, 1, 1,
0.6364963, -0.945331, 2.798792, 0.3254902, 0, 1, 1,
0.6374127, 0.6196956, -1.179284, 0.3333333, 0, 1, 1,
0.6425557, -0.4080039, 1.833811, 0.3372549, 0, 1, 1,
0.6464659, -0.6023571, 2.465638, 0.345098, 0, 1, 1,
0.658599, -0.4079807, 1.710143, 0.3490196, 0, 1, 1,
0.6633037, -1.102322, 2.190199, 0.3568628, 0, 1, 1,
0.6659938, 0.6480947, 0.2941014, 0.3607843, 0, 1, 1,
0.6719202, -0.4086725, 3.169465, 0.3686275, 0, 1, 1,
0.6745711, 1.737384, 0.05144443, 0.372549, 0, 1, 1,
0.6784768, -0.006641251, 1.930739, 0.3803922, 0, 1, 1,
0.678652, -0.4904296, 1.628344, 0.3843137, 0, 1, 1,
0.6818998, -0.1757727, 0.4049832, 0.3921569, 0, 1, 1,
0.6842008, -0.4969207, 0.8836328, 0.3960784, 0, 1, 1,
0.6888652, 1.290749, 0.4951166, 0.4039216, 0, 1, 1,
0.6894382, 1.08992, 1.546742, 0.4117647, 0, 1, 1,
0.6929641, -1.619009, 1.640563, 0.4156863, 0, 1, 1,
0.6956864, -0.1614467, 0.9237142, 0.4235294, 0, 1, 1,
0.6998892, -1.14006, 3.833893, 0.427451, 0, 1, 1,
0.7035128, 0.03522783, 1.039275, 0.4352941, 0, 1, 1,
0.7039731, 0.3277833, 1.700783, 0.4392157, 0, 1, 1,
0.7059514, -1.538734, 2.546232, 0.4470588, 0, 1, 1,
0.7076821, -0.07484994, 0.526455, 0.4509804, 0, 1, 1,
0.7114403, -1.212788, 1.395997, 0.4588235, 0, 1, 1,
0.7122858, -2.167413, 3.457358, 0.4627451, 0, 1, 1,
0.7186882, 0.8052926, 1.934632, 0.4705882, 0, 1, 1,
0.7204006, -1.461987, 2.543314, 0.4745098, 0, 1, 1,
0.7233682, -0.8522201, 2.78136, 0.4823529, 0, 1, 1,
0.7281958, -0.9811343, 3.081722, 0.4862745, 0, 1, 1,
0.7311936, 0.3915775, 2.079129, 0.4941176, 0, 1, 1,
0.7318859, -0.5482182, 3.567204, 0.5019608, 0, 1, 1,
0.7321088, 0.5957069, 0.9668896, 0.5058824, 0, 1, 1,
0.7410662, -1.600933, 1.880844, 0.5137255, 0, 1, 1,
0.7487191, 0.7733603, 2.031166, 0.5176471, 0, 1, 1,
0.750414, -0.436967, 3.080547, 0.5254902, 0, 1, 1,
0.7512465, -0.8629718, 2.675508, 0.5294118, 0, 1, 1,
0.7558462, -0.6961231, 2.613686, 0.5372549, 0, 1, 1,
0.7602246, 0.121323, 1.589444, 0.5411765, 0, 1, 1,
0.7628694, -1.79679, 2.77836, 0.5490196, 0, 1, 1,
0.7640314, 0.1040865, 1.174217, 0.5529412, 0, 1, 1,
0.7675349, -0.3222364, 1.331194, 0.5607843, 0, 1, 1,
0.768839, 1.210631, 0.8640361, 0.5647059, 0, 1, 1,
0.7703665, 0.3108148, 0.8003311, 0.572549, 0, 1, 1,
0.7742088, -0.3454641, 2.211545, 0.5764706, 0, 1, 1,
0.7763101, -0.3688838, 2.094924, 0.5843138, 0, 1, 1,
0.7769985, 0.7537242, 0.1961372, 0.5882353, 0, 1, 1,
0.7771143, -1.333824, 2.913975, 0.5960785, 0, 1, 1,
0.7849732, -0.8953965, 3.025072, 0.6039216, 0, 1, 1,
0.7854261, 1.206866, 0.1756976, 0.6078432, 0, 1, 1,
0.7872672, 0.7182958, 0.08100164, 0.6156863, 0, 1, 1,
0.7878319, -0.2339726, 2.58604, 0.6196079, 0, 1, 1,
0.7883301, -1.7045, 2.108127, 0.627451, 0, 1, 1,
0.7899991, 1.990279, 0.7847458, 0.6313726, 0, 1, 1,
0.7943074, 1.407992, 1.453174, 0.6392157, 0, 1, 1,
0.7970123, -0.1810405, 2.120912, 0.6431373, 0, 1, 1,
0.8035409, 0.9090219, 1.756986, 0.6509804, 0, 1, 1,
0.8041158, -0.8151706, 2.028124, 0.654902, 0, 1, 1,
0.814352, -0.392076, 3.314432, 0.6627451, 0, 1, 1,
0.816183, 0.817773, 0.8328579, 0.6666667, 0, 1, 1,
0.8213168, 1.82657, 1.086231, 0.6745098, 0, 1, 1,
0.8229125, -0.6533876, 3.072132, 0.6784314, 0, 1, 1,
0.8234752, 0.2511687, 0.7360659, 0.6862745, 0, 1, 1,
0.8246741, 1.1296, -0.4003381, 0.6901961, 0, 1, 1,
0.8248563, -0.1693103, 1.391365, 0.6980392, 0, 1, 1,
0.8260258, -0.954586, 4.171903, 0.7058824, 0, 1, 1,
0.8262016, -1.529656, 3.525208, 0.7098039, 0, 1, 1,
0.8273674, -0.2321114, 1.027333, 0.7176471, 0, 1, 1,
0.8310073, 2.361558, -0.5011969, 0.7215686, 0, 1, 1,
0.8387488, 0.5043083, 0.9867476, 0.7294118, 0, 1, 1,
0.8402144, 0.6370617, 0.1558239, 0.7333333, 0, 1, 1,
0.8417281, 1.172079, 0.905534, 0.7411765, 0, 1, 1,
0.8444657, 0.9860755, 0.1174731, 0.7450981, 0, 1, 1,
0.8445566, 0.9254763, -0.3253891, 0.7529412, 0, 1, 1,
0.8474606, 1.732729, 0.350538, 0.7568628, 0, 1, 1,
0.8509328, 1.462852, 0.8913556, 0.7647059, 0, 1, 1,
0.851283, -1.008804, 2.628445, 0.7686275, 0, 1, 1,
0.8526489, -0.3272276, 2.379661, 0.7764706, 0, 1, 1,
0.8541181, 0.582056, 0.9272705, 0.7803922, 0, 1, 1,
0.8573558, -1.375664, 3.370856, 0.7882353, 0, 1, 1,
0.863059, 1.193724, 1.203281, 0.7921569, 0, 1, 1,
0.8678351, 0.7084218, -1.175298, 0.8, 0, 1, 1,
0.8678817, 0.2551653, 3.25109, 0.8078431, 0, 1, 1,
0.8717116, -0.02534005, 1.256976, 0.8117647, 0, 1, 1,
0.8750417, 0.0737622, 1.841964, 0.8196079, 0, 1, 1,
0.8758765, -0.1803424, 1.376384, 0.8235294, 0, 1, 1,
0.8768941, 0.7927607, 0.3016068, 0.8313726, 0, 1, 1,
0.8790682, -2.034269, 2.686803, 0.8352941, 0, 1, 1,
0.8863565, -0.4340432, 1.750343, 0.8431373, 0, 1, 1,
0.9065583, -1.385592, 2.92455, 0.8470588, 0, 1, 1,
0.9104654, -0.2716915, 2.030015, 0.854902, 0, 1, 1,
0.9115415, -0.4855904, 2.439272, 0.8588235, 0, 1, 1,
0.9150686, -1.394229, 0.7204013, 0.8666667, 0, 1, 1,
0.9171658, 1.077414, 1.815901, 0.8705882, 0, 1, 1,
0.9196934, -0.07676297, 2.35122, 0.8784314, 0, 1, 1,
0.9262277, -0.9578919, 2.367192, 0.8823529, 0, 1, 1,
0.9286573, -1.122107, 2.288876, 0.8901961, 0, 1, 1,
0.943491, 0.01414239, 2.224117, 0.8941177, 0, 1, 1,
0.947131, 1.913825, -0.5686178, 0.9019608, 0, 1, 1,
0.9475553, -0.3794249, 0.863506, 0.9098039, 0, 1, 1,
0.9494604, 0.02634531, 1.316114, 0.9137255, 0, 1, 1,
0.9510983, 0.1179703, 1.313715, 0.9215686, 0, 1, 1,
0.9526389, -0.1667419, 1.776372, 0.9254902, 0, 1, 1,
0.95516, -0.05424489, -0.3178761, 0.9333333, 0, 1, 1,
0.9687874, 0.847378, 1.868379, 0.9372549, 0, 1, 1,
0.974001, -0.7690721, 2.693542, 0.945098, 0, 1, 1,
0.9813412, 0.6823413, 1.926874, 0.9490196, 0, 1, 1,
0.9840543, -1.241575, 2.611566, 0.9568627, 0, 1, 1,
0.9845703, 0.1496783, 0.9591411, 0.9607843, 0, 1, 1,
0.9850932, 0.1097848, 2.162103, 0.9686275, 0, 1, 1,
0.9859526, 0.2033503, 2.50848, 0.972549, 0, 1, 1,
0.9883188, -0.008669646, 2.364963, 0.9803922, 0, 1, 1,
0.9936459, 0.8868463, 0.6231524, 0.9843137, 0, 1, 1,
0.99649, -1.503114, 4.505085, 0.9921569, 0, 1, 1,
0.9973056, -1.556568, 1.836943, 0.9960784, 0, 1, 1,
0.9991894, 0.9503616, -0.2463298, 1, 0, 0.9960784, 1,
1.011804, -1.259127, 4.190092, 1, 0, 0.9882353, 1,
1.014496, 0.2304094, 1.720595, 1, 0, 0.9843137, 1,
1.019645, 0.6195242, 1.061192, 1, 0, 0.9764706, 1,
1.021367, -0.6707255, 1.4691, 1, 0, 0.972549, 1,
1.021456, -0.5226784, 1.228712, 1, 0, 0.9647059, 1,
1.023041, 0.1874687, 1.283508, 1, 0, 0.9607843, 1,
1.043628, -2.777894, 2.165337, 1, 0, 0.9529412, 1,
1.053841, 0.956616, -0.06542121, 1, 0, 0.9490196, 1,
1.061566, -0.1474996, 1.989799, 1, 0, 0.9411765, 1,
1.065216, 1.134518, 0.5769805, 1, 0, 0.9372549, 1,
1.065643, 0.1958882, 2.434201, 1, 0, 0.9294118, 1,
1.072165, 2.174895, 1.175019, 1, 0, 0.9254902, 1,
1.08464, -0.8073359, 2.837986, 1, 0, 0.9176471, 1,
1.092876, -0.03412635, 0.125104, 1, 0, 0.9137255, 1,
1.095028, 0.8749139, 0.9028966, 1, 0, 0.9058824, 1,
1.095492, -0.4271761, -0.05187957, 1, 0, 0.9019608, 1,
1.102198, 0.8045465, -0.1833842, 1, 0, 0.8941177, 1,
1.105395, 1.288025, -0.6092347, 1, 0, 0.8862745, 1,
1.105572, -1.846701, 2.118001, 1, 0, 0.8823529, 1,
1.120684, -0.6407057, 1.35472, 1, 0, 0.8745098, 1,
1.126621, 0.9611539, -0.7173344, 1, 0, 0.8705882, 1,
1.12822, 0.2451593, 1.464219, 1, 0, 0.8627451, 1,
1.130574, -1.443022, 2.231179, 1, 0, 0.8588235, 1,
1.142042, -0.3364731, 3.23975, 1, 0, 0.8509804, 1,
1.143761, 1.060374, 0.2574945, 1, 0, 0.8470588, 1,
1.145979, -0.2151219, 1.442247, 1, 0, 0.8392157, 1,
1.149238, -1.745759, 2.643211, 1, 0, 0.8352941, 1,
1.149782, -1.241342, 3.409566, 1, 0, 0.827451, 1,
1.157006, 0.1640013, 2.902152, 1, 0, 0.8235294, 1,
1.167107, 0.9546226, 1.706267, 1, 0, 0.8156863, 1,
1.168274, -0.7253083, 1.476438, 1, 0, 0.8117647, 1,
1.173443, -0.76274, 2.988358, 1, 0, 0.8039216, 1,
1.174849, -1.378899, 2.656828, 1, 0, 0.7960784, 1,
1.175477, 0.7600001, 0.4252769, 1, 0, 0.7921569, 1,
1.181351, -1.716493, 3.296906, 1, 0, 0.7843137, 1,
1.187987, -1.134081, 2.553216, 1, 0, 0.7803922, 1,
1.191185, 1.038077, 1.734258, 1, 0, 0.772549, 1,
1.194878, -0.06528368, 1.46036, 1, 0, 0.7686275, 1,
1.198472, 1.463755, 0.2956818, 1, 0, 0.7607843, 1,
1.202988, -1.120286, 1.762592, 1, 0, 0.7568628, 1,
1.207793, -0.04453906, 0.1320097, 1, 0, 0.7490196, 1,
1.208483, -0.4988111, 1.369946, 1, 0, 0.7450981, 1,
1.209992, 1.056217, 1.277319, 1, 0, 0.7372549, 1,
1.214732, -2.030944, 1.970569, 1, 0, 0.7333333, 1,
1.227342, 0.7016315, 1.741085, 1, 0, 0.7254902, 1,
1.229424, -1.757128, 2.191148, 1, 0, 0.7215686, 1,
1.235128, 0.8761652, -0.714569, 1, 0, 0.7137255, 1,
1.244, -0.2672673, 1.983825, 1, 0, 0.7098039, 1,
1.25221, 0.5857897, -0.5853671, 1, 0, 0.7019608, 1,
1.257461, -0.3748185, 2.840566, 1, 0, 0.6941177, 1,
1.258949, -0.1319625, 1.41825, 1, 0, 0.6901961, 1,
1.261402, 1.608777, -1.666944, 1, 0, 0.682353, 1,
1.264838, -0.5832384, 1.279604, 1, 0, 0.6784314, 1,
1.265983, -0.7242545, 1.698577, 1, 0, 0.6705883, 1,
1.267731, -2.534797, 2.193771, 1, 0, 0.6666667, 1,
1.272578, 1.200853, -0.780719, 1, 0, 0.6588235, 1,
1.274045, 0.2751416, 1.80621, 1, 0, 0.654902, 1,
1.281997, -1.554486, 1.587415, 1, 0, 0.6470588, 1,
1.293662, -1.641751, 4.05739, 1, 0, 0.6431373, 1,
1.295781, 0.845291, 1.250672, 1, 0, 0.6352941, 1,
1.311722, 0.04289816, 0.9424182, 1, 0, 0.6313726, 1,
1.317492, -0.5850219, 0.3379145, 1, 0, 0.6235294, 1,
1.326999, 0.6190602, 0.3950439, 1, 0, 0.6196079, 1,
1.330853, 0.2182764, 1.057972, 1, 0, 0.6117647, 1,
1.331289, 0.7660729, 1.051435, 1, 0, 0.6078432, 1,
1.334196, 0.3913985, 1.758453, 1, 0, 0.6, 1,
1.339951, 0.6097245, 1.411765, 1, 0, 0.5921569, 1,
1.340831, 1.704037, -1.386743, 1, 0, 0.5882353, 1,
1.343135, 0.5688648, 2.085267, 1, 0, 0.5803922, 1,
1.343952, 0.6662014, 1.274044, 1, 0, 0.5764706, 1,
1.344394, -0.05167236, 1.20266, 1, 0, 0.5686275, 1,
1.358591, -0.03920618, 2.134554, 1, 0, 0.5647059, 1,
1.363339, 0.5169759, -0.4501535, 1, 0, 0.5568628, 1,
1.370065, -0.1971527, 2.537756, 1, 0, 0.5529412, 1,
1.398261, 0.5059429, 1.186412, 1, 0, 0.5450981, 1,
1.398274, 0.5981522, 1.749874, 1, 0, 0.5411765, 1,
1.398416, -0.4165168, 0.7560664, 1, 0, 0.5333334, 1,
1.402498, 2.063, 0.8529587, 1, 0, 0.5294118, 1,
1.407026, 0.02541319, 2.966031, 1, 0, 0.5215687, 1,
1.410127, 1.619713, 0.5497792, 1, 0, 0.5176471, 1,
1.415983, 0.3648177, 1.168003, 1, 0, 0.509804, 1,
1.417553, 0.1593079, 0.3903355, 1, 0, 0.5058824, 1,
1.417788, -0.3473033, 4.50114, 1, 0, 0.4980392, 1,
1.418355, 0.2258326, 2.769879, 1, 0, 0.4901961, 1,
1.420323, -0.2816528, 1.776914, 1, 0, 0.4862745, 1,
1.423554, -1.304442, 0.9529185, 1, 0, 0.4784314, 1,
1.43083, 0.1107294, 2.899472, 1, 0, 0.4745098, 1,
1.450808, 0.3225968, 1.434665, 1, 0, 0.4666667, 1,
1.451225, -0.5592198, 3.289739, 1, 0, 0.4627451, 1,
1.452691, 1.191404, 1.018521, 1, 0, 0.454902, 1,
1.470385, 0.106315, 1.84996, 1, 0, 0.4509804, 1,
1.475507, -0.8847838, 2.017972, 1, 0, 0.4431373, 1,
1.475562, 1.500313, 1.312487, 1, 0, 0.4392157, 1,
1.479049, -1.09534, 1.60436, 1, 0, 0.4313726, 1,
1.488128, -1.026354, 1.136602, 1, 0, 0.427451, 1,
1.492657, -0.9135259, 0.6313399, 1, 0, 0.4196078, 1,
1.498392, 1.08007, 0.6082626, 1, 0, 0.4156863, 1,
1.498532, 0.09310892, 0.657373, 1, 0, 0.4078431, 1,
1.528228, 0.5054048, 2.923886, 1, 0, 0.4039216, 1,
1.532241, -0.1506848, 0.8739421, 1, 0, 0.3960784, 1,
1.548386, -1.199526, 2.043491, 1, 0, 0.3882353, 1,
1.552186, 2.517714, 0.3897048, 1, 0, 0.3843137, 1,
1.55865, -0.2273682, 0.626828, 1, 0, 0.3764706, 1,
1.562491, -2.329428, 1.512305, 1, 0, 0.372549, 1,
1.565813, -0.9299111, 2.344648, 1, 0, 0.3647059, 1,
1.598321, -1.554221, 3.185764, 1, 0, 0.3607843, 1,
1.606561, 0.7189814, 1.537967, 1, 0, 0.3529412, 1,
1.608597, -0.9566001, 2.75377, 1, 0, 0.3490196, 1,
1.61996, -0.4757019, 2.283488, 1, 0, 0.3411765, 1,
1.624871, 0.8043625, -0.09801758, 1, 0, 0.3372549, 1,
1.633838, -1.525167, 0.8902946, 1, 0, 0.3294118, 1,
1.636752, -0.5906392, 2.439712, 1, 0, 0.3254902, 1,
1.639186, -2.016458, 2.053033, 1, 0, 0.3176471, 1,
1.644819, 0.1547442, 1.365636, 1, 0, 0.3137255, 1,
1.6551, -0.9772928, 0.7262, 1, 0, 0.3058824, 1,
1.659841, 0.1501805, 2.691797, 1, 0, 0.2980392, 1,
1.667418, -0.8301718, 2.89577, 1, 0, 0.2941177, 1,
1.675843, 0.8230884, 1.436481, 1, 0, 0.2862745, 1,
1.705376, 1.02152, 1.120241, 1, 0, 0.282353, 1,
1.711481, 0.4169289, 0.6790401, 1, 0, 0.2745098, 1,
1.713279, -0.04487124, 3.261154, 1, 0, 0.2705882, 1,
1.717362, -2.227851, 3.169353, 1, 0, 0.2627451, 1,
1.717729, 1.170687, 0.1185292, 1, 0, 0.2588235, 1,
1.726237, -0.8588558, 2.224247, 1, 0, 0.2509804, 1,
1.733663, 0.5194137, 1.319582, 1, 0, 0.2470588, 1,
1.740505, 1.571775, 2.450667, 1, 0, 0.2392157, 1,
1.741553, -1.281539, 1.636291, 1, 0, 0.2352941, 1,
1.753696, 1.379959, 0.9893451, 1, 0, 0.227451, 1,
1.78855, 0.9005241, 0.637461, 1, 0, 0.2235294, 1,
1.800591, -1.40022, 3.480948, 1, 0, 0.2156863, 1,
1.81074, -1.606213, 3.717639, 1, 0, 0.2117647, 1,
1.821692, -0.8783582, 3.705438, 1, 0, 0.2039216, 1,
1.828903, -0.1684743, 1.121009, 1, 0, 0.1960784, 1,
1.830838, -1.186604, 2.683593, 1, 0, 0.1921569, 1,
1.844121, -0.8338066, 1.16428, 1, 0, 0.1843137, 1,
1.845509, 0.7797448, 2.524968, 1, 0, 0.1803922, 1,
1.912479, -1.151291, 1.314927, 1, 0, 0.172549, 1,
1.913775, -0.1040492, 0.6171508, 1, 0, 0.1686275, 1,
1.917886, 0.1277558, 0.3728645, 1, 0, 0.1607843, 1,
1.933003, -0.8665946, 0.5823401, 1, 0, 0.1568628, 1,
1.944284, 1.129354, 0.3913784, 1, 0, 0.1490196, 1,
1.948459, -0.3307036, 0.1950314, 1, 0, 0.145098, 1,
1.961852, 0.4439984, 1.374296, 1, 0, 0.1372549, 1,
1.986097, 2.180787, 0.495689, 1, 0, 0.1333333, 1,
2.026275, 1.695209, -0.3010092, 1, 0, 0.1254902, 1,
2.05284, -1.852348, 2.603793, 1, 0, 0.1215686, 1,
2.055232, 2.381416, 1.708678, 1, 0, 0.1137255, 1,
2.07364, 0.01035936, 1.906188, 1, 0, 0.1098039, 1,
2.085669, 0.4007812, 2.371041, 1, 0, 0.1019608, 1,
2.124174, -0.3618049, 0.1133474, 1, 0, 0.09411765, 1,
2.181455, -1.053788, 0.7426749, 1, 0, 0.09019608, 1,
2.191177, -0.9373909, 3.308499, 1, 0, 0.08235294, 1,
2.20283, -1.504407, 2.131203, 1, 0, 0.07843138, 1,
2.241738, 0.2112428, 0.1040704, 1, 0, 0.07058824, 1,
2.306965, -0.4907792, 3.095322, 1, 0, 0.06666667, 1,
2.361417, 0.6622261, 0.1723231, 1, 0, 0.05882353, 1,
2.415364, 1.882467, 1.424479, 1, 0, 0.05490196, 1,
2.440535, -0.5253659, 1.419526, 1, 0, 0.04705882, 1,
2.501744, -0.1835443, -0.5007977, 1, 0, 0.04313726, 1,
2.524633, -0.5472229, 2.15311, 1, 0, 0.03529412, 1,
2.547123, -0.1475311, 1.515029, 1, 0, 0.03137255, 1,
2.666926, -1.028078, 3.168146, 1, 0, 0.02352941, 1,
2.717053, 0.8937024, 0.7550462, 1, 0, 0.01960784, 1,
2.844402, -0.3470329, 1.455489, 1, 0, 0.01176471, 1,
3.449999, -0.04696651, 1.686926, 1, 0, 0.007843138, 1
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
0.1437722, -3.758172, -7.310703, 0, -0.5, 0.5, 0.5,
0.1437722, -3.758172, -7.310703, 1, -0.5, 0.5, 0.5,
0.1437722, -3.758172, -7.310703, 1, 1.5, 0.5, 0.5,
0.1437722, -3.758172, -7.310703, 0, 1.5, 0.5, 0.5
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
-4.283265, 0.113784, -7.310703, 0, -0.5, 0.5, 0.5,
-4.283265, 0.113784, -7.310703, 1, -0.5, 0.5, 0.5,
-4.283265, 0.113784, -7.310703, 1, 1.5, 0.5, 0.5,
-4.283265, 0.113784, -7.310703, 0, 1.5, 0.5, 0.5
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
-4.283265, -3.758172, 0.03054976, 0, -0.5, 0.5, 0.5,
-4.283265, -3.758172, 0.03054976, 1, -0.5, 0.5, 0.5,
-4.283265, -3.758172, 0.03054976, 1, 1.5, 0.5, 0.5,
-4.283265, -3.758172, 0.03054976, 0, 1.5, 0.5, 0.5
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
-3, -2.864644, -5.616568,
3, -2.864644, -5.616568,
-3, -2.864644, -5.616568,
-3, -3.013565, -5.898924,
-2, -2.864644, -5.616568,
-2, -3.013565, -5.898924,
-1, -2.864644, -5.616568,
-1, -3.013565, -5.898924,
0, -2.864644, -5.616568,
0, -3.013565, -5.898924,
1, -2.864644, -5.616568,
1, -3.013565, -5.898924,
2, -2.864644, -5.616568,
2, -3.013565, -5.898924,
3, -2.864644, -5.616568,
3, -3.013565, -5.898924
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
-3, -3.311408, -6.463635, 0, -0.5, 0.5, 0.5,
-3, -3.311408, -6.463635, 1, -0.5, 0.5, 0.5,
-3, -3.311408, -6.463635, 1, 1.5, 0.5, 0.5,
-3, -3.311408, -6.463635, 0, 1.5, 0.5, 0.5,
-2, -3.311408, -6.463635, 0, -0.5, 0.5, 0.5,
-2, -3.311408, -6.463635, 1, -0.5, 0.5, 0.5,
-2, -3.311408, -6.463635, 1, 1.5, 0.5, 0.5,
-2, -3.311408, -6.463635, 0, 1.5, 0.5, 0.5,
-1, -3.311408, -6.463635, 0, -0.5, 0.5, 0.5,
-1, -3.311408, -6.463635, 1, -0.5, 0.5, 0.5,
-1, -3.311408, -6.463635, 1, 1.5, 0.5, 0.5,
-1, -3.311408, -6.463635, 0, 1.5, 0.5, 0.5,
0, -3.311408, -6.463635, 0, -0.5, 0.5, 0.5,
0, -3.311408, -6.463635, 1, -0.5, 0.5, 0.5,
0, -3.311408, -6.463635, 1, 1.5, 0.5, 0.5,
0, -3.311408, -6.463635, 0, 1.5, 0.5, 0.5,
1, -3.311408, -6.463635, 0, -0.5, 0.5, 0.5,
1, -3.311408, -6.463635, 1, -0.5, 0.5, 0.5,
1, -3.311408, -6.463635, 1, 1.5, 0.5, 0.5,
1, -3.311408, -6.463635, 0, 1.5, 0.5, 0.5,
2, -3.311408, -6.463635, 0, -0.5, 0.5, 0.5,
2, -3.311408, -6.463635, 1, -0.5, 0.5, 0.5,
2, -3.311408, -6.463635, 1, 1.5, 0.5, 0.5,
2, -3.311408, -6.463635, 0, 1.5, 0.5, 0.5,
3, -3.311408, -6.463635, 0, -0.5, 0.5, 0.5,
3, -3.311408, -6.463635, 1, -0.5, 0.5, 0.5,
3, -3.311408, -6.463635, 1, 1.5, 0.5, 0.5,
3, -3.311408, -6.463635, 0, 1.5, 0.5, 0.5
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
-3.261641, -2, -5.616568,
-3.261641, 3, -5.616568,
-3.261641, -2, -5.616568,
-3.431912, -2, -5.898924,
-3.261641, -1, -5.616568,
-3.431912, -1, -5.898924,
-3.261641, 0, -5.616568,
-3.431912, 0, -5.898924,
-3.261641, 1, -5.616568,
-3.431912, 1, -5.898924,
-3.261641, 2, -5.616568,
-3.431912, 2, -5.898924,
-3.261641, 3, -5.616568,
-3.431912, 3, -5.898924
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
-3.772453, -2, -6.463635, 0, -0.5, 0.5, 0.5,
-3.772453, -2, -6.463635, 1, -0.5, 0.5, 0.5,
-3.772453, -2, -6.463635, 1, 1.5, 0.5, 0.5,
-3.772453, -2, -6.463635, 0, 1.5, 0.5, 0.5,
-3.772453, -1, -6.463635, 0, -0.5, 0.5, 0.5,
-3.772453, -1, -6.463635, 1, -0.5, 0.5, 0.5,
-3.772453, -1, -6.463635, 1, 1.5, 0.5, 0.5,
-3.772453, -1, -6.463635, 0, 1.5, 0.5, 0.5,
-3.772453, 0, -6.463635, 0, -0.5, 0.5, 0.5,
-3.772453, 0, -6.463635, 1, -0.5, 0.5, 0.5,
-3.772453, 0, -6.463635, 1, 1.5, 0.5, 0.5,
-3.772453, 0, -6.463635, 0, 1.5, 0.5, 0.5,
-3.772453, 1, -6.463635, 0, -0.5, 0.5, 0.5,
-3.772453, 1, -6.463635, 1, -0.5, 0.5, 0.5,
-3.772453, 1, -6.463635, 1, 1.5, 0.5, 0.5,
-3.772453, 1, -6.463635, 0, 1.5, 0.5, 0.5,
-3.772453, 2, -6.463635, 0, -0.5, 0.5, 0.5,
-3.772453, 2, -6.463635, 1, -0.5, 0.5, 0.5,
-3.772453, 2, -6.463635, 1, 1.5, 0.5, 0.5,
-3.772453, 2, -6.463635, 0, 1.5, 0.5, 0.5,
-3.772453, 3, -6.463635, 0, -0.5, 0.5, 0.5,
-3.772453, 3, -6.463635, 1, -0.5, 0.5, 0.5,
-3.772453, 3, -6.463635, 1, 1.5, 0.5, 0.5,
-3.772453, 3, -6.463635, 0, 1.5, 0.5, 0.5
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
-3.261641, -2.864644, -4,
-3.261641, -2.864644, 4,
-3.261641, -2.864644, -4,
-3.431912, -3.013565, -4,
-3.261641, -2.864644, -2,
-3.431912, -3.013565, -2,
-3.261641, -2.864644, 0,
-3.431912, -3.013565, 0,
-3.261641, -2.864644, 2,
-3.431912, -3.013565, 2,
-3.261641, -2.864644, 4,
-3.431912, -3.013565, 4
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
-3.772453, -3.311408, -4, 0, -0.5, 0.5, 0.5,
-3.772453, -3.311408, -4, 1, -0.5, 0.5, 0.5,
-3.772453, -3.311408, -4, 1, 1.5, 0.5, 0.5,
-3.772453, -3.311408, -4, 0, 1.5, 0.5, 0.5,
-3.772453, -3.311408, -2, 0, -0.5, 0.5, 0.5,
-3.772453, -3.311408, -2, 1, -0.5, 0.5, 0.5,
-3.772453, -3.311408, -2, 1, 1.5, 0.5, 0.5,
-3.772453, -3.311408, -2, 0, 1.5, 0.5, 0.5,
-3.772453, -3.311408, 0, 0, -0.5, 0.5, 0.5,
-3.772453, -3.311408, 0, 1, -0.5, 0.5, 0.5,
-3.772453, -3.311408, 0, 1, 1.5, 0.5, 0.5,
-3.772453, -3.311408, 0, 0, 1.5, 0.5, 0.5,
-3.772453, -3.311408, 2, 0, -0.5, 0.5, 0.5,
-3.772453, -3.311408, 2, 1, -0.5, 0.5, 0.5,
-3.772453, -3.311408, 2, 1, 1.5, 0.5, 0.5,
-3.772453, -3.311408, 2, 0, 1.5, 0.5, 0.5,
-3.772453, -3.311408, 4, 0, -0.5, 0.5, 0.5,
-3.772453, -3.311408, 4, 1, -0.5, 0.5, 0.5,
-3.772453, -3.311408, 4, 1, 1.5, 0.5, 0.5,
-3.772453, -3.311408, 4, 0, 1.5, 0.5, 0.5
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
-3.261641, -2.864644, -5.616568,
-3.261641, 3.092212, -5.616568,
-3.261641, -2.864644, 5.677668,
-3.261641, 3.092212, 5.677668,
-3.261641, -2.864644, -5.616568,
-3.261641, -2.864644, 5.677668,
-3.261641, 3.092212, -5.616568,
-3.261641, 3.092212, 5.677668,
-3.261641, -2.864644, -5.616568,
3.549186, -2.864644, -5.616568,
-3.261641, -2.864644, 5.677668,
3.549186, -2.864644, 5.677668,
-3.261641, 3.092212, -5.616568,
3.549186, 3.092212, -5.616568,
-3.261641, 3.092212, 5.677668,
3.549186, 3.092212, 5.677668,
3.549186, -2.864644, -5.616568,
3.549186, 3.092212, -5.616568,
3.549186, -2.864644, 5.677668,
3.549186, 3.092212, 5.677668,
3.549186, -2.864644, -5.616568,
3.549186, -2.864644, 5.677668,
3.549186, 3.092212, -5.616568,
3.549186, 3.092212, 5.677668
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
var radius = 7.727628;
var distance = 34.38109;
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
mvMatrix.translate( -0.1437722, -0.113784, -0.03054976 );
mvMatrix.scale( 1.226762, 1.40263, 0.7397811 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.38109);
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
vamidothion<-read.table("vamidothion.xyz")
```

```
## Error in read.table("vamidothion.xyz"): no lines available in input
```

```r
x<-vamidothion$V2
```

```
## Error in eval(expr, envir, enclos): object 'vamidothion' not found
```

```r
y<-vamidothion$V3
```

```
## Error in eval(expr, envir, enclos): object 'vamidothion' not found
```

```r
z<-vamidothion$V4
```

```
## Error in eval(expr, envir, enclos): object 'vamidothion' not found
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
-3.162454, 0.6375147, -3.230538, 0, 0, 1, 1, 1,
-3.1403, -0.1945934, -2.080987, 1, 0, 0, 1, 1,
-3.086603, -0.3167479, -2.168694, 1, 0, 0, 1, 1,
-3.030445, 0.4290784, -0.8934178, 1, 0, 0, 1, 1,
-2.766172, -0.1101638, -0.7548174, 1, 0, 0, 1, 1,
-2.6443, -0.4663224, -0.9868834, 1, 0, 0, 1, 1,
-2.576895, 0.004637042, -0.4483862, 0, 0, 0, 1, 1,
-2.496238, 0.2205625, 0.265764, 0, 0, 0, 1, 1,
-2.405588, 1.116455, -2.481267, 0, 0, 0, 1, 1,
-2.293319, -0.7764255, -1.547521, 0, 0, 0, 1, 1,
-2.254883, -0.6240646, -0.7610424, 0, 0, 0, 1, 1,
-2.253878, 0.2641265, -0.5106897, 0, 0, 0, 1, 1,
-2.215556, 1.165835, -2.712216, 0, 0, 0, 1, 1,
-2.194168, -0.2530303, -0.1066496, 1, 1, 1, 1, 1,
-2.16683, -0.7179097, -1.1741, 1, 1, 1, 1, 1,
-2.161727, -1.186305, -2.669316, 1, 1, 1, 1, 1,
-2.131349, 0.5474614, -0.06607945, 1, 1, 1, 1, 1,
-2.088227, -1.751361, -0.8831189, 1, 1, 1, 1, 1,
-2.087644, -1.550208, -2.428597, 1, 1, 1, 1, 1,
-2.082696, -1.119155, -0.5623001, 1, 1, 1, 1, 1,
-2.077579, -2.262193, -3.599721, 1, 1, 1, 1, 1,
-2.041071, 0.02388577, -1.137926, 1, 1, 1, 1, 1,
-2.021099, -1.236921, -2.724484, 1, 1, 1, 1, 1,
-2.004765, 0.7027435, -1.736288, 1, 1, 1, 1, 1,
-2.003819, -0.1643398, -1.118875, 1, 1, 1, 1, 1,
-1.994829, 0.5403935, -1.535058, 1, 1, 1, 1, 1,
-1.990218, -0.7742745, -1.497721, 1, 1, 1, 1, 1,
-1.93165, 0.5819519, -1.683964, 1, 1, 1, 1, 1,
-1.929686, -0.4794117, -3.940517, 0, 0, 1, 1, 1,
-1.910702, 1.140287, -1.212659, 1, 0, 0, 1, 1,
-1.897745, 1.82273, -0.1953198, 1, 0, 0, 1, 1,
-1.875025, -0.7399607, -2.269705, 1, 0, 0, 1, 1,
-1.866278, -1.234283, -0.9863119, 1, 0, 0, 1, 1,
-1.841449, -1.069986, -2.846142, 1, 0, 0, 1, 1,
-1.836494, 0.3601392, -0.8261953, 0, 0, 0, 1, 1,
-1.834581, 2.334845, -0.07987052, 0, 0, 0, 1, 1,
-1.831745, 1.794754, -2.265657, 0, 0, 0, 1, 1,
-1.83147, -0.2146329, -1.961088, 0, 0, 0, 1, 1,
-1.830322, -0.1577934, -0.8608184, 0, 0, 0, 1, 1,
-1.820503, -0.1343518, -2.078609, 0, 0, 0, 1, 1,
-1.784184, 0.6349011, -2.238951, 0, 0, 0, 1, 1,
-1.777867, 0.1344223, -1.092059, 1, 1, 1, 1, 1,
-1.755995, -0.9163793, -3.808245, 1, 1, 1, 1, 1,
-1.730089, 0.1518749, -0.7285713, 1, 1, 1, 1, 1,
-1.716662, -0.7860476, -2.259865, 1, 1, 1, 1, 1,
-1.70301, -2.71871, -2.105521, 1, 1, 1, 1, 1,
-1.695399, 0.8052023, 0.3674397, 1, 1, 1, 1, 1,
-1.68567, -1.211064, -2.186665, 1, 1, 1, 1, 1,
-1.665735, -0.8973607, -2.378367, 1, 1, 1, 1, 1,
-1.601711, -0.5294139, -2.809366, 1, 1, 1, 1, 1,
-1.595219, 0.4631551, -1.855843, 1, 1, 1, 1, 1,
-1.56024, 0.6481956, -1.844035, 1, 1, 1, 1, 1,
-1.514366, -0.9052964, 0.1798833, 1, 1, 1, 1, 1,
-1.509931, 0.2743126, -1.334029, 1, 1, 1, 1, 1,
-1.507176, 1.453503, -0.5217221, 1, 1, 1, 1, 1,
-1.486174, -0.6617171, -0.9923909, 1, 1, 1, 1, 1,
-1.467469, 0.4963526, -1.337424, 0, 0, 1, 1, 1,
-1.45947, 0.8584076, -2.422792, 1, 0, 0, 1, 1,
-1.447647, 0.2779054, -1.818064, 1, 0, 0, 1, 1,
-1.446892, 0.733346, 0.4707555, 1, 0, 0, 1, 1,
-1.44355, 0.7284759, -0.7841548, 1, 0, 0, 1, 1,
-1.443215, -1.043846, -2.280134, 1, 0, 0, 1, 1,
-1.437432, 0.02880117, -0.5057286, 0, 0, 0, 1, 1,
-1.434789, -0.4864802, -4.390864, 0, 0, 0, 1, 1,
-1.428044, -0.4339759, -2.433334, 0, 0, 0, 1, 1,
-1.406464, 1.331828, -0.5479791, 0, 0, 0, 1, 1,
-1.401997, -0.8787147, -1.930041, 0, 0, 0, 1, 1,
-1.400002, -2.093022, -2.698083, 0, 0, 0, 1, 1,
-1.39888, 1.131129, -1.795674, 0, 0, 0, 1, 1,
-1.395081, -1.178928, -1.921002, 1, 1, 1, 1, 1,
-1.394699, 0.223639, -1.636064, 1, 1, 1, 1, 1,
-1.383824, 0.07445559, -4.703801, 1, 1, 1, 1, 1,
-1.383352, 2.112781, -0.6634942, 1, 1, 1, 1, 1,
-1.381736, -1.126342, -2.035237, 1, 1, 1, 1, 1,
-1.365333, 1.32691, -2.574051, 1, 1, 1, 1, 1,
-1.350179, 0.1973435, -0.07957984, 1, 1, 1, 1, 1,
-1.349829, 0.02434258, -2.132811, 1, 1, 1, 1, 1,
-1.340861, 0.6461723, -2.800385, 1, 1, 1, 1, 1,
-1.330307, 0.8217676, -0.6711841, 1, 1, 1, 1, 1,
-1.330196, -1.302682, -2.128086, 1, 1, 1, 1, 1,
-1.325636, 0.04040631, -1.093038, 1, 1, 1, 1, 1,
-1.325146, -1.326801, -2.915884, 1, 1, 1, 1, 1,
-1.323594, 0.6259647, -0.841567, 1, 1, 1, 1, 1,
-1.32119, -1.017888, -1.977822, 1, 1, 1, 1, 1,
-1.305279, 0.03285159, 0.325949, 0, 0, 1, 1, 1,
-1.302969, -1.770726, -2.780285, 1, 0, 0, 1, 1,
-1.290022, 0.6357678, -3.235782, 1, 0, 0, 1, 1,
-1.289617, 0.01660531, -2.630477, 1, 0, 0, 1, 1,
-1.288631, 0.3408587, -1.208882, 1, 0, 0, 1, 1,
-1.278445, -0.1343343, -1.576834, 1, 0, 0, 1, 1,
-1.275212, 0.252208, -1.585384, 0, 0, 0, 1, 1,
-1.271916, -0.7513194, -2.389061, 0, 0, 0, 1, 1,
-1.271441, 0.4989222, -0.8802292, 0, 0, 0, 1, 1,
-1.271399, -2.267184, -1.172048, 0, 0, 0, 1, 1,
-1.251296, 0.5573454, -2.740422, 0, 0, 0, 1, 1,
-1.249404, -0.3265706, -1.587773, 0, 0, 0, 1, 1,
-1.246138, -1.272047, -4.692898, 0, 0, 0, 1, 1,
-1.236709, 0.9526702, -0.5833469, 1, 1, 1, 1, 1,
-1.233722, -0.9048947, -2.62569, 1, 1, 1, 1, 1,
-1.232586, 0.2110605, -0.758011, 1, 1, 1, 1, 1,
-1.227726, 0.9519386, -0.9414288, 1, 1, 1, 1, 1,
-1.224103, 0.9501231, -0.1705573, 1, 1, 1, 1, 1,
-1.218876, -0.8091536, -3.620084, 1, 1, 1, 1, 1,
-1.216612, -0.4115455, -1.898418, 1, 1, 1, 1, 1,
-1.216341, 0.4890761, -1.286139, 1, 1, 1, 1, 1,
-1.214004, 1.206752, 1.537009, 1, 1, 1, 1, 1,
-1.207345, 0.5481352, -0.4524176, 1, 1, 1, 1, 1,
-1.206377, -0.1082463, -3.439817, 1, 1, 1, 1, 1,
-1.201531, 0.3210456, -1.026952, 1, 1, 1, 1, 1,
-1.201, 0.8688152, -0.5857763, 1, 1, 1, 1, 1,
-1.200781, -0.2795903, -3.362857, 1, 1, 1, 1, 1,
-1.196497, 0.9301712, -1.379455, 1, 1, 1, 1, 1,
-1.193615, -0.1125627, -1.262374, 0, 0, 1, 1, 1,
-1.193152, 0.545933, -0.7298862, 1, 0, 0, 1, 1,
-1.175803, 0.5388392, -0.8874573, 1, 0, 0, 1, 1,
-1.173114, 1.569456, -1.677217, 1, 0, 0, 1, 1,
-1.171137, 1.021481, 0.7203977, 1, 0, 0, 1, 1,
-1.170019, 0.3465712, -1.275957, 1, 0, 0, 1, 1,
-1.166983, 0.5021472, -2.159025, 0, 0, 0, 1, 1,
-1.164836, 0.367728, 0.03796922, 0, 0, 0, 1, 1,
-1.159913, 0.01046759, -1.211218, 0, 0, 0, 1, 1,
-1.14461, -0.5634722, -1.725937, 0, 0, 0, 1, 1,
-1.132261, 0.9477187, -1.348093, 0, 0, 0, 1, 1,
-1.13135, 0.8220246, -0.127847, 0, 0, 0, 1, 1,
-1.128531, -0.3311879, -1.653175, 0, 0, 0, 1, 1,
-1.127425, -0.9210117, -1.32995, 1, 1, 1, 1, 1,
-1.119251, 0.1673222, -1.376834, 1, 1, 1, 1, 1,
-1.118275, 0.3354466, -2.137335, 1, 1, 1, 1, 1,
-1.117797, 2.386523, -1.655225, 1, 1, 1, 1, 1,
-1.105686, -2.408795, -2.093292, 1, 1, 1, 1, 1,
-1.09907, -1.876722, -3.714529, 1, 1, 1, 1, 1,
-1.098881, -2.004969, -3.776468, 1, 1, 1, 1, 1,
-1.097053, -0.2062314, -2.858281, 1, 1, 1, 1, 1,
-1.094917, -0.9794927, -0.9344389, 1, 1, 1, 1, 1,
-1.089453, 2.347747, 0.1797936, 1, 1, 1, 1, 1,
-1.088895, 0.5852993, -0.04262648, 1, 1, 1, 1, 1,
-1.071581, -0.2022864, -0.9292922, 1, 1, 1, 1, 1,
-1.071193, 0.1882311, -0.3514709, 1, 1, 1, 1, 1,
-1.065591, -0.6741216, -2.070053, 1, 1, 1, 1, 1,
-1.065522, 0.4018669, -0.9416293, 1, 1, 1, 1, 1,
-1.065333, -0.8415004, -1.891603, 0, 0, 1, 1, 1,
-1.064975, -1.277127, -2.1419, 1, 0, 0, 1, 1,
-1.059105, 0.4538302, -2.381058, 1, 0, 0, 1, 1,
-1.056393, -2.400545, -2.832082, 1, 0, 0, 1, 1,
-1.055315, 0.01915796, -3.591576, 1, 0, 0, 1, 1,
-1.045168, 2.146315, -0.6428876, 1, 0, 0, 1, 1,
-1.044847, -1.874547, -2.616082, 0, 0, 0, 1, 1,
-1.044291, 1.431509, -1.80646, 0, 0, 0, 1, 1,
-1.043144, 0.2388496, -1.766181, 0, 0, 0, 1, 1,
-1.042469, -0.1876158, -1.524682, 0, 0, 0, 1, 1,
-1.03142, -0.2278896, -1.371971, 0, 0, 0, 1, 1,
-1.03139, -1.098778, -1.436693, 0, 0, 0, 1, 1,
-1.02938, 1.079701, -0.3818696, 0, 0, 0, 1, 1,
-1.02206, -0.6499442, -3.167831, 1, 1, 1, 1, 1,
-1.013768, -0.1222652, -3.462071, 1, 1, 1, 1, 1,
-1.012303, 0.7270367, -1.726522, 1, 1, 1, 1, 1,
-1.008971, 0.7162402, 0.05099716, 1, 1, 1, 1, 1,
-1.006032, -0.8431967, -3.331328, 1, 1, 1, 1, 1,
-1.004712, 1.223402, -0.116638, 1, 1, 1, 1, 1,
-1.004551, 0.8855466, -2.661432, 1, 1, 1, 1, 1,
-1.003459, -0.6474526, -2.97056, 1, 1, 1, 1, 1,
-0.9983006, -0.1451672, -1.162224, 1, 1, 1, 1, 1,
-0.9920356, -0.2558625, -2.870194, 1, 1, 1, 1, 1,
-0.9872731, -0.4599356, -0.9205337, 1, 1, 1, 1, 1,
-0.9796016, 1.218037, -1.497807, 1, 1, 1, 1, 1,
-0.9785545, -0.07364394, -1.125946, 1, 1, 1, 1, 1,
-0.9764749, -0.5723844, -0.6237971, 1, 1, 1, 1, 1,
-0.9742641, -0.2953144, -2.255395, 1, 1, 1, 1, 1,
-0.96865, -0.3837618, -0.7147175, 0, 0, 1, 1, 1,
-0.9658325, 0.9408795, -1.191625, 1, 0, 0, 1, 1,
-0.9597251, 2.34481, -1.717175, 1, 0, 0, 1, 1,
-0.9532704, 0.3270116, -1.235334, 1, 0, 0, 1, 1,
-0.9375651, -0.3227687, -1.970843, 1, 0, 0, 1, 1,
-0.9288191, -0.1530707, -1.80315, 1, 0, 0, 1, 1,
-0.9256017, -1.556933, -2.662801, 0, 0, 0, 1, 1,
-0.9187932, -0.4234272, -2.207632, 0, 0, 0, 1, 1,
-0.9181215, -0.8299616, -2.596144, 0, 0, 0, 1, 1,
-0.9164569, 1.821951, -0.1273109, 0, 0, 0, 1, 1,
-0.9056385, -0.09460419, -0.7441086, 0, 0, 0, 1, 1,
-0.9020123, 0.7846249, -1.262991, 0, 0, 0, 1, 1,
-0.9012066, 0.1539618, -2.844805, 0, 0, 0, 1, 1,
-0.9010935, 1.067818, -0.6006371, 1, 1, 1, 1, 1,
-0.89044, -0.2278723, -1.340959, 1, 1, 1, 1, 1,
-0.8877801, -0.9997026, -3.011846, 1, 1, 1, 1, 1,
-0.8877249, 0.41593, -2.609394, 1, 1, 1, 1, 1,
-0.8861061, -0.2298108, -4.594146, 1, 1, 1, 1, 1,
-0.8799827, -0.366177, -1.459906, 1, 1, 1, 1, 1,
-0.8795874, 0.5820274, -0.454738, 1, 1, 1, 1, 1,
-0.8737959, -1.420551, -2.805912, 1, 1, 1, 1, 1,
-0.8713982, -0.1977298, -3.136452, 1, 1, 1, 1, 1,
-0.8656414, -0.3053416, -2.632744, 1, 1, 1, 1, 1,
-0.8644206, -1.457662, -1.626829, 1, 1, 1, 1, 1,
-0.8529303, -0.6939201, -2.863868, 1, 1, 1, 1, 1,
-0.8473105, 0.4963495, -1.419115, 1, 1, 1, 1, 1,
-0.8464725, -0.07343294, -0.7119537, 1, 1, 1, 1, 1,
-0.8409247, 1.571618, 0.8496456, 1, 1, 1, 1, 1,
-0.8398993, -1.085066, -3.993582, 0, 0, 1, 1, 1,
-0.83477, 0.002890607, -3.701381, 1, 0, 0, 1, 1,
-0.8344266, 0.1932293, -0.6523399, 1, 0, 0, 1, 1,
-0.8286348, 0.1496747, -1.659194, 1, 0, 0, 1, 1,
-0.8279538, -0.382139, -1.336941, 1, 0, 0, 1, 1,
-0.8258852, -1.647117, -4.121284, 1, 0, 0, 1, 1,
-0.822256, 0.5961226, 0.08889632, 0, 0, 0, 1, 1,
-0.8193263, -0.7017105, -1.376095, 0, 0, 0, 1, 1,
-0.8175913, 0.6122579, -1.479524, 0, 0, 0, 1, 1,
-0.8122446, -1.65038, -1.748933, 0, 0, 0, 1, 1,
-0.8081152, 0.08529025, -0.7725497, 0, 0, 0, 1, 1,
-0.7976645, 0.05826824, -3.318755, 0, 0, 0, 1, 1,
-0.7952364, 1.35156, 0.7919841, 0, 0, 0, 1, 1,
-0.7908903, 0.9240107, -1.951856, 1, 1, 1, 1, 1,
-0.7875491, -0.1935472, -0.01676014, 1, 1, 1, 1, 1,
-0.7820693, 0.6226087, 0.1241674, 1, 1, 1, 1, 1,
-0.7770252, -0.7820635, -3.303201, 1, 1, 1, 1, 1,
-0.776513, 0.01961789, -0.9610296, 1, 1, 1, 1, 1,
-0.7722017, -0.823108, -1.869533, 1, 1, 1, 1, 1,
-0.7680159, -0.04680318, -0.8735262, 1, 1, 1, 1, 1,
-0.7667704, 0.9205059, 0.4419762, 1, 1, 1, 1, 1,
-0.7615205, 1.601615, -1.396388, 1, 1, 1, 1, 1,
-0.7611268, 1.012319, 1.388281, 1, 1, 1, 1, 1,
-0.7582272, -0.02501829, -1.568498, 1, 1, 1, 1, 1,
-0.7564862, -0.5815381, -1.656022, 1, 1, 1, 1, 1,
-0.7550302, -0.2561655, -2.308282, 1, 1, 1, 1, 1,
-0.7487621, -0.4233654, -0.356783, 1, 1, 1, 1, 1,
-0.7455311, -1.830823, -0.9499842, 1, 1, 1, 1, 1,
-0.7431296, -0.4846187, -1.922814, 0, 0, 1, 1, 1,
-0.7359121, -0.01816078, -1.023697, 1, 0, 0, 1, 1,
-0.7338272, 0.2345535, -2.41942, 1, 0, 0, 1, 1,
-0.7329262, -0.2886727, -2.006507, 1, 0, 0, 1, 1,
-0.7318103, 1.571997, 1.548707, 1, 0, 0, 1, 1,
-0.7244326, -0.6413375, -2.995706, 1, 0, 0, 1, 1,
-0.7241457, 0.521156, -1.095, 0, 0, 0, 1, 1,
-0.7182943, -1.045641, -1.321518, 0, 0, 0, 1, 1,
-0.7171488, -0.3362262, -1.45927, 0, 0, 0, 1, 1,
-0.716287, -0.3736808, -0.8575581, 0, 0, 0, 1, 1,
-0.7142894, 0.9473791, -0.2763816, 0, 0, 0, 1, 1,
-0.7142656, -0.9631279, -2.911593, 0, 0, 0, 1, 1,
-0.7116026, 0.498509, -0.5614784, 0, 0, 0, 1, 1,
-0.7096299, -0.5891649, -2.481012, 1, 1, 1, 1, 1,
-0.7084094, 0.3898846, -1.295169, 1, 1, 1, 1, 1,
-0.7081056, -0.4123602, -2.23532, 1, 1, 1, 1, 1,
-0.707718, 0.4908431, -0.7859594, 1, 1, 1, 1, 1,
-0.7062417, -0.4686462, -2.194055, 1, 1, 1, 1, 1,
-0.7051873, -1.501158, -2.043418, 1, 1, 1, 1, 1,
-0.7039754, -2.10662, -2.585817, 1, 1, 1, 1, 1,
-0.7000734, 0.9129623, -1.588748, 1, 1, 1, 1, 1,
-0.6973457, 0.02091666, -2.226275, 1, 1, 1, 1, 1,
-0.697004, -0.8763955, -2.492482, 1, 1, 1, 1, 1,
-0.6956414, -1.479282, -1.952985, 1, 1, 1, 1, 1,
-0.6881032, 1.767213, -1.008667, 1, 1, 1, 1, 1,
-0.6879166, -1.967555, -2.618477, 1, 1, 1, 1, 1,
-0.6740986, -0.5053567, -1.608506, 1, 1, 1, 1, 1,
-0.6732816, 0.3580767, -2.018394, 1, 1, 1, 1, 1,
-0.6690625, -1.096943, -2.61362, 0, 0, 1, 1, 1,
-0.6672058, 0.8411769, 0.5781175, 1, 0, 0, 1, 1,
-0.6616327, -0.4832713, -0.7991083, 1, 0, 0, 1, 1,
-0.6557689, -1.079056, -1.444602, 1, 0, 0, 1, 1,
-0.6551335, 0.9019182, 0.4124621, 1, 0, 0, 1, 1,
-0.6529756, 0.5705489, 0.7506293, 1, 0, 0, 1, 1,
-0.6521215, -0.256938, 0.3261504, 0, 0, 0, 1, 1,
-0.6489463, 0.2421081, -1.508509, 0, 0, 0, 1, 1,
-0.6477737, 0.4990673, 0.5544814, 0, 0, 0, 1, 1,
-0.647654, -0.4969421, -3.438775, 0, 0, 0, 1, 1,
-0.6474898, -0.145016, -0.6469637, 0, 0, 0, 1, 1,
-0.646836, 2.553571, -0.02128942, 0, 0, 0, 1, 1,
-0.6411372, -0.6126296, -0.7510715, 0, 0, 0, 1, 1,
-0.6390105, -1.25528, -2.720423, 1, 1, 1, 1, 1,
-0.6344836, 0.2158789, -1.825623, 1, 1, 1, 1, 1,
-0.6257919, -0.4951819, -1.802287, 1, 1, 1, 1, 1,
-0.6234617, 0.8292643, -1.298005, 1, 1, 1, 1, 1,
-0.6101531, -2.292616, -1.63209, 1, 1, 1, 1, 1,
-0.6050866, -0.4213749, -2.476076, 1, 1, 1, 1, 1,
-0.6029828, -0.9248589, -3.580215, 1, 1, 1, 1, 1,
-0.6012069, 0.5700889, -0.6620405, 1, 1, 1, 1, 1,
-0.6005023, 0.8231391, -0.8130012, 1, 1, 1, 1, 1,
-0.586244, -0.9227483, -3.697422, 1, 1, 1, 1, 1,
-0.5824475, -2.434134, -2.629627, 1, 1, 1, 1, 1,
-0.5736292, -0.4617728, -2.049839, 1, 1, 1, 1, 1,
-0.5608735, -1.192448, -2.047378, 1, 1, 1, 1, 1,
-0.5602406, -0.3622057, -3.18021, 1, 1, 1, 1, 1,
-0.5601786, -1.185422, -2.870832, 1, 1, 1, 1, 1,
-0.5598404, -0.6847869, -1.502247, 0, 0, 1, 1, 1,
-0.556945, -2.437799, -2.99468, 1, 0, 0, 1, 1,
-0.554354, -0.1139356, -2.374099, 1, 0, 0, 1, 1,
-0.5520126, -0.5388058, -2.308711, 1, 0, 0, 1, 1,
-0.549962, 0.3141502, -1.261325, 1, 0, 0, 1, 1,
-0.5468763, 0.7637309, -0.7833938, 1, 0, 0, 1, 1,
-0.5466043, -0.565703, -1.802201, 0, 0, 0, 1, 1,
-0.5407606, 0.3406079, -1.48111, 0, 0, 0, 1, 1,
-0.5348698, 0.1914535, 0.2736075, 0, 0, 0, 1, 1,
-0.5336336, 1.678251, 0.4037197, 0, 0, 0, 1, 1,
-0.5266591, 1.04921, 0.9610825, 0, 0, 0, 1, 1,
-0.5263124, -0.3121262, -1.960971, 0, 0, 0, 1, 1,
-0.5258891, 1.011871, 0.4593994, 0, 0, 0, 1, 1,
-0.5252696, -0.1633583, -2.67063, 1, 1, 1, 1, 1,
-0.5227787, -0.6850401, -1.768981, 1, 1, 1, 1, 1,
-0.5106029, -1.892021, -4.898451, 1, 1, 1, 1, 1,
-0.5100873, -1.678621, -3.82313, 1, 1, 1, 1, 1,
-0.5097427, 0.6529471, -1.333212, 1, 1, 1, 1, 1,
-0.5090998, 0.7639629, 0.7340955, 1, 1, 1, 1, 1,
-0.5084315, 0.1585856, 0.1323103, 1, 1, 1, 1, 1,
-0.5041453, 0.003442149, -0.7509735, 1, 1, 1, 1, 1,
-0.5032878, 0.5704264, -2.304496, 1, 1, 1, 1, 1,
-0.5024984, -1.550013, -2.244235, 1, 1, 1, 1, 1,
-0.50229, 0.3557752, -0.6737109, 1, 1, 1, 1, 1,
-0.4985988, -1.545482, -2.215256, 1, 1, 1, 1, 1,
-0.4971959, 0.3060579, -0.4958461, 1, 1, 1, 1, 1,
-0.4956761, -0.5881866, -1.211077, 1, 1, 1, 1, 1,
-0.4955548, 0.0513767, -0.8395225, 1, 1, 1, 1, 1,
-0.4946099, 1.86018, -0.1098775, 0, 0, 1, 1, 1,
-0.4941265, -0.2323828, -0.3056941, 1, 0, 0, 1, 1,
-0.4920127, 0.9901322, -0.3283103, 1, 0, 0, 1, 1,
-0.4873299, -0.864625, -4.226632, 1, 0, 0, 1, 1,
-0.484989, 0.5920081, -1.852059, 1, 0, 0, 1, 1,
-0.4831944, 1.181362, -1.973469, 1, 0, 0, 1, 1,
-0.4831125, -1.121746, -2.821305, 0, 0, 0, 1, 1,
-0.4817715, 1.191731, -0.4160245, 0, 0, 0, 1, 1,
-0.4815877, 1.321183, 0.1347575, 0, 0, 0, 1, 1,
-0.4808124, 0.4553457, -0.50439, 0, 0, 0, 1, 1,
-0.4780672, -0.6982006, -2.123557, 0, 0, 0, 1, 1,
-0.4772549, 1.189635, -1.695323, 0, 0, 0, 1, 1,
-0.4758694, -1.744107, -2.250097, 0, 0, 0, 1, 1,
-0.4750649, 0.6454037, -0.5514508, 1, 1, 1, 1, 1,
-0.4748082, 0.4277934, -1.407441, 1, 1, 1, 1, 1,
-0.4741794, 1.040952, -0.05523666, 1, 1, 1, 1, 1,
-0.4671257, -0.2218473, -0.9116477, 1, 1, 1, 1, 1,
-0.4664335, -1.94367, -4.254599, 1, 1, 1, 1, 1,
-0.465931, -0.9724411, -3.475671, 1, 1, 1, 1, 1,
-0.4632835, 1.082822, 2.528682, 1, 1, 1, 1, 1,
-0.4588105, -1.189301, -4.575489, 1, 1, 1, 1, 1,
-0.4573967, -0.6811126, -2.86537, 1, 1, 1, 1, 1,
-0.4567613, 0.5084761, -0.4529002, 1, 1, 1, 1, 1,
-0.4558066, 0.5810888, 2.545678, 1, 1, 1, 1, 1,
-0.4554074, 0.5333893, -2.000058, 1, 1, 1, 1, 1,
-0.4528933, -1.829294, -2.216708, 1, 1, 1, 1, 1,
-0.4462423, -1.196076, -3.088823, 1, 1, 1, 1, 1,
-0.4446542, -0.05772183, -1.826833, 1, 1, 1, 1, 1,
-0.4441328, -0.9149475, -4.783702, 0, 0, 1, 1, 1,
-0.4438101, -0.09376185, -1.108839, 1, 0, 0, 1, 1,
-0.4421025, 0.6961326, 0.1086851, 1, 0, 0, 1, 1,
-0.4414993, -0.767643, -1.834792, 1, 0, 0, 1, 1,
-0.4408825, 0.2604001, -1.307273, 1, 0, 0, 1, 1,
-0.4382272, 0.7285283, 0.6183985, 1, 0, 0, 1, 1,
-0.4376253, -0.4137564, -4.469622, 0, 0, 0, 1, 1,
-0.4369562, -0.6318572, -2.080434, 0, 0, 0, 1, 1,
-0.4360819, 0.09822366, -1.142063, 0, 0, 0, 1, 1,
-0.4354812, 0.5863233, -0.4608842, 0, 0, 0, 1, 1,
-0.4301052, -1.394632, -3.668605, 0, 0, 0, 1, 1,
-0.4288945, -0.2093384, -0.7831749, 0, 0, 0, 1, 1,
-0.4189432, -0.2769856, -3.557765, 0, 0, 0, 1, 1,
-0.4170333, -0.1718965, 0.2872548, 1, 1, 1, 1, 1,
-0.4147389, 0.3716326, -1.9585, 1, 1, 1, 1, 1,
-0.4074454, -0.0549822, -0.7217792, 1, 1, 1, 1, 1,
-0.4055743, -0.5884899, -2.454006, 1, 1, 1, 1, 1,
-0.4029352, -0.1040702, -1.648106, 1, 1, 1, 1, 1,
-0.3862997, 0.4041331, -1.139204, 1, 1, 1, 1, 1,
-0.3832272, 0.09965298, -1.669837, 1, 1, 1, 1, 1,
-0.3725352, 0.16514, -0.5969533, 1, 1, 1, 1, 1,
-0.3681543, -1.980479, -3.373331, 1, 1, 1, 1, 1,
-0.3678122, 2.175404, -0.6821773, 1, 1, 1, 1, 1,
-0.3602428, -1.227785, -4.237859, 1, 1, 1, 1, 1,
-0.359996, 0.08980747, -1.582839, 1, 1, 1, 1, 1,
-0.3556522, -1.76549, -2.182614, 1, 1, 1, 1, 1,
-0.3542425, 1.118588, 0.2674535, 1, 1, 1, 1, 1,
-0.3504367, 0.822409, -0.6581435, 1, 1, 1, 1, 1,
-0.3485626, 0.1272513, -1.024924, 0, 0, 1, 1, 1,
-0.3469981, 1.30798, -1.563689, 1, 0, 0, 1, 1,
-0.3469471, -1.196291, -3.093099, 1, 0, 0, 1, 1,
-0.3451502, 1.326033, 1.741246, 1, 0, 0, 1, 1,
-0.3288622, 1.661703, -0.07488634, 1, 0, 0, 1, 1,
-0.3190899, -0.473515, -1.358487, 1, 0, 0, 1, 1,
-0.3155328, -0.08823315, -1.078619, 0, 0, 0, 1, 1,
-0.3115593, 0.8582519, 1.222487, 0, 0, 0, 1, 1,
-0.3015741, 2.150459, -2.016289, 0, 0, 0, 1, 1,
-0.3000578, -0.5228792, -5.452089, 0, 0, 0, 1, 1,
-0.2956748, 1.483012, 1.158944, 0, 0, 0, 1, 1,
-0.2923848, 0.08957574, -1.303073, 0, 0, 0, 1, 1,
-0.2893245, -0.9691972, -2.92129, 0, 0, 0, 1, 1,
-0.287735, 1.472301, -0.3279453, 1, 1, 1, 1, 1,
-0.2721561, -0.7813577, -3.63081, 1, 1, 1, 1, 1,
-0.2714193, -1.799496, -1.212234, 1, 1, 1, 1, 1,
-0.2711333, 0.533017, 0.6408731, 1, 1, 1, 1, 1,
-0.2686988, 0.5253477, -1.18272, 1, 1, 1, 1, 1,
-0.2675599, -0.5285923, -2.537427, 1, 1, 1, 1, 1,
-0.2653498, -0.511034, -1.731043, 1, 1, 1, 1, 1,
-0.2571754, 0.9165469, -0.7496563, 1, 1, 1, 1, 1,
-0.2551495, -0.3347848, -3.913311, 1, 1, 1, 1, 1,
-0.2546529, 1.510893, -0.006369629, 1, 1, 1, 1, 1,
-0.2535897, 0.2627799, 0.1702462, 1, 1, 1, 1, 1,
-0.2505478, -0.4532438, -1.509588, 1, 1, 1, 1, 1,
-0.2502184, -0.692014, -3.761408, 1, 1, 1, 1, 1,
-0.2446634, -1.326726, -2.212651, 1, 1, 1, 1, 1,
-0.2418063, -1.111508, -3.380174, 1, 1, 1, 1, 1,
-0.239091, -0.1580187, -2.996871, 0, 0, 1, 1, 1,
-0.2312505, 0.8981143, 0.3965608, 1, 0, 0, 1, 1,
-0.2269707, 1.433791, 0.05468998, 1, 0, 0, 1, 1,
-0.2236492, 0.4698749, 1.653547, 1, 0, 0, 1, 1,
-0.2215367, 1.325977, -1.523437, 1, 0, 0, 1, 1,
-0.2186733, 0.1507594, -0.3169484, 1, 0, 0, 1, 1,
-0.2129298, 0.005415125, -0.9985229, 0, 0, 0, 1, 1,
-0.2114863, -0.7640936, -3.042643, 0, 0, 0, 1, 1,
-0.2097887, -0.2989233, -4.482556, 0, 0, 0, 1, 1,
-0.2084327, -1.054984, -2.301489, 0, 0, 0, 1, 1,
-0.207125, 1.401492, -0.6758696, 0, 0, 0, 1, 1,
-0.2066282, -1.369808, -4.669343, 0, 0, 0, 1, 1,
-0.2050702, -1.0339, -4.358457, 0, 0, 0, 1, 1,
-0.2031196, -0.2294717, -3.09607, 1, 1, 1, 1, 1,
-0.1989224, 1.494641, 0.9077402, 1, 1, 1, 1, 1,
-0.197954, 0.3874723, -0.6574866, 1, 1, 1, 1, 1,
-0.1935972, 0.3535201, -0.8959741, 1, 1, 1, 1, 1,
-0.1849274, -0.1383094, -3.075337, 1, 1, 1, 1, 1,
-0.1844636, -0.708087, -3.137904, 1, 1, 1, 1, 1,
-0.1813284, -2.080141, -1.658708, 1, 1, 1, 1, 1,
-0.1811315, 1.241414, -0.2138719, 1, 1, 1, 1, 1,
-0.1811286, -1.256113, -4.198071, 1, 1, 1, 1, 1,
-0.1754705, -1.383611, -3.346471, 1, 1, 1, 1, 1,
-0.174501, -0.390146, -2.55915, 1, 1, 1, 1, 1,
-0.1659754, -2.476136, -4.690555, 1, 1, 1, 1, 1,
-0.1653716, 0.7836069, -2.218297, 1, 1, 1, 1, 1,
-0.1610803, 0.3710767, -1.637441, 1, 1, 1, 1, 1,
-0.155718, 0.2306568, -1.334007, 1, 1, 1, 1, 1,
-0.1548567, -1.828651, -1.213486, 0, 0, 1, 1, 1,
-0.153234, -1.016087, -2.685222, 1, 0, 0, 1, 1,
-0.1487048, 0.8782934, -0.5185586, 1, 0, 0, 1, 1,
-0.1474426, 1.337276, -1.299625, 1, 0, 0, 1, 1,
-0.1455854, 0.1968688, -0.7557864, 1, 0, 0, 1, 1,
-0.1453891, 1.684093, 0.8145431, 1, 0, 0, 1, 1,
-0.1449466, -0.542317, -3.099022, 0, 0, 0, 1, 1,
-0.1445637, -1.325744, -3.291835, 0, 0, 0, 1, 1,
-0.1434672, 0.9528753, -0.5112524, 0, 0, 0, 1, 1,
-0.1432348, 1.335585, -0.2279675, 0, 0, 0, 1, 1,
-0.1431903, 0.6463205, 1.525986, 0, 0, 0, 1, 1,
-0.1381836, -0.1026506, -2.131809, 0, 0, 0, 1, 1,
-0.1367007, -0.9521156, -3.280194, 0, 0, 0, 1, 1,
-0.1360419, 0.2897683, -0.9513652, 1, 1, 1, 1, 1,
-0.1315554, 0.111576, 0.3280229, 1, 1, 1, 1, 1,
-0.1279102, -2.432214, -4.047565, 1, 1, 1, 1, 1,
-0.1205297, -0.78078, -1.977653, 1, 1, 1, 1, 1,
-0.1166916, 1.090317, -0.2399329, 1, 1, 1, 1, 1,
-0.1166473, -0.02194525, -1.400492, 1, 1, 1, 1, 1,
-0.1129002, -0.5878496, -3.492795, 1, 1, 1, 1, 1,
-0.1101003, -0.6346171, -3.684799, 1, 1, 1, 1, 1,
-0.1089395, -0.9730792, -4.791877, 1, 1, 1, 1, 1,
-0.1084115, -0.6655838, -3.067281, 1, 1, 1, 1, 1,
-0.1076987, 1.204907, 1.537111, 1, 1, 1, 1, 1,
-0.1058227, 0.6937114, -1.543223, 1, 1, 1, 1, 1,
-0.1057869, 0.07808105, -0.7003127, 1, 1, 1, 1, 1,
-0.1021526, 0.06862677, -0.4448083, 1, 1, 1, 1, 1,
-0.1015323, -0.6623151, -3.132831, 1, 1, 1, 1, 1,
-0.09942798, 1.744888, -2.146809, 0, 0, 1, 1, 1,
-0.09381183, -0.02133106, -4.405269, 1, 0, 0, 1, 1,
-0.0902929, -0.0558666, -0.9870912, 1, 0, 0, 1, 1,
-0.08875291, 0.5555046, 0.414822, 1, 0, 0, 1, 1,
-0.08873904, -0.4443776, -3.90843, 1, 0, 0, 1, 1,
-0.08623577, -0.1886083, -4.998311, 1, 0, 0, 1, 1,
-0.082296, -0.02615661, -1.551806, 0, 0, 0, 1, 1,
-0.08164042, 0.8096906, -0.03290036, 0, 0, 0, 1, 1,
-0.07475697, -0.8913443, -2.937238, 0, 0, 0, 1, 1,
-0.07309733, -0.001841092, -2.391066, 0, 0, 0, 1, 1,
-0.06876235, 0.07862606, -1.78011, 0, 0, 0, 1, 1,
-0.06765992, 0.2039771, -0.1838768, 0, 0, 0, 1, 1,
-0.06446796, -0.1902818, -4.413328, 0, 0, 0, 1, 1,
-0.06249804, -0.331674, -3.213732, 1, 1, 1, 1, 1,
-0.06228629, -0.5785762, -2.023425, 1, 1, 1, 1, 1,
-0.06043058, 0.2422558, -0.8772425, 1, 1, 1, 1, 1,
-0.05867346, -0.4041171, -2.945817, 1, 1, 1, 1, 1,
-0.0553575, -0.1205189, -3.837476, 1, 1, 1, 1, 1,
-0.05382672, 2.502768, -0.3829283, 1, 1, 1, 1, 1,
-0.05006297, -1.813618, -3.841919, 1, 1, 1, 1, 1,
-0.04977879, -0.482389, -1.353445, 1, 1, 1, 1, 1,
-0.04869529, 0.345761, -0.5691608, 1, 1, 1, 1, 1,
-0.04415606, 0.4519403, -2.462738, 1, 1, 1, 1, 1,
-0.04323489, 0.5504387, -0.3928138, 1, 1, 1, 1, 1,
-0.04040615, -1.144075, -2.802409, 1, 1, 1, 1, 1,
-0.03893412, 1.781008, -1.205823, 1, 1, 1, 1, 1,
-0.03022193, 0.8244489, 1.383509, 1, 1, 1, 1, 1,
-0.02789025, 0.2669492, 0.7709483, 1, 1, 1, 1, 1,
-0.0232926, 1.165544, -1.320509, 0, 0, 1, 1, 1,
-0.0227567, -0.5539173, -4.523037, 1, 0, 0, 1, 1,
-0.016388, 0.9060819, -0.7813154, 1, 0, 0, 1, 1,
-0.01401956, -0.9367149, -0.2576444, 1, 0, 0, 1, 1,
-0.01283446, 1.058849, -0.4755823, 1, 0, 0, 1, 1,
-0.0101186, 0.6626126, -0.9968532, 1, 0, 0, 1, 1,
-0.008947654, 0.4530122, -1.64858, 0, 0, 0, 1, 1,
-0.007257125, -0.8020328, -3.369122, 0, 0, 0, 1, 1,
-0.0001588294, -1.4621, -3.737024, 0, 0, 0, 1, 1,
-0.0001403393, -1.170643, -1.597059, 0, 0, 0, 1, 1,
0.0004352971, -0.225081, 1.46415, 0, 0, 0, 1, 1,
0.001562827, -0.362724, 3.25246, 0, 0, 0, 1, 1,
0.005667504, 0.2479758, -0.7067798, 0, 0, 0, 1, 1,
0.007919662, -0.2117206, 5.472044, 1, 1, 1, 1, 1,
0.01286294, -2.616378, 3.974178, 1, 1, 1, 1, 1,
0.02007678, 1.744499, 1.542814, 1, 1, 1, 1, 1,
0.02690106, -1.228327, 5.165855, 1, 1, 1, 1, 1,
0.0272876, -1.212172, 2.64074, 1, 1, 1, 1, 1,
0.02786575, 1.131729, 0.2268298, 1, 1, 1, 1, 1,
0.03096713, 0.8368107, -1.227546, 1, 1, 1, 1, 1,
0.03871831, 0.4820498, 0.1116973, 1, 1, 1, 1, 1,
0.03916937, 1.011729, 1.49969, 1, 1, 1, 1, 1,
0.03950603, -0.0160099, 2.380537, 1, 1, 1, 1, 1,
0.04787955, -1.043538, 4.958498, 1, 1, 1, 1, 1,
0.05123383, 2.122783, 2.5043, 1, 1, 1, 1, 1,
0.05420589, 0.9996858, 1.176501, 1, 1, 1, 1, 1,
0.06257152, -0.4475253, 2.390598, 1, 1, 1, 1, 1,
0.06273894, 1.180597, 0.7830657, 1, 1, 1, 1, 1,
0.06721029, -0.8099609, 2.589687, 0, 0, 1, 1, 1,
0.07319273, 1.009422, -0.1062748, 1, 0, 0, 1, 1,
0.07429082, -0.7588596, 3.001831, 1, 0, 0, 1, 1,
0.07442118, 0.104887, 0.6534179, 1, 0, 0, 1, 1,
0.07620292, -1.018537, 3.652343, 1, 0, 0, 1, 1,
0.07764064, -0.6716137, 4.399252, 1, 0, 0, 1, 1,
0.0805905, -1.488176, 1.583681, 0, 0, 0, 1, 1,
0.082128, -0.9181767, 2.862538, 0, 0, 0, 1, 1,
0.08350559, -0.2897367, 1.998642, 0, 0, 0, 1, 1,
0.08772953, -0.4968995, 3.030168, 0, 0, 0, 1, 1,
0.09252094, -0.412164, 4.190516, 0, 0, 0, 1, 1,
0.09279876, -0.2947075, 4.707776, 0, 0, 0, 1, 1,
0.09358826, 0.08169909, -0.678624, 0, 0, 0, 1, 1,
0.09637627, 0.4196111, -0.07601962, 1, 1, 1, 1, 1,
0.09803943, 1.241904, 0.7078699, 1, 1, 1, 1, 1,
0.09811452, 0.6633319, 1.256617, 1, 1, 1, 1, 1,
0.09894247, 0.4480457, 1.617842, 1, 1, 1, 1, 1,
0.09973459, -0.5856591, 1.200221, 1, 1, 1, 1, 1,
0.1014588, -0.7949544, 3.008312, 1, 1, 1, 1, 1,
0.104381, -1.277081, 2.200796, 1, 1, 1, 1, 1,
0.1101206, 1.966864, -0.7129754, 1, 1, 1, 1, 1,
0.1216618, -0.7611909, 3.525657, 1, 1, 1, 1, 1,
0.1218188, -0.9683867, 3.490464, 1, 1, 1, 1, 1,
0.1225478, 0.6825296, -1.840081, 1, 1, 1, 1, 1,
0.1286626, 0.5589651, -0.201321, 1, 1, 1, 1, 1,
0.1298563, -0.2171713, 3.628508, 1, 1, 1, 1, 1,
0.1323239, -0.30129, 2.950256, 1, 1, 1, 1, 1,
0.1346513, 0.8576302, -0.2414049, 1, 1, 1, 1, 1,
0.1379674, -0.5176638, 5.193082, 0, 0, 1, 1, 1,
0.1404213, -0.3834143, 1.69952, 1, 0, 0, 1, 1,
0.1430961, 1.422393, 0.7398381, 1, 0, 0, 1, 1,
0.1433696, -0.7886785, 2.651275, 1, 0, 0, 1, 1,
0.1434402, -0.8422271, 3.769905, 1, 0, 0, 1, 1,
0.1458156, 0.0314649, 2.083507, 1, 0, 0, 1, 1,
0.1487902, 0.5107225, 1.572255, 0, 0, 0, 1, 1,
0.150992, 1.009347, 1.184818, 0, 0, 0, 1, 1,
0.1521805, -0.4385084, 1.807063, 0, 0, 0, 1, 1,
0.1527552, 1.234989, 1.128646, 0, 0, 0, 1, 1,
0.1543654, -1.455131, 3.726983, 0, 0, 0, 1, 1,
0.1556962, 0.5555368, 1.666914, 0, 0, 0, 1, 1,
0.1564193, 0.1716693, 2.172205, 0, 0, 0, 1, 1,
0.1582284, 1.273329, -2.379012, 1, 1, 1, 1, 1,
0.1636491, -1.396563, 1.977289, 1, 1, 1, 1, 1,
0.1648967, 1.34559, -0.4402987, 1, 1, 1, 1, 1,
0.1661111, -0.4865121, 2.945775, 1, 1, 1, 1, 1,
0.1701261, 1.76602, 1.121445, 1, 1, 1, 1, 1,
0.1735184, -0.5997883, 2.458212, 1, 1, 1, 1, 1,
0.1759764, -0.1408119, 2.120564, 1, 1, 1, 1, 1,
0.1849065, 0.232823, 1.994925, 1, 1, 1, 1, 1,
0.1878684, -0.2915098, 3.66454, 1, 1, 1, 1, 1,
0.1913342, -1.876399, 2.197799, 1, 1, 1, 1, 1,
0.1926422, 0.3608035, 1.050407, 1, 1, 1, 1, 1,
0.193532, 1.277467, 1.258296, 1, 1, 1, 1, 1,
0.1945328, -0.8904344, 3.585169, 1, 1, 1, 1, 1,
0.1967368, -0.7579933, 3.22223, 1, 1, 1, 1, 1,
0.1986844, -0.8905935, 5.513188, 1, 1, 1, 1, 1,
0.1990957, -0.2951389, 2.655924, 0, 0, 1, 1, 1,
0.1991149, -0.6399312, 3.266877, 1, 0, 0, 1, 1,
0.2010493, -1.339283, 4.874979, 1, 0, 0, 1, 1,
0.2020437, -0.2587417, 3.074838, 1, 0, 0, 1, 1,
0.2038089, 1.623962, 1.841538, 1, 0, 0, 1, 1,
0.2039919, 1.48136, 0.9367177, 1, 0, 0, 1, 1,
0.2042104, 0.1750349, 0.3613805, 0, 0, 0, 1, 1,
0.2050181, 1.394177, 0.5951391, 0, 0, 0, 1, 1,
0.2061109, -1.145473, 3.097363, 0, 0, 0, 1, 1,
0.2110954, -0.1927046, 1.993481, 0, 0, 0, 1, 1,
0.2172184, 1.125276, -1.559251, 0, 0, 0, 1, 1,
0.2188261, -1.153977, 3.146897, 0, 0, 0, 1, 1,
0.2198473, -0.127059, 1.804728, 0, 0, 0, 1, 1,
0.2223114, 0.316807, 1.384769, 1, 1, 1, 1, 1,
0.228041, 0.1887615, -0.3640515, 1, 1, 1, 1, 1,
0.230904, 0.5686124, 1.886567, 1, 1, 1, 1, 1,
0.2309528, 1.108383, -0.4275194, 1, 1, 1, 1, 1,
0.2315681, -0.1621388, 3.716708, 1, 1, 1, 1, 1,
0.2340298, 0.1945289, 0.2751852, 1, 1, 1, 1, 1,
0.2404376, 0.5422566, 1.592156, 1, 1, 1, 1, 1,
0.2419602, -0.2307433, 0.6407939, 1, 1, 1, 1, 1,
0.2460974, 1.022001, -0.05694749, 1, 1, 1, 1, 1,
0.2477555, 0.8254245, 0.7245324, 1, 1, 1, 1, 1,
0.2505029, 0.6627227, 1.095342, 1, 1, 1, 1, 1,
0.253237, -0.216131, 1.577714, 1, 1, 1, 1, 1,
0.2535993, -0.02516891, 1.510637, 1, 1, 1, 1, 1,
0.2573138, 0.0649377, 0.2768394, 1, 1, 1, 1, 1,
0.25853, 0.8569694, -0.985218, 1, 1, 1, 1, 1,
0.2612578, -0.1511677, 1.928071, 0, 0, 1, 1, 1,
0.26163, 1.677993, -0.9246953, 1, 0, 0, 1, 1,
0.262146, 0.713829, 1.045675, 1, 0, 0, 1, 1,
0.2622857, -0.9701138, 0.9232972, 1, 0, 0, 1, 1,
0.2631884, -0.91889, 3.037212, 1, 0, 0, 1, 1,
0.2643292, -1.054182, 2.320956, 1, 0, 0, 1, 1,
0.2678124, 0.09822278, 2.42217, 0, 0, 0, 1, 1,
0.2695017, 0.1127519, 1.315732, 0, 0, 0, 1, 1,
0.2702552, 1.623528, -1.927533, 0, 0, 0, 1, 1,
0.2716607, -0.1803285, 2.645983, 0, 0, 0, 1, 1,
0.2717051, -1.733311, 3.193946, 0, 0, 0, 1, 1,
0.2744241, 1.592125, -0.5310749, 0, 0, 0, 1, 1,
0.2759605, 0.2169413, 2.373671, 0, 0, 0, 1, 1,
0.2760322, -0.3670535, 3.621478, 1, 1, 1, 1, 1,
0.2768893, 0.01728568, 1.877357, 1, 1, 1, 1, 1,
0.2781824, -0.5623224, 2.759197, 1, 1, 1, 1, 1,
0.28085, -1.696024, 1.222484, 1, 1, 1, 1, 1,
0.2831334, 0.5840898, 0.274366, 1, 1, 1, 1, 1,
0.2883265, 0.1422286, 2.913482, 1, 1, 1, 1, 1,
0.2951653, -0.8868545, 1.932195, 1, 1, 1, 1, 1,
0.2966812, 0.4697211, -0.3893114, 1, 1, 1, 1, 1,
0.2975442, -0.2830054, 2.613624, 1, 1, 1, 1, 1,
0.3010022, -0.5587627, 2.642394, 1, 1, 1, 1, 1,
0.3020499, 1.157094, 0.5936496, 1, 1, 1, 1, 1,
0.3029025, 0.1737363, 1.918555, 1, 1, 1, 1, 1,
0.3075244, -0.1743159, 3.555004, 1, 1, 1, 1, 1,
0.3084248, 1.885556, 1.867653, 1, 1, 1, 1, 1,
0.3088719, 0.8487588, 0.5444524, 1, 1, 1, 1, 1,
0.3139047, -0.1741125, 2.722847, 0, 0, 1, 1, 1,
0.3145447, -0.8707538, 1.047526, 1, 0, 0, 1, 1,
0.3158525, -0.974079, 1.707038, 1, 0, 0, 1, 1,
0.316349, 0.3241828, 1.497026, 1, 0, 0, 1, 1,
0.3212196, 1.064687, -1.576481, 1, 0, 0, 1, 1,
0.3217013, -0.6141621, 3.175393, 1, 0, 0, 1, 1,
0.3246645, -0.05627031, 2.440663, 0, 0, 0, 1, 1,
0.329295, 1.60473, 1.873158, 0, 0, 0, 1, 1,
0.3307547, -0.05133799, 2.873498, 0, 0, 0, 1, 1,
0.3339584, -0.7901471, 1.126175, 0, 0, 0, 1, 1,
0.3341335, -0.4273961, 1.837821, 0, 0, 0, 1, 1,
0.3369747, 0.5207407, 1.054326, 0, 0, 0, 1, 1,
0.3371378, 1.728304, 0.7346013, 0, 0, 0, 1, 1,
0.3371539, 1.047897, -1.003493, 1, 1, 1, 1, 1,
0.3419482, 1.425985, -0.2264417, 1, 1, 1, 1, 1,
0.347532, 0.3829151, 0.5427828, 1, 1, 1, 1, 1,
0.3480615, 1.086027, 1.099051, 1, 1, 1, 1, 1,
0.3531904, 0.2738165, 0.2178772, 1, 1, 1, 1, 1,
0.3532993, 0.06827816, 0.9959703, 1, 1, 1, 1, 1,
0.3553144, 0.6358663, 0.6519984, 1, 1, 1, 1, 1,
0.3555077, 0.0759304, 1.184376, 1, 1, 1, 1, 1,
0.3598107, 1.048604, -0.8833899, 1, 1, 1, 1, 1,
0.3616223, 0.5438883, -0.02668269, 1, 1, 1, 1, 1,
0.3642855, -0.7899008, 3.871189, 1, 1, 1, 1, 1,
0.3645974, 0.0850793, 0.9646524, 1, 1, 1, 1, 1,
0.3661087, 1.218082, 1.651937, 1, 1, 1, 1, 1,
0.366757, -0.005467356, -0.3899359, 1, 1, 1, 1, 1,
0.3671371, 0.09371119, -0.02917695, 1, 1, 1, 1, 1,
0.369701, -0.2367543, 2.079589, 0, 0, 1, 1, 1,
0.3722313, 1.243983, 2.030691, 1, 0, 0, 1, 1,
0.373664, 0.197025, 0.920919, 1, 0, 0, 1, 1,
0.3773836, -0.4883789, 3.510716, 1, 0, 0, 1, 1,
0.382045, 1.203274, -0.2143285, 1, 0, 0, 1, 1,
0.3840248, 0.772257, 0.2516871, 1, 0, 0, 1, 1,
0.3853736, 0.01703992, 0.9845377, 0, 0, 0, 1, 1,
0.3879449, -0.7548417, 2.957641, 0, 0, 0, 1, 1,
0.3882259, 0.7803522, -0.6708733, 0, 0, 0, 1, 1,
0.3907521, 0.7559704, 0.4698999, 0, 0, 0, 1, 1,
0.3929032, -0.6444554, 4.158751, 0, 0, 0, 1, 1,
0.4008243, -0.549423, 4.120888, 0, 0, 0, 1, 1,
0.4011135, 0.9408825, -0.9024174, 0, 0, 0, 1, 1,
0.401504, -1.156061, 2.722927, 1, 1, 1, 1, 1,
0.4057964, 1.659775, 1.330444, 1, 1, 1, 1, 1,
0.406029, 1.92658, -0.04056299, 1, 1, 1, 1, 1,
0.4085301, 0.4901594, -0.006970325, 1, 1, 1, 1, 1,
0.4120586, -1.009066, 0.9773647, 1, 1, 1, 1, 1,
0.4122425, -0.2015719, 1.564624, 1, 1, 1, 1, 1,
0.4176994, 0.8305278, -0.0960826, 1, 1, 1, 1, 1,
0.4232652, 0.3092365, 2.166644, 1, 1, 1, 1, 1,
0.4255536, -0.2199525, 2.229085, 1, 1, 1, 1, 1,
0.4319807, 3.005461, -0.903951, 1, 1, 1, 1, 1,
0.4330406, -0.03398822, 2.612077, 1, 1, 1, 1, 1,
0.4332304, 1.06254, -0.4859242, 1, 1, 1, 1, 1,
0.4368853, -0.005551247, 2.832094, 1, 1, 1, 1, 1,
0.4396252, 0.0917749, 0.6864896, 1, 1, 1, 1, 1,
0.4397111, -0.242479, 2.59752, 1, 1, 1, 1, 1,
0.4399169, 1.34268, 1.587295, 0, 0, 1, 1, 1,
0.4405493, 0.07853368, 1.744975, 1, 0, 0, 1, 1,
0.4446971, -0.3290016, 0.3322853, 1, 0, 0, 1, 1,
0.4467356, -0.1316941, 1.886122, 1, 0, 0, 1, 1,
0.4565641, -0.7893521, 2.397388, 1, 0, 0, 1, 1,
0.4609044, 2.35205, -0.4207015, 1, 0, 0, 1, 1,
0.4690976, -0.9421221, 1.097653, 0, 0, 0, 1, 1,
0.4711758, 1.030291, 0.1716223, 0, 0, 0, 1, 1,
0.4789543, -0.7454191, 3.300683, 0, 0, 0, 1, 1,
0.4840371, -1.289693, 3.062276, 0, 0, 0, 1, 1,
0.4848342, 1.313425, -0.5161942, 0, 0, 0, 1, 1,
0.4926479, -0.6244263, 1.727955, 0, 0, 0, 1, 1,
0.4949572, 0.4870906, -0.8785691, 0, 0, 0, 1, 1,
0.4955414, 0.4645231, 1.256853, 1, 1, 1, 1, 1,
0.4988154, 2.886022, -0.7023051, 1, 1, 1, 1, 1,
0.5019457, -0.01570686, 0.8609329, 1, 1, 1, 1, 1,
0.5029548, 1.674454, 0.07163913, 1, 1, 1, 1, 1,
0.5136194, -0.785891, 2.742023, 1, 1, 1, 1, 1,
0.5160224, 1.20557, 1.998177, 1, 1, 1, 1, 1,
0.5177703, 0.474051, 1.061108, 1, 1, 1, 1, 1,
0.5217835, -0.8716208, 3.637316, 1, 1, 1, 1, 1,
0.5225998, 1.578491, -0.4917999, 1, 1, 1, 1, 1,
0.5227458, 0.8770406, -0.2702061, 1, 1, 1, 1, 1,
0.5246844, -1.179938, 1.764235, 1, 1, 1, 1, 1,
0.5263245, -2.04883, 3.410879, 1, 1, 1, 1, 1,
0.5327467, 1.451443, 0.8334879, 1, 1, 1, 1, 1,
0.5328913, 0.8490521, 0.4278456, 1, 1, 1, 1, 1,
0.5355403, 0.7759826, 1.405278, 1, 1, 1, 1, 1,
0.5521199, -0.4398443, 1.375556, 0, 0, 1, 1, 1,
0.5715178, 0.8993999, 0.7152559, 1, 0, 0, 1, 1,
0.5726297, 2.140309, 1.256837, 1, 0, 0, 1, 1,
0.5773017, -0.217458, -0.1931185, 1, 0, 0, 1, 1,
0.5812636, 2.140494, -0.1884396, 1, 0, 0, 1, 1,
0.5818812, 0.06077508, 2.234396, 1, 0, 0, 1, 1,
0.5840606, -0.3524245, 3.016247, 0, 0, 0, 1, 1,
0.5859326, -0.6943846, 3.177591, 0, 0, 0, 1, 1,
0.5875406, 0.767517, 0.334353, 0, 0, 0, 1, 1,
0.5902137, 1.28553, 0.1718546, 0, 0, 0, 1, 1,
0.5941032, 0.5120864, 1.923094, 0, 0, 0, 1, 1,
0.5958806, 0.2833498, 0.8333363, 0, 0, 0, 1, 1,
0.6041793, 0.3284873, 1.703606, 0, 0, 0, 1, 1,
0.6053702, 2.58254, -0.2810544, 1, 1, 1, 1, 1,
0.606975, 0.3524403, 2.079992, 1, 1, 1, 1, 1,
0.6102022, -0.5571935, 2.558915, 1, 1, 1, 1, 1,
0.6107175, -0.4534574, 3.669062, 1, 1, 1, 1, 1,
0.6214636, -0.8505226, 0.7775549, 1, 1, 1, 1, 1,
0.6244462, -0.8990518, 2.963941, 1, 1, 1, 1, 1,
0.6309211, 0.4763686, 1.551904, 1, 1, 1, 1, 1,
0.6364574, 0.01529054, -0.1247434, 1, 1, 1, 1, 1,
0.6364963, -0.945331, 2.798792, 1, 1, 1, 1, 1,
0.6374127, 0.6196956, -1.179284, 1, 1, 1, 1, 1,
0.6425557, -0.4080039, 1.833811, 1, 1, 1, 1, 1,
0.6464659, -0.6023571, 2.465638, 1, 1, 1, 1, 1,
0.658599, -0.4079807, 1.710143, 1, 1, 1, 1, 1,
0.6633037, -1.102322, 2.190199, 1, 1, 1, 1, 1,
0.6659938, 0.6480947, 0.2941014, 1, 1, 1, 1, 1,
0.6719202, -0.4086725, 3.169465, 0, 0, 1, 1, 1,
0.6745711, 1.737384, 0.05144443, 1, 0, 0, 1, 1,
0.6784768, -0.006641251, 1.930739, 1, 0, 0, 1, 1,
0.678652, -0.4904296, 1.628344, 1, 0, 0, 1, 1,
0.6818998, -0.1757727, 0.4049832, 1, 0, 0, 1, 1,
0.6842008, -0.4969207, 0.8836328, 1, 0, 0, 1, 1,
0.6888652, 1.290749, 0.4951166, 0, 0, 0, 1, 1,
0.6894382, 1.08992, 1.546742, 0, 0, 0, 1, 1,
0.6929641, -1.619009, 1.640563, 0, 0, 0, 1, 1,
0.6956864, -0.1614467, 0.9237142, 0, 0, 0, 1, 1,
0.6998892, -1.14006, 3.833893, 0, 0, 0, 1, 1,
0.7035128, 0.03522783, 1.039275, 0, 0, 0, 1, 1,
0.7039731, 0.3277833, 1.700783, 0, 0, 0, 1, 1,
0.7059514, -1.538734, 2.546232, 1, 1, 1, 1, 1,
0.7076821, -0.07484994, 0.526455, 1, 1, 1, 1, 1,
0.7114403, -1.212788, 1.395997, 1, 1, 1, 1, 1,
0.7122858, -2.167413, 3.457358, 1, 1, 1, 1, 1,
0.7186882, 0.8052926, 1.934632, 1, 1, 1, 1, 1,
0.7204006, -1.461987, 2.543314, 1, 1, 1, 1, 1,
0.7233682, -0.8522201, 2.78136, 1, 1, 1, 1, 1,
0.7281958, -0.9811343, 3.081722, 1, 1, 1, 1, 1,
0.7311936, 0.3915775, 2.079129, 1, 1, 1, 1, 1,
0.7318859, -0.5482182, 3.567204, 1, 1, 1, 1, 1,
0.7321088, 0.5957069, 0.9668896, 1, 1, 1, 1, 1,
0.7410662, -1.600933, 1.880844, 1, 1, 1, 1, 1,
0.7487191, 0.7733603, 2.031166, 1, 1, 1, 1, 1,
0.750414, -0.436967, 3.080547, 1, 1, 1, 1, 1,
0.7512465, -0.8629718, 2.675508, 1, 1, 1, 1, 1,
0.7558462, -0.6961231, 2.613686, 0, 0, 1, 1, 1,
0.7602246, 0.121323, 1.589444, 1, 0, 0, 1, 1,
0.7628694, -1.79679, 2.77836, 1, 0, 0, 1, 1,
0.7640314, 0.1040865, 1.174217, 1, 0, 0, 1, 1,
0.7675349, -0.3222364, 1.331194, 1, 0, 0, 1, 1,
0.768839, 1.210631, 0.8640361, 1, 0, 0, 1, 1,
0.7703665, 0.3108148, 0.8003311, 0, 0, 0, 1, 1,
0.7742088, -0.3454641, 2.211545, 0, 0, 0, 1, 1,
0.7763101, -0.3688838, 2.094924, 0, 0, 0, 1, 1,
0.7769985, 0.7537242, 0.1961372, 0, 0, 0, 1, 1,
0.7771143, -1.333824, 2.913975, 0, 0, 0, 1, 1,
0.7849732, -0.8953965, 3.025072, 0, 0, 0, 1, 1,
0.7854261, 1.206866, 0.1756976, 0, 0, 0, 1, 1,
0.7872672, 0.7182958, 0.08100164, 1, 1, 1, 1, 1,
0.7878319, -0.2339726, 2.58604, 1, 1, 1, 1, 1,
0.7883301, -1.7045, 2.108127, 1, 1, 1, 1, 1,
0.7899991, 1.990279, 0.7847458, 1, 1, 1, 1, 1,
0.7943074, 1.407992, 1.453174, 1, 1, 1, 1, 1,
0.7970123, -0.1810405, 2.120912, 1, 1, 1, 1, 1,
0.8035409, 0.9090219, 1.756986, 1, 1, 1, 1, 1,
0.8041158, -0.8151706, 2.028124, 1, 1, 1, 1, 1,
0.814352, -0.392076, 3.314432, 1, 1, 1, 1, 1,
0.816183, 0.817773, 0.8328579, 1, 1, 1, 1, 1,
0.8213168, 1.82657, 1.086231, 1, 1, 1, 1, 1,
0.8229125, -0.6533876, 3.072132, 1, 1, 1, 1, 1,
0.8234752, 0.2511687, 0.7360659, 1, 1, 1, 1, 1,
0.8246741, 1.1296, -0.4003381, 1, 1, 1, 1, 1,
0.8248563, -0.1693103, 1.391365, 1, 1, 1, 1, 1,
0.8260258, -0.954586, 4.171903, 0, 0, 1, 1, 1,
0.8262016, -1.529656, 3.525208, 1, 0, 0, 1, 1,
0.8273674, -0.2321114, 1.027333, 1, 0, 0, 1, 1,
0.8310073, 2.361558, -0.5011969, 1, 0, 0, 1, 1,
0.8387488, 0.5043083, 0.9867476, 1, 0, 0, 1, 1,
0.8402144, 0.6370617, 0.1558239, 1, 0, 0, 1, 1,
0.8417281, 1.172079, 0.905534, 0, 0, 0, 1, 1,
0.8444657, 0.9860755, 0.1174731, 0, 0, 0, 1, 1,
0.8445566, 0.9254763, -0.3253891, 0, 0, 0, 1, 1,
0.8474606, 1.732729, 0.350538, 0, 0, 0, 1, 1,
0.8509328, 1.462852, 0.8913556, 0, 0, 0, 1, 1,
0.851283, -1.008804, 2.628445, 0, 0, 0, 1, 1,
0.8526489, -0.3272276, 2.379661, 0, 0, 0, 1, 1,
0.8541181, 0.582056, 0.9272705, 1, 1, 1, 1, 1,
0.8573558, -1.375664, 3.370856, 1, 1, 1, 1, 1,
0.863059, 1.193724, 1.203281, 1, 1, 1, 1, 1,
0.8678351, 0.7084218, -1.175298, 1, 1, 1, 1, 1,
0.8678817, 0.2551653, 3.25109, 1, 1, 1, 1, 1,
0.8717116, -0.02534005, 1.256976, 1, 1, 1, 1, 1,
0.8750417, 0.0737622, 1.841964, 1, 1, 1, 1, 1,
0.8758765, -0.1803424, 1.376384, 1, 1, 1, 1, 1,
0.8768941, 0.7927607, 0.3016068, 1, 1, 1, 1, 1,
0.8790682, -2.034269, 2.686803, 1, 1, 1, 1, 1,
0.8863565, -0.4340432, 1.750343, 1, 1, 1, 1, 1,
0.9065583, -1.385592, 2.92455, 1, 1, 1, 1, 1,
0.9104654, -0.2716915, 2.030015, 1, 1, 1, 1, 1,
0.9115415, -0.4855904, 2.439272, 1, 1, 1, 1, 1,
0.9150686, -1.394229, 0.7204013, 1, 1, 1, 1, 1,
0.9171658, 1.077414, 1.815901, 0, 0, 1, 1, 1,
0.9196934, -0.07676297, 2.35122, 1, 0, 0, 1, 1,
0.9262277, -0.9578919, 2.367192, 1, 0, 0, 1, 1,
0.9286573, -1.122107, 2.288876, 1, 0, 0, 1, 1,
0.943491, 0.01414239, 2.224117, 1, 0, 0, 1, 1,
0.947131, 1.913825, -0.5686178, 1, 0, 0, 1, 1,
0.9475553, -0.3794249, 0.863506, 0, 0, 0, 1, 1,
0.9494604, 0.02634531, 1.316114, 0, 0, 0, 1, 1,
0.9510983, 0.1179703, 1.313715, 0, 0, 0, 1, 1,
0.9526389, -0.1667419, 1.776372, 0, 0, 0, 1, 1,
0.95516, -0.05424489, -0.3178761, 0, 0, 0, 1, 1,
0.9687874, 0.847378, 1.868379, 0, 0, 0, 1, 1,
0.974001, -0.7690721, 2.693542, 0, 0, 0, 1, 1,
0.9813412, 0.6823413, 1.926874, 1, 1, 1, 1, 1,
0.9840543, -1.241575, 2.611566, 1, 1, 1, 1, 1,
0.9845703, 0.1496783, 0.9591411, 1, 1, 1, 1, 1,
0.9850932, 0.1097848, 2.162103, 1, 1, 1, 1, 1,
0.9859526, 0.2033503, 2.50848, 1, 1, 1, 1, 1,
0.9883188, -0.008669646, 2.364963, 1, 1, 1, 1, 1,
0.9936459, 0.8868463, 0.6231524, 1, 1, 1, 1, 1,
0.99649, -1.503114, 4.505085, 1, 1, 1, 1, 1,
0.9973056, -1.556568, 1.836943, 1, 1, 1, 1, 1,
0.9991894, 0.9503616, -0.2463298, 1, 1, 1, 1, 1,
1.011804, -1.259127, 4.190092, 1, 1, 1, 1, 1,
1.014496, 0.2304094, 1.720595, 1, 1, 1, 1, 1,
1.019645, 0.6195242, 1.061192, 1, 1, 1, 1, 1,
1.021367, -0.6707255, 1.4691, 1, 1, 1, 1, 1,
1.021456, -0.5226784, 1.228712, 1, 1, 1, 1, 1,
1.023041, 0.1874687, 1.283508, 0, 0, 1, 1, 1,
1.043628, -2.777894, 2.165337, 1, 0, 0, 1, 1,
1.053841, 0.956616, -0.06542121, 1, 0, 0, 1, 1,
1.061566, -0.1474996, 1.989799, 1, 0, 0, 1, 1,
1.065216, 1.134518, 0.5769805, 1, 0, 0, 1, 1,
1.065643, 0.1958882, 2.434201, 1, 0, 0, 1, 1,
1.072165, 2.174895, 1.175019, 0, 0, 0, 1, 1,
1.08464, -0.8073359, 2.837986, 0, 0, 0, 1, 1,
1.092876, -0.03412635, 0.125104, 0, 0, 0, 1, 1,
1.095028, 0.8749139, 0.9028966, 0, 0, 0, 1, 1,
1.095492, -0.4271761, -0.05187957, 0, 0, 0, 1, 1,
1.102198, 0.8045465, -0.1833842, 0, 0, 0, 1, 1,
1.105395, 1.288025, -0.6092347, 0, 0, 0, 1, 1,
1.105572, -1.846701, 2.118001, 1, 1, 1, 1, 1,
1.120684, -0.6407057, 1.35472, 1, 1, 1, 1, 1,
1.126621, 0.9611539, -0.7173344, 1, 1, 1, 1, 1,
1.12822, 0.2451593, 1.464219, 1, 1, 1, 1, 1,
1.130574, -1.443022, 2.231179, 1, 1, 1, 1, 1,
1.142042, -0.3364731, 3.23975, 1, 1, 1, 1, 1,
1.143761, 1.060374, 0.2574945, 1, 1, 1, 1, 1,
1.145979, -0.2151219, 1.442247, 1, 1, 1, 1, 1,
1.149238, -1.745759, 2.643211, 1, 1, 1, 1, 1,
1.149782, -1.241342, 3.409566, 1, 1, 1, 1, 1,
1.157006, 0.1640013, 2.902152, 1, 1, 1, 1, 1,
1.167107, 0.9546226, 1.706267, 1, 1, 1, 1, 1,
1.168274, -0.7253083, 1.476438, 1, 1, 1, 1, 1,
1.173443, -0.76274, 2.988358, 1, 1, 1, 1, 1,
1.174849, -1.378899, 2.656828, 1, 1, 1, 1, 1,
1.175477, 0.7600001, 0.4252769, 0, 0, 1, 1, 1,
1.181351, -1.716493, 3.296906, 1, 0, 0, 1, 1,
1.187987, -1.134081, 2.553216, 1, 0, 0, 1, 1,
1.191185, 1.038077, 1.734258, 1, 0, 0, 1, 1,
1.194878, -0.06528368, 1.46036, 1, 0, 0, 1, 1,
1.198472, 1.463755, 0.2956818, 1, 0, 0, 1, 1,
1.202988, -1.120286, 1.762592, 0, 0, 0, 1, 1,
1.207793, -0.04453906, 0.1320097, 0, 0, 0, 1, 1,
1.208483, -0.4988111, 1.369946, 0, 0, 0, 1, 1,
1.209992, 1.056217, 1.277319, 0, 0, 0, 1, 1,
1.214732, -2.030944, 1.970569, 0, 0, 0, 1, 1,
1.227342, 0.7016315, 1.741085, 0, 0, 0, 1, 1,
1.229424, -1.757128, 2.191148, 0, 0, 0, 1, 1,
1.235128, 0.8761652, -0.714569, 1, 1, 1, 1, 1,
1.244, -0.2672673, 1.983825, 1, 1, 1, 1, 1,
1.25221, 0.5857897, -0.5853671, 1, 1, 1, 1, 1,
1.257461, -0.3748185, 2.840566, 1, 1, 1, 1, 1,
1.258949, -0.1319625, 1.41825, 1, 1, 1, 1, 1,
1.261402, 1.608777, -1.666944, 1, 1, 1, 1, 1,
1.264838, -0.5832384, 1.279604, 1, 1, 1, 1, 1,
1.265983, -0.7242545, 1.698577, 1, 1, 1, 1, 1,
1.267731, -2.534797, 2.193771, 1, 1, 1, 1, 1,
1.272578, 1.200853, -0.780719, 1, 1, 1, 1, 1,
1.274045, 0.2751416, 1.80621, 1, 1, 1, 1, 1,
1.281997, -1.554486, 1.587415, 1, 1, 1, 1, 1,
1.293662, -1.641751, 4.05739, 1, 1, 1, 1, 1,
1.295781, 0.845291, 1.250672, 1, 1, 1, 1, 1,
1.311722, 0.04289816, 0.9424182, 1, 1, 1, 1, 1,
1.317492, -0.5850219, 0.3379145, 0, 0, 1, 1, 1,
1.326999, 0.6190602, 0.3950439, 1, 0, 0, 1, 1,
1.330853, 0.2182764, 1.057972, 1, 0, 0, 1, 1,
1.331289, 0.7660729, 1.051435, 1, 0, 0, 1, 1,
1.334196, 0.3913985, 1.758453, 1, 0, 0, 1, 1,
1.339951, 0.6097245, 1.411765, 1, 0, 0, 1, 1,
1.340831, 1.704037, -1.386743, 0, 0, 0, 1, 1,
1.343135, 0.5688648, 2.085267, 0, 0, 0, 1, 1,
1.343952, 0.6662014, 1.274044, 0, 0, 0, 1, 1,
1.344394, -0.05167236, 1.20266, 0, 0, 0, 1, 1,
1.358591, -0.03920618, 2.134554, 0, 0, 0, 1, 1,
1.363339, 0.5169759, -0.4501535, 0, 0, 0, 1, 1,
1.370065, -0.1971527, 2.537756, 0, 0, 0, 1, 1,
1.398261, 0.5059429, 1.186412, 1, 1, 1, 1, 1,
1.398274, 0.5981522, 1.749874, 1, 1, 1, 1, 1,
1.398416, -0.4165168, 0.7560664, 1, 1, 1, 1, 1,
1.402498, 2.063, 0.8529587, 1, 1, 1, 1, 1,
1.407026, 0.02541319, 2.966031, 1, 1, 1, 1, 1,
1.410127, 1.619713, 0.5497792, 1, 1, 1, 1, 1,
1.415983, 0.3648177, 1.168003, 1, 1, 1, 1, 1,
1.417553, 0.1593079, 0.3903355, 1, 1, 1, 1, 1,
1.417788, -0.3473033, 4.50114, 1, 1, 1, 1, 1,
1.418355, 0.2258326, 2.769879, 1, 1, 1, 1, 1,
1.420323, -0.2816528, 1.776914, 1, 1, 1, 1, 1,
1.423554, -1.304442, 0.9529185, 1, 1, 1, 1, 1,
1.43083, 0.1107294, 2.899472, 1, 1, 1, 1, 1,
1.450808, 0.3225968, 1.434665, 1, 1, 1, 1, 1,
1.451225, -0.5592198, 3.289739, 1, 1, 1, 1, 1,
1.452691, 1.191404, 1.018521, 0, 0, 1, 1, 1,
1.470385, 0.106315, 1.84996, 1, 0, 0, 1, 1,
1.475507, -0.8847838, 2.017972, 1, 0, 0, 1, 1,
1.475562, 1.500313, 1.312487, 1, 0, 0, 1, 1,
1.479049, -1.09534, 1.60436, 1, 0, 0, 1, 1,
1.488128, -1.026354, 1.136602, 1, 0, 0, 1, 1,
1.492657, -0.9135259, 0.6313399, 0, 0, 0, 1, 1,
1.498392, 1.08007, 0.6082626, 0, 0, 0, 1, 1,
1.498532, 0.09310892, 0.657373, 0, 0, 0, 1, 1,
1.528228, 0.5054048, 2.923886, 0, 0, 0, 1, 1,
1.532241, -0.1506848, 0.8739421, 0, 0, 0, 1, 1,
1.548386, -1.199526, 2.043491, 0, 0, 0, 1, 1,
1.552186, 2.517714, 0.3897048, 0, 0, 0, 1, 1,
1.55865, -0.2273682, 0.626828, 1, 1, 1, 1, 1,
1.562491, -2.329428, 1.512305, 1, 1, 1, 1, 1,
1.565813, -0.9299111, 2.344648, 1, 1, 1, 1, 1,
1.598321, -1.554221, 3.185764, 1, 1, 1, 1, 1,
1.606561, 0.7189814, 1.537967, 1, 1, 1, 1, 1,
1.608597, -0.9566001, 2.75377, 1, 1, 1, 1, 1,
1.61996, -0.4757019, 2.283488, 1, 1, 1, 1, 1,
1.624871, 0.8043625, -0.09801758, 1, 1, 1, 1, 1,
1.633838, -1.525167, 0.8902946, 1, 1, 1, 1, 1,
1.636752, -0.5906392, 2.439712, 1, 1, 1, 1, 1,
1.639186, -2.016458, 2.053033, 1, 1, 1, 1, 1,
1.644819, 0.1547442, 1.365636, 1, 1, 1, 1, 1,
1.6551, -0.9772928, 0.7262, 1, 1, 1, 1, 1,
1.659841, 0.1501805, 2.691797, 1, 1, 1, 1, 1,
1.667418, -0.8301718, 2.89577, 1, 1, 1, 1, 1,
1.675843, 0.8230884, 1.436481, 0, 0, 1, 1, 1,
1.705376, 1.02152, 1.120241, 1, 0, 0, 1, 1,
1.711481, 0.4169289, 0.6790401, 1, 0, 0, 1, 1,
1.713279, -0.04487124, 3.261154, 1, 0, 0, 1, 1,
1.717362, -2.227851, 3.169353, 1, 0, 0, 1, 1,
1.717729, 1.170687, 0.1185292, 1, 0, 0, 1, 1,
1.726237, -0.8588558, 2.224247, 0, 0, 0, 1, 1,
1.733663, 0.5194137, 1.319582, 0, 0, 0, 1, 1,
1.740505, 1.571775, 2.450667, 0, 0, 0, 1, 1,
1.741553, -1.281539, 1.636291, 0, 0, 0, 1, 1,
1.753696, 1.379959, 0.9893451, 0, 0, 0, 1, 1,
1.78855, 0.9005241, 0.637461, 0, 0, 0, 1, 1,
1.800591, -1.40022, 3.480948, 0, 0, 0, 1, 1,
1.81074, -1.606213, 3.717639, 1, 1, 1, 1, 1,
1.821692, -0.8783582, 3.705438, 1, 1, 1, 1, 1,
1.828903, -0.1684743, 1.121009, 1, 1, 1, 1, 1,
1.830838, -1.186604, 2.683593, 1, 1, 1, 1, 1,
1.844121, -0.8338066, 1.16428, 1, 1, 1, 1, 1,
1.845509, 0.7797448, 2.524968, 1, 1, 1, 1, 1,
1.912479, -1.151291, 1.314927, 1, 1, 1, 1, 1,
1.913775, -0.1040492, 0.6171508, 1, 1, 1, 1, 1,
1.917886, 0.1277558, 0.3728645, 1, 1, 1, 1, 1,
1.933003, -0.8665946, 0.5823401, 1, 1, 1, 1, 1,
1.944284, 1.129354, 0.3913784, 1, 1, 1, 1, 1,
1.948459, -0.3307036, 0.1950314, 1, 1, 1, 1, 1,
1.961852, 0.4439984, 1.374296, 1, 1, 1, 1, 1,
1.986097, 2.180787, 0.495689, 1, 1, 1, 1, 1,
2.026275, 1.695209, -0.3010092, 1, 1, 1, 1, 1,
2.05284, -1.852348, 2.603793, 0, 0, 1, 1, 1,
2.055232, 2.381416, 1.708678, 1, 0, 0, 1, 1,
2.07364, 0.01035936, 1.906188, 1, 0, 0, 1, 1,
2.085669, 0.4007812, 2.371041, 1, 0, 0, 1, 1,
2.124174, -0.3618049, 0.1133474, 1, 0, 0, 1, 1,
2.181455, -1.053788, 0.7426749, 1, 0, 0, 1, 1,
2.191177, -0.9373909, 3.308499, 0, 0, 0, 1, 1,
2.20283, -1.504407, 2.131203, 0, 0, 0, 1, 1,
2.241738, 0.2112428, 0.1040704, 0, 0, 0, 1, 1,
2.306965, -0.4907792, 3.095322, 0, 0, 0, 1, 1,
2.361417, 0.6622261, 0.1723231, 0, 0, 0, 1, 1,
2.415364, 1.882467, 1.424479, 0, 0, 0, 1, 1,
2.440535, -0.5253659, 1.419526, 0, 0, 0, 1, 1,
2.501744, -0.1835443, -0.5007977, 1, 1, 1, 1, 1,
2.524633, -0.5472229, 2.15311, 1, 1, 1, 1, 1,
2.547123, -0.1475311, 1.515029, 1, 1, 1, 1, 1,
2.666926, -1.028078, 3.168146, 1, 1, 1, 1, 1,
2.717053, 0.8937024, 0.7550462, 1, 1, 1, 1, 1,
2.844402, -0.3470329, 1.455489, 1, 1, 1, 1, 1,
3.449999, -0.04696651, 1.686926, 1, 1, 1, 1, 1
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
var radius = 9.571476;
var distance = 33.6194;
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
mvMatrix.translate( -0.1437721, -0.1137841, -0.03054976 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6194);
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
